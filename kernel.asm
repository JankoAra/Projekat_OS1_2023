
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000c117          	auipc	sp,0xc
    80000004:	a8813103          	ld	sp,-1400(sp) # 8000ba88 <_GLOBAL_OFFSET_TABLE_+0x40>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	6e1060ef          	jal	ra,80006efc <start>

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
    80001184:	3e5000ef          	jal	ra,80001d68 <interruptRoutine>

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
    size += sizeof(MemoryAllocator::UsedMemSegment);
    8000131c:	02050513          	addi	a0,a0,32
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
        stack = (uint64*) mem_alloc(DEFAULT_STACK_SIZE);
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
        stack = (uint64*) mem_alloc(DEFAULT_STACK_SIZE);
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
    80001660:	0000a797          	auipc	a5,0xa
    80001664:	4b07c783          	lbu	a5,1200(a5) # 8000bb10 <_ZN8KConsole11initializedE>
    80001668:	00078463          	beqz	a5,80001670 <_ZN8KConsole12initKConsoleEv+0x10>
    8000166c:	00008067          	ret
void KConsole::initKConsole() {
    80001670:	fe010113          	addi	sp,sp,-32
    80001674:	00113c23          	sd	ra,24(sp)
    80001678:	00813823          	sd	s0,16(sp)
    8000167c:	00913423          	sd	s1,8(sp)
    80001680:	02010413          	addi	s0,sp,32
	dr = (char*)CONSOLE_RX_DATA;
    80001684:	0000a497          	auipc	s1,0xa
    80001688:	48c48493          	addi	s1,s1,1164 # 8000bb10 <_ZN8KConsole11initializedE>
    8000168c:	0000a797          	auipc	a5,0xa
    80001690:	3cc7b783          	ld	a5,972(a5) # 8000ba58 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001694:	0007b783          	ld	a5,0(a5)
    80001698:	00f4b423          	sd	a5,8(s1)
	sr = (uint8*)CONSOLE_STATUS;
    8000169c:	0000a797          	auipc	a5,0xa
    800016a0:	3cc7b783          	ld	a5,972(a5) # 8000ba68 <_GLOBAL_OFFSET_TABLE_+0x20>
    800016a4:	0007b783          	ld	a5,0(a5)
    800016a8:	00f4b823          	sd	a5,16(s1)
	sem_open(&inputBufferHasSpace, capacity);
    800016ac:	03200593          	li	a1,50
    800016b0:	0000a517          	auipc	a0,0xa
    800016b4:	47850513          	addi	a0,a0,1144 # 8000bb28 <_ZN8KConsole19inputBufferHasSpaceE>
    800016b8:	00000097          	auipc	ra,0x0
    800016bc:	de8080e7          	jalr	-536(ra) # 800014a0 <_Z8sem_openPP4KSemj>
	sem_open(&outputBufferHasSpace, capacity);
    800016c0:	03200593          	li	a1,50
    800016c4:	0000a517          	auipc	a0,0xa
    800016c8:	46c50513          	addi	a0,a0,1132 # 8000bb30 <_ZN8KConsole20outputBufferHasSpaceE>
    800016cc:	00000097          	auipc	ra,0x0
    800016d0:	dd4080e7          	jalr	-556(ra) # 800014a0 <_Z8sem_openPP4KSemj>
	sem_open(&charsToInput, 0);
    800016d4:	00000593          	li	a1,0
    800016d8:	0000a517          	auipc	a0,0xa
    800016dc:	46050513          	addi	a0,a0,1120 # 8000bb38 <_ZN8KConsole12charsToInputE>
    800016e0:	00000097          	auipc	ra,0x0
    800016e4:	dc0080e7          	jalr	-576(ra) # 800014a0 <_Z8sem_openPP4KSemj>
	sem_open(&charsToOutput, 0);
    800016e8:	00000593          	li	a1,0
    800016ec:	0000a517          	auipc	a0,0xa
    800016f0:	45450513          	addi	a0,a0,1108 # 8000bb40 <_ZN8KConsole13charsToOutputE>
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
    8000172c:	00008517          	auipc	a0,0x8
    80001730:	8f450513          	addi	a0,a0,-1804 # 80009020 <CONSOLE_STATUS+0x10>
    80001734:	00004097          	auipc	ra,0x4
    80001738:	578080e7          	jalr	1400(ra) # 80005cac <_Z11printStringPKc>
	printInteger((uint64)dr);
    8000173c:	0000a497          	auipc	s1,0xa
    80001740:	3d448493          	addi	s1,s1,980 # 8000bb10 <_ZN8KConsole11initializedE>
    80001744:	0084b503          	ld	a0,8(s1)
    80001748:	00000097          	auipc	ra,0x0
    8000174c:	250080e7          	jalr	592(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    80001750:	00008517          	auipc	a0,0x8
    80001754:	e3050513          	addi	a0,a0,-464 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80001758:	00004097          	auipc	ra,0x4
    8000175c:	554080e7          	jalr	1364(ra) # 80005cac <_Z11printStringPKc>
	printString("CONSOLE_STATUS = ");
    80001760:	00008517          	auipc	a0,0x8
    80001764:	8d050513          	addi	a0,a0,-1840 # 80009030 <CONSOLE_STATUS+0x20>
    80001768:	00004097          	auipc	ra,0x4
    8000176c:	544080e7          	jalr	1348(ra) # 80005cac <_Z11printStringPKc>
	printInteger((uint64)sr);
    80001770:	0104b503          	ld	a0,16(s1)
    80001774:	00000097          	auipc	ra,0x0
    80001778:	224080e7          	jalr	548(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    8000177c:	00008517          	auipc	a0,0x8
    80001780:	e0450513          	addi	a0,a0,-508 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80001784:	00004097          	auipc	ra,0x4
    80001788:	528080e7          	jalr	1320(ra) # 80005cac <_Z11printStringPKc>
	printString("*CONSOLE_RX = ");
    8000178c:	00008517          	auipc	a0,0x8
    80001790:	8bc50513          	addi	a0,a0,-1860 # 80009048 <CONSOLE_STATUS+0x38>
    80001794:	00004097          	auipc	ra,0x4
    80001798:	518080e7          	jalr	1304(ra) # 80005cac <_Z11printStringPKc>
	printInteger(*dr);
    8000179c:	0084b783          	ld	a5,8(s1)
    800017a0:	0007c503          	lbu	a0,0(a5)
    800017a4:	00000097          	auipc	ra,0x0
    800017a8:	1f4080e7          	jalr	500(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    800017ac:	00008517          	auipc	a0,0x8
    800017b0:	dd450513          	addi	a0,a0,-556 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    800017b4:	00004097          	auipc	ra,0x4
    800017b8:	4f8080e7          	jalr	1272(ra) # 80005cac <_Z11printStringPKc>
	printString("*CONSOLE_STATUS = ");
    800017bc:	00008517          	auipc	a0,0x8
    800017c0:	89c50513          	addi	a0,a0,-1892 # 80009058 <CONSOLE_STATUS+0x48>
    800017c4:	00004097          	auipc	ra,0x4
    800017c8:	4e8080e7          	jalr	1256(ra) # 80005cac <_Z11printStringPKc>
	printInteger(*sr);
    800017cc:	0104b783          	ld	a5,16(s1)
    800017d0:	0007c503          	lbu	a0,0(a5)
    800017d4:	00000097          	auipc	ra,0x0
    800017d8:	1c4080e7          	jalr	452(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    800017dc:	00008517          	auipc	a0,0x8
    800017e0:	da450513          	addi	a0,a0,-604 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    800017e4:	00004097          	auipc	ra,0x4
    800017e8:	4c8080e7          	jalr	1224(ra) # 80005cac <_Z11printStringPKc>
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
    80001814:	0000a497          	auipc	s1,0xa
    80001818:	2fc48493          	addi	s1,s1,764 # 8000bb10 <_ZN8KConsole11initializedE>
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
    80001858:	0000a717          	auipc	a4,0xa
    8000185c:	32c72703          	lw	a4,812(a4) # 8000bb84 <_ZN8KConsole15inputBufferSizeE>
    80001860:	03200793          	li	a5,50
    80001864:	04f70e63          	beq	a4,a5,800018c0 <_ZN8KConsole12placeInInputEc+0x68>
void KConsole::placeInInput(char c) {
    80001868:	ff010113          	addi	sp,sp,-16
    8000186c:	00113423          	sd	ra,8(sp)
    80001870:	00813023          	sd	s0,0(sp)
    80001874:	01010413          	addi	s0,sp,16
	inputBuffer[inputTail] = c;
    80001878:	0000a697          	auipc	a3,0xa
    8000187c:	29868693          	addi	a3,a3,664 # 8000bb10 <_ZN8KConsole11initializedE>
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
    800018e0:	0000a497          	auipc	s1,0xa
    800018e4:	23048493          	addi	s1,s1,560 # 8000bb10 <_ZN8KConsole11initializedE>
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
    80001948:	0000a497          	auipc	s1,0xa
    8000194c:	1c848493          	addi	s1,s1,456 # 8000bb10 <_ZN8KConsole11initializedE>
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
    800019ec:	00007717          	auipc	a4,0x7
    800019f0:	68470713          	addi	a4,a4,1668 # 80009070 <_ZZ9kPrintIntmE6digits>
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
    80001a5c:	0000a797          	auipc	a5,0xa
    80001a60:	1747b783          	ld	a5,372(a5) # 8000bbd0 <_ZN9Scheduler4tailE>
    80001a64:	00078e63          	beqz	a5,80001a80 <_ZN9Scheduler3putEP3TCB+0x30>
        head = tail = tcb;
    } else {
        tail->nextInScheduler = tcb;
    80001a68:	02a7b823          	sd	a0,48(a5)
        tail = tcb;
    80001a6c:	0000a797          	auipc	a5,0xa
    80001a70:	16a7b223          	sd	a0,356(a5) # 8000bbd0 <_ZN9Scheduler4tailE>
    }
}
    80001a74:	00813403          	ld	s0,8(sp)
    80001a78:	01010113          	addi	sp,sp,16
    80001a7c:	00008067          	ret
        head = tail = tcb;
    80001a80:	0000a797          	auipc	a5,0xa
    80001a84:	15078793          	addi	a5,a5,336 # 8000bbd0 <_ZN9Scheduler4tailE>
    80001a88:	00a7b023          	sd	a0,0(a5)
    80001a8c:	00a7b423          	sd	a0,8(a5)
    80001a90:	fe5ff06f          	j	80001a74 <_ZN9Scheduler3putEP3TCB+0x24>

0000000080001a94 <_ZN9Scheduler3getEv>:

TCB* Scheduler::get() {
    80001a94:	ff010113          	addi	sp,sp,-16
    80001a98:	00813423          	sd	s0,8(sp)
    80001a9c:	01010413          	addi	s0,sp,16
    TCB* firstThread = head;
    80001aa0:	0000a717          	auipc	a4,0xa
    80001aa4:	13070713          	addi	a4,a4,304 # 8000bbd0 <_ZN9Scheduler4tailE>
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
    80001ae8:	0000a817          	auipc	a6,0xa
    80001aec:	0f883803          	ld	a6,248(a6) # 8000bbe0 <_ZN9Scheduler12sleepingHeadE>
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
    80001b20:	0000a797          	auipc	a5,0xa
    80001b24:	0ca7b023          	sd	a0,192(a5) # 8000bbe0 <_ZN9Scheduler12sleepingHeadE>
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
    80001b68:	0000a797          	auipc	a5,0xa
    80001b6c:	06a7bc23          	sd	a0,120(a5) # 8000bbe0 <_ZN9Scheduler12sleepingHeadE>
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
    80001b84:	0000a797          	auipc	a5,0xa
    80001b88:	05c7b783          	ld	a5,92(a5) # 8000bbe0 <_ZN9Scheduler12sleepingHeadE>
    80001b8c:	06078e63          	beqz	a5,80001c08 <_ZN9Scheduler4wakeEv+0x84>
    sleepingHead->timeToSleep--;
    80001b90:	0387b703          	ld	a4,56(a5)
    80001b94:	fff70713          	addi	a4,a4,-1
    80001b98:	02e7bc23          	sd	a4,56(a5)
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001b9c:	0000a517          	auipc	a0,0xa
    80001ba0:	04453503          	ld	a0,68(a0) # 8000bbe0 <_ZN9Scheduler12sleepingHeadE>
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
    80001bd0:	0000a717          	auipc	a4,0xa
    80001bd4:	00f73823          	sd	a5,16(a4) # 8000bbe0 <_ZN9Scheduler12sleepingHeadE>
        thread->nextSleeping = nullptr;
    80001bd8:	04053023          	sd	zero,64(a0)
        thread->status = TCB::ACTIVE;
    80001bdc:	00100793          	li	a5,1
    80001be0:	04f52c23          	sw	a5,88(a0)
        Scheduler::put(thread);
    80001be4:	00000097          	auipc	ra,0x0
    80001be8:	e6c080e7          	jalr	-404(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001bec:	0000a517          	auipc	a0,0xa
    80001bf0:	ff453503          	ld	a0,-12(a0) # 8000bbe0 <_ZN9Scheduler12sleepingHeadE>
    80001bf4:	fc0518e3          	bnez	a0,80001bc4 <_ZN9Scheduler4wakeEv+0x40>
    }
}
    80001bf8:	00813083          	ld	ra,8(sp)
    80001bfc:	00013403          	ld	s0,0(sp)
    80001c00:	01010113          	addi	sp,sp,16
    80001c04:	00008067          	ret
    80001c08:	00008067          	ret

0000000080001c0c <_Z4idlePv>:

extern "C" void interruptHandler();

void userMain();

void idle(void*) {
    80001c0c:	ff010113          	addi	sp,sp,-16
    80001c10:	00113423          	sd	ra,8(sp)
    80001c14:	00813023          	sd	s0,0(sp)
    80001c18:	01010413          	addi	s0,sp,16
    while (1) { thread_dispatch(); }
    80001c1c:	00000097          	auipc	ra,0x0
    80001c20:	80c080e7          	jalr	-2036(ra) # 80001428 <_Z15thread_dispatchv>
    80001c24:	ff9ff06f          	j	80001c1c <_Z4idlePv+0x10>

0000000080001c28 <_Z22kernelConsumerFunctionPv>:
}

void kernelConsumerFunction(void*) {
    80001c28:	ff010113          	addi	sp,sp,-16
    80001c2c:	00113423          	sd	ra,8(sp)
    80001c30:	00813023          	sd	s0,0(sp)
    80001c34:	01010413          	addi	s0,sp,16
    80001c38:	0280006f          	j	80001c60 <_Z22kernelConsumerFunctionPv+0x38>
    while (1) {
        char c = KConsole::getFromOutput();
        while (!(*KConsole::sr & CONSOLE_TX_STATUS_BIT)) {}
        *KConsole::dr = c;
    80001c3c:	0000a797          	auipc	a5,0xa
    80001c40:	e547b783          	ld	a5,-428(a5) # 8000ba90 <_GLOBAL_OFFSET_TABLE_+0x48>
    80001c44:	0007b783          	ld	a5,0(a5)
    80001c48:	00a78023          	sb	a0,0(a5)
        sem_signal(KConsole::outputBufferHasSpace);
    80001c4c:	0000a797          	auipc	a5,0xa
    80001c50:	e4c7b783          	ld	a5,-436(a5) # 8000ba98 <_GLOBAL_OFFSET_TABLE_+0x50>
    80001c54:	0007b503          	ld	a0,0(a5)
    80001c58:	00000097          	auipc	ra,0x0
    80001c5c:	8e0080e7          	jalr	-1824(ra) # 80001538 <_Z10sem_signalP4KSem>
        char c = KConsole::getFromOutput();
    80001c60:	00000097          	auipc	ra,0x0
    80001c64:	ba0080e7          	jalr	-1120(ra) # 80001800 <_ZN8KConsole13getFromOutputEv>
        while (!(*KConsole::sr & CONSOLE_TX_STATUS_BIT)) {}
    80001c68:	0000a797          	auipc	a5,0xa
    80001c6c:	e607b783          	ld	a5,-416(a5) # 8000bac8 <_GLOBAL_OFFSET_TABLE_+0x80>
    80001c70:	0007b783          	ld	a5,0(a5)
    80001c74:	0007c783          	lbu	a5,0(a5)
    80001c78:	0207f793          	andi	a5,a5,32
    80001c7c:	fe0786e3          	beqz	a5,80001c68 <_Z22kernelConsumerFunctionPv+0x40>
    80001c80:	fbdff06f          	j	80001c3c <_Z22kernelConsumerFunctionPv+0x14>

0000000080001c84 <main>:
    }

}

int main() {
    80001c84:	fd010113          	addi	sp,sp,-48
    80001c88:	02113423          	sd	ra,40(sp)
    80001c8c:	02813023          	sd	s0,32(sp)
    80001c90:	03010413          	addi	s0,sp,48
    //postavi adresu prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80001c94:	0000a797          	auipc	a5,0xa
    80001c98:	e1c7b783          	ld	a5,-484(a5) # 8000bab0 <_GLOBAL_OFFSET_TABLE_+0x68>
    80001c9c:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    MemoryAllocator::initMemoryAllocator();
    80001ca0:	00001097          	auipc	ra,0x1
    80001ca4:	630080e7          	jalr	1584(ra) # 800032d0 <_ZN15MemoryAllocator19initMemoryAllocatorEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    80001ca8:	00000097          	auipc	ra,0x0
    80001cac:	9b8080e7          	jalr	-1608(ra) # 80001660 <_ZN8KConsole12initKConsoleEv>
    //pravljenje niti
    thread_t mainHandle;
    thread_t userHandle;
    thread_t idleHandle;
    thread_t consoleOutputHandle;
    thread_create(&mainHandle, nullptr, nullptr);
    80001cb0:	00000613          	li	a2,0
    80001cb4:	00000593          	li	a1,0
    80001cb8:	fe840513          	addi	a0,s0,-24
    80001cbc:	fffff097          	auipc	ra,0xfffff
    80001cc0:	6c4080e7          	jalr	1732(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::running = mainHandle;
    80001cc4:	0000a797          	auipc	a5,0xa
    80001cc8:	ddc7b783          	ld	a5,-548(a5) # 8000baa0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001ccc:	fe843703          	ld	a4,-24(s0)
    80001cd0:	00e7b023          	sd	a4,0(a5)
    thread_create(&userHandle, (TCB::Body) userMain, nullptr);
    80001cd4:	00000613          	li	a2,0
    80001cd8:	0000a597          	auipc	a1,0xa
    80001cdc:	d785b583          	ld	a1,-648(a1) # 8000ba50 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001ce0:	fe040513          	addi	a0,s0,-32
    80001ce4:	fffff097          	auipc	ra,0xfffff
    80001ce8:	69c080e7          	jalr	1692(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&consoleOutputHandle, kernelConsumerFunction, nullptr);
    80001cec:	00000613          	li	a2,0
    80001cf0:	00000597          	auipc	a1,0x0
    80001cf4:	f3858593          	addi	a1,a1,-200 # 80001c28 <_Z22kernelConsumerFunctionPv>
    80001cf8:	fd040513          	addi	a0,s0,-48
    80001cfc:	fffff097          	auipc	ra,0xfffff
    80001d00:	684080e7          	jalr	1668(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&idleHandle, idle, nullptr);
    80001d04:	00000613          	li	a2,0
    80001d08:	00000597          	auipc	a1,0x0
    80001d0c:	f0458593          	addi	a1,a1,-252 # 80001c0c <_Z4idlePv>
    80001d10:	fd840513          	addi	a0,s0,-40
    80001d14:	fffff097          	auipc	ra,0xfffff
    80001d18:	66c080e7          	jalr	1644(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
inline void Riscv::w_sip(uint64 sip) {
	__asm__ volatile("csrw sip, %[sip]": :[sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80001d1c:	00200793          	li	a5,2
    80001d20:	1007a073          	csrs	sstatus,a5

    //omogucavanje prekida
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    //cekanje da se userMain zavrsi
    thread_join(userHandle);
    80001d24:	fe043503          	ld	a0,-32(s0)
    80001d28:	fffff097          	auipc	ra,0xfffff
    80001d2c:	720080e7          	jalr	1824(ra) # 80001448 <_Z11thread_joinP3TCB>

    //printString("\nSad cu da izadjem\n");

    //flush output bafera za konzolu
    while (KConsole::outputHead != KConsole::outputTail) {}
    80001d30:	0000a797          	auipc	a5,0xa
    80001d34:	d507b783          	ld	a5,-688(a5) # 8000ba80 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001d38:	0007a703          	lw	a4,0(a5)
    80001d3c:	0000a797          	auipc	a5,0xa
    80001d40:	d847b783          	ld	a5,-636(a5) # 8000bac0 <_GLOBAL_OFFSET_TABLE_+0x78>
    80001d44:	0007a783          	lw	a5,0(a5)
    80001d48:	fef714e3          	bne	a4,a5,80001d30 <main+0xac>
}

inline void Riscv::mc_sstatus(uint64 mask) {
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80001d4c:	00200793          	li	a5,2
    80001d50:	1007b073          	csrc	sstatus,a5
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    return 0;


    80001d54:	00000513          	li	a0,0
    80001d58:	02813083          	ld	ra,40(sp)
    80001d5c:	02013403          	ld	s0,32(sp)
    80001d60:	03010113          	addi	sp,sp,48
    80001d64:	00008067          	ret

0000000080001d68 <interruptRoutine>:
#include "../test/printing.hpp"

//void printInteger(int i);

#pragma GCC optimize("O0")
extern "C" void interruptRoutine() {
    80001d68:	f8010113          	addi	sp,sp,-128
    80001d6c:	06113c23          	sd	ra,120(sp)
    80001d70:	06813823          	sd	s0,112(sp)
    80001d74:	06913423          	sd	s1,104(sp)
    80001d78:	08010413          	addi	s0,sp,128
    //bitni sistemski registri
    uint64 scause, sepc, sstatus;
    __asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001d7c:	14202373          	csrr	t1,scause
    80001d80:	fc643c23          	sd	t1,-40(s0)
    __asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001d84:	14102373          	csrr	t1,sepc
    80001d88:	fc643823          	sd	t1,-48(s0)
    __asm__ volatile("csrr %[stat], sstatus":[stat] "=r"(sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001d8c:	10002373          	csrr	t1,sstatus
    80001d90:	fc643423          	sd	t1,-56(s0)

    //argumenti preneti sistemskom pozivu
    uint64 a0, a1, a2, a3, a4, a5, a6, a7;
    __asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001d94:	00050313          	mv	t1,a0
    80001d98:	fc643023          	sd	t1,-64(s0)
    __asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001d9c:	00058313          	mv	t1,a1
    80001da0:	fa643c23          	sd	t1,-72(s0)
    __asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001da4:	00060313          	mv	t1,a2
    80001da8:	fa643823          	sd	t1,-80(s0)
    __asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001dac:	00068313          	mv	t1,a3
    80001db0:	fa643423          	sd	t1,-88(s0)
    __asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001db4:	00070313          	mv	t1,a4
    80001db8:	fa643023          	sd	t1,-96(s0)
    __asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001dbc:	00078313          	mv	t1,a5
    80001dc0:	f8643c23          	sd	t1,-104(s0)
    __asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001dc4:	00080313          	mv	t1,a6
    80001dc8:	f8643823          	sd	t1,-112(s0)
    __asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001dcc:	00088313          	mv	t1,a7
    80001dd0:	f8643423          	sd	t1,-120(s0)

    if (scause == 0x9 || scause == 0x8) {
    80001dd4:	fd843703          	ld	a4,-40(s0)
    80001dd8:	00900793          	li	a5,9
    80001ddc:	00f70863          	beq	a4,a5,80001dec <interruptRoutine+0x84>
    80001de0:	fd843703          	ld	a4,-40(s0)
    80001de4:	00800793          	li	a5,8
    80001de8:	36f71263          	bne	a4,a5,8000214c <interruptRoutine+0x3e4>
        //prekid zbog poziva ecall
        switch (a0) {
    80001dec:	fc043703          	ld	a4,-64(s0)
    80001df0:	09100793          	li	a5,145
    80001df4:	2cf70663          	beq	a4,a5,800020c0 <interruptRoutine+0x358>
    80001df8:	fc043703          	ld	a4,-64(s0)
    80001dfc:	09100793          	li	a5,145
    80001e00:	2ce7e863          	bltu	a5,a4,800020d0 <interruptRoutine+0x368>
    80001e04:	fc043703          	ld	a4,-64(s0)
    80001e08:	08100793          	li	a5,129
    80001e0c:	2af70063          	beq	a4,a5,800020ac <interruptRoutine+0x344>
    80001e10:	fc043703          	ld	a4,-64(s0)
    80001e14:	08100793          	li	a5,129
    80001e18:	2ae7ec63          	bltu	a5,a4,800020d0 <interruptRoutine+0x368>
    80001e1c:	fc043703          	ld	a4,-64(s0)
    80001e20:	04200793          	li	a5,66
    80001e24:	04e7e263          	bltu	a5,a4,80001e68 <interruptRoutine+0x100>
    80001e28:	fc043783          	ld	a5,-64(s0)
    80001e2c:	2a078263          	beqz	a5,800020d0 <interruptRoutine+0x368>
    80001e30:	fc043703          	ld	a4,-64(s0)
    80001e34:	04200793          	li	a5,66
    80001e38:	28e7ec63          	bltu	a5,a4,800020d0 <interruptRoutine+0x368>
    80001e3c:	fc043783          	ld	a5,-64(s0)
    80001e40:	00279713          	slli	a4,a5,0x2
    80001e44:	00007797          	auipc	a5,0x7
    80001e48:	2b078793          	addi	a5,a5,688 # 800090f4 <_ZZ9kPrintIntmE6digits+0x84>
    80001e4c:	00f707b3          	add	a5,a4,a5
    80001e50:	0007a783          	lw	a5,0(a5)
    80001e54:	0007871b          	sext.w	a4,a5
    80001e58:	00007797          	auipc	a5,0x7
    80001e5c:	29c78793          	addi	a5,a5,668 # 800090f4 <_ZZ9kPrintIntmE6digits+0x84>
    80001e60:	00f707b3          	add	a5,a4,a5
    80001e64:	00078067          	jr	a5
    80001e68:	fc043703          	ld	a4,-64(s0)
    80001e6c:	08000793          	li	a5,128
    80001e70:	1ef70863          	beq	a4,a5,80002060 <interruptRoutine+0x2f8>
    80001e74:	25c0006f          	j	800020d0 <interruptRoutine+0x368>
            case 0x01:
                //mem_alloc
                //a1 = broj blokova koje treba alocirati
                MemoryAllocator::kmalloc((size_t)a1 * MEM_BLOCK_SIZE);
    80001e78:	fb843783          	ld	a5,-72(s0)
    80001e7c:	00679793          	slli	a5,a5,0x6
    80001e80:	00300593          	li	a1,3
    80001e84:	00078513          	mv	a0,a5
    80001e88:	00001097          	auipc	ra,0x1
    80001e8c:	e60080e7          	jalr	-416(ra) # 80002ce8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
                __asm__ volatile("sd a0, 80(s0)");
    80001e90:	04a43823          	sd	a0,80(s0)
                break;
    80001e94:	2980006f          	j	8000212c <interruptRoutine+0x3c4>
            case 0x02:
                //mem_free
                //a1 = pokazivac na memoriju koju dealociramo, dobijen sa mem_alloc
                MemoryAllocator::kfree((void*)a1);
    80001e98:	fb843783          	ld	a5,-72(s0)
    80001e9c:	00078513          	mv	a0,a5
    80001ea0:	00001097          	auipc	ra,0x1
    80001ea4:	0f0080e7          	jalr	240(ra) # 80002f90 <_ZN15MemoryAllocator5kfreeEPv>
                __asm__ volatile("sd a0, 80(s0)");
    80001ea8:	04a43823          	sd	a0,80(s0)
                break;
    80001eac:	2800006f          	j	8000212c <interruptRoutine+0x3c4>
                //thread_create
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    80001eb0:	fb043783          	ld	a5,-80(s0)
    80001eb4:	fa843703          	ld	a4,-88(s0)
    80001eb8:	fa043683          	ld	a3,-96(s0)
    80001ebc:	fb843483          	ld	s1,-72(s0)
    80001ec0:	00068613          	mv	a2,a3
    80001ec4:	00070593          	mv	a1,a4
    80001ec8:	00078513          	mv	a0,a5
    80001ecc:	00001097          	auipc	ra,0x1
    80001ed0:	c34080e7          	jalr	-972(ra) # 80002b00 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80001ed4:	00050793          	mv	a5,a0
    80001ed8:	00f4b023          	sd	a5,0(s1)
                TCB::start(*((thread_t*)a1));
    80001edc:	fb843783          	ld	a5,-72(s0)
    80001ee0:	0007b783          	ld	a5,0(a5)
    80001ee4:	00078513          	mv	a0,a5
    80001ee8:	00001097          	auipc	ra,0x1
    80001eec:	d98080e7          	jalr	-616(ra) # 80002c80 <_ZN3TCB5startEPS_>
                if (*((thread_t*)a1) != nullptr) {
    80001ef0:	fb843783          	ld	a5,-72(s0)
    80001ef4:	0007b783          	ld	a5,0(a5)
    80001ef8:	00078663          	beqz	a5,80001f04 <interruptRoutine+0x19c>
                    __asm__ volatile("li a0, 0");
    80001efc:	00000513          	li	a0,0
    80001f00:	0080006f          	j	80001f08 <interruptRoutine+0x1a0>
                } else {
                    __asm__ volatile("li a0, -1");
    80001f04:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80001f08:	04a43823          	sd	a0,80(s0)
                break;
    80001f0c:	2200006f          	j	8000212c <interruptRoutine+0x3c4>
            case 0x12:
                //thread_exit
                //TCB::running->setFinished(true);
                TCB::running->setStatus(TCB::FINISHED);
    80001f10:	0000a797          	auipc	a5,0xa
    80001f14:	b907b783          	ld	a5,-1136(a5) # 8000baa0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001f18:	0007b783          	ld	a5,0(a5)
    80001f1c:	00500593          	li	a1,5
    80001f20:	00078513          	mv	a0,a5
    80001f24:	00000097          	auipc	ra,0x0
    80001f28:	3e8080e7          	jalr	1000(ra) # 8000230c <_ZN3TCB9setStatusENS_12ThreadStatusE>
                TCB::releaseJoined();
    80001f2c:	00001097          	auipc	ra,0x1
    80001f30:	cf4080e7          	jalr	-780(ra) # 80002c20 <_ZN3TCB13releaseJoinedEv>
                TCB::yield();
    80001f34:	00001097          	auipc	ra,0x1
    80001f38:	b6c080e7          	jalr	-1172(ra) # 80002aa0 <_ZN3TCB5yieldEv>
                break;
    80001f3c:	1f00006f          	j	8000212c <interruptRoutine+0x3c4>
            case 0x13:
                //thread_dispatch
                TCB::yield();
    80001f40:	00001097          	auipc	ra,0x1
    80001f44:	b60080e7          	jalr	-1184(ra) # 80002aa0 <_ZN3TCB5yieldEv>
                break;
    80001f48:	1e40006f          	j	8000212c <interruptRoutine+0x3c4>
            case 0x14:
                //thread_join
                //a1 = rucka niti na koju tekuca nit treba da ceka
                TCB::threadJoin((thread_t)a1);
    80001f4c:	fb843783          	ld	a5,-72(s0)
    80001f50:	00078513          	mv	a0,a5
    80001f54:	00001097          	auipc	ra,0x1
    80001f58:	c80080e7          	jalr	-896(ra) # 80002bd4 <_ZN3TCB10threadJoinEPS_>
                TCB::yield();
    80001f5c:	00001097          	auipc	ra,0x1
    80001f60:	b44080e7          	jalr	-1212(ra) # 80002aa0 <_ZN3TCB5yieldEv>
                break;
    80001f64:	1c80006f          	j	8000212c <interruptRoutine+0x3c4>
            case 0x21:
                //sem_open
                //a1 = pokazivac na rucku semafora, u koju se upisuje adresa semafora u memoriji
                *((sem_t*)a1) = KSem::initSem((uint)a2);
    80001f68:	fb043783          	ld	a5,-80(s0)
    80001f6c:	0007879b          	sext.w	a5,a5
    80001f70:	fb843483          	ld	s1,-72(s0)
    80001f74:	00078513          	mv	a0,a5
    80001f78:	00001097          	auipc	ra,0x1
    80001f7c:	45c080e7          	jalr	1116(ra) # 800033d4 <_ZN4KSem7initSemEj>
    80001f80:	00050793          	mv	a5,a0
    80001f84:	00f4b023          	sd	a5,0(s1)
                if (*((sem_t*)a1) != nullptr) {
    80001f88:	fb843783          	ld	a5,-72(s0)
    80001f8c:	0007b783          	ld	a5,0(a5)
    80001f90:	00078663          	beqz	a5,80001f9c <interruptRoutine+0x234>
                    __asm__ volatile("li a0, 0");
    80001f94:	00000513          	li	a0,0
    80001f98:	0080006f          	j	80001fa0 <interruptRoutine+0x238>
                } else {
                    __asm__ volatile("li a0, -1");
    80001f9c:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80001fa0:	04a43823          	sd	a0,80(s0)
                break;
    80001fa4:	1880006f          	j	8000212c <interruptRoutine+0x3c4>
            case 0x22:
                //sem_close
                //a1 = rucka semafora
                KSem::closeSem((sem_t)a1);
    80001fa8:	fb843783          	ld	a5,-72(s0)
    80001fac:	00078513          	mv	a0,a5
    80001fb0:	00001097          	auipc	ra,0x1
    80001fb4:	5a0080e7          	jalr	1440(ra) # 80003550 <_ZN4KSem8closeSemEPS_>
                __asm__ volatile("sd a0, 80(s0)");
    80001fb8:	04a43823          	sd	a0,80(s0)
                break;
    80001fbc:	1700006f          	j	8000212c <interruptRoutine+0x3c4>
            case 0x23:
                //sem_wait
                //a1 = rucka semafora
                ((sem_t)a1)->wait();
    80001fc0:	fb843783          	ld	a5,-72(s0)
    80001fc4:	00078513          	mv	a0,a5
    80001fc8:	00001097          	auipc	ra,0x1
    80001fcc:	4a0080e7          	jalr	1184(ra) # 80003468 <_ZN4KSem4waitEv>
                __asm__ volatile("sd a0, 80(s0)");
    80001fd0:	04a43823          	sd	a0,80(s0)
                break;
    80001fd4:	1580006f          	j	8000212c <interruptRoutine+0x3c4>
            case 0x24:
                //sem_signal
                //a1 = rucka semafora
                ((sem_t)a1)->signal();
    80001fd8:	fb843783          	ld	a5,-72(s0)
    80001fdc:	00078513          	mv	a0,a5
    80001fe0:	00001097          	auipc	ra,0x1
    80001fe4:	51c080e7          	jalr	1308(ra) # 800034fc <_ZN4KSem6signalEv>
                __asm__ volatile("sd a0, 80(s0)");
    80001fe8:	04a43823          	sd	a0,80(s0)
                break;
    80001fec:	1400006f          	j	8000212c <interruptRoutine+0x3c4>
            case 0x31:
                //time_sleep
                //a1 = broj perioda tajmera na koji se uspavljuje tekuca nit
                if ((time_t)a1 > 0) {
    80001ff0:	fb843783          	ld	a5,-72(s0)
    80001ff4:	00078663          	beqz	a5,80002000 <interruptRoutine+0x298>
                    __asm__ volatile("li a0, 0");
    80001ff8:	00000513          	li	a0,0
    80001ffc:	0080006f          	j	80002004 <interruptRoutine+0x29c>
                } else {
                    __asm__ volatile("li a0, -1");
    80002000:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80002004:	04a43823          	sd	a0,80(s0)
                if ((time_t)a1 > 0) {
    80002008:	fb843783          	ld	a5,-72(s0)
    8000200c:	10078e63          	beqz	a5,80002128 <interruptRoutine+0x3c0>
                    Scheduler::putToSleep(TCB::running, (time_t)a1);
    80002010:	0000a797          	auipc	a5,0xa
    80002014:	a907b783          	ld	a5,-1392(a5) # 8000baa0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002018:	0007b783          	ld	a5,0(a5)
    8000201c:	fb843583          	ld	a1,-72(s0)
    80002020:	00078513          	mv	a0,a5
    80002024:	00000097          	auipc	ra,0x0
    80002028:	ab0080e7          	jalr	-1360(ra) # 80001ad4 <_ZN9Scheduler10putToSleepEP3TCBm>
                    TCB::yield();
    8000202c:	00001097          	auipc	ra,0x1
    80002030:	a74080e7          	jalr	-1420(ra) # 80002aa0 <_ZN3TCB5yieldEv>
                }
                break;
    80002034:	0f40006f          	j	80002128 <interruptRoutine+0x3c0>
            case 0x41:
                //getc
                KConsole::kgetc();
    80002038:	00000097          	auipc	ra,0x0
    8000203c:	8fc080e7          	jalr	-1796(ra) # 80001934 <_ZN8KConsole5kgetcEv>
                __asm__ volatile("sd a0, 80(s0)");
    80002040:	04a43823          	sd	a0,80(s0)
                break;
    80002044:	0e80006f          	j	8000212c <interruptRoutine+0x3c4>
            case 0x42:
                //putc
                //a1 = karakter koji se upisuje u bafer za ispis na konzolu
                KConsole::kputc((char)a1);
    80002048:	fb843783          	ld	a5,-72(s0)
    8000204c:	0ff7f793          	andi	a5,a5,255
    80002050:	00078513          	mv	a0,a5
    80002054:	00000097          	auipc	ra,0x0
    80002058:	870080e7          	jalr	-1936(ra) # 800018c4 <_ZN8KConsole5kputcEc>
                break;
    8000205c:	0d00006f          	j	8000212c <interruptRoutine+0x3c4>
                //alloc thread
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    80002060:	fb043783          	ld	a5,-80(s0)
    80002064:	fa843703          	ld	a4,-88(s0)
    80002068:	fa043683          	ld	a3,-96(s0)
    8000206c:	fb843483          	ld	s1,-72(s0)
    80002070:	00068613          	mv	a2,a3
    80002074:	00070593          	mv	a1,a4
    80002078:	00078513          	mv	a0,a5
    8000207c:	00001097          	auipc	ra,0x1
    80002080:	a84080e7          	jalr	-1404(ra) # 80002b00 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80002084:	00050793          	mv	a5,a0
    80002088:	00f4b023          	sd	a5,0(s1)
                if (*((thread_t*)a1) != nullptr) {
    8000208c:	fb843783          	ld	a5,-72(s0)
    80002090:	0007b783          	ld	a5,0(a5)
    80002094:	00078663          	beqz	a5,800020a0 <interruptRoutine+0x338>
                    __asm__ volatile("li a0, 0");
    80002098:	00000513          	li	a0,0
    8000209c:	0080006f          	j	800020a4 <interruptRoutine+0x33c>
                } else {
                    __asm__ volatile("li a0, -1");
    800020a0:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    800020a4:	04a43823          	sd	a0,80(s0)
                break;
    800020a8:	0840006f          	j	8000212c <interruptRoutine+0x3c4>
            case 0x81:
                //start thread
                //a1 = rucka niti koja se stavlja u scheduler
                Scheduler::put((thread_t)a1);
    800020ac:	fb843783          	ld	a5,-72(s0)
    800020b0:	00078513          	mv	a0,a5
    800020b4:	00000097          	auipc	ra,0x0
    800020b8:	99c080e7          	jalr	-1636(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
                break;
    800020bc:	0700006f          	j	8000212c <interruptRoutine+0x3c4>
            case 0x91:
                //printInteger
                //a1 = integer za ispis
                kPrintInt(a1);
    800020c0:	fb843503          	ld	a0,-72(s0)
    800020c4:	00000097          	auipc	ra,0x0
    800020c8:	8fc080e7          	jalr	-1796(ra) # 800019c0 <_Z9kPrintIntm>
                break;
    800020cc:	0600006f          	j	8000212c <interruptRoutine+0x3c4>
            default:
                printString("\nNepostojeci op code: ");
    800020d0:	00007517          	auipc	a0,0x7
    800020d4:	fb050513          	addi	a0,a0,-80 # 80009080 <_ZZ9kPrintIntmE6digits+0x10>
    800020d8:	00004097          	auipc	ra,0x4
    800020dc:	bd4080e7          	jalr	-1068(ra) # 80005cac <_Z11printStringPKc>
                kPrintInt(a0);
    800020e0:	fc043503          	ld	a0,-64(s0)
    800020e4:	00000097          	auipc	ra,0x0
    800020e8:	8dc080e7          	jalr	-1828(ra) # 800019c0 <_Z9kPrintIntm>
                printString("\nscause: ");
    800020ec:	00007517          	auipc	a0,0x7
    800020f0:	fac50513          	addi	a0,a0,-84 # 80009098 <_ZZ9kPrintIntmE6digits+0x28>
    800020f4:	00004097          	auipc	ra,0x4
    800020f8:	bb8080e7          	jalr	-1096(ra) # 80005cac <_Z11printStringPKc>
                kPrintInt(scause);
    800020fc:	fd843503          	ld	a0,-40(s0)
    80002100:	00000097          	auipc	ra,0x0
    80002104:	8c0080e7          	jalr	-1856(ra) # 800019c0 <_Z9kPrintIntm>
                printString("\nsepc: ");
    80002108:	00007517          	auipc	a0,0x7
    8000210c:	fa050513          	addi	a0,a0,-96 # 800090a8 <_ZZ9kPrintIntmE6digits+0x38>
    80002110:	00004097          	auipc	ra,0x4
    80002114:	b9c080e7          	jalr	-1124(ra) # 80005cac <_Z11printStringPKc>
                kPrintInt(sepc);
    80002118:	fd043503          	ld	a0,-48(s0)
    8000211c:	00000097          	auipc	ra,0x0
    80002120:	8a4080e7          	jalr	-1884(ra) # 800019c0 <_Z9kPrintIntm>
                break;
    80002124:	0080006f          	j	8000212c <interruptRoutine+0x3c4>
                break;
    80002128:	00000013          	nop
        }
        //sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
        sepc += 4;
    8000212c:	fd043783          	ld	a5,-48(s0)
    80002130:	00478793          	addi	a5,a5,4
    80002134:	fcf43823          	sd	a5,-48(s0)
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002138:	fd043783          	ld	a5,-48(s0)
    8000213c:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002140:	fc843783          	ld	a5,-56(s0)
    80002144:	10079073          	csrw	sstatus,a5
        printString("scause: ");
        kPrintInt(scause);
        printString("\nsepc: ");
        kPrintInt(sepc);
    }
}
    80002148:	1900006f          	j	800022d8 <interruptRoutine+0x570>
    } else if (scause == 0x8000000000000009) {
    8000214c:	fd843703          	ld	a4,-40(s0)
    80002150:	fff00793          	li	a5,-1
    80002154:	03f79793          	slli	a5,a5,0x3f
    80002158:	00978793          	addi	a5,a5,9
    8000215c:	08f71e63          	bne	a4,a5,800021f8 <interruptRoutine+0x490>
        uint64 irq = plic_claim();
    80002160:	00005097          	auipc	ra,0x5
    80002164:	5f4080e7          	jalr	1524(ra) # 80007754 <plic_claim>
    80002168:	00050793          	mv	a5,a0
    8000216c:	f8f43023          	sd	a5,-128(s0)
        if (irq == CONSOLE_IRQ) {
    80002170:	f8043703          	ld	a4,-128(s0)
    80002174:	00a00793          	li	a5,10
    80002178:	02f71e63          	bne	a4,a5,800021b4 <interruptRoutine+0x44c>
            if (*KConsole::sr & CONSOLE_RX_STATUS_BIT) {
    8000217c:	0000a797          	auipc	a5,0xa
    80002180:	94c7b783          	ld	a5,-1716(a5) # 8000bac8 <_GLOBAL_OFFSET_TABLE_+0x80>
    80002184:	0007b783          	ld	a5,0(a5)
    80002188:	0007c783          	lbu	a5,0(a5)
    8000218c:	0017f793          	andi	a5,a5,1
    80002190:	02078a63          	beqz	a5,800021c4 <interruptRoutine+0x45c>
                KConsole::placeInInput(*KConsole::dr);
    80002194:	0000a797          	auipc	a5,0xa
    80002198:	8fc7b783          	ld	a5,-1796(a5) # 8000ba90 <_GLOBAL_OFFSET_TABLE_+0x48>
    8000219c:	0007b783          	ld	a5,0(a5)
    800021a0:	0007c783          	lbu	a5,0(a5)
    800021a4:	00078513          	mv	a0,a5
    800021a8:	fffff097          	auipc	ra,0xfffff
    800021ac:	6b0080e7          	jalr	1712(ra) # 80001858 <_ZN8KConsole12placeInInputEc>
    800021b0:	0140006f          	j	800021c4 <interruptRoutine+0x45c>
            printString("Neki drugi prekid\n");
    800021b4:	00007517          	auipc	a0,0x7
    800021b8:	efc50513          	addi	a0,a0,-260 # 800090b0 <_ZZ9kPrintIntmE6digits+0x40>
    800021bc:	00004097          	auipc	ra,0x4
    800021c0:	af0080e7          	jalr	-1296(ra) # 80005cac <_Z11printStringPKc>
        plic_complete(irq);
    800021c4:	f8043783          	ld	a5,-128(s0)
    800021c8:	0007879b          	sext.w	a5,a5
    800021cc:	00078513          	mv	a0,a5
    800021d0:	00005097          	auipc	ra,0x5
    800021d4:	5bc080e7          	jalr	1468(ra) # 8000778c <plic_complete>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    800021d8:	fd043783          	ld	a5,-48(s0)
    800021dc:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    800021e0:	fc843783          	ld	a5,-56(s0)
    800021e4:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SEIP);
    800021e8:	20000513          	li	a0,512
    800021ec:	00000097          	auipc	ra,0x0
    800021f0:	104080e7          	jalr	260(ra) # 800022f0 <_ZN5Riscv6mc_sipEm>
}
    800021f4:	0e40006f          	j	800022d8 <interruptRoutine+0x570>
    } else if (scause == 0x8000000000000001) {
    800021f8:	fd843703          	ld	a4,-40(s0)
    800021fc:	fff00793          	li	a5,-1
    80002200:	03f79793          	slli	a5,a5,0x3f
    80002204:	00178793          	addi	a5,a5,1
    80002208:	08f71463          	bne	a4,a5,80002290 <interruptRoutine+0x528>
        Scheduler::wake();
    8000220c:	00000097          	auipc	ra,0x0
    80002210:	978080e7          	jalr	-1672(ra) # 80001b84 <_ZN9Scheduler4wakeEv>
        TCB::runningTimeSlice++;
    80002214:	0000a797          	auipc	a5,0xa
    80002218:	84c7b783          	ld	a5,-1972(a5) # 8000ba60 <_GLOBAL_OFFSET_TABLE_+0x18>
    8000221c:	0007b783          	ld	a5,0(a5)
    80002220:	00178713          	addi	a4,a5,1
    80002224:	0000a797          	auipc	a5,0xa
    80002228:	83c7b783          	ld	a5,-1988(a5) # 8000ba60 <_GLOBAL_OFFSET_TABLE_+0x18>
    8000222c:	00e7b023          	sd	a4,0(a5)
        if (TCB::runningTimeSlice >= TCB::running->getTimeSlice()) {
    80002230:	0000a797          	auipc	a5,0xa
    80002234:	8707b783          	ld	a5,-1936(a5) # 8000baa0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002238:	0007b783          	ld	a5,0(a5)
    8000223c:	00078513          	mv	a0,a5
    80002240:	00000097          	auipc	ra,0x0
    80002244:	0e8080e7          	jalr	232(ra) # 80002328 <_ZN3TCB12getTimeSliceEv>
    80002248:	00050713          	mv	a4,a0
    8000224c:	0000a797          	auipc	a5,0xa
    80002250:	8147b783          	ld	a5,-2028(a5) # 8000ba60 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002254:	0007b783          	ld	a5,0(a5)
    80002258:	00e7b7b3          	sltu	a5,a5,a4
    8000225c:	0017c793          	xori	a5,a5,1
    80002260:	0ff7f793          	andi	a5,a5,255
    80002264:	00078663          	beqz	a5,80002270 <interruptRoutine+0x508>
            TCB::yield();
    80002268:	00001097          	auipc	ra,0x1
    8000226c:	838080e7          	jalr	-1992(ra) # 80002aa0 <_ZN3TCB5yieldEv>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002270:	fd043783          	ld	a5,-48(s0)
    80002274:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002278:	fc843783          	ld	a5,-56(s0)
    8000227c:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SSIP);
    80002280:	00200513          	li	a0,2
    80002284:	00000097          	auipc	ra,0x0
    80002288:	06c080e7          	jalr	108(ra) # 800022f0 <_ZN5Riscv6mc_sipEm>
}
    8000228c:	04c0006f          	j	800022d8 <interruptRoutine+0x570>
        printString("\nGreska u prekidnoj rutini\n");
    80002290:	00007517          	auipc	a0,0x7
    80002294:	e3850513          	addi	a0,a0,-456 # 800090c8 <_ZZ9kPrintIntmE6digits+0x58>
    80002298:	00004097          	auipc	ra,0x4
    8000229c:	a14080e7          	jalr	-1516(ra) # 80005cac <_Z11printStringPKc>
        printString("scause: ");
    800022a0:	00007517          	auipc	a0,0x7
    800022a4:	e4850513          	addi	a0,a0,-440 # 800090e8 <_ZZ9kPrintIntmE6digits+0x78>
    800022a8:	00004097          	auipc	ra,0x4
    800022ac:	a04080e7          	jalr	-1532(ra) # 80005cac <_Z11printStringPKc>
        kPrintInt(scause);
    800022b0:	fd843503          	ld	a0,-40(s0)
    800022b4:	fffff097          	auipc	ra,0xfffff
    800022b8:	70c080e7          	jalr	1804(ra) # 800019c0 <_Z9kPrintIntm>
        printString("\nsepc: ");
    800022bc:	00007517          	auipc	a0,0x7
    800022c0:	dec50513          	addi	a0,a0,-532 # 800090a8 <_ZZ9kPrintIntmE6digits+0x38>
    800022c4:	00004097          	auipc	ra,0x4
    800022c8:	9e8080e7          	jalr	-1560(ra) # 80005cac <_Z11printStringPKc>
        kPrintInt(sepc);
    800022cc:	fd043503          	ld	a0,-48(s0)
    800022d0:	fffff097          	auipc	ra,0xfffff
    800022d4:	6f0080e7          	jalr	1776(ra) # 800019c0 <_Z9kPrintIntm>
}
    800022d8:	00000013          	nop
    800022dc:	07813083          	ld	ra,120(sp)
    800022e0:	07013403          	ld	s0,112(sp)
    800022e4:	06813483          	ld	s1,104(sp)
    800022e8:	08010113          	addi	sp,sp,128
    800022ec:	00008067          	ret

00000000800022f0 <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    800022f0:	ff010113          	addi	sp,sp,-16
    800022f4:	00813423          	sd	s0,8(sp)
    800022f8:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    800022fc:	14453073          	csrc	sip,a0
}
    80002300:	00813403          	ld	s0,8(sp)
    80002304:	01010113          	addi	sp,sp,16
    80002308:	00008067          	ret

000000008000230c <_ZN3TCB9setStatusENS_12ThreadStatusE>:

    enum ThreadStatus {
        CREATED, ACTIVE, BLOCKED, JOINING, SLEEPING, FINISHED
    };

    void setStatus(ThreadStatus stat) { this->status = stat; }
    8000230c:	ff010113          	addi	sp,sp,-16
    80002310:	00813423          	sd	s0,8(sp)
    80002314:	01010413          	addi	s0,sp,16
    80002318:	04b52c23          	sw	a1,88(a0)
    8000231c:	00813403          	ld	s0,8(sp)
    80002320:	01010113          	addi	sp,sp,16
    80002324:	00008067          	ret

0000000080002328 <_ZN3TCB12getTimeSliceEv>:
//
//    bool isBlocked() { return blocked; }
//
//    void setBlocked(bool block) { this->blocked = block; }

    uint64 getTimeSlice() { return timeSlice; }
    80002328:	ff010113          	addi	sp,sp,-16
    8000232c:	00813423          	sd	s0,8(sp)
    80002330:	01010413          	addi	s0,sp,16
    80002334:	02853503          	ld	a0,40(a0)
    80002338:	00813403          	ld	s0,8(sp)
    8000233c:	01010113          	addi	sp,sp,16
    80002340:	00008067          	ret

0000000080002344 <_ZN6Thread7wrapperEPv>:

	__asm__ volatile("ecall");
}

void Thread::wrapper(void* thread) {
	if (thread != nullptr) {
    80002344:	02050863          	beqz	a0,80002374 <_ZN6Thread7wrapperEPv+0x30>
void Thread::wrapper(void* thread) {
    80002348:	ff010113          	addi	sp,sp,-16
    8000234c:	00113423          	sd	ra,8(sp)
    80002350:	00813023          	sd	s0,0(sp)
    80002354:	01010413          	addi	s0,sp,16
		((Thread*)thread)->run();
    80002358:	00053783          	ld	a5,0(a0)
    8000235c:	0107b783          	ld	a5,16(a5)
    80002360:	000780e7          	jalr	a5
	}
}
    80002364:	00813083          	ld	ra,8(sp)
    80002368:	00013403          	ld	s0,0(sp)
    8000236c:	01010113          	addi	sp,sp,16
    80002370:	00008067          	ret
    80002374:	00008067          	ret

0000000080002378 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    80002378:	fe010113          	addi	sp,sp,-32
    8000237c:	00113c23          	sd	ra,24(sp)
    80002380:	00813823          	sd	s0,16(sp)
    80002384:	00913423          	sd	s1,8(sp)
    80002388:	02010413          	addi	s0,sp,32
    8000238c:	00050493          	mv	s1,a0
    80002390:	00009797          	auipc	a5,0x9
    80002394:	4d078793          	addi	a5,a5,1232 # 8000b860 <_ZTV6Thread+0x10>
    80002398:	00f53023          	sd	a5,0(a0)
	thread_join(this->myHandle);
    8000239c:	00853503          	ld	a0,8(a0)
    800023a0:	fffff097          	auipc	ra,0xfffff
    800023a4:	0a8080e7          	jalr	168(ra) # 80001448 <_Z11thread_joinP3TCB>
	delete myHandle;
    800023a8:	0084b483          	ld	s1,8(s1)
    800023ac:	02048863          	beqz	s1,800023dc <_ZN6ThreadD1Ev+0x64>
            delete node;
        }
    }

    bool isEmpty() const {
        bool ret = front == nullptr;
    800023b0:	0504b503          	ld	a0,80(s1)
        while (!isEmpty()) {
    800023b4:	00050e63          	beqz	a0,800023d0 <_ZN6ThreadD1Ev+0x58>
            front = front->next;
    800023b8:	00853783          	ld	a5,8(a0)
    800023bc:	04f4b823          	sd	a5,80(s1)
            delete node;
    800023c0:	fe0508e3          	beqz	a0,800023b0 <_ZN6ThreadD1Ev+0x38>
            mem_free(ptr);
    800023c4:	fffff097          	auipc	ra,0xfffff
    800023c8:	f8c080e7          	jalr	-116(ra) # 80001350 <_Z8mem_freePv>
        }
    800023cc:	fe5ff06f          	j	800023b0 <_ZN6ThreadD1Ev+0x38>
    800023d0:	00048513          	mv	a0,s1
    800023d4:	00000097          	auipc	ra,0x0
    800023d8:	7d8080e7          	jalr	2008(ra) # 80002bac <_ZN3TCBdlEPv>
}
    800023dc:	01813083          	ld	ra,24(sp)
    800023e0:	01013403          	ld	s0,16(sp)
    800023e4:	00813483          	ld	s1,8(sp)
    800023e8:	02010113          	addi	sp,sp,32
    800023ec:	00008067          	ret

00000000800023f0 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
	sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    800023f0:	fe010113          	addi	sp,sp,-32
    800023f4:	00113c23          	sd	ra,24(sp)
    800023f8:	00813823          	sd	s0,16(sp)
    800023fc:	00913423          	sd	s1,8(sp)
    80002400:	02010413          	addi	s0,sp,32
    80002404:	00050493          	mv	s1,a0
    80002408:	00009797          	auipc	a5,0x9
    8000240c:	48078793          	addi	a5,a5,1152 # 8000b888 <_ZTV9Semaphore+0x10>
    80002410:	00f53023          	sd	a5,0(a0)
	sem_close(myHandle);
    80002414:	00853503          	ld	a0,8(a0)
    80002418:	fffff097          	auipc	ra,0xfffff
    8000241c:	0c0080e7          	jalr	192(ra) # 800014d8 <_Z9sem_closeP4KSem>
	delete myHandle;
    80002420:	0084b483          	ld	s1,8(s1)
    80002424:	02048863          	beqz	s1,80002454 <_ZN9SemaphoreD1Ev+0x64>
        bool ret = front == nullptr;
    80002428:	0084b503          	ld	a0,8(s1)
        while (!isEmpty()) {
    8000242c:	00050e63          	beqz	a0,80002448 <_ZN9SemaphoreD1Ev+0x58>
            front = front->next;
    80002430:	00853783          	ld	a5,8(a0)
    80002434:	00f4b423          	sd	a5,8(s1)
            delete node;
    80002438:	fe0508e3          	beqz	a0,80002428 <_ZN9SemaphoreD1Ev+0x38>
            mem_free(ptr);
    8000243c:	fffff097          	auipc	ra,0xfffff
    80002440:	f14080e7          	jalr	-236(ra) # 80001350 <_Z8mem_freePv>
        }
    80002444:	fe5ff06f          	j	80002428 <_ZN9SemaphoreD1Ev+0x38>
    80002448:	00048513          	mv	a0,s1
    8000244c:	00001097          	auipc	ra,0x1
    80002450:	f60080e7          	jalr	-160(ra) # 800033ac <_ZN4KSemdlEPv>
}
    80002454:	01813083          	ld	ra,24(sp)
    80002458:	01013403          	ld	s0,16(sp)
    8000245c:	00813483          	ld	s1,8(sp)
    80002460:	02010113          	addi	sp,sp,32
    80002464:	00008067          	ret

0000000080002468 <_Znwm>:
void* operator new(size_t size) {
    80002468:	ff010113          	addi	sp,sp,-16
    8000246c:	00113423          	sd	ra,8(sp)
    80002470:	00813023          	sd	s0,0(sp)
    80002474:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    80002478:	fffff097          	auipc	ra,0xfffff
    8000247c:	e98080e7          	jalr	-360(ra) # 80001310 <_Z9mem_allocm>
}
    80002480:	00813083          	ld	ra,8(sp)
    80002484:	00013403          	ld	s0,0(sp)
    80002488:	01010113          	addi	sp,sp,16
    8000248c:	00008067          	ret

0000000080002490 <_Znam>:
void* operator new[](size_t size) {
    80002490:	ff010113          	addi	sp,sp,-16
    80002494:	00113423          	sd	ra,8(sp)
    80002498:	00813023          	sd	s0,0(sp)
    8000249c:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    800024a0:	fffff097          	auipc	ra,0xfffff
    800024a4:	e70080e7          	jalr	-400(ra) # 80001310 <_Z9mem_allocm>
}
    800024a8:	00813083          	ld	ra,8(sp)
    800024ac:	00013403          	ld	s0,0(sp)
    800024b0:	01010113          	addi	sp,sp,16
    800024b4:	00008067          	ret

00000000800024b8 <_ZdlPv>:
noexcept {
    800024b8:	ff010113          	addi	sp,sp,-16
    800024bc:	00113423          	sd	ra,8(sp)
    800024c0:	00813023          	sd	s0,0(sp)
    800024c4:	01010413          	addi	s0,sp,16
mem_free(ptr);
    800024c8:	fffff097          	auipc	ra,0xfffff
    800024cc:	e88080e7          	jalr	-376(ra) # 80001350 <_Z8mem_freePv>
}
    800024d0:	00813083          	ld	ra,8(sp)
    800024d4:	00013403          	ld	s0,0(sp)
    800024d8:	01010113          	addi	sp,sp,16
    800024dc:	00008067          	ret

00000000800024e0 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    800024e0:	fe010113          	addi	sp,sp,-32
    800024e4:	00113c23          	sd	ra,24(sp)
    800024e8:	00813823          	sd	s0,16(sp)
    800024ec:	00913423          	sd	s1,8(sp)
    800024f0:	02010413          	addi	s0,sp,32
    800024f4:	00050493          	mv	s1,a0
}
    800024f8:	00000097          	auipc	ra,0x0
    800024fc:	e80080e7          	jalr	-384(ra) # 80002378 <_ZN6ThreadD1Ev>
    80002500:	00048513          	mv	a0,s1
    80002504:	00000097          	auipc	ra,0x0
    80002508:	fb4080e7          	jalr	-76(ra) # 800024b8 <_ZdlPv>
    8000250c:	01813083          	ld	ra,24(sp)
    80002510:	01013403          	ld	s0,16(sp)
    80002514:	00813483          	ld	s1,8(sp)
    80002518:	02010113          	addi	sp,sp,32
    8000251c:	00008067          	ret

0000000080002520 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80002520:	fe010113          	addi	sp,sp,-32
    80002524:	00113c23          	sd	ra,24(sp)
    80002528:	00813823          	sd	s0,16(sp)
    8000252c:	00913423          	sd	s1,8(sp)
    80002530:	02010413          	addi	s0,sp,32
    80002534:	00050493          	mv	s1,a0
}
    80002538:	00000097          	auipc	ra,0x0
    8000253c:	eb8080e7          	jalr	-328(ra) # 800023f0 <_ZN9SemaphoreD1Ev>
    80002540:	00048513          	mv	a0,s1
    80002544:	00000097          	auipc	ra,0x0
    80002548:	f74080e7          	jalr	-140(ra) # 800024b8 <_ZdlPv>
    8000254c:	01813083          	ld	ra,24(sp)
    80002550:	01013403          	ld	s0,16(sp)
    80002554:	00813483          	ld	s1,8(sp)
    80002558:	02010113          	addi	sp,sp,32
    8000255c:	00008067          	ret

0000000080002560 <_ZdaPv>:
noexcept {
    80002560:	ff010113          	addi	sp,sp,-16
    80002564:	00113423          	sd	ra,8(sp)
    80002568:	00813023          	sd	s0,0(sp)
    8000256c:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80002570:	fffff097          	auipc	ra,0xfffff
    80002574:	de0080e7          	jalr	-544(ra) # 80001350 <_Z8mem_freePv>
}
    80002578:	00813083          	ld	ra,8(sp)
    8000257c:	00013403          	ld	s0,0(sp)
    80002580:	01010113          	addi	sp,sp,16
    80002584:	00008067          	ret

0000000080002588 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (* body)(void*), void* arg) {
    80002588:	fd010113          	addi	sp,sp,-48
    8000258c:	02113423          	sd	ra,40(sp)
    80002590:	02813023          	sd	s0,32(sp)
    80002594:	00913c23          	sd	s1,24(sp)
    80002598:	01213823          	sd	s2,16(sp)
    8000259c:	01313423          	sd	s3,8(sp)
    800025a0:	03010413          	addi	s0,sp,48
    800025a4:	00050493          	mv	s1,a0
    800025a8:	00058913          	mv	s2,a1
    800025ac:	00060993          	mv	s3,a2
    800025b0:	00009797          	auipc	a5,0x9
    800025b4:	2b078793          	addi	a5,a5,688 # 8000b860 <_ZTV6Thread+0x10>
    800025b8:	00f53023          	sd	a5,0(a0)
	this->body = body;
    800025bc:	00b53823          	sd	a1,16(a0)
	this->arg = arg;
    800025c0:	00c53c23          	sd	a2,24(a0)
	if (body != nullptr) {
    800025c4:	04058663          	beqz	a1,80002610 <_ZN6ThreadC1EPFvPvES0_+0x88>
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    800025c8:	00001537          	lui	a0,0x1
    800025cc:	fffff097          	auipc	ra,0xfffff
    800025d0:	d44080e7          	jalr	-700(ra) # 80001310 <_Z9mem_allocm>
    800025d4:	00050313          	mv	t1,a0
	__asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800025d8:	00030713          	mv	a4,t1
	__asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800025dc:	00098693          	mv	a3,s3
			body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800025e0:	00090613          	mv	a2,s2
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800025e4:	00848493          	addi	s1,s1,8
    800025e8:	00048593          	mv	a1,s1
	__asm__ volatile("li a0, 0x80");
    800025ec:	08000513          	li	a0,128
	__asm__ volatile("ecall");
    800025f0:	00000073          	ecall
}
    800025f4:	02813083          	ld	ra,40(sp)
    800025f8:	02013403          	ld	s0,32(sp)
    800025fc:	01813483          	ld	s1,24(sp)
    80002600:	01013903          	ld	s2,16(sp)
    80002604:	00813983          	ld	s3,8(sp)
    80002608:	03010113          	addi	sp,sp,48
    8000260c:	00008067          	ret
	uint64* stack = nullptr;
    80002610:	00000313          	li	t1,0
    80002614:	fc5ff06f          	j	800025d8 <_ZN6ThreadC1EPFvPvES0_+0x50>

0000000080002618 <_ZN6Thread5startEv>:
int Thread::start() {
    80002618:	ff010113          	addi	sp,sp,-16
    8000261c:	00813423          	sd	s0,8(sp)
    80002620:	01010413          	addi	s0,sp,16
	if (myHandle == nullptr) return -1;
    80002624:	00853303          	ld	t1,8(a0) # 1008 <_entry-0x7fffeff8>
    80002628:	02030063          	beqz	t1,80002648 <_ZN6Thread5startEv+0x30>
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000262c:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x81");
    80002630:	08100513          	li	a0,129
	__asm__ volatile("ecall");
    80002634:	00000073          	ecall
	return 0;
    80002638:	00000513          	li	a0,0
}
    8000263c:	00813403          	ld	s0,8(sp)
    80002640:	01010113          	addi	sp,sp,16
    80002644:	00008067          	ret
	if (myHandle == nullptr) return -1;
    80002648:	fff00513          	li	a0,-1
    8000264c:	ff1ff06f          	j	8000263c <_ZN6Thread5startEv+0x24>

0000000080002650 <_ZN6Thread4joinEv>:
void Thread::join() {
    80002650:	ff010113          	addi	sp,sp,-16
    80002654:	00113423          	sd	ra,8(sp)
    80002658:	00813023          	sd	s0,0(sp)
    8000265c:	01010413          	addi	s0,sp,16
	thread_join(myHandle);
    80002660:	00853503          	ld	a0,8(a0)
    80002664:	fffff097          	auipc	ra,0xfffff
    80002668:	de4080e7          	jalr	-540(ra) # 80001448 <_Z11thread_joinP3TCB>
}
    8000266c:	00813083          	ld	ra,8(sp)
    80002670:	00013403          	ld	s0,0(sp)
    80002674:	01010113          	addi	sp,sp,16
    80002678:	00008067          	ret

000000008000267c <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    8000267c:	ff010113          	addi	sp,sp,-16
    80002680:	00113423          	sd	ra,8(sp)
    80002684:	00813023          	sd	s0,0(sp)
    80002688:	01010413          	addi	s0,sp,16
	thread_dispatch();
    8000268c:	fffff097          	auipc	ra,0xfffff
    80002690:	d9c080e7          	jalr	-612(ra) # 80001428 <_Z15thread_dispatchv>
}
    80002694:	00813083          	ld	ra,8(sp)
    80002698:	00013403          	ld	s0,0(sp)
    8000269c:	01010113          	addi	sp,sp,16
    800026a0:	00008067          	ret

00000000800026a4 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t t) {
    800026a4:	ff010113          	addi	sp,sp,-16
    800026a8:	00113423          	sd	ra,8(sp)
    800026ac:	00813023          	sd	s0,0(sp)
    800026b0:	01010413          	addi	s0,sp,16
    800026b4:	00050593          	mv	a1,a0
	Scheduler::putToSleep(TCB::running, t);
    800026b8:	00009797          	auipc	a5,0x9
    800026bc:	3e87b783          	ld	a5,1000(a5) # 8000baa0 <_GLOBAL_OFFSET_TABLE_+0x58>
    800026c0:	0007b503          	ld	a0,0(a5)
    800026c4:	fffff097          	auipc	ra,0xfffff
    800026c8:	410080e7          	jalr	1040(ra) # 80001ad4 <_ZN9Scheduler10putToSleepEP3TCBm>
}
    800026cc:	00000513          	li	a0,0
    800026d0:	00813083          	ld	ra,8(sp)
    800026d4:	00013403          	ld	s0,0(sp)
    800026d8:	01010113          	addi	sp,sp,16
    800026dc:	00008067          	ret

00000000800026e0 <_ZN14PeriodicThread15periodicWrapperEPv>:
}

PeriodicThread::PeriodicThread(time_t period) : Thread(periodicWrapper, this), period(period) {
}

void PeriodicThread::periodicWrapper(void* pThread) {
    800026e0:	fe010113          	addi	sp,sp,-32
    800026e4:	00113c23          	sd	ra,24(sp)
    800026e8:	00813823          	sd	s0,16(sp)
    800026ec:	00913423          	sd	s1,8(sp)
    800026f0:	02010413          	addi	s0,sp,32
    800026f4:	00050493          	mv	s1,a0
	if (pThread != nullptr) {
    800026f8:	02050263          	beqz	a0,8000271c <_ZN14PeriodicThread15periodicWrapperEPv+0x3c>
		PeriodicThread* ptr = (PeriodicThread*)pThread;
		while (1) {
			ptr->periodicActivation();
    800026fc:	0004b783          	ld	a5,0(s1)
    80002700:	0187b783          	ld	a5,24(a5)
    80002704:	00048513          	mv	a0,s1
    80002708:	000780e7          	jalr	a5
			Thread::sleep(ptr->period);
    8000270c:	0204b503          	ld	a0,32(s1)
    80002710:	00000097          	auipc	ra,0x0
    80002714:	f94080e7          	jalr	-108(ra) # 800026a4 <_ZN6Thread5sleepEm>
		while (1) {
    80002718:	fe5ff06f          	j	800026fc <_ZN14PeriodicThread15periodicWrapperEPv+0x1c>
		}
	}
}
    8000271c:	01813083          	ld	ra,24(sp)
    80002720:	01013403          	ld	s0,16(sp)
    80002724:	00813483          	ld	s1,8(sp)
    80002728:	02010113          	addi	sp,sp,32
    8000272c:	00008067          	ret

0000000080002730 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80002730:	fe010113          	addi	sp,sp,-32
    80002734:	00113c23          	sd	ra,24(sp)
    80002738:	00813823          	sd	s0,16(sp)
    8000273c:	00913423          	sd	s1,8(sp)
    80002740:	02010413          	addi	s0,sp,32
    80002744:	00050493          	mv	s1,a0
    80002748:	00009797          	auipc	a5,0x9
    8000274c:	11878793          	addi	a5,a5,280 # 8000b860 <_ZTV6Thread+0x10>
    80002750:	00f53023          	sd	a5,0(a0)
	this->body = wrapper;
    80002754:	00000797          	auipc	a5,0x0
    80002758:	bf078793          	addi	a5,a5,-1040 # 80002344 <_ZN6Thread7wrapperEPv>
    8000275c:	00f53823          	sd	a5,16(a0)
	this->arg = this;
    80002760:	00a53c23          	sd	a0,24(a0)
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    80002764:	00001537          	lui	a0,0x1
    80002768:	fffff097          	auipc	ra,0xfffff
    8000276c:	ba8080e7          	jalr	-1112(ra) # 80001310 <_Z9mem_allocm>
    80002770:	00050313          	mv	t1,a0
	__asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002774:	00030713          	mv	a4,t1
	__asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002778:	0184b303          	ld	t1,24(s1)
    8000277c:	00030693          	mv	a3,t1
			body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002780:	0104b303          	ld	t1,16(s1)
    80002784:	00030613          	mv	a2,t1
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002788:	00848493          	addi	s1,s1,8
    8000278c:	00048593          	mv	a1,s1
	__asm__ volatile("li a0, 0x80");
    80002790:	08000513          	li	a0,128
	__asm__ volatile("ecall");
    80002794:	00000073          	ecall
}
    80002798:	01813083          	ld	ra,24(sp)
    8000279c:	01013403          	ld	s0,16(sp)
    800027a0:	00813483          	ld	s1,8(sp)
    800027a4:	02010113          	addi	sp,sp,32
    800027a8:	00008067          	ret

00000000800027ac <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    800027ac:	ff010113          	addi	sp,sp,-16
    800027b0:	00113423          	sd	ra,8(sp)
    800027b4:	00813023          	sd	s0,0(sp)
    800027b8:	01010413          	addi	s0,sp,16
    800027bc:	00009797          	auipc	a5,0x9
    800027c0:	0cc78793          	addi	a5,a5,204 # 8000b888 <_ZTV9Semaphore+0x10>
    800027c4:	00f53023          	sd	a5,0(a0) # 1000 <_entry-0x7ffff000>
	sem_open(&myHandle, init);
    800027c8:	00850513          	addi	a0,a0,8
    800027cc:	fffff097          	auipc	ra,0xfffff
    800027d0:	cd4080e7          	jalr	-812(ra) # 800014a0 <_Z8sem_openPP4KSemj>
}
    800027d4:	00813083          	ld	ra,8(sp)
    800027d8:	00013403          	ld	s0,0(sp)
    800027dc:	01010113          	addi	sp,sp,16
    800027e0:	00008067          	ret

00000000800027e4 <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    800027e4:	ff010113          	addi	sp,sp,-16
    800027e8:	00113423          	sd	ra,8(sp)
    800027ec:	00813023          	sd	s0,0(sp)
    800027f0:	01010413          	addi	s0,sp,16
	return sem_wait(myHandle);
    800027f4:	00853503          	ld	a0,8(a0)
    800027f8:	fffff097          	auipc	ra,0xfffff
    800027fc:	d10080e7          	jalr	-752(ra) # 80001508 <_Z8sem_waitP4KSem>
}
    80002800:	00813083          	ld	ra,8(sp)
    80002804:	00013403          	ld	s0,0(sp)
    80002808:	01010113          	addi	sp,sp,16
    8000280c:	00008067          	ret

0000000080002810 <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    80002810:	ff010113          	addi	sp,sp,-16
    80002814:	00113423          	sd	ra,8(sp)
    80002818:	00813023          	sd	s0,0(sp)
    8000281c:	01010413          	addi	s0,sp,16
	return sem_signal(myHandle);
    80002820:	00853503          	ld	a0,8(a0)
    80002824:	fffff097          	auipc	ra,0xfffff
    80002828:	d14080e7          	jalr	-748(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    8000282c:	00813083          	ld	ra,8(sp)
    80002830:	00013403          	ld	s0,0(sp)
    80002834:	01010113          	addi	sp,sp,16
    80002838:	00008067          	ret

000000008000283c <_ZN14PeriodicThread9terminateEv>:
void PeriodicThread::terminate() {
    8000283c:	ff010113          	addi	sp,sp,-16
    80002840:	00813423          	sd	s0,8(sp)
    80002844:	01010413          	addi	s0,sp,16
}
    80002848:	00813403          	ld	s0,8(sp)
    8000284c:	01010113          	addi	sp,sp,16
    80002850:	00008067          	ret

0000000080002854 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period) : Thread(periodicWrapper, this), period(period) {
    80002854:	fe010113          	addi	sp,sp,-32
    80002858:	00113c23          	sd	ra,24(sp)
    8000285c:	00813823          	sd	s0,16(sp)
    80002860:	00913423          	sd	s1,8(sp)
    80002864:	01213023          	sd	s2,0(sp)
    80002868:	02010413          	addi	s0,sp,32
    8000286c:	00050493          	mv	s1,a0
    80002870:	00058913          	mv	s2,a1
    80002874:	00050613          	mv	a2,a0
    80002878:	00000597          	auipc	a1,0x0
    8000287c:	e6858593          	addi	a1,a1,-408 # 800026e0 <_ZN14PeriodicThread15periodicWrapperEPv>
    80002880:	00000097          	auipc	ra,0x0
    80002884:	d08080e7          	jalr	-760(ra) # 80002588 <_ZN6ThreadC1EPFvPvES0_>
    80002888:	00009797          	auipc	a5,0x9
    8000288c:	fa878793          	addi	a5,a5,-88 # 8000b830 <_ZTV14PeriodicThread+0x10>
    80002890:	00f4b023          	sd	a5,0(s1)
    80002894:	0324b023          	sd	s2,32(s1)
}
    80002898:	01813083          	ld	ra,24(sp)
    8000289c:	01013403          	ld	s0,16(sp)
    800028a0:	00813483          	ld	s1,8(sp)
    800028a4:	00013903          	ld	s2,0(sp)
    800028a8:	02010113          	addi	sp,sp,32
    800028ac:	00008067          	ret

00000000800028b0 <_ZN7Console4getcEv>:

char Console::getc() {
    800028b0:	ff010113          	addi	sp,sp,-16
    800028b4:	00113423          	sd	ra,8(sp)
    800028b8:	00813023          	sd	s0,0(sp)
    800028bc:	01010413          	addi	s0,sp,16
	return ::getc();
    800028c0:	fffff097          	auipc	ra,0xfffff
    800028c4:	ca8080e7          	jalr	-856(ra) # 80001568 <_Z4getcv>
}
    800028c8:	00813083          	ld	ra,8(sp)
    800028cc:	00013403          	ld	s0,0(sp)
    800028d0:	01010113          	addi	sp,sp,16
    800028d4:	00008067          	ret

00000000800028d8 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    800028d8:	ff010113          	addi	sp,sp,-16
    800028dc:	00113423          	sd	ra,8(sp)
    800028e0:	00813023          	sd	s0,0(sp)
    800028e4:	01010413          	addi	s0,sp,16
	::putc(c);
    800028e8:	fffff097          	auipc	ra,0xfffff
    800028ec:	ca8080e7          	jalr	-856(ra) # 80001590 <_Z4putcc>
}
    800028f0:	00813083          	ld	ra,8(sp)
    800028f4:	00013403          	ld	s0,0(sp)
    800028f8:	01010113          	addi	sp,sp,16
    800028fc:	00008067          	ret

0000000080002900 <_ZN6Thread3runEv>:
	static int sleep(time_t);

protected:
	Thread();

	virtual void run() {}
    80002900:	ff010113          	addi	sp,sp,-16
    80002904:	00813423          	sd	s0,8(sp)
    80002908:	01010413          	addi	s0,sp,16
    8000290c:	00813403          	ld	s0,8(sp)
    80002910:	01010113          	addi	sp,sp,16
    80002914:	00008067          	ret

0000000080002918 <_ZN14PeriodicThread18periodicActivationEv>:
	void terminate();

protected:
	PeriodicThread(time_t period);

	virtual void periodicActivation() {}
    80002918:	ff010113          	addi	sp,sp,-16
    8000291c:	00813423          	sd	s0,8(sp)
    80002920:	01010413          	addi	s0,sp,16
    80002924:	00813403          	ld	s0,8(sp)
    80002928:	01010113          	addi	sp,sp,16
    8000292c:	00008067          	ret

0000000080002930 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80002930:	ff010113          	addi	sp,sp,-16
    80002934:	00113423          	sd	ra,8(sp)
    80002938:	00813023          	sd	s0,0(sp)
    8000293c:	01010413          	addi	s0,sp,16
    80002940:	00009797          	auipc	a5,0x9
    80002944:	ef078793          	addi	a5,a5,-272 # 8000b830 <_ZTV14PeriodicThread+0x10>
    80002948:	00f53023          	sd	a5,0(a0)
    8000294c:	00000097          	auipc	ra,0x0
    80002950:	a2c080e7          	jalr	-1492(ra) # 80002378 <_ZN6ThreadD1Ev>
    80002954:	00813083          	ld	ra,8(sp)
    80002958:	00013403          	ld	s0,0(sp)
    8000295c:	01010113          	addi	sp,sp,16
    80002960:	00008067          	ret

0000000080002964 <_ZN14PeriodicThreadD0Ev>:
    80002964:	fe010113          	addi	sp,sp,-32
    80002968:	00113c23          	sd	ra,24(sp)
    8000296c:	00813823          	sd	s0,16(sp)
    80002970:	00913423          	sd	s1,8(sp)
    80002974:	02010413          	addi	s0,sp,32
    80002978:	00050493          	mv	s1,a0
    8000297c:	00009797          	auipc	a5,0x9
    80002980:	eb478793          	addi	a5,a5,-332 # 8000b830 <_ZTV14PeriodicThread+0x10>
    80002984:	00f53023          	sd	a5,0(a0)
    80002988:	00000097          	auipc	ra,0x0
    8000298c:	9f0080e7          	jalr	-1552(ra) # 80002378 <_ZN6ThreadD1Ev>
    80002990:	00048513          	mv	a0,s1
    80002994:	00000097          	auipc	ra,0x0
    80002998:	b24080e7          	jalr	-1244(ra) # 800024b8 <_ZdlPv>
    8000299c:	01813083          	ld	ra,24(sp)
    800029a0:	01013403          	ld	s0,16(sp)
    800029a4:	00813483          	ld	s1,8(sp)
    800029a8:	02010113          	addi	sp,sp,32
    800029ac:	00008067          	ret

00000000800029b0 <_ZN3TCB7wrapperEv>:
    Riscv::pushRegisters();
    TCB::dispatch();
    Riscv::popRegisters();
}

void TCB::wrapper() {
    800029b0:	ff010113          	addi	sp,sp,-16
    800029b4:	00113423          	sd	ra,8(sp)
    800029b8:	00813023          	sd	s0,0(sp)
    800029bc:	01010413          	addi	s0,sp,16
    //pocetak wrappera se izvrsava u supervisor modu,
    //jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch/yield)
    Riscv::popSppSpie();
    800029c0:	00000097          	auipc	ra,0x0
    800029c4:	308080e7          	jalr	776(ra) # 80002cc8 <_ZN5Riscv10popSppSpieEv>
    //na dalje se izvrsavamo u user modu
    running->threadFunction(running->args);
    800029c8:	00009797          	auipc	a5,0x9
    800029cc:	2207b783          	ld	a5,544(a5) # 8000bbe8 <_ZN3TCB7runningE>
    800029d0:	0107b703          	ld	a4,16(a5)
    800029d4:	0207b503          	ld	a0,32(a5)
    800029d8:	000700e7          	jalr	a4
    //running->finished = true;
    //i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
    thread_exit();
    800029dc:	fffff097          	auipc	ra,0xfffff
    800029e0:	a24080e7          	jalr	-1500(ra) # 80001400 <_Z11thread_exitv>
}
    800029e4:	00813083          	ld	ra,8(sp)
    800029e8:	00013403          	ld	s0,0(sp)
    800029ec:	01010113          	addi	sp,sp,16
    800029f0:	00008067          	ret

00000000800029f4 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    800029f4:	fe010113          	addi	sp,sp,-32
    800029f8:	00113c23          	sd	ra,24(sp)
    800029fc:	00813823          	sd	s0,16(sp)
    80002a00:	00913423          	sd	s1,8(sp)
    80002a04:	02010413          	addi	s0,sp,32
    TCB* old = TCB::running;
    80002a08:	00009497          	auipc	s1,0x9
    80002a0c:	1e04b483          	ld	s1,480(s1) # 8000bbe8 <_ZN3TCB7runningE>
    if (old->status == ACTIVE) {
    80002a10:	0584a703          	lw	a4,88(s1)
    80002a14:	00100793          	li	a5,1
    80002a18:	04f70663          	beq	a4,a5,80002a64 <_ZN3TCB8dispatchEv+0x70>
    TCB::running = Scheduler::get();
    80002a1c:	fffff097          	auipc	ra,0xfffff
    80002a20:	078080e7          	jalr	120(ra) # 80001a94 <_ZN9Scheduler3getEv>
    80002a24:	00050593          	mv	a1,a0
    80002a28:	00009797          	auipc	a5,0x9
    80002a2c:	1c078793          	addi	a5,a5,448 # 8000bbe8 <_ZN3TCB7runningE>
    80002a30:	00a7b023          	sd	a0,0(a5)
    TCB::runningTimeSlice = 0;
    80002a34:	0007b423          	sd	zero,8(a5)
    if (TCB::running->threadFunction == nullptr || TCB::running->threadFunction == kernelConsumerFunction ||
    80002a38:	01053783          	ld	a5,16(a0)
    80002a3c:	02078c63          	beqz	a5,80002a74 <_ZN3TCB8dispatchEv+0x80>
    80002a40:	00009717          	auipc	a4,0x9
    80002a44:	03873703          	ld	a4,56(a4) # 8000ba78 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002a48:	02e78663          	beq	a5,a4,80002a74 <_ZN3TCB8dispatchEv+0x80>
    80002a4c:	00009717          	auipc	a4,0x9
    80002a50:	06c73703          	ld	a4,108(a4) # 8000bab8 <_GLOBAL_OFFSET_TABLE_+0x70>
    80002a54:	02e78063          	beq	a5,a4,80002a74 <_ZN3TCB8dispatchEv+0x80>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002a58:	10000793          	li	a5,256
    80002a5c:	1007b073          	csrc	sstatus,a5
}
    80002a60:	01c0006f          	j	80002a7c <_ZN3TCB8dispatchEv+0x88>
        Scheduler::put(old);
    80002a64:	00048513          	mv	a0,s1
    80002a68:	fffff097          	auipc	ra,0xfffff
    80002a6c:	fe8080e7          	jalr	-24(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
    80002a70:	fadff06f          	j	80002a1c <_ZN3TCB8dispatchEv+0x28>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80002a74:	10000793          	li	a5,256
    80002a78:	1007a073          	csrs	sstatus,a5
    if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    80002a7c:	00b48863          	beq	s1,a1,80002a8c <_ZN3TCB8dispatchEv+0x98>
    80002a80:	00048513          	mv	a0,s1
    80002a84:	ffffe097          	auipc	ra,0xffffe
    80002a88:	78c080e7          	jalr	1932(ra) # 80001210 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80002a8c:	01813083          	ld	ra,24(sp)
    80002a90:	01013403          	ld	s0,16(sp)
    80002a94:	00813483          	ld	s1,8(sp)
    80002a98:	02010113          	addi	sp,sp,32
    80002a9c:	00008067          	ret

0000000080002aa0 <_ZN3TCB5yieldEv>:
void TCB::yield() {
    80002aa0:	ff010113          	addi	sp,sp,-16
    80002aa4:	00113423          	sd	ra,8(sp)
    80002aa8:	00813023          	sd	s0,0(sp)
    80002aac:	01010413          	addi	s0,sp,16
    Riscv::pushRegisters();
    80002ab0:	ffffe097          	auipc	ra,0xffffe
    80002ab4:	550080e7          	jalr	1360(ra) # 80001000 <_ZN5Riscv13pushRegistersEv>
    TCB::dispatch();
    80002ab8:	00000097          	auipc	ra,0x0
    80002abc:	f3c080e7          	jalr	-196(ra) # 800029f4 <_ZN3TCB8dispatchEv>
    Riscv::popRegisters();
    80002ac0:	ffffe097          	auipc	ra,0xffffe
    80002ac4:	5bc080e7          	jalr	1468(ra) # 8000107c <_ZN5Riscv12popRegistersEv>
}
    80002ac8:	00813083          	ld	ra,8(sp)
    80002acc:	00013403          	ld	s0,0(sp)
    80002ad0:	01010113          	addi	sp,sp,16
    80002ad4:	00008067          	ret

0000000080002ad8 <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    80002ad8:	ff010113          	addi	sp,sp,-16
    80002adc:	00113423          	sd	ra,8(sp)
    80002ae0:	00813023          	sd	s0,0(sp)
    80002ae4:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80002ae8:	fffff097          	auipc	ra,0xfffff
    80002aec:	828080e7          	jalr	-2008(ra) # 80001310 <_Z9mem_allocm>
    //return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::THREAD);
}
    80002af0:	00813083          	ld	ra,8(sp)
    80002af4:	00013403          	ld	s0,0(sp)
    80002af8:	01010113          	addi	sp,sp,16
    80002afc:	00008067          	ret

0000000080002b00 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    80002b00:	fd010113          	addi	sp,sp,-48
    80002b04:	02113423          	sd	ra,40(sp)
    80002b08:	02813023          	sd	s0,32(sp)
    80002b0c:	00913c23          	sd	s1,24(sp)
    80002b10:	01213823          	sd	s2,16(sp)
    80002b14:	01313423          	sd	s3,8(sp)
    80002b18:	03010413          	addi	s0,sp,48
    80002b1c:	00050913          	mv	s2,a0
    80002b20:	00058993          	mv	s3,a1
    80002b24:	00060493          	mv	s1,a2
    TCB* newThread = new TCB(function, args, stack);
    80002b28:	06000513          	li	a0,96
    80002b2c:	00000097          	auipc	ra,0x0
    80002b30:	fac080e7          	jalr	-84(ra) # 80002ad8 <_ZN3TCBnwEm>
    ThreadStatus status;    //status niti


    TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
                                                    timeSlice(DEFAULT_TIME_SLICE), nextInScheduler(nullptr), timeToSleep(0),
                                                    nextSleeping(nullptr), status(CREATED) {
    80002b34:	01253823          	sd	s2,16(a0)
    80002b38:	00953c23          	sd	s1,24(a0)
    80002b3c:	03353023          	sd	s3,32(a0)
    80002b40:	00200793          	li	a5,2
    80002b44:	02f53423          	sd	a5,40(a0)
    80002b48:	02053823          	sd	zero,48(a0)
    80002b4c:	02053c23          	sd	zero,56(a0)
    80002b50:	04053023          	sd	zero,64(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    80002b54:	04053423          	sd	zero,72(a0)
    80002b58:	04053823          	sd	zero,80(a0)
    80002b5c:	04052c23          	sw	zero,88(a0)
        //formiranje pocetnog konteksta; specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
        uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80002b60:	02090e63          	beqz	s2,80002b9c <_ZN3TCB12createThreadEPFvPvES0_Pm+0x9c>
    80002b64:	00000797          	auipc	a5,0x0
    80002b68:	e4c78793          	addi	a5,a5,-436 # 800029b0 <_ZN3TCB7wrapperEv>
        uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80002b6c:	02048c63          	beqz	s1,80002ba4 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xa4>
    80002b70:	00008637          	lui	a2,0x8
    80002b74:	00c484b3          	add	s1,s1,a2
        this->context.ra = startRa;
    80002b78:	00f53023          	sd	a5,0(a0)
        this->context.sp = startSp;
    80002b7c:	00953423          	sd	s1,8(a0)
}
    80002b80:	02813083          	ld	ra,40(sp)
    80002b84:	02013403          	ld	s0,32(sp)
    80002b88:	01813483          	ld	s1,24(sp)
    80002b8c:	01013903          	ld	s2,16(sp)
    80002b90:	00813983          	ld	s3,8(sp)
    80002b94:	03010113          	addi	sp,sp,48
    80002b98:	00008067          	ret
        uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80002b9c:	00000793          	li	a5,0
    80002ba0:	fcdff06f          	j	80002b6c <_ZN3TCB12createThreadEPFvPvES0_Pm+0x6c>
        uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80002ba4:	00000493          	li	s1,0
    80002ba8:	fd1ff06f          	j	80002b78 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x78>

0000000080002bac <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    80002bac:	ff010113          	addi	sp,sp,-16
    80002bb0:	00113423          	sd	ra,8(sp)
    80002bb4:	00813023          	sd	s0,0(sp)
    80002bb8:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80002bbc:	ffffe097          	auipc	ra,0xffffe
    80002bc0:	794080e7          	jalr	1940(ra) # 80001350 <_Z8mem_freePv>
    //MemoryAllocator::kfree(ptr);
}
    80002bc4:	00813083          	ld	ra,8(sp)
    80002bc8:	00013403          	ld	s0,0(sp)
    80002bcc:	01010113          	addi	sp,sp,16
    80002bd0:	00008067          	ret

0000000080002bd4 <_ZN3TCB10threadJoinEPS_>:

void TCB::threadJoin(TCB* handle) {
    if (handle->status == FINISHED) return;
    80002bd4:	05852703          	lw	a4,88(a0)
    80002bd8:	00500793          	li	a5,5
    80002bdc:	04f70063          	beq	a4,a5,80002c1c <_ZN3TCB10threadJoinEPS_+0x48>
void TCB::threadJoin(TCB* handle) {
    80002be0:	ff010113          	addi	sp,sp,-16
    80002be4:	00113423          	sd	ra,8(sp)
    80002be8:	00813023          	sd	s0,0(sp)
    80002bec:	01010413          	addi	s0,sp,16
    TCB::running->status = JOINING;
    80002bf0:	00009597          	auipc	a1,0x9
    80002bf4:	ff85b583          	ld	a1,-8(a1) # 8000bbe8 <_ZN3TCB7runningE>
    80002bf8:	00300793          	li	a5,3
    80002bfc:	04f5ac23          	sw	a5,88(a1)
    handle->waitingToJoin.putLast(TCB::running);
    80002c00:	04850513          	addi	a0,a0,72
    80002c04:	ffffe097          	auipc	ra,0xffffe
    80002c08:	640080e7          	jalr	1600(ra) # 80001244 <_ZN11ThreadQueue7putLastEP3TCB>
}
    80002c0c:	00813083          	ld	ra,8(sp)
    80002c10:	00013403          	ld	s0,0(sp)
    80002c14:	01010113          	addi	sp,sp,16
    80002c18:	00008067          	ret
    80002c1c:	00008067          	ret

0000000080002c20 <_ZN3TCB13releaseJoinedEv>:

void TCB::releaseJoined() {
    while (!TCB::running->waitingToJoin.isEmpty()) {
    80002c20:	00009517          	auipc	a0,0x9
    80002c24:	fc853503          	ld	a0,-56(a0) # 8000bbe8 <_ZN3TCB7runningE>
        bool ret = front == nullptr;
    80002c28:	04853783          	ld	a5,72(a0)
    80002c2c:	04078863          	beqz	a5,80002c7c <_ZN3TCB13releaseJoinedEv+0x5c>
void TCB::releaseJoined() {
    80002c30:	ff010113          	addi	sp,sp,-16
    80002c34:	00113423          	sd	ra,8(sp)
    80002c38:	00813023          	sd	s0,0(sp)
    80002c3c:	01010413          	addi	s0,sp,16
        TCB* tcb = TCB::running->waitingToJoin.getFirst();
    80002c40:	04850513          	addi	a0,a0,72
    80002c44:	ffffe097          	auipc	ra,0xffffe
    80002c48:	66c080e7          	jalr	1644(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
        tcb->status = ACTIVE;
    80002c4c:	00100793          	li	a5,1
    80002c50:	04f52c23          	sw	a5,88(a0)
        Scheduler::put(tcb);
    80002c54:	fffff097          	auipc	ra,0xfffff
    80002c58:	dfc080e7          	jalr	-516(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
    while (!TCB::running->waitingToJoin.isEmpty()) {
    80002c5c:	00009517          	auipc	a0,0x9
    80002c60:	f8c53503          	ld	a0,-116(a0) # 8000bbe8 <_ZN3TCB7runningE>
    80002c64:	04853783          	ld	a5,72(a0)
    80002c68:	fc079ce3          	bnez	a5,80002c40 <_ZN3TCB13releaseJoinedEv+0x20>
    }
}
    80002c6c:	00813083          	ld	ra,8(sp)
    80002c70:	00013403          	ld	s0,0(sp)
    80002c74:	01010113          	addi	sp,sp,16
    80002c78:	00008067          	ret
    80002c7c:	00008067          	ret

0000000080002c80 <_ZN3TCB5startEPS_>:

void TCB::start(TCB* newTcb) {
    //startovanje niti(stavljanje u Scheduler); main nit je vec aktivna, ne stavlja se u Scheduler
    if (newTcb->threadFunction != nullptr) {
    80002c80:	01053783          	ld	a5,16(a0)
    80002c84:	04078063          	beqz	a5,80002cc4 <_ZN3TCB5startEPS_+0x44>
void TCB::start(TCB* newTcb) {
    80002c88:	fe010113          	addi	sp,sp,-32
    80002c8c:	00113c23          	sd	ra,24(sp)
    80002c90:	00813823          	sd	s0,16(sp)
    80002c94:	00913423          	sd	s1,8(sp)
    80002c98:	02010413          	addi	s0,sp,32
    80002c9c:	00050493          	mv	s1,a0
        Scheduler::put(newTcb);
    80002ca0:	fffff097          	auipc	ra,0xfffff
    80002ca4:	db0080e7          	jalr	-592(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
        newTcb->status = ACTIVE;
    80002ca8:	00100793          	li	a5,1
    80002cac:	04f4ac23          	sw	a5,88(s1)
    }
}
    80002cb0:	01813083          	ld	ra,24(sp)
    80002cb4:	01013403          	ld	s0,16(sp)
    80002cb8:	00813483          	ld	s1,8(sp)
    80002cbc:	02010113          	addi	sp,sp,32
    80002cc0:	00008067          	ret
    80002cc4:	00008067          	ret

0000000080002cc8 <_ZN5Riscv10popSppSpieEv>:
// Created by os on 5/17/23.
//

#include "../h/Riscv.hpp"

void Riscv::popSppSpie() {
    80002cc8:	ff010113          	addi	sp,sp,-16
    80002ccc:	00813423          	sd	s0,8(sp)
    80002cd0:	01010413          	addi	s0,sp,16
	//ra pokazuje iza ove funkcije na nastavak wrappera
	__asm__ volatile("csrw sepc, ra");
    80002cd4:	14109073          	csrw	sepc,ra
	__asm__ volatile("sret");
    80002cd8:	10200073          	sret
    80002cdc:	00813403          	ld	s0,8(sp)
    80002ce0:	01010113          	addi	sp,sp,16
    80002ce4:	00008067          	ret

0000000080002ce8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>:
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

#pragma GCC optimize("O0")

void* MemoryAllocator::kmalloc(size_t size, Purpose pur) {
    80002ce8:	fa010113          	addi	sp,sp,-96
    80002cec:	04813c23          	sd	s0,88(sp)
    80002cf0:	06010413          	addi	s0,sp,96
    80002cf4:	faa43423          	sd	a0,-88(s0)
    80002cf8:	00058793          	mv	a5,a1
    80002cfc:	faf42223          	sw	a5,-92(s0)
    //size je u broju bajtova, ukljucuje i mesto potrebno za zaglavlje UsedMemSegment
    if (size <= 0) return nullptr;
    80002d00:	fa843783          	ld	a5,-88(s0)
    80002d04:	00079663          	bnez	a5,80002d10 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x28>
    80002d08:	00000793          	li	a5,0
    80002d0c:	2740006f          	j	80002f80 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x298>
//        printString("Greska");
//    }

    //alokacija uvek zaokruzena na blokove
    //size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
    size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80002d10:	fa843783          	ld	a5,-88(s0)
    80002d14:	0067d713          	srli	a4,a5,0x6
    80002d18:	fa843783          	ld	a5,-88(s0)
    80002d1c:	03f7f793          	andi	a5,a5,63
    80002d20:	00078663          	beqz	a5,80002d2c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x44>
    80002d24:	00100793          	li	a5,1
    80002d28:	0080006f          	j	80002d30 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x48>
    80002d2c:	00000793          	li	a5,0
    80002d30:	00e787b3          	add	a5,a5,a4
    80002d34:	fcf43823          	sd	a5,-48(s0)
    size = blocks * MEM_BLOCK_SIZE;
    80002d38:	fd043783          	ld	a5,-48(s0)
    80002d3c:	00679793          	slli	a5,a5,0x6
    80002d40:	faf43423          	sd	a5,-88(s0)

    //trazenje slobodnog segmenta po first-fit algoritmu
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; firstFit = firstFit->next) {
    80002d44:	00009797          	auipc	a5,0x9
    80002d48:	ebc78793          	addi	a5,a5,-324 # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80002d4c:	0007b783          	ld	a5,0(a5)
    80002d50:	fef43423          	sd	a5,-24(s0)
    80002d54:	fe843783          	ld	a5,-24(s0)
    80002d58:	22078263          	beqz	a5,80002f7c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x294>
        if (firstFit->size < size) continue;
    80002d5c:	fe843783          	ld	a5,-24(s0)
    80002d60:	0107b783          	ld	a5,16(a5)
    80002d64:	fa843703          	ld	a4,-88(s0)
    80002d68:	20e7e063          	bltu	a5,a4,80002f68 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x280>

        //pravljenje novog slobodnog fragmenta od ostatka fragmenta
        FreeMemSegment* remainderFree = (FreeMemSegment*) ((char*) firstFit + size);
    80002d6c:	fe843703          	ld	a4,-24(s0)
    80002d70:	fa843783          	ld	a5,-88(s0)
    80002d74:	00f707b3          	add	a5,a4,a5
    80002d78:	fcf43423          	sd	a5,-56(s0)
        size_t remainingSize = firstFit->size - size;
    80002d7c:	fe843783          	ld	a5,-24(s0)
    80002d80:	0107b703          	ld	a4,16(a5)
    80002d84:	fa843783          	ld	a5,-88(s0)
    80002d88:	40f707b3          	sub	a5,a4,a5
    80002d8c:	fcf43023          	sd	a5,-64(s0)
        if (remainingSize <= sizeof(UsedMemSegment)) {
    80002d90:	fc043703          	ld	a4,-64(s0)
    80002d94:	02000793          	li	a5,32
    80002d98:	08e7e063          	bltu	a5,a4,80002e18 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x130>
            //ne preostaje dovoljno veliki slobodni segment;dodeljujemo ceo trenutno alociranom
            size += remainingSize;
    80002d9c:	fa843703          	ld	a4,-88(s0)
    80002da0:	fc043783          	ld	a5,-64(s0)
    80002da4:	00f707b3          	add	a5,a4,a5
    80002da8:	faf43423          	sd	a5,-88(s0)
            if (firstFit->prev) firstFit->prev->next = firstFit->next;
    80002dac:	fe843783          	ld	a5,-24(s0)
    80002db0:	0087b783          	ld	a5,8(a5)
    80002db4:	00078c63          	beqz	a5,80002dcc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xe4>
    80002db8:	fe843783          	ld	a5,-24(s0)
    80002dbc:	0087b783          	ld	a5,8(a5)
    80002dc0:	fe843703          	ld	a4,-24(s0)
    80002dc4:	00073703          	ld	a4,0(a4)
    80002dc8:	00e7b023          	sd	a4,0(a5)
            if (firstFit->next) firstFit->next->prev = firstFit->prev;
    80002dcc:	fe843783          	ld	a5,-24(s0)
    80002dd0:	0007b783          	ld	a5,0(a5)
    80002dd4:	00078c63          	beqz	a5,80002dec <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x104>
    80002dd8:	fe843783          	ld	a5,-24(s0)
    80002ddc:	0007b783          	ld	a5,0(a5)
    80002de0:	fe843703          	ld	a4,-24(s0)
    80002de4:	00873703          	ld	a4,8(a4)
    80002de8:	00e7b423          	sd	a4,8(a5)
            if (freeMemHead == firstFit) {
    80002dec:	00009797          	auipc	a5,0x9
    80002df0:	e1478793          	addi	a5,a5,-492 # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80002df4:	0007b783          	ld	a5,0(a5)
    80002df8:	fe843703          	ld	a4,-24(s0)
    80002dfc:	0af71263          	bne	a4,a5,80002ea0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b8>
                freeMemHead = firstFit->next;
    80002e00:	fe843783          	ld	a5,-24(s0)
    80002e04:	0007b703          	ld	a4,0(a5)
    80002e08:	00009797          	auipc	a5,0x9
    80002e0c:	df878793          	addi	a5,a5,-520 # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80002e10:	00e7b023          	sd	a4,0(a5)
    80002e14:	08c0006f          	j	80002ea0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b8>
            }
        } else {
            remainderFree->size = remainingSize;
    80002e18:	fc843783          	ld	a5,-56(s0)
    80002e1c:	fc043703          	ld	a4,-64(s0)
    80002e20:	00e7b823          	sd	a4,16(a5)
            remainderFree->prev = firstFit->prev;
    80002e24:	fe843783          	ld	a5,-24(s0)
    80002e28:	0087b703          	ld	a4,8(a5)
    80002e2c:	fc843783          	ld	a5,-56(s0)
    80002e30:	00e7b423          	sd	a4,8(a5)
            if (firstFit->prev) firstFit->prev->next = remainderFree;
    80002e34:	fe843783          	ld	a5,-24(s0)
    80002e38:	0087b783          	ld	a5,8(a5)
    80002e3c:	00078a63          	beqz	a5,80002e50 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x168>
    80002e40:	fe843783          	ld	a5,-24(s0)
    80002e44:	0087b783          	ld	a5,8(a5)
    80002e48:	fc843703          	ld	a4,-56(s0)
    80002e4c:	00e7b023          	sd	a4,0(a5)
            remainderFree->next = firstFit->next;
    80002e50:	fe843783          	ld	a5,-24(s0)
    80002e54:	0007b703          	ld	a4,0(a5)
    80002e58:	fc843783          	ld	a5,-56(s0)
    80002e5c:	00e7b023          	sd	a4,0(a5)
            if (firstFit->next) firstFit->next->prev = remainderFree;
    80002e60:	fe843783          	ld	a5,-24(s0)
    80002e64:	0007b783          	ld	a5,0(a5)
    80002e68:	00078a63          	beqz	a5,80002e7c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x194>
    80002e6c:	fe843783          	ld	a5,-24(s0)
    80002e70:	0007b783          	ld	a5,0(a5)
    80002e74:	fc843703          	ld	a4,-56(s0)
    80002e78:	00e7b423          	sd	a4,8(a5)
            if (freeMemHead == firstFit) {
    80002e7c:	00009797          	auipc	a5,0x9
    80002e80:	d8478793          	addi	a5,a5,-636 # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80002e84:	0007b783          	ld	a5,0(a5)
    80002e88:	fe843703          	ld	a4,-24(s0)
    80002e8c:	00f71a63          	bne	a4,a5,80002ea0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b8>
                freeMemHead = remainderFree;
    80002e90:	00009797          	auipc	a5,0x9
    80002e94:	d7078793          	addi	a5,a5,-656 # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80002e98:	fc843703          	ld	a4,-56(s0)
    80002e9c:	00e7b023          	sd	a4,0(a5)
            }
        }
        //ubacivanje novog fragmenta u listu zauzetih fragmenata
        UsedMemSegment* newFragment = (UsedMemSegment*) firstFit;
    80002ea0:	fe843783          	ld	a5,-24(s0)
    80002ea4:	faf43c23          	sd	a5,-72(s0)
        newFragment->size = size;
    80002ea8:	fb843783          	ld	a5,-72(s0)
    80002eac:	fa843703          	ld	a4,-88(s0)
    80002eb0:	00e7b423          	sd	a4,8(a5)
        newFragment->purpose = pur;
    80002eb4:	fb843783          	ld	a5,-72(s0)
    80002eb8:	fa442703          	lw	a4,-92(s0)
    80002ebc:	00e7a823          	sw	a4,16(a5)
        newFragment->usableFirstAddress = (char*) newFragment + sizeof(UsedMemSegment);
    80002ec0:	fb843783          	ld	a5,-72(s0)
    80002ec4:	02078713          	addi	a4,a5,32
    80002ec8:	fb843783          	ld	a5,-72(s0)
    80002ecc:	00e7bc23          	sd	a4,24(a5)
        UsedMemSegment* prevUsed = nullptr;
    80002ed0:	fe043023          	sd	zero,-32(s0)
        for (UsedMemSegment* cur = usedMemHead;
    80002ed4:	00009797          	auipc	a5,0x9
    80002ed8:	d2478793          	addi	a5,a5,-732 # 8000bbf8 <_ZN15MemoryAllocator11usedMemHeadE>
    80002edc:	0007b783          	ld	a5,0(a5)
    80002ee0:	fcf43c23          	sd	a5,-40(s0)
             cur && ((char*) cur < (char*) newFragment); cur = cur->next) {
    80002ee4:	fd843783          	ld	a5,-40(s0)
    80002ee8:	02078463          	beqz	a5,80002f10 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
    80002eec:	fd843703          	ld	a4,-40(s0)
    80002ef0:	fb843783          	ld	a5,-72(s0)
    80002ef4:	00f77e63          	bgeu	a4,a5,80002f10 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
            prevUsed = cur;
    80002ef8:	fd843783          	ld	a5,-40(s0)
    80002efc:	fef43023          	sd	a5,-32(s0)
             cur && ((char*) cur < (char*) newFragment); cur = cur->next) {
    80002f00:	fd843783          	ld	a5,-40(s0)
    80002f04:	0007b783          	ld	a5,0(a5)
    80002f08:	fcf43c23          	sd	a5,-40(s0)
        for (UsedMemSegment* cur = usedMemHead;
    80002f0c:	fd9ff06f          	j	80002ee4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1fc>
        }
        if (!prevUsed) {
    80002f10:	fe043783          	ld	a5,-32(s0)
    80002f14:	02079663          	bnez	a5,80002f40 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x258>
            newFragment->next = usedMemHead;
    80002f18:	00009797          	auipc	a5,0x9
    80002f1c:	ce078793          	addi	a5,a5,-800 # 8000bbf8 <_ZN15MemoryAllocator11usedMemHeadE>
    80002f20:	0007b703          	ld	a4,0(a5)
    80002f24:	fb843783          	ld	a5,-72(s0)
    80002f28:	00e7b023          	sd	a4,0(a5)
            usedMemHead = newFragment;
    80002f2c:	00009797          	auipc	a5,0x9
    80002f30:	ccc78793          	addi	a5,a5,-820 # 8000bbf8 <_ZN15MemoryAllocator11usedMemHeadE>
    80002f34:	fb843703          	ld	a4,-72(s0)
    80002f38:	00e7b023          	sd	a4,0(a5)
    80002f3c:	0200006f          	j	80002f5c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x274>
        } else {
            newFragment->next = prevUsed->next;
    80002f40:	fe043783          	ld	a5,-32(s0)
    80002f44:	0007b703          	ld	a4,0(a5)
    80002f48:	fb843783          	ld	a5,-72(s0)
    80002f4c:	00e7b023          	sd	a4,0(a5)
            prevUsed->next = newFragment;
    80002f50:	fe043783          	ld	a5,-32(s0)
    80002f54:	fb843703          	ld	a4,-72(s0)
    80002f58:	00e7b023          	sd	a4,0(a5)
        }
        //return (char*)newFragment + sizeof(UsedMemSegment);
        return newFragment->usableFirstAddress;
    80002f5c:	fb843783          	ld	a5,-72(s0)
    80002f60:	0187b783          	ld	a5,24(a5)
    80002f64:	01c0006f          	j	80002f80 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x298>
        if (firstFit->size < size) continue;
    80002f68:	00000013          	nop
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; firstFit = firstFit->next) {
    80002f6c:	fe843783          	ld	a5,-24(s0)
    80002f70:	0007b783          	ld	a5,0(a5)
    80002f74:	fef43423          	sd	a5,-24(s0)
    80002f78:	dddff06f          	j	80002d54 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x6c>
    }
    return nullptr;
    80002f7c:	00000793          	li	a5,0
}
    80002f80:	00078513          	mv	a0,a5
    80002f84:	05813403          	ld	s0,88(sp)
    80002f88:	06010113          	addi	sp,sp,96
    80002f8c:	00008067          	ret

0000000080002f90 <_ZN15MemoryAllocator5kfreeEPv>:

#pragma GCC optimize("O0")

int MemoryAllocator::kfree(void* ptr) {
    80002f90:	fb010113          	addi	sp,sp,-80
    80002f94:	04113423          	sd	ra,72(sp)
    80002f98:	04813023          	sd	s0,64(sp)
    80002f9c:	05010413          	addi	s0,sp,80
    80002fa0:	faa43c23          	sd	a0,-72(s0)
    if (!ptr) return 0;
    80002fa4:	fb843783          	ld	a5,-72(s0)
    80002fa8:	00079663          	bnez	a5,80002fb4 <_ZN15MemoryAllocator5kfreeEPv+0x24>
    80002fac:	00000793          	li	a5,0
    80002fb0:	1d40006f          	j	80003184 <_ZN15MemoryAllocator5kfreeEPv+0x1f4>
    if (!usedMemHead) return -1;
    80002fb4:	00009797          	auipc	a5,0x9
    80002fb8:	c4478793          	addi	a5,a5,-956 # 8000bbf8 <_ZN15MemoryAllocator11usedMemHeadE>
    80002fbc:	0007b783          	ld	a5,0(a5)
    80002fc0:	00079663          	bnez	a5,80002fcc <_ZN15MemoryAllocator5kfreeEPv+0x3c>
    80002fc4:	fff00793          	li	a5,-1
    80002fc8:	1bc0006f          	j	80003184 <_ZN15MemoryAllocator5kfreeEPv+0x1f4>
    //ptr pokazuje na usableFirstAddress, pre toga je zaglavlje segmenta
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    80002fcc:	fb843783          	ld	a5,-72(s0)
    80002fd0:	fe078793          	addi	a5,a5,-32
    80002fd4:	faf43c23          	sd	a5,-72(s0)

    //trazenje adrese ptr u listi zauzetih segmenata
    UsedMemSegment* currentUsed = usedMemHead;
    80002fd8:	00009797          	auipc	a5,0x9
    80002fdc:	c2078793          	addi	a5,a5,-992 # 8000bbf8 <_ZN15MemoryAllocator11usedMemHeadE>
    80002fe0:	0007b783          	ld	a5,0(a5)
    80002fe4:	fef43423          	sd	a5,-24(s0)
    UsedMemSegment* prevUsed = nullptr;
    80002fe8:	fe043023          	sd	zero,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    80002fec:	fe843783          	ld	a5,-24(s0)
    80002ff0:	02078463          	beqz	a5,80003018 <_ZN15MemoryAllocator5kfreeEPv+0x88>
    80002ff4:	fe843703          	ld	a4,-24(s0)
    80002ff8:	fb843783          	ld	a5,-72(s0)
    80002ffc:	00f70e63          	beq	a4,a5,80003018 <_ZN15MemoryAllocator5kfreeEPv+0x88>
        prevUsed = currentUsed;
    80003000:	fe843783          	ld	a5,-24(s0)
    80003004:	fef43023          	sd	a5,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    80003008:	fe843783          	ld	a5,-24(s0)
    8000300c:	0007b783          	ld	a5,0(a5)
    80003010:	fef43423          	sd	a5,-24(s0)
    80003014:	fd9ff06f          	j	80002fec <_ZN15MemoryAllocator5kfreeEPv+0x5c>
    }
    if ((char*) currentUsed != (char*) ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80003018:	fe843703          	ld	a4,-24(s0)
    8000301c:	fb843783          	ld	a5,-72(s0)
    80003020:	00f70663          	beq	a4,a5,8000302c <_ZN15MemoryAllocator5kfreeEPv+0x9c>
    80003024:	fff00793          	li	a5,-1
    80003028:	15c0006f          	j	80003184 <_ZN15MemoryAllocator5kfreeEPv+0x1f4>

    //prevezivanje liste zauzetih segmenata
    if (prevUsed) prevUsed->next = currentUsed->next;
    8000302c:	fe043783          	ld	a5,-32(s0)
    80003030:	00078c63          	beqz	a5,80003048 <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    80003034:	fe843783          	ld	a5,-24(s0)
    80003038:	0007b703          	ld	a4,0(a5)
    8000303c:	fe043783          	ld	a5,-32(s0)
    80003040:	00e7b023          	sd	a4,0(a5)
    80003044:	0180006f          	j	8000305c <_ZN15MemoryAllocator5kfreeEPv+0xcc>
    else usedMemHead = currentUsed->next;
    80003048:	fe843783          	ld	a5,-24(s0)
    8000304c:	0007b703          	ld	a4,0(a5)
    80003050:	00009797          	auipc	a5,0x9
    80003054:	ba878793          	addi	a5,a5,-1112 # 8000bbf8 <_ZN15MemoryAllocator11usedMemHeadE>
    80003058:	00e7b023          	sd	a4,0(a5)

    //oslobadjanje segmenta i ubacivanje u listu slobodnih
    FreeMemSegment* prevFree = nullptr;
    8000305c:	fc043c23          	sd	zero,-40(s0)
    if (!freeMemHead || ((char*) ptr < (char*) freeMemHead)) {
    80003060:	00009797          	auipc	a5,0x9
    80003064:	ba078793          	addi	a5,a5,-1120 # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80003068:	0007b783          	ld	a5,0(a5)
    8000306c:	00078c63          	beqz	a5,80003084 <_ZN15MemoryAllocator5kfreeEPv+0xf4>
    80003070:	00009797          	auipc	a5,0x9
    80003074:	b9078793          	addi	a5,a5,-1136 # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80003078:	0007b783          	ld	a5,0(a5)
    8000307c:	fb843703          	ld	a4,-72(s0)
    80003080:	00f77663          	bgeu	a4,a5,8000308c <_ZN15MemoryAllocator5kfreeEPv+0xfc>
        prevFree = nullptr;
    80003084:	fc043c23          	sd	zero,-40(s0)
    80003088:	0400006f          	j	800030c8 <_ZN15MemoryAllocator5kfreeEPv+0x138>
    } else {
        for (prevFree = freeMemHead;
    8000308c:	00009797          	auipc	a5,0x9
    80003090:	b7478793          	addi	a5,a5,-1164 # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80003094:	0007b783          	ld	a5,0(a5)
    80003098:	fcf43c23          	sd	a5,-40(s0)
             prevFree->next && (char*) ptr > (char*) (prevFree->next); prevFree = prevFree->next);
    8000309c:	fd843783          	ld	a5,-40(s0)
    800030a0:	0007b783          	ld	a5,0(a5)
    800030a4:	02078263          	beqz	a5,800030c8 <_ZN15MemoryAllocator5kfreeEPv+0x138>
    800030a8:	fd843783          	ld	a5,-40(s0)
    800030ac:	0007b783          	ld	a5,0(a5)
    800030b0:	fb843703          	ld	a4,-72(s0)
    800030b4:	00e7fa63          	bgeu	a5,a4,800030c8 <_ZN15MemoryAllocator5kfreeEPv+0x138>
    800030b8:	fd843783          	ld	a5,-40(s0)
    800030bc:	0007b783          	ld	a5,0(a5)
    800030c0:	fcf43c23          	sd	a5,-40(s0)
        for (prevFree = freeMemHead;
    800030c4:	fd9ff06f          	j	8000309c <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    }
    FreeMemSegment* newFree = (FreeMemSegment*) ptr;
    800030c8:	fb843783          	ld	a5,-72(s0)
    800030cc:	fcf43823          	sd	a5,-48(s0)
    size_t segmentSize = ((UsedMemSegment*) ptr)->size;
    800030d0:	fb843783          	ld	a5,-72(s0)
    800030d4:	0087b783          	ld	a5,8(a5)
    800030d8:	fcf43423          	sd	a5,-56(s0)
    newFree->size = segmentSize;
    800030dc:	fd043783          	ld	a5,-48(s0)
    800030e0:	fc843703          	ld	a4,-56(s0)
    800030e4:	00e7b823          	sd	a4,16(a5)
    newFree->prev = prevFree;
    800030e8:	fd043783          	ld	a5,-48(s0)
    800030ec:	fd843703          	ld	a4,-40(s0)
    800030f0:	00e7b423          	sd	a4,8(a5)
    if (prevFree) newFree->next = prevFree->next;
    800030f4:	fd843783          	ld	a5,-40(s0)
    800030f8:	00078c63          	beqz	a5,80003110 <_ZN15MemoryAllocator5kfreeEPv+0x180>
    800030fc:	fd843783          	ld	a5,-40(s0)
    80003100:	0007b703          	ld	a4,0(a5)
    80003104:	fd043783          	ld	a5,-48(s0)
    80003108:	00e7b023          	sd	a4,0(a5)
    8000310c:	0180006f          	j	80003124 <_ZN15MemoryAllocator5kfreeEPv+0x194>
    else newFree->next = freeMemHead;
    80003110:	00009797          	auipc	a5,0x9
    80003114:	af078793          	addi	a5,a5,-1296 # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80003118:	0007b703          	ld	a4,0(a5)
    8000311c:	fd043783          	ld	a5,-48(s0)
    80003120:	00e7b023          	sd	a4,0(a5)
    if (newFree->next) newFree->next->prev = newFree;
    80003124:	fd043783          	ld	a5,-48(s0)
    80003128:	0007b783          	ld	a5,0(a5)
    8000312c:	00078a63          	beqz	a5,80003140 <_ZN15MemoryAllocator5kfreeEPv+0x1b0>
    80003130:	fd043783          	ld	a5,-48(s0)
    80003134:	0007b783          	ld	a5,0(a5)
    80003138:	fd043703          	ld	a4,-48(s0)
    8000313c:	00e7b423          	sd	a4,8(a5)
    if (prevFree) prevFree->next = newFree;
    80003140:	fd843783          	ld	a5,-40(s0)
    80003144:	00078a63          	beqz	a5,80003158 <_ZN15MemoryAllocator5kfreeEPv+0x1c8>
    80003148:	fd843783          	ld	a5,-40(s0)
    8000314c:	fd043703          	ld	a4,-48(s0)
    80003150:	00e7b023          	sd	a4,0(a5)
    80003154:	0140006f          	j	80003168 <_ZN15MemoryAllocator5kfreeEPv+0x1d8>
    else freeMemHead = newFree;
    80003158:	00009797          	auipc	a5,0x9
    8000315c:	aa878793          	addi	a5,a5,-1368 # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80003160:	fd043703          	ld	a4,-48(s0)
    80003164:	00e7b023          	sd	a4,0(a5)

    //spajanje uzastopnih slobodnih segmenata
    tryToJoin(newFree);
    80003168:	fd043503          	ld	a0,-48(s0)
    8000316c:	00000097          	auipc	ra,0x0
    80003170:	02c080e7          	jalr	44(ra) # 80003198 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    tryToJoin(prevFree);
    80003174:	fd843503          	ld	a0,-40(s0)
    80003178:	00000097          	auipc	ra,0x0
    8000317c:	020080e7          	jalr	32(ra) # 80003198 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    return 0;
    80003180:	00000793          	li	a5,0
}
    80003184:	00078513          	mv	a0,a5
    80003188:	04813083          	ld	ra,72(sp)
    8000318c:	04013403          	ld	s0,64(sp)
    80003190:	05010113          	addi	sp,sp,80
    80003194:	00008067          	ret

0000000080003198 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:

#pragma GCC optimize("O0")

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    80003198:	fc010113          	addi	sp,sp,-64
    8000319c:	02813c23          	sd	s0,56(sp)
    800031a0:	04010413          	addi	s0,sp,64
    800031a4:	fca43423          	sd	a0,-56(s0)
    if (!current) return 0;
    800031a8:	fc843783          	ld	a5,-56(s0)
    800031ac:	00079663          	bnez	a5,800031b8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x20>
    800031b0:	00000793          	li	a5,0
    800031b4:	0bc0006f          	j	80003270 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xd8>
    bool nextExists = current->next != nullptr;
    800031b8:	fc843783          	ld	a5,-56(s0)
    800031bc:	0007b783          	ld	a5,0(a5)
    800031c0:	00f037b3          	snez	a5,a5
    800031c4:	fef407a3          	sb	a5,-17(s0)
    char* nextAddr = (char*) current + current->size;
    800031c8:	fc843783          	ld	a5,-56(s0)
    800031cc:	0107b783          	ld	a5,16(a5)
    800031d0:	fc843703          	ld	a4,-56(s0)
    800031d4:	00f707b3          	add	a5,a4,a5
    800031d8:	fef43023          	sd	a5,-32(s0)
    char* cnext = (char*) current->next;
    800031dc:	fc843783          	ld	a5,-56(s0)
    800031e0:	0007b783          	ld	a5,0(a5)
    800031e4:	fcf43c23          	sd	a5,-40(s0)
    bool nextIsConnected = (nextAddr == cnext);
    800031e8:	fe043703          	ld	a4,-32(s0)
    800031ec:	fd843783          	ld	a5,-40(s0)
    800031f0:	40f707b3          	sub	a5,a4,a5
    800031f4:	0017b793          	seqz	a5,a5
    800031f8:	fcf40ba3          	sb	a5,-41(s0)
    if (nextExists && nextIsConnected) {
    800031fc:	fef44783          	lbu	a5,-17(s0)
    80003200:	0ff7f793          	andi	a5,a5,255
    80003204:	06078463          	beqz	a5,8000326c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xd4>
    80003208:	fd744783          	lbu	a5,-41(s0)
    8000320c:	0ff7f793          	andi	a5,a5,255
    80003210:	04078e63          	beqz	a5,8000326c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xd4>
        current->size += current->next->size;
    80003214:	fc843783          	ld	a5,-56(s0)
    80003218:	0107b703          	ld	a4,16(a5)
    8000321c:	fc843783          	ld	a5,-56(s0)
    80003220:	0007b783          	ld	a5,0(a5)
    80003224:	0107b783          	ld	a5,16(a5)
    80003228:	00f70733          	add	a4,a4,a5
    8000322c:	fc843783          	ld	a5,-56(s0)
    80003230:	00e7b823          	sd	a4,16(a5)
        current->next = current->next->next;
    80003234:	fc843783          	ld	a5,-56(s0)
    80003238:	0007b783          	ld	a5,0(a5)
    8000323c:	0007b703          	ld	a4,0(a5)
    80003240:	fc843783          	ld	a5,-56(s0)
    80003244:	00e7b023          	sd	a4,0(a5)
        if (current->next) current->next->prev = current;
    80003248:	fc843783          	ld	a5,-56(s0)
    8000324c:	0007b783          	ld	a5,0(a5)
    80003250:	00078a63          	beqz	a5,80003264 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xcc>
    80003254:	fc843783          	ld	a5,-56(s0)
    80003258:	0007b783          	ld	a5,0(a5)
    8000325c:	fc843703          	ld	a4,-56(s0)
    80003260:	00e7b423          	sd	a4,8(a5)
        return 1;
    80003264:	00100793          	li	a5,1
    80003268:	0080006f          	j	80003270 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xd8>
    } else return 0;
    8000326c:	00000793          	li	a5,0
}
    80003270:	00078513          	mv	a0,a5
    80003274:	03813403          	ld	s0,56(sp)
    80003278:	04010113          	addi	sp,sp,64
    8000327c:	00008067          	ret

0000000080003280 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>:

bool MemoryAllocator::checkPurpose(void* ptr, MemoryAllocator::Purpose p) {
    80003280:	fe010113          	addi	sp,sp,-32
    80003284:	00813c23          	sd	s0,24(sp)
    80003288:	02010413          	addi	s0,sp,32
    8000328c:	fea43423          	sd	a0,-24(s0)
    80003290:	00058793          	mv	a5,a1
    80003294:	fef42223          	sw	a5,-28(s0)
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    80003298:	fe843783          	ld	a5,-24(s0)
    8000329c:	fe078793          	addi	a5,a5,-32
    800032a0:	fef43423          	sd	a5,-24(s0)
    return ((UsedMemSegment*) ptr)->purpose == p;
    800032a4:	fe843783          	ld	a5,-24(s0)
    800032a8:	0107a703          	lw	a4,16(a5)
    800032ac:	fe442783          	lw	a5,-28(s0)
    800032b0:	0007879b          	sext.w	a5,a5
    800032b4:	40e787b3          	sub	a5,a5,a4
    800032b8:	0017b793          	seqz	a5,a5
    800032bc:	0ff7f793          	andi	a5,a5,255
}
    800032c0:	00078513          	mv	a0,a5
    800032c4:	01813403          	ld	s0,24(sp)
    800032c8:	02010113          	addi	sp,sp,32
    800032cc:	00008067          	ret

00000000800032d0 <_ZN15MemoryAllocator19initMemoryAllocatorEv>:

void MemoryAllocator::initMemoryAllocator() {
    800032d0:	ff010113          	addi	sp,sp,-16
    800032d4:	00813423          	sd	s0,8(sp)
    800032d8:	01010413          	addi	s0,sp,16
//pocetna inicijalizacija
    if (!initialized) {
    800032dc:	00009797          	auipc	a5,0x9
    800032e0:	92c78793          	addi	a5,a5,-1748 # 8000bc08 <_ZN15MemoryAllocator11initializedE>
    800032e4:	0007c783          	lbu	a5,0(a5)
    800032e8:	0017c793          	xori	a5,a5,1
    800032ec:	0ff7f793          	andi	a5,a5,255
    800032f0:	08078263          	beqz	a5,80003374 <_ZN15MemoryAllocator19initMemoryAllocatorEv+0xa4>
        freeMemHead = (FreeMemSegment*) HEAP_START_ADDR;
    800032f4:	00008797          	auipc	a5,0x8
    800032f8:	77c7b783          	ld	a5,1916(a5) # 8000ba70 <_GLOBAL_OFFSET_TABLE_+0x28>
    800032fc:	0007b703          	ld	a4,0(a5)
    80003300:	00009797          	auipc	a5,0x9
    80003304:	90078793          	addi	a5,a5,-1792 # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80003308:	00e7b023          	sd	a4,0(a5)
        freeMemHead->next = nullptr;
    8000330c:	00009797          	auipc	a5,0x9
    80003310:	8f478793          	addi	a5,a5,-1804 # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80003314:	0007b783          	ld	a5,0(a5)
    80003318:	0007b023          	sd	zero,0(a5)
        freeMemHead->prev = nullptr;
    8000331c:	00009797          	auipc	a5,0x9
    80003320:	8e478793          	addi	a5,a5,-1820 # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80003324:	0007b783          	ld	a5,0(a5)
    80003328:	0007b423          	sd	zero,8(a5)
        freeMemHead->size = (char*) HEAP_END_ADDR - (char*) HEAP_START_ADDR;//- sizeof(FreeMemSegment);
    8000332c:	00008797          	auipc	a5,0x8
    80003330:	77c7b783          	ld	a5,1916(a5) # 8000baa8 <_GLOBAL_OFFSET_TABLE_+0x60>
    80003334:	0007b703          	ld	a4,0(a5)
    80003338:	00008797          	auipc	a5,0x8
    8000333c:	7387b783          	ld	a5,1848(a5) # 8000ba70 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003340:	0007b783          	ld	a5,0(a5)
    80003344:	40f70733          	sub	a4,a4,a5
    80003348:	00009797          	auipc	a5,0x9
    8000334c:	8b878793          	addi	a5,a5,-1864 # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80003350:	0007b783          	ld	a5,0(a5)
    80003354:	00e7b823          	sd	a4,16(a5)
        usedMemHead = nullptr;
    80003358:	00009797          	auipc	a5,0x9
    8000335c:	8a078793          	addi	a5,a5,-1888 # 8000bbf8 <_ZN15MemoryAllocator11usedMemHeadE>
    80003360:	0007b023          	sd	zero,0(a5)

        initialized = true;
    80003364:	00009797          	auipc	a5,0x9
    80003368:	8a478793          	addi	a5,a5,-1884 # 8000bc08 <_ZN15MemoryAllocator11initializedE>
    8000336c:	00100713          	li	a4,1
    80003370:	00e78023          	sb	a4,0(a5)
    }
}
    80003374:	00000013          	nop
    80003378:	00813403          	ld	s0,8(sp)
    8000337c:	01010113          	addi	sp,sp,16
    80003380:	00008067          	ret

0000000080003384 <_ZN4KSemnwEm>:

#include "../h/KSem.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void* KSem::operator new(size_t size) {
    80003384:	ff010113          	addi	sp,sp,-16
    80003388:	00113423          	sd	ra,8(sp)
    8000338c:	00813023          	sd	s0,0(sp)
    80003390:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80003394:	ffffe097          	auipc	ra,0xffffe
    80003398:	f7c080e7          	jalr	-132(ra) # 80001310 <_Z9mem_allocm>
	//return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::SEMAPHORE);
}
    8000339c:	00813083          	ld	ra,8(sp)
    800033a0:	00013403          	ld	s0,0(sp)
    800033a4:	01010113          	addi	sp,sp,16
    800033a8:	00008067          	ret

00000000800033ac <_ZN4KSemdlEPv>:

void KSem::operator delete(void* ptr) {
    800033ac:	ff010113          	addi	sp,sp,-16
    800033b0:	00113423          	sd	ra,8(sp)
    800033b4:	00813023          	sd	s0,0(sp)
    800033b8:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    800033bc:	ffffe097          	auipc	ra,0xffffe
    800033c0:	f94080e7          	jalr	-108(ra) # 80001350 <_Z8mem_freePv>
	//MemoryAllocator::kfree(ptr);
}
    800033c4:	00813083          	ld	ra,8(sp)
    800033c8:	00013403          	ld	s0,0(sp)
    800033cc:	01010113          	addi	sp,sp,16
    800033d0:	00008067          	ret

00000000800033d4 <_ZN4KSem7initSemEj>:

KSem* KSem::initSem(uint val) {
    800033d4:	fe010113          	addi	sp,sp,-32
    800033d8:	00113c23          	sd	ra,24(sp)
    800033dc:	00813823          	sd	s0,16(sp)
    800033e0:	00913423          	sd	s1,8(sp)
    800033e4:	02010413          	addi	s0,sp,32
    800033e8:	00050493          	mv	s1,a0
	return new KSem(val);
    800033ec:	02000513          	li	a0,32
    800033f0:	00000097          	auipc	ra,0x0
    800033f4:	f94080e7          	jalr	-108(ra) # 80003384 <_ZN4KSemnwEm>
	void block();

	void unblock();

private:
	KSem(uint val) : val(val), working(true) {}
    800033f8:	00952023          	sw	s1,0(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    800033fc:	00053423          	sd	zero,8(a0)
    80003400:	00053823          	sd	zero,16(a0)
    80003404:	00100713          	li	a4,1
    80003408:	00e50c23          	sb	a4,24(a0)
}
    8000340c:	01813083          	ld	ra,24(sp)
    80003410:	01013403          	ld	s0,16(sp)
    80003414:	00813483          	ld	s1,8(sp)
    80003418:	02010113          	addi	sp,sp,32
    8000341c:	00008067          	ret

0000000080003420 <_ZN4KSem5blockEv>:
		unblock();
	}
	return 0;
}

void KSem::block() {
    80003420:	ff010113          	addi	sp,sp,-16
    80003424:	00113423          	sd	ra,8(sp)
    80003428:	00813023          	sd	s0,0(sp)
    8000342c:	01010413          	addi	s0,sp,16
	//TCB::running->setBlocked(true);
    TCB::running->setStatus(TCB::BLOCKED);
    80003430:	00008797          	auipc	a5,0x8
    80003434:	6707b783          	ld	a5,1648(a5) # 8000baa0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80003438:	0007b583          	ld	a1,0(a5)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    8000343c:	00200793          	li	a5,2
    80003440:	04f5ac23          	sw	a5,88(a1)
	blocked.putLast(TCB::running);
    80003444:	00850513          	addi	a0,a0,8
    80003448:	ffffe097          	auipc	ra,0xffffe
    8000344c:	dfc080e7          	jalr	-516(ra) # 80001244 <_ZN11ThreadQueue7putLastEP3TCB>
	TCB::yield();
    80003450:	fffff097          	auipc	ra,0xfffff
    80003454:	650080e7          	jalr	1616(ra) # 80002aa0 <_ZN3TCB5yieldEv>
}
    80003458:	00813083          	ld	ra,8(sp)
    8000345c:	00013403          	ld	s0,0(sp)
    80003460:	01010113          	addi	sp,sp,16
    80003464:	00008067          	ret

0000000080003468 <_ZN4KSem4waitEv>:
	if (!working) return -3;
    80003468:	01854783          	lbu	a5,24(a0)
    8000346c:	04078663          	beqz	a5,800034b8 <_ZN4KSem4waitEv+0x50>
	if (--val < 0) {
    80003470:	00052783          	lw	a5,0(a0)
    80003474:	fff7879b          	addiw	a5,a5,-1
    80003478:	00f52023          	sw	a5,0(a0)
    8000347c:	02079713          	slli	a4,a5,0x20
    80003480:	00074663          	bltz	a4,8000348c <_ZN4KSem4waitEv+0x24>
	return 0;
    80003484:	00000513          	li	a0,0
}
    80003488:	00008067          	ret
int KSem::wait() {
    8000348c:	ff010113          	addi	sp,sp,-16
    80003490:	00113423          	sd	ra,8(sp)
    80003494:	00813023          	sd	s0,0(sp)
    80003498:	01010413          	addi	s0,sp,16
		block();
    8000349c:	00000097          	auipc	ra,0x0
    800034a0:	f84080e7          	jalr	-124(ra) # 80003420 <_ZN4KSem5blockEv>
		return -1;
    800034a4:	fff00513          	li	a0,-1
}
    800034a8:	00813083          	ld	ra,8(sp)
    800034ac:	00013403          	ld	s0,0(sp)
    800034b0:	01010113          	addi	sp,sp,16
    800034b4:	00008067          	ret
	if (!working) return -3;
    800034b8:	ffd00513          	li	a0,-3
    800034bc:	00008067          	ret

00000000800034c0 <_ZN4KSem7unblockEv>:

void KSem::unblock() {
    800034c0:	ff010113          	addi	sp,sp,-16
    800034c4:	00113423          	sd	ra,8(sp)
    800034c8:	00813023          	sd	s0,0(sp)
    800034cc:	01010413          	addi	s0,sp,16
	TCB* tcb = blocked.getFirst();
    800034d0:	00850513          	addi	a0,a0,8
    800034d4:	ffffe097          	auipc	ra,0xffffe
    800034d8:	ddc080e7          	jalr	-548(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
    800034dc:	00100793          	li	a5,1
    800034e0:	04f52c23          	sw	a5,88(a0)
	//tcb->setBlocked(false);
    tcb->setStatus(TCB::ACTIVE);
	Scheduler::put(tcb);
    800034e4:	ffffe097          	auipc	ra,0xffffe
    800034e8:	56c080e7          	jalr	1388(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
}
    800034ec:	00813083          	ld	ra,8(sp)
    800034f0:	00013403          	ld	s0,0(sp)
    800034f4:	01010113          	addi	sp,sp,16
    800034f8:	00008067          	ret

00000000800034fc <_ZN4KSem6signalEv>:
	if (!working) return -3;
    800034fc:	01854783          	lbu	a5,24(a0)
    80003500:	04078463          	beqz	a5,80003548 <_ZN4KSem6signalEv+0x4c>
	if (val++ < 0) {
    80003504:	00052783          	lw	a5,0(a0)
    80003508:	0017871b          	addiw	a4,a5,1
    8000350c:	00e52023          	sw	a4,0(a0)
    80003510:	0007c663          	bltz	a5,8000351c <_ZN4KSem6signalEv+0x20>
	return 0;
    80003514:	00000513          	li	a0,0
}
    80003518:	00008067          	ret
int KSem::signal() {
    8000351c:	ff010113          	addi	sp,sp,-16
    80003520:	00113423          	sd	ra,8(sp)
    80003524:	00813023          	sd	s0,0(sp)
    80003528:	01010413          	addi	s0,sp,16
		unblock();
    8000352c:	00000097          	auipc	ra,0x0
    80003530:	f94080e7          	jalr	-108(ra) # 800034c0 <_ZN4KSem7unblockEv>
	return 0;
    80003534:	00000513          	li	a0,0
}
    80003538:	00813083          	ld	ra,8(sp)
    8000353c:	00013403          	ld	s0,0(sp)
    80003540:	01010113          	addi	sp,sp,16
    80003544:	00008067          	ret
	if (!working) return -3;
    80003548:	ffd00513          	li	a0,-3
    8000354c:	00008067          	ret

0000000080003550 <_ZN4KSem8closeSemEPS_>:

int KSem::closeSem(sem_t handle) {
    80003550:	fe010113          	addi	sp,sp,-32
    80003554:	00113c23          	sd	ra,24(sp)
    80003558:	00813823          	sd	s0,16(sp)
    8000355c:	00913423          	sd	s1,8(sp)
    80003560:	02010413          	addi	s0,sp,32
    80003564:	00050493          	mv	s1,a0
	//if (!MemoryAllocator::checkPurpose(handle, MemoryAllocator::SEMAPHORE)) return -2;
	handle->working = false;
    80003568:	00050c23          	sb	zero,24(a0)
        bool ret = front == nullptr;
    8000356c:	0084b783          	ld	a5,8(s1)
	while (!handle->blocked.isEmpty()) {
    80003570:	02078263          	beqz	a5,80003594 <_ZN4KSem8closeSemEPS_+0x44>
		TCB* tcb = handle->blocked.getFirst();
    80003574:	00848513          	addi	a0,s1,8
    80003578:	ffffe097          	auipc	ra,0xffffe
    8000357c:	d38080e7          	jalr	-712(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
    80003580:	00100793          	li	a5,1
    80003584:	04f52c23          	sw	a5,88(a0)
		//tcb->setBlocked(false);
        tcb->setStatus(TCB::ACTIVE);
		Scheduler::put(tcb);
    80003588:	ffffe097          	auipc	ra,0xffffe
    8000358c:	4c8080e7          	jalr	1224(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
	while (!handle->blocked.isEmpty()) {
    80003590:	fddff06f          	j	8000356c <_ZN4KSem8closeSemEPS_+0x1c>
	}
	return 0;
}
    80003594:	00000513          	li	a0,0
    80003598:	01813083          	ld	ra,24(sp)
    8000359c:	01013403          	ld	s0,16(sp)
    800035a0:	00813483          	ld	s1,8(sp)
    800035a4:	02010113          	addi	sp,sp,32
    800035a8:	00008067          	ret

00000000800035ac <_Z10testMemoryv>:
    return pok;
}

#pragma GCC optimize("O0")

void testMemory() {
    800035ac:	e6010113          	addi	sp,sp,-416
    800035b0:	18113c23          	sd	ra,408(sp)
    800035b4:	18813823          	sd	s0,400(sp)
    800035b8:	1a010413          	addi	s0,sp,416
    char* pokazivaci[50];
    pokazivaci[0] = nullptr;
    800035bc:	e6043023          	sd	zero,-416(s0)
    pokazivaci[0] = upisi(1024 + 768);
    800035c0:	70000513          	li	a0,1792
    800035c4:	00000097          	auipc	ra,0x0
    800035c8:	1f8080e7          	jalr	504(ra) # 800037bc <_Z5upisim>
    800035cc:	00050793          	mv	a5,a0
    800035d0:	e6f43023          	sd	a5,-416(s0)
    if (pokazivaci[0]) {
    800035d4:	e6043783          	ld	a5,-416(s0)
    800035d8:	02078c63          	beqz	a5,80003610 <_Z10testMemoryv+0x64>
        if (pokazivaci[0][0] == '8') {
    800035dc:	e6043783          	ld	a5,-416(s0)
    800035e0:	0007c783          	lbu	a5,0(a5)
    800035e4:	00078713          	mv	a4,a5
    800035e8:	03800793          	li	a5,56
    800035ec:	00f71a63          	bne	a4,a5,80003600 <_Z10testMemoryv+0x54>
            printString("nea");
    800035f0:	00006517          	auipc	a0,0x6
    800035f4:	c1050513          	addi	a0,a0,-1008 # 80009200 <_ZZ9kPrintIntmE6digits+0x190>
    800035f8:	00002097          	auipc	ra,0x2
    800035fc:	6b4080e7          	jalr	1716(ra) # 80005cac <_Z11printStringPKc>
        }
        MemoryAllocator::kfree(pokazivaci[0]);
    80003600:	e6043783          	ld	a5,-416(s0)
    80003604:	00078513          	mv	a0,a5
    80003608:	00000097          	auipc	ra,0x0
    8000360c:	988080e7          	jalr	-1656(ra) # 80002f90 <_ZN15MemoryAllocator5kfreeEPv>
    }


    pokazivaci[0] = upisi(4096);
    80003610:	00001537          	lui	a0,0x1
    80003614:	00000097          	auipc	ra,0x0
    80003618:	1a8080e7          	jalr	424(ra) # 800037bc <_Z5upisim>
    8000361c:	00050793          	mv	a5,a0
    80003620:	e6f43023          	sd	a5,-416(s0)
    if (pokazivaci[0]) {
    80003624:	e6043783          	ld	a5,-416(s0)
    80003628:	00078a63          	beqz	a5,8000363c <_Z10testMemoryv+0x90>
        MemoryAllocator::kfree(pokazivaci[0]);
    8000362c:	e6043783          	ld	a5,-416(s0)
    80003630:	00078513          	mv	a0,a5
    80003634:	00000097          	auipc	ra,0x0
    80003638:	95c080e7          	jalr	-1700(ra) # 80002f90 <_ZN15MemoryAllocator5kfreeEPv>
    }

    pokazivaci[0] = upisi(1024 + 768);
    8000363c:	70000513          	li	a0,1792
    80003640:	00000097          	auipc	ra,0x0
    80003644:	17c080e7          	jalr	380(ra) # 800037bc <_Z5upisim>
    80003648:	00050793          	mv	a5,a0
    8000364c:	e6f43023          	sd	a5,-416(s0)
    MemoryAllocator::kfree(pokazivaci[0]);
    80003650:	e6043783          	ld	a5,-416(s0)
    80003654:	00078513          	mv	a0,a5
    80003658:	00000097          	auipc	ra,0x0
    8000365c:	938080e7          	jalr	-1736(ra) # 80002f90 <_ZN15MemoryAllocator5kfreeEPv>

}
    80003660:	00000013          	nop
    80003664:	19813083          	ld	ra,408(sp)
    80003668:	19013403          	ld	s0,400(sp)
    8000366c:	1a010113          	addi	sp,sp,416
    80003670:	00008067          	ret

0000000080003674 <_Z5nit1fPv>:

void nit1f(void*) {
    80003674:	fe010113          	addi	sp,sp,-32
    80003678:	00113c23          	sd	ra,24(sp)
    8000367c:	00813823          	sd	s0,16(sp)
    80003680:	02010413          	addi	s0,sp,32
    80003684:	fea43423          	sd	a0,-24(s0)
//		printString("\nsem_wait za nit 1 vratio ");
//		printInteger(res);
//		printString("\n");
//	}

    printString("\nGotova nit 1\n");
    80003688:	00006517          	auipc	a0,0x6
    8000368c:	b8050513          	addi	a0,a0,-1152 # 80009208 <_ZZ9kPrintIntmE6digits+0x198>
    80003690:	00002097          	auipc	ra,0x2
    80003694:	61c080e7          	jalr	1564(ra) # 80005cac <_Z11printStringPKc>
}
    80003698:	00000013          	nop
    8000369c:	01813083          	ld	ra,24(sp)
    800036a0:	01013403          	ld	s0,16(sp)
    800036a4:	02010113          	addi	sp,sp,32
    800036a8:	00008067          	ret

00000000800036ac <_Z5nit2fPv>:

void nit2f(void* arg2) {
    800036ac:	fe010113          	addi	sp,sp,-32
    800036b0:	00113c23          	sd	ra,24(sp)
    800036b4:	00813823          	sd	s0,16(sp)
    800036b8:	02010413          	addi	s0,sp,32
    800036bc:	fea43423          	sd	a0,-24(s0)
//		//sem_close(semA);
//		printString("\nNit 2 ubija semafor\n");
//		delete semA;
//
//	}
    printString("\nGotova nit 2\n");
    800036c0:	00006517          	auipc	a0,0x6
    800036c4:	b5850513          	addi	a0,a0,-1192 # 80009218 <_ZZ9kPrintIntmE6digits+0x1a8>
    800036c8:	00002097          	auipc	ra,0x2
    800036cc:	5e4080e7          	jalr	1508(ra) # 80005cac <_Z11printStringPKc>
}
    800036d0:	00000013          	nop
    800036d4:	01813083          	ld	ra,24(sp)
    800036d8:	01013403          	ld	s0,16(sp)
    800036dc:	02010113          	addi	sp,sp,32
    800036e0:	00008067          	ret

00000000800036e4 <_Z5nit3fPv>:


void nit3f(void*) {
    800036e4:	fd010113          	addi	sp,sp,-48
    800036e8:	02113423          	sd	ra,40(sp)
    800036ec:	02813023          	sd	s0,32(sp)
    800036f0:	03010413          	addi	s0,sp,48
    800036f4:	fca43c23          	sd	a0,-40(s0)
    char slovo;
    do {
        slovo = getc();
    800036f8:	ffffe097          	auipc	ra,0xffffe
    800036fc:	e70080e7          	jalr	-400(ra) # 80001568 <_Z4getcv>
    80003700:	00050793          	mv	a5,a0
    80003704:	fef407a3          	sb	a5,-17(s0)
        putc(slovo);
    80003708:	fef44783          	lbu	a5,-17(s0)
    8000370c:	00078513          	mv	a0,a5
    80003710:	ffffe097          	auipc	ra,0xffffe
    80003714:	e80080e7          	jalr	-384(ra) # 80001590 <_Z4putcc>
        if (slovo == '\r') putc('\n');
    80003718:	fef44783          	lbu	a5,-17(s0)
    8000371c:	0ff7f713          	andi	a4,a5,255
    80003720:	00d00793          	li	a5,13
    80003724:	00f71863          	bne	a4,a5,80003734 <_Z5nit3fPv+0x50>
    80003728:	00a00513          	li	a0,10
    8000372c:	ffffe097          	auipc	ra,0xffffe
    80003730:	e64080e7          	jalr	-412(ra) # 80001590 <_Z4putcc>
    } while (slovo != '0');
    80003734:	fef44783          	lbu	a5,-17(s0)
    80003738:	0ff7f713          	andi	a4,a5,255
    8000373c:	03000793          	li	a5,48
    80003740:	00f70463          	beq	a4,a5,80003748 <_Z5nit3fPv+0x64>
    do {
    80003744:	fb5ff06f          	j	800036f8 <_Z5nit3fPv+0x14>

    printString("\nGotova nit3\n");
    80003748:	00006517          	auipc	a0,0x6
    8000374c:	ae050513          	addi	a0,a0,-1312 # 80009228 <_ZZ9kPrintIntmE6digits+0x1b8>
    80003750:	00002097          	auipc	ra,0x2
    80003754:	55c080e7          	jalr	1372(ra) # 80005cac <_Z11printStringPKc>
}
    80003758:	00000013          	nop
    8000375c:	02813083          	ld	ra,40(sp)
    80003760:	02013403          	ld	s0,32(sp)
    80003764:	03010113          	addi	sp,sp,48
    80003768:	00008067          	ret

000000008000376c <_Z8testMainv>:

int testMain() {
    8000376c:	ff010113          	addi	sp,sp,-16
    80003770:	00113423          	sd	ra,8(sp)
    80003774:	00813023          	sd	s0,0(sp)
    80003778:	01010413          	addi	s0,sp,16
//postavi adresu prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    8000377c:	00008797          	auipc	a5,0x8
    80003780:	3347b783          	ld	a5,820(a5) # 8000bab0 <_GLOBAL_OFFSET_TABLE_+0x68>
    80003784:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    MemoryAllocator::initMemoryAllocator();
    80003788:	00000097          	auipc	ra,0x0
    8000378c:	b48080e7          	jalr	-1208(ra) # 800032d0 <_ZN15MemoryAllocator19initMemoryAllocatorEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    80003790:	ffffe097          	auipc	ra,0xffffe
    80003794:	ed0080e7          	jalr	-304(ra) # 80001660 <_ZN8KConsole12initKConsoleEv>
//	printString("\nGotove user niti\n");
//
//	printString("\nSad cu da izadjem\n");
//	while(KConsole::outputHead!=KConsole::outputTail){}
//	//zabrani prekide
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    80003798:	00200513          	li	a0,2
    8000379c:	00000097          	auipc	ra,0x0
    800037a0:	07c080e7          	jalr	124(ra) # 80003818 <_ZN5Riscv10mc_sstatusEm>


    return 0;
    800037a4:	00000793          	li	a5,0
    800037a8:	00078513          	mv	a0,a5
    800037ac:	00813083          	ld	ra,8(sp)
    800037b0:	00013403          	ld	s0,0(sp)
    800037b4:	01010113          	addi	sp,sp,16
    800037b8:	00008067          	ret

00000000800037bc <_Z5upisim>:
char* upisi(size_t alociraj) {
    800037bc:	fe010113          	addi	sp,sp,-32
    800037c0:	00113c23          	sd	ra,24(sp)
    800037c4:	00813823          	sd	s0,16(sp)
    800037c8:	00913423          	sd	s1,8(sp)
    800037cc:	02010413          	addi	s0,sp,32
    800037d0:	00050493          	mv	s1,a0
    char* pok = (char*) MemoryAllocator::kmalloc(alociraj);
    800037d4:	00300593          	li	a1,3
    800037d8:	fffff097          	auipc	ra,0xfffff
    800037dc:	510080e7          	jalr	1296(ra) # 80002ce8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
    if (pok) {
    800037e0:	02050263          	beqz	a0,80003804 <_Z5upisim+0x48>
        for (uint64 i = 0; i < alociraj - sizeof(MemoryAllocator::UsedMemSegment); i++) {
    800037e4:	00000793          	li	a5,0
    800037e8:	0140006f          	j	800037fc <_Z5upisim+0x40>
            pok[i] = '8';
    800037ec:	00f50733          	add	a4,a0,a5
    800037f0:	03800693          	li	a3,56
    800037f4:	00d70023          	sb	a3,0(a4)
        for (uint64 i = 0; i < alociraj - sizeof(MemoryAllocator::UsedMemSegment); i++) {
    800037f8:	00178793          	addi	a5,a5,1
    800037fc:	fe048713          	addi	a4,s1,-32
    80003800:	fee7e6e3          	bltu	a5,a4,800037ec <_Z5upisim+0x30>
}
    80003804:	01813083          	ld	ra,24(sp)
    80003808:	01013403          	ld	s0,16(sp)
    8000380c:	00813483          	ld	s1,8(sp)
    80003810:	02010113          	addi	sp,sp,32
    80003814:	00008067          	ret

0000000080003818 <_ZN5Riscv10mc_sstatusEm>:
inline void Riscv::mc_sstatus(uint64 mask) {
    80003818:	ff010113          	addi	sp,sp,-16
    8000381c:	00813423          	sd	s0,8(sp)
    80003820:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80003824:	10053073          	csrc	sstatus,a0
}
    80003828:	00813403          	ld	s0,8(sp)
    8000382c:	01010113          	addi	sp,sp,16
    80003830:	00008067          	ret

0000000080003834 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80003834:	fe010113          	addi	sp,sp,-32
    80003838:	00113c23          	sd	ra,24(sp)
    8000383c:	00813823          	sd	s0,16(sp)
    80003840:	00913423          	sd	s1,8(sp)
    80003844:	01213023          	sd	s2,0(sp)
    80003848:	02010413          	addi	s0,sp,32
    8000384c:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80003850:	00000913          	li	s2,0
    80003854:	00c0006f          	j	80003860 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003858:	ffffe097          	auipc	ra,0xffffe
    8000385c:	bd0080e7          	jalr	-1072(ra) # 80001428 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
    80003860:	ffffe097          	auipc	ra,0xffffe
    80003864:	d08080e7          	jalr	-760(ra) # 80001568 <_Z4getcv>
    80003868:	0005059b          	sext.w	a1,a0
    8000386c:	02d00793          	li	a5,45
    80003870:	02f58a63          	beq	a1,a5,800038a4 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80003874:	0084b503          	ld	a0,8(s1)
    80003878:	00003097          	auipc	ra,0x3
    8000387c:	400080e7          	jalr	1024(ra) # 80006c78 <_ZN6Buffer3putEi>
        i++;
    80003880:	0019071b          	addiw	a4,s2,1
    80003884:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003888:	0004a683          	lw	a3,0(s1)
    8000388c:	0026979b          	slliw	a5,a3,0x2
    80003890:	00d787bb          	addw	a5,a5,a3
    80003894:	0017979b          	slliw	a5,a5,0x1
    80003898:	02f767bb          	remw	a5,a4,a5
    8000389c:	fc0792e3          	bnez	a5,80003860 <_ZL16producerKeyboardPv+0x2c>
    800038a0:	fb9ff06f          	j	80003858 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    800038a4:	00100793          	li	a5,1
    800038a8:	00008717          	auipc	a4,0x8
    800038ac:	36f72423          	sw	a5,872(a4) # 8000bc10 <_ZL9threadEnd>
    data->buffer->put('!');
    800038b0:	02100593          	li	a1,33
    800038b4:	0084b503          	ld	a0,8(s1)
    800038b8:	00003097          	auipc	ra,0x3
    800038bc:	3c0080e7          	jalr	960(ra) # 80006c78 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    800038c0:	0104b503          	ld	a0,16(s1)
    800038c4:	ffffe097          	auipc	ra,0xffffe
    800038c8:	c74080e7          	jalr	-908(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    800038cc:	01813083          	ld	ra,24(sp)
    800038d0:	01013403          	ld	s0,16(sp)
    800038d4:	00813483          	ld	s1,8(sp)
    800038d8:	00013903          	ld	s2,0(sp)
    800038dc:	02010113          	addi	sp,sp,32
    800038e0:	00008067          	ret

00000000800038e4 <_ZL8producerPv>:

static void producer(void *arg) {
    800038e4:	fe010113          	addi	sp,sp,-32
    800038e8:	00113c23          	sd	ra,24(sp)
    800038ec:	00813823          	sd	s0,16(sp)
    800038f0:	00913423          	sd	s1,8(sp)
    800038f4:	01213023          	sd	s2,0(sp)
    800038f8:	02010413          	addi	s0,sp,32
    800038fc:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003900:	00000913          	li	s2,0
    80003904:	00c0006f          	j	80003910 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003908:	ffffe097          	auipc	ra,0xffffe
    8000390c:	b20080e7          	jalr	-1248(ra) # 80001428 <_Z15thread_dispatchv>
    while (!threadEnd) {
    80003910:	00008797          	auipc	a5,0x8
    80003914:	3007a783          	lw	a5,768(a5) # 8000bc10 <_ZL9threadEnd>
    80003918:	02079e63          	bnez	a5,80003954 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    8000391c:	0004a583          	lw	a1,0(s1)
    80003920:	0305859b          	addiw	a1,a1,48
    80003924:	0084b503          	ld	a0,8(s1)
    80003928:	00003097          	auipc	ra,0x3
    8000392c:	350080e7          	jalr	848(ra) # 80006c78 <_ZN6Buffer3putEi>
        i++;
    80003930:	0019071b          	addiw	a4,s2,1
    80003934:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003938:	0004a683          	lw	a3,0(s1)
    8000393c:	0026979b          	slliw	a5,a3,0x2
    80003940:	00d787bb          	addw	a5,a5,a3
    80003944:	0017979b          	slliw	a5,a5,0x1
    80003948:	02f767bb          	remw	a5,a4,a5
    8000394c:	fc0792e3          	bnez	a5,80003910 <_ZL8producerPv+0x2c>
    80003950:	fb9ff06f          	j	80003908 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80003954:	0104b503          	ld	a0,16(s1)
    80003958:	ffffe097          	auipc	ra,0xffffe
    8000395c:	be0080e7          	jalr	-1056(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    80003960:	01813083          	ld	ra,24(sp)
    80003964:	01013403          	ld	s0,16(sp)
    80003968:	00813483          	ld	s1,8(sp)
    8000396c:	00013903          	ld	s2,0(sp)
    80003970:	02010113          	addi	sp,sp,32
    80003974:	00008067          	ret

0000000080003978 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80003978:	fd010113          	addi	sp,sp,-48
    8000397c:	02113423          	sd	ra,40(sp)
    80003980:	02813023          	sd	s0,32(sp)
    80003984:	00913c23          	sd	s1,24(sp)
    80003988:	01213823          	sd	s2,16(sp)
    8000398c:	01313423          	sd	s3,8(sp)
    80003990:	03010413          	addi	s0,sp,48
    80003994:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003998:	00000993          	li	s3,0
    8000399c:	01c0006f          	j	800039b8 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    800039a0:	ffffe097          	auipc	ra,0xffffe
    800039a4:	a88080e7          	jalr	-1400(ra) # 80001428 <_Z15thread_dispatchv>
    800039a8:	0500006f          	j	800039f8 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    800039ac:	00a00513          	li	a0,10
    800039b0:	ffffe097          	auipc	ra,0xffffe
    800039b4:	be0080e7          	jalr	-1056(ra) # 80001590 <_Z4putcc>
    while (!threadEnd) {
    800039b8:	00008797          	auipc	a5,0x8
    800039bc:	2587a783          	lw	a5,600(a5) # 8000bc10 <_ZL9threadEnd>
    800039c0:	06079063          	bnez	a5,80003a20 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    800039c4:	00893503          	ld	a0,8(s2)
    800039c8:	00003097          	auipc	ra,0x3
    800039cc:	340080e7          	jalr	832(ra) # 80006d08 <_ZN6Buffer3getEv>
        i++;
    800039d0:	0019849b          	addiw	s1,s3,1
    800039d4:	0004899b          	sext.w	s3,s1
        putc(key);
    800039d8:	0ff57513          	andi	a0,a0,255
    800039dc:	ffffe097          	auipc	ra,0xffffe
    800039e0:	bb4080e7          	jalr	-1100(ra) # 80001590 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    800039e4:	00092703          	lw	a4,0(s2)
    800039e8:	0027179b          	slliw	a5,a4,0x2
    800039ec:	00e787bb          	addw	a5,a5,a4
    800039f0:	02f4e7bb          	remw	a5,s1,a5
    800039f4:	fa0786e3          	beqz	a5,800039a0 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    800039f8:	05000793          	li	a5,80
    800039fc:	02f4e4bb          	remw	s1,s1,a5
    80003a00:	fa049ce3          	bnez	s1,800039b8 <_ZL8consumerPv+0x40>
    80003a04:	fa9ff06f          	j	800039ac <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80003a08:	00893503          	ld	a0,8(s2)
    80003a0c:	00003097          	auipc	ra,0x3
    80003a10:	2fc080e7          	jalr	764(ra) # 80006d08 <_ZN6Buffer3getEv>
        putc(key);
    80003a14:	0ff57513          	andi	a0,a0,255
    80003a18:	ffffe097          	auipc	ra,0xffffe
    80003a1c:	b78080e7          	jalr	-1160(ra) # 80001590 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80003a20:	00893503          	ld	a0,8(s2)
    80003a24:	00003097          	auipc	ra,0x3
    80003a28:	370080e7          	jalr	880(ra) # 80006d94 <_ZN6Buffer6getCntEv>
    80003a2c:	fca04ee3          	bgtz	a0,80003a08 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80003a30:	01093503          	ld	a0,16(s2)
    80003a34:	ffffe097          	auipc	ra,0xffffe
    80003a38:	b04080e7          	jalr	-1276(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    80003a3c:	02813083          	ld	ra,40(sp)
    80003a40:	02013403          	ld	s0,32(sp)
    80003a44:	01813483          	ld	s1,24(sp)
    80003a48:	01013903          	ld	s2,16(sp)
    80003a4c:	00813983          	ld	s3,8(sp)
    80003a50:	03010113          	addi	sp,sp,48
    80003a54:	00008067          	ret

0000000080003a58 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80003a58:	f9010113          	addi	sp,sp,-112
    80003a5c:	06113423          	sd	ra,104(sp)
    80003a60:	06813023          	sd	s0,96(sp)
    80003a64:	04913c23          	sd	s1,88(sp)
    80003a68:	05213823          	sd	s2,80(sp)
    80003a6c:	05313423          	sd	s3,72(sp)
    80003a70:	05413023          	sd	s4,64(sp)
    80003a74:	03513c23          	sd	s5,56(sp)
    80003a78:	03613823          	sd	s6,48(sp)
    80003a7c:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80003a80:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80003a84:	00005517          	auipc	a0,0x5
    80003a88:	7b450513          	addi	a0,a0,1972 # 80009238 <_ZZ9kPrintIntmE6digits+0x1c8>
    80003a8c:	00002097          	auipc	ra,0x2
    80003a90:	220080e7          	jalr	544(ra) # 80005cac <_Z11printStringPKc>
    getString(input, 30);
    80003a94:	01e00593          	li	a1,30
    80003a98:	fa040493          	addi	s1,s0,-96
    80003a9c:	00048513          	mv	a0,s1
    80003aa0:	00002097          	auipc	ra,0x2
    80003aa4:	294080e7          	jalr	660(ra) # 80005d34 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80003aa8:	00048513          	mv	a0,s1
    80003aac:	00002097          	auipc	ra,0x2
    80003ab0:	360080e7          	jalr	864(ra) # 80005e0c <_Z11stringToIntPKc>
    80003ab4:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80003ab8:	00005517          	auipc	a0,0x5
    80003abc:	7a050513          	addi	a0,a0,1952 # 80009258 <_ZZ9kPrintIntmE6digits+0x1e8>
    80003ac0:	00002097          	auipc	ra,0x2
    80003ac4:	1ec080e7          	jalr	492(ra) # 80005cac <_Z11printStringPKc>
    getString(input, 30);
    80003ac8:	01e00593          	li	a1,30
    80003acc:	00048513          	mv	a0,s1
    80003ad0:	00002097          	auipc	ra,0x2
    80003ad4:	264080e7          	jalr	612(ra) # 80005d34 <_Z9getStringPci>
    n = stringToInt(input);
    80003ad8:	00048513          	mv	a0,s1
    80003adc:	00002097          	auipc	ra,0x2
    80003ae0:	330080e7          	jalr	816(ra) # 80005e0c <_Z11stringToIntPKc>
    80003ae4:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80003ae8:	00005517          	auipc	a0,0x5
    80003aec:	79050513          	addi	a0,a0,1936 # 80009278 <_ZZ9kPrintIntmE6digits+0x208>
    80003af0:	00002097          	auipc	ra,0x2
    80003af4:	1bc080e7          	jalr	444(ra) # 80005cac <_Z11printStringPKc>
	printInt(threadNum);
    80003af8:	00000613          	li	a2,0
    80003afc:	00a00593          	li	a1,10
    80003b00:	00090513          	mv	a0,s2
    80003b04:	00002097          	auipc	ra,0x2
    80003b08:	358080e7          	jalr	856(ra) # 80005e5c <_Z8printIntiii>
    printString(" i velicina bafera ");
    80003b0c:	00005517          	auipc	a0,0x5
    80003b10:	78450513          	addi	a0,a0,1924 # 80009290 <_ZZ9kPrintIntmE6digits+0x220>
    80003b14:	00002097          	auipc	ra,0x2
    80003b18:	198080e7          	jalr	408(ra) # 80005cac <_Z11printStringPKc>
	printInt(n);
    80003b1c:	00000613          	li	a2,0
    80003b20:	00a00593          	li	a1,10
    80003b24:	00048513          	mv	a0,s1
    80003b28:	00002097          	auipc	ra,0x2
    80003b2c:	334080e7          	jalr	820(ra) # 80005e5c <_Z8printIntiii>
    printString(".\n");
    80003b30:	00005517          	auipc	a0,0x5
    80003b34:	77850513          	addi	a0,a0,1912 # 800092a8 <_ZZ9kPrintIntmE6digits+0x238>
    80003b38:	00002097          	auipc	ra,0x2
    80003b3c:	174080e7          	jalr	372(ra) # 80005cac <_Z11printStringPKc>
    if(threadNum > n) {
    80003b40:	0324c463          	blt	s1,s2,80003b68 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80003b44:	03205c63          	blez	s2,80003b7c <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80003b48:	03800513          	li	a0,56
    80003b4c:	fffff097          	auipc	ra,0xfffff
    80003b50:	91c080e7          	jalr	-1764(ra) # 80002468 <_Znwm>
    80003b54:	00050a13          	mv	s4,a0
    80003b58:	00048593          	mv	a1,s1
    80003b5c:	00003097          	auipc	ra,0x3
    80003b60:	080080e7          	jalr	128(ra) # 80006bdc <_ZN6BufferC1Ei>
    80003b64:	0300006f          	j	80003b94 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80003b68:	00005517          	auipc	a0,0x5
    80003b6c:	74850513          	addi	a0,a0,1864 # 800092b0 <_ZZ9kPrintIntmE6digits+0x240>
    80003b70:	00002097          	auipc	ra,0x2
    80003b74:	13c080e7          	jalr	316(ra) # 80005cac <_Z11printStringPKc>
        return;
    80003b78:	0140006f          	j	80003b8c <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80003b7c:	00005517          	auipc	a0,0x5
    80003b80:	77450513          	addi	a0,a0,1908 # 800092f0 <_ZZ9kPrintIntmE6digits+0x280>
    80003b84:	00002097          	auipc	ra,0x2
    80003b88:	128080e7          	jalr	296(ra) # 80005cac <_Z11printStringPKc>
        return;
    80003b8c:	000b0113          	mv	sp,s6
    80003b90:	1500006f          	j	80003ce0 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80003b94:	00000593          	li	a1,0
    80003b98:	00008517          	auipc	a0,0x8
    80003b9c:	08050513          	addi	a0,a0,128 # 8000bc18 <_ZL10waitForAll>
    80003ba0:	ffffe097          	auipc	ra,0xffffe
    80003ba4:	900080e7          	jalr	-1792(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    thread_t threads[threadNum];
    80003ba8:	00391793          	slli	a5,s2,0x3
    80003bac:	00f78793          	addi	a5,a5,15
    80003bb0:	ff07f793          	andi	a5,a5,-16
    80003bb4:	40f10133          	sub	sp,sp,a5
    80003bb8:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80003bbc:	0019071b          	addiw	a4,s2,1
    80003bc0:	00171793          	slli	a5,a4,0x1
    80003bc4:	00e787b3          	add	a5,a5,a4
    80003bc8:	00379793          	slli	a5,a5,0x3
    80003bcc:	00f78793          	addi	a5,a5,15
    80003bd0:	ff07f793          	andi	a5,a5,-16
    80003bd4:	40f10133          	sub	sp,sp,a5
    80003bd8:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80003bdc:	00191613          	slli	a2,s2,0x1
    80003be0:	012607b3          	add	a5,a2,s2
    80003be4:	00379793          	slli	a5,a5,0x3
    80003be8:	00f987b3          	add	a5,s3,a5
    80003bec:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80003bf0:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80003bf4:	00008717          	auipc	a4,0x8
    80003bf8:	02473703          	ld	a4,36(a4) # 8000bc18 <_ZL10waitForAll>
    80003bfc:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80003c00:	00078613          	mv	a2,a5
    80003c04:	00000597          	auipc	a1,0x0
    80003c08:	d7458593          	addi	a1,a1,-652 # 80003978 <_ZL8consumerPv>
    80003c0c:	f9840513          	addi	a0,s0,-104
    80003c10:	ffffd097          	auipc	ra,0xffffd
    80003c14:	770080e7          	jalr	1904(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003c18:	00000493          	li	s1,0
    80003c1c:	0280006f          	j	80003c44 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80003c20:	00000597          	auipc	a1,0x0
    80003c24:	c1458593          	addi	a1,a1,-1004 # 80003834 <_ZL16producerKeyboardPv>
                      data + i);
    80003c28:	00179613          	slli	a2,a5,0x1
    80003c2c:	00f60633          	add	a2,a2,a5
    80003c30:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80003c34:	00c98633          	add	a2,s3,a2
    80003c38:	ffffd097          	auipc	ra,0xffffd
    80003c3c:	748080e7          	jalr	1864(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003c40:	0014849b          	addiw	s1,s1,1
    80003c44:	0524d263          	bge	s1,s2,80003c88 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80003c48:	00149793          	slli	a5,s1,0x1
    80003c4c:	009787b3          	add	a5,a5,s1
    80003c50:	00379793          	slli	a5,a5,0x3
    80003c54:	00f987b3          	add	a5,s3,a5
    80003c58:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80003c5c:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80003c60:	00008717          	auipc	a4,0x8
    80003c64:	fb873703          	ld	a4,-72(a4) # 8000bc18 <_ZL10waitForAll>
    80003c68:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80003c6c:	00048793          	mv	a5,s1
    80003c70:	00349513          	slli	a0,s1,0x3
    80003c74:	00aa8533          	add	a0,s5,a0
    80003c78:	fa9054e3          	blez	s1,80003c20 <_Z22producerConsumer_C_APIv+0x1c8>
    80003c7c:	00000597          	auipc	a1,0x0
    80003c80:	c6858593          	addi	a1,a1,-920 # 800038e4 <_ZL8producerPv>
    80003c84:	fa5ff06f          	j	80003c28 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80003c88:	ffffd097          	auipc	ra,0xffffd
    80003c8c:	7a0080e7          	jalr	1952(ra) # 80001428 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80003c90:	00000493          	li	s1,0
    80003c94:	00994e63          	blt	s2,s1,80003cb0 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80003c98:	00008517          	auipc	a0,0x8
    80003c9c:	f8053503          	ld	a0,-128(a0) # 8000bc18 <_ZL10waitForAll>
    80003ca0:	ffffe097          	auipc	ra,0xffffe
    80003ca4:	868080e7          	jalr	-1944(ra) # 80001508 <_Z8sem_waitP4KSem>
    for (int i = 0; i <= threadNum; i++) {
    80003ca8:	0014849b          	addiw	s1,s1,1
    80003cac:	fe9ff06f          	j	80003c94 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80003cb0:	00008517          	auipc	a0,0x8
    80003cb4:	f6853503          	ld	a0,-152(a0) # 8000bc18 <_ZL10waitForAll>
    80003cb8:	ffffe097          	auipc	ra,0xffffe
    80003cbc:	820080e7          	jalr	-2016(ra) # 800014d8 <_Z9sem_closeP4KSem>
    delete buffer;
    80003cc0:	000a0e63          	beqz	s4,80003cdc <_Z22producerConsumer_C_APIv+0x284>
    80003cc4:	000a0513          	mv	a0,s4
    80003cc8:	00003097          	auipc	ra,0x3
    80003ccc:	154080e7          	jalr	340(ra) # 80006e1c <_ZN6BufferD1Ev>
    80003cd0:	000a0513          	mv	a0,s4
    80003cd4:	ffffe097          	auipc	ra,0xffffe
    80003cd8:	7e4080e7          	jalr	2020(ra) # 800024b8 <_ZdlPv>
    80003cdc:	000b0113          	mv	sp,s6

}
    80003ce0:	f9040113          	addi	sp,s0,-112
    80003ce4:	06813083          	ld	ra,104(sp)
    80003ce8:	06013403          	ld	s0,96(sp)
    80003cec:	05813483          	ld	s1,88(sp)
    80003cf0:	05013903          	ld	s2,80(sp)
    80003cf4:	04813983          	ld	s3,72(sp)
    80003cf8:	04013a03          	ld	s4,64(sp)
    80003cfc:	03813a83          	ld	s5,56(sp)
    80003d00:	03013b03          	ld	s6,48(sp)
    80003d04:	07010113          	addi	sp,sp,112
    80003d08:	00008067          	ret
    80003d0c:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80003d10:	000a0513          	mv	a0,s4
    80003d14:	ffffe097          	auipc	ra,0xffffe
    80003d18:	7a4080e7          	jalr	1956(ra) # 800024b8 <_ZdlPv>
    80003d1c:	00048513          	mv	a0,s1
    80003d20:	00009097          	auipc	ra,0x9
    80003d24:	008080e7          	jalr	8(ra) # 8000cd28 <_Unwind_Resume>

0000000080003d28 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003d28:	fe010113          	addi	sp,sp,-32
    80003d2c:	00113c23          	sd	ra,24(sp)
    80003d30:	00813823          	sd	s0,16(sp)
    80003d34:	00913423          	sd	s1,8(sp)
    80003d38:	01213023          	sd	s2,0(sp)
    80003d3c:	02010413          	addi	s0,sp,32
    80003d40:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003d44:	00100793          	li	a5,1
    80003d48:	02a7f863          	bgeu	a5,a0,80003d78 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80003d4c:	00a00793          	li	a5,10
    80003d50:	02f577b3          	remu	a5,a0,a5
    80003d54:	02078e63          	beqz	a5,80003d90 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80003d58:	fff48513          	addi	a0,s1,-1
    80003d5c:	00000097          	auipc	ra,0x0
    80003d60:	fcc080e7          	jalr	-52(ra) # 80003d28 <_ZL9fibonaccim>
    80003d64:	00050913          	mv	s2,a0
    80003d68:	ffe48513          	addi	a0,s1,-2
    80003d6c:	00000097          	auipc	ra,0x0
    80003d70:	fbc080e7          	jalr	-68(ra) # 80003d28 <_ZL9fibonaccim>
    80003d74:	00a90533          	add	a0,s2,a0
}
    80003d78:	01813083          	ld	ra,24(sp)
    80003d7c:	01013403          	ld	s0,16(sp)
    80003d80:	00813483          	ld	s1,8(sp)
    80003d84:	00013903          	ld	s2,0(sp)
    80003d88:	02010113          	addi	sp,sp,32
    80003d8c:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80003d90:	ffffd097          	auipc	ra,0xffffd
    80003d94:	698080e7          	jalr	1688(ra) # 80001428 <_Z15thread_dispatchv>
    80003d98:	fc1ff06f          	j	80003d58 <_ZL9fibonaccim+0x30>

0000000080003d9c <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80003d9c:	fe010113          	addi	sp,sp,-32
    80003da0:	00113c23          	sd	ra,24(sp)
    80003da4:	00813823          	sd	s0,16(sp)
    80003da8:	00913423          	sd	s1,8(sp)
    80003dac:	01213023          	sd	s2,0(sp)
    80003db0:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003db4:	00000913          	li	s2,0
    80003db8:	0380006f          	j	80003df0 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003dbc:	ffffd097          	auipc	ra,0xffffd
    80003dc0:	66c080e7          	jalr	1644(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003dc4:	00148493          	addi	s1,s1,1
    80003dc8:	000027b7          	lui	a5,0x2
    80003dcc:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003dd0:	0097ee63          	bltu	a5,s1,80003dec <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003dd4:	00000713          	li	a4,0
    80003dd8:	000077b7          	lui	a5,0x7
    80003ddc:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003de0:	fce7eee3          	bltu	a5,a4,80003dbc <_ZN7WorkerA11workerBodyAEPv+0x20>
    80003de4:	00170713          	addi	a4,a4,1
    80003de8:	ff1ff06f          	j	80003dd8 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003dec:	00190913          	addi	s2,s2,1
    80003df0:	00900793          	li	a5,9
    80003df4:	0527e063          	bltu	a5,s2,80003e34 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003df8:	00005517          	auipc	a0,0x5
    80003dfc:	52850513          	addi	a0,a0,1320 # 80009320 <_ZZ9kPrintIntmE6digits+0x2b0>
    80003e00:	00002097          	auipc	ra,0x2
    80003e04:	eac080e7          	jalr	-340(ra) # 80005cac <_Z11printStringPKc>
    80003e08:	00000613          	li	a2,0
    80003e0c:	00a00593          	li	a1,10
    80003e10:	0009051b          	sext.w	a0,s2
    80003e14:	00002097          	auipc	ra,0x2
    80003e18:	048080e7          	jalr	72(ra) # 80005e5c <_Z8printIntiii>
    80003e1c:	00005517          	auipc	a0,0x5
    80003e20:	76450513          	addi	a0,a0,1892 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80003e24:	00002097          	auipc	ra,0x2
    80003e28:	e88080e7          	jalr	-376(ra) # 80005cac <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003e2c:	00000493          	li	s1,0
    80003e30:	f99ff06f          	j	80003dc8 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003e34:	00005517          	auipc	a0,0x5
    80003e38:	4f450513          	addi	a0,a0,1268 # 80009328 <_ZZ9kPrintIntmE6digits+0x2b8>
    80003e3c:	00002097          	auipc	ra,0x2
    80003e40:	e70080e7          	jalr	-400(ra) # 80005cac <_Z11printStringPKc>
    finishedA = true;
    80003e44:	00100793          	li	a5,1
    80003e48:	00008717          	auipc	a4,0x8
    80003e4c:	dcf70c23          	sb	a5,-552(a4) # 8000bc20 <_ZL9finishedA>
}
    80003e50:	01813083          	ld	ra,24(sp)
    80003e54:	01013403          	ld	s0,16(sp)
    80003e58:	00813483          	ld	s1,8(sp)
    80003e5c:	00013903          	ld	s2,0(sp)
    80003e60:	02010113          	addi	sp,sp,32
    80003e64:	00008067          	ret

0000000080003e68 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80003e68:	fe010113          	addi	sp,sp,-32
    80003e6c:	00113c23          	sd	ra,24(sp)
    80003e70:	00813823          	sd	s0,16(sp)
    80003e74:	00913423          	sd	s1,8(sp)
    80003e78:	01213023          	sd	s2,0(sp)
    80003e7c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003e80:	00000913          	li	s2,0
    80003e84:	0380006f          	j	80003ebc <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003e88:	ffffd097          	auipc	ra,0xffffd
    80003e8c:	5a0080e7          	jalr	1440(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003e90:	00148493          	addi	s1,s1,1
    80003e94:	000027b7          	lui	a5,0x2
    80003e98:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003e9c:	0097ee63          	bltu	a5,s1,80003eb8 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003ea0:	00000713          	li	a4,0
    80003ea4:	000077b7          	lui	a5,0x7
    80003ea8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003eac:	fce7eee3          	bltu	a5,a4,80003e88 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80003eb0:	00170713          	addi	a4,a4,1
    80003eb4:	ff1ff06f          	j	80003ea4 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003eb8:	00190913          	addi	s2,s2,1
    80003ebc:	00f00793          	li	a5,15
    80003ec0:	0527e063          	bltu	a5,s2,80003f00 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003ec4:	00005517          	auipc	a0,0x5
    80003ec8:	47450513          	addi	a0,a0,1140 # 80009338 <_ZZ9kPrintIntmE6digits+0x2c8>
    80003ecc:	00002097          	auipc	ra,0x2
    80003ed0:	de0080e7          	jalr	-544(ra) # 80005cac <_Z11printStringPKc>
    80003ed4:	00000613          	li	a2,0
    80003ed8:	00a00593          	li	a1,10
    80003edc:	0009051b          	sext.w	a0,s2
    80003ee0:	00002097          	auipc	ra,0x2
    80003ee4:	f7c080e7          	jalr	-132(ra) # 80005e5c <_Z8printIntiii>
    80003ee8:	00005517          	auipc	a0,0x5
    80003eec:	69850513          	addi	a0,a0,1688 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80003ef0:	00002097          	auipc	ra,0x2
    80003ef4:	dbc080e7          	jalr	-580(ra) # 80005cac <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003ef8:	00000493          	li	s1,0
    80003efc:	f99ff06f          	j	80003e94 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80003f00:	00005517          	auipc	a0,0x5
    80003f04:	44050513          	addi	a0,a0,1088 # 80009340 <_ZZ9kPrintIntmE6digits+0x2d0>
    80003f08:	00002097          	auipc	ra,0x2
    80003f0c:	da4080e7          	jalr	-604(ra) # 80005cac <_Z11printStringPKc>
    finishedB = true;
    80003f10:	00100793          	li	a5,1
    80003f14:	00008717          	auipc	a4,0x8
    80003f18:	d0f706a3          	sb	a5,-755(a4) # 8000bc21 <_ZL9finishedB>
    thread_dispatch();
    80003f1c:	ffffd097          	auipc	ra,0xffffd
    80003f20:	50c080e7          	jalr	1292(ra) # 80001428 <_Z15thread_dispatchv>
}
    80003f24:	01813083          	ld	ra,24(sp)
    80003f28:	01013403          	ld	s0,16(sp)
    80003f2c:	00813483          	ld	s1,8(sp)
    80003f30:	00013903          	ld	s2,0(sp)
    80003f34:	02010113          	addi	sp,sp,32
    80003f38:	00008067          	ret

0000000080003f3c <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80003f3c:	fe010113          	addi	sp,sp,-32
    80003f40:	00113c23          	sd	ra,24(sp)
    80003f44:	00813823          	sd	s0,16(sp)
    80003f48:	00913423          	sd	s1,8(sp)
    80003f4c:	01213023          	sd	s2,0(sp)
    80003f50:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80003f54:	00000493          	li	s1,0
    80003f58:	0400006f          	j	80003f98 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003f5c:	00005517          	auipc	a0,0x5
    80003f60:	3f450513          	addi	a0,a0,1012 # 80009350 <_ZZ9kPrintIntmE6digits+0x2e0>
    80003f64:	00002097          	auipc	ra,0x2
    80003f68:	d48080e7          	jalr	-696(ra) # 80005cac <_Z11printStringPKc>
    80003f6c:	00000613          	li	a2,0
    80003f70:	00a00593          	li	a1,10
    80003f74:	00048513          	mv	a0,s1
    80003f78:	00002097          	auipc	ra,0x2
    80003f7c:	ee4080e7          	jalr	-284(ra) # 80005e5c <_Z8printIntiii>
    80003f80:	00005517          	auipc	a0,0x5
    80003f84:	60050513          	addi	a0,a0,1536 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80003f88:	00002097          	auipc	ra,0x2
    80003f8c:	d24080e7          	jalr	-732(ra) # 80005cac <_Z11printStringPKc>
    for (; i < 3; i++) {
    80003f90:	0014849b          	addiw	s1,s1,1
    80003f94:	0ff4f493          	andi	s1,s1,255
    80003f98:	00200793          	li	a5,2
    80003f9c:	fc97f0e3          	bgeu	a5,s1,80003f5c <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80003fa0:	00005517          	auipc	a0,0x5
    80003fa4:	3b850513          	addi	a0,a0,952 # 80009358 <_ZZ9kPrintIntmE6digits+0x2e8>
    80003fa8:	00002097          	auipc	ra,0x2
    80003fac:	d04080e7          	jalr	-764(ra) # 80005cac <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80003fb0:	00700313          	li	t1,7
    thread_dispatch();
    80003fb4:	ffffd097          	auipc	ra,0xffffd
    80003fb8:	474080e7          	jalr	1140(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80003fbc:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80003fc0:	00005517          	auipc	a0,0x5
    80003fc4:	3a850513          	addi	a0,a0,936 # 80009368 <_ZZ9kPrintIntmE6digits+0x2f8>
    80003fc8:	00002097          	auipc	ra,0x2
    80003fcc:	ce4080e7          	jalr	-796(ra) # 80005cac <_Z11printStringPKc>
    80003fd0:	00000613          	li	a2,0
    80003fd4:	00a00593          	li	a1,10
    80003fd8:	0009051b          	sext.w	a0,s2
    80003fdc:	00002097          	auipc	ra,0x2
    80003fe0:	e80080e7          	jalr	-384(ra) # 80005e5c <_Z8printIntiii>
    80003fe4:	00005517          	auipc	a0,0x5
    80003fe8:	59c50513          	addi	a0,a0,1436 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80003fec:	00002097          	auipc	ra,0x2
    80003ff0:	cc0080e7          	jalr	-832(ra) # 80005cac <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80003ff4:	00c00513          	li	a0,12
    80003ff8:	00000097          	auipc	ra,0x0
    80003ffc:	d30080e7          	jalr	-720(ra) # 80003d28 <_ZL9fibonaccim>
    80004000:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80004004:	00005517          	auipc	a0,0x5
    80004008:	36c50513          	addi	a0,a0,876 # 80009370 <_ZZ9kPrintIntmE6digits+0x300>
    8000400c:	00002097          	auipc	ra,0x2
    80004010:	ca0080e7          	jalr	-864(ra) # 80005cac <_Z11printStringPKc>
    80004014:	00000613          	li	a2,0
    80004018:	00a00593          	li	a1,10
    8000401c:	0009051b          	sext.w	a0,s2
    80004020:	00002097          	auipc	ra,0x2
    80004024:	e3c080e7          	jalr	-452(ra) # 80005e5c <_Z8printIntiii>
    80004028:	00005517          	auipc	a0,0x5
    8000402c:	55850513          	addi	a0,a0,1368 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80004030:	00002097          	auipc	ra,0x2
    80004034:	c7c080e7          	jalr	-900(ra) # 80005cac <_Z11printStringPKc>
    80004038:	0400006f          	j	80004078 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    8000403c:	00005517          	auipc	a0,0x5
    80004040:	31450513          	addi	a0,a0,788 # 80009350 <_ZZ9kPrintIntmE6digits+0x2e0>
    80004044:	00002097          	auipc	ra,0x2
    80004048:	c68080e7          	jalr	-920(ra) # 80005cac <_Z11printStringPKc>
    8000404c:	00000613          	li	a2,0
    80004050:	00a00593          	li	a1,10
    80004054:	00048513          	mv	a0,s1
    80004058:	00002097          	auipc	ra,0x2
    8000405c:	e04080e7          	jalr	-508(ra) # 80005e5c <_Z8printIntiii>
    80004060:	00005517          	auipc	a0,0x5
    80004064:	52050513          	addi	a0,a0,1312 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80004068:	00002097          	auipc	ra,0x2
    8000406c:	c44080e7          	jalr	-956(ra) # 80005cac <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004070:	0014849b          	addiw	s1,s1,1
    80004074:	0ff4f493          	andi	s1,s1,255
    80004078:	00500793          	li	a5,5
    8000407c:	fc97f0e3          	bgeu	a5,s1,8000403c <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("C finished!\n");
    80004080:	00005517          	auipc	a0,0x5
    80004084:	30050513          	addi	a0,a0,768 # 80009380 <_ZZ9kPrintIntmE6digits+0x310>
    80004088:	00002097          	auipc	ra,0x2
    8000408c:	c24080e7          	jalr	-988(ra) # 80005cac <_Z11printStringPKc>
    finishedC = true;
    80004090:	00100793          	li	a5,1
    80004094:	00008717          	auipc	a4,0x8
    80004098:	b8f70723          	sb	a5,-1138(a4) # 8000bc22 <_ZL9finishedC>
    thread_dispatch();
    8000409c:	ffffd097          	auipc	ra,0xffffd
    800040a0:	38c080e7          	jalr	908(ra) # 80001428 <_Z15thread_dispatchv>
}
    800040a4:	01813083          	ld	ra,24(sp)
    800040a8:	01013403          	ld	s0,16(sp)
    800040ac:	00813483          	ld	s1,8(sp)
    800040b0:	00013903          	ld	s2,0(sp)
    800040b4:	02010113          	addi	sp,sp,32
    800040b8:	00008067          	ret

00000000800040bc <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    800040bc:	fe010113          	addi	sp,sp,-32
    800040c0:	00113c23          	sd	ra,24(sp)
    800040c4:	00813823          	sd	s0,16(sp)
    800040c8:	00913423          	sd	s1,8(sp)
    800040cc:	01213023          	sd	s2,0(sp)
    800040d0:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800040d4:	00a00493          	li	s1,10
    800040d8:	0400006f          	j	80004118 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800040dc:	00005517          	auipc	a0,0x5
    800040e0:	2b450513          	addi	a0,a0,692 # 80009390 <_ZZ9kPrintIntmE6digits+0x320>
    800040e4:	00002097          	auipc	ra,0x2
    800040e8:	bc8080e7          	jalr	-1080(ra) # 80005cac <_Z11printStringPKc>
    800040ec:	00000613          	li	a2,0
    800040f0:	00a00593          	li	a1,10
    800040f4:	00048513          	mv	a0,s1
    800040f8:	00002097          	auipc	ra,0x2
    800040fc:	d64080e7          	jalr	-668(ra) # 80005e5c <_Z8printIntiii>
    80004100:	00005517          	auipc	a0,0x5
    80004104:	48050513          	addi	a0,a0,1152 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80004108:	00002097          	auipc	ra,0x2
    8000410c:	ba4080e7          	jalr	-1116(ra) # 80005cac <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004110:	0014849b          	addiw	s1,s1,1
    80004114:	0ff4f493          	andi	s1,s1,255
    80004118:	00c00793          	li	a5,12
    8000411c:	fc97f0e3          	bgeu	a5,s1,800040dc <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80004120:	00005517          	auipc	a0,0x5
    80004124:	27850513          	addi	a0,a0,632 # 80009398 <_ZZ9kPrintIntmE6digits+0x328>
    80004128:	00002097          	auipc	ra,0x2
    8000412c:	b84080e7          	jalr	-1148(ra) # 80005cac <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004130:	00500313          	li	t1,5
    thread_dispatch();
    80004134:	ffffd097          	auipc	ra,0xffffd
    80004138:	2f4080e7          	jalr	756(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    8000413c:	01000513          	li	a0,16
    80004140:	00000097          	auipc	ra,0x0
    80004144:	be8080e7          	jalr	-1048(ra) # 80003d28 <_ZL9fibonaccim>
    80004148:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    8000414c:	00005517          	auipc	a0,0x5
    80004150:	25c50513          	addi	a0,a0,604 # 800093a8 <_ZZ9kPrintIntmE6digits+0x338>
    80004154:	00002097          	auipc	ra,0x2
    80004158:	b58080e7          	jalr	-1192(ra) # 80005cac <_Z11printStringPKc>
    8000415c:	00000613          	li	a2,0
    80004160:	00a00593          	li	a1,10
    80004164:	0009051b          	sext.w	a0,s2
    80004168:	00002097          	auipc	ra,0x2
    8000416c:	cf4080e7          	jalr	-780(ra) # 80005e5c <_Z8printIntiii>
    80004170:	00005517          	auipc	a0,0x5
    80004174:	41050513          	addi	a0,a0,1040 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80004178:	00002097          	auipc	ra,0x2
    8000417c:	b34080e7          	jalr	-1228(ra) # 80005cac <_Z11printStringPKc>
    80004180:	0400006f          	j	800041c0 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004184:	00005517          	auipc	a0,0x5
    80004188:	20c50513          	addi	a0,a0,524 # 80009390 <_ZZ9kPrintIntmE6digits+0x320>
    8000418c:	00002097          	auipc	ra,0x2
    80004190:	b20080e7          	jalr	-1248(ra) # 80005cac <_Z11printStringPKc>
    80004194:	00000613          	li	a2,0
    80004198:	00a00593          	li	a1,10
    8000419c:	00048513          	mv	a0,s1
    800041a0:	00002097          	auipc	ra,0x2
    800041a4:	cbc080e7          	jalr	-836(ra) # 80005e5c <_Z8printIntiii>
    800041a8:	00005517          	auipc	a0,0x5
    800041ac:	3d850513          	addi	a0,a0,984 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    800041b0:	00002097          	auipc	ra,0x2
    800041b4:	afc080e7          	jalr	-1284(ra) # 80005cac <_Z11printStringPKc>
    for (; i < 16; i++) {
    800041b8:	0014849b          	addiw	s1,s1,1
    800041bc:	0ff4f493          	andi	s1,s1,255
    800041c0:	00f00793          	li	a5,15
    800041c4:	fc97f0e3          	bgeu	a5,s1,80004184 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    800041c8:	00005517          	auipc	a0,0x5
    800041cc:	1f050513          	addi	a0,a0,496 # 800093b8 <_ZZ9kPrintIntmE6digits+0x348>
    800041d0:	00002097          	auipc	ra,0x2
    800041d4:	adc080e7          	jalr	-1316(ra) # 80005cac <_Z11printStringPKc>
    finishedD = true;
    800041d8:	00100793          	li	a5,1
    800041dc:	00008717          	auipc	a4,0x8
    800041e0:	a4f703a3          	sb	a5,-1465(a4) # 8000bc23 <_ZL9finishedD>
    thread_dispatch();
    800041e4:	ffffd097          	auipc	ra,0xffffd
    800041e8:	244080e7          	jalr	580(ra) # 80001428 <_Z15thread_dispatchv>
}
    800041ec:	01813083          	ld	ra,24(sp)
    800041f0:	01013403          	ld	s0,16(sp)
    800041f4:	00813483          	ld	s1,8(sp)
    800041f8:	00013903          	ld	s2,0(sp)
    800041fc:	02010113          	addi	sp,sp,32
    80004200:	00008067          	ret

0000000080004204 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80004204:	fc010113          	addi	sp,sp,-64
    80004208:	02113c23          	sd	ra,56(sp)
    8000420c:	02813823          	sd	s0,48(sp)
    80004210:	02913423          	sd	s1,40(sp)
    80004214:	03213023          	sd	s2,32(sp)
    80004218:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    8000421c:	02000513          	li	a0,32
    80004220:	ffffe097          	auipc	ra,0xffffe
    80004224:	248080e7          	jalr	584(ra) # 80002468 <_Znwm>
    80004228:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    8000422c:	ffffe097          	auipc	ra,0xffffe
    80004230:	504080e7          	jalr	1284(ra) # 80002730 <_ZN6ThreadC1Ev>
    80004234:	00007797          	auipc	a5,0x7
    80004238:	67c78793          	addi	a5,a5,1660 # 8000b8b0 <_ZTV7WorkerA+0x10>
    8000423c:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80004240:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80004244:	00005517          	auipc	a0,0x5
    80004248:	18450513          	addi	a0,a0,388 # 800093c8 <_ZZ9kPrintIntmE6digits+0x358>
    8000424c:	00002097          	auipc	ra,0x2
    80004250:	a60080e7          	jalr	-1440(ra) # 80005cac <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80004254:	02000513          	li	a0,32
    80004258:	ffffe097          	auipc	ra,0xffffe
    8000425c:	210080e7          	jalr	528(ra) # 80002468 <_Znwm>
    80004260:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80004264:	ffffe097          	auipc	ra,0xffffe
    80004268:	4cc080e7          	jalr	1228(ra) # 80002730 <_ZN6ThreadC1Ev>
    8000426c:	00007797          	auipc	a5,0x7
    80004270:	66c78793          	addi	a5,a5,1644 # 8000b8d8 <_ZTV7WorkerB+0x10>
    80004274:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80004278:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    8000427c:	00005517          	auipc	a0,0x5
    80004280:	16450513          	addi	a0,a0,356 # 800093e0 <_ZZ9kPrintIntmE6digits+0x370>
    80004284:	00002097          	auipc	ra,0x2
    80004288:	a28080e7          	jalr	-1496(ra) # 80005cac <_Z11printStringPKc>

    threads[2] = new WorkerC();
    8000428c:	02000513          	li	a0,32
    80004290:	ffffe097          	auipc	ra,0xffffe
    80004294:	1d8080e7          	jalr	472(ra) # 80002468 <_Znwm>
    80004298:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    8000429c:	ffffe097          	auipc	ra,0xffffe
    800042a0:	494080e7          	jalr	1172(ra) # 80002730 <_ZN6ThreadC1Ev>
    800042a4:	00007797          	auipc	a5,0x7
    800042a8:	65c78793          	addi	a5,a5,1628 # 8000b900 <_ZTV7WorkerC+0x10>
    800042ac:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    800042b0:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    800042b4:	00005517          	auipc	a0,0x5
    800042b8:	14450513          	addi	a0,a0,324 # 800093f8 <_ZZ9kPrintIntmE6digits+0x388>
    800042bc:	00002097          	auipc	ra,0x2
    800042c0:	9f0080e7          	jalr	-1552(ra) # 80005cac <_Z11printStringPKc>

    threads[3] = new WorkerD();
    800042c4:	02000513          	li	a0,32
    800042c8:	ffffe097          	auipc	ra,0xffffe
    800042cc:	1a0080e7          	jalr	416(ra) # 80002468 <_Znwm>
    800042d0:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    800042d4:	ffffe097          	auipc	ra,0xffffe
    800042d8:	45c080e7          	jalr	1116(ra) # 80002730 <_ZN6ThreadC1Ev>
    800042dc:	00007797          	auipc	a5,0x7
    800042e0:	64c78793          	addi	a5,a5,1612 # 8000b928 <_ZTV7WorkerD+0x10>
    800042e4:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    800042e8:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    800042ec:	00005517          	auipc	a0,0x5
    800042f0:	12450513          	addi	a0,a0,292 # 80009410 <_ZZ9kPrintIntmE6digits+0x3a0>
    800042f4:	00002097          	auipc	ra,0x2
    800042f8:	9b8080e7          	jalr	-1608(ra) # 80005cac <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    800042fc:	00000493          	li	s1,0
    80004300:	00300793          	li	a5,3
    80004304:	0297c663          	blt	a5,s1,80004330 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80004308:	00349793          	slli	a5,s1,0x3
    8000430c:	fe040713          	addi	a4,s0,-32
    80004310:	00f707b3          	add	a5,a4,a5
    80004314:	fe07b503          	ld	a0,-32(a5)
    80004318:	ffffe097          	auipc	ra,0xffffe
    8000431c:	300080e7          	jalr	768(ra) # 80002618 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80004320:	0014849b          	addiw	s1,s1,1
    80004324:	fddff06f          	j	80004300 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80004328:	ffffe097          	auipc	ra,0xffffe
    8000432c:	354080e7          	jalr	852(ra) # 8000267c <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80004330:	00008797          	auipc	a5,0x8
    80004334:	8f07c783          	lbu	a5,-1808(a5) # 8000bc20 <_ZL9finishedA>
    80004338:	fe0788e3          	beqz	a5,80004328 <_Z20Threads_CPP_API_testv+0x124>
    8000433c:	00008797          	auipc	a5,0x8
    80004340:	8e57c783          	lbu	a5,-1819(a5) # 8000bc21 <_ZL9finishedB>
    80004344:	fe0782e3          	beqz	a5,80004328 <_Z20Threads_CPP_API_testv+0x124>
    80004348:	00008797          	auipc	a5,0x8
    8000434c:	8da7c783          	lbu	a5,-1830(a5) # 8000bc22 <_ZL9finishedC>
    80004350:	fc078ce3          	beqz	a5,80004328 <_Z20Threads_CPP_API_testv+0x124>
    80004354:	00008797          	auipc	a5,0x8
    80004358:	8cf7c783          	lbu	a5,-1841(a5) # 8000bc23 <_ZL9finishedD>
    8000435c:	fc0786e3          	beqz	a5,80004328 <_Z20Threads_CPP_API_testv+0x124>
    80004360:	fc040493          	addi	s1,s0,-64
    80004364:	0080006f          	j	8000436c <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) {
    80004368:	00848493          	addi	s1,s1,8
    8000436c:	fe040793          	addi	a5,s0,-32
    80004370:	08f48663          	beq	s1,a5,800043fc <_Z20Threads_CPP_API_testv+0x1f8>
    80004374:	0004b503          	ld	a0,0(s1)
		delete thread;
    80004378:	fe0508e3          	beqz	a0,80004368 <_Z20Threads_CPP_API_testv+0x164>
    8000437c:	00053783          	ld	a5,0(a0)
    80004380:	0087b783          	ld	a5,8(a5)
    80004384:	000780e7          	jalr	a5
    80004388:	fe1ff06f          	j	80004368 <_Z20Threads_CPP_API_testv+0x164>
    8000438c:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80004390:	00048513          	mv	a0,s1
    80004394:	ffffe097          	auipc	ra,0xffffe
    80004398:	124080e7          	jalr	292(ra) # 800024b8 <_ZdlPv>
    8000439c:	00090513          	mv	a0,s2
    800043a0:	00009097          	auipc	ra,0x9
    800043a4:	988080e7          	jalr	-1656(ra) # 8000cd28 <_Unwind_Resume>
    800043a8:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    800043ac:	00048513          	mv	a0,s1
    800043b0:	ffffe097          	auipc	ra,0xffffe
    800043b4:	108080e7          	jalr	264(ra) # 800024b8 <_ZdlPv>
    800043b8:	00090513          	mv	a0,s2
    800043bc:	00009097          	auipc	ra,0x9
    800043c0:	96c080e7          	jalr	-1684(ra) # 8000cd28 <_Unwind_Resume>
    800043c4:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    800043c8:	00048513          	mv	a0,s1
    800043cc:	ffffe097          	auipc	ra,0xffffe
    800043d0:	0ec080e7          	jalr	236(ra) # 800024b8 <_ZdlPv>
    800043d4:	00090513          	mv	a0,s2
    800043d8:	00009097          	auipc	ra,0x9
    800043dc:	950080e7          	jalr	-1712(ra) # 8000cd28 <_Unwind_Resume>
    800043e0:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    800043e4:	00048513          	mv	a0,s1
    800043e8:	ffffe097          	auipc	ra,0xffffe
    800043ec:	0d0080e7          	jalr	208(ra) # 800024b8 <_ZdlPv>
    800043f0:	00090513          	mv	a0,s2
    800043f4:	00009097          	auipc	ra,0x9
    800043f8:	934080e7          	jalr	-1740(ra) # 8000cd28 <_Unwind_Resume>
	}
}
    800043fc:	03813083          	ld	ra,56(sp)
    80004400:	03013403          	ld	s0,48(sp)
    80004404:	02813483          	ld	s1,40(sp)
    80004408:	02013903          	ld	s2,32(sp)
    8000440c:	04010113          	addi	sp,sp,64
    80004410:	00008067          	ret

0000000080004414 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80004414:	ff010113          	addi	sp,sp,-16
    80004418:	00113423          	sd	ra,8(sp)
    8000441c:	00813023          	sd	s0,0(sp)
    80004420:	01010413          	addi	s0,sp,16
    80004424:	00007797          	auipc	a5,0x7
    80004428:	48c78793          	addi	a5,a5,1164 # 8000b8b0 <_ZTV7WorkerA+0x10>
    8000442c:	00f53023          	sd	a5,0(a0)
    80004430:	ffffe097          	auipc	ra,0xffffe
    80004434:	f48080e7          	jalr	-184(ra) # 80002378 <_ZN6ThreadD1Ev>
    80004438:	00813083          	ld	ra,8(sp)
    8000443c:	00013403          	ld	s0,0(sp)
    80004440:	01010113          	addi	sp,sp,16
    80004444:	00008067          	ret

0000000080004448 <_ZN7WorkerAD0Ev>:
    80004448:	fe010113          	addi	sp,sp,-32
    8000444c:	00113c23          	sd	ra,24(sp)
    80004450:	00813823          	sd	s0,16(sp)
    80004454:	00913423          	sd	s1,8(sp)
    80004458:	02010413          	addi	s0,sp,32
    8000445c:	00050493          	mv	s1,a0
    80004460:	00007797          	auipc	a5,0x7
    80004464:	45078793          	addi	a5,a5,1104 # 8000b8b0 <_ZTV7WorkerA+0x10>
    80004468:	00f53023          	sd	a5,0(a0)
    8000446c:	ffffe097          	auipc	ra,0xffffe
    80004470:	f0c080e7          	jalr	-244(ra) # 80002378 <_ZN6ThreadD1Ev>
    80004474:	00048513          	mv	a0,s1
    80004478:	ffffe097          	auipc	ra,0xffffe
    8000447c:	040080e7          	jalr	64(ra) # 800024b8 <_ZdlPv>
    80004480:	01813083          	ld	ra,24(sp)
    80004484:	01013403          	ld	s0,16(sp)
    80004488:	00813483          	ld	s1,8(sp)
    8000448c:	02010113          	addi	sp,sp,32
    80004490:	00008067          	ret

0000000080004494 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80004494:	ff010113          	addi	sp,sp,-16
    80004498:	00113423          	sd	ra,8(sp)
    8000449c:	00813023          	sd	s0,0(sp)
    800044a0:	01010413          	addi	s0,sp,16
    800044a4:	00007797          	auipc	a5,0x7
    800044a8:	43478793          	addi	a5,a5,1076 # 8000b8d8 <_ZTV7WorkerB+0x10>
    800044ac:	00f53023          	sd	a5,0(a0)
    800044b0:	ffffe097          	auipc	ra,0xffffe
    800044b4:	ec8080e7          	jalr	-312(ra) # 80002378 <_ZN6ThreadD1Ev>
    800044b8:	00813083          	ld	ra,8(sp)
    800044bc:	00013403          	ld	s0,0(sp)
    800044c0:	01010113          	addi	sp,sp,16
    800044c4:	00008067          	ret

00000000800044c8 <_ZN7WorkerBD0Ev>:
    800044c8:	fe010113          	addi	sp,sp,-32
    800044cc:	00113c23          	sd	ra,24(sp)
    800044d0:	00813823          	sd	s0,16(sp)
    800044d4:	00913423          	sd	s1,8(sp)
    800044d8:	02010413          	addi	s0,sp,32
    800044dc:	00050493          	mv	s1,a0
    800044e0:	00007797          	auipc	a5,0x7
    800044e4:	3f878793          	addi	a5,a5,1016 # 8000b8d8 <_ZTV7WorkerB+0x10>
    800044e8:	00f53023          	sd	a5,0(a0)
    800044ec:	ffffe097          	auipc	ra,0xffffe
    800044f0:	e8c080e7          	jalr	-372(ra) # 80002378 <_ZN6ThreadD1Ev>
    800044f4:	00048513          	mv	a0,s1
    800044f8:	ffffe097          	auipc	ra,0xffffe
    800044fc:	fc0080e7          	jalr	-64(ra) # 800024b8 <_ZdlPv>
    80004500:	01813083          	ld	ra,24(sp)
    80004504:	01013403          	ld	s0,16(sp)
    80004508:	00813483          	ld	s1,8(sp)
    8000450c:	02010113          	addi	sp,sp,32
    80004510:	00008067          	ret

0000000080004514 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80004514:	ff010113          	addi	sp,sp,-16
    80004518:	00113423          	sd	ra,8(sp)
    8000451c:	00813023          	sd	s0,0(sp)
    80004520:	01010413          	addi	s0,sp,16
    80004524:	00007797          	auipc	a5,0x7
    80004528:	3dc78793          	addi	a5,a5,988 # 8000b900 <_ZTV7WorkerC+0x10>
    8000452c:	00f53023          	sd	a5,0(a0)
    80004530:	ffffe097          	auipc	ra,0xffffe
    80004534:	e48080e7          	jalr	-440(ra) # 80002378 <_ZN6ThreadD1Ev>
    80004538:	00813083          	ld	ra,8(sp)
    8000453c:	00013403          	ld	s0,0(sp)
    80004540:	01010113          	addi	sp,sp,16
    80004544:	00008067          	ret

0000000080004548 <_ZN7WorkerCD0Ev>:
    80004548:	fe010113          	addi	sp,sp,-32
    8000454c:	00113c23          	sd	ra,24(sp)
    80004550:	00813823          	sd	s0,16(sp)
    80004554:	00913423          	sd	s1,8(sp)
    80004558:	02010413          	addi	s0,sp,32
    8000455c:	00050493          	mv	s1,a0
    80004560:	00007797          	auipc	a5,0x7
    80004564:	3a078793          	addi	a5,a5,928 # 8000b900 <_ZTV7WorkerC+0x10>
    80004568:	00f53023          	sd	a5,0(a0)
    8000456c:	ffffe097          	auipc	ra,0xffffe
    80004570:	e0c080e7          	jalr	-500(ra) # 80002378 <_ZN6ThreadD1Ev>
    80004574:	00048513          	mv	a0,s1
    80004578:	ffffe097          	auipc	ra,0xffffe
    8000457c:	f40080e7          	jalr	-192(ra) # 800024b8 <_ZdlPv>
    80004580:	01813083          	ld	ra,24(sp)
    80004584:	01013403          	ld	s0,16(sp)
    80004588:	00813483          	ld	s1,8(sp)
    8000458c:	02010113          	addi	sp,sp,32
    80004590:	00008067          	ret

0000000080004594 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80004594:	ff010113          	addi	sp,sp,-16
    80004598:	00113423          	sd	ra,8(sp)
    8000459c:	00813023          	sd	s0,0(sp)
    800045a0:	01010413          	addi	s0,sp,16
    800045a4:	00007797          	auipc	a5,0x7
    800045a8:	38478793          	addi	a5,a5,900 # 8000b928 <_ZTV7WorkerD+0x10>
    800045ac:	00f53023          	sd	a5,0(a0)
    800045b0:	ffffe097          	auipc	ra,0xffffe
    800045b4:	dc8080e7          	jalr	-568(ra) # 80002378 <_ZN6ThreadD1Ev>
    800045b8:	00813083          	ld	ra,8(sp)
    800045bc:	00013403          	ld	s0,0(sp)
    800045c0:	01010113          	addi	sp,sp,16
    800045c4:	00008067          	ret

00000000800045c8 <_ZN7WorkerDD0Ev>:
    800045c8:	fe010113          	addi	sp,sp,-32
    800045cc:	00113c23          	sd	ra,24(sp)
    800045d0:	00813823          	sd	s0,16(sp)
    800045d4:	00913423          	sd	s1,8(sp)
    800045d8:	02010413          	addi	s0,sp,32
    800045dc:	00050493          	mv	s1,a0
    800045e0:	00007797          	auipc	a5,0x7
    800045e4:	34878793          	addi	a5,a5,840 # 8000b928 <_ZTV7WorkerD+0x10>
    800045e8:	00f53023          	sd	a5,0(a0)
    800045ec:	ffffe097          	auipc	ra,0xffffe
    800045f0:	d8c080e7          	jalr	-628(ra) # 80002378 <_ZN6ThreadD1Ev>
    800045f4:	00048513          	mv	a0,s1
    800045f8:	ffffe097          	auipc	ra,0xffffe
    800045fc:	ec0080e7          	jalr	-320(ra) # 800024b8 <_ZdlPv>
    80004600:	01813083          	ld	ra,24(sp)
    80004604:	01013403          	ld	s0,16(sp)
    80004608:	00813483          	ld	s1,8(sp)
    8000460c:	02010113          	addi	sp,sp,32
    80004610:	00008067          	ret

0000000080004614 <_ZN7WorkerA3runEv>:
    void run() override {
    80004614:	ff010113          	addi	sp,sp,-16
    80004618:	00113423          	sd	ra,8(sp)
    8000461c:	00813023          	sd	s0,0(sp)
    80004620:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80004624:	00000593          	li	a1,0
    80004628:	fffff097          	auipc	ra,0xfffff
    8000462c:	774080e7          	jalr	1908(ra) # 80003d9c <_ZN7WorkerA11workerBodyAEPv>
    }
    80004630:	00813083          	ld	ra,8(sp)
    80004634:	00013403          	ld	s0,0(sp)
    80004638:	01010113          	addi	sp,sp,16
    8000463c:	00008067          	ret

0000000080004640 <_ZN7WorkerB3runEv>:
    void run() override {
    80004640:	ff010113          	addi	sp,sp,-16
    80004644:	00113423          	sd	ra,8(sp)
    80004648:	00813023          	sd	s0,0(sp)
    8000464c:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80004650:	00000593          	li	a1,0
    80004654:	00000097          	auipc	ra,0x0
    80004658:	814080e7          	jalr	-2028(ra) # 80003e68 <_ZN7WorkerB11workerBodyBEPv>
    }
    8000465c:	00813083          	ld	ra,8(sp)
    80004660:	00013403          	ld	s0,0(sp)
    80004664:	01010113          	addi	sp,sp,16
    80004668:	00008067          	ret

000000008000466c <_ZN7WorkerC3runEv>:
    void run() override {
    8000466c:	ff010113          	addi	sp,sp,-16
    80004670:	00113423          	sd	ra,8(sp)
    80004674:	00813023          	sd	s0,0(sp)
    80004678:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    8000467c:	00000593          	li	a1,0
    80004680:	00000097          	auipc	ra,0x0
    80004684:	8bc080e7          	jalr	-1860(ra) # 80003f3c <_ZN7WorkerC11workerBodyCEPv>
    }
    80004688:	00813083          	ld	ra,8(sp)
    8000468c:	00013403          	ld	s0,0(sp)
    80004690:	01010113          	addi	sp,sp,16
    80004694:	00008067          	ret

0000000080004698 <_ZN7WorkerD3runEv>:
    void run() override {
    80004698:	ff010113          	addi	sp,sp,-16
    8000469c:	00113423          	sd	ra,8(sp)
    800046a0:	00813023          	sd	s0,0(sp)
    800046a4:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    800046a8:	00000593          	li	a1,0
    800046ac:	00000097          	auipc	ra,0x0
    800046b0:	a10080e7          	jalr	-1520(ra) # 800040bc <_ZN7WorkerD11workerBodyDEPv>
    }
    800046b4:	00813083          	ld	ra,8(sp)
    800046b8:	00013403          	ld	s0,0(sp)
    800046bc:	01010113          	addi	sp,sp,16
    800046c0:	00008067          	ret

00000000800046c4 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    800046c4:	f8010113          	addi	sp,sp,-128
    800046c8:	06113c23          	sd	ra,120(sp)
    800046cc:	06813823          	sd	s0,112(sp)
    800046d0:	06913423          	sd	s1,104(sp)
    800046d4:	07213023          	sd	s2,96(sp)
    800046d8:	05313c23          	sd	s3,88(sp)
    800046dc:	05413823          	sd	s4,80(sp)
    800046e0:	05513423          	sd	s5,72(sp)
    800046e4:	05613023          	sd	s6,64(sp)
    800046e8:	03713c23          	sd	s7,56(sp)
    800046ec:	03813823          	sd	s8,48(sp)
    800046f0:	03913423          	sd	s9,40(sp)
    800046f4:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    800046f8:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    800046fc:	00005517          	auipc	a0,0x5
    80004700:	b3c50513          	addi	a0,a0,-1220 # 80009238 <_ZZ9kPrintIntmE6digits+0x1c8>
    80004704:	00001097          	auipc	ra,0x1
    80004708:	5a8080e7          	jalr	1448(ra) # 80005cac <_Z11printStringPKc>
    getString(input, 30);
    8000470c:	01e00593          	li	a1,30
    80004710:	f8040493          	addi	s1,s0,-128
    80004714:	00048513          	mv	a0,s1
    80004718:	00001097          	auipc	ra,0x1
    8000471c:	61c080e7          	jalr	1564(ra) # 80005d34 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80004720:	00048513          	mv	a0,s1
    80004724:	00001097          	auipc	ra,0x1
    80004728:	6e8080e7          	jalr	1768(ra) # 80005e0c <_Z11stringToIntPKc>
    8000472c:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    80004730:	00005517          	auipc	a0,0x5
    80004734:	b2850513          	addi	a0,a0,-1240 # 80009258 <_ZZ9kPrintIntmE6digits+0x1e8>
    80004738:	00001097          	auipc	ra,0x1
    8000473c:	574080e7          	jalr	1396(ra) # 80005cac <_Z11printStringPKc>
    getString(input, 30);
    80004740:	01e00593          	li	a1,30
    80004744:	00048513          	mv	a0,s1
    80004748:	00001097          	auipc	ra,0x1
    8000474c:	5ec080e7          	jalr	1516(ra) # 80005d34 <_Z9getStringPci>
    n = stringToInt(input);
    80004750:	00048513          	mv	a0,s1
    80004754:	00001097          	auipc	ra,0x1
    80004758:	6b8080e7          	jalr	1720(ra) # 80005e0c <_Z11stringToIntPKc>
    8000475c:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80004760:	00005517          	auipc	a0,0x5
    80004764:	b1850513          	addi	a0,a0,-1256 # 80009278 <_ZZ9kPrintIntmE6digits+0x208>
    80004768:	00001097          	auipc	ra,0x1
    8000476c:	544080e7          	jalr	1348(ra) # 80005cac <_Z11printStringPKc>
    printInt(threadNum);
    80004770:	00000613          	li	a2,0
    80004774:	00a00593          	li	a1,10
    80004778:	00098513          	mv	a0,s3
    8000477c:	00001097          	auipc	ra,0x1
    80004780:	6e0080e7          	jalr	1760(ra) # 80005e5c <_Z8printIntiii>
    printString(" i velicina bafera ");
    80004784:	00005517          	auipc	a0,0x5
    80004788:	b0c50513          	addi	a0,a0,-1268 # 80009290 <_ZZ9kPrintIntmE6digits+0x220>
    8000478c:	00001097          	auipc	ra,0x1
    80004790:	520080e7          	jalr	1312(ra) # 80005cac <_Z11printStringPKc>
    printInt(n);
    80004794:	00000613          	li	a2,0
    80004798:	00a00593          	li	a1,10
    8000479c:	00048513          	mv	a0,s1
    800047a0:	00001097          	auipc	ra,0x1
    800047a4:	6bc080e7          	jalr	1724(ra) # 80005e5c <_Z8printIntiii>
    printString(".\n");
    800047a8:	00005517          	auipc	a0,0x5
    800047ac:	b0050513          	addi	a0,a0,-1280 # 800092a8 <_ZZ9kPrintIntmE6digits+0x238>
    800047b0:	00001097          	auipc	ra,0x1
    800047b4:	4fc080e7          	jalr	1276(ra) # 80005cac <_Z11printStringPKc>
    if (threadNum > n) {
    800047b8:	0334c463          	blt	s1,s3,800047e0 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    800047bc:	03305c63          	blez	s3,800047f4 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    800047c0:	03800513          	li	a0,56
    800047c4:	ffffe097          	auipc	ra,0xffffe
    800047c8:	ca4080e7          	jalr	-860(ra) # 80002468 <_Znwm>
    800047cc:	00050a93          	mv	s5,a0
    800047d0:	00048593          	mv	a1,s1
    800047d4:	00001097          	auipc	ra,0x1
    800047d8:	7a8080e7          	jalr	1960(ra) # 80005f7c <_ZN9BufferCPPC1Ei>
    800047dc:	0300006f          	j	8000480c <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800047e0:	00005517          	auipc	a0,0x5
    800047e4:	ad050513          	addi	a0,a0,-1328 # 800092b0 <_ZZ9kPrintIntmE6digits+0x240>
    800047e8:	00001097          	auipc	ra,0x1
    800047ec:	4c4080e7          	jalr	1220(ra) # 80005cac <_Z11printStringPKc>
        return;
    800047f0:	0140006f          	j	80004804 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800047f4:	00005517          	auipc	a0,0x5
    800047f8:	afc50513          	addi	a0,a0,-1284 # 800092f0 <_ZZ9kPrintIntmE6digits+0x280>
    800047fc:	00001097          	auipc	ra,0x1
    80004800:	4b0080e7          	jalr	1200(ra) # 80005cac <_Z11printStringPKc>
        return;
    80004804:	000c0113          	mv	sp,s8
    80004808:	2140006f          	j	80004a1c <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    8000480c:	01000513          	li	a0,16
    80004810:	ffffe097          	auipc	ra,0xffffe
    80004814:	c58080e7          	jalr	-936(ra) # 80002468 <_Znwm>
    80004818:	00050913          	mv	s2,a0
    8000481c:	00000593          	li	a1,0
    80004820:	ffffe097          	auipc	ra,0xffffe
    80004824:	f8c080e7          	jalr	-116(ra) # 800027ac <_ZN9SemaphoreC1Ej>
    80004828:	00007797          	auipc	a5,0x7
    8000482c:	4127b423          	sd	s2,1032(a5) # 8000bc30 <_ZL10waitForAll>
    Thread *producers[threadNum];
    80004830:	00399793          	slli	a5,s3,0x3
    80004834:	00f78793          	addi	a5,a5,15
    80004838:	ff07f793          	andi	a5,a5,-16
    8000483c:	40f10133          	sub	sp,sp,a5
    80004840:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80004844:	0019871b          	addiw	a4,s3,1
    80004848:	00171793          	slli	a5,a4,0x1
    8000484c:	00e787b3          	add	a5,a5,a4
    80004850:	00379793          	slli	a5,a5,0x3
    80004854:	00f78793          	addi	a5,a5,15
    80004858:	ff07f793          	andi	a5,a5,-16
    8000485c:	40f10133          	sub	sp,sp,a5
    80004860:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80004864:	00199493          	slli	s1,s3,0x1
    80004868:	013484b3          	add	s1,s1,s3
    8000486c:	00349493          	slli	s1,s1,0x3
    80004870:	009b04b3          	add	s1,s6,s1
    80004874:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80004878:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    8000487c:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004880:	02800513          	li	a0,40
    80004884:	ffffe097          	auipc	ra,0xffffe
    80004888:	be4080e7          	jalr	-1052(ra) # 80002468 <_Znwm>
    8000488c:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80004890:	ffffe097          	auipc	ra,0xffffe
    80004894:	ea0080e7          	jalr	-352(ra) # 80002730 <_ZN6ThreadC1Ev>
    80004898:	00007797          	auipc	a5,0x7
    8000489c:	10878793          	addi	a5,a5,264 # 8000b9a0 <_ZTV8Consumer+0x10>
    800048a0:	00fbb023          	sd	a5,0(s7)
    800048a4:	029bb023          	sd	s1,32(s7)
    consumer->start();
    800048a8:	000b8513          	mv	a0,s7
    800048ac:	ffffe097          	auipc	ra,0xffffe
    800048b0:	d6c080e7          	jalr	-660(ra) # 80002618 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    800048b4:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    800048b8:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    800048bc:	00007797          	auipc	a5,0x7
    800048c0:	3747b783          	ld	a5,884(a5) # 8000bc30 <_ZL10waitForAll>
    800048c4:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800048c8:	02800513          	li	a0,40
    800048cc:	ffffe097          	auipc	ra,0xffffe
    800048d0:	b9c080e7          	jalr	-1124(ra) # 80002468 <_Znwm>
    800048d4:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    800048d8:	ffffe097          	auipc	ra,0xffffe
    800048dc:	e58080e7          	jalr	-424(ra) # 80002730 <_ZN6ThreadC1Ev>
    800048e0:	00007797          	auipc	a5,0x7
    800048e4:	07078793          	addi	a5,a5,112 # 8000b950 <_ZTV16ProducerKeyborad+0x10>
    800048e8:	00f4b023          	sd	a5,0(s1)
    800048ec:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800048f0:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    800048f4:	00048513          	mv	a0,s1
    800048f8:	ffffe097          	auipc	ra,0xffffe
    800048fc:	d20080e7          	jalr	-736(ra) # 80002618 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004900:	00100913          	li	s2,1
    80004904:	0300006f          	j	80004934 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004908:	00007797          	auipc	a5,0x7
    8000490c:	07078793          	addi	a5,a5,112 # 8000b978 <_ZTV8Producer+0x10>
    80004910:	00fcb023          	sd	a5,0(s9)
    80004914:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    80004918:	00391793          	slli	a5,s2,0x3
    8000491c:	00fa07b3          	add	a5,s4,a5
    80004920:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80004924:	000c8513          	mv	a0,s9
    80004928:	ffffe097          	auipc	ra,0xffffe
    8000492c:	cf0080e7          	jalr	-784(ra) # 80002618 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004930:	0019091b          	addiw	s2,s2,1
    80004934:	05395263          	bge	s2,s3,80004978 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80004938:	00191493          	slli	s1,s2,0x1
    8000493c:	012484b3          	add	s1,s1,s2
    80004940:	00349493          	slli	s1,s1,0x3
    80004944:	009b04b3          	add	s1,s6,s1
    80004948:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    8000494c:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80004950:	00007797          	auipc	a5,0x7
    80004954:	2e07b783          	ld	a5,736(a5) # 8000bc30 <_ZL10waitForAll>
    80004958:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    8000495c:	02800513          	li	a0,40
    80004960:	ffffe097          	auipc	ra,0xffffe
    80004964:	b08080e7          	jalr	-1272(ra) # 80002468 <_Znwm>
    80004968:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    8000496c:	ffffe097          	auipc	ra,0xffffe
    80004970:	dc4080e7          	jalr	-572(ra) # 80002730 <_ZN6ThreadC1Ev>
    80004974:	f95ff06f          	j	80004908 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    80004978:	ffffe097          	auipc	ra,0xffffe
    8000497c:	d04080e7          	jalr	-764(ra) # 8000267c <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80004980:	00000493          	li	s1,0
    80004984:	0099ce63          	blt	s3,s1,800049a0 <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    80004988:	00007517          	auipc	a0,0x7
    8000498c:	2a853503          	ld	a0,680(a0) # 8000bc30 <_ZL10waitForAll>
    80004990:	ffffe097          	auipc	ra,0xffffe
    80004994:	e54080e7          	jalr	-428(ra) # 800027e4 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80004998:	0014849b          	addiw	s1,s1,1
    8000499c:	fe9ff06f          	j	80004984 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    800049a0:	00007517          	auipc	a0,0x7
    800049a4:	29053503          	ld	a0,656(a0) # 8000bc30 <_ZL10waitForAll>
    800049a8:	00050863          	beqz	a0,800049b8 <_Z20testConsumerProducerv+0x2f4>
    800049ac:	00053783          	ld	a5,0(a0)
    800049b0:	0087b783          	ld	a5,8(a5)
    800049b4:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    800049b8:	00000493          	li	s1,0
    800049bc:	0080006f          	j	800049c4 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    800049c0:	0014849b          	addiw	s1,s1,1
    800049c4:	0334d263          	bge	s1,s3,800049e8 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    800049c8:	00349793          	slli	a5,s1,0x3
    800049cc:	00fa07b3          	add	a5,s4,a5
    800049d0:	0007b503          	ld	a0,0(a5)
    800049d4:	fe0506e3          	beqz	a0,800049c0 <_Z20testConsumerProducerv+0x2fc>
    800049d8:	00053783          	ld	a5,0(a0)
    800049dc:	0087b783          	ld	a5,8(a5)
    800049e0:	000780e7          	jalr	a5
    800049e4:	fddff06f          	j	800049c0 <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    800049e8:	000b8a63          	beqz	s7,800049fc <_Z20testConsumerProducerv+0x338>
    800049ec:	000bb783          	ld	a5,0(s7)
    800049f0:	0087b783          	ld	a5,8(a5)
    800049f4:	000b8513          	mv	a0,s7
    800049f8:	000780e7          	jalr	a5
    delete buffer;
    800049fc:	000a8e63          	beqz	s5,80004a18 <_Z20testConsumerProducerv+0x354>
    80004a00:	000a8513          	mv	a0,s5
    80004a04:	00002097          	auipc	ra,0x2
    80004a08:	870080e7          	jalr	-1936(ra) # 80006274 <_ZN9BufferCPPD1Ev>
    80004a0c:	000a8513          	mv	a0,s5
    80004a10:	ffffe097          	auipc	ra,0xffffe
    80004a14:	aa8080e7          	jalr	-1368(ra) # 800024b8 <_ZdlPv>
    80004a18:	000c0113          	mv	sp,s8
}
    80004a1c:	f8040113          	addi	sp,s0,-128
    80004a20:	07813083          	ld	ra,120(sp)
    80004a24:	07013403          	ld	s0,112(sp)
    80004a28:	06813483          	ld	s1,104(sp)
    80004a2c:	06013903          	ld	s2,96(sp)
    80004a30:	05813983          	ld	s3,88(sp)
    80004a34:	05013a03          	ld	s4,80(sp)
    80004a38:	04813a83          	ld	s5,72(sp)
    80004a3c:	04013b03          	ld	s6,64(sp)
    80004a40:	03813b83          	ld	s7,56(sp)
    80004a44:	03013c03          	ld	s8,48(sp)
    80004a48:	02813c83          	ld	s9,40(sp)
    80004a4c:	08010113          	addi	sp,sp,128
    80004a50:	00008067          	ret
    80004a54:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80004a58:	000a8513          	mv	a0,s5
    80004a5c:	ffffe097          	auipc	ra,0xffffe
    80004a60:	a5c080e7          	jalr	-1444(ra) # 800024b8 <_ZdlPv>
    80004a64:	00048513          	mv	a0,s1
    80004a68:	00008097          	auipc	ra,0x8
    80004a6c:	2c0080e7          	jalr	704(ra) # 8000cd28 <_Unwind_Resume>
    80004a70:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80004a74:	00090513          	mv	a0,s2
    80004a78:	ffffe097          	auipc	ra,0xffffe
    80004a7c:	a40080e7          	jalr	-1472(ra) # 800024b8 <_ZdlPv>
    80004a80:	00048513          	mv	a0,s1
    80004a84:	00008097          	auipc	ra,0x8
    80004a88:	2a4080e7          	jalr	676(ra) # 8000cd28 <_Unwind_Resume>
    80004a8c:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004a90:	000b8513          	mv	a0,s7
    80004a94:	ffffe097          	auipc	ra,0xffffe
    80004a98:	a24080e7          	jalr	-1500(ra) # 800024b8 <_ZdlPv>
    80004a9c:	00048513          	mv	a0,s1
    80004aa0:	00008097          	auipc	ra,0x8
    80004aa4:	288080e7          	jalr	648(ra) # 8000cd28 <_Unwind_Resume>
    80004aa8:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004aac:	00048513          	mv	a0,s1
    80004ab0:	ffffe097          	auipc	ra,0xffffe
    80004ab4:	a08080e7          	jalr	-1528(ra) # 800024b8 <_ZdlPv>
    80004ab8:	00090513          	mv	a0,s2
    80004abc:	00008097          	auipc	ra,0x8
    80004ac0:	26c080e7          	jalr	620(ra) # 8000cd28 <_Unwind_Resume>
    80004ac4:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    80004ac8:	000c8513          	mv	a0,s9
    80004acc:	ffffe097          	auipc	ra,0xffffe
    80004ad0:	9ec080e7          	jalr	-1556(ra) # 800024b8 <_ZdlPv>
    80004ad4:	00048513          	mv	a0,s1
    80004ad8:	00008097          	auipc	ra,0x8
    80004adc:	250080e7          	jalr	592(ra) # 8000cd28 <_Unwind_Resume>

0000000080004ae0 <_ZN8Consumer3runEv>:
    void run() override {
    80004ae0:	fd010113          	addi	sp,sp,-48
    80004ae4:	02113423          	sd	ra,40(sp)
    80004ae8:	02813023          	sd	s0,32(sp)
    80004aec:	00913c23          	sd	s1,24(sp)
    80004af0:	01213823          	sd	s2,16(sp)
    80004af4:	01313423          	sd	s3,8(sp)
    80004af8:	03010413          	addi	s0,sp,48
    80004afc:	00050913          	mv	s2,a0
        int i = 0;
    80004b00:	00000993          	li	s3,0
    80004b04:	0100006f          	j	80004b14 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    80004b08:	00a00513          	li	a0,10
    80004b0c:	ffffe097          	auipc	ra,0xffffe
    80004b10:	dcc080e7          	jalr	-564(ra) # 800028d8 <_ZN7Console4putcEc>
        while (!threadEnd) {
    80004b14:	00007797          	auipc	a5,0x7
    80004b18:	1147a783          	lw	a5,276(a5) # 8000bc28 <_ZL9threadEnd>
    80004b1c:	04079a63          	bnez	a5,80004b70 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80004b20:	02093783          	ld	a5,32(s2)
    80004b24:	0087b503          	ld	a0,8(a5)
    80004b28:	00001097          	auipc	ra,0x1
    80004b2c:	638080e7          	jalr	1592(ra) # 80006160 <_ZN9BufferCPP3getEv>
            i++;
    80004b30:	0019849b          	addiw	s1,s3,1
    80004b34:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80004b38:	0ff57513          	andi	a0,a0,255
    80004b3c:	ffffe097          	auipc	ra,0xffffe
    80004b40:	d9c080e7          	jalr	-612(ra) # 800028d8 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80004b44:	05000793          	li	a5,80
    80004b48:	02f4e4bb          	remw	s1,s1,a5
    80004b4c:	fc0494e3          	bnez	s1,80004b14 <_ZN8Consumer3runEv+0x34>
    80004b50:	fb9ff06f          	j	80004b08 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80004b54:	02093783          	ld	a5,32(s2)
    80004b58:	0087b503          	ld	a0,8(a5)
    80004b5c:	00001097          	auipc	ra,0x1
    80004b60:	604080e7          	jalr	1540(ra) # 80006160 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80004b64:	0ff57513          	andi	a0,a0,255
    80004b68:	ffffe097          	auipc	ra,0xffffe
    80004b6c:	d70080e7          	jalr	-656(ra) # 800028d8 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80004b70:	02093783          	ld	a5,32(s2)
    80004b74:	0087b503          	ld	a0,8(a5)
    80004b78:	00001097          	auipc	ra,0x1
    80004b7c:	674080e7          	jalr	1652(ra) # 800061ec <_ZN9BufferCPP6getCntEv>
    80004b80:	fca04ae3          	bgtz	a0,80004b54 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80004b84:	02093783          	ld	a5,32(s2)
    80004b88:	0107b503          	ld	a0,16(a5)
    80004b8c:	ffffe097          	auipc	ra,0xffffe
    80004b90:	c84080e7          	jalr	-892(ra) # 80002810 <_ZN9Semaphore6signalEv>
    }
    80004b94:	02813083          	ld	ra,40(sp)
    80004b98:	02013403          	ld	s0,32(sp)
    80004b9c:	01813483          	ld	s1,24(sp)
    80004ba0:	01013903          	ld	s2,16(sp)
    80004ba4:	00813983          	ld	s3,8(sp)
    80004ba8:	03010113          	addi	sp,sp,48
    80004bac:	00008067          	ret

0000000080004bb0 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80004bb0:	ff010113          	addi	sp,sp,-16
    80004bb4:	00113423          	sd	ra,8(sp)
    80004bb8:	00813023          	sd	s0,0(sp)
    80004bbc:	01010413          	addi	s0,sp,16
    80004bc0:	00007797          	auipc	a5,0x7
    80004bc4:	de078793          	addi	a5,a5,-544 # 8000b9a0 <_ZTV8Consumer+0x10>
    80004bc8:	00f53023          	sd	a5,0(a0)
    80004bcc:	ffffd097          	auipc	ra,0xffffd
    80004bd0:	7ac080e7          	jalr	1964(ra) # 80002378 <_ZN6ThreadD1Ev>
    80004bd4:	00813083          	ld	ra,8(sp)
    80004bd8:	00013403          	ld	s0,0(sp)
    80004bdc:	01010113          	addi	sp,sp,16
    80004be0:	00008067          	ret

0000000080004be4 <_ZN8ConsumerD0Ev>:
    80004be4:	fe010113          	addi	sp,sp,-32
    80004be8:	00113c23          	sd	ra,24(sp)
    80004bec:	00813823          	sd	s0,16(sp)
    80004bf0:	00913423          	sd	s1,8(sp)
    80004bf4:	02010413          	addi	s0,sp,32
    80004bf8:	00050493          	mv	s1,a0
    80004bfc:	00007797          	auipc	a5,0x7
    80004c00:	da478793          	addi	a5,a5,-604 # 8000b9a0 <_ZTV8Consumer+0x10>
    80004c04:	00f53023          	sd	a5,0(a0)
    80004c08:	ffffd097          	auipc	ra,0xffffd
    80004c0c:	770080e7          	jalr	1904(ra) # 80002378 <_ZN6ThreadD1Ev>
    80004c10:	00048513          	mv	a0,s1
    80004c14:	ffffe097          	auipc	ra,0xffffe
    80004c18:	8a4080e7          	jalr	-1884(ra) # 800024b8 <_ZdlPv>
    80004c1c:	01813083          	ld	ra,24(sp)
    80004c20:	01013403          	ld	s0,16(sp)
    80004c24:	00813483          	ld	s1,8(sp)
    80004c28:	02010113          	addi	sp,sp,32
    80004c2c:	00008067          	ret

0000000080004c30 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80004c30:	ff010113          	addi	sp,sp,-16
    80004c34:	00113423          	sd	ra,8(sp)
    80004c38:	00813023          	sd	s0,0(sp)
    80004c3c:	01010413          	addi	s0,sp,16
    80004c40:	00007797          	auipc	a5,0x7
    80004c44:	d1078793          	addi	a5,a5,-752 # 8000b950 <_ZTV16ProducerKeyborad+0x10>
    80004c48:	00f53023          	sd	a5,0(a0)
    80004c4c:	ffffd097          	auipc	ra,0xffffd
    80004c50:	72c080e7          	jalr	1836(ra) # 80002378 <_ZN6ThreadD1Ev>
    80004c54:	00813083          	ld	ra,8(sp)
    80004c58:	00013403          	ld	s0,0(sp)
    80004c5c:	01010113          	addi	sp,sp,16
    80004c60:	00008067          	ret

0000000080004c64 <_ZN16ProducerKeyboradD0Ev>:
    80004c64:	fe010113          	addi	sp,sp,-32
    80004c68:	00113c23          	sd	ra,24(sp)
    80004c6c:	00813823          	sd	s0,16(sp)
    80004c70:	00913423          	sd	s1,8(sp)
    80004c74:	02010413          	addi	s0,sp,32
    80004c78:	00050493          	mv	s1,a0
    80004c7c:	00007797          	auipc	a5,0x7
    80004c80:	cd478793          	addi	a5,a5,-812 # 8000b950 <_ZTV16ProducerKeyborad+0x10>
    80004c84:	00f53023          	sd	a5,0(a0)
    80004c88:	ffffd097          	auipc	ra,0xffffd
    80004c8c:	6f0080e7          	jalr	1776(ra) # 80002378 <_ZN6ThreadD1Ev>
    80004c90:	00048513          	mv	a0,s1
    80004c94:	ffffe097          	auipc	ra,0xffffe
    80004c98:	824080e7          	jalr	-2012(ra) # 800024b8 <_ZdlPv>
    80004c9c:	01813083          	ld	ra,24(sp)
    80004ca0:	01013403          	ld	s0,16(sp)
    80004ca4:	00813483          	ld	s1,8(sp)
    80004ca8:	02010113          	addi	sp,sp,32
    80004cac:	00008067          	ret

0000000080004cb0 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80004cb0:	ff010113          	addi	sp,sp,-16
    80004cb4:	00113423          	sd	ra,8(sp)
    80004cb8:	00813023          	sd	s0,0(sp)
    80004cbc:	01010413          	addi	s0,sp,16
    80004cc0:	00007797          	auipc	a5,0x7
    80004cc4:	cb878793          	addi	a5,a5,-840 # 8000b978 <_ZTV8Producer+0x10>
    80004cc8:	00f53023          	sd	a5,0(a0)
    80004ccc:	ffffd097          	auipc	ra,0xffffd
    80004cd0:	6ac080e7          	jalr	1708(ra) # 80002378 <_ZN6ThreadD1Ev>
    80004cd4:	00813083          	ld	ra,8(sp)
    80004cd8:	00013403          	ld	s0,0(sp)
    80004cdc:	01010113          	addi	sp,sp,16
    80004ce0:	00008067          	ret

0000000080004ce4 <_ZN8ProducerD0Ev>:
    80004ce4:	fe010113          	addi	sp,sp,-32
    80004ce8:	00113c23          	sd	ra,24(sp)
    80004cec:	00813823          	sd	s0,16(sp)
    80004cf0:	00913423          	sd	s1,8(sp)
    80004cf4:	02010413          	addi	s0,sp,32
    80004cf8:	00050493          	mv	s1,a0
    80004cfc:	00007797          	auipc	a5,0x7
    80004d00:	c7c78793          	addi	a5,a5,-900 # 8000b978 <_ZTV8Producer+0x10>
    80004d04:	00f53023          	sd	a5,0(a0)
    80004d08:	ffffd097          	auipc	ra,0xffffd
    80004d0c:	670080e7          	jalr	1648(ra) # 80002378 <_ZN6ThreadD1Ev>
    80004d10:	00048513          	mv	a0,s1
    80004d14:	ffffd097          	auipc	ra,0xffffd
    80004d18:	7a4080e7          	jalr	1956(ra) # 800024b8 <_ZdlPv>
    80004d1c:	01813083          	ld	ra,24(sp)
    80004d20:	01013403          	ld	s0,16(sp)
    80004d24:	00813483          	ld	s1,8(sp)
    80004d28:	02010113          	addi	sp,sp,32
    80004d2c:	00008067          	ret

0000000080004d30 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80004d30:	fe010113          	addi	sp,sp,-32
    80004d34:	00113c23          	sd	ra,24(sp)
    80004d38:	00813823          	sd	s0,16(sp)
    80004d3c:	00913423          	sd	s1,8(sp)
    80004d40:	02010413          	addi	s0,sp,32
    80004d44:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80004d48:	ffffd097          	auipc	ra,0xffffd
    80004d4c:	820080e7          	jalr	-2016(ra) # 80001568 <_Z4getcv>
    80004d50:	0005059b          	sext.w	a1,a0
    80004d54:	01b00793          	li	a5,27
    80004d58:	00f58c63          	beq	a1,a5,80004d70 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80004d5c:	0204b783          	ld	a5,32(s1)
    80004d60:	0087b503          	ld	a0,8(a5)
    80004d64:	00001097          	auipc	ra,0x1
    80004d68:	36c080e7          	jalr	876(ra) # 800060d0 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80004d6c:	fddff06f          	j	80004d48 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80004d70:	00100793          	li	a5,1
    80004d74:	00007717          	auipc	a4,0x7
    80004d78:	eaf72a23          	sw	a5,-332(a4) # 8000bc28 <_ZL9threadEnd>
        td->buffer->put('!');
    80004d7c:	0204b783          	ld	a5,32(s1)
    80004d80:	02100593          	li	a1,33
    80004d84:	0087b503          	ld	a0,8(a5)
    80004d88:	00001097          	auipc	ra,0x1
    80004d8c:	348080e7          	jalr	840(ra) # 800060d0 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80004d90:	0204b783          	ld	a5,32(s1)
    80004d94:	0107b503          	ld	a0,16(a5)
    80004d98:	ffffe097          	auipc	ra,0xffffe
    80004d9c:	a78080e7          	jalr	-1416(ra) # 80002810 <_ZN9Semaphore6signalEv>
    }
    80004da0:	01813083          	ld	ra,24(sp)
    80004da4:	01013403          	ld	s0,16(sp)
    80004da8:	00813483          	ld	s1,8(sp)
    80004dac:	02010113          	addi	sp,sp,32
    80004db0:	00008067          	ret

0000000080004db4 <_ZN8Producer3runEv>:
    void run() override {
    80004db4:	fe010113          	addi	sp,sp,-32
    80004db8:	00113c23          	sd	ra,24(sp)
    80004dbc:	00813823          	sd	s0,16(sp)
    80004dc0:	00913423          	sd	s1,8(sp)
    80004dc4:	01213023          	sd	s2,0(sp)
    80004dc8:	02010413          	addi	s0,sp,32
    80004dcc:	00050493          	mv	s1,a0
        int i = 0;
    80004dd0:	00000913          	li	s2,0
        while (!threadEnd) {
    80004dd4:	00007797          	auipc	a5,0x7
    80004dd8:	e547a783          	lw	a5,-428(a5) # 8000bc28 <_ZL9threadEnd>
    80004ddc:	04079263          	bnez	a5,80004e20 <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    80004de0:	0204b783          	ld	a5,32(s1)
    80004de4:	0007a583          	lw	a1,0(a5)
    80004de8:	0305859b          	addiw	a1,a1,48
    80004dec:	0087b503          	ld	a0,8(a5)
    80004df0:	00001097          	auipc	ra,0x1
    80004df4:	2e0080e7          	jalr	736(ra) # 800060d0 <_ZN9BufferCPP3putEi>
            i++;
    80004df8:	0019071b          	addiw	a4,s2,1
    80004dfc:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    80004e00:	0204b783          	ld	a5,32(s1)
    80004e04:	0007a783          	lw	a5,0(a5)
    80004e08:	00e787bb          	addw	a5,a5,a4
    80004e0c:	00500513          	li	a0,5
    80004e10:	02a7e53b          	remw	a0,a5,a0
    80004e14:	ffffe097          	auipc	ra,0xffffe
    80004e18:	890080e7          	jalr	-1904(ra) # 800026a4 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80004e1c:	fb9ff06f          	j	80004dd4 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80004e20:	0204b783          	ld	a5,32(s1)
    80004e24:	0107b503          	ld	a0,16(a5)
    80004e28:	ffffe097          	auipc	ra,0xffffe
    80004e2c:	9e8080e7          	jalr	-1560(ra) # 80002810 <_ZN9Semaphore6signalEv>
    }
    80004e30:	01813083          	ld	ra,24(sp)
    80004e34:	01013403          	ld	s0,16(sp)
    80004e38:	00813483          	ld	s1,8(sp)
    80004e3c:	00013903          	ld	s2,0(sp)
    80004e40:	02010113          	addi	sp,sp,32
    80004e44:	00008067          	ret

0000000080004e48 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004e48:	fe010113          	addi	sp,sp,-32
    80004e4c:	00113c23          	sd	ra,24(sp)
    80004e50:	00813823          	sd	s0,16(sp)
    80004e54:	00913423          	sd	s1,8(sp)
    80004e58:	01213023          	sd	s2,0(sp)
    80004e5c:	02010413          	addi	s0,sp,32
    80004e60:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004e64:	00100793          	li	a5,1
    80004e68:	02a7f863          	bgeu	a5,a0,80004e98 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004e6c:	00a00793          	li	a5,10
    80004e70:	02f577b3          	remu	a5,a0,a5
    80004e74:	02078e63          	beqz	a5,80004eb0 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004e78:	fff48513          	addi	a0,s1,-1
    80004e7c:	00000097          	auipc	ra,0x0
    80004e80:	fcc080e7          	jalr	-52(ra) # 80004e48 <_ZL9fibonaccim>
    80004e84:	00050913          	mv	s2,a0
    80004e88:	ffe48513          	addi	a0,s1,-2
    80004e8c:	00000097          	auipc	ra,0x0
    80004e90:	fbc080e7          	jalr	-68(ra) # 80004e48 <_ZL9fibonaccim>
    80004e94:	00a90533          	add	a0,s2,a0
}
    80004e98:	01813083          	ld	ra,24(sp)
    80004e9c:	01013403          	ld	s0,16(sp)
    80004ea0:	00813483          	ld	s1,8(sp)
    80004ea4:	00013903          	ld	s2,0(sp)
    80004ea8:	02010113          	addi	sp,sp,32
    80004eac:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80004eb0:	ffffc097          	auipc	ra,0xffffc
    80004eb4:	578080e7          	jalr	1400(ra) # 80001428 <_Z15thread_dispatchv>
    80004eb8:	fc1ff06f          	j	80004e78 <_ZL9fibonaccim+0x30>

0000000080004ebc <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80004ebc:	fe010113          	addi	sp,sp,-32
    80004ec0:	00113c23          	sd	ra,24(sp)
    80004ec4:	00813823          	sd	s0,16(sp)
    80004ec8:	00913423          	sd	s1,8(sp)
    80004ecc:	01213023          	sd	s2,0(sp)
    80004ed0:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004ed4:	00a00493          	li	s1,10
    80004ed8:	0400006f          	j	80004f18 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004edc:	00004517          	auipc	a0,0x4
    80004ee0:	4b450513          	addi	a0,a0,1204 # 80009390 <_ZZ9kPrintIntmE6digits+0x320>
    80004ee4:	00001097          	auipc	ra,0x1
    80004ee8:	dc8080e7          	jalr	-568(ra) # 80005cac <_Z11printStringPKc>
    80004eec:	00000613          	li	a2,0
    80004ef0:	00a00593          	li	a1,10
    80004ef4:	00048513          	mv	a0,s1
    80004ef8:	00001097          	auipc	ra,0x1
    80004efc:	f64080e7          	jalr	-156(ra) # 80005e5c <_Z8printIntiii>
    80004f00:	00004517          	auipc	a0,0x4
    80004f04:	68050513          	addi	a0,a0,1664 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80004f08:	00001097          	auipc	ra,0x1
    80004f0c:	da4080e7          	jalr	-604(ra) # 80005cac <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004f10:	0014849b          	addiw	s1,s1,1
    80004f14:	0ff4f493          	andi	s1,s1,255
    80004f18:	00c00793          	li	a5,12
    80004f1c:	fc97f0e3          	bgeu	a5,s1,80004edc <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80004f20:	00004517          	auipc	a0,0x4
    80004f24:	47850513          	addi	a0,a0,1144 # 80009398 <_ZZ9kPrintIntmE6digits+0x328>
    80004f28:	00001097          	auipc	ra,0x1
    80004f2c:	d84080e7          	jalr	-636(ra) # 80005cac <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004f30:	00500313          	li	t1,5
    thread_dispatch();
    80004f34:	ffffc097          	auipc	ra,0xffffc
    80004f38:	4f4080e7          	jalr	1268(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004f3c:	01000513          	li	a0,16
    80004f40:	00000097          	auipc	ra,0x0
    80004f44:	f08080e7          	jalr	-248(ra) # 80004e48 <_ZL9fibonaccim>
    80004f48:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004f4c:	00004517          	auipc	a0,0x4
    80004f50:	45c50513          	addi	a0,a0,1116 # 800093a8 <_ZZ9kPrintIntmE6digits+0x338>
    80004f54:	00001097          	auipc	ra,0x1
    80004f58:	d58080e7          	jalr	-680(ra) # 80005cac <_Z11printStringPKc>
    80004f5c:	00000613          	li	a2,0
    80004f60:	00a00593          	li	a1,10
    80004f64:	0009051b          	sext.w	a0,s2
    80004f68:	00001097          	auipc	ra,0x1
    80004f6c:	ef4080e7          	jalr	-268(ra) # 80005e5c <_Z8printIntiii>
    80004f70:	00004517          	auipc	a0,0x4
    80004f74:	61050513          	addi	a0,a0,1552 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80004f78:	00001097          	auipc	ra,0x1
    80004f7c:	d34080e7          	jalr	-716(ra) # 80005cac <_Z11printStringPKc>
    80004f80:	0400006f          	j	80004fc0 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004f84:	00004517          	auipc	a0,0x4
    80004f88:	40c50513          	addi	a0,a0,1036 # 80009390 <_ZZ9kPrintIntmE6digits+0x320>
    80004f8c:	00001097          	auipc	ra,0x1
    80004f90:	d20080e7          	jalr	-736(ra) # 80005cac <_Z11printStringPKc>
    80004f94:	00000613          	li	a2,0
    80004f98:	00a00593          	li	a1,10
    80004f9c:	00048513          	mv	a0,s1
    80004fa0:	00001097          	auipc	ra,0x1
    80004fa4:	ebc080e7          	jalr	-324(ra) # 80005e5c <_Z8printIntiii>
    80004fa8:	00004517          	auipc	a0,0x4
    80004fac:	5d850513          	addi	a0,a0,1496 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80004fb0:	00001097          	auipc	ra,0x1
    80004fb4:	cfc080e7          	jalr	-772(ra) # 80005cac <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004fb8:	0014849b          	addiw	s1,s1,1
    80004fbc:	0ff4f493          	andi	s1,s1,255
    80004fc0:	00f00793          	li	a5,15
    80004fc4:	fc97f0e3          	bgeu	a5,s1,80004f84 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80004fc8:	00004517          	auipc	a0,0x4
    80004fcc:	3f050513          	addi	a0,a0,1008 # 800093b8 <_ZZ9kPrintIntmE6digits+0x348>
    80004fd0:	00001097          	auipc	ra,0x1
    80004fd4:	cdc080e7          	jalr	-804(ra) # 80005cac <_Z11printStringPKc>
    finishedD = true;
    80004fd8:	00100793          	li	a5,1
    80004fdc:	00007717          	auipc	a4,0x7
    80004fe0:	c4f70e23          	sb	a5,-932(a4) # 8000bc38 <_ZL9finishedD>
    thread_dispatch();
    80004fe4:	ffffc097          	auipc	ra,0xffffc
    80004fe8:	444080e7          	jalr	1092(ra) # 80001428 <_Z15thread_dispatchv>
}
    80004fec:	01813083          	ld	ra,24(sp)
    80004ff0:	01013403          	ld	s0,16(sp)
    80004ff4:	00813483          	ld	s1,8(sp)
    80004ff8:	00013903          	ld	s2,0(sp)
    80004ffc:	02010113          	addi	sp,sp,32
    80005000:	00008067          	ret

0000000080005004 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80005004:	fe010113          	addi	sp,sp,-32
    80005008:	00113c23          	sd	ra,24(sp)
    8000500c:	00813823          	sd	s0,16(sp)
    80005010:	00913423          	sd	s1,8(sp)
    80005014:	01213023          	sd	s2,0(sp)
    80005018:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    8000501c:	00000493          	li	s1,0
    80005020:	0400006f          	j	80005060 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80005024:	00004517          	auipc	a0,0x4
    80005028:	32c50513          	addi	a0,a0,812 # 80009350 <_ZZ9kPrintIntmE6digits+0x2e0>
    8000502c:	00001097          	auipc	ra,0x1
    80005030:	c80080e7          	jalr	-896(ra) # 80005cac <_Z11printStringPKc>
    80005034:	00000613          	li	a2,0
    80005038:	00a00593          	li	a1,10
    8000503c:	00048513          	mv	a0,s1
    80005040:	00001097          	auipc	ra,0x1
    80005044:	e1c080e7          	jalr	-484(ra) # 80005e5c <_Z8printIntiii>
    80005048:	00004517          	auipc	a0,0x4
    8000504c:	53850513          	addi	a0,a0,1336 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80005050:	00001097          	auipc	ra,0x1
    80005054:	c5c080e7          	jalr	-932(ra) # 80005cac <_Z11printStringPKc>
    for (; i < 3; i++) {
    80005058:	0014849b          	addiw	s1,s1,1
    8000505c:	0ff4f493          	andi	s1,s1,255
    80005060:	00200793          	li	a5,2
    80005064:	fc97f0e3          	bgeu	a5,s1,80005024 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80005068:	00004517          	auipc	a0,0x4
    8000506c:	2f050513          	addi	a0,a0,752 # 80009358 <_ZZ9kPrintIntmE6digits+0x2e8>
    80005070:	00001097          	auipc	ra,0x1
    80005074:	c3c080e7          	jalr	-964(ra) # 80005cac <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80005078:	00700313          	li	t1,7
    thread_dispatch();
    8000507c:	ffffc097          	auipc	ra,0xffffc
    80005080:	3ac080e7          	jalr	940(ra) # 80001428 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80005084:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80005088:	00004517          	auipc	a0,0x4
    8000508c:	2e050513          	addi	a0,a0,736 # 80009368 <_ZZ9kPrintIntmE6digits+0x2f8>
    80005090:	00001097          	auipc	ra,0x1
    80005094:	c1c080e7          	jalr	-996(ra) # 80005cac <_Z11printStringPKc>
    80005098:	00000613          	li	a2,0
    8000509c:	00a00593          	li	a1,10
    800050a0:	0009051b          	sext.w	a0,s2
    800050a4:	00001097          	auipc	ra,0x1
    800050a8:	db8080e7          	jalr	-584(ra) # 80005e5c <_Z8printIntiii>
    800050ac:	00004517          	auipc	a0,0x4
    800050b0:	4d450513          	addi	a0,a0,1236 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    800050b4:	00001097          	auipc	ra,0x1
    800050b8:	bf8080e7          	jalr	-1032(ra) # 80005cac <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    800050bc:	00c00513          	li	a0,12
    800050c0:	00000097          	auipc	ra,0x0
    800050c4:	d88080e7          	jalr	-632(ra) # 80004e48 <_ZL9fibonaccim>
    800050c8:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800050cc:	00004517          	auipc	a0,0x4
    800050d0:	2a450513          	addi	a0,a0,676 # 80009370 <_ZZ9kPrintIntmE6digits+0x300>
    800050d4:	00001097          	auipc	ra,0x1
    800050d8:	bd8080e7          	jalr	-1064(ra) # 80005cac <_Z11printStringPKc>
    800050dc:	00000613          	li	a2,0
    800050e0:	00a00593          	li	a1,10
    800050e4:	0009051b          	sext.w	a0,s2
    800050e8:	00001097          	auipc	ra,0x1
    800050ec:	d74080e7          	jalr	-652(ra) # 80005e5c <_Z8printIntiii>
    800050f0:	00004517          	auipc	a0,0x4
    800050f4:	49050513          	addi	a0,a0,1168 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    800050f8:	00001097          	auipc	ra,0x1
    800050fc:	bb4080e7          	jalr	-1100(ra) # 80005cac <_Z11printStringPKc>
    80005100:	0400006f          	j	80005140 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80005104:	00004517          	auipc	a0,0x4
    80005108:	24c50513          	addi	a0,a0,588 # 80009350 <_ZZ9kPrintIntmE6digits+0x2e0>
    8000510c:	00001097          	auipc	ra,0x1
    80005110:	ba0080e7          	jalr	-1120(ra) # 80005cac <_Z11printStringPKc>
    80005114:	00000613          	li	a2,0
    80005118:	00a00593          	li	a1,10
    8000511c:	00048513          	mv	a0,s1
    80005120:	00001097          	auipc	ra,0x1
    80005124:	d3c080e7          	jalr	-708(ra) # 80005e5c <_Z8printIntiii>
    80005128:	00004517          	auipc	a0,0x4
    8000512c:	45850513          	addi	a0,a0,1112 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80005130:	00001097          	auipc	ra,0x1
    80005134:	b7c080e7          	jalr	-1156(ra) # 80005cac <_Z11printStringPKc>
    for (; i < 6; i++) {
    80005138:	0014849b          	addiw	s1,s1,1
    8000513c:	0ff4f493          	andi	s1,s1,255
    80005140:	00500793          	li	a5,5
    80005144:	fc97f0e3          	bgeu	a5,s1,80005104 <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    80005148:	00004517          	auipc	a0,0x4
    8000514c:	23850513          	addi	a0,a0,568 # 80009380 <_ZZ9kPrintIntmE6digits+0x310>
    80005150:	00001097          	auipc	ra,0x1
    80005154:	b5c080e7          	jalr	-1188(ra) # 80005cac <_Z11printStringPKc>
    finishedC = true;
    80005158:	00100793          	li	a5,1
    8000515c:	00007717          	auipc	a4,0x7
    80005160:	acf70ea3          	sb	a5,-1315(a4) # 8000bc39 <_ZL9finishedC>
    thread_dispatch();
    80005164:	ffffc097          	auipc	ra,0xffffc
    80005168:	2c4080e7          	jalr	708(ra) # 80001428 <_Z15thread_dispatchv>
}
    8000516c:	01813083          	ld	ra,24(sp)
    80005170:	01013403          	ld	s0,16(sp)
    80005174:	00813483          	ld	s1,8(sp)
    80005178:	00013903          	ld	s2,0(sp)
    8000517c:	02010113          	addi	sp,sp,32
    80005180:	00008067          	ret

0000000080005184 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80005184:	fe010113          	addi	sp,sp,-32
    80005188:	00113c23          	sd	ra,24(sp)
    8000518c:	00813823          	sd	s0,16(sp)
    80005190:	00913423          	sd	s1,8(sp)
    80005194:	01213023          	sd	s2,0(sp)
    80005198:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    8000519c:	00000913          	li	s2,0
    800051a0:	0380006f          	j	800051d8 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    800051a4:	ffffc097          	auipc	ra,0xffffc
    800051a8:	284080e7          	jalr	644(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800051ac:	00148493          	addi	s1,s1,1
    800051b0:	000027b7          	lui	a5,0x2
    800051b4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800051b8:	0097ee63          	bltu	a5,s1,800051d4 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800051bc:	00000713          	li	a4,0
    800051c0:	000077b7          	lui	a5,0x7
    800051c4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800051c8:	fce7eee3          	bltu	a5,a4,800051a4 <_ZL11workerBodyBPv+0x20>
    800051cc:	00170713          	addi	a4,a4,1
    800051d0:	ff1ff06f          	j	800051c0 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    800051d4:	00190913          	addi	s2,s2,1
    800051d8:	00f00793          	li	a5,15
    800051dc:	0527e063          	bltu	a5,s2,8000521c <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800051e0:	00004517          	auipc	a0,0x4
    800051e4:	15850513          	addi	a0,a0,344 # 80009338 <_ZZ9kPrintIntmE6digits+0x2c8>
    800051e8:	00001097          	auipc	ra,0x1
    800051ec:	ac4080e7          	jalr	-1340(ra) # 80005cac <_Z11printStringPKc>
    800051f0:	00000613          	li	a2,0
    800051f4:	00a00593          	li	a1,10
    800051f8:	0009051b          	sext.w	a0,s2
    800051fc:	00001097          	auipc	ra,0x1
    80005200:	c60080e7          	jalr	-928(ra) # 80005e5c <_Z8printIntiii>
    80005204:	00004517          	auipc	a0,0x4
    80005208:	37c50513          	addi	a0,a0,892 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    8000520c:	00001097          	auipc	ra,0x1
    80005210:	aa0080e7          	jalr	-1376(ra) # 80005cac <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005214:	00000493          	li	s1,0
    80005218:	f99ff06f          	j	800051b0 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    8000521c:	00004517          	auipc	a0,0x4
    80005220:	12450513          	addi	a0,a0,292 # 80009340 <_ZZ9kPrintIntmE6digits+0x2d0>
    80005224:	00001097          	auipc	ra,0x1
    80005228:	a88080e7          	jalr	-1400(ra) # 80005cac <_Z11printStringPKc>
    finishedB = true;
    8000522c:	00100793          	li	a5,1
    80005230:	00007717          	auipc	a4,0x7
    80005234:	a0f70523          	sb	a5,-1526(a4) # 8000bc3a <_ZL9finishedB>
    thread_dispatch();
    80005238:	ffffc097          	auipc	ra,0xffffc
    8000523c:	1f0080e7          	jalr	496(ra) # 80001428 <_Z15thread_dispatchv>
}
    80005240:	01813083          	ld	ra,24(sp)
    80005244:	01013403          	ld	s0,16(sp)
    80005248:	00813483          	ld	s1,8(sp)
    8000524c:	00013903          	ld	s2,0(sp)
    80005250:	02010113          	addi	sp,sp,32
    80005254:	00008067          	ret

0000000080005258 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80005258:	fe010113          	addi	sp,sp,-32
    8000525c:	00113c23          	sd	ra,24(sp)
    80005260:	00813823          	sd	s0,16(sp)
    80005264:	00913423          	sd	s1,8(sp)
    80005268:	01213023          	sd	s2,0(sp)
    8000526c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80005270:	00000913          	li	s2,0
    80005274:	0380006f          	j	800052ac <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80005278:	ffffc097          	auipc	ra,0xffffc
    8000527c:	1b0080e7          	jalr	432(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005280:	00148493          	addi	s1,s1,1
    80005284:	000027b7          	lui	a5,0x2
    80005288:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000528c:	0097ee63          	bltu	a5,s1,800052a8 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005290:	00000713          	li	a4,0
    80005294:	000077b7          	lui	a5,0x7
    80005298:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000529c:	fce7eee3          	bltu	a5,a4,80005278 <_ZL11workerBodyAPv+0x20>
    800052a0:	00170713          	addi	a4,a4,1
    800052a4:	ff1ff06f          	j	80005294 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800052a8:	00190913          	addi	s2,s2,1
    800052ac:	00900793          	li	a5,9
    800052b0:	0527e063          	bltu	a5,s2,800052f0 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800052b4:	00004517          	auipc	a0,0x4
    800052b8:	06c50513          	addi	a0,a0,108 # 80009320 <_ZZ9kPrintIntmE6digits+0x2b0>
    800052bc:	00001097          	auipc	ra,0x1
    800052c0:	9f0080e7          	jalr	-1552(ra) # 80005cac <_Z11printStringPKc>
    800052c4:	00000613          	li	a2,0
    800052c8:	00a00593          	li	a1,10
    800052cc:	0009051b          	sext.w	a0,s2
    800052d0:	00001097          	auipc	ra,0x1
    800052d4:	b8c080e7          	jalr	-1140(ra) # 80005e5c <_Z8printIntiii>
    800052d8:	00004517          	auipc	a0,0x4
    800052dc:	2a850513          	addi	a0,a0,680 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    800052e0:	00001097          	auipc	ra,0x1
    800052e4:	9cc080e7          	jalr	-1588(ra) # 80005cac <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800052e8:	00000493          	li	s1,0
    800052ec:	f99ff06f          	j	80005284 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    800052f0:	00004517          	auipc	a0,0x4
    800052f4:	03850513          	addi	a0,a0,56 # 80009328 <_ZZ9kPrintIntmE6digits+0x2b8>
    800052f8:	00001097          	auipc	ra,0x1
    800052fc:	9b4080e7          	jalr	-1612(ra) # 80005cac <_Z11printStringPKc>
    finishedA = true;
    80005300:	00100793          	li	a5,1
    80005304:	00007717          	auipc	a4,0x7
    80005308:	92f70ba3          	sb	a5,-1737(a4) # 8000bc3b <_ZL9finishedA>
}
    8000530c:	01813083          	ld	ra,24(sp)
    80005310:	01013403          	ld	s0,16(sp)
    80005314:	00813483          	ld	s1,8(sp)
    80005318:	00013903          	ld	s2,0(sp)
    8000531c:	02010113          	addi	sp,sp,32
    80005320:	00008067          	ret

0000000080005324 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80005324:	fd010113          	addi	sp,sp,-48
    80005328:	02113423          	sd	ra,40(sp)
    8000532c:	02813023          	sd	s0,32(sp)
    80005330:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80005334:	00000613          	li	a2,0
    80005338:	00000597          	auipc	a1,0x0
    8000533c:	f2058593          	addi	a1,a1,-224 # 80005258 <_ZL11workerBodyAPv>
    80005340:	fd040513          	addi	a0,s0,-48
    80005344:	ffffc097          	auipc	ra,0xffffc
    80005348:	03c080e7          	jalr	60(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    8000534c:	00004517          	auipc	a0,0x4
    80005350:	07c50513          	addi	a0,a0,124 # 800093c8 <_ZZ9kPrintIntmE6digits+0x358>
    80005354:	00001097          	auipc	ra,0x1
    80005358:	958080e7          	jalr	-1704(ra) # 80005cac <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    8000535c:	00000613          	li	a2,0
    80005360:	00000597          	auipc	a1,0x0
    80005364:	e2458593          	addi	a1,a1,-476 # 80005184 <_ZL11workerBodyBPv>
    80005368:	fd840513          	addi	a0,s0,-40
    8000536c:	ffffc097          	auipc	ra,0xffffc
    80005370:	014080e7          	jalr	20(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80005374:	00004517          	auipc	a0,0x4
    80005378:	06c50513          	addi	a0,a0,108 # 800093e0 <_ZZ9kPrintIntmE6digits+0x370>
    8000537c:	00001097          	auipc	ra,0x1
    80005380:	930080e7          	jalr	-1744(ra) # 80005cac <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80005384:	00000613          	li	a2,0
    80005388:	00000597          	auipc	a1,0x0
    8000538c:	c7c58593          	addi	a1,a1,-900 # 80005004 <_ZL11workerBodyCPv>
    80005390:	fe040513          	addi	a0,s0,-32
    80005394:	ffffc097          	auipc	ra,0xffffc
    80005398:	fec080e7          	jalr	-20(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    8000539c:	00004517          	auipc	a0,0x4
    800053a0:	05c50513          	addi	a0,a0,92 # 800093f8 <_ZZ9kPrintIntmE6digits+0x388>
    800053a4:	00001097          	auipc	ra,0x1
    800053a8:	908080e7          	jalr	-1784(ra) # 80005cac <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    800053ac:	00000613          	li	a2,0
    800053b0:	00000597          	auipc	a1,0x0
    800053b4:	b0c58593          	addi	a1,a1,-1268 # 80004ebc <_ZL11workerBodyDPv>
    800053b8:	fe840513          	addi	a0,s0,-24
    800053bc:	ffffc097          	auipc	ra,0xffffc
    800053c0:	fc4080e7          	jalr	-60(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    800053c4:	00004517          	auipc	a0,0x4
    800053c8:	04c50513          	addi	a0,a0,76 # 80009410 <_ZZ9kPrintIntmE6digits+0x3a0>
    800053cc:	00001097          	auipc	ra,0x1
    800053d0:	8e0080e7          	jalr	-1824(ra) # 80005cac <_Z11printStringPKc>
    800053d4:	00c0006f          	j	800053e0 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    800053d8:	ffffc097          	auipc	ra,0xffffc
    800053dc:	050080e7          	jalr	80(ra) # 80001428 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800053e0:	00007797          	auipc	a5,0x7
    800053e4:	85b7c783          	lbu	a5,-1957(a5) # 8000bc3b <_ZL9finishedA>
    800053e8:	fe0788e3          	beqz	a5,800053d8 <_Z18Threads_C_API_testv+0xb4>
    800053ec:	00007797          	auipc	a5,0x7
    800053f0:	84e7c783          	lbu	a5,-1970(a5) # 8000bc3a <_ZL9finishedB>
    800053f4:	fe0782e3          	beqz	a5,800053d8 <_Z18Threads_C_API_testv+0xb4>
    800053f8:	00007797          	auipc	a5,0x7
    800053fc:	8417c783          	lbu	a5,-1983(a5) # 8000bc39 <_ZL9finishedC>
    80005400:	fc078ce3          	beqz	a5,800053d8 <_Z18Threads_C_API_testv+0xb4>
    80005404:	00007797          	auipc	a5,0x7
    80005408:	8347c783          	lbu	a5,-1996(a5) # 8000bc38 <_ZL9finishedD>
    8000540c:	fc0786e3          	beqz	a5,800053d8 <_Z18Threads_C_API_testv+0xb4>
    }

}
    80005410:	02813083          	ld	ra,40(sp)
    80005414:	02013403          	ld	s0,32(sp)
    80005418:	03010113          	addi	sp,sp,48
    8000541c:	00008067          	ret

0000000080005420 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80005420:	fd010113          	addi	sp,sp,-48
    80005424:	02113423          	sd	ra,40(sp)
    80005428:	02813023          	sd	s0,32(sp)
    8000542c:	00913c23          	sd	s1,24(sp)
    80005430:	01213823          	sd	s2,16(sp)
    80005434:	01313423          	sd	s3,8(sp)
    80005438:	03010413          	addi	s0,sp,48
    8000543c:	00050993          	mv	s3,a0
    80005440:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80005444:	00000913          	li	s2,0
    80005448:	00c0006f          	j	80005454 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    8000544c:	ffffd097          	auipc	ra,0xffffd
    80005450:	230080e7          	jalr	560(ra) # 8000267c <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80005454:	ffffc097          	auipc	ra,0xffffc
    80005458:	114080e7          	jalr	276(ra) # 80001568 <_Z4getcv>
    8000545c:	0005059b          	sext.w	a1,a0
    80005460:	01b00793          	li	a5,27
    80005464:	02f58a63          	beq	a1,a5,80005498 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80005468:	0084b503          	ld	a0,8(s1)
    8000546c:	00001097          	auipc	ra,0x1
    80005470:	c64080e7          	jalr	-924(ra) # 800060d0 <_ZN9BufferCPP3putEi>
        i++;
    80005474:	0019071b          	addiw	a4,s2,1
    80005478:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    8000547c:	0004a683          	lw	a3,0(s1)
    80005480:	0026979b          	slliw	a5,a3,0x2
    80005484:	00d787bb          	addw	a5,a5,a3
    80005488:	0017979b          	slliw	a5,a5,0x1
    8000548c:	02f767bb          	remw	a5,a4,a5
    80005490:	fc0792e3          	bnez	a5,80005454 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    80005494:	fb9ff06f          	j	8000544c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80005498:	00100793          	li	a5,1
    8000549c:	00006717          	auipc	a4,0x6
    800054a0:	7af72223          	sw	a5,1956(a4) # 8000bc40 <_ZL9threadEnd>
    td->buffer->put('!');
    800054a4:	0209b783          	ld	a5,32(s3)
    800054a8:	02100593          	li	a1,33
    800054ac:	0087b503          	ld	a0,8(a5)
    800054b0:	00001097          	auipc	ra,0x1
    800054b4:	c20080e7          	jalr	-992(ra) # 800060d0 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    800054b8:	0104b503          	ld	a0,16(s1)
    800054bc:	ffffd097          	auipc	ra,0xffffd
    800054c0:	354080e7          	jalr	852(ra) # 80002810 <_ZN9Semaphore6signalEv>
}
    800054c4:	02813083          	ld	ra,40(sp)
    800054c8:	02013403          	ld	s0,32(sp)
    800054cc:	01813483          	ld	s1,24(sp)
    800054d0:	01013903          	ld	s2,16(sp)
    800054d4:	00813983          	ld	s3,8(sp)
    800054d8:	03010113          	addi	sp,sp,48
    800054dc:	00008067          	ret

00000000800054e0 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    800054e0:	fe010113          	addi	sp,sp,-32
    800054e4:	00113c23          	sd	ra,24(sp)
    800054e8:	00813823          	sd	s0,16(sp)
    800054ec:	00913423          	sd	s1,8(sp)
    800054f0:	01213023          	sd	s2,0(sp)
    800054f4:	02010413          	addi	s0,sp,32
    800054f8:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800054fc:	00000913          	li	s2,0
    80005500:	00c0006f          	j	8000550c <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005504:	ffffd097          	auipc	ra,0xffffd
    80005508:	178080e7          	jalr	376(ra) # 8000267c <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    8000550c:	00006797          	auipc	a5,0x6
    80005510:	7347a783          	lw	a5,1844(a5) # 8000bc40 <_ZL9threadEnd>
    80005514:	02079e63          	bnez	a5,80005550 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80005518:	0004a583          	lw	a1,0(s1)
    8000551c:	0305859b          	addiw	a1,a1,48
    80005520:	0084b503          	ld	a0,8(s1)
    80005524:	00001097          	auipc	ra,0x1
    80005528:	bac080e7          	jalr	-1108(ra) # 800060d0 <_ZN9BufferCPP3putEi>
        i++;
    8000552c:	0019071b          	addiw	a4,s2,1
    80005530:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005534:	0004a683          	lw	a3,0(s1)
    80005538:	0026979b          	slliw	a5,a3,0x2
    8000553c:	00d787bb          	addw	a5,a5,a3
    80005540:	0017979b          	slliw	a5,a5,0x1
    80005544:	02f767bb          	remw	a5,a4,a5
    80005548:	fc0792e3          	bnez	a5,8000550c <_ZN12ProducerSync8producerEPv+0x2c>
    8000554c:	fb9ff06f          	j	80005504 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80005550:	0104b503          	ld	a0,16(s1)
    80005554:	ffffd097          	auipc	ra,0xffffd
    80005558:	2bc080e7          	jalr	700(ra) # 80002810 <_ZN9Semaphore6signalEv>
}
    8000555c:	01813083          	ld	ra,24(sp)
    80005560:	01013403          	ld	s0,16(sp)
    80005564:	00813483          	ld	s1,8(sp)
    80005568:	00013903          	ld	s2,0(sp)
    8000556c:	02010113          	addi	sp,sp,32
    80005570:	00008067          	ret

0000000080005574 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80005574:	fd010113          	addi	sp,sp,-48
    80005578:	02113423          	sd	ra,40(sp)
    8000557c:	02813023          	sd	s0,32(sp)
    80005580:	00913c23          	sd	s1,24(sp)
    80005584:	01213823          	sd	s2,16(sp)
    80005588:	01313423          	sd	s3,8(sp)
    8000558c:	01413023          	sd	s4,0(sp)
    80005590:	03010413          	addi	s0,sp,48
    80005594:	00050993          	mv	s3,a0
    80005598:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    8000559c:	00000a13          	li	s4,0
    800055a0:	01c0006f          	j	800055bc <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    800055a4:	ffffd097          	auipc	ra,0xffffd
    800055a8:	0d8080e7          	jalr	216(ra) # 8000267c <_ZN6Thread8dispatchEv>
    800055ac:	0500006f          	j	800055fc <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    800055b0:	00a00513          	li	a0,10
    800055b4:	ffffc097          	auipc	ra,0xffffc
    800055b8:	fdc080e7          	jalr	-36(ra) # 80001590 <_Z4putcc>
    while (!threadEnd) {
    800055bc:	00006797          	auipc	a5,0x6
    800055c0:	6847a783          	lw	a5,1668(a5) # 8000bc40 <_ZL9threadEnd>
    800055c4:	06079263          	bnez	a5,80005628 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    800055c8:	00893503          	ld	a0,8(s2)
    800055cc:	00001097          	auipc	ra,0x1
    800055d0:	b94080e7          	jalr	-1132(ra) # 80006160 <_ZN9BufferCPP3getEv>
        i++;
    800055d4:	001a049b          	addiw	s1,s4,1
    800055d8:	00048a1b          	sext.w	s4,s1
        putc(key);
    800055dc:	0ff57513          	andi	a0,a0,255
    800055e0:	ffffc097          	auipc	ra,0xffffc
    800055e4:	fb0080e7          	jalr	-80(ra) # 80001590 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    800055e8:	00092703          	lw	a4,0(s2)
    800055ec:	0027179b          	slliw	a5,a4,0x2
    800055f0:	00e787bb          	addw	a5,a5,a4
    800055f4:	02f4e7bb          	remw	a5,s1,a5
    800055f8:	fa0786e3          	beqz	a5,800055a4 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    800055fc:	05000793          	li	a5,80
    80005600:	02f4e4bb          	remw	s1,s1,a5
    80005604:	fa049ce3          	bnez	s1,800055bc <_ZN12ConsumerSync8consumerEPv+0x48>
    80005608:	fa9ff06f          	j	800055b0 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    8000560c:	0209b783          	ld	a5,32(s3)
    80005610:	0087b503          	ld	a0,8(a5)
    80005614:	00001097          	auipc	ra,0x1
    80005618:	b4c080e7          	jalr	-1204(ra) # 80006160 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    8000561c:	0ff57513          	andi	a0,a0,255
    80005620:	ffffd097          	auipc	ra,0xffffd
    80005624:	2b8080e7          	jalr	696(ra) # 800028d8 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80005628:	0209b783          	ld	a5,32(s3)
    8000562c:	0087b503          	ld	a0,8(a5)
    80005630:	00001097          	auipc	ra,0x1
    80005634:	bbc080e7          	jalr	-1092(ra) # 800061ec <_ZN9BufferCPP6getCntEv>
    80005638:	fca04ae3          	bgtz	a0,8000560c <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    8000563c:	01093503          	ld	a0,16(s2)
    80005640:	ffffd097          	auipc	ra,0xffffd
    80005644:	1d0080e7          	jalr	464(ra) # 80002810 <_ZN9Semaphore6signalEv>
}
    80005648:	02813083          	ld	ra,40(sp)
    8000564c:	02013403          	ld	s0,32(sp)
    80005650:	01813483          	ld	s1,24(sp)
    80005654:	01013903          	ld	s2,16(sp)
    80005658:	00813983          	ld	s3,8(sp)
    8000565c:	00013a03          	ld	s4,0(sp)
    80005660:	03010113          	addi	sp,sp,48
    80005664:	00008067          	ret

0000000080005668 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80005668:	f8010113          	addi	sp,sp,-128
    8000566c:	06113c23          	sd	ra,120(sp)
    80005670:	06813823          	sd	s0,112(sp)
    80005674:	06913423          	sd	s1,104(sp)
    80005678:	07213023          	sd	s2,96(sp)
    8000567c:	05313c23          	sd	s3,88(sp)
    80005680:	05413823          	sd	s4,80(sp)
    80005684:	05513423          	sd	s5,72(sp)
    80005688:	05613023          	sd	s6,64(sp)
    8000568c:	03713c23          	sd	s7,56(sp)
    80005690:	03813823          	sd	s8,48(sp)
    80005694:	03913423          	sd	s9,40(sp)
    80005698:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    8000569c:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    800056a0:	00004517          	auipc	a0,0x4
    800056a4:	b9850513          	addi	a0,a0,-1128 # 80009238 <_ZZ9kPrintIntmE6digits+0x1c8>
    800056a8:	00000097          	auipc	ra,0x0
    800056ac:	604080e7          	jalr	1540(ra) # 80005cac <_Z11printStringPKc>
    getString(input, 30);
    800056b0:	01e00593          	li	a1,30
    800056b4:	f8040493          	addi	s1,s0,-128
    800056b8:	00048513          	mv	a0,s1
    800056bc:	00000097          	auipc	ra,0x0
    800056c0:	678080e7          	jalr	1656(ra) # 80005d34 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800056c4:	00048513          	mv	a0,s1
    800056c8:	00000097          	auipc	ra,0x0
    800056cc:	744080e7          	jalr	1860(ra) # 80005e0c <_Z11stringToIntPKc>
    800056d0:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    800056d4:	00004517          	auipc	a0,0x4
    800056d8:	b8450513          	addi	a0,a0,-1148 # 80009258 <_ZZ9kPrintIntmE6digits+0x1e8>
    800056dc:	00000097          	auipc	ra,0x0
    800056e0:	5d0080e7          	jalr	1488(ra) # 80005cac <_Z11printStringPKc>
    getString(input, 30);
    800056e4:	01e00593          	li	a1,30
    800056e8:	00048513          	mv	a0,s1
    800056ec:	00000097          	auipc	ra,0x0
    800056f0:	648080e7          	jalr	1608(ra) # 80005d34 <_Z9getStringPci>
    n = stringToInt(input);
    800056f4:	00048513          	mv	a0,s1
    800056f8:	00000097          	auipc	ra,0x0
    800056fc:	714080e7          	jalr	1812(ra) # 80005e0c <_Z11stringToIntPKc>
    80005700:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80005704:	00004517          	auipc	a0,0x4
    80005708:	b7450513          	addi	a0,a0,-1164 # 80009278 <_ZZ9kPrintIntmE6digits+0x208>
    8000570c:	00000097          	auipc	ra,0x0
    80005710:	5a0080e7          	jalr	1440(ra) # 80005cac <_Z11printStringPKc>
    80005714:	00000613          	li	a2,0
    80005718:	00a00593          	li	a1,10
    8000571c:	00090513          	mv	a0,s2
    80005720:	00000097          	auipc	ra,0x0
    80005724:	73c080e7          	jalr	1852(ra) # 80005e5c <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005728:	00004517          	auipc	a0,0x4
    8000572c:	b6850513          	addi	a0,a0,-1176 # 80009290 <_ZZ9kPrintIntmE6digits+0x220>
    80005730:	00000097          	auipc	ra,0x0
    80005734:	57c080e7          	jalr	1404(ra) # 80005cac <_Z11printStringPKc>
    80005738:	00000613          	li	a2,0
    8000573c:	00a00593          	li	a1,10
    80005740:	00048513          	mv	a0,s1
    80005744:	00000097          	auipc	ra,0x0
    80005748:	718080e7          	jalr	1816(ra) # 80005e5c <_Z8printIntiii>
    printString(".\n");
    8000574c:	00004517          	auipc	a0,0x4
    80005750:	b5c50513          	addi	a0,a0,-1188 # 800092a8 <_ZZ9kPrintIntmE6digits+0x238>
    80005754:	00000097          	auipc	ra,0x0
    80005758:	558080e7          	jalr	1368(ra) # 80005cac <_Z11printStringPKc>
    if(threadNum > n) {
    8000575c:	0324c463          	blt	s1,s2,80005784 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80005760:	03205c63          	blez	s2,80005798 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80005764:	03800513          	li	a0,56
    80005768:	ffffd097          	auipc	ra,0xffffd
    8000576c:	d00080e7          	jalr	-768(ra) # 80002468 <_Znwm>
    80005770:	00050a93          	mv	s5,a0
    80005774:	00048593          	mv	a1,s1
    80005778:	00001097          	auipc	ra,0x1
    8000577c:	804080e7          	jalr	-2044(ra) # 80005f7c <_ZN9BufferCPPC1Ei>
    80005780:	0300006f          	j	800057b0 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80005784:	00004517          	auipc	a0,0x4
    80005788:	b2c50513          	addi	a0,a0,-1236 # 800092b0 <_ZZ9kPrintIntmE6digits+0x240>
    8000578c:	00000097          	auipc	ra,0x0
    80005790:	520080e7          	jalr	1312(ra) # 80005cac <_Z11printStringPKc>
        return;
    80005794:	0140006f          	j	800057a8 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80005798:	00004517          	auipc	a0,0x4
    8000579c:	b5850513          	addi	a0,a0,-1192 # 800092f0 <_ZZ9kPrintIntmE6digits+0x280>
    800057a0:	00000097          	auipc	ra,0x0
    800057a4:	50c080e7          	jalr	1292(ra) # 80005cac <_Z11printStringPKc>
        return;
    800057a8:	000b8113          	mv	sp,s7
    800057ac:	2380006f          	j	800059e4 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    800057b0:	01000513          	li	a0,16
    800057b4:	ffffd097          	auipc	ra,0xffffd
    800057b8:	cb4080e7          	jalr	-844(ra) # 80002468 <_Znwm>
    800057bc:	00050493          	mv	s1,a0
    800057c0:	00000593          	li	a1,0
    800057c4:	ffffd097          	auipc	ra,0xffffd
    800057c8:	fe8080e7          	jalr	-24(ra) # 800027ac <_ZN9SemaphoreC1Ej>
    800057cc:	00006797          	auipc	a5,0x6
    800057d0:	4697be23          	sd	s1,1148(a5) # 8000bc48 <_ZL10waitForAll>
    Thread* threads[threadNum];
    800057d4:	00391793          	slli	a5,s2,0x3
    800057d8:	00f78793          	addi	a5,a5,15
    800057dc:	ff07f793          	andi	a5,a5,-16
    800057e0:	40f10133          	sub	sp,sp,a5
    800057e4:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    800057e8:	0019071b          	addiw	a4,s2,1
    800057ec:	00171793          	slli	a5,a4,0x1
    800057f0:	00e787b3          	add	a5,a5,a4
    800057f4:	00379793          	slli	a5,a5,0x3
    800057f8:	00f78793          	addi	a5,a5,15
    800057fc:	ff07f793          	andi	a5,a5,-16
    80005800:	40f10133          	sub	sp,sp,a5
    80005804:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80005808:	00191c13          	slli	s8,s2,0x1
    8000580c:	012c07b3          	add	a5,s8,s2
    80005810:	00379793          	slli	a5,a5,0x3
    80005814:	00fa07b3          	add	a5,s4,a5
    80005818:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    8000581c:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80005820:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80005824:	02800513          	li	a0,40
    80005828:	ffffd097          	auipc	ra,0xffffd
    8000582c:	c40080e7          	jalr	-960(ra) # 80002468 <_Znwm>
    80005830:	00050b13          	mv	s6,a0
    80005834:	012c0c33          	add	s8,s8,s2
    80005838:	003c1c13          	slli	s8,s8,0x3
    8000583c:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80005840:	ffffd097          	auipc	ra,0xffffd
    80005844:	ef0080e7          	jalr	-272(ra) # 80002730 <_ZN6ThreadC1Ev>
    80005848:	00006797          	auipc	a5,0x6
    8000584c:	1d078793          	addi	a5,a5,464 # 8000ba18 <_ZTV12ConsumerSync+0x10>
    80005850:	00fb3023          	sd	a5,0(s6)
    80005854:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80005858:	000b0513          	mv	a0,s6
    8000585c:	ffffd097          	auipc	ra,0xffffd
    80005860:	dbc080e7          	jalr	-580(ra) # 80002618 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005864:	00000493          	li	s1,0
    80005868:	0380006f          	j	800058a0 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    8000586c:	00006797          	auipc	a5,0x6
    80005870:	18478793          	addi	a5,a5,388 # 8000b9f0 <_ZTV12ProducerSync+0x10>
    80005874:	00fcb023          	sd	a5,0(s9)
    80005878:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    8000587c:	00349793          	slli	a5,s1,0x3
    80005880:	00f987b3          	add	a5,s3,a5
    80005884:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80005888:	00349793          	slli	a5,s1,0x3
    8000588c:	00f987b3          	add	a5,s3,a5
    80005890:	0007b503          	ld	a0,0(a5)
    80005894:	ffffd097          	auipc	ra,0xffffd
    80005898:	d84080e7          	jalr	-636(ra) # 80002618 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    8000589c:	0014849b          	addiw	s1,s1,1
    800058a0:	0b24d063          	bge	s1,s2,80005940 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    800058a4:	00149793          	slli	a5,s1,0x1
    800058a8:	009787b3          	add	a5,a5,s1
    800058ac:	00379793          	slli	a5,a5,0x3
    800058b0:	00fa07b3          	add	a5,s4,a5
    800058b4:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800058b8:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    800058bc:	00006717          	auipc	a4,0x6
    800058c0:	38c73703          	ld	a4,908(a4) # 8000bc48 <_ZL10waitForAll>
    800058c4:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    800058c8:	02905863          	blez	s1,800058f8 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    800058cc:	02800513          	li	a0,40
    800058d0:	ffffd097          	auipc	ra,0xffffd
    800058d4:	b98080e7          	jalr	-1128(ra) # 80002468 <_Znwm>
    800058d8:	00050c93          	mv	s9,a0
    800058dc:	00149c13          	slli	s8,s1,0x1
    800058e0:	009c0c33          	add	s8,s8,s1
    800058e4:	003c1c13          	slli	s8,s8,0x3
    800058e8:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    800058ec:	ffffd097          	auipc	ra,0xffffd
    800058f0:	e44080e7          	jalr	-444(ra) # 80002730 <_ZN6ThreadC1Ev>
    800058f4:	f79ff06f          	j	8000586c <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    800058f8:	02800513          	li	a0,40
    800058fc:	ffffd097          	auipc	ra,0xffffd
    80005900:	b6c080e7          	jalr	-1172(ra) # 80002468 <_Znwm>
    80005904:	00050c93          	mv	s9,a0
    80005908:	00149c13          	slli	s8,s1,0x1
    8000590c:	009c0c33          	add	s8,s8,s1
    80005910:	003c1c13          	slli	s8,s8,0x3
    80005914:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80005918:	ffffd097          	auipc	ra,0xffffd
    8000591c:	e18080e7          	jalr	-488(ra) # 80002730 <_ZN6ThreadC1Ev>
    80005920:	00006797          	auipc	a5,0x6
    80005924:	0a878793          	addi	a5,a5,168 # 8000b9c8 <_ZTV16ProducerKeyboard+0x10>
    80005928:	00fcb023          	sd	a5,0(s9)
    8000592c:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80005930:	00349793          	slli	a5,s1,0x3
    80005934:	00f987b3          	add	a5,s3,a5
    80005938:	0197b023          	sd	s9,0(a5)
    8000593c:	f4dff06f          	j	80005888 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80005940:	ffffd097          	auipc	ra,0xffffd
    80005944:	d3c080e7          	jalr	-708(ra) # 8000267c <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80005948:	00000493          	li	s1,0
    8000594c:	00994e63          	blt	s2,s1,80005968 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80005950:	00006517          	auipc	a0,0x6
    80005954:	2f853503          	ld	a0,760(a0) # 8000bc48 <_ZL10waitForAll>
    80005958:	ffffd097          	auipc	ra,0xffffd
    8000595c:	e8c080e7          	jalr	-372(ra) # 800027e4 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80005960:	0014849b          	addiw	s1,s1,1
    80005964:	fe9ff06f          	j	8000594c <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80005968:	00000493          	li	s1,0
    8000596c:	0080006f          	j	80005974 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80005970:	0014849b          	addiw	s1,s1,1
    80005974:	0324d263          	bge	s1,s2,80005998 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80005978:	00349793          	slli	a5,s1,0x3
    8000597c:	00f987b3          	add	a5,s3,a5
    80005980:	0007b503          	ld	a0,0(a5)
    80005984:	fe0506e3          	beqz	a0,80005970 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80005988:	00053783          	ld	a5,0(a0)
    8000598c:	0087b783          	ld	a5,8(a5)
    80005990:	000780e7          	jalr	a5
    80005994:	fddff06f          	j	80005970 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80005998:	000b0a63          	beqz	s6,800059ac <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    8000599c:	000b3783          	ld	a5,0(s6)
    800059a0:	0087b783          	ld	a5,8(a5)
    800059a4:	000b0513          	mv	a0,s6
    800059a8:	000780e7          	jalr	a5
    delete waitForAll;
    800059ac:	00006517          	auipc	a0,0x6
    800059b0:	29c53503          	ld	a0,668(a0) # 8000bc48 <_ZL10waitForAll>
    800059b4:	00050863          	beqz	a0,800059c4 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    800059b8:	00053783          	ld	a5,0(a0)
    800059bc:	0087b783          	ld	a5,8(a5)
    800059c0:	000780e7          	jalr	a5
    delete buffer;
    800059c4:	000a8e63          	beqz	s5,800059e0 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    800059c8:	000a8513          	mv	a0,s5
    800059cc:	00001097          	auipc	ra,0x1
    800059d0:	8a8080e7          	jalr	-1880(ra) # 80006274 <_ZN9BufferCPPD1Ev>
    800059d4:	000a8513          	mv	a0,s5
    800059d8:	ffffd097          	auipc	ra,0xffffd
    800059dc:	ae0080e7          	jalr	-1312(ra) # 800024b8 <_ZdlPv>
    800059e0:	000b8113          	mv	sp,s7

}
    800059e4:	f8040113          	addi	sp,s0,-128
    800059e8:	07813083          	ld	ra,120(sp)
    800059ec:	07013403          	ld	s0,112(sp)
    800059f0:	06813483          	ld	s1,104(sp)
    800059f4:	06013903          	ld	s2,96(sp)
    800059f8:	05813983          	ld	s3,88(sp)
    800059fc:	05013a03          	ld	s4,80(sp)
    80005a00:	04813a83          	ld	s5,72(sp)
    80005a04:	04013b03          	ld	s6,64(sp)
    80005a08:	03813b83          	ld	s7,56(sp)
    80005a0c:	03013c03          	ld	s8,48(sp)
    80005a10:	02813c83          	ld	s9,40(sp)
    80005a14:	08010113          	addi	sp,sp,128
    80005a18:	00008067          	ret
    80005a1c:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80005a20:	000a8513          	mv	a0,s5
    80005a24:	ffffd097          	auipc	ra,0xffffd
    80005a28:	a94080e7          	jalr	-1388(ra) # 800024b8 <_ZdlPv>
    80005a2c:	00048513          	mv	a0,s1
    80005a30:	00007097          	auipc	ra,0x7
    80005a34:	2f8080e7          	jalr	760(ra) # 8000cd28 <_Unwind_Resume>
    80005a38:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80005a3c:	00048513          	mv	a0,s1
    80005a40:	ffffd097          	auipc	ra,0xffffd
    80005a44:	a78080e7          	jalr	-1416(ra) # 800024b8 <_ZdlPv>
    80005a48:	00090513          	mv	a0,s2
    80005a4c:	00007097          	auipc	ra,0x7
    80005a50:	2dc080e7          	jalr	732(ra) # 8000cd28 <_Unwind_Resume>
    80005a54:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80005a58:	000b0513          	mv	a0,s6
    80005a5c:	ffffd097          	auipc	ra,0xffffd
    80005a60:	a5c080e7          	jalr	-1444(ra) # 800024b8 <_ZdlPv>
    80005a64:	00048513          	mv	a0,s1
    80005a68:	00007097          	auipc	ra,0x7
    80005a6c:	2c0080e7          	jalr	704(ra) # 8000cd28 <_Unwind_Resume>
    80005a70:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80005a74:	000c8513          	mv	a0,s9
    80005a78:	ffffd097          	auipc	ra,0xffffd
    80005a7c:	a40080e7          	jalr	-1472(ra) # 800024b8 <_ZdlPv>
    80005a80:	00048513          	mv	a0,s1
    80005a84:	00007097          	auipc	ra,0x7
    80005a88:	2a4080e7          	jalr	676(ra) # 8000cd28 <_Unwind_Resume>
    80005a8c:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80005a90:	000c8513          	mv	a0,s9
    80005a94:	ffffd097          	auipc	ra,0xffffd
    80005a98:	a24080e7          	jalr	-1500(ra) # 800024b8 <_ZdlPv>
    80005a9c:	00048513          	mv	a0,s1
    80005aa0:	00007097          	auipc	ra,0x7
    80005aa4:	288080e7          	jalr	648(ra) # 8000cd28 <_Unwind_Resume>

0000000080005aa8 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80005aa8:	ff010113          	addi	sp,sp,-16
    80005aac:	00113423          	sd	ra,8(sp)
    80005ab0:	00813023          	sd	s0,0(sp)
    80005ab4:	01010413          	addi	s0,sp,16
    80005ab8:	00006797          	auipc	a5,0x6
    80005abc:	f6078793          	addi	a5,a5,-160 # 8000ba18 <_ZTV12ConsumerSync+0x10>
    80005ac0:	00f53023          	sd	a5,0(a0)
    80005ac4:	ffffd097          	auipc	ra,0xffffd
    80005ac8:	8b4080e7          	jalr	-1868(ra) # 80002378 <_ZN6ThreadD1Ev>
    80005acc:	00813083          	ld	ra,8(sp)
    80005ad0:	00013403          	ld	s0,0(sp)
    80005ad4:	01010113          	addi	sp,sp,16
    80005ad8:	00008067          	ret

0000000080005adc <_ZN12ConsumerSyncD0Ev>:
    80005adc:	fe010113          	addi	sp,sp,-32
    80005ae0:	00113c23          	sd	ra,24(sp)
    80005ae4:	00813823          	sd	s0,16(sp)
    80005ae8:	00913423          	sd	s1,8(sp)
    80005aec:	02010413          	addi	s0,sp,32
    80005af0:	00050493          	mv	s1,a0
    80005af4:	00006797          	auipc	a5,0x6
    80005af8:	f2478793          	addi	a5,a5,-220 # 8000ba18 <_ZTV12ConsumerSync+0x10>
    80005afc:	00f53023          	sd	a5,0(a0)
    80005b00:	ffffd097          	auipc	ra,0xffffd
    80005b04:	878080e7          	jalr	-1928(ra) # 80002378 <_ZN6ThreadD1Ev>
    80005b08:	00048513          	mv	a0,s1
    80005b0c:	ffffd097          	auipc	ra,0xffffd
    80005b10:	9ac080e7          	jalr	-1620(ra) # 800024b8 <_ZdlPv>
    80005b14:	01813083          	ld	ra,24(sp)
    80005b18:	01013403          	ld	s0,16(sp)
    80005b1c:	00813483          	ld	s1,8(sp)
    80005b20:	02010113          	addi	sp,sp,32
    80005b24:	00008067          	ret

0000000080005b28 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80005b28:	ff010113          	addi	sp,sp,-16
    80005b2c:	00113423          	sd	ra,8(sp)
    80005b30:	00813023          	sd	s0,0(sp)
    80005b34:	01010413          	addi	s0,sp,16
    80005b38:	00006797          	auipc	a5,0x6
    80005b3c:	eb878793          	addi	a5,a5,-328 # 8000b9f0 <_ZTV12ProducerSync+0x10>
    80005b40:	00f53023          	sd	a5,0(a0)
    80005b44:	ffffd097          	auipc	ra,0xffffd
    80005b48:	834080e7          	jalr	-1996(ra) # 80002378 <_ZN6ThreadD1Ev>
    80005b4c:	00813083          	ld	ra,8(sp)
    80005b50:	00013403          	ld	s0,0(sp)
    80005b54:	01010113          	addi	sp,sp,16
    80005b58:	00008067          	ret

0000000080005b5c <_ZN12ProducerSyncD0Ev>:
    80005b5c:	fe010113          	addi	sp,sp,-32
    80005b60:	00113c23          	sd	ra,24(sp)
    80005b64:	00813823          	sd	s0,16(sp)
    80005b68:	00913423          	sd	s1,8(sp)
    80005b6c:	02010413          	addi	s0,sp,32
    80005b70:	00050493          	mv	s1,a0
    80005b74:	00006797          	auipc	a5,0x6
    80005b78:	e7c78793          	addi	a5,a5,-388 # 8000b9f0 <_ZTV12ProducerSync+0x10>
    80005b7c:	00f53023          	sd	a5,0(a0)
    80005b80:	ffffc097          	auipc	ra,0xffffc
    80005b84:	7f8080e7          	jalr	2040(ra) # 80002378 <_ZN6ThreadD1Ev>
    80005b88:	00048513          	mv	a0,s1
    80005b8c:	ffffd097          	auipc	ra,0xffffd
    80005b90:	92c080e7          	jalr	-1748(ra) # 800024b8 <_ZdlPv>
    80005b94:	01813083          	ld	ra,24(sp)
    80005b98:	01013403          	ld	s0,16(sp)
    80005b9c:	00813483          	ld	s1,8(sp)
    80005ba0:	02010113          	addi	sp,sp,32
    80005ba4:	00008067          	ret

0000000080005ba8 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80005ba8:	ff010113          	addi	sp,sp,-16
    80005bac:	00113423          	sd	ra,8(sp)
    80005bb0:	00813023          	sd	s0,0(sp)
    80005bb4:	01010413          	addi	s0,sp,16
    80005bb8:	00006797          	auipc	a5,0x6
    80005bbc:	e1078793          	addi	a5,a5,-496 # 8000b9c8 <_ZTV16ProducerKeyboard+0x10>
    80005bc0:	00f53023          	sd	a5,0(a0)
    80005bc4:	ffffc097          	auipc	ra,0xffffc
    80005bc8:	7b4080e7          	jalr	1972(ra) # 80002378 <_ZN6ThreadD1Ev>
    80005bcc:	00813083          	ld	ra,8(sp)
    80005bd0:	00013403          	ld	s0,0(sp)
    80005bd4:	01010113          	addi	sp,sp,16
    80005bd8:	00008067          	ret

0000000080005bdc <_ZN16ProducerKeyboardD0Ev>:
    80005bdc:	fe010113          	addi	sp,sp,-32
    80005be0:	00113c23          	sd	ra,24(sp)
    80005be4:	00813823          	sd	s0,16(sp)
    80005be8:	00913423          	sd	s1,8(sp)
    80005bec:	02010413          	addi	s0,sp,32
    80005bf0:	00050493          	mv	s1,a0
    80005bf4:	00006797          	auipc	a5,0x6
    80005bf8:	dd478793          	addi	a5,a5,-556 # 8000b9c8 <_ZTV16ProducerKeyboard+0x10>
    80005bfc:	00f53023          	sd	a5,0(a0)
    80005c00:	ffffc097          	auipc	ra,0xffffc
    80005c04:	778080e7          	jalr	1912(ra) # 80002378 <_ZN6ThreadD1Ev>
    80005c08:	00048513          	mv	a0,s1
    80005c0c:	ffffd097          	auipc	ra,0xffffd
    80005c10:	8ac080e7          	jalr	-1876(ra) # 800024b8 <_ZdlPv>
    80005c14:	01813083          	ld	ra,24(sp)
    80005c18:	01013403          	ld	s0,16(sp)
    80005c1c:	00813483          	ld	s1,8(sp)
    80005c20:	02010113          	addi	sp,sp,32
    80005c24:	00008067          	ret

0000000080005c28 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80005c28:	ff010113          	addi	sp,sp,-16
    80005c2c:	00113423          	sd	ra,8(sp)
    80005c30:	00813023          	sd	s0,0(sp)
    80005c34:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80005c38:	02053583          	ld	a1,32(a0)
    80005c3c:	fffff097          	auipc	ra,0xfffff
    80005c40:	7e4080e7          	jalr	2020(ra) # 80005420 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80005c44:	00813083          	ld	ra,8(sp)
    80005c48:	00013403          	ld	s0,0(sp)
    80005c4c:	01010113          	addi	sp,sp,16
    80005c50:	00008067          	ret

0000000080005c54 <_ZN12ProducerSync3runEv>:
    void run() override {
    80005c54:	ff010113          	addi	sp,sp,-16
    80005c58:	00113423          	sd	ra,8(sp)
    80005c5c:	00813023          	sd	s0,0(sp)
    80005c60:	01010413          	addi	s0,sp,16
        producer(td);
    80005c64:	02053583          	ld	a1,32(a0)
    80005c68:	00000097          	auipc	ra,0x0
    80005c6c:	878080e7          	jalr	-1928(ra) # 800054e0 <_ZN12ProducerSync8producerEPv>
    }
    80005c70:	00813083          	ld	ra,8(sp)
    80005c74:	00013403          	ld	s0,0(sp)
    80005c78:	01010113          	addi	sp,sp,16
    80005c7c:	00008067          	ret

0000000080005c80 <_ZN12ConsumerSync3runEv>:
    void run() override {
    80005c80:	ff010113          	addi	sp,sp,-16
    80005c84:	00113423          	sd	ra,8(sp)
    80005c88:	00813023          	sd	s0,0(sp)
    80005c8c:	01010413          	addi	s0,sp,16
        consumer(td);
    80005c90:	02053583          	ld	a1,32(a0)
    80005c94:	00000097          	auipc	ra,0x0
    80005c98:	8e0080e7          	jalr	-1824(ra) # 80005574 <_ZN12ConsumerSync8consumerEPv>
    }
    80005c9c:	00813083          	ld	ra,8(sp)
    80005ca0:	00013403          	ld	s0,0(sp)
    80005ca4:	01010113          	addi	sp,sp,16
    80005ca8:	00008067          	ret

0000000080005cac <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80005cac:	fe010113          	addi	sp,sp,-32
    80005cb0:	00113c23          	sd	ra,24(sp)
    80005cb4:	00813823          	sd	s0,16(sp)
    80005cb8:	00913423          	sd	s1,8(sp)
    80005cbc:	02010413          	addi	s0,sp,32
    80005cc0:	00050493          	mv	s1,a0
    LOCK();
    80005cc4:	00100613          	li	a2,1
    80005cc8:	00000593          	li	a1,0
    80005ccc:	00006517          	auipc	a0,0x6
    80005cd0:	f8450513          	addi	a0,a0,-124 # 8000bc50 <lockPrint>
    80005cd4:	ffffb097          	auipc	ra,0xffffb
    80005cd8:	550080e7          	jalr	1360(ra) # 80001224 <copy_and_swap>
    80005cdc:	00050863          	beqz	a0,80005cec <_Z11printStringPKc+0x40>
    80005ce0:	ffffb097          	auipc	ra,0xffffb
    80005ce4:	748080e7          	jalr	1864(ra) # 80001428 <_Z15thread_dispatchv>
    80005ce8:	fddff06f          	j	80005cc4 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80005cec:	0004c503          	lbu	a0,0(s1)
    80005cf0:	00050a63          	beqz	a0,80005d04 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80005cf4:	ffffc097          	auipc	ra,0xffffc
    80005cf8:	89c080e7          	jalr	-1892(ra) # 80001590 <_Z4putcc>
        string++;
    80005cfc:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80005d00:	fedff06f          	j	80005cec <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80005d04:	00000613          	li	a2,0
    80005d08:	00100593          	li	a1,1
    80005d0c:	00006517          	auipc	a0,0x6
    80005d10:	f4450513          	addi	a0,a0,-188 # 8000bc50 <lockPrint>
    80005d14:	ffffb097          	auipc	ra,0xffffb
    80005d18:	510080e7          	jalr	1296(ra) # 80001224 <copy_and_swap>
    80005d1c:	fe0514e3          	bnez	a0,80005d04 <_Z11printStringPKc+0x58>
}
    80005d20:	01813083          	ld	ra,24(sp)
    80005d24:	01013403          	ld	s0,16(sp)
    80005d28:	00813483          	ld	s1,8(sp)
    80005d2c:	02010113          	addi	sp,sp,32
    80005d30:	00008067          	ret

0000000080005d34 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80005d34:	fd010113          	addi	sp,sp,-48
    80005d38:	02113423          	sd	ra,40(sp)
    80005d3c:	02813023          	sd	s0,32(sp)
    80005d40:	00913c23          	sd	s1,24(sp)
    80005d44:	01213823          	sd	s2,16(sp)
    80005d48:	01313423          	sd	s3,8(sp)
    80005d4c:	01413023          	sd	s4,0(sp)
    80005d50:	03010413          	addi	s0,sp,48
    80005d54:	00050993          	mv	s3,a0
    80005d58:	00058a13          	mv	s4,a1
    LOCK();
    80005d5c:	00100613          	li	a2,1
    80005d60:	00000593          	li	a1,0
    80005d64:	00006517          	auipc	a0,0x6
    80005d68:	eec50513          	addi	a0,a0,-276 # 8000bc50 <lockPrint>
    80005d6c:	ffffb097          	auipc	ra,0xffffb
    80005d70:	4b8080e7          	jalr	1208(ra) # 80001224 <copy_and_swap>
    80005d74:	00050863          	beqz	a0,80005d84 <_Z9getStringPci+0x50>
    80005d78:	ffffb097          	auipc	ra,0xffffb
    80005d7c:	6b0080e7          	jalr	1712(ra) # 80001428 <_Z15thread_dispatchv>
    80005d80:	fddff06f          	j	80005d5c <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80005d84:	00000913          	li	s2,0
    80005d88:	00090493          	mv	s1,s2
    80005d8c:	0019091b          	addiw	s2,s2,1
    80005d90:	03495a63          	bge	s2,s4,80005dc4 <_Z9getStringPci+0x90>
        cc = getc();
    80005d94:	ffffb097          	auipc	ra,0xffffb
    80005d98:	7d4080e7          	jalr	2004(ra) # 80001568 <_Z4getcv>
        if(cc < 1)
    80005d9c:	02050463          	beqz	a0,80005dc4 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80005da0:	009984b3          	add	s1,s3,s1
    80005da4:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80005da8:	00a00793          	li	a5,10
    80005dac:	00f50a63          	beq	a0,a5,80005dc0 <_Z9getStringPci+0x8c>
    80005db0:	00d00793          	li	a5,13
    80005db4:	fcf51ae3          	bne	a0,a5,80005d88 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80005db8:	00090493          	mv	s1,s2
    80005dbc:	0080006f          	j	80005dc4 <_Z9getStringPci+0x90>
    80005dc0:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80005dc4:	009984b3          	add	s1,s3,s1
    80005dc8:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80005dcc:	00000613          	li	a2,0
    80005dd0:	00100593          	li	a1,1
    80005dd4:	00006517          	auipc	a0,0x6
    80005dd8:	e7c50513          	addi	a0,a0,-388 # 8000bc50 <lockPrint>
    80005ddc:	ffffb097          	auipc	ra,0xffffb
    80005de0:	448080e7          	jalr	1096(ra) # 80001224 <copy_and_swap>
    80005de4:	fe0514e3          	bnez	a0,80005dcc <_Z9getStringPci+0x98>
    return buf;
}
    80005de8:	00098513          	mv	a0,s3
    80005dec:	02813083          	ld	ra,40(sp)
    80005df0:	02013403          	ld	s0,32(sp)
    80005df4:	01813483          	ld	s1,24(sp)
    80005df8:	01013903          	ld	s2,16(sp)
    80005dfc:	00813983          	ld	s3,8(sp)
    80005e00:	00013a03          	ld	s4,0(sp)
    80005e04:	03010113          	addi	sp,sp,48
    80005e08:	00008067          	ret

0000000080005e0c <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80005e0c:	ff010113          	addi	sp,sp,-16
    80005e10:	00813423          	sd	s0,8(sp)
    80005e14:	01010413          	addi	s0,sp,16
    80005e18:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80005e1c:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80005e20:	0006c603          	lbu	a2,0(a3)
    80005e24:	fd06071b          	addiw	a4,a2,-48
    80005e28:	0ff77713          	andi	a4,a4,255
    80005e2c:	00900793          	li	a5,9
    80005e30:	02e7e063          	bltu	a5,a4,80005e50 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80005e34:	0025179b          	slliw	a5,a0,0x2
    80005e38:	00a787bb          	addw	a5,a5,a0
    80005e3c:	0017979b          	slliw	a5,a5,0x1
    80005e40:	00168693          	addi	a3,a3,1
    80005e44:	00c787bb          	addw	a5,a5,a2
    80005e48:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80005e4c:	fd5ff06f          	j	80005e20 <_Z11stringToIntPKc+0x14>
    return n;
}
    80005e50:	00813403          	ld	s0,8(sp)
    80005e54:	01010113          	addi	sp,sp,16
    80005e58:	00008067          	ret

0000000080005e5c <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80005e5c:	fc010113          	addi	sp,sp,-64
    80005e60:	02113c23          	sd	ra,56(sp)
    80005e64:	02813823          	sd	s0,48(sp)
    80005e68:	02913423          	sd	s1,40(sp)
    80005e6c:	03213023          	sd	s2,32(sp)
    80005e70:	01313c23          	sd	s3,24(sp)
    80005e74:	04010413          	addi	s0,sp,64
    80005e78:	00050493          	mv	s1,a0
    80005e7c:	00058913          	mv	s2,a1
    80005e80:	00060993          	mv	s3,a2
    LOCK();
    80005e84:	00100613          	li	a2,1
    80005e88:	00000593          	li	a1,0
    80005e8c:	00006517          	auipc	a0,0x6
    80005e90:	dc450513          	addi	a0,a0,-572 # 8000bc50 <lockPrint>
    80005e94:	ffffb097          	auipc	ra,0xffffb
    80005e98:	390080e7          	jalr	912(ra) # 80001224 <copy_and_swap>
    80005e9c:	00050863          	beqz	a0,80005eac <_Z8printIntiii+0x50>
    80005ea0:	ffffb097          	auipc	ra,0xffffb
    80005ea4:	588080e7          	jalr	1416(ra) # 80001428 <_Z15thread_dispatchv>
    80005ea8:	fddff06f          	j	80005e84 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80005eac:	00098463          	beqz	s3,80005eb4 <_Z8printIntiii+0x58>
    80005eb0:	0804c463          	bltz	s1,80005f38 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80005eb4:	0004851b          	sext.w	a0,s1
    neg = 0;
    80005eb8:	00000593          	li	a1,0
    }

    i = 0;
    80005ebc:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80005ec0:	0009079b          	sext.w	a5,s2
    80005ec4:	0325773b          	remuw	a4,a0,s2
    80005ec8:	00048613          	mv	a2,s1
    80005ecc:	0014849b          	addiw	s1,s1,1
    80005ed0:	02071693          	slli	a3,a4,0x20
    80005ed4:	0206d693          	srli	a3,a3,0x20
    80005ed8:	00006717          	auipc	a4,0x6
    80005edc:	b5870713          	addi	a4,a4,-1192 # 8000ba30 <digits>
    80005ee0:	00d70733          	add	a4,a4,a3
    80005ee4:	00074683          	lbu	a3,0(a4)
    80005ee8:	fd040713          	addi	a4,s0,-48
    80005eec:	00c70733          	add	a4,a4,a2
    80005ef0:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80005ef4:	0005071b          	sext.w	a4,a0
    80005ef8:	0325553b          	divuw	a0,a0,s2
    80005efc:	fcf772e3          	bgeu	a4,a5,80005ec0 <_Z8printIntiii+0x64>
    if(neg)
    80005f00:	00058c63          	beqz	a1,80005f18 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80005f04:	fd040793          	addi	a5,s0,-48
    80005f08:	009784b3          	add	s1,a5,s1
    80005f0c:	02d00793          	li	a5,45
    80005f10:	fef48823          	sb	a5,-16(s1)
    80005f14:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80005f18:	fff4849b          	addiw	s1,s1,-1
    80005f1c:	0204c463          	bltz	s1,80005f44 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80005f20:	fd040793          	addi	a5,s0,-48
    80005f24:	009787b3          	add	a5,a5,s1
    80005f28:	ff07c503          	lbu	a0,-16(a5)
    80005f2c:	ffffb097          	auipc	ra,0xffffb
    80005f30:	664080e7          	jalr	1636(ra) # 80001590 <_Z4putcc>
    80005f34:	fe5ff06f          	j	80005f18 <_Z8printIntiii+0xbc>
        x = -xx;
    80005f38:	4090053b          	negw	a0,s1
        neg = 1;
    80005f3c:	00100593          	li	a1,1
        x = -xx;
    80005f40:	f7dff06f          	j	80005ebc <_Z8printIntiii+0x60>

    UNLOCK();
    80005f44:	00000613          	li	a2,0
    80005f48:	00100593          	li	a1,1
    80005f4c:	00006517          	auipc	a0,0x6
    80005f50:	d0450513          	addi	a0,a0,-764 # 8000bc50 <lockPrint>
    80005f54:	ffffb097          	auipc	ra,0xffffb
    80005f58:	2d0080e7          	jalr	720(ra) # 80001224 <copy_and_swap>
    80005f5c:	fe0514e3          	bnez	a0,80005f44 <_Z8printIntiii+0xe8>
    80005f60:	03813083          	ld	ra,56(sp)
    80005f64:	03013403          	ld	s0,48(sp)
    80005f68:	02813483          	ld	s1,40(sp)
    80005f6c:	02013903          	ld	s2,32(sp)
    80005f70:	01813983          	ld	s3,24(sp)
    80005f74:	04010113          	addi	sp,sp,64
    80005f78:	00008067          	ret

0000000080005f7c <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80005f7c:	fd010113          	addi	sp,sp,-48
    80005f80:	02113423          	sd	ra,40(sp)
    80005f84:	02813023          	sd	s0,32(sp)
    80005f88:	00913c23          	sd	s1,24(sp)
    80005f8c:	01213823          	sd	s2,16(sp)
    80005f90:	01313423          	sd	s3,8(sp)
    80005f94:	03010413          	addi	s0,sp,48
    80005f98:	00050493          	mv	s1,a0
    80005f9c:	00058913          	mv	s2,a1
    80005fa0:	0015879b          	addiw	a5,a1,1
    80005fa4:	0007851b          	sext.w	a0,a5
    80005fa8:	00f4a023          	sw	a5,0(s1)
    80005fac:	0004a823          	sw	zero,16(s1)
    80005fb0:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80005fb4:	00251513          	slli	a0,a0,0x2
    80005fb8:	ffffb097          	auipc	ra,0xffffb
    80005fbc:	358080e7          	jalr	856(ra) # 80001310 <_Z9mem_allocm>
    80005fc0:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80005fc4:	01000513          	li	a0,16
    80005fc8:	ffffc097          	auipc	ra,0xffffc
    80005fcc:	4a0080e7          	jalr	1184(ra) # 80002468 <_Znwm>
    80005fd0:	00050993          	mv	s3,a0
    80005fd4:	00000593          	li	a1,0
    80005fd8:	ffffc097          	auipc	ra,0xffffc
    80005fdc:	7d4080e7          	jalr	2004(ra) # 800027ac <_ZN9SemaphoreC1Ej>
    80005fe0:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80005fe4:	01000513          	li	a0,16
    80005fe8:	ffffc097          	auipc	ra,0xffffc
    80005fec:	480080e7          	jalr	1152(ra) # 80002468 <_Znwm>
    80005ff0:	00050993          	mv	s3,a0
    80005ff4:	00090593          	mv	a1,s2
    80005ff8:	ffffc097          	auipc	ra,0xffffc
    80005ffc:	7b4080e7          	jalr	1972(ra) # 800027ac <_ZN9SemaphoreC1Ej>
    80006000:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80006004:	01000513          	li	a0,16
    80006008:	ffffc097          	auipc	ra,0xffffc
    8000600c:	460080e7          	jalr	1120(ra) # 80002468 <_Znwm>
    80006010:	00050913          	mv	s2,a0
    80006014:	00100593          	li	a1,1
    80006018:	ffffc097          	auipc	ra,0xffffc
    8000601c:	794080e7          	jalr	1940(ra) # 800027ac <_ZN9SemaphoreC1Ej>
    80006020:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80006024:	01000513          	li	a0,16
    80006028:	ffffc097          	auipc	ra,0xffffc
    8000602c:	440080e7          	jalr	1088(ra) # 80002468 <_Znwm>
    80006030:	00050913          	mv	s2,a0
    80006034:	00100593          	li	a1,1
    80006038:	ffffc097          	auipc	ra,0xffffc
    8000603c:	774080e7          	jalr	1908(ra) # 800027ac <_ZN9SemaphoreC1Ej>
    80006040:	0324b823          	sd	s2,48(s1)
}
    80006044:	02813083          	ld	ra,40(sp)
    80006048:	02013403          	ld	s0,32(sp)
    8000604c:	01813483          	ld	s1,24(sp)
    80006050:	01013903          	ld	s2,16(sp)
    80006054:	00813983          	ld	s3,8(sp)
    80006058:	03010113          	addi	sp,sp,48
    8000605c:	00008067          	ret
    80006060:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80006064:	00098513          	mv	a0,s3
    80006068:	ffffc097          	auipc	ra,0xffffc
    8000606c:	450080e7          	jalr	1104(ra) # 800024b8 <_ZdlPv>
    80006070:	00048513          	mv	a0,s1
    80006074:	00007097          	auipc	ra,0x7
    80006078:	cb4080e7          	jalr	-844(ra) # 8000cd28 <_Unwind_Resume>
    8000607c:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80006080:	00098513          	mv	a0,s3
    80006084:	ffffc097          	auipc	ra,0xffffc
    80006088:	434080e7          	jalr	1076(ra) # 800024b8 <_ZdlPv>
    8000608c:	00048513          	mv	a0,s1
    80006090:	00007097          	auipc	ra,0x7
    80006094:	c98080e7          	jalr	-872(ra) # 8000cd28 <_Unwind_Resume>
    80006098:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    8000609c:	00090513          	mv	a0,s2
    800060a0:	ffffc097          	auipc	ra,0xffffc
    800060a4:	418080e7          	jalr	1048(ra) # 800024b8 <_ZdlPv>
    800060a8:	00048513          	mv	a0,s1
    800060ac:	00007097          	auipc	ra,0x7
    800060b0:	c7c080e7          	jalr	-900(ra) # 8000cd28 <_Unwind_Resume>
    800060b4:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    800060b8:	00090513          	mv	a0,s2
    800060bc:	ffffc097          	auipc	ra,0xffffc
    800060c0:	3fc080e7          	jalr	1020(ra) # 800024b8 <_ZdlPv>
    800060c4:	00048513          	mv	a0,s1
    800060c8:	00007097          	auipc	ra,0x7
    800060cc:	c60080e7          	jalr	-928(ra) # 8000cd28 <_Unwind_Resume>

00000000800060d0 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    800060d0:	fe010113          	addi	sp,sp,-32
    800060d4:	00113c23          	sd	ra,24(sp)
    800060d8:	00813823          	sd	s0,16(sp)
    800060dc:	00913423          	sd	s1,8(sp)
    800060e0:	01213023          	sd	s2,0(sp)
    800060e4:	02010413          	addi	s0,sp,32
    800060e8:	00050493          	mv	s1,a0
    800060ec:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    800060f0:	01853503          	ld	a0,24(a0)
    800060f4:	ffffc097          	auipc	ra,0xffffc
    800060f8:	6f0080e7          	jalr	1776(ra) # 800027e4 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    800060fc:	0304b503          	ld	a0,48(s1)
    80006100:	ffffc097          	auipc	ra,0xffffc
    80006104:	6e4080e7          	jalr	1764(ra) # 800027e4 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80006108:	0084b783          	ld	a5,8(s1)
    8000610c:	0144a703          	lw	a4,20(s1)
    80006110:	00271713          	slli	a4,a4,0x2
    80006114:	00e787b3          	add	a5,a5,a4
    80006118:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    8000611c:	0144a783          	lw	a5,20(s1)
    80006120:	0017879b          	addiw	a5,a5,1
    80006124:	0004a703          	lw	a4,0(s1)
    80006128:	02e7e7bb          	remw	a5,a5,a4
    8000612c:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80006130:	0304b503          	ld	a0,48(s1)
    80006134:	ffffc097          	auipc	ra,0xffffc
    80006138:	6dc080e7          	jalr	1756(ra) # 80002810 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    8000613c:	0204b503          	ld	a0,32(s1)
    80006140:	ffffc097          	auipc	ra,0xffffc
    80006144:	6d0080e7          	jalr	1744(ra) # 80002810 <_ZN9Semaphore6signalEv>

}
    80006148:	01813083          	ld	ra,24(sp)
    8000614c:	01013403          	ld	s0,16(sp)
    80006150:	00813483          	ld	s1,8(sp)
    80006154:	00013903          	ld	s2,0(sp)
    80006158:	02010113          	addi	sp,sp,32
    8000615c:	00008067          	ret

0000000080006160 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80006160:	fe010113          	addi	sp,sp,-32
    80006164:	00113c23          	sd	ra,24(sp)
    80006168:	00813823          	sd	s0,16(sp)
    8000616c:	00913423          	sd	s1,8(sp)
    80006170:	01213023          	sd	s2,0(sp)
    80006174:	02010413          	addi	s0,sp,32
    80006178:	00050493          	mv	s1,a0
    itemAvailable->wait();
    8000617c:	02053503          	ld	a0,32(a0)
    80006180:	ffffc097          	auipc	ra,0xffffc
    80006184:	664080e7          	jalr	1636(ra) # 800027e4 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80006188:	0284b503          	ld	a0,40(s1)
    8000618c:	ffffc097          	auipc	ra,0xffffc
    80006190:	658080e7          	jalr	1624(ra) # 800027e4 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80006194:	0084b703          	ld	a4,8(s1)
    80006198:	0104a783          	lw	a5,16(s1)
    8000619c:	00279693          	slli	a3,a5,0x2
    800061a0:	00d70733          	add	a4,a4,a3
    800061a4:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    800061a8:	0017879b          	addiw	a5,a5,1
    800061ac:	0004a703          	lw	a4,0(s1)
    800061b0:	02e7e7bb          	remw	a5,a5,a4
    800061b4:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    800061b8:	0284b503          	ld	a0,40(s1)
    800061bc:	ffffc097          	auipc	ra,0xffffc
    800061c0:	654080e7          	jalr	1620(ra) # 80002810 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    800061c4:	0184b503          	ld	a0,24(s1)
    800061c8:	ffffc097          	auipc	ra,0xffffc
    800061cc:	648080e7          	jalr	1608(ra) # 80002810 <_ZN9Semaphore6signalEv>

    return ret;
}
    800061d0:	00090513          	mv	a0,s2
    800061d4:	01813083          	ld	ra,24(sp)
    800061d8:	01013403          	ld	s0,16(sp)
    800061dc:	00813483          	ld	s1,8(sp)
    800061e0:	00013903          	ld	s2,0(sp)
    800061e4:	02010113          	addi	sp,sp,32
    800061e8:	00008067          	ret

00000000800061ec <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    800061ec:	fe010113          	addi	sp,sp,-32
    800061f0:	00113c23          	sd	ra,24(sp)
    800061f4:	00813823          	sd	s0,16(sp)
    800061f8:	00913423          	sd	s1,8(sp)
    800061fc:	01213023          	sd	s2,0(sp)
    80006200:	02010413          	addi	s0,sp,32
    80006204:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80006208:	02853503          	ld	a0,40(a0)
    8000620c:	ffffc097          	auipc	ra,0xffffc
    80006210:	5d8080e7          	jalr	1496(ra) # 800027e4 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80006214:	0304b503          	ld	a0,48(s1)
    80006218:	ffffc097          	auipc	ra,0xffffc
    8000621c:	5cc080e7          	jalr	1484(ra) # 800027e4 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80006220:	0144a783          	lw	a5,20(s1)
    80006224:	0104a903          	lw	s2,16(s1)
    80006228:	0327ce63          	blt	a5,s2,80006264 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    8000622c:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80006230:	0304b503          	ld	a0,48(s1)
    80006234:	ffffc097          	auipc	ra,0xffffc
    80006238:	5dc080e7          	jalr	1500(ra) # 80002810 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    8000623c:	0284b503          	ld	a0,40(s1)
    80006240:	ffffc097          	auipc	ra,0xffffc
    80006244:	5d0080e7          	jalr	1488(ra) # 80002810 <_ZN9Semaphore6signalEv>

    return ret;
}
    80006248:	00090513          	mv	a0,s2
    8000624c:	01813083          	ld	ra,24(sp)
    80006250:	01013403          	ld	s0,16(sp)
    80006254:	00813483          	ld	s1,8(sp)
    80006258:	00013903          	ld	s2,0(sp)
    8000625c:	02010113          	addi	sp,sp,32
    80006260:	00008067          	ret
        ret = cap - head + tail;
    80006264:	0004a703          	lw	a4,0(s1)
    80006268:	4127093b          	subw	s2,a4,s2
    8000626c:	00f9093b          	addw	s2,s2,a5
    80006270:	fc1ff06f          	j	80006230 <_ZN9BufferCPP6getCntEv+0x44>

0000000080006274 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80006274:	fe010113          	addi	sp,sp,-32
    80006278:	00113c23          	sd	ra,24(sp)
    8000627c:	00813823          	sd	s0,16(sp)
    80006280:	00913423          	sd	s1,8(sp)
    80006284:	02010413          	addi	s0,sp,32
    80006288:	00050493          	mv	s1,a0
    Console::putc('\n');
    8000628c:	00a00513          	li	a0,10
    80006290:	ffffc097          	auipc	ra,0xffffc
    80006294:	648080e7          	jalr	1608(ra) # 800028d8 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80006298:	00003517          	auipc	a0,0x3
    8000629c:	19050513          	addi	a0,a0,400 # 80009428 <_ZZ9kPrintIntmE6digits+0x3b8>
    800062a0:	00000097          	auipc	ra,0x0
    800062a4:	a0c080e7          	jalr	-1524(ra) # 80005cac <_Z11printStringPKc>
    while (getCnt()) {
    800062a8:	00048513          	mv	a0,s1
    800062ac:	00000097          	auipc	ra,0x0
    800062b0:	f40080e7          	jalr	-192(ra) # 800061ec <_ZN9BufferCPP6getCntEv>
    800062b4:	02050c63          	beqz	a0,800062ec <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    800062b8:	0084b783          	ld	a5,8(s1)
    800062bc:	0104a703          	lw	a4,16(s1)
    800062c0:	00271713          	slli	a4,a4,0x2
    800062c4:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    800062c8:	0007c503          	lbu	a0,0(a5)
    800062cc:	ffffc097          	auipc	ra,0xffffc
    800062d0:	60c080e7          	jalr	1548(ra) # 800028d8 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    800062d4:	0104a783          	lw	a5,16(s1)
    800062d8:	0017879b          	addiw	a5,a5,1
    800062dc:	0004a703          	lw	a4,0(s1)
    800062e0:	02e7e7bb          	remw	a5,a5,a4
    800062e4:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    800062e8:	fc1ff06f          	j	800062a8 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    800062ec:	02100513          	li	a0,33
    800062f0:	ffffc097          	auipc	ra,0xffffc
    800062f4:	5e8080e7          	jalr	1512(ra) # 800028d8 <_ZN7Console4putcEc>
    Console::putc('\n');
    800062f8:	00a00513          	li	a0,10
    800062fc:	ffffc097          	auipc	ra,0xffffc
    80006300:	5dc080e7          	jalr	1500(ra) # 800028d8 <_ZN7Console4putcEc>
    mem_free(buffer);
    80006304:	0084b503          	ld	a0,8(s1)
    80006308:	ffffb097          	auipc	ra,0xffffb
    8000630c:	048080e7          	jalr	72(ra) # 80001350 <_Z8mem_freePv>
    delete itemAvailable;
    80006310:	0204b503          	ld	a0,32(s1)
    80006314:	00050863          	beqz	a0,80006324 <_ZN9BufferCPPD1Ev+0xb0>
    80006318:	00053783          	ld	a5,0(a0)
    8000631c:	0087b783          	ld	a5,8(a5)
    80006320:	000780e7          	jalr	a5
    delete spaceAvailable;
    80006324:	0184b503          	ld	a0,24(s1)
    80006328:	00050863          	beqz	a0,80006338 <_ZN9BufferCPPD1Ev+0xc4>
    8000632c:	00053783          	ld	a5,0(a0)
    80006330:	0087b783          	ld	a5,8(a5)
    80006334:	000780e7          	jalr	a5
    delete mutexTail;
    80006338:	0304b503          	ld	a0,48(s1)
    8000633c:	00050863          	beqz	a0,8000634c <_ZN9BufferCPPD1Ev+0xd8>
    80006340:	00053783          	ld	a5,0(a0)
    80006344:	0087b783          	ld	a5,8(a5)
    80006348:	000780e7          	jalr	a5
    delete mutexHead;
    8000634c:	0284b503          	ld	a0,40(s1)
    80006350:	00050863          	beqz	a0,80006360 <_ZN9BufferCPPD1Ev+0xec>
    80006354:	00053783          	ld	a5,0(a0)
    80006358:	0087b783          	ld	a5,8(a5)
    8000635c:	000780e7          	jalr	a5
}
    80006360:	01813083          	ld	ra,24(sp)
    80006364:	01013403          	ld	s0,16(sp)
    80006368:	00813483          	ld	s1,8(sp)
    8000636c:	02010113          	addi	sp,sp,32
    80006370:	00008067          	ret

0000000080006374 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    80006374:	fe010113          	addi	sp,sp,-32
    80006378:	00113c23          	sd	ra,24(sp)
    8000637c:	00813823          	sd	s0,16(sp)
    80006380:	00913423          	sd	s1,8(sp)
    80006384:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80006388:	00003517          	auipc	a0,0x3
    8000638c:	0b850513          	addi	a0,a0,184 # 80009440 <_ZZ9kPrintIntmE6digits+0x3d0>
    80006390:	00000097          	auipc	ra,0x0
    80006394:	91c080e7          	jalr	-1764(ra) # 80005cac <_Z11printStringPKc>
    int test = getc() - '0';
    80006398:	ffffb097          	auipc	ra,0xffffb
    8000639c:	1d0080e7          	jalr	464(ra) # 80001568 <_Z4getcv>
    800063a0:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    800063a4:	ffffb097          	auipc	ra,0xffffb
    800063a8:	1c4080e7          	jalr	452(ra) # 80001568 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    800063ac:	00700793          	li	a5,7
    800063b0:	1097e263          	bltu	a5,s1,800064b4 <_Z8userMainv+0x140>
    800063b4:	00249493          	slli	s1,s1,0x2
    800063b8:	00003717          	auipc	a4,0x3
    800063bc:	2e070713          	addi	a4,a4,736 # 80009698 <_ZZ9kPrintIntmE6digits+0x628>
    800063c0:	00e484b3          	add	s1,s1,a4
    800063c4:	0004a783          	lw	a5,0(s1)
    800063c8:	00e787b3          	add	a5,a5,a4
    800063cc:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    800063d0:	fffff097          	auipc	ra,0xfffff
    800063d4:	f54080e7          	jalr	-172(ra) # 80005324 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    800063d8:	00003517          	auipc	a0,0x3
    800063dc:	08850513          	addi	a0,a0,136 # 80009460 <_ZZ9kPrintIntmE6digits+0x3f0>
    800063e0:	00000097          	auipc	ra,0x0
    800063e4:	8cc080e7          	jalr	-1844(ra) # 80005cac <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    800063e8:	01813083          	ld	ra,24(sp)
    800063ec:	01013403          	ld	s0,16(sp)
    800063f0:	00813483          	ld	s1,8(sp)
    800063f4:	02010113          	addi	sp,sp,32
    800063f8:	00008067          	ret
            Threads_CPP_API_test();
    800063fc:	ffffe097          	auipc	ra,0xffffe
    80006400:	e08080e7          	jalr	-504(ra) # 80004204 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80006404:	00003517          	auipc	a0,0x3
    80006408:	09c50513          	addi	a0,a0,156 # 800094a0 <_ZZ9kPrintIntmE6digits+0x430>
    8000640c:	00000097          	auipc	ra,0x0
    80006410:	8a0080e7          	jalr	-1888(ra) # 80005cac <_Z11printStringPKc>
            break;
    80006414:	fd5ff06f          	j	800063e8 <_Z8userMainv+0x74>
            producerConsumer_C_API();
    80006418:	ffffd097          	auipc	ra,0xffffd
    8000641c:	640080e7          	jalr	1600(ra) # 80003a58 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80006420:	00003517          	auipc	a0,0x3
    80006424:	0c050513          	addi	a0,a0,192 # 800094e0 <_ZZ9kPrintIntmE6digits+0x470>
    80006428:	00000097          	auipc	ra,0x0
    8000642c:	884080e7          	jalr	-1916(ra) # 80005cac <_Z11printStringPKc>
            break;
    80006430:	fb9ff06f          	j	800063e8 <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    80006434:	fffff097          	auipc	ra,0xfffff
    80006438:	234080e7          	jalr	564(ra) # 80005668 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    8000643c:	00003517          	auipc	a0,0x3
    80006440:	0f450513          	addi	a0,a0,244 # 80009530 <_ZZ9kPrintIntmE6digits+0x4c0>
    80006444:	00000097          	auipc	ra,0x0
    80006448:	868080e7          	jalr	-1944(ra) # 80005cac <_Z11printStringPKc>
            break;
    8000644c:	f9dff06f          	j	800063e8 <_Z8userMainv+0x74>
            testSleeping();
    80006450:	00000097          	auipc	ra,0x0
    80006454:	11c080e7          	jalr	284(ra) # 8000656c <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    80006458:	00003517          	auipc	a0,0x3
    8000645c:	13050513          	addi	a0,a0,304 # 80009588 <_ZZ9kPrintIntmE6digits+0x518>
    80006460:	00000097          	auipc	ra,0x0
    80006464:	84c080e7          	jalr	-1972(ra) # 80005cac <_Z11printStringPKc>
            break;
    80006468:	f81ff06f          	j	800063e8 <_Z8userMainv+0x74>
            testConsumerProducer();
    8000646c:	ffffe097          	auipc	ra,0xffffe
    80006470:	258080e7          	jalr	600(ra) # 800046c4 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    80006474:	00003517          	auipc	a0,0x3
    80006478:	14450513          	addi	a0,a0,324 # 800095b8 <_ZZ9kPrintIntmE6digits+0x548>
    8000647c:	00000097          	auipc	ra,0x0
    80006480:	830080e7          	jalr	-2000(ra) # 80005cac <_Z11printStringPKc>
            break;
    80006484:	f65ff06f          	j	800063e8 <_Z8userMainv+0x74>
            System_Mode_test();
    80006488:	00000097          	auipc	ra,0x0
    8000648c:	658080e7          	jalr	1624(ra) # 80006ae0 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80006490:	00003517          	auipc	a0,0x3
    80006494:	16850513          	addi	a0,a0,360 # 800095f8 <_ZZ9kPrintIntmE6digits+0x588>
    80006498:	00000097          	auipc	ra,0x0
    8000649c:	814080e7          	jalr	-2028(ra) # 80005cac <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    800064a0:	00003517          	auipc	a0,0x3
    800064a4:	17850513          	addi	a0,a0,376 # 80009618 <_ZZ9kPrintIntmE6digits+0x5a8>
    800064a8:	00000097          	auipc	ra,0x0
    800064ac:	804080e7          	jalr	-2044(ra) # 80005cac <_Z11printStringPKc>
            break;
    800064b0:	f39ff06f          	j	800063e8 <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    800064b4:	00003517          	auipc	a0,0x3
    800064b8:	1bc50513          	addi	a0,a0,444 # 80009670 <_ZZ9kPrintIntmE6digits+0x600>
    800064bc:	fffff097          	auipc	ra,0xfffff
    800064c0:	7f0080e7          	jalr	2032(ra) # 80005cac <_Z11printStringPKc>
    800064c4:	f25ff06f          	j	800063e8 <_Z8userMainv+0x74>

00000000800064c8 <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    800064c8:	fe010113          	addi	sp,sp,-32
    800064cc:	00113c23          	sd	ra,24(sp)
    800064d0:	00813823          	sd	s0,16(sp)
    800064d4:	00913423          	sd	s1,8(sp)
    800064d8:	01213023          	sd	s2,0(sp)
    800064dc:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    800064e0:	00053903          	ld	s2,0(a0)
    int i = 6;
    800064e4:	00600493          	li	s1,6
    while (--i > 0) {
    800064e8:	fff4849b          	addiw	s1,s1,-1
    800064ec:	04905463          	blez	s1,80006534 <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    800064f0:	00003517          	auipc	a0,0x3
    800064f4:	1c850513          	addi	a0,a0,456 # 800096b8 <_ZZ9kPrintIntmE6digits+0x648>
    800064f8:	fffff097          	auipc	ra,0xfffff
    800064fc:	7b4080e7          	jalr	1972(ra) # 80005cac <_Z11printStringPKc>
        printInt(sleep_time);
    80006500:	00000613          	li	a2,0
    80006504:	00a00593          	li	a1,10
    80006508:	0009051b          	sext.w	a0,s2
    8000650c:	00000097          	auipc	ra,0x0
    80006510:	950080e7          	jalr	-1712(ra) # 80005e5c <_Z8printIntiii>
        printString(" !\n");
    80006514:	00003517          	auipc	a0,0x3
    80006518:	1ac50513          	addi	a0,a0,428 # 800096c0 <_ZZ9kPrintIntmE6digits+0x650>
    8000651c:	fffff097          	auipc	ra,0xfffff
    80006520:	790080e7          	jalr	1936(ra) # 80005cac <_Z11printStringPKc>
        time_sleep(sleep_time);
    80006524:	00090513          	mv	a0,s2
    80006528:	ffffb097          	auipc	ra,0xffffb
    8000652c:	f48080e7          	jalr	-184(ra) # 80001470 <_Z10time_sleepm>
    while (--i > 0) {
    80006530:	fb9ff06f          	j	800064e8 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    80006534:	00a00793          	li	a5,10
    80006538:	02f95933          	divu	s2,s2,a5
    8000653c:	fff90913          	addi	s2,s2,-1
    80006540:	00005797          	auipc	a5,0x5
    80006544:	71878793          	addi	a5,a5,1816 # 8000bc58 <_ZL8finished>
    80006548:	01278933          	add	s2,a5,s2
    8000654c:	00100793          	li	a5,1
    80006550:	00f90023          	sb	a5,0(s2)
}
    80006554:	01813083          	ld	ra,24(sp)
    80006558:	01013403          	ld	s0,16(sp)
    8000655c:	00813483          	ld	s1,8(sp)
    80006560:	00013903          	ld	s2,0(sp)
    80006564:	02010113          	addi	sp,sp,32
    80006568:	00008067          	ret

000000008000656c <_Z12testSleepingv>:

void testSleeping() {
    8000656c:	fc010113          	addi	sp,sp,-64
    80006570:	02113c23          	sd	ra,56(sp)
    80006574:	02813823          	sd	s0,48(sp)
    80006578:	02913423          	sd	s1,40(sp)
    8000657c:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    80006580:	00a00793          	li	a5,10
    80006584:	fcf43823          	sd	a5,-48(s0)
    80006588:	01400793          	li	a5,20
    8000658c:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    80006590:	00000493          	li	s1,0
    80006594:	02c0006f          	j	800065c0 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    80006598:	00349793          	slli	a5,s1,0x3
    8000659c:	fd040613          	addi	a2,s0,-48
    800065a0:	00f60633          	add	a2,a2,a5
    800065a4:	00000597          	auipc	a1,0x0
    800065a8:	f2458593          	addi	a1,a1,-220 # 800064c8 <_ZL9sleepyRunPv>
    800065ac:	fc040513          	addi	a0,s0,-64
    800065b0:	00f50533          	add	a0,a0,a5
    800065b4:	ffffb097          	auipc	ra,0xffffb
    800065b8:	dcc080e7          	jalr	-564(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    800065bc:	0014849b          	addiw	s1,s1,1
    800065c0:	00100793          	li	a5,1
    800065c4:	fc97dae3          	bge	a5,s1,80006598 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    800065c8:	00005797          	auipc	a5,0x5
    800065cc:	6907c783          	lbu	a5,1680(a5) # 8000bc58 <_ZL8finished>
    800065d0:	fe078ce3          	beqz	a5,800065c8 <_Z12testSleepingv+0x5c>
    800065d4:	00005797          	auipc	a5,0x5
    800065d8:	6857c783          	lbu	a5,1669(a5) # 8000bc59 <_ZL8finished+0x1>
    800065dc:	fe0786e3          	beqz	a5,800065c8 <_Z12testSleepingv+0x5c>
}
    800065e0:	03813083          	ld	ra,56(sp)
    800065e4:	03013403          	ld	s0,48(sp)
    800065e8:	02813483          	ld	s1,40(sp)
    800065ec:	04010113          	addi	sp,sp,64
    800065f0:	00008067          	ret

00000000800065f4 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800065f4:	fe010113          	addi	sp,sp,-32
    800065f8:	00113c23          	sd	ra,24(sp)
    800065fc:	00813823          	sd	s0,16(sp)
    80006600:	00913423          	sd	s1,8(sp)
    80006604:	01213023          	sd	s2,0(sp)
    80006608:	02010413          	addi	s0,sp,32
    8000660c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80006610:	00100793          	li	a5,1
    80006614:	02a7f863          	bgeu	a5,a0,80006644 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80006618:	00a00793          	li	a5,10
    8000661c:	02f577b3          	remu	a5,a0,a5
    80006620:	02078e63          	beqz	a5,8000665c <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80006624:	fff48513          	addi	a0,s1,-1
    80006628:	00000097          	auipc	ra,0x0
    8000662c:	fcc080e7          	jalr	-52(ra) # 800065f4 <_ZL9fibonaccim>
    80006630:	00050913          	mv	s2,a0
    80006634:	ffe48513          	addi	a0,s1,-2
    80006638:	00000097          	auipc	ra,0x0
    8000663c:	fbc080e7          	jalr	-68(ra) # 800065f4 <_ZL9fibonaccim>
    80006640:	00a90533          	add	a0,s2,a0
}
    80006644:	01813083          	ld	ra,24(sp)
    80006648:	01013403          	ld	s0,16(sp)
    8000664c:	00813483          	ld	s1,8(sp)
    80006650:	00013903          	ld	s2,0(sp)
    80006654:	02010113          	addi	sp,sp,32
    80006658:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    8000665c:	ffffb097          	auipc	ra,0xffffb
    80006660:	dcc080e7          	jalr	-564(ra) # 80001428 <_Z15thread_dispatchv>
    80006664:	fc1ff06f          	j	80006624 <_ZL9fibonaccim+0x30>

0000000080006668 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80006668:	fe010113          	addi	sp,sp,-32
    8000666c:	00113c23          	sd	ra,24(sp)
    80006670:	00813823          	sd	s0,16(sp)
    80006674:	00913423          	sd	s1,8(sp)
    80006678:	01213023          	sd	s2,0(sp)
    8000667c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80006680:	00a00493          	li	s1,10
    80006684:	0400006f          	j	800066c4 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006688:	00003517          	auipc	a0,0x3
    8000668c:	d0850513          	addi	a0,a0,-760 # 80009390 <_ZZ9kPrintIntmE6digits+0x320>
    80006690:	fffff097          	auipc	ra,0xfffff
    80006694:	61c080e7          	jalr	1564(ra) # 80005cac <_Z11printStringPKc>
    80006698:	00000613          	li	a2,0
    8000669c:	00a00593          	li	a1,10
    800066a0:	00048513          	mv	a0,s1
    800066a4:	fffff097          	auipc	ra,0xfffff
    800066a8:	7b8080e7          	jalr	1976(ra) # 80005e5c <_Z8printIntiii>
    800066ac:	00003517          	auipc	a0,0x3
    800066b0:	ed450513          	addi	a0,a0,-300 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    800066b4:	fffff097          	auipc	ra,0xfffff
    800066b8:	5f8080e7          	jalr	1528(ra) # 80005cac <_Z11printStringPKc>
    for (; i < 13; i++) {
    800066bc:	0014849b          	addiw	s1,s1,1
    800066c0:	0ff4f493          	andi	s1,s1,255
    800066c4:	00c00793          	li	a5,12
    800066c8:	fc97f0e3          	bgeu	a5,s1,80006688 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800066cc:	00003517          	auipc	a0,0x3
    800066d0:	ccc50513          	addi	a0,a0,-820 # 80009398 <_ZZ9kPrintIntmE6digits+0x328>
    800066d4:	fffff097          	auipc	ra,0xfffff
    800066d8:	5d8080e7          	jalr	1496(ra) # 80005cac <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800066dc:	00500313          	li	t1,5
    thread_dispatch();
    800066e0:	ffffb097          	auipc	ra,0xffffb
    800066e4:	d48080e7          	jalr	-696(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800066e8:	01000513          	li	a0,16
    800066ec:	00000097          	auipc	ra,0x0
    800066f0:	f08080e7          	jalr	-248(ra) # 800065f4 <_ZL9fibonaccim>
    800066f4:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800066f8:	00003517          	auipc	a0,0x3
    800066fc:	cb050513          	addi	a0,a0,-848 # 800093a8 <_ZZ9kPrintIntmE6digits+0x338>
    80006700:	fffff097          	auipc	ra,0xfffff
    80006704:	5ac080e7          	jalr	1452(ra) # 80005cac <_Z11printStringPKc>
    80006708:	00000613          	li	a2,0
    8000670c:	00a00593          	li	a1,10
    80006710:	0009051b          	sext.w	a0,s2
    80006714:	fffff097          	auipc	ra,0xfffff
    80006718:	748080e7          	jalr	1864(ra) # 80005e5c <_Z8printIntiii>
    8000671c:	00003517          	auipc	a0,0x3
    80006720:	e6450513          	addi	a0,a0,-412 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80006724:	fffff097          	auipc	ra,0xfffff
    80006728:	588080e7          	jalr	1416(ra) # 80005cac <_Z11printStringPKc>
    8000672c:	0400006f          	j	8000676c <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006730:	00003517          	auipc	a0,0x3
    80006734:	c6050513          	addi	a0,a0,-928 # 80009390 <_ZZ9kPrintIntmE6digits+0x320>
    80006738:	fffff097          	auipc	ra,0xfffff
    8000673c:	574080e7          	jalr	1396(ra) # 80005cac <_Z11printStringPKc>
    80006740:	00000613          	li	a2,0
    80006744:	00a00593          	li	a1,10
    80006748:	00048513          	mv	a0,s1
    8000674c:	fffff097          	auipc	ra,0xfffff
    80006750:	710080e7          	jalr	1808(ra) # 80005e5c <_Z8printIntiii>
    80006754:	00003517          	auipc	a0,0x3
    80006758:	e2c50513          	addi	a0,a0,-468 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    8000675c:	fffff097          	auipc	ra,0xfffff
    80006760:	550080e7          	jalr	1360(ra) # 80005cac <_Z11printStringPKc>
    for (; i < 16; i++) {
    80006764:	0014849b          	addiw	s1,s1,1
    80006768:	0ff4f493          	andi	s1,s1,255
    8000676c:	00f00793          	li	a5,15
    80006770:	fc97f0e3          	bgeu	a5,s1,80006730 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80006774:	00003517          	auipc	a0,0x3
    80006778:	c4450513          	addi	a0,a0,-956 # 800093b8 <_ZZ9kPrintIntmE6digits+0x348>
    8000677c:	fffff097          	auipc	ra,0xfffff
    80006780:	530080e7          	jalr	1328(ra) # 80005cac <_Z11printStringPKc>
    finishedD = true;
    80006784:	00100793          	li	a5,1
    80006788:	00005717          	auipc	a4,0x5
    8000678c:	4cf70923          	sb	a5,1234(a4) # 8000bc5a <_ZL9finishedD>
    thread_dispatch();
    80006790:	ffffb097          	auipc	ra,0xffffb
    80006794:	c98080e7          	jalr	-872(ra) # 80001428 <_Z15thread_dispatchv>
}
    80006798:	01813083          	ld	ra,24(sp)
    8000679c:	01013403          	ld	s0,16(sp)
    800067a0:	00813483          	ld	s1,8(sp)
    800067a4:	00013903          	ld	s2,0(sp)
    800067a8:	02010113          	addi	sp,sp,32
    800067ac:	00008067          	ret

00000000800067b0 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800067b0:	fe010113          	addi	sp,sp,-32
    800067b4:	00113c23          	sd	ra,24(sp)
    800067b8:	00813823          	sd	s0,16(sp)
    800067bc:	00913423          	sd	s1,8(sp)
    800067c0:	01213023          	sd	s2,0(sp)
    800067c4:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800067c8:	00000493          	li	s1,0
    800067cc:	0400006f          	j	8000680c <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800067d0:	00003517          	auipc	a0,0x3
    800067d4:	b8050513          	addi	a0,a0,-1152 # 80009350 <_ZZ9kPrintIntmE6digits+0x2e0>
    800067d8:	fffff097          	auipc	ra,0xfffff
    800067dc:	4d4080e7          	jalr	1236(ra) # 80005cac <_Z11printStringPKc>
    800067e0:	00000613          	li	a2,0
    800067e4:	00a00593          	li	a1,10
    800067e8:	00048513          	mv	a0,s1
    800067ec:	fffff097          	auipc	ra,0xfffff
    800067f0:	670080e7          	jalr	1648(ra) # 80005e5c <_Z8printIntiii>
    800067f4:	00003517          	auipc	a0,0x3
    800067f8:	d8c50513          	addi	a0,a0,-628 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    800067fc:	fffff097          	auipc	ra,0xfffff
    80006800:	4b0080e7          	jalr	1200(ra) # 80005cac <_Z11printStringPKc>
    for (; i < 3; i++) {
    80006804:	0014849b          	addiw	s1,s1,1
    80006808:	0ff4f493          	andi	s1,s1,255
    8000680c:	00200793          	li	a5,2
    80006810:	fc97f0e3          	bgeu	a5,s1,800067d0 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80006814:	00003517          	auipc	a0,0x3
    80006818:	b4450513          	addi	a0,a0,-1212 # 80009358 <_ZZ9kPrintIntmE6digits+0x2e8>
    8000681c:	fffff097          	auipc	ra,0xfffff
    80006820:	490080e7          	jalr	1168(ra) # 80005cac <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80006824:	00700313          	li	t1,7
    thread_dispatch();
    80006828:	ffffb097          	auipc	ra,0xffffb
    8000682c:	c00080e7          	jalr	-1024(ra) # 80001428 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80006830:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80006834:	00003517          	auipc	a0,0x3
    80006838:	b3450513          	addi	a0,a0,-1228 # 80009368 <_ZZ9kPrintIntmE6digits+0x2f8>
    8000683c:	fffff097          	auipc	ra,0xfffff
    80006840:	470080e7          	jalr	1136(ra) # 80005cac <_Z11printStringPKc>
    80006844:	00000613          	li	a2,0
    80006848:	00a00593          	li	a1,10
    8000684c:	0009051b          	sext.w	a0,s2
    80006850:	fffff097          	auipc	ra,0xfffff
    80006854:	60c080e7          	jalr	1548(ra) # 80005e5c <_Z8printIntiii>
    80006858:	00003517          	auipc	a0,0x3
    8000685c:	d2850513          	addi	a0,a0,-728 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80006860:	fffff097          	auipc	ra,0xfffff
    80006864:	44c080e7          	jalr	1100(ra) # 80005cac <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80006868:	00c00513          	li	a0,12
    8000686c:	00000097          	auipc	ra,0x0
    80006870:	d88080e7          	jalr	-632(ra) # 800065f4 <_ZL9fibonaccim>
    80006874:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006878:	00003517          	auipc	a0,0x3
    8000687c:	af850513          	addi	a0,a0,-1288 # 80009370 <_ZZ9kPrintIntmE6digits+0x300>
    80006880:	fffff097          	auipc	ra,0xfffff
    80006884:	42c080e7          	jalr	1068(ra) # 80005cac <_Z11printStringPKc>
    80006888:	00000613          	li	a2,0
    8000688c:	00a00593          	li	a1,10
    80006890:	0009051b          	sext.w	a0,s2
    80006894:	fffff097          	auipc	ra,0xfffff
    80006898:	5c8080e7          	jalr	1480(ra) # 80005e5c <_Z8printIntiii>
    8000689c:	00003517          	auipc	a0,0x3
    800068a0:	ce450513          	addi	a0,a0,-796 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    800068a4:	fffff097          	auipc	ra,0xfffff
    800068a8:	408080e7          	jalr	1032(ra) # 80005cac <_Z11printStringPKc>
    800068ac:	0400006f          	j	800068ec <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800068b0:	00003517          	auipc	a0,0x3
    800068b4:	aa050513          	addi	a0,a0,-1376 # 80009350 <_ZZ9kPrintIntmE6digits+0x2e0>
    800068b8:	fffff097          	auipc	ra,0xfffff
    800068bc:	3f4080e7          	jalr	1012(ra) # 80005cac <_Z11printStringPKc>
    800068c0:	00000613          	li	a2,0
    800068c4:	00a00593          	li	a1,10
    800068c8:	00048513          	mv	a0,s1
    800068cc:	fffff097          	auipc	ra,0xfffff
    800068d0:	590080e7          	jalr	1424(ra) # 80005e5c <_Z8printIntiii>
    800068d4:	00003517          	auipc	a0,0x3
    800068d8:	cac50513          	addi	a0,a0,-852 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    800068dc:	fffff097          	auipc	ra,0xfffff
    800068e0:	3d0080e7          	jalr	976(ra) # 80005cac <_Z11printStringPKc>
    for (; i < 6; i++) {
    800068e4:	0014849b          	addiw	s1,s1,1
    800068e8:	0ff4f493          	andi	s1,s1,255
    800068ec:	00500793          	li	a5,5
    800068f0:	fc97f0e3          	bgeu	a5,s1,800068b0 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    800068f4:	00003517          	auipc	a0,0x3
    800068f8:	a3450513          	addi	a0,a0,-1484 # 80009328 <_ZZ9kPrintIntmE6digits+0x2b8>
    800068fc:	fffff097          	auipc	ra,0xfffff
    80006900:	3b0080e7          	jalr	944(ra) # 80005cac <_Z11printStringPKc>
    finishedC = true;
    80006904:	00100793          	li	a5,1
    80006908:	00005717          	auipc	a4,0x5
    8000690c:	34f709a3          	sb	a5,851(a4) # 8000bc5b <_ZL9finishedC>
    thread_dispatch();
    80006910:	ffffb097          	auipc	ra,0xffffb
    80006914:	b18080e7          	jalr	-1256(ra) # 80001428 <_Z15thread_dispatchv>
}
    80006918:	01813083          	ld	ra,24(sp)
    8000691c:	01013403          	ld	s0,16(sp)
    80006920:	00813483          	ld	s1,8(sp)
    80006924:	00013903          	ld	s2,0(sp)
    80006928:	02010113          	addi	sp,sp,32
    8000692c:	00008067          	ret

0000000080006930 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80006930:	fe010113          	addi	sp,sp,-32
    80006934:	00113c23          	sd	ra,24(sp)
    80006938:	00813823          	sd	s0,16(sp)
    8000693c:	00913423          	sd	s1,8(sp)
    80006940:	01213023          	sd	s2,0(sp)
    80006944:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006948:	00000913          	li	s2,0
    8000694c:	0400006f          	j	8000698c <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    80006950:	ffffb097          	auipc	ra,0xffffb
    80006954:	ad8080e7          	jalr	-1320(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006958:	00148493          	addi	s1,s1,1
    8000695c:	000027b7          	lui	a5,0x2
    80006960:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006964:	0097ee63          	bltu	a5,s1,80006980 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006968:	00000713          	li	a4,0
    8000696c:	000077b7          	lui	a5,0x7
    80006970:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006974:	fce7eee3          	bltu	a5,a4,80006950 <_ZL11workerBodyBPv+0x20>
    80006978:	00170713          	addi	a4,a4,1
    8000697c:	ff1ff06f          	j	8000696c <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    80006980:	00a00793          	li	a5,10
    80006984:	04f90663          	beq	s2,a5,800069d0 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80006988:	00190913          	addi	s2,s2,1
    8000698c:	00f00793          	li	a5,15
    80006990:	0527e463          	bltu	a5,s2,800069d8 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80006994:	00003517          	auipc	a0,0x3
    80006998:	9a450513          	addi	a0,a0,-1628 # 80009338 <_ZZ9kPrintIntmE6digits+0x2c8>
    8000699c:	fffff097          	auipc	ra,0xfffff
    800069a0:	310080e7          	jalr	784(ra) # 80005cac <_Z11printStringPKc>
    800069a4:	00000613          	li	a2,0
    800069a8:	00a00593          	li	a1,10
    800069ac:	0009051b          	sext.w	a0,s2
    800069b0:	fffff097          	auipc	ra,0xfffff
    800069b4:	4ac080e7          	jalr	1196(ra) # 80005e5c <_Z8printIntiii>
    800069b8:	00003517          	auipc	a0,0x3
    800069bc:	bc850513          	addi	a0,a0,-1080 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    800069c0:	fffff097          	auipc	ra,0xfffff
    800069c4:	2ec080e7          	jalr	748(ra) # 80005cac <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800069c8:	00000493          	li	s1,0
    800069cc:	f91ff06f          	j	8000695c <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    800069d0:	14102ff3          	csrr	t6,sepc
    800069d4:	fb5ff06f          	j	80006988 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    800069d8:	00003517          	auipc	a0,0x3
    800069dc:	96850513          	addi	a0,a0,-1688 # 80009340 <_ZZ9kPrintIntmE6digits+0x2d0>
    800069e0:	fffff097          	auipc	ra,0xfffff
    800069e4:	2cc080e7          	jalr	716(ra) # 80005cac <_Z11printStringPKc>
    finishedB = true;
    800069e8:	00100793          	li	a5,1
    800069ec:	00005717          	auipc	a4,0x5
    800069f0:	26f70823          	sb	a5,624(a4) # 8000bc5c <_ZL9finishedB>
    thread_dispatch();
    800069f4:	ffffb097          	auipc	ra,0xffffb
    800069f8:	a34080e7          	jalr	-1484(ra) # 80001428 <_Z15thread_dispatchv>
}
    800069fc:	01813083          	ld	ra,24(sp)
    80006a00:	01013403          	ld	s0,16(sp)
    80006a04:	00813483          	ld	s1,8(sp)
    80006a08:	00013903          	ld	s2,0(sp)
    80006a0c:	02010113          	addi	sp,sp,32
    80006a10:	00008067          	ret

0000000080006a14 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006a14:	fe010113          	addi	sp,sp,-32
    80006a18:	00113c23          	sd	ra,24(sp)
    80006a1c:	00813823          	sd	s0,16(sp)
    80006a20:	00913423          	sd	s1,8(sp)
    80006a24:	01213023          	sd	s2,0(sp)
    80006a28:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006a2c:	00000913          	li	s2,0
    80006a30:	0380006f          	j	80006a68 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80006a34:	ffffb097          	auipc	ra,0xffffb
    80006a38:	9f4080e7          	jalr	-1548(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006a3c:	00148493          	addi	s1,s1,1
    80006a40:	000027b7          	lui	a5,0x2
    80006a44:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006a48:	0097ee63          	bltu	a5,s1,80006a64 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006a4c:	00000713          	li	a4,0
    80006a50:	000077b7          	lui	a5,0x7
    80006a54:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006a58:	fce7eee3          	bltu	a5,a4,80006a34 <_ZL11workerBodyAPv+0x20>
    80006a5c:	00170713          	addi	a4,a4,1
    80006a60:	ff1ff06f          	j	80006a50 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80006a64:	00190913          	addi	s2,s2,1
    80006a68:	00900793          	li	a5,9
    80006a6c:	0527e063          	bltu	a5,s2,80006aac <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80006a70:	00003517          	auipc	a0,0x3
    80006a74:	8b050513          	addi	a0,a0,-1872 # 80009320 <_ZZ9kPrintIntmE6digits+0x2b0>
    80006a78:	fffff097          	auipc	ra,0xfffff
    80006a7c:	234080e7          	jalr	564(ra) # 80005cac <_Z11printStringPKc>
    80006a80:	00000613          	li	a2,0
    80006a84:	00a00593          	li	a1,10
    80006a88:	0009051b          	sext.w	a0,s2
    80006a8c:	fffff097          	auipc	ra,0xfffff
    80006a90:	3d0080e7          	jalr	976(ra) # 80005e5c <_Z8printIntiii>
    80006a94:	00003517          	auipc	a0,0x3
    80006a98:	aec50513          	addi	a0,a0,-1300 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80006a9c:	fffff097          	auipc	ra,0xfffff
    80006aa0:	210080e7          	jalr	528(ra) # 80005cac <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006aa4:	00000493          	li	s1,0
    80006aa8:	f99ff06f          	j	80006a40 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80006aac:	00003517          	auipc	a0,0x3
    80006ab0:	87c50513          	addi	a0,a0,-1924 # 80009328 <_ZZ9kPrintIntmE6digits+0x2b8>
    80006ab4:	fffff097          	auipc	ra,0xfffff
    80006ab8:	1f8080e7          	jalr	504(ra) # 80005cac <_Z11printStringPKc>
    finishedA = true;
    80006abc:	00100793          	li	a5,1
    80006ac0:	00005717          	auipc	a4,0x5
    80006ac4:	18f70ea3          	sb	a5,413(a4) # 8000bc5d <_ZL9finishedA>
}
    80006ac8:	01813083          	ld	ra,24(sp)
    80006acc:	01013403          	ld	s0,16(sp)
    80006ad0:	00813483          	ld	s1,8(sp)
    80006ad4:	00013903          	ld	s2,0(sp)
    80006ad8:	02010113          	addi	sp,sp,32
    80006adc:	00008067          	ret

0000000080006ae0 <_Z16System_Mode_testv>:


void System_Mode_test() {
    80006ae0:	fd010113          	addi	sp,sp,-48
    80006ae4:	02113423          	sd	ra,40(sp)
    80006ae8:	02813023          	sd	s0,32(sp)
    80006aec:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80006af0:	00000613          	li	a2,0
    80006af4:	00000597          	auipc	a1,0x0
    80006af8:	f2058593          	addi	a1,a1,-224 # 80006a14 <_ZL11workerBodyAPv>
    80006afc:	fd040513          	addi	a0,s0,-48
    80006b00:	ffffb097          	auipc	ra,0xffffb
    80006b04:	880080e7          	jalr	-1920(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80006b08:	00003517          	auipc	a0,0x3
    80006b0c:	8c050513          	addi	a0,a0,-1856 # 800093c8 <_ZZ9kPrintIntmE6digits+0x358>
    80006b10:	fffff097          	auipc	ra,0xfffff
    80006b14:	19c080e7          	jalr	412(ra) # 80005cac <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80006b18:	00000613          	li	a2,0
    80006b1c:	00000597          	auipc	a1,0x0
    80006b20:	e1458593          	addi	a1,a1,-492 # 80006930 <_ZL11workerBodyBPv>
    80006b24:	fd840513          	addi	a0,s0,-40
    80006b28:	ffffb097          	auipc	ra,0xffffb
    80006b2c:	858080e7          	jalr	-1960(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80006b30:	00003517          	auipc	a0,0x3
    80006b34:	8b050513          	addi	a0,a0,-1872 # 800093e0 <_ZZ9kPrintIntmE6digits+0x370>
    80006b38:	fffff097          	auipc	ra,0xfffff
    80006b3c:	174080e7          	jalr	372(ra) # 80005cac <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80006b40:	00000613          	li	a2,0
    80006b44:	00000597          	auipc	a1,0x0
    80006b48:	c6c58593          	addi	a1,a1,-916 # 800067b0 <_ZL11workerBodyCPv>
    80006b4c:	fe040513          	addi	a0,s0,-32
    80006b50:	ffffb097          	auipc	ra,0xffffb
    80006b54:	830080e7          	jalr	-2000(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80006b58:	00003517          	auipc	a0,0x3
    80006b5c:	8a050513          	addi	a0,a0,-1888 # 800093f8 <_ZZ9kPrintIntmE6digits+0x388>
    80006b60:	fffff097          	auipc	ra,0xfffff
    80006b64:	14c080e7          	jalr	332(ra) # 80005cac <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80006b68:	00000613          	li	a2,0
    80006b6c:	00000597          	auipc	a1,0x0
    80006b70:	afc58593          	addi	a1,a1,-1284 # 80006668 <_ZL11workerBodyDPv>
    80006b74:	fe840513          	addi	a0,s0,-24
    80006b78:	ffffb097          	auipc	ra,0xffffb
    80006b7c:	808080e7          	jalr	-2040(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80006b80:	00003517          	auipc	a0,0x3
    80006b84:	89050513          	addi	a0,a0,-1904 # 80009410 <_ZZ9kPrintIntmE6digits+0x3a0>
    80006b88:	fffff097          	auipc	ra,0xfffff
    80006b8c:	124080e7          	jalr	292(ra) # 80005cac <_Z11printStringPKc>
    80006b90:	00c0006f          	j	80006b9c <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006b94:	ffffb097          	auipc	ra,0xffffb
    80006b98:	894080e7          	jalr	-1900(ra) # 80001428 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006b9c:	00005797          	auipc	a5,0x5
    80006ba0:	0c17c783          	lbu	a5,193(a5) # 8000bc5d <_ZL9finishedA>
    80006ba4:	fe0788e3          	beqz	a5,80006b94 <_Z16System_Mode_testv+0xb4>
    80006ba8:	00005797          	auipc	a5,0x5
    80006bac:	0b47c783          	lbu	a5,180(a5) # 8000bc5c <_ZL9finishedB>
    80006bb0:	fe0782e3          	beqz	a5,80006b94 <_Z16System_Mode_testv+0xb4>
    80006bb4:	00005797          	auipc	a5,0x5
    80006bb8:	0a77c783          	lbu	a5,167(a5) # 8000bc5b <_ZL9finishedC>
    80006bbc:	fc078ce3          	beqz	a5,80006b94 <_Z16System_Mode_testv+0xb4>
    80006bc0:	00005797          	auipc	a5,0x5
    80006bc4:	09a7c783          	lbu	a5,154(a5) # 8000bc5a <_ZL9finishedD>
    80006bc8:	fc0786e3          	beqz	a5,80006b94 <_Z16System_Mode_testv+0xb4>
    }

}
    80006bcc:	02813083          	ld	ra,40(sp)
    80006bd0:	02013403          	ld	s0,32(sp)
    80006bd4:	03010113          	addi	sp,sp,48
    80006bd8:	00008067          	ret

0000000080006bdc <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006bdc:	fe010113          	addi	sp,sp,-32
    80006be0:	00113c23          	sd	ra,24(sp)
    80006be4:	00813823          	sd	s0,16(sp)
    80006be8:	00913423          	sd	s1,8(sp)
    80006bec:	01213023          	sd	s2,0(sp)
    80006bf0:	02010413          	addi	s0,sp,32
    80006bf4:	00050493          	mv	s1,a0
    80006bf8:	00058913          	mv	s2,a1
    80006bfc:	0015879b          	addiw	a5,a1,1
    80006c00:	0007851b          	sext.w	a0,a5
    80006c04:	00f4a023          	sw	a5,0(s1)
    80006c08:	0004a823          	sw	zero,16(s1)
    80006c0c:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006c10:	00251513          	slli	a0,a0,0x2
    80006c14:	ffffa097          	auipc	ra,0xffffa
    80006c18:	6fc080e7          	jalr	1788(ra) # 80001310 <_Z9mem_allocm>
    80006c1c:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80006c20:	00000593          	li	a1,0
    80006c24:	02048513          	addi	a0,s1,32
    80006c28:	ffffb097          	auipc	ra,0xffffb
    80006c2c:	878080e7          	jalr	-1928(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&spaceAvailable, _cap);
    80006c30:	00090593          	mv	a1,s2
    80006c34:	01848513          	addi	a0,s1,24
    80006c38:	ffffb097          	auipc	ra,0xffffb
    80006c3c:	868080e7          	jalr	-1944(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&mutexHead, 1);
    80006c40:	00100593          	li	a1,1
    80006c44:	02848513          	addi	a0,s1,40
    80006c48:	ffffb097          	auipc	ra,0xffffb
    80006c4c:	858080e7          	jalr	-1960(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&mutexTail, 1);
    80006c50:	00100593          	li	a1,1
    80006c54:	03048513          	addi	a0,s1,48
    80006c58:	ffffb097          	auipc	ra,0xffffb
    80006c5c:	848080e7          	jalr	-1976(ra) # 800014a0 <_Z8sem_openPP4KSemj>
}
    80006c60:	01813083          	ld	ra,24(sp)
    80006c64:	01013403          	ld	s0,16(sp)
    80006c68:	00813483          	ld	s1,8(sp)
    80006c6c:	00013903          	ld	s2,0(sp)
    80006c70:	02010113          	addi	sp,sp,32
    80006c74:	00008067          	ret

0000000080006c78 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80006c78:	fe010113          	addi	sp,sp,-32
    80006c7c:	00113c23          	sd	ra,24(sp)
    80006c80:	00813823          	sd	s0,16(sp)
    80006c84:	00913423          	sd	s1,8(sp)
    80006c88:	01213023          	sd	s2,0(sp)
    80006c8c:	02010413          	addi	s0,sp,32
    80006c90:	00050493          	mv	s1,a0
    80006c94:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80006c98:	01853503          	ld	a0,24(a0)
    80006c9c:	ffffb097          	auipc	ra,0xffffb
    80006ca0:	86c080e7          	jalr	-1940(ra) # 80001508 <_Z8sem_waitP4KSem>

    sem_wait(mutexTail);
    80006ca4:	0304b503          	ld	a0,48(s1)
    80006ca8:	ffffb097          	auipc	ra,0xffffb
    80006cac:	860080e7          	jalr	-1952(ra) # 80001508 <_Z8sem_waitP4KSem>
    buffer[tail] = val;
    80006cb0:	0084b783          	ld	a5,8(s1)
    80006cb4:	0144a703          	lw	a4,20(s1)
    80006cb8:	00271713          	slli	a4,a4,0x2
    80006cbc:	00e787b3          	add	a5,a5,a4
    80006cc0:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006cc4:	0144a783          	lw	a5,20(s1)
    80006cc8:	0017879b          	addiw	a5,a5,1
    80006ccc:	0004a703          	lw	a4,0(s1)
    80006cd0:	02e7e7bb          	remw	a5,a5,a4
    80006cd4:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80006cd8:	0304b503          	ld	a0,48(s1)
    80006cdc:	ffffb097          	auipc	ra,0xffffb
    80006ce0:	85c080e7          	jalr	-1956(ra) # 80001538 <_Z10sem_signalP4KSem>

    sem_signal(itemAvailable);
    80006ce4:	0204b503          	ld	a0,32(s1)
    80006ce8:	ffffb097          	auipc	ra,0xffffb
    80006cec:	850080e7          	jalr	-1968(ra) # 80001538 <_Z10sem_signalP4KSem>

}
    80006cf0:	01813083          	ld	ra,24(sp)
    80006cf4:	01013403          	ld	s0,16(sp)
    80006cf8:	00813483          	ld	s1,8(sp)
    80006cfc:	00013903          	ld	s2,0(sp)
    80006d00:	02010113          	addi	sp,sp,32
    80006d04:	00008067          	ret

0000000080006d08 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80006d08:	fe010113          	addi	sp,sp,-32
    80006d0c:	00113c23          	sd	ra,24(sp)
    80006d10:	00813823          	sd	s0,16(sp)
    80006d14:	00913423          	sd	s1,8(sp)
    80006d18:	01213023          	sd	s2,0(sp)
    80006d1c:	02010413          	addi	s0,sp,32
    80006d20:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80006d24:	02053503          	ld	a0,32(a0)
    80006d28:	ffffa097          	auipc	ra,0xffffa
    80006d2c:	7e0080e7          	jalr	2016(ra) # 80001508 <_Z8sem_waitP4KSem>

    sem_wait(mutexHead);
    80006d30:	0284b503          	ld	a0,40(s1)
    80006d34:	ffffa097          	auipc	ra,0xffffa
    80006d38:	7d4080e7          	jalr	2004(ra) # 80001508 <_Z8sem_waitP4KSem>

    int ret = buffer[head];
    80006d3c:	0084b703          	ld	a4,8(s1)
    80006d40:	0104a783          	lw	a5,16(s1)
    80006d44:	00279693          	slli	a3,a5,0x2
    80006d48:	00d70733          	add	a4,a4,a3
    80006d4c:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006d50:	0017879b          	addiw	a5,a5,1
    80006d54:	0004a703          	lw	a4,0(s1)
    80006d58:	02e7e7bb          	remw	a5,a5,a4
    80006d5c:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80006d60:	0284b503          	ld	a0,40(s1)
    80006d64:	ffffa097          	auipc	ra,0xffffa
    80006d68:	7d4080e7          	jalr	2004(ra) # 80001538 <_Z10sem_signalP4KSem>

    sem_signal(spaceAvailable);
    80006d6c:	0184b503          	ld	a0,24(s1)
    80006d70:	ffffa097          	auipc	ra,0xffffa
    80006d74:	7c8080e7          	jalr	1992(ra) # 80001538 <_Z10sem_signalP4KSem>

    return ret;
}
    80006d78:	00090513          	mv	a0,s2
    80006d7c:	01813083          	ld	ra,24(sp)
    80006d80:	01013403          	ld	s0,16(sp)
    80006d84:	00813483          	ld	s1,8(sp)
    80006d88:	00013903          	ld	s2,0(sp)
    80006d8c:	02010113          	addi	sp,sp,32
    80006d90:	00008067          	ret

0000000080006d94 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80006d94:	fe010113          	addi	sp,sp,-32
    80006d98:	00113c23          	sd	ra,24(sp)
    80006d9c:	00813823          	sd	s0,16(sp)
    80006da0:	00913423          	sd	s1,8(sp)
    80006da4:	01213023          	sd	s2,0(sp)
    80006da8:	02010413          	addi	s0,sp,32
    80006dac:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80006db0:	02853503          	ld	a0,40(a0)
    80006db4:	ffffa097          	auipc	ra,0xffffa
    80006db8:	754080e7          	jalr	1876(ra) # 80001508 <_Z8sem_waitP4KSem>
    sem_wait(mutexTail);
    80006dbc:	0304b503          	ld	a0,48(s1)
    80006dc0:	ffffa097          	auipc	ra,0xffffa
    80006dc4:	748080e7          	jalr	1864(ra) # 80001508 <_Z8sem_waitP4KSem>

    if (tail >= head) {
    80006dc8:	0144a783          	lw	a5,20(s1)
    80006dcc:	0104a903          	lw	s2,16(s1)
    80006dd0:	0327ce63          	blt	a5,s2,80006e0c <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80006dd4:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80006dd8:	0304b503          	ld	a0,48(s1)
    80006ddc:	ffffa097          	auipc	ra,0xffffa
    80006de0:	75c080e7          	jalr	1884(ra) # 80001538 <_Z10sem_signalP4KSem>
    sem_signal(mutexHead);
    80006de4:	0284b503          	ld	a0,40(s1)
    80006de8:	ffffa097          	auipc	ra,0xffffa
    80006dec:	750080e7          	jalr	1872(ra) # 80001538 <_Z10sem_signalP4KSem>

    return ret;
}
    80006df0:	00090513          	mv	a0,s2
    80006df4:	01813083          	ld	ra,24(sp)
    80006df8:	01013403          	ld	s0,16(sp)
    80006dfc:	00813483          	ld	s1,8(sp)
    80006e00:	00013903          	ld	s2,0(sp)
    80006e04:	02010113          	addi	sp,sp,32
    80006e08:	00008067          	ret
        ret = cap - head + tail;
    80006e0c:	0004a703          	lw	a4,0(s1)
    80006e10:	4127093b          	subw	s2,a4,s2
    80006e14:	00f9093b          	addw	s2,s2,a5
    80006e18:	fc1ff06f          	j	80006dd8 <_ZN6Buffer6getCntEv+0x44>

0000000080006e1c <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80006e1c:	fe010113          	addi	sp,sp,-32
    80006e20:	00113c23          	sd	ra,24(sp)
    80006e24:	00813823          	sd	s0,16(sp)
    80006e28:	00913423          	sd	s1,8(sp)
    80006e2c:	02010413          	addi	s0,sp,32
    80006e30:	00050493          	mv	s1,a0
    putc('\n');
    80006e34:	00a00513          	li	a0,10
    80006e38:	ffffa097          	auipc	ra,0xffffa
    80006e3c:	758080e7          	jalr	1880(ra) # 80001590 <_Z4putcc>
    printString("Buffer deleted!\n");
    80006e40:	00002517          	auipc	a0,0x2
    80006e44:	5e850513          	addi	a0,a0,1512 # 80009428 <_ZZ9kPrintIntmE6digits+0x3b8>
    80006e48:	fffff097          	auipc	ra,0xfffff
    80006e4c:	e64080e7          	jalr	-412(ra) # 80005cac <_Z11printStringPKc>
    while (getCnt() > 0) {
    80006e50:	00048513          	mv	a0,s1
    80006e54:	00000097          	auipc	ra,0x0
    80006e58:	f40080e7          	jalr	-192(ra) # 80006d94 <_ZN6Buffer6getCntEv>
    80006e5c:	02a05c63          	blez	a0,80006e94 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80006e60:	0084b783          	ld	a5,8(s1)
    80006e64:	0104a703          	lw	a4,16(s1)
    80006e68:	00271713          	slli	a4,a4,0x2
    80006e6c:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80006e70:	0007c503          	lbu	a0,0(a5)
    80006e74:	ffffa097          	auipc	ra,0xffffa
    80006e78:	71c080e7          	jalr	1820(ra) # 80001590 <_Z4putcc>
        head = (head + 1) % cap;
    80006e7c:	0104a783          	lw	a5,16(s1)
    80006e80:	0017879b          	addiw	a5,a5,1
    80006e84:	0004a703          	lw	a4,0(s1)
    80006e88:	02e7e7bb          	remw	a5,a5,a4
    80006e8c:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80006e90:	fc1ff06f          	j	80006e50 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80006e94:	02100513          	li	a0,33
    80006e98:	ffffa097          	auipc	ra,0xffffa
    80006e9c:	6f8080e7          	jalr	1784(ra) # 80001590 <_Z4putcc>
    putc('\n');
    80006ea0:	00a00513          	li	a0,10
    80006ea4:	ffffa097          	auipc	ra,0xffffa
    80006ea8:	6ec080e7          	jalr	1772(ra) # 80001590 <_Z4putcc>
    mem_free(buffer);
    80006eac:	0084b503          	ld	a0,8(s1)
    80006eb0:	ffffa097          	auipc	ra,0xffffa
    80006eb4:	4a0080e7          	jalr	1184(ra) # 80001350 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80006eb8:	0204b503          	ld	a0,32(s1)
    80006ebc:	ffffa097          	auipc	ra,0xffffa
    80006ec0:	61c080e7          	jalr	1564(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(spaceAvailable);
    80006ec4:	0184b503          	ld	a0,24(s1)
    80006ec8:	ffffa097          	auipc	ra,0xffffa
    80006ecc:	610080e7          	jalr	1552(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(mutexTail);
    80006ed0:	0304b503          	ld	a0,48(s1)
    80006ed4:	ffffa097          	auipc	ra,0xffffa
    80006ed8:	604080e7          	jalr	1540(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(mutexHead);
    80006edc:	0284b503          	ld	a0,40(s1)
    80006ee0:	ffffa097          	auipc	ra,0xffffa
    80006ee4:	5f8080e7          	jalr	1528(ra) # 800014d8 <_Z9sem_closeP4KSem>
}
    80006ee8:	01813083          	ld	ra,24(sp)
    80006eec:	01013403          	ld	s0,16(sp)
    80006ef0:	00813483          	ld	s1,8(sp)
    80006ef4:	02010113          	addi	sp,sp,32
    80006ef8:	00008067          	ret

0000000080006efc <start>:
    80006efc:	ff010113          	addi	sp,sp,-16
    80006f00:	00813423          	sd	s0,8(sp)
    80006f04:	01010413          	addi	s0,sp,16
    80006f08:	300027f3          	csrr	a5,mstatus
    80006f0c:	ffffe737          	lui	a4,0xffffe
    80006f10:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff193f>
    80006f14:	00e7f7b3          	and	a5,a5,a4
    80006f18:	00001737          	lui	a4,0x1
    80006f1c:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80006f20:	00e7e7b3          	or	a5,a5,a4
    80006f24:	30079073          	csrw	mstatus,a5
    80006f28:	00000797          	auipc	a5,0x0
    80006f2c:	16078793          	addi	a5,a5,352 # 80007088 <system_main>
    80006f30:	34179073          	csrw	mepc,a5
    80006f34:	00000793          	li	a5,0
    80006f38:	18079073          	csrw	satp,a5
    80006f3c:	000107b7          	lui	a5,0x10
    80006f40:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80006f44:	30279073          	csrw	medeleg,a5
    80006f48:	30379073          	csrw	mideleg,a5
    80006f4c:	104027f3          	csrr	a5,sie
    80006f50:	2227e793          	ori	a5,a5,546
    80006f54:	10479073          	csrw	sie,a5
    80006f58:	fff00793          	li	a5,-1
    80006f5c:	00a7d793          	srli	a5,a5,0xa
    80006f60:	3b079073          	csrw	pmpaddr0,a5
    80006f64:	00f00793          	li	a5,15
    80006f68:	3a079073          	csrw	pmpcfg0,a5
    80006f6c:	f14027f3          	csrr	a5,mhartid
    80006f70:	0200c737          	lui	a4,0x200c
    80006f74:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80006f78:	0007869b          	sext.w	a3,a5
    80006f7c:	00269713          	slli	a4,a3,0x2
    80006f80:	000f4637          	lui	a2,0xf4
    80006f84:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80006f88:	00d70733          	add	a4,a4,a3
    80006f8c:	0037979b          	slliw	a5,a5,0x3
    80006f90:	020046b7          	lui	a3,0x2004
    80006f94:	00d787b3          	add	a5,a5,a3
    80006f98:	00c585b3          	add	a1,a1,a2
    80006f9c:	00371693          	slli	a3,a4,0x3
    80006fa0:	00005717          	auipc	a4,0x5
    80006fa4:	cc070713          	addi	a4,a4,-832 # 8000bc60 <timer_scratch>
    80006fa8:	00b7b023          	sd	a1,0(a5)
    80006fac:	00d70733          	add	a4,a4,a3
    80006fb0:	00f73c23          	sd	a5,24(a4)
    80006fb4:	02c73023          	sd	a2,32(a4)
    80006fb8:	34071073          	csrw	mscratch,a4
    80006fbc:	00000797          	auipc	a5,0x0
    80006fc0:	6e478793          	addi	a5,a5,1764 # 800076a0 <timervec>
    80006fc4:	30579073          	csrw	mtvec,a5
    80006fc8:	300027f3          	csrr	a5,mstatus
    80006fcc:	0087e793          	ori	a5,a5,8
    80006fd0:	30079073          	csrw	mstatus,a5
    80006fd4:	304027f3          	csrr	a5,mie
    80006fd8:	0807e793          	ori	a5,a5,128
    80006fdc:	30479073          	csrw	mie,a5
    80006fe0:	f14027f3          	csrr	a5,mhartid
    80006fe4:	0007879b          	sext.w	a5,a5
    80006fe8:	00078213          	mv	tp,a5
    80006fec:	30200073          	mret
    80006ff0:	00813403          	ld	s0,8(sp)
    80006ff4:	01010113          	addi	sp,sp,16
    80006ff8:	00008067          	ret

0000000080006ffc <timerinit>:
    80006ffc:	ff010113          	addi	sp,sp,-16
    80007000:	00813423          	sd	s0,8(sp)
    80007004:	01010413          	addi	s0,sp,16
    80007008:	f14027f3          	csrr	a5,mhartid
    8000700c:	0200c737          	lui	a4,0x200c
    80007010:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80007014:	0007869b          	sext.w	a3,a5
    80007018:	00269713          	slli	a4,a3,0x2
    8000701c:	000f4637          	lui	a2,0xf4
    80007020:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80007024:	00d70733          	add	a4,a4,a3
    80007028:	0037979b          	slliw	a5,a5,0x3
    8000702c:	020046b7          	lui	a3,0x2004
    80007030:	00d787b3          	add	a5,a5,a3
    80007034:	00c585b3          	add	a1,a1,a2
    80007038:	00371693          	slli	a3,a4,0x3
    8000703c:	00005717          	auipc	a4,0x5
    80007040:	c2470713          	addi	a4,a4,-988 # 8000bc60 <timer_scratch>
    80007044:	00b7b023          	sd	a1,0(a5)
    80007048:	00d70733          	add	a4,a4,a3
    8000704c:	00f73c23          	sd	a5,24(a4)
    80007050:	02c73023          	sd	a2,32(a4)
    80007054:	34071073          	csrw	mscratch,a4
    80007058:	00000797          	auipc	a5,0x0
    8000705c:	64878793          	addi	a5,a5,1608 # 800076a0 <timervec>
    80007060:	30579073          	csrw	mtvec,a5
    80007064:	300027f3          	csrr	a5,mstatus
    80007068:	0087e793          	ori	a5,a5,8
    8000706c:	30079073          	csrw	mstatus,a5
    80007070:	304027f3          	csrr	a5,mie
    80007074:	0807e793          	ori	a5,a5,128
    80007078:	30479073          	csrw	mie,a5
    8000707c:	00813403          	ld	s0,8(sp)
    80007080:	01010113          	addi	sp,sp,16
    80007084:	00008067          	ret

0000000080007088 <system_main>:
    80007088:	fe010113          	addi	sp,sp,-32
    8000708c:	00813823          	sd	s0,16(sp)
    80007090:	00913423          	sd	s1,8(sp)
    80007094:	00113c23          	sd	ra,24(sp)
    80007098:	02010413          	addi	s0,sp,32
    8000709c:	00000097          	auipc	ra,0x0
    800070a0:	0c4080e7          	jalr	196(ra) # 80007160 <cpuid>
    800070a4:	00005497          	auipc	s1,0x5
    800070a8:	a3c48493          	addi	s1,s1,-1476 # 8000bae0 <started>
    800070ac:	02050263          	beqz	a0,800070d0 <system_main+0x48>
    800070b0:	0004a783          	lw	a5,0(s1)
    800070b4:	0007879b          	sext.w	a5,a5
    800070b8:	fe078ce3          	beqz	a5,800070b0 <system_main+0x28>
    800070bc:	0ff0000f          	fence
    800070c0:	00002517          	auipc	a0,0x2
    800070c4:	63850513          	addi	a0,a0,1592 # 800096f8 <_ZZ9kPrintIntmE6digits+0x688>
    800070c8:	00001097          	auipc	ra,0x1
    800070cc:	a74080e7          	jalr	-1420(ra) # 80007b3c <panic>
    800070d0:	00001097          	auipc	ra,0x1
    800070d4:	9c8080e7          	jalr	-1592(ra) # 80007a98 <consoleinit>
    800070d8:	00001097          	auipc	ra,0x1
    800070dc:	154080e7          	jalr	340(ra) # 8000822c <printfinit>
    800070e0:	00002517          	auipc	a0,0x2
    800070e4:	4a050513          	addi	a0,a0,1184 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    800070e8:	00001097          	auipc	ra,0x1
    800070ec:	ab0080e7          	jalr	-1360(ra) # 80007b98 <__printf>
    800070f0:	00002517          	auipc	a0,0x2
    800070f4:	5d850513          	addi	a0,a0,1496 # 800096c8 <_ZZ9kPrintIntmE6digits+0x658>
    800070f8:	00001097          	auipc	ra,0x1
    800070fc:	aa0080e7          	jalr	-1376(ra) # 80007b98 <__printf>
    80007100:	00002517          	auipc	a0,0x2
    80007104:	48050513          	addi	a0,a0,1152 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80007108:	00001097          	auipc	ra,0x1
    8000710c:	a90080e7          	jalr	-1392(ra) # 80007b98 <__printf>
    80007110:	00001097          	auipc	ra,0x1
    80007114:	4a8080e7          	jalr	1192(ra) # 800085b8 <kinit>
    80007118:	00000097          	auipc	ra,0x0
    8000711c:	148080e7          	jalr	328(ra) # 80007260 <trapinit>
    80007120:	00000097          	auipc	ra,0x0
    80007124:	16c080e7          	jalr	364(ra) # 8000728c <trapinithart>
    80007128:	00000097          	auipc	ra,0x0
    8000712c:	5b8080e7          	jalr	1464(ra) # 800076e0 <plicinit>
    80007130:	00000097          	auipc	ra,0x0
    80007134:	5d8080e7          	jalr	1496(ra) # 80007708 <plicinithart>
    80007138:	00000097          	auipc	ra,0x0
    8000713c:	078080e7          	jalr	120(ra) # 800071b0 <userinit>
    80007140:	0ff0000f          	fence
    80007144:	00100793          	li	a5,1
    80007148:	00002517          	auipc	a0,0x2
    8000714c:	59850513          	addi	a0,a0,1432 # 800096e0 <_ZZ9kPrintIntmE6digits+0x670>
    80007150:	00f4a023          	sw	a5,0(s1)
    80007154:	00001097          	auipc	ra,0x1
    80007158:	a44080e7          	jalr	-1468(ra) # 80007b98 <__printf>
    8000715c:	0000006f          	j	8000715c <system_main+0xd4>

0000000080007160 <cpuid>:
    80007160:	ff010113          	addi	sp,sp,-16
    80007164:	00813423          	sd	s0,8(sp)
    80007168:	01010413          	addi	s0,sp,16
    8000716c:	00020513          	mv	a0,tp
    80007170:	00813403          	ld	s0,8(sp)
    80007174:	0005051b          	sext.w	a0,a0
    80007178:	01010113          	addi	sp,sp,16
    8000717c:	00008067          	ret

0000000080007180 <mycpu>:
    80007180:	ff010113          	addi	sp,sp,-16
    80007184:	00813423          	sd	s0,8(sp)
    80007188:	01010413          	addi	s0,sp,16
    8000718c:	00020793          	mv	a5,tp
    80007190:	00813403          	ld	s0,8(sp)
    80007194:	0007879b          	sext.w	a5,a5
    80007198:	00779793          	slli	a5,a5,0x7
    8000719c:	00006517          	auipc	a0,0x6
    800071a0:	af450513          	addi	a0,a0,-1292 # 8000cc90 <cpus>
    800071a4:	00f50533          	add	a0,a0,a5
    800071a8:	01010113          	addi	sp,sp,16
    800071ac:	00008067          	ret

00000000800071b0 <userinit>:
    800071b0:	ff010113          	addi	sp,sp,-16
    800071b4:	00813423          	sd	s0,8(sp)
    800071b8:	01010413          	addi	s0,sp,16
    800071bc:	00813403          	ld	s0,8(sp)
    800071c0:	01010113          	addi	sp,sp,16
    800071c4:	ffffb317          	auipc	t1,0xffffb
    800071c8:	ac030067          	jr	-1344(t1) # 80001c84 <main>

00000000800071cc <either_copyout>:
    800071cc:	ff010113          	addi	sp,sp,-16
    800071d0:	00813023          	sd	s0,0(sp)
    800071d4:	00113423          	sd	ra,8(sp)
    800071d8:	01010413          	addi	s0,sp,16
    800071dc:	02051663          	bnez	a0,80007208 <either_copyout+0x3c>
    800071e0:	00058513          	mv	a0,a1
    800071e4:	00060593          	mv	a1,a2
    800071e8:	0006861b          	sext.w	a2,a3
    800071ec:	00002097          	auipc	ra,0x2
    800071f0:	c58080e7          	jalr	-936(ra) # 80008e44 <__memmove>
    800071f4:	00813083          	ld	ra,8(sp)
    800071f8:	00013403          	ld	s0,0(sp)
    800071fc:	00000513          	li	a0,0
    80007200:	01010113          	addi	sp,sp,16
    80007204:	00008067          	ret
    80007208:	00002517          	auipc	a0,0x2
    8000720c:	51850513          	addi	a0,a0,1304 # 80009720 <_ZZ9kPrintIntmE6digits+0x6b0>
    80007210:	00001097          	auipc	ra,0x1
    80007214:	92c080e7          	jalr	-1748(ra) # 80007b3c <panic>

0000000080007218 <either_copyin>:
    80007218:	ff010113          	addi	sp,sp,-16
    8000721c:	00813023          	sd	s0,0(sp)
    80007220:	00113423          	sd	ra,8(sp)
    80007224:	01010413          	addi	s0,sp,16
    80007228:	02059463          	bnez	a1,80007250 <either_copyin+0x38>
    8000722c:	00060593          	mv	a1,a2
    80007230:	0006861b          	sext.w	a2,a3
    80007234:	00002097          	auipc	ra,0x2
    80007238:	c10080e7          	jalr	-1008(ra) # 80008e44 <__memmove>
    8000723c:	00813083          	ld	ra,8(sp)
    80007240:	00013403          	ld	s0,0(sp)
    80007244:	00000513          	li	a0,0
    80007248:	01010113          	addi	sp,sp,16
    8000724c:	00008067          	ret
    80007250:	00002517          	auipc	a0,0x2
    80007254:	4f850513          	addi	a0,a0,1272 # 80009748 <_ZZ9kPrintIntmE6digits+0x6d8>
    80007258:	00001097          	auipc	ra,0x1
    8000725c:	8e4080e7          	jalr	-1820(ra) # 80007b3c <panic>

0000000080007260 <trapinit>:
    80007260:	ff010113          	addi	sp,sp,-16
    80007264:	00813423          	sd	s0,8(sp)
    80007268:	01010413          	addi	s0,sp,16
    8000726c:	00813403          	ld	s0,8(sp)
    80007270:	00002597          	auipc	a1,0x2
    80007274:	50058593          	addi	a1,a1,1280 # 80009770 <_ZZ9kPrintIntmE6digits+0x700>
    80007278:	00006517          	auipc	a0,0x6
    8000727c:	a9850513          	addi	a0,a0,-1384 # 8000cd10 <tickslock>
    80007280:	01010113          	addi	sp,sp,16
    80007284:	00001317          	auipc	t1,0x1
    80007288:	5c430067          	jr	1476(t1) # 80008848 <initlock>

000000008000728c <trapinithart>:
    8000728c:	ff010113          	addi	sp,sp,-16
    80007290:	00813423          	sd	s0,8(sp)
    80007294:	01010413          	addi	s0,sp,16
    80007298:	00000797          	auipc	a5,0x0
    8000729c:	2f878793          	addi	a5,a5,760 # 80007590 <kernelvec>
    800072a0:	10579073          	csrw	stvec,a5
    800072a4:	00813403          	ld	s0,8(sp)
    800072a8:	01010113          	addi	sp,sp,16
    800072ac:	00008067          	ret

00000000800072b0 <usertrap>:
    800072b0:	ff010113          	addi	sp,sp,-16
    800072b4:	00813423          	sd	s0,8(sp)
    800072b8:	01010413          	addi	s0,sp,16
    800072bc:	00813403          	ld	s0,8(sp)
    800072c0:	01010113          	addi	sp,sp,16
    800072c4:	00008067          	ret

00000000800072c8 <usertrapret>:
    800072c8:	ff010113          	addi	sp,sp,-16
    800072cc:	00813423          	sd	s0,8(sp)
    800072d0:	01010413          	addi	s0,sp,16
    800072d4:	00813403          	ld	s0,8(sp)
    800072d8:	01010113          	addi	sp,sp,16
    800072dc:	00008067          	ret

00000000800072e0 <kerneltrap>:
    800072e0:	fe010113          	addi	sp,sp,-32
    800072e4:	00813823          	sd	s0,16(sp)
    800072e8:	00113c23          	sd	ra,24(sp)
    800072ec:	00913423          	sd	s1,8(sp)
    800072f0:	02010413          	addi	s0,sp,32
    800072f4:	142025f3          	csrr	a1,scause
    800072f8:	100027f3          	csrr	a5,sstatus
    800072fc:	0027f793          	andi	a5,a5,2
    80007300:	10079c63          	bnez	a5,80007418 <kerneltrap+0x138>
    80007304:	142027f3          	csrr	a5,scause
    80007308:	0207ce63          	bltz	a5,80007344 <kerneltrap+0x64>
    8000730c:	00002517          	auipc	a0,0x2
    80007310:	4ac50513          	addi	a0,a0,1196 # 800097b8 <_ZZ9kPrintIntmE6digits+0x748>
    80007314:	00001097          	auipc	ra,0x1
    80007318:	884080e7          	jalr	-1916(ra) # 80007b98 <__printf>
    8000731c:	141025f3          	csrr	a1,sepc
    80007320:	14302673          	csrr	a2,stval
    80007324:	00002517          	auipc	a0,0x2
    80007328:	4a450513          	addi	a0,a0,1188 # 800097c8 <_ZZ9kPrintIntmE6digits+0x758>
    8000732c:	00001097          	auipc	ra,0x1
    80007330:	86c080e7          	jalr	-1940(ra) # 80007b98 <__printf>
    80007334:	00002517          	auipc	a0,0x2
    80007338:	4ac50513          	addi	a0,a0,1196 # 800097e0 <_ZZ9kPrintIntmE6digits+0x770>
    8000733c:	00001097          	auipc	ra,0x1
    80007340:	800080e7          	jalr	-2048(ra) # 80007b3c <panic>
    80007344:	0ff7f713          	andi	a4,a5,255
    80007348:	00900693          	li	a3,9
    8000734c:	04d70063          	beq	a4,a3,8000738c <kerneltrap+0xac>
    80007350:	fff00713          	li	a4,-1
    80007354:	03f71713          	slli	a4,a4,0x3f
    80007358:	00170713          	addi	a4,a4,1
    8000735c:	fae798e3          	bne	a5,a4,8000730c <kerneltrap+0x2c>
    80007360:	00000097          	auipc	ra,0x0
    80007364:	e00080e7          	jalr	-512(ra) # 80007160 <cpuid>
    80007368:	06050663          	beqz	a0,800073d4 <kerneltrap+0xf4>
    8000736c:	144027f3          	csrr	a5,sip
    80007370:	ffd7f793          	andi	a5,a5,-3
    80007374:	14479073          	csrw	sip,a5
    80007378:	01813083          	ld	ra,24(sp)
    8000737c:	01013403          	ld	s0,16(sp)
    80007380:	00813483          	ld	s1,8(sp)
    80007384:	02010113          	addi	sp,sp,32
    80007388:	00008067          	ret
    8000738c:	00000097          	auipc	ra,0x0
    80007390:	3c8080e7          	jalr	968(ra) # 80007754 <plic_claim>
    80007394:	00a00793          	li	a5,10
    80007398:	00050493          	mv	s1,a0
    8000739c:	06f50863          	beq	a0,a5,8000740c <kerneltrap+0x12c>
    800073a0:	fc050ce3          	beqz	a0,80007378 <kerneltrap+0x98>
    800073a4:	00050593          	mv	a1,a0
    800073a8:	00002517          	auipc	a0,0x2
    800073ac:	3f050513          	addi	a0,a0,1008 # 80009798 <_ZZ9kPrintIntmE6digits+0x728>
    800073b0:	00000097          	auipc	ra,0x0
    800073b4:	7e8080e7          	jalr	2024(ra) # 80007b98 <__printf>
    800073b8:	01013403          	ld	s0,16(sp)
    800073bc:	01813083          	ld	ra,24(sp)
    800073c0:	00048513          	mv	a0,s1
    800073c4:	00813483          	ld	s1,8(sp)
    800073c8:	02010113          	addi	sp,sp,32
    800073cc:	00000317          	auipc	t1,0x0
    800073d0:	3c030067          	jr	960(t1) # 8000778c <plic_complete>
    800073d4:	00006517          	auipc	a0,0x6
    800073d8:	93c50513          	addi	a0,a0,-1732 # 8000cd10 <tickslock>
    800073dc:	00001097          	auipc	ra,0x1
    800073e0:	490080e7          	jalr	1168(ra) # 8000886c <acquire>
    800073e4:	00004717          	auipc	a4,0x4
    800073e8:	70070713          	addi	a4,a4,1792 # 8000bae4 <ticks>
    800073ec:	00072783          	lw	a5,0(a4)
    800073f0:	00006517          	auipc	a0,0x6
    800073f4:	92050513          	addi	a0,a0,-1760 # 8000cd10 <tickslock>
    800073f8:	0017879b          	addiw	a5,a5,1
    800073fc:	00f72023          	sw	a5,0(a4)
    80007400:	00001097          	auipc	ra,0x1
    80007404:	538080e7          	jalr	1336(ra) # 80008938 <release>
    80007408:	f65ff06f          	j	8000736c <kerneltrap+0x8c>
    8000740c:	00001097          	auipc	ra,0x1
    80007410:	094080e7          	jalr	148(ra) # 800084a0 <uartintr>
    80007414:	fa5ff06f          	j	800073b8 <kerneltrap+0xd8>
    80007418:	00002517          	auipc	a0,0x2
    8000741c:	36050513          	addi	a0,a0,864 # 80009778 <_ZZ9kPrintIntmE6digits+0x708>
    80007420:	00000097          	auipc	ra,0x0
    80007424:	71c080e7          	jalr	1820(ra) # 80007b3c <panic>

0000000080007428 <clockintr>:
    80007428:	fe010113          	addi	sp,sp,-32
    8000742c:	00813823          	sd	s0,16(sp)
    80007430:	00913423          	sd	s1,8(sp)
    80007434:	00113c23          	sd	ra,24(sp)
    80007438:	02010413          	addi	s0,sp,32
    8000743c:	00006497          	auipc	s1,0x6
    80007440:	8d448493          	addi	s1,s1,-1836 # 8000cd10 <tickslock>
    80007444:	00048513          	mv	a0,s1
    80007448:	00001097          	auipc	ra,0x1
    8000744c:	424080e7          	jalr	1060(ra) # 8000886c <acquire>
    80007450:	00004717          	auipc	a4,0x4
    80007454:	69470713          	addi	a4,a4,1684 # 8000bae4 <ticks>
    80007458:	00072783          	lw	a5,0(a4)
    8000745c:	01013403          	ld	s0,16(sp)
    80007460:	01813083          	ld	ra,24(sp)
    80007464:	00048513          	mv	a0,s1
    80007468:	0017879b          	addiw	a5,a5,1
    8000746c:	00813483          	ld	s1,8(sp)
    80007470:	00f72023          	sw	a5,0(a4)
    80007474:	02010113          	addi	sp,sp,32
    80007478:	00001317          	auipc	t1,0x1
    8000747c:	4c030067          	jr	1216(t1) # 80008938 <release>

0000000080007480 <devintr>:
    80007480:	142027f3          	csrr	a5,scause
    80007484:	00000513          	li	a0,0
    80007488:	0007c463          	bltz	a5,80007490 <devintr+0x10>
    8000748c:	00008067          	ret
    80007490:	fe010113          	addi	sp,sp,-32
    80007494:	00813823          	sd	s0,16(sp)
    80007498:	00113c23          	sd	ra,24(sp)
    8000749c:	00913423          	sd	s1,8(sp)
    800074a0:	02010413          	addi	s0,sp,32
    800074a4:	0ff7f713          	andi	a4,a5,255
    800074a8:	00900693          	li	a3,9
    800074ac:	04d70c63          	beq	a4,a3,80007504 <devintr+0x84>
    800074b0:	fff00713          	li	a4,-1
    800074b4:	03f71713          	slli	a4,a4,0x3f
    800074b8:	00170713          	addi	a4,a4,1
    800074bc:	00e78c63          	beq	a5,a4,800074d4 <devintr+0x54>
    800074c0:	01813083          	ld	ra,24(sp)
    800074c4:	01013403          	ld	s0,16(sp)
    800074c8:	00813483          	ld	s1,8(sp)
    800074cc:	02010113          	addi	sp,sp,32
    800074d0:	00008067          	ret
    800074d4:	00000097          	auipc	ra,0x0
    800074d8:	c8c080e7          	jalr	-884(ra) # 80007160 <cpuid>
    800074dc:	06050663          	beqz	a0,80007548 <devintr+0xc8>
    800074e0:	144027f3          	csrr	a5,sip
    800074e4:	ffd7f793          	andi	a5,a5,-3
    800074e8:	14479073          	csrw	sip,a5
    800074ec:	01813083          	ld	ra,24(sp)
    800074f0:	01013403          	ld	s0,16(sp)
    800074f4:	00813483          	ld	s1,8(sp)
    800074f8:	00200513          	li	a0,2
    800074fc:	02010113          	addi	sp,sp,32
    80007500:	00008067          	ret
    80007504:	00000097          	auipc	ra,0x0
    80007508:	250080e7          	jalr	592(ra) # 80007754 <plic_claim>
    8000750c:	00a00793          	li	a5,10
    80007510:	00050493          	mv	s1,a0
    80007514:	06f50663          	beq	a0,a5,80007580 <devintr+0x100>
    80007518:	00100513          	li	a0,1
    8000751c:	fa0482e3          	beqz	s1,800074c0 <devintr+0x40>
    80007520:	00048593          	mv	a1,s1
    80007524:	00002517          	auipc	a0,0x2
    80007528:	27450513          	addi	a0,a0,628 # 80009798 <_ZZ9kPrintIntmE6digits+0x728>
    8000752c:	00000097          	auipc	ra,0x0
    80007530:	66c080e7          	jalr	1644(ra) # 80007b98 <__printf>
    80007534:	00048513          	mv	a0,s1
    80007538:	00000097          	auipc	ra,0x0
    8000753c:	254080e7          	jalr	596(ra) # 8000778c <plic_complete>
    80007540:	00100513          	li	a0,1
    80007544:	f7dff06f          	j	800074c0 <devintr+0x40>
    80007548:	00005517          	auipc	a0,0x5
    8000754c:	7c850513          	addi	a0,a0,1992 # 8000cd10 <tickslock>
    80007550:	00001097          	auipc	ra,0x1
    80007554:	31c080e7          	jalr	796(ra) # 8000886c <acquire>
    80007558:	00004717          	auipc	a4,0x4
    8000755c:	58c70713          	addi	a4,a4,1420 # 8000bae4 <ticks>
    80007560:	00072783          	lw	a5,0(a4)
    80007564:	00005517          	auipc	a0,0x5
    80007568:	7ac50513          	addi	a0,a0,1964 # 8000cd10 <tickslock>
    8000756c:	0017879b          	addiw	a5,a5,1
    80007570:	00f72023          	sw	a5,0(a4)
    80007574:	00001097          	auipc	ra,0x1
    80007578:	3c4080e7          	jalr	964(ra) # 80008938 <release>
    8000757c:	f65ff06f          	j	800074e0 <devintr+0x60>
    80007580:	00001097          	auipc	ra,0x1
    80007584:	f20080e7          	jalr	-224(ra) # 800084a0 <uartintr>
    80007588:	fadff06f          	j	80007534 <devintr+0xb4>
    8000758c:	0000                	unimp
	...

0000000080007590 <kernelvec>:
    80007590:	f0010113          	addi	sp,sp,-256
    80007594:	00113023          	sd	ra,0(sp)
    80007598:	00213423          	sd	sp,8(sp)
    8000759c:	00313823          	sd	gp,16(sp)
    800075a0:	00413c23          	sd	tp,24(sp)
    800075a4:	02513023          	sd	t0,32(sp)
    800075a8:	02613423          	sd	t1,40(sp)
    800075ac:	02713823          	sd	t2,48(sp)
    800075b0:	02813c23          	sd	s0,56(sp)
    800075b4:	04913023          	sd	s1,64(sp)
    800075b8:	04a13423          	sd	a0,72(sp)
    800075bc:	04b13823          	sd	a1,80(sp)
    800075c0:	04c13c23          	sd	a2,88(sp)
    800075c4:	06d13023          	sd	a3,96(sp)
    800075c8:	06e13423          	sd	a4,104(sp)
    800075cc:	06f13823          	sd	a5,112(sp)
    800075d0:	07013c23          	sd	a6,120(sp)
    800075d4:	09113023          	sd	a7,128(sp)
    800075d8:	09213423          	sd	s2,136(sp)
    800075dc:	09313823          	sd	s3,144(sp)
    800075e0:	09413c23          	sd	s4,152(sp)
    800075e4:	0b513023          	sd	s5,160(sp)
    800075e8:	0b613423          	sd	s6,168(sp)
    800075ec:	0b713823          	sd	s7,176(sp)
    800075f0:	0b813c23          	sd	s8,184(sp)
    800075f4:	0d913023          	sd	s9,192(sp)
    800075f8:	0da13423          	sd	s10,200(sp)
    800075fc:	0db13823          	sd	s11,208(sp)
    80007600:	0dc13c23          	sd	t3,216(sp)
    80007604:	0fd13023          	sd	t4,224(sp)
    80007608:	0fe13423          	sd	t5,232(sp)
    8000760c:	0ff13823          	sd	t6,240(sp)
    80007610:	cd1ff0ef          	jal	ra,800072e0 <kerneltrap>
    80007614:	00013083          	ld	ra,0(sp)
    80007618:	00813103          	ld	sp,8(sp)
    8000761c:	01013183          	ld	gp,16(sp)
    80007620:	02013283          	ld	t0,32(sp)
    80007624:	02813303          	ld	t1,40(sp)
    80007628:	03013383          	ld	t2,48(sp)
    8000762c:	03813403          	ld	s0,56(sp)
    80007630:	04013483          	ld	s1,64(sp)
    80007634:	04813503          	ld	a0,72(sp)
    80007638:	05013583          	ld	a1,80(sp)
    8000763c:	05813603          	ld	a2,88(sp)
    80007640:	06013683          	ld	a3,96(sp)
    80007644:	06813703          	ld	a4,104(sp)
    80007648:	07013783          	ld	a5,112(sp)
    8000764c:	07813803          	ld	a6,120(sp)
    80007650:	08013883          	ld	a7,128(sp)
    80007654:	08813903          	ld	s2,136(sp)
    80007658:	09013983          	ld	s3,144(sp)
    8000765c:	09813a03          	ld	s4,152(sp)
    80007660:	0a013a83          	ld	s5,160(sp)
    80007664:	0a813b03          	ld	s6,168(sp)
    80007668:	0b013b83          	ld	s7,176(sp)
    8000766c:	0b813c03          	ld	s8,184(sp)
    80007670:	0c013c83          	ld	s9,192(sp)
    80007674:	0c813d03          	ld	s10,200(sp)
    80007678:	0d013d83          	ld	s11,208(sp)
    8000767c:	0d813e03          	ld	t3,216(sp)
    80007680:	0e013e83          	ld	t4,224(sp)
    80007684:	0e813f03          	ld	t5,232(sp)
    80007688:	0f013f83          	ld	t6,240(sp)
    8000768c:	10010113          	addi	sp,sp,256
    80007690:	10200073          	sret
    80007694:	00000013          	nop
    80007698:	00000013          	nop
    8000769c:	00000013          	nop

00000000800076a0 <timervec>:
    800076a0:	34051573          	csrrw	a0,mscratch,a0
    800076a4:	00b53023          	sd	a1,0(a0)
    800076a8:	00c53423          	sd	a2,8(a0)
    800076ac:	00d53823          	sd	a3,16(a0)
    800076b0:	01853583          	ld	a1,24(a0)
    800076b4:	02053603          	ld	a2,32(a0)
    800076b8:	0005b683          	ld	a3,0(a1)
    800076bc:	00c686b3          	add	a3,a3,a2
    800076c0:	00d5b023          	sd	a3,0(a1)
    800076c4:	00200593          	li	a1,2
    800076c8:	14459073          	csrw	sip,a1
    800076cc:	01053683          	ld	a3,16(a0)
    800076d0:	00853603          	ld	a2,8(a0)
    800076d4:	00053583          	ld	a1,0(a0)
    800076d8:	34051573          	csrrw	a0,mscratch,a0
    800076dc:	30200073          	mret

00000000800076e0 <plicinit>:
    800076e0:	ff010113          	addi	sp,sp,-16
    800076e4:	00813423          	sd	s0,8(sp)
    800076e8:	01010413          	addi	s0,sp,16
    800076ec:	00813403          	ld	s0,8(sp)
    800076f0:	0c0007b7          	lui	a5,0xc000
    800076f4:	00100713          	li	a4,1
    800076f8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800076fc:	00e7a223          	sw	a4,4(a5)
    80007700:	01010113          	addi	sp,sp,16
    80007704:	00008067          	ret

0000000080007708 <plicinithart>:
    80007708:	ff010113          	addi	sp,sp,-16
    8000770c:	00813023          	sd	s0,0(sp)
    80007710:	00113423          	sd	ra,8(sp)
    80007714:	01010413          	addi	s0,sp,16
    80007718:	00000097          	auipc	ra,0x0
    8000771c:	a48080e7          	jalr	-1464(ra) # 80007160 <cpuid>
    80007720:	0085171b          	slliw	a4,a0,0x8
    80007724:	0c0027b7          	lui	a5,0xc002
    80007728:	00e787b3          	add	a5,a5,a4
    8000772c:	40200713          	li	a4,1026
    80007730:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80007734:	00813083          	ld	ra,8(sp)
    80007738:	00013403          	ld	s0,0(sp)
    8000773c:	00d5151b          	slliw	a0,a0,0xd
    80007740:	0c2017b7          	lui	a5,0xc201
    80007744:	00a78533          	add	a0,a5,a0
    80007748:	00052023          	sw	zero,0(a0)
    8000774c:	01010113          	addi	sp,sp,16
    80007750:	00008067          	ret

0000000080007754 <plic_claim>:
    80007754:	ff010113          	addi	sp,sp,-16
    80007758:	00813023          	sd	s0,0(sp)
    8000775c:	00113423          	sd	ra,8(sp)
    80007760:	01010413          	addi	s0,sp,16
    80007764:	00000097          	auipc	ra,0x0
    80007768:	9fc080e7          	jalr	-1540(ra) # 80007160 <cpuid>
    8000776c:	00813083          	ld	ra,8(sp)
    80007770:	00013403          	ld	s0,0(sp)
    80007774:	00d5151b          	slliw	a0,a0,0xd
    80007778:	0c2017b7          	lui	a5,0xc201
    8000777c:	00a78533          	add	a0,a5,a0
    80007780:	00452503          	lw	a0,4(a0)
    80007784:	01010113          	addi	sp,sp,16
    80007788:	00008067          	ret

000000008000778c <plic_complete>:
    8000778c:	fe010113          	addi	sp,sp,-32
    80007790:	00813823          	sd	s0,16(sp)
    80007794:	00913423          	sd	s1,8(sp)
    80007798:	00113c23          	sd	ra,24(sp)
    8000779c:	02010413          	addi	s0,sp,32
    800077a0:	00050493          	mv	s1,a0
    800077a4:	00000097          	auipc	ra,0x0
    800077a8:	9bc080e7          	jalr	-1604(ra) # 80007160 <cpuid>
    800077ac:	01813083          	ld	ra,24(sp)
    800077b0:	01013403          	ld	s0,16(sp)
    800077b4:	00d5179b          	slliw	a5,a0,0xd
    800077b8:	0c201737          	lui	a4,0xc201
    800077bc:	00f707b3          	add	a5,a4,a5
    800077c0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800077c4:	00813483          	ld	s1,8(sp)
    800077c8:	02010113          	addi	sp,sp,32
    800077cc:	00008067          	ret

00000000800077d0 <consolewrite>:
    800077d0:	fb010113          	addi	sp,sp,-80
    800077d4:	04813023          	sd	s0,64(sp)
    800077d8:	04113423          	sd	ra,72(sp)
    800077dc:	02913c23          	sd	s1,56(sp)
    800077e0:	03213823          	sd	s2,48(sp)
    800077e4:	03313423          	sd	s3,40(sp)
    800077e8:	03413023          	sd	s4,32(sp)
    800077ec:	01513c23          	sd	s5,24(sp)
    800077f0:	05010413          	addi	s0,sp,80
    800077f4:	06c05c63          	blez	a2,8000786c <consolewrite+0x9c>
    800077f8:	00060993          	mv	s3,a2
    800077fc:	00050a13          	mv	s4,a0
    80007800:	00058493          	mv	s1,a1
    80007804:	00000913          	li	s2,0
    80007808:	fff00a93          	li	s5,-1
    8000780c:	01c0006f          	j	80007828 <consolewrite+0x58>
    80007810:	fbf44503          	lbu	a0,-65(s0)
    80007814:	0019091b          	addiw	s2,s2,1
    80007818:	00148493          	addi	s1,s1,1
    8000781c:	00001097          	auipc	ra,0x1
    80007820:	a9c080e7          	jalr	-1380(ra) # 800082b8 <uartputc>
    80007824:	03298063          	beq	s3,s2,80007844 <consolewrite+0x74>
    80007828:	00048613          	mv	a2,s1
    8000782c:	00100693          	li	a3,1
    80007830:	000a0593          	mv	a1,s4
    80007834:	fbf40513          	addi	a0,s0,-65
    80007838:	00000097          	auipc	ra,0x0
    8000783c:	9e0080e7          	jalr	-1568(ra) # 80007218 <either_copyin>
    80007840:	fd5518e3          	bne	a0,s5,80007810 <consolewrite+0x40>
    80007844:	04813083          	ld	ra,72(sp)
    80007848:	04013403          	ld	s0,64(sp)
    8000784c:	03813483          	ld	s1,56(sp)
    80007850:	02813983          	ld	s3,40(sp)
    80007854:	02013a03          	ld	s4,32(sp)
    80007858:	01813a83          	ld	s5,24(sp)
    8000785c:	00090513          	mv	a0,s2
    80007860:	03013903          	ld	s2,48(sp)
    80007864:	05010113          	addi	sp,sp,80
    80007868:	00008067          	ret
    8000786c:	00000913          	li	s2,0
    80007870:	fd5ff06f          	j	80007844 <consolewrite+0x74>

0000000080007874 <consoleread>:
    80007874:	f9010113          	addi	sp,sp,-112
    80007878:	06813023          	sd	s0,96(sp)
    8000787c:	04913c23          	sd	s1,88(sp)
    80007880:	05213823          	sd	s2,80(sp)
    80007884:	05313423          	sd	s3,72(sp)
    80007888:	05413023          	sd	s4,64(sp)
    8000788c:	03513c23          	sd	s5,56(sp)
    80007890:	03613823          	sd	s6,48(sp)
    80007894:	03713423          	sd	s7,40(sp)
    80007898:	03813023          	sd	s8,32(sp)
    8000789c:	06113423          	sd	ra,104(sp)
    800078a0:	01913c23          	sd	s9,24(sp)
    800078a4:	07010413          	addi	s0,sp,112
    800078a8:	00060b93          	mv	s7,a2
    800078ac:	00050913          	mv	s2,a0
    800078b0:	00058c13          	mv	s8,a1
    800078b4:	00060b1b          	sext.w	s6,a2
    800078b8:	00005497          	auipc	s1,0x5
    800078bc:	48048493          	addi	s1,s1,1152 # 8000cd38 <cons>
    800078c0:	00400993          	li	s3,4
    800078c4:	fff00a13          	li	s4,-1
    800078c8:	00a00a93          	li	s5,10
    800078cc:	05705e63          	blez	s7,80007928 <consoleread+0xb4>
    800078d0:	09c4a703          	lw	a4,156(s1)
    800078d4:	0984a783          	lw	a5,152(s1)
    800078d8:	0007071b          	sext.w	a4,a4
    800078dc:	08e78463          	beq	a5,a4,80007964 <consoleread+0xf0>
    800078e0:	07f7f713          	andi	a4,a5,127
    800078e4:	00e48733          	add	a4,s1,a4
    800078e8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800078ec:	0017869b          	addiw	a3,a5,1
    800078f0:	08d4ac23          	sw	a3,152(s1)
    800078f4:	00070c9b          	sext.w	s9,a4
    800078f8:	0b370663          	beq	a4,s3,800079a4 <consoleread+0x130>
    800078fc:	00100693          	li	a3,1
    80007900:	f9f40613          	addi	a2,s0,-97
    80007904:	000c0593          	mv	a1,s8
    80007908:	00090513          	mv	a0,s2
    8000790c:	f8e40fa3          	sb	a4,-97(s0)
    80007910:	00000097          	auipc	ra,0x0
    80007914:	8bc080e7          	jalr	-1860(ra) # 800071cc <either_copyout>
    80007918:	01450863          	beq	a0,s4,80007928 <consoleread+0xb4>
    8000791c:	001c0c13          	addi	s8,s8,1
    80007920:	fffb8b9b          	addiw	s7,s7,-1
    80007924:	fb5c94e3          	bne	s9,s5,800078cc <consoleread+0x58>
    80007928:	000b851b          	sext.w	a0,s7
    8000792c:	06813083          	ld	ra,104(sp)
    80007930:	06013403          	ld	s0,96(sp)
    80007934:	05813483          	ld	s1,88(sp)
    80007938:	05013903          	ld	s2,80(sp)
    8000793c:	04813983          	ld	s3,72(sp)
    80007940:	04013a03          	ld	s4,64(sp)
    80007944:	03813a83          	ld	s5,56(sp)
    80007948:	02813b83          	ld	s7,40(sp)
    8000794c:	02013c03          	ld	s8,32(sp)
    80007950:	01813c83          	ld	s9,24(sp)
    80007954:	40ab053b          	subw	a0,s6,a0
    80007958:	03013b03          	ld	s6,48(sp)
    8000795c:	07010113          	addi	sp,sp,112
    80007960:	00008067          	ret
    80007964:	00001097          	auipc	ra,0x1
    80007968:	1d8080e7          	jalr	472(ra) # 80008b3c <push_on>
    8000796c:	0984a703          	lw	a4,152(s1)
    80007970:	09c4a783          	lw	a5,156(s1)
    80007974:	0007879b          	sext.w	a5,a5
    80007978:	fef70ce3          	beq	a4,a5,80007970 <consoleread+0xfc>
    8000797c:	00001097          	auipc	ra,0x1
    80007980:	234080e7          	jalr	564(ra) # 80008bb0 <pop_on>
    80007984:	0984a783          	lw	a5,152(s1)
    80007988:	07f7f713          	andi	a4,a5,127
    8000798c:	00e48733          	add	a4,s1,a4
    80007990:	01874703          	lbu	a4,24(a4)
    80007994:	0017869b          	addiw	a3,a5,1
    80007998:	08d4ac23          	sw	a3,152(s1)
    8000799c:	00070c9b          	sext.w	s9,a4
    800079a0:	f5371ee3          	bne	a4,s3,800078fc <consoleread+0x88>
    800079a4:	000b851b          	sext.w	a0,s7
    800079a8:	f96bf2e3          	bgeu	s7,s6,8000792c <consoleread+0xb8>
    800079ac:	08f4ac23          	sw	a5,152(s1)
    800079b0:	f7dff06f          	j	8000792c <consoleread+0xb8>

00000000800079b4 <consputc>:
    800079b4:	10000793          	li	a5,256
    800079b8:	00f50663          	beq	a0,a5,800079c4 <consputc+0x10>
    800079bc:	00001317          	auipc	t1,0x1
    800079c0:	9f430067          	jr	-1548(t1) # 800083b0 <uartputc_sync>
    800079c4:	ff010113          	addi	sp,sp,-16
    800079c8:	00113423          	sd	ra,8(sp)
    800079cc:	00813023          	sd	s0,0(sp)
    800079d0:	01010413          	addi	s0,sp,16
    800079d4:	00800513          	li	a0,8
    800079d8:	00001097          	auipc	ra,0x1
    800079dc:	9d8080e7          	jalr	-1576(ra) # 800083b0 <uartputc_sync>
    800079e0:	02000513          	li	a0,32
    800079e4:	00001097          	auipc	ra,0x1
    800079e8:	9cc080e7          	jalr	-1588(ra) # 800083b0 <uartputc_sync>
    800079ec:	00013403          	ld	s0,0(sp)
    800079f0:	00813083          	ld	ra,8(sp)
    800079f4:	00800513          	li	a0,8
    800079f8:	01010113          	addi	sp,sp,16
    800079fc:	00001317          	auipc	t1,0x1
    80007a00:	9b430067          	jr	-1612(t1) # 800083b0 <uartputc_sync>

0000000080007a04 <consoleintr>:
    80007a04:	fe010113          	addi	sp,sp,-32
    80007a08:	00813823          	sd	s0,16(sp)
    80007a0c:	00913423          	sd	s1,8(sp)
    80007a10:	01213023          	sd	s2,0(sp)
    80007a14:	00113c23          	sd	ra,24(sp)
    80007a18:	02010413          	addi	s0,sp,32
    80007a1c:	00005917          	auipc	s2,0x5
    80007a20:	31c90913          	addi	s2,s2,796 # 8000cd38 <cons>
    80007a24:	00050493          	mv	s1,a0
    80007a28:	00090513          	mv	a0,s2
    80007a2c:	00001097          	auipc	ra,0x1
    80007a30:	e40080e7          	jalr	-448(ra) # 8000886c <acquire>
    80007a34:	02048c63          	beqz	s1,80007a6c <consoleintr+0x68>
    80007a38:	0a092783          	lw	a5,160(s2)
    80007a3c:	09892703          	lw	a4,152(s2)
    80007a40:	07f00693          	li	a3,127
    80007a44:	40e7873b          	subw	a4,a5,a4
    80007a48:	02e6e263          	bltu	a3,a4,80007a6c <consoleintr+0x68>
    80007a4c:	00d00713          	li	a4,13
    80007a50:	04e48063          	beq	s1,a4,80007a90 <consoleintr+0x8c>
    80007a54:	07f7f713          	andi	a4,a5,127
    80007a58:	00e90733          	add	a4,s2,a4
    80007a5c:	0017879b          	addiw	a5,a5,1
    80007a60:	0af92023          	sw	a5,160(s2)
    80007a64:	00970c23          	sb	s1,24(a4)
    80007a68:	08f92e23          	sw	a5,156(s2)
    80007a6c:	01013403          	ld	s0,16(sp)
    80007a70:	01813083          	ld	ra,24(sp)
    80007a74:	00813483          	ld	s1,8(sp)
    80007a78:	00013903          	ld	s2,0(sp)
    80007a7c:	00005517          	auipc	a0,0x5
    80007a80:	2bc50513          	addi	a0,a0,700 # 8000cd38 <cons>
    80007a84:	02010113          	addi	sp,sp,32
    80007a88:	00001317          	auipc	t1,0x1
    80007a8c:	eb030067          	jr	-336(t1) # 80008938 <release>
    80007a90:	00a00493          	li	s1,10
    80007a94:	fc1ff06f          	j	80007a54 <consoleintr+0x50>

0000000080007a98 <consoleinit>:
    80007a98:	fe010113          	addi	sp,sp,-32
    80007a9c:	00113c23          	sd	ra,24(sp)
    80007aa0:	00813823          	sd	s0,16(sp)
    80007aa4:	00913423          	sd	s1,8(sp)
    80007aa8:	02010413          	addi	s0,sp,32
    80007aac:	00005497          	auipc	s1,0x5
    80007ab0:	28c48493          	addi	s1,s1,652 # 8000cd38 <cons>
    80007ab4:	00048513          	mv	a0,s1
    80007ab8:	00002597          	auipc	a1,0x2
    80007abc:	d3858593          	addi	a1,a1,-712 # 800097f0 <_ZZ9kPrintIntmE6digits+0x780>
    80007ac0:	00001097          	auipc	ra,0x1
    80007ac4:	d88080e7          	jalr	-632(ra) # 80008848 <initlock>
    80007ac8:	00000097          	auipc	ra,0x0
    80007acc:	7ac080e7          	jalr	1964(ra) # 80008274 <uartinit>
    80007ad0:	01813083          	ld	ra,24(sp)
    80007ad4:	01013403          	ld	s0,16(sp)
    80007ad8:	00000797          	auipc	a5,0x0
    80007adc:	d9c78793          	addi	a5,a5,-612 # 80007874 <consoleread>
    80007ae0:	0af4bc23          	sd	a5,184(s1)
    80007ae4:	00000797          	auipc	a5,0x0
    80007ae8:	cec78793          	addi	a5,a5,-788 # 800077d0 <consolewrite>
    80007aec:	0cf4b023          	sd	a5,192(s1)
    80007af0:	00813483          	ld	s1,8(sp)
    80007af4:	02010113          	addi	sp,sp,32
    80007af8:	00008067          	ret

0000000080007afc <console_read>:
    80007afc:	ff010113          	addi	sp,sp,-16
    80007b00:	00813423          	sd	s0,8(sp)
    80007b04:	01010413          	addi	s0,sp,16
    80007b08:	00813403          	ld	s0,8(sp)
    80007b0c:	00005317          	auipc	t1,0x5
    80007b10:	2e433303          	ld	t1,740(t1) # 8000cdf0 <devsw+0x10>
    80007b14:	01010113          	addi	sp,sp,16
    80007b18:	00030067          	jr	t1

0000000080007b1c <console_write>:
    80007b1c:	ff010113          	addi	sp,sp,-16
    80007b20:	00813423          	sd	s0,8(sp)
    80007b24:	01010413          	addi	s0,sp,16
    80007b28:	00813403          	ld	s0,8(sp)
    80007b2c:	00005317          	auipc	t1,0x5
    80007b30:	2cc33303          	ld	t1,716(t1) # 8000cdf8 <devsw+0x18>
    80007b34:	01010113          	addi	sp,sp,16
    80007b38:	00030067          	jr	t1

0000000080007b3c <panic>:
    80007b3c:	fe010113          	addi	sp,sp,-32
    80007b40:	00113c23          	sd	ra,24(sp)
    80007b44:	00813823          	sd	s0,16(sp)
    80007b48:	00913423          	sd	s1,8(sp)
    80007b4c:	02010413          	addi	s0,sp,32
    80007b50:	00050493          	mv	s1,a0
    80007b54:	00002517          	auipc	a0,0x2
    80007b58:	ca450513          	addi	a0,a0,-860 # 800097f8 <_ZZ9kPrintIntmE6digits+0x788>
    80007b5c:	00005797          	auipc	a5,0x5
    80007b60:	3207ae23          	sw	zero,828(a5) # 8000ce98 <pr+0x18>
    80007b64:	00000097          	auipc	ra,0x0
    80007b68:	034080e7          	jalr	52(ra) # 80007b98 <__printf>
    80007b6c:	00048513          	mv	a0,s1
    80007b70:	00000097          	auipc	ra,0x0
    80007b74:	028080e7          	jalr	40(ra) # 80007b98 <__printf>
    80007b78:	00002517          	auipc	a0,0x2
    80007b7c:	a0850513          	addi	a0,a0,-1528 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80007b80:	00000097          	auipc	ra,0x0
    80007b84:	018080e7          	jalr	24(ra) # 80007b98 <__printf>
    80007b88:	00100793          	li	a5,1
    80007b8c:	00004717          	auipc	a4,0x4
    80007b90:	f4f72e23          	sw	a5,-164(a4) # 8000bae8 <panicked>
    80007b94:	0000006f          	j	80007b94 <panic+0x58>

0000000080007b98 <__printf>:
    80007b98:	f3010113          	addi	sp,sp,-208
    80007b9c:	08813023          	sd	s0,128(sp)
    80007ba0:	07313423          	sd	s3,104(sp)
    80007ba4:	09010413          	addi	s0,sp,144
    80007ba8:	05813023          	sd	s8,64(sp)
    80007bac:	08113423          	sd	ra,136(sp)
    80007bb0:	06913c23          	sd	s1,120(sp)
    80007bb4:	07213823          	sd	s2,112(sp)
    80007bb8:	07413023          	sd	s4,96(sp)
    80007bbc:	05513c23          	sd	s5,88(sp)
    80007bc0:	05613823          	sd	s6,80(sp)
    80007bc4:	05713423          	sd	s7,72(sp)
    80007bc8:	03913c23          	sd	s9,56(sp)
    80007bcc:	03a13823          	sd	s10,48(sp)
    80007bd0:	03b13423          	sd	s11,40(sp)
    80007bd4:	00005317          	auipc	t1,0x5
    80007bd8:	2ac30313          	addi	t1,t1,684 # 8000ce80 <pr>
    80007bdc:	01832c03          	lw	s8,24(t1)
    80007be0:	00b43423          	sd	a1,8(s0)
    80007be4:	00c43823          	sd	a2,16(s0)
    80007be8:	00d43c23          	sd	a3,24(s0)
    80007bec:	02e43023          	sd	a4,32(s0)
    80007bf0:	02f43423          	sd	a5,40(s0)
    80007bf4:	03043823          	sd	a6,48(s0)
    80007bf8:	03143c23          	sd	a7,56(s0)
    80007bfc:	00050993          	mv	s3,a0
    80007c00:	4a0c1663          	bnez	s8,800080ac <__printf+0x514>
    80007c04:	60098c63          	beqz	s3,8000821c <__printf+0x684>
    80007c08:	0009c503          	lbu	a0,0(s3)
    80007c0c:	00840793          	addi	a5,s0,8
    80007c10:	f6f43c23          	sd	a5,-136(s0)
    80007c14:	00000493          	li	s1,0
    80007c18:	22050063          	beqz	a0,80007e38 <__printf+0x2a0>
    80007c1c:	00002a37          	lui	s4,0x2
    80007c20:	00018ab7          	lui	s5,0x18
    80007c24:	000f4b37          	lui	s6,0xf4
    80007c28:	00989bb7          	lui	s7,0x989
    80007c2c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80007c30:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80007c34:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80007c38:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80007c3c:	00148c9b          	addiw	s9,s1,1
    80007c40:	02500793          	li	a5,37
    80007c44:	01998933          	add	s2,s3,s9
    80007c48:	38f51263          	bne	a0,a5,80007fcc <__printf+0x434>
    80007c4c:	00094783          	lbu	a5,0(s2)
    80007c50:	00078c9b          	sext.w	s9,a5
    80007c54:	1e078263          	beqz	a5,80007e38 <__printf+0x2a0>
    80007c58:	0024849b          	addiw	s1,s1,2
    80007c5c:	07000713          	li	a4,112
    80007c60:	00998933          	add	s2,s3,s1
    80007c64:	38e78a63          	beq	a5,a4,80007ff8 <__printf+0x460>
    80007c68:	20f76863          	bltu	a4,a5,80007e78 <__printf+0x2e0>
    80007c6c:	42a78863          	beq	a5,a0,8000809c <__printf+0x504>
    80007c70:	06400713          	li	a4,100
    80007c74:	40e79663          	bne	a5,a4,80008080 <__printf+0x4e8>
    80007c78:	f7843783          	ld	a5,-136(s0)
    80007c7c:	0007a603          	lw	a2,0(a5)
    80007c80:	00878793          	addi	a5,a5,8
    80007c84:	f6f43c23          	sd	a5,-136(s0)
    80007c88:	42064a63          	bltz	a2,800080bc <__printf+0x524>
    80007c8c:	00a00713          	li	a4,10
    80007c90:	02e677bb          	remuw	a5,a2,a4
    80007c94:	00002d97          	auipc	s11,0x2
    80007c98:	b8cd8d93          	addi	s11,s11,-1140 # 80009820 <digits>
    80007c9c:	00900593          	li	a1,9
    80007ca0:	0006051b          	sext.w	a0,a2
    80007ca4:	00000c93          	li	s9,0
    80007ca8:	02079793          	slli	a5,a5,0x20
    80007cac:	0207d793          	srli	a5,a5,0x20
    80007cb0:	00fd87b3          	add	a5,s11,a5
    80007cb4:	0007c783          	lbu	a5,0(a5)
    80007cb8:	02e656bb          	divuw	a3,a2,a4
    80007cbc:	f8f40023          	sb	a5,-128(s0)
    80007cc0:	14c5d863          	bge	a1,a2,80007e10 <__printf+0x278>
    80007cc4:	06300593          	li	a1,99
    80007cc8:	00100c93          	li	s9,1
    80007ccc:	02e6f7bb          	remuw	a5,a3,a4
    80007cd0:	02079793          	slli	a5,a5,0x20
    80007cd4:	0207d793          	srli	a5,a5,0x20
    80007cd8:	00fd87b3          	add	a5,s11,a5
    80007cdc:	0007c783          	lbu	a5,0(a5)
    80007ce0:	02e6d73b          	divuw	a4,a3,a4
    80007ce4:	f8f400a3          	sb	a5,-127(s0)
    80007ce8:	12a5f463          	bgeu	a1,a0,80007e10 <__printf+0x278>
    80007cec:	00a00693          	li	a3,10
    80007cf0:	00900593          	li	a1,9
    80007cf4:	02d777bb          	remuw	a5,a4,a3
    80007cf8:	02079793          	slli	a5,a5,0x20
    80007cfc:	0207d793          	srli	a5,a5,0x20
    80007d00:	00fd87b3          	add	a5,s11,a5
    80007d04:	0007c503          	lbu	a0,0(a5)
    80007d08:	02d757bb          	divuw	a5,a4,a3
    80007d0c:	f8a40123          	sb	a0,-126(s0)
    80007d10:	48e5f263          	bgeu	a1,a4,80008194 <__printf+0x5fc>
    80007d14:	06300513          	li	a0,99
    80007d18:	02d7f5bb          	remuw	a1,a5,a3
    80007d1c:	02059593          	slli	a1,a1,0x20
    80007d20:	0205d593          	srli	a1,a1,0x20
    80007d24:	00bd85b3          	add	a1,s11,a1
    80007d28:	0005c583          	lbu	a1,0(a1)
    80007d2c:	02d7d7bb          	divuw	a5,a5,a3
    80007d30:	f8b401a3          	sb	a1,-125(s0)
    80007d34:	48e57263          	bgeu	a0,a4,800081b8 <__printf+0x620>
    80007d38:	3e700513          	li	a0,999
    80007d3c:	02d7f5bb          	remuw	a1,a5,a3
    80007d40:	02059593          	slli	a1,a1,0x20
    80007d44:	0205d593          	srli	a1,a1,0x20
    80007d48:	00bd85b3          	add	a1,s11,a1
    80007d4c:	0005c583          	lbu	a1,0(a1)
    80007d50:	02d7d7bb          	divuw	a5,a5,a3
    80007d54:	f8b40223          	sb	a1,-124(s0)
    80007d58:	46e57663          	bgeu	a0,a4,800081c4 <__printf+0x62c>
    80007d5c:	02d7f5bb          	remuw	a1,a5,a3
    80007d60:	02059593          	slli	a1,a1,0x20
    80007d64:	0205d593          	srli	a1,a1,0x20
    80007d68:	00bd85b3          	add	a1,s11,a1
    80007d6c:	0005c583          	lbu	a1,0(a1)
    80007d70:	02d7d7bb          	divuw	a5,a5,a3
    80007d74:	f8b402a3          	sb	a1,-123(s0)
    80007d78:	46ea7863          	bgeu	s4,a4,800081e8 <__printf+0x650>
    80007d7c:	02d7f5bb          	remuw	a1,a5,a3
    80007d80:	02059593          	slli	a1,a1,0x20
    80007d84:	0205d593          	srli	a1,a1,0x20
    80007d88:	00bd85b3          	add	a1,s11,a1
    80007d8c:	0005c583          	lbu	a1,0(a1)
    80007d90:	02d7d7bb          	divuw	a5,a5,a3
    80007d94:	f8b40323          	sb	a1,-122(s0)
    80007d98:	3eeaf863          	bgeu	s5,a4,80008188 <__printf+0x5f0>
    80007d9c:	02d7f5bb          	remuw	a1,a5,a3
    80007da0:	02059593          	slli	a1,a1,0x20
    80007da4:	0205d593          	srli	a1,a1,0x20
    80007da8:	00bd85b3          	add	a1,s11,a1
    80007dac:	0005c583          	lbu	a1,0(a1)
    80007db0:	02d7d7bb          	divuw	a5,a5,a3
    80007db4:	f8b403a3          	sb	a1,-121(s0)
    80007db8:	42eb7e63          	bgeu	s6,a4,800081f4 <__printf+0x65c>
    80007dbc:	02d7f5bb          	remuw	a1,a5,a3
    80007dc0:	02059593          	slli	a1,a1,0x20
    80007dc4:	0205d593          	srli	a1,a1,0x20
    80007dc8:	00bd85b3          	add	a1,s11,a1
    80007dcc:	0005c583          	lbu	a1,0(a1)
    80007dd0:	02d7d7bb          	divuw	a5,a5,a3
    80007dd4:	f8b40423          	sb	a1,-120(s0)
    80007dd8:	42ebfc63          	bgeu	s7,a4,80008210 <__printf+0x678>
    80007ddc:	02079793          	slli	a5,a5,0x20
    80007de0:	0207d793          	srli	a5,a5,0x20
    80007de4:	00fd8db3          	add	s11,s11,a5
    80007de8:	000dc703          	lbu	a4,0(s11)
    80007dec:	00a00793          	li	a5,10
    80007df0:	00900c93          	li	s9,9
    80007df4:	f8e404a3          	sb	a4,-119(s0)
    80007df8:	00065c63          	bgez	a2,80007e10 <__printf+0x278>
    80007dfc:	f9040713          	addi	a4,s0,-112
    80007e00:	00f70733          	add	a4,a4,a5
    80007e04:	02d00693          	li	a3,45
    80007e08:	fed70823          	sb	a3,-16(a4)
    80007e0c:	00078c93          	mv	s9,a5
    80007e10:	f8040793          	addi	a5,s0,-128
    80007e14:	01978cb3          	add	s9,a5,s9
    80007e18:	f7f40d13          	addi	s10,s0,-129
    80007e1c:	000cc503          	lbu	a0,0(s9)
    80007e20:	fffc8c93          	addi	s9,s9,-1
    80007e24:	00000097          	auipc	ra,0x0
    80007e28:	b90080e7          	jalr	-1136(ra) # 800079b4 <consputc>
    80007e2c:	ffac98e3          	bne	s9,s10,80007e1c <__printf+0x284>
    80007e30:	00094503          	lbu	a0,0(s2)
    80007e34:	e00514e3          	bnez	a0,80007c3c <__printf+0xa4>
    80007e38:	1a0c1663          	bnez	s8,80007fe4 <__printf+0x44c>
    80007e3c:	08813083          	ld	ra,136(sp)
    80007e40:	08013403          	ld	s0,128(sp)
    80007e44:	07813483          	ld	s1,120(sp)
    80007e48:	07013903          	ld	s2,112(sp)
    80007e4c:	06813983          	ld	s3,104(sp)
    80007e50:	06013a03          	ld	s4,96(sp)
    80007e54:	05813a83          	ld	s5,88(sp)
    80007e58:	05013b03          	ld	s6,80(sp)
    80007e5c:	04813b83          	ld	s7,72(sp)
    80007e60:	04013c03          	ld	s8,64(sp)
    80007e64:	03813c83          	ld	s9,56(sp)
    80007e68:	03013d03          	ld	s10,48(sp)
    80007e6c:	02813d83          	ld	s11,40(sp)
    80007e70:	0d010113          	addi	sp,sp,208
    80007e74:	00008067          	ret
    80007e78:	07300713          	li	a4,115
    80007e7c:	1ce78a63          	beq	a5,a4,80008050 <__printf+0x4b8>
    80007e80:	07800713          	li	a4,120
    80007e84:	1ee79e63          	bne	a5,a4,80008080 <__printf+0x4e8>
    80007e88:	f7843783          	ld	a5,-136(s0)
    80007e8c:	0007a703          	lw	a4,0(a5)
    80007e90:	00878793          	addi	a5,a5,8
    80007e94:	f6f43c23          	sd	a5,-136(s0)
    80007e98:	28074263          	bltz	a4,8000811c <__printf+0x584>
    80007e9c:	00002d97          	auipc	s11,0x2
    80007ea0:	984d8d93          	addi	s11,s11,-1660 # 80009820 <digits>
    80007ea4:	00f77793          	andi	a5,a4,15
    80007ea8:	00fd87b3          	add	a5,s11,a5
    80007eac:	0007c683          	lbu	a3,0(a5)
    80007eb0:	00f00613          	li	a2,15
    80007eb4:	0007079b          	sext.w	a5,a4
    80007eb8:	f8d40023          	sb	a3,-128(s0)
    80007ebc:	0047559b          	srliw	a1,a4,0x4
    80007ec0:	0047569b          	srliw	a3,a4,0x4
    80007ec4:	00000c93          	li	s9,0
    80007ec8:	0ee65063          	bge	a2,a4,80007fa8 <__printf+0x410>
    80007ecc:	00f6f693          	andi	a3,a3,15
    80007ed0:	00dd86b3          	add	a3,s11,a3
    80007ed4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80007ed8:	0087d79b          	srliw	a5,a5,0x8
    80007edc:	00100c93          	li	s9,1
    80007ee0:	f8d400a3          	sb	a3,-127(s0)
    80007ee4:	0cb67263          	bgeu	a2,a1,80007fa8 <__printf+0x410>
    80007ee8:	00f7f693          	andi	a3,a5,15
    80007eec:	00dd86b3          	add	a3,s11,a3
    80007ef0:	0006c583          	lbu	a1,0(a3)
    80007ef4:	00f00613          	li	a2,15
    80007ef8:	0047d69b          	srliw	a3,a5,0x4
    80007efc:	f8b40123          	sb	a1,-126(s0)
    80007f00:	0047d593          	srli	a1,a5,0x4
    80007f04:	28f67e63          	bgeu	a2,a5,800081a0 <__printf+0x608>
    80007f08:	00f6f693          	andi	a3,a3,15
    80007f0c:	00dd86b3          	add	a3,s11,a3
    80007f10:	0006c503          	lbu	a0,0(a3)
    80007f14:	0087d813          	srli	a6,a5,0x8
    80007f18:	0087d69b          	srliw	a3,a5,0x8
    80007f1c:	f8a401a3          	sb	a0,-125(s0)
    80007f20:	28b67663          	bgeu	a2,a1,800081ac <__printf+0x614>
    80007f24:	00f6f693          	andi	a3,a3,15
    80007f28:	00dd86b3          	add	a3,s11,a3
    80007f2c:	0006c583          	lbu	a1,0(a3)
    80007f30:	00c7d513          	srli	a0,a5,0xc
    80007f34:	00c7d69b          	srliw	a3,a5,0xc
    80007f38:	f8b40223          	sb	a1,-124(s0)
    80007f3c:	29067a63          	bgeu	a2,a6,800081d0 <__printf+0x638>
    80007f40:	00f6f693          	andi	a3,a3,15
    80007f44:	00dd86b3          	add	a3,s11,a3
    80007f48:	0006c583          	lbu	a1,0(a3)
    80007f4c:	0107d813          	srli	a6,a5,0x10
    80007f50:	0107d69b          	srliw	a3,a5,0x10
    80007f54:	f8b402a3          	sb	a1,-123(s0)
    80007f58:	28a67263          	bgeu	a2,a0,800081dc <__printf+0x644>
    80007f5c:	00f6f693          	andi	a3,a3,15
    80007f60:	00dd86b3          	add	a3,s11,a3
    80007f64:	0006c683          	lbu	a3,0(a3)
    80007f68:	0147d79b          	srliw	a5,a5,0x14
    80007f6c:	f8d40323          	sb	a3,-122(s0)
    80007f70:	21067663          	bgeu	a2,a6,8000817c <__printf+0x5e4>
    80007f74:	02079793          	slli	a5,a5,0x20
    80007f78:	0207d793          	srli	a5,a5,0x20
    80007f7c:	00fd8db3          	add	s11,s11,a5
    80007f80:	000dc683          	lbu	a3,0(s11)
    80007f84:	00800793          	li	a5,8
    80007f88:	00700c93          	li	s9,7
    80007f8c:	f8d403a3          	sb	a3,-121(s0)
    80007f90:	00075c63          	bgez	a4,80007fa8 <__printf+0x410>
    80007f94:	f9040713          	addi	a4,s0,-112
    80007f98:	00f70733          	add	a4,a4,a5
    80007f9c:	02d00693          	li	a3,45
    80007fa0:	fed70823          	sb	a3,-16(a4)
    80007fa4:	00078c93          	mv	s9,a5
    80007fa8:	f8040793          	addi	a5,s0,-128
    80007fac:	01978cb3          	add	s9,a5,s9
    80007fb0:	f7f40d13          	addi	s10,s0,-129
    80007fb4:	000cc503          	lbu	a0,0(s9)
    80007fb8:	fffc8c93          	addi	s9,s9,-1
    80007fbc:	00000097          	auipc	ra,0x0
    80007fc0:	9f8080e7          	jalr	-1544(ra) # 800079b4 <consputc>
    80007fc4:	ff9d18e3          	bne	s10,s9,80007fb4 <__printf+0x41c>
    80007fc8:	0100006f          	j	80007fd8 <__printf+0x440>
    80007fcc:	00000097          	auipc	ra,0x0
    80007fd0:	9e8080e7          	jalr	-1560(ra) # 800079b4 <consputc>
    80007fd4:	000c8493          	mv	s1,s9
    80007fd8:	00094503          	lbu	a0,0(s2)
    80007fdc:	c60510e3          	bnez	a0,80007c3c <__printf+0xa4>
    80007fe0:	e40c0ee3          	beqz	s8,80007e3c <__printf+0x2a4>
    80007fe4:	00005517          	auipc	a0,0x5
    80007fe8:	e9c50513          	addi	a0,a0,-356 # 8000ce80 <pr>
    80007fec:	00001097          	auipc	ra,0x1
    80007ff0:	94c080e7          	jalr	-1716(ra) # 80008938 <release>
    80007ff4:	e49ff06f          	j	80007e3c <__printf+0x2a4>
    80007ff8:	f7843783          	ld	a5,-136(s0)
    80007ffc:	03000513          	li	a0,48
    80008000:	01000d13          	li	s10,16
    80008004:	00878713          	addi	a4,a5,8
    80008008:	0007bc83          	ld	s9,0(a5)
    8000800c:	f6e43c23          	sd	a4,-136(s0)
    80008010:	00000097          	auipc	ra,0x0
    80008014:	9a4080e7          	jalr	-1628(ra) # 800079b4 <consputc>
    80008018:	07800513          	li	a0,120
    8000801c:	00000097          	auipc	ra,0x0
    80008020:	998080e7          	jalr	-1640(ra) # 800079b4 <consputc>
    80008024:	00001d97          	auipc	s11,0x1
    80008028:	7fcd8d93          	addi	s11,s11,2044 # 80009820 <digits>
    8000802c:	03ccd793          	srli	a5,s9,0x3c
    80008030:	00fd87b3          	add	a5,s11,a5
    80008034:	0007c503          	lbu	a0,0(a5)
    80008038:	fffd0d1b          	addiw	s10,s10,-1
    8000803c:	004c9c93          	slli	s9,s9,0x4
    80008040:	00000097          	auipc	ra,0x0
    80008044:	974080e7          	jalr	-1676(ra) # 800079b4 <consputc>
    80008048:	fe0d12e3          	bnez	s10,8000802c <__printf+0x494>
    8000804c:	f8dff06f          	j	80007fd8 <__printf+0x440>
    80008050:	f7843783          	ld	a5,-136(s0)
    80008054:	0007bc83          	ld	s9,0(a5)
    80008058:	00878793          	addi	a5,a5,8
    8000805c:	f6f43c23          	sd	a5,-136(s0)
    80008060:	000c9a63          	bnez	s9,80008074 <__printf+0x4dc>
    80008064:	1080006f          	j	8000816c <__printf+0x5d4>
    80008068:	001c8c93          	addi	s9,s9,1
    8000806c:	00000097          	auipc	ra,0x0
    80008070:	948080e7          	jalr	-1720(ra) # 800079b4 <consputc>
    80008074:	000cc503          	lbu	a0,0(s9)
    80008078:	fe0518e3          	bnez	a0,80008068 <__printf+0x4d0>
    8000807c:	f5dff06f          	j	80007fd8 <__printf+0x440>
    80008080:	02500513          	li	a0,37
    80008084:	00000097          	auipc	ra,0x0
    80008088:	930080e7          	jalr	-1744(ra) # 800079b4 <consputc>
    8000808c:	000c8513          	mv	a0,s9
    80008090:	00000097          	auipc	ra,0x0
    80008094:	924080e7          	jalr	-1756(ra) # 800079b4 <consputc>
    80008098:	f41ff06f          	j	80007fd8 <__printf+0x440>
    8000809c:	02500513          	li	a0,37
    800080a0:	00000097          	auipc	ra,0x0
    800080a4:	914080e7          	jalr	-1772(ra) # 800079b4 <consputc>
    800080a8:	f31ff06f          	j	80007fd8 <__printf+0x440>
    800080ac:	00030513          	mv	a0,t1
    800080b0:	00000097          	auipc	ra,0x0
    800080b4:	7bc080e7          	jalr	1980(ra) # 8000886c <acquire>
    800080b8:	b4dff06f          	j	80007c04 <__printf+0x6c>
    800080bc:	40c0053b          	negw	a0,a2
    800080c0:	00a00713          	li	a4,10
    800080c4:	02e576bb          	remuw	a3,a0,a4
    800080c8:	00001d97          	auipc	s11,0x1
    800080cc:	758d8d93          	addi	s11,s11,1880 # 80009820 <digits>
    800080d0:	ff700593          	li	a1,-9
    800080d4:	02069693          	slli	a3,a3,0x20
    800080d8:	0206d693          	srli	a3,a3,0x20
    800080dc:	00dd86b3          	add	a3,s11,a3
    800080e0:	0006c683          	lbu	a3,0(a3)
    800080e4:	02e557bb          	divuw	a5,a0,a4
    800080e8:	f8d40023          	sb	a3,-128(s0)
    800080ec:	10b65e63          	bge	a2,a1,80008208 <__printf+0x670>
    800080f0:	06300593          	li	a1,99
    800080f4:	02e7f6bb          	remuw	a3,a5,a4
    800080f8:	02069693          	slli	a3,a3,0x20
    800080fc:	0206d693          	srli	a3,a3,0x20
    80008100:	00dd86b3          	add	a3,s11,a3
    80008104:	0006c683          	lbu	a3,0(a3)
    80008108:	02e7d73b          	divuw	a4,a5,a4
    8000810c:	00200793          	li	a5,2
    80008110:	f8d400a3          	sb	a3,-127(s0)
    80008114:	bca5ece3          	bltu	a1,a0,80007cec <__printf+0x154>
    80008118:	ce5ff06f          	j	80007dfc <__printf+0x264>
    8000811c:	40e007bb          	negw	a5,a4
    80008120:	00001d97          	auipc	s11,0x1
    80008124:	700d8d93          	addi	s11,s11,1792 # 80009820 <digits>
    80008128:	00f7f693          	andi	a3,a5,15
    8000812c:	00dd86b3          	add	a3,s11,a3
    80008130:	0006c583          	lbu	a1,0(a3)
    80008134:	ff100613          	li	a2,-15
    80008138:	0047d69b          	srliw	a3,a5,0x4
    8000813c:	f8b40023          	sb	a1,-128(s0)
    80008140:	0047d59b          	srliw	a1,a5,0x4
    80008144:	0ac75e63          	bge	a4,a2,80008200 <__printf+0x668>
    80008148:	00f6f693          	andi	a3,a3,15
    8000814c:	00dd86b3          	add	a3,s11,a3
    80008150:	0006c603          	lbu	a2,0(a3)
    80008154:	00f00693          	li	a3,15
    80008158:	0087d79b          	srliw	a5,a5,0x8
    8000815c:	f8c400a3          	sb	a2,-127(s0)
    80008160:	d8b6e4e3          	bltu	a3,a1,80007ee8 <__printf+0x350>
    80008164:	00200793          	li	a5,2
    80008168:	e2dff06f          	j	80007f94 <__printf+0x3fc>
    8000816c:	00001c97          	auipc	s9,0x1
    80008170:	694c8c93          	addi	s9,s9,1684 # 80009800 <_ZZ9kPrintIntmE6digits+0x790>
    80008174:	02800513          	li	a0,40
    80008178:	ef1ff06f          	j	80008068 <__printf+0x4d0>
    8000817c:	00700793          	li	a5,7
    80008180:	00600c93          	li	s9,6
    80008184:	e0dff06f          	j	80007f90 <__printf+0x3f8>
    80008188:	00700793          	li	a5,7
    8000818c:	00600c93          	li	s9,6
    80008190:	c69ff06f          	j	80007df8 <__printf+0x260>
    80008194:	00300793          	li	a5,3
    80008198:	00200c93          	li	s9,2
    8000819c:	c5dff06f          	j	80007df8 <__printf+0x260>
    800081a0:	00300793          	li	a5,3
    800081a4:	00200c93          	li	s9,2
    800081a8:	de9ff06f          	j	80007f90 <__printf+0x3f8>
    800081ac:	00400793          	li	a5,4
    800081b0:	00300c93          	li	s9,3
    800081b4:	dddff06f          	j	80007f90 <__printf+0x3f8>
    800081b8:	00400793          	li	a5,4
    800081bc:	00300c93          	li	s9,3
    800081c0:	c39ff06f          	j	80007df8 <__printf+0x260>
    800081c4:	00500793          	li	a5,5
    800081c8:	00400c93          	li	s9,4
    800081cc:	c2dff06f          	j	80007df8 <__printf+0x260>
    800081d0:	00500793          	li	a5,5
    800081d4:	00400c93          	li	s9,4
    800081d8:	db9ff06f          	j	80007f90 <__printf+0x3f8>
    800081dc:	00600793          	li	a5,6
    800081e0:	00500c93          	li	s9,5
    800081e4:	dadff06f          	j	80007f90 <__printf+0x3f8>
    800081e8:	00600793          	li	a5,6
    800081ec:	00500c93          	li	s9,5
    800081f0:	c09ff06f          	j	80007df8 <__printf+0x260>
    800081f4:	00800793          	li	a5,8
    800081f8:	00700c93          	li	s9,7
    800081fc:	bfdff06f          	j	80007df8 <__printf+0x260>
    80008200:	00100793          	li	a5,1
    80008204:	d91ff06f          	j	80007f94 <__printf+0x3fc>
    80008208:	00100793          	li	a5,1
    8000820c:	bf1ff06f          	j	80007dfc <__printf+0x264>
    80008210:	00900793          	li	a5,9
    80008214:	00800c93          	li	s9,8
    80008218:	be1ff06f          	j	80007df8 <__printf+0x260>
    8000821c:	00001517          	auipc	a0,0x1
    80008220:	5ec50513          	addi	a0,a0,1516 # 80009808 <_ZZ9kPrintIntmE6digits+0x798>
    80008224:	00000097          	auipc	ra,0x0
    80008228:	918080e7          	jalr	-1768(ra) # 80007b3c <panic>

000000008000822c <printfinit>:
    8000822c:	fe010113          	addi	sp,sp,-32
    80008230:	00813823          	sd	s0,16(sp)
    80008234:	00913423          	sd	s1,8(sp)
    80008238:	00113c23          	sd	ra,24(sp)
    8000823c:	02010413          	addi	s0,sp,32
    80008240:	00005497          	auipc	s1,0x5
    80008244:	c4048493          	addi	s1,s1,-960 # 8000ce80 <pr>
    80008248:	00048513          	mv	a0,s1
    8000824c:	00001597          	auipc	a1,0x1
    80008250:	5cc58593          	addi	a1,a1,1484 # 80009818 <_ZZ9kPrintIntmE6digits+0x7a8>
    80008254:	00000097          	auipc	ra,0x0
    80008258:	5f4080e7          	jalr	1524(ra) # 80008848 <initlock>
    8000825c:	01813083          	ld	ra,24(sp)
    80008260:	01013403          	ld	s0,16(sp)
    80008264:	0004ac23          	sw	zero,24(s1)
    80008268:	00813483          	ld	s1,8(sp)
    8000826c:	02010113          	addi	sp,sp,32
    80008270:	00008067          	ret

0000000080008274 <uartinit>:
    80008274:	ff010113          	addi	sp,sp,-16
    80008278:	00813423          	sd	s0,8(sp)
    8000827c:	01010413          	addi	s0,sp,16
    80008280:	100007b7          	lui	a5,0x10000
    80008284:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80008288:	f8000713          	li	a4,-128
    8000828c:	00e781a3          	sb	a4,3(a5)
    80008290:	00300713          	li	a4,3
    80008294:	00e78023          	sb	a4,0(a5)
    80008298:	000780a3          	sb	zero,1(a5)
    8000829c:	00e781a3          	sb	a4,3(a5)
    800082a0:	00700693          	li	a3,7
    800082a4:	00d78123          	sb	a3,2(a5)
    800082a8:	00e780a3          	sb	a4,1(a5)
    800082ac:	00813403          	ld	s0,8(sp)
    800082b0:	01010113          	addi	sp,sp,16
    800082b4:	00008067          	ret

00000000800082b8 <uartputc>:
    800082b8:	00004797          	auipc	a5,0x4
    800082bc:	8307a783          	lw	a5,-2000(a5) # 8000bae8 <panicked>
    800082c0:	00078463          	beqz	a5,800082c8 <uartputc+0x10>
    800082c4:	0000006f          	j	800082c4 <uartputc+0xc>
    800082c8:	fd010113          	addi	sp,sp,-48
    800082cc:	02813023          	sd	s0,32(sp)
    800082d0:	00913c23          	sd	s1,24(sp)
    800082d4:	01213823          	sd	s2,16(sp)
    800082d8:	01313423          	sd	s3,8(sp)
    800082dc:	02113423          	sd	ra,40(sp)
    800082e0:	03010413          	addi	s0,sp,48
    800082e4:	00004917          	auipc	s2,0x4
    800082e8:	80c90913          	addi	s2,s2,-2036 # 8000baf0 <uart_tx_r>
    800082ec:	00093783          	ld	a5,0(s2)
    800082f0:	00004497          	auipc	s1,0x4
    800082f4:	80848493          	addi	s1,s1,-2040 # 8000baf8 <uart_tx_w>
    800082f8:	0004b703          	ld	a4,0(s1)
    800082fc:	02078693          	addi	a3,a5,32
    80008300:	00050993          	mv	s3,a0
    80008304:	02e69c63          	bne	a3,a4,8000833c <uartputc+0x84>
    80008308:	00001097          	auipc	ra,0x1
    8000830c:	834080e7          	jalr	-1996(ra) # 80008b3c <push_on>
    80008310:	00093783          	ld	a5,0(s2)
    80008314:	0004b703          	ld	a4,0(s1)
    80008318:	02078793          	addi	a5,a5,32
    8000831c:	00e79463          	bne	a5,a4,80008324 <uartputc+0x6c>
    80008320:	0000006f          	j	80008320 <uartputc+0x68>
    80008324:	00001097          	auipc	ra,0x1
    80008328:	88c080e7          	jalr	-1908(ra) # 80008bb0 <pop_on>
    8000832c:	00093783          	ld	a5,0(s2)
    80008330:	0004b703          	ld	a4,0(s1)
    80008334:	02078693          	addi	a3,a5,32
    80008338:	fce688e3          	beq	a3,a4,80008308 <uartputc+0x50>
    8000833c:	01f77693          	andi	a3,a4,31
    80008340:	00005597          	auipc	a1,0x5
    80008344:	b6058593          	addi	a1,a1,-1184 # 8000cea0 <uart_tx_buf>
    80008348:	00d586b3          	add	a3,a1,a3
    8000834c:	00170713          	addi	a4,a4,1
    80008350:	01368023          	sb	s3,0(a3)
    80008354:	00e4b023          	sd	a4,0(s1)
    80008358:	10000637          	lui	a2,0x10000
    8000835c:	02f71063          	bne	a4,a5,8000837c <uartputc+0xc4>
    80008360:	0340006f          	j	80008394 <uartputc+0xdc>
    80008364:	00074703          	lbu	a4,0(a4)
    80008368:	00f93023          	sd	a5,0(s2)
    8000836c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80008370:	00093783          	ld	a5,0(s2)
    80008374:	0004b703          	ld	a4,0(s1)
    80008378:	00f70e63          	beq	a4,a5,80008394 <uartputc+0xdc>
    8000837c:	00564683          	lbu	a3,5(a2)
    80008380:	01f7f713          	andi	a4,a5,31
    80008384:	00e58733          	add	a4,a1,a4
    80008388:	0206f693          	andi	a3,a3,32
    8000838c:	00178793          	addi	a5,a5,1
    80008390:	fc069ae3          	bnez	a3,80008364 <uartputc+0xac>
    80008394:	02813083          	ld	ra,40(sp)
    80008398:	02013403          	ld	s0,32(sp)
    8000839c:	01813483          	ld	s1,24(sp)
    800083a0:	01013903          	ld	s2,16(sp)
    800083a4:	00813983          	ld	s3,8(sp)
    800083a8:	03010113          	addi	sp,sp,48
    800083ac:	00008067          	ret

00000000800083b0 <uartputc_sync>:
    800083b0:	ff010113          	addi	sp,sp,-16
    800083b4:	00813423          	sd	s0,8(sp)
    800083b8:	01010413          	addi	s0,sp,16
    800083bc:	00003717          	auipc	a4,0x3
    800083c0:	72c72703          	lw	a4,1836(a4) # 8000bae8 <panicked>
    800083c4:	02071663          	bnez	a4,800083f0 <uartputc_sync+0x40>
    800083c8:	00050793          	mv	a5,a0
    800083cc:	100006b7          	lui	a3,0x10000
    800083d0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800083d4:	02077713          	andi	a4,a4,32
    800083d8:	fe070ce3          	beqz	a4,800083d0 <uartputc_sync+0x20>
    800083dc:	0ff7f793          	andi	a5,a5,255
    800083e0:	00f68023          	sb	a5,0(a3)
    800083e4:	00813403          	ld	s0,8(sp)
    800083e8:	01010113          	addi	sp,sp,16
    800083ec:	00008067          	ret
    800083f0:	0000006f          	j	800083f0 <uartputc_sync+0x40>

00000000800083f4 <uartstart>:
    800083f4:	ff010113          	addi	sp,sp,-16
    800083f8:	00813423          	sd	s0,8(sp)
    800083fc:	01010413          	addi	s0,sp,16
    80008400:	00003617          	auipc	a2,0x3
    80008404:	6f060613          	addi	a2,a2,1776 # 8000baf0 <uart_tx_r>
    80008408:	00003517          	auipc	a0,0x3
    8000840c:	6f050513          	addi	a0,a0,1776 # 8000baf8 <uart_tx_w>
    80008410:	00063783          	ld	a5,0(a2)
    80008414:	00053703          	ld	a4,0(a0)
    80008418:	04f70263          	beq	a4,a5,8000845c <uartstart+0x68>
    8000841c:	100005b7          	lui	a1,0x10000
    80008420:	00005817          	auipc	a6,0x5
    80008424:	a8080813          	addi	a6,a6,-1408 # 8000cea0 <uart_tx_buf>
    80008428:	01c0006f          	j	80008444 <uartstart+0x50>
    8000842c:	0006c703          	lbu	a4,0(a3)
    80008430:	00f63023          	sd	a5,0(a2)
    80008434:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80008438:	00063783          	ld	a5,0(a2)
    8000843c:	00053703          	ld	a4,0(a0)
    80008440:	00f70e63          	beq	a4,a5,8000845c <uartstart+0x68>
    80008444:	01f7f713          	andi	a4,a5,31
    80008448:	00e806b3          	add	a3,a6,a4
    8000844c:	0055c703          	lbu	a4,5(a1)
    80008450:	00178793          	addi	a5,a5,1
    80008454:	02077713          	andi	a4,a4,32
    80008458:	fc071ae3          	bnez	a4,8000842c <uartstart+0x38>
    8000845c:	00813403          	ld	s0,8(sp)
    80008460:	01010113          	addi	sp,sp,16
    80008464:	00008067          	ret

0000000080008468 <uartgetc>:
    80008468:	ff010113          	addi	sp,sp,-16
    8000846c:	00813423          	sd	s0,8(sp)
    80008470:	01010413          	addi	s0,sp,16
    80008474:	10000737          	lui	a4,0x10000
    80008478:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000847c:	0017f793          	andi	a5,a5,1
    80008480:	00078c63          	beqz	a5,80008498 <uartgetc+0x30>
    80008484:	00074503          	lbu	a0,0(a4)
    80008488:	0ff57513          	andi	a0,a0,255
    8000848c:	00813403          	ld	s0,8(sp)
    80008490:	01010113          	addi	sp,sp,16
    80008494:	00008067          	ret
    80008498:	fff00513          	li	a0,-1
    8000849c:	ff1ff06f          	j	8000848c <uartgetc+0x24>

00000000800084a0 <uartintr>:
    800084a0:	100007b7          	lui	a5,0x10000
    800084a4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800084a8:	0017f793          	andi	a5,a5,1
    800084ac:	0a078463          	beqz	a5,80008554 <uartintr+0xb4>
    800084b0:	fe010113          	addi	sp,sp,-32
    800084b4:	00813823          	sd	s0,16(sp)
    800084b8:	00913423          	sd	s1,8(sp)
    800084bc:	00113c23          	sd	ra,24(sp)
    800084c0:	02010413          	addi	s0,sp,32
    800084c4:	100004b7          	lui	s1,0x10000
    800084c8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800084cc:	0ff57513          	andi	a0,a0,255
    800084d0:	fffff097          	auipc	ra,0xfffff
    800084d4:	534080e7          	jalr	1332(ra) # 80007a04 <consoleintr>
    800084d8:	0054c783          	lbu	a5,5(s1)
    800084dc:	0017f793          	andi	a5,a5,1
    800084e0:	fe0794e3          	bnez	a5,800084c8 <uartintr+0x28>
    800084e4:	00003617          	auipc	a2,0x3
    800084e8:	60c60613          	addi	a2,a2,1548 # 8000baf0 <uart_tx_r>
    800084ec:	00003517          	auipc	a0,0x3
    800084f0:	60c50513          	addi	a0,a0,1548 # 8000baf8 <uart_tx_w>
    800084f4:	00063783          	ld	a5,0(a2)
    800084f8:	00053703          	ld	a4,0(a0)
    800084fc:	04f70263          	beq	a4,a5,80008540 <uartintr+0xa0>
    80008500:	100005b7          	lui	a1,0x10000
    80008504:	00005817          	auipc	a6,0x5
    80008508:	99c80813          	addi	a6,a6,-1636 # 8000cea0 <uart_tx_buf>
    8000850c:	01c0006f          	j	80008528 <uartintr+0x88>
    80008510:	0006c703          	lbu	a4,0(a3)
    80008514:	00f63023          	sd	a5,0(a2)
    80008518:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000851c:	00063783          	ld	a5,0(a2)
    80008520:	00053703          	ld	a4,0(a0)
    80008524:	00f70e63          	beq	a4,a5,80008540 <uartintr+0xa0>
    80008528:	01f7f713          	andi	a4,a5,31
    8000852c:	00e806b3          	add	a3,a6,a4
    80008530:	0055c703          	lbu	a4,5(a1)
    80008534:	00178793          	addi	a5,a5,1
    80008538:	02077713          	andi	a4,a4,32
    8000853c:	fc071ae3          	bnez	a4,80008510 <uartintr+0x70>
    80008540:	01813083          	ld	ra,24(sp)
    80008544:	01013403          	ld	s0,16(sp)
    80008548:	00813483          	ld	s1,8(sp)
    8000854c:	02010113          	addi	sp,sp,32
    80008550:	00008067          	ret
    80008554:	00003617          	auipc	a2,0x3
    80008558:	59c60613          	addi	a2,a2,1436 # 8000baf0 <uart_tx_r>
    8000855c:	00003517          	auipc	a0,0x3
    80008560:	59c50513          	addi	a0,a0,1436 # 8000baf8 <uart_tx_w>
    80008564:	00063783          	ld	a5,0(a2)
    80008568:	00053703          	ld	a4,0(a0)
    8000856c:	04f70263          	beq	a4,a5,800085b0 <uartintr+0x110>
    80008570:	100005b7          	lui	a1,0x10000
    80008574:	00005817          	auipc	a6,0x5
    80008578:	92c80813          	addi	a6,a6,-1748 # 8000cea0 <uart_tx_buf>
    8000857c:	01c0006f          	j	80008598 <uartintr+0xf8>
    80008580:	0006c703          	lbu	a4,0(a3)
    80008584:	00f63023          	sd	a5,0(a2)
    80008588:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000858c:	00063783          	ld	a5,0(a2)
    80008590:	00053703          	ld	a4,0(a0)
    80008594:	02f70063          	beq	a4,a5,800085b4 <uartintr+0x114>
    80008598:	01f7f713          	andi	a4,a5,31
    8000859c:	00e806b3          	add	a3,a6,a4
    800085a0:	0055c703          	lbu	a4,5(a1)
    800085a4:	00178793          	addi	a5,a5,1
    800085a8:	02077713          	andi	a4,a4,32
    800085ac:	fc071ae3          	bnez	a4,80008580 <uartintr+0xe0>
    800085b0:	00008067          	ret
    800085b4:	00008067          	ret

00000000800085b8 <kinit>:
    800085b8:	fc010113          	addi	sp,sp,-64
    800085bc:	02913423          	sd	s1,40(sp)
    800085c0:	fffff7b7          	lui	a5,0xfffff
    800085c4:	00006497          	auipc	s1,0x6
    800085c8:	8fb48493          	addi	s1,s1,-1797 # 8000debf <end+0xfff>
    800085cc:	02813823          	sd	s0,48(sp)
    800085d0:	01313c23          	sd	s3,24(sp)
    800085d4:	00f4f4b3          	and	s1,s1,a5
    800085d8:	02113c23          	sd	ra,56(sp)
    800085dc:	03213023          	sd	s2,32(sp)
    800085e0:	01413823          	sd	s4,16(sp)
    800085e4:	01513423          	sd	s5,8(sp)
    800085e8:	04010413          	addi	s0,sp,64
    800085ec:	000017b7          	lui	a5,0x1
    800085f0:	01100993          	li	s3,17
    800085f4:	00f487b3          	add	a5,s1,a5
    800085f8:	01b99993          	slli	s3,s3,0x1b
    800085fc:	06f9e063          	bltu	s3,a5,8000865c <kinit+0xa4>
    80008600:	00005a97          	auipc	s5,0x5
    80008604:	8c0a8a93          	addi	s5,s5,-1856 # 8000cec0 <end>
    80008608:	0754ec63          	bltu	s1,s5,80008680 <kinit+0xc8>
    8000860c:	0734fa63          	bgeu	s1,s3,80008680 <kinit+0xc8>
    80008610:	00088a37          	lui	s4,0x88
    80008614:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80008618:	00003917          	auipc	s2,0x3
    8000861c:	4e890913          	addi	s2,s2,1256 # 8000bb00 <kmem>
    80008620:	00ca1a13          	slli	s4,s4,0xc
    80008624:	0140006f          	j	80008638 <kinit+0x80>
    80008628:	000017b7          	lui	a5,0x1
    8000862c:	00f484b3          	add	s1,s1,a5
    80008630:	0554e863          	bltu	s1,s5,80008680 <kinit+0xc8>
    80008634:	0534f663          	bgeu	s1,s3,80008680 <kinit+0xc8>
    80008638:	00001637          	lui	a2,0x1
    8000863c:	00100593          	li	a1,1
    80008640:	00048513          	mv	a0,s1
    80008644:	00000097          	auipc	ra,0x0
    80008648:	5e4080e7          	jalr	1508(ra) # 80008c28 <__memset>
    8000864c:	00093783          	ld	a5,0(s2)
    80008650:	00f4b023          	sd	a5,0(s1)
    80008654:	00993023          	sd	s1,0(s2)
    80008658:	fd4498e3          	bne	s1,s4,80008628 <kinit+0x70>
    8000865c:	03813083          	ld	ra,56(sp)
    80008660:	03013403          	ld	s0,48(sp)
    80008664:	02813483          	ld	s1,40(sp)
    80008668:	02013903          	ld	s2,32(sp)
    8000866c:	01813983          	ld	s3,24(sp)
    80008670:	01013a03          	ld	s4,16(sp)
    80008674:	00813a83          	ld	s5,8(sp)
    80008678:	04010113          	addi	sp,sp,64
    8000867c:	00008067          	ret
    80008680:	00001517          	auipc	a0,0x1
    80008684:	1b850513          	addi	a0,a0,440 # 80009838 <digits+0x18>
    80008688:	fffff097          	auipc	ra,0xfffff
    8000868c:	4b4080e7          	jalr	1204(ra) # 80007b3c <panic>

0000000080008690 <freerange>:
    80008690:	fc010113          	addi	sp,sp,-64
    80008694:	000017b7          	lui	a5,0x1
    80008698:	02913423          	sd	s1,40(sp)
    8000869c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800086a0:	009504b3          	add	s1,a0,s1
    800086a4:	fffff537          	lui	a0,0xfffff
    800086a8:	02813823          	sd	s0,48(sp)
    800086ac:	02113c23          	sd	ra,56(sp)
    800086b0:	03213023          	sd	s2,32(sp)
    800086b4:	01313c23          	sd	s3,24(sp)
    800086b8:	01413823          	sd	s4,16(sp)
    800086bc:	01513423          	sd	s5,8(sp)
    800086c0:	01613023          	sd	s6,0(sp)
    800086c4:	04010413          	addi	s0,sp,64
    800086c8:	00a4f4b3          	and	s1,s1,a0
    800086cc:	00f487b3          	add	a5,s1,a5
    800086d0:	06f5e463          	bltu	a1,a5,80008738 <freerange+0xa8>
    800086d4:	00004a97          	auipc	s5,0x4
    800086d8:	7eca8a93          	addi	s5,s5,2028 # 8000cec0 <end>
    800086dc:	0954e263          	bltu	s1,s5,80008760 <freerange+0xd0>
    800086e0:	01100993          	li	s3,17
    800086e4:	01b99993          	slli	s3,s3,0x1b
    800086e8:	0734fc63          	bgeu	s1,s3,80008760 <freerange+0xd0>
    800086ec:	00058a13          	mv	s4,a1
    800086f0:	00003917          	auipc	s2,0x3
    800086f4:	41090913          	addi	s2,s2,1040 # 8000bb00 <kmem>
    800086f8:	00002b37          	lui	s6,0x2
    800086fc:	0140006f          	j	80008710 <freerange+0x80>
    80008700:	000017b7          	lui	a5,0x1
    80008704:	00f484b3          	add	s1,s1,a5
    80008708:	0554ec63          	bltu	s1,s5,80008760 <freerange+0xd0>
    8000870c:	0534fa63          	bgeu	s1,s3,80008760 <freerange+0xd0>
    80008710:	00001637          	lui	a2,0x1
    80008714:	00100593          	li	a1,1
    80008718:	00048513          	mv	a0,s1
    8000871c:	00000097          	auipc	ra,0x0
    80008720:	50c080e7          	jalr	1292(ra) # 80008c28 <__memset>
    80008724:	00093703          	ld	a4,0(s2)
    80008728:	016487b3          	add	a5,s1,s6
    8000872c:	00e4b023          	sd	a4,0(s1)
    80008730:	00993023          	sd	s1,0(s2)
    80008734:	fcfa76e3          	bgeu	s4,a5,80008700 <freerange+0x70>
    80008738:	03813083          	ld	ra,56(sp)
    8000873c:	03013403          	ld	s0,48(sp)
    80008740:	02813483          	ld	s1,40(sp)
    80008744:	02013903          	ld	s2,32(sp)
    80008748:	01813983          	ld	s3,24(sp)
    8000874c:	01013a03          	ld	s4,16(sp)
    80008750:	00813a83          	ld	s5,8(sp)
    80008754:	00013b03          	ld	s6,0(sp)
    80008758:	04010113          	addi	sp,sp,64
    8000875c:	00008067          	ret
    80008760:	00001517          	auipc	a0,0x1
    80008764:	0d850513          	addi	a0,a0,216 # 80009838 <digits+0x18>
    80008768:	fffff097          	auipc	ra,0xfffff
    8000876c:	3d4080e7          	jalr	980(ra) # 80007b3c <panic>

0000000080008770 <kfree>:
    80008770:	fe010113          	addi	sp,sp,-32
    80008774:	00813823          	sd	s0,16(sp)
    80008778:	00113c23          	sd	ra,24(sp)
    8000877c:	00913423          	sd	s1,8(sp)
    80008780:	02010413          	addi	s0,sp,32
    80008784:	03451793          	slli	a5,a0,0x34
    80008788:	04079c63          	bnez	a5,800087e0 <kfree+0x70>
    8000878c:	00004797          	auipc	a5,0x4
    80008790:	73478793          	addi	a5,a5,1844 # 8000cec0 <end>
    80008794:	00050493          	mv	s1,a0
    80008798:	04f56463          	bltu	a0,a5,800087e0 <kfree+0x70>
    8000879c:	01100793          	li	a5,17
    800087a0:	01b79793          	slli	a5,a5,0x1b
    800087a4:	02f57e63          	bgeu	a0,a5,800087e0 <kfree+0x70>
    800087a8:	00001637          	lui	a2,0x1
    800087ac:	00100593          	li	a1,1
    800087b0:	00000097          	auipc	ra,0x0
    800087b4:	478080e7          	jalr	1144(ra) # 80008c28 <__memset>
    800087b8:	00003797          	auipc	a5,0x3
    800087bc:	34878793          	addi	a5,a5,840 # 8000bb00 <kmem>
    800087c0:	0007b703          	ld	a4,0(a5)
    800087c4:	01813083          	ld	ra,24(sp)
    800087c8:	01013403          	ld	s0,16(sp)
    800087cc:	00e4b023          	sd	a4,0(s1)
    800087d0:	0097b023          	sd	s1,0(a5)
    800087d4:	00813483          	ld	s1,8(sp)
    800087d8:	02010113          	addi	sp,sp,32
    800087dc:	00008067          	ret
    800087e0:	00001517          	auipc	a0,0x1
    800087e4:	05850513          	addi	a0,a0,88 # 80009838 <digits+0x18>
    800087e8:	fffff097          	auipc	ra,0xfffff
    800087ec:	354080e7          	jalr	852(ra) # 80007b3c <panic>

00000000800087f0 <kalloc>:
    800087f0:	fe010113          	addi	sp,sp,-32
    800087f4:	00813823          	sd	s0,16(sp)
    800087f8:	00913423          	sd	s1,8(sp)
    800087fc:	00113c23          	sd	ra,24(sp)
    80008800:	02010413          	addi	s0,sp,32
    80008804:	00003797          	auipc	a5,0x3
    80008808:	2fc78793          	addi	a5,a5,764 # 8000bb00 <kmem>
    8000880c:	0007b483          	ld	s1,0(a5)
    80008810:	02048063          	beqz	s1,80008830 <kalloc+0x40>
    80008814:	0004b703          	ld	a4,0(s1)
    80008818:	00001637          	lui	a2,0x1
    8000881c:	00500593          	li	a1,5
    80008820:	00048513          	mv	a0,s1
    80008824:	00e7b023          	sd	a4,0(a5)
    80008828:	00000097          	auipc	ra,0x0
    8000882c:	400080e7          	jalr	1024(ra) # 80008c28 <__memset>
    80008830:	01813083          	ld	ra,24(sp)
    80008834:	01013403          	ld	s0,16(sp)
    80008838:	00048513          	mv	a0,s1
    8000883c:	00813483          	ld	s1,8(sp)
    80008840:	02010113          	addi	sp,sp,32
    80008844:	00008067          	ret

0000000080008848 <initlock>:
    80008848:	ff010113          	addi	sp,sp,-16
    8000884c:	00813423          	sd	s0,8(sp)
    80008850:	01010413          	addi	s0,sp,16
    80008854:	00813403          	ld	s0,8(sp)
    80008858:	00b53423          	sd	a1,8(a0)
    8000885c:	00052023          	sw	zero,0(a0)
    80008860:	00053823          	sd	zero,16(a0)
    80008864:	01010113          	addi	sp,sp,16
    80008868:	00008067          	ret

000000008000886c <acquire>:
    8000886c:	fe010113          	addi	sp,sp,-32
    80008870:	00813823          	sd	s0,16(sp)
    80008874:	00913423          	sd	s1,8(sp)
    80008878:	00113c23          	sd	ra,24(sp)
    8000887c:	01213023          	sd	s2,0(sp)
    80008880:	02010413          	addi	s0,sp,32
    80008884:	00050493          	mv	s1,a0
    80008888:	10002973          	csrr	s2,sstatus
    8000888c:	100027f3          	csrr	a5,sstatus
    80008890:	ffd7f793          	andi	a5,a5,-3
    80008894:	10079073          	csrw	sstatus,a5
    80008898:	fffff097          	auipc	ra,0xfffff
    8000889c:	8e8080e7          	jalr	-1816(ra) # 80007180 <mycpu>
    800088a0:	07852783          	lw	a5,120(a0)
    800088a4:	06078e63          	beqz	a5,80008920 <acquire+0xb4>
    800088a8:	fffff097          	auipc	ra,0xfffff
    800088ac:	8d8080e7          	jalr	-1832(ra) # 80007180 <mycpu>
    800088b0:	07852783          	lw	a5,120(a0)
    800088b4:	0004a703          	lw	a4,0(s1)
    800088b8:	0017879b          	addiw	a5,a5,1
    800088bc:	06f52c23          	sw	a5,120(a0)
    800088c0:	04071063          	bnez	a4,80008900 <acquire+0x94>
    800088c4:	00100713          	li	a4,1
    800088c8:	00070793          	mv	a5,a4
    800088cc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800088d0:	0007879b          	sext.w	a5,a5
    800088d4:	fe079ae3          	bnez	a5,800088c8 <acquire+0x5c>
    800088d8:	0ff0000f          	fence
    800088dc:	fffff097          	auipc	ra,0xfffff
    800088e0:	8a4080e7          	jalr	-1884(ra) # 80007180 <mycpu>
    800088e4:	01813083          	ld	ra,24(sp)
    800088e8:	01013403          	ld	s0,16(sp)
    800088ec:	00a4b823          	sd	a0,16(s1)
    800088f0:	00013903          	ld	s2,0(sp)
    800088f4:	00813483          	ld	s1,8(sp)
    800088f8:	02010113          	addi	sp,sp,32
    800088fc:	00008067          	ret
    80008900:	0104b903          	ld	s2,16(s1)
    80008904:	fffff097          	auipc	ra,0xfffff
    80008908:	87c080e7          	jalr	-1924(ra) # 80007180 <mycpu>
    8000890c:	faa91ce3          	bne	s2,a0,800088c4 <acquire+0x58>
    80008910:	00001517          	auipc	a0,0x1
    80008914:	f3050513          	addi	a0,a0,-208 # 80009840 <digits+0x20>
    80008918:	fffff097          	auipc	ra,0xfffff
    8000891c:	224080e7          	jalr	548(ra) # 80007b3c <panic>
    80008920:	00195913          	srli	s2,s2,0x1
    80008924:	fffff097          	auipc	ra,0xfffff
    80008928:	85c080e7          	jalr	-1956(ra) # 80007180 <mycpu>
    8000892c:	00197913          	andi	s2,s2,1
    80008930:	07252e23          	sw	s2,124(a0)
    80008934:	f75ff06f          	j	800088a8 <acquire+0x3c>

0000000080008938 <release>:
    80008938:	fe010113          	addi	sp,sp,-32
    8000893c:	00813823          	sd	s0,16(sp)
    80008940:	00113c23          	sd	ra,24(sp)
    80008944:	00913423          	sd	s1,8(sp)
    80008948:	01213023          	sd	s2,0(sp)
    8000894c:	02010413          	addi	s0,sp,32
    80008950:	00052783          	lw	a5,0(a0)
    80008954:	00079a63          	bnez	a5,80008968 <release+0x30>
    80008958:	00001517          	auipc	a0,0x1
    8000895c:	ef050513          	addi	a0,a0,-272 # 80009848 <digits+0x28>
    80008960:	fffff097          	auipc	ra,0xfffff
    80008964:	1dc080e7          	jalr	476(ra) # 80007b3c <panic>
    80008968:	01053903          	ld	s2,16(a0)
    8000896c:	00050493          	mv	s1,a0
    80008970:	fffff097          	auipc	ra,0xfffff
    80008974:	810080e7          	jalr	-2032(ra) # 80007180 <mycpu>
    80008978:	fea910e3          	bne	s2,a0,80008958 <release+0x20>
    8000897c:	0004b823          	sd	zero,16(s1)
    80008980:	0ff0000f          	fence
    80008984:	0f50000f          	fence	iorw,ow
    80008988:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000898c:	ffffe097          	auipc	ra,0xffffe
    80008990:	7f4080e7          	jalr	2036(ra) # 80007180 <mycpu>
    80008994:	100027f3          	csrr	a5,sstatus
    80008998:	0027f793          	andi	a5,a5,2
    8000899c:	04079a63          	bnez	a5,800089f0 <release+0xb8>
    800089a0:	07852783          	lw	a5,120(a0)
    800089a4:	02f05e63          	blez	a5,800089e0 <release+0xa8>
    800089a8:	fff7871b          	addiw	a4,a5,-1
    800089ac:	06e52c23          	sw	a4,120(a0)
    800089b0:	00071c63          	bnez	a4,800089c8 <release+0x90>
    800089b4:	07c52783          	lw	a5,124(a0)
    800089b8:	00078863          	beqz	a5,800089c8 <release+0x90>
    800089bc:	100027f3          	csrr	a5,sstatus
    800089c0:	0027e793          	ori	a5,a5,2
    800089c4:	10079073          	csrw	sstatus,a5
    800089c8:	01813083          	ld	ra,24(sp)
    800089cc:	01013403          	ld	s0,16(sp)
    800089d0:	00813483          	ld	s1,8(sp)
    800089d4:	00013903          	ld	s2,0(sp)
    800089d8:	02010113          	addi	sp,sp,32
    800089dc:	00008067          	ret
    800089e0:	00001517          	auipc	a0,0x1
    800089e4:	e8850513          	addi	a0,a0,-376 # 80009868 <digits+0x48>
    800089e8:	fffff097          	auipc	ra,0xfffff
    800089ec:	154080e7          	jalr	340(ra) # 80007b3c <panic>
    800089f0:	00001517          	auipc	a0,0x1
    800089f4:	e6050513          	addi	a0,a0,-416 # 80009850 <digits+0x30>
    800089f8:	fffff097          	auipc	ra,0xfffff
    800089fc:	144080e7          	jalr	324(ra) # 80007b3c <panic>

0000000080008a00 <holding>:
    80008a00:	00052783          	lw	a5,0(a0)
    80008a04:	00079663          	bnez	a5,80008a10 <holding+0x10>
    80008a08:	00000513          	li	a0,0
    80008a0c:	00008067          	ret
    80008a10:	fe010113          	addi	sp,sp,-32
    80008a14:	00813823          	sd	s0,16(sp)
    80008a18:	00913423          	sd	s1,8(sp)
    80008a1c:	00113c23          	sd	ra,24(sp)
    80008a20:	02010413          	addi	s0,sp,32
    80008a24:	01053483          	ld	s1,16(a0)
    80008a28:	ffffe097          	auipc	ra,0xffffe
    80008a2c:	758080e7          	jalr	1880(ra) # 80007180 <mycpu>
    80008a30:	01813083          	ld	ra,24(sp)
    80008a34:	01013403          	ld	s0,16(sp)
    80008a38:	40a48533          	sub	a0,s1,a0
    80008a3c:	00153513          	seqz	a0,a0
    80008a40:	00813483          	ld	s1,8(sp)
    80008a44:	02010113          	addi	sp,sp,32
    80008a48:	00008067          	ret

0000000080008a4c <push_off>:
    80008a4c:	fe010113          	addi	sp,sp,-32
    80008a50:	00813823          	sd	s0,16(sp)
    80008a54:	00113c23          	sd	ra,24(sp)
    80008a58:	00913423          	sd	s1,8(sp)
    80008a5c:	02010413          	addi	s0,sp,32
    80008a60:	100024f3          	csrr	s1,sstatus
    80008a64:	100027f3          	csrr	a5,sstatus
    80008a68:	ffd7f793          	andi	a5,a5,-3
    80008a6c:	10079073          	csrw	sstatus,a5
    80008a70:	ffffe097          	auipc	ra,0xffffe
    80008a74:	710080e7          	jalr	1808(ra) # 80007180 <mycpu>
    80008a78:	07852783          	lw	a5,120(a0)
    80008a7c:	02078663          	beqz	a5,80008aa8 <push_off+0x5c>
    80008a80:	ffffe097          	auipc	ra,0xffffe
    80008a84:	700080e7          	jalr	1792(ra) # 80007180 <mycpu>
    80008a88:	07852783          	lw	a5,120(a0)
    80008a8c:	01813083          	ld	ra,24(sp)
    80008a90:	01013403          	ld	s0,16(sp)
    80008a94:	0017879b          	addiw	a5,a5,1
    80008a98:	06f52c23          	sw	a5,120(a0)
    80008a9c:	00813483          	ld	s1,8(sp)
    80008aa0:	02010113          	addi	sp,sp,32
    80008aa4:	00008067          	ret
    80008aa8:	0014d493          	srli	s1,s1,0x1
    80008aac:	ffffe097          	auipc	ra,0xffffe
    80008ab0:	6d4080e7          	jalr	1748(ra) # 80007180 <mycpu>
    80008ab4:	0014f493          	andi	s1,s1,1
    80008ab8:	06952e23          	sw	s1,124(a0)
    80008abc:	fc5ff06f          	j	80008a80 <push_off+0x34>

0000000080008ac0 <pop_off>:
    80008ac0:	ff010113          	addi	sp,sp,-16
    80008ac4:	00813023          	sd	s0,0(sp)
    80008ac8:	00113423          	sd	ra,8(sp)
    80008acc:	01010413          	addi	s0,sp,16
    80008ad0:	ffffe097          	auipc	ra,0xffffe
    80008ad4:	6b0080e7          	jalr	1712(ra) # 80007180 <mycpu>
    80008ad8:	100027f3          	csrr	a5,sstatus
    80008adc:	0027f793          	andi	a5,a5,2
    80008ae0:	04079663          	bnez	a5,80008b2c <pop_off+0x6c>
    80008ae4:	07852783          	lw	a5,120(a0)
    80008ae8:	02f05a63          	blez	a5,80008b1c <pop_off+0x5c>
    80008aec:	fff7871b          	addiw	a4,a5,-1
    80008af0:	06e52c23          	sw	a4,120(a0)
    80008af4:	00071c63          	bnez	a4,80008b0c <pop_off+0x4c>
    80008af8:	07c52783          	lw	a5,124(a0)
    80008afc:	00078863          	beqz	a5,80008b0c <pop_off+0x4c>
    80008b00:	100027f3          	csrr	a5,sstatus
    80008b04:	0027e793          	ori	a5,a5,2
    80008b08:	10079073          	csrw	sstatus,a5
    80008b0c:	00813083          	ld	ra,8(sp)
    80008b10:	00013403          	ld	s0,0(sp)
    80008b14:	01010113          	addi	sp,sp,16
    80008b18:	00008067          	ret
    80008b1c:	00001517          	auipc	a0,0x1
    80008b20:	d4c50513          	addi	a0,a0,-692 # 80009868 <digits+0x48>
    80008b24:	fffff097          	auipc	ra,0xfffff
    80008b28:	018080e7          	jalr	24(ra) # 80007b3c <panic>
    80008b2c:	00001517          	auipc	a0,0x1
    80008b30:	d2450513          	addi	a0,a0,-732 # 80009850 <digits+0x30>
    80008b34:	fffff097          	auipc	ra,0xfffff
    80008b38:	008080e7          	jalr	8(ra) # 80007b3c <panic>

0000000080008b3c <push_on>:
    80008b3c:	fe010113          	addi	sp,sp,-32
    80008b40:	00813823          	sd	s0,16(sp)
    80008b44:	00113c23          	sd	ra,24(sp)
    80008b48:	00913423          	sd	s1,8(sp)
    80008b4c:	02010413          	addi	s0,sp,32
    80008b50:	100024f3          	csrr	s1,sstatus
    80008b54:	100027f3          	csrr	a5,sstatus
    80008b58:	0027e793          	ori	a5,a5,2
    80008b5c:	10079073          	csrw	sstatus,a5
    80008b60:	ffffe097          	auipc	ra,0xffffe
    80008b64:	620080e7          	jalr	1568(ra) # 80007180 <mycpu>
    80008b68:	07852783          	lw	a5,120(a0)
    80008b6c:	02078663          	beqz	a5,80008b98 <push_on+0x5c>
    80008b70:	ffffe097          	auipc	ra,0xffffe
    80008b74:	610080e7          	jalr	1552(ra) # 80007180 <mycpu>
    80008b78:	07852783          	lw	a5,120(a0)
    80008b7c:	01813083          	ld	ra,24(sp)
    80008b80:	01013403          	ld	s0,16(sp)
    80008b84:	0017879b          	addiw	a5,a5,1
    80008b88:	06f52c23          	sw	a5,120(a0)
    80008b8c:	00813483          	ld	s1,8(sp)
    80008b90:	02010113          	addi	sp,sp,32
    80008b94:	00008067          	ret
    80008b98:	0014d493          	srli	s1,s1,0x1
    80008b9c:	ffffe097          	auipc	ra,0xffffe
    80008ba0:	5e4080e7          	jalr	1508(ra) # 80007180 <mycpu>
    80008ba4:	0014f493          	andi	s1,s1,1
    80008ba8:	06952e23          	sw	s1,124(a0)
    80008bac:	fc5ff06f          	j	80008b70 <push_on+0x34>

0000000080008bb0 <pop_on>:
    80008bb0:	ff010113          	addi	sp,sp,-16
    80008bb4:	00813023          	sd	s0,0(sp)
    80008bb8:	00113423          	sd	ra,8(sp)
    80008bbc:	01010413          	addi	s0,sp,16
    80008bc0:	ffffe097          	auipc	ra,0xffffe
    80008bc4:	5c0080e7          	jalr	1472(ra) # 80007180 <mycpu>
    80008bc8:	100027f3          	csrr	a5,sstatus
    80008bcc:	0027f793          	andi	a5,a5,2
    80008bd0:	04078463          	beqz	a5,80008c18 <pop_on+0x68>
    80008bd4:	07852783          	lw	a5,120(a0)
    80008bd8:	02f05863          	blez	a5,80008c08 <pop_on+0x58>
    80008bdc:	fff7879b          	addiw	a5,a5,-1
    80008be0:	06f52c23          	sw	a5,120(a0)
    80008be4:	07853783          	ld	a5,120(a0)
    80008be8:	00079863          	bnez	a5,80008bf8 <pop_on+0x48>
    80008bec:	100027f3          	csrr	a5,sstatus
    80008bf0:	ffd7f793          	andi	a5,a5,-3
    80008bf4:	10079073          	csrw	sstatus,a5
    80008bf8:	00813083          	ld	ra,8(sp)
    80008bfc:	00013403          	ld	s0,0(sp)
    80008c00:	01010113          	addi	sp,sp,16
    80008c04:	00008067          	ret
    80008c08:	00001517          	auipc	a0,0x1
    80008c0c:	c8850513          	addi	a0,a0,-888 # 80009890 <digits+0x70>
    80008c10:	fffff097          	auipc	ra,0xfffff
    80008c14:	f2c080e7          	jalr	-212(ra) # 80007b3c <panic>
    80008c18:	00001517          	auipc	a0,0x1
    80008c1c:	c5850513          	addi	a0,a0,-936 # 80009870 <digits+0x50>
    80008c20:	fffff097          	auipc	ra,0xfffff
    80008c24:	f1c080e7          	jalr	-228(ra) # 80007b3c <panic>

0000000080008c28 <__memset>:
    80008c28:	ff010113          	addi	sp,sp,-16
    80008c2c:	00813423          	sd	s0,8(sp)
    80008c30:	01010413          	addi	s0,sp,16
    80008c34:	1a060e63          	beqz	a2,80008df0 <__memset+0x1c8>
    80008c38:	40a007b3          	neg	a5,a0
    80008c3c:	0077f793          	andi	a5,a5,7
    80008c40:	00778693          	addi	a3,a5,7
    80008c44:	00b00813          	li	a6,11
    80008c48:	0ff5f593          	andi	a1,a1,255
    80008c4c:	fff6071b          	addiw	a4,a2,-1
    80008c50:	1b06e663          	bltu	a3,a6,80008dfc <__memset+0x1d4>
    80008c54:	1cd76463          	bltu	a4,a3,80008e1c <__memset+0x1f4>
    80008c58:	1a078e63          	beqz	a5,80008e14 <__memset+0x1ec>
    80008c5c:	00b50023          	sb	a1,0(a0)
    80008c60:	00100713          	li	a4,1
    80008c64:	1ae78463          	beq	a5,a4,80008e0c <__memset+0x1e4>
    80008c68:	00b500a3          	sb	a1,1(a0)
    80008c6c:	00200713          	li	a4,2
    80008c70:	1ae78a63          	beq	a5,a4,80008e24 <__memset+0x1fc>
    80008c74:	00b50123          	sb	a1,2(a0)
    80008c78:	00300713          	li	a4,3
    80008c7c:	18e78463          	beq	a5,a4,80008e04 <__memset+0x1dc>
    80008c80:	00b501a3          	sb	a1,3(a0)
    80008c84:	00400713          	li	a4,4
    80008c88:	1ae78263          	beq	a5,a4,80008e2c <__memset+0x204>
    80008c8c:	00b50223          	sb	a1,4(a0)
    80008c90:	00500713          	li	a4,5
    80008c94:	1ae78063          	beq	a5,a4,80008e34 <__memset+0x20c>
    80008c98:	00b502a3          	sb	a1,5(a0)
    80008c9c:	00700713          	li	a4,7
    80008ca0:	18e79e63          	bne	a5,a4,80008e3c <__memset+0x214>
    80008ca4:	00b50323          	sb	a1,6(a0)
    80008ca8:	00700e93          	li	t4,7
    80008cac:	00859713          	slli	a4,a1,0x8
    80008cb0:	00e5e733          	or	a4,a1,a4
    80008cb4:	01059e13          	slli	t3,a1,0x10
    80008cb8:	01c76e33          	or	t3,a4,t3
    80008cbc:	01859313          	slli	t1,a1,0x18
    80008cc0:	006e6333          	or	t1,t3,t1
    80008cc4:	02059893          	slli	a7,a1,0x20
    80008cc8:	40f60e3b          	subw	t3,a2,a5
    80008ccc:	011368b3          	or	a7,t1,a7
    80008cd0:	02859813          	slli	a6,a1,0x28
    80008cd4:	0108e833          	or	a6,a7,a6
    80008cd8:	03059693          	slli	a3,a1,0x30
    80008cdc:	003e589b          	srliw	a7,t3,0x3
    80008ce0:	00d866b3          	or	a3,a6,a3
    80008ce4:	03859713          	slli	a4,a1,0x38
    80008ce8:	00389813          	slli	a6,a7,0x3
    80008cec:	00f507b3          	add	a5,a0,a5
    80008cf0:	00e6e733          	or	a4,a3,a4
    80008cf4:	000e089b          	sext.w	a7,t3
    80008cf8:	00f806b3          	add	a3,a6,a5
    80008cfc:	00e7b023          	sd	a4,0(a5)
    80008d00:	00878793          	addi	a5,a5,8
    80008d04:	fed79ce3          	bne	a5,a3,80008cfc <__memset+0xd4>
    80008d08:	ff8e7793          	andi	a5,t3,-8
    80008d0c:	0007871b          	sext.w	a4,a5
    80008d10:	01d787bb          	addw	a5,a5,t4
    80008d14:	0ce88e63          	beq	a7,a4,80008df0 <__memset+0x1c8>
    80008d18:	00f50733          	add	a4,a0,a5
    80008d1c:	00b70023          	sb	a1,0(a4)
    80008d20:	0017871b          	addiw	a4,a5,1
    80008d24:	0cc77663          	bgeu	a4,a2,80008df0 <__memset+0x1c8>
    80008d28:	00e50733          	add	a4,a0,a4
    80008d2c:	00b70023          	sb	a1,0(a4)
    80008d30:	0027871b          	addiw	a4,a5,2
    80008d34:	0ac77e63          	bgeu	a4,a2,80008df0 <__memset+0x1c8>
    80008d38:	00e50733          	add	a4,a0,a4
    80008d3c:	00b70023          	sb	a1,0(a4)
    80008d40:	0037871b          	addiw	a4,a5,3
    80008d44:	0ac77663          	bgeu	a4,a2,80008df0 <__memset+0x1c8>
    80008d48:	00e50733          	add	a4,a0,a4
    80008d4c:	00b70023          	sb	a1,0(a4)
    80008d50:	0047871b          	addiw	a4,a5,4
    80008d54:	08c77e63          	bgeu	a4,a2,80008df0 <__memset+0x1c8>
    80008d58:	00e50733          	add	a4,a0,a4
    80008d5c:	00b70023          	sb	a1,0(a4)
    80008d60:	0057871b          	addiw	a4,a5,5
    80008d64:	08c77663          	bgeu	a4,a2,80008df0 <__memset+0x1c8>
    80008d68:	00e50733          	add	a4,a0,a4
    80008d6c:	00b70023          	sb	a1,0(a4)
    80008d70:	0067871b          	addiw	a4,a5,6
    80008d74:	06c77e63          	bgeu	a4,a2,80008df0 <__memset+0x1c8>
    80008d78:	00e50733          	add	a4,a0,a4
    80008d7c:	00b70023          	sb	a1,0(a4)
    80008d80:	0077871b          	addiw	a4,a5,7
    80008d84:	06c77663          	bgeu	a4,a2,80008df0 <__memset+0x1c8>
    80008d88:	00e50733          	add	a4,a0,a4
    80008d8c:	00b70023          	sb	a1,0(a4)
    80008d90:	0087871b          	addiw	a4,a5,8
    80008d94:	04c77e63          	bgeu	a4,a2,80008df0 <__memset+0x1c8>
    80008d98:	00e50733          	add	a4,a0,a4
    80008d9c:	00b70023          	sb	a1,0(a4)
    80008da0:	0097871b          	addiw	a4,a5,9
    80008da4:	04c77663          	bgeu	a4,a2,80008df0 <__memset+0x1c8>
    80008da8:	00e50733          	add	a4,a0,a4
    80008dac:	00b70023          	sb	a1,0(a4)
    80008db0:	00a7871b          	addiw	a4,a5,10
    80008db4:	02c77e63          	bgeu	a4,a2,80008df0 <__memset+0x1c8>
    80008db8:	00e50733          	add	a4,a0,a4
    80008dbc:	00b70023          	sb	a1,0(a4)
    80008dc0:	00b7871b          	addiw	a4,a5,11
    80008dc4:	02c77663          	bgeu	a4,a2,80008df0 <__memset+0x1c8>
    80008dc8:	00e50733          	add	a4,a0,a4
    80008dcc:	00b70023          	sb	a1,0(a4)
    80008dd0:	00c7871b          	addiw	a4,a5,12
    80008dd4:	00c77e63          	bgeu	a4,a2,80008df0 <__memset+0x1c8>
    80008dd8:	00e50733          	add	a4,a0,a4
    80008ddc:	00b70023          	sb	a1,0(a4)
    80008de0:	00d7879b          	addiw	a5,a5,13
    80008de4:	00c7f663          	bgeu	a5,a2,80008df0 <__memset+0x1c8>
    80008de8:	00f507b3          	add	a5,a0,a5
    80008dec:	00b78023          	sb	a1,0(a5)
    80008df0:	00813403          	ld	s0,8(sp)
    80008df4:	01010113          	addi	sp,sp,16
    80008df8:	00008067          	ret
    80008dfc:	00b00693          	li	a3,11
    80008e00:	e55ff06f          	j	80008c54 <__memset+0x2c>
    80008e04:	00300e93          	li	t4,3
    80008e08:	ea5ff06f          	j	80008cac <__memset+0x84>
    80008e0c:	00100e93          	li	t4,1
    80008e10:	e9dff06f          	j	80008cac <__memset+0x84>
    80008e14:	00000e93          	li	t4,0
    80008e18:	e95ff06f          	j	80008cac <__memset+0x84>
    80008e1c:	00000793          	li	a5,0
    80008e20:	ef9ff06f          	j	80008d18 <__memset+0xf0>
    80008e24:	00200e93          	li	t4,2
    80008e28:	e85ff06f          	j	80008cac <__memset+0x84>
    80008e2c:	00400e93          	li	t4,4
    80008e30:	e7dff06f          	j	80008cac <__memset+0x84>
    80008e34:	00500e93          	li	t4,5
    80008e38:	e75ff06f          	j	80008cac <__memset+0x84>
    80008e3c:	00600e93          	li	t4,6
    80008e40:	e6dff06f          	j	80008cac <__memset+0x84>

0000000080008e44 <__memmove>:
    80008e44:	ff010113          	addi	sp,sp,-16
    80008e48:	00813423          	sd	s0,8(sp)
    80008e4c:	01010413          	addi	s0,sp,16
    80008e50:	0e060863          	beqz	a2,80008f40 <__memmove+0xfc>
    80008e54:	fff6069b          	addiw	a3,a2,-1
    80008e58:	0006881b          	sext.w	a6,a3
    80008e5c:	0ea5e863          	bltu	a1,a0,80008f4c <__memmove+0x108>
    80008e60:	00758713          	addi	a4,a1,7
    80008e64:	00a5e7b3          	or	a5,a1,a0
    80008e68:	40a70733          	sub	a4,a4,a0
    80008e6c:	0077f793          	andi	a5,a5,7
    80008e70:	00f73713          	sltiu	a4,a4,15
    80008e74:	00174713          	xori	a4,a4,1
    80008e78:	0017b793          	seqz	a5,a5
    80008e7c:	00e7f7b3          	and	a5,a5,a4
    80008e80:	10078863          	beqz	a5,80008f90 <__memmove+0x14c>
    80008e84:	00900793          	li	a5,9
    80008e88:	1107f463          	bgeu	a5,a6,80008f90 <__memmove+0x14c>
    80008e8c:	0036581b          	srliw	a6,a2,0x3
    80008e90:	fff8081b          	addiw	a6,a6,-1
    80008e94:	02081813          	slli	a6,a6,0x20
    80008e98:	01d85893          	srli	a7,a6,0x1d
    80008e9c:	00858813          	addi	a6,a1,8
    80008ea0:	00058793          	mv	a5,a1
    80008ea4:	00050713          	mv	a4,a0
    80008ea8:	01088833          	add	a6,a7,a6
    80008eac:	0007b883          	ld	a7,0(a5)
    80008eb0:	00878793          	addi	a5,a5,8
    80008eb4:	00870713          	addi	a4,a4,8
    80008eb8:	ff173c23          	sd	a7,-8(a4)
    80008ebc:	ff0798e3          	bne	a5,a6,80008eac <__memmove+0x68>
    80008ec0:	ff867713          	andi	a4,a2,-8
    80008ec4:	02071793          	slli	a5,a4,0x20
    80008ec8:	0207d793          	srli	a5,a5,0x20
    80008ecc:	00f585b3          	add	a1,a1,a5
    80008ed0:	40e686bb          	subw	a3,a3,a4
    80008ed4:	00f507b3          	add	a5,a0,a5
    80008ed8:	06e60463          	beq	a2,a4,80008f40 <__memmove+0xfc>
    80008edc:	0005c703          	lbu	a4,0(a1)
    80008ee0:	00e78023          	sb	a4,0(a5)
    80008ee4:	04068e63          	beqz	a3,80008f40 <__memmove+0xfc>
    80008ee8:	0015c603          	lbu	a2,1(a1)
    80008eec:	00100713          	li	a4,1
    80008ef0:	00c780a3          	sb	a2,1(a5)
    80008ef4:	04e68663          	beq	a3,a4,80008f40 <__memmove+0xfc>
    80008ef8:	0025c603          	lbu	a2,2(a1)
    80008efc:	00200713          	li	a4,2
    80008f00:	00c78123          	sb	a2,2(a5)
    80008f04:	02e68e63          	beq	a3,a4,80008f40 <__memmove+0xfc>
    80008f08:	0035c603          	lbu	a2,3(a1)
    80008f0c:	00300713          	li	a4,3
    80008f10:	00c781a3          	sb	a2,3(a5)
    80008f14:	02e68663          	beq	a3,a4,80008f40 <__memmove+0xfc>
    80008f18:	0045c603          	lbu	a2,4(a1)
    80008f1c:	00400713          	li	a4,4
    80008f20:	00c78223          	sb	a2,4(a5)
    80008f24:	00e68e63          	beq	a3,a4,80008f40 <__memmove+0xfc>
    80008f28:	0055c603          	lbu	a2,5(a1)
    80008f2c:	00500713          	li	a4,5
    80008f30:	00c782a3          	sb	a2,5(a5)
    80008f34:	00e68663          	beq	a3,a4,80008f40 <__memmove+0xfc>
    80008f38:	0065c703          	lbu	a4,6(a1)
    80008f3c:	00e78323          	sb	a4,6(a5)
    80008f40:	00813403          	ld	s0,8(sp)
    80008f44:	01010113          	addi	sp,sp,16
    80008f48:	00008067          	ret
    80008f4c:	02061713          	slli	a4,a2,0x20
    80008f50:	02075713          	srli	a4,a4,0x20
    80008f54:	00e587b3          	add	a5,a1,a4
    80008f58:	f0f574e3          	bgeu	a0,a5,80008e60 <__memmove+0x1c>
    80008f5c:	02069613          	slli	a2,a3,0x20
    80008f60:	02065613          	srli	a2,a2,0x20
    80008f64:	fff64613          	not	a2,a2
    80008f68:	00e50733          	add	a4,a0,a4
    80008f6c:	00c78633          	add	a2,a5,a2
    80008f70:	fff7c683          	lbu	a3,-1(a5)
    80008f74:	fff78793          	addi	a5,a5,-1
    80008f78:	fff70713          	addi	a4,a4,-1
    80008f7c:	00d70023          	sb	a3,0(a4)
    80008f80:	fec798e3          	bne	a5,a2,80008f70 <__memmove+0x12c>
    80008f84:	00813403          	ld	s0,8(sp)
    80008f88:	01010113          	addi	sp,sp,16
    80008f8c:	00008067          	ret
    80008f90:	02069713          	slli	a4,a3,0x20
    80008f94:	02075713          	srli	a4,a4,0x20
    80008f98:	00170713          	addi	a4,a4,1
    80008f9c:	00e50733          	add	a4,a0,a4
    80008fa0:	00050793          	mv	a5,a0
    80008fa4:	0005c683          	lbu	a3,0(a1)
    80008fa8:	00178793          	addi	a5,a5,1
    80008fac:	00158593          	addi	a1,a1,1
    80008fb0:	fed78fa3          	sb	a3,-1(a5)
    80008fb4:	fee798e3          	bne	a5,a4,80008fa4 <__memmove+0x160>
    80008fb8:	f89ff06f          	j	80008f40 <__memmove+0xfc>
	...
