
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
    8000001c:	7a9060ef          	jal	ra,80006fc4 <start>

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
    80001184:	5b5000ef          	jal	ra,80001f38 <interruptRoutine>

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
    80001738:	640080e7          	jalr	1600(ra) # 80005d74 <_Z11printStringPKc>
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
    8000175c:	61c080e7          	jalr	1564(ra) # 80005d74 <_Z11printStringPKc>
	printString("CONSOLE_STATUS = ");
    80001760:	00009517          	auipc	a0,0x9
    80001764:	8d050513          	addi	a0,a0,-1840 # 8000a030 <CONSOLE_STATUS+0x20>
    80001768:	00004097          	auipc	ra,0x4
    8000176c:	60c080e7          	jalr	1548(ra) # 80005d74 <_Z11printStringPKc>
	printInteger((uint64)sr);
    80001770:	0104b503          	ld	a0,16(s1)
    80001774:	00000097          	auipc	ra,0x0
    80001778:	224080e7          	jalr	548(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    8000177c:	00009517          	auipc	a0,0x9
    80001780:	e0450513          	addi	a0,a0,-508 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80001784:	00004097          	auipc	ra,0x4
    80001788:	5f0080e7          	jalr	1520(ra) # 80005d74 <_Z11printStringPKc>
	printString("*CONSOLE_RX = ");
    8000178c:	00009517          	auipc	a0,0x9
    80001790:	8bc50513          	addi	a0,a0,-1860 # 8000a048 <CONSOLE_STATUS+0x38>
    80001794:	00004097          	auipc	ra,0x4
    80001798:	5e0080e7          	jalr	1504(ra) # 80005d74 <_Z11printStringPKc>
	printInteger(*dr);
    8000179c:	0084b783          	ld	a5,8(s1)
    800017a0:	0007c503          	lbu	a0,0(a5)
    800017a4:	00000097          	auipc	ra,0x0
    800017a8:	1f4080e7          	jalr	500(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    800017ac:	00009517          	auipc	a0,0x9
    800017b0:	dd450513          	addi	a0,a0,-556 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800017b4:	00004097          	auipc	ra,0x4
    800017b8:	5c0080e7          	jalr	1472(ra) # 80005d74 <_Z11printStringPKc>
	printString("*CONSOLE_STATUS = ");
    800017bc:	00009517          	auipc	a0,0x9
    800017c0:	89c50513          	addi	a0,a0,-1892 # 8000a058 <CONSOLE_STATUS+0x48>
    800017c4:	00004097          	auipc	ra,0x4
    800017c8:	5b0080e7          	jalr	1456(ra) # 80005d74 <_Z11printStringPKc>
	printInteger(*sr);
    800017cc:	0104b783          	ld	a5,16(s1)
    800017d0:	0007c503          	lbu	a0,0(a5)
    800017d4:	00000097          	auipc	ra,0x0
    800017d8:	1c4080e7          	jalr	452(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    800017dc:	00009517          	auipc	a0,0x9
    800017e0:	da450513          	addi	a0,a0,-604 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800017e4:	00004097          	auipc	ra,0x4
    800017e8:	590080e7          	jalr	1424(ra) # 80005d74 <_Z11printStringPKc>
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

0000000080001c0c <_ZN7KMemory16initializeMemoryEv>:
uint64 KMemory::blocksForBitVector = 0;
uint64 KMemory::usableBlocks = 0;
uint64 KMemory::bitsInBitVector = 0;
bool* KMemory::bitVector = nullptr;

void KMemory::initializeMemory() {
    80001c0c:	ff010113          	addi	sp,sp,-16
    80001c10:	00813423          	sd	s0,8(sp)
    80001c14:	01010413          	addi	s0,sp,16
    if (initialized) return;
    80001c18:	0000b797          	auipc	a5,0xb
    80001c1c:	0407c783          	lbu	a5,64(a5) # 8000cc58 <_ZN7KMemory11initializedE>
    80001c20:	0a079663          	bnez	a5,80001ccc <_ZN7KMemory16initializeMemoryEv+0xc0>

    uint64 sizeInBytes = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR;
    80001c24:	0000b797          	auipc	a5,0xb
    80001c28:	ef47b783          	ld	a5,-268(a5) # 8000cb18 <_GLOBAL_OFFSET_TABLE_+0x60>
    80001c2c:	0007b783          	ld	a5,0(a5)
    80001c30:	0000b717          	auipc	a4,0xb
    80001c34:	eb073703          	ld	a4,-336(a4) # 8000cae0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001c38:	00073603          	ld	a2,0(a4)
    80001c3c:	40c787b3          	sub	a5,a5,a2
    numOfBlocks = sizeInBytes / MEM_BLOCK_SIZE;
    80001c40:	0067d693          	srli	a3,a5,0x6
    80001c44:	0000b717          	auipc	a4,0xb
    80001c48:	00d73e23          	sd	a3,28(a4) # 8000cc60 <_ZN7KMemory11numOfBlocksE>
    blocksForBitVector = numOfBlocks / (8 * MEM_BLOCK_SIZE) + (numOfBlocks % (8 * MEM_BLOCK_SIZE) ? 1 : 0);
    80001c4c:	00f7d793          	srli	a5,a5,0xf
    80001c50:	1ff6f713          	andi	a4,a3,511
    80001c54:	00070463          	beqz	a4,80001c5c <_ZN7KMemory16initializeMemoryEv+0x50>
    80001c58:	00100713          	li	a4,1
    80001c5c:	00e787b3          	add	a5,a5,a4
    80001c60:	0000b717          	auipc	a4,0xb
    80001c64:	ff870713          	addi	a4,a4,-8 # 8000cc58 <_ZN7KMemory11initializedE>
    80001c68:	00f73823          	sd	a5,16(a4)
    //usableBlocks = numOfBlocks - blocksForBitVector;
    bitsInBitVector = numOfBlocks * MEM_BLOCK_SIZE * 8;
    80001c6c:	00969693          	slli	a3,a3,0x9
    80001c70:	00d73c23          	sd	a3,24(a4)
    uint64 uint64InBitVector = bitsInBitVector / 64;
    80001c74:	0066d693          	srli	a3,a3,0x6
    bitVector = (bool*)HEAP_START_ADDR;
    80001c78:	02c73023          	sd	a2,32(a4)
    uint64* temp = (uint64*)HEAP_START_ADDR;
    for (uint64 i = 0; i < uint64InBitVector; i++) {
    80001c7c:	00000713          	li	a4,0
    80001c80:	0140006f          	j	80001c94 <_ZN7KMemory16initializeMemoryEv+0x88>
        if (i < blocksForBitVector * MEM_BLOCK_SIZE * 8 / 64) {
            temp[i] = 0xffffffffffffffff;
        } else {
            temp[i] = 0;
    80001c84:	00371793          	slli	a5,a4,0x3
    80001c88:	00f607b3          	add	a5,a2,a5
    80001c8c:	0007b023          	sd	zero,0(a5)
    for (uint64 i = 0; i < uint64InBitVector; i++) {
    80001c90:	00170713          	addi	a4,a4,1
    80001c94:	02d77663          	bgeu	a4,a3,80001cc0 <_ZN7KMemory16initializeMemoryEv+0xb4>
        if (i < blocksForBitVector * MEM_BLOCK_SIZE * 8 / 64) {
    80001c98:	0000b797          	auipc	a5,0xb
    80001c9c:	fd07b783          	ld	a5,-48(a5) # 8000cc68 <_ZN7KMemory18blocksForBitVectorE>
    80001ca0:	00979793          	slli	a5,a5,0x9
    80001ca4:	0067d793          	srli	a5,a5,0x6
    80001ca8:	fcf77ee3          	bgeu	a4,a5,80001c84 <_ZN7KMemory16initializeMemoryEv+0x78>
            temp[i] = 0xffffffffffffffff;
    80001cac:	00371793          	slli	a5,a4,0x3
    80001cb0:	00f607b3          	add	a5,a2,a5
    80001cb4:	fff00593          	li	a1,-1
    80001cb8:	00b7b023          	sd	a1,0(a5)
    80001cbc:	fd5ff06f          	j	80001c90 <_ZN7KMemory16initializeMemoryEv+0x84>
        }
    }
    initialized = true;
    80001cc0:	00100793          	li	a5,1
    80001cc4:	0000b717          	auipc	a4,0xb
    80001cc8:	f8f70a23          	sb	a5,-108(a4) # 8000cc58 <_ZN7KMemory11initializedE>
}
    80001ccc:	00813403          	ld	s0,8(sp)
    80001cd0:	01010113          	addi	sp,sp,16
    80001cd4:	00008067          	ret

0000000080001cd8 <_ZN7KMemory7kmallocEm>:

void* KMemory::kmalloc(size_t size) {
    80001cd8:	ff010113          	addi	sp,sp,-16
    80001cdc:	00813423          	sd	s0,8(sp)
    80001ce0:	01010413          	addi	s0,sp,16
    //size je broj blokova
    uint64 found = 0;
    for (uint64 i = blocksForBitVector * MEM_BLOCK_SIZE * 8; i < bitsInBitVector; i++) {
    80001ce4:	0000b797          	auipc	a5,0xb
    80001ce8:	f847b783          	ld	a5,-124(a5) # 8000cc68 <_ZN7KMemory18blocksForBitVectorE>
    80001cec:	00979793          	slli	a5,a5,0x9
    uint64 found = 0;
    80001cf0:	00000693          	li	a3,0
    80001cf4:	02c0006f          	j	80001d20 <_ZN7KMemory7kmallocEm+0x48>
        } else if (++found == size) {
            uint64 firstBlockIndex = i - found + 1;
            for (uint64 j = firstBlockIndex; j <= i; j++) {
                bitVector[j] = true;
            }
            void* ret = firstBlockIndex * MEM_BLOCK_SIZE + (char*)HEAP_START_ADDR;
    80001cf8:	0000b797          	auipc	a5,0xb
    80001cfc:	de87b783          	ld	a5,-536(a5) # 8000cae0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001d00:	0007b783          	ld	a5,0(a5)
    80001d04:	00669693          	slli	a3,a3,0x6
    80001d08:	00d786b3          	add	a3,a5,a3
            *(uint64*)ret = size;
    80001d0c:	00a6b023          	sd	a0,0(a3)
            return (char*)ret + sizeof(uint64);
    80001d10:	00868513          	addi	a0,a3,8
    80001d14:	0640006f          	j	80001d78 <_ZN7KMemory7kmallocEm+0xa0>
            found = 0;
    80001d18:	00000693          	li	a3,0
    for (uint64 i = blocksForBitVector * MEM_BLOCK_SIZE * 8; i < bitsInBitVector; i++) {
    80001d1c:	00178793          	addi	a5,a5,1
    80001d20:	0000b717          	auipc	a4,0xb
    80001d24:	f5073703          	ld	a4,-176(a4) # 8000cc70 <_ZN7KMemory15bitsInBitVectorE>
    80001d28:	04e7f663          	bgeu	a5,a4,80001d74 <_ZN7KMemory7kmallocEm+0x9c>
        if (bitVector[i]) {
    80001d2c:	0000b717          	auipc	a4,0xb
    80001d30:	f4c73703          	ld	a4,-180(a4) # 8000cc78 <_ZN7KMemory9bitVectorE>
    80001d34:	00f70733          	add	a4,a4,a5
    80001d38:	00074703          	lbu	a4,0(a4)
    80001d3c:	fc071ee3          	bnez	a4,80001d18 <_ZN7KMemory7kmallocEm+0x40>
        } else if (++found == size) {
    80001d40:	00168693          	addi	a3,a3,1
    80001d44:	fca69ce3          	bne	a3,a0,80001d1c <_ZN7KMemory7kmallocEm+0x44>
            uint64 firstBlockIndex = i - found + 1;
    80001d48:	40d786b3          	sub	a3,a5,a3
    80001d4c:	00168693          	addi	a3,a3,1
            for (uint64 j = firstBlockIndex; j <= i; j++) {
    80001d50:	00068713          	mv	a4,a3
    80001d54:	fae7e2e3          	bltu	a5,a4,80001cf8 <_ZN7KMemory7kmallocEm+0x20>
                bitVector[j] = true;
    80001d58:	0000b617          	auipc	a2,0xb
    80001d5c:	f2063603          	ld	a2,-224(a2) # 8000cc78 <_ZN7KMemory9bitVectorE>
    80001d60:	00e60633          	add	a2,a2,a4
    80001d64:	00100593          	li	a1,1
    80001d68:	00b60023          	sb	a1,0(a2)
            for (uint64 j = firstBlockIndex; j <= i; j++) {
    80001d6c:	00170713          	addi	a4,a4,1
    80001d70:	fe5ff06f          	j	80001d54 <_ZN7KMemory7kmallocEm+0x7c>
        }
    }
    return nullptr;
    80001d74:	00000513          	li	a0,0
}
    80001d78:	00813403          	ld	s0,8(sp)
    80001d7c:	01010113          	addi	sp,sp,16
    80001d80:	00008067          	ret

0000000080001d84 <_ZN7KMemory5kfreeEPv>:

void KMemory::kfree(void* ptr) {
    80001d84:	ff010113          	addi	sp,sp,-16
    80001d88:	00813423          	sd	s0,8(sp)
    80001d8c:	01010413          	addi	s0,sp,16
    ptr = (char*)ptr - sizeof(uint64);
    80001d90:	ff850693          	addi	a3,a0,-8
    uint64 blockToFree = *(uint64*)ptr;
    80001d94:	ff853603          	ld	a2,-8(a0)
    uint64 firstBlockIndex = ((char*)ptr - (char*)HEAP_START_ADDR) / MEM_BLOCK_SIZE;
    80001d98:	0000b797          	auipc	a5,0xb
    80001d9c:	d487b783          	ld	a5,-696(a5) # 8000cae0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001da0:	0007b783          	ld	a5,0(a5)
    80001da4:	40f686b3          	sub	a3,a3,a5
    80001da8:	0066d693          	srli	a3,a3,0x6
    for(uint64 i=firstBlockIndex;i<firstBlockIndex+blockToFree;i++){
    80001dac:	00068793          	mv	a5,a3
    80001db0:	00d60733          	add	a4,a2,a3
    80001db4:	00e7fe63          	bgeu	a5,a4,80001dd0 <_ZN7KMemory5kfreeEPv+0x4c>
        bitVector[i] = false;
    80001db8:	0000b717          	auipc	a4,0xb
    80001dbc:	ec073703          	ld	a4,-320(a4) # 8000cc78 <_ZN7KMemory9bitVectorE>
    80001dc0:	00f70733          	add	a4,a4,a5
    80001dc4:	00070023          	sb	zero,0(a4)
    for(uint64 i=firstBlockIndex;i<firstBlockIndex+blockToFree;i++){
    80001dc8:	00178793          	addi	a5,a5,1
    80001dcc:	fe5ff06f          	j	80001db0 <_ZN7KMemory5kfreeEPv+0x2c>
    }
}
    80001dd0:	00813403          	ld	s0,8(sp)
    80001dd4:	01010113          	addi	sp,sp,16
    80001dd8:	00008067          	ret

0000000080001ddc <_Z4idlePv>:

extern "C" void interruptHandler();

void userMain();

void idle(void*) {
    80001ddc:	ff010113          	addi	sp,sp,-16
    80001de0:	00113423          	sd	ra,8(sp)
    80001de4:	00813023          	sd	s0,0(sp)
    80001de8:	01010413          	addi	s0,sp,16
    while (1) { thread_dispatch(); }
    80001dec:	fffff097          	auipc	ra,0xfffff
    80001df0:	63c080e7          	jalr	1596(ra) # 80001428 <_Z15thread_dispatchv>
    80001df4:	ff9ff06f          	j	80001dec <_Z4idlePv+0x10>

0000000080001df8 <_Z22kernelConsumerFunctionPv>:
}

void kernelConsumerFunction(void*) {
    80001df8:	ff010113          	addi	sp,sp,-16
    80001dfc:	00113423          	sd	ra,8(sp)
    80001e00:	00813023          	sd	s0,0(sp)
    80001e04:	01010413          	addi	s0,sp,16
    80001e08:	0280006f          	j	80001e30 <_Z22kernelConsumerFunctionPv+0x38>
    while (1) {
        char c = KConsole::getFromOutput();
        while (!(*KConsole::sr & CONSOLE_TX_STATUS_BIT)) {}
        *KConsole::dr = c;
    80001e0c:	0000b797          	auipc	a5,0xb
    80001e10:	cf47b783          	ld	a5,-780(a5) # 8000cb00 <_GLOBAL_OFFSET_TABLE_+0x48>
    80001e14:	0007b783          	ld	a5,0(a5)
    80001e18:	00a78023          	sb	a0,0(a5)
        sem_signal(KConsole::outputBufferHasSpace);
    80001e1c:	0000b797          	auipc	a5,0xb
    80001e20:	cec7b783          	ld	a5,-788(a5) # 8000cb08 <_GLOBAL_OFFSET_TABLE_+0x50>
    80001e24:	0007b503          	ld	a0,0(a5)
    80001e28:	fffff097          	auipc	ra,0xfffff
    80001e2c:	710080e7          	jalr	1808(ra) # 80001538 <_Z10sem_signalP4KSem>
        char c = KConsole::getFromOutput();
    80001e30:	00000097          	auipc	ra,0x0
    80001e34:	9d0080e7          	jalr	-1584(ra) # 80001800 <_ZN8KConsole13getFromOutputEv>
        while (!(*KConsole::sr & CONSOLE_TX_STATUS_BIT)) {}
    80001e38:	0000b797          	auipc	a5,0xb
    80001e3c:	d007b783          	ld	a5,-768(a5) # 8000cb38 <_GLOBAL_OFFSET_TABLE_+0x80>
    80001e40:	0007b783          	ld	a5,0(a5)
    80001e44:	0007c783          	lbu	a5,0(a5)
    80001e48:	0207f793          	andi	a5,a5,32
    80001e4c:	fe0786e3          	beqz	a5,80001e38 <_Z22kernelConsumerFunctionPv+0x40>
    80001e50:	fbdff06f          	j	80001e0c <_Z22kernelConsumerFunctionPv+0x14>

0000000080001e54 <main>:
    }

}

int main() {
    80001e54:	fd010113          	addi	sp,sp,-48
    80001e58:	02113423          	sd	ra,40(sp)
    80001e5c:	02813023          	sd	s0,32(sp)
    80001e60:	03010413          	addi	s0,sp,48
    //postavi adresu prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80001e64:	0000b797          	auipc	a5,0xb
    80001e68:	cbc7b783          	ld	a5,-836(a5) # 8000cb20 <_GLOBAL_OFFSET_TABLE_+0x68>
    80001e6c:	10579073          	csrw	stvec,a5

    KMemory::initializeMemory();
    80001e70:	00000097          	auipc	ra,0x0
    80001e74:	d9c080e7          	jalr	-612(ra) # 80001c0c <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija alokatora memorije
    //MemoryAllocator::initMemoryAllocator();

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    80001e78:	fffff097          	auipc	ra,0xfffff
    80001e7c:	7e8080e7          	jalr	2024(ra) # 80001660 <_ZN8KConsole12initKConsoleEv>
    //pravljenje niti
    thread_t mainHandle;
    thread_t userHandle;
    thread_t idleHandle;
    thread_t consoleOutputHandle;
    thread_create(&mainHandle, nullptr, nullptr);
    80001e80:	00000613          	li	a2,0
    80001e84:	00000593          	li	a1,0
    80001e88:	fe840513          	addi	a0,s0,-24
    80001e8c:	fffff097          	auipc	ra,0xfffff
    80001e90:	4f4080e7          	jalr	1268(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::running = mainHandle;
    80001e94:	0000b797          	auipc	a5,0xb
    80001e98:	c7c7b783          	ld	a5,-900(a5) # 8000cb10 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001e9c:	fe843703          	ld	a4,-24(s0)
    80001ea0:	00e7b023          	sd	a4,0(a5)
    thread_create(&userHandle, (TCB::Body) userMain, nullptr);
    80001ea4:	00000613          	li	a2,0
    80001ea8:	0000b597          	auipc	a1,0xb
    80001eac:	c185b583          	ld	a1,-1000(a1) # 8000cac0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001eb0:	fe040513          	addi	a0,s0,-32
    80001eb4:	fffff097          	auipc	ra,0xfffff
    80001eb8:	4cc080e7          	jalr	1228(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&consoleOutputHandle, kernelConsumerFunction, nullptr);
    80001ebc:	00000613          	li	a2,0
    80001ec0:	00000597          	auipc	a1,0x0
    80001ec4:	f3858593          	addi	a1,a1,-200 # 80001df8 <_Z22kernelConsumerFunctionPv>
    80001ec8:	fd040513          	addi	a0,s0,-48
    80001ecc:	fffff097          	auipc	ra,0xfffff
    80001ed0:	4b4080e7          	jalr	1204(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&idleHandle, idle, nullptr);
    80001ed4:	00000613          	li	a2,0
    80001ed8:	00000597          	auipc	a1,0x0
    80001edc:	f0458593          	addi	a1,a1,-252 # 80001ddc <_Z4idlePv>
    80001ee0:	fd840513          	addi	a0,s0,-40
    80001ee4:	fffff097          	auipc	ra,0xfffff
    80001ee8:	49c080e7          	jalr	1180(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
inline void Riscv::w_sip(uint64 sip) {
	__asm__ volatile("csrw sip, %[sip]": :[sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80001eec:	00200793          	li	a5,2
    80001ef0:	1007a073          	csrs	sstatus,a5

    //omogucavanje prekida
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    //cekanje da se userMain zavrsi
    thread_join(userHandle);
    80001ef4:	fe043503          	ld	a0,-32(s0)
    80001ef8:	fffff097          	auipc	ra,0xfffff
    80001efc:	550080e7          	jalr	1360(ra) # 80001448 <_Z11thread_joinP3TCB>

    //printString("\nSad cu da izadjem\n");

    //flush output bafera za konzolu
    while (KConsole::outputHead != KConsole::outputTail) {}
    80001f00:	0000b797          	auipc	a5,0xb
    80001f04:	bf07b783          	ld	a5,-1040(a5) # 8000caf0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001f08:	0007a703          	lw	a4,0(a5)
    80001f0c:	0000b797          	auipc	a5,0xb
    80001f10:	c247b783          	ld	a5,-988(a5) # 8000cb30 <_GLOBAL_OFFSET_TABLE_+0x78>
    80001f14:	0007a783          	lw	a5,0(a5)
    80001f18:	fef714e3          	bne	a4,a5,80001f00 <main+0xac>
}

inline void Riscv::mc_sstatus(uint64 mask) {
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80001f1c:	00200793          	li	a5,2
    80001f20:	1007b073          	csrc	sstatus,a5
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    return 0;


    80001f24:	00000513          	li	a0,0
    80001f28:	02813083          	ld	ra,40(sp)
    80001f2c:	02013403          	ld	s0,32(sp)
    80001f30:	03010113          	addi	sp,sp,48
    80001f34:	00008067          	ret

0000000080001f38 <interruptRoutine>:
#include "../test/printing.hpp"

//void printInteger(int i);

#pragma GCC optimize("O0")
extern "C" void interruptRoutine() {
    80001f38:	f8010113          	addi	sp,sp,-128
    80001f3c:	06113c23          	sd	ra,120(sp)
    80001f40:	06813823          	sd	s0,112(sp)
    80001f44:	06913423          	sd	s1,104(sp)
    80001f48:	08010413          	addi	s0,sp,128
    //bitni sistemski registri
    uint64 scause, sepc, sstatus;
    __asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001f4c:	14202373          	csrr	t1,scause
    80001f50:	fc643c23          	sd	t1,-40(s0)
    __asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001f54:	14102373          	csrr	t1,sepc
    80001f58:	fc643823          	sd	t1,-48(s0)
    __asm__ volatile("csrr %[stat], sstatus":[stat] "=r"(sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001f5c:	10002373          	csrr	t1,sstatus
    80001f60:	fc643423          	sd	t1,-56(s0)

    //argumenti preneti sistemskom pozivu
    uint64 a0, a1, a2, a3, a4, a5, a6, a7;
    __asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001f64:	00050313          	mv	t1,a0
    80001f68:	fc643023          	sd	t1,-64(s0)
    __asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001f6c:	00058313          	mv	t1,a1
    80001f70:	fa643c23          	sd	t1,-72(s0)
    __asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001f74:	00060313          	mv	t1,a2
    80001f78:	fa643823          	sd	t1,-80(s0)
    __asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001f7c:	00068313          	mv	t1,a3
    80001f80:	fa643423          	sd	t1,-88(s0)
    __asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001f84:	00070313          	mv	t1,a4
    80001f88:	fa643023          	sd	t1,-96(s0)
    __asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001f8c:	00078313          	mv	t1,a5
    80001f90:	f8643c23          	sd	t1,-104(s0)
    __asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001f94:	00080313          	mv	t1,a6
    80001f98:	f8643823          	sd	t1,-112(s0)
    __asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001f9c:	00088313          	mv	t1,a7
    80001fa0:	f8643423          	sd	t1,-120(s0)

    if (scause == 0x9 || scause == 0x8) {
    80001fa4:	fd843703          	ld	a4,-40(s0)
    80001fa8:	00900793          	li	a5,9
    80001fac:	00f70863          	beq	a4,a5,80001fbc <interruptRoutine+0x84>
    80001fb0:	fd843703          	ld	a4,-40(s0)
    80001fb4:	00800793          	li	a5,8
    80001fb8:	34f71c63          	bne	a4,a5,80002310 <interruptRoutine+0x3d8>
        //prekid zbog poziva ecall
        switch (a0) {
    80001fbc:	fc043703          	ld	a4,-64(s0)
    80001fc0:	09100793          	li	a5,145
    80001fc4:	2cf70063          	beq	a4,a5,80002284 <interruptRoutine+0x34c>
    80001fc8:	fc043703          	ld	a4,-64(s0)
    80001fcc:	09100793          	li	a5,145
    80001fd0:	2ce7e263          	bltu	a5,a4,80002294 <interruptRoutine+0x35c>
    80001fd4:	fc043703          	ld	a4,-64(s0)
    80001fd8:	08100793          	li	a5,129
    80001fdc:	28f70a63          	beq	a4,a5,80002270 <interruptRoutine+0x338>
    80001fe0:	fc043703          	ld	a4,-64(s0)
    80001fe4:	08100793          	li	a5,129
    80001fe8:	2ae7e663          	bltu	a5,a4,80002294 <interruptRoutine+0x35c>
    80001fec:	fc043703          	ld	a4,-64(s0)
    80001ff0:	04200793          	li	a5,66
    80001ff4:	04e7e263          	bltu	a5,a4,80002038 <interruptRoutine+0x100>
    80001ff8:	fc043783          	ld	a5,-64(s0)
    80001ffc:	28078c63          	beqz	a5,80002294 <interruptRoutine+0x35c>
    80002000:	fc043703          	ld	a4,-64(s0)
    80002004:	04200793          	li	a5,66
    80002008:	28e7e663          	bltu	a5,a4,80002294 <interruptRoutine+0x35c>
    8000200c:	fc043783          	ld	a5,-64(s0)
    80002010:	00279713          	slli	a4,a5,0x2
    80002014:	00008797          	auipc	a5,0x8
    80002018:	0e078793          	addi	a5,a5,224 # 8000a0f4 <_ZZ9kPrintIntmE6digits+0x84>
    8000201c:	00f707b3          	add	a5,a4,a5
    80002020:	0007a783          	lw	a5,0(a5)
    80002024:	0007871b          	sext.w	a4,a5
    80002028:	00008797          	auipc	a5,0x8
    8000202c:	0cc78793          	addi	a5,a5,204 # 8000a0f4 <_ZZ9kPrintIntmE6digits+0x84>
    80002030:	00f707b3          	add	a5,a4,a5
    80002034:	00078067          	jr	a5
    80002038:	fc043703          	ld	a4,-64(s0)
    8000203c:	08000793          	li	a5,128
    80002040:	1ef70263          	beq	a4,a5,80002224 <interruptRoutine+0x2ec>
    80002044:	2500006f          	j	80002294 <interruptRoutine+0x35c>
            case 0x01:
                //mem_alloc
                //a1 = broj blokova koje treba alocirati
                //MemoryAllocator::kmalloc((size_t)a1 * MEM_BLOCK_SIZE);
                KMemory::kmalloc((size_t)a1);
    80002048:	fb843503          	ld	a0,-72(s0)
    8000204c:	00000097          	auipc	ra,0x0
    80002050:	c8c080e7          	jalr	-884(ra) # 80001cd8 <_ZN7KMemory7kmallocEm>
                __asm__ volatile("sd a0, 80(s0)");
    80002054:	04a43823          	sd	a0,80(s0)
                break;
    80002058:	2980006f          	j	800022f0 <interruptRoutine+0x3b8>
            case 0x02:
                //mem_free
                //a1 = pokazivac na memoriju koju dealociramo, dobijen sa mem_alloc
                //MemoryAllocator::kfree((void*)a1);
                KMemory::kfree((void*)a1);
    8000205c:	fb843783          	ld	a5,-72(s0)
    80002060:	00078513          	mv	a0,a5
    80002064:	00000097          	auipc	ra,0x0
    80002068:	d20080e7          	jalr	-736(ra) # 80001d84 <_ZN7KMemory5kfreeEPv>
                __asm__ volatile("sd a0, 80(s0)");
    8000206c:	04a43823          	sd	a0,80(s0)
                break;
    80002070:	2800006f          	j	800022f0 <interruptRoutine+0x3b8>
                //thread_create
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    80002074:	fb043783          	ld	a5,-80(s0)
    80002078:	fa843703          	ld	a4,-88(s0)
    8000207c:	fa043683          	ld	a3,-96(s0)
    80002080:	fb843483          	ld	s1,-72(s0)
    80002084:	00068613          	mv	a2,a3
    80002088:	00070593          	mv	a1,a4
    8000208c:	00078513          	mv	a0,a5
    80002090:	00001097          	auipc	ra,0x1
    80002094:	c34080e7          	jalr	-972(ra) # 80002cc4 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80002098:	00050793          	mv	a5,a0
    8000209c:	00f4b023          	sd	a5,0(s1)
                TCB::start(*((thread_t*)a1));
    800020a0:	fb843783          	ld	a5,-72(s0)
    800020a4:	0007b783          	ld	a5,0(a5)
    800020a8:	00078513          	mv	a0,a5
    800020ac:	00001097          	auipc	ra,0x1
    800020b0:	d98080e7          	jalr	-616(ra) # 80002e44 <_ZN3TCB5startEPS_>
                if (*((thread_t*)a1) != nullptr) {
    800020b4:	fb843783          	ld	a5,-72(s0)
    800020b8:	0007b783          	ld	a5,0(a5)
    800020bc:	00078663          	beqz	a5,800020c8 <interruptRoutine+0x190>
                    __asm__ volatile("li a0, 0");
    800020c0:	00000513          	li	a0,0
    800020c4:	0080006f          	j	800020cc <interruptRoutine+0x194>
                } else {
                    __asm__ volatile("li a0, -1");
    800020c8:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    800020cc:	04a43823          	sd	a0,80(s0)
                break;
    800020d0:	2200006f          	j	800022f0 <interruptRoutine+0x3b8>
            case 0x12:
                //thread_exit
                //TCB::running->setFinished(true);
                TCB::running->setStatus(TCB::FINISHED);
    800020d4:	0000b797          	auipc	a5,0xb
    800020d8:	a3c7b783          	ld	a5,-1476(a5) # 8000cb10 <_GLOBAL_OFFSET_TABLE_+0x58>
    800020dc:	0007b783          	ld	a5,0(a5)
    800020e0:	00500593          	li	a1,5
    800020e4:	00078513          	mv	a0,a5
    800020e8:	00000097          	auipc	ra,0x0
    800020ec:	3e8080e7          	jalr	1000(ra) # 800024d0 <_ZN3TCB9setStatusENS_12ThreadStatusE>
                TCB::releaseJoined();
    800020f0:	00001097          	auipc	ra,0x1
    800020f4:	cf4080e7          	jalr	-780(ra) # 80002de4 <_ZN3TCB13releaseJoinedEv>
                TCB::yield();
    800020f8:	00001097          	auipc	ra,0x1
    800020fc:	b6c080e7          	jalr	-1172(ra) # 80002c64 <_ZN3TCB5yieldEv>
                break;
    80002100:	1f00006f          	j	800022f0 <interruptRoutine+0x3b8>
            case 0x13:
                //thread_dispatch
                TCB::yield();
    80002104:	00001097          	auipc	ra,0x1
    80002108:	b60080e7          	jalr	-1184(ra) # 80002c64 <_ZN3TCB5yieldEv>
                break;
    8000210c:	1e40006f          	j	800022f0 <interruptRoutine+0x3b8>
            case 0x14:
                //thread_join
                //a1 = rucka niti na koju tekuca nit treba da ceka
                TCB::threadJoin((thread_t)a1);
    80002110:	fb843783          	ld	a5,-72(s0)
    80002114:	00078513          	mv	a0,a5
    80002118:	00001097          	auipc	ra,0x1
    8000211c:	c80080e7          	jalr	-896(ra) # 80002d98 <_ZN3TCB10threadJoinEPS_>
                TCB::yield();
    80002120:	00001097          	auipc	ra,0x1
    80002124:	b44080e7          	jalr	-1212(ra) # 80002c64 <_ZN3TCB5yieldEv>
                break;
    80002128:	1c80006f          	j	800022f0 <interruptRoutine+0x3b8>
            case 0x21:
                //sem_open
                //a1 = pokazivac na rucku semafora, u koju se upisuje adresa semafora u memoriji
                *((sem_t*)a1) = KSem::initSem((uint)a2);
    8000212c:	fb043783          	ld	a5,-80(s0)
    80002130:	0007879b          	sext.w	a5,a5
    80002134:	fb843483          	ld	s1,-72(s0)
    80002138:	00078513          	mv	a0,a5
    8000213c:	00001097          	auipc	ra,0x1
    80002140:	360080e7          	jalr	864(ra) # 8000349c <_ZN4KSem7initSemEj>
    80002144:	00050793          	mv	a5,a0
    80002148:	00f4b023          	sd	a5,0(s1)
                if (*((sem_t*)a1) != nullptr) {
    8000214c:	fb843783          	ld	a5,-72(s0)
    80002150:	0007b783          	ld	a5,0(a5)
    80002154:	00078663          	beqz	a5,80002160 <interruptRoutine+0x228>
                    __asm__ volatile("li a0, 0");
    80002158:	00000513          	li	a0,0
    8000215c:	0080006f          	j	80002164 <interruptRoutine+0x22c>
                } else {
                    __asm__ volatile("li a0, -1");
    80002160:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80002164:	04a43823          	sd	a0,80(s0)
                break;
    80002168:	1880006f          	j	800022f0 <interruptRoutine+0x3b8>
            case 0x22:
                //sem_close
                //a1 = rucka semafora
                KSem::closeSem((sem_t)a1);
    8000216c:	fb843783          	ld	a5,-72(s0)
    80002170:	00078513          	mv	a0,a5
    80002174:	00001097          	auipc	ra,0x1
    80002178:	4a4080e7          	jalr	1188(ra) # 80003618 <_ZN4KSem8closeSemEPS_>
                __asm__ volatile("sd a0, 80(s0)");
    8000217c:	04a43823          	sd	a0,80(s0)
                break;
    80002180:	1700006f          	j	800022f0 <interruptRoutine+0x3b8>
            case 0x23:
                //sem_wait
                //a1 = rucka semafora
                ((sem_t)a1)->wait();
    80002184:	fb843783          	ld	a5,-72(s0)
    80002188:	00078513          	mv	a0,a5
    8000218c:	00001097          	auipc	ra,0x1
    80002190:	3a4080e7          	jalr	932(ra) # 80003530 <_ZN4KSem4waitEv>
                __asm__ volatile("sd a0, 80(s0)");
    80002194:	04a43823          	sd	a0,80(s0)
                break;
    80002198:	1580006f          	j	800022f0 <interruptRoutine+0x3b8>
            case 0x24:
                //sem_signal
                //a1 = rucka semafora
                ((sem_t)a1)->signal();
    8000219c:	fb843783          	ld	a5,-72(s0)
    800021a0:	00078513          	mv	a0,a5
    800021a4:	00001097          	auipc	ra,0x1
    800021a8:	420080e7          	jalr	1056(ra) # 800035c4 <_ZN4KSem6signalEv>
                __asm__ volatile("sd a0, 80(s0)");
    800021ac:	04a43823          	sd	a0,80(s0)
                break;
    800021b0:	1400006f          	j	800022f0 <interruptRoutine+0x3b8>
            case 0x31:
                //time_sleep
                //a1 = broj perioda tajmera na koji se uspavljuje tekuca nit
                if ((time_t)a1 > 0) {
    800021b4:	fb843783          	ld	a5,-72(s0)
    800021b8:	00078663          	beqz	a5,800021c4 <interruptRoutine+0x28c>
                    __asm__ volatile("li a0, 0");
    800021bc:	00000513          	li	a0,0
    800021c0:	0080006f          	j	800021c8 <interruptRoutine+0x290>
                } else {
                    __asm__ volatile("li a0, -1");
    800021c4:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    800021c8:	04a43823          	sd	a0,80(s0)
                if ((time_t)a1 > 0) {
    800021cc:	fb843783          	ld	a5,-72(s0)
    800021d0:	10078e63          	beqz	a5,800022ec <interruptRoutine+0x3b4>
                    Scheduler::putToSleep(TCB::running, (time_t)a1);
    800021d4:	0000b797          	auipc	a5,0xb
    800021d8:	93c7b783          	ld	a5,-1732(a5) # 8000cb10 <_GLOBAL_OFFSET_TABLE_+0x58>
    800021dc:	0007b783          	ld	a5,0(a5)
    800021e0:	fb843583          	ld	a1,-72(s0)
    800021e4:	00078513          	mv	a0,a5
    800021e8:	00000097          	auipc	ra,0x0
    800021ec:	8ec080e7          	jalr	-1812(ra) # 80001ad4 <_ZN9Scheduler10putToSleepEP3TCBm>
                    TCB::yield();
    800021f0:	00001097          	auipc	ra,0x1
    800021f4:	a74080e7          	jalr	-1420(ra) # 80002c64 <_ZN3TCB5yieldEv>
                }
                break;
    800021f8:	0f40006f          	j	800022ec <interruptRoutine+0x3b4>
            case 0x41:
                //getc
                KConsole::kgetc();
    800021fc:	fffff097          	auipc	ra,0xfffff
    80002200:	738080e7          	jalr	1848(ra) # 80001934 <_ZN8KConsole5kgetcEv>
                __asm__ volatile("sd a0, 80(s0)");
    80002204:	04a43823          	sd	a0,80(s0)
                break;
    80002208:	0e80006f          	j	800022f0 <interruptRoutine+0x3b8>
            case 0x42:
                //putc
                //a1 = karakter koji se upisuje u bafer za ispis na konzolu
                KConsole::kputc((char)a1);
    8000220c:	fb843783          	ld	a5,-72(s0)
    80002210:	0ff7f793          	andi	a5,a5,255
    80002214:	00078513          	mv	a0,a5
    80002218:	fffff097          	auipc	ra,0xfffff
    8000221c:	6ac080e7          	jalr	1708(ra) # 800018c4 <_ZN8KConsole5kputcEc>
                break;
    80002220:	0d00006f          	j	800022f0 <interruptRoutine+0x3b8>
                //alloc thread
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    80002224:	fb043783          	ld	a5,-80(s0)
    80002228:	fa843703          	ld	a4,-88(s0)
    8000222c:	fa043683          	ld	a3,-96(s0)
    80002230:	fb843483          	ld	s1,-72(s0)
    80002234:	00068613          	mv	a2,a3
    80002238:	00070593          	mv	a1,a4
    8000223c:	00078513          	mv	a0,a5
    80002240:	00001097          	auipc	ra,0x1
    80002244:	a84080e7          	jalr	-1404(ra) # 80002cc4 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80002248:	00050793          	mv	a5,a0
    8000224c:	00f4b023          	sd	a5,0(s1)
                if (*((thread_t*)a1) != nullptr) {
    80002250:	fb843783          	ld	a5,-72(s0)
    80002254:	0007b783          	ld	a5,0(a5)
    80002258:	00078663          	beqz	a5,80002264 <interruptRoutine+0x32c>
                    __asm__ volatile("li a0, 0");
    8000225c:	00000513          	li	a0,0
    80002260:	0080006f          	j	80002268 <interruptRoutine+0x330>
                } else {
                    __asm__ volatile("li a0, -1");
    80002264:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80002268:	04a43823          	sd	a0,80(s0)
                break;
    8000226c:	0840006f          	j	800022f0 <interruptRoutine+0x3b8>
            case 0x81:
                //start thread
                //a1 = rucka niti koja se stavlja u scheduler
                Scheduler::put((thread_t)a1);
    80002270:	fb843783          	ld	a5,-72(s0)
    80002274:	00078513          	mv	a0,a5
    80002278:	fffff097          	auipc	ra,0xfffff
    8000227c:	7d8080e7          	jalr	2008(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
                break;
    80002280:	0700006f          	j	800022f0 <interruptRoutine+0x3b8>
            case 0x91:
                //printInteger
                //a1 = integer za ispis
                kPrintInt(a1);
    80002284:	fb843503          	ld	a0,-72(s0)
    80002288:	fffff097          	auipc	ra,0xfffff
    8000228c:	738080e7          	jalr	1848(ra) # 800019c0 <_Z9kPrintIntm>
                break;
    80002290:	0600006f          	j	800022f0 <interruptRoutine+0x3b8>
            default:
                printString("\nNepostojeci op code: ");
    80002294:	00008517          	auipc	a0,0x8
    80002298:	dec50513          	addi	a0,a0,-532 # 8000a080 <_ZZ9kPrintIntmE6digits+0x10>
    8000229c:	00004097          	auipc	ra,0x4
    800022a0:	ad8080e7          	jalr	-1320(ra) # 80005d74 <_Z11printStringPKc>
                kPrintInt(a0);
    800022a4:	fc043503          	ld	a0,-64(s0)
    800022a8:	fffff097          	auipc	ra,0xfffff
    800022ac:	718080e7          	jalr	1816(ra) # 800019c0 <_Z9kPrintIntm>
                printString("\nscause: ");
    800022b0:	00008517          	auipc	a0,0x8
    800022b4:	de850513          	addi	a0,a0,-536 # 8000a098 <_ZZ9kPrintIntmE6digits+0x28>
    800022b8:	00004097          	auipc	ra,0x4
    800022bc:	abc080e7          	jalr	-1348(ra) # 80005d74 <_Z11printStringPKc>
                kPrintInt(scause);
    800022c0:	fd843503          	ld	a0,-40(s0)
    800022c4:	fffff097          	auipc	ra,0xfffff
    800022c8:	6fc080e7          	jalr	1788(ra) # 800019c0 <_Z9kPrintIntm>
                printString("\nsepc: ");
    800022cc:	00008517          	auipc	a0,0x8
    800022d0:	ddc50513          	addi	a0,a0,-548 # 8000a0a8 <_ZZ9kPrintIntmE6digits+0x38>
    800022d4:	00004097          	auipc	ra,0x4
    800022d8:	aa0080e7          	jalr	-1376(ra) # 80005d74 <_Z11printStringPKc>
                kPrintInt(sepc);
    800022dc:	fd043503          	ld	a0,-48(s0)
    800022e0:	fffff097          	auipc	ra,0xfffff
    800022e4:	6e0080e7          	jalr	1760(ra) # 800019c0 <_Z9kPrintIntm>
                break;
    800022e8:	0080006f          	j	800022f0 <interruptRoutine+0x3b8>
                break;
    800022ec:	00000013          	nop
        }
        //sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
        sepc += 4;
    800022f0:	fd043783          	ld	a5,-48(s0)
    800022f4:	00478793          	addi	a5,a5,4
    800022f8:	fcf43823          	sd	a5,-48(s0)
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    800022fc:	fd043783          	ld	a5,-48(s0)
    80002300:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002304:	fc843783          	ld	a5,-56(s0)
    80002308:	10079073          	csrw	sstatus,a5
        printString("scause: ");
        kPrintInt(scause);
        printString("\nsepc: ");
        kPrintInt(sepc);
    }
}
    8000230c:	1900006f          	j	8000249c <interruptRoutine+0x564>
    } else if (scause == 0x8000000000000009) {
    80002310:	fd843703          	ld	a4,-40(s0)
    80002314:	fff00793          	li	a5,-1
    80002318:	03f79793          	slli	a5,a5,0x3f
    8000231c:	00978793          	addi	a5,a5,9
    80002320:	08f71e63          	bne	a4,a5,800023bc <interruptRoutine+0x484>
        uint64 irq = plic_claim();
    80002324:	00005097          	auipc	ra,0x5
    80002328:	500080e7          	jalr	1280(ra) # 80007824 <plic_claim>
    8000232c:	00050793          	mv	a5,a0
    80002330:	f8f43023          	sd	a5,-128(s0)
        if (irq == CONSOLE_IRQ) {
    80002334:	f8043703          	ld	a4,-128(s0)
    80002338:	00a00793          	li	a5,10
    8000233c:	02f71e63          	bne	a4,a5,80002378 <interruptRoutine+0x440>
            if (*KConsole::sr & CONSOLE_RX_STATUS_BIT) {
    80002340:	0000a797          	auipc	a5,0xa
    80002344:	7f87b783          	ld	a5,2040(a5) # 8000cb38 <_GLOBAL_OFFSET_TABLE_+0x80>
    80002348:	0007b783          	ld	a5,0(a5)
    8000234c:	0007c783          	lbu	a5,0(a5)
    80002350:	0017f793          	andi	a5,a5,1
    80002354:	02078a63          	beqz	a5,80002388 <interruptRoutine+0x450>
                KConsole::placeInInput(*KConsole::dr);
    80002358:	0000a797          	auipc	a5,0xa
    8000235c:	7a87b783          	ld	a5,1960(a5) # 8000cb00 <_GLOBAL_OFFSET_TABLE_+0x48>
    80002360:	0007b783          	ld	a5,0(a5)
    80002364:	0007c783          	lbu	a5,0(a5)
    80002368:	00078513          	mv	a0,a5
    8000236c:	fffff097          	auipc	ra,0xfffff
    80002370:	4ec080e7          	jalr	1260(ra) # 80001858 <_ZN8KConsole12placeInInputEc>
    80002374:	0140006f          	j	80002388 <interruptRoutine+0x450>
            printString("Neki drugi prekid\n");
    80002378:	00008517          	auipc	a0,0x8
    8000237c:	d3850513          	addi	a0,a0,-712 # 8000a0b0 <_ZZ9kPrintIntmE6digits+0x40>
    80002380:	00004097          	auipc	ra,0x4
    80002384:	9f4080e7          	jalr	-1548(ra) # 80005d74 <_Z11printStringPKc>
        plic_complete(irq);
    80002388:	f8043783          	ld	a5,-128(s0)
    8000238c:	0007879b          	sext.w	a5,a5
    80002390:	00078513          	mv	a0,a5
    80002394:	00005097          	auipc	ra,0x5
    80002398:	4c8080e7          	jalr	1224(ra) # 8000785c <plic_complete>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    8000239c:	fd043783          	ld	a5,-48(s0)
    800023a0:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    800023a4:	fc843783          	ld	a5,-56(s0)
    800023a8:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SEIP);
    800023ac:	20000513          	li	a0,512
    800023b0:	00000097          	auipc	ra,0x0
    800023b4:	104080e7          	jalr	260(ra) # 800024b4 <_ZN5Riscv6mc_sipEm>
}
    800023b8:	0e40006f          	j	8000249c <interruptRoutine+0x564>
    } else if (scause == 0x8000000000000001) {
    800023bc:	fd843703          	ld	a4,-40(s0)
    800023c0:	fff00793          	li	a5,-1
    800023c4:	03f79793          	slli	a5,a5,0x3f
    800023c8:	00178793          	addi	a5,a5,1
    800023cc:	08f71463          	bne	a4,a5,80002454 <interruptRoutine+0x51c>
        Scheduler::wake();
    800023d0:	fffff097          	auipc	ra,0xfffff
    800023d4:	7b4080e7          	jalr	1972(ra) # 80001b84 <_ZN9Scheduler4wakeEv>
        TCB::runningTimeSlice++;
    800023d8:	0000a797          	auipc	a5,0xa
    800023dc:	6f87b783          	ld	a5,1784(a5) # 8000cad0 <_GLOBAL_OFFSET_TABLE_+0x18>
    800023e0:	0007b783          	ld	a5,0(a5)
    800023e4:	00178713          	addi	a4,a5,1
    800023e8:	0000a797          	auipc	a5,0xa
    800023ec:	6e87b783          	ld	a5,1768(a5) # 8000cad0 <_GLOBAL_OFFSET_TABLE_+0x18>
    800023f0:	00e7b023          	sd	a4,0(a5)
        if (TCB::runningTimeSlice >= TCB::running->getTimeSlice()) {
    800023f4:	0000a797          	auipc	a5,0xa
    800023f8:	71c7b783          	ld	a5,1820(a5) # 8000cb10 <_GLOBAL_OFFSET_TABLE_+0x58>
    800023fc:	0007b783          	ld	a5,0(a5)
    80002400:	00078513          	mv	a0,a5
    80002404:	00000097          	auipc	ra,0x0
    80002408:	0e8080e7          	jalr	232(ra) # 800024ec <_ZN3TCB12getTimeSliceEv>
    8000240c:	00050713          	mv	a4,a0
    80002410:	0000a797          	auipc	a5,0xa
    80002414:	6c07b783          	ld	a5,1728(a5) # 8000cad0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002418:	0007b783          	ld	a5,0(a5)
    8000241c:	00e7b7b3          	sltu	a5,a5,a4
    80002420:	0017c793          	xori	a5,a5,1
    80002424:	0ff7f793          	andi	a5,a5,255
    80002428:	00078663          	beqz	a5,80002434 <interruptRoutine+0x4fc>
            TCB::yield();
    8000242c:	00001097          	auipc	ra,0x1
    80002430:	838080e7          	jalr	-1992(ra) # 80002c64 <_ZN3TCB5yieldEv>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002434:	fd043783          	ld	a5,-48(s0)
    80002438:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    8000243c:	fc843783          	ld	a5,-56(s0)
    80002440:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SSIP);
    80002444:	00200513          	li	a0,2
    80002448:	00000097          	auipc	ra,0x0
    8000244c:	06c080e7          	jalr	108(ra) # 800024b4 <_ZN5Riscv6mc_sipEm>
}
    80002450:	04c0006f          	j	8000249c <interruptRoutine+0x564>
        printString("\nGreska u prekidnoj rutini\n");
    80002454:	00008517          	auipc	a0,0x8
    80002458:	c7450513          	addi	a0,a0,-908 # 8000a0c8 <_ZZ9kPrintIntmE6digits+0x58>
    8000245c:	00004097          	auipc	ra,0x4
    80002460:	918080e7          	jalr	-1768(ra) # 80005d74 <_Z11printStringPKc>
        printString("scause: ");
    80002464:	00008517          	auipc	a0,0x8
    80002468:	c8450513          	addi	a0,a0,-892 # 8000a0e8 <_ZZ9kPrintIntmE6digits+0x78>
    8000246c:	00004097          	auipc	ra,0x4
    80002470:	908080e7          	jalr	-1784(ra) # 80005d74 <_Z11printStringPKc>
        kPrintInt(scause);
    80002474:	fd843503          	ld	a0,-40(s0)
    80002478:	fffff097          	auipc	ra,0xfffff
    8000247c:	548080e7          	jalr	1352(ra) # 800019c0 <_Z9kPrintIntm>
        printString("\nsepc: ");
    80002480:	00008517          	auipc	a0,0x8
    80002484:	c2850513          	addi	a0,a0,-984 # 8000a0a8 <_ZZ9kPrintIntmE6digits+0x38>
    80002488:	00004097          	auipc	ra,0x4
    8000248c:	8ec080e7          	jalr	-1812(ra) # 80005d74 <_Z11printStringPKc>
        kPrintInt(sepc);
    80002490:	fd043503          	ld	a0,-48(s0)
    80002494:	fffff097          	auipc	ra,0xfffff
    80002498:	52c080e7          	jalr	1324(ra) # 800019c0 <_Z9kPrintIntm>
}
    8000249c:	00000013          	nop
    800024a0:	07813083          	ld	ra,120(sp)
    800024a4:	07013403          	ld	s0,112(sp)
    800024a8:	06813483          	ld	s1,104(sp)
    800024ac:	08010113          	addi	sp,sp,128
    800024b0:	00008067          	ret

00000000800024b4 <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    800024b4:	ff010113          	addi	sp,sp,-16
    800024b8:	00813423          	sd	s0,8(sp)
    800024bc:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    800024c0:	14453073          	csrc	sip,a0
}
    800024c4:	00813403          	ld	s0,8(sp)
    800024c8:	01010113          	addi	sp,sp,16
    800024cc:	00008067          	ret

00000000800024d0 <_ZN3TCB9setStatusENS_12ThreadStatusE>:

    enum ThreadStatus {
        CREATED, ACTIVE, BLOCKED, JOINING, SLEEPING, FINISHED
    };

    void setStatus(ThreadStatus stat) { this->status = stat; }
    800024d0:	ff010113          	addi	sp,sp,-16
    800024d4:	00813423          	sd	s0,8(sp)
    800024d8:	01010413          	addi	s0,sp,16
    800024dc:	04b52c23          	sw	a1,88(a0)
    800024e0:	00813403          	ld	s0,8(sp)
    800024e4:	01010113          	addi	sp,sp,16
    800024e8:	00008067          	ret

00000000800024ec <_ZN3TCB12getTimeSliceEv>:
//
//    bool isBlocked() { return blocked; }
//
//    void setBlocked(bool block) { this->blocked = block; }

    uint64 getTimeSlice() { return timeSlice; }
    800024ec:	ff010113          	addi	sp,sp,-16
    800024f0:	00813423          	sd	s0,8(sp)
    800024f4:	01010413          	addi	s0,sp,16
    800024f8:	02853503          	ld	a0,40(a0)
    800024fc:	00813403          	ld	s0,8(sp)
    80002500:	01010113          	addi	sp,sp,16
    80002504:	00008067          	ret

0000000080002508 <_ZN6Thread7wrapperEPv>:

	__asm__ volatile("ecall");
}

void Thread::wrapper(void* thread) {
	if (thread != nullptr) {
    80002508:	02050863          	beqz	a0,80002538 <_ZN6Thread7wrapperEPv+0x30>
void Thread::wrapper(void* thread) {
    8000250c:	ff010113          	addi	sp,sp,-16
    80002510:	00113423          	sd	ra,8(sp)
    80002514:	00813023          	sd	s0,0(sp)
    80002518:	01010413          	addi	s0,sp,16
		((Thread*)thread)->run();
    8000251c:	00053783          	ld	a5,0(a0)
    80002520:	0107b783          	ld	a5,16(a5)
    80002524:	000780e7          	jalr	a5
	}
}
    80002528:	00813083          	ld	ra,8(sp)
    8000252c:	00013403          	ld	s0,0(sp)
    80002530:	01010113          	addi	sp,sp,16
    80002534:	00008067          	ret
    80002538:	00008067          	ret

000000008000253c <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    8000253c:	fe010113          	addi	sp,sp,-32
    80002540:	00113c23          	sd	ra,24(sp)
    80002544:	00813823          	sd	s0,16(sp)
    80002548:	00913423          	sd	s1,8(sp)
    8000254c:	02010413          	addi	s0,sp,32
    80002550:	00050493          	mv	s1,a0
    80002554:	0000a797          	auipc	a5,0xa
    80002558:	37c78793          	addi	a5,a5,892 # 8000c8d0 <_ZTV6Thread+0x10>
    8000255c:	00f53023          	sd	a5,0(a0)
	thread_join(this->myHandle);
    80002560:	00853503          	ld	a0,8(a0)
    80002564:	fffff097          	auipc	ra,0xfffff
    80002568:	ee4080e7          	jalr	-284(ra) # 80001448 <_Z11thread_joinP3TCB>
	delete myHandle;
    8000256c:	0084b483          	ld	s1,8(s1)
    80002570:	02048863          	beqz	s1,800025a0 <_ZN6ThreadD1Ev+0x64>
            delete node;
        }
    }

    bool isEmpty() const {
        bool ret = front == nullptr;
    80002574:	0484b503          	ld	a0,72(s1)
        while (!isEmpty()) {
    80002578:	00050e63          	beqz	a0,80002594 <_ZN6ThreadD1Ev+0x58>
            front = front->next;
    8000257c:	00853783          	ld	a5,8(a0)
    80002580:	04f4b423          	sd	a5,72(s1)
            delete node;
    80002584:	fe0508e3          	beqz	a0,80002574 <_ZN6ThreadD1Ev+0x38>
            mem_free(ptr);
    80002588:	fffff097          	auipc	ra,0xfffff
    8000258c:	dc8080e7          	jalr	-568(ra) # 80001350 <_Z8mem_freePv>
        }
    80002590:	fe5ff06f          	j	80002574 <_ZN6ThreadD1Ev+0x38>
    80002594:	00048513          	mv	a0,s1
    80002598:	00000097          	auipc	ra,0x0
    8000259c:	7d8080e7          	jalr	2008(ra) # 80002d70 <_ZN3TCBdlEPv>
}
    800025a0:	01813083          	ld	ra,24(sp)
    800025a4:	01013403          	ld	s0,16(sp)
    800025a8:	00813483          	ld	s1,8(sp)
    800025ac:	02010113          	addi	sp,sp,32
    800025b0:	00008067          	ret

00000000800025b4 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
	sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    800025b4:	fe010113          	addi	sp,sp,-32
    800025b8:	00113c23          	sd	ra,24(sp)
    800025bc:	00813823          	sd	s0,16(sp)
    800025c0:	00913423          	sd	s1,8(sp)
    800025c4:	02010413          	addi	s0,sp,32
    800025c8:	00050493          	mv	s1,a0
    800025cc:	0000a797          	auipc	a5,0xa
    800025d0:	32c78793          	addi	a5,a5,812 # 8000c8f8 <_ZTV9Semaphore+0x10>
    800025d4:	00f53023          	sd	a5,0(a0)
	sem_close(myHandle);
    800025d8:	00853503          	ld	a0,8(a0)
    800025dc:	fffff097          	auipc	ra,0xfffff
    800025e0:	efc080e7          	jalr	-260(ra) # 800014d8 <_Z9sem_closeP4KSem>
	delete myHandle;
    800025e4:	0084b483          	ld	s1,8(s1)
    800025e8:	02048863          	beqz	s1,80002618 <_ZN9SemaphoreD1Ev+0x64>
        bool ret = front == nullptr;
    800025ec:	0084b503          	ld	a0,8(s1)
        while (!isEmpty()) {
    800025f0:	00050e63          	beqz	a0,8000260c <_ZN9SemaphoreD1Ev+0x58>
            front = front->next;
    800025f4:	00853783          	ld	a5,8(a0)
    800025f8:	00f4b423          	sd	a5,8(s1)
            delete node;
    800025fc:	fe0508e3          	beqz	a0,800025ec <_ZN9SemaphoreD1Ev+0x38>
            mem_free(ptr);
    80002600:	fffff097          	auipc	ra,0xfffff
    80002604:	d50080e7          	jalr	-688(ra) # 80001350 <_Z8mem_freePv>
        }
    80002608:	fe5ff06f          	j	800025ec <_ZN9SemaphoreD1Ev+0x38>
    8000260c:	00048513          	mv	a0,s1
    80002610:	00001097          	auipc	ra,0x1
    80002614:	e64080e7          	jalr	-412(ra) # 80003474 <_ZN4KSemdlEPv>
}
    80002618:	01813083          	ld	ra,24(sp)
    8000261c:	01013403          	ld	s0,16(sp)
    80002620:	00813483          	ld	s1,8(sp)
    80002624:	02010113          	addi	sp,sp,32
    80002628:	00008067          	ret

000000008000262c <_Znwm>:
void* operator new(size_t size) {
    8000262c:	ff010113          	addi	sp,sp,-16
    80002630:	00113423          	sd	ra,8(sp)
    80002634:	00813023          	sd	s0,0(sp)
    80002638:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    8000263c:	fffff097          	auipc	ra,0xfffff
    80002640:	cd4080e7          	jalr	-812(ra) # 80001310 <_Z9mem_allocm>
}
    80002644:	00813083          	ld	ra,8(sp)
    80002648:	00013403          	ld	s0,0(sp)
    8000264c:	01010113          	addi	sp,sp,16
    80002650:	00008067          	ret

0000000080002654 <_Znam>:
void* operator new[](size_t size) {
    80002654:	ff010113          	addi	sp,sp,-16
    80002658:	00113423          	sd	ra,8(sp)
    8000265c:	00813023          	sd	s0,0(sp)
    80002660:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    80002664:	fffff097          	auipc	ra,0xfffff
    80002668:	cac080e7          	jalr	-852(ra) # 80001310 <_Z9mem_allocm>
}
    8000266c:	00813083          	ld	ra,8(sp)
    80002670:	00013403          	ld	s0,0(sp)
    80002674:	01010113          	addi	sp,sp,16
    80002678:	00008067          	ret

000000008000267c <_ZdlPv>:
noexcept {
    8000267c:	ff010113          	addi	sp,sp,-16
    80002680:	00113423          	sd	ra,8(sp)
    80002684:	00813023          	sd	s0,0(sp)
    80002688:	01010413          	addi	s0,sp,16
mem_free(ptr);
    8000268c:	fffff097          	auipc	ra,0xfffff
    80002690:	cc4080e7          	jalr	-828(ra) # 80001350 <_Z8mem_freePv>
}
    80002694:	00813083          	ld	ra,8(sp)
    80002698:	00013403          	ld	s0,0(sp)
    8000269c:	01010113          	addi	sp,sp,16
    800026a0:	00008067          	ret

00000000800026a4 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    800026a4:	fe010113          	addi	sp,sp,-32
    800026a8:	00113c23          	sd	ra,24(sp)
    800026ac:	00813823          	sd	s0,16(sp)
    800026b0:	00913423          	sd	s1,8(sp)
    800026b4:	02010413          	addi	s0,sp,32
    800026b8:	00050493          	mv	s1,a0
}
    800026bc:	00000097          	auipc	ra,0x0
    800026c0:	e80080e7          	jalr	-384(ra) # 8000253c <_ZN6ThreadD1Ev>
    800026c4:	00048513          	mv	a0,s1
    800026c8:	00000097          	auipc	ra,0x0
    800026cc:	fb4080e7          	jalr	-76(ra) # 8000267c <_ZdlPv>
    800026d0:	01813083          	ld	ra,24(sp)
    800026d4:	01013403          	ld	s0,16(sp)
    800026d8:	00813483          	ld	s1,8(sp)
    800026dc:	02010113          	addi	sp,sp,32
    800026e0:	00008067          	ret

00000000800026e4 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    800026e4:	fe010113          	addi	sp,sp,-32
    800026e8:	00113c23          	sd	ra,24(sp)
    800026ec:	00813823          	sd	s0,16(sp)
    800026f0:	00913423          	sd	s1,8(sp)
    800026f4:	02010413          	addi	s0,sp,32
    800026f8:	00050493          	mv	s1,a0
}
    800026fc:	00000097          	auipc	ra,0x0
    80002700:	eb8080e7          	jalr	-328(ra) # 800025b4 <_ZN9SemaphoreD1Ev>
    80002704:	00048513          	mv	a0,s1
    80002708:	00000097          	auipc	ra,0x0
    8000270c:	f74080e7          	jalr	-140(ra) # 8000267c <_ZdlPv>
    80002710:	01813083          	ld	ra,24(sp)
    80002714:	01013403          	ld	s0,16(sp)
    80002718:	00813483          	ld	s1,8(sp)
    8000271c:	02010113          	addi	sp,sp,32
    80002720:	00008067          	ret

0000000080002724 <_ZdaPv>:
noexcept {
    80002724:	ff010113          	addi	sp,sp,-16
    80002728:	00113423          	sd	ra,8(sp)
    8000272c:	00813023          	sd	s0,0(sp)
    80002730:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80002734:	fffff097          	auipc	ra,0xfffff
    80002738:	c1c080e7          	jalr	-996(ra) # 80001350 <_Z8mem_freePv>
}
    8000273c:	00813083          	ld	ra,8(sp)
    80002740:	00013403          	ld	s0,0(sp)
    80002744:	01010113          	addi	sp,sp,16
    80002748:	00008067          	ret

000000008000274c <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (* body)(void*), void* arg) {
    8000274c:	fd010113          	addi	sp,sp,-48
    80002750:	02113423          	sd	ra,40(sp)
    80002754:	02813023          	sd	s0,32(sp)
    80002758:	00913c23          	sd	s1,24(sp)
    8000275c:	01213823          	sd	s2,16(sp)
    80002760:	01313423          	sd	s3,8(sp)
    80002764:	03010413          	addi	s0,sp,48
    80002768:	00050493          	mv	s1,a0
    8000276c:	00058913          	mv	s2,a1
    80002770:	00060993          	mv	s3,a2
    80002774:	0000a797          	auipc	a5,0xa
    80002778:	15c78793          	addi	a5,a5,348 # 8000c8d0 <_ZTV6Thread+0x10>
    8000277c:	00f53023          	sd	a5,0(a0)
	this->body = body;
    80002780:	00b53823          	sd	a1,16(a0)
	this->arg = arg;
    80002784:	00c53c23          	sd	a2,24(a0)
	if (body != nullptr) {
    80002788:	04058663          	beqz	a1,800027d4 <_ZN6ThreadC1EPFvPvES0_+0x88>
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    8000278c:	00001537          	lui	a0,0x1
    80002790:	fffff097          	auipc	ra,0xfffff
    80002794:	b80080e7          	jalr	-1152(ra) # 80001310 <_Z9mem_allocm>
    80002798:	00050313          	mv	t1,a0
	__asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000279c:	00030713          	mv	a4,t1
	__asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800027a0:	00098693          	mv	a3,s3
			body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800027a4:	00090613          	mv	a2,s2
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800027a8:	00848493          	addi	s1,s1,8
    800027ac:	00048593          	mv	a1,s1
	__asm__ volatile("li a0, 0x80");
    800027b0:	08000513          	li	a0,128
	__asm__ volatile("ecall");
    800027b4:	00000073          	ecall
}
    800027b8:	02813083          	ld	ra,40(sp)
    800027bc:	02013403          	ld	s0,32(sp)
    800027c0:	01813483          	ld	s1,24(sp)
    800027c4:	01013903          	ld	s2,16(sp)
    800027c8:	00813983          	ld	s3,8(sp)
    800027cc:	03010113          	addi	sp,sp,48
    800027d0:	00008067          	ret
	uint64* stack = nullptr;
    800027d4:	00000313          	li	t1,0
    800027d8:	fc5ff06f          	j	8000279c <_ZN6ThreadC1EPFvPvES0_+0x50>

00000000800027dc <_ZN6Thread5startEv>:
int Thread::start() {
    800027dc:	ff010113          	addi	sp,sp,-16
    800027e0:	00813423          	sd	s0,8(sp)
    800027e4:	01010413          	addi	s0,sp,16
	if (myHandle == nullptr) return -1;
    800027e8:	00853303          	ld	t1,8(a0) # 1008 <_entry-0x7fffeff8>
    800027ec:	02030063          	beqz	t1,8000280c <_ZN6Thread5startEv+0x30>
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800027f0:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x81");
    800027f4:	08100513          	li	a0,129
	__asm__ volatile("ecall");
    800027f8:	00000073          	ecall
	return 0;
    800027fc:	00000513          	li	a0,0
}
    80002800:	00813403          	ld	s0,8(sp)
    80002804:	01010113          	addi	sp,sp,16
    80002808:	00008067          	ret
	if (myHandle == nullptr) return -1;
    8000280c:	fff00513          	li	a0,-1
    80002810:	ff1ff06f          	j	80002800 <_ZN6Thread5startEv+0x24>

0000000080002814 <_ZN6Thread4joinEv>:
void Thread::join() {
    80002814:	ff010113          	addi	sp,sp,-16
    80002818:	00113423          	sd	ra,8(sp)
    8000281c:	00813023          	sd	s0,0(sp)
    80002820:	01010413          	addi	s0,sp,16
	thread_join(myHandle);
    80002824:	00853503          	ld	a0,8(a0)
    80002828:	fffff097          	auipc	ra,0xfffff
    8000282c:	c20080e7          	jalr	-992(ra) # 80001448 <_Z11thread_joinP3TCB>
}
    80002830:	00813083          	ld	ra,8(sp)
    80002834:	00013403          	ld	s0,0(sp)
    80002838:	01010113          	addi	sp,sp,16
    8000283c:	00008067          	ret

0000000080002840 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80002840:	ff010113          	addi	sp,sp,-16
    80002844:	00113423          	sd	ra,8(sp)
    80002848:	00813023          	sd	s0,0(sp)
    8000284c:	01010413          	addi	s0,sp,16
	thread_dispatch();
    80002850:	fffff097          	auipc	ra,0xfffff
    80002854:	bd8080e7          	jalr	-1064(ra) # 80001428 <_Z15thread_dispatchv>
}
    80002858:	00813083          	ld	ra,8(sp)
    8000285c:	00013403          	ld	s0,0(sp)
    80002860:	01010113          	addi	sp,sp,16
    80002864:	00008067          	ret

0000000080002868 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t t) {
    80002868:	ff010113          	addi	sp,sp,-16
    8000286c:	00113423          	sd	ra,8(sp)
    80002870:	00813023          	sd	s0,0(sp)
    80002874:	01010413          	addi	s0,sp,16
    80002878:	00050593          	mv	a1,a0
	Scheduler::putToSleep(TCB::running, t);
    8000287c:	0000a797          	auipc	a5,0xa
    80002880:	2947b783          	ld	a5,660(a5) # 8000cb10 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002884:	0007b503          	ld	a0,0(a5)
    80002888:	fffff097          	auipc	ra,0xfffff
    8000288c:	24c080e7          	jalr	588(ra) # 80001ad4 <_ZN9Scheduler10putToSleepEP3TCBm>
}
    80002890:	00000513          	li	a0,0
    80002894:	00813083          	ld	ra,8(sp)
    80002898:	00013403          	ld	s0,0(sp)
    8000289c:	01010113          	addi	sp,sp,16
    800028a0:	00008067          	ret

00000000800028a4 <_ZN14PeriodicThread15periodicWrapperEPv>:
}

PeriodicThread::PeriodicThread(time_t period) : Thread(periodicWrapper, this), period(period) {
}

void PeriodicThread::periodicWrapper(void* pThread) {
    800028a4:	fe010113          	addi	sp,sp,-32
    800028a8:	00113c23          	sd	ra,24(sp)
    800028ac:	00813823          	sd	s0,16(sp)
    800028b0:	00913423          	sd	s1,8(sp)
    800028b4:	02010413          	addi	s0,sp,32
    800028b8:	00050493          	mv	s1,a0
	if (pThread != nullptr) {
    800028bc:	02050263          	beqz	a0,800028e0 <_ZN14PeriodicThread15periodicWrapperEPv+0x3c>
		PeriodicThread* ptr = (PeriodicThread*)pThread;
		while (1) {
			ptr->periodicActivation();
    800028c0:	0004b783          	ld	a5,0(s1)
    800028c4:	0187b783          	ld	a5,24(a5)
    800028c8:	00048513          	mv	a0,s1
    800028cc:	000780e7          	jalr	a5
			Thread::sleep(ptr->period);
    800028d0:	0204b503          	ld	a0,32(s1)
    800028d4:	00000097          	auipc	ra,0x0
    800028d8:	f94080e7          	jalr	-108(ra) # 80002868 <_ZN6Thread5sleepEm>
		while (1) {
    800028dc:	fe5ff06f          	j	800028c0 <_ZN14PeriodicThread15periodicWrapperEPv+0x1c>
		}
	}
}
    800028e0:	01813083          	ld	ra,24(sp)
    800028e4:	01013403          	ld	s0,16(sp)
    800028e8:	00813483          	ld	s1,8(sp)
    800028ec:	02010113          	addi	sp,sp,32
    800028f0:	00008067          	ret

00000000800028f4 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    800028f4:	fe010113          	addi	sp,sp,-32
    800028f8:	00113c23          	sd	ra,24(sp)
    800028fc:	00813823          	sd	s0,16(sp)
    80002900:	00913423          	sd	s1,8(sp)
    80002904:	02010413          	addi	s0,sp,32
    80002908:	00050493          	mv	s1,a0
    8000290c:	0000a797          	auipc	a5,0xa
    80002910:	fc478793          	addi	a5,a5,-60 # 8000c8d0 <_ZTV6Thread+0x10>
    80002914:	00f53023          	sd	a5,0(a0)
	this->body = wrapper;
    80002918:	00000797          	auipc	a5,0x0
    8000291c:	bf078793          	addi	a5,a5,-1040 # 80002508 <_ZN6Thread7wrapperEPv>
    80002920:	00f53823          	sd	a5,16(a0)
	this->arg = this;
    80002924:	00a53c23          	sd	a0,24(a0)
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    80002928:	00001537          	lui	a0,0x1
    8000292c:	fffff097          	auipc	ra,0xfffff
    80002930:	9e4080e7          	jalr	-1564(ra) # 80001310 <_Z9mem_allocm>
    80002934:	00050313          	mv	t1,a0
	__asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002938:	00030713          	mv	a4,t1
	__asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000293c:	0184b303          	ld	t1,24(s1)
    80002940:	00030693          	mv	a3,t1
			body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002944:	0104b303          	ld	t1,16(s1)
    80002948:	00030613          	mv	a2,t1
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000294c:	00848493          	addi	s1,s1,8
    80002950:	00048593          	mv	a1,s1
	__asm__ volatile("li a0, 0x80");
    80002954:	08000513          	li	a0,128
	__asm__ volatile("ecall");
    80002958:	00000073          	ecall
}
    8000295c:	01813083          	ld	ra,24(sp)
    80002960:	01013403          	ld	s0,16(sp)
    80002964:	00813483          	ld	s1,8(sp)
    80002968:	02010113          	addi	sp,sp,32
    8000296c:	00008067          	ret

0000000080002970 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80002970:	ff010113          	addi	sp,sp,-16
    80002974:	00113423          	sd	ra,8(sp)
    80002978:	00813023          	sd	s0,0(sp)
    8000297c:	01010413          	addi	s0,sp,16
    80002980:	0000a797          	auipc	a5,0xa
    80002984:	f7878793          	addi	a5,a5,-136 # 8000c8f8 <_ZTV9Semaphore+0x10>
    80002988:	00f53023          	sd	a5,0(a0) # 1000 <_entry-0x7ffff000>
	sem_open(&myHandle, init);
    8000298c:	00850513          	addi	a0,a0,8
    80002990:	fffff097          	auipc	ra,0xfffff
    80002994:	b10080e7          	jalr	-1264(ra) # 800014a0 <_Z8sem_openPP4KSemj>
}
    80002998:	00813083          	ld	ra,8(sp)
    8000299c:	00013403          	ld	s0,0(sp)
    800029a0:	01010113          	addi	sp,sp,16
    800029a4:	00008067          	ret

00000000800029a8 <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    800029a8:	ff010113          	addi	sp,sp,-16
    800029ac:	00113423          	sd	ra,8(sp)
    800029b0:	00813023          	sd	s0,0(sp)
    800029b4:	01010413          	addi	s0,sp,16
	return sem_wait(myHandle);
    800029b8:	00853503          	ld	a0,8(a0)
    800029bc:	fffff097          	auipc	ra,0xfffff
    800029c0:	b4c080e7          	jalr	-1204(ra) # 80001508 <_Z8sem_waitP4KSem>
}
    800029c4:	00813083          	ld	ra,8(sp)
    800029c8:	00013403          	ld	s0,0(sp)
    800029cc:	01010113          	addi	sp,sp,16
    800029d0:	00008067          	ret

00000000800029d4 <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    800029d4:	ff010113          	addi	sp,sp,-16
    800029d8:	00113423          	sd	ra,8(sp)
    800029dc:	00813023          	sd	s0,0(sp)
    800029e0:	01010413          	addi	s0,sp,16
	return sem_signal(myHandle);
    800029e4:	00853503          	ld	a0,8(a0)
    800029e8:	fffff097          	auipc	ra,0xfffff
    800029ec:	b50080e7          	jalr	-1200(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    800029f0:	00813083          	ld	ra,8(sp)
    800029f4:	00013403          	ld	s0,0(sp)
    800029f8:	01010113          	addi	sp,sp,16
    800029fc:	00008067          	ret

0000000080002a00 <_ZN14PeriodicThread9terminateEv>:
void PeriodicThread::terminate() {
    80002a00:	ff010113          	addi	sp,sp,-16
    80002a04:	00813423          	sd	s0,8(sp)
    80002a08:	01010413          	addi	s0,sp,16
}
    80002a0c:	00813403          	ld	s0,8(sp)
    80002a10:	01010113          	addi	sp,sp,16
    80002a14:	00008067          	ret

0000000080002a18 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period) : Thread(periodicWrapper, this), period(period) {
    80002a18:	fe010113          	addi	sp,sp,-32
    80002a1c:	00113c23          	sd	ra,24(sp)
    80002a20:	00813823          	sd	s0,16(sp)
    80002a24:	00913423          	sd	s1,8(sp)
    80002a28:	01213023          	sd	s2,0(sp)
    80002a2c:	02010413          	addi	s0,sp,32
    80002a30:	00050493          	mv	s1,a0
    80002a34:	00058913          	mv	s2,a1
    80002a38:	00050613          	mv	a2,a0
    80002a3c:	00000597          	auipc	a1,0x0
    80002a40:	e6858593          	addi	a1,a1,-408 # 800028a4 <_ZN14PeriodicThread15periodicWrapperEPv>
    80002a44:	00000097          	auipc	ra,0x0
    80002a48:	d08080e7          	jalr	-760(ra) # 8000274c <_ZN6ThreadC1EPFvPvES0_>
    80002a4c:	0000a797          	auipc	a5,0xa
    80002a50:	e5478793          	addi	a5,a5,-428 # 8000c8a0 <_ZTV14PeriodicThread+0x10>
    80002a54:	00f4b023          	sd	a5,0(s1)
    80002a58:	0324b023          	sd	s2,32(s1)
}
    80002a5c:	01813083          	ld	ra,24(sp)
    80002a60:	01013403          	ld	s0,16(sp)
    80002a64:	00813483          	ld	s1,8(sp)
    80002a68:	00013903          	ld	s2,0(sp)
    80002a6c:	02010113          	addi	sp,sp,32
    80002a70:	00008067          	ret

0000000080002a74 <_ZN7Console4getcEv>:

char Console::getc() {
    80002a74:	ff010113          	addi	sp,sp,-16
    80002a78:	00113423          	sd	ra,8(sp)
    80002a7c:	00813023          	sd	s0,0(sp)
    80002a80:	01010413          	addi	s0,sp,16
	return ::getc();
    80002a84:	fffff097          	auipc	ra,0xfffff
    80002a88:	ae4080e7          	jalr	-1308(ra) # 80001568 <_Z4getcv>
}
    80002a8c:	00813083          	ld	ra,8(sp)
    80002a90:	00013403          	ld	s0,0(sp)
    80002a94:	01010113          	addi	sp,sp,16
    80002a98:	00008067          	ret

0000000080002a9c <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80002a9c:	ff010113          	addi	sp,sp,-16
    80002aa0:	00113423          	sd	ra,8(sp)
    80002aa4:	00813023          	sd	s0,0(sp)
    80002aa8:	01010413          	addi	s0,sp,16
	::putc(c);
    80002aac:	fffff097          	auipc	ra,0xfffff
    80002ab0:	ae4080e7          	jalr	-1308(ra) # 80001590 <_Z4putcc>
}
    80002ab4:	00813083          	ld	ra,8(sp)
    80002ab8:	00013403          	ld	s0,0(sp)
    80002abc:	01010113          	addi	sp,sp,16
    80002ac0:	00008067          	ret

0000000080002ac4 <_ZN6Thread3runEv>:
	static int sleep(time_t);

protected:
	Thread();

	virtual void run() {}
    80002ac4:	ff010113          	addi	sp,sp,-16
    80002ac8:	00813423          	sd	s0,8(sp)
    80002acc:	01010413          	addi	s0,sp,16
    80002ad0:	00813403          	ld	s0,8(sp)
    80002ad4:	01010113          	addi	sp,sp,16
    80002ad8:	00008067          	ret

0000000080002adc <_ZN14PeriodicThread18periodicActivationEv>:
	void terminate();

protected:
	PeriodicThread(time_t period);

	virtual void periodicActivation() {}
    80002adc:	ff010113          	addi	sp,sp,-16
    80002ae0:	00813423          	sd	s0,8(sp)
    80002ae4:	01010413          	addi	s0,sp,16
    80002ae8:	00813403          	ld	s0,8(sp)
    80002aec:	01010113          	addi	sp,sp,16
    80002af0:	00008067          	ret

0000000080002af4 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80002af4:	ff010113          	addi	sp,sp,-16
    80002af8:	00113423          	sd	ra,8(sp)
    80002afc:	00813023          	sd	s0,0(sp)
    80002b00:	01010413          	addi	s0,sp,16
    80002b04:	0000a797          	auipc	a5,0xa
    80002b08:	d9c78793          	addi	a5,a5,-612 # 8000c8a0 <_ZTV14PeriodicThread+0x10>
    80002b0c:	00f53023          	sd	a5,0(a0)
    80002b10:	00000097          	auipc	ra,0x0
    80002b14:	a2c080e7          	jalr	-1492(ra) # 8000253c <_ZN6ThreadD1Ev>
    80002b18:	00813083          	ld	ra,8(sp)
    80002b1c:	00013403          	ld	s0,0(sp)
    80002b20:	01010113          	addi	sp,sp,16
    80002b24:	00008067          	ret

0000000080002b28 <_ZN14PeriodicThreadD0Ev>:
    80002b28:	fe010113          	addi	sp,sp,-32
    80002b2c:	00113c23          	sd	ra,24(sp)
    80002b30:	00813823          	sd	s0,16(sp)
    80002b34:	00913423          	sd	s1,8(sp)
    80002b38:	02010413          	addi	s0,sp,32
    80002b3c:	00050493          	mv	s1,a0
    80002b40:	0000a797          	auipc	a5,0xa
    80002b44:	d6078793          	addi	a5,a5,-672 # 8000c8a0 <_ZTV14PeriodicThread+0x10>
    80002b48:	00f53023          	sd	a5,0(a0)
    80002b4c:	00000097          	auipc	ra,0x0
    80002b50:	9f0080e7          	jalr	-1552(ra) # 8000253c <_ZN6ThreadD1Ev>
    80002b54:	00048513          	mv	a0,s1
    80002b58:	00000097          	auipc	ra,0x0
    80002b5c:	b24080e7          	jalr	-1244(ra) # 8000267c <_ZdlPv>
    80002b60:	01813083          	ld	ra,24(sp)
    80002b64:	01013403          	ld	s0,16(sp)
    80002b68:	00813483          	ld	s1,8(sp)
    80002b6c:	02010113          	addi	sp,sp,32
    80002b70:	00008067          	ret

0000000080002b74 <_ZN3TCB7wrapperEv>:
    Riscv::pushRegisters();
    TCB::dispatch();
    Riscv::popRegisters();
}

void TCB::wrapper() {
    80002b74:	ff010113          	addi	sp,sp,-16
    80002b78:	00113423          	sd	ra,8(sp)
    80002b7c:	00813023          	sd	s0,0(sp)
    80002b80:	01010413          	addi	s0,sp,16
    //pocetak wrappera se izvrsava u supervisor modu,
    //jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch/yield)
    Riscv::popSppSpie();
    80002b84:	00000097          	auipc	ra,0x0
    80002b88:	308080e7          	jalr	776(ra) # 80002e8c <_ZN5Riscv10popSppSpieEv>
    //na dalje se izvrsavamo u user modu
    running->threadFunction(running->args);
    80002b8c:	0000a797          	auipc	a5,0xa
    80002b90:	0fc7b783          	ld	a5,252(a5) # 8000cc88 <_ZN3TCB7runningE>
    80002b94:	0107b703          	ld	a4,16(a5)
    80002b98:	0207b503          	ld	a0,32(a5)
    80002b9c:	000700e7          	jalr	a4
    //running->finished = true;
    //i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
    thread_exit();
    80002ba0:	fffff097          	auipc	ra,0xfffff
    80002ba4:	860080e7          	jalr	-1952(ra) # 80001400 <_Z11thread_exitv>
}
    80002ba8:	00813083          	ld	ra,8(sp)
    80002bac:	00013403          	ld	s0,0(sp)
    80002bb0:	01010113          	addi	sp,sp,16
    80002bb4:	00008067          	ret

0000000080002bb8 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80002bb8:	fe010113          	addi	sp,sp,-32
    80002bbc:	00113c23          	sd	ra,24(sp)
    80002bc0:	00813823          	sd	s0,16(sp)
    80002bc4:	00913423          	sd	s1,8(sp)
    80002bc8:	02010413          	addi	s0,sp,32
    TCB* old = TCB::running;
    80002bcc:	0000a497          	auipc	s1,0xa
    80002bd0:	0bc4b483          	ld	s1,188(s1) # 8000cc88 <_ZN3TCB7runningE>
    if (old->status == ACTIVE) {
    80002bd4:	0584a703          	lw	a4,88(s1)
    80002bd8:	00100793          	li	a5,1
    80002bdc:	04f70663          	beq	a4,a5,80002c28 <_ZN3TCB8dispatchEv+0x70>
    TCB::running = Scheduler::get();
    80002be0:	fffff097          	auipc	ra,0xfffff
    80002be4:	eb4080e7          	jalr	-332(ra) # 80001a94 <_ZN9Scheduler3getEv>
    80002be8:	00050593          	mv	a1,a0
    80002bec:	0000a797          	auipc	a5,0xa
    80002bf0:	09c78793          	addi	a5,a5,156 # 8000cc88 <_ZN3TCB7runningE>
    80002bf4:	00a7b023          	sd	a0,0(a5)
    TCB::runningTimeSlice = 0;
    80002bf8:	0007b423          	sd	zero,8(a5)
    if (TCB::running->threadFunction == nullptr || TCB::running->threadFunction == kernelConsumerFunction ||
    80002bfc:	01053783          	ld	a5,16(a0)
    80002c00:	02078c63          	beqz	a5,80002c38 <_ZN3TCB8dispatchEv+0x80>
    80002c04:	0000a717          	auipc	a4,0xa
    80002c08:	ee473703          	ld	a4,-284(a4) # 8000cae8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002c0c:	02e78663          	beq	a5,a4,80002c38 <_ZN3TCB8dispatchEv+0x80>
    80002c10:	0000a717          	auipc	a4,0xa
    80002c14:	f1873703          	ld	a4,-232(a4) # 8000cb28 <_GLOBAL_OFFSET_TABLE_+0x70>
    80002c18:	02e78063          	beq	a5,a4,80002c38 <_ZN3TCB8dispatchEv+0x80>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002c1c:	10000793          	li	a5,256
    80002c20:	1007b073          	csrc	sstatus,a5
}
    80002c24:	01c0006f          	j	80002c40 <_ZN3TCB8dispatchEv+0x88>
        Scheduler::put(old);
    80002c28:	00048513          	mv	a0,s1
    80002c2c:	fffff097          	auipc	ra,0xfffff
    80002c30:	e24080e7          	jalr	-476(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
    80002c34:	fadff06f          	j	80002be0 <_ZN3TCB8dispatchEv+0x28>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80002c38:	10000793          	li	a5,256
    80002c3c:	1007a073          	csrs	sstatus,a5
    if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    80002c40:	00b48863          	beq	s1,a1,80002c50 <_ZN3TCB8dispatchEv+0x98>
    80002c44:	00048513          	mv	a0,s1
    80002c48:	ffffe097          	auipc	ra,0xffffe
    80002c4c:	5c8080e7          	jalr	1480(ra) # 80001210 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80002c50:	01813083          	ld	ra,24(sp)
    80002c54:	01013403          	ld	s0,16(sp)
    80002c58:	00813483          	ld	s1,8(sp)
    80002c5c:	02010113          	addi	sp,sp,32
    80002c60:	00008067          	ret

0000000080002c64 <_ZN3TCB5yieldEv>:
void TCB::yield() {
    80002c64:	ff010113          	addi	sp,sp,-16
    80002c68:	00113423          	sd	ra,8(sp)
    80002c6c:	00813023          	sd	s0,0(sp)
    80002c70:	01010413          	addi	s0,sp,16
    Riscv::pushRegisters();
    80002c74:	ffffe097          	auipc	ra,0xffffe
    80002c78:	38c080e7          	jalr	908(ra) # 80001000 <_ZN5Riscv13pushRegistersEv>
    TCB::dispatch();
    80002c7c:	00000097          	auipc	ra,0x0
    80002c80:	f3c080e7          	jalr	-196(ra) # 80002bb8 <_ZN3TCB8dispatchEv>
    Riscv::popRegisters();
    80002c84:	ffffe097          	auipc	ra,0xffffe
    80002c88:	3f8080e7          	jalr	1016(ra) # 8000107c <_ZN5Riscv12popRegistersEv>
}
    80002c8c:	00813083          	ld	ra,8(sp)
    80002c90:	00013403          	ld	s0,0(sp)
    80002c94:	01010113          	addi	sp,sp,16
    80002c98:	00008067          	ret

0000000080002c9c <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    80002c9c:	ff010113          	addi	sp,sp,-16
    80002ca0:	00113423          	sd	ra,8(sp)
    80002ca4:	00813023          	sd	s0,0(sp)
    80002ca8:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80002cac:	ffffe097          	auipc	ra,0xffffe
    80002cb0:	664080e7          	jalr	1636(ra) # 80001310 <_Z9mem_allocm>
    //return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::THREAD);
}
    80002cb4:	00813083          	ld	ra,8(sp)
    80002cb8:	00013403          	ld	s0,0(sp)
    80002cbc:	01010113          	addi	sp,sp,16
    80002cc0:	00008067          	ret

0000000080002cc4 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    80002cc4:	fd010113          	addi	sp,sp,-48
    80002cc8:	02113423          	sd	ra,40(sp)
    80002ccc:	02813023          	sd	s0,32(sp)
    80002cd0:	00913c23          	sd	s1,24(sp)
    80002cd4:	01213823          	sd	s2,16(sp)
    80002cd8:	01313423          	sd	s3,8(sp)
    80002cdc:	03010413          	addi	s0,sp,48
    80002ce0:	00050913          	mv	s2,a0
    80002ce4:	00058993          	mv	s3,a1
    80002ce8:	00060493          	mv	s1,a2
    TCB* newThread = new TCB(function, args, stack);
    80002cec:	06000513          	li	a0,96
    80002cf0:	00000097          	auipc	ra,0x0
    80002cf4:	fac080e7          	jalr	-84(ra) # 80002c9c <_ZN3TCBnwEm>
    ThreadStatus status;    //status niti


    TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
                                                    timeSlice(DEFAULT_TIME_SLICE), nextInScheduler(nullptr), timeToSleep(0),
                                                    nextSleeping(nullptr), status(CREATED) {
    80002cf8:	01253823          	sd	s2,16(a0)
    80002cfc:	00953c23          	sd	s1,24(a0)
    80002d00:	03353023          	sd	s3,32(a0)
    80002d04:	00200793          	li	a5,2
    80002d08:	02f53423          	sd	a5,40(a0)
    80002d0c:	02053823          	sd	zero,48(a0)
    80002d10:	02053c23          	sd	zero,56(a0)
    80002d14:	04053023          	sd	zero,64(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    80002d18:	04053423          	sd	zero,72(a0)
    80002d1c:	04053823          	sd	zero,80(a0)
    80002d20:	04052c23          	sw	zero,88(a0)
        //formiranje pocetnog konteksta; specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
        uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80002d24:	02090e63          	beqz	s2,80002d60 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x9c>
    80002d28:	00000797          	auipc	a5,0x0
    80002d2c:	e4c78793          	addi	a5,a5,-436 # 80002b74 <_ZN3TCB7wrapperEv>
        uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80002d30:	02048c63          	beqz	s1,80002d68 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xa4>
    80002d34:	00008637          	lui	a2,0x8
    80002d38:	00c484b3          	add	s1,s1,a2
        this->context.ra = startRa;
    80002d3c:	00f53023          	sd	a5,0(a0)
        this->context.sp = startSp;
    80002d40:	00953423          	sd	s1,8(a0)
}
    80002d44:	02813083          	ld	ra,40(sp)
    80002d48:	02013403          	ld	s0,32(sp)
    80002d4c:	01813483          	ld	s1,24(sp)
    80002d50:	01013903          	ld	s2,16(sp)
    80002d54:	00813983          	ld	s3,8(sp)
    80002d58:	03010113          	addi	sp,sp,48
    80002d5c:	00008067          	ret
        uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80002d60:	00000793          	li	a5,0
    80002d64:	fcdff06f          	j	80002d30 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x6c>
        uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80002d68:	00000493          	li	s1,0
    80002d6c:	fd1ff06f          	j	80002d3c <_ZN3TCB12createThreadEPFvPvES0_Pm+0x78>

0000000080002d70 <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    80002d70:	ff010113          	addi	sp,sp,-16
    80002d74:	00113423          	sd	ra,8(sp)
    80002d78:	00813023          	sd	s0,0(sp)
    80002d7c:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80002d80:	ffffe097          	auipc	ra,0xffffe
    80002d84:	5d0080e7          	jalr	1488(ra) # 80001350 <_Z8mem_freePv>
    //MemoryAllocator::kfree(ptr);
}
    80002d88:	00813083          	ld	ra,8(sp)
    80002d8c:	00013403          	ld	s0,0(sp)
    80002d90:	01010113          	addi	sp,sp,16
    80002d94:	00008067          	ret

0000000080002d98 <_ZN3TCB10threadJoinEPS_>:

void TCB::threadJoin(TCB* handle) {
    if (handle->status == FINISHED) return;
    80002d98:	05852703          	lw	a4,88(a0)
    80002d9c:	00500793          	li	a5,5
    80002da0:	04f70063          	beq	a4,a5,80002de0 <_ZN3TCB10threadJoinEPS_+0x48>
void TCB::threadJoin(TCB* handle) {
    80002da4:	ff010113          	addi	sp,sp,-16
    80002da8:	00113423          	sd	ra,8(sp)
    80002dac:	00813023          	sd	s0,0(sp)
    80002db0:	01010413          	addi	s0,sp,16
    TCB::running->status = JOINING;
    80002db4:	0000a597          	auipc	a1,0xa
    80002db8:	ed45b583          	ld	a1,-300(a1) # 8000cc88 <_ZN3TCB7runningE>
    80002dbc:	00300793          	li	a5,3
    80002dc0:	04f5ac23          	sw	a5,88(a1)
    handle->waitingToJoin.putLast(TCB::running);
    80002dc4:	04850513          	addi	a0,a0,72
    80002dc8:	ffffe097          	auipc	ra,0xffffe
    80002dcc:	47c080e7          	jalr	1148(ra) # 80001244 <_ZN11ThreadQueue7putLastEP3TCB>
}
    80002dd0:	00813083          	ld	ra,8(sp)
    80002dd4:	00013403          	ld	s0,0(sp)
    80002dd8:	01010113          	addi	sp,sp,16
    80002ddc:	00008067          	ret
    80002de0:	00008067          	ret

0000000080002de4 <_ZN3TCB13releaseJoinedEv>:

void TCB::releaseJoined() {
    while (!TCB::running->waitingToJoin.isEmpty()) {
    80002de4:	0000a517          	auipc	a0,0xa
    80002de8:	ea453503          	ld	a0,-348(a0) # 8000cc88 <_ZN3TCB7runningE>
        bool ret = front == nullptr;
    80002dec:	04853783          	ld	a5,72(a0)
    80002df0:	04078863          	beqz	a5,80002e40 <_ZN3TCB13releaseJoinedEv+0x5c>
void TCB::releaseJoined() {
    80002df4:	ff010113          	addi	sp,sp,-16
    80002df8:	00113423          	sd	ra,8(sp)
    80002dfc:	00813023          	sd	s0,0(sp)
    80002e00:	01010413          	addi	s0,sp,16
        TCB* tcb = TCB::running->waitingToJoin.getFirst();
    80002e04:	04850513          	addi	a0,a0,72
    80002e08:	ffffe097          	auipc	ra,0xffffe
    80002e0c:	4a8080e7          	jalr	1192(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
        tcb->status = ACTIVE;
    80002e10:	00100793          	li	a5,1
    80002e14:	04f52c23          	sw	a5,88(a0)
        Scheduler::put(tcb);
    80002e18:	fffff097          	auipc	ra,0xfffff
    80002e1c:	c38080e7          	jalr	-968(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
    while (!TCB::running->waitingToJoin.isEmpty()) {
    80002e20:	0000a517          	auipc	a0,0xa
    80002e24:	e6853503          	ld	a0,-408(a0) # 8000cc88 <_ZN3TCB7runningE>
    80002e28:	04853783          	ld	a5,72(a0)
    80002e2c:	fc079ce3          	bnez	a5,80002e04 <_ZN3TCB13releaseJoinedEv+0x20>
    }
}
    80002e30:	00813083          	ld	ra,8(sp)
    80002e34:	00013403          	ld	s0,0(sp)
    80002e38:	01010113          	addi	sp,sp,16
    80002e3c:	00008067          	ret
    80002e40:	00008067          	ret

0000000080002e44 <_ZN3TCB5startEPS_>:

void TCB::start(TCB* newTcb) {
    //startovanje niti(stavljanje u Scheduler); main nit je vec aktivna, ne stavlja se u Scheduler
    if (newTcb->threadFunction != nullptr) {
    80002e44:	01053783          	ld	a5,16(a0)
    80002e48:	04078063          	beqz	a5,80002e88 <_ZN3TCB5startEPS_+0x44>
void TCB::start(TCB* newTcb) {
    80002e4c:	fe010113          	addi	sp,sp,-32
    80002e50:	00113c23          	sd	ra,24(sp)
    80002e54:	00813823          	sd	s0,16(sp)
    80002e58:	00913423          	sd	s1,8(sp)
    80002e5c:	02010413          	addi	s0,sp,32
    80002e60:	00050493          	mv	s1,a0
        Scheduler::put(newTcb);
    80002e64:	fffff097          	auipc	ra,0xfffff
    80002e68:	bec080e7          	jalr	-1044(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
        newTcb->status = ACTIVE;
    80002e6c:	00100793          	li	a5,1
    80002e70:	04f4ac23          	sw	a5,88(s1)
    }
}
    80002e74:	01813083          	ld	ra,24(sp)
    80002e78:	01013403          	ld	s0,16(sp)
    80002e7c:	00813483          	ld	s1,8(sp)
    80002e80:	02010113          	addi	sp,sp,32
    80002e84:	00008067          	ret
    80002e88:	00008067          	ret

0000000080002e8c <_ZN5Riscv10popSppSpieEv>:
// Created by os on 5/17/23.
//

#include "../h/Riscv.hpp"

void Riscv::popSppSpie() {
    80002e8c:	ff010113          	addi	sp,sp,-16
    80002e90:	00813423          	sd	s0,8(sp)
    80002e94:	01010413          	addi	s0,sp,16
	//ra pokazuje iza ove funkcije na nastavak wrappera
	__asm__ volatile("csrw sepc, ra");
    80002e98:	14109073          	csrw	sepc,ra
	__asm__ volatile("sret");
    80002e9c:	10200073          	sret
    80002ea0:	00813403          	ld	s0,8(sp)
    80002ea4:	01010113          	addi	sp,sp,16
    80002ea8:	00008067          	ret

0000000080002eac <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>:
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

#pragma GCC optimize("O0")

void* MemoryAllocator::kmalloc(size_t size, Purpose pur) {
    80002eac:	fa010113          	addi	sp,sp,-96
    80002eb0:	04813c23          	sd	s0,88(sp)
    80002eb4:	06010413          	addi	s0,sp,96
    80002eb8:	faa43423          	sd	a0,-88(s0)
    80002ebc:	00058793          	mv	a5,a1
    80002ec0:	faf42223          	sw	a5,-92(s0)
    //size je u broju bajtova, ukljucuje i mesto potrebno za zaglavlje UsedMemSegment
    if (size <= 0) return nullptr;
    80002ec4:	fa843783          	ld	a5,-88(s0)
    80002ec8:	00079663          	bnez	a5,80002ed4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x28>
    80002ecc:	00000793          	li	a5,0
    80002ed0:	2040006f          	j	800030d4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
    //alokacija uvek zaokruzena na blokove
    //size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
    size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80002ed4:	fa843783          	ld	a5,-88(s0)
    80002ed8:	0067d713          	srli	a4,a5,0x6
    80002edc:	fa843783          	ld	a5,-88(s0)
    80002ee0:	03f7f793          	andi	a5,a5,63
    80002ee4:	00078663          	beqz	a5,80002ef0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x44>
    80002ee8:	00100793          	li	a5,1
    80002eec:	0080006f          	j	80002ef4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x48>
    80002ef0:	00000793          	li	a5,0
    80002ef4:	00e787b3          	add	a5,a5,a4
    80002ef8:	fcf43423          	sd	a5,-56(s0)
    size = blocks * MEM_BLOCK_SIZE;
    80002efc:	fc843783          	ld	a5,-56(s0)
    80002f00:	00679793          	slli	a5,a5,0x6
    80002f04:	faf43423          	sd	a5,-88(s0)

    //trazenje slobodnog segmenta po first-fit algoritmu
    FreeMemSegment* prevFree = nullptr;
    80002f08:	fe043423          	sd	zero,-24(s0)
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
    80002f0c:	0000a797          	auipc	a5,0xa
    80002f10:	d9478793          	addi	a5,a5,-620 # 8000cca0 <_ZN15MemoryAllocator11freeMemHeadE>
    80002f14:	0007b783          	ld	a5,0(a5)
    80002f18:	fef43023          	sd	a5,-32(s0)
    80002f1c:	fe043783          	ld	a5,-32(s0)
    80002f20:	1a078863          	beqz	a5,800030d0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x224>
        if (firstFit->size < size) continue;
    80002f24:	fe043783          	ld	a5,-32(s0)
    80002f28:	0087b783          	ld	a5,8(a5)
    80002f2c:	fa843703          	ld	a4,-88(s0)
    80002f30:	18e7e263          	bltu	a5,a4,800030b4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x208>

        //pravljenje novog slobodnog fragmenta od ostatka fragmenta
        FreeMemSegment* remainderFree = (FreeMemSegment*) ((char*) firstFit + size);
    80002f34:	fe043703          	ld	a4,-32(s0)
    80002f38:	fa843783          	ld	a5,-88(s0)
    80002f3c:	00f707b3          	add	a5,a4,a5
    80002f40:	fcf43023          	sd	a5,-64(s0)
        size_t remainingSize = firstFit->size - size;
    80002f44:	fe043783          	ld	a5,-32(s0)
    80002f48:	0087b703          	ld	a4,8(a5)
    80002f4c:	fa843783          	ld	a5,-88(s0)
    80002f50:	40f707b3          	sub	a5,a4,a5
    80002f54:	faf43c23          	sd	a5,-72(s0)
        if (remainingSize <= sizeof(UsedMemSegment)) {
    80002f58:	fb843703          	ld	a4,-72(s0)
    80002f5c:	02000793          	li	a5,32
    80002f60:	04e7e463          	bltu	a5,a4,80002fa8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xfc>
            //ne preostaje dovoljno veliki slobodni segment;dodeljujemo ceo trenutno alociranom;remainderFree ne postoji
            size += remainingSize;
    80002f64:	fa843703          	ld	a4,-88(s0)
    80002f68:	fb843783          	ld	a5,-72(s0)
    80002f6c:	00f707b3          	add	a5,a4,a5
    80002f70:	faf43423          	sd	a5,-88(s0)
            if (prevFree) {
    80002f74:	fe843783          	ld	a5,-24(s0)
    80002f78:	00078c63          	beqz	a5,80002f90 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xe4>
                prevFree->next = firstFit->next;
    80002f7c:	fe043783          	ld	a5,-32(s0)
    80002f80:	0007b703          	ld	a4,0(a5)
    80002f84:	fe843783          	ld	a5,-24(s0)
    80002f88:	00e7b023          	sd	a4,0(a5)
    80002f8c:	0600006f          	j	80002fec <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            } else {
                freeMemHead = firstFit->next;
    80002f90:	fe043783          	ld	a5,-32(s0)
    80002f94:	0007b703          	ld	a4,0(a5)
    80002f98:	0000a797          	auipc	a5,0xa
    80002f9c:	d0878793          	addi	a5,a5,-760 # 8000cca0 <_ZN15MemoryAllocator11freeMemHeadE>
    80002fa0:	00e7b023          	sd	a4,0(a5)
    80002fa4:	0480006f          	j	80002fec <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            }
        } else {
            remainderFree->size = remainingSize;
    80002fa8:	fc043783          	ld	a5,-64(s0)
    80002fac:	fb843703          	ld	a4,-72(s0)
    80002fb0:	00e7b423          	sd	a4,8(a5)
            remainderFree->next = firstFit->next;
    80002fb4:	fe043783          	ld	a5,-32(s0)
    80002fb8:	0007b703          	ld	a4,0(a5)
    80002fbc:	fc043783          	ld	a5,-64(s0)
    80002fc0:	00e7b023          	sd	a4,0(a5)
            if (prevFree) {
    80002fc4:	fe843783          	ld	a5,-24(s0)
    80002fc8:	00078a63          	beqz	a5,80002fdc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x130>
                prevFree->next = remainderFree;
    80002fcc:	fe843783          	ld	a5,-24(s0)
    80002fd0:	fc043703          	ld	a4,-64(s0)
    80002fd4:	00e7b023          	sd	a4,0(a5)
    80002fd8:	0140006f          	j	80002fec <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            } else {
                freeMemHead = remainderFree;
    80002fdc:	0000a797          	auipc	a5,0xa
    80002fe0:	cc478793          	addi	a5,a5,-828 # 8000cca0 <_ZN15MemoryAllocator11freeMemHeadE>
    80002fe4:	fc043703          	ld	a4,-64(s0)
    80002fe8:	00e7b023          	sd	a4,0(a5)
            }
        }
        //ubacivanje novog fragmenta u listu zauzetih fragmenata
        UsedMemSegment* newUsed = (UsedMemSegment*) firstFit;
    80002fec:	fe043783          	ld	a5,-32(s0)
    80002ff0:	faf43823          	sd	a5,-80(s0)
        newUsed->size = size;
    80002ff4:	fb043783          	ld	a5,-80(s0)
    80002ff8:	fa843703          	ld	a4,-88(s0)
    80002ffc:	00e7b423          	sd	a4,8(a5)
        newUsed->purpose = pur;
    80003000:	fb043783          	ld	a5,-80(s0)
    80003004:	fa442703          	lw	a4,-92(s0)
    80003008:	00e7a823          	sw	a4,16(a5)
        newUsed->usableFirstAddress = (char*) newUsed + sizeof(UsedMemSegment);
    8000300c:	fb043783          	ld	a5,-80(s0)
    80003010:	02078713          	addi	a4,a5,32
    80003014:	fb043783          	ld	a5,-80(s0)
    80003018:	00e7bc23          	sd	a4,24(a5)
        UsedMemSegment* prevUsed = nullptr;
    8000301c:	fc043c23          	sd	zero,-40(s0)
        for (UsedMemSegment* cur = usedMemHead;
    80003020:	0000a797          	auipc	a5,0xa
    80003024:	c7878793          	addi	a5,a5,-904 # 8000cc98 <_ZN15MemoryAllocator11usedMemHeadE>
    80003028:	0007b783          	ld	a5,0(a5)
    8000302c:	fcf43823          	sd	a5,-48(s0)
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
    80003030:	fd043783          	ld	a5,-48(s0)
    80003034:	02078463          	beqz	a5,8000305c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b0>
    80003038:	fd043703          	ld	a4,-48(s0)
    8000303c:	fb043783          	ld	a5,-80(s0)
    80003040:	00f77e63          	bgeu	a4,a5,8000305c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b0>
            prevUsed = cur;
    80003044:	fd043783          	ld	a5,-48(s0)
    80003048:	fcf43c23          	sd	a5,-40(s0)
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
    8000304c:	fd043783          	ld	a5,-48(s0)
    80003050:	0007b783          	ld	a5,0(a5)
    80003054:	fcf43823          	sd	a5,-48(s0)
        for (UsedMemSegment* cur = usedMemHead;
    80003058:	fd9ff06f          	j	80003030 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x184>
        }
        if (!prevUsed) {
    8000305c:	fd843783          	ld	a5,-40(s0)
    80003060:	02079663          	bnez	a5,8000308c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1e0>
            newUsed->next = usedMemHead;
    80003064:	0000a797          	auipc	a5,0xa
    80003068:	c3478793          	addi	a5,a5,-972 # 8000cc98 <_ZN15MemoryAllocator11usedMemHeadE>
    8000306c:	0007b703          	ld	a4,0(a5)
    80003070:	fb043783          	ld	a5,-80(s0)
    80003074:	00e7b023          	sd	a4,0(a5)
            usedMemHead = newUsed;
    80003078:	0000a797          	auipc	a5,0xa
    8000307c:	c2078793          	addi	a5,a5,-992 # 8000cc98 <_ZN15MemoryAllocator11usedMemHeadE>
    80003080:	fb043703          	ld	a4,-80(s0)
    80003084:	00e7b023          	sd	a4,0(a5)
    80003088:	0200006f          	j	800030a8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1fc>
        } else {
            newUsed->next = prevUsed->next;
    8000308c:	fd843783          	ld	a5,-40(s0)
    80003090:	0007b703          	ld	a4,0(a5)
    80003094:	fb043783          	ld	a5,-80(s0)
    80003098:	00e7b023          	sd	a4,0(a5)
            prevUsed->next = newUsed;
    8000309c:	fd843783          	ld	a5,-40(s0)
    800030a0:	fb043703          	ld	a4,-80(s0)
    800030a4:	00e7b023          	sd	a4,0(a5)
        }
        //return (char*)newUsed + sizeof(UsedMemSegment);
        return newUsed->usableFirstAddress;
    800030a8:	fb043783          	ld	a5,-80(s0)
    800030ac:	0187b783          	ld	a5,24(a5)
    800030b0:	0240006f          	j	800030d4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
        if (firstFit->size < size) continue;
    800030b4:	00000013          	nop
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
    800030b8:	fe043783          	ld	a5,-32(s0)
    800030bc:	fef43423          	sd	a5,-24(s0)
    800030c0:	fe043783          	ld	a5,-32(s0)
    800030c4:	0007b783          	ld	a5,0(a5)
    800030c8:	fef43023          	sd	a5,-32(s0)
    800030cc:	e51ff06f          	j	80002f1c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x70>
    }
    return nullptr;
    800030d0:	00000793          	li	a5,0
}
    800030d4:	00078513          	mv	a0,a5
    800030d8:	05813403          	ld	s0,88(sp)
    800030dc:	06010113          	addi	sp,sp,96
    800030e0:	00008067          	ret

00000000800030e4 <_ZN15MemoryAllocator5kfreeEPv>:

#pragma GCC optimize("O0")

int MemoryAllocator::kfree(void* ptr) {
    800030e4:	fb010113          	addi	sp,sp,-80
    800030e8:	04113423          	sd	ra,72(sp)
    800030ec:	04813023          	sd	s0,64(sp)
    800030f0:	05010413          	addi	s0,sp,80
    800030f4:	faa43c23          	sd	a0,-72(s0)
    if (!ptr) return 0;
    800030f8:	fb843783          	ld	a5,-72(s0)
    800030fc:	00079663          	bnez	a5,80003108 <_ZN15MemoryAllocator5kfreeEPv+0x24>
    80003100:	00000793          	li	a5,0
    80003104:	1740006f          	j	80003278 <_ZN15MemoryAllocator5kfreeEPv+0x194>
    if (!usedMemHead) return -1;
    80003108:	0000a797          	auipc	a5,0xa
    8000310c:	b9078793          	addi	a5,a5,-1136 # 8000cc98 <_ZN15MemoryAllocator11usedMemHeadE>
    80003110:	0007b783          	ld	a5,0(a5)
    80003114:	00079663          	bnez	a5,80003120 <_ZN15MemoryAllocator5kfreeEPv+0x3c>
    80003118:	fff00793          	li	a5,-1
    8000311c:	15c0006f          	j	80003278 <_ZN15MemoryAllocator5kfreeEPv+0x194>
    //ptr pokazuje na usableFirstAddress, pre toga je zaglavlje segmenta
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    80003120:	fb843783          	ld	a5,-72(s0)
    80003124:	fe078793          	addi	a5,a5,-32
    80003128:	faf43c23          	sd	a5,-72(s0)

    //trazenje adrese ptr u listi zauzetih segmenata
    UsedMemSegment* currentUsed = usedMemHead;
    8000312c:	0000a797          	auipc	a5,0xa
    80003130:	b6c78793          	addi	a5,a5,-1172 # 8000cc98 <_ZN15MemoryAllocator11usedMemHeadE>
    80003134:	0007b783          	ld	a5,0(a5)
    80003138:	fef43423          	sd	a5,-24(s0)
    UsedMemSegment* prevUsed = nullptr;
    8000313c:	fe043023          	sd	zero,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    80003140:	fe843783          	ld	a5,-24(s0)
    80003144:	02078463          	beqz	a5,8000316c <_ZN15MemoryAllocator5kfreeEPv+0x88>
    80003148:	fe843703          	ld	a4,-24(s0)
    8000314c:	fb843783          	ld	a5,-72(s0)
    80003150:	00f70e63          	beq	a4,a5,8000316c <_ZN15MemoryAllocator5kfreeEPv+0x88>
        prevUsed = currentUsed;
    80003154:	fe843783          	ld	a5,-24(s0)
    80003158:	fef43023          	sd	a5,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    8000315c:	fe843783          	ld	a5,-24(s0)
    80003160:	0007b783          	ld	a5,0(a5)
    80003164:	fef43423          	sd	a5,-24(s0)
    80003168:	fd9ff06f          	j	80003140 <_ZN15MemoryAllocator5kfreeEPv+0x5c>
    }
    if ((char*) currentUsed != (char*) ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    8000316c:	fe843703          	ld	a4,-24(s0)
    80003170:	fb843783          	ld	a5,-72(s0)
    80003174:	00f70663          	beq	a4,a5,80003180 <_ZN15MemoryAllocator5kfreeEPv+0x9c>
    80003178:	fff00793          	li	a5,-1
    8000317c:	0fc0006f          	j	80003278 <_ZN15MemoryAllocator5kfreeEPv+0x194>

    //izbacivanje iz liste zauzetih segmenata
    if (prevUsed) prevUsed->next = currentUsed->next;
    80003180:	fe043783          	ld	a5,-32(s0)
    80003184:	00078c63          	beqz	a5,8000319c <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    80003188:	fe843783          	ld	a5,-24(s0)
    8000318c:	0007b703          	ld	a4,0(a5)
    80003190:	fe043783          	ld	a5,-32(s0)
    80003194:	00e7b023          	sd	a4,0(a5)
    80003198:	0180006f          	j	800031b0 <_ZN15MemoryAllocator5kfreeEPv+0xcc>
    else usedMemHead = currentUsed->next;
    8000319c:	fe843783          	ld	a5,-24(s0)
    800031a0:	0007b703          	ld	a4,0(a5)
    800031a4:	0000a797          	auipc	a5,0xa
    800031a8:	af478793          	addi	a5,a5,-1292 # 8000cc98 <_ZN15MemoryAllocator11usedMemHeadE>
    800031ac:	00e7b023          	sd	a4,0(a5)

    //oslobadjanje segmenta i ubacivanje u listu slobodnih
    FreeMemSegment* prevFree = nullptr;
    800031b0:	fc043c23          	sd	zero,-40(s0)
    FreeMemSegment* nextFree = freeMemHead;
    800031b4:	0000a797          	auipc	a5,0xa
    800031b8:	aec78793          	addi	a5,a5,-1300 # 8000cca0 <_ZN15MemoryAllocator11freeMemHeadE>
    800031bc:	0007b783          	ld	a5,0(a5)
    800031c0:	fcf43823          	sd	a5,-48(s0)
    for (; nextFree && (char*) nextFree < (char*) ptr; prevFree = nextFree, nextFree = nextFree->next);
    800031c4:	fd043783          	ld	a5,-48(s0)
    800031c8:	02078463          	beqz	a5,800031f0 <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    800031cc:	fd043703          	ld	a4,-48(s0)
    800031d0:	fb843783          	ld	a5,-72(s0)
    800031d4:	00f77e63          	bgeu	a4,a5,800031f0 <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    800031d8:	fd043783          	ld	a5,-48(s0)
    800031dc:	fcf43c23          	sd	a5,-40(s0)
    800031e0:	fd043783          	ld	a5,-48(s0)
    800031e4:	0007b783          	ld	a5,0(a5)
    800031e8:	fcf43823          	sd	a5,-48(s0)
    800031ec:	fd9ff06f          	j	800031c4 <_ZN15MemoryAllocator5kfreeEPv+0xe0>
    FreeMemSegment* newFree = (FreeMemSegment*) ptr;
    800031f0:	fb843783          	ld	a5,-72(s0)
    800031f4:	fcf43423          	sd	a5,-56(s0)
    size_t segmentSize = ((UsedMemSegment*) ptr)->size;
    800031f8:	fb843783          	ld	a5,-72(s0)
    800031fc:	0087b783          	ld	a5,8(a5)
    80003200:	fcf43023          	sd	a5,-64(s0)
    newFree->size = segmentSize;
    80003204:	fc843783          	ld	a5,-56(s0)
    80003208:	fc043703          	ld	a4,-64(s0)
    8000320c:	00e7b423          	sd	a4,8(a5)
    if (prevFree) {
    80003210:	fd843783          	ld	a5,-40(s0)
    80003214:	02078263          	beqz	a5,80003238 <_ZN15MemoryAllocator5kfreeEPv+0x154>
        newFree->next = prevFree->next;
    80003218:	fd843783          	ld	a5,-40(s0)
    8000321c:	0007b703          	ld	a4,0(a5)
    80003220:	fc843783          	ld	a5,-56(s0)
    80003224:	00e7b023          	sd	a4,0(a5)
        prevFree->next = newFree;
    80003228:	fd843783          	ld	a5,-40(s0)
    8000322c:	fc843703          	ld	a4,-56(s0)
    80003230:	00e7b023          	sd	a4,0(a5)
    80003234:	0280006f          	j	8000325c <_ZN15MemoryAllocator5kfreeEPv+0x178>
    } else {
        newFree->next = freeMemHead;
    80003238:	0000a797          	auipc	a5,0xa
    8000323c:	a6878793          	addi	a5,a5,-1432 # 8000cca0 <_ZN15MemoryAllocator11freeMemHeadE>
    80003240:	0007b703          	ld	a4,0(a5)
    80003244:	fc843783          	ld	a5,-56(s0)
    80003248:	00e7b023          	sd	a4,0(a5)
        freeMemHead = newFree;
    8000324c:	0000a797          	auipc	a5,0xa
    80003250:	a5478793          	addi	a5,a5,-1452 # 8000cca0 <_ZN15MemoryAllocator11freeMemHeadE>
    80003254:	fc843703          	ld	a4,-56(s0)
    80003258:	00e7b023          	sd	a4,0(a5)
    }

    //spajanje uzastopnih slobodnih segmenata
    tryToJoin(newFree);
    8000325c:	fc843503          	ld	a0,-56(s0)
    80003260:	00000097          	auipc	ra,0x0
    80003264:	02c080e7          	jalr	44(ra) # 8000328c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    tryToJoin(prevFree);
    80003268:	fd843503          	ld	a0,-40(s0)
    8000326c:	00000097          	auipc	ra,0x0
    80003270:	020080e7          	jalr	32(ra) # 8000328c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    return 0;
    80003274:	00000793          	li	a5,0
}
    80003278:	00078513          	mv	a0,a5
    8000327c:	04813083          	ld	ra,72(sp)
    80003280:	04013403          	ld	s0,64(sp)
    80003284:	05010113          	addi	sp,sp,80
    80003288:	00008067          	ret

000000008000328c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:

#pragma GCC optimize("O0")

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    8000328c:	fc010113          	addi	sp,sp,-64
    80003290:	02813c23          	sd	s0,56(sp)
    80003294:	04010413          	addi	s0,sp,64
    80003298:	fca43423          	sd	a0,-56(s0)
    if (!current) return 0;
    8000329c:	fc843783          	ld	a5,-56(s0)
    800032a0:	00079663          	bnez	a5,800032ac <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x20>
    800032a4:	00000793          	li	a5,0
    800032a8:	0a00006f          	j	80003348 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xbc>
    bool nextExists = current->next != nullptr;
    800032ac:	fc843783          	ld	a5,-56(s0)
    800032b0:	0007b783          	ld	a5,0(a5)
    800032b4:	00f037b3          	snez	a5,a5
    800032b8:	fef407a3          	sb	a5,-17(s0)
    char* nextAddr = (char*) current + current->size;
    800032bc:	fc843783          	ld	a5,-56(s0)
    800032c0:	0087b783          	ld	a5,8(a5)
    800032c4:	fc843703          	ld	a4,-56(s0)
    800032c8:	00f707b3          	add	a5,a4,a5
    800032cc:	fef43023          	sd	a5,-32(s0)
    char* cnext = (char*) current->next;
    800032d0:	fc843783          	ld	a5,-56(s0)
    800032d4:	0007b783          	ld	a5,0(a5)
    800032d8:	fcf43c23          	sd	a5,-40(s0)
    bool nextIsConnected = (nextAddr == cnext);
    800032dc:	fe043703          	ld	a4,-32(s0)
    800032e0:	fd843783          	ld	a5,-40(s0)
    800032e4:	40f707b3          	sub	a5,a4,a5
    800032e8:	0017b793          	seqz	a5,a5
    800032ec:	fcf40ba3          	sb	a5,-41(s0)
    if (nextExists && nextIsConnected) {
    800032f0:	fef44783          	lbu	a5,-17(s0)
    800032f4:	0ff7f793          	andi	a5,a5,255
    800032f8:	04078663          	beqz	a5,80003344 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xb8>
    800032fc:	fd744783          	lbu	a5,-41(s0)
    80003300:	0ff7f793          	andi	a5,a5,255
    80003304:	04078063          	beqz	a5,80003344 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xb8>
        current->size += current->next->size;
    80003308:	fc843783          	ld	a5,-56(s0)
    8000330c:	0087b703          	ld	a4,8(a5)
    80003310:	fc843783          	ld	a5,-56(s0)
    80003314:	0007b783          	ld	a5,0(a5)
    80003318:	0087b783          	ld	a5,8(a5)
    8000331c:	00f70733          	add	a4,a4,a5
    80003320:	fc843783          	ld	a5,-56(s0)
    80003324:	00e7b423          	sd	a4,8(a5)
        current->next = current->next->next;
    80003328:	fc843783          	ld	a5,-56(s0)
    8000332c:	0007b783          	ld	a5,0(a5)
    80003330:	0007b703          	ld	a4,0(a5)
    80003334:	fc843783          	ld	a5,-56(s0)
    80003338:	00e7b023          	sd	a4,0(a5)
        return 1;
    8000333c:	00100793          	li	a5,1
    80003340:	0080006f          	j	80003348 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xbc>
    } else return 0;
    80003344:	00000793          	li	a5,0
}
    80003348:	00078513          	mv	a0,a5
    8000334c:	03813403          	ld	s0,56(sp)
    80003350:	04010113          	addi	sp,sp,64
    80003354:	00008067          	ret

0000000080003358 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>:

bool MemoryAllocator::checkPurpose(void* ptr, MemoryAllocator::Purpose p) {
    80003358:	fe010113          	addi	sp,sp,-32
    8000335c:	00813c23          	sd	s0,24(sp)
    80003360:	02010413          	addi	s0,sp,32
    80003364:	fea43423          	sd	a0,-24(s0)
    80003368:	00058793          	mv	a5,a1
    8000336c:	fef42223          	sw	a5,-28(s0)
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    80003370:	fe843783          	ld	a5,-24(s0)
    80003374:	fe078793          	addi	a5,a5,-32
    80003378:	fef43423          	sd	a5,-24(s0)
    return ((UsedMemSegment*) ptr)->purpose == p;
    8000337c:	fe843783          	ld	a5,-24(s0)
    80003380:	0107a703          	lw	a4,16(a5)
    80003384:	fe442783          	lw	a5,-28(s0)
    80003388:	0007879b          	sext.w	a5,a5
    8000338c:	40e787b3          	sub	a5,a5,a4
    80003390:	0017b793          	seqz	a5,a5
    80003394:	0ff7f793          	andi	a5,a5,255
}
    80003398:	00078513          	mv	a0,a5
    8000339c:	01813403          	ld	s0,24(sp)
    800033a0:	02010113          	addi	sp,sp,32
    800033a4:	00008067          	ret

00000000800033a8 <_ZN15MemoryAllocator19initMemoryAllocatorEv>:

void MemoryAllocator::initMemoryAllocator() {
    800033a8:	ff010113          	addi	sp,sp,-16
    800033ac:	00813423          	sd	s0,8(sp)
    800033b0:	01010413          	addi	s0,sp,16
//pocetna inicijalizacija
    if (!initialized) {
    800033b4:	0000a797          	auipc	a5,0xa
    800033b8:	8f478793          	addi	a5,a5,-1804 # 8000cca8 <_ZN15MemoryAllocator11initializedE>
    800033bc:	0007c783          	lbu	a5,0(a5)
    800033c0:	0017c793          	xori	a5,a5,1
    800033c4:	0ff7f793          	andi	a5,a5,255
    800033c8:	06078a63          	beqz	a5,8000343c <_ZN15MemoryAllocator19initMemoryAllocatorEv+0x94>
        freeMemHead = (FreeMemSegment*) HEAP_START_ADDR;
    800033cc:	00009797          	auipc	a5,0x9
    800033d0:	7147b783          	ld	a5,1812(a5) # 8000cae0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800033d4:	0007b703          	ld	a4,0(a5)
    800033d8:	0000a797          	auipc	a5,0xa
    800033dc:	8c878793          	addi	a5,a5,-1848 # 8000cca0 <_ZN15MemoryAllocator11freeMemHeadE>
    800033e0:	00e7b023          	sd	a4,0(a5)
        freeMemHead->next = nullptr;
    800033e4:	0000a797          	auipc	a5,0xa
    800033e8:	8bc78793          	addi	a5,a5,-1860 # 8000cca0 <_ZN15MemoryAllocator11freeMemHeadE>
    800033ec:	0007b783          	ld	a5,0(a5)
    800033f0:	0007b023          	sd	zero,0(a5)
        //freeMemHead->prev = nullptr;
        freeMemHead->size = (char*) HEAP_END_ADDR - (char*) HEAP_START_ADDR;//- sizeof(FreeMemSegment);
    800033f4:	00009797          	auipc	a5,0x9
    800033f8:	7247b783          	ld	a5,1828(a5) # 8000cb18 <_GLOBAL_OFFSET_TABLE_+0x60>
    800033fc:	0007b703          	ld	a4,0(a5)
    80003400:	00009797          	auipc	a5,0x9
    80003404:	6e07b783          	ld	a5,1760(a5) # 8000cae0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003408:	0007b783          	ld	a5,0(a5)
    8000340c:	40f70733          	sub	a4,a4,a5
    80003410:	0000a797          	auipc	a5,0xa
    80003414:	89078793          	addi	a5,a5,-1904 # 8000cca0 <_ZN15MemoryAllocator11freeMemHeadE>
    80003418:	0007b783          	ld	a5,0(a5)
    8000341c:	00e7b423          	sd	a4,8(a5)
        usedMemHead = nullptr;
    80003420:	0000a797          	auipc	a5,0xa
    80003424:	87878793          	addi	a5,a5,-1928 # 8000cc98 <_ZN15MemoryAllocator11usedMemHeadE>
    80003428:	0007b023          	sd	zero,0(a5)

        initialized = true;
    8000342c:	0000a797          	auipc	a5,0xa
    80003430:	87c78793          	addi	a5,a5,-1924 # 8000cca8 <_ZN15MemoryAllocator11initializedE>
    80003434:	00100713          	li	a4,1
    80003438:	00e78023          	sb	a4,0(a5)
    }
}
    8000343c:	00000013          	nop
    80003440:	00813403          	ld	s0,8(sp)
    80003444:	01010113          	addi	sp,sp,16
    80003448:	00008067          	ret

000000008000344c <_ZN4KSemnwEm>:

#include "../h/KSem.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void* KSem::operator new(size_t size) {
    8000344c:	ff010113          	addi	sp,sp,-16
    80003450:	00113423          	sd	ra,8(sp)
    80003454:	00813023          	sd	s0,0(sp)
    80003458:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    8000345c:	ffffe097          	auipc	ra,0xffffe
    80003460:	eb4080e7          	jalr	-332(ra) # 80001310 <_Z9mem_allocm>
	//return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::SEMAPHORE);
}
    80003464:	00813083          	ld	ra,8(sp)
    80003468:	00013403          	ld	s0,0(sp)
    8000346c:	01010113          	addi	sp,sp,16
    80003470:	00008067          	ret

0000000080003474 <_ZN4KSemdlEPv>:

void KSem::operator delete(void* ptr) {
    80003474:	ff010113          	addi	sp,sp,-16
    80003478:	00113423          	sd	ra,8(sp)
    8000347c:	00813023          	sd	s0,0(sp)
    80003480:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80003484:	ffffe097          	auipc	ra,0xffffe
    80003488:	ecc080e7          	jalr	-308(ra) # 80001350 <_Z8mem_freePv>
	//MemoryAllocator::kfree(ptr);
}
    8000348c:	00813083          	ld	ra,8(sp)
    80003490:	00013403          	ld	s0,0(sp)
    80003494:	01010113          	addi	sp,sp,16
    80003498:	00008067          	ret

000000008000349c <_ZN4KSem7initSemEj>:

KSem* KSem::initSem(uint val) {
    8000349c:	fe010113          	addi	sp,sp,-32
    800034a0:	00113c23          	sd	ra,24(sp)
    800034a4:	00813823          	sd	s0,16(sp)
    800034a8:	00913423          	sd	s1,8(sp)
    800034ac:	02010413          	addi	s0,sp,32
    800034b0:	00050493          	mv	s1,a0
	return new KSem(val);
    800034b4:	02000513          	li	a0,32
    800034b8:	00000097          	auipc	ra,0x0
    800034bc:	f94080e7          	jalr	-108(ra) # 8000344c <_ZN4KSemnwEm>
	void block();

	void unblock();

private:
	KSem(uint val) : val(val), working(true) {}
    800034c0:	00952023          	sw	s1,0(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    800034c4:	00053423          	sd	zero,8(a0)
    800034c8:	00053823          	sd	zero,16(a0)
    800034cc:	00100713          	li	a4,1
    800034d0:	00e50c23          	sb	a4,24(a0)
}
    800034d4:	01813083          	ld	ra,24(sp)
    800034d8:	01013403          	ld	s0,16(sp)
    800034dc:	00813483          	ld	s1,8(sp)
    800034e0:	02010113          	addi	sp,sp,32
    800034e4:	00008067          	ret

00000000800034e8 <_ZN4KSem5blockEv>:
		unblock();
	}
	return 0;
}

void KSem::block() {
    800034e8:	ff010113          	addi	sp,sp,-16
    800034ec:	00113423          	sd	ra,8(sp)
    800034f0:	00813023          	sd	s0,0(sp)
    800034f4:	01010413          	addi	s0,sp,16
	//TCB::running->setBlocked(true);
    TCB::running->setStatus(TCB::BLOCKED);
    800034f8:	00009797          	auipc	a5,0x9
    800034fc:	6187b783          	ld	a5,1560(a5) # 8000cb10 <_GLOBAL_OFFSET_TABLE_+0x58>
    80003500:	0007b583          	ld	a1,0(a5)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    80003504:	00200793          	li	a5,2
    80003508:	04f5ac23          	sw	a5,88(a1)
	blocked.putLast(TCB::running);
    8000350c:	00850513          	addi	a0,a0,8
    80003510:	ffffe097          	auipc	ra,0xffffe
    80003514:	d34080e7          	jalr	-716(ra) # 80001244 <_ZN11ThreadQueue7putLastEP3TCB>
	TCB::yield();
    80003518:	fffff097          	auipc	ra,0xfffff
    8000351c:	74c080e7          	jalr	1868(ra) # 80002c64 <_ZN3TCB5yieldEv>
}
    80003520:	00813083          	ld	ra,8(sp)
    80003524:	00013403          	ld	s0,0(sp)
    80003528:	01010113          	addi	sp,sp,16
    8000352c:	00008067          	ret

0000000080003530 <_ZN4KSem4waitEv>:
	if (!working) return -3;
    80003530:	01854783          	lbu	a5,24(a0)
    80003534:	04078663          	beqz	a5,80003580 <_ZN4KSem4waitEv+0x50>
	if (--val < 0) {
    80003538:	00052783          	lw	a5,0(a0)
    8000353c:	fff7879b          	addiw	a5,a5,-1
    80003540:	00f52023          	sw	a5,0(a0)
    80003544:	02079713          	slli	a4,a5,0x20
    80003548:	00074663          	bltz	a4,80003554 <_ZN4KSem4waitEv+0x24>
	return 0;
    8000354c:	00000513          	li	a0,0
}
    80003550:	00008067          	ret
int KSem::wait() {
    80003554:	ff010113          	addi	sp,sp,-16
    80003558:	00113423          	sd	ra,8(sp)
    8000355c:	00813023          	sd	s0,0(sp)
    80003560:	01010413          	addi	s0,sp,16
		block();
    80003564:	00000097          	auipc	ra,0x0
    80003568:	f84080e7          	jalr	-124(ra) # 800034e8 <_ZN4KSem5blockEv>
		return -1;
    8000356c:	fff00513          	li	a0,-1
}
    80003570:	00813083          	ld	ra,8(sp)
    80003574:	00013403          	ld	s0,0(sp)
    80003578:	01010113          	addi	sp,sp,16
    8000357c:	00008067          	ret
	if (!working) return -3;
    80003580:	ffd00513          	li	a0,-3
    80003584:	00008067          	ret

0000000080003588 <_ZN4KSem7unblockEv>:

void KSem::unblock() {
    80003588:	ff010113          	addi	sp,sp,-16
    8000358c:	00113423          	sd	ra,8(sp)
    80003590:	00813023          	sd	s0,0(sp)
    80003594:	01010413          	addi	s0,sp,16
	TCB* tcb = blocked.getFirst();
    80003598:	00850513          	addi	a0,a0,8
    8000359c:	ffffe097          	auipc	ra,0xffffe
    800035a0:	d14080e7          	jalr	-748(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
    800035a4:	00100793          	li	a5,1
    800035a8:	04f52c23          	sw	a5,88(a0)
	//tcb->setBlocked(false);
    tcb->setStatus(TCB::ACTIVE);
	Scheduler::put(tcb);
    800035ac:	ffffe097          	auipc	ra,0xffffe
    800035b0:	4a4080e7          	jalr	1188(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
}
    800035b4:	00813083          	ld	ra,8(sp)
    800035b8:	00013403          	ld	s0,0(sp)
    800035bc:	01010113          	addi	sp,sp,16
    800035c0:	00008067          	ret

00000000800035c4 <_ZN4KSem6signalEv>:
	if (!working) return -3;
    800035c4:	01854783          	lbu	a5,24(a0)
    800035c8:	04078463          	beqz	a5,80003610 <_ZN4KSem6signalEv+0x4c>
	if (val++ < 0) {
    800035cc:	00052783          	lw	a5,0(a0)
    800035d0:	0017871b          	addiw	a4,a5,1
    800035d4:	00e52023          	sw	a4,0(a0)
    800035d8:	0007c663          	bltz	a5,800035e4 <_ZN4KSem6signalEv+0x20>
	return 0;
    800035dc:	00000513          	li	a0,0
}
    800035e0:	00008067          	ret
int KSem::signal() {
    800035e4:	ff010113          	addi	sp,sp,-16
    800035e8:	00113423          	sd	ra,8(sp)
    800035ec:	00813023          	sd	s0,0(sp)
    800035f0:	01010413          	addi	s0,sp,16
		unblock();
    800035f4:	00000097          	auipc	ra,0x0
    800035f8:	f94080e7          	jalr	-108(ra) # 80003588 <_ZN4KSem7unblockEv>
	return 0;
    800035fc:	00000513          	li	a0,0
}
    80003600:	00813083          	ld	ra,8(sp)
    80003604:	00013403          	ld	s0,0(sp)
    80003608:	01010113          	addi	sp,sp,16
    8000360c:	00008067          	ret
	if (!working) return -3;
    80003610:	ffd00513          	li	a0,-3
    80003614:	00008067          	ret

0000000080003618 <_ZN4KSem8closeSemEPS_>:

int KSem::closeSem(sem_t handle) {
    80003618:	fe010113          	addi	sp,sp,-32
    8000361c:	00113c23          	sd	ra,24(sp)
    80003620:	00813823          	sd	s0,16(sp)
    80003624:	00913423          	sd	s1,8(sp)
    80003628:	02010413          	addi	s0,sp,32
    8000362c:	00050493          	mv	s1,a0
	//if (!MemoryAllocator::checkPurpose(handle, MemoryAllocator::SEMAPHORE)) return -2;
	handle->working = false;
    80003630:	00050c23          	sb	zero,24(a0)
        bool ret = front == nullptr;
    80003634:	0084b783          	ld	a5,8(s1)
	while (!handle->blocked.isEmpty()) {
    80003638:	02078263          	beqz	a5,8000365c <_ZN4KSem8closeSemEPS_+0x44>
		TCB* tcb = handle->blocked.getFirst();
    8000363c:	00848513          	addi	a0,s1,8
    80003640:	ffffe097          	auipc	ra,0xffffe
    80003644:	c70080e7          	jalr	-912(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
    80003648:	00100793          	li	a5,1
    8000364c:	04f52c23          	sw	a5,88(a0)
		//tcb->setBlocked(false);
        tcb->setStatus(TCB::ACTIVE);
		Scheduler::put(tcb);
    80003650:	ffffe097          	auipc	ra,0xffffe
    80003654:	400080e7          	jalr	1024(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
	while (!handle->blocked.isEmpty()) {
    80003658:	fddff06f          	j	80003634 <_ZN4KSem8closeSemEPS_+0x1c>
	}
	return 0;
}
    8000365c:	00000513          	li	a0,0
    80003660:	01813083          	ld	ra,24(sp)
    80003664:	01013403          	ld	s0,16(sp)
    80003668:	00813483          	ld	s1,8(sp)
    8000366c:	02010113          	addi	sp,sp,32
    80003670:	00008067          	ret

0000000080003674 <_Z10testMemoryv>:
    return pok;
}

#pragma GCC optimize("O0")

void testMemory() {
    80003674:	e6010113          	addi	sp,sp,-416
    80003678:	18113c23          	sd	ra,408(sp)
    8000367c:	18813823          	sd	s0,400(sp)
    80003680:	1a010413          	addi	s0,sp,416
    char* pokazivaci[50];
    pokazivaci[0] = nullptr;
    80003684:	e6043023          	sd	zero,-416(s0)
    pokazivaci[0] = upisi(1024 + 768);
    80003688:	70000513          	li	a0,1792
    8000368c:	00000097          	auipc	ra,0x0
    80003690:	1f8080e7          	jalr	504(ra) # 80003884 <_Z5upisim>
    80003694:	00050793          	mv	a5,a0
    80003698:	e6f43023          	sd	a5,-416(s0)
    if (pokazivaci[0]) {
    8000369c:	e6043783          	ld	a5,-416(s0)
    800036a0:	02078c63          	beqz	a5,800036d8 <_Z10testMemoryv+0x64>
        if (pokazivaci[0][0] == '8') {
    800036a4:	e6043783          	ld	a5,-416(s0)
    800036a8:	0007c783          	lbu	a5,0(a5)
    800036ac:	00078713          	mv	a4,a5
    800036b0:	03800793          	li	a5,56
    800036b4:	00f71a63          	bne	a4,a5,800036c8 <_Z10testMemoryv+0x54>
            printString("nea");
    800036b8:	00007517          	auipc	a0,0x7
    800036bc:	b4850513          	addi	a0,a0,-1208 # 8000a200 <_ZZ9kPrintIntmE6digits+0x190>
    800036c0:	00002097          	auipc	ra,0x2
    800036c4:	6b4080e7          	jalr	1716(ra) # 80005d74 <_Z11printStringPKc>
        }
        MemoryAllocator::kfree(pokazivaci[0]);
    800036c8:	e6043783          	ld	a5,-416(s0)
    800036cc:	00078513          	mv	a0,a5
    800036d0:	00000097          	auipc	ra,0x0
    800036d4:	a14080e7          	jalr	-1516(ra) # 800030e4 <_ZN15MemoryAllocator5kfreeEPv>
    }


    pokazivaci[0] = upisi(4096);
    800036d8:	00001537          	lui	a0,0x1
    800036dc:	00000097          	auipc	ra,0x0
    800036e0:	1a8080e7          	jalr	424(ra) # 80003884 <_Z5upisim>
    800036e4:	00050793          	mv	a5,a0
    800036e8:	e6f43023          	sd	a5,-416(s0)
    if (pokazivaci[0]) {
    800036ec:	e6043783          	ld	a5,-416(s0)
    800036f0:	00078a63          	beqz	a5,80003704 <_Z10testMemoryv+0x90>
        MemoryAllocator::kfree(pokazivaci[0]);
    800036f4:	e6043783          	ld	a5,-416(s0)
    800036f8:	00078513          	mv	a0,a5
    800036fc:	00000097          	auipc	ra,0x0
    80003700:	9e8080e7          	jalr	-1560(ra) # 800030e4 <_ZN15MemoryAllocator5kfreeEPv>
    }

    pokazivaci[0] = upisi(1024 + 768);
    80003704:	70000513          	li	a0,1792
    80003708:	00000097          	auipc	ra,0x0
    8000370c:	17c080e7          	jalr	380(ra) # 80003884 <_Z5upisim>
    80003710:	00050793          	mv	a5,a0
    80003714:	e6f43023          	sd	a5,-416(s0)
    MemoryAllocator::kfree(pokazivaci[0]);
    80003718:	e6043783          	ld	a5,-416(s0)
    8000371c:	00078513          	mv	a0,a5
    80003720:	00000097          	auipc	ra,0x0
    80003724:	9c4080e7          	jalr	-1596(ra) # 800030e4 <_ZN15MemoryAllocator5kfreeEPv>

}
    80003728:	00000013          	nop
    8000372c:	19813083          	ld	ra,408(sp)
    80003730:	19013403          	ld	s0,400(sp)
    80003734:	1a010113          	addi	sp,sp,416
    80003738:	00008067          	ret

000000008000373c <_Z5nit1fPv>:

void nit1f(void*) {
    8000373c:	fe010113          	addi	sp,sp,-32
    80003740:	00113c23          	sd	ra,24(sp)
    80003744:	00813823          	sd	s0,16(sp)
    80003748:	02010413          	addi	s0,sp,32
    8000374c:	fea43423          	sd	a0,-24(s0)
//		printString("\nsem_wait za nit 1 vratio ");
//		printInteger(res);
//		printString("\n");
//	}

    printString("\nGotova nit 1\n");
    80003750:	00007517          	auipc	a0,0x7
    80003754:	ab850513          	addi	a0,a0,-1352 # 8000a208 <_ZZ9kPrintIntmE6digits+0x198>
    80003758:	00002097          	auipc	ra,0x2
    8000375c:	61c080e7          	jalr	1564(ra) # 80005d74 <_Z11printStringPKc>
}
    80003760:	00000013          	nop
    80003764:	01813083          	ld	ra,24(sp)
    80003768:	01013403          	ld	s0,16(sp)
    8000376c:	02010113          	addi	sp,sp,32
    80003770:	00008067          	ret

0000000080003774 <_Z5nit2fPv>:

void nit2f(void* arg2) {
    80003774:	fe010113          	addi	sp,sp,-32
    80003778:	00113c23          	sd	ra,24(sp)
    8000377c:	00813823          	sd	s0,16(sp)
    80003780:	02010413          	addi	s0,sp,32
    80003784:	fea43423          	sd	a0,-24(s0)
//		//sem_close(semA);
//		printString("\nNit 2 ubija semafor\n");
//		delete semA;
//
//	}
    printString("\nGotova nit 2\n");
    80003788:	00007517          	auipc	a0,0x7
    8000378c:	a9050513          	addi	a0,a0,-1392 # 8000a218 <_ZZ9kPrintIntmE6digits+0x1a8>
    80003790:	00002097          	auipc	ra,0x2
    80003794:	5e4080e7          	jalr	1508(ra) # 80005d74 <_Z11printStringPKc>
}
    80003798:	00000013          	nop
    8000379c:	01813083          	ld	ra,24(sp)
    800037a0:	01013403          	ld	s0,16(sp)
    800037a4:	02010113          	addi	sp,sp,32
    800037a8:	00008067          	ret

00000000800037ac <_Z5nit3fPv>:


void nit3f(void*) {
    800037ac:	fd010113          	addi	sp,sp,-48
    800037b0:	02113423          	sd	ra,40(sp)
    800037b4:	02813023          	sd	s0,32(sp)
    800037b8:	03010413          	addi	s0,sp,48
    800037bc:	fca43c23          	sd	a0,-40(s0)
    char slovo;
    do {
        slovo = getc();
    800037c0:	ffffe097          	auipc	ra,0xffffe
    800037c4:	da8080e7          	jalr	-600(ra) # 80001568 <_Z4getcv>
    800037c8:	00050793          	mv	a5,a0
    800037cc:	fef407a3          	sb	a5,-17(s0)
        putc(slovo);
    800037d0:	fef44783          	lbu	a5,-17(s0)
    800037d4:	00078513          	mv	a0,a5
    800037d8:	ffffe097          	auipc	ra,0xffffe
    800037dc:	db8080e7          	jalr	-584(ra) # 80001590 <_Z4putcc>
        if (slovo == '\r') putc('\n');
    800037e0:	fef44783          	lbu	a5,-17(s0)
    800037e4:	0ff7f713          	andi	a4,a5,255
    800037e8:	00d00793          	li	a5,13
    800037ec:	00f71863          	bne	a4,a5,800037fc <_Z5nit3fPv+0x50>
    800037f0:	00a00513          	li	a0,10
    800037f4:	ffffe097          	auipc	ra,0xffffe
    800037f8:	d9c080e7          	jalr	-612(ra) # 80001590 <_Z4putcc>
    } while (slovo != '0');
    800037fc:	fef44783          	lbu	a5,-17(s0)
    80003800:	0ff7f713          	andi	a4,a5,255
    80003804:	03000793          	li	a5,48
    80003808:	00f70463          	beq	a4,a5,80003810 <_Z5nit3fPv+0x64>
    do {
    8000380c:	fb5ff06f          	j	800037c0 <_Z5nit3fPv+0x14>

    printString("\nGotova nit3\n");
    80003810:	00007517          	auipc	a0,0x7
    80003814:	a1850513          	addi	a0,a0,-1512 # 8000a228 <_ZZ9kPrintIntmE6digits+0x1b8>
    80003818:	00002097          	auipc	ra,0x2
    8000381c:	55c080e7          	jalr	1372(ra) # 80005d74 <_Z11printStringPKc>
}
    80003820:	00000013          	nop
    80003824:	02813083          	ld	ra,40(sp)
    80003828:	02013403          	ld	s0,32(sp)
    8000382c:	03010113          	addi	sp,sp,48
    80003830:	00008067          	ret

0000000080003834 <_Z8testMainv>:

int testMain() {
    80003834:	ff010113          	addi	sp,sp,-16
    80003838:	00113423          	sd	ra,8(sp)
    8000383c:	00813023          	sd	s0,0(sp)
    80003840:	01010413          	addi	s0,sp,16
//postavi adresu prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80003844:	00009797          	auipc	a5,0x9
    80003848:	2dc7b783          	ld	a5,732(a5) # 8000cb20 <_GLOBAL_OFFSET_TABLE_+0x68>
    8000384c:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    MemoryAllocator::initMemoryAllocator();
    80003850:	00000097          	auipc	ra,0x0
    80003854:	b58080e7          	jalr	-1192(ra) # 800033a8 <_ZN15MemoryAllocator19initMemoryAllocatorEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    80003858:	ffffe097          	auipc	ra,0xffffe
    8000385c:	e08080e7          	jalr	-504(ra) # 80001660 <_ZN8KConsole12initKConsoleEv>
//	printString("\nGotove user niti\n");
//
//	printString("\nSad cu da izadjem\n");
//	while(KConsole::outputHead!=KConsole::outputTail){}
//	//zabrani prekide
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    80003860:	00200513          	li	a0,2
    80003864:	00000097          	auipc	ra,0x0
    80003868:	07c080e7          	jalr	124(ra) # 800038e0 <_ZN5Riscv10mc_sstatusEm>


    return 0;
    8000386c:	00000793          	li	a5,0
    80003870:	00078513          	mv	a0,a5
    80003874:	00813083          	ld	ra,8(sp)
    80003878:	00013403          	ld	s0,0(sp)
    8000387c:	01010113          	addi	sp,sp,16
    80003880:	00008067          	ret

0000000080003884 <_Z5upisim>:
char* upisi(size_t alociraj) {
    80003884:	fe010113          	addi	sp,sp,-32
    80003888:	00113c23          	sd	ra,24(sp)
    8000388c:	00813823          	sd	s0,16(sp)
    80003890:	00913423          	sd	s1,8(sp)
    80003894:	02010413          	addi	s0,sp,32
    80003898:	00050493          	mv	s1,a0
    char* pok = (char*) MemoryAllocator::kmalloc(alociraj);
    8000389c:	00300593          	li	a1,3
    800038a0:	fffff097          	auipc	ra,0xfffff
    800038a4:	60c080e7          	jalr	1548(ra) # 80002eac <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
    if (pok) {
    800038a8:	02050263          	beqz	a0,800038cc <_Z5upisim+0x48>
        for (uint64 i = 0; i < alociraj - sizeof(MemoryAllocator::UsedMemSegment); i++) {
    800038ac:	00000793          	li	a5,0
    800038b0:	0140006f          	j	800038c4 <_Z5upisim+0x40>
            pok[i] = '8';
    800038b4:	00f50733          	add	a4,a0,a5
    800038b8:	03800693          	li	a3,56
    800038bc:	00d70023          	sb	a3,0(a4)
        for (uint64 i = 0; i < alociraj - sizeof(MemoryAllocator::UsedMemSegment); i++) {
    800038c0:	00178793          	addi	a5,a5,1
    800038c4:	fe048713          	addi	a4,s1,-32
    800038c8:	fee7e6e3          	bltu	a5,a4,800038b4 <_Z5upisim+0x30>
}
    800038cc:	01813083          	ld	ra,24(sp)
    800038d0:	01013403          	ld	s0,16(sp)
    800038d4:	00813483          	ld	s1,8(sp)
    800038d8:	02010113          	addi	sp,sp,32
    800038dc:	00008067          	ret

00000000800038e0 <_ZN5Riscv10mc_sstatusEm>:
inline void Riscv::mc_sstatus(uint64 mask) {
    800038e0:	ff010113          	addi	sp,sp,-16
    800038e4:	00813423          	sd	s0,8(sp)
    800038e8:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    800038ec:	10053073          	csrc	sstatus,a0
}
    800038f0:	00813403          	ld	s0,8(sp)
    800038f4:	01010113          	addi	sp,sp,16
    800038f8:	00008067          	ret

00000000800038fc <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    800038fc:	fe010113          	addi	sp,sp,-32
    80003900:	00113c23          	sd	ra,24(sp)
    80003904:	00813823          	sd	s0,16(sp)
    80003908:	00913423          	sd	s1,8(sp)
    8000390c:	01213023          	sd	s2,0(sp)
    80003910:	02010413          	addi	s0,sp,32
    80003914:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80003918:	00000913          	li	s2,0
    8000391c:	00c0006f          	j	80003928 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003920:	ffffe097          	auipc	ra,0xffffe
    80003924:	b08080e7          	jalr	-1272(ra) # 80001428 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
    80003928:	ffffe097          	auipc	ra,0xffffe
    8000392c:	c40080e7          	jalr	-960(ra) # 80001568 <_Z4getcv>
    80003930:	0005059b          	sext.w	a1,a0
    80003934:	02d00793          	li	a5,45
    80003938:	02f58a63          	beq	a1,a5,8000396c <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    8000393c:	0084b503          	ld	a0,8(s1)
    80003940:	00003097          	auipc	ra,0x3
    80003944:	400080e7          	jalr	1024(ra) # 80006d40 <_ZN6Buffer3putEi>
        i++;
    80003948:	0019071b          	addiw	a4,s2,1
    8000394c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003950:	0004a683          	lw	a3,0(s1)
    80003954:	0026979b          	slliw	a5,a3,0x2
    80003958:	00d787bb          	addw	a5,a5,a3
    8000395c:	0017979b          	slliw	a5,a5,0x1
    80003960:	02f767bb          	remw	a5,a4,a5
    80003964:	fc0792e3          	bnez	a5,80003928 <_ZL16producerKeyboardPv+0x2c>
    80003968:	fb9ff06f          	j	80003920 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    8000396c:	00100793          	li	a5,1
    80003970:	00009717          	auipc	a4,0x9
    80003974:	34f72023          	sw	a5,832(a4) # 8000ccb0 <_ZL9threadEnd>
    data->buffer->put('!');
    80003978:	02100593          	li	a1,33
    8000397c:	0084b503          	ld	a0,8(s1)
    80003980:	00003097          	auipc	ra,0x3
    80003984:	3c0080e7          	jalr	960(ra) # 80006d40 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80003988:	0104b503          	ld	a0,16(s1)
    8000398c:	ffffe097          	auipc	ra,0xffffe
    80003990:	bac080e7          	jalr	-1108(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    80003994:	01813083          	ld	ra,24(sp)
    80003998:	01013403          	ld	s0,16(sp)
    8000399c:	00813483          	ld	s1,8(sp)
    800039a0:	00013903          	ld	s2,0(sp)
    800039a4:	02010113          	addi	sp,sp,32
    800039a8:	00008067          	ret

00000000800039ac <_ZL8producerPv>:

static void producer(void *arg) {
    800039ac:	fe010113          	addi	sp,sp,-32
    800039b0:	00113c23          	sd	ra,24(sp)
    800039b4:	00813823          	sd	s0,16(sp)
    800039b8:	00913423          	sd	s1,8(sp)
    800039bc:	01213023          	sd	s2,0(sp)
    800039c0:	02010413          	addi	s0,sp,32
    800039c4:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800039c8:	00000913          	li	s2,0
    800039cc:	00c0006f          	j	800039d8 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    800039d0:	ffffe097          	auipc	ra,0xffffe
    800039d4:	a58080e7          	jalr	-1448(ra) # 80001428 <_Z15thread_dispatchv>
    while (!threadEnd) {
    800039d8:	00009797          	auipc	a5,0x9
    800039dc:	2d87a783          	lw	a5,728(a5) # 8000ccb0 <_ZL9threadEnd>
    800039e0:	02079e63          	bnez	a5,80003a1c <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    800039e4:	0004a583          	lw	a1,0(s1)
    800039e8:	0305859b          	addiw	a1,a1,48
    800039ec:	0084b503          	ld	a0,8(s1)
    800039f0:	00003097          	auipc	ra,0x3
    800039f4:	350080e7          	jalr	848(ra) # 80006d40 <_ZN6Buffer3putEi>
        i++;
    800039f8:	0019071b          	addiw	a4,s2,1
    800039fc:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003a00:	0004a683          	lw	a3,0(s1)
    80003a04:	0026979b          	slliw	a5,a3,0x2
    80003a08:	00d787bb          	addw	a5,a5,a3
    80003a0c:	0017979b          	slliw	a5,a5,0x1
    80003a10:	02f767bb          	remw	a5,a4,a5
    80003a14:	fc0792e3          	bnez	a5,800039d8 <_ZL8producerPv+0x2c>
    80003a18:	fb9ff06f          	j	800039d0 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80003a1c:	0104b503          	ld	a0,16(s1)
    80003a20:	ffffe097          	auipc	ra,0xffffe
    80003a24:	b18080e7          	jalr	-1256(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    80003a28:	01813083          	ld	ra,24(sp)
    80003a2c:	01013403          	ld	s0,16(sp)
    80003a30:	00813483          	ld	s1,8(sp)
    80003a34:	00013903          	ld	s2,0(sp)
    80003a38:	02010113          	addi	sp,sp,32
    80003a3c:	00008067          	ret

0000000080003a40 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80003a40:	fd010113          	addi	sp,sp,-48
    80003a44:	02113423          	sd	ra,40(sp)
    80003a48:	02813023          	sd	s0,32(sp)
    80003a4c:	00913c23          	sd	s1,24(sp)
    80003a50:	01213823          	sd	s2,16(sp)
    80003a54:	01313423          	sd	s3,8(sp)
    80003a58:	03010413          	addi	s0,sp,48
    80003a5c:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003a60:	00000993          	li	s3,0
    80003a64:	01c0006f          	j	80003a80 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80003a68:	ffffe097          	auipc	ra,0xffffe
    80003a6c:	9c0080e7          	jalr	-1600(ra) # 80001428 <_Z15thread_dispatchv>
    80003a70:	0500006f          	j	80003ac0 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80003a74:	00a00513          	li	a0,10
    80003a78:	ffffe097          	auipc	ra,0xffffe
    80003a7c:	b18080e7          	jalr	-1256(ra) # 80001590 <_Z4putcc>
    while (!threadEnd) {
    80003a80:	00009797          	auipc	a5,0x9
    80003a84:	2307a783          	lw	a5,560(a5) # 8000ccb0 <_ZL9threadEnd>
    80003a88:	06079063          	bnez	a5,80003ae8 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    80003a8c:	00893503          	ld	a0,8(s2)
    80003a90:	00003097          	auipc	ra,0x3
    80003a94:	340080e7          	jalr	832(ra) # 80006dd0 <_ZN6Buffer3getEv>
        i++;
    80003a98:	0019849b          	addiw	s1,s3,1
    80003a9c:	0004899b          	sext.w	s3,s1
        putc(key);
    80003aa0:	0ff57513          	andi	a0,a0,255
    80003aa4:	ffffe097          	auipc	ra,0xffffe
    80003aa8:	aec080e7          	jalr	-1300(ra) # 80001590 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80003aac:	00092703          	lw	a4,0(s2)
    80003ab0:	0027179b          	slliw	a5,a4,0x2
    80003ab4:	00e787bb          	addw	a5,a5,a4
    80003ab8:	02f4e7bb          	remw	a5,s1,a5
    80003abc:	fa0786e3          	beqz	a5,80003a68 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80003ac0:	05000793          	li	a5,80
    80003ac4:	02f4e4bb          	remw	s1,s1,a5
    80003ac8:	fa049ce3          	bnez	s1,80003a80 <_ZL8consumerPv+0x40>
    80003acc:	fa9ff06f          	j	80003a74 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80003ad0:	00893503          	ld	a0,8(s2)
    80003ad4:	00003097          	auipc	ra,0x3
    80003ad8:	2fc080e7          	jalr	764(ra) # 80006dd0 <_ZN6Buffer3getEv>
        putc(key);
    80003adc:	0ff57513          	andi	a0,a0,255
    80003ae0:	ffffe097          	auipc	ra,0xffffe
    80003ae4:	ab0080e7          	jalr	-1360(ra) # 80001590 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80003ae8:	00893503          	ld	a0,8(s2)
    80003aec:	00003097          	auipc	ra,0x3
    80003af0:	370080e7          	jalr	880(ra) # 80006e5c <_ZN6Buffer6getCntEv>
    80003af4:	fca04ee3          	bgtz	a0,80003ad0 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80003af8:	01093503          	ld	a0,16(s2)
    80003afc:	ffffe097          	auipc	ra,0xffffe
    80003b00:	a3c080e7          	jalr	-1476(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    80003b04:	02813083          	ld	ra,40(sp)
    80003b08:	02013403          	ld	s0,32(sp)
    80003b0c:	01813483          	ld	s1,24(sp)
    80003b10:	01013903          	ld	s2,16(sp)
    80003b14:	00813983          	ld	s3,8(sp)
    80003b18:	03010113          	addi	sp,sp,48
    80003b1c:	00008067          	ret

0000000080003b20 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80003b20:	f9010113          	addi	sp,sp,-112
    80003b24:	06113423          	sd	ra,104(sp)
    80003b28:	06813023          	sd	s0,96(sp)
    80003b2c:	04913c23          	sd	s1,88(sp)
    80003b30:	05213823          	sd	s2,80(sp)
    80003b34:	05313423          	sd	s3,72(sp)
    80003b38:	05413023          	sd	s4,64(sp)
    80003b3c:	03513c23          	sd	s5,56(sp)
    80003b40:	03613823          	sd	s6,48(sp)
    80003b44:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80003b48:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80003b4c:	00006517          	auipc	a0,0x6
    80003b50:	6ec50513          	addi	a0,a0,1772 # 8000a238 <_ZZ9kPrintIntmE6digits+0x1c8>
    80003b54:	00002097          	auipc	ra,0x2
    80003b58:	220080e7          	jalr	544(ra) # 80005d74 <_Z11printStringPKc>
    getString(input, 30);
    80003b5c:	01e00593          	li	a1,30
    80003b60:	fa040493          	addi	s1,s0,-96
    80003b64:	00048513          	mv	a0,s1
    80003b68:	00002097          	auipc	ra,0x2
    80003b6c:	294080e7          	jalr	660(ra) # 80005dfc <_Z9getStringPci>
    threadNum = stringToInt(input);
    80003b70:	00048513          	mv	a0,s1
    80003b74:	00002097          	auipc	ra,0x2
    80003b78:	360080e7          	jalr	864(ra) # 80005ed4 <_Z11stringToIntPKc>
    80003b7c:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80003b80:	00006517          	auipc	a0,0x6
    80003b84:	6d850513          	addi	a0,a0,1752 # 8000a258 <_ZZ9kPrintIntmE6digits+0x1e8>
    80003b88:	00002097          	auipc	ra,0x2
    80003b8c:	1ec080e7          	jalr	492(ra) # 80005d74 <_Z11printStringPKc>
    getString(input, 30);
    80003b90:	01e00593          	li	a1,30
    80003b94:	00048513          	mv	a0,s1
    80003b98:	00002097          	auipc	ra,0x2
    80003b9c:	264080e7          	jalr	612(ra) # 80005dfc <_Z9getStringPci>
    n = stringToInt(input);
    80003ba0:	00048513          	mv	a0,s1
    80003ba4:	00002097          	auipc	ra,0x2
    80003ba8:	330080e7          	jalr	816(ra) # 80005ed4 <_Z11stringToIntPKc>
    80003bac:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80003bb0:	00006517          	auipc	a0,0x6
    80003bb4:	6c850513          	addi	a0,a0,1736 # 8000a278 <_ZZ9kPrintIntmE6digits+0x208>
    80003bb8:	00002097          	auipc	ra,0x2
    80003bbc:	1bc080e7          	jalr	444(ra) # 80005d74 <_Z11printStringPKc>
	printInt(threadNum);
    80003bc0:	00000613          	li	a2,0
    80003bc4:	00a00593          	li	a1,10
    80003bc8:	00090513          	mv	a0,s2
    80003bcc:	00002097          	auipc	ra,0x2
    80003bd0:	358080e7          	jalr	856(ra) # 80005f24 <_Z8printIntiii>
    printString(" i velicina bafera ");
    80003bd4:	00006517          	auipc	a0,0x6
    80003bd8:	6bc50513          	addi	a0,a0,1724 # 8000a290 <_ZZ9kPrintIntmE6digits+0x220>
    80003bdc:	00002097          	auipc	ra,0x2
    80003be0:	198080e7          	jalr	408(ra) # 80005d74 <_Z11printStringPKc>
	printInt(n);
    80003be4:	00000613          	li	a2,0
    80003be8:	00a00593          	li	a1,10
    80003bec:	00048513          	mv	a0,s1
    80003bf0:	00002097          	auipc	ra,0x2
    80003bf4:	334080e7          	jalr	820(ra) # 80005f24 <_Z8printIntiii>
    printString(".\n");
    80003bf8:	00006517          	auipc	a0,0x6
    80003bfc:	6b050513          	addi	a0,a0,1712 # 8000a2a8 <_ZZ9kPrintIntmE6digits+0x238>
    80003c00:	00002097          	auipc	ra,0x2
    80003c04:	174080e7          	jalr	372(ra) # 80005d74 <_Z11printStringPKc>
    if(threadNum > n) {
    80003c08:	0324c463          	blt	s1,s2,80003c30 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80003c0c:	03205c63          	blez	s2,80003c44 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80003c10:	03800513          	li	a0,56
    80003c14:	fffff097          	auipc	ra,0xfffff
    80003c18:	a18080e7          	jalr	-1512(ra) # 8000262c <_Znwm>
    80003c1c:	00050a13          	mv	s4,a0
    80003c20:	00048593          	mv	a1,s1
    80003c24:	00003097          	auipc	ra,0x3
    80003c28:	080080e7          	jalr	128(ra) # 80006ca4 <_ZN6BufferC1Ei>
    80003c2c:	0300006f          	j	80003c5c <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80003c30:	00006517          	auipc	a0,0x6
    80003c34:	68050513          	addi	a0,a0,1664 # 8000a2b0 <_ZZ9kPrintIntmE6digits+0x240>
    80003c38:	00002097          	auipc	ra,0x2
    80003c3c:	13c080e7          	jalr	316(ra) # 80005d74 <_Z11printStringPKc>
        return;
    80003c40:	0140006f          	j	80003c54 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80003c44:	00006517          	auipc	a0,0x6
    80003c48:	6ac50513          	addi	a0,a0,1708 # 8000a2f0 <_ZZ9kPrintIntmE6digits+0x280>
    80003c4c:	00002097          	auipc	ra,0x2
    80003c50:	128080e7          	jalr	296(ra) # 80005d74 <_Z11printStringPKc>
        return;
    80003c54:	000b0113          	mv	sp,s6
    80003c58:	1500006f          	j	80003da8 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80003c5c:	00000593          	li	a1,0
    80003c60:	00009517          	auipc	a0,0x9
    80003c64:	05850513          	addi	a0,a0,88 # 8000ccb8 <_ZL10waitForAll>
    80003c68:	ffffe097          	auipc	ra,0xffffe
    80003c6c:	838080e7          	jalr	-1992(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    thread_t threads[threadNum];
    80003c70:	00391793          	slli	a5,s2,0x3
    80003c74:	00f78793          	addi	a5,a5,15
    80003c78:	ff07f793          	andi	a5,a5,-16
    80003c7c:	40f10133          	sub	sp,sp,a5
    80003c80:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80003c84:	0019071b          	addiw	a4,s2,1
    80003c88:	00171793          	slli	a5,a4,0x1
    80003c8c:	00e787b3          	add	a5,a5,a4
    80003c90:	00379793          	slli	a5,a5,0x3
    80003c94:	00f78793          	addi	a5,a5,15
    80003c98:	ff07f793          	andi	a5,a5,-16
    80003c9c:	40f10133          	sub	sp,sp,a5
    80003ca0:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80003ca4:	00191613          	slli	a2,s2,0x1
    80003ca8:	012607b3          	add	a5,a2,s2
    80003cac:	00379793          	slli	a5,a5,0x3
    80003cb0:	00f987b3          	add	a5,s3,a5
    80003cb4:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80003cb8:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80003cbc:	00009717          	auipc	a4,0x9
    80003cc0:	ffc73703          	ld	a4,-4(a4) # 8000ccb8 <_ZL10waitForAll>
    80003cc4:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80003cc8:	00078613          	mv	a2,a5
    80003ccc:	00000597          	auipc	a1,0x0
    80003cd0:	d7458593          	addi	a1,a1,-652 # 80003a40 <_ZL8consumerPv>
    80003cd4:	f9840513          	addi	a0,s0,-104
    80003cd8:	ffffd097          	auipc	ra,0xffffd
    80003cdc:	6a8080e7          	jalr	1704(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003ce0:	00000493          	li	s1,0
    80003ce4:	0280006f          	j	80003d0c <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80003ce8:	00000597          	auipc	a1,0x0
    80003cec:	c1458593          	addi	a1,a1,-1004 # 800038fc <_ZL16producerKeyboardPv>
                      data + i);
    80003cf0:	00179613          	slli	a2,a5,0x1
    80003cf4:	00f60633          	add	a2,a2,a5
    80003cf8:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80003cfc:	00c98633          	add	a2,s3,a2
    80003d00:	ffffd097          	auipc	ra,0xffffd
    80003d04:	680080e7          	jalr	1664(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003d08:	0014849b          	addiw	s1,s1,1
    80003d0c:	0524d263          	bge	s1,s2,80003d50 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80003d10:	00149793          	slli	a5,s1,0x1
    80003d14:	009787b3          	add	a5,a5,s1
    80003d18:	00379793          	slli	a5,a5,0x3
    80003d1c:	00f987b3          	add	a5,s3,a5
    80003d20:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80003d24:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80003d28:	00009717          	auipc	a4,0x9
    80003d2c:	f9073703          	ld	a4,-112(a4) # 8000ccb8 <_ZL10waitForAll>
    80003d30:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80003d34:	00048793          	mv	a5,s1
    80003d38:	00349513          	slli	a0,s1,0x3
    80003d3c:	00aa8533          	add	a0,s5,a0
    80003d40:	fa9054e3          	blez	s1,80003ce8 <_Z22producerConsumer_C_APIv+0x1c8>
    80003d44:	00000597          	auipc	a1,0x0
    80003d48:	c6858593          	addi	a1,a1,-920 # 800039ac <_ZL8producerPv>
    80003d4c:	fa5ff06f          	j	80003cf0 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80003d50:	ffffd097          	auipc	ra,0xffffd
    80003d54:	6d8080e7          	jalr	1752(ra) # 80001428 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80003d58:	00000493          	li	s1,0
    80003d5c:	00994e63          	blt	s2,s1,80003d78 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80003d60:	00009517          	auipc	a0,0x9
    80003d64:	f5853503          	ld	a0,-168(a0) # 8000ccb8 <_ZL10waitForAll>
    80003d68:	ffffd097          	auipc	ra,0xffffd
    80003d6c:	7a0080e7          	jalr	1952(ra) # 80001508 <_Z8sem_waitP4KSem>
    for (int i = 0; i <= threadNum; i++) {
    80003d70:	0014849b          	addiw	s1,s1,1
    80003d74:	fe9ff06f          	j	80003d5c <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80003d78:	00009517          	auipc	a0,0x9
    80003d7c:	f4053503          	ld	a0,-192(a0) # 8000ccb8 <_ZL10waitForAll>
    80003d80:	ffffd097          	auipc	ra,0xffffd
    80003d84:	758080e7          	jalr	1880(ra) # 800014d8 <_Z9sem_closeP4KSem>
    delete buffer;
    80003d88:	000a0e63          	beqz	s4,80003da4 <_Z22producerConsumer_C_APIv+0x284>
    80003d8c:	000a0513          	mv	a0,s4
    80003d90:	00003097          	auipc	ra,0x3
    80003d94:	154080e7          	jalr	340(ra) # 80006ee4 <_ZN6BufferD1Ev>
    80003d98:	000a0513          	mv	a0,s4
    80003d9c:	fffff097          	auipc	ra,0xfffff
    80003da0:	8e0080e7          	jalr	-1824(ra) # 8000267c <_ZdlPv>
    80003da4:	000b0113          	mv	sp,s6

}
    80003da8:	f9040113          	addi	sp,s0,-112
    80003dac:	06813083          	ld	ra,104(sp)
    80003db0:	06013403          	ld	s0,96(sp)
    80003db4:	05813483          	ld	s1,88(sp)
    80003db8:	05013903          	ld	s2,80(sp)
    80003dbc:	04813983          	ld	s3,72(sp)
    80003dc0:	04013a03          	ld	s4,64(sp)
    80003dc4:	03813a83          	ld	s5,56(sp)
    80003dc8:	03013b03          	ld	s6,48(sp)
    80003dcc:	07010113          	addi	sp,sp,112
    80003dd0:	00008067          	ret
    80003dd4:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80003dd8:	000a0513          	mv	a0,s4
    80003ddc:	fffff097          	auipc	ra,0xfffff
    80003de0:	8a0080e7          	jalr	-1888(ra) # 8000267c <_ZdlPv>
    80003de4:	00048513          	mv	a0,s1
    80003de8:	0000a097          	auipc	ra,0xa
    80003dec:	fe0080e7          	jalr	-32(ra) # 8000ddc8 <_Unwind_Resume>

0000000080003df0 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003df0:	fe010113          	addi	sp,sp,-32
    80003df4:	00113c23          	sd	ra,24(sp)
    80003df8:	00813823          	sd	s0,16(sp)
    80003dfc:	00913423          	sd	s1,8(sp)
    80003e00:	01213023          	sd	s2,0(sp)
    80003e04:	02010413          	addi	s0,sp,32
    80003e08:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003e0c:	00100793          	li	a5,1
    80003e10:	02a7f863          	bgeu	a5,a0,80003e40 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80003e14:	00a00793          	li	a5,10
    80003e18:	02f577b3          	remu	a5,a0,a5
    80003e1c:	02078e63          	beqz	a5,80003e58 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80003e20:	fff48513          	addi	a0,s1,-1
    80003e24:	00000097          	auipc	ra,0x0
    80003e28:	fcc080e7          	jalr	-52(ra) # 80003df0 <_ZL9fibonaccim>
    80003e2c:	00050913          	mv	s2,a0
    80003e30:	ffe48513          	addi	a0,s1,-2
    80003e34:	00000097          	auipc	ra,0x0
    80003e38:	fbc080e7          	jalr	-68(ra) # 80003df0 <_ZL9fibonaccim>
    80003e3c:	00a90533          	add	a0,s2,a0
}
    80003e40:	01813083          	ld	ra,24(sp)
    80003e44:	01013403          	ld	s0,16(sp)
    80003e48:	00813483          	ld	s1,8(sp)
    80003e4c:	00013903          	ld	s2,0(sp)
    80003e50:	02010113          	addi	sp,sp,32
    80003e54:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80003e58:	ffffd097          	auipc	ra,0xffffd
    80003e5c:	5d0080e7          	jalr	1488(ra) # 80001428 <_Z15thread_dispatchv>
    80003e60:	fc1ff06f          	j	80003e20 <_ZL9fibonaccim+0x30>

0000000080003e64 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80003e64:	fe010113          	addi	sp,sp,-32
    80003e68:	00113c23          	sd	ra,24(sp)
    80003e6c:	00813823          	sd	s0,16(sp)
    80003e70:	00913423          	sd	s1,8(sp)
    80003e74:	01213023          	sd	s2,0(sp)
    80003e78:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003e7c:	00000913          	li	s2,0
    80003e80:	0380006f          	j	80003eb8 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003e84:	ffffd097          	auipc	ra,0xffffd
    80003e88:	5a4080e7          	jalr	1444(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003e8c:	00148493          	addi	s1,s1,1
    80003e90:	000027b7          	lui	a5,0x2
    80003e94:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003e98:	0097ee63          	bltu	a5,s1,80003eb4 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003e9c:	00000713          	li	a4,0
    80003ea0:	000077b7          	lui	a5,0x7
    80003ea4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003ea8:	fce7eee3          	bltu	a5,a4,80003e84 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80003eac:	00170713          	addi	a4,a4,1
    80003eb0:	ff1ff06f          	j	80003ea0 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003eb4:	00190913          	addi	s2,s2,1
    80003eb8:	00900793          	li	a5,9
    80003ebc:	0527e063          	bltu	a5,s2,80003efc <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003ec0:	00006517          	auipc	a0,0x6
    80003ec4:	46050513          	addi	a0,a0,1120 # 8000a320 <_ZZ9kPrintIntmE6digits+0x2b0>
    80003ec8:	00002097          	auipc	ra,0x2
    80003ecc:	eac080e7          	jalr	-340(ra) # 80005d74 <_Z11printStringPKc>
    80003ed0:	00000613          	li	a2,0
    80003ed4:	00a00593          	li	a1,10
    80003ed8:	0009051b          	sext.w	a0,s2
    80003edc:	00002097          	auipc	ra,0x2
    80003ee0:	048080e7          	jalr	72(ra) # 80005f24 <_Z8printIntiii>
    80003ee4:	00006517          	auipc	a0,0x6
    80003ee8:	69c50513          	addi	a0,a0,1692 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80003eec:	00002097          	auipc	ra,0x2
    80003ef0:	e88080e7          	jalr	-376(ra) # 80005d74 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003ef4:	00000493          	li	s1,0
    80003ef8:	f99ff06f          	j	80003e90 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003efc:	00006517          	auipc	a0,0x6
    80003f00:	42c50513          	addi	a0,a0,1068 # 8000a328 <_ZZ9kPrintIntmE6digits+0x2b8>
    80003f04:	00002097          	auipc	ra,0x2
    80003f08:	e70080e7          	jalr	-400(ra) # 80005d74 <_Z11printStringPKc>
    finishedA = true;
    80003f0c:	00100793          	li	a5,1
    80003f10:	00009717          	auipc	a4,0x9
    80003f14:	daf70823          	sb	a5,-592(a4) # 8000ccc0 <_ZL9finishedA>
}
    80003f18:	01813083          	ld	ra,24(sp)
    80003f1c:	01013403          	ld	s0,16(sp)
    80003f20:	00813483          	ld	s1,8(sp)
    80003f24:	00013903          	ld	s2,0(sp)
    80003f28:	02010113          	addi	sp,sp,32
    80003f2c:	00008067          	ret

0000000080003f30 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80003f30:	fe010113          	addi	sp,sp,-32
    80003f34:	00113c23          	sd	ra,24(sp)
    80003f38:	00813823          	sd	s0,16(sp)
    80003f3c:	00913423          	sd	s1,8(sp)
    80003f40:	01213023          	sd	s2,0(sp)
    80003f44:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003f48:	00000913          	li	s2,0
    80003f4c:	0380006f          	j	80003f84 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003f50:	ffffd097          	auipc	ra,0xffffd
    80003f54:	4d8080e7          	jalr	1240(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003f58:	00148493          	addi	s1,s1,1
    80003f5c:	000027b7          	lui	a5,0x2
    80003f60:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003f64:	0097ee63          	bltu	a5,s1,80003f80 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003f68:	00000713          	li	a4,0
    80003f6c:	000077b7          	lui	a5,0x7
    80003f70:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003f74:	fce7eee3          	bltu	a5,a4,80003f50 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80003f78:	00170713          	addi	a4,a4,1
    80003f7c:	ff1ff06f          	j	80003f6c <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003f80:	00190913          	addi	s2,s2,1
    80003f84:	00f00793          	li	a5,15
    80003f88:	0527e063          	bltu	a5,s2,80003fc8 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003f8c:	00006517          	auipc	a0,0x6
    80003f90:	3ac50513          	addi	a0,a0,940 # 8000a338 <_ZZ9kPrintIntmE6digits+0x2c8>
    80003f94:	00002097          	auipc	ra,0x2
    80003f98:	de0080e7          	jalr	-544(ra) # 80005d74 <_Z11printStringPKc>
    80003f9c:	00000613          	li	a2,0
    80003fa0:	00a00593          	li	a1,10
    80003fa4:	0009051b          	sext.w	a0,s2
    80003fa8:	00002097          	auipc	ra,0x2
    80003fac:	f7c080e7          	jalr	-132(ra) # 80005f24 <_Z8printIntiii>
    80003fb0:	00006517          	auipc	a0,0x6
    80003fb4:	5d050513          	addi	a0,a0,1488 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80003fb8:	00002097          	auipc	ra,0x2
    80003fbc:	dbc080e7          	jalr	-580(ra) # 80005d74 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003fc0:	00000493          	li	s1,0
    80003fc4:	f99ff06f          	j	80003f5c <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80003fc8:	00006517          	auipc	a0,0x6
    80003fcc:	37850513          	addi	a0,a0,888 # 8000a340 <_ZZ9kPrintIntmE6digits+0x2d0>
    80003fd0:	00002097          	auipc	ra,0x2
    80003fd4:	da4080e7          	jalr	-604(ra) # 80005d74 <_Z11printStringPKc>
    finishedB = true;
    80003fd8:	00100793          	li	a5,1
    80003fdc:	00009717          	auipc	a4,0x9
    80003fe0:	cef702a3          	sb	a5,-795(a4) # 8000ccc1 <_ZL9finishedB>
    thread_dispatch();
    80003fe4:	ffffd097          	auipc	ra,0xffffd
    80003fe8:	444080e7          	jalr	1092(ra) # 80001428 <_Z15thread_dispatchv>
}
    80003fec:	01813083          	ld	ra,24(sp)
    80003ff0:	01013403          	ld	s0,16(sp)
    80003ff4:	00813483          	ld	s1,8(sp)
    80003ff8:	00013903          	ld	s2,0(sp)
    80003ffc:	02010113          	addi	sp,sp,32
    80004000:	00008067          	ret

0000000080004004 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80004004:	fe010113          	addi	sp,sp,-32
    80004008:	00113c23          	sd	ra,24(sp)
    8000400c:	00813823          	sd	s0,16(sp)
    80004010:	00913423          	sd	s1,8(sp)
    80004014:	01213023          	sd	s2,0(sp)
    80004018:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    8000401c:	00000493          	li	s1,0
    80004020:	0400006f          	j	80004060 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80004024:	00006517          	auipc	a0,0x6
    80004028:	32c50513          	addi	a0,a0,812 # 8000a350 <_ZZ9kPrintIntmE6digits+0x2e0>
    8000402c:	00002097          	auipc	ra,0x2
    80004030:	d48080e7          	jalr	-696(ra) # 80005d74 <_Z11printStringPKc>
    80004034:	00000613          	li	a2,0
    80004038:	00a00593          	li	a1,10
    8000403c:	00048513          	mv	a0,s1
    80004040:	00002097          	auipc	ra,0x2
    80004044:	ee4080e7          	jalr	-284(ra) # 80005f24 <_Z8printIntiii>
    80004048:	00006517          	auipc	a0,0x6
    8000404c:	53850513          	addi	a0,a0,1336 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80004050:	00002097          	auipc	ra,0x2
    80004054:	d24080e7          	jalr	-732(ra) # 80005d74 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004058:	0014849b          	addiw	s1,s1,1
    8000405c:	0ff4f493          	andi	s1,s1,255
    80004060:	00200793          	li	a5,2
    80004064:	fc97f0e3          	bgeu	a5,s1,80004024 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80004068:	00006517          	auipc	a0,0x6
    8000406c:	2f050513          	addi	a0,a0,752 # 8000a358 <_ZZ9kPrintIntmE6digits+0x2e8>
    80004070:	00002097          	auipc	ra,0x2
    80004074:	d04080e7          	jalr	-764(ra) # 80005d74 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004078:	00700313          	li	t1,7
    thread_dispatch();
    8000407c:	ffffd097          	auipc	ra,0xffffd
    80004080:	3ac080e7          	jalr	940(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004084:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80004088:	00006517          	auipc	a0,0x6
    8000408c:	2e050513          	addi	a0,a0,736 # 8000a368 <_ZZ9kPrintIntmE6digits+0x2f8>
    80004090:	00002097          	auipc	ra,0x2
    80004094:	ce4080e7          	jalr	-796(ra) # 80005d74 <_Z11printStringPKc>
    80004098:	00000613          	li	a2,0
    8000409c:	00a00593          	li	a1,10
    800040a0:	0009051b          	sext.w	a0,s2
    800040a4:	00002097          	auipc	ra,0x2
    800040a8:	e80080e7          	jalr	-384(ra) # 80005f24 <_Z8printIntiii>
    800040ac:	00006517          	auipc	a0,0x6
    800040b0:	4d450513          	addi	a0,a0,1236 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800040b4:	00002097          	auipc	ra,0x2
    800040b8:	cc0080e7          	jalr	-832(ra) # 80005d74 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    800040bc:	00c00513          	li	a0,12
    800040c0:	00000097          	auipc	ra,0x0
    800040c4:	d30080e7          	jalr	-720(ra) # 80003df0 <_ZL9fibonaccim>
    800040c8:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800040cc:	00006517          	auipc	a0,0x6
    800040d0:	2a450513          	addi	a0,a0,676 # 8000a370 <_ZZ9kPrintIntmE6digits+0x300>
    800040d4:	00002097          	auipc	ra,0x2
    800040d8:	ca0080e7          	jalr	-864(ra) # 80005d74 <_Z11printStringPKc>
    800040dc:	00000613          	li	a2,0
    800040e0:	00a00593          	li	a1,10
    800040e4:	0009051b          	sext.w	a0,s2
    800040e8:	00002097          	auipc	ra,0x2
    800040ec:	e3c080e7          	jalr	-452(ra) # 80005f24 <_Z8printIntiii>
    800040f0:	00006517          	auipc	a0,0x6
    800040f4:	49050513          	addi	a0,a0,1168 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800040f8:	00002097          	auipc	ra,0x2
    800040fc:	c7c080e7          	jalr	-900(ra) # 80005d74 <_Z11printStringPKc>
    80004100:	0400006f          	j	80004140 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80004104:	00006517          	auipc	a0,0x6
    80004108:	24c50513          	addi	a0,a0,588 # 8000a350 <_ZZ9kPrintIntmE6digits+0x2e0>
    8000410c:	00002097          	auipc	ra,0x2
    80004110:	c68080e7          	jalr	-920(ra) # 80005d74 <_Z11printStringPKc>
    80004114:	00000613          	li	a2,0
    80004118:	00a00593          	li	a1,10
    8000411c:	00048513          	mv	a0,s1
    80004120:	00002097          	auipc	ra,0x2
    80004124:	e04080e7          	jalr	-508(ra) # 80005f24 <_Z8printIntiii>
    80004128:	00006517          	auipc	a0,0x6
    8000412c:	45850513          	addi	a0,a0,1112 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80004130:	00002097          	auipc	ra,0x2
    80004134:	c44080e7          	jalr	-956(ra) # 80005d74 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004138:	0014849b          	addiw	s1,s1,1
    8000413c:	0ff4f493          	andi	s1,s1,255
    80004140:	00500793          	li	a5,5
    80004144:	fc97f0e3          	bgeu	a5,s1,80004104 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("C finished!\n");
    80004148:	00006517          	auipc	a0,0x6
    8000414c:	23850513          	addi	a0,a0,568 # 8000a380 <_ZZ9kPrintIntmE6digits+0x310>
    80004150:	00002097          	auipc	ra,0x2
    80004154:	c24080e7          	jalr	-988(ra) # 80005d74 <_Z11printStringPKc>
    finishedC = true;
    80004158:	00100793          	li	a5,1
    8000415c:	00009717          	auipc	a4,0x9
    80004160:	b6f70323          	sb	a5,-1178(a4) # 8000ccc2 <_ZL9finishedC>
    thread_dispatch();
    80004164:	ffffd097          	auipc	ra,0xffffd
    80004168:	2c4080e7          	jalr	708(ra) # 80001428 <_Z15thread_dispatchv>
}
    8000416c:	01813083          	ld	ra,24(sp)
    80004170:	01013403          	ld	s0,16(sp)
    80004174:	00813483          	ld	s1,8(sp)
    80004178:	00013903          	ld	s2,0(sp)
    8000417c:	02010113          	addi	sp,sp,32
    80004180:	00008067          	ret

0000000080004184 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80004184:	fe010113          	addi	sp,sp,-32
    80004188:	00113c23          	sd	ra,24(sp)
    8000418c:	00813823          	sd	s0,16(sp)
    80004190:	00913423          	sd	s1,8(sp)
    80004194:	01213023          	sd	s2,0(sp)
    80004198:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    8000419c:	00a00493          	li	s1,10
    800041a0:	0400006f          	j	800041e0 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800041a4:	00006517          	auipc	a0,0x6
    800041a8:	1ec50513          	addi	a0,a0,492 # 8000a390 <_ZZ9kPrintIntmE6digits+0x320>
    800041ac:	00002097          	auipc	ra,0x2
    800041b0:	bc8080e7          	jalr	-1080(ra) # 80005d74 <_Z11printStringPKc>
    800041b4:	00000613          	li	a2,0
    800041b8:	00a00593          	li	a1,10
    800041bc:	00048513          	mv	a0,s1
    800041c0:	00002097          	auipc	ra,0x2
    800041c4:	d64080e7          	jalr	-668(ra) # 80005f24 <_Z8printIntiii>
    800041c8:	00006517          	auipc	a0,0x6
    800041cc:	3b850513          	addi	a0,a0,952 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800041d0:	00002097          	auipc	ra,0x2
    800041d4:	ba4080e7          	jalr	-1116(ra) # 80005d74 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800041d8:	0014849b          	addiw	s1,s1,1
    800041dc:	0ff4f493          	andi	s1,s1,255
    800041e0:	00c00793          	li	a5,12
    800041e4:	fc97f0e3          	bgeu	a5,s1,800041a4 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    800041e8:	00006517          	auipc	a0,0x6
    800041ec:	1b050513          	addi	a0,a0,432 # 8000a398 <_ZZ9kPrintIntmE6digits+0x328>
    800041f0:	00002097          	auipc	ra,0x2
    800041f4:	b84080e7          	jalr	-1148(ra) # 80005d74 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800041f8:	00500313          	li	t1,5
    thread_dispatch();
    800041fc:	ffffd097          	auipc	ra,0xffffd
    80004200:	22c080e7          	jalr	556(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004204:	01000513          	li	a0,16
    80004208:	00000097          	auipc	ra,0x0
    8000420c:	be8080e7          	jalr	-1048(ra) # 80003df0 <_ZL9fibonaccim>
    80004210:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004214:	00006517          	auipc	a0,0x6
    80004218:	19450513          	addi	a0,a0,404 # 8000a3a8 <_ZZ9kPrintIntmE6digits+0x338>
    8000421c:	00002097          	auipc	ra,0x2
    80004220:	b58080e7          	jalr	-1192(ra) # 80005d74 <_Z11printStringPKc>
    80004224:	00000613          	li	a2,0
    80004228:	00a00593          	li	a1,10
    8000422c:	0009051b          	sext.w	a0,s2
    80004230:	00002097          	auipc	ra,0x2
    80004234:	cf4080e7          	jalr	-780(ra) # 80005f24 <_Z8printIntiii>
    80004238:	00006517          	auipc	a0,0x6
    8000423c:	34850513          	addi	a0,a0,840 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80004240:	00002097          	auipc	ra,0x2
    80004244:	b34080e7          	jalr	-1228(ra) # 80005d74 <_Z11printStringPKc>
    80004248:	0400006f          	j	80004288 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000424c:	00006517          	auipc	a0,0x6
    80004250:	14450513          	addi	a0,a0,324 # 8000a390 <_ZZ9kPrintIntmE6digits+0x320>
    80004254:	00002097          	auipc	ra,0x2
    80004258:	b20080e7          	jalr	-1248(ra) # 80005d74 <_Z11printStringPKc>
    8000425c:	00000613          	li	a2,0
    80004260:	00a00593          	li	a1,10
    80004264:	00048513          	mv	a0,s1
    80004268:	00002097          	auipc	ra,0x2
    8000426c:	cbc080e7          	jalr	-836(ra) # 80005f24 <_Z8printIntiii>
    80004270:	00006517          	auipc	a0,0x6
    80004274:	31050513          	addi	a0,a0,784 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80004278:	00002097          	auipc	ra,0x2
    8000427c:	afc080e7          	jalr	-1284(ra) # 80005d74 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004280:	0014849b          	addiw	s1,s1,1
    80004284:	0ff4f493          	andi	s1,s1,255
    80004288:	00f00793          	li	a5,15
    8000428c:	fc97f0e3          	bgeu	a5,s1,8000424c <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80004290:	00006517          	auipc	a0,0x6
    80004294:	12850513          	addi	a0,a0,296 # 8000a3b8 <_ZZ9kPrintIntmE6digits+0x348>
    80004298:	00002097          	auipc	ra,0x2
    8000429c:	adc080e7          	jalr	-1316(ra) # 80005d74 <_Z11printStringPKc>
    finishedD = true;
    800042a0:	00100793          	li	a5,1
    800042a4:	00009717          	auipc	a4,0x9
    800042a8:	a0f70fa3          	sb	a5,-1505(a4) # 8000ccc3 <_ZL9finishedD>
    thread_dispatch();
    800042ac:	ffffd097          	auipc	ra,0xffffd
    800042b0:	17c080e7          	jalr	380(ra) # 80001428 <_Z15thread_dispatchv>
}
    800042b4:	01813083          	ld	ra,24(sp)
    800042b8:	01013403          	ld	s0,16(sp)
    800042bc:	00813483          	ld	s1,8(sp)
    800042c0:	00013903          	ld	s2,0(sp)
    800042c4:	02010113          	addi	sp,sp,32
    800042c8:	00008067          	ret

00000000800042cc <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    800042cc:	fc010113          	addi	sp,sp,-64
    800042d0:	02113c23          	sd	ra,56(sp)
    800042d4:	02813823          	sd	s0,48(sp)
    800042d8:	02913423          	sd	s1,40(sp)
    800042dc:	03213023          	sd	s2,32(sp)
    800042e0:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    800042e4:	02000513          	li	a0,32
    800042e8:	ffffe097          	auipc	ra,0xffffe
    800042ec:	344080e7          	jalr	836(ra) # 8000262c <_Znwm>
    800042f0:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    800042f4:	ffffe097          	auipc	ra,0xffffe
    800042f8:	600080e7          	jalr	1536(ra) # 800028f4 <_ZN6ThreadC1Ev>
    800042fc:	00008797          	auipc	a5,0x8
    80004300:	62478793          	addi	a5,a5,1572 # 8000c920 <_ZTV7WorkerA+0x10>
    80004304:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80004308:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    8000430c:	00006517          	auipc	a0,0x6
    80004310:	0bc50513          	addi	a0,a0,188 # 8000a3c8 <_ZZ9kPrintIntmE6digits+0x358>
    80004314:	00002097          	auipc	ra,0x2
    80004318:	a60080e7          	jalr	-1440(ra) # 80005d74 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    8000431c:	02000513          	li	a0,32
    80004320:	ffffe097          	auipc	ra,0xffffe
    80004324:	30c080e7          	jalr	780(ra) # 8000262c <_Znwm>
    80004328:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    8000432c:	ffffe097          	auipc	ra,0xffffe
    80004330:	5c8080e7          	jalr	1480(ra) # 800028f4 <_ZN6ThreadC1Ev>
    80004334:	00008797          	auipc	a5,0x8
    80004338:	61478793          	addi	a5,a5,1556 # 8000c948 <_ZTV7WorkerB+0x10>
    8000433c:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80004340:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80004344:	00006517          	auipc	a0,0x6
    80004348:	09c50513          	addi	a0,a0,156 # 8000a3e0 <_ZZ9kPrintIntmE6digits+0x370>
    8000434c:	00002097          	auipc	ra,0x2
    80004350:	a28080e7          	jalr	-1496(ra) # 80005d74 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80004354:	02000513          	li	a0,32
    80004358:	ffffe097          	auipc	ra,0xffffe
    8000435c:	2d4080e7          	jalr	724(ra) # 8000262c <_Znwm>
    80004360:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80004364:	ffffe097          	auipc	ra,0xffffe
    80004368:	590080e7          	jalr	1424(ra) # 800028f4 <_ZN6ThreadC1Ev>
    8000436c:	00008797          	auipc	a5,0x8
    80004370:	60478793          	addi	a5,a5,1540 # 8000c970 <_ZTV7WorkerC+0x10>
    80004374:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80004378:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    8000437c:	00006517          	auipc	a0,0x6
    80004380:	07c50513          	addi	a0,a0,124 # 8000a3f8 <_ZZ9kPrintIntmE6digits+0x388>
    80004384:	00002097          	auipc	ra,0x2
    80004388:	9f0080e7          	jalr	-1552(ra) # 80005d74 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    8000438c:	02000513          	li	a0,32
    80004390:	ffffe097          	auipc	ra,0xffffe
    80004394:	29c080e7          	jalr	668(ra) # 8000262c <_Znwm>
    80004398:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    8000439c:	ffffe097          	auipc	ra,0xffffe
    800043a0:	558080e7          	jalr	1368(ra) # 800028f4 <_ZN6ThreadC1Ev>
    800043a4:	00008797          	auipc	a5,0x8
    800043a8:	5f478793          	addi	a5,a5,1524 # 8000c998 <_ZTV7WorkerD+0x10>
    800043ac:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    800043b0:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    800043b4:	00006517          	auipc	a0,0x6
    800043b8:	05c50513          	addi	a0,a0,92 # 8000a410 <_ZZ9kPrintIntmE6digits+0x3a0>
    800043bc:	00002097          	auipc	ra,0x2
    800043c0:	9b8080e7          	jalr	-1608(ra) # 80005d74 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    800043c4:	00000493          	li	s1,0
    800043c8:	00300793          	li	a5,3
    800043cc:	0297c663          	blt	a5,s1,800043f8 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    800043d0:	00349793          	slli	a5,s1,0x3
    800043d4:	fe040713          	addi	a4,s0,-32
    800043d8:	00f707b3          	add	a5,a4,a5
    800043dc:	fe07b503          	ld	a0,-32(a5)
    800043e0:	ffffe097          	auipc	ra,0xffffe
    800043e4:	3fc080e7          	jalr	1020(ra) # 800027dc <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    800043e8:	0014849b          	addiw	s1,s1,1
    800043ec:	fddff06f          	j	800043c8 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    800043f0:	ffffe097          	auipc	ra,0xffffe
    800043f4:	450080e7          	jalr	1104(ra) # 80002840 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800043f8:	00009797          	auipc	a5,0x9
    800043fc:	8c87c783          	lbu	a5,-1848(a5) # 8000ccc0 <_ZL9finishedA>
    80004400:	fe0788e3          	beqz	a5,800043f0 <_Z20Threads_CPP_API_testv+0x124>
    80004404:	00009797          	auipc	a5,0x9
    80004408:	8bd7c783          	lbu	a5,-1859(a5) # 8000ccc1 <_ZL9finishedB>
    8000440c:	fe0782e3          	beqz	a5,800043f0 <_Z20Threads_CPP_API_testv+0x124>
    80004410:	00009797          	auipc	a5,0x9
    80004414:	8b27c783          	lbu	a5,-1870(a5) # 8000ccc2 <_ZL9finishedC>
    80004418:	fc078ce3          	beqz	a5,800043f0 <_Z20Threads_CPP_API_testv+0x124>
    8000441c:	00009797          	auipc	a5,0x9
    80004420:	8a77c783          	lbu	a5,-1881(a5) # 8000ccc3 <_ZL9finishedD>
    80004424:	fc0786e3          	beqz	a5,800043f0 <_Z20Threads_CPP_API_testv+0x124>
    80004428:	fc040493          	addi	s1,s0,-64
    8000442c:	0080006f          	j	80004434 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) {
    80004430:	00848493          	addi	s1,s1,8
    80004434:	fe040793          	addi	a5,s0,-32
    80004438:	08f48663          	beq	s1,a5,800044c4 <_Z20Threads_CPP_API_testv+0x1f8>
    8000443c:	0004b503          	ld	a0,0(s1)
		delete thread;
    80004440:	fe0508e3          	beqz	a0,80004430 <_Z20Threads_CPP_API_testv+0x164>
    80004444:	00053783          	ld	a5,0(a0)
    80004448:	0087b783          	ld	a5,8(a5)
    8000444c:	000780e7          	jalr	a5
    80004450:	fe1ff06f          	j	80004430 <_Z20Threads_CPP_API_testv+0x164>
    80004454:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80004458:	00048513          	mv	a0,s1
    8000445c:	ffffe097          	auipc	ra,0xffffe
    80004460:	220080e7          	jalr	544(ra) # 8000267c <_ZdlPv>
    80004464:	00090513          	mv	a0,s2
    80004468:	0000a097          	auipc	ra,0xa
    8000446c:	960080e7          	jalr	-1696(ra) # 8000ddc8 <_Unwind_Resume>
    80004470:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80004474:	00048513          	mv	a0,s1
    80004478:	ffffe097          	auipc	ra,0xffffe
    8000447c:	204080e7          	jalr	516(ra) # 8000267c <_ZdlPv>
    80004480:	00090513          	mv	a0,s2
    80004484:	0000a097          	auipc	ra,0xa
    80004488:	944080e7          	jalr	-1724(ra) # 8000ddc8 <_Unwind_Resume>
    8000448c:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80004490:	00048513          	mv	a0,s1
    80004494:	ffffe097          	auipc	ra,0xffffe
    80004498:	1e8080e7          	jalr	488(ra) # 8000267c <_ZdlPv>
    8000449c:	00090513          	mv	a0,s2
    800044a0:	0000a097          	auipc	ra,0xa
    800044a4:	928080e7          	jalr	-1752(ra) # 8000ddc8 <_Unwind_Resume>
    800044a8:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    800044ac:	00048513          	mv	a0,s1
    800044b0:	ffffe097          	auipc	ra,0xffffe
    800044b4:	1cc080e7          	jalr	460(ra) # 8000267c <_ZdlPv>
    800044b8:	00090513          	mv	a0,s2
    800044bc:	0000a097          	auipc	ra,0xa
    800044c0:	90c080e7          	jalr	-1780(ra) # 8000ddc8 <_Unwind_Resume>
	}
}
    800044c4:	03813083          	ld	ra,56(sp)
    800044c8:	03013403          	ld	s0,48(sp)
    800044cc:	02813483          	ld	s1,40(sp)
    800044d0:	02013903          	ld	s2,32(sp)
    800044d4:	04010113          	addi	sp,sp,64
    800044d8:	00008067          	ret

00000000800044dc <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    800044dc:	ff010113          	addi	sp,sp,-16
    800044e0:	00113423          	sd	ra,8(sp)
    800044e4:	00813023          	sd	s0,0(sp)
    800044e8:	01010413          	addi	s0,sp,16
    800044ec:	00008797          	auipc	a5,0x8
    800044f0:	43478793          	addi	a5,a5,1076 # 8000c920 <_ZTV7WorkerA+0x10>
    800044f4:	00f53023          	sd	a5,0(a0)
    800044f8:	ffffe097          	auipc	ra,0xffffe
    800044fc:	044080e7          	jalr	68(ra) # 8000253c <_ZN6ThreadD1Ev>
    80004500:	00813083          	ld	ra,8(sp)
    80004504:	00013403          	ld	s0,0(sp)
    80004508:	01010113          	addi	sp,sp,16
    8000450c:	00008067          	ret

0000000080004510 <_ZN7WorkerAD0Ev>:
    80004510:	fe010113          	addi	sp,sp,-32
    80004514:	00113c23          	sd	ra,24(sp)
    80004518:	00813823          	sd	s0,16(sp)
    8000451c:	00913423          	sd	s1,8(sp)
    80004520:	02010413          	addi	s0,sp,32
    80004524:	00050493          	mv	s1,a0
    80004528:	00008797          	auipc	a5,0x8
    8000452c:	3f878793          	addi	a5,a5,1016 # 8000c920 <_ZTV7WorkerA+0x10>
    80004530:	00f53023          	sd	a5,0(a0)
    80004534:	ffffe097          	auipc	ra,0xffffe
    80004538:	008080e7          	jalr	8(ra) # 8000253c <_ZN6ThreadD1Ev>
    8000453c:	00048513          	mv	a0,s1
    80004540:	ffffe097          	auipc	ra,0xffffe
    80004544:	13c080e7          	jalr	316(ra) # 8000267c <_ZdlPv>
    80004548:	01813083          	ld	ra,24(sp)
    8000454c:	01013403          	ld	s0,16(sp)
    80004550:	00813483          	ld	s1,8(sp)
    80004554:	02010113          	addi	sp,sp,32
    80004558:	00008067          	ret

000000008000455c <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    8000455c:	ff010113          	addi	sp,sp,-16
    80004560:	00113423          	sd	ra,8(sp)
    80004564:	00813023          	sd	s0,0(sp)
    80004568:	01010413          	addi	s0,sp,16
    8000456c:	00008797          	auipc	a5,0x8
    80004570:	3dc78793          	addi	a5,a5,988 # 8000c948 <_ZTV7WorkerB+0x10>
    80004574:	00f53023          	sd	a5,0(a0)
    80004578:	ffffe097          	auipc	ra,0xffffe
    8000457c:	fc4080e7          	jalr	-60(ra) # 8000253c <_ZN6ThreadD1Ev>
    80004580:	00813083          	ld	ra,8(sp)
    80004584:	00013403          	ld	s0,0(sp)
    80004588:	01010113          	addi	sp,sp,16
    8000458c:	00008067          	ret

0000000080004590 <_ZN7WorkerBD0Ev>:
    80004590:	fe010113          	addi	sp,sp,-32
    80004594:	00113c23          	sd	ra,24(sp)
    80004598:	00813823          	sd	s0,16(sp)
    8000459c:	00913423          	sd	s1,8(sp)
    800045a0:	02010413          	addi	s0,sp,32
    800045a4:	00050493          	mv	s1,a0
    800045a8:	00008797          	auipc	a5,0x8
    800045ac:	3a078793          	addi	a5,a5,928 # 8000c948 <_ZTV7WorkerB+0x10>
    800045b0:	00f53023          	sd	a5,0(a0)
    800045b4:	ffffe097          	auipc	ra,0xffffe
    800045b8:	f88080e7          	jalr	-120(ra) # 8000253c <_ZN6ThreadD1Ev>
    800045bc:	00048513          	mv	a0,s1
    800045c0:	ffffe097          	auipc	ra,0xffffe
    800045c4:	0bc080e7          	jalr	188(ra) # 8000267c <_ZdlPv>
    800045c8:	01813083          	ld	ra,24(sp)
    800045cc:	01013403          	ld	s0,16(sp)
    800045d0:	00813483          	ld	s1,8(sp)
    800045d4:	02010113          	addi	sp,sp,32
    800045d8:	00008067          	ret

00000000800045dc <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    800045dc:	ff010113          	addi	sp,sp,-16
    800045e0:	00113423          	sd	ra,8(sp)
    800045e4:	00813023          	sd	s0,0(sp)
    800045e8:	01010413          	addi	s0,sp,16
    800045ec:	00008797          	auipc	a5,0x8
    800045f0:	38478793          	addi	a5,a5,900 # 8000c970 <_ZTV7WorkerC+0x10>
    800045f4:	00f53023          	sd	a5,0(a0)
    800045f8:	ffffe097          	auipc	ra,0xffffe
    800045fc:	f44080e7          	jalr	-188(ra) # 8000253c <_ZN6ThreadD1Ev>
    80004600:	00813083          	ld	ra,8(sp)
    80004604:	00013403          	ld	s0,0(sp)
    80004608:	01010113          	addi	sp,sp,16
    8000460c:	00008067          	ret

0000000080004610 <_ZN7WorkerCD0Ev>:
    80004610:	fe010113          	addi	sp,sp,-32
    80004614:	00113c23          	sd	ra,24(sp)
    80004618:	00813823          	sd	s0,16(sp)
    8000461c:	00913423          	sd	s1,8(sp)
    80004620:	02010413          	addi	s0,sp,32
    80004624:	00050493          	mv	s1,a0
    80004628:	00008797          	auipc	a5,0x8
    8000462c:	34878793          	addi	a5,a5,840 # 8000c970 <_ZTV7WorkerC+0x10>
    80004630:	00f53023          	sd	a5,0(a0)
    80004634:	ffffe097          	auipc	ra,0xffffe
    80004638:	f08080e7          	jalr	-248(ra) # 8000253c <_ZN6ThreadD1Ev>
    8000463c:	00048513          	mv	a0,s1
    80004640:	ffffe097          	auipc	ra,0xffffe
    80004644:	03c080e7          	jalr	60(ra) # 8000267c <_ZdlPv>
    80004648:	01813083          	ld	ra,24(sp)
    8000464c:	01013403          	ld	s0,16(sp)
    80004650:	00813483          	ld	s1,8(sp)
    80004654:	02010113          	addi	sp,sp,32
    80004658:	00008067          	ret

000000008000465c <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    8000465c:	ff010113          	addi	sp,sp,-16
    80004660:	00113423          	sd	ra,8(sp)
    80004664:	00813023          	sd	s0,0(sp)
    80004668:	01010413          	addi	s0,sp,16
    8000466c:	00008797          	auipc	a5,0x8
    80004670:	32c78793          	addi	a5,a5,812 # 8000c998 <_ZTV7WorkerD+0x10>
    80004674:	00f53023          	sd	a5,0(a0)
    80004678:	ffffe097          	auipc	ra,0xffffe
    8000467c:	ec4080e7          	jalr	-316(ra) # 8000253c <_ZN6ThreadD1Ev>
    80004680:	00813083          	ld	ra,8(sp)
    80004684:	00013403          	ld	s0,0(sp)
    80004688:	01010113          	addi	sp,sp,16
    8000468c:	00008067          	ret

0000000080004690 <_ZN7WorkerDD0Ev>:
    80004690:	fe010113          	addi	sp,sp,-32
    80004694:	00113c23          	sd	ra,24(sp)
    80004698:	00813823          	sd	s0,16(sp)
    8000469c:	00913423          	sd	s1,8(sp)
    800046a0:	02010413          	addi	s0,sp,32
    800046a4:	00050493          	mv	s1,a0
    800046a8:	00008797          	auipc	a5,0x8
    800046ac:	2f078793          	addi	a5,a5,752 # 8000c998 <_ZTV7WorkerD+0x10>
    800046b0:	00f53023          	sd	a5,0(a0)
    800046b4:	ffffe097          	auipc	ra,0xffffe
    800046b8:	e88080e7          	jalr	-376(ra) # 8000253c <_ZN6ThreadD1Ev>
    800046bc:	00048513          	mv	a0,s1
    800046c0:	ffffe097          	auipc	ra,0xffffe
    800046c4:	fbc080e7          	jalr	-68(ra) # 8000267c <_ZdlPv>
    800046c8:	01813083          	ld	ra,24(sp)
    800046cc:	01013403          	ld	s0,16(sp)
    800046d0:	00813483          	ld	s1,8(sp)
    800046d4:	02010113          	addi	sp,sp,32
    800046d8:	00008067          	ret

00000000800046dc <_ZN7WorkerA3runEv>:
    void run() override {
    800046dc:	ff010113          	addi	sp,sp,-16
    800046e0:	00113423          	sd	ra,8(sp)
    800046e4:	00813023          	sd	s0,0(sp)
    800046e8:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    800046ec:	00000593          	li	a1,0
    800046f0:	fffff097          	auipc	ra,0xfffff
    800046f4:	774080e7          	jalr	1908(ra) # 80003e64 <_ZN7WorkerA11workerBodyAEPv>
    }
    800046f8:	00813083          	ld	ra,8(sp)
    800046fc:	00013403          	ld	s0,0(sp)
    80004700:	01010113          	addi	sp,sp,16
    80004704:	00008067          	ret

0000000080004708 <_ZN7WorkerB3runEv>:
    void run() override {
    80004708:	ff010113          	addi	sp,sp,-16
    8000470c:	00113423          	sd	ra,8(sp)
    80004710:	00813023          	sd	s0,0(sp)
    80004714:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80004718:	00000593          	li	a1,0
    8000471c:	00000097          	auipc	ra,0x0
    80004720:	814080e7          	jalr	-2028(ra) # 80003f30 <_ZN7WorkerB11workerBodyBEPv>
    }
    80004724:	00813083          	ld	ra,8(sp)
    80004728:	00013403          	ld	s0,0(sp)
    8000472c:	01010113          	addi	sp,sp,16
    80004730:	00008067          	ret

0000000080004734 <_ZN7WorkerC3runEv>:
    void run() override {
    80004734:	ff010113          	addi	sp,sp,-16
    80004738:	00113423          	sd	ra,8(sp)
    8000473c:	00813023          	sd	s0,0(sp)
    80004740:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80004744:	00000593          	li	a1,0
    80004748:	00000097          	auipc	ra,0x0
    8000474c:	8bc080e7          	jalr	-1860(ra) # 80004004 <_ZN7WorkerC11workerBodyCEPv>
    }
    80004750:	00813083          	ld	ra,8(sp)
    80004754:	00013403          	ld	s0,0(sp)
    80004758:	01010113          	addi	sp,sp,16
    8000475c:	00008067          	ret

0000000080004760 <_ZN7WorkerD3runEv>:
    void run() override {
    80004760:	ff010113          	addi	sp,sp,-16
    80004764:	00113423          	sd	ra,8(sp)
    80004768:	00813023          	sd	s0,0(sp)
    8000476c:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80004770:	00000593          	li	a1,0
    80004774:	00000097          	auipc	ra,0x0
    80004778:	a10080e7          	jalr	-1520(ra) # 80004184 <_ZN7WorkerD11workerBodyDEPv>
    }
    8000477c:	00813083          	ld	ra,8(sp)
    80004780:	00013403          	ld	s0,0(sp)
    80004784:	01010113          	addi	sp,sp,16
    80004788:	00008067          	ret

000000008000478c <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    8000478c:	f8010113          	addi	sp,sp,-128
    80004790:	06113c23          	sd	ra,120(sp)
    80004794:	06813823          	sd	s0,112(sp)
    80004798:	06913423          	sd	s1,104(sp)
    8000479c:	07213023          	sd	s2,96(sp)
    800047a0:	05313c23          	sd	s3,88(sp)
    800047a4:	05413823          	sd	s4,80(sp)
    800047a8:	05513423          	sd	s5,72(sp)
    800047ac:	05613023          	sd	s6,64(sp)
    800047b0:	03713c23          	sd	s7,56(sp)
    800047b4:	03813823          	sd	s8,48(sp)
    800047b8:	03913423          	sd	s9,40(sp)
    800047bc:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    800047c0:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    800047c4:	00006517          	auipc	a0,0x6
    800047c8:	a7450513          	addi	a0,a0,-1420 # 8000a238 <_ZZ9kPrintIntmE6digits+0x1c8>
    800047cc:	00001097          	auipc	ra,0x1
    800047d0:	5a8080e7          	jalr	1448(ra) # 80005d74 <_Z11printStringPKc>
    getString(input, 30);
    800047d4:	01e00593          	li	a1,30
    800047d8:	f8040493          	addi	s1,s0,-128
    800047dc:	00048513          	mv	a0,s1
    800047e0:	00001097          	auipc	ra,0x1
    800047e4:	61c080e7          	jalr	1564(ra) # 80005dfc <_Z9getStringPci>
    threadNum = stringToInt(input);
    800047e8:	00048513          	mv	a0,s1
    800047ec:	00001097          	auipc	ra,0x1
    800047f0:	6e8080e7          	jalr	1768(ra) # 80005ed4 <_Z11stringToIntPKc>
    800047f4:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    800047f8:	00006517          	auipc	a0,0x6
    800047fc:	a6050513          	addi	a0,a0,-1440 # 8000a258 <_ZZ9kPrintIntmE6digits+0x1e8>
    80004800:	00001097          	auipc	ra,0x1
    80004804:	574080e7          	jalr	1396(ra) # 80005d74 <_Z11printStringPKc>
    getString(input, 30);
    80004808:	01e00593          	li	a1,30
    8000480c:	00048513          	mv	a0,s1
    80004810:	00001097          	auipc	ra,0x1
    80004814:	5ec080e7          	jalr	1516(ra) # 80005dfc <_Z9getStringPci>
    n = stringToInt(input);
    80004818:	00048513          	mv	a0,s1
    8000481c:	00001097          	auipc	ra,0x1
    80004820:	6b8080e7          	jalr	1720(ra) # 80005ed4 <_Z11stringToIntPKc>
    80004824:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80004828:	00006517          	auipc	a0,0x6
    8000482c:	a5050513          	addi	a0,a0,-1456 # 8000a278 <_ZZ9kPrintIntmE6digits+0x208>
    80004830:	00001097          	auipc	ra,0x1
    80004834:	544080e7          	jalr	1348(ra) # 80005d74 <_Z11printStringPKc>
    printInt(threadNum);
    80004838:	00000613          	li	a2,0
    8000483c:	00a00593          	li	a1,10
    80004840:	00098513          	mv	a0,s3
    80004844:	00001097          	auipc	ra,0x1
    80004848:	6e0080e7          	jalr	1760(ra) # 80005f24 <_Z8printIntiii>
    printString(" i velicina bafera ");
    8000484c:	00006517          	auipc	a0,0x6
    80004850:	a4450513          	addi	a0,a0,-1468 # 8000a290 <_ZZ9kPrintIntmE6digits+0x220>
    80004854:	00001097          	auipc	ra,0x1
    80004858:	520080e7          	jalr	1312(ra) # 80005d74 <_Z11printStringPKc>
    printInt(n);
    8000485c:	00000613          	li	a2,0
    80004860:	00a00593          	li	a1,10
    80004864:	00048513          	mv	a0,s1
    80004868:	00001097          	auipc	ra,0x1
    8000486c:	6bc080e7          	jalr	1724(ra) # 80005f24 <_Z8printIntiii>
    printString(".\n");
    80004870:	00006517          	auipc	a0,0x6
    80004874:	a3850513          	addi	a0,a0,-1480 # 8000a2a8 <_ZZ9kPrintIntmE6digits+0x238>
    80004878:	00001097          	auipc	ra,0x1
    8000487c:	4fc080e7          	jalr	1276(ra) # 80005d74 <_Z11printStringPKc>
    if (threadNum > n) {
    80004880:	0334c463          	blt	s1,s3,800048a8 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    80004884:	03305c63          	blez	s3,800048bc <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80004888:	03800513          	li	a0,56
    8000488c:	ffffe097          	auipc	ra,0xffffe
    80004890:	da0080e7          	jalr	-608(ra) # 8000262c <_Znwm>
    80004894:	00050a93          	mv	s5,a0
    80004898:	00048593          	mv	a1,s1
    8000489c:	00001097          	auipc	ra,0x1
    800048a0:	7a8080e7          	jalr	1960(ra) # 80006044 <_ZN9BufferCPPC1Ei>
    800048a4:	0300006f          	j	800048d4 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800048a8:	00006517          	auipc	a0,0x6
    800048ac:	a0850513          	addi	a0,a0,-1528 # 8000a2b0 <_ZZ9kPrintIntmE6digits+0x240>
    800048b0:	00001097          	auipc	ra,0x1
    800048b4:	4c4080e7          	jalr	1220(ra) # 80005d74 <_Z11printStringPKc>
        return;
    800048b8:	0140006f          	j	800048cc <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800048bc:	00006517          	auipc	a0,0x6
    800048c0:	a3450513          	addi	a0,a0,-1484 # 8000a2f0 <_ZZ9kPrintIntmE6digits+0x280>
    800048c4:	00001097          	auipc	ra,0x1
    800048c8:	4b0080e7          	jalr	1200(ra) # 80005d74 <_Z11printStringPKc>
        return;
    800048cc:	000c0113          	mv	sp,s8
    800048d0:	2140006f          	j	80004ae4 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    800048d4:	01000513          	li	a0,16
    800048d8:	ffffe097          	auipc	ra,0xffffe
    800048dc:	d54080e7          	jalr	-684(ra) # 8000262c <_Znwm>
    800048e0:	00050913          	mv	s2,a0
    800048e4:	00000593          	li	a1,0
    800048e8:	ffffe097          	auipc	ra,0xffffe
    800048ec:	088080e7          	jalr	136(ra) # 80002970 <_ZN9SemaphoreC1Ej>
    800048f0:	00008797          	auipc	a5,0x8
    800048f4:	3f27b023          	sd	s2,992(a5) # 8000ccd0 <_ZL10waitForAll>
    Thread *producers[threadNum];
    800048f8:	00399793          	slli	a5,s3,0x3
    800048fc:	00f78793          	addi	a5,a5,15
    80004900:	ff07f793          	andi	a5,a5,-16
    80004904:	40f10133          	sub	sp,sp,a5
    80004908:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    8000490c:	0019871b          	addiw	a4,s3,1
    80004910:	00171793          	slli	a5,a4,0x1
    80004914:	00e787b3          	add	a5,a5,a4
    80004918:	00379793          	slli	a5,a5,0x3
    8000491c:	00f78793          	addi	a5,a5,15
    80004920:	ff07f793          	andi	a5,a5,-16
    80004924:	40f10133          	sub	sp,sp,a5
    80004928:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    8000492c:	00199493          	slli	s1,s3,0x1
    80004930:	013484b3          	add	s1,s1,s3
    80004934:	00349493          	slli	s1,s1,0x3
    80004938:	009b04b3          	add	s1,s6,s1
    8000493c:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80004940:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80004944:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004948:	02800513          	li	a0,40
    8000494c:	ffffe097          	auipc	ra,0xffffe
    80004950:	ce0080e7          	jalr	-800(ra) # 8000262c <_Znwm>
    80004954:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80004958:	ffffe097          	auipc	ra,0xffffe
    8000495c:	f9c080e7          	jalr	-100(ra) # 800028f4 <_ZN6ThreadC1Ev>
    80004960:	00008797          	auipc	a5,0x8
    80004964:	0b078793          	addi	a5,a5,176 # 8000ca10 <_ZTV8Consumer+0x10>
    80004968:	00fbb023          	sd	a5,0(s7)
    8000496c:	029bb023          	sd	s1,32(s7)
    consumer->start();
    80004970:	000b8513          	mv	a0,s7
    80004974:	ffffe097          	auipc	ra,0xffffe
    80004978:	e68080e7          	jalr	-408(ra) # 800027dc <_ZN6Thread5startEv>
    threadData[0].id = 0;
    8000497c:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    80004980:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    80004984:	00008797          	auipc	a5,0x8
    80004988:	34c7b783          	ld	a5,844(a5) # 8000ccd0 <_ZL10waitForAll>
    8000498c:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004990:	02800513          	li	a0,40
    80004994:	ffffe097          	auipc	ra,0xffffe
    80004998:	c98080e7          	jalr	-872(ra) # 8000262c <_Znwm>
    8000499c:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    800049a0:	ffffe097          	auipc	ra,0xffffe
    800049a4:	f54080e7          	jalr	-172(ra) # 800028f4 <_ZN6ThreadC1Ev>
    800049a8:	00008797          	auipc	a5,0x8
    800049ac:	01878793          	addi	a5,a5,24 # 8000c9c0 <_ZTV16ProducerKeyborad+0x10>
    800049b0:	00f4b023          	sd	a5,0(s1)
    800049b4:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800049b8:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    800049bc:	00048513          	mv	a0,s1
    800049c0:	ffffe097          	auipc	ra,0xffffe
    800049c4:	e1c080e7          	jalr	-484(ra) # 800027dc <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    800049c8:	00100913          	li	s2,1
    800049cc:	0300006f          	j	800049fc <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    800049d0:	00008797          	auipc	a5,0x8
    800049d4:	01878793          	addi	a5,a5,24 # 8000c9e8 <_ZTV8Producer+0x10>
    800049d8:	00fcb023          	sd	a5,0(s9)
    800049dc:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    800049e0:	00391793          	slli	a5,s2,0x3
    800049e4:	00fa07b3          	add	a5,s4,a5
    800049e8:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    800049ec:	000c8513          	mv	a0,s9
    800049f0:	ffffe097          	auipc	ra,0xffffe
    800049f4:	dec080e7          	jalr	-532(ra) # 800027dc <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    800049f8:	0019091b          	addiw	s2,s2,1
    800049fc:	05395263          	bge	s2,s3,80004a40 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80004a00:	00191493          	slli	s1,s2,0x1
    80004a04:	012484b3          	add	s1,s1,s2
    80004a08:	00349493          	slli	s1,s1,0x3
    80004a0c:	009b04b3          	add	s1,s6,s1
    80004a10:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80004a14:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80004a18:	00008797          	auipc	a5,0x8
    80004a1c:	2b87b783          	ld	a5,696(a5) # 8000ccd0 <_ZL10waitForAll>
    80004a20:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80004a24:	02800513          	li	a0,40
    80004a28:	ffffe097          	auipc	ra,0xffffe
    80004a2c:	c04080e7          	jalr	-1020(ra) # 8000262c <_Znwm>
    80004a30:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004a34:	ffffe097          	auipc	ra,0xffffe
    80004a38:	ec0080e7          	jalr	-320(ra) # 800028f4 <_ZN6ThreadC1Ev>
    80004a3c:	f95ff06f          	j	800049d0 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    80004a40:	ffffe097          	auipc	ra,0xffffe
    80004a44:	e00080e7          	jalr	-512(ra) # 80002840 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80004a48:	00000493          	li	s1,0
    80004a4c:	0099ce63          	blt	s3,s1,80004a68 <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    80004a50:	00008517          	auipc	a0,0x8
    80004a54:	28053503          	ld	a0,640(a0) # 8000ccd0 <_ZL10waitForAll>
    80004a58:	ffffe097          	auipc	ra,0xffffe
    80004a5c:	f50080e7          	jalr	-176(ra) # 800029a8 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80004a60:	0014849b          	addiw	s1,s1,1
    80004a64:	fe9ff06f          	j	80004a4c <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    80004a68:	00008517          	auipc	a0,0x8
    80004a6c:	26853503          	ld	a0,616(a0) # 8000ccd0 <_ZL10waitForAll>
    80004a70:	00050863          	beqz	a0,80004a80 <_Z20testConsumerProducerv+0x2f4>
    80004a74:	00053783          	ld	a5,0(a0)
    80004a78:	0087b783          	ld	a5,8(a5)
    80004a7c:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    80004a80:	00000493          	li	s1,0
    80004a84:	0080006f          	j	80004a8c <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    80004a88:	0014849b          	addiw	s1,s1,1
    80004a8c:	0334d263          	bge	s1,s3,80004ab0 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    80004a90:	00349793          	slli	a5,s1,0x3
    80004a94:	00fa07b3          	add	a5,s4,a5
    80004a98:	0007b503          	ld	a0,0(a5)
    80004a9c:	fe0506e3          	beqz	a0,80004a88 <_Z20testConsumerProducerv+0x2fc>
    80004aa0:	00053783          	ld	a5,0(a0)
    80004aa4:	0087b783          	ld	a5,8(a5)
    80004aa8:	000780e7          	jalr	a5
    80004aac:	fddff06f          	j	80004a88 <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    80004ab0:	000b8a63          	beqz	s7,80004ac4 <_Z20testConsumerProducerv+0x338>
    80004ab4:	000bb783          	ld	a5,0(s7)
    80004ab8:	0087b783          	ld	a5,8(a5)
    80004abc:	000b8513          	mv	a0,s7
    80004ac0:	000780e7          	jalr	a5
    delete buffer;
    80004ac4:	000a8e63          	beqz	s5,80004ae0 <_Z20testConsumerProducerv+0x354>
    80004ac8:	000a8513          	mv	a0,s5
    80004acc:	00002097          	auipc	ra,0x2
    80004ad0:	870080e7          	jalr	-1936(ra) # 8000633c <_ZN9BufferCPPD1Ev>
    80004ad4:	000a8513          	mv	a0,s5
    80004ad8:	ffffe097          	auipc	ra,0xffffe
    80004adc:	ba4080e7          	jalr	-1116(ra) # 8000267c <_ZdlPv>
    80004ae0:	000c0113          	mv	sp,s8
}
    80004ae4:	f8040113          	addi	sp,s0,-128
    80004ae8:	07813083          	ld	ra,120(sp)
    80004aec:	07013403          	ld	s0,112(sp)
    80004af0:	06813483          	ld	s1,104(sp)
    80004af4:	06013903          	ld	s2,96(sp)
    80004af8:	05813983          	ld	s3,88(sp)
    80004afc:	05013a03          	ld	s4,80(sp)
    80004b00:	04813a83          	ld	s5,72(sp)
    80004b04:	04013b03          	ld	s6,64(sp)
    80004b08:	03813b83          	ld	s7,56(sp)
    80004b0c:	03013c03          	ld	s8,48(sp)
    80004b10:	02813c83          	ld	s9,40(sp)
    80004b14:	08010113          	addi	sp,sp,128
    80004b18:	00008067          	ret
    80004b1c:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80004b20:	000a8513          	mv	a0,s5
    80004b24:	ffffe097          	auipc	ra,0xffffe
    80004b28:	b58080e7          	jalr	-1192(ra) # 8000267c <_ZdlPv>
    80004b2c:	00048513          	mv	a0,s1
    80004b30:	00009097          	auipc	ra,0x9
    80004b34:	298080e7          	jalr	664(ra) # 8000ddc8 <_Unwind_Resume>
    80004b38:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80004b3c:	00090513          	mv	a0,s2
    80004b40:	ffffe097          	auipc	ra,0xffffe
    80004b44:	b3c080e7          	jalr	-1220(ra) # 8000267c <_ZdlPv>
    80004b48:	00048513          	mv	a0,s1
    80004b4c:	00009097          	auipc	ra,0x9
    80004b50:	27c080e7          	jalr	636(ra) # 8000ddc8 <_Unwind_Resume>
    80004b54:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004b58:	000b8513          	mv	a0,s7
    80004b5c:	ffffe097          	auipc	ra,0xffffe
    80004b60:	b20080e7          	jalr	-1248(ra) # 8000267c <_ZdlPv>
    80004b64:	00048513          	mv	a0,s1
    80004b68:	00009097          	auipc	ra,0x9
    80004b6c:	260080e7          	jalr	608(ra) # 8000ddc8 <_Unwind_Resume>
    80004b70:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004b74:	00048513          	mv	a0,s1
    80004b78:	ffffe097          	auipc	ra,0xffffe
    80004b7c:	b04080e7          	jalr	-1276(ra) # 8000267c <_ZdlPv>
    80004b80:	00090513          	mv	a0,s2
    80004b84:	00009097          	auipc	ra,0x9
    80004b88:	244080e7          	jalr	580(ra) # 8000ddc8 <_Unwind_Resume>
    80004b8c:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    80004b90:	000c8513          	mv	a0,s9
    80004b94:	ffffe097          	auipc	ra,0xffffe
    80004b98:	ae8080e7          	jalr	-1304(ra) # 8000267c <_ZdlPv>
    80004b9c:	00048513          	mv	a0,s1
    80004ba0:	00009097          	auipc	ra,0x9
    80004ba4:	228080e7          	jalr	552(ra) # 8000ddc8 <_Unwind_Resume>

0000000080004ba8 <_ZN8Consumer3runEv>:
    void run() override {
    80004ba8:	fd010113          	addi	sp,sp,-48
    80004bac:	02113423          	sd	ra,40(sp)
    80004bb0:	02813023          	sd	s0,32(sp)
    80004bb4:	00913c23          	sd	s1,24(sp)
    80004bb8:	01213823          	sd	s2,16(sp)
    80004bbc:	01313423          	sd	s3,8(sp)
    80004bc0:	03010413          	addi	s0,sp,48
    80004bc4:	00050913          	mv	s2,a0
        int i = 0;
    80004bc8:	00000993          	li	s3,0
    80004bcc:	0100006f          	j	80004bdc <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    80004bd0:	00a00513          	li	a0,10
    80004bd4:	ffffe097          	auipc	ra,0xffffe
    80004bd8:	ec8080e7          	jalr	-312(ra) # 80002a9c <_ZN7Console4putcEc>
        while (!threadEnd) {
    80004bdc:	00008797          	auipc	a5,0x8
    80004be0:	0ec7a783          	lw	a5,236(a5) # 8000ccc8 <_ZL9threadEnd>
    80004be4:	04079a63          	bnez	a5,80004c38 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80004be8:	02093783          	ld	a5,32(s2)
    80004bec:	0087b503          	ld	a0,8(a5)
    80004bf0:	00001097          	auipc	ra,0x1
    80004bf4:	638080e7          	jalr	1592(ra) # 80006228 <_ZN9BufferCPP3getEv>
            i++;
    80004bf8:	0019849b          	addiw	s1,s3,1
    80004bfc:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80004c00:	0ff57513          	andi	a0,a0,255
    80004c04:	ffffe097          	auipc	ra,0xffffe
    80004c08:	e98080e7          	jalr	-360(ra) # 80002a9c <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80004c0c:	05000793          	li	a5,80
    80004c10:	02f4e4bb          	remw	s1,s1,a5
    80004c14:	fc0494e3          	bnez	s1,80004bdc <_ZN8Consumer3runEv+0x34>
    80004c18:	fb9ff06f          	j	80004bd0 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80004c1c:	02093783          	ld	a5,32(s2)
    80004c20:	0087b503          	ld	a0,8(a5)
    80004c24:	00001097          	auipc	ra,0x1
    80004c28:	604080e7          	jalr	1540(ra) # 80006228 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80004c2c:	0ff57513          	andi	a0,a0,255
    80004c30:	ffffe097          	auipc	ra,0xffffe
    80004c34:	e6c080e7          	jalr	-404(ra) # 80002a9c <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80004c38:	02093783          	ld	a5,32(s2)
    80004c3c:	0087b503          	ld	a0,8(a5)
    80004c40:	00001097          	auipc	ra,0x1
    80004c44:	674080e7          	jalr	1652(ra) # 800062b4 <_ZN9BufferCPP6getCntEv>
    80004c48:	fca04ae3          	bgtz	a0,80004c1c <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80004c4c:	02093783          	ld	a5,32(s2)
    80004c50:	0107b503          	ld	a0,16(a5)
    80004c54:	ffffe097          	auipc	ra,0xffffe
    80004c58:	d80080e7          	jalr	-640(ra) # 800029d4 <_ZN9Semaphore6signalEv>
    }
    80004c5c:	02813083          	ld	ra,40(sp)
    80004c60:	02013403          	ld	s0,32(sp)
    80004c64:	01813483          	ld	s1,24(sp)
    80004c68:	01013903          	ld	s2,16(sp)
    80004c6c:	00813983          	ld	s3,8(sp)
    80004c70:	03010113          	addi	sp,sp,48
    80004c74:	00008067          	ret

0000000080004c78 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80004c78:	ff010113          	addi	sp,sp,-16
    80004c7c:	00113423          	sd	ra,8(sp)
    80004c80:	00813023          	sd	s0,0(sp)
    80004c84:	01010413          	addi	s0,sp,16
    80004c88:	00008797          	auipc	a5,0x8
    80004c8c:	d8878793          	addi	a5,a5,-632 # 8000ca10 <_ZTV8Consumer+0x10>
    80004c90:	00f53023          	sd	a5,0(a0)
    80004c94:	ffffe097          	auipc	ra,0xffffe
    80004c98:	8a8080e7          	jalr	-1880(ra) # 8000253c <_ZN6ThreadD1Ev>
    80004c9c:	00813083          	ld	ra,8(sp)
    80004ca0:	00013403          	ld	s0,0(sp)
    80004ca4:	01010113          	addi	sp,sp,16
    80004ca8:	00008067          	ret

0000000080004cac <_ZN8ConsumerD0Ev>:
    80004cac:	fe010113          	addi	sp,sp,-32
    80004cb0:	00113c23          	sd	ra,24(sp)
    80004cb4:	00813823          	sd	s0,16(sp)
    80004cb8:	00913423          	sd	s1,8(sp)
    80004cbc:	02010413          	addi	s0,sp,32
    80004cc0:	00050493          	mv	s1,a0
    80004cc4:	00008797          	auipc	a5,0x8
    80004cc8:	d4c78793          	addi	a5,a5,-692 # 8000ca10 <_ZTV8Consumer+0x10>
    80004ccc:	00f53023          	sd	a5,0(a0)
    80004cd0:	ffffe097          	auipc	ra,0xffffe
    80004cd4:	86c080e7          	jalr	-1940(ra) # 8000253c <_ZN6ThreadD1Ev>
    80004cd8:	00048513          	mv	a0,s1
    80004cdc:	ffffe097          	auipc	ra,0xffffe
    80004ce0:	9a0080e7          	jalr	-1632(ra) # 8000267c <_ZdlPv>
    80004ce4:	01813083          	ld	ra,24(sp)
    80004ce8:	01013403          	ld	s0,16(sp)
    80004cec:	00813483          	ld	s1,8(sp)
    80004cf0:	02010113          	addi	sp,sp,32
    80004cf4:	00008067          	ret

0000000080004cf8 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80004cf8:	ff010113          	addi	sp,sp,-16
    80004cfc:	00113423          	sd	ra,8(sp)
    80004d00:	00813023          	sd	s0,0(sp)
    80004d04:	01010413          	addi	s0,sp,16
    80004d08:	00008797          	auipc	a5,0x8
    80004d0c:	cb878793          	addi	a5,a5,-840 # 8000c9c0 <_ZTV16ProducerKeyborad+0x10>
    80004d10:	00f53023          	sd	a5,0(a0)
    80004d14:	ffffe097          	auipc	ra,0xffffe
    80004d18:	828080e7          	jalr	-2008(ra) # 8000253c <_ZN6ThreadD1Ev>
    80004d1c:	00813083          	ld	ra,8(sp)
    80004d20:	00013403          	ld	s0,0(sp)
    80004d24:	01010113          	addi	sp,sp,16
    80004d28:	00008067          	ret

0000000080004d2c <_ZN16ProducerKeyboradD0Ev>:
    80004d2c:	fe010113          	addi	sp,sp,-32
    80004d30:	00113c23          	sd	ra,24(sp)
    80004d34:	00813823          	sd	s0,16(sp)
    80004d38:	00913423          	sd	s1,8(sp)
    80004d3c:	02010413          	addi	s0,sp,32
    80004d40:	00050493          	mv	s1,a0
    80004d44:	00008797          	auipc	a5,0x8
    80004d48:	c7c78793          	addi	a5,a5,-900 # 8000c9c0 <_ZTV16ProducerKeyborad+0x10>
    80004d4c:	00f53023          	sd	a5,0(a0)
    80004d50:	ffffd097          	auipc	ra,0xffffd
    80004d54:	7ec080e7          	jalr	2028(ra) # 8000253c <_ZN6ThreadD1Ev>
    80004d58:	00048513          	mv	a0,s1
    80004d5c:	ffffe097          	auipc	ra,0xffffe
    80004d60:	920080e7          	jalr	-1760(ra) # 8000267c <_ZdlPv>
    80004d64:	01813083          	ld	ra,24(sp)
    80004d68:	01013403          	ld	s0,16(sp)
    80004d6c:	00813483          	ld	s1,8(sp)
    80004d70:	02010113          	addi	sp,sp,32
    80004d74:	00008067          	ret

0000000080004d78 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80004d78:	ff010113          	addi	sp,sp,-16
    80004d7c:	00113423          	sd	ra,8(sp)
    80004d80:	00813023          	sd	s0,0(sp)
    80004d84:	01010413          	addi	s0,sp,16
    80004d88:	00008797          	auipc	a5,0x8
    80004d8c:	c6078793          	addi	a5,a5,-928 # 8000c9e8 <_ZTV8Producer+0x10>
    80004d90:	00f53023          	sd	a5,0(a0)
    80004d94:	ffffd097          	auipc	ra,0xffffd
    80004d98:	7a8080e7          	jalr	1960(ra) # 8000253c <_ZN6ThreadD1Ev>
    80004d9c:	00813083          	ld	ra,8(sp)
    80004da0:	00013403          	ld	s0,0(sp)
    80004da4:	01010113          	addi	sp,sp,16
    80004da8:	00008067          	ret

0000000080004dac <_ZN8ProducerD0Ev>:
    80004dac:	fe010113          	addi	sp,sp,-32
    80004db0:	00113c23          	sd	ra,24(sp)
    80004db4:	00813823          	sd	s0,16(sp)
    80004db8:	00913423          	sd	s1,8(sp)
    80004dbc:	02010413          	addi	s0,sp,32
    80004dc0:	00050493          	mv	s1,a0
    80004dc4:	00008797          	auipc	a5,0x8
    80004dc8:	c2478793          	addi	a5,a5,-988 # 8000c9e8 <_ZTV8Producer+0x10>
    80004dcc:	00f53023          	sd	a5,0(a0)
    80004dd0:	ffffd097          	auipc	ra,0xffffd
    80004dd4:	76c080e7          	jalr	1900(ra) # 8000253c <_ZN6ThreadD1Ev>
    80004dd8:	00048513          	mv	a0,s1
    80004ddc:	ffffe097          	auipc	ra,0xffffe
    80004de0:	8a0080e7          	jalr	-1888(ra) # 8000267c <_ZdlPv>
    80004de4:	01813083          	ld	ra,24(sp)
    80004de8:	01013403          	ld	s0,16(sp)
    80004dec:	00813483          	ld	s1,8(sp)
    80004df0:	02010113          	addi	sp,sp,32
    80004df4:	00008067          	ret

0000000080004df8 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80004df8:	fe010113          	addi	sp,sp,-32
    80004dfc:	00113c23          	sd	ra,24(sp)
    80004e00:	00813823          	sd	s0,16(sp)
    80004e04:	00913423          	sd	s1,8(sp)
    80004e08:	02010413          	addi	s0,sp,32
    80004e0c:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80004e10:	ffffc097          	auipc	ra,0xffffc
    80004e14:	758080e7          	jalr	1880(ra) # 80001568 <_Z4getcv>
    80004e18:	0005059b          	sext.w	a1,a0
    80004e1c:	01b00793          	li	a5,27
    80004e20:	00f58c63          	beq	a1,a5,80004e38 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80004e24:	0204b783          	ld	a5,32(s1)
    80004e28:	0087b503          	ld	a0,8(a5)
    80004e2c:	00001097          	auipc	ra,0x1
    80004e30:	36c080e7          	jalr	876(ra) # 80006198 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80004e34:	fddff06f          	j	80004e10 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80004e38:	00100793          	li	a5,1
    80004e3c:	00008717          	auipc	a4,0x8
    80004e40:	e8f72623          	sw	a5,-372(a4) # 8000ccc8 <_ZL9threadEnd>
        td->buffer->put('!');
    80004e44:	0204b783          	ld	a5,32(s1)
    80004e48:	02100593          	li	a1,33
    80004e4c:	0087b503          	ld	a0,8(a5)
    80004e50:	00001097          	auipc	ra,0x1
    80004e54:	348080e7          	jalr	840(ra) # 80006198 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80004e58:	0204b783          	ld	a5,32(s1)
    80004e5c:	0107b503          	ld	a0,16(a5)
    80004e60:	ffffe097          	auipc	ra,0xffffe
    80004e64:	b74080e7          	jalr	-1164(ra) # 800029d4 <_ZN9Semaphore6signalEv>
    }
    80004e68:	01813083          	ld	ra,24(sp)
    80004e6c:	01013403          	ld	s0,16(sp)
    80004e70:	00813483          	ld	s1,8(sp)
    80004e74:	02010113          	addi	sp,sp,32
    80004e78:	00008067          	ret

0000000080004e7c <_ZN8Producer3runEv>:
    void run() override {
    80004e7c:	fe010113          	addi	sp,sp,-32
    80004e80:	00113c23          	sd	ra,24(sp)
    80004e84:	00813823          	sd	s0,16(sp)
    80004e88:	00913423          	sd	s1,8(sp)
    80004e8c:	01213023          	sd	s2,0(sp)
    80004e90:	02010413          	addi	s0,sp,32
    80004e94:	00050493          	mv	s1,a0
        int i = 0;
    80004e98:	00000913          	li	s2,0
        while (!threadEnd) {
    80004e9c:	00008797          	auipc	a5,0x8
    80004ea0:	e2c7a783          	lw	a5,-468(a5) # 8000ccc8 <_ZL9threadEnd>
    80004ea4:	04079263          	bnez	a5,80004ee8 <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    80004ea8:	0204b783          	ld	a5,32(s1)
    80004eac:	0007a583          	lw	a1,0(a5)
    80004eb0:	0305859b          	addiw	a1,a1,48
    80004eb4:	0087b503          	ld	a0,8(a5)
    80004eb8:	00001097          	auipc	ra,0x1
    80004ebc:	2e0080e7          	jalr	736(ra) # 80006198 <_ZN9BufferCPP3putEi>
            i++;
    80004ec0:	0019071b          	addiw	a4,s2,1
    80004ec4:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    80004ec8:	0204b783          	ld	a5,32(s1)
    80004ecc:	0007a783          	lw	a5,0(a5)
    80004ed0:	00e787bb          	addw	a5,a5,a4
    80004ed4:	00500513          	li	a0,5
    80004ed8:	02a7e53b          	remw	a0,a5,a0
    80004edc:	ffffe097          	auipc	ra,0xffffe
    80004ee0:	98c080e7          	jalr	-1652(ra) # 80002868 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80004ee4:	fb9ff06f          	j	80004e9c <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80004ee8:	0204b783          	ld	a5,32(s1)
    80004eec:	0107b503          	ld	a0,16(a5)
    80004ef0:	ffffe097          	auipc	ra,0xffffe
    80004ef4:	ae4080e7          	jalr	-1308(ra) # 800029d4 <_ZN9Semaphore6signalEv>
    }
    80004ef8:	01813083          	ld	ra,24(sp)
    80004efc:	01013403          	ld	s0,16(sp)
    80004f00:	00813483          	ld	s1,8(sp)
    80004f04:	00013903          	ld	s2,0(sp)
    80004f08:	02010113          	addi	sp,sp,32
    80004f0c:	00008067          	ret

0000000080004f10 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004f10:	fe010113          	addi	sp,sp,-32
    80004f14:	00113c23          	sd	ra,24(sp)
    80004f18:	00813823          	sd	s0,16(sp)
    80004f1c:	00913423          	sd	s1,8(sp)
    80004f20:	01213023          	sd	s2,0(sp)
    80004f24:	02010413          	addi	s0,sp,32
    80004f28:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004f2c:	00100793          	li	a5,1
    80004f30:	02a7f863          	bgeu	a5,a0,80004f60 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004f34:	00a00793          	li	a5,10
    80004f38:	02f577b3          	remu	a5,a0,a5
    80004f3c:	02078e63          	beqz	a5,80004f78 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004f40:	fff48513          	addi	a0,s1,-1
    80004f44:	00000097          	auipc	ra,0x0
    80004f48:	fcc080e7          	jalr	-52(ra) # 80004f10 <_ZL9fibonaccim>
    80004f4c:	00050913          	mv	s2,a0
    80004f50:	ffe48513          	addi	a0,s1,-2
    80004f54:	00000097          	auipc	ra,0x0
    80004f58:	fbc080e7          	jalr	-68(ra) # 80004f10 <_ZL9fibonaccim>
    80004f5c:	00a90533          	add	a0,s2,a0
}
    80004f60:	01813083          	ld	ra,24(sp)
    80004f64:	01013403          	ld	s0,16(sp)
    80004f68:	00813483          	ld	s1,8(sp)
    80004f6c:	00013903          	ld	s2,0(sp)
    80004f70:	02010113          	addi	sp,sp,32
    80004f74:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80004f78:	ffffc097          	auipc	ra,0xffffc
    80004f7c:	4b0080e7          	jalr	1200(ra) # 80001428 <_Z15thread_dispatchv>
    80004f80:	fc1ff06f          	j	80004f40 <_ZL9fibonaccim+0x30>

0000000080004f84 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80004f84:	fe010113          	addi	sp,sp,-32
    80004f88:	00113c23          	sd	ra,24(sp)
    80004f8c:	00813823          	sd	s0,16(sp)
    80004f90:	00913423          	sd	s1,8(sp)
    80004f94:	01213023          	sd	s2,0(sp)
    80004f98:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004f9c:	00a00493          	li	s1,10
    80004fa0:	0400006f          	j	80004fe0 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004fa4:	00005517          	auipc	a0,0x5
    80004fa8:	3ec50513          	addi	a0,a0,1004 # 8000a390 <_ZZ9kPrintIntmE6digits+0x320>
    80004fac:	00001097          	auipc	ra,0x1
    80004fb0:	dc8080e7          	jalr	-568(ra) # 80005d74 <_Z11printStringPKc>
    80004fb4:	00000613          	li	a2,0
    80004fb8:	00a00593          	li	a1,10
    80004fbc:	00048513          	mv	a0,s1
    80004fc0:	00001097          	auipc	ra,0x1
    80004fc4:	f64080e7          	jalr	-156(ra) # 80005f24 <_Z8printIntiii>
    80004fc8:	00005517          	auipc	a0,0x5
    80004fcc:	5b850513          	addi	a0,a0,1464 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80004fd0:	00001097          	auipc	ra,0x1
    80004fd4:	da4080e7          	jalr	-604(ra) # 80005d74 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004fd8:	0014849b          	addiw	s1,s1,1
    80004fdc:	0ff4f493          	andi	s1,s1,255
    80004fe0:	00c00793          	li	a5,12
    80004fe4:	fc97f0e3          	bgeu	a5,s1,80004fa4 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80004fe8:	00005517          	auipc	a0,0x5
    80004fec:	3b050513          	addi	a0,a0,944 # 8000a398 <_ZZ9kPrintIntmE6digits+0x328>
    80004ff0:	00001097          	auipc	ra,0x1
    80004ff4:	d84080e7          	jalr	-636(ra) # 80005d74 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004ff8:	00500313          	li	t1,5
    thread_dispatch();
    80004ffc:	ffffc097          	auipc	ra,0xffffc
    80005000:	42c080e7          	jalr	1068(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80005004:	01000513          	li	a0,16
    80005008:	00000097          	auipc	ra,0x0
    8000500c:	f08080e7          	jalr	-248(ra) # 80004f10 <_ZL9fibonaccim>
    80005010:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80005014:	00005517          	auipc	a0,0x5
    80005018:	39450513          	addi	a0,a0,916 # 8000a3a8 <_ZZ9kPrintIntmE6digits+0x338>
    8000501c:	00001097          	auipc	ra,0x1
    80005020:	d58080e7          	jalr	-680(ra) # 80005d74 <_Z11printStringPKc>
    80005024:	00000613          	li	a2,0
    80005028:	00a00593          	li	a1,10
    8000502c:	0009051b          	sext.w	a0,s2
    80005030:	00001097          	auipc	ra,0x1
    80005034:	ef4080e7          	jalr	-268(ra) # 80005f24 <_Z8printIntiii>
    80005038:	00005517          	auipc	a0,0x5
    8000503c:	54850513          	addi	a0,a0,1352 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80005040:	00001097          	auipc	ra,0x1
    80005044:	d34080e7          	jalr	-716(ra) # 80005d74 <_Z11printStringPKc>
    80005048:	0400006f          	j	80005088 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000504c:	00005517          	auipc	a0,0x5
    80005050:	34450513          	addi	a0,a0,836 # 8000a390 <_ZZ9kPrintIntmE6digits+0x320>
    80005054:	00001097          	auipc	ra,0x1
    80005058:	d20080e7          	jalr	-736(ra) # 80005d74 <_Z11printStringPKc>
    8000505c:	00000613          	li	a2,0
    80005060:	00a00593          	li	a1,10
    80005064:	00048513          	mv	a0,s1
    80005068:	00001097          	auipc	ra,0x1
    8000506c:	ebc080e7          	jalr	-324(ra) # 80005f24 <_Z8printIntiii>
    80005070:	00005517          	auipc	a0,0x5
    80005074:	51050513          	addi	a0,a0,1296 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80005078:	00001097          	auipc	ra,0x1
    8000507c:	cfc080e7          	jalr	-772(ra) # 80005d74 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80005080:	0014849b          	addiw	s1,s1,1
    80005084:	0ff4f493          	andi	s1,s1,255
    80005088:	00f00793          	li	a5,15
    8000508c:	fc97f0e3          	bgeu	a5,s1,8000504c <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80005090:	00005517          	auipc	a0,0x5
    80005094:	32850513          	addi	a0,a0,808 # 8000a3b8 <_ZZ9kPrintIntmE6digits+0x348>
    80005098:	00001097          	auipc	ra,0x1
    8000509c:	cdc080e7          	jalr	-804(ra) # 80005d74 <_Z11printStringPKc>
    finishedD = true;
    800050a0:	00100793          	li	a5,1
    800050a4:	00008717          	auipc	a4,0x8
    800050a8:	c2f70a23          	sb	a5,-972(a4) # 8000ccd8 <_ZL9finishedD>
    thread_dispatch();
    800050ac:	ffffc097          	auipc	ra,0xffffc
    800050b0:	37c080e7          	jalr	892(ra) # 80001428 <_Z15thread_dispatchv>
}
    800050b4:	01813083          	ld	ra,24(sp)
    800050b8:	01013403          	ld	s0,16(sp)
    800050bc:	00813483          	ld	s1,8(sp)
    800050c0:	00013903          	ld	s2,0(sp)
    800050c4:	02010113          	addi	sp,sp,32
    800050c8:	00008067          	ret

00000000800050cc <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800050cc:	fe010113          	addi	sp,sp,-32
    800050d0:	00113c23          	sd	ra,24(sp)
    800050d4:	00813823          	sd	s0,16(sp)
    800050d8:	00913423          	sd	s1,8(sp)
    800050dc:	01213023          	sd	s2,0(sp)
    800050e0:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800050e4:	00000493          	li	s1,0
    800050e8:	0400006f          	j	80005128 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800050ec:	00005517          	auipc	a0,0x5
    800050f0:	26450513          	addi	a0,a0,612 # 8000a350 <_ZZ9kPrintIntmE6digits+0x2e0>
    800050f4:	00001097          	auipc	ra,0x1
    800050f8:	c80080e7          	jalr	-896(ra) # 80005d74 <_Z11printStringPKc>
    800050fc:	00000613          	li	a2,0
    80005100:	00a00593          	li	a1,10
    80005104:	00048513          	mv	a0,s1
    80005108:	00001097          	auipc	ra,0x1
    8000510c:	e1c080e7          	jalr	-484(ra) # 80005f24 <_Z8printIntiii>
    80005110:	00005517          	auipc	a0,0x5
    80005114:	47050513          	addi	a0,a0,1136 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80005118:	00001097          	auipc	ra,0x1
    8000511c:	c5c080e7          	jalr	-932(ra) # 80005d74 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80005120:	0014849b          	addiw	s1,s1,1
    80005124:	0ff4f493          	andi	s1,s1,255
    80005128:	00200793          	li	a5,2
    8000512c:	fc97f0e3          	bgeu	a5,s1,800050ec <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80005130:	00005517          	auipc	a0,0x5
    80005134:	22850513          	addi	a0,a0,552 # 8000a358 <_ZZ9kPrintIntmE6digits+0x2e8>
    80005138:	00001097          	auipc	ra,0x1
    8000513c:	c3c080e7          	jalr	-964(ra) # 80005d74 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80005140:	00700313          	li	t1,7
    thread_dispatch();
    80005144:	ffffc097          	auipc	ra,0xffffc
    80005148:	2e4080e7          	jalr	740(ra) # 80001428 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    8000514c:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80005150:	00005517          	auipc	a0,0x5
    80005154:	21850513          	addi	a0,a0,536 # 8000a368 <_ZZ9kPrintIntmE6digits+0x2f8>
    80005158:	00001097          	auipc	ra,0x1
    8000515c:	c1c080e7          	jalr	-996(ra) # 80005d74 <_Z11printStringPKc>
    80005160:	00000613          	li	a2,0
    80005164:	00a00593          	li	a1,10
    80005168:	0009051b          	sext.w	a0,s2
    8000516c:	00001097          	auipc	ra,0x1
    80005170:	db8080e7          	jalr	-584(ra) # 80005f24 <_Z8printIntiii>
    80005174:	00005517          	auipc	a0,0x5
    80005178:	40c50513          	addi	a0,a0,1036 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    8000517c:	00001097          	auipc	ra,0x1
    80005180:	bf8080e7          	jalr	-1032(ra) # 80005d74 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80005184:	00c00513          	li	a0,12
    80005188:	00000097          	auipc	ra,0x0
    8000518c:	d88080e7          	jalr	-632(ra) # 80004f10 <_ZL9fibonaccim>
    80005190:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80005194:	00005517          	auipc	a0,0x5
    80005198:	1dc50513          	addi	a0,a0,476 # 8000a370 <_ZZ9kPrintIntmE6digits+0x300>
    8000519c:	00001097          	auipc	ra,0x1
    800051a0:	bd8080e7          	jalr	-1064(ra) # 80005d74 <_Z11printStringPKc>
    800051a4:	00000613          	li	a2,0
    800051a8:	00a00593          	li	a1,10
    800051ac:	0009051b          	sext.w	a0,s2
    800051b0:	00001097          	auipc	ra,0x1
    800051b4:	d74080e7          	jalr	-652(ra) # 80005f24 <_Z8printIntiii>
    800051b8:	00005517          	auipc	a0,0x5
    800051bc:	3c850513          	addi	a0,a0,968 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800051c0:	00001097          	auipc	ra,0x1
    800051c4:	bb4080e7          	jalr	-1100(ra) # 80005d74 <_Z11printStringPKc>
    800051c8:	0400006f          	j	80005208 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800051cc:	00005517          	auipc	a0,0x5
    800051d0:	18450513          	addi	a0,a0,388 # 8000a350 <_ZZ9kPrintIntmE6digits+0x2e0>
    800051d4:	00001097          	auipc	ra,0x1
    800051d8:	ba0080e7          	jalr	-1120(ra) # 80005d74 <_Z11printStringPKc>
    800051dc:	00000613          	li	a2,0
    800051e0:	00a00593          	li	a1,10
    800051e4:	00048513          	mv	a0,s1
    800051e8:	00001097          	auipc	ra,0x1
    800051ec:	d3c080e7          	jalr	-708(ra) # 80005f24 <_Z8printIntiii>
    800051f0:	00005517          	auipc	a0,0x5
    800051f4:	39050513          	addi	a0,a0,912 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800051f8:	00001097          	auipc	ra,0x1
    800051fc:	b7c080e7          	jalr	-1156(ra) # 80005d74 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80005200:	0014849b          	addiw	s1,s1,1
    80005204:	0ff4f493          	andi	s1,s1,255
    80005208:	00500793          	li	a5,5
    8000520c:	fc97f0e3          	bgeu	a5,s1,800051cc <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    80005210:	00005517          	auipc	a0,0x5
    80005214:	17050513          	addi	a0,a0,368 # 8000a380 <_ZZ9kPrintIntmE6digits+0x310>
    80005218:	00001097          	auipc	ra,0x1
    8000521c:	b5c080e7          	jalr	-1188(ra) # 80005d74 <_Z11printStringPKc>
    finishedC = true;
    80005220:	00100793          	li	a5,1
    80005224:	00008717          	auipc	a4,0x8
    80005228:	aaf70aa3          	sb	a5,-1355(a4) # 8000ccd9 <_ZL9finishedC>
    thread_dispatch();
    8000522c:	ffffc097          	auipc	ra,0xffffc
    80005230:	1fc080e7          	jalr	508(ra) # 80001428 <_Z15thread_dispatchv>
}
    80005234:	01813083          	ld	ra,24(sp)
    80005238:	01013403          	ld	s0,16(sp)
    8000523c:	00813483          	ld	s1,8(sp)
    80005240:	00013903          	ld	s2,0(sp)
    80005244:	02010113          	addi	sp,sp,32
    80005248:	00008067          	ret

000000008000524c <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    8000524c:	fe010113          	addi	sp,sp,-32
    80005250:	00113c23          	sd	ra,24(sp)
    80005254:	00813823          	sd	s0,16(sp)
    80005258:	00913423          	sd	s1,8(sp)
    8000525c:	01213023          	sd	s2,0(sp)
    80005260:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80005264:	00000913          	li	s2,0
    80005268:	0380006f          	j	800052a0 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    8000526c:	ffffc097          	auipc	ra,0xffffc
    80005270:	1bc080e7          	jalr	444(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005274:	00148493          	addi	s1,s1,1
    80005278:	000027b7          	lui	a5,0x2
    8000527c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005280:	0097ee63          	bltu	a5,s1,8000529c <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005284:	00000713          	li	a4,0
    80005288:	000077b7          	lui	a5,0x7
    8000528c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005290:	fce7eee3          	bltu	a5,a4,8000526c <_ZL11workerBodyBPv+0x20>
    80005294:	00170713          	addi	a4,a4,1
    80005298:	ff1ff06f          	j	80005288 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    8000529c:	00190913          	addi	s2,s2,1
    800052a0:	00f00793          	li	a5,15
    800052a4:	0527e063          	bltu	a5,s2,800052e4 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800052a8:	00005517          	auipc	a0,0x5
    800052ac:	09050513          	addi	a0,a0,144 # 8000a338 <_ZZ9kPrintIntmE6digits+0x2c8>
    800052b0:	00001097          	auipc	ra,0x1
    800052b4:	ac4080e7          	jalr	-1340(ra) # 80005d74 <_Z11printStringPKc>
    800052b8:	00000613          	li	a2,0
    800052bc:	00a00593          	li	a1,10
    800052c0:	0009051b          	sext.w	a0,s2
    800052c4:	00001097          	auipc	ra,0x1
    800052c8:	c60080e7          	jalr	-928(ra) # 80005f24 <_Z8printIntiii>
    800052cc:	00005517          	auipc	a0,0x5
    800052d0:	2b450513          	addi	a0,a0,692 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800052d4:	00001097          	auipc	ra,0x1
    800052d8:	aa0080e7          	jalr	-1376(ra) # 80005d74 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800052dc:	00000493          	li	s1,0
    800052e0:	f99ff06f          	j	80005278 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    800052e4:	00005517          	auipc	a0,0x5
    800052e8:	05c50513          	addi	a0,a0,92 # 8000a340 <_ZZ9kPrintIntmE6digits+0x2d0>
    800052ec:	00001097          	auipc	ra,0x1
    800052f0:	a88080e7          	jalr	-1400(ra) # 80005d74 <_Z11printStringPKc>
    finishedB = true;
    800052f4:	00100793          	li	a5,1
    800052f8:	00008717          	auipc	a4,0x8
    800052fc:	9ef70123          	sb	a5,-1566(a4) # 8000ccda <_ZL9finishedB>
    thread_dispatch();
    80005300:	ffffc097          	auipc	ra,0xffffc
    80005304:	128080e7          	jalr	296(ra) # 80001428 <_Z15thread_dispatchv>
}
    80005308:	01813083          	ld	ra,24(sp)
    8000530c:	01013403          	ld	s0,16(sp)
    80005310:	00813483          	ld	s1,8(sp)
    80005314:	00013903          	ld	s2,0(sp)
    80005318:	02010113          	addi	sp,sp,32
    8000531c:	00008067          	ret

0000000080005320 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80005320:	fe010113          	addi	sp,sp,-32
    80005324:	00113c23          	sd	ra,24(sp)
    80005328:	00813823          	sd	s0,16(sp)
    8000532c:	00913423          	sd	s1,8(sp)
    80005330:	01213023          	sd	s2,0(sp)
    80005334:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80005338:	00000913          	li	s2,0
    8000533c:	0380006f          	j	80005374 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80005340:	ffffc097          	auipc	ra,0xffffc
    80005344:	0e8080e7          	jalr	232(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005348:	00148493          	addi	s1,s1,1
    8000534c:	000027b7          	lui	a5,0x2
    80005350:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005354:	0097ee63          	bltu	a5,s1,80005370 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005358:	00000713          	li	a4,0
    8000535c:	000077b7          	lui	a5,0x7
    80005360:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005364:	fce7eee3          	bltu	a5,a4,80005340 <_ZL11workerBodyAPv+0x20>
    80005368:	00170713          	addi	a4,a4,1
    8000536c:	ff1ff06f          	j	8000535c <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80005370:	00190913          	addi	s2,s2,1
    80005374:	00900793          	li	a5,9
    80005378:	0527e063          	bltu	a5,s2,800053b8 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    8000537c:	00005517          	auipc	a0,0x5
    80005380:	fa450513          	addi	a0,a0,-92 # 8000a320 <_ZZ9kPrintIntmE6digits+0x2b0>
    80005384:	00001097          	auipc	ra,0x1
    80005388:	9f0080e7          	jalr	-1552(ra) # 80005d74 <_Z11printStringPKc>
    8000538c:	00000613          	li	a2,0
    80005390:	00a00593          	li	a1,10
    80005394:	0009051b          	sext.w	a0,s2
    80005398:	00001097          	auipc	ra,0x1
    8000539c:	b8c080e7          	jalr	-1140(ra) # 80005f24 <_Z8printIntiii>
    800053a0:	00005517          	auipc	a0,0x5
    800053a4:	1e050513          	addi	a0,a0,480 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800053a8:	00001097          	auipc	ra,0x1
    800053ac:	9cc080e7          	jalr	-1588(ra) # 80005d74 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800053b0:	00000493          	li	s1,0
    800053b4:	f99ff06f          	j	8000534c <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    800053b8:	00005517          	auipc	a0,0x5
    800053bc:	f7050513          	addi	a0,a0,-144 # 8000a328 <_ZZ9kPrintIntmE6digits+0x2b8>
    800053c0:	00001097          	auipc	ra,0x1
    800053c4:	9b4080e7          	jalr	-1612(ra) # 80005d74 <_Z11printStringPKc>
    finishedA = true;
    800053c8:	00100793          	li	a5,1
    800053cc:	00008717          	auipc	a4,0x8
    800053d0:	90f707a3          	sb	a5,-1777(a4) # 8000ccdb <_ZL9finishedA>
}
    800053d4:	01813083          	ld	ra,24(sp)
    800053d8:	01013403          	ld	s0,16(sp)
    800053dc:	00813483          	ld	s1,8(sp)
    800053e0:	00013903          	ld	s2,0(sp)
    800053e4:	02010113          	addi	sp,sp,32
    800053e8:	00008067          	ret

00000000800053ec <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    800053ec:	fd010113          	addi	sp,sp,-48
    800053f0:	02113423          	sd	ra,40(sp)
    800053f4:	02813023          	sd	s0,32(sp)
    800053f8:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    800053fc:	00000613          	li	a2,0
    80005400:	00000597          	auipc	a1,0x0
    80005404:	f2058593          	addi	a1,a1,-224 # 80005320 <_ZL11workerBodyAPv>
    80005408:	fd040513          	addi	a0,s0,-48
    8000540c:	ffffc097          	auipc	ra,0xffffc
    80005410:	f74080e7          	jalr	-140(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80005414:	00005517          	auipc	a0,0x5
    80005418:	fb450513          	addi	a0,a0,-76 # 8000a3c8 <_ZZ9kPrintIntmE6digits+0x358>
    8000541c:	00001097          	auipc	ra,0x1
    80005420:	958080e7          	jalr	-1704(ra) # 80005d74 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80005424:	00000613          	li	a2,0
    80005428:	00000597          	auipc	a1,0x0
    8000542c:	e2458593          	addi	a1,a1,-476 # 8000524c <_ZL11workerBodyBPv>
    80005430:	fd840513          	addi	a0,s0,-40
    80005434:	ffffc097          	auipc	ra,0xffffc
    80005438:	f4c080e7          	jalr	-180(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    8000543c:	00005517          	auipc	a0,0x5
    80005440:	fa450513          	addi	a0,a0,-92 # 8000a3e0 <_ZZ9kPrintIntmE6digits+0x370>
    80005444:	00001097          	auipc	ra,0x1
    80005448:	930080e7          	jalr	-1744(ra) # 80005d74 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    8000544c:	00000613          	li	a2,0
    80005450:	00000597          	auipc	a1,0x0
    80005454:	c7c58593          	addi	a1,a1,-900 # 800050cc <_ZL11workerBodyCPv>
    80005458:	fe040513          	addi	a0,s0,-32
    8000545c:	ffffc097          	auipc	ra,0xffffc
    80005460:	f24080e7          	jalr	-220(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80005464:	00005517          	auipc	a0,0x5
    80005468:	f9450513          	addi	a0,a0,-108 # 8000a3f8 <_ZZ9kPrintIntmE6digits+0x388>
    8000546c:	00001097          	auipc	ra,0x1
    80005470:	908080e7          	jalr	-1784(ra) # 80005d74 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80005474:	00000613          	li	a2,0
    80005478:	00000597          	auipc	a1,0x0
    8000547c:	b0c58593          	addi	a1,a1,-1268 # 80004f84 <_ZL11workerBodyDPv>
    80005480:	fe840513          	addi	a0,s0,-24
    80005484:	ffffc097          	auipc	ra,0xffffc
    80005488:	efc080e7          	jalr	-260(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    8000548c:	00005517          	auipc	a0,0x5
    80005490:	f8450513          	addi	a0,a0,-124 # 8000a410 <_ZZ9kPrintIntmE6digits+0x3a0>
    80005494:	00001097          	auipc	ra,0x1
    80005498:	8e0080e7          	jalr	-1824(ra) # 80005d74 <_Z11printStringPKc>
    8000549c:	00c0006f          	j	800054a8 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    800054a0:	ffffc097          	auipc	ra,0xffffc
    800054a4:	f88080e7          	jalr	-120(ra) # 80001428 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800054a8:	00008797          	auipc	a5,0x8
    800054ac:	8337c783          	lbu	a5,-1997(a5) # 8000ccdb <_ZL9finishedA>
    800054b0:	fe0788e3          	beqz	a5,800054a0 <_Z18Threads_C_API_testv+0xb4>
    800054b4:	00008797          	auipc	a5,0x8
    800054b8:	8267c783          	lbu	a5,-2010(a5) # 8000ccda <_ZL9finishedB>
    800054bc:	fe0782e3          	beqz	a5,800054a0 <_Z18Threads_C_API_testv+0xb4>
    800054c0:	00008797          	auipc	a5,0x8
    800054c4:	8197c783          	lbu	a5,-2023(a5) # 8000ccd9 <_ZL9finishedC>
    800054c8:	fc078ce3          	beqz	a5,800054a0 <_Z18Threads_C_API_testv+0xb4>
    800054cc:	00008797          	auipc	a5,0x8
    800054d0:	80c7c783          	lbu	a5,-2036(a5) # 8000ccd8 <_ZL9finishedD>
    800054d4:	fc0786e3          	beqz	a5,800054a0 <_Z18Threads_C_API_testv+0xb4>
    }

}
    800054d8:	02813083          	ld	ra,40(sp)
    800054dc:	02013403          	ld	s0,32(sp)
    800054e0:	03010113          	addi	sp,sp,48
    800054e4:	00008067          	ret

00000000800054e8 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    800054e8:	fd010113          	addi	sp,sp,-48
    800054ec:	02113423          	sd	ra,40(sp)
    800054f0:	02813023          	sd	s0,32(sp)
    800054f4:	00913c23          	sd	s1,24(sp)
    800054f8:	01213823          	sd	s2,16(sp)
    800054fc:	01313423          	sd	s3,8(sp)
    80005500:	03010413          	addi	s0,sp,48
    80005504:	00050993          	mv	s3,a0
    80005508:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    8000550c:	00000913          	li	s2,0
    80005510:	00c0006f          	j	8000551c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005514:	ffffd097          	auipc	ra,0xffffd
    80005518:	32c080e7          	jalr	812(ra) # 80002840 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    8000551c:	ffffc097          	auipc	ra,0xffffc
    80005520:	04c080e7          	jalr	76(ra) # 80001568 <_Z4getcv>
    80005524:	0005059b          	sext.w	a1,a0
    80005528:	01b00793          	li	a5,27
    8000552c:	02f58a63          	beq	a1,a5,80005560 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80005530:	0084b503          	ld	a0,8(s1)
    80005534:	00001097          	auipc	ra,0x1
    80005538:	c64080e7          	jalr	-924(ra) # 80006198 <_ZN9BufferCPP3putEi>
        i++;
    8000553c:	0019071b          	addiw	a4,s2,1
    80005540:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005544:	0004a683          	lw	a3,0(s1)
    80005548:	0026979b          	slliw	a5,a3,0x2
    8000554c:	00d787bb          	addw	a5,a5,a3
    80005550:	0017979b          	slliw	a5,a5,0x1
    80005554:	02f767bb          	remw	a5,a4,a5
    80005558:	fc0792e3          	bnez	a5,8000551c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    8000555c:	fb9ff06f          	j	80005514 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80005560:	00100793          	li	a5,1
    80005564:	00007717          	auipc	a4,0x7
    80005568:	76f72e23          	sw	a5,1916(a4) # 8000cce0 <_ZL9threadEnd>
    td->buffer->put('!');
    8000556c:	0209b783          	ld	a5,32(s3)
    80005570:	02100593          	li	a1,33
    80005574:	0087b503          	ld	a0,8(a5)
    80005578:	00001097          	auipc	ra,0x1
    8000557c:	c20080e7          	jalr	-992(ra) # 80006198 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80005580:	0104b503          	ld	a0,16(s1)
    80005584:	ffffd097          	auipc	ra,0xffffd
    80005588:	450080e7          	jalr	1104(ra) # 800029d4 <_ZN9Semaphore6signalEv>
}
    8000558c:	02813083          	ld	ra,40(sp)
    80005590:	02013403          	ld	s0,32(sp)
    80005594:	01813483          	ld	s1,24(sp)
    80005598:	01013903          	ld	s2,16(sp)
    8000559c:	00813983          	ld	s3,8(sp)
    800055a0:	03010113          	addi	sp,sp,48
    800055a4:	00008067          	ret

00000000800055a8 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    800055a8:	fe010113          	addi	sp,sp,-32
    800055ac:	00113c23          	sd	ra,24(sp)
    800055b0:	00813823          	sd	s0,16(sp)
    800055b4:	00913423          	sd	s1,8(sp)
    800055b8:	01213023          	sd	s2,0(sp)
    800055bc:	02010413          	addi	s0,sp,32
    800055c0:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800055c4:	00000913          	li	s2,0
    800055c8:	00c0006f          	j	800055d4 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    800055cc:	ffffd097          	auipc	ra,0xffffd
    800055d0:	274080e7          	jalr	628(ra) # 80002840 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    800055d4:	00007797          	auipc	a5,0x7
    800055d8:	70c7a783          	lw	a5,1804(a5) # 8000cce0 <_ZL9threadEnd>
    800055dc:	02079e63          	bnez	a5,80005618 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    800055e0:	0004a583          	lw	a1,0(s1)
    800055e4:	0305859b          	addiw	a1,a1,48
    800055e8:	0084b503          	ld	a0,8(s1)
    800055ec:	00001097          	auipc	ra,0x1
    800055f0:	bac080e7          	jalr	-1108(ra) # 80006198 <_ZN9BufferCPP3putEi>
        i++;
    800055f4:	0019071b          	addiw	a4,s2,1
    800055f8:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800055fc:	0004a683          	lw	a3,0(s1)
    80005600:	0026979b          	slliw	a5,a3,0x2
    80005604:	00d787bb          	addw	a5,a5,a3
    80005608:	0017979b          	slliw	a5,a5,0x1
    8000560c:	02f767bb          	remw	a5,a4,a5
    80005610:	fc0792e3          	bnez	a5,800055d4 <_ZN12ProducerSync8producerEPv+0x2c>
    80005614:	fb9ff06f          	j	800055cc <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80005618:	0104b503          	ld	a0,16(s1)
    8000561c:	ffffd097          	auipc	ra,0xffffd
    80005620:	3b8080e7          	jalr	952(ra) # 800029d4 <_ZN9Semaphore6signalEv>
}
    80005624:	01813083          	ld	ra,24(sp)
    80005628:	01013403          	ld	s0,16(sp)
    8000562c:	00813483          	ld	s1,8(sp)
    80005630:	00013903          	ld	s2,0(sp)
    80005634:	02010113          	addi	sp,sp,32
    80005638:	00008067          	ret

000000008000563c <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    8000563c:	fd010113          	addi	sp,sp,-48
    80005640:	02113423          	sd	ra,40(sp)
    80005644:	02813023          	sd	s0,32(sp)
    80005648:	00913c23          	sd	s1,24(sp)
    8000564c:	01213823          	sd	s2,16(sp)
    80005650:	01313423          	sd	s3,8(sp)
    80005654:	01413023          	sd	s4,0(sp)
    80005658:	03010413          	addi	s0,sp,48
    8000565c:	00050993          	mv	s3,a0
    80005660:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005664:	00000a13          	li	s4,0
    80005668:	01c0006f          	j	80005684 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    8000566c:	ffffd097          	auipc	ra,0xffffd
    80005670:	1d4080e7          	jalr	468(ra) # 80002840 <_ZN6Thread8dispatchEv>
    80005674:	0500006f          	j	800056c4 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80005678:	00a00513          	li	a0,10
    8000567c:	ffffc097          	auipc	ra,0xffffc
    80005680:	f14080e7          	jalr	-236(ra) # 80001590 <_Z4putcc>
    while (!threadEnd) {
    80005684:	00007797          	auipc	a5,0x7
    80005688:	65c7a783          	lw	a5,1628(a5) # 8000cce0 <_ZL9threadEnd>
    8000568c:	06079263          	bnez	a5,800056f0 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80005690:	00893503          	ld	a0,8(s2)
    80005694:	00001097          	auipc	ra,0x1
    80005698:	b94080e7          	jalr	-1132(ra) # 80006228 <_ZN9BufferCPP3getEv>
        i++;
    8000569c:	001a049b          	addiw	s1,s4,1
    800056a0:	00048a1b          	sext.w	s4,s1
        putc(key);
    800056a4:	0ff57513          	andi	a0,a0,255
    800056a8:	ffffc097          	auipc	ra,0xffffc
    800056ac:	ee8080e7          	jalr	-280(ra) # 80001590 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    800056b0:	00092703          	lw	a4,0(s2)
    800056b4:	0027179b          	slliw	a5,a4,0x2
    800056b8:	00e787bb          	addw	a5,a5,a4
    800056bc:	02f4e7bb          	remw	a5,s1,a5
    800056c0:	fa0786e3          	beqz	a5,8000566c <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    800056c4:	05000793          	li	a5,80
    800056c8:	02f4e4bb          	remw	s1,s1,a5
    800056cc:	fa049ce3          	bnez	s1,80005684 <_ZN12ConsumerSync8consumerEPv+0x48>
    800056d0:	fa9ff06f          	j	80005678 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    800056d4:	0209b783          	ld	a5,32(s3)
    800056d8:	0087b503          	ld	a0,8(a5)
    800056dc:	00001097          	auipc	ra,0x1
    800056e0:	b4c080e7          	jalr	-1204(ra) # 80006228 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    800056e4:	0ff57513          	andi	a0,a0,255
    800056e8:	ffffd097          	auipc	ra,0xffffd
    800056ec:	3b4080e7          	jalr	948(ra) # 80002a9c <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    800056f0:	0209b783          	ld	a5,32(s3)
    800056f4:	0087b503          	ld	a0,8(a5)
    800056f8:	00001097          	auipc	ra,0x1
    800056fc:	bbc080e7          	jalr	-1092(ra) # 800062b4 <_ZN9BufferCPP6getCntEv>
    80005700:	fca04ae3          	bgtz	a0,800056d4 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80005704:	01093503          	ld	a0,16(s2)
    80005708:	ffffd097          	auipc	ra,0xffffd
    8000570c:	2cc080e7          	jalr	716(ra) # 800029d4 <_ZN9Semaphore6signalEv>
}
    80005710:	02813083          	ld	ra,40(sp)
    80005714:	02013403          	ld	s0,32(sp)
    80005718:	01813483          	ld	s1,24(sp)
    8000571c:	01013903          	ld	s2,16(sp)
    80005720:	00813983          	ld	s3,8(sp)
    80005724:	00013a03          	ld	s4,0(sp)
    80005728:	03010113          	addi	sp,sp,48
    8000572c:	00008067          	ret

0000000080005730 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80005730:	f8010113          	addi	sp,sp,-128
    80005734:	06113c23          	sd	ra,120(sp)
    80005738:	06813823          	sd	s0,112(sp)
    8000573c:	06913423          	sd	s1,104(sp)
    80005740:	07213023          	sd	s2,96(sp)
    80005744:	05313c23          	sd	s3,88(sp)
    80005748:	05413823          	sd	s4,80(sp)
    8000574c:	05513423          	sd	s5,72(sp)
    80005750:	05613023          	sd	s6,64(sp)
    80005754:	03713c23          	sd	s7,56(sp)
    80005758:	03813823          	sd	s8,48(sp)
    8000575c:	03913423          	sd	s9,40(sp)
    80005760:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80005764:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80005768:	00005517          	auipc	a0,0x5
    8000576c:	ad050513          	addi	a0,a0,-1328 # 8000a238 <_ZZ9kPrintIntmE6digits+0x1c8>
    80005770:	00000097          	auipc	ra,0x0
    80005774:	604080e7          	jalr	1540(ra) # 80005d74 <_Z11printStringPKc>
    getString(input, 30);
    80005778:	01e00593          	li	a1,30
    8000577c:	f8040493          	addi	s1,s0,-128
    80005780:	00048513          	mv	a0,s1
    80005784:	00000097          	auipc	ra,0x0
    80005788:	678080e7          	jalr	1656(ra) # 80005dfc <_Z9getStringPci>
    threadNum = stringToInt(input);
    8000578c:	00048513          	mv	a0,s1
    80005790:	00000097          	auipc	ra,0x0
    80005794:	744080e7          	jalr	1860(ra) # 80005ed4 <_Z11stringToIntPKc>
    80005798:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    8000579c:	00005517          	auipc	a0,0x5
    800057a0:	abc50513          	addi	a0,a0,-1348 # 8000a258 <_ZZ9kPrintIntmE6digits+0x1e8>
    800057a4:	00000097          	auipc	ra,0x0
    800057a8:	5d0080e7          	jalr	1488(ra) # 80005d74 <_Z11printStringPKc>
    getString(input, 30);
    800057ac:	01e00593          	li	a1,30
    800057b0:	00048513          	mv	a0,s1
    800057b4:	00000097          	auipc	ra,0x0
    800057b8:	648080e7          	jalr	1608(ra) # 80005dfc <_Z9getStringPci>
    n = stringToInt(input);
    800057bc:	00048513          	mv	a0,s1
    800057c0:	00000097          	auipc	ra,0x0
    800057c4:	714080e7          	jalr	1812(ra) # 80005ed4 <_Z11stringToIntPKc>
    800057c8:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    800057cc:	00005517          	auipc	a0,0x5
    800057d0:	aac50513          	addi	a0,a0,-1364 # 8000a278 <_ZZ9kPrintIntmE6digits+0x208>
    800057d4:	00000097          	auipc	ra,0x0
    800057d8:	5a0080e7          	jalr	1440(ra) # 80005d74 <_Z11printStringPKc>
    800057dc:	00000613          	li	a2,0
    800057e0:	00a00593          	li	a1,10
    800057e4:	00090513          	mv	a0,s2
    800057e8:	00000097          	auipc	ra,0x0
    800057ec:	73c080e7          	jalr	1852(ra) # 80005f24 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    800057f0:	00005517          	auipc	a0,0x5
    800057f4:	aa050513          	addi	a0,a0,-1376 # 8000a290 <_ZZ9kPrintIntmE6digits+0x220>
    800057f8:	00000097          	auipc	ra,0x0
    800057fc:	57c080e7          	jalr	1404(ra) # 80005d74 <_Z11printStringPKc>
    80005800:	00000613          	li	a2,0
    80005804:	00a00593          	li	a1,10
    80005808:	00048513          	mv	a0,s1
    8000580c:	00000097          	auipc	ra,0x0
    80005810:	718080e7          	jalr	1816(ra) # 80005f24 <_Z8printIntiii>
    printString(".\n");
    80005814:	00005517          	auipc	a0,0x5
    80005818:	a9450513          	addi	a0,a0,-1388 # 8000a2a8 <_ZZ9kPrintIntmE6digits+0x238>
    8000581c:	00000097          	auipc	ra,0x0
    80005820:	558080e7          	jalr	1368(ra) # 80005d74 <_Z11printStringPKc>
    if(threadNum > n) {
    80005824:	0324c463          	blt	s1,s2,8000584c <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80005828:	03205c63          	blez	s2,80005860 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    8000582c:	03800513          	li	a0,56
    80005830:	ffffd097          	auipc	ra,0xffffd
    80005834:	dfc080e7          	jalr	-516(ra) # 8000262c <_Znwm>
    80005838:	00050a93          	mv	s5,a0
    8000583c:	00048593          	mv	a1,s1
    80005840:	00001097          	auipc	ra,0x1
    80005844:	804080e7          	jalr	-2044(ra) # 80006044 <_ZN9BufferCPPC1Ei>
    80005848:	0300006f          	j	80005878 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    8000584c:	00005517          	auipc	a0,0x5
    80005850:	a6450513          	addi	a0,a0,-1436 # 8000a2b0 <_ZZ9kPrintIntmE6digits+0x240>
    80005854:	00000097          	auipc	ra,0x0
    80005858:	520080e7          	jalr	1312(ra) # 80005d74 <_Z11printStringPKc>
        return;
    8000585c:	0140006f          	j	80005870 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80005860:	00005517          	auipc	a0,0x5
    80005864:	a9050513          	addi	a0,a0,-1392 # 8000a2f0 <_ZZ9kPrintIntmE6digits+0x280>
    80005868:	00000097          	auipc	ra,0x0
    8000586c:	50c080e7          	jalr	1292(ra) # 80005d74 <_Z11printStringPKc>
        return;
    80005870:	000b8113          	mv	sp,s7
    80005874:	2380006f          	j	80005aac <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80005878:	01000513          	li	a0,16
    8000587c:	ffffd097          	auipc	ra,0xffffd
    80005880:	db0080e7          	jalr	-592(ra) # 8000262c <_Znwm>
    80005884:	00050493          	mv	s1,a0
    80005888:	00000593          	li	a1,0
    8000588c:	ffffd097          	auipc	ra,0xffffd
    80005890:	0e4080e7          	jalr	228(ra) # 80002970 <_ZN9SemaphoreC1Ej>
    80005894:	00007797          	auipc	a5,0x7
    80005898:	4497ba23          	sd	s1,1108(a5) # 8000cce8 <_ZL10waitForAll>
    Thread* threads[threadNum];
    8000589c:	00391793          	slli	a5,s2,0x3
    800058a0:	00f78793          	addi	a5,a5,15
    800058a4:	ff07f793          	andi	a5,a5,-16
    800058a8:	40f10133          	sub	sp,sp,a5
    800058ac:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    800058b0:	0019071b          	addiw	a4,s2,1
    800058b4:	00171793          	slli	a5,a4,0x1
    800058b8:	00e787b3          	add	a5,a5,a4
    800058bc:	00379793          	slli	a5,a5,0x3
    800058c0:	00f78793          	addi	a5,a5,15
    800058c4:	ff07f793          	andi	a5,a5,-16
    800058c8:	40f10133          	sub	sp,sp,a5
    800058cc:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    800058d0:	00191c13          	slli	s8,s2,0x1
    800058d4:	012c07b3          	add	a5,s8,s2
    800058d8:	00379793          	slli	a5,a5,0x3
    800058dc:	00fa07b3          	add	a5,s4,a5
    800058e0:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    800058e4:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    800058e8:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    800058ec:	02800513          	li	a0,40
    800058f0:	ffffd097          	auipc	ra,0xffffd
    800058f4:	d3c080e7          	jalr	-708(ra) # 8000262c <_Znwm>
    800058f8:	00050b13          	mv	s6,a0
    800058fc:	012c0c33          	add	s8,s8,s2
    80005900:	003c1c13          	slli	s8,s8,0x3
    80005904:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80005908:	ffffd097          	auipc	ra,0xffffd
    8000590c:	fec080e7          	jalr	-20(ra) # 800028f4 <_ZN6ThreadC1Ev>
    80005910:	00007797          	auipc	a5,0x7
    80005914:	17878793          	addi	a5,a5,376 # 8000ca88 <_ZTV12ConsumerSync+0x10>
    80005918:	00fb3023          	sd	a5,0(s6)
    8000591c:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80005920:	000b0513          	mv	a0,s6
    80005924:	ffffd097          	auipc	ra,0xffffd
    80005928:	eb8080e7          	jalr	-328(ra) # 800027dc <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    8000592c:	00000493          	li	s1,0
    80005930:	0380006f          	j	80005968 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005934:	00007797          	auipc	a5,0x7
    80005938:	12c78793          	addi	a5,a5,300 # 8000ca60 <_ZTV12ProducerSync+0x10>
    8000593c:	00fcb023          	sd	a5,0(s9)
    80005940:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80005944:	00349793          	slli	a5,s1,0x3
    80005948:	00f987b3          	add	a5,s3,a5
    8000594c:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80005950:	00349793          	slli	a5,s1,0x3
    80005954:	00f987b3          	add	a5,s3,a5
    80005958:	0007b503          	ld	a0,0(a5)
    8000595c:	ffffd097          	auipc	ra,0xffffd
    80005960:	e80080e7          	jalr	-384(ra) # 800027dc <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005964:	0014849b          	addiw	s1,s1,1
    80005968:	0b24d063          	bge	s1,s2,80005a08 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    8000596c:	00149793          	slli	a5,s1,0x1
    80005970:	009787b3          	add	a5,a5,s1
    80005974:	00379793          	slli	a5,a5,0x3
    80005978:	00fa07b3          	add	a5,s4,a5
    8000597c:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80005980:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80005984:	00007717          	auipc	a4,0x7
    80005988:	36473703          	ld	a4,868(a4) # 8000cce8 <_ZL10waitForAll>
    8000598c:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80005990:	02905863          	blez	s1,800059c0 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80005994:	02800513          	li	a0,40
    80005998:	ffffd097          	auipc	ra,0xffffd
    8000599c:	c94080e7          	jalr	-876(ra) # 8000262c <_Znwm>
    800059a0:	00050c93          	mv	s9,a0
    800059a4:	00149c13          	slli	s8,s1,0x1
    800059a8:	009c0c33          	add	s8,s8,s1
    800059ac:	003c1c13          	slli	s8,s8,0x3
    800059b0:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    800059b4:	ffffd097          	auipc	ra,0xffffd
    800059b8:	f40080e7          	jalr	-192(ra) # 800028f4 <_ZN6ThreadC1Ev>
    800059bc:	f79ff06f          	j	80005934 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    800059c0:	02800513          	li	a0,40
    800059c4:	ffffd097          	auipc	ra,0xffffd
    800059c8:	c68080e7          	jalr	-920(ra) # 8000262c <_Znwm>
    800059cc:	00050c93          	mv	s9,a0
    800059d0:	00149c13          	slli	s8,s1,0x1
    800059d4:	009c0c33          	add	s8,s8,s1
    800059d8:	003c1c13          	slli	s8,s8,0x3
    800059dc:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    800059e0:	ffffd097          	auipc	ra,0xffffd
    800059e4:	f14080e7          	jalr	-236(ra) # 800028f4 <_ZN6ThreadC1Ev>
    800059e8:	00007797          	auipc	a5,0x7
    800059ec:	05078793          	addi	a5,a5,80 # 8000ca38 <_ZTV16ProducerKeyboard+0x10>
    800059f0:	00fcb023          	sd	a5,0(s9)
    800059f4:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    800059f8:	00349793          	slli	a5,s1,0x3
    800059fc:	00f987b3          	add	a5,s3,a5
    80005a00:	0197b023          	sd	s9,0(a5)
    80005a04:	f4dff06f          	j	80005950 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80005a08:	ffffd097          	auipc	ra,0xffffd
    80005a0c:	e38080e7          	jalr	-456(ra) # 80002840 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80005a10:	00000493          	li	s1,0
    80005a14:	00994e63          	blt	s2,s1,80005a30 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80005a18:	00007517          	auipc	a0,0x7
    80005a1c:	2d053503          	ld	a0,720(a0) # 8000cce8 <_ZL10waitForAll>
    80005a20:	ffffd097          	auipc	ra,0xffffd
    80005a24:	f88080e7          	jalr	-120(ra) # 800029a8 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80005a28:	0014849b          	addiw	s1,s1,1
    80005a2c:	fe9ff06f          	j	80005a14 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80005a30:	00000493          	li	s1,0
    80005a34:	0080006f          	j	80005a3c <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80005a38:	0014849b          	addiw	s1,s1,1
    80005a3c:	0324d263          	bge	s1,s2,80005a60 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80005a40:	00349793          	slli	a5,s1,0x3
    80005a44:	00f987b3          	add	a5,s3,a5
    80005a48:	0007b503          	ld	a0,0(a5)
    80005a4c:	fe0506e3          	beqz	a0,80005a38 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80005a50:	00053783          	ld	a5,0(a0)
    80005a54:	0087b783          	ld	a5,8(a5)
    80005a58:	000780e7          	jalr	a5
    80005a5c:	fddff06f          	j	80005a38 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80005a60:	000b0a63          	beqz	s6,80005a74 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80005a64:	000b3783          	ld	a5,0(s6)
    80005a68:	0087b783          	ld	a5,8(a5)
    80005a6c:	000b0513          	mv	a0,s6
    80005a70:	000780e7          	jalr	a5
    delete waitForAll;
    80005a74:	00007517          	auipc	a0,0x7
    80005a78:	27453503          	ld	a0,628(a0) # 8000cce8 <_ZL10waitForAll>
    80005a7c:	00050863          	beqz	a0,80005a8c <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80005a80:	00053783          	ld	a5,0(a0)
    80005a84:	0087b783          	ld	a5,8(a5)
    80005a88:	000780e7          	jalr	a5
    delete buffer;
    80005a8c:	000a8e63          	beqz	s5,80005aa8 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80005a90:	000a8513          	mv	a0,s5
    80005a94:	00001097          	auipc	ra,0x1
    80005a98:	8a8080e7          	jalr	-1880(ra) # 8000633c <_ZN9BufferCPPD1Ev>
    80005a9c:	000a8513          	mv	a0,s5
    80005aa0:	ffffd097          	auipc	ra,0xffffd
    80005aa4:	bdc080e7          	jalr	-1060(ra) # 8000267c <_ZdlPv>
    80005aa8:	000b8113          	mv	sp,s7

}
    80005aac:	f8040113          	addi	sp,s0,-128
    80005ab0:	07813083          	ld	ra,120(sp)
    80005ab4:	07013403          	ld	s0,112(sp)
    80005ab8:	06813483          	ld	s1,104(sp)
    80005abc:	06013903          	ld	s2,96(sp)
    80005ac0:	05813983          	ld	s3,88(sp)
    80005ac4:	05013a03          	ld	s4,80(sp)
    80005ac8:	04813a83          	ld	s5,72(sp)
    80005acc:	04013b03          	ld	s6,64(sp)
    80005ad0:	03813b83          	ld	s7,56(sp)
    80005ad4:	03013c03          	ld	s8,48(sp)
    80005ad8:	02813c83          	ld	s9,40(sp)
    80005adc:	08010113          	addi	sp,sp,128
    80005ae0:	00008067          	ret
    80005ae4:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80005ae8:	000a8513          	mv	a0,s5
    80005aec:	ffffd097          	auipc	ra,0xffffd
    80005af0:	b90080e7          	jalr	-1136(ra) # 8000267c <_ZdlPv>
    80005af4:	00048513          	mv	a0,s1
    80005af8:	00008097          	auipc	ra,0x8
    80005afc:	2d0080e7          	jalr	720(ra) # 8000ddc8 <_Unwind_Resume>
    80005b00:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80005b04:	00048513          	mv	a0,s1
    80005b08:	ffffd097          	auipc	ra,0xffffd
    80005b0c:	b74080e7          	jalr	-1164(ra) # 8000267c <_ZdlPv>
    80005b10:	00090513          	mv	a0,s2
    80005b14:	00008097          	auipc	ra,0x8
    80005b18:	2b4080e7          	jalr	692(ra) # 8000ddc8 <_Unwind_Resume>
    80005b1c:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80005b20:	000b0513          	mv	a0,s6
    80005b24:	ffffd097          	auipc	ra,0xffffd
    80005b28:	b58080e7          	jalr	-1192(ra) # 8000267c <_ZdlPv>
    80005b2c:	00048513          	mv	a0,s1
    80005b30:	00008097          	auipc	ra,0x8
    80005b34:	298080e7          	jalr	664(ra) # 8000ddc8 <_Unwind_Resume>
    80005b38:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80005b3c:	000c8513          	mv	a0,s9
    80005b40:	ffffd097          	auipc	ra,0xffffd
    80005b44:	b3c080e7          	jalr	-1220(ra) # 8000267c <_ZdlPv>
    80005b48:	00048513          	mv	a0,s1
    80005b4c:	00008097          	auipc	ra,0x8
    80005b50:	27c080e7          	jalr	636(ra) # 8000ddc8 <_Unwind_Resume>
    80005b54:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80005b58:	000c8513          	mv	a0,s9
    80005b5c:	ffffd097          	auipc	ra,0xffffd
    80005b60:	b20080e7          	jalr	-1248(ra) # 8000267c <_ZdlPv>
    80005b64:	00048513          	mv	a0,s1
    80005b68:	00008097          	auipc	ra,0x8
    80005b6c:	260080e7          	jalr	608(ra) # 8000ddc8 <_Unwind_Resume>

0000000080005b70 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80005b70:	ff010113          	addi	sp,sp,-16
    80005b74:	00113423          	sd	ra,8(sp)
    80005b78:	00813023          	sd	s0,0(sp)
    80005b7c:	01010413          	addi	s0,sp,16
    80005b80:	00007797          	auipc	a5,0x7
    80005b84:	f0878793          	addi	a5,a5,-248 # 8000ca88 <_ZTV12ConsumerSync+0x10>
    80005b88:	00f53023          	sd	a5,0(a0)
    80005b8c:	ffffd097          	auipc	ra,0xffffd
    80005b90:	9b0080e7          	jalr	-1616(ra) # 8000253c <_ZN6ThreadD1Ev>
    80005b94:	00813083          	ld	ra,8(sp)
    80005b98:	00013403          	ld	s0,0(sp)
    80005b9c:	01010113          	addi	sp,sp,16
    80005ba0:	00008067          	ret

0000000080005ba4 <_ZN12ConsumerSyncD0Ev>:
    80005ba4:	fe010113          	addi	sp,sp,-32
    80005ba8:	00113c23          	sd	ra,24(sp)
    80005bac:	00813823          	sd	s0,16(sp)
    80005bb0:	00913423          	sd	s1,8(sp)
    80005bb4:	02010413          	addi	s0,sp,32
    80005bb8:	00050493          	mv	s1,a0
    80005bbc:	00007797          	auipc	a5,0x7
    80005bc0:	ecc78793          	addi	a5,a5,-308 # 8000ca88 <_ZTV12ConsumerSync+0x10>
    80005bc4:	00f53023          	sd	a5,0(a0)
    80005bc8:	ffffd097          	auipc	ra,0xffffd
    80005bcc:	974080e7          	jalr	-1676(ra) # 8000253c <_ZN6ThreadD1Ev>
    80005bd0:	00048513          	mv	a0,s1
    80005bd4:	ffffd097          	auipc	ra,0xffffd
    80005bd8:	aa8080e7          	jalr	-1368(ra) # 8000267c <_ZdlPv>
    80005bdc:	01813083          	ld	ra,24(sp)
    80005be0:	01013403          	ld	s0,16(sp)
    80005be4:	00813483          	ld	s1,8(sp)
    80005be8:	02010113          	addi	sp,sp,32
    80005bec:	00008067          	ret

0000000080005bf0 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80005bf0:	ff010113          	addi	sp,sp,-16
    80005bf4:	00113423          	sd	ra,8(sp)
    80005bf8:	00813023          	sd	s0,0(sp)
    80005bfc:	01010413          	addi	s0,sp,16
    80005c00:	00007797          	auipc	a5,0x7
    80005c04:	e6078793          	addi	a5,a5,-416 # 8000ca60 <_ZTV12ProducerSync+0x10>
    80005c08:	00f53023          	sd	a5,0(a0)
    80005c0c:	ffffd097          	auipc	ra,0xffffd
    80005c10:	930080e7          	jalr	-1744(ra) # 8000253c <_ZN6ThreadD1Ev>
    80005c14:	00813083          	ld	ra,8(sp)
    80005c18:	00013403          	ld	s0,0(sp)
    80005c1c:	01010113          	addi	sp,sp,16
    80005c20:	00008067          	ret

0000000080005c24 <_ZN12ProducerSyncD0Ev>:
    80005c24:	fe010113          	addi	sp,sp,-32
    80005c28:	00113c23          	sd	ra,24(sp)
    80005c2c:	00813823          	sd	s0,16(sp)
    80005c30:	00913423          	sd	s1,8(sp)
    80005c34:	02010413          	addi	s0,sp,32
    80005c38:	00050493          	mv	s1,a0
    80005c3c:	00007797          	auipc	a5,0x7
    80005c40:	e2478793          	addi	a5,a5,-476 # 8000ca60 <_ZTV12ProducerSync+0x10>
    80005c44:	00f53023          	sd	a5,0(a0)
    80005c48:	ffffd097          	auipc	ra,0xffffd
    80005c4c:	8f4080e7          	jalr	-1804(ra) # 8000253c <_ZN6ThreadD1Ev>
    80005c50:	00048513          	mv	a0,s1
    80005c54:	ffffd097          	auipc	ra,0xffffd
    80005c58:	a28080e7          	jalr	-1496(ra) # 8000267c <_ZdlPv>
    80005c5c:	01813083          	ld	ra,24(sp)
    80005c60:	01013403          	ld	s0,16(sp)
    80005c64:	00813483          	ld	s1,8(sp)
    80005c68:	02010113          	addi	sp,sp,32
    80005c6c:	00008067          	ret

0000000080005c70 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80005c70:	ff010113          	addi	sp,sp,-16
    80005c74:	00113423          	sd	ra,8(sp)
    80005c78:	00813023          	sd	s0,0(sp)
    80005c7c:	01010413          	addi	s0,sp,16
    80005c80:	00007797          	auipc	a5,0x7
    80005c84:	db878793          	addi	a5,a5,-584 # 8000ca38 <_ZTV16ProducerKeyboard+0x10>
    80005c88:	00f53023          	sd	a5,0(a0)
    80005c8c:	ffffd097          	auipc	ra,0xffffd
    80005c90:	8b0080e7          	jalr	-1872(ra) # 8000253c <_ZN6ThreadD1Ev>
    80005c94:	00813083          	ld	ra,8(sp)
    80005c98:	00013403          	ld	s0,0(sp)
    80005c9c:	01010113          	addi	sp,sp,16
    80005ca0:	00008067          	ret

0000000080005ca4 <_ZN16ProducerKeyboardD0Ev>:
    80005ca4:	fe010113          	addi	sp,sp,-32
    80005ca8:	00113c23          	sd	ra,24(sp)
    80005cac:	00813823          	sd	s0,16(sp)
    80005cb0:	00913423          	sd	s1,8(sp)
    80005cb4:	02010413          	addi	s0,sp,32
    80005cb8:	00050493          	mv	s1,a0
    80005cbc:	00007797          	auipc	a5,0x7
    80005cc0:	d7c78793          	addi	a5,a5,-644 # 8000ca38 <_ZTV16ProducerKeyboard+0x10>
    80005cc4:	00f53023          	sd	a5,0(a0)
    80005cc8:	ffffd097          	auipc	ra,0xffffd
    80005ccc:	874080e7          	jalr	-1932(ra) # 8000253c <_ZN6ThreadD1Ev>
    80005cd0:	00048513          	mv	a0,s1
    80005cd4:	ffffd097          	auipc	ra,0xffffd
    80005cd8:	9a8080e7          	jalr	-1624(ra) # 8000267c <_ZdlPv>
    80005cdc:	01813083          	ld	ra,24(sp)
    80005ce0:	01013403          	ld	s0,16(sp)
    80005ce4:	00813483          	ld	s1,8(sp)
    80005ce8:	02010113          	addi	sp,sp,32
    80005cec:	00008067          	ret

0000000080005cf0 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80005cf0:	ff010113          	addi	sp,sp,-16
    80005cf4:	00113423          	sd	ra,8(sp)
    80005cf8:	00813023          	sd	s0,0(sp)
    80005cfc:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80005d00:	02053583          	ld	a1,32(a0)
    80005d04:	fffff097          	auipc	ra,0xfffff
    80005d08:	7e4080e7          	jalr	2020(ra) # 800054e8 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80005d0c:	00813083          	ld	ra,8(sp)
    80005d10:	00013403          	ld	s0,0(sp)
    80005d14:	01010113          	addi	sp,sp,16
    80005d18:	00008067          	ret

0000000080005d1c <_ZN12ProducerSync3runEv>:
    void run() override {
    80005d1c:	ff010113          	addi	sp,sp,-16
    80005d20:	00113423          	sd	ra,8(sp)
    80005d24:	00813023          	sd	s0,0(sp)
    80005d28:	01010413          	addi	s0,sp,16
        producer(td);
    80005d2c:	02053583          	ld	a1,32(a0)
    80005d30:	00000097          	auipc	ra,0x0
    80005d34:	878080e7          	jalr	-1928(ra) # 800055a8 <_ZN12ProducerSync8producerEPv>
    }
    80005d38:	00813083          	ld	ra,8(sp)
    80005d3c:	00013403          	ld	s0,0(sp)
    80005d40:	01010113          	addi	sp,sp,16
    80005d44:	00008067          	ret

0000000080005d48 <_ZN12ConsumerSync3runEv>:
    void run() override {
    80005d48:	ff010113          	addi	sp,sp,-16
    80005d4c:	00113423          	sd	ra,8(sp)
    80005d50:	00813023          	sd	s0,0(sp)
    80005d54:	01010413          	addi	s0,sp,16
        consumer(td);
    80005d58:	02053583          	ld	a1,32(a0)
    80005d5c:	00000097          	auipc	ra,0x0
    80005d60:	8e0080e7          	jalr	-1824(ra) # 8000563c <_ZN12ConsumerSync8consumerEPv>
    }
    80005d64:	00813083          	ld	ra,8(sp)
    80005d68:	00013403          	ld	s0,0(sp)
    80005d6c:	01010113          	addi	sp,sp,16
    80005d70:	00008067          	ret

0000000080005d74 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80005d74:	fe010113          	addi	sp,sp,-32
    80005d78:	00113c23          	sd	ra,24(sp)
    80005d7c:	00813823          	sd	s0,16(sp)
    80005d80:	00913423          	sd	s1,8(sp)
    80005d84:	02010413          	addi	s0,sp,32
    80005d88:	00050493          	mv	s1,a0
    LOCK();
    80005d8c:	00100613          	li	a2,1
    80005d90:	00000593          	li	a1,0
    80005d94:	00007517          	auipc	a0,0x7
    80005d98:	f5c50513          	addi	a0,a0,-164 # 8000ccf0 <lockPrint>
    80005d9c:	ffffb097          	auipc	ra,0xffffb
    80005da0:	488080e7          	jalr	1160(ra) # 80001224 <copy_and_swap>
    80005da4:	00050863          	beqz	a0,80005db4 <_Z11printStringPKc+0x40>
    80005da8:	ffffb097          	auipc	ra,0xffffb
    80005dac:	680080e7          	jalr	1664(ra) # 80001428 <_Z15thread_dispatchv>
    80005db0:	fddff06f          	j	80005d8c <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80005db4:	0004c503          	lbu	a0,0(s1)
    80005db8:	00050a63          	beqz	a0,80005dcc <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80005dbc:	ffffb097          	auipc	ra,0xffffb
    80005dc0:	7d4080e7          	jalr	2004(ra) # 80001590 <_Z4putcc>
        string++;
    80005dc4:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80005dc8:	fedff06f          	j	80005db4 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80005dcc:	00000613          	li	a2,0
    80005dd0:	00100593          	li	a1,1
    80005dd4:	00007517          	auipc	a0,0x7
    80005dd8:	f1c50513          	addi	a0,a0,-228 # 8000ccf0 <lockPrint>
    80005ddc:	ffffb097          	auipc	ra,0xffffb
    80005de0:	448080e7          	jalr	1096(ra) # 80001224 <copy_and_swap>
    80005de4:	fe0514e3          	bnez	a0,80005dcc <_Z11printStringPKc+0x58>
}
    80005de8:	01813083          	ld	ra,24(sp)
    80005dec:	01013403          	ld	s0,16(sp)
    80005df0:	00813483          	ld	s1,8(sp)
    80005df4:	02010113          	addi	sp,sp,32
    80005df8:	00008067          	ret

0000000080005dfc <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80005dfc:	fd010113          	addi	sp,sp,-48
    80005e00:	02113423          	sd	ra,40(sp)
    80005e04:	02813023          	sd	s0,32(sp)
    80005e08:	00913c23          	sd	s1,24(sp)
    80005e0c:	01213823          	sd	s2,16(sp)
    80005e10:	01313423          	sd	s3,8(sp)
    80005e14:	01413023          	sd	s4,0(sp)
    80005e18:	03010413          	addi	s0,sp,48
    80005e1c:	00050993          	mv	s3,a0
    80005e20:	00058a13          	mv	s4,a1
    LOCK();
    80005e24:	00100613          	li	a2,1
    80005e28:	00000593          	li	a1,0
    80005e2c:	00007517          	auipc	a0,0x7
    80005e30:	ec450513          	addi	a0,a0,-316 # 8000ccf0 <lockPrint>
    80005e34:	ffffb097          	auipc	ra,0xffffb
    80005e38:	3f0080e7          	jalr	1008(ra) # 80001224 <copy_and_swap>
    80005e3c:	00050863          	beqz	a0,80005e4c <_Z9getStringPci+0x50>
    80005e40:	ffffb097          	auipc	ra,0xffffb
    80005e44:	5e8080e7          	jalr	1512(ra) # 80001428 <_Z15thread_dispatchv>
    80005e48:	fddff06f          	j	80005e24 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80005e4c:	00000913          	li	s2,0
    80005e50:	00090493          	mv	s1,s2
    80005e54:	0019091b          	addiw	s2,s2,1
    80005e58:	03495a63          	bge	s2,s4,80005e8c <_Z9getStringPci+0x90>
        cc = getc();
    80005e5c:	ffffb097          	auipc	ra,0xffffb
    80005e60:	70c080e7          	jalr	1804(ra) # 80001568 <_Z4getcv>
        if(cc < 1)
    80005e64:	02050463          	beqz	a0,80005e8c <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80005e68:	009984b3          	add	s1,s3,s1
    80005e6c:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80005e70:	00a00793          	li	a5,10
    80005e74:	00f50a63          	beq	a0,a5,80005e88 <_Z9getStringPci+0x8c>
    80005e78:	00d00793          	li	a5,13
    80005e7c:	fcf51ae3          	bne	a0,a5,80005e50 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80005e80:	00090493          	mv	s1,s2
    80005e84:	0080006f          	j	80005e8c <_Z9getStringPci+0x90>
    80005e88:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80005e8c:	009984b3          	add	s1,s3,s1
    80005e90:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80005e94:	00000613          	li	a2,0
    80005e98:	00100593          	li	a1,1
    80005e9c:	00007517          	auipc	a0,0x7
    80005ea0:	e5450513          	addi	a0,a0,-428 # 8000ccf0 <lockPrint>
    80005ea4:	ffffb097          	auipc	ra,0xffffb
    80005ea8:	380080e7          	jalr	896(ra) # 80001224 <copy_and_swap>
    80005eac:	fe0514e3          	bnez	a0,80005e94 <_Z9getStringPci+0x98>
    return buf;
}
    80005eb0:	00098513          	mv	a0,s3
    80005eb4:	02813083          	ld	ra,40(sp)
    80005eb8:	02013403          	ld	s0,32(sp)
    80005ebc:	01813483          	ld	s1,24(sp)
    80005ec0:	01013903          	ld	s2,16(sp)
    80005ec4:	00813983          	ld	s3,8(sp)
    80005ec8:	00013a03          	ld	s4,0(sp)
    80005ecc:	03010113          	addi	sp,sp,48
    80005ed0:	00008067          	ret

0000000080005ed4 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80005ed4:	ff010113          	addi	sp,sp,-16
    80005ed8:	00813423          	sd	s0,8(sp)
    80005edc:	01010413          	addi	s0,sp,16
    80005ee0:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80005ee4:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80005ee8:	0006c603          	lbu	a2,0(a3)
    80005eec:	fd06071b          	addiw	a4,a2,-48
    80005ef0:	0ff77713          	andi	a4,a4,255
    80005ef4:	00900793          	li	a5,9
    80005ef8:	02e7e063          	bltu	a5,a4,80005f18 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80005efc:	0025179b          	slliw	a5,a0,0x2
    80005f00:	00a787bb          	addw	a5,a5,a0
    80005f04:	0017979b          	slliw	a5,a5,0x1
    80005f08:	00168693          	addi	a3,a3,1
    80005f0c:	00c787bb          	addw	a5,a5,a2
    80005f10:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80005f14:	fd5ff06f          	j	80005ee8 <_Z11stringToIntPKc+0x14>
    return n;
}
    80005f18:	00813403          	ld	s0,8(sp)
    80005f1c:	01010113          	addi	sp,sp,16
    80005f20:	00008067          	ret

0000000080005f24 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80005f24:	fc010113          	addi	sp,sp,-64
    80005f28:	02113c23          	sd	ra,56(sp)
    80005f2c:	02813823          	sd	s0,48(sp)
    80005f30:	02913423          	sd	s1,40(sp)
    80005f34:	03213023          	sd	s2,32(sp)
    80005f38:	01313c23          	sd	s3,24(sp)
    80005f3c:	04010413          	addi	s0,sp,64
    80005f40:	00050493          	mv	s1,a0
    80005f44:	00058913          	mv	s2,a1
    80005f48:	00060993          	mv	s3,a2
    LOCK();
    80005f4c:	00100613          	li	a2,1
    80005f50:	00000593          	li	a1,0
    80005f54:	00007517          	auipc	a0,0x7
    80005f58:	d9c50513          	addi	a0,a0,-612 # 8000ccf0 <lockPrint>
    80005f5c:	ffffb097          	auipc	ra,0xffffb
    80005f60:	2c8080e7          	jalr	712(ra) # 80001224 <copy_and_swap>
    80005f64:	00050863          	beqz	a0,80005f74 <_Z8printIntiii+0x50>
    80005f68:	ffffb097          	auipc	ra,0xffffb
    80005f6c:	4c0080e7          	jalr	1216(ra) # 80001428 <_Z15thread_dispatchv>
    80005f70:	fddff06f          	j	80005f4c <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80005f74:	00098463          	beqz	s3,80005f7c <_Z8printIntiii+0x58>
    80005f78:	0804c463          	bltz	s1,80006000 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80005f7c:	0004851b          	sext.w	a0,s1
    neg = 0;
    80005f80:	00000593          	li	a1,0
    }

    i = 0;
    80005f84:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80005f88:	0009079b          	sext.w	a5,s2
    80005f8c:	0325773b          	remuw	a4,a0,s2
    80005f90:	00048613          	mv	a2,s1
    80005f94:	0014849b          	addiw	s1,s1,1
    80005f98:	02071693          	slli	a3,a4,0x20
    80005f9c:	0206d693          	srli	a3,a3,0x20
    80005fa0:	00007717          	auipc	a4,0x7
    80005fa4:	b0070713          	addi	a4,a4,-1280 # 8000caa0 <digits>
    80005fa8:	00d70733          	add	a4,a4,a3
    80005fac:	00074683          	lbu	a3,0(a4)
    80005fb0:	fd040713          	addi	a4,s0,-48
    80005fb4:	00c70733          	add	a4,a4,a2
    80005fb8:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80005fbc:	0005071b          	sext.w	a4,a0
    80005fc0:	0325553b          	divuw	a0,a0,s2
    80005fc4:	fcf772e3          	bgeu	a4,a5,80005f88 <_Z8printIntiii+0x64>
    if(neg)
    80005fc8:	00058c63          	beqz	a1,80005fe0 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80005fcc:	fd040793          	addi	a5,s0,-48
    80005fd0:	009784b3          	add	s1,a5,s1
    80005fd4:	02d00793          	li	a5,45
    80005fd8:	fef48823          	sb	a5,-16(s1)
    80005fdc:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80005fe0:	fff4849b          	addiw	s1,s1,-1
    80005fe4:	0204c463          	bltz	s1,8000600c <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80005fe8:	fd040793          	addi	a5,s0,-48
    80005fec:	009787b3          	add	a5,a5,s1
    80005ff0:	ff07c503          	lbu	a0,-16(a5)
    80005ff4:	ffffb097          	auipc	ra,0xffffb
    80005ff8:	59c080e7          	jalr	1436(ra) # 80001590 <_Z4putcc>
    80005ffc:	fe5ff06f          	j	80005fe0 <_Z8printIntiii+0xbc>
        x = -xx;
    80006000:	4090053b          	negw	a0,s1
        neg = 1;
    80006004:	00100593          	li	a1,1
        x = -xx;
    80006008:	f7dff06f          	j	80005f84 <_Z8printIntiii+0x60>

    UNLOCK();
    8000600c:	00000613          	li	a2,0
    80006010:	00100593          	li	a1,1
    80006014:	00007517          	auipc	a0,0x7
    80006018:	cdc50513          	addi	a0,a0,-804 # 8000ccf0 <lockPrint>
    8000601c:	ffffb097          	auipc	ra,0xffffb
    80006020:	208080e7          	jalr	520(ra) # 80001224 <copy_and_swap>
    80006024:	fe0514e3          	bnez	a0,8000600c <_Z8printIntiii+0xe8>
    80006028:	03813083          	ld	ra,56(sp)
    8000602c:	03013403          	ld	s0,48(sp)
    80006030:	02813483          	ld	s1,40(sp)
    80006034:	02013903          	ld	s2,32(sp)
    80006038:	01813983          	ld	s3,24(sp)
    8000603c:	04010113          	addi	sp,sp,64
    80006040:	00008067          	ret

0000000080006044 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006044:	fd010113          	addi	sp,sp,-48
    80006048:	02113423          	sd	ra,40(sp)
    8000604c:	02813023          	sd	s0,32(sp)
    80006050:	00913c23          	sd	s1,24(sp)
    80006054:	01213823          	sd	s2,16(sp)
    80006058:	01313423          	sd	s3,8(sp)
    8000605c:	03010413          	addi	s0,sp,48
    80006060:	00050493          	mv	s1,a0
    80006064:	00058913          	mv	s2,a1
    80006068:	0015879b          	addiw	a5,a1,1
    8000606c:	0007851b          	sext.w	a0,a5
    80006070:	00f4a023          	sw	a5,0(s1)
    80006074:	0004a823          	sw	zero,16(s1)
    80006078:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    8000607c:	00251513          	slli	a0,a0,0x2
    80006080:	ffffb097          	auipc	ra,0xffffb
    80006084:	290080e7          	jalr	656(ra) # 80001310 <_Z9mem_allocm>
    80006088:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    8000608c:	01000513          	li	a0,16
    80006090:	ffffc097          	auipc	ra,0xffffc
    80006094:	59c080e7          	jalr	1436(ra) # 8000262c <_Znwm>
    80006098:	00050993          	mv	s3,a0
    8000609c:	00000593          	li	a1,0
    800060a0:	ffffd097          	auipc	ra,0xffffd
    800060a4:	8d0080e7          	jalr	-1840(ra) # 80002970 <_ZN9SemaphoreC1Ej>
    800060a8:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    800060ac:	01000513          	li	a0,16
    800060b0:	ffffc097          	auipc	ra,0xffffc
    800060b4:	57c080e7          	jalr	1404(ra) # 8000262c <_Znwm>
    800060b8:	00050993          	mv	s3,a0
    800060bc:	00090593          	mv	a1,s2
    800060c0:	ffffd097          	auipc	ra,0xffffd
    800060c4:	8b0080e7          	jalr	-1872(ra) # 80002970 <_ZN9SemaphoreC1Ej>
    800060c8:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    800060cc:	01000513          	li	a0,16
    800060d0:	ffffc097          	auipc	ra,0xffffc
    800060d4:	55c080e7          	jalr	1372(ra) # 8000262c <_Znwm>
    800060d8:	00050913          	mv	s2,a0
    800060dc:	00100593          	li	a1,1
    800060e0:	ffffd097          	auipc	ra,0xffffd
    800060e4:	890080e7          	jalr	-1904(ra) # 80002970 <_ZN9SemaphoreC1Ej>
    800060e8:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    800060ec:	01000513          	li	a0,16
    800060f0:	ffffc097          	auipc	ra,0xffffc
    800060f4:	53c080e7          	jalr	1340(ra) # 8000262c <_Znwm>
    800060f8:	00050913          	mv	s2,a0
    800060fc:	00100593          	li	a1,1
    80006100:	ffffd097          	auipc	ra,0xffffd
    80006104:	870080e7          	jalr	-1936(ra) # 80002970 <_ZN9SemaphoreC1Ej>
    80006108:	0324b823          	sd	s2,48(s1)
}
    8000610c:	02813083          	ld	ra,40(sp)
    80006110:	02013403          	ld	s0,32(sp)
    80006114:	01813483          	ld	s1,24(sp)
    80006118:	01013903          	ld	s2,16(sp)
    8000611c:	00813983          	ld	s3,8(sp)
    80006120:	03010113          	addi	sp,sp,48
    80006124:	00008067          	ret
    80006128:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    8000612c:	00098513          	mv	a0,s3
    80006130:	ffffc097          	auipc	ra,0xffffc
    80006134:	54c080e7          	jalr	1356(ra) # 8000267c <_ZdlPv>
    80006138:	00048513          	mv	a0,s1
    8000613c:	00008097          	auipc	ra,0x8
    80006140:	c8c080e7          	jalr	-884(ra) # 8000ddc8 <_Unwind_Resume>
    80006144:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80006148:	00098513          	mv	a0,s3
    8000614c:	ffffc097          	auipc	ra,0xffffc
    80006150:	530080e7          	jalr	1328(ra) # 8000267c <_ZdlPv>
    80006154:	00048513          	mv	a0,s1
    80006158:	00008097          	auipc	ra,0x8
    8000615c:	c70080e7          	jalr	-912(ra) # 8000ddc8 <_Unwind_Resume>
    80006160:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80006164:	00090513          	mv	a0,s2
    80006168:	ffffc097          	auipc	ra,0xffffc
    8000616c:	514080e7          	jalr	1300(ra) # 8000267c <_ZdlPv>
    80006170:	00048513          	mv	a0,s1
    80006174:	00008097          	auipc	ra,0x8
    80006178:	c54080e7          	jalr	-940(ra) # 8000ddc8 <_Unwind_Resume>
    8000617c:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80006180:	00090513          	mv	a0,s2
    80006184:	ffffc097          	auipc	ra,0xffffc
    80006188:	4f8080e7          	jalr	1272(ra) # 8000267c <_ZdlPv>
    8000618c:	00048513          	mv	a0,s1
    80006190:	00008097          	auipc	ra,0x8
    80006194:	c38080e7          	jalr	-968(ra) # 8000ddc8 <_Unwind_Resume>

0000000080006198 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80006198:	fe010113          	addi	sp,sp,-32
    8000619c:	00113c23          	sd	ra,24(sp)
    800061a0:	00813823          	sd	s0,16(sp)
    800061a4:	00913423          	sd	s1,8(sp)
    800061a8:	01213023          	sd	s2,0(sp)
    800061ac:	02010413          	addi	s0,sp,32
    800061b0:	00050493          	mv	s1,a0
    800061b4:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    800061b8:	01853503          	ld	a0,24(a0)
    800061bc:	ffffc097          	auipc	ra,0xffffc
    800061c0:	7ec080e7          	jalr	2028(ra) # 800029a8 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    800061c4:	0304b503          	ld	a0,48(s1)
    800061c8:	ffffc097          	auipc	ra,0xffffc
    800061cc:	7e0080e7          	jalr	2016(ra) # 800029a8 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    800061d0:	0084b783          	ld	a5,8(s1)
    800061d4:	0144a703          	lw	a4,20(s1)
    800061d8:	00271713          	slli	a4,a4,0x2
    800061dc:	00e787b3          	add	a5,a5,a4
    800061e0:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800061e4:	0144a783          	lw	a5,20(s1)
    800061e8:	0017879b          	addiw	a5,a5,1
    800061ec:	0004a703          	lw	a4,0(s1)
    800061f0:	02e7e7bb          	remw	a5,a5,a4
    800061f4:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    800061f8:	0304b503          	ld	a0,48(s1)
    800061fc:	ffffc097          	auipc	ra,0xffffc
    80006200:	7d8080e7          	jalr	2008(ra) # 800029d4 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80006204:	0204b503          	ld	a0,32(s1)
    80006208:	ffffc097          	auipc	ra,0xffffc
    8000620c:	7cc080e7          	jalr	1996(ra) # 800029d4 <_ZN9Semaphore6signalEv>

}
    80006210:	01813083          	ld	ra,24(sp)
    80006214:	01013403          	ld	s0,16(sp)
    80006218:	00813483          	ld	s1,8(sp)
    8000621c:	00013903          	ld	s2,0(sp)
    80006220:	02010113          	addi	sp,sp,32
    80006224:	00008067          	ret

0000000080006228 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80006228:	fe010113          	addi	sp,sp,-32
    8000622c:	00113c23          	sd	ra,24(sp)
    80006230:	00813823          	sd	s0,16(sp)
    80006234:	00913423          	sd	s1,8(sp)
    80006238:	01213023          	sd	s2,0(sp)
    8000623c:	02010413          	addi	s0,sp,32
    80006240:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80006244:	02053503          	ld	a0,32(a0)
    80006248:	ffffc097          	auipc	ra,0xffffc
    8000624c:	760080e7          	jalr	1888(ra) # 800029a8 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80006250:	0284b503          	ld	a0,40(s1)
    80006254:	ffffc097          	auipc	ra,0xffffc
    80006258:	754080e7          	jalr	1876(ra) # 800029a8 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    8000625c:	0084b703          	ld	a4,8(s1)
    80006260:	0104a783          	lw	a5,16(s1)
    80006264:	00279693          	slli	a3,a5,0x2
    80006268:	00d70733          	add	a4,a4,a3
    8000626c:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006270:	0017879b          	addiw	a5,a5,1
    80006274:	0004a703          	lw	a4,0(s1)
    80006278:	02e7e7bb          	remw	a5,a5,a4
    8000627c:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80006280:	0284b503          	ld	a0,40(s1)
    80006284:	ffffc097          	auipc	ra,0xffffc
    80006288:	750080e7          	jalr	1872(ra) # 800029d4 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    8000628c:	0184b503          	ld	a0,24(s1)
    80006290:	ffffc097          	auipc	ra,0xffffc
    80006294:	744080e7          	jalr	1860(ra) # 800029d4 <_ZN9Semaphore6signalEv>

    return ret;
}
    80006298:	00090513          	mv	a0,s2
    8000629c:	01813083          	ld	ra,24(sp)
    800062a0:	01013403          	ld	s0,16(sp)
    800062a4:	00813483          	ld	s1,8(sp)
    800062a8:	00013903          	ld	s2,0(sp)
    800062ac:	02010113          	addi	sp,sp,32
    800062b0:	00008067          	ret

00000000800062b4 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    800062b4:	fe010113          	addi	sp,sp,-32
    800062b8:	00113c23          	sd	ra,24(sp)
    800062bc:	00813823          	sd	s0,16(sp)
    800062c0:	00913423          	sd	s1,8(sp)
    800062c4:	01213023          	sd	s2,0(sp)
    800062c8:	02010413          	addi	s0,sp,32
    800062cc:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    800062d0:	02853503          	ld	a0,40(a0)
    800062d4:	ffffc097          	auipc	ra,0xffffc
    800062d8:	6d4080e7          	jalr	1748(ra) # 800029a8 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    800062dc:	0304b503          	ld	a0,48(s1)
    800062e0:	ffffc097          	auipc	ra,0xffffc
    800062e4:	6c8080e7          	jalr	1736(ra) # 800029a8 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    800062e8:	0144a783          	lw	a5,20(s1)
    800062ec:	0104a903          	lw	s2,16(s1)
    800062f0:	0327ce63          	blt	a5,s2,8000632c <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    800062f4:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    800062f8:	0304b503          	ld	a0,48(s1)
    800062fc:	ffffc097          	auipc	ra,0xffffc
    80006300:	6d8080e7          	jalr	1752(ra) # 800029d4 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80006304:	0284b503          	ld	a0,40(s1)
    80006308:	ffffc097          	auipc	ra,0xffffc
    8000630c:	6cc080e7          	jalr	1740(ra) # 800029d4 <_ZN9Semaphore6signalEv>

    return ret;
}
    80006310:	00090513          	mv	a0,s2
    80006314:	01813083          	ld	ra,24(sp)
    80006318:	01013403          	ld	s0,16(sp)
    8000631c:	00813483          	ld	s1,8(sp)
    80006320:	00013903          	ld	s2,0(sp)
    80006324:	02010113          	addi	sp,sp,32
    80006328:	00008067          	ret
        ret = cap - head + tail;
    8000632c:	0004a703          	lw	a4,0(s1)
    80006330:	4127093b          	subw	s2,a4,s2
    80006334:	00f9093b          	addw	s2,s2,a5
    80006338:	fc1ff06f          	j	800062f8 <_ZN9BufferCPP6getCntEv+0x44>

000000008000633c <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    8000633c:	fe010113          	addi	sp,sp,-32
    80006340:	00113c23          	sd	ra,24(sp)
    80006344:	00813823          	sd	s0,16(sp)
    80006348:	00913423          	sd	s1,8(sp)
    8000634c:	02010413          	addi	s0,sp,32
    80006350:	00050493          	mv	s1,a0
    Console::putc('\n');
    80006354:	00a00513          	li	a0,10
    80006358:	ffffc097          	auipc	ra,0xffffc
    8000635c:	744080e7          	jalr	1860(ra) # 80002a9c <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80006360:	00004517          	auipc	a0,0x4
    80006364:	0c850513          	addi	a0,a0,200 # 8000a428 <_ZZ9kPrintIntmE6digits+0x3b8>
    80006368:	00000097          	auipc	ra,0x0
    8000636c:	a0c080e7          	jalr	-1524(ra) # 80005d74 <_Z11printStringPKc>
    while (getCnt()) {
    80006370:	00048513          	mv	a0,s1
    80006374:	00000097          	auipc	ra,0x0
    80006378:	f40080e7          	jalr	-192(ra) # 800062b4 <_ZN9BufferCPP6getCntEv>
    8000637c:	02050c63          	beqz	a0,800063b4 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80006380:	0084b783          	ld	a5,8(s1)
    80006384:	0104a703          	lw	a4,16(s1)
    80006388:	00271713          	slli	a4,a4,0x2
    8000638c:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80006390:	0007c503          	lbu	a0,0(a5)
    80006394:	ffffc097          	auipc	ra,0xffffc
    80006398:	708080e7          	jalr	1800(ra) # 80002a9c <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    8000639c:	0104a783          	lw	a5,16(s1)
    800063a0:	0017879b          	addiw	a5,a5,1
    800063a4:	0004a703          	lw	a4,0(s1)
    800063a8:	02e7e7bb          	remw	a5,a5,a4
    800063ac:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    800063b0:	fc1ff06f          	j	80006370 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    800063b4:	02100513          	li	a0,33
    800063b8:	ffffc097          	auipc	ra,0xffffc
    800063bc:	6e4080e7          	jalr	1764(ra) # 80002a9c <_ZN7Console4putcEc>
    Console::putc('\n');
    800063c0:	00a00513          	li	a0,10
    800063c4:	ffffc097          	auipc	ra,0xffffc
    800063c8:	6d8080e7          	jalr	1752(ra) # 80002a9c <_ZN7Console4putcEc>
    mem_free(buffer);
    800063cc:	0084b503          	ld	a0,8(s1)
    800063d0:	ffffb097          	auipc	ra,0xffffb
    800063d4:	f80080e7          	jalr	-128(ra) # 80001350 <_Z8mem_freePv>
    delete itemAvailable;
    800063d8:	0204b503          	ld	a0,32(s1)
    800063dc:	00050863          	beqz	a0,800063ec <_ZN9BufferCPPD1Ev+0xb0>
    800063e0:	00053783          	ld	a5,0(a0)
    800063e4:	0087b783          	ld	a5,8(a5)
    800063e8:	000780e7          	jalr	a5
    delete spaceAvailable;
    800063ec:	0184b503          	ld	a0,24(s1)
    800063f0:	00050863          	beqz	a0,80006400 <_ZN9BufferCPPD1Ev+0xc4>
    800063f4:	00053783          	ld	a5,0(a0)
    800063f8:	0087b783          	ld	a5,8(a5)
    800063fc:	000780e7          	jalr	a5
    delete mutexTail;
    80006400:	0304b503          	ld	a0,48(s1)
    80006404:	00050863          	beqz	a0,80006414 <_ZN9BufferCPPD1Ev+0xd8>
    80006408:	00053783          	ld	a5,0(a0)
    8000640c:	0087b783          	ld	a5,8(a5)
    80006410:	000780e7          	jalr	a5
    delete mutexHead;
    80006414:	0284b503          	ld	a0,40(s1)
    80006418:	00050863          	beqz	a0,80006428 <_ZN9BufferCPPD1Ev+0xec>
    8000641c:	00053783          	ld	a5,0(a0)
    80006420:	0087b783          	ld	a5,8(a5)
    80006424:	000780e7          	jalr	a5
}
    80006428:	01813083          	ld	ra,24(sp)
    8000642c:	01013403          	ld	s0,16(sp)
    80006430:	00813483          	ld	s1,8(sp)
    80006434:	02010113          	addi	sp,sp,32
    80006438:	00008067          	ret

000000008000643c <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    8000643c:	fe010113          	addi	sp,sp,-32
    80006440:	00113c23          	sd	ra,24(sp)
    80006444:	00813823          	sd	s0,16(sp)
    80006448:	00913423          	sd	s1,8(sp)
    8000644c:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80006450:	00004517          	auipc	a0,0x4
    80006454:	ff050513          	addi	a0,a0,-16 # 8000a440 <_ZZ9kPrintIntmE6digits+0x3d0>
    80006458:	00000097          	auipc	ra,0x0
    8000645c:	91c080e7          	jalr	-1764(ra) # 80005d74 <_Z11printStringPKc>
    int test = getc() - '0';
    80006460:	ffffb097          	auipc	ra,0xffffb
    80006464:	108080e7          	jalr	264(ra) # 80001568 <_Z4getcv>
    80006468:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    8000646c:	ffffb097          	auipc	ra,0xffffb
    80006470:	0fc080e7          	jalr	252(ra) # 80001568 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80006474:	00700793          	li	a5,7
    80006478:	1097e263          	bltu	a5,s1,8000657c <_Z8userMainv+0x140>
    8000647c:	00249493          	slli	s1,s1,0x2
    80006480:	00004717          	auipc	a4,0x4
    80006484:	21870713          	addi	a4,a4,536 # 8000a698 <_ZZ9kPrintIntmE6digits+0x628>
    80006488:	00e484b3          	add	s1,s1,a4
    8000648c:	0004a783          	lw	a5,0(s1)
    80006490:	00e787b3          	add	a5,a5,a4
    80006494:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    80006498:	fffff097          	auipc	ra,0xfffff
    8000649c:	f54080e7          	jalr	-172(ra) # 800053ec <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    800064a0:	00004517          	auipc	a0,0x4
    800064a4:	fc050513          	addi	a0,a0,-64 # 8000a460 <_ZZ9kPrintIntmE6digits+0x3f0>
    800064a8:	00000097          	auipc	ra,0x0
    800064ac:	8cc080e7          	jalr	-1844(ra) # 80005d74 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    800064b0:	01813083          	ld	ra,24(sp)
    800064b4:	01013403          	ld	s0,16(sp)
    800064b8:	00813483          	ld	s1,8(sp)
    800064bc:	02010113          	addi	sp,sp,32
    800064c0:	00008067          	ret
            Threads_CPP_API_test();
    800064c4:	ffffe097          	auipc	ra,0xffffe
    800064c8:	e08080e7          	jalr	-504(ra) # 800042cc <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    800064cc:	00004517          	auipc	a0,0x4
    800064d0:	fd450513          	addi	a0,a0,-44 # 8000a4a0 <_ZZ9kPrintIntmE6digits+0x430>
    800064d4:	00000097          	auipc	ra,0x0
    800064d8:	8a0080e7          	jalr	-1888(ra) # 80005d74 <_Z11printStringPKc>
            break;
    800064dc:	fd5ff06f          	j	800064b0 <_Z8userMainv+0x74>
            producerConsumer_C_API();
    800064e0:	ffffd097          	auipc	ra,0xffffd
    800064e4:	640080e7          	jalr	1600(ra) # 80003b20 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    800064e8:	00004517          	auipc	a0,0x4
    800064ec:	ff850513          	addi	a0,a0,-8 # 8000a4e0 <_ZZ9kPrintIntmE6digits+0x470>
    800064f0:	00000097          	auipc	ra,0x0
    800064f4:	884080e7          	jalr	-1916(ra) # 80005d74 <_Z11printStringPKc>
            break;
    800064f8:	fb9ff06f          	j	800064b0 <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    800064fc:	fffff097          	auipc	ra,0xfffff
    80006500:	234080e7          	jalr	564(ra) # 80005730 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80006504:	00004517          	auipc	a0,0x4
    80006508:	02c50513          	addi	a0,a0,44 # 8000a530 <_ZZ9kPrintIntmE6digits+0x4c0>
    8000650c:	00000097          	auipc	ra,0x0
    80006510:	868080e7          	jalr	-1944(ra) # 80005d74 <_Z11printStringPKc>
            break;
    80006514:	f9dff06f          	j	800064b0 <_Z8userMainv+0x74>
            testSleeping();
    80006518:	00000097          	auipc	ra,0x0
    8000651c:	11c080e7          	jalr	284(ra) # 80006634 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    80006520:	00004517          	auipc	a0,0x4
    80006524:	06850513          	addi	a0,a0,104 # 8000a588 <_ZZ9kPrintIntmE6digits+0x518>
    80006528:	00000097          	auipc	ra,0x0
    8000652c:	84c080e7          	jalr	-1972(ra) # 80005d74 <_Z11printStringPKc>
            break;
    80006530:	f81ff06f          	j	800064b0 <_Z8userMainv+0x74>
            testConsumerProducer();
    80006534:	ffffe097          	auipc	ra,0xffffe
    80006538:	258080e7          	jalr	600(ra) # 8000478c <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    8000653c:	00004517          	auipc	a0,0x4
    80006540:	07c50513          	addi	a0,a0,124 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80006544:	00000097          	auipc	ra,0x0
    80006548:	830080e7          	jalr	-2000(ra) # 80005d74 <_Z11printStringPKc>
            break;
    8000654c:	f65ff06f          	j	800064b0 <_Z8userMainv+0x74>
            System_Mode_test();
    80006550:	00000097          	auipc	ra,0x0
    80006554:	658080e7          	jalr	1624(ra) # 80006ba8 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80006558:	00004517          	auipc	a0,0x4
    8000655c:	0a050513          	addi	a0,a0,160 # 8000a5f8 <_ZZ9kPrintIntmE6digits+0x588>
    80006560:	00000097          	auipc	ra,0x0
    80006564:	814080e7          	jalr	-2028(ra) # 80005d74 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80006568:	00004517          	auipc	a0,0x4
    8000656c:	0b050513          	addi	a0,a0,176 # 8000a618 <_ZZ9kPrintIntmE6digits+0x5a8>
    80006570:	00000097          	auipc	ra,0x0
    80006574:	804080e7          	jalr	-2044(ra) # 80005d74 <_Z11printStringPKc>
            break;
    80006578:	f39ff06f          	j	800064b0 <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    8000657c:	00004517          	auipc	a0,0x4
    80006580:	0f450513          	addi	a0,a0,244 # 8000a670 <_ZZ9kPrintIntmE6digits+0x600>
    80006584:	fffff097          	auipc	ra,0xfffff
    80006588:	7f0080e7          	jalr	2032(ra) # 80005d74 <_Z11printStringPKc>
    8000658c:	f25ff06f          	j	800064b0 <_Z8userMainv+0x74>

0000000080006590 <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    80006590:	fe010113          	addi	sp,sp,-32
    80006594:	00113c23          	sd	ra,24(sp)
    80006598:	00813823          	sd	s0,16(sp)
    8000659c:	00913423          	sd	s1,8(sp)
    800065a0:	01213023          	sd	s2,0(sp)
    800065a4:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    800065a8:	00053903          	ld	s2,0(a0)
    int i = 6;
    800065ac:	00600493          	li	s1,6
    while (--i > 0) {
    800065b0:	fff4849b          	addiw	s1,s1,-1
    800065b4:	04905463          	blez	s1,800065fc <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    800065b8:	00004517          	auipc	a0,0x4
    800065bc:	10050513          	addi	a0,a0,256 # 8000a6b8 <_ZZ9kPrintIntmE6digits+0x648>
    800065c0:	fffff097          	auipc	ra,0xfffff
    800065c4:	7b4080e7          	jalr	1972(ra) # 80005d74 <_Z11printStringPKc>
        printInt(sleep_time);
    800065c8:	00000613          	li	a2,0
    800065cc:	00a00593          	li	a1,10
    800065d0:	0009051b          	sext.w	a0,s2
    800065d4:	00000097          	auipc	ra,0x0
    800065d8:	950080e7          	jalr	-1712(ra) # 80005f24 <_Z8printIntiii>
        printString(" !\n");
    800065dc:	00004517          	auipc	a0,0x4
    800065e0:	0e450513          	addi	a0,a0,228 # 8000a6c0 <_ZZ9kPrintIntmE6digits+0x650>
    800065e4:	fffff097          	auipc	ra,0xfffff
    800065e8:	790080e7          	jalr	1936(ra) # 80005d74 <_Z11printStringPKc>
        time_sleep(sleep_time);
    800065ec:	00090513          	mv	a0,s2
    800065f0:	ffffb097          	auipc	ra,0xffffb
    800065f4:	e80080e7          	jalr	-384(ra) # 80001470 <_Z10time_sleepm>
    while (--i > 0) {
    800065f8:	fb9ff06f          	j	800065b0 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    800065fc:	00a00793          	li	a5,10
    80006600:	02f95933          	divu	s2,s2,a5
    80006604:	fff90913          	addi	s2,s2,-1
    80006608:	00006797          	auipc	a5,0x6
    8000660c:	6f078793          	addi	a5,a5,1776 # 8000ccf8 <_ZL8finished>
    80006610:	01278933          	add	s2,a5,s2
    80006614:	00100793          	li	a5,1
    80006618:	00f90023          	sb	a5,0(s2)
}
    8000661c:	01813083          	ld	ra,24(sp)
    80006620:	01013403          	ld	s0,16(sp)
    80006624:	00813483          	ld	s1,8(sp)
    80006628:	00013903          	ld	s2,0(sp)
    8000662c:	02010113          	addi	sp,sp,32
    80006630:	00008067          	ret

0000000080006634 <_Z12testSleepingv>:

void testSleeping() {
    80006634:	fc010113          	addi	sp,sp,-64
    80006638:	02113c23          	sd	ra,56(sp)
    8000663c:	02813823          	sd	s0,48(sp)
    80006640:	02913423          	sd	s1,40(sp)
    80006644:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    80006648:	00a00793          	li	a5,10
    8000664c:	fcf43823          	sd	a5,-48(s0)
    80006650:	01400793          	li	a5,20
    80006654:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    80006658:	00000493          	li	s1,0
    8000665c:	02c0006f          	j	80006688 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    80006660:	00349793          	slli	a5,s1,0x3
    80006664:	fd040613          	addi	a2,s0,-48
    80006668:	00f60633          	add	a2,a2,a5
    8000666c:	00000597          	auipc	a1,0x0
    80006670:	f2458593          	addi	a1,a1,-220 # 80006590 <_ZL9sleepyRunPv>
    80006674:	fc040513          	addi	a0,s0,-64
    80006678:	00f50533          	add	a0,a0,a5
    8000667c:	ffffb097          	auipc	ra,0xffffb
    80006680:	d04080e7          	jalr	-764(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80006684:	0014849b          	addiw	s1,s1,1
    80006688:	00100793          	li	a5,1
    8000668c:	fc97dae3          	bge	a5,s1,80006660 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    80006690:	00006797          	auipc	a5,0x6
    80006694:	6687c783          	lbu	a5,1640(a5) # 8000ccf8 <_ZL8finished>
    80006698:	fe078ce3          	beqz	a5,80006690 <_Z12testSleepingv+0x5c>
    8000669c:	00006797          	auipc	a5,0x6
    800066a0:	65d7c783          	lbu	a5,1629(a5) # 8000ccf9 <_ZL8finished+0x1>
    800066a4:	fe0786e3          	beqz	a5,80006690 <_Z12testSleepingv+0x5c>
}
    800066a8:	03813083          	ld	ra,56(sp)
    800066ac:	03013403          	ld	s0,48(sp)
    800066b0:	02813483          	ld	s1,40(sp)
    800066b4:	04010113          	addi	sp,sp,64
    800066b8:	00008067          	ret

00000000800066bc <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800066bc:	fe010113          	addi	sp,sp,-32
    800066c0:	00113c23          	sd	ra,24(sp)
    800066c4:	00813823          	sd	s0,16(sp)
    800066c8:	00913423          	sd	s1,8(sp)
    800066cc:	01213023          	sd	s2,0(sp)
    800066d0:	02010413          	addi	s0,sp,32
    800066d4:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800066d8:	00100793          	li	a5,1
    800066dc:	02a7f863          	bgeu	a5,a0,8000670c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800066e0:	00a00793          	li	a5,10
    800066e4:	02f577b3          	remu	a5,a0,a5
    800066e8:	02078e63          	beqz	a5,80006724 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800066ec:	fff48513          	addi	a0,s1,-1
    800066f0:	00000097          	auipc	ra,0x0
    800066f4:	fcc080e7          	jalr	-52(ra) # 800066bc <_ZL9fibonaccim>
    800066f8:	00050913          	mv	s2,a0
    800066fc:	ffe48513          	addi	a0,s1,-2
    80006700:	00000097          	auipc	ra,0x0
    80006704:	fbc080e7          	jalr	-68(ra) # 800066bc <_ZL9fibonaccim>
    80006708:	00a90533          	add	a0,s2,a0
}
    8000670c:	01813083          	ld	ra,24(sp)
    80006710:	01013403          	ld	s0,16(sp)
    80006714:	00813483          	ld	s1,8(sp)
    80006718:	00013903          	ld	s2,0(sp)
    8000671c:	02010113          	addi	sp,sp,32
    80006720:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80006724:	ffffb097          	auipc	ra,0xffffb
    80006728:	d04080e7          	jalr	-764(ra) # 80001428 <_Z15thread_dispatchv>
    8000672c:	fc1ff06f          	j	800066ec <_ZL9fibonaccim+0x30>

0000000080006730 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80006730:	fe010113          	addi	sp,sp,-32
    80006734:	00113c23          	sd	ra,24(sp)
    80006738:	00813823          	sd	s0,16(sp)
    8000673c:	00913423          	sd	s1,8(sp)
    80006740:	01213023          	sd	s2,0(sp)
    80006744:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80006748:	00a00493          	li	s1,10
    8000674c:	0400006f          	j	8000678c <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006750:	00004517          	auipc	a0,0x4
    80006754:	c4050513          	addi	a0,a0,-960 # 8000a390 <_ZZ9kPrintIntmE6digits+0x320>
    80006758:	fffff097          	auipc	ra,0xfffff
    8000675c:	61c080e7          	jalr	1564(ra) # 80005d74 <_Z11printStringPKc>
    80006760:	00000613          	li	a2,0
    80006764:	00a00593          	li	a1,10
    80006768:	00048513          	mv	a0,s1
    8000676c:	fffff097          	auipc	ra,0xfffff
    80006770:	7b8080e7          	jalr	1976(ra) # 80005f24 <_Z8printIntiii>
    80006774:	00004517          	auipc	a0,0x4
    80006778:	e0c50513          	addi	a0,a0,-500 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    8000677c:	fffff097          	auipc	ra,0xfffff
    80006780:	5f8080e7          	jalr	1528(ra) # 80005d74 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80006784:	0014849b          	addiw	s1,s1,1
    80006788:	0ff4f493          	andi	s1,s1,255
    8000678c:	00c00793          	li	a5,12
    80006790:	fc97f0e3          	bgeu	a5,s1,80006750 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80006794:	00004517          	auipc	a0,0x4
    80006798:	c0450513          	addi	a0,a0,-1020 # 8000a398 <_ZZ9kPrintIntmE6digits+0x328>
    8000679c:	fffff097          	auipc	ra,0xfffff
    800067a0:	5d8080e7          	jalr	1496(ra) # 80005d74 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800067a4:	00500313          	li	t1,5
    thread_dispatch();
    800067a8:	ffffb097          	auipc	ra,0xffffb
    800067ac:	c80080e7          	jalr	-896(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800067b0:	01000513          	li	a0,16
    800067b4:	00000097          	auipc	ra,0x0
    800067b8:	f08080e7          	jalr	-248(ra) # 800066bc <_ZL9fibonaccim>
    800067bc:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800067c0:	00004517          	auipc	a0,0x4
    800067c4:	be850513          	addi	a0,a0,-1048 # 8000a3a8 <_ZZ9kPrintIntmE6digits+0x338>
    800067c8:	fffff097          	auipc	ra,0xfffff
    800067cc:	5ac080e7          	jalr	1452(ra) # 80005d74 <_Z11printStringPKc>
    800067d0:	00000613          	li	a2,0
    800067d4:	00a00593          	li	a1,10
    800067d8:	0009051b          	sext.w	a0,s2
    800067dc:	fffff097          	auipc	ra,0xfffff
    800067e0:	748080e7          	jalr	1864(ra) # 80005f24 <_Z8printIntiii>
    800067e4:	00004517          	auipc	a0,0x4
    800067e8:	d9c50513          	addi	a0,a0,-612 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800067ec:	fffff097          	auipc	ra,0xfffff
    800067f0:	588080e7          	jalr	1416(ra) # 80005d74 <_Z11printStringPKc>
    800067f4:	0400006f          	j	80006834 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800067f8:	00004517          	auipc	a0,0x4
    800067fc:	b9850513          	addi	a0,a0,-1128 # 8000a390 <_ZZ9kPrintIntmE6digits+0x320>
    80006800:	fffff097          	auipc	ra,0xfffff
    80006804:	574080e7          	jalr	1396(ra) # 80005d74 <_Z11printStringPKc>
    80006808:	00000613          	li	a2,0
    8000680c:	00a00593          	li	a1,10
    80006810:	00048513          	mv	a0,s1
    80006814:	fffff097          	auipc	ra,0xfffff
    80006818:	710080e7          	jalr	1808(ra) # 80005f24 <_Z8printIntiii>
    8000681c:	00004517          	auipc	a0,0x4
    80006820:	d6450513          	addi	a0,a0,-668 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80006824:	fffff097          	auipc	ra,0xfffff
    80006828:	550080e7          	jalr	1360(ra) # 80005d74 <_Z11printStringPKc>
    for (; i < 16; i++) {
    8000682c:	0014849b          	addiw	s1,s1,1
    80006830:	0ff4f493          	andi	s1,s1,255
    80006834:	00f00793          	li	a5,15
    80006838:	fc97f0e3          	bgeu	a5,s1,800067f8 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    8000683c:	00004517          	auipc	a0,0x4
    80006840:	b7c50513          	addi	a0,a0,-1156 # 8000a3b8 <_ZZ9kPrintIntmE6digits+0x348>
    80006844:	fffff097          	auipc	ra,0xfffff
    80006848:	530080e7          	jalr	1328(ra) # 80005d74 <_Z11printStringPKc>
    finishedD = true;
    8000684c:	00100793          	li	a5,1
    80006850:	00006717          	auipc	a4,0x6
    80006854:	4af70523          	sb	a5,1194(a4) # 8000ccfa <_ZL9finishedD>
    thread_dispatch();
    80006858:	ffffb097          	auipc	ra,0xffffb
    8000685c:	bd0080e7          	jalr	-1072(ra) # 80001428 <_Z15thread_dispatchv>
}
    80006860:	01813083          	ld	ra,24(sp)
    80006864:	01013403          	ld	s0,16(sp)
    80006868:	00813483          	ld	s1,8(sp)
    8000686c:	00013903          	ld	s2,0(sp)
    80006870:	02010113          	addi	sp,sp,32
    80006874:	00008067          	ret

0000000080006878 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80006878:	fe010113          	addi	sp,sp,-32
    8000687c:	00113c23          	sd	ra,24(sp)
    80006880:	00813823          	sd	s0,16(sp)
    80006884:	00913423          	sd	s1,8(sp)
    80006888:	01213023          	sd	s2,0(sp)
    8000688c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80006890:	00000493          	li	s1,0
    80006894:	0400006f          	j	800068d4 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80006898:	00004517          	auipc	a0,0x4
    8000689c:	ab850513          	addi	a0,a0,-1352 # 8000a350 <_ZZ9kPrintIntmE6digits+0x2e0>
    800068a0:	fffff097          	auipc	ra,0xfffff
    800068a4:	4d4080e7          	jalr	1236(ra) # 80005d74 <_Z11printStringPKc>
    800068a8:	00000613          	li	a2,0
    800068ac:	00a00593          	li	a1,10
    800068b0:	00048513          	mv	a0,s1
    800068b4:	fffff097          	auipc	ra,0xfffff
    800068b8:	670080e7          	jalr	1648(ra) # 80005f24 <_Z8printIntiii>
    800068bc:	00004517          	auipc	a0,0x4
    800068c0:	cc450513          	addi	a0,a0,-828 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800068c4:	fffff097          	auipc	ra,0xfffff
    800068c8:	4b0080e7          	jalr	1200(ra) # 80005d74 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800068cc:	0014849b          	addiw	s1,s1,1
    800068d0:	0ff4f493          	andi	s1,s1,255
    800068d4:	00200793          	li	a5,2
    800068d8:	fc97f0e3          	bgeu	a5,s1,80006898 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    800068dc:	00004517          	auipc	a0,0x4
    800068e0:	a7c50513          	addi	a0,a0,-1412 # 8000a358 <_ZZ9kPrintIntmE6digits+0x2e8>
    800068e4:	fffff097          	auipc	ra,0xfffff
    800068e8:	490080e7          	jalr	1168(ra) # 80005d74 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800068ec:	00700313          	li	t1,7
    thread_dispatch();
    800068f0:	ffffb097          	auipc	ra,0xffffb
    800068f4:	b38080e7          	jalr	-1224(ra) # 80001428 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800068f8:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    800068fc:	00004517          	auipc	a0,0x4
    80006900:	a6c50513          	addi	a0,a0,-1428 # 8000a368 <_ZZ9kPrintIntmE6digits+0x2f8>
    80006904:	fffff097          	auipc	ra,0xfffff
    80006908:	470080e7          	jalr	1136(ra) # 80005d74 <_Z11printStringPKc>
    8000690c:	00000613          	li	a2,0
    80006910:	00a00593          	li	a1,10
    80006914:	0009051b          	sext.w	a0,s2
    80006918:	fffff097          	auipc	ra,0xfffff
    8000691c:	60c080e7          	jalr	1548(ra) # 80005f24 <_Z8printIntiii>
    80006920:	00004517          	auipc	a0,0x4
    80006924:	c6050513          	addi	a0,a0,-928 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80006928:	fffff097          	auipc	ra,0xfffff
    8000692c:	44c080e7          	jalr	1100(ra) # 80005d74 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80006930:	00c00513          	li	a0,12
    80006934:	00000097          	auipc	ra,0x0
    80006938:	d88080e7          	jalr	-632(ra) # 800066bc <_ZL9fibonaccim>
    8000693c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006940:	00004517          	auipc	a0,0x4
    80006944:	a3050513          	addi	a0,a0,-1488 # 8000a370 <_ZZ9kPrintIntmE6digits+0x300>
    80006948:	fffff097          	auipc	ra,0xfffff
    8000694c:	42c080e7          	jalr	1068(ra) # 80005d74 <_Z11printStringPKc>
    80006950:	00000613          	li	a2,0
    80006954:	00a00593          	li	a1,10
    80006958:	0009051b          	sext.w	a0,s2
    8000695c:	fffff097          	auipc	ra,0xfffff
    80006960:	5c8080e7          	jalr	1480(ra) # 80005f24 <_Z8printIntiii>
    80006964:	00004517          	auipc	a0,0x4
    80006968:	c1c50513          	addi	a0,a0,-996 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    8000696c:	fffff097          	auipc	ra,0xfffff
    80006970:	408080e7          	jalr	1032(ra) # 80005d74 <_Z11printStringPKc>
    80006974:	0400006f          	j	800069b4 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80006978:	00004517          	auipc	a0,0x4
    8000697c:	9d850513          	addi	a0,a0,-1576 # 8000a350 <_ZZ9kPrintIntmE6digits+0x2e0>
    80006980:	fffff097          	auipc	ra,0xfffff
    80006984:	3f4080e7          	jalr	1012(ra) # 80005d74 <_Z11printStringPKc>
    80006988:	00000613          	li	a2,0
    8000698c:	00a00593          	li	a1,10
    80006990:	00048513          	mv	a0,s1
    80006994:	fffff097          	auipc	ra,0xfffff
    80006998:	590080e7          	jalr	1424(ra) # 80005f24 <_Z8printIntiii>
    8000699c:	00004517          	auipc	a0,0x4
    800069a0:	be450513          	addi	a0,a0,-1052 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800069a4:	fffff097          	auipc	ra,0xfffff
    800069a8:	3d0080e7          	jalr	976(ra) # 80005d74 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800069ac:	0014849b          	addiw	s1,s1,1
    800069b0:	0ff4f493          	andi	s1,s1,255
    800069b4:	00500793          	li	a5,5
    800069b8:	fc97f0e3          	bgeu	a5,s1,80006978 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    800069bc:	00004517          	auipc	a0,0x4
    800069c0:	96c50513          	addi	a0,a0,-1684 # 8000a328 <_ZZ9kPrintIntmE6digits+0x2b8>
    800069c4:	fffff097          	auipc	ra,0xfffff
    800069c8:	3b0080e7          	jalr	944(ra) # 80005d74 <_Z11printStringPKc>
    finishedC = true;
    800069cc:	00100793          	li	a5,1
    800069d0:	00006717          	auipc	a4,0x6
    800069d4:	32f705a3          	sb	a5,811(a4) # 8000ccfb <_ZL9finishedC>
    thread_dispatch();
    800069d8:	ffffb097          	auipc	ra,0xffffb
    800069dc:	a50080e7          	jalr	-1456(ra) # 80001428 <_Z15thread_dispatchv>
}
    800069e0:	01813083          	ld	ra,24(sp)
    800069e4:	01013403          	ld	s0,16(sp)
    800069e8:	00813483          	ld	s1,8(sp)
    800069ec:	00013903          	ld	s2,0(sp)
    800069f0:	02010113          	addi	sp,sp,32
    800069f4:	00008067          	ret

00000000800069f8 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    800069f8:	fe010113          	addi	sp,sp,-32
    800069fc:	00113c23          	sd	ra,24(sp)
    80006a00:	00813823          	sd	s0,16(sp)
    80006a04:	00913423          	sd	s1,8(sp)
    80006a08:	01213023          	sd	s2,0(sp)
    80006a0c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006a10:	00000913          	li	s2,0
    80006a14:	0400006f          	j	80006a54 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    80006a18:	ffffb097          	auipc	ra,0xffffb
    80006a1c:	a10080e7          	jalr	-1520(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006a20:	00148493          	addi	s1,s1,1
    80006a24:	000027b7          	lui	a5,0x2
    80006a28:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006a2c:	0097ee63          	bltu	a5,s1,80006a48 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006a30:	00000713          	li	a4,0
    80006a34:	000077b7          	lui	a5,0x7
    80006a38:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006a3c:	fce7eee3          	bltu	a5,a4,80006a18 <_ZL11workerBodyBPv+0x20>
    80006a40:	00170713          	addi	a4,a4,1
    80006a44:	ff1ff06f          	j	80006a34 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    80006a48:	00a00793          	li	a5,10
    80006a4c:	04f90663          	beq	s2,a5,80006a98 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80006a50:	00190913          	addi	s2,s2,1
    80006a54:	00f00793          	li	a5,15
    80006a58:	0527e463          	bltu	a5,s2,80006aa0 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80006a5c:	00004517          	auipc	a0,0x4
    80006a60:	8dc50513          	addi	a0,a0,-1828 # 8000a338 <_ZZ9kPrintIntmE6digits+0x2c8>
    80006a64:	fffff097          	auipc	ra,0xfffff
    80006a68:	310080e7          	jalr	784(ra) # 80005d74 <_Z11printStringPKc>
    80006a6c:	00000613          	li	a2,0
    80006a70:	00a00593          	li	a1,10
    80006a74:	0009051b          	sext.w	a0,s2
    80006a78:	fffff097          	auipc	ra,0xfffff
    80006a7c:	4ac080e7          	jalr	1196(ra) # 80005f24 <_Z8printIntiii>
    80006a80:	00004517          	auipc	a0,0x4
    80006a84:	b0050513          	addi	a0,a0,-1280 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80006a88:	fffff097          	auipc	ra,0xfffff
    80006a8c:	2ec080e7          	jalr	748(ra) # 80005d74 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006a90:	00000493          	li	s1,0
    80006a94:	f91ff06f          	j	80006a24 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    80006a98:	14102ff3          	csrr	t6,sepc
    80006a9c:	fb5ff06f          	j	80006a50 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    80006aa0:	00004517          	auipc	a0,0x4
    80006aa4:	8a050513          	addi	a0,a0,-1888 # 8000a340 <_ZZ9kPrintIntmE6digits+0x2d0>
    80006aa8:	fffff097          	auipc	ra,0xfffff
    80006aac:	2cc080e7          	jalr	716(ra) # 80005d74 <_Z11printStringPKc>
    finishedB = true;
    80006ab0:	00100793          	li	a5,1
    80006ab4:	00006717          	auipc	a4,0x6
    80006ab8:	24f70423          	sb	a5,584(a4) # 8000ccfc <_ZL9finishedB>
    thread_dispatch();
    80006abc:	ffffb097          	auipc	ra,0xffffb
    80006ac0:	96c080e7          	jalr	-1684(ra) # 80001428 <_Z15thread_dispatchv>
}
    80006ac4:	01813083          	ld	ra,24(sp)
    80006ac8:	01013403          	ld	s0,16(sp)
    80006acc:	00813483          	ld	s1,8(sp)
    80006ad0:	00013903          	ld	s2,0(sp)
    80006ad4:	02010113          	addi	sp,sp,32
    80006ad8:	00008067          	ret

0000000080006adc <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006adc:	fe010113          	addi	sp,sp,-32
    80006ae0:	00113c23          	sd	ra,24(sp)
    80006ae4:	00813823          	sd	s0,16(sp)
    80006ae8:	00913423          	sd	s1,8(sp)
    80006aec:	01213023          	sd	s2,0(sp)
    80006af0:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006af4:	00000913          	li	s2,0
    80006af8:	0380006f          	j	80006b30 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80006afc:	ffffb097          	auipc	ra,0xffffb
    80006b00:	92c080e7          	jalr	-1748(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006b04:	00148493          	addi	s1,s1,1
    80006b08:	000027b7          	lui	a5,0x2
    80006b0c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006b10:	0097ee63          	bltu	a5,s1,80006b2c <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006b14:	00000713          	li	a4,0
    80006b18:	000077b7          	lui	a5,0x7
    80006b1c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006b20:	fce7eee3          	bltu	a5,a4,80006afc <_ZL11workerBodyAPv+0x20>
    80006b24:	00170713          	addi	a4,a4,1
    80006b28:	ff1ff06f          	j	80006b18 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80006b2c:	00190913          	addi	s2,s2,1
    80006b30:	00900793          	li	a5,9
    80006b34:	0527e063          	bltu	a5,s2,80006b74 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80006b38:	00003517          	auipc	a0,0x3
    80006b3c:	7e850513          	addi	a0,a0,2024 # 8000a320 <_ZZ9kPrintIntmE6digits+0x2b0>
    80006b40:	fffff097          	auipc	ra,0xfffff
    80006b44:	234080e7          	jalr	564(ra) # 80005d74 <_Z11printStringPKc>
    80006b48:	00000613          	li	a2,0
    80006b4c:	00a00593          	li	a1,10
    80006b50:	0009051b          	sext.w	a0,s2
    80006b54:	fffff097          	auipc	ra,0xfffff
    80006b58:	3d0080e7          	jalr	976(ra) # 80005f24 <_Z8printIntiii>
    80006b5c:	00004517          	auipc	a0,0x4
    80006b60:	a2450513          	addi	a0,a0,-1500 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80006b64:	fffff097          	auipc	ra,0xfffff
    80006b68:	210080e7          	jalr	528(ra) # 80005d74 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006b6c:	00000493          	li	s1,0
    80006b70:	f99ff06f          	j	80006b08 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80006b74:	00003517          	auipc	a0,0x3
    80006b78:	7b450513          	addi	a0,a0,1972 # 8000a328 <_ZZ9kPrintIntmE6digits+0x2b8>
    80006b7c:	fffff097          	auipc	ra,0xfffff
    80006b80:	1f8080e7          	jalr	504(ra) # 80005d74 <_Z11printStringPKc>
    finishedA = true;
    80006b84:	00100793          	li	a5,1
    80006b88:	00006717          	auipc	a4,0x6
    80006b8c:	16f70aa3          	sb	a5,373(a4) # 8000ccfd <_ZL9finishedA>
}
    80006b90:	01813083          	ld	ra,24(sp)
    80006b94:	01013403          	ld	s0,16(sp)
    80006b98:	00813483          	ld	s1,8(sp)
    80006b9c:	00013903          	ld	s2,0(sp)
    80006ba0:	02010113          	addi	sp,sp,32
    80006ba4:	00008067          	ret

0000000080006ba8 <_Z16System_Mode_testv>:


void System_Mode_test() {
    80006ba8:	fd010113          	addi	sp,sp,-48
    80006bac:	02113423          	sd	ra,40(sp)
    80006bb0:	02813023          	sd	s0,32(sp)
    80006bb4:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80006bb8:	00000613          	li	a2,0
    80006bbc:	00000597          	auipc	a1,0x0
    80006bc0:	f2058593          	addi	a1,a1,-224 # 80006adc <_ZL11workerBodyAPv>
    80006bc4:	fd040513          	addi	a0,s0,-48
    80006bc8:	ffffa097          	auipc	ra,0xffffa
    80006bcc:	7b8080e7          	jalr	1976(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80006bd0:	00003517          	auipc	a0,0x3
    80006bd4:	7f850513          	addi	a0,a0,2040 # 8000a3c8 <_ZZ9kPrintIntmE6digits+0x358>
    80006bd8:	fffff097          	auipc	ra,0xfffff
    80006bdc:	19c080e7          	jalr	412(ra) # 80005d74 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80006be0:	00000613          	li	a2,0
    80006be4:	00000597          	auipc	a1,0x0
    80006be8:	e1458593          	addi	a1,a1,-492 # 800069f8 <_ZL11workerBodyBPv>
    80006bec:	fd840513          	addi	a0,s0,-40
    80006bf0:	ffffa097          	auipc	ra,0xffffa
    80006bf4:	790080e7          	jalr	1936(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80006bf8:	00003517          	auipc	a0,0x3
    80006bfc:	7e850513          	addi	a0,a0,2024 # 8000a3e0 <_ZZ9kPrintIntmE6digits+0x370>
    80006c00:	fffff097          	auipc	ra,0xfffff
    80006c04:	174080e7          	jalr	372(ra) # 80005d74 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80006c08:	00000613          	li	a2,0
    80006c0c:	00000597          	auipc	a1,0x0
    80006c10:	c6c58593          	addi	a1,a1,-916 # 80006878 <_ZL11workerBodyCPv>
    80006c14:	fe040513          	addi	a0,s0,-32
    80006c18:	ffffa097          	auipc	ra,0xffffa
    80006c1c:	768080e7          	jalr	1896(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80006c20:	00003517          	auipc	a0,0x3
    80006c24:	7d850513          	addi	a0,a0,2008 # 8000a3f8 <_ZZ9kPrintIntmE6digits+0x388>
    80006c28:	fffff097          	auipc	ra,0xfffff
    80006c2c:	14c080e7          	jalr	332(ra) # 80005d74 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80006c30:	00000613          	li	a2,0
    80006c34:	00000597          	auipc	a1,0x0
    80006c38:	afc58593          	addi	a1,a1,-1284 # 80006730 <_ZL11workerBodyDPv>
    80006c3c:	fe840513          	addi	a0,s0,-24
    80006c40:	ffffa097          	auipc	ra,0xffffa
    80006c44:	740080e7          	jalr	1856(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80006c48:	00003517          	auipc	a0,0x3
    80006c4c:	7c850513          	addi	a0,a0,1992 # 8000a410 <_ZZ9kPrintIntmE6digits+0x3a0>
    80006c50:	fffff097          	auipc	ra,0xfffff
    80006c54:	124080e7          	jalr	292(ra) # 80005d74 <_Z11printStringPKc>
    80006c58:	00c0006f          	j	80006c64 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006c5c:	ffffa097          	auipc	ra,0xffffa
    80006c60:	7cc080e7          	jalr	1996(ra) # 80001428 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006c64:	00006797          	auipc	a5,0x6
    80006c68:	0997c783          	lbu	a5,153(a5) # 8000ccfd <_ZL9finishedA>
    80006c6c:	fe0788e3          	beqz	a5,80006c5c <_Z16System_Mode_testv+0xb4>
    80006c70:	00006797          	auipc	a5,0x6
    80006c74:	08c7c783          	lbu	a5,140(a5) # 8000ccfc <_ZL9finishedB>
    80006c78:	fe0782e3          	beqz	a5,80006c5c <_Z16System_Mode_testv+0xb4>
    80006c7c:	00006797          	auipc	a5,0x6
    80006c80:	07f7c783          	lbu	a5,127(a5) # 8000ccfb <_ZL9finishedC>
    80006c84:	fc078ce3          	beqz	a5,80006c5c <_Z16System_Mode_testv+0xb4>
    80006c88:	00006797          	auipc	a5,0x6
    80006c8c:	0727c783          	lbu	a5,114(a5) # 8000ccfa <_ZL9finishedD>
    80006c90:	fc0786e3          	beqz	a5,80006c5c <_Z16System_Mode_testv+0xb4>
    }

}
    80006c94:	02813083          	ld	ra,40(sp)
    80006c98:	02013403          	ld	s0,32(sp)
    80006c9c:	03010113          	addi	sp,sp,48
    80006ca0:	00008067          	ret

0000000080006ca4 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006ca4:	fe010113          	addi	sp,sp,-32
    80006ca8:	00113c23          	sd	ra,24(sp)
    80006cac:	00813823          	sd	s0,16(sp)
    80006cb0:	00913423          	sd	s1,8(sp)
    80006cb4:	01213023          	sd	s2,0(sp)
    80006cb8:	02010413          	addi	s0,sp,32
    80006cbc:	00050493          	mv	s1,a0
    80006cc0:	00058913          	mv	s2,a1
    80006cc4:	0015879b          	addiw	a5,a1,1
    80006cc8:	0007851b          	sext.w	a0,a5
    80006ccc:	00f4a023          	sw	a5,0(s1)
    80006cd0:	0004a823          	sw	zero,16(s1)
    80006cd4:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006cd8:	00251513          	slli	a0,a0,0x2
    80006cdc:	ffffa097          	auipc	ra,0xffffa
    80006ce0:	634080e7          	jalr	1588(ra) # 80001310 <_Z9mem_allocm>
    80006ce4:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80006ce8:	00000593          	li	a1,0
    80006cec:	02048513          	addi	a0,s1,32
    80006cf0:	ffffa097          	auipc	ra,0xffffa
    80006cf4:	7b0080e7          	jalr	1968(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&spaceAvailable, _cap);
    80006cf8:	00090593          	mv	a1,s2
    80006cfc:	01848513          	addi	a0,s1,24
    80006d00:	ffffa097          	auipc	ra,0xffffa
    80006d04:	7a0080e7          	jalr	1952(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&mutexHead, 1);
    80006d08:	00100593          	li	a1,1
    80006d0c:	02848513          	addi	a0,s1,40
    80006d10:	ffffa097          	auipc	ra,0xffffa
    80006d14:	790080e7          	jalr	1936(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&mutexTail, 1);
    80006d18:	00100593          	li	a1,1
    80006d1c:	03048513          	addi	a0,s1,48
    80006d20:	ffffa097          	auipc	ra,0xffffa
    80006d24:	780080e7          	jalr	1920(ra) # 800014a0 <_Z8sem_openPP4KSemj>
}
    80006d28:	01813083          	ld	ra,24(sp)
    80006d2c:	01013403          	ld	s0,16(sp)
    80006d30:	00813483          	ld	s1,8(sp)
    80006d34:	00013903          	ld	s2,0(sp)
    80006d38:	02010113          	addi	sp,sp,32
    80006d3c:	00008067          	ret

0000000080006d40 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80006d40:	fe010113          	addi	sp,sp,-32
    80006d44:	00113c23          	sd	ra,24(sp)
    80006d48:	00813823          	sd	s0,16(sp)
    80006d4c:	00913423          	sd	s1,8(sp)
    80006d50:	01213023          	sd	s2,0(sp)
    80006d54:	02010413          	addi	s0,sp,32
    80006d58:	00050493          	mv	s1,a0
    80006d5c:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80006d60:	01853503          	ld	a0,24(a0)
    80006d64:	ffffa097          	auipc	ra,0xffffa
    80006d68:	7a4080e7          	jalr	1956(ra) # 80001508 <_Z8sem_waitP4KSem>

    sem_wait(mutexTail);
    80006d6c:	0304b503          	ld	a0,48(s1)
    80006d70:	ffffa097          	auipc	ra,0xffffa
    80006d74:	798080e7          	jalr	1944(ra) # 80001508 <_Z8sem_waitP4KSem>
    buffer[tail] = val;
    80006d78:	0084b783          	ld	a5,8(s1)
    80006d7c:	0144a703          	lw	a4,20(s1)
    80006d80:	00271713          	slli	a4,a4,0x2
    80006d84:	00e787b3          	add	a5,a5,a4
    80006d88:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006d8c:	0144a783          	lw	a5,20(s1)
    80006d90:	0017879b          	addiw	a5,a5,1
    80006d94:	0004a703          	lw	a4,0(s1)
    80006d98:	02e7e7bb          	remw	a5,a5,a4
    80006d9c:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80006da0:	0304b503          	ld	a0,48(s1)
    80006da4:	ffffa097          	auipc	ra,0xffffa
    80006da8:	794080e7          	jalr	1940(ra) # 80001538 <_Z10sem_signalP4KSem>

    sem_signal(itemAvailable);
    80006dac:	0204b503          	ld	a0,32(s1)
    80006db0:	ffffa097          	auipc	ra,0xffffa
    80006db4:	788080e7          	jalr	1928(ra) # 80001538 <_Z10sem_signalP4KSem>

}
    80006db8:	01813083          	ld	ra,24(sp)
    80006dbc:	01013403          	ld	s0,16(sp)
    80006dc0:	00813483          	ld	s1,8(sp)
    80006dc4:	00013903          	ld	s2,0(sp)
    80006dc8:	02010113          	addi	sp,sp,32
    80006dcc:	00008067          	ret

0000000080006dd0 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80006dd0:	fe010113          	addi	sp,sp,-32
    80006dd4:	00113c23          	sd	ra,24(sp)
    80006dd8:	00813823          	sd	s0,16(sp)
    80006ddc:	00913423          	sd	s1,8(sp)
    80006de0:	01213023          	sd	s2,0(sp)
    80006de4:	02010413          	addi	s0,sp,32
    80006de8:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80006dec:	02053503          	ld	a0,32(a0)
    80006df0:	ffffa097          	auipc	ra,0xffffa
    80006df4:	718080e7          	jalr	1816(ra) # 80001508 <_Z8sem_waitP4KSem>

    sem_wait(mutexHead);
    80006df8:	0284b503          	ld	a0,40(s1)
    80006dfc:	ffffa097          	auipc	ra,0xffffa
    80006e00:	70c080e7          	jalr	1804(ra) # 80001508 <_Z8sem_waitP4KSem>

    int ret = buffer[head];
    80006e04:	0084b703          	ld	a4,8(s1)
    80006e08:	0104a783          	lw	a5,16(s1)
    80006e0c:	00279693          	slli	a3,a5,0x2
    80006e10:	00d70733          	add	a4,a4,a3
    80006e14:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006e18:	0017879b          	addiw	a5,a5,1
    80006e1c:	0004a703          	lw	a4,0(s1)
    80006e20:	02e7e7bb          	remw	a5,a5,a4
    80006e24:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80006e28:	0284b503          	ld	a0,40(s1)
    80006e2c:	ffffa097          	auipc	ra,0xffffa
    80006e30:	70c080e7          	jalr	1804(ra) # 80001538 <_Z10sem_signalP4KSem>

    sem_signal(spaceAvailable);
    80006e34:	0184b503          	ld	a0,24(s1)
    80006e38:	ffffa097          	auipc	ra,0xffffa
    80006e3c:	700080e7          	jalr	1792(ra) # 80001538 <_Z10sem_signalP4KSem>

    return ret;
}
    80006e40:	00090513          	mv	a0,s2
    80006e44:	01813083          	ld	ra,24(sp)
    80006e48:	01013403          	ld	s0,16(sp)
    80006e4c:	00813483          	ld	s1,8(sp)
    80006e50:	00013903          	ld	s2,0(sp)
    80006e54:	02010113          	addi	sp,sp,32
    80006e58:	00008067          	ret

0000000080006e5c <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80006e5c:	fe010113          	addi	sp,sp,-32
    80006e60:	00113c23          	sd	ra,24(sp)
    80006e64:	00813823          	sd	s0,16(sp)
    80006e68:	00913423          	sd	s1,8(sp)
    80006e6c:	01213023          	sd	s2,0(sp)
    80006e70:	02010413          	addi	s0,sp,32
    80006e74:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80006e78:	02853503          	ld	a0,40(a0)
    80006e7c:	ffffa097          	auipc	ra,0xffffa
    80006e80:	68c080e7          	jalr	1676(ra) # 80001508 <_Z8sem_waitP4KSem>
    sem_wait(mutexTail);
    80006e84:	0304b503          	ld	a0,48(s1)
    80006e88:	ffffa097          	auipc	ra,0xffffa
    80006e8c:	680080e7          	jalr	1664(ra) # 80001508 <_Z8sem_waitP4KSem>

    if (tail >= head) {
    80006e90:	0144a783          	lw	a5,20(s1)
    80006e94:	0104a903          	lw	s2,16(s1)
    80006e98:	0327ce63          	blt	a5,s2,80006ed4 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80006e9c:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80006ea0:	0304b503          	ld	a0,48(s1)
    80006ea4:	ffffa097          	auipc	ra,0xffffa
    80006ea8:	694080e7          	jalr	1684(ra) # 80001538 <_Z10sem_signalP4KSem>
    sem_signal(mutexHead);
    80006eac:	0284b503          	ld	a0,40(s1)
    80006eb0:	ffffa097          	auipc	ra,0xffffa
    80006eb4:	688080e7          	jalr	1672(ra) # 80001538 <_Z10sem_signalP4KSem>

    return ret;
}
    80006eb8:	00090513          	mv	a0,s2
    80006ebc:	01813083          	ld	ra,24(sp)
    80006ec0:	01013403          	ld	s0,16(sp)
    80006ec4:	00813483          	ld	s1,8(sp)
    80006ec8:	00013903          	ld	s2,0(sp)
    80006ecc:	02010113          	addi	sp,sp,32
    80006ed0:	00008067          	ret
        ret = cap - head + tail;
    80006ed4:	0004a703          	lw	a4,0(s1)
    80006ed8:	4127093b          	subw	s2,a4,s2
    80006edc:	00f9093b          	addw	s2,s2,a5
    80006ee0:	fc1ff06f          	j	80006ea0 <_ZN6Buffer6getCntEv+0x44>

0000000080006ee4 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80006ee4:	fe010113          	addi	sp,sp,-32
    80006ee8:	00113c23          	sd	ra,24(sp)
    80006eec:	00813823          	sd	s0,16(sp)
    80006ef0:	00913423          	sd	s1,8(sp)
    80006ef4:	02010413          	addi	s0,sp,32
    80006ef8:	00050493          	mv	s1,a0
    putc('\n');
    80006efc:	00a00513          	li	a0,10
    80006f00:	ffffa097          	auipc	ra,0xffffa
    80006f04:	690080e7          	jalr	1680(ra) # 80001590 <_Z4putcc>
    printString("Buffer deleted!\n");
    80006f08:	00003517          	auipc	a0,0x3
    80006f0c:	52050513          	addi	a0,a0,1312 # 8000a428 <_ZZ9kPrintIntmE6digits+0x3b8>
    80006f10:	fffff097          	auipc	ra,0xfffff
    80006f14:	e64080e7          	jalr	-412(ra) # 80005d74 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80006f18:	00048513          	mv	a0,s1
    80006f1c:	00000097          	auipc	ra,0x0
    80006f20:	f40080e7          	jalr	-192(ra) # 80006e5c <_ZN6Buffer6getCntEv>
    80006f24:	02a05c63          	blez	a0,80006f5c <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80006f28:	0084b783          	ld	a5,8(s1)
    80006f2c:	0104a703          	lw	a4,16(s1)
    80006f30:	00271713          	slli	a4,a4,0x2
    80006f34:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80006f38:	0007c503          	lbu	a0,0(a5)
    80006f3c:	ffffa097          	auipc	ra,0xffffa
    80006f40:	654080e7          	jalr	1620(ra) # 80001590 <_Z4putcc>
        head = (head + 1) % cap;
    80006f44:	0104a783          	lw	a5,16(s1)
    80006f48:	0017879b          	addiw	a5,a5,1
    80006f4c:	0004a703          	lw	a4,0(s1)
    80006f50:	02e7e7bb          	remw	a5,a5,a4
    80006f54:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80006f58:	fc1ff06f          	j	80006f18 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80006f5c:	02100513          	li	a0,33
    80006f60:	ffffa097          	auipc	ra,0xffffa
    80006f64:	630080e7          	jalr	1584(ra) # 80001590 <_Z4putcc>
    putc('\n');
    80006f68:	00a00513          	li	a0,10
    80006f6c:	ffffa097          	auipc	ra,0xffffa
    80006f70:	624080e7          	jalr	1572(ra) # 80001590 <_Z4putcc>
    mem_free(buffer);
    80006f74:	0084b503          	ld	a0,8(s1)
    80006f78:	ffffa097          	auipc	ra,0xffffa
    80006f7c:	3d8080e7          	jalr	984(ra) # 80001350 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80006f80:	0204b503          	ld	a0,32(s1)
    80006f84:	ffffa097          	auipc	ra,0xffffa
    80006f88:	554080e7          	jalr	1364(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(spaceAvailable);
    80006f8c:	0184b503          	ld	a0,24(s1)
    80006f90:	ffffa097          	auipc	ra,0xffffa
    80006f94:	548080e7          	jalr	1352(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(mutexTail);
    80006f98:	0304b503          	ld	a0,48(s1)
    80006f9c:	ffffa097          	auipc	ra,0xffffa
    80006fa0:	53c080e7          	jalr	1340(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(mutexHead);
    80006fa4:	0284b503          	ld	a0,40(s1)
    80006fa8:	ffffa097          	auipc	ra,0xffffa
    80006fac:	530080e7          	jalr	1328(ra) # 800014d8 <_Z9sem_closeP4KSem>
}
    80006fb0:	01813083          	ld	ra,24(sp)
    80006fb4:	01013403          	ld	s0,16(sp)
    80006fb8:	00813483          	ld	s1,8(sp)
    80006fbc:	02010113          	addi	sp,sp,32
    80006fc0:	00008067          	ret

0000000080006fc4 <start>:
    80006fc4:	ff010113          	addi	sp,sp,-16
    80006fc8:	00813423          	sd	s0,8(sp)
    80006fcc:	01010413          	addi	s0,sp,16
    80006fd0:	300027f3          	csrr	a5,mstatus
    80006fd4:	ffffe737          	lui	a4,0xffffe
    80006fd8:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff089f>
    80006fdc:	00e7f7b3          	and	a5,a5,a4
    80006fe0:	00001737          	lui	a4,0x1
    80006fe4:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80006fe8:	00e7e7b3          	or	a5,a5,a4
    80006fec:	30079073          	csrw	mstatus,a5
    80006ff0:	00000797          	auipc	a5,0x0
    80006ff4:	16078793          	addi	a5,a5,352 # 80007150 <system_main>
    80006ff8:	34179073          	csrw	mepc,a5
    80006ffc:	00000793          	li	a5,0
    80007000:	18079073          	csrw	satp,a5
    80007004:	000107b7          	lui	a5,0x10
    80007008:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    8000700c:	30279073          	csrw	medeleg,a5
    80007010:	30379073          	csrw	mideleg,a5
    80007014:	104027f3          	csrr	a5,sie
    80007018:	2227e793          	ori	a5,a5,546
    8000701c:	10479073          	csrw	sie,a5
    80007020:	fff00793          	li	a5,-1
    80007024:	00a7d793          	srli	a5,a5,0xa
    80007028:	3b079073          	csrw	pmpaddr0,a5
    8000702c:	00f00793          	li	a5,15
    80007030:	3a079073          	csrw	pmpcfg0,a5
    80007034:	f14027f3          	csrr	a5,mhartid
    80007038:	0200c737          	lui	a4,0x200c
    8000703c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80007040:	0007869b          	sext.w	a3,a5
    80007044:	00269713          	slli	a4,a3,0x2
    80007048:	000f4637          	lui	a2,0xf4
    8000704c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80007050:	00d70733          	add	a4,a4,a3
    80007054:	0037979b          	slliw	a5,a5,0x3
    80007058:	020046b7          	lui	a3,0x2004
    8000705c:	00d787b3          	add	a5,a5,a3
    80007060:	00c585b3          	add	a1,a1,a2
    80007064:	00371693          	slli	a3,a4,0x3
    80007068:	00006717          	auipc	a4,0x6
    8000706c:	c9870713          	addi	a4,a4,-872 # 8000cd00 <timer_scratch>
    80007070:	00b7b023          	sd	a1,0(a5)
    80007074:	00d70733          	add	a4,a4,a3
    80007078:	00f73c23          	sd	a5,24(a4)
    8000707c:	02c73023          	sd	a2,32(a4)
    80007080:	34071073          	csrw	mscratch,a4
    80007084:	00000797          	auipc	a5,0x0
    80007088:	6ec78793          	addi	a5,a5,1772 # 80007770 <timervec>
    8000708c:	30579073          	csrw	mtvec,a5
    80007090:	300027f3          	csrr	a5,mstatus
    80007094:	0087e793          	ori	a5,a5,8
    80007098:	30079073          	csrw	mstatus,a5
    8000709c:	304027f3          	csrr	a5,mie
    800070a0:	0807e793          	ori	a5,a5,128
    800070a4:	30479073          	csrw	mie,a5
    800070a8:	f14027f3          	csrr	a5,mhartid
    800070ac:	0007879b          	sext.w	a5,a5
    800070b0:	00078213          	mv	tp,a5
    800070b4:	30200073          	mret
    800070b8:	00813403          	ld	s0,8(sp)
    800070bc:	01010113          	addi	sp,sp,16
    800070c0:	00008067          	ret

00000000800070c4 <timerinit>:
    800070c4:	ff010113          	addi	sp,sp,-16
    800070c8:	00813423          	sd	s0,8(sp)
    800070cc:	01010413          	addi	s0,sp,16
    800070d0:	f14027f3          	csrr	a5,mhartid
    800070d4:	0200c737          	lui	a4,0x200c
    800070d8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800070dc:	0007869b          	sext.w	a3,a5
    800070e0:	00269713          	slli	a4,a3,0x2
    800070e4:	000f4637          	lui	a2,0xf4
    800070e8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800070ec:	00d70733          	add	a4,a4,a3
    800070f0:	0037979b          	slliw	a5,a5,0x3
    800070f4:	020046b7          	lui	a3,0x2004
    800070f8:	00d787b3          	add	a5,a5,a3
    800070fc:	00c585b3          	add	a1,a1,a2
    80007100:	00371693          	slli	a3,a4,0x3
    80007104:	00006717          	auipc	a4,0x6
    80007108:	bfc70713          	addi	a4,a4,-1028 # 8000cd00 <timer_scratch>
    8000710c:	00b7b023          	sd	a1,0(a5)
    80007110:	00d70733          	add	a4,a4,a3
    80007114:	00f73c23          	sd	a5,24(a4)
    80007118:	02c73023          	sd	a2,32(a4)
    8000711c:	34071073          	csrw	mscratch,a4
    80007120:	00000797          	auipc	a5,0x0
    80007124:	65078793          	addi	a5,a5,1616 # 80007770 <timervec>
    80007128:	30579073          	csrw	mtvec,a5
    8000712c:	300027f3          	csrr	a5,mstatus
    80007130:	0087e793          	ori	a5,a5,8
    80007134:	30079073          	csrw	mstatus,a5
    80007138:	304027f3          	csrr	a5,mie
    8000713c:	0807e793          	ori	a5,a5,128
    80007140:	30479073          	csrw	mie,a5
    80007144:	00813403          	ld	s0,8(sp)
    80007148:	01010113          	addi	sp,sp,16
    8000714c:	00008067          	ret

0000000080007150 <system_main>:
    80007150:	fe010113          	addi	sp,sp,-32
    80007154:	00813823          	sd	s0,16(sp)
    80007158:	00913423          	sd	s1,8(sp)
    8000715c:	00113c23          	sd	ra,24(sp)
    80007160:	02010413          	addi	s0,sp,32
    80007164:	00000097          	auipc	ra,0x0
    80007168:	0c4080e7          	jalr	196(ra) # 80007228 <cpuid>
    8000716c:	00006497          	auipc	s1,0x6
    80007170:	9e448493          	addi	s1,s1,-1564 # 8000cb50 <started>
    80007174:	02050263          	beqz	a0,80007198 <system_main+0x48>
    80007178:	0004a783          	lw	a5,0(s1)
    8000717c:	0007879b          	sext.w	a5,a5
    80007180:	fe078ce3          	beqz	a5,80007178 <system_main+0x28>
    80007184:	0ff0000f          	fence
    80007188:	00003517          	auipc	a0,0x3
    8000718c:	57050513          	addi	a0,a0,1392 # 8000a6f8 <_ZZ9kPrintIntmE6digits+0x688>
    80007190:	00001097          	auipc	ra,0x1
    80007194:	a7c080e7          	jalr	-1412(ra) # 80007c0c <panic>
    80007198:	00001097          	auipc	ra,0x1
    8000719c:	9d0080e7          	jalr	-1584(ra) # 80007b68 <consoleinit>
    800071a0:	00001097          	auipc	ra,0x1
    800071a4:	15c080e7          	jalr	348(ra) # 800082fc <printfinit>
    800071a8:	00003517          	auipc	a0,0x3
    800071ac:	3d850513          	addi	a0,a0,984 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800071b0:	00001097          	auipc	ra,0x1
    800071b4:	ab8080e7          	jalr	-1352(ra) # 80007c68 <__printf>
    800071b8:	00003517          	auipc	a0,0x3
    800071bc:	51050513          	addi	a0,a0,1296 # 8000a6c8 <_ZZ9kPrintIntmE6digits+0x658>
    800071c0:	00001097          	auipc	ra,0x1
    800071c4:	aa8080e7          	jalr	-1368(ra) # 80007c68 <__printf>
    800071c8:	00003517          	auipc	a0,0x3
    800071cc:	3b850513          	addi	a0,a0,952 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800071d0:	00001097          	auipc	ra,0x1
    800071d4:	a98080e7          	jalr	-1384(ra) # 80007c68 <__printf>
    800071d8:	00001097          	auipc	ra,0x1
    800071dc:	4b0080e7          	jalr	1200(ra) # 80008688 <kinit>
    800071e0:	00000097          	auipc	ra,0x0
    800071e4:	148080e7          	jalr	328(ra) # 80007328 <trapinit>
    800071e8:	00000097          	auipc	ra,0x0
    800071ec:	16c080e7          	jalr	364(ra) # 80007354 <trapinithart>
    800071f0:	00000097          	auipc	ra,0x0
    800071f4:	5c0080e7          	jalr	1472(ra) # 800077b0 <plicinit>
    800071f8:	00000097          	auipc	ra,0x0
    800071fc:	5e0080e7          	jalr	1504(ra) # 800077d8 <plicinithart>
    80007200:	00000097          	auipc	ra,0x0
    80007204:	078080e7          	jalr	120(ra) # 80007278 <userinit>
    80007208:	0ff0000f          	fence
    8000720c:	00100793          	li	a5,1
    80007210:	00003517          	auipc	a0,0x3
    80007214:	4d050513          	addi	a0,a0,1232 # 8000a6e0 <_ZZ9kPrintIntmE6digits+0x670>
    80007218:	00f4a023          	sw	a5,0(s1)
    8000721c:	00001097          	auipc	ra,0x1
    80007220:	a4c080e7          	jalr	-1460(ra) # 80007c68 <__printf>
    80007224:	0000006f          	j	80007224 <system_main+0xd4>

0000000080007228 <cpuid>:
    80007228:	ff010113          	addi	sp,sp,-16
    8000722c:	00813423          	sd	s0,8(sp)
    80007230:	01010413          	addi	s0,sp,16
    80007234:	00020513          	mv	a0,tp
    80007238:	00813403          	ld	s0,8(sp)
    8000723c:	0005051b          	sext.w	a0,a0
    80007240:	01010113          	addi	sp,sp,16
    80007244:	00008067          	ret

0000000080007248 <mycpu>:
    80007248:	ff010113          	addi	sp,sp,-16
    8000724c:	00813423          	sd	s0,8(sp)
    80007250:	01010413          	addi	s0,sp,16
    80007254:	00020793          	mv	a5,tp
    80007258:	00813403          	ld	s0,8(sp)
    8000725c:	0007879b          	sext.w	a5,a5
    80007260:	00779793          	slli	a5,a5,0x7
    80007264:	00007517          	auipc	a0,0x7
    80007268:	acc50513          	addi	a0,a0,-1332 # 8000dd30 <cpus>
    8000726c:	00f50533          	add	a0,a0,a5
    80007270:	01010113          	addi	sp,sp,16
    80007274:	00008067          	ret

0000000080007278 <userinit>:
    80007278:	ff010113          	addi	sp,sp,-16
    8000727c:	00813423          	sd	s0,8(sp)
    80007280:	01010413          	addi	s0,sp,16
    80007284:	00813403          	ld	s0,8(sp)
    80007288:	01010113          	addi	sp,sp,16
    8000728c:	ffffb317          	auipc	t1,0xffffb
    80007290:	bc830067          	jr	-1080(t1) # 80001e54 <main>

0000000080007294 <either_copyout>:
    80007294:	ff010113          	addi	sp,sp,-16
    80007298:	00813023          	sd	s0,0(sp)
    8000729c:	00113423          	sd	ra,8(sp)
    800072a0:	01010413          	addi	s0,sp,16
    800072a4:	02051663          	bnez	a0,800072d0 <either_copyout+0x3c>
    800072a8:	00058513          	mv	a0,a1
    800072ac:	00060593          	mv	a1,a2
    800072b0:	0006861b          	sext.w	a2,a3
    800072b4:	00002097          	auipc	ra,0x2
    800072b8:	c60080e7          	jalr	-928(ra) # 80008f14 <__memmove>
    800072bc:	00813083          	ld	ra,8(sp)
    800072c0:	00013403          	ld	s0,0(sp)
    800072c4:	00000513          	li	a0,0
    800072c8:	01010113          	addi	sp,sp,16
    800072cc:	00008067          	ret
    800072d0:	00003517          	auipc	a0,0x3
    800072d4:	45050513          	addi	a0,a0,1104 # 8000a720 <_ZZ9kPrintIntmE6digits+0x6b0>
    800072d8:	00001097          	auipc	ra,0x1
    800072dc:	934080e7          	jalr	-1740(ra) # 80007c0c <panic>

00000000800072e0 <either_copyin>:
    800072e0:	ff010113          	addi	sp,sp,-16
    800072e4:	00813023          	sd	s0,0(sp)
    800072e8:	00113423          	sd	ra,8(sp)
    800072ec:	01010413          	addi	s0,sp,16
    800072f0:	02059463          	bnez	a1,80007318 <either_copyin+0x38>
    800072f4:	00060593          	mv	a1,a2
    800072f8:	0006861b          	sext.w	a2,a3
    800072fc:	00002097          	auipc	ra,0x2
    80007300:	c18080e7          	jalr	-1000(ra) # 80008f14 <__memmove>
    80007304:	00813083          	ld	ra,8(sp)
    80007308:	00013403          	ld	s0,0(sp)
    8000730c:	00000513          	li	a0,0
    80007310:	01010113          	addi	sp,sp,16
    80007314:	00008067          	ret
    80007318:	00003517          	auipc	a0,0x3
    8000731c:	43050513          	addi	a0,a0,1072 # 8000a748 <_ZZ9kPrintIntmE6digits+0x6d8>
    80007320:	00001097          	auipc	ra,0x1
    80007324:	8ec080e7          	jalr	-1812(ra) # 80007c0c <panic>

0000000080007328 <trapinit>:
    80007328:	ff010113          	addi	sp,sp,-16
    8000732c:	00813423          	sd	s0,8(sp)
    80007330:	01010413          	addi	s0,sp,16
    80007334:	00813403          	ld	s0,8(sp)
    80007338:	00003597          	auipc	a1,0x3
    8000733c:	43858593          	addi	a1,a1,1080 # 8000a770 <_ZZ9kPrintIntmE6digits+0x700>
    80007340:	00007517          	auipc	a0,0x7
    80007344:	a7050513          	addi	a0,a0,-1424 # 8000ddb0 <tickslock>
    80007348:	01010113          	addi	sp,sp,16
    8000734c:	00001317          	auipc	t1,0x1
    80007350:	5cc30067          	jr	1484(t1) # 80008918 <initlock>

0000000080007354 <trapinithart>:
    80007354:	ff010113          	addi	sp,sp,-16
    80007358:	00813423          	sd	s0,8(sp)
    8000735c:	01010413          	addi	s0,sp,16
    80007360:	00000797          	auipc	a5,0x0
    80007364:	30078793          	addi	a5,a5,768 # 80007660 <kernelvec>
    80007368:	10579073          	csrw	stvec,a5
    8000736c:	00813403          	ld	s0,8(sp)
    80007370:	01010113          	addi	sp,sp,16
    80007374:	00008067          	ret

0000000080007378 <usertrap>:
    80007378:	ff010113          	addi	sp,sp,-16
    8000737c:	00813423          	sd	s0,8(sp)
    80007380:	01010413          	addi	s0,sp,16
    80007384:	00813403          	ld	s0,8(sp)
    80007388:	01010113          	addi	sp,sp,16
    8000738c:	00008067          	ret

0000000080007390 <usertrapret>:
    80007390:	ff010113          	addi	sp,sp,-16
    80007394:	00813423          	sd	s0,8(sp)
    80007398:	01010413          	addi	s0,sp,16
    8000739c:	00813403          	ld	s0,8(sp)
    800073a0:	01010113          	addi	sp,sp,16
    800073a4:	00008067          	ret

00000000800073a8 <kerneltrap>:
    800073a8:	fe010113          	addi	sp,sp,-32
    800073ac:	00813823          	sd	s0,16(sp)
    800073b0:	00113c23          	sd	ra,24(sp)
    800073b4:	00913423          	sd	s1,8(sp)
    800073b8:	02010413          	addi	s0,sp,32
    800073bc:	142025f3          	csrr	a1,scause
    800073c0:	100027f3          	csrr	a5,sstatus
    800073c4:	0027f793          	andi	a5,a5,2
    800073c8:	10079c63          	bnez	a5,800074e0 <kerneltrap+0x138>
    800073cc:	142027f3          	csrr	a5,scause
    800073d0:	0207ce63          	bltz	a5,8000740c <kerneltrap+0x64>
    800073d4:	00003517          	auipc	a0,0x3
    800073d8:	3e450513          	addi	a0,a0,996 # 8000a7b8 <_ZZ9kPrintIntmE6digits+0x748>
    800073dc:	00001097          	auipc	ra,0x1
    800073e0:	88c080e7          	jalr	-1908(ra) # 80007c68 <__printf>
    800073e4:	141025f3          	csrr	a1,sepc
    800073e8:	14302673          	csrr	a2,stval
    800073ec:	00003517          	auipc	a0,0x3
    800073f0:	3dc50513          	addi	a0,a0,988 # 8000a7c8 <_ZZ9kPrintIntmE6digits+0x758>
    800073f4:	00001097          	auipc	ra,0x1
    800073f8:	874080e7          	jalr	-1932(ra) # 80007c68 <__printf>
    800073fc:	00003517          	auipc	a0,0x3
    80007400:	3e450513          	addi	a0,a0,996 # 8000a7e0 <_ZZ9kPrintIntmE6digits+0x770>
    80007404:	00001097          	auipc	ra,0x1
    80007408:	808080e7          	jalr	-2040(ra) # 80007c0c <panic>
    8000740c:	0ff7f713          	andi	a4,a5,255
    80007410:	00900693          	li	a3,9
    80007414:	04d70063          	beq	a4,a3,80007454 <kerneltrap+0xac>
    80007418:	fff00713          	li	a4,-1
    8000741c:	03f71713          	slli	a4,a4,0x3f
    80007420:	00170713          	addi	a4,a4,1
    80007424:	fae798e3          	bne	a5,a4,800073d4 <kerneltrap+0x2c>
    80007428:	00000097          	auipc	ra,0x0
    8000742c:	e00080e7          	jalr	-512(ra) # 80007228 <cpuid>
    80007430:	06050663          	beqz	a0,8000749c <kerneltrap+0xf4>
    80007434:	144027f3          	csrr	a5,sip
    80007438:	ffd7f793          	andi	a5,a5,-3
    8000743c:	14479073          	csrw	sip,a5
    80007440:	01813083          	ld	ra,24(sp)
    80007444:	01013403          	ld	s0,16(sp)
    80007448:	00813483          	ld	s1,8(sp)
    8000744c:	02010113          	addi	sp,sp,32
    80007450:	00008067          	ret
    80007454:	00000097          	auipc	ra,0x0
    80007458:	3d0080e7          	jalr	976(ra) # 80007824 <plic_claim>
    8000745c:	00a00793          	li	a5,10
    80007460:	00050493          	mv	s1,a0
    80007464:	06f50863          	beq	a0,a5,800074d4 <kerneltrap+0x12c>
    80007468:	fc050ce3          	beqz	a0,80007440 <kerneltrap+0x98>
    8000746c:	00050593          	mv	a1,a0
    80007470:	00003517          	auipc	a0,0x3
    80007474:	32850513          	addi	a0,a0,808 # 8000a798 <_ZZ9kPrintIntmE6digits+0x728>
    80007478:	00000097          	auipc	ra,0x0
    8000747c:	7f0080e7          	jalr	2032(ra) # 80007c68 <__printf>
    80007480:	01013403          	ld	s0,16(sp)
    80007484:	01813083          	ld	ra,24(sp)
    80007488:	00048513          	mv	a0,s1
    8000748c:	00813483          	ld	s1,8(sp)
    80007490:	02010113          	addi	sp,sp,32
    80007494:	00000317          	auipc	t1,0x0
    80007498:	3c830067          	jr	968(t1) # 8000785c <plic_complete>
    8000749c:	00007517          	auipc	a0,0x7
    800074a0:	91450513          	addi	a0,a0,-1772 # 8000ddb0 <tickslock>
    800074a4:	00001097          	auipc	ra,0x1
    800074a8:	498080e7          	jalr	1176(ra) # 8000893c <acquire>
    800074ac:	00005717          	auipc	a4,0x5
    800074b0:	6a870713          	addi	a4,a4,1704 # 8000cb54 <ticks>
    800074b4:	00072783          	lw	a5,0(a4)
    800074b8:	00007517          	auipc	a0,0x7
    800074bc:	8f850513          	addi	a0,a0,-1800 # 8000ddb0 <tickslock>
    800074c0:	0017879b          	addiw	a5,a5,1
    800074c4:	00f72023          	sw	a5,0(a4)
    800074c8:	00001097          	auipc	ra,0x1
    800074cc:	540080e7          	jalr	1344(ra) # 80008a08 <release>
    800074d0:	f65ff06f          	j	80007434 <kerneltrap+0x8c>
    800074d4:	00001097          	auipc	ra,0x1
    800074d8:	09c080e7          	jalr	156(ra) # 80008570 <uartintr>
    800074dc:	fa5ff06f          	j	80007480 <kerneltrap+0xd8>
    800074e0:	00003517          	auipc	a0,0x3
    800074e4:	29850513          	addi	a0,a0,664 # 8000a778 <_ZZ9kPrintIntmE6digits+0x708>
    800074e8:	00000097          	auipc	ra,0x0
    800074ec:	724080e7          	jalr	1828(ra) # 80007c0c <panic>

00000000800074f0 <clockintr>:
    800074f0:	fe010113          	addi	sp,sp,-32
    800074f4:	00813823          	sd	s0,16(sp)
    800074f8:	00913423          	sd	s1,8(sp)
    800074fc:	00113c23          	sd	ra,24(sp)
    80007500:	02010413          	addi	s0,sp,32
    80007504:	00007497          	auipc	s1,0x7
    80007508:	8ac48493          	addi	s1,s1,-1876 # 8000ddb0 <tickslock>
    8000750c:	00048513          	mv	a0,s1
    80007510:	00001097          	auipc	ra,0x1
    80007514:	42c080e7          	jalr	1068(ra) # 8000893c <acquire>
    80007518:	00005717          	auipc	a4,0x5
    8000751c:	63c70713          	addi	a4,a4,1596 # 8000cb54 <ticks>
    80007520:	00072783          	lw	a5,0(a4)
    80007524:	01013403          	ld	s0,16(sp)
    80007528:	01813083          	ld	ra,24(sp)
    8000752c:	00048513          	mv	a0,s1
    80007530:	0017879b          	addiw	a5,a5,1
    80007534:	00813483          	ld	s1,8(sp)
    80007538:	00f72023          	sw	a5,0(a4)
    8000753c:	02010113          	addi	sp,sp,32
    80007540:	00001317          	auipc	t1,0x1
    80007544:	4c830067          	jr	1224(t1) # 80008a08 <release>

0000000080007548 <devintr>:
    80007548:	142027f3          	csrr	a5,scause
    8000754c:	00000513          	li	a0,0
    80007550:	0007c463          	bltz	a5,80007558 <devintr+0x10>
    80007554:	00008067          	ret
    80007558:	fe010113          	addi	sp,sp,-32
    8000755c:	00813823          	sd	s0,16(sp)
    80007560:	00113c23          	sd	ra,24(sp)
    80007564:	00913423          	sd	s1,8(sp)
    80007568:	02010413          	addi	s0,sp,32
    8000756c:	0ff7f713          	andi	a4,a5,255
    80007570:	00900693          	li	a3,9
    80007574:	04d70c63          	beq	a4,a3,800075cc <devintr+0x84>
    80007578:	fff00713          	li	a4,-1
    8000757c:	03f71713          	slli	a4,a4,0x3f
    80007580:	00170713          	addi	a4,a4,1
    80007584:	00e78c63          	beq	a5,a4,8000759c <devintr+0x54>
    80007588:	01813083          	ld	ra,24(sp)
    8000758c:	01013403          	ld	s0,16(sp)
    80007590:	00813483          	ld	s1,8(sp)
    80007594:	02010113          	addi	sp,sp,32
    80007598:	00008067          	ret
    8000759c:	00000097          	auipc	ra,0x0
    800075a0:	c8c080e7          	jalr	-884(ra) # 80007228 <cpuid>
    800075a4:	06050663          	beqz	a0,80007610 <devintr+0xc8>
    800075a8:	144027f3          	csrr	a5,sip
    800075ac:	ffd7f793          	andi	a5,a5,-3
    800075b0:	14479073          	csrw	sip,a5
    800075b4:	01813083          	ld	ra,24(sp)
    800075b8:	01013403          	ld	s0,16(sp)
    800075bc:	00813483          	ld	s1,8(sp)
    800075c0:	00200513          	li	a0,2
    800075c4:	02010113          	addi	sp,sp,32
    800075c8:	00008067          	ret
    800075cc:	00000097          	auipc	ra,0x0
    800075d0:	258080e7          	jalr	600(ra) # 80007824 <plic_claim>
    800075d4:	00a00793          	li	a5,10
    800075d8:	00050493          	mv	s1,a0
    800075dc:	06f50663          	beq	a0,a5,80007648 <devintr+0x100>
    800075e0:	00100513          	li	a0,1
    800075e4:	fa0482e3          	beqz	s1,80007588 <devintr+0x40>
    800075e8:	00048593          	mv	a1,s1
    800075ec:	00003517          	auipc	a0,0x3
    800075f0:	1ac50513          	addi	a0,a0,428 # 8000a798 <_ZZ9kPrintIntmE6digits+0x728>
    800075f4:	00000097          	auipc	ra,0x0
    800075f8:	674080e7          	jalr	1652(ra) # 80007c68 <__printf>
    800075fc:	00048513          	mv	a0,s1
    80007600:	00000097          	auipc	ra,0x0
    80007604:	25c080e7          	jalr	604(ra) # 8000785c <plic_complete>
    80007608:	00100513          	li	a0,1
    8000760c:	f7dff06f          	j	80007588 <devintr+0x40>
    80007610:	00006517          	auipc	a0,0x6
    80007614:	7a050513          	addi	a0,a0,1952 # 8000ddb0 <tickslock>
    80007618:	00001097          	auipc	ra,0x1
    8000761c:	324080e7          	jalr	804(ra) # 8000893c <acquire>
    80007620:	00005717          	auipc	a4,0x5
    80007624:	53470713          	addi	a4,a4,1332 # 8000cb54 <ticks>
    80007628:	00072783          	lw	a5,0(a4)
    8000762c:	00006517          	auipc	a0,0x6
    80007630:	78450513          	addi	a0,a0,1924 # 8000ddb0 <tickslock>
    80007634:	0017879b          	addiw	a5,a5,1
    80007638:	00f72023          	sw	a5,0(a4)
    8000763c:	00001097          	auipc	ra,0x1
    80007640:	3cc080e7          	jalr	972(ra) # 80008a08 <release>
    80007644:	f65ff06f          	j	800075a8 <devintr+0x60>
    80007648:	00001097          	auipc	ra,0x1
    8000764c:	f28080e7          	jalr	-216(ra) # 80008570 <uartintr>
    80007650:	fadff06f          	j	800075fc <devintr+0xb4>
	...

0000000080007660 <kernelvec>:
    80007660:	f0010113          	addi	sp,sp,-256
    80007664:	00113023          	sd	ra,0(sp)
    80007668:	00213423          	sd	sp,8(sp)
    8000766c:	00313823          	sd	gp,16(sp)
    80007670:	00413c23          	sd	tp,24(sp)
    80007674:	02513023          	sd	t0,32(sp)
    80007678:	02613423          	sd	t1,40(sp)
    8000767c:	02713823          	sd	t2,48(sp)
    80007680:	02813c23          	sd	s0,56(sp)
    80007684:	04913023          	sd	s1,64(sp)
    80007688:	04a13423          	sd	a0,72(sp)
    8000768c:	04b13823          	sd	a1,80(sp)
    80007690:	04c13c23          	sd	a2,88(sp)
    80007694:	06d13023          	sd	a3,96(sp)
    80007698:	06e13423          	sd	a4,104(sp)
    8000769c:	06f13823          	sd	a5,112(sp)
    800076a0:	07013c23          	sd	a6,120(sp)
    800076a4:	09113023          	sd	a7,128(sp)
    800076a8:	09213423          	sd	s2,136(sp)
    800076ac:	09313823          	sd	s3,144(sp)
    800076b0:	09413c23          	sd	s4,152(sp)
    800076b4:	0b513023          	sd	s5,160(sp)
    800076b8:	0b613423          	sd	s6,168(sp)
    800076bc:	0b713823          	sd	s7,176(sp)
    800076c0:	0b813c23          	sd	s8,184(sp)
    800076c4:	0d913023          	sd	s9,192(sp)
    800076c8:	0da13423          	sd	s10,200(sp)
    800076cc:	0db13823          	sd	s11,208(sp)
    800076d0:	0dc13c23          	sd	t3,216(sp)
    800076d4:	0fd13023          	sd	t4,224(sp)
    800076d8:	0fe13423          	sd	t5,232(sp)
    800076dc:	0ff13823          	sd	t6,240(sp)
    800076e0:	cc9ff0ef          	jal	ra,800073a8 <kerneltrap>
    800076e4:	00013083          	ld	ra,0(sp)
    800076e8:	00813103          	ld	sp,8(sp)
    800076ec:	01013183          	ld	gp,16(sp)
    800076f0:	02013283          	ld	t0,32(sp)
    800076f4:	02813303          	ld	t1,40(sp)
    800076f8:	03013383          	ld	t2,48(sp)
    800076fc:	03813403          	ld	s0,56(sp)
    80007700:	04013483          	ld	s1,64(sp)
    80007704:	04813503          	ld	a0,72(sp)
    80007708:	05013583          	ld	a1,80(sp)
    8000770c:	05813603          	ld	a2,88(sp)
    80007710:	06013683          	ld	a3,96(sp)
    80007714:	06813703          	ld	a4,104(sp)
    80007718:	07013783          	ld	a5,112(sp)
    8000771c:	07813803          	ld	a6,120(sp)
    80007720:	08013883          	ld	a7,128(sp)
    80007724:	08813903          	ld	s2,136(sp)
    80007728:	09013983          	ld	s3,144(sp)
    8000772c:	09813a03          	ld	s4,152(sp)
    80007730:	0a013a83          	ld	s5,160(sp)
    80007734:	0a813b03          	ld	s6,168(sp)
    80007738:	0b013b83          	ld	s7,176(sp)
    8000773c:	0b813c03          	ld	s8,184(sp)
    80007740:	0c013c83          	ld	s9,192(sp)
    80007744:	0c813d03          	ld	s10,200(sp)
    80007748:	0d013d83          	ld	s11,208(sp)
    8000774c:	0d813e03          	ld	t3,216(sp)
    80007750:	0e013e83          	ld	t4,224(sp)
    80007754:	0e813f03          	ld	t5,232(sp)
    80007758:	0f013f83          	ld	t6,240(sp)
    8000775c:	10010113          	addi	sp,sp,256
    80007760:	10200073          	sret
    80007764:	00000013          	nop
    80007768:	00000013          	nop
    8000776c:	00000013          	nop

0000000080007770 <timervec>:
    80007770:	34051573          	csrrw	a0,mscratch,a0
    80007774:	00b53023          	sd	a1,0(a0)
    80007778:	00c53423          	sd	a2,8(a0)
    8000777c:	00d53823          	sd	a3,16(a0)
    80007780:	01853583          	ld	a1,24(a0)
    80007784:	02053603          	ld	a2,32(a0)
    80007788:	0005b683          	ld	a3,0(a1)
    8000778c:	00c686b3          	add	a3,a3,a2
    80007790:	00d5b023          	sd	a3,0(a1)
    80007794:	00200593          	li	a1,2
    80007798:	14459073          	csrw	sip,a1
    8000779c:	01053683          	ld	a3,16(a0)
    800077a0:	00853603          	ld	a2,8(a0)
    800077a4:	00053583          	ld	a1,0(a0)
    800077a8:	34051573          	csrrw	a0,mscratch,a0
    800077ac:	30200073          	mret

00000000800077b0 <plicinit>:
    800077b0:	ff010113          	addi	sp,sp,-16
    800077b4:	00813423          	sd	s0,8(sp)
    800077b8:	01010413          	addi	s0,sp,16
    800077bc:	00813403          	ld	s0,8(sp)
    800077c0:	0c0007b7          	lui	a5,0xc000
    800077c4:	00100713          	li	a4,1
    800077c8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800077cc:	00e7a223          	sw	a4,4(a5)
    800077d0:	01010113          	addi	sp,sp,16
    800077d4:	00008067          	ret

00000000800077d8 <plicinithart>:
    800077d8:	ff010113          	addi	sp,sp,-16
    800077dc:	00813023          	sd	s0,0(sp)
    800077e0:	00113423          	sd	ra,8(sp)
    800077e4:	01010413          	addi	s0,sp,16
    800077e8:	00000097          	auipc	ra,0x0
    800077ec:	a40080e7          	jalr	-1472(ra) # 80007228 <cpuid>
    800077f0:	0085171b          	slliw	a4,a0,0x8
    800077f4:	0c0027b7          	lui	a5,0xc002
    800077f8:	00e787b3          	add	a5,a5,a4
    800077fc:	40200713          	li	a4,1026
    80007800:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80007804:	00813083          	ld	ra,8(sp)
    80007808:	00013403          	ld	s0,0(sp)
    8000780c:	00d5151b          	slliw	a0,a0,0xd
    80007810:	0c2017b7          	lui	a5,0xc201
    80007814:	00a78533          	add	a0,a5,a0
    80007818:	00052023          	sw	zero,0(a0)
    8000781c:	01010113          	addi	sp,sp,16
    80007820:	00008067          	ret

0000000080007824 <plic_claim>:
    80007824:	ff010113          	addi	sp,sp,-16
    80007828:	00813023          	sd	s0,0(sp)
    8000782c:	00113423          	sd	ra,8(sp)
    80007830:	01010413          	addi	s0,sp,16
    80007834:	00000097          	auipc	ra,0x0
    80007838:	9f4080e7          	jalr	-1548(ra) # 80007228 <cpuid>
    8000783c:	00813083          	ld	ra,8(sp)
    80007840:	00013403          	ld	s0,0(sp)
    80007844:	00d5151b          	slliw	a0,a0,0xd
    80007848:	0c2017b7          	lui	a5,0xc201
    8000784c:	00a78533          	add	a0,a5,a0
    80007850:	00452503          	lw	a0,4(a0)
    80007854:	01010113          	addi	sp,sp,16
    80007858:	00008067          	ret

000000008000785c <plic_complete>:
    8000785c:	fe010113          	addi	sp,sp,-32
    80007860:	00813823          	sd	s0,16(sp)
    80007864:	00913423          	sd	s1,8(sp)
    80007868:	00113c23          	sd	ra,24(sp)
    8000786c:	02010413          	addi	s0,sp,32
    80007870:	00050493          	mv	s1,a0
    80007874:	00000097          	auipc	ra,0x0
    80007878:	9b4080e7          	jalr	-1612(ra) # 80007228 <cpuid>
    8000787c:	01813083          	ld	ra,24(sp)
    80007880:	01013403          	ld	s0,16(sp)
    80007884:	00d5179b          	slliw	a5,a0,0xd
    80007888:	0c201737          	lui	a4,0xc201
    8000788c:	00f707b3          	add	a5,a4,a5
    80007890:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80007894:	00813483          	ld	s1,8(sp)
    80007898:	02010113          	addi	sp,sp,32
    8000789c:	00008067          	ret

00000000800078a0 <consolewrite>:
    800078a0:	fb010113          	addi	sp,sp,-80
    800078a4:	04813023          	sd	s0,64(sp)
    800078a8:	04113423          	sd	ra,72(sp)
    800078ac:	02913c23          	sd	s1,56(sp)
    800078b0:	03213823          	sd	s2,48(sp)
    800078b4:	03313423          	sd	s3,40(sp)
    800078b8:	03413023          	sd	s4,32(sp)
    800078bc:	01513c23          	sd	s5,24(sp)
    800078c0:	05010413          	addi	s0,sp,80
    800078c4:	06c05c63          	blez	a2,8000793c <consolewrite+0x9c>
    800078c8:	00060993          	mv	s3,a2
    800078cc:	00050a13          	mv	s4,a0
    800078d0:	00058493          	mv	s1,a1
    800078d4:	00000913          	li	s2,0
    800078d8:	fff00a93          	li	s5,-1
    800078dc:	01c0006f          	j	800078f8 <consolewrite+0x58>
    800078e0:	fbf44503          	lbu	a0,-65(s0)
    800078e4:	0019091b          	addiw	s2,s2,1
    800078e8:	00148493          	addi	s1,s1,1
    800078ec:	00001097          	auipc	ra,0x1
    800078f0:	a9c080e7          	jalr	-1380(ra) # 80008388 <uartputc>
    800078f4:	03298063          	beq	s3,s2,80007914 <consolewrite+0x74>
    800078f8:	00048613          	mv	a2,s1
    800078fc:	00100693          	li	a3,1
    80007900:	000a0593          	mv	a1,s4
    80007904:	fbf40513          	addi	a0,s0,-65
    80007908:	00000097          	auipc	ra,0x0
    8000790c:	9d8080e7          	jalr	-1576(ra) # 800072e0 <either_copyin>
    80007910:	fd5518e3          	bne	a0,s5,800078e0 <consolewrite+0x40>
    80007914:	04813083          	ld	ra,72(sp)
    80007918:	04013403          	ld	s0,64(sp)
    8000791c:	03813483          	ld	s1,56(sp)
    80007920:	02813983          	ld	s3,40(sp)
    80007924:	02013a03          	ld	s4,32(sp)
    80007928:	01813a83          	ld	s5,24(sp)
    8000792c:	00090513          	mv	a0,s2
    80007930:	03013903          	ld	s2,48(sp)
    80007934:	05010113          	addi	sp,sp,80
    80007938:	00008067          	ret
    8000793c:	00000913          	li	s2,0
    80007940:	fd5ff06f          	j	80007914 <consolewrite+0x74>

0000000080007944 <consoleread>:
    80007944:	f9010113          	addi	sp,sp,-112
    80007948:	06813023          	sd	s0,96(sp)
    8000794c:	04913c23          	sd	s1,88(sp)
    80007950:	05213823          	sd	s2,80(sp)
    80007954:	05313423          	sd	s3,72(sp)
    80007958:	05413023          	sd	s4,64(sp)
    8000795c:	03513c23          	sd	s5,56(sp)
    80007960:	03613823          	sd	s6,48(sp)
    80007964:	03713423          	sd	s7,40(sp)
    80007968:	03813023          	sd	s8,32(sp)
    8000796c:	06113423          	sd	ra,104(sp)
    80007970:	01913c23          	sd	s9,24(sp)
    80007974:	07010413          	addi	s0,sp,112
    80007978:	00060b93          	mv	s7,a2
    8000797c:	00050913          	mv	s2,a0
    80007980:	00058c13          	mv	s8,a1
    80007984:	00060b1b          	sext.w	s6,a2
    80007988:	00006497          	auipc	s1,0x6
    8000798c:	45048493          	addi	s1,s1,1104 # 8000ddd8 <cons>
    80007990:	00400993          	li	s3,4
    80007994:	fff00a13          	li	s4,-1
    80007998:	00a00a93          	li	s5,10
    8000799c:	05705e63          	blez	s7,800079f8 <consoleread+0xb4>
    800079a0:	09c4a703          	lw	a4,156(s1)
    800079a4:	0984a783          	lw	a5,152(s1)
    800079a8:	0007071b          	sext.w	a4,a4
    800079ac:	08e78463          	beq	a5,a4,80007a34 <consoleread+0xf0>
    800079b0:	07f7f713          	andi	a4,a5,127
    800079b4:	00e48733          	add	a4,s1,a4
    800079b8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800079bc:	0017869b          	addiw	a3,a5,1
    800079c0:	08d4ac23          	sw	a3,152(s1)
    800079c4:	00070c9b          	sext.w	s9,a4
    800079c8:	0b370663          	beq	a4,s3,80007a74 <consoleread+0x130>
    800079cc:	00100693          	li	a3,1
    800079d0:	f9f40613          	addi	a2,s0,-97
    800079d4:	000c0593          	mv	a1,s8
    800079d8:	00090513          	mv	a0,s2
    800079dc:	f8e40fa3          	sb	a4,-97(s0)
    800079e0:	00000097          	auipc	ra,0x0
    800079e4:	8b4080e7          	jalr	-1868(ra) # 80007294 <either_copyout>
    800079e8:	01450863          	beq	a0,s4,800079f8 <consoleread+0xb4>
    800079ec:	001c0c13          	addi	s8,s8,1
    800079f0:	fffb8b9b          	addiw	s7,s7,-1
    800079f4:	fb5c94e3          	bne	s9,s5,8000799c <consoleread+0x58>
    800079f8:	000b851b          	sext.w	a0,s7
    800079fc:	06813083          	ld	ra,104(sp)
    80007a00:	06013403          	ld	s0,96(sp)
    80007a04:	05813483          	ld	s1,88(sp)
    80007a08:	05013903          	ld	s2,80(sp)
    80007a0c:	04813983          	ld	s3,72(sp)
    80007a10:	04013a03          	ld	s4,64(sp)
    80007a14:	03813a83          	ld	s5,56(sp)
    80007a18:	02813b83          	ld	s7,40(sp)
    80007a1c:	02013c03          	ld	s8,32(sp)
    80007a20:	01813c83          	ld	s9,24(sp)
    80007a24:	40ab053b          	subw	a0,s6,a0
    80007a28:	03013b03          	ld	s6,48(sp)
    80007a2c:	07010113          	addi	sp,sp,112
    80007a30:	00008067          	ret
    80007a34:	00001097          	auipc	ra,0x1
    80007a38:	1d8080e7          	jalr	472(ra) # 80008c0c <push_on>
    80007a3c:	0984a703          	lw	a4,152(s1)
    80007a40:	09c4a783          	lw	a5,156(s1)
    80007a44:	0007879b          	sext.w	a5,a5
    80007a48:	fef70ce3          	beq	a4,a5,80007a40 <consoleread+0xfc>
    80007a4c:	00001097          	auipc	ra,0x1
    80007a50:	234080e7          	jalr	564(ra) # 80008c80 <pop_on>
    80007a54:	0984a783          	lw	a5,152(s1)
    80007a58:	07f7f713          	andi	a4,a5,127
    80007a5c:	00e48733          	add	a4,s1,a4
    80007a60:	01874703          	lbu	a4,24(a4)
    80007a64:	0017869b          	addiw	a3,a5,1
    80007a68:	08d4ac23          	sw	a3,152(s1)
    80007a6c:	00070c9b          	sext.w	s9,a4
    80007a70:	f5371ee3          	bne	a4,s3,800079cc <consoleread+0x88>
    80007a74:	000b851b          	sext.w	a0,s7
    80007a78:	f96bf2e3          	bgeu	s7,s6,800079fc <consoleread+0xb8>
    80007a7c:	08f4ac23          	sw	a5,152(s1)
    80007a80:	f7dff06f          	j	800079fc <consoleread+0xb8>

0000000080007a84 <consputc>:
    80007a84:	10000793          	li	a5,256
    80007a88:	00f50663          	beq	a0,a5,80007a94 <consputc+0x10>
    80007a8c:	00001317          	auipc	t1,0x1
    80007a90:	9f430067          	jr	-1548(t1) # 80008480 <uartputc_sync>
    80007a94:	ff010113          	addi	sp,sp,-16
    80007a98:	00113423          	sd	ra,8(sp)
    80007a9c:	00813023          	sd	s0,0(sp)
    80007aa0:	01010413          	addi	s0,sp,16
    80007aa4:	00800513          	li	a0,8
    80007aa8:	00001097          	auipc	ra,0x1
    80007aac:	9d8080e7          	jalr	-1576(ra) # 80008480 <uartputc_sync>
    80007ab0:	02000513          	li	a0,32
    80007ab4:	00001097          	auipc	ra,0x1
    80007ab8:	9cc080e7          	jalr	-1588(ra) # 80008480 <uartputc_sync>
    80007abc:	00013403          	ld	s0,0(sp)
    80007ac0:	00813083          	ld	ra,8(sp)
    80007ac4:	00800513          	li	a0,8
    80007ac8:	01010113          	addi	sp,sp,16
    80007acc:	00001317          	auipc	t1,0x1
    80007ad0:	9b430067          	jr	-1612(t1) # 80008480 <uartputc_sync>

0000000080007ad4 <consoleintr>:
    80007ad4:	fe010113          	addi	sp,sp,-32
    80007ad8:	00813823          	sd	s0,16(sp)
    80007adc:	00913423          	sd	s1,8(sp)
    80007ae0:	01213023          	sd	s2,0(sp)
    80007ae4:	00113c23          	sd	ra,24(sp)
    80007ae8:	02010413          	addi	s0,sp,32
    80007aec:	00006917          	auipc	s2,0x6
    80007af0:	2ec90913          	addi	s2,s2,748 # 8000ddd8 <cons>
    80007af4:	00050493          	mv	s1,a0
    80007af8:	00090513          	mv	a0,s2
    80007afc:	00001097          	auipc	ra,0x1
    80007b00:	e40080e7          	jalr	-448(ra) # 8000893c <acquire>
    80007b04:	02048c63          	beqz	s1,80007b3c <consoleintr+0x68>
    80007b08:	0a092783          	lw	a5,160(s2)
    80007b0c:	09892703          	lw	a4,152(s2)
    80007b10:	07f00693          	li	a3,127
    80007b14:	40e7873b          	subw	a4,a5,a4
    80007b18:	02e6e263          	bltu	a3,a4,80007b3c <consoleintr+0x68>
    80007b1c:	00d00713          	li	a4,13
    80007b20:	04e48063          	beq	s1,a4,80007b60 <consoleintr+0x8c>
    80007b24:	07f7f713          	andi	a4,a5,127
    80007b28:	00e90733          	add	a4,s2,a4
    80007b2c:	0017879b          	addiw	a5,a5,1
    80007b30:	0af92023          	sw	a5,160(s2)
    80007b34:	00970c23          	sb	s1,24(a4)
    80007b38:	08f92e23          	sw	a5,156(s2)
    80007b3c:	01013403          	ld	s0,16(sp)
    80007b40:	01813083          	ld	ra,24(sp)
    80007b44:	00813483          	ld	s1,8(sp)
    80007b48:	00013903          	ld	s2,0(sp)
    80007b4c:	00006517          	auipc	a0,0x6
    80007b50:	28c50513          	addi	a0,a0,652 # 8000ddd8 <cons>
    80007b54:	02010113          	addi	sp,sp,32
    80007b58:	00001317          	auipc	t1,0x1
    80007b5c:	eb030067          	jr	-336(t1) # 80008a08 <release>
    80007b60:	00a00493          	li	s1,10
    80007b64:	fc1ff06f          	j	80007b24 <consoleintr+0x50>

0000000080007b68 <consoleinit>:
    80007b68:	fe010113          	addi	sp,sp,-32
    80007b6c:	00113c23          	sd	ra,24(sp)
    80007b70:	00813823          	sd	s0,16(sp)
    80007b74:	00913423          	sd	s1,8(sp)
    80007b78:	02010413          	addi	s0,sp,32
    80007b7c:	00006497          	auipc	s1,0x6
    80007b80:	25c48493          	addi	s1,s1,604 # 8000ddd8 <cons>
    80007b84:	00048513          	mv	a0,s1
    80007b88:	00003597          	auipc	a1,0x3
    80007b8c:	c6858593          	addi	a1,a1,-920 # 8000a7f0 <_ZZ9kPrintIntmE6digits+0x780>
    80007b90:	00001097          	auipc	ra,0x1
    80007b94:	d88080e7          	jalr	-632(ra) # 80008918 <initlock>
    80007b98:	00000097          	auipc	ra,0x0
    80007b9c:	7ac080e7          	jalr	1964(ra) # 80008344 <uartinit>
    80007ba0:	01813083          	ld	ra,24(sp)
    80007ba4:	01013403          	ld	s0,16(sp)
    80007ba8:	00000797          	auipc	a5,0x0
    80007bac:	d9c78793          	addi	a5,a5,-612 # 80007944 <consoleread>
    80007bb0:	0af4bc23          	sd	a5,184(s1)
    80007bb4:	00000797          	auipc	a5,0x0
    80007bb8:	cec78793          	addi	a5,a5,-788 # 800078a0 <consolewrite>
    80007bbc:	0cf4b023          	sd	a5,192(s1)
    80007bc0:	00813483          	ld	s1,8(sp)
    80007bc4:	02010113          	addi	sp,sp,32
    80007bc8:	00008067          	ret

0000000080007bcc <console_read>:
    80007bcc:	ff010113          	addi	sp,sp,-16
    80007bd0:	00813423          	sd	s0,8(sp)
    80007bd4:	01010413          	addi	s0,sp,16
    80007bd8:	00813403          	ld	s0,8(sp)
    80007bdc:	00006317          	auipc	t1,0x6
    80007be0:	2b433303          	ld	t1,692(t1) # 8000de90 <devsw+0x10>
    80007be4:	01010113          	addi	sp,sp,16
    80007be8:	00030067          	jr	t1

0000000080007bec <console_write>:
    80007bec:	ff010113          	addi	sp,sp,-16
    80007bf0:	00813423          	sd	s0,8(sp)
    80007bf4:	01010413          	addi	s0,sp,16
    80007bf8:	00813403          	ld	s0,8(sp)
    80007bfc:	00006317          	auipc	t1,0x6
    80007c00:	29c33303          	ld	t1,668(t1) # 8000de98 <devsw+0x18>
    80007c04:	01010113          	addi	sp,sp,16
    80007c08:	00030067          	jr	t1

0000000080007c0c <panic>:
    80007c0c:	fe010113          	addi	sp,sp,-32
    80007c10:	00113c23          	sd	ra,24(sp)
    80007c14:	00813823          	sd	s0,16(sp)
    80007c18:	00913423          	sd	s1,8(sp)
    80007c1c:	02010413          	addi	s0,sp,32
    80007c20:	00050493          	mv	s1,a0
    80007c24:	00003517          	auipc	a0,0x3
    80007c28:	bd450513          	addi	a0,a0,-1068 # 8000a7f8 <_ZZ9kPrintIntmE6digits+0x788>
    80007c2c:	00006797          	auipc	a5,0x6
    80007c30:	3007a623          	sw	zero,780(a5) # 8000df38 <pr+0x18>
    80007c34:	00000097          	auipc	ra,0x0
    80007c38:	034080e7          	jalr	52(ra) # 80007c68 <__printf>
    80007c3c:	00048513          	mv	a0,s1
    80007c40:	00000097          	auipc	ra,0x0
    80007c44:	028080e7          	jalr	40(ra) # 80007c68 <__printf>
    80007c48:	00003517          	auipc	a0,0x3
    80007c4c:	93850513          	addi	a0,a0,-1736 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80007c50:	00000097          	auipc	ra,0x0
    80007c54:	018080e7          	jalr	24(ra) # 80007c68 <__printf>
    80007c58:	00100793          	li	a5,1
    80007c5c:	00005717          	auipc	a4,0x5
    80007c60:	eef72e23          	sw	a5,-260(a4) # 8000cb58 <panicked>
    80007c64:	0000006f          	j	80007c64 <panic+0x58>

0000000080007c68 <__printf>:
    80007c68:	f3010113          	addi	sp,sp,-208
    80007c6c:	08813023          	sd	s0,128(sp)
    80007c70:	07313423          	sd	s3,104(sp)
    80007c74:	09010413          	addi	s0,sp,144
    80007c78:	05813023          	sd	s8,64(sp)
    80007c7c:	08113423          	sd	ra,136(sp)
    80007c80:	06913c23          	sd	s1,120(sp)
    80007c84:	07213823          	sd	s2,112(sp)
    80007c88:	07413023          	sd	s4,96(sp)
    80007c8c:	05513c23          	sd	s5,88(sp)
    80007c90:	05613823          	sd	s6,80(sp)
    80007c94:	05713423          	sd	s7,72(sp)
    80007c98:	03913c23          	sd	s9,56(sp)
    80007c9c:	03a13823          	sd	s10,48(sp)
    80007ca0:	03b13423          	sd	s11,40(sp)
    80007ca4:	00006317          	auipc	t1,0x6
    80007ca8:	27c30313          	addi	t1,t1,636 # 8000df20 <pr>
    80007cac:	01832c03          	lw	s8,24(t1)
    80007cb0:	00b43423          	sd	a1,8(s0)
    80007cb4:	00c43823          	sd	a2,16(s0)
    80007cb8:	00d43c23          	sd	a3,24(s0)
    80007cbc:	02e43023          	sd	a4,32(s0)
    80007cc0:	02f43423          	sd	a5,40(s0)
    80007cc4:	03043823          	sd	a6,48(s0)
    80007cc8:	03143c23          	sd	a7,56(s0)
    80007ccc:	00050993          	mv	s3,a0
    80007cd0:	4a0c1663          	bnez	s8,8000817c <__printf+0x514>
    80007cd4:	60098c63          	beqz	s3,800082ec <__printf+0x684>
    80007cd8:	0009c503          	lbu	a0,0(s3)
    80007cdc:	00840793          	addi	a5,s0,8
    80007ce0:	f6f43c23          	sd	a5,-136(s0)
    80007ce4:	00000493          	li	s1,0
    80007ce8:	22050063          	beqz	a0,80007f08 <__printf+0x2a0>
    80007cec:	00002a37          	lui	s4,0x2
    80007cf0:	00018ab7          	lui	s5,0x18
    80007cf4:	000f4b37          	lui	s6,0xf4
    80007cf8:	00989bb7          	lui	s7,0x989
    80007cfc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80007d00:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80007d04:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80007d08:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80007d0c:	00148c9b          	addiw	s9,s1,1
    80007d10:	02500793          	li	a5,37
    80007d14:	01998933          	add	s2,s3,s9
    80007d18:	38f51263          	bne	a0,a5,8000809c <__printf+0x434>
    80007d1c:	00094783          	lbu	a5,0(s2)
    80007d20:	00078c9b          	sext.w	s9,a5
    80007d24:	1e078263          	beqz	a5,80007f08 <__printf+0x2a0>
    80007d28:	0024849b          	addiw	s1,s1,2
    80007d2c:	07000713          	li	a4,112
    80007d30:	00998933          	add	s2,s3,s1
    80007d34:	38e78a63          	beq	a5,a4,800080c8 <__printf+0x460>
    80007d38:	20f76863          	bltu	a4,a5,80007f48 <__printf+0x2e0>
    80007d3c:	42a78863          	beq	a5,a0,8000816c <__printf+0x504>
    80007d40:	06400713          	li	a4,100
    80007d44:	40e79663          	bne	a5,a4,80008150 <__printf+0x4e8>
    80007d48:	f7843783          	ld	a5,-136(s0)
    80007d4c:	0007a603          	lw	a2,0(a5)
    80007d50:	00878793          	addi	a5,a5,8
    80007d54:	f6f43c23          	sd	a5,-136(s0)
    80007d58:	42064a63          	bltz	a2,8000818c <__printf+0x524>
    80007d5c:	00a00713          	li	a4,10
    80007d60:	02e677bb          	remuw	a5,a2,a4
    80007d64:	00003d97          	auipc	s11,0x3
    80007d68:	abcd8d93          	addi	s11,s11,-1348 # 8000a820 <digits>
    80007d6c:	00900593          	li	a1,9
    80007d70:	0006051b          	sext.w	a0,a2
    80007d74:	00000c93          	li	s9,0
    80007d78:	02079793          	slli	a5,a5,0x20
    80007d7c:	0207d793          	srli	a5,a5,0x20
    80007d80:	00fd87b3          	add	a5,s11,a5
    80007d84:	0007c783          	lbu	a5,0(a5)
    80007d88:	02e656bb          	divuw	a3,a2,a4
    80007d8c:	f8f40023          	sb	a5,-128(s0)
    80007d90:	14c5d863          	bge	a1,a2,80007ee0 <__printf+0x278>
    80007d94:	06300593          	li	a1,99
    80007d98:	00100c93          	li	s9,1
    80007d9c:	02e6f7bb          	remuw	a5,a3,a4
    80007da0:	02079793          	slli	a5,a5,0x20
    80007da4:	0207d793          	srli	a5,a5,0x20
    80007da8:	00fd87b3          	add	a5,s11,a5
    80007dac:	0007c783          	lbu	a5,0(a5)
    80007db0:	02e6d73b          	divuw	a4,a3,a4
    80007db4:	f8f400a3          	sb	a5,-127(s0)
    80007db8:	12a5f463          	bgeu	a1,a0,80007ee0 <__printf+0x278>
    80007dbc:	00a00693          	li	a3,10
    80007dc0:	00900593          	li	a1,9
    80007dc4:	02d777bb          	remuw	a5,a4,a3
    80007dc8:	02079793          	slli	a5,a5,0x20
    80007dcc:	0207d793          	srli	a5,a5,0x20
    80007dd0:	00fd87b3          	add	a5,s11,a5
    80007dd4:	0007c503          	lbu	a0,0(a5)
    80007dd8:	02d757bb          	divuw	a5,a4,a3
    80007ddc:	f8a40123          	sb	a0,-126(s0)
    80007de0:	48e5f263          	bgeu	a1,a4,80008264 <__printf+0x5fc>
    80007de4:	06300513          	li	a0,99
    80007de8:	02d7f5bb          	remuw	a1,a5,a3
    80007dec:	02059593          	slli	a1,a1,0x20
    80007df0:	0205d593          	srli	a1,a1,0x20
    80007df4:	00bd85b3          	add	a1,s11,a1
    80007df8:	0005c583          	lbu	a1,0(a1)
    80007dfc:	02d7d7bb          	divuw	a5,a5,a3
    80007e00:	f8b401a3          	sb	a1,-125(s0)
    80007e04:	48e57263          	bgeu	a0,a4,80008288 <__printf+0x620>
    80007e08:	3e700513          	li	a0,999
    80007e0c:	02d7f5bb          	remuw	a1,a5,a3
    80007e10:	02059593          	slli	a1,a1,0x20
    80007e14:	0205d593          	srli	a1,a1,0x20
    80007e18:	00bd85b3          	add	a1,s11,a1
    80007e1c:	0005c583          	lbu	a1,0(a1)
    80007e20:	02d7d7bb          	divuw	a5,a5,a3
    80007e24:	f8b40223          	sb	a1,-124(s0)
    80007e28:	46e57663          	bgeu	a0,a4,80008294 <__printf+0x62c>
    80007e2c:	02d7f5bb          	remuw	a1,a5,a3
    80007e30:	02059593          	slli	a1,a1,0x20
    80007e34:	0205d593          	srli	a1,a1,0x20
    80007e38:	00bd85b3          	add	a1,s11,a1
    80007e3c:	0005c583          	lbu	a1,0(a1)
    80007e40:	02d7d7bb          	divuw	a5,a5,a3
    80007e44:	f8b402a3          	sb	a1,-123(s0)
    80007e48:	46ea7863          	bgeu	s4,a4,800082b8 <__printf+0x650>
    80007e4c:	02d7f5bb          	remuw	a1,a5,a3
    80007e50:	02059593          	slli	a1,a1,0x20
    80007e54:	0205d593          	srli	a1,a1,0x20
    80007e58:	00bd85b3          	add	a1,s11,a1
    80007e5c:	0005c583          	lbu	a1,0(a1)
    80007e60:	02d7d7bb          	divuw	a5,a5,a3
    80007e64:	f8b40323          	sb	a1,-122(s0)
    80007e68:	3eeaf863          	bgeu	s5,a4,80008258 <__printf+0x5f0>
    80007e6c:	02d7f5bb          	remuw	a1,a5,a3
    80007e70:	02059593          	slli	a1,a1,0x20
    80007e74:	0205d593          	srli	a1,a1,0x20
    80007e78:	00bd85b3          	add	a1,s11,a1
    80007e7c:	0005c583          	lbu	a1,0(a1)
    80007e80:	02d7d7bb          	divuw	a5,a5,a3
    80007e84:	f8b403a3          	sb	a1,-121(s0)
    80007e88:	42eb7e63          	bgeu	s6,a4,800082c4 <__printf+0x65c>
    80007e8c:	02d7f5bb          	remuw	a1,a5,a3
    80007e90:	02059593          	slli	a1,a1,0x20
    80007e94:	0205d593          	srli	a1,a1,0x20
    80007e98:	00bd85b3          	add	a1,s11,a1
    80007e9c:	0005c583          	lbu	a1,0(a1)
    80007ea0:	02d7d7bb          	divuw	a5,a5,a3
    80007ea4:	f8b40423          	sb	a1,-120(s0)
    80007ea8:	42ebfc63          	bgeu	s7,a4,800082e0 <__printf+0x678>
    80007eac:	02079793          	slli	a5,a5,0x20
    80007eb0:	0207d793          	srli	a5,a5,0x20
    80007eb4:	00fd8db3          	add	s11,s11,a5
    80007eb8:	000dc703          	lbu	a4,0(s11)
    80007ebc:	00a00793          	li	a5,10
    80007ec0:	00900c93          	li	s9,9
    80007ec4:	f8e404a3          	sb	a4,-119(s0)
    80007ec8:	00065c63          	bgez	a2,80007ee0 <__printf+0x278>
    80007ecc:	f9040713          	addi	a4,s0,-112
    80007ed0:	00f70733          	add	a4,a4,a5
    80007ed4:	02d00693          	li	a3,45
    80007ed8:	fed70823          	sb	a3,-16(a4)
    80007edc:	00078c93          	mv	s9,a5
    80007ee0:	f8040793          	addi	a5,s0,-128
    80007ee4:	01978cb3          	add	s9,a5,s9
    80007ee8:	f7f40d13          	addi	s10,s0,-129
    80007eec:	000cc503          	lbu	a0,0(s9)
    80007ef0:	fffc8c93          	addi	s9,s9,-1
    80007ef4:	00000097          	auipc	ra,0x0
    80007ef8:	b90080e7          	jalr	-1136(ra) # 80007a84 <consputc>
    80007efc:	ffac98e3          	bne	s9,s10,80007eec <__printf+0x284>
    80007f00:	00094503          	lbu	a0,0(s2)
    80007f04:	e00514e3          	bnez	a0,80007d0c <__printf+0xa4>
    80007f08:	1a0c1663          	bnez	s8,800080b4 <__printf+0x44c>
    80007f0c:	08813083          	ld	ra,136(sp)
    80007f10:	08013403          	ld	s0,128(sp)
    80007f14:	07813483          	ld	s1,120(sp)
    80007f18:	07013903          	ld	s2,112(sp)
    80007f1c:	06813983          	ld	s3,104(sp)
    80007f20:	06013a03          	ld	s4,96(sp)
    80007f24:	05813a83          	ld	s5,88(sp)
    80007f28:	05013b03          	ld	s6,80(sp)
    80007f2c:	04813b83          	ld	s7,72(sp)
    80007f30:	04013c03          	ld	s8,64(sp)
    80007f34:	03813c83          	ld	s9,56(sp)
    80007f38:	03013d03          	ld	s10,48(sp)
    80007f3c:	02813d83          	ld	s11,40(sp)
    80007f40:	0d010113          	addi	sp,sp,208
    80007f44:	00008067          	ret
    80007f48:	07300713          	li	a4,115
    80007f4c:	1ce78a63          	beq	a5,a4,80008120 <__printf+0x4b8>
    80007f50:	07800713          	li	a4,120
    80007f54:	1ee79e63          	bne	a5,a4,80008150 <__printf+0x4e8>
    80007f58:	f7843783          	ld	a5,-136(s0)
    80007f5c:	0007a703          	lw	a4,0(a5)
    80007f60:	00878793          	addi	a5,a5,8
    80007f64:	f6f43c23          	sd	a5,-136(s0)
    80007f68:	28074263          	bltz	a4,800081ec <__printf+0x584>
    80007f6c:	00003d97          	auipc	s11,0x3
    80007f70:	8b4d8d93          	addi	s11,s11,-1868 # 8000a820 <digits>
    80007f74:	00f77793          	andi	a5,a4,15
    80007f78:	00fd87b3          	add	a5,s11,a5
    80007f7c:	0007c683          	lbu	a3,0(a5)
    80007f80:	00f00613          	li	a2,15
    80007f84:	0007079b          	sext.w	a5,a4
    80007f88:	f8d40023          	sb	a3,-128(s0)
    80007f8c:	0047559b          	srliw	a1,a4,0x4
    80007f90:	0047569b          	srliw	a3,a4,0x4
    80007f94:	00000c93          	li	s9,0
    80007f98:	0ee65063          	bge	a2,a4,80008078 <__printf+0x410>
    80007f9c:	00f6f693          	andi	a3,a3,15
    80007fa0:	00dd86b3          	add	a3,s11,a3
    80007fa4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80007fa8:	0087d79b          	srliw	a5,a5,0x8
    80007fac:	00100c93          	li	s9,1
    80007fb0:	f8d400a3          	sb	a3,-127(s0)
    80007fb4:	0cb67263          	bgeu	a2,a1,80008078 <__printf+0x410>
    80007fb8:	00f7f693          	andi	a3,a5,15
    80007fbc:	00dd86b3          	add	a3,s11,a3
    80007fc0:	0006c583          	lbu	a1,0(a3)
    80007fc4:	00f00613          	li	a2,15
    80007fc8:	0047d69b          	srliw	a3,a5,0x4
    80007fcc:	f8b40123          	sb	a1,-126(s0)
    80007fd0:	0047d593          	srli	a1,a5,0x4
    80007fd4:	28f67e63          	bgeu	a2,a5,80008270 <__printf+0x608>
    80007fd8:	00f6f693          	andi	a3,a3,15
    80007fdc:	00dd86b3          	add	a3,s11,a3
    80007fe0:	0006c503          	lbu	a0,0(a3)
    80007fe4:	0087d813          	srli	a6,a5,0x8
    80007fe8:	0087d69b          	srliw	a3,a5,0x8
    80007fec:	f8a401a3          	sb	a0,-125(s0)
    80007ff0:	28b67663          	bgeu	a2,a1,8000827c <__printf+0x614>
    80007ff4:	00f6f693          	andi	a3,a3,15
    80007ff8:	00dd86b3          	add	a3,s11,a3
    80007ffc:	0006c583          	lbu	a1,0(a3)
    80008000:	00c7d513          	srli	a0,a5,0xc
    80008004:	00c7d69b          	srliw	a3,a5,0xc
    80008008:	f8b40223          	sb	a1,-124(s0)
    8000800c:	29067a63          	bgeu	a2,a6,800082a0 <__printf+0x638>
    80008010:	00f6f693          	andi	a3,a3,15
    80008014:	00dd86b3          	add	a3,s11,a3
    80008018:	0006c583          	lbu	a1,0(a3)
    8000801c:	0107d813          	srli	a6,a5,0x10
    80008020:	0107d69b          	srliw	a3,a5,0x10
    80008024:	f8b402a3          	sb	a1,-123(s0)
    80008028:	28a67263          	bgeu	a2,a0,800082ac <__printf+0x644>
    8000802c:	00f6f693          	andi	a3,a3,15
    80008030:	00dd86b3          	add	a3,s11,a3
    80008034:	0006c683          	lbu	a3,0(a3)
    80008038:	0147d79b          	srliw	a5,a5,0x14
    8000803c:	f8d40323          	sb	a3,-122(s0)
    80008040:	21067663          	bgeu	a2,a6,8000824c <__printf+0x5e4>
    80008044:	02079793          	slli	a5,a5,0x20
    80008048:	0207d793          	srli	a5,a5,0x20
    8000804c:	00fd8db3          	add	s11,s11,a5
    80008050:	000dc683          	lbu	a3,0(s11)
    80008054:	00800793          	li	a5,8
    80008058:	00700c93          	li	s9,7
    8000805c:	f8d403a3          	sb	a3,-121(s0)
    80008060:	00075c63          	bgez	a4,80008078 <__printf+0x410>
    80008064:	f9040713          	addi	a4,s0,-112
    80008068:	00f70733          	add	a4,a4,a5
    8000806c:	02d00693          	li	a3,45
    80008070:	fed70823          	sb	a3,-16(a4)
    80008074:	00078c93          	mv	s9,a5
    80008078:	f8040793          	addi	a5,s0,-128
    8000807c:	01978cb3          	add	s9,a5,s9
    80008080:	f7f40d13          	addi	s10,s0,-129
    80008084:	000cc503          	lbu	a0,0(s9)
    80008088:	fffc8c93          	addi	s9,s9,-1
    8000808c:	00000097          	auipc	ra,0x0
    80008090:	9f8080e7          	jalr	-1544(ra) # 80007a84 <consputc>
    80008094:	ff9d18e3          	bne	s10,s9,80008084 <__printf+0x41c>
    80008098:	0100006f          	j	800080a8 <__printf+0x440>
    8000809c:	00000097          	auipc	ra,0x0
    800080a0:	9e8080e7          	jalr	-1560(ra) # 80007a84 <consputc>
    800080a4:	000c8493          	mv	s1,s9
    800080a8:	00094503          	lbu	a0,0(s2)
    800080ac:	c60510e3          	bnez	a0,80007d0c <__printf+0xa4>
    800080b0:	e40c0ee3          	beqz	s8,80007f0c <__printf+0x2a4>
    800080b4:	00006517          	auipc	a0,0x6
    800080b8:	e6c50513          	addi	a0,a0,-404 # 8000df20 <pr>
    800080bc:	00001097          	auipc	ra,0x1
    800080c0:	94c080e7          	jalr	-1716(ra) # 80008a08 <release>
    800080c4:	e49ff06f          	j	80007f0c <__printf+0x2a4>
    800080c8:	f7843783          	ld	a5,-136(s0)
    800080cc:	03000513          	li	a0,48
    800080d0:	01000d13          	li	s10,16
    800080d4:	00878713          	addi	a4,a5,8
    800080d8:	0007bc83          	ld	s9,0(a5)
    800080dc:	f6e43c23          	sd	a4,-136(s0)
    800080e0:	00000097          	auipc	ra,0x0
    800080e4:	9a4080e7          	jalr	-1628(ra) # 80007a84 <consputc>
    800080e8:	07800513          	li	a0,120
    800080ec:	00000097          	auipc	ra,0x0
    800080f0:	998080e7          	jalr	-1640(ra) # 80007a84 <consputc>
    800080f4:	00002d97          	auipc	s11,0x2
    800080f8:	72cd8d93          	addi	s11,s11,1836 # 8000a820 <digits>
    800080fc:	03ccd793          	srli	a5,s9,0x3c
    80008100:	00fd87b3          	add	a5,s11,a5
    80008104:	0007c503          	lbu	a0,0(a5)
    80008108:	fffd0d1b          	addiw	s10,s10,-1
    8000810c:	004c9c93          	slli	s9,s9,0x4
    80008110:	00000097          	auipc	ra,0x0
    80008114:	974080e7          	jalr	-1676(ra) # 80007a84 <consputc>
    80008118:	fe0d12e3          	bnez	s10,800080fc <__printf+0x494>
    8000811c:	f8dff06f          	j	800080a8 <__printf+0x440>
    80008120:	f7843783          	ld	a5,-136(s0)
    80008124:	0007bc83          	ld	s9,0(a5)
    80008128:	00878793          	addi	a5,a5,8
    8000812c:	f6f43c23          	sd	a5,-136(s0)
    80008130:	000c9a63          	bnez	s9,80008144 <__printf+0x4dc>
    80008134:	1080006f          	j	8000823c <__printf+0x5d4>
    80008138:	001c8c93          	addi	s9,s9,1
    8000813c:	00000097          	auipc	ra,0x0
    80008140:	948080e7          	jalr	-1720(ra) # 80007a84 <consputc>
    80008144:	000cc503          	lbu	a0,0(s9)
    80008148:	fe0518e3          	bnez	a0,80008138 <__printf+0x4d0>
    8000814c:	f5dff06f          	j	800080a8 <__printf+0x440>
    80008150:	02500513          	li	a0,37
    80008154:	00000097          	auipc	ra,0x0
    80008158:	930080e7          	jalr	-1744(ra) # 80007a84 <consputc>
    8000815c:	000c8513          	mv	a0,s9
    80008160:	00000097          	auipc	ra,0x0
    80008164:	924080e7          	jalr	-1756(ra) # 80007a84 <consputc>
    80008168:	f41ff06f          	j	800080a8 <__printf+0x440>
    8000816c:	02500513          	li	a0,37
    80008170:	00000097          	auipc	ra,0x0
    80008174:	914080e7          	jalr	-1772(ra) # 80007a84 <consputc>
    80008178:	f31ff06f          	j	800080a8 <__printf+0x440>
    8000817c:	00030513          	mv	a0,t1
    80008180:	00000097          	auipc	ra,0x0
    80008184:	7bc080e7          	jalr	1980(ra) # 8000893c <acquire>
    80008188:	b4dff06f          	j	80007cd4 <__printf+0x6c>
    8000818c:	40c0053b          	negw	a0,a2
    80008190:	00a00713          	li	a4,10
    80008194:	02e576bb          	remuw	a3,a0,a4
    80008198:	00002d97          	auipc	s11,0x2
    8000819c:	688d8d93          	addi	s11,s11,1672 # 8000a820 <digits>
    800081a0:	ff700593          	li	a1,-9
    800081a4:	02069693          	slli	a3,a3,0x20
    800081a8:	0206d693          	srli	a3,a3,0x20
    800081ac:	00dd86b3          	add	a3,s11,a3
    800081b0:	0006c683          	lbu	a3,0(a3)
    800081b4:	02e557bb          	divuw	a5,a0,a4
    800081b8:	f8d40023          	sb	a3,-128(s0)
    800081bc:	10b65e63          	bge	a2,a1,800082d8 <__printf+0x670>
    800081c0:	06300593          	li	a1,99
    800081c4:	02e7f6bb          	remuw	a3,a5,a4
    800081c8:	02069693          	slli	a3,a3,0x20
    800081cc:	0206d693          	srli	a3,a3,0x20
    800081d0:	00dd86b3          	add	a3,s11,a3
    800081d4:	0006c683          	lbu	a3,0(a3)
    800081d8:	02e7d73b          	divuw	a4,a5,a4
    800081dc:	00200793          	li	a5,2
    800081e0:	f8d400a3          	sb	a3,-127(s0)
    800081e4:	bca5ece3          	bltu	a1,a0,80007dbc <__printf+0x154>
    800081e8:	ce5ff06f          	j	80007ecc <__printf+0x264>
    800081ec:	40e007bb          	negw	a5,a4
    800081f0:	00002d97          	auipc	s11,0x2
    800081f4:	630d8d93          	addi	s11,s11,1584 # 8000a820 <digits>
    800081f8:	00f7f693          	andi	a3,a5,15
    800081fc:	00dd86b3          	add	a3,s11,a3
    80008200:	0006c583          	lbu	a1,0(a3)
    80008204:	ff100613          	li	a2,-15
    80008208:	0047d69b          	srliw	a3,a5,0x4
    8000820c:	f8b40023          	sb	a1,-128(s0)
    80008210:	0047d59b          	srliw	a1,a5,0x4
    80008214:	0ac75e63          	bge	a4,a2,800082d0 <__printf+0x668>
    80008218:	00f6f693          	andi	a3,a3,15
    8000821c:	00dd86b3          	add	a3,s11,a3
    80008220:	0006c603          	lbu	a2,0(a3)
    80008224:	00f00693          	li	a3,15
    80008228:	0087d79b          	srliw	a5,a5,0x8
    8000822c:	f8c400a3          	sb	a2,-127(s0)
    80008230:	d8b6e4e3          	bltu	a3,a1,80007fb8 <__printf+0x350>
    80008234:	00200793          	li	a5,2
    80008238:	e2dff06f          	j	80008064 <__printf+0x3fc>
    8000823c:	00002c97          	auipc	s9,0x2
    80008240:	5c4c8c93          	addi	s9,s9,1476 # 8000a800 <_ZZ9kPrintIntmE6digits+0x790>
    80008244:	02800513          	li	a0,40
    80008248:	ef1ff06f          	j	80008138 <__printf+0x4d0>
    8000824c:	00700793          	li	a5,7
    80008250:	00600c93          	li	s9,6
    80008254:	e0dff06f          	j	80008060 <__printf+0x3f8>
    80008258:	00700793          	li	a5,7
    8000825c:	00600c93          	li	s9,6
    80008260:	c69ff06f          	j	80007ec8 <__printf+0x260>
    80008264:	00300793          	li	a5,3
    80008268:	00200c93          	li	s9,2
    8000826c:	c5dff06f          	j	80007ec8 <__printf+0x260>
    80008270:	00300793          	li	a5,3
    80008274:	00200c93          	li	s9,2
    80008278:	de9ff06f          	j	80008060 <__printf+0x3f8>
    8000827c:	00400793          	li	a5,4
    80008280:	00300c93          	li	s9,3
    80008284:	dddff06f          	j	80008060 <__printf+0x3f8>
    80008288:	00400793          	li	a5,4
    8000828c:	00300c93          	li	s9,3
    80008290:	c39ff06f          	j	80007ec8 <__printf+0x260>
    80008294:	00500793          	li	a5,5
    80008298:	00400c93          	li	s9,4
    8000829c:	c2dff06f          	j	80007ec8 <__printf+0x260>
    800082a0:	00500793          	li	a5,5
    800082a4:	00400c93          	li	s9,4
    800082a8:	db9ff06f          	j	80008060 <__printf+0x3f8>
    800082ac:	00600793          	li	a5,6
    800082b0:	00500c93          	li	s9,5
    800082b4:	dadff06f          	j	80008060 <__printf+0x3f8>
    800082b8:	00600793          	li	a5,6
    800082bc:	00500c93          	li	s9,5
    800082c0:	c09ff06f          	j	80007ec8 <__printf+0x260>
    800082c4:	00800793          	li	a5,8
    800082c8:	00700c93          	li	s9,7
    800082cc:	bfdff06f          	j	80007ec8 <__printf+0x260>
    800082d0:	00100793          	li	a5,1
    800082d4:	d91ff06f          	j	80008064 <__printf+0x3fc>
    800082d8:	00100793          	li	a5,1
    800082dc:	bf1ff06f          	j	80007ecc <__printf+0x264>
    800082e0:	00900793          	li	a5,9
    800082e4:	00800c93          	li	s9,8
    800082e8:	be1ff06f          	j	80007ec8 <__printf+0x260>
    800082ec:	00002517          	auipc	a0,0x2
    800082f0:	51c50513          	addi	a0,a0,1308 # 8000a808 <_ZZ9kPrintIntmE6digits+0x798>
    800082f4:	00000097          	auipc	ra,0x0
    800082f8:	918080e7          	jalr	-1768(ra) # 80007c0c <panic>

00000000800082fc <printfinit>:
    800082fc:	fe010113          	addi	sp,sp,-32
    80008300:	00813823          	sd	s0,16(sp)
    80008304:	00913423          	sd	s1,8(sp)
    80008308:	00113c23          	sd	ra,24(sp)
    8000830c:	02010413          	addi	s0,sp,32
    80008310:	00006497          	auipc	s1,0x6
    80008314:	c1048493          	addi	s1,s1,-1008 # 8000df20 <pr>
    80008318:	00048513          	mv	a0,s1
    8000831c:	00002597          	auipc	a1,0x2
    80008320:	4fc58593          	addi	a1,a1,1276 # 8000a818 <_ZZ9kPrintIntmE6digits+0x7a8>
    80008324:	00000097          	auipc	ra,0x0
    80008328:	5f4080e7          	jalr	1524(ra) # 80008918 <initlock>
    8000832c:	01813083          	ld	ra,24(sp)
    80008330:	01013403          	ld	s0,16(sp)
    80008334:	0004ac23          	sw	zero,24(s1)
    80008338:	00813483          	ld	s1,8(sp)
    8000833c:	02010113          	addi	sp,sp,32
    80008340:	00008067          	ret

0000000080008344 <uartinit>:
    80008344:	ff010113          	addi	sp,sp,-16
    80008348:	00813423          	sd	s0,8(sp)
    8000834c:	01010413          	addi	s0,sp,16
    80008350:	100007b7          	lui	a5,0x10000
    80008354:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80008358:	f8000713          	li	a4,-128
    8000835c:	00e781a3          	sb	a4,3(a5)
    80008360:	00300713          	li	a4,3
    80008364:	00e78023          	sb	a4,0(a5)
    80008368:	000780a3          	sb	zero,1(a5)
    8000836c:	00e781a3          	sb	a4,3(a5)
    80008370:	00700693          	li	a3,7
    80008374:	00d78123          	sb	a3,2(a5)
    80008378:	00e780a3          	sb	a4,1(a5)
    8000837c:	00813403          	ld	s0,8(sp)
    80008380:	01010113          	addi	sp,sp,16
    80008384:	00008067          	ret

0000000080008388 <uartputc>:
    80008388:	00004797          	auipc	a5,0x4
    8000838c:	7d07a783          	lw	a5,2000(a5) # 8000cb58 <panicked>
    80008390:	00078463          	beqz	a5,80008398 <uartputc+0x10>
    80008394:	0000006f          	j	80008394 <uartputc+0xc>
    80008398:	fd010113          	addi	sp,sp,-48
    8000839c:	02813023          	sd	s0,32(sp)
    800083a0:	00913c23          	sd	s1,24(sp)
    800083a4:	01213823          	sd	s2,16(sp)
    800083a8:	01313423          	sd	s3,8(sp)
    800083ac:	02113423          	sd	ra,40(sp)
    800083b0:	03010413          	addi	s0,sp,48
    800083b4:	00004917          	auipc	s2,0x4
    800083b8:	7ac90913          	addi	s2,s2,1964 # 8000cb60 <uart_tx_r>
    800083bc:	00093783          	ld	a5,0(s2)
    800083c0:	00004497          	auipc	s1,0x4
    800083c4:	7a848493          	addi	s1,s1,1960 # 8000cb68 <uart_tx_w>
    800083c8:	0004b703          	ld	a4,0(s1)
    800083cc:	02078693          	addi	a3,a5,32
    800083d0:	00050993          	mv	s3,a0
    800083d4:	02e69c63          	bne	a3,a4,8000840c <uartputc+0x84>
    800083d8:	00001097          	auipc	ra,0x1
    800083dc:	834080e7          	jalr	-1996(ra) # 80008c0c <push_on>
    800083e0:	00093783          	ld	a5,0(s2)
    800083e4:	0004b703          	ld	a4,0(s1)
    800083e8:	02078793          	addi	a5,a5,32
    800083ec:	00e79463          	bne	a5,a4,800083f4 <uartputc+0x6c>
    800083f0:	0000006f          	j	800083f0 <uartputc+0x68>
    800083f4:	00001097          	auipc	ra,0x1
    800083f8:	88c080e7          	jalr	-1908(ra) # 80008c80 <pop_on>
    800083fc:	00093783          	ld	a5,0(s2)
    80008400:	0004b703          	ld	a4,0(s1)
    80008404:	02078693          	addi	a3,a5,32
    80008408:	fce688e3          	beq	a3,a4,800083d8 <uartputc+0x50>
    8000840c:	01f77693          	andi	a3,a4,31
    80008410:	00006597          	auipc	a1,0x6
    80008414:	b3058593          	addi	a1,a1,-1232 # 8000df40 <uart_tx_buf>
    80008418:	00d586b3          	add	a3,a1,a3
    8000841c:	00170713          	addi	a4,a4,1
    80008420:	01368023          	sb	s3,0(a3)
    80008424:	00e4b023          	sd	a4,0(s1)
    80008428:	10000637          	lui	a2,0x10000
    8000842c:	02f71063          	bne	a4,a5,8000844c <uartputc+0xc4>
    80008430:	0340006f          	j	80008464 <uartputc+0xdc>
    80008434:	00074703          	lbu	a4,0(a4)
    80008438:	00f93023          	sd	a5,0(s2)
    8000843c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80008440:	00093783          	ld	a5,0(s2)
    80008444:	0004b703          	ld	a4,0(s1)
    80008448:	00f70e63          	beq	a4,a5,80008464 <uartputc+0xdc>
    8000844c:	00564683          	lbu	a3,5(a2)
    80008450:	01f7f713          	andi	a4,a5,31
    80008454:	00e58733          	add	a4,a1,a4
    80008458:	0206f693          	andi	a3,a3,32
    8000845c:	00178793          	addi	a5,a5,1
    80008460:	fc069ae3          	bnez	a3,80008434 <uartputc+0xac>
    80008464:	02813083          	ld	ra,40(sp)
    80008468:	02013403          	ld	s0,32(sp)
    8000846c:	01813483          	ld	s1,24(sp)
    80008470:	01013903          	ld	s2,16(sp)
    80008474:	00813983          	ld	s3,8(sp)
    80008478:	03010113          	addi	sp,sp,48
    8000847c:	00008067          	ret

0000000080008480 <uartputc_sync>:
    80008480:	ff010113          	addi	sp,sp,-16
    80008484:	00813423          	sd	s0,8(sp)
    80008488:	01010413          	addi	s0,sp,16
    8000848c:	00004717          	auipc	a4,0x4
    80008490:	6cc72703          	lw	a4,1740(a4) # 8000cb58 <panicked>
    80008494:	02071663          	bnez	a4,800084c0 <uartputc_sync+0x40>
    80008498:	00050793          	mv	a5,a0
    8000849c:	100006b7          	lui	a3,0x10000
    800084a0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800084a4:	02077713          	andi	a4,a4,32
    800084a8:	fe070ce3          	beqz	a4,800084a0 <uartputc_sync+0x20>
    800084ac:	0ff7f793          	andi	a5,a5,255
    800084b0:	00f68023          	sb	a5,0(a3)
    800084b4:	00813403          	ld	s0,8(sp)
    800084b8:	01010113          	addi	sp,sp,16
    800084bc:	00008067          	ret
    800084c0:	0000006f          	j	800084c0 <uartputc_sync+0x40>

00000000800084c4 <uartstart>:
    800084c4:	ff010113          	addi	sp,sp,-16
    800084c8:	00813423          	sd	s0,8(sp)
    800084cc:	01010413          	addi	s0,sp,16
    800084d0:	00004617          	auipc	a2,0x4
    800084d4:	69060613          	addi	a2,a2,1680 # 8000cb60 <uart_tx_r>
    800084d8:	00004517          	auipc	a0,0x4
    800084dc:	69050513          	addi	a0,a0,1680 # 8000cb68 <uart_tx_w>
    800084e0:	00063783          	ld	a5,0(a2)
    800084e4:	00053703          	ld	a4,0(a0)
    800084e8:	04f70263          	beq	a4,a5,8000852c <uartstart+0x68>
    800084ec:	100005b7          	lui	a1,0x10000
    800084f0:	00006817          	auipc	a6,0x6
    800084f4:	a5080813          	addi	a6,a6,-1456 # 8000df40 <uart_tx_buf>
    800084f8:	01c0006f          	j	80008514 <uartstart+0x50>
    800084fc:	0006c703          	lbu	a4,0(a3)
    80008500:	00f63023          	sd	a5,0(a2)
    80008504:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80008508:	00063783          	ld	a5,0(a2)
    8000850c:	00053703          	ld	a4,0(a0)
    80008510:	00f70e63          	beq	a4,a5,8000852c <uartstart+0x68>
    80008514:	01f7f713          	andi	a4,a5,31
    80008518:	00e806b3          	add	a3,a6,a4
    8000851c:	0055c703          	lbu	a4,5(a1)
    80008520:	00178793          	addi	a5,a5,1
    80008524:	02077713          	andi	a4,a4,32
    80008528:	fc071ae3          	bnez	a4,800084fc <uartstart+0x38>
    8000852c:	00813403          	ld	s0,8(sp)
    80008530:	01010113          	addi	sp,sp,16
    80008534:	00008067          	ret

0000000080008538 <uartgetc>:
    80008538:	ff010113          	addi	sp,sp,-16
    8000853c:	00813423          	sd	s0,8(sp)
    80008540:	01010413          	addi	s0,sp,16
    80008544:	10000737          	lui	a4,0x10000
    80008548:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000854c:	0017f793          	andi	a5,a5,1
    80008550:	00078c63          	beqz	a5,80008568 <uartgetc+0x30>
    80008554:	00074503          	lbu	a0,0(a4)
    80008558:	0ff57513          	andi	a0,a0,255
    8000855c:	00813403          	ld	s0,8(sp)
    80008560:	01010113          	addi	sp,sp,16
    80008564:	00008067          	ret
    80008568:	fff00513          	li	a0,-1
    8000856c:	ff1ff06f          	j	8000855c <uartgetc+0x24>

0000000080008570 <uartintr>:
    80008570:	100007b7          	lui	a5,0x10000
    80008574:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80008578:	0017f793          	andi	a5,a5,1
    8000857c:	0a078463          	beqz	a5,80008624 <uartintr+0xb4>
    80008580:	fe010113          	addi	sp,sp,-32
    80008584:	00813823          	sd	s0,16(sp)
    80008588:	00913423          	sd	s1,8(sp)
    8000858c:	00113c23          	sd	ra,24(sp)
    80008590:	02010413          	addi	s0,sp,32
    80008594:	100004b7          	lui	s1,0x10000
    80008598:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000859c:	0ff57513          	andi	a0,a0,255
    800085a0:	fffff097          	auipc	ra,0xfffff
    800085a4:	534080e7          	jalr	1332(ra) # 80007ad4 <consoleintr>
    800085a8:	0054c783          	lbu	a5,5(s1)
    800085ac:	0017f793          	andi	a5,a5,1
    800085b0:	fe0794e3          	bnez	a5,80008598 <uartintr+0x28>
    800085b4:	00004617          	auipc	a2,0x4
    800085b8:	5ac60613          	addi	a2,a2,1452 # 8000cb60 <uart_tx_r>
    800085bc:	00004517          	auipc	a0,0x4
    800085c0:	5ac50513          	addi	a0,a0,1452 # 8000cb68 <uart_tx_w>
    800085c4:	00063783          	ld	a5,0(a2)
    800085c8:	00053703          	ld	a4,0(a0)
    800085cc:	04f70263          	beq	a4,a5,80008610 <uartintr+0xa0>
    800085d0:	100005b7          	lui	a1,0x10000
    800085d4:	00006817          	auipc	a6,0x6
    800085d8:	96c80813          	addi	a6,a6,-1684 # 8000df40 <uart_tx_buf>
    800085dc:	01c0006f          	j	800085f8 <uartintr+0x88>
    800085e0:	0006c703          	lbu	a4,0(a3)
    800085e4:	00f63023          	sd	a5,0(a2)
    800085e8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800085ec:	00063783          	ld	a5,0(a2)
    800085f0:	00053703          	ld	a4,0(a0)
    800085f4:	00f70e63          	beq	a4,a5,80008610 <uartintr+0xa0>
    800085f8:	01f7f713          	andi	a4,a5,31
    800085fc:	00e806b3          	add	a3,a6,a4
    80008600:	0055c703          	lbu	a4,5(a1)
    80008604:	00178793          	addi	a5,a5,1
    80008608:	02077713          	andi	a4,a4,32
    8000860c:	fc071ae3          	bnez	a4,800085e0 <uartintr+0x70>
    80008610:	01813083          	ld	ra,24(sp)
    80008614:	01013403          	ld	s0,16(sp)
    80008618:	00813483          	ld	s1,8(sp)
    8000861c:	02010113          	addi	sp,sp,32
    80008620:	00008067          	ret
    80008624:	00004617          	auipc	a2,0x4
    80008628:	53c60613          	addi	a2,a2,1340 # 8000cb60 <uart_tx_r>
    8000862c:	00004517          	auipc	a0,0x4
    80008630:	53c50513          	addi	a0,a0,1340 # 8000cb68 <uart_tx_w>
    80008634:	00063783          	ld	a5,0(a2)
    80008638:	00053703          	ld	a4,0(a0)
    8000863c:	04f70263          	beq	a4,a5,80008680 <uartintr+0x110>
    80008640:	100005b7          	lui	a1,0x10000
    80008644:	00006817          	auipc	a6,0x6
    80008648:	8fc80813          	addi	a6,a6,-1796 # 8000df40 <uart_tx_buf>
    8000864c:	01c0006f          	j	80008668 <uartintr+0xf8>
    80008650:	0006c703          	lbu	a4,0(a3)
    80008654:	00f63023          	sd	a5,0(a2)
    80008658:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000865c:	00063783          	ld	a5,0(a2)
    80008660:	00053703          	ld	a4,0(a0)
    80008664:	02f70063          	beq	a4,a5,80008684 <uartintr+0x114>
    80008668:	01f7f713          	andi	a4,a5,31
    8000866c:	00e806b3          	add	a3,a6,a4
    80008670:	0055c703          	lbu	a4,5(a1)
    80008674:	00178793          	addi	a5,a5,1
    80008678:	02077713          	andi	a4,a4,32
    8000867c:	fc071ae3          	bnez	a4,80008650 <uartintr+0xe0>
    80008680:	00008067          	ret
    80008684:	00008067          	ret

0000000080008688 <kinit>:
    80008688:	fc010113          	addi	sp,sp,-64
    8000868c:	02913423          	sd	s1,40(sp)
    80008690:	fffff7b7          	lui	a5,0xfffff
    80008694:	00007497          	auipc	s1,0x7
    80008698:	8cb48493          	addi	s1,s1,-1845 # 8000ef5f <end+0xfff>
    8000869c:	02813823          	sd	s0,48(sp)
    800086a0:	01313c23          	sd	s3,24(sp)
    800086a4:	00f4f4b3          	and	s1,s1,a5
    800086a8:	02113c23          	sd	ra,56(sp)
    800086ac:	03213023          	sd	s2,32(sp)
    800086b0:	01413823          	sd	s4,16(sp)
    800086b4:	01513423          	sd	s5,8(sp)
    800086b8:	04010413          	addi	s0,sp,64
    800086bc:	000017b7          	lui	a5,0x1
    800086c0:	01100993          	li	s3,17
    800086c4:	00f487b3          	add	a5,s1,a5
    800086c8:	01b99993          	slli	s3,s3,0x1b
    800086cc:	06f9e063          	bltu	s3,a5,8000872c <kinit+0xa4>
    800086d0:	00006a97          	auipc	s5,0x6
    800086d4:	890a8a93          	addi	s5,s5,-1904 # 8000df60 <end>
    800086d8:	0754ec63          	bltu	s1,s5,80008750 <kinit+0xc8>
    800086dc:	0734fa63          	bgeu	s1,s3,80008750 <kinit+0xc8>
    800086e0:	00088a37          	lui	s4,0x88
    800086e4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800086e8:	00004917          	auipc	s2,0x4
    800086ec:	48890913          	addi	s2,s2,1160 # 8000cb70 <kmem>
    800086f0:	00ca1a13          	slli	s4,s4,0xc
    800086f4:	0140006f          	j	80008708 <kinit+0x80>
    800086f8:	000017b7          	lui	a5,0x1
    800086fc:	00f484b3          	add	s1,s1,a5
    80008700:	0554e863          	bltu	s1,s5,80008750 <kinit+0xc8>
    80008704:	0534f663          	bgeu	s1,s3,80008750 <kinit+0xc8>
    80008708:	00001637          	lui	a2,0x1
    8000870c:	00100593          	li	a1,1
    80008710:	00048513          	mv	a0,s1
    80008714:	00000097          	auipc	ra,0x0
    80008718:	5e4080e7          	jalr	1508(ra) # 80008cf8 <__memset>
    8000871c:	00093783          	ld	a5,0(s2)
    80008720:	00f4b023          	sd	a5,0(s1)
    80008724:	00993023          	sd	s1,0(s2)
    80008728:	fd4498e3          	bne	s1,s4,800086f8 <kinit+0x70>
    8000872c:	03813083          	ld	ra,56(sp)
    80008730:	03013403          	ld	s0,48(sp)
    80008734:	02813483          	ld	s1,40(sp)
    80008738:	02013903          	ld	s2,32(sp)
    8000873c:	01813983          	ld	s3,24(sp)
    80008740:	01013a03          	ld	s4,16(sp)
    80008744:	00813a83          	ld	s5,8(sp)
    80008748:	04010113          	addi	sp,sp,64
    8000874c:	00008067          	ret
    80008750:	00002517          	auipc	a0,0x2
    80008754:	0e850513          	addi	a0,a0,232 # 8000a838 <digits+0x18>
    80008758:	fffff097          	auipc	ra,0xfffff
    8000875c:	4b4080e7          	jalr	1204(ra) # 80007c0c <panic>

0000000080008760 <freerange>:
    80008760:	fc010113          	addi	sp,sp,-64
    80008764:	000017b7          	lui	a5,0x1
    80008768:	02913423          	sd	s1,40(sp)
    8000876c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80008770:	009504b3          	add	s1,a0,s1
    80008774:	fffff537          	lui	a0,0xfffff
    80008778:	02813823          	sd	s0,48(sp)
    8000877c:	02113c23          	sd	ra,56(sp)
    80008780:	03213023          	sd	s2,32(sp)
    80008784:	01313c23          	sd	s3,24(sp)
    80008788:	01413823          	sd	s4,16(sp)
    8000878c:	01513423          	sd	s5,8(sp)
    80008790:	01613023          	sd	s6,0(sp)
    80008794:	04010413          	addi	s0,sp,64
    80008798:	00a4f4b3          	and	s1,s1,a0
    8000879c:	00f487b3          	add	a5,s1,a5
    800087a0:	06f5e463          	bltu	a1,a5,80008808 <freerange+0xa8>
    800087a4:	00005a97          	auipc	s5,0x5
    800087a8:	7bca8a93          	addi	s5,s5,1980 # 8000df60 <end>
    800087ac:	0954e263          	bltu	s1,s5,80008830 <freerange+0xd0>
    800087b0:	01100993          	li	s3,17
    800087b4:	01b99993          	slli	s3,s3,0x1b
    800087b8:	0734fc63          	bgeu	s1,s3,80008830 <freerange+0xd0>
    800087bc:	00058a13          	mv	s4,a1
    800087c0:	00004917          	auipc	s2,0x4
    800087c4:	3b090913          	addi	s2,s2,944 # 8000cb70 <kmem>
    800087c8:	00002b37          	lui	s6,0x2
    800087cc:	0140006f          	j	800087e0 <freerange+0x80>
    800087d0:	000017b7          	lui	a5,0x1
    800087d4:	00f484b3          	add	s1,s1,a5
    800087d8:	0554ec63          	bltu	s1,s5,80008830 <freerange+0xd0>
    800087dc:	0534fa63          	bgeu	s1,s3,80008830 <freerange+0xd0>
    800087e0:	00001637          	lui	a2,0x1
    800087e4:	00100593          	li	a1,1
    800087e8:	00048513          	mv	a0,s1
    800087ec:	00000097          	auipc	ra,0x0
    800087f0:	50c080e7          	jalr	1292(ra) # 80008cf8 <__memset>
    800087f4:	00093703          	ld	a4,0(s2)
    800087f8:	016487b3          	add	a5,s1,s6
    800087fc:	00e4b023          	sd	a4,0(s1)
    80008800:	00993023          	sd	s1,0(s2)
    80008804:	fcfa76e3          	bgeu	s4,a5,800087d0 <freerange+0x70>
    80008808:	03813083          	ld	ra,56(sp)
    8000880c:	03013403          	ld	s0,48(sp)
    80008810:	02813483          	ld	s1,40(sp)
    80008814:	02013903          	ld	s2,32(sp)
    80008818:	01813983          	ld	s3,24(sp)
    8000881c:	01013a03          	ld	s4,16(sp)
    80008820:	00813a83          	ld	s5,8(sp)
    80008824:	00013b03          	ld	s6,0(sp)
    80008828:	04010113          	addi	sp,sp,64
    8000882c:	00008067          	ret
    80008830:	00002517          	auipc	a0,0x2
    80008834:	00850513          	addi	a0,a0,8 # 8000a838 <digits+0x18>
    80008838:	fffff097          	auipc	ra,0xfffff
    8000883c:	3d4080e7          	jalr	980(ra) # 80007c0c <panic>

0000000080008840 <kfree>:
    80008840:	fe010113          	addi	sp,sp,-32
    80008844:	00813823          	sd	s0,16(sp)
    80008848:	00113c23          	sd	ra,24(sp)
    8000884c:	00913423          	sd	s1,8(sp)
    80008850:	02010413          	addi	s0,sp,32
    80008854:	03451793          	slli	a5,a0,0x34
    80008858:	04079c63          	bnez	a5,800088b0 <kfree+0x70>
    8000885c:	00005797          	auipc	a5,0x5
    80008860:	70478793          	addi	a5,a5,1796 # 8000df60 <end>
    80008864:	00050493          	mv	s1,a0
    80008868:	04f56463          	bltu	a0,a5,800088b0 <kfree+0x70>
    8000886c:	01100793          	li	a5,17
    80008870:	01b79793          	slli	a5,a5,0x1b
    80008874:	02f57e63          	bgeu	a0,a5,800088b0 <kfree+0x70>
    80008878:	00001637          	lui	a2,0x1
    8000887c:	00100593          	li	a1,1
    80008880:	00000097          	auipc	ra,0x0
    80008884:	478080e7          	jalr	1144(ra) # 80008cf8 <__memset>
    80008888:	00004797          	auipc	a5,0x4
    8000888c:	2e878793          	addi	a5,a5,744 # 8000cb70 <kmem>
    80008890:	0007b703          	ld	a4,0(a5)
    80008894:	01813083          	ld	ra,24(sp)
    80008898:	01013403          	ld	s0,16(sp)
    8000889c:	00e4b023          	sd	a4,0(s1)
    800088a0:	0097b023          	sd	s1,0(a5)
    800088a4:	00813483          	ld	s1,8(sp)
    800088a8:	02010113          	addi	sp,sp,32
    800088ac:	00008067          	ret
    800088b0:	00002517          	auipc	a0,0x2
    800088b4:	f8850513          	addi	a0,a0,-120 # 8000a838 <digits+0x18>
    800088b8:	fffff097          	auipc	ra,0xfffff
    800088bc:	354080e7          	jalr	852(ra) # 80007c0c <panic>

00000000800088c0 <kalloc>:
    800088c0:	fe010113          	addi	sp,sp,-32
    800088c4:	00813823          	sd	s0,16(sp)
    800088c8:	00913423          	sd	s1,8(sp)
    800088cc:	00113c23          	sd	ra,24(sp)
    800088d0:	02010413          	addi	s0,sp,32
    800088d4:	00004797          	auipc	a5,0x4
    800088d8:	29c78793          	addi	a5,a5,668 # 8000cb70 <kmem>
    800088dc:	0007b483          	ld	s1,0(a5)
    800088e0:	02048063          	beqz	s1,80008900 <kalloc+0x40>
    800088e4:	0004b703          	ld	a4,0(s1)
    800088e8:	00001637          	lui	a2,0x1
    800088ec:	00500593          	li	a1,5
    800088f0:	00048513          	mv	a0,s1
    800088f4:	00e7b023          	sd	a4,0(a5)
    800088f8:	00000097          	auipc	ra,0x0
    800088fc:	400080e7          	jalr	1024(ra) # 80008cf8 <__memset>
    80008900:	01813083          	ld	ra,24(sp)
    80008904:	01013403          	ld	s0,16(sp)
    80008908:	00048513          	mv	a0,s1
    8000890c:	00813483          	ld	s1,8(sp)
    80008910:	02010113          	addi	sp,sp,32
    80008914:	00008067          	ret

0000000080008918 <initlock>:
    80008918:	ff010113          	addi	sp,sp,-16
    8000891c:	00813423          	sd	s0,8(sp)
    80008920:	01010413          	addi	s0,sp,16
    80008924:	00813403          	ld	s0,8(sp)
    80008928:	00b53423          	sd	a1,8(a0)
    8000892c:	00052023          	sw	zero,0(a0)
    80008930:	00053823          	sd	zero,16(a0)
    80008934:	01010113          	addi	sp,sp,16
    80008938:	00008067          	ret

000000008000893c <acquire>:
    8000893c:	fe010113          	addi	sp,sp,-32
    80008940:	00813823          	sd	s0,16(sp)
    80008944:	00913423          	sd	s1,8(sp)
    80008948:	00113c23          	sd	ra,24(sp)
    8000894c:	01213023          	sd	s2,0(sp)
    80008950:	02010413          	addi	s0,sp,32
    80008954:	00050493          	mv	s1,a0
    80008958:	10002973          	csrr	s2,sstatus
    8000895c:	100027f3          	csrr	a5,sstatus
    80008960:	ffd7f793          	andi	a5,a5,-3
    80008964:	10079073          	csrw	sstatus,a5
    80008968:	fffff097          	auipc	ra,0xfffff
    8000896c:	8e0080e7          	jalr	-1824(ra) # 80007248 <mycpu>
    80008970:	07852783          	lw	a5,120(a0)
    80008974:	06078e63          	beqz	a5,800089f0 <acquire+0xb4>
    80008978:	fffff097          	auipc	ra,0xfffff
    8000897c:	8d0080e7          	jalr	-1840(ra) # 80007248 <mycpu>
    80008980:	07852783          	lw	a5,120(a0)
    80008984:	0004a703          	lw	a4,0(s1)
    80008988:	0017879b          	addiw	a5,a5,1
    8000898c:	06f52c23          	sw	a5,120(a0)
    80008990:	04071063          	bnez	a4,800089d0 <acquire+0x94>
    80008994:	00100713          	li	a4,1
    80008998:	00070793          	mv	a5,a4
    8000899c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800089a0:	0007879b          	sext.w	a5,a5
    800089a4:	fe079ae3          	bnez	a5,80008998 <acquire+0x5c>
    800089a8:	0ff0000f          	fence
    800089ac:	fffff097          	auipc	ra,0xfffff
    800089b0:	89c080e7          	jalr	-1892(ra) # 80007248 <mycpu>
    800089b4:	01813083          	ld	ra,24(sp)
    800089b8:	01013403          	ld	s0,16(sp)
    800089bc:	00a4b823          	sd	a0,16(s1)
    800089c0:	00013903          	ld	s2,0(sp)
    800089c4:	00813483          	ld	s1,8(sp)
    800089c8:	02010113          	addi	sp,sp,32
    800089cc:	00008067          	ret
    800089d0:	0104b903          	ld	s2,16(s1)
    800089d4:	fffff097          	auipc	ra,0xfffff
    800089d8:	874080e7          	jalr	-1932(ra) # 80007248 <mycpu>
    800089dc:	faa91ce3          	bne	s2,a0,80008994 <acquire+0x58>
    800089e0:	00002517          	auipc	a0,0x2
    800089e4:	e6050513          	addi	a0,a0,-416 # 8000a840 <digits+0x20>
    800089e8:	fffff097          	auipc	ra,0xfffff
    800089ec:	224080e7          	jalr	548(ra) # 80007c0c <panic>
    800089f0:	00195913          	srli	s2,s2,0x1
    800089f4:	fffff097          	auipc	ra,0xfffff
    800089f8:	854080e7          	jalr	-1964(ra) # 80007248 <mycpu>
    800089fc:	00197913          	andi	s2,s2,1
    80008a00:	07252e23          	sw	s2,124(a0)
    80008a04:	f75ff06f          	j	80008978 <acquire+0x3c>

0000000080008a08 <release>:
    80008a08:	fe010113          	addi	sp,sp,-32
    80008a0c:	00813823          	sd	s0,16(sp)
    80008a10:	00113c23          	sd	ra,24(sp)
    80008a14:	00913423          	sd	s1,8(sp)
    80008a18:	01213023          	sd	s2,0(sp)
    80008a1c:	02010413          	addi	s0,sp,32
    80008a20:	00052783          	lw	a5,0(a0)
    80008a24:	00079a63          	bnez	a5,80008a38 <release+0x30>
    80008a28:	00002517          	auipc	a0,0x2
    80008a2c:	e2050513          	addi	a0,a0,-480 # 8000a848 <digits+0x28>
    80008a30:	fffff097          	auipc	ra,0xfffff
    80008a34:	1dc080e7          	jalr	476(ra) # 80007c0c <panic>
    80008a38:	01053903          	ld	s2,16(a0)
    80008a3c:	00050493          	mv	s1,a0
    80008a40:	fffff097          	auipc	ra,0xfffff
    80008a44:	808080e7          	jalr	-2040(ra) # 80007248 <mycpu>
    80008a48:	fea910e3          	bne	s2,a0,80008a28 <release+0x20>
    80008a4c:	0004b823          	sd	zero,16(s1)
    80008a50:	0ff0000f          	fence
    80008a54:	0f50000f          	fence	iorw,ow
    80008a58:	0804a02f          	amoswap.w	zero,zero,(s1)
    80008a5c:	ffffe097          	auipc	ra,0xffffe
    80008a60:	7ec080e7          	jalr	2028(ra) # 80007248 <mycpu>
    80008a64:	100027f3          	csrr	a5,sstatus
    80008a68:	0027f793          	andi	a5,a5,2
    80008a6c:	04079a63          	bnez	a5,80008ac0 <release+0xb8>
    80008a70:	07852783          	lw	a5,120(a0)
    80008a74:	02f05e63          	blez	a5,80008ab0 <release+0xa8>
    80008a78:	fff7871b          	addiw	a4,a5,-1
    80008a7c:	06e52c23          	sw	a4,120(a0)
    80008a80:	00071c63          	bnez	a4,80008a98 <release+0x90>
    80008a84:	07c52783          	lw	a5,124(a0)
    80008a88:	00078863          	beqz	a5,80008a98 <release+0x90>
    80008a8c:	100027f3          	csrr	a5,sstatus
    80008a90:	0027e793          	ori	a5,a5,2
    80008a94:	10079073          	csrw	sstatus,a5
    80008a98:	01813083          	ld	ra,24(sp)
    80008a9c:	01013403          	ld	s0,16(sp)
    80008aa0:	00813483          	ld	s1,8(sp)
    80008aa4:	00013903          	ld	s2,0(sp)
    80008aa8:	02010113          	addi	sp,sp,32
    80008aac:	00008067          	ret
    80008ab0:	00002517          	auipc	a0,0x2
    80008ab4:	db850513          	addi	a0,a0,-584 # 8000a868 <digits+0x48>
    80008ab8:	fffff097          	auipc	ra,0xfffff
    80008abc:	154080e7          	jalr	340(ra) # 80007c0c <panic>
    80008ac0:	00002517          	auipc	a0,0x2
    80008ac4:	d9050513          	addi	a0,a0,-624 # 8000a850 <digits+0x30>
    80008ac8:	fffff097          	auipc	ra,0xfffff
    80008acc:	144080e7          	jalr	324(ra) # 80007c0c <panic>

0000000080008ad0 <holding>:
    80008ad0:	00052783          	lw	a5,0(a0)
    80008ad4:	00079663          	bnez	a5,80008ae0 <holding+0x10>
    80008ad8:	00000513          	li	a0,0
    80008adc:	00008067          	ret
    80008ae0:	fe010113          	addi	sp,sp,-32
    80008ae4:	00813823          	sd	s0,16(sp)
    80008ae8:	00913423          	sd	s1,8(sp)
    80008aec:	00113c23          	sd	ra,24(sp)
    80008af0:	02010413          	addi	s0,sp,32
    80008af4:	01053483          	ld	s1,16(a0)
    80008af8:	ffffe097          	auipc	ra,0xffffe
    80008afc:	750080e7          	jalr	1872(ra) # 80007248 <mycpu>
    80008b00:	01813083          	ld	ra,24(sp)
    80008b04:	01013403          	ld	s0,16(sp)
    80008b08:	40a48533          	sub	a0,s1,a0
    80008b0c:	00153513          	seqz	a0,a0
    80008b10:	00813483          	ld	s1,8(sp)
    80008b14:	02010113          	addi	sp,sp,32
    80008b18:	00008067          	ret

0000000080008b1c <push_off>:
    80008b1c:	fe010113          	addi	sp,sp,-32
    80008b20:	00813823          	sd	s0,16(sp)
    80008b24:	00113c23          	sd	ra,24(sp)
    80008b28:	00913423          	sd	s1,8(sp)
    80008b2c:	02010413          	addi	s0,sp,32
    80008b30:	100024f3          	csrr	s1,sstatus
    80008b34:	100027f3          	csrr	a5,sstatus
    80008b38:	ffd7f793          	andi	a5,a5,-3
    80008b3c:	10079073          	csrw	sstatus,a5
    80008b40:	ffffe097          	auipc	ra,0xffffe
    80008b44:	708080e7          	jalr	1800(ra) # 80007248 <mycpu>
    80008b48:	07852783          	lw	a5,120(a0)
    80008b4c:	02078663          	beqz	a5,80008b78 <push_off+0x5c>
    80008b50:	ffffe097          	auipc	ra,0xffffe
    80008b54:	6f8080e7          	jalr	1784(ra) # 80007248 <mycpu>
    80008b58:	07852783          	lw	a5,120(a0)
    80008b5c:	01813083          	ld	ra,24(sp)
    80008b60:	01013403          	ld	s0,16(sp)
    80008b64:	0017879b          	addiw	a5,a5,1
    80008b68:	06f52c23          	sw	a5,120(a0)
    80008b6c:	00813483          	ld	s1,8(sp)
    80008b70:	02010113          	addi	sp,sp,32
    80008b74:	00008067          	ret
    80008b78:	0014d493          	srli	s1,s1,0x1
    80008b7c:	ffffe097          	auipc	ra,0xffffe
    80008b80:	6cc080e7          	jalr	1740(ra) # 80007248 <mycpu>
    80008b84:	0014f493          	andi	s1,s1,1
    80008b88:	06952e23          	sw	s1,124(a0)
    80008b8c:	fc5ff06f          	j	80008b50 <push_off+0x34>

0000000080008b90 <pop_off>:
    80008b90:	ff010113          	addi	sp,sp,-16
    80008b94:	00813023          	sd	s0,0(sp)
    80008b98:	00113423          	sd	ra,8(sp)
    80008b9c:	01010413          	addi	s0,sp,16
    80008ba0:	ffffe097          	auipc	ra,0xffffe
    80008ba4:	6a8080e7          	jalr	1704(ra) # 80007248 <mycpu>
    80008ba8:	100027f3          	csrr	a5,sstatus
    80008bac:	0027f793          	andi	a5,a5,2
    80008bb0:	04079663          	bnez	a5,80008bfc <pop_off+0x6c>
    80008bb4:	07852783          	lw	a5,120(a0)
    80008bb8:	02f05a63          	blez	a5,80008bec <pop_off+0x5c>
    80008bbc:	fff7871b          	addiw	a4,a5,-1
    80008bc0:	06e52c23          	sw	a4,120(a0)
    80008bc4:	00071c63          	bnez	a4,80008bdc <pop_off+0x4c>
    80008bc8:	07c52783          	lw	a5,124(a0)
    80008bcc:	00078863          	beqz	a5,80008bdc <pop_off+0x4c>
    80008bd0:	100027f3          	csrr	a5,sstatus
    80008bd4:	0027e793          	ori	a5,a5,2
    80008bd8:	10079073          	csrw	sstatus,a5
    80008bdc:	00813083          	ld	ra,8(sp)
    80008be0:	00013403          	ld	s0,0(sp)
    80008be4:	01010113          	addi	sp,sp,16
    80008be8:	00008067          	ret
    80008bec:	00002517          	auipc	a0,0x2
    80008bf0:	c7c50513          	addi	a0,a0,-900 # 8000a868 <digits+0x48>
    80008bf4:	fffff097          	auipc	ra,0xfffff
    80008bf8:	018080e7          	jalr	24(ra) # 80007c0c <panic>
    80008bfc:	00002517          	auipc	a0,0x2
    80008c00:	c5450513          	addi	a0,a0,-940 # 8000a850 <digits+0x30>
    80008c04:	fffff097          	auipc	ra,0xfffff
    80008c08:	008080e7          	jalr	8(ra) # 80007c0c <panic>

0000000080008c0c <push_on>:
    80008c0c:	fe010113          	addi	sp,sp,-32
    80008c10:	00813823          	sd	s0,16(sp)
    80008c14:	00113c23          	sd	ra,24(sp)
    80008c18:	00913423          	sd	s1,8(sp)
    80008c1c:	02010413          	addi	s0,sp,32
    80008c20:	100024f3          	csrr	s1,sstatus
    80008c24:	100027f3          	csrr	a5,sstatus
    80008c28:	0027e793          	ori	a5,a5,2
    80008c2c:	10079073          	csrw	sstatus,a5
    80008c30:	ffffe097          	auipc	ra,0xffffe
    80008c34:	618080e7          	jalr	1560(ra) # 80007248 <mycpu>
    80008c38:	07852783          	lw	a5,120(a0)
    80008c3c:	02078663          	beqz	a5,80008c68 <push_on+0x5c>
    80008c40:	ffffe097          	auipc	ra,0xffffe
    80008c44:	608080e7          	jalr	1544(ra) # 80007248 <mycpu>
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
    80008c70:	5dc080e7          	jalr	1500(ra) # 80007248 <mycpu>
    80008c74:	0014f493          	andi	s1,s1,1
    80008c78:	06952e23          	sw	s1,124(a0)
    80008c7c:	fc5ff06f          	j	80008c40 <push_on+0x34>

0000000080008c80 <pop_on>:
    80008c80:	ff010113          	addi	sp,sp,-16
    80008c84:	00813023          	sd	s0,0(sp)
    80008c88:	00113423          	sd	ra,8(sp)
    80008c8c:	01010413          	addi	s0,sp,16
    80008c90:	ffffe097          	auipc	ra,0xffffe
    80008c94:	5b8080e7          	jalr	1464(ra) # 80007248 <mycpu>
    80008c98:	100027f3          	csrr	a5,sstatus
    80008c9c:	0027f793          	andi	a5,a5,2
    80008ca0:	04078463          	beqz	a5,80008ce8 <pop_on+0x68>
    80008ca4:	07852783          	lw	a5,120(a0)
    80008ca8:	02f05863          	blez	a5,80008cd8 <pop_on+0x58>
    80008cac:	fff7879b          	addiw	a5,a5,-1
    80008cb0:	06f52c23          	sw	a5,120(a0)
    80008cb4:	07853783          	ld	a5,120(a0)
    80008cb8:	00079863          	bnez	a5,80008cc8 <pop_on+0x48>
    80008cbc:	100027f3          	csrr	a5,sstatus
    80008cc0:	ffd7f793          	andi	a5,a5,-3
    80008cc4:	10079073          	csrw	sstatus,a5
    80008cc8:	00813083          	ld	ra,8(sp)
    80008ccc:	00013403          	ld	s0,0(sp)
    80008cd0:	01010113          	addi	sp,sp,16
    80008cd4:	00008067          	ret
    80008cd8:	00002517          	auipc	a0,0x2
    80008cdc:	bb850513          	addi	a0,a0,-1096 # 8000a890 <digits+0x70>
    80008ce0:	fffff097          	auipc	ra,0xfffff
    80008ce4:	f2c080e7          	jalr	-212(ra) # 80007c0c <panic>
    80008ce8:	00002517          	auipc	a0,0x2
    80008cec:	b8850513          	addi	a0,a0,-1144 # 8000a870 <digits+0x50>
    80008cf0:	fffff097          	auipc	ra,0xfffff
    80008cf4:	f1c080e7          	jalr	-228(ra) # 80007c0c <panic>

0000000080008cf8 <__memset>:
    80008cf8:	ff010113          	addi	sp,sp,-16
    80008cfc:	00813423          	sd	s0,8(sp)
    80008d00:	01010413          	addi	s0,sp,16
    80008d04:	1a060e63          	beqz	a2,80008ec0 <__memset+0x1c8>
    80008d08:	40a007b3          	neg	a5,a0
    80008d0c:	0077f793          	andi	a5,a5,7
    80008d10:	00778693          	addi	a3,a5,7
    80008d14:	00b00813          	li	a6,11
    80008d18:	0ff5f593          	andi	a1,a1,255
    80008d1c:	fff6071b          	addiw	a4,a2,-1
    80008d20:	1b06e663          	bltu	a3,a6,80008ecc <__memset+0x1d4>
    80008d24:	1cd76463          	bltu	a4,a3,80008eec <__memset+0x1f4>
    80008d28:	1a078e63          	beqz	a5,80008ee4 <__memset+0x1ec>
    80008d2c:	00b50023          	sb	a1,0(a0)
    80008d30:	00100713          	li	a4,1
    80008d34:	1ae78463          	beq	a5,a4,80008edc <__memset+0x1e4>
    80008d38:	00b500a3          	sb	a1,1(a0)
    80008d3c:	00200713          	li	a4,2
    80008d40:	1ae78a63          	beq	a5,a4,80008ef4 <__memset+0x1fc>
    80008d44:	00b50123          	sb	a1,2(a0)
    80008d48:	00300713          	li	a4,3
    80008d4c:	18e78463          	beq	a5,a4,80008ed4 <__memset+0x1dc>
    80008d50:	00b501a3          	sb	a1,3(a0)
    80008d54:	00400713          	li	a4,4
    80008d58:	1ae78263          	beq	a5,a4,80008efc <__memset+0x204>
    80008d5c:	00b50223          	sb	a1,4(a0)
    80008d60:	00500713          	li	a4,5
    80008d64:	1ae78063          	beq	a5,a4,80008f04 <__memset+0x20c>
    80008d68:	00b502a3          	sb	a1,5(a0)
    80008d6c:	00700713          	li	a4,7
    80008d70:	18e79e63          	bne	a5,a4,80008f0c <__memset+0x214>
    80008d74:	00b50323          	sb	a1,6(a0)
    80008d78:	00700e93          	li	t4,7
    80008d7c:	00859713          	slli	a4,a1,0x8
    80008d80:	00e5e733          	or	a4,a1,a4
    80008d84:	01059e13          	slli	t3,a1,0x10
    80008d88:	01c76e33          	or	t3,a4,t3
    80008d8c:	01859313          	slli	t1,a1,0x18
    80008d90:	006e6333          	or	t1,t3,t1
    80008d94:	02059893          	slli	a7,a1,0x20
    80008d98:	40f60e3b          	subw	t3,a2,a5
    80008d9c:	011368b3          	or	a7,t1,a7
    80008da0:	02859813          	slli	a6,a1,0x28
    80008da4:	0108e833          	or	a6,a7,a6
    80008da8:	03059693          	slli	a3,a1,0x30
    80008dac:	003e589b          	srliw	a7,t3,0x3
    80008db0:	00d866b3          	or	a3,a6,a3
    80008db4:	03859713          	slli	a4,a1,0x38
    80008db8:	00389813          	slli	a6,a7,0x3
    80008dbc:	00f507b3          	add	a5,a0,a5
    80008dc0:	00e6e733          	or	a4,a3,a4
    80008dc4:	000e089b          	sext.w	a7,t3
    80008dc8:	00f806b3          	add	a3,a6,a5
    80008dcc:	00e7b023          	sd	a4,0(a5)
    80008dd0:	00878793          	addi	a5,a5,8
    80008dd4:	fed79ce3          	bne	a5,a3,80008dcc <__memset+0xd4>
    80008dd8:	ff8e7793          	andi	a5,t3,-8
    80008ddc:	0007871b          	sext.w	a4,a5
    80008de0:	01d787bb          	addw	a5,a5,t4
    80008de4:	0ce88e63          	beq	a7,a4,80008ec0 <__memset+0x1c8>
    80008de8:	00f50733          	add	a4,a0,a5
    80008dec:	00b70023          	sb	a1,0(a4)
    80008df0:	0017871b          	addiw	a4,a5,1
    80008df4:	0cc77663          	bgeu	a4,a2,80008ec0 <__memset+0x1c8>
    80008df8:	00e50733          	add	a4,a0,a4
    80008dfc:	00b70023          	sb	a1,0(a4)
    80008e00:	0027871b          	addiw	a4,a5,2
    80008e04:	0ac77e63          	bgeu	a4,a2,80008ec0 <__memset+0x1c8>
    80008e08:	00e50733          	add	a4,a0,a4
    80008e0c:	00b70023          	sb	a1,0(a4)
    80008e10:	0037871b          	addiw	a4,a5,3
    80008e14:	0ac77663          	bgeu	a4,a2,80008ec0 <__memset+0x1c8>
    80008e18:	00e50733          	add	a4,a0,a4
    80008e1c:	00b70023          	sb	a1,0(a4)
    80008e20:	0047871b          	addiw	a4,a5,4
    80008e24:	08c77e63          	bgeu	a4,a2,80008ec0 <__memset+0x1c8>
    80008e28:	00e50733          	add	a4,a0,a4
    80008e2c:	00b70023          	sb	a1,0(a4)
    80008e30:	0057871b          	addiw	a4,a5,5
    80008e34:	08c77663          	bgeu	a4,a2,80008ec0 <__memset+0x1c8>
    80008e38:	00e50733          	add	a4,a0,a4
    80008e3c:	00b70023          	sb	a1,0(a4)
    80008e40:	0067871b          	addiw	a4,a5,6
    80008e44:	06c77e63          	bgeu	a4,a2,80008ec0 <__memset+0x1c8>
    80008e48:	00e50733          	add	a4,a0,a4
    80008e4c:	00b70023          	sb	a1,0(a4)
    80008e50:	0077871b          	addiw	a4,a5,7
    80008e54:	06c77663          	bgeu	a4,a2,80008ec0 <__memset+0x1c8>
    80008e58:	00e50733          	add	a4,a0,a4
    80008e5c:	00b70023          	sb	a1,0(a4)
    80008e60:	0087871b          	addiw	a4,a5,8
    80008e64:	04c77e63          	bgeu	a4,a2,80008ec0 <__memset+0x1c8>
    80008e68:	00e50733          	add	a4,a0,a4
    80008e6c:	00b70023          	sb	a1,0(a4)
    80008e70:	0097871b          	addiw	a4,a5,9
    80008e74:	04c77663          	bgeu	a4,a2,80008ec0 <__memset+0x1c8>
    80008e78:	00e50733          	add	a4,a0,a4
    80008e7c:	00b70023          	sb	a1,0(a4)
    80008e80:	00a7871b          	addiw	a4,a5,10
    80008e84:	02c77e63          	bgeu	a4,a2,80008ec0 <__memset+0x1c8>
    80008e88:	00e50733          	add	a4,a0,a4
    80008e8c:	00b70023          	sb	a1,0(a4)
    80008e90:	00b7871b          	addiw	a4,a5,11
    80008e94:	02c77663          	bgeu	a4,a2,80008ec0 <__memset+0x1c8>
    80008e98:	00e50733          	add	a4,a0,a4
    80008e9c:	00b70023          	sb	a1,0(a4)
    80008ea0:	00c7871b          	addiw	a4,a5,12
    80008ea4:	00c77e63          	bgeu	a4,a2,80008ec0 <__memset+0x1c8>
    80008ea8:	00e50733          	add	a4,a0,a4
    80008eac:	00b70023          	sb	a1,0(a4)
    80008eb0:	00d7879b          	addiw	a5,a5,13
    80008eb4:	00c7f663          	bgeu	a5,a2,80008ec0 <__memset+0x1c8>
    80008eb8:	00f507b3          	add	a5,a0,a5
    80008ebc:	00b78023          	sb	a1,0(a5)
    80008ec0:	00813403          	ld	s0,8(sp)
    80008ec4:	01010113          	addi	sp,sp,16
    80008ec8:	00008067          	ret
    80008ecc:	00b00693          	li	a3,11
    80008ed0:	e55ff06f          	j	80008d24 <__memset+0x2c>
    80008ed4:	00300e93          	li	t4,3
    80008ed8:	ea5ff06f          	j	80008d7c <__memset+0x84>
    80008edc:	00100e93          	li	t4,1
    80008ee0:	e9dff06f          	j	80008d7c <__memset+0x84>
    80008ee4:	00000e93          	li	t4,0
    80008ee8:	e95ff06f          	j	80008d7c <__memset+0x84>
    80008eec:	00000793          	li	a5,0
    80008ef0:	ef9ff06f          	j	80008de8 <__memset+0xf0>
    80008ef4:	00200e93          	li	t4,2
    80008ef8:	e85ff06f          	j	80008d7c <__memset+0x84>
    80008efc:	00400e93          	li	t4,4
    80008f00:	e7dff06f          	j	80008d7c <__memset+0x84>
    80008f04:	00500e93          	li	t4,5
    80008f08:	e75ff06f          	j	80008d7c <__memset+0x84>
    80008f0c:	00600e93          	li	t4,6
    80008f10:	e6dff06f          	j	80008d7c <__memset+0x84>

0000000080008f14 <__memmove>:
    80008f14:	ff010113          	addi	sp,sp,-16
    80008f18:	00813423          	sd	s0,8(sp)
    80008f1c:	01010413          	addi	s0,sp,16
    80008f20:	0e060863          	beqz	a2,80009010 <__memmove+0xfc>
    80008f24:	fff6069b          	addiw	a3,a2,-1
    80008f28:	0006881b          	sext.w	a6,a3
    80008f2c:	0ea5e863          	bltu	a1,a0,8000901c <__memmove+0x108>
    80008f30:	00758713          	addi	a4,a1,7
    80008f34:	00a5e7b3          	or	a5,a1,a0
    80008f38:	40a70733          	sub	a4,a4,a0
    80008f3c:	0077f793          	andi	a5,a5,7
    80008f40:	00f73713          	sltiu	a4,a4,15
    80008f44:	00174713          	xori	a4,a4,1
    80008f48:	0017b793          	seqz	a5,a5
    80008f4c:	00e7f7b3          	and	a5,a5,a4
    80008f50:	10078863          	beqz	a5,80009060 <__memmove+0x14c>
    80008f54:	00900793          	li	a5,9
    80008f58:	1107f463          	bgeu	a5,a6,80009060 <__memmove+0x14c>
    80008f5c:	0036581b          	srliw	a6,a2,0x3
    80008f60:	fff8081b          	addiw	a6,a6,-1
    80008f64:	02081813          	slli	a6,a6,0x20
    80008f68:	01d85893          	srli	a7,a6,0x1d
    80008f6c:	00858813          	addi	a6,a1,8
    80008f70:	00058793          	mv	a5,a1
    80008f74:	00050713          	mv	a4,a0
    80008f78:	01088833          	add	a6,a7,a6
    80008f7c:	0007b883          	ld	a7,0(a5)
    80008f80:	00878793          	addi	a5,a5,8
    80008f84:	00870713          	addi	a4,a4,8
    80008f88:	ff173c23          	sd	a7,-8(a4)
    80008f8c:	ff0798e3          	bne	a5,a6,80008f7c <__memmove+0x68>
    80008f90:	ff867713          	andi	a4,a2,-8
    80008f94:	02071793          	slli	a5,a4,0x20
    80008f98:	0207d793          	srli	a5,a5,0x20
    80008f9c:	00f585b3          	add	a1,a1,a5
    80008fa0:	40e686bb          	subw	a3,a3,a4
    80008fa4:	00f507b3          	add	a5,a0,a5
    80008fa8:	06e60463          	beq	a2,a4,80009010 <__memmove+0xfc>
    80008fac:	0005c703          	lbu	a4,0(a1)
    80008fb0:	00e78023          	sb	a4,0(a5)
    80008fb4:	04068e63          	beqz	a3,80009010 <__memmove+0xfc>
    80008fb8:	0015c603          	lbu	a2,1(a1)
    80008fbc:	00100713          	li	a4,1
    80008fc0:	00c780a3          	sb	a2,1(a5)
    80008fc4:	04e68663          	beq	a3,a4,80009010 <__memmove+0xfc>
    80008fc8:	0025c603          	lbu	a2,2(a1)
    80008fcc:	00200713          	li	a4,2
    80008fd0:	00c78123          	sb	a2,2(a5)
    80008fd4:	02e68e63          	beq	a3,a4,80009010 <__memmove+0xfc>
    80008fd8:	0035c603          	lbu	a2,3(a1)
    80008fdc:	00300713          	li	a4,3
    80008fe0:	00c781a3          	sb	a2,3(a5)
    80008fe4:	02e68663          	beq	a3,a4,80009010 <__memmove+0xfc>
    80008fe8:	0045c603          	lbu	a2,4(a1)
    80008fec:	00400713          	li	a4,4
    80008ff0:	00c78223          	sb	a2,4(a5)
    80008ff4:	00e68e63          	beq	a3,a4,80009010 <__memmove+0xfc>
    80008ff8:	0055c603          	lbu	a2,5(a1)
    80008ffc:	00500713          	li	a4,5
    80009000:	00c782a3          	sb	a2,5(a5)
    80009004:	00e68663          	beq	a3,a4,80009010 <__memmove+0xfc>
    80009008:	0065c703          	lbu	a4,6(a1)
    8000900c:	00e78323          	sb	a4,6(a5)
    80009010:	00813403          	ld	s0,8(sp)
    80009014:	01010113          	addi	sp,sp,16
    80009018:	00008067          	ret
    8000901c:	02061713          	slli	a4,a2,0x20
    80009020:	02075713          	srli	a4,a4,0x20
    80009024:	00e587b3          	add	a5,a1,a4
    80009028:	f0f574e3          	bgeu	a0,a5,80008f30 <__memmove+0x1c>
    8000902c:	02069613          	slli	a2,a3,0x20
    80009030:	02065613          	srli	a2,a2,0x20
    80009034:	fff64613          	not	a2,a2
    80009038:	00e50733          	add	a4,a0,a4
    8000903c:	00c78633          	add	a2,a5,a2
    80009040:	fff7c683          	lbu	a3,-1(a5)
    80009044:	fff78793          	addi	a5,a5,-1
    80009048:	fff70713          	addi	a4,a4,-1
    8000904c:	00d70023          	sb	a3,0(a4)
    80009050:	fec798e3          	bne	a5,a2,80009040 <__memmove+0x12c>
    80009054:	00813403          	ld	s0,8(sp)
    80009058:	01010113          	addi	sp,sp,16
    8000905c:	00008067          	ret
    80009060:	02069713          	slli	a4,a3,0x20
    80009064:	02075713          	srli	a4,a4,0x20
    80009068:	00170713          	addi	a4,a4,1
    8000906c:	00e50733          	add	a4,a0,a4
    80009070:	00050793          	mv	a5,a0
    80009074:	0005c683          	lbu	a3,0(a1)
    80009078:	00178793          	addi	a5,a5,1
    8000907c:	00158593          	addi	a1,a1,1
    80009080:	fed78fa3          	sb	a3,-1(a5)
    80009084:	fee798e3          	bne	a5,a4,80009074 <__memmove+0x160>
    80009088:	f89ff06f          	j	80009010 <__memmove+0xfc>
	...
