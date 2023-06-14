
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
    8000001c:	0a0070ef          	jal	ra,800070bc <start>

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
    80001184:	6ad000ef          	jal	ra,80002030 <interruptRoutine>

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
    size += sizeof(uint64);
    8000131c:	00850513          	addi	a0,a0,8
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
    80001738:	738080e7          	jalr	1848(ra) # 80005e6c <_Z11printStringPKc>
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
    8000175c:	714080e7          	jalr	1812(ra) # 80005e6c <_Z11printStringPKc>
	printString("CONSOLE_STATUS = ");
    80001760:	00009517          	auipc	a0,0x9
    80001764:	8d050513          	addi	a0,a0,-1840 # 8000a030 <CONSOLE_STATUS+0x20>
    80001768:	00004097          	auipc	ra,0x4
    8000176c:	704080e7          	jalr	1796(ra) # 80005e6c <_Z11printStringPKc>
	printInteger((uint64)sr);
    80001770:	0104b503          	ld	a0,16(s1)
    80001774:	00000097          	auipc	ra,0x0
    80001778:	224080e7          	jalr	548(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    8000177c:	00009517          	auipc	a0,0x9
    80001780:	e0450513          	addi	a0,a0,-508 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80001784:	00004097          	auipc	ra,0x4
    80001788:	6e8080e7          	jalr	1768(ra) # 80005e6c <_Z11printStringPKc>
	printString("*CONSOLE_RX = ");
    8000178c:	00009517          	auipc	a0,0x9
    80001790:	8bc50513          	addi	a0,a0,-1860 # 8000a048 <CONSOLE_STATUS+0x38>
    80001794:	00004097          	auipc	ra,0x4
    80001798:	6d8080e7          	jalr	1752(ra) # 80005e6c <_Z11printStringPKc>
	printInteger(*dr);
    8000179c:	0084b783          	ld	a5,8(s1)
    800017a0:	0007c503          	lbu	a0,0(a5)
    800017a4:	00000097          	auipc	ra,0x0
    800017a8:	1f4080e7          	jalr	500(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    800017ac:	00009517          	auipc	a0,0x9
    800017b0:	dd450513          	addi	a0,a0,-556 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800017b4:	00004097          	auipc	ra,0x4
    800017b8:	6b8080e7          	jalr	1720(ra) # 80005e6c <_Z11printStringPKc>
	printString("*CONSOLE_STATUS = ");
    800017bc:	00009517          	auipc	a0,0x9
    800017c0:	89c50513          	addi	a0,a0,-1892 # 8000a058 <CONSOLE_STATUS+0x48>
    800017c4:	00004097          	auipc	ra,0x4
    800017c8:	6a8080e7          	jalr	1704(ra) # 80005e6c <_Z11printStringPKc>
	printInteger(*sr);
    800017cc:	0104b783          	ld	a5,16(s1)
    800017d0:	0007c503          	lbu	a0,0(a5)
    800017d4:	00000097          	auipc	ra,0x0
    800017d8:	1c4080e7          	jalr	452(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    800017dc:	00009517          	auipc	a0,0x9
    800017e0:	da450513          	addi	a0,a0,-604 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800017e4:	00004097          	auipc	ra,0x4
    800017e8:	688080e7          	jalr	1672(ra) # 80005e6c <_Z11printStringPKc>
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
    80001c18:	14050063          	beqz	a0,80001d58 <_ZN7KMemory7kmallocEm+0x14c>
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
    static uint64 usableBlocks;
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
    80001cd8:	08a71463          	bne	a4,a0,80001d60 <_ZN7KMemory7kmallocEm+0x154>

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

    return (char*)addr + sizeof(uint64);
    80001d48:	00858513          	addi	a0,a1,8
}
    80001d4c:	00813403          	ld	s0,8(sp)
    80001d50:	01010113          	addi	sp,sp,16
    80001d54:	00008067          	ret
    if (size <= 0) return nullptr;
    80001d58:	00000513          	li	a0,0
    80001d5c:	ff1ff06f          	j	80001d4c <_ZN7KMemory7kmallocEm+0x140>
    if (zerosFound != size) return nullptr;
    80001d60:	00000513          	li	a0,0
    80001d64:	fe9ff06f          	j	80001d4c <_ZN7KMemory7kmallocEm+0x140>

0000000080001d68 <_ZN7KMemory16initializeMemoryEv>:
    if (initialized) return;
    80001d68:	0000b797          	auipc	a5,0xb
    80001d6c:	f007c783          	lbu	a5,-256(a5) # 8000cc68 <_ZN7KMemory11initializedE>
    80001d70:	0c079063          	bnez	a5,80001e30 <_ZN7KMemory16initializeMemoryEv+0xc8>
void KMemory::initializeMemory() {
    80001d74:	fe010113          	addi	sp,sp,-32
    80001d78:	00113c23          	sd	ra,24(sp)
    80001d7c:	00813823          	sd	s0,16(sp)
    80001d80:	00913423          	sd	s1,8(sp)
    80001d84:	02010413          	addi	s0,sp,32
    uint64 sizeInBytes = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR;
    80001d88:	0000b797          	auipc	a5,0xb
    80001d8c:	d907b783          	ld	a5,-624(a5) # 8000cb18 <_GLOBAL_OFFSET_TABLE_+0x60>
    80001d90:	0007b783          	ld	a5,0(a5)
    80001d94:	0000b717          	auipc	a4,0xb
    80001d98:	d4c73703          	ld	a4,-692(a4) # 8000cae0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001d9c:	00073683          	ld	a3,0(a4)
    80001da0:	40d787b3          	sub	a5,a5,a3
            numOfBlocks / (sizeof(uint64) * 8);    //broj uint64 potrebnih da se smesti ceo bit vektor
    80001da4:	00c7d793          	srli	a5,a5,0xc
    sizeOfBitVectorInUint64 =
    80001da8:	0000b717          	auipc	a4,0xb
    80001dac:	eb070713          	addi	a4,a4,-336 # 8000cc58 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80001db0:	00f73023          	sd	a5,0(a4)
    numOfBlocks = sizeOfBitVectorInUint64 * sizeof(uint64) * 8; //da se zaokruzi broj postojecih blokova na umnozak 64
    80001db4:	00679613          	slli	a2,a5,0x6
    80001db8:	00c73c23          	sd	a2,24(a4)
    blocksForBitVector = (sizeOfBitVectorInUint64 * sizeof(uint64) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    80001dbc:	00878793          	addi	a5,a5,8
    80001dc0:	00379793          	slli	a5,a5,0x3
    80001dc4:	fff78793          	addi	a5,a5,-1
    80001dc8:	0067d793          	srli	a5,a5,0x6
    80001dcc:	02f73023          	sd	a5,32(a4)
    bitVector = (uint64*)HEAP_START_ADDR;
    80001dd0:	00d73423          	sd	a3,8(a4)
    for (uint64 i = 0; i < sizeOfBitVectorInUint64; i++) {
    80001dd4:	00000793          	li	a5,0
    80001dd8:	0000b717          	auipc	a4,0xb
    80001ddc:	e8073703          	ld	a4,-384(a4) # 8000cc58 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80001de0:	02e7f063          	bgeu	a5,a4,80001e00 <_ZN7KMemory16initializeMemoryEv+0x98>
        bitVector[i] = 0;   //ni jedan blok nije zauzet, svi bitovi su 0
    80001de4:	00379693          	slli	a3,a5,0x3
    80001de8:	0000b717          	auipc	a4,0xb
    80001dec:	e7873703          	ld	a4,-392(a4) # 8000cc60 <_ZN7KMemory9bitVectorE>
    80001df0:	00d70733          	add	a4,a4,a3
    80001df4:	00073023          	sd	zero,0(a4)
    for (uint64 i = 0; i < sizeOfBitVectorInUint64; i++) {
    80001df8:	00178793          	addi	a5,a5,1
    80001dfc:	fddff06f          	j	80001dd8 <_ZN7KMemory16initializeMemoryEv+0x70>
    kmalloc(blocksForBitVector);
    80001e00:	0000b497          	auipc	s1,0xb
    80001e04:	e5848493          	addi	s1,s1,-424 # 8000cc58 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80001e08:	0204b503          	ld	a0,32(s1)
    80001e0c:	00000097          	auipc	ra,0x0
    80001e10:	e00080e7          	jalr	-512(ra) # 80001c0c <_ZN7KMemory7kmallocEm>
    initialized = true;
    80001e14:	00100793          	li	a5,1
    80001e18:	00f48823          	sb	a5,16(s1)
}
    80001e1c:	01813083          	ld	ra,24(sp)
    80001e20:	01013403          	ld	s0,16(sp)
    80001e24:	00813483          	ld	s1,8(sp)
    80001e28:	02010113          	addi	sp,sp,32
    80001e2c:	00008067          	ret
    80001e30:	00008067          	ret

0000000080001e34 <_ZN7KMemory5kfreeEPv>:

int KMemory::kfree(void* ptr) {
    80001e34:	ff010113          	addi	sp,sp,-16
    80001e38:	00813423          	sd	s0,8(sp)
    80001e3c:	01010413          	addi	s0,sp,16
    ptr = (char*)ptr - sizeof(uint64);
    80001e40:	ff850793          	addi	a5,a0,-8
    uint64 blocksToFree = *(uint64*)ptr;
    80001e44:	ff853583          	ld	a1,-8(a0)
    uint64 blockNum = ((char*)ptr - (char*)HEAP_START_ADDR) / MEM_BLOCK_SIZE;
    80001e48:	0000b717          	auipc	a4,0xb
    80001e4c:	c9873703          	ld	a4,-872(a4) # 8000cae0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001e50:	00073503          	ld	a0,0(a4)
    80001e54:	40a78533          	sub	a0,a5,a0
    if (((char*)ptr - (char*)HEAP_START_ADDR) % MEM_BLOCK_SIZE > 0) return -1;
    80001e58:	03f57793          	andi	a5,a0,63
    80001e5c:	06079063          	bnez	a5,80001ebc <_ZN7KMemory5kfreeEPv+0x88>
    80001e60:	00655613          	srli	a2,a0,0x6
    uint64 currentElem = blockNum / 64;
    80001e64:	00c55513          	srli	a0,a0,0xc
    uint64 currentBit = 63 - blockNum % 64;
    80001e68:	fff64613          	not	a2,a2
    80001e6c:	03f67613          	andi	a2,a2,63
    80001e70:	0080006f          	j	80001e78 <_ZN7KMemory5kfreeEPv+0x44>
    while (blocksToFree > 0) {
        bitVector[currentElem] &= ~maskBit(currentBit);
        blocksToFree--;
        if (currentBit-- == 0) {
            currentBit = 63;
    80001e74:	00078613          	mv	a2,a5
    while (blocksToFree > 0) {
    80001e78:	04058663          	beqz	a1,80001ec4 <_ZN7KMemory5kfreeEPv+0x90>
    80001e7c:	00100793          	li	a5,1
    80001e80:	00c797b3          	sll	a5,a5,a2
        bitVector[currentElem] &= ~maskBit(currentBit);
    80001e84:	fff7c793          	not	a5,a5
    80001e88:	00351713          	slli	a4,a0,0x3
    80001e8c:	0000b697          	auipc	a3,0xb
    80001e90:	dd46b683          	ld	a3,-556(a3) # 8000cc60 <_ZN7KMemory9bitVectorE>
    80001e94:	00e68733          	add	a4,a3,a4
    80001e98:	00073683          	ld	a3,0(a4)
    80001e9c:	00f6f7b3          	and	a5,a3,a5
    80001ea0:	00f73023          	sd	a5,0(a4)
        blocksToFree--;
    80001ea4:	fff58593          	addi	a1,a1,-1
        if (currentBit-- == 0) {
    80001ea8:	fff60793          	addi	a5,a2,-1
    80001eac:	fc0614e3          	bnez	a2,80001e74 <_ZN7KMemory5kfreeEPv+0x40>
            currentElem++;
    80001eb0:	00150513          	addi	a0,a0,1
            currentBit = 63;
    80001eb4:	03f00793          	li	a5,63
    80001eb8:	fbdff06f          	j	80001e74 <_ZN7KMemory5kfreeEPv+0x40>
    if (((char*)ptr - (char*)HEAP_START_ADDR) % MEM_BLOCK_SIZE > 0) return -1;
    80001ebc:	fff00513          	li	a0,-1
    80001ec0:	0080006f          	j	80001ec8 <_ZN7KMemory5kfreeEPv+0x94>
        }
    }
    return 0;
    80001ec4:	00000513          	li	a0,0
}
    80001ec8:	00813403          	ld	s0,8(sp)
    80001ecc:	01010113          	addi	sp,sp,16
    80001ed0:	00008067          	ret

0000000080001ed4 <_Z4idlePv>:

extern "C" void interruptHandler();

void userMain();

void idle(void*) {
    80001ed4:	ff010113          	addi	sp,sp,-16
    80001ed8:	00113423          	sd	ra,8(sp)
    80001edc:	00813023          	sd	s0,0(sp)
    80001ee0:	01010413          	addi	s0,sp,16
    while (1) { thread_dispatch(); }
    80001ee4:	fffff097          	auipc	ra,0xfffff
    80001ee8:	544080e7          	jalr	1348(ra) # 80001428 <_Z15thread_dispatchv>
    80001eec:	ff9ff06f          	j	80001ee4 <_Z4idlePv+0x10>

0000000080001ef0 <_Z22kernelConsumerFunctionPv>:
}

void kernelConsumerFunction(void*) {
    80001ef0:	ff010113          	addi	sp,sp,-16
    80001ef4:	00113423          	sd	ra,8(sp)
    80001ef8:	00813023          	sd	s0,0(sp)
    80001efc:	01010413          	addi	s0,sp,16
    80001f00:	0280006f          	j	80001f28 <_Z22kernelConsumerFunctionPv+0x38>
    while (1) {
        char c = KConsole::getFromOutput();
        while (!(*KConsole::sr & CONSOLE_TX_STATUS_BIT)) {}
        *KConsole::dr = c;
    80001f04:	0000b797          	auipc	a5,0xb
    80001f08:	bfc7b783          	ld	a5,-1028(a5) # 8000cb00 <_GLOBAL_OFFSET_TABLE_+0x48>
    80001f0c:	0007b783          	ld	a5,0(a5)
    80001f10:	00a78023          	sb	a0,0(a5)
        sem_signal(KConsole::outputBufferHasSpace);
    80001f14:	0000b797          	auipc	a5,0xb
    80001f18:	bf47b783          	ld	a5,-1036(a5) # 8000cb08 <_GLOBAL_OFFSET_TABLE_+0x50>
    80001f1c:	0007b503          	ld	a0,0(a5)
    80001f20:	fffff097          	auipc	ra,0xfffff
    80001f24:	618080e7          	jalr	1560(ra) # 80001538 <_Z10sem_signalP4KSem>
        char c = KConsole::getFromOutput();
    80001f28:	00000097          	auipc	ra,0x0
    80001f2c:	8d8080e7          	jalr	-1832(ra) # 80001800 <_ZN8KConsole13getFromOutputEv>
        while (!(*KConsole::sr & CONSOLE_TX_STATUS_BIT)) {}
    80001f30:	0000b797          	auipc	a5,0xb
    80001f34:	c087b783          	ld	a5,-1016(a5) # 8000cb38 <_GLOBAL_OFFSET_TABLE_+0x80>
    80001f38:	0007b783          	ld	a5,0(a5)
    80001f3c:	0007c783          	lbu	a5,0(a5)
    80001f40:	0207f793          	andi	a5,a5,32
    80001f44:	fe0786e3          	beqz	a5,80001f30 <_Z22kernelConsumerFunctionPv+0x40>
    80001f48:	fbdff06f          	j	80001f04 <_Z22kernelConsumerFunctionPv+0x14>

0000000080001f4c <main>:
    }

}

int main() {
    80001f4c:	fd010113          	addi	sp,sp,-48
    80001f50:	02113423          	sd	ra,40(sp)
    80001f54:	02813023          	sd	s0,32(sp)
    80001f58:	03010413          	addi	s0,sp,48
    //postavi adresu prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80001f5c:	0000b797          	auipc	a5,0xb
    80001f60:	bc47b783          	ld	a5,-1084(a5) # 8000cb20 <_GLOBAL_OFFSET_TABLE_+0x68>
    80001f64:	10579073          	csrw	stvec,a5

    KMemory::initializeMemory();
    80001f68:	00000097          	auipc	ra,0x0
    80001f6c:	e00080e7          	jalr	-512(ra) # 80001d68 <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija alokatora memorije
    //MemoryAllocator::initMemoryAllocator();

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    80001f70:	fffff097          	auipc	ra,0xfffff
    80001f74:	6f0080e7          	jalr	1776(ra) # 80001660 <_ZN8KConsole12initKConsoleEv>
    //pravljenje niti
    thread_t mainHandle;
    thread_t userHandle;
    thread_t idleHandle;
    thread_t consoleOutputHandle;
    thread_create(&mainHandle, nullptr, nullptr);
    80001f78:	00000613          	li	a2,0
    80001f7c:	00000593          	li	a1,0
    80001f80:	fe840513          	addi	a0,s0,-24
    80001f84:	fffff097          	auipc	ra,0xfffff
    80001f88:	3fc080e7          	jalr	1020(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::running = mainHandle;
    80001f8c:	0000b797          	auipc	a5,0xb
    80001f90:	b847b783          	ld	a5,-1148(a5) # 8000cb10 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001f94:	fe843703          	ld	a4,-24(s0)
    80001f98:	00e7b023          	sd	a4,0(a5)
    thread_create(&userHandle, (TCB::Body) userMain, nullptr);
    80001f9c:	00000613          	li	a2,0
    80001fa0:	0000b597          	auipc	a1,0xb
    80001fa4:	b205b583          	ld	a1,-1248(a1) # 8000cac0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001fa8:	fe040513          	addi	a0,s0,-32
    80001fac:	fffff097          	auipc	ra,0xfffff
    80001fb0:	3d4080e7          	jalr	980(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&consoleOutputHandle, kernelConsumerFunction, nullptr);
    80001fb4:	00000613          	li	a2,0
    80001fb8:	00000597          	auipc	a1,0x0
    80001fbc:	f3858593          	addi	a1,a1,-200 # 80001ef0 <_Z22kernelConsumerFunctionPv>
    80001fc0:	fd040513          	addi	a0,s0,-48
    80001fc4:	fffff097          	auipc	ra,0xfffff
    80001fc8:	3bc080e7          	jalr	956(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&idleHandle, idle, nullptr);
    80001fcc:	00000613          	li	a2,0
    80001fd0:	00000597          	auipc	a1,0x0
    80001fd4:	f0458593          	addi	a1,a1,-252 # 80001ed4 <_Z4idlePv>
    80001fd8:	fd840513          	addi	a0,s0,-40
    80001fdc:	fffff097          	auipc	ra,0xfffff
    80001fe0:	3a4080e7          	jalr	932(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
inline void Riscv::w_sip(uint64 sip) {
	__asm__ volatile("csrw sip, %[sip]": :[sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80001fe4:	00200793          	li	a5,2
    80001fe8:	1007a073          	csrs	sstatus,a5

    //omogucavanje prekida
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    //cekanje da se userMain zavrsi
    thread_join(userHandle);
    80001fec:	fe043503          	ld	a0,-32(s0)
    80001ff0:	fffff097          	auipc	ra,0xfffff
    80001ff4:	458080e7          	jalr	1112(ra) # 80001448 <_Z11thread_joinP3TCB>

    //printString("\nSad cu da izadjem\n");

    //flush output bafera za konzolu
    while (KConsole::outputHead != KConsole::outputTail) {}
    80001ff8:	0000b797          	auipc	a5,0xb
    80001ffc:	af87b783          	ld	a5,-1288(a5) # 8000caf0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80002000:	0007a703          	lw	a4,0(a5)
    80002004:	0000b797          	auipc	a5,0xb
    80002008:	b2c7b783          	ld	a5,-1236(a5) # 8000cb30 <_GLOBAL_OFFSET_TABLE_+0x78>
    8000200c:	0007a783          	lw	a5,0(a5)
    80002010:	fef714e3          	bne	a4,a5,80001ff8 <main+0xac>
}

inline void Riscv::mc_sstatus(uint64 mask) {
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002014:	00200793          	li	a5,2
    80002018:	1007b073          	csrc	sstatus,a5
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    return 0;


    8000201c:	00000513          	li	a0,0
    80002020:	02813083          	ld	ra,40(sp)
    80002024:	02013403          	ld	s0,32(sp)
    80002028:	03010113          	addi	sp,sp,48
    8000202c:	00008067          	ret

0000000080002030 <interruptRoutine>:
#include "../test/printing.hpp"

//void printInteger(int i);

#pragma GCC optimize("O0")
extern "C" void interruptRoutine() {
    80002030:	f8010113          	addi	sp,sp,-128
    80002034:	06113c23          	sd	ra,120(sp)
    80002038:	06813823          	sd	s0,112(sp)
    8000203c:	06913423          	sd	s1,104(sp)
    80002040:	08010413          	addi	s0,sp,128
    //bitni sistemski registri
    uint64 scause, sepc, sstatus;
    __asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002044:	14202373          	csrr	t1,scause
    80002048:	fc643c23          	sd	t1,-40(s0)
    __asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000204c:	14102373          	csrr	t1,sepc
    80002050:	fc643823          	sd	t1,-48(s0)
    __asm__ volatile("csrr %[stat], sstatus":[stat] "=r"(sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002054:	10002373          	csrr	t1,sstatus
    80002058:	fc643423          	sd	t1,-56(s0)

    //argumenti preneti sistemskom pozivu
    uint64 a0, a1, a2, a3, a4, a5, a6, a7;
    __asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000205c:	00050313          	mv	t1,a0
    80002060:	fc643023          	sd	t1,-64(s0)
    __asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002064:	00058313          	mv	t1,a1
    80002068:	fa643c23          	sd	t1,-72(s0)
    __asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000206c:	00060313          	mv	t1,a2
    80002070:	fa643823          	sd	t1,-80(s0)
    __asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002074:	00068313          	mv	t1,a3
    80002078:	fa643423          	sd	t1,-88(s0)
    __asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000207c:	00070313          	mv	t1,a4
    80002080:	fa643023          	sd	t1,-96(s0)
    __asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002084:	00078313          	mv	t1,a5
    80002088:	f8643c23          	sd	t1,-104(s0)
    __asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000208c:	00080313          	mv	t1,a6
    80002090:	f8643823          	sd	t1,-112(s0)
    __asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002094:	00088313          	mv	t1,a7
    80002098:	f8643423          	sd	t1,-120(s0)

    if (scause == 0x9 || scause == 0x8) {
    8000209c:	fd843703          	ld	a4,-40(s0)
    800020a0:	00900793          	li	a5,9
    800020a4:	00f70863          	beq	a4,a5,800020b4 <interruptRoutine+0x84>
    800020a8:	fd843703          	ld	a4,-40(s0)
    800020ac:	00800793          	li	a5,8
    800020b0:	34f71c63          	bne	a4,a5,80002408 <interruptRoutine+0x3d8>
        //prekid zbog poziva ecall
        switch (a0) {
    800020b4:	fc043703          	ld	a4,-64(s0)
    800020b8:	09100793          	li	a5,145
    800020bc:	2cf70063          	beq	a4,a5,8000237c <interruptRoutine+0x34c>
    800020c0:	fc043703          	ld	a4,-64(s0)
    800020c4:	09100793          	li	a5,145
    800020c8:	2ce7e263          	bltu	a5,a4,8000238c <interruptRoutine+0x35c>
    800020cc:	fc043703          	ld	a4,-64(s0)
    800020d0:	08100793          	li	a5,129
    800020d4:	28f70a63          	beq	a4,a5,80002368 <interruptRoutine+0x338>
    800020d8:	fc043703          	ld	a4,-64(s0)
    800020dc:	08100793          	li	a5,129
    800020e0:	2ae7e663          	bltu	a5,a4,8000238c <interruptRoutine+0x35c>
    800020e4:	fc043703          	ld	a4,-64(s0)
    800020e8:	04200793          	li	a5,66
    800020ec:	04e7e263          	bltu	a5,a4,80002130 <interruptRoutine+0x100>
    800020f0:	fc043783          	ld	a5,-64(s0)
    800020f4:	28078c63          	beqz	a5,8000238c <interruptRoutine+0x35c>
    800020f8:	fc043703          	ld	a4,-64(s0)
    800020fc:	04200793          	li	a5,66
    80002100:	28e7e663          	bltu	a5,a4,8000238c <interruptRoutine+0x35c>
    80002104:	fc043783          	ld	a5,-64(s0)
    80002108:	00279713          	slli	a4,a5,0x2
    8000210c:	00008797          	auipc	a5,0x8
    80002110:	fe878793          	addi	a5,a5,-24 # 8000a0f4 <_ZZ9kPrintIntmE6digits+0x84>
    80002114:	00f707b3          	add	a5,a4,a5
    80002118:	0007a783          	lw	a5,0(a5)
    8000211c:	0007871b          	sext.w	a4,a5
    80002120:	00008797          	auipc	a5,0x8
    80002124:	fd478793          	addi	a5,a5,-44 # 8000a0f4 <_ZZ9kPrintIntmE6digits+0x84>
    80002128:	00f707b3          	add	a5,a4,a5
    8000212c:	00078067          	jr	a5
    80002130:	fc043703          	ld	a4,-64(s0)
    80002134:	08000793          	li	a5,128
    80002138:	1ef70263          	beq	a4,a5,8000231c <interruptRoutine+0x2ec>
    8000213c:	2500006f          	j	8000238c <interruptRoutine+0x35c>
            case 0x01:
                //mem_alloc
                //a1 = broj blokova koje treba alocirati
                //MemoryAllocator::kmalloc((size_t)a1 * MEM_BLOCK_SIZE);
                KMemory::kmalloc((size_t)a1);
    80002140:	fb843503          	ld	a0,-72(s0)
    80002144:	00000097          	auipc	ra,0x0
    80002148:	ac8080e7          	jalr	-1336(ra) # 80001c0c <_ZN7KMemory7kmallocEm>
                __asm__ volatile("sd a0, 80(s0)");
    8000214c:	04a43823          	sd	a0,80(s0)
                break;
    80002150:	2980006f          	j	800023e8 <interruptRoutine+0x3b8>
            case 0x02:
                //mem_free
                //a1 = pokazivac na memoriju koju dealociramo, dobijen sa mem_alloc
                //MemoryAllocator::kfree((void*)a1);
                KMemory::kfree((void*)a1);
    80002154:	fb843783          	ld	a5,-72(s0)
    80002158:	00078513          	mv	a0,a5
    8000215c:	00000097          	auipc	ra,0x0
    80002160:	cd8080e7          	jalr	-808(ra) # 80001e34 <_ZN7KMemory5kfreeEPv>
                __asm__ volatile("sd a0, 80(s0)");
    80002164:	04a43823          	sd	a0,80(s0)
                break;
    80002168:	2800006f          	j	800023e8 <interruptRoutine+0x3b8>
                //thread_create
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    8000216c:	fb043783          	ld	a5,-80(s0)
    80002170:	fa843703          	ld	a4,-88(s0)
    80002174:	fa043683          	ld	a3,-96(s0)
    80002178:	fb843483          	ld	s1,-72(s0)
    8000217c:	00068613          	mv	a2,a3
    80002180:	00070593          	mv	a1,a4
    80002184:	00078513          	mv	a0,a5
    80002188:	00001097          	auipc	ra,0x1
    8000218c:	c34080e7          	jalr	-972(ra) # 80002dbc <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80002190:	00050793          	mv	a5,a0
    80002194:	00f4b023          	sd	a5,0(s1)
                TCB::start(*((thread_t*)a1));
    80002198:	fb843783          	ld	a5,-72(s0)
    8000219c:	0007b783          	ld	a5,0(a5)
    800021a0:	00078513          	mv	a0,a5
    800021a4:	00001097          	auipc	ra,0x1
    800021a8:	d98080e7          	jalr	-616(ra) # 80002f3c <_ZN3TCB5startEPS_>
                if (*((thread_t*)a1) != nullptr) {
    800021ac:	fb843783          	ld	a5,-72(s0)
    800021b0:	0007b783          	ld	a5,0(a5)
    800021b4:	00078663          	beqz	a5,800021c0 <interruptRoutine+0x190>
                    __asm__ volatile("li a0, 0");
    800021b8:	00000513          	li	a0,0
    800021bc:	0080006f          	j	800021c4 <interruptRoutine+0x194>
                } else {
                    __asm__ volatile("li a0, -1");
    800021c0:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    800021c4:	04a43823          	sd	a0,80(s0)
                break;
    800021c8:	2200006f          	j	800023e8 <interruptRoutine+0x3b8>
            case 0x12:
                //thread_exit
                //TCB::running->setFinished(true);
                TCB::running->setStatus(TCB::FINISHED);
    800021cc:	0000b797          	auipc	a5,0xb
    800021d0:	9447b783          	ld	a5,-1724(a5) # 8000cb10 <_GLOBAL_OFFSET_TABLE_+0x58>
    800021d4:	0007b783          	ld	a5,0(a5)
    800021d8:	00500593          	li	a1,5
    800021dc:	00078513          	mv	a0,a5
    800021e0:	00000097          	auipc	ra,0x0
    800021e4:	3e8080e7          	jalr	1000(ra) # 800025c8 <_ZN3TCB9setStatusENS_12ThreadStatusE>
                TCB::releaseJoined();
    800021e8:	00001097          	auipc	ra,0x1
    800021ec:	cf4080e7          	jalr	-780(ra) # 80002edc <_ZN3TCB13releaseJoinedEv>
                TCB::yield();
    800021f0:	00001097          	auipc	ra,0x1
    800021f4:	b6c080e7          	jalr	-1172(ra) # 80002d5c <_ZN3TCB5yieldEv>
                break;
    800021f8:	1f00006f          	j	800023e8 <interruptRoutine+0x3b8>
            case 0x13:
                //thread_dispatch
                TCB::yield();
    800021fc:	00001097          	auipc	ra,0x1
    80002200:	b60080e7          	jalr	-1184(ra) # 80002d5c <_ZN3TCB5yieldEv>
                break;
    80002204:	1e40006f          	j	800023e8 <interruptRoutine+0x3b8>
            case 0x14:
                //thread_join
                //a1 = rucka niti na koju tekuca nit treba da ceka
                TCB::threadJoin((thread_t)a1);
    80002208:	fb843783          	ld	a5,-72(s0)
    8000220c:	00078513          	mv	a0,a5
    80002210:	00001097          	auipc	ra,0x1
    80002214:	c80080e7          	jalr	-896(ra) # 80002e90 <_ZN3TCB10threadJoinEPS_>
                TCB::yield();
    80002218:	00001097          	auipc	ra,0x1
    8000221c:	b44080e7          	jalr	-1212(ra) # 80002d5c <_ZN3TCB5yieldEv>
                break;
    80002220:	1c80006f          	j	800023e8 <interruptRoutine+0x3b8>
            case 0x21:
                //sem_open
                //a1 = pokazivac na rucku semafora, u koju se upisuje adresa semafora u memoriji
                *((sem_t*)a1) = KSem::initSem((uint)a2);
    80002224:	fb043783          	ld	a5,-80(s0)
    80002228:	0007879b          	sext.w	a5,a5
    8000222c:	fb843483          	ld	s1,-72(s0)
    80002230:	00078513          	mv	a0,a5
    80002234:	00001097          	auipc	ra,0x1
    80002238:	360080e7          	jalr	864(ra) # 80003594 <_ZN4KSem7initSemEj>
    8000223c:	00050793          	mv	a5,a0
    80002240:	00f4b023          	sd	a5,0(s1)
                if (*((sem_t*)a1) != nullptr) {
    80002244:	fb843783          	ld	a5,-72(s0)
    80002248:	0007b783          	ld	a5,0(a5)
    8000224c:	00078663          	beqz	a5,80002258 <interruptRoutine+0x228>
                    __asm__ volatile("li a0, 0");
    80002250:	00000513          	li	a0,0
    80002254:	0080006f          	j	8000225c <interruptRoutine+0x22c>
                } else {
                    __asm__ volatile("li a0, -1");
    80002258:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    8000225c:	04a43823          	sd	a0,80(s0)
                break;
    80002260:	1880006f          	j	800023e8 <interruptRoutine+0x3b8>
            case 0x22:
                //sem_close
                //a1 = rucka semafora
                KSem::closeSem((sem_t)a1);
    80002264:	fb843783          	ld	a5,-72(s0)
    80002268:	00078513          	mv	a0,a5
    8000226c:	00001097          	auipc	ra,0x1
    80002270:	4a4080e7          	jalr	1188(ra) # 80003710 <_ZN4KSem8closeSemEPS_>
                __asm__ volatile("sd a0, 80(s0)");
    80002274:	04a43823          	sd	a0,80(s0)
                break;
    80002278:	1700006f          	j	800023e8 <interruptRoutine+0x3b8>
            case 0x23:
                //sem_wait
                //a1 = rucka semafora
                ((sem_t)a1)->wait();
    8000227c:	fb843783          	ld	a5,-72(s0)
    80002280:	00078513          	mv	a0,a5
    80002284:	00001097          	auipc	ra,0x1
    80002288:	3a4080e7          	jalr	932(ra) # 80003628 <_ZN4KSem4waitEv>
                __asm__ volatile("sd a0, 80(s0)");
    8000228c:	04a43823          	sd	a0,80(s0)
                break;
    80002290:	1580006f          	j	800023e8 <interruptRoutine+0x3b8>
            case 0x24:
                //sem_signal
                //a1 = rucka semafora
                ((sem_t)a1)->signal();
    80002294:	fb843783          	ld	a5,-72(s0)
    80002298:	00078513          	mv	a0,a5
    8000229c:	00001097          	auipc	ra,0x1
    800022a0:	420080e7          	jalr	1056(ra) # 800036bc <_ZN4KSem6signalEv>
                __asm__ volatile("sd a0, 80(s0)");
    800022a4:	04a43823          	sd	a0,80(s0)
                break;
    800022a8:	1400006f          	j	800023e8 <interruptRoutine+0x3b8>
            case 0x31:
                //time_sleep
                //a1 = broj perioda tajmera na koji se uspavljuje tekuca nit
                if ((time_t)a1 > 0) {
    800022ac:	fb843783          	ld	a5,-72(s0)
    800022b0:	00078663          	beqz	a5,800022bc <interruptRoutine+0x28c>
                    __asm__ volatile("li a0, 0");
    800022b4:	00000513          	li	a0,0
    800022b8:	0080006f          	j	800022c0 <interruptRoutine+0x290>
                } else {
                    __asm__ volatile("li a0, -1");
    800022bc:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    800022c0:	04a43823          	sd	a0,80(s0)
                if ((time_t)a1 > 0) {
    800022c4:	fb843783          	ld	a5,-72(s0)
    800022c8:	10078e63          	beqz	a5,800023e4 <interruptRoutine+0x3b4>
                    Scheduler::putToSleep(TCB::running, (time_t)a1);
    800022cc:	0000b797          	auipc	a5,0xb
    800022d0:	8447b783          	ld	a5,-1980(a5) # 8000cb10 <_GLOBAL_OFFSET_TABLE_+0x58>
    800022d4:	0007b783          	ld	a5,0(a5)
    800022d8:	fb843583          	ld	a1,-72(s0)
    800022dc:	00078513          	mv	a0,a5
    800022e0:	fffff097          	auipc	ra,0xfffff
    800022e4:	7f4080e7          	jalr	2036(ra) # 80001ad4 <_ZN9Scheduler10putToSleepEP3TCBm>
                    TCB::yield();
    800022e8:	00001097          	auipc	ra,0x1
    800022ec:	a74080e7          	jalr	-1420(ra) # 80002d5c <_ZN3TCB5yieldEv>
                }
                break;
    800022f0:	0f40006f          	j	800023e4 <interruptRoutine+0x3b4>
            case 0x41:
                //getc
                KConsole::kgetc();
    800022f4:	fffff097          	auipc	ra,0xfffff
    800022f8:	640080e7          	jalr	1600(ra) # 80001934 <_ZN8KConsole5kgetcEv>
                __asm__ volatile("sd a0, 80(s0)");
    800022fc:	04a43823          	sd	a0,80(s0)
                break;
    80002300:	0e80006f          	j	800023e8 <interruptRoutine+0x3b8>
            case 0x42:
                //putc
                //a1 = karakter koji se upisuje u bafer za ispis na konzolu
                KConsole::kputc((char)a1);
    80002304:	fb843783          	ld	a5,-72(s0)
    80002308:	0ff7f793          	andi	a5,a5,255
    8000230c:	00078513          	mv	a0,a5
    80002310:	fffff097          	auipc	ra,0xfffff
    80002314:	5b4080e7          	jalr	1460(ra) # 800018c4 <_ZN8KConsole5kputcEc>
                break;
    80002318:	0d00006f          	j	800023e8 <interruptRoutine+0x3b8>
                //alloc thread
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    8000231c:	fb043783          	ld	a5,-80(s0)
    80002320:	fa843703          	ld	a4,-88(s0)
    80002324:	fa043683          	ld	a3,-96(s0)
    80002328:	fb843483          	ld	s1,-72(s0)
    8000232c:	00068613          	mv	a2,a3
    80002330:	00070593          	mv	a1,a4
    80002334:	00078513          	mv	a0,a5
    80002338:	00001097          	auipc	ra,0x1
    8000233c:	a84080e7          	jalr	-1404(ra) # 80002dbc <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80002340:	00050793          	mv	a5,a0
    80002344:	00f4b023          	sd	a5,0(s1)
                if (*((thread_t*)a1) != nullptr) {
    80002348:	fb843783          	ld	a5,-72(s0)
    8000234c:	0007b783          	ld	a5,0(a5)
    80002350:	00078663          	beqz	a5,8000235c <interruptRoutine+0x32c>
                    __asm__ volatile("li a0, 0");
    80002354:	00000513          	li	a0,0
    80002358:	0080006f          	j	80002360 <interruptRoutine+0x330>
                } else {
                    __asm__ volatile("li a0, -1");
    8000235c:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80002360:	04a43823          	sd	a0,80(s0)
                break;
    80002364:	0840006f          	j	800023e8 <interruptRoutine+0x3b8>
            case 0x81:
                //start thread
                //a1 = rucka niti koja se stavlja u scheduler
                Scheduler::put((thread_t)a1);
    80002368:	fb843783          	ld	a5,-72(s0)
    8000236c:	00078513          	mv	a0,a5
    80002370:	fffff097          	auipc	ra,0xfffff
    80002374:	6e0080e7          	jalr	1760(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
                break;
    80002378:	0700006f          	j	800023e8 <interruptRoutine+0x3b8>
            case 0x91:
                //printInteger
                //a1 = integer za ispis
                kPrintInt(a1);
    8000237c:	fb843503          	ld	a0,-72(s0)
    80002380:	fffff097          	auipc	ra,0xfffff
    80002384:	640080e7          	jalr	1600(ra) # 800019c0 <_Z9kPrintIntm>
                break;
    80002388:	0600006f          	j	800023e8 <interruptRoutine+0x3b8>
            default:
                printString("\nNepostojeci op code: ");
    8000238c:	00008517          	auipc	a0,0x8
    80002390:	cf450513          	addi	a0,a0,-780 # 8000a080 <_ZZ9kPrintIntmE6digits+0x10>
    80002394:	00004097          	auipc	ra,0x4
    80002398:	ad8080e7          	jalr	-1320(ra) # 80005e6c <_Z11printStringPKc>
                kPrintInt(a0);
    8000239c:	fc043503          	ld	a0,-64(s0)
    800023a0:	fffff097          	auipc	ra,0xfffff
    800023a4:	620080e7          	jalr	1568(ra) # 800019c0 <_Z9kPrintIntm>
                printString("\nscause: ");
    800023a8:	00008517          	auipc	a0,0x8
    800023ac:	cf050513          	addi	a0,a0,-784 # 8000a098 <_ZZ9kPrintIntmE6digits+0x28>
    800023b0:	00004097          	auipc	ra,0x4
    800023b4:	abc080e7          	jalr	-1348(ra) # 80005e6c <_Z11printStringPKc>
                kPrintInt(scause);
    800023b8:	fd843503          	ld	a0,-40(s0)
    800023bc:	fffff097          	auipc	ra,0xfffff
    800023c0:	604080e7          	jalr	1540(ra) # 800019c0 <_Z9kPrintIntm>
                printString("\nsepc: ");
    800023c4:	00008517          	auipc	a0,0x8
    800023c8:	ce450513          	addi	a0,a0,-796 # 8000a0a8 <_ZZ9kPrintIntmE6digits+0x38>
    800023cc:	00004097          	auipc	ra,0x4
    800023d0:	aa0080e7          	jalr	-1376(ra) # 80005e6c <_Z11printStringPKc>
                kPrintInt(sepc);
    800023d4:	fd043503          	ld	a0,-48(s0)
    800023d8:	fffff097          	auipc	ra,0xfffff
    800023dc:	5e8080e7          	jalr	1512(ra) # 800019c0 <_Z9kPrintIntm>
                break;
    800023e0:	0080006f          	j	800023e8 <interruptRoutine+0x3b8>
                break;
    800023e4:	00000013          	nop
        }
        //sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
        sepc += 4;
    800023e8:	fd043783          	ld	a5,-48(s0)
    800023ec:	00478793          	addi	a5,a5,4
    800023f0:	fcf43823          	sd	a5,-48(s0)
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    800023f4:	fd043783          	ld	a5,-48(s0)
    800023f8:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    800023fc:	fc843783          	ld	a5,-56(s0)
    80002400:	10079073          	csrw	sstatus,a5
        printString("scause: ");
        kPrintInt(scause);
        printString("\nsepc: ");
        kPrintInt(sepc);
    }
}
    80002404:	1900006f          	j	80002594 <interruptRoutine+0x564>
    } else if (scause == 0x8000000000000009) {
    80002408:	fd843703          	ld	a4,-40(s0)
    8000240c:	fff00793          	li	a5,-1
    80002410:	03f79793          	slli	a5,a5,0x3f
    80002414:	00978793          	addi	a5,a5,9
    80002418:	08f71e63          	bne	a4,a5,800024b4 <interruptRoutine+0x484>
        uint64 irq = plic_claim();
    8000241c:	00005097          	auipc	ra,0x5
    80002420:	4f8080e7          	jalr	1272(ra) # 80007914 <plic_claim>
    80002424:	00050793          	mv	a5,a0
    80002428:	f8f43023          	sd	a5,-128(s0)
        if (irq == CONSOLE_IRQ) {
    8000242c:	f8043703          	ld	a4,-128(s0)
    80002430:	00a00793          	li	a5,10
    80002434:	02f71e63          	bne	a4,a5,80002470 <interruptRoutine+0x440>
            if (*KConsole::sr & CONSOLE_RX_STATUS_BIT) {
    80002438:	0000a797          	auipc	a5,0xa
    8000243c:	7007b783          	ld	a5,1792(a5) # 8000cb38 <_GLOBAL_OFFSET_TABLE_+0x80>
    80002440:	0007b783          	ld	a5,0(a5)
    80002444:	0007c783          	lbu	a5,0(a5)
    80002448:	0017f793          	andi	a5,a5,1
    8000244c:	02078a63          	beqz	a5,80002480 <interruptRoutine+0x450>
                KConsole::placeInInput(*KConsole::dr);
    80002450:	0000a797          	auipc	a5,0xa
    80002454:	6b07b783          	ld	a5,1712(a5) # 8000cb00 <_GLOBAL_OFFSET_TABLE_+0x48>
    80002458:	0007b783          	ld	a5,0(a5)
    8000245c:	0007c783          	lbu	a5,0(a5)
    80002460:	00078513          	mv	a0,a5
    80002464:	fffff097          	auipc	ra,0xfffff
    80002468:	3f4080e7          	jalr	1012(ra) # 80001858 <_ZN8KConsole12placeInInputEc>
    8000246c:	0140006f          	j	80002480 <interruptRoutine+0x450>
            printString("Neki drugi prekid\n");
    80002470:	00008517          	auipc	a0,0x8
    80002474:	c4050513          	addi	a0,a0,-960 # 8000a0b0 <_ZZ9kPrintIntmE6digits+0x40>
    80002478:	00004097          	auipc	ra,0x4
    8000247c:	9f4080e7          	jalr	-1548(ra) # 80005e6c <_Z11printStringPKc>
        plic_complete(irq);
    80002480:	f8043783          	ld	a5,-128(s0)
    80002484:	0007879b          	sext.w	a5,a5
    80002488:	00078513          	mv	a0,a5
    8000248c:	00005097          	auipc	ra,0x5
    80002490:	4c0080e7          	jalr	1216(ra) # 8000794c <plic_complete>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002494:	fd043783          	ld	a5,-48(s0)
    80002498:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    8000249c:	fc843783          	ld	a5,-56(s0)
    800024a0:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SEIP);
    800024a4:	20000513          	li	a0,512
    800024a8:	00000097          	auipc	ra,0x0
    800024ac:	104080e7          	jalr	260(ra) # 800025ac <_ZN5Riscv6mc_sipEm>
}
    800024b0:	0e40006f          	j	80002594 <interruptRoutine+0x564>
    } else if (scause == 0x8000000000000001) {
    800024b4:	fd843703          	ld	a4,-40(s0)
    800024b8:	fff00793          	li	a5,-1
    800024bc:	03f79793          	slli	a5,a5,0x3f
    800024c0:	00178793          	addi	a5,a5,1
    800024c4:	08f71463          	bne	a4,a5,8000254c <interruptRoutine+0x51c>
        Scheduler::wake();
    800024c8:	fffff097          	auipc	ra,0xfffff
    800024cc:	6bc080e7          	jalr	1724(ra) # 80001b84 <_ZN9Scheduler4wakeEv>
        TCB::runningTimeSlice++;
    800024d0:	0000a797          	auipc	a5,0xa
    800024d4:	6007b783          	ld	a5,1536(a5) # 8000cad0 <_GLOBAL_OFFSET_TABLE_+0x18>
    800024d8:	0007b783          	ld	a5,0(a5)
    800024dc:	00178713          	addi	a4,a5,1
    800024e0:	0000a797          	auipc	a5,0xa
    800024e4:	5f07b783          	ld	a5,1520(a5) # 8000cad0 <_GLOBAL_OFFSET_TABLE_+0x18>
    800024e8:	00e7b023          	sd	a4,0(a5)
        if (TCB::runningTimeSlice >= TCB::running->getTimeSlice()) {
    800024ec:	0000a797          	auipc	a5,0xa
    800024f0:	6247b783          	ld	a5,1572(a5) # 8000cb10 <_GLOBAL_OFFSET_TABLE_+0x58>
    800024f4:	0007b783          	ld	a5,0(a5)
    800024f8:	00078513          	mv	a0,a5
    800024fc:	00000097          	auipc	ra,0x0
    80002500:	0e8080e7          	jalr	232(ra) # 800025e4 <_ZN3TCB12getTimeSliceEv>
    80002504:	00050713          	mv	a4,a0
    80002508:	0000a797          	auipc	a5,0xa
    8000250c:	5c87b783          	ld	a5,1480(a5) # 8000cad0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002510:	0007b783          	ld	a5,0(a5)
    80002514:	00e7b7b3          	sltu	a5,a5,a4
    80002518:	0017c793          	xori	a5,a5,1
    8000251c:	0ff7f793          	andi	a5,a5,255
    80002520:	00078663          	beqz	a5,8000252c <interruptRoutine+0x4fc>
            TCB::yield();
    80002524:	00001097          	auipc	ra,0x1
    80002528:	838080e7          	jalr	-1992(ra) # 80002d5c <_ZN3TCB5yieldEv>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    8000252c:	fd043783          	ld	a5,-48(s0)
    80002530:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002534:	fc843783          	ld	a5,-56(s0)
    80002538:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SSIP);
    8000253c:	00200513          	li	a0,2
    80002540:	00000097          	auipc	ra,0x0
    80002544:	06c080e7          	jalr	108(ra) # 800025ac <_ZN5Riscv6mc_sipEm>
}
    80002548:	04c0006f          	j	80002594 <interruptRoutine+0x564>
        printString("\nGreska u prekidnoj rutini\n");
    8000254c:	00008517          	auipc	a0,0x8
    80002550:	b7c50513          	addi	a0,a0,-1156 # 8000a0c8 <_ZZ9kPrintIntmE6digits+0x58>
    80002554:	00004097          	auipc	ra,0x4
    80002558:	918080e7          	jalr	-1768(ra) # 80005e6c <_Z11printStringPKc>
        printString("scause: ");
    8000255c:	00008517          	auipc	a0,0x8
    80002560:	b8c50513          	addi	a0,a0,-1140 # 8000a0e8 <_ZZ9kPrintIntmE6digits+0x78>
    80002564:	00004097          	auipc	ra,0x4
    80002568:	908080e7          	jalr	-1784(ra) # 80005e6c <_Z11printStringPKc>
        kPrintInt(scause);
    8000256c:	fd843503          	ld	a0,-40(s0)
    80002570:	fffff097          	auipc	ra,0xfffff
    80002574:	450080e7          	jalr	1104(ra) # 800019c0 <_Z9kPrintIntm>
        printString("\nsepc: ");
    80002578:	00008517          	auipc	a0,0x8
    8000257c:	b3050513          	addi	a0,a0,-1232 # 8000a0a8 <_ZZ9kPrintIntmE6digits+0x38>
    80002580:	00004097          	auipc	ra,0x4
    80002584:	8ec080e7          	jalr	-1812(ra) # 80005e6c <_Z11printStringPKc>
        kPrintInt(sepc);
    80002588:	fd043503          	ld	a0,-48(s0)
    8000258c:	fffff097          	auipc	ra,0xfffff
    80002590:	434080e7          	jalr	1076(ra) # 800019c0 <_Z9kPrintIntm>
}
    80002594:	00000013          	nop
    80002598:	07813083          	ld	ra,120(sp)
    8000259c:	07013403          	ld	s0,112(sp)
    800025a0:	06813483          	ld	s1,104(sp)
    800025a4:	08010113          	addi	sp,sp,128
    800025a8:	00008067          	ret

00000000800025ac <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    800025ac:	ff010113          	addi	sp,sp,-16
    800025b0:	00813423          	sd	s0,8(sp)
    800025b4:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    800025b8:	14453073          	csrc	sip,a0
}
    800025bc:	00813403          	ld	s0,8(sp)
    800025c0:	01010113          	addi	sp,sp,16
    800025c4:	00008067          	ret

00000000800025c8 <_ZN3TCB9setStatusENS_12ThreadStatusE>:

    enum ThreadStatus {
        CREATED, ACTIVE, BLOCKED, JOINING, SLEEPING, FINISHED
    };

    void setStatus(ThreadStatus stat) { this->status = stat; }
    800025c8:	ff010113          	addi	sp,sp,-16
    800025cc:	00813423          	sd	s0,8(sp)
    800025d0:	01010413          	addi	s0,sp,16
    800025d4:	04b52c23          	sw	a1,88(a0)
    800025d8:	00813403          	ld	s0,8(sp)
    800025dc:	01010113          	addi	sp,sp,16
    800025e0:	00008067          	ret

00000000800025e4 <_ZN3TCB12getTimeSliceEv>:
//
//    bool isBlocked() { return blocked; }
//
//    void setBlocked(bool block) { this->blocked = block; }

    uint64 getTimeSlice() { return timeSlice; }
    800025e4:	ff010113          	addi	sp,sp,-16
    800025e8:	00813423          	sd	s0,8(sp)
    800025ec:	01010413          	addi	s0,sp,16
    800025f0:	02853503          	ld	a0,40(a0)
    800025f4:	00813403          	ld	s0,8(sp)
    800025f8:	01010113          	addi	sp,sp,16
    800025fc:	00008067          	ret

0000000080002600 <_ZN6Thread7wrapperEPv>:

	__asm__ volatile("ecall");
}

void Thread::wrapper(void* thread) {
	if (thread != nullptr) {
    80002600:	02050863          	beqz	a0,80002630 <_ZN6Thread7wrapperEPv+0x30>
void Thread::wrapper(void* thread) {
    80002604:	ff010113          	addi	sp,sp,-16
    80002608:	00113423          	sd	ra,8(sp)
    8000260c:	00813023          	sd	s0,0(sp)
    80002610:	01010413          	addi	s0,sp,16
		((Thread*)thread)->run();
    80002614:	00053783          	ld	a5,0(a0)
    80002618:	0107b783          	ld	a5,16(a5)
    8000261c:	000780e7          	jalr	a5
	}
}
    80002620:	00813083          	ld	ra,8(sp)
    80002624:	00013403          	ld	s0,0(sp)
    80002628:	01010113          	addi	sp,sp,16
    8000262c:	00008067          	ret
    80002630:	00008067          	ret

0000000080002634 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    80002634:	fe010113          	addi	sp,sp,-32
    80002638:	00113c23          	sd	ra,24(sp)
    8000263c:	00813823          	sd	s0,16(sp)
    80002640:	00913423          	sd	s1,8(sp)
    80002644:	02010413          	addi	s0,sp,32
    80002648:	00050493          	mv	s1,a0
    8000264c:	0000a797          	auipc	a5,0xa
    80002650:	28478793          	addi	a5,a5,644 # 8000c8d0 <_ZTV6Thread+0x10>
    80002654:	00f53023          	sd	a5,0(a0)
	thread_join(this->myHandle);
    80002658:	00853503          	ld	a0,8(a0)
    8000265c:	fffff097          	auipc	ra,0xfffff
    80002660:	dec080e7          	jalr	-532(ra) # 80001448 <_Z11thread_joinP3TCB>
	delete myHandle;
    80002664:	0084b483          	ld	s1,8(s1)
    80002668:	02048863          	beqz	s1,80002698 <_ZN6ThreadD1Ev+0x64>
            delete node;
        }
    }

    bool isEmpty() const {
        bool ret = front == nullptr;
    8000266c:	0484b503          	ld	a0,72(s1)
        while (!isEmpty()) {
    80002670:	00050e63          	beqz	a0,8000268c <_ZN6ThreadD1Ev+0x58>
            front = front->next;
    80002674:	00853783          	ld	a5,8(a0)
    80002678:	04f4b423          	sd	a5,72(s1)
            delete node;
    8000267c:	fe0508e3          	beqz	a0,8000266c <_ZN6ThreadD1Ev+0x38>
            mem_free(ptr);
    80002680:	fffff097          	auipc	ra,0xfffff
    80002684:	cd0080e7          	jalr	-816(ra) # 80001350 <_Z8mem_freePv>
        }
    80002688:	fe5ff06f          	j	8000266c <_ZN6ThreadD1Ev+0x38>
    8000268c:	00048513          	mv	a0,s1
    80002690:	00000097          	auipc	ra,0x0
    80002694:	7d8080e7          	jalr	2008(ra) # 80002e68 <_ZN3TCBdlEPv>
}
    80002698:	01813083          	ld	ra,24(sp)
    8000269c:	01013403          	ld	s0,16(sp)
    800026a0:	00813483          	ld	s1,8(sp)
    800026a4:	02010113          	addi	sp,sp,32
    800026a8:	00008067          	ret

00000000800026ac <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
	sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    800026ac:	fe010113          	addi	sp,sp,-32
    800026b0:	00113c23          	sd	ra,24(sp)
    800026b4:	00813823          	sd	s0,16(sp)
    800026b8:	00913423          	sd	s1,8(sp)
    800026bc:	02010413          	addi	s0,sp,32
    800026c0:	00050493          	mv	s1,a0
    800026c4:	0000a797          	auipc	a5,0xa
    800026c8:	23478793          	addi	a5,a5,564 # 8000c8f8 <_ZTV9Semaphore+0x10>
    800026cc:	00f53023          	sd	a5,0(a0)
	sem_close(myHandle);
    800026d0:	00853503          	ld	a0,8(a0)
    800026d4:	fffff097          	auipc	ra,0xfffff
    800026d8:	e04080e7          	jalr	-508(ra) # 800014d8 <_Z9sem_closeP4KSem>
	delete myHandle;
    800026dc:	0084b483          	ld	s1,8(s1)
    800026e0:	02048863          	beqz	s1,80002710 <_ZN9SemaphoreD1Ev+0x64>
        bool ret = front == nullptr;
    800026e4:	0084b503          	ld	a0,8(s1)
        while (!isEmpty()) {
    800026e8:	00050e63          	beqz	a0,80002704 <_ZN9SemaphoreD1Ev+0x58>
            front = front->next;
    800026ec:	00853783          	ld	a5,8(a0)
    800026f0:	00f4b423          	sd	a5,8(s1)
            delete node;
    800026f4:	fe0508e3          	beqz	a0,800026e4 <_ZN9SemaphoreD1Ev+0x38>
            mem_free(ptr);
    800026f8:	fffff097          	auipc	ra,0xfffff
    800026fc:	c58080e7          	jalr	-936(ra) # 80001350 <_Z8mem_freePv>
        }
    80002700:	fe5ff06f          	j	800026e4 <_ZN9SemaphoreD1Ev+0x38>
    80002704:	00048513          	mv	a0,s1
    80002708:	00001097          	auipc	ra,0x1
    8000270c:	e64080e7          	jalr	-412(ra) # 8000356c <_ZN4KSemdlEPv>
}
    80002710:	01813083          	ld	ra,24(sp)
    80002714:	01013403          	ld	s0,16(sp)
    80002718:	00813483          	ld	s1,8(sp)
    8000271c:	02010113          	addi	sp,sp,32
    80002720:	00008067          	ret

0000000080002724 <_Znwm>:
void* operator new(size_t size) {
    80002724:	ff010113          	addi	sp,sp,-16
    80002728:	00113423          	sd	ra,8(sp)
    8000272c:	00813023          	sd	s0,0(sp)
    80002730:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    80002734:	fffff097          	auipc	ra,0xfffff
    80002738:	bdc080e7          	jalr	-1060(ra) # 80001310 <_Z9mem_allocm>
}
    8000273c:	00813083          	ld	ra,8(sp)
    80002740:	00013403          	ld	s0,0(sp)
    80002744:	01010113          	addi	sp,sp,16
    80002748:	00008067          	ret

000000008000274c <_Znam>:
void* operator new[](size_t size) {
    8000274c:	ff010113          	addi	sp,sp,-16
    80002750:	00113423          	sd	ra,8(sp)
    80002754:	00813023          	sd	s0,0(sp)
    80002758:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    8000275c:	fffff097          	auipc	ra,0xfffff
    80002760:	bb4080e7          	jalr	-1100(ra) # 80001310 <_Z9mem_allocm>
}
    80002764:	00813083          	ld	ra,8(sp)
    80002768:	00013403          	ld	s0,0(sp)
    8000276c:	01010113          	addi	sp,sp,16
    80002770:	00008067          	ret

0000000080002774 <_ZdlPv>:
noexcept {
    80002774:	ff010113          	addi	sp,sp,-16
    80002778:	00113423          	sd	ra,8(sp)
    8000277c:	00813023          	sd	s0,0(sp)
    80002780:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80002784:	fffff097          	auipc	ra,0xfffff
    80002788:	bcc080e7          	jalr	-1076(ra) # 80001350 <_Z8mem_freePv>
}
    8000278c:	00813083          	ld	ra,8(sp)
    80002790:	00013403          	ld	s0,0(sp)
    80002794:	01010113          	addi	sp,sp,16
    80002798:	00008067          	ret

000000008000279c <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    8000279c:	fe010113          	addi	sp,sp,-32
    800027a0:	00113c23          	sd	ra,24(sp)
    800027a4:	00813823          	sd	s0,16(sp)
    800027a8:	00913423          	sd	s1,8(sp)
    800027ac:	02010413          	addi	s0,sp,32
    800027b0:	00050493          	mv	s1,a0
}
    800027b4:	00000097          	auipc	ra,0x0
    800027b8:	e80080e7          	jalr	-384(ra) # 80002634 <_ZN6ThreadD1Ev>
    800027bc:	00048513          	mv	a0,s1
    800027c0:	00000097          	auipc	ra,0x0
    800027c4:	fb4080e7          	jalr	-76(ra) # 80002774 <_ZdlPv>
    800027c8:	01813083          	ld	ra,24(sp)
    800027cc:	01013403          	ld	s0,16(sp)
    800027d0:	00813483          	ld	s1,8(sp)
    800027d4:	02010113          	addi	sp,sp,32
    800027d8:	00008067          	ret

00000000800027dc <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    800027dc:	fe010113          	addi	sp,sp,-32
    800027e0:	00113c23          	sd	ra,24(sp)
    800027e4:	00813823          	sd	s0,16(sp)
    800027e8:	00913423          	sd	s1,8(sp)
    800027ec:	02010413          	addi	s0,sp,32
    800027f0:	00050493          	mv	s1,a0
}
    800027f4:	00000097          	auipc	ra,0x0
    800027f8:	eb8080e7          	jalr	-328(ra) # 800026ac <_ZN9SemaphoreD1Ev>
    800027fc:	00048513          	mv	a0,s1
    80002800:	00000097          	auipc	ra,0x0
    80002804:	f74080e7          	jalr	-140(ra) # 80002774 <_ZdlPv>
    80002808:	01813083          	ld	ra,24(sp)
    8000280c:	01013403          	ld	s0,16(sp)
    80002810:	00813483          	ld	s1,8(sp)
    80002814:	02010113          	addi	sp,sp,32
    80002818:	00008067          	ret

000000008000281c <_ZdaPv>:
noexcept {
    8000281c:	ff010113          	addi	sp,sp,-16
    80002820:	00113423          	sd	ra,8(sp)
    80002824:	00813023          	sd	s0,0(sp)
    80002828:	01010413          	addi	s0,sp,16
mem_free(ptr);
    8000282c:	fffff097          	auipc	ra,0xfffff
    80002830:	b24080e7          	jalr	-1244(ra) # 80001350 <_Z8mem_freePv>
}
    80002834:	00813083          	ld	ra,8(sp)
    80002838:	00013403          	ld	s0,0(sp)
    8000283c:	01010113          	addi	sp,sp,16
    80002840:	00008067          	ret

0000000080002844 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (* body)(void*), void* arg) {
    80002844:	fd010113          	addi	sp,sp,-48
    80002848:	02113423          	sd	ra,40(sp)
    8000284c:	02813023          	sd	s0,32(sp)
    80002850:	00913c23          	sd	s1,24(sp)
    80002854:	01213823          	sd	s2,16(sp)
    80002858:	01313423          	sd	s3,8(sp)
    8000285c:	03010413          	addi	s0,sp,48
    80002860:	00050493          	mv	s1,a0
    80002864:	00058913          	mv	s2,a1
    80002868:	00060993          	mv	s3,a2
    8000286c:	0000a797          	auipc	a5,0xa
    80002870:	06478793          	addi	a5,a5,100 # 8000c8d0 <_ZTV6Thread+0x10>
    80002874:	00f53023          	sd	a5,0(a0)
	this->body = body;
    80002878:	00b53823          	sd	a1,16(a0)
	this->arg = arg;
    8000287c:	00c53c23          	sd	a2,24(a0)
	if (body != nullptr) {
    80002880:	04058663          	beqz	a1,800028cc <_ZN6ThreadC1EPFvPvES0_+0x88>
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    80002884:	00001537          	lui	a0,0x1
    80002888:	fffff097          	auipc	ra,0xfffff
    8000288c:	a88080e7          	jalr	-1400(ra) # 80001310 <_Z9mem_allocm>
    80002890:	00050313          	mv	t1,a0
	__asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002894:	00030713          	mv	a4,t1
	__asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002898:	00098693          	mv	a3,s3
			body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000289c:	00090613          	mv	a2,s2
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800028a0:	00848493          	addi	s1,s1,8
    800028a4:	00048593          	mv	a1,s1
	__asm__ volatile("li a0, 0x80");
    800028a8:	08000513          	li	a0,128
	__asm__ volatile("ecall");
    800028ac:	00000073          	ecall
}
    800028b0:	02813083          	ld	ra,40(sp)
    800028b4:	02013403          	ld	s0,32(sp)
    800028b8:	01813483          	ld	s1,24(sp)
    800028bc:	01013903          	ld	s2,16(sp)
    800028c0:	00813983          	ld	s3,8(sp)
    800028c4:	03010113          	addi	sp,sp,48
    800028c8:	00008067          	ret
	uint64* stack = nullptr;
    800028cc:	00000313          	li	t1,0
    800028d0:	fc5ff06f          	j	80002894 <_ZN6ThreadC1EPFvPvES0_+0x50>

00000000800028d4 <_ZN6Thread5startEv>:
int Thread::start() {
    800028d4:	ff010113          	addi	sp,sp,-16
    800028d8:	00813423          	sd	s0,8(sp)
    800028dc:	01010413          	addi	s0,sp,16
	if (myHandle == nullptr) return -1;
    800028e0:	00853303          	ld	t1,8(a0) # 1008 <_entry-0x7fffeff8>
    800028e4:	02030063          	beqz	t1,80002904 <_ZN6Thread5startEv+0x30>
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800028e8:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x81");
    800028ec:	08100513          	li	a0,129
	__asm__ volatile("ecall");
    800028f0:	00000073          	ecall
	return 0;
    800028f4:	00000513          	li	a0,0
}
    800028f8:	00813403          	ld	s0,8(sp)
    800028fc:	01010113          	addi	sp,sp,16
    80002900:	00008067          	ret
	if (myHandle == nullptr) return -1;
    80002904:	fff00513          	li	a0,-1
    80002908:	ff1ff06f          	j	800028f8 <_ZN6Thread5startEv+0x24>

000000008000290c <_ZN6Thread4joinEv>:
void Thread::join() {
    8000290c:	ff010113          	addi	sp,sp,-16
    80002910:	00113423          	sd	ra,8(sp)
    80002914:	00813023          	sd	s0,0(sp)
    80002918:	01010413          	addi	s0,sp,16
	thread_join(myHandle);
    8000291c:	00853503          	ld	a0,8(a0)
    80002920:	fffff097          	auipc	ra,0xfffff
    80002924:	b28080e7          	jalr	-1240(ra) # 80001448 <_Z11thread_joinP3TCB>
}
    80002928:	00813083          	ld	ra,8(sp)
    8000292c:	00013403          	ld	s0,0(sp)
    80002930:	01010113          	addi	sp,sp,16
    80002934:	00008067          	ret

0000000080002938 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80002938:	ff010113          	addi	sp,sp,-16
    8000293c:	00113423          	sd	ra,8(sp)
    80002940:	00813023          	sd	s0,0(sp)
    80002944:	01010413          	addi	s0,sp,16
	thread_dispatch();
    80002948:	fffff097          	auipc	ra,0xfffff
    8000294c:	ae0080e7          	jalr	-1312(ra) # 80001428 <_Z15thread_dispatchv>
}
    80002950:	00813083          	ld	ra,8(sp)
    80002954:	00013403          	ld	s0,0(sp)
    80002958:	01010113          	addi	sp,sp,16
    8000295c:	00008067          	ret

0000000080002960 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t t) {
    80002960:	ff010113          	addi	sp,sp,-16
    80002964:	00113423          	sd	ra,8(sp)
    80002968:	00813023          	sd	s0,0(sp)
    8000296c:	01010413          	addi	s0,sp,16
    80002970:	00050593          	mv	a1,a0
	Scheduler::putToSleep(TCB::running, t);
    80002974:	0000a797          	auipc	a5,0xa
    80002978:	19c7b783          	ld	a5,412(a5) # 8000cb10 <_GLOBAL_OFFSET_TABLE_+0x58>
    8000297c:	0007b503          	ld	a0,0(a5)
    80002980:	fffff097          	auipc	ra,0xfffff
    80002984:	154080e7          	jalr	340(ra) # 80001ad4 <_ZN9Scheduler10putToSleepEP3TCBm>
}
    80002988:	00000513          	li	a0,0
    8000298c:	00813083          	ld	ra,8(sp)
    80002990:	00013403          	ld	s0,0(sp)
    80002994:	01010113          	addi	sp,sp,16
    80002998:	00008067          	ret

000000008000299c <_ZN14PeriodicThread15periodicWrapperEPv>:
}

PeriodicThread::PeriodicThread(time_t period) : Thread(periodicWrapper, this), period(period) {
}

void PeriodicThread::periodicWrapper(void* pThread) {
    8000299c:	fe010113          	addi	sp,sp,-32
    800029a0:	00113c23          	sd	ra,24(sp)
    800029a4:	00813823          	sd	s0,16(sp)
    800029a8:	00913423          	sd	s1,8(sp)
    800029ac:	02010413          	addi	s0,sp,32
    800029b0:	00050493          	mv	s1,a0
	if (pThread != nullptr) {
    800029b4:	02050263          	beqz	a0,800029d8 <_ZN14PeriodicThread15periodicWrapperEPv+0x3c>
		PeriodicThread* ptr = (PeriodicThread*)pThread;
		while (1) {
			ptr->periodicActivation();
    800029b8:	0004b783          	ld	a5,0(s1)
    800029bc:	0187b783          	ld	a5,24(a5)
    800029c0:	00048513          	mv	a0,s1
    800029c4:	000780e7          	jalr	a5
			Thread::sleep(ptr->period);
    800029c8:	0204b503          	ld	a0,32(s1)
    800029cc:	00000097          	auipc	ra,0x0
    800029d0:	f94080e7          	jalr	-108(ra) # 80002960 <_ZN6Thread5sleepEm>
		while (1) {
    800029d4:	fe5ff06f          	j	800029b8 <_ZN14PeriodicThread15periodicWrapperEPv+0x1c>
		}
	}
}
    800029d8:	01813083          	ld	ra,24(sp)
    800029dc:	01013403          	ld	s0,16(sp)
    800029e0:	00813483          	ld	s1,8(sp)
    800029e4:	02010113          	addi	sp,sp,32
    800029e8:	00008067          	ret

00000000800029ec <_ZN6ThreadC1Ev>:
Thread::Thread() {
    800029ec:	fe010113          	addi	sp,sp,-32
    800029f0:	00113c23          	sd	ra,24(sp)
    800029f4:	00813823          	sd	s0,16(sp)
    800029f8:	00913423          	sd	s1,8(sp)
    800029fc:	02010413          	addi	s0,sp,32
    80002a00:	00050493          	mv	s1,a0
    80002a04:	0000a797          	auipc	a5,0xa
    80002a08:	ecc78793          	addi	a5,a5,-308 # 8000c8d0 <_ZTV6Thread+0x10>
    80002a0c:	00f53023          	sd	a5,0(a0)
	this->body = wrapper;
    80002a10:	00000797          	auipc	a5,0x0
    80002a14:	bf078793          	addi	a5,a5,-1040 # 80002600 <_ZN6Thread7wrapperEPv>
    80002a18:	00f53823          	sd	a5,16(a0)
	this->arg = this;
    80002a1c:	00a53c23          	sd	a0,24(a0)
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    80002a20:	00001537          	lui	a0,0x1
    80002a24:	fffff097          	auipc	ra,0xfffff
    80002a28:	8ec080e7          	jalr	-1812(ra) # 80001310 <_Z9mem_allocm>
    80002a2c:	00050313          	mv	t1,a0
	__asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002a30:	00030713          	mv	a4,t1
	__asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002a34:	0184b303          	ld	t1,24(s1)
    80002a38:	00030693          	mv	a3,t1
			body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002a3c:	0104b303          	ld	t1,16(s1)
    80002a40:	00030613          	mv	a2,t1
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002a44:	00848493          	addi	s1,s1,8
    80002a48:	00048593          	mv	a1,s1
	__asm__ volatile("li a0, 0x80");
    80002a4c:	08000513          	li	a0,128
	__asm__ volatile("ecall");
    80002a50:	00000073          	ecall
}
    80002a54:	01813083          	ld	ra,24(sp)
    80002a58:	01013403          	ld	s0,16(sp)
    80002a5c:	00813483          	ld	s1,8(sp)
    80002a60:	02010113          	addi	sp,sp,32
    80002a64:	00008067          	ret

0000000080002a68 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80002a68:	ff010113          	addi	sp,sp,-16
    80002a6c:	00113423          	sd	ra,8(sp)
    80002a70:	00813023          	sd	s0,0(sp)
    80002a74:	01010413          	addi	s0,sp,16
    80002a78:	0000a797          	auipc	a5,0xa
    80002a7c:	e8078793          	addi	a5,a5,-384 # 8000c8f8 <_ZTV9Semaphore+0x10>
    80002a80:	00f53023          	sd	a5,0(a0) # 1000 <_entry-0x7ffff000>
	sem_open(&myHandle, init);
    80002a84:	00850513          	addi	a0,a0,8
    80002a88:	fffff097          	auipc	ra,0xfffff
    80002a8c:	a18080e7          	jalr	-1512(ra) # 800014a0 <_Z8sem_openPP4KSemj>
}
    80002a90:	00813083          	ld	ra,8(sp)
    80002a94:	00013403          	ld	s0,0(sp)
    80002a98:	01010113          	addi	sp,sp,16
    80002a9c:	00008067          	ret

0000000080002aa0 <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    80002aa0:	ff010113          	addi	sp,sp,-16
    80002aa4:	00113423          	sd	ra,8(sp)
    80002aa8:	00813023          	sd	s0,0(sp)
    80002aac:	01010413          	addi	s0,sp,16
	return sem_wait(myHandle);
    80002ab0:	00853503          	ld	a0,8(a0)
    80002ab4:	fffff097          	auipc	ra,0xfffff
    80002ab8:	a54080e7          	jalr	-1452(ra) # 80001508 <_Z8sem_waitP4KSem>
}
    80002abc:	00813083          	ld	ra,8(sp)
    80002ac0:	00013403          	ld	s0,0(sp)
    80002ac4:	01010113          	addi	sp,sp,16
    80002ac8:	00008067          	ret

0000000080002acc <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    80002acc:	ff010113          	addi	sp,sp,-16
    80002ad0:	00113423          	sd	ra,8(sp)
    80002ad4:	00813023          	sd	s0,0(sp)
    80002ad8:	01010413          	addi	s0,sp,16
	return sem_signal(myHandle);
    80002adc:	00853503          	ld	a0,8(a0)
    80002ae0:	fffff097          	auipc	ra,0xfffff
    80002ae4:	a58080e7          	jalr	-1448(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    80002ae8:	00813083          	ld	ra,8(sp)
    80002aec:	00013403          	ld	s0,0(sp)
    80002af0:	01010113          	addi	sp,sp,16
    80002af4:	00008067          	ret

0000000080002af8 <_ZN14PeriodicThread9terminateEv>:
void PeriodicThread::terminate() {
    80002af8:	ff010113          	addi	sp,sp,-16
    80002afc:	00813423          	sd	s0,8(sp)
    80002b00:	01010413          	addi	s0,sp,16
}
    80002b04:	00813403          	ld	s0,8(sp)
    80002b08:	01010113          	addi	sp,sp,16
    80002b0c:	00008067          	ret

0000000080002b10 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period) : Thread(periodicWrapper, this), period(period) {
    80002b10:	fe010113          	addi	sp,sp,-32
    80002b14:	00113c23          	sd	ra,24(sp)
    80002b18:	00813823          	sd	s0,16(sp)
    80002b1c:	00913423          	sd	s1,8(sp)
    80002b20:	01213023          	sd	s2,0(sp)
    80002b24:	02010413          	addi	s0,sp,32
    80002b28:	00050493          	mv	s1,a0
    80002b2c:	00058913          	mv	s2,a1
    80002b30:	00050613          	mv	a2,a0
    80002b34:	00000597          	auipc	a1,0x0
    80002b38:	e6858593          	addi	a1,a1,-408 # 8000299c <_ZN14PeriodicThread15periodicWrapperEPv>
    80002b3c:	00000097          	auipc	ra,0x0
    80002b40:	d08080e7          	jalr	-760(ra) # 80002844 <_ZN6ThreadC1EPFvPvES0_>
    80002b44:	0000a797          	auipc	a5,0xa
    80002b48:	d5c78793          	addi	a5,a5,-676 # 8000c8a0 <_ZTV14PeriodicThread+0x10>
    80002b4c:	00f4b023          	sd	a5,0(s1)
    80002b50:	0324b023          	sd	s2,32(s1)
}
    80002b54:	01813083          	ld	ra,24(sp)
    80002b58:	01013403          	ld	s0,16(sp)
    80002b5c:	00813483          	ld	s1,8(sp)
    80002b60:	00013903          	ld	s2,0(sp)
    80002b64:	02010113          	addi	sp,sp,32
    80002b68:	00008067          	ret

0000000080002b6c <_ZN7Console4getcEv>:

char Console::getc() {
    80002b6c:	ff010113          	addi	sp,sp,-16
    80002b70:	00113423          	sd	ra,8(sp)
    80002b74:	00813023          	sd	s0,0(sp)
    80002b78:	01010413          	addi	s0,sp,16
	return ::getc();
    80002b7c:	fffff097          	auipc	ra,0xfffff
    80002b80:	9ec080e7          	jalr	-1556(ra) # 80001568 <_Z4getcv>
}
    80002b84:	00813083          	ld	ra,8(sp)
    80002b88:	00013403          	ld	s0,0(sp)
    80002b8c:	01010113          	addi	sp,sp,16
    80002b90:	00008067          	ret

0000000080002b94 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80002b94:	ff010113          	addi	sp,sp,-16
    80002b98:	00113423          	sd	ra,8(sp)
    80002b9c:	00813023          	sd	s0,0(sp)
    80002ba0:	01010413          	addi	s0,sp,16
	::putc(c);
    80002ba4:	fffff097          	auipc	ra,0xfffff
    80002ba8:	9ec080e7          	jalr	-1556(ra) # 80001590 <_Z4putcc>
}
    80002bac:	00813083          	ld	ra,8(sp)
    80002bb0:	00013403          	ld	s0,0(sp)
    80002bb4:	01010113          	addi	sp,sp,16
    80002bb8:	00008067          	ret

0000000080002bbc <_ZN6Thread3runEv>:
	static int sleep(time_t);

protected:
	Thread();

	virtual void run() {}
    80002bbc:	ff010113          	addi	sp,sp,-16
    80002bc0:	00813423          	sd	s0,8(sp)
    80002bc4:	01010413          	addi	s0,sp,16
    80002bc8:	00813403          	ld	s0,8(sp)
    80002bcc:	01010113          	addi	sp,sp,16
    80002bd0:	00008067          	ret

0000000080002bd4 <_ZN14PeriodicThread18periodicActivationEv>:
	void terminate();

protected:
	PeriodicThread(time_t period);

	virtual void periodicActivation() {}
    80002bd4:	ff010113          	addi	sp,sp,-16
    80002bd8:	00813423          	sd	s0,8(sp)
    80002bdc:	01010413          	addi	s0,sp,16
    80002be0:	00813403          	ld	s0,8(sp)
    80002be4:	01010113          	addi	sp,sp,16
    80002be8:	00008067          	ret

0000000080002bec <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80002bec:	ff010113          	addi	sp,sp,-16
    80002bf0:	00113423          	sd	ra,8(sp)
    80002bf4:	00813023          	sd	s0,0(sp)
    80002bf8:	01010413          	addi	s0,sp,16
    80002bfc:	0000a797          	auipc	a5,0xa
    80002c00:	ca478793          	addi	a5,a5,-860 # 8000c8a0 <_ZTV14PeriodicThread+0x10>
    80002c04:	00f53023          	sd	a5,0(a0)
    80002c08:	00000097          	auipc	ra,0x0
    80002c0c:	a2c080e7          	jalr	-1492(ra) # 80002634 <_ZN6ThreadD1Ev>
    80002c10:	00813083          	ld	ra,8(sp)
    80002c14:	00013403          	ld	s0,0(sp)
    80002c18:	01010113          	addi	sp,sp,16
    80002c1c:	00008067          	ret

0000000080002c20 <_ZN14PeriodicThreadD0Ev>:
    80002c20:	fe010113          	addi	sp,sp,-32
    80002c24:	00113c23          	sd	ra,24(sp)
    80002c28:	00813823          	sd	s0,16(sp)
    80002c2c:	00913423          	sd	s1,8(sp)
    80002c30:	02010413          	addi	s0,sp,32
    80002c34:	00050493          	mv	s1,a0
    80002c38:	0000a797          	auipc	a5,0xa
    80002c3c:	c6878793          	addi	a5,a5,-920 # 8000c8a0 <_ZTV14PeriodicThread+0x10>
    80002c40:	00f53023          	sd	a5,0(a0)
    80002c44:	00000097          	auipc	ra,0x0
    80002c48:	9f0080e7          	jalr	-1552(ra) # 80002634 <_ZN6ThreadD1Ev>
    80002c4c:	00048513          	mv	a0,s1
    80002c50:	00000097          	auipc	ra,0x0
    80002c54:	b24080e7          	jalr	-1244(ra) # 80002774 <_ZdlPv>
    80002c58:	01813083          	ld	ra,24(sp)
    80002c5c:	01013403          	ld	s0,16(sp)
    80002c60:	00813483          	ld	s1,8(sp)
    80002c64:	02010113          	addi	sp,sp,32
    80002c68:	00008067          	ret

0000000080002c6c <_ZN3TCB7wrapperEv>:
    Riscv::pushRegisters();
    TCB::dispatch();
    Riscv::popRegisters();
}

void TCB::wrapper() {
    80002c6c:	ff010113          	addi	sp,sp,-16
    80002c70:	00113423          	sd	ra,8(sp)
    80002c74:	00813023          	sd	s0,0(sp)
    80002c78:	01010413          	addi	s0,sp,16
    //pocetak wrappera se izvrsava u supervisor modu,
    //jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch/yield)
    Riscv::popSppSpie();
    80002c7c:	00000097          	auipc	ra,0x0
    80002c80:	308080e7          	jalr	776(ra) # 80002f84 <_ZN5Riscv10popSppSpieEv>
    //na dalje se izvrsavamo u user modu
    running->threadFunction(running->args);
    80002c84:	0000a797          	auipc	a5,0xa
    80002c88:	0047b783          	ld	a5,4(a5) # 8000cc88 <_ZN3TCB7runningE>
    80002c8c:	0107b703          	ld	a4,16(a5)
    80002c90:	0207b503          	ld	a0,32(a5)
    80002c94:	000700e7          	jalr	a4
    //running->finished = true;
    //i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
    thread_exit();
    80002c98:	ffffe097          	auipc	ra,0xffffe
    80002c9c:	768080e7          	jalr	1896(ra) # 80001400 <_Z11thread_exitv>
}
    80002ca0:	00813083          	ld	ra,8(sp)
    80002ca4:	00013403          	ld	s0,0(sp)
    80002ca8:	01010113          	addi	sp,sp,16
    80002cac:	00008067          	ret

0000000080002cb0 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80002cb0:	fe010113          	addi	sp,sp,-32
    80002cb4:	00113c23          	sd	ra,24(sp)
    80002cb8:	00813823          	sd	s0,16(sp)
    80002cbc:	00913423          	sd	s1,8(sp)
    80002cc0:	02010413          	addi	s0,sp,32
    TCB* old = TCB::running;
    80002cc4:	0000a497          	auipc	s1,0xa
    80002cc8:	fc44b483          	ld	s1,-60(s1) # 8000cc88 <_ZN3TCB7runningE>
    if (old->status == ACTIVE) {
    80002ccc:	0584a703          	lw	a4,88(s1)
    80002cd0:	00100793          	li	a5,1
    80002cd4:	04f70663          	beq	a4,a5,80002d20 <_ZN3TCB8dispatchEv+0x70>
    TCB::running = Scheduler::get();
    80002cd8:	fffff097          	auipc	ra,0xfffff
    80002cdc:	dbc080e7          	jalr	-580(ra) # 80001a94 <_ZN9Scheduler3getEv>
    80002ce0:	00050593          	mv	a1,a0
    80002ce4:	0000a797          	auipc	a5,0xa
    80002ce8:	fa478793          	addi	a5,a5,-92 # 8000cc88 <_ZN3TCB7runningE>
    80002cec:	00a7b023          	sd	a0,0(a5)
    TCB::runningTimeSlice = 0;
    80002cf0:	0007b423          	sd	zero,8(a5)
    if (TCB::running->threadFunction == nullptr || TCB::running->threadFunction == kernelConsumerFunction ||
    80002cf4:	01053783          	ld	a5,16(a0)
    80002cf8:	02078c63          	beqz	a5,80002d30 <_ZN3TCB8dispatchEv+0x80>
    80002cfc:	0000a717          	auipc	a4,0xa
    80002d00:	dec73703          	ld	a4,-532(a4) # 8000cae8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002d04:	02e78663          	beq	a5,a4,80002d30 <_ZN3TCB8dispatchEv+0x80>
    80002d08:	0000a717          	auipc	a4,0xa
    80002d0c:	e2073703          	ld	a4,-480(a4) # 8000cb28 <_GLOBAL_OFFSET_TABLE_+0x70>
    80002d10:	02e78063          	beq	a5,a4,80002d30 <_ZN3TCB8dispatchEv+0x80>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002d14:	10000793          	li	a5,256
    80002d18:	1007b073          	csrc	sstatus,a5
}
    80002d1c:	01c0006f          	j	80002d38 <_ZN3TCB8dispatchEv+0x88>
        Scheduler::put(old);
    80002d20:	00048513          	mv	a0,s1
    80002d24:	fffff097          	auipc	ra,0xfffff
    80002d28:	d2c080e7          	jalr	-724(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
    80002d2c:	fadff06f          	j	80002cd8 <_ZN3TCB8dispatchEv+0x28>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80002d30:	10000793          	li	a5,256
    80002d34:	1007a073          	csrs	sstatus,a5
    if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    80002d38:	00b48863          	beq	s1,a1,80002d48 <_ZN3TCB8dispatchEv+0x98>
    80002d3c:	00048513          	mv	a0,s1
    80002d40:	ffffe097          	auipc	ra,0xffffe
    80002d44:	4d0080e7          	jalr	1232(ra) # 80001210 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80002d48:	01813083          	ld	ra,24(sp)
    80002d4c:	01013403          	ld	s0,16(sp)
    80002d50:	00813483          	ld	s1,8(sp)
    80002d54:	02010113          	addi	sp,sp,32
    80002d58:	00008067          	ret

0000000080002d5c <_ZN3TCB5yieldEv>:
void TCB::yield() {
    80002d5c:	ff010113          	addi	sp,sp,-16
    80002d60:	00113423          	sd	ra,8(sp)
    80002d64:	00813023          	sd	s0,0(sp)
    80002d68:	01010413          	addi	s0,sp,16
    Riscv::pushRegisters();
    80002d6c:	ffffe097          	auipc	ra,0xffffe
    80002d70:	294080e7          	jalr	660(ra) # 80001000 <_ZN5Riscv13pushRegistersEv>
    TCB::dispatch();
    80002d74:	00000097          	auipc	ra,0x0
    80002d78:	f3c080e7          	jalr	-196(ra) # 80002cb0 <_ZN3TCB8dispatchEv>
    Riscv::popRegisters();
    80002d7c:	ffffe097          	auipc	ra,0xffffe
    80002d80:	300080e7          	jalr	768(ra) # 8000107c <_ZN5Riscv12popRegistersEv>
}
    80002d84:	00813083          	ld	ra,8(sp)
    80002d88:	00013403          	ld	s0,0(sp)
    80002d8c:	01010113          	addi	sp,sp,16
    80002d90:	00008067          	ret

0000000080002d94 <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    80002d94:	ff010113          	addi	sp,sp,-16
    80002d98:	00113423          	sd	ra,8(sp)
    80002d9c:	00813023          	sd	s0,0(sp)
    80002da0:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80002da4:	ffffe097          	auipc	ra,0xffffe
    80002da8:	56c080e7          	jalr	1388(ra) # 80001310 <_Z9mem_allocm>
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
    ThreadStatus status;    //status niti


    TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
                                                    timeSlice(DEFAULT_TIME_SLICE), nextInScheduler(nullptr), timeToSleep(0),
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
    80002e24:	e4c78793          	addi	a5,a5,-436 # 80002c6c <_ZN3TCB7wrapperEv>
        uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80002e28:	02048c63          	beqz	s1,80002e60 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xa4>
    80002e2c:	00008637          	lui	a2,0x8
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
        uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
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
    80002e7c:	4d8080e7          	jalr	1240(ra) # 80001350 <_Z8mem_freePv>
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
    80002ec4:	384080e7          	jalr	900(ra) # 80001244 <_ZN11ThreadQueue7putLastEP3TCB>
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
    80002f04:	3b0080e7          	jalr	944(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
        tcb->status = ACTIVE;
    80002f08:	00100793          	li	a5,1
    80002f0c:	04f52c23          	sw	a5,88(a0)
        Scheduler::put(tcb);
    80002f10:	fffff097          	auipc	ra,0xfffff
    80002f14:	b40080e7          	jalr	-1216(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
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
    80002f60:	af4080e7          	jalr	-1292(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
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

void Riscv::popSppSpie() {
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

0000000080002fa4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>:
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

#pragma GCC optimize("O0")

void* MemoryAllocator::kmalloc(size_t size, Purpose pur) {
    80002fa4:	fa010113          	addi	sp,sp,-96
    80002fa8:	04813c23          	sd	s0,88(sp)
    80002fac:	06010413          	addi	s0,sp,96
    80002fb0:	faa43423          	sd	a0,-88(s0)
    80002fb4:	00058793          	mv	a5,a1
    80002fb8:	faf42223          	sw	a5,-92(s0)
    //size je u broju bajtova, ukljucuje i mesto potrebno za zaglavlje UsedMemSegment
    if (size <= 0) return nullptr;
    80002fbc:	fa843783          	ld	a5,-88(s0)
    80002fc0:	00079663          	bnez	a5,80002fcc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x28>
    80002fc4:	00000793          	li	a5,0
    80002fc8:	2040006f          	j	800031cc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
    //alokacija uvek zaokruzena na blokove
    //size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
    size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80002fcc:	fa843783          	ld	a5,-88(s0)
    80002fd0:	0067d713          	srli	a4,a5,0x6
    80002fd4:	fa843783          	ld	a5,-88(s0)
    80002fd8:	03f7f793          	andi	a5,a5,63
    80002fdc:	00078663          	beqz	a5,80002fe8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x44>
    80002fe0:	00100793          	li	a5,1
    80002fe4:	0080006f          	j	80002fec <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x48>
    80002fe8:	00000793          	li	a5,0
    80002fec:	00e787b3          	add	a5,a5,a4
    80002ff0:	fcf43423          	sd	a5,-56(s0)
    size = blocks * MEM_BLOCK_SIZE;
    80002ff4:	fc843783          	ld	a5,-56(s0)
    80002ff8:	00679793          	slli	a5,a5,0x6
    80002ffc:	faf43423          	sd	a5,-88(s0)

    //trazenje slobodnog segmenta po first-fit algoritmu
    FreeMemSegment* prevFree = nullptr;
    80003000:	fe043423          	sd	zero,-24(s0)
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
    80003004:	0000a797          	auipc	a5,0xa
    80003008:	c9c78793          	addi	a5,a5,-868 # 8000cca0 <_ZN15MemoryAllocator11freeMemHeadE>
    8000300c:	0007b783          	ld	a5,0(a5)
    80003010:	fef43023          	sd	a5,-32(s0)
    80003014:	fe043783          	ld	a5,-32(s0)
    80003018:	1a078863          	beqz	a5,800031c8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x224>
        if (firstFit->size < size) continue;
    8000301c:	fe043783          	ld	a5,-32(s0)
    80003020:	0087b783          	ld	a5,8(a5)
    80003024:	fa843703          	ld	a4,-88(s0)
    80003028:	18e7e263          	bltu	a5,a4,800031ac <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x208>

        //pravljenje novog slobodnog fragmenta od ostatka fragmenta
        FreeMemSegment* remainderFree = (FreeMemSegment*) ((char*) firstFit + size);
    8000302c:	fe043703          	ld	a4,-32(s0)
    80003030:	fa843783          	ld	a5,-88(s0)
    80003034:	00f707b3          	add	a5,a4,a5
    80003038:	fcf43023          	sd	a5,-64(s0)
        size_t remainingSize = firstFit->size - size;
    8000303c:	fe043783          	ld	a5,-32(s0)
    80003040:	0087b703          	ld	a4,8(a5)
    80003044:	fa843783          	ld	a5,-88(s0)
    80003048:	40f707b3          	sub	a5,a4,a5
    8000304c:	faf43c23          	sd	a5,-72(s0)
        if (remainingSize <= sizeof(UsedMemSegment)) {
    80003050:	fb843703          	ld	a4,-72(s0)
    80003054:	02000793          	li	a5,32
    80003058:	04e7e463          	bltu	a5,a4,800030a0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xfc>
            //ne preostaje dovoljno veliki slobodni segment;dodeljujemo ceo trenutno alociranom;remainderFree ne postoji
            size += remainingSize;
    8000305c:	fa843703          	ld	a4,-88(s0)
    80003060:	fb843783          	ld	a5,-72(s0)
    80003064:	00f707b3          	add	a5,a4,a5
    80003068:	faf43423          	sd	a5,-88(s0)
            if (prevFree) {
    8000306c:	fe843783          	ld	a5,-24(s0)
    80003070:	00078c63          	beqz	a5,80003088 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xe4>
                prevFree->next = firstFit->next;
    80003074:	fe043783          	ld	a5,-32(s0)
    80003078:	0007b703          	ld	a4,0(a5)
    8000307c:	fe843783          	ld	a5,-24(s0)
    80003080:	00e7b023          	sd	a4,0(a5)
    80003084:	0600006f          	j	800030e4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            } else {
                freeMemHead = firstFit->next;
    80003088:	fe043783          	ld	a5,-32(s0)
    8000308c:	0007b703          	ld	a4,0(a5)
    80003090:	0000a797          	auipc	a5,0xa
    80003094:	c1078793          	addi	a5,a5,-1008 # 8000cca0 <_ZN15MemoryAllocator11freeMemHeadE>
    80003098:	00e7b023          	sd	a4,0(a5)
    8000309c:	0480006f          	j	800030e4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            }
        } else {
            remainderFree->size = remainingSize;
    800030a0:	fc043783          	ld	a5,-64(s0)
    800030a4:	fb843703          	ld	a4,-72(s0)
    800030a8:	00e7b423          	sd	a4,8(a5)
            remainderFree->next = firstFit->next;
    800030ac:	fe043783          	ld	a5,-32(s0)
    800030b0:	0007b703          	ld	a4,0(a5)
    800030b4:	fc043783          	ld	a5,-64(s0)
    800030b8:	00e7b023          	sd	a4,0(a5)
            if (prevFree) {
    800030bc:	fe843783          	ld	a5,-24(s0)
    800030c0:	00078a63          	beqz	a5,800030d4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x130>
                prevFree->next = remainderFree;
    800030c4:	fe843783          	ld	a5,-24(s0)
    800030c8:	fc043703          	ld	a4,-64(s0)
    800030cc:	00e7b023          	sd	a4,0(a5)
    800030d0:	0140006f          	j	800030e4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            } else {
                freeMemHead = remainderFree;
    800030d4:	0000a797          	auipc	a5,0xa
    800030d8:	bcc78793          	addi	a5,a5,-1076 # 8000cca0 <_ZN15MemoryAllocator11freeMemHeadE>
    800030dc:	fc043703          	ld	a4,-64(s0)
    800030e0:	00e7b023          	sd	a4,0(a5)
            }
        }
        //ubacivanje novog fragmenta u listu zauzetih fragmenata
        UsedMemSegment* newUsed = (UsedMemSegment*) firstFit;
    800030e4:	fe043783          	ld	a5,-32(s0)
    800030e8:	faf43823          	sd	a5,-80(s0)
        newUsed->size = size;
    800030ec:	fb043783          	ld	a5,-80(s0)
    800030f0:	fa843703          	ld	a4,-88(s0)
    800030f4:	00e7b423          	sd	a4,8(a5)
        newUsed->purpose = pur;
    800030f8:	fb043783          	ld	a5,-80(s0)
    800030fc:	fa442703          	lw	a4,-92(s0)
    80003100:	00e7a823          	sw	a4,16(a5)
        newUsed->usableFirstAddress = (char*) newUsed + sizeof(UsedMemSegment);
    80003104:	fb043783          	ld	a5,-80(s0)
    80003108:	02078713          	addi	a4,a5,32
    8000310c:	fb043783          	ld	a5,-80(s0)
    80003110:	00e7bc23          	sd	a4,24(a5)
        UsedMemSegment* prevUsed = nullptr;
    80003114:	fc043c23          	sd	zero,-40(s0)
        for (UsedMemSegment* cur = usedMemHead;
    80003118:	0000a797          	auipc	a5,0xa
    8000311c:	b8078793          	addi	a5,a5,-1152 # 8000cc98 <_ZN15MemoryAllocator11usedMemHeadE>
    80003120:	0007b783          	ld	a5,0(a5)
    80003124:	fcf43823          	sd	a5,-48(s0)
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
    80003128:	fd043783          	ld	a5,-48(s0)
    8000312c:	02078463          	beqz	a5,80003154 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b0>
    80003130:	fd043703          	ld	a4,-48(s0)
    80003134:	fb043783          	ld	a5,-80(s0)
    80003138:	00f77e63          	bgeu	a4,a5,80003154 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b0>
            prevUsed = cur;
    8000313c:	fd043783          	ld	a5,-48(s0)
    80003140:	fcf43c23          	sd	a5,-40(s0)
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
    80003144:	fd043783          	ld	a5,-48(s0)
    80003148:	0007b783          	ld	a5,0(a5)
    8000314c:	fcf43823          	sd	a5,-48(s0)
        for (UsedMemSegment* cur = usedMemHead;
    80003150:	fd9ff06f          	j	80003128 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x184>
        }
        if (!prevUsed) {
    80003154:	fd843783          	ld	a5,-40(s0)
    80003158:	02079663          	bnez	a5,80003184 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1e0>
            newUsed->next = usedMemHead;
    8000315c:	0000a797          	auipc	a5,0xa
    80003160:	b3c78793          	addi	a5,a5,-1220 # 8000cc98 <_ZN15MemoryAllocator11usedMemHeadE>
    80003164:	0007b703          	ld	a4,0(a5)
    80003168:	fb043783          	ld	a5,-80(s0)
    8000316c:	00e7b023          	sd	a4,0(a5)
            usedMemHead = newUsed;
    80003170:	0000a797          	auipc	a5,0xa
    80003174:	b2878793          	addi	a5,a5,-1240 # 8000cc98 <_ZN15MemoryAllocator11usedMemHeadE>
    80003178:	fb043703          	ld	a4,-80(s0)
    8000317c:	00e7b023          	sd	a4,0(a5)
    80003180:	0200006f          	j	800031a0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1fc>
        } else {
            newUsed->next = prevUsed->next;
    80003184:	fd843783          	ld	a5,-40(s0)
    80003188:	0007b703          	ld	a4,0(a5)
    8000318c:	fb043783          	ld	a5,-80(s0)
    80003190:	00e7b023          	sd	a4,0(a5)
            prevUsed->next = newUsed;
    80003194:	fd843783          	ld	a5,-40(s0)
    80003198:	fb043703          	ld	a4,-80(s0)
    8000319c:	00e7b023          	sd	a4,0(a5)
        }
        //return (char*)newUsed + sizeof(UsedMemSegment);
        return newUsed->usableFirstAddress;
    800031a0:	fb043783          	ld	a5,-80(s0)
    800031a4:	0187b783          	ld	a5,24(a5)
    800031a8:	0240006f          	j	800031cc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
        if (firstFit->size < size) continue;
    800031ac:	00000013          	nop
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
    800031b0:	fe043783          	ld	a5,-32(s0)
    800031b4:	fef43423          	sd	a5,-24(s0)
    800031b8:	fe043783          	ld	a5,-32(s0)
    800031bc:	0007b783          	ld	a5,0(a5)
    800031c0:	fef43023          	sd	a5,-32(s0)
    800031c4:	e51ff06f          	j	80003014 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x70>
    }
    return nullptr;
    800031c8:	00000793          	li	a5,0
}
    800031cc:	00078513          	mv	a0,a5
    800031d0:	05813403          	ld	s0,88(sp)
    800031d4:	06010113          	addi	sp,sp,96
    800031d8:	00008067          	ret

00000000800031dc <_ZN15MemoryAllocator5kfreeEPv>:

#pragma GCC optimize("O0")

int MemoryAllocator::kfree(void* ptr) {
    800031dc:	fb010113          	addi	sp,sp,-80
    800031e0:	04113423          	sd	ra,72(sp)
    800031e4:	04813023          	sd	s0,64(sp)
    800031e8:	05010413          	addi	s0,sp,80
    800031ec:	faa43c23          	sd	a0,-72(s0)
    if (!ptr) return 0;
    800031f0:	fb843783          	ld	a5,-72(s0)
    800031f4:	00079663          	bnez	a5,80003200 <_ZN15MemoryAllocator5kfreeEPv+0x24>
    800031f8:	00000793          	li	a5,0
    800031fc:	1740006f          	j	80003370 <_ZN15MemoryAllocator5kfreeEPv+0x194>
    if (!usedMemHead) return -1;
    80003200:	0000a797          	auipc	a5,0xa
    80003204:	a9878793          	addi	a5,a5,-1384 # 8000cc98 <_ZN15MemoryAllocator11usedMemHeadE>
    80003208:	0007b783          	ld	a5,0(a5)
    8000320c:	00079663          	bnez	a5,80003218 <_ZN15MemoryAllocator5kfreeEPv+0x3c>
    80003210:	fff00793          	li	a5,-1
    80003214:	15c0006f          	j	80003370 <_ZN15MemoryAllocator5kfreeEPv+0x194>
    //ptr pokazuje na usableFirstAddress, pre toga je zaglavlje segmenta
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    80003218:	fb843783          	ld	a5,-72(s0)
    8000321c:	fe078793          	addi	a5,a5,-32
    80003220:	faf43c23          	sd	a5,-72(s0)

    //trazenje adrese ptr u listi zauzetih segmenata
    UsedMemSegment* currentUsed = usedMemHead;
    80003224:	0000a797          	auipc	a5,0xa
    80003228:	a7478793          	addi	a5,a5,-1420 # 8000cc98 <_ZN15MemoryAllocator11usedMemHeadE>
    8000322c:	0007b783          	ld	a5,0(a5)
    80003230:	fef43423          	sd	a5,-24(s0)
    UsedMemSegment* prevUsed = nullptr;
    80003234:	fe043023          	sd	zero,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    80003238:	fe843783          	ld	a5,-24(s0)
    8000323c:	02078463          	beqz	a5,80003264 <_ZN15MemoryAllocator5kfreeEPv+0x88>
    80003240:	fe843703          	ld	a4,-24(s0)
    80003244:	fb843783          	ld	a5,-72(s0)
    80003248:	00f70e63          	beq	a4,a5,80003264 <_ZN15MemoryAllocator5kfreeEPv+0x88>
        prevUsed = currentUsed;
    8000324c:	fe843783          	ld	a5,-24(s0)
    80003250:	fef43023          	sd	a5,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    80003254:	fe843783          	ld	a5,-24(s0)
    80003258:	0007b783          	ld	a5,0(a5)
    8000325c:	fef43423          	sd	a5,-24(s0)
    80003260:	fd9ff06f          	j	80003238 <_ZN15MemoryAllocator5kfreeEPv+0x5c>
    }
    if ((char*) currentUsed != (char*) ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80003264:	fe843703          	ld	a4,-24(s0)
    80003268:	fb843783          	ld	a5,-72(s0)
    8000326c:	00f70663          	beq	a4,a5,80003278 <_ZN15MemoryAllocator5kfreeEPv+0x9c>
    80003270:	fff00793          	li	a5,-1
    80003274:	0fc0006f          	j	80003370 <_ZN15MemoryAllocator5kfreeEPv+0x194>

    //izbacivanje iz liste zauzetih segmenata
    if (prevUsed) prevUsed->next = currentUsed->next;
    80003278:	fe043783          	ld	a5,-32(s0)
    8000327c:	00078c63          	beqz	a5,80003294 <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    80003280:	fe843783          	ld	a5,-24(s0)
    80003284:	0007b703          	ld	a4,0(a5)
    80003288:	fe043783          	ld	a5,-32(s0)
    8000328c:	00e7b023          	sd	a4,0(a5)
    80003290:	0180006f          	j	800032a8 <_ZN15MemoryAllocator5kfreeEPv+0xcc>
    else usedMemHead = currentUsed->next;
    80003294:	fe843783          	ld	a5,-24(s0)
    80003298:	0007b703          	ld	a4,0(a5)
    8000329c:	0000a797          	auipc	a5,0xa
    800032a0:	9fc78793          	addi	a5,a5,-1540 # 8000cc98 <_ZN15MemoryAllocator11usedMemHeadE>
    800032a4:	00e7b023          	sd	a4,0(a5)

    //oslobadjanje segmenta i ubacivanje u listu slobodnih
    FreeMemSegment* prevFree = nullptr;
    800032a8:	fc043c23          	sd	zero,-40(s0)
    FreeMemSegment* nextFree = freeMemHead;
    800032ac:	0000a797          	auipc	a5,0xa
    800032b0:	9f478793          	addi	a5,a5,-1548 # 8000cca0 <_ZN15MemoryAllocator11freeMemHeadE>
    800032b4:	0007b783          	ld	a5,0(a5)
    800032b8:	fcf43823          	sd	a5,-48(s0)
    for (; nextFree && (char*) nextFree < (char*) ptr; prevFree = nextFree, nextFree = nextFree->next);
    800032bc:	fd043783          	ld	a5,-48(s0)
    800032c0:	02078463          	beqz	a5,800032e8 <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    800032c4:	fd043703          	ld	a4,-48(s0)
    800032c8:	fb843783          	ld	a5,-72(s0)
    800032cc:	00f77e63          	bgeu	a4,a5,800032e8 <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    800032d0:	fd043783          	ld	a5,-48(s0)
    800032d4:	fcf43c23          	sd	a5,-40(s0)
    800032d8:	fd043783          	ld	a5,-48(s0)
    800032dc:	0007b783          	ld	a5,0(a5)
    800032e0:	fcf43823          	sd	a5,-48(s0)
    800032e4:	fd9ff06f          	j	800032bc <_ZN15MemoryAllocator5kfreeEPv+0xe0>
    FreeMemSegment* newFree = (FreeMemSegment*) ptr;
    800032e8:	fb843783          	ld	a5,-72(s0)
    800032ec:	fcf43423          	sd	a5,-56(s0)
    size_t segmentSize = ((UsedMemSegment*) ptr)->size;
    800032f0:	fb843783          	ld	a5,-72(s0)
    800032f4:	0087b783          	ld	a5,8(a5)
    800032f8:	fcf43023          	sd	a5,-64(s0)
    newFree->size = segmentSize;
    800032fc:	fc843783          	ld	a5,-56(s0)
    80003300:	fc043703          	ld	a4,-64(s0)
    80003304:	00e7b423          	sd	a4,8(a5)
    if (prevFree) {
    80003308:	fd843783          	ld	a5,-40(s0)
    8000330c:	02078263          	beqz	a5,80003330 <_ZN15MemoryAllocator5kfreeEPv+0x154>
        newFree->next = prevFree->next;
    80003310:	fd843783          	ld	a5,-40(s0)
    80003314:	0007b703          	ld	a4,0(a5)
    80003318:	fc843783          	ld	a5,-56(s0)
    8000331c:	00e7b023          	sd	a4,0(a5)
        prevFree->next = newFree;
    80003320:	fd843783          	ld	a5,-40(s0)
    80003324:	fc843703          	ld	a4,-56(s0)
    80003328:	00e7b023          	sd	a4,0(a5)
    8000332c:	0280006f          	j	80003354 <_ZN15MemoryAllocator5kfreeEPv+0x178>
    } else {
        newFree->next = freeMemHead;
    80003330:	0000a797          	auipc	a5,0xa
    80003334:	97078793          	addi	a5,a5,-1680 # 8000cca0 <_ZN15MemoryAllocator11freeMemHeadE>
    80003338:	0007b703          	ld	a4,0(a5)
    8000333c:	fc843783          	ld	a5,-56(s0)
    80003340:	00e7b023          	sd	a4,0(a5)
        freeMemHead = newFree;
    80003344:	0000a797          	auipc	a5,0xa
    80003348:	95c78793          	addi	a5,a5,-1700 # 8000cca0 <_ZN15MemoryAllocator11freeMemHeadE>
    8000334c:	fc843703          	ld	a4,-56(s0)
    80003350:	00e7b023          	sd	a4,0(a5)
    }

    //spajanje uzastopnih slobodnih segmenata
    tryToJoin(newFree);
    80003354:	fc843503          	ld	a0,-56(s0)
    80003358:	00000097          	auipc	ra,0x0
    8000335c:	02c080e7          	jalr	44(ra) # 80003384 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    tryToJoin(prevFree);
    80003360:	fd843503          	ld	a0,-40(s0)
    80003364:	00000097          	auipc	ra,0x0
    80003368:	020080e7          	jalr	32(ra) # 80003384 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    return 0;
    8000336c:	00000793          	li	a5,0
}
    80003370:	00078513          	mv	a0,a5
    80003374:	04813083          	ld	ra,72(sp)
    80003378:	04013403          	ld	s0,64(sp)
    8000337c:	05010113          	addi	sp,sp,80
    80003380:	00008067          	ret

0000000080003384 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:

#pragma GCC optimize("O0")

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    80003384:	fc010113          	addi	sp,sp,-64
    80003388:	02813c23          	sd	s0,56(sp)
    8000338c:	04010413          	addi	s0,sp,64
    80003390:	fca43423          	sd	a0,-56(s0)
    if (!current) return 0;
    80003394:	fc843783          	ld	a5,-56(s0)
    80003398:	00079663          	bnez	a5,800033a4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x20>
    8000339c:	00000793          	li	a5,0
    800033a0:	0a00006f          	j	80003440 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xbc>
    bool nextExists = current->next != nullptr;
    800033a4:	fc843783          	ld	a5,-56(s0)
    800033a8:	0007b783          	ld	a5,0(a5)
    800033ac:	00f037b3          	snez	a5,a5
    800033b0:	fef407a3          	sb	a5,-17(s0)
    char* nextAddr = (char*) current + current->size;
    800033b4:	fc843783          	ld	a5,-56(s0)
    800033b8:	0087b783          	ld	a5,8(a5)
    800033bc:	fc843703          	ld	a4,-56(s0)
    800033c0:	00f707b3          	add	a5,a4,a5
    800033c4:	fef43023          	sd	a5,-32(s0)
    char* cnext = (char*) current->next;
    800033c8:	fc843783          	ld	a5,-56(s0)
    800033cc:	0007b783          	ld	a5,0(a5)
    800033d0:	fcf43c23          	sd	a5,-40(s0)
    bool nextIsConnected = (nextAddr == cnext);
    800033d4:	fe043703          	ld	a4,-32(s0)
    800033d8:	fd843783          	ld	a5,-40(s0)
    800033dc:	40f707b3          	sub	a5,a4,a5
    800033e0:	0017b793          	seqz	a5,a5
    800033e4:	fcf40ba3          	sb	a5,-41(s0)
    if (nextExists && nextIsConnected) {
    800033e8:	fef44783          	lbu	a5,-17(s0)
    800033ec:	0ff7f793          	andi	a5,a5,255
    800033f0:	04078663          	beqz	a5,8000343c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xb8>
    800033f4:	fd744783          	lbu	a5,-41(s0)
    800033f8:	0ff7f793          	andi	a5,a5,255
    800033fc:	04078063          	beqz	a5,8000343c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xb8>
        current->size += current->next->size;
    80003400:	fc843783          	ld	a5,-56(s0)
    80003404:	0087b703          	ld	a4,8(a5)
    80003408:	fc843783          	ld	a5,-56(s0)
    8000340c:	0007b783          	ld	a5,0(a5)
    80003410:	0087b783          	ld	a5,8(a5)
    80003414:	00f70733          	add	a4,a4,a5
    80003418:	fc843783          	ld	a5,-56(s0)
    8000341c:	00e7b423          	sd	a4,8(a5)
        current->next = current->next->next;
    80003420:	fc843783          	ld	a5,-56(s0)
    80003424:	0007b783          	ld	a5,0(a5)
    80003428:	0007b703          	ld	a4,0(a5)
    8000342c:	fc843783          	ld	a5,-56(s0)
    80003430:	00e7b023          	sd	a4,0(a5)
        return 1;
    80003434:	00100793          	li	a5,1
    80003438:	0080006f          	j	80003440 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xbc>
    } else return 0;
    8000343c:	00000793          	li	a5,0
}
    80003440:	00078513          	mv	a0,a5
    80003444:	03813403          	ld	s0,56(sp)
    80003448:	04010113          	addi	sp,sp,64
    8000344c:	00008067          	ret

0000000080003450 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>:

bool MemoryAllocator::checkPurpose(void* ptr, MemoryAllocator::Purpose p) {
    80003450:	fe010113          	addi	sp,sp,-32
    80003454:	00813c23          	sd	s0,24(sp)
    80003458:	02010413          	addi	s0,sp,32
    8000345c:	fea43423          	sd	a0,-24(s0)
    80003460:	00058793          	mv	a5,a1
    80003464:	fef42223          	sw	a5,-28(s0)
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    80003468:	fe843783          	ld	a5,-24(s0)
    8000346c:	fe078793          	addi	a5,a5,-32
    80003470:	fef43423          	sd	a5,-24(s0)
    return ((UsedMemSegment*) ptr)->purpose == p;
    80003474:	fe843783          	ld	a5,-24(s0)
    80003478:	0107a703          	lw	a4,16(a5)
    8000347c:	fe442783          	lw	a5,-28(s0)
    80003480:	0007879b          	sext.w	a5,a5
    80003484:	40e787b3          	sub	a5,a5,a4
    80003488:	0017b793          	seqz	a5,a5
    8000348c:	0ff7f793          	andi	a5,a5,255
}
    80003490:	00078513          	mv	a0,a5
    80003494:	01813403          	ld	s0,24(sp)
    80003498:	02010113          	addi	sp,sp,32
    8000349c:	00008067          	ret

00000000800034a0 <_ZN15MemoryAllocator19initMemoryAllocatorEv>:

void MemoryAllocator::initMemoryAllocator() {
    800034a0:	ff010113          	addi	sp,sp,-16
    800034a4:	00813423          	sd	s0,8(sp)
    800034a8:	01010413          	addi	s0,sp,16
//pocetna inicijalizacija
    if (!initialized) {
    800034ac:	00009797          	auipc	a5,0x9
    800034b0:	7fc78793          	addi	a5,a5,2044 # 8000cca8 <_ZN15MemoryAllocator11initializedE>
    800034b4:	0007c783          	lbu	a5,0(a5)
    800034b8:	0017c793          	xori	a5,a5,1
    800034bc:	0ff7f793          	andi	a5,a5,255
    800034c0:	06078a63          	beqz	a5,80003534 <_ZN15MemoryAllocator19initMemoryAllocatorEv+0x94>
        freeMemHead = (FreeMemSegment*) HEAP_START_ADDR;
    800034c4:	00009797          	auipc	a5,0x9
    800034c8:	61c7b783          	ld	a5,1564(a5) # 8000cae0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800034cc:	0007b703          	ld	a4,0(a5)
    800034d0:	00009797          	auipc	a5,0x9
    800034d4:	7d078793          	addi	a5,a5,2000 # 8000cca0 <_ZN15MemoryAllocator11freeMemHeadE>
    800034d8:	00e7b023          	sd	a4,0(a5)
        freeMemHead->next = nullptr;
    800034dc:	00009797          	auipc	a5,0x9
    800034e0:	7c478793          	addi	a5,a5,1988 # 8000cca0 <_ZN15MemoryAllocator11freeMemHeadE>
    800034e4:	0007b783          	ld	a5,0(a5)
    800034e8:	0007b023          	sd	zero,0(a5)
        //freeMemHead->prev = nullptr;
        freeMemHead->size = (char*) HEAP_END_ADDR - (char*) HEAP_START_ADDR;//- sizeof(FreeMemSegment);
    800034ec:	00009797          	auipc	a5,0x9
    800034f0:	62c7b783          	ld	a5,1580(a5) # 8000cb18 <_GLOBAL_OFFSET_TABLE_+0x60>
    800034f4:	0007b703          	ld	a4,0(a5)
    800034f8:	00009797          	auipc	a5,0x9
    800034fc:	5e87b783          	ld	a5,1512(a5) # 8000cae0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003500:	0007b783          	ld	a5,0(a5)
    80003504:	40f70733          	sub	a4,a4,a5
    80003508:	00009797          	auipc	a5,0x9
    8000350c:	79878793          	addi	a5,a5,1944 # 8000cca0 <_ZN15MemoryAllocator11freeMemHeadE>
    80003510:	0007b783          	ld	a5,0(a5)
    80003514:	00e7b423          	sd	a4,8(a5)
        usedMemHead = nullptr;
    80003518:	00009797          	auipc	a5,0x9
    8000351c:	78078793          	addi	a5,a5,1920 # 8000cc98 <_ZN15MemoryAllocator11usedMemHeadE>
    80003520:	0007b023          	sd	zero,0(a5)

        initialized = true;
    80003524:	00009797          	auipc	a5,0x9
    80003528:	78478793          	addi	a5,a5,1924 # 8000cca8 <_ZN15MemoryAllocator11initializedE>
    8000352c:	00100713          	li	a4,1
    80003530:	00e78023          	sb	a4,0(a5)
    }
}
    80003534:	00000013          	nop
    80003538:	00813403          	ld	s0,8(sp)
    8000353c:	01010113          	addi	sp,sp,16
    80003540:	00008067          	ret

0000000080003544 <_ZN4KSemnwEm>:

#include "../h/KSem.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void* KSem::operator new(size_t size) {
    80003544:	ff010113          	addi	sp,sp,-16
    80003548:	00113423          	sd	ra,8(sp)
    8000354c:	00813023          	sd	s0,0(sp)
    80003550:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80003554:	ffffe097          	auipc	ra,0xffffe
    80003558:	dbc080e7          	jalr	-580(ra) # 80001310 <_Z9mem_allocm>
	//return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::SEMAPHORE);
}
    8000355c:	00813083          	ld	ra,8(sp)
    80003560:	00013403          	ld	s0,0(sp)
    80003564:	01010113          	addi	sp,sp,16
    80003568:	00008067          	ret

000000008000356c <_ZN4KSemdlEPv>:

void KSem::operator delete(void* ptr) {
    8000356c:	ff010113          	addi	sp,sp,-16
    80003570:	00113423          	sd	ra,8(sp)
    80003574:	00813023          	sd	s0,0(sp)
    80003578:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    8000357c:	ffffe097          	auipc	ra,0xffffe
    80003580:	dd4080e7          	jalr	-556(ra) # 80001350 <_Z8mem_freePv>
	//MemoryAllocator::kfree(ptr);
}
    80003584:	00813083          	ld	ra,8(sp)
    80003588:	00013403          	ld	s0,0(sp)
    8000358c:	01010113          	addi	sp,sp,16
    80003590:	00008067          	ret

0000000080003594 <_ZN4KSem7initSemEj>:

KSem* KSem::initSem(uint val) {
    80003594:	fe010113          	addi	sp,sp,-32
    80003598:	00113c23          	sd	ra,24(sp)
    8000359c:	00813823          	sd	s0,16(sp)
    800035a0:	00913423          	sd	s1,8(sp)
    800035a4:	02010413          	addi	s0,sp,32
    800035a8:	00050493          	mv	s1,a0
	return new KSem(val);
    800035ac:	02000513          	li	a0,32
    800035b0:	00000097          	auipc	ra,0x0
    800035b4:	f94080e7          	jalr	-108(ra) # 80003544 <_ZN4KSemnwEm>
	void block();

	void unblock();

private:
	KSem(uint val) : val(val), working(true) {}
    800035b8:	00952023          	sw	s1,0(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    800035bc:	00053423          	sd	zero,8(a0)
    800035c0:	00053823          	sd	zero,16(a0)
    800035c4:	00100713          	li	a4,1
    800035c8:	00e50c23          	sb	a4,24(a0)
}
    800035cc:	01813083          	ld	ra,24(sp)
    800035d0:	01013403          	ld	s0,16(sp)
    800035d4:	00813483          	ld	s1,8(sp)
    800035d8:	02010113          	addi	sp,sp,32
    800035dc:	00008067          	ret

00000000800035e0 <_ZN4KSem5blockEv>:
		unblock();
	}
	return 0;
}

void KSem::block() {
    800035e0:	ff010113          	addi	sp,sp,-16
    800035e4:	00113423          	sd	ra,8(sp)
    800035e8:	00813023          	sd	s0,0(sp)
    800035ec:	01010413          	addi	s0,sp,16
	//TCB::running->setBlocked(true);
    TCB::running->setStatus(TCB::BLOCKED);
    800035f0:	00009797          	auipc	a5,0x9
    800035f4:	5207b783          	ld	a5,1312(a5) # 8000cb10 <_GLOBAL_OFFSET_TABLE_+0x58>
    800035f8:	0007b583          	ld	a1,0(a5)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    800035fc:	00200793          	li	a5,2
    80003600:	04f5ac23          	sw	a5,88(a1)
	blocked.putLast(TCB::running);
    80003604:	00850513          	addi	a0,a0,8
    80003608:	ffffe097          	auipc	ra,0xffffe
    8000360c:	c3c080e7          	jalr	-964(ra) # 80001244 <_ZN11ThreadQueue7putLastEP3TCB>
	TCB::yield();
    80003610:	fffff097          	auipc	ra,0xfffff
    80003614:	74c080e7          	jalr	1868(ra) # 80002d5c <_ZN3TCB5yieldEv>
}
    80003618:	00813083          	ld	ra,8(sp)
    8000361c:	00013403          	ld	s0,0(sp)
    80003620:	01010113          	addi	sp,sp,16
    80003624:	00008067          	ret

0000000080003628 <_ZN4KSem4waitEv>:
	if (!working) return -3;
    80003628:	01854783          	lbu	a5,24(a0)
    8000362c:	04078663          	beqz	a5,80003678 <_ZN4KSem4waitEv+0x50>
	if (--val < 0) {
    80003630:	00052783          	lw	a5,0(a0)
    80003634:	fff7879b          	addiw	a5,a5,-1
    80003638:	00f52023          	sw	a5,0(a0)
    8000363c:	02079713          	slli	a4,a5,0x20
    80003640:	00074663          	bltz	a4,8000364c <_ZN4KSem4waitEv+0x24>
	return 0;
    80003644:	00000513          	li	a0,0
}
    80003648:	00008067          	ret
int KSem::wait() {
    8000364c:	ff010113          	addi	sp,sp,-16
    80003650:	00113423          	sd	ra,8(sp)
    80003654:	00813023          	sd	s0,0(sp)
    80003658:	01010413          	addi	s0,sp,16
		block();
    8000365c:	00000097          	auipc	ra,0x0
    80003660:	f84080e7          	jalr	-124(ra) # 800035e0 <_ZN4KSem5blockEv>
		return -1;
    80003664:	fff00513          	li	a0,-1
}
    80003668:	00813083          	ld	ra,8(sp)
    8000366c:	00013403          	ld	s0,0(sp)
    80003670:	01010113          	addi	sp,sp,16
    80003674:	00008067          	ret
	if (!working) return -3;
    80003678:	ffd00513          	li	a0,-3
    8000367c:	00008067          	ret

0000000080003680 <_ZN4KSem7unblockEv>:

void KSem::unblock() {
    80003680:	ff010113          	addi	sp,sp,-16
    80003684:	00113423          	sd	ra,8(sp)
    80003688:	00813023          	sd	s0,0(sp)
    8000368c:	01010413          	addi	s0,sp,16
	TCB* tcb = blocked.getFirst();
    80003690:	00850513          	addi	a0,a0,8
    80003694:	ffffe097          	auipc	ra,0xffffe
    80003698:	c1c080e7          	jalr	-996(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
    8000369c:	00100793          	li	a5,1
    800036a0:	04f52c23          	sw	a5,88(a0)
	//tcb->setBlocked(false);
    tcb->setStatus(TCB::ACTIVE);
	Scheduler::put(tcb);
    800036a4:	ffffe097          	auipc	ra,0xffffe
    800036a8:	3ac080e7          	jalr	940(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
}
    800036ac:	00813083          	ld	ra,8(sp)
    800036b0:	00013403          	ld	s0,0(sp)
    800036b4:	01010113          	addi	sp,sp,16
    800036b8:	00008067          	ret

00000000800036bc <_ZN4KSem6signalEv>:
	if (!working) return -3;
    800036bc:	01854783          	lbu	a5,24(a0)
    800036c0:	04078463          	beqz	a5,80003708 <_ZN4KSem6signalEv+0x4c>
	if (val++ < 0) {
    800036c4:	00052783          	lw	a5,0(a0)
    800036c8:	0017871b          	addiw	a4,a5,1
    800036cc:	00e52023          	sw	a4,0(a0)
    800036d0:	0007c663          	bltz	a5,800036dc <_ZN4KSem6signalEv+0x20>
	return 0;
    800036d4:	00000513          	li	a0,0
}
    800036d8:	00008067          	ret
int KSem::signal() {
    800036dc:	ff010113          	addi	sp,sp,-16
    800036e0:	00113423          	sd	ra,8(sp)
    800036e4:	00813023          	sd	s0,0(sp)
    800036e8:	01010413          	addi	s0,sp,16
		unblock();
    800036ec:	00000097          	auipc	ra,0x0
    800036f0:	f94080e7          	jalr	-108(ra) # 80003680 <_ZN4KSem7unblockEv>
	return 0;
    800036f4:	00000513          	li	a0,0
}
    800036f8:	00813083          	ld	ra,8(sp)
    800036fc:	00013403          	ld	s0,0(sp)
    80003700:	01010113          	addi	sp,sp,16
    80003704:	00008067          	ret
	if (!working) return -3;
    80003708:	ffd00513          	li	a0,-3
    8000370c:	00008067          	ret

0000000080003710 <_ZN4KSem8closeSemEPS_>:

int KSem::closeSem(sem_t handle) {
    80003710:	fe010113          	addi	sp,sp,-32
    80003714:	00113c23          	sd	ra,24(sp)
    80003718:	00813823          	sd	s0,16(sp)
    8000371c:	00913423          	sd	s1,8(sp)
    80003720:	02010413          	addi	s0,sp,32
    80003724:	00050493          	mv	s1,a0
	//if (!MemoryAllocator::checkPurpose(handle, MemoryAllocator::SEMAPHORE)) return -2;
	handle->working = false;
    80003728:	00050c23          	sb	zero,24(a0)
        bool ret = front == nullptr;
    8000372c:	0084b783          	ld	a5,8(s1)
	while (!handle->blocked.isEmpty()) {
    80003730:	02078263          	beqz	a5,80003754 <_ZN4KSem8closeSemEPS_+0x44>
		TCB* tcb = handle->blocked.getFirst();
    80003734:	00848513          	addi	a0,s1,8
    80003738:	ffffe097          	auipc	ra,0xffffe
    8000373c:	b78080e7          	jalr	-1160(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
    80003740:	00100793          	li	a5,1
    80003744:	04f52c23          	sw	a5,88(a0)
		//tcb->setBlocked(false);
        tcb->setStatus(TCB::ACTIVE);
		Scheduler::put(tcb);
    80003748:	ffffe097          	auipc	ra,0xffffe
    8000374c:	308080e7          	jalr	776(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
	while (!handle->blocked.isEmpty()) {
    80003750:	fddff06f          	j	8000372c <_ZN4KSem8closeSemEPS_+0x1c>
	}
	return 0;
}
    80003754:	00000513          	li	a0,0
    80003758:	01813083          	ld	ra,24(sp)
    8000375c:	01013403          	ld	s0,16(sp)
    80003760:	00813483          	ld	s1,8(sp)
    80003764:	02010113          	addi	sp,sp,32
    80003768:	00008067          	ret

000000008000376c <_Z10testMemoryv>:
    return pok;
}

#pragma GCC optimize("O0")

void testMemory() {
    8000376c:	e6010113          	addi	sp,sp,-416
    80003770:	18113c23          	sd	ra,408(sp)
    80003774:	18813823          	sd	s0,400(sp)
    80003778:	1a010413          	addi	s0,sp,416
    char* pokazivaci[50];
    pokazivaci[0] = nullptr;
    8000377c:	e6043023          	sd	zero,-416(s0)
    pokazivaci[0] = upisi(1024 + 768);
    80003780:	70000513          	li	a0,1792
    80003784:	00000097          	auipc	ra,0x0
    80003788:	1f8080e7          	jalr	504(ra) # 8000397c <_Z5upisim>
    8000378c:	00050793          	mv	a5,a0
    80003790:	e6f43023          	sd	a5,-416(s0)
    if (pokazivaci[0]) {
    80003794:	e6043783          	ld	a5,-416(s0)
    80003798:	02078c63          	beqz	a5,800037d0 <_Z10testMemoryv+0x64>
        if (pokazivaci[0][0] == '8') {
    8000379c:	e6043783          	ld	a5,-416(s0)
    800037a0:	0007c783          	lbu	a5,0(a5)
    800037a4:	00078713          	mv	a4,a5
    800037a8:	03800793          	li	a5,56
    800037ac:	00f71a63          	bne	a4,a5,800037c0 <_Z10testMemoryv+0x54>
            printString("nea");
    800037b0:	00007517          	auipc	a0,0x7
    800037b4:	a5050513          	addi	a0,a0,-1456 # 8000a200 <_ZZ9kPrintIntmE6digits+0x190>
    800037b8:	00002097          	auipc	ra,0x2
    800037bc:	6b4080e7          	jalr	1716(ra) # 80005e6c <_Z11printStringPKc>
        }
        MemoryAllocator::kfree(pokazivaci[0]);
    800037c0:	e6043783          	ld	a5,-416(s0)
    800037c4:	00078513          	mv	a0,a5
    800037c8:	00000097          	auipc	ra,0x0
    800037cc:	a14080e7          	jalr	-1516(ra) # 800031dc <_ZN15MemoryAllocator5kfreeEPv>
    }


    pokazivaci[0] = upisi(4096);
    800037d0:	00001537          	lui	a0,0x1
    800037d4:	00000097          	auipc	ra,0x0
    800037d8:	1a8080e7          	jalr	424(ra) # 8000397c <_Z5upisim>
    800037dc:	00050793          	mv	a5,a0
    800037e0:	e6f43023          	sd	a5,-416(s0)
    if (pokazivaci[0]) {
    800037e4:	e6043783          	ld	a5,-416(s0)
    800037e8:	00078a63          	beqz	a5,800037fc <_Z10testMemoryv+0x90>
        MemoryAllocator::kfree(pokazivaci[0]);
    800037ec:	e6043783          	ld	a5,-416(s0)
    800037f0:	00078513          	mv	a0,a5
    800037f4:	00000097          	auipc	ra,0x0
    800037f8:	9e8080e7          	jalr	-1560(ra) # 800031dc <_ZN15MemoryAllocator5kfreeEPv>
    }

    pokazivaci[0] = upisi(1024 + 768);
    800037fc:	70000513          	li	a0,1792
    80003800:	00000097          	auipc	ra,0x0
    80003804:	17c080e7          	jalr	380(ra) # 8000397c <_Z5upisim>
    80003808:	00050793          	mv	a5,a0
    8000380c:	e6f43023          	sd	a5,-416(s0)
    MemoryAllocator::kfree(pokazivaci[0]);
    80003810:	e6043783          	ld	a5,-416(s0)
    80003814:	00078513          	mv	a0,a5
    80003818:	00000097          	auipc	ra,0x0
    8000381c:	9c4080e7          	jalr	-1596(ra) # 800031dc <_ZN15MemoryAllocator5kfreeEPv>

}
    80003820:	00000013          	nop
    80003824:	19813083          	ld	ra,408(sp)
    80003828:	19013403          	ld	s0,400(sp)
    8000382c:	1a010113          	addi	sp,sp,416
    80003830:	00008067          	ret

0000000080003834 <_Z5nit1fPv>:

void nit1f(void*) {
    80003834:	fe010113          	addi	sp,sp,-32
    80003838:	00113c23          	sd	ra,24(sp)
    8000383c:	00813823          	sd	s0,16(sp)
    80003840:	02010413          	addi	s0,sp,32
    80003844:	fea43423          	sd	a0,-24(s0)
//		printString("\nsem_wait za nit 1 vratio ");
//		printInteger(res);
//		printString("\n");
//	}

    printString("\nGotova nit 1\n");
    80003848:	00007517          	auipc	a0,0x7
    8000384c:	9c050513          	addi	a0,a0,-1600 # 8000a208 <_ZZ9kPrintIntmE6digits+0x198>
    80003850:	00002097          	auipc	ra,0x2
    80003854:	61c080e7          	jalr	1564(ra) # 80005e6c <_Z11printStringPKc>
}
    80003858:	00000013          	nop
    8000385c:	01813083          	ld	ra,24(sp)
    80003860:	01013403          	ld	s0,16(sp)
    80003864:	02010113          	addi	sp,sp,32
    80003868:	00008067          	ret

000000008000386c <_Z5nit2fPv>:

void nit2f(void* arg2) {
    8000386c:	fe010113          	addi	sp,sp,-32
    80003870:	00113c23          	sd	ra,24(sp)
    80003874:	00813823          	sd	s0,16(sp)
    80003878:	02010413          	addi	s0,sp,32
    8000387c:	fea43423          	sd	a0,-24(s0)
//		//sem_close(semA);
//		printString("\nNit 2 ubija semafor\n");
//		delete semA;
//
//	}
    printString("\nGotova nit 2\n");
    80003880:	00007517          	auipc	a0,0x7
    80003884:	99850513          	addi	a0,a0,-1640 # 8000a218 <_ZZ9kPrintIntmE6digits+0x1a8>
    80003888:	00002097          	auipc	ra,0x2
    8000388c:	5e4080e7          	jalr	1508(ra) # 80005e6c <_Z11printStringPKc>
}
    80003890:	00000013          	nop
    80003894:	01813083          	ld	ra,24(sp)
    80003898:	01013403          	ld	s0,16(sp)
    8000389c:	02010113          	addi	sp,sp,32
    800038a0:	00008067          	ret

00000000800038a4 <_Z5nit3fPv>:


void nit3f(void*) {
    800038a4:	fd010113          	addi	sp,sp,-48
    800038a8:	02113423          	sd	ra,40(sp)
    800038ac:	02813023          	sd	s0,32(sp)
    800038b0:	03010413          	addi	s0,sp,48
    800038b4:	fca43c23          	sd	a0,-40(s0)
    char slovo;
    do {
        slovo = getc();
    800038b8:	ffffe097          	auipc	ra,0xffffe
    800038bc:	cb0080e7          	jalr	-848(ra) # 80001568 <_Z4getcv>
    800038c0:	00050793          	mv	a5,a0
    800038c4:	fef407a3          	sb	a5,-17(s0)
        putc(slovo);
    800038c8:	fef44783          	lbu	a5,-17(s0)
    800038cc:	00078513          	mv	a0,a5
    800038d0:	ffffe097          	auipc	ra,0xffffe
    800038d4:	cc0080e7          	jalr	-832(ra) # 80001590 <_Z4putcc>
        if (slovo == '\r') putc('\n');
    800038d8:	fef44783          	lbu	a5,-17(s0)
    800038dc:	0ff7f713          	andi	a4,a5,255
    800038e0:	00d00793          	li	a5,13
    800038e4:	00f71863          	bne	a4,a5,800038f4 <_Z5nit3fPv+0x50>
    800038e8:	00a00513          	li	a0,10
    800038ec:	ffffe097          	auipc	ra,0xffffe
    800038f0:	ca4080e7          	jalr	-860(ra) # 80001590 <_Z4putcc>
    } while (slovo != '0');
    800038f4:	fef44783          	lbu	a5,-17(s0)
    800038f8:	0ff7f713          	andi	a4,a5,255
    800038fc:	03000793          	li	a5,48
    80003900:	00f70463          	beq	a4,a5,80003908 <_Z5nit3fPv+0x64>
    do {
    80003904:	fb5ff06f          	j	800038b8 <_Z5nit3fPv+0x14>

    printString("\nGotova nit3\n");
    80003908:	00007517          	auipc	a0,0x7
    8000390c:	92050513          	addi	a0,a0,-1760 # 8000a228 <_ZZ9kPrintIntmE6digits+0x1b8>
    80003910:	00002097          	auipc	ra,0x2
    80003914:	55c080e7          	jalr	1372(ra) # 80005e6c <_Z11printStringPKc>
}
    80003918:	00000013          	nop
    8000391c:	02813083          	ld	ra,40(sp)
    80003920:	02013403          	ld	s0,32(sp)
    80003924:	03010113          	addi	sp,sp,48
    80003928:	00008067          	ret

000000008000392c <_Z8testMainv>:

int testMain() {
    8000392c:	ff010113          	addi	sp,sp,-16
    80003930:	00113423          	sd	ra,8(sp)
    80003934:	00813023          	sd	s0,0(sp)
    80003938:	01010413          	addi	s0,sp,16
//postavi adresu prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    8000393c:	00009797          	auipc	a5,0x9
    80003940:	1e47b783          	ld	a5,484(a5) # 8000cb20 <_GLOBAL_OFFSET_TABLE_+0x68>
    80003944:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    MemoryAllocator::initMemoryAllocator();
    80003948:	00000097          	auipc	ra,0x0
    8000394c:	b58080e7          	jalr	-1192(ra) # 800034a0 <_ZN15MemoryAllocator19initMemoryAllocatorEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    80003950:	ffffe097          	auipc	ra,0xffffe
    80003954:	d10080e7          	jalr	-752(ra) # 80001660 <_ZN8KConsole12initKConsoleEv>
//	printString("\nGotove user niti\n");
//
//	printString("\nSad cu da izadjem\n");
//	while(KConsole::outputHead!=KConsole::outputTail){}
//	//zabrani prekide
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    80003958:	00200513          	li	a0,2
    8000395c:	00000097          	auipc	ra,0x0
    80003960:	07c080e7          	jalr	124(ra) # 800039d8 <_ZN5Riscv10mc_sstatusEm>


    return 0;
    80003964:	00000793          	li	a5,0
    80003968:	00078513          	mv	a0,a5
    8000396c:	00813083          	ld	ra,8(sp)
    80003970:	00013403          	ld	s0,0(sp)
    80003974:	01010113          	addi	sp,sp,16
    80003978:	00008067          	ret

000000008000397c <_Z5upisim>:
char* upisi(size_t alociraj) {
    8000397c:	fe010113          	addi	sp,sp,-32
    80003980:	00113c23          	sd	ra,24(sp)
    80003984:	00813823          	sd	s0,16(sp)
    80003988:	00913423          	sd	s1,8(sp)
    8000398c:	02010413          	addi	s0,sp,32
    80003990:	00050493          	mv	s1,a0
    char* pok = (char*) MemoryAllocator::kmalloc(alociraj);
    80003994:	00300593          	li	a1,3
    80003998:	fffff097          	auipc	ra,0xfffff
    8000399c:	60c080e7          	jalr	1548(ra) # 80002fa4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
    if (pok) {
    800039a0:	02050263          	beqz	a0,800039c4 <_Z5upisim+0x48>
        for (uint64 i = 0; i < alociraj - sizeof(MemoryAllocator::UsedMemSegment); i++) {
    800039a4:	00000793          	li	a5,0
    800039a8:	0140006f          	j	800039bc <_Z5upisim+0x40>
            pok[i] = '8';
    800039ac:	00f50733          	add	a4,a0,a5
    800039b0:	03800693          	li	a3,56
    800039b4:	00d70023          	sb	a3,0(a4)
        for (uint64 i = 0; i < alociraj - sizeof(MemoryAllocator::UsedMemSegment); i++) {
    800039b8:	00178793          	addi	a5,a5,1
    800039bc:	fe048713          	addi	a4,s1,-32
    800039c0:	fee7e6e3          	bltu	a5,a4,800039ac <_Z5upisim+0x30>
}
    800039c4:	01813083          	ld	ra,24(sp)
    800039c8:	01013403          	ld	s0,16(sp)
    800039cc:	00813483          	ld	s1,8(sp)
    800039d0:	02010113          	addi	sp,sp,32
    800039d4:	00008067          	ret

00000000800039d8 <_ZN5Riscv10mc_sstatusEm>:
inline void Riscv::mc_sstatus(uint64 mask) {
    800039d8:	ff010113          	addi	sp,sp,-16
    800039dc:	00813423          	sd	s0,8(sp)
    800039e0:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    800039e4:	10053073          	csrc	sstatus,a0
}
    800039e8:	00813403          	ld	s0,8(sp)
    800039ec:	01010113          	addi	sp,sp,16
    800039f0:	00008067          	ret

00000000800039f4 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    800039f4:	fe010113          	addi	sp,sp,-32
    800039f8:	00113c23          	sd	ra,24(sp)
    800039fc:	00813823          	sd	s0,16(sp)
    80003a00:	00913423          	sd	s1,8(sp)
    80003a04:	01213023          	sd	s2,0(sp)
    80003a08:	02010413          	addi	s0,sp,32
    80003a0c:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80003a10:	00000913          	li	s2,0
    80003a14:	00c0006f          	j	80003a20 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003a18:	ffffe097          	auipc	ra,0xffffe
    80003a1c:	a10080e7          	jalr	-1520(ra) # 80001428 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
    80003a20:	ffffe097          	auipc	ra,0xffffe
    80003a24:	b48080e7          	jalr	-1208(ra) # 80001568 <_Z4getcv>
    80003a28:	0005059b          	sext.w	a1,a0
    80003a2c:	02d00793          	li	a5,45
    80003a30:	02f58a63          	beq	a1,a5,80003a64 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80003a34:	0084b503          	ld	a0,8(s1)
    80003a38:	00003097          	auipc	ra,0x3
    80003a3c:	400080e7          	jalr	1024(ra) # 80006e38 <_ZN6Buffer3putEi>
        i++;
    80003a40:	0019071b          	addiw	a4,s2,1
    80003a44:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003a48:	0004a683          	lw	a3,0(s1)
    80003a4c:	0026979b          	slliw	a5,a3,0x2
    80003a50:	00d787bb          	addw	a5,a5,a3
    80003a54:	0017979b          	slliw	a5,a5,0x1
    80003a58:	02f767bb          	remw	a5,a4,a5
    80003a5c:	fc0792e3          	bnez	a5,80003a20 <_ZL16producerKeyboardPv+0x2c>
    80003a60:	fb9ff06f          	j	80003a18 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80003a64:	00100793          	li	a5,1
    80003a68:	00009717          	auipc	a4,0x9
    80003a6c:	24f72423          	sw	a5,584(a4) # 8000ccb0 <_ZL9threadEnd>
    data->buffer->put('!');
    80003a70:	02100593          	li	a1,33
    80003a74:	0084b503          	ld	a0,8(s1)
    80003a78:	00003097          	auipc	ra,0x3
    80003a7c:	3c0080e7          	jalr	960(ra) # 80006e38 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80003a80:	0104b503          	ld	a0,16(s1)
    80003a84:	ffffe097          	auipc	ra,0xffffe
    80003a88:	ab4080e7          	jalr	-1356(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    80003a8c:	01813083          	ld	ra,24(sp)
    80003a90:	01013403          	ld	s0,16(sp)
    80003a94:	00813483          	ld	s1,8(sp)
    80003a98:	00013903          	ld	s2,0(sp)
    80003a9c:	02010113          	addi	sp,sp,32
    80003aa0:	00008067          	ret

0000000080003aa4 <_ZL8producerPv>:

static void producer(void *arg) {
    80003aa4:	fe010113          	addi	sp,sp,-32
    80003aa8:	00113c23          	sd	ra,24(sp)
    80003aac:	00813823          	sd	s0,16(sp)
    80003ab0:	00913423          	sd	s1,8(sp)
    80003ab4:	01213023          	sd	s2,0(sp)
    80003ab8:	02010413          	addi	s0,sp,32
    80003abc:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003ac0:	00000913          	li	s2,0
    80003ac4:	00c0006f          	j	80003ad0 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003ac8:	ffffe097          	auipc	ra,0xffffe
    80003acc:	960080e7          	jalr	-1696(ra) # 80001428 <_Z15thread_dispatchv>
    while (!threadEnd) {
    80003ad0:	00009797          	auipc	a5,0x9
    80003ad4:	1e07a783          	lw	a5,480(a5) # 8000ccb0 <_ZL9threadEnd>
    80003ad8:	02079e63          	bnez	a5,80003b14 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80003adc:	0004a583          	lw	a1,0(s1)
    80003ae0:	0305859b          	addiw	a1,a1,48
    80003ae4:	0084b503          	ld	a0,8(s1)
    80003ae8:	00003097          	auipc	ra,0x3
    80003aec:	350080e7          	jalr	848(ra) # 80006e38 <_ZN6Buffer3putEi>
        i++;
    80003af0:	0019071b          	addiw	a4,s2,1
    80003af4:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003af8:	0004a683          	lw	a3,0(s1)
    80003afc:	0026979b          	slliw	a5,a3,0x2
    80003b00:	00d787bb          	addw	a5,a5,a3
    80003b04:	0017979b          	slliw	a5,a5,0x1
    80003b08:	02f767bb          	remw	a5,a4,a5
    80003b0c:	fc0792e3          	bnez	a5,80003ad0 <_ZL8producerPv+0x2c>
    80003b10:	fb9ff06f          	j	80003ac8 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80003b14:	0104b503          	ld	a0,16(s1)
    80003b18:	ffffe097          	auipc	ra,0xffffe
    80003b1c:	a20080e7          	jalr	-1504(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    80003b20:	01813083          	ld	ra,24(sp)
    80003b24:	01013403          	ld	s0,16(sp)
    80003b28:	00813483          	ld	s1,8(sp)
    80003b2c:	00013903          	ld	s2,0(sp)
    80003b30:	02010113          	addi	sp,sp,32
    80003b34:	00008067          	ret

0000000080003b38 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80003b38:	fd010113          	addi	sp,sp,-48
    80003b3c:	02113423          	sd	ra,40(sp)
    80003b40:	02813023          	sd	s0,32(sp)
    80003b44:	00913c23          	sd	s1,24(sp)
    80003b48:	01213823          	sd	s2,16(sp)
    80003b4c:	01313423          	sd	s3,8(sp)
    80003b50:	03010413          	addi	s0,sp,48
    80003b54:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003b58:	00000993          	li	s3,0
    80003b5c:	01c0006f          	j	80003b78 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80003b60:	ffffe097          	auipc	ra,0xffffe
    80003b64:	8c8080e7          	jalr	-1848(ra) # 80001428 <_Z15thread_dispatchv>
    80003b68:	0500006f          	j	80003bb8 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80003b6c:	00a00513          	li	a0,10
    80003b70:	ffffe097          	auipc	ra,0xffffe
    80003b74:	a20080e7          	jalr	-1504(ra) # 80001590 <_Z4putcc>
    while (!threadEnd) {
    80003b78:	00009797          	auipc	a5,0x9
    80003b7c:	1387a783          	lw	a5,312(a5) # 8000ccb0 <_ZL9threadEnd>
    80003b80:	06079063          	bnez	a5,80003be0 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    80003b84:	00893503          	ld	a0,8(s2)
    80003b88:	00003097          	auipc	ra,0x3
    80003b8c:	340080e7          	jalr	832(ra) # 80006ec8 <_ZN6Buffer3getEv>
        i++;
    80003b90:	0019849b          	addiw	s1,s3,1
    80003b94:	0004899b          	sext.w	s3,s1
        putc(key);
    80003b98:	0ff57513          	andi	a0,a0,255
    80003b9c:	ffffe097          	auipc	ra,0xffffe
    80003ba0:	9f4080e7          	jalr	-1548(ra) # 80001590 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80003ba4:	00092703          	lw	a4,0(s2)
    80003ba8:	0027179b          	slliw	a5,a4,0x2
    80003bac:	00e787bb          	addw	a5,a5,a4
    80003bb0:	02f4e7bb          	remw	a5,s1,a5
    80003bb4:	fa0786e3          	beqz	a5,80003b60 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80003bb8:	05000793          	li	a5,80
    80003bbc:	02f4e4bb          	remw	s1,s1,a5
    80003bc0:	fa049ce3          	bnez	s1,80003b78 <_ZL8consumerPv+0x40>
    80003bc4:	fa9ff06f          	j	80003b6c <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80003bc8:	00893503          	ld	a0,8(s2)
    80003bcc:	00003097          	auipc	ra,0x3
    80003bd0:	2fc080e7          	jalr	764(ra) # 80006ec8 <_ZN6Buffer3getEv>
        putc(key);
    80003bd4:	0ff57513          	andi	a0,a0,255
    80003bd8:	ffffe097          	auipc	ra,0xffffe
    80003bdc:	9b8080e7          	jalr	-1608(ra) # 80001590 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80003be0:	00893503          	ld	a0,8(s2)
    80003be4:	00003097          	auipc	ra,0x3
    80003be8:	370080e7          	jalr	880(ra) # 80006f54 <_ZN6Buffer6getCntEv>
    80003bec:	fca04ee3          	bgtz	a0,80003bc8 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80003bf0:	01093503          	ld	a0,16(s2)
    80003bf4:	ffffe097          	auipc	ra,0xffffe
    80003bf8:	944080e7          	jalr	-1724(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    80003bfc:	02813083          	ld	ra,40(sp)
    80003c00:	02013403          	ld	s0,32(sp)
    80003c04:	01813483          	ld	s1,24(sp)
    80003c08:	01013903          	ld	s2,16(sp)
    80003c0c:	00813983          	ld	s3,8(sp)
    80003c10:	03010113          	addi	sp,sp,48
    80003c14:	00008067          	ret

0000000080003c18 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80003c18:	f9010113          	addi	sp,sp,-112
    80003c1c:	06113423          	sd	ra,104(sp)
    80003c20:	06813023          	sd	s0,96(sp)
    80003c24:	04913c23          	sd	s1,88(sp)
    80003c28:	05213823          	sd	s2,80(sp)
    80003c2c:	05313423          	sd	s3,72(sp)
    80003c30:	05413023          	sd	s4,64(sp)
    80003c34:	03513c23          	sd	s5,56(sp)
    80003c38:	03613823          	sd	s6,48(sp)
    80003c3c:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80003c40:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80003c44:	00006517          	auipc	a0,0x6
    80003c48:	5f450513          	addi	a0,a0,1524 # 8000a238 <_ZZ9kPrintIntmE6digits+0x1c8>
    80003c4c:	00002097          	auipc	ra,0x2
    80003c50:	220080e7          	jalr	544(ra) # 80005e6c <_Z11printStringPKc>
    getString(input, 30);
    80003c54:	01e00593          	li	a1,30
    80003c58:	fa040493          	addi	s1,s0,-96
    80003c5c:	00048513          	mv	a0,s1
    80003c60:	00002097          	auipc	ra,0x2
    80003c64:	294080e7          	jalr	660(ra) # 80005ef4 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80003c68:	00048513          	mv	a0,s1
    80003c6c:	00002097          	auipc	ra,0x2
    80003c70:	360080e7          	jalr	864(ra) # 80005fcc <_Z11stringToIntPKc>
    80003c74:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80003c78:	00006517          	auipc	a0,0x6
    80003c7c:	5e050513          	addi	a0,a0,1504 # 8000a258 <_ZZ9kPrintIntmE6digits+0x1e8>
    80003c80:	00002097          	auipc	ra,0x2
    80003c84:	1ec080e7          	jalr	492(ra) # 80005e6c <_Z11printStringPKc>
    getString(input, 30);
    80003c88:	01e00593          	li	a1,30
    80003c8c:	00048513          	mv	a0,s1
    80003c90:	00002097          	auipc	ra,0x2
    80003c94:	264080e7          	jalr	612(ra) # 80005ef4 <_Z9getStringPci>
    n = stringToInt(input);
    80003c98:	00048513          	mv	a0,s1
    80003c9c:	00002097          	auipc	ra,0x2
    80003ca0:	330080e7          	jalr	816(ra) # 80005fcc <_Z11stringToIntPKc>
    80003ca4:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80003ca8:	00006517          	auipc	a0,0x6
    80003cac:	5d050513          	addi	a0,a0,1488 # 8000a278 <_ZZ9kPrintIntmE6digits+0x208>
    80003cb0:	00002097          	auipc	ra,0x2
    80003cb4:	1bc080e7          	jalr	444(ra) # 80005e6c <_Z11printStringPKc>
	printInt(threadNum);
    80003cb8:	00000613          	li	a2,0
    80003cbc:	00a00593          	li	a1,10
    80003cc0:	00090513          	mv	a0,s2
    80003cc4:	00002097          	auipc	ra,0x2
    80003cc8:	358080e7          	jalr	856(ra) # 8000601c <_Z8printIntiii>
    printString(" i velicina bafera ");
    80003ccc:	00006517          	auipc	a0,0x6
    80003cd0:	5c450513          	addi	a0,a0,1476 # 8000a290 <_ZZ9kPrintIntmE6digits+0x220>
    80003cd4:	00002097          	auipc	ra,0x2
    80003cd8:	198080e7          	jalr	408(ra) # 80005e6c <_Z11printStringPKc>
	printInt(n);
    80003cdc:	00000613          	li	a2,0
    80003ce0:	00a00593          	li	a1,10
    80003ce4:	00048513          	mv	a0,s1
    80003ce8:	00002097          	auipc	ra,0x2
    80003cec:	334080e7          	jalr	820(ra) # 8000601c <_Z8printIntiii>
    printString(".\n");
    80003cf0:	00006517          	auipc	a0,0x6
    80003cf4:	5b850513          	addi	a0,a0,1464 # 8000a2a8 <_ZZ9kPrintIntmE6digits+0x238>
    80003cf8:	00002097          	auipc	ra,0x2
    80003cfc:	174080e7          	jalr	372(ra) # 80005e6c <_Z11printStringPKc>
    if(threadNum > n) {
    80003d00:	0324c463          	blt	s1,s2,80003d28 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80003d04:	03205c63          	blez	s2,80003d3c <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80003d08:	03800513          	li	a0,56
    80003d0c:	fffff097          	auipc	ra,0xfffff
    80003d10:	a18080e7          	jalr	-1512(ra) # 80002724 <_Znwm>
    80003d14:	00050a13          	mv	s4,a0
    80003d18:	00048593          	mv	a1,s1
    80003d1c:	00003097          	auipc	ra,0x3
    80003d20:	080080e7          	jalr	128(ra) # 80006d9c <_ZN6BufferC1Ei>
    80003d24:	0300006f          	j	80003d54 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80003d28:	00006517          	auipc	a0,0x6
    80003d2c:	58850513          	addi	a0,a0,1416 # 8000a2b0 <_ZZ9kPrintIntmE6digits+0x240>
    80003d30:	00002097          	auipc	ra,0x2
    80003d34:	13c080e7          	jalr	316(ra) # 80005e6c <_Z11printStringPKc>
        return;
    80003d38:	0140006f          	j	80003d4c <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80003d3c:	00006517          	auipc	a0,0x6
    80003d40:	5b450513          	addi	a0,a0,1460 # 8000a2f0 <_ZZ9kPrintIntmE6digits+0x280>
    80003d44:	00002097          	auipc	ra,0x2
    80003d48:	128080e7          	jalr	296(ra) # 80005e6c <_Z11printStringPKc>
        return;
    80003d4c:	000b0113          	mv	sp,s6
    80003d50:	1500006f          	j	80003ea0 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80003d54:	00000593          	li	a1,0
    80003d58:	00009517          	auipc	a0,0x9
    80003d5c:	f6050513          	addi	a0,a0,-160 # 8000ccb8 <_ZL10waitForAll>
    80003d60:	ffffd097          	auipc	ra,0xffffd
    80003d64:	740080e7          	jalr	1856(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    thread_t threads[threadNum];
    80003d68:	00391793          	slli	a5,s2,0x3
    80003d6c:	00f78793          	addi	a5,a5,15
    80003d70:	ff07f793          	andi	a5,a5,-16
    80003d74:	40f10133          	sub	sp,sp,a5
    80003d78:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80003d7c:	0019071b          	addiw	a4,s2,1
    80003d80:	00171793          	slli	a5,a4,0x1
    80003d84:	00e787b3          	add	a5,a5,a4
    80003d88:	00379793          	slli	a5,a5,0x3
    80003d8c:	00f78793          	addi	a5,a5,15
    80003d90:	ff07f793          	andi	a5,a5,-16
    80003d94:	40f10133          	sub	sp,sp,a5
    80003d98:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80003d9c:	00191613          	slli	a2,s2,0x1
    80003da0:	012607b3          	add	a5,a2,s2
    80003da4:	00379793          	slli	a5,a5,0x3
    80003da8:	00f987b3          	add	a5,s3,a5
    80003dac:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80003db0:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80003db4:	00009717          	auipc	a4,0x9
    80003db8:	f0473703          	ld	a4,-252(a4) # 8000ccb8 <_ZL10waitForAll>
    80003dbc:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80003dc0:	00078613          	mv	a2,a5
    80003dc4:	00000597          	auipc	a1,0x0
    80003dc8:	d7458593          	addi	a1,a1,-652 # 80003b38 <_ZL8consumerPv>
    80003dcc:	f9840513          	addi	a0,s0,-104
    80003dd0:	ffffd097          	auipc	ra,0xffffd
    80003dd4:	5b0080e7          	jalr	1456(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003dd8:	00000493          	li	s1,0
    80003ddc:	0280006f          	j	80003e04 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80003de0:	00000597          	auipc	a1,0x0
    80003de4:	c1458593          	addi	a1,a1,-1004 # 800039f4 <_ZL16producerKeyboardPv>
                      data + i);
    80003de8:	00179613          	slli	a2,a5,0x1
    80003dec:	00f60633          	add	a2,a2,a5
    80003df0:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80003df4:	00c98633          	add	a2,s3,a2
    80003df8:	ffffd097          	auipc	ra,0xffffd
    80003dfc:	588080e7          	jalr	1416(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003e00:	0014849b          	addiw	s1,s1,1
    80003e04:	0524d263          	bge	s1,s2,80003e48 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80003e08:	00149793          	slli	a5,s1,0x1
    80003e0c:	009787b3          	add	a5,a5,s1
    80003e10:	00379793          	slli	a5,a5,0x3
    80003e14:	00f987b3          	add	a5,s3,a5
    80003e18:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80003e1c:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80003e20:	00009717          	auipc	a4,0x9
    80003e24:	e9873703          	ld	a4,-360(a4) # 8000ccb8 <_ZL10waitForAll>
    80003e28:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80003e2c:	00048793          	mv	a5,s1
    80003e30:	00349513          	slli	a0,s1,0x3
    80003e34:	00aa8533          	add	a0,s5,a0
    80003e38:	fa9054e3          	blez	s1,80003de0 <_Z22producerConsumer_C_APIv+0x1c8>
    80003e3c:	00000597          	auipc	a1,0x0
    80003e40:	c6858593          	addi	a1,a1,-920 # 80003aa4 <_ZL8producerPv>
    80003e44:	fa5ff06f          	j	80003de8 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80003e48:	ffffd097          	auipc	ra,0xffffd
    80003e4c:	5e0080e7          	jalr	1504(ra) # 80001428 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80003e50:	00000493          	li	s1,0
    80003e54:	00994e63          	blt	s2,s1,80003e70 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80003e58:	00009517          	auipc	a0,0x9
    80003e5c:	e6053503          	ld	a0,-416(a0) # 8000ccb8 <_ZL10waitForAll>
    80003e60:	ffffd097          	auipc	ra,0xffffd
    80003e64:	6a8080e7          	jalr	1704(ra) # 80001508 <_Z8sem_waitP4KSem>
    for (int i = 0; i <= threadNum; i++) {
    80003e68:	0014849b          	addiw	s1,s1,1
    80003e6c:	fe9ff06f          	j	80003e54 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80003e70:	00009517          	auipc	a0,0x9
    80003e74:	e4853503          	ld	a0,-440(a0) # 8000ccb8 <_ZL10waitForAll>
    80003e78:	ffffd097          	auipc	ra,0xffffd
    80003e7c:	660080e7          	jalr	1632(ra) # 800014d8 <_Z9sem_closeP4KSem>
    delete buffer;
    80003e80:	000a0e63          	beqz	s4,80003e9c <_Z22producerConsumer_C_APIv+0x284>
    80003e84:	000a0513          	mv	a0,s4
    80003e88:	00003097          	auipc	ra,0x3
    80003e8c:	154080e7          	jalr	340(ra) # 80006fdc <_ZN6BufferD1Ev>
    80003e90:	000a0513          	mv	a0,s4
    80003e94:	fffff097          	auipc	ra,0xfffff
    80003e98:	8e0080e7          	jalr	-1824(ra) # 80002774 <_ZdlPv>
    80003e9c:	000b0113          	mv	sp,s6

}
    80003ea0:	f9040113          	addi	sp,s0,-112
    80003ea4:	06813083          	ld	ra,104(sp)
    80003ea8:	06013403          	ld	s0,96(sp)
    80003eac:	05813483          	ld	s1,88(sp)
    80003eb0:	05013903          	ld	s2,80(sp)
    80003eb4:	04813983          	ld	s3,72(sp)
    80003eb8:	04013a03          	ld	s4,64(sp)
    80003ebc:	03813a83          	ld	s5,56(sp)
    80003ec0:	03013b03          	ld	s6,48(sp)
    80003ec4:	07010113          	addi	sp,sp,112
    80003ec8:	00008067          	ret
    80003ecc:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80003ed0:	000a0513          	mv	a0,s4
    80003ed4:	fffff097          	auipc	ra,0xfffff
    80003ed8:	8a0080e7          	jalr	-1888(ra) # 80002774 <_ZdlPv>
    80003edc:	00048513          	mv	a0,s1
    80003ee0:	0000a097          	auipc	ra,0xa
    80003ee4:	ee8080e7          	jalr	-280(ra) # 8000ddc8 <_Unwind_Resume>

0000000080003ee8 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003ee8:	fe010113          	addi	sp,sp,-32
    80003eec:	00113c23          	sd	ra,24(sp)
    80003ef0:	00813823          	sd	s0,16(sp)
    80003ef4:	00913423          	sd	s1,8(sp)
    80003ef8:	01213023          	sd	s2,0(sp)
    80003efc:	02010413          	addi	s0,sp,32
    80003f00:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003f04:	00100793          	li	a5,1
    80003f08:	02a7f863          	bgeu	a5,a0,80003f38 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80003f0c:	00a00793          	li	a5,10
    80003f10:	02f577b3          	remu	a5,a0,a5
    80003f14:	02078e63          	beqz	a5,80003f50 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80003f18:	fff48513          	addi	a0,s1,-1
    80003f1c:	00000097          	auipc	ra,0x0
    80003f20:	fcc080e7          	jalr	-52(ra) # 80003ee8 <_ZL9fibonaccim>
    80003f24:	00050913          	mv	s2,a0
    80003f28:	ffe48513          	addi	a0,s1,-2
    80003f2c:	00000097          	auipc	ra,0x0
    80003f30:	fbc080e7          	jalr	-68(ra) # 80003ee8 <_ZL9fibonaccim>
    80003f34:	00a90533          	add	a0,s2,a0
}
    80003f38:	01813083          	ld	ra,24(sp)
    80003f3c:	01013403          	ld	s0,16(sp)
    80003f40:	00813483          	ld	s1,8(sp)
    80003f44:	00013903          	ld	s2,0(sp)
    80003f48:	02010113          	addi	sp,sp,32
    80003f4c:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80003f50:	ffffd097          	auipc	ra,0xffffd
    80003f54:	4d8080e7          	jalr	1240(ra) # 80001428 <_Z15thread_dispatchv>
    80003f58:	fc1ff06f          	j	80003f18 <_ZL9fibonaccim+0x30>

0000000080003f5c <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80003f5c:	fe010113          	addi	sp,sp,-32
    80003f60:	00113c23          	sd	ra,24(sp)
    80003f64:	00813823          	sd	s0,16(sp)
    80003f68:	00913423          	sd	s1,8(sp)
    80003f6c:	01213023          	sd	s2,0(sp)
    80003f70:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003f74:	00000913          	li	s2,0
    80003f78:	0380006f          	j	80003fb0 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003f7c:	ffffd097          	auipc	ra,0xffffd
    80003f80:	4ac080e7          	jalr	1196(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003f84:	00148493          	addi	s1,s1,1
    80003f88:	000027b7          	lui	a5,0x2
    80003f8c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003f90:	0097ee63          	bltu	a5,s1,80003fac <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003f94:	00000713          	li	a4,0
    80003f98:	000077b7          	lui	a5,0x7
    80003f9c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003fa0:	fce7eee3          	bltu	a5,a4,80003f7c <_ZN7WorkerA11workerBodyAEPv+0x20>
    80003fa4:	00170713          	addi	a4,a4,1
    80003fa8:	ff1ff06f          	j	80003f98 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003fac:	00190913          	addi	s2,s2,1
    80003fb0:	00900793          	li	a5,9
    80003fb4:	0527e063          	bltu	a5,s2,80003ff4 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003fb8:	00006517          	auipc	a0,0x6
    80003fbc:	36850513          	addi	a0,a0,872 # 8000a320 <_ZZ9kPrintIntmE6digits+0x2b0>
    80003fc0:	00002097          	auipc	ra,0x2
    80003fc4:	eac080e7          	jalr	-340(ra) # 80005e6c <_Z11printStringPKc>
    80003fc8:	00000613          	li	a2,0
    80003fcc:	00a00593          	li	a1,10
    80003fd0:	0009051b          	sext.w	a0,s2
    80003fd4:	00002097          	auipc	ra,0x2
    80003fd8:	048080e7          	jalr	72(ra) # 8000601c <_Z8printIntiii>
    80003fdc:	00006517          	auipc	a0,0x6
    80003fe0:	5a450513          	addi	a0,a0,1444 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80003fe4:	00002097          	auipc	ra,0x2
    80003fe8:	e88080e7          	jalr	-376(ra) # 80005e6c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003fec:	00000493          	li	s1,0
    80003ff0:	f99ff06f          	j	80003f88 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003ff4:	00006517          	auipc	a0,0x6
    80003ff8:	33450513          	addi	a0,a0,820 # 8000a328 <_ZZ9kPrintIntmE6digits+0x2b8>
    80003ffc:	00002097          	auipc	ra,0x2
    80004000:	e70080e7          	jalr	-400(ra) # 80005e6c <_Z11printStringPKc>
    finishedA = true;
    80004004:	00100793          	li	a5,1
    80004008:	00009717          	auipc	a4,0x9
    8000400c:	caf70c23          	sb	a5,-840(a4) # 8000ccc0 <_ZL9finishedA>
}
    80004010:	01813083          	ld	ra,24(sp)
    80004014:	01013403          	ld	s0,16(sp)
    80004018:	00813483          	ld	s1,8(sp)
    8000401c:	00013903          	ld	s2,0(sp)
    80004020:	02010113          	addi	sp,sp,32
    80004024:	00008067          	ret

0000000080004028 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80004028:	fe010113          	addi	sp,sp,-32
    8000402c:	00113c23          	sd	ra,24(sp)
    80004030:	00813823          	sd	s0,16(sp)
    80004034:	00913423          	sd	s1,8(sp)
    80004038:	01213023          	sd	s2,0(sp)
    8000403c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80004040:	00000913          	li	s2,0
    80004044:	0380006f          	j	8000407c <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80004048:	ffffd097          	auipc	ra,0xffffd
    8000404c:	3e0080e7          	jalr	992(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004050:	00148493          	addi	s1,s1,1
    80004054:	000027b7          	lui	a5,0x2
    80004058:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000405c:	0097ee63          	bltu	a5,s1,80004078 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004060:	00000713          	li	a4,0
    80004064:	000077b7          	lui	a5,0x7
    80004068:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000406c:	fce7eee3          	bltu	a5,a4,80004048 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80004070:	00170713          	addi	a4,a4,1
    80004074:	ff1ff06f          	j	80004064 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80004078:	00190913          	addi	s2,s2,1
    8000407c:	00f00793          	li	a5,15
    80004080:	0527e063          	bltu	a5,s2,800040c0 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80004084:	00006517          	auipc	a0,0x6
    80004088:	2b450513          	addi	a0,a0,692 # 8000a338 <_ZZ9kPrintIntmE6digits+0x2c8>
    8000408c:	00002097          	auipc	ra,0x2
    80004090:	de0080e7          	jalr	-544(ra) # 80005e6c <_Z11printStringPKc>
    80004094:	00000613          	li	a2,0
    80004098:	00a00593          	li	a1,10
    8000409c:	0009051b          	sext.w	a0,s2
    800040a0:	00002097          	auipc	ra,0x2
    800040a4:	f7c080e7          	jalr	-132(ra) # 8000601c <_Z8printIntiii>
    800040a8:	00006517          	auipc	a0,0x6
    800040ac:	4d850513          	addi	a0,a0,1240 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800040b0:	00002097          	auipc	ra,0x2
    800040b4:	dbc080e7          	jalr	-580(ra) # 80005e6c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800040b8:	00000493          	li	s1,0
    800040bc:	f99ff06f          	j	80004054 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    800040c0:	00006517          	auipc	a0,0x6
    800040c4:	28050513          	addi	a0,a0,640 # 8000a340 <_ZZ9kPrintIntmE6digits+0x2d0>
    800040c8:	00002097          	auipc	ra,0x2
    800040cc:	da4080e7          	jalr	-604(ra) # 80005e6c <_Z11printStringPKc>
    finishedB = true;
    800040d0:	00100793          	li	a5,1
    800040d4:	00009717          	auipc	a4,0x9
    800040d8:	bef706a3          	sb	a5,-1043(a4) # 8000ccc1 <_ZL9finishedB>
    thread_dispatch();
    800040dc:	ffffd097          	auipc	ra,0xffffd
    800040e0:	34c080e7          	jalr	844(ra) # 80001428 <_Z15thread_dispatchv>
}
    800040e4:	01813083          	ld	ra,24(sp)
    800040e8:	01013403          	ld	s0,16(sp)
    800040ec:	00813483          	ld	s1,8(sp)
    800040f0:	00013903          	ld	s2,0(sp)
    800040f4:	02010113          	addi	sp,sp,32
    800040f8:	00008067          	ret

00000000800040fc <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    800040fc:	fe010113          	addi	sp,sp,-32
    80004100:	00113c23          	sd	ra,24(sp)
    80004104:	00813823          	sd	s0,16(sp)
    80004108:	00913423          	sd	s1,8(sp)
    8000410c:	01213023          	sd	s2,0(sp)
    80004110:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004114:	00000493          	li	s1,0
    80004118:	0400006f          	j	80004158 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    8000411c:	00006517          	auipc	a0,0x6
    80004120:	23450513          	addi	a0,a0,564 # 8000a350 <_ZZ9kPrintIntmE6digits+0x2e0>
    80004124:	00002097          	auipc	ra,0x2
    80004128:	d48080e7          	jalr	-696(ra) # 80005e6c <_Z11printStringPKc>
    8000412c:	00000613          	li	a2,0
    80004130:	00a00593          	li	a1,10
    80004134:	00048513          	mv	a0,s1
    80004138:	00002097          	auipc	ra,0x2
    8000413c:	ee4080e7          	jalr	-284(ra) # 8000601c <_Z8printIntiii>
    80004140:	00006517          	auipc	a0,0x6
    80004144:	44050513          	addi	a0,a0,1088 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80004148:	00002097          	auipc	ra,0x2
    8000414c:	d24080e7          	jalr	-732(ra) # 80005e6c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004150:	0014849b          	addiw	s1,s1,1
    80004154:	0ff4f493          	andi	s1,s1,255
    80004158:	00200793          	li	a5,2
    8000415c:	fc97f0e3          	bgeu	a5,s1,8000411c <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80004160:	00006517          	auipc	a0,0x6
    80004164:	1f850513          	addi	a0,a0,504 # 8000a358 <_ZZ9kPrintIntmE6digits+0x2e8>
    80004168:	00002097          	auipc	ra,0x2
    8000416c:	d04080e7          	jalr	-764(ra) # 80005e6c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004170:	00700313          	li	t1,7
    thread_dispatch();
    80004174:	ffffd097          	auipc	ra,0xffffd
    80004178:	2b4080e7          	jalr	692(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    8000417c:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80004180:	00006517          	auipc	a0,0x6
    80004184:	1e850513          	addi	a0,a0,488 # 8000a368 <_ZZ9kPrintIntmE6digits+0x2f8>
    80004188:	00002097          	auipc	ra,0x2
    8000418c:	ce4080e7          	jalr	-796(ra) # 80005e6c <_Z11printStringPKc>
    80004190:	00000613          	li	a2,0
    80004194:	00a00593          	li	a1,10
    80004198:	0009051b          	sext.w	a0,s2
    8000419c:	00002097          	auipc	ra,0x2
    800041a0:	e80080e7          	jalr	-384(ra) # 8000601c <_Z8printIntiii>
    800041a4:	00006517          	auipc	a0,0x6
    800041a8:	3dc50513          	addi	a0,a0,988 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800041ac:	00002097          	auipc	ra,0x2
    800041b0:	cc0080e7          	jalr	-832(ra) # 80005e6c <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    800041b4:	00c00513          	li	a0,12
    800041b8:	00000097          	auipc	ra,0x0
    800041bc:	d30080e7          	jalr	-720(ra) # 80003ee8 <_ZL9fibonaccim>
    800041c0:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800041c4:	00006517          	auipc	a0,0x6
    800041c8:	1ac50513          	addi	a0,a0,428 # 8000a370 <_ZZ9kPrintIntmE6digits+0x300>
    800041cc:	00002097          	auipc	ra,0x2
    800041d0:	ca0080e7          	jalr	-864(ra) # 80005e6c <_Z11printStringPKc>
    800041d4:	00000613          	li	a2,0
    800041d8:	00a00593          	li	a1,10
    800041dc:	0009051b          	sext.w	a0,s2
    800041e0:	00002097          	auipc	ra,0x2
    800041e4:	e3c080e7          	jalr	-452(ra) # 8000601c <_Z8printIntiii>
    800041e8:	00006517          	auipc	a0,0x6
    800041ec:	39850513          	addi	a0,a0,920 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800041f0:	00002097          	auipc	ra,0x2
    800041f4:	c7c080e7          	jalr	-900(ra) # 80005e6c <_Z11printStringPKc>
    800041f8:	0400006f          	j	80004238 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    800041fc:	00006517          	auipc	a0,0x6
    80004200:	15450513          	addi	a0,a0,340 # 8000a350 <_ZZ9kPrintIntmE6digits+0x2e0>
    80004204:	00002097          	auipc	ra,0x2
    80004208:	c68080e7          	jalr	-920(ra) # 80005e6c <_Z11printStringPKc>
    8000420c:	00000613          	li	a2,0
    80004210:	00a00593          	li	a1,10
    80004214:	00048513          	mv	a0,s1
    80004218:	00002097          	auipc	ra,0x2
    8000421c:	e04080e7          	jalr	-508(ra) # 8000601c <_Z8printIntiii>
    80004220:	00006517          	auipc	a0,0x6
    80004224:	36050513          	addi	a0,a0,864 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80004228:	00002097          	auipc	ra,0x2
    8000422c:	c44080e7          	jalr	-956(ra) # 80005e6c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004230:	0014849b          	addiw	s1,s1,1
    80004234:	0ff4f493          	andi	s1,s1,255
    80004238:	00500793          	li	a5,5
    8000423c:	fc97f0e3          	bgeu	a5,s1,800041fc <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("C finished!\n");
    80004240:	00006517          	auipc	a0,0x6
    80004244:	14050513          	addi	a0,a0,320 # 8000a380 <_ZZ9kPrintIntmE6digits+0x310>
    80004248:	00002097          	auipc	ra,0x2
    8000424c:	c24080e7          	jalr	-988(ra) # 80005e6c <_Z11printStringPKc>
    finishedC = true;
    80004250:	00100793          	li	a5,1
    80004254:	00009717          	auipc	a4,0x9
    80004258:	a6f70723          	sb	a5,-1426(a4) # 8000ccc2 <_ZL9finishedC>
    thread_dispatch();
    8000425c:	ffffd097          	auipc	ra,0xffffd
    80004260:	1cc080e7          	jalr	460(ra) # 80001428 <_Z15thread_dispatchv>
}
    80004264:	01813083          	ld	ra,24(sp)
    80004268:	01013403          	ld	s0,16(sp)
    8000426c:	00813483          	ld	s1,8(sp)
    80004270:	00013903          	ld	s2,0(sp)
    80004274:	02010113          	addi	sp,sp,32
    80004278:	00008067          	ret

000000008000427c <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    8000427c:	fe010113          	addi	sp,sp,-32
    80004280:	00113c23          	sd	ra,24(sp)
    80004284:	00813823          	sd	s0,16(sp)
    80004288:	00913423          	sd	s1,8(sp)
    8000428c:	01213023          	sd	s2,0(sp)
    80004290:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004294:	00a00493          	li	s1,10
    80004298:	0400006f          	j	800042d8 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000429c:	00006517          	auipc	a0,0x6
    800042a0:	0f450513          	addi	a0,a0,244 # 8000a390 <_ZZ9kPrintIntmE6digits+0x320>
    800042a4:	00002097          	auipc	ra,0x2
    800042a8:	bc8080e7          	jalr	-1080(ra) # 80005e6c <_Z11printStringPKc>
    800042ac:	00000613          	li	a2,0
    800042b0:	00a00593          	li	a1,10
    800042b4:	00048513          	mv	a0,s1
    800042b8:	00002097          	auipc	ra,0x2
    800042bc:	d64080e7          	jalr	-668(ra) # 8000601c <_Z8printIntiii>
    800042c0:	00006517          	auipc	a0,0x6
    800042c4:	2c050513          	addi	a0,a0,704 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800042c8:	00002097          	auipc	ra,0x2
    800042cc:	ba4080e7          	jalr	-1116(ra) # 80005e6c <_Z11printStringPKc>
    for (; i < 13; i++) {
    800042d0:	0014849b          	addiw	s1,s1,1
    800042d4:	0ff4f493          	andi	s1,s1,255
    800042d8:	00c00793          	li	a5,12
    800042dc:	fc97f0e3          	bgeu	a5,s1,8000429c <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    800042e0:	00006517          	auipc	a0,0x6
    800042e4:	0b850513          	addi	a0,a0,184 # 8000a398 <_ZZ9kPrintIntmE6digits+0x328>
    800042e8:	00002097          	auipc	ra,0x2
    800042ec:	b84080e7          	jalr	-1148(ra) # 80005e6c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800042f0:	00500313          	li	t1,5
    thread_dispatch();
    800042f4:	ffffd097          	auipc	ra,0xffffd
    800042f8:	134080e7          	jalr	308(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800042fc:	01000513          	li	a0,16
    80004300:	00000097          	auipc	ra,0x0
    80004304:	be8080e7          	jalr	-1048(ra) # 80003ee8 <_ZL9fibonaccim>
    80004308:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    8000430c:	00006517          	auipc	a0,0x6
    80004310:	09c50513          	addi	a0,a0,156 # 8000a3a8 <_ZZ9kPrintIntmE6digits+0x338>
    80004314:	00002097          	auipc	ra,0x2
    80004318:	b58080e7          	jalr	-1192(ra) # 80005e6c <_Z11printStringPKc>
    8000431c:	00000613          	li	a2,0
    80004320:	00a00593          	li	a1,10
    80004324:	0009051b          	sext.w	a0,s2
    80004328:	00002097          	auipc	ra,0x2
    8000432c:	cf4080e7          	jalr	-780(ra) # 8000601c <_Z8printIntiii>
    80004330:	00006517          	auipc	a0,0x6
    80004334:	25050513          	addi	a0,a0,592 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80004338:	00002097          	auipc	ra,0x2
    8000433c:	b34080e7          	jalr	-1228(ra) # 80005e6c <_Z11printStringPKc>
    80004340:	0400006f          	j	80004380 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004344:	00006517          	auipc	a0,0x6
    80004348:	04c50513          	addi	a0,a0,76 # 8000a390 <_ZZ9kPrintIntmE6digits+0x320>
    8000434c:	00002097          	auipc	ra,0x2
    80004350:	b20080e7          	jalr	-1248(ra) # 80005e6c <_Z11printStringPKc>
    80004354:	00000613          	li	a2,0
    80004358:	00a00593          	li	a1,10
    8000435c:	00048513          	mv	a0,s1
    80004360:	00002097          	auipc	ra,0x2
    80004364:	cbc080e7          	jalr	-836(ra) # 8000601c <_Z8printIntiii>
    80004368:	00006517          	auipc	a0,0x6
    8000436c:	21850513          	addi	a0,a0,536 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80004370:	00002097          	auipc	ra,0x2
    80004374:	afc080e7          	jalr	-1284(ra) # 80005e6c <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004378:	0014849b          	addiw	s1,s1,1
    8000437c:	0ff4f493          	andi	s1,s1,255
    80004380:	00f00793          	li	a5,15
    80004384:	fc97f0e3          	bgeu	a5,s1,80004344 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80004388:	00006517          	auipc	a0,0x6
    8000438c:	03050513          	addi	a0,a0,48 # 8000a3b8 <_ZZ9kPrintIntmE6digits+0x348>
    80004390:	00002097          	auipc	ra,0x2
    80004394:	adc080e7          	jalr	-1316(ra) # 80005e6c <_Z11printStringPKc>
    finishedD = true;
    80004398:	00100793          	li	a5,1
    8000439c:	00009717          	auipc	a4,0x9
    800043a0:	92f703a3          	sb	a5,-1753(a4) # 8000ccc3 <_ZL9finishedD>
    thread_dispatch();
    800043a4:	ffffd097          	auipc	ra,0xffffd
    800043a8:	084080e7          	jalr	132(ra) # 80001428 <_Z15thread_dispatchv>
}
    800043ac:	01813083          	ld	ra,24(sp)
    800043b0:	01013403          	ld	s0,16(sp)
    800043b4:	00813483          	ld	s1,8(sp)
    800043b8:	00013903          	ld	s2,0(sp)
    800043bc:	02010113          	addi	sp,sp,32
    800043c0:	00008067          	ret

00000000800043c4 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    800043c4:	fc010113          	addi	sp,sp,-64
    800043c8:	02113c23          	sd	ra,56(sp)
    800043cc:	02813823          	sd	s0,48(sp)
    800043d0:	02913423          	sd	s1,40(sp)
    800043d4:	03213023          	sd	s2,32(sp)
    800043d8:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    800043dc:	02000513          	li	a0,32
    800043e0:	ffffe097          	auipc	ra,0xffffe
    800043e4:	344080e7          	jalr	836(ra) # 80002724 <_Znwm>
    800043e8:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    800043ec:	ffffe097          	auipc	ra,0xffffe
    800043f0:	600080e7          	jalr	1536(ra) # 800029ec <_ZN6ThreadC1Ev>
    800043f4:	00008797          	auipc	a5,0x8
    800043f8:	52c78793          	addi	a5,a5,1324 # 8000c920 <_ZTV7WorkerA+0x10>
    800043fc:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80004400:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80004404:	00006517          	auipc	a0,0x6
    80004408:	fc450513          	addi	a0,a0,-60 # 8000a3c8 <_ZZ9kPrintIntmE6digits+0x358>
    8000440c:	00002097          	auipc	ra,0x2
    80004410:	a60080e7          	jalr	-1440(ra) # 80005e6c <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80004414:	02000513          	li	a0,32
    80004418:	ffffe097          	auipc	ra,0xffffe
    8000441c:	30c080e7          	jalr	780(ra) # 80002724 <_Znwm>
    80004420:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80004424:	ffffe097          	auipc	ra,0xffffe
    80004428:	5c8080e7          	jalr	1480(ra) # 800029ec <_ZN6ThreadC1Ev>
    8000442c:	00008797          	auipc	a5,0x8
    80004430:	51c78793          	addi	a5,a5,1308 # 8000c948 <_ZTV7WorkerB+0x10>
    80004434:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80004438:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    8000443c:	00006517          	auipc	a0,0x6
    80004440:	fa450513          	addi	a0,a0,-92 # 8000a3e0 <_ZZ9kPrintIntmE6digits+0x370>
    80004444:	00002097          	auipc	ra,0x2
    80004448:	a28080e7          	jalr	-1496(ra) # 80005e6c <_Z11printStringPKc>

    threads[2] = new WorkerC();
    8000444c:	02000513          	li	a0,32
    80004450:	ffffe097          	auipc	ra,0xffffe
    80004454:	2d4080e7          	jalr	724(ra) # 80002724 <_Znwm>
    80004458:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    8000445c:	ffffe097          	auipc	ra,0xffffe
    80004460:	590080e7          	jalr	1424(ra) # 800029ec <_ZN6ThreadC1Ev>
    80004464:	00008797          	auipc	a5,0x8
    80004468:	50c78793          	addi	a5,a5,1292 # 8000c970 <_ZTV7WorkerC+0x10>
    8000446c:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80004470:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80004474:	00006517          	auipc	a0,0x6
    80004478:	f8450513          	addi	a0,a0,-124 # 8000a3f8 <_ZZ9kPrintIntmE6digits+0x388>
    8000447c:	00002097          	auipc	ra,0x2
    80004480:	9f0080e7          	jalr	-1552(ra) # 80005e6c <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80004484:	02000513          	li	a0,32
    80004488:	ffffe097          	auipc	ra,0xffffe
    8000448c:	29c080e7          	jalr	668(ra) # 80002724 <_Znwm>
    80004490:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80004494:	ffffe097          	auipc	ra,0xffffe
    80004498:	558080e7          	jalr	1368(ra) # 800029ec <_ZN6ThreadC1Ev>
    8000449c:	00008797          	auipc	a5,0x8
    800044a0:	4fc78793          	addi	a5,a5,1276 # 8000c998 <_ZTV7WorkerD+0x10>
    800044a4:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    800044a8:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    800044ac:	00006517          	auipc	a0,0x6
    800044b0:	f6450513          	addi	a0,a0,-156 # 8000a410 <_ZZ9kPrintIntmE6digits+0x3a0>
    800044b4:	00002097          	auipc	ra,0x2
    800044b8:	9b8080e7          	jalr	-1608(ra) # 80005e6c <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    800044bc:	00000493          	li	s1,0
    800044c0:	00300793          	li	a5,3
    800044c4:	0297c663          	blt	a5,s1,800044f0 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    800044c8:	00349793          	slli	a5,s1,0x3
    800044cc:	fe040713          	addi	a4,s0,-32
    800044d0:	00f707b3          	add	a5,a4,a5
    800044d4:	fe07b503          	ld	a0,-32(a5)
    800044d8:	ffffe097          	auipc	ra,0xffffe
    800044dc:	3fc080e7          	jalr	1020(ra) # 800028d4 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    800044e0:	0014849b          	addiw	s1,s1,1
    800044e4:	fddff06f          	j	800044c0 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    800044e8:	ffffe097          	auipc	ra,0xffffe
    800044ec:	450080e7          	jalr	1104(ra) # 80002938 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800044f0:	00008797          	auipc	a5,0x8
    800044f4:	7d07c783          	lbu	a5,2000(a5) # 8000ccc0 <_ZL9finishedA>
    800044f8:	fe0788e3          	beqz	a5,800044e8 <_Z20Threads_CPP_API_testv+0x124>
    800044fc:	00008797          	auipc	a5,0x8
    80004500:	7c57c783          	lbu	a5,1989(a5) # 8000ccc1 <_ZL9finishedB>
    80004504:	fe0782e3          	beqz	a5,800044e8 <_Z20Threads_CPP_API_testv+0x124>
    80004508:	00008797          	auipc	a5,0x8
    8000450c:	7ba7c783          	lbu	a5,1978(a5) # 8000ccc2 <_ZL9finishedC>
    80004510:	fc078ce3          	beqz	a5,800044e8 <_Z20Threads_CPP_API_testv+0x124>
    80004514:	00008797          	auipc	a5,0x8
    80004518:	7af7c783          	lbu	a5,1967(a5) # 8000ccc3 <_ZL9finishedD>
    8000451c:	fc0786e3          	beqz	a5,800044e8 <_Z20Threads_CPP_API_testv+0x124>
    80004520:	fc040493          	addi	s1,s0,-64
    80004524:	0080006f          	j	8000452c <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) {
    80004528:	00848493          	addi	s1,s1,8
    8000452c:	fe040793          	addi	a5,s0,-32
    80004530:	08f48663          	beq	s1,a5,800045bc <_Z20Threads_CPP_API_testv+0x1f8>
    80004534:	0004b503          	ld	a0,0(s1)
		delete thread;
    80004538:	fe0508e3          	beqz	a0,80004528 <_Z20Threads_CPP_API_testv+0x164>
    8000453c:	00053783          	ld	a5,0(a0)
    80004540:	0087b783          	ld	a5,8(a5)
    80004544:	000780e7          	jalr	a5
    80004548:	fe1ff06f          	j	80004528 <_Z20Threads_CPP_API_testv+0x164>
    8000454c:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80004550:	00048513          	mv	a0,s1
    80004554:	ffffe097          	auipc	ra,0xffffe
    80004558:	220080e7          	jalr	544(ra) # 80002774 <_ZdlPv>
    8000455c:	00090513          	mv	a0,s2
    80004560:	0000a097          	auipc	ra,0xa
    80004564:	868080e7          	jalr	-1944(ra) # 8000ddc8 <_Unwind_Resume>
    80004568:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    8000456c:	00048513          	mv	a0,s1
    80004570:	ffffe097          	auipc	ra,0xffffe
    80004574:	204080e7          	jalr	516(ra) # 80002774 <_ZdlPv>
    80004578:	00090513          	mv	a0,s2
    8000457c:	0000a097          	auipc	ra,0xa
    80004580:	84c080e7          	jalr	-1972(ra) # 8000ddc8 <_Unwind_Resume>
    80004584:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80004588:	00048513          	mv	a0,s1
    8000458c:	ffffe097          	auipc	ra,0xffffe
    80004590:	1e8080e7          	jalr	488(ra) # 80002774 <_ZdlPv>
    80004594:	00090513          	mv	a0,s2
    80004598:	0000a097          	auipc	ra,0xa
    8000459c:	830080e7          	jalr	-2000(ra) # 8000ddc8 <_Unwind_Resume>
    800045a0:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    800045a4:	00048513          	mv	a0,s1
    800045a8:	ffffe097          	auipc	ra,0xffffe
    800045ac:	1cc080e7          	jalr	460(ra) # 80002774 <_ZdlPv>
    800045b0:	00090513          	mv	a0,s2
    800045b4:	0000a097          	auipc	ra,0xa
    800045b8:	814080e7          	jalr	-2028(ra) # 8000ddc8 <_Unwind_Resume>
	}
}
    800045bc:	03813083          	ld	ra,56(sp)
    800045c0:	03013403          	ld	s0,48(sp)
    800045c4:	02813483          	ld	s1,40(sp)
    800045c8:	02013903          	ld	s2,32(sp)
    800045cc:	04010113          	addi	sp,sp,64
    800045d0:	00008067          	ret

00000000800045d4 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    800045d4:	ff010113          	addi	sp,sp,-16
    800045d8:	00113423          	sd	ra,8(sp)
    800045dc:	00813023          	sd	s0,0(sp)
    800045e0:	01010413          	addi	s0,sp,16
    800045e4:	00008797          	auipc	a5,0x8
    800045e8:	33c78793          	addi	a5,a5,828 # 8000c920 <_ZTV7WorkerA+0x10>
    800045ec:	00f53023          	sd	a5,0(a0)
    800045f0:	ffffe097          	auipc	ra,0xffffe
    800045f4:	044080e7          	jalr	68(ra) # 80002634 <_ZN6ThreadD1Ev>
    800045f8:	00813083          	ld	ra,8(sp)
    800045fc:	00013403          	ld	s0,0(sp)
    80004600:	01010113          	addi	sp,sp,16
    80004604:	00008067          	ret

0000000080004608 <_ZN7WorkerAD0Ev>:
    80004608:	fe010113          	addi	sp,sp,-32
    8000460c:	00113c23          	sd	ra,24(sp)
    80004610:	00813823          	sd	s0,16(sp)
    80004614:	00913423          	sd	s1,8(sp)
    80004618:	02010413          	addi	s0,sp,32
    8000461c:	00050493          	mv	s1,a0
    80004620:	00008797          	auipc	a5,0x8
    80004624:	30078793          	addi	a5,a5,768 # 8000c920 <_ZTV7WorkerA+0x10>
    80004628:	00f53023          	sd	a5,0(a0)
    8000462c:	ffffe097          	auipc	ra,0xffffe
    80004630:	008080e7          	jalr	8(ra) # 80002634 <_ZN6ThreadD1Ev>
    80004634:	00048513          	mv	a0,s1
    80004638:	ffffe097          	auipc	ra,0xffffe
    8000463c:	13c080e7          	jalr	316(ra) # 80002774 <_ZdlPv>
    80004640:	01813083          	ld	ra,24(sp)
    80004644:	01013403          	ld	s0,16(sp)
    80004648:	00813483          	ld	s1,8(sp)
    8000464c:	02010113          	addi	sp,sp,32
    80004650:	00008067          	ret

0000000080004654 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80004654:	ff010113          	addi	sp,sp,-16
    80004658:	00113423          	sd	ra,8(sp)
    8000465c:	00813023          	sd	s0,0(sp)
    80004660:	01010413          	addi	s0,sp,16
    80004664:	00008797          	auipc	a5,0x8
    80004668:	2e478793          	addi	a5,a5,740 # 8000c948 <_ZTV7WorkerB+0x10>
    8000466c:	00f53023          	sd	a5,0(a0)
    80004670:	ffffe097          	auipc	ra,0xffffe
    80004674:	fc4080e7          	jalr	-60(ra) # 80002634 <_ZN6ThreadD1Ev>
    80004678:	00813083          	ld	ra,8(sp)
    8000467c:	00013403          	ld	s0,0(sp)
    80004680:	01010113          	addi	sp,sp,16
    80004684:	00008067          	ret

0000000080004688 <_ZN7WorkerBD0Ev>:
    80004688:	fe010113          	addi	sp,sp,-32
    8000468c:	00113c23          	sd	ra,24(sp)
    80004690:	00813823          	sd	s0,16(sp)
    80004694:	00913423          	sd	s1,8(sp)
    80004698:	02010413          	addi	s0,sp,32
    8000469c:	00050493          	mv	s1,a0
    800046a0:	00008797          	auipc	a5,0x8
    800046a4:	2a878793          	addi	a5,a5,680 # 8000c948 <_ZTV7WorkerB+0x10>
    800046a8:	00f53023          	sd	a5,0(a0)
    800046ac:	ffffe097          	auipc	ra,0xffffe
    800046b0:	f88080e7          	jalr	-120(ra) # 80002634 <_ZN6ThreadD1Ev>
    800046b4:	00048513          	mv	a0,s1
    800046b8:	ffffe097          	auipc	ra,0xffffe
    800046bc:	0bc080e7          	jalr	188(ra) # 80002774 <_ZdlPv>
    800046c0:	01813083          	ld	ra,24(sp)
    800046c4:	01013403          	ld	s0,16(sp)
    800046c8:	00813483          	ld	s1,8(sp)
    800046cc:	02010113          	addi	sp,sp,32
    800046d0:	00008067          	ret

00000000800046d4 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    800046d4:	ff010113          	addi	sp,sp,-16
    800046d8:	00113423          	sd	ra,8(sp)
    800046dc:	00813023          	sd	s0,0(sp)
    800046e0:	01010413          	addi	s0,sp,16
    800046e4:	00008797          	auipc	a5,0x8
    800046e8:	28c78793          	addi	a5,a5,652 # 8000c970 <_ZTV7WorkerC+0x10>
    800046ec:	00f53023          	sd	a5,0(a0)
    800046f0:	ffffe097          	auipc	ra,0xffffe
    800046f4:	f44080e7          	jalr	-188(ra) # 80002634 <_ZN6ThreadD1Ev>
    800046f8:	00813083          	ld	ra,8(sp)
    800046fc:	00013403          	ld	s0,0(sp)
    80004700:	01010113          	addi	sp,sp,16
    80004704:	00008067          	ret

0000000080004708 <_ZN7WorkerCD0Ev>:
    80004708:	fe010113          	addi	sp,sp,-32
    8000470c:	00113c23          	sd	ra,24(sp)
    80004710:	00813823          	sd	s0,16(sp)
    80004714:	00913423          	sd	s1,8(sp)
    80004718:	02010413          	addi	s0,sp,32
    8000471c:	00050493          	mv	s1,a0
    80004720:	00008797          	auipc	a5,0x8
    80004724:	25078793          	addi	a5,a5,592 # 8000c970 <_ZTV7WorkerC+0x10>
    80004728:	00f53023          	sd	a5,0(a0)
    8000472c:	ffffe097          	auipc	ra,0xffffe
    80004730:	f08080e7          	jalr	-248(ra) # 80002634 <_ZN6ThreadD1Ev>
    80004734:	00048513          	mv	a0,s1
    80004738:	ffffe097          	auipc	ra,0xffffe
    8000473c:	03c080e7          	jalr	60(ra) # 80002774 <_ZdlPv>
    80004740:	01813083          	ld	ra,24(sp)
    80004744:	01013403          	ld	s0,16(sp)
    80004748:	00813483          	ld	s1,8(sp)
    8000474c:	02010113          	addi	sp,sp,32
    80004750:	00008067          	ret

0000000080004754 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80004754:	ff010113          	addi	sp,sp,-16
    80004758:	00113423          	sd	ra,8(sp)
    8000475c:	00813023          	sd	s0,0(sp)
    80004760:	01010413          	addi	s0,sp,16
    80004764:	00008797          	auipc	a5,0x8
    80004768:	23478793          	addi	a5,a5,564 # 8000c998 <_ZTV7WorkerD+0x10>
    8000476c:	00f53023          	sd	a5,0(a0)
    80004770:	ffffe097          	auipc	ra,0xffffe
    80004774:	ec4080e7          	jalr	-316(ra) # 80002634 <_ZN6ThreadD1Ev>
    80004778:	00813083          	ld	ra,8(sp)
    8000477c:	00013403          	ld	s0,0(sp)
    80004780:	01010113          	addi	sp,sp,16
    80004784:	00008067          	ret

0000000080004788 <_ZN7WorkerDD0Ev>:
    80004788:	fe010113          	addi	sp,sp,-32
    8000478c:	00113c23          	sd	ra,24(sp)
    80004790:	00813823          	sd	s0,16(sp)
    80004794:	00913423          	sd	s1,8(sp)
    80004798:	02010413          	addi	s0,sp,32
    8000479c:	00050493          	mv	s1,a0
    800047a0:	00008797          	auipc	a5,0x8
    800047a4:	1f878793          	addi	a5,a5,504 # 8000c998 <_ZTV7WorkerD+0x10>
    800047a8:	00f53023          	sd	a5,0(a0)
    800047ac:	ffffe097          	auipc	ra,0xffffe
    800047b0:	e88080e7          	jalr	-376(ra) # 80002634 <_ZN6ThreadD1Ev>
    800047b4:	00048513          	mv	a0,s1
    800047b8:	ffffe097          	auipc	ra,0xffffe
    800047bc:	fbc080e7          	jalr	-68(ra) # 80002774 <_ZdlPv>
    800047c0:	01813083          	ld	ra,24(sp)
    800047c4:	01013403          	ld	s0,16(sp)
    800047c8:	00813483          	ld	s1,8(sp)
    800047cc:	02010113          	addi	sp,sp,32
    800047d0:	00008067          	ret

00000000800047d4 <_ZN7WorkerA3runEv>:
    void run() override {
    800047d4:	ff010113          	addi	sp,sp,-16
    800047d8:	00113423          	sd	ra,8(sp)
    800047dc:	00813023          	sd	s0,0(sp)
    800047e0:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    800047e4:	00000593          	li	a1,0
    800047e8:	fffff097          	auipc	ra,0xfffff
    800047ec:	774080e7          	jalr	1908(ra) # 80003f5c <_ZN7WorkerA11workerBodyAEPv>
    }
    800047f0:	00813083          	ld	ra,8(sp)
    800047f4:	00013403          	ld	s0,0(sp)
    800047f8:	01010113          	addi	sp,sp,16
    800047fc:	00008067          	ret

0000000080004800 <_ZN7WorkerB3runEv>:
    void run() override {
    80004800:	ff010113          	addi	sp,sp,-16
    80004804:	00113423          	sd	ra,8(sp)
    80004808:	00813023          	sd	s0,0(sp)
    8000480c:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80004810:	00000593          	li	a1,0
    80004814:	00000097          	auipc	ra,0x0
    80004818:	814080e7          	jalr	-2028(ra) # 80004028 <_ZN7WorkerB11workerBodyBEPv>
    }
    8000481c:	00813083          	ld	ra,8(sp)
    80004820:	00013403          	ld	s0,0(sp)
    80004824:	01010113          	addi	sp,sp,16
    80004828:	00008067          	ret

000000008000482c <_ZN7WorkerC3runEv>:
    void run() override {
    8000482c:	ff010113          	addi	sp,sp,-16
    80004830:	00113423          	sd	ra,8(sp)
    80004834:	00813023          	sd	s0,0(sp)
    80004838:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    8000483c:	00000593          	li	a1,0
    80004840:	00000097          	auipc	ra,0x0
    80004844:	8bc080e7          	jalr	-1860(ra) # 800040fc <_ZN7WorkerC11workerBodyCEPv>
    }
    80004848:	00813083          	ld	ra,8(sp)
    8000484c:	00013403          	ld	s0,0(sp)
    80004850:	01010113          	addi	sp,sp,16
    80004854:	00008067          	ret

0000000080004858 <_ZN7WorkerD3runEv>:
    void run() override {
    80004858:	ff010113          	addi	sp,sp,-16
    8000485c:	00113423          	sd	ra,8(sp)
    80004860:	00813023          	sd	s0,0(sp)
    80004864:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80004868:	00000593          	li	a1,0
    8000486c:	00000097          	auipc	ra,0x0
    80004870:	a10080e7          	jalr	-1520(ra) # 8000427c <_ZN7WorkerD11workerBodyDEPv>
    }
    80004874:	00813083          	ld	ra,8(sp)
    80004878:	00013403          	ld	s0,0(sp)
    8000487c:	01010113          	addi	sp,sp,16
    80004880:	00008067          	ret

0000000080004884 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    80004884:	f8010113          	addi	sp,sp,-128
    80004888:	06113c23          	sd	ra,120(sp)
    8000488c:	06813823          	sd	s0,112(sp)
    80004890:	06913423          	sd	s1,104(sp)
    80004894:	07213023          	sd	s2,96(sp)
    80004898:	05313c23          	sd	s3,88(sp)
    8000489c:	05413823          	sd	s4,80(sp)
    800048a0:	05513423          	sd	s5,72(sp)
    800048a4:	05613023          	sd	s6,64(sp)
    800048a8:	03713c23          	sd	s7,56(sp)
    800048ac:	03813823          	sd	s8,48(sp)
    800048b0:	03913423          	sd	s9,40(sp)
    800048b4:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    800048b8:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    800048bc:	00006517          	auipc	a0,0x6
    800048c0:	97c50513          	addi	a0,a0,-1668 # 8000a238 <_ZZ9kPrintIntmE6digits+0x1c8>
    800048c4:	00001097          	auipc	ra,0x1
    800048c8:	5a8080e7          	jalr	1448(ra) # 80005e6c <_Z11printStringPKc>
    getString(input, 30);
    800048cc:	01e00593          	li	a1,30
    800048d0:	f8040493          	addi	s1,s0,-128
    800048d4:	00048513          	mv	a0,s1
    800048d8:	00001097          	auipc	ra,0x1
    800048dc:	61c080e7          	jalr	1564(ra) # 80005ef4 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800048e0:	00048513          	mv	a0,s1
    800048e4:	00001097          	auipc	ra,0x1
    800048e8:	6e8080e7          	jalr	1768(ra) # 80005fcc <_Z11stringToIntPKc>
    800048ec:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    800048f0:	00006517          	auipc	a0,0x6
    800048f4:	96850513          	addi	a0,a0,-1688 # 8000a258 <_ZZ9kPrintIntmE6digits+0x1e8>
    800048f8:	00001097          	auipc	ra,0x1
    800048fc:	574080e7          	jalr	1396(ra) # 80005e6c <_Z11printStringPKc>
    getString(input, 30);
    80004900:	01e00593          	li	a1,30
    80004904:	00048513          	mv	a0,s1
    80004908:	00001097          	auipc	ra,0x1
    8000490c:	5ec080e7          	jalr	1516(ra) # 80005ef4 <_Z9getStringPci>
    n = stringToInt(input);
    80004910:	00048513          	mv	a0,s1
    80004914:	00001097          	auipc	ra,0x1
    80004918:	6b8080e7          	jalr	1720(ra) # 80005fcc <_Z11stringToIntPKc>
    8000491c:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80004920:	00006517          	auipc	a0,0x6
    80004924:	95850513          	addi	a0,a0,-1704 # 8000a278 <_ZZ9kPrintIntmE6digits+0x208>
    80004928:	00001097          	auipc	ra,0x1
    8000492c:	544080e7          	jalr	1348(ra) # 80005e6c <_Z11printStringPKc>
    printInt(threadNum);
    80004930:	00000613          	li	a2,0
    80004934:	00a00593          	li	a1,10
    80004938:	00098513          	mv	a0,s3
    8000493c:	00001097          	auipc	ra,0x1
    80004940:	6e0080e7          	jalr	1760(ra) # 8000601c <_Z8printIntiii>
    printString(" i velicina bafera ");
    80004944:	00006517          	auipc	a0,0x6
    80004948:	94c50513          	addi	a0,a0,-1716 # 8000a290 <_ZZ9kPrintIntmE6digits+0x220>
    8000494c:	00001097          	auipc	ra,0x1
    80004950:	520080e7          	jalr	1312(ra) # 80005e6c <_Z11printStringPKc>
    printInt(n);
    80004954:	00000613          	li	a2,0
    80004958:	00a00593          	li	a1,10
    8000495c:	00048513          	mv	a0,s1
    80004960:	00001097          	auipc	ra,0x1
    80004964:	6bc080e7          	jalr	1724(ra) # 8000601c <_Z8printIntiii>
    printString(".\n");
    80004968:	00006517          	auipc	a0,0x6
    8000496c:	94050513          	addi	a0,a0,-1728 # 8000a2a8 <_ZZ9kPrintIntmE6digits+0x238>
    80004970:	00001097          	auipc	ra,0x1
    80004974:	4fc080e7          	jalr	1276(ra) # 80005e6c <_Z11printStringPKc>
    if (threadNum > n) {
    80004978:	0334c463          	blt	s1,s3,800049a0 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    8000497c:	03305c63          	blez	s3,800049b4 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80004980:	03800513          	li	a0,56
    80004984:	ffffe097          	auipc	ra,0xffffe
    80004988:	da0080e7          	jalr	-608(ra) # 80002724 <_Znwm>
    8000498c:	00050a93          	mv	s5,a0
    80004990:	00048593          	mv	a1,s1
    80004994:	00001097          	auipc	ra,0x1
    80004998:	7a8080e7          	jalr	1960(ra) # 8000613c <_ZN9BufferCPPC1Ei>
    8000499c:	0300006f          	j	800049cc <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800049a0:	00006517          	auipc	a0,0x6
    800049a4:	91050513          	addi	a0,a0,-1776 # 8000a2b0 <_ZZ9kPrintIntmE6digits+0x240>
    800049a8:	00001097          	auipc	ra,0x1
    800049ac:	4c4080e7          	jalr	1220(ra) # 80005e6c <_Z11printStringPKc>
        return;
    800049b0:	0140006f          	j	800049c4 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800049b4:	00006517          	auipc	a0,0x6
    800049b8:	93c50513          	addi	a0,a0,-1732 # 8000a2f0 <_ZZ9kPrintIntmE6digits+0x280>
    800049bc:	00001097          	auipc	ra,0x1
    800049c0:	4b0080e7          	jalr	1200(ra) # 80005e6c <_Z11printStringPKc>
        return;
    800049c4:	000c0113          	mv	sp,s8
    800049c8:	2140006f          	j	80004bdc <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    800049cc:	01000513          	li	a0,16
    800049d0:	ffffe097          	auipc	ra,0xffffe
    800049d4:	d54080e7          	jalr	-684(ra) # 80002724 <_Znwm>
    800049d8:	00050913          	mv	s2,a0
    800049dc:	00000593          	li	a1,0
    800049e0:	ffffe097          	auipc	ra,0xffffe
    800049e4:	088080e7          	jalr	136(ra) # 80002a68 <_ZN9SemaphoreC1Ej>
    800049e8:	00008797          	auipc	a5,0x8
    800049ec:	2f27b423          	sd	s2,744(a5) # 8000ccd0 <_ZL10waitForAll>
    Thread *producers[threadNum];
    800049f0:	00399793          	slli	a5,s3,0x3
    800049f4:	00f78793          	addi	a5,a5,15
    800049f8:	ff07f793          	andi	a5,a5,-16
    800049fc:	40f10133          	sub	sp,sp,a5
    80004a00:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80004a04:	0019871b          	addiw	a4,s3,1
    80004a08:	00171793          	slli	a5,a4,0x1
    80004a0c:	00e787b3          	add	a5,a5,a4
    80004a10:	00379793          	slli	a5,a5,0x3
    80004a14:	00f78793          	addi	a5,a5,15
    80004a18:	ff07f793          	andi	a5,a5,-16
    80004a1c:	40f10133          	sub	sp,sp,a5
    80004a20:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80004a24:	00199493          	slli	s1,s3,0x1
    80004a28:	013484b3          	add	s1,s1,s3
    80004a2c:	00349493          	slli	s1,s1,0x3
    80004a30:	009b04b3          	add	s1,s6,s1
    80004a34:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80004a38:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80004a3c:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004a40:	02800513          	li	a0,40
    80004a44:	ffffe097          	auipc	ra,0xffffe
    80004a48:	ce0080e7          	jalr	-800(ra) # 80002724 <_Znwm>
    80004a4c:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80004a50:	ffffe097          	auipc	ra,0xffffe
    80004a54:	f9c080e7          	jalr	-100(ra) # 800029ec <_ZN6ThreadC1Ev>
    80004a58:	00008797          	auipc	a5,0x8
    80004a5c:	fb878793          	addi	a5,a5,-72 # 8000ca10 <_ZTV8Consumer+0x10>
    80004a60:	00fbb023          	sd	a5,0(s7)
    80004a64:	029bb023          	sd	s1,32(s7)
    consumer->start();
    80004a68:	000b8513          	mv	a0,s7
    80004a6c:	ffffe097          	auipc	ra,0xffffe
    80004a70:	e68080e7          	jalr	-408(ra) # 800028d4 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    80004a74:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    80004a78:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    80004a7c:	00008797          	auipc	a5,0x8
    80004a80:	2547b783          	ld	a5,596(a5) # 8000ccd0 <_ZL10waitForAll>
    80004a84:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004a88:	02800513          	li	a0,40
    80004a8c:	ffffe097          	auipc	ra,0xffffe
    80004a90:	c98080e7          	jalr	-872(ra) # 80002724 <_Znwm>
    80004a94:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80004a98:	ffffe097          	auipc	ra,0xffffe
    80004a9c:	f54080e7          	jalr	-172(ra) # 800029ec <_ZN6ThreadC1Ev>
    80004aa0:	00008797          	auipc	a5,0x8
    80004aa4:	f2078793          	addi	a5,a5,-224 # 8000c9c0 <_ZTV16ProducerKeyborad+0x10>
    80004aa8:	00f4b023          	sd	a5,0(s1)
    80004aac:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004ab0:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80004ab4:	00048513          	mv	a0,s1
    80004ab8:	ffffe097          	auipc	ra,0xffffe
    80004abc:	e1c080e7          	jalr	-484(ra) # 800028d4 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004ac0:	00100913          	li	s2,1
    80004ac4:	0300006f          	j	80004af4 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004ac8:	00008797          	auipc	a5,0x8
    80004acc:	f2078793          	addi	a5,a5,-224 # 8000c9e8 <_ZTV8Producer+0x10>
    80004ad0:	00fcb023          	sd	a5,0(s9)
    80004ad4:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    80004ad8:	00391793          	slli	a5,s2,0x3
    80004adc:	00fa07b3          	add	a5,s4,a5
    80004ae0:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80004ae4:	000c8513          	mv	a0,s9
    80004ae8:	ffffe097          	auipc	ra,0xffffe
    80004aec:	dec080e7          	jalr	-532(ra) # 800028d4 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004af0:	0019091b          	addiw	s2,s2,1
    80004af4:	05395263          	bge	s2,s3,80004b38 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80004af8:	00191493          	slli	s1,s2,0x1
    80004afc:	012484b3          	add	s1,s1,s2
    80004b00:	00349493          	slli	s1,s1,0x3
    80004b04:	009b04b3          	add	s1,s6,s1
    80004b08:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80004b0c:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80004b10:	00008797          	auipc	a5,0x8
    80004b14:	1c07b783          	ld	a5,448(a5) # 8000ccd0 <_ZL10waitForAll>
    80004b18:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80004b1c:	02800513          	li	a0,40
    80004b20:	ffffe097          	auipc	ra,0xffffe
    80004b24:	c04080e7          	jalr	-1020(ra) # 80002724 <_Znwm>
    80004b28:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004b2c:	ffffe097          	auipc	ra,0xffffe
    80004b30:	ec0080e7          	jalr	-320(ra) # 800029ec <_ZN6ThreadC1Ev>
    80004b34:	f95ff06f          	j	80004ac8 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    80004b38:	ffffe097          	auipc	ra,0xffffe
    80004b3c:	e00080e7          	jalr	-512(ra) # 80002938 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80004b40:	00000493          	li	s1,0
    80004b44:	0099ce63          	blt	s3,s1,80004b60 <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    80004b48:	00008517          	auipc	a0,0x8
    80004b4c:	18853503          	ld	a0,392(a0) # 8000ccd0 <_ZL10waitForAll>
    80004b50:	ffffe097          	auipc	ra,0xffffe
    80004b54:	f50080e7          	jalr	-176(ra) # 80002aa0 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80004b58:	0014849b          	addiw	s1,s1,1
    80004b5c:	fe9ff06f          	j	80004b44 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    80004b60:	00008517          	auipc	a0,0x8
    80004b64:	17053503          	ld	a0,368(a0) # 8000ccd0 <_ZL10waitForAll>
    80004b68:	00050863          	beqz	a0,80004b78 <_Z20testConsumerProducerv+0x2f4>
    80004b6c:	00053783          	ld	a5,0(a0)
    80004b70:	0087b783          	ld	a5,8(a5)
    80004b74:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    80004b78:	00000493          	li	s1,0
    80004b7c:	0080006f          	j	80004b84 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    80004b80:	0014849b          	addiw	s1,s1,1
    80004b84:	0334d263          	bge	s1,s3,80004ba8 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    80004b88:	00349793          	slli	a5,s1,0x3
    80004b8c:	00fa07b3          	add	a5,s4,a5
    80004b90:	0007b503          	ld	a0,0(a5)
    80004b94:	fe0506e3          	beqz	a0,80004b80 <_Z20testConsumerProducerv+0x2fc>
    80004b98:	00053783          	ld	a5,0(a0)
    80004b9c:	0087b783          	ld	a5,8(a5)
    80004ba0:	000780e7          	jalr	a5
    80004ba4:	fddff06f          	j	80004b80 <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    80004ba8:	000b8a63          	beqz	s7,80004bbc <_Z20testConsumerProducerv+0x338>
    80004bac:	000bb783          	ld	a5,0(s7)
    80004bb0:	0087b783          	ld	a5,8(a5)
    80004bb4:	000b8513          	mv	a0,s7
    80004bb8:	000780e7          	jalr	a5
    delete buffer;
    80004bbc:	000a8e63          	beqz	s5,80004bd8 <_Z20testConsumerProducerv+0x354>
    80004bc0:	000a8513          	mv	a0,s5
    80004bc4:	00002097          	auipc	ra,0x2
    80004bc8:	870080e7          	jalr	-1936(ra) # 80006434 <_ZN9BufferCPPD1Ev>
    80004bcc:	000a8513          	mv	a0,s5
    80004bd0:	ffffe097          	auipc	ra,0xffffe
    80004bd4:	ba4080e7          	jalr	-1116(ra) # 80002774 <_ZdlPv>
    80004bd8:	000c0113          	mv	sp,s8
}
    80004bdc:	f8040113          	addi	sp,s0,-128
    80004be0:	07813083          	ld	ra,120(sp)
    80004be4:	07013403          	ld	s0,112(sp)
    80004be8:	06813483          	ld	s1,104(sp)
    80004bec:	06013903          	ld	s2,96(sp)
    80004bf0:	05813983          	ld	s3,88(sp)
    80004bf4:	05013a03          	ld	s4,80(sp)
    80004bf8:	04813a83          	ld	s5,72(sp)
    80004bfc:	04013b03          	ld	s6,64(sp)
    80004c00:	03813b83          	ld	s7,56(sp)
    80004c04:	03013c03          	ld	s8,48(sp)
    80004c08:	02813c83          	ld	s9,40(sp)
    80004c0c:	08010113          	addi	sp,sp,128
    80004c10:	00008067          	ret
    80004c14:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80004c18:	000a8513          	mv	a0,s5
    80004c1c:	ffffe097          	auipc	ra,0xffffe
    80004c20:	b58080e7          	jalr	-1192(ra) # 80002774 <_ZdlPv>
    80004c24:	00048513          	mv	a0,s1
    80004c28:	00009097          	auipc	ra,0x9
    80004c2c:	1a0080e7          	jalr	416(ra) # 8000ddc8 <_Unwind_Resume>
    80004c30:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80004c34:	00090513          	mv	a0,s2
    80004c38:	ffffe097          	auipc	ra,0xffffe
    80004c3c:	b3c080e7          	jalr	-1220(ra) # 80002774 <_ZdlPv>
    80004c40:	00048513          	mv	a0,s1
    80004c44:	00009097          	auipc	ra,0x9
    80004c48:	184080e7          	jalr	388(ra) # 8000ddc8 <_Unwind_Resume>
    80004c4c:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004c50:	000b8513          	mv	a0,s7
    80004c54:	ffffe097          	auipc	ra,0xffffe
    80004c58:	b20080e7          	jalr	-1248(ra) # 80002774 <_ZdlPv>
    80004c5c:	00048513          	mv	a0,s1
    80004c60:	00009097          	auipc	ra,0x9
    80004c64:	168080e7          	jalr	360(ra) # 8000ddc8 <_Unwind_Resume>
    80004c68:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004c6c:	00048513          	mv	a0,s1
    80004c70:	ffffe097          	auipc	ra,0xffffe
    80004c74:	b04080e7          	jalr	-1276(ra) # 80002774 <_ZdlPv>
    80004c78:	00090513          	mv	a0,s2
    80004c7c:	00009097          	auipc	ra,0x9
    80004c80:	14c080e7          	jalr	332(ra) # 8000ddc8 <_Unwind_Resume>
    80004c84:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    80004c88:	000c8513          	mv	a0,s9
    80004c8c:	ffffe097          	auipc	ra,0xffffe
    80004c90:	ae8080e7          	jalr	-1304(ra) # 80002774 <_ZdlPv>
    80004c94:	00048513          	mv	a0,s1
    80004c98:	00009097          	auipc	ra,0x9
    80004c9c:	130080e7          	jalr	304(ra) # 8000ddc8 <_Unwind_Resume>

0000000080004ca0 <_ZN8Consumer3runEv>:
    void run() override {
    80004ca0:	fd010113          	addi	sp,sp,-48
    80004ca4:	02113423          	sd	ra,40(sp)
    80004ca8:	02813023          	sd	s0,32(sp)
    80004cac:	00913c23          	sd	s1,24(sp)
    80004cb0:	01213823          	sd	s2,16(sp)
    80004cb4:	01313423          	sd	s3,8(sp)
    80004cb8:	03010413          	addi	s0,sp,48
    80004cbc:	00050913          	mv	s2,a0
        int i = 0;
    80004cc0:	00000993          	li	s3,0
    80004cc4:	0100006f          	j	80004cd4 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    80004cc8:	00a00513          	li	a0,10
    80004ccc:	ffffe097          	auipc	ra,0xffffe
    80004cd0:	ec8080e7          	jalr	-312(ra) # 80002b94 <_ZN7Console4putcEc>
        while (!threadEnd) {
    80004cd4:	00008797          	auipc	a5,0x8
    80004cd8:	ff47a783          	lw	a5,-12(a5) # 8000ccc8 <_ZL9threadEnd>
    80004cdc:	04079a63          	bnez	a5,80004d30 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80004ce0:	02093783          	ld	a5,32(s2)
    80004ce4:	0087b503          	ld	a0,8(a5)
    80004ce8:	00001097          	auipc	ra,0x1
    80004cec:	638080e7          	jalr	1592(ra) # 80006320 <_ZN9BufferCPP3getEv>
            i++;
    80004cf0:	0019849b          	addiw	s1,s3,1
    80004cf4:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80004cf8:	0ff57513          	andi	a0,a0,255
    80004cfc:	ffffe097          	auipc	ra,0xffffe
    80004d00:	e98080e7          	jalr	-360(ra) # 80002b94 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80004d04:	05000793          	li	a5,80
    80004d08:	02f4e4bb          	remw	s1,s1,a5
    80004d0c:	fc0494e3          	bnez	s1,80004cd4 <_ZN8Consumer3runEv+0x34>
    80004d10:	fb9ff06f          	j	80004cc8 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80004d14:	02093783          	ld	a5,32(s2)
    80004d18:	0087b503          	ld	a0,8(a5)
    80004d1c:	00001097          	auipc	ra,0x1
    80004d20:	604080e7          	jalr	1540(ra) # 80006320 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80004d24:	0ff57513          	andi	a0,a0,255
    80004d28:	ffffe097          	auipc	ra,0xffffe
    80004d2c:	e6c080e7          	jalr	-404(ra) # 80002b94 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80004d30:	02093783          	ld	a5,32(s2)
    80004d34:	0087b503          	ld	a0,8(a5)
    80004d38:	00001097          	auipc	ra,0x1
    80004d3c:	674080e7          	jalr	1652(ra) # 800063ac <_ZN9BufferCPP6getCntEv>
    80004d40:	fca04ae3          	bgtz	a0,80004d14 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80004d44:	02093783          	ld	a5,32(s2)
    80004d48:	0107b503          	ld	a0,16(a5)
    80004d4c:	ffffe097          	auipc	ra,0xffffe
    80004d50:	d80080e7          	jalr	-640(ra) # 80002acc <_ZN9Semaphore6signalEv>
    }
    80004d54:	02813083          	ld	ra,40(sp)
    80004d58:	02013403          	ld	s0,32(sp)
    80004d5c:	01813483          	ld	s1,24(sp)
    80004d60:	01013903          	ld	s2,16(sp)
    80004d64:	00813983          	ld	s3,8(sp)
    80004d68:	03010113          	addi	sp,sp,48
    80004d6c:	00008067          	ret

0000000080004d70 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80004d70:	ff010113          	addi	sp,sp,-16
    80004d74:	00113423          	sd	ra,8(sp)
    80004d78:	00813023          	sd	s0,0(sp)
    80004d7c:	01010413          	addi	s0,sp,16
    80004d80:	00008797          	auipc	a5,0x8
    80004d84:	c9078793          	addi	a5,a5,-880 # 8000ca10 <_ZTV8Consumer+0x10>
    80004d88:	00f53023          	sd	a5,0(a0)
    80004d8c:	ffffe097          	auipc	ra,0xffffe
    80004d90:	8a8080e7          	jalr	-1880(ra) # 80002634 <_ZN6ThreadD1Ev>
    80004d94:	00813083          	ld	ra,8(sp)
    80004d98:	00013403          	ld	s0,0(sp)
    80004d9c:	01010113          	addi	sp,sp,16
    80004da0:	00008067          	ret

0000000080004da4 <_ZN8ConsumerD0Ev>:
    80004da4:	fe010113          	addi	sp,sp,-32
    80004da8:	00113c23          	sd	ra,24(sp)
    80004dac:	00813823          	sd	s0,16(sp)
    80004db0:	00913423          	sd	s1,8(sp)
    80004db4:	02010413          	addi	s0,sp,32
    80004db8:	00050493          	mv	s1,a0
    80004dbc:	00008797          	auipc	a5,0x8
    80004dc0:	c5478793          	addi	a5,a5,-940 # 8000ca10 <_ZTV8Consumer+0x10>
    80004dc4:	00f53023          	sd	a5,0(a0)
    80004dc8:	ffffe097          	auipc	ra,0xffffe
    80004dcc:	86c080e7          	jalr	-1940(ra) # 80002634 <_ZN6ThreadD1Ev>
    80004dd0:	00048513          	mv	a0,s1
    80004dd4:	ffffe097          	auipc	ra,0xffffe
    80004dd8:	9a0080e7          	jalr	-1632(ra) # 80002774 <_ZdlPv>
    80004ddc:	01813083          	ld	ra,24(sp)
    80004de0:	01013403          	ld	s0,16(sp)
    80004de4:	00813483          	ld	s1,8(sp)
    80004de8:	02010113          	addi	sp,sp,32
    80004dec:	00008067          	ret

0000000080004df0 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80004df0:	ff010113          	addi	sp,sp,-16
    80004df4:	00113423          	sd	ra,8(sp)
    80004df8:	00813023          	sd	s0,0(sp)
    80004dfc:	01010413          	addi	s0,sp,16
    80004e00:	00008797          	auipc	a5,0x8
    80004e04:	bc078793          	addi	a5,a5,-1088 # 8000c9c0 <_ZTV16ProducerKeyborad+0x10>
    80004e08:	00f53023          	sd	a5,0(a0)
    80004e0c:	ffffe097          	auipc	ra,0xffffe
    80004e10:	828080e7          	jalr	-2008(ra) # 80002634 <_ZN6ThreadD1Ev>
    80004e14:	00813083          	ld	ra,8(sp)
    80004e18:	00013403          	ld	s0,0(sp)
    80004e1c:	01010113          	addi	sp,sp,16
    80004e20:	00008067          	ret

0000000080004e24 <_ZN16ProducerKeyboradD0Ev>:
    80004e24:	fe010113          	addi	sp,sp,-32
    80004e28:	00113c23          	sd	ra,24(sp)
    80004e2c:	00813823          	sd	s0,16(sp)
    80004e30:	00913423          	sd	s1,8(sp)
    80004e34:	02010413          	addi	s0,sp,32
    80004e38:	00050493          	mv	s1,a0
    80004e3c:	00008797          	auipc	a5,0x8
    80004e40:	b8478793          	addi	a5,a5,-1148 # 8000c9c0 <_ZTV16ProducerKeyborad+0x10>
    80004e44:	00f53023          	sd	a5,0(a0)
    80004e48:	ffffd097          	auipc	ra,0xffffd
    80004e4c:	7ec080e7          	jalr	2028(ra) # 80002634 <_ZN6ThreadD1Ev>
    80004e50:	00048513          	mv	a0,s1
    80004e54:	ffffe097          	auipc	ra,0xffffe
    80004e58:	920080e7          	jalr	-1760(ra) # 80002774 <_ZdlPv>
    80004e5c:	01813083          	ld	ra,24(sp)
    80004e60:	01013403          	ld	s0,16(sp)
    80004e64:	00813483          	ld	s1,8(sp)
    80004e68:	02010113          	addi	sp,sp,32
    80004e6c:	00008067          	ret

0000000080004e70 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80004e70:	ff010113          	addi	sp,sp,-16
    80004e74:	00113423          	sd	ra,8(sp)
    80004e78:	00813023          	sd	s0,0(sp)
    80004e7c:	01010413          	addi	s0,sp,16
    80004e80:	00008797          	auipc	a5,0x8
    80004e84:	b6878793          	addi	a5,a5,-1176 # 8000c9e8 <_ZTV8Producer+0x10>
    80004e88:	00f53023          	sd	a5,0(a0)
    80004e8c:	ffffd097          	auipc	ra,0xffffd
    80004e90:	7a8080e7          	jalr	1960(ra) # 80002634 <_ZN6ThreadD1Ev>
    80004e94:	00813083          	ld	ra,8(sp)
    80004e98:	00013403          	ld	s0,0(sp)
    80004e9c:	01010113          	addi	sp,sp,16
    80004ea0:	00008067          	ret

0000000080004ea4 <_ZN8ProducerD0Ev>:
    80004ea4:	fe010113          	addi	sp,sp,-32
    80004ea8:	00113c23          	sd	ra,24(sp)
    80004eac:	00813823          	sd	s0,16(sp)
    80004eb0:	00913423          	sd	s1,8(sp)
    80004eb4:	02010413          	addi	s0,sp,32
    80004eb8:	00050493          	mv	s1,a0
    80004ebc:	00008797          	auipc	a5,0x8
    80004ec0:	b2c78793          	addi	a5,a5,-1236 # 8000c9e8 <_ZTV8Producer+0x10>
    80004ec4:	00f53023          	sd	a5,0(a0)
    80004ec8:	ffffd097          	auipc	ra,0xffffd
    80004ecc:	76c080e7          	jalr	1900(ra) # 80002634 <_ZN6ThreadD1Ev>
    80004ed0:	00048513          	mv	a0,s1
    80004ed4:	ffffe097          	auipc	ra,0xffffe
    80004ed8:	8a0080e7          	jalr	-1888(ra) # 80002774 <_ZdlPv>
    80004edc:	01813083          	ld	ra,24(sp)
    80004ee0:	01013403          	ld	s0,16(sp)
    80004ee4:	00813483          	ld	s1,8(sp)
    80004ee8:	02010113          	addi	sp,sp,32
    80004eec:	00008067          	ret

0000000080004ef0 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80004ef0:	fe010113          	addi	sp,sp,-32
    80004ef4:	00113c23          	sd	ra,24(sp)
    80004ef8:	00813823          	sd	s0,16(sp)
    80004efc:	00913423          	sd	s1,8(sp)
    80004f00:	02010413          	addi	s0,sp,32
    80004f04:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80004f08:	ffffc097          	auipc	ra,0xffffc
    80004f0c:	660080e7          	jalr	1632(ra) # 80001568 <_Z4getcv>
    80004f10:	0005059b          	sext.w	a1,a0
    80004f14:	01b00793          	li	a5,27
    80004f18:	00f58c63          	beq	a1,a5,80004f30 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80004f1c:	0204b783          	ld	a5,32(s1)
    80004f20:	0087b503          	ld	a0,8(a5)
    80004f24:	00001097          	auipc	ra,0x1
    80004f28:	36c080e7          	jalr	876(ra) # 80006290 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80004f2c:	fddff06f          	j	80004f08 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80004f30:	00100793          	li	a5,1
    80004f34:	00008717          	auipc	a4,0x8
    80004f38:	d8f72a23          	sw	a5,-620(a4) # 8000ccc8 <_ZL9threadEnd>
        td->buffer->put('!');
    80004f3c:	0204b783          	ld	a5,32(s1)
    80004f40:	02100593          	li	a1,33
    80004f44:	0087b503          	ld	a0,8(a5)
    80004f48:	00001097          	auipc	ra,0x1
    80004f4c:	348080e7          	jalr	840(ra) # 80006290 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80004f50:	0204b783          	ld	a5,32(s1)
    80004f54:	0107b503          	ld	a0,16(a5)
    80004f58:	ffffe097          	auipc	ra,0xffffe
    80004f5c:	b74080e7          	jalr	-1164(ra) # 80002acc <_ZN9Semaphore6signalEv>
    }
    80004f60:	01813083          	ld	ra,24(sp)
    80004f64:	01013403          	ld	s0,16(sp)
    80004f68:	00813483          	ld	s1,8(sp)
    80004f6c:	02010113          	addi	sp,sp,32
    80004f70:	00008067          	ret

0000000080004f74 <_ZN8Producer3runEv>:
    void run() override {
    80004f74:	fe010113          	addi	sp,sp,-32
    80004f78:	00113c23          	sd	ra,24(sp)
    80004f7c:	00813823          	sd	s0,16(sp)
    80004f80:	00913423          	sd	s1,8(sp)
    80004f84:	01213023          	sd	s2,0(sp)
    80004f88:	02010413          	addi	s0,sp,32
    80004f8c:	00050493          	mv	s1,a0
        int i = 0;
    80004f90:	00000913          	li	s2,0
        while (!threadEnd) {
    80004f94:	00008797          	auipc	a5,0x8
    80004f98:	d347a783          	lw	a5,-716(a5) # 8000ccc8 <_ZL9threadEnd>
    80004f9c:	04079263          	bnez	a5,80004fe0 <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    80004fa0:	0204b783          	ld	a5,32(s1)
    80004fa4:	0007a583          	lw	a1,0(a5)
    80004fa8:	0305859b          	addiw	a1,a1,48
    80004fac:	0087b503          	ld	a0,8(a5)
    80004fb0:	00001097          	auipc	ra,0x1
    80004fb4:	2e0080e7          	jalr	736(ra) # 80006290 <_ZN9BufferCPP3putEi>
            i++;
    80004fb8:	0019071b          	addiw	a4,s2,1
    80004fbc:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    80004fc0:	0204b783          	ld	a5,32(s1)
    80004fc4:	0007a783          	lw	a5,0(a5)
    80004fc8:	00e787bb          	addw	a5,a5,a4
    80004fcc:	00500513          	li	a0,5
    80004fd0:	02a7e53b          	remw	a0,a5,a0
    80004fd4:	ffffe097          	auipc	ra,0xffffe
    80004fd8:	98c080e7          	jalr	-1652(ra) # 80002960 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80004fdc:	fb9ff06f          	j	80004f94 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80004fe0:	0204b783          	ld	a5,32(s1)
    80004fe4:	0107b503          	ld	a0,16(a5)
    80004fe8:	ffffe097          	auipc	ra,0xffffe
    80004fec:	ae4080e7          	jalr	-1308(ra) # 80002acc <_ZN9Semaphore6signalEv>
    }
    80004ff0:	01813083          	ld	ra,24(sp)
    80004ff4:	01013403          	ld	s0,16(sp)
    80004ff8:	00813483          	ld	s1,8(sp)
    80004ffc:	00013903          	ld	s2,0(sp)
    80005000:	02010113          	addi	sp,sp,32
    80005004:	00008067          	ret

0000000080005008 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80005008:	fe010113          	addi	sp,sp,-32
    8000500c:	00113c23          	sd	ra,24(sp)
    80005010:	00813823          	sd	s0,16(sp)
    80005014:	00913423          	sd	s1,8(sp)
    80005018:	01213023          	sd	s2,0(sp)
    8000501c:	02010413          	addi	s0,sp,32
    80005020:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80005024:	00100793          	li	a5,1
    80005028:	02a7f863          	bgeu	a5,a0,80005058 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    8000502c:	00a00793          	li	a5,10
    80005030:	02f577b3          	remu	a5,a0,a5
    80005034:	02078e63          	beqz	a5,80005070 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80005038:	fff48513          	addi	a0,s1,-1
    8000503c:	00000097          	auipc	ra,0x0
    80005040:	fcc080e7          	jalr	-52(ra) # 80005008 <_ZL9fibonaccim>
    80005044:	00050913          	mv	s2,a0
    80005048:	ffe48513          	addi	a0,s1,-2
    8000504c:	00000097          	auipc	ra,0x0
    80005050:	fbc080e7          	jalr	-68(ra) # 80005008 <_ZL9fibonaccim>
    80005054:	00a90533          	add	a0,s2,a0
}
    80005058:	01813083          	ld	ra,24(sp)
    8000505c:	01013403          	ld	s0,16(sp)
    80005060:	00813483          	ld	s1,8(sp)
    80005064:	00013903          	ld	s2,0(sp)
    80005068:	02010113          	addi	sp,sp,32
    8000506c:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80005070:	ffffc097          	auipc	ra,0xffffc
    80005074:	3b8080e7          	jalr	952(ra) # 80001428 <_Z15thread_dispatchv>
    80005078:	fc1ff06f          	j	80005038 <_ZL9fibonaccim+0x30>

000000008000507c <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    8000507c:	fe010113          	addi	sp,sp,-32
    80005080:	00113c23          	sd	ra,24(sp)
    80005084:	00813823          	sd	s0,16(sp)
    80005088:	00913423          	sd	s1,8(sp)
    8000508c:	01213023          	sd	s2,0(sp)
    80005090:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80005094:	00a00493          	li	s1,10
    80005098:	0400006f          	j	800050d8 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000509c:	00005517          	auipc	a0,0x5
    800050a0:	2f450513          	addi	a0,a0,756 # 8000a390 <_ZZ9kPrintIntmE6digits+0x320>
    800050a4:	00001097          	auipc	ra,0x1
    800050a8:	dc8080e7          	jalr	-568(ra) # 80005e6c <_Z11printStringPKc>
    800050ac:	00000613          	li	a2,0
    800050b0:	00a00593          	li	a1,10
    800050b4:	00048513          	mv	a0,s1
    800050b8:	00001097          	auipc	ra,0x1
    800050bc:	f64080e7          	jalr	-156(ra) # 8000601c <_Z8printIntiii>
    800050c0:	00005517          	auipc	a0,0x5
    800050c4:	4c050513          	addi	a0,a0,1216 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800050c8:	00001097          	auipc	ra,0x1
    800050cc:	da4080e7          	jalr	-604(ra) # 80005e6c <_Z11printStringPKc>
    for (; i < 13; i++) {
    800050d0:	0014849b          	addiw	s1,s1,1
    800050d4:	0ff4f493          	andi	s1,s1,255
    800050d8:	00c00793          	li	a5,12
    800050dc:	fc97f0e3          	bgeu	a5,s1,8000509c <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800050e0:	00005517          	auipc	a0,0x5
    800050e4:	2b850513          	addi	a0,a0,696 # 8000a398 <_ZZ9kPrintIntmE6digits+0x328>
    800050e8:	00001097          	auipc	ra,0x1
    800050ec:	d84080e7          	jalr	-636(ra) # 80005e6c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800050f0:	00500313          	li	t1,5
    thread_dispatch();
    800050f4:	ffffc097          	auipc	ra,0xffffc
    800050f8:	334080e7          	jalr	820(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800050fc:	01000513          	li	a0,16
    80005100:	00000097          	auipc	ra,0x0
    80005104:	f08080e7          	jalr	-248(ra) # 80005008 <_ZL9fibonaccim>
    80005108:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    8000510c:	00005517          	auipc	a0,0x5
    80005110:	29c50513          	addi	a0,a0,668 # 8000a3a8 <_ZZ9kPrintIntmE6digits+0x338>
    80005114:	00001097          	auipc	ra,0x1
    80005118:	d58080e7          	jalr	-680(ra) # 80005e6c <_Z11printStringPKc>
    8000511c:	00000613          	li	a2,0
    80005120:	00a00593          	li	a1,10
    80005124:	0009051b          	sext.w	a0,s2
    80005128:	00001097          	auipc	ra,0x1
    8000512c:	ef4080e7          	jalr	-268(ra) # 8000601c <_Z8printIntiii>
    80005130:	00005517          	auipc	a0,0x5
    80005134:	45050513          	addi	a0,a0,1104 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80005138:	00001097          	auipc	ra,0x1
    8000513c:	d34080e7          	jalr	-716(ra) # 80005e6c <_Z11printStringPKc>
    80005140:	0400006f          	j	80005180 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005144:	00005517          	auipc	a0,0x5
    80005148:	24c50513          	addi	a0,a0,588 # 8000a390 <_ZZ9kPrintIntmE6digits+0x320>
    8000514c:	00001097          	auipc	ra,0x1
    80005150:	d20080e7          	jalr	-736(ra) # 80005e6c <_Z11printStringPKc>
    80005154:	00000613          	li	a2,0
    80005158:	00a00593          	li	a1,10
    8000515c:	00048513          	mv	a0,s1
    80005160:	00001097          	auipc	ra,0x1
    80005164:	ebc080e7          	jalr	-324(ra) # 8000601c <_Z8printIntiii>
    80005168:	00005517          	auipc	a0,0x5
    8000516c:	41850513          	addi	a0,a0,1048 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80005170:	00001097          	auipc	ra,0x1
    80005174:	cfc080e7          	jalr	-772(ra) # 80005e6c <_Z11printStringPKc>
    for (; i < 16; i++) {
    80005178:	0014849b          	addiw	s1,s1,1
    8000517c:	0ff4f493          	andi	s1,s1,255
    80005180:	00f00793          	li	a5,15
    80005184:	fc97f0e3          	bgeu	a5,s1,80005144 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80005188:	00005517          	auipc	a0,0x5
    8000518c:	23050513          	addi	a0,a0,560 # 8000a3b8 <_ZZ9kPrintIntmE6digits+0x348>
    80005190:	00001097          	auipc	ra,0x1
    80005194:	cdc080e7          	jalr	-804(ra) # 80005e6c <_Z11printStringPKc>
    finishedD = true;
    80005198:	00100793          	li	a5,1
    8000519c:	00008717          	auipc	a4,0x8
    800051a0:	b2f70e23          	sb	a5,-1220(a4) # 8000ccd8 <_ZL9finishedD>
    thread_dispatch();
    800051a4:	ffffc097          	auipc	ra,0xffffc
    800051a8:	284080e7          	jalr	644(ra) # 80001428 <_Z15thread_dispatchv>
}
    800051ac:	01813083          	ld	ra,24(sp)
    800051b0:	01013403          	ld	s0,16(sp)
    800051b4:	00813483          	ld	s1,8(sp)
    800051b8:	00013903          	ld	s2,0(sp)
    800051bc:	02010113          	addi	sp,sp,32
    800051c0:	00008067          	ret

00000000800051c4 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800051c4:	fe010113          	addi	sp,sp,-32
    800051c8:	00113c23          	sd	ra,24(sp)
    800051cc:	00813823          	sd	s0,16(sp)
    800051d0:	00913423          	sd	s1,8(sp)
    800051d4:	01213023          	sd	s2,0(sp)
    800051d8:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800051dc:	00000493          	li	s1,0
    800051e0:	0400006f          	j	80005220 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800051e4:	00005517          	auipc	a0,0x5
    800051e8:	16c50513          	addi	a0,a0,364 # 8000a350 <_ZZ9kPrintIntmE6digits+0x2e0>
    800051ec:	00001097          	auipc	ra,0x1
    800051f0:	c80080e7          	jalr	-896(ra) # 80005e6c <_Z11printStringPKc>
    800051f4:	00000613          	li	a2,0
    800051f8:	00a00593          	li	a1,10
    800051fc:	00048513          	mv	a0,s1
    80005200:	00001097          	auipc	ra,0x1
    80005204:	e1c080e7          	jalr	-484(ra) # 8000601c <_Z8printIntiii>
    80005208:	00005517          	auipc	a0,0x5
    8000520c:	37850513          	addi	a0,a0,888 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80005210:	00001097          	auipc	ra,0x1
    80005214:	c5c080e7          	jalr	-932(ra) # 80005e6c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80005218:	0014849b          	addiw	s1,s1,1
    8000521c:	0ff4f493          	andi	s1,s1,255
    80005220:	00200793          	li	a5,2
    80005224:	fc97f0e3          	bgeu	a5,s1,800051e4 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80005228:	00005517          	auipc	a0,0x5
    8000522c:	13050513          	addi	a0,a0,304 # 8000a358 <_ZZ9kPrintIntmE6digits+0x2e8>
    80005230:	00001097          	auipc	ra,0x1
    80005234:	c3c080e7          	jalr	-964(ra) # 80005e6c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80005238:	00700313          	li	t1,7
    thread_dispatch();
    8000523c:	ffffc097          	auipc	ra,0xffffc
    80005240:	1ec080e7          	jalr	492(ra) # 80001428 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80005244:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80005248:	00005517          	auipc	a0,0x5
    8000524c:	12050513          	addi	a0,a0,288 # 8000a368 <_ZZ9kPrintIntmE6digits+0x2f8>
    80005250:	00001097          	auipc	ra,0x1
    80005254:	c1c080e7          	jalr	-996(ra) # 80005e6c <_Z11printStringPKc>
    80005258:	00000613          	li	a2,0
    8000525c:	00a00593          	li	a1,10
    80005260:	0009051b          	sext.w	a0,s2
    80005264:	00001097          	auipc	ra,0x1
    80005268:	db8080e7          	jalr	-584(ra) # 8000601c <_Z8printIntiii>
    8000526c:	00005517          	auipc	a0,0x5
    80005270:	31450513          	addi	a0,a0,788 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80005274:	00001097          	auipc	ra,0x1
    80005278:	bf8080e7          	jalr	-1032(ra) # 80005e6c <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    8000527c:	00c00513          	li	a0,12
    80005280:	00000097          	auipc	ra,0x0
    80005284:	d88080e7          	jalr	-632(ra) # 80005008 <_ZL9fibonaccim>
    80005288:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    8000528c:	00005517          	auipc	a0,0x5
    80005290:	0e450513          	addi	a0,a0,228 # 8000a370 <_ZZ9kPrintIntmE6digits+0x300>
    80005294:	00001097          	auipc	ra,0x1
    80005298:	bd8080e7          	jalr	-1064(ra) # 80005e6c <_Z11printStringPKc>
    8000529c:	00000613          	li	a2,0
    800052a0:	00a00593          	li	a1,10
    800052a4:	0009051b          	sext.w	a0,s2
    800052a8:	00001097          	auipc	ra,0x1
    800052ac:	d74080e7          	jalr	-652(ra) # 8000601c <_Z8printIntiii>
    800052b0:	00005517          	auipc	a0,0x5
    800052b4:	2d050513          	addi	a0,a0,720 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800052b8:	00001097          	auipc	ra,0x1
    800052bc:	bb4080e7          	jalr	-1100(ra) # 80005e6c <_Z11printStringPKc>
    800052c0:	0400006f          	j	80005300 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800052c4:	00005517          	auipc	a0,0x5
    800052c8:	08c50513          	addi	a0,a0,140 # 8000a350 <_ZZ9kPrintIntmE6digits+0x2e0>
    800052cc:	00001097          	auipc	ra,0x1
    800052d0:	ba0080e7          	jalr	-1120(ra) # 80005e6c <_Z11printStringPKc>
    800052d4:	00000613          	li	a2,0
    800052d8:	00a00593          	li	a1,10
    800052dc:	00048513          	mv	a0,s1
    800052e0:	00001097          	auipc	ra,0x1
    800052e4:	d3c080e7          	jalr	-708(ra) # 8000601c <_Z8printIntiii>
    800052e8:	00005517          	auipc	a0,0x5
    800052ec:	29850513          	addi	a0,a0,664 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800052f0:	00001097          	auipc	ra,0x1
    800052f4:	b7c080e7          	jalr	-1156(ra) # 80005e6c <_Z11printStringPKc>
    for (; i < 6; i++) {
    800052f8:	0014849b          	addiw	s1,s1,1
    800052fc:	0ff4f493          	andi	s1,s1,255
    80005300:	00500793          	li	a5,5
    80005304:	fc97f0e3          	bgeu	a5,s1,800052c4 <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    80005308:	00005517          	auipc	a0,0x5
    8000530c:	07850513          	addi	a0,a0,120 # 8000a380 <_ZZ9kPrintIntmE6digits+0x310>
    80005310:	00001097          	auipc	ra,0x1
    80005314:	b5c080e7          	jalr	-1188(ra) # 80005e6c <_Z11printStringPKc>
    finishedC = true;
    80005318:	00100793          	li	a5,1
    8000531c:	00008717          	auipc	a4,0x8
    80005320:	9af70ea3          	sb	a5,-1603(a4) # 8000ccd9 <_ZL9finishedC>
    thread_dispatch();
    80005324:	ffffc097          	auipc	ra,0xffffc
    80005328:	104080e7          	jalr	260(ra) # 80001428 <_Z15thread_dispatchv>
}
    8000532c:	01813083          	ld	ra,24(sp)
    80005330:	01013403          	ld	s0,16(sp)
    80005334:	00813483          	ld	s1,8(sp)
    80005338:	00013903          	ld	s2,0(sp)
    8000533c:	02010113          	addi	sp,sp,32
    80005340:	00008067          	ret

0000000080005344 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80005344:	fe010113          	addi	sp,sp,-32
    80005348:	00113c23          	sd	ra,24(sp)
    8000534c:	00813823          	sd	s0,16(sp)
    80005350:	00913423          	sd	s1,8(sp)
    80005354:	01213023          	sd	s2,0(sp)
    80005358:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    8000535c:	00000913          	li	s2,0
    80005360:	0380006f          	j	80005398 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80005364:	ffffc097          	auipc	ra,0xffffc
    80005368:	0c4080e7          	jalr	196(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    8000536c:	00148493          	addi	s1,s1,1
    80005370:	000027b7          	lui	a5,0x2
    80005374:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005378:	0097ee63          	bltu	a5,s1,80005394 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    8000537c:	00000713          	li	a4,0
    80005380:	000077b7          	lui	a5,0x7
    80005384:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005388:	fce7eee3          	bltu	a5,a4,80005364 <_ZL11workerBodyBPv+0x20>
    8000538c:	00170713          	addi	a4,a4,1
    80005390:	ff1ff06f          	j	80005380 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80005394:	00190913          	addi	s2,s2,1
    80005398:	00f00793          	li	a5,15
    8000539c:	0527e063          	bltu	a5,s2,800053dc <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800053a0:	00005517          	auipc	a0,0x5
    800053a4:	f9850513          	addi	a0,a0,-104 # 8000a338 <_ZZ9kPrintIntmE6digits+0x2c8>
    800053a8:	00001097          	auipc	ra,0x1
    800053ac:	ac4080e7          	jalr	-1340(ra) # 80005e6c <_Z11printStringPKc>
    800053b0:	00000613          	li	a2,0
    800053b4:	00a00593          	li	a1,10
    800053b8:	0009051b          	sext.w	a0,s2
    800053bc:	00001097          	auipc	ra,0x1
    800053c0:	c60080e7          	jalr	-928(ra) # 8000601c <_Z8printIntiii>
    800053c4:	00005517          	auipc	a0,0x5
    800053c8:	1bc50513          	addi	a0,a0,444 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800053cc:	00001097          	auipc	ra,0x1
    800053d0:	aa0080e7          	jalr	-1376(ra) # 80005e6c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800053d4:	00000493          	li	s1,0
    800053d8:	f99ff06f          	j	80005370 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    800053dc:	00005517          	auipc	a0,0x5
    800053e0:	f6450513          	addi	a0,a0,-156 # 8000a340 <_ZZ9kPrintIntmE6digits+0x2d0>
    800053e4:	00001097          	auipc	ra,0x1
    800053e8:	a88080e7          	jalr	-1400(ra) # 80005e6c <_Z11printStringPKc>
    finishedB = true;
    800053ec:	00100793          	li	a5,1
    800053f0:	00008717          	auipc	a4,0x8
    800053f4:	8ef70523          	sb	a5,-1814(a4) # 8000ccda <_ZL9finishedB>
    thread_dispatch();
    800053f8:	ffffc097          	auipc	ra,0xffffc
    800053fc:	030080e7          	jalr	48(ra) # 80001428 <_Z15thread_dispatchv>
}
    80005400:	01813083          	ld	ra,24(sp)
    80005404:	01013403          	ld	s0,16(sp)
    80005408:	00813483          	ld	s1,8(sp)
    8000540c:	00013903          	ld	s2,0(sp)
    80005410:	02010113          	addi	sp,sp,32
    80005414:	00008067          	ret

0000000080005418 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80005418:	fe010113          	addi	sp,sp,-32
    8000541c:	00113c23          	sd	ra,24(sp)
    80005420:	00813823          	sd	s0,16(sp)
    80005424:	00913423          	sd	s1,8(sp)
    80005428:	01213023          	sd	s2,0(sp)
    8000542c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80005430:	00000913          	li	s2,0
    80005434:	0380006f          	j	8000546c <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80005438:	ffffc097          	auipc	ra,0xffffc
    8000543c:	ff0080e7          	jalr	-16(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005440:	00148493          	addi	s1,s1,1
    80005444:	000027b7          	lui	a5,0x2
    80005448:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000544c:	0097ee63          	bltu	a5,s1,80005468 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005450:	00000713          	li	a4,0
    80005454:	000077b7          	lui	a5,0x7
    80005458:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000545c:	fce7eee3          	bltu	a5,a4,80005438 <_ZL11workerBodyAPv+0x20>
    80005460:	00170713          	addi	a4,a4,1
    80005464:	ff1ff06f          	j	80005454 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80005468:	00190913          	addi	s2,s2,1
    8000546c:	00900793          	li	a5,9
    80005470:	0527e063          	bltu	a5,s2,800054b0 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80005474:	00005517          	auipc	a0,0x5
    80005478:	eac50513          	addi	a0,a0,-340 # 8000a320 <_ZZ9kPrintIntmE6digits+0x2b0>
    8000547c:	00001097          	auipc	ra,0x1
    80005480:	9f0080e7          	jalr	-1552(ra) # 80005e6c <_Z11printStringPKc>
    80005484:	00000613          	li	a2,0
    80005488:	00a00593          	li	a1,10
    8000548c:	0009051b          	sext.w	a0,s2
    80005490:	00001097          	auipc	ra,0x1
    80005494:	b8c080e7          	jalr	-1140(ra) # 8000601c <_Z8printIntiii>
    80005498:	00005517          	auipc	a0,0x5
    8000549c:	0e850513          	addi	a0,a0,232 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800054a0:	00001097          	auipc	ra,0x1
    800054a4:	9cc080e7          	jalr	-1588(ra) # 80005e6c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800054a8:	00000493          	li	s1,0
    800054ac:	f99ff06f          	j	80005444 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    800054b0:	00005517          	auipc	a0,0x5
    800054b4:	e7850513          	addi	a0,a0,-392 # 8000a328 <_ZZ9kPrintIntmE6digits+0x2b8>
    800054b8:	00001097          	auipc	ra,0x1
    800054bc:	9b4080e7          	jalr	-1612(ra) # 80005e6c <_Z11printStringPKc>
    finishedA = true;
    800054c0:	00100793          	li	a5,1
    800054c4:	00008717          	auipc	a4,0x8
    800054c8:	80f70ba3          	sb	a5,-2025(a4) # 8000ccdb <_ZL9finishedA>
}
    800054cc:	01813083          	ld	ra,24(sp)
    800054d0:	01013403          	ld	s0,16(sp)
    800054d4:	00813483          	ld	s1,8(sp)
    800054d8:	00013903          	ld	s2,0(sp)
    800054dc:	02010113          	addi	sp,sp,32
    800054e0:	00008067          	ret

00000000800054e4 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    800054e4:	fd010113          	addi	sp,sp,-48
    800054e8:	02113423          	sd	ra,40(sp)
    800054ec:	02813023          	sd	s0,32(sp)
    800054f0:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    800054f4:	00000613          	li	a2,0
    800054f8:	00000597          	auipc	a1,0x0
    800054fc:	f2058593          	addi	a1,a1,-224 # 80005418 <_ZL11workerBodyAPv>
    80005500:	fd040513          	addi	a0,s0,-48
    80005504:	ffffc097          	auipc	ra,0xffffc
    80005508:	e7c080e7          	jalr	-388(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    8000550c:	00005517          	auipc	a0,0x5
    80005510:	ebc50513          	addi	a0,a0,-324 # 8000a3c8 <_ZZ9kPrintIntmE6digits+0x358>
    80005514:	00001097          	auipc	ra,0x1
    80005518:	958080e7          	jalr	-1704(ra) # 80005e6c <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    8000551c:	00000613          	li	a2,0
    80005520:	00000597          	auipc	a1,0x0
    80005524:	e2458593          	addi	a1,a1,-476 # 80005344 <_ZL11workerBodyBPv>
    80005528:	fd840513          	addi	a0,s0,-40
    8000552c:	ffffc097          	auipc	ra,0xffffc
    80005530:	e54080e7          	jalr	-428(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80005534:	00005517          	auipc	a0,0x5
    80005538:	eac50513          	addi	a0,a0,-340 # 8000a3e0 <_ZZ9kPrintIntmE6digits+0x370>
    8000553c:	00001097          	auipc	ra,0x1
    80005540:	930080e7          	jalr	-1744(ra) # 80005e6c <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80005544:	00000613          	li	a2,0
    80005548:	00000597          	auipc	a1,0x0
    8000554c:	c7c58593          	addi	a1,a1,-900 # 800051c4 <_ZL11workerBodyCPv>
    80005550:	fe040513          	addi	a0,s0,-32
    80005554:	ffffc097          	auipc	ra,0xffffc
    80005558:	e2c080e7          	jalr	-468(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    8000555c:	00005517          	auipc	a0,0x5
    80005560:	e9c50513          	addi	a0,a0,-356 # 8000a3f8 <_ZZ9kPrintIntmE6digits+0x388>
    80005564:	00001097          	auipc	ra,0x1
    80005568:	908080e7          	jalr	-1784(ra) # 80005e6c <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    8000556c:	00000613          	li	a2,0
    80005570:	00000597          	auipc	a1,0x0
    80005574:	b0c58593          	addi	a1,a1,-1268 # 8000507c <_ZL11workerBodyDPv>
    80005578:	fe840513          	addi	a0,s0,-24
    8000557c:	ffffc097          	auipc	ra,0xffffc
    80005580:	e04080e7          	jalr	-508(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80005584:	00005517          	auipc	a0,0x5
    80005588:	e8c50513          	addi	a0,a0,-372 # 8000a410 <_ZZ9kPrintIntmE6digits+0x3a0>
    8000558c:	00001097          	auipc	ra,0x1
    80005590:	8e0080e7          	jalr	-1824(ra) # 80005e6c <_Z11printStringPKc>
    80005594:	00c0006f          	j	800055a0 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80005598:	ffffc097          	auipc	ra,0xffffc
    8000559c:	e90080e7          	jalr	-368(ra) # 80001428 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800055a0:	00007797          	auipc	a5,0x7
    800055a4:	73b7c783          	lbu	a5,1851(a5) # 8000ccdb <_ZL9finishedA>
    800055a8:	fe0788e3          	beqz	a5,80005598 <_Z18Threads_C_API_testv+0xb4>
    800055ac:	00007797          	auipc	a5,0x7
    800055b0:	72e7c783          	lbu	a5,1838(a5) # 8000ccda <_ZL9finishedB>
    800055b4:	fe0782e3          	beqz	a5,80005598 <_Z18Threads_C_API_testv+0xb4>
    800055b8:	00007797          	auipc	a5,0x7
    800055bc:	7217c783          	lbu	a5,1825(a5) # 8000ccd9 <_ZL9finishedC>
    800055c0:	fc078ce3          	beqz	a5,80005598 <_Z18Threads_C_API_testv+0xb4>
    800055c4:	00007797          	auipc	a5,0x7
    800055c8:	7147c783          	lbu	a5,1812(a5) # 8000ccd8 <_ZL9finishedD>
    800055cc:	fc0786e3          	beqz	a5,80005598 <_Z18Threads_C_API_testv+0xb4>
    }

}
    800055d0:	02813083          	ld	ra,40(sp)
    800055d4:	02013403          	ld	s0,32(sp)
    800055d8:	03010113          	addi	sp,sp,48
    800055dc:	00008067          	ret

00000000800055e0 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    800055e0:	fd010113          	addi	sp,sp,-48
    800055e4:	02113423          	sd	ra,40(sp)
    800055e8:	02813023          	sd	s0,32(sp)
    800055ec:	00913c23          	sd	s1,24(sp)
    800055f0:	01213823          	sd	s2,16(sp)
    800055f4:	01313423          	sd	s3,8(sp)
    800055f8:	03010413          	addi	s0,sp,48
    800055fc:	00050993          	mv	s3,a0
    80005600:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80005604:	00000913          	li	s2,0
    80005608:	00c0006f          	j	80005614 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    8000560c:	ffffd097          	auipc	ra,0xffffd
    80005610:	32c080e7          	jalr	812(ra) # 80002938 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80005614:	ffffc097          	auipc	ra,0xffffc
    80005618:	f54080e7          	jalr	-172(ra) # 80001568 <_Z4getcv>
    8000561c:	0005059b          	sext.w	a1,a0
    80005620:	01b00793          	li	a5,27
    80005624:	02f58a63          	beq	a1,a5,80005658 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80005628:	0084b503          	ld	a0,8(s1)
    8000562c:	00001097          	auipc	ra,0x1
    80005630:	c64080e7          	jalr	-924(ra) # 80006290 <_ZN9BufferCPP3putEi>
        i++;
    80005634:	0019071b          	addiw	a4,s2,1
    80005638:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    8000563c:	0004a683          	lw	a3,0(s1)
    80005640:	0026979b          	slliw	a5,a3,0x2
    80005644:	00d787bb          	addw	a5,a5,a3
    80005648:	0017979b          	slliw	a5,a5,0x1
    8000564c:	02f767bb          	remw	a5,a4,a5
    80005650:	fc0792e3          	bnez	a5,80005614 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    80005654:	fb9ff06f          	j	8000560c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80005658:	00100793          	li	a5,1
    8000565c:	00007717          	auipc	a4,0x7
    80005660:	68f72223          	sw	a5,1668(a4) # 8000cce0 <_ZL9threadEnd>
    td->buffer->put('!');
    80005664:	0209b783          	ld	a5,32(s3)
    80005668:	02100593          	li	a1,33
    8000566c:	0087b503          	ld	a0,8(a5)
    80005670:	00001097          	auipc	ra,0x1
    80005674:	c20080e7          	jalr	-992(ra) # 80006290 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80005678:	0104b503          	ld	a0,16(s1)
    8000567c:	ffffd097          	auipc	ra,0xffffd
    80005680:	450080e7          	jalr	1104(ra) # 80002acc <_ZN9Semaphore6signalEv>
}
    80005684:	02813083          	ld	ra,40(sp)
    80005688:	02013403          	ld	s0,32(sp)
    8000568c:	01813483          	ld	s1,24(sp)
    80005690:	01013903          	ld	s2,16(sp)
    80005694:	00813983          	ld	s3,8(sp)
    80005698:	03010113          	addi	sp,sp,48
    8000569c:	00008067          	ret

00000000800056a0 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    800056a0:	fe010113          	addi	sp,sp,-32
    800056a4:	00113c23          	sd	ra,24(sp)
    800056a8:	00813823          	sd	s0,16(sp)
    800056ac:	00913423          	sd	s1,8(sp)
    800056b0:	01213023          	sd	s2,0(sp)
    800056b4:	02010413          	addi	s0,sp,32
    800056b8:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800056bc:	00000913          	li	s2,0
    800056c0:	00c0006f          	j	800056cc <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    800056c4:	ffffd097          	auipc	ra,0xffffd
    800056c8:	274080e7          	jalr	628(ra) # 80002938 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    800056cc:	00007797          	auipc	a5,0x7
    800056d0:	6147a783          	lw	a5,1556(a5) # 8000cce0 <_ZL9threadEnd>
    800056d4:	02079e63          	bnez	a5,80005710 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    800056d8:	0004a583          	lw	a1,0(s1)
    800056dc:	0305859b          	addiw	a1,a1,48
    800056e0:	0084b503          	ld	a0,8(s1)
    800056e4:	00001097          	auipc	ra,0x1
    800056e8:	bac080e7          	jalr	-1108(ra) # 80006290 <_ZN9BufferCPP3putEi>
        i++;
    800056ec:	0019071b          	addiw	a4,s2,1
    800056f0:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800056f4:	0004a683          	lw	a3,0(s1)
    800056f8:	0026979b          	slliw	a5,a3,0x2
    800056fc:	00d787bb          	addw	a5,a5,a3
    80005700:	0017979b          	slliw	a5,a5,0x1
    80005704:	02f767bb          	remw	a5,a4,a5
    80005708:	fc0792e3          	bnez	a5,800056cc <_ZN12ProducerSync8producerEPv+0x2c>
    8000570c:	fb9ff06f          	j	800056c4 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80005710:	0104b503          	ld	a0,16(s1)
    80005714:	ffffd097          	auipc	ra,0xffffd
    80005718:	3b8080e7          	jalr	952(ra) # 80002acc <_ZN9Semaphore6signalEv>
}
    8000571c:	01813083          	ld	ra,24(sp)
    80005720:	01013403          	ld	s0,16(sp)
    80005724:	00813483          	ld	s1,8(sp)
    80005728:	00013903          	ld	s2,0(sp)
    8000572c:	02010113          	addi	sp,sp,32
    80005730:	00008067          	ret

0000000080005734 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80005734:	fd010113          	addi	sp,sp,-48
    80005738:	02113423          	sd	ra,40(sp)
    8000573c:	02813023          	sd	s0,32(sp)
    80005740:	00913c23          	sd	s1,24(sp)
    80005744:	01213823          	sd	s2,16(sp)
    80005748:	01313423          	sd	s3,8(sp)
    8000574c:	01413023          	sd	s4,0(sp)
    80005750:	03010413          	addi	s0,sp,48
    80005754:	00050993          	mv	s3,a0
    80005758:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    8000575c:	00000a13          	li	s4,0
    80005760:	01c0006f          	j	8000577c <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80005764:	ffffd097          	auipc	ra,0xffffd
    80005768:	1d4080e7          	jalr	468(ra) # 80002938 <_ZN6Thread8dispatchEv>
    8000576c:	0500006f          	j	800057bc <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80005770:	00a00513          	li	a0,10
    80005774:	ffffc097          	auipc	ra,0xffffc
    80005778:	e1c080e7          	jalr	-484(ra) # 80001590 <_Z4putcc>
    while (!threadEnd) {
    8000577c:	00007797          	auipc	a5,0x7
    80005780:	5647a783          	lw	a5,1380(a5) # 8000cce0 <_ZL9threadEnd>
    80005784:	06079263          	bnez	a5,800057e8 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80005788:	00893503          	ld	a0,8(s2)
    8000578c:	00001097          	auipc	ra,0x1
    80005790:	b94080e7          	jalr	-1132(ra) # 80006320 <_ZN9BufferCPP3getEv>
        i++;
    80005794:	001a049b          	addiw	s1,s4,1
    80005798:	00048a1b          	sext.w	s4,s1
        putc(key);
    8000579c:	0ff57513          	andi	a0,a0,255
    800057a0:	ffffc097          	auipc	ra,0xffffc
    800057a4:	df0080e7          	jalr	-528(ra) # 80001590 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    800057a8:	00092703          	lw	a4,0(s2)
    800057ac:	0027179b          	slliw	a5,a4,0x2
    800057b0:	00e787bb          	addw	a5,a5,a4
    800057b4:	02f4e7bb          	remw	a5,s1,a5
    800057b8:	fa0786e3          	beqz	a5,80005764 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    800057bc:	05000793          	li	a5,80
    800057c0:	02f4e4bb          	remw	s1,s1,a5
    800057c4:	fa049ce3          	bnez	s1,8000577c <_ZN12ConsumerSync8consumerEPv+0x48>
    800057c8:	fa9ff06f          	j	80005770 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    800057cc:	0209b783          	ld	a5,32(s3)
    800057d0:	0087b503          	ld	a0,8(a5)
    800057d4:	00001097          	auipc	ra,0x1
    800057d8:	b4c080e7          	jalr	-1204(ra) # 80006320 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    800057dc:	0ff57513          	andi	a0,a0,255
    800057e0:	ffffd097          	auipc	ra,0xffffd
    800057e4:	3b4080e7          	jalr	948(ra) # 80002b94 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    800057e8:	0209b783          	ld	a5,32(s3)
    800057ec:	0087b503          	ld	a0,8(a5)
    800057f0:	00001097          	auipc	ra,0x1
    800057f4:	bbc080e7          	jalr	-1092(ra) # 800063ac <_ZN9BufferCPP6getCntEv>
    800057f8:	fca04ae3          	bgtz	a0,800057cc <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    800057fc:	01093503          	ld	a0,16(s2)
    80005800:	ffffd097          	auipc	ra,0xffffd
    80005804:	2cc080e7          	jalr	716(ra) # 80002acc <_ZN9Semaphore6signalEv>
}
    80005808:	02813083          	ld	ra,40(sp)
    8000580c:	02013403          	ld	s0,32(sp)
    80005810:	01813483          	ld	s1,24(sp)
    80005814:	01013903          	ld	s2,16(sp)
    80005818:	00813983          	ld	s3,8(sp)
    8000581c:	00013a03          	ld	s4,0(sp)
    80005820:	03010113          	addi	sp,sp,48
    80005824:	00008067          	ret

0000000080005828 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80005828:	f8010113          	addi	sp,sp,-128
    8000582c:	06113c23          	sd	ra,120(sp)
    80005830:	06813823          	sd	s0,112(sp)
    80005834:	06913423          	sd	s1,104(sp)
    80005838:	07213023          	sd	s2,96(sp)
    8000583c:	05313c23          	sd	s3,88(sp)
    80005840:	05413823          	sd	s4,80(sp)
    80005844:	05513423          	sd	s5,72(sp)
    80005848:	05613023          	sd	s6,64(sp)
    8000584c:	03713c23          	sd	s7,56(sp)
    80005850:	03813823          	sd	s8,48(sp)
    80005854:	03913423          	sd	s9,40(sp)
    80005858:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    8000585c:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80005860:	00005517          	auipc	a0,0x5
    80005864:	9d850513          	addi	a0,a0,-1576 # 8000a238 <_ZZ9kPrintIntmE6digits+0x1c8>
    80005868:	00000097          	auipc	ra,0x0
    8000586c:	604080e7          	jalr	1540(ra) # 80005e6c <_Z11printStringPKc>
    getString(input, 30);
    80005870:	01e00593          	li	a1,30
    80005874:	f8040493          	addi	s1,s0,-128
    80005878:	00048513          	mv	a0,s1
    8000587c:	00000097          	auipc	ra,0x0
    80005880:	678080e7          	jalr	1656(ra) # 80005ef4 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80005884:	00048513          	mv	a0,s1
    80005888:	00000097          	auipc	ra,0x0
    8000588c:	744080e7          	jalr	1860(ra) # 80005fcc <_Z11stringToIntPKc>
    80005890:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80005894:	00005517          	auipc	a0,0x5
    80005898:	9c450513          	addi	a0,a0,-1596 # 8000a258 <_ZZ9kPrintIntmE6digits+0x1e8>
    8000589c:	00000097          	auipc	ra,0x0
    800058a0:	5d0080e7          	jalr	1488(ra) # 80005e6c <_Z11printStringPKc>
    getString(input, 30);
    800058a4:	01e00593          	li	a1,30
    800058a8:	00048513          	mv	a0,s1
    800058ac:	00000097          	auipc	ra,0x0
    800058b0:	648080e7          	jalr	1608(ra) # 80005ef4 <_Z9getStringPci>
    n = stringToInt(input);
    800058b4:	00048513          	mv	a0,s1
    800058b8:	00000097          	auipc	ra,0x0
    800058bc:	714080e7          	jalr	1812(ra) # 80005fcc <_Z11stringToIntPKc>
    800058c0:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    800058c4:	00005517          	auipc	a0,0x5
    800058c8:	9b450513          	addi	a0,a0,-1612 # 8000a278 <_ZZ9kPrintIntmE6digits+0x208>
    800058cc:	00000097          	auipc	ra,0x0
    800058d0:	5a0080e7          	jalr	1440(ra) # 80005e6c <_Z11printStringPKc>
    800058d4:	00000613          	li	a2,0
    800058d8:	00a00593          	li	a1,10
    800058dc:	00090513          	mv	a0,s2
    800058e0:	00000097          	auipc	ra,0x0
    800058e4:	73c080e7          	jalr	1852(ra) # 8000601c <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    800058e8:	00005517          	auipc	a0,0x5
    800058ec:	9a850513          	addi	a0,a0,-1624 # 8000a290 <_ZZ9kPrintIntmE6digits+0x220>
    800058f0:	00000097          	auipc	ra,0x0
    800058f4:	57c080e7          	jalr	1404(ra) # 80005e6c <_Z11printStringPKc>
    800058f8:	00000613          	li	a2,0
    800058fc:	00a00593          	li	a1,10
    80005900:	00048513          	mv	a0,s1
    80005904:	00000097          	auipc	ra,0x0
    80005908:	718080e7          	jalr	1816(ra) # 8000601c <_Z8printIntiii>
    printString(".\n");
    8000590c:	00005517          	auipc	a0,0x5
    80005910:	99c50513          	addi	a0,a0,-1636 # 8000a2a8 <_ZZ9kPrintIntmE6digits+0x238>
    80005914:	00000097          	auipc	ra,0x0
    80005918:	558080e7          	jalr	1368(ra) # 80005e6c <_Z11printStringPKc>
    if(threadNum > n) {
    8000591c:	0324c463          	blt	s1,s2,80005944 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80005920:	03205c63          	blez	s2,80005958 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80005924:	03800513          	li	a0,56
    80005928:	ffffd097          	auipc	ra,0xffffd
    8000592c:	dfc080e7          	jalr	-516(ra) # 80002724 <_Znwm>
    80005930:	00050a93          	mv	s5,a0
    80005934:	00048593          	mv	a1,s1
    80005938:	00001097          	auipc	ra,0x1
    8000593c:	804080e7          	jalr	-2044(ra) # 8000613c <_ZN9BufferCPPC1Ei>
    80005940:	0300006f          	j	80005970 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80005944:	00005517          	auipc	a0,0x5
    80005948:	96c50513          	addi	a0,a0,-1684 # 8000a2b0 <_ZZ9kPrintIntmE6digits+0x240>
    8000594c:	00000097          	auipc	ra,0x0
    80005950:	520080e7          	jalr	1312(ra) # 80005e6c <_Z11printStringPKc>
        return;
    80005954:	0140006f          	j	80005968 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80005958:	00005517          	auipc	a0,0x5
    8000595c:	99850513          	addi	a0,a0,-1640 # 8000a2f0 <_ZZ9kPrintIntmE6digits+0x280>
    80005960:	00000097          	auipc	ra,0x0
    80005964:	50c080e7          	jalr	1292(ra) # 80005e6c <_Z11printStringPKc>
        return;
    80005968:	000b8113          	mv	sp,s7
    8000596c:	2380006f          	j	80005ba4 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80005970:	01000513          	li	a0,16
    80005974:	ffffd097          	auipc	ra,0xffffd
    80005978:	db0080e7          	jalr	-592(ra) # 80002724 <_Znwm>
    8000597c:	00050493          	mv	s1,a0
    80005980:	00000593          	li	a1,0
    80005984:	ffffd097          	auipc	ra,0xffffd
    80005988:	0e4080e7          	jalr	228(ra) # 80002a68 <_ZN9SemaphoreC1Ej>
    8000598c:	00007797          	auipc	a5,0x7
    80005990:	3497be23          	sd	s1,860(a5) # 8000cce8 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80005994:	00391793          	slli	a5,s2,0x3
    80005998:	00f78793          	addi	a5,a5,15
    8000599c:	ff07f793          	andi	a5,a5,-16
    800059a0:	40f10133          	sub	sp,sp,a5
    800059a4:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    800059a8:	0019071b          	addiw	a4,s2,1
    800059ac:	00171793          	slli	a5,a4,0x1
    800059b0:	00e787b3          	add	a5,a5,a4
    800059b4:	00379793          	slli	a5,a5,0x3
    800059b8:	00f78793          	addi	a5,a5,15
    800059bc:	ff07f793          	andi	a5,a5,-16
    800059c0:	40f10133          	sub	sp,sp,a5
    800059c4:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    800059c8:	00191c13          	slli	s8,s2,0x1
    800059cc:	012c07b3          	add	a5,s8,s2
    800059d0:	00379793          	slli	a5,a5,0x3
    800059d4:	00fa07b3          	add	a5,s4,a5
    800059d8:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    800059dc:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    800059e0:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    800059e4:	02800513          	li	a0,40
    800059e8:	ffffd097          	auipc	ra,0xffffd
    800059ec:	d3c080e7          	jalr	-708(ra) # 80002724 <_Znwm>
    800059f0:	00050b13          	mv	s6,a0
    800059f4:	012c0c33          	add	s8,s8,s2
    800059f8:	003c1c13          	slli	s8,s8,0x3
    800059fc:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80005a00:	ffffd097          	auipc	ra,0xffffd
    80005a04:	fec080e7          	jalr	-20(ra) # 800029ec <_ZN6ThreadC1Ev>
    80005a08:	00007797          	auipc	a5,0x7
    80005a0c:	08078793          	addi	a5,a5,128 # 8000ca88 <_ZTV12ConsumerSync+0x10>
    80005a10:	00fb3023          	sd	a5,0(s6)
    80005a14:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80005a18:	000b0513          	mv	a0,s6
    80005a1c:	ffffd097          	auipc	ra,0xffffd
    80005a20:	eb8080e7          	jalr	-328(ra) # 800028d4 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005a24:	00000493          	li	s1,0
    80005a28:	0380006f          	j	80005a60 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005a2c:	00007797          	auipc	a5,0x7
    80005a30:	03478793          	addi	a5,a5,52 # 8000ca60 <_ZTV12ProducerSync+0x10>
    80005a34:	00fcb023          	sd	a5,0(s9)
    80005a38:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80005a3c:	00349793          	slli	a5,s1,0x3
    80005a40:	00f987b3          	add	a5,s3,a5
    80005a44:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80005a48:	00349793          	slli	a5,s1,0x3
    80005a4c:	00f987b3          	add	a5,s3,a5
    80005a50:	0007b503          	ld	a0,0(a5)
    80005a54:	ffffd097          	auipc	ra,0xffffd
    80005a58:	e80080e7          	jalr	-384(ra) # 800028d4 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005a5c:	0014849b          	addiw	s1,s1,1
    80005a60:	0b24d063          	bge	s1,s2,80005b00 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    80005a64:	00149793          	slli	a5,s1,0x1
    80005a68:	009787b3          	add	a5,a5,s1
    80005a6c:	00379793          	slli	a5,a5,0x3
    80005a70:	00fa07b3          	add	a5,s4,a5
    80005a74:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80005a78:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80005a7c:	00007717          	auipc	a4,0x7
    80005a80:	26c73703          	ld	a4,620(a4) # 8000cce8 <_ZL10waitForAll>
    80005a84:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80005a88:	02905863          	blez	s1,80005ab8 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80005a8c:	02800513          	li	a0,40
    80005a90:	ffffd097          	auipc	ra,0xffffd
    80005a94:	c94080e7          	jalr	-876(ra) # 80002724 <_Znwm>
    80005a98:	00050c93          	mv	s9,a0
    80005a9c:	00149c13          	slli	s8,s1,0x1
    80005aa0:	009c0c33          	add	s8,s8,s1
    80005aa4:	003c1c13          	slli	s8,s8,0x3
    80005aa8:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005aac:	ffffd097          	auipc	ra,0xffffd
    80005ab0:	f40080e7          	jalr	-192(ra) # 800029ec <_ZN6ThreadC1Ev>
    80005ab4:	f79ff06f          	j	80005a2c <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80005ab8:	02800513          	li	a0,40
    80005abc:	ffffd097          	auipc	ra,0xffffd
    80005ac0:	c68080e7          	jalr	-920(ra) # 80002724 <_Znwm>
    80005ac4:	00050c93          	mv	s9,a0
    80005ac8:	00149c13          	slli	s8,s1,0x1
    80005acc:	009c0c33          	add	s8,s8,s1
    80005ad0:	003c1c13          	slli	s8,s8,0x3
    80005ad4:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80005ad8:	ffffd097          	auipc	ra,0xffffd
    80005adc:	f14080e7          	jalr	-236(ra) # 800029ec <_ZN6ThreadC1Ev>
    80005ae0:	00007797          	auipc	a5,0x7
    80005ae4:	f5878793          	addi	a5,a5,-168 # 8000ca38 <_ZTV16ProducerKeyboard+0x10>
    80005ae8:	00fcb023          	sd	a5,0(s9)
    80005aec:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80005af0:	00349793          	slli	a5,s1,0x3
    80005af4:	00f987b3          	add	a5,s3,a5
    80005af8:	0197b023          	sd	s9,0(a5)
    80005afc:	f4dff06f          	j	80005a48 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80005b00:	ffffd097          	auipc	ra,0xffffd
    80005b04:	e38080e7          	jalr	-456(ra) # 80002938 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80005b08:	00000493          	li	s1,0
    80005b0c:	00994e63          	blt	s2,s1,80005b28 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80005b10:	00007517          	auipc	a0,0x7
    80005b14:	1d853503          	ld	a0,472(a0) # 8000cce8 <_ZL10waitForAll>
    80005b18:	ffffd097          	auipc	ra,0xffffd
    80005b1c:	f88080e7          	jalr	-120(ra) # 80002aa0 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80005b20:	0014849b          	addiw	s1,s1,1
    80005b24:	fe9ff06f          	j	80005b0c <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80005b28:	00000493          	li	s1,0
    80005b2c:	0080006f          	j	80005b34 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80005b30:	0014849b          	addiw	s1,s1,1
    80005b34:	0324d263          	bge	s1,s2,80005b58 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80005b38:	00349793          	slli	a5,s1,0x3
    80005b3c:	00f987b3          	add	a5,s3,a5
    80005b40:	0007b503          	ld	a0,0(a5)
    80005b44:	fe0506e3          	beqz	a0,80005b30 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80005b48:	00053783          	ld	a5,0(a0)
    80005b4c:	0087b783          	ld	a5,8(a5)
    80005b50:	000780e7          	jalr	a5
    80005b54:	fddff06f          	j	80005b30 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80005b58:	000b0a63          	beqz	s6,80005b6c <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80005b5c:	000b3783          	ld	a5,0(s6)
    80005b60:	0087b783          	ld	a5,8(a5)
    80005b64:	000b0513          	mv	a0,s6
    80005b68:	000780e7          	jalr	a5
    delete waitForAll;
    80005b6c:	00007517          	auipc	a0,0x7
    80005b70:	17c53503          	ld	a0,380(a0) # 8000cce8 <_ZL10waitForAll>
    80005b74:	00050863          	beqz	a0,80005b84 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80005b78:	00053783          	ld	a5,0(a0)
    80005b7c:	0087b783          	ld	a5,8(a5)
    80005b80:	000780e7          	jalr	a5
    delete buffer;
    80005b84:	000a8e63          	beqz	s5,80005ba0 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80005b88:	000a8513          	mv	a0,s5
    80005b8c:	00001097          	auipc	ra,0x1
    80005b90:	8a8080e7          	jalr	-1880(ra) # 80006434 <_ZN9BufferCPPD1Ev>
    80005b94:	000a8513          	mv	a0,s5
    80005b98:	ffffd097          	auipc	ra,0xffffd
    80005b9c:	bdc080e7          	jalr	-1060(ra) # 80002774 <_ZdlPv>
    80005ba0:	000b8113          	mv	sp,s7

}
    80005ba4:	f8040113          	addi	sp,s0,-128
    80005ba8:	07813083          	ld	ra,120(sp)
    80005bac:	07013403          	ld	s0,112(sp)
    80005bb0:	06813483          	ld	s1,104(sp)
    80005bb4:	06013903          	ld	s2,96(sp)
    80005bb8:	05813983          	ld	s3,88(sp)
    80005bbc:	05013a03          	ld	s4,80(sp)
    80005bc0:	04813a83          	ld	s5,72(sp)
    80005bc4:	04013b03          	ld	s6,64(sp)
    80005bc8:	03813b83          	ld	s7,56(sp)
    80005bcc:	03013c03          	ld	s8,48(sp)
    80005bd0:	02813c83          	ld	s9,40(sp)
    80005bd4:	08010113          	addi	sp,sp,128
    80005bd8:	00008067          	ret
    80005bdc:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80005be0:	000a8513          	mv	a0,s5
    80005be4:	ffffd097          	auipc	ra,0xffffd
    80005be8:	b90080e7          	jalr	-1136(ra) # 80002774 <_ZdlPv>
    80005bec:	00048513          	mv	a0,s1
    80005bf0:	00008097          	auipc	ra,0x8
    80005bf4:	1d8080e7          	jalr	472(ra) # 8000ddc8 <_Unwind_Resume>
    80005bf8:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80005bfc:	00048513          	mv	a0,s1
    80005c00:	ffffd097          	auipc	ra,0xffffd
    80005c04:	b74080e7          	jalr	-1164(ra) # 80002774 <_ZdlPv>
    80005c08:	00090513          	mv	a0,s2
    80005c0c:	00008097          	auipc	ra,0x8
    80005c10:	1bc080e7          	jalr	444(ra) # 8000ddc8 <_Unwind_Resume>
    80005c14:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80005c18:	000b0513          	mv	a0,s6
    80005c1c:	ffffd097          	auipc	ra,0xffffd
    80005c20:	b58080e7          	jalr	-1192(ra) # 80002774 <_ZdlPv>
    80005c24:	00048513          	mv	a0,s1
    80005c28:	00008097          	auipc	ra,0x8
    80005c2c:	1a0080e7          	jalr	416(ra) # 8000ddc8 <_Unwind_Resume>
    80005c30:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80005c34:	000c8513          	mv	a0,s9
    80005c38:	ffffd097          	auipc	ra,0xffffd
    80005c3c:	b3c080e7          	jalr	-1220(ra) # 80002774 <_ZdlPv>
    80005c40:	00048513          	mv	a0,s1
    80005c44:	00008097          	auipc	ra,0x8
    80005c48:	184080e7          	jalr	388(ra) # 8000ddc8 <_Unwind_Resume>
    80005c4c:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80005c50:	000c8513          	mv	a0,s9
    80005c54:	ffffd097          	auipc	ra,0xffffd
    80005c58:	b20080e7          	jalr	-1248(ra) # 80002774 <_ZdlPv>
    80005c5c:	00048513          	mv	a0,s1
    80005c60:	00008097          	auipc	ra,0x8
    80005c64:	168080e7          	jalr	360(ra) # 8000ddc8 <_Unwind_Resume>

0000000080005c68 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80005c68:	ff010113          	addi	sp,sp,-16
    80005c6c:	00113423          	sd	ra,8(sp)
    80005c70:	00813023          	sd	s0,0(sp)
    80005c74:	01010413          	addi	s0,sp,16
    80005c78:	00007797          	auipc	a5,0x7
    80005c7c:	e1078793          	addi	a5,a5,-496 # 8000ca88 <_ZTV12ConsumerSync+0x10>
    80005c80:	00f53023          	sd	a5,0(a0)
    80005c84:	ffffd097          	auipc	ra,0xffffd
    80005c88:	9b0080e7          	jalr	-1616(ra) # 80002634 <_ZN6ThreadD1Ev>
    80005c8c:	00813083          	ld	ra,8(sp)
    80005c90:	00013403          	ld	s0,0(sp)
    80005c94:	01010113          	addi	sp,sp,16
    80005c98:	00008067          	ret

0000000080005c9c <_ZN12ConsumerSyncD0Ev>:
    80005c9c:	fe010113          	addi	sp,sp,-32
    80005ca0:	00113c23          	sd	ra,24(sp)
    80005ca4:	00813823          	sd	s0,16(sp)
    80005ca8:	00913423          	sd	s1,8(sp)
    80005cac:	02010413          	addi	s0,sp,32
    80005cb0:	00050493          	mv	s1,a0
    80005cb4:	00007797          	auipc	a5,0x7
    80005cb8:	dd478793          	addi	a5,a5,-556 # 8000ca88 <_ZTV12ConsumerSync+0x10>
    80005cbc:	00f53023          	sd	a5,0(a0)
    80005cc0:	ffffd097          	auipc	ra,0xffffd
    80005cc4:	974080e7          	jalr	-1676(ra) # 80002634 <_ZN6ThreadD1Ev>
    80005cc8:	00048513          	mv	a0,s1
    80005ccc:	ffffd097          	auipc	ra,0xffffd
    80005cd0:	aa8080e7          	jalr	-1368(ra) # 80002774 <_ZdlPv>
    80005cd4:	01813083          	ld	ra,24(sp)
    80005cd8:	01013403          	ld	s0,16(sp)
    80005cdc:	00813483          	ld	s1,8(sp)
    80005ce0:	02010113          	addi	sp,sp,32
    80005ce4:	00008067          	ret

0000000080005ce8 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80005ce8:	ff010113          	addi	sp,sp,-16
    80005cec:	00113423          	sd	ra,8(sp)
    80005cf0:	00813023          	sd	s0,0(sp)
    80005cf4:	01010413          	addi	s0,sp,16
    80005cf8:	00007797          	auipc	a5,0x7
    80005cfc:	d6878793          	addi	a5,a5,-664 # 8000ca60 <_ZTV12ProducerSync+0x10>
    80005d00:	00f53023          	sd	a5,0(a0)
    80005d04:	ffffd097          	auipc	ra,0xffffd
    80005d08:	930080e7          	jalr	-1744(ra) # 80002634 <_ZN6ThreadD1Ev>
    80005d0c:	00813083          	ld	ra,8(sp)
    80005d10:	00013403          	ld	s0,0(sp)
    80005d14:	01010113          	addi	sp,sp,16
    80005d18:	00008067          	ret

0000000080005d1c <_ZN12ProducerSyncD0Ev>:
    80005d1c:	fe010113          	addi	sp,sp,-32
    80005d20:	00113c23          	sd	ra,24(sp)
    80005d24:	00813823          	sd	s0,16(sp)
    80005d28:	00913423          	sd	s1,8(sp)
    80005d2c:	02010413          	addi	s0,sp,32
    80005d30:	00050493          	mv	s1,a0
    80005d34:	00007797          	auipc	a5,0x7
    80005d38:	d2c78793          	addi	a5,a5,-724 # 8000ca60 <_ZTV12ProducerSync+0x10>
    80005d3c:	00f53023          	sd	a5,0(a0)
    80005d40:	ffffd097          	auipc	ra,0xffffd
    80005d44:	8f4080e7          	jalr	-1804(ra) # 80002634 <_ZN6ThreadD1Ev>
    80005d48:	00048513          	mv	a0,s1
    80005d4c:	ffffd097          	auipc	ra,0xffffd
    80005d50:	a28080e7          	jalr	-1496(ra) # 80002774 <_ZdlPv>
    80005d54:	01813083          	ld	ra,24(sp)
    80005d58:	01013403          	ld	s0,16(sp)
    80005d5c:	00813483          	ld	s1,8(sp)
    80005d60:	02010113          	addi	sp,sp,32
    80005d64:	00008067          	ret

0000000080005d68 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80005d68:	ff010113          	addi	sp,sp,-16
    80005d6c:	00113423          	sd	ra,8(sp)
    80005d70:	00813023          	sd	s0,0(sp)
    80005d74:	01010413          	addi	s0,sp,16
    80005d78:	00007797          	auipc	a5,0x7
    80005d7c:	cc078793          	addi	a5,a5,-832 # 8000ca38 <_ZTV16ProducerKeyboard+0x10>
    80005d80:	00f53023          	sd	a5,0(a0)
    80005d84:	ffffd097          	auipc	ra,0xffffd
    80005d88:	8b0080e7          	jalr	-1872(ra) # 80002634 <_ZN6ThreadD1Ev>
    80005d8c:	00813083          	ld	ra,8(sp)
    80005d90:	00013403          	ld	s0,0(sp)
    80005d94:	01010113          	addi	sp,sp,16
    80005d98:	00008067          	ret

0000000080005d9c <_ZN16ProducerKeyboardD0Ev>:
    80005d9c:	fe010113          	addi	sp,sp,-32
    80005da0:	00113c23          	sd	ra,24(sp)
    80005da4:	00813823          	sd	s0,16(sp)
    80005da8:	00913423          	sd	s1,8(sp)
    80005dac:	02010413          	addi	s0,sp,32
    80005db0:	00050493          	mv	s1,a0
    80005db4:	00007797          	auipc	a5,0x7
    80005db8:	c8478793          	addi	a5,a5,-892 # 8000ca38 <_ZTV16ProducerKeyboard+0x10>
    80005dbc:	00f53023          	sd	a5,0(a0)
    80005dc0:	ffffd097          	auipc	ra,0xffffd
    80005dc4:	874080e7          	jalr	-1932(ra) # 80002634 <_ZN6ThreadD1Ev>
    80005dc8:	00048513          	mv	a0,s1
    80005dcc:	ffffd097          	auipc	ra,0xffffd
    80005dd0:	9a8080e7          	jalr	-1624(ra) # 80002774 <_ZdlPv>
    80005dd4:	01813083          	ld	ra,24(sp)
    80005dd8:	01013403          	ld	s0,16(sp)
    80005ddc:	00813483          	ld	s1,8(sp)
    80005de0:	02010113          	addi	sp,sp,32
    80005de4:	00008067          	ret

0000000080005de8 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80005de8:	ff010113          	addi	sp,sp,-16
    80005dec:	00113423          	sd	ra,8(sp)
    80005df0:	00813023          	sd	s0,0(sp)
    80005df4:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80005df8:	02053583          	ld	a1,32(a0)
    80005dfc:	fffff097          	auipc	ra,0xfffff
    80005e00:	7e4080e7          	jalr	2020(ra) # 800055e0 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80005e04:	00813083          	ld	ra,8(sp)
    80005e08:	00013403          	ld	s0,0(sp)
    80005e0c:	01010113          	addi	sp,sp,16
    80005e10:	00008067          	ret

0000000080005e14 <_ZN12ProducerSync3runEv>:
    void run() override {
    80005e14:	ff010113          	addi	sp,sp,-16
    80005e18:	00113423          	sd	ra,8(sp)
    80005e1c:	00813023          	sd	s0,0(sp)
    80005e20:	01010413          	addi	s0,sp,16
        producer(td);
    80005e24:	02053583          	ld	a1,32(a0)
    80005e28:	00000097          	auipc	ra,0x0
    80005e2c:	878080e7          	jalr	-1928(ra) # 800056a0 <_ZN12ProducerSync8producerEPv>
    }
    80005e30:	00813083          	ld	ra,8(sp)
    80005e34:	00013403          	ld	s0,0(sp)
    80005e38:	01010113          	addi	sp,sp,16
    80005e3c:	00008067          	ret

0000000080005e40 <_ZN12ConsumerSync3runEv>:
    void run() override {
    80005e40:	ff010113          	addi	sp,sp,-16
    80005e44:	00113423          	sd	ra,8(sp)
    80005e48:	00813023          	sd	s0,0(sp)
    80005e4c:	01010413          	addi	s0,sp,16
        consumer(td);
    80005e50:	02053583          	ld	a1,32(a0)
    80005e54:	00000097          	auipc	ra,0x0
    80005e58:	8e0080e7          	jalr	-1824(ra) # 80005734 <_ZN12ConsumerSync8consumerEPv>
    }
    80005e5c:	00813083          	ld	ra,8(sp)
    80005e60:	00013403          	ld	s0,0(sp)
    80005e64:	01010113          	addi	sp,sp,16
    80005e68:	00008067          	ret

0000000080005e6c <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80005e6c:	fe010113          	addi	sp,sp,-32
    80005e70:	00113c23          	sd	ra,24(sp)
    80005e74:	00813823          	sd	s0,16(sp)
    80005e78:	00913423          	sd	s1,8(sp)
    80005e7c:	02010413          	addi	s0,sp,32
    80005e80:	00050493          	mv	s1,a0
    LOCK();
    80005e84:	00100613          	li	a2,1
    80005e88:	00000593          	li	a1,0
    80005e8c:	00007517          	auipc	a0,0x7
    80005e90:	e6450513          	addi	a0,a0,-412 # 8000ccf0 <lockPrint>
    80005e94:	ffffb097          	auipc	ra,0xffffb
    80005e98:	390080e7          	jalr	912(ra) # 80001224 <copy_and_swap>
    80005e9c:	00050863          	beqz	a0,80005eac <_Z11printStringPKc+0x40>
    80005ea0:	ffffb097          	auipc	ra,0xffffb
    80005ea4:	588080e7          	jalr	1416(ra) # 80001428 <_Z15thread_dispatchv>
    80005ea8:	fddff06f          	j	80005e84 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80005eac:	0004c503          	lbu	a0,0(s1)
    80005eb0:	00050a63          	beqz	a0,80005ec4 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80005eb4:	ffffb097          	auipc	ra,0xffffb
    80005eb8:	6dc080e7          	jalr	1756(ra) # 80001590 <_Z4putcc>
        string++;
    80005ebc:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80005ec0:	fedff06f          	j	80005eac <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80005ec4:	00000613          	li	a2,0
    80005ec8:	00100593          	li	a1,1
    80005ecc:	00007517          	auipc	a0,0x7
    80005ed0:	e2450513          	addi	a0,a0,-476 # 8000ccf0 <lockPrint>
    80005ed4:	ffffb097          	auipc	ra,0xffffb
    80005ed8:	350080e7          	jalr	848(ra) # 80001224 <copy_and_swap>
    80005edc:	fe0514e3          	bnez	a0,80005ec4 <_Z11printStringPKc+0x58>
}
    80005ee0:	01813083          	ld	ra,24(sp)
    80005ee4:	01013403          	ld	s0,16(sp)
    80005ee8:	00813483          	ld	s1,8(sp)
    80005eec:	02010113          	addi	sp,sp,32
    80005ef0:	00008067          	ret

0000000080005ef4 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80005ef4:	fd010113          	addi	sp,sp,-48
    80005ef8:	02113423          	sd	ra,40(sp)
    80005efc:	02813023          	sd	s0,32(sp)
    80005f00:	00913c23          	sd	s1,24(sp)
    80005f04:	01213823          	sd	s2,16(sp)
    80005f08:	01313423          	sd	s3,8(sp)
    80005f0c:	01413023          	sd	s4,0(sp)
    80005f10:	03010413          	addi	s0,sp,48
    80005f14:	00050993          	mv	s3,a0
    80005f18:	00058a13          	mv	s4,a1
    LOCK();
    80005f1c:	00100613          	li	a2,1
    80005f20:	00000593          	li	a1,0
    80005f24:	00007517          	auipc	a0,0x7
    80005f28:	dcc50513          	addi	a0,a0,-564 # 8000ccf0 <lockPrint>
    80005f2c:	ffffb097          	auipc	ra,0xffffb
    80005f30:	2f8080e7          	jalr	760(ra) # 80001224 <copy_and_swap>
    80005f34:	00050863          	beqz	a0,80005f44 <_Z9getStringPci+0x50>
    80005f38:	ffffb097          	auipc	ra,0xffffb
    80005f3c:	4f0080e7          	jalr	1264(ra) # 80001428 <_Z15thread_dispatchv>
    80005f40:	fddff06f          	j	80005f1c <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80005f44:	00000913          	li	s2,0
    80005f48:	00090493          	mv	s1,s2
    80005f4c:	0019091b          	addiw	s2,s2,1
    80005f50:	03495a63          	bge	s2,s4,80005f84 <_Z9getStringPci+0x90>
        cc = getc();
    80005f54:	ffffb097          	auipc	ra,0xffffb
    80005f58:	614080e7          	jalr	1556(ra) # 80001568 <_Z4getcv>
        if(cc < 1)
    80005f5c:	02050463          	beqz	a0,80005f84 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80005f60:	009984b3          	add	s1,s3,s1
    80005f64:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80005f68:	00a00793          	li	a5,10
    80005f6c:	00f50a63          	beq	a0,a5,80005f80 <_Z9getStringPci+0x8c>
    80005f70:	00d00793          	li	a5,13
    80005f74:	fcf51ae3          	bne	a0,a5,80005f48 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80005f78:	00090493          	mv	s1,s2
    80005f7c:	0080006f          	j	80005f84 <_Z9getStringPci+0x90>
    80005f80:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80005f84:	009984b3          	add	s1,s3,s1
    80005f88:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80005f8c:	00000613          	li	a2,0
    80005f90:	00100593          	li	a1,1
    80005f94:	00007517          	auipc	a0,0x7
    80005f98:	d5c50513          	addi	a0,a0,-676 # 8000ccf0 <lockPrint>
    80005f9c:	ffffb097          	auipc	ra,0xffffb
    80005fa0:	288080e7          	jalr	648(ra) # 80001224 <copy_and_swap>
    80005fa4:	fe0514e3          	bnez	a0,80005f8c <_Z9getStringPci+0x98>
    return buf;
}
    80005fa8:	00098513          	mv	a0,s3
    80005fac:	02813083          	ld	ra,40(sp)
    80005fb0:	02013403          	ld	s0,32(sp)
    80005fb4:	01813483          	ld	s1,24(sp)
    80005fb8:	01013903          	ld	s2,16(sp)
    80005fbc:	00813983          	ld	s3,8(sp)
    80005fc0:	00013a03          	ld	s4,0(sp)
    80005fc4:	03010113          	addi	sp,sp,48
    80005fc8:	00008067          	ret

0000000080005fcc <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80005fcc:	ff010113          	addi	sp,sp,-16
    80005fd0:	00813423          	sd	s0,8(sp)
    80005fd4:	01010413          	addi	s0,sp,16
    80005fd8:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80005fdc:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80005fe0:	0006c603          	lbu	a2,0(a3)
    80005fe4:	fd06071b          	addiw	a4,a2,-48
    80005fe8:	0ff77713          	andi	a4,a4,255
    80005fec:	00900793          	li	a5,9
    80005ff0:	02e7e063          	bltu	a5,a4,80006010 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80005ff4:	0025179b          	slliw	a5,a0,0x2
    80005ff8:	00a787bb          	addw	a5,a5,a0
    80005ffc:	0017979b          	slliw	a5,a5,0x1
    80006000:	00168693          	addi	a3,a3,1
    80006004:	00c787bb          	addw	a5,a5,a2
    80006008:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    8000600c:	fd5ff06f          	j	80005fe0 <_Z11stringToIntPKc+0x14>
    return n;
}
    80006010:	00813403          	ld	s0,8(sp)
    80006014:	01010113          	addi	sp,sp,16
    80006018:	00008067          	ret

000000008000601c <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    8000601c:	fc010113          	addi	sp,sp,-64
    80006020:	02113c23          	sd	ra,56(sp)
    80006024:	02813823          	sd	s0,48(sp)
    80006028:	02913423          	sd	s1,40(sp)
    8000602c:	03213023          	sd	s2,32(sp)
    80006030:	01313c23          	sd	s3,24(sp)
    80006034:	04010413          	addi	s0,sp,64
    80006038:	00050493          	mv	s1,a0
    8000603c:	00058913          	mv	s2,a1
    80006040:	00060993          	mv	s3,a2
    LOCK();
    80006044:	00100613          	li	a2,1
    80006048:	00000593          	li	a1,0
    8000604c:	00007517          	auipc	a0,0x7
    80006050:	ca450513          	addi	a0,a0,-860 # 8000ccf0 <lockPrint>
    80006054:	ffffb097          	auipc	ra,0xffffb
    80006058:	1d0080e7          	jalr	464(ra) # 80001224 <copy_and_swap>
    8000605c:	00050863          	beqz	a0,8000606c <_Z8printIntiii+0x50>
    80006060:	ffffb097          	auipc	ra,0xffffb
    80006064:	3c8080e7          	jalr	968(ra) # 80001428 <_Z15thread_dispatchv>
    80006068:	fddff06f          	j	80006044 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    8000606c:	00098463          	beqz	s3,80006074 <_Z8printIntiii+0x58>
    80006070:	0804c463          	bltz	s1,800060f8 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80006074:	0004851b          	sext.w	a0,s1
    neg = 0;
    80006078:	00000593          	li	a1,0
    }

    i = 0;
    8000607c:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80006080:	0009079b          	sext.w	a5,s2
    80006084:	0325773b          	remuw	a4,a0,s2
    80006088:	00048613          	mv	a2,s1
    8000608c:	0014849b          	addiw	s1,s1,1
    80006090:	02071693          	slli	a3,a4,0x20
    80006094:	0206d693          	srli	a3,a3,0x20
    80006098:	00007717          	auipc	a4,0x7
    8000609c:	a0870713          	addi	a4,a4,-1528 # 8000caa0 <digits>
    800060a0:	00d70733          	add	a4,a4,a3
    800060a4:	00074683          	lbu	a3,0(a4)
    800060a8:	fd040713          	addi	a4,s0,-48
    800060ac:	00c70733          	add	a4,a4,a2
    800060b0:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    800060b4:	0005071b          	sext.w	a4,a0
    800060b8:	0325553b          	divuw	a0,a0,s2
    800060bc:	fcf772e3          	bgeu	a4,a5,80006080 <_Z8printIntiii+0x64>
    if(neg)
    800060c0:	00058c63          	beqz	a1,800060d8 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    800060c4:	fd040793          	addi	a5,s0,-48
    800060c8:	009784b3          	add	s1,a5,s1
    800060cc:	02d00793          	li	a5,45
    800060d0:	fef48823          	sb	a5,-16(s1)
    800060d4:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    800060d8:	fff4849b          	addiw	s1,s1,-1
    800060dc:	0204c463          	bltz	s1,80006104 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    800060e0:	fd040793          	addi	a5,s0,-48
    800060e4:	009787b3          	add	a5,a5,s1
    800060e8:	ff07c503          	lbu	a0,-16(a5)
    800060ec:	ffffb097          	auipc	ra,0xffffb
    800060f0:	4a4080e7          	jalr	1188(ra) # 80001590 <_Z4putcc>
    800060f4:	fe5ff06f          	j	800060d8 <_Z8printIntiii+0xbc>
        x = -xx;
    800060f8:	4090053b          	negw	a0,s1
        neg = 1;
    800060fc:	00100593          	li	a1,1
        x = -xx;
    80006100:	f7dff06f          	j	8000607c <_Z8printIntiii+0x60>

    UNLOCK();
    80006104:	00000613          	li	a2,0
    80006108:	00100593          	li	a1,1
    8000610c:	00007517          	auipc	a0,0x7
    80006110:	be450513          	addi	a0,a0,-1052 # 8000ccf0 <lockPrint>
    80006114:	ffffb097          	auipc	ra,0xffffb
    80006118:	110080e7          	jalr	272(ra) # 80001224 <copy_and_swap>
    8000611c:	fe0514e3          	bnez	a0,80006104 <_Z8printIntiii+0xe8>
    80006120:	03813083          	ld	ra,56(sp)
    80006124:	03013403          	ld	s0,48(sp)
    80006128:	02813483          	ld	s1,40(sp)
    8000612c:	02013903          	ld	s2,32(sp)
    80006130:	01813983          	ld	s3,24(sp)
    80006134:	04010113          	addi	sp,sp,64
    80006138:	00008067          	ret

000000008000613c <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    8000613c:	fd010113          	addi	sp,sp,-48
    80006140:	02113423          	sd	ra,40(sp)
    80006144:	02813023          	sd	s0,32(sp)
    80006148:	00913c23          	sd	s1,24(sp)
    8000614c:	01213823          	sd	s2,16(sp)
    80006150:	01313423          	sd	s3,8(sp)
    80006154:	03010413          	addi	s0,sp,48
    80006158:	00050493          	mv	s1,a0
    8000615c:	00058913          	mv	s2,a1
    80006160:	0015879b          	addiw	a5,a1,1
    80006164:	0007851b          	sext.w	a0,a5
    80006168:	00f4a023          	sw	a5,0(s1)
    8000616c:	0004a823          	sw	zero,16(s1)
    80006170:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006174:	00251513          	slli	a0,a0,0x2
    80006178:	ffffb097          	auipc	ra,0xffffb
    8000617c:	198080e7          	jalr	408(ra) # 80001310 <_Z9mem_allocm>
    80006180:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80006184:	01000513          	li	a0,16
    80006188:	ffffc097          	auipc	ra,0xffffc
    8000618c:	59c080e7          	jalr	1436(ra) # 80002724 <_Znwm>
    80006190:	00050993          	mv	s3,a0
    80006194:	00000593          	li	a1,0
    80006198:	ffffd097          	auipc	ra,0xffffd
    8000619c:	8d0080e7          	jalr	-1840(ra) # 80002a68 <_ZN9SemaphoreC1Ej>
    800061a0:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    800061a4:	01000513          	li	a0,16
    800061a8:	ffffc097          	auipc	ra,0xffffc
    800061ac:	57c080e7          	jalr	1404(ra) # 80002724 <_Znwm>
    800061b0:	00050993          	mv	s3,a0
    800061b4:	00090593          	mv	a1,s2
    800061b8:	ffffd097          	auipc	ra,0xffffd
    800061bc:	8b0080e7          	jalr	-1872(ra) # 80002a68 <_ZN9SemaphoreC1Ej>
    800061c0:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    800061c4:	01000513          	li	a0,16
    800061c8:	ffffc097          	auipc	ra,0xffffc
    800061cc:	55c080e7          	jalr	1372(ra) # 80002724 <_Znwm>
    800061d0:	00050913          	mv	s2,a0
    800061d4:	00100593          	li	a1,1
    800061d8:	ffffd097          	auipc	ra,0xffffd
    800061dc:	890080e7          	jalr	-1904(ra) # 80002a68 <_ZN9SemaphoreC1Ej>
    800061e0:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    800061e4:	01000513          	li	a0,16
    800061e8:	ffffc097          	auipc	ra,0xffffc
    800061ec:	53c080e7          	jalr	1340(ra) # 80002724 <_Znwm>
    800061f0:	00050913          	mv	s2,a0
    800061f4:	00100593          	li	a1,1
    800061f8:	ffffd097          	auipc	ra,0xffffd
    800061fc:	870080e7          	jalr	-1936(ra) # 80002a68 <_ZN9SemaphoreC1Ej>
    80006200:	0324b823          	sd	s2,48(s1)
}
    80006204:	02813083          	ld	ra,40(sp)
    80006208:	02013403          	ld	s0,32(sp)
    8000620c:	01813483          	ld	s1,24(sp)
    80006210:	01013903          	ld	s2,16(sp)
    80006214:	00813983          	ld	s3,8(sp)
    80006218:	03010113          	addi	sp,sp,48
    8000621c:	00008067          	ret
    80006220:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80006224:	00098513          	mv	a0,s3
    80006228:	ffffc097          	auipc	ra,0xffffc
    8000622c:	54c080e7          	jalr	1356(ra) # 80002774 <_ZdlPv>
    80006230:	00048513          	mv	a0,s1
    80006234:	00008097          	auipc	ra,0x8
    80006238:	b94080e7          	jalr	-1132(ra) # 8000ddc8 <_Unwind_Resume>
    8000623c:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80006240:	00098513          	mv	a0,s3
    80006244:	ffffc097          	auipc	ra,0xffffc
    80006248:	530080e7          	jalr	1328(ra) # 80002774 <_ZdlPv>
    8000624c:	00048513          	mv	a0,s1
    80006250:	00008097          	auipc	ra,0x8
    80006254:	b78080e7          	jalr	-1160(ra) # 8000ddc8 <_Unwind_Resume>
    80006258:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    8000625c:	00090513          	mv	a0,s2
    80006260:	ffffc097          	auipc	ra,0xffffc
    80006264:	514080e7          	jalr	1300(ra) # 80002774 <_ZdlPv>
    80006268:	00048513          	mv	a0,s1
    8000626c:	00008097          	auipc	ra,0x8
    80006270:	b5c080e7          	jalr	-1188(ra) # 8000ddc8 <_Unwind_Resume>
    80006274:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80006278:	00090513          	mv	a0,s2
    8000627c:	ffffc097          	auipc	ra,0xffffc
    80006280:	4f8080e7          	jalr	1272(ra) # 80002774 <_ZdlPv>
    80006284:	00048513          	mv	a0,s1
    80006288:	00008097          	auipc	ra,0x8
    8000628c:	b40080e7          	jalr	-1216(ra) # 8000ddc8 <_Unwind_Resume>

0000000080006290 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80006290:	fe010113          	addi	sp,sp,-32
    80006294:	00113c23          	sd	ra,24(sp)
    80006298:	00813823          	sd	s0,16(sp)
    8000629c:	00913423          	sd	s1,8(sp)
    800062a0:	01213023          	sd	s2,0(sp)
    800062a4:	02010413          	addi	s0,sp,32
    800062a8:	00050493          	mv	s1,a0
    800062ac:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    800062b0:	01853503          	ld	a0,24(a0)
    800062b4:	ffffc097          	auipc	ra,0xffffc
    800062b8:	7ec080e7          	jalr	2028(ra) # 80002aa0 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    800062bc:	0304b503          	ld	a0,48(s1)
    800062c0:	ffffc097          	auipc	ra,0xffffc
    800062c4:	7e0080e7          	jalr	2016(ra) # 80002aa0 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    800062c8:	0084b783          	ld	a5,8(s1)
    800062cc:	0144a703          	lw	a4,20(s1)
    800062d0:	00271713          	slli	a4,a4,0x2
    800062d4:	00e787b3          	add	a5,a5,a4
    800062d8:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800062dc:	0144a783          	lw	a5,20(s1)
    800062e0:	0017879b          	addiw	a5,a5,1
    800062e4:	0004a703          	lw	a4,0(s1)
    800062e8:	02e7e7bb          	remw	a5,a5,a4
    800062ec:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    800062f0:	0304b503          	ld	a0,48(s1)
    800062f4:	ffffc097          	auipc	ra,0xffffc
    800062f8:	7d8080e7          	jalr	2008(ra) # 80002acc <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    800062fc:	0204b503          	ld	a0,32(s1)
    80006300:	ffffc097          	auipc	ra,0xffffc
    80006304:	7cc080e7          	jalr	1996(ra) # 80002acc <_ZN9Semaphore6signalEv>

}
    80006308:	01813083          	ld	ra,24(sp)
    8000630c:	01013403          	ld	s0,16(sp)
    80006310:	00813483          	ld	s1,8(sp)
    80006314:	00013903          	ld	s2,0(sp)
    80006318:	02010113          	addi	sp,sp,32
    8000631c:	00008067          	ret

0000000080006320 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80006320:	fe010113          	addi	sp,sp,-32
    80006324:	00113c23          	sd	ra,24(sp)
    80006328:	00813823          	sd	s0,16(sp)
    8000632c:	00913423          	sd	s1,8(sp)
    80006330:	01213023          	sd	s2,0(sp)
    80006334:	02010413          	addi	s0,sp,32
    80006338:	00050493          	mv	s1,a0
    itemAvailable->wait();
    8000633c:	02053503          	ld	a0,32(a0)
    80006340:	ffffc097          	auipc	ra,0xffffc
    80006344:	760080e7          	jalr	1888(ra) # 80002aa0 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80006348:	0284b503          	ld	a0,40(s1)
    8000634c:	ffffc097          	auipc	ra,0xffffc
    80006350:	754080e7          	jalr	1876(ra) # 80002aa0 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80006354:	0084b703          	ld	a4,8(s1)
    80006358:	0104a783          	lw	a5,16(s1)
    8000635c:	00279693          	slli	a3,a5,0x2
    80006360:	00d70733          	add	a4,a4,a3
    80006364:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006368:	0017879b          	addiw	a5,a5,1
    8000636c:	0004a703          	lw	a4,0(s1)
    80006370:	02e7e7bb          	remw	a5,a5,a4
    80006374:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80006378:	0284b503          	ld	a0,40(s1)
    8000637c:	ffffc097          	auipc	ra,0xffffc
    80006380:	750080e7          	jalr	1872(ra) # 80002acc <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80006384:	0184b503          	ld	a0,24(s1)
    80006388:	ffffc097          	auipc	ra,0xffffc
    8000638c:	744080e7          	jalr	1860(ra) # 80002acc <_ZN9Semaphore6signalEv>

    return ret;
}
    80006390:	00090513          	mv	a0,s2
    80006394:	01813083          	ld	ra,24(sp)
    80006398:	01013403          	ld	s0,16(sp)
    8000639c:	00813483          	ld	s1,8(sp)
    800063a0:	00013903          	ld	s2,0(sp)
    800063a4:	02010113          	addi	sp,sp,32
    800063a8:	00008067          	ret

00000000800063ac <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    800063ac:	fe010113          	addi	sp,sp,-32
    800063b0:	00113c23          	sd	ra,24(sp)
    800063b4:	00813823          	sd	s0,16(sp)
    800063b8:	00913423          	sd	s1,8(sp)
    800063bc:	01213023          	sd	s2,0(sp)
    800063c0:	02010413          	addi	s0,sp,32
    800063c4:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    800063c8:	02853503          	ld	a0,40(a0)
    800063cc:	ffffc097          	auipc	ra,0xffffc
    800063d0:	6d4080e7          	jalr	1748(ra) # 80002aa0 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    800063d4:	0304b503          	ld	a0,48(s1)
    800063d8:	ffffc097          	auipc	ra,0xffffc
    800063dc:	6c8080e7          	jalr	1736(ra) # 80002aa0 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    800063e0:	0144a783          	lw	a5,20(s1)
    800063e4:	0104a903          	lw	s2,16(s1)
    800063e8:	0327ce63          	blt	a5,s2,80006424 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    800063ec:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    800063f0:	0304b503          	ld	a0,48(s1)
    800063f4:	ffffc097          	auipc	ra,0xffffc
    800063f8:	6d8080e7          	jalr	1752(ra) # 80002acc <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    800063fc:	0284b503          	ld	a0,40(s1)
    80006400:	ffffc097          	auipc	ra,0xffffc
    80006404:	6cc080e7          	jalr	1740(ra) # 80002acc <_ZN9Semaphore6signalEv>

    return ret;
}
    80006408:	00090513          	mv	a0,s2
    8000640c:	01813083          	ld	ra,24(sp)
    80006410:	01013403          	ld	s0,16(sp)
    80006414:	00813483          	ld	s1,8(sp)
    80006418:	00013903          	ld	s2,0(sp)
    8000641c:	02010113          	addi	sp,sp,32
    80006420:	00008067          	ret
        ret = cap - head + tail;
    80006424:	0004a703          	lw	a4,0(s1)
    80006428:	4127093b          	subw	s2,a4,s2
    8000642c:	00f9093b          	addw	s2,s2,a5
    80006430:	fc1ff06f          	j	800063f0 <_ZN9BufferCPP6getCntEv+0x44>

0000000080006434 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80006434:	fe010113          	addi	sp,sp,-32
    80006438:	00113c23          	sd	ra,24(sp)
    8000643c:	00813823          	sd	s0,16(sp)
    80006440:	00913423          	sd	s1,8(sp)
    80006444:	02010413          	addi	s0,sp,32
    80006448:	00050493          	mv	s1,a0
    Console::putc('\n');
    8000644c:	00a00513          	li	a0,10
    80006450:	ffffc097          	auipc	ra,0xffffc
    80006454:	744080e7          	jalr	1860(ra) # 80002b94 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80006458:	00004517          	auipc	a0,0x4
    8000645c:	fd050513          	addi	a0,a0,-48 # 8000a428 <_ZZ9kPrintIntmE6digits+0x3b8>
    80006460:	00000097          	auipc	ra,0x0
    80006464:	a0c080e7          	jalr	-1524(ra) # 80005e6c <_Z11printStringPKc>
    while (getCnt()) {
    80006468:	00048513          	mv	a0,s1
    8000646c:	00000097          	auipc	ra,0x0
    80006470:	f40080e7          	jalr	-192(ra) # 800063ac <_ZN9BufferCPP6getCntEv>
    80006474:	02050c63          	beqz	a0,800064ac <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80006478:	0084b783          	ld	a5,8(s1)
    8000647c:	0104a703          	lw	a4,16(s1)
    80006480:	00271713          	slli	a4,a4,0x2
    80006484:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80006488:	0007c503          	lbu	a0,0(a5)
    8000648c:	ffffc097          	auipc	ra,0xffffc
    80006490:	708080e7          	jalr	1800(ra) # 80002b94 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80006494:	0104a783          	lw	a5,16(s1)
    80006498:	0017879b          	addiw	a5,a5,1
    8000649c:	0004a703          	lw	a4,0(s1)
    800064a0:	02e7e7bb          	remw	a5,a5,a4
    800064a4:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    800064a8:	fc1ff06f          	j	80006468 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    800064ac:	02100513          	li	a0,33
    800064b0:	ffffc097          	auipc	ra,0xffffc
    800064b4:	6e4080e7          	jalr	1764(ra) # 80002b94 <_ZN7Console4putcEc>
    Console::putc('\n');
    800064b8:	00a00513          	li	a0,10
    800064bc:	ffffc097          	auipc	ra,0xffffc
    800064c0:	6d8080e7          	jalr	1752(ra) # 80002b94 <_ZN7Console4putcEc>
    mem_free(buffer);
    800064c4:	0084b503          	ld	a0,8(s1)
    800064c8:	ffffb097          	auipc	ra,0xffffb
    800064cc:	e88080e7          	jalr	-376(ra) # 80001350 <_Z8mem_freePv>
    delete itemAvailable;
    800064d0:	0204b503          	ld	a0,32(s1)
    800064d4:	00050863          	beqz	a0,800064e4 <_ZN9BufferCPPD1Ev+0xb0>
    800064d8:	00053783          	ld	a5,0(a0)
    800064dc:	0087b783          	ld	a5,8(a5)
    800064e0:	000780e7          	jalr	a5
    delete spaceAvailable;
    800064e4:	0184b503          	ld	a0,24(s1)
    800064e8:	00050863          	beqz	a0,800064f8 <_ZN9BufferCPPD1Ev+0xc4>
    800064ec:	00053783          	ld	a5,0(a0)
    800064f0:	0087b783          	ld	a5,8(a5)
    800064f4:	000780e7          	jalr	a5
    delete mutexTail;
    800064f8:	0304b503          	ld	a0,48(s1)
    800064fc:	00050863          	beqz	a0,8000650c <_ZN9BufferCPPD1Ev+0xd8>
    80006500:	00053783          	ld	a5,0(a0)
    80006504:	0087b783          	ld	a5,8(a5)
    80006508:	000780e7          	jalr	a5
    delete mutexHead;
    8000650c:	0284b503          	ld	a0,40(s1)
    80006510:	00050863          	beqz	a0,80006520 <_ZN9BufferCPPD1Ev+0xec>
    80006514:	00053783          	ld	a5,0(a0)
    80006518:	0087b783          	ld	a5,8(a5)
    8000651c:	000780e7          	jalr	a5
}
    80006520:	01813083          	ld	ra,24(sp)
    80006524:	01013403          	ld	s0,16(sp)
    80006528:	00813483          	ld	s1,8(sp)
    8000652c:	02010113          	addi	sp,sp,32
    80006530:	00008067          	ret

0000000080006534 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    80006534:	fe010113          	addi	sp,sp,-32
    80006538:	00113c23          	sd	ra,24(sp)
    8000653c:	00813823          	sd	s0,16(sp)
    80006540:	00913423          	sd	s1,8(sp)
    80006544:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80006548:	00004517          	auipc	a0,0x4
    8000654c:	ef850513          	addi	a0,a0,-264 # 8000a440 <_ZZ9kPrintIntmE6digits+0x3d0>
    80006550:	00000097          	auipc	ra,0x0
    80006554:	91c080e7          	jalr	-1764(ra) # 80005e6c <_Z11printStringPKc>
    int test = getc() - '0';
    80006558:	ffffb097          	auipc	ra,0xffffb
    8000655c:	010080e7          	jalr	16(ra) # 80001568 <_Z4getcv>
    80006560:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    80006564:	ffffb097          	auipc	ra,0xffffb
    80006568:	004080e7          	jalr	4(ra) # 80001568 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    8000656c:	00700793          	li	a5,7
    80006570:	1097e263          	bltu	a5,s1,80006674 <_Z8userMainv+0x140>
    80006574:	00249493          	slli	s1,s1,0x2
    80006578:	00004717          	auipc	a4,0x4
    8000657c:	12070713          	addi	a4,a4,288 # 8000a698 <_ZZ9kPrintIntmE6digits+0x628>
    80006580:	00e484b3          	add	s1,s1,a4
    80006584:	0004a783          	lw	a5,0(s1)
    80006588:	00e787b3          	add	a5,a5,a4
    8000658c:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    80006590:	fffff097          	auipc	ra,0xfffff
    80006594:	f54080e7          	jalr	-172(ra) # 800054e4 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80006598:	00004517          	auipc	a0,0x4
    8000659c:	ec850513          	addi	a0,a0,-312 # 8000a460 <_ZZ9kPrintIntmE6digits+0x3f0>
    800065a0:	00000097          	auipc	ra,0x0
    800065a4:	8cc080e7          	jalr	-1844(ra) # 80005e6c <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    800065a8:	01813083          	ld	ra,24(sp)
    800065ac:	01013403          	ld	s0,16(sp)
    800065b0:	00813483          	ld	s1,8(sp)
    800065b4:	02010113          	addi	sp,sp,32
    800065b8:	00008067          	ret
            Threads_CPP_API_test();
    800065bc:	ffffe097          	auipc	ra,0xffffe
    800065c0:	e08080e7          	jalr	-504(ra) # 800043c4 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    800065c4:	00004517          	auipc	a0,0x4
    800065c8:	edc50513          	addi	a0,a0,-292 # 8000a4a0 <_ZZ9kPrintIntmE6digits+0x430>
    800065cc:	00000097          	auipc	ra,0x0
    800065d0:	8a0080e7          	jalr	-1888(ra) # 80005e6c <_Z11printStringPKc>
            break;
    800065d4:	fd5ff06f          	j	800065a8 <_Z8userMainv+0x74>
            producerConsumer_C_API();
    800065d8:	ffffd097          	auipc	ra,0xffffd
    800065dc:	640080e7          	jalr	1600(ra) # 80003c18 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    800065e0:	00004517          	auipc	a0,0x4
    800065e4:	f0050513          	addi	a0,a0,-256 # 8000a4e0 <_ZZ9kPrintIntmE6digits+0x470>
    800065e8:	00000097          	auipc	ra,0x0
    800065ec:	884080e7          	jalr	-1916(ra) # 80005e6c <_Z11printStringPKc>
            break;
    800065f0:	fb9ff06f          	j	800065a8 <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    800065f4:	fffff097          	auipc	ra,0xfffff
    800065f8:	234080e7          	jalr	564(ra) # 80005828 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    800065fc:	00004517          	auipc	a0,0x4
    80006600:	f3450513          	addi	a0,a0,-204 # 8000a530 <_ZZ9kPrintIntmE6digits+0x4c0>
    80006604:	00000097          	auipc	ra,0x0
    80006608:	868080e7          	jalr	-1944(ra) # 80005e6c <_Z11printStringPKc>
            break;
    8000660c:	f9dff06f          	j	800065a8 <_Z8userMainv+0x74>
            testSleeping();
    80006610:	00000097          	auipc	ra,0x0
    80006614:	11c080e7          	jalr	284(ra) # 8000672c <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    80006618:	00004517          	auipc	a0,0x4
    8000661c:	f7050513          	addi	a0,a0,-144 # 8000a588 <_ZZ9kPrintIntmE6digits+0x518>
    80006620:	00000097          	auipc	ra,0x0
    80006624:	84c080e7          	jalr	-1972(ra) # 80005e6c <_Z11printStringPKc>
            break;
    80006628:	f81ff06f          	j	800065a8 <_Z8userMainv+0x74>
            testConsumerProducer();
    8000662c:	ffffe097          	auipc	ra,0xffffe
    80006630:	258080e7          	jalr	600(ra) # 80004884 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    80006634:	00004517          	auipc	a0,0x4
    80006638:	f8450513          	addi	a0,a0,-124 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    8000663c:	00000097          	auipc	ra,0x0
    80006640:	830080e7          	jalr	-2000(ra) # 80005e6c <_Z11printStringPKc>
            break;
    80006644:	f65ff06f          	j	800065a8 <_Z8userMainv+0x74>
            System_Mode_test();
    80006648:	00000097          	auipc	ra,0x0
    8000664c:	658080e7          	jalr	1624(ra) # 80006ca0 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80006650:	00004517          	auipc	a0,0x4
    80006654:	fa850513          	addi	a0,a0,-88 # 8000a5f8 <_ZZ9kPrintIntmE6digits+0x588>
    80006658:	00000097          	auipc	ra,0x0
    8000665c:	814080e7          	jalr	-2028(ra) # 80005e6c <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80006660:	00004517          	auipc	a0,0x4
    80006664:	fb850513          	addi	a0,a0,-72 # 8000a618 <_ZZ9kPrintIntmE6digits+0x5a8>
    80006668:	00000097          	auipc	ra,0x0
    8000666c:	804080e7          	jalr	-2044(ra) # 80005e6c <_Z11printStringPKc>
            break;
    80006670:	f39ff06f          	j	800065a8 <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    80006674:	00004517          	auipc	a0,0x4
    80006678:	ffc50513          	addi	a0,a0,-4 # 8000a670 <_ZZ9kPrintIntmE6digits+0x600>
    8000667c:	fffff097          	auipc	ra,0xfffff
    80006680:	7f0080e7          	jalr	2032(ra) # 80005e6c <_Z11printStringPKc>
    80006684:	f25ff06f          	j	800065a8 <_Z8userMainv+0x74>

0000000080006688 <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    80006688:	fe010113          	addi	sp,sp,-32
    8000668c:	00113c23          	sd	ra,24(sp)
    80006690:	00813823          	sd	s0,16(sp)
    80006694:	00913423          	sd	s1,8(sp)
    80006698:	01213023          	sd	s2,0(sp)
    8000669c:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    800066a0:	00053903          	ld	s2,0(a0)
    int i = 6;
    800066a4:	00600493          	li	s1,6
    while (--i > 0) {
    800066a8:	fff4849b          	addiw	s1,s1,-1
    800066ac:	04905463          	blez	s1,800066f4 <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    800066b0:	00004517          	auipc	a0,0x4
    800066b4:	00850513          	addi	a0,a0,8 # 8000a6b8 <_ZZ9kPrintIntmE6digits+0x648>
    800066b8:	fffff097          	auipc	ra,0xfffff
    800066bc:	7b4080e7          	jalr	1972(ra) # 80005e6c <_Z11printStringPKc>
        printInt(sleep_time);
    800066c0:	00000613          	li	a2,0
    800066c4:	00a00593          	li	a1,10
    800066c8:	0009051b          	sext.w	a0,s2
    800066cc:	00000097          	auipc	ra,0x0
    800066d0:	950080e7          	jalr	-1712(ra) # 8000601c <_Z8printIntiii>
        printString(" !\n");
    800066d4:	00004517          	auipc	a0,0x4
    800066d8:	fec50513          	addi	a0,a0,-20 # 8000a6c0 <_ZZ9kPrintIntmE6digits+0x650>
    800066dc:	fffff097          	auipc	ra,0xfffff
    800066e0:	790080e7          	jalr	1936(ra) # 80005e6c <_Z11printStringPKc>
        time_sleep(sleep_time);
    800066e4:	00090513          	mv	a0,s2
    800066e8:	ffffb097          	auipc	ra,0xffffb
    800066ec:	d88080e7          	jalr	-632(ra) # 80001470 <_Z10time_sleepm>
    while (--i > 0) {
    800066f0:	fb9ff06f          	j	800066a8 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    800066f4:	00a00793          	li	a5,10
    800066f8:	02f95933          	divu	s2,s2,a5
    800066fc:	fff90913          	addi	s2,s2,-1
    80006700:	00006797          	auipc	a5,0x6
    80006704:	5f878793          	addi	a5,a5,1528 # 8000ccf8 <_ZL8finished>
    80006708:	01278933          	add	s2,a5,s2
    8000670c:	00100793          	li	a5,1
    80006710:	00f90023          	sb	a5,0(s2)
}
    80006714:	01813083          	ld	ra,24(sp)
    80006718:	01013403          	ld	s0,16(sp)
    8000671c:	00813483          	ld	s1,8(sp)
    80006720:	00013903          	ld	s2,0(sp)
    80006724:	02010113          	addi	sp,sp,32
    80006728:	00008067          	ret

000000008000672c <_Z12testSleepingv>:

void testSleeping() {
    8000672c:	fc010113          	addi	sp,sp,-64
    80006730:	02113c23          	sd	ra,56(sp)
    80006734:	02813823          	sd	s0,48(sp)
    80006738:	02913423          	sd	s1,40(sp)
    8000673c:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    80006740:	00a00793          	li	a5,10
    80006744:	fcf43823          	sd	a5,-48(s0)
    80006748:	01400793          	li	a5,20
    8000674c:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    80006750:	00000493          	li	s1,0
    80006754:	02c0006f          	j	80006780 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    80006758:	00349793          	slli	a5,s1,0x3
    8000675c:	fd040613          	addi	a2,s0,-48
    80006760:	00f60633          	add	a2,a2,a5
    80006764:	00000597          	auipc	a1,0x0
    80006768:	f2458593          	addi	a1,a1,-220 # 80006688 <_ZL9sleepyRunPv>
    8000676c:	fc040513          	addi	a0,s0,-64
    80006770:	00f50533          	add	a0,a0,a5
    80006774:	ffffb097          	auipc	ra,0xffffb
    80006778:	c0c080e7          	jalr	-1012(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    8000677c:	0014849b          	addiw	s1,s1,1
    80006780:	00100793          	li	a5,1
    80006784:	fc97dae3          	bge	a5,s1,80006758 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    80006788:	00006797          	auipc	a5,0x6
    8000678c:	5707c783          	lbu	a5,1392(a5) # 8000ccf8 <_ZL8finished>
    80006790:	fe078ce3          	beqz	a5,80006788 <_Z12testSleepingv+0x5c>
    80006794:	00006797          	auipc	a5,0x6
    80006798:	5657c783          	lbu	a5,1381(a5) # 8000ccf9 <_ZL8finished+0x1>
    8000679c:	fe0786e3          	beqz	a5,80006788 <_Z12testSleepingv+0x5c>
}
    800067a0:	03813083          	ld	ra,56(sp)
    800067a4:	03013403          	ld	s0,48(sp)
    800067a8:	02813483          	ld	s1,40(sp)
    800067ac:	04010113          	addi	sp,sp,64
    800067b0:	00008067          	ret

00000000800067b4 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800067b4:	fe010113          	addi	sp,sp,-32
    800067b8:	00113c23          	sd	ra,24(sp)
    800067bc:	00813823          	sd	s0,16(sp)
    800067c0:	00913423          	sd	s1,8(sp)
    800067c4:	01213023          	sd	s2,0(sp)
    800067c8:	02010413          	addi	s0,sp,32
    800067cc:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800067d0:	00100793          	li	a5,1
    800067d4:	02a7f863          	bgeu	a5,a0,80006804 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800067d8:	00a00793          	li	a5,10
    800067dc:	02f577b3          	remu	a5,a0,a5
    800067e0:	02078e63          	beqz	a5,8000681c <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800067e4:	fff48513          	addi	a0,s1,-1
    800067e8:	00000097          	auipc	ra,0x0
    800067ec:	fcc080e7          	jalr	-52(ra) # 800067b4 <_ZL9fibonaccim>
    800067f0:	00050913          	mv	s2,a0
    800067f4:	ffe48513          	addi	a0,s1,-2
    800067f8:	00000097          	auipc	ra,0x0
    800067fc:	fbc080e7          	jalr	-68(ra) # 800067b4 <_ZL9fibonaccim>
    80006800:	00a90533          	add	a0,s2,a0
}
    80006804:	01813083          	ld	ra,24(sp)
    80006808:	01013403          	ld	s0,16(sp)
    8000680c:	00813483          	ld	s1,8(sp)
    80006810:	00013903          	ld	s2,0(sp)
    80006814:	02010113          	addi	sp,sp,32
    80006818:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    8000681c:	ffffb097          	auipc	ra,0xffffb
    80006820:	c0c080e7          	jalr	-1012(ra) # 80001428 <_Z15thread_dispatchv>
    80006824:	fc1ff06f          	j	800067e4 <_ZL9fibonaccim+0x30>

0000000080006828 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80006828:	fe010113          	addi	sp,sp,-32
    8000682c:	00113c23          	sd	ra,24(sp)
    80006830:	00813823          	sd	s0,16(sp)
    80006834:	00913423          	sd	s1,8(sp)
    80006838:	01213023          	sd	s2,0(sp)
    8000683c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80006840:	00a00493          	li	s1,10
    80006844:	0400006f          	j	80006884 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006848:	00004517          	auipc	a0,0x4
    8000684c:	b4850513          	addi	a0,a0,-1208 # 8000a390 <_ZZ9kPrintIntmE6digits+0x320>
    80006850:	fffff097          	auipc	ra,0xfffff
    80006854:	61c080e7          	jalr	1564(ra) # 80005e6c <_Z11printStringPKc>
    80006858:	00000613          	li	a2,0
    8000685c:	00a00593          	li	a1,10
    80006860:	00048513          	mv	a0,s1
    80006864:	fffff097          	auipc	ra,0xfffff
    80006868:	7b8080e7          	jalr	1976(ra) # 8000601c <_Z8printIntiii>
    8000686c:	00004517          	auipc	a0,0x4
    80006870:	d1450513          	addi	a0,a0,-748 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80006874:	fffff097          	auipc	ra,0xfffff
    80006878:	5f8080e7          	jalr	1528(ra) # 80005e6c <_Z11printStringPKc>
    for (; i < 13; i++) {
    8000687c:	0014849b          	addiw	s1,s1,1
    80006880:	0ff4f493          	andi	s1,s1,255
    80006884:	00c00793          	li	a5,12
    80006888:	fc97f0e3          	bgeu	a5,s1,80006848 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    8000688c:	00004517          	auipc	a0,0x4
    80006890:	b0c50513          	addi	a0,a0,-1268 # 8000a398 <_ZZ9kPrintIntmE6digits+0x328>
    80006894:	fffff097          	auipc	ra,0xfffff
    80006898:	5d8080e7          	jalr	1496(ra) # 80005e6c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    8000689c:	00500313          	li	t1,5
    thread_dispatch();
    800068a0:	ffffb097          	auipc	ra,0xffffb
    800068a4:	b88080e7          	jalr	-1144(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800068a8:	01000513          	li	a0,16
    800068ac:	00000097          	auipc	ra,0x0
    800068b0:	f08080e7          	jalr	-248(ra) # 800067b4 <_ZL9fibonaccim>
    800068b4:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800068b8:	00004517          	auipc	a0,0x4
    800068bc:	af050513          	addi	a0,a0,-1296 # 8000a3a8 <_ZZ9kPrintIntmE6digits+0x338>
    800068c0:	fffff097          	auipc	ra,0xfffff
    800068c4:	5ac080e7          	jalr	1452(ra) # 80005e6c <_Z11printStringPKc>
    800068c8:	00000613          	li	a2,0
    800068cc:	00a00593          	li	a1,10
    800068d0:	0009051b          	sext.w	a0,s2
    800068d4:	fffff097          	auipc	ra,0xfffff
    800068d8:	748080e7          	jalr	1864(ra) # 8000601c <_Z8printIntiii>
    800068dc:	00004517          	auipc	a0,0x4
    800068e0:	ca450513          	addi	a0,a0,-860 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800068e4:	fffff097          	auipc	ra,0xfffff
    800068e8:	588080e7          	jalr	1416(ra) # 80005e6c <_Z11printStringPKc>
    800068ec:	0400006f          	j	8000692c <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800068f0:	00004517          	auipc	a0,0x4
    800068f4:	aa050513          	addi	a0,a0,-1376 # 8000a390 <_ZZ9kPrintIntmE6digits+0x320>
    800068f8:	fffff097          	auipc	ra,0xfffff
    800068fc:	574080e7          	jalr	1396(ra) # 80005e6c <_Z11printStringPKc>
    80006900:	00000613          	li	a2,0
    80006904:	00a00593          	li	a1,10
    80006908:	00048513          	mv	a0,s1
    8000690c:	fffff097          	auipc	ra,0xfffff
    80006910:	710080e7          	jalr	1808(ra) # 8000601c <_Z8printIntiii>
    80006914:	00004517          	auipc	a0,0x4
    80006918:	c6c50513          	addi	a0,a0,-916 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    8000691c:	fffff097          	auipc	ra,0xfffff
    80006920:	550080e7          	jalr	1360(ra) # 80005e6c <_Z11printStringPKc>
    for (; i < 16; i++) {
    80006924:	0014849b          	addiw	s1,s1,1
    80006928:	0ff4f493          	andi	s1,s1,255
    8000692c:	00f00793          	li	a5,15
    80006930:	fc97f0e3          	bgeu	a5,s1,800068f0 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80006934:	00004517          	auipc	a0,0x4
    80006938:	a8450513          	addi	a0,a0,-1404 # 8000a3b8 <_ZZ9kPrintIntmE6digits+0x348>
    8000693c:	fffff097          	auipc	ra,0xfffff
    80006940:	530080e7          	jalr	1328(ra) # 80005e6c <_Z11printStringPKc>
    finishedD = true;
    80006944:	00100793          	li	a5,1
    80006948:	00006717          	auipc	a4,0x6
    8000694c:	3af70923          	sb	a5,946(a4) # 8000ccfa <_ZL9finishedD>
    thread_dispatch();
    80006950:	ffffb097          	auipc	ra,0xffffb
    80006954:	ad8080e7          	jalr	-1320(ra) # 80001428 <_Z15thread_dispatchv>
}
    80006958:	01813083          	ld	ra,24(sp)
    8000695c:	01013403          	ld	s0,16(sp)
    80006960:	00813483          	ld	s1,8(sp)
    80006964:	00013903          	ld	s2,0(sp)
    80006968:	02010113          	addi	sp,sp,32
    8000696c:	00008067          	ret

0000000080006970 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80006970:	fe010113          	addi	sp,sp,-32
    80006974:	00113c23          	sd	ra,24(sp)
    80006978:	00813823          	sd	s0,16(sp)
    8000697c:	00913423          	sd	s1,8(sp)
    80006980:	01213023          	sd	s2,0(sp)
    80006984:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80006988:	00000493          	li	s1,0
    8000698c:	0400006f          	j	800069cc <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80006990:	00004517          	auipc	a0,0x4
    80006994:	9c050513          	addi	a0,a0,-1600 # 8000a350 <_ZZ9kPrintIntmE6digits+0x2e0>
    80006998:	fffff097          	auipc	ra,0xfffff
    8000699c:	4d4080e7          	jalr	1236(ra) # 80005e6c <_Z11printStringPKc>
    800069a0:	00000613          	li	a2,0
    800069a4:	00a00593          	li	a1,10
    800069a8:	00048513          	mv	a0,s1
    800069ac:	fffff097          	auipc	ra,0xfffff
    800069b0:	670080e7          	jalr	1648(ra) # 8000601c <_Z8printIntiii>
    800069b4:	00004517          	auipc	a0,0x4
    800069b8:	bcc50513          	addi	a0,a0,-1076 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800069bc:	fffff097          	auipc	ra,0xfffff
    800069c0:	4b0080e7          	jalr	1200(ra) # 80005e6c <_Z11printStringPKc>
    for (; i < 3; i++) {
    800069c4:	0014849b          	addiw	s1,s1,1
    800069c8:	0ff4f493          	andi	s1,s1,255
    800069cc:	00200793          	li	a5,2
    800069d0:	fc97f0e3          	bgeu	a5,s1,80006990 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    800069d4:	00004517          	auipc	a0,0x4
    800069d8:	98450513          	addi	a0,a0,-1660 # 8000a358 <_ZZ9kPrintIntmE6digits+0x2e8>
    800069dc:	fffff097          	auipc	ra,0xfffff
    800069e0:	490080e7          	jalr	1168(ra) # 80005e6c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800069e4:	00700313          	li	t1,7
    thread_dispatch();
    800069e8:	ffffb097          	auipc	ra,0xffffb
    800069ec:	a40080e7          	jalr	-1472(ra) # 80001428 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800069f0:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    800069f4:	00004517          	auipc	a0,0x4
    800069f8:	97450513          	addi	a0,a0,-1676 # 8000a368 <_ZZ9kPrintIntmE6digits+0x2f8>
    800069fc:	fffff097          	auipc	ra,0xfffff
    80006a00:	470080e7          	jalr	1136(ra) # 80005e6c <_Z11printStringPKc>
    80006a04:	00000613          	li	a2,0
    80006a08:	00a00593          	li	a1,10
    80006a0c:	0009051b          	sext.w	a0,s2
    80006a10:	fffff097          	auipc	ra,0xfffff
    80006a14:	60c080e7          	jalr	1548(ra) # 8000601c <_Z8printIntiii>
    80006a18:	00004517          	auipc	a0,0x4
    80006a1c:	b6850513          	addi	a0,a0,-1176 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80006a20:	fffff097          	auipc	ra,0xfffff
    80006a24:	44c080e7          	jalr	1100(ra) # 80005e6c <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80006a28:	00c00513          	li	a0,12
    80006a2c:	00000097          	auipc	ra,0x0
    80006a30:	d88080e7          	jalr	-632(ra) # 800067b4 <_ZL9fibonaccim>
    80006a34:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006a38:	00004517          	auipc	a0,0x4
    80006a3c:	93850513          	addi	a0,a0,-1736 # 8000a370 <_ZZ9kPrintIntmE6digits+0x300>
    80006a40:	fffff097          	auipc	ra,0xfffff
    80006a44:	42c080e7          	jalr	1068(ra) # 80005e6c <_Z11printStringPKc>
    80006a48:	00000613          	li	a2,0
    80006a4c:	00a00593          	li	a1,10
    80006a50:	0009051b          	sext.w	a0,s2
    80006a54:	fffff097          	auipc	ra,0xfffff
    80006a58:	5c8080e7          	jalr	1480(ra) # 8000601c <_Z8printIntiii>
    80006a5c:	00004517          	auipc	a0,0x4
    80006a60:	b2450513          	addi	a0,a0,-1244 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80006a64:	fffff097          	auipc	ra,0xfffff
    80006a68:	408080e7          	jalr	1032(ra) # 80005e6c <_Z11printStringPKc>
    80006a6c:	0400006f          	j	80006aac <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80006a70:	00004517          	auipc	a0,0x4
    80006a74:	8e050513          	addi	a0,a0,-1824 # 8000a350 <_ZZ9kPrintIntmE6digits+0x2e0>
    80006a78:	fffff097          	auipc	ra,0xfffff
    80006a7c:	3f4080e7          	jalr	1012(ra) # 80005e6c <_Z11printStringPKc>
    80006a80:	00000613          	li	a2,0
    80006a84:	00a00593          	li	a1,10
    80006a88:	00048513          	mv	a0,s1
    80006a8c:	fffff097          	auipc	ra,0xfffff
    80006a90:	590080e7          	jalr	1424(ra) # 8000601c <_Z8printIntiii>
    80006a94:	00004517          	auipc	a0,0x4
    80006a98:	aec50513          	addi	a0,a0,-1300 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80006a9c:	fffff097          	auipc	ra,0xfffff
    80006aa0:	3d0080e7          	jalr	976(ra) # 80005e6c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80006aa4:	0014849b          	addiw	s1,s1,1
    80006aa8:	0ff4f493          	andi	s1,s1,255
    80006aac:	00500793          	li	a5,5
    80006ab0:	fc97f0e3          	bgeu	a5,s1,80006a70 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80006ab4:	00004517          	auipc	a0,0x4
    80006ab8:	87450513          	addi	a0,a0,-1932 # 8000a328 <_ZZ9kPrintIntmE6digits+0x2b8>
    80006abc:	fffff097          	auipc	ra,0xfffff
    80006ac0:	3b0080e7          	jalr	944(ra) # 80005e6c <_Z11printStringPKc>
    finishedC = true;
    80006ac4:	00100793          	li	a5,1
    80006ac8:	00006717          	auipc	a4,0x6
    80006acc:	22f709a3          	sb	a5,563(a4) # 8000ccfb <_ZL9finishedC>
    thread_dispatch();
    80006ad0:	ffffb097          	auipc	ra,0xffffb
    80006ad4:	958080e7          	jalr	-1704(ra) # 80001428 <_Z15thread_dispatchv>
}
    80006ad8:	01813083          	ld	ra,24(sp)
    80006adc:	01013403          	ld	s0,16(sp)
    80006ae0:	00813483          	ld	s1,8(sp)
    80006ae4:	00013903          	ld	s2,0(sp)
    80006ae8:	02010113          	addi	sp,sp,32
    80006aec:	00008067          	ret

0000000080006af0 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80006af0:	fe010113          	addi	sp,sp,-32
    80006af4:	00113c23          	sd	ra,24(sp)
    80006af8:	00813823          	sd	s0,16(sp)
    80006afc:	00913423          	sd	s1,8(sp)
    80006b00:	01213023          	sd	s2,0(sp)
    80006b04:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006b08:	00000913          	li	s2,0
    80006b0c:	0400006f          	j	80006b4c <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    80006b10:	ffffb097          	auipc	ra,0xffffb
    80006b14:	918080e7          	jalr	-1768(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006b18:	00148493          	addi	s1,s1,1
    80006b1c:	000027b7          	lui	a5,0x2
    80006b20:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006b24:	0097ee63          	bltu	a5,s1,80006b40 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006b28:	00000713          	li	a4,0
    80006b2c:	000077b7          	lui	a5,0x7
    80006b30:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006b34:	fce7eee3          	bltu	a5,a4,80006b10 <_ZL11workerBodyBPv+0x20>
    80006b38:	00170713          	addi	a4,a4,1
    80006b3c:	ff1ff06f          	j	80006b2c <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    80006b40:	00a00793          	li	a5,10
    80006b44:	04f90663          	beq	s2,a5,80006b90 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80006b48:	00190913          	addi	s2,s2,1
    80006b4c:	00f00793          	li	a5,15
    80006b50:	0527e463          	bltu	a5,s2,80006b98 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80006b54:	00003517          	auipc	a0,0x3
    80006b58:	7e450513          	addi	a0,a0,2020 # 8000a338 <_ZZ9kPrintIntmE6digits+0x2c8>
    80006b5c:	fffff097          	auipc	ra,0xfffff
    80006b60:	310080e7          	jalr	784(ra) # 80005e6c <_Z11printStringPKc>
    80006b64:	00000613          	li	a2,0
    80006b68:	00a00593          	li	a1,10
    80006b6c:	0009051b          	sext.w	a0,s2
    80006b70:	fffff097          	auipc	ra,0xfffff
    80006b74:	4ac080e7          	jalr	1196(ra) # 8000601c <_Z8printIntiii>
    80006b78:	00004517          	auipc	a0,0x4
    80006b7c:	a0850513          	addi	a0,a0,-1528 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80006b80:	fffff097          	auipc	ra,0xfffff
    80006b84:	2ec080e7          	jalr	748(ra) # 80005e6c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006b88:	00000493          	li	s1,0
    80006b8c:	f91ff06f          	j	80006b1c <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    80006b90:	14102ff3          	csrr	t6,sepc
    80006b94:	fb5ff06f          	j	80006b48 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    80006b98:	00003517          	auipc	a0,0x3
    80006b9c:	7a850513          	addi	a0,a0,1960 # 8000a340 <_ZZ9kPrintIntmE6digits+0x2d0>
    80006ba0:	fffff097          	auipc	ra,0xfffff
    80006ba4:	2cc080e7          	jalr	716(ra) # 80005e6c <_Z11printStringPKc>
    finishedB = true;
    80006ba8:	00100793          	li	a5,1
    80006bac:	00006717          	auipc	a4,0x6
    80006bb0:	14f70823          	sb	a5,336(a4) # 8000ccfc <_ZL9finishedB>
    thread_dispatch();
    80006bb4:	ffffb097          	auipc	ra,0xffffb
    80006bb8:	874080e7          	jalr	-1932(ra) # 80001428 <_Z15thread_dispatchv>
}
    80006bbc:	01813083          	ld	ra,24(sp)
    80006bc0:	01013403          	ld	s0,16(sp)
    80006bc4:	00813483          	ld	s1,8(sp)
    80006bc8:	00013903          	ld	s2,0(sp)
    80006bcc:	02010113          	addi	sp,sp,32
    80006bd0:	00008067          	ret

0000000080006bd4 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006bd4:	fe010113          	addi	sp,sp,-32
    80006bd8:	00113c23          	sd	ra,24(sp)
    80006bdc:	00813823          	sd	s0,16(sp)
    80006be0:	00913423          	sd	s1,8(sp)
    80006be4:	01213023          	sd	s2,0(sp)
    80006be8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006bec:	00000913          	li	s2,0
    80006bf0:	0380006f          	j	80006c28 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80006bf4:	ffffb097          	auipc	ra,0xffffb
    80006bf8:	834080e7          	jalr	-1996(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006bfc:	00148493          	addi	s1,s1,1
    80006c00:	000027b7          	lui	a5,0x2
    80006c04:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006c08:	0097ee63          	bltu	a5,s1,80006c24 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006c0c:	00000713          	li	a4,0
    80006c10:	000077b7          	lui	a5,0x7
    80006c14:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006c18:	fce7eee3          	bltu	a5,a4,80006bf4 <_ZL11workerBodyAPv+0x20>
    80006c1c:	00170713          	addi	a4,a4,1
    80006c20:	ff1ff06f          	j	80006c10 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80006c24:	00190913          	addi	s2,s2,1
    80006c28:	00900793          	li	a5,9
    80006c2c:	0527e063          	bltu	a5,s2,80006c6c <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80006c30:	00003517          	auipc	a0,0x3
    80006c34:	6f050513          	addi	a0,a0,1776 # 8000a320 <_ZZ9kPrintIntmE6digits+0x2b0>
    80006c38:	fffff097          	auipc	ra,0xfffff
    80006c3c:	234080e7          	jalr	564(ra) # 80005e6c <_Z11printStringPKc>
    80006c40:	00000613          	li	a2,0
    80006c44:	00a00593          	li	a1,10
    80006c48:	0009051b          	sext.w	a0,s2
    80006c4c:	fffff097          	auipc	ra,0xfffff
    80006c50:	3d0080e7          	jalr	976(ra) # 8000601c <_Z8printIntiii>
    80006c54:	00004517          	auipc	a0,0x4
    80006c58:	92c50513          	addi	a0,a0,-1748 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80006c5c:	fffff097          	auipc	ra,0xfffff
    80006c60:	210080e7          	jalr	528(ra) # 80005e6c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006c64:	00000493          	li	s1,0
    80006c68:	f99ff06f          	j	80006c00 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80006c6c:	00003517          	auipc	a0,0x3
    80006c70:	6bc50513          	addi	a0,a0,1724 # 8000a328 <_ZZ9kPrintIntmE6digits+0x2b8>
    80006c74:	fffff097          	auipc	ra,0xfffff
    80006c78:	1f8080e7          	jalr	504(ra) # 80005e6c <_Z11printStringPKc>
    finishedA = true;
    80006c7c:	00100793          	li	a5,1
    80006c80:	00006717          	auipc	a4,0x6
    80006c84:	06f70ea3          	sb	a5,125(a4) # 8000ccfd <_ZL9finishedA>
}
    80006c88:	01813083          	ld	ra,24(sp)
    80006c8c:	01013403          	ld	s0,16(sp)
    80006c90:	00813483          	ld	s1,8(sp)
    80006c94:	00013903          	ld	s2,0(sp)
    80006c98:	02010113          	addi	sp,sp,32
    80006c9c:	00008067          	ret

0000000080006ca0 <_Z16System_Mode_testv>:


void System_Mode_test() {
    80006ca0:	fd010113          	addi	sp,sp,-48
    80006ca4:	02113423          	sd	ra,40(sp)
    80006ca8:	02813023          	sd	s0,32(sp)
    80006cac:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80006cb0:	00000613          	li	a2,0
    80006cb4:	00000597          	auipc	a1,0x0
    80006cb8:	f2058593          	addi	a1,a1,-224 # 80006bd4 <_ZL11workerBodyAPv>
    80006cbc:	fd040513          	addi	a0,s0,-48
    80006cc0:	ffffa097          	auipc	ra,0xffffa
    80006cc4:	6c0080e7          	jalr	1728(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80006cc8:	00003517          	auipc	a0,0x3
    80006ccc:	70050513          	addi	a0,a0,1792 # 8000a3c8 <_ZZ9kPrintIntmE6digits+0x358>
    80006cd0:	fffff097          	auipc	ra,0xfffff
    80006cd4:	19c080e7          	jalr	412(ra) # 80005e6c <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80006cd8:	00000613          	li	a2,0
    80006cdc:	00000597          	auipc	a1,0x0
    80006ce0:	e1458593          	addi	a1,a1,-492 # 80006af0 <_ZL11workerBodyBPv>
    80006ce4:	fd840513          	addi	a0,s0,-40
    80006ce8:	ffffa097          	auipc	ra,0xffffa
    80006cec:	698080e7          	jalr	1688(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80006cf0:	00003517          	auipc	a0,0x3
    80006cf4:	6f050513          	addi	a0,a0,1776 # 8000a3e0 <_ZZ9kPrintIntmE6digits+0x370>
    80006cf8:	fffff097          	auipc	ra,0xfffff
    80006cfc:	174080e7          	jalr	372(ra) # 80005e6c <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80006d00:	00000613          	li	a2,0
    80006d04:	00000597          	auipc	a1,0x0
    80006d08:	c6c58593          	addi	a1,a1,-916 # 80006970 <_ZL11workerBodyCPv>
    80006d0c:	fe040513          	addi	a0,s0,-32
    80006d10:	ffffa097          	auipc	ra,0xffffa
    80006d14:	670080e7          	jalr	1648(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80006d18:	00003517          	auipc	a0,0x3
    80006d1c:	6e050513          	addi	a0,a0,1760 # 8000a3f8 <_ZZ9kPrintIntmE6digits+0x388>
    80006d20:	fffff097          	auipc	ra,0xfffff
    80006d24:	14c080e7          	jalr	332(ra) # 80005e6c <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80006d28:	00000613          	li	a2,0
    80006d2c:	00000597          	auipc	a1,0x0
    80006d30:	afc58593          	addi	a1,a1,-1284 # 80006828 <_ZL11workerBodyDPv>
    80006d34:	fe840513          	addi	a0,s0,-24
    80006d38:	ffffa097          	auipc	ra,0xffffa
    80006d3c:	648080e7          	jalr	1608(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80006d40:	00003517          	auipc	a0,0x3
    80006d44:	6d050513          	addi	a0,a0,1744 # 8000a410 <_ZZ9kPrintIntmE6digits+0x3a0>
    80006d48:	fffff097          	auipc	ra,0xfffff
    80006d4c:	124080e7          	jalr	292(ra) # 80005e6c <_Z11printStringPKc>
    80006d50:	00c0006f          	j	80006d5c <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006d54:	ffffa097          	auipc	ra,0xffffa
    80006d58:	6d4080e7          	jalr	1748(ra) # 80001428 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006d5c:	00006797          	auipc	a5,0x6
    80006d60:	fa17c783          	lbu	a5,-95(a5) # 8000ccfd <_ZL9finishedA>
    80006d64:	fe0788e3          	beqz	a5,80006d54 <_Z16System_Mode_testv+0xb4>
    80006d68:	00006797          	auipc	a5,0x6
    80006d6c:	f947c783          	lbu	a5,-108(a5) # 8000ccfc <_ZL9finishedB>
    80006d70:	fe0782e3          	beqz	a5,80006d54 <_Z16System_Mode_testv+0xb4>
    80006d74:	00006797          	auipc	a5,0x6
    80006d78:	f877c783          	lbu	a5,-121(a5) # 8000ccfb <_ZL9finishedC>
    80006d7c:	fc078ce3          	beqz	a5,80006d54 <_Z16System_Mode_testv+0xb4>
    80006d80:	00006797          	auipc	a5,0x6
    80006d84:	f7a7c783          	lbu	a5,-134(a5) # 8000ccfa <_ZL9finishedD>
    80006d88:	fc0786e3          	beqz	a5,80006d54 <_Z16System_Mode_testv+0xb4>
    }

}
    80006d8c:	02813083          	ld	ra,40(sp)
    80006d90:	02013403          	ld	s0,32(sp)
    80006d94:	03010113          	addi	sp,sp,48
    80006d98:	00008067          	ret

0000000080006d9c <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006d9c:	fe010113          	addi	sp,sp,-32
    80006da0:	00113c23          	sd	ra,24(sp)
    80006da4:	00813823          	sd	s0,16(sp)
    80006da8:	00913423          	sd	s1,8(sp)
    80006dac:	01213023          	sd	s2,0(sp)
    80006db0:	02010413          	addi	s0,sp,32
    80006db4:	00050493          	mv	s1,a0
    80006db8:	00058913          	mv	s2,a1
    80006dbc:	0015879b          	addiw	a5,a1,1
    80006dc0:	0007851b          	sext.w	a0,a5
    80006dc4:	00f4a023          	sw	a5,0(s1)
    80006dc8:	0004a823          	sw	zero,16(s1)
    80006dcc:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006dd0:	00251513          	slli	a0,a0,0x2
    80006dd4:	ffffa097          	auipc	ra,0xffffa
    80006dd8:	53c080e7          	jalr	1340(ra) # 80001310 <_Z9mem_allocm>
    80006ddc:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80006de0:	00000593          	li	a1,0
    80006de4:	02048513          	addi	a0,s1,32
    80006de8:	ffffa097          	auipc	ra,0xffffa
    80006dec:	6b8080e7          	jalr	1720(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&spaceAvailable, _cap);
    80006df0:	00090593          	mv	a1,s2
    80006df4:	01848513          	addi	a0,s1,24
    80006df8:	ffffa097          	auipc	ra,0xffffa
    80006dfc:	6a8080e7          	jalr	1704(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&mutexHead, 1);
    80006e00:	00100593          	li	a1,1
    80006e04:	02848513          	addi	a0,s1,40
    80006e08:	ffffa097          	auipc	ra,0xffffa
    80006e0c:	698080e7          	jalr	1688(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&mutexTail, 1);
    80006e10:	00100593          	li	a1,1
    80006e14:	03048513          	addi	a0,s1,48
    80006e18:	ffffa097          	auipc	ra,0xffffa
    80006e1c:	688080e7          	jalr	1672(ra) # 800014a0 <_Z8sem_openPP4KSemj>
}
    80006e20:	01813083          	ld	ra,24(sp)
    80006e24:	01013403          	ld	s0,16(sp)
    80006e28:	00813483          	ld	s1,8(sp)
    80006e2c:	00013903          	ld	s2,0(sp)
    80006e30:	02010113          	addi	sp,sp,32
    80006e34:	00008067          	ret

0000000080006e38 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80006e38:	fe010113          	addi	sp,sp,-32
    80006e3c:	00113c23          	sd	ra,24(sp)
    80006e40:	00813823          	sd	s0,16(sp)
    80006e44:	00913423          	sd	s1,8(sp)
    80006e48:	01213023          	sd	s2,0(sp)
    80006e4c:	02010413          	addi	s0,sp,32
    80006e50:	00050493          	mv	s1,a0
    80006e54:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80006e58:	01853503          	ld	a0,24(a0)
    80006e5c:	ffffa097          	auipc	ra,0xffffa
    80006e60:	6ac080e7          	jalr	1708(ra) # 80001508 <_Z8sem_waitP4KSem>

    sem_wait(mutexTail);
    80006e64:	0304b503          	ld	a0,48(s1)
    80006e68:	ffffa097          	auipc	ra,0xffffa
    80006e6c:	6a0080e7          	jalr	1696(ra) # 80001508 <_Z8sem_waitP4KSem>
    buffer[tail] = val;
    80006e70:	0084b783          	ld	a5,8(s1)
    80006e74:	0144a703          	lw	a4,20(s1)
    80006e78:	00271713          	slli	a4,a4,0x2
    80006e7c:	00e787b3          	add	a5,a5,a4
    80006e80:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006e84:	0144a783          	lw	a5,20(s1)
    80006e88:	0017879b          	addiw	a5,a5,1
    80006e8c:	0004a703          	lw	a4,0(s1)
    80006e90:	02e7e7bb          	remw	a5,a5,a4
    80006e94:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80006e98:	0304b503          	ld	a0,48(s1)
    80006e9c:	ffffa097          	auipc	ra,0xffffa
    80006ea0:	69c080e7          	jalr	1692(ra) # 80001538 <_Z10sem_signalP4KSem>

    sem_signal(itemAvailable);
    80006ea4:	0204b503          	ld	a0,32(s1)
    80006ea8:	ffffa097          	auipc	ra,0xffffa
    80006eac:	690080e7          	jalr	1680(ra) # 80001538 <_Z10sem_signalP4KSem>

}
    80006eb0:	01813083          	ld	ra,24(sp)
    80006eb4:	01013403          	ld	s0,16(sp)
    80006eb8:	00813483          	ld	s1,8(sp)
    80006ebc:	00013903          	ld	s2,0(sp)
    80006ec0:	02010113          	addi	sp,sp,32
    80006ec4:	00008067          	ret

0000000080006ec8 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80006ec8:	fe010113          	addi	sp,sp,-32
    80006ecc:	00113c23          	sd	ra,24(sp)
    80006ed0:	00813823          	sd	s0,16(sp)
    80006ed4:	00913423          	sd	s1,8(sp)
    80006ed8:	01213023          	sd	s2,0(sp)
    80006edc:	02010413          	addi	s0,sp,32
    80006ee0:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80006ee4:	02053503          	ld	a0,32(a0)
    80006ee8:	ffffa097          	auipc	ra,0xffffa
    80006eec:	620080e7          	jalr	1568(ra) # 80001508 <_Z8sem_waitP4KSem>

    sem_wait(mutexHead);
    80006ef0:	0284b503          	ld	a0,40(s1)
    80006ef4:	ffffa097          	auipc	ra,0xffffa
    80006ef8:	614080e7          	jalr	1556(ra) # 80001508 <_Z8sem_waitP4KSem>

    int ret = buffer[head];
    80006efc:	0084b703          	ld	a4,8(s1)
    80006f00:	0104a783          	lw	a5,16(s1)
    80006f04:	00279693          	slli	a3,a5,0x2
    80006f08:	00d70733          	add	a4,a4,a3
    80006f0c:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006f10:	0017879b          	addiw	a5,a5,1
    80006f14:	0004a703          	lw	a4,0(s1)
    80006f18:	02e7e7bb          	remw	a5,a5,a4
    80006f1c:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80006f20:	0284b503          	ld	a0,40(s1)
    80006f24:	ffffa097          	auipc	ra,0xffffa
    80006f28:	614080e7          	jalr	1556(ra) # 80001538 <_Z10sem_signalP4KSem>

    sem_signal(spaceAvailable);
    80006f2c:	0184b503          	ld	a0,24(s1)
    80006f30:	ffffa097          	auipc	ra,0xffffa
    80006f34:	608080e7          	jalr	1544(ra) # 80001538 <_Z10sem_signalP4KSem>

    return ret;
}
    80006f38:	00090513          	mv	a0,s2
    80006f3c:	01813083          	ld	ra,24(sp)
    80006f40:	01013403          	ld	s0,16(sp)
    80006f44:	00813483          	ld	s1,8(sp)
    80006f48:	00013903          	ld	s2,0(sp)
    80006f4c:	02010113          	addi	sp,sp,32
    80006f50:	00008067          	ret

0000000080006f54 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80006f54:	fe010113          	addi	sp,sp,-32
    80006f58:	00113c23          	sd	ra,24(sp)
    80006f5c:	00813823          	sd	s0,16(sp)
    80006f60:	00913423          	sd	s1,8(sp)
    80006f64:	01213023          	sd	s2,0(sp)
    80006f68:	02010413          	addi	s0,sp,32
    80006f6c:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80006f70:	02853503          	ld	a0,40(a0)
    80006f74:	ffffa097          	auipc	ra,0xffffa
    80006f78:	594080e7          	jalr	1428(ra) # 80001508 <_Z8sem_waitP4KSem>
    sem_wait(mutexTail);
    80006f7c:	0304b503          	ld	a0,48(s1)
    80006f80:	ffffa097          	auipc	ra,0xffffa
    80006f84:	588080e7          	jalr	1416(ra) # 80001508 <_Z8sem_waitP4KSem>

    if (tail >= head) {
    80006f88:	0144a783          	lw	a5,20(s1)
    80006f8c:	0104a903          	lw	s2,16(s1)
    80006f90:	0327ce63          	blt	a5,s2,80006fcc <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80006f94:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80006f98:	0304b503          	ld	a0,48(s1)
    80006f9c:	ffffa097          	auipc	ra,0xffffa
    80006fa0:	59c080e7          	jalr	1436(ra) # 80001538 <_Z10sem_signalP4KSem>
    sem_signal(mutexHead);
    80006fa4:	0284b503          	ld	a0,40(s1)
    80006fa8:	ffffa097          	auipc	ra,0xffffa
    80006fac:	590080e7          	jalr	1424(ra) # 80001538 <_Z10sem_signalP4KSem>

    return ret;
}
    80006fb0:	00090513          	mv	a0,s2
    80006fb4:	01813083          	ld	ra,24(sp)
    80006fb8:	01013403          	ld	s0,16(sp)
    80006fbc:	00813483          	ld	s1,8(sp)
    80006fc0:	00013903          	ld	s2,0(sp)
    80006fc4:	02010113          	addi	sp,sp,32
    80006fc8:	00008067          	ret
        ret = cap - head + tail;
    80006fcc:	0004a703          	lw	a4,0(s1)
    80006fd0:	4127093b          	subw	s2,a4,s2
    80006fd4:	00f9093b          	addw	s2,s2,a5
    80006fd8:	fc1ff06f          	j	80006f98 <_ZN6Buffer6getCntEv+0x44>

0000000080006fdc <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80006fdc:	fe010113          	addi	sp,sp,-32
    80006fe0:	00113c23          	sd	ra,24(sp)
    80006fe4:	00813823          	sd	s0,16(sp)
    80006fe8:	00913423          	sd	s1,8(sp)
    80006fec:	02010413          	addi	s0,sp,32
    80006ff0:	00050493          	mv	s1,a0
    putc('\n');
    80006ff4:	00a00513          	li	a0,10
    80006ff8:	ffffa097          	auipc	ra,0xffffa
    80006ffc:	598080e7          	jalr	1432(ra) # 80001590 <_Z4putcc>
    printString("Buffer deleted!\n");
    80007000:	00003517          	auipc	a0,0x3
    80007004:	42850513          	addi	a0,a0,1064 # 8000a428 <_ZZ9kPrintIntmE6digits+0x3b8>
    80007008:	fffff097          	auipc	ra,0xfffff
    8000700c:	e64080e7          	jalr	-412(ra) # 80005e6c <_Z11printStringPKc>
    while (getCnt() > 0) {
    80007010:	00048513          	mv	a0,s1
    80007014:	00000097          	auipc	ra,0x0
    80007018:	f40080e7          	jalr	-192(ra) # 80006f54 <_ZN6Buffer6getCntEv>
    8000701c:	02a05c63          	blez	a0,80007054 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80007020:	0084b783          	ld	a5,8(s1)
    80007024:	0104a703          	lw	a4,16(s1)
    80007028:	00271713          	slli	a4,a4,0x2
    8000702c:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80007030:	0007c503          	lbu	a0,0(a5)
    80007034:	ffffa097          	auipc	ra,0xffffa
    80007038:	55c080e7          	jalr	1372(ra) # 80001590 <_Z4putcc>
        head = (head + 1) % cap;
    8000703c:	0104a783          	lw	a5,16(s1)
    80007040:	0017879b          	addiw	a5,a5,1
    80007044:	0004a703          	lw	a4,0(s1)
    80007048:	02e7e7bb          	remw	a5,a5,a4
    8000704c:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80007050:	fc1ff06f          	j	80007010 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80007054:	02100513          	li	a0,33
    80007058:	ffffa097          	auipc	ra,0xffffa
    8000705c:	538080e7          	jalr	1336(ra) # 80001590 <_Z4putcc>
    putc('\n');
    80007060:	00a00513          	li	a0,10
    80007064:	ffffa097          	auipc	ra,0xffffa
    80007068:	52c080e7          	jalr	1324(ra) # 80001590 <_Z4putcc>
    mem_free(buffer);
    8000706c:	0084b503          	ld	a0,8(s1)
    80007070:	ffffa097          	auipc	ra,0xffffa
    80007074:	2e0080e7          	jalr	736(ra) # 80001350 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80007078:	0204b503          	ld	a0,32(s1)
    8000707c:	ffffa097          	auipc	ra,0xffffa
    80007080:	45c080e7          	jalr	1116(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(spaceAvailable);
    80007084:	0184b503          	ld	a0,24(s1)
    80007088:	ffffa097          	auipc	ra,0xffffa
    8000708c:	450080e7          	jalr	1104(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(mutexTail);
    80007090:	0304b503          	ld	a0,48(s1)
    80007094:	ffffa097          	auipc	ra,0xffffa
    80007098:	444080e7          	jalr	1092(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(mutexHead);
    8000709c:	0284b503          	ld	a0,40(s1)
    800070a0:	ffffa097          	auipc	ra,0xffffa
    800070a4:	438080e7          	jalr	1080(ra) # 800014d8 <_Z9sem_closeP4KSem>
}
    800070a8:	01813083          	ld	ra,24(sp)
    800070ac:	01013403          	ld	s0,16(sp)
    800070b0:	00813483          	ld	s1,8(sp)
    800070b4:	02010113          	addi	sp,sp,32
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
    80007268:	8ec48493          	addi	s1,s1,-1812 # 8000cb50 <started>
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
    80007388:	bc830067          	jr	-1080(t1) # 80001f4c <main>

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
    800075a8:	5b070713          	addi	a4,a4,1456 # 8000cb54 <ticks>
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
    80007614:	54470713          	addi	a4,a4,1348 # 8000cb54 <ticks>
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
    8000771c:	43c70713          	addi	a4,a4,1084 # 8000cb54 <ticks>
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
    80007d50:	e0f72623          	sw	a5,-500(a4) # 8000cb58 <panicked>
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
    8000847c:	6e07a783          	lw	a5,1760(a5) # 8000cb58 <panicked>
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
    800084a8:	6bc90913          	addi	s2,s2,1724 # 8000cb60 <uart_tx_r>
    800084ac:	00093783          	ld	a5,0(s2)
    800084b0:	00004497          	auipc	s1,0x4
    800084b4:	6b848493          	addi	s1,s1,1720 # 8000cb68 <uart_tx_w>
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
    80008580:	5dc72703          	lw	a4,1500(a4) # 8000cb58 <panicked>
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
    800085c4:	5a060613          	addi	a2,a2,1440 # 8000cb60 <uart_tx_r>
    800085c8:	00004517          	auipc	a0,0x4
    800085cc:	5a050513          	addi	a0,a0,1440 # 8000cb68 <uart_tx_w>
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
    800086a8:	4bc60613          	addi	a2,a2,1212 # 8000cb60 <uart_tx_r>
    800086ac:	00004517          	auipc	a0,0x4
    800086b0:	4bc50513          	addi	a0,a0,1212 # 8000cb68 <uart_tx_w>
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
    80008718:	44c60613          	addi	a2,a2,1100 # 8000cb60 <uart_tx_r>
    8000871c:	00004517          	auipc	a0,0x4
    80008720:	44c50513          	addi	a0,a0,1100 # 8000cb68 <uart_tx_w>
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
    800087dc:	39890913          	addi	s2,s2,920 # 8000cb70 <kmem>
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
    800088b4:	2c090913          	addi	s2,s2,704 # 8000cb70 <kmem>
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
    8000897c:	1f878793          	addi	a5,a5,504 # 8000cb70 <kmem>
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
    800089c8:	1ac78793          	addi	a5,a5,428 # 8000cb70 <kmem>
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
