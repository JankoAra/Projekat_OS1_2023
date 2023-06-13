
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
    8000001c:	6c9060ef          	jal	ra,80006ee4 <start>

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
    80001184:	3d5000ef          	jal	ra,80001d58 <interruptRoutine>

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
    80001738:	560080e7          	jalr	1376(ra) # 80005c94 <_Z11printStringPKc>
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
    8000175c:	53c080e7          	jalr	1340(ra) # 80005c94 <_Z11printStringPKc>
	printString("CONSOLE_STATUS = ");
    80001760:	00008517          	auipc	a0,0x8
    80001764:	8d050513          	addi	a0,a0,-1840 # 80009030 <CONSOLE_STATUS+0x20>
    80001768:	00004097          	auipc	ra,0x4
    8000176c:	52c080e7          	jalr	1324(ra) # 80005c94 <_Z11printStringPKc>
	printInteger((uint64)sr);
    80001770:	0104b503          	ld	a0,16(s1)
    80001774:	00000097          	auipc	ra,0x0
    80001778:	224080e7          	jalr	548(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    8000177c:	00008517          	auipc	a0,0x8
    80001780:	e0450513          	addi	a0,a0,-508 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80001784:	00004097          	auipc	ra,0x4
    80001788:	510080e7          	jalr	1296(ra) # 80005c94 <_Z11printStringPKc>
	printString("*CONSOLE_RX = ");
    8000178c:	00008517          	auipc	a0,0x8
    80001790:	8bc50513          	addi	a0,a0,-1860 # 80009048 <CONSOLE_STATUS+0x38>
    80001794:	00004097          	auipc	ra,0x4
    80001798:	500080e7          	jalr	1280(ra) # 80005c94 <_Z11printStringPKc>
	printInteger(*dr);
    8000179c:	0084b783          	ld	a5,8(s1)
    800017a0:	0007c503          	lbu	a0,0(a5)
    800017a4:	00000097          	auipc	ra,0x0
    800017a8:	1f4080e7          	jalr	500(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    800017ac:	00008517          	auipc	a0,0x8
    800017b0:	dd450513          	addi	a0,a0,-556 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    800017b4:	00004097          	auipc	ra,0x4
    800017b8:	4e0080e7          	jalr	1248(ra) # 80005c94 <_Z11printStringPKc>
	printString("*CONSOLE_STATUS = ");
    800017bc:	00008517          	auipc	a0,0x8
    800017c0:	89c50513          	addi	a0,a0,-1892 # 80009058 <CONSOLE_STATUS+0x48>
    800017c4:	00004097          	auipc	ra,0x4
    800017c8:	4d0080e7          	jalr	1232(ra) # 80005c94 <_Z11printStringPKc>
	printInteger(*sr);
    800017cc:	0104b783          	ld	a5,16(s1)
    800017d0:	0007c503          	lbu	a0,0(a5)
    800017d4:	00000097          	auipc	ra,0x0
    800017d8:	1c4080e7          	jalr	452(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    800017dc:	00008517          	auipc	a0,0x8
    800017e0:	da450513          	addi	a0,a0,-604 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    800017e4:	00004097          	auipc	ra,0x4
    800017e8:	4b0080e7          	jalr	1200(ra) # 80005c94 <_Z11printStringPKc>
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
//Scheduler* Scheduler::singleton = nullptr;
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
    80001a68:	02a7bc23          	sd	a0,56(a5)
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
    80001aac:	03853783          	ld	a5,56(a0)
    80001ab0:	00f73423          	sd	a5,8(a4)
	if (head == nullptr) {
    80001ab4:	00078a63          	beqz	a5,80001ac8 <_ZN9Scheduler3getEv+0x34>
		tail = head = nullptr;
	}
	firstThread->nextInScheduler = nullptr;
    80001ab8:	02053c23          	sd	zero,56(a0)
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
	if (sleepingHead == nullptr) {
    80001ae0:	0000a817          	auipc	a6,0xa
    80001ae4:	10083803          	ld	a6,256(a6) # 8000bbe0 <_ZN9Scheduler12sleepingHeadE>
    80001ae8:	02080863          	beqz	a6,80001b18 <_ZN9Scheduler10putToSleepEP3TCBm+0x44>
		tcb->timeToSleep = sleepTime;
		return;
	}
	TCB* prevSleeping = nullptr;
	time_t accumulated = 0;
	TCB* current = sleepingHead;
    80001aec:	00080793          	mv	a5,a6
	time_t accumulated = 0;
    80001af0:	00000693          	li	a3,0
	TCB* prevSleeping = nullptr;
    80001af4:	00000613          	li	a2,0
	for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
    80001af8:	02078863          	beqz	a5,80001b28 <_ZN9Scheduler10putToSleepEP3TCBm+0x54>
    80001afc:	0407b703          	ld	a4,64(a5)
    80001b00:	00d70733          	add	a4,a4,a3
    80001b04:	02b77263          	bgeu	a4,a1,80001b28 <_ZN9Scheduler10putToSleepEP3TCBm+0x54>
		accumulated += current->timeToSleep;
    80001b08:	00070693          	mv	a3,a4
		prevSleeping = current;
    80001b0c:	00078613          	mv	a2,a5
	for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
    80001b10:	0487b783          	ld	a5,72(a5)
    80001b14:	fe5ff06f          	j	80001af8 <_ZN9Scheduler10putToSleepEP3TCBm+0x24>
		sleepingHead = tcb;
    80001b18:	0000a797          	auipc	a5,0xa
    80001b1c:	0ca7b423          	sd	a0,200(a5) # 8000bbe0 <_ZN9Scheduler12sleepingHeadE>
		tcb->timeToSleep = sleepTime;
    80001b20:	04b53023          	sd	a1,64(a0)
		return;
    80001b24:	02c0006f          	j	80001b50 <_ZN9Scheduler10putToSleepEP3TCBm+0x7c>
	}
	if (!prevSleeping) {
    80001b28:	02060a63          	beqz	a2,80001b5c <_ZN9Scheduler10putToSleepEP3TCBm+0x88>
		sleepingHead = tcb;
		tcb->timeToSleep = sleepTime;
		tcb->nextSleeping->timeToSleep -= sleepTime;
		return;
	}
	tcb->nextSleeping = current;
    80001b2c:	04f53423          	sd	a5,72(a0)
	prevSleeping->nextSleeping = tcb;
    80001b30:	04a63423          	sd	a0,72(a2)
	tcb->timeToSleep = sleepTime - accumulated;
    80001b34:	40d58733          	sub	a4,a1,a3
    80001b38:	04e53023          	sd	a4,64(a0)
	if (current) current->timeToSleep -= sleepTime - accumulated;
    80001b3c:	00078a63          	beqz	a5,80001b50 <_ZN9Scheduler10putToSleepEP3TCBm+0x7c>
    80001b40:	40b686b3          	sub	a3,a3,a1
    80001b44:	0407b703          	ld	a4,64(a5)
    80001b48:	00d706b3          	add	a3,a4,a3
    80001b4c:	04d7b023          	sd	a3,64(a5)
}
    80001b50:	00813403          	ld	s0,8(sp)
    80001b54:	01010113          	addi	sp,sp,16
    80001b58:	00008067          	ret
		tcb->nextSleeping = sleepingHead;
    80001b5c:	05053423          	sd	a6,72(a0)
		sleepingHead = tcb;
    80001b60:	0000a797          	auipc	a5,0xa
    80001b64:	08a7b023          	sd	a0,128(a5) # 8000bbe0 <_ZN9Scheduler12sleepingHeadE>
		tcb->timeToSleep = sleepTime;
    80001b68:	04b53023          	sd	a1,64(a0)
		tcb->nextSleeping->timeToSleep -= sleepTime;
    80001b6c:	04083683          	ld	a3,64(a6)
    80001b70:	40b686b3          	sub	a3,a3,a1
    80001b74:	04d83023          	sd	a3,64(a6)
		return;
    80001b78:	fd9ff06f          	j	80001b50 <_ZN9Scheduler10putToSleepEP3TCBm+0x7c>

0000000080001b7c <_ZN9Scheduler4wakeEv>:

void Scheduler::wake() {
	if (!sleepingHead) return;
    80001b7c:	0000a797          	auipc	a5,0xa
    80001b80:	0647b783          	ld	a5,100(a5) # 8000bbe0 <_ZN9Scheduler12sleepingHeadE>
    80001b84:	06078a63          	beqz	a5,80001bf8 <_ZN9Scheduler4wakeEv+0x7c>
	sleepingHead->timeToSleep--;
    80001b88:	0407b703          	ld	a4,64(a5)
    80001b8c:	fff70713          	addi	a4,a4,-1
    80001b90:	04e7b023          	sd	a4,64(a5)
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001b94:	0000a517          	auipc	a0,0xa
    80001b98:	04c53503          	ld	a0,76(a0) # 8000bbe0 <_ZN9Scheduler12sleepingHeadE>
    80001b9c:	04050e63          	beqz	a0,80001bf8 <_ZN9Scheduler4wakeEv+0x7c>
    80001ba0:	04053783          	ld	a5,64(a0)
    80001ba4:	04079a63          	bnez	a5,80001bf8 <_ZN9Scheduler4wakeEv+0x7c>
void Scheduler::wake() {
    80001ba8:	ff010113          	addi	sp,sp,-16
    80001bac:	00113423          	sd	ra,8(sp)
    80001bb0:	00813023          	sd	s0,0(sp)
    80001bb4:	01010413          	addi	s0,sp,16
    80001bb8:	00c0006f          	j	80001bc4 <_ZN9Scheduler4wakeEv+0x48>
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001bbc:	04053783          	ld	a5,64(a0)
    80001bc0:	02079463          	bnez	a5,80001be8 <_ZN9Scheduler4wakeEv+0x6c>
		TCB* thread = sleepingHead;
		sleepingHead = sleepingHead->nextSleeping;
    80001bc4:	04853783          	ld	a5,72(a0)
    80001bc8:	0000a717          	auipc	a4,0xa
    80001bcc:	00f73c23          	sd	a5,24(a4) # 8000bbe0 <_ZN9Scheduler12sleepingHeadE>
		thread->nextSleeping = nullptr;
    80001bd0:	04053423          	sd	zero,72(a0)
		Scheduler::put(thread);
    80001bd4:	00000097          	auipc	ra,0x0
    80001bd8:	e7c080e7          	jalr	-388(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001bdc:	0000a517          	auipc	a0,0xa
    80001be0:	00453503          	ld	a0,4(a0) # 8000bbe0 <_ZN9Scheduler12sleepingHeadE>
    80001be4:	fc051ce3          	bnez	a0,80001bbc <_ZN9Scheduler4wakeEv+0x40>
	}
}
    80001be8:	00813083          	ld	ra,8(sp)
    80001bec:	00013403          	ld	s0,0(sp)
    80001bf0:	01010113          	addi	sp,sp,16
    80001bf4:	00008067          	ret
    80001bf8:	00008067          	ret

0000000080001bfc <_Z4idlePv>:

extern "C" void interruptHandler();

void userMain();

void idle(void*) {
    80001bfc:	ff010113          	addi	sp,sp,-16
    80001c00:	00113423          	sd	ra,8(sp)
    80001c04:	00813023          	sd	s0,0(sp)
    80001c08:	01010413          	addi	s0,sp,16
    while (1) { thread_dispatch(); }
    80001c0c:	00000097          	auipc	ra,0x0
    80001c10:	81c080e7          	jalr	-2020(ra) # 80001428 <_Z15thread_dispatchv>
    80001c14:	ff9ff06f          	j	80001c0c <_Z4idlePv+0x10>

0000000080001c18 <_Z22kernelConsumerFunctionPv>:
}

void kernelConsumerFunction(void*) {
    80001c18:	ff010113          	addi	sp,sp,-16
    80001c1c:	00113423          	sd	ra,8(sp)
    80001c20:	00813023          	sd	s0,0(sp)
    80001c24:	01010413          	addi	s0,sp,16
    80001c28:	0280006f          	j	80001c50 <_Z22kernelConsumerFunctionPv+0x38>
    while (1) {
        char c = KConsole::getFromOutput();
        while (!(*KConsole::sr & CONSOLE_TX_STATUS_BIT)) {}
        *KConsole::dr = c;
    80001c2c:	0000a797          	auipc	a5,0xa
    80001c30:	e647b783          	ld	a5,-412(a5) # 8000ba90 <_GLOBAL_OFFSET_TABLE_+0x48>
    80001c34:	0007b783          	ld	a5,0(a5)
    80001c38:	00a78023          	sb	a0,0(a5)
        sem_signal(KConsole::outputBufferHasSpace);
    80001c3c:	0000a797          	auipc	a5,0xa
    80001c40:	e5c7b783          	ld	a5,-420(a5) # 8000ba98 <_GLOBAL_OFFSET_TABLE_+0x50>
    80001c44:	0007b503          	ld	a0,0(a5)
    80001c48:	00000097          	auipc	ra,0x0
    80001c4c:	8f0080e7          	jalr	-1808(ra) # 80001538 <_Z10sem_signalP4KSem>
        char c = KConsole::getFromOutput();
    80001c50:	00000097          	auipc	ra,0x0
    80001c54:	bb0080e7          	jalr	-1104(ra) # 80001800 <_ZN8KConsole13getFromOutputEv>
        while (!(*KConsole::sr & CONSOLE_TX_STATUS_BIT)) {}
    80001c58:	0000a797          	auipc	a5,0xa
    80001c5c:	e707b783          	ld	a5,-400(a5) # 8000bac8 <_GLOBAL_OFFSET_TABLE_+0x80>
    80001c60:	0007b783          	ld	a5,0(a5)
    80001c64:	0007c783          	lbu	a5,0(a5)
    80001c68:	0207f793          	andi	a5,a5,32
    80001c6c:	fe0786e3          	beqz	a5,80001c58 <_Z22kernelConsumerFunctionPv+0x40>
    80001c70:	fbdff06f          	j	80001c2c <_Z22kernelConsumerFunctionPv+0x14>

0000000080001c74 <main>:
    }

}

int main() {
    80001c74:	fd010113          	addi	sp,sp,-48
    80001c78:	02113423          	sd	ra,40(sp)
    80001c7c:	02813023          	sd	s0,32(sp)
    80001c80:	03010413          	addi	s0,sp,48
    //postavi adresu prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80001c84:	0000a797          	auipc	a5,0xa
    80001c88:	e2c7b783          	ld	a5,-468(a5) # 8000bab0 <_GLOBAL_OFFSET_TABLE_+0x68>
    80001c8c:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    MemoryAllocator::initMemoryAllocator();
    80001c90:	00001097          	auipc	ra,0x1
    80001c94:	630080e7          	jalr	1584(ra) # 800032c0 <_ZN15MemoryAllocator19initMemoryAllocatorEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    80001c98:	00000097          	auipc	ra,0x0
    80001c9c:	9c8080e7          	jalr	-1592(ra) # 80001660 <_ZN8KConsole12initKConsoleEv>
    //pravljenje niti
    thread_t mainHandle;
    thread_t userHandle;
    thread_t idleHandle;
    thread_t consoleOutputHandle;
    thread_create(&mainHandle, nullptr, nullptr);
    80001ca0:	00000613          	li	a2,0
    80001ca4:	00000593          	li	a1,0
    80001ca8:	fe840513          	addi	a0,s0,-24
    80001cac:	fffff097          	auipc	ra,0xfffff
    80001cb0:	6d4080e7          	jalr	1748(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::running = mainHandle;
    80001cb4:	0000a797          	auipc	a5,0xa
    80001cb8:	dec7b783          	ld	a5,-532(a5) # 8000baa0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001cbc:	fe843703          	ld	a4,-24(s0)
    80001cc0:	00e7b023          	sd	a4,0(a5)
    thread_create(&userHandle, (TCB::Body) userMain, nullptr);
    80001cc4:	00000613          	li	a2,0
    80001cc8:	0000a597          	auipc	a1,0xa
    80001ccc:	d885b583          	ld	a1,-632(a1) # 8000ba50 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001cd0:	fe040513          	addi	a0,s0,-32
    80001cd4:	fffff097          	auipc	ra,0xfffff
    80001cd8:	6ac080e7          	jalr	1708(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&consoleOutputHandle, kernelConsumerFunction, nullptr);
    80001cdc:	00000613          	li	a2,0
    80001ce0:	00000597          	auipc	a1,0x0
    80001ce4:	f3858593          	addi	a1,a1,-200 # 80001c18 <_Z22kernelConsumerFunctionPv>
    80001ce8:	fd040513          	addi	a0,s0,-48
    80001cec:	fffff097          	auipc	ra,0xfffff
    80001cf0:	694080e7          	jalr	1684(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&idleHandle, idle, nullptr);
    80001cf4:	00000613          	li	a2,0
    80001cf8:	00000597          	auipc	a1,0x0
    80001cfc:	f0458593          	addi	a1,a1,-252 # 80001bfc <_Z4idlePv>
    80001d00:	fd840513          	addi	a0,s0,-40
    80001d04:	fffff097          	auipc	ra,0xfffff
    80001d08:	67c080e7          	jalr	1660(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
inline void Riscv::w_sip(uint64 sip) {
	__asm__ volatile("csrw sip, %[sip]": :[sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80001d0c:	00200793          	li	a5,2
    80001d10:	1007a073          	csrs	sstatus,a5

    //omogucavanje prekida
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    //cekanje da se userMain zavrsi
    thread_join(userHandle);
    80001d14:	fe043503          	ld	a0,-32(s0)
    80001d18:	fffff097          	auipc	ra,0xfffff
    80001d1c:	730080e7          	jalr	1840(ra) # 80001448 <_Z11thread_joinP3TCB>

    //printString("\nSad cu da izadjem\n");

    //flush output bafera za konzolu
    while (KConsole::outputHead != KConsole::outputTail) {}
    80001d20:	0000a797          	auipc	a5,0xa
    80001d24:	d607b783          	ld	a5,-672(a5) # 8000ba80 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001d28:	0007a703          	lw	a4,0(a5)
    80001d2c:	0000a797          	auipc	a5,0xa
    80001d30:	d947b783          	ld	a5,-620(a5) # 8000bac0 <_GLOBAL_OFFSET_TABLE_+0x78>
    80001d34:	0007a783          	lw	a5,0(a5)
    80001d38:	fef714e3          	bne	a4,a5,80001d20 <main+0xac>
}

inline void Riscv::mc_sstatus(uint64 mask) {
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80001d3c:	00200793          	li	a5,2
    80001d40:	1007b073          	csrc	sstatus,a5
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    return 0;


    80001d44:	00000513          	li	a0,0
    80001d48:	02813083          	ld	ra,40(sp)
    80001d4c:	02013403          	ld	s0,32(sp)
    80001d50:	03010113          	addi	sp,sp,48
    80001d54:	00008067          	ret

0000000080001d58 <interruptRoutine>:
#include "../test/printing.hpp"

//void printInteger(int i);

#pragma GCC optimize("O0")
extern "C" void interruptRoutine() {
    80001d58:	f8010113          	addi	sp,sp,-128
    80001d5c:	06113c23          	sd	ra,120(sp)
    80001d60:	06813823          	sd	s0,112(sp)
    80001d64:	06913423          	sd	s1,104(sp)
    80001d68:	08010413          	addi	s0,sp,128
    //bitni sistemski registri
    uint64 scause, sepc, sstatus;
    __asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001d6c:	14202373          	csrr	t1,scause
    80001d70:	fc643c23          	sd	t1,-40(s0)
    __asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001d74:	14102373          	csrr	t1,sepc
    80001d78:	fc643823          	sd	t1,-48(s0)
    __asm__ volatile("csrr %[stat], sstatus":[stat] "=r"(sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001d7c:	10002373          	csrr	t1,sstatus
    80001d80:	fc643423          	sd	t1,-56(s0)

    //argumenti preneti sistemskom pozivu
    uint64 a0, a1, a2, a3, a4, a5, a6, a7;
    __asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001d84:	00050313          	mv	t1,a0
    80001d88:	fc643023          	sd	t1,-64(s0)
    __asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001d8c:	00058313          	mv	t1,a1
    80001d90:	fa643c23          	sd	t1,-72(s0)
    __asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001d94:	00060313          	mv	t1,a2
    80001d98:	fa643823          	sd	t1,-80(s0)
    __asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001d9c:	00068313          	mv	t1,a3
    80001da0:	fa643423          	sd	t1,-88(s0)
    __asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001da4:	00070313          	mv	t1,a4
    80001da8:	fa643023          	sd	t1,-96(s0)
    __asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001dac:	00078313          	mv	t1,a5
    80001db0:	f8643c23          	sd	t1,-104(s0)
    __asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001db4:	00080313          	mv	t1,a6
    80001db8:	f8643823          	sd	t1,-112(s0)
    __asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001dbc:	00088313          	mv	t1,a7
    80001dc0:	f8643423          	sd	t1,-120(s0)

    if (scause == 0x9 || scause == 0x8) {
    80001dc4:	fd843703          	ld	a4,-40(s0)
    80001dc8:	00900793          	li	a5,9
    80001dcc:	00f70863          	beq	a4,a5,80001ddc <interruptRoutine+0x84>
    80001dd0:	fd843703          	ld	a4,-40(s0)
    80001dd4:	00800793          	li	a5,8
    80001dd8:	36f71263          	bne	a4,a5,8000213c <interruptRoutine+0x3e4>
        //prekid zbog poziva ecall
        switch (a0) {
    80001ddc:	fc043703          	ld	a4,-64(s0)
    80001de0:	09100793          	li	a5,145
    80001de4:	2cf70663          	beq	a4,a5,800020b0 <interruptRoutine+0x358>
    80001de8:	fc043703          	ld	a4,-64(s0)
    80001dec:	09100793          	li	a5,145
    80001df0:	2ce7e863          	bltu	a5,a4,800020c0 <interruptRoutine+0x368>
    80001df4:	fc043703          	ld	a4,-64(s0)
    80001df8:	08100793          	li	a5,129
    80001dfc:	2af70063          	beq	a4,a5,8000209c <interruptRoutine+0x344>
    80001e00:	fc043703          	ld	a4,-64(s0)
    80001e04:	08100793          	li	a5,129
    80001e08:	2ae7ec63          	bltu	a5,a4,800020c0 <interruptRoutine+0x368>
    80001e0c:	fc043703          	ld	a4,-64(s0)
    80001e10:	04200793          	li	a5,66
    80001e14:	04e7e263          	bltu	a5,a4,80001e58 <interruptRoutine+0x100>
    80001e18:	fc043783          	ld	a5,-64(s0)
    80001e1c:	2a078263          	beqz	a5,800020c0 <interruptRoutine+0x368>
    80001e20:	fc043703          	ld	a4,-64(s0)
    80001e24:	04200793          	li	a5,66
    80001e28:	28e7ec63          	bltu	a5,a4,800020c0 <interruptRoutine+0x368>
    80001e2c:	fc043783          	ld	a5,-64(s0)
    80001e30:	00279713          	slli	a4,a5,0x2
    80001e34:	00007797          	auipc	a5,0x7
    80001e38:	2c078793          	addi	a5,a5,704 # 800090f4 <_ZZ9kPrintIntmE6digits+0x84>
    80001e3c:	00f707b3          	add	a5,a4,a5
    80001e40:	0007a783          	lw	a5,0(a5)
    80001e44:	0007871b          	sext.w	a4,a5
    80001e48:	00007797          	auipc	a5,0x7
    80001e4c:	2ac78793          	addi	a5,a5,684 # 800090f4 <_ZZ9kPrintIntmE6digits+0x84>
    80001e50:	00f707b3          	add	a5,a4,a5
    80001e54:	00078067          	jr	a5
    80001e58:	fc043703          	ld	a4,-64(s0)
    80001e5c:	08000793          	li	a5,128
    80001e60:	1ef70863          	beq	a4,a5,80002050 <interruptRoutine+0x2f8>
    80001e64:	25c0006f          	j	800020c0 <interruptRoutine+0x368>
            case 0x01:
                //mem_alloc
                //a1 = broj blokova koje treba alocirati
                MemoryAllocator::kmalloc((size_t)a1 * MEM_BLOCK_SIZE);
    80001e68:	fb843783          	ld	a5,-72(s0)
    80001e6c:	00679793          	slli	a5,a5,0x6
    80001e70:	00300593          	li	a1,3
    80001e74:	00078513          	mv	a0,a5
    80001e78:	00001097          	auipc	ra,0x1
    80001e7c:	e60080e7          	jalr	-416(ra) # 80002cd8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
                __asm__ volatile("sd a0, 80(s0)");
    80001e80:	04a43823          	sd	a0,80(s0)
                break;
    80001e84:	2980006f          	j	8000211c <interruptRoutine+0x3c4>
            case 0x02:
                //mem_free
                //a1 = pokazivac na memoriju koju dealociramo, dobijen sa mem_alloc
                MemoryAllocator::kfree((void*)a1);
    80001e88:	fb843783          	ld	a5,-72(s0)
    80001e8c:	00078513          	mv	a0,a5
    80001e90:	00001097          	auipc	ra,0x1
    80001e94:	0f0080e7          	jalr	240(ra) # 80002f80 <_ZN15MemoryAllocator5kfreeEPv>
                __asm__ volatile("sd a0, 80(s0)");
    80001e98:	04a43823          	sd	a0,80(s0)
                break;
    80001e9c:	2800006f          	j	8000211c <interruptRoutine+0x3c4>
                //thread_create
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    80001ea0:	fb043783          	ld	a5,-80(s0)
    80001ea4:	fa843703          	ld	a4,-88(s0)
    80001ea8:	fa043683          	ld	a3,-96(s0)
    80001eac:	fb843483          	ld	s1,-72(s0)
    80001eb0:	00068613          	mv	a2,a3
    80001eb4:	00070593          	mv	a1,a4
    80001eb8:	00078513          	mv	a0,a5
    80001ebc:	00001097          	auipc	ra,0x1
    80001ec0:	c48080e7          	jalr	-952(ra) # 80002b04 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80001ec4:	00050793          	mv	a5,a0
    80001ec8:	00f4b023          	sd	a5,0(s1)
                TCB::start(*((thread_t*)a1));
    80001ecc:	fb843783          	ld	a5,-72(s0)
    80001ed0:	0007b783          	ld	a5,0(a5)
    80001ed4:	00078513          	mv	a0,a5
    80001ed8:	00001097          	auipc	ra,0x1
    80001edc:	dac080e7          	jalr	-596(ra) # 80002c84 <_ZN3TCB5startEPS_>
                if (*((thread_t*)a1) != nullptr) {
    80001ee0:	fb843783          	ld	a5,-72(s0)
    80001ee4:	0007b783          	ld	a5,0(a5)
    80001ee8:	00078663          	beqz	a5,80001ef4 <interruptRoutine+0x19c>
                    __asm__ volatile("li a0, 0");
    80001eec:	00000513          	li	a0,0
    80001ef0:	0080006f          	j	80001ef8 <interruptRoutine+0x1a0>
                } else {
                    __asm__ volatile("li a0, -1");
    80001ef4:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80001ef8:	04a43823          	sd	a0,80(s0)
                break;
    80001efc:	2200006f          	j	8000211c <interruptRoutine+0x3c4>
            case 0x12:
                //thread_exit
                TCB::running->setFinished(true);
    80001f00:	0000a797          	auipc	a5,0xa
    80001f04:	ba07b783          	ld	a5,-1120(a5) # 8000baa0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001f08:	0007b783          	ld	a5,0(a5)
    80001f0c:	00100593          	li	a1,1
    80001f10:	00078513          	mv	a0,a5
    80001f14:	00000097          	auipc	ra,0x0
    80001f18:	3e8080e7          	jalr	1000(ra) # 800022fc <_ZN3TCB11setFinishedEb>
                TCB::releaseJoined();
    80001f1c:	00001097          	auipc	ra,0x1
    80001f20:	d0c080e7          	jalr	-756(ra) # 80002c28 <_ZN3TCB13releaseJoinedEv>
                TCB::yield();
    80001f24:	00001097          	auipc	ra,0x1
    80001f28:	b80080e7          	jalr	-1152(ra) # 80002aa4 <_ZN3TCB5yieldEv>
                break;
    80001f2c:	1f00006f          	j	8000211c <interruptRoutine+0x3c4>
            case 0x13:
                //thread_dispatch
                TCB::yield();
    80001f30:	00001097          	auipc	ra,0x1
    80001f34:	b74080e7          	jalr	-1164(ra) # 80002aa4 <_ZN3TCB5yieldEv>
                break;
    80001f38:	1e40006f          	j	8000211c <interruptRoutine+0x3c4>
            case 0x14:
                //thread_join
                //a1 = rucka niti na koju tekuca nit treba da ceka
                TCB::threadJoin((thread_t)a1);
    80001f3c:	fb843783          	ld	a5,-72(s0)
    80001f40:	00078513          	mv	a0,a5
    80001f44:	00001097          	auipc	ra,0x1
    80001f48:	c9c080e7          	jalr	-868(ra) # 80002be0 <_ZN3TCB10threadJoinEPS_>
                TCB::yield();
    80001f4c:	00001097          	auipc	ra,0x1
    80001f50:	b58080e7          	jalr	-1192(ra) # 80002aa4 <_ZN3TCB5yieldEv>
                break;
    80001f54:	1c80006f          	j	8000211c <interruptRoutine+0x3c4>
            case 0x21:
                //sem_open
                //a1 = pokazivac na rucku semafora, u koju se upisuje adresa semafora u memoriji
                *((sem_t*)a1) = KSem::initSem((uint)a2);
    80001f58:	fb043783          	ld	a5,-80(s0)
    80001f5c:	0007879b          	sext.w	a5,a5
    80001f60:	fb843483          	ld	s1,-72(s0)
    80001f64:	00078513          	mv	a0,a5
    80001f68:	00001097          	auipc	ra,0x1
    80001f6c:	45c080e7          	jalr	1116(ra) # 800033c4 <_ZN4KSem7initSemEj>
    80001f70:	00050793          	mv	a5,a0
    80001f74:	00f4b023          	sd	a5,0(s1)
                if (*((sem_t*)a1) != nullptr) {
    80001f78:	fb843783          	ld	a5,-72(s0)
    80001f7c:	0007b783          	ld	a5,0(a5)
    80001f80:	00078663          	beqz	a5,80001f8c <interruptRoutine+0x234>
                    __asm__ volatile("li a0, 0");
    80001f84:	00000513          	li	a0,0
    80001f88:	0080006f          	j	80001f90 <interruptRoutine+0x238>
                } else {
                    __asm__ volatile("li a0, -1");
    80001f8c:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80001f90:	04a43823          	sd	a0,80(s0)
                break;
    80001f94:	1880006f          	j	8000211c <interruptRoutine+0x3c4>
            case 0x22:
                //sem_close
                //a1 = rucka semafora
                KSem::closeSem((sem_t)a1);
    80001f98:	fb843783          	ld	a5,-72(s0)
    80001f9c:	00078513          	mv	a0,a5
    80001fa0:	00001097          	auipc	ra,0x1
    80001fa4:	59c080e7          	jalr	1436(ra) # 8000353c <_ZN4KSem8closeSemEPS_>
                __asm__ volatile("sd a0, 80(s0)");
    80001fa8:	04a43823          	sd	a0,80(s0)
                break;
    80001fac:	1700006f          	j	8000211c <interruptRoutine+0x3c4>
            case 0x23:
                //sem_wait
                //a1 = rucka semafora
                ((sem_t)a1)->wait();
    80001fb0:	fb843783          	ld	a5,-72(s0)
    80001fb4:	00078513          	mv	a0,a5
    80001fb8:	00001097          	auipc	ra,0x1
    80001fbc:	4a0080e7          	jalr	1184(ra) # 80003458 <_ZN4KSem4waitEv>
                __asm__ volatile("sd a0, 80(s0)");
    80001fc0:	04a43823          	sd	a0,80(s0)
                break;
    80001fc4:	1580006f          	j	8000211c <interruptRoutine+0x3c4>
            case 0x24:
                //sem_signal
                //a1 = rucka semafora
                ((sem_t)a1)->signal();
    80001fc8:	fb843783          	ld	a5,-72(s0)
    80001fcc:	00078513          	mv	a0,a5
    80001fd0:	00001097          	auipc	ra,0x1
    80001fd4:	518080e7          	jalr	1304(ra) # 800034e8 <_ZN4KSem6signalEv>
                __asm__ volatile("sd a0, 80(s0)");
    80001fd8:	04a43823          	sd	a0,80(s0)
                break;
    80001fdc:	1400006f          	j	8000211c <interruptRoutine+0x3c4>
            case 0x31:
                //time_sleep
                //a1 = broj perioda tajmera na koji se uspavljuje tekuca nit
                if ((time_t)a1 > 0) {
    80001fe0:	fb843783          	ld	a5,-72(s0)
    80001fe4:	00078663          	beqz	a5,80001ff0 <interruptRoutine+0x298>
                    __asm__ volatile("li a0, 0");
    80001fe8:	00000513          	li	a0,0
    80001fec:	0080006f          	j	80001ff4 <interruptRoutine+0x29c>
                } else {
                    __asm__ volatile("li a0, -1");
    80001ff0:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80001ff4:	04a43823          	sd	a0,80(s0)
                if ((time_t)a1 > 0) {
    80001ff8:	fb843783          	ld	a5,-72(s0)
    80001ffc:	10078e63          	beqz	a5,80002118 <interruptRoutine+0x3c0>
                    Scheduler::putToSleep(TCB::running, (time_t)a1);
    80002000:	0000a797          	auipc	a5,0xa
    80002004:	aa07b783          	ld	a5,-1376(a5) # 8000baa0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002008:	0007b783          	ld	a5,0(a5)
    8000200c:	fb843583          	ld	a1,-72(s0)
    80002010:	00078513          	mv	a0,a5
    80002014:	00000097          	auipc	ra,0x0
    80002018:	ac0080e7          	jalr	-1344(ra) # 80001ad4 <_ZN9Scheduler10putToSleepEP3TCBm>
                    TCB::yield();
    8000201c:	00001097          	auipc	ra,0x1
    80002020:	a88080e7          	jalr	-1400(ra) # 80002aa4 <_ZN3TCB5yieldEv>
                }
                break;
    80002024:	0f40006f          	j	80002118 <interruptRoutine+0x3c0>
            case 0x41:
                //getc
                KConsole::kgetc();
    80002028:	00000097          	auipc	ra,0x0
    8000202c:	90c080e7          	jalr	-1780(ra) # 80001934 <_ZN8KConsole5kgetcEv>
                __asm__ volatile("sd a0, 80(s0)");
    80002030:	04a43823          	sd	a0,80(s0)
                break;
    80002034:	0e80006f          	j	8000211c <interruptRoutine+0x3c4>
            case 0x42:
                //putc
                //a1 = karakter koji se upisuje u bafer za ispis na konzolu
                KConsole::kputc((char)a1);
    80002038:	fb843783          	ld	a5,-72(s0)
    8000203c:	0ff7f793          	andi	a5,a5,255
    80002040:	00078513          	mv	a0,a5
    80002044:	00000097          	auipc	ra,0x0
    80002048:	880080e7          	jalr	-1920(ra) # 800018c4 <_ZN8KConsole5kputcEc>
                break;
    8000204c:	0d00006f          	j	8000211c <interruptRoutine+0x3c4>
                //alloc thread
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    80002050:	fb043783          	ld	a5,-80(s0)
    80002054:	fa843703          	ld	a4,-88(s0)
    80002058:	fa043683          	ld	a3,-96(s0)
    8000205c:	fb843483          	ld	s1,-72(s0)
    80002060:	00068613          	mv	a2,a3
    80002064:	00070593          	mv	a1,a4
    80002068:	00078513          	mv	a0,a5
    8000206c:	00001097          	auipc	ra,0x1
    80002070:	a98080e7          	jalr	-1384(ra) # 80002b04 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80002074:	00050793          	mv	a5,a0
    80002078:	00f4b023          	sd	a5,0(s1)
                if (*((thread_t*)a1) != nullptr) {
    8000207c:	fb843783          	ld	a5,-72(s0)
    80002080:	0007b783          	ld	a5,0(a5)
    80002084:	00078663          	beqz	a5,80002090 <interruptRoutine+0x338>
                    __asm__ volatile("li a0, 0");
    80002088:	00000513          	li	a0,0
    8000208c:	0080006f          	j	80002094 <interruptRoutine+0x33c>
                } else {
                    __asm__ volatile("li a0, -1");
    80002090:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80002094:	04a43823          	sd	a0,80(s0)
                break;
    80002098:	0840006f          	j	8000211c <interruptRoutine+0x3c4>
            case 0x81:
                //start thread
                //a1 = rucka niti koja se stavlja u scheduler
                Scheduler::put((thread_t)a1);
    8000209c:	fb843783          	ld	a5,-72(s0)
    800020a0:	00078513          	mv	a0,a5
    800020a4:	00000097          	auipc	ra,0x0
    800020a8:	9ac080e7          	jalr	-1620(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
                break;
    800020ac:	0700006f          	j	8000211c <interruptRoutine+0x3c4>
            case 0x91:
                //printInteger
                //a1 = integer za ispis
                kPrintInt(a1);
    800020b0:	fb843503          	ld	a0,-72(s0)
    800020b4:	00000097          	auipc	ra,0x0
    800020b8:	90c080e7          	jalr	-1780(ra) # 800019c0 <_Z9kPrintIntm>
                break;
    800020bc:	0600006f          	j	8000211c <interruptRoutine+0x3c4>
            default:
                printString("\nNepostojeci op code: ");
    800020c0:	00007517          	auipc	a0,0x7
    800020c4:	fc050513          	addi	a0,a0,-64 # 80009080 <_ZZ9kPrintIntmE6digits+0x10>
    800020c8:	00004097          	auipc	ra,0x4
    800020cc:	bcc080e7          	jalr	-1076(ra) # 80005c94 <_Z11printStringPKc>
                kPrintInt(a0);
    800020d0:	fc043503          	ld	a0,-64(s0)
    800020d4:	00000097          	auipc	ra,0x0
    800020d8:	8ec080e7          	jalr	-1812(ra) # 800019c0 <_Z9kPrintIntm>
                printString("\nscause: ");
    800020dc:	00007517          	auipc	a0,0x7
    800020e0:	fbc50513          	addi	a0,a0,-68 # 80009098 <_ZZ9kPrintIntmE6digits+0x28>
    800020e4:	00004097          	auipc	ra,0x4
    800020e8:	bb0080e7          	jalr	-1104(ra) # 80005c94 <_Z11printStringPKc>
                kPrintInt(scause);
    800020ec:	fd843503          	ld	a0,-40(s0)
    800020f0:	00000097          	auipc	ra,0x0
    800020f4:	8d0080e7          	jalr	-1840(ra) # 800019c0 <_Z9kPrintIntm>
                printString("\nsepc: ");
    800020f8:	00007517          	auipc	a0,0x7
    800020fc:	fb050513          	addi	a0,a0,-80 # 800090a8 <_ZZ9kPrintIntmE6digits+0x38>
    80002100:	00004097          	auipc	ra,0x4
    80002104:	b94080e7          	jalr	-1132(ra) # 80005c94 <_Z11printStringPKc>
                kPrintInt(sepc);
    80002108:	fd043503          	ld	a0,-48(s0)
    8000210c:	00000097          	auipc	ra,0x0
    80002110:	8b4080e7          	jalr	-1868(ra) # 800019c0 <_Z9kPrintIntm>
                break;
    80002114:	0080006f          	j	8000211c <interruptRoutine+0x3c4>
                break;
    80002118:	00000013          	nop
        }
        //sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
        sepc += 4;
    8000211c:	fd043783          	ld	a5,-48(s0)
    80002120:	00478793          	addi	a5,a5,4
    80002124:	fcf43823          	sd	a5,-48(s0)
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002128:	fd043783          	ld	a5,-48(s0)
    8000212c:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002130:	fc843783          	ld	a5,-56(s0)
    80002134:	10079073          	csrw	sstatus,a5
        printString("scause: ");
        kPrintInt(scause);
        printString("\nsepc: ");
        kPrintInt(sepc);
    }
}
    80002138:	1900006f          	j	800022c8 <interruptRoutine+0x570>
    } else if (scause == 0x8000000000000009) {
    8000213c:	fd843703          	ld	a4,-40(s0)
    80002140:	fff00793          	li	a5,-1
    80002144:	03f79793          	slli	a5,a5,0x3f
    80002148:	00978793          	addi	a5,a5,9
    8000214c:	08f71e63          	bne	a4,a5,800021e8 <interruptRoutine+0x490>
        uint64 irq = plic_claim();
    80002150:	00005097          	auipc	ra,0x5
    80002154:	5f4080e7          	jalr	1524(ra) # 80007744 <plic_claim>
    80002158:	00050793          	mv	a5,a0
    8000215c:	f8f43023          	sd	a5,-128(s0)
        if (irq == CONSOLE_IRQ) {
    80002160:	f8043703          	ld	a4,-128(s0)
    80002164:	00a00793          	li	a5,10
    80002168:	04f71863          	bne	a4,a5,800021b8 <interruptRoutine+0x460>
            if (*KConsole::sr & CONSOLE_RX_STATUS_BIT) {
    8000216c:	0000a797          	auipc	a5,0xa
    80002170:	95c7b783          	ld	a5,-1700(a5) # 8000bac8 <_GLOBAL_OFFSET_TABLE_+0x80>
    80002174:	0007b783          	ld	a5,0(a5)
    80002178:	0007c783          	lbu	a5,0(a5)
    8000217c:	0017f793          	andi	a5,a5,1
    80002180:	02078063          	beqz	a5,800021a0 <interruptRoutine+0x448>
                KConsole::placeInInput(*KConsole::dr);
    80002184:	0000a797          	auipc	a5,0xa
    80002188:	90c7b783          	ld	a5,-1780(a5) # 8000ba90 <_GLOBAL_OFFSET_TABLE_+0x48>
    8000218c:	0007b783          	ld	a5,0(a5)
    80002190:	0007c783          	lbu	a5,0(a5)
    80002194:	00078513          	mv	a0,a5
    80002198:	fffff097          	auipc	ra,0xfffff
    8000219c:	6c0080e7          	jalr	1728(ra) # 80001858 <_ZN8KConsole12placeInInputEc>
            plic_complete(irq);
    800021a0:	f8043783          	ld	a5,-128(s0)
    800021a4:	0007879b          	sext.w	a5,a5
    800021a8:	00078513          	mv	a0,a5
    800021ac:	00005097          	auipc	ra,0x5
    800021b0:	5d0080e7          	jalr	1488(ra) # 8000777c <plic_complete>
    800021b4:	0140006f          	j	800021c8 <interruptRoutine+0x470>
            printString("Neki drugi prekid\n");
    800021b8:	00007517          	auipc	a0,0x7
    800021bc:	ef850513          	addi	a0,a0,-264 # 800090b0 <_ZZ9kPrintIntmE6digits+0x40>
    800021c0:	00004097          	auipc	ra,0x4
    800021c4:	ad4080e7          	jalr	-1324(ra) # 80005c94 <_Z11printStringPKc>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    800021c8:	fd043783          	ld	a5,-48(s0)
    800021cc:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    800021d0:	fc843783          	ld	a5,-56(s0)
    800021d4:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SEIP);
    800021d8:	20000513          	li	a0,512
    800021dc:	00000097          	auipc	ra,0x0
    800021e0:	104080e7          	jalr	260(ra) # 800022e0 <_ZN5Riscv6mc_sipEm>
}
    800021e4:	0e40006f          	j	800022c8 <interruptRoutine+0x570>
    } else if (scause == 0x8000000000000001) {
    800021e8:	fd843703          	ld	a4,-40(s0)
    800021ec:	fff00793          	li	a5,-1
    800021f0:	03f79793          	slli	a5,a5,0x3f
    800021f4:	00178793          	addi	a5,a5,1
    800021f8:	08f71463          	bne	a4,a5,80002280 <interruptRoutine+0x528>
        Scheduler::wake();
    800021fc:	00000097          	auipc	ra,0x0
    80002200:	980080e7          	jalr	-1664(ra) # 80001b7c <_ZN9Scheduler4wakeEv>
        TCB::runningTimeSlice++;
    80002204:	0000a797          	auipc	a5,0xa
    80002208:	85c7b783          	ld	a5,-1956(a5) # 8000ba60 <_GLOBAL_OFFSET_TABLE_+0x18>
    8000220c:	0007b783          	ld	a5,0(a5)
    80002210:	00178713          	addi	a4,a5,1
    80002214:	0000a797          	auipc	a5,0xa
    80002218:	84c7b783          	ld	a5,-1972(a5) # 8000ba60 <_GLOBAL_OFFSET_TABLE_+0x18>
    8000221c:	00e7b023          	sd	a4,0(a5)
        if (TCB::runningTimeSlice >= TCB::running->getTimeSlice()) {
    80002220:	0000a797          	auipc	a5,0xa
    80002224:	8807b783          	ld	a5,-1920(a5) # 8000baa0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002228:	0007b783          	ld	a5,0(a5)
    8000222c:	00078513          	mv	a0,a5
    80002230:	00000097          	auipc	ra,0x0
    80002234:	0e8080e7          	jalr	232(ra) # 80002318 <_ZN3TCB12getTimeSliceEv>
    80002238:	00050713          	mv	a4,a0
    8000223c:	0000a797          	auipc	a5,0xa
    80002240:	8247b783          	ld	a5,-2012(a5) # 8000ba60 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002244:	0007b783          	ld	a5,0(a5)
    80002248:	00e7b7b3          	sltu	a5,a5,a4
    8000224c:	0017c793          	xori	a5,a5,1
    80002250:	0ff7f793          	andi	a5,a5,255
    80002254:	00078663          	beqz	a5,80002260 <interruptRoutine+0x508>
            TCB::yield();
    80002258:	00001097          	auipc	ra,0x1
    8000225c:	84c080e7          	jalr	-1972(ra) # 80002aa4 <_ZN3TCB5yieldEv>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002260:	fd043783          	ld	a5,-48(s0)
    80002264:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002268:	fc843783          	ld	a5,-56(s0)
    8000226c:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SSIP);
    80002270:	00200513          	li	a0,2
    80002274:	00000097          	auipc	ra,0x0
    80002278:	06c080e7          	jalr	108(ra) # 800022e0 <_ZN5Riscv6mc_sipEm>
}
    8000227c:	04c0006f          	j	800022c8 <interruptRoutine+0x570>
        printString("\nGreska u prekidnoj rutini\n");
    80002280:	00007517          	auipc	a0,0x7
    80002284:	e4850513          	addi	a0,a0,-440 # 800090c8 <_ZZ9kPrintIntmE6digits+0x58>
    80002288:	00004097          	auipc	ra,0x4
    8000228c:	a0c080e7          	jalr	-1524(ra) # 80005c94 <_Z11printStringPKc>
        printString("scause: ");
    80002290:	00007517          	auipc	a0,0x7
    80002294:	e5850513          	addi	a0,a0,-424 # 800090e8 <_ZZ9kPrintIntmE6digits+0x78>
    80002298:	00004097          	auipc	ra,0x4
    8000229c:	9fc080e7          	jalr	-1540(ra) # 80005c94 <_Z11printStringPKc>
        kPrintInt(scause);
    800022a0:	fd843503          	ld	a0,-40(s0)
    800022a4:	fffff097          	auipc	ra,0xfffff
    800022a8:	71c080e7          	jalr	1820(ra) # 800019c0 <_Z9kPrintIntm>
        printString("\nsepc: ");
    800022ac:	00007517          	auipc	a0,0x7
    800022b0:	dfc50513          	addi	a0,a0,-516 # 800090a8 <_ZZ9kPrintIntmE6digits+0x38>
    800022b4:	00004097          	auipc	ra,0x4
    800022b8:	9e0080e7          	jalr	-1568(ra) # 80005c94 <_Z11printStringPKc>
        kPrintInt(sepc);
    800022bc:	fd043503          	ld	a0,-48(s0)
    800022c0:	fffff097          	auipc	ra,0xfffff
    800022c4:	700080e7          	jalr	1792(ra) # 800019c0 <_Z9kPrintIntm>
}
    800022c8:	00000013          	nop
    800022cc:	07813083          	ld	ra,120(sp)
    800022d0:	07013403          	ld	s0,112(sp)
    800022d4:	06813483          	ld	s1,104(sp)
    800022d8:	08010113          	addi	sp,sp,128
    800022dc:	00008067          	ret

00000000800022e0 <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    800022e0:	ff010113          	addi	sp,sp,-16
    800022e4:	00813423          	sd	s0,8(sp)
    800022e8:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    800022ec:	14453073          	csrc	sip,a0
}
    800022f0:	00813403          	ld	s0,8(sp)
    800022f4:	01010113          	addi	sp,sp,16
    800022f8:	00008067          	ret

00000000800022fc <_ZN3TCB11setFinishedEb>:
	static TCB* createThread(Body function, void* args, uint64* stack);
	static void start(TCB* newTcb);

	bool isFinished() { return finished; }

	void setFinished(bool finish) { this->finished = finish; }
    800022fc:	ff010113          	addi	sp,sp,-16
    80002300:	00813423          	sd	s0,8(sp)
    80002304:	01010413          	addi	s0,sp,16
    80002308:	02b50823          	sb	a1,48(a0)
    8000230c:	00813403          	ld	s0,8(sp)
    80002310:	01010113          	addi	sp,sp,16
    80002314:	00008067          	ret

0000000080002318 <_ZN3TCB12getTimeSliceEv>:

	bool isBlocked() { return blocked; }

	void setBlocked(bool block) { this->blocked = block; }

	uint64 getTimeSlice() { return timeSlice; }
    80002318:	ff010113          	addi	sp,sp,-16
    8000231c:	00813423          	sd	s0,8(sp)
    80002320:	01010413          	addi	s0,sp,16
    80002324:	02853503          	ld	a0,40(a0)
    80002328:	00813403          	ld	s0,8(sp)
    8000232c:	01010113          	addi	sp,sp,16
    80002330:	00008067          	ret

0000000080002334 <_ZN6Thread7wrapperEPv>:

	__asm__ volatile("ecall");
}

void Thread::wrapper(void* thread) {
	if (thread != nullptr) {
    80002334:	02050863          	beqz	a0,80002364 <_ZN6Thread7wrapperEPv+0x30>
void Thread::wrapper(void* thread) {
    80002338:	ff010113          	addi	sp,sp,-16
    8000233c:	00113423          	sd	ra,8(sp)
    80002340:	00813023          	sd	s0,0(sp)
    80002344:	01010413          	addi	s0,sp,16
		((Thread*)thread)->run();
    80002348:	00053783          	ld	a5,0(a0)
    8000234c:	0107b783          	ld	a5,16(a5)
    80002350:	000780e7          	jalr	a5
	}
}
    80002354:	00813083          	ld	ra,8(sp)
    80002358:	00013403          	ld	s0,0(sp)
    8000235c:	01010113          	addi	sp,sp,16
    80002360:	00008067          	ret
    80002364:	00008067          	ret

0000000080002368 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    80002368:	fe010113          	addi	sp,sp,-32
    8000236c:	00113c23          	sd	ra,24(sp)
    80002370:	00813823          	sd	s0,16(sp)
    80002374:	00913423          	sd	s1,8(sp)
    80002378:	02010413          	addi	s0,sp,32
    8000237c:	00050493          	mv	s1,a0
    80002380:	00009797          	auipc	a5,0x9
    80002384:	4e078793          	addi	a5,a5,1248 # 8000b860 <_ZTV6Thread+0x10>
    80002388:	00f53023          	sd	a5,0(a0)
	thread_join(this->myHandle);
    8000238c:	00853503          	ld	a0,8(a0)
    80002390:	fffff097          	auipc	ra,0xfffff
    80002394:	0b8080e7          	jalr	184(ra) # 80001448 <_Z11thread_joinP3TCB>
	delete myHandle;
    80002398:	0084b483          	ld	s1,8(s1)
    8000239c:	02048863          	beqz	s1,800023cc <_ZN6ThreadD1Ev+0x64>
            delete node;
        }
    }

    bool isEmpty() const {
        bool ret = front == nullptr;
    800023a0:	0504b503          	ld	a0,80(s1)
        while (!isEmpty()) {
    800023a4:	00050e63          	beqz	a0,800023c0 <_ZN6ThreadD1Ev+0x58>
            front = front->next;
    800023a8:	00853783          	ld	a5,8(a0)
    800023ac:	04f4b823          	sd	a5,80(s1)
            delete node;
    800023b0:	fe0508e3          	beqz	a0,800023a0 <_ZN6ThreadD1Ev+0x38>
            mem_free(ptr);
    800023b4:	fffff097          	auipc	ra,0xfffff
    800023b8:	f9c080e7          	jalr	-100(ra) # 80001350 <_Z8mem_freePv>
        }
    800023bc:	fe5ff06f          	j	800023a0 <_ZN6ThreadD1Ev+0x38>
    800023c0:	00048513          	mv	a0,s1
    800023c4:	00000097          	auipc	ra,0x0
    800023c8:	7f4080e7          	jalr	2036(ra) # 80002bb8 <_ZN3TCBdlEPv>
}
    800023cc:	01813083          	ld	ra,24(sp)
    800023d0:	01013403          	ld	s0,16(sp)
    800023d4:	00813483          	ld	s1,8(sp)
    800023d8:	02010113          	addi	sp,sp,32
    800023dc:	00008067          	ret

00000000800023e0 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
	sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    800023e0:	fe010113          	addi	sp,sp,-32
    800023e4:	00113c23          	sd	ra,24(sp)
    800023e8:	00813823          	sd	s0,16(sp)
    800023ec:	00913423          	sd	s1,8(sp)
    800023f0:	02010413          	addi	s0,sp,32
    800023f4:	00050493          	mv	s1,a0
    800023f8:	00009797          	auipc	a5,0x9
    800023fc:	49078793          	addi	a5,a5,1168 # 8000b888 <_ZTV9Semaphore+0x10>
    80002400:	00f53023          	sd	a5,0(a0)
	sem_close(myHandle);
    80002404:	00853503          	ld	a0,8(a0)
    80002408:	fffff097          	auipc	ra,0xfffff
    8000240c:	0d0080e7          	jalr	208(ra) # 800014d8 <_Z9sem_closeP4KSem>
	delete myHandle;
    80002410:	0084b483          	ld	s1,8(s1)
    80002414:	02048863          	beqz	s1,80002444 <_ZN9SemaphoreD1Ev+0x64>
        bool ret = front == nullptr;
    80002418:	0084b503          	ld	a0,8(s1)
        while (!isEmpty()) {
    8000241c:	00050e63          	beqz	a0,80002438 <_ZN9SemaphoreD1Ev+0x58>
            front = front->next;
    80002420:	00853783          	ld	a5,8(a0)
    80002424:	00f4b423          	sd	a5,8(s1)
            delete node;
    80002428:	fe0508e3          	beqz	a0,80002418 <_ZN9SemaphoreD1Ev+0x38>
            mem_free(ptr);
    8000242c:	fffff097          	auipc	ra,0xfffff
    80002430:	f24080e7          	jalr	-220(ra) # 80001350 <_Z8mem_freePv>
        }
    80002434:	fe5ff06f          	j	80002418 <_ZN9SemaphoreD1Ev+0x38>
    80002438:	00048513          	mv	a0,s1
    8000243c:	00001097          	auipc	ra,0x1
    80002440:	f60080e7          	jalr	-160(ra) # 8000339c <_ZN4KSemdlEPv>
}
    80002444:	01813083          	ld	ra,24(sp)
    80002448:	01013403          	ld	s0,16(sp)
    8000244c:	00813483          	ld	s1,8(sp)
    80002450:	02010113          	addi	sp,sp,32
    80002454:	00008067          	ret

0000000080002458 <_Znwm>:
void* operator new(size_t size) {
    80002458:	ff010113          	addi	sp,sp,-16
    8000245c:	00113423          	sd	ra,8(sp)
    80002460:	00813023          	sd	s0,0(sp)
    80002464:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    80002468:	fffff097          	auipc	ra,0xfffff
    8000246c:	ea8080e7          	jalr	-344(ra) # 80001310 <_Z9mem_allocm>
}
    80002470:	00813083          	ld	ra,8(sp)
    80002474:	00013403          	ld	s0,0(sp)
    80002478:	01010113          	addi	sp,sp,16
    8000247c:	00008067          	ret

0000000080002480 <_Znam>:
void* operator new[](size_t size) {
    80002480:	ff010113          	addi	sp,sp,-16
    80002484:	00113423          	sd	ra,8(sp)
    80002488:	00813023          	sd	s0,0(sp)
    8000248c:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    80002490:	fffff097          	auipc	ra,0xfffff
    80002494:	e80080e7          	jalr	-384(ra) # 80001310 <_Z9mem_allocm>
}
    80002498:	00813083          	ld	ra,8(sp)
    8000249c:	00013403          	ld	s0,0(sp)
    800024a0:	01010113          	addi	sp,sp,16
    800024a4:	00008067          	ret

00000000800024a8 <_ZdlPv>:
noexcept {
    800024a8:	ff010113          	addi	sp,sp,-16
    800024ac:	00113423          	sd	ra,8(sp)
    800024b0:	00813023          	sd	s0,0(sp)
    800024b4:	01010413          	addi	s0,sp,16
mem_free(ptr);
    800024b8:	fffff097          	auipc	ra,0xfffff
    800024bc:	e98080e7          	jalr	-360(ra) # 80001350 <_Z8mem_freePv>
}
    800024c0:	00813083          	ld	ra,8(sp)
    800024c4:	00013403          	ld	s0,0(sp)
    800024c8:	01010113          	addi	sp,sp,16
    800024cc:	00008067          	ret

00000000800024d0 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    800024d0:	fe010113          	addi	sp,sp,-32
    800024d4:	00113c23          	sd	ra,24(sp)
    800024d8:	00813823          	sd	s0,16(sp)
    800024dc:	00913423          	sd	s1,8(sp)
    800024e0:	02010413          	addi	s0,sp,32
    800024e4:	00050493          	mv	s1,a0
}
    800024e8:	00000097          	auipc	ra,0x0
    800024ec:	e80080e7          	jalr	-384(ra) # 80002368 <_ZN6ThreadD1Ev>
    800024f0:	00048513          	mv	a0,s1
    800024f4:	00000097          	auipc	ra,0x0
    800024f8:	fb4080e7          	jalr	-76(ra) # 800024a8 <_ZdlPv>
    800024fc:	01813083          	ld	ra,24(sp)
    80002500:	01013403          	ld	s0,16(sp)
    80002504:	00813483          	ld	s1,8(sp)
    80002508:	02010113          	addi	sp,sp,32
    8000250c:	00008067          	ret

0000000080002510 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80002510:	fe010113          	addi	sp,sp,-32
    80002514:	00113c23          	sd	ra,24(sp)
    80002518:	00813823          	sd	s0,16(sp)
    8000251c:	00913423          	sd	s1,8(sp)
    80002520:	02010413          	addi	s0,sp,32
    80002524:	00050493          	mv	s1,a0
}
    80002528:	00000097          	auipc	ra,0x0
    8000252c:	eb8080e7          	jalr	-328(ra) # 800023e0 <_ZN9SemaphoreD1Ev>
    80002530:	00048513          	mv	a0,s1
    80002534:	00000097          	auipc	ra,0x0
    80002538:	f74080e7          	jalr	-140(ra) # 800024a8 <_ZdlPv>
    8000253c:	01813083          	ld	ra,24(sp)
    80002540:	01013403          	ld	s0,16(sp)
    80002544:	00813483          	ld	s1,8(sp)
    80002548:	02010113          	addi	sp,sp,32
    8000254c:	00008067          	ret

0000000080002550 <_ZdaPv>:
noexcept {
    80002550:	ff010113          	addi	sp,sp,-16
    80002554:	00113423          	sd	ra,8(sp)
    80002558:	00813023          	sd	s0,0(sp)
    8000255c:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80002560:	fffff097          	auipc	ra,0xfffff
    80002564:	df0080e7          	jalr	-528(ra) # 80001350 <_Z8mem_freePv>
}
    80002568:	00813083          	ld	ra,8(sp)
    8000256c:	00013403          	ld	s0,0(sp)
    80002570:	01010113          	addi	sp,sp,16
    80002574:	00008067          	ret

0000000080002578 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (* body)(void*), void* arg) {
    80002578:	fd010113          	addi	sp,sp,-48
    8000257c:	02113423          	sd	ra,40(sp)
    80002580:	02813023          	sd	s0,32(sp)
    80002584:	00913c23          	sd	s1,24(sp)
    80002588:	01213823          	sd	s2,16(sp)
    8000258c:	01313423          	sd	s3,8(sp)
    80002590:	03010413          	addi	s0,sp,48
    80002594:	00050493          	mv	s1,a0
    80002598:	00058913          	mv	s2,a1
    8000259c:	00060993          	mv	s3,a2
    800025a0:	00009797          	auipc	a5,0x9
    800025a4:	2c078793          	addi	a5,a5,704 # 8000b860 <_ZTV6Thread+0x10>
    800025a8:	00f53023          	sd	a5,0(a0)
	this->body = body;
    800025ac:	00b53823          	sd	a1,16(a0)
	this->arg = arg;
    800025b0:	00c53c23          	sd	a2,24(a0)
	if (body != nullptr) {
    800025b4:	04058663          	beqz	a1,80002600 <_ZN6ThreadC1EPFvPvES0_+0x88>
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    800025b8:	00001537          	lui	a0,0x1
    800025bc:	fffff097          	auipc	ra,0xfffff
    800025c0:	d54080e7          	jalr	-684(ra) # 80001310 <_Z9mem_allocm>
    800025c4:	00050313          	mv	t1,a0
	__asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800025c8:	00030713          	mv	a4,t1
	__asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800025cc:	00098693          	mv	a3,s3
			body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800025d0:	00090613          	mv	a2,s2
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800025d4:	00848493          	addi	s1,s1,8
    800025d8:	00048593          	mv	a1,s1
	__asm__ volatile("li a0, 0x80");
    800025dc:	08000513          	li	a0,128
	__asm__ volatile("ecall");
    800025e0:	00000073          	ecall
}
    800025e4:	02813083          	ld	ra,40(sp)
    800025e8:	02013403          	ld	s0,32(sp)
    800025ec:	01813483          	ld	s1,24(sp)
    800025f0:	01013903          	ld	s2,16(sp)
    800025f4:	00813983          	ld	s3,8(sp)
    800025f8:	03010113          	addi	sp,sp,48
    800025fc:	00008067          	ret
	uint64* stack = nullptr;
    80002600:	00000313          	li	t1,0
    80002604:	fc5ff06f          	j	800025c8 <_ZN6ThreadC1EPFvPvES0_+0x50>

0000000080002608 <_ZN6Thread5startEv>:
int Thread::start() {
    80002608:	ff010113          	addi	sp,sp,-16
    8000260c:	00813423          	sd	s0,8(sp)
    80002610:	01010413          	addi	s0,sp,16
	if (myHandle == nullptr) return -1;
    80002614:	00853303          	ld	t1,8(a0) # 1008 <_entry-0x7fffeff8>
    80002618:	02030063          	beqz	t1,80002638 <_ZN6Thread5startEv+0x30>
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000261c:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x81");
    80002620:	08100513          	li	a0,129
	__asm__ volatile("ecall");
    80002624:	00000073          	ecall
	return 0;
    80002628:	00000513          	li	a0,0
}
    8000262c:	00813403          	ld	s0,8(sp)
    80002630:	01010113          	addi	sp,sp,16
    80002634:	00008067          	ret
	if (myHandle == nullptr) return -1;
    80002638:	fff00513          	li	a0,-1
    8000263c:	ff1ff06f          	j	8000262c <_ZN6Thread5startEv+0x24>

0000000080002640 <_ZN6Thread4joinEv>:
void Thread::join() {
    80002640:	ff010113          	addi	sp,sp,-16
    80002644:	00113423          	sd	ra,8(sp)
    80002648:	00813023          	sd	s0,0(sp)
    8000264c:	01010413          	addi	s0,sp,16
	thread_join(myHandle);
    80002650:	00853503          	ld	a0,8(a0)
    80002654:	fffff097          	auipc	ra,0xfffff
    80002658:	df4080e7          	jalr	-524(ra) # 80001448 <_Z11thread_joinP3TCB>
}
    8000265c:	00813083          	ld	ra,8(sp)
    80002660:	00013403          	ld	s0,0(sp)
    80002664:	01010113          	addi	sp,sp,16
    80002668:	00008067          	ret

000000008000266c <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    8000266c:	ff010113          	addi	sp,sp,-16
    80002670:	00113423          	sd	ra,8(sp)
    80002674:	00813023          	sd	s0,0(sp)
    80002678:	01010413          	addi	s0,sp,16
	thread_dispatch();
    8000267c:	fffff097          	auipc	ra,0xfffff
    80002680:	dac080e7          	jalr	-596(ra) # 80001428 <_Z15thread_dispatchv>
}
    80002684:	00813083          	ld	ra,8(sp)
    80002688:	00013403          	ld	s0,0(sp)
    8000268c:	01010113          	addi	sp,sp,16
    80002690:	00008067          	ret

0000000080002694 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t t) {
    80002694:	ff010113          	addi	sp,sp,-16
    80002698:	00113423          	sd	ra,8(sp)
    8000269c:	00813023          	sd	s0,0(sp)
    800026a0:	01010413          	addi	s0,sp,16
    800026a4:	00050593          	mv	a1,a0
	Scheduler::putToSleep(TCB::running, t);
    800026a8:	00009797          	auipc	a5,0x9
    800026ac:	3f87b783          	ld	a5,1016(a5) # 8000baa0 <_GLOBAL_OFFSET_TABLE_+0x58>
    800026b0:	0007b503          	ld	a0,0(a5)
    800026b4:	fffff097          	auipc	ra,0xfffff
    800026b8:	420080e7          	jalr	1056(ra) # 80001ad4 <_ZN9Scheduler10putToSleepEP3TCBm>
}
    800026bc:	00000513          	li	a0,0
    800026c0:	00813083          	ld	ra,8(sp)
    800026c4:	00013403          	ld	s0,0(sp)
    800026c8:	01010113          	addi	sp,sp,16
    800026cc:	00008067          	ret

00000000800026d0 <_ZN14PeriodicThread15periodicWrapperEPv>:
}

PeriodicThread::PeriodicThread(time_t period) : Thread(periodicWrapper, this), period(period) {
}

void PeriodicThread::periodicWrapper(void* pThread) {
    800026d0:	fe010113          	addi	sp,sp,-32
    800026d4:	00113c23          	sd	ra,24(sp)
    800026d8:	00813823          	sd	s0,16(sp)
    800026dc:	00913423          	sd	s1,8(sp)
    800026e0:	02010413          	addi	s0,sp,32
    800026e4:	00050493          	mv	s1,a0
	if (pThread != nullptr) {
    800026e8:	02050263          	beqz	a0,8000270c <_ZN14PeriodicThread15periodicWrapperEPv+0x3c>
		PeriodicThread* ptr = (PeriodicThread*)pThread;
		while (1) {
			ptr->periodicActivation();
    800026ec:	0004b783          	ld	a5,0(s1)
    800026f0:	0187b783          	ld	a5,24(a5)
    800026f4:	00048513          	mv	a0,s1
    800026f8:	000780e7          	jalr	a5
			Thread::sleep(ptr->period);
    800026fc:	0204b503          	ld	a0,32(s1)
    80002700:	00000097          	auipc	ra,0x0
    80002704:	f94080e7          	jalr	-108(ra) # 80002694 <_ZN6Thread5sleepEm>
		while (1) {
    80002708:	fe5ff06f          	j	800026ec <_ZN14PeriodicThread15periodicWrapperEPv+0x1c>
		}
	}
}
    8000270c:	01813083          	ld	ra,24(sp)
    80002710:	01013403          	ld	s0,16(sp)
    80002714:	00813483          	ld	s1,8(sp)
    80002718:	02010113          	addi	sp,sp,32
    8000271c:	00008067          	ret

0000000080002720 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80002720:	fe010113          	addi	sp,sp,-32
    80002724:	00113c23          	sd	ra,24(sp)
    80002728:	00813823          	sd	s0,16(sp)
    8000272c:	00913423          	sd	s1,8(sp)
    80002730:	02010413          	addi	s0,sp,32
    80002734:	00050493          	mv	s1,a0
    80002738:	00009797          	auipc	a5,0x9
    8000273c:	12878793          	addi	a5,a5,296 # 8000b860 <_ZTV6Thread+0x10>
    80002740:	00f53023          	sd	a5,0(a0)
	this->body = wrapper;
    80002744:	00000797          	auipc	a5,0x0
    80002748:	bf078793          	addi	a5,a5,-1040 # 80002334 <_ZN6Thread7wrapperEPv>
    8000274c:	00f53823          	sd	a5,16(a0)
	this->arg = this;
    80002750:	00a53c23          	sd	a0,24(a0)
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    80002754:	00001537          	lui	a0,0x1
    80002758:	fffff097          	auipc	ra,0xfffff
    8000275c:	bb8080e7          	jalr	-1096(ra) # 80001310 <_Z9mem_allocm>
    80002760:	00050313          	mv	t1,a0
	__asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002764:	00030713          	mv	a4,t1
	__asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002768:	0184b303          	ld	t1,24(s1)
    8000276c:	00030693          	mv	a3,t1
			body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002770:	0104b303          	ld	t1,16(s1)
    80002774:	00030613          	mv	a2,t1
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002778:	00848493          	addi	s1,s1,8
    8000277c:	00048593          	mv	a1,s1
	__asm__ volatile("li a0, 0x80");
    80002780:	08000513          	li	a0,128
	__asm__ volatile("ecall");
    80002784:	00000073          	ecall
}
    80002788:	01813083          	ld	ra,24(sp)
    8000278c:	01013403          	ld	s0,16(sp)
    80002790:	00813483          	ld	s1,8(sp)
    80002794:	02010113          	addi	sp,sp,32
    80002798:	00008067          	ret

000000008000279c <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    8000279c:	ff010113          	addi	sp,sp,-16
    800027a0:	00113423          	sd	ra,8(sp)
    800027a4:	00813023          	sd	s0,0(sp)
    800027a8:	01010413          	addi	s0,sp,16
    800027ac:	00009797          	auipc	a5,0x9
    800027b0:	0dc78793          	addi	a5,a5,220 # 8000b888 <_ZTV9Semaphore+0x10>
    800027b4:	00f53023          	sd	a5,0(a0) # 1000 <_entry-0x7ffff000>
	sem_open(&myHandle, init);
    800027b8:	00850513          	addi	a0,a0,8
    800027bc:	fffff097          	auipc	ra,0xfffff
    800027c0:	ce4080e7          	jalr	-796(ra) # 800014a0 <_Z8sem_openPP4KSemj>
}
    800027c4:	00813083          	ld	ra,8(sp)
    800027c8:	00013403          	ld	s0,0(sp)
    800027cc:	01010113          	addi	sp,sp,16
    800027d0:	00008067          	ret

00000000800027d4 <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    800027d4:	ff010113          	addi	sp,sp,-16
    800027d8:	00113423          	sd	ra,8(sp)
    800027dc:	00813023          	sd	s0,0(sp)
    800027e0:	01010413          	addi	s0,sp,16
	return sem_wait(myHandle);
    800027e4:	00853503          	ld	a0,8(a0)
    800027e8:	fffff097          	auipc	ra,0xfffff
    800027ec:	d20080e7          	jalr	-736(ra) # 80001508 <_Z8sem_waitP4KSem>
}
    800027f0:	00813083          	ld	ra,8(sp)
    800027f4:	00013403          	ld	s0,0(sp)
    800027f8:	01010113          	addi	sp,sp,16
    800027fc:	00008067          	ret

0000000080002800 <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    80002800:	ff010113          	addi	sp,sp,-16
    80002804:	00113423          	sd	ra,8(sp)
    80002808:	00813023          	sd	s0,0(sp)
    8000280c:	01010413          	addi	s0,sp,16
	return sem_signal(myHandle);
    80002810:	00853503          	ld	a0,8(a0)
    80002814:	fffff097          	auipc	ra,0xfffff
    80002818:	d24080e7          	jalr	-732(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    8000281c:	00813083          	ld	ra,8(sp)
    80002820:	00013403          	ld	s0,0(sp)
    80002824:	01010113          	addi	sp,sp,16
    80002828:	00008067          	ret

000000008000282c <_ZN14PeriodicThread9terminateEv>:
void PeriodicThread::terminate() {
    8000282c:	ff010113          	addi	sp,sp,-16
    80002830:	00813423          	sd	s0,8(sp)
    80002834:	01010413          	addi	s0,sp,16
}
    80002838:	00813403          	ld	s0,8(sp)
    8000283c:	01010113          	addi	sp,sp,16
    80002840:	00008067          	ret

0000000080002844 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period) : Thread(periodicWrapper, this), period(period) {
    80002844:	fe010113          	addi	sp,sp,-32
    80002848:	00113c23          	sd	ra,24(sp)
    8000284c:	00813823          	sd	s0,16(sp)
    80002850:	00913423          	sd	s1,8(sp)
    80002854:	01213023          	sd	s2,0(sp)
    80002858:	02010413          	addi	s0,sp,32
    8000285c:	00050493          	mv	s1,a0
    80002860:	00058913          	mv	s2,a1
    80002864:	00050613          	mv	a2,a0
    80002868:	00000597          	auipc	a1,0x0
    8000286c:	e6858593          	addi	a1,a1,-408 # 800026d0 <_ZN14PeriodicThread15periodicWrapperEPv>
    80002870:	00000097          	auipc	ra,0x0
    80002874:	d08080e7          	jalr	-760(ra) # 80002578 <_ZN6ThreadC1EPFvPvES0_>
    80002878:	00009797          	auipc	a5,0x9
    8000287c:	fb878793          	addi	a5,a5,-72 # 8000b830 <_ZTV14PeriodicThread+0x10>
    80002880:	00f4b023          	sd	a5,0(s1)
    80002884:	0324b023          	sd	s2,32(s1)
}
    80002888:	01813083          	ld	ra,24(sp)
    8000288c:	01013403          	ld	s0,16(sp)
    80002890:	00813483          	ld	s1,8(sp)
    80002894:	00013903          	ld	s2,0(sp)
    80002898:	02010113          	addi	sp,sp,32
    8000289c:	00008067          	ret

00000000800028a0 <_ZN7Console4getcEv>:

char Console::getc() {
    800028a0:	ff010113          	addi	sp,sp,-16
    800028a4:	00113423          	sd	ra,8(sp)
    800028a8:	00813023          	sd	s0,0(sp)
    800028ac:	01010413          	addi	s0,sp,16
	return ::getc();
    800028b0:	fffff097          	auipc	ra,0xfffff
    800028b4:	cb8080e7          	jalr	-840(ra) # 80001568 <_Z4getcv>
}
    800028b8:	00813083          	ld	ra,8(sp)
    800028bc:	00013403          	ld	s0,0(sp)
    800028c0:	01010113          	addi	sp,sp,16
    800028c4:	00008067          	ret

00000000800028c8 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    800028c8:	ff010113          	addi	sp,sp,-16
    800028cc:	00113423          	sd	ra,8(sp)
    800028d0:	00813023          	sd	s0,0(sp)
    800028d4:	01010413          	addi	s0,sp,16
	::putc(c);
    800028d8:	fffff097          	auipc	ra,0xfffff
    800028dc:	cb8080e7          	jalr	-840(ra) # 80001590 <_Z4putcc>
}
    800028e0:	00813083          	ld	ra,8(sp)
    800028e4:	00013403          	ld	s0,0(sp)
    800028e8:	01010113          	addi	sp,sp,16
    800028ec:	00008067          	ret

00000000800028f0 <_ZN6Thread3runEv>:
	static int sleep(time_t);

protected:
	Thread();

	virtual void run() {}
    800028f0:	ff010113          	addi	sp,sp,-16
    800028f4:	00813423          	sd	s0,8(sp)
    800028f8:	01010413          	addi	s0,sp,16
    800028fc:	00813403          	ld	s0,8(sp)
    80002900:	01010113          	addi	sp,sp,16
    80002904:	00008067          	ret

0000000080002908 <_ZN14PeriodicThread18periodicActivationEv>:
	void terminate();

protected:
	PeriodicThread(time_t period);

	virtual void periodicActivation() {}
    80002908:	ff010113          	addi	sp,sp,-16
    8000290c:	00813423          	sd	s0,8(sp)
    80002910:	01010413          	addi	s0,sp,16
    80002914:	00813403          	ld	s0,8(sp)
    80002918:	01010113          	addi	sp,sp,16
    8000291c:	00008067          	ret

0000000080002920 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80002920:	ff010113          	addi	sp,sp,-16
    80002924:	00113423          	sd	ra,8(sp)
    80002928:	00813023          	sd	s0,0(sp)
    8000292c:	01010413          	addi	s0,sp,16
    80002930:	00009797          	auipc	a5,0x9
    80002934:	f0078793          	addi	a5,a5,-256 # 8000b830 <_ZTV14PeriodicThread+0x10>
    80002938:	00f53023          	sd	a5,0(a0)
    8000293c:	00000097          	auipc	ra,0x0
    80002940:	a2c080e7          	jalr	-1492(ra) # 80002368 <_ZN6ThreadD1Ev>
    80002944:	00813083          	ld	ra,8(sp)
    80002948:	00013403          	ld	s0,0(sp)
    8000294c:	01010113          	addi	sp,sp,16
    80002950:	00008067          	ret

0000000080002954 <_ZN14PeriodicThreadD0Ev>:
    80002954:	fe010113          	addi	sp,sp,-32
    80002958:	00113c23          	sd	ra,24(sp)
    8000295c:	00813823          	sd	s0,16(sp)
    80002960:	00913423          	sd	s1,8(sp)
    80002964:	02010413          	addi	s0,sp,32
    80002968:	00050493          	mv	s1,a0
    8000296c:	00009797          	auipc	a5,0x9
    80002970:	ec478793          	addi	a5,a5,-316 # 8000b830 <_ZTV14PeriodicThread+0x10>
    80002974:	00f53023          	sd	a5,0(a0)
    80002978:	00000097          	auipc	ra,0x0
    8000297c:	9f0080e7          	jalr	-1552(ra) # 80002368 <_ZN6ThreadD1Ev>
    80002980:	00048513          	mv	a0,s1
    80002984:	00000097          	auipc	ra,0x0
    80002988:	b24080e7          	jalr	-1244(ra) # 800024a8 <_ZdlPv>
    8000298c:	01813083          	ld	ra,24(sp)
    80002990:	01013403          	ld	s0,16(sp)
    80002994:	00813483          	ld	s1,8(sp)
    80002998:	02010113          	addi	sp,sp,32
    8000299c:	00008067          	ret

00000000800029a0 <_ZN3TCB7wrapperEv>:
	Riscv::pushRegisters();
	TCB::dispatch();
	Riscv::popRegisters();
}

void TCB::wrapper() {
    800029a0:	ff010113          	addi	sp,sp,-16
    800029a4:	00113423          	sd	ra,8(sp)
    800029a8:	00813023          	sd	s0,0(sp)
    800029ac:	01010413          	addi	s0,sp,16
	//pocetak wrappera se izvrsava u supervisor modu,
	//jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch/yield)
	Riscv::popSppSpie();
    800029b0:	00000097          	auipc	ra,0x0
    800029b4:	308080e7          	jalr	776(ra) # 80002cb8 <_ZN5Riscv10popSppSpieEv>
	//na dalje se izvrsavamo u user modu
	running->threadFunction(running->args);
    800029b8:	00009797          	auipc	a5,0x9
    800029bc:	2307b783          	ld	a5,560(a5) # 8000bbe8 <_ZN3TCB7runningE>
    800029c0:	0107b703          	ld	a4,16(a5)
    800029c4:	0207b503          	ld	a0,32(a5)
    800029c8:	000700e7          	jalr	a4
	//running->finished = true;
	//i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
	thread_exit();
    800029cc:	fffff097          	auipc	ra,0xfffff
    800029d0:	a34080e7          	jalr	-1484(ra) # 80001400 <_Z11thread_exitv>
}
    800029d4:	00813083          	ld	ra,8(sp)
    800029d8:	00013403          	ld	s0,0(sp)
    800029dc:	01010113          	addi	sp,sp,16
    800029e0:	00008067          	ret

00000000800029e4 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    800029e4:	fe010113          	addi	sp,sp,-32
    800029e8:	00113c23          	sd	ra,24(sp)
    800029ec:	00813823          	sd	s0,16(sp)
    800029f0:	00913423          	sd	s1,8(sp)
    800029f4:	02010413          	addi	s0,sp,32
	TCB* old = TCB::running;
    800029f8:	00009497          	auipc	s1,0x9
    800029fc:	1f04b483          	ld	s1,496(s1) # 8000bbe8 <_ZN3TCB7runningE>
	if (!old->finished && !old->blocked && old->timeToSleep == 0 && !old->needToJoin) {
    80002a00:	0304c783          	lbu	a5,48(s1)
    80002a04:	00079e63          	bnez	a5,80002a20 <_ZN3TCB8dispatchEv+0x3c>
    80002a08:	0314c783          	lbu	a5,49(s1)
    80002a0c:	00079a63          	bnez	a5,80002a20 <_ZN3TCB8dispatchEv+0x3c>
    80002a10:	0404b783          	ld	a5,64(s1)
    80002a14:	00079663          	bnez	a5,80002a20 <_ZN3TCB8dispatchEv+0x3c>
    80002a18:	0324c783          	lbu	a5,50(s1)
    80002a1c:	04078663          	beqz	a5,80002a68 <_ZN3TCB8dispatchEv+0x84>
	TCB::running = Scheduler::get();
    80002a20:	fffff097          	auipc	ra,0xfffff
    80002a24:	074080e7          	jalr	116(ra) # 80001a94 <_ZN9Scheduler3getEv>
    80002a28:	00050593          	mv	a1,a0
    80002a2c:	00009797          	auipc	a5,0x9
    80002a30:	1bc78793          	addi	a5,a5,444 # 8000bbe8 <_ZN3TCB7runningE>
    80002a34:	00a7b023          	sd	a0,0(a5)
	TCB::runningTimeSlice = 0;
    80002a38:	0007b423          	sd	zero,8(a5)
	if (TCB::running->threadFunction == nullptr || TCB::running->threadFunction == kernelConsumerFunction ||
    80002a3c:	01053783          	ld	a5,16(a0)
    80002a40:	02078c63          	beqz	a5,80002a78 <_ZN3TCB8dispatchEv+0x94>
    80002a44:	00009717          	auipc	a4,0x9
    80002a48:	03473703          	ld	a4,52(a4) # 8000ba78 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002a4c:	02e78663          	beq	a5,a4,80002a78 <_ZN3TCB8dispatchEv+0x94>
    80002a50:	00009717          	auipc	a4,0x9
    80002a54:	06873703          	ld	a4,104(a4) # 8000bab8 <_GLOBAL_OFFSET_TABLE_+0x70>
    80002a58:	02e78063          	beq	a5,a4,80002a78 <_ZN3TCB8dispatchEv+0x94>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002a5c:	10000793          	li	a5,256
    80002a60:	1007b073          	csrc	sstatus,a5
}
    80002a64:	01c0006f          	j	80002a80 <_ZN3TCB8dispatchEv+0x9c>
		Scheduler::put(old);
    80002a68:	00048513          	mv	a0,s1
    80002a6c:	fffff097          	auipc	ra,0xfffff
    80002a70:	fe4080e7          	jalr	-28(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
    80002a74:	fadff06f          	j	80002a20 <_ZN3TCB8dispatchEv+0x3c>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80002a78:	10000793          	li	a5,256
    80002a7c:	1007a073          	csrs	sstatus,a5
	if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    80002a80:	00b48863          	beq	s1,a1,80002a90 <_ZN3TCB8dispatchEv+0xac>
    80002a84:	00048513          	mv	a0,s1
    80002a88:	ffffe097          	auipc	ra,0xffffe
    80002a8c:	788080e7          	jalr	1928(ra) # 80001210 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80002a90:	01813083          	ld	ra,24(sp)
    80002a94:	01013403          	ld	s0,16(sp)
    80002a98:	00813483          	ld	s1,8(sp)
    80002a9c:	02010113          	addi	sp,sp,32
    80002aa0:	00008067          	ret

0000000080002aa4 <_ZN3TCB5yieldEv>:
void TCB::yield() {
    80002aa4:	ff010113          	addi	sp,sp,-16
    80002aa8:	00113423          	sd	ra,8(sp)
    80002aac:	00813023          	sd	s0,0(sp)
    80002ab0:	01010413          	addi	s0,sp,16
	Riscv::pushRegisters();
    80002ab4:	ffffe097          	auipc	ra,0xffffe
    80002ab8:	54c080e7          	jalr	1356(ra) # 80001000 <_ZN5Riscv13pushRegistersEv>
	TCB::dispatch();
    80002abc:	00000097          	auipc	ra,0x0
    80002ac0:	f28080e7          	jalr	-216(ra) # 800029e4 <_ZN3TCB8dispatchEv>
	Riscv::popRegisters();
    80002ac4:	ffffe097          	auipc	ra,0xffffe
    80002ac8:	5b8080e7          	jalr	1464(ra) # 8000107c <_ZN5Riscv12popRegistersEv>
}
    80002acc:	00813083          	ld	ra,8(sp)
    80002ad0:	00013403          	ld	s0,0(sp)
    80002ad4:	01010113          	addi	sp,sp,16
    80002ad8:	00008067          	ret

0000000080002adc <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    80002adc:	ff010113          	addi	sp,sp,-16
    80002ae0:	00113423          	sd	ra,8(sp)
    80002ae4:	00813023          	sd	s0,0(sp)
    80002ae8:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80002aec:	fffff097          	auipc	ra,0xfffff
    80002af0:	824080e7          	jalr	-2012(ra) # 80001310 <_Z9mem_allocm>
	//return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::THREAD);
}
    80002af4:	00813083          	ld	ra,8(sp)
    80002af8:	00013403          	ld	s0,0(sp)
    80002afc:	01010113          	addi	sp,sp,16
    80002b00:	00008067          	ret

0000000080002b04 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    80002b04:	fd010113          	addi	sp,sp,-48
    80002b08:	02113423          	sd	ra,40(sp)
    80002b0c:	02813023          	sd	s0,32(sp)
    80002b10:	00913c23          	sd	s1,24(sp)
    80002b14:	01213823          	sd	s2,16(sp)
    80002b18:	01313423          	sd	s3,8(sp)
    80002b1c:	03010413          	addi	s0,sp,48
    80002b20:	00050913          	mv	s2,a0
    80002b24:	00058993          	mv	s3,a1
    80002b28:	00060493          	mv	s1,a2
	TCB* newThread = new TCB(function, args, stack);
    80002b2c:	06000513          	li	a0,96
    80002b30:	00000097          	auipc	ra,0x0
    80002b34:	fac080e7          	jalr	-84(ra) # 80002adc <_ZN3TCBnwEm>


	TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
													timeSlice(DEFAULT_TIME_SLICE), finished(false), blocked(false),
													needToJoin(false),
													nextInScheduler(nullptr), timeToSleep(0), nextSleeping(nullptr) {
    80002b38:	01253823          	sd	s2,16(a0)
    80002b3c:	00953c23          	sd	s1,24(a0)
    80002b40:	03353023          	sd	s3,32(a0)
    80002b44:	00200793          	li	a5,2
    80002b48:	02f53423          	sd	a5,40(a0)
    80002b4c:	02050823          	sb	zero,48(a0)
    80002b50:	020508a3          	sb	zero,49(a0)
    80002b54:	02050923          	sb	zero,50(a0)
    80002b58:	02053c23          	sd	zero,56(a0)
    80002b5c:	04053023          	sd	zero,64(a0)
    80002b60:	04053423          	sd	zero,72(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    80002b64:	04053823          	sd	zero,80(a0)
    80002b68:	04053c23          	sd	zero,88(a0)
		//formiranje pocetnog konteksta; specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80002b6c:	02090e63          	beqz	s2,80002ba8 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xa4>
    80002b70:	00000797          	auipc	a5,0x0
    80002b74:	e3078793          	addi	a5,a5,-464 # 800029a0 <_ZN3TCB7wrapperEv>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80002b78:	02048c63          	beqz	s1,80002bb0 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xac>
    80002b7c:	00008637          	lui	a2,0x8
    80002b80:	00c484b3          	add	s1,s1,a2
		this->context.ra = startRa;
    80002b84:	00f53023          	sd	a5,0(a0)
		this->context.sp = startSp;
    80002b88:	00953423          	sd	s1,8(a0)
}
    80002b8c:	02813083          	ld	ra,40(sp)
    80002b90:	02013403          	ld	s0,32(sp)
    80002b94:	01813483          	ld	s1,24(sp)
    80002b98:	01013903          	ld	s2,16(sp)
    80002b9c:	00813983          	ld	s3,8(sp)
    80002ba0:	03010113          	addi	sp,sp,48
    80002ba4:	00008067          	ret
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80002ba8:	00000793          	li	a5,0
    80002bac:	fcdff06f          	j	80002b78 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x74>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80002bb0:	00000493          	li	s1,0
    80002bb4:	fd1ff06f          	j	80002b84 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x80>

0000000080002bb8 <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    80002bb8:	ff010113          	addi	sp,sp,-16
    80002bbc:	00113423          	sd	ra,8(sp)
    80002bc0:	00813023          	sd	s0,0(sp)
    80002bc4:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80002bc8:	ffffe097          	auipc	ra,0xffffe
    80002bcc:	788080e7          	jalr	1928(ra) # 80001350 <_Z8mem_freePv>
	//MemoryAllocator::kfree(ptr);
}
    80002bd0:	00813083          	ld	ra,8(sp)
    80002bd4:	00013403          	ld	s0,0(sp)
    80002bd8:	01010113          	addi	sp,sp,16
    80002bdc:	00008067          	ret

0000000080002be0 <_ZN3TCB10threadJoinEPS_>:

void TCB::threadJoin(TCB* handle) {
	if (handle->finished) return;
    80002be0:	03054783          	lbu	a5,48(a0)
    80002be4:	00078463          	beqz	a5,80002bec <_ZN3TCB10threadJoinEPS_+0xc>
    80002be8:	00008067          	ret
void TCB::threadJoin(TCB* handle) {
    80002bec:	ff010113          	addi	sp,sp,-16
    80002bf0:	00113423          	sd	ra,8(sp)
    80002bf4:	00813023          	sd	s0,0(sp)
    80002bf8:	01010413          	addi	s0,sp,16
	TCB::running->needToJoin = true;
    80002bfc:	00009597          	auipc	a1,0x9
    80002c00:	fec5b583          	ld	a1,-20(a1) # 8000bbe8 <_ZN3TCB7runningE>
    80002c04:	00100793          	li	a5,1
    80002c08:	02f58923          	sb	a5,50(a1)
	handle->waitingToJoin.putLast(TCB::running);
    80002c0c:	05050513          	addi	a0,a0,80
    80002c10:	ffffe097          	auipc	ra,0xffffe
    80002c14:	634080e7          	jalr	1588(ra) # 80001244 <_ZN11ThreadQueue7putLastEP3TCB>
}
    80002c18:	00813083          	ld	ra,8(sp)
    80002c1c:	00013403          	ld	s0,0(sp)
    80002c20:	01010113          	addi	sp,sp,16
    80002c24:	00008067          	ret

0000000080002c28 <_ZN3TCB13releaseJoinedEv>:

void TCB::releaseJoined() {
	while (!TCB::running->waitingToJoin.isEmpty()) {
    80002c28:	00009517          	auipc	a0,0x9
    80002c2c:	fc053503          	ld	a0,-64(a0) # 8000bbe8 <_ZN3TCB7runningE>
        bool ret = front == nullptr;
    80002c30:	05053783          	ld	a5,80(a0)
    80002c34:	04078663          	beqz	a5,80002c80 <_ZN3TCB13releaseJoinedEv+0x58>
void TCB::releaseJoined() {
    80002c38:	ff010113          	addi	sp,sp,-16
    80002c3c:	00113423          	sd	ra,8(sp)
    80002c40:	00813023          	sd	s0,0(sp)
    80002c44:	01010413          	addi	s0,sp,16
		TCB* tcb = TCB::running->waitingToJoin.getFirst();
    80002c48:	05050513          	addi	a0,a0,80
    80002c4c:	ffffe097          	auipc	ra,0xffffe
    80002c50:	664080e7          	jalr	1636(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
		tcb->needToJoin = false;
    80002c54:	02050923          	sb	zero,50(a0)
		Scheduler::put(tcb);
    80002c58:	fffff097          	auipc	ra,0xfffff
    80002c5c:	df8080e7          	jalr	-520(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
	while (!TCB::running->waitingToJoin.isEmpty()) {
    80002c60:	00009517          	auipc	a0,0x9
    80002c64:	f8853503          	ld	a0,-120(a0) # 8000bbe8 <_ZN3TCB7runningE>
    80002c68:	05053783          	ld	a5,80(a0)
    80002c6c:	fc079ee3          	bnez	a5,80002c48 <_ZN3TCB13releaseJoinedEv+0x20>
	}
}
    80002c70:	00813083          	ld	ra,8(sp)
    80002c74:	00013403          	ld	s0,0(sp)
    80002c78:	01010113          	addi	sp,sp,16
    80002c7c:	00008067          	ret
    80002c80:	00008067          	ret

0000000080002c84 <_ZN3TCB5startEPS_>:

void TCB::start(TCB* newTcb) {
	//startovanje niti(stavljanje u Scheduler); main nit je vec aktivna, ne stavlja se u Scheduler
	if (newTcb->threadFunction != nullptr) Scheduler::put(newTcb);
    80002c84:	01053783          	ld	a5,16(a0)
    80002c88:	02078663          	beqz	a5,80002cb4 <_ZN3TCB5startEPS_+0x30>
void TCB::start(TCB* newTcb) {
    80002c8c:	ff010113          	addi	sp,sp,-16
    80002c90:	00113423          	sd	ra,8(sp)
    80002c94:	00813023          	sd	s0,0(sp)
    80002c98:	01010413          	addi	s0,sp,16
	if (newTcb->threadFunction != nullptr) Scheduler::put(newTcb);
    80002c9c:	fffff097          	auipc	ra,0xfffff
    80002ca0:	db4080e7          	jalr	-588(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
}
    80002ca4:	00813083          	ld	ra,8(sp)
    80002ca8:	00013403          	ld	s0,0(sp)
    80002cac:	01010113          	addi	sp,sp,16
    80002cb0:	00008067          	ret
    80002cb4:	00008067          	ret

0000000080002cb8 <_ZN5Riscv10popSppSpieEv>:
// Created by os on 5/17/23.
//

#include "../h/Riscv.hpp"

void Riscv::popSppSpie() {
    80002cb8:	ff010113          	addi	sp,sp,-16
    80002cbc:	00813423          	sd	s0,8(sp)
    80002cc0:	01010413          	addi	s0,sp,16
	//ra pokazuje iza ove funkcije na nastavak wrappera
	__asm__ volatile("csrw sepc, ra");
    80002cc4:	14109073          	csrw	sepc,ra
	__asm__ volatile("sret");
    80002cc8:	10200073          	sret
    80002ccc:	00813403          	ld	s0,8(sp)
    80002cd0:	01010113          	addi	sp,sp,16
    80002cd4:	00008067          	ret

0000000080002cd8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>:
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

#pragma GCC optimize("O0")

void* MemoryAllocator::kmalloc(size_t size, Purpose pur) {
    80002cd8:	fa010113          	addi	sp,sp,-96
    80002cdc:	04813c23          	sd	s0,88(sp)
    80002ce0:	06010413          	addi	s0,sp,96
    80002ce4:	faa43423          	sd	a0,-88(s0)
    80002ce8:	00058793          	mv	a5,a1
    80002cec:	faf42223          	sw	a5,-92(s0)
    //size je u broju bajtova, ukljucuje i mesto potrebno za zaglavlje UsedMemSegment
    if (size <= 0) return nullptr;
    80002cf0:	fa843783          	ld	a5,-88(s0)
    80002cf4:	00079663          	bnez	a5,80002d00 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x28>
    80002cf8:	00000793          	li	a5,0
    80002cfc:	2740006f          	j	80002f70 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x298>
//        printString("Greska");
//    }

    //alokacija uvek zaokruzena na blokove
    //size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
    size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80002d00:	fa843783          	ld	a5,-88(s0)
    80002d04:	0067d713          	srli	a4,a5,0x6
    80002d08:	fa843783          	ld	a5,-88(s0)
    80002d0c:	03f7f793          	andi	a5,a5,63
    80002d10:	00078663          	beqz	a5,80002d1c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x44>
    80002d14:	00100793          	li	a5,1
    80002d18:	0080006f          	j	80002d20 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x48>
    80002d1c:	00000793          	li	a5,0
    80002d20:	00e787b3          	add	a5,a5,a4
    80002d24:	fcf43823          	sd	a5,-48(s0)
    size = blocks * MEM_BLOCK_SIZE;
    80002d28:	fd043783          	ld	a5,-48(s0)
    80002d2c:	00679793          	slli	a5,a5,0x6
    80002d30:	faf43423          	sd	a5,-88(s0)

    //trazenje slobodnog segmenta po first-fit algoritmu
    for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80002d34:	00009797          	auipc	a5,0x9
    80002d38:	ecc78793          	addi	a5,a5,-308 # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80002d3c:	0007b783          	ld	a5,0(a5)
    80002d40:	fef43423          	sd	a5,-24(s0)
    80002d44:	fe843783          	ld	a5,-24(s0)
    80002d48:	22078263          	beqz	a5,80002f6c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x294>
        if (current->size < size) continue;
    80002d4c:	fe843783          	ld	a5,-24(s0)
    80002d50:	0107b783          	ld	a5,16(a5)
    80002d54:	fa843703          	ld	a4,-88(s0)
    80002d58:	20e7e063          	bltu	a5,a4,80002f58 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x280>

        //pravljenje novog slobodnog fragmenta od ostatka fragmenta
        FreeMemSegment* remainderFree = (FreeMemSegment*) ((char*) current + size);
    80002d5c:	fe843703          	ld	a4,-24(s0)
    80002d60:	fa843783          	ld	a5,-88(s0)
    80002d64:	00f707b3          	add	a5,a4,a5
    80002d68:	fcf43423          	sd	a5,-56(s0)
        size_t remainingSize = current->size - size;
    80002d6c:	fe843783          	ld	a5,-24(s0)
    80002d70:	0107b703          	ld	a4,16(a5)
    80002d74:	fa843783          	ld	a5,-88(s0)
    80002d78:	40f707b3          	sub	a5,a4,a5
    80002d7c:	fcf43023          	sd	a5,-64(s0)
        if (remainingSize <= sizeof(UsedMemSegment)) {
    80002d80:	fc043703          	ld	a4,-64(s0)
    80002d84:	02000793          	li	a5,32
    80002d88:	08e7e063          	bltu	a5,a4,80002e08 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x130>
            //ne preostaje dovoljno veliki slobodni segment;dodeljujemo ceo trenutno alociranom
            size += remainingSize;
    80002d8c:	fa843703          	ld	a4,-88(s0)
    80002d90:	fc043783          	ld	a5,-64(s0)
    80002d94:	00f707b3          	add	a5,a4,a5
    80002d98:	faf43423          	sd	a5,-88(s0)
            if (current->prev) current->prev->next = current->next;
    80002d9c:	fe843783          	ld	a5,-24(s0)
    80002da0:	0087b783          	ld	a5,8(a5)
    80002da4:	00078c63          	beqz	a5,80002dbc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xe4>
    80002da8:	fe843783          	ld	a5,-24(s0)
    80002dac:	0087b783          	ld	a5,8(a5)
    80002db0:	fe843703          	ld	a4,-24(s0)
    80002db4:	00073703          	ld	a4,0(a4)
    80002db8:	00e7b023          	sd	a4,0(a5)
            if (current->next) current->next->prev = current->prev;
    80002dbc:	fe843783          	ld	a5,-24(s0)
    80002dc0:	0007b783          	ld	a5,0(a5)
    80002dc4:	00078c63          	beqz	a5,80002ddc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x104>
    80002dc8:	fe843783          	ld	a5,-24(s0)
    80002dcc:	0007b783          	ld	a5,0(a5)
    80002dd0:	fe843703          	ld	a4,-24(s0)
    80002dd4:	00873703          	ld	a4,8(a4)
    80002dd8:	00e7b423          	sd	a4,8(a5)
            if (freeMemHead == current) { freeMemHead = current->next; }
    80002ddc:	00009797          	auipc	a5,0x9
    80002de0:	e2478793          	addi	a5,a5,-476 # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80002de4:	0007b783          	ld	a5,0(a5)
    80002de8:	fe843703          	ld	a4,-24(s0)
    80002dec:	0af71263          	bne	a4,a5,80002e90 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b8>
    80002df0:	fe843783          	ld	a5,-24(s0)
    80002df4:	0007b703          	ld	a4,0(a5)
    80002df8:	00009797          	auipc	a5,0x9
    80002dfc:	e0878793          	addi	a5,a5,-504 # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80002e00:	00e7b023          	sd	a4,0(a5)
    80002e04:	08c0006f          	j	80002e90 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b8>
        } else {
            remainderFree->size = remainingSize;
    80002e08:	fc843783          	ld	a5,-56(s0)
    80002e0c:	fc043703          	ld	a4,-64(s0)
    80002e10:	00e7b823          	sd	a4,16(a5)
            remainderFree->prev = current->prev;
    80002e14:	fe843783          	ld	a5,-24(s0)
    80002e18:	0087b703          	ld	a4,8(a5)
    80002e1c:	fc843783          	ld	a5,-56(s0)
    80002e20:	00e7b423          	sd	a4,8(a5)
            if (current->prev) current->prev->next = remainderFree;
    80002e24:	fe843783          	ld	a5,-24(s0)
    80002e28:	0087b783          	ld	a5,8(a5)
    80002e2c:	00078a63          	beqz	a5,80002e40 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x168>
    80002e30:	fe843783          	ld	a5,-24(s0)
    80002e34:	0087b783          	ld	a5,8(a5)
    80002e38:	fc843703          	ld	a4,-56(s0)
    80002e3c:	00e7b023          	sd	a4,0(a5)
            remainderFree->next = current->next;
    80002e40:	fe843783          	ld	a5,-24(s0)
    80002e44:	0007b703          	ld	a4,0(a5)
    80002e48:	fc843783          	ld	a5,-56(s0)
    80002e4c:	00e7b023          	sd	a4,0(a5)
            if (current->next) current->next->prev = remainderFree;
    80002e50:	fe843783          	ld	a5,-24(s0)
    80002e54:	0007b783          	ld	a5,0(a5)
    80002e58:	00078a63          	beqz	a5,80002e6c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x194>
    80002e5c:	fe843783          	ld	a5,-24(s0)
    80002e60:	0007b783          	ld	a5,0(a5)
    80002e64:	fc843703          	ld	a4,-56(s0)
    80002e68:	00e7b423          	sd	a4,8(a5)
            if (freeMemHead == current) { freeMemHead = remainderFree; }
    80002e6c:	00009797          	auipc	a5,0x9
    80002e70:	d9478793          	addi	a5,a5,-620 # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80002e74:	0007b783          	ld	a5,0(a5)
    80002e78:	fe843703          	ld	a4,-24(s0)
    80002e7c:	00f71a63          	bne	a4,a5,80002e90 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b8>
    80002e80:	00009797          	auipc	a5,0x9
    80002e84:	d8078793          	addi	a5,a5,-640 # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80002e88:	fc843703          	ld	a4,-56(s0)
    80002e8c:	00e7b023          	sd	a4,0(a5)
        }
        //ubacivanje novog fragmenta u listu zauzetih fragmenata
        UsedMemSegment* newFragment = (UsedMemSegment*) current;
    80002e90:	fe843783          	ld	a5,-24(s0)
    80002e94:	faf43c23          	sd	a5,-72(s0)
        newFragment->size = size;
    80002e98:	fb843783          	ld	a5,-72(s0)
    80002e9c:	fa843703          	ld	a4,-88(s0)
    80002ea0:	00e7b423          	sd	a4,8(a5)
        newFragment->purpose = pur;
    80002ea4:	fb843783          	ld	a5,-72(s0)
    80002ea8:	fa442703          	lw	a4,-92(s0)
    80002eac:	00e7a823          	sw	a4,16(a5)
        newFragment->usableFirstAddress = (char*) newFragment + sizeof(UsedMemSegment);
    80002eb0:	fb843783          	ld	a5,-72(s0)
    80002eb4:	02078713          	addi	a4,a5,32
    80002eb8:	fb843783          	ld	a5,-72(s0)
    80002ebc:	00e7bc23          	sd	a4,24(a5)
        UsedMemSegment* prevUsed = nullptr;
    80002ec0:	fe043023          	sd	zero,-32(s0)
        for (UsedMemSegment* cur = usedMemHead;
    80002ec4:	00009797          	auipc	a5,0x9
    80002ec8:	d3478793          	addi	a5,a5,-716 # 8000bbf8 <_ZN15MemoryAllocator11usedMemHeadE>
    80002ecc:	0007b783          	ld	a5,0(a5)
    80002ed0:	fcf43c23          	sd	a5,-40(s0)
             cur && ((char*) cur < (char*) newFragment); cur = cur->next) {
    80002ed4:	fd843783          	ld	a5,-40(s0)
    80002ed8:	02078463          	beqz	a5,80002f00 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
    80002edc:	fd843703          	ld	a4,-40(s0)
    80002ee0:	fb843783          	ld	a5,-72(s0)
    80002ee4:	00f77e63          	bgeu	a4,a5,80002f00 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
            prevUsed = cur;
    80002ee8:	fd843783          	ld	a5,-40(s0)
    80002eec:	fef43023          	sd	a5,-32(s0)
             cur && ((char*) cur < (char*) newFragment); cur = cur->next) {
    80002ef0:	fd843783          	ld	a5,-40(s0)
    80002ef4:	0007b783          	ld	a5,0(a5)
    80002ef8:	fcf43c23          	sd	a5,-40(s0)
        for (UsedMemSegment* cur = usedMemHead;
    80002efc:	fd9ff06f          	j	80002ed4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1fc>
        }
        if (!prevUsed) {
    80002f00:	fe043783          	ld	a5,-32(s0)
    80002f04:	02079663          	bnez	a5,80002f30 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x258>
            newFragment->next = usedMemHead;
    80002f08:	00009797          	auipc	a5,0x9
    80002f0c:	cf078793          	addi	a5,a5,-784 # 8000bbf8 <_ZN15MemoryAllocator11usedMemHeadE>
    80002f10:	0007b703          	ld	a4,0(a5)
    80002f14:	fb843783          	ld	a5,-72(s0)
    80002f18:	00e7b023          	sd	a4,0(a5)
            usedMemHead = newFragment;
    80002f1c:	00009797          	auipc	a5,0x9
    80002f20:	cdc78793          	addi	a5,a5,-804 # 8000bbf8 <_ZN15MemoryAllocator11usedMemHeadE>
    80002f24:	fb843703          	ld	a4,-72(s0)
    80002f28:	00e7b023          	sd	a4,0(a5)
    80002f2c:	0200006f          	j	80002f4c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x274>
        } else {
            newFragment->next = prevUsed->next;
    80002f30:	fe043783          	ld	a5,-32(s0)
    80002f34:	0007b703          	ld	a4,0(a5)
    80002f38:	fb843783          	ld	a5,-72(s0)
    80002f3c:	00e7b023          	sd	a4,0(a5)
            prevUsed->next = newFragment;
    80002f40:	fe043783          	ld	a5,-32(s0)
    80002f44:	fb843703          	ld	a4,-72(s0)
    80002f48:	00e7b023          	sd	a4,0(a5)
        }
        //return (char*)newFragment + sizeof(UsedMemSegment);
        return newFragment->usableFirstAddress;
    80002f4c:	fb843783          	ld	a5,-72(s0)
    80002f50:	0187b783          	ld	a5,24(a5)
    80002f54:	01c0006f          	j	80002f70 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x298>
        if (current->size < size) continue;
    80002f58:	00000013          	nop
    for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80002f5c:	fe843783          	ld	a5,-24(s0)
    80002f60:	0007b783          	ld	a5,0(a5)
    80002f64:	fef43423          	sd	a5,-24(s0)
    80002f68:	dddff06f          	j	80002d44 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x6c>
    }
    return nullptr;
    80002f6c:	00000793          	li	a5,0
}
    80002f70:	00078513          	mv	a0,a5
    80002f74:	05813403          	ld	s0,88(sp)
    80002f78:	06010113          	addi	sp,sp,96
    80002f7c:	00008067          	ret

0000000080002f80 <_ZN15MemoryAllocator5kfreeEPv>:

#pragma GCC optimize("O0")

int MemoryAllocator::kfree(void* ptr) {
    80002f80:	fb010113          	addi	sp,sp,-80
    80002f84:	04113423          	sd	ra,72(sp)
    80002f88:	04813023          	sd	s0,64(sp)
    80002f8c:	05010413          	addi	s0,sp,80
    80002f90:	faa43c23          	sd	a0,-72(s0)
    if (!ptr) return 0;
    80002f94:	fb843783          	ld	a5,-72(s0)
    80002f98:	00079663          	bnez	a5,80002fa4 <_ZN15MemoryAllocator5kfreeEPv+0x24>
    80002f9c:	00000793          	li	a5,0
    80002fa0:	1d40006f          	j	80003174 <_ZN15MemoryAllocator5kfreeEPv+0x1f4>
    if (!usedMemHead) return -1;
    80002fa4:	00009797          	auipc	a5,0x9
    80002fa8:	c5478793          	addi	a5,a5,-940 # 8000bbf8 <_ZN15MemoryAllocator11usedMemHeadE>
    80002fac:	0007b783          	ld	a5,0(a5)
    80002fb0:	00079663          	bnez	a5,80002fbc <_ZN15MemoryAllocator5kfreeEPv+0x3c>
    80002fb4:	fff00793          	li	a5,-1
    80002fb8:	1bc0006f          	j	80003174 <_ZN15MemoryAllocator5kfreeEPv+0x1f4>
    //ptr pokazuje na usableFirstAddress, pre toga je zaglavlje segmenta
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    80002fbc:	fb843783          	ld	a5,-72(s0)
    80002fc0:	fe078793          	addi	a5,a5,-32
    80002fc4:	faf43c23          	sd	a5,-72(s0)

    //trazenje adrese ptr u listi zauzetih segmenata
    UsedMemSegment* currentUsed = usedMemHead;
    80002fc8:	00009797          	auipc	a5,0x9
    80002fcc:	c3078793          	addi	a5,a5,-976 # 8000bbf8 <_ZN15MemoryAllocator11usedMemHeadE>
    80002fd0:	0007b783          	ld	a5,0(a5)
    80002fd4:	fef43423          	sd	a5,-24(s0)
    UsedMemSegment* prevUsed = nullptr;
    80002fd8:	fe043023          	sd	zero,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    80002fdc:	fe843783          	ld	a5,-24(s0)
    80002fe0:	02078463          	beqz	a5,80003008 <_ZN15MemoryAllocator5kfreeEPv+0x88>
    80002fe4:	fe843703          	ld	a4,-24(s0)
    80002fe8:	fb843783          	ld	a5,-72(s0)
    80002fec:	00f70e63          	beq	a4,a5,80003008 <_ZN15MemoryAllocator5kfreeEPv+0x88>
        prevUsed = currentUsed;
    80002ff0:	fe843783          	ld	a5,-24(s0)
    80002ff4:	fef43023          	sd	a5,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    80002ff8:	fe843783          	ld	a5,-24(s0)
    80002ffc:	0007b783          	ld	a5,0(a5)
    80003000:	fef43423          	sd	a5,-24(s0)
    80003004:	fd9ff06f          	j	80002fdc <_ZN15MemoryAllocator5kfreeEPv+0x5c>
    }
    if ((char*) currentUsed != (char*) ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80003008:	fe843703          	ld	a4,-24(s0)
    8000300c:	fb843783          	ld	a5,-72(s0)
    80003010:	00f70663          	beq	a4,a5,8000301c <_ZN15MemoryAllocator5kfreeEPv+0x9c>
    80003014:	fff00793          	li	a5,-1
    80003018:	15c0006f          	j	80003174 <_ZN15MemoryAllocator5kfreeEPv+0x1f4>

    //prevezivanje liste zauzetih segmenata
    if (prevUsed) prevUsed->next = currentUsed->next;
    8000301c:	fe043783          	ld	a5,-32(s0)
    80003020:	00078c63          	beqz	a5,80003038 <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    80003024:	fe843783          	ld	a5,-24(s0)
    80003028:	0007b703          	ld	a4,0(a5)
    8000302c:	fe043783          	ld	a5,-32(s0)
    80003030:	00e7b023          	sd	a4,0(a5)
    80003034:	0180006f          	j	8000304c <_ZN15MemoryAllocator5kfreeEPv+0xcc>
    else usedMemHead = currentUsed->next;
    80003038:	fe843783          	ld	a5,-24(s0)
    8000303c:	0007b703          	ld	a4,0(a5)
    80003040:	00009797          	auipc	a5,0x9
    80003044:	bb878793          	addi	a5,a5,-1096 # 8000bbf8 <_ZN15MemoryAllocator11usedMemHeadE>
    80003048:	00e7b023          	sd	a4,0(a5)

    //oslobadjanje segmenta i ubacivanje u listu slobodnih
    FreeMemSegment* prevFree = nullptr;
    8000304c:	fc043c23          	sd	zero,-40(s0)
    if (!freeMemHead || ((char*) ptr < (char*) freeMemHead)) {
    80003050:	00009797          	auipc	a5,0x9
    80003054:	bb078793          	addi	a5,a5,-1104 # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80003058:	0007b783          	ld	a5,0(a5)
    8000305c:	00078c63          	beqz	a5,80003074 <_ZN15MemoryAllocator5kfreeEPv+0xf4>
    80003060:	00009797          	auipc	a5,0x9
    80003064:	ba078793          	addi	a5,a5,-1120 # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80003068:	0007b783          	ld	a5,0(a5)
    8000306c:	fb843703          	ld	a4,-72(s0)
    80003070:	00f77663          	bgeu	a4,a5,8000307c <_ZN15MemoryAllocator5kfreeEPv+0xfc>
        prevFree = nullptr;
    80003074:	fc043c23          	sd	zero,-40(s0)
    80003078:	0400006f          	j	800030b8 <_ZN15MemoryAllocator5kfreeEPv+0x138>
    } else {
        for (prevFree = freeMemHead;
    8000307c:	00009797          	auipc	a5,0x9
    80003080:	b8478793          	addi	a5,a5,-1148 # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80003084:	0007b783          	ld	a5,0(a5)
    80003088:	fcf43c23          	sd	a5,-40(s0)
             prevFree->next && (char*) ptr > (char*) (prevFree->next); prevFree = prevFree->next);
    8000308c:	fd843783          	ld	a5,-40(s0)
    80003090:	0007b783          	ld	a5,0(a5)
    80003094:	02078263          	beqz	a5,800030b8 <_ZN15MemoryAllocator5kfreeEPv+0x138>
    80003098:	fd843783          	ld	a5,-40(s0)
    8000309c:	0007b783          	ld	a5,0(a5)
    800030a0:	fb843703          	ld	a4,-72(s0)
    800030a4:	00e7fa63          	bgeu	a5,a4,800030b8 <_ZN15MemoryAllocator5kfreeEPv+0x138>
    800030a8:	fd843783          	ld	a5,-40(s0)
    800030ac:	0007b783          	ld	a5,0(a5)
    800030b0:	fcf43c23          	sd	a5,-40(s0)
        for (prevFree = freeMemHead;
    800030b4:	fd9ff06f          	j	8000308c <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    }
    FreeMemSegment* newFree = (FreeMemSegment*) ptr;
    800030b8:	fb843783          	ld	a5,-72(s0)
    800030bc:	fcf43823          	sd	a5,-48(s0)
    size_t segmentSize = ((UsedMemSegment*) ptr)->size;
    800030c0:	fb843783          	ld	a5,-72(s0)
    800030c4:	0087b783          	ld	a5,8(a5)
    800030c8:	fcf43423          	sd	a5,-56(s0)
    newFree->size = segmentSize;
    800030cc:	fd043783          	ld	a5,-48(s0)
    800030d0:	fc843703          	ld	a4,-56(s0)
    800030d4:	00e7b823          	sd	a4,16(a5)
    newFree->prev = prevFree;
    800030d8:	fd043783          	ld	a5,-48(s0)
    800030dc:	fd843703          	ld	a4,-40(s0)
    800030e0:	00e7b423          	sd	a4,8(a5)
    if (prevFree) newFree->next = prevFree->next;
    800030e4:	fd843783          	ld	a5,-40(s0)
    800030e8:	00078c63          	beqz	a5,80003100 <_ZN15MemoryAllocator5kfreeEPv+0x180>
    800030ec:	fd843783          	ld	a5,-40(s0)
    800030f0:	0007b703          	ld	a4,0(a5)
    800030f4:	fd043783          	ld	a5,-48(s0)
    800030f8:	00e7b023          	sd	a4,0(a5)
    800030fc:	0180006f          	j	80003114 <_ZN15MemoryAllocator5kfreeEPv+0x194>
    else newFree->next = freeMemHead;
    80003100:	00009797          	auipc	a5,0x9
    80003104:	b0078793          	addi	a5,a5,-1280 # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80003108:	0007b703          	ld	a4,0(a5)
    8000310c:	fd043783          	ld	a5,-48(s0)
    80003110:	00e7b023          	sd	a4,0(a5)
    if (newFree->next) newFree->next->prev = newFree;
    80003114:	fd043783          	ld	a5,-48(s0)
    80003118:	0007b783          	ld	a5,0(a5)
    8000311c:	00078a63          	beqz	a5,80003130 <_ZN15MemoryAllocator5kfreeEPv+0x1b0>
    80003120:	fd043783          	ld	a5,-48(s0)
    80003124:	0007b783          	ld	a5,0(a5)
    80003128:	fd043703          	ld	a4,-48(s0)
    8000312c:	00e7b423          	sd	a4,8(a5)
    if (prevFree) prevFree->next = newFree;
    80003130:	fd843783          	ld	a5,-40(s0)
    80003134:	00078a63          	beqz	a5,80003148 <_ZN15MemoryAllocator5kfreeEPv+0x1c8>
    80003138:	fd843783          	ld	a5,-40(s0)
    8000313c:	fd043703          	ld	a4,-48(s0)
    80003140:	00e7b023          	sd	a4,0(a5)
    80003144:	0140006f          	j	80003158 <_ZN15MemoryAllocator5kfreeEPv+0x1d8>
    else freeMemHead = newFree;
    80003148:	00009797          	auipc	a5,0x9
    8000314c:	ab878793          	addi	a5,a5,-1352 # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80003150:	fd043703          	ld	a4,-48(s0)
    80003154:	00e7b023          	sd	a4,0(a5)

    //spajanje uzastopnih slobodnih segmenata
    tryToJoin(newFree);
    80003158:	fd043503          	ld	a0,-48(s0)
    8000315c:	00000097          	auipc	ra,0x0
    80003160:	02c080e7          	jalr	44(ra) # 80003188 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    tryToJoin(prevFree);
    80003164:	fd843503          	ld	a0,-40(s0)
    80003168:	00000097          	auipc	ra,0x0
    8000316c:	020080e7          	jalr	32(ra) # 80003188 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    return 0;
    80003170:	00000793          	li	a5,0
}
    80003174:	00078513          	mv	a0,a5
    80003178:	04813083          	ld	ra,72(sp)
    8000317c:	04013403          	ld	s0,64(sp)
    80003180:	05010113          	addi	sp,sp,80
    80003184:	00008067          	ret

0000000080003188 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:

#pragma GCC optimize("O0")

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    80003188:	fc010113          	addi	sp,sp,-64
    8000318c:	02813c23          	sd	s0,56(sp)
    80003190:	04010413          	addi	s0,sp,64
    80003194:	fca43423          	sd	a0,-56(s0)
    if (!current) return 0;
    80003198:	fc843783          	ld	a5,-56(s0)
    8000319c:	00079663          	bnez	a5,800031a8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x20>
    800031a0:	00000793          	li	a5,0
    800031a4:	0bc0006f          	j	80003260 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xd8>
    bool nextExists = current->next != nullptr;
    800031a8:	fc843783          	ld	a5,-56(s0)
    800031ac:	0007b783          	ld	a5,0(a5)
    800031b0:	00f037b3          	snez	a5,a5
    800031b4:	fef407a3          	sb	a5,-17(s0)
    char* nextAddr = (char*) current + current->size;
    800031b8:	fc843783          	ld	a5,-56(s0)
    800031bc:	0107b783          	ld	a5,16(a5)
    800031c0:	fc843703          	ld	a4,-56(s0)
    800031c4:	00f707b3          	add	a5,a4,a5
    800031c8:	fef43023          	sd	a5,-32(s0)
    char* cnext = (char*) current->next;
    800031cc:	fc843783          	ld	a5,-56(s0)
    800031d0:	0007b783          	ld	a5,0(a5)
    800031d4:	fcf43c23          	sd	a5,-40(s0)
    bool nextIsConnected = (nextAddr == cnext);
    800031d8:	fe043703          	ld	a4,-32(s0)
    800031dc:	fd843783          	ld	a5,-40(s0)
    800031e0:	40f707b3          	sub	a5,a4,a5
    800031e4:	0017b793          	seqz	a5,a5
    800031e8:	fcf40ba3          	sb	a5,-41(s0)
    if (nextExists && nextIsConnected) {
    800031ec:	fef44783          	lbu	a5,-17(s0)
    800031f0:	0ff7f793          	andi	a5,a5,255
    800031f4:	06078463          	beqz	a5,8000325c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xd4>
    800031f8:	fd744783          	lbu	a5,-41(s0)
    800031fc:	0ff7f793          	andi	a5,a5,255
    80003200:	04078e63          	beqz	a5,8000325c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xd4>
        current->size += current->next->size;
    80003204:	fc843783          	ld	a5,-56(s0)
    80003208:	0107b703          	ld	a4,16(a5)
    8000320c:	fc843783          	ld	a5,-56(s0)
    80003210:	0007b783          	ld	a5,0(a5)
    80003214:	0107b783          	ld	a5,16(a5)
    80003218:	00f70733          	add	a4,a4,a5
    8000321c:	fc843783          	ld	a5,-56(s0)
    80003220:	00e7b823          	sd	a4,16(a5)
        current->next = current->next->next;
    80003224:	fc843783          	ld	a5,-56(s0)
    80003228:	0007b783          	ld	a5,0(a5)
    8000322c:	0007b703          	ld	a4,0(a5)
    80003230:	fc843783          	ld	a5,-56(s0)
    80003234:	00e7b023          	sd	a4,0(a5)
        if (current->next) current->next->prev = current;
    80003238:	fc843783          	ld	a5,-56(s0)
    8000323c:	0007b783          	ld	a5,0(a5)
    80003240:	00078a63          	beqz	a5,80003254 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xcc>
    80003244:	fc843783          	ld	a5,-56(s0)
    80003248:	0007b783          	ld	a5,0(a5)
    8000324c:	fc843703          	ld	a4,-56(s0)
    80003250:	00e7b423          	sd	a4,8(a5)
        return 1;
    80003254:	00100793          	li	a5,1
    80003258:	0080006f          	j	80003260 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xd8>
    } else return 0;
    8000325c:	00000793          	li	a5,0
}
    80003260:	00078513          	mv	a0,a5
    80003264:	03813403          	ld	s0,56(sp)
    80003268:	04010113          	addi	sp,sp,64
    8000326c:	00008067          	ret

0000000080003270 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>:

bool MemoryAllocator::checkPurpose(void* ptr, MemoryAllocator::Purpose p) {
    80003270:	fe010113          	addi	sp,sp,-32
    80003274:	00813c23          	sd	s0,24(sp)
    80003278:	02010413          	addi	s0,sp,32
    8000327c:	fea43423          	sd	a0,-24(s0)
    80003280:	00058793          	mv	a5,a1
    80003284:	fef42223          	sw	a5,-28(s0)
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    80003288:	fe843783          	ld	a5,-24(s0)
    8000328c:	fe078793          	addi	a5,a5,-32
    80003290:	fef43423          	sd	a5,-24(s0)
    return ((UsedMemSegment*) ptr)->purpose == p;
    80003294:	fe843783          	ld	a5,-24(s0)
    80003298:	0107a703          	lw	a4,16(a5)
    8000329c:	fe442783          	lw	a5,-28(s0)
    800032a0:	0007879b          	sext.w	a5,a5
    800032a4:	40e787b3          	sub	a5,a5,a4
    800032a8:	0017b793          	seqz	a5,a5
    800032ac:	0ff7f793          	andi	a5,a5,255
}
    800032b0:	00078513          	mv	a0,a5
    800032b4:	01813403          	ld	s0,24(sp)
    800032b8:	02010113          	addi	sp,sp,32
    800032bc:	00008067          	ret

00000000800032c0 <_ZN15MemoryAllocator19initMemoryAllocatorEv>:

void MemoryAllocator::initMemoryAllocator() {
    800032c0:	ff010113          	addi	sp,sp,-16
    800032c4:	00813423          	sd	s0,8(sp)
    800032c8:	01010413          	addi	s0,sp,16
//pocetna inicijalizacija
    if (!initialized) {
    800032cc:	00009797          	auipc	a5,0x9
    800032d0:	93c78793          	addi	a5,a5,-1732 # 8000bc08 <_ZN15MemoryAllocator11initializedE>
    800032d4:	0007c783          	lbu	a5,0(a5)
    800032d8:	0017c793          	xori	a5,a5,1
    800032dc:	0ff7f793          	andi	a5,a5,255
    800032e0:	08078263          	beqz	a5,80003364 <_ZN15MemoryAllocator19initMemoryAllocatorEv+0xa4>
        freeMemHead = (FreeMemSegment*) HEAP_START_ADDR;
    800032e4:	00008797          	auipc	a5,0x8
    800032e8:	78c7b783          	ld	a5,1932(a5) # 8000ba70 <_GLOBAL_OFFSET_TABLE_+0x28>
    800032ec:	0007b703          	ld	a4,0(a5)
    800032f0:	00009797          	auipc	a5,0x9
    800032f4:	91078793          	addi	a5,a5,-1776 # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    800032f8:	00e7b023          	sd	a4,0(a5)
        freeMemHead->next = nullptr;
    800032fc:	00009797          	auipc	a5,0x9
    80003300:	90478793          	addi	a5,a5,-1788 # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80003304:	0007b783          	ld	a5,0(a5)
    80003308:	0007b023          	sd	zero,0(a5)
        freeMemHead->prev = nullptr;
    8000330c:	00009797          	auipc	a5,0x9
    80003310:	8f478793          	addi	a5,a5,-1804 # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80003314:	0007b783          	ld	a5,0(a5)
    80003318:	0007b423          	sd	zero,8(a5)
        freeMemHead->size = (char*) HEAP_END_ADDR - (char*) HEAP_START_ADDR;//- sizeof(FreeMemSegment);
    8000331c:	00008797          	auipc	a5,0x8
    80003320:	78c7b783          	ld	a5,1932(a5) # 8000baa8 <_GLOBAL_OFFSET_TABLE_+0x60>
    80003324:	0007b703          	ld	a4,0(a5)
    80003328:	00008797          	auipc	a5,0x8
    8000332c:	7487b783          	ld	a5,1864(a5) # 8000ba70 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003330:	0007b783          	ld	a5,0(a5)
    80003334:	40f70733          	sub	a4,a4,a5
    80003338:	00009797          	auipc	a5,0x9
    8000333c:	8c878793          	addi	a5,a5,-1848 # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80003340:	0007b783          	ld	a5,0(a5)
    80003344:	00e7b823          	sd	a4,16(a5)
        usedMemHead = nullptr;
    80003348:	00009797          	auipc	a5,0x9
    8000334c:	8b078793          	addi	a5,a5,-1872 # 8000bbf8 <_ZN15MemoryAllocator11usedMemHeadE>
    80003350:	0007b023          	sd	zero,0(a5)

        initialized = true;
    80003354:	00009797          	auipc	a5,0x9
    80003358:	8b478793          	addi	a5,a5,-1868 # 8000bc08 <_ZN15MemoryAllocator11initializedE>
    8000335c:	00100713          	li	a4,1
    80003360:	00e78023          	sb	a4,0(a5)
    }
}
    80003364:	00000013          	nop
    80003368:	00813403          	ld	s0,8(sp)
    8000336c:	01010113          	addi	sp,sp,16
    80003370:	00008067          	ret

0000000080003374 <_ZN4KSemnwEm>:

#include "../h/KSem.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void* KSem::operator new(size_t size) {
    80003374:	ff010113          	addi	sp,sp,-16
    80003378:	00113423          	sd	ra,8(sp)
    8000337c:	00813023          	sd	s0,0(sp)
    80003380:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80003384:	ffffe097          	auipc	ra,0xffffe
    80003388:	f8c080e7          	jalr	-116(ra) # 80001310 <_Z9mem_allocm>
	//return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::SEMAPHORE);
}
    8000338c:	00813083          	ld	ra,8(sp)
    80003390:	00013403          	ld	s0,0(sp)
    80003394:	01010113          	addi	sp,sp,16
    80003398:	00008067          	ret

000000008000339c <_ZN4KSemdlEPv>:

void KSem::operator delete(void* ptr) {
    8000339c:	ff010113          	addi	sp,sp,-16
    800033a0:	00113423          	sd	ra,8(sp)
    800033a4:	00813023          	sd	s0,0(sp)
    800033a8:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    800033ac:	ffffe097          	auipc	ra,0xffffe
    800033b0:	fa4080e7          	jalr	-92(ra) # 80001350 <_Z8mem_freePv>
	//MemoryAllocator::kfree(ptr);
}
    800033b4:	00813083          	ld	ra,8(sp)
    800033b8:	00013403          	ld	s0,0(sp)
    800033bc:	01010113          	addi	sp,sp,16
    800033c0:	00008067          	ret

00000000800033c4 <_ZN4KSem7initSemEj>:

KSem* KSem::initSem(uint val) {
    800033c4:	fe010113          	addi	sp,sp,-32
    800033c8:	00113c23          	sd	ra,24(sp)
    800033cc:	00813823          	sd	s0,16(sp)
    800033d0:	00913423          	sd	s1,8(sp)
    800033d4:	02010413          	addi	s0,sp,32
    800033d8:	00050493          	mv	s1,a0
	return new KSem(val);
    800033dc:	02000513          	li	a0,32
    800033e0:	00000097          	auipc	ra,0x0
    800033e4:	f94080e7          	jalr	-108(ra) # 80003374 <_ZN4KSemnwEm>
	void block();

	void unblock();

private:
	KSem(uint val) : val(val), working(true) {}
    800033e8:	00952023          	sw	s1,0(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    800033ec:	00053423          	sd	zero,8(a0)
    800033f0:	00053823          	sd	zero,16(a0)
    800033f4:	00100713          	li	a4,1
    800033f8:	00e50c23          	sb	a4,24(a0)
}
    800033fc:	01813083          	ld	ra,24(sp)
    80003400:	01013403          	ld	s0,16(sp)
    80003404:	00813483          	ld	s1,8(sp)
    80003408:	02010113          	addi	sp,sp,32
    8000340c:	00008067          	ret

0000000080003410 <_ZN4KSem5blockEv>:
		unblock();
	}
	return 0;
}

void KSem::block() {
    80003410:	ff010113          	addi	sp,sp,-16
    80003414:	00113423          	sd	ra,8(sp)
    80003418:	00813023          	sd	s0,0(sp)
    8000341c:	01010413          	addi	s0,sp,16
	TCB::running->setBlocked(true);
    80003420:	00008797          	auipc	a5,0x8
    80003424:	6807b783          	ld	a5,1664(a5) # 8000baa0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80003428:	0007b583          	ld	a1,0(a5)
	void setBlocked(bool block) { this->blocked = block; }
    8000342c:	00100793          	li	a5,1
    80003430:	02f588a3          	sb	a5,49(a1)
	blocked.putLast(TCB::running);
    80003434:	00850513          	addi	a0,a0,8
    80003438:	ffffe097          	auipc	ra,0xffffe
    8000343c:	e0c080e7          	jalr	-500(ra) # 80001244 <_ZN11ThreadQueue7putLastEP3TCB>
	TCB::yield();
    80003440:	fffff097          	auipc	ra,0xfffff
    80003444:	664080e7          	jalr	1636(ra) # 80002aa4 <_ZN3TCB5yieldEv>
}
    80003448:	00813083          	ld	ra,8(sp)
    8000344c:	00013403          	ld	s0,0(sp)
    80003450:	01010113          	addi	sp,sp,16
    80003454:	00008067          	ret

0000000080003458 <_ZN4KSem4waitEv>:
	if (!working) return -3;
    80003458:	01854783          	lbu	a5,24(a0)
    8000345c:	04078663          	beqz	a5,800034a8 <_ZN4KSem4waitEv+0x50>
	if (--val < 0) {
    80003460:	00052783          	lw	a5,0(a0)
    80003464:	fff7879b          	addiw	a5,a5,-1
    80003468:	00f52023          	sw	a5,0(a0)
    8000346c:	02079713          	slli	a4,a5,0x20
    80003470:	00074663          	bltz	a4,8000347c <_ZN4KSem4waitEv+0x24>
	return 0;
    80003474:	00000513          	li	a0,0
}
    80003478:	00008067          	ret
int KSem::wait() {
    8000347c:	ff010113          	addi	sp,sp,-16
    80003480:	00113423          	sd	ra,8(sp)
    80003484:	00813023          	sd	s0,0(sp)
    80003488:	01010413          	addi	s0,sp,16
		block();
    8000348c:	00000097          	auipc	ra,0x0
    80003490:	f84080e7          	jalr	-124(ra) # 80003410 <_ZN4KSem5blockEv>
		return -1;
    80003494:	fff00513          	li	a0,-1
}
    80003498:	00813083          	ld	ra,8(sp)
    8000349c:	00013403          	ld	s0,0(sp)
    800034a0:	01010113          	addi	sp,sp,16
    800034a4:	00008067          	ret
	if (!working) return -3;
    800034a8:	ffd00513          	li	a0,-3
    800034ac:	00008067          	ret

00000000800034b0 <_ZN4KSem7unblockEv>:

void KSem::unblock() {
    800034b0:	ff010113          	addi	sp,sp,-16
    800034b4:	00113423          	sd	ra,8(sp)
    800034b8:	00813023          	sd	s0,0(sp)
    800034bc:	01010413          	addi	s0,sp,16
	TCB* tcb = blocked.getFirst();
    800034c0:	00850513          	addi	a0,a0,8
    800034c4:	ffffe097          	auipc	ra,0xffffe
    800034c8:	dec080e7          	jalr	-532(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
    800034cc:	020508a3          	sb	zero,49(a0)
	tcb->setBlocked(false);
	Scheduler::put(tcb);
    800034d0:	ffffe097          	auipc	ra,0xffffe
    800034d4:	580080e7          	jalr	1408(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
}
    800034d8:	00813083          	ld	ra,8(sp)
    800034dc:	00013403          	ld	s0,0(sp)
    800034e0:	01010113          	addi	sp,sp,16
    800034e4:	00008067          	ret

00000000800034e8 <_ZN4KSem6signalEv>:
	if (!working) return -3;
    800034e8:	01854783          	lbu	a5,24(a0)
    800034ec:	04078463          	beqz	a5,80003534 <_ZN4KSem6signalEv+0x4c>
	if (val++ < 0) {
    800034f0:	00052783          	lw	a5,0(a0)
    800034f4:	0017871b          	addiw	a4,a5,1
    800034f8:	00e52023          	sw	a4,0(a0)
    800034fc:	0007c663          	bltz	a5,80003508 <_ZN4KSem6signalEv+0x20>
	return 0;
    80003500:	00000513          	li	a0,0
}
    80003504:	00008067          	ret
int KSem::signal() {
    80003508:	ff010113          	addi	sp,sp,-16
    8000350c:	00113423          	sd	ra,8(sp)
    80003510:	00813023          	sd	s0,0(sp)
    80003514:	01010413          	addi	s0,sp,16
		unblock();
    80003518:	00000097          	auipc	ra,0x0
    8000351c:	f98080e7          	jalr	-104(ra) # 800034b0 <_ZN4KSem7unblockEv>
	return 0;
    80003520:	00000513          	li	a0,0
}
    80003524:	00813083          	ld	ra,8(sp)
    80003528:	00013403          	ld	s0,0(sp)
    8000352c:	01010113          	addi	sp,sp,16
    80003530:	00008067          	ret
	if (!working) return -3;
    80003534:	ffd00513          	li	a0,-3
    80003538:	00008067          	ret

000000008000353c <_ZN4KSem8closeSemEPS_>:

int KSem::closeSem(sem_t handle) {
    8000353c:	fe010113          	addi	sp,sp,-32
    80003540:	00113c23          	sd	ra,24(sp)
    80003544:	00813823          	sd	s0,16(sp)
    80003548:	00913423          	sd	s1,8(sp)
    8000354c:	02010413          	addi	s0,sp,32
    80003550:	00050493          	mv	s1,a0
	//if (!MemoryAllocator::checkPurpose(handle, MemoryAllocator::SEMAPHORE)) return -2;
	handle->working = false;
    80003554:	00050c23          	sb	zero,24(a0)
        bool ret = front == nullptr;
    80003558:	0084b783          	ld	a5,8(s1)
	while (!handle->blocked.isEmpty()) {
    8000355c:	02078063          	beqz	a5,8000357c <_ZN4KSem8closeSemEPS_+0x40>
		TCB* tcb = handle->blocked.getFirst();
    80003560:	00848513          	addi	a0,s1,8
    80003564:	ffffe097          	auipc	ra,0xffffe
    80003568:	d4c080e7          	jalr	-692(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
    8000356c:	020508a3          	sb	zero,49(a0)
		tcb->setBlocked(false);
		Scheduler::put(tcb);
    80003570:	ffffe097          	auipc	ra,0xffffe
    80003574:	4e0080e7          	jalr	1248(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
	while (!handle->blocked.isEmpty()) {
    80003578:	fe1ff06f          	j	80003558 <_ZN4KSem8closeSemEPS_+0x1c>
	}
	return 0;
}
    8000357c:	00000513          	li	a0,0
    80003580:	01813083          	ld	ra,24(sp)
    80003584:	01013403          	ld	s0,16(sp)
    80003588:	00813483          	ld	s1,8(sp)
    8000358c:	02010113          	addi	sp,sp,32
    80003590:	00008067          	ret

0000000080003594 <_Z10testMemoryv>:
    return pok;
}

#pragma GCC optimize("O0")

void testMemory() {
    80003594:	e6010113          	addi	sp,sp,-416
    80003598:	18113c23          	sd	ra,408(sp)
    8000359c:	18813823          	sd	s0,400(sp)
    800035a0:	1a010413          	addi	s0,sp,416
    char* pokazivaci[50];
    pokazivaci[0] = nullptr;
    800035a4:	e6043023          	sd	zero,-416(s0)
    pokazivaci[0] = upisi(1024 + 768);
    800035a8:	70000513          	li	a0,1792
    800035ac:	00000097          	auipc	ra,0x0
    800035b0:	1f8080e7          	jalr	504(ra) # 800037a4 <_Z5upisim>
    800035b4:	00050793          	mv	a5,a0
    800035b8:	e6f43023          	sd	a5,-416(s0)
    if (pokazivaci[0]) {
    800035bc:	e6043783          	ld	a5,-416(s0)
    800035c0:	02078c63          	beqz	a5,800035f8 <_Z10testMemoryv+0x64>
        if (pokazivaci[0][0] == '8') {
    800035c4:	e6043783          	ld	a5,-416(s0)
    800035c8:	0007c783          	lbu	a5,0(a5)
    800035cc:	00078713          	mv	a4,a5
    800035d0:	03800793          	li	a5,56
    800035d4:	00f71a63          	bne	a4,a5,800035e8 <_Z10testMemoryv+0x54>
            printString("nea");
    800035d8:	00006517          	auipc	a0,0x6
    800035dc:	c2850513          	addi	a0,a0,-984 # 80009200 <_ZZ9kPrintIntmE6digits+0x190>
    800035e0:	00002097          	auipc	ra,0x2
    800035e4:	6b4080e7          	jalr	1716(ra) # 80005c94 <_Z11printStringPKc>
        }
        MemoryAllocator::kfree(pokazivaci[0]);
    800035e8:	e6043783          	ld	a5,-416(s0)
    800035ec:	00078513          	mv	a0,a5
    800035f0:	00000097          	auipc	ra,0x0
    800035f4:	990080e7          	jalr	-1648(ra) # 80002f80 <_ZN15MemoryAllocator5kfreeEPv>
    }


    pokazivaci[0] = upisi(4096);
    800035f8:	00001537          	lui	a0,0x1
    800035fc:	00000097          	auipc	ra,0x0
    80003600:	1a8080e7          	jalr	424(ra) # 800037a4 <_Z5upisim>
    80003604:	00050793          	mv	a5,a0
    80003608:	e6f43023          	sd	a5,-416(s0)
    if (pokazivaci[0]) {
    8000360c:	e6043783          	ld	a5,-416(s0)
    80003610:	00078a63          	beqz	a5,80003624 <_Z10testMemoryv+0x90>
        MemoryAllocator::kfree(pokazivaci[0]);
    80003614:	e6043783          	ld	a5,-416(s0)
    80003618:	00078513          	mv	a0,a5
    8000361c:	00000097          	auipc	ra,0x0
    80003620:	964080e7          	jalr	-1692(ra) # 80002f80 <_ZN15MemoryAllocator5kfreeEPv>
    }

    pokazivaci[0] = upisi(1024 + 768);
    80003624:	70000513          	li	a0,1792
    80003628:	00000097          	auipc	ra,0x0
    8000362c:	17c080e7          	jalr	380(ra) # 800037a4 <_Z5upisim>
    80003630:	00050793          	mv	a5,a0
    80003634:	e6f43023          	sd	a5,-416(s0)
    MemoryAllocator::kfree(pokazivaci[0]);
    80003638:	e6043783          	ld	a5,-416(s0)
    8000363c:	00078513          	mv	a0,a5
    80003640:	00000097          	auipc	ra,0x0
    80003644:	940080e7          	jalr	-1728(ra) # 80002f80 <_ZN15MemoryAllocator5kfreeEPv>

}
    80003648:	00000013          	nop
    8000364c:	19813083          	ld	ra,408(sp)
    80003650:	19013403          	ld	s0,400(sp)
    80003654:	1a010113          	addi	sp,sp,416
    80003658:	00008067          	ret

000000008000365c <_Z5nit1fPv>:

void nit1f(void*) {
    8000365c:	fe010113          	addi	sp,sp,-32
    80003660:	00113c23          	sd	ra,24(sp)
    80003664:	00813823          	sd	s0,16(sp)
    80003668:	02010413          	addi	s0,sp,32
    8000366c:	fea43423          	sd	a0,-24(s0)
//		printString("\nsem_wait za nit 1 vratio ");
//		printInteger(res);
//		printString("\n");
//	}

    printString("\nGotova nit 1\n");
    80003670:	00006517          	auipc	a0,0x6
    80003674:	b9850513          	addi	a0,a0,-1128 # 80009208 <_ZZ9kPrintIntmE6digits+0x198>
    80003678:	00002097          	auipc	ra,0x2
    8000367c:	61c080e7          	jalr	1564(ra) # 80005c94 <_Z11printStringPKc>
}
    80003680:	00000013          	nop
    80003684:	01813083          	ld	ra,24(sp)
    80003688:	01013403          	ld	s0,16(sp)
    8000368c:	02010113          	addi	sp,sp,32
    80003690:	00008067          	ret

0000000080003694 <_Z5nit2fPv>:

void nit2f(void* arg2) {
    80003694:	fe010113          	addi	sp,sp,-32
    80003698:	00113c23          	sd	ra,24(sp)
    8000369c:	00813823          	sd	s0,16(sp)
    800036a0:	02010413          	addi	s0,sp,32
    800036a4:	fea43423          	sd	a0,-24(s0)
//		//sem_close(semA);
//		printString("\nNit 2 ubija semafor\n");
//		delete semA;
//
//	}
    printString("\nGotova nit 2\n");
    800036a8:	00006517          	auipc	a0,0x6
    800036ac:	b7050513          	addi	a0,a0,-1168 # 80009218 <_ZZ9kPrintIntmE6digits+0x1a8>
    800036b0:	00002097          	auipc	ra,0x2
    800036b4:	5e4080e7          	jalr	1508(ra) # 80005c94 <_Z11printStringPKc>
}
    800036b8:	00000013          	nop
    800036bc:	01813083          	ld	ra,24(sp)
    800036c0:	01013403          	ld	s0,16(sp)
    800036c4:	02010113          	addi	sp,sp,32
    800036c8:	00008067          	ret

00000000800036cc <_Z5nit3fPv>:


void nit3f(void*) {
    800036cc:	fd010113          	addi	sp,sp,-48
    800036d0:	02113423          	sd	ra,40(sp)
    800036d4:	02813023          	sd	s0,32(sp)
    800036d8:	03010413          	addi	s0,sp,48
    800036dc:	fca43c23          	sd	a0,-40(s0)
    char slovo;
    do {
        slovo = getc();
    800036e0:	ffffe097          	auipc	ra,0xffffe
    800036e4:	e88080e7          	jalr	-376(ra) # 80001568 <_Z4getcv>
    800036e8:	00050793          	mv	a5,a0
    800036ec:	fef407a3          	sb	a5,-17(s0)
        putc(slovo);
    800036f0:	fef44783          	lbu	a5,-17(s0)
    800036f4:	00078513          	mv	a0,a5
    800036f8:	ffffe097          	auipc	ra,0xffffe
    800036fc:	e98080e7          	jalr	-360(ra) # 80001590 <_Z4putcc>
        if (slovo == '\r') putc('\n');
    80003700:	fef44783          	lbu	a5,-17(s0)
    80003704:	0ff7f713          	andi	a4,a5,255
    80003708:	00d00793          	li	a5,13
    8000370c:	00f71863          	bne	a4,a5,8000371c <_Z5nit3fPv+0x50>
    80003710:	00a00513          	li	a0,10
    80003714:	ffffe097          	auipc	ra,0xffffe
    80003718:	e7c080e7          	jalr	-388(ra) # 80001590 <_Z4putcc>
    } while (slovo != '0');
    8000371c:	fef44783          	lbu	a5,-17(s0)
    80003720:	0ff7f713          	andi	a4,a5,255
    80003724:	03000793          	li	a5,48
    80003728:	00f70463          	beq	a4,a5,80003730 <_Z5nit3fPv+0x64>
    do {
    8000372c:	fb5ff06f          	j	800036e0 <_Z5nit3fPv+0x14>

    printString("\nGotova nit3\n");
    80003730:	00006517          	auipc	a0,0x6
    80003734:	af850513          	addi	a0,a0,-1288 # 80009228 <_ZZ9kPrintIntmE6digits+0x1b8>
    80003738:	00002097          	auipc	ra,0x2
    8000373c:	55c080e7          	jalr	1372(ra) # 80005c94 <_Z11printStringPKc>
}
    80003740:	00000013          	nop
    80003744:	02813083          	ld	ra,40(sp)
    80003748:	02013403          	ld	s0,32(sp)
    8000374c:	03010113          	addi	sp,sp,48
    80003750:	00008067          	ret

0000000080003754 <_Z8testMainv>:

int testMain() {
    80003754:	ff010113          	addi	sp,sp,-16
    80003758:	00113423          	sd	ra,8(sp)
    8000375c:	00813023          	sd	s0,0(sp)
    80003760:	01010413          	addi	s0,sp,16
//postavi adresu prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80003764:	00008797          	auipc	a5,0x8
    80003768:	34c7b783          	ld	a5,844(a5) # 8000bab0 <_GLOBAL_OFFSET_TABLE_+0x68>
    8000376c:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    MemoryAllocator::initMemoryAllocator();
    80003770:	00000097          	auipc	ra,0x0
    80003774:	b50080e7          	jalr	-1200(ra) # 800032c0 <_ZN15MemoryAllocator19initMemoryAllocatorEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    80003778:	ffffe097          	auipc	ra,0xffffe
    8000377c:	ee8080e7          	jalr	-280(ra) # 80001660 <_ZN8KConsole12initKConsoleEv>
//	printString("\nGotove user niti\n");
//
//	printString("\nSad cu da izadjem\n");
//	while(KConsole::outputHead!=KConsole::outputTail){}
//	//zabrani prekide
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    80003780:	00200513          	li	a0,2
    80003784:	00000097          	auipc	ra,0x0
    80003788:	07c080e7          	jalr	124(ra) # 80003800 <_ZN5Riscv10mc_sstatusEm>


    return 0;
    8000378c:	00000793          	li	a5,0
    80003790:	00078513          	mv	a0,a5
    80003794:	00813083          	ld	ra,8(sp)
    80003798:	00013403          	ld	s0,0(sp)
    8000379c:	01010113          	addi	sp,sp,16
    800037a0:	00008067          	ret

00000000800037a4 <_Z5upisim>:
char* upisi(size_t alociraj) {
    800037a4:	fe010113          	addi	sp,sp,-32
    800037a8:	00113c23          	sd	ra,24(sp)
    800037ac:	00813823          	sd	s0,16(sp)
    800037b0:	00913423          	sd	s1,8(sp)
    800037b4:	02010413          	addi	s0,sp,32
    800037b8:	00050493          	mv	s1,a0
    char* pok = (char*) MemoryAllocator::kmalloc(alociraj);
    800037bc:	00300593          	li	a1,3
    800037c0:	fffff097          	auipc	ra,0xfffff
    800037c4:	518080e7          	jalr	1304(ra) # 80002cd8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
    if (pok) {
    800037c8:	02050263          	beqz	a0,800037ec <_Z5upisim+0x48>
        for (uint64 i = 0; i < alociraj - sizeof(MemoryAllocator::UsedMemSegment); i++) {
    800037cc:	00000793          	li	a5,0
    800037d0:	0140006f          	j	800037e4 <_Z5upisim+0x40>
            pok[i] = '8';
    800037d4:	00f50733          	add	a4,a0,a5
    800037d8:	03800693          	li	a3,56
    800037dc:	00d70023          	sb	a3,0(a4)
        for (uint64 i = 0; i < alociraj - sizeof(MemoryAllocator::UsedMemSegment); i++) {
    800037e0:	00178793          	addi	a5,a5,1
    800037e4:	fe048713          	addi	a4,s1,-32
    800037e8:	fee7e6e3          	bltu	a5,a4,800037d4 <_Z5upisim+0x30>
}
    800037ec:	01813083          	ld	ra,24(sp)
    800037f0:	01013403          	ld	s0,16(sp)
    800037f4:	00813483          	ld	s1,8(sp)
    800037f8:	02010113          	addi	sp,sp,32
    800037fc:	00008067          	ret

0000000080003800 <_ZN5Riscv10mc_sstatusEm>:
inline void Riscv::mc_sstatus(uint64 mask) {
    80003800:	ff010113          	addi	sp,sp,-16
    80003804:	00813423          	sd	s0,8(sp)
    80003808:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    8000380c:	10053073          	csrc	sstatus,a0
}
    80003810:	00813403          	ld	s0,8(sp)
    80003814:	01010113          	addi	sp,sp,16
    80003818:	00008067          	ret

000000008000381c <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    8000381c:	fe010113          	addi	sp,sp,-32
    80003820:	00113c23          	sd	ra,24(sp)
    80003824:	00813823          	sd	s0,16(sp)
    80003828:	00913423          	sd	s1,8(sp)
    8000382c:	01213023          	sd	s2,0(sp)
    80003830:	02010413          	addi	s0,sp,32
    80003834:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80003838:	00000913          	li	s2,0
    8000383c:	00c0006f          	j	80003848 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003840:	ffffe097          	auipc	ra,0xffffe
    80003844:	be8080e7          	jalr	-1048(ra) # 80001428 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
    80003848:	ffffe097          	auipc	ra,0xffffe
    8000384c:	d20080e7          	jalr	-736(ra) # 80001568 <_Z4getcv>
    80003850:	0005059b          	sext.w	a1,a0
    80003854:	02d00793          	li	a5,45
    80003858:	02f58a63          	beq	a1,a5,8000388c <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    8000385c:	0084b503          	ld	a0,8(s1)
    80003860:	00003097          	auipc	ra,0x3
    80003864:	400080e7          	jalr	1024(ra) # 80006c60 <_ZN6Buffer3putEi>
        i++;
    80003868:	0019071b          	addiw	a4,s2,1
    8000386c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003870:	0004a683          	lw	a3,0(s1)
    80003874:	0026979b          	slliw	a5,a3,0x2
    80003878:	00d787bb          	addw	a5,a5,a3
    8000387c:	0017979b          	slliw	a5,a5,0x1
    80003880:	02f767bb          	remw	a5,a4,a5
    80003884:	fc0792e3          	bnez	a5,80003848 <_ZL16producerKeyboardPv+0x2c>
    80003888:	fb9ff06f          	j	80003840 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    8000388c:	00100793          	li	a5,1
    80003890:	00008717          	auipc	a4,0x8
    80003894:	38f72023          	sw	a5,896(a4) # 8000bc10 <_ZL9threadEnd>
    data->buffer->put('!');
    80003898:	02100593          	li	a1,33
    8000389c:	0084b503          	ld	a0,8(s1)
    800038a0:	00003097          	auipc	ra,0x3
    800038a4:	3c0080e7          	jalr	960(ra) # 80006c60 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    800038a8:	0104b503          	ld	a0,16(s1)
    800038ac:	ffffe097          	auipc	ra,0xffffe
    800038b0:	c8c080e7          	jalr	-884(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    800038b4:	01813083          	ld	ra,24(sp)
    800038b8:	01013403          	ld	s0,16(sp)
    800038bc:	00813483          	ld	s1,8(sp)
    800038c0:	00013903          	ld	s2,0(sp)
    800038c4:	02010113          	addi	sp,sp,32
    800038c8:	00008067          	ret

00000000800038cc <_ZL8producerPv>:

static void producer(void *arg) {
    800038cc:	fe010113          	addi	sp,sp,-32
    800038d0:	00113c23          	sd	ra,24(sp)
    800038d4:	00813823          	sd	s0,16(sp)
    800038d8:	00913423          	sd	s1,8(sp)
    800038dc:	01213023          	sd	s2,0(sp)
    800038e0:	02010413          	addi	s0,sp,32
    800038e4:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800038e8:	00000913          	li	s2,0
    800038ec:	00c0006f          	j	800038f8 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    800038f0:	ffffe097          	auipc	ra,0xffffe
    800038f4:	b38080e7          	jalr	-1224(ra) # 80001428 <_Z15thread_dispatchv>
    while (!threadEnd) {
    800038f8:	00008797          	auipc	a5,0x8
    800038fc:	3187a783          	lw	a5,792(a5) # 8000bc10 <_ZL9threadEnd>
    80003900:	02079e63          	bnez	a5,8000393c <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80003904:	0004a583          	lw	a1,0(s1)
    80003908:	0305859b          	addiw	a1,a1,48
    8000390c:	0084b503          	ld	a0,8(s1)
    80003910:	00003097          	auipc	ra,0x3
    80003914:	350080e7          	jalr	848(ra) # 80006c60 <_ZN6Buffer3putEi>
        i++;
    80003918:	0019071b          	addiw	a4,s2,1
    8000391c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003920:	0004a683          	lw	a3,0(s1)
    80003924:	0026979b          	slliw	a5,a3,0x2
    80003928:	00d787bb          	addw	a5,a5,a3
    8000392c:	0017979b          	slliw	a5,a5,0x1
    80003930:	02f767bb          	remw	a5,a4,a5
    80003934:	fc0792e3          	bnez	a5,800038f8 <_ZL8producerPv+0x2c>
    80003938:	fb9ff06f          	j	800038f0 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    8000393c:	0104b503          	ld	a0,16(s1)
    80003940:	ffffe097          	auipc	ra,0xffffe
    80003944:	bf8080e7          	jalr	-1032(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    80003948:	01813083          	ld	ra,24(sp)
    8000394c:	01013403          	ld	s0,16(sp)
    80003950:	00813483          	ld	s1,8(sp)
    80003954:	00013903          	ld	s2,0(sp)
    80003958:	02010113          	addi	sp,sp,32
    8000395c:	00008067          	ret

0000000080003960 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80003960:	fd010113          	addi	sp,sp,-48
    80003964:	02113423          	sd	ra,40(sp)
    80003968:	02813023          	sd	s0,32(sp)
    8000396c:	00913c23          	sd	s1,24(sp)
    80003970:	01213823          	sd	s2,16(sp)
    80003974:	01313423          	sd	s3,8(sp)
    80003978:	03010413          	addi	s0,sp,48
    8000397c:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003980:	00000993          	li	s3,0
    80003984:	01c0006f          	j	800039a0 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80003988:	ffffe097          	auipc	ra,0xffffe
    8000398c:	aa0080e7          	jalr	-1376(ra) # 80001428 <_Z15thread_dispatchv>
    80003990:	0500006f          	j	800039e0 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80003994:	00a00513          	li	a0,10
    80003998:	ffffe097          	auipc	ra,0xffffe
    8000399c:	bf8080e7          	jalr	-1032(ra) # 80001590 <_Z4putcc>
    while (!threadEnd) {
    800039a0:	00008797          	auipc	a5,0x8
    800039a4:	2707a783          	lw	a5,624(a5) # 8000bc10 <_ZL9threadEnd>
    800039a8:	06079063          	bnez	a5,80003a08 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    800039ac:	00893503          	ld	a0,8(s2)
    800039b0:	00003097          	auipc	ra,0x3
    800039b4:	340080e7          	jalr	832(ra) # 80006cf0 <_ZN6Buffer3getEv>
        i++;
    800039b8:	0019849b          	addiw	s1,s3,1
    800039bc:	0004899b          	sext.w	s3,s1
        putc(key);
    800039c0:	0ff57513          	andi	a0,a0,255
    800039c4:	ffffe097          	auipc	ra,0xffffe
    800039c8:	bcc080e7          	jalr	-1076(ra) # 80001590 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    800039cc:	00092703          	lw	a4,0(s2)
    800039d0:	0027179b          	slliw	a5,a4,0x2
    800039d4:	00e787bb          	addw	a5,a5,a4
    800039d8:	02f4e7bb          	remw	a5,s1,a5
    800039dc:	fa0786e3          	beqz	a5,80003988 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    800039e0:	05000793          	li	a5,80
    800039e4:	02f4e4bb          	remw	s1,s1,a5
    800039e8:	fa049ce3          	bnez	s1,800039a0 <_ZL8consumerPv+0x40>
    800039ec:	fa9ff06f          	j	80003994 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    800039f0:	00893503          	ld	a0,8(s2)
    800039f4:	00003097          	auipc	ra,0x3
    800039f8:	2fc080e7          	jalr	764(ra) # 80006cf0 <_ZN6Buffer3getEv>
        putc(key);
    800039fc:	0ff57513          	andi	a0,a0,255
    80003a00:	ffffe097          	auipc	ra,0xffffe
    80003a04:	b90080e7          	jalr	-1136(ra) # 80001590 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80003a08:	00893503          	ld	a0,8(s2)
    80003a0c:	00003097          	auipc	ra,0x3
    80003a10:	370080e7          	jalr	880(ra) # 80006d7c <_ZN6Buffer6getCntEv>
    80003a14:	fca04ee3          	bgtz	a0,800039f0 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80003a18:	01093503          	ld	a0,16(s2)
    80003a1c:	ffffe097          	auipc	ra,0xffffe
    80003a20:	b1c080e7          	jalr	-1252(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    80003a24:	02813083          	ld	ra,40(sp)
    80003a28:	02013403          	ld	s0,32(sp)
    80003a2c:	01813483          	ld	s1,24(sp)
    80003a30:	01013903          	ld	s2,16(sp)
    80003a34:	00813983          	ld	s3,8(sp)
    80003a38:	03010113          	addi	sp,sp,48
    80003a3c:	00008067          	ret

0000000080003a40 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80003a40:	f9010113          	addi	sp,sp,-112
    80003a44:	06113423          	sd	ra,104(sp)
    80003a48:	06813023          	sd	s0,96(sp)
    80003a4c:	04913c23          	sd	s1,88(sp)
    80003a50:	05213823          	sd	s2,80(sp)
    80003a54:	05313423          	sd	s3,72(sp)
    80003a58:	05413023          	sd	s4,64(sp)
    80003a5c:	03513c23          	sd	s5,56(sp)
    80003a60:	03613823          	sd	s6,48(sp)
    80003a64:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80003a68:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80003a6c:	00005517          	auipc	a0,0x5
    80003a70:	7cc50513          	addi	a0,a0,1996 # 80009238 <_ZZ9kPrintIntmE6digits+0x1c8>
    80003a74:	00002097          	auipc	ra,0x2
    80003a78:	220080e7          	jalr	544(ra) # 80005c94 <_Z11printStringPKc>
    getString(input, 30);
    80003a7c:	01e00593          	li	a1,30
    80003a80:	fa040493          	addi	s1,s0,-96
    80003a84:	00048513          	mv	a0,s1
    80003a88:	00002097          	auipc	ra,0x2
    80003a8c:	294080e7          	jalr	660(ra) # 80005d1c <_Z9getStringPci>
    threadNum = stringToInt(input);
    80003a90:	00048513          	mv	a0,s1
    80003a94:	00002097          	auipc	ra,0x2
    80003a98:	360080e7          	jalr	864(ra) # 80005df4 <_Z11stringToIntPKc>
    80003a9c:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80003aa0:	00005517          	auipc	a0,0x5
    80003aa4:	7b850513          	addi	a0,a0,1976 # 80009258 <_ZZ9kPrintIntmE6digits+0x1e8>
    80003aa8:	00002097          	auipc	ra,0x2
    80003aac:	1ec080e7          	jalr	492(ra) # 80005c94 <_Z11printStringPKc>
    getString(input, 30);
    80003ab0:	01e00593          	li	a1,30
    80003ab4:	00048513          	mv	a0,s1
    80003ab8:	00002097          	auipc	ra,0x2
    80003abc:	264080e7          	jalr	612(ra) # 80005d1c <_Z9getStringPci>
    n = stringToInt(input);
    80003ac0:	00048513          	mv	a0,s1
    80003ac4:	00002097          	auipc	ra,0x2
    80003ac8:	330080e7          	jalr	816(ra) # 80005df4 <_Z11stringToIntPKc>
    80003acc:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80003ad0:	00005517          	auipc	a0,0x5
    80003ad4:	7a850513          	addi	a0,a0,1960 # 80009278 <_ZZ9kPrintIntmE6digits+0x208>
    80003ad8:	00002097          	auipc	ra,0x2
    80003adc:	1bc080e7          	jalr	444(ra) # 80005c94 <_Z11printStringPKc>
	printInt(threadNum);
    80003ae0:	00000613          	li	a2,0
    80003ae4:	00a00593          	li	a1,10
    80003ae8:	00090513          	mv	a0,s2
    80003aec:	00002097          	auipc	ra,0x2
    80003af0:	358080e7          	jalr	856(ra) # 80005e44 <_Z8printIntiii>
    printString(" i velicina bafera ");
    80003af4:	00005517          	auipc	a0,0x5
    80003af8:	79c50513          	addi	a0,a0,1948 # 80009290 <_ZZ9kPrintIntmE6digits+0x220>
    80003afc:	00002097          	auipc	ra,0x2
    80003b00:	198080e7          	jalr	408(ra) # 80005c94 <_Z11printStringPKc>
	printInt(n);
    80003b04:	00000613          	li	a2,0
    80003b08:	00a00593          	li	a1,10
    80003b0c:	00048513          	mv	a0,s1
    80003b10:	00002097          	auipc	ra,0x2
    80003b14:	334080e7          	jalr	820(ra) # 80005e44 <_Z8printIntiii>
    printString(".\n");
    80003b18:	00005517          	auipc	a0,0x5
    80003b1c:	79050513          	addi	a0,a0,1936 # 800092a8 <_ZZ9kPrintIntmE6digits+0x238>
    80003b20:	00002097          	auipc	ra,0x2
    80003b24:	174080e7          	jalr	372(ra) # 80005c94 <_Z11printStringPKc>
    if(threadNum > n) {
    80003b28:	0324c463          	blt	s1,s2,80003b50 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80003b2c:	03205c63          	blez	s2,80003b64 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80003b30:	03800513          	li	a0,56
    80003b34:	fffff097          	auipc	ra,0xfffff
    80003b38:	924080e7          	jalr	-1756(ra) # 80002458 <_Znwm>
    80003b3c:	00050a13          	mv	s4,a0
    80003b40:	00048593          	mv	a1,s1
    80003b44:	00003097          	auipc	ra,0x3
    80003b48:	080080e7          	jalr	128(ra) # 80006bc4 <_ZN6BufferC1Ei>
    80003b4c:	0300006f          	j	80003b7c <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80003b50:	00005517          	auipc	a0,0x5
    80003b54:	76050513          	addi	a0,a0,1888 # 800092b0 <_ZZ9kPrintIntmE6digits+0x240>
    80003b58:	00002097          	auipc	ra,0x2
    80003b5c:	13c080e7          	jalr	316(ra) # 80005c94 <_Z11printStringPKc>
        return;
    80003b60:	0140006f          	j	80003b74 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80003b64:	00005517          	auipc	a0,0x5
    80003b68:	78c50513          	addi	a0,a0,1932 # 800092f0 <_ZZ9kPrintIntmE6digits+0x280>
    80003b6c:	00002097          	auipc	ra,0x2
    80003b70:	128080e7          	jalr	296(ra) # 80005c94 <_Z11printStringPKc>
        return;
    80003b74:	000b0113          	mv	sp,s6
    80003b78:	1500006f          	j	80003cc8 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80003b7c:	00000593          	li	a1,0
    80003b80:	00008517          	auipc	a0,0x8
    80003b84:	09850513          	addi	a0,a0,152 # 8000bc18 <_ZL10waitForAll>
    80003b88:	ffffe097          	auipc	ra,0xffffe
    80003b8c:	918080e7          	jalr	-1768(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    thread_t threads[threadNum];
    80003b90:	00391793          	slli	a5,s2,0x3
    80003b94:	00f78793          	addi	a5,a5,15
    80003b98:	ff07f793          	andi	a5,a5,-16
    80003b9c:	40f10133          	sub	sp,sp,a5
    80003ba0:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80003ba4:	0019071b          	addiw	a4,s2,1
    80003ba8:	00171793          	slli	a5,a4,0x1
    80003bac:	00e787b3          	add	a5,a5,a4
    80003bb0:	00379793          	slli	a5,a5,0x3
    80003bb4:	00f78793          	addi	a5,a5,15
    80003bb8:	ff07f793          	andi	a5,a5,-16
    80003bbc:	40f10133          	sub	sp,sp,a5
    80003bc0:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80003bc4:	00191613          	slli	a2,s2,0x1
    80003bc8:	012607b3          	add	a5,a2,s2
    80003bcc:	00379793          	slli	a5,a5,0x3
    80003bd0:	00f987b3          	add	a5,s3,a5
    80003bd4:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80003bd8:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80003bdc:	00008717          	auipc	a4,0x8
    80003be0:	03c73703          	ld	a4,60(a4) # 8000bc18 <_ZL10waitForAll>
    80003be4:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80003be8:	00078613          	mv	a2,a5
    80003bec:	00000597          	auipc	a1,0x0
    80003bf0:	d7458593          	addi	a1,a1,-652 # 80003960 <_ZL8consumerPv>
    80003bf4:	f9840513          	addi	a0,s0,-104
    80003bf8:	ffffd097          	auipc	ra,0xffffd
    80003bfc:	788080e7          	jalr	1928(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003c00:	00000493          	li	s1,0
    80003c04:	0280006f          	j	80003c2c <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80003c08:	00000597          	auipc	a1,0x0
    80003c0c:	c1458593          	addi	a1,a1,-1004 # 8000381c <_ZL16producerKeyboardPv>
                      data + i);
    80003c10:	00179613          	slli	a2,a5,0x1
    80003c14:	00f60633          	add	a2,a2,a5
    80003c18:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80003c1c:	00c98633          	add	a2,s3,a2
    80003c20:	ffffd097          	auipc	ra,0xffffd
    80003c24:	760080e7          	jalr	1888(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003c28:	0014849b          	addiw	s1,s1,1
    80003c2c:	0524d263          	bge	s1,s2,80003c70 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80003c30:	00149793          	slli	a5,s1,0x1
    80003c34:	009787b3          	add	a5,a5,s1
    80003c38:	00379793          	slli	a5,a5,0x3
    80003c3c:	00f987b3          	add	a5,s3,a5
    80003c40:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80003c44:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80003c48:	00008717          	auipc	a4,0x8
    80003c4c:	fd073703          	ld	a4,-48(a4) # 8000bc18 <_ZL10waitForAll>
    80003c50:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80003c54:	00048793          	mv	a5,s1
    80003c58:	00349513          	slli	a0,s1,0x3
    80003c5c:	00aa8533          	add	a0,s5,a0
    80003c60:	fa9054e3          	blez	s1,80003c08 <_Z22producerConsumer_C_APIv+0x1c8>
    80003c64:	00000597          	auipc	a1,0x0
    80003c68:	c6858593          	addi	a1,a1,-920 # 800038cc <_ZL8producerPv>
    80003c6c:	fa5ff06f          	j	80003c10 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80003c70:	ffffd097          	auipc	ra,0xffffd
    80003c74:	7b8080e7          	jalr	1976(ra) # 80001428 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80003c78:	00000493          	li	s1,0
    80003c7c:	00994e63          	blt	s2,s1,80003c98 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80003c80:	00008517          	auipc	a0,0x8
    80003c84:	f9853503          	ld	a0,-104(a0) # 8000bc18 <_ZL10waitForAll>
    80003c88:	ffffe097          	auipc	ra,0xffffe
    80003c8c:	880080e7          	jalr	-1920(ra) # 80001508 <_Z8sem_waitP4KSem>
    for (int i = 0; i <= threadNum; i++) {
    80003c90:	0014849b          	addiw	s1,s1,1
    80003c94:	fe9ff06f          	j	80003c7c <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80003c98:	00008517          	auipc	a0,0x8
    80003c9c:	f8053503          	ld	a0,-128(a0) # 8000bc18 <_ZL10waitForAll>
    80003ca0:	ffffe097          	auipc	ra,0xffffe
    80003ca4:	838080e7          	jalr	-1992(ra) # 800014d8 <_Z9sem_closeP4KSem>
    delete buffer;
    80003ca8:	000a0e63          	beqz	s4,80003cc4 <_Z22producerConsumer_C_APIv+0x284>
    80003cac:	000a0513          	mv	a0,s4
    80003cb0:	00003097          	auipc	ra,0x3
    80003cb4:	154080e7          	jalr	340(ra) # 80006e04 <_ZN6BufferD1Ev>
    80003cb8:	000a0513          	mv	a0,s4
    80003cbc:	ffffe097          	auipc	ra,0xffffe
    80003cc0:	7ec080e7          	jalr	2028(ra) # 800024a8 <_ZdlPv>
    80003cc4:	000b0113          	mv	sp,s6

}
    80003cc8:	f9040113          	addi	sp,s0,-112
    80003ccc:	06813083          	ld	ra,104(sp)
    80003cd0:	06013403          	ld	s0,96(sp)
    80003cd4:	05813483          	ld	s1,88(sp)
    80003cd8:	05013903          	ld	s2,80(sp)
    80003cdc:	04813983          	ld	s3,72(sp)
    80003ce0:	04013a03          	ld	s4,64(sp)
    80003ce4:	03813a83          	ld	s5,56(sp)
    80003ce8:	03013b03          	ld	s6,48(sp)
    80003cec:	07010113          	addi	sp,sp,112
    80003cf0:	00008067          	ret
    80003cf4:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80003cf8:	000a0513          	mv	a0,s4
    80003cfc:	ffffe097          	auipc	ra,0xffffe
    80003d00:	7ac080e7          	jalr	1964(ra) # 800024a8 <_ZdlPv>
    80003d04:	00048513          	mv	a0,s1
    80003d08:	00009097          	auipc	ra,0x9
    80003d0c:	020080e7          	jalr	32(ra) # 8000cd28 <_Unwind_Resume>

0000000080003d10 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003d10:	fe010113          	addi	sp,sp,-32
    80003d14:	00113c23          	sd	ra,24(sp)
    80003d18:	00813823          	sd	s0,16(sp)
    80003d1c:	00913423          	sd	s1,8(sp)
    80003d20:	01213023          	sd	s2,0(sp)
    80003d24:	02010413          	addi	s0,sp,32
    80003d28:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003d2c:	00100793          	li	a5,1
    80003d30:	02a7f863          	bgeu	a5,a0,80003d60 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80003d34:	00a00793          	li	a5,10
    80003d38:	02f577b3          	remu	a5,a0,a5
    80003d3c:	02078e63          	beqz	a5,80003d78 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80003d40:	fff48513          	addi	a0,s1,-1
    80003d44:	00000097          	auipc	ra,0x0
    80003d48:	fcc080e7          	jalr	-52(ra) # 80003d10 <_ZL9fibonaccim>
    80003d4c:	00050913          	mv	s2,a0
    80003d50:	ffe48513          	addi	a0,s1,-2
    80003d54:	00000097          	auipc	ra,0x0
    80003d58:	fbc080e7          	jalr	-68(ra) # 80003d10 <_ZL9fibonaccim>
    80003d5c:	00a90533          	add	a0,s2,a0
}
    80003d60:	01813083          	ld	ra,24(sp)
    80003d64:	01013403          	ld	s0,16(sp)
    80003d68:	00813483          	ld	s1,8(sp)
    80003d6c:	00013903          	ld	s2,0(sp)
    80003d70:	02010113          	addi	sp,sp,32
    80003d74:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80003d78:	ffffd097          	auipc	ra,0xffffd
    80003d7c:	6b0080e7          	jalr	1712(ra) # 80001428 <_Z15thread_dispatchv>
    80003d80:	fc1ff06f          	j	80003d40 <_ZL9fibonaccim+0x30>

0000000080003d84 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80003d84:	fe010113          	addi	sp,sp,-32
    80003d88:	00113c23          	sd	ra,24(sp)
    80003d8c:	00813823          	sd	s0,16(sp)
    80003d90:	00913423          	sd	s1,8(sp)
    80003d94:	01213023          	sd	s2,0(sp)
    80003d98:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003d9c:	00000913          	li	s2,0
    80003da0:	0380006f          	j	80003dd8 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003da4:	ffffd097          	auipc	ra,0xffffd
    80003da8:	684080e7          	jalr	1668(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003dac:	00148493          	addi	s1,s1,1
    80003db0:	000027b7          	lui	a5,0x2
    80003db4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003db8:	0097ee63          	bltu	a5,s1,80003dd4 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003dbc:	00000713          	li	a4,0
    80003dc0:	000077b7          	lui	a5,0x7
    80003dc4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003dc8:	fce7eee3          	bltu	a5,a4,80003da4 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80003dcc:	00170713          	addi	a4,a4,1
    80003dd0:	ff1ff06f          	j	80003dc0 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003dd4:	00190913          	addi	s2,s2,1
    80003dd8:	00900793          	li	a5,9
    80003ddc:	0527e063          	bltu	a5,s2,80003e1c <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003de0:	00005517          	auipc	a0,0x5
    80003de4:	54050513          	addi	a0,a0,1344 # 80009320 <_ZZ9kPrintIntmE6digits+0x2b0>
    80003de8:	00002097          	auipc	ra,0x2
    80003dec:	eac080e7          	jalr	-340(ra) # 80005c94 <_Z11printStringPKc>
    80003df0:	00000613          	li	a2,0
    80003df4:	00a00593          	li	a1,10
    80003df8:	0009051b          	sext.w	a0,s2
    80003dfc:	00002097          	auipc	ra,0x2
    80003e00:	048080e7          	jalr	72(ra) # 80005e44 <_Z8printIntiii>
    80003e04:	00005517          	auipc	a0,0x5
    80003e08:	77c50513          	addi	a0,a0,1916 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80003e0c:	00002097          	auipc	ra,0x2
    80003e10:	e88080e7          	jalr	-376(ra) # 80005c94 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003e14:	00000493          	li	s1,0
    80003e18:	f99ff06f          	j	80003db0 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003e1c:	00005517          	auipc	a0,0x5
    80003e20:	50c50513          	addi	a0,a0,1292 # 80009328 <_ZZ9kPrintIntmE6digits+0x2b8>
    80003e24:	00002097          	auipc	ra,0x2
    80003e28:	e70080e7          	jalr	-400(ra) # 80005c94 <_Z11printStringPKc>
    finishedA = true;
    80003e2c:	00100793          	li	a5,1
    80003e30:	00008717          	auipc	a4,0x8
    80003e34:	def70823          	sb	a5,-528(a4) # 8000bc20 <_ZL9finishedA>
}
    80003e38:	01813083          	ld	ra,24(sp)
    80003e3c:	01013403          	ld	s0,16(sp)
    80003e40:	00813483          	ld	s1,8(sp)
    80003e44:	00013903          	ld	s2,0(sp)
    80003e48:	02010113          	addi	sp,sp,32
    80003e4c:	00008067          	ret

0000000080003e50 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80003e50:	fe010113          	addi	sp,sp,-32
    80003e54:	00113c23          	sd	ra,24(sp)
    80003e58:	00813823          	sd	s0,16(sp)
    80003e5c:	00913423          	sd	s1,8(sp)
    80003e60:	01213023          	sd	s2,0(sp)
    80003e64:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003e68:	00000913          	li	s2,0
    80003e6c:	0380006f          	j	80003ea4 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003e70:	ffffd097          	auipc	ra,0xffffd
    80003e74:	5b8080e7          	jalr	1464(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003e78:	00148493          	addi	s1,s1,1
    80003e7c:	000027b7          	lui	a5,0x2
    80003e80:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003e84:	0097ee63          	bltu	a5,s1,80003ea0 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003e88:	00000713          	li	a4,0
    80003e8c:	000077b7          	lui	a5,0x7
    80003e90:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003e94:	fce7eee3          	bltu	a5,a4,80003e70 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80003e98:	00170713          	addi	a4,a4,1
    80003e9c:	ff1ff06f          	j	80003e8c <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003ea0:	00190913          	addi	s2,s2,1
    80003ea4:	00f00793          	li	a5,15
    80003ea8:	0527e063          	bltu	a5,s2,80003ee8 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003eac:	00005517          	auipc	a0,0x5
    80003eb0:	48c50513          	addi	a0,a0,1164 # 80009338 <_ZZ9kPrintIntmE6digits+0x2c8>
    80003eb4:	00002097          	auipc	ra,0x2
    80003eb8:	de0080e7          	jalr	-544(ra) # 80005c94 <_Z11printStringPKc>
    80003ebc:	00000613          	li	a2,0
    80003ec0:	00a00593          	li	a1,10
    80003ec4:	0009051b          	sext.w	a0,s2
    80003ec8:	00002097          	auipc	ra,0x2
    80003ecc:	f7c080e7          	jalr	-132(ra) # 80005e44 <_Z8printIntiii>
    80003ed0:	00005517          	auipc	a0,0x5
    80003ed4:	6b050513          	addi	a0,a0,1712 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80003ed8:	00002097          	auipc	ra,0x2
    80003edc:	dbc080e7          	jalr	-580(ra) # 80005c94 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003ee0:	00000493          	li	s1,0
    80003ee4:	f99ff06f          	j	80003e7c <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80003ee8:	00005517          	auipc	a0,0x5
    80003eec:	45850513          	addi	a0,a0,1112 # 80009340 <_ZZ9kPrintIntmE6digits+0x2d0>
    80003ef0:	00002097          	auipc	ra,0x2
    80003ef4:	da4080e7          	jalr	-604(ra) # 80005c94 <_Z11printStringPKc>
    finishedB = true;
    80003ef8:	00100793          	li	a5,1
    80003efc:	00008717          	auipc	a4,0x8
    80003f00:	d2f702a3          	sb	a5,-731(a4) # 8000bc21 <_ZL9finishedB>
    thread_dispatch();
    80003f04:	ffffd097          	auipc	ra,0xffffd
    80003f08:	524080e7          	jalr	1316(ra) # 80001428 <_Z15thread_dispatchv>
}
    80003f0c:	01813083          	ld	ra,24(sp)
    80003f10:	01013403          	ld	s0,16(sp)
    80003f14:	00813483          	ld	s1,8(sp)
    80003f18:	00013903          	ld	s2,0(sp)
    80003f1c:	02010113          	addi	sp,sp,32
    80003f20:	00008067          	ret

0000000080003f24 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80003f24:	fe010113          	addi	sp,sp,-32
    80003f28:	00113c23          	sd	ra,24(sp)
    80003f2c:	00813823          	sd	s0,16(sp)
    80003f30:	00913423          	sd	s1,8(sp)
    80003f34:	01213023          	sd	s2,0(sp)
    80003f38:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80003f3c:	00000493          	li	s1,0
    80003f40:	0400006f          	j	80003f80 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003f44:	00005517          	auipc	a0,0x5
    80003f48:	40c50513          	addi	a0,a0,1036 # 80009350 <_ZZ9kPrintIntmE6digits+0x2e0>
    80003f4c:	00002097          	auipc	ra,0x2
    80003f50:	d48080e7          	jalr	-696(ra) # 80005c94 <_Z11printStringPKc>
    80003f54:	00000613          	li	a2,0
    80003f58:	00a00593          	li	a1,10
    80003f5c:	00048513          	mv	a0,s1
    80003f60:	00002097          	auipc	ra,0x2
    80003f64:	ee4080e7          	jalr	-284(ra) # 80005e44 <_Z8printIntiii>
    80003f68:	00005517          	auipc	a0,0x5
    80003f6c:	61850513          	addi	a0,a0,1560 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80003f70:	00002097          	auipc	ra,0x2
    80003f74:	d24080e7          	jalr	-732(ra) # 80005c94 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80003f78:	0014849b          	addiw	s1,s1,1
    80003f7c:	0ff4f493          	andi	s1,s1,255
    80003f80:	00200793          	li	a5,2
    80003f84:	fc97f0e3          	bgeu	a5,s1,80003f44 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80003f88:	00005517          	auipc	a0,0x5
    80003f8c:	3d050513          	addi	a0,a0,976 # 80009358 <_ZZ9kPrintIntmE6digits+0x2e8>
    80003f90:	00002097          	auipc	ra,0x2
    80003f94:	d04080e7          	jalr	-764(ra) # 80005c94 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80003f98:	00700313          	li	t1,7
    thread_dispatch();
    80003f9c:	ffffd097          	auipc	ra,0xffffd
    80003fa0:	48c080e7          	jalr	1164(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80003fa4:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80003fa8:	00005517          	auipc	a0,0x5
    80003fac:	3c050513          	addi	a0,a0,960 # 80009368 <_ZZ9kPrintIntmE6digits+0x2f8>
    80003fb0:	00002097          	auipc	ra,0x2
    80003fb4:	ce4080e7          	jalr	-796(ra) # 80005c94 <_Z11printStringPKc>
    80003fb8:	00000613          	li	a2,0
    80003fbc:	00a00593          	li	a1,10
    80003fc0:	0009051b          	sext.w	a0,s2
    80003fc4:	00002097          	auipc	ra,0x2
    80003fc8:	e80080e7          	jalr	-384(ra) # 80005e44 <_Z8printIntiii>
    80003fcc:	00005517          	auipc	a0,0x5
    80003fd0:	5b450513          	addi	a0,a0,1460 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80003fd4:	00002097          	auipc	ra,0x2
    80003fd8:	cc0080e7          	jalr	-832(ra) # 80005c94 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80003fdc:	00c00513          	li	a0,12
    80003fe0:	00000097          	auipc	ra,0x0
    80003fe4:	d30080e7          	jalr	-720(ra) # 80003d10 <_ZL9fibonaccim>
    80003fe8:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80003fec:	00005517          	auipc	a0,0x5
    80003ff0:	38450513          	addi	a0,a0,900 # 80009370 <_ZZ9kPrintIntmE6digits+0x300>
    80003ff4:	00002097          	auipc	ra,0x2
    80003ff8:	ca0080e7          	jalr	-864(ra) # 80005c94 <_Z11printStringPKc>
    80003ffc:	00000613          	li	a2,0
    80004000:	00a00593          	li	a1,10
    80004004:	0009051b          	sext.w	a0,s2
    80004008:	00002097          	auipc	ra,0x2
    8000400c:	e3c080e7          	jalr	-452(ra) # 80005e44 <_Z8printIntiii>
    80004010:	00005517          	auipc	a0,0x5
    80004014:	57050513          	addi	a0,a0,1392 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80004018:	00002097          	auipc	ra,0x2
    8000401c:	c7c080e7          	jalr	-900(ra) # 80005c94 <_Z11printStringPKc>
    80004020:	0400006f          	j	80004060 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80004024:	00005517          	auipc	a0,0x5
    80004028:	32c50513          	addi	a0,a0,812 # 80009350 <_ZZ9kPrintIntmE6digits+0x2e0>
    8000402c:	00002097          	auipc	ra,0x2
    80004030:	c68080e7          	jalr	-920(ra) # 80005c94 <_Z11printStringPKc>
    80004034:	00000613          	li	a2,0
    80004038:	00a00593          	li	a1,10
    8000403c:	00048513          	mv	a0,s1
    80004040:	00002097          	auipc	ra,0x2
    80004044:	e04080e7          	jalr	-508(ra) # 80005e44 <_Z8printIntiii>
    80004048:	00005517          	auipc	a0,0x5
    8000404c:	53850513          	addi	a0,a0,1336 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80004050:	00002097          	auipc	ra,0x2
    80004054:	c44080e7          	jalr	-956(ra) # 80005c94 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004058:	0014849b          	addiw	s1,s1,1
    8000405c:	0ff4f493          	andi	s1,s1,255
    80004060:	00500793          	li	a5,5
    80004064:	fc97f0e3          	bgeu	a5,s1,80004024 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("C finished!\n");
    80004068:	00005517          	auipc	a0,0x5
    8000406c:	31850513          	addi	a0,a0,792 # 80009380 <_ZZ9kPrintIntmE6digits+0x310>
    80004070:	00002097          	auipc	ra,0x2
    80004074:	c24080e7          	jalr	-988(ra) # 80005c94 <_Z11printStringPKc>
    finishedC = true;
    80004078:	00100793          	li	a5,1
    8000407c:	00008717          	auipc	a4,0x8
    80004080:	baf70323          	sb	a5,-1114(a4) # 8000bc22 <_ZL9finishedC>
    thread_dispatch();
    80004084:	ffffd097          	auipc	ra,0xffffd
    80004088:	3a4080e7          	jalr	932(ra) # 80001428 <_Z15thread_dispatchv>
}
    8000408c:	01813083          	ld	ra,24(sp)
    80004090:	01013403          	ld	s0,16(sp)
    80004094:	00813483          	ld	s1,8(sp)
    80004098:	00013903          	ld	s2,0(sp)
    8000409c:	02010113          	addi	sp,sp,32
    800040a0:	00008067          	ret

00000000800040a4 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    800040a4:	fe010113          	addi	sp,sp,-32
    800040a8:	00113c23          	sd	ra,24(sp)
    800040ac:	00813823          	sd	s0,16(sp)
    800040b0:	00913423          	sd	s1,8(sp)
    800040b4:	01213023          	sd	s2,0(sp)
    800040b8:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800040bc:	00a00493          	li	s1,10
    800040c0:	0400006f          	j	80004100 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800040c4:	00005517          	auipc	a0,0x5
    800040c8:	2cc50513          	addi	a0,a0,716 # 80009390 <_ZZ9kPrintIntmE6digits+0x320>
    800040cc:	00002097          	auipc	ra,0x2
    800040d0:	bc8080e7          	jalr	-1080(ra) # 80005c94 <_Z11printStringPKc>
    800040d4:	00000613          	li	a2,0
    800040d8:	00a00593          	li	a1,10
    800040dc:	00048513          	mv	a0,s1
    800040e0:	00002097          	auipc	ra,0x2
    800040e4:	d64080e7          	jalr	-668(ra) # 80005e44 <_Z8printIntiii>
    800040e8:	00005517          	auipc	a0,0x5
    800040ec:	49850513          	addi	a0,a0,1176 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    800040f0:	00002097          	auipc	ra,0x2
    800040f4:	ba4080e7          	jalr	-1116(ra) # 80005c94 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800040f8:	0014849b          	addiw	s1,s1,1
    800040fc:	0ff4f493          	andi	s1,s1,255
    80004100:	00c00793          	li	a5,12
    80004104:	fc97f0e3          	bgeu	a5,s1,800040c4 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80004108:	00005517          	auipc	a0,0x5
    8000410c:	29050513          	addi	a0,a0,656 # 80009398 <_ZZ9kPrintIntmE6digits+0x328>
    80004110:	00002097          	auipc	ra,0x2
    80004114:	b84080e7          	jalr	-1148(ra) # 80005c94 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004118:	00500313          	li	t1,5
    thread_dispatch();
    8000411c:	ffffd097          	auipc	ra,0xffffd
    80004120:	30c080e7          	jalr	780(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004124:	01000513          	li	a0,16
    80004128:	00000097          	auipc	ra,0x0
    8000412c:	be8080e7          	jalr	-1048(ra) # 80003d10 <_ZL9fibonaccim>
    80004130:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004134:	00005517          	auipc	a0,0x5
    80004138:	27450513          	addi	a0,a0,628 # 800093a8 <_ZZ9kPrintIntmE6digits+0x338>
    8000413c:	00002097          	auipc	ra,0x2
    80004140:	b58080e7          	jalr	-1192(ra) # 80005c94 <_Z11printStringPKc>
    80004144:	00000613          	li	a2,0
    80004148:	00a00593          	li	a1,10
    8000414c:	0009051b          	sext.w	a0,s2
    80004150:	00002097          	auipc	ra,0x2
    80004154:	cf4080e7          	jalr	-780(ra) # 80005e44 <_Z8printIntiii>
    80004158:	00005517          	auipc	a0,0x5
    8000415c:	42850513          	addi	a0,a0,1064 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80004160:	00002097          	auipc	ra,0x2
    80004164:	b34080e7          	jalr	-1228(ra) # 80005c94 <_Z11printStringPKc>
    80004168:	0400006f          	j	800041a8 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000416c:	00005517          	auipc	a0,0x5
    80004170:	22450513          	addi	a0,a0,548 # 80009390 <_ZZ9kPrintIntmE6digits+0x320>
    80004174:	00002097          	auipc	ra,0x2
    80004178:	b20080e7          	jalr	-1248(ra) # 80005c94 <_Z11printStringPKc>
    8000417c:	00000613          	li	a2,0
    80004180:	00a00593          	li	a1,10
    80004184:	00048513          	mv	a0,s1
    80004188:	00002097          	auipc	ra,0x2
    8000418c:	cbc080e7          	jalr	-836(ra) # 80005e44 <_Z8printIntiii>
    80004190:	00005517          	auipc	a0,0x5
    80004194:	3f050513          	addi	a0,a0,1008 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80004198:	00002097          	auipc	ra,0x2
    8000419c:	afc080e7          	jalr	-1284(ra) # 80005c94 <_Z11printStringPKc>
    for (; i < 16; i++) {
    800041a0:	0014849b          	addiw	s1,s1,1
    800041a4:	0ff4f493          	andi	s1,s1,255
    800041a8:	00f00793          	li	a5,15
    800041ac:	fc97f0e3          	bgeu	a5,s1,8000416c <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    800041b0:	00005517          	auipc	a0,0x5
    800041b4:	20850513          	addi	a0,a0,520 # 800093b8 <_ZZ9kPrintIntmE6digits+0x348>
    800041b8:	00002097          	auipc	ra,0x2
    800041bc:	adc080e7          	jalr	-1316(ra) # 80005c94 <_Z11printStringPKc>
    finishedD = true;
    800041c0:	00100793          	li	a5,1
    800041c4:	00008717          	auipc	a4,0x8
    800041c8:	a4f70fa3          	sb	a5,-1441(a4) # 8000bc23 <_ZL9finishedD>
    thread_dispatch();
    800041cc:	ffffd097          	auipc	ra,0xffffd
    800041d0:	25c080e7          	jalr	604(ra) # 80001428 <_Z15thread_dispatchv>
}
    800041d4:	01813083          	ld	ra,24(sp)
    800041d8:	01013403          	ld	s0,16(sp)
    800041dc:	00813483          	ld	s1,8(sp)
    800041e0:	00013903          	ld	s2,0(sp)
    800041e4:	02010113          	addi	sp,sp,32
    800041e8:	00008067          	ret

00000000800041ec <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    800041ec:	fc010113          	addi	sp,sp,-64
    800041f0:	02113c23          	sd	ra,56(sp)
    800041f4:	02813823          	sd	s0,48(sp)
    800041f8:	02913423          	sd	s1,40(sp)
    800041fc:	03213023          	sd	s2,32(sp)
    80004200:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80004204:	02000513          	li	a0,32
    80004208:	ffffe097          	auipc	ra,0xffffe
    8000420c:	250080e7          	jalr	592(ra) # 80002458 <_Znwm>
    80004210:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80004214:	ffffe097          	auipc	ra,0xffffe
    80004218:	50c080e7          	jalr	1292(ra) # 80002720 <_ZN6ThreadC1Ev>
    8000421c:	00007797          	auipc	a5,0x7
    80004220:	69478793          	addi	a5,a5,1684 # 8000b8b0 <_ZTV7WorkerA+0x10>
    80004224:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80004228:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    8000422c:	00005517          	auipc	a0,0x5
    80004230:	19c50513          	addi	a0,a0,412 # 800093c8 <_ZZ9kPrintIntmE6digits+0x358>
    80004234:	00002097          	auipc	ra,0x2
    80004238:	a60080e7          	jalr	-1440(ra) # 80005c94 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    8000423c:	02000513          	li	a0,32
    80004240:	ffffe097          	auipc	ra,0xffffe
    80004244:	218080e7          	jalr	536(ra) # 80002458 <_Znwm>
    80004248:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    8000424c:	ffffe097          	auipc	ra,0xffffe
    80004250:	4d4080e7          	jalr	1236(ra) # 80002720 <_ZN6ThreadC1Ev>
    80004254:	00007797          	auipc	a5,0x7
    80004258:	68478793          	addi	a5,a5,1668 # 8000b8d8 <_ZTV7WorkerB+0x10>
    8000425c:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80004260:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80004264:	00005517          	auipc	a0,0x5
    80004268:	17c50513          	addi	a0,a0,380 # 800093e0 <_ZZ9kPrintIntmE6digits+0x370>
    8000426c:	00002097          	auipc	ra,0x2
    80004270:	a28080e7          	jalr	-1496(ra) # 80005c94 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80004274:	02000513          	li	a0,32
    80004278:	ffffe097          	auipc	ra,0xffffe
    8000427c:	1e0080e7          	jalr	480(ra) # 80002458 <_Znwm>
    80004280:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80004284:	ffffe097          	auipc	ra,0xffffe
    80004288:	49c080e7          	jalr	1180(ra) # 80002720 <_ZN6ThreadC1Ev>
    8000428c:	00007797          	auipc	a5,0x7
    80004290:	67478793          	addi	a5,a5,1652 # 8000b900 <_ZTV7WorkerC+0x10>
    80004294:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80004298:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    8000429c:	00005517          	auipc	a0,0x5
    800042a0:	15c50513          	addi	a0,a0,348 # 800093f8 <_ZZ9kPrintIntmE6digits+0x388>
    800042a4:	00002097          	auipc	ra,0x2
    800042a8:	9f0080e7          	jalr	-1552(ra) # 80005c94 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    800042ac:	02000513          	li	a0,32
    800042b0:	ffffe097          	auipc	ra,0xffffe
    800042b4:	1a8080e7          	jalr	424(ra) # 80002458 <_Znwm>
    800042b8:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    800042bc:	ffffe097          	auipc	ra,0xffffe
    800042c0:	464080e7          	jalr	1124(ra) # 80002720 <_ZN6ThreadC1Ev>
    800042c4:	00007797          	auipc	a5,0x7
    800042c8:	66478793          	addi	a5,a5,1636 # 8000b928 <_ZTV7WorkerD+0x10>
    800042cc:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    800042d0:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    800042d4:	00005517          	auipc	a0,0x5
    800042d8:	13c50513          	addi	a0,a0,316 # 80009410 <_ZZ9kPrintIntmE6digits+0x3a0>
    800042dc:	00002097          	auipc	ra,0x2
    800042e0:	9b8080e7          	jalr	-1608(ra) # 80005c94 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    800042e4:	00000493          	li	s1,0
    800042e8:	00300793          	li	a5,3
    800042ec:	0297c663          	blt	a5,s1,80004318 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    800042f0:	00349793          	slli	a5,s1,0x3
    800042f4:	fe040713          	addi	a4,s0,-32
    800042f8:	00f707b3          	add	a5,a4,a5
    800042fc:	fe07b503          	ld	a0,-32(a5)
    80004300:	ffffe097          	auipc	ra,0xffffe
    80004304:	308080e7          	jalr	776(ra) # 80002608 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80004308:	0014849b          	addiw	s1,s1,1
    8000430c:	fddff06f          	j	800042e8 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80004310:	ffffe097          	auipc	ra,0xffffe
    80004314:	35c080e7          	jalr	860(ra) # 8000266c <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80004318:	00008797          	auipc	a5,0x8
    8000431c:	9087c783          	lbu	a5,-1784(a5) # 8000bc20 <_ZL9finishedA>
    80004320:	fe0788e3          	beqz	a5,80004310 <_Z20Threads_CPP_API_testv+0x124>
    80004324:	00008797          	auipc	a5,0x8
    80004328:	8fd7c783          	lbu	a5,-1795(a5) # 8000bc21 <_ZL9finishedB>
    8000432c:	fe0782e3          	beqz	a5,80004310 <_Z20Threads_CPP_API_testv+0x124>
    80004330:	00008797          	auipc	a5,0x8
    80004334:	8f27c783          	lbu	a5,-1806(a5) # 8000bc22 <_ZL9finishedC>
    80004338:	fc078ce3          	beqz	a5,80004310 <_Z20Threads_CPP_API_testv+0x124>
    8000433c:	00008797          	auipc	a5,0x8
    80004340:	8e77c783          	lbu	a5,-1817(a5) # 8000bc23 <_ZL9finishedD>
    80004344:	fc0786e3          	beqz	a5,80004310 <_Z20Threads_CPP_API_testv+0x124>
    80004348:	fc040493          	addi	s1,s0,-64
    8000434c:	0080006f          	j	80004354 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) {
    80004350:	00848493          	addi	s1,s1,8
    80004354:	fe040793          	addi	a5,s0,-32
    80004358:	08f48663          	beq	s1,a5,800043e4 <_Z20Threads_CPP_API_testv+0x1f8>
    8000435c:	0004b503          	ld	a0,0(s1)
		delete thread;
    80004360:	fe0508e3          	beqz	a0,80004350 <_Z20Threads_CPP_API_testv+0x164>
    80004364:	00053783          	ld	a5,0(a0)
    80004368:	0087b783          	ld	a5,8(a5)
    8000436c:	000780e7          	jalr	a5
    80004370:	fe1ff06f          	j	80004350 <_Z20Threads_CPP_API_testv+0x164>
    80004374:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80004378:	00048513          	mv	a0,s1
    8000437c:	ffffe097          	auipc	ra,0xffffe
    80004380:	12c080e7          	jalr	300(ra) # 800024a8 <_ZdlPv>
    80004384:	00090513          	mv	a0,s2
    80004388:	00009097          	auipc	ra,0x9
    8000438c:	9a0080e7          	jalr	-1632(ra) # 8000cd28 <_Unwind_Resume>
    80004390:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80004394:	00048513          	mv	a0,s1
    80004398:	ffffe097          	auipc	ra,0xffffe
    8000439c:	110080e7          	jalr	272(ra) # 800024a8 <_ZdlPv>
    800043a0:	00090513          	mv	a0,s2
    800043a4:	00009097          	auipc	ra,0x9
    800043a8:	984080e7          	jalr	-1660(ra) # 8000cd28 <_Unwind_Resume>
    800043ac:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    800043b0:	00048513          	mv	a0,s1
    800043b4:	ffffe097          	auipc	ra,0xffffe
    800043b8:	0f4080e7          	jalr	244(ra) # 800024a8 <_ZdlPv>
    800043bc:	00090513          	mv	a0,s2
    800043c0:	00009097          	auipc	ra,0x9
    800043c4:	968080e7          	jalr	-1688(ra) # 8000cd28 <_Unwind_Resume>
    800043c8:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    800043cc:	00048513          	mv	a0,s1
    800043d0:	ffffe097          	auipc	ra,0xffffe
    800043d4:	0d8080e7          	jalr	216(ra) # 800024a8 <_ZdlPv>
    800043d8:	00090513          	mv	a0,s2
    800043dc:	00009097          	auipc	ra,0x9
    800043e0:	94c080e7          	jalr	-1716(ra) # 8000cd28 <_Unwind_Resume>
	}
}
    800043e4:	03813083          	ld	ra,56(sp)
    800043e8:	03013403          	ld	s0,48(sp)
    800043ec:	02813483          	ld	s1,40(sp)
    800043f0:	02013903          	ld	s2,32(sp)
    800043f4:	04010113          	addi	sp,sp,64
    800043f8:	00008067          	ret

00000000800043fc <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    800043fc:	ff010113          	addi	sp,sp,-16
    80004400:	00113423          	sd	ra,8(sp)
    80004404:	00813023          	sd	s0,0(sp)
    80004408:	01010413          	addi	s0,sp,16
    8000440c:	00007797          	auipc	a5,0x7
    80004410:	4a478793          	addi	a5,a5,1188 # 8000b8b0 <_ZTV7WorkerA+0x10>
    80004414:	00f53023          	sd	a5,0(a0)
    80004418:	ffffe097          	auipc	ra,0xffffe
    8000441c:	f50080e7          	jalr	-176(ra) # 80002368 <_ZN6ThreadD1Ev>
    80004420:	00813083          	ld	ra,8(sp)
    80004424:	00013403          	ld	s0,0(sp)
    80004428:	01010113          	addi	sp,sp,16
    8000442c:	00008067          	ret

0000000080004430 <_ZN7WorkerAD0Ev>:
    80004430:	fe010113          	addi	sp,sp,-32
    80004434:	00113c23          	sd	ra,24(sp)
    80004438:	00813823          	sd	s0,16(sp)
    8000443c:	00913423          	sd	s1,8(sp)
    80004440:	02010413          	addi	s0,sp,32
    80004444:	00050493          	mv	s1,a0
    80004448:	00007797          	auipc	a5,0x7
    8000444c:	46878793          	addi	a5,a5,1128 # 8000b8b0 <_ZTV7WorkerA+0x10>
    80004450:	00f53023          	sd	a5,0(a0)
    80004454:	ffffe097          	auipc	ra,0xffffe
    80004458:	f14080e7          	jalr	-236(ra) # 80002368 <_ZN6ThreadD1Ev>
    8000445c:	00048513          	mv	a0,s1
    80004460:	ffffe097          	auipc	ra,0xffffe
    80004464:	048080e7          	jalr	72(ra) # 800024a8 <_ZdlPv>
    80004468:	01813083          	ld	ra,24(sp)
    8000446c:	01013403          	ld	s0,16(sp)
    80004470:	00813483          	ld	s1,8(sp)
    80004474:	02010113          	addi	sp,sp,32
    80004478:	00008067          	ret

000000008000447c <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    8000447c:	ff010113          	addi	sp,sp,-16
    80004480:	00113423          	sd	ra,8(sp)
    80004484:	00813023          	sd	s0,0(sp)
    80004488:	01010413          	addi	s0,sp,16
    8000448c:	00007797          	auipc	a5,0x7
    80004490:	44c78793          	addi	a5,a5,1100 # 8000b8d8 <_ZTV7WorkerB+0x10>
    80004494:	00f53023          	sd	a5,0(a0)
    80004498:	ffffe097          	auipc	ra,0xffffe
    8000449c:	ed0080e7          	jalr	-304(ra) # 80002368 <_ZN6ThreadD1Ev>
    800044a0:	00813083          	ld	ra,8(sp)
    800044a4:	00013403          	ld	s0,0(sp)
    800044a8:	01010113          	addi	sp,sp,16
    800044ac:	00008067          	ret

00000000800044b0 <_ZN7WorkerBD0Ev>:
    800044b0:	fe010113          	addi	sp,sp,-32
    800044b4:	00113c23          	sd	ra,24(sp)
    800044b8:	00813823          	sd	s0,16(sp)
    800044bc:	00913423          	sd	s1,8(sp)
    800044c0:	02010413          	addi	s0,sp,32
    800044c4:	00050493          	mv	s1,a0
    800044c8:	00007797          	auipc	a5,0x7
    800044cc:	41078793          	addi	a5,a5,1040 # 8000b8d8 <_ZTV7WorkerB+0x10>
    800044d0:	00f53023          	sd	a5,0(a0)
    800044d4:	ffffe097          	auipc	ra,0xffffe
    800044d8:	e94080e7          	jalr	-364(ra) # 80002368 <_ZN6ThreadD1Ev>
    800044dc:	00048513          	mv	a0,s1
    800044e0:	ffffe097          	auipc	ra,0xffffe
    800044e4:	fc8080e7          	jalr	-56(ra) # 800024a8 <_ZdlPv>
    800044e8:	01813083          	ld	ra,24(sp)
    800044ec:	01013403          	ld	s0,16(sp)
    800044f0:	00813483          	ld	s1,8(sp)
    800044f4:	02010113          	addi	sp,sp,32
    800044f8:	00008067          	ret

00000000800044fc <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    800044fc:	ff010113          	addi	sp,sp,-16
    80004500:	00113423          	sd	ra,8(sp)
    80004504:	00813023          	sd	s0,0(sp)
    80004508:	01010413          	addi	s0,sp,16
    8000450c:	00007797          	auipc	a5,0x7
    80004510:	3f478793          	addi	a5,a5,1012 # 8000b900 <_ZTV7WorkerC+0x10>
    80004514:	00f53023          	sd	a5,0(a0)
    80004518:	ffffe097          	auipc	ra,0xffffe
    8000451c:	e50080e7          	jalr	-432(ra) # 80002368 <_ZN6ThreadD1Ev>
    80004520:	00813083          	ld	ra,8(sp)
    80004524:	00013403          	ld	s0,0(sp)
    80004528:	01010113          	addi	sp,sp,16
    8000452c:	00008067          	ret

0000000080004530 <_ZN7WorkerCD0Ev>:
    80004530:	fe010113          	addi	sp,sp,-32
    80004534:	00113c23          	sd	ra,24(sp)
    80004538:	00813823          	sd	s0,16(sp)
    8000453c:	00913423          	sd	s1,8(sp)
    80004540:	02010413          	addi	s0,sp,32
    80004544:	00050493          	mv	s1,a0
    80004548:	00007797          	auipc	a5,0x7
    8000454c:	3b878793          	addi	a5,a5,952 # 8000b900 <_ZTV7WorkerC+0x10>
    80004550:	00f53023          	sd	a5,0(a0)
    80004554:	ffffe097          	auipc	ra,0xffffe
    80004558:	e14080e7          	jalr	-492(ra) # 80002368 <_ZN6ThreadD1Ev>
    8000455c:	00048513          	mv	a0,s1
    80004560:	ffffe097          	auipc	ra,0xffffe
    80004564:	f48080e7          	jalr	-184(ra) # 800024a8 <_ZdlPv>
    80004568:	01813083          	ld	ra,24(sp)
    8000456c:	01013403          	ld	s0,16(sp)
    80004570:	00813483          	ld	s1,8(sp)
    80004574:	02010113          	addi	sp,sp,32
    80004578:	00008067          	ret

000000008000457c <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    8000457c:	ff010113          	addi	sp,sp,-16
    80004580:	00113423          	sd	ra,8(sp)
    80004584:	00813023          	sd	s0,0(sp)
    80004588:	01010413          	addi	s0,sp,16
    8000458c:	00007797          	auipc	a5,0x7
    80004590:	39c78793          	addi	a5,a5,924 # 8000b928 <_ZTV7WorkerD+0x10>
    80004594:	00f53023          	sd	a5,0(a0)
    80004598:	ffffe097          	auipc	ra,0xffffe
    8000459c:	dd0080e7          	jalr	-560(ra) # 80002368 <_ZN6ThreadD1Ev>
    800045a0:	00813083          	ld	ra,8(sp)
    800045a4:	00013403          	ld	s0,0(sp)
    800045a8:	01010113          	addi	sp,sp,16
    800045ac:	00008067          	ret

00000000800045b0 <_ZN7WorkerDD0Ev>:
    800045b0:	fe010113          	addi	sp,sp,-32
    800045b4:	00113c23          	sd	ra,24(sp)
    800045b8:	00813823          	sd	s0,16(sp)
    800045bc:	00913423          	sd	s1,8(sp)
    800045c0:	02010413          	addi	s0,sp,32
    800045c4:	00050493          	mv	s1,a0
    800045c8:	00007797          	auipc	a5,0x7
    800045cc:	36078793          	addi	a5,a5,864 # 8000b928 <_ZTV7WorkerD+0x10>
    800045d0:	00f53023          	sd	a5,0(a0)
    800045d4:	ffffe097          	auipc	ra,0xffffe
    800045d8:	d94080e7          	jalr	-620(ra) # 80002368 <_ZN6ThreadD1Ev>
    800045dc:	00048513          	mv	a0,s1
    800045e0:	ffffe097          	auipc	ra,0xffffe
    800045e4:	ec8080e7          	jalr	-312(ra) # 800024a8 <_ZdlPv>
    800045e8:	01813083          	ld	ra,24(sp)
    800045ec:	01013403          	ld	s0,16(sp)
    800045f0:	00813483          	ld	s1,8(sp)
    800045f4:	02010113          	addi	sp,sp,32
    800045f8:	00008067          	ret

00000000800045fc <_ZN7WorkerA3runEv>:
    void run() override {
    800045fc:	ff010113          	addi	sp,sp,-16
    80004600:	00113423          	sd	ra,8(sp)
    80004604:	00813023          	sd	s0,0(sp)
    80004608:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    8000460c:	00000593          	li	a1,0
    80004610:	fffff097          	auipc	ra,0xfffff
    80004614:	774080e7          	jalr	1908(ra) # 80003d84 <_ZN7WorkerA11workerBodyAEPv>
    }
    80004618:	00813083          	ld	ra,8(sp)
    8000461c:	00013403          	ld	s0,0(sp)
    80004620:	01010113          	addi	sp,sp,16
    80004624:	00008067          	ret

0000000080004628 <_ZN7WorkerB3runEv>:
    void run() override {
    80004628:	ff010113          	addi	sp,sp,-16
    8000462c:	00113423          	sd	ra,8(sp)
    80004630:	00813023          	sd	s0,0(sp)
    80004634:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80004638:	00000593          	li	a1,0
    8000463c:	00000097          	auipc	ra,0x0
    80004640:	814080e7          	jalr	-2028(ra) # 80003e50 <_ZN7WorkerB11workerBodyBEPv>
    }
    80004644:	00813083          	ld	ra,8(sp)
    80004648:	00013403          	ld	s0,0(sp)
    8000464c:	01010113          	addi	sp,sp,16
    80004650:	00008067          	ret

0000000080004654 <_ZN7WorkerC3runEv>:
    void run() override {
    80004654:	ff010113          	addi	sp,sp,-16
    80004658:	00113423          	sd	ra,8(sp)
    8000465c:	00813023          	sd	s0,0(sp)
    80004660:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80004664:	00000593          	li	a1,0
    80004668:	00000097          	auipc	ra,0x0
    8000466c:	8bc080e7          	jalr	-1860(ra) # 80003f24 <_ZN7WorkerC11workerBodyCEPv>
    }
    80004670:	00813083          	ld	ra,8(sp)
    80004674:	00013403          	ld	s0,0(sp)
    80004678:	01010113          	addi	sp,sp,16
    8000467c:	00008067          	ret

0000000080004680 <_ZN7WorkerD3runEv>:
    void run() override {
    80004680:	ff010113          	addi	sp,sp,-16
    80004684:	00113423          	sd	ra,8(sp)
    80004688:	00813023          	sd	s0,0(sp)
    8000468c:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80004690:	00000593          	li	a1,0
    80004694:	00000097          	auipc	ra,0x0
    80004698:	a10080e7          	jalr	-1520(ra) # 800040a4 <_ZN7WorkerD11workerBodyDEPv>
    }
    8000469c:	00813083          	ld	ra,8(sp)
    800046a0:	00013403          	ld	s0,0(sp)
    800046a4:	01010113          	addi	sp,sp,16
    800046a8:	00008067          	ret

00000000800046ac <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    800046ac:	f8010113          	addi	sp,sp,-128
    800046b0:	06113c23          	sd	ra,120(sp)
    800046b4:	06813823          	sd	s0,112(sp)
    800046b8:	06913423          	sd	s1,104(sp)
    800046bc:	07213023          	sd	s2,96(sp)
    800046c0:	05313c23          	sd	s3,88(sp)
    800046c4:	05413823          	sd	s4,80(sp)
    800046c8:	05513423          	sd	s5,72(sp)
    800046cc:	05613023          	sd	s6,64(sp)
    800046d0:	03713c23          	sd	s7,56(sp)
    800046d4:	03813823          	sd	s8,48(sp)
    800046d8:	03913423          	sd	s9,40(sp)
    800046dc:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    800046e0:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    800046e4:	00005517          	auipc	a0,0x5
    800046e8:	b5450513          	addi	a0,a0,-1196 # 80009238 <_ZZ9kPrintIntmE6digits+0x1c8>
    800046ec:	00001097          	auipc	ra,0x1
    800046f0:	5a8080e7          	jalr	1448(ra) # 80005c94 <_Z11printStringPKc>
    getString(input, 30);
    800046f4:	01e00593          	li	a1,30
    800046f8:	f8040493          	addi	s1,s0,-128
    800046fc:	00048513          	mv	a0,s1
    80004700:	00001097          	auipc	ra,0x1
    80004704:	61c080e7          	jalr	1564(ra) # 80005d1c <_Z9getStringPci>
    threadNum = stringToInt(input);
    80004708:	00048513          	mv	a0,s1
    8000470c:	00001097          	auipc	ra,0x1
    80004710:	6e8080e7          	jalr	1768(ra) # 80005df4 <_Z11stringToIntPKc>
    80004714:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    80004718:	00005517          	auipc	a0,0x5
    8000471c:	b4050513          	addi	a0,a0,-1216 # 80009258 <_ZZ9kPrintIntmE6digits+0x1e8>
    80004720:	00001097          	auipc	ra,0x1
    80004724:	574080e7          	jalr	1396(ra) # 80005c94 <_Z11printStringPKc>
    getString(input, 30);
    80004728:	01e00593          	li	a1,30
    8000472c:	00048513          	mv	a0,s1
    80004730:	00001097          	auipc	ra,0x1
    80004734:	5ec080e7          	jalr	1516(ra) # 80005d1c <_Z9getStringPci>
    n = stringToInt(input);
    80004738:	00048513          	mv	a0,s1
    8000473c:	00001097          	auipc	ra,0x1
    80004740:	6b8080e7          	jalr	1720(ra) # 80005df4 <_Z11stringToIntPKc>
    80004744:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80004748:	00005517          	auipc	a0,0x5
    8000474c:	b3050513          	addi	a0,a0,-1232 # 80009278 <_ZZ9kPrintIntmE6digits+0x208>
    80004750:	00001097          	auipc	ra,0x1
    80004754:	544080e7          	jalr	1348(ra) # 80005c94 <_Z11printStringPKc>
    printInt(threadNum);
    80004758:	00000613          	li	a2,0
    8000475c:	00a00593          	li	a1,10
    80004760:	00098513          	mv	a0,s3
    80004764:	00001097          	auipc	ra,0x1
    80004768:	6e0080e7          	jalr	1760(ra) # 80005e44 <_Z8printIntiii>
    printString(" i velicina bafera ");
    8000476c:	00005517          	auipc	a0,0x5
    80004770:	b2450513          	addi	a0,a0,-1244 # 80009290 <_ZZ9kPrintIntmE6digits+0x220>
    80004774:	00001097          	auipc	ra,0x1
    80004778:	520080e7          	jalr	1312(ra) # 80005c94 <_Z11printStringPKc>
    printInt(n);
    8000477c:	00000613          	li	a2,0
    80004780:	00a00593          	li	a1,10
    80004784:	00048513          	mv	a0,s1
    80004788:	00001097          	auipc	ra,0x1
    8000478c:	6bc080e7          	jalr	1724(ra) # 80005e44 <_Z8printIntiii>
    printString(".\n");
    80004790:	00005517          	auipc	a0,0x5
    80004794:	b1850513          	addi	a0,a0,-1256 # 800092a8 <_ZZ9kPrintIntmE6digits+0x238>
    80004798:	00001097          	auipc	ra,0x1
    8000479c:	4fc080e7          	jalr	1276(ra) # 80005c94 <_Z11printStringPKc>
    if (threadNum > n) {
    800047a0:	0334c463          	blt	s1,s3,800047c8 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    800047a4:	03305c63          	blez	s3,800047dc <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    800047a8:	03800513          	li	a0,56
    800047ac:	ffffe097          	auipc	ra,0xffffe
    800047b0:	cac080e7          	jalr	-852(ra) # 80002458 <_Znwm>
    800047b4:	00050a93          	mv	s5,a0
    800047b8:	00048593          	mv	a1,s1
    800047bc:	00001097          	auipc	ra,0x1
    800047c0:	7a8080e7          	jalr	1960(ra) # 80005f64 <_ZN9BufferCPPC1Ei>
    800047c4:	0300006f          	j	800047f4 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800047c8:	00005517          	auipc	a0,0x5
    800047cc:	ae850513          	addi	a0,a0,-1304 # 800092b0 <_ZZ9kPrintIntmE6digits+0x240>
    800047d0:	00001097          	auipc	ra,0x1
    800047d4:	4c4080e7          	jalr	1220(ra) # 80005c94 <_Z11printStringPKc>
        return;
    800047d8:	0140006f          	j	800047ec <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800047dc:	00005517          	auipc	a0,0x5
    800047e0:	b1450513          	addi	a0,a0,-1260 # 800092f0 <_ZZ9kPrintIntmE6digits+0x280>
    800047e4:	00001097          	auipc	ra,0x1
    800047e8:	4b0080e7          	jalr	1200(ra) # 80005c94 <_Z11printStringPKc>
        return;
    800047ec:	000c0113          	mv	sp,s8
    800047f0:	2140006f          	j	80004a04 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    800047f4:	01000513          	li	a0,16
    800047f8:	ffffe097          	auipc	ra,0xffffe
    800047fc:	c60080e7          	jalr	-928(ra) # 80002458 <_Znwm>
    80004800:	00050913          	mv	s2,a0
    80004804:	00000593          	li	a1,0
    80004808:	ffffe097          	auipc	ra,0xffffe
    8000480c:	f94080e7          	jalr	-108(ra) # 8000279c <_ZN9SemaphoreC1Ej>
    80004810:	00007797          	auipc	a5,0x7
    80004814:	4327b023          	sd	s2,1056(a5) # 8000bc30 <_ZL10waitForAll>
    Thread *producers[threadNum];
    80004818:	00399793          	slli	a5,s3,0x3
    8000481c:	00f78793          	addi	a5,a5,15
    80004820:	ff07f793          	andi	a5,a5,-16
    80004824:	40f10133          	sub	sp,sp,a5
    80004828:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    8000482c:	0019871b          	addiw	a4,s3,1
    80004830:	00171793          	slli	a5,a4,0x1
    80004834:	00e787b3          	add	a5,a5,a4
    80004838:	00379793          	slli	a5,a5,0x3
    8000483c:	00f78793          	addi	a5,a5,15
    80004840:	ff07f793          	andi	a5,a5,-16
    80004844:	40f10133          	sub	sp,sp,a5
    80004848:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    8000484c:	00199493          	slli	s1,s3,0x1
    80004850:	013484b3          	add	s1,s1,s3
    80004854:	00349493          	slli	s1,s1,0x3
    80004858:	009b04b3          	add	s1,s6,s1
    8000485c:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80004860:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80004864:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004868:	02800513          	li	a0,40
    8000486c:	ffffe097          	auipc	ra,0xffffe
    80004870:	bec080e7          	jalr	-1044(ra) # 80002458 <_Znwm>
    80004874:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80004878:	ffffe097          	auipc	ra,0xffffe
    8000487c:	ea8080e7          	jalr	-344(ra) # 80002720 <_ZN6ThreadC1Ev>
    80004880:	00007797          	auipc	a5,0x7
    80004884:	12078793          	addi	a5,a5,288 # 8000b9a0 <_ZTV8Consumer+0x10>
    80004888:	00fbb023          	sd	a5,0(s7)
    8000488c:	029bb023          	sd	s1,32(s7)
    consumer->start();
    80004890:	000b8513          	mv	a0,s7
    80004894:	ffffe097          	auipc	ra,0xffffe
    80004898:	d74080e7          	jalr	-652(ra) # 80002608 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    8000489c:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    800048a0:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    800048a4:	00007797          	auipc	a5,0x7
    800048a8:	38c7b783          	ld	a5,908(a5) # 8000bc30 <_ZL10waitForAll>
    800048ac:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800048b0:	02800513          	li	a0,40
    800048b4:	ffffe097          	auipc	ra,0xffffe
    800048b8:	ba4080e7          	jalr	-1116(ra) # 80002458 <_Znwm>
    800048bc:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    800048c0:	ffffe097          	auipc	ra,0xffffe
    800048c4:	e60080e7          	jalr	-416(ra) # 80002720 <_ZN6ThreadC1Ev>
    800048c8:	00007797          	auipc	a5,0x7
    800048cc:	08878793          	addi	a5,a5,136 # 8000b950 <_ZTV16ProducerKeyborad+0x10>
    800048d0:	00f4b023          	sd	a5,0(s1)
    800048d4:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800048d8:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    800048dc:	00048513          	mv	a0,s1
    800048e0:	ffffe097          	auipc	ra,0xffffe
    800048e4:	d28080e7          	jalr	-728(ra) # 80002608 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    800048e8:	00100913          	li	s2,1
    800048ec:	0300006f          	j	8000491c <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    800048f0:	00007797          	auipc	a5,0x7
    800048f4:	08878793          	addi	a5,a5,136 # 8000b978 <_ZTV8Producer+0x10>
    800048f8:	00fcb023          	sd	a5,0(s9)
    800048fc:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    80004900:	00391793          	slli	a5,s2,0x3
    80004904:	00fa07b3          	add	a5,s4,a5
    80004908:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    8000490c:	000c8513          	mv	a0,s9
    80004910:	ffffe097          	auipc	ra,0xffffe
    80004914:	cf8080e7          	jalr	-776(ra) # 80002608 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004918:	0019091b          	addiw	s2,s2,1
    8000491c:	05395263          	bge	s2,s3,80004960 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80004920:	00191493          	slli	s1,s2,0x1
    80004924:	012484b3          	add	s1,s1,s2
    80004928:	00349493          	slli	s1,s1,0x3
    8000492c:	009b04b3          	add	s1,s6,s1
    80004930:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80004934:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80004938:	00007797          	auipc	a5,0x7
    8000493c:	2f87b783          	ld	a5,760(a5) # 8000bc30 <_ZL10waitForAll>
    80004940:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80004944:	02800513          	li	a0,40
    80004948:	ffffe097          	auipc	ra,0xffffe
    8000494c:	b10080e7          	jalr	-1264(ra) # 80002458 <_Znwm>
    80004950:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004954:	ffffe097          	auipc	ra,0xffffe
    80004958:	dcc080e7          	jalr	-564(ra) # 80002720 <_ZN6ThreadC1Ev>
    8000495c:	f95ff06f          	j	800048f0 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    80004960:	ffffe097          	auipc	ra,0xffffe
    80004964:	d0c080e7          	jalr	-756(ra) # 8000266c <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80004968:	00000493          	li	s1,0
    8000496c:	0099ce63          	blt	s3,s1,80004988 <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    80004970:	00007517          	auipc	a0,0x7
    80004974:	2c053503          	ld	a0,704(a0) # 8000bc30 <_ZL10waitForAll>
    80004978:	ffffe097          	auipc	ra,0xffffe
    8000497c:	e5c080e7          	jalr	-420(ra) # 800027d4 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80004980:	0014849b          	addiw	s1,s1,1
    80004984:	fe9ff06f          	j	8000496c <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    80004988:	00007517          	auipc	a0,0x7
    8000498c:	2a853503          	ld	a0,680(a0) # 8000bc30 <_ZL10waitForAll>
    80004990:	00050863          	beqz	a0,800049a0 <_Z20testConsumerProducerv+0x2f4>
    80004994:	00053783          	ld	a5,0(a0)
    80004998:	0087b783          	ld	a5,8(a5)
    8000499c:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    800049a0:	00000493          	li	s1,0
    800049a4:	0080006f          	j	800049ac <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    800049a8:	0014849b          	addiw	s1,s1,1
    800049ac:	0334d263          	bge	s1,s3,800049d0 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    800049b0:	00349793          	slli	a5,s1,0x3
    800049b4:	00fa07b3          	add	a5,s4,a5
    800049b8:	0007b503          	ld	a0,0(a5)
    800049bc:	fe0506e3          	beqz	a0,800049a8 <_Z20testConsumerProducerv+0x2fc>
    800049c0:	00053783          	ld	a5,0(a0)
    800049c4:	0087b783          	ld	a5,8(a5)
    800049c8:	000780e7          	jalr	a5
    800049cc:	fddff06f          	j	800049a8 <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    800049d0:	000b8a63          	beqz	s7,800049e4 <_Z20testConsumerProducerv+0x338>
    800049d4:	000bb783          	ld	a5,0(s7)
    800049d8:	0087b783          	ld	a5,8(a5)
    800049dc:	000b8513          	mv	a0,s7
    800049e0:	000780e7          	jalr	a5
    delete buffer;
    800049e4:	000a8e63          	beqz	s5,80004a00 <_Z20testConsumerProducerv+0x354>
    800049e8:	000a8513          	mv	a0,s5
    800049ec:	00002097          	auipc	ra,0x2
    800049f0:	870080e7          	jalr	-1936(ra) # 8000625c <_ZN9BufferCPPD1Ev>
    800049f4:	000a8513          	mv	a0,s5
    800049f8:	ffffe097          	auipc	ra,0xffffe
    800049fc:	ab0080e7          	jalr	-1360(ra) # 800024a8 <_ZdlPv>
    80004a00:	000c0113          	mv	sp,s8
}
    80004a04:	f8040113          	addi	sp,s0,-128
    80004a08:	07813083          	ld	ra,120(sp)
    80004a0c:	07013403          	ld	s0,112(sp)
    80004a10:	06813483          	ld	s1,104(sp)
    80004a14:	06013903          	ld	s2,96(sp)
    80004a18:	05813983          	ld	s3,88(sp)
    80004a1c:	05013a03          	ld	s4,80(sp)
    80004a20:	04813a83          	ld	s5,72(sp)
    80004a24:	04013b03          	ld	s6,64(sp)
    80004a28:	03813b83          	ld	s7,56(sp)
    80004a2c:	03013c03          	ld	s8,48(sp)
    80004a30:	02813c83          	ld	s9,40(sp)
    80004a34:	08010113          	addi	sp,sp,128
    80004a38:	00008067          	ret
    80004a3c:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80004a40:	000a8513          	mv	a0,s5
    80004a44:	ffffe097          	auipc	ra,0xffffe
    80004a48:	a64080e7          	jalr	-1436(ra) # 800024a8 <_ZdlPv>
    80004a4c:	00048513          	mv	a0,s1
    80004a50:	00008097          	auipc	ra,0x8
    80004a54:	2d8080e7          	jalr	728(ra) # 8000cd28 <_Unwind_Resume>
    80004a58:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80004a5c:	00090513          	mv	a0,s2
    80004a60:	ffffe097          	auipc	ra,0xffffe
    80004a64:	a48080e7          	jalr	-1464(ra) # 800024a8 <_ZdlPv>
    80004a68:	00048513          	mv	a0,s1
    80004a6c:	00008097          	auipc	ra,0x8
    80004a70:	2bc080e7          	jalr	700(ra) # 8000cd28 <_Unwind_Resume>
    80004a74:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004a78:	000b8513          	mv	a0,s7
    80004a7c:	ffffe097          	auipc	ra,0xffffe
    80004a80:	a2c080e7          	jalr	-1492(ra) # 800024a8 <_ZdlPv>
    80004a84:	00048513          	mv	a0,s1
    80004a88:	00008097          	auipc	ra,0x8
    80004a8c:	2a0080e7          	jalr	672(ra) # 8000cd28 <_Unwind_Resume>
    80004a90:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004a94:	00048513          	mv	a0,s1
    80004a98:	ffffe097          	auipc	ra,0xffffe
    80004a9c:	a10080e7          	jalr	-1520(ra) # 800024a8 <_ZdlPv>
    80004aa0:	00090513          	mv	a0,s2
    80004aa4:	00008097          	auipc	ra,0x8
    80004aa8:	284080e7          	jalr	644(ra) # 8000cd28 <_Unwind_Resume>
    80004aac:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    80004ab0:	000c8513          	mv	a0,s9
    80004ab4:	ffffe097          	auipc	ra,0xffffe
    80004ab8:	9f4080e7          	jalr	-1548(ra) # 800024a8 <_ZdlPv>
    80004abc:	00048513          	mv	a0,s1
    80004ac0:	00008097          	auipc	ra,0x8
    80004ac4:	268080e7          	jalr	616(ra) # 8000cd28 <_Unwind_Resume>

0000000080004ac8 <_ZN8Consumer3runEv>:
    void run() override {
    80004ac8:	fd010113          	addi	sp,sp,-48
    80004acc:	02113423          	sd	ra,40(sp)
    80004ad0:	02813023          	sd	s0,32(sp)
    80004ad4:	00913c23          	sd	s1,24(sp)
    80004ad8:	01213823          	sd	s2,16(sp)
    80004adc:	01313423          	sd	s3,8(sp)
    80004ae0:	03010413          	addi	s0,sp,48
    80004ae4:	00050913          	mv	s2,a0
        int i = 0;
    80004ae8:	00000993          	li	s3,0
    80004aec:	0100006f          	j	80004afc <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    80004af0:	00a00513          	li	a0,10
    80004af4:	ffffe097          	auipc	ra,0xffffe
    80004af8:	dd4080e7          	jalr	-556(ra) # 800028c8 <_ZN7Console4putcEc>
        while (!threadEnd) {
    80004afc:	00007797          	auipc	a5,0x7
    80004b00:	12c7a783          	lw	a5,300(a5) # 8000bc28 <_ZL9threadEnd>
    80004b04:	04079a63          	bnez	a5,80004b58 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80004b08:	02093783          	ld	a5,32(s2)
    80004b0c:	0087b503          	ld	a0,8(a5)
    80004b10:	00001097          	auipc	ra,0x1
    80004b14:	638080e7          	jalr	1592(ra) # 80006148 <_ZN9BufferCPP3getEv>
            i++;
    80004b18:	0019849b          	addiw	s1,s3,1
    80004b1c:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80004b20:	0ff57513          	andi	a0,a0,255
    80004b24:	ffffe097          	auipc	ra,0xffffe
    80004b28:	da4080e7          	jalr	-604(ra) # 800028c8 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80004b2c:	05000793          	li	a5,80
    80004b30:	02f4e4bb          	remw	s1,s1,a5
    80004b34:	fc0494e3          	bnez	s1,80004afc <_ZN8Consumer3runEv+0x34>
    80004b38:	fb9ff06f          	j	80004af0 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80004b3c:	02093783          	ld	a5,32(s2)
    80004b40:	0087b503          	ld	a0,8(a5)
    80004b44:	00001097          	auipc	ra,0x1
    80004b48:	604080e7          	jalr	1540(ra) # 80006148 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80004b4c:	0ff57513          	andi	a0,a0,255
    80004b50:	ffffe097          	auipc	ra,0xffffe
    80004b54:	d78080e7          	jalr	-648(ra) # 800028c8 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80004b58:	02093783          	ld	a5,32(s2)
    80004b5c:	0087b503          	ld	a0,8(a5)
    80004b60:	00001097          	auipc	ra,0x1
    80004b64:	674080e7          	jalr	1652(ra) # 800061d4 <_ZN9BufferCPP6getCntEv>
    80004b68:	fca04ae3          	bgtz	a0,80004b3c <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80004b6c:	02093783          	ld	a5,32(s2)
    80004b70:	0107b503          	ld	a0,16(a5)
    80004b74:	ffffe097          	auipc	ra,0xffffe
    80004b78:	c8c080e7          	jalr	-884(ra) # 80002800 <_ZN9Semaphore6signalEv>
    }
    80004b7c:	02813083          	ld	ra,40(sp)
    80004b80:	02013403          	ld	s0,32(sp)
    80004b84:	01813483          	ld	s1,24(sp)
    80004b88:	01013903          	ld	s2,16(sp)
    80004b8c:	00813983          	ld	s3,8(sp)
    80004b90:	03010113          	addi	sp,sp,48
    80004b94:	00008067          	ret

0000000080004b98 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80004b98:	ff010113          	addi	sp,sp,-16
    80004b9c:	00113423          	sd	ra,8(sp)
    80004ba0:	00813023          	sd	s0,0(sp)
    80004ba4:	01010413          	addi	s0,sp,16
    80004ba8:	00007797          	auipc	a5,0x7
    80004bac:	df878793          	addi	a5,a5,-520 # 8000b9a0 <_ZTV8Consumer+0x10>
    80004bb0:	00f53023          	sd	a5,0(a0)
    80004bb4:	ffffd097          	auipc	ra,0xffffd
    80004bb8:	7b4080e7          	jalr	1972(ra) # 80002368 <_ZN6ThreadD1Ev>
    80004bbc:	00813083          	ld	ra,8(sp)
    80004bc0:	00013403          	ld	s0,0(sp)
    80004bc4:	01010113          	addi	sp,sp,16
    80004bc8:	00008067          	ret

0000000080004bcc <_ZN8ConsumerD0Ev>:
    80004bcc:	fe010113          	addi	sp,sp,-32
    80004bd0:	00113c23          	sd	ra,24(sp)
    80004bd4:	00813823          	sd	s0,16(sp)
    80004bd8:	00913423          	sd	s1,8(sp)
    80004bdc:	02010413          	addi	s0,sp,32
    80004be0:	00050493          	mv	s1,a0
    80004be4:	00007797          	auipc	a5,0x7
    80004be8:	dbc78793          	addi	a5,a5,-580 # 8000b9a0 <_ZTV8Consumer+0x10>
    80004bec:	00f53023          	sd	a5,0(a0)
    80004bf0:	ffffd097          	auipc	ra,0xffffd
    80004bf4:	778080e7          	jalr	1912(ra) # 80002368 <_ZN6ThreadD1Ev>
    80004bf8:	00048513          	mv	a0,s1
    80004bfc:	ffffe097          	auipc	ra,0xffffe
    80004c00:	8ac080e7          	jalr	-1876(ra) # 800024a8 <_ZdlPv>
    80004c04:	01813083          	ld	ra,24(sp)
    80004c08:	01013403          	ld	s0,16(sp)
    80004c0c:	00813483          	ld	s1,8(sp)
    80004c10:	02010113          	addi	sp,sp,32
    80004c14:	00008067          	ret

0000000080004c18 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80004c18:	ff010113          	addi	sp,sp,-16
    80004c1c:	00113423          	sd	ra,8(sp)
    80004c20:	00813023          	sd	s0,0(sp)
    80004c24:	01010413          	addi	s0,sp,16
    80004c28:	00007797          	auipc	a5,0x7
    80004c2c:	d2878793          	addi	a5,a5,-728 # 8000b950 <_ZTV16ProducerKeyborad+0x10>
    80004c30:	00f53023          	sd	a5,0(a0)
    80004c34:	ffffd097          	auipc	ra,0xffffd
    80004c38:	734080e7          	jalr	1844(ra) # 80002368 <_ZN6ThreadD1Ev>
    80004c3c:	00813083          	ld	ra,8(sp)
    80004c40:	00013403          	ld	s0,0(sp)
    80004c44:	01010113          	addi	sp,sp,16
    80004c48:	00008067          	ret

0000000080004c4c <_ZN16ProducerKeyboradD0Ev>:
    80004c4c:	fe010113          	addi	sp,sp,-32
    80004c50:	00113c23          	sd	ra,24(sp)
    80004c54:	00813823          	sd	s0,16(sp)
    80004c58:	00913423          	sd	s1,8(sp)
    80004c5c:	02010413          	addi	s0,sp,32
    80004c60:	00050493          	mv	s1,a0
    80004c64:	00007797          	auipc	a5,0x7
    80004c68:	cec78793          	addi	a5,a5,-788 # 8000b950 <_ZTV16ProducerKeyborad+0x10>
    80004c6c:	00f53023          	sd	a5,0(a0)
    80004c70:	ffffd097          	auipc	ra,0xffffd
    80004c74:	6f8080e7          	jalr	1784(ra) # 80002368 <_ZN6ThreadD1Ev>
    80004c78:	00048513          	mv	a0,s1
    80004c7c:	ffffe097          	auipc	ra,0xffffe
    80004c80:	82c080e7          	jalr	-2004(ra) # 800024a8 <_ZdlPv>
    80004c84:	01813083          	ld	ra,24(sp)
    80004c88:	01013403          	ld	s0,16(sp)
    80004c8c:	00813483          	ld	s1,8(sp)
    80004c90:	02010113          	addi	sp,sp,32
    80004c94:	00008067          	ret

0000000080004c98 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80004c98:	ff010113          	addi	sp,sp,-16
    80004c9c:	00113423          	sd	ra,8(sp)
    80004ca0:	00813023          	sd	s0,0(sp)
    80004ca4:	01010413          	addi	s0,sp,16
    80004ca8:	00007797          	auipc	a5,0x7
    80004cac:	cd078793          	addi	a5,a5,-816 # 8000b978 <_ZTV8Producer+0x10>
    80004cb0:	00f53023          	sd	a5,0(a0)
    80004cb4:	ffffd097          	auipc	ra,0xffffd
    80004cb8:	6b4080e7          	jalr	1716(ra) # 80002368 <_ZN6ThreadD1Ev>
    80004cbc:	00813083          	ld	ra,8(sp)
    80004cc0:	00013403          	ld	s0,0(sp)
    80004cc4:	01010113          	addi	sp,sp,16
    80004cc8:	00008067          	ret

0000000080004ccc <_ZN8ProducerD0Ev>:
    80004ccc:	fe010113          	addi	sp,sp,-32
    80004cd0:	00113c23          	sd	ra,24(sp)
    80004cd4:	00813823          	sd	s0,16(sp)
    80004cd8:	00913423          	sd	s1,8(sp)
    80004cdc:	02010413          	addi	s0,sp,32
    80004ce0:	00050493          	mv	s1,a0
    80004ce4:	00007797          	auipc	a5,0x7
    80004ce8:	c9478793          	addi	a5,a5,-876 # 8000b978 <_ZTV8Producer+0x10>
    80004cec:	00f53023          	sd	a5,0(a0)
    80004cf0:	ffffd097          	auipc	ra,0xffffd
    80004cf4:	678080e7          	jalr	1656(ra) # 80002368 <_ZN6ThreadD1Ev>
    80004cf8:	00048513          	mv	a0,s1
    80004cfc:	ffffd097          	auipc	ra,0xffffd
    80004d00:	7ac080e7          	jalr	1964(ra) # 800024a8 <_ZdlPv>
    80004d04:	01813083          	ld	ra,24(sp)
    80004d08:	01013403          	ld	s0,16(sp)
    80004d0c:	00813483          	ld	s1,8(sp)
    80004d10:	02010113          	addi	sp,sp,32
    80004d14:	00008067          	ret

0000000080004d18 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80004d18:	fe010113          	addi	sp,sp,-32
    80004d1c:	00113c23          	sd	ra,24(sp)
    80004d20:	00813823          	sd	s0,16(sp)
    80004d24:	00913423          	sd	s1,8(sp)
    80004d28:	02010413          	addi	s0,sp,32
    80004d2c:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80004d30:	ffffd097          	auipc	ra,0xffffd
    80004d34:	838080e7          	jalr	-1992(ra) # 80001568 <_Z4getcv>
    80004d38:	0005059b          	sext.w	a1,a0
    80004d3c:	01b00793          	li	a5,27
    80004d40:	00f58c63          	beq	a1,a5,80004d58 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80004d44:	0204b783          	ld	a5,32(s1)
    80004d48:	0087b503          	ld	a0,8(a5)
    80004d4c:	00001097          	auipc	ra,0x1
    80004d50:	36c080e7          	jalr	876(ra) # 800060b8 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80004d54:	fddff06f          	j	80004d30 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80004d58:	00100793          	li	a5,1
    80004d5c:	00007717          	auipc	a4,0x7
    80004d60:	ecf72623          	sw	a5,-308(a4) # 8000bc28 <_ZL9threadEnd>
        td->buffer->put('!');
    80004d64:	0204b783          	ld	a5,32(s1)
    80004d68:	02100593          	li	a1,33
    80004d6c:	0087b503          	ld	a0,8(a5)
    80004d70:	00001097          	auipc	ra,0x1
    80004d74:	348080e7          	jalr	840(ra) # 800060b8 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80004d78:	0204b783          	ld	a5,32(s1)
    80004d7c:	0107b503          	ld	a0,16(a5)
    80004d80:	ffffe097          	auipc	ra,0xffffe
    80004d84:	a80080e7          	jalr	-1408(ra) # 80002800 <_ZN9Semaphore6signalEv>
    }
    80004d88:	01813083          	ld	ra,24(sp)
    80004d8c:	01013403          	ld	s0,16(sp)
    80004d90:	00813483          	ld	s1,8(sp)
    80004d94:	02010113          	addi	sp,sp,32
    80004d98:	00008067          	ret

0000000080004d9c <_ZN8Producer3runEv>:
    void run() override {
    80004d9c:	fe010113          	addi	sp,sp,-32
    80004da0:	00113c23          	sd	ra,24(sp)
    80004da4:	00813823          	sd	s0,16(sp)
    80004da8:	00913423          	sd	s1,8(sp)
    80004dac:	01213023          	sd	s2,0(sp)
    80004db0:	02010413          	addi	s0,sp,32
    80004db4:	00050493          	mv	s1,a0
        int i = 0;
    80004db8:	00000913          	li	s2,0
        while (!threadEnd) {
    80004dbc:	00007797          	auipc	a5,0x7
    80004dc0:	e6c7a783          	lw	a5,-404(a5) # 8000bc28 <_ZL9threadEnd>
    80004dc4:	04079263          	bnez	a5,80004e08 <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    80004dc8:	0204b783          	ld	a5,32(s1)
    80004dcc:	0007a583          	lw	a1,0(a5)
    80004dd0:	0305859b          	addiw	a1,a1,48
    80004dd4:	0087b503          	ld	a0,8(a5)
    80004dd8:	00001097          	auipc	ra,0x1
    80004ddc:	2e0080e7          	jalr	736(ra) # 800060b8 <_ZN9BufferCPP3putEi>
            i++;
    80004de0:	0019071b          	addiw	a4,s2,1
    80004de4:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    80004de8:	0204b783          	ld	a5,32(s1)
    80004dec:	0007a783          	lw	a5,0(a5)
    80004df0:	00e787bb          	addw	a5,a5,a4
    80004df4:	00500513          	li	a0,5
    80004df8:	02a7e53b          	remw	a0,a5,a0
    80004dfc:	ffffe097          	auipc	ra,0xffffe
    80004e00:	898080e7          	jalr	-1896(ra) # 80002694 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80004e04:	fb9ff06f          	j	80004dbc <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80004e08:	0204b783          	ld	a5,32(s1)
    80004e0c:	0107b503          	ld	a0,16(a5)
    80004e10:	ffffe097          	auipc	ra,0xffffe
    80004e14:	9f0080e7          	jalr	-1552(ra) # 80002800 <_ZN9Semaphore6signalEv>
    }
    80004e18:	01813083          	ld	ra,24(sp)
    80004e1c:	01013403          	ld	s0,16(sp)
    80004e20:	00813483          	ld	s1,8(sp)
    80004e24:	00013903          	ld	s2,0(sp)
    80004e28:	02010113          	addi	sp,sp,32
    80004e2c:	00008067          	ret

0000000080004e30 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004e30:	fe010113          	addi	sp,sp,-32
    80004e34:	00113c23          	sd	ra,24(sp)
    80004e38:	00813823          	sd	s0,16(sp)
    80004e3c:	00913423          	sd	s1,8(sp)
    80004e40:	01213023          	sd	s2,0(sp)
    80004e44:	02010413          	addi	s0,sp,32
    80004e48:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004e4c:	00100793          	li	a5,1
    80004e50:	02a7f863          	bgeu	a5,a0,80004e80 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004e54:	00a00793          	li	a5,10
    80004e58:	02f577b3          	remu	a5,a0,a5
    80004e5c:	02078e63          	beqz	a5,80004e98 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004e60:	fff48513          	addi	a0,s1,-1
    80004e64:	00000097          	auipc	ra,0x0
    80004e68:	fcc080e7          	jalr	-52(ra) # 80004e30 <_ZL9fibonaccim>
    80004e6c:	00050913          	mv	s2,a0
    80004e70:	ffe48513          	addi	a0,s1,-2
    80004e74:	00000097          	auipc	ra,0x0
    80004e78:	fbc080e7          	jalr	-68(ra) # 80004e30 <_ZL9fibonaccim>
    80004e7c:	00a90533          	add	a0,s2,a0
}
    80004e80:	01813083          	ld	ra,24(sp)
    80004e84:	01013403          	ld	s0,16(sp)
    80004e88:	00813483          	ld	s1,8(sp)
    80004e8c:	00013903          	ld	s2,0(sp)
    80004e90:	02010113          	addi	sp,sp,32
    80004e94:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80004e98:	ffffc097          	auipc	ra,0xffffc
    80004e9c:	590080e7          	jalr	1424(ra) # 80001428 <_Z15thread_dispatchv>
    80004ea0:	fc1ff06f          	j	80004e60 <_ZL9fibonaccim+0x30>

0000000080004ea4 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80004ea4:	fe010113          	addi	sp,sp,-32
    80004ea8:	00113c23          	sd	ra,24(sp)
    80004eac:	00813823          	sd	s0,16(sp)
    80004eb0:	00913423          	sd	s1,8(sp)
    80004eb4:	01213023          	sd	s2,0(sp)
    80004eb8:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004ebc:	00a00493          	li	s1,10
    80004ec0:	0400006f          	j	80004f00 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004ec4:	00004517          	auipc	a0,0x4
    80004ec8:	4cc50513          	addi	a0,a0,1228 # 80009390 <_ZZ9kPrintIntmE6digits+0x320>
    80004ecc:	00001097          	auipc	ra,0x1
    80004ed0:	dc8080e7          	jalr	-568(ra) # 80005c94 <_Z11printStringPKc>
    80004ed4:	00000613          	li	a2,0
    80004ed8:	00a00593          	li	a1,10
    80004edc:	00048513          	mv	a0,s1
    80004ee0:	00001097          	auipc	ra,0x1
    80004ee4:	f64080e7          	jalr	-156(ra) # 80005e44 <_Z8printIntiii>
    80004ee8:	00004517          	auipc	a0,0x4
    80004eec:	69850513          	addi	a0,a0,1688 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80004ef0:	00001097          	auipc	ra,0x1
    80004ef4:	da4080e7          	jalr	-604(ra) # 80005c94 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004ef8:	0014849b          	addiw	s1,s1,1
    80004efc:	0ff4f493          	andi	s1,s1,255
    80004f00:	00c00793          	li	a5,12
    80004f04:	fc97f0e3          	bgeu	a5,s1,80004ec4 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80004f08:	00004517          	auipc	a0,0x4
    80004f0c:	49050513          	addi	a0,a0,1168 # 80009398 <_ZZ9kPrintIntmE6digits+0x328>
    80004f10:	00001097          	auipc	ra,0x1
    80004f14:	d84080e7          	jalr	-636(ra) # 80005c94 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004f18:	00500313          	li	t1,5
    thread_dispatch();
    80004f1c:	ffffc097          	auipc	ra,0xffffc
    80004f20:	50c080e7          	jalr	1292(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004f24:	01000513          	li	a0,16
    80004f28:	00000097          	auipc	ra,0x0
    80004f2c:	f08080e7          	jalr	-248(ra) # 80004e30 <_ZL9fibonaccim>
    80004f30:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004f34:	00004517          	auipc	a0,0x4
    80004f38:	47450513          	addi	a0,a0,1140 # 800093a8 <_ZZ9kPrintIntmE6digits+0x338>
    80004f3c:	00001097          	auipc	ra,0x1
    80004f40:	d58080e7          	jalr	-680(ra) # 80005c94 <_Z11printStringPKc>
    80004f44:	00000613          	li	a2,0
    80004f48:	00a00593          	li	a1,10
    80004f4c:	0009051b          	sext.w	a0,s2
    80004f50:	00001097          	auipc	ra,0x1
    80004f54:	ef4080e7          	jalr	-268(ra) # 80005e44 <_Z8printIntiii>
    80004f58:	00004517          	auipc	a0,0x4
    80004f5c:	62850513          	addi	a0,a0,1576 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80004f60:	00001097          	auipc	ra,0x1
    80004f64:	d34080e7          	jalr	-716(ra) # 80005c94 <_Z11printStringPKc>
    80004f68:	0400006f          	j	80004fa8 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004f6c:	00004517          	auipc	a0,0x4
    80004f70:	42450513          	addi	a0,a0,1060 # 80009390 <_ZZ9kPrintIntmE6digits+0x320>
    80004f74:	00001097          	auipc	ra,0x1
    80004f78:	d20080e7          	jalr	-736(ra) # 80005c94 <_Z11printStringPKc>
    80004f7c:	00000613          	li	a2,0
    80004f80:	00a00593          	li	a1,10
    80004f84:	00048513          	mv	a0,s1
    80004f88:	00001097          	auipc	ra,0x1
    80004f8c:	ebc080e7          	jalr	-324(ra) # 80005e44 <_Z8printIntiii>
    80004f90:	00004517          	auipc	a0,0x4
    80004f94:	5f050513          	addi	a0,a0,1520 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80004f98:	00001097          	auipc	ra,0x1
    80004f9c:	cfc080e7          	jalr	-772(ra) # 80005c94 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004fa0:	0014849b          	addiw	s1,s1,1
    80004fa4:	0ff4f493          	andi	s1,s1,255
    80004fa8:	00f00793          	li	a5,15
    80004fac:	fc97f0e3          	bgeu	a5,s1,80004f6c <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80004fb0:	00004517          	auipc	a0,0x4
    80004fb4:	40850513          	addi	a0,a0,1032 # 800093b8 <_ZZ9kPrintIntmE6digits+0x348>
    80004fb8:	00001097          	auipc	ra,0x1
    80004fbc:	cdc080e7          	jalr	-804(ra) # 80005c94 <_Z11printStringPKc>
    finishedD = true;
    80004fc0:	00100793          	li	a5,1
    80004fc4:	00007717          	auipc	a4,0x7
    80004fc8:	c6f70a23          	sb	a5,-908(a4) # 8000bc38 <_ZL9finishedD>
    thread_dispatch();
    80004fcc:	ffffc097          	auipc	ra,0xffffc
    80004fd0:	45c080e7          	jalr	1116(ra) # 80001428 <_Z15thread_dispatchv>
}
    80004fd4:	01813083          	ld	ra,24(sp)
    80004fd8:	01013403          	ld	s0,16(sp)
    80004fdc:	00813483          	ld	s1,8(sp)
    80004fe0:	00013903          	ld	s2,0(sp)
    80004fe4:	02010113          	addi	sp,sp,32
    80004fe8:	00008067          	ret

0000000080004fec <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80004fec:	fe010113          	addi	sp,sp,-32
    80004ff0:	00113c23          	sd	ra,24(sp)
    80004ff4:	00813823          	sd	s0,16(sp)
    80004ff8:	00913423          	sd	s1,8(sp)
    80004ffc:	01213023          	sd	s2,0(sp)
    80005000:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80005004:	00000493          	li	s1,0
    80005008:	0400006f          	j	80005048 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    8000500c:	00004517          	auipc	a0,0x4
    80005010:	34450513          	addi	a0,a0,836 # 80009350 <_ZZ9kPrintIntmE6digits+0x2e0>
    80005014:	00001097          	auipc	ra,0x1
    80005018:	c80080e7          	jalr	-896(ra) # 80005c94 <_Z11printStringPKc>
    8000501c:	00000613          	li	a2,0
    80005020:	00a00593          	li	a1,10
    80005024:	00048513          	mv	a0,s1
    80005028:	00001097          	auipc	ra,0x1
    8000502c:	e1c080e7          	jalr	-484(ra) # 80005e44 <_Z8printIntiii>
    80005030:	00004517          	auipc	a0,0x4
    80005034:	55050513          	addi	a0,a0,1360 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80005038:	00001097          	auipc	ra,0x1
    8000503c:	c5c080e7          	jalr	-932(ra) # 80005c94 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80005040:	0014849b          	addiw	s1,s1,1
    80005044:	0ff4f493          	andi	s1,s1,255
    80005048:	00200793          	li	a5,2
    8000504c:	fc97f0e3          	bgeu	a5,s1,8000500c <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80005050:	00004517          	auipc	a0,0x4
    80005054:	30850513          	addi	a0,a0,776 # 80009358 <_ZZ9kPrintIntmE6digits+0x2e8>
    80005058:	00001097          	auipc	ra,0x1
    8000505c:	c3c080e7          	jalr	-964(ra) # 80005c94 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80005060:	00700313          	li	t1,7
    thread_dispatch();
    80005064:	ffffc097          	auipc	ra,0xffffc
    80005068:	3c4080e7          	jalr	964(ra) # 80001428 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    8000506c:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80005070:	00004517          	auipc	a0,0x4
    80005074:	2f850513          	addi	a0,a0,760 # 80009368 <_ZZ9kPrintIntmE6digits+0x2f8>
    80005078:	00001097          	auipc	ra,0x1
    8000507c:	c1c080e7          	jalr	-996(ra) # 80005c94 <_Z11printStringPKc>
    80005080:	00000613          	li	a2,0
    80005084:	00a00593          	li	a1,10
    80005088:	0009051b          	sext.w	a0,s2
    8000508c:	00001097          	auipc	ra,0x1
    80005090:	db8080e7          	jalr	-584(ra) # 80005e44 <_Z8printIntiii>
    80005094:	00004517          	auipc	a0,0x4
    80005098:	4ec50513          	addi	a0,a0,1260 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    8000509c:	00001097          	auipc	ra,0x1
    800050a0:	bf8080e7          	jalr	-1032(ra) # 80005c94 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    800050a4:	00c00513          	li	a0,12
    800050a8:	00000097          	auipc	ra,0x0
    800050ac:	d88080e7          	jalr	-632(ra) # 80004e30 <_ZL9fibonaccim>
    800050b0:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800050b4:	00004517          	auipc	a0,0x4
    800050b8:	2bc50513          	addi	a0,a0,700 # 80009370 <_ZZ9kPrintIntmE6digits+0x300>
    800050bc:	00001097          	auipc	ra,0x1
    800050c0:	bd8080e7          	jalr	-1064(ra) # 80005c94 <_Z11printStringPKc>
    800050c4:	00000613          	li	a2,0
    800050c8:	00a00593          	li	a1,10
    800050cc:	0009051b          	sext.w	a0,s2
    800050d0:	00001097          	auipc	ra,0x1
    800050d4:	d74080e7          	jalr	-652(ra) # 80005e44 <_Z8printIntiii>
    800050d8:	00004517          	auipc	a0,0x4
    800050dc:	4a850513          	addi	a0,a0,1192 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    800050e0:	00001097          	auipc	ra,0x1
    800050e4:	bb4080e7          	jalr	-1100(ra) # 80005c94 <_Z11printStringPKc>
    800050e8:	0400006f          	j	80005128 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800050ec:	00004517          	auipc	a0,0x4
    800050f0:	26450513          	addi	a0,a0,612 # 80009350 <_ZZ9kPrintIntmE6digits+0x2e0>
    800050f4:	00001097          	auipc	ra,0x1
    800050f8:	ba0080e7          	jalr	-1120(ra) # 80005c94 <_Z11printStringPKc>
    800050fc:	00000613          	li	a2,0
    80005100:	00a00593          	li	a1,10
    80005104:	00048513          	mv	a0,s1
    80005108:	00001097          	auipc	ra,0x1
    8000510c:	d3c080e7          	jalr	-708(ra) # 80005e44 <_Z8printIntiii>
    80005110:	00004517          	auipc	a0,0x4
    80005114:	47050513          	addi	a0,a0,1136 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80005118:	00001097          	auipc	ra,0x1
    8000511c:	b7c080e7          	jalr	-1156(ra) # 80005c94 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80005120:	0014849b          	addiw	s1,s1,1
    80005124:	0ff4f493          	andi	s1,s1,255
    80005128:	00500793          	li	a5,5
    8000512c:	fc97f0e3          	bgeu	a5,s1,800050ec <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    80005130:	00004517          	auipc	a0,0x4
    80005134:	25050513          	addi	a0,a0,592 # 80009380 <_ZZ9kPrintIntmE6digits+0x310>
    80005138:	00001097          	auipc	ra,0x1
    8000513c:	b5c080e7          	jalr	-1188(ra) # 80005c94 <_Z11printStringPKc>
    finishedC = true;
    80005140:	00100793          	li	a5,1
    80005144:	00007717          	auipc	a4,0x7
    80005148:	aef70aa3          	sb	a5,-1291(a4) # 8000bc39 <_ZL9finishedC>
    thread_dispatch();
    8000514c:	ffffc097          	auipc	ra,0xffffc
    80005150:	2dc080e7          	jalr	732(ra) # 80001428 <_Z15thread_dispatchv>
}
    80005154:	01813083          	ld	ra,24(sp)
    80005158:	01013403          	ld	s0,16(sp)
    8000515c:	00813483          	ld	s1,8(sp)
    80005160:	00013903          	ld	s2,0(sp)
    80005164:	02010113          	addi	sp,sp,32
    80005168:	00008067          	ret

000000008000516c <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    8000516c:	fe010113          	addi	sp,sp,-32
    80005170:	00113c23          	sd	ra,24(sp)
    80005174:	00813823          	sd	s0,16(sp)
    80005178:	00913423          	sd	s1,8(sp)
    8000517c:	01213023          	sd	s2,0(sp)
    80005180:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80005184:	00000913          	li	s2,0
    80005188:	0380006f          	j	800051c0 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    8000518c:	ffffc097          	auipc	ra,0xffffc
    80005190:	29c080e7          	jalr	668(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005194:	00148493          	addi	s1,s1,1
    80005198:	000027b7          	lui	a5,0x2
    8000519c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800051a0:	0097ee63          	bltu	a5,s1,800051bc <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800051a4:	00000713          	li	a4,0
    800051a8:	000077b7          	lui	a5,0x7
    800051ac:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800051b0:	fce7eee3          	bltu	a5,a4,8000518c <_ZL11workerBodyBPv+0x20>
    800051b4:	00170713          	addi	a4,a4,1
    800051b8:	ff1ff06f          	j	800051a8 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    800051bc:	00190913          	addi	s2,s2,1
    800051c0:	00f00793          	li	a5,15
    800051c4:	0527e063          	bltu	a5,s2,80005204 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800051c8:	00004517          	auipc	a0,0x4
    800051cc:	17050513          	addi	a0,a0,368 # 80009338 <_ZZ9kPrintIntmE6digits+0x2c8>
    800051d0:	00001097          	auipc	ra,0x1
    800051d4:	ac4080e7          	jalr	-1340(ra) # 80005c94 <_Z11printStringPKc>
    800051d8:	00000613          	li	a2,0
    800051dc:	00a00593          	li	a1,10
    800051e0:	0009051b          	sext.w	a0,s2
    800051e4:	00001097          	auipc	ra,0x1
    800051e8:	c60080e7          	jalr	-928(ra) # 80005e44 <_Z8printIntiii>
    800051ec:	00004517          	auipc	a0,0x4
    800051f0:	39450513          	addi	a0,a0,916 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    800051f4:	00001097          	auipc	ra,0x1
    800051f8:	aa0080e7          	jalr	-1376(ra) # 80005c94 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800051fc:	00000493          	li	s1,0
    80005200:	f99ff06f          	j	80005198 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80005204:	00004517          	auipc	a0,0x4
    80005208:	13c50513          	addi	a0,a0,316 # 80009340 <_ZZ9kPrintIntmE6digits+0x2d0>
    8000520c:	00001097          	auipc	ra,0x1
    80005210:	a88080e7          	jalr	-1400(ra) # 80005c94 <_Z11printStringPKc>
    finishedB = true;
    80005214:	00100793          	li	a5,1
    80005218:	00007717          	auipc	a4,0x7
    8000521c:	a2f70123          	sb	a5,-1502(a4) # 8000bc3a <_ZL9finishedB>
    thread_dispatch();
    80005220:	ffffc097          	auipc	ra,0xffffc
    80005224:	208080e7          	jalr	520(ra) # 80001428 <_Z15thread_dispatchv>
}
    80005228:	01813083          	ld	ra,24(sp)
    8000522c:	01013403          	ld	s0,16(sp)
    80005230:	00813483          	ld	s1,8(sp)
    80005234:	00013903          	ld	s2,0(sp)
    80005238:	02010113          	addi	sp,sp,32
    8000523c:	00008067          	ret

0000000080005240 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80005240:	fe010113          	addi	sp,sp,-32
    80005244:	00113c23          	sd	ra,24(sp)
    80005248:	00813823          	sd	s0,16(sp)
    8000524c:	00913423          	sd	s1,8(sp)
    80005250:	01213023          	sd	s2,0(sp)
    80005254:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80005258:	00000913          	li	s2,0
    8000525c:	0380006f          	j	80005294 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80005260:	ffffc097          	auipc	ra,0xffffc
    80005264:	1c8080e7          	jalr	456(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005268:	00148493          	addi	s1,s1,1
    8000526c:	000027b7          	lui	a5,0x2
    80005270:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005274:	0097ee63          	bltu	a5,s1,80005290 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005278:	00000713          	li	a4,0
    8000527c:	000077b7          	lui	a5,0x7
    80005280:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005284:	fce7eee3          	bltu	a5,a4,80005260 <_ZL11workerBodyAPv+0x20>
    80005288:	00170713          	addi	a4,a4,1
    8000528c:	ff1ff06f          	j	8000527c <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80005290:	00190913          	addi	s2,s2,1
    80005294:	00900793          	li	a5,9
    80005298:	0527e063          	bltu	a5,s2,800052d8 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    8000529c:	00004517          	auipc	a0,0x4
    800052a0:	08450513          	addi	a0,a0,132 # 80009320 <_ZZ9kPrintIntmE6digits+0x2b0>
    800052a4:	00001097          	auipc	ra,0x1
    800052a8:	9f0080e7          	jalr	-1552(ra) # 80005c94 <_Z11printStringPKc>
    800052ac:	00000613          	li	a2,0
    800052b0:	00a00593          	li	a1,10
    800052b4:	0009051b          	sext.w	a0,s2
    800052b8:	00001097          	auipc	ra,0x1
    800052bc:	b8c080e7          	jalr	-1140(ra) # 80005e44 <_Z8printIntiii>
    800052c0:	00004517          	auipc	a0,0x4
    800052c4:	2c050513          	addi	a0,a0,704 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    800052c8:	00001097          	auipc	ra,0x1
    800052cc:	9cc080e7          	jalr	-1588(ra) # 80005c94 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800052d0:	00000493          	li	s1,0
    800052d4:	f99ff06f          	j	8000526c <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    800052d8:	00004517          	auipc	a0,0x4
    800052dc:	05050513          	addi	a0,a0,80 # 80009328 <_ZZ9kPrintIntmE6digits+0x2b8>
    800052e0:	00001097          	auipc	ra,0x1
    800052e4:	9b4080e7          	jalr	-1612(ra) # 80005c94 <_Z11printStringPKc>
    finishedA = true;
    800052e8:	00100793          	li	a5,1
    800052ec:	00007717          	auipc	a4,0x7
    800052f0:	94f707a3          	sb	a5,-1713(a4) # 8000bc3b <_ZL9finishedA>
}
    800052f4:	01813083          	ld	ra,24(sp)
    800052f8:	01013403          	ld	s0,16(sp)
    800052fc:	00813483          	ld	s1,8(sp)
    80005300:	00013903          	ld	s2,0(sp)
    80005304:	02010113          	addi	sp,sp,32
    80005308:	00008067          	ret

000000008000530c <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    8000530c:	fd010113          	addi	sp,sp,-48
    80005310:	02113423          	sd	ra,40(sp)
    80005314:	02813023          	sd	s0,32(sp)
    80005318:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    8000531c:	00000613          	li	a2,0
    80005320:	00000597          	auipc	a1,0x0
    80005324:	f2058593          	addi	a1,a1,-224 # 80005240 <_ZL11workerBodyAPv>
    80005328:	fd040513          	addi	a0,s0,-48
    8000532c:	ffffc097          	auipc	ra,0xffffc
    80005330:	054080e7          	jalr	84(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80005334:	00004517          	auipc	a0,0x4
    80005338:	09450513          	addi	a0,a0,148 # 800093c8 <_ZZ9kPrintIntmE6digits+0x358>
    8000533c:	00001097          	auipc	ra,0x1
    80005340:	958080e7          	jalr	-1704(ra) # 80005c94 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80005344:	00000613          	li	a2,0
    80005348:	00000597          	auipc	a1,0x0
    8000534c:	e2458593          	addi	a1,a1,-476 # 8000516c <_ZL11workerBodyBPv>
    80005350:	fd840513          	addi	a0,s0,-40
    80005354:	ffffc097          	auipc	ra,0xffffc
    80005358:	02c080e7          	jalr	44(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    8000535c:	00004517          	auipc	a0,0x4
    80005360:	08450513          	addi	a0,a0,132 # 800093e0 <_ZZ9kPrintIntmE6digits+0x370>
    80005364:	00001097          	auipc	ra,0x1
    80005368:	930080e7          	jalr	-1744(ra) # 80005c94 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    8000536c:	00000613          	li	a2,0
    80005370:	00000597          	auipc	a1,0x0
    80005374:	c7c58593          	addi	a1,a1,-900 # 80004fec <_ZL11workerBodyCPv>
    80005378:	fe040513          	addi	a0,s0,-32
    8000537c:	ffffc097          	auipc	ra,0xffffc
    80005380:	004080e7          	jalr	4(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80005384:	00004517          	auipc	a0,0x4
    80005388:	07450513          	addi	a0,a0,116 # 800093f8 <_ZZ9kPrintIntmE6digits+0x388>
    8000538c:	00001097          	auipc	ra,0x1
    80005390:	908080e7          	jalr	-1784(ra) # 80005c94 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80005394:	00000613          	li	a2,0
    80005398:	00000597          	auipc	a1,0x0
    8000539c:	b0c58593          	addi	a1,a1,-1268 # 80004ea4 <_ZL11workerBodyDPv>
    800053a0:	fe840513          	addi	a0,s0,-24
    800053a4:	ffffc097          	auipc	ra,0xffffc
    800053a8:	fdc080e7          	jalr	-36(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    800053ac:	00004517          	auipc	a0,0x4
    800053b0:	06450513          	addi	a0,a0,100 # 80009410 <_ZZ9kPrintIntmE6digits+0x3a0>
    800053b4:	00001097          	auipc	ra,0x1
    800053b8:	8e0080e7          	jalr	-1824(ra) # 80005c94 <_Z11printStringPKc>
    800053bc:	00c0006f          	j	800053c8 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    800053c0:	ffffc097          	auipc	ra,0xffffc
    800053c4:	068080e7          	jalr	104(ra) # 80001428 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800053c8:	00007797          	auipc	a5,0x7
    800053cc:	8737c783          	lbu	a5,-1933(a5) # 8000bc3b <_ZL9finishedA>
    800053d0:	fe0788e3          	beqz	a5,800053c0 <_Z18Threads_C_API_testv+0xb4>
    800053d4:	00007797          	auipc	a5,0x7
    800053d8:	8667c783          	lbu	a5,-1946(a5) # 8000bc3a <_ZL9finishedB>
    800053dc:	fe0782e3          	beqz	a5,800053c0 <_Z18Threads_C_API_testv+0xb4>
    800053e0:	00007797          	auipc	a5,0x7
    800053e4:	8597c783          	lbu	a5,-1959(a5) # 8000bc39 <_ZL9finishedC>
    800053e8:	fc078ce3          	beqz	a5,800053c0 <_Z18Threads_C_API_testv+0xb4>
    800053ec:	00007797          	auipc	a5,0x7
    800053f0:	84c7c783          	lbu	a5,-1972(a5) # 8000bc38 <_ZL9finishedD>
    800053f4:	fc0786e3          	beqz	a5,800053c0 <_Z18Threads_C_API_testv+0xb4>
    }

}
    800053f8:	02813083          	ld	ra,40(sp)
    800053fc:	02013403          	ld	s0,32(sp)
    80005400:	03010113          	addi	sp,sp,48
    80005404:	00008067          	ret

0000000080005408 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80005408:	fd010113          	addi	sp,sp,-48
    8000540c:	02113423          	sd	ra,40(sp)
    80005410:	02813023          	sd	s0,32(sp)
    80005414:	00913c23          	sd	s1,24(sp)
    80005418:	01213823          	sd	s2,16(sp)
    8000541c:	01313423          	sd	s3,8(sp)
    80005420:	03010413          	addi	s0,sp,48
    80005424:	00050993          	mv	s3,a0
    80005428:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    8000542c:	00000913          	li	s2,0
    80005430:	00c0006f          	j	8000543c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005434:	ffffd097          	auipc	ra,0xffffd
    80005438:	238080e7          	jalr	568(ra) # 8000266c <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    8000543c:	ffffc097          	auipc	ra,0xffffc
    80005440:	12c080e7          	jalr	300(ra) # 80001568 <_Z4getcv>
    80005444:	0005059b          	sext.w	a1,a0
    80005448:	01b00793          	li	a5,27
    8000544c:	02f58a63          	beq	a1,a5,80005480 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80005450:	0084b503          	ld	a0,8(s1)
    80005454:	00001097          	auipc	ra,0x1
    80005458:	c64080e7          	jalr	-924(ra) # 800060b8 <_ZN9BufferCPP3putEi>
        i++;
    8000545c:	0019071b          	addiw	a4,s2,1
    80005460:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005464:	0004a683          	lw	a3,0(s1)
    80005468:	0026979b          	slliw	a5,a3,0x2
    8000546c:	00d787bb          	addw	a5,a5,a3
    80005470:	0017979b          	slliw	a5,a5,0x1
    80005474:	02f767bb          	remw	a5,a4,a5
    80005478:	fc0792e3          	bnez	a5,8000543c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    8000547c:	fb9ff06f          	j	80005434 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80005480:	00100793          	li	a5,1
    80005484:	00006717          	auipc	a4,0x6
    80005488:	7af72e23          	sw	a5,1980(a4) # 8000bc40 <_ZL9threadEnd>
    td->buffer->put('!');
    8000548c:	0209b783          	ld	a5,32(s3)
    80005490:	02100593          	li	a1,33
    80005494:	0087b503          	ld	a0,8(a5)
    80005498:	00001097          	auipc	ra,0x1
    8000549c:	c20080e7          	jalr	-992(ra) # 800060b8 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    800054a0:	0104b503          	ld	a0,16(s1)
    800054a4:	ffffd097          	auipc	ra,0xffffd
    800054a8:	35c080e7          	jalr	860(ra) # 80002800 <_ZN9Semaphore6signalEv>
}
    800054ac:	02813083          	ld	ra,40(sp)
    800054b0:	02013403          	ld	s0,32(sp)
    800054b4:	01813483          	ld	s1,24(sp)
    800054b8:	01013903          	ld	s2,16(sp)
    800054bc:	00813983          	ld	s3,8(sp)
    800054c0:	03010113          	addi	sp,sp,48
    800054c4:	00008067          	ret

00000000800054c8 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    800054c8:	fe010113          	addi	sp,sp,-32
    800054cc:	00113c23          	sd	ra,24(sp)
    800054d0:	00813823          	sd	s0,16(sp)
    800054d4:	00913423          	sd	s1,8(sp)
    800054d8:	01213023          	sd	s2,0(sp)
    800054dc:	02010413          	addi	s0,sp,32
    800054e0:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800054e4:	00000913          	li	s2,0
    800054e8:	00c0006f          	j	800054f4 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    800054ec:	ffffd097          	auipc	ra,0xffffd
    800054f0:	180080e7          	jalr	384(ra) # 8000266c <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    800054f4:	00006797          	auipc	a5,0x6
    800054f8:	74c7a783          	lw	a5,1868(a5) # 8000bc40 <_ZL9threadEnd>
    800054fc:	02079e63          	bnez	a5,80005538 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80005500:	0004a583          	lw	a1,0(s1)
    80005504:	0305859b          	addiw	a1,a1,48
    80005508:	0084b503          	ld	a0,8(s1)
    8000550c:	00001097          	auipc	ra,0x1
    80005510:	bac080e7          	jalr	-1108(ra) # 800060b8 <_ZN9BufferCPP3putEi>
        i++;
    80005514:	0019071b          	addiw	a4,s2,1
    80005518:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    8000551c:	0004a683          	lw	a3,0(s1)
    80005520:	0026979b          	slliw	a5,a3,0x2
    80005524:	00d787bb          	addw	a5,a5,a3
    80005528:	0017979b          	slliw	a5,a5,0x1
    8000552c:	02f767bb          	remw	a5,a4,a5
    80005530:	fc0792e3          	bnez	a5,800054f4 <_ZN12ProducerSync8producerEPv+0x2c>
    80005534:	fb9ff06f          	j	800054ec <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80005538:	0104b503          	ld	a0,16(s1)
    8000553c:	ffffd097          	auipc	ra,0xffffd
    80005540:	2c4080e7          	jalr	708(ra) # 80002800 <_ZN9Semaphore6signalEv>
}
    80005544:	01813083          	ld	ra,24(sp)
    80005548:	01013403          	ld	s0,16(sp)
    8000554c:	00813483          	ld	s1,8(sp)
    80005550:	00013903          	ld	s2,0(sp)
    80005554:	02010113          	addi	sp,sp,32
    80005558:	00008067          	ret

000000008000555c <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    8000555c:	fd010113          	addi	sp,sp,-48
    80005560:	02113423          	sd	ra,40(sp)
    80005564:	02813023          	sd	s0,32(sp)
    80005568:	00913c23          	sd	s1,24(sp)
    8000556c:	01213823          	sd	s2,16(sp)
    80005570:	01313423          	sd	s3,8(sp)
    80005574:	01413023          	sd	s4,0(sp)
    80005578:	03010413          	addi	s0,sp,48
    8000557c:	00050993          	mv	s3,a0
    80005580:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005584:	00000a13          	li	s4,0
    80005588:	01c0006f          	j	800055a4 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    8000558c:	ffffd097          	auipc	ra,0xffffd
    80005590:	0e0080e7          	jalr	224(ra) # 8000266c <_ZN6Thread8dispatchEv>
    80005594:	0500006f          	j	800055e4 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80005598:	00a00513          	li	a0,10
    8000559c:	ffffc097          	auipc	ra,0xffffc
    800055a0:	ff4080e7          	jalr	-12(ra) # 80001590 <_Z4putcc>
    while (!threadEnd) {
    800055a4:	00006797          	auipc	a5,0x6
    800055a8:	69c7a783          	lw	a5,1692(a5) # 8000bc40 <_ZL9threadEnd>
    800055ac:	06079263          	bnez	a5,80005610 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    800055b0:	00893503          	ld	a0,8(s2)
    800055b4:	00001097          	auipc	ra,0x1
    800055b8:	b94080e7          	jalr	-1132(ra) # 80006148 <_ZN9BufferCPP3getEv>
        i++;
    800055bc:	001a049b          	addiw	s1,s4,1
    800055c0:	00048a1b          	sext.w	s4,s1
        putc(key);
    800055c4:	0ff57513          	andi	a0,a0,255
    800055c8:	ffffc097          	auipc	ra,0xffffc
    800055cc:	fc8080e7          	jalr	-56(ra) # 80001590 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    800055d0:	00092703          	lw	a4,0(s2)
    800055d4:	0027179b          	slliw	a5,a4,0x2
    800055d8:	00e787bb          	addw	a5,a5,a4
    800055dc:	02f4e7bb          	remw	a5,s1,a5
    800055e0:	fa0786e3          	beqz	a5,8000558c <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    800055e4:	05000793          	li	a5,80
    800055e8:	02f4e4bb          	remw	s1,s1,a5
    800055ec:	fa049ce3          	bnez	s1,800055a4 <_ZN12ConsumerSync8consumerEPv+0x48>
    800055f0:	fa9ff06f          	j	80005598 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    800055f4:	0209b783          	ld	a5,32(s3)
    800055f8:	0087b503          	ld	a0,8(a5)
    800055fc:	00001097          	auipc	ra,0x1
    80005600:	b4c080e7          	jalr	-1204(ra) # 80006148 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80005604:	0ff57513          	andi	a0,a0,255
    80005608:	ffffd097          	auipc	ra,0xffffd
    8000560c:	2c0080e7          	jalr	704(ra) # 800028c8 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80005610:	0209b783          	ld	a5,32(s3)
    80005614:	0087b503          	ld	a0,8(a5)
    80005618:	00001097          	auipc	ra,0x1
    8000561c:	bbc080e7          	jalr	-1092(ra) # 800061d4 <_ZN9BufferCPP6getCntEv>
    80005620:	fca04ae3          	bgtz	a0,800055f4 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80005624:	01093503          	ld	a0,16(s2)
    80005628:	ffffd097          	auipc	ra,0xffffd
    8000562c:	1d8080e7          	jalr	472(ra) # 80002800 <_ZN9Semaphore6signalEv>
}
    80005630:	02813083          	ld	ra,40(sp)
    80005634:	02013403          	ld	s0,32(sp)
    80005638:	01813483          	ld	s1,24(sp)
    8000563c:	01013903          	ld	s2,16(sp)
    80005640:	00813983          	ld	s3,8(sp)
    80005644:	00013a03          	ld	s4,0(sp)
    80005648:	03010113          	addi	sp,sp,48
    8000564c:	00008067          	ret

0000000080005650 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80005650:	f8010113          	addi	sp,sp,-128
    80005654:	06113c23          	sd	ra,120(sp)
    80005658:	06813823          	sd	s0,112(sp)
    8000565c:	06913423          	sd	s1,104(sp)
    80005660:	07213023          	sd	s2,96(sp)
    80005664:	05313c23          	sd	s3,88(sp)
    80005668:	05413823          	sd	s4,80(sp)
    8000566c:	05513423          	sd	s5,72(sp)
    80005670:	05613023          	sd	s6,64(sp)
    80005674:	03713c23          	sd	s7,56(sp)
    80005678:	03813823          	sd	s8,48(sp)
    8000567c:	03913423          	sd	s9,40(sp)
    80005680:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80005684:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80005688:	00004517          	auipc	a0,0x4
    8000568c:	bb050513          	addi	a0,a0,-1104 # 80009238 <_ZZ9kPrintIntmE6digits+0x1c8>
    80005690:	00000097          	auipc	ra,0x0
    80005694:	604080e7          	jalr	1540(ra) # 80005c94 <_Z11printStringPKc>
    getString(input, 30);
    80005698:	01e00593          	li	a1,30
    8000569c:	f8040493          	addi	s1,s0,-128
    800056a0:	00048513          	mv	a0,s1
    800056a4:	00000097          	auipc	ra,0x0
    800056a8:	678080e7          	jalr	1656(ra) # 80005d1c <_Z9getStringPci>
    threadNum = stringToInt(input);
    800056ac:	00048513          	mv	a0,s1
    800056b0:	00000097          	auipc	ra,0x0
    800056b4:	744080e7          	jalr	1860(ra) # 80005df4 <_Z11stringToIntPKc>
    800056b8:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    800056bc:	00004517          	auipc	a0,0x4
    800056c0:	b9c50513          	addi	a0,a0,-1124 # 80009258 <_ZZ9kPrintIntmE6digits+0x1e8>
    800056c4:	00000097          	auipc	ra,0x0
    800056c8:	5d0080e7          	jalr	1488(ra) # 80005c94 <_Z11printStringPKc>
    getString(input, 30);
    800056cc:	01e00593          	li	a1,30
    800056d0:	00048513          	mv	a0,s1
    800056d4:	00000097          	auipc	ra,0x0
    800056d8:	648080e7          	jalr	1608(ra) # 80005d1c <_Z9getStringPci>
    n = stringToInt(input);
    800056dc:	00048513          	mv	a0,s1
    800056e0:	00000097          	auipc	ra,0x0
    800056e4:	714080e7          	jalr	1812(ra) # 80005df4 <_Z11stringToIntPKc>
    800056e8:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    800056ec:	00004517          	auipc	a0,0x4
    800056f0:	b8c50513          	addi	a0,a0,-1140 # 80009278 <_ZZ9kPrintIntmE6digits+0x208>
    800056f4:	00000097          	auipc	ra,0x0
    800056f8:	5a0080e7          	jalr	1440(ra) # 80005c94 <_Z11printStringPKc>
    800056fc:	00000613          	li	a2,0
    80005700:	00a00593          	li	a1,10
    80005704:	00090513          	mv	a0,s2
    80005708:	00000097          	auipc	ra,0x0
    8000570c:	73c080e7          	jalr	1852(ra) # 80005e44 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005710:	00004517          	auipc	a0,0x4
    80005714:	b8050513          	addi	a0,a0,-1152 # 80009290 <_ZZ9kPrintIntmE6digits+0x220>
    80005718:	00000097          	auipc	ra,0x0
    8000571c:	57c080e7          	jalr	1404(ra) # 80005c94 <_Z11printStringPKc>
    80005720:	00000613          	li	a2,0
    80005724:	00a00593          	li	a1,10
    80005728:	00048513          	mv	a0,s1
    8000572c:	00000097          	auipc	ra,0x0
    80005730:	718080e7          	jalr	1816(ra) # 80005e44 <_Z8printIntiii>
    printString(".\n");
    80005734:	00004517          	auipc	a0,0x4
    80005738:	b7450513          	addi	a0,a0,-1164 # 800092a8 <_ZZ9kPrintIntmE6digits+0x238>
    8000573c:	00000097          	auipc	ra,0x0
    80005740:	558080e7          	jalr	1368(ra) # 80005c94 <_Z11printStringPKc>
    if(threadNum > n) {
    80005744:	0324c463          	blt	s1,s2,8000576c <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80005748:	03205c63          	blez	s2,80005780 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    8000574c:	03800513          	li	a0,56
    80005750:	ffffd097          	auipc	ra,0xffffd
    80005754:	d08080e7          	jalr	-760(ra) # 80002458 <_Znwm>
    80005758:	00050a93          	mv	s5,a0
    8000575c:	00048593          	mv	a1,s1
    80005760:	00001097          	auipc	ra,0x1
    80005764:	804080e7          	jalr	-2044(ra) # 80005f64 <_ZN9BufferCPPC1Ei>
    80005768:	0300006f          	j	80005798 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    8000576c:	00004517          	auipc	a0,0x4
    80005770:	b4450513          	addi	a0,a0,-1212 # 800092b0 <_ZZ9kPrintIntmE6digits+0x240>
    80005774:	00000097          	auipc	ra,0x0
    80005778:	520080e7          	jalr	1312(ra) # 80005c94 <_Z11printStringPKc>
        return;
    8000577c:	0140006f          	j	80005790 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80005780:	00004517          	auipc	a0,0x4
    80005784:	b7050513          	addi	a0,a0,-1168 # 800092f0 <_ZZ9kPrintIntmE6digits+0x280>
    80005788:	00000097          	auipc	ra,0x0
    8000578c:	50c080e7          	jalr	1292(ra) # 80005c94 <_Z11printStringPKc>
        return;
    80005790:	000b8113          	mv	sp,s7
    80005794:	2380006f          	j	800059cc <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80005798:	01000513          	li	a0,16
    8000579c:	ffffd097          	auipc	ra,0xffffd
    800057a0:	cbc080e7          	jalr	-836(ra) # 80002458 <_Znwm>
    800057a4:	00050493          	mv	s1,a0
    800057a8:	00000593          	li	a1,0
    800057ac:	ffffd097          	auipc	ra,0xffffd
    800057b0:	ff0080e7          	jalr	-16(ra) # 8000279c <_ZN9SemaphoreC1Ej>
    800057b4:	00006797          	auipc	a5,0x6
    800057b8:	4897ba23          	sd	s1,1172(a5) # 8000bc48 <_ZL10waitForAll>
    Thread* threads[threadNum];
    800057bc:	00391793          	slli	a5,s2,0x3
    800057c0:	00f78793          	addi	a5,a5,15
    800057c4:	ff07f793          	andi	a5,a5,-16
    800057c8:	40f10133          	sub	sp,sp,a5
    800057cc:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    800057d0:	0019071b          	addiw	a4,s2,1
    800057d4:	00171793          	slli	a5,a4,0x1
    800057d8:	00e787b3          	add	a5,a5,a4
    800057dc:	00379793          	slli	a5,a5,0x3
    800057e0:	00f78793          	addi	a5,a5,15
    800057e4:	ff07f793          	andi	a5,a5,-16
    800057e8:	40f10133          	sub	sp,sp,a5
    800057ec:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    800057f0:	00191c13          	slli	s8,s2,0x1
    800057f4:	012c07b3          	add	a5,s8,s2
    800057f8:	00379793          	slli	a5,a5,0x3
    800057fc:	00fa07b3          	add	a5,s4,a5
    80005800:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80005804:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80005808:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    8000580c:	02800513          	li	a0,40
    80005810:	ffffd097          	auipc	ra,0xffffd
    80005814:	c48080e7          	jalr	-952(ra) # 80002458 <_Znwm>
    80005818:	00050b13          	mv	s6,a0
    8000581c:	012c0c33          	add	s8,s8,s2
    80005820:	003c1c13          	slli	s8,s8,0x3
    80005824:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80005828:	ffffd097          	auipc	ra,0xffffd
    8000582c:	ef8080e7          	jalr	-264(ra) # 80002720 <_ZN6ThreadC1Ev>
    80005830:	00006797          	auipc	a5,0x6
    80005834:	1e878793          	addi	a5,a5,488 # 8000ba18 <_ZTV12ConsumerSync+0x10>
    80005838:	00fb3023          	sd	a5,0(s6)
    8000583c:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80005840:	000b0513          	mv	a0,s6
    80005844:	ffffd097          	auipc	ra,0xffffd
    80005848:	dc4080e7          	jalr	-572(ra) # 80002608 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    8000584c:	00000493          	li	s1,0
    80005850:	0380006f          	j	80005888 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005854:	00006797          	auipc	a5,0x6
    80005858:	19c78793          	addi	a5,a5,412 # 8000b9f0 <_ZTV12ProducerSync+0x10>
    8000585c:	00fcb023          	sd	a5,0(s9)
    80005860:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80005864:	00349793          	slli	a5,s1,0x3
    80005868:	00f987b3          	add	a5,s3,a5
    8000586c:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80005870:	00349793          	slli	a5,s1,0x3
    80005874:	00f987b3          	add	a5,s3,a5
    80005878:	0007b503          	ld	a0,0(a5)
    8000587c:	ffffd097          	auipc	ra,0xffffd
    80005880:	d8c080e7          	jalr	-628(ra) # 80002608 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005884:	0014849b          	addiw	s1,s1,1
    80005888:	0b24d063          	bge	s1,s2,80005928 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    8000588c:	00149793          	slli	a5,s1,0x1
    80005890:	009787b3          	add	a5,a5,s1
    80005894:	00379793          	slli	a5,a5,0x3
    80005898:	00fa07b3          	add	a5,s4,a5
    8000589c:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800058a0:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    800058a4:	00006717          	auipc	a4,0x6
    800058a8:	3a473703          	ld	a4,932(a4) # 8000bc48 <_ZL10waitForAll>
    800058ac:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    800058b0:	02905863          	blez	s1,800058e0 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    800058b4:	02800513          	li	a0,40
    800058b8:	ffffd097          	auipc	ra,0xffffd
    800058bc:	ba0080e7          	jalr	-1120(ra) # 80002458 <_Znwm>
    800058c0:	00050c93          	mv	s9,a0
    800058c4:	00149c13          	slli	s8,s1,0x1
    800058c8:	009c0c33          	add	s8,s8,s1
    800058cc:	003c1c13          	slli	s8,s8,0x3
    800058d0:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    800058d4:	ffffd097          	auipc	ra,0xffffd
    800058d8:	e4c080e7          	jalr	-436(ra) # 80002720 <_ZN6ThreadC1Ev>
    800058dc:	f79ff06f          	j	80005854 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    800058e0:	02800513          	li	a0,40
    800058e4:	ffffd097          	auipc	ra,0xffffd
    800058e8:	b74080e7          	jalr	-1164(ra) # 80002458 <_Znwm>
    800058ec:	00050c93          	mv	s9,a0
    800058f0:	00149c13          	slli	s8,s1,0x1
    800058f4:	009c0c33          	add	s8,s8,s1
    800058f8:	003c1c13          	slli	s8,s8,0x3
    800058fc:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80005900:	ffffd097          	auipc	ra,0xffffd
    80005904:	e20080e7          	jalr	-480(ra) # 80002720 <_ZN6ThreadC1Ev>
    80005908:	00006797          	auipc	a5,0x6
    8000590c:	0c078793          	addi	a5,a5,192 # 8000b9c8 <_ZTV16ProducerKeyboard+0x10>
    80005910:	00fcb023          	sd	a5,0(s9)
    80005914:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80005918:	00349793          	slli	a5,s1,0x3
    8000591c:	00f987b3          	add	a5,s3,a5
    80005920:	0197b023          	sd	s9,0(a5)
    80005924:	f4dff06f          	j	80005870 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80005928:	ffffd097          	auipc	ra,0xffffd
    8000592c:	d44080e7          	jalr	-700(ra) # 8000266c <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80005930:	00000493          	li	s1,0
    80005934:	00994e63          	blt	s2,s1,80005950 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80005938:	00006517          	auipc	a0,0x6
    8000593c:	31053503          	ld	a0,784(a0) # 8000bc48 <_ZL10waitForAll>
    80005940:	ffffd097          	auipc	ra,0xffffd
    80005944:	e94080e7          	jalr	-364(ra) # 800027d4 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80005948:	0014849b          	addiw	s1,s1,1
    8000594c:	fe9ff06f          	j	80005934 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80005950:	00000493          	li	s1,0
    80005954:	0080006f          	j	8000595c <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80005958:	0014849b          	addiw	s1,s1,1
    8000595c:	0324d263          	bge	s1,s2,80005980 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80005960:	00349793          	slli	a5,s1,0x3
    80005964:	00f987b3          	add	a5,s3,a5
    80005968:	0007b503          	ld	a0,0(a5)
    8000596c:	fe0506e3          	beqz	a0,80005958 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80005970:	00053783          	ld	a5,0(a0)
    80005974:	0087b783          	ld	a5,8(a5)
    80005978:	000780e7          	jalr	a5
    8000597c:	fddff06f          	j	80005958 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80005980:	000b0a63          	beqz	s6,80005994 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80005984:	000b3783          	ld	a5,0(s6)
    80005988:	0087b783          	ld	a5,8(a5)
    8000598c:	000b0513          	mv	a0,s6
    80005990:	000780e7          	jalr	a5
    delete waitForAll;
    80005994:	00006517          	auipc	a0,0x6
    80005998:	2b453503          	ld	a0,692(a0) # 8000bc48 <_ZL10waitForAll>
    8000599c:	00050863          	beqz	a0,800059ac <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    800059a0:	00053783          	ld	a5,0(a0)
    800059a4:	0087b783          	ld	a5,8(a5)
    800059a8:	000780e7          	jalr	a5
    delete buffer;
    800059ac:	000a8e63          	beqz	s5,800059c8 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    800059b0:	000a8513          	mv	a0,s5
    800059b4:	00001097          	auipc	ra,0x1
    800059b8:	8a8080e7          	jalr	-1880(ra) # 8000625c <_ZN9BufferCPPD1Ev>
    800059bc:	000a8513          	mv	a0,s5
    800059c0:	ffffd097          	auipc	ra,0xffffd
    800059c4:	ae8080e7          	jalr	-1304(ra) # 800024a8 <_ZdlPv>
    800059c8:	000b8113          	mv	sp,s7

}
    800059cc:	f8040113          	addi	sp,s0,-128
    800059d0:	07813083          	ld	ra,120(sp)
    800059d4:	07013403          	ld	s0,112(sp)
    800059d8:	06813483          	ld	s1,104(sp)
    800059dc:	06013903          	ld	s2,96(sp)
    800059e0:	05813983          	ld	s3,88(sp)
    800059e4:	05013a03          	ld	s4,80(sp)
    800059e8:	04813a83          	ld	s5,72(sp)
    800059ec:	04013b03          	ld	s6,64(sp)
    800059f0:	03813b83          	ld	s7,56(sp)
    800059f4:	03013c03          	ld	s8,48(sp)
    800059f8:	02813c83          	ld	s9,40(sp)
    800059fc:	08010113          	addi	sp,sp,128
    80005a00:	00008067          	ret
    80005a04:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80005a08:	000a8513          	mv	a0,s5
    80005a0c:	ffffd097          	auipc	ra,0xffffd
    80005a10:	a9c080e7          	jalr	-1380(ra) # 800024a8 <_ZdlPv>
    80005a14:	00048513          	mv	a0,s1
    80005a18:	00007097          	auipc	ra,0x7
    80005a1c:	310080e7          	jalr	784(ra) # 8000cd28 <_Unwind_Resume>
    80005a20:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80005a24:	00048513          	mv	a0,s1
    80005a28:	ffffd097          	auipc	ra,0xffffd
    80005a2c:	a80080e7          	jalr	-1408(ra) # 800024a8 <_ZdlPv>
    80005a30:	00090513          	mv	a0,s2
    80005a34:	00007097          	auipc	ra,0x7
    80005a38:	2f4080e7          	jalr	756(ra) # 8000cd28 <_Unwind_Resume>
    80005a3c:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80005a40:	000b0513          	mv	a0,s6
    80005a44:	ffffd097          	auipc	ra,0xffffd
    80005a48:	a64080e7          	jalr	-1436(ra) # 800024a8 <_ZdlPv>
    80005a4c:	00048513          	mv	a0,s1
    80005a50:	00007097          	auipc	ra,0x7
    80005a54:	2d8080e7          	jalr	728(ra) # 8000cd28 <_Unwind_Resume>
    80005a58:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80005a5c:	000c8513          	mv	a0,s9
    80005a60:	ffffd097          	auipc	ra,0xffffd
    80005a64:	a48080e7          	jalr	-1464(ra) # 800024a8 <_ZdlPv>
    80005a68:	00048513          	mv	a0,s1
    80005a6c:	00007097          	auipc	ra,0x7
    80005a70:	2bc080e7          	jalr	700(ra) # 8000cd28 <_Unwind_Resume>
    80005a74:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80005a78:	000c8513          	mv	a0,s9
    80005a7c:	ffffd097          	auipc	ra,0xffffd
    80005a80:	a2c080e7          	jalr	-1492(ra) # 800024a8 <_ZdlPv>
    80005a84:	00048513          	mv	a0,s1
    80005a88:	00007097          	auipc	ra,0x7
    80005a8c:	2a0080e7          	jalr	672(ra) # 8000cd28 <_Unwind_Resume>

0000000080005a90 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80005a90:	ff010113          	addi	sp,sp,-16
    80005a94:	00113423          	sd	ra,8(sp)
    80005a98:	00813023          	sd	s0,0(sp)
    80005a9c:	01010413          	addi	s0,sp,16
    80005aa0:	00006797          	auipc	a5,0x6
    80005aa4:	f7878793          	addi	a5,a5,-136 # 8000ba18 <_ZTV12ConsumerSync+0x10>
    80005aa8:	00f53023          	sd	a5,0(a0)
    80005aac:	ffffd097          	auipc	ra,0xffffd
    80005ab0:	8bc080e7          	jalr	-1860(ra) # 80002368 <_ZN6ThreadD1Ev>
    80005ab4:	00813083          	ld	ra,8(sp)
    80005ab8:	00013403          	ld	s0,0(sp)
    80005abc:	01010113          	addi	sp,sp,16
    80005ac0:	00008067          	ret

0000000080005ac4 <_ZN12ConsumerSyncD0Ev>:
    80005ac4:	fe010113          	addi	sp,sp,-32
    80005ac8:	00113c23          	sd	ra,24(sp)
    80005acc:	00813823          	sd	s0,16(sp)
    80005ad0:	00913423          	sd	s1,8(sp)
    80005ad4:	02010413          	addi	s0,sp,32
    80005ad8:	00050493          	mv	s1,a0
    80005adc:	00006797          	auipc	a5,0x6
    80005ae0:	f3c78793          	addi	a5,a5,-196 # 8000ba18 <_ZTV12ConsumerSync+0x10>
    80005ae4:	00f53023          	sd	a5,0(a0)
    80005ae8:	ffffd097          	auipc	ra,0xffffd
    80005aec:	880080e7          	jalr	-1920(ra) # 80002368 <_ZN6ThreadD1Ev>
    80005af0:	00048513          	mv	a0,s1
    80005af4:	ffffd097          	auipc	ra,0xffffd
    80005af8:	9b4080e7          	jalr	-1612(ra) # 800024a8 <_ZdlPv>
    80005afc:	01813083          	ld	ra,24(sp)
    80005b00:	01013403          	ld	s0,16(sp)
    80005b04:	00813483          	ld	s1,8(sp)
    80005b08:	02010113          	addi	sp,sp,32
    80005b0c:	00008067          	ret

0000000080005b10 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80005b10:	ff010113          	addi	sp,sp,-16
    80005b14:	00113423          	sd	ra,8(sp)
    80005b18:	00813023          	sd	s0,0(sp)
    80005b1c:	01010413          	addi	s0,sp,16
    80005b20:	00006797          	auipc	a5,0x6
    80005b24:	ed078793          	addi	a5,a5,-304 # 8000b9f0 <_ZTV12ProducerSync+0x10>
    80005b28:	00f53023          	sd	a5,0(a0)
    80005b2c:	ffffd097          	auipc	ra,0xffffd
    80005b30:	83c080e7          	jalr	-1988(ra) # 80002368 <_ZN6ThreadD1Ev>
    80005b34:	00813083          	ld	ra,8(sp)
    80005b38:	00013403          	ld	s0,0(sp)
    80005b3c:	01010113          	addi	sp,sp,16
    80005b40:	00008067          	ret

0000000080005b44 <_ZN12ProducerSyncD0Ev>:
    80005b44:	fe010113          	addi	sp,sp,-32
    80005b48:	00113c23          	sd	ra,24(sp)
    80005b4c:	00813823          	sd	s0,16(sp)
    80005b50:	00913423          	sd	s1,8(sp)
    80005b54:	02010413          	addi	s0,sp,32
    80005b58:	00050493          	mv	s1,a0
    80005b5c:	00006797          	auipc	a5,0x6
    80005b60:	e9478793          	addi	a5,a5,-364 # 8000b9f0 <_ZTV12ProducerSync+0x10>
    80005b64:	00f53023          	sd	a5,0(a0)
    80005b68:	ffffd097          	auipc	ra,0xffffd
    80005b6c:	800080e7          	jalr	-2048(ra) # 80002368 <_ZN6ThreadD1Ev>
    80005b70:	00048513          	mv	a0,s1
    80005b74:	ffffd097          	auipc	ra,0xffffd
    80005b78:	934080e7          	jalr	-1740(ra) # 800024a8 <_ZdlPv>
    80005b7c:	01813083          	ld	ra,24(sp)
    80005b80:	01013403          	ld	s0,16(sp)
    80005b84:	00813483          	ld	s1,8(sp)
    80005b88:	02010113          	addi	sp,sp,32
    80005b8c:	00008067          	ret

0000000080005b90 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80005b90:	ff010113          	addi	sp,sp,-16
    80005b94:	00113423          	sd	ra,8(sp)
    80005b98:	00813023          	sd	s0,0(sp)
    80005b9c:	01010413          	addi	s0,sp,16
    80005ba0:	00006797          	auipc	a5,0x6
    80005ba4:	e2878793          	addi	a5,a5,-472 # 8000b9c8 <_ZTV16ProducerKeyboard+0x10>
    80005ba8:	00f53023          	sd	a5,0(a0)
    80005bac:	ffffc097          	auipc	ra,0xffffc
    80005bb0:	7bc080e7          	jalr	1980(ra) # 80002368 <_ZN6ThreadD1Ev>
    80005bb4:	00813083          	ld	ra,8(sp)
    80005bb8:	00013403          	ld	s0,0(sp)
    80005bbc:	01010113          	addi	sp,sp,16
    80005bc0:	00008067          	ret

0000000080005bc4 <_ZN16ProducerKeyboardD0Ev>:
    80005bc4:	fe010113          	addi	sp,sp,-32
    80005bc8:	00113c23          	sd	ra,24(sp)
    80005bcc:	00813823          	sd	s0,16(sp)
    80005bd0:	00913423          	sd	s1,8(sp)
    80005bd4:	02010413          	addi	s0,sp,32
    80005bd8:	00050493          	mv	s1,a0
    80005bdc:	00006797          	auipc	a5,0x6
    80005be0:	dec78793          	addi	a5,a5,-532 # 8000b9c8 <_ZTV16ProducerKeyboard+0x10>
    80005be4:	00f53023          	sd	a5,0(a0)
    80005be8:	ffffc097          	auipc	ra,0xffffc
    80005bec:	780080e7          	jalr	1920(ra) # 80002368 <_ZN6ThreadD1Ev>
    80005bf0:	00048513          	mv	a0,s1
    80005bf4:	ffffd097          	auipc	ra,0xffffd
    80005bf8:	8b4080e7          	jalr	-1868(ra) # 800024a8 <_ZdlPv>
    80005bfc:	01813083          	ld	ra,24(sp)
    80005c00:	01013403          	ld	s0,16(sp)
    80005c04:	00813483          	ld	s1,8(sp)
    80005c08:	02010113          	addi	sp,sp,32
    80005c0c:	00008067          	ret

0000000080005c10 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80005c10:	ff010113          	addi	sp,sp,-16
    80005c14:	00113423          	sd	ra,8(sp)
    80005c18:	00813023          	sd	s0,0(sp)
    80005c1c:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80005c20:	02053583          	ld	a1,32(a0)
    80005c24:	fffff097          	auipc	ra,0xfffff
    80005c28:	7e4080e7          	jalr	2020(ra) # 80005408 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80005c2c:	00813083          	ld	ra,8(sp)
    80005c30:	00013403          	ld	s0,0(sp)
    80005c34:	01010113          	addi	sp,sp,16
    80005c38:	00008067          	ret

0000000080005c3c <_ZN12ProducerSync3runEv>:
    void run() override {
    80005c3c:	ff010113          	addi	sp,sp,-16
    80005c40:	00113423          	sd	ra,8(sp)
    80005c44:	00813023          	sd	s0,0(sp)
    80005c48:	01010413          	addi	s0,sp,16
        producer(td);
    80005c4c:	02053583          	ld	a1,32(a0)
    80005c50:	00000097          	auipc	ra,0x0
    80005c54:	878080e7          	jalr	-1928(ra) # 800054c8 <_ZN12ProducerSync8producerEPv>
    }
    80005c58:	00813083          	ld	ra,8(sp)
    80005c5c:	00013403          	ld	s0,0(sp)
    80005c60:	01010113          	addi	sp,sp,16
    80005c64:	00008067          	ret

0000000080005c68 <_ZN12ConsumerSync3runEv>:
    void run() override {
    80005c68:	ff010113          	addi	sp,sp,-16
    80005c6c:	00113423          	sd	ra,8(sp)
    80005c70:	00813023          	sd	s0,0(sp)
    80005c74:	01010413          	addi	s0,sp,16
        consumer(td);
    80005c78:	02053583          	ld	a1,32(a0)
    80005c7c:	00000097          	auipc	ra,0x0
    80005c80:	8e0080e7          	jalr	-1824(ra) # 8000555c <_ZN12ConsumerSync8consumerEPv>
    }
    80005c84:	00813083          	ld	ra,8(sp)
    80005c88:	00013403          	ld	s0,0(sp)
    80005c8c:	01010113          	addi	sp,sp,16
    80005c90:	00008067          	ret

0000000080005c94 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80005c94:	fe010113          	addi	sp,sp,-32
    80005c98:	00113c23          	sd	ra,24(sp)
    80005c9c:	00813823          	sd	s0,16(sp)
    80005ca0:	00913423          	sd	s1,8(sp)
    80005ca4:	02010413          	addi	s0,sp,32
    80005ca8:	00050493          	mv	s1,a0
    LOCK();
    80005cac:	00100613          	li	a2,1
    80005cb0:	00000593          	li	a1,0
    80005cb4:	00006517          	auipc	a0,0x6
    80005cb8:	f9c50513          	addi	a0,a0,-100 # 8000bc50 <lockPrint>
    80005cbc:	ffffb097          	auipc	ra,0xffffb
    80005cc0:	568080e7          	jalr	1384(ra) # 80001224 <copy_and_swap>
    80005cc4:	00050863          	beqz	a0,80005cd4 <_Z11printStringPKc+0x40>
    80005cc8:	ffffb097          	auipc	ra,0xffffb
    80005ccc:	760080e7          	jalr	1888(ra) # 80001428 <_Z15thread_dispatchv>
    80005cd0:	fddff06f          	j	80005cac <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80005cd4:	0004c503          	lbu	a0,0(s1)
    80005cd8:	00050a63          	beqz	a0,80005cec <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80005cdc:	ffffc097          	auipc	ra,0xffffc
    80005ce0:	8b4080e7          	jalr	-1868(ra) # 80001590 <_Z4putcc>
        string++;
    80005ce4:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80005ce8:	fedff06f          	j	80005cd4 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80005cec:	00000613          	li	a2,0
    80005cf0:	00100593          	li	a1,1
    80005cf4:	00006517          	auipc	a0,0x6
    80005cf8:	f5c50513          	addi	a0,a0,-164 # 8000bc50 <lockPrint>
    80005cfc:	ffffb097          	auipc	ra,0xffffb
    80005d00:	528080e7          	jalr	1320(ra) # 80001224 <copy_and_swap>
    80005d04:	fe0514e3          	bnez	a0,80005cec <_Z11printStringPKc+0x58>
}
    80005d08:	01813083          	ld	ra,24(sp)
    80005d0c:	01013403          	ld	s0,16(sp)
    80005d10:	00813483          	ld	s1,8(sp)
    80005d14:	02010113          	addi	sp,sp,32
    80005d18:	00008067          	ret

0000000080005d1c <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80005d1c:	fd010113          	addi	sp,sp,-48
    80005d20:	02113423          	sd	ra,40(sp)
    80005d24:	02813023          	sd	s0,32(sp)
    80005d28:	00913c23          	sd	s1,24(sp)
    80005d2c:	01213823          	sd	s2,16(sp)
    80005d30:	01313423          	sd	s3,8(sp)
    80005d34:	01413023          	sd	s4,0(sp)
    80005d38:	03010413          	addi	s0,sp,48
    80005d3c:	00050993          	mv	s3,a0
    80005d40:	00058a13          	mv	s4,a1
    LOCK();
    80005d44:	00100613          	li	a2,1
    80005d48:	00000593          	li	a1,0
    80005d4c:	00006517          	auipc	a0,0x6
    80005d50:	f0450513          	addi	a0,a0,-252 # 8000bc50 <lockPrint>
    80005d54:	ffffb097          	auipc	ra,0xffffb
    80005d58:	4d0080e7          	jalr	1232(ra) # 80001224 <copy_and_swap>
    80005d5c:	00050863          	beqz	a0,80005d6c <_Z9getStringPci+0x50>
    80005d60:	ffffb097          	auipc	ra,0xffffb
    80005d64:	6c8080e7          	jalr	1736(ra) # 80001428 <_Z15thread_dispatchv>
    80005d68:	fddff06f          	j	80005d44 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80005d6c:	00000913          	li	s2,0
    80005d70:	00090493          	mv	s1,s2
    80005d74:	0019091b          	addiw	s2,s2,1
    80005d78:	03495a63          	bge	s2,s4,80005dac <_Z9getStringPci+0x90>
        cc = getc();
    80005d7c:	ffffb097          	auipc	ra,0xffffb
    80005d80:	7ec080e7          	jalr	2028(ra) # 80001568 <_Z4getcv>
        if(cc < 1)
    80005d84:	02050463          	beqz	a0,80005dac <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80005d88:	009984b3          	add	s1,s3,s1
    80005d8c:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80005d90:	00a00793          	li	a5,10
    80005d94:	00f50a63          	beq	a0,a5,80005da8 <_Z9getStringPci+0x8c>
    80005d98:	00d00793          	li	a5,13
    80005d9c:	fcf51ae3          	bne	a0,a5,80005d70 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80005da0:	00090493          	mv	s1,s2
    80005da4:	0080006f          	j	80005dac <_Z9getStringPci+0x90>
    80005da8:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80005dac:	009984b3          	add	s1,s3,s1
    80005db0:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80005db4:	00000613          	li	a2,0
    80005db8:	00100593          	li	a1,1
    80005dbc:	00006517          	auipc	a0,0x6
    80005dc0:	e9450513          	addi	a0,a0,-364 # 8000bc50 <lockPrint>
    80005dc4:	ffffb097          	auipc	ra,0xffffb
    80005dc8:	460080e7          	jalr	1120(ra) # 80001224 <copy_and_swap>
    80005dcc:	fe0514e3          	bnez	a0,80005db4 <_Z9getStringPci+0x98>
    return buf;
}
    80005dd0:	00098513          	mv	a0,s3
    80005dd4:	02813083          	ld	ra,40(sp)
    80005dd8:	02013403          	ld	s0,32(sp)
    80005ddc:	01813483          	ld	s1,24(sp)
    80005de0:	01013903          	ld	s2,16(sp)
    80005de4:	00813983          	ld	s3,8(sp)
    80005de8:	00013a03          	ld	s4,0(sp)
    80005dec:	03010113          	addi	sp,sp,48
    80005df0:	00008067          	ret

0000000080005df4 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80005df4:	ff010113          	addi	sp,sp,-16
    80005df8:	00813423          	sd	s0,8(sp)
    80005dfc:	01010413          	addi	s0,sp,16
    80005e00:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80005e04:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80005e08:	0006c603          	lbu	a2,0(a3)
    80005e0c:	fd06071b          	addiw	a4,a2,-48
    80005e10:	0ff77713          	andi	a4,a4,255
    80005e14:	00900793          	li	a5,9
    80005e18:	02e7e063          	bltu	a5,a4,80005e38 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80005e1c:	0025179b          	slliw	a5,a0,0x2
    80005e20:	00a787bb          	addw	a5,a5,a0
    80005e24:	0017979b          	slliw	a5,a5,0x1
    80005e28:	00168693          	addi	a3,a3,1
    80005e2c:	00c787bb          	addw	a5,a5,a2
    80005e30:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80005e34:	fd5ff06f          	j	80005e08 <_Z11stringToIntPKc+0x14>
    return n;
}
    80005e38:	00813403          	ld	s0,8(sp)
    80005e3c:	01010113          	addi	sp,sp,16
    80005e40:	00008067          	ret

0000000080005e44 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80005e44:	fc010113          	addi	sp,sp,-64
    80005e48:	02113c23          	sd	ra,56(sp)
    80005e4c:	02813823          	sd	s0,48(sp)
    80005e50:	02913423          	sd	s1,40(sp)
    80005e54:	03213023          	sd	s2,32(sp)
    80005e58:	01313c23          	sd	s3,24(sp)
    80005e5c:	04010413          	addi	s0,sp,64
    80005e60:	00050493          	mv	s1,a0
    80005e64:	00058913          	mv	s2,a1
    80005e68:	00060993          	mv	s3,a2
    LOCK();
    80005e6c:	00100613          	li	a2,1
    80005e70:	00000593          	li	a1,0
    80005e74:	00006517          	auipc	a0,0x6
    80005e78:	ddc50513          	addi	a0,a0,-548 # 8000bc50 <lockPrint>
    80005e7c:	ffffb097          	auipc	ra,0xffffb
    80005e80:	3a8080e7          	jalr	936(ra) # 80001224 <copy_and_swap>
    80005e84:	00050863          	beqz	a0,80005e94 <_Z8printIntiii+0x50>
    80005e88:	ffffb097          	auipc	ra,0xffffb
    80005e8c:	5a0080e7          	jalr	1440(ra) # 80001428 <_Z15thread_dispatchv>
    80005e90:	fddff06f          	j	80005e6c <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80005e94:	00098463          	beqz	s3,80005e9c <_Z8printIntiii+0x58>
    80005e98:	0804c463          	bltz	s1,80005f20 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80005e9c:	0004851b          	sext.w	a0,s1
    neg = 0;
    80005ea0:	00000593          	li	a1,0
    }

    i = 0;
    80005ea4:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80005ea8:	0009079b          	sext.w	a5,s2
    80005eac:	0325773b          	remuw	a4,a0,s2
    80005eb0:	00048613          	mv	a2,s1
    80005eb4:	0014849b          	addiw	s1,s1,1
    80005eb8:	02071693          	slli	a3,a4,0x20
    80005ebc:	0206d693          	srli	a3,a3,0x20
    80005ec0:	00006717          	auipc	a4,0x6
    80005ec4:	b7070713          	addi	a4,a4,-1168 # 8000ba30 <digits>
    80005ec8:	00d70733          	add	a4,a4,a3
    80005ecc:	00074683          	lbu	a3,0(a4)
    80005ed0:	fd040713          	addi	a4,s0,-48
    80005ed4:	00c70733          	add	a4,a4,a2
    80005ed8:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80005edc:	0005071b          	sext.w	a4,a0
    80005ee0:	0325553b          	divuw	a0,a0,s2
    80005ee4:	fcf772e3          	bgeu	a4,a5,80005ea8 <_Z8printIntiii+0x64>
    if(neg)
    80005ee8:	00058c63          	beqz	a1,80005f00 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80005eec:	fd040793          	addi	a5,s0,-48
    80005ef0:	009784b3          	add	s1,a5,s1
    80005ef4:	02d00793          	li	a5,45
    80005ef8:	fef48823          	sb	a5,-16(s1)
    80005efc:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80005f00:	fff4849b          	addiw	s1,s1,-1
    80005f04:	0204c463          	bltz	s1,80005f2c <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80005f08:	fd040793          	addi	a5,s0,-48
    80005f0c:	009787b3          	add	a5,a5,s1
    80005f10:	ff07c503          	lbu	a0,-16(a5)
    80005f14:	ffffb097          	auipc	ra,0xffffb
    80005f18:	67c080e7          	jalr	1660(ra) # 80001590 <_Z4putcc>
    80005f1c:	fe5ff06f          	j	80005f00 <_Z8printIntiii+0xbc>
        x = -xx;
    80005f20:	4090053b          	negw	a0,s1
        neg = 1;
    80005f24:	00100593          	li	a1,1
        x = -xx;
    80005f28:	f7dff06f          	j	80005ea4 <_Z8printIntiii+0x60>

    UNLOCK();
    80005f2c:	00000613          	li	a2,0
    80005f30:	00100593          	li	a1,1
    80005f34:	00006517          	auipc	a0,0x6
    80005f38:	d1c50513          	addi	a0,a0,-740 # 8000bc50 <lockPrint>
    80005f3c:	ffffb097          	auipc	ra,0xffffb
    80005f40:	2e8080e7          	jalr	744(ra) # 80001224 <copy_and_swap>
    80005f44:	fe0514e3          	bnez	a0,80005f2c <_Z8printIntiii+0xe8>
    80005f48:	03813083          	ld	ra,56(sp)
    80005f4c:	03013403          	ld	s0,48(sp)
    80005f50:	02813483          	ld	s1,40(sp)
    80005f54:	02013903          	ld	s2,32(sp)
    80005f58:	01813983          	ld	s3,24(sp)
    80005f5c:	04010113          	addi	sp,sp,64
    80005f60:	00008067          	ret

0000000080005f64 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80005f64:	fd010113          	addi	sp,sp,-48
    80005f68:	02113423          	sd	ra,40(sp)
    80005f6c:	02813023          	sd	s0,32(sp)
    80005f70:	00913c23          	sd	s1,24(sp)
    80005f74:	01213823          	sd	s2,16(sp)
    80005f78:	01313423          	sd	s3,8(sp)
    80005f7c:	03010413          	addi	s0,sp,48
    80005f80:	00050493          	mv	s1,a0
    80005f84:	00058913          	mv	s2,a1
    80005f88:	0015879b          	addiw	a5,a1,1
    80005f8c:	0007851b          	sext.w	a0,a5
    80005f90:	00f4a023          	sw	a5,0(s1)
    80005f94:	0004a823          	sw	zero,16(s1)
    80005f98:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80005f9c:	00251513          	slli	a0,a0,0x2
    80005fa0:	ffffb097          	auipc	ra,0xffffb
    80005fa4:	370080e7          	jalr	880(ra) # 80001310 <_Z9mem_allocm>
    80005fa8:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80005fac:	01000513          	li	a0,16
    80005fb0:	ffffc097          	auipc	ra,0xffffc
    80005fb4:	4a8080e7          	jalr	1192(ra) # 80002458 <_Znwm>
    80005fb8:	00050993          	mv	s3,a0
    80005fbc:	00000593          	li	a1,0
    80005fc0:	ffffc097          	auipc	ra,0xffffc
    80005fc4:	7dc080e7          	jalr	2012(ra) # 8000279c <_ZN9SemaphoreC1Ej>
    80005fc8:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80005fcc:	01000513          	li	a0,16
    80005fd0:	ffffc097          	auipc	ra,0xffffc
    80005fd4:	488080e7          	jalr	1160(ra) # 80002458 <_Znwm>
    80005fd8:	00050993          	mv	s3,a0
    80005fdc:	00090593          	mv	a1,s2
    80005fe0:	ffffc097          	auipc	ra,0xffffc
    80005fe4:	7bc080e7          	jalr	1980(ra) # 8000279c <_ZN9SemaphoreC1Ej>
    80005fe8:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80005fec:	01000513          	li	a0,16
    80005ff0:	ffffc097          	auipc	ra,0xffffc
    80005ff4:	468080e7          	jalr	1128(ra) # 80002458 <_Znwm>
    80005ff8:	00050913          	mv	s2,a0
    80005ffc:	00100593          	li	a1,1
    80006000:	ffffc097          	auipc	ra,0xffffc
    80006004:	79c080e7          	jalr	1948(ra) # 8000279c <_ZN9SemaphoreC1Ej>
    80006008:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    8000600c:	01000513          	li	a0,16
    80006010:	ffffc097          	auipc	ra,0xffffc
    80006014:	448080e7          	jalr	1096(ra) # 80002458 <_Znwm>
    80006018:	00050913          	mv	s2,a0
    8000601c:	00100593          	li	a1,1
    80006020:	ffffc097          	auipc	ra,0xffffc
    80006024:	77c080e7          	jalr	1916(ra) # 8000279c <_ZN9SemaphoreC1Ej>
    80006028:	0324b823          	sd	s2,48(s1)
}
    8000602c:	02813083          	ld	ra,40(sp)
    80006030:	02013403          	ld	s0,32(sp)
    80006034:	01813483          	ld	s1,24(sp)
    80006038:	01013903          	ld	s2,16(sp)
    8000603c:	00813983          	ld	s3,8(sp)
    80006040:	03010113          	addi	sp,sp,48
    80006044:	00008067          	ret
    80006048:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    8000604c:	00098513          	mv	a0,s3
    80006050:	ffffc097          	auipc	ra,0xffffc
    80006054:	458080e7          	jalr	1112(ra) # 800024a8 <_ZdlPv>
    80006058:	00048513          	mv	a0,s1
    8000605c:	00007097          	auipc	ra,0x7
    80006060:	ccc080e7          	jalr	-820(ra) # 8000cd28 <_Unwind_Resume>
    80006064:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80006068:	00098513          	mv	a0,s3
    8000606c:	ffffc097          	auipc	ra,0xffffc
    80006070:	43c080e7          	jalr	1084(ra) # 800024a8 <_ZdlPv>
    80006074:	00048513          	mv	a0,s1
    80006078:	00007097          	auipc	ra,0x7
    8000607c:	cb0080e7          	jalr	-848(ra) # 8000cd28 <_Unwind_Resume>
    80006080:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80006084:	00090513          	mv	a0,s2
    80006088:	ffffc097          	auipc	ra,0xffffc
    8000608c:	420080e7          	jalr	1056(ra) # 800024a8 <_ZdlPv>
    80006090:	00048513          	mv	a0,s1
    80006094:	00007097          	auipc	ra,0x7
    80006098:	c94080e7          	jalr	-876(ra) # 8000cd28 <_Unwind_Resume>
    8000609c:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    800060a0:	00090513          	mv	a0,s2
    800060a4:	ffffc097          	auipc	ra,0xffffc
    800060a8:	404080e7          	jalr	1028(ra) # 800024a8 <_ZdlPv>
    800060ac:	00048513          	mv	a0,s1
    800060b0:	00007097          	auipc	ra,0x7
    800060b4:	c78080e7          	jalr	-904(ra) # 8000cd28 <_Unwind_Resume>

00000000800060b8 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    800060b8:	fe010113          	addi	sp,sp,-32
    800060bc:	00113c23          	sd	ra,24(sp)
    800060c0:	00813823          	sd	s0,16(sp)
    800060c4:	00913423          	sd	s1,8(sp)
    800060c8:	01213023          	sd	s2,0(sp)
    800060cc:	02010413          	addi	s0,sp,32
    800060d0:	00050493          	mv	s1,a0
    800060d4:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    800060d8:	01853503          	ld	a0,24(a0)
    800060dc:	ffffc097          	auipc	ra,0xffffc
    800060e0:	6f8080e7          	jalr	1784(ra) # 800027d4 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    800060e4:	0304b503          	ld	a0,48(s1)
    800060e8:	ffffc097          	auipc	ra,0xffffc
    800060ec:	6ec080e7          	jalr	1772(ra) # 800027d4 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    800060f0:	0084b783          	ld	a5,8(s1)
    800060f4:	0144a703          	lw	a4,20(s1)
    800060f8:	00271713          	slli	a4,a4,0x2
    800060fc:	00e787b3          	add	a5,a5,a4
    80006100:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006104:	0144a783          	lw	a5,20(s1)
    80006108:	0017879b          	addiw	a5,a5,1
    8000610c:	0004a703          	lw	a4,0(s1)
    80006110:	02e7e7bb          	remw	a5,a5,a4
    80006114:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80006118:	0304b503          	ld	a0,48(s1)
    8000611c:	ffffc097          	auipc	ra,0xffffc
    80006120:	6e4080e7          	jalr	1764(ra) # 80002800 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80006124:	0204b503          	ld	a0,32(s1)
    80006128:	ffffc097          	auipc	ra,0xffffc
    8000612c:	6d8080e7          	jalr	1752(ra) # 80002800 <_ZN9Semaphore6signalEv>

}
    80006130:	01813083          	ld	ra,24(sp)
    80006134:	01013403          	ld	s0,16(sp)
    80006138:	00813483          	ld	s1,8(sp)
    8000613c:	00013903          	ld	s2,0(sp)
    80006140:	02010113          	addi	sp,sp,32
    80006144:	00008067          	ret

0000000080006148 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80006148:	fe010113          	addi	sp,sp,-32
    8000614c:	00113c23          	sd	ra,24(sp)
    80006150:	00813823          	sd	s0,16(sp)
    80006154:	00913423          	sd	s1,8(sp)
    80006158:	01213023          	sd	s2,0(sp)
    8000615c:	02010413          	addi	s0,sp,32
    80006160:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80006164:	02053503          	ld	a0,32(a0)
    80006168:	ffffc097          	auipc	ra,0xffffc
    8000616c:	66c080e7          	jalr	1644(ra) # 800027d4 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80006170:	0284b503          	ld	a0,40(s1)
    80006174:	ffffc097          	auipc	ra,0xffffc
    80006178:	660080e7          	jalr	1632(ra) # 800027d4 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    8000617c:	0084b703          	ld	a4,8(s1)
    80006180:	0104a783          	lw	a5,16(s1)
    80006184:	00279693          	slli	a3,a5,0x2
    80006188:	00d70733          	add	a4,a4,a3
    8000618c:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006190:	0017879b          	addiw	a5,a5,1
    80006194:	0004a703          	lw	a4,0(s1)
    80006198:	02e7e7bb          	remw	a5,a5,a4
    8000619c:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    800061a0:	0284b503          	ld	a0,40(s1)
    800061a4:	ffffc097          	auipc	ra,0xffffc
    800061a8:	65c080e7          	jalr	1628(ra) # 80002800 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    800061ac:	0184b503          	ld	a0,24(s1)
    800061b0:	ffffc097          	auipc	ra,0xffffc
    800061b4:	650080e7          	jalr	1616(ra) # 80002800 <_ZN9Semaphore6signalEv>

    return ret;
}
    800061b8:	00090513          	mv	a0,s2
    800061bc:	01813083          	ld	ra,24(sp)
    800061c0:	01013403          	ld	s0,16(sp)
    800061c4:	00813483          	ld	s1,8(sp)
    800061c8:	00013903          	ld	s2,0(sp)
    800061cc:	02010113          	addi	sp,sp,32
    800061d0:	00008067          	ret

00000000800061d4 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    800061d4:	fe010113          	addi	sp,sp,-32
    800061d8:	00113c23          	sd	ra,24(sp)
    800061dc:	00813823          	sd	s0,16(sp)
    800061e0:	00913423          	sd	s1,8(sp)
    800061e4:	01213023          	sd	s2,0(sp)
    800061e8:	02010413          	addi	s0,sp,32
    800061ec:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    800061f0:	02853503          	ld	a0,40(a0)
    800061f4:	ffffc097          	auipc	ra,0xffffc
    800061f8:	5e0080e7          	jalr	1504(ra) # 800027d4 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    800061fc:	0304b503          	ld	a0,48(s1)
    80006200:	ffffc097          	auipc	ra,0xffffc
    80006204:	5d4080e7          	jalr	1492(ra) # 800027d4 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80006208:	0144a783          	lw	a5,20(s1)
    8000620c:	0104a903          	lw	s2,16(s1)
    80006210:	0327ce63          	blt	a5,s2,8000624c <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80006214:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80006218:	0304b503          	ld	a0,48(s1)
    8000621c:	ffffc097          	auipc	ra,0xffffc
    80006220:	5e4080e7          	jalr	1508(ra) # 80002800 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80006224:	0284b503          	ld	a0,40(s1)
    80006228:	ffffc097          	auipc	ra,0xffffc
    8000622c:	5d8080e7          	jalr	1496(ra) # 80002800 <_ZN9Semaphore6signalEv>

    return ret;
}
    80006230:	00090513          	mv	a0,s2
    80006234:	01813083          	ld	ra,24(sp)
    80006238:	01013403          	ld	s0,16(sp)
    8000623c:	00813483          	ld	s1,8(sp)
    80006240:	00013903          	ld	s2,0(sp)
    80006244:	02010113          	addi	sp,sp,32
    80006248:	00008067          	ret
        ret = cap - head + tail;
    8000624c:	0004a703          	lw	a4,0(s1)
    80006250:	4127093b          	subw	s2,a4,s2
    80006254:	00f9093b          	addw	s2,s2,a5
    80006258:	fc1ff06f          	j	80006218 <_ZN9BufferCPP6getCntEv+0x44>

000000008000625c <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    8000625c:	fe010113          	addi	sp,sp,-32
    80006260:	00113c23          	sd	ra,24(sp)
    80006264:	00813823          	sd	s0,16(sp)
    80006268:	00913423          	sd	s1,8(sp)
    8000626c:	02010413          	addi	s0,sp,32
    80006270:	00050493          	mv	s1,a0
    Console::putc('\n');
    80006274:	00a00513          	li	a0,10
    80006278:	ffffc097          	auipc	ra,0xffffc
    8000627c:	650080e7          	jalr	1616(ra) # 800028c8 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80006280:	00003517          	auipc	a0,0x3
    80006284:	1a850513          	addi	a0,a0,424 # 80009428 <_ZZ9kPrintIntmE6digits+0x3b8>
    80006288:	00000097          	auipc	ra,0x0
    8000628c:	a0c080e7          	jalr	-1524(ra) # 80005c94 <_Z11printStringPKc>
    while (getCnt()) {
    80006290:	00048513          	mv	a0,s1
    80006294:	00000097          	auipc	ra,0x0
    80006298:	f40080e7          	jalr	-192(ra) # 800061d4 <_ZN9BufferCPP6getCntEv>
    8000629c:	02050c63          	beqz	a0,800062d4 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    800062a0:	0084b783          	ld	a5,8(s1)
    800062a4:	0104a703          	lw	a4,16(s1)
    800062a8:	00271713          	slli	a4,a4,0x2
    800062ac:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    800062b0:	0007c503          	lbu	a0,0(a5)
    800062b4:	ffffc097          	auipc	ra,0xffffc
    800062b8:	614080e7          	jalr	1556(ra) # 800028c8 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    800062bc:	0104a783          	lw	a5,16(s1)
    800062c0:	0017879b          	addiw	a5,a5,1
    800062c4:	0004a703          	lw	a4,0(s1)
    800062c8:	02e7e7bb          	remw	a5,a5,a4
    800062cc:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    800062d0:	fc1ff06f          	j	80006290 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    800062d4:	02100513          	li	a0,33
    800062d8:	ffffc097          	auipc	ra,0xffffc
    800062dc:	5f0080e7          	jalr	1520(ra) # 800028c8 <_ZN7Console4putcEc>
    Console::putc('\n');
    800062e0:	00a00513          	li	a0,10
    800062e4:	ffffc097          	auipc	ra,0xffffc
    800062e8:	5e4080e7          	jalr	1508(ra) # 800028c8 <_ZN7Console4putcEc>
    mem_free(buffer);
    800062ec:	0084b503          	ld	a0,8(s1)
    800062f0:	ffffb097          	auipc	ra,0xffffb
    800062f4:	060080e7          	jalr	96(ra) # 80001350 <_Z8mem_freePv>
    delete itemAvailable;
    800062f8:	0204b503          	ld	a0,32(s1)
    800062fc:	00050863          	beqz	a0,8000630c <_ZN9BufferCPPD1Ev+0xb0>
    80006300:	00053783          	ld	a5,0(a0)
    80006304:	0087b783          	ld	a5,8(a5)
    80006308:	000780e7          	jalr	a5
    delete spaceAvailable;
    8000630c:	0184b503          	ld	a0,24(s1)
    80006310:	00050863          	beqz	a0,80006320 <_ZN9BufferCPPD1Ev+0xc4>
    80006314:	00053783          	ld	a5,0(a0)
    80006318:	0087b783          	ld	a5,8(a5)
    8000631c:	000780e7          	jalr	a5
    delete mutexTail;
    80006320:	0304b503          	ld	a0,48(s1)
    80006324:	00050863          	beqz	a0,80006334 <_ZN9BufferCPPD1Ev+0xd8>
    80006328:	00053783          	ld	a5,0(a0)
    8000632c:	0087b783          	ld	a5,8(a5)
    80006330:	000780e7          	jalr	a5
    delete mutexHead;
    80006334:	0284b503          	ld	a0,40(s1)
    80006338:	00050863          	beqz	a0,80006348 <_ZN9BufferCPPD1Ev+0xec>
    8000633c:	00053783          	ld	a5,0(a0)
    80006340:	0087b783          	ld	a5,8(a5)
    80006344:	000780e7          	jalr	a5
}
    80006348:	01813083          	ld	ra,24(sp)
    8000634c:	01013403          	ld	s0,16(sp)
    80006350:	00813483          	ld	s1,8(sp)
    80006354:	02010113          	addi	sp,sp,32
    80006358:	00008067          	ret

000000008000635c <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    8000635c:	fe010113          	addi	sp,sp,-32
    80006360:	00113c23          	sd	ra,24(sp)
    80006364:	00813823          	sd	s0,16(sp)
    80006368:	00913423          	sd	s1,8(sp)
    8000636c:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80006370:	00003517          	auipc	a0,0x3
    80006374:	0d050513          	addi	a0,a0,208 # 80009440 <_ZZ9kPrintIntmE6digits+0x3d0>
    80006378:	00000097          	auipc	ra,0x0
    8000637c:	91c080e7          	jalr	-1764(ra) # 80005c94 <_Z11printStringPKc>
    int test = getc() - '0';
    80006380:	ffffb097          	auipc	ra,0xffffb
    80006384:	1e8080e7          	jalr	488(ra) # 80001568 <_Z4getcv>
    80006388:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    8000638c:	ffffb097          	auipc	ra,0xffffb
    80006390:	1dc080e7          	jalr	476(ra) # 80001568 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80006394:	00700793          	li	a5,7
    80006398:	1097e263          	bltu	a5,s1,8000649c <_Z8userMainv+0x140>
    8000639c:	00249493          	slli	s1,s1,0x2
    800063a0:	00003717          	auipc	a4,0x3
    800063a4:	2f870713          	addi	a4,a4,760 # 80009698 <_ZZ9kPrintIntmE6digits+0x628>
    800063a8:	00e484b3          	add	s1,s1,a4
    800063ac:	0004a783          	lw	a5,0(s1)
    800063b0:	00e787b3          	add	a5,a5,a4
    800063b4:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    800063b8:	fffff097          	auipc	ra,0xfffff
    800063bc:	f54080e7          	jalr	-172(ra) # 8000530c <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    800063c0:	00003517          	auipc	a0,0x3
    800063c4:	0a050513          	addi	a0,a0,160 # 80009460 <_ZZ9kPrintIntmE6digits+0x3f0>
    800063c8:	00000097          	auipc	ra,0x0
    800063cc:	8cc080e7          	jalr	-1844(ra) # 80005c94 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    800063d0:	01813083          	ld	ra,24(sp)
    800063d4:	01013403          	ld	s0,16(sp)
    800063d8:	00813483          	ld	s1,8(sp)
    800063dc:	02010113          	addi	sp,sp,32
    800063e0:	00008067          	ret
            Threads_CPP_API_test();
    800063e4:	ffffe097          	auipc	ra,0xffffe
    800063e8:	e08080e7          	jalr	-504(ra) # 800041ec <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    800063ec:	00003517          	auipc	a0,0x3
    800063f0:	0b450513          	addi	a0,a0,180 # 800094a0 <_ZZ9kPrintIntmE6digits+0x430>
    800063f4:	00000097          	auipc	ra,0x0
    800063f8:	8a0080e7          	jalr	-1888(ra) # 80005c94 <_Z11printStringPKc>
            break;
    800063fc:	fd5ff06f          	j	800063d0 <_Z8userMainv+0x74>
            producerConsumer_C_API();
    80006400:	ffffd097          	auipc	ra,0xffffd
    80006404:	640080e7          	jalr	1600(ra) # 80003a40 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80006408:	00003517          	auipc	a0,0x3
    8000640c:	0d850513          	addi	a0,a0,216 # 800094e0 <_ZZ9kPrintIntmE6digits+0x470>
    80006410:	00000097          	auipc	ra,0x0
    80006414:	884080e7          	jalr	-1916(ra) # 80005c94 <_Z11printStringPKc>
            break;
    80006418:	fb9ff06f          	j	800063d0 <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    8000641c:	fffff097          	auipc	ra,0xfffff
    80006420:	234080e7          	jalr	564(ra) # 80005650 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80006424:	00003517          	auipc	a0,0x3
    80006428:	10c50513          	addi	a0,a0,268 # 80009530 <_ZZ9kPrintIntmE6digits+0x4c0>
    8000642c:	00000097          	auipc	ra,0x0
    80006430:	868080e7          	jalr	-1944(ra) # 80005c94 <_Z11printStringPKc>
            break;
    80006434:	f9dff06f          	j	800063d0 <_Z8userMainv+0x74>
            testSleeping();
    80006438:	00000097          	auipc	ra,0x0
    8000643c:	11c080e7          	jalr	284(ra) # 80006554 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    80006440:	00003517          	auipc	a0,0x3
    80006444:	14850513          	addi	a0,a0,328 # 80009588 <_ZZ9kPrintIntmE6digits+0x518>
    80006448:	00000097          	auipc	ra,0x0
    8000644c:	84c080e7          	jalr	-1972(ra) # 80005c94 <_Z11printStringPKc>
            break;
    80006450:	f81ff06f          	j	800063d0 <_Z8userMainv+0x74>
            testConsumerProducer();
    80006454:	ffffe097          	auipc	ra,0xffffe
    80006458:	258080e7          	jalr	600(ra) # 800046ac <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    8000645c:	00003517          	auipc	a0,0x3
    80006460:	15c50513          	addi	a0,a0,348 # 800095b8 <_ZZ9kPrintIntmE6digits+0x548>
    80006464:	00000097          	auipc	ra,0x0
    80006468:	830080e7          	jalr	-2000(ra) # 80005c94 <_Z11printStringPKc>
            break;
    8000646c:	f65ff06f          	j	800063d0 <_Z8userMainv+0x74>
            System_Mode_test();
    80006470:	00000097          	auipc	ra,0x0
    80006474:	658080e7          	jalr	1624(ra) # 80006ac8 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80006478:	00003517          	auipc	a0,0x3
    8000647c:	18050513          	addi	a0,a0,384 # 800095f8 <_ZZ9kPrintIntmE6digits+0x588>
    80006480:	00000097          	auipc	ra,0x0
    80006484:	814080e7          	jalr	-2028(ra) # 80005c94 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80006488:	00003517          	auipc	a0,0x3
    8000648c:	19050513          	addi	a0,a0,400 # 80009618 <_ZZ9kPrintIntmE6digits+0x5a8>
    80006490:	00000097          	auipc	ra,0x0
    80006494:	804080e7          	jalr	-2044(ra) # 80005c94 <_Z11printStringPKc>
            break;
    80006498:	f39ff06f          	j	800063d0 <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    8000649c:	00003517          	auipc	a0,0x3
    800064a0:	1d450513          	addi	a0,a0,468 # 80009670 <_ZZ9kPrintIntmE6digits+0x600>
    800064a4:	fffff097          	auipc	ra,0xfffff
    800064a8:	7f0080e7          	jalr	2032(ra) # 80005c94 <_Z11printStringPKc>
    800064ac:	f25ff06f          	j	800063d0 <_Z8userMainv+0x74>

00000000800064b0 <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    800064b0:	fe010113          	addi	sp,sp,-32
    800064b4:	00113c23          	sd	ra,24(sp)
    800064b8:	00813823          	sd	s0,16(sp)
    800064bc:	00913423          	sd	s1,8(sp)
    800064c0:	01213023          	sd	s2,0(sp)
    800064c4:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    800064c8:	00053903          	ld	s2,0(a0)
    int i = 6;
    800064cc:	00600493          	li	s1,6
    while (--i > 0) {
    800064d0:	fff4849b          	addiw	s1,s1,-1
    800064d4:	04905463          	blez	s1,8000651c <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    800064d8:	00003517          	auipc	a0,0x3
    800064dc:	1e050513          	addi	a0,a0,480 # 800096b8 <_ZZ9kPrintIntmE6digits+0x648>
    800064e0:	fffff097          	auipc	ra,0xfffff
    800064e4:	7b4080e7          	jalr	1972(ra) # 80005c94 <_Z11printStringPKc>
        printInt(sleep_time);
    800064e8:	00000613          	li	a2,0
    800064ec:	00a00593          	li	a1,10
    800064f0:	0009051b          	sext.w	a0,s2
    800064f4:	00000097          	auipc	ra,0x0
    800064f8:	950080e7          	jalr	-1712(ra) # 80005e44 <_Z8printIntiii>
        printString(" !\n");
    800064fc:	00003517          	auipc	a0,0x3
    80006500:	1c450513          	addi	a0,a0,452 # 800096c0 <_ZZ9kPrintIntmE6digits+0x650>
    80006504:	fffff097          	auipc	ra,0xfffff
    80006508:	790080e7          	jalr	1936(ra) # 80005c94 <_Z11printStringPKc>
        time_sleep(sleep_time);
    8000650c:	00090513          	mv	a0,s2
    80006510:	ffffb097          	auipc	ra,0xffffb
    80006514:	f60080e7          	jalr	-160(ra) # 80001470 <_Z10time_sleepm>
    while (--i > 0) {
    80006518:	fb9ff06f          	j	800064d0 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    8000651c:	00a00793          	li	a5,10
    80006520:	02f95933          	divu	s2,s2,a5
    80006524:	fff90913          	addi	s2,s2,-1
    80006528:	00005797          	auipc	a5,0x5
    8000652c:	73078793          	addi	a5,a5,1840 # 8000bc58 <_ZL8finished>
    80006530:	01278933          	add	s2,a5,s2
    80006534:	00100793          	li	a5,1
    80006538:	00f90023          	sb	a5,0(s2)
}
    8000653c:	01813083          	ld	ra,24(sp)
    80006540:	01013403          	ld	s0,16(sp)
    80006544:	00813483          	ld	s1,8(sp)
    80006548:	00013903          	ld	s2,0(sp)
    8000654c:	02010113          	addi	sp,sp,32
    80006550:	00008067          	ret

0000000080006554 <_Z12testSleepingv>:

void testSleeping() {
    80006554:	fc010113          	addi	sp,sp,-64
    80006558:	02113c23          	sd	ra,56(sp)
    8000655c:	02813823          	sd	s0,48(sp)
    80006560:	02913423          	sd	s1,40(sp)
    80006564:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    80006568:	00a00793          	li	a5,10
    8000656c:	fcf43823          	sd	a5,-48(s0)
    80006570:	01400793          	li	a5,20
    80006574:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    80006578:	00000493          	li	s1,0
    8000657c:	02c0006f          	j	800065a8 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    80006580:	00349793          	slli	a5,s1,0x3
    80006584:	fd040613          	addi	a2,s0,-48
    80006588:	00f60633          	add	a2,a2,a5
    8000658c:	00000597          	auipc	a1,0x0
    80006590:	f2458593          	addi	a1,a1,-220 # 800064b0 <_ZL9sleepyRunPv>
    80006594:	fc040513          	addi	a0,s0,-64
    80006598:	00f50533          	add	a0,a0,a5
    8000659c:	ffffb097          	auipc	ra,0xffffb
    800065a0:	de4080e7          	jalr	-540(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    800065a4:	0014849b          	addiw	s1,s1,1
    800065a8:	00100793          	li	a5,1
    800065ac:	fc97dae3          	bge	a5,s1,80006580 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    800065b0:	00005797          	auipc	a5,0x5
    800065b4:	6a87c783          	lbu	a5,1704(a5) # 8000bc58 <_ZL8finished>
    800065b8:	fe078ce3          	beqz	a5,800065b0 <_Z12testSleepingv+0x5c>
    800065bc:	00005797          	auipc	a5,0x5
    800065c0:	69d7c783          	lbu	a5,1693(a5) # 8000bc59 <_ZL8finished+0x1>
    800065c4:	fe0786e3          	beqz	a5,800065b0 <_Z12testSleepingv+0x5c>
}
    800065c8:	03813083          	ld	ra,56(sp)
    800065cc:	03013403          	ld	s0,48(sp)
    800065d0:	02813483          	ld	s1,40(sp)
    800065d4:	04010113          	addi	sp,sp,64
    800065d8:	00008067          	ret

00000000800065dc <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800065dc:	fe010113          	addi	sp,sp,-32
    800065e0:	00113c23          	sd	ra,24(sp)
    800065e4:	00813823          	sd	s0,16(sp)
    800065e8:	00913423          	sd	s1,8(sp)
    800065ec:	01213023          	sd	s2,0(sp)
    800065f0:	02010413          	addi	s0,sp,32
    800065f4:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800065f8:	00100793          	li	a5,1
    800065fc:	02a7f863          	bgeu	a5,a0,8000662c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80006600:	00a00793          	li	a5,10
    80006604:	02f577b3          	remu	a5,a0,a5
    80006608:	02078e63          	beqz	a5,80006644 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    8000660c:	fff48513          	addi	a0,s1,-1
    80006610:	00000097          	auipc	ra,0x0
    80006614:	fcc080e7          	jalr	-52(ra) # 800065dc <_ZL9fibonaccim>
    80006618:	00050913          	mv	s2,a0
    8000661c:	ffe48513          	addi	a0,s1,-2
    80006620:	00000097          	auipc	ra,0x0
    80006624:	fbc080e7          	jalr	-68(ra) # 800065dc <_ZL9fibonaccim>
    80006628:	00a90533          	add	a0,s2,a0
}
    8000662c:	01813083          	ld	ra,24(sp)
    80006630:	01013403          	ld	s0,16(sp)
    80006634:	00813483          	ld	s1,8(sp)
    80006638:	00013903          	ld	s2,0(sp)
    8000663c:	02010113          	addi	sp,sp,32
    80006640:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80006644:	ffffb097          	auipc	ra,0xffffb
    80006648:	de4080e7          	jalr	-540(ra) # 80001428 <_Z15thread_dispatchv>
    8000664c:	fc1ff06f          	j	8000660c <_ZL9fibonaccim+0x30>

0000000080006650 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80006650:	fe010113          	addi	sp,sp,-32
    80006654:	00113c23          	sd	ra,24(sp)
    80006658:	00813823          	sd	s0,16(sp)
    8000665c:	00913423          	sd	s1,8(sp)
    80006660:	01213023          	sd	s2,0(sp)
    80006664:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80006668:	00a00493          	li	s1,10
    8000666c:	0400006f          	j	800066ac <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006670:	00003517          	auipc	a0,0x3
    80006674:	d2050513          	addi	a0,a0,-736 # 80009390 <_ZZ9kPrintIntmE6digits+0x320>
    80006678:	fffff097          	auipc	ra,0xfffff
    8000667c:	61c080e7          	jalr	1564(ra) # 80005c94 <_Z11printStringPKc>
    80006680:	00000613          	li	a2,0
    80006684:	00a00593          	li	a1,10
    80006688:	00048513          	mv	a0,s1
    8000668c:	fffff097          	auipc	ra,0xfffff
    80006690:	7b8080e7          	jalr	1976(ra) # 80005e44 <_Z8printIntiii>
    80006694:	00003517          	auipc	a0,0x3
    80006698:	eec50513          	addi	a0,a0,-276 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    8000669c:	fffff097          	auipc	ra,0xfffff
    800066a0:	5f8080e7          	jalr	1528(ra) # 80005c94 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800066a4:	0014849b          	addiw	s1,s1,1
    800066a8:	0ff4f493          	andi	s1,s1,255
    800066ac:	00c00793          	li	a5,12
    800066b0:	fc97f0e3          	bgeu	a5,s1,80006670 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800066b4:	00003517          	auipc	a0,0x3
    800066b8:	ce450513          	addi	a0,a0,-796 # 80009398 <_ZZ9kPrintIntmE6digits+0x328>
    800066bc:	fffff097          	auipc	ra,0xfffff
    800066c0:	5d8080e7          	jalr	1496(ra) # 80005c94 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800066c4:	00500313          	li	t1,5
    thread_dispatch();
    800066c8:	ffffb097          	auipc	ra,0xffffb
    800066cc:	d60080e7          	jalr	-672(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800066d0:	01000513          	li	a0,16
    800066d4:	00000097          	auipc	ra,0x0
    800066d8:	f08080e7          	jalr	-248(ra) # 800065dc <_ZL9fibonaccim>
    800066dc:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800066e0:	00003517          	auipc	a0,0x3
    800066e4:	cc850513          	addi	a0,a0,-824 # 800093a8 <_ZZ9kPrintIntmE6digits+0x338>
    800066e8:	fffff097          	auipc	ra,0xfffff
    800066ec:	5ac080e7          	jalr	1452(ra) # 80005c94 <_Z11printStringPKc>
    800066f0:	00000613          	li	a2,0
    800066f4:	00a00593          	li	a1,10
    800066f8:	0009051b          	sext.w	a0,s2
    800066fc:	fffff097          	auipc	ra,0xfffff
    80006700:	748080e7          	jalr	1864(ra) # 80005e44 <_Z8printIntiii>
    80006704:	00003517          	auipc	a0,0x3
    80006708:	e7c50513          	addi	a0,a0,-388 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    8000670c:	fffff097          	auipc	ra,0xfffff
    80006710:	588080e7          	jalr	1416(ra) # 80005c94 <_Z11printStringPKc>
    80006714:	0400006f          	j	80006754 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006718:	00003517          	auipc	a0,0x3
    8000671c:	c7850513          	addi	a0,a0,-904 # 80009390 <_ZZ9kPrintIntmE6digits+0x320>
    80006720:	fffff097          	auipc	ra,0xfffff
    80006724:	574080e7          	jalr	1396(ra) # 80005c94 <_Z11printStringPKc>
    80006728:	00000613          	li	a2,0
    8000672c:	00a00593          	li	a1,10
    80006730:	00048513          	mv	a0,s1
    80006734:	fffff097          	auipc	ra,0xfffff
    80006738:	710080e7          	jalr	1808(ra) # 80005e44 <_Z8printIntiii>
    8000673c:	00003517          	auipc	a0,0x3
    80006740:	e4450513          	addi	a0,a0,-444 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80006744:	fffff097          	auipc	ra,0xfffff
    80006748:	550080e7          	jalr	1360(ra) # 80005c94 <_Z11printStringPKc>
    for (; i < 16; i++) {
    8000674c:	0014849b          	addiw	s1,s1,1
    80006750:	0ff4f493          	andi	s1,s1,255
    80006754:	00f00793          	li	a5,15
    80006758:	fc97f0e3          	bgeu	a5,s1,80006718 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    8000675c:	00003517          	auipc	a0,0x3
    80006760:	c5c50513          	addi	a0,a0,-932 # 800093b8 <_ZZ9kPrintIntmE6digits+0x348>
    80006764:	fffff097          	auipc	ra,0xfffff
    80006768:	530080e7          	jalr	1328(ra) # 80005c94 <_Z11printStringPKc>
    finishedD = true;
    8000676c:	00100793          	li	a5,1
    80006770:	00005717          	auipc	a4,0x5
    80006774:	4ef70523          	sb	a5,1258(a4) # 8000bc5a <_ZL9finishedD>
    thread_dispatch();
    80006778:	ffffb097          	auipc	ra,0xffffb
    8000677c:	cb0080e7          	jalr	-848(ra) # 80001428 <_Z15thread_dispatchv>
}
    80006780:	01813083          	ld	ra,24(sp)
    80006784:	01013403          	ld	s0,16(sp)
    80006788:	00813483          	ld	s1,8(sp)
    8000678c:	00013903          	ld	s2,0(sp)
    80006790:	02010113          	addi	sp,sp,32
    80006794:	00008067          	ret

0000000080006798 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80006798:	fe010113          	addi	sp,sp,-32
    8000679c:	00113c23          	sd	ra,24(sp)
    800067a0:	00813823          	sd	s0,16(sp)
    800067a4:	00913423          	sd	s1,8(sp)
    800067a8:	01213023          	sd	s2,0(sp)
    800067ac:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800067b0:	00000493          	li	s1,0
    800067b4:	0400006f          	j	800067f4 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800067b8:	00003517          	auipc	a0,0x3
    800067bc:	b9850513          	addi	a0,a0,-1128 # 80009350 <_ZZ9kPrintIntmE6digits+0x2e0>
    800067c0:	fffff097          	auipc	ra,0xfffff
    800067c4:	4d4080e7          	jalr	1236(ra) # 80005c94 <_Z11printStringPKc>
    800067c8:	00000613          	li	a2,0
    800067cc:	00a00593          	li	a1,10
    800067d0:	00048513          	mv	a0,s1
    800067d4:	fffff097          	auipc	ra,0xfffff
    800067d8:	670080e7          	jalr	1648(ra) # 80005e44 <_Z8printIntiii>
    800067dc:	00003517          	auipc	a0,0x3
    800067e0:	da450513          	addi	a0,a0,-604 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    800067e4:	fffff097          	auipc	ra,0xfffff
    800067e8:	4b0080e7          	jalr	1200(ra) # 80005c94 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800067ec:	0014849b          	addiw	s1,s1,1
    800067f0:	0ff4f493          	andi	s1,s1,255
    800067f4:	00200793          	li	a5,2
    800067f8:	fc97f0e3          	bgeu	a5,s1,800067b8 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    800067fc:	00003517          	auipc	a0,0x3
    80006800:	b5c50513          	addi	a0,a0,-1188 # 80009358 <_ZZ9kPrintIntmE6digits+0x2e8>
    80006804:	fffff097          	auipc	ra,0xfffff
    80006808:	490080e7          	jalr	1168(ra) # 80005c94 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    8000680c:	00700313          	li	t1,7
    thread_dispatch();
    80006810:	ffffb097          	auipc	ra,0xffffb
    80006814:	c18080e7          	jalr	-1000(ra) # 80001428 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80006818:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    8000681c:	00003517          	auipc	a0,0x3
    80006820:	b4c50513          	addi	a0,a0,-1204 # 80009368 <_ZZ9kPrintIntmE6digits+0x2f8>
    80006824:	fffff097          	auipc	ra,0xfffff
    80006828:	470080e7          	jalr	1136(ra) # 80005c94 <_Z11printStringPKc>
    8000682c:	00000613          	li	a2,0
    80006830:	00a00593          	li	a1,10
    80006834:	0009051b          	sext.w	a0,s2
    80006838:	fffff097          	auipc	ra,0xfffff
    8000683c:	60c080e7          	jalr	1548(ra) # 80005e44 <_Z8printIntiii>
    80006840:	00003517          	auipc	a0,0x3
    80006844:	d4050513          	addi	a0,a0,-704 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80006848:	fffff097          	auipc	ra,0xfffff
    8000684c:	44c080e7          	jalr	1100(ra) # 80005c94 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80006850:	00c00513          	li	a0,12
    80006854:	00000097          	auipc	ra,0x0
    80006858:	d88080e7          	jalr	-632(ra) # 800065dc <_ZL9fibonaccim>
    8000685c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006860:	00003517          	auipc	a0,0x3
    80006864:	b1050513          	addi	a0,a0,-1264 # 80009370 <_ZZ9kPrintIntmE6digits+0x300>
    80006868:	fffff097          	auipc	ra,0xfffff
    8000686c:	42c080e7          	jalr	1068(ra) # 80005c94 <_Z11printStringPKc>
    80006870:	00000613          	li	a2,0
    80006874:	00a00593          	li	a1,10
    80006878:	0009051b          	sext.w	a0,s2
    8000687c:	fffff097          	auipc	ra,0xfffff
    80006880:	5c8080e7          	jalr	1480(ra) # 80005e44 <_Z8printIntiii>
    80006884:	00003517          	auipc	a0,0x3
    80006888:	cfc50513          	addi	a0,a0,-772 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    8000688c:	fffff097          	auipc	ra,0xfffff
    80006890:	408080e7          	jalr	1032(ra) # 80005c94 <_Z11printStringPKc>
    80006894:	0400006f          	j	800068d4 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80006898:	00003517          	auipc	a0,0x3
    8000689c:	ab850513          	addi	a0,a0,-1352 # 80009350 <_ZZ9kPrintIntmE6digits+0x2e0>
    800068a0:	fffff097          	auipc	ra,0xfffff
    800068a4:	3f4080e7          	jalr	1012(ra) # 80005c94 <_Z11printStringPKc>
    800068a8:	00000613          	li	a2,0
    800068ac:	00a00593          	li	a1,10
    800068b0:	00048513          	mv	a0,s1
    800068b4:	fffff097          	auipc	ra,0xfffff
    800068b8:	590080e7          	jalr	1424(ra) # 80005e44 <_Z8printIntiii>
    800068bc:	00003517          	auipc	a0,0x3
    800068c0:	cc450513          	addi	a0,a0,-828 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    800068c4:	fffff097          	auipc	ra,0xfffff
    800068c8:	3d0080e7          	jalr	976(ra) # 80005c94 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800068cc:	0014849b          	addiw	s1,s1,1
    800068d0:	0ff4f493          	andi	s1,s1,255
    800068d4:	00500793          	li	a5,5
    800068d8:	fc97f0e3          	bgeu	a5,s1,80006898 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    800068dc:	00003517          	auipc	a0,0x3
    800068e0:	a4c50513          	addi	a0,a0,-1460 # 80009328 <_ZZ9kPrintIntmE6digits+0x2b8>
    800068e4:	fffff097          	auipc	ra,0xfffff
    800068e8:	3b0080e7          	jalr	944(ra) # 80005c94 <_Z11printStringPKc>
    finishedC = true;
    800068ec:	00100793          	li	a5,1
    800068f0:	00005717          	auipc	a4,0x5
    800068f4:	36f705a3          	sb	a5,875(a4) # 8000bc5b <_ZL9finishedC>
    thread_dispatch();
    800068f8:	ffffb097          	auipc	ra,0xffffb
    800068fc:	b30080e7          	jalr	-1232(ra) # 80001428 <_Z15thread_dispatchv>
}
    80006900:	01813083          	ld	ra,24(sp)
    80006904:	01013403          	ld	s0,16(sp)
    80006908:	00813483          	ld	s1,8(sp)
    8000690c:	00013903          	ld	s2,0(sp)
    80006910:	02010113          	addi	sp,sp,32
    80006914:	00008067          	ret

0000000080006918 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80006918:	fe010113          	addi	sp,sp,-32
    8000691c:	00113c23          	sd	ra,24(sp)
    80006920:	00813823          	sd	s0,16(sp)
    80006924:	00913423          	sd	s1,8(sp)
    80006928:	01213023          	sd	s2,0(sp)
    8000692c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006930:	00000913          	li	s2,0
    80006934:	0400006f          	j	80006974 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    80006938:	ffffb097          	auipc	ra,0xffffb
    8000693c:	af0080e7          	jalr	-1296(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006940:	00148493          	addi	s1,s1,1
    80006944:	000027b7          	lui	a5,0x2
    80006948:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000694c:	0097ee63          	bltu	a5,s1,80006968 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006950:	00000713          	li	a4,0
    80006954:	000077b7          	lui	a5,0x7
    80006958:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000695c:	fce7eee3          	bltu	a5,a4,80006938 <_ZL11workerBodyBPv+0x20>
    80006960:	00170713          	addi	a4,a4,1
    80006964:	ff1ff06f          	j	80006954 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    80006968:	00a00793          	li	a5,10
    8000696c:	04f90663          	beq	s2,a5,800069b8 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80006970:	00190913          	addi	s2,s2,1
    80006974:	00f00793          	li	a5,15
    80006978:	0527e463          	bltu	a5,s2,800069c0 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    8000697c:	00003517          	auipc	a0,0x3
    80006980:	9bc50513          	addi	a0,a0,-1604 # 80009338 <_ZZ9kPrintIntmE6digits+0x2c8>
    80006984:	fffff097          	auipc	ra,0xfffff
    80006988:	310080e7          	jalr	784(ra) # 80005c94 <_Z11printStringPKc>
    8000698c:	00000613          	li	a2,0
    80006990:	00a00593          	li	a1,10
    80006994:	0009051b          	sext.w	a0,s2
    80006998:	fffff097          	auipc	ra,0xfffff
    8000699c:	4ac080e7          	jalr	1196(ra) # 80005e44 <_Z8printIntiii>
    800069a0:	00003517          	auipc	a0,0x3
    800069a4:	be050513          	addi	a0,a0,-1056 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    800069a8:	fffff097          	auipc	ra,0xfffff
    800069ac:	2ec080e7          	jalr	748(ra) # 80005c94 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800069b0:	00000493          	li	s1,0
    800069b4:	f91ff06f          	j	80006944 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    800069b8:	14102ff3          	csrr	t6,sepc
    800069bc:	fb5ff06f          	j	80006970 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    800069c0:	00003517          	auipc	a0,0x3
    800069c4:	98050513          	addi	a0,a0,-1664 # 80009340 <_ZZ9kPrintIntmE6digits+0x2d0>
    800069c8:	fffff097          	auipc	ra,0xfffff
    800069cc:	2cc080e7          	jalr	716(ra) # 80005c94 <_Z11printStringPKc>
    finishedB = true;
    800069d0:	00100793          	li	a5,1
    800069d4:	00005717          	auipc	a4,0x5
    800069d8:	28f70423          	sb	a5,648(a4) # 8000bc5c <_ZL9finishedB>
    thread_dispatch();
    800069dc:	ffffb097          	auipc	ra,0xffffb
    800069e0:	a4c080e7          	jalr	-1460(ra) # 80001428 <_Z15thread_dispatchv>
}
    800069e4:	01813083          	ld	ra,24(sp)
    800069e8:	01013403          	ld	s0,16(sp)
    800069ec:	00813483          	ld	s1,8(sp)
    800069f0:	00013903          	ld	s2,0(sp)
    800069f4:	02010113          	addi	sp,sp,32
    800069f8:	00008067          	ret

00000000800069fc <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    800069fc:	fe010113          	addi	sp,sp,-32
    80006a00:	00113c23          	sd	ra,24(sp)
    80006a04:	00813823          	sd	s0,16(sp)
    80006a08:	00913423          	sd	s1,8(sp)
    80006a0c:	01213023          	sd	s2,0(sp)
    80006a10:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006a14:	00000913          	li	s2,0
    80006a18:	0380006f          	j	80006a50 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80006a1c:	ffffb097          	auipc	ra,0xffffb
    80006a20:	a0c080e7          	jalr	-1524(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006a24:	00148493          	addi	s1,s1,1
    80006a28:	000027b7          	lui	a5,0x2
    80006a2c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006a30:	0097ee63          	bltu	a5,s1,80006a4c <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006a34:	00000713          	li	a4,0
    80006a38:	000077b7          	lui	a5,0x7
    80006a3c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006a40:	fce7eee3          	bltu	a5,a4,80006a1c <_ZL11workerBodyAPv+0x20>
    80006a44:	00170713          	addi	a4,a4,1
    80006a48:	ff1ff06f          	j	80006a38 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80006a4c:	00190913          	addi	s2,s2,1
    80006a50:	00900793          	li	a5,9
    80006a54:	0527e063          	bltu	a5,s2,80006a94 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80006a58:	00003517          	auipc	a0,0x3
    80006a5c:	8c850513          	addi	a0,a0,-1848 # 80009320 <_ZZ9kPrintIntmE6digits+0x2b0>
    80006a60:	fffff097          	auipc	ra,0xfffff
    80006a64:	234080e7          	jalr	564(ra) # 80005c94 <_Z11printStringPKc>
    80006a68:	00000613          	li	a2,0
    80006a6c:	00a00593          	li	a1,10
    80006a70:	0009051b          	sext.w	a0,s2
    80006a74:	fffff097          	auipc	ra,0xfffff
    80006a78:	3d0080e7          	jalr	976(ra) # 80005e44 <_Z8printIntiii>
    80006a7c:	00003517          	auipc	a0,0x3
    80006a80:	b0450513          	addi	a0,a0,-1276 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80006a84:	fffff097          	auipc	ra,0xfffff
    80006a88:	210080e7          	jalr	528(ra) # 80005c94 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006a8c:	00000493          	li	s1,0
    80006a90:	f99ff06f          	j	80006a28 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80006a94:	00003517          	auipc	a0,0x3
    80006a98:	89450513          	addi	a0,a0,-1900 # 80009328 <_ZZ9kPrintIntmE6digits+0x2b8>
    80006a9c:	fffff097          	auipc	ra,0xfffff
    80006aa0:	1f8080e7          	jalr	504(ra) # 80005c94 <_Z11printStringPKc>
    finishedA = true;
    80006aa4:	00100793          	li	a5,1
    80006aa8:	00005717          	auipc	a4,0x5
    80006aac:	1af70aa3          	sb	a5,437(a4) # 8000bc5d <_ZL9finishedA>
}
    80006ab0:	01813083          	ld	ra,24(sp)
    80006ab4:	01013403          	ld	s0,16(sp)
    80006ab8:	00813483          	ld	s1,8(sp)
    80006abc:	00013903          	ld	s2,0(sp)
    80006ac0:	02010113          	addi	sp,sp,32
    80006ac4:	00008067          	ret

0000000080006ac8 <_Z16System_Mode_testv>:


void System_Mode_test() {
    80006ac8:	fd010113          	addi	sp,sp,-48
    80006acc:	02113423          	sd	ra,40(sp)
    80006ad0:	02813023          	sd	s0,32(sp)
    80006ad4:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80006ad8:	00000613          	li	a2,0
    80006adc:	00000597          	auipc	a1,0x0
    80006ae0:	f2058593          	addi	a1,a1,-224 # 800069fc <_ZL11workerBodyAPv>
    80006ae4:	fd040513          	addi	a0,s0,-48
    80006ae8:	ffffb097          	auipc	ra,0xffffb
    80006aec:	898080e7          	jalr	-1896(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80006af0:	00003517          	auipc	a0,0x3
    80006af4:	8d850513          	addi	a0,a0,-1832 # 800093c8 <_ZZ9kPrintIntmE6digits+0x358>
    80006af8:	fffff097          	auipc	ra,0xfffff
    80006afc:	19c080e7          	jalr	412(ra) # 80005c94 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80006b00:	00000613          	li	a2,0
    80006b04:	00000597          	auipc	a1,0x0
    80006b08:	e1458593          	addi	a1,a1,-492 # 80006918 <_ZL11workerBodyBPv>
    80006b0c:	fd840513          	addi	a0,s0,-40
    80006b10:	ffffb097          	auipc	ra,0xffffb
    80006b14:	870080e7          	jalr	-1936(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80006b18:	00003517          	auipc	a0,0x3
    80006b1c:	8c850513          	addi	a0,a0,-1848 # 800093e0 <_ZZ9kPrintIntmE6digits+0x370>
    80006b20:	fffff097          	auipc	ra,0xfffff
    80006b24:	174080e7          	jalr	372(ra) # 80005c94 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80006b28:	00000613          	li	a2,0
    80006b2c:	00000597          	auipc	a1,0x0
    80006b30:	c6c58593          	addi	a1,a1,-916 # 80006798 <_ZL11workerBodyCPv>
    80006b34:	fe040513          	addi	a0,s0,-32
    80006b38:	ffffb097          	auipc	ra,0xffffb
    80006b3c:	848080e7          	jalr	-1976(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80006b40:	00003517          	auipc	a0,0x3
    80006b44:	8b850513          	addi	a0,a0,-1864 # 800093f8 <_ZZ9kPrintIntmE6digits+0x388>
    80006b48:	fffff097          	auipc	ra,0xfffff
    80006b4c:	14c080e7          	jalr	332(ra) # 80005c94 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80006b50:	00000613          	li	a2,0
    80006b54:	00000597          	auipc	a1,0x0
    80006b58:	afc58593          	addi	a1,a1,-1284 # 80006650 <_ZL11workerBodyDPv>
    80006b5c:	fe840513          	addi	a0,s0,-24
    80006b60:	ffffb097          	auipc	ra,0xffffb
    80006b64:	820080e7          	jalr	-2016(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80006b68:	00003517          	auipc	a0,0x3
    80006b6c:	8a850513          	addi	a0,a0,-1880 # 80009410 <_ZZ9kPrintIntmE6digits+0x3a0>
    80006b70:	fffff097          	auipc	ra,0xfffff
    80006b74:	124080e7          	jalr	292(ra) # 80005c94 <_Z11printStringPKc>
    80006b78:	00c0006f          	j	80006b84 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006b7c:	ffffb097          	auipc	ra,0xffffb
    80006b80:	8ac080e7          	jalr	-1876(ra) # 80001428 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006b84:	00005797          	auipc	a5,0x5
    80006b88:	0d97c783          	lbu	a5,217(a5) # 8000bc5d <_ZL9finishedA>
    80006b8c:	fe0788e3          	beqz	a5,80006b7c <_Z16System_Mode_testv+0xb4>
    80006b90:	00005797          	auipc	a5,0x5
    80006b94:	0cc7c783          	lbu	a5,204(a5) # 8000bc5c <_ZL9finishedB>
    80006b98:	fe0782e3          	beqz	a5,80006b7c <_Z16System_Mode_testv+0xb4>
    80006b9c:	00005797          	auipc	a5,0x5
    80006ba0:	0bf7c783          	lbu	a5,191(a5) # 8000bc5b <_ZL9finishedC>
    80006ba4:	fc078ce3          	beqz	a5,80006b7c <_Z16System_Mode_testv+0xb4>
    80006ba8:	00005797          	auipc	a5,0x5
    80006bac:	0b27c783          	lbu	a5,178(a5) # 8000bc5a <_ZL9finishedD>
    80006bb0:	fc0786e3          	beqz	a5,80006b7c <_Z16System_Mode_testv+0xb4>
    }

}
    80006bb4:	02813083          	ld	ra,40(sp)
    80006bb8:	02013403          	ld	s0,32(sp)
    80006bbc:	03010113          	addi	sp,sp,48
    80006bc0:	00008067          	ret

0000000080006bc4 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006bc4:	fe010113          	addi	sp,sp,-32
    80006bc8:	00113c23          	sd	ra,24(sp)
    80006bcc:	00813823          	sd	s0,16(sp)
    80006bd0:	00913423          	sd	s1,8(sp)
    80006bd4:	01213023          	sd	s2,0(sp)
    80006bd8:	02010413          	addi	s0,sp,32
    80006bdc:	00050493          	mv	s1,a0
    80006be0:	00058913          	mv	s2,a1
    80006be4:	0015879b          	addiw	a5,a1,1
    80006be8:	0007851b          	sext.w	a0,a5
    80006bec:	00f4a023          	sw	a5,0(s1)
    80006bf0:	0004a823          	sw	zero,16(s1)
    80006bf4:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006bf8:	00251513          	slli	a0,a0,0x2
    80006bfc:	ffffa097          	auipc	ra,0xffffa
    80006c00:	714080e7          	jalr	1812(ra) # 80001310 <_Z9mem_allocm>
    80006c04:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80006c08:	00000593          	li	a1,0
    80006c0c:	02048513          	addi	a0,s1,32
    80006c10:	ffffb097          	auipc	ra,0xffffb
    80006c14:	890080e7          	jalr	-1904(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&spaceAvailable, _cap);
    80006c18:	00090593          	mv	a1,s2
    80006c1c:	01848513          	addi	a0,s1,24
    80006c20:	ffffb097          	auipc	ra,0xffffb
    80006c24:	880080e7          	jalr	-1920(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&mutexHead, 1);
    80006c28:	00100593          	li	a1,1
    80006c2c:	02848513          	addi	a0,s1,40
    80006c30:	ffffb097          	auipc	ra,0xffffb
    80006c34:	870080e7          	jalr	-1936(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&mutexTail, 1);
    80006c38:	00100593          	li	a1,1
    80006c3c:	03048513          	addi	a0,s1,48
    80006c40:	ffffb097          	auipc	ra,0xffffb
    80006c44:	860080e7          	jalr	-1952(ra) # 800014a0 <_Z8sem_openPP4KSemj>
}
    80006c48:	01813083          	ld	ra,24(sp)
    80006c4c:	01013403          	ld	s0,16(sp)
    80006c50:	00813483          	ld	s1,8(sp)
    80006c54:	00013903          	ld	s2,0(sp)
    80006c58:	02010113          	addi	sp,sp,32
    80006c5c:	00008067          	ret

0000000080006c60 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80006c60:	fe010113          	addi	sp,sp,-32
    80006c64:	00113c23          	sd	ra,24(sp)
    80006c68:	00813823          	sd	s0,16(sp)
    80006c6c:	00913423          	sd	s1,8(sp)
    80006c70:	01213023          	sd	s2,0(sp)
    80006c74:	02010413          	addi	s0,sp,32
    80006c78:	00050493          	mv	s1,a0
    80006c7c:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80006c80:	01853503          	ld	a0,24(a0)
    80006c84:	ffffb097          	auipc	ra,0xffffb
    80006c88:	884080e7          	jalr	-1916(ra) # 80001508 <_Z8sem_waitP4KSem>

    sem_wait(mutexTail);
    80006c8c:	0304b503          	ld	a0,48(s1)
    80006c90:	ffffb097          	auipc	ra,0xffffb
    80006c94:	878080e7          	jalr	-1928(ra) # 80001508 <_Z8sem_waitP4KSem>
    buffer[tail] = val;
    80006c98:	0084b783          	ld	a5,8(s1)
    80006c9c:	0144a703          	lw	a4,20(s1)
    80006ca0:	00271713          	slli	a4,a4,0x2
    80006ca4:	00e787b3          	add	a5,a5,a4
    80006ca8:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006cac:	0144a783          	lw	a5,20(s1)
    80006cb0:	0017879b          	addiw	a5,a5,1
    80006cb4:	0004a703          	lw	a4,0(s1)
    80006cb8:	02e7e7bb          	remw	a5,a5,a4
    80006cbc:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80006cc0:	0304b503          	ld	a0,48(s1)
    80006cc4:	ffffb097          	auipc	ra,0xffffb
    80006cc8:	874080e7          	jalr	-1932(ra) # 80001538 <_Z10sem_signalP4KSem>

    sem_signal(itemAvailable);
    80006ccc:	0204b503          	ld	a0,32(s1)
    80006cd0:	ffffb097          	auipc	ra,0xffffb
    80006cd4:	868080e7          	jalr	-1944(ra) # 80001538 <_Z10sem_signalP4KSem>

}
    80006cd8:	01813083          	ld	ra,24(sp)
    80006cdc:	01013403          	ld	s0,16(sp)
    80006ce0:	00813483          	ld	s1,8(sp)
    80006ce4:	00013903          	ld	s2,0(sp)
    80006ce8:	02010113          	addi	sp,sp,32
    80006cec:	00008067          	ret

0000000080006cf0 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80006cf0:	fe010113          	addi	sp,sp,-32
    80006cf4:	00113c23          	sd	ra,24(sp)
    80006cf8:	00813823          	sd	s0,16(sp)
    80006cfc:	00913423          	sd	s1,8(sp)
    80006d00:	01213023          	sd	s2,0(sp)
    80006d04:	02010413          	addi	s0,sp,32
    80006d08:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80006d0c:	02053503          	ld	a0,32(a0)
    80006d10:	ffffa097          	auipc	ra,0xffffa
    80006d14:	7f8080e7          	jalr	2040(ra) # 80001508 <_Z8sem_waitP4KSem>

    sem_wait(mutexHead);
    80006d18:	0284b503          	ld	a0,40(s1)
    80006d1c:	ffffa097          	auipc	ra,0xffffa
    80006d20:	7ec080e7          	jalr	2028(ra) # 80001508 <_Z8sem_waitP4KSem>

    int ret = buffer[head];
    80006d24:	0084b703          	ld	a4,8(s1)
    80006d28:	0104a783          	lw	a5,16(s1)
    80006d2c:	00279693          	slli	a3,a5,0x2
    80006d30:	00d70733          	add	a4,a4,a3
    80006d34:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006d38:	0017879b          	addiw	a5,a5,1
    80006d3c:	0004a703          	lw	a4,0(s1)
    80006d40:	02e7e7bb          	remw	a5,a5,a4
    80006d44:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80006d48:	0284b503          	ld	a0,40(s1)
    80006d4c:	ffffa097          	auipc	ra,0xffffa
    80006d50:	7ec080e7          	jalr	2028(ra) # 80001538 <_Z10sem_signalP4KSem>

    sem_signal(spaceAvailable);
    80006d54:	0184b503          	ld	a0,24(s1)
    80006d58:	ffffa097          	auipc	ra,0xffffa
    80006d5c:	7e0080e7          	jalr	2016(ra) # 80001538 <_Z10sem_signalP4KSem>

    return ret;
}
    80006d60:	00090513          	mv	a0,s2
    80006d64:	01813083          	ld	ra,24(sp)
    80006d68:	01013403          	ld	s0,16(sp)
    80006d6c:	00813483          	ld	s1,8(sp)
    80006d70:	00013903          	ld	s2,0(sp)
    80006d74:	02010113          	addi	sp,sp,32
    80006d78:	00008067          	ret

0000000080006d7c <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80006d7c:	fe010113          	addi	sp,sp,-32
    80006d80:	00113c23          	sd	ra,24(sp)
    80006d84:	00813823          	sd	s0,16(sp)
    80006d88:	00913423          	sd	s1,8(sp)
    80006d8c:	01213023          	sd	s2,0(sp)
    80006d90:	02010413          	addi	s0,sp,32
    80006d94:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80006d98:	02853503          	ld	a0,40(a0)
    80006d9c:	ffffa097          	auipc	ra,0xffffa
    80006da0:	76c080e7          	jalr	1900(ra) # 80001508 <_Z8sem_waitP4KSem>
    sem_wait(mutexTail);
    80006da4:	0304b503          	ld	a0,48(s1)
    80006da8:	ffffa097          	auipc	ra,0xffffa
    80006dac:	760080e7          	jalr	1888(ra) # 80001508 <_Z8sem_waitP4KSem>

    if (tail >= head) {
    80006db0:	0144a783          	lw	a5,20(s1)
    80006db4:	0104a903          	lw	s2,16(s1)
    80006db8:	0327ce63          	blt	a5,s2,80006df4 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80006dbc:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80006dc0:	0304b503          	ld	a0,48(s1)
    80006dc4:	ffffa097          	auipc	ra,0xffffa
    80006dc8:	774080e7          	jalr	1908(ra) # 80001538 <_Z10sem_signalP4KSem>
    sem_signal(mutexHead);
    80006dcc:	0284b503          	ld	a0,40(s1)
    80006dd0:	ffffa097          	auipc	ra,0xffffa
    80006dd4:	768080e7          	jalr	1896(ra) # 80001538 <_Z10sem_signalP4KSem>

    return ret;
}
    80006dd8:	00090513          	mv	a0,s2
    80006ddc:	01813083          	ld	ra,24(sp)
    80006de0:	01013403          	ld	s0,16(sp)
    80006de4:	00813483          	ld	s1,8(sp)
    80006de8:	00013903          	ld	s2,0(sp)
    80006dec:	02010113          	addi	sp,sp,32
    80006df0:	00008067          	ret
        ret = cap - head + tail;
    80006df4:	0004a703          	lw	a4,0(s1)
    80006df8:	4127093b          	subw	s2,a4,s2
    80006dfc:	00f9093b          	addw	s2,s2,a5
    80006e00:	fc1ff06f          	j	80006dc0 <_ZN6Buffer6getCntEv+0x44>

0000000080006e04 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80006e04:	fe010113          	addi	sp,sp,-32
    80006e08:	00113c23          	sd	ra,24(sp)
    80006e0c:	00813823          	sd	s0,16(sp)
    80006e10:	00913423          	sd	s1,8(sp)
    80006e14:	02010413          	addi	s0,sp,32
    80006e18:	00050493          	mv	s1,a0
    putc('\n');
    80006e1c:	00a00513          	li	a0,10
    80006e20:	ffffa097          	auipc	ra,0xffffa
    80006e24:	770080e7          	jalr	1904(ra) # 80001590 <_Z4putcc>
    printString("Buffer deleted!\n");
    80006e28:	00002517          	auipc	a0,0x2
    80006e2c:	60050513          	addi	a0,a0,1536 # 80009428 <_ZZ9kPrintIntmE6digits+0x3b8>
    80006e30:	fffff097          	auipc	ra,0xfffff
    80006e34:	e64080e7          	jalr	-412(ra) # 80005c94 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80006e38:	00048513          	mv	a0,s1
    80006e3c:	00000097          	auipc	ra,0x0
    80006e40:	f40080e7          	jalr	-192(ra) # 80006d7c <_ZN6Buffer6getCntEv>
    80006e44:	02a05c63          	blez	a0,80006e7c <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80006e48:	0084b783          	ld	a5,8(s1)
    80006e4c:	0104a703          	lw	a4,16(s1)
    80006e50:	00271713          	slli	a4,a4,0x2
    80006e54:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80006e58:	0007c503          	lbu	a0,0(a5)
    80006e5c:	ffffa097          	auipc	ra,0xffffa
    80006e60:	734080e7          	jalr	1844(ra) # 80001590 <_Z4putcc>
        head = (head + 1) % cap;
    80006e64:	0104a783          	lw	a5,16(s1)
    80006e68:	0017879b          	addiw	a5,a5,1
    80006e6c:	0004a703          	lw	a4,0(s1)
    80006e70:	02e7e7bb          	remw	a5,a5,a4
    80006e74:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80006e78:	fc1ff06f          	j	80006e38 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80006e7c:	02100513          	li	a0,33
    80006e80:	ffffa097          	auipc	ra,0xffffa
    80006e84:	710080e7          	jalr	1808(ra) # 80001590 <_Z4putcc>
    putc('\n');
    80006e88:	00a00513          	li	a0,10
    80006e8c:	ffffa097          	auipc	ra,0xffffa
    80006e90:	704080e7          	jalr	1796(ra) # 80001590 <_Z4putcc>
    mem_free(buffer);
    80006e94:	0084b503          	ld	a0,8(s1)
    80006e98:	ffffa097          	auipc	ra,0xffffa
    80006e9c:	4b8080e7          	jalr	1208(ra) # 80001350 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80006ea0:	0204b503          	ld	a0,32(s1)
    80006ea4:	ffffa097          	auipc	ra,0xffffa
    80006ea8:	634080e7          	jalr	1588(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(spaceAvailable);
    80006eac:	0184b503          	ld	a0,24(s1)
    80006eb0:	ffffa097          	auipc	ra,0xffffa
    80006eb4:	628080e7          	jalr	1576(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(mutexTail);
    80006eb8:	0304b503          	ld	a0,48(s1)
    80006ebc:	ffffa097          	auipc	ra,0xffffa
    80006ec0:	61c080e7          	jalr	1564(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(mutexHead);
    80006ec4:	0284b503          	ld	a0,40(s1)
    80006ec8:	ffffa097          	auipc	ra,0xffffa
    80006ecc:	610080e7          	jalr	1552(ra) # 800014d8 <_Z9sem_closeP4KSem>
}
    80006ed0:	01813083          	ld	ra,24(sp)
    80006ed4:	01013403          	ld	s0,16(sp)
    80006ed8:	00813483          	ld	s1,8(sp)
    80006edc:	02010113          	addi	sp,sp,32
    80006ee0:	00008067          	ret

0000000080006ee4 <start>:
    80006ee4:	ff010113          	addi	sp,sp,-16
    80006ee8:	00813423          	sd	s0,8(sp)
    80006eec:	01010413          	addi	s0,sp,16
    80006ef0:	300027f3          	csrr	a5,mstatus
    80006ef4:	ffffe737          	lui	a4,0xffffe
    80006ef8:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff193f>
    80006efc:	00e7f7b3          	and	a5,a5,a4
    80006f00:	00001737          	lui	a4,0x1
    80006f04:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80006f08:	00e7e7b3          	or	a5,a5,a4
    80006f0c:	30079073          	csrw	mstatus,a5
    80006f10:	00000797          	auipc	a5,0x0
    80006f14:	16078793          	addi	a5,a5,352 # 80007070 <system_main>
    80006f18:	34179073          	csrw	mepc,a5
    80006f1c:	00000793          	li	a5,0
    80006f20:	18079073          	csrw	satp,a5
    80006f24:	000107b7          	lui	a5,0x10
    80006f28:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80006f2c:	30279073          	csrw	medeleg,a5
    80006f30:	30379073          	csrw	mideleg,a5
    80006f34:	104027f3          	csrr	a5,sie
    80006f38:	2227e793          	ori	a5,a5,546
    80006f3c:	10479073          	csrw	sie,a5
    80006f40:	fff00793          	li	a5,-1
    80006f44:	00a7d793          	srli	a5,a5,0xa
    80006f48:	3b079073          	csrw	pmpaddr0,a5
    80006f4c:	00f00793          	li	a5,15
    80006f50:	3a079073          	csrw	pmpcfg0,a5
    80006f54:	f14027f3          	csrr	a5,mhartid
    80006f58:	0200c737          	lui	a4,0x200c
    80006f5c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80006f60:	0007869b          	sext.w	a3,a5
    80006f64:	00269713          	slli	a4,a3,0x2
    80006f68:	000f4637          	lui	a2,0xf4
    80006f6c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80006f70:	00d70733          	add	a4,a4,a3
    80006f74:	0037979b          	slliw	a5,a5,0x3
    80006f78:	020046b7          	lui	a3,0x2004
    80006f7c:	00d787b3          	add	a5,a5,a3
    80006f80:	00c585b3          	add	a1,a1,a2
    80006f84:	00371693          	slli	a3,a4,0x3
    80006f88:	00005717          	auipc	a4,0x5
    80006f8c:	cd870713          	addi	a4,a4,-808 # 8000bc60 <timer_scratch>
    80006f90:	00b7b023          	sd	a1,0(a5)
    80006f94:	00d70733          	add	a4,a4,a3
    80006f98:	00f73c23          	sd	a5,24(a4)
    80006f9c:	02c73023          	sd	a2,32(a4)
    80006fa0:	34071073          	csrw	mscratch,a4
    80006fa4:	00000797          	auipc	a5,0x0
    80006fa8:	6ec78793          	addi	a5,a5,1772 # 80007690 <timervec>
    80006fac:	30579073          	csrw	mtvec,a5
    80006fb0:	300027f3          	csrr	a5,mstatus
    80006fb4:	0087e793          	ori	a5,a5,8
    80006fb8:	30079073          	csrw	mstatus,a5
    80006fbc:	304027f3          	csrr	a5,mie
    80006fc0:	0807e793          	ori	a5,a5,128
    80006fc4:	30479073          	csrw	mie,a5
    80006fc8:	f14027f3          	csrr	a5,mhartid
    80006fcc:	0007879b          	sext.w	a5,a5
    80006fd0:	00078213          	mv	tp,a5
    80006fd4:	30200073          	mret
    80006fd8:	00813403          	ld	s0,8(sp)
    80006fdc:	01010113          	addi	sp,sp,16
    80006fe0:	00008067          	ret

0000000080006fe4 <timerinit>:
    80006fe4:	ff010113          	addi	sp,sp,-16
    80006fe8:	00813423          	sd	s0,8(sp)
    80006fec:	01010413          	addi	s0,sp,16
    80006ff0:	f14027f3          	csrr	a5,mhartid
    80006ff4:	0200c737          	lui	a4,0x200c
    80006ff8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80006ffc:	0007869b          	sext.w	a3,a5
    80007000:	00269713          	slli	a4,a3,0x2
    80007004:	000f4637          	lui	a2,0xf4
    80007008:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000700c:	00d70733          	add	a4,a4,a3
    80007010:	0037979b          	slliw	a5,a5,0x3
    80007014:	020046b7          	lui	a3,0x2004
    80007018:	00d787b3          	add	a5,a5,a3
    8000701c:	00c585b3          	add	a1,a1,a2
    80007020:	00371693          	slli	a3,a4,0x3
    80007024:	00005717          	auipc	a4,0x5
    80007028:	c3c70713          	addi	a4,a4,-964 # 8000bc60 <timer_scratch>
    8000702c:	00b7b023          	sd	a1,0(a5)
    80007030:	00d70733          	add	a4,a4,a3
    80007034:	00f73c23          	sd	a5,24(a4)
    80007038:	02c73023          	sd	a2,32(a4)
    8000703c:	34071073          	csrw	mscratch,a4
    80007040:	00000797          	auipc	a5,0x0
    80007044:	65078793          	addi	a5,a5,1616 # 80007690 <timervec>
    80007048:	30579073          	csrw	mtvec,a5
    8000704c:	300027f3          	csrr	a5,mstatus
    80007050:	0087e793          	ori	a5,a5,8
    80007054:	30079073          	csrw	mstatus,a5
    80007058:	304027f3          	csrr	a5,mie
    8000705c:	0807e793          	ori	a5,a5,128
    80007060:	30479073          	csrw	mie,a5
    80007064:	00813403          	ld	s0,8(sp)
    80007068:	01010113          	addi	sp,sp,16
    8000706c:	00008067          	ret

0000000080007070 <system_main>:
    80007070:	fe010113          	addi	sp,sp,-32
    80007074:	00813823          	sd	s0,16(sp)
    80007078:	00913423          	sd	s1,8(sp)
    8000707c:	00113c23          	sd	ra,24(sp)
    80007080:	02010413          	addi	s0,sp,32
    80007084:	00000097          	auipc	ra,0x0
    80007088:	0c4080e7          	jalr	196(ra) # 80007148 <cpuid>
    8000708c:	00005497          	auipc	s1,0x5
    80007090:	a5448493          	addi	s1,s1,-1452 # 8000bae0 <started>
    80007094:	02050263          	beqz	a0,800070b8 <system_main+0x48>
    80007098:	0004a783          	lw	a5,0(s1)
    8000709c:	0007879b          	sext.w	a5,a5
    800070a0:	fe078ce3          	beqz	a5,80007098 <system_main+0x28>
    800070a4:	0ff0000f          	fence
    800070a8:	00002517          	auipc	a0,0x2
    800070ac:	65050513          	addi	a0,a0,1616 # 800096f8 <_ZZ9kPrintIntmE6digits+0x688>
    800070b0:	00001097          	auipc	ra,0x1
    800070b4:	a7c080e7          	jalr	-1412(ra) # 80007b2c <panic>
    800070b8:	00001097          	auipc	ra,0x1
    800070bc:	9d0080e7          	jalr	-1584(ra) # 80007a88 <consoleinit>
    800070c0:	00001097          	auipc	ra,0x1
    800070c4:	15c080e7          	jalr	348(ra) # 8000821c <printfinit>
    800070c8:	00002517          	auipc	a0,0x2
    800070cc:	4b850513          	addi	a0,a0,1208 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    800070d0:	00001097          	auipc	ra,0x1
    800070d4:	ab8080e7          	jalr	-1352(ra) # 80007b88 <__printf>
    800070d8:	00002517          	auipc	a0,0x2
    800070dc:	5f050513          	addi	a0,a0,1520 # 800096c8 <_ZZ9kPrintIntmE6digits+0x658>
    800070e0:	00001097          	auipc	ra,0x1
    800070e4:	aa8080e7          	jalr	-1368(ra) # 80007b88 <__printf>
    800070e8:	00002517          	auipc	a0,0x2
    800070ec:	49850513          	addi	a0,a0,1176 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    800070f0:	00001097          	auipc	ra,0x1
    800070f4:	a98080e7          	jalr	-1384(ra) # 80007b88 <__printf>
    800070f8:	00001097          	auipc	ra,0x1
    800070fc:	4b0080e7          	jalr	1200(ra) # 800085a8 <kinit>
    80007100:	00000097          	auipc	ra,0x0
    80007104:	148080e7          	jalr	328(ra) # 80007248 <trapinit>
    80007108:	00000097          	auipc	ra,0x0
    8000710c:	16c080e7          	jalr	364(ra) # 80007274 <trapinithart>
    80007110:	00000097          	auipc	ra,0x0
    80007114:	5c0080e7          	jalr	1472(ra) # 800076d0 <plicinit>
    80007118:	00000097          	auipc	ra,0x0
    8000711c:	5e0080e7          	jalr	1504(ra) # 800076f8 <plicinithart>
    80007120:	00000097          	auipc	ra,0x0
    80007124:	078080e7          	jalr	120(ra) # 80007198 <userinit>
    80007128:	0ff0000f          	fence
    8000712c:	00100793          	li	a5,1
    80007130:	00002517          	auipc	a0,0x2
    80007134:	5b050513          	addi	a0,a0,1456 # 800096e0 <_ZZ9kPrintIntmE6digits+0x670>
    80007138:	00f4a023          	sw	a5,0(s1)
    8000713c:	00001097          	auipc	ra,0x1
    80007140:	a4c080e7          	jalr	-1460(ra) # 80007b88 <__printf>
    80007144:	0000006f          	j	80007144 <system_main+0xd4>

0000000080007148 <cpuid>:
    80007148:	ff010113          	addi	sp,sp,-16
    8000714c:	00813423          	sd	s0,8(sp)
    80007150:	01010413          	addi	s0,sp,16
    80007154:	00020513          	mv	a0,tp
    80007158:	00813403          	ld	s0,8(sp)
    8000715c:	0005051b          	sext.w	a0,a0
    80007160:	01010113          	addi	sp,sp,16
    80007164:	00008067          	ret

0000000080007168 <mycpu>:
    80007168:	ff010113          	addi	sp,sp,-16
    8000716c:	00813423          	sd	s0,8(sp)
    80007170:	01010413          	addi	s0,sp,16
    80007174:	00020793          	mv	a5,tp
    80007178:	00813403          	ld	s0,8(sp)
    8000717c:	0007879b          	sext.w	a5,a5
    80007180:	00779793          	slli	a5,a5,0x7
    80007184:	00006517          	auipc	a0,0x6
    80007188:	b0c50513          	addi	a0,a0,-1268 # 8000cc90 <cpus>
    8000718c:	00f50533          	add	a0,a0,a5
    80007190:	01010113          	addi	sp,sp,16
    80007194:	00008067          	ret

0000000080007198 <userinit>:
    80007198:	ff010113          	addi	sp,sp,-16
    8000719c:	00813423          	sd	s0,8(sp)
    800071a0:	01010413          	addi	s0,sp,16
    800071a4:	00813403          	ld	s0,8(sp)
    800071a8:	01010113          	addi	sp,sp,16
    800071ac:	ffffb317          	auipc	t1,0xffffb
    800071b0:	ac830067          	jr	-1336(t1) # 80001c74 <main>

00000000800071b4 <either_copyout>:
    800071b4:	ff010113          	addi	sp,sp,-16
    800071b8:	00813023          	sd	s0,0(sp)
    800071bc:	00113423          	sd	ra,8(sp)
    800071c0:	01010413          	addi	s0,sp,16
    800071c4:	02051663          	bnez	a0,800071f0 <either_copyout+0x3c>
    800071c8:	00058513          	mv	a0,a1
    800071cc:	00060593          	mv	a1,a2
    800071d0:	0006861b          	sext.w	a2,a3
    800071d4:	00002097          	auipc	ra,0x2
    800071d8:	c60080e7          	jalr	-928(ra) # 80008e34 <__memmove>
    800071dc:	00813083          	ld	ra,8(sp)
    800071e0:	00013403          	ld	s0,0(sp)
    800071e4:	00000513          	li	a0,0
    800071e8:	01010113          	addi	sp,sp,16
    800071ec:	00008067          	ret
    800071f0:	00002517          	auipc	a0,0x2
    800071f4:	53050513          	addi	a0,a0,1328 # 80009720 <_ZZ9kPrintIntmE6digits+0x6b0>
    800071f8:	00001097          	auipc	ra,0x1
    800071fc:	934080e7          	jalr	-1740(ra) # 80007b2c <panic>

0000000080007200 <either_copyin>:
    80007200:	ff010113          	addi	sp,sp,-16
    80007204:	00813023          	sd	s0,0(sp)
    80007208:	00113423          	sd	ra,8(sp)
    8000720c:	01010413          	addi	s0,sp,16
    80007210:	02059463          	bnez	a1,80007238 <either_copyin+0x38>
    80007214:	00060593          	mv	a1,a2
    80007218:	0006861b          	sext.w	a2,a3
    8000721c:	00002097          	auipc	ra,0x2
    80007220:	c18080e7          	jalr	-1000(ra) # 80008e34 <__memmove>
    80007224:	00813083          	ld	ra,8(sp)
    80007228:	00013403          	ld	s0,0(sp)
    8000722c:	00000513          	li	a0,0
    80007230:	01010113          	addi	sp,sp,16
    80007234:	00008067          	ret
    80007238:	00002517          	auipc	a0,0x2
    8000723c:	51050513          	addi	a0,a0,1296 # 80009748 <_ZZ9kPrintIntmE6digits+0x6d8>
    80007240:	00001097          	auipc	ra,0x1
    80007244:	8ec080e7          	jalr	-1812(ra) # 80007b2c <panic>

0000000080007248 <trapinit>:
    80007248:	ff010113          	addi	sp,sp,-16
    8000724c:	00813423          	sd	s0,8(sp)
    80007250:	01010413          	addi	s0,sp,16
    80007254:	00813403          	ld	s0,8(sp)
    80007258:	00002597          	auipc	a1,0x2
    8000725c:	51858593          	addi	a1,a1,1304 # 80009770 <_ZZ9kPrintIntmE6digits+0x700>
    80007260:	00006517          	auipc	a0,0x6
    80007264:	ab050513          	addi	a0,a0,-1360 # 8000cd10 <tickslock>
    80007268:	01010113          	addi	sp,sp,16
    8000726c:	00001317          	auipc	t1,0x1
    80007270:	5cc30067          	jr	1484(t1) # 80008838 <initlock>

0000000080007274 <trapinithart>:
    80007274:	ff010113          	addi	sp,sp,-16
    80007278:	00813423          	sd	s0,8(sp)
    8000727c:	01010413          	addi	s0,sp,16
    80007280:	00000797          	auipc	a5,0x0
    80007284:	30078793          	addi	a5,a5,768 # 80007580 <kernelvec>
    80007288:	10579073          	csrw	stvec,a5
    8000728c:	00813403          	ld	s0,8(sp)
    80007290:	01010113          	addi	sp,sp,16
    80007294:	00008067          	ret

0000000080007298 <usertrap>:
    80007298:	ff010113          	addi	sp,sp,-16
    8000729c:	00813423          	sd	s0,8(sp)
    800072a0:	01010413          	addi	s0,sp,16
    800072a4:	00813403          	ld	s0,8(sp)
    800072a8:	01010113          	addi	sp,sp,16
    800072ac:	00008067          	ret

00000000800072b0 <usertrapret>:
    800072b0:	ff010113          	addi	sp,sp,-16
    800072b4:	00813423          	sd	s0,8(sp)
    800072b8:	01010413          	addi	s0,sp,16
    800072bc:	00813403          	ld	s0,8(sp)
    800072c0:	01010113          	addi	sp,sp,16
    800072c4:	00008067          	ret

00000000800072c8 <kerneltrap>:
    800072c8:	fe010113          	addi	sp,sp,-32
    800072cc:	00813823          	sd	s0,16(sp)
    800072d0:	00113c23          	sd	ra,24(sp)
    800072d4:	00913423          	sd	s1,8(sp)
    800072d8:	02010413          	addi	s0,sp,32
    800072dc:	142025f3          	csrr	a1,scause
    800072e0:	100027f3          	csrr	a5,sstatus
    800072e4:	0027f793          	andi	a5,a5,2
    800072e8:	10079c63          	bnez	a5,80007400 <kerneltrap+0x138>
    800072ec:	142027f3          	csrr	a5,scause
    800072f0:	0207ce63          	bltz	a5,8000732c <kerneltrap+0x64>
    800072f4:	00002517          	auipc	a0,0x2
    800072f8:	4c450513          	addi	a0,a0,1220 # 800097b8 <_ZZ9kPrintIntmE6digits+0x748>
    800072fc:	00001097          	auipc	ra,0x1
    80007300:	88c080e7          	jalr	-1908(ra) # 80007b88 <__printf>
    80007304:	141025f3          	csrr	a1,sepc
    80007308:	14302673          	csrr	a2,stval
    8000730c:	00002517          	auipc	a0,0x2
    80007310:	4bc50513          	addi	a0,a0,1212 # 800097c8 <_ZZ9kPrintIntmE6digits+0x758>
    80007314:	00001097          	auipc	ra,0x1
    80007318:	874080e7          	jalr	-1932(ra) # 80007b88 <__printf>
    8000731c:	00002517          	auipc	a0,0x2
    80007320:	4c450513          	addi	a0,a0,1220 # 800097e0 <_ZZ9kPrintIntmE6digits+0x770>
    80007324:	00001097          	auipc	ra,0x1
    80007328:	808080e7          	jalr	-2040(ra) # 80007b2c <panic>
    8000732c:	0ff7f713          	andi	a4,a5,255
    80007330:	00900693          	li	a3,9
    80007334:	04d70063          	beq	a4,a3,80007374 <kerneltrap+0xac>
    80007338:	fff00713          	li	a4,-1
    8000733c:	03f71713          	slli	a4,a4,0x3f
    80007340:	00170713          	addi	a4,a4,1
    80007344:	fae798e3          	bne	a5,a4,800072f4 <kerneltrap+0x2c>
    80007348:	00000097          	auipc	ra,0x0
    8000734c:	e00080e7          	jalr	-512(ra) # 80007148 <cpuid>
    80007350:	06050663          	beqz	a0,800073bc <kerneltrap+0xf4>
    80007354:	144027f3          	csrr	a5,sip
    80007358:	ffd7f793          	andi	a5,a5,-3
    8000735c:	14479073          	csrw	sip,a5
    80007360:	01813083          	ld	ra,24(sp)
    80007364:	01013403          	ld	s0,16(sp)
    80007368:	00813483          	ld	s1,8(sp)
    8000736c:	02010113          	addi	sp,sp,32
    80007370:	00008067          	ret
    80007374:	00000097          	auipc	ra,0x0
    80007378:	3d0080e7          	jalr	976(ra) # 80007744 <plic_claim>
    8000737c:	00a00793          	li	a5,10
    80007380:	00050493          	mv	s1,a0
    80007384:	06f50863          	beq	a0,a5,800073f4 <kerneltrap+0x12c>
    80007388:	fc050ce3          	beqz	a0,80007360 <kerneltrap+0x98>
    8000738c:	00050593          	mv	a1,a0
    80007390:	00002517          	auipc	a0,0x2
    80007394:	40850513          	addi	a0,a0,1032 # 80009798 <_ZZ9kPrintIntmE6digits+0x728>
    80007398:	00000097          	auipc	ra,0x0
    8000739c:	7f0080e7          	jalr	2032(ra) # 80007b88 <__printf>
    800073a0:	01013403          	ld	s0,16(sp)
    800073a4:	01813083          	ld	ra,24(sp)
    800073a8:	00048513          	mv	a0,s1
    800073ac:	00813483          	ld	s1,8(sp)
    800073b0:	02010113          	addi	sp,sp,32
    800073b4:	00000317          	auipc	t1,0x0
    800073b8:	3c830067          	jr	968(t1) # 8000777c <plic_complete>
    800073bc:	00006517          	auipc	a0,0x6
    800073c0:	95450513          	addi	a0,a0,-1708 # 8000cd10 <tickslock>
    800073c4:	00001097          	auipc	ra,0x1
    800073c8:	498080e7          	jalr	1176(ra) # 8000885c <acquire>
    800073cc:	00004717          	auipc	a4,0x4
    800073d0:	71870713          	addi	a4,a4,1816 # 8000bae4 <ticks>
    800073d4:	00072783          	lw	a5,0(a4)
    800073d8:	00006517          	auipc	a0,0x6
    800073dc:	93850513          	addi	a0,a0,-1736 # 8000cd10 <tickslock>
    800073e0:	0017879b          	addiw	a5,a5,1
    800073e4:	00f72023          	sw	a5,0(a4)
    800073e8:	00001097          	auipc	ra,0x1
    800073ec:	540080e7          	jalr	1344(ra) # 80008928 <release>
    800073f0:	f65ff06f          	j	80007354 <kerneltrap+0x8c>
    800073f4:	00001097          	auipc	ra,0x1
    800073f8:	09c080e7          	jalr	156(ra) # 80008490 <uartintr>
    800073fc:	fa5ff06f          	j	800073a0 <kerneltrap+0xd8>
    80007400:	00002517          	auipc	a0,0x2
    80007404:	37850513          	addi	a0,a0,888 # 80009778 <_ZZ9kPrintIntmE6digits+0x708>
    80007408:	00000097          	auipc	ra,0x0
    8000740c:	724080e7          	jalr	1828(ra) # 80007b2c <panic>

0000000080007410 <clockintr>:
    80007410:	fe010113          	addi	sp,sp,-32
    80007414:	00813823          	sd	s0,16(sp)
    80007418:	00913423          	sd	s1,8(sp)
    8000741c:	00113c23          	sd	ra,24(sp)
    80007420:	02010413          	addi	s0,sp,32
    80007424:	00006497          	auipc	s1,0x6
    80007428:	8ec48493          	addi	s1,s1,-1812 # 8000cd10 <tickslock>
    8000742c:	00048513          	mv	a0,s1
    80007430:	00001097          	auipc	ra,0x1
    80007434:	42c080e7          	jalr	1068(ra) # 8000885c <acquire>
    80007438:	00004717          	auipc	a4,0x4
    8000743c:	6ac70713          	addi	a4,a4,1708 # 8000bae4 <ticks>
    80007440:	00072783          	lw	a5,0(a4)
    80007444:	01013403          	ld	s0,16(sp)
    80007448:	01813083          	ld	ra,24(sp)
    8000744c:	00048513          	mv	a0,s1
    80007450:	0017879b          	addiw	a5,a5,1
    80007454:	00813483          	ld	s1,8(sp)
    80007458:	00f72023          	sw	a5,0(a4)
    8000745c:	02010113          	addi	sp,sp,32
    80007460:	00001317          	auipc	t1,0x1
    80007464:	4c830067          	jr	1224(t1) # 80008928 <release>

0000000080007468 <devintr>:
    80007468:	142027f3          	csrr	a5,scause
    8000746c:	00000513          	li	a0,0
    80007470:	0007c463          	bltz	a5,80007478 <devintr+0x10>
    80007474:	00008067          	ret
    80007478:	fe010113          	addi	sp,sp,-32
    8000747c:	00813823          	sd	s0,16(sp)
    80007480:	00113c23          	sd	ra,24(sp)
    80007484:	00913423          	sd	s1,8(sp)
    80007488:	02010413          	addi	s0,sp,32
    8000748c:	0ff7f713          	andi	a4,a5,255
    80007490:	00900693          	li	a3,9
    80007494:	04d70c63          	beq	a4,a3,800074ec <devintr+0x84>
    80007498:	fff00713          	li	a4,-1
    8000749c:	03f71713          	slli	a4,a4,0x3f
    800074a0:	00170713          	addi	a4,a4,1
    800074a4:	00e78c63          	beq	a5,a4,800074bc <devintr+0x54>
    800074a8:	01813083          	ld	ra,24(sp)
    800074ac:	01013403          	ld	s0,16(sp)
    800074b0:	00813483          	ld	s1,8(sp)
    800074b4:	02010113          	addi	sp,sp,32
    800074b8:	00008067          	ret
    800074bc:	00000097          	auipc	ra,0x0
    800074c0:	c8c080e7          	jalr	-884(ra) # 80007148 <cpuid>
    800074c4:	06050663          	beqz	a0,80007530 <devintr+0xc8>
    800074c8:	144027f3          	csrr	a5,sip
    800074cc:	ffd7f793          	andi	a5,a5,-3
    800074d0:	14479073          	csrw	sip,a5
    800074d4:	01813083          	ld	ra,24(sp)
    800074d8:	01013403          	ld	s0,16(sp)
    800074dc:	00813483          	ld	s1,8(sp)
    800074e0:	00200513          	li	a0,2
    800074e4:	02010113          	addi	sp,sp,32
    800074e8:	00008067          	ret
    800074ec:	00000097          	auipc	ra,0x0
    800074f0:	258080e7          	jalr	600(ra) # 80007744 <plic_claim>
    800074f4:	00a00793          	li	a5,10
    800074f8:	00050493          	mv	s1,a0
    800074fc:	06f50663          	beq	a0,a5,80007568 <devintr+0x100>
    80007500:	00100513          	li	a0,1
    80007504:	fa0482e3          	beqz	s1,800074a8 <devintr+0x40>
    80007508:	00048593          	mv	a1,s1
    8000750c:	00002517          	auipc	a0,0x2
    80007510:	28c50513          	addi	a0,a0,652 # 80009798 <_ZZ9kPrintIntmE6digits+0x728>
    80007514:	00000097          	auipc	ra,0x0
    80007518:	674080e7          	jalr	1652(ra) # 80007b88 <__printf>
    8000751c:	00048513          	mv	a0,s1
    80007520:	00000097          	auipc	ra,0x0
    80007524:	25c080e7          	jalr	604(ra) # 8000777c <plic_complete>
    80007528:	00100513          	li	a0,1
    8000752c:	f7dff06f          	j	800074a8 <devintr+0x40>
    80007530:	00005517          	auipc	a0,0x5
    80007534:	7e050513          	addi	a0,a0,2016 # 8000cd10 <tickslock>
    80007538:	00001097          	auipc	ra,0x1
    8000753c:	324080e7          	jalr	804(ra) # 8000885c <acquire>
    80007540:	00004717          	auipc	a4,0x4
    80007544:	5a470713          	addi	a4,a4,1444 # 8000bae4 <ticks>
    80007548:	00072783          	lw	a5,0(a4)
    8000754c:	00005517          	auipc	a0,0x5
    80007550:	7c450513          	addi	a0,a0,1988 # 8000cd10 <tickslock>
    80007554:	0017879b          	addiw	a5,a5,1
    80007558:	00f72023          	sw	a5,0(a4)
    8000755c:	00001097          	auipc	ra,0x1
    80007560:	3cc080e7          	jalr	972(ra) # 80008928 <release>
    80007564:	f65ff06f          	j	800074c8 <devintr+0x60>
    80007568:	00001097          	auipc	ra,0x1
    8000756c:	f28080e7          	jalr	-216(ra) # 80008490 <uartintr>
    80007570:	fadff06f          	j	8000751c <devintr+0xb4>
	...

0000000080007580 <kernelvec>:
    80007580:	f0010113          	addi	sp,sp,-256
    80007584:	00113023          	sd	ra,0(sp)
    80007588:	00213423          	sd	sp,8(sp)
    8000758c:	00313823          	sd	gp,16(sp)
    80007590:	00413c23          	sd	tp,24(sp)
    80007594:	02513023          	sd	t0,32(sp)
    80007598:	02613423          	sd	t1,40(sp)
    8000759c:	02713823          	sd	t2,48(sp)
    800075a0:	02813c23          	sd	s0,56(sp)
    800075a4:	04913023          	sd	s1,64(sp)
    800075a8:	04a13423          	sd	a0,72(sp)
    800075ac:	04b13823          	sd	a1,80(sp)
    800075b0:	04c13c23          	sd	a2,88(sp)
    800075b4:	06d13023          	sd	a3,96(sp)
    800075b8:	06e13423          	sd	a4,104(sp)
    800075bc:	06f13823          	sd	a5,112(sp)
    800075c0:	07013c23          	sd	a6,120(sp)
    800075c4:	09113023          	sd	a7,128(sp)
    800075c8:	09213423          	sd	s2,136(sp)
    800075cc:	09313823          	sd	s3,144(sp)
    800075d0:	09413c23          	sd	s4,152(sp)
    800075d4:	0b513023          	sd	s5,160(sp)
    800075d8:	0b613423          	sd	s6,168(sp)
    800075dc:	0b713823          	sd	s7,176(sp)
    800075e0:	0b813c23          	sd	s8,184(sp)
    800075e4:	0d913023          	sd	s9,192(sp)
    800075e8:	0da13423          	sd	s10,200(sp)
    800075ec:	0db13823          	sd	s11,208(sp)
    800075f0:	0dc13c23          	sd	t3,216(sp)
    800075f4:	0fd13023          	sd	t4,224(sp)
    800075f8:	0fe13423          	sd	t5,232(sp)
    800075fc:	0ff13823          	sd	t6,240(sp)
    80007600:	cc9ff0ef          	jal	ra,800072c8 <kerneltrap>
    80007604:	00013083          	ld	ra,0(sp)
    80007608:	00813103          	ld	sp,8(sp)
    8000760c:	01013183          	ld	gp,16(sp)
    80007610:	02013283          	ld	t0,32(sp)
    80007614:	02813303          	ld	t1,40(sp)
    80007618:	03013383          	ld	t2,48(sp)
    8000761c:	03813403          	ld	s0,56(sp)
    80007620:	04013483          	ld	s1,64(sp)
    80007624:	04813503          	ld	a0,72(sp)
    80007628:	05013583          	ld	a1,80(sp)
    8000762c:	05813603          	ld	a2,88(sp)
    80007630:	06013683          	ld	a3,96(sp)
    80007634:	06813703          	ld	a4,104(sp)
    80007638:	07013783          	ld	a5,112(sp)
    8000763c:	07813803          	ld	a6,120(sp)
    80007640:	08013883          	ld	a7,128(sp)
    80007644:	08813903          	ld	s2,136(sp)
    80007648:	09013983          	ld	s3,144(sp)
    8000764c:	09813a03          	ld	s4,152(sp)
    80007650:	0a013a83          	ld	s5,160(sp)
    80007654:	0a813b03          	ld	s6,168(sp)
    80007658:	0b013b83          	ld	s7,176(sp)
    8000765c:	0b813c03          	ld	s8,184(sp)
    80007660:	0c013c83          	ld	s9,192(sp)
    80007664:	0c813d03          	ld	s10,200(sp)
    80007668:	0d013d83          	ld	s11,208(sp)
    8000766c:	0d813e03          	ld	t3,216(sp)
    80007670:	0e013e83          	ld	t4,224(sp)
    80007674:	0e813f03          	ld	t5,232(sp)
    80007678:	0f013f83          	ld	t6,240(sp)
    8000767c:	10010113          	addi	sp,sp,256
    80007680:	10200073          	sret
    80007684:	00000013          	nop
    80007688:	00000013          	nop
    8000768c:	00000013          	nop

0000000080007690 <timervec>:
    80007690:	34051573          	csrrw	a0,mscratch,a0
    80007694:	00b53023          	sd	a1,0(a0)
    80007698:	00c53423          	sd	a2,8(a0)
    8000769c:	00d53823          	sd	a3,16(a0)
    800076a0:	01853583          	ld	a1,24(a0)
    800076a4:	02053603          	ld	a2,32(a0)
    800076a8:	0005b683          	ld	a3,0(a1)
    800076ac:	00c686b3          	add	a3,a3,a2
    800076b0:	00d5b023          	sd	a3,0(a1)
    800076b4:	00200593          	li	a1,2
    800076b8:	14459073          	csrw	sip,a1
    800076bc:	01053683          	ld	a3,16(a0)
    800076c0:	00853603          	ld	a2,8(a0)
    800076c4:	00053583          	ld	a1,0(a0)
    800076c8:	34051573          	csrrw	a0,mscratch,a0
    800076cc:	30200073          	mret

00000000800076d0 <plicinit>:
    800076d0:	ff010113          	addi	sp,sp,-16
    800076d4:	00813423          	sd	s0,8(sp)
    800076d8:	01010413          	addi	s0,sp,16
    800076dc:	00813403          	ld	s0,8(sp)
    800076e0:	0c0007b7          	lui	a5,0xc000
    800076e4:	00100713          	li	a4,1
    800076e8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800076ec:	00e7a223          	sw	a4,4(a5)
    800076f0:	01010113          	addi	sp,sp,16
    800076f4:	00008067          	ret

00000000800076f8 <plicinithart>:
    800076f8:	ff010113          	addi	sp,sp,-16
    800076fc:	00813023          	sd	s0,0(sp)
    80007700:	00113423          	sd	ra,8(sp)
    80007704:	01010413          	addi	s0,sp,16
    80007708:	00000097          	auipc	ra,0x0
    8000770c:	a40080e7          	jalr	-1472(ra) # 80007148 <cpuid>
    80007710:	0085171b          	slliw	a4,a0,0x8
    80007714:	0c0027b7          	lui	a5,0xc002
    80007718:	00e787b3          	add	a5,a5,a4
    8000771c:	40200713          	li	a4,1026
    80007720:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80007724:	00813083          	ld	ra,8(sp)
    80007728:	00013403          	ld	s0,0(sp)
    8000772c:	00d5151b          	slliw	a0,a0,0xd
    80007730:	0c2017b7          	lui	a5,0xc201
    80007734:	00a78533          	add	a0,a5,a0
    80007738:	00052023          	sw	zero,0(a0)
    8000773c:	01010113          	addi	sp,sp,16
    80007740:	00008067          	ret

0000000080007744 <plic_claim>:
    80007744:	ff010113          	addi	sp,sp,-16
    80007748:	00813023          	sd	s0,0(sp)
    8000774c:	00113423          	sd	ra,8(sp)
    80007750:	01010413          	addi	s0,sp,16
    80007754:	00000097          	auipc	ra,0x0
    80007758:	9f4080e7          	jalr	-1548(ra) # 80007148 <cpuid>
    8000775c:	00813083          	ld	ra,8(sp)
    80007760:	00013403          	ld	s0,0(sp)
    80007764:	00d5151b          	slliw	a0,a0,0xd
    80007768:	0c2017b7          	lui	a5,0xc201
    8000776c:	00a78533          	add	a0,a5,a0
    80007770:	00452503          	lw	a0,4(a0)
    80007774:	01010113          	addi	sp,sp,16
    80007778:	00008067          	ret

000000008000777c <plic_complete>:
    8000777c:	fe010113          	addi	sp,sp,-32
    80007780:	00813823          	sd	s0,16(sp)
    80007784:	00913423          	sd	s1,8(sp)
    80007788:	00113c23          	sd	ra,24(sp)
    8000778c:	02010413          	addi	s0,sp,32
    80007790:	00050493          	mv	s1,a0
    80007794:	00000097          	auipc	ra,0x0
    80007798:	9b4080e7          	jalr	-1612(ra) # 80007148 <cpuid>
    8000779c:	01813083          	ld	ra,24(sp)
    800077a0:	01013403          	ld	s0,16(sp)
    800077a4:	00d5179b          	slliw	a5,a0,0xd
    800077a8:	0c201737          	lui	a4,0xc201
    800077ac:	00f707b3          	add	a5,a4,a5
    800077b0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800077b4:	00813483          	ld	s1,8(sp)
    800077b8:	02010113          	addi	sp,sp,32
    800077bc:	00008067          	ret

00000000800077c0 <consolewrite>:
    800077c0:	fb010113          	addi	sp,sp,-80
    800077c4:	04813023          	sd	s0,64(sp)
    800077c8:	04113423          	sd	ra,72(sp)
    800077cc:	02913c23          	sd	s1,56(sp)
    800077d0:	03213823          	sd	s2,48(sp)
    800077d4:	03313423          	sd	s3,40(sp)
    800077d8:	03413023          	sd	s4,32(sp)
    800077dc:	01513c23          	sd	s5,24(sp)
    800077e0:	05010413          	addi	s0,sp,80
    800077e4:	06c05c63          	blez	a2,8000785c <consolewrite+0x9c>
    800077e8:	00060993          	mv	s3,a2
    800077ec:	00050a13          	mv	s4,a0
    800077f0:	00058493          	mv	s1,a1
    800077f4:	00000913          	li	s2,0
    800077f8:	fff00a93          	li	s5,-1
    800077fc:	01c0006f          	j	80007818 <consolewrite+0x58>
    80007800:	fbf44503          	lbu	a0,-65(s0)
    80007804:	0019091b          	addiw	s2,s2,1
    80007808:	00148493          	addi	s1,s1,1
    8000780c:	00001097          	auipc	ra,0x1
    80007810:	a9c080e7          	jalr	-1380(ra) # 800082a8 <uartputc>
    80007814:	03298063          	beq	s3,s2,80007834 <consolewrite+0x74>
    80007818:	00048613          	mv	a2,s1
    8000781c:	00100693          	li	a3,1
    80007820:	000a0593          	mv	a1,s4
    80007824:	fbf40513          	addi	a0,s0,-65
    80007828:	00000097          	auipc	ra,0x0
    8000782c:	9d8080e7          	jalr	-1576(ra) # 80007200 <either_copyin>
    80007830:	fd5518e3          	bne	a0,s5,80007800 <consolewrite+0x40>
    80007834:	04813083          	ld	ra,72(sp)
    80007838:	04013403          	ld	s0,64(sp)
    8000783c:	03813483          	ld	s1,56(sp)
    80007840:	02813983          	ld	s3,40(sp)
    80007844:	02013a03          	ld	s4,32(sp)
    80007848:	01813a83          	ld	s5,24(sp)
    8000784c:	00090513          	mv	a0,s2
    80007850:	03013903          	ld	s2,48(sp)
    80007854:	05010113          	addi	sp,sp,80
    80007858:	00008067          	ret
    8000785c:	00000913          	li	s2,0
    80007860:	fd5ff06f          	j	80007834 <consolewrite+0x74>

0000000080007864 <consoleread>:
    80007864:	f9010113          	addi	sp,sp,-112
    80007868:	06813023          	sd	s0,96(sp)
    8000786c:	04913c23          	sd	s1,88(sp)
    80007870:	05213823          	sd	s2,80(sp)
    80007874:	05313423          	sd	s3,72(sp)
    80007878:	05413023          	sd	s4,64(sp)
    8000787c:	03513c23          	sd	s5,56(sp)
    80007880:	03613823          	sd	s6,48(sp)
    80007884:	03713423          	sd	s7,40(sp)
    80007888:	03813023          	sd	s8,32(sp)
    8000788c:	06113423          	sd	ra,104(sp)
    80007890:	01913c23          	sd	s9,24(sp)
    80007894:	07010413          	addi	s0,sp,112
    80007898:	00060b93          	mv	s7,a2
    8000789c:	00050913          	mv	s2,a0
    800078a0:	00058c13          	mv	s8,a1
    800078a4:	00060b1b          	sext.w	s6,a2
    800078a8:	00005497          	auipc	s1,0x5
    800078ac:	49048493          	addi	s1,s1,1168 # 8000cd38 <cons>
    800078b0:	00400993          	li	s3,4
    800078b4:	fff00a13          	li	s4,-1
    800078b8:	00a00a93          	li	s5,10
    800078bc:	05705e63          	blez	s7,80007918 <consoleread+0xb4>
    800078c0:	09c4a703          	lw	a4,156(s1)
    800078c4:	0984a783          	lw	a5,152(s1)
    800078c8:	0007071b          	sext.w	a4,a4
    800078cc:	08e78463          	beq	a5,a4,80007954 <consoleread+0xf0>
    800078d0:	07f7f713          	andi	a4,a5,127
    800078d4:	00e48733          	add	a4,s1,a4
    800078d8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800078dc:	0017869b          	addiw	a3,a5,1
    800078e0:	08d4ac23          	sw	a3,152(s1)
    800078e4:	00070c9b          	sext.w	s9,a4
    800078e8:	0b370663          	beq	a4,s3,80007994 <consoleread+0x130>
    800078ec:	00100693          	li	a3,1
    800078f0:	f9f40613          	addi	a2,s0,-97
    800078f4:	000c0593          	mv	a1,s8
    800078f8:	00090513          	mv	a0,s2
    800078fc:	f8e40fa3          	sb	a4,-97(s0)
    80007900:	00000097          	auipc	ra,0x0
    80007904:	8b4080e7          	jalr	-1868(ra) # 800071b4 <either_copyout>
    80007908:	01450863          	beq	a0,s4,80007918 <consoleread+0xb4>
    8000790c:	001c0c13          	addi	s8,s8,1
    80007910:	fffb8b9b          	addiw	s7,s7,-1
    80007914:	fb5c94e3          	bne	s9,s5,800078bc <consoleread+0x58>
    80007918:	000b851b          	sext.w	a0,s7
    8000791c:	06813083          	ld	ra,104(sp)
    80007920:	06013403          	ld	s0,96(sp)
    80007924:	05813483          	ld	s1,88(sp)
    80007928:	05013903          	ld	s2,80(sp)
    8000792c:	04813983          	ld	s3,72(sp)
    80007930:	04013a03          	ld	s4,64(sp)
    80007934:	03813a83          	ld	s5,56(sp)
    80007938:	02813b83          	ld	s7,40(sp)
    8000793c:	02013c03          	ld	s8,32(sp)
    80007940:	01813c83          	ld	s9,24(sp)
    80007944:	40ab053b          	subw	a0,s6,a0
    80007948:	03013b03          	ld	s6,48(sp)
    8000794c:	07010113          	addi	sp,sp,112
    80007950:	00008067          	ret
    80007954:	00001097          	auipc	ra,0x1
    80007958:	1d8080e7          	jalr	472(ra) # 80008b2c <push_on>
    8000795c:	0984a703          	lw	a4,152(s1)
    80007960:	09c4a783          	lw	a5,156(s1)
    80007964:	0007879b          	sext.w	a5,a5
    80007968:	fef70ce3          	beq	a4,a5,80007960 <consoleread+0xfc>
    8000796c:	00001097          	auipc	ra,0x1
    80007970:	234080e7          	jalr	564(ra) # 80008ba0 <pop_on>
    80007974:	0984a783          	lw	a5,152(s1)
    80007978:	07f7f713          	andi	a4,a5,127
    8000797c:	00e48733          	add	a4,s1,a4
    80007980:	01874703          	lbu	a4,24(a4)
    80007984:	0017869b          	addiw	a3,a5,1
    80007988:	08d4ac23          	sw	a3,152(s1)
    8000798c:	00070c9b          	sext.w	s9,a4
    80007990:	f5371ee3          	bne	a4,s3,800078ec <consoleread+0x88>
    80007994:	000b851b          	sext.w	a0,s7
    80007998:	f96bf2e3          	bgeu	s7,s6,8000791c <consoleread+0xb8>
    8000799c:	08f4ac23          	sw	a5,152(s1)
    800079a0:	f7dff06f          	j	8000791c <consoleread+0xb8>

00000000800079a4 <consputc>:
    800079a4:	10000793          	li	a5,256
    800079a8:	00f50663          	beq	a0,a5,800079b4 <consputc+0x10>
    800079ac:	00001317          	auipc	t1,0x1
    800079b0:	9f430067          	jr	-1548(t1) # 800083a0 <uartputc_sync>
    800079b4:	ff010113          	addi	sp,sp,-16
    800079b8:	00113423          	sd	ra,8(sp)
    800079bc:	00813023          	sd	s0,0(sp)
    800079c0:	01010413          	addi	s0,sp,16
    800079c4:	00800513          	li	a0,8
    800079c8:	00001097          	auipc	ra,0x1
    800079cc:	9d8080e7          	jalr	-1576(ra) # 800083a0 <uartputc_sync>
    800079d0:	02000513          	li	a0,32
    800079d4:	00001097          	auipc	ra,0x1
    800079d8:	9cc080e7          	jalr	-1588(ra) # 800083a0 <uartputc_sync>
    800079dc:	00013403          	ld	s0,0(sp)
    800079e0:	00813083          	ld	ra,8(sp)
    800079e4:	00800513          	li	a0,8
    800079e8:	01010113          	addi	sp,sp,16
    800079ec:	00001317          	auipc	t1,0x1
    800079f0:	9b430067          	jr	-1612(t1) # 800083a0 <uartputc_sync>

00000000800079f4 <consoleintr>:
    800079f4:	fe010113          	addi	sp,sp,-32
    800079f8:	00813823          	sd	s0,16(sp)
    800079fc:	00913423          	sd	s1,8(sp)
    80007a00:	01213023          	sd	s2,0(sp)
    80007a04:	00113c23          	sd	ra,24(sp)
    80007a08:	02010413          	addi	s0,sp,32
    80007a0c:	00005917          	auipc	s2,0x5
    80007a10:	32c90913          	addi	s2,s2,812 # 8000cd38 <cons>
    80007a14:	00050493          	mv	s1,a0
    80007a18:	00090513          	mv	a0,s2
    80007a1c:	00001097          	auipc	ra,0x1
    80007a20:	e40080e7          	jalr	-448(ra) # 8000885c <acquire>
    80007a24:	02048c63          	beqz	s1,80007a5c <consoleintr+0x68>
    80007a28:	0a092783          	lw	a5,160(s2)
    80007a2c:	09892703          	lw	a4,152(s2)
    80007a30:	07f00693          	li	a3,127
    80007a34:	40e7873b          	subw	a4,a5,a4
    80007a38:	02e6e263          	bltu	a3,a4,80007a5c <consoleintr+0x68>
    80007a3c:	00d00713          	li	a4,13
    80007a40:	04e48063          	beq	s1,a4,80007a80 <consoleintr+0x8c>
    80007a44:	07f7f713          	andi	a4,a5,127
    80007a48:	00e90733          	add	a4,s2,a4
    80007a4c:	0017879b          	addiw	a5,a5,1
    80007a50:	0af92023          	sw	a5,160(s2)
    80007a54:	00970c23          	sb	s1,24(a4)
    80007a58:	08f92e23          	sw	a5,156(s2)
    80007a5c:	01013403          	ld	s0,16(sp)
    80007a60:	01813083          	ld	ra,24(sp)
    80007a64:	00813483          	ld	s1,8(sp)
    80007a68:	00013903          	ld	s2,0(sp)
    80007a6c:	00005517          	auipc	a0,0x5
    80007a70:	2cc50513          	addi	a0,a0,716 # 8000cd38 <cons>
    80007a74:	02010113          	addi	sp,sp,32
    80007a78:	00001317          	auipc	t1,0x1
    80007a7c:	eb030067          	jr	-336(t1) # 80008928 <release>
    80007a80:	00a00493          	li	s1,10
    80007a84:	fc1ff06f          	j	80007a44 <consoleintr+0x50>

0000000080007a88 <consoleinit>:
    80007a88:	fe010113          	addi	sp,sp,-32
    80007a8c:	00113c23          	sd	ra,24(sp)
    80007a90:	00813823          	sd	s0,16(sp)
    80007a94:	00913423          	sd	s1,8(sp)
    80007a98:	02010413          	addi	s0,sp,32
    80007a9c:	00005497          	auipc	s1,0x5
    80007aa0:	29c48493          	addi	s1,s1,668 # 8000cd38 <cons>
    80007aa4:	00048513          	mv	a0,s1
    80007aa8:	00002597          	auipc	a1,0x2
    80007aac:	d4858593          	addi	a1,a1,-696 # 800097f0 <_ZZ9kPrintIntmE6digits+0x780>
    80007ab0:	00001097          	auipc	ra,0x1
    80007ab4:	d88080e7          	jalr	-632(ra) # 80008838 <initlock>
    80007ab8:	00000097          	auipc	ra,0x0
    80007abc:	7ac080e7          	jalr	1964(ra) # 80008264 <uartinit>
    80007ac0:	01813083          	ld	ra,24(sp)
    80007ac4:	01013403          	ld	s0,16(sp)
    80007ac8:	00000797          	auipc	a5,0x0
    80007acc:	d9c78793          	addi	a5,a5,-612 # 80007864 <consoleread>
    80007ad0:	0af4bc23          	sd	a5,184(s1)
    80007ad4:	00000797          	auipc	a5,0x0
    80007ad8:	cec78793          	addi	a5,a5,-788 # 800077c0 <consolewrite>
    80007adc:	0cf4b023          	sd	a5,192(s1)
    80007ae0:	00813483          	ld	s1,8(sp)
    80007ae4:	02010113          	addi	sp,sp,32
    80007ae8:	00008067          	ret

0000000080007aec <console_read>:
    80007aec:	ff010113          	addi	sp,sp,-16
    80007af0:	00813423          	sd	s0,8(sp)
    80007af4:	01010413          	addi	s0,sp,16
    80007af8:	00813403          	ld	s0,8(sp)
    80007afc:	00005317          	auipc	t1,0x5
    80007b00:	2f433303          	ld	t1,756(t1) # 8000cdf0 <devsw+0x10>
    80007b04:	01010113          	addi	sp,sp,16
    80007b08:	00030067          	jr	t1

0000000080007b0c <console_write>:
    80007b0c:	ff010113          	addi	sp,sp,-16
    80007b10:	00813423          	sd	s0,8(sp)
    80007b14:	01010413          	addi	s0,sp,16
    80007b18:	00813403          	ld	s0,8(sp)
    80007b1c:	00005317          	auipc	t1,0x5
    80007b20:	2dc33303          	ld	t1,732(t1) # 8000cdf8 <devsw+0x18>
    80007b24:	01010113          	addi	sp,sp,16
    80007b28:	00030067          	jr	t1

0000000080007b2c <panic>:
    80007b2c:	fe010113          	addi	sp,sp,-32
    80007b30:	00113c23          	sd	ra,24(sp)
    80007b34:	00813823          	sd	s0,16(sp)
    80007b38:	00913423          	sd	s1,8(sp)
    80007b3c:	02010413          	addi	s0,sp,32
    80007b40:	00050493          	mv	s1,a0
    80007b44:	00002517          	auipc	a0,0x2
    80007b48:	cb450513          	addi	a0,a0,-844 # 800097f8 <_ZZ9kPrintIntmE6digits+0x788>
    80007b4c:	00005797          	auipc	a5,0x5
    80007b50:	3407a623          	sw	zero,844(a5) # 8000ce98 <pr+0x18>
    80007b54:	00000097          	auipc	ra,0x0
    80007b58:	034080e7          	jalr	52(ra) # 80007b88 <__printf>
    80007b5c:	00048513          	mv	a0,s1
    80007b60:	00000097          	auipc	ra,0x0
    80007b64:	028080e7          	jalr	40(ra) # 80007b88 <__printf>
    80007b68:	00002517          	auipc	a0,0x2
    80007b6c:	a1850513          	addi	a0,a0,-1512 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80007b70:	00000097          	auipc	ra,0x0
    80007b74:	018080e7          	jalr	24(ra) # 80007b88 <__printf>
    80007b78:	00100793          	li	a5,1
    80007b7c:	00004717          	auipc	a4,0x4
    80007b80:	f6f72623          	sw	a5,-148(a4) # 8000bae8 <panicked>
    80007b84:	0000006f          	j	80007b84 <panic+0x58>

0000000080007b88 <__printf>:
    80007b88:	f3010113          	addi	sp,sp,-208
    80007b8c:	08813023          	sd	s0,128(sp)
    80007b90:	07313423          	sd	s3,104(sp)
    80007b94:	09010413          	addi	s0,sp,144
    80007b98:	05813023          	sd	s8,64(sp)
    80007b9c:	08113423          	sd	ra,136(sp)
    80007ba0:	06913c23          	sd	s1,120(sp)
    80007ba4:	07213823          	sd	s2,112(sp)
    80007ba8:	07413023          	sd	s4,96(sp)
    80007bac:	05513c23          	sd	s5,88(sp)
    80007bb0:	05613823          	sd	s6,80(sp)
    80007bb4:	05713423          	sd	s7,72(sp)
    80007bb8:	03913c23          	sd	s9,56(sp)
    80007bbc:	03a13823          	sd	s10,48(sp)
    80007bc0:	03b13423          	sd	s11,40(sp)
    80007bc4:	00005317          	auipc	t1,0x5
    80007bc8:	2bc30313          	addi	t1,t1,700 # 8000ce80 <pr>
    80007bcc:	01832c03          	lw	s8,24(t1)
    80007bd0:	00b43423          	sd	a1,8(s0)
    80007bd4:	00c43823          	sd	a2,16(s0)
    80007bd8:	00d43c23          	sd	a3,24(s0)
    80007bdc:	02e43023          	sd	a4,32(s0)
    80007be0:	02f43423          	sd	a5,40(s0)
    80007be4:	03043823          	sd	a6,48(s0)
    80007be8:	03143c23          	sd	a7,56(s0)
    80007bec:	00050993          	mv	s3,a0
    80007bf0:	4a0c1663          	bnez	s8,8000809c <__printf+0x514>
    80007bf4:	60098c63          	beqz	s3,8000820c <__printf+0x684>
    80007bf8:	0009c503          	lbu	a0,0(s3)
    80007bfc:	00840793          	addi	a5,s0,8
    80007c00:	f6f43c23          	sd	a5,-136(s0)
    80007c04:	00000493          	li	s1,0
    80007c08:	22050063          	beqz	a0,80007e28 <__printf+0x2a0>
    80007c0c:	00002a37          	lui	s4,0x2
    80007c10:	00018ab7          	lui	s5,0x18
    80007c14:	000f4b37          	lui	s6,0xf4
    80007c18:	00989bb7          	lui	s7,0x989
    80007c1c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80007c20:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80007c24:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80007c28:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80007c2c:	00148c9b          	addiw	s9,s1,1
    80007c30:	02500793          	li	a5,37
    80007c34:	01998933          	add	s2,s3,s9
    80007c38:	38f51263          	bne	a0,a5,80007fbc <__printf+0x434>
    80007c3c:	00094783          	lbu	a5,0(s2)
    80007c40:	00078c9b          	sext.w	s9,a5
    80007c44:	1e078263          	beqz	a5,80007e28 <__printf+0x2a0>
    80007c48:	0024849b          	addiw	s1,s1,2
    80007c4c:	07000713          	li	a4,112
    80007c50:	00998933          	add	s2,s3,s1
    80007c54:	38e78a63          	beq	a5,a4,80007fe8 <__printf+0x460>
    80007c58:	20f76863          	bltu	a4,a5,80007e68 <__printf+0x2e0>
    80007c5c:	42a78863          	beq	a5,a0,8000808c <__printf+0x504>
    80007c60:	06400713          	li	a4,100
    80007c64:	40e79663          	bne	a5,a4,80008070 <__printf+0x4e8>
    80007c68:	f7843783          	ld	a5,-136(s0)
    80007c6c:	0007a603          	lw	a2,0(a5)
    80007c70:	00878793          	addi	a5,a5,8
    80007c74:	f6f43c23          	sd	a5,-136(s0)
    80007c78:	42064a63          	bltz	a2,800080ac <__printf+0x524>
    80007c7c:	00a00713          	li	a4,10
    80007c80:	02e677bb          	remuw	a5,a2,a4
    80007c84:	00002d97          	auipc	s11,0x2
    80007c88:	b9cd8d93          	addi	s11,s11,-1124 # 80009820 <digits>
    80007c8c:	00900593          	li	a1,9
    80007c90:	0006051b          	sext.w	a0,a2
    80007c94:	00000c93          	li	s9,0
    80007c98:	02079793          	slli	a5,a5,0x20
    80007c9c:	0207d793          	srli	a5,a5,0x20
    80007ca0:	00fd87b3          	add	a5,s11,a5
    80007ca4:	0007c783          	lbu	a5,0(a5)
    80007ca8:	02e656bb          	divuw	a3,a2,a4
    80007cac:	f8f40023          	sb	a5,-128(s0)
    80007cb0:	14c5d863          	bge	a1,a2,80007e00 <__printf+0x278>
    80007cb4:	06300593          	li	a1,99
    80007cb8:	00100c93          	li	s9,1
    80007cbc:	02e6f7bb          	remuw	a5,a3,a4
    80007cc0:	02079793          	slli	a5,a5,0x20
    80007cc4:	0207d793          	srli	a5,a5,0x20
    80007cc8:	00fd87b3          	add	a5,s11,a5
    80007ccc:	0007c783          	lbu	a5,0(a5)
    80007cd0:	02e6d73b          	divuw	a4,a3,a4
    80007cd4:	f8f400a3          	sb	a5,-127(s0)
    80007cd8:	12a5f463          	bgeu	a1,a0,80007e00 <__printf+0x278>
    80007cdc:	00a00693          	li	a3,10
    80007ce0:	00900593          	li	a1,9
    80007ce4:	02d777bb          	remuw	a5,a4,a3
    80007ce8:	02079793          	slli	a5,a5,0x20
    80007cec:	0207d793          	srli	a5,a5,0x20
    80007cf0:	00fd87b3          	add	a5,s11,a5
    80007cf4:	0007c503          	lbu	a0,0(a5)
    80007cf8:	02d757bb          	divuw	a5,a4,a3
    80007cfc:	f8a40123          	sb	a0,-126(s0)
    80007d00:	48e5f263          	bgeu	a1,a4,80008184 <__printf+0x5fc>
    80007d04:	06300513          	li	a0,99
    80007d08:	02d7f5bb          	remuw	a1,a5,a3
    80007d0c:	02059593          	slli	a1,a1,0x20
    80007d10:	0205d593          	srli	a1,a1,0x20
    80007d14:	00bd85b3          	add	a1,s11,a1
    80007d18:	0005c583          	lbu	a1,0(a1)
    80007d1c:	02d7d7bb          	divuw	a5,a5,a3
    80007d20:	f8b401a3          	sb	a1,-125(s0)
    80007d24:	48e57263          	bgeu	a0,a4,800081a8 <__printf+0x620>
    80007d28:	3e700513          	li	a0,999
    80007d2c:	02d7f5bb          	remuw	a1,a5,a3
    80007d30:	02059593          	slli	a1,a1,0x20
    80007d34:	0205d593          	srli	a1,a1,0x20
    80007d38:	00bd85b3          	add	a1,s11,a1
    80007d3c:	0005c583          	lbu	a1,0(a1)
    80007d40:	02d7d7bb          	divuw	a5,a5,a3
    80007d44:	f8b40223          	sb	a1,-124(s0)
    80007d48:	46e57663          	bgeu	a0,a4,800081b4 <__printf+0x62c>
    80007d4c:	02d7f5bb          	remuw	a1,a5,a3
    80007d50:	02059593          	slli	a1,a1,0x20
    80007d54:	0205d593          	srli	a1,a1,0x20
    80007d58:	00bd85b3          	add	a1,s11,a1
    80007d5c:	0005c583          	lbu	a1,0(a1)
    80007d60:	02d7d7bb          	divuw	a5,a5,a3
    80007d64:	f8b402a3          	sb	a1,-123(s0)
    80007d68:	46ea7863          	bgeu	s4,a4,800081d8 <__printf+0x650>
    80007d6c:	02d7f5bb          	remuw	a1,a5,a3
    80007d70:	02059593          	slli	a1,a1,0x20
    80007d74:	0205d593          	srli	a1,a1,0x20
    80007d78:	00bd85b3          	add	a1,s11,a1
    80007d7c:	0005c583          	lbu	a1,0(a1)
    80007d80:	02d7d7bb          	divuw	a5,a5,a3
    80007d84:	f8b40323          	sb	a1,-122(s0)
    80007d88:	3eeaf863          	bgeu	s5,a4,80008178 <__printf+0x5f0>
    80007d8c:	02d7f5bb          	remuw	a1,a5,a3
    80007d90:	02059593          	slli	a1,a1,0x20
    80007d94:	0205d593          	srli	a1,a1,0x20
    80007d98:	00bd85b3          	add	a1,s11,a1
    80007d9c:	0005c583          	lbu	a1,0(a1)
    80007da0:	02d7d7bb          	divuw	a5,a5,a3
    80007da4:	f8b403a3          	sb	a1,-121(s0)
    80007da8:	42eb7e63          	bgeu	s6,a4,800081e4 <__printf+0x65c>
    80007dac:	02d7f5bb          	remuw	a1,a5,a3
    80007db0:	02059593          	slli	a1,a1,0x20
    80007db4:	0205d593          	srli	a1,a1,0x20
    80007db8:	00bd85b3          	add	a1,s11,a1
    80007dbc:	0005c583          	lbu	a1,0(a1)
    80007dc0:	02d7d7bb          	divuw	a5,a5,a3
    80007dc4:	f8b40423          	sb	a1,-120(s0)
    80007dc8:	42ebfc63          	bgeu	s7,a4,80008200 <__printf+0x678>
    80007dcc:	02079793          	slli	a5,a5,0x20
    80007dd0:	0207d793          	srli	a5,a5,0x20
    80007dd4:	00fd8db3          	add	s11,s11,a5
    80007dd8:	000dc703          	lbu	a4,0(s11)
    80007ddc:	00a00793          	li	a5,10
    80007de0:	00900c93          	li	s9,9
    80007de4:	f8e404a3          	sb	a4,-119(s0)
    80007de8:	00065c63          	bgez	a2,80007e00 <__printf+0x278>
    80007dec:	f9040713          	addi	a4,s0,-112
    80007df0:	00f70733          	add	a4,a4,a5
    80007df4:	02d00693          	li	a3,45
    80007df8:	fed70823          	sb	a3,-16(a4)
    80007dfc:	00078c93          	mv	s9,a5
    80007e00:	f8040793          	addi	a5,s0,-128
    80007e04:	01978cb3          	add	s9,a5,s9
    80007e08:	f7f40d13          	addi	s10,s0,-129
    80007e0c:	000cc503          	lbu	a0,0(s9)
    80007e10:	fffc8c93          	addi	s9,s9,-1
    80007e14:	00000097          	auipc	ra,0x0
    80007e18:	b90080e7          	jalr	-1136(ra) # 800079a4 <consputc>
    80007e1c:	ffac98e3          	bne	s9,s10,80007e0c <__printf+0x284>
    80007e20:	00094503          	lbu	a0,0(s2)
    80007e24:	e00514e3          	bnez	a0,80007c2c <__printf+0xa4>
    80007e28:	1a0c1663          	bnez	s8,80007fd4 <__printf+0x44c>
    80007e2c:	08813083          	ld	ra,136(sp)
    80007e30:	08013403          	ld	s0,128(sp)
    80007e34:	07813483          	ld	s1,120(sp)
    80007e38:	07013903          	ld	s2,112(sp)
    80007e3c:	06813983          	ld	s3,104(sp)
    80007e40:	06013a03          	ld	s4,96(sp)
    80007e44:	05813a83          	ld	s5,88(sp)
    80007e48:	05013b03          	ld	s6,80(sp)
    80007e4c:	04813b83          	ld	s7,72(sp)
    80007e50:	04013c03          	ld	s8,64(sp)
    80007e54:	03813c83          	ld	s9,56(sp)
    80007e58:	03013d03          	ld	s10,48(sp)
    80007e5c:	02813d83          	ld	s11,40(sp)
    80007e60:	0d010113          	addi	sp,sp,208
    80007e64:	00008067          	ret
    80007e68:	07300713          	li	a4,115
    80007e6c:	1ce78a63          	beq	a5,a4,80008040 <__printf+0x4b8>
    80007e70:	07800713          	li	a4,120
    80007e74:	1ee79e63          	bne	a5,a4,80008070 <__printf+0x4e8>
    80007e78:	f7843783          	ld	a5,-136(s0)
    80007e7c:	0007a703          	lw	a4,0(a5)
    80007e80:	00878793          	addi	a5,a5,8
    80007e84:	f6f43c23          	sd	a5,-136(s0)
    80007e88:	28074263          	bltz	a4,8000810c <__printf+0x584>
    80007e8c:	00002d97          	auipc	s11,0x2
    80007e90:	994d8d93          	addi	s11,s11,-1644 # 80009820 <digits>
    80007e94:	00f77793          	andi	a5,a4,15
    80007e98:	00fd87b3          	add	a5,s11,a5
    80007e9c:	0007c683          	lbu	a3,0(a5)
    80007ea0:	00f00613          	li	a2,15
    80007ea4:	0007079b          	sext.w	a5,a4
    80007ea8:	f8d40023          	sb	a3,-128(s0)
    80007eac:	0047559b          	srliw	a1,a4,0x4
    80007eb0:	0047569b          	srliw	a3,a4,0x4
    80007eb4:	00000c93          	li	s9,0
    80007eb8:	0ee65063          	bge	a2,a4,80007f98 <__printf+0x410>
    80007ebc:	00f6f693          	andi	a3,a3,15
    80007ec0:	00dd86b3          	add	a3,s11,a3
    80007ec4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80007ec8:	0087d79b          	srliw	a5,a5,0x8
    80007ecc:	00100c93          	li	s9,1
    80007ed0:	f8d400a3          	sb	a3,-127(s0)
    80007ed4:	0cb67263          	bgeu	a2,a1,80007f98 <__printf+0x410>
    80007ed8:	00f7f693          	andi	a3,a5,15
    80007edc:	00dd86b3          	add	a3,s11,a3
    80007ee0:	0006c583          	lbu	a1,0(a3)
    80007ee4:	00f00613          	li	a2,15
    80007ee8:	0047d69b          	srliw	a3,a5,0x4
    80007eec:	f8b40123          	sb	a1,-126(s0)
    80007ef0:	0047d593          	srli	a1,a5,0x4
    80007ef4:	28f67e63          	bgeu	a2,a5,80008190 <__printf+0x608>
    80007ef8:	00f6f693          	andi	a3,a3,15
    80007efc:	00dd86b3          	add	a3,s11,a3
    80007f00:	0006c503          	lbu	a0,0(a3)
    80007f04:	0087d813          	srli	a6,a5,0x8
    80007f08:	0087d69b          	srliw	a3,a5,0x8
    80007f0c:	f8a401a3          	sb	a0,-125(s0)
    80007f10:	28b67663          	bgeu	a2,a1,8000819c <__printf+0x614>
    80007f14:	00f6f693          	andi	a3,a3,15
    80007f18:	00dd86b3          	add	a3,s11,a3
    80007f1c:	0006c583          	lbu	a1,0(a3)
    80007f20:	00c7d513          	srli	a0,a5,0xc
    80007f24:	00c7d69b          	srliw	a3,a5,0xc
    80007f28:	f8b40223          	sb	a1,-124(s0)
    80007f2c:	29067a63          	bgeu	a2,a6,800081c0 <__printf+0x638>
    80007f30:	00f6f693          	andi	a3,a3,15
    80007f34:	00dd86b3          	add	a3,s11,a3
    80007f38:	0006c583          	lbu	a1,0(a3)
    80007f3c:	0107d813          	srli	a6,a5,0x10
    80007f40:	0107d69b          	srliw	a3,a5,0x10
    80007f44:	f8b402a3          	sb	a1,-123(s0)
    80007f48:	28a67263          	bgeu	a2,a0,800081cc <__printf+0x644>
    80007f4c:	00f6f693          	andi	a3,a3,15
    80007f50:	00dd86b3          	add	a3,s11,a3
    80007f54:	0006c683          	lbu	a3,0(a3)
    80007f58:	0147d79b          	srliw	a5,a5,0x14
    80007f5c:	f8d40323          	sb	a3,-122(s0)
    80007f60:	21067663          	bgeu	a2,a6,8000816c <__printf+0x5e4>
    80007f64:	02079793          	slli	a5,a5,0x20
    80007f68:	0207d793          	srli	a5,a5,0x20
    80007f6c:	00fd8db3          	add	s11,s11,a5
    80007f70:	000dc683          	lbu	a3,0(s11)
    80007f74:	00800793          	li	a5,8
    80007f78:	00700c93          	li	s9,7
    80007f7c:	f8d403a3          	sb	a3,-121(s0)
    80007f80:	00075c63          	bgez	a4,80007f98 <__printf+0x410>
    80007f84:	f9040713          	addi	a4,s0,-112
    80007f88:	00f70733          	add	a4,a4,a5
    80007f8c:	02d00693          	li	a3,45
    80007f90:	fed70823          	sb	a3,-16(a4)
    80007f94:	00078c93          	mv	s9,a5
    80007f98:	f8040793          	addi	a5,s0,-128
    80007f9c:	01978cb3          	add	s9,a5,s9
    80007fa0:	f7f40d13          	addi	s10,s0,-129
    80007fa4:	000cc503          	lbu	a0,0(s9)
    80007fa8:	fffc8c93          	addi	s9,s9,-1
    80007fac:	00000097          	auipc	ra,0x0
    80007fb0:	9f8080e7          	jalr	-1544(ra) # 800079a4 <consputc>
    80007fb4:	ff9d18e3          	bne	s10,s9,80007fa4 <__printf+0x41c>
    80007fb8:	0100006f          	j	80007fc8 <__printf+0x440>
    80007fbc:	00000097          	auipc	ra,0x0
    80007fc0:	9e8080e7          	jalr	-1560(ra) # 800079a4 <consputc>
    80007fc4:	000c8493          	mv	s1,s9
    80007fc8:	00094503          	lbu	a0,0(s2)
    80007fcc:	c60510e3          	bnez	a0,80007c2c <__printf+0xa4>
    80007fd0:	e40c0ee3          	beqz	s8,80007e2c <__printf+0x2a4>
    80007fd4:	00005517          	auipc	a0,0x5
    80007fd8:	eac50513          	addi	a0,a0,-340 # 8000ce80 <pr>
    80007fdc:	00001097          	auipc	ra,0x1
    80007fe0:	94c080e7          	jalr	-1716(ra) # 80008928 <release>
    80007fe4:	e49ff06f          	j	80007e2c <__printf+0x2a4>
    80007fe8:	f7843783          	ld	a5,-136(s0)
    80007fec:	03000513          	li	a0,48
    80007ff0:	01000d13          	li	s10,16
    80007ff4:	00878713          	addi	a4,a5,8
    80007ff8:	0007bc83          	ld	s9,0(a5)
    80007ffc:	f6e43c23          	sd	a4,-136(s0)
    80008000:	00000097          	auipc	ra,0x0
    80008004:	9a4080e7          	jalr	-1628(ra) # 800079a4 <consputc>
    80008008:	07800513          	li	a0,120
    8000800c:	00000097          	auipc	ra,0x0
    80008010:	998080e7          	jalr	-1640(ra) # 800079a4 <consputc>
    80008014:	00002d97          	auipc	s11,0x2
    80008018:	80cd8d93          	addi	s11,s11,-2036 # 80009820 <digits>
    8000801c:	03ccd793          	srli	a5,s9,0x3c
    80008020:	00fd87b3          	add	a5,s11,a5
    80008024:	0007c503          	lbu	a0,0(a5)
    80008028:	fffd0d1b          	addiw	s10,s10,-1
    8000802c:	004c9c93          	slli	s9,s9,0x4
    80008030:	00000097          	auipc	ra,0x0
    80008034:	974080e7          	jalr	-1676(ra) # 800079a4 <consputc>
    80008038:	fe0d12e3          	bnez	s10,8000801c <__printf+0x494>
    8000803c:	f8dff06f          	j	80007fc8 <__printf+0x440>
    80008040:	f7843783          	ld	a5,-136(s0)
    80008044:	0007bc83          	ld	s9,0(a5)
    80008048:	00878793          	addi	a5,a5,8
    8000804c:	f6f43c23          	sd	a5,-136(s0)
    80008050:	000c9a63          	bnez	s9,80008064 <__printf+0x4dc>
    80008054:	1080006f          	j	8000815c <__printf+0x5d4>
    80008058:	001c8c93          	addi	s9,s9,1
    8000805c:	00000097          	auipc	ra,0x0
    80008060:	948080e7          	jalr	-1720(ra) # 800079a4 <consputc>
    80008064:	000cc503          	lbu	a0,0(s9)
    80008068:	fe0518e3          	bnez	a0,80008058 <__printf+0x4d0>
    8000806c:	f5dff06f          	j	80007fc8 <__printf+0x440>
    80008070:	02500513          	li	a0,37
    80008074:	00000097          	auipc	ra,0x0
    80008078:	930080e7          	jalr	-1744(ra) # 800079a4 <consputc>
    8000807c:	000c8513          	mv	a0,s9
    80008080:	00000097          	auipc	ra,0x0
    80008084:	924080e7          	jalr	-1756(ra) # 800079a4 <consputc>
    80008088:	f41ff06f          	j	80007fc8 <__printf+0x440>
    8000808c:	02500513          	li	a0,37
    80008090:	00000097          	auipc	ra,0x0
    80008094:	914080e7          	jalr	-1772(ra) # 800079a4 <consputc>
    80008098:	f31ff06f          	j	80007fc8 <__printf+0x440>
    8000809c:	00030513          	mv	a0,t1
    800080a0:	00000097          	auipc	ra,0x0
    800080a4:	7bc080e7          	jalr	1980(ra) # 8000885c <acquire>
    800080a8:	b4dff06f          	j	80007bf4 <__printf+0x6c>
    800080ac:	40c0053b          	negw	a0,a2
    800080b0:	00a00713          	li	a4,10
    800080b4:	02e576bb          	remuw	a3,a0,a4
    800080b8:	00001d97          	auipc	s11,0x1
    800080bc:	768d8d93          	addi	s11,s11,1896 # 80009820 <digits>
    800080c0:	ff700593          	li	a1,-9
    800080c4:	02069693          	slli	a3,a3,0x20
    800080c8:	0206d693          	srli	a3,a3,0x20
    800080cc:	00dd86b3          	add	a3,s11,a3
    800080d0:	0006c683          	lbu	a3,0(a3)
    800080d4:	02e557bb          	divuw	a5,a0,a4
    800080d8:	f8d40023          	sb	a3,-128(s0)
    800080dc:	10b65e63          	bge	a2,a1,800081f8 <__printf+0x670>
    800080e0:	06300593          	li	a1,99
    800080e4:	02e7f6bb          	remuw	a3,a5,a4
    800080e8:	02069693          	slli	a3,a3,0x20
    800080ec:	0206d693          	srli	a3,a3,0x20
    800080f0:	00dd86b3          	add	a3,s11,a3
    800080f4:	0006c683          	lbu	a3,0(a3)
    800080f8:	02e7d73b          	divuw	a4,a5,a4
    800080fc:	00200793          	li	a5,2
    80008100:	f8d400a3          	sb	a3,-127(s0)
    80008104:	bca5ece3          	bltu	a1,a0,80007cdc <__printf+0x154>
    80008108:	ce5ff06f          	j	80007dec <__printf+0x264>
    8000810c:	40e007bb          	negw	a5,a4
    80008110:	00001d97          	auipc	s11,0x1
    80008114:	710d8d93          	addi	s11,s11,1808 # 80009820 <digits>
    80008118:	00f7f693          	andi	a3,a5,15
    8000811c:	00dd86b3          	add	a3,s11,a3
    80008120:	0006c583          	lbu	a1,0(a3)
    80008124:	ff100613          	li	a2,-15
    80008128:	0047d69b          	srliw	a3,a5,0x4
    8000812c:	f8b40023          	sb	a1,-128(s0)
    80008130:	0047d59b          	srliw	a1,a5,0x4
    80008134:	0ac75e63          	bge	a4,a2,800081f0 <__printf+0x668>
    80008138:	00f6f693          	andi	a3,a3,15
    8000813c:	00dd86b3          	add	a3,s11,a3
    80008140:	0006c603          	lbu	a2,0(a3)
    80008144:	00f00693          	li	a3,15
    80008148:	0087d79b          	srliw	a5,a5,0x8
    8000814c:	f8c400a3          	sb	a2,-127(s0)
    80008150:	d8b6e4e3          	bltu	a3,a1,80007ed8 <__printf+0x350>
    80008154:	00200793          	li	a5,2
    80008158:	e2dff06f          	j	80007f84 <__printf+0x3fc>
    8000815c:	00001c97          	auipc	s9,0x1
    80008160:	6a4c8c93          	addi	s9,s9,1700 # 80009800 <_ZZ9kPrintIntmE6digits+0x790>
    80008164:	02800513          	li	a0,40
    80008168:	ef1ff06f          	j	80008058 <__printf+0x4d0>
    8000816c:	00700793          	li	a5,7
    80008170:	00600c93          	li	s9,6
    80008174:	e0dff06f          	j	80007f80 <__printf+0x3f8>
    80008178:	00700793          	li	a5,7
    8000817c:	00600c93          	li	s9,6
    80008180:	c69ff06f          	j	80007de8 <__printf+0x260>
    80008184:	00300793          	li	a5,3
    80008188:	00200c93          	li	s9,2
    8000818c:	c5dff06f          	j	80007de8 <__printf+0x260>
    80008190:	00300793          	li	a5,3
    80008194:	00200c93          	li	s9,2
    80008198:	de9ff06f          	j	80007f80 <__printf+0x3f8>
    8000819c:	00400793          	li	a5,4
    800081a0:	00300c93          	li	s9,3
    800081a4:	dddff06f          	j	80007f80 <__printf+0x3f8>
    800081a8:	00400793          	li	a5,4
    800081ac:	00300c93          	li	s9,3
    800081b0:	c39ff06f          	j	80007de8 <__printf+0x260>
    800081b4:	00500793          	li	a5,5
    800081b8:	00400c93          	li	s9,4
    800081bc:	c2dff06f          	j	80007de8 <__printf+0x260>
    800081c0:	00500793          	li	a5,5
    800081c4:	00400c93          	li	s9,4
    800081c8:	db9ff06f          	j	80007f80 <__printf+0x3f8>
    800081cc:	00600793          	li	a5,6
    800081d0:	00500c93          	li	s9,5
    800081d4:	dadff06f          	j	80007f80 <__printf+0x3f8>
    800081d8:	00600793          	li	a5,6
    800081dc:	00500c93          	li	s9,5
    800081e0:	c09ff06f          	j	80007de8 <__printf+0x260>
    800081e4:	00800793          	li	a5,8
    800081e8:	00700c93          	li	s9,7
    800081ec:	bfdff06f          	j	80007de8 <__printf+0x260>
    800081f0:	00100793          	li	a5,1
    800081f4:	d91ff06f          	j	80007f84 <__printf+0x3fc>
    800081f8:	00100793          	li	a5,1
    800081fc:	bf1ff06f          	j	80007dec <__printf+0x264>
    80008200:	00900793          	li	a5,9
    80008204:	00800c93          	li	s9,8
    80008208:	be1ff06f          	j	80007de8 <__printf+0x260>
    8000820c:	00001517          	auipc	a0,0x1
    80008210:	5fc50513          	addi	a0,a0,1532 # 80009808 <_ZZ9kPrintIntmE6digits+0x798>
    80008214:	00000097          	auipc	ra,0x0
    80008218:	918080e7          	jalr	-1768(ra) # 80007b2c <panic>

000000008000821c <printfinit>:
    8000821c:	fe010113          	addi	sp,sp,-32
    80008220:	00813823          	sd	s0,16(sp)
    80008224:	00913423          	sd	s1,8(sp)
    80008228:	00113c23          	sd	ra,24(sp)
    8000822c:	02010413          	addi	s0,sp,32
    80008230:	00005497          	auipc	s1,0x5
    80008234:	c5048493          	addi	s1,s1,-944 # 8000ce80 <pr>
    80008238:	00048513          	mv	a0,s1
    8000823c:	00001597          	auipc	a1,0x1
    80008240:	5dc58593          	addi	a1,a1,1500 # 80009818 <_ZZ9kPrintIntmE6digits+0x7a8>
    80008244:	00000097          	auipc	ra,0x0
    80008248:	5f4080e7          	jalr	1524(ra) # 80008838 <initlock>
    8000824c:	01813083          	ld	ra,24(sp)
    80008250:	01013403          	ld	s0,16(sp)
    80008254:	0004ac23          	sw	zero,24(s1)
    80008258:	00813483          	ld	s1,8(sp)
    8000825c:	02010113          	addi	sp,sp,32
    80008260:	00008067          	ret

0000000080008264 <uartinit>:
    80008264:	ff010113          	addi	sp,sp,-16
    80008268:	00813423          	sd	s0,8(sp)
    8000826c:	01010413          	addi	s0,sp,16
    80008270:	100007b7          	lui	a5,0x10000
    80008274:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80008278:	f8000713          	li	a4,-128
    8000827c:	00e781a3          	sb	a4,3(a5)
    80008280:	00300713          	li	a4,3
    80008284:	00e78023          	sb	a4,0(a5)
    80008288:	000780a3          	sb	zero,1(a5)
    8000828c:	00e781a3          	sb	a4,3(a5)
    80008290:	00700693          	li	a3,7
    80008294:	00d78123          	sb	a3,2(a5)
    80008298:	00e780a3          	sb	a4,1(a5)
    8000829c:	00813403          	ld	s0,8(sp)
    800082a0:	01010113          	addi	sp,sp,16
    800082a4:	00008067          	ret

00000000800082a8 <uartputc>:
    800082a8:	00004797          	auipc	a5,0x4
    800082ac:	8407a783          	lw	a5,-1984(a5) # 8000bae8 <panicked>
    800082b0:	00078463          	beqz	a5,800082b8 <uartputc+0x10>
    800082b4:	0000006f          	j	800082b4 <uartputc+0xc>
    800082b8:	fd010113          	addi	sp,sp,-48
    800082bc:	02813023          	sd	s0,32(sp)
    800082c0:	00913c23          	sd	s1,24(sp)
    800082c4:	01213823          	sd	s2,16(sp)
    800082c8:	01313423          	sd	s3,8(sp)
    800082cc:	02113423          	sd	ra,40(sp)
    800082d0:	03010413          	addi	s0,sp,48
    800082d4:	00004917          	auipc	s2,0x4
    800082d8:	81c90913          	addi	s2,s2,-2020 # 8000baf0 <uart_tx_r>
    800082dc:	00093783          	ld	a5,0(s2)
    800082e0:	00004497          	auipc	s1,0x4
    800082e4:	81848493          	addi	s1,s1,-2024 # 8000baf8 <uart_tx_w>
    800082e8:	0004b703          	ld	a4,0(s1)
    800082ec:	02078693          	addi	a3,a5,32
    800082f0:	00050993          	mv	s3,a0
    800082f4:	02e69c63          	bne	a3,a4,8000832c <uartputc+0x84>
    800082f8:	00001097          	auipc	ra,0x1
    800082fc:	834080e7          	jalr	-1996(ra) # 80008b2c <push_on>
    80008300:	00093783          	ld	a5,0(s2)
    80008304:	0004b703          	ld	a4,0(s1)
    80008308:	02078793          	addi	a5,a5,32
    8000830c:	00e79463          	bne	a5,a4,80008314 <uartputc+0x6c>
    80008310:	0000006f          	j	80008310 <uartputc+0x68>
    80008314:	00001097          	auipc	ra,0x1
    80008318:	88c080e7          	jalr	-1908(ra) # 80008ba0 <pop_on>
    8000831c:	00093783          	ld	a5,0(s2)
    80008320:	0004b703          	ld	a4,0(s1)
    80008324:	02078693          	addi	a3,a5,32
    80008328:	fce688e3          	beq	a3,a4,800082f8 <uartputc+0x50>
    8000832c:	01f77693          	andi	a3,a4,31
    80008330:	00005597          	auipc	a1,0x5
    80008334:	b7058593          	addi	a1,a1,-1168 # 8000cea0 <uart_tx_buf>
    80008338:	00d586b3          	add	a3,a1,a3
    8000833c:	00170713          	addi	a4,a4,1
    80008340:	01368023          	sb	s3,0(a3)
    80008344:	00e4b023          	sd	a4,0(s1)
    80008348:	10000637          	lui	a2,0x10000
    8000834c:	02f71063          	bne	a4,a5,8000836c <uartputc+0xc4>
    80008350:	0340006f          	j	80008384 <uartputc+0xdc>
    80008354:	00074703          	lbu	a4,0(a4)
    80008358:	00f93023          	sd	a5,0(s2)
    8000835c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80008360:	00093783          	ld	a5,0(s2)
    80008364:	0004b703          	ld	a4,0(s1)
    80008368:	00f70e63          	beq	a4,a5,80008384 <uartputc+0xdc>
    8000836c:	00564683          	lbu	a3,5(a2)
    80008370:	01f7f713          	andi	a4,a5,31
    80008374:	00e58733          	add	a4,a1,a4
    80008378:	0206f693          	andi	a3,a3,32
    8000837c:	00178793          	addi	a5,a5,1
    80008380:	fc069ae3          	bnez	a3,80008354 <uartputc+0xac>
    80008384:	02813083          	ld	ra,40(sp)
    80008388:	02013403          	ld	s0,32(sp)
    8000838c:	01813483          	ld	s1,24(sp)
    80008390:	01013903          	ld	s2,16(sp)
    80008394:	00813983          	ld	s3,8(sp)
    80008398:	03010113          	addi	sp,sp,48
    8000839c:	00008067          	ret

00000000800083a0 <uartputc_sync>:
    800083a0:	ff010113          	addi	sp,sp,-16
    800083a4:	00813423          	sd	s0,8(sp)
    800083a8:	01010413          	addi	s0,sp,16
    800083ac:	00003717          	auipc	a4,0x3
    800083b0:	73c72703          	lw	a4,1852(a4) # 8000bae8 <panicked>
    800083b4:	02071663          	bnez	a4,800083e0 <uartputc_sync+0x40>
    800083b8:	00050793          	mv	a5,a0
    800083bc:	100006b7          	lui	a3,0x10000
    800083c0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800083c4:	02077713          	andi	a4,a4,32
    800083c8:	fe070ce3          	beqz	a4,800083c0 <uartputc_sync+0x20>
    800083cc:	0ff7f793          	andi	a5,a5,255
    800083d0:	00f68023          	sb	a5,0(a3)
    800083d4:	00813403          	ld	s0,8(sp)
    800083d8:	01010113          	addi	sp,sp,16
    800083dc:	00008067          	ret
    800083e0:	0000006f          	j	800083e0 <uartputc_sync+0x40>

00000000800083e4 <uartstart>:
    800083e4:	ff010113          	addi	sp,sp,-16
    800083e8:	00813423          	sd	s0,8(sp)
    800083ec:	01010413          	addi	s0,sp,16
    800083f0:	00003617          	auipc	a2,0x3
    800083f4:	70060613          	addi	a2,a2,1792 # 8000baf0 <uart_tx_r>
    800083f8:	00003517          	auipc	a0,0x3
    800083fc:	70050513          	addi	a0,a0,1792 # 8000baf8 <uart_tx_w>
    80008400:	00063783          	ld	a5,0(a2)
    80008404:	00053703          	ld	a4,0(a0)
    80008408:	04f70263          	beq	a4,a5,8000844c <uartstart+0x68>
    8000840c:	100005b7          	lui	a1,0x10000
    80008410:	00005817          	auipc	a6,0x5
    80008414:	a9080813          	addi	a6,a6,-1392 # 8000cea0 <uart_tx_buf>
    80008418:	01c0006f          	j	80008434 <uartstart+0x50>
    8000841c:	0006c703          	lbu	a4,0(a3)
    80008420:	00f63023          	sd	a5,0(a2)
    80008424:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80008428:	00063783          	ld	a5,0(a2)
    8000842c:	00053703          	ld	a4,0(a0)
    80008430:	00f70e63          	beq	a4,a5,8000844c <uartstart+0x68>
    80008434:	01f7f713          	andi	a4,a5,31
    80008438:	00e806b3          	add	a3,a6,a4
    8000843c:	0055c703          	lbu	a4,5(a1)
    80008440:	00178793          	addi	a5,a5,1
    80008444:	02077713          	andi	a4,a4,32
    80008448:	fc071ae3          	bnez	a4,8000841c <uartstart+0x38>
    8000844c:	00813403          	ld	s0,8(sp)
    80008450:	01010113          	addi	sp,sp,16
    80008454:	00008067          	ret

0000000080008458 <uartgetc>:
    80008458:	ff010113          	addi	sp,sp,-16
    8000845c:	00813423          	sd	s0,8(sp)
    80008460:	01010413          	addi	s0,sp,16
    80008464:	10000737          	lui	a4,0x10000
    80008468:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000846c:	0017f793          	andi	a5,a5,1
    80008470:	00078c63          	beqz	a5,80008488 <uartgetc+0x30>
    80008474:	00074503          	lbu	a0,0(a4)
    80008478:	0ff57513          	andi	a0,a0,255
    8000847c:	00813403          	ld	s0,8(sp)
    80008480:	01010113          	addi	sp,sp,16
    80008484:	00008067          	ret
    80008488:	fff00513          	li	a0,-1
    8000848c:	ff1ff06f          	j	8000847c <uartgetc+0x24>

0000000080008490 <uartintr>:
    80008490:	100007b7          	lui	a5,0x10000
    80008494:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80008498:	0017f793          	andi	a5,a5,1
    8000849c:	0a078463          	beqz	a5,80008544 <uartintr+0xb4>
    800084a0:	fe010113          	addi	sp,sp,-32
    800084a4:	00813823          	sd	s0,16(sp)
    800084a8:	00913423          	sd	s1,8(sp)
    800084ac:	00113c23          	sd	ra,24(sp)
    800084b0:	02010413          	addi	s0,sp,32
    800084b4:	100004b7          	lui	s1,0x10000
    800084b8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800084bc:	0ff57513          	andi	a0,a0,255
    800084c0:	fffff097          	auipc	ra,0xfffff
    800084c4:	534080e7          	jalr	1332(ra) # 800079f4 <consoleintr>
    800084c8:	0054c783          	lbu	a5,5(s1)
    800084cc:	0017f793          	andi	a5,a5,1
    800084d0:	fe0794e3          	bnez	a5,800084b8 <uartintr+0x28>
    800084d4:	00003617          	auipc	a2,0x3
    800084d8:	61c60613          	addi	a2,a2,1564 # 8000baf0 <uart_tx_r>
    800084dc:	00003517          	auipc	a0,0x3
    800084e0:	61c50513          	addi	a0,a0,1564 # 8000baf8 <uart_tx_w>
    800084e4:	00063783          	ld	a5,0(a2)
    800084e8:	00053703          	ld	a4,0(a0)
    800084ec:	04f70263          	beq	a4,a5,80008530 <uartintr+0xa0>
    800084f0:	100005b7          	lui	a1,0x10000
    800084f4:	00005817          	auipc	a6,0x5
    800084f8:	9ac80813          	addi	a6,a6,-1620 # 8000cea0 <uart_tx_buf>
    800084fc:	01c0006f          	j	80008518 <uartintr+0x88>
    80008500:	0006c703          	lbu	a4,0(a3)
    80008504:	00f63023          	sd	a5,0(a2)
    80008508:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000850c:	00063783          	ld	a5,0(a2)
    80008510:	00053703          	ld	a4,0(a0)
    80008514:	00f70e63          	beq	a4,a5,80008530 <uartintr+0xa0>
    80008518:	01f7f713          	andi	a4,a5,31
    8000851c:	00e806b3          	add	a3,a6,a4
    80008520:	0055c703          	lbu	a4,5(a1)
    80008524:	00178793          	addi	a5,a5,1
    80008528:	02077713          	andi	a4,a4,32
    8000852c:	fc071ae3          	bnez	a4,80008500 <uartintr+0x70>
    80008530:	01813083          	ld	ra,24(sp)
    80008534:	01013403          	ld	s0,16(sp)
    80008538:	00813483          	ld	s1,8(sp)
    8000853c:	02010113          	addi	sp,sp,32
    80008540:	00008067          	ret
    80008544:	00003617          	auipc	a2,0x3
    80008548:	5ac60613          	addi	a2,a2,1452 # 8000baf0 <uart_tx_r>
    8000854c:	00003517          	auipc	a0,0x3
    80008550:	5ac50513          	addi	a0,a0,1452 # 8000baf8 <uart_tx_w>
    80008554:	00063783          	ld	a5,0(a2)
    80008558:	00053703          	ld	a4,0(a0)
    8000855c:	04f70263          	beq	a4,a5,800085a0 <uartintr+0x110>
    80008560:	100005b7          	lui	a1,0x10000
    80008564:	00005817          	auipc	a6,0x5
    80008568:	93c80813          	addi	a6,a6,-1732 # 8000cea0 <uart_tx_buf>
    8000856c:	01c0006f          	j	80008588 <uartintr+0xf8>
    80008570:	0006c703          	lbu	a4,0(a3)
    80008574:	00f63023          	sd	a5,0(a2)
    80008578:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000857c:	00063783          	ld	a5,0(a2)
    80008580:	00053703          	ld	a4,0(a0)
    80008584:	02f70063          	beq	a4,a5,800085a4 <uartintr+0x114>
    80008588:	01f7f713          	andi	a4,a5,31
    8000858c:	00e806b3          	add	a3,a6,a4
    80008590:	0055c703          	lbu	a4,5(a1)
    80008594:	00178793          	addi	a5,a5,1
    80008598:	02077713          	andi	a4,a4,32
    8000859c:	fc071ae3          	bnez	a4,80008570 <uartintr+0xe0>
    800085a0:	00008067          	ret
    800085a4:	00008067          	ret

00000000800085a8 <kinit>:
    800085a8:	fc010113          	addi	sp,sp,-64
    800085ac:	02913423          	sd	s1,40(sp)
    800085b0:	fffff7b7          	lui	a5,0xfffff
    800085b4:	00006497          	auipc	s1,0x6
    800085b8:	90b48493          	addi	s1,s1,-1781 # 8000debf <end+0xfff>
    800085bc:	02813823          	sd	s0,48(sp)
    800085c0:	01313c23          	sd	s3,24(sp)
    800085c4:	00f4f4b3          	and	s1,s1,a5
    800085c8:	02113c23          	sd	ra,56(sp)
    800085cc:	03213023          	sd	s2,32(sp)
    800085d0:	01413823          	sd	s4,16(sp)
    800085d4:	01513423          	sd	s5,8(sp)
    800085d8:	04010413          	addi	s0,sp,64
    800085dc:	000017b7          	lui	a5,0x1
    800085e0:	01100993          	li	s3,17
    800085e4:	00f487b3          	add	a5,s1,a5
    800085e8:	01b99993          	slli	s3,s3,0x1b
    800085ec:	06f9e063          	bltu	s3,a5,8000864c <kinit+0xa4>
    800085f0:	00005a97          	auipc	s5,0x5
    800085f4:	8d0a8a93          	addi	s5,s5,-1840 # 8000cec0 <end>
    800085f8:	0754ec63          	bltu	s1,s5,80008670 <kinit+0xc8>
    800085fc:	0734fa63          	bgeu	s1,s3,80008670 <kinit+0xc8>
    80008600:	00088a37          	lui	s4,0x88
    80008604:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80008608:	00003917          	auipc	s2,0x3
    8000860c:	4f890913          	addi	s2,s2,1272 # 8000bb00 <kmem>
    80008610:	00ca1a13          	slli	s4,s4,0xc
    80008614:	0140006f          	j	80008628 <kinit+0x80>
    80008618:	000017b7          	lui	a5,0x1
    8000861c:	00f484b3          	add	s1,s1,a5
    80008620:	0554e863          	bltu	s1,s5,80008670 <kinit+0xc8>
    80008624:	0534f663          	bgeu	s1,s3,80008670 <kinit+0xc8>
    80008628:	00001637          	lui	a2,0x1
    8000862c:	00100593          	li	a1,1
    80008630:	00048513          	mv	a0,s1
    80008634:	00000097          	auipc	ra,0x0
    80008638:	5e4080e7          	jalr	1508(ra) # 80008c18 <__memset>
    8000863c:	00093783          	ld	a5,0(s2)
    80008640:	00f4b023          	sd	a5,0(s1)
    80008644:	00993023          	sd	s1,0(s2)
    80008648:	fd4498e3          	bne	s1,s4,80008618 <kinit+0x70>
    8000864c:	03813083          	ld	ra,56(sp)
    80008650:	03013403          	ld	s0,48(sp)
    80008654:	02813483          	ld	s1,40(sp)
    80008658:	02013903          	ld	s2,32(sp)
    8000865c:	01813983          	ld	s3,24(sp)
    80008660:	01013a03          	ld	s4,16(sp)
    80008664:	00813a83          	ld	s5,8(sp)
    80008668:	04010113          	addi	sp,sp,64
    8000866c:	00008067          	ret
    80008670:	00001517          	auipc	a0,0x1
    80008674:	1c850513          	addi	a0,a0,456 # 80009838 <digits+0x18>
    80008678:	fffff097          	auipc	ra,0xfffff
    8000867c:	4b4080e7          	jalr	1204(ra) # 80007b2c <panic>

0000000080008680 <freerange>:
    80008680:	fc010113          	addi	sp,sp,-64
    80008684:	000017b7          	lui	a5,0x1
    80008688:	02913423          	sd	s1,40(sp)
    8000868c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80008690:	009504b3          	add	s1,a0,s1
    80008694:	fffff537          	lui	a0,0xfffff
    80008698:	02813823          	sd	s0,48(sp)
    8000869c:	02113c23          	sd	ra,56(sp)
    800086a0:	03213023          	sd	s2,32(sp)
    800086a4:	01313c23          	sd	s3,24(sp)
    800086a8:	01413823          	sd	s4,16(sp)
    800086ac:	01513423          	sd	s5,8(sp)
    800086b0:	01613023          	sd	s6,0(sp)
    800086b4:	04010413          	addi	s0,sp,64
    800086b8:	00a4f4b3          	and	s1,s1,a0
    800086bc:	00f487b3          	add	a5,s1,a5
    800086c0:	06f5e463          	bltu	a1,a5,80008728 <freerange+0xa8>
    800086c4:	00004a97          	auipc	s5,0x4
    800086c8:	7fca8a93          	addi	s5,s5,2044 # 8000cec0 <end>
    800086cc:	0954e263          	bltu	s1,s5,80008750 <freerange+0xd0>
    800086d0:	01100993          	li	s3,17
    800086d4:	01b99993          	slli	s3,s3,0x1b
    800086d8:	0734fc63          	bgeu	s1,s3,80008750 <freerange+0xd0>
    800086dc:	00058a13          	mv	s4,a1
    800086e0:	00003917          	auipc	s2,0x3
    800086e4:	42090913          	addi	s2,s2,1056 # 8000bb00 <kmem>
    800086e8:	00002b37          	lui	s6,0x2
    800086ec:	0140006f          	j	80008700 <freerange+0x80>
    800086f0:	000017b7          	lui	a5,0x1
    800086f4:	00f484b3          	add	s1,s1,a5
    800086f8:	0554ec63          	bltu	s1,s5,80008750 <freerange+0xd0>
    800086fc:	0534fa63          	bgeu	s1,s3,80008750 <freerange+0xd0>
    80008700:	00001637          	lui	a2,0x1
    80008704:	00100593          	li	a1,1
    80008708:	00048513          	mv	a0,s1
    8000870c:	00000097          	auipc	ra,0x0
    80008710:	50c080e7          	jalr	1292(ra) # 80008c18 <__memset>
    80008714:	00093703          	ld	a4,0(s2)
    80008718:	016487b3          	add	a5,s1,s6
    8000871c:	00e4b023          	sd	a4,0(s1)
    80008720:	00993023          	sd	s1,0(s2)
    80008724:	fcfa76e3          	bgeu	s4,a5,800086f0 <freerange+0x70>
    80008728:	03813083          	ld	ra,56(sp)
    8000872c:	03013403          	ld	s0,48(sp)
    80008730:	02813483          	ld	s1,40(sp)
    80008734:	02013903          	ld	s2,32(sp)
    80008738:	01813983          	ld	s3,24(sp)
    8000873c:	01013a03          	ld	s4,16(sp)
    80008740:	00813a83          	ld	s5,8(sp)
    80008744:	00013b03          	ld	s6,0(sp)
    80008748:	04010113          	addi	sp,sp,64
    8000874c:	00008067          	ret
    80008750:	00001517          	auipc	a0,0x1
    80008754:	0e850513          	addi	a0,a0,232 # 80009838 <digits+0x18>
    80008758:	fffff097          	auipc	ra,0xfffff
    8000875c:	3d4080e7          	jalr	980(ra) # 80007b2c <panic>

0000000080008760 <kfree>:
    80008760:	fe010113          	addi	sp,sp,-32
    80008764:	00813823          	sd	s0,16(sp)
    80008768:	00113c23          	sd	ra,24(sp)
    8000876c:	00913423          	sd	s1,8(sp)
    80008770:	02010413          	addi	s0,sp,32
    80008774:	03451793          	slli	a5,a0,0x34
    80008778:	04079c63          	bnez	a5,800087d0 <kfree+0x70>
    8000877c:	00004797          	auipc	a5,0x4
    80008780:	74478793          	addi	a5,a5,1860 # 8000cec0 <end>
    80008784:	00050493          	mv	s1,a0
    80008788:	04f56463          	bltu	a0,a5,800087d0 <kfree+0x70>
    8000878c:	01100793          	li	a5,17
    80008790:	01b79793          	slli	a5,a5,0x1b
    80008794:	02f57e63          	bgeu	a0,a5,800087d0 <kfree+0x70>
    80008798:	00001637          	lui	a2,0x1
    8000879c:	00100593          	li	a1,1
    800087a0:	00000097          	auipc	ra,0x0
    800087a4:	478080e7          	jalr	1144(ra) # 80008c18 <__memset>
    800087a8:	00003797          	auipc	a5,0x3
    800087ac:	35878793          	addi	a5,a5,856 # 8000bb00 <kmem>
    800087b0:	0007b703          	ld	a4,0(a5)
    800087b4:	01813083          	ld	ra,24(sp)
    800087b8:	01013403          	ld	s0,16(sp)
    800087bc:	00e4b023          	sd	a4,0(s1)
    800087c0:	0097b023          	sd	s1,0(a5)
    800087c4:	00813483          	ld	s1,8(sp)
    800087c8:	02010113          	addi	sp,sp,32
    800087cc:	00008067          	ret
    800087d0:	00001517          	auipc	a0,0x1
    800087d4:	06850513          	addi	a0,a0,104 # 80009838 <digits+0x18>
    800087d8:	fffff097          	auipc	ra,0xfffff
    800087dc:	354080e7          	jalr	852(ra) # 80007b2c <panic>

00000000800087e0 <kalloc>:
    800087e0:	fe010113          	addi	sp,sp,-32
    800087e4:	00813823          	sd	s0,16(sp)
    800087e8:	00913423          	sd	s1,8(sp)
    800087ec:	00113c23          	sd	ra,24(sp)
    800087f0:	02010413          	addi	s0,sp,32
    800087f4:	00003797          	auipc	a5,0x3
    800087f8:	30c78793          	addi	a5,a5,780 # 8000bb00 <kmem>
    800087fc:	0007b483          	ld	s1,0(a5)
    80008800:	02048063          	beqz	s1,80008820 <kalloc+0x40>
    80008804:	0004b703          	ld	a4,0(s1)
    80008808:	00001637          	lui	a2,0x1
    8000880c:	00500593          	li	a1,5
    80008810:	00048513          	mv	a0,s1
    80008814:	00e7b023          	sd	a4,0(a5)
    80008818:	00000097          	auipc	ra,0x0
    8000881c:	400080e7          	jalr	1024(ra) # 80008c18 <__memset>
    80008820:	01813083          	ld	ra,24(sp)
    80008824:	01013403          	ld	s0,16(sp)
    80008828:	00048513          	mv	a0,s1
    8000882c:	00813483          	ld	s1,8(sp)
    80008830:	02010113          	addi	sp,sp,32
    80008834:	00008067          	ret

0000000080008838 <initlock>:
    80008838:	ff010113          	addi	sp,sp,-16
    8000883c:	00813423          	sd	s0,8(sp)
    80008840:	01010413          	addi	s0,sp,16
    80008844:	00813403          	ld	s0,8(sp)
    80008848:	00b53423          	sd	a1,8(a0)
    8000884c:	00052023          	sw	zero,0(a0)
    80008850:	00053823          	sd	zero,16(a0)
    80008854:	01010113          	addi	sp,sp,16
    80008858:	00008067          	ret

000000008000885c <acquire>:
    8000885c:	fe010113          	addi	sp,sp,-32
    80008860:	00813823          	sd	s0,16(sp)
    80008864:	00913423          	sd	s1,8(sp)
    80008868:	00113c23          	sd	ra,24(sp)
    8000886c:	01213023          	sd	s2,0(sp)
    80008870:	02010413          	addi	s0,sp,32
    80008874:	00050493          	mv	s1,a0
    80008878:	10002973          	csrr	s2,sstatus
    8000887c:	100027f3          	csrr	a5,sstatus
    80008880:	ffd7f793          	andi	a5,a5,-3
    80008884:	10079073          	csrw	sstatus,a5
    80008888:	fffff097          	auipc	ra,0xfffff
    8000888c:	8e0080e7          	jalr	-1824(ra) # 80007168 <mycpu>
    80008890:	07852783          	lw	a5,120(a0)
    80008894:	06078e63          	beqz	a5,80008910 <acquire+0xb4>
    80008898:	fffff097          	auipc	ra,0xfffff
    8000889c:	8d0080e7          	jalr	-1840(ra) # 80007168 <mycpu>
    800088a0:	07852783          	lw	a5,120(a0)
    800088a4:	0004a703          	lw	a4,0(s1)
    800088a8:	0017879b          	addiw	a5,a5,1
    800088ac:	06f52c23          	sw	a5,120(a0)
    800088b0:	04071063          	bnez	a4,800088f0 <acquire+0x94>
    800088b4:	00100713          	li	a4,1
    800088b8:	00070793          	mv	a5,a4
    800088bc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800088c0:	0007879b          	sext.w	a5,a5
    800088c4:	fe079ae3          	bnez	a5,800088b8 <acquire+0x5c>
    800088c8:	0ff0000f          	fence
    800088cc:	fffff097          	auipc	ra,0xfffff
    800088d0:	89c080e7          	jalr	-1892(ra) # 80007168 <mycpu>
    800088d4:	01813083          	ld	ra,24(sp)
    800088d8:	01013403          	ld	s0,16(sp)
    800088dc:	00a4b823          	sd	a0,16(s1)
    800088e0:	00013903          	ld	s2,0(sp)
    800088e4:	00813483          	ld	s1,8(sp)
    800088e8:	02010113          	addi	sp,sp,32
    800088ec:	00008067          	ret
    800088f0:	0104b903          	ld	s2,16(s1)
    800088f4:	fffff097          	auipc	ra,0xfffff
    800088f8:	874080e7          	jalr	-1932(ra) # 80007168 <mycpu>
    800088fc:	faa91ce3          	bne	s2,a0,800088b4 <acquire+0x58>
    80008900:	00001517          	auipc	a0,0x1
    80008904:	f4050513          	addi	a0,a0,-192 # 80009840 <digits+0x20>
    80008908:	fffff097          	auipc	ra,0xfffff
    8000890c:	224080e7          	jalr	548(ra) # 80007b2c <panic>
    80008910:	00195913          	srli	s2,s2,0x1
    80008914:	fffff097          	auipc	ra,0xfffff
    80008918:	854080e7          	jalr	-1964(ra) # 80007168 <mycpu>
    8000891c:	00197913          	andi	s2,s2,1
    80008920:	07252e23          	sw	s2,124(a0)
    80008924:	f75ff06f          	j	80008898 <acquire+0x3c>

0000000080008928 <release>:
    80008928:	fe010113          	addi	sp,sp,-32
    8000892c:	00813823          	sd	s0,16(sp)
    80008930:	00113c23          	sd	ra,24(sp)
    80008934:	00913423          	sd	s1,8(sp)
    80008938:	01213023          	sd	s2,0(sp)
    8000893c:	02010413          	addi	s0,sp,32
    80008940:	00052783          	lw	a5,0(a0)
    80008944:	00079a63          	bnez	a5,80008958 <release+0x30>
    80008948:	00001517          	auipc	a0,0x1
    8000894c:	f0050513          	addi	a0,a0,-256 # 80009848 <digits+0x28>
    80008950:	fffff097          	auipc	ra,0xfffff
    80008954:	1dc080e7          	jalr	476(ra) # 80007b2c <panic>
    80008958:	01053903          	ld	s2,16(a0)
    8000895c:	00050493          	mv	s1,a0
    80008960:	fffff097          	auipc	ra,0xfffff
    80008964:	808080e7          	jalr	-2040(ra) # 80007168 <mycpu>
    80008968:	fea910e3          	bne	s2,a0,80008948 <release+0x20>
    8000896c:	0004b823          	sd	zero,16(s1)
    80008970:	0ff0000f          	fence
    80008974:	0f50000f          	fence	iorw,ow
    80008978:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000897c:	ffffe097          	auipc	ra,0xffffe
    80008980:	7ec080e7          	jalr	2028(ra) # 80007168 <mycpu>
    80008984:	100027f3          	csrr	a5,sstatus
    80008988:	0027f793          	andi	a5,a5,2
    8000898c:	04079a63          	bnez	a5,800089e0 <release+0xb8>
    80008990:	07852783          	lw	a5,120(a0)
    80008994:	02f05e63          	blez	a5,800089d0 <release+0xa8>
    80008998:	fff7871b          	addiw	a4,a5,-1
    8000899c:	06e52c23          	sw	a4,120(a0)
    800089a0:	00071c63          	bnez	a4,800089b8 <release+0x90>
    800089a4:	07c52783          	lw	a5,124(a0)
    800089a8:	00078863          	beqz	a5,800089b8 <release+0x90>
    800089ac:	100027f3          	csrr	a5,sstatus
    800089b0:	0027e793          	ori	a5,a5,2
    800089b4:	10079073          	csrw	sstatus,a5
    800089b8:	01813083          	ld	ra,24(sp)
    800089bc:	01013403          	ld	s0,16(sp)
    800089c0:	00813483          	ld	s1,8(sp)
    800089c4:	00013903          	ld	s2,0(sp)
    800089c8:	02010113          	addi	sp,sp,32
    800089cc:	00008067          	ret
    800089d0:	00001517          	auipc	a0,0x1
    800089d4:	e9850513          	addi	a0,a0,-360 # 80009868 <digits+0x48>
    800089d8:	fffff097          	auipc	ra,0xfffff
    800089dc:	154080e7          	jalr	340(ra) # 80007b2c <panic>
    800089e0:	00001517          	auipc	a0,0x1
    800089e4:	e7050513          	addi	a0,a0,-400 # 80009850 <digits+0x30>
    800089e8:	fffff097          	auipc	ra,0xfffff
    800089ec:	144080e7          	jalr	324(ra) # 80007b2c <panic>

00000000800089f0 <holding>:
    800089f0:	00052783          	lw	a5,0(a0)
    800089f4:	00079663          	bnez	a5,80008a00 <holding+0x10>
    800089f8:	00000513          	li	a0,0
    800089fc:	00008067          	ret
    80008a00:	fe010113          	addi	sp,sp,-32
    80008a04:	00813823          	sd	s0,16(sp)
    80008a08:	00913423          	sd	s1,8(sp)
    80008a0c:	00113c23          	sd	ra,24(sp)
    80008a10:	02010413          	addi	s0,sp,32
    80008a14:	01053483          	ld	s1,16(a0)
    80008a18:	ffffe097          	auipc	ra,0xffffe
    80008a1c:	750080e7          	jalr	1872(ra) # 80007168 <mycpu>
    80008a20:	01813083          	ld	ra,24(sp)
    80008a24:	01013403          	ld	s0,16(sp)
    80008a28:	40a48533          	sub	a0,s1,a0
    80008a2c:	00153513          	seqz	a0,a0
    80008a30:	00813483          	ld	s1,8(sp)
    80008a34:	02010113          	addi	sp,sp,32
    80008a38:	00008067          	ret

0000000080008a3c <push_off>:
    80008a3c:	fe010113          	addi	sp,sp,-32
    80008a40:	00813823          	sd	s0,16(sp)
    80008a44:	00113c23          	sd	ra,24(sp)
    80008a48:	00913423          	sd	s1,8(sp)
    80008a4c:	02010413          	addi	s0,sp,32
    80008a50:	100024f3          	csrr	s1,sstatus
    80008a54:	100027f3          	csrr	a5,sstatus
    80008a58:	ffd7f793          	andi	a5,a5,-3
    80008a5c:	10079073          	csrw	sstatus,a5
    80008a60:	ffffe097          	auipc	ra,0xffffe
    80008a64:	708080e7          	jalr	1800(ra) # 80007168 <mycpu>
    80008a68:	07852783          	lw	a5,120(a0)
    80008a6c:	02078663          	beqz	a5,80008a98 <push_off+0x5c>
    80008a70:	ffffe097          	auipc	ra,0xffffe
    80008a74:	6f8080e7          	jalr	1784(ra) # 80007168 <mycpu>
    80008a78:	07852783          	lw	a5,120(a0)
    80008a7c:	01813083          	ld	ra,24(sp)
    80008a80:	01013403          	ld	s0,16(sp)
    80008a84:	0017879b          	addiw	a5,a5,1
    80008a88:	06f52c23          	sw	a5,120(a0)
    80008a8c:	00813483          	ld	s1,8(sp)
    80008a90:	02010113          	addi	sp,sp,32
    80008a94:	00008067          	ret
    80008a98:	0014d493          	srli	s1,s1,0x1
    80008a9c:	ffffe097          	auipc	ra,0xffffe
    80008aa0:	6cc080e7          	jalr	1740(ra) # 80007168 <mycpu>
    80008aa4:	0014f493          	andi	s1,s1,1
    80008aa8:	06952e23          	sw	s1,124(a0)
    80008aac:	fc5ff06f          	j	80008a70 <push_off+0x34>

0000000080008ab0 <pop_off>:
    80008ab0:	ff010113          	addi	sp,sp,-16
    80008ab4:	00813023          	sd	s0,0(sp)
    80008ab8:	00113423          	sd	ra,8(sp)
    80008abc:	01010413          	addi	s0,sp,16
    80008ac0:	ffffe097          	auipc	ra,0xffffe
    80008ac4:	6a8080e7          	jalr	1704(ra) # 80007168 <mycpu>
    80008ac8:	100027f3          	csrr	a5,sstatus
    80008acc:	0027f793          	andi	a5,a5,2
    80008ad0:	04079663          	bnez	a5,80008b1c <pop_off+0x6c>
    80008ad4:	07852783          	lw	a5,120(a0)
    80008ad8:	02f05a63          	blez	a5,80008b0c <pop_off+0x5c>
    80008adc:	fff7871b          	addiw	a4,a5,-1
    80008ae0:	06e52c23          	sw	a4,120(a0)
    80008ae4:	00071c63          	bnez	a4,80008afc <pop_off+0x4c>
    80008ae8:	07c52783          	lw	a5,124(a0)
    80008aec:	00078863          	beqz	a5,80008afc <pop_off+0x4c>
    80008af0:	100027f3          	csrr	a5,sstatus
    80008af4:	0027e793          	ori	a5,a5,2
    80008af8:	10079073          	csrw	sstatus,a5
    80008afc:	00813083          	ld	ra,8(sp)
    80008b00:	00013403          	ld	s0,0(sp)
    80008b04:	01010113          	addi	sp,sp,16
    80008b08:	00008067          	ret
    80008b0c:	00001517          	auipc	a0,0x1
    80008b10:	d5c50513          	addi	a0,a0,-676 # 80009868 <digits+0x48>
    80008b14:	fffff097          	auipc	ra,0xfffff
    80008b18:	018080e7          	jalr	24(ra) # 80007b2c <panic>
    80008b1c:	00001517          	auipc	a0,0x1
    80008b20:	d3450513          	addi	a0,a0,-716 # 80009850 <digits+0x30>
    80008b24:	fffff097          	auipc	ra,0xfffff
    80008b28:	008080e7          	jalr	8(ra) # 80007b2c <panic>

0000000080008b2c <push_on>:
    80008b2c:	fe010113          	addi	sp,sp,-32
    80008b30:	00813823          	sd	s0,16(sp)
    80008b34:	00113c23          	sd	ra,24(sp)
    80008b38:	00913423          	sd	s1,8(sp)
    80008b3c:	02010413          	addi	s0,sp,32
    80008b40:	100024f3          	csrr	s1,sstatus
    80008b44:	100027f3          	csrr	a5,sstatus
    80008b48:	0027e793          	ori	a5,a5,2
    80008b4c:	10079073          	csrw	sstatus,a5
    80008b50:	ffffe097          	auipc	ra,0xffffe
    80008b54:	618080e7          	jalr	1560(ra) # 80007168 <mycpu>
    80008b58:	07852783          	lw	a5,120(a0)
    80008b5c:	02078663          	beqz	a5,80008b88 <push_on+0x5c>
    80008b60:	ffffe097          	auipc	ra,0xffffe
    80008b64:	608080e7          	jalr	1544(ra) # 80007168 <mycpu>
    80008b68:	07852783          	lw	a5,120(a0)
    80008b6c:	01813083          	ld	ra,24(sp)
    80008b70:	01013403          	ld	s0,16(sp)
    80008b74:	0017879b          	addiw	a5,a5,1
    80008b78:	06f52c23          	sw	a5,120(a0)
    80008b7c:	00813483          	ld	s1,8(sp)
    80008b80:	02010113          	addi	sp,sp,32
    80008b84:	00008067          	ret
    80008b88:	0014d493          	srli	s1,s1,0x1
    80008b8c:	ffffe097          	auipc	ra,0xffffe
    80008b90:	5dc080e7          	jalr	1500(ra) # 80007168 <mycpu>
    80008b94:	0014f493          	andi	s1,s1,1
    80008b98:	06952e23          	sw	s1,124(a0)
    80008b9c:	fc5ff06f          	j	80008b60 <push_on+0x34>

0000000080008ba0 <pop_on>:
    80008ba0:	ff010113          	addi	sp,sp,-16
    80008ba4:	00813023          	sd	s0,0(sp)
    80008ba8:	00113423          	sd	ra,8(sp)
    80008bac:	01010413          	addi	s0,sp,16
    80008bb0:	ffffe097          	auipc	ra,0xffffe
    80008bb4:	5b8080e7          	jalr	1464(ra) # 80007168 <mycpu>
    80008bb8:	100027f3          	csrr	a5,sstatus
    80008bbc:	0027f793          	andi	a5,a5,2
    80008bc0:	04078463          	beqz	a5,80008c08 <pop_on+0x68>
    80008bc4:	07852783          	lw	a5,120(a0)
    80008bc8:	02f05863          	blez	a5,80008bf8 <pop_on+0x58>
    80008bcc:	fff7879b          	addiw	a5,a5,-1
    80008bd0:	06f52c23          	sw	a5,120(a0)
    80008bd4:	07853783          	ld	a5,120(a0)
    80008bd8:	00079863          	bnez	a5,80008be8 <pop_on+0x48>
    80008bdc:	100027f3          	csrr	a5,sstatus
    80008be0:	ffd7f793          	andi	a5,a5,-3
    80008be4:	10079073          	csrw	sstatus,a5
    80008be8:	00813083          	ld	ra,8(sp)
    80008bec:	00013403          	ld	s0,0(sp)
    80008bf0:	01010113          	addi	sp,sp,16
    80008bf4:	00008067          	ret
    80008bf8:	00001517          	auipc	a0,0x1
    80008bfc:	c9850513          	addi	a0,a0,-872 # 80009890 <digits+0x70>
    80008c00:	fffff097          	auipc	ra,0xfffff
    80008c04:	f2c080e7          	jalr	-212(ra) # 80007b2c <panic>
    80008c08:	00001517          	auipc	a0,0x1
    80008c0c:	c6850513          	addi	a0,a0,-920 # 80009870 <digits+0x50>
    80008c10:	fffff097          	auipc	ra,0xfffff
    80008c14:	f1c080e7          	jalr	-228(ra) # 80007b2c <panic>

0000000080008c18 <__memset>:
    80008c18:	ff010113          	addi	sp,sp,-16
    80008c1c:	00813423          	sd	s0,8(sp)
    80008c20:	01010413          	addi	s0,sp,16
    80008c24:	1a060e63          	beqz	a2,80008de0 <__memset+0x1c8>
    80008c28:	40a007b3          	neg	a5,a0
    80008c2c:	0077f793          	andi	a5,a5,7
    80008c30:	00778693          	addi	a3,a5,7
    80008c34:	00b00813          	li	a6,11
    80008c38:	0ff5f593          	andi	a1,a1,255
    80008c3c:	fff6071b          	addiw	a4,a2,-1
    80008c40:	1b06e663          	bltu	a3,a6,80008dec <__memset+0x1d4>
    80008c44:	1cd76463          	bltu	a4,a3,80008e0c <__memset+0x1f4>
    80008c48:	1a078e63          	beqz	a5,80008e04 <__memset+0x1ec>
    80008c4c:	00b50023          	sb	a1,0(a0)
    80008c50:	00100713          	li	a4,1
    80008c54:	1ae78463          	beq	a5,a4,80008dfc <__memset+0x1e4>
    80008c58:	00b500a3          	sb	a1,1(a0)
    80008c5c:	00200713          	li	a4,2
    80008c60:	1ae78a63          	beq	a5,a4,80008e14 <__memset+0x1fc>
    80008c64:	00b50123          	sb	a1,2(a0)
    80008c68:	00300713          	li	a4,3
    80008c6c:	18e78463          	beq	a5,a4,80008df4 <__memset+0x1dc>
    80008c70:	00b501a3          	sb	a1,3(a0)
    80008c74:	00400713          	li	a4,4
    80008c78:	1ae78263          	beq	a5,a4,80008e1c <__memset+0x204>
    80008c7c:	00b50223          	sb	a1,4(a0)
    80008c80:	00500713          	li	a4,5
    80008c84:	1ae78063          	beq	a5,a4,80008e24 <__memset+0x20c>
    80008c88:	00b502a3          	sb	a1,5(a0)
    80008c8c:	00700713          	li	a4,7
    80008c90:	18e79e63          	bne	a5,a4,80008e2c <__memset+0x214>
    80008c94:	00b50323          	sb	a1,6(a0)
    80008c98:	00700e93          	li	t4,7
    80008c9c:	00859713          	slli	a4,a1,0x8
    80008ca0:	00e5e733          	or	a4,a1,a4
    80008ca4:	01059e13          	slli	t3,a1,0x10
    80008ca8:	01c76e33          	or	t3,a4,t3
    80008cac:	01859313          	slli	t1,a1,0x18
    80008cb0:	006e6333          	or	t1,t3,t1
    80008cb4:	02059893          	slli	a7,a1,0x20
    80008cb8:	40f60e3b          	subw	t3,a2,a5
    80008cbc:	011368b3          	or	a7,t1,a7
    80008cc0:	02859813          	slli	a6,a1,0x28
    80008cc4:	0108e833          	or	a6,a7,a6
    80008cc8:	03059693          	slli	a3,a1,0x30
    80008ccc:	003e589b          	srliw	a7,t3,0x3
    80008cd0:	00d866b3          	or	a3,a6,a3
    80008cd4:	03859713          	slli	a4,a1,0x38
    80008cd8:	00389813          	slli	a6,a7,0x3
    80008cdc:	00f507b3          	add	a5,a0,a5
    80008ce0:	00e6e733          	or	a4,a3,a4
    80008ce4:	000e089b          	sext.w	a7,t3
    80008ce8:	00f806b3          	add	a3,a6,a5
    80008cec:	00e7b023          	sd	a4,0(a5)
    80008cf0:	00878793          	addi	a5,a5,8
    80008cf4:	fed79ce3          	bne	a5,a3,80008cec <__memset+0xd4>
    80008cf8:	ff8e7793          	andi	a5,t3,-8
    80008cfc:	0007871b          	sext.w	a4,a5
    80008d00:	01d787bb          	addw	a5,a5,t4
    80008d04:	0ce88e63          	beq	a7,a4,80008de0 <__memset+0x1c8>
    80008d08:	00f50733          	add	a4,a0,a5
    80008d0c:	00b70023          	sb	a1,0(a4)
    80008d10:	0017871b          	addiw	a4,a5,1
    80008d14:	0cc77663          	bgeu	a4,a2,80008de0 <__memset+0x1c8>
    80008d18:	00e50733          	add	a4,a0,a4
    80008d1c:	00b70023          	sb	a1,0(a4)
    80008d20:	0027871b          	addiw	a4,a5,2
    80008d24:	0ac77e63          	bgeu	a4,a2,80008de0 <__memset+0x1c8>
    80008d28:	00e50733          	add	a4,a0,a4
    80008d2c:	00b70023          	sb	a1,0(a4)
    80008d30:	0037871b          	addiw	a4,a5,3
    80008d34:	0ac77663          	bgeu	a4,a2,80008de0 <__memset+0x1c8>
    80008d38:	00e50733          	add	a4,a0,a4
    80008d3c:	00b70023          	sb	a1,0(a4)
    80008d40:	0047871b          	addiw	a4,a5,4
    80008d44:	08c77e63          	bgeu	a4,a2,80008de0 <__memset+0x1c8>
    80008d48:	00e50733          	add	a4,a0,a4
    80008d4c:	00b70023          	sb	a1,0(a4)
    80008d50:	0057871b          	addiw	a4,a5,5
    80008d54:	08c77663          	bgeu	a4,a2,80008de0 <__memset+0x1c8>
    80008d58:	00e50733          	add	a4,a0,a4
    80008d5c:	00b70023          	sb	a1,0(a4)
    80008d60:	0067871b          	addiw	a4,a5,6
    80008d64:	06c77e63          	bgeu	a4,a2,80008de0 <__memset+0x1c8>
    80008d68:	00e50733          	add	a4,a0,a4
    80008d6c:	00b70023          	sb	a1,0(a4)
    80008d70:	0077871b          	addiw	a4,a5,7
    80008d74:	06c77663          	bgeu	a4,a2,80008de0 <__memset+0x1c8>
    80008d78:	00e50733          	add	a4,a0,a4
    80008d7c:	00b70023          	sb	a1,0(a4)
    80008d80:	0087871b          	addiw	a4,a5,8
    80008d84:	04c77e63          	bgeu	a4,a2,80008de0 <__memset+0x1c8>
    80008d88:	00e50733          	add	a4,a0,a4
    80008d8c:	00b70023          	sb	a1,0(a4)
    80008d90:	0097871b          	addiw	a4,a5,9
    80008d94:	04c77663          	bgeu	a4,a2,80008de0 <__memset+0x1c8>
    80008d98:	00e50733          	add	a4,a0,a4
    80008d9c:	00b70023          	sb	a1,0(a4)
    80008da0:	00a7871b          	addiw	a4,a5,10
    80008da4:	02c77e63          	bgeu	a4,a2,80008de0 <__memset+0x1c8>
    80008da8:	00e50733          	add	a4,a0,a4
    80008dac:	00b70023          	sb	a1,0(a4)
    80008db0:	00b7871b          	addiw	a4,a5,11
    80008db4:	02c77663          	bgeu	a4,a2,80008de0 <__memset+0x1c8>
    80008db8:	00e50733          	add	a4,a0,a4
    80008dbc:	00b70023          	sb	a1,0(a4)
    80008dc0:	00c7871b          	addiw	a4,a5,12
    80008dc4:	00c77e63          	bgeu	a4,a2,80008de0 <__memset+0x1c8>
    80008dc8:	00e50733          	add	a4,a0,a4
    80008dcc:	00b70023          	sb	a1,0(a4)
    80008dd0:	00d7879b          	addiw	a5,a5,13
    80008dd4:	00c7f663          	bgeu	a5,a2,80008de0 <__memset+0x1c8>
    80008dd8:	00f507b3          	add	a5,a0,a5
    80008ddc:	00b78023          	sb	a1,0(a5)
    80008de0:	00813403          	ld	s0,8(sp)
    80008de4:	01010113          	addi	sp,sp,16
    80008de8:	00008067          	ret
    80008dec:	00b00693          	li	a3,11
    80008df0:	e55ff06f          	j	80008c44 <__memset+0x2c>
    80008df4:	00300e93          	li	t4,3
    80008df8:	ea5ff06f          	j	80008c9c <__memset+0x84>
    80008dfc:	00100e93          	li	t4,1
    80008e00:	e9dff06f          	j	80008c9c <__memset+0x84>
    80008e04:	00000e93          	li	t4,0
    80008e08:	e95ff06f          	j	80008c9c <__memset+0x84>
    80008e0c:	00000793          	li	a5,0
    80008e10:	ef9ff06f          	j	80008d08 <__memset+0xf0>
    80008e14:	00200e93          	li	t4,2
    80008e18:	e85ff06f          	j	80008c9c <__memset+0x84>
    80008e1c:	00400e93          	li	t4,4
    80008e20:	e7dff06f          	j	80008c9c <__memset+0x84>
    80008e24:	00500e93          	li	t4,5
    80008e28:	e75ff06f          	j	80008c9c <__memset+0x84>
    80008e2c:	00600e93          	li	t4,6
    80008e30:	e6dff06f          	j	80008c9c <__memset+0x84>

0000000080008e34 <__memmove>:
    80008e34:	ff010113          	addi	sp,sp,-16
    80008e38:	00813423          	sd	s0,8(sp)
    80008e3c:	01010413          	addi	s0,sp,16
    80008e40:	0e060863          	beqz	a2,80008f30 <__memmove+0xfc>
    80008e44:	fff6069b          	addiw	a3,a2,-1
    80008e48:	0006881b          	sext.w	a6,a3
    80008e4c:	0ea5e863          	bltu	a1,a0,80008f3c <__memmove+0x108>
    80008e50:	00758713          	addi	a4,a1,7
    80008e54:	00a5e7b3          	or	a5,a1,a0
    80008e58:	40a70733          	sub	a4,a4,a0
    80008e5c:	0077f793          	andi	a5,a5,7
    80008e60:	00f73713          	sltiu	a4,a4,15
    80008e64:	00174713          	xori	a4,a4,1
    80008e68:	0017b793          	seqz	a5,a5
    80008e6c:	00e7f7b3          	and	a5,a5,a4
    80008e70:	10078863          	beqz	a5,80008f80 <__memmove+0x14c>
    80008e74:	00900793          	li	a5,9
    80008e78:	1107f463          	bgeu	a5,a6,80008f80 <__memmove+0x14c>
    80008e7c:	0036581b          	srliw	a6,a2,0x3
    80008e80:	fff8081b          	addiw	a6,a6,-1
    80008e84:	02081813          	slli	a6,a6,0x20
    80008e88:	01d85893          	srli	a7,a6,0x1d
    80008e8c:	00858813          	addi	a6,a1,8
    80008e90:	00058793          	mv	a5,a1
    80008e94:	00050713          	mv	a4,a0
    80008e98:	01088833          	add	a6,a7,a6
    80008e9c:	0007b883          	ld	a7,0(a5)
    80008ea0:	00878793          	addi	a5,a5,8
    80008ea4:	00870713          	addi	a4,a4,8
    80008ea8:	ff173c23          	sd	a7,-8(a4)
    80008eac:	ff0798e3          	bne	a5,a6,80008e9c <__memmove+0x68>
    80008eb0:	ff867713          	andi	a4,a2,-8
    80008eb4:	02071793          	slli	a5,a4,0x20
    80008eb8:	0207d793          	srli	a5,a5,0x20
    80008ebc:	00f585b3          	add	a1,a1,a5
    80008ec0:	40e686bb          	subw	a3,a3,a4
    80008ec4:	00f507b3          	add	a5,a0,a5
    80008ec8:	06e60463          	beq	a2,a4,80008f30 <__memmove+0xfc>
    80008ecc:	0005c703          	lbu	a4,0(a1)
    80008ed0:	00e78023          	sb	a4,0(a5)
    80008ed4:	04068e63          	beqz	a3,80008f30 <__memmove+0xfc>
    80008ed8:	0015c603          	lbu	a2,1(a1)
    80008edc:	00100713          	li	a4,1
    80008ee0:	00c780a3          	sb	a2,1(a5)
    80008ee4:	04e68663          	beq	a3,a4,80008f30 <__memmove+0xfc>
    80008ee8:	0025c603          	lbu	a2,2(a1)
    80008eec:	00200713          	li	a4,2
    80008ef0:	00c78123          	sb	a2,2(a5)
    80008ef4:	02e68e63          	beq	a3,a4,80008f30 <__memmove+0xfc>
    80008ef8:	0035c603          	lbu	a2,3(a1)
    80008efc:	00300713          	li	a4,3
    80008f00:	00c781a3          	sb	a2,3(a5)
    80008f04:	02e68663          	beq	a3,a4,80008f30 <__memmove+0xfc>
    80008f08:	0045c603          	lbu	a2,4(a1)
    80008f0c:	00400713          	li	a4,4
    80008f10:	00c78223          	sb	a2,4(a5)
    80008f14:	00e68e63          	beq	a3,a4,80008f30 <__memmove+0xfc>
    80008f18:	0055c603          	lbu	a2,5(a1)
    80008f1c:	00500713          	li	a4,5
    80008f20:	00c782a3          	sb	a2,5(a5)
    80008f24:	00e68663          	beq	a3,a4,80008f30 <__memmove+0xfc>
    80008f28:	0065c703          	lbu	a4,6(a1)
    80008f2c:	00e78323          	sb	a4,6(a5)
    80008f30:	00813403          	ld	s0,8(sp)
    80008f34:	01010113          	addi	sp,sp,16
    80008f38:	00008067          	ret
    80008f3c:	02061713          	slli	a4,a2,0x20
    80008f40:	02075713          	srli	a4,a4,0x20
    80008f44:	00e587b3          	add	a5,a1,a4
    80008f48:	f0f574e3          	bgeu	a0,a5,80008e50 <__memmove+0x1c>
    80008f4c:	02069613          	slli	a2,a3,0x20
    80008f50:	02065613          	srli	a2,a2,0x20
    80008f54:	fff64613          	not	a2,a2
    80008f58:	00e50733          	add	a4,a0,a4
    80008f5c:	00c78633          	add	a2,a5,a2
    80008f60:	fff7c683          	lbu	a3,-1(a5)
    80008f64:	fff78793          	addi	a5,a5,-1
    80008f68:	fff70713          	addi	a4,a4,-1
    80008f6c:	00d70023          	sb	a3,0(a4)
    80008f70:	fec798e3          	bne	a5,a2,80008f60 <__memmove+0x12c>
    80008f74:	00813403          	ld	s0,8(sp)
    80008f78:	01010113          	addi	sp,sp,16
    80008f7c:	00008067          	ret
    80008f80:	02069713          	slli	a4,a3,0x20
    80008f84:	02075713          	srli	a4,a4,0x20
    80008f88:	00170713          	addi	a4,a4,1
    80008f8c:	00e50733          	add	a4,a0,a4
    80008f90:	00050793          	mv	a5,a0
    80008f94:	0005c683          	lbu	a3,0(a1)
    80008f98:	00178793          	addi	a5,a5,1
    80008f9c:	00158593          	addi	a1,a1,1
    80008fa0:	fed78fa3          	sb	a3,-1(a5)
    80008fa4:	fee798e3          	bne	a5,a4,80008f94 <__memmove+0x160>
    80008fa8:	f89ff06f          	j	80008f30 <__memmove+0xfc>
	...
