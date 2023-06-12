
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000c117          	auipc	sp,0xc
    80000004:	ac813103          	ld	sp,-1336(sp) # 8000bac8 <_GLOBAL_OFFSET_TABLE_+0x40>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	71d060ef          	jal	ra,80006f38 <start>

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
    80001664:	4f07c783          	lbu	a5,1264(a5) # 8000bb50 <_ZN8KConsole11initializedE>
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
    80001688:	4cc48493          	addi	s1,s1,1228 # 8000bb50 <_ZN8KConsole11initializedE>
    8000168c:	0000a797          	auipc	a5,0xa
    80001690:	40c7b783          	ld	a5,1036(a5) # 8000ba98 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001694:	0007b783          	ld	a5,0(a5)
    80001698:	00f4b423          	sd	a5,8(s1)
	sr = (uint8*)CONSOLE_STATUS;
    8000169c:	0000a797          	auipc	a5,0xa
    800016a0:	40c7b783          	ld	a5,1036(a5) # 8000baa8 <_GLOBAL_OFFSET_TABLE_+0x20>
    800016a4:	0007b783          	ld	a5,0(a5)
    800016a8:	00f4b823          	sd	a5,16(s1)
	sem_open(&inputBufferHasSpace, capacity);
    800016ac:	03200593          	li	a1,50
    800016b0:	0000a517          	auipc	a0,0xa
    800016b4:	4b850513          	addi	a0,a0,1208 # 8000bb68 <_ZN8KConsole19inputBufferHasSpaceE>
    800016b8:	00000097          	auipc	ra,0x0
    800016bc:	de8080e7          	jalr	-536(ra) # 800014a0 <_Z8sem_openPP4KSemj>
	sem_open(&outputBufferHasSpace, capacity);
    800016c0:	03200593          	li	a1,50
    800016c4:	0000a517          	auipc	a0,0xa
    800016c8:	4ac50513          	addi	a0,a0,1196 # 8000bb70 <_ZN8KConsole20outputBufferHasSpaceE>
    800016cc:	00000097          	auipc	ra,0x0
    800016d0:	dd4080e7          	jalr	-556(ra) # 800014a0 <_Z8sem_openPP4KSemj>
	sem_open(&charsToInput, 0);
    800016d4:	00000593          	li	a1,0
    800016d8:	0000a517          	auipc	a0,0xa
    800016dc:	4a050513          	addi	a0,a0,1184 # 8000bb78 <_ZN8KConsole12charsToInputE>
    800016e0:	00000097          	auipc	ra,0x0
    800016e4:	dc0080e7          	jalr	-576(ra) # 800014a0 <_Z8sem_openPP4KSemj>
	sem_open(&charsToOutput, 0);
    800016e8:	00000593          	li	a1,0
    800016ec:	0000a517          	auipc	a0,0xa
    800016f0:	49450513          	addi	a0,a0,1172 # 8000bb80 <_ZN8KConsole13charsToOutputE>
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
    80001738:	5b4080e7          	jalr	1460(ra) # 80005ce8 <_Z11printStringPKc>
	printInteger((uint64)dr);
    8000173c:	0000a497          	auipc	s1,0xa
    80001740:	41448493          	addi	s1,s1,1044 # 8000bb50 <_ZN8KConsole11initializedE>
    80001744:	0084b503          	ld	a0,8(s1)
    80001748:	00000097          	auipc	ra,0x0
    8000174c:	250080e7          	jalr	592(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    80001750:	00008517          	auipc	a0,0x8
    80001754:	e3050513          	addi	a0,a0,-464 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80001758:	00004097          	auipc	ra,0x4
    8000175c:	590080e7          	jalr	1424(ra) # 80005ce8 <_Z11printStringPKc>
	printString("CONSOLE_STATUS = ");
    80001760:	00008517          	auipc	a0,0x8
    80001764:	8d050513          	addi	a0,a0,-1840 # 80009030 <CONSOLE_STATUS+0x20>
    80001768:	00004097          	auipc	ra,0x4
    8000176c:	580080e7          	jalr	1408(ra) # 80005ce8 <_Z11printStringPKc>
	printInteger((uint64)sr);
    80001770:	0104b503          	ld	a0,16(s1)
    80001774:	00000097          	auipc	ra,0x0
    80001778:	224080e7          	jalr	548(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    8000177c:	00008517          	auipc	a0,0x8
    80001780:	e0450513          	addi	a0,a0,-508 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80001784:	00004097          	auipc	ra,0x4
    80001788:	564080e7          	jalr	1380(ra) # 80005ce8 <_Z11printStringPKc>
	printString("*CONSOLE_RX = ");
    8000178c:	00008517          	auipc	a0,0x8
    80001790:	8bc50513          	addi	a0,a0,-1860 # 80009048 <CONSOLE_STATUS+0x38>
    80001794:	00004097          	auipc	ra,0x4
    80001798:	554080e7          	jalr	1364(ra) # 80005ce8 <_Z11printStringPKc>
	printInteger(*dr);
    8000179c:	0084b783          	ld	a5,8(s1)
    800017a0:	0007c503          	lbu	a0,0(a5)
    800017a4:	00000097          	auipc	ra,0x0
    800017a8:	1f4080e7          	jalr	500(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    800017ac:	00008517          	auipc	a0,0x8
    800017b0:	dd450513          	addi	a0,a0,-556 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    800017b4:	00004097          	auipc	ra,0x4
    800017b8:	534080e7          	jalr	1332(ra) # 80005ce8 <_Z11printStringPKc>
	printString("*CONSOLE_STATUS = ");
    800017bc:	00008517          	auipc	a0,0x8
    800017c0:	89c50513          	addi	a0,a0,-1892 # 80009058 <CONSOLE_STATUS+0x48>
    800017c4:	00004097          	auipc	ra,0x4
    800017c8:	524080e7          	jalr	1316(ra) # 80005ce8 <_Z11printStringPKc>
	printInteger(*sr);
    800017cc:	0104b783          	ld	a5,16(s1)
    800017d0:	0007c503          	lbu	a0,0(a5)
    800017d4:	00000097          	auipc	ra,0x0
    800017d8:	1c4080e7          	jalr	452(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    800017dc:	00008517          	auipc	a0,0x8
    800017e0:	da450513          	addi	a0,a0,-604 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    800017e4:	00004097          	auipc	ra,0x4
    800017e8:	504080e7          	jalr	1284(ra) # 80005ce8 <_Z11printStringPKc>
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
    80001818:	33c48493          	addi	s1,s1,828 # 8000bb50 <_ZN8KConsole11initializedE>
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
    8000185c:	36c72703          	lw	a4,876(a4) # 8000bbc4 <_ZN8KConsole15inputBufferSizeE>
    80001860:	03200793          	li	a5,50
    80001864:	04f70e63          	beq	a4,a5,800018c0 <_ZN8KConsole12placeInInputEc+0x68>
void KConsole::placeInInput(char c) {
    80001868:	ff010113          	addi	sp,sp,-16
    8000186c:	00113423          	sd	ra,8(sp)
    80001870:	00813023          	sd	s0,0(sp)
    80001874:	01010413          	addi	s0,sp,16
	inputBuffer[inputTail] = c;
    80001878:	0000a697          	auipc	a3,0xa
    8000187c:	2d868693          	addi	a3,a3,728 # 8000bb50 <_ZN8KConsole11initializedE>
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
    800018e4:	27048493          	addi	s1,s1,624 # 8000bb50 <_ZN8KConsole11initializedE>
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
    8000194c:	20848493          	addi	s1,s1,520 # 8000bb50 <_ZN8KConsole11initializedE>
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
    80001a60:	1b47b783          	ld	a5,436(a5) # 8000bc10 <_ZN9Scheduler4tailE>
    80001a64:	00078e63          	beqz	a5,80001a80 <_ZN9Scheduler3putEP3TCB+0x30>
		head = tail = tcb;
	} else {
		tail->nextInScheduler = tcb;
    80001a68:	02a7bc23          	sd	a0,56(a5)
		tail = tcb;
    80001a6c:	0000a797          	auipc	a5,0xa
    80001a70:	1aa7b223          	sd	a0,420(a5) # 8000bc10 <_ZN9Scheduler4tailE>
	}
}
    80001a74:	00813403          	ld	s0,8(sp)
    80001a78:	01010113          	addi	sp,sp,16
    80001a7c:	00008067          	ret
		head = tail = tcb;
    80001a80:	0000a797          	auipc	a5,0xa
    80001a84:	19078793          	addi	a5,a5,400 # 8000bc10 <_ZN9Scheduler4tailE>
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
    80001aa4:	17070713          	addi	a4,a4,368 # 8000bc10 <_ZN9Scheduler4tailE>
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
    80001ae4:	14083803          	ld	a6,320(a6) # 8000bc20 <_ZN9Scheduler12sleepingHeadE>
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
    80001b1c:	10a7b423          	sd	a0,264(a5) # 8000bc20 <_ZN9Scheduler12sleepingHeadE>
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
    80001b64:	0ca7b023          	sd	a0,192(a5) # 8000bc20 <_ZN9Scheduler12sleepingHeadE>
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
    80001b80:	0a47b783          	ld	a5,164(a5) # 8000bc20 <_ZN9Scheduler12sleepingHeadE>
    80001b84:	06078a63          	beqz	a5,80001bf8 <_ZN9Scheduler4wakeEv+0x7c>
	sleepingHead->timeToSleep--;
    80001b88:	0407b703          	ld	a4,64(a5)
    80001b8c:	fff70713          	addi	a4,a4,-1
    80001b90:	04e7b023          	sd	a4,64(a5)
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001b94:	0000a517          	auipc	a0,0xa
    80001b98:	08c53503          	ld	a0,140(a0) # 8000bc20 <_ZN9Scheduler12sleepingHeadE>
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
    80001bcc:	04f73c23          	sd	a5,88(a4) # 8000bc20 <_ZN9Scheduler12sleepingHeadE>
		thread->nextSleeping = nullptr;
    80001bd0:	04053423          	sd	zero,72(a0)
		Scheduler::put(thread);
    80001bd4:	00000097          	auipc	ra,0x0
    80001bd8:	e7c080e7          	jalr	-388(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001bdc:	0000a517          	auipc	a0,0xa
    80001be0:	04453503          	ld	a0,68(a0) # 8000bc20 <_ZN9Scheduler12sleepingHeadE>
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
    80001c30:	ea47b783          	ld	a5,-348(a5) # 8000bad0 <_GLOBAL_OFFSET_TABLE_+0x48>
    80001c34:	0007b783          	ld	a5,0(a5)
    80001c38:	00a78023          	sb	a0,0(a5)
        sem_signal(KConsole::outputBufferHasSpace);
    80001c3c:	0000a797          	auipc	a5,0xa
    80001c40:	e9c7b783          	ld	a5,-356(a5) # 8000bad8 <_GLOBAL_OFFSET_TABLE_+0x50>
    80001c44:	0007b503          	ld	a0,0(a5)
    80001c48:	00000097          	auipc	ra,0x0
    80001c4c:	8f0080e7          	jalr	-1808(ra) # 80001538 <_Z10sem_signalP4KSem>
        char c = KConsole::getFromOutput();
    80001c50:	00000097          	auipc	ra,0x0
    80001c54:	bb0080e7          	jalr	-1104(ra) # 80001800 <_ZN8KConsole13getFromOutputEv>
        while (!(*KConsole::sr & CONSOLE_TX_STATUS_BIT)) {}
    80001c58:	0000a797          	auipc	a5,0xa
    80001c5c:	eb07b783          	ld	a5,-336(a5) # 8000bb08 <_GLOBAL_OFFSET_TABLE_+0x80>
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
    80001c88:	e6c7b783          	ld	a5,-404(a5) # 8000baf0 <_GLOBAL_OFFSET_TABLE_+0x68>
    80001c8c:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    MemoryAllocator::initMemoryAllocator();
    80001c90:	00001097          	auipc	ra,0x1
    80001c94:	684080e7          	jalr	1668(ra) # 80003314 <_ZN15MemoryAllocator19initMemoryAllocatorEv>

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
    80001cb8:	e2c7b783          	ld	a5,-468(a5) # 8000bae0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001cbc:	fe843703          	ld	a4,-24(s0)
    80001cc0:	00e7b023          	sd	a4,0(a5)
    thread_create(&userHandle, (TCB::Body) userMain, nullptr);
    80001cc4:	00000613          	li	a2,0
    80001cc8:	0000a597          	auipc	a1,0xa
    80001ccc:	dc85b583          	ld	a1,-568(a1) # 8000ba90 <_GLOBAL_OFFSET_TABLE_+0x8>
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
    80001d24:	da07b783          	ld	a5,-608(a5) # 8000bac0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001d28:	0007a703          	lw	a4,0(a5)
    80001d2c:	0000a797          	auipc	a5,0xa
    80001d30:	dd47b783          	ld	a5,-556(a5) # 8000bb00 <_GLOBAL_OFFSET_TABLE_+0x78>
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

    if (scause == 0x09 || scause == 0x08) {
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
    80001e7c:	eb4080e7          	jalr	-332(ra) # 80002d2c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
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
    80001e94:	144080e7          	jalr	324(ra) # 80002fd4 <_ZN15MemoryAllocator5kfreeEPv>
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
    80001ec0:	c9c080e7          	jalr	-868(ra) # 80002b58 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80001ec4:	00050793          	mv	a5,a0
    80001ec8:	00f4b023          	sd	a5,0(s1)
                TCB::start(*((thread_t*)a1));
    80001ecc:	fb843783          	ld	a5,-72(s0)
    80001ed0:	0007b783          	ld	a5,0(a5)
    80001ed4:	00078513          	mv	a0,a5
    80001ed8:	00001097          	auipc	ra,0x1
    80001edc:	e00080e7          	jalr	-512(ra) # 80002cd8 <_ZN3TCB5startEPS_>
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
    80001f04:	be07b783          	ld	a5,-1056(a5) # 8000bae0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001f08:	0007b783          	ld	a5,0(a5)
    80001f0c:	00100593          	li	a1,1
    80001f10:	00078513          	mv	a0,a5
    80001f14:	00000097          	auipc	ra,0x0
    80001f18:	43c080e7          	jalr	1084(ra) # 80002350 <_ZN3TCB11setFinishedEb>
                TCB::releaseJoined();
    80001f1c:	00001097          	auipc	ra,0x1
    80001f20:	d60080e7          	jalr	-672(ra) # 80002c7c <_ZN3TCB13releaseJoinedEv>
                TCB::yield();
    80001f24:	00001097          	auipc	ra,0x1
    80001f28:	bd4080e7          	jalr	-1068(ra) # 80002af8 <_ZN3TCB5yieldEv>
                break;
    80001f2c:	1f00006f          	j	8000211c <interruptRoutine+0x3c4>
            case 0x13:
                //thread_dispatch
                TCB::yield();
    80001f30:	00001097          	auipc	ra,0x1
    80001f34:	bc8080e7          	jalr	-1080(ra) # 80002af8 <_ZN3TCB5yieldEv>
                break;
    80001f38:	1e40006f          	j	8000211c <interruptRoutine+0x3c4>
            case 0x14:
                //thread_join
                //a1 = rucka niti na koju tekuca nit treba da ceka
                TCB::threadJoin((thread_t)a1);
    80001f3c:	fb843783          	ld	a5,-72(s0)
    80001f40:	00078513          	mv	a0,a5
    80001f44:	00001097          	auipc	ra,0x1
    80001f48:	cf0080e7          	jalr	-784(ra) # 80002c34 <_ZN3TCB10threadJoinEPS_>
                TCB::yield();
    80001f4c:	00001097          	auipc	ra,0x1
    80001f50:	bac080e7          	jalr	-1108(ra) # 80002af8 <_ZN3TCB5yieldEv>
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
    80001f6c:	4b0080e7          	jalr	1200(ra) # 80003418 <_ZN4KSem7initSemEj>
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
    80001fa4:	5f0080e7          	jalr	1520(ra) # 80003590 <_ZN4KSem8closeSemEPS_>
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
    80001fbc:	4f4080e7          	jalr	1268(ra) # 800034ac <_ZN4KSem4waitEv>
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
    80001fd4:	56c080e7          	jalr	1388(ra) # 8000353c <_ZN4KSem6signalEv>
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
    80002004:	ae07b783          	ld	a5,-1312(a5) # 8000bae0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002008:	0007b783          	ld	a5,0(a5)
    8000200c:	fb843583          	ld	a1,-72(s0)
    80002010:	00078513          	mv	a0,a5
    80002014:	00000097          	auipc	ra,0x0
    80002018:	ac0080e7          	jalr	-1344(ra) # 80001ad4 <_ZN9Scheduler10putToSleepEP3TCBm>
                    TCB::yield();
    8000201c:	00001097          	auipc	ra,0x1
    80002020:	adc080e7          	jalr	-1316(ra) # 80002af8 <_ZN3TCB5yieldEv>
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
    80002070:	aec080e7          	jalr	-1300(ra) # 80002b58 <_ZN3TCB12createThreadEPFvPvES0_Pm>
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
    800020cc:	c20080e7          	jalr	-992(ra) # 80005ce8 <_Z11printStringPKc>
                printInteger(a0);
    800020d0:	fc043503          	ld	a0,-64(s0)
    800020d4:	00000097          	auipc	ra,0x0
    800020d8:	8c4080e7          	jalr	-1852(ra) # 80001998 <_Z12printIntegerm>
                printString("\nscause: ");
    800020dc:	00007517          	auipc	a0,0x7
    800020e0:	fbc50513          	addi	a0,a0,-68 # 80009098 <_ZZ9kPrintIntmE6digits+0x28>
    800020e4:	00004097          	auipc	ra,0x4
    800020e8:	c04080e7          	jalr	-1020(ra) # 80005ce8 <_Z11printStringPKc>
                printInteger(scause);
    800020ec:	fd843503          	ld	a0,-40(s0)
    800020f0:	00000097          	auipc	ra,0x0
    800020f4:	8a8080e7          	jalr	-1880(ra) # 80001998 <_Z12printIntegerm>
                printString("\nsepc: ");
    800020f8:	00007517          	auipc	a0,0x7
    800020fc:	fb050513          	addi	a0,a0,-80 # 800090a8 <_ZZ9kPrintIntmE6digits+0x38>
    80002100:	00004097          	auipc	ra,0x4
    80002104:	be8080e7          	jalr	-1048(ra) # 80005ce8 <_Z11printStringPKc>
                printInteger(sepc);
    80002108:	fd043503          	ld	a0,-48(s0)
    8000210c:	00000097          	auipc	ra,0x0
    80002110:	88c080e7          	jalr	-1908(ra) # 80001998 <_Z12printIntegerm>
                break;
    80002114:	0080006f          	j	8000211c <interruptRoutine+0x3c4>
                break;
    80002118:	00000013          	nop
        }
        //sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
        //sepc += 4;
        __asm__ volatile("addi %[dst], %[src], 0x4":[dst]"=r"(sepc):[src]"r"(
                sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000211c:	fd043303          	ld	t1,-48(s0)
    80002120:	00430313          	addi	t1,t1,4
    80002124:	fc643823          	sd	t1,-48(s0)
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002128:	fd043303          	ld	t1,-48(s0)
    8000212c:	14131073          	csrw	sepc,t1
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002130:	fc843303          	ld	t1,-56(s0)
    80002134:	10031073          	csrw	sstatus,t1
        printString("scause: ");
        printInteger(scause);
        printString("\nsepc: ");
        printInteger(sepc);
    }
}
    80002138:	1ac0006f          	j	800022e4 <interruptRoutine+0x58c>
    } else if (scause == 0x8000000000000009) {
    8000213c:	fd843703          	ld	a4,-40(s0)
    80002140:	fff00793          	li	a5,-1
    80002144:	03f79793          	slli	a5,a5,0x3f
    80002148:	00978793          	addi	a5,a5,9
    8000214c:	0af71263          	bne	a4,a5,800021f0 <interruptRoutine+0x498>
        uint64 irq = plic_claim();
    80002150:	00005097          	auipc	ra,0x5
    80002154:	644080e7          	jalr	1604(ra) # 80007794 <plic_claim>
    80002158:	00050793          	mv	a5,a0
    8000215c:	f8f43023          	sd	a5,-128(s0)
        if (irq == CONSOLE_IRQ) {
    80002160:	f8043703          	ld	a4,-128(s0)
    80002164:	00a00793          	li	a5,10
    80002168:	04f71863          	bne	a4,a5,800021b8 <interruptRoutine+0x460>
            if (*KConsole::sr & CONSOLE_RX_STATUS_BIT) {
    8000216c:	0000a797          	auipc	a5,0xa
    80002170:	99c7b783          	ld	a5,-1636(a5) # 8000bb08 <_GLOBAL_OFFSET_TABLE_+0x80>
    80002174:	0007b783          	ld	a5,0(a5)
    80002178:	0007c783          	lbu	a5,0(a5)
    8000217c:	0017f793          	andi	a5,a5,1
    80002180:	02078063          	beqz	a5,800021a0 <interruptRoutine+0x448>
                KConsole::placeInInput(*KConsole::dr);
    80002184:	0000a797          	auipc	a5,0xa
    80002188:	94c7b783          	ld	a5,-1716(a5) # 8000bad0 <_GLOBAL_OFFSET_TABLE_+0x48>
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
    800021b0:	620080e7          	jalr	1568(ra) # 800077cc <plic_complete>
    800021b4:	0140006f          	j	800021c8 <interruptRoutine+0x470>
            printString("Neki drugi prekid\n");
    800021b8:	00007517          	auipc	a0,0x7
    800021bc:	ef850513          	addi	a0,a0,-264 # 800090b0 <_ZZ9kPrintIntmE6digits+0x40>
    800021c0:	00004097          	auipc	ra,0x4
    800021c4:	b28080e7          	jalr	-1240(ra) # 80005ce8 <_Z11printStringPKc>
        Riscv::w_sepc(sepc);
    800021c8:	fd043503          	ld	a0,-48(s0)
    800021cc:	00000097          	auipc	ra,0x0
    800021d0:	130080e7          	jalr	304(ra) # 800022fc <_ZN5Riscv6w_sepcEm>
        Riscv::w_sstatus(sstatus);
    800021d4:	fc843503          	ld	a0,-56(s0)
    800021d8:	00000097          	auipc	ra,0x0
    800021dc:	15c080e7          	jalr	348(ra) # 80002334 <_ZN5Riscv9w_sstatusEm>
        Riscv::mc_sip(Riscv::SIP_SEIP);
    800021e0:	20000513          	li	a0,512
    800021e4:	00000097          	auipc	ra,0x0
    800021e8:	134080e7          	jalr	308(ra) # 80002318 <_ZN5Riscv6mc_sipEm>
}
    800021ec:	0f80006f          	j	800022e4 <interruptRoutine+0x58c>
    } else if (scause == 0x8000000000000001) {
    800021f0:	fd843703          	ld	a4,-40(s0)
    800021f4:	fff00793          	li	a5,-1
    800021f8:	03f79793          	slli	a5,a5,0x3f
    800021fc:	00178793          	addi	a5,a5,1
    80002200:	08f71e63          	bne	a4,a5,8000229c <interruptRoutine+0x544>
        Scheduler::wake();
    80002204:	00000097          	auipc	ra,0x0
    80002208:	978080e7          	jalr	-1672(ra) # 80001b7c <_ZN9Scheduler4wakeEv>
        TCB::runningTimeSlice++;
    8000220c:	0000a797          	auipc	a5,0xa
    80002210:	8947b783          	ld	a5,-1900(a5) # 8000baa0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002214:	0007b783          	ld	a5,0(a5)
    80002218:	00178713          	addi	a4,a5,1
    8000221c:	0000a797          	auipc	a5,0xa
    80002220:	8847b783          	ld	a5,-1916(a5) # 8000baa0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002224:	00e7b023          	sd	a4,0(a5)
        if (TCB::runningTimeSlice >= TCB::running->getTimeSlice()) {
    80002228:	0000a797          	auipc	a5,0xa
    8000222c:	8b87b783          	ld	a5,-1864(a5) # 8000bae0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002230:	0007b783          	ld	a5,0(a5)
    80002234:	00078513          	mv	a0,a5
    80002238:	00000097          	auipc	ra,0x0
    8000223c:	134080e7          	jalr	308(ra) # 8000236c <_ZN3TCB12getTimeSliceEv>
    80002240:	00050713          	mv	a4,a0
    80002244:	0000a797          	auipc	a5,0xa
    80002248:	85c7b783          	ld	a5,-1956(a5) # 8000baa0 <_GLOBAL_OFFSET_TABLE_+0x18>
    8000224c:	0007b783          	ld	a5,0(a5)
    80002250:	00e7b7b3          	sltu	a5,a5,a4
    80002254:	0017c793          	xori	a5,a5,1
    80002258:	0ff7f793          	andi	a5,a5,255
    8000225c:	00078c63          	beqz	a5,80002274 <interruptRoutine+0x51c>
            TCB::yield();
    80002260:	00001097          	auipc	ra,0x1
    80002264:	898080e7          	jalr	-1896(ra) # 80002af8 <_ZN3TCB5yieldEv>
            TCB::runningTimeSlice = 0;
    80002268:	0000a797          	auipc	a5,0xa
    8000226c:	8387b783          	ld	a5,-1992(a5) # 8000baa0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002270:	0007b023          	sd	zero,0(a5)
        Riscv::w_sepc(sepc);
    80002274:	fd043503          	ld	a0,-48(s0)
    80002278:	00000097          	auipc	ra,0x0
    8000227c:	084080e7          	jalr	132(ra) # 800022fc <_ZN5Riscv6w_sepcEm>
        Riscv::w_sstatus(sstatus);
    80002280:	fc843503          	ld	a0,-56(s0)
    80002284:	00000097          	auipc	ra,0x0
    80002288:	0b0080e7          	jalr	176(ra) # 80002334 <_ZN5Riscv9w_sstatusEm>
        Riscv::mc_sip(Riscv::SIP_SSIP);
    8000228c:	00200513          	li	a0,2
    80002290:	00000097          	auipc	ra,0x0
    80002294:	088080e7          	jalr	136(ra) # 80002318 <_ZN5Riscv6mc_sipEm>
}
    80002298:	04c0006f          	j	800022e4 <interruptRoutine+0x58c>
        printString("\nGreska u prekidnoj rutini\n");
    8000229c:	00007517          	auipc	a0,0x7
    800022a0:	e2c50513          	addi	a0,a0,-468 # 800090c8 <_ZZ9kPrintIntmE6digits+0x58>
    800022a4:	00004097          	auipc	ra,0x4
    800022a8:	a44080e7          	jalr	-1468(ra) # 80005ce8 <_Z11printStringPKc>
        printString("scause: ");
    800022ac:	00007517          	auipc	a0,0x7
    800022b0:	e3c50513          	addi	a0,a0,-452 # 800090e8 <_ZZ9kPrintIntmE6digits+0x78>
    800022b4:	00004097          	auipc	ra,0x4
    800022b8:	a34080e7          	jalr	-1484(ra) # 80005ce8 <_Z11printStringPKc>
        printInteger(scause);
    800022bc:	fd843503          	ld	a0,-40(s0)
    800022c0:	fffff097          	auipc	ra,0xfffff
    800022c4:	6d8080e7          	jalr	1752(ra) # 80001998 <_Z12printIntegerm>
        printString("\nsepc: ");
    800022c8:	00007517          	auipc	a0,0x7
    800022cc:	de050513          	addi	a0,a0,-544 # 800090a8 <_ZZ9kPrintIntmE6digits+0x38>
    800022d0:	00004097          	auipc	ra,0x4
    800022d4:	a18080e7          	jalr	-1512(ra) # 80005ce8 <_Z11printStringPKc>
        printInteger(sepc);
    800022d8:	fd043503          	ld	a0,-48(s0)
    800022dc:	fffff097          	auipc	ra,0xfffff
    800022e0:	6bc080e7          	jalr	1724(ra) # 80001998 <_Z12printIntegerm>
}
    800022e4:	00000013          	nop
    800022e8:	07813083          	ld	ra,120(sp)
    800022ec:	07013403          	ld	s0,112(sp)
    800022f0:	06813483          	ld	s1,104(sp)
    800022f4:	08010113          	addi	sp,sp,128
    800022f8:	00008067          	ret

00000000800022fc <_ZN5Riscv6w_sepcEm>:
inline void Riscv::w_sepc(uint64 sepc) {
    800022fc:	ff010113          	addi	sp,sp,-16
    80002300:	00813423          	sd	s0,8(sp)
    80002304:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002308:	14151073          	csrw	sepc,a0
}
    8000230c:	00813403          	ld	s0,8(sp)
    80002310:	01010113          	addi	sp,sp,16
    80002314:	00008067          	ret

0000000080002318 <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    80002318:	ff010113          	addi	sp,sp,-16
    8000231c:	00813423          	sd	s0,8(sp)
    80002320:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    80002324:	14453073          	csrc	sip,a0
}
    80002328:	00813403          	ld	s0,8(sp)
    8000232c:	01010113          	addi	sp,sp,16
    80002330:	00008067          	ret

0000000080002334 <_ZN5Riscv9w_sstatusEm>:
	uint64 volatile sstatus;
	__asm__ volatile("csrr %[sstatus], sstatus": [sstatus] "=r"(sstatus));
	return sstatus;
}

inline void Riscv::w_sstatus(uint64 sstatus) {
    80002334:	ff010113          	addi	sp,sp,-16
    80002338:	00813423          	sd	s0,8(sp)
    8000233c:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw sstatus, %[sstatus]": :[sstatus] "r"(sstatus));
    80002340:	10051073          	csrw	sstatus,a0
}
    80002344:	00813403          	ld	s0,8(sp)
    80002348:	01010113          	addi	sp,sp,16
    8000234c:	00008067          	ret

0000000080002350 <_ZN3TCB11setFinishedEb>:
	static TCB* createThread(Body function, void* args, uint64* stack);
	static void start(TCB* newTcb);

	bool isFinished() { return finished; }

	void setFinished(bool finish) { this->finished = finish; }
    80002350:	ff010113          	addi	sp,sp,-16
    80002354:	00813423          	sd	s0,8(sp)
    80002358:	01010413          	addi	s0,sp,16
    8000235c:	02b50823          	sb	a1,48(a0)
    80002360:	00813403          	ld	s0,8(sp)
    80002364:	01010113          	addi	sp,sp,16
    80002368:	00008067          	ret

000000008000236c <_ZN3TCB12getTimeSliceEv>:

	bool isBlocked() { return blocked; }

	void setBlocked(bool block) { this->blocked = block; }

	uint64 getTimeSlice() { return timeSlice; }
    8000236c:	ff010113          	addi	sp,sp,-16
    80002370:	00813423          	sd	s0,8(sp)
    80002374:	01010413          	addi	s0,sp,16
    80002378:	02853503          	ld	a0,40(a0)
    8000237c:	00813403          	ld	s0,8(sp)
    80002380:	01010113          	addi	sp,sp,16
    80002384:	00008067          	ret

0000000080002388 <_ZN6Thread7wrapperEPv>:

	__asm__ volatile("ecall");
}

void Thread::wrapper(void* thread) {
	if (thread != nullptr) {
    80002388:	02050863          	beqz	a0,800023b8 <_ZN6Thread7wrapperEPv+0x30>
void Thread::wrapper(void* thread) {
    8000238c:	ff010113          	addi	sp,sp,-16
    80002390:	00113423          	sd	ra,8(sp)
    80002394:	00813023          	sd	s0,0(sp)
    80002398:	01010413          	addi	s0,sp,16
		((Thread*)thread)->run();
    8000239c:	00053783          	ld	a5,0(a0)
    800023a0:	0107b783          	ld	a5,16(a5)
    800023a4:	000780e7          	jalr	a5
	}
}
    800023a8:	00813083          	ld	ra,8(sp)
    800023ac:	00013403          	ld	s0,0(sp)
    800023b0:	01010113          	addi	sp,sp,16
    800023b4:	00008067          	ret
    800023b8:	00008067          	ret

00000000800023bc <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    800023bc:	fe010113          	addi	sp,sp,-32
    800023c0:	00113c23          	sd	ra,24(sp)
    800023c4:	00813823          	sd	s0,16(sp)
    800023c8:	00913423          	sd	s1,8(sp)
    800023cc:	02010413          	addi	s0,sp,32
    800023d0:	00050493          	mv	s1,a0
    800023d4:	00009797          	auipc	a5,0x9
    800023d8:	4cc78793          	addi	a5,a5,1228 # 8000b8a0 <_ZTV6Thread+0x10>
    800023dc:	00f53023          	sd	a5,0(a0)
	thread_join(this->myHandle);
    800023e0:	00853503          	ld	a0,8(a0)
    800023e4:	fffff097          	auipc	ra,0xfffff
    800023e8:	064080e7          	jalr	100(ra) # 80001448 <_Z11thread_joinP3TCB>
	delete myHandle;
    800023ec:	0084b483          	ld	s1,8(s1)
    800023f0:	02048863          	beqz	s1,80002420 <_ZN6ThreadD1Ev+0x64>
            delete node;
        }
    }

    bool isEmpty() const {
        bool ret = front == nullptr;
    800023f4:	0504b503          	ld	a0,80(s1)
        while (!isEmpty()) {
    800023f8:	00050e63          	beqz	a0,80002414 <_ZN6ThreadD1Ev+0x58>
            front = front->next;
    800023fc:	00853783          	ld	a5,8(a0)
    80002400:	04f4b823          	sd	a5,80(s1)
            delete node;
    80002404:	fe0508e3          	beqz	a0,800023f4 <_ZN6ThreadD1Ev+0x38>
            mem_free(ptr);
    80002408:	fffff097          	auipc	ra,0xfffff
    8000240c:	f48080e7          	jalr	-184(ra) # 80001350 <_Z8mem_freePv>
        }
    80002410:	fe5ff06f          	j	800023f4 <_ZN6ThreadD1Ev+0x38>
    80002414:	00048513          	mv	a0,s1
    80002418:	00000097          	auipc	ra,0x0
    8000241c:	7f4080e7          	jalr	2036(ra) # 80002c0c <_ZN3TCBdlEPv>
}
    80002420:	01813083          	ld	ra,24(sp)
    80002424:	01013403          	ld	s0,16(sp)
    80002428:	00813483          	ld	s1,8(sp)
    8000242c:	02010113          	addi	sp,sp,32
    80002430:	00008067          	ret

0000000080002434 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
	sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    80002434:	fe010113          	addi	sp,sp,-32
    80002438:	00113c23          	sd	ra,24(sp)
    8000243c:	00813823          	sd	s0,16(sp)
    80002440:	00913423          	sd	s1,8(sp)
    80002444:	02010413          	addi	s0,sp,32
    80002448:	00050493          	mv	s1,a0
    8000244c:	00009797          	auipc	a5,0x9
    80002450:	47c78793          	addi	a5,a5,1148 # 8000b8c8 <_ZTV9Semaphore+0x10>
    80002454:	00f53023          	sd	a5,0(a0)
	sem_close(myHandle);
    80002458:	00853503          	ld	a0,8(a0)
    8000245c:	fffff097          	auipc	ra,0xfffff
    80002460:	07c080e7          	jalr	124(ra) # 800014d8 <_Z9sem_closeP4KSem>
	delete myHandle;
    80002464:	0084b483          	ld	s1,8(s1)
    80002468:	02048863          	beqz	s1,80002498 <_ZN9SemaphoreD1Ev+0x64>
        bool ret = front == nullptr;
    8000246c:	0084b503          	ld	a0,8(s1)
        while (!isEmpty()) {
    80002470:	00050e63          	beqz	a0,8000248c <_ZN9SemaphoreD1Ev+0x58>
            front = front->next;
    80002474:	00853783          	ld	a5,8(a0)
    80002478:	00f4b423          	sd	a5,8(s1)
            delete node;
    8000247c:	fe0508e3          	beqz	a0,8000246c <_ZN9SemaphoreD1Ev+0x38>
            mem_free(ptr);
    80002480:	fffff097          	auipc	ra,0xfffff
    80002484:	ed0080e7          	jalr	-304(ra) # 80001350 <_Z8mem_freePv>
        }
    80002488:	fe5ff06f          	j	8000246c <_ZN9SemaphoreD1Ev+0x38>
    8000248c:	00048513          	mv	a0,s1
    80002490:	00001097          	auipc	ra,0x1
    80002494:	f60080e7          	jalr	-160(ra) # 800033f0 <_ZN4KSemdlEPv>
}
    80002498:	01813083          	ld	ra,24(sp)
    8000249c:	01013403          	ld	s0,16(sp)
    800024a0:	00813483          	ld	s1,8(sp)
    800024a4:	02010113          	addi	sp,sp,32
    800024a8:	00008067          	ret

00000000800024ac <_Znwm>:
void* operator new(size_t size) {
    800024ac:	ff010113          	addi	sp,sp,-16
    800024b0:	00113423          	sd	ra,8(sp)
    800024b4:	00813023          	sd	s0,0(sp)
    800024b8:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    800024bc:	fffff097          	auipc	ra,0xfffff
    800024c0:	e54080e7          	jalr	-428(ra) # 80001310 <_Z9mem_allocm>
}
    800024c4:	00813083          	ld	ra,8(sp)
    800024c8:	00013403          	ld	s0,0(sp)
    800024cc:	01010113          	addi	sp,sp,16
    800024d0:	00008067          	ret

00000000800024d4 <_Znam>:
void* operator new[](size_t size) {
    800024d4:	ff010113          	addi	sp,sp,-16
    800024d8:	00113423          	sd	ra,8(sp)
    800024dc:	00813023          	sd	s0,0(sp)
    800024e0:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    800024e4:	fffff097          	auipc	ra,0xfffff
    800024e8:	e2c080e7          	jalr	-468(ra) # 80001310 <_Z9mem_allocm>
}
    800024ec:	00813083          	ld	ra,8(sp)
    800024f0:	00013403          	ld	s0,0(sp)
    800024f4:	01010113          	addi	sp,sp,16
    800024f8:	00008067          	ret

00000000800024fc <_ZdlPv>:
noexcept {
    800024fc:	ff010113          	addi	sp,sp,-16
    80002500:	00113423          	sd	ra,8(sp)
    80002504:	00813023          	sd	s0,0(sp)
    80002508:	01010413          	addi	s0,sp,16
mem_free(ptr);
    8000250c:	fffff097          	auipc	ra,0xfffff
    80002510:	e44080e7          	jalr	-444(ra) # 80001350 <_Z8mem_freePv>
}
    80002514:	00813083          	ld	ra,8(sp)
    80002518:	00013403          	ld	s0,0(sp)
    8000251c:	01010113          	addi	sp,sp,16
    80002520:	00008067          	ret

0000000080002524 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80002524:	fe010113          	addi	sp,sp,-32
    80002528:	00113c23          	sd	ra,24(sp)
    8000252c:	00813823          	sd	s0,16(sp)
    80002530:	00913423          	sd	s1,8(sp)
    80002534:	02010413          	addi	s0,sp,32
    80002538:	00050493          	mv	s1,a0
}
    8000253c:	00000097          	auipc	ra,0x0
    80002540:	e80080e7          	jalr	-384(ra) # 800023bc <_ZN6ThreadD1Ev>
    80002544:	00048513          	mv	a0,s1
    80002548:	00000097          	auipc	ra,0x0
    8000254c:	fb4080e7          	jalr	-76(ra) # 800024fc <_ZdlPv>
    80002550:	01813083          	ld	ra,24(sp)
    80002554:	01013403          	ld	s0,16(sp)
    80002558:	00813483          	ld	s1,8(sp)
    8000255c:	02010113          	addi	sp,sp,32
    80002560:	00008067          	ret

0000000080002564 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80002564:	fe010113          	addi	sp,sp,-32
    80002568:	00113c23          	sd	ra,24(sp)
    8000256c:	00813823          	sd	s0,16(sp)
    80002570:	00913423          	sd	s1,8(sp)
    80002574:	02010413          	addi	s0,sp,32
    80002578:	00050493          	mv	s1,a0
}
    8000257c:	00000097          	auipc	ra,0x0
    80002580:	eb8080e7          	jalr	-328(ra) # 80002434 <_ZN9SemaphoreD1Ev>
    80002584:	00048513          	mv	a0,s1
    80002588:	00000097          	auipc	ra,0x0
    8000258c:	f74080e7          	jalr	-140(ra) # 800024fc <_ZdlPv>
    80002590:	01813083          	ld	ra,24(sp)
    80002594:	01013403          	ld	s0,16(sp)
    80002598:	00813483          	ld	s1,8(sp)
    8000259c:	02010113          	addi	sp,sp,32
    800025a0:	00008067          	ret

00000000800025a4 <_ZdaPv>:
noexcept {
    800025a4:	ff010113          	addi	sp,sp,-16
    800025a8:	00113423          	sd	ra,8(sp)
    800025ac:	00813023          	sd	s0,0(sp)
    800025b0:	01010413          	addi	s0,sp,16
mem_free(ptr);
    800025b4:	fffff097          	auipc	ra,0xfffff
    800025b8:	d9c080e7          	jalr	-612(ra) # 80001350 <_Z8mem_freePv>
}
    800025bc:	00813083          	ld	ra,8(sp)
    800025c0:	00013403          	ld	s0,0(sp)
    800025c4:	01010113          	addi	sp,sp,16
    800025c8:	00008067          	ret

00000000800025cc <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (* body)(void*), void* arg) {
    800025cc:	fd010113          	addi	sp,sp,-48
    800025d0:	02113423          	sd	ra,40(sp)
    800025d4:	02813023          	sd	s0,32(sp)
    800025d8:	00913c23          	sd	s1,24(sp)
    800025dc:	01213823          	sd	s2,16(sp)
    800025e0:	01313423          	sd	s3,8(sp)
    800025e4:	03010413          	addi	s0,sp,48
    800025e8:	00050493          	mv	s1,a0
    800025ec:	00058913          	mv	s2,a1
    800025f0:	00060993          	mv	s3,a2
    800025f4:	00009797          	auipc	a5,0x9
    800025f8:	2ac78793          	addi	a5,a5,684 # 8000b8a0 <_ZTV6Thread+0x10>
    800025fc:	00f53023          	sd	a5,0(a0)
	this->body = body;
    80002600:	00b53823          	sd	a1,16(a0)
	this->arg = arg;
    80002604:	00c53c23          	sd	a2,24(a0)
	if (body != nullptr) {
    80002608:	04058663          	beqz	a1,80002654 <_ZN6ThreadC1EPFvPvES0_+0x88>
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    8000260c:	00001537          	lui	a0,0x1
    80002610:	fffff097          	auipc	ra,0xfffff
    80002614:	d00080e7          	jalr	-768(ra) # 80001310 <_Z9mem_allocm>
    80002618:	00050313          	mv	t1,a0
	__asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000261c:	00030713          	mv	a4,t1
	__asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002620:	00098693          	mv	a3,s3
			body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002624:	00090613          	mv	a2,s2
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002628:	00848493          	addi	s1,s1,8
    8000262c:	00048593          	mv	a1,s1
	__asm__ volatile("li a0, 0x80");
    80002630:	08000513          	li	a0,128
	__asm__ volatile("ecall");
    80002634:	00000073          	ecall
}
    80002638:	02813083          	ld	ra,40(sp)
    8000263c:	02013403          	ld	s0,32(sp)
    80002640:	01813483          	ld	s1,24(sp)
    80002644:	01013903          	ld	s2,16(sp)
    80002648:	00813983          	ld	s3,8(sp)
    8000264c:	03010113          	addi	sp,sp,48
    80002650:	00008067          	ret
	uint64* stack = nullptr;
    80002654:	00000313          	li	t1,0
    80002658:	fc5ff06f          	j	8000261c <_ZN6ThreadC1EPFvPvES0_+0x50>

000000008000265c <_ZN6Thread5startEv>:
int Thread::start() {
    8000265c:	ff010113          	addi	sp,sp,-16
    80002660:	00813423          	sd	s0,8(sp)
    80002664:	01010413          	addi	s0,sp,16
	if (myHandle == nullptr) return -1;
    80002668:	00853303          	ld	t1,8(a0) # 1008 <_entry-0x7fffeff8>
    8000266c:	02030063          	beqz	t1,8000268c <_ZN6Thread5startEv+0x30>
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002670:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x81");
    80002674:	08100513          	li	a0,129
	__asm__ volatile("ecall");
    80002678:	00000073          	ecall
	return 0;
    8000267c:	00000513          	li	a0,0
}
    80002680:	00813403          	ld	s0,8(sp)
    80002684:	01010113          	addi	sp,sp,16
    80002688:	00008067          	ret
	if (myHandle == nullptr) return -1;
    8000268c:	fff00513          	li	a0,-1
    80002690:	ff1ff06f          	j	80002680 <_ZN6Thread5startEv+0x24>

0000000080002694 <_ZN6Thread4joinEv>:
void Thread::join() {
    80002694:	ff010113          	addi	sp,sp,-16
    80002698:	00113423          	sd	ra,8(sp)
    8000269c:	00813023          	sd	s0,0(sp)
    800026a0:	01010413          	addi	s0,sp,16
	thread_join(myHandle);
    800026a4:	00853503          	ld	a0,8(a0)
    800026a8:	fffff097          	auipc	ra,0xfffff
    800026ac:	da0080e7          	jalr	-608(ra) # 80001448 <_Z11thread_joinP3TCB>
}
    800026b0:	00813083          	ld	ra,8(sp)
    800026b4:	00013403          	ld	s0,0(sp)
    800026b8:	01010113          	addi	sp,sp,16
    800026bc:	00008067          	ret

00000000800026c0 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    800026c0:	ff010113          	addi	sp,sp,-16
    800026c4:	00113423          	sd	ra,8(sp)
    800026c8:	00813023          	sd	s0,0(sp)
    800026cc:	01010413          	addi	s0,sp,16
	thread_dispatch();
    800026d0:	fffff097          	auipc	ra,0xfffff
    800026d4:	d58080e7          	jalr	-680(ra) # 80001428 <_Z15thread_dispatchv>
}
    800026d8:	00813083          	ld	ra,8(sp)
    800026dc:	00013403          	ld	s0,0(sp)
    800026e0:	01010113          	addi	sp,sp,16
    800026e4:	00008067          	ret

00000000800026e8 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t t) {
    800026e8:	ff010113          	addi	sp,sp,-16
    800026ec:	00113423          	sd	ra,8(sp)
    800026f0:	00813023          	sd	s0,0(sp)
    800026f4:	01010413          	addi	s0,sp,16
    800026f8:	00050593          	mv	a1,a0
	Scheduler::putToSleep(TCB::running, t);
    800026fc:	00009797          	auipc	a5,0x9
    80002700:	3e47b783          	ld	a5,996(a5) # 8000bae0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002704:	0007b503          	ld	a0,0(a5)
    80002708:	fffff097          	auipc	ra,0xfffff
    8000270c:	3cc080e7          	jalr	972(ra) # 80001ad4 <_ZN9Scheduler10putToSleepEP3TCBm>
}
    80002710:	00000513          	li	a0,0
    80002714:	00813083          	ld	ra,8(sp)
    80002718:	00013403          	ld	s0,0(sp)
    8000271c:	01010113          	addi	sp,sp,16
    80002720:	00008067          	ret

0000000080002724 <_ZN14PeriodicThread15periodicWrapperEPv>:
}

PeriodicThread::PeriodicThread(time_t period) : Thread(periodicWrapper, this), period(period) {
}

void PeriodicThread::periodicWrapper(void* pThread) {
    80002724:	fe010113          	addi	sp,sp,-32
    80002728:	00113c23          	sd	ra,24(sp)
    8000272c:	00813823          	sd	s0,16(sp)
    80002730:	00913423          	sd	s1,8(sp)
    80002734:	02010413          	addi	s0,sp,32
    80002738:	00050493          	mv	s1,a0
	if (pThread != nullptr) {
    8000273c:	02050263          	beqz	a0,80002760 <_ZN14PeriodicThread15periodicWrapperEPv+0x3c>
		PeriodicThread* ptr = (PeriodicThread*)pThread;
		while (1) {
			ptr->periodicActivation();
    80002740:	0004b783          	ld	a5,0(s1)
    80002744:	0187b783          	ld	a5,24(a5)
    80002748:	00048513          	mv	a0,s1
    8000274c:	000780e7          	jalr	a5
			Thread::sleep(ptr->period);
    80002750:	0204b503          	ld	a0,32(s1)
    80002754:	00000097          	auipc	ra,0x0
    80002758:	f94080e7          	jalr	-108(ra) # 800026e8 <_ZN6Thread5sleepEm>
		while (1) {
    8000275c:	fe5ff06f          	j	80002740 <_ZN14PeriodicThread15periodicWrapperEPv+0x1c>
		}
	}
}
    80002760:	01813083          	ld	ra,24(sp)
    80002764:	01013403          	ld	s0,16(sp)
    80002768:	00813483          	ld	s1,8(sp)
    8000276c:	02010113          	addi	sp,sp,32
    80002770:	00008067          	ret

0000000080002774 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80002774:	fe010113          	addi	sp,sp,-32
    80002778:	00113c23          	sd	ra,24(sp)
    8000277c:	00813823          	sd	s0,16(sp)
    80002780:	00913423          	sd	s1,8(sp)
    80002784:	02010413          	addi	s0,sp,32
    80002788:	00050493          	mv	s1,a0
    8000278c:	00009797          	auipc	a5,0x9
    80002790:	11478793          	addi	a5,a5,276 # 8000b8a0 <_ZTV6Thread+0x10>
    80002794:	00f53023          	sd	a5,0(a0)
	this->body = wrapper;
    80002798:	00000797          	auipc	a5,0x0
    8000279c:	bf078793          	addi	a5,a5,-1040 # 80002388 <_ZN6Thread7wrapperEPv>
    800027a0:	00f53823          	sd	a5,16(a0)
	this->arg = this;
    800027a4:	00a53c23          	sd	a0,24(a0)
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    800027a8:	00001537          	lui	a0,0x1
    800027ac:	fffff097          	auipc	ra,0xfffff
    800027b0:	b64080e7          	jalr	-1180(ra) # 80001310 <_Z9mem_allocm>
    800027b4:	00050313          	mv	t1,a0
	__asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800027b8:	00030713          	mv	a4,t1
	__asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800027bc:	0184b303          	ld	t1,24(s1)
    800027c0:	00030693          	mv	a3,t1
			body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800027c4:	0104b303          	ld	t1,16(s1)
    800027c8:	00030613          	mv	a2,t1
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800027cc:	00848493          	addi	s1,s1,8
    800027d0:	00048593          	mv	a1,s1
	__asm__ volatile("li a0, 0x80");
    800027d4:	08000513          	li	a0,128
	__asm__ volatile("ecall");
    800027d8:	00000073          	ecall
}
    800027dc:	01813083          	ld	ra,24(sp)
    800027e0:	01013403          	ld	s0,16(sp)
    800027e4:	00813483          	ld	s1,8(sp)
    800027e8:	02010113          	addi	sp,sp,32
    800027ec:	00008067          	ret

00000000800027f0 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    800027f0:	ff010113          	addi	sp,sp,-16
    800027f4:	00113423          	sd	ra,8(sp)
    800027f8:	00813023          	sd	s0,0(sp)
    800027fc:	01010413          	addi	s0,sp,16
    80002800:	00009797          	auipc	a5,0x9
    80002804:	0c878793          	addi	a5,a5,200 # 8000b8c8 <_ZTV9Semaphore+0x10>
    80002808:	00f53023          	sd	a5,0(a0) # 1000 <_entry-0x7ffff000>
	sem_open(&myHandle, init);
    8000280c:	00850513          	addi	a0,a0,8
    80002810:	fffff097          	auipc	ra,0xfffff
    80002814:	c90080e7          	jalr	-880(ra) # 800014a0 <_Z8sem_openPP4KSemj>
}
    80002818:	00813083          	ld	ra,8(sp)
    8000281c:	00013403          	ld	s0,0(sp)
    80002820:	01010113          	addi	sp,sp,16
    80002824:	00008067          	ret

0000000080002828 <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    80002828:	ff010113          	addi	sp,sp,-16
    8000282c:	00113423          	sd	ra,8(sp)
    80002830:	00813023          	sd	s0,0(sp)
    80002834:	01010413          	addi	s0,sp,16
	return sem_wait(myHandle);
    80002838:	00853503          	ld	a0,8(a0)
    8000283c:	fffff097          	auipc	ra,0xfffff
    80002840:	ccc080e7          	jalr	-820(ra) # 80001508 <_Z8sem_waitP4KSem>
}
    80002844:	00813083          	ld	ra,8(sp)
    80002848:	00013403          	ld	s0,0(sp)
    8000284c:	01010113          	addi	sp,sp,16
    80002850:	00008067          	ret

0000000080002854 <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    80002854:	ff010113          	addi	sp,sp,-16
    80002858:	00113423          	sd	ra,8(sp)
    8000285c:	00813023          	sd	s0,0(sp)
    80002860:	01010413          	addi	s0,sp,16
	return sem_signal(myHandle);
    80002864:	00853503          	ld	a0,8(a0)
    80002868:	fffff097          	auipc	ra,0xfffff
    8000286c:	cd0080e7          	jalr	-816(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    80002870:	00813083          	ld	ra,8(sp)
    80002874:	00013403          	ld	s0,0(sp)
    80002878:	01010113          	addi	sp,sp,16
    8000287c:	00008067          	ret

0000000080002880 <_ZN14PeriodicThread9terminateEv>:
void PeriodicThread::terminate() {
    80002880:	ff010113          	addi	sp,sp,-16
    80002884:	00813423          	sd	s0,8(sp)
    80002888:	01010413          	addi	s0,sp,16
}
    8000288c:	00813403          	ld	s0,8(sp)
    80002890:	01010113          	addi	sp,sp,16
    80002894:	00008067          	ret

0000000080002898 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period) : Thread(periodicWrapper, this), period(period) {
    80002898:	fe010113          	addi	sp,sp,-32
    8000289c:	00113c23          	sd	ra,24(sp)
    800028a0:	00813823          	sd	s0,16(sp)
    800028a4:	00913423          	sd	s1,8(sp)
    800028a8:	01213023          	sd	s2,0(sp)
    800028ac:	02010413          	addi	s0,sp,32
    800028b0:	00050493          	mv	s1,a0
    800028b4:	00058913          	mv	s2,a1
    800028b8:	00050613          	mv	a2,a0
    800028bc:	00000597          	auipc	a1,0x0
    800028c0:	e6858593          	addi	a1,a1,-408 # 80002724 <_ZN14PeriodicThread15periodicWrapperEPv>
    800028c4:	00000097          	auipc	ra,0x0
    800028c8:	d08080e7          	jalr	-760(ra) # 800025cc <_ZN6ThreadC1EPFvPvES0_>
    800028cc:	00009797          	auipc	a5,0x9
    800028d0:	fa478793          	addi	a5,a5,-92 # 8000b870 <_ZTV14PeriodicThread+0x10>
    800028d4:	00f4b023          	sd	a5,0(s1)
    800028d8:	0324b023          	sd	s2,32(s1)
}
    800028dc:	01813083          	ld	ra,24(sp)
    800028e0:	01013403          	ld	s0,16(sp)
    800028e4:	00813483          	ld	s1,8(sp)
    800028e8:	00013903          	ld	s2,0(sp)
    800028ec:	02010113          	addi	sp,sp,32
    800028f0:	00008067          	ret

00000000800028f4 <_ZN7Console4getcEv>:

char Console::getc() {
    800028f4:	ff010113          	addi	sp,sp,-16
    800028f8:	00113423          	sd	ra,8(sp)
    800028fc:	00813023          	sd	s0,0(sp)
    80002900:	01010413          	addi	s0,sp,16
	return ::getc();
    80002904:	fffff097          	auipc	ra,0xfffff
    80002908:	c64080e7          	jalr	-924(ra) # 80001568 <_Z4getcv>
}
    8000290c:	00813083          	ld	ra,8(sp)
    80002910:	00013403          	ld	s0,0(sp)
    80002914:	01010113          	addi	sp,sp,16
    80002918:	00008067          	ret

000000008000291c <_ZN7Console4putcEc>:

void Console::putc(char c) {
    8000291c:	ff010113          	addi	sp,sp,-16
    80002920:	00113423          	sd	ra,8(sp)
    80002924:	00813023          	sd	s0,0(sp)
    80002928:	01010413          	addi	s0,sp,16
	::putc(c);
    8000292c:	fffff097          	auipc	ra,0xfffff
    80002930:	c64080e7          	jalr	-924(ra) # 80001590 <_Z4putcc>
}
    80002934:	00813083          	ld	ra,8(sp)
    80002938:	00013403          	ld	s0,0(sp)
    8000293c:	01010113          	addi	sp,sp,16
    80002940:	00008067          	ret

0000000080002944 <_ZN6Thread3runEv>:
	static int sleep(time_t);

protected:
	Thread();

	virtual void run() {}
    80002944:	ff010113          	addi	sp,sp,-16
    80002948:	00813423          	sd	s0,8(sp)
    8000294c:	01010413          	addi	s0,sp,16
    80002950:	00813403          	ld	s0,8(sp)
    80002954:	01010113          	addi	sp,sp,16
    80002958:	00008067          	ret

000000008000295c <_ZN14PeriodicThread18periodicActivationEv>:
	void terminate();

protected:
	PeriodicThread(time_t period);

	virtual void periodicActivation() {}
    8000295c:	ff010113          	addi	sp,sp,-16
    80002960:	00813423          	sd	s0,8(sp)
    80002964:	01010413          	addi	s0,sp,16
    80002968:	00813403          	ld	s0,8(sp)
    8000296c:	01010113          	addi	sp,sp,16
    80002970:	00008067          	ret

0000000080002974 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80002974:	ff010113          	addi	sp,sp,-16
    80002978:	00113423          	sd	ra,8(sp)
    8000297c:	00813023          	sd	s0,0(sp)
    80002980:	01010413          	addi	s0,sp,16
    80002984:	00009797          	auipc	a5,0x9
    80002988:	eec78793          	addi	a5,a5,-276 # 8000b870 <_ZTV14PeriodicThread+0x10>
    8000298c:	00f53023          	sd	a5,0(a0)
    80002990:	00000097          	auipc	ra,0x0
    80002994:	a2c080e7          	jalr	-1492(ra) # 800023bc <_ZN6ThreadD1Ev>
    80002998:	00813083          	ld	ra,8(sp)
    8000299c:	00013403          	ld	s0,0(sp)
    800029a0:	01010113          	addi	sp,sp,16
    800029a4:	00008067          	ret

00000000800029a8 <_ZN14PeriodicThreadD0Ev>:
    800029a8:	fe010113          	addi	sp,sp,-32
    800029ac:	00113c23          	sd	ra,24(sp)
    800029b0:	00813823          	sd	s0,16(sp)
    800029b4:	00913423          	sd	s1,8(sp)
    800029b8:	02010413          	addi	s0,sp,32
    800029bc:	00050493          	mv	s1,a0
    800029c0:	00009797          	auipc	a5,0x9
    800029c4:	eb078793          	addi	a5,a5,-336 # 8000b870 <_ZTV14PeriodicThread+0x10>
    800029c8:	00f53023          	sd	a5,0(a0)
    800029cc:	00000097          	auipc	ra,0x0
    800029d0:	9f0080e7          	jalr	-1552(ra) # 800023bc <_ZN6ThreadD1Ev>
    800029d4:	00048513          	mv	a0,s1
    800029d8:	00000097          	auipc	ra,0x0
    800029dc:	b24080e7          	jalr	-1244(ra) # 800024fc <_ZdlPv>
    800029e0:	01813083          	ld	ra,24(sp)
    800029e4:	01013403          	ld	s0,16(sp)
    800029e8:	00813483          	ld	s1,8(sp)
    800029ec:	02010113          	addi	sp,sp,32
    800029f0:	00008067          	ret

00000000800029f4 <_ZN3TCB7wrapperEv>:
	Riscv::pushRegisters();
	TCB::dispatch();
	Riscv::popRegisters();
}

void TCB::wrapper() {
    800029f4:	ff010113          	addi	sp,sp,-16
    800029f8:	00113423          	sd	ra,8(sp)
    800029fc:	00813023          	sd	s0,0(sp)
    80002a00:	01010413          	addi	s0,sp,16
	//pocetak wrappera se izvrsava u supervisor modu,
	//jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch/yield)
	Riscv::popSppSpie();
    80002a04:	00000097          	auipc	ra,0x0
    80002a08:	308080e7          	jalr	776(ra) # 80002d0c <_ZN5Riscv10popSppSpieEv>
	//na dalje se izvrsavamo u user modu
	running->threadFunction(running->args);
    80002a0c:	00009797          	auipc	a5,0x9
    80002a10:	21c7b783          	ld	a5,540(a5) # 8000bc28 <_ZN3TCB7runningE>
    80002a14:	0107b703          	ld	a4,16(a5)
    80002a18:	0207b503          	ld	a0,32(a5)
    80002a1c:	000700e7          	jalr	a4
	//running->finished = true;
	//i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
	thread_exit();
    80002a20:	fffff097          	auipc	ra,0xfffff
    80002a24:	9e0080e7          	jalr	-1568(ra) # 80001400 <_Z11thread_exitv>
}
    80002a28:	00813083          	ld	ra,8(sp)
    80002a2c:	00013403          	ld	s0,0(sp)
    80002a30:	01010113          	addi	sp,sp,16
    80002a34:	00008067          	ret

0000000080002a38 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80002a38:	fe010113          	addi	sp,sp,-32
    80002a3c:	00113c23          	sd	ra,24(sp)
    80002a40:	00813823          	sd	s0,16(sp)
    80002a44:	00913423          	sd	s1,8(sp)
    80002a48:	02010413          	addi	s0,sp,32
	TCB* old = TCB::running;
    80002a4c:	00009497          	auipc	s1,0x9
    80002a50:	1dc4b483          	ld	s1,476(s1) # 8000bc28 <_ZN3TCB7runningE>
	if (!old->finished && !old->blocked && old->timeToSleep == 0 && !old->needToJoin) {
    80002a54:	0304c783          	lbu	a5,48(s1)
    80002a58:	00079e63          	bnez	a5,80002a74 <_ZN3TCB8dispatchEv+0x3c>
    80002a5c:	0314c783          	lbu	a5,49(s1)
    80002a60:	00079a63          	bnez	a5,80002a74 <_ZN3TCB8dispatchEv+0x3c>
    80002a64:	0404b783          	ld	a5,64(s1)
    80002a68:	00079663          	bnez	a5,80002a74 <_ZN3TCB8dispatchEv+0x3c>
    80002a6c:	0324c783          	lbu	a5,50(s1)
    80002a70:	04078663          	beqz	a5,80002abc <_ZN3TCB8dispatchEv+0x84>
	TCB::running = Scheduler::get();
    80002a74:	fffff097          	auipc	ra,0xfffff
    80002a78:	020080e7          	jalr	32(ra) # 80001a94 <_ZN9Scheduler3getEv>
    80002a7c:	00050593          	mv	a1,a0
    80002a80:	00009797          	auipc	a5,0x9
    80002a84:	1a878793          	addi	a5,a5,424 # 8000bc28 <_ZN3TCB7runningE>
    80002a88:	00a7b023          	sd	a0,0(a5)
	TCB::runningTimeSlice = 0;
    80002a8c:	0007b423          	sd	zero,8(a5)
	if (TCB::running->threadFunction == nullptr || TCB::running->threadFunction == kernelConsumerFunction ||
    80002a90:	01053783          	ld	a5,16(a0)
    80002a94:	02078c63          	beqz	a5,80002acc <_ZN3TCB8dispatchEv+0x94>
    80002a98:	00009717          	auipc	a4,0x9
    80002a9c:	02073703          	ld	a4,32(a4) # 8000bab8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002aa0:	02e78663          	beq	a5,a4,80002acc <_ZN3TCB8dispatchEv+0x94>
    80002aa4:	00009717          	auipc	a4,0x9
    80002aa8:	05473703          	ld	a4,84(a4) # 8000baf8 <_GLOBAL_OFFSET_TABLE_+0x70>
    80002aac:	02e78063          	beq	a5,a4,80002acc <_ZN3TCB8dispatchEv+0x94>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002ab0:	10000793          	li	a5,256
    80002ab4:	1007b073          	csrc	sstatus,a5
}
    80002ab8:	01c0006f          	j	80002ad4 <_ZN3TCB8dispatchEv+0x9c>
		Scheduler::put(old);
    80002abc:	00048513          	mv	a0,s1
    80002ac0:	fffff097          	auipc	ra,0xfffff
    80002ac4:	f90080e7          	jalr	-112(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
    80002ac8:	fadff06f          	j	80002a74 <_ZN3TCB8dispatchEv+0x3c>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80002acc:	10000793          	li	a5,256
    80002ad0:	1007a073          	csrs	sstatus,a5
	if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    80002ad4:	00b48863          	beq	s1,a1,80002ae4 <_ZN3TCB8dispatchEv+0xac>
    80002ad8:	00048513          	mv	a0,s1
    80002adc:	ffffe097          	auipc	ra,0xffffe
    80002ae0:	734080e7          	jalr	1844(ra) # 80001210 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80002ae4:	01813083          	ld	ra,24(sp)
    80002ae8:	01013403          	ld	s0,16(sp)
    80002aec:	00813483          	ld	s1,8(sp)
    80002af0:	02010113          	addi	sp,sp,32
    80002af4:	00008067          	ret

0000000080002af8 <_ZN3TCB5yieldEv>:
void TCB::yield() {
    80002af8:	ff010113          	addi	sp,sp,-16
    80002afc:	00113423          	sd	ra,8(sp)
    80002b00:	00813023          	sd	s0,0(sp)
    80002b04:	01010413          	addi	s0,sp,16
	Riscv::pushRegisters();
    80002b08:	ffffe097          	auipc	ra,0xffffe
    80002b0c:	4f8080e7          	jalr	1272(ra) # 80001000 <_ZN5Riscv13pushRegistersEv>
	TCB::dispatch();
    80002b10:	00000097          	auipc	ra,0x0
    80002b14:	f28080e7          	jalr	-216(ra) # 80002a38 <_ZN3TCB8dispatchEv>
	Riscv::popRegisters();
    80002b18:	ffffe097          	auipc	ra,0xffffe
    80002b1c:	564080e7          	jalr	1380(ra) # 8000107c <_ZN5Riscv12popRegistersEv>
}
    80002b20:	00813083          	ld	ra,8(sp)
    80002b24:	00013403          	ld	s0,0(sp)
    80002b28:	01010113          	addi	sp,sp,16
    80002b2c:	00008067          	ret

0000000080002b30 <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    80002b30:	ff010113          	addi	sp,sp,-16
    80002b34:	00113423          	sd	ra,8(sp)
    80002b38:	00813023          	sd	s0,0(sp)
    80002b3c:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80002b40:	ffffe097          	auipc	ra,0xffffe
    80002b44:	7d0080e7          	jalr	2000(ra) # 80001310 <_Z9mem_allocm>
	//return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::THREAD);
}
    80002b48:	00813083          	ld	ra,8(sp)
    80002b4c:	00013403          	ld	s0,0(sp)
    80002b50:	01010113          	addi	sp,sp,16
    80002b54:	00008067          	ret

0000000080002b58 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    80002b58:	fd010113          	addi	sp,sp,-48
    80002b5c:	02113423          	sd	ra,40(sp)
    80002b60:	02813023          	sd	s0,32(sp)
    80002b64:	00913c23          	sd	s1,24(sp)
    80002b68:	01213823          	sd	s2,16(sp)
    80002b6c:	01313423          	sd	s3,8(sp)
    80002b70:	03010413          	addi	s0,sp,48
    80002b74:	00050913          	mv	s2,a0
    80002b78:	00058993          	mv	s3,a1
    80002b7c:	00060493          	mv	s1,a2
	TCB* newThread = new TCB(function, args, stack);
    80002b80:	06000513          	li	a0,96
    80002b84:	00000097          	auipc	ra,0x0
    80002b88:	fac080e7          	jalr	-84(ra) # 80002b30 <_ZN3TCBnwEm>


	TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
													timeSlice(DEFAULT_TIME_SLICE), finished(false), blocked(false),
													needToJoin(false),
													nextInScheduler(nullptr), timeToSleep(0), nextSleeping(nullptr) {
    80002b8c:	01253823          	sd	s2,16(a0)
    80002b90:	00953c23          	sd	s1,24(a0)
    80002b94:	03353023          	sd	s3,32(a0)
    80002b98:	00200793          	li	a5,2
    80002b9c:	02f53423          	sd	a5,40(a0)
    80002ba0:	02050823          	sb	zero,48(a0)
    80002ba4:	020508a3          	sb	zero,49(a0)
    80002ba8:	02050923          	sb	zero,50(a0)
    80002bac:	02053c23          	sd	zero,56(a0)
    80002bb0:	04053023          	sd	zero,64(a0)
    80002bb4:	04053423          	sd	zero,72(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    80002bb8:	04053823          	sd	zero,80(a0)
    80002bbc:	04053c23          	sd	zero,88(a0)
		//formiranje pocetnog konteksta; specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80002bc0:	02090e63          	beqz	s2,80002bfc <_ZN3TCB12createThreadEPFvPvES0_Pm+0xa4>
    80002bc4:	00000797          	auipc	a5,0x0
    80002bc8:	e3078793          	addi	a5,a5,-464 # 800029f4 <_ZN3TCB7wrapperEv>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80002bcc:	02048c63          	beqz	s1,80002c04 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xac>
    80002bd0:	00008637          	lui	a2,0x8
    80002bd4:	00c484b3          	add	s1,s1,a2
		this->context.ra = startRa;
    80002bd8:	00f53023          	sd	a5,0(a0)
		this->context.sp = startSp;
    80002bdc:	00953423          	sd	s1,8(a0)
}
    80002be0:	02813083          	ld	ra,40(sp)
    80002be4:	02013403          	ld	s0,32(sp)
    80002be8:	01813483          	ld	s1,24(sp)
    80002bec:	01013903          	ld	s2,16(sp)
    80002bf0:	00813983          	ld	s3,8(sp)
    80002bf4:	03010113          	addi	sp,sp,48
    80002bf8:	00008067          	ret
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80002bfc:	00000793          	li	a5,0
    80002c00:	fcdff06f          	j	80002bcc <_ZN3TCB12createThreadEPFvPvES0_Pm+0x74>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80002c04:	00000493          	li	s1,0
    80002c08:	fd1ff06f          	j	80002bd8 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x80>

0000000080002c0c <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    80002c0c:	ff010113          	addi	sp,sp,-16
    80002c10:	00113423          	sd	ra,8(sp)
    80002c14:	00813023          	sd	s0,0(sp)
    80002c18:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80002c1c:	ffffe097          	auipc	ra,0xffffe
    80002c20:	734080e7          	jalr	1844(ra) # 80001350 <_Z8mem_freePv>
	//MemoryAllocator::kfree(ptr);
}
    80002c24:	00813083          	ld	ra,8(sp)
    80002c28:	00013403          	ld	s0,0(sp)
    80002c2c:	01010113          	addi	sp,sp,16
    80002c30:	00008067          	ret

0000000080002c34 <_ZN3TCB10threadJoinEPS_>:

void TCB::threadJoin(TCB* handle) {
	if (handle->finished) return;
    80002c34:	03054783          	lbu	a5,48(a0)
    80002c38:	00078463          	beqz	a5,80002c40 <_ZN3TCB10threadJoinEPS_+0xc>
    80002c3c:	00008067          	ret
void TCB::threadJoin(TCB* handle) {
    80002c40:	ff010113          	addi	sp,sp,-16
    80002c44:	00113423          	sd	ra,8(sp)
    80002c48:	00813023          	sd	s0,0(sp)
    80002c4c:	01010413          	addi	s0,sp,16
	TCB::running->needToJoin = true;
    80002c50:	00009597          	auipc	a1,0x9
    80002c54:	fd85b583          	ld	a1,-40(a1) # 8000bc28 <_ZN3TCB7runningE>
    80002c58:	00100793          	li	a5,1
    80002c5c:	02f58923          	sb	a5,50(a1)
	handle->waitingToJoin.putLast(TCB::running);
    80002c60:	05050513          	addi	a0,a0,80
    80002c64:	ffffe097          	auipc	ra,0xffffe
    80002c68:	5e0080e7          	jalr	1504(ra) # 80001244 <_ZN11ThreadQueue7putLastEP3TCB>
}
    80002c6c:	00813083          	ld	ra,8(sp)
    80002c70:	00013403          	ld	s0,0(sp)
    80002c74:	01010113          	addi	sp,sp,16
    80002c78:	00008067          	ret

0000000080002c7c <_ZN3TCB13releaseJoinedEv>:

void TCB::releaseJoined() {
	while (!TCB::running->waitingToJoin.isEmpty()) {
    80002c7c:	00009517          	auipc	a0,0x9
    80002c80:	fac53503          	ld	a0,-84(a0) # 8000bc28 <_ZN3TCB7runningE>
        bool ret = front == nullptr;
    80002c84:	05053783          	ld	a5,80(a0)
    80002c88:	04078663          	beqz	a5,80002cd4 <_ZN3TCB13releaseJoinedEv+0x58>
void TCB::releaseJoined() {
    80002c8c:	ff010113          	addi	sp,sp,-16
    80002c90:	00113423          	sd	ra,8(sp)
    80002c94:	00813023          	sd	s0,0(sp)
    80002c98:	01010413          	addi	s0,sp,16
		TCB* tcb = TCB::running->waitingToJoin.getFirst();
    80002c9c:	05050513          	addi	a0,a0,80
    80002ca0:	ffffe097          	auipc	ra,0xffffe
    80002ca4:	610080e7          	jalr	1552(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
		tcb->needToJoin = false;
    80002ca8:	02050923          	sb	zero,50(a0)
		Scheduler::put(tcb);
    80002cac:	fffff097          	auipc	ra,0xfffff
    80002cb0:	da4080e7          	jalr	-604(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
	while (!TCB::running->waitingToJoin.isEmpty()) {
    80002cb4:	00009517          	auipc	a0,0x9
    80002cb8:	f7453503          	ld	a0,-140(a0) # 8000bc28 <_ZN3TCB7runningE>
    80002cbc:	05053783          	ld	a5,80(a0)
    80002cc0:	fc079ee3          	bnez	a5,80002c9c <_ZN3TCB13releaseJoinedEv+0x20>
	}
}
    80002cc4:	00813083          	ld	ra,8(sp)
    80002cc8:	00013403          	ld	s0,0(sp)
    80002ccc:	01010113          	addi	sp,sp,16
    80002cd0:	00008067          	ret
    80002cd4:	00008067          	ret

0000000080002cd8 <_ZN3TCB5startEPS_>:

void TCB::start(TCB* newTcb) {
	//startovanje niti(stavljanje u Scheduler); main nit je vec aktivna, ne stavlja se u Scheduler
	if (newTcb->threadFunction != nullptr) Scheduler::put(newTcb);
    80002cd8:	01053783          	ld	a5,16(a0)
    80002cdc:	02078663          	beqz	a5,80002d08 <_ZN3TCB5startEPS_+0x30>
void TCB::start(TCB* newTcb) {
    80002ce0:	ff010113          	addi	sp,sp,-16
    80002ce4:	00113423          	sd	ra,8(sp)
    80002ce8:	00813023          	sd	s0,0(sp)
    80002cec:	01010413          	addi	s0,sp,16
	if (newTcb->threadFunction != nullptr) Scheduler::put(newTcb);
    80002cf0:	fffff097          	auipc	ra,0xfffff
    80002cf4:	d60080e7          	jalr	-672(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
}
    80002cf8:	00813083          	ld	ra,8(sp)
    80002cfc:	00013403          	ld	s0,0(sp)
    80002d00:	01010113          	addi	sp,sp,16
    80002d04:	00008067          	ret
    80002d08:	00008067          	ret

0000000080002d0c <_ZN5Riscv10popSppSpieEv>:
// Created by os on 5/17/23.
//

#include "../h/Riscv.hpp"

void Riscv::popSppSpie() {
    80002d0c:	ff010113          	addi	sp,sp,-16
    80002d10:	00813423          	sd	s0,8(sp)
    80002d14:	01010413          	addi	s0,sp,16
	//ra pokazuje iza ove funkcije na nastavak wrappera
	__asm__ volatile("csrw sepc, ra");
    80002d18:	14109073          	csrw	sepc,ra
	__asm__ volatile("sret");
    80002d1c:	10200073          	sret
    80002d20:	00813403          	ld	s0,8(sp)
    80002d24:	01010113          	addi	sp,sp,16
    80002d28:	00008067          	ret

0000000080002d2c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>:
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

#pragma GCC optimize("O0")

void* MemoryAllocator::kmalloc(size_t size, Purpose pur) {
    80002d2c:	fa010113          	addi	sp,sp,-96
    80002d30:	04813c23          	sd	s0,88(sp)
    80002d34:	06010413          	addi	s0,sp,96
    80002d38:	faa43423          	sd	a0,-88(s0)
    80002d3c:	00058793          	mv	a5,a1
    80002d40:	faf42223          	sw	a5,-92(s0)
    //size je u broju bajtova, ukljucuje i mesto potrebno za zaglavlje UsedMemSegment
    if (size <= 0) return nullptr;
    80002d44:	fa843783          	ld	a5,-88(s0)
    80002d48:	00079663          	bnez	a5,80002d54 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x28>
    80002d4c:	00000793          	li	a5,0
    80002d50:	2740006f          	j	80002fc4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x298>
//        printString("Greska");
//    }

    //alokacija uvek zaokruzena na blokove
    //size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
    size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80002d54:	fa843783          	ld	a5,-88(s0)
    80002d58:	0067d713          	srli	a4,a5,0x6
    80002d5c:	fa843783          	ld	a5,-88(s0)
    80002d60:	03f7f793          	andi	a5,a5,63
    80002d64:	00078663          	beqz	a5,80002d70 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x44>
    80002d68:	00100793          	li	a5,1
    80002d6c:	0080006f          	j	80002d74 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x48>
    80002d70:	00000793          	li	a5,0
    80002d74:	00e787b3          	add	a5,a5,a4
    80002d78:	fcf43823          	sd	a5,-48(s0)
    size = blocks * MEM_BLOCK_SIZE;
    80002d7c:	fd043783          	ld	a5,-48(s0)
    80002d80:	00679793          	slli	a5,a5,0x6
    80002d84:	faf43423          	sd	a5,-88(s0)

    //trazenje slobodnog segmenta po first-fit algoritmu
    for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80002d88:	00009797          	auipc	a5,0x9
    80002d8c:	eb878793          	addi	a5,a5,-328 # 8000bc40 <_ZN15MemoryAllocator11freeMemHeadE>
    80002d90:	0007b783          	ld	a5,0(a5)
    80002d94:	fef43423          	sd	a5,-24(s0)
    80002d98:	fe843783          	ld	a5,-24(s0)
    80002d9c:	22078263          	beqz	a5,80002fc0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x294>
        if (current->size < size) continue;
    80002da0:	fe843783          	ld	a5,-24(s0)
    80002da4:	0107b783          	ld	a5,16(a5)
    80002da8:	fa843703          	ld	a4,-88(s0)
    80002dac:	20e7e063          	bltu	a5,a4,80002fac <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x280>

        //pravljenje novog slobodnog fragmenta od ostatka fragmenta
        FreeMemSegment* remainderFree = (FreeMemSegment*) ((char*) current + size);
    80002db0:	fe843703          	ld	a4,-24(s0)
    80002db4:	fa843783          	ld	a5,-88(s0)
    80002db8:	00f707b3          	add	a5,a4,a5
    80002dbc:	fcf43423          	sd	a5,-56(s0)
        size_t remainingSize = current->size - size;
    80002dc0:	fe843783          	ld	a5,-24(s0)
    80002dc4:	0107b703          	ld	a4,16(a5)
    80002dc8:	fa843783          	ld	a5,-88(s0)
    80002dcc:	40f707b3          	sub	a5,a4,a5
    80002dd0:	fcf43023          	sd	a5,-64(s0)
        if (remainingSize <= sizeof(UsedMemSegment)) {
    80002dd4:	fc043703          	ld	a4,-64(s0)
    80002dd8:	02000793          	li	a5,32
    80002ddc:	08e7e063          	bltu	a5,a4,80002e5c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x130>
            //ne preostaje dovoljno veliki slobodni segment;dodeljujemo ceo trenutno alociranom
            size += remainingSize;
    80002de0:	fa843703          	ld	a4,-88(s0)
    80002de4:	fc043783          	ld	a5,-64(s0)
    80002de8:	00f707b3          	add	a5,a4,a5
    80002dec:	faf43423          	sd	a5,-88(s0)
            if (current->prev) current->prev->next = current->next;
    80002df0:	fe843783          	ld	a5,-24(s0)
    80002df4:	0087b783          	ld	a5,8(a5)
    80002df8:	00078c63          	beqz	a5,80002e10 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xe4>
    80002dfc:	fe843783          	ld	a5,-24(s0)
    80002e00:	0087b783          	ld	a5,8(a5)
    80002e04:	fe843703          	ld	a4,-24(s0)
    80002e08:	00073703          	ld	a4,0(a4)
    80002e0c:	00e7b023          	sd	a4,0(a5)
            if (current->next) current->next->prev = current->prev;
    80002e10:	fe843783          	ld	a5,-24(s0)
    80002e14:	0007b783          	ld	a5,0(a5)
    80002e18:	00078c63          	beqz	a5,80002e30 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x104>
    80002e1c:	fe843783          	ld	a5,-24(s0)
    80002e20:	0007b783          	ld	a5,0(a5)
    80002e24:	fe843703          	ld	a4,-24(s0)
    80002e28:	00873703          	ld	a4,8(a4)
    80002e2c:	00e7b423          	sd	a4,8(a5)
            if (freeMemHead == current) { freeMemHead = current->next; }
    80002e30:	00009797          	auipc	a5,0x9
    80002e34:	e1078793          	addi	a5,a5,-496 # 8000bc40 <_ZN15MemoryAllocator11freeMemHeadE>
    80002e38:	0007b783          	ld	a5,0(a5)
    80002e3c:	fe843703          	ld	a4,-24(s0)
    80002e40:	0af71263          	bne	a4,a5,80002ee4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b8>
    80002e44:	fe843783          	ld	a5,-24(s0)
    80002e48:	0007b703          	ld	a4,0(a5)
    80002e4c:	00009797          	auipc	a5,0x9
    80002e50:	df478793          	addi	a5,a5,-524 # 8000bc40 <_ZN15MemoryAllocator11freeMemHeadE>
    80002e54:	00e7b023          	sd	a4,0(a5)
    80002e58:	08c0006f          	j	80002ee4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b8>
        } else {
            remainderFree->size = remainingSize;
    80002e5c:	fc843783          	ld	a5,-56(s0)
    80002e60:	fc043703          	ld	a4,-64(s0)
    80002e64:	00e7b823          	sd	a4,16(a5)
            remainderFree->prev = current->prev;
    80002e68:	fe843783          	ld	a5,-24(s0)
    80002e6c:	0087b703          	ld	a4,8(a5)
    80002e70:	fc843783          	ld	a5,-56(s0)
    80002e74:	00e7b423          	sd	a4,8(a5)
            if (current->prev) current->prev->next = remainderFree;
    80002e78:	fe843783          	ld	a5,-24(s0)
    80002e7c:	0087b783          	ld	a5,8(a5)
    80002e80:	00078a63          	beqz	a5,80002e94 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x168>
    80002e84:	fe843783          	ld	a5,-24(s0)
    80002e88:	0087b783          	ld	a5,8(a5)
    80002e8c:	fc843703          	ld	a4,-56(s0)
    80002e90:	00e7b023          	sd	a4,0(a5)
            remainderFree->next = current->next;
    80002e94:	fe843783          	ld	a5,-24(s0)
    80002e98:	0007b703          	ld	a4,0(a5)
    80002e9c:	fc843783          	ld	a5,-56(s0)
    80002ea0:	00e7b023          	sd	a4,0(a5)
            if (current->next) current->next->prev = remainderFree;
    80002ea4:	fe843783          	ld	a5,-24(s0)
    80002ea8:	0007b783          	ld	a5,0(a5)
    80002eac:	00078a63          	beqz	a5,80002ec0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x194>
    80002eb0:	fe843783          	ld	a5,-24(s0)
    80002eb4:	0007b783          	ld	a5,0(a5)
    80002eb8:	fc843703          	ld	a4,-56(s0)
    80002ebc:	00e7b423          	sd	a4,8(a5)
            if (freeMemHead == current) { freeMemHead = remainderFree; }
    80002ec0:	00009797          	auipc	a5,0x9
    80002ec4:	d8078793          	addi	a5,a5,-640 # 8000bc40 <_ZN15MemoryAllocator11freeMemHeadE>
    80002ec8:	0007b783          	ld	a5,0(a5)
    80002ecc:	fe843703          	ld	a4,-24(s0)
    80002ed0:	00f71a63          	bne	a4,a5,80002ee4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b8>
    80002ed4:	00009797          	auipc	a5,0x9
    80002ed8:	d6c78793          	addi	a5,a5,-660 # 8000bc40 <_ZN15MemoryAllocator11freeMemHeadE>
    80002edc:	fc843703          	ld	a4,-56(s0)
    80002ee0:	00e7b023          	sd	a4,0(a5)
        }
        //ubacivanje novog fragmenta u listu zauzetih fragmenata
        UsedMemSegment* newFragment = (UsedMemSegment*) current;
    80002ee4:	fe843783          	ld	a5,-24(s0)
    80002ee8:	faf43c23          	sd	a5,-72(s0)
        newFragment->size = size;
    80002eec:	fb843783          	ld	a5,-72(s0)
    80002ef0:	fa843703          	ld	a4,-88(s0)
    80002ef4:	00e7b423          	sd	a4,8(a5)
        newFragment->purpose = pur;
    80002ef8:	fb843783          	ld	a5,-72(s0)
    80002efc:	fa442703          	lw	a4,-92(s0)
    80002f00:	00e7a823          	sw	a4,16(a5)
        newFragment->usableFirstAddress = (char*) newFragment + sizeof(UsedMemSegment);
    80002f04:	fb843783          	ld	a5,-72(s0)
    80002f08:	02078713          	addi	a4,a5,32
    80002f0c:	fb843783          	ld	a5,-72(s0)
    80002f10:	00e7bc23          	sd	a4,24(a5)
        UsedMemSegment* prevUsed = nullptr;
    80002f14:	fe043023          	sd	zero,-32(s0)
        for (UsedMemSegment* cur = usedMemHead;
    80002f18:	00009797          	auipc	a5,0x9
    80002f1c:	d2078793          	addi	a5,a5,-736 # 8000bc38 <_ZN15MemoryAllocator11usedMemHeadE>
    80002f20:	0007b783          	ld	a5,0(a5)
    80002f24:	fcf43c23          	sd	a5,-40(s0)
             cur && ((char*) cur < (char*) newFragment); cur = cur->next) {
    80002f28:	fd843783          	ld	a5,-40(s0)
    80002f2c:	02078463          	beqz	a5,80002f54 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
    80002f30:	fd843703          	ld	a4,-40(s0)
    80002f34:	fb843783          	ld	a5,-72(s0)
    80002f38:	00f77e63          	bgeu	a4,a5,80002f54 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
            prevUsed = cur;
    80002f3c:	fd843783          	ld	a5,-40(s0)
    80002f40:	fef43023          	sd	a5,-32(s0)
             cur && ((char*) cur < (char*) newFragment); cur = cur->next) {
    80002f44:	fd843783          	ld	a5,-40(s0)
    80002f48:	0007b783          	ld	a5,0(a5)
    80002f4c:	fcf43c23          	sd	a5,-40(s0)
        for (UsedMemSegment* cur = usedMemHead;
    80002f50:	fd9ff06f          	j	80002f28 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1fc>
        }
        if (!prevUsed) {
    80002f54:	fe043783          	ld	a5,-32(s0)
    80002f58:	02079663          	bnez	a5,80002f84 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x258>
            newFragment->next = usedMemHead;
    80002f5c:	00009797          	auipc	a5,0x9
    80002f60:	cdc78793          	addi	a5,a5,-804 # 8000bc38 <_ZN15MemoryAllocator11usedMemHeadE>
    80002f64:	0007b703          	ld	a4,0(a5)
    80002f68:	fb843783          	ld	a5,-72(s0)
    80002f6c:	00e7b023          	sd	a4,0(a5)
            usedMemHead = newFragment;
    80002f70:	00009797          	auipc	a5,0x9
    80002f74:	cc878793          	addi	a5,a5,-824 # 8000bc38 <_ZN15MemoryAllocator11usedMemHeadE>
    80002f78:	fb843703          	ld	a4,-72(s0)
    80002f7c:	00e7b023          	sd	a4,0(a5)
    80002f80:	0200006f          	j	80002fa0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x274>
        } else {
            newFragment->next = prevUsed->next;
    80002f84:	fe043783          	ld	a5,-32(s0)
    80002f88:	0007b703          	ld	a4,0(a5)
    80002f8c:	fb843783          	ld	a5,-72(s0)
    80002f90:	00e7b023          	sd	a4,0(a5)
            prevUsed->next = newFragment;
    80002f94:	fe043783          	ld	a5,-32(s0)
    80002f98:	fb843703          	ld	a4,-72(s0)
    80002f9c:	00e7b023          	sd	a4,0(a5)
        }
        //return (char*)newFragment + sizeof(UsedMemSegment);
        return newFragment->usableFirstAddress;
    80002fa0:	fb843783          	ld	a5,-72(s0)
    80002fa4:	0187b783          	ld	a5,24(a5)
    80002fa8:	01c0006f          	j	80002fc4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x298>
        if (current->size < size) continue;
    80002fac:	00000013          	nop
    for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80002fb0:	fe843783          	ld	a5,-24(s0)
    80002fb4:	0007b783          	ld	a5,0(a5)
    80002fb8:	fef43423          	sd	a5,-24(s0)
    80002fbc:	dddff06f          	j	80002d98 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x6c>
    }
    return nullptr;
    80002fc0:	00000793          	li	a5,0
}
    80002fc4:	00078513          	mv	a0,a5
    80002fc8:	05813403          	ld	s0,88(sp)
    80002fcc:	06010113          	addi	sp,sp,96
    80002fd0:	00008067          	ret

0000000080002fd4 <_ZN15MemoryAllocator5kfreeEPv>:

#pragma GCC optimize("O0")

int MemoryAllocator::kfree(void* ptr) {
    80002fd4:	fb010113          	addi	sp,sp,-80
    80002fd8:	04113423          	sd	ra,72(sp)
    80002fdc:	04813023          	sd	s0,64(sp)
    80002fe0:	05010413          	addi	s0,sp,80
    80002fe4:	faa43c23          	sd	a0,-72(s0)
    if (!ptr) return 0;
    80002fe8:	fb843783          	ld	a5,-72(s0)
    80002fec:	00079663          	bnez	a5,80002ff8 <_ZN15MemoryAllocator5kfreeEPv+0x24>
    80002ff0:	00000793          	li	a5,0
    80002ff4:	1d40006f          	j	800031c8 <_ZN15MemoryAllocator5kfreeEPv+0x1f4>
    if (!usedMemHead) return -1;
    80002ff8:	00009797          	auipc	a5,0x9
    80002ffc:	c4078793          	addi	a5,a5,-960 # 8000bc38 <_ZN15MemoryAllocator11usedMemHeadE>
    80003000:	0007b783          	ld	a5,0(a5)
    80003004:	00079663          	bnez	a5,80003010 <_ZN15MemoryAllocator5kfreeEPv+0x3c>
    80003008:	fff00793          	li	a5,-1
    8000300c:	1bc0006f          	j	800031c8 <_ZN15MemoryAllocator5kfreeEPv+0x1f4>
    //ptr pokazuje na usableFirstAddress, pre toga je zaglavlje segmenta
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    80003010:	fb843783          	ld	a5,-72(s0)
    80003014:	fe078793          	addi	a5,a5,-32
    80003018:	faf43c23          	sd	a5,-72(s0)

    //trazenje adrese ptr u listi zauzetih segmenata
    UsedMemSegment* currentUsed = usedMemHead;
    8000301c:	00009797          	auipc	a5,0x9
    80003020:	c1c78793          	addi	a5,a5,-996 # 8000bc38 <_ZN15MemoryAllocator11usedMemHeadE>
    80003024:	0007b783          	ld	a5,0(a5)
    80003028:	fef43423          	sd	a5,-24(s0)
    UsedMemSegment* prevUsed = nullptr;
    8000302c:	fe043023          	sd	zero,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    80003030:	fe843783          	ld	a5,-24(s0)
    80003034:	02078463          	beqz	a5,8000305c <_ZN15MemoryAllocator5kfreeEPv+0x88>
    80003038:	fe843703          	ld	a4,-24(s0)
    8000303c:	fb843783          	ld	a5,-72(s0)
    80003040:	00f70e63          	beq	a4,a5,8000305c <_ZN15MemoryAllocator5kfreeEPv+0x88>
        prevUsed = currentUsed;
    80003044:	fe843783          	ld	a5,-24(s0)
    80003048:	fef43023          	sd	a5,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    8000304c:	fe843783          	ld	a5,-24(s0)
    80003050:	0007b783          	ld	a5,0(a5)
    80003054:	fef43423          	sd	a5,-24(s0)
    80003058:	fd9ff06f          	j	80003030 <_ZN15MemoryAllocator5kfreeEPv+0x5c>
    }
    if ((char*) currentUsed != (char*) ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    8000305c:	fe843703          	ld	a4,-24(s0)
    80003060:	fb843783          	ld	a5,-72(s0)
    80003064:	00f70663          	beq	a4,a5,80003070 <_ZN15MemoryAllocator5kfreeEPv+0x9c>
    80003068:	fff00793          	li	a5,-1
    8000306c:	15c0006f          	j	800031c8 <_ZN15MemoryAllocator5kfreeEPv+0x1f4>

    //prevezivanje liste zauzetih segmenata
    if (prevUsed) prevUsed->next = currentUsed->next;
    80003070:	fe043783          	ld	a5,-32(s0)
    80003074:	00078c63          	beqz	a5,8000308c <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    80003078:	fe843783          	ld	a5,-24(s0)
    8000307c:	0007b703          	ld	a4,0(a5)
    80003080:	fe043783          	ld	a5,-32(s0)
    80003084:	00e7b023          	sd	a4,0(a5)
    80003088:	0180006f          	j	800030a0 <_ZN15MemoryAllocator5kfreeEPv+0xcc>
    else usedMemHead = currentUsed->next;
    8000308c:	fe843783          	ld	a5,-24(s0)
    80003090:	0007b703          	ld	a4,0(a5)
    80003094:	00009797          	auipc	a5,0x9
    80003098:	ba478793          	addi	a5,a5,-1116 # 8000bc38 <_ZN15MemoryAllocator11usedMemHeadE>
    8000309c:	00e7b023          	sd	a4,0(a5)

    //oslobadjanje segmenta i ubacivanje u listu slobodnih
    FreeMemSegment* prevFree = nullptr;
    800030a0:	fc043c23          	sd	zero,-40(s0)
    if (!freeMemHead || ((char*) ptr < (char*) freeMemHead)) {
    800030a4:	00009797          	auipc	a5,0x9
    800030a8:	b9c78793          	addi	a5,a5,-1124 # 8000bc40 <_ZN15MemoryAllocator11freeMemHeadE>
    800030ac:	0007b783          	ld	a5,0(a5)
    800030b0:	00078c63          	beqz	a5,800030c8 <_ZN15MemoryAllocator5kfreeEPv+0xf4>
    800030b4:	00009797          	auipc	a5,0x9
    800030b8:	b8c78793          	addi	a5,a5,-1140 # 8000bc40 <_ZN15MemoryAllocator11freeMemHeadE>
    800030bc:	0007b783          	ld	a5,0(a5)
    800030c0:	fb843703          	ld	a4,-72(s0)
    800030c4:	00f77663          	bgeu	a4,a5,800030d0 <_ZN15MemoryAllocator5kfreeEPv+0xfc>
        prevFree = nullptr;
    800030c8:	fc043c23          	sd	zero,-40(s0)
    800030cc:	0400006f          	j	8000310c <_ZN15MemoryAllocator5kfreeEPv+0x138>
    } else {
        for (prevFree = freeMemHead;
    800030d0:	00009797          	auipc	a5,0x9
    800030d4:	b7078793          	addi	a5,a5,-1168 # 8000bc40 <_ZN15MemoryAllocator11freeMemHeadE>
    800030d8:	0007b783          	ld	a5,0(a5)
    800030dc:	fcf43c23          	sd	a5,-40(s0)
             prevFree->next && (char*) ptr > (char*) (prevFree->next); prevFree = prevFree->next);
    800030e0:	fd843783          	ld	a5,-40(s0)
    800030e4:	0007b783          	ld	a5,0(a5)
    800030e8:	02078263          	beqz	a5,8000310c <_ZN15MemoryAllocator5kfreeEPv+0x138>
    800030ec:	fd843783          	ld	a5,-40(s0)
    800030f0:	0007b783          	ld	a5,0(a5)
    800030f4:	fb843703          	ld	a4,-72(s0)
    800030f8:	00e7fa63          	bgeu	a5,a4,8000310c <_ZN15MemoryAllocator5kfreeEPv+0x138>
    800030fc:	fd843783          	ld	a5,-40(s0)
    80003100:	0007b783          	ld	a5,0(a5)
    80003104:	fcf43c23          	sd	a5,-40(s0)
        for (prevFree = freeMemHead;
    80003108:	fd9ff06f          	j	800030e0 <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    }
    FreeMemSegment* newFree = (FreeMemSegment*) ptr;
    8000310c:	fb843783          	ld	a5,-72(s0)
    80003110:	fcf43823          	sd	a5,-48(s0)
    size_t segmentSize = ((UsedMemSegment*) ptr)->size;
    80003114:	fb843783          	ld	a5,-72(s0)
    80003118:	0087b783          	ld	a5,8(a5)
    8000311c:	fcf43423          	sd	a5,-56(s0)
    newFree->size = segmentSize;
    80003120:	fd043783          	ld	a5,-48(s0)
    80003124:	fc843703          	ld	a4,-56(s0)
    80003128:	00e7b823          	sd	a4,16(a5)
    newFree->prev = prevFree;
    8000312c:	fd043783          	ld	a5,-48(s0)
    80003130:	fd843703          	ld	a4,-40(s0)
    80003134:	00e7b423          	sd	a4,8(a5)
    if (prevFree) newFree->next = prevFree->next;
    80003138:	fd843783          	ld	a5,-40(s0)
    8000313c:	00078c63          	beqz	a5,80003154 <_ZN15MemoryAllocator5kfreeEPv+0x180>
    80003140:	fd843783          	ld	a5,-40(s0)
    80003144:	0007b703          	ld	a4,0(a5)
    80003148:	fd043783          	ld	a5,-48(s0)
    8000314c:	00e7b023          	sd	a4,0(a5)
    80003150:	0180006f          	j	80003168 <_ZN15MemoryAllocator5kfreeEPv+0x194>
    else newFree->next = freeMemHead;
    80003154:	00009797          	auipc	a5,0x9
    80003158:	aec78793          	addi	a5,a5,-1300 # 8000bc40 <_ZN15MemoryAllocator11freeMemHeadE>
    8000315c:	0007b703          	ld	a4,0(a5)
    80003160:	fd043783          	ld	a5,-48(s0)
    80003164:	00e7b023          	sd	a4,0(a5)
    if (newFree->next) newFree->next->prev = newFree;
    80003168:	fd043783          	ld	a5,-48(s0)
    8000316c:	0007b783          	ld	a5,0(a5)
    80003170:	00078a63          	beqz	a5,80003184 <_ZN15MemoryAllocator5kfreeEPv+0x1b0>
    80003174:	fd043783          	ld	a5,-48(s0)
    80003178:	0007b783          	ld	a5,0(a5)
    8000317c:	fd043703          	ld	a4,-48(s0)
    80003180:	00e7b423          	sd	a4,8(a5)
    if (prevFree) prevFree->next = newFree;
    80003184:	fd843783          	ld	a5,-40(s0)
    80003188:	00078a63          	beqz	a5,8000319c <_ZN15MemoryAllocator5kfreeEPv+0x1c8>
    8000318c:	fd843783          	ld	a5,-40(s0)
    80003190:	fd043703          	ld	a4,-48(s0)
    80003194:	00e7b023          	sd	a4,0(a5)
    80003198:	0140006f          	j	800031ac <_ZN15MemoryAllocator5kfreeEPv+0x1d8>
    else freeMemHead = newFree;
    8000319c:	00009797          	auipc	a5,0x9
    800031a0:	aa478793          	addi	a5,a5,-1372 # 8000bc40 <_ZN15MemoryAllocator11freeMemHeadE>
    800031a4:	fd043703          	ld	a4,-48(s0)
    800031a8:	00e7b023          	sd	a4,0(a5)

    //spajanje uzastopnih slobodnih segmenata
    tryToJoin(newFree);
    800031ac:	fd043503          	ld	a0,-48(s0)
    800031b0:	00000097          	auipc	ra,0x0
    800031b4:	02c080e7          	jalr	44(ra) # 800031dc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    tryToJoin(prevFree);
    800031b8:	fd843503          	ld	a0,-40(s0)
    800031bc:	00000097          	auipc	ra,0x0
    800031c0:	020080e7          	jalr	32(ra) # 800031dc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    return 0;
    800031c4:	00000793          	li	a5,0
}
    800031c8:	00078513          	mv	a0,a5
    800031cc:	04813083          	ld	ra,72(sp)
    800031d0:	04013403          	ld	s0,64(sp)
    800031d4:	05010113          	addi	sp,sp,80
    800031d8:	00008067          	ret

00000000800031dc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:

#pragma GCC optimize("O0")

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    800031dc:	fc010113          	addi	sp,sp,-64
    800031e0:	02813c23          	sd	s0,56(sp)
    800031e4:	04010413          	addi	s0,sp,64
    800031e8:	fca43423          	sd	a0,-56(s0)
    if (!current) return 0;
    800031ec:	fc843783          	ld	a5,-56(s0)
    800031f0:	00079663          	bnez	a5,800031fc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x20>
    800031f4:	00000793          	li	a5,0
    800031f8:	0bc0006f          	j	800032b4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xd8>
    bool nextExists = current->next != nullptr;
    800031fc:	fc843783          	ld	a5,-56(s0)
    80003200:	0007b783          	ld	a5,0(a5)
    80003204:	00f037b3          	snez	a5,a5
    80003208:	fef407a3          	sb	a5,-17(s0)
    char* nextAddr = (char*) current + current->size;
    8000320c:	fc843783          	ld	a5,-56(s0)
    80003210:	0107b783          	ld	a5,16(a5)
    80003214:	fc843703          	ld	a4,-56(s0)
    80003218:	00f707b3          	add	a5,a4,a5
    8000321c:	fef43023          	sd	a5,-32(s0)
    char* cnext = (char*) current->next;
    80003220:	fc843783          	ld	a5,-56(s0)
    80003224:	0007b783          	ld	a5,0(a5)
    80003228:	fcf43c23          	sd	a5,-40(s0)
    bool nextIsConnected = (nextAddr == cnext);
    8000322c:	fe043703          	ld	a4,-32(s0)
    80003230:	fd843783          	ld	a5,-40(s0)
    80003234:	40f707b3          	sub	a5,a4,a5
    80003238:	0017b793          	seqz	a5,a5
    8000323c:	fcf40ba3          	sb	a5,-41(s0)
    if (nextExists && nextIsConnected) {
    80003240:	fef44783          	lbu	a5,-17(s0)
    80003244:	0ff7f793          	andi	a5,a5,255
    80003248:	06078463          	beqz	a5,800032b0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xd4>
    8000324c:	fd744783          	lbu	a5,-41(s0)
    80003250:	0ff7f793          	andi	a5,a5,255
    80003254:	04078e63          	beqz	a5,800032b0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xd4>
        current->size += current->next->size;
    80003258:	fc843783          	ld	a5,-56(s0)
    8000325c:	0107b703          	ld	a4,16(a5)
    80003260:	fc843783          	ld	a5,-56(s0)
    80003264:	0007b783          	ld	a5,0(a5)
    80003268:	0107b783          	ld	a5,16(a5)
    8000326c:	00f70733          	add	a4,a4,a5
    80003270:	fc843783          	ld	a5,-56(s0)
    80003274:	00e7b823          	sd	a4,16(a5)
        current->next = current->next->next;
    80003278:	fc843783          	ld	a5,-56(s0)
    8000327c:	0007b783          	ld	a5,0(a5)
    80003280:	0007b703          	ld	a4,0(a5)
    80003284:	fc843783          	ld	a5,-56(s0)
    80003288:	00e7b023          	sd	a4,0(a5)
        if (current->next) current->next->prev = current;
    8000328c:	fc843783          	ld	a5,-56(s0)
    80003290:	0007b783          	ld	a5,0(a5)
    80003294:	00078a63          	beqz	a5,800032a8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xcc>
    80003298:	fc843783          	ld	a5,-56(s0)
    8000329c:	0007b783          	ld	a5,0(a5)
    800032a0:	fc843703          	ld	a4,-56(s0)
    800032a4:	00e7b423          	sd	a4,8(a5)
        return 1;
    800032a8:	00100793          	li	a5,1
    800032ac:	0080006f          	j	800032b4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xd8>
    } else return 0;
    800032b0:	00000793          	li	a5,0
}
    800032b4:	00078513          	mv	a0,a5
    800032b8:	03813403          	ld	s0,56(sp)
    800032bc:	04010113          	addi	sp,sp,64
    800032c0:	00008067          	ret

00000000800032c4 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>:

bool MemoryAllocator::checkPurpose(void* ptr, MemoryAllocator::Purpose p) {
    800032c4:	fe010113          	addi	sp,sp,-32
    800032c8:	00813c23          	sd	s0,24(sp)
    800032cc:	02010413          	addi	s0,sp,32
    800032d0:	fea43423          	sd	a0,-24(s0)
    800032d4:	00058793          	mv	a5,a1
    800032d8:	fef42223          	sw	a5,-28(s0)
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    800032dc:	fe843783          	ld	a5,-24(s0)
    800032e0:	fe078793          	addi	a5,a5,-32
    800032e4:	fef43423          	sd	a5,-24(s0)
    return ((UsedMemSegment*) ptr)->purpose == p;
    800032e8:	fe843783          	ld	a5,-24(s0)
    800032ec:	0107a703          	lw	a4,16(a5)
    800032f0:	fe442783          	lw	a5,-28(s0)
    800032f4:	0007879b          	sext.w	a5,a5
    800032f8:	40e787b3          	sub	a5,a5,a4
    800032fc:	0017b793          	seqz	a5,a5
    80003300:	0ff7f793          	andi	a5,a5,255
}
    80003304:	00078513          	mv	a0,a5
    80003308:	01813403          	ld	s0,24(sp)
    8000330c:	02010113          	addi	sp,sp,32
    80003310:	00008067          	ret

0000000080003314 <_ZN15MemoryAllocator19initMemoryAllocatorEv>:

void MemoryAllocator::initMemoryAllocator() {
    80003314:	ff010113          	addi	sp,sp,-16
    80003318:	00813423          	sd	s0,8(sp)
    8000331c:	01010413          	addi	s0,sp,16
//pocetna inicijalizacija
    if (!initialized) {
    80003320:	00009797          	auipc	a5,0x9
    80003324:	92878793          	addi	a5,a5,-1752 # 8000bc48 <_ZN15MemoryAllocator11initializedE>
    80003328:	0007c783          	lbu	a5,0(a5)
    8000332c:	0017c793          	xori	a5,a5,1
    80003330:	0ff7f793          	andi	a5,a5,255
    80003334:	08078263          	beqz	a5,800033b8 <_ZN15MemoryAllocator19initMemoryAllocatorEv+0xa4>
        freeMemHead = (FreeMemSegment*) HEAP_START_ADDR;
    80003338:	00008797          	auipc	a5,0x8
    8000333c:	7787b783          	ld	a5,1912(a5) # 8000bab0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003340:	0007b703          	ld	a4,0(a5)
    80003344:	00009797          	auipc	a5,0x9
    80003348:	8fc78793          	addi	a5,a5,-1796 # 8000bc40 <_ZN15MemoryAllocator11freeMemHeadE>
    8000334c:	00e7b023          	sd	a4,0(a5)
        freeMemHead->next = nullptr;
    80003350:	00009797          	auipc	a5,0x9
    80003354:	8f078793          	addi	a5,a5,-1808 # 8000bc40 <_ZN15MemoryAllocator11freeMemHeadE>
    80003358:	0007b783          	ld	a5,0(a5)
    8000335c:	0007b023          	sd	zero,0(a5)
        freeMemHead->prev = nullptr;
    80003360:	00009797          	auipc	a5,0x9
    80003364:	8e078793          	addi	a5,a5,-1824 # 8000bc40 <_ZN15MemoryAllocator11freeMemHeadE>
    80003368:	0007b783          	ld	a5,0(a5)
    8000336c:	0007b423          	sd	zero,8(a5)
        freeMemHead->size = (char*) HEAP_END_ADDR - (char*) HEAP_START_ADDR;//- sizeof(FreeMemSegment);
    80003370:	00008797          	auipc	a5,0x8
    80003374:	7787b783          	ld	a5,1912(a5) # 8000bae8 <_GLOBAL_OFFSET_TABLE_+0x60>
    80003378:	0007b703          	ld	a4,0(a5)
    8000337c:	00008797          	auipc	a5,0x8
    80003380:	7347b783          	ld	a5,1844(a5) # 8000bab0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003384:	0007b783          	ld	a5,0(a5)
    80003388:	40f70733          	sub	a4,a4,a5
    8000338c:	00009797          	auipc	a5,0x9
    80003390:	8b478793          	addi	a5,a5,-1868 # 8000bc40 <_ZN15MemoryAllocator11freeMemHeadE>
    80003394:	0007b783          	ld	a5,0(a5)
    80003398:	00e7b823          	sd	a4,16(a5)
        usedMemHead = nullptr;
    8000339c:	00009797          	auipc	a5,0x9
    800033a0:	89c78793          	addi	a5,a5,-1892 # 8000bc38 <_ZN15MemoryAllocator11usedMemHeadE>
    800033a4:	0007b023          	sd	zero,0(a5)

        initialized = true;
    800033a8:	00009797          	auipc	a5,0x9
    800033ac:	8a078793          	addi	a5,a5,-1888 # 8000bc48 <_ZN15MemoryAllocator11initializedE>
    800033b0:	00100713          	li	a4,1
    800033b4:	00e78023          	sb	a4,0(a5)
    }
}
    800033b8:	00000013          	nop
    800033bc:	00813403          	ld	s0,8(sp)
    800033c0:	01010113          	addi	sp,sp,16
    800033c4:	00008067          	ret

00000000800033c8 <_ZN4KSemnwEm>:

#include "../h/KSem.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void* KSem::operator new(size_t size) {
    800033c8:	ff010113          	addi	sp,sp,-16
    800033cc:	00113423          	sd	ra,8(sp)
    800033d0:	00813023          	sd	s0,0(sp)
    800033d4:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    800033d8:	ffffe097          	auipc	ra,0xffffe
    800033dc:	f38080e7          	jalr	-200(ra) # 80001310 <_Z9mem_allocm>
	//return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::SEMAPHORE);
}
    800033e0:	00813083          	ld	ra,8(sp)
    800033e4:	00013403          	ld	s0,0(sp)
    800033e8:	01010113          	addi	sp,sp,16
    800033ec:	00008067          	ret

00000000800033f0 <_ZN4KSemdlEPv>:

void KSem::operator delete(void* ptr) {
    800033f0:	ff010113          	addi	sp,sp,-16
    800033f4:	00113423          	sd	ra,8(sp)
    800033f8:	00813023          	sd	s0,0(sp)
    800033fc:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80003400:	ffffe097          	auipc	ra,0xffffe
    80003404:	f50080e7          	jalr	-176(ra) # 80001350 <_Z8mem_freePv>
	//MemoryAllocator::kfree(ptr);
}
    80003408:	00813083          	ld	ra,8(sp)
    8000340c:	00013403          	ld	s0,0(sp)
    80003410:	01010113          	addi	sp,sp,16
    80003414:	00008067          	ret

0000000080003418 <_ZN4KSem7initSemEj>:

KSem* KSem::initSem(uint val) {
    80003418:	fe010113          	addi	sp,sp,-32
    8000341c:	00113c23          	sd	ra,24(sp)
    80003420:	00813823          	sd	s0,16(sp)
    80003424:	00913423          	sd	s1,8(sp)
    80003428:	02010413          	addi	s0,sp,32
    8000342c:	00050493          	mv	s1,a0
	return new KSem(val);
    80003430:	02000513          	li	a0,32
    80003434:	00000097          	auipc	ra,0x0
    80003438:	f94080e7          	jalr	-108(ra) # 800033c8 <_ZN4KSemnwEm>
	void block();

	void unblock();

private:
	KSem(uint val) : val(val), working(true) {}
    8000343c:	00952023          	sw	s1,0(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    80003440:	00053423          	sd	zero,8(a0)
    80003444:	00053823          	sd	zero,16(a0)
    80003448:	00100713          	li	a4,1
    8000344c:	00e50c23          	sb	a4,24(a0)
}
    80003450:	01813083          	ld	ra,24(sp)
    80003454:	01013403          	ld	s0,16(sp)
    80003458:	00813483          	ld	s1,8(sp)
    8000345c:	02010113          	addi	sp,sp,32
    80003460:	00008067          	ret

0000000080003464 <_ZN4KSem5blockEv>:
		unblock();
	}
	return 0;
}

void KSem::block() {
    80003464:	ff010113          	addi	sp,sp,-16
    80003468:	00113423          	sd	ra,8(sp)
    8000346c:	00813023          	sd	s0,0(sp)
    80003470:	01010413          	addi	s0,sp,16
	TCB::running->setBlocked(true);
    80003474:	00008797          	auipc	a5,0x8
    80003478:	66c7b783          	ld	a5,1644(a5) # 8000bae0 <_GLOBAL_OFFSET_TABLE_+0x58>
    8000347c:	0007b583          	ld	a1,0(a5)
	void setBlocked(bool block) { this->blocked = block; }
    80003480:	00100793          	li	a5,1
    80003484:	02f588a3          	sb	a5,49(a1)
	blocked.putLast(TCB::running);
    80003488:	00850513          	addi	a0,a0,8
    8000348c:	ffffe097          	auipc	ra,0xffffe
    80003490:	db8080e7          	jalr	-584(ra) # 80001244 <_ZN11ThreadQueue7putLastEP3TCB>
	TCB::yield();
    80003494:	fffff097          	auipc	ra,0xfffff
    80003498:	664080e7          	jalr	1636(ra) # 80002af8 <_ZN3TCB5yieldEv>
}
    8000349c:	00813083          	ld	ra,8(sp)
    800034a0:	00013403          	ld	s0,0(sp)
    800034a4:	01010113          	addi	sp,sp,16
    800034a8:	00008067          	ret

00000000800034ac <_ZN4KSem4waitEv>:
	if (!working) return -3;
    800034ac:	01854783          	lbu	a5,24(a0)
    800034b0:	04078663          	beqz	a5,800034fc <_ZN4KSem4waitEv+0x50>
	if (--val < 0) {
    800034b4:	00052783          	lw	a5,0(a0)
    800034b8:	fff7879b          	addiw	a5,a5,-1
    800034bc:	00f52023          	sw	a5,0(a0)
    800034c0:	02079713          	slli	a4,a5,0x20
    800034c4:	00074663          	bltz	a4,800034d0 <_ZN4KSem4waitEv+0x24>
	return 0;
    800034c8:	00000513          	li	a0,0
}
    800034cc:	00008067          	ret
int KSem::wait() {
    800034d0:	ff010113          	addi	sp,sp,-16
    800034d4:	00113423          	sd	ra,8(sp)
    800034d8:	00813023          	sd	s0,0(sp)
    800034dc:	01010413          	addi	s0,sp,16
		block();
    800034e0:	00000097          	auipc	ra,0x0
    800034e4:	f84080e7          	jalr	-124(ra) # 80003464 <_ZN4KSem5blockEv>
		return -1;
    800034e8:	fff00513          	li	a0,-1
}
    800034ec:	00813083          	ld	ra,8(sp)
    800034f0:	00013403          	ld	s0,0(sp)
    800034f4:	01010113          	addi	sp,sp,16
    800034f8:	00008067          	ret
	if (!working) return -3;
    800034fc:	ffd00513          	li	a0,-3
    80003500:	00008067          	ret

0000000080003504 <_ZN4KSem7unblockEv>:

void KSem::unblock() {
    80003504:	ff010113          	addi	sp,sp,-16
    80003508:	00113423          	sd	ra,8(sp)
    8000350c:	00813023          	sd	s0,0(sp)
    80003510:	01010413          	addi	s0,sp,16
	TCB* tcb = blocked.getFirst();
    80003514:	00850513          	addi	a0,a0,8
    80003518:	ffffe097          	auipc	ra,0xffffe
    8000351c:	d98080e7          	jalr	-616(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
    80003520:	020508a3          	sb	zero,49(a0)
	tcb->setBlocked(false);
	Scheduler::put(tcb);
    80003524:	ffffe097          	auipc	ra,0xffffe
    80003528:	52c080e7          	jalr	1324(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
}
    8000352c:	00813083          	ld	ra,8(sp)
    80003530:	00013403          	ld	s0,0(sp)
    80003534:	01010113          	addi	sp,sp,16
    80003538:	00008067          	ret

000000008000353c <_ZN4KSem6signalEv>:
	if (!working) return -3;
    8000353c:	01854783          	lbu	a5,24(a0)
    80003540:	04078463          	beqz	a5,80003588 <_ZN4KSem6signalEv+0x4c>
	if (val++ < 0) {
    80003544:	00052783          	lw	a5,0(a0)
    80003548:	0017871b          	addiw	a4,a5,1
    8000354c:	00e52023          	sw	a4,0(a0)
    80003550:	0007c663          	bltz	a5,8000355c <_ZN4KSem6signalEv+0x20>
	return 0;
    80003554:	00000513          	li	a0,0
}
    80003558:	00008067          	ret
int KSem::signal() {
    8000355c:	ff010113          	addi	sp,sp,-16
    80003560:	00113423          	sd	ra,8(sp)
    80003564:	00813023          	sd	s0,0(sp)
    80003568:	01010413          	addi	s0,sp,16
		unblock();
    8000356c:	00000097          	auipc	ra,0x0
    80003570:	f98080e7          	jalr	-104(ra) # 80003504 <_ZN4KSem7unblockEv>
	return 0;
    80003574:	00000513          	li	a0,0
}
    80003578:	00813083          	ld	ra,8(sp)
    8000357c:	00013403          	ld	s0,0(sp)
    80003580:	01010113          	addi	sp,sp,16
    80003584:	00008067          	ret
	if (!working) return -3;
    80003588:	ffd00513          	li	a0,-3
    8000358c:	00008067          	ret

0000000080003590 <_ZN4KSem8closeSemEPS_>:

int KSem::closeSem(sem_t handle) {
    80003590:	fe010113          	addi	sp,sp,-32
    80003594:	00113c23          	sd	ra,24(sp)
    80003598:	00813823          	sd	s0,16(sp)
    8000359c:	00913423          	sd	s1,8(sp)
    800035a0:	02010413          	addi	s0,sp,32
    800035a4:	00050493          	mv	s1,a0
	//if (!MemoryAllocator::checkPurpose(handle, MemoryAllocator::SEMAPHORE)) return -2;
	handle->working = false;
    800035a8:	00050c23          	sb	zero,24(a0)
        bool ret = front == nullptr;
    800035ac:	0084b783          	ld	a5,8(s1)
	while (!handle->blocked.isEmpty()) {
    800035b0:	02078063          	beqz	a5,800035d0 <_ZN4KSem8closeSemEPS_+0x40>
		TCB* tcb = handle->blocked.getFirst();
    800035b4:	00848513          	addi	a0,s1,8
    800035b8:	ffffe097          	auipc	ra,0xffffe
    800035bc:	cf8080e7          	jalr	-776(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
    800035c0:	020508a3          	sb	zero,49(a0)
		tcb->setBlocked(false);
		Scheduler::put(tcb);
    800035c4:	ffffe097          	auipc	ra,0xffffe
    800035c8:	48c080e7          	jalr	1164(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
	while (!handle->blocked.isEmpty()) {
    800035cc:	fe1ff06f          	j	800035ac <_ZN4KSem8closeSemEPS_+0x1c>
	}
	return 0;
}
    800035d0:	00000513          	li	a0,0
    800035d4:	01813083          	ld	ra,24(sp)
    800035d8:	01013403          	ld	s0,16(sp)
    800035dc:	00813483          	ld	s1,8(sp)
    800035e0:	02010113          	addi	sp,sp,32
    800035e4:	00008067          	ret

00000000800035e8 <_Z10testMemoryv>:
    return pok;
}

#pragma GCC optimize("O0")

void testMemory() {
    800035e8:	e6010113          	addi	sp,sp,-416
    800035ec:	18113c23          	sd	ra,408(sp)
    800035f0:	18813823          	sd	s0,400(sp)
    800035f4:	1a010413          	addi	s0,sp,416
    char* pokazivaci[50];
    pokazivaci[0] = nullptr;
    800035f8:	e6043023          	sd	zero,-416(s0)
    pokazivaci[0] = upisi(1024 + 768);
    800035fc:	70000513          	li	a0,1792
    80003600:	00000097          	auipc	ra,0x0
    80003604:	1f8080e7          	jalr	504(ra) # 800037f8 <_Z5upisim>
    80003608:	00050793          	mv	a5,a0
    8000360c:	e6f43023          	sd	a5,-416(s0)
    if (pokazivaci[0]) {
    80003610:	e6043783          	ld	a5,-416(s0)
    80003614:	02078c63          	beqz	a5,8000364c <_Z10testMemoryv+0x64>
        if (pokazivaci[0][0] == '8') {
    80003618:	e6043783          	ld	a5,-416(s0)
    8000361c:	0007c783          	lbu	a5,0(a5)
    80003620:	00078713          	mv	a4,a5
    80003624:	03800793          	li	a5,56
    80003628:	00f71a63          	bne	a4,a5,8000363c <_Z10testMemoryv+0x54>
            printString("nea");
    8000362c:	00006517          	auipc	a0,0x6
    80003630:	bd450513          	addi	a0,a0,-1068 # 80009200 <_ZZ9kPrintIntmE6digits+0x190>
    80003634:	00002097          	auipc	ra,0x2
    80003638:	6b4080e7          	jalr	1716(ra) # 80005ce8 <_Z11printStringPKc>
        }
        MemoryAllocator::kfree(pokazivaci[0]);
    8000363c:	e6043783          	ld	a5,-416(s0)
    80003640:	00078513          	mv	a0,a5
    80003644:	00000097          	auipc	ra,0x0
    80003648:	990080e7          	jalr	-1648(ra) # 80002fd4 <_ZN15MemoryAllocator5kfreeEPv>
    }


    pokazivaci[0] = upisi(4096);
    8000364c:	00001537          	lui	a0,0x1
    80003650:	00000097          	auipc	ra,0x0
    80003654:	1a8080e7          	jalr	424(ra) # 800037f8 <_Z5upisim>
    80003658:	00050793          	mv	a5,a0
    8000365c:	e6f43023          	sd	a5,-416(s0)
    if (pokazivaci[0]) {
    80003660:	e6043783          	ld	a5,-416(s0)
    80003664:	00078a63          	beqz	a5,80003678 <_Z10testMemoryv+0x90>
        MemoryAllocator::kfree(pokazivaci[0]);
    80003668:	e6043783          	ld	a5,-416(s0)
    8000366c:	00078513          	mv	a0,a5
    80003670:	00000097          	auipc	ra,0x0
    80003674:	964080e7          	jalr	-1692(ra) # 80002fd4 <_ZN15MemoryAllocator5kfreeEPv>
    }

    pokazivaci[0] = upisi(1024 + 768);
    80003678:	70000513          	li	a0,1792
    8000367c:	00000097          	auipc	ra,0x0
    80003680:	17c080e7          	jalr	380(ra) # 800037f8 <_Z5upisim>
    80003684:	00050793          	mv	a5,a0
    80003688:	e6f43023          	sd	a5,-416(s0)
    MemoryAllocator::kfree(pokazivaci[0]);
    8000368c:	e6043783          	ld	a5,-416(s0)
    80003690:	00078513          	mv	a0,a5
    80003694:	00000097          	auipc	ra,0x0
    80003698:	940080e7          	jalr	-1728(ra) # 80002fd4 <_ZN15MemoryAllocator5kfreeEPv>

}
    8000369c:	00000013          	nop
    800036a0:	19813083          	ld	ra,408(sp)
    800036a4:	19013403          	ld	s0,400(sp)
    800036a8:	1a010113          	addi	sp,sp,416
    800036ac:	00008067          	ret

00000000800036b0 <_Z5nit1fPv>:

void nit1f(void*) {
    800036b0:	fe010113          	addi	sp,sp,-32
    800036b4:	00113c23          	sd	ra,24(sp)
    800036b8:	00813823          	sd	s0,16(sp)
    800036bc:	02010413          	addi	s0,sp,32
    800036c0:	fea43423          	sd	a0,-24(s0)
//		printString("\nsem_wait za nit 1 vratio ");
//		printInteger(res);
//		printString("\n");
//	}

    printString("\nGotova nit 1\n");
    800036c4:	00006517          	auipc	a0,0x6
    800036c8:	b4450513          	addi	a0,a0,-1212 # 80009208 <_ZZ9kPrintIntmE6digits+0x198>
    800036cc:	00002097          	auipc	ra,0x2
    800036d0:	61c080e7          	jalr	1564(ra) # 80005ce8 <_Z11printStringPKc>
}
    800036d4:	00000013          	nop
    800036d8:	01813083          	ld	ra,24(sp)
    800036dc:	01013403          	ld	s0,16(sp)
    800036e0:	02010113          	addi	sp,sp,32
    800036e4:	00008067          	ret

00000000800036e8 <_Z5nit2fPv>:

void nit2f(void* arg2) {
    800036e8:	fe010113          	addi	sp,sp,-32
    800036ec:	00113c23          	sd	ra,24(sp)
    800036f0:	00813823          	sd	s0,16(sp)
    800036f4:	02010413          	addi	s0,sp,32
    800036f8:	fea43423          	sd	a0,-24(s0)
//		//sem_close(semA);
//		printString("\nNit 2 ubija semafor\n");
//		delete semA;
//
//	}
    printString("\nGotova nit 2\n");
    800036fc:	00006517          	auipc	a0,0x6
    80003700:	b1c50513          	addi	a0,a0,-1252 # 80009218 <_ZZ9kPrintIntmE6digits+0x1a8>
    80003704:	00002097          	auipc	ra,0x2
    80003708:	5e4080e7          	jalr	1508(ra) # 80005ce8 <_Z11printStringPKc>
}
    8000370c:	00000013          	nop
    80003710:	01813083          	ld	ra,24(sp)
    80003714:	01013403          	ld	s0,16(sp)
    80003718:	02010113          	addi	sp,sp,32
    8000371c:	00008067          	ret

0000000080003720 <_Z5nit3fPv>:


void nit3f(void*) {
    80003720:	fd010113          	addi	sp,sp,-48
    80003724:	02113423          	sd	ra,40(sp)
    80003728:	02813023          	sd	s0,32(sp)
    8000372c:	03010413          	addi	s0,sp,48
    80003730:	fca43c23          	sd	a0,-40(s0)
    char slovo;
    do {
        slovo = getc();
    80003734:	ffffe097          	auipc	ra,0xffffe
    80003738:	e34080e7          	jalr	-460(ra) # 80001568 <_Z4getcv>
    8000373c:	00050793          	mv	a5,a0
    80003740:	fef407a3          	sb	a5,-17(s0)
        putc(slovo);
    80003744:	fef44783          	lbu	a5,-17(s0)
    80003748:	00078513          	mv	a0,a5
    8000374c:	ffffe097          	auipc	ra,0xffffe
    80003750:	e44080e7          	jalr	-444(ra) # 80001590 <_Z4putcc>
        if (slovo == '\r') putc('\n');
    80003754:	fef44783          	lbu	a5,-17(s0)
    80003758:	0ff7f713          	andi	a4,a5,255
    8000375c:	00d00793          	li	a5,13
    80003760:	00f71863          	bne	a4,a5,80003770 <_Z5nit3fPv+0x50>
    80003764:	00a00513          	li	a0,10
    80003768:	ffffe097          	auipc	ra,0xffffe
    8000376c:	e28080e7          	jalr	-472(ra) # 80001590 <_Z4putcc>
    } while (slovo != '0');
    80003770:	fef44783          	lbu	a5,-17(s0)
    80003774:	0ff7f713          	andi	a4,a5,255
    80003778:	03000793          	li	a5,48
    8000377c:	00f70463          	beq	a4,a5,80003784 <_Z5nit3fPv+0x64>
    do {
    80003780:	fb5ff06f          	j	80003734 <_Z5nit3fPv+0x14>

    printString("\nGotova nit3\n");
    80003784:	00006517          	auipc	a0,0x6
    80003788:	aa450513          	addi	a0,a0,-1372 # 80009228 <_ZZ9kPrintIntmE6digits+0x1b8>
    8000378c:	00002097          	auipc	ra,0x2
    80003790:	55c080e7          	jalr	1372(ra) # 80005ce8 <_Z11printStringPKc>
}
    80003794:	00000013          	nop
    80003798:	02813083          	ld	ra,40(sp)
    8000379c:	02013403          	ld	s0,32(sp)
    800037a0:	03010113          	addi	sp,sp,48
    800037a4:	00008067          	ret

00000000800037a8 <_Z8testMainv>:

int testMain() {
    800037a8:	ff010113          	addi	sp,sp,-16
    800037ac:	00113423          	sd	ra,8(sp)
    800037b0:	00813023          	sd	s0,0(sp)
    800037b4:	01010413          	addi	s0,sp,16
//postavi adresu prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    800037b8:	00008797          	auipc	a5,0x8
    800037bc:	3387b783          	ld	a5,824(a5) # 8000baf0 <_GLOBAL_OFFSET_TABLE_+0x68>
    800037c0:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    MemoryAllocator::initMemoryAllocator();
    800037c4:	00000097          	auipc	ra,0x0
    800037c8:	b50080e7          	jalr	-1200(ra) # 80003314 <_ZN15MemoryAllocator19initMemoryAllocatorEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    800037cc:	ffffe097          	auipc	ra,0xffffe
    800037d0:	e94080e7          	jalr	-364(ra) # 80001660 <_ZN8KConsole12initKConsoleEv>
//	printString("\nGotove user niti\n");
//
//	printString("\nSad cu da izadjem\n");
//	while(KConsole::outputHead!=KConsole::outputTail){}
//	//zabrani prekide
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    800037d4:	00200513          	li	a0,2
    800037d8:	00000097          	auipc	ra,0x0
    800037dc:	07c080e7          	jalr	124(ra) # 80003854 <_ZN5Riscv10mc_sstatusEm>


    return 0;
    800037e0:	00000793          	li	a5,0
    800037e4:	00078513          	mv	a0,a5
    800037e8:	00813083          	ld	ra,8(sp)
    800037ec:	00013403          	ld	s0,0(sp)
    800037f0:	01010113          	addi	sp,sp,16
    800037f4:	00008067          	ret

00000000800037f8 <_Z5upisim>:
char* upisi(size_t alociraj) {
    800037f8:	fe010113          	addi	sp,sp,-32
    800037fc:	00113c23          	sd	ra,24(sp)
    80003800:	00813823          	sd	s0,16(sp)
    80003804:	00913423          	sd	s1,8(sp)
    80003808:	02010413          	addi	s0,sp,32
    8000380c:	00050493          	mv	s1,a0
    char* pok = (char*) MemoryAllocator::kmalloc(alociraj);
    80003810:	00300593          	li	a1,3
    80003814:	fffff097          	auipc	ra,0xfffff
    80003818:	518080e7          	jalr	1304(ra) # 80002d2c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
    if (pok) {
    8000381c:	02050263          	beqz	a0,80003840 <_Z5upisim+0x48>
        for (uint64 i = 0; i < alociraj - sizeof(MemoryAllocator::UsedMemSegment); i++) {
    80003820:	00000793          	li	a5,0
    80003824:	0140006f          	j	80003838 <_Z5upisim+0x40>
            pok[i] = '8';
    80003828:	00f50733          	add	a4,a0,a5
    8000382c:	03800693          	li	a3,56
    80003830:	00d70023          	sb	a3,0(a4)
        for (uint64 i = 0; i < alociraj - sizeof(MemoryAllocator::UsedMemSegment); i++) {
    80003834:	00178793          	addi	a5,a5,1
    80003838:	fe048713          	addi	a4,s1,-32
    8000383c:	fee7e6e3          	bltu	a5,a4,80003828 <_Z5upisim+0x30>
}
    80003840:	01813083          	ld	ra,24(sp)
    80003844:	01013403          	ld	s0,16(sp)
    80003848:	00813483          	ld	s1,8(sp)
    8000384c:	02010113          	addi	sp,sp,32
    80003850:	00008067          	ret

0000000080003854 <_ZN5Riscv10mc_sstatusEm>:
inline void Riscv::mc_sstatus(uint64 mask) {
    80003854:	ff010113          	addi	sp,sp,-16
    80003858:	00813423          	sd	s0,8(sp)
    8000385c:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80003860:	10053073          	csrc	sstatus,a0
}
    80003864:	00813403          	ld	s0,8(sp)
    80003868:	01010113          	addi	sp,sp,16
    8000386c:	00008067          	ret

0000000080003870 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80003870:	fe010113          	addi	sp,sp,-32
    80003874:	00113c23          	sd	ra,24(sp)
    80003878:	00813823          	sd	s0,16(sp)
    8000387c:	00913423          	sd	s1,8(sp)
    80003880:	01213023          	sd	s2,0(sp)
    80003884:	02010413          	addi	s0,sp,32
    80003888:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    8000388c:	00000913          	li	s2,0
    80003890:	00c0006f          	j	8000389c <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003894:	ffffe097          	auipc	ra,0xffffe
    80003898:	b94080e7          	jalr	-1132(ra) # 80001428 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
    8000389c:	ffffe097          	auipc	ra,0xffffe
    800038a0:	ccc080e7          	jalr	-820(ra) # 80001568 <_Z4getcv>
    800038a4:	0005059b          	sext.w	a1,a0
    800038a8:	02d00793          	li	a5,45
    800038ac:	02f58a63          	beq	a1,a5,800038e0 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    800038b0:	0084b503          	ld	a0,8(s1)
    800038b4:	00003097          	auipc	ra,0x3
    800038b8:	400080e7          	jalr	1024(ra) # 80006cb4 <_ZN6Buffer3putEi>
        i++;
    800038bc:	0019071b          	addiw	a4,s2,1
    800038c0:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800038c4:	0004a683          	lw	a3,0(s1)
    800038c8:	0026979b          	slliw	a5,a3,0x2
    800038cc:	00d787bb          	addw	a5,a5,a3
    800038d0:	0017979b          	slliw	a5,a5,0x1
    800038d4:	02f767bb          	remw	a5,a4,a5
    800038d8:	fc0792e3          	bnez	a5,8000389c <_ZL16producerKeyboardPv+0x2c>
    800038dc:	fb9ff06f          	j	80003894 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    800038e0:	00100793          	li	a5,1
    800038e4:	00008717          	auipc	a4,0x8
    800038e8:	36f72623          	sw	a5,876(a4) # 8000bc50 <_ZL9threadEnd>
    data->buffer->put('!');
    800038ec:	02100593          	li	a1,33
    800038f0:	0084b503          	ld	a0,8(s1)
    800038f4:	00003097          	auipc	ra,0x3
    800038f8:	3c0080e7          	jalr	960(ra) # 80006cb4 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    800038fc:	0104b503          	ld	a0,16(s1)
    80003900:	ffffe097          	auipc	ra,0xffffe
    80003904:	c38080e7          	jalr	-968(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    80003908:	01813083          	ld	ra,24(sp)
    8000390c:	01013403          	ld	s0,16(sp)
    80003910:	00813483          	ld	s1,8(sp)
    80003914:	00013903          	ld	s2,0(sp)
    80003918:	02010113          	addi	sp,sp,32
    8000391c:	00008067          	ret

0000000080003920 <_ZL8producerPv>:

static void producer(void *arg) {
    80003920:	fe010113          	addi	sp,sp,-32
    80003924:	00113c23          	sd	ra,24(sp)
    80003928:	00813823          	sd	s0,16(sp)
    8000392c:	00913423          	sd	s1,8(sp)
    80003930:	01213023          	sd	s2,0(sp)
    80003934:	02010413          	addi	s0,sp,32
    80003938:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    8000393c:	00000913          	li	s2,0
    80003940:	00c0006f          	j	8000394c <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003944:	ffffe097          	auipc	ra,0xffffe
    80003948:	ae4080e7          	jalr	-1308(ra) # 80001428 <_Z15thread_dispatchv>
    while (!threadEnd) {
    8000394c:	00008797          	auipc	a5,0x8
    80003950:	3047a783          	lw	a5,772(a5) # 8000bc50 <_ZL9threadEnd>
    80003954:	02079e63          	bnez	a5,80003990 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80003958:	0004a583          	lw	a1,0(s1)
    8000395c:	0305859b          	addiw	a1,a1,48
    80003960:	0084b503          	ld	a0,8(s1)
    80003964:	00003097          	auipc	ra,0x3
    80003968:	350080e7          	jalr	848(ra) # 80006cb4 <_ZN6Buffer3putEi>
        i++;
    8000396c:	0019071b          	addiw	a4,s2,1
    80003970:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003974:	0004a683          	lw	a3,0(s1)
    80003978:	0026979b          	slliw	a5,a3,0x2
    8000397c:	00d787bb          	addw	a5,a5,a3
    80003980:	0017979b          	slliw	a5,a5,0x1
    80003984:	02f767bb          	remw	a5,a4,a5
    80003988:	fc0792e3          	bnez	a5,8000394c <_ZL8producerPv+0x2c>
    8000398c:	fb9ff06f          	j	80003944 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80003990:	0104b503          	ld	a0,16(s1)
    80003994:	ffffe097          	auipc	ra,0xffffe
    80003998:	ba4080e7          	jalr	-1116(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    8000399c:	01813083          	ld	ra,24(sp)
    800039a0:	01013403          	ld	s0,16(sp)
    800039a4:	00813483          	ld	s1,8(sp)
    800039a8:	00013903          	ld	s2,0(sp)
    800039ac:	02010113          	addi	sp,sp,32
    800039b0:	00008067          	ret

00000000800039b4 <_ZL8consumerPv>:

static void consumer(void *arg) {
    800039b4:	fd010113          	addi	sp,sp,-48
    800039b8:	02113423          	sd	ra,40(sp)
    800039bc:	02813023          	sd	s0,32(sp)
    800039c0:	00913c23          	sd	s1,24(sp)
    800039c4:	01213823          	sd	s2,16(sp)
    800039c8:	01313423          	sd	s3,8(sp)
    800039cc:	03010413          	addi	s0,sp,48
    800039d0:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800039d4:	00000993          	li	s3,0
    800039d8:	01c0006f          	j	800039f4 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    800039dc:	ffffe097          	auipc	ra,0xffffe
    800039e0:	a4c080e7          	jalr	-1460(ra) # 80001428 <_Z15thread_dispatchv>
    800039e4:	0500006f          	j	80003a34 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    800039e8:	00a00513          	li	a0,10
    800039ec:	ffffe097          	auipc	ra,0xffffe
    800039f0:	ba4080e7          	jalr	-1116(ra) # 80001590 <_Z4putcc>
    while (!threadEnd) {
    800039f4:	00008797          	auipc	a5,0x8
    800039f8:	25c7a783          	lw	a5,604(a5) # 8000bc50 <_ZL9threadEnd>
    800039fc:	06079063          	bnez	a5,80003a5c <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    80003a00:	00893503          	ld	a0,8(s2)
    80003a04:	00003097          	auipc	ra,0x3
    80003a08:	340080e7          	jalr	832(ra) # 80006d44 <_ZN6Buffer3getEv>
        i++;
    80003a0c:	0019849b          	addiw	s1,s3,1
    80003a10:	0004899b          	sext.w	s3,s1
        putc(key);
    80003a14:	0ff57513          	andi	a0,a0,255
    80003a18:	ffffe097          	auipc	ra,0xffffe
    80003a1c:	b78080e7          	jalr	-1160(ra) # 80001590 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80003a20:	00092703          	lw	a4,0(s2)
    80003a24:	0027179b          	slliw	a5,a4,0x2
    80003a28:	00e787bb          	addw	a5,a5,a4
    80003a2c:	02f4e7bb          	remw	a5,s1,a5
    80003a30:	fa0786e3          	beqz	a5,800039dc <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80003a34:	05000793          	li	a5,80
    80003a38:	02f4e4bb          	remw	s1,s1,a5
    80003a3c:	fa049ce3          	bnez	s1,800039f4 <_ZL8consumerPv+0x40>
    80003a40:	fa9ff06f          	j	800039e8 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80003a44:	00893503          	ld	a0,8(s2)
    80003a48:	00003097          	auipc	ra,0x3
    80003a4c:	2fc080e7          	jalr	764(ra) # 80006d44 <_ZN6Buffer3getEv>
        putc(key);
    80003a50:	0ff57513          	andi	a0,a0,255
    80003a54:	ffffe097          	auipc	ra,0xffffe
    80003a58:	b3c080e7          	jalr	-1220(ra) # 80001590 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80003a5c:	00893503          	ld	a0,8(s2)
    80003a60:	00003097          	auipc	ra,0x3
    80003a64:	370080e7          	jalr	880(ra) # 80006dd0 <_ZN6Buffer6getCntEv>
    80003a68:	fca04ee3          	bgtz	a0,80003a44 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80003a6c:	01093503          	ld	a0,16(s2)
    80003a70:	ffffe097          	auipc	ra,0xffffe
    80003a74:	ac8080e7          	jalr	-1336(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    80003a78:	02813083          	ld	ra,40(sp)
    80003a7c:	02013403          	ld	s0,32(sp)
    80003a80:	01813483          	ld	s1,24(sp)
    80003a84:	01013903          	ld	s2,16(sp)
    80003a88:	00813983          	ld	s3,8(sp)
    80003a8c:	03010113          	addi	sp,sp,48
    80003a90:	00008067          	ret

0000000080003a94 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80003a94:	f9010113          	addi	sp,sp,-112
    80003a98:	06113423          	sd	ra,104(sp)
    80003a9c:	06813023          	sd	s0,96(sp)
    80003aa0:	04913c23          	sd	s1,88(sp)
    80003aa4:	05213823          	sd	s2,80(sp)
    80003aa8:	05313423          	sd	s3,72(sp)
    80003aac:	05413023          	sd	s4,64(sp)
    80003ab0:	03513c23          	sd	s5,56(sp)
    80003ab4:	03613823          	sd	s6,48(sp)
    80003ab8:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80003abc:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80003ac0:	00005517          	auipc	a0,0x5
    80003ac4:	77850513          	addi	a0,a0,1912 # 80009238 <_ZZ9kPrintIntmE6digits+0x1c8>
    80003ac8:	00002097          	auipc	ra,0x2
    80003acc:	220080e7          	jalr	544(ra) # 80005ce8 <_Z11printStringPKc>
    getString(input, 30);
    80003ad0:	01e00593          	li	a1,30
    80003ad4:	fa040493          	addi	s1,s0,-96
    80003ad8:	00048513          	mv	a0,s1
    80003adc:	00002097          	auipc	ra,0x2
    80003ae0:	294080e7          	jalr	660(ra) # 80005d70 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80003ae4:	00048513          	mv	a0,s1
    80003ae8:	00002097          	auipc	ra,0x2
    80003aec:	360080e7          	jalr	864(ra) # 80005e48 <_Z11stringToIntPKc>
    80003af0:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80003af4:	00005517          	auipc	a0,0x5
    80003af8:	76450513          	addi	a0,a0,1892 # 80009258 <_ZZ9kPrintIntmE6digits+0x1e8>
    80003afc:	00002097          	auipc	ra,0x2
    80003b00:	1ec080e7          	jalr	492(ra) # 80005ce8 <_Z11printStringPKc>
    getString(input, 30);
    80003b04:	01e00593          	li	a1,30
    80003b08:	00048513          	mv	a0,s1
    80003b0c:	00002097          	auipc	ra,0x2
    80003b10:	264080e7          	jalr	612(ra) # 80005d70 <_Z9getStringPci>
    n = stringToInt(input);
    80003b14:	00048513          	mv	a0,s1
    80003b18:	00002097          	auipc	ra,0x2
    80003b1c:	330080e7          	jalr	816(ra) # 80005e48 <_Z11stringToIntPKc>
    80003b20:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80003b24:	00005517          	auipc	a0,0x5
    80003b28:	75450513          	addi	a0,a0,1876 # 80009278 <_ZZ9kPrintIntmE6digits+0x208>
    80003b2c:	00002097          	auipc	ra,0x2
    80003b30:	1bc080e7          	jalr	444(ra) # 80005ce8 <_Z11printStringPKc>
	printInt(threadNum);
    80003b34:	00000613          	li	a2,0
    80003b38:	00a00593          	li	a1,10
    80003b3c:	00090513          	mv	a0,s2
    80003b40:	00002097          	auipc	ra,0x2
    80003b44:	358080e7          	jalr	856(ra) # 80005e98 <_Z8printIntiii>
    printString(" i velicina bafera ");
    80003b48:	00005517          	auipc	a0,0x5
    80003b4c:	74850513          	addi	a0,a0,1864 # 80009290 <_ZZ9kPrintIntmE6digits+0x220>
    80003b50:	00002097          	auipc	ra,0x2
    80003b54:	198080e7          	jalr	408(ra) # 80005ce8 <_Z11printStringPKc>
	printInt(n);
    80003b58:	00000613          	li	a2,0
    80003b5c:	00a00593          	li	a1,10
    80003b60:	00048513          	mv	a0,s1
    80003b64:	00002097          	auipc	ra,0x2
    80003b68:	334080e7          	jalr	820(ra) # 80005e98 <_Z8printIntiii>
    printString(".\n");
    80003b6c:	00005517          	auipc	a0,0x5
    80003b70:	73c50513          	addi	a0,a0,1852 # 800092a8 <_ZZ9kPrintIntmE6digits+0x238>
    80003b74:	00002097          	auipc	ra,0x2
    80003b78:	174080e7          	jalr	372(ra) # 80005ce8 <_Z11printStringPKc>
    if(threadNum > n) {
    80003b7c:	0324c463          	blt	s1,s2,80003ba4 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80003b80:	03205c63          	blez	s2,80003bb8 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80003b84:	03800513          	li	a0,56
    80003b88:	fffff097          	auipc	ra,0xfffff
    80003b8c:	924080e7          	jalr	-1756(ra) # 800024ac <_Znwm>
    80003b90:	00050a13          	mv	s4,a0
    80003b94:	00048593          	mv	a1,s1
    80003b98:	00003097          	auipc	ra,0x3
    80003b9c:	080080e7          	jalr	128(ra) # 80006c18 <_ZN6BufferC1Ei>
    80003ba0:	0300006f          	j	80003bd0 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80003ba4:	00005517          	auipc	a0,0x5
    80003ba8:	70c50513          	addi	a0,a0,1804 # 800092b0 <_ZZ9kPrintIntmE6digits+0x240>
    80003bac:	00002097          	auipc	ra,0x2
    80003bb0:	13c080e7          	jalr	316(ra) # 80005ce8 <_Z11printStringPKc>
        return;
    80003bb4:	0140006f          	j	80003bc8 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80003bb8:	00005517          	auipc	a0,0x5
    80003bbc:	73850513          	addi	a0,a0,1848 # 800092f0 <_ZZ9kPrintIntmE6digits+0x280>
    80003bc0:	00002097          	auipc	ra,0x2
    80003bc4:	128080e7          	jalr	296(ra) # 80005ce8 <_Z11printStringPKc>
        return;
    80003bc8:	000b0113          	mv	sp,s6
    80003bcc:	1500006f          	j	80003d1c <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80003bd0:	00000593          	li	a1,0
    80003bd4:	00008517          	auipc	a0,0x8
    80003bd8:	08450513          	addi	a0,a0,132 # 8000bc58 <_ZL10waitForAll>
    80003bdc:	ffffe097          	auipc	ra,0xffffe
    80003be0:	8c4080e7          	jalr	-1852(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    thread_t threads[threadNum];
    80003be4:	00391793          	slli	a5,s2,0x3
    80003be8:	00f78793          	addi	a5,a5,15
    80003bec:	ff07f793          	andi	a5,a5,-16
    80003bf0:	40f10133          	sub	sp,sp,a5
    80003bf4:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80003bf8:	0019071b          	addiw	a4,s2,1
    80003bfc:	00171793          	slli	a5,a4,0x1
    80003c00:	00e787b3          	add	a5,a5,a4
    80003c04:	00379793          	slli	a5,a5,0x3
    80003c08:	00f78793          	addi	a5,a5,15
    80003c0c:	ff07f793          	andi	a5,a5,-16
    80003c10:	40f10133          	sub	sp,sp,a5
    80003c14:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80003c18:	00191613          	slli	a2,s2,0x1
    80003c1c:	012607b3          	add	a5,a2,s2
    80003c20:	00379793          	slli	a5,a5,0x3
    80003c24:	00f987b3          	add	a5,s3,a5
    80003c28:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80003c2c:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80003c30:	00008717          	auipc	a4,0x8
    80003c34:	02873703          	ld	a4,40(a4) # 8000bc58 <_ZL10waitForAll>
    80003c38:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80003c3c:	00078613          	mv	a2,a5
    80003c40:	00000597          	auipc	a1,0x0
    80003c44:	d7458593          	addi	a1,a1,-652 # 800039b4 <_ZL8consumerPv>
    80003c48:	f9840513          	addi	a0,s0,-104
    80003c4c:	ffffd097          	auipc	ra,0xffffd
    80003c50:	734080e7          	jalr	1844(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003c54:	00000493          	li	s1,0
    80003c58:	0280006f          	j	80003c80 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80003c5c:	00000597          	auipc	a1,0x0
    80003c60:	c1458593          	addi	a1,a1,-1004 # 80003870 <_ZL16producerKeyboardPv>
                      data + i);
    80003c64:	00179613          	slli	a2,a5,0x1
    80003c68:	00f60633          	add	a2,a2,a5
    80003c6c:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80003c70:	00c98633          	add	a2,s3,a2
    80003c74:	ffffd097          	auipc	ra,0xffffd
    80003c78:	70c080e7          	jalr	1804(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003c7c:	0014849b          	addiw	s1,s1,1
    80003c80:	0524d263          	bge	s1,s2,80003cc4 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80003c84:	00149793          	slli	a5,s1,0x1
    80003c88:	009787b3          	add	a5,a5,s1
    80003c8c:	00379793          	slli	a5,a5,0x3
    80003c90:	00f987b3          	add	a5,s3,a5
    80003c94:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80003c98:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80003c9c:	00008717          	auipc	a4,0x8
    80003ca0:	fbc73703          	ld	a4,-68(a4) # 8000bc58 <_ZL10waitForAll>
    80003ca4:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80003ca8:	00048793          	mv	a5,s1
    80003cac:	00349513          	slli	a0,s1,0x3
    80003cb0:	00aa8533          	add	a0,s5,a0
    80003cb4:	fa9054e3          	blez	s1,80003c5c <_Z22producerConsumer_C_APIv+0x1c8>
    80003cb8:	00000597          	auipc	a1,0x0
    80003cbc:	c6858593          	addi	a1,a1,-920 # 80003920 <_ZL8producerPv>
    80003cc0:	fa5ff06f          	j	80003c64 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80003cc4:	ffffd097          	auipc	ra,0xffffd
    80003cc8:	764080e7          	jalr	1892(ra) # 80001428 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80003ccc:	00000493          	li	s1,0
    80003cd0:	00994e63          	blt	s2,s1,80003cec <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80003cd4:	00008517          	auipc	a0,0x8
    80003cd8:	f8453503          	ld	a0,-124(a0) # 8000bc58 <_ZL10waitForAll>
    80003cdc:	ffffe097          	auipc	ra,0xffffe
    80003ce0:	82c080e7          	jalr	-2004(ra) # 80001508 <_Z8sem_waitP4KSem>
    for (int i = 0; i <= threadNum; i++) {
    80003ce4:	0014849b          	addiw	s1,s1,1
    80003ce8:	fe9ff06f          	j	80003cd0 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80003cec:	00008517          	auipc	a0,0x8
    80003cf0:	f6c53503          	ld	a0,-148(a0) # 8000bc58 <_ZL10waitForAll>
    80003cf4:	ffffd097          	auipc	ra,0xffffd
    80003cf8:	7e4080e7          	jalr	2020(ra) # 800014d8 <_Z9sem_closeP4KSem>
    delete buffer;
    80003cfc:	000a0e63          	beqz	s4,80003d18 <_Z22producerConsumer_C_APIv+0x284>
    80003d00:	000a0513          	mv	a0,s4
    80003d04:	00003097          	auipc	ra,0x3
    80003d08:	154080e7          	jalr	340(ra) # 80006e58 <_ZN6BufferD1Ev>
    80003d0c:	000a0513          	mv	a0,s4
    80003d10:	ffffe097          	auipc	ra,0xffffe
    80003d14:	7ec080e7          	jalr	2028(ra) # 800024fc <_ZdlPv>
    80003d18:	000b0113          	mv	sp,s6

}
    80003d1c:	f9040113          	addi	sp,s0,-112
    80003d20:	06813083          	ld	ra,104(sp)
    80003d24:	06013403          	ld	s0,96(sp)
    80003d28:	05813483          	ld	s1,88(sp)
    80003d2c:	05013903          	ld	s2,80(sp)
    80003d30:	04813983          	ld	s3,72(sp)
    80003d34:	04013a03          	ld	s4,64(sp)
    80003d38:	03813a83          	ld	s5,56(sp)
    80003d3c:	03013b03          	ld	s6,48(sp)
    80003d40:	07010113          	addi	sp,sp,112
    80003d44:	00008067          	ret
    80003d48:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80003d4c:	000a0513          	mv	a0,s4
    80003d50:	ffffe097          	auipc	ra,0xffffe
    80003d54:	7ac080e7          	jalr	1964(ra) # 800024fc <_ZdlPv>
    80003d58:	00048513          	mv	a0,s1
    80003d5c:	00009097          	auipc	ra,0x9
    80003d60:	00c080e7          	jalr	12(ra) # 8000cd68 <_Unwind_Resume>

0000000080003d64 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003d64:	fe010113          	addi	sp,sp,-32
    80003d68:	00113c23          	sd	ra,24(sp)
    80003d6c:	00813823          	sd	s0,16(sp)
    80003d70:	00913423          	sd	s1,8(sp)
    80003d74:	01213023          	sd	s2,0(sp)
    80003d78:	02010413          	addi	s0,sp,32
    80003d7c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003d80:	00100793          	li	a5,1
    80003d84:	02a7f863          	bgeu	a5,a0,80003db4 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80003d88:	00a00793          	li	a5,10
    80003d8c:	02f577b3          	remu	a5,a0,a5
    80003d90:	02078e63          	beqz	a5,80003dcc <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80003d94:	fff48513          	addi	a0,s1,-1
    80003d98:	00000097          	auipc	ra,0x0
    80003d9c:	fcc080e7          	jalr	-52(ra) # 80003d64 <_ZL9fibonaccim>
    80003da0:	00050913          	mv	s2,a0
    80003da4:	ffe48513          	addi	a0,s1,-2
    80003da8:	00000097          	auipc	ra,0x0
    80003dac:	fbc080e7          	jalr	-68(ra) # 80003d64 <_ZL9fibonaccim>
    80003db0:	00a90533          	add	a0,s2,a0
}
    80003db4:	01813083          	ld	ra,24(sp)
    80003db8:	01013403          	ld	s0,16(sp)
    80003dbc:	00813483          	ld	s1,8(sp)
    80003dc0:	00013903          	ld	s2,0(sp)
    80003dc4:	02010113          	addi	sp,sp,32
    80003dc8:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80003dcc:	ffffd097          	auipc	ra,0xffffd
    80003dd0:	65c080e7          	jalr	1628(ra) # 80001428 <_Z15thread_dispatchv>
    80003dd4:	fc1ff06f          	j	80003d94 <_ZL9fibonaccim+0x30>

0000000080003dd8 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80003dd8:	fe010113          	addi	sp,sp,-32
    80003ddc:	00113c23          	sd	ra,24(sp)
    80003de0:	00813823          	sd	s0,16(sp)
    80003de4:	00913423          	sd	s1,8(sp)
    80003de8:	01213023          	sd	s2,0(sp)
    80003dec:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003df0:	00000913          	li	s2,0
    80003df4:	0380006f          	j	80003e2c <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003df8:	ffffd097          	auipc	ra,0xffffd
    80003dfc:	630080e7          	jalr	1584(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003e00:	00148493          	addi	s1,s1,1
    80003e04:	000027b7          	lui	a5,0x2
    80003e08:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003e0c:	0097ee63          	bltu	a5,s1,80003e28 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003e10:	00000713          	li	a4,0
    80003e14:	000077b7          	lui	a5,0x7
    80003e18:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003e1c:	fce7eee3          	bltu	a5,a4,80003df8 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80003e20:	00170713          	addi	a4,a4,1
    80003e24:	ff1ff06f          	j	80003e14 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003e28:	00190913          	addi	s2,s2,1
    80003e2c:	00900793          	li	a5,9
    80003e30:	0527e063          	bltu	a5,s2,80003e70 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003e34:	00005517          	auipc	a0,0x5
    80003e38:	4ec50513          	addi	a0,a0,1260 # 80009320 <_ZZ9kPrintIntmE6digits+0x2b0>
    80003e3c:	00002097          	auipc	ra,0x2
    80003e40:	eac080e7          	jalr	-340(ra) # 80005ce8 <_Z11printStringPKc>
    80003e44:	00000613          	li	a2,0
    80003e48:	00a00593          	li	a1,10
    80003e4c:	0009051b          	sext.w	a0,s2
    80003e50:	00002097          	auipc	ra,0x2
    80003e54:	048080e7          	jalr	72(ra) # 80005e98 <_Z8printIntiii>
    80003e58:	00005517          	auipc	a0,0x5
    80003e5c:	72850513          	addi	a0,a0,1832 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80003e60:	00002097          	auipc	ra,0x2
    80003e64:	e88080e7          	jalr	-376(ra) # 80005ce8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003e68:	00000493          	li	s1,0
    80003e6c:	f99ff06f          	j	80003e04 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003e70:	00005517          	auipc	a0,0x5
    80003e74:	4b850513          	addi	a0,a0,1208 # 80009328 <_ZZ9kPrintIntmE6digits+0x2b8>
    80003e78:	00002097          	auipc	ra,0x2
    80003e7c:	e70080e7          	jalr	-400(ra) # 80005ce8 <_Z11printStringPKc>
    finishedA = true;
    80003e80:	00100793          	li	a5,1
    80003e84:	00008717          	auipc	a4,0x8
    80003e88:	dcf70e23          	sb	a5,-548(a4) # 8000bc60 <_ZL9finishedA>
}
    80003e8c:	01813083          	ld	ra,24(sp)
    80003e90:	01013403          	ld	s0,16(sp)
    80003e94:	00813483          	ld	s1,8(sp)
    80003e98:	00013903          	ld	s2,0(sp)
    80003e9c:	02010113          	addi	sp,sp,32
    80003ea0:	00008067          	ret

0000000080003ea4 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80003ea4:	fe010113          	addi	sp,sp,-32
    80003ea8:	00113c23          	sd	ra,24(sp)
    80003eac:	00813823          	sd	s0,16(sp)
    80003eb0:	00913423          	sd	s1,8(sp)
    80003eb4:	01213023          	sd	s2,0(sp)
    80003eb8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003ebc:	00000913          	li	s2,0
    80003ec0:	0380006f          	j	80003ef8 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003ec4:	ffffd097          	auipc	ra,0xffffd
    80003ec8:	564080e7          	jalr	1380(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003ecc:	00148493          	addi	s1,s1,1
    80003ed0:	000027b7          	lui	a5,0x2
    80003ed4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003ed8:	0097ee63          	bltu	a5,s1,80003ef4 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003edc:	00000713          	li	a4,0
    80003ee0:	000077b7          	lui	a5,0x7
    80003ee4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003ee8:	fce7eee3          	bltu	a5,a4,80003ec4 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80003eec:	00170713          	addi	a4,a4,1
    80003ef0:	ff1ff06f          	j	80003ee0 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003ef4:	00190913          	addi	s2,s2,1
    80003ef8:	00f00793          	li	a5,15
    80003efc:	0527e063          	bltu	a5,s2,80003f3c <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003f00:	00005517          	auipc	a0,0x5
    80003f04:	43850513          	addi	a0,a0,1080 # 80009338 <_ZZ9kPrintIntmE6digits+0x2c8>
    80003f08:	00002097          	auipc	ra,0x2
    80003f0c:	de0080e7          	jalr	-544(ra) # 80005ce8 <_Z11printStringPKc>
    80003f10:	00000613          	li	a2,0
    80003f14:	00a00593          	li	a1,10
    80003f18:	0009051b          	sext.w	a0,s2
    80003f1c:	00002097          	auipc	ra,0x2
    80003f20:	f7c080e7          	jalr	-132(ra) # 80005e98 <_Z8printIntiii>
    80003f24:	00005517          	auipc	a0,0x5
    80003f28:	65c50513          	addi	a0,a0,1628 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80003f2c:	00002097          	auipc	ra,0x2
    80003f30:	dbc080e7          	jalr	-580(ra) # 80005ce8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003f34:	00000493          	li	s1,0
    80003f38:	f99ff06f          	j	80003ed0 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80003f3c:	00005517          	auipc	a0,0x5
    80003f40:	40450513          	addi	a0,a0,1028 # 80009340 <_ZZ9kPrintIntmE6digits+0x2d0>
    80003f44:	00002097          	auipc	ra,0x2
    80003f48:	da4080e7          	jalr	-604(ra) # 80005ce8 <_Z11printStringPKc>
    finishedB = true;
    80003f4c:	00100793          	li	a5,1
    80003f50:	00008717          	auipc	a4,0x8
    80003f54:	d0f708a3          	sb	a5,-751(a4) # 8000bc61 <_ZL9finishedB>
    thread_dispatch();
    80003f58:	ffffd097          	auipc	ra,0xffffd
    80003f5c:	4d0080e7          	jalr	1232(ra) # 80001428 <_Z15thread_dispatchv>
}
    80003f60:	01813083          	ld	ra,24(sp)
    80003f64:	01013403          	ld	s0,16(sp)
    80003f68:	00813483          	ld	s1,8(sp)
    80003f6c:	00013903          	ld	s2,0(sp)
    80003f70:	02010113          	addi	sp,sp,32
    80003f74:	00008067          	ret

0000000080003f78 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80003f78:	fe010113          	addi	sp,sp,-32
    80003f7c:	00113c23          	sd	ra,24(sp)
    80003f80:	00813823          	sd	s0,16(sp)
    80003f84:	00913423          	sd	s1,8(sp)
    80003f88:	01213023          	sd	s2,0(sp)
    80003f8c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80003f90:	00000493          	li	s1,0
    80003f94:	0400006f          	j	80003fd4 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003f98:	00005517          	auipc	a0,0x5
    80003f9c:	3b850513          	addi	a0,a0,952 # 80009350 <_ZZ9kPrintIntmE6digits+0x2e0>
    80003fa0:	00002097          	auipc	ra,0x2
    80003fa4:	d48080e7          	jalr	-696(ra) # 80005ce8 <_Z11printStringPKc>
    80003fa8:	00000613          	li	a2,0
    80003fac:	00a00593          	li	a1,10
    80003fb0:	00048513          	mv	a0,s1
    80003fb4:	00002097          	auipc	ra,0x2
    80003fb8:	ee4080e7          	jalr	-284(ra) # 80005e98 <_Z8printIntiii>
    80003fbc:	00005517          	auipc	a0,0x5
    80003fc0:	5c450513          	addi	a0,a0,1476 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80003fc4:	00002097          	auipc	ra,0x2
    80003fc8:	d24080e7          	jalr	-732(ra) # 80005ce8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80003fcc:	0014849b          	addiw	s1,s1,1
    80003fd0:	0ff4f493          	andi	s1,s1,255
    80003fd4:	00200793          	li	a5,2
    80003fd8:	fc97f0e3          	bgeu	a5,s1,80003f98 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80003fdc:	00005517          	auipc	a0,0x5
    80003fe0:	37c50513          	addi	a0,a0,892 # 80009358 <_ZZ9kPrintIntmE6digits+0x2e8>
    80003fe4:	00002097          	auipc	ra,0x2
    80003fe8:	d04080e7          	jalr	-764(ra) # 80005ce8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80003fec:	00700313          	li	t1,7
    thread_dispatch();
    80003ff0:	ffffd097          	auipc	ra,0xffffd
    80003ff4:	438080e7          	jalr	1080(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80003ff8:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80003ffc:	00005517          	auipc	a0,0x5
    80004000:	36c50513          	addi	a0,a0,876 # 80009368 <_ZZ9kPrintIntmE6digits+0x2f8>
    80004004:	00002097          	auipc	ra,0x2
    80004008:	ce4080e7          	jalr	-796(ra) # 80005ce8 <_Z11printStringPKc>
    8000400c:	00000613          	li	a2,0
    80004010:	00a00593          	li	a1,10
    80004014:	0009051b          	sext.w	a0,s2
    80004018:	00002097          	auipc	ra,0x2
    8000401c:	e80080e7          	jalr	-384(ra) # 80005e98 <_Z8printIntiii>
    80004020:	00005517          	auipc	a0,0x5
    80004024:	56050513          	addi	a0,a0,1376 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80004028:	00002097          	auipc	ra,0x2
    8000402c:	cc0080e7          	jalr	-832(ra) # 80005ce8 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80004030:	00c00513          	li	a0,12
    80004034:	00000097          	auipc	ra,0x0
    80004038:	d30080e7          	jalr	-720(ra) # 80003d64 <_ZL9fibonaccim>
    8000403c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80004040:	00005517          	auipc	a0,0x5
    80004044:	33050513          	addi	a0,a0,816 # 80009370 <_ZZ9kPrintIntmE6digits+0x300>
    80004048:	00002097          	auipc	ra,0x2
    8000404c:	ca0080e7          	jalr	-864(ra) # 80005ce8 <_Z11printStringPKc>
    80004050:	00000613          	li	a2,0
    80004054:	00a00593          	li	a1,10
    80004058:	0009051b          	sext.w	a0,s2
    8000405c:	00002097          	auipc	ra,0x2
    80004060:	e3c080e7          	jalr	-452(ra) # 80005e98 <_Z8printIntiii>
    80004064:	00005517          	auipc	a0,0x5
    80004068:	51c50513          	addi	a0,a0,1308 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    8000406c:	00002097          	auipc	ra,0x2
    80004070:	c7c080e7          	jalr	-900(ra) # 80005ce8 <_Z11printStringPKc>
    80004074:	0400006f          	j	800040b4 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80004078:	00005517          	auipc	a0,0x5
    8000407c:	2d850513          	addi	a0,a0,728 # 80009350 <_ZZ9kPrintIntmE6digits+0x2e0>
    80004080:	00002097          	auipc	ra,0x2
    80004084:	c68080e7          	jalr	-920(ra) # 80005ce8 <_Z11printStringPKc>
    80004088:	00000613          	li	a2,0
    8000408c:	00a00593          	li	a1,10
    80004090:	00048513          	mv	a0,s1
    80004094:	00002097          	auipc	ra,0x2
    80004098:	e04080e7          	jalr	-508(ra) # 80005e98 <_Z8printIntiii>
    8000409c:	00005517          	auipc	a0,0x5
    800040a0:	4e450513          	addi	a0,a0,1252 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    800040a4:	00002097          	auipc	ra,0x2
    800040a8:	c44080e7          	jalr	-956(ra) # 80005ce8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800040ac:	0014849b          	addiw	s1,s1,1
    800040b0:	0ff4f493          	andi	s1,s1,255
    800040b4:	00500793          	li	a5,5
    800040b8:	fc97f0e3          	bgeu	a5,s1,80004078 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("C finished!\n");
    800040bc:	00005517          	auipc	a0,0x5
    800040c0:	2c450513          	addi	a0,a0,708 # 80009380 <_ZZ9kPrintIntmE6digits+0x310>
    800040c4:	00002097          	auipc	ra,0x2
    800040c8:	c24080e7          	jalr	-988(ra) # 80005ce8 <_Z11printStringPKc>
    finishedC = true;
    800040cc:	00100793          	li	a5,1
    800040d0:	00008717          	auipc	a4,0x8
    800040d4:	b8f70923          	sb	a5,-1134(a4) # 8000bc62 <_ZL9finishedC>
    thread_dispatch();
    800040d8:	ffffd097          	auipc	ra,0xffffd
    800040dc:	350080e7          	jalr	848(ra) # 80001428 <_Z15thread_dispatchv>
}
    800040e0:	01813083          	ld	ra,24(sp)
    800040e4:	01013403          	ld	s0,16(sp)
    800040e8:	00813483          	ld	s1,8(sp)
    800040ec:	00013903          	ld	s2,0(sp)
    800040f0:	02010113          	addi	sp,sp,32
    800040f4:	00008067          	ret

00000000800040f8 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    800040f8:	fe010113          	addi	sp,sp,-32
    800040fc:	00113c23          	sd	ra,24(sp)
    80004100:	00813823          	sd	s0,16(sp)
    80004104:	00913423          	sd	s1,8(sp)
    80004108:	01213023          	sd	s2,0(sp)
    8000410c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004110:	00a00493          	li	s1,10
    80004114:	0400006f          	j	80004154 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004118:	00005517          	auipc	a0,0x5
    8000411c:	27850513          	addi	a0,a0,632 # 80009390 <_ZZ9kPrintIntmE6digits+0x320>
    80004120:	00002097          	auipc	ra,0x2
    80004124:	bc8080e7          	jalr	-1080(ra) # 80005ce8 <_Z11printStringPKc>
    80004128:	00000613          	li	a2,0
    8000412c:	00a00593          	li	a1,10
    80004130:	00048513          	mv	a0,s1
    80004134:	00002097          	auipc	ra,0x2
    80004138:	d64080e7          	jalr	-668(ra) # 80005e98 <_Z8printIntiii>
    8000413c:	00005517          	auipc	a0,0x5
    80004140:	44450513          	addi	a0,a0,1092 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80004144:	00002097          	auipc	ra,0x2
    80004148:	ba4080e7          	jalr	-1116(ra) # 80005ce8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    8000414c:	0014849b          	addiw	s1,s1,1
    80004150:	0ff4f493          	andi	s1,s1,255
    80004154:	00c00793          	li	a5,12
    80004158:	fc97f0e3          	bgeu	a5,s1,80004118 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    8000415c:	00005517          	auipc	a0,0x5
    80004160:	23c50513          	addi	a0,a0,572 # 80009398 <_ZZ9kPrintIntmE6digits+0x328>
    80004164:	00002097          	auipc	ra,0x2
    80004168:	b84080e7          	jalr	-1148(ra) # 80005ce8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    8000416c:	00500313          	li	t1,5
    thread_dispatch();
    80004170:	ffffd097          	auipc	ra,0xffffd
    80004174:	2b8080e7          	jalr	696(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004178:	01000513          	li	a0,16
    8000417c:	00000097          	auipc	ra,0x0
    80004180:	be8080e7          	jalr	-1048(ra) # 80003d64 <_ZL9fibonaccim>
    80004184:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004188:	00005517          	auipc	a0,0x5
    8000418c:	22050513          	addi	a0,a0,544 # 800093a8 <_ZZ9kPrintIntmE6digits+0x338>
    80004190:	00002097          	auipc	ra,0x2
    80004194:	b58080e7          	jalr	-1192(ra) # 80005ce8 <_Z11printStringPKc>
    80004198:	00000613          	li	a2,0
    8000419c:	00a00593          	li	a1,10
    800041a0:	0009051b          	sext.w	a0,s2
    800041a4:	00002097          	auipc	ra,0x2
    800041a8:	cf4080e7          	jalr	-780(ra) # 80005e98 <_Z8printIntiii>
    800041ac:	00005517          	auipc	a0,0x5
    800041b0:	3d450513          	addi	a0,a0,980 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    800041b4:	00002097          	auipc	ra,0x2
    800041b8:	b34080e7          	jalr	-1228(ra) # 80005ce8 <_Z11printStringPKc>
    800041bc:	0400006f          	j	800041fc <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800041c0:	00005517          	auipc	a0,0x5
    800041c4:	1d050513          	addi	a0,a0,464 # 80009390 <_ZZ9kPrintIntmE6digits+0x320>
    800041c8:	00002097          	auipc	ra,0x2
    800041cc:	b20080e7          	jalr	-1248(ra) # 80005ce8 <_Z11printStringPKc>
    800041d0:	00000613          	li	a2,0
    800041d4:	00a00593          	li	a1,10
    800041d8:	00048513          	mv	a0,s1
    800041dc:	00002097          	auipc	ra,0x2
    800041e0:	cbc080e7          	jalr	-836(ra) # 80005e98 <_Z8printIntiii>
    800041e4:	00005517          	auipc	a0,0x5
    800041e8:	39c50513          	addi	a0,a0,924 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    800041ec:	00002097          	auipc	ra,0x2
    800041f0:	afc080e7          	jalr	-1284(ra) # 80005ce8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    800041f4:	0014849b          	addiw	s1,s1,1
    800041f8:	0ff4f493          	andi	s1,s1,255
    800041fc:	00f00793          	li	a5,15
    80004200:	fc97f0e3          	bgeu	a5,s1,800041c0 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80004204:	00005517          	auipc	a0,0x5
    80004208:	1b450513          	addi	a0,a0,436 # 800093b8 <_ZZ9kPrintIntmE6digits+0x348>
    8000420c:	00002097          	auipc	ra,0x2
    80004210:	adc080e7          	jalr	-1316(ra) # 80005ce8 <_Z11printStringPKc>
    finishedD = true;
    80004214:	00100793          	li	a5,1
    80004218:	00008717          	auipc	a4,0x8
    8000421c:	a4f705a3          	sb	a5,-1461(a4) # 8000bc63 <_ZL9finishedD>
    thread_dispatch();
    80004220:	ffffd097          	auipc	ra,0xffffd
    80004224:	208080e7          	jalr	520(ra) # 80001428 <_Z15thread_dispatchv>
}
    80004228:	01813083          	ld	ra,24(sp)
    8000422c:	01013403          	ld	s0,16(sp)
    80004230:	00813483          	ld	s1,8(sp)
    80004234:	00013903          	ld	s2,0(sp)
    80004238:	02010113          	addi	sp,sp,32
    8000423c:	00008067          	ret

0000000080004240 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80004240:	fc010113          	addi	sp,sp,-64
    80004244:	02113c23          	sd	ra,56(sp)
    80004248:	02813823          	sd	s0,48(sp)
    8000424c:	02913423          	sd	s1,40(sp)
    80004250:	03213023          	sd	s2,32(sp)
    80004254:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80004258:	02000513          	li	a0,32
    8000425c:	ffffe097          	auipc	ra,0xffffe
    80004260:	250080e7          	jalr	592(ra) # 800024ac <_Znwm>
    80004264:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80004268:	ffffe097          	auipc	ra,0xffffe
    8000426c:	50c080e7          	jalr	1292(ra) # 80002774 <_ZN6ThreadC1Ev>
    80004270:	00007797          	auipc	a5,0x7
    80004274:	68078793          	addi	a5,a5,1664 # 8000b8f0 <_ZTV7WorkerA+0x10>
    80004278:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    8000427c:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80004280:	00005517          	auipc	a0,0x5
    80004284:	14850513          	addi	a0,a0,328 # 800093c8 <_ZZ9kPrintIntmE6digits+0x358>
    80004288:	00002097          	auipc	ra,0x2
    8000428c:	a60080e7          	jalr	-1440(ra) # 80005ce8 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80004290:	02000513          	li	a0,32
    80004294:	ffffe097          	auipc	ra,0xffffe
    80004298:	218080e7          	jalr	536(ra) # 800024ac <_Znwm>
    8000429c:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    800042a0:	ffffe097          	auipc	ra,0xffffe
    800042a4:	4d4080e7          	jalr	1236(ra) # 80002774 <_ZN6ThreadC1Ev>
    800042a8:	00007797          	auipc	a5,0x7
    800042ac:	67078793          	addi	a5,a5,1648 # 8000b918 <_ZTV7WorkerB+0x10>
    800042b0:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    800042b4:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    800042b8:	00005517          	auipc	a0,0x5
    800042bc:	12850513          	addi	a0,a0,296 # 800093e0 <_ZZ9kPrintIntmE6digits+0x370>
    800042c0:	00002097          	auipc	ra,0x2
    800042c4:	a28080e7          	jalr	-1496(ra) # 80005ce8 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    800042c8:	02000513          	li	a0,32
    800042cc:	ffffe097          	auipc	ra,0xffffe
    800042d0:	1e0080e7          	jalr	480(ra) # 800024ac <_Znwm>
    800042d4:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    800042d8:	ffffe097          	auipc	ra,0xffffe
    800042dc:	49c080e7          	jalr	1180(ra) # 80002774 <_ZN6ThreadC1Ev>
    800042e0:	00007797          	auipc	a5,0x7
    800042e4:	66078793          	addi	a5,a5,1632 # 8000b940 <_ZTV7WorkerC+0x10>
    800042e8:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    800042ec:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    800042f0:	00005517          	auipc	a0,0x5
    800042f4:	10850513          	addi	a0,a0,264 # 800093f8 <_ZZ9kPrintIntmE6digits+0x388>
    800042f8:	00002097          	auipc	ra,0x2
    800042fc:	9f0080e7          	jalr	-1552(ra) # 80005ce8 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80004300:	02000513          	li	a0,32
    80004304:	ffffe097          	auipc	ra,0xffffe
    80004308:	1a8080e7          	jalr	424(ra) # 800024ac <_Znwm>
    8000430c:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80004310:	ffffe097          	auipc	ra,0xffffe
    80004314:	464080e7          	jalr	1124(ra) # 80002774 <_ZN6ThreadC1Ev>
    80004318:	00007797          	auipc	a5,0x7
    8000431c:	65078793          	addi	a5,a5,1616 # 8000b968 <_ZTV7WorkerD+0x10>
    80004320:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80004324:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80004328:	00005517          	auipc	a0,0x5
    8000432c:	0e850513          	addi	a0,a0,232 # 80009410 <_ZZ9kPrintIntmE6digits+0x3a0>
    80004330:	00002097          	auipc	ra,0x2
    80004334:	9b8080e7          	jalr	-1608(ra) # 80005ce8 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80004338:	00000493          	li	s1,0
    8000433c:	00300793          	li	a5,3
    80004340:	0297c663          	blt	a5,s1,8000436c <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80004344:	00349793          	slli	a5,s1,0x3
    80004348:	fe040713          	addi	a4,s0,-32
    8000434c:	00f707b3          	add	a5,a4,a5
    80004350:	fe07b503          	ld	a0,-32(a5)
    80004354:	ffffe097          	auipc	ra,0xffffe
    80004358:	308080e7          	jalr	776(ra) # 8000265c <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    8000435c:	0014849b          	addiw	s1,s1,1
    80004360:	fddff06f          	j	8000433c <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80004364:	ffffe097          	auipc	ra,0xffffe
    80004368:	35c080e7          	jalr	860(ra) # 800026c0 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    8000436c:	00008797          	auipc	a5,0x8
    80004370:	8f47c783          	lbu	a5,-1804(a5) # 8000bc60 <_ZL9finishedA>
    80004374:	fe0788e3          	beqz	a5,80004364 <_Z20Threads_CPP_API_testv+0x124>
    80004378:	00008797          	auipc	a5,0x8
    8000437c:	8e97c783          	lbu	a5,-1815(a5) # 8000bc61 <_ZL9finishedB>
    80004380:	fe0782e3          	beqz	a5,80004364 <_Z20Threads_CPP_API_testv+0x124>
    80004384:	00008797          	auipc	a5,0x8
    80004388:	8de7c783          	lbu	a5,-1826(a5) # 8000bc62 <_ZL9finishedC>
    8000438c:	fc078ce3          	beqz	a5,80004364 <_Z20Threads_CPP_API_testv+0x124>
    80004390:	00008797          	auipc	a5,0x8
    80004394:	8d37c783          	lbu	a5,-1837(a5) # 8000bc63 <_ZL9finishedD>
    80004398:	fc0786e3          	beqz	a5,80004364 <_Z20Threads_CPP_API_testv+0x124>
    8000439c:	fc040493          	addi	s1,s0,-64
    800043a0:	0080006f          	j	800043a8 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) {
    800043a4:	00848493          	addi	s1,s1,8
    800043a8:	fe040793          	addi	a5,s0,-32
    800043ac:	08f48663          	beq	s1,a5,80004438 <_Z20Threads_CPP_API_testv+0x1f8>
    800043b0:	0004b503          	ld	a0,0(s1)
		delete thread;
    800043b4:	fe0508e3          	beqz	a0,800043a4 <_Z20Threads_CPP_API_testv+0x164>
    800043b8:	00053783          	ld	a5,0(a0)
    800043bc:	0087b783          	ld	a5,8(a5)
    800043c0:	000780e7          	jalr	a5
    800043c4:	fe1ff06f          	j	800043a4 <_Z20Threads_CPP_API_testv+0x164>
    800043c8:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    800043cc:	00048513          	mv	a0,s1
    800043d0:	ffffe097          	auipc	ra,0xffffe
    800043d4:	12c080e7          	jalr	300(ra) # 800024fc <_ZdlPv>
    800043d8:	00090513          	mv	a0,s2
    800043dc:	00009097          	auipc	ra,0x9
    800043e0:	98c080e7          	jalr	-1652(ra) # 8000cd68 <_Unwind_Resume>
    800043e4:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    800043e8:	00048513          	mv	a0,s1
    800043ec:	ffffe097          	auipc	ra,0xffffe
    800043f0:	110080e7          	jalr	272(ra) # 800024fc <_ZdlPv>
    800043f4:	00090513          	mv	a0,s2
    800043f8:	00009097          	auipc	ra,0x9
    800043fc:	970080e7          	jalr	-1680(ra) # 8000cd68 <_Unwind_Resume>
    80004400:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80004404:	00048513          	mv	a0,s1
    80004408:	ffffe097          	auipc	ra,0xffffe
    8000440c:	0f4080e7          	jalr	244(ra) # 800024fc <_ZdlPv>
    80004410:	00090513          	mv	a0,s2
    80004414:	00009097          	auipc	ra,0x9
    80004418:	954080e7          	jalr	-1708(ra) # 8000cd68 <_Unwind_Resume>
    8000441c:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80004420:	00048513          	mv	a0,s1
    80004424:	ffffe097          	auipc	ra,0xffffe
    80004428:	0d8080e7          	jalr	216(ra) # 800024fc <_ZdlPv>
    8000442c:	00090513          	mv	a0,s2
    80004430:	00009097          	auipc	ra,0x9
    80004434:	938080e7          	jalr	-1736(ra) # 8000cd68 <_Unwind_Resume>
	}
}
    80004438:	03813083          	ld	ra,56(sp)
    8000443c:	03013403          	ld	s0,48(sp)
    80004440:	02813483          	ld	s1,40(sp)
    80004444:	02013903          	ld	s2,32(sp)
    80004448:	04010113          	addi	sp,sp,64
    8000444c:	00008067          	ret

0000000080004450 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80004450:	ff010113          	addi	sp,sp,-16
    80004454:	00113423          	sd	ra,8(sp)
    80004458:	00813023          	sd	s0,0(sp)
    8000445c:	01010413          	addi	s0,sp,16
    80004460:	00007797          	auipc	a5,0x7
    80004464:	49078793          	addi	a5,a5,1168 # 8000b8f0 <_ZTV7WorkerA+0x10>
    80004468:	00f53023          	sd	a5,0(a0)
    8000446c:	ffffe097          	auipc	ra,0xffffe
    80004470:	f50080e7          	jalr	-176(ra) # 800023bc <_ZN6ThreadD1Ev>
    80004474:	00813083          	ld	ra,8(sp)
    80004478:	00013403          	ld	s0,0(sp)
    8000447c:	01010113          	addi	sp,sp,16
    80004480:	00008067          	ret

0000000080004484 <_ZN7WorkerAD0Ev>:
    80004484:	fe010113          	addi	sp,sp,-32
    80004488:	00113c23          	sd	ra,24(sp)
    8000448c:	00813823          	sd	s0,16(sp)
    80004490:	00913423          	sd	s1,8(sp)
    80004494:	02010413          	addi	s0,sp,32
    80004498:	00050493          	mv	s1,a0
    8000449c:	00007797          	auipc	a5,0x7
    800044a0:	45478793          	addi	a5,a5,1108 # 8000b8f0 <_ZTV7WorkerA+0x10>
    800044a4:	00f53023          	sd	a5,0(a0)
    800044a8:	ffffe097          	auipc	ra,0xffffe
    800044ac:	f14080e7          	jalr	-236(ra) # 800023bc <_ZN6ThreadD1Ev>
    800044b0:	00048513          	mv	a0,s1
    800044b4:	ffffe097          	auipc	ra,0xffffe
    800044b8:	048080e7          	jalr	72(ra) # 800024fc <_ZdlPv>
    800044bc:	01813083          	ld	ra,24(sp)
    800044c0:	01013403          	ld	s0,16(sp)
    800044c4:	00813483          	ld	s1,8(sp)
    800044c8:	02010113          	addi	sp,sp,32
    800044cc:	00008067          	ret

00000000800044d0 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    800044d0:	ff010113          	addi	sp,sp,-16
    800044d4:	00113423          	sd	ra,8(sp)
    800044d8:	00813023          	sd	s0,0(sp)
    800044dc:	01010413          	addi	s0,sp,16
    800044e0:	00007797          	auipc	a5,0x7
    800044e4:	43878793          	addi	a5,a5,1080 # 8000b918 <_ZTV7WorkerB+0x10>
    800044e8:	00f53023          	sd	a5,0(a0)
    800044ec:	ffffe097          	auipc	ra,0xffffe
    800044f0:	ed0080e7          	jalr	-304(ra) # 800023bc <_ZN6ThreadD1Ev>
    800044f4:	00813083          	ld	ra,8(sp)
    800044f8:	00013403          	ld	s0,0(sp)
    800044fc:	01010113          	addi	sp,sp,16
    80004500:	00008067          	ret

0000000080004504 <_ZN7WorkerBD0Ev>:
    80004504:	fe010113          	addi	sp,sp,-32
    80004508:	00113c23          	sd	ra,24(sp)
    8000450c:	00813823          	sd	s0,16(sp)
    80004510:	00913423          	sd	s1,8(sp)
    80004514:	02010413          	addi	s0,sp,32
    80004518:	00050493          	mv	s1,a0
    8000451c:	00007797          	auipc	a5,0x7
    80004520:	3fc78793          	addi	a5,a5,1020 # 8000b918 <_ZTV7WorkerB+0x10>
    80004524:	00f53023          	sd	a5,0(a0)
    80004528:	ffffe097          	auipc	ra,0xffffe
    8000452c:	e94080e7          	jalr	-364(ra) # 800023bc <_ZN6ThreadD1Ev>
    80004530:	00048513          	mv	a0,s1
    80004534:	ffffe097          	auipc	ra,0xffffe
    80004538:	fc8080e7          	jalr	-56(ra) # 800024fc <_ZdlPv>
    8000453c:	01813083          	ld	ra,24(sp)
    80004540:	01013403          	ld	s0,16(sp)
    80004544:	00813483          	ld	s1,8(sp)
    80004548:	02010113          	addi	sp,sp,32
    8000454c:	00008067          	ret

0000000080004550 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80004550:	ff010113          	addi	sp,sp,-16
    80004554:	00113423          	sd	ra,8(sp)
    80004558:	00813023          	sd	s0,0(sp)
    8000455c:	01010413          	addi	s0,sp,16
    80004560:	00007797          	auipc	a5,0x7
    80004564:	3e078793          	addi	a5,a5,992 # 8000b940 <_ZTV7WorkerC+0x10>
    80004568:	00f53023          	sd	a5,0(a0)
    8000456c:	ffffe097          	auipc	ra,0xffffe
    80004570:	e50080e7          	jalr	-432(ra) # 800023bc <_ZN6ThreadD1Ev>
    80004574:	00813083          	ld	ra,8(sp)
    80004578:	00013403          	ld	s0,0(sp)
    8000457c:	01010113          	addi	sp,sp,16
    80004580:	00008067          	ret

0000000080004584 <_ZN7WorkerCD0Ev>:
    80004584:	fe010113          	addi	sp,sp,-32
    80004588:	00113c23          	sd	ra,24(sp)
    8000458c:	00813823          	sd	s0,16(sp)
    80004590:	00913423          	sd	s1,8(sp)
    80004594:	02010413          	addi	s0,sp,32
    80004598:	00050493          	mv	s1,a0
    8000459c:	00007797          	auipc	a5,0x7
    800045a0:	3a478793          	addi	a5,a5,932 # 8000b940 <_ZTV7WorkerC+0x10>
    800045a4:	00f53023          	sd	a5,0(a0)
    800045a8:	ffffe097          	auipc	ra,0xffffe
    800045ac:	e14080e7          	jalr	-492(ra) # 800023bc <_ZN6ThreadD1Ev>
    800045b0:	00048513          	mv	a0,s1
    800045b4:	ffffe097          	auipc	ra,0xffffe
    800045b8:	f48080e7          	jalr	-184(ra) # 800024fc <_ZdlPv>
    800045bc:	01813083          	ld	ra,24(sp)
    800045c0:	01013403          	ld	s0,16(sp)
    800045c4:	00813483          	ld	s1,8(sp)
    800045c8:	02010113          	addi	sp,sp,32
    800045cc:	00008067          	ret

00000000800045d0 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    800045d0:	ff010113          	addi	sp,sp,-16
    800045d4:	00113423          	sd	ra,8(sp)
    800045d8:	00813023          	sd	s0,0(sp)
    800045dc:	01010413          	addi	s0,sp,16
    800045e0:	00007797          	auipc	a5,0x7
    800045e4:	38878793          	addi	a5,a5,904 # 8000b968 <_ZTV7WorkerD+0x10>
    800045e8:	00f53023          	sd	a5,0(a0)
    800045ec:	ffffe097          	auipc	ra,0xffffe
    800045f0:	dd0080e7          	jalr	-560(ra) # 800023bc <_ZN6ThreadD1Ev>
    800045f4:	00813083          	ld	ra,8(sp)
    800045f8:	00013403          	ld	s0,0(sp)
    800045fc:	01010113          	addi	sp,sp,16
    80004600:	00008067          	ret

0000000080004604 <_ZN7WorkerDD0Ev>:
    80004604:	fe010113          	addi	sp,sp,-32
    80004608:	00113c23          	sd	ra,24(sp)
    8000460c:	00813823          	sd	s0,16(sp)
    80004610:	00913423          	sd	s1,8(sp)
    80004614:	02010413          	addi	s0,sp,32
    80004618:	00050493          	mv	s1,a0
    8000461c:	00007797          	auipc	a5,0x7
    80004620:	34c78793          	addi	a5,a5,844 # 8000b968 <_ZTV7WorkerD+0x10>
    80004624:	00f53023          	sd	a5,0(a0)
    80004628:	ffffe097          	auipc	ra,0xffffe
    8000462c:	d94080e7          	jalr	-620(ra) # 800023bc <_ZN6ThreadD1Ev>
    80004630:	00048513          	mv	a0,s1
    80004634:	ffffe097          	auipc	ra,0xffffe
    80004638:	ec8080e7          	jalr	-312(ra) # 800024fc <_ZdlPv>
    8000463c:	01813083          	ld	ra,24(sp)
    80004640:	01013403          	ld	s0,16(sp)
    80004644:	00813483          	ld	s1,8(sp)
    80004648:	02010113          	addi	sp,sp,32
    8000464c:	00008067          	ret

0000000080004650 <_ZN7WorkerA3runEv>:
    void run() override {
    80004650:	ff010113          	addi	sp,sp,-16
    80004654:	00113423          	sd	ra,8(sp)
    80004658:	00813023          	sd	s0,0(sp)
    8000465c:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80004660:	00000593          	li	a1,0
    80004664:	fffff097          	auipc	ra,0xfffff
    80004668:	774080e7          	jalr	1908(ra) # 80003dd8 <_ZN7WorkerA11workerBodyAEPv>
    }
    8000466c:	00813083          	ld	ra,8(sp)
    80004670:	00013403          	ld	s0,0(sp)
    80004674:	01010113          	addi	sp,sp,16
    80004678:	00008067          	ret

000000008000467c <_ZN7WorkerB3runEv>:
    void run() override {
    8000467c:	ff010113          	addi	sp,sp,-16
    80004680:	00113423          	sd	ra,8(sp)
    80004684:	00813023          	sd	s0,0(sp)
    80004688:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    8000468c:	00000593          	li	a1,0
    80004690:	00000097          	auipc	ra,0x0
    80004694:	814080e7          	jalr	-2028(ra) # 80003ea4 <_ZN7WorkerB11workerBodyBEPv>
    }
    80004698:	00813083          	ld	ra,8(sp)
    8000469c:	00013403          	ld	s0,0(sp)
    800046a0:	01010113          	addi	sp,sp,16
    800046a4:	00008067          	ret

00000000800046a8 <_ZN7WorkerC3runEv>:
    void run() override {
    800046a8:	ff010113          	addi	sp,sp,-16
    800046ac:	00113423          	sd	ra,8(sp)
    800046b0:	00813023          	sd	s0,0(sp)
    800046b4:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    800046b8:	00000593          	li	a1,0
    800046bc:	00000097          	auipc	ra,0x0
    800046c0:	8bc080e7          	jalr	-1860(ra) # 80003f78 <_ZN7WorkerC11workerBodyCEPv>
    }
    800046c4:	00813083          	ld	ra,8(sp)
    800046c8:	00013403          	ld	s0,0(sp)
    800046cc:	01010113          	addi	sp,sp,16
    800046d0:	00008067          	ret

00000000800046d4 <_ZN7WorkerD3runEv>:
    void run() override {
    800046d4:	ff010113          	addi	sp,sp,-16
    800046d8:	00113423          	sd	ra,8(sp)
    800046dc:	00813023          	sd	s0,0(sp)
    800046e0:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    800046e4:	00000593          	li	a1,0
    800046e8:	00000097          	auipc	ra,0x0
    800046ec:	a10080e7          	jalr	-1520(ra) # 800040f8 <_ZN7WorkerD11workerBodyDEPv>
    }
    800046f0:	00813083          	ld	ra,8(sp)
    800046f4:	00013403          	ld	s0,0(sp)
    800046f8:	01010113          	addi	sp,sp,16
    800046fc:	00008067          	ret

0000000080004700 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    80004700:	f8010113          	addi	sp,sp,-128
    80004704:	06113c23          	sd	ra,120(sp)
    80004708:	06813823          	sd	s0,112(sp)
    8000470c:	06913423          	sd	s1,104(sp)
    80004710:	07213023          	sd	s2,96(sp)
    80004714:	05313c23          	sd	s3,88(sp)
    80004718:	05413823          	sd	s4,80(sp)
    8000471c:	05513423          	sd	s5,72(sp)
    80004720:	05613023          	sd	s6,64(sp)
    80004724:	03713c23          	sd	s7,56(sp)
    80004728:	03813823          	sd	s8,48(sp)
    8000472c:	03913423          	sd	s9,40(sp)
    80004730:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    80004734:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    80004738:	00005517          	auipc	a0,0x5
    8000473c:	b0050513          	addi	a0,a0,-1280 # 80009238 <_ZZ9kPrintIntmE6digits+0x1c8>
    80004740:	00001097          	auipc	ra,0x1
    80004744:	5a8080e7          	jalr	1448(ra) # 80005ce8 <_Z11printStringPKc>
    getString(input, 30);
    80004748:	01e00593          	li	a1,30
    8000474c:	f8040493          	addi	s1,s0,-128
    80004750:	00048513          	mv	a0,s1
    80004754:	00001097          	auipc	ra,0x1
    80004758:	61c080e7          	jalr	1564(ra) # 80005d70 <_Z9getStringPci>
    threadNum = stringToInt(input);
    8000475c:	00048513          	mv	a0,s1
    80004760:	00001097          	auipc	ra,0x1
    80004764:	6e8080e7          	jalr	1768(ra) # 80005e48 <_Z11stringToIntPKc>
    80004768:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    8000476c:	00005517          	auipc	a0,0x5
    80004770:	aec50513          	addi	a0,a0,-1300 # 80009258 <_ZZ9kPrintIntmE6digits+0x1e8>
    80004774:	00001097          	auipc	ra,0x1
    80004778:	574080e7          	jalr	1396(ra) # 80005ce8 <_Z11printStringPKc>
    getString(input, 30);
    8000477c:	01e00593          	li	a1,30
    80004780:	00048513          	mv	a0,s1
    80004784:	00001097          	auipc	ra,0x1
    80004788:	5ec080e7          	jalr	1516(ra) # 80005d70 <_Z9getStringPci>
    n = stringToInt(input);
    8000478c:	00048513          	mv	a0,s1
    80004790:	00001097          	auipc	ra,0x1
    80004794:	6b8080e7          	jalr	1720(ra) # 80005e48 <_Z11stringToIntPKc>
    80004798:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    8000479c:	00005517          	auipc	a0,0x5
    800047a0:	adc50513          	addi	a0,a0,-1316 # 80009278 <_ZZ9kPrintIntmE6digits+0x208>
    800047a4:	00001097          	auipc	ra,0x1
    800047a8:	544080e7          	jalr	1348(ra) # 80005ce8 <_Z11printStringPKc>
    printInt(threadNum);
    800047ac:	00000613          	li	a2,0
    800047b0:	00a00593          	li	a1,10
    800047b4:	00098513          	mv	a0,s3
    800047b8:	00001097          	auipc	ra,0x1
    800047bc:	6e0080e7          	jalr	1760(ra) # 80005e98 <_Z8printIntiii>
    printString(" i velicina bafera ");
    800047c0:	00005517          	auipc	a0,0x5
    800047c4:	ad050513          	addi	a0,a0,-1328 # 80009290 <_ZZ9kPrintIntmE6digits+0x220>
    800047c8:	00001097          	auipc	ra,0x1
    800047cc:	520080e7          	jalr	1312(ra) # 80005ce8 <_Z11printStringPKc>
    printInt(n);
    800047d0:	00000613          	li	a2,0
    800047d4:	00a00593          	li	a1,10
    800047d8:	00048513          	mv	a0,s1
    800047dc:	00001097          	auipc	ra,0x1
    800047e0:	6bc080e7          	jalr	1724(ra) # 80005e98 <_Z8printIntiii>
    printString(".\n");
    800047e4:	00005517          	auipc	a0,0x5
    800047e8:	ac450513          	addi	a0,a0,-1340 # 800092a8 <_ZZ9kPrintIntmE6digits+0x238>
    800047ec:	00001097          	auipc	ra,0x1
    800047f0:	4fc080e7          	jalr	1276(ra) # 80005ce8 <_Z11printStringPKc>
    if (threadNum > n) {
    800047f4:	0334c463          	blt	s1,s3,8000481c <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    800047f8:	03305c63          	blez	s3,80004830 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    800047fc:	03800513          	li	a0,56
    80004800:	ffffe097          	auipc	ra,0xffffe
    80004804:	cac080e7          	jalr	-852(ra) # 800024ac <_Znwm>
    80004808:	00050a93          	mv	s5,a0
    8000480c:	00048593          	mv	a1,s1
    80004810:	00001097          	auipc	ra,0x1
    80004814:	7a8080e7          	jalr	1960(ra) # 80005fb8 <_ZN9BufferCPPC1Ei>
    80004818:	0300006f          	j	80004848 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    8000481c:	00005517          	auipc	a0,0x5
    80004820:	a9450513          	addi	a0,a0,-1388 # 800092b0 <_ZZ9kPrintIntmE6digits+0x240>
    80004824:	00001097          	auipc	ra,0x1
    80004828:	4c4080e7          	jalr	1220(ra) # 80005ce8 <_Z11printStringPKc>
        return;
    8000482c:	0140006f          	j	80004840 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80004830:	00005517          	auipc	a0,0x5
    80004834:	ac050513          	addi	a0,a0,-1344 # 800092f0 <_ZZ9kPrintIntmE6digits+0x280>
    80004838:	00001097          	auipc	ra,0x1
    8000483c:	4b0080e7          	jalr	1200(ra) # 80005ce8 <_Z11printStringPKc>
        return;
    80004840:	000c0113          	mv	sp,s8
    80004844:	2140006f          	j	80004a58 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    80004848:	01000513          	li	a0,16
    8000484c:	ffffe097          	auipc	ra,0xffffe
    80004850:	c60080e7          	jalr	-928(ra) # 800024ac <_Znwm>
    80004854:	00050913          	mv	s2,a0
    80004858:	00000593          	li	a1,0
    8000485c:	ffffe097          	auipc	ra,0xffffe
    80004860:	f94080e7          	jalr	-108(ra) # 800027f0 <_ZN9SemaphoreC1Ej>
    80004864:	00007797          	auipc	a5,0x7
    80004868:	4127b623          	sd	s2,1036(a5) # 8000bc70 <_ZL10waitForAll>
    Thread *producers[threadNum];
    8000486c:	00399793          	slli	a5,s3,0x3
    80004870:	00f78793          	addi	a5,a5,15
    80004874:	ff07f793          	andi	a5,a5,-16
    80004878:	40f10133          	sub	sp,sp,a5
    8000487c:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80004880:	0019871b          	addiw	a4,s3,1
    80004884:	00171793          	slli	a5,a4,0x1
    80004888:	00e787b3          	add	a5,a5,a4
    8000488c:	00379793          	slli	a5,a5,0x3
    80004890:	00f78793          	addi	a5,a5,15
    80004894:	ff07f793          	andi	a5,a5,-16
    80004898:	40f10133          	sub	sp,sp,a5
    8000489c:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    800048a0:	00199493          	slli	s1,s3,0x1
    800048a4:	013484b3          	add	s1,s1,s3
    800048a8:	00349493          	slli	s1,s1,0x3
    800048ac:	009b04b3          	add	s1,s6,s1
    800048b0:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    800048b4:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    800048b8:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    800048bc:	02800513          	li	a0,40
    800048c0:	ffffe097          	auipc	ra,0xffffe
    800048c4:	bec080e7          	jalr	-1044(ra) # 800024ac <_Znwm>
    800048c8:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    800048cc:	ffffe097          	auipc	ra,0xffffe
    800048d0:	ea8080e7          	jalr	-344(ra) # 80002774 <_ZN6ThreadC1Ev>
    800048d4:	00007797          	auipc	a5,0x7
    800048d8:	10c78793          	addi	a5,a5,268 # 8000b9e0 <_ZTV8Consumer+0x10>
    800048dc:	00fbb023          	sd	a5,0(s7)
    800048e0:	029bb023          	sd	s1,32(s7)
    consumer->start();
    800048e4:	000b8513          	mv	a0,s7
    800048e8:	ffffe097          	auipc	ra,0xffffe
    800048ec:	d74080e7          	jalr	-652(ra) # 8000265c <_ZN6Thread5startEv>
    threadData[0].id = 0;
    800048f0:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    800048f4:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    800048f8:	00007797          	auipc	a5,0x7
    800048fc:	3787b783          	ld	a5,888(a5) # 8000bc70 <_ZL10waitForAll>
    80004900:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004904:	02800513          	li	a0,40
    80004908:	ffffe097          	auipc	ra,0xffffe
    8000490c:	ba4080e7          	jalr	-1116(ra) # 800024ac <_Znwm>
    80004910:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80004914:	ffffe097          	auipc	ra,0xffffe
    80004918:	e60080e7          	jalr	-416(ra) # 80002774 <_ZN6ThreadC1Ev>
    8000491c:	00007797          	auipc	a5,0x7
    80004920:	07478793          	addi	a5,a5,116 # 8000b990 <_ZTV16ProducerKeyborad+0x10>
    80004924:	00f4b023          	sd	a5,0(s1)
    80004928:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    8000492c:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80004930:	00048513          	mv	a0,s1
    80004934:	ffffe097          	auipc	ra,0xffffe
    80004938:	d28080e7          	jalr	-728(ra) # 8000265c <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    8000493c:	00100913          	li	s2,1
    80004940:	0300006f          	j	80004970 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004944:	00007797          	auipc	a5,0x7
    80004948:	07478793          	addi	a5,a5,116 # 8000b9b8 <_ZTV8Producer+0x10>
    8000494c:	00fcb023          	sd	a5,0(s9)
    80004950:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    80004954:	00391793          	slli	a5,s2,0x3
    80004958:	00fa07b3          	add	a5,s4,a5
    8000495c:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80004960:	000c8513          	mv	a0,s9
    80004964:	ffffe097          	auipc	ra,0xffffe
    80004968:	cf8080e7          	jalr	-776(ra) # 8000265c <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    8000496c:	0019091b          	addiw	s2,s2,1
    80004970:	05395263          	bge	s2,s3,800049b4 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80004974:	00191493          	slli	s1,s2,0x1
    80004978:	012484b3          	add	s1,s1,s2
    8000497c:	00349493          	slli	s1,s1,0x3
    80004980:	009b04b3          	add	s1,s6,s1
    80004984:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80004988:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    8000498c:	00007797          	auipc	a5,0x7
    80004990:	2e47b783          	ld	a5,740(a5) # 8000bc70 <_ZL10waitForAll>
    80004994:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80004998:	02800513          	li	a0,40
    8000499c:	ffffe097          	auipc	ra,0xffffe
    800049a0:	b10080e7          	jalr	-1264(ra) # 800024ac <_Znwm>
    800049a4:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    800049a8:	ffffe097          	auipc	ra,0xffffe
    800049ac:	dcc080e7          	jalr	-564(ra) # 80002774 <_ZN6ThreadC1Ev>
    800049b0:	f95ff06f          	j	80004944 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    800049b4:	ffffe097          	auipc	ra,0xffffe
    800049b8:	d0c080e7          	jalr	-756(ra) # 800026c0 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    800049bc:	00000493          	li	s1,0
    800049c0:	0099ce63          	blt	s3,s1,800049dc <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    800049c4:	00007517          	auipc	a0,0x7
    800049c8:	2ac53503          	ld	a0,684(a0) # 8000bc70 <_ZL10waitForAll>
    800049cc:	ffffe097          	auipc	ra,0xffffe
    800049d0:	e5c080e7          	jalr	-420(ra) # 80002828 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    800049d4:	0014849b          	addiw	s1,s1,1
    800049d8:	fe9ff06f          	j	800049c0 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    800049dc:	00007517          	auipc	a0,0x7
    800049e0:	29453503          	ld	a0,660(a0) # 8000bc70 <_ZL10waitForAll>
    800049e4:	00050863          	beqz	a0,800049f4 <_Z20testConsumerProducerv+0x2f4>
    800049e8:	00053783          	ld	a5,0(a0)
    800049ec:	0087b783          	ld	a5,8(a5)
    800049f0:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    800049f4:	00000493          	li	s1,0
    800049f8:	0080006f          	j	80004a00 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    800049fc:	0014849b          	addiw	s1,s1,1
    80004a00:	0334d263          	bge	s1,s3,80004a24 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    80004a04:	00349793          	slli	a5,s1,0x3
    80004a08:	00fa07b3          	add	a5,s4,a5
    80004a0c:	0007b503          	ld	a0,0(a5)
    80004a10:	fe0506e3          	beqz	a0,800049fc <_Z20testConsumerProducerv+0x2fc>
    80004a14:	00053783          	ld	a5,0(a0)
    80004a18:	0087b783          	ld	a5,8(a5)
    80004a1c:	000780e7          	jalr	a5
    80004a20:	fddff06f          	j	800049fc <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    80004a24:	000b8a63          	beqz	s7,80004a38 <_Z20testConsumerProducerv+0x338>
    80004a28:	000bb783          	ld	a5,0(s7)
    80004a2c:	0087b783          	ld	a5,8(a5)
    80004a30:	000b8513          	mv	a0,s7
    80004a34:	000780e7          	jalr	a5
    delete buffer;
    80004a38:	000a8e63          	beqz	s5,80004a54 <_Z20testConsumerProducerv+0x354>
    80004a3c:	000a8513          	mv	a0,s5
    80004a40:	00002097          	auipc	ra,0x2
    80004a44:	870080e7          	jalr	-1936(ra) # 800062b0 <_ZN9BufferCPPD1Ev>
    80004a48:	000a8513          	mv	a0,s5
    80004a4c:	ffffe097          	auipc	ra,0xffffe
    80004a50:	ab0080e7          	jalr	-1360(ra) # 800024fc <_ZdlPv>
    80004a54:	000c0113          	mv	sp,s8
}
    80004a58:	f8040113          	addi	sp,s0,-128
    80004a5c:	07813083          	ld	ra,120(sp)
    80004a60:	07013403          	ld	s0,112(sp)
    80004a64:	06813483          	ld	s1,104(sp)
    80004a68:	06013903          	ld	s2,96(sp)
    80004a6c:	05813983          	ld	s3,88(sp)
    80004a70:	05013a03          	ld	s4,80(sp)
    80004a74:	04813a83          	ld	s5,72(sp)
    80004a78:	04013b03          	ld	s6,64(sp)
    80004a7c:	03813b83          	ld	s7,56(sp)
    80004a80:	03013c03          	ld	s8,48(sp)
    80004a84:	02813c83          	ld	s9,40(sp)
    80004a88:	08010113          	addi	sp,sp,128
    80004a8c:	00008067          	ret
    80004a90:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80004a94:	000a8513          	mv	a0,s5
    80004a98:	ffffe097          	auipc	ra,0xffffe
    80004a9c:	a64080e7          	jalr	-1436(ra) # 800024fc <_ZdlPv>
    80004aa0:	00048513          	mv	a0,s1
    80004aa4:	00008097          	auipc	ra,0x8
    80004aa8:	2c4080e7          	jalr	708(ra) # 8000cd68 <_Unwind_Resume>
    80004aac:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80004ab0:	00090513          	mv	a0,s2
    80004ab4:	ffffe097          	auipc	ra,0xffffe
    80004ab8:	a48080e7          	jalr	-1464(ra) # 800024fc <_ZdlPv>
    80004abc:	00048513          	mv	a0,s1
    80004ac0:	00008097          	auipc	ra,0x8
    80004ac4:	2a8080e7          	jalr	680(ra) # 8000cd68 <_Unwind_Resume>
    80004ac8:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004acc:	000b8513          	mv	a0,s7
    80004ad0:	ffffe097          	auipc	ra,0xffffe
    80004ad4:	a2c080e7          	jalr	-1492(ra) # 800024fc <_ZdlPv>
    80004ad8:	00048513          	mv	a0,s1
    80004adc:	00008097          	auipc	ra,0x8
    80004ae0:	28c080e7          	jalr	652(ra) # 8000cd68 <_Unwind_Resume>
    80004ae4:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004ae8:	00048513          	mv	a0,s1
    80004aec:	ffffe097          	auipc	ra,0xffffe
    80004af0:	a10080e7          	jalr	-1520(ra) # 800024fc <_ZdlPv>
    80004af4:	00090513          	mv	a0,s2
    80004af8:	00008097          	auipc	ra,0x8
    80004afc:	270080e7          	jalr	624(ra) # 8000cd68 <_Unwind_Resume>
    80004b00:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    80004b04:	000c8513          	mv	a0,s9
    80004b08:	ffffe097          	auipc	ra,0xffffe
    80004b0c:	9f4080e7          	jalr	-1548(ra) # 800024fc <_ZdlPv>
    80004b10:	00048513          	mv	a0,s1
    80004b14:	00008097          	auipc	ra,0x8
    80004b18:	254080e7          	jalr	596(ra) # 8000cd68 <_Unwind_Resume>

0000000080004b1c <_ZN8Consumer3runEv>:
    void run() override {
    80004b1c:	fd010113          	addi	sp,sp,-48
    80004b20:	02113423          	sd	ra,40(sp)
    80004b24:	02813023          	sd	s0,32(sp)
    80004b28:	00913c23          	sd	s1,24(sp)
    80004b2c:	01213823          	sd	s2,16(sp)
    80004b30:	01313423          	sd	s3,8(sp)
    80004b34:	03010413          	addi	s0,sp,48
    80004b38:	00050913          	mv	s2,a0
        int i = 0;
    80004b3c:	00000993          	li	s3,0
    80004b40:	0100006f          	j	80004b50 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    80004b44:	00a00513          	li	a0,10
    80004b48:	ffffe097          	auipc	ra,0xffffe
    80004b4c:	dd4080e7          	jalr	-556(ra) # 8000291c <_ZN7Console4putcEc>
        while (!threadEnd) {
    80004b50:	00007797          	auipc	a5,0x7
    80004b54:	1187a783          	lw	a5,280(a5) # 8000bc68 <_ZL9threadEnd>
    80004b58:	04079a63          	bnez	a5,80004bac <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80004b5c:	02093783          	ld	a5,32(s2)
    80004b60:	0087b503          	ld	a0,8(a5)
    80004b64:	00001097          	auipc	ra,0x1
    80004b68:	638080e7          	jalr	1592(ra) # 8000619c <_ZN9BufferCPP3getEv>
            i++;
    80004b6c:	0019849b          	addiw	s1,s3,1
    80004b70:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80004b74:	0ff57513          	andi	a0,a0,255
    80004b78:	ffffe097          	auipc	ra,0xffffe
    80004b7c:	da4080e7          	jalr	-604(ra) # 8000291c <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80004b80:	05000793          	li	a5,80
    80004b84:	02f4e4bb          	remw	s1,s1,a5
    80004b88:	fc0494e3          	bnez	s1,80004b50 <_ZN8Consumer3runEv+0x34>
    80004b8c:	fb9ff06f          	j	80004b44 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80004b90:	02093783          	ld	a5,32(s2)
    80004b94:	0087b503          	ld	a0,8(a5)
    80004b98:	00001097          	auipc	ra,0x1
    80004b9c:	604080e7          	jalr	1540(ra) # 8000619c <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80004ba0:	0ff57513          	andi	a0,a0,255
    80004ba4:	ffffe097          	auipc	ra,0xffffe
    80004ba8:	d78080e7          	jalr	-648(ra) # 8000291c <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80004bac:	02093783          	ld	a5,32(s2)
    80004bb0:	0087b503          	ld	a0,8(a5)
    80004bb4:	00001097          	auipc	ra,0x1
    80004bb8:	674080e7          	jalr	1652(ra) # 80006228 <_ZN9BufferCPP6getCntEv>
    80004bbc:	fca04ae3          	bgtz	a0,80004b90 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80004bc0:	02093783          	ld	a5,32(s2)
    80004bc4:	0107b503          	ld	a0,16(a5)
    80004bc8:	ffffe097          	auipc	ra,0xffffe
    80004bcc:	c8c080e7          	jalr	-884(ra) # 80002854 <_ZN9Semaphore6signalEv>
    }
    80004bd0:	02813083          	ld	ra,40(sp)
    80004bd4:	02013403          	ld	s0,32(sp)
    80004bd8:	01813483          	ld	s1,24(sp)
    80004bdc:	01013903          	ld	s2,16(sp)
    80004be0:	00813983          	ld	s3,8(sp)
    80004be4:	03010113          	addi	sp,sp,48
    80004be8:	00008067          	ret

0000000080004bec <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80004bec:	ff010113          	addi	sp,sp,-16
    80004bf0:	00113423          	sd	ra,8(sp)
    80004bf4:	00813023          	sd	s0,0(sp)
    80004bf8:	01010413          	addi	s0,sp,16
    80004bfc:	00007797          	auipc	a5,0x7
    80004c00:	de478793          	addi	a5,a5,-540 # 8000b9e0 <_ZTV8Consumer+0x10>
    80004c04:	00f53023          	sd	a5,0(a0)
    80004c08:	ffffd097          	auipc	ra,0xffffd
    80004c0c:	7b4080e7          	jalr	1972(ra) # 800023bc <_ZN6ThreadD1Ev>
    80004c10:	00813083          	ld	ra,8(sp)
    80004c14:	00013403          	ld	s0,0(sp)
    80004c18:	01010113          	addi	sp,sp,16
    80004c1c:	00008067          	ret

0000000080004c20 <_ZN8ConsumerD0Ev>:
    80004c20:	fe010113          	addi	sp,sp,-32
    80004c24:	00113c23          	sd	ra,24(sp)
    80004c28:	00813823          	sd	s0,16(sp)
    80004c2c:	00913423          	sd	s1,8(sp)
    80004c30:	02010413          	addi	s0,sp,32
    80004c34:	00050493          	mv	s1,a0
    80004c38:	00007797          	auipc	a5,0x7
    80004c3c:	da878793          	addi	a5,a5,-600 # 8000b9e0 <_ZTV8Consumer+0x10>
    80004c40:	00f53023          	sd	a5,0(a0)
    80004c44:	ffffd097          	auipc	ra,0xffffd
    80004c48:	778080e7          	jalr	1912(ra) # 800023bc <_ZN6ThreadD1Ev>
    80004c4c:	00048513          	mv	a0,s1
    80004c50:	ffffe097          	auipc	ra,0xffffe
    80004c54:	8ac080e7          	jalr	-1876(ra) # 800024fc <_ZdlPv>
    80004c58:	01813083          	ld	ra,24(sp)
    80004c5c:	01013403          	ld	s0,16(sp)
    80004c60:	00813483          	ld	s1,8(sp)
    80004c64:	02010113          	addi	sp,sp,32
    80004c68:	00008067          	ret

0000000080004c6c <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80004c6c:	ff010113          	addi	sp,sp,-16
    80004c70:	00113423          	sd	ra,8(sp)
    80004c74:	00813023          	sd	s0,0(sp)
    80004c78:	01010413          	addi	s0,sp,16
    80004c7c:	00007797          	auipc	a5,0x7
    80004c80:	d1478793          	addi	a5,a5,-748 # 8000b990 <_ZTV16ProducerKeyborad+0x10>
    80004c84:	00f53023          	sd	a5,0(a0)
    80004c88:	ffffd097          	auipc	ra,0xffffd
    80004c8c:	734080e7          	jalr	1844(ra) # 800023bc <_ZN6ThreadD1Ev>
    80004c90:	00813083          	ld	ra,8(sp)
    80004c94:	00013403          	ld	s0,0(sp)
    80004c98:	01010113          	addi	sp,sp,16
    80004c9c:	00008067          	ret

0000000080004ca0 <_ZN16ProducerKeyboradD0Ev>:
    80004ca0:	fe010113          	addi	sp,sp,-32
    80004ca4:	00113c23          	sd	ra,24(sp)
    80004ca8:	00813823          	sd	s0,16(sp)
    80004cac:	00913423          	sd	s1,8(sp)
    80004cb0:	02010413          	addi	s0,sp,32
    80004cb4:	00050493          	mv	s1,a0
    80004cb8:	00007797          	auipc	a5,0x7
    80004cbc:	cd878793          	addi	a5,a5,-808 # 8000b990 <_ZTV16ProducerKeyborad+0x10>
    80004cc0:	00f53023          	sd	a5,0(a0)
    80004cc4:	ffffd097          	auipc	ra,0xffffd
    80004cc8:	6f8080e7          	jalr	1784(ra) # 800023bc <_ZN6ThreadD1Ev>
    80004ccc:	00048513          	mv	a0,s1
    80004cd0:	ffffe097          	auipc	ra,0xffffe
    80004cd4:	82c080e7          	jalr	-2004(ra) # 800024fc <_ZdlPv>
    80004cd8:	01813083          	ld	ra,24(sp)
    80004cdc:	01013403          	ld	s0,16(sp)
    80004ce0:	00813483          	ld	s1,8(sp)
    80004ce4:	02010113          	addi	sp,sp,32
    80004ce8:	00008067          	ret

0000000080004cec <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80004cec:	ff010113          	addi	sp,sp,-16
    80004cf0:	00113423          	sd	ra,8(sp)
    80004cf4:	00813023          	sd	s0,0(sp)
    80004cf8:	01010413          	addi	s0,sp,16
    80004cfc:	00007797          	auipc	a5,0x7
    80004d00:	cbc78793          	addi	a5,a5,-836 # 8000b9b8 <_ZTV8Producer+0x10>
    80004d04:	00f53023          	sd	a5,0(a0)
    80004d08:	ffffd097          	auipc	ra,0xffffd
    80004d0c:	6b4080e7          	jalr	1716(ra) # 800023bc <_ZN6ThreadD1Ev>
    80004d10:	00813083          	ld	ra,8(sp)
    80004d14:	00013403          	ld	s0,0(sp)
    80004d18:	01010113          	addi	sp,sp,16
    80004d1c:	00008067          	ret

0000000080004d20 <_ZN8ProducerD0Ev>:
    80004d20:	fe010113          	addi	sp,sp,-32
    80004d24:	00113c23          	sd	ra,24(sp)
    80004d28:	00813823          	sd	s0,16(sp)
    80004d2c:	00913423          	sd	s1,8(sp)
    80004d30:	02010413          	addi	s0,sp,32
    80004d34:	00050493          	mv	s1,a0
    80004d38:	00007797          	auipc	a5,0x7
    80004d3c:	c8078793          	addi	a5,a5,-896 # 8000b9b8 <_ZTV8Producer+0x10>
    80004d40:	00f53023          	sd	a5,0(a0)
    80004d44:	ffffd097          	auipc	ra,0xffffd
    80004d48:	678080e7          	jalr	1656(ra) # 800023bc <_ZN6ThreadD1Ev>
    80004d4c:	00048513          	mv	a0,s1
    80004d50:	ffffd097          	auipc	ra,0xffffd
    80004d54:	7ac080e7          	jalr	1964(ra) # 800024fc <_ZdlPv>
    80004d58:	01813083          	ld	ra,24(sp)
    80004d5c:	01013403          	ld	s0,16(sp)
    80004d60:	00813483          	ld	s1,8(sp)
    80004d64:	02010113          	addi	sp,sp,32
    80004d68:	00008067          	ret

0000000080004d6c <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80004d6c:	fe010113          	addi	sp,sp,-32
    80004d70:	00113c23          	sd	ra,24(sp)
    80004d74:	00813823          	sd	s0,16(sp)
    80004d78:	00913423          	sd	s1,8(sp)
    80004d7c:	02010413          	addi	s0,sp,32
    80004d80:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80004d84:	ffffc097          	auipc	ra,0xffffc
    80004d88:	7e4080e7          	jalr	2020(ra) # 80001568 <_Z4getcv>
    80004d8c:	0005059b          	sext.w	a1,a0
    80004d90:	01b00793          	li	a5,27
    80004d94:	00f58c63          	beq	a1,a5,80004dac <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80004d98:	0204b783          	ld	a5,32(s1)
    80004d9c:	0087b503          	ld	a0,8(a5)
    80004da0:	00001097          	auipc	ra,0x1
    80004da4:	36c080e7          	jalr	876(ra) # 8000610c <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80004da8:	fddff06f          	j	80004d84 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80004dac:	00100793          	li	a5,1
    80004db0:	00007717          	auipc	a4,0x7
    80004db4:	eaf72c23          	sw	a5,-328(a4) # 8000bc68 <_ZL9threadEnd>
        td->buffer->put('!');
    80004db8:	0204b783          	ld	a5,32(s1)
    80004dbc:	02100593          	li	a1,33
    80004dc0:	0087b503          	ld	a0,8(a5)
    80004dc4:	00001097          	auipc	ra,0x1
    80004dc8:	348080e7          	jalr	840(ra) # 8000610c <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80004dcc:	0204b783          	ld	a5,32(s1)
    80004dd0:	0107b503          	ld	a0,16(a5)
    80004dd4:	ffffe097          	auipc	ra,0xffffe
    80004dd8:	a80080e7          	jalr	-1408(ra) # 80002854 <_ZN9Semaphore6signalEv>
    }
    80004ddc:	01813083          	ld	ra,24(sp)
    80004de0:	01013403          	ld	s0,16(sp)
    80004de4:	00813483          	ld	s1,8(sp)
    80004de8:	02010113          	addi	sp,sp,32
    80004dec:	00008067          	ret

0000000080004df0 <_ZN8Producer3runEv>:
    void run() override {
    80004df0:	fe010113          	addi	sp,sp,-32
    80004df4:	00113c23          	sd	ra,24(sp)
    80004df8:	00813823          	sd	s0,16(sp)
    80004dfc:	00913423          	sd	s1,8(sp)
    80004e00:	01213023          	sd	s2,0(sp)
    80004e04:	02010413          	addi	s0,sp,32
    80004e08:	00050493          	mv	s1,a0
        int i = 0;
    80004e0c:	00000913          	li	s2,0
        while (!threadEnd) {
    80004e10:	00007797          	auipc	a5,0x7
    80004e14:	e587a783          	lw	a5,-424(a5) # 8000bc68 <_ZL9threadEnd>
    80004e18:	04079263          	bnez	a5,80004e5c <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    80004e1c:	0204b783          	ld	a5,32(s1)
    80004e20:	0007a583          	lw	a1,0(a5)
    80004e24:	0305859b          	addiw	a1,a1,48
    80004e28:	0087b503          	ld	a0,8(a5)
    80004e2c:	00001097          	auipc	ra,0x1
    80004e30:	2e0080e7          	jalr	736(ra) # 8000610c <_ZN9BufferCPP3putEi>
            i++;
    80004e34:	0019071b          	addiw	a4,s2,1
    80004e38:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    80004e3c:	0204b783          	ld	a5,32(s1)
    80004e40:	0007a783          	lw	a5,0(a5)
    80004e44:	00e787bb          	addw	a5,a5,a4
    80004e48:	00500513          	li	a0,5
    80004e4c:	02a7e53b          	remw	a0,a5,a0
    80004e50:	ffffe097          	auipc	ra,0xffffe
    80004e54:	898080e7          	jalr	-1896(ra) # 800026e8 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80004e58:	fb9ff06f          	j	80004e10 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80004e5c:	0204b783          	ld	a5,32(s1)
    80004e60:	0107b503          	ld	a0,16(a5)
    80004e64:	ffffe097          	auipc	ra,0xffffe
    80004e68:	9f0080e7          	jalr	-1552(ra) # 80002854 <_ZN9Semaphore6signalEv>
    }
    80004e6c:	01813083          	ld	ra,24(sp)
    80004e70:	01013403          	ld	s0,16(sp)
    80004e74:	00813483          	ld	s1,8(sp)
    80004e78:	00013903          	ld	s2,0(sp)
    80004e7c:	02010113          	addi	sp,sp,32
    80004e80:	00008067          	ret

0000000080004e84 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004e84:	fe010113          	addi	sp,sp,-32
    80004e88:	00113c23          	sd	ra,24(sp)
    80004e8c:	00813823          	sd	s0,16(sp)
    80004e90:	00913423          	sd	s1,8(sp)
    80004e94:	01213023          	sd	s2,0(sp)
    80004e98:	02010413          	addi	s0,sp,32
    80004e9c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004ea0:	00100793          	li	a5,1
    80004ea4:	02a7f863          	bgeu	a5,a0,80004ed4 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004ea8:	00a00793          	li	a5,10
    80004eac:	02f577b3          	remu	a5,a0,a5
    80004eb0:	02078e63          	beqz	a5,80004eec <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004eb4:	fff48513          	addi	a0,s1,-1
    80004eb8:	00000097          	auipc	ra,0x0
    80004ebc:	fcc080e7          	jalr	-52(ra) # 80004e84 <_ZL9fibonaccim>
    80004ec0:	00050913          	mv	s2,a0
    80004ec4:	ffe48513          	addi	a0,s1,-2
    80004ec8:	00000097          	auipc	ra,0x0
    80004ecc:	fbc080e7          	jalr	-68(ra) # 80004e84 <_ZL9fibonaccim>
    80004ed0:	00a90533          	add	a0,s2,a0
}
    80004ed4:	01813083          	ld	ra,24(sp)
    80004ed8:	01013403          	ld	s0,16(sp)
    80004edc:	00813483          	ld	s1,8(sp)
    80004ee0:	00013903          	ld	s2,0(sp)
    80004ee4:	02010113          	addi	sp,sp,32
    80004ee8:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80004eec:	ffffc097          	auipc	ra,0xffffc
    80004ef0:	53c080e7          	jalr	1340(ra) # 80001428 <_Z15thread_dispatchv>
    80004ef4:	fc1ff06f          	j	80004eb4 <_ZL9fibonaccim+0x30>

0000000080004ef8 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80004ef8:	fe010113          	addi	sp,sp,-32
    80004efc:	00113c23          	sd	ra,24(sp)
    80004f00:	00813823          	sd	s0,16(sp)
    80004f04:	00913423          	sd	s1,8(sp)
    80004f08:	01213023          	sd	s2,0(sp)
    80004f0c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004f10:	00a00493          	li	s1,10
    80004f14:	0400006f          	j	80004f54 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004f18:	00004517          	auipc	a0,0x4
    80004f1c:	47850513          	addi	a0,a0,1144 # 80009390 <_ZZ9kPrintIntmE6digits+0x320>
    80004f20:	00001097          	auipc	ra,0x1
    80004f24:	dc8080e7          	jalr	-568(ra) # 80005ce8 <_Z11printStringPKc>
    80004f28:	00000613          	li	a2,0
    80004f2c:	00a00593          	li	a1,10
    80004f30:	00048513          	mv	a0,s1
    80004f34:	00001097          	auipc	ra,0x1
    80004f38:	f64080e7          	jalr	-156(ra) # 80005e98 <_Z8printIntiii>
    80004f3c:	00004517          	auipc	a0,0x4
    80004f40:	64450513          	addi	a0,a0,1604 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80004f44:	00001097          	auipc	ra,0x1
    80004f48:	da4080e7          	jalr	-604(ra) # 80005ce8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004f4c:	0014849b          	addiw	s1,s1,1
    80004f50:	0ff4f493          	andi	s1,s1,255
    80004f54:	00c00793          	li	a5,12
    80004f58:	fc97f0e3          	bgeu	a5,s1,80004f18 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80004f5c:	00004517          	auipc	a0,0x4
    80004f60:	43c50513          	addi	a0,a0,1084 # 80009398 <_ZZ9kPrintIntmE6digits+0x328>
    80004f64:	00001097          	auipc	ra,0x1
    80004f68:	d84080e7          	jalr	-636(ra) # 80005ce8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004f6c:	00500313          	li	t1,5
    thread_dispatch();
    80004f70:	ffffc097          	auipc	ra,0xffffc
    80004f74:	4b8080e7          	jalr	1208(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004f78:	01000513          	li	a0,16
    80004f7c:	00000097          	auipc	ra,0x0
    80004f80:	f08080e7          	jalr	-248(ra) # 80004e84 <_ZL9fibonaccim>
    80004f84:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004f88:	00004517          	auipc	a0,0x4
    80004f8c:	42050513          	addi	a0,a0,1056 # 800093a8 <_ZZ9kPrintIntmE6digits+0x338>
    80004f90:	00001097          	auipc	ra,0x1
    80004f94:	d58080e7          	jalr	-680(ra) # 80005ce8 <_Z11printStringPKc>
    80004f98:	00000613          	li	a2,0
    80004f9c:	00a00593          	li	a1,10
    80004fa0:	0009051b          	sext.w	a0,s2
    80004fa4:	00001097          	auipc	ra,0x1
    80004fa8:	ef4080e7          	jalr	-268(ra) # 80005e98 <_Z8printIntiii>
    80004fac:	00004517          	auipc	a0,0x4
    80004fb0:	5d450513          	addi	a0,a0,1492 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80004fb4:	00001097          	auipc	ra,0x1
    80004fb8:	d34080e7          	jalr	-716(ra) # 80005ce8 <_Z11printStringPKc>
    80004fbc:	0400006f          	j	80004ffc <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004fc0:	00004517          	auipc	a0,0x4
    80004fc4:	3d050513          	addi	a0,a0,976 # 80009390 <_ZZ9kPrintIntmE6digits+0x320>
    80004fc8:	00001097          	auipc	ra,0x1
    80004fcc:	d20080e7          	jalr	-736(ra) # 80005ce8 <_Z11printStringPKc>
    80004fd0:	00000613          	li	a2,0
    80004fd4:	00a00593          	li	a1,10
    80004fd8:	00048513          	mv	a0,s1
    80004fdc:	00001097          	auipc	ra,0x1
    80004fe0:	ebc080e7          	jalr	-324(ra) # 80005e98 <_Z8printIntiii>
    80004fe4:	00004517          	auipc	a0,0x4
    80004fe8:	59c50513          	addi	a0,a0,1436 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80004fec:	00001097          	auipc	ra,0x1
    80004ff0:	cfc080e7          	jalr	-772(ra) # 80005ce8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004ff4:	0014849b          	addiw	s1,s1,1
    80004ff8:	0ff4f493          	andi	s1,s1,255
    80004ffc:	00f00793          	li	a5,15
    80005000:	fc97f0e3          	bgeu	a5,s1,80004fc0 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80005004:	00004517          	auipc	a0,0x4
    80005008:	3b450513          	addi	a0,a0,948 # 800093b8 <_ZZ9kPrintIntmE6digits+0x348>
    8000500c:	00001097          	auipc	ra,0x1
    80005010:	cdc080e7          	jalr	-804(ra) # 80005ce8 <_Z11printStringPKc>
    finishedD = true;
    80005014:	00100793          	li	a5,1
    80005018:	00007717          	auipc	a4,0x7
    8000501c:	c6f70023          	sb	a5,-928(a4) # 8000bc78 <_ZL9finishedD>
    thread_dispatch();
    80005020:	ffffc097          	auipc	ra,0xffffc
    80005024:	408080e7          	jalr	1032(ra) # 80001428 <_Z15thread_dispatchv>
}
    80005028:	01813083          	ld	ra,24(sp)
    8000502c:	01013403          	ld	s0,16(sp)
    80005030:	00813483          	ld	s1,8(sp)
    80005034:	00013903          	ld	s2,0(sp)
    80005038:	02010113          	addi	sp,sp,32
    8000503c:	00008067          	ret

0000000080005040 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80005040:	fe010113          	addi	sp,sp,-32
    80005044:	00113c23          	sd	ra,24(sp)
    80005048:	00813823          	sd	s0,16(sp)
    8000504c:	00913423          	sd	s1,8(sp)
    80005050:	01213023          	sd	s2,0(sp)
    80005054:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80005058:	00000493          	li	s1,0
    8000505c:	0400006f          	j	8000509c <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80005060:	00004517          	auipc	a0,0x4
    80005064:	2f050513          	addi	a0,a0,752 # 80009350 <_ZZ9kPrintIntmE6digits+0x2e0>
    80005068:	00001097          	auipc	ra,0x1
    8000506c:	c80080e7          	jalr	-896(ra) # 80005ce8 <_Z11printStringPKc>
    80005070:	00000613          	li	a2,0
    80005074:	00a00593          	li	a1,10
    80005078:	00048513          	mv	a0,s1
    8000507c:	00001097          	auipc	ra,0x1
    80005080:	e1c080e7          	jalr	-484(ra) # 80005e98 <_Z8printIntiii>
    80005084:	00004517          	auipc	a0,0x4
    80005088:	4fc50513          	addi	a0,a0,1276 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    8000508c:	00001097          	auipc	ra,0x1
    80005090:	c5c080e7          	jalr	-932(ra) # 80005ce8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80005094:	0014849b          	addiw	s1,s1,1
    80005098:	0ff4f493          	andi	s1,s1,255
    8000509c:	00200793          	li	a5,2
    800050a0:	fc97f0e3          	bgeu	a5,s1,80005060 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    800050a4:	00004517          	auipc	a0,0x4
    800050a8:	2b450513          	addi	a0,a0,692 # 80009358 <_ZZ9kPrintIntmE6digits+0x2e8>
    800050ac:	00001097          	auipc	ra,0x1
    800050b0:	c3c080e7          	jalr	-964(ra) # 80005ce8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800050b4:	00700313          	li	t1,7
    thread_dispatch();
    800050b8:	ffffc097          	auipc	ra,0xffffc
    800050bc:	370080e7          	jalr	880(ra) # 80001428 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800050c0:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    800050c4:	00004517          	auipc	a0,0x4
    800050c8:	2a450513          	addi	a0,a0,676 # 80009368 <_ZZ9kPrintIntmE6digits+0x2f8>
    800050cc:	00001097          	auipc	ra,0x1
    800050d0:	c1c080e7          	jalr	-996(ra) # 80005ce8 <_Z11printStringPKc>
    800050d4:	00000613          	li	a2,0
    800050d8:	00a00593          	li	a1,10
    800050dc:	0009051b          	sext.w	a0,s2
    800050e0:	00001097          	auipc	ra,0x1
    800050e4:	db8080e7          	jalr	-584(ra) # 80005e98 <_Z8printIntiii>
    800050e8:	00004517          	auipc	a0,0x4
    800050ec:	49850513          	addi	a0,a0,1176 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    800050f0:	00001097          	auipc	ra,0x1
    800050f4:	bf8080e7          	jalr	-1032(ra) # 80005ce8 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    800050f8:	00c00513          	li	a0,12
    800050fc:	00000097          	auipc	ra,0x0
    80005100:	d88080e7          	jalr	-632(ra) # 80004e84 <_ZL9fibonaccim>
    80005104:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80005108:	00004517          	auipc	a0,0x4
    8000510c:	26850513          	addi	a0,a0,616 # 80009370 <_ZZ9kPrintIntmE6digits+0x300>
    80005110:	00001097          	auipc	ra,0x1
    80005114:	bd8080e7          	jalr	-1064(ra) # 80005ce8 <_Z11printStringPKc>
    80005118:	00000613          	li	a2,0
    8000511c:	00a00593          	li	a1,10
    80005120:	0009051b          	sext.w	a0,s2
    80005124:	00001097          	auipc	ra,0x1
    80005128:	d74080e7          	jalr	-652(ra) # 80005e98 <_Z8printIntiii>
    8000512c:	00004517          	auipc	a0,0x4
    80005130:	45450513          	addi	a0,a0,1108 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80005134:	00001097          	auipc	ra,0x1
    80005138:	bb4080e7          	jalr	-1100(ra) # 80005ce8 <_Z11printStringPKc>
    8000513c:	0400006f          	j	8000517c <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80005140:	00004517          	auipc	a0,0x4
    80005144:	21050513          	addi	a0,a0,528 # 80009350 <_ZZ9kPrintIntmE6digits+0x2e0>
    80005148:	00001097          	auipc	ra,0x1
    8000514c:	ba0080e7          	jalr	-1120(ra) # 80005ce8 <_Z11printStringPKc>
    80005150:	00000613          	li	a2,0
    80005154:	00a00593          	li	a1,10
    80005158:	00048513          	mv	a0,s1
    8000515c:	00001097          	auipc	ra,0x1
    80005160:	d3c080e7          	jalr	-708(ra) # 80005e98 <_Z8printIntiii>
    80005164:	00004517          	auipc	a0,0x4
    80005168:	41c50513          	addi	a0,a0,1052 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    8000516c:	00001097          	auipc	ra,0x1
    80005170:	b7c080e7          	jalr	-1156(ra) # 80005ce8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80005174:	0014849b          	addiw	s1,s1,1
    80005178:	0ff4f493          	andi	s1,s1,255
    8000517c:	00500793          	li	a5,5
    80005180:	fc97f0e3          	bgeu	a5,s1,80005140 <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    80005184:	00004517          	auipc	a0,0x4
    80005188:	1fc50513          	addi	a0,a0,508 # 80009380 <_ZZ9kPrintIntmE6digits+0x310>
    8000518c:	00001097          	auipc	ra,0x1
    80005190:	b5c080e7          	jalr	-1188(ra) # 80005ce8 <_Z11printStringPKc>
    finishedC = true;
    80005194:	00100793          	li	a5,1
    80005198:	00007717          	auipc	a4,0x7
    8000519c:	aef700a3          	sb	a5,-1311(a4) # 8000bc79 <_ZL9finishedC>
    thread_dispatch();
    800051a0:	ffffc097          	auipc	ra,0xffffc
    800051a4:	288080e7          	jalr	648(ra) # 80001428 <_Z15thread_dispatchv>
}
    800051a8:	01813083          	ld	ra,24(sp)
    800051ac:	01013403          	ld	s0,16(sp)
    800051b0:	00813483          	ld	s1,8(sp)
    800051b4:	00013903          	ld	s2,0(sp)
    800051b8:	02010113          	addi	sp,sp,32
    800051bc:	00008067          	ret

00000000800051c0 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    800051c0:	fe010113          	addi	sp,sp,-32
    800051c4:	00113c23          	sd	ra,24(sp)
    800051c8:	00813823          	sd	s0,16(sp)
    800051cc:	00913423          	sd	s1,8(sp)
    800051d0:	01213023          	sd	s2,0(sp)
    800051d4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800051d8:	00000913          	li	s2,0
    800051dc:	0380006f          	j	80005214 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    800051e0:	ffffc097          	auipc	ra,0xffffc
    800051e4:	248080e7          	jalr	584(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800051e8:	00148493          	addi	s1,s1,1
    800051ec:	000027b7          	lui	a5,0x2
    800051f0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800051f4:	0097ee63          	bltu	a5,s1,80005210 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800051f8:	00000713          	li	a4,0
    800051fc:	000077b7          	lui	a5,0x7
    80005200:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005204:	fce7eee3          	bltu	a5,a4,800051e0 <_ZL11workerBodyBPv+0x20>
    80005208:	00170713          	addi	a4,a4,1
    8000520c:	ff1ff06f          	j	800051fc <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80005210:	00190913          	addi	s2,s2,1
    80005214:	00f00793          	li	a5,15
    80005218:	0527e063          	bltu	a5,s2,80005258 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    8000521c:	00004517          	auipc	a0,0x4
    80005220:	11c50513          	addi	a0,a0,284 # 80009338 <_ZZ9kPrintIntmE6digits+0x2c8>
    80005224:	00001097          	auipc	ra,0x1
    80005228:	ac4080e7          	jalr	-1340(ra) # 80005ce8 <_Z11printStringPKc>
    8000522c:	00000613          	li	a2,0
    80005230:	00a00593          	li	a1,10
    80005234:	0009051b          	sext.w	a0,s2
    80005238:	00001097          	auipc	ra,0x1
    8000523c:	c60080e7          	jalr	-928(ra) # 80005e98 <_Z8printIntiii>
    80005240:	00004517          	auipc	a0,0x4
    80005244:	34050513          	addi	a0,a0,832 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80005248:	00001097          	auipc	ra,0x1
    8000524c:	aa0080e7          	jalr	-1376(ra) # 80005ce8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005250:	00000493          	li	s1,0
    80005254:	f99ff06f          	j	800051ec <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80005258:	00004517          	auipc	a0,0x4
    8000525c:	0e850513          	addi	a0,a0,232 # 80009340 <_ZZ9kPrintIntmE6digits+0x2d0>
    80005260:	00001097          	auipc	ra,0x1
    80005264:	a88080e7          	jalr	-1400(ra) # 80005ce8 <_Z11printStringPKc>
    finishedB = true;
    80005268:	00100793          	li	a5,1
    8000526c:	00007717          	auipc	a4,0x7
    80005270:	a0f70723          	sb	a5,-1522(a4) # 8000bc7a <_ZL9finishedB>
    thread_dispatch();
    80005274:	ffffc097          	auipc	ra,0xffffc
    80005278:	1b4080e7          	jalr	436(ra) # 80001428 <_Z15thread_dispatchv>
}
    8000527c:	01813083          	ld	ra,24(sp)
    80005280:	01013403          	ld	s0,16(sp)
    80005284:	00813483          	ld	s1,8(sp)
    80005288:	00013903          	ld	s2,0(sp)
    8000528c:	02010113          	addi	sp,sp,32
    80005290:	00008067          	ret

0000000080005294 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80005294:	fe010113          	addi	sp,sp,-32
    80005298:	00113c23          	sd	ra,24(sp)
    8000529c:	00813823          	sd	s0,16(sp)
    800052a0:	00913423          	sd	s1,8(sp)
    800052a4:	01213023          	sd	s2,0(sp)
    800052a8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800052ac:	00000913          	li	s2,0
    800052b0:	0380006f          	j	800052e8 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    800052b4:	ffffc097          	auipc	ra,0xffffc
    800052b8:	174080e7          	jalr	372(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800052bc:	00148493          	addi	s1,s1,1
    800052c0:	000027b7          	lui	a5,0x2
    800052c4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800052c8:	0097ee63          	bltu	a5,s1,800052e4 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800052cc:	00000713          	li	a4,0
    800052d0:	000077b7          	lui	a5,0x7
    800052d4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800052d8:	fce7eee3          	bltu	a5,a4,800052b4 <_ZL11workerBodyAPv+0x20>
    800052dc:	00170713          	addi	a4,a4,1
    800052e0:	ff1ff06f          	j	800052d0 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800052e4:	00190913          	addi	s2,s2,1
    800052e8:	00900793          	li	a5,9
    800052ec:	0527e063          	bltu	a5,s2,8000532c <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800052f0:	00004517          	auipc	a0,0x4
    800052f4:	03050513          	addi	a0,a0,48 # 80009320 <_ZZ9kPrintIntmE6digits+0x2b0>
    800052f8:	00001097          	auipc	ra,0x1
    800052fc:	9f0080e7          	jalr	-1552(ra) # 80005ce8 <_Z11printStringPKc>
    80005300:	00000613          	li	a2,0
    80005304:	00a00593          	li	a1,10
    80005308:	0009051b          	sext.w	a0,s2
    8000530c:	00001097          	auipc	ra,0x1
    80005310:	b8c080e7          	jalr	-1140(ra) # 80005e98 <_Z8printIntiii>
    80005314:	00004517          	auipc	a0,0x4
    80005318:	26c50513          	addi	a0,a0,620 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    8000531c:	00001097          	auipc	ra,0x1
    80005320:	9cc080e7          	jalr	-1588(ra) # 80005ce8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005324:	00000493          	li	s1,0
    80005328:	f99ff06f          	j	800052c0 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    8000532c:	00004517          	auipc	a0,0x4
    80005330:	ffc50513          	addi	a0,a0,-4 # 80009328 <_ZZ9kPrintIntmE6digits+0x2b8>
    80005334:	00001097          	auipc	ra,0x1
    80005338:	9b4080e7          	jalr	-1612(ra) # 80005ce8 <_Z11printStringPKc>
    finishedA = true;
    8000533c:	00100793          	li	a5,1
    80005340:	00007717          	auipc	a4,0x7
    80005344:	92f70da3          	sb	a5,-1733(a4) # 8000bc7b <_ZL9finishedA>
}
    80005348:	01813083          	ld	ra,24(sp)
    8000534c:	01013403          	ld	s0,16(sp)
    80005350:	00813483          	ld	s1,8(sp)
    80005354:	00013903          	ld	s2,0(sp)
    80005358:	02010113          	addi	sp,sp,32
    8000535c:	00008067          	ret

0000000080005360 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80005360:	fd010113          	addi	sp,sp,-48
    80005364:	02113423          	sd	ra,40(sp)
    80005368:	02813023          	sd	s0,32(sp)
    8000536c:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80005370:	00000613          	li	a2,0
    80005374:	00000597          	auipc	a1,0x0
    80005378:	f2058593          	addi	a1,a1,-224 # 80005294 <_ZL11workerBodyAPv>
    8000537c:	fd040513          	addi	a0,s0,-48
    80005380:	ffffc097          	auipc	ra,0xffffc
    80005384:	000080e7          	jalr	ra # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80005388:	00004517          	auipc	a0,0x4
    8000538c:	04050513          	addi	a0,a0,64 # 800093c8 <_ZZ9kPrintIntmE6digits+0x358>
    80005390:	00001097          	auipc	ra,0x1
    80005394:	958080e7          	jalr	-1704(ra) # 80005ce8 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80005398:	00000613          	li	a2,0
    8000539c:	00000597          	auipc	a1,0x0
    800053a0:	e2458593          	addi	a1,a1,-476 # 800051c0 <_ZL11workerBodyBPv>
    800053a4:	fd840513          	addi	a0,s0,-40
    800053a8:	ffffc097          	auipc	ra,0xffffc
    800053ac:	fd8080e7          	jalr	-40(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    800053b0:	00004517          	auipc	a0,0x4
    800053b4:	03050513          	addi	a0,a0,48 # 800093e0 <_ZZ9kPrintIntmE6digits+0x370>
    800053b8:	00001097          	auipc	ra,0x1
    800053bc:	930080e7          	jalr	-1744(ra) # 80005ce8 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    800053c0:	00000613          	li	a2,0
    800053c4:	00000597          	auipc	a1,0x0
    800053c8:	c7c58593          	addi	a1,a1,-900 # 80005040 <_ZL11workerBodyCPv>
    800053cc:	fe040513          	addi	a0,s0,-32
    800053d0:	ffffc097          	auipc	ra,0xffffc
    800053d4:	fb0080e7          	jalr	-80(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    800053d8:	00004517          	auipc	a0,0x4
    800053dc:	02050513          	addi	a0,a0,32 # 800093f8 <_ZZ9kPrintIntmE6digits+0x388>
    800053e0:	00001097          	auipc	ra,0x1
    800053e4:	908080e7          	jalr	-1784(ra) # 80005ce8 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    800053e8:	00000613          	li	a2,0
    800053ec:	00000597          	auipc	a1,0x0
    800053f0:	b0c58593          	addi	a1,a1,-1268 # 80004ef8 <_ZL11workerBodyDPv>
    800053f4:	fe840513          	addi	a0,s0,-24
    800053f8:	ffffc097          	auipc	ra,0xffffc
    800053fc:	f88080e7          	jalr	-120(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80005400:	00004517          	auipc	a0,0x4
    80005404:	01050513          	addi	a0,a0,16 # 80009410 <_ZZ9kPrintIntmE6digits+0x3a0>
    80005408:	00001097          	auipc	ra,0x1
    8000540c:	8e0080e7          	jalr	-1824(ra) # 80005ce8 <_Z11printStringPKc>
    80005410:	00c0006f          	j	8000541c <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80005414:	ffffc097          	auipc	ra,0xffffc
    80005418:	014080e7          	jalr	20(ra) # 80001428 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    8000541c:	00007797          	auipc	a5,0x7
    80005420:	85f7c783          	lbu	a5,-1953(a5) # 8000bc7b <_ZL9finishedA>
    80005424:	fe0788e3          	beqz	a5,80005414 <_Z18Threads_C_API_testv+0xb4>
    80005428:	00007797          	auipc	a5,0x7
    8000542c:	8527c783          	lbu	a5,-1966(a5) # 8000bc7a <_ZL9finishedB>
    80005430:	fe0782e3          	beqz	a5,80005414 <_Z18Threads_C_API_testv+0xb4>
    80005434:	00007797          	auipc	a5,0x7
    80005438:	8457c783          	lbu	a5,-1979(a5) # 8000bc79 <_ZL9finishedC>
    8000543c:	fc078ce3          	beqz	a5,80005414 <_Z18Threads_C_API_testv+0xb4>
    80005440:	00007797          	auipc	a5,0x7
    80005444:	8387c783          	lbu	a5,-1992(a5) # 8000bc78 <_ZL9finishedD>
    80005448:	fc0786e3          	beqz	a5,80005414 <_Z18Threads_C_API_testv+0xb4>
    }

}
    8000544c:	02813083          	ld	ra,40(sp)
    80005450:	02013403          	ld	s0,32(sp)
    80005454:	03010113          	addi	sp,sp,48
    80005458:	00008067          	ret

000000008000545c <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    8000545c:	fd010113          	addi	sp,sp,-48
    80005460:	02113423          	sd	ra,40(sp)
    80005464:	02813023          	sd	s0,32(sp)
    80005468:	00913c23          	sd	s1,24(sp)
    8000546c:	01213823          	sd	s2,16(sp)
    80005470:	01313423          	sd	s3,8(sp)
    80005474:	03010413          	addi	s0,sp,48
    80005478:	00050993          	mv	s3,a0
    8000547c:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80005480:	00000913          	li	s2,0
    80005484:	00c0006f          	j	80005490 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005488:	ffffd097          	auipc	ra,0xffffd
    8000548c:	238080e7          	jalr	568(ra) # 800026c0 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80005490:	ffffc097          	auipc	ra,0xffffc
    80005494:	0d8080e7          	jalr	216(ra) # 80001568 <_Z4getcv>
    80005498:	0005059b          	sext.w	a1,a0
    8000549c:	01b00793          	li	a5,27
    800054a0:	02f58a63          	beq	a1,a5,800054d4 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    800054a4:	0084b503          	ld	a0,8(s1)
    800054a8:	00001097          	auipc	ra,0x1
    800054ac:	c64080e7          	jalr	-924(ra) # 8000610c <_ZN9BufferCPP3putEi>
        i++;
    800054b0:	0019071b          	addiw	a4,s2,1
    800054b4:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800054b8:	0004a683          	lw	a3,0(s1)
    800054bc:	0026979b          	slliw	a5,a3,0x2
    800054c0:	00d787bb          	addw	a5,a5,a3
    800054c4:	0017979b          	slliw	a5,a5,0x1
    800054c8:	02f767bb          	remw	a5,a4,a5
    800054cc:	fc0792e3          	bnez	a5,80005490 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    800054d0:	fb9ff06f          	j	80005488 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    800054d4:	00100793          	li	a5,1
    800054d8:	00006717          	auipc	a4,0x6
    800054dc:	7af72423          	sw	a5,1960(a4) # 8000bc80 <_ZL9threadEnd>
    td->buffer->put('!');
    800054e0:	0209b783          	ld	a5,32(s3)
    800054e4:	02100593          	li	a1,33
    800054e8:	0087b503          	ld	a0,8(a5)
    800054ec:	00001097          	auipc	ra,0x1
    800054f0:	c20080e7          	jalr	-992(ra) # 8000610c <_ZN9BufferCPP3putEi>

    data->wait->signal();
    800054f4:	0104b503          	ld	a0,16(s1)
    800054f8:	ffffd097          	auipc	ra,0xffffd
    800054fc:	35c080e7          	jalr	860(ra) # 80002854 <_ZN9Semaphore6signalEv>
}
    80005500:	02813083          	ld	ra,40(sp)
    80005504:	02013403          	ld	s0,32(sp)
    80005508:	01813483          	ld	s1,24(sp)
    8000550c:	01013903          	ld	s2,16(sp)
    80005510:	00813983          	ld	s3,8(sp)
    80005514:	03010113          	addi	sp,sp,48
    80005518:	00008067          	ret

000000008000551c <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    8000551c:	fe010113          	addi	sp,sp,-32
    80005520:	00113c23          	sd	ra,24(sp)
    80005524:	00813823          	sd	s0,16(sp)
    80005528:	00913423          	sd	s1,8(sp)
    8000552c:	01213023          	sd	s2,0(sp)
    80005530:	02010413          	addi	s0,sp,32
    80005534:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005538:	00000913          	li	s2,0
    8000553c:	00c0006f          	j	80005548 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005540:	ffffd097          	auipc	ra,0xffffd
    80005544:	180080e7          	jalr	384(ra) # 800026c0 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80005548:	00006797          	auipc	a5,0x6
    8000554c:	7387a783          	lw	a5,1848(a5) # 8000bc80 <_ZL9threadEnd>
    80005550:	02079e63          	bnez	a5,8000558c <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80005554:	0004a583          	lw	a1,0(s1)
    80005558:	0305859b          	addiw	a1,a1,48
    8000555c:	0084b503          	ld	a0,8(s1)
    80005560:	00001097          	auipc	ra,0x1
    80005564:	bac080e7          	jalr	-1108(ra) # 8000610c <_ZN9BufferCPP3putEi>
        i++;
    80005568:	0019071b          	addiw	a4,s2,1
    8000556c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005570:	0004a683          	lw	a3,0(s1)
    80005574:	0026979b          	slliw	a5,a3,0x2
    80005578:	00d787bb          	addw	a5,a5,a3
    8000557c:	0017979b          	slliw	a5,a5,0x1
    80005580:	02f767bb          	remw	a5,a4,a5
    80005584:	fc0792e3          	bnez	a5,80005548 <_ZN12ProducerSync8producerEPv+0x2c>
    80005588:	fb9ff06f          	j	80005540 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    8000558c:	0104b503          	ld	a0,16(s1)
    80005590:	ffffd097          	auipc	ra,0xffffd
    80005594:	2c4080e7          	jalr	708(ra) # 80002854 <_ZN9Semaphore6signalEv>
}
    80005598:	01813083          	ld	ra,24(sp)
    8000559c:	01013403          	ld	s0,16(sp)
    800055a0:	00813483          	ld	s1,8(sp)
    800055a4:	00013903          	ld	s2,0(sp)
    800055a8:	02010113          	addi	sp,sp,32
    800055ac:	00008067          	ret

00000000800055b0 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    800055b0:	fd010113          	addi	sp,sp,-48
    800055b4:	02113423          	sd	ra,40(sp)
    800055b8:	02813023          	sd	s0,32(sp)
    800055bc:	00913c23          	sd	s1,24(sp)
    800055c0:	01213823          	sd	s2,16(sp)
    800055c4:	01313423          	sd	s3,8(sp)
    800055c8:	01413023          	sd	s4,0(sp)
    800055cc:	03010413          	addi	s0,sp,48
    800055d0:	00050993          	mv	s3,a0
    800055d4:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800055d8:	00000a13          	li	s4,0
    800055dc:	01c0006f          	j	800055f8 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    800055e0:	ffffd097          	auipc	ra,0xffffd
    800055e4:	0e0080e7          	jalr	224(ra) # 800026c0 <_ZN6Thread8dispatchEv>
    800055e8:	0500006f          	j	80005638 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    800055ec:	00a00513          	li	a0,10
    800055f0:	ffffc097          	auipc	ra,0xffffc
    800055f4:	fa0080e7          	jalr	-96(ra) # 80001590 <_Z4putcc>
    while (!threadEnd) {
    800055f8:	00006797          	auipc	a5,0x6
    800055fc:	6887a783          	lw	a5,1672(a5) # 8000bc80 <_ZL9threadEnd>
    80005600:	06079263          	bnez	a5,80005664 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80005604:	00893503          	ld	a0,8(s2)
    80005608:	00001097          	auipc	ra,0x1
    8000560c:	b94080e7          	jalr	-1132(ra) # 8000619c <_ZN9BufferCPP3getEv>
        i++;
    80005610:	001a049b          	addiw	s1,s4,1
    80005614:	00048a1b          	sext.w	s4,s1
        putc(key);
    80005618:	0ff57513          	andi	a0,a0,255
    8000561c:	ffffc097          	auipc	ra,0xffffc
    80005620:	f74080e7          	jalr	-140(ra) # 80001590 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80005624:	00092703          	lw	a4,0(s2)
    80005628:	0027179b          	slliw	a5,a4,0x2
    8000562c:	00e787bb          	addw	a5,a5,a4
    80005630:	02f4e7bb          	remw	a5,s1,a5
    80005634:	fa0786e3          	beqz	a5,800055e0 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80005638:	05000793          	li	a5,80
    8000563c:	02f4e4bb          	remw	s1,s1,a5
    80005640:	fa049ce3          	bnez	s1,800055f8 <_ZN12ConsumerSync8consumerEPv+0x48>
    80005644:	fa9ff06f          	j	800055ec <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80005648:	0209b783          	ld	a5,32(s3)
    8000564c:	0087b503          	ld	a0,8(a5)
    80005650:	00001097          	auipc	ra,0x1
    80005654:	b4c080e7          	jalr	-1204(ra) # 8000619c <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80005658:	0ff57513          	andi	a0,a0,255
    8000565c:	ffffd097          	auipc	ra,0xffffd
    80005660:	2c0080e7          	jalr	704(ra) # 8000291c <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80005664:	0209b783          	ld	a5,32(s3)
    80005668:	0087b503          	ld	a0,8(a5)
    8000566c:	00001097          	auipc	ra,0x1
    80005670:	bbc080e7          	jalr	-1092(ra) # 80006228 <_ZN9BufferCPP6getCntEv>
    80005674:	fca04ae3          	bgtz	a0,80005648 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80005678:	01093503          	ld	a0,16(s2)
    8000567c:	ffffd097          	auipc	ra,0xffffd
    80005680:	1d8080e7          	jalr	472(ra) # 80002854 <_ZN9Semaphore6signalEv>
}
    80005684:	02813083          	ld	ra,40(sp)
    80005688:	02013403          	ld	s0,32(sp)
    8000568c:	01813483          	ld	s1,24(sp)
    80005690:	01013903          	ld	s2,16(sp)
    80005694:	00813983          	ld	s3,8(sp)
    80005698:	00013a03          	ld	s4,0(sp)
    8000569c:	03010113          	addi	sp,sp,48
    800056a0:	00008067          	ret

00000000800056a4 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    800056a4:	f8010113          	addi	sp,sp,-128
    800056a8:	06113c23          	sd	ra,120(sp)
    800056ac:	06813823          	sd	s0,112(sp)
    800056b0:	06913423          	sd	s1,104(sp)
    800056b4:	07213023          	sd	s2,96(sp)
    800056b8:	05313c23          	sd	s3,88(sp)
    800056bc:	05413823          	sd	s4,80(sp)
    800056c0:	05513423          	sd	s5,72(sp)
    800056c4:	05613023          	sd	s6,64(sp)
    800056c8:	03713c23          	sd	s7,56(sp)
    800056cc:	03813823          	sd	s8,48(sp)
    800056d0:	03913423          	sd	s9,40(sp)
    800056d4:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    800056d8:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    800056dc:	00004517          	auipc	a0,0x4
    800056e0:	b5c50513          	addi	a0,a0,-1188 # 80009238 <_ZZ9kPrintIntmE6digits+0x1c8>
    800056e4:	00000097          	auipc	ra,0x0
    800056e8:	604080e7          	jalr	1540(ra) # 80005ce8 <_Z11printStringPKc>
    getString(input, 30);
    800056ec:	01e00593          	li	a1,30
    800056f0:	f8040493          	addi	s1,s0,-128
    800056f4:	00048513          	mv	a0,s1
    800056f8:	00000097          	auipc	ra,0x0
    800056fc:	678080e7          	jalr	1656(ra) # 80005d70 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80005700:	00048513          	mv	a0,s1
    80005704:	00000097          	auipc	ra,0x0
    80005708:	744080e7          	jalr	1860(ra) # 80005e48 <_Z11stringToIntPKc>
    8000570c:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80005710:	00004517          	auipc	a0,0x4
    80005714:	b4850513          	addi	a0,a0,-1208 # 80009258 <_ZZ9kPrintIntmE6digits+0x1e8>
    80005718:	00000097          	auipc	ra,0x0
    8000571c:	5d0080e7          	jalr	1488(ra) # 80005ce8 <_Z11printStringPKc>
    getString(input, 30);
    80005720:	01e00593          	li	a1,30
    80005724:	00048513          	mv	a0,s1
    80005728:	00000097          	auipc	ra,0x0
    8000572c:	648080e7          	jalr	1608(ra) # 80005d70 <_Z9getStringPci>
    n = stringToInt(input);
    80005730:	00048513          	mv	a0,s1
    80005734:	00000097          	auipc	ra,0x0
    80005738:	714080e7          	jalr	1812(ra) # 80005e48 <_Z11stringToIntPKc>
    8000573c:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80005740:	00004517          	auipc	a0,0x4
    80005744:	b3850513          	addi	a0,a0,-1224 # 80009278 <_ZZ9kPrintIntmE6digits+0x208>
    80005748:	00000097          	auipc	ra,0x0
    8000574c:	5a0080e7          	jalr	1440(ra) # 80005ce8 <_Z11printStringPKc>
    80005750:	00000613          	li	a2,0
    80005754:	00a00593          	li	a1,10
    80005758:	00090513          	mv	a0,s2
    8000575c:	00000097          	auipc	ra,0x0
    80005760:	73c080e7          	jalr	1852(ra) # 80005e98 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005764:	00004517          	auipc	a0,0x4
    80005768:	b2c50513          	addi	a0,a0,-1236 # 80009290 <_ZZ9kPrintIntmE6digits+0x220>
    8000576c:	00000097          	auipc	ra,0x0
    80005770:	57c080e7          	jalr	1404(ra) # 80005ce8 <_Z11printStringPKc>
    80005774:	00000613          	li	a2,0
    80005778:	00a00593          	li	a1,10
    8000577c:	00048513          	mv	a0,s1
    80005780:	00000097          	auipc	ra,0x0
    80005784:	718080e7          	jalr	1816(ra) # 80005e98 <_Z8printIntiii>
    printString(".\n");
    80005788:	00004517          	auipc	a0,0x4
    8000578c:	b2050513          	addi	a0,a0,-1248 # 800092a8 <_ZZ9kPrintIntmE6digits+0x238>
    80005790:	00000097          	auipc	ra,0x0
    80005794:	558080e7          	jalr	1368(ra) # 80005ce8 <_Z11printStringPKc>
    if(threadNum > n) {
    80005798:	0324c463          	blt	s1,s2,800057c0 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    8000579c:	03205c63          	blez	s2,800057d4 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    800057a0:	03800513          	li	a0,56
    800057a4:	ffffd097          	auipc	ra,0xffffd
    800057a8:	d08080e7          	jalr	-760(ra) # 800024ac <_Znwm>
    800057ac:	00050a93          	mv	s5,a0
    800057b0:	00048593          	mv	a1,s1
    800057b4:	00001097          	auipc	ra,0x1
    800057b8:	804080e7          	jalr	-2044(ra) # 80005fb8 <_ZN9BufferCPPC1Ei>
    800057bc:	0300006f          	j	800057ec <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800057c0:	00004517          	auipc	a0,0x4
    800057c4:	af050513          	addi	a0,a0,-1296 # 800092b0 <_ZZ9kPrintIntmE6digits+0x240>
    800057c8:	00000097          	auipc	ra,0x0
    800057cc:	520080e7          	jalr	1312(ra) # 80005ce8 <_Z11printStringPKc>
        return;
    800057d0:	0140006f          	j	800057e4 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800057d4:	00004517          	auipc	a0,0x4
    800057d8:	b1c50513          	addi	a0,a0,-1252 # 800092f0 <_ZZ9kPrintIntmE6digits+0x280>
    800057dc:	00000097          	auipc	ra,0x0
    800057e0:	50c080e7          	jalr	1292(ra) # 80005ce8 <_Z11printStringPKc>
        return;
    800057e4:	000b8113          	mv	sp,s7
    800057e8:	2380006f          	j	80005a20 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    800057ec:	01000513          	li	a0,16
    800057f0:	ffffd097          	auipc	ra,0xffffd
    800057f4:	cbc080e7          	jalr	-836(ra) # 800024ac <_Znwm>
    800057f8:	00050493          	mv	s1,a0
    800057fc:	00000593          	li	a1,0
    80005800:	ffffd097          	auipc	ra,0xffffd
    80005804:	ff0080e7          	jalr	-16(ra) # 800027f0 <_ZN9SemaphoreC1Ej>
    80005808:	00006797          	auipc	a5,0x6
    8000580c:	4897b023          	sd	s1,1152(a5) # 8000bc88 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80005810:	00391793          	slli	a5,s2,0x3
    80005814:	00f78793          	addi	a5,a5,15
    80005818:	ff07f793          	andi	a5,a5,-16
    8000581c:	40f10133          	sub	sp,sp,a5
    80005820:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80005824:	0019071b          	addiw	a4,s2,1
    80005828:	00171793          	slli	a5,a4,0x1
    8000582c:	00e787b3          	add	a5,a5,a4
    80005830:	00379793          	slli	a5,a5,0x3
    80005834:	00f78793          	addi	a5,a5,15
    80005838:	ff07f793          	andi	a5,a5,-16
    8000583c:	40f10133          	sub	sp,sp,a5
    80005840:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80005844:	00191c13          	slli	s8,s2,0x1
    80005848:	012c07b3          	add	a5,s8,s2
    8000584c:	00379793          	slli	a5,a5,0x3
    80005850:	00fa07b3          	add	a5,s4,a5
    80005854:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80005858:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    8000585c:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80005860:	02800513          	li	a0,40
    80005864:	ffffd097          	auipc	ra,0xffffd
    80005868:	c48080e7          	jalr	-952(ra) # 800024ac <_Znwm>
    8000586c:	00050b13          	mv	s6,a0
    80005870:	012c0c33          	add	s8,s8,s2
    80005874:	003c1c13          	slli	s8,s8,0x3
    80005878:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    8000587c:	ffffd097          	auipc	ra,0xffffd
    80005880:	ef8080e7          	jalr	-264(ra) # 80002774 <_ZN6ThreadC1Ev>
    80005884:	00006797          	auipc	a5,0x6
    80005888:	1d478793          	addi	a5,a5,468 # 8000ba58 <_ZTV12ConsumerSync+0x10>
    8000588c:	00fb3023          	sd	a5,0(s6)
    80005890:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80005894:	000b0513          	mv	a0,s6
    80005898:	ffffd097          	auipc	ra,0xffffd
    8000589c:	dc4080e7          	jalr	-572(ra) # 8000265c <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    800058a0:	00000493          	li	s1,0
    800058a4:	0380006f          	j	800058dc <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    800058a8:	00006797          	auipc	a5,0x6
    800058ac:	18878793          	addi	a5,a5,392 # 8000ba30 <_ZTV12ProducerSync+0x10>
    800058b0:	00fcb023          	sd	a5,0(s9)
    800058b4:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    800058b8:	00349793          	slli	a5,s1,0x3
    800058bc:	00f987b3          	add	a5,s3,a5
    800058c0:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    800058c4:	00349793          	slli	a5,s1,0x3
    800058c8:	00f987b3          	add	a5,s3,a5
    800058cc:	0007b503          	ld	a0,0(a5)
    800058d0:	ffffd097          	auipc	ra,0xffffd
    800058d4:	d8c080e7          	jalr	-628(ra) # 8000265c <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    800058d8:	0014849b          	addiw	s1,s1,1
    800058dc:	0b24d063          	bge	s1,s2,8000597c <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    800058e0:	00149793          	slli	a5,s1,0x1
    800058e4:	009787b3          	add	a5,a5,s1
    800058e8:	00379793          	slli	a5,a5,0x3
    800058ec:	00fa07b3          	add	a5,s4,a5
    800058f0:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800058f4:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    800058f8:	00006717          	auipc	a4,0x6
    800058fc:	39073703          	ld	a4,912(a4) # 8000bc88 <_ZL10waitForAll>
    80005900:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80005904:	02905863          	blez	s1,80005934 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80005908:	02800513          	li	a0,40
    8000590c:	ffffd097          	auipc	ra,0xffffd
    80005910:	ba0080e7          	jalr	-1120(ra) # 800024ac <_Znwm>
    80005914:	00050c93          	mv	s9,a0
    80005918:	00149c13          	slli	s8,s1,0x1
    8000591c:	009c0c33          	add	s8,s8,s1
    80005920:	003c1c13          	slli	s8,s8,0x3
    80005924:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005928:	ffffd097          	auipc	ra,0xffffd
    8000592c:	e4c080e7          	jalr	-436(ra) # 80002774 <_ZN6ThreadC1Ev>
    80005930:	f79ff06f          	j	800058a8 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80005934:	02800513          	li	a0,40
    80005938:	ffffd097          	auipc	ra,0xffffd
    8000593c:	b74080e7          	jalr	-1164(ra) # 800024ac <_Znwm>
    80005940:	00050c93          	mv	s9,a0
    80005944:	00149c13          	slli	s8,s1,0x1
    80005948:	009c0c33          	add	s8,s8,s1
    8000594c:	003c1c13          	slli	s8,s8,0x3
    80005950:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80005954:	ffffd097          	auipc	ra,0xffffd
    80005958:	e20080e7          	jalr	-480(ra) # 80002774 <_ZN6ThreadC1Ev>
    8000595c:	00006797          	auipc	a5,0x6
    80005960:	0ac78793          	addi	a5,a5,172 # 8000ba08 <_ZTV16ProducerKeyboard+0x10>
    80005964:	00fcb023          	sd	a5,0(s9)
    80005968:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    8000596c:	00349793          	slli	a5,s1,0x3
    80005970:	00f987b3          	add	a5,s3,a5
    80005974:	0197b023          	sd	s9,0(a5)
    80005978:	f4dff06f          	j	800058c4 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    8000597c:	ffffd097          	auipc	ra,0xffffd
    80005980:	d44080e7          	jalr	-700(ra) # 800026c0 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80005984:	00000493          	li	s1,0
    80005988:	00994e63          	blt	s2,s1,800059a4 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    8000598c:	00006517          	auipc	a0,0x6
    80005990:	2fc53503          	ld	a0,764(a0) # 8000bc88 <_ZL10waitForAll>
    80005994:	ffffd097          	auipc	ra,0xffffd
    80005998:	e94080e7          	jalr	-364(ra) # 80002828 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    8000599c:	0014849b          	addiw	s1,s1,1
    800059a0:	fe9ff06f          	j	80005988 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    800059a4:	00000493          	li	s1,0
    800059a8:	0080006f          	j	800059b0 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    800059ac:	0014849b          	addiw	s1,s1,1
    800059b0:	0324d263          	bge	s1,s2,800059d4 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    800059b4:	00349793          	slli	a5,s1,0x3
    800059b8:	00f987b3          	add	a5,s3,a5
    800059bc:	0007b503          	ld	a0,0(a5)
    800059c0:	fe0506e3          	beqz	a0,800059ac <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    800059c4:	00053783          	ld	a5,0(a0)
    800059c8:	0087b783          	ld	a5,8(a5)
    800059cc:	000780e7          	jalr	a5
    800059d0:	fddff06f          	j	800059ac <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    800059d4:	000b0a63          	beqz	s6,800059e8 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    800059d8:	000b3783          	ld	a5,0(s6)
    800059dc:	0087b783          	ld	a5,8(a5)
    800059e0:	000b0513          	mv	a0,s6
    800059e4:	000780e7          	jalr	a5
    delete waitForAll;
    800059e8:	00006517          	auipc	a0,0x6
    800059ec:	2a053503          	ld	a0,672(a0) # 8000bc88 <_ZL10waitForAll>
    800059f0:	00050863          	beqz	a0,80005a00 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    800059f4:	00053783          	ld	a5,0(a0)
    800059f8:	0087b783          	ld	a5,8(a5)
    800059fc:	000780e7          	jalr	a5
    delete buffer;
    80005a00:	000a8e63          	beqz	s5,80005a1c <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80005a04:	000a8513          	mv	a0,s5
    80005a08:	00001097          	auipc	ra,0x1
    80005a0c:	8a8080e7          	jalr	-1880(ra) # 800062b0 <_ZN9BufferCPPD1Ev>
    80005a10:	000a8513          	mv	a0,s5
    80005a14:	ffffd097          	auipc	ra,0xffffd
    80005a18:	ae8080e7          	jalr	-1304(ra) # 800024fc <_ZdlPv>
    80005a1c:	000b8113          	mv	sp,s7

}
    80005a20:	f8040113          	addi	sp,s0,-128
    80005a24:	07813083          	ld	ra,120(sp)
    80005a28:	07013403          	ld	s0,112(sp)
    80005a2c:	06813483          	ld	s1,104(sp)
    80005a30:	06013903          	ld	s2,96(sp)
    80005a34:	05813983          	ld	s3,88(sp)
    80005a38:	05013a03          	ld	s4,80(sp)
    80005a3c:	04813a83          	ld	s5,72(sp)
    80005a40:	04013b03          	ld	s6,64(sp)
    80005a44:	03813b83          	ld	s7,56(sp)
    80005a48:	03013c03          	ld	s8,48(sp)
    80005a4c:	02813c83          	ld	s9,40(sp)
    80005a50:	08010113          	addi	sp,sp,128
    80005a54:	00008067          	ret
    80005a58:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80005a5c:	000a8513          	mv	a0,s5
    80005a60:	ffffd097          	auipc	ra,0xffffd
    80005a64:	a9c080e7          	jalr	-1380(ra) # 800024fc <_ZdlPv>
    80005a68:	00048513          	mv	a0,s1
    80005a6c:	00007097          	auipc	ra,0x7
    80005a70:	2fc080e7          	jalr	764(ra) # 8000cd68 <_Unwind_Resume>
    80005a74:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80005a78:	00048513          	mv	a0,s1
    80005a7c:	ffffd097          	auipc	ra,0xffffd
    80005a80:	a80080e7          	jalr	-1408(ra) # 800024fc <_ZdlPv>
    80005a84:	00090513          	mv	a0,s2
    80005a88:	00007097          	auipc	ra,0x7
    80005a8c:	2e0080e7          	jalr	736(ra) # 8000cd68 <_Unwind_Resume>
    80005a90:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80005a94:	000b0513          	mv	a0,s6
    80005a98:	ffffd097          	auipc	ra,0xffffd
    80005a9c:	a64080e7          	jalr	-1436(ra) # 800024fc <_ZdlPv>
    80005aa0:	00048513          	mv	a0,s1
    80005aa4:	00007097          	auipc	ra,0x7
    80005aa8:	2c4080e7          	jalr	708(ra) # 8000cd68 <_Unwind_Resume>
    80005aac:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80005ab0:	000c8513          	mv	a0,s9
    80005ab4:	ffffd097          	auipc	ra,0xffffd
    80005ab8:	a48080e7          	jalr	-1464(ra) # 800024fc <_ZdlPv>
    80005abc:	00048513          	mv	a0,s1
    80005ac0:	00007097          	auipc	ra,0x7
    80005ac4:	2a8080e7          	jalr	680(ra) # 8000cd68 <_Unwind_Resume>
    80005ac8:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80005acc:	000c8513          	mv	a0,s9
    80005ad0:	ffffd097          	auipc	ra,0xffffd
    80005ad4:	a2c080e7          	jalr	-1492(ra) # 800024fc <_ZdlPv>
    80005ad8:	00048513          	mv	a0,s1
    80005adc:	00007097          	auipc	ra,0x7
    80005ae0:	28c080e7          	jalr	652(ra) # 8000cd68 <_Unwind_Resume>

0000000080005ae4 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80005ae4:	ff010113          	addi	sp,sp,-16
    80005ae8:	00113423          	sd	ra,8(sp)
    80005aec:	00813023          	sd	s0,0(sp)
    80005af0:	01010413          	addi	s0,sp,16
    80005af4:	00006797          	auipc	a5,0x6
    80005af8:	f6478793          	addi	a5,a5,-156 # 8000ba58 <_ZTV12ConsumerSync+0x10>
    80005afc:	00f53023          	sd	a5,0(a0)
    80005b00:	ffffd097          	auipc	ra,0xffffd
    80005b04:	8bc080e7          	jalr	-1860(ra) # 800023bc <_ZN6ThreadD1Ev>
    80005b08:	00813083          	ld	ra,8(sp)
    80005b0c:	00013403          	ld	s0,0(sp)
    80005b10:	01010113          	addi	sp,sp,16
    80005b14:	00008067          	ret

0000000080005b18 <_ZN12ConsumerSyncD0Ev>:
    80005b18:	fe010113          	addi	sp,sp,-32
    80005b1c:	00113c23          	sd	ra,24(sp)
    80005b20:	00813823          	sd	s0,16(sp)
    80005b24:	00913423          	sd	s1,8(sp)
    80005b28:	02010413          	addi	s0,sp,32
    80005b2c:	00050493          	mv	s1,a0
    80005b30:	00006797          	auipc	a5,0x6
    80005b34:	f2878793          	addi	a5,a5,-216 # 8000ba58 <_ZTV12ConsumerSync+0x10>
    80005b38:	00f53023          	sd	a5,0(a0)
    80005b3c:	ffffd097          	auipc	ra,0xffffd
    80005b40:	880080e7          	jalr	-1920(ra) # 800023bc <_ZN6ThreadD1Ev>
    80005b44:	00048513          	mv	a0,s1
    80005b48:	ffffd097          	auipc	ra,0xffffd
    80005b4c:	9b4080e7          	jalr	-1612(ra) # 800024fc <_ZdlPv>
    80005b50:	01813083          	ld	ra,24(sp)
    80005b54:	01013403          	ld	s0,16(sp)
    80005b58:	00813483          	ld	s1,8(sp)
    80005b5c:	02010113          	addi	sp,sp,32
    80005b60:	00008067          	ret

0000000080005b64 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80005b64:	ff010113          	addi	sp,sp,-16
    80005b68:	00113423          	sd	ra,8(sp)
    80005b6c:	00813023          	sd	s0,0(sp)
    80005b70:	01010413          	addi	s0,sp,16
    80005b74:	00006797          	auipc	a5,0x6
    80005b78:	ebc78793          	addi	a5,a5,-324 # 8000ba30 <_ZTV12ProducerSync+0x10>
    80005b7c:	00f53023          	sd	a5,0(a0)
    80005b80:	ffffd097          	auipc	ra,0xffffd
    80005b84:	83c080e7          	jalr	-1988(ra) # 800023bc <_ZN6ThreadD1Ev>
    80005b88:	00813083          	ld	ra,8(sp)
    80005b8c:	00013403          	ld	s0,0(sp)
    80005b90:	01010113          	addi	sp,sp,16
    80005b94:	00008067          	ret

0000000080005b98 <_ZN12ProducerSyncD0Ev>:
    80005b98:	fe010113          	addi	sp,sp,-32
    80005b9c:	00113c23          	sd	ra,24(sp)
    80005ba0:	00813823          	sd	s0,16(sp)
    80005ba4:	00913423          	sd	s1,8(sp)
    80005ba8:	02010413          	addi	s0,sp,32
    80005bac:	00050493          	mv	s1,a0
    80005bb0:	00006797          	auipc	a5,0x6
    80005bb4:	e8078793          	addi	a5,a5,-384 # 8000ba30 <_ZTV12ProducerSync+0x10>
    80005bb8:	00f53023          	sd	a5,0(a0)
    80005bbc:	ffffd097          	auipc	ra,0xffffd
    80005bc0:	800080e7          	jalr	-2048(ra) # 800023bc <_ZN6ThreadD1Ev>
    80005bc4:	00048513          	mv	a0,s1
    80005bc8:	ffffd097          	auipc	ra,0xffffd
    80005bcc:	934080e7          	jalr	-1740(ra) # 800024fc <_ZdlPv>
    80005bd0:	01813083          	ld	ra,24(sp)
    80005bd4:	01013403          	ld	s0,16(sp)
    80005bd8:	00813483          	ld	s1,8(sp)
    80005bdc:	02010113          	addi	sp,sp,32
    80005be0:	00008067          	ret

0000000080005be4 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80005be4:	ff010113          	addi	sp,sp,-16
    80005be8:	00113423          	sd	ra,8(sp)
    80005bec:	00813023          	sd	s0,0(sp)
    80005bf0:	01010413          	addi	s0,sp,16
    80005bf4:	00006797          	auipc	a5,0x6
    80005bf8:	e1478793          	addi	a5,a5,-492 # 8000ba08 <_ZTV16ProducerKeyboard+0x10>
    80005bfc:	00f53023          	sd	a5,0(a0)
    80005c00:	ffffc097          	auipc	ra,0xffffc
    80005c04:	7bc080e7          	jalr	1980(ra) # 800023bc <_ZN6ThreadD1Ev>
    80005c08:	00813083          	ld	ra,8(sp)
    80005c0c:	00013403          	ld	s0,0(sp)
    80005c10:	01010113          	addi	sp,sp,16
    80005c14:	00008067          	ret

0000000080005c18 <_ZN16ProducerKeyboardD0Ev>:
    80005c18:	fe010113          	addi	sp,sp,-32
    80005c1c:	00113c23          	sd	ra,24(sp)
    80005c20:	00813823          	sd	s0,16(sp)
    80005c24:	00913423          	sd	s1,8(sp)
    80005c28:	02010413          	addi	s0,sp,32
    80005c2c:	00050493          	mv	s1,a0
    80005c30:	00006797          	auipc	a5,0x6
    80005c34:	dd878793          	addi	a5,a5,-552 # 8000ba08 <_ZTV16ProducerKeyboard+0x10>
    80005c38:	00f53023          	sd	a5,0(a0)
    80005c3c:	ffffc097          	auipc	ra,0xffffc
    80005c40:	780080e7          	jalr	1920(ra) # 800023bc <_ZN6ThreadD1Ev>
    80005c44:	00048513          	mv	a0,s1
    80005c48:	ffffd097          	auipc	ra,0xffffd
    80005c4c:	8b4080e7          	jalr	-1868(ra) # 800024fc <_ZdlPv>
    80005c50:	01813083          	ld	ra,24(sp)
    80005c54:	01013403          	ld	s0,16(sp)
    80005c58:	00813483          	ld	s1,8(sp)
    80005c5c:	02010113          	addi	sp,sp,32
    80005c60:	00008067          	ret

0000000080005c64 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80005c64:	ff010113          	addi	sp,sp,-16
    80005c68:	00113423          	sd	ra,8(sp)
    80005c6c:	00813023          	sd	s0,0(sp)
    80005c70:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80005c74:	02053583          	ld	a1,32(a0)
    80005c78:	fffff097          	auipc	ra,0xfffff
    80005c7c:	7e4080e7          	jalr	2020(ra) # 8000545c <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80005c80:	00813083          	ld	ra,8(sp)
    80005c84:	00013403          	ld	s0,0(sp)
    80005c88:	01010113          	addi	sp,sp,16
    80005c8c:	00008067          	ret

0000000080005c90 <_ZN12ProducerSync3runEv>:
    void run() override {
    80005c90:	ff010113          	addi	sp,sp,-16
    80005c94:	00113423          	sd	ra,8(sp)
    80005c98:	00813023          	sd	s0,0(sp)
    80005c9c:	01010413          	addi	s0,sp,16
        producer(td);
    80005ca0:	02053583          	ld	a1,32(a0)
    80005ca4:	00000097          	auipc	ra,0x0
    80005ca8:	878080e7          	jalr	-1928(ra) # 8000551c <_ZN12ProducerSync8producerEPv>
    }
    80005cac:	00813083          	ld	ra,8(sp)
    80005cb0:	00013403          	ld	s0,0(sp)
    80005cb4:	01010113          	addi	sp,sp,16
    80005cb8:	00008067          	ret

0000000080005cbc <_ZN12ConsumerSync3runEv>:
    void run() override {
    80005cbc:	ff010113          	addi	sp,sp,-16
    80005cc0:	00113423          	sd	ra,8(sp)
    80005cc4:	00813023          	sd	s0,0(sp)
    80005cc8:	01010413          	addi	s0,sp,16
        consumer(td);
    80005ccc:	02053583          	ld	a1,32(a0)
    80005cd0:	00000097          	auipc	ra,0x0
    80005cd4:	8e0080e7          	jalr	-1824(ra) # 800055b0 <_ZN12ConsumerSync8consumerEPv>
    }
    80005cd8:	00813083          	ld	ra,8(sp)
    80005cdc:	00013403          	ld	s0,0(sp)
    80005ce0:	01010113          	addi	sp,sp,16
    80005ce4:	00008067          	ret

0000000080005ce8 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80005ce8:	fe010113          	addi	sp,sp,-32
    80005cec:	00113c23          	sd	ra,24(sp)
    80005cf0:	00813823          	sd	s0,16(sp)
    80005cf4:	00913423          	sd	s1,8(sp)
    80005cf8:	02010413          	addi	s0,sp,32
    80005cfc:	00050493          	mv	s1,a0
    LOCK();
    80005d00:	00100613          	li	a2,1
    80005d04:	00000593          	li	a1,0
    80005d08:	00006517          	auipc	a0,0x6
    80005d0c:	f8850513          	addi	a0,a0,-120 # 8000bc90 <lockPrint>
    80005d10:	ffffb097          	auipc	ra,0xffffb
    80005d14:	514080e7          	jalr	1300(ra) # 80001224 <copy_and_swap>
    80005d18:	00050863          	beqz	a0,80005d28 <_Z11printStringPKc+0x40>
    80005d1c:	ffffb097          	auipc	ra,0xffffb
    80005d20:	70c080e7          	jalr	1804(ra) # 80001428 <_Z15thread_dispatchv>
    80005d24:	fddff06f          	j	80005d00 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80005d28:	0004c503          	lbu	a0,0(s1)
    80005d2c:	00050a63          	beqz	a0,80005d40 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80005d30:	ffffc097          	auipc	ra,0xffffc
    80005d34:	860080e7          	jalr	-1952(ra) # 80001590 <_Z4putcc>
        string++;
    80005d38:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80005d3c:	fedff06f          	j	80005d28 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80005d40:	00000613          	li	a2,0
    80005d44:	00100593          	li	a1,1
    80005d48:	00006517          	auipc	a0,0x6
    80005d4c:	f4850513          	addi	a0,a0,-184 # 8000bc90 <lockPrint>
    80005d50:	ffffb097          	auipc	ra,0xffffb
    80005d54:	4d4080e7          	jalr	1236(ra) # 80001224 <copy_and_swap>
    80005d58:	fe0514e3          	bnez	a0,80005d40 <_Z11printStringPKc+0x58>
}
    80005d5c:	01813083          	ld	ra,24(sp)
    80005d60:	01013403          	ld	s0,16(sp)
    80005d64:	00813483          	ld	s1,8(sp)
    80005d68:	02010113          	addi	sp,sp,32
    80005d6c:	00008067          	ret

0000000080005d70 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80005d70:	fd010113          	addi	sp,sp,-48
    80005d74:	02113423          	sd	ra,40(sp)
    80005d78:	02813023          	sd	s0,32(sp)
    80005d7c:	00913c23          	sd	s1,24(sp)
    80005d80:	01213823          	sd	s2,16(sp)
    80005d84:	01313423          	sd	s3,8(sp)
    80005d88:	01413023          	sd	s4,0(sp)
    80005d8c:	03010413          	addi	s0,sp,48
    80005d90:	00050993          	mv	s3,a0
    80005d94:	00058a13          	mv	s4,a1
    LOCK();
    80005d98:	00100613          	li	a2,1
    80005d9c:	00000593          	li	a1,0
    80005da0:	00006517          	auipc	a0,0x6
    80005da4:	ef050513          	addi	a0,a0,-272 # 8000bc90 <lockPrint>
    80005da8:	ffffb097          	auipc	ra,0xffffb
    80005dac:	47c080e7          	jalr	1148(ra) # 80001224 <copy_and_swap>
    80005db0:	00050863          	beqz	a0,80005dc0 <_Z9getStringPci+0x50>
    80005db4:	ffffb097          	auipc	ra,0xffffb
    80005db8:	674080e7          	jalr	1652(ra) # 80001428 <_Z15thread_dispatchv>
    80005dbc:	fddff06f          	j	80005d98 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80005dc0:	00000913          	li	s2,0
    80005dc4:	00090493          	mv	s1,s2
    80005dc8:	0019091b          	addiw	s2,s2,1
    80005dcc:	03495a63          	bge	s2,s4,80005e00 <_Z9getStringPci+0x90>
        cc = getc();
    80005dd0:	ffffb097          	auipc	ra,0xffffb
    80005dd4:	798080e7          	jalr	1944(ra) # 80001568 <_Z4getcv>
        if(cc < 1)
    80005dd8:	02050463          	beqz	a0,80005e00 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80005ddc:	009984b3          	add	s1,s3,s1
    80005de0:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80005de4:	00a00793          	li	a5,10
    80005de8:	00f50a63          	beq	a0,a5,80005dfc <_Z9getStringPci+0x8c>
    80005dec:	00d00793          	li	a5,13
    80005df0:	fcf51ae3          	bne	a0,a5,80005dc4 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80005df4:	00090493          	mv	s1,s2
    80005df8:	0080006f          	j	80005e00 <_Z9getStringPci+0x90>
    80005dfc:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80005e00:	009984b3          	add	s1,s3,s1
    80005e04:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80005e08:	00000613          	li	a2,0
    80005e0c:	00100593          	li	a1,1
    80005e10:	00006517          	auipc	a0,0x6
    80005e14:	e8050513          	addi	a0,a0,-384 # 8000bc90 <lockPrint>
    80005e18:	ffffb097          	auipc	ra,0xffffb
    80005e1c:	40c080e7          	jalr	1036(ra) # 80001224 <copy_and_swap>
    80005e20:	fe0514e3          	bnez	a0,80005e08 <_Z9getStringPci+0x98>
    return buf;
}
    80005e24:	00098513          	mv	a0,s3
    80005e28:	02813083          	ld	ra,40(sp)
    80005e2c:	02013403          	ld	s0,32(sp)
    80005e30:	01813483          	ld	s1,24(sp)
    80005e34:	01013903          	ld	s2,16(sp)
    80005e38:	00813983          	ld	s3,8(sp)
    80005e3c:	00013a03          	ld	s4,0(sp)
    80005e40:	03010113          	addi	sp,sp,48
    80005e44:	00008067          	ret

0000000080005e48 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80005e48:	ff010113          	addi	sp,sp,-16
    80005e4c:	00813423          	sd	s0,8(sp)
    80005e50:	01010413          	addi	s0,sp,16
    80005e54:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80005e58:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80005e5c:	0006c603          	lbu	a2,0(a3)
    80005e60:	fd06071b          	addiw	a4,a2,-48
    80005e64:	0ff77713          	andi	a4,a4,255
    80005e68:	00900793          	li	a5,9
    80005e6c:	02e7e063          	bltu	a5,a4,80005e8c <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80005e70:	0025179b          	slliw	a5,a0,0x2
    80005e74:	00a787bb          	addw	a5,a5,a0
    80005e78:	0017979b          	slliw	a5,a5,0x1
    80005e7c:	00168693          	addi	a3,a3,1
    80005e80:	00c787bb          	addw	a5,a5,a2
    80005e84:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80005e88:	fd5ff06f          	j	80005e5c <_Z11stringToIntPKc+0x14>
    return n;
}
    80005e8c:	00813403          	ld	s0,8(sp)
    80005e90:	01010113          	addi	sp,sp,16
    80005e94:	00008067          	ret

0000000080005e98 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80005e98:	fc010113          	addi	sp,sp,-64
    80005e9c:	02113c23          	sd	ra,56(sp)
    80005ea0:	02813823          	sd	s0,48(sp)
    80005ea4:	02913423          	sd	s1,40(sp)
    80005ea8:	03213023          	sd	s2,32(sp)
    80005eac:	01313c23          	sd	s3,24(sp)
    80005eb0:	04010413          	addi	s0,sp,64
    80005eb4:	00050493          	mv	s1,a0
    80005eb8:	00058913          	mv	s2,a1
    80005ebc:	00060993          	mv	s3,a2
    LOCK();
    80005ec0:	00100613          	li	a2,1
    80005ec4:	00000593          	li	a1,0
    80005ec8:	00006517          	auipc	a0,0x6
    80005ecc:	dc850513          	addi	a0,a0,-568 # 8000bc90 <lockPrint>
    80005ed0:	ffffb097          	auipc	ra,0xffffb
    80005ed4:	354080e7          	jalr	852(ra) # 80001224 <copy_and_swap>
    80005ed8:	00050863          	beqz	a0,80005ee8 <_Z8printIntiii+0x50>
    80005edc:	ffffb097          	auipc	ra,0xffffb
    80005ee0:	54c080e7          	jalr	1356(ra) # 80001428 <_Z15thread_dispatchv>
    80005ee4:	fddff06f          	j	80005ec0 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80005ee8:	00098463          	beqz	s3,80005ef0 <_Z8printIntiii+0x58>
    80005eec:	0804c463          	bltz	s1,80005f74 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80005ef0:	0004851b          	sext.w	a0,s1
    neg = 0;
    80005ef4:	00000593          	li	a1,0
    }

    i = 0;
    80005ef8:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80005efc:	0009079b          	sext.w	a5,s2
    80005f00:	0325773b          	remuw	a4,a0,s2
    80005f04:	00048613          	mv	a2,s1
    80005f08:	0014849b          	addiw	s1,s1,1
    80005f0c:	02071693          	slli	a3,a4,0x20
    80005f10:	0206d693          	srli	a3,a3,0x20
    80005f14:	00006717          	auipc	a4,0x6
    80005f18:	b5c70713          	addi	a4,a4,-1188 # 8000ba70 <digits>
    80005f1c:	00d70733          	add	a4,a4,a3
    80005f20:	00074683          	lbu	a3,0(a4)
    80005f24:	fd040713          	addi	a4,s0,-48
    80005f28:	00c70733          	add	a4,a4,a2
    80005f2c:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80005f30:	0005071b          	sext.w	a4,a0
    80005f34:	0325553b          	divuw	a0,a0,s2
    80005f38:	fcf772e3          	bgeu	a4,a5,80005efc <_Z8printIntiii+0x64>
    if(neg)
    80005f3c:	00058c63          	beqz	a1,80005f54 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80005f40:	fd040793          	addi	a5,s0,-48
    80005f44:	009784b3          	add	s1,a5,s1
    80005f48:	02d00793          	li	a5,45
    80005f4c:	fef48823          	sb	a5,-16(s1)
    80005f50:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80005f54:	fff4849b          	addiw	s1,s1,-1
    80005f58:	0204c463          	bltz	s1,80005f80 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80005f5c:	fd040793          	addi	a5,s0,-48
    80005f60:	009787b3          	add	a5,a5,s1
    80005f64:	ff07c503          	lbu	a0,-16(a5)
    80005f68:	ffffb097          	auipc	ra,0xffffb
    80005f6c:	628080e7          	jalr	1576(ra) # 80001590 <_Z4putcc>
    80005f70:	fe5ff06f          	j	80005f54 <_Z8printIntiii+0xbc>
        x = -xx;
    80005f74:	4090053b          	negw	a0,s1
        neg = 1;
    80005f78:	00100593          	li	a1,1
        x = -xx;
    80005f7c:	f7dff06f          	j	80005ef8 <_Z8printIntiii+0x60>

    UNLOCK();
    80005f80:	00000613          	li	a2,0
    80005f84:	00100593          	li	a1,1
    80005f88:	00006517          	auipc	a0,0x6
    80005f8c:	d0850513          	addi	a0,a0,-760 # 8000bc90 <lockPrint>
    80005f90:	ffffb097          	auipc	ra,0xffffb
    80005f94:	294080e7          	jalr	660(ra) # 80001224 <copy_and_swap>
    80005f98:	fe0514e3          	bnez	a0,80005f80 <_Z8printIntiii+0xe8>
    80005f9c:	03813083          	ld	ra,56(sp)
    80005fa0:	03013403          	ld	s0,48(sp)
    80005fa4:	02813483          	ld	s1,40(sp)
    80005fa8:	02013903          	ld	s2,32(sp)
    80005fac:	01813983          	ld	s3,24(sp)
    80005fb0:	04010113          	addi	sp,sp,64
    80005fb4:	00008067          	ret

0000000080005fb8 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80005fb8:	fd010113          	addi	sp,sp,-48
    80005fbc:	02113423          	sd	ra,40(sp)
    80005fc0:	02813023          	sd	s0,32(sp)
    80005fc4:	00913c23          	sd	s1,24(sp)
    80005fc8:	01213823          	sd	s2,16(sp)
    80005fcc:	01313423          	sd	s3,8(sp)
    80005fd0:	03010413          	addi	s0,sp,48
    80005fd4:	00050493          	mv	s1,a0
    80005fd8:	00058913          	mv	s2,a1
    80005fdc:	0015879b          	addiw	a5,a1,1
    80005fe0:	0007851b          	sext.w	a0,a5
    80005fe4:	00f4a023          	sw	a5,0(s1)
    80005fe8:	0004a823          	sw	zero,16(s1)
    80005fec:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80005ff0:	00251513          	slli	a0,a0,0x2
    80005ff4:	ffffb097          	auipc	ra,0xffffb
    80005ff8:	31c080e7          	jalr	796(ra) # 80001310 <_Z9mem_allocm>
    80005ffc:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80006000:	01000513          	li	a0,16
    80006004:	ffffc097          	auipc	ra,0xffffc
    80006008:	4a8080e7          	jalr	1192(ra) # 800024ac <_Znwm>
    8000600c:	00050993          	mv	s3,a0
    80006010:	00000593          	li	a1,0
    80006014:	ffffc097          	auipc	ra,0xffffc
    80006018:	7dc080e7          	jalr	2012(ra) # 800027f0 <_ZN9SemaphoreC1Ej>
    8000601c:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80006020:	01000513          	li	a0,16
    80006024:	ffffc097          	auipc	ra,0xffffc
    80006028:	488080e7          	jalr	1160(ra) # 800024ac <_Znwm>
    8000602c:	00050993          	mv	s3,a0
    80006030:	00090593          	mv	a1,s2
    80006034:	ffffc097          	auipc	ra,0xffffc
    80006038:	7bc080e7          	jalr	1980(ra) # 800027f0 <_ZN9SemaphoreC1Ej>
    8000603c:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80006040:	01000513          	li	a0,16
    80006044:	ffffc097          	auipc	ra,0xffffc
    80006048:	468080e7          	jalr	1128(ra) # 800024ac <_Znwm>
    8000604c:	00050913          	mv	s2,a0
    80006050:	00100593          	li	a1,1
    80006054:	ffffc097          	auipc	ra,0xffffc
    80006058:	79c080e7          	jalr	1948(ra) # 800027f0 <_ZN9SemaphoreC1Ej>
    8000605c:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80006060:	01000513          	li	a0,16
    80006064:	ffffc097          	auipc	ra,0xffffc
    80006068:	448080e7          	jalr	1096(ra) # 800024ac <_Znwm>
    8000606c:	00050913          	mv	s2,a0
    80006070:	00100593          	li	a1,1
    80006074:	ffffc097          	auipc	ra,0xffffc
    80006078:	77c080e7          	jalr	1916(ra) # 800027f0 <_ZN9SemaphoreC1Ej>
    8000607c:	0324b823          	sd	s2,48(s1)
}
    80006080:	02813083          	ld	ra,40(sp)
    80006084:	02013403          	ld	s0,32(sp)
    80006088:	01813483          	ld	s1,24(sp)
    8000608c:	01013903          	ld	s2,16(sp)
    80006090:	00813983          	ld	s3,8(sp)
    80006094:	03010113          	addi	sp,sp,48
    80006098:	00008067          	ret
    8000609c:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    800060a0:	00098513          	mv	a0,s3
    800060a4:	ffffc097          	auipc	ra,0xffffc
    800060a8:	458080e7          	jalr	1112(ra) # 800024fc <_ZdlPv>
    800060ac:	00048513          	mv	a0,s1
    800060b0:	00007097          	auipc	ra,0x7
    800060b4:	cb8080e7          	jalr	-840(ra) # 8000cd68 <_Unwind_Resume>
    800060b8:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    800060bc:	00098513          	mv	a0,s3
    800060c0:	ffffc097          	auipc	ra,0xffffc
    800060c4:	43c080e7          	jalr	1084(ra) # 800024fc <_ZdlPv>
    800060c8:	00048513          	mv	a0,s1
    800060cc:	00007097          	auipc	ra,0x7
    800060d0:	c9c080e7          	jalr	-868(ra) # 8000cd68 <_Unwind_Resume>
    800060d4:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    800060d8:	00090513          	mv	a0,s2
    800060dc:	ffffc097          	auipc	ra,0xffffc
    800060e0:	420080e7          	jalr	1056(ra) # 800024fc <_ZdlPv>
    800060e4:	00048513          	mv	a0,s1
    800060e8:	00007097          	auipc	ra,0x7
    800060ec:	c80080e7          	jalr	-896(ra) # 8000cd68 <_Unwind_Resume>
    800060f0:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    800060f4:	00090513          	mv	a0,s2
    800060f8:	ffffc097          	auipc	ra,0xffffc
    800060fc:	404080e7          	jalr	1028(ra) # 800024fc <_ZdlPv>
    80006100:	00048513          	mv	a0,s1
    80006104:	00007097          	auipc	ra,0x7
    80006108:	c64080e7          	jalr	-924(ra) # 8000cd68 <_Unwind_Resume>

000000008000610c <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    8000610c:	fe010113          	addi	sp,sp,-32
    80006110:	00113c23          	sd	ra,24(sp)
    80006114:	00813823          	sd	s0,16(sp)
    80006118:	00913423          	sd	s1,8(sp)
    8000611c:	01213023          	sd	s2,0(sp)
    80006120:	02010413          	addi	s0,sp,32
    80006124:	00050493          	mv	s1,a0
    80006128:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    8000612c:	01853503          	ld	a0,24(a0)
    80006130:	ffffc097          	auipc	ra,0xffffc
    80006134:	6f8080e7          	jalr	1784(ra) # 80002828 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80006138:	0304b503          	ld	a0,48(s1)
    8000613c:	ffffc097          	auipc	ra,0xffffc
    80006140:	6ec080e7          	jalr	1772(ra) # 80002828 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80006144:	0084b783          	ld	a5,8(s1)
    80006148:	0144a703          	lw	a4,20(s1)
    8000614c:	00271713          	slli	a4,a4,0x2
    80006150:	00e787b3          	add	a5,a5,a4
    80006154:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006158:	0144a783          	lw	a5,20(s1)
    8000615c:	0017879b          	addiw	a5,a5,1
    80006160:	0004a703          	lw	a4,0(s1)
    80006164:	02e7e7bb          	remw	a5,a5,a4
    80006168:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    8000616c:	0304b503          	ld	a0,48(s1)
    80006170:	ffffc097          	auipc	ra,0xffffc
    80006174:	6e4080e7          	jalr	1764(ra) # 80002854 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80006178:	0204b503          	ld	a0,32(s1)
    8000617c:	ffffc097          	auipc	ra,0xffffc
    80006180:	6d8080e7          	jalr	1752(ra) # 80002854 <_ZN9Semaphore6signalEv>

}
    80006184:	01813083          	ld	ra,24(sp)
    80006188:	01013403          	ld	s0,16(sp)
    8000618c:	00813483          	ld	s1,8(sp)
    80006190:	00013903          	ld	s2,0(sp)
    80006194:	02010113          	addi	sp,sp,32
    80006198:	00008067          	ret

000000008000619c <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    8000619c:	fe010113          	addi	sp,sp,-32
    800061a0:	00113c23          	sd	ra,24(sp)
    800061a4:	00813823          	sd	s0,16(sp)
    800061a8:	00913423          	sd	s1,8(sp)
    800061ac:	01213023          	sd	s2,0(sp)
    800061b0:	02010413          	addi	s0,sp,32
    800061b4:	00050493          	mv	s1,a0
    itemAvailable->wait();
    800061b8:	02053503          	ld	a0,32(a0)
    800061bc:	ffffc097          	auipc	ra,0xffffc
    800061c0:	66c080e7          	jalr	1644(ra) # 80002828 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    800061c4:	0284b503          	ld	a0,40(s1)
    800061c8:	ffffc097          	auipc	ra,0xffffc
    800061cc:	660080e7          	jalr	1632(ra) # 80002828 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    800061d0:	0084b703          	ld	a4,8(s1)
    800061d4:	0104a783          	lw	a5,16(s1)
    800061d8:	00279693          	slli	a3,a5,0x2
    800061dc:	00d70733          	add	a4,a4,a3
    800061e0:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    800061e4:	0017879b          	addiw	a5,a5,1
    800061e8:	0004a703          	lw	a4,0(s1)
    800061ec:	02e7e7bb          	remw	a5,a5,a4
    800061f0:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    800061f4:	0284b503          	ld	a0,40(s1)
    800061f8:	ffffc097          	auipc	ra,0xffffc
    800061fc:	65c080e7          	jalr	1628(ra) # 80002854 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80006200:	0184b503          	ld	a0,24(s1)
    80006204:	ffffc097          	auipc	ra,0xffffc
    80006208:	650080e7          	jalr	1616(ra) # 80002854 <_ZN9Semaphore6signalEv>

    return ret;
}
    8000620c:	00090513          	mv	a0,s2
    80006210:	01813083          	ld	ra,24(sp)
    80006214:	01013403          	ld	s0,16(sp)
    80006218:	00813483          	ld	s1,8(sp)
    8000621c:	00013903          	ld	s2,0(sp)
    80006220:	02010113          	addi	sp,sp,32
    80006224:	00008067          	ret

0000000080006228 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80006228:	fe010113          	addi	sp,sp,-32
    8000622c:	00113c23          	sd	ra,24(sp)
    80006230:	00813823          	sd	s0,16(sp)
    80006234:	00913423          	sd	s1,8(sp)
    80006238:	01213023          	sd	s2,0(sp)
    8000623c:	02010413          	addi	s0,sp,32
    80006240:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80006244:	02853503          	ld	a0,40(a0)
    80006248:	ffffc097          	auipc	ra,0xffffc
    8000624c:	5e0080e7          	jalr	1504(ra) # 80002828 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80006250:	0304b503          	ld	a0,48(s1)
    80006254:	ffffc097          	auipc	ra,0xffffc
    80006258:	5d4080e7          	jalr	1492(ra) # 80002828 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    8000625c:	0144a783          	lw	a5,20(s1)
    80006260:	0104a903          	lw	s2,16(s1)
    80006264:	0327ce63          	blt	a5,s2,800062a0 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80006268:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    8000626c:	0304b503          	ld	a0,48(s1)
    80006270:	ffffc097          	auipc	ra,0xffffc
    80006274:	5e4080e7          	jalr	1508(ra) # 80002854 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80006278:	0284b503          	ld	a0,40(s1)
    8000627c:	ffffc097          	auipc	ra,0xffffc
    80006280:	5d8080e7          	jalr	1496(ra) # 80002854 <_ZN9Semaphore6signalEv>

    return ret;
}
    80006284:	00090513          	mv	a0,s2
    80006288:	01813083          	ld	ra,24(sp)
    8000628c:	01013403          	ld	s0,16(sp)
    80006290:	00813483          	ld	s1,8(sp)
    80006294:	00013903          	ld	s2,0(sp)
    80006298:	02010113          	addi	sp,sp,32
    8000629c:	00008067          	ret
        ret = cap - head + tail;
    800062a0:	0004a703          	lw	a4,0(s1)
    800062a4:	4127093b          	subw	s2,a4,s2
    800062a8:	00f9093b          	addw	s2,s2,a5
    800062ac:	fc1ff06f          	j	8000626c <_ZN9BufferCPP6getCntEv+0x44>

00000000800062b0 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    800062b0:	fe010113          	addi	sp,sp,-32
    800062b4:	00113c23          	sd	ra,24(sp)
    800062b8:	00813823          	sd	s0,16(sp)
    800062bc:	00913423          	sd	s1,8(sp)
    800062c0:	02010413          	addi	s0,sp,32
    800062c4:	00050493          	mv	s1,a0
    Console::putc('\n');
    800062c8:	00a00513          	li	a0,10
    800062cc:	ffffc097          	auipc	ra,0xffffc
    800062d0:	650080e7          	jalr	1616(ra) # 8000291c <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    800062d4:	00003517          	auipc	a0,0x3
    800062d8:	15450513          	addi	a0,a0,340 # 80009428 <_ZZ9kPrintIntmE6digits+0x3b8>
    800062dc:	00000097          	auipc	ra,0x0
    800062e0:	a0c080e7          	jalr	-1524(ra) # 80005ce8 <_Z11printStringPKc>
    while (getCnt()) {
    800062e4:	00048513          	mv	a0,s1
    800062e8:	00000097          	auipc	ra,0x0
    800062ec:	f40080e7          	jalr	-192(ra) # 80006228 <_ZN9BufferCPP6getCntEv>
    800062f0:	02050c63          	beqz	a0,80006328 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    800062f4:	0084b783          	ld	a5,8(s1)
    800062f8:	0104a703          	lw	a4,16(s1)
    800062fc:	00271713          	slli	a4,a4,0x2
    80006300:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80006304:	0007c503          	lbu	a0,0(a5)
    80006308:	ffffc097          	auipc	ra,0xffffc
    8000630c:	614080e7          	jalr	1556(ra) # 8000291c <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80006310:	0104a783          	lw	a5,16(s1)
    80006314:	0017879b          	addiw	a5,a5,1
    80006318:	0004a703          	lw	a4,0(s1)
    8000631c:	02e7e7bb          	remw	a5,a5,a4
    80006320:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80006324:	fc1ff06f          	j	800062e4 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80006328:	02100513          	li	a0,33
    8000632c:	ffffc097          	auipc	ra,0xffffc
    80006330:	5f0080e7          	jalr	1520(ra) # 8000291c <_ZN7Console4putcEc>
    Console::putc('\n');
    80006334:	00a00513          	li	a0,10
    80006338:	ffffc097          	auipc	ra,0xffffc
    8000633c:	5e4080e7          	jalr	1508(ra) # 8000291c <_ZN7Console4putcEc>
    mem_free(buffer);
    80006340:	0084b503          	ld	a0,8(s1)
    80006344:	ffffb097          	auipc	ra,0xffffb
    80006348:	00c080e7          	jalr	12(ra) # 80001350 <_Z8mem_freePv>
    delete itemAvailable;
    8000634c:	0204b503          	ld	a0,32(s1)
    80006350:	00050863          	beqz	a0,80006360 <_ZN9BufferCPPD1Ev+0xb0>
    80006354:	00053783          	ld	a5,0(a0)
    80006358:	0087b783          	ld	a5,8(a5)
    8000635c:	000780e7          	jalr	a5
    delete spaceAvailable;
    80006360:	0184b503          	ld	a0,24(s1)
    80006364:	00050863          	beqz	a0,80006374 <_ZN9BufferCPPD1Ev+0xc4>
    80006368:	00053783          	ld	a5,0(a0)
    8000636c:	0087b783          	ld	a5,8(a5)
    80006370:	000780e7          	jalr	a5
    delete mutexTail;
    80006374:	0304b503          	ld	a0,48(s1)
    80006378:	00050863          	beqz	a0,80006388 <_ZN9BufferCPPD1Ev+0xd8>
    8000637c:	00053783          	ld	a5,0(a0)
    80006380:	0087b783          	ld	a5,8(a5)
    80006384:	000780e7          	jalr	a5
    delete mutexHead;
    80006388:	0284b503          	ld	a0,40(s1)
    8000638c:	00050863          	beqz	a0,8000639c <_ZN9BufferCPPD1Ev+0xec>
    80006390:	00053783          	ld	a5,0(a0)
    80006394:	0087b783          	ld	a5,8(a5)
    80006398:	000780e7          	jalr	a5
}
    8000639c:	01813083          	ld	ra,24(sp)
    800063a0:	01013403          	ld	s0,16(sp)
    800063a4:	00813483          	ld	s1,8(sp)
    800063a8:	02010113          	addi	sp,sp,32
    800063ac:	00008067          	ret

00000000800063b0 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    800063b0:	fe010113          	addi	sp,sp,-32
    800063b4:	00113c23          	sd	ra,24(sp)
    800063b8:	00813823          	sd	s0,16(sp)
    800063bc:	00913423          	sd	s1,8(sp)
    800063c0:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    800063c4:	00003517          	auipc	a0,0x3
    800063c8:	07c50513          	addi	a0,a0,124 # 80009440 <_ZZ9kPrintIntmE6digits+0x3d0>
    800063cc:	00000097          	auipc	ra,0x0
    800063d0:	91c080e7          	jalr	-1764(ra) # 80005ce8 <_Z11printStringPKc>
    int test = getc() - '0';
    800063d4:	ffffb097          	auipc	ra,0xffffb
    800063d8:	194080e7          	jalr	404(ra) # 80001568 <_Z4getcv>
    800063dc:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    800063e0:	ffffb097          	auipc	ra,0xffffb
    800063e4:	188080e7          	jalr	392(ra) # 80001568 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    800063e8:	00700793          	li	a5,7
    800063ec:	1097e263          	bltu	a5,s1,800064f0 <_Z8userMainv+0x140>
    800063f0:	00249493          	slli	s1,s1,0x2
    800063f4:	00003717          	auipc	a4,0x3
    800063f8:	2a470713          	addi	a4,a4,676 # 80009698 <_ZZ9kPrintIntmE6digits+0x628>
    800063fc:	00e484b3          	add	s1,s1,a4
    80006400:	0004a783          	lw	a5,0(s1)
    80006404:	00e787b3          	add	a5,a5,a4
    80006408:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    8000640c:	fffff097          	auipc	ra,0xfffff
    80006410:	f54080e7          	jalr	-172(ra) # 80005360 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80006414:	00003517          	auipc	a0,0x3
    80006418:	04c50513          	addi	a0,a0,76 # 80009460 <_ZZ9kPrintIntmE6digits+0x3f0>
    8000641c:	00000097          	auipc	ra,0x0
    80006420:	8cc080e7          	jalr	-1844(ra) # 80005ce8 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80006424:	01813083          	ld	ra,24(sp)
    80006428:	01013403          	ld	s0,16(sp)
    8000642c:	00813483          	ld	s1,8(sp)
    80006430:	02010113          	addi	sp,sp,32
    80006434:	00008067          	ret
            Threads_CPP_API_test();
    80006438:	ffffe097          	auipc	ra,0xffffe
    8000643c:	e08080e7          	jalr	-504(ra) # 80004240 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80006440:	00003517          	auipc	a0,0x3
    80006444:	06050513          	addi	a0,a0,96 # 800094a0 <_ZZ9kPrintIntmE6digits+0x430>
    80006448:	00000097          	auipc	ra,0x0
    8000644c:	8a0080e7          	jalr	-1888(ra) # 80005ce8 <_Z11printStringPKc>
            break;
    80006450:	fd5ff06f          	j	80006424 <_Z8userMainv+0x74>
            producerConsumer_C_API();
    80006454:	ffffd097          	auipc	ra,0xffffd
    80006458:	640080e7          	jalr	1600(ra) # 80003a94 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    8000645c:	00003517          	auipc	a0,0x3
    80006460:	08450513          	addi	a0,a0,132 # 800094e0 <_ZZ9kPrintIntmE6digits+0x470>
    80006464:	00000097          	auipc	ra,0x0
    80006468:	884080e7          	jalr	-1916(ra) # 80005ce8 <_Z11printStringPKc>
            break;
    8000646c:	fb9ff06f          	j	80006424 <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    80006470:	fffff097          	auipc	ra,0xfffff
    80006474:	234080e7          	jalr	564(ra) # 800056a4 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80006478:	00003517          	auipc	a0,0x3
    8000647c:	0b850513          	addi	a0,a0,184 # 80009530 <_ZZ9kPrintIntmE6digits+0x4c0>
    80006480:	00000097          	auipc	ra,0x0
    80006484:	868080e7          	jalr	-1944(ra) # 80005ce8 <_Z11printStringPKc>
            break;
    80006488:	f9dff06f          	j	80006424 <_Z8userMainv+0x74>
            testSleeping();
    8000648c:	00000097          	auipc	ra,0x0
    80006490:	11c080e7          	jalr	284(ra) # 800065a8 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    80006494:	00003517          	auipc	a0,0x3
    80006498:	0f450513          	addi	a0,a0,244 # 80009588 <_ZZ9kPrintIntmE6digits+0x518>
    8000649c:	00000097          	auipc	ra,0x0
    800064a0:	84c080e7          	jalr	-1972(ra) # 80005ce8 <_Z11printStringPKc>
            break;
    800064a4:	f81ff06f          	j	80006424 <_Z8userMainv+0x74>
            testConsumerProducer();
    800064a8:	ffffe097          	auipc	ra,0xffffe
    800064ac:	258080e7          	jalr	600(ra) # 80004700 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    800064b0:	00003517          	auipc	a0,0x3
    800064b4:	10850513          	addi	a0,a0,264 # 800095b8 <_ZZ9kPrintIntmE6digits+0x548>
    800064b8:	00000097          	auipc	ra,0x0
    800064bc:	830080e7          	jalr	-2000(ra) # 80005ce8 <_Z11printStringPKc>
            break;
    800064c0:	f65ff06f          	j	80006424 <_Z8userMainv+0x74>
            System_Mode_test();
    800064c4:	00000097          	auipc	ra,0x0
    800064c8:	658080e7          	jalr	1624(ra) # 80006b1c <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    800064cc:	00003517          	auipc	a0,0x3
    800064d0:	12c50513          	addi	a0,a0,300 # 800095f8 <_ZZ9kPrintIntmE6digits+0x588>
    800064d4:	00000097          	auipc	ra,0x0
    800064d8:	814080e7          	jalr	-2028(ra) # 80005ce8 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    800064dc:	00003517          	auipc	a0,0x3
    800064e0:	13c50513          	addi	a0,a0,316 # 80009618 <_ZZ9kPrintIntmE6digits+0x5a8>
    800064e4:	00000097          	auipc	ra,0x0
    800064e8:	804080e7          	jalr	-2044(ra) # 80005ce8 <_Z11printStringPKc>
            break;
    800064ec:	f39ff06f          	j	80006424 <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    800064f0:	00003517          	auipc	a0,0x3
    800064f4:	18050513          	addi	a0,a0,384 # 80009670 <_ZZ9kPrintIntmE6digits+0x600>
    800064f8:	fffff097          	auipc	ra,0xfffff
    800064fc:	7f0080e7          	jalr	2032(ra) # 80005ce8 <_Z11printStringPKc>
    80006500:	f25ff06f          	j	80006424 <_Z8userMainv+0x74>

0000000080006504 <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    80006504:	fe010113          	addi	sp,sp,-32
    80006508:	00113c23          	sd	ra,24(sp)
    8000650c:	00813823          	sd	s0,16(sp)
    80006510:	00913423          	sd	s1,8(sp)
    80006514:	01213023          	sd	s2,0(sp)
    80006518:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    8000651c:	00053903          	ld	s2,0(a0)
    int i = 6;
    80006520:	00600493          	li	s1,6
    while (--i > 0) {
    80006524:	fff4849b          	addiw	s1,s1,-1
    80006528:	04905463          	blez	s1,80006570 <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    8000652c:	00003517          	auipc	a0,0x3
    80006530:	18c50513          	addi	a0,a0,396 # 800096b8 <_ZZ9kPrintIntmE6digits+0x648>
    80006534:	fffff097          	auipc	ra,0xfffff
    80006538:	7b4080e7          	jalr	1972(ra) # 80005ce8 <_Z11printStringPKc>
        printInt(sleep_time);
    8000653c:	00000613          	li	a2,0
    80006540:	00a00593          	li	a1,10
    80006544:	0009051b          	sext.w	a0,s2
    80006548:	00000097          	auipc	ra,0x0
    8000654c:	950080e7          	jalr	-1712(ra) # 80005e98 <_Z8printIntiii>
        printString(" !\n");
    80006550:	00003517          	auipc	a0,0x3
    80006554:	17050513          	addi	a0,a0,368 # 800096c0 <_ZZ9kPrintIntmE6digits+0x650>
    80006558:	fffff097          	auipc	ra,0xfffff
    8000655c:	790080e7          	jalr	1936(ra) # 80005ce8 <_Z11printStringPKc>
        time_sleep(sleep_time);
    80006560:	00090513          	mv	a0,s2
    80006564:	ffffb097          	auipc	ra,0xffffb
    80006568:	f0c080e7          	jalr	-244(ra) # 80001470 <_Z10time_sleepm>
    while (--i > 0) {
    8000656c:	fb9ff06f          	j	80006524 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    80006570:	00a00793          	li	a5,10
    80006574:	02f95933          	divu	s2,s2,a5
    80006578:	fff90913          	addi	s2,s2,-1
    8000657c:	00005797          	auipc	a5,0x5
    80006580:	71c78793          	addi	a5,a5,1820 # 8000bc98 <_ZL8finished>
    80006584:	01278933          	add	s2,a5,s2
    80006588:	00100793          	li	a5,1
    8000658c:	00f90023          	sb	a5,0(s2)
}
    80006590:	01813083          	ld	ra,24(sp)
    80006594:	01013403          	ld	s0,16(sp)
    80006598:	00813483          	ld	s1,8(sp)
    8000659c:	00013903          	ld	s2,0(sp)
    800065a0:	02010113          	addi	sp,sp,32
    800065a4:	00008067          	ret

00000000800065a8 <_Z12testSleepingv>:

void testSleeping() {
    800065a8:	fc010113          	addi	sp,sp,-64
    800065ac:	02113c23          	sd	ra,56(sp)
    800065b0:	02813823          	sd	s0,48(sp)
    800065b4:	02913423          	sd	s1,40(sp)
    800065b8:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    800065bc:	00a00793          	li	a5,10
    800065c0:	fcf43823          	sd	a5,-48(s0)
    800065c4:	01400793          	li	a5,20
    800065c8:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    800065cc:	00000493          	li	s1,0
    800065d0:	02c0006f          	j	800065fc <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    800065d4:	00349793          	slli	a5,s1,0x3
    800065d8:	fd040613          	addi	a2,s0,-48
    800065dc:	00f60633          	add	a2,a2,a5
    800065e0:	00000597          	auipc	a1,0x0
    800065e4:	f2458593          	addi	a1,a1,-220 # 80006504 <_ZL9sleepyRunPv>
    800065e8:	fc040513          	addi	a0,s0,-64
    800065ec:	00f50533          	add	a0,a0,a5
    800065f0:	ffffb097          	auipc	ra,0xffffb
    800065f4:	d90080e7          	jalr	-624(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    800065f8:	0014849b          	addiw	s1,s1,1
    800065fc:	00100793          	li	a5,1
    80006600:	fc97dae3          	bge	a5,s1,800065d4 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    80006604:	00005797          	auipc	a5,0x5
    80006608:	6947c783          	lbu	a5,1684(a5) # 8000bc98 <_ZL8finished>
    8000660c:	fe078ce3          	beqz	a5,80006604 <_Z12testSleepingv+0x5c>
    80006610:	00005797          	auipc	a5,0x5
    80006614:	6897c783          	lbu	a5,1673(a5) # 8000bc99 <_ZL8finished+0x1>
    80006618:	fe0786e3          	beqz	a5,80006604 <_Z12testSleepingv+0x5c>
}
    8000661c:	03813083          	ld	ra,56(sp)
    80006620:	03013403          	ld	s0,48(sp)
    80006624:	02813483          	ld	s1,40(sp)
    80006628:	04010113          	addi	sp,sp,64
    8000662c:	00008067          	ret

0000000080006630 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80006630:	fe010113          	addi	sp,sp,-32
    80006634:	00113c23          	sd	ra,24(sp)
    80006638:	00813823          	sd	s0,16(sp)
    8000663c:	00913423          	sd	s1,8(sp)
    80006640:	01213023          	sd	s2,0(sp)
    80006644:	02010413          	addi	s0,sp,32
    80006648:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    8000664c:	00100793          	li	a5,1
    80006650:	02a7f863          	bgeu	a5,a0,80006680 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80006654:	00a00793          	li	a5,10
    80006658:	02f577b3          	remu	a5,a0,a5
    8000665c:	02078e63          	beqz	a5,80006698 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80006660:	fff48513          	addi	a0,s1,-1
    80006664:	00000097          	auipc	ra,0x0
    80006668:	fcc080e7          	jalr	-52(ra) # 80006630 <_ZL9fibonaccim>
    8000666c:	00050913          	mv	s2,a0
    80006670:	ffe48513          	addi	a0,s1,-2
    80006674:	00000097          	auipc	ra,0x0
    80006678:	fbc080e7          	jalr	-68(ra) # 80006630 <_ZL9fibonaccim>
    8000667c:	00a90533          	add	a0,s2,a0
}
    80006680:	01813083          	ld	ra,24(sp)
    80006684:	01013403          	ld	s0,16(sp)
    80006688:	00813483          	ld	s1,8(sp)
    8000668c:	00013903          	ld	s2,0(sp)
    80006690:	02010113          	addi	sp,sp,32
    80006694:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80006698:	ffffb097          	auipc	ra,0xffffb
    8000669c:	d90080e7          	jalr	-624(ra) # 80001428 <_Z15thread_dispatchv>
    800066a0:	fc1ff06f          	j	80006660 <_ZL9fibonaccim+0x30>

00000000800066a4 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    800066a4:	fe010113          	addi	sp,sp,-32
    800066a8:	00113c23          	sd	ra,24(sp)
    800066ac:	00813823          	sd	s0,16(sp)
    800066b0:	00913423          	sd	s1,8(sp)
    800066b4:	01213023          	sd	s2,0(sp)
    800066b8:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800066bc:	00a00493          	li	s1,10
    800066c0:	0400006f          	j	80006700 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800066c4:	00003517          	auipc	a0,0x3
    800066c8:	ccc50513          	addi	a0,a0,-820 # 80009390 <_ZZ9kPrintIntmE6digits+0x320>
    800066cc:	fffff097          	auipc	ra,0xfffff
    800066d0:	61c080e7          	jalr	1564(ra) # 80005ce8 <_Z11printStringPKc>
    800066d4:	00000613          	li	a2,0
    800066d8:	00a00593          	li	a1,10
    800066dc:	00048513          	mv	a0,s1
    800066e0:	fffff097          	auipc	ra,0xfffff
    800066e4:	7b8080e7          	jalr	1976(ra) # 80005e98 <_Z8printIntiii>
    800066e8:	00003517          	auipc	a0,0x3
    800066ec:	e9850513          	addi	a0,a0,-360 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    800066f0:	fffff097          	auipc	ra,0xfffff
    800066f4:	5f8080e7          	jalr	1528(ra) # 80005ce8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800066f8:	0014849b          	addiw	s1,s1,1
    800066fc:	0ff4f493          	andi	s1,s1,255
    80006700:	00c00793          	li	a5,12
    80006704:	fc97f0e3          	bgeu	a5,s1,800066c4 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80006708:	00003517          	auipc	a0,0x3
    8000670c:	c9050513          	addi	a0,a0,-880 # 80009398 <_ZZ9kPrintIntmE6digits+0x328>
    80006710:	fffff097          	auipc	ra,0xfffff
    80006714:	5d8080e7          	jalr	1496(ra) # 80005ce8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80006718:	00500313          	li	t1,5
    thread_dispatch();
    8000671c:	ffffb097          	auipc	ra,0xffffb
    80006720:	d0c080e7          	jalr	-756(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80006724:	01000513          	li	a0,16
    80006728:	00000097          	auipc	ra,0x0
    8000672c:	f08080e7          	jalr	-248(ra) # 80006630 <_ZL9fibonaccim>
    80006730:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80006734:	00003517          	auipc	a0,0x3
    80006738:	c7450513          	addi	a0,a0,-908 # 800093a8 <_ZZ9kPrintIntmE6digits+0x338>
    8000673c:	fffff097          	auipc	ra,0xfffff
    80006740:	5ac080e7          	jalr	1452(ra) # 80005ce8 <_Z11printStringPKc>
    80006744:	00000613          	li	a2,0
    80006748:	00a00593          	li	a1,10
    8000674c:	0009051b          	sext.w	a0,s2
    80006750:	fffff097          	auipc	ra,0xfffff
    80006754:	748080e7          	jalr	1864(ra) # 80005e98 <_Z8printIntiii>
    80006758:	00003517          	auipc	a0,0x3
    8000675c:	e2850513          	addi	a0,a0,-472 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80006760:	fffff097          	auipc	ra,0xfffff
    80006764:	588080e7          	jalr	1416(ra) # 80005ce8 <_Z11printStringPKc>
    80006768:	0400006f          	j	800067a8 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000676c:	00003517          	auipc	a0,0x3
    80006770:	c2450513          	addi	a0,a0,-988 # 80009390 <_ZZ9kPrintIntmE6digits+0x320>
    80006774:	fffff097          	auipc	ra,0xfffff
    80006778:	574080e7          	jalr	1396(ra) # 80005ce8 <_Z11printStringPKc>
    8000677c:	00000613          	li	a2,0
    80006780:	00a00593          	li	a1,10
    80006784:	00048513          	mv	a0,s1
    80006788:	fffff097          	auipc	ra,0xfffff
    8000678c:	710080e7          	jalr	1808(ra) # 80005e98 <_Z8printIntiii>
    80006790:	00003517          	auipc	a0,0x3
    80006794:	df050513          	addi	a0,a0,-528 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80006798:	fffff097          	auipc	ra,0xfffff
    8000679c:	550080e7          	jalr	1360(ra) # 80005ce8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    800067a0:	0014849b          	addiw	s1,s1,1
    800067a4:	0ff4f493          	andi	s1,s1,255
    800067a8:	00f00793          	li	a5,15
    800067ac:	fc97f0e3          	bgeu	a5,s1,8000676c <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    800067b0:	00003517          	auipc	a0,0x3
    800067b4:	c0850513          	addi	a0,a0,-1016 # 800093b8 <_ZZ9kPrintIntmE6digits+0x348>
    800067b8:	fffff097          	auipc	ra,0xfffff
    800067bc:	530080e7          	jalr	1328(ra) # 80005ce8 <_Z11printStringPKc>
    finishedD = true;
    800067c0:	00100793          	li	a5,1
    800067c4:	00005717          	auipc	a4,0x5
    800067c8:	4cf70b23          	sb	a5,1238(a4) # 8000bc9a <_ZL9finishedD>
    thread_dispatch();
    800067cc:	ffffb097          	auipc	ra,0xffffb
    800067d0:	c5c080e7          	jalr	-932(ra) # 80001428 <_Z15thread_dispatchv>
}
    800067d4:	01813083          	ld	ra,24(sp)
    800067d8:	01013403          	ld	s0,16(sp)
    800067dc:	00813483          	ld	s1,8(sp)
    800067e0:	00013903          	ld	s2,0(sp)
    800067e4:	02010113          	addi	sp,sp,32
    800067e8:	00008067          	ret

00000000800067ec <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800067ec:	fe010113          	addi	sp,sp,-32
    800067f0:	00113c23          	sd	ra,24(sp)
    800067f4:	00813823          	sd	s0,16(sp)
    800067f8:	00913423          	sd	s1,8(sp)
    800067fc:	01213023          	sd	s2,0(sp)
    80006800:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80006804:	00000493          	li	s1,0
    80006808:	0400006f          	j	80006848 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    8000680c:	00003517          	auipc	a0,0x3
    80006810:	b4450513          	addi	a0,a0,-1212 # 80009350 <_ZZ9kPrintIntmE6digits+0x2e0>
    80006814:	fffff097          	auipc	ra,0xfffff
    80006818:	4d4080e7          	jalr	1236(ra) # 80005ce8 <_Z11printStringPKc>
    8000681c:	00000613          	li	a2,0
    80006820:	00a00593          	li	a1,10
    80006824:	00048513          	mv	a0,s1
    80006828:	fffff097          	auipc	ra,0xfffff
    8000682c:	670080e7          	jalr	1648(ra) # 80005e98 <_Z8printIntiii>
    80006830:	00003517          	auipc	a0,0x3
    80006834:	d5050513          	addi	a0,a0,-688 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80006838:	fffff097          	auipc	ra,0xfffff
    8000683c:	4b0080e7          	jalr	1200(ra) # 80005ce8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80006840:	0014849b          	addiw	s1,s1,1
    80006844:	0ff4f493          	andi	s1,s1,255
    80006848:	00200793          	li	a5,2
    8000684c:	fc97f0e3          	bgeu	a5,s1,8000680c <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80006850:	00003517          	auipc	a0,0x3
    80006854:	b0850513          	addi	a0,a0,-1272 # 80009358 <_ZZ9kPrintIntmE6digits+0x2e8>
    80006858:	fffff097          	auipc	ra,0xfffff
    8000685c:	490080e7          	jalr	1168(ra) # 80005ce8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80006860:	00700313          	li	t1,7
    thread_dispatch();
    80006864:	ffffb097          	auipc	ra,0xffffb
    80006868:	bc4080e7          	jalr	-1084(ra) # 80001428 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    8000686c:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80006870:	00003517          	auipc	a0,0x3
    80006874:	af850513          	addi	a0,a0,-1288 # 80009368 <_ZZ9kPrintIntmE6digits+0x2f8>
    80006878:	fffff097          	auipc	ra,0xfffff
    8000687c:	470080e7          	jalr	1136(ra) # 80005ce8 <_Z11printStringPKc>
    80006880:	00000613          	li	a2,0
    80006884:	00a00593          	li	a1,10
    80006888:	0009051b          	sext.w	a0,s2
    8000688c:	fffff097          	auipc	ra,0xfffff
    80006890:	60c080e7          	jalr	1548(ra) # 80005e98 <_Z8printIntiii>
    80006894:	00003517          	auipc	a0,0x3
    80006898:	cec50513          	addi	a0,a0,-788 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    8000689c:	fffff097          	auipc	ra,0xfffff
    800068a0:	44c080e7          	jalr	1100(ra) # 80005ce8 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    800068a4:	00c00513          	li	a0,12
    800068a8:	00000097          	auipc	ra,0x0
    800068ac:	d88080e7          	jalr	-632(ra) # 80006630 <_ZL9fibonaccim>
    800068b0:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800068b4:	00003517          	auipc	a0,0x3
    800068b8:	abc50513          	addi	a0,a0,-1348 # 80009370 <_ZZ9kPrintIntmE6digits+0x300>
    800068bc:	fffff097          	auipc	ra,0xfffff
    800068c0:	42c080e7          	jalr	1068(ra) # 80005ce8 <_Z11printStringPKc>
    800068c4:	00000613          	li	a2,0
    800068c8:	00a00593          	li	a1,10
    800068cc:	0009051b          	sext.w	a0,s2
    800068d0:	fffff097          	auipc	ra,0xfffff
    800068d4:	5c8080e7          	jalr	1480(ra) # 80005e98 <_Z8printIntiii>
    800068d8:	00003517          	auipc	a0,0x3
    800068dc:	ca850513          	addi	a0,a0,-856 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    800068e0:	fffff097          	auipc	ra,0xfffff
    800068e4:	408080e7          	jalr	1032(ra) # 80005ce8 <_Z11printStringPKc>
    800068e8:	0400006f          	j	80006928 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800068ec:	00003517          	auipc	a0,0x3
    800068f0:	a6450513          	addi	a0,a0,-1436 # 80009350 <_ZZ9kPrintIntmE6digits+0x2e0>
    800068f4:	fffff097          	auipc	ra,0xfffff
    800068f8:	3f4080e7          	jalr	1012(ra) # 80005ce8 <_Z11printStringPKc>
    800068fc:	00000613          	li	a2,0
    80006900:	00a00593          	li	a1,10
    80006904:	00048513          	mv	a0,s1
    80006908:	fffff097          	auipc	ra,0xfffff
    8000690c:	590080e7          	jalr	1424(ra) # 80005e98 <_Z8printIntiii>
    80006910:	00003517          	auipc	a0,0x3
    80006914:	c7050513          	addi	a0,a0,-912 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80006918:	fffff097          	auipc	ra,0xfffff
    8000691c:	3d0080e7          	jalr	976(ra) # 80005ce8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80006920:	0014849b          	addiw	s1,s1,1
    80006924:	0ff4f493          	andi	s1,s1,255
    80006928:	00500793          	li	a5,5
    8000692c:	fc97f0e3          	bgeu	a5,s1,800068ec <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80006930:	00003517          	auipc	a0,0x3
    80006934:	9f850513          	addi	a0,a0,-1544 # 80009328 <_ZZ9kPrintIntmE6digits+0x2b8>
    80006938:	fffff097          	auipc	ra,0xfffff
    8000693c:	3b0080e7          	jalr	944(ra) # 80005ce8 <_Z11printStringPKc>
    finishedC = true;
    80006940:	00100793          	li	a5,1
    80006944:	00005717          	auipc	a4,0x5
    80006948:	34f70ba3          	sb	a5,855(a4) # 8000bc9b <_ZL9finishedC>
    thread_dispatch();
    8000694c:	ffffb097          	auipc	ra,0xffffb
    80006950:	adc080e7          	jalr	-1316(ra) # 80001428 <_Z15thread_dispatchv>
}
    80006954:	01813083          	ld	ra,24(sp)
    80006958:	01013403          	ld	s0,16(sp)
    8000695c:	00813483          	ld	s1,8(sp)
    80006960:	00013903          	ld	s2,0(sp)
    80006964:	02010113          	addi	sp,sp,32
    80006968:	00008067          	ret

000000008000696c <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    8000696c:	fe010113          	addi	sp,sp,-32
    80006970:	00113c23          	sd	ra,24(sp)
    80006974:	00813823          	sd	s0,16(sp)
    80006978:	00913423          	sd	s1,8(sp)
    8000697c:	01213023          	sd	s2,0(sp)
    80006980:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006984:	00000913          	li	s2,0
    80006988:	0400006f          	j	800069c8 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    8000698c:	ffffb097          	auipc	ra,0xffffb
    80006990:	a9c080e7          	jalr	-1380(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006994:	00148493          	addi	s1,s1,1
    80006998:	000027b7          	lui	a5,0x2
    8000699c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800069a0:	0097ee63          	bltu	a5,s1,800069bc <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800069a4:	00000713          	li	a4,0
    800069a8:	000077b7          	lui	a5,0x7
    800069ac:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800069b0:	fce7eee3          	bltu	a5,a4,8000698c <_ZL11workerBodyBPv+0x20>
    800069b4:	00170713          	addi	a4,a4,1
    800069b8:	ff1ff06f          	j	800069a8 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    800069bc:	00a00793          	li	a5,10
    800069c0:	04f90663          	beq	s2,a5,80006a0c <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    800069c4:	00190913          	addi	s2,s2,1
    800069c8:	00f00793          	li	a5,15
    800069cc:	0527e463          	bltu	a5,s2,80006a14 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    800069d0:	00003517          	auipc	a0,0x3
    800069d4:	96850513          	addi	a0,a0,-1688 # 80009338 <_ZZ9kPrintIntmE6digits+0x2c8>
    800069d8:	fffff097          	auipc	ra,0xfffff
    800069dc:	310080e7          	jalr	784(ra) # 80005ce8 <_Z11printStringPKc>
    800069e0:	00000613          	li	a2,0
    800069e4:	00a00593          	li	a1,10
    800069e8:	0009051b          	sext.w	a0,s2
    800069ec:	fffff097          	auipc	ra,0xfffff
    800069f0:	4ac080e7          	jalr	1196(ra) # 80005e98 <_Z8printIntiii>
    800069f4:	00003517          	auipc	a0,0x3
    800069f8:	b8c50513          	addi	a0,a0,-1140 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    800069fc:	fffff097          	auipc	ra,0xfffff
    80006a00:	2ec080e7          	jalr	748(ra) # 80005ce8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006a04:	00000493          	li	s1,0
    80006a08:	f91ff06f          	j	80006998 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    80006a0c:	14102ff3          	csrr	t6,sepc
    80006a10:	fb5ff06f          	j	800069c4 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    80006a14:	00003517          	auipc	a0,0x3
    80006a18:	92c50513          	addi	a0,a0,-1748 # 80009340 <_ZZ9kPrintIntmE6digits+0x2d0>
    80006a1c:	fffff097          	auipc	ra,0xfffff
    80006a20:	2cc080e7          	jalr	716(ra) # 80005ce8 <_Z11printStringPKc>
    finishedB = true;
    80006a24:	00100793          	li	a5,1
    80006a28:	00005717          	auipc	a4,0x5
    80006a2c:	26f70a23          	sb	a5,628(a4) # 8000bc9c <_ZL9finishedB>
    thread_dispatch();
    80006a30:	ffffb097          	auipc	ra,0xffffb
    80006a34:	9f8080e7          	jalr	-1544(ra) # 80001428 <_Z15thread_dispatchv>
}
    80006a38:	01813083          	ld	ra,24(sp)
    80006a3c:	01013403          	ld	s0,16(sp)
    80006a40:	00813483          	ld	s1,8(sp)
    80006a44:	00013903          	ld	s2,0(sp)
    80006a48:	02010113          	addi	sp,sp,32
    80006a4c:	00008067          	ret

0000000080006a50 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006a50:	fe010113          	addi	sp,sp,-32
    80006a54:	00113c23          	sd	ra,24(sp)
    80006a58:	00813823          	sd	s0,16(sp)
    80006a5c:	00913423          	sd	s1,8(sp)
    80006a60:	01213023          	sd	s2,0(sp)
    80006a64:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006a68:	00000913          	li	s2,0
    80006a6c:	0380006f          	j	80006aa4 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80006a70:	ffffb097          	auipc	ra,0xffffb
    80006a74:	9b8080e7          	jalr	-1608(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006a78:	00148493          	addi	s1,s1,1
    80006a7c:	000027b7          	lui	a5,0x2
    80006a80:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006a84:	0097ee63          	bltu	a5,s1,80006aa0 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006a88:	00000713          	li	a4,0
    80006a8c:	000077b7          	lui	a5,0x7
    80006a90:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006a94:	fce7eee3          	bltu	a5,a4,80006a70 <_ZL11workerBodyAPv+0x20>
    80006a98:	00170713          	addi	a4,a4,1
    80006a9c:	ff1ff06f          	j	80006a8c <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80006aa0:	00190913          	addi	s2,s2,1
    80006aa4:	00900793          	li	a5,9
    80006aa8:	0527e063          	bltu	a5,s2,80006ae8 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80006aac:	00003517          	auipc	a0,0x3
    80006ab0:	87450513          	addi	a0,a0,-1932 # 80009320 <_ZZ9kPrintIntmE6digits+0x2b0>
    80006ab4:	fffff097          	auipc	ra,0xfffff
    80006ab8:	234080e7          	jalr	564(ra) # 80005ce8 <_Z11printStringPKc>
    80006abc:	00000613          	li	a2,0
    80006ac0:	00a00593          	li	a1,10
    80006ac4:	0009051b          	sext.w	a0,s2
    80006ac8:	fffff097          	auipc	ra,0xfffff
    80006acc:	3d0080e7          	jalr	976(ra) # 80005e98 <_Z8printIntiii>
    80006ad0:	00003517          	auipc	a0,0x3
    80006ad4:	ab050513          	addi	a0,a0,-1360 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80006ad8:	fffff097          	auipc	ra,0xfffff
    80006adc:	210080e7          	jalr	528(ra) # 80005ce8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006ae0:	00000493          	li	s1,0
    80006ae4:	f99ff06f          	j	80006a7c <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80006ae8:	00003517          	auipc	a0,0x3
    80006aec:	84050513          	addi	a0,a0,-1984 # 80009328 <_ZZ9kPrintIntmE6digits+0x2b8>
    80006af0:	fffff097          	auipc	ra,0xfffff
    80006af4:	1f8080e7          	jalr	504(ra) # 80005ce8 <_Z11printStringPKc>
    finishedA = true;
    80006af8:	00100793          	li	a5,1
    80006afc:	00005717          	auipc	a4,0x5
    80006b00:	1af700a3          	sb	a5,417(a4) # 8000bc9d <_ZL9finishedA>
}
    80006b04:	01813083          	ld	ra,24(sp)
    80006b08:	01013403          	ld	s0,16(sp)
    80006b0c:	00813483          	ld	s1,8(sp)
    80006b10:	00013903          	ld	s2,0(sp)
    80006b14:	02010113          	addi	sp,sp,32
    80006b18:	00008067          	ret

0000000080006b1c <_Z16System_Mode_testv>:


void System_Mode_test() {
    80006b1c:	fd010113          	addi	sp,sp,-48
    80006b20:	02113423          	sd	ra,40(sp)
    80006b24:	02813023          	sd	s0,32(sp)
    80006b28:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80006b2c:	00000613          	li	a2,0
    80006b30:	00000597          	auipc	a1,0x0
    80006b34:	f2058593          	addi	a1,a1,-224 # 80006a50 <_ZL11workerBodyAPv>
    80006b38:	fd040513          	addi	a0,s0,-48
    80006b3c:	ffffb097          	auipc	ra,0xffffb
    80006b40:	844080e7          	jalr	-1980(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80006b44:	00003517          	auipc	a0,0x3
    80006b48:	88450513          	addi	a0,a0,-1916 # 800093c8 <_ZZ9kPrintIntmE6digits+0x358>
    80006b4c:	fffff097          	auipc	ra,0xfffff
    80006b50:	19c080e7          	jalr	412(ra) # 80005ce8 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80006b54:	00000613          	li	a2,0
    80006b58:	00000597          	auipc	a1,0x0
    80006b5c:	e1458593          	addi	a1,a1,-492 # 8000696c <_ZL11workerBodyBPv>
    80006b60:	fd840513          	addi	a0,s0,-40
    80006b64:	ffffb097          	auipc	ra,0xffffb
    80006b68:	81c080e7          	jalr	-2020(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80006b6c:	00003517          	auipc	a0,0x3
    80006b70:	87450513          	addi	a0,a0,-1932 # 800093e0 <_ZZ9kPrintIntmE6digits+0x370>
    80006b74:	fffff097          	auipc	ra,0xfffff
    80006b78:	174080e7          	jalr	372(ra) # 80005ce8 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80006b7c:	00000613          	li	a2,0
    80006b80:	00000597          	auipc	a1,0x0
    80006b84:	c6c58593          	addi	a1,a1,-916 # 800067ec <_ZL11workerBodyCPv>
    80006b88:	fe040513          	addi	a0,s0,-32
    80006b8c:	ffffa097          	auipc	ra,0xffffa
    80006b90:	7f4080e7          	jalr	2036(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80006b94:	00003517          	auipc	a0,0x3
    80006b98:	86450513          	addi	a0,a0,-1948 # 800093f8 <_ZZ9kPrintIntmE6digits+0x388>
    80006b9c:	fffff097          	auipc	ra,0xfffff
    80006ba0:	14c080e7          	jalr	332(ra) # 80005ce8 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80006ba4:	00000613          	li	a2,0
    80006ba8:	00000597          	auipc	a1,0x0
    80006bac:	afc58593          	addi	a1,a1,-1284 # 800066a4 <_ZL11workerBodyDPv>
    80006bb0:	fe840513          	addi	a0,s0,-24
    80006bb4:	ffffa097          	auipc	ra,0xffffa
    80006bb8:	7cc080e7          	jalr	1996(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80006bbc:	00003517          	auipc	a0,0x3
    80006bc0:	85450513          	addi	a0,a0,-1964 # 80009410 <_ZZ9kPrintIntmE6digits+0x3a0>
    80006bc4:	fffff097          	auipc	ra,0xfffff
    80006bc8:	124080e7          	jalr	292(ra) # 80005ce8 <_Z11printStringPKc>
    80006bcc:	00c0006f          	j	80006bd8 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006bd0:	ffffb097          	auipc	ra,0xffffb
    80006bd4:	858080e7          	jalr	-1960(ra) # 80001428 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006bd8:	00005797          	auipc	a5,0x5
    80006bdc:	0c57c783          	lbu	a5,197(a5) # 8000bc9d <_ZL9finishedA>
    80006be0:	fe0788e3          	beqz	a5,80006bd0 <_Z16System_Mode_testv+0xb4>
    80006be4:	00005797          	auipc	a5,0x5
    80006be8:	0b87c783          	lbu	a5,184(a5) # 8000bc9c <_ZL9finishedB>
    80006bec:	fe0782e3          	beqz	a5,80006bd0 <_Z16System_Mode_testv+0xb4>
    80006bf0:	00005797          	auipc	a5,0x5
    80006bf4:	0ab7c783          	lbu	a5,171(a5) # 8000bc9b <_ZL9finishedC>
    80006bf8:	fc078ce3          	beqz	a5,80006bd0 <_Z16System_Mode_testv+0xb4>
    80006bfc:	00005797          	auipc	a5,0x5
    80006c00:	09e7c783          	lbu	a5,158(a5) # 8000bc9a <_ZL9finishedD>
    80006c04:	fc0786e3          	beqz	a5,80006bd0 <_Z16System_Mode_testv+0xb4>
    }

}
    80006c08:	02813083          	ld	ra,40(sp)
    80006c0c:	02013403          	ld	s0,32(sp)
    80006c10:	03010113          	addi	sp,sp,48
    80006c14:	00008067          	ret

0000000080006c18 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006c18:	fe010113          	addi	sp,sp,-32
    80006c1c:	00113c23          	sd	ra,24(sp)
    80006c20:	00813823          	sd	s0,16(sp)
    80006c24:	00913423          	sd	s1,8(sp)
    80006c28:	01213023          	sd	s2,0(sp)
    80006c2c:	02010413          	addi	s0,sp,32
    80006c30:	00050493          	mv	s1,a0
    80006c34:	00058913          	mv	s2,a1
    80006c38:	0015879b          	addiw	a5,a1,1
    80006c3c:	0007851b          	sext.w	a0,a5
    80006c40:	00f4a023          	sw	a5,0(s1)
    80006c44:	0004a823          	sw	zero,16(s1)
    80006c48:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006c4c:	00251513          	slli	a0,a0,0x2
    80006c50:	ffffa097          	auipc	ra,0xffffa
    80006c54:	6c0080e7          	jalr	1728(ra) # 80001310 <_Z9mem_allocm>
    80006c58:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80006c5c:	00000593          	li	a1,0
    80006c60:	02048513          	addi	a0,s1,32
    80006c64:	ffffb097          	auipc	ra,0xffffb
    80006c68:	83c080e7          	jalr	-1988(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&spaceAvailable, _cap);
    80006c6c:	00090593          	mv	a1,s2
    80006c70:	01848513          	addi	a0,s1,24
    80006c74:	ffffb097          	auipc	ra,0xffffb
    80006c78:	82c080e7          	jalr	-2004(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&mutexHead, 1);
    80006c7c:	00100593          	li	a1,1
    80006c80:	02848513          	addi	a0,s1,40
    80006c84:	ffffb097          	auipc	ra,0xffffb
    80006c88:	81c080e7          	jalr	-2020(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&mutexTail, 1);
    80006c8c:	00100593          	li	a1,1
    80006c90:	03048513          	addi	a0,s1,48
    80006c94:	ffffb097          	auipc	ra,0xffffb
    80006c98:	80c080e7          	jalr	-2036(ra) # 800014a0 <_Z8sem_openPP4KSemj>
}
    80006c9c:	01813083          	ld	ra,24(sp)
    80006ca0:	01013403          	ld	s0,16(sp)
    80006ca4:	00813483          	ld	s1,8(sp)
    80006ca8:	00013903          	ld	s2,0(sp)
    80006cac:	02010113          	addi	sp,sp,32
    80006cb0:	00008067          	ret

0000000080006cb4 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80006cb4:	fe010113          	addi	sp,sp,-32
    80006cb8:	00113c23          	sd	ra,24(sp)
    80006cbc:	00813823          	sd	s0,16(sp)
    80006cc0:	00913423          	sd	s1,8(sp)
    80006cc4:	01213023          	sd	s2,0(sp)
    80006cc8:	02010413          	addi	s0,sp,32
    80006ccc:	00050493          	mv	s1,a0
    80006cd0:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80006cd4:	01853503          	ld	a0,24(a0)
    80006cd8:	ffffb097          	auipc	ra,0xffffb
    80006cdc:	830080e7          	jalr	-2000(ra) # 80001508 <_Z8sem_waitP4KSem>

    sem_wait(mutexTail);
    80006ce0:	0304b503          	ld	a0,48(s1)
    80006ce4:	ffffb097          	auipc	ra,0xffffb
    80006ce8:	824080e7          	jalr	-2012(ra) # 80001508 <_Z8sem_waitP4KSem>
    buffer[tail] = val;
    80006cec:	0084b783          	ld	a5,8(s1)
    80006cf0:	0144a703          	lw	a4,20(s1)
    80006cf4:	00271713          	slli	a4,a4,0x2
    80006cf8:	00e787b3          	add	a5,a5,a4
    80006cfc:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006d00:	0144a783          	lw	a5,20(s1)
    80006d04:	0017879b          	addiw	a5,a5,1
    80006d08:	0004a703          	lw	a4,0(s1)
    80006d0c:	02e7e7bb          	remw	a5,a5,a4
    80006d10:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80006d14:	0304b503          	ld	a0,48(s1)
    80006d18:	ffffb097          	auipc	ra,0xffffb
    80006d1c:	820080e7          	jalr	-2016(ra) # 80001538 <_Z10sem_signalP4KSem>

    sem_signal(itemAvailable);
    80006d20:	0204b503          	ld	a0,32(s1)
    80006d24:	ffffb097          	auipc	ra,0xffffb
    80006d28:	814080e7          	jalr	-2028(ra) # 80001538 <_Z10sem_signalP4KSem>

}
    80006d2c:	01813083          	ld	ra,24(sp)
    80006d30:	01013403          	ld	s0,16(sp)
    80006d34:	00813483          	ld	s1,8(sp)
    80006d38:	00013903          	ld	s2,0(sp)
    80006d3c:	02010113          	addi	sp,sp,32
    80006d40:	00008067          	ret

0000000080006d44 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80006d44:	fe010113          	addi	sp,sp,-32
    80006d48:	00113c23          	sd	ra,24(sp)
    80006d4c:	00813823          	sd	s0,16(sp)
    80006d50:	00913423          	sd	s1,8(sp)
    80006d54:	01213023          	sd	s2,0(sp)
    80006d58:	02010413          	addi	s0,sp,32
    80006d5c:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80006d60:	02053503          	ld	a0,32(a0)
    80006d64:	ffffa097          	auipc	ra,0xffffa
    80006d68:	7a4080e7          	jalr	1956(ra) # 80001508 <_Z8sem_waitP4KSem>

    sem_wait(mutexHead);
    80006d6c:	0284b503          	ld	a0,40(s1)
    80006d70:	ffffa097          	auipc	ra,0xffffa
    80006d74:	798080e7          	jalr	1944(ra) # 80001508 <_Z8sem_waitP4KSem>

    int ret = buffer[head];
    80006d78:	0084b703          	ld	a4,8(s1)
    80006d7c:	0104a783          	lw	a5,16(s1)
    80006d80:	00279693          	slli	a3,a5,0x2
    80006d84:	00d70733          	add	a4,a4,a3
    80006d88:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006d8c:	0017879b          	addiw	a5,a5,1
    80006d90:	0004a703          	lw	a4,0(s1)
    80006d94:	02e7e7bb          	remw	a5,a5,a4
    80006d98:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80006d9c:	0284b503          	ld	a0,40(s1)
    80006da0:	ffffa097          	auipc	ra,0xffffa
    80006da4:	798080e7          	jalr	1944(ra) # 80001538 <_Z10sem_signalP4KSem>

    sem_signal(spaceAvailable);
    80006da8:	0184b503          	ld	a0,24(s1)
    80006dac:	ffffa097          	auipc	ra,0xffffa
    80006db0:	78c080e7          	jalr	1932(ra) # 80001538 <_Z10sem_signalP4KSem>

    return ret;
}
    80006db4:	00090513          	mv	a0,s2
    80006db8:	01813083          	ld	ra,24(sp)
    80006dbc:	01013403          	ld	s0,16(sp)
    80006dc0:	00813483          	ld	s1,8(sp)
    80006dc4:	00013903          	ld	s2,0(sp)
    80006dc8:	02010113          	addi	sp,sp,32
    80006dcc:	00008067          	ret

0000000080006dd0 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80006dd0:	fe010113          	addi	sp,sp,-32
    80006dd4:	00113c23          	sd	ra,24(sp)
    80006dd8:	00813823          	sd	s0,16(sp)
    80006ddc:	00913423          	sd	s1,8(sp)
    80006de0:	01213023          	sd	s2,0(sp)
    80006de4:	02010413          	addi	s0,sp,32
    80006de8:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80006dec:	02853503          	ld	a0,40(a0)
    80006df0:	ffffa097          	auipc	ra,0xffffa
    80006df4:	718080e7          	jalr	1816(ra) # 80001508 <_Z8sem_waitP4KSem>
    sem_wait(mutexTail);
    80006df8:	0304b503          	ld	a0,48(s1)
    80006dfc:	ffffa097          	auipc	ra,0xffffa
    80006e00:	70c080e7          	jalr	1804(ra) # 80001508 <_Z8sem_waitP4KSem>

    if (tail >= head) {
    80006e04:	0144a783          	lw	a5,20(s1)
    80006e08:	0104a903          	lw	s2,16(s1)
    80006e0c:	0327ce63          	blt	a5,s2,80006e48 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80006e10:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80006e14:	0304b503          	ld	a0,48(s1)
    80006e18:	ffffa097          	auipc	ra,0xffffa
    80006e1c:	720080e7          	jalr	1824(ra) # 80001538 <_Z10sem_signalP4KSem>
    sem_signal(mutexHead);
    80006e20:	0284b503          	ld	a0,40(s1)
    80006e24:	ffffa097          	auipc	ra,0xffffa
    80006e28:	714080e7          	jalr	1812(ra) # 80001538 <_Z10sem_signalP4KSem>

    return ret;
}
    80006e2c:	00090513          	mv	a0,s2
    80006e30:	01813083          	ld	ra,24(sp)
    80006e34:	01013403          	ld	s0,16(sp)
    80006e38:	00813483          	ld	s1,8(sp)
    80006e3c:	00013903          	ld	s2,0(sp)
    80006e40:	02010113          	addi	sp,sp,32
    80006e44:	00008067          	ret
        ret = cap - head + tail;
    80006e48:	0004a703          	lw	a4,0(s1)
    80006e4c:	4127093b          	subw	s2,a4,s2
    80006e50:	00f9093b          	addw	s2,s2,a5
    80006e54:	fc1ff06f          	j	80006e14 <_ZN6Buffer6getCntEv+0x44>

0000000080006e58 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80006e58:	fe010113          	addi	sp,sp,-32
    80006e5c:	00113c23          	sd	ra,24(sp)
    80006e60:	00813823          	sd	s0,16(sp)
    80006e64:	00913423          	sd	s1,8(sp)
    80006e68:	02010413          	addi	s0,sp,32
    80006e6c:	00050493          	mv	s1,a0
    putc('\n');
    80006e70:	00a00513          	li	a0,10
    80006e74:	ffffa097          	auipc	ra,0xffffa
    80006e78:	71c080e7          	jalr	1820(ra) # 80001590 <_Z4putcc>
    printString("Buffer deleted!\n");
    80006e7c:	00002517          	auipc	a0,0x2
    80006e80:	5ac50513          	addi	a0,a0,1452 # 80009428 <_ZZ9kPrintIntmE6digits+0x3b8>
    80006e84:	fffff097          	auipc	ra,0xfffff
    80006e88:	e64080e7          	jalr	-412(ra) # 80005ce8 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80006e8c:	00048513          	mv	a0,s1
    80006e90:	00000097          	auipc	ra,0x0
    80006e94:	f40080e7          	jalr	-192(ra) # 80006dd0 <_ZN6Buffer6getCntEv>
    80006e98:	02a05c63          	blez	a0,80006ed0 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80006e9c:	0084b783          	ld	a5,8(s1)
    80006ea0:	0104a703          	lw	a4,16(s1)
    80006ea4:	00271713          	slli	a4,a4,0x2
    80006ea8:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80006eac:	0007c503          	lbu	a0,0(a5)
    80006eb0:	ffffa097          	auipc	ra,0xffffa
    80006eb4:	6e0080e7          	jalr	1760(ra) # 80001590 <_Z4putcc>
        head = (head + 1) % cap;
    80006eb8:	0104a783          	lw	a5,16(s1)
    80006ebc:	0017879b          	addiw	a5,a5,1
    80006ec0:	0004a703          	lw	a4,0(s1)
    80006ec4:	02e7e7bb          	remw	a5,a5,a4
    80006ec8:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80006ecc:	fc1ff06f          	j	80006e8c <_ZN6BufferD1Ev+0x34>
    putc('!');
    80006ed0:	02100513          	li	a0,33
    80006ed4:	ffffa097          	auipc	ra,0xffffa
    80006ed8:	6bc080e7          	jalr	1724(ra) # 80001590 <_Z4putcc>
    putc('\n');
    80006edc:	00a00513          	li	a0,10
    80006ee0:	ffffa097          	auipc	ra,0xffffa
    80006ee4:	6b0080e7          	jalr	1712(ra) # 80001590 <_Z4putcc>
    mem_free(buffer);
    80006ee8:	0084b503          	ld	a0,8(s1)
    80006eec:	ffffa097          	auipc	ra,0xffffa
    80006ef0:	464080e7          	jalr	1124(ra) # 80001350 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80006ef4:	0204b503          	ld	a0,32(s1)
    80006ef8:	ffffa097          	auipc	ra,0xffffa
    80006efc:	5e0080e7          	jalr	1504(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(spaceAvailable);
    80006f00:	0184b503          	ld	a0,24(s1)
    80006f04:	ffffa097          	auipc	ra,0xffffa
    80006f08:	5d4080e7          	jalr	1492(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(mutexTail);
    80006f0c:	0304b503          	ld	a0,48(s1)
    80006f10:	ffffa097          	auipc	ra,0xffffa
    80006f14:	5c8080e7          	jalr	1480(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(mutexHead);
    80006f18:	0284b503          	ld	a0,40(s1)
    80006f1c:	ffffa097          	auipc	ra,0xffffa
    80006f20:	5bc080e7          	jalr	1468(ra) # 800014d8 <_Z9sem_closeP4KSem>
}
    80006f24:	01813083          	ld	ra,24(sp)
    80006f28:	01013403          	ld	s0,16(sp)
    80006f2c:	00813483          	ld	s1,8(sp)
    80006f30:	02010113          	addi	sp,sp,32
    80006f34:	00008067          	ret

0000000080006f38 <start>:
    80006f38:	ff010113          	addi	sp,sp,-16
    80006f3c:	00813423          	sd	s0,8(sp)
    80006f40:	01010413          	addi	s0,sp,16
    80006f44:	300027f3          	csrr	a5,mstatus
    80006f48:	ffffe737          	lui	a4,0xffffe
    80006f4c:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff18ff>
    80006f50:	00e7f7b3          	and	a5,a5,a4
    80006f54:	00001737          	lui	a4,0x1
    80006f58:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80006f5c:	00e7e7b3          	or	a5,a5,a4
    80006f60:	30079073          	csrw	mstatus,a5
    80006f64:	00000797          	auipc	a5,0x0
    80006f68:	16078793          	addi	a5,a5,352 # 800070c4 <system_main>
    80006f6c:	34179073          	csrw	mepc,a5
    80006f70:	00000793          	li	a5,0
    80006f74:	18079073          	csrw	satp,a5
    80006f78:	000107b7          	lui	a5,0x10
    80006f7c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80006f80:	30279073          	csrw	medeleg,a5
    80006f84:	30379073          	csrw	mideleg,a5
    80006f88:	104027f3          	csrr	a5,sie
    80006f8c:	2227e793          	ori	a5,a5,546
    80006f90:	10479073          	csrw	sie,a5
    80006f94:	fff00793          	li	a5,-1
    80006f98:	00a7d793          	srli	a5,a5,0xa
    80006f9c:	3b079073          	csrw	pmpaddr0,a5
    80006fa0:	00f00793          	li	a5,15
    80006fa4:	3a079073          	csrw	pmpcfg0,a5
    80006fa8:	f14027f3          	csrr	a5,mhartid
    80006fac:	0200c737          	lui	a4,0x200c
    80006fb0:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80006fb4:	0007869b          	sext.w	a3,a5
    80006fb8:	00269713          	slli	a4,a3,0x2
    80006fbc:	000f4637          	lui	a2,0xf4
    80006fc0:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80006fc4:	00d70733          	add	a4,a4,a3
    80006fc8:	0037979b          	slliw	a5,a5,0x3
    80006fcc:	020046b7          	lui	a3,0x2004
    80006fd0:	00d787b3          	add	a5,a5,a3
    80006fd4:	00c585b3          	add	a1,a1,a2
    80006fd8:	00371693          	slli	a3,a4,0x3
    80006fdc:	00005717          	auipc	a4,0x5
    80006fe0:	cc470713          	addi	a4,a4,-828 # 8000bca0 <timer_scratch>
    80006fe4:	00b7b023          	sd	a1,0(a5)
    80006fe8:	00d70733          	add	a4,a4,a3
    80006fec:	00f73c23          	sd	a5,24(a4)
    80006ff0:	02c73023          	sd	a2,32(a4)
    80006ff4:	34071073          	csrw	mscratch,a4
    80006ff8:	00000797          	auipc	a5,0x0
    80006ffc:	6e878793          	addi	a5,a5,1768 # 800076e0 <timervec>
    80007000:	30579073          	csrw	mtvec,a5
    80007004:	300027f3          	csrr	a5,mstatus
    80007008:	0087e793          	ori	a5,a5,8
    8000700c:	30079073          	csrw	mstatus,a5
    80007010:	304027f3          	csrr	a5,mie
    80007014:	0807e793          	ori	a5,a5,128
    80007018:	30479073          	csrw	mie,a5
    8000701c:	f14027f3          	csrr	a5,mhartid
    80007020:	0007879b          	sext.w	a5,a5
    80007024:	00078213          	mv	tp,a5
    80007028:	30200073          	mret
    8000702c:	00813403          	ld	s0,8(sp)
    80007030:	01010113          	addi	sp,sp,16
    80007034:	00008067          	ret

0000000080007038 <timerinit>:
    80007038:	ff010113          	addi	sp,sp,-16
    8000703c:	00813423          	sd	s0,8(sp)
    80007040:	01010413          	addi	s0,sp,16
    80007044:	f14027f3          	csrr	a5,mhartid
    80007048:	0200c737          	lui	a4,0x200c
    8000704c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80007050:	0007869b          	sext.w	a3,a5
    80007054:	00269713          	slli	a4,a3,0x2
    80007058:	000f4637          	lui	a2,0xf4
    8000705c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80007060:	00d70733          	add	a4,a4,a3
    80007064:	0037979b          	slliw	a5,a5,0x3
    80007068:	020046b7          	lui	a3,0x2004
    8000706c:	00d787b3          	add	a5,a5,a3
    80007070:	00c585b3          	add	a1,a1,a2
    80007074:	00371693          	slli	a3,a4,0x3
    80007078:	00005717          	auipc	a4,0x5
    8000707c:	c2870713          	addi	a4,a4,-984 # 8000bca0 <timer_scratch>
    80007080:	00b7b023          	sd	a1,0(a5)
    80007084:	00d70733          	add	a4,a4,a3
    80007088:	00f73c23          	sd	a5,24(a4)
    8000708c:	02c73023          	sd	a2,32(a4)
    80007090:	34071073          	csrw	mscratch,a4
    80007094:	00000797          	auipc	a5,0x0
    80007098:	64c78793          	addi	a5,a5,1612 # 800076e0 <timervec>
    8000709c:	30579073          	csrw	mtvec,a5
    800070a0:	300027f3          	csrr	a5,mstatus
    800070a4:	0087e793          	ori	a5,a5,8
    800070a8:	30079073          	csrw	mstatus,a5
    800070ac:	304027f3          	csrr	a5,mie
    800070b0:	0807e793          	ori	a5,a5,128
    800070b4:	30479073          	csrw	mie,a5
    800070b8:	00813403          	ld	s0,8(sp)
    800070bc:	01010113          	addi	sp,sp,16
    800070c0:	00008067          	ret

00000000800070c4 <system_main>:
    800070c4:	fe010113          	addi	sp,sp,-32
    800070c8:	00813823          	sd	s0,16(sp)
    800070cc:	00913423          	sd	s1,8(sp)
    800070d0:	00113c23          	sd	ra,24(sp)
    800070d4:	02010413          	addi	s0,sp,32
    800070d8:	00000097          	auipc	ra,0x0
    800070dc:	0c4080e7          	jalr	196(ra) # 8000719c <cpuid>
    800070e0:	00005497          	auipc	s1,0x5
    800070e4:	a4048493          	addi	s1,s1,-1472 # 8000bb20 <started>
    800070e8:	02050263          	beqz	a0,8000710c <system_main+0x48>
    800070ec:	0004a783          	lw	a5,0(s1)
    800070f0:	0007879b          	sext.w	a5,a5
    800070f4:	fe078ce3          	beqz	a5,800070ec <system_main+0x28>
    800070f8:	0ff0000f          	fence
    800070fc:	00002517          	auipc	a0,0x2
    80007100:	5fc50513          	addi	a0,a0,1532 # 800096f8 <_ZZ9kPrintIntmE6digits+0x688>
    80007104:	00001097          	auipc	ra,0x1
    80007108:	a78080e7          	jalr	-1416(ra) # 80007b7c <panic>
    8000710c:	00001097          	auipc	ra,0x1
    80007110:	9cc080e7          	jalr	-1588(ra) # 80007ad8 <consoleinit>
    80007114:	00001097          	auipc	ra,0x1
    80007118:	158080e7          	jalr	344(ra) # 8000826c <printfinit>
    8000711c:	00002517          	auipc	a0,0x2
    80007120:	46450513          	addi	a0,a0,1124 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80007124:	00001097          	auipc	ra,0x1
    80007128:	ab4080e7          	jalr	-1356(ra) # 80007bd8 <__printf>
    8000712c:	00002517          	auipc	a0,0x2
    80007130:	59c50513          	addi	a0,a0,1436 # 800096c8 <_ZZ9kPrintIntmE6digits+0x658>
    80007134:	00001097          	auipc	ra,0x1
    80007138:	aa4080e7          	jalr	-1372(ra) # 80007bd8 <__printf>
    8000713c:	00002517          	auipc	a0,0x2
    80007140:	44450513          	addi	a0,a0,1092 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80007144:	00001097          	auipc	ra,0x1
    80007148:	a94080e7          	jalr	-1388(ra) # 80007bd8 <__printf>
    8000714c:	00001097          	auipc	ra,0x1
    80007150:	4ac080e7          	jalr	1196(ra) # 800085f8 <kinit>
    80007154:	00000097          	auipc	ra,0x0
    80007158:	148080e7          	jalr	328(ra) # 8000729c <trapinit>
    8000715c:	00000097          	auipc	ra,0x0
    80007160:	16c080e7          	jalr	364(ra) # 800072c8 <trapinithart>
    80007164:	00000097          	auipc	ra,0x0
    80007168:	5bc080e7          	jalr	1468(ra) # 80007720 <plicinit>
    8000716c:	00000097          	auipc	ra,0x0
    80007170:	5dc080e7          	jalr	1500(ra) # 80007748 <plicinithart>
    80007174:	00000097          	auipc	ra,0x0
    80007178:	078080e7          	jalr	120(ra) # 800071ec <userinit>
    8000717c:	0ff0000f          	fence
    80007180:	00100793          	li	a5,1
    80007184:	00002517          	auipc	a0,0x2
    80007188:	55c50513          	addi	a0,a0,1372 # 800096e0 <_ZZ9kPrintIntmE6digits+0x670>
    8000718c:	00f4a023          	sw	a5,0(s1)
    80007190:	00001097          	auipc	ra,0x1
    80007194:	a48080e7          	jalr	-1464(ra) # 80007bd8 <__printf>
    80007198:	0000006f          	j	80007198 <system_main+0xd4>

000000008000719c <cpuid>:
    8000719c:	ff010113          	addi	sp,sp,-16
    800071a0:	00813423          	sd	s0,8(sp)
    800071a4:	01010413          	addi	s0,sp,16
    800071a8:	00020513          	mv	a0,tp
    800071ac:	00813403          	ld	s0,8(sp)
    800071b0:	0005051b          	sext.w	a0,a0
    800071b4:	01010113          	addi	sp,sp,16
    800071b8:	00008067          	ret

00000000800071bc <mycpu>:
    800071bc:	ff010113          	addi	sp,sp,-16
    800071c0:	00813423          	sd	s0,8(sp)
    800071c4:	01010413          	addi	s0,sp,16
    800071c8:	00020793          	mv	a5,tp
    800071cc:	00813403          	ld	s0,8(sp)
    800071d0:	0007879b          	sext.w	a5,a5
    800071d4:	00779793          	slli	a5,a5,0x7
    800071d8:	00006517          	auipc	a0,0x6
    800071dc:	af850513          	addi	a0,a0,-1288 # 8000ccd0 <cpus>
    800071e0:	00f50533          	add	a0,a0,a5
    800071e4:	01010113          	addi	sp,sp,16
    800071e8:	00008067          	ret

00000000800071ec <userinit>:
    800071ec:	ff010113          	addi	sp,sp,-16
    800071f0:	00813423          	sd	s0,8(sp)
    800071f4:	01010413          	addi	s0,sp,16
    800071f8:	00813403          	ld	s0,8(sp)
    800071fc:	01010113          	addi	sp,sp,16
    80007200:	ffffb317          	auipc	t1,0xffffb
    80007204:	a7430067          	jr	-1420(t1) # 80001c74 <main>

0000000080007208 <either_copyout>:
    80007208:	ff010113          	addi	sp,sp,-16
    8000720c:	00813023          	sd	s0,0(sp)
    80007210:	00113423          	sd	ra,8(sp)
    80007214:	01010413          	addi	s0,sp,16
    80007218:	02051663          	bnez	a0,80007244 <either_copyout+0x3c>
    8000721c:	00058513          	mv	a0,a1
    80007220:	00060593          	mv	a1,a2
    80007224:	0006861b          	sext.w	a2,a3
    80007228:	00002097          	auipc	ra,0x2
    8000722c:	c5c080e7          	jalr	-932(ra) # 80008e84 <__memmove>
    80007230:	00813083          	ld	ra,8(sp)
    80007234:	00013403          	ld	s0,0(sp)
    80007238:	00000513          	li	a0,0
    8000723c:	01010113          	addi	sp,sp,16
    80007240:	00008067          	ret
    80007244:	00002517          	auipc	a0,0x2
    80007248:	4dc50513          	addi	a0,a0,1244 # 80009720 <_ZZ9kPrintIntmE6digits+0x6b0>
    8000724c:	00001097          	auipc	ra,0x1
    80007250:	930080e7          	jalr	-1744(ra) # 80007b7c <panic>

0000000080007254 <either_copyin>:
    80007254:	ff010113          	addi	sp,sp,-16
    80007258:	00813023          	sd	s0,0(sp)
    8000725c:	00113423          	sd	ra,8(sp)
    80007260:	01010413          	addi	s0,sp,16
    80007264:	02059463          	bnez	a1,8000728c <either_copyin+0x38>
    80007268:	00060593          	mv	a1,a2
    8000726c:	0006861b          	sext.w	a2,a3
    80007270:	00002097          	auipc	ra,0x2
    80007274:	c14080e7          	jalr	-1004(ra) # 80008e84 <__memmove>
    80007278:	00813083          	ld	ra,8(sp)
    8000727c:	00013403          	ld	s0,0(sp)
    80007280:	00000513          	li	a0,0
    80007284:	01010113          	addi	sp,sp,16
    80007288:	00008067          	ret
    8000728c:	00002517          	auipc	a0,0x2
    80007290:	4bc50513          	addi	a0,a0,1212 # 80009748 <_ZZ9kPrintIntmE6digits+0x6d8>
    80007294:	00001097          	auipc	ra,0x1
    80007298:	8e8080e7          	jalr	-1816(ra) # 80007b7c <panic>

000000008000729c <trapinit>:
    8000729c:	ff010113          	addi	sp,sp,-16
    800072a0:	00813423          	sd	s0,8(sp)
    800072a4:	01010413          	addi	s0,sp,16
    800072a8:	00813403          	ld	s0,8(sp)
    800072ac:	00002597          	auipc	a1,0x2
    800072b0:	4c458593          	addi	a1,a1,1220 # 80009770 <_ZZ9kPrintIntmE6digits+0x700>
    800072b4:	00006517          	auipc	a0,0x6
    800072b8:	a9c50513          	addi	a0,a0,-1380 # 8000cd50 <tickslock>
    800072bc:	01010113          	addi	sp,sp,16
    800072c0:	00001317          	auipc	t1,0x1
    800072c4:	5c830067          	jr	1480(t1) # 80008888 <initlock>

00000000800072c8 <trapinithart>:
    800072c8:	ff010113          	addi	sp,sp,-16
    800072cc:	00813423          	sd	s0,8(sp)
    800072d0:	01010413          	addi	s0,sp,16
    800072d4:	00000797          	auipc	a5,0x0
    800072d8:	2fc78793          	addi	a5,a5,764 # 800075d0 <kernelvec>
    800072dc:	10579073          	csrw	stvec,a5
    800072e0:	00813403          	ld	s0,8(sp)
    800072e4:	01010113          	addi	sp,sp,16
    800072e8:	00008067          	ret

00000000800072ec <usertrap>:
    800072ec:	ff010113          	addi	sp,sp,-16
    800072f0:	00813423          	sd	s0,8(sp)
    800072f4:	01010413          	addi	s0,sp,16
    800072f8:	00813403          	ld	s0,8(sp)
    800072fc:	01010113          	addi	sp,sp,16
    80007300:	00008067          	ret

0000000080007304 <usertrapret>:
    80007304:	ff010113          	addi	sp,sp,-16
    80007308:	00813423          	sd	s0,8(sp)
    8000730c:	01010413          	addi	s0,sp,16
    80007310:	00813403          	ld	s0,8(sp)
    80007314:	01010113          	addi	sp,sp,16
    80007318:	00008067          	ret

000000008000731c <kerneltrap>:
    8000731c:	fe010113          	addi	sp,sp,-32
    80007320:	00813823          	sd	s0,16(sp)
    80007324:	00113c23          	sd	ra,24(sp)
    80007328:	00913423          	sd	s1,8(sp)
    8000732c:	02010413          	addi	s0,sp,32
    80007330:	142025f3          	csrr	a1,scause
    80007334:	100027f3          	csrr	a5,sstatus
    80007338:	0027f793          	andi	a5,a5,2
    8000733c:	10079c63          	bnez	a5,80007454 <kerneltrap+0x138>
    80007340:	142027f3          	csrr	a5,scause
    80007344:	0207ce63          	bltz	a5,80007380 <kerneltrap+0x64>
    80007348:	00002517          	auipc	a0,0x2
    8000734c:	47050513          	addi	a0,a0,1136 # 800097b8 <_ZZ9kPrintIntmE6digits+0x748>
    80007350:	00001097          	auipc	ra,0x1
    80007354:	888080e7          	jalr	-1912(ra) # 80007bd8 <__printf>
    80007358:	141025f3          	csrr	a1,sepc
    8000735c:	14302673          	csrr	a2,stval
    80007360:	00002517          	auipc	a0,0x2
    80007364:	46850513          	addi	a0,a0,1128 # 800097c8 <_ZZ9kPrintIntmE6digits+0x758>
    80007368:	00001097          	auipc	ra,0x1
    8000736c:	870080e7          	jalr	-1936(ra) # 80007bd8 <__printf>
    80007370:	00002517          	auipc	a0,0x2
    80007374:	47050513          	addi	a0,a0,1136 # 800097e0 <_ZZ9kPrintIntmE6digits+0x770>
    80007378:	00001097          	auipc	ra,0x1
    8000737c:	804080e7          	jalr	-2044(ra) # 80007b7c <panic>
    80007380:	0ff7f713          	andi	a4,a5,255
    80007384:	00900693          	li	a3,9
    80007388:	04d70063          	beq	a4,a3,800073c8 <kerneltrap+0xac>
    8000738c:	fff00713          	li	a4,-1
    80007390:	03f71713          	slli	a4,a4,0x3f
    80007394:	00170713          	addi	a4,a4,1
    80007398:	fae798e3          	bne	a5,a4,80007348 <kerneltrap+0x2c>
    8000739c:	00000097          	auipc	ra,0x0
    800073a0:	e00080e7          	jalr	-512(ra) # 8000719c <cpuid>
    800073a4:	06050663          	beqz	a0,80007410 <kerneltrap+0xf4>
    800073a8:	144027f3          	csrr	a5,sip
    800073ac:	ffd7f793          	andi	a5,a5,-3
    800073b0:	14479073          	csrw	sip,a5
    800073b4:	01813083          	ld	ra,24(sp)
    800073b8:	01013403          	ld	s0,16(sp)
    800073bc:	00813483          	ld	s1,8(sp)
    800073c0:	02010113          	addi	sp,sp,32
    800073c4:	00008067          	ret
    800073c8:	00000097          	auipc	ra,0x0
    800073cc:	3cc080e7          	jalr	972(ra) # 80007794 <plic_claim>
    800073d0:	00a00793          	li	a5,10
    800073d4:	00050493          	mv	s1,a0
    800073d8:	06f50863          	beq	a0,a5,80007448 <kerneltrap+0x12c>
    800073dc:	fc050ce3          	beqz	a0,800073b4 <kerneltrap+0x98>
    800073e0:	00050593          	mv	a1,a0
    800073e4:	00002517          	auipc	a0,0x2
    800073e8:	3b450513          	addi	a0,a0,948 # 80009798 <_ZZ9kPrintIntmE6digits+0x728>
    800073ec:	00000097          	auipc	ra,0x0
    800073f0:	7ec080e7          	jalr	2028(ra) # 80007bd8 <__printf>
    800073f4:	01013403          	ld	s0,16(sp)
    800073f8:	01813083          	ld	ra,24(sp)
    800073fc:	00048513          	mv	a0,s1
    80007400:	00813483          	ld	s1,8(sp)
    80007404:	02010113          	addi	sp,sp,32
    80007408:	00000317          	auipc	t1,0x0
    8000740c:	3c430067          	jr	964(t1) # 800077cc <plic_complete>
    80007410:	00006517          	auipc	a0,0x6
    80007414:	94050513          	addi	a0,a0,-1728 # 8000cd50 <tickslock>
    80007418:	00001097          	auipc	ra,0x1
    8000741c:	494080e7          	jalr	1172(ra) # 800088ac <acquire>
    80007420:	00004717          	auipc	a4,0x4
    80007424:	70470713          	addi	a4,a4,1796 # 8000bb24 <ticks>
    80007428:	00072783          	lw	a5,0(a4)
    8000742c:	00006517          	auipc	a0,0x6
    80007430:	92450513          	addi	a0,a0,-1756 # 8000cd50 <tickslock>
    80007434:	0017879b          	addiw	a5,a5,1
    80007438:	00f72023          	sw	a5,0(a4)
    8000743c:	00001097          	auipc	ra,0x1
    80007440:	53c080e7          	jalr	1340(ra) # 80008978 <release>
    80007444:	f65ff06f          	j	800073a8 <kerneltrap+0x8c>
    80007448:	00001097          	auipc	ra,0x1
    8000744c:	098080e7          	jalr	152(ra) # 800084e0 <uartintr>
    80007450:	fa5ff06f          	j	800073f4 <kerneltrap+0xd8>
    80007454:	00002517          	auipc	a0,0x2
    80007458:	32450513          	addi	a0,a0,804 # 80009778 <_ZZ9kPrintIntmE6digits+0x708>
    8000745c:	00000097          	auipc	ra,0x0
    80007460:	720080e7          	jalr	1824(ra) # 80007b7c <panic>

0000000080007464 <clockintr>:
    80007464:	fe010113          	addi	sp,sp,-32
    80007468:	00813823          	sd	s0,16(sp)
    8000746c:	00913423          	sd	s1,8(sp)
    80007470:	00113c23          	sd	ra,24(sp)
    80007474:	02010413          	addi	s0,sp,32
    80007478:	00006497          	auipc	s1,0x6
    8000747c:	8d848493          	addi	s1,s1,-1832 # 8000cd50 <tickslock>
    80007480:	00048513          	mv	a0,s1
    80007484:	00001097          	auipc	ra,0x1
    80007488:	428080e7          	jalr	1064(ra) # 800088ac <acquire>
    8000748c:	00004717          	auipc	a4,0x4
    80007490:	69870713          	addi	a4,a4,1688 # 8000bb24 <ticks>
    80007494:	00072783          	lw	a5,0(a4)
    80007498:	01013403          	ld	s0,16(sp)
    8000749c:	01813083          	ld	ra,24(sp)
    800074a0:	00048513          	mv	a0,s1
    800074a4:	0017879b          	addiw	a5,a5,1
    800074a8:	00813483          	ld	s1,8(sp)
    800074ac:	00f72023          	sw	a5,0(a4)
    800074b0:	02010113          	addi	sp,sp,32
    800074b4:	00001317          	auipc	t1,0x1
    800074b8:	4c430067          	jr	1220(t1) # 80008978 <release>

00000000800074bc <devintr>:
    800074bc:	142027f3          	csrr	a5,scause
    800074c0:	00000513          	li	a0,0
    800074c4:	0007c463          	bltz	a5,800074cc <devintr+0x10>
    800074c8:	00008067          	ret
    800074cc:	fe010113          	addi	sp,sp,-32
    800074d0:	00813823          	sd	s0,16(sp)
    800074d4:	00113c23          	sd	ra,24(sp)
    800074d8:	00913423          	sd	s1,8(sp)
    800074dc:	02010413          	addi	s0,sp,32
    800074e0:	0ff7f713          	andi	a4,a5,255
    800074e4:	00900693          	li	a3,9
    800074e8:	04d70c63          	beq	a4,a3,80007540 <devintr+0x84>
    800074ec:	fff00713          	li	a4,-1
    800074f0:	03f71713          	slli	a4,a4,0x3f
    800074f4:	00170713          	addi	a4,a4,1
    800074f8:	00e78c63          	beq	a5,a4,80007510 <devintr+0x54>
    800074fc:	01813083          	ld	ra,24(sp)
    80007500:	01013403          	ld	s0,16(sp)
    80007504:	00813483          	ld	s1,8(sp)
    80007508:	02010113          	addi	sp,sp,32
    8000750c:	00008067          	ret
    80007510:	00000097          	auipc	ra,0x0
    80007514:	c8c080e7          	jalr	-884(ra) # 8000719c <cpuid>
    80007518:	06050663          	beqz	a0,80007584 <devintr+0xc8>
    8000751c:	144027f3          	csrr	a5,sip
    80007520:	ffd7f793          	andi	a5,a5,-3
    80007524:	14479073          	csrw	sip,a5
    80007528:	01813083          	ld	ra,24(sp)
    8000752c:	01013403          	ld	s0,16(sp)
    80007530:	00813483          	ld	s1,8(sp)
    80007534:	00200513          	li	a0,2
    80007538:	02010113          	addi	sp,sp,32
    8000753c:	00008067          	ret
    80007540:	00000097          	auipc	ra,0x0
    80007544:	254080e7          	jalr	596(ra) # 80007794 <plic_claim>
    80007548:	00a00793          	li	a5,10
    8000754c:	00050493          	mv	s1,a0
    80007550:	06f50663          	beq	a0,a5,800075bc <devintr+0x100>
    80007554:	00100513          	li	a0,1
    80007558:	fa0482e3          	beqz	s1,800074fc <devintr+0x40>
    8000755c:	00048593          	mv	a1,s1
    80007560:	00002517          	auipc	a0,0x2
    80007564:	23850513          	addi	a0,a0,568 # 80009798 <_ZZ9kPrintIntmE6digits+0x728>
    80007568:	00000097          	auipc	ra,0x0
    8000756c:	670080e7          	jalr	1648(ra) # 80007bd8 <__printf>
    80007570:	00048513          	mv	a0,s1
    80007574:	00000097          	auipc	ra,0x0
    80007578:	258080e7          	jalr	600(ra) # 800077cc <plic_complete>
    8000757c:	00100513          	li	a0,1
    80007580:	f7dff06f          	j	800074fc <devintr+0x40>
    80007584:	00005517          	auipc	a0,0x5
    80007588:	7cc50513          	addi	a0,a0,1996 # 8000cd50 <tickslock>
    8000758c:	00001097          	auipc	ra,0x1
    80007590:	320080e7          	jalr	800(ra) # 800088ac <acquire>
    80007594:	00004717          	auipc	a4,0x4
    80007598:	59070713          	addi	a4,a4,1424 # 8000bb24 <ticks>
    8000759c:	00072783          	lw	a5,0(a4)
    800075a0:	00005517          	auipc	a0,0x5
    800075a4:	7b050513          	addi	a0,a0,1968 # 8000cd50 <tickslock>
    800075a8:	0017879b          	addiw	a5,a5,1
    800075ac:	00f72023          	sw	a5,0(a4)
    800075b0:	00001097          	auipc	ra,0x1
    800075b4:	3c8080e7          	jalr	968(ra) # 80008978 <release>
    800075b8:	f65ff06f          	j	8000751c <devintr+0x60>
    800075bc:	00001097          	auipc	ra,0x1
    800075c0:	f24080e7          	jalr	-220(ra) # 800084e0 <uartintr>
    800075c4:	fadff06f          	j	80007570 <devintr+0xb4>
	...

00000000800075d0 <kernelvec>:
    800075d0:	f0010113          	addi	sp,sp,-256
    800075d4:	00113023          	sd	ra,0(sp)
    800075d8:	00213423          	sd	sp,8(sp)
    800075dc:	00313823          	sd	gp,16(sp)
    800075e0:	00413c23          	sd	tp,24(sp)
    800075e4:	02513023          	sd	t0,32(sp)
    800075e8:	02613423          	sd	t1,40(sp)
    800075ec:	02713823          	sd	t2,48(sp)
    800075f0:	02813c23          	sd	s0,56(sp)
    800075f4:	04913023          	sd	s1,64(sp)
    800075f8:	04a13423          	sd	a0,72(sp)
    800075fc:	04b13823          	sd	a1,80(sp)
    80007600:	04c13c23          	sd	a2,88(sp)
    80007604:	06d13023          	sd	a3,96(sp)
    80007608:	06e13423          	sd	a4,104(sp)
    8000760c:	06f13823          	sd	a5,112(sp)
    80007610:	07013c23          	sd	a6,120(sp)
    80007614:	09113023          	sd	a7,128(sp)
    80007618:	09213423          	sd	s2,136(sp)
    8000761c:	09313823          	sd	s3,144(sp)
    80007620:	09413c23          	sd	s4,152(sp)
    80007624:	0b513023          	sd	s5,160(sp)
    80007628:	0b613423          	sd	s6,168(sp)
    8000762c:	0b713823          	sd	s7,176(sp)
    80007630:	0b813c23          	sd	s8,184(sp)
    80007634:	0d913023          	sd	s9,192(sp)
    80007638:	0da13423          	sd	s10,200(sp)
    8000763c:	0db13823          	sd	s11,208(sp)
    80007640:	0dc13c23          	sd	t3,216(sp)
    80007644:	0fd13023          	sd	t4,224(sp)
    80007648:	0fe13423          	sd	t5,232(sp)
    8000764c:	0ff13823          	sd	t6,240(sp)
    80007650:	ccdff0ef          	jal	ra,8000731c <kerneltrap>
    80007654:	00013083          	ld	ra,0(sp)
    80007658:	00813103          	ld	sp,8(sp)
    8000765c:	01013183          	ld	gp,16(sp)
    80007660:	02013283          	ld	t0,32(sp)
    80007664:	02813303          	ld	t1,40(sp)
    80007668:	03013383          	ld	t2,48(sp)
    8000766c:	03813403          	ld	s0,56(sp)
    80007670:	04013483          	ld	s1,64(sp)
    80007674:	04813503          	ld	a0,72(sp)
    80007678:	05013583          	ld	a1,80(sp)
    8000767c:	05813603          	ld	a2,88(sp)
    80007680:	06013683          	ld	a3,96(sp)
    80007684:	06813703          	ld	a4,104(sp)
    80007688:	07013783          	ld	a5,112(sp)
    8000768c:	07813803          	ld	a6,120(sp)
    80007690:	08013883          	ld	a7,128(sp)
    80007694:	08813903          	ld	s2,136(sp)
    80007698:	09013983          	ld	s3,144(sp)
    8000769c:	09813a03          	ld	s4,152(sp)
    800076a0:	0a013a83          	ld	s5,160(sp)
    800076a4:	0a813b03          	ld	s6,168(sp)
    800076a8:	0b013b83          	ld	s7,176(sp)
    800076ac:	0b813c03          	ld	s8,184(sp)
    800076b0:	0c013c83          	ld	s9,192(sp)
    800076b4:	0c813d03          	ld	s10,200(sp)
    800076b8:	0d013d83          	ld	s11,208(sp)
    800076bc:	0d813e03          	ld	t3,216(sp)
    800076c0:	0e013e83          	ld	t4,224(sp)
    800076c4:	0e813f03          	ld	t5,232(sp)
    800076c8:	0f013f83          	ld	t6,240(sp)
    800076cc:	10010113          	addi	sp,sp,256
    800076d0:	10200073          	sret
    800076d4:	00000013          	nop
    800076d8:	00000013          	nop
    800076dc:	00000013          	nop

00000000800076e0 <timervec>:
    800076e0:	34051573          	csrrw	a0,mscratch,a0
    800076e4:	00b53023          	sd	a1,0(a0)
    800076e8:	00c53423          	sd	a2,8(a0)
    800076ec:	00d53823          	sd	a3,16(a0)
    800076f0:	01853583          	ld	a1,24(a0)
    800076f4:	02053603          	ld	a2,32(a0)
    800076f8:	0005b683          	ld	a3,0(a1)
    800076fc:	00c686b3          	add	a3,a3,a2
    80007700:	00d5b023          	sd	a3,0(a1)
    80007704:	00200593          	li	a1,2
    80007708:	14459073          	csrw	sip,a1
    8000770c:	01053683          	ld	a3,16(a0)
    80007710:	00853603          	ld	a2,8(a0)
    80007714:	00053583          	ld	a1,0(a0)
    80007718:	34051573          	csrrw	a0,mscratch,a0
    8000771c:	30200073          	mret

0000000080007720 <plicinit>:
    80007720:	ff010113          	addi	sp,sp,-16
    80007724:	00813423          	sd	s0,8(sp)
    80007728:	01010413          	addi	s0,sp,16
    8000772c:	00813403          	ld	s0,8(sp)
    80007730:	0c0007b7          	lui	a5,0xc000
    80007734:	00100713          	li	a4,1
    80007738:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000773c:	00e7a223          	sw	a4,4(a5)
    80007740:	01010113          	addi	sp,sp,16
    80007744:	00008067          	ret

0000000080007748 <plicinithart>:
    80007748:	ff010113          	addi	sp,sp,-16
    8000774c:	00813023          	sd	s0,0(sp)
    80007750:	00113423          	sd	ra,8(sp)
    80007754:	01010413          	addi	s0,sp,16
    80007758:	00000097          	auipc	ra,0x0
    8000775c:	a44080e7          	jalr	-1468(ra) # 8000719c <cpuid>
    80007760:	0085171b          	slliw	a4,a0,0x8
    80007764:	0c0027b7          	lui	a5,0xc002
    80007768:	00e787b3          	add	a5,a5,a4
    8000776c:	40200713          	li	a4,1026
    80007770:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80007774:	00813083          	ld	ra,8(sp)
    80007778:	00013403          	ld	s0,0(sp)
    8000777c:	00d5151b          	slliw	a0,a0,0xd
    80007780:	0c2017b7          	lui	a5,0xc201
    80007784:	00a78533          	add	a0,a5,a0
    80007788:	00052023          	sw	zero,0(a0)
    8000778c:	01010113          	addi	sp,sp,16
    80007790:	00008067          	ret

0000000080007794 <plic_claim>:
    80007794:	ff010113          	addi	sp,sp,-16
    80007798:	00813023          	sd	s0,0(sp)
    8000779c:	00113423          	sd	ra,8(sp)
    800077a0:	01010413          	addi	s0,sp,16
    800077a4:	00000097          	auipc	ra,0x0
    800077a8:	9f8080e7          	jalr	-1544(ra) # 8000719c <cpuid>
    800077ac:	00813083          	ld	ra,8(sp)
    800077b0:	00013403          	ld	s0,0(sp)
    800077b4:	00d5151b          	slliw	a0,a0,0xd
    800077b8:	0c2017b7          	lui	a5,0xc201
    800077bc:	00a78533          	add	a0,a5,a0
    800077c0:	00452503          	lw	a0,4(a0)
    800077c4:	01010113          	addi	sp,sp,16
    800077c8:	00008067          	ret

00000000800077cc <plic_complete>:
    800077cc:	fe010113          	addi	sp,sp,-32
    800077d0:	00813823          	sd	s0,16(sp)
    800077d4:	00913423          	sd	s1,8(sp)
    800077d8:	00113c23          	sd	ra,24(sp)
    800077dc:	02010413          	addi	s0,sp,32
    800077e0:	00050493          	mv	s1,a0
    800077e4:	00000097          	auipc	ra,0x0
    800077e8:	9b8080e7          	jalr	-1608(ra) # 8000719c <cpuid>
    800077ec:	01813083          	ld	ra,24(sp)
    800077f0:	01013403          	ld	s0,16(sp)
    800077f4:	00d5179b          	slliw	a5,a0,0xd
    800077f8:	0c201737          	lui	a4,0xc201
    800077fc:	00f707b3          	add	a5,a4,a5
    80007800:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80007804:	00813483          	ld	s1,8(sp)
    80007808:	02010113          	addi	sp,sp,32
    8000780c:	00008067          	ret

0000000080007810 <consolewrite>:
    80007810:	fb010113          	addi	sp,sp,-80
    80007814:	04813023          	sd	s0,64(sp)
    80007818:	04113423          	sd	ra,72(sp)
    8000781c:	02913c23          	sd	s1,56(sp)
    80007820:	03213823          	sd	s2,48(sp)
    80007824:	03313423          	sd	s3,40(sp)
    80007828:	03413023          	sd	s4,32(sp)
    8000782c:	01513c23          	sd	s5,24(sp)
    80007830:	05010413          	addi	s0,sp,80
    80007834:	06c05c63          	blez	a2,800078ac <consolewrite+0x9c>
    80007838:	00060993          	mv	s3,a2
    8000783c:	00050a13          	mv	s4,a0
    80007840:	00058493          	mv	s1,a1
    80007844:	00000913          	li	s2,0
    80007848:	fff00a93          	li	s5,-1
    8000784c:	01c0006f          	j	80007868 <consolewrite+0x58>
    80007850:	fbf44503          	lbu	a0,-65(s0)
    80007854:	0019091b          	addiw	s2,s2,1
    80007858:	00148493          	addi	s1,s1,1
    8000785c:	00001097          	auipc	ra,0x1
    80007860:	a9c080e7          	jalr	-1380(ra) # 800082f8 <uartputc>
    80007864:	03298063          	beq	s3,s2,80007884 <consolewrite+0x74>
    80007868:	00048613          	mv	a2,s1
    8000786c:	00100693          	li	a3,1
    80007870:	000a0593          	mv	a1,s4
    80007874:	fbf40513          	addi	a0,s0,-65
    80007878:	00000097          	auipc	ra,0x0
    8000787c:	9dc080e7          	jalr	-1572(ra) # 80007254 <either_copyin>
    80007880:	fd5518e3          	bne	a0,s5,80007850 <consolewrite+0x40>
    80007884:	04813083          	ld	ra,72(sp)
    80007888:	04013403          	ld	s0,64(sp)
    8000788c:	03813483          	ld	s1,56(sp)
    80007890:	02813983          	ld	s3,40(sp)
    80007894:	02013a03          	ld	s4,32(sp)
    80007898:	01813a83          	ld	s5,24(sp)
    8000789c:	00090513          	mv	a0,s2
    800078a0:	03013903          	ld	s2,48(sp)
    800078a4:	05010113          	addi	sp,sp,80
    800078a8:	00008067          	ret
    800078ac:	00000913          	li	s2,0
    800078b0:	fd5ff06f          	j	80007884 <consolewrite+0x74>

00000000800078b4 <consoleread>:
    800078b4:	f9010113          	addi	sp,sp,-112
    800078b8:	06813023          	sd	s0,96(sp)
    800078bc:	04913c23          	sd	s1,88(sp)
    800078c0:	05213823          	sd	s2,80(sp)
    800078c4:	05313423          	sd	s3,72(sp)
    800078c8:	05413023          	sd	s4,64(sp)
    800078cc:	03513c23          	sd	s5,56(sp)
    800078d0:	03613823          	sd	s6,48(sp)
    800078d4:	03713423          	sd	s7,40(sp)
    800078d8:	03813023          	sd	s8,32(sp)
    800078dc:	06113423          	sd	ra,104(sp)
    800078e0:	01913c23          	sd	s9,24(sp)
    800078e4:	07010413          	addi	s0,sp,112
    800078e8:	00060b93          	mv	s7,a2
    800078ec:	00050913          	mv	s2,a0
    800078f0:	00058c13          	mv	s8,a1
    800078f4:	00060b1b          	sext.w	s6,a2
    800078f8:	00005497          	auipc	s1,0x5
    800078fc:	48048493          	addi	s1,s1,1152 # 8000cd78 <cons>
    80007900:	00400993          	li	s3,4
    80007904:	fff00a13          	li	s4,-1
    80007908:	00a00a93          	li	s5,10
    8000790c:	05705e63          	blez	s7,80007968 <consoleread+0xb4>
    80007910:	09c4a703          	lw	a4,156(s1)
    80007914:	0984a783          	lw	a5,152(s1)
    80007918:	0007071b          	sext.w	a4,a4
    8000791c:	08e78463          	beq	a5,a4,800079a4 <consoleread+0xf0>
    80007920:	07f7f713          	andi	a4,a5,127
    80007924:	00e48733          	add	a4,s1,a4
    80007928:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000792c:	0017869b          	addiw	a3,a5,1
    80007930:	08d4ac23          	sw	a3,152(s1)
    80007934:	00070c9b          	sext.w	s9,a4
    80007938:	0b370663          	beq	a4,s3,800079e4 <consoleread+0x130>
    8000793c:	00100693          	li	a3,1
    80007940:	f9f40613          	addi	a2,s0,-97
    80007944:	000c0593          	mv	a1,s8
    80007948:	00090513          	mv	a0,s2
    8000794c:	f8e40fa3          	sb	a4,-97(s0)
    80007950:	00000097          	auipc	ra,0x0
    80007954:	8b8080e7          	jalr	-1864(ra) # 80007208 <either_copyout>
    80007958:	01450863          	beq	a0,s4,80007968 <consoleread+0xb4>
    8000795c:	001c0c13          	addi	s8,s8,1
    80007960:	fffb8b9b          	addiw	s7,s7,-1
    80007964:	fb5c94e3          	bne	s9,s5,8000790c <consoleread+0x58>
    80007968:	000b851b          	sext.w	a0,s7
    8000796c:	06813083          	ld	ra,104(sp)
    80007970:	06013403          	ld	s0,96(sp)
    80007974:	05813483          	ld	s1,88(sp)
    80007978:	05013903          	ld	s2,80(sp)
    8000797c:	04813983          	ld	s3,72(sp)
    80007980:	04013a03          	ld	s4,64(sp)
    80007984:	03813a83          	ld	s5,56(sp)
    80007988:	02813b83          	ld	s7,40(sp)
    8000798c:	02013c03          	ld	s8,32(sp)
    80007990:	01813c83          	ld	s9,24(sp)
    80007994:	40ab053b          	subw	a0,s6,a0
    80007998:	03013b03          	ld	s6,48(sp)
    8000799c:	07010113          	addi	sp,sp,112
    800079a0:	00008067          	ret
    800079a4:	00001097          	auipc	ra,0x1
    800079a8:	1d8080e7          	jalr	472(ra) # 80008b7c <push_on>
    800079ac:	0984a703          	lw	a4,152(s1)
    800079b0:	09c4a783          	lw	a5,156(s1)
    800079b4:	0007879b          	sext.w	a5,a5
    800079b8:	fef70ce3          	beq	a4,a5,800079b0 <consoleread+0xfc>
    800079bc:	00001097          	auipc	ra,0x1
    800079c0:	234080e7          	jalr	564(ra) # 80008bf0 <pop_on>
    800079c4:	0984a783          	lw	a5,152(s1)
    800079c8:	07f7f713          	andi	a4,a5,127
    800079cc:	00e48733          	add	a4,s1,a4
    800079d0:	01874703          	lbu	a4,24(a4)
    800079d4:	0017869b          	addiw	a3,a5,1
    800079d8:	08d4ac23          	sw	a3,152(s1)
    800079dc:	00070c9b          	sext.w	s9,a4
    800079e0:	f5371ee3          	bne	a4,s3,8000793c <consoleread+0x88>
    800079e4:	000b851b          	sext.w	a0,s7
    800079e8:	f96bf2e3          	bgeu	s7,s6,8000796c <consoleread+0xb8>
    800079ec:	08f4ac23          	sw	a5,152(s1)
    800079f0:	f7dff06f          	j	8000796c <consoleread+0xb8>

00000000800079f4 <consputc>:
    800079f4:	10000793          	li	a5,256
    800079f8:	00f50663          	beq	a0,a5,80007a04 <consputc+0x10>
    800079fc:	00001317          	auipc	t1,0x1
    80007a00:	9f430067          	jr	-1548(t1) # 800083f0 <uartputc_sync>
    80007a04:	ff010113          	addi	sp,sp,-16
    80007a08:	00113423          	sd	ra,8(sp)
    80007a0c:	00813023          	sd	s0,0(sp)
    80007a10:	01010413          	addi	s0,sp,16
    80007a14:	00800513          	li	a0,8
    80007a18:	00001097          	auipc	ra,0x1
    80007a1c:	9d8080e7          	jalr	-1576(ra) # 800083f0 <uartputc_sync>
    80007a20:	02000513          	li	a0,32
    80007a24:	00001097          	auipc	ra,0x1
    80007a28:	9cc080e7          	jalr	-1588(ra) # 800083f0 <uartputc_sync>
    80007a2c:	00013403          	ld	s0,0(sp)
    80007a30:	00813083          	ld	ra,8(sp)
    80007a34:	00800513          	li	a0,8
    80007a38:	01010113          	addi	sp,sp,16
    80007a3c:	00001317          	auipc	t1,0x1
    80007a40:	9b430067          	jr	-1612(t1) # 800083f0 <uartputc_sync>

0000000080007a44 <consoleintr>:
    80007a44:	fe010113          	addi	sp,sp,-32
    80007a48:	00813823          	sd	s0,16(sp)
    80007a4c:	00913423          	sd	s1,8(sp)
    80007a50:	01213023          	sd	s2,0(sp)
    80007a54:	00113c23          	sd	ra,24(sp)
    80007a58:	02010413          	addi	s0,sp,32
    80007a5c:	00005917          	auipc	s2,0x5
    80007a60:	31c90913          	addi	s2,s2,796 # 8000cd78 <cons>
    80007a64:	00050493          	mv	s1,a0
    80007a68:	00090513          	mv	a0,s2
    80007a6c:	00001097          	auipc	ra,0x1
    80007a70:	e40080e7          	jalr	-448(ra) # 800088ac <acquire>
    80007a74:	02048c63          	beqz	s1,80007aac <consoleintr+0x68>
    80007a78:	0a092783          	lw	a5,160(s2)
    80007a7c:	09892703          	lw	a4,152(s2)
    80007a80:	07f00693          	li	a3,127
    80007a84:	40e7873b          	subw	a4,a5,a4
    80007a88:	02e6e263          	bltu	a3,a4,80007aac <consoleintr+0x68>
    80007a8c:	00d00713          	li	a4,13
    80007a90:	04e48063          	beq	s1,a4,80007ad0 <consoleintr+0x8c>
    80007a94:	07f7f713          	andi	a4,a5,127
    80007a98:	00e90733          	add	a4,s2,a4
    80007a9c:	0017879b          	addiw	a5,a5,1
    80007aa0:	0af92023          	sw	a5,160(s2)
    80007aa4:	00970c23          	sb	s1,24(a4)
    80007aa8:	08f92e23          	sw	a5,156(s2)
    80007aac:	01013403          	ld	s0,16(sp)
    80007ab0:	01813083          	ld	ra,24(sp)
    80007ab4:	00813483          	ld	s1,8(sp)
    80007ab8:	00013903          	ld	s2,0(sp)
    80007abc:	00005517          	auipc	a0,0x5
    80007ac0:	2bc50513          	addi	a0,a0,700 # 8000cd78 <cons>
    80007ac4:	02010113          	addi	sp,sp,32
    80007ac8:	00001317          	auipc	t1,0x1
    80007acc:	eb030067          	jr	-336(t1) # 80008978 <release>
    80007ad0:	00a00493          	li	s1,10
    80007ad4:	fc1ff06f          	j	80007a94 <consoleintr+0x50>

0000000080007ad8 <consoleinit>:
    80007ad8:	fe010113          	addi	sp,sp,-32
    80007adc:	00113c23          	sd	ra,24(sp)
    80007ae0:	00813823          	sd	s0,16(sp)
    80007ae4:	00913423          	sd	s1,8(sp)
    80007ae8:	02010413          	addi	s0,sp,32
    80007aec:	00005497          	auipc	s1,0x5
    80007af0:	28c48493          	addi	s1,s1,652 # 8000cd78 <cons>
    80007af4:	00048513          	mv	a0,s1
    80007af8:	00002597          	auipc	a1,0x2
    80007afc:	cf858593          	addi	a1,a1,-776 # 800097f0 <_ZZ9kPrintIntmE6digits+0x780>
    80007b00:	00001097          	auipc	ra,0x1
    80007b04:	d88080e7          	jalr	-632(ra) # 80008888 <initlock>
    80007b08:	00000097          	auipc	ra,0x0
    80007b0c:	7ac080e7          	jalr	1964(ra) # 800082b4 <uartinit>
    80007b10:	01813083          	ld	ra,24(sp)
    80007b14:	01013403          	ld	s0,16(sp)
    80007b18:	00000797          	auipc	a5,0x0
    80007b1c:	d9c78793          	addi	a5,a5,-612 # 800078b4 <consoleread>
    80007b20:	0af4bc23          	sd	a5,184(s1)
    80007b24:	00000797          	auipc	a5,0x0
    80007b28:	cec78793          	addi	a5,a5,-788 # 80007810 <consolewrite>
    80007b2c:	0cf4b023          	sd	a5,192(s1)
    80007b30:	00813483          	ld	s1,8(sp)
    80007b34:	02010113          	addi	sp,sp,32
    80007b38:	00008067          	ret

0000000080007b3c <console_read>:
    80007b3c:	ff010113          	addi	sp,sp,-16
    80007b40:	00813423          	sd	s0,8(sp)
    80007b44:	01010413          	addi	s0,sp,16
    80007b48:	00813403          	ld	s0,8(sp)
    80007b4c:	00005317          	auipc	t1,0x5
    80007b50:	2e433303          	ld	t1,740(t1) # 8000ce30 <devsw+0x10>
    80007b54:	01010113          	addi	sp,sp,16
    80007b58:	00030067          	jr	t1

0000000080007b5c <console_write>:
    80007b5c:	ff010113          	addi	sp,sp,-16
    80007b60:	00813423          	sd	s0,8(sp)
    80007b64:	01010413          	addi	s0,sp,16
    80007b68:	00813403          	ld	s0,8(sp)
    80007b6c:	00005317          	auipc	t1,0x5
    80007b70:	2cc33303          	ld	t1,716(t1) # 8000ce38 <devsw+0x18>
    80007b74:	01010113          	addi	sp,sp,16
    80007b78:	00030067          	jr	t1

0000000080007b7c <panic>:
    80007b7c:	fe010113          	addi	sp,sp,-32
    80007b80:	00113c23          	sd	ra,24(sp)
    80007b84:	00813823          	sd	s0,16(sp)
    80007b88:	00913423          	sd	s1,8(sp)
    80007b8c:	02010413          	addi	s0,sp,32
    80007b90:	00050493          	mv	s1,a0
    80007b94:	00002517          	auipc	a0,0x2
    80007b98:	c6450513          	addi	a0,a0,-924 # 800097f8 <_ZZ9kPrintIntmE6digits+0x788>
    80007b9c:	00005797          	auipc	a5,0x5
    80007ba0:	3207ae23          	sw	zero,828(a5) # 8000ced8 <pr+0x18>
    80007ba4:	00000097          	auipc	ra,0x0
    80007ba8:	034080e7          	jalr	52(ra) # 80007bd8 <__printf>
    80007bac:	00048513          	mv	a0,s1
    80007bb0:	00000097          	auipc	ra,0x0
    80007bb4:	028080e7          	jalr	40(ra) # 80007bd8 <__printf>
    80007bb8:	00002517          	auipc	a0,0x2
    80007bbc:	9c850513          	addi	a0,a0,-1592 # 80009580 <_ZZ9kPrintIntmE6digits+0x510>
    80007bc0:	00000097          	auipc	ra,0x0
    80007bc4:	018080e7          	jalr	24(ra) # 80007bd8 <__printf>
    80007bc8:	00100793          	li	a5,1
    80007bcc:	00004717          	auipc	a4,0x4
    80007bd0:	f4f72e23          	sw	a5,-164(a4) # 8000bb28 <panicked>
    80007bd4:	0000006f          	j	80007bd4 <panic+0x58>

0000000080007bd8 <__printf>:
    80007bd8:	f3010113          	addi	sp,sp,-208
    80007bdc:	08813023          	sd	s0,128(sp)
    80007be0:	07313423          	sd	s3,104(sp)
    80007be4:	09010413          	addi	s0,sp,144
    80007be8:	05813023          	sd	s8,64(sp)
    80007bec:	08113423          	sd	ra,136(sp)
    80007bf0:	06913c23          	sd	s1,120(sp)
    80007bf4:	07213823          	sd	s2,112(sp)
    80007bf8:	07413023          	sd	s4,96(sp)
    80007bfc:	05513c23          	sd	s5,88(sp)
    80007c00:	05613823          	sd	s6,80(sp)
    80007c04:	05713423          	sd	s7,72(sp)
    80007c08:	03913c23          	sd	s9,56(sp)
    80007c0c:	03a13823          	sd	s10,48(sp)
    80007c10:	03b13423          	sd	s11,40(sp)
    80007c14:	00005317          	auipc	t1,0x5
    80007c18:	2ac30313          	addi	t1,t1,684 # 8000cec0 <pr>
    80007c1c:	01832c03          	lw	s8,24(t1)
    80007c20:	00b43423          	sd	a1,8(s0)
    80007c24:	00c43823          	sd	a2,16(s0)
    80007c28:	00d43c23          	sd	a3,24(s0)
    80007c2c:	02e43023          	sd	a4,32(s0)
    80007c30:	02f43423          	sd	a5,40(s0)
    80007c34:	03043823          	sd	a6,48(s0)
    80007c38:	03143c23          	sd	a7,56(s0)
    80007c3c:	00050993          	mv	s3,a0
    80007c40:	4a0c1663          	bnez	s8,800080ec <__printf+0x514>
    80007c44:	60098c63          	beqz	s3,8000825c <__printf+0x684>
    80007c48:	0009c503          	lbu	a0,0(s3)
    80007c4c:	00840793          	addi	a5,s0,8
    80007c50:	f6f43c23          	sd	a5,-136(s0)
    80007c54:	00000493          	li	s1,0
    80007c58:	22050063          	beqz	a0,80007e78 <__printf+0x2a0>
    80007c5c:	00002a37          	lui	s4,0x2
    80007c60:	00018ab7          	lui	s5,0x18
    80007c64:	000f4b37          	lui	s6,0xf4
    80007c68:	00989bb7          	lui	s7,0x989
    80007c6c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80007c70:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80007c74:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80007c78:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80007c7c:	00148c9b          	addiw	s9,s1,1
    80007c80:	02500793          	li	a5,37
    80007c84:	01998933          	add	s2,s3,s9
    80007c88:	38f51263          	bne	a0,a5,8000800c <__printf+0x434>
    80007c8c:	00094783          	lbu	a5,0(s2)
    80007c90:	00078c9b          	sext.w	s9,a5
    80007c94:	1e078263          	beqz	a5,80007e78 <__printf+0x2a0>
    80007c98:	0024849b          	addiw	s1,s1,2
    80007c9c:	07000713          	li	a4,112
    80007ca0:	00998933          	add	s2,s3,s1
    80007ca4:	38e78a63          	beq	a5,a4,80008038 <__printf+0x460>
    80007ca8:	20f76863          	bltu	a4,a5,80007eb8 <__printf+0x2e0>
    80007cac:	42a78863          	beq	a5,a0,800080dc <__printf+0x504>
    80007cb0:	06400713          	li	a4,100
    80007cb4:	40e79663          	bne	a5,a4,800080c0 <__printf+0x4e8>
    80007cb8:	f7843783          	ld	a5,-136(s0)
    80007cbc:	0007a603          	lw	a2,0(a5)
    80007cc0:	00878793          	addi	a5,a5,8
    80007cc4:	f6f43c23          	sd	a5,-136(s0)
    80007cc8:	42064a63          	bltz	a2,800080fc <__printf+0x524>
    80007ccc:	00a00713          	li	a4,10
    80007cd0:	02e677bb          	remuw	a5,a2,a4
    80007cd4:	00002d97          	auipc	s11,0x2
    80007cd8:	b4cd8d93          	addi	s11,s11,-1204 # 80009820 <digits>
    80007cdc:	00900593          	li	a1,9
    80007ce0:	0006051b          	sext.w	a0,a2
    80007ce4:	00000c93          	li	s9,0
    80007ce8:	02079793          	slli	a5,a5,0x20
    80007cec:	0207d793          	srli	a5,a5,0x20
    80007cf0:	00fd87b3          	add	a5,s11,a5
    80007cf4:	0007c783          	lbu	a5,0(a5)
    80007cf8:	02e656bb          	divuw	a3,a2,a4
    80007cfc:	f8f40023          	sb	a5,-128(s0)
    80007d00:	14c5d863          	bge	a1,a2,80007e50 <__printf+0x278>
    80007d04:	06300593          	li	a1,99
    80007d08:	00100c93          	li	s9,1
    80007d0c:	02e6f7bb          	remuw	a5,a3,a4
    80007d10:	02079793          	slli	a5,a5,0x20
    80007d14:	0207d793          	srli	a5,a5,0x20
    80007d18:	00fd87b3          	add	a5,s11,a5
    80007d1c:	0007c783          	lbu	a5,0(a5)
    80007d20:	02e6d73b          	divuw	a4,a3,a4
    80007d24:	f8f400a3          	sb	a5,-127(s0)
    80007d28:	12a5f463          	bgeu	a1,a0,80007e50 <__printf+0x278>
    80007d2c:	00a00693          	li	a3,10
    80007d30:	00900593          	li	a1,9
    80007d34:	02d777bb          	remuw	a5,a4,a3
    80007d38:	02079793          	slli	a5,a5,0x20
    80007d3c:	0207d793          	srli	a5,a5,0x20
    80007d40:	00fd87b3          	add	a5,s11,a5
    80007d44:	0007c503          	lbu	a0,0(a5)
    80007d48:	02d757bb          	divuw	a5,a4,a3
    80007d4c:	f8a40123          	sb	a0,-126(s0)
    80007d50:	48e5f263          	bgeu	a1,a4,800081d4 <__printf+0x5fc>
    80007d54:	06300513          	li	a0,99
    80007d58:	02d7f5bb          	remuw	a1,a5,a3
    80007d5c:	02059593          	slli	a1,a1,0x20
    80007d60:	0205d593          	srli	a1,a1,0x20
    80007d64:	00bd85b3          	add	a1,s11,a1
    80007d68:	0005c583          	lbu	a1,0(a1)
    80007d6c:	02d7d7bb          	divuw	a5,a5,a3
    80007d70:	f8b401a3          	sb	a1,-125(s0)
    80007d74:	48e57263          	bgeu	a0,a4,800081f8 <__printf+0x620>
    80007d78:	3e700513          	li	a0,999
    80007d7c:	02d7f5bb          	remuw	a1,a5,a3
    80007d80:	02059593          	slli	a1,a1,0x20
    80007d84:	0205d593          	srli	a1,a1,0x20
    80007d88:	00bd85b3          	add	a1,s11,a1
    80007d8c:	0005c583          	lbu	a1,0(a1)
    80007d90:	02d7d7bb          	divuw	a5,a5,a3
    80007d94:	f8b40223          	sb	a1,-124(s0)
    80007d98:	46e57663          	bgeu	a0,a4,80008204 <__printf+0x62c>
    80007d9c:	02d7f5bb          	remuw	a1,a5,a3
    80007da0:	02059593          	slli	a1,a1,0x20
    80007da4:	0205d593          	srli	a1,a1,0x20
    80007da8:	00bd85b3          	add	a1,s11,a1
    80007dac:	0005c583          	lbu	a1,0(a1)
    80007db0:	02d7d7bb          	divuw	a5,a5,a3
    80007db4:	f8b402a3          	sb	a1,-123(s0)
    80007db8:	46ea7863          	bgeu	s4,a4,80008228 <__printf+0x650>
    80007dbc:	02d7f5bb          	remuw	a1,a5,a3
    80007dc0:	02059593          	slli	a1,a1,0x20
    80007dc4:	0205d593          	srli	a1,a1,0x20
    80007dc8:	00bd85b3          	add	a1,s11,a1
    80007dcc:	0005c583          	lbu	a1,0(a1)
    80007dd0:	02d7d7bb          	divuw	a5,a5,a3
    80007dd4:	f8b40323          	sb	a1,-122(s0)
    80007dd8:	3eeaf863          	bgeu	s5,a4,800081c8 <__printf+0x5f0>
    80007ddc:	02d7f5bb          	remuw	a1,a5,a3
    80007de0:	02059593          	slli	a1,a1,0x20
    80007de4:	0205d593          	srli	a1,a1,0x20
    80007de8:	00bd85b3          	add	a1,s11,a1
    80007dec:	0005c583          	lbu	a1,0(a1)
    80007df0:	02d7d7bb          	divuw	a5,a5,a3
    80007df4:	f8b403a3          	sb	a1,-121(s0)
    80007df8:	42eb7e63          	bgeu	s6,a4,80008234 <__printf+0x65c>
    80007dfc:	02d7f5bb          	remuw	a1,a5,a3
    80007e00:	02059593          	slli	a1,a1,0x20
    80007e04:	0205d593          	srli	a1,a1,0x20
    80007e08:	00bd85b3          	add	a1,s11,a1
    80007e0c:	0005c583          	lbu	a1,0(a1)
    80007e10:	02d7d7bb          	divuw	a5,a5,a3
    80007e14:	f8b40423          	sb	a1,-120(s0)
    80007e18:	42ebfc63          	bgeu	s7,a4,80008250 <__printf+0x678>
    80007e1c:	02079793          	slli	a5,a5,0x20
    80007e20:	0207d793          	srli	a5,a5,0x20
    80007e24:	00fd8db3          	add	s11,s11,a5
    80007e28:	000dc703          	lbu	a4,0(s11)
    80007e2c:	00a00793          	li	a5,10
    80007e30:	00900c93          	li	s9,9
    80007e34:	f8e404a3          	sb	a4,-119(s0)
    80007e38:	00065c63          	bgez	a2,80007e50 <__printf+0x278>
    80007e3c:	f9040713          	addi	a4,s0,-112
    80007e40:	00f70733          	add	a4,a4,a5
    80007e44:	02d00693          	li	a3,45
    80007e48:	fed70823          	sb	a3,-16(a4)
    80007e4c:	00078c93          	mv	s9,a5
    80007e50:	f8040793          	addi	a5,s0,-128
    80007e54:	01978cb3          	add	s9,a5,s9
    80007e58:	f7f40d13          	addi	s10,s0,-129
    80007e5c:	000cc503          	lbu	a0,0(s9)
    80007e60:	fffc8c93          	addi	s9,s9,-1
    80007e64:	00000097          	auipc	ra,0x0
    80007e68:	b90080e7          	jalr	-1136(ra) # 800079f4 <consputc>
    80007e6c:	ffac98e3          	bne	s9,s10,80007e5c <__printf+0x284>
    80007e70:	00094503          	lbu	a0,0(s2)
    80007e74:	e00514e3          	bnez	a0,80007c7c <__printf+0xa4>
    80007e78:	1a0c1663          	bnez	s8,80008024 <__printf+0x44c>
    80007e7c:	08813083          	ld	ra,136(sp)
    80007e80:	08013403          	ld	s0,128(sp)
    80007e84:	07813483          	ld	s1,120(sp)
    80007e88:	07013903          	ld	s2,112(sp)
    80007e8c:	06813983          	ld	s3,104(sp)
    80007e90:	06013a03          	ld	s4,96(sp)
    80007e94:	05813a83          	ld	s5,88(sp)
    80007e98:	05013b03          	ld	s6,80(sp)
    80007e9c:	04813b83          	ld	s7,72(sp)
    80007ea0:	04013c03          	ld	s8,64(sp)
    80007ea4:	03813c83          	ld	s9,56(sp)
    80007ea8:	03013d03          	ld	s10,48(sp)
    80007eac:	02813d83          	ld	s11,40(sp)
    80007eb0:	0d010113          	addi	sp,sp,208
    80007eb4:	00008067          	ret
    80007eb8:	07300713          	li	a4,115
    80007ebc:	1ce78a63          	beq	a5,a4,80008090 <__printf+0x4b8>
    80007ec0:	07800713          	li	a4,120
    80007ec4:	1ee79e63          	bne	a5,a4,800080c0 <__printf+0x4e8>
    80007ec8:	f7843783          	ld	a5,-136(s0)
    80007ecc:	0007a703          	lw	a4,0(a5)
    80007ed0:	00878793          	addi	a5,a5,8
    80007ed4:	f6f43c23          	sd	a5,-136(s0)
    80007ed8:	28074263          	bltz	a4,8000815c <__printf+0x584>
    80007edc:	00002d97          	auipc	s11,0x2
    80007ee0:	944d8d93          	addi	s11,s11,-1724 # 80009820 <digits>
    80007ee4:	00f77793          	andi	a5,a4,15
    80007ee8:	00fd87b3          	add	a5,s11,a5
    80007eec:	0007c683          	lbu	a3,0(a5)
    80007ef0:	00f00613          	li	a2,15
    80007ef4:	0007079b          	sext.w	a5,a4
    80007ef8:	f8d40023          	sb	a3,-128(s0)
    80007efc:	0047559b          	srliw	a1,a4,0x4
    80007f00:	0047569b          	srliw	a3,a4,0x4
    80007f04:	00000c93          	li	s9,0
    80007f08:	0ee65063          	bge	a2,a4,80007fe8 <__printf+0x410>
    80007f0c:	00f6f693          	andi	a3,a3,15
    80007f10:	00dd86b3          	add	a3,s11,a3
    80007f14:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80007f18:	0087d79b          	srliw	a5,a5,0x8
    80007f1c:	00100c93          	li	s9,1
    80007f20:	f8d400a3          	sb	a3,-127(s0)
    80007f24:	0cb67263          	bgeu	a2,a1,80007fe8 <__printf+0x410>
    80007f28:	00f7f693          	andi	a3,a5,15
    80007f2c:	00dd86b3          	add	a3,s11,a3
    80007f30:	0006c583          	lbu	a1,0(a3)
    80007f34:	00f00613          	li	a2,15
    80007f38:	0047d69b          	srliw	a3,a5,0x4
    80007f3c:	f8b40123          	sb	a1,-126(s0)
    80007f40:	0047d593          	srli	a1,a5,0x4
    80007f44:	28f67e63          	bgeu	a2,a5,800081e0 <__printf+0x608>
    80007f48:	00f6f693          	andi	a3,a3,15
    80007f4c:	00dd86b3          	add	a3,s11,a3
    80007f50:	0006c503          	lbu	a0,0(a3)
    80007f54:	0087d813          	srli	a6,a5,0x8
    80007f58:	0087d69b          	srliw	a3,a5,0x8
    80007f5c:	f8a401a3          	sb	a0,-125(s0)
    80007f60:	28b67663          	bgeu	a2,a1,800081ec <__printf+0x614>
    80007f64:	00f6f693          	andi	a3,a3,15
    80007f68:	00dd86b3          	add	a3,s11,a3
    80007f6c:	0006c583          	lbu	a1,0(a3)
    80007f70:	00c7d513          	srli	a0,a5,0xc
    80007f74:	00c7d69b          	srliw	a3,a5,0xc
    80007f78:	f8b40223          	sb	a1,-124(s0)
    80007f7c:	29067a63          	bgeu	a2,a6,80008210 <__printf+0x638>
    80007f80:	00f6f693          	andi	a3,a3,15
    80007f84:	00dd86b3          	add	a3,s11,a3
    80007f88:	0006c583          	lbu	a1,0(a3)
    80007f8c:	0107d813          	srli	a6,a5,0x10
    80007f90:	0107d69b          	srliw	a3,a5,0x10
    80007f94:	f8b402a3          	sb	a1,-123(s0)
    80007f98:	28a67263          	bgeu	a2,a0,8000821c <__printf+0x644>
    80007f9c:	00f6f693          	andi	a3,a3,15
    80007fa0:	00dd86b3          	add	a3,s11,a3
    80007fa4:	0006c683          	lbu	a3,0(a3)
    80007fa8:	0147d79b          	srliw	a5,a5,0x14
    80007fac:	f8d40323          	sb	a3,-122(s0)
    80007fb0:	21067663          	bgeu	a2,a6,800081bc <__printf+0x5e4>
    80007fb4:	02079793          	slli	a5,a5,0x20
    80007fb8:	0207d793          	srli	a5,a5,0x20
    80007fbc:	00fd8db3          	add	s11,s11,a5
    80007fc0:	000dc683          	lbu	a3,0(s11)
    80007fc4:	00800793          	li	a5,8
    80007fc8:	00700c93          	li	s9,7
    80007fcc:	f8d403a3          	sb	a3,-121(s0)
    80007fd0:	00075c63          	bgez	a4,80007fe8 <__printf+0x410>
    80007fd4:	f9040713          	addi	a4,s0,-112
    80007fd8:	00f70733          	add	a4,a4,a5
    80007fdc:	02d00693          	li	a3,45
    80007fe0:	fed70823          	sb	a3,-16(a4)
    80007fe4:	00078c93          	mv	s9,a5
    80007fe8:	f8040793          	addi	a5,s0,-128
    80007fec:	01978cb3          	add	s9,a5,s9
    80007ff0:	f7f40d13          	addi	s10,s0,-129
    80007ff4:	000cc503          	lbu	a0,0(s9)
    80007ff8:	fffc8c93          	addi	s9,s9,-1
    80007ffc:	00000097          	auipc	ra,0x0
    80008000:	9f8080e7          	jalr	-1544(ra) # 800079f4 <consputc>
    80008004:	ff9d18e3          	bne	s10,s9,80007ff4 <__printf+0x41c>
    80008008:	0100006f          	j	80008018 <__printf+0x440>
    8000800c:	00000097          	auipc	ra,0x0
    80008010:	9e8080e7          	jalr	-1560(ra) # 800079f4 <consputc>
    80008014:	000c8493          	mv	s1,s9
    80008018:	00094503          	lbu	a0,0(s2)
    8000801c:	c60510e3          	bnez	a0,80007c7c <__printf+0xa4>
    80008020:	e40c0ee3          	beqz	s8,80007e7c <__printf+0x2a4>
    80008024:	00005517          	auipc	a0,0x5
    80008028:	e9c50513          	addi	a0,a0,-356 # 8000cec0 <pr>
    8000802c:	00001097          	auipc	ra,0x1
    80008030:	94c080e7          	jalr	-1716(ra) # 80008978 <release>
    80008034:	e49ff06f          	j	80007e7c <__printf+0x2a4>
    80008038:	f7843783          	ld	a5,-136(s0)
    8000803c:	03000513          	li	a0,48
    80008040:	01000d13          	li	s10,16
    80008044:	00878713          	addi	a4,a5,8
    80008048:	0007bc83          	ld	s9,0(a5)
    8000804c:	f6e43c23          	sd	a4,-136(s0)
    80008050:	00000097          	auipc	ra,0x0
    80008054:	9a4080e7          	jalr	-1628(ra) # 800079f4 <consputc>
    80008058:	07800513          	li	a0,120
    8000805c:	00000097          	auipc	ra,0x0
    80008060:	998080e7          	jalr	-1640(ra) # 800079f4 <consputc>
    80008064:	00001d97          	auipc	s11,0x1
    80008068:	7bcd8d93          	addi	s11,s11,1980 # 80009820 <digits>
    8000806c:	03ccd793          	srli	a5,s9,0x3c
    80008070:	00fd87b3          	add	a5,s11,a5
    80008074:	0007c503          	lbu	a0,0(a5)
    80008078:	fffd0d1b          	addiw	s10,s10,-1
    8000807c:	004c9c93          	slli	s9,s9,0x4
    80008080:	00000097          	auipc	ra,0x0
    80008084:	974080e7          	jalr	-1676(ra) # 800079f4 <consputc>
    80008088:	fe0d12e3          	bnez	s10,8000806c <__printf+0x494>
    8000808c:	f8dff06f          	j	80008018 <__printf+0x440>
    80008090:	f7843783          	ld	a5,-136(s0)
    80008094:	0007bc83          	ld	s9,0(a5)
    80008098:	00878793          	addi	a5,a5,8
    8000809c:	f6f43c23          	sd	a5,-136(s0)
    800080a0:	000c9a63          	bnez	s9,800080b4 <__printf+0x4dc>
    800080a4:	1080006f          	j	800081ac <__printf+0x5d4>
    800080a8:	001c8c93          	addi	s9,s9,1
    800080ac:	00000097          	auipc	ra,0x0
    800080b0:	948080e7          	jalr	-1720(ra) # 800079f4 <consputc>
    800080b4:	000cc503          	lbu	a0,0(s9)
    800080b8:	fe0518e3          	bnez	a0,800080a8 <__printf+0x4d0>
    800080bc:	f5dff06f          	j	80008018 <__printf+0x440>
    800080c0:	02500513          	li	a0,37
    800080c4:	00000097          	auipc	ra,0x0
    800080c8:	930080e7          	jalr	-1744(ra) # 800079f4 <consputc>
    800080cc:	000c8513          	mv	a0,s9
    800080d0:	00000097          	auipc	ra,0x0
    800080d4:	924080e7          	jalr	-1756(ra) # 800079f4 <consputc>
    800080d8:	f41ff06f          	j	80008018 <__printf+0x440>
    800080dc:	02500513          	li	a0,37
    800080e0:	00000097          	auipc	ra,0x0
    800080e4:	914080e7          	jalr	-1772(ra) # 800079f4 <consputc>
    800080e8:	f31ff06f          	j	80008018 <__printf+0x440>
    800080ec:	00030513          	mv	a0,t1
    800080f0:	00000097          	auipc	ra,0x0
    800080f4:	7bc080e7          	jalr	1980(ra) # 800088ac <acquire>
    800080f8:	b4dff06f          	j	80007c44 <__printf+0x6c>
    800080fc:	40c0053b          	negw	a0,a2
    80008100:	00a00713          	li	a4,10
    80008104:	02e576bb          	remuw	a3,a0,a4
    80008108:	00001d97          	auipc	s11,0x1
    8000810c:	718d8d93          	addi	s11,s11,1816 # 80009820 <digits>
    80008110:	ff700593          	li	a1,-9
    80008114:	02069693          	slli	a3,a3,0x20
    80008118:	0206d693          	srli	a3,a3,0x20
    8000811c:	00dd86b3          	add	a3,s11,a3
    80008120:	0006c683          	lbu	a3,0(a3)
    80008124:	02e557bb          	divuw	a5,a0,a4
    80008128:	f8d40023          	sb	a3,-128(s0)
    8000812c:	10b65e63          	bge	a2,a1,80008248 <__printf+0x670>
    80008130:	06300593          	li	a1,99
    80008134:	02e7f6bb          	remuw	a3,a5,a4
    80008138:	02069693          	slli	a3,a3,0x20
    8000813c:	0206d693          	srli	a3,a3,0x20
    80008140:	00dd86b3          	add	a3,s11,a3
    80008144:	0006c683          	lbu	a3,0(a3)
    80008148:	02e7d73b          	divuw	a4,a5,a4
    8000814c:	00200793          	li	a5,2
    80008150:	f8d400a3          	sb	a3,-127(s0)
    80008154:	bca5ece3          	bltu	a1,a0,80007d2c <__printf+0x154>
    80008158:	ce5ff06f          	j	80007e3c <__printf+0x264>
    8000815c:	40e007bb          	negw	a5,a4
    80008160:	00001d97          	auipc	s11,0x1
    80008164:	6c0d8d93          	addi	s11,s11,1728 # 80009820 <digits>
    80008168:	00f7f693          	andi	a3,a5,15
    8000816c:	00dd86b3          	add	a3,s11,a3
    80008170:	0006c583          	lbu	a1,0(a3)
    80008174:	ff100613          	li	a2,-15
    80008178:	0047d69b          	srliw	a3,a5,0x4
    8000817c:	f8b40023          	sb	a1,-128(s0)
    80008180:	0047d59b          	srliw	a1,a5,0x4
    80008184:	0ac75e63          	bge	a4,a2,80008240 <__printf+0x668>
    80008188:	00f6f693          	andi	a3,a3,15
    8000818c:	00dd86b3          	add	a3,s11,a3
    80008190:	0006c603          	lbu	a2,0(a3)
    80008194:	00f00693          	li	a3,15
    80008198:	0087d79b          	srliw	a5,a5,0x8
    8000819c:	f8c400a3          	sb	a2,-127(s0)
    800081a0:	d8b6e4e3          	bltu	a3,a1,80007f28 <__printf+0x350>
    800081a4:	00200793          	li	a5,2
    800081a8:	e2dff06f          	j	80007fd4 <__printf+0x3fc>
    800081ac:	00001c97          	auipc	s9,0x1
    800081b0:	654c8c93          	addi	s9,s9,1620 # 80009800 <_ZZ9kPrintIntmE6digits+0x790>
    800081b4:	02800513          	li	a0,40
    800081b8:	ef1ff06f          	j	800080a8 <__printf+0x4d0>
    800081bc:	00700793          	li	a5,7
    800081c0:	00600c93          	li	s9,6
    800081c4:	e0dff06f          	j	80007fd0 <__printf+0x3f8>
    800081c8:	00700793          	li	a5,7
    800081cc:	00600c93          	li	s9,6
    800081d0:	c69ff06f          	j	80007e38 <__printf+0x260>
    800081d4:	00300793          	li	a5,3
    800081d8:	00200c93          	li	s9,2
    800081dc:	c5dff06f          	j	80007e38 <__printf+0x260>
    800081e0:	00300793          	li	a5,3
    800081e4:	00200c93          	li	s9,2
    800081e8:	de9ff06f          	j	80007fd0 <__printf+0x3f8>
    800081ec:	00400793          	li	a5,4
    800081f0:	00300c93          	li	s9,3
    800081f4:	dddff06f          	j	80007fd0 <__printf+0x3f8>
    800081f8:	00400793          	li	a5,4
    800081fc:	00300c93          	li	s9,3
    80008200:	c39ff06f          	j	80007e38 <__printf+0x260>
    80008204:	00500793          	li	a5,5
    80008208:	00400c93          	li	s9,4
    8000820c:	c2dff06f          	j	80007e38 <__printf+0x260>
    80008210:	00500793          	li	a5,5
    80008214:	00400c93          	li	s9,4
    80008218:	db9ff06f          	j	80007fd0 <__printf+0x3f8>
    8000821c:	00600793          	li	a5,6
    80008220:	00500c93          	li	s9,5
    80008224:	dadff06f          	j	80007fd0 <__printf+0x3f8>
    80008228:	00600793          	li	a5,6
    8000822c:	00500c93          	li	s9,5
    80008230:	c09ff06f          	j	80007e38 <__printf+0x260>
    80008234:	00800793          	li	a5,8
    80008238:	00700c93          	li	s9,7
    8000823c:	bfdff06f          	j	80007e38 <__printf+0x260>
    80008240:	00100793          	li	a5,1
    80008244:	d91ff06f          	j	80007fd4 <__printf+0x3fc>
    80008248:	00100793          	li	a5,1
    8000824c:	bf1ff06f          	j	80007e3c <__printf+0x264>
    80008250:	00900793          	li	a5,9
    80008254:	00800c93          	li	s9,8
    80008258:	be1ff06f          	j	80007e38 <__printf+0x260>
    8000825c:	00001517          	auipc	a0,0x1
    80008260:	5ac50513          	addi	a0,a0,1452 # 80009808 <_ZZ9kPrintIntmE6digits+0x798>
    80008264:	00000097          	auipc	ra,0x0
    80008268:	918080e7          	jalr	-1768(ra) # 80007b7c <panic>

000000008000826c <printfinit>:
    8000826c:	fe010113          	addi	sp,sp,-32
    80008270:	00813823          	sd	s0,16(sp)
    80008274:	00913423          	sd	s1,8(sp)
    80008278:	00113c23          	sd	ra,24(sp)
    8000827c:	02010413          	addi	s0,sp,32
    80008280:	00005497          	auipc	s1,0x5
    80008284:	c4048493          	addi	s1,s1,-960 # 8000cec0 <pr>
    80008288:	00048513          	mv	a0,s1
    8000828c:	00001597          	auipc	a1,0x1
    80008290:	58c58593          	addi	a1,a1,1420 # 80009818 <_ZZ9kPrintIntmE6digits+0x7a8>
    80008294:	00000097          	auipc	ra,0x0
    80008298:	5f4080e7          	jalr	1524(ra) # 80008888 <initlock>
    8000829c:	01813083          	ld	ra,24(sp)
    800082a0:	01013403          	ld	s0,16(sp)
    800082a4:	0004ac23          	sw	zero,24(s1)
    800082a8:	00813483          	ld	s1,8(sp)
    800082ac:	02010113          	addi	sp,sp,32
    800082b0:	00008067          	ret

00000000800082b4 <uartinit>:
    800082b4:	ff010113          	addi	sp,sp,-16
    800082b8:	00813423          	sd	s0,8(sp)
    800082bc:	01010413          	addi	s0,sp,16
    800082c0:	100007b7          	lui	a5,0x10000
    800082c4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800082c8:	f8000713          	li	a4,-128
    800082cc:	00e781a3          	sb	a4,3(a5)
    800082d0:	00300713          	li	a4,3
    800082d4:	00e78023          	sb	a4,0(a5)
    800082d8:	000780a3          	sb	zero,1(a5)
    800082dc:	00e781a3          	sb	a4,3(a5)
    800082e0:	00700693          	li	a3,7
    800082e4:	00d78123          	sb	a3,2(a5)
    800082e8:	00e780a3          	sb	a4,1(a5)
    800082ec:	00813403          	ld	s0,8(sp)
    800082f0:	01010113          	addi	sp,sp,16
    800082f4:	00008067          	ret

00000000800082f8 <uartputc>:
    800082f8:	00004797          	auipc	a5,0x4
    800082fc:	8307a783          	lw	a5,-2000(a5) # 8000bb28 <panicked>
    80008300:	00078463          	beqz	a5,80008308 <uartputc+0x10>
    80008304:	0000006f          	j	80008304 <uartputc+0xc>
    80008308:	fd010113          	addi	sp,sp,-48
    8000830c:	02813023          	sd	s0,32(sp)
    80008310:	00913c23          	sd	s1,24(sp)
    80008314:	01213823          	sd	s2,16(sp)
    80008318:	01313423          	sd	s3,8(sp)
    8000831c:	02113423          	sd	ra,40(sp)
    80008320:	03010413          	addi	s0,sp,48
    80008324:	00004917          	auipc	s2,0x4
    80008328:	80c90913          	addi	s2,s2,-2036 # 8000bb30 <uart_tx_r>
    8000832c:	00093783          	ld	a5,0(s2)
    80008330:	00004497          	auipc	s1,0x4
    80008334:	80848493          	addi	s1,s1,-2040 # 8000bb38 <uart_tx_w>
    80008338:	0004b703          	ld	a4,0(s1)
    8000833c:	02078693          	addi	a3,a5,32
    80008340:	00050993          	mv	s3,a0
    80008344:	02e69c63          	bne	a3,a4,8000837c <uartputc+0x84>
    80008348:	00001097          	auipc	ra,0x1
    8000834c:	834080e7          	jalr	-1996(ra) # 80008b7c <push_on>
    80008350:	00093783          	ld	a5,0(s2)
    80008354:	0004b703          	ld	a4,0(s1)
    80008358:	02078793          	addi	a5,a5,32
    8000835c:	00e79463          	bne	a5,a4,80008364 <uartputc+0x6c>
    80008360:	0000006f          	j	80008360 <uartputc+0x68>
    80008364:	00001097          	auipc	ra,0x1
    80008368:	88c080e7          	jalr	-1908(ra) # 80008bf0 <pop_on>
    8000836c:	00093783          	ld	a5,0(s2)
    80008370:	0004b703          	ld	a4,0(s1)
    80008374:	02078693          	addi	a3,a5,32
    80008378:	fce688e3          	beq	a3,a4,80008348 <uartputc+0x50>
    8000837c:	01f77693          	andi	a3,a4,31
    80008380:	00005597          	auipc	a1,0x5
    80008384:	b6058593          	addi	a1,a1,-1184 # 8000cee0 <uart_tx_buf>
    80008388:	00d586b3          	add	a3,a1,a3
    8000838c:	00170713          	addi	a4,a4,1
    80008390:	01368023          	sb	s3,0(a3)
    80008394:	00e4b023          	sd	a4,0(s1)
    80008398:	10000637          	lui	a2,0x10000
    8000839c:	02f71063          	bne	a4,a5,800083bc <uartputc+0xc4>
    800083a0:	0340006f          	j	800083d4 <uartputc+0xdc>
    800083a4:	00074703          	lbu	a4,0(a4)
    800083a8:	00f93023          	sd	a5,0(s2)
    800083ac:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800083b0:	00093783          	ld	a5,0(s2)
    800083b4:	0004b703          	ld	a4,0(s1)
    800083b8:	00f70e63          	beq	a4,a5,800083d4 <uartputc+0xdc>
    800083bc:	00564683          	lbu	a3,5(a2)
    800083c0:	01f7f713          	andi	a4,a5,31
    800083c4:	00e58733          	add	a4,a1,a4
    800083c8:	0206f693          	andi	a3,a3,32
    800083cc:	00178793          	addi	a5,a5,1
    800083d0:	fc069ae3          	bnez	a3,800083a4 <uartputc+0xac>
    800083d4:	02813083          	ld	ra,40(sp)
    800083d8:	02013403          	ld	s0,32(sp)
    800083dc:	01813483          	ld	s1,24(sp)
    800083e0:	01013903          	ld	s2,16(sp)
    800083e4:	00813983          	ld	s3,8(sp)
    800083e8:	03010113          	addi	sp,sp,48
    800083ec:	00008067          	ret

00000000800083f0 <uartputc_sync>:
    800083f0:	ff010113          	addi	sp,sp,-16
    800083f4:	00813423          	sd	s0,8(sp)
    800083f8:	01010413          	addi	s0,sp,16
    800083fc:	00003717          	auipc	a4,0x3
    80008400:	72c72703          	lw	a4,1836(a4) # 8000bb28 <panicked>
    80008404:	02071663          	bnez	a4,80008430 <uartputc_sync+0x40>
    80008408:	00050793          	mv	a5,a0
    8000840c:	100006b7          	lui	a3,0x10000
    80008410:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80008414:	02077713          	andi	a4,a4,32
    80008418:	fe070ce3          	beqz	a4,80008410 <uartputc_sync+0x20>
    8000841c:	0ff7f793          	andi	a5,a5,255
    80008420:	00f68023          	sb	a5,0(a3)
    80008424:	00813403          	ld	s0,8(sp)
    80008428:	01010113          	addi	sp,sp,16
    8000842c:	00008067          	ret
    80008430:	0000006f          	j	80008430 <uartputc_sync+0x40>

0000000080008434 <uartstart>:
    80008434:	ff010113          	addi	sp,sp,-16
    80008438:	00813423          	sd	s0,8(sp)
    8000843c:	01010413          	addi	s0,sp,16
    80008440:	00003617          	auipc	a2,0x3
    80008444:	6f060613          	addi	a2,a2,1776 # 8000bb30 <uart_tx_r>
    80008448:	00003517          	auipc	a0,0x3
    8000844c:	6f050513          	addi	a0,a0,1776 # 8000bb38 <uart_tx_w>
    80008450:	00063783          	ld	a5,0(a2)
    80008454:	00053703          	ld	a4,0(a0)
    80008458:	04f70263          	beq	a4,a5,8000849c <uartstart+0x68>
    8000845c:	100005b7          	lui	a1,0x10000
    80008460:	00005817          	auipc	a6,0x5
    80008464:	a8080813          	addi	a6,a6,-1408 # 8000cee0 <uart_tx_buf>
    80008468:	01c0006f          	j	80008484 <uartstart+0x50>
    8000846c:	0006c703          	lbu	a4,0(a3)
    80008470:	00f63023          	sd	a5,0(a2)
    80008474:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80008478:	00063783          	ld	a5,0(a2)
    8000847c:	00053703          	ld	a4,0(a0)
    80008480:	00f70e63          	beq	a4,a5,8000849c <uartstart+0x68>
    80008484:	01f7f713          	andi	a4,a5,31
    80008488:	00e806b3          	add	a3,a6,a4
    8000848c:	0055c703          	lbu	a4,5(a1)
    80008490:	00178793          	addi	a5,a5,1
    80008494:	02077713          	andi	a4,a4,32
    80008498:	fc071ae3          	bnez	a4,8000846c <uartstart+0x38>
    8000849c:	00813403          	ld	s0,8(sp)
    800084a0:	01010113          	addi	sp,sp,16
    800084a4:	00008067          	ret

00000000800084a8 <uartgetc>:
    800084a8:	ff010113          	addi	sp,sp,-16
    800084ac:	00813423          	sd	s0,8(sp)
    800084b0:	01010413          	addi	s0,sp,16
    800084b4:	10000737          	lui	a4,0x10000
    800084b8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800084bc:	0017f793          	andi	a5,a5,1
    800084c0:	00078c63          	beqz	a5,800084d8 <uartgetc+0x30>
    800084c4:	00074503          	lbu	a0,0(a4)
    800084c8:	0ff57513          	andi	a0,a0,255
    800084cc:	00813403          	ld	s0,8(sp)
    800084d0:	01010113          	addi	sp,sp,16
    800084d4:	00008067          	ret
    800084d8:	fff00513          	li	a0,-1
    800084dc:	ff1ff06f          	j	800084cc <uartgetc+0x24>

00000000800084e0 <uartintr>:
    800084e0:	100007b7          	lui	a5,0x10000
    800084e4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800084e8:	0017f793          	andi	a5,a5,1
    800084ec:	0a078463          	beqz	a5,80008594 <uartintr+0xb4>
    800084f0:	fe010113          	addi	sp,sp,-32
    800084f4:	00813823          	sd	s0,16(sp)
    800084f8:	00913423          	sd	s1,8(sp)
    800084fc:	00113c23          	sd	ra,24(sp)
    80008500:	02010413          	addi	s0,sp,32
    80008504:	100004b7          	lui	s1,0x10000
    80008508:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000850c:	0ff57513          	andi	a0,a0,255
    80008510:	fffff097          	auipc	ra,0xfffff
    80008514:	534080e7          	jalr	1332(ra) # 80007a44 <consoleintr>
    80008518:	0054c783          	lbu	a5,5(s1)
    8000851c:	0017f793          	andi	a5,a5,1
    80008520:	fe0794e3          	bnez	a5,80008508 <uartintr+0x28>
    80008524:	00003617          	auipc	a2,0x3
    80008528:	60c60613          	addi	a2,a2,1548 # 8000bb30 <uart_tx_r>
    8000852c:	00003517          	auipc	a0,0x3
    80008530:	60c50513          	addi	a0,a0,1548 # 8000bb38 <uart_tx_w>
    80008534:	00063783          	ld	a5,0(a2)
    80008538:	00053703          	ld	a4,0(a0)
    8000853c:	04f70263          	beq	a4,a5,80008580 <uartintr+0xa0>
    80008540:	100005b7          	lui	a1,0x10000
    80008544:	00005817          	auipc	a6,0x5
    80008548:	99c80813          	addi	a6,a6,-1636 # 8000cee0 <uart_tx_buf>
    8000854c:	01c0006f          	j	80008568 <uartintr+0x88>
    80008550:	0006c703          	lbu	a4,0(a3)
    80008554:	00f63023          	sd	a5,0(a2)
    80008558:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000855c:	00063783          	ld	a5,0(a2)
    80008560:	00053703          	ld	a4,0(a0)
    80008564:	00f70e63          	beq	a4,a5,80008580 <uartintr+0xa0>
    80008568:	01f7f713          	andi	a4,a5,31
    8000856c:	00e806b3          	add	a3,a6,a4
    80008570:	0055c703          	lbu	a4,5(a1)
    80008574:	00178793          	addi	a5,a5,1
    80008578:	02077713          	andi	a4,a4,32
    8000857c:	fc071ae3          	bnez	a4,80008550 <uartintr+0x70>
    80008580:	01813083          	ld	ra,24(sp)
    80008584:	01013403          	ld	s0,16(sp)
    80008588:	00813483          	ld	s1,8(sp)
    8000858c:	02010113          	addi	sp,sp,32
    80008590:	00008067          	ret
    80008594:	00003617          	auipc	a2,0x3
    80008598:	59c60613          	addi	a2,a2,1436 # 8000bb30 <uart_tx_r>
    8000859c:	00003517          	auipc	a0,0x3
    800085a0:	59c50513          	addi	a0,a0,1436 # 8000bb38 <uart_tx_w>
    800085a4:	00063783          	ld	a5,0(a2)
    800085a8:	00053703          	ld	a4,0(a0)
    800085ac:	04f70263          	beq	a4,a5,800085f0 <uartintr+0x110>
    800085b0:	100005b7          	lui	a1,0x10000
    800085b4:	00005817          	auipc	a6,0x5
    800085b8:	92c80813          	addi	a6,a6,-1748 # 8000cee0 <uart_tx_buf>
    800085bc:	01c0006f          	j	800085d8 <uartintr+0xf8>
    800085c0:	0006c703          	lbu	a4,0(a3)
    800085c4:	00f63023          	sd	a5,0(a2)
    800085c8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800085cc:	00063783          	ld	a5,0(a2)
    800085d0:	00053703          	ld	a4,0(a0)
    800085d4:	02f70063          	beq	a4,a5,800085f4 <uartintr+0x114>
    800085d8:	01f7f713          	andi	a4,a5,31
    800085dc:	00e806b3          	add	a3,a6,a4
    800085e0:	0055c703          	lbu	a4,5(a1)
    800085e4:	00178793          	addi	a5,a5,1
    800085e8:	02077713          	andi	a4,a4,32
    800085ec:	fc071ae3          	bnez	a4,800085c0 <uartintr+0xe0>
    800085f0:	00008067          	ret
    800085f4:	00008067          	ret

00000000800085f8 <kinit>:
    800085f8:	fc010113          	addi	sp,sp,-64
    800085fc:	02913423          	sd	s1,40(sp)
    80008600:	fffff7b7          	lui	a5,0xfffff
    80008604:	00006497          	auipc	s1,0x6
    80008608:	8fb48493          	addi	s1,s1,-1797 # 8000deff <end+0xfff>
    8000860c:	02813823          	sd	s0,48(sp)
    80008610:	01313c23          	sd	s3,24(sp)
    80008614:	00f4f4b3          	and	s1,s1,a5
    80008618:	02113c23          	sd	ra,56(sp)
    8000861c:	03213023          	sd	s2,32(sp)
    80008620:	01413823          	sd	s4,16(sp)
    80008624:	01513423          	sd	s5,8(sp)
    80008628:	04010413          	addi	s0,sp,64
    8000862c:	000017b7          	lui	a5,0x1
    80008630:	01100993          	li	s3,17
    80008634:	00f487b3          	add	a5,s1,a5
    80008638:	01b99993          	slli	s3,s3,0x1b
    8000863c:	06f9e063          	bltu	s3,a5,8000869c <kinit+0xa4>
    80008640:	00005a97          	auipc	s5,0x5
    80008644:	8c0a8a93          	addi	s5,s5,-1856 # 8000cf00 <end>
    80008648:	0754ec63          	bltu	s1,s5,800086c0 <kinit+0xc8>
    8000864c:	0734fa63          	bgeu	s1,s3,800086c0 <kinit+0xc8>
    80008650:	00088a37          	lui	s4,0x88
    80008654:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80008658:	00003917          	auipc	s2,0x3
    8000865c:	4e890913          	addi	s2,s2,1256 # 8000bb40 <kmem>
    80008660:	00ca1a13          	slli	s4,s4,0xc
    80008664:	0140006f          	j	80008678 <kinit+0x80>
    80008668:	000017b7          	lui	a5,0x1
    8000866c:	00f484b3          	add	s1,s1,a5
    80008670:	0554e863          	bltu	s1,s5,800086c0 <kinit+0xc8>
    80008674:	0534f663          	bgeu	s1,s3,800086c0 <kinit+0xc8>
    80008678:	00001637          	lui	a2,0x1
    8000867c:	00100593          	li	a1,1
    80008680:	00048513          	mv	a0,s1
    80008684:	00000097          	auipc	ra,0x0
    80008688:	5e4080e7          	jalr	1508(ra) # 80008c68 <__memset>
    8000868c:	00093783          	ld	a5,0(s2)
    80008690:	00f4b023          	sd	a5,0(s1)
    80008694:	00993023          	sd	s1,0(s2)
    80008698:	fd4498e3          	bne	s1,s4,80008668 <kinit+0x70>
    8000869c:	03813083          	ld	ra,56(sp)
    800086a0:	03013403          	ld	s0,48(sp)
    800086a4:	02813483          	ld	s1,40(sp)
    800086a8:	02013903          	ld	s2,32(sp)
    800086ac:	01813983          	ld	s3,24(sp)
    800086b0:	01013a03          	ld	s4,16(sp)
    800086b4:	00813a83          	ld	s5,8(sp)
    800086b8:	04010113          	addi	sp,sp,64
    800086bc:	00008067          	ret
    800086c0:	00001517          	auipc	a0,0x1
    800086c4:	17850513          	addi	a0,a0,376 # 80009838 <digits+0x18>
    800086c8:	fffff097          	auipc	ra,0xfffff
    800086cc:	4b4080e7          	jalr	1204(ra) # 80007b7c <panic>

00000000800086d0 <freerange>:
    800086d0:	fc010113          	addi	sp,sp,-64
    800086d4:	000017b7          	lui	a5,0x1
    800086d8:	02913423          	sd	s1,40(sp)
    800086dc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800086e0:	009504b3          	add	s1,a0,s1
    800086e4:	fffff537          	lui	a0,0xfffff
    800086e8:	02813823          	sd	s0,48(sp)
    800086ec:	02113c23          	sd	ra,56(sp)
    800086f0:	03213023          	sd	s2,32(sp)
    800086f4:	01313c23          	sd	s3,24(sp)
    800086f8:	01413823          	sd	s4,16(sp)
    800086fc:	01513423          	sd	s5,8(sp)
    80008700:	01613023          	sd	s6,0(sp)
    80008704:	04010413          	addi	s0,sp,64
    80008708:	00a4f4b3          	and	s1,s1,a0
    8000870c:	00f487b3          	add	a5,s1,a5
    80008710:	06f5e463          	bltu	a1,a5,80008778 <freerange+0xa8>
    80008714:	00004a97          	auipc	s5,0x4
    80008718:	7eca8a93          	addi	s5,s5,2028 # 8000cf00 <end>
    8000871c:	0954e263          	bltu	s1,s5,800087a0 <freerange+0xd0>
    80008720:	01100993          	li	s3,17
    80008724:	01b99993          	slli	s3,s3,0x1b
    80008728:	0734fc63          	bgeu	s1,s3,800087a0 <freerange+0xd0>
    8000872c:	00058a13          	mv	s4,a1
    80008730:	00003917          	auipc	s2,0x3
    80008734:	41090913          	addi	s2,s2,1040 # 8000bb40 <kmem>
    80008738:	00002b37          	lui	s6,0x2
    8000873c:	0140006f          	j	80008750 <freerange+0x80>
    80008740:	000017b7          	lui	a5,0x1
    80008744:	00f484b3          	add	s1,s1,a5
    80008748:	0554ec63          	bltu	s1,s5,800087a0 <freerange+0xd0>
    8000874c:	0534fa63          	bgeu	s1,s3,800087a0 <freerange+0xd0>
    80008750:	00001637          	lui	a2,0x1
    80008754:	00100593          	li	a1,1
    80008758:	00048513          	mv	a0,s1
    8000875c:	00000097          	auipc	ra,0x0
    80008760:	50c080e7          	jalr	1292(ra) # 80008c68 <__memset>
    80008764:	00093703          	ld	a4,0(s2)
    80008768:	016487b3          	add	a5,s1,s6
    8000876c:	00e4b023          	sd	a4,0(s1)
    80008770:	00993023          	sd	s1,0(s2)
    80008774:	fcfa76e3          	bgeu	s4,a5,80008740 <freerange+0x70>
    80008778:	03813083          	ld	ra,56(sp)
    8000877c:	03013403          	ld	s0,48(sp)
    80008780:	02813483          	ld	s1,40(sp)
    80008784:	02013903          	ld	s2,32(sp)
    80008788:	01813983          	ld	s3,24(sp)
    8000878c:	01013a03          	ld	s4,16(sp)
    80008790:	00813a83          	ld	s5,8(sp)
    80008794:	00013b03          	ld	s6,0(sp)
    80008798:	04010113          	addi	sp,sp,64
    8000879c:	00008067          	ret
    800087a0:	00001517          	auipc	a0,0x1
    800087a4:	09850513          	addi	a0,a0,152 # 80009838 <digits+0x18>
    800087a8:	fffff097          	auipc	ra,0xfffff
    800087ac:	3d4080e7          	jalr	980(ra) # 80007b7c <panic>

00000000800087b0 <kfree>:
    800087b0:	fe010113          	addi	sp,sp,-32
    800087b4:	00813823          	sd	s0,16(sp)
    800087b8:	00113c23          	sd	ra,24(sp)
    800087bc:	00913423          	sd	s1,8(sp)
    800087c0:	02010413          	addi	s0,sp,32
    800087c4:	03451793          	slli	a5,a0,0x34
    800087c8:	04079c63          	bnez	a5,80008820 <kfree+0x70>
    800087cc:	00004797          	auipc	a5,0x4
    800087d0:	73478793          	addi	a5,a5,1844 # 8000cf00 <end>
    800087d4:	00050493          	mv	s1,a0
    800087d8:	04f56463          	bltu	a0,a5,80008820 <kfree+0x70>
    800087dc:	01100793          	li	a5,17
    800087e0:	01b79793          	slli	a5,a5,0x1b
    800087e4:	02f57e63          	bgeu	a0,a5,80008820 <kfree+0x70>
    800087e8:	00001637          	lui	a2,0x1
    800087ec:	00100593          	li	a1,1
    800087f0:	00000097          	auipc	ra,0x0
    800087f4:	478080e7          	jalr	1144(ra) # 80008c68 <__memset>
    800087f8:	00003797          	auipc	a5,0x3
    800087fc:	34878793          	addi	a5,a5,840 # 8000bb40 <kmem>
    80008800:	0007b703          	ld	a4,0(a5)
    80008804:	01813083          	ld	ra,24(sp)
    80008808:	01013403          	ld	s0,16(sp)
    8000880c:	00e4b023          	sd	a4,0(s1)
    80008810:	0097b023          	sd	s1,0(a5)
    80008814:	00813483          	ld	s1,8(sp)
    80008818:	02010113          	addi	sp,sp,32
    8000881c:	00008067          	ret
    80008820:	00001517          	auipc	a0,0x1
    80008824:	01850513          	addi	a0,a0,24 # 80009838 <digits+0x18>
    80008828:	fffff097          	auipc	ra,0xfffff
    8000882c:	354080e7          	jalr	852(ra) # 80007b7c <panic>

0000000080008830 <kalloc>:
    80008830:	fe010113          	addi	sp,sp,-32
    80008834:	00813823          	sd	s0,16(sp)
    80008838:	00913423          	sd	s1,8(sp)
    8000883c:	00113c23          	sd	ra,24(sp)
    80008840:	02010413          	addi	s0,sp,32
    80008844:	00003797          	auipc	a5,0x3
    80008848:	2fc78793          	addi	a5,a5,764 # 8000bb40 <kmem>
    8000884c:	0007b483          	ld	s1,0(a5)
    80008850:	02048063          	beqz	s1,80008870 <kalloc+0x40>
    80008854:	0004b703          	ld	a4,0(s1)
    80008858:	00001637          	lui	a2,0x1
    8000885c:	00500593          	li	a1,5
    80008860:	00048513          	mv	a0,s1
    80008864:	00e7b023          	sd	a4,0(a5)
    80008868:	00000097          	auipc	ra,0x0
    8000886c:	400080e7          	jalr	1024(ra) # 80008c68 <__memset>
    80008870:	01813083          	ld	ra,24(sp)
    80008874:	01013403          	ld	s0,16(sp)
    80008878:	00048513          	mv	a0,s1
    8000887c:	00813483          	ld	s1,8(sp)
    80008880:	02010113          	addi	sp,sp,32
    80008884:	00008067          	ret

0000000080008888 <initlock>:
    80008888:	ff010113          	addi	sp,sp,-16
    8000888c:	00813423          	sd	s0,8(sp)
    80008890:	01010413          	addi	s0,sp,16
    80008894:	00813403          	ld	s0,8(sp)
    80008898:	00b53423          	sd	a1,8(a0)
    8000889c:	00052023          	sw	zero,0(a0)
    800088a0:	00053823          	sd	zero,16(a0)
    800088a4:	01010113          	addi	sp,sp,16
    800088a8:	00008067          	ret

00000000800088ac <acquire>:
    800088ac:	fe010113          	addi	sp,sp,-32
    800088b0:	00813823          	sd	s0,16(sp)
    800088b4:	00913423          	sd	s1,8(sp)
    800088b8:	00113c23          	sd	ra,24(sp)
    800088bc:	01213023          	sd	s2,0(sp)
    800088c0:	02010413          	addi	s0,sp,32
    800088c4:	00050493          	mv	s1,a0
    800088c8:	10002973          	csrr	s2,sstatus
    800088cc:	100027f3          	csrr	a5,sstatus
    800088d0:	ffd7f793          	andi	a5,a5,-3
    800088d4:	10079073          	csrw	sstatus,a5
    800088d8:	fffff097          	auipc	ra,0xfffff
    800088dc:	8e4080e7          	jalr	-1820(ra) # 800071bc <mycpu>
    800088e0:	07852783          	lw	a5,120(a0)
    800088e4:	06078e63          	beqz	a5,80008960 <acquire+0xb4>
    800088e8:	fffff097          	auipc	ra,0xfffff
    800088ec:	8d4080e7          	jalr	-1836(ra) # 800071bc <mycpu>
    800088f0:	07852783          	lw	a5,120(a0)
    800088f4:	0004a703          	lw	a4,0(s1)
    800088f8:	0017879b          	addiw	a5,a5,1
    800088fc:	06f52c23          	sw	a5,120(a0)
    80008900:	04071063          	bnez	a4,80008940 <acquire+0x94>
    80008904:	00100713          	li	a4,1
    80008908:	00070793          	mv	a5,a4
    8000890c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80008910:	0007879b          	sext.w	a5,a5
    80008914:	fe079ae3          	bnez	a5,80008908 <acquire+0x5c>
    80008918:	0ff0000f          	fence
    8000891c:	fffff097          	auipc	ra,0xfffff
    80008920:	8a0080e7          	jalr	-1888(ra) # 800071bc <mycpu>
    80008924:	01813083          	ld	ra,24(sp)
    80008928:	01013403          	ld	s0,16(sp)
    8000892c:	00a4b823          	sd	a0,16(s1)
    80008930:	00013903          	ld	s2,0(sp)
    80008934:	00813483          	ld	s1,8(sp)
    80008938:	02010113          	addi	sp,sp,32
    8000893c:	00008067          	ret
    80008940:	0104b903          	ld	s2,16(s1)
    80008944:	fffff097          	auipc	ra,0xfffff
    80008948:	878080e7          	jalr	-1928(ra) # 800071bc <mycpu>
    8000894c:	faa91ce3          	bne	s2,a0,80008904 <acquire+0x58>
    80008950:	00001517          	auipc	a0,0x1
    80008954:	ef050513          	addi	a0,a0,-272 # 80009840 <digits+0x20>
    80008958:	fffff097          	auipc	ra,0xfffff
    8000895c:	224080e7          	jalr	548(ra) # 80007b7c <panic>
    80008960:	00195913          	srli	s2,s2,0x1
    80008964:	fffff097          	auipc	ra,0xfffff
    80008968:	858080e7          	jalr	-1960(ra) # 800071bc <mycpu>
    8000896c:	00197913          	andi	s2,s2,1
    80008970:	07252e23          	sw	s2,124(a0)
    80008974:	f75ff06f          	j	800088e8 <acquire+0x3c>

0000000080008978 <release>:
    80008978:	fe010113          	addi	sp,sp,-32
    8000897c:	00813823          	sd	s0,16(sp)
    80008980:	00113c23          	sd	ra,24(sp)
    80008984:	00913423          	sd	s1,8(sp)
    80008988:	01213023          	sd	s2,0(sp)
    8000898c:	02010413          	addi	s0,sp,32
    80008990:	00052783          	lw	a5,0(a0)
    80008994:	00079a63          	bnez	a5,800089a8 <release+0x30>
    80008998:	00001517          	auipc	a0,0x1
    8000899c:	eb050513          	addi	a0,a0,-336 # 80009848 <digits+0x28>
    800089a0:	fffff097          	auipc	ra,0xfffff
    800089a4:	1dc080e7          	jalr	476(ra) # 80007b7c <panic>
    800089a8:	01053903          	ld	s2,16(a0)
    800089ac:	00050493          	mv	s1,a0
    800089b0:	fffff097          	auipc	ra,0xfffff
    800089b4:	80c080e7          	jalr	-2036(ra) # 800071bc <mycpu>
    800089b8:	fea910e3          	bne	s2,a0,80008998 <release+0x20>
    800089bc:	0004b823          	sd	zero,16(s1)
    800089c0:	0ff0000f          	fence
    800089c4:	0f50000f          	fence	iorw,ow
    800089c8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800089cc:	ffffe097          	auipc	ra,0xffffe
    800089d0:	7f0080e7          	jalr	2032(ra) # 800071bc <mycpu>
    800089d4:	100027f3          	csrr	a5,sstatus
    800089d8:	0027f793          	andi	a5,a5,2
    800089dc:	04079a63          	bnez	a5,80008a30 <release+0xb8>
    800089e0:	07852783          	lw	a5,120(a0)
    800089e4:	02f05e63          	blez	a5,80008a20 <release+0xa8>
    800089e8:	fff7871b          	addiw	a4,a5,-1
    800089ec:	06e52c23          	sw	a4,120(a0)
    800089f0:	00071c63          	bnez	a4,80008a08 <release+0x90>
    800089f4:	07c52783          	lw	a5,124(a0)
    800089f8:	00078863          	beqz	a5,80008a08 <release+0x90>
    800089fc:	100027f3          	csrr	a5,sstatus
    80008a00:	0027e793          	ori	a5,a5,2
    80008a04:	10079073          	csrw	sstatus,a5
    80008a08:	01813083          	ld	ra,24(sp)
    80008a0c:	01013403          	ld	s0,16(sp)
    80008a10:	00813483          	ld	s1,8(sp)
    80008a14:	00013903          	ld	s2,0(sp)
    80008a18:	02010113          	addi	sp,sp,32
    80008a1c:	00008067          	ret
    80008a20:	00001517          	auipc	a0,0x1
    80008a24:	e4850513          	addi	a0,a0,-440 # 80009868 <digits+0x48>
    80008a28:	fffff097          	auipc	ra,0xfffff
    80008a2c:	154080e7          	jalr	340(ra) # 80007b7c <panic>
    80008a30:	00001517          	auipc	a0,0x1
    80008a34:	e2050513          	addi	a0,a0,-480 # 80009850 <digits+0x30>
    80008a38:	fffff097          	auipc	ra,0xfffff
    80008a3c:	144080e7          	jalr	324(ra) # 80007b7c <panic>

0000000080008a40 <holding>:
    80008a40:	00052783          	lw	a5,0(a0)
    80008a44:	00079663          	bnez	a5,80008a50 <holding+0x10>
    80008a48:	00000513          	li	a0,0
    80008a4c:	00008067          	ret
    80008a50:	fe010113          	addi	sp,sp,-32
    80008a54:	00813823          	sd	s0,16(sp)
    80008a58:	00913423          	sd	s1,8(sp)
    80008a5c:	00113c23          	sd	ra,24(sp)
    80008a60:	02010413          	addi	s0,sp,32
    80008a64:	01053483          	ld	s1,16(a0)
    80008a68:	ffffe097          	auipc	ra,0xffffe
    80008a6c:	754080e7          	jalr	1876(ra) # 800071bc <mycpu>
    80008a70:	01813083          	ld	ra,24(sp)
    80008a74:	01013403          	ld	s0,16(sp)
    80008a78:	40a48533          	sub	a0,s1,a0
    80008a7c:	00153513          	seqz	a0,a0
    80008a80:	00813483          	ld	s1,8(sp)
    80008a84:	02010113          	addi	sp,sp,32
    80008a88:	00008067          	ret

0000000080008a8c <push_off>:
    80008a8c:	fe010113          	addi	sp,sp,-32
    80008a90:	00813823          	sd	s0,16(sp)
    80008a94:	00113c23          	sd	ra,24(sp)
    80008a98:	00913423          	sd	s1,8(sp)
    80008a9c:	02010413          	addi	s0,sp,32
    80008aa0:	100024f3          	csrr	s1,sstatus
    80008aa4:	100027f3          	csrr	a5,sstatus
    80008aa8:	ffd7f793          	andi	a5,a5,-3
    80008aac:	10079073          	csrw	sstatus,a5
    80008ab0:	ffffe097          	auipc	ra,0xffffe
    80008ab4:	70c080e7          	jalr	1804(ra) # 800071bc <mycpu>
    80008ab8:	07852783          	lw	a5,120(a0)
    80008abc:	02078663          	beqz	a5,80008ae8 <push_off+0x5c>
    80008ac0:	ffffe097          	auipc	ra,0xffffe
    80008ac4:	6fc080e7          	jalr	1788(ra) # 800071bc <mycpu>
    80008ac8:	07852783          	lw	a5,120(a0)
    80008acc:	01813083          	ld	ra,24(sp)
    80008ad0:	01013403          	ld	s0,16(sp)
    80008ad4:	0017879b          	addiw	a5,a5,1
    80008ad8:	06f52c23          	sw	a5,120(a0)
    80008adc:	00813483          	ld	s1,8(sp)
    80008ae0:	02010113          	addi	sp,sp,32
    80008ae4:	00008067          	ret
    80008ae8:	0014d493          	srli	s1,s1,0x1
    80008aec:	ffffe097          	auipc	ra,0xffffe
    80008af0:	6d0080e7          	jalr	1744(ra) # 800071bc <mycpu>
    80008af4:	0014f493          	andi	s1,s1,1
    80008af8:	06952e23          	sw	s1,124(a0)
    80008afc:	fc5ff06f          	j	80008ac0 <push_off+0x34>

0000000080008b00 <pop_off>:
    80008b00:	ff010113          	addi	sp,sp,-16
    80008b04:	00813023          	sd	s0,0(sp)
    80008b08:	00113423          	sd	ra,8(sp)
    80008b0c:	01010413          	addi	s0,sp,16
    80008b10:	ffffe097          	auipc	ra,0xffffe
    80008b14:	6ac080e7          	jalr	1708(ra) # 800071bc <mycpu>
    80008b18:	100027f3          	csrr	a5,sstatus
    80008b1c:	0027f793          	andi	a5,a5,2
    80008b20:	04079663          	bnez	a5,80008b6c <pop_off+0x6c>
    80008b24:	07852783          	lw	a5,120(a0)
    80008b28:	02f05a63          	blez	a5,80008b5c <pop_off+0x5c>
    80008b2c:	fff7871b          	addiw	a4,a5,-1
    80008b30:	06e52c23          	sw	a4,120(a0)
    80008b34:	00071c63          	bnez	a4,80008b4c <pop_off+0x4c>
    80008b38:	07c52783          	lw	a5,124(a0)
    80008b3c:	00078863          	beqz	a5,80008b4c <pop_off+0x4c>
    80008b40:	100027f3          	csrr	a5,sstatus
    80008b44:	0027e793          	ori	a5,a5,2
    80008b48:	10079073          	csrw	sstatus,a5
    80008b4c:	00813083          	ld	ra,8(sp)
    80008b50:	00013403          	ld	s0,0(sp)
    80008b54:	01010113          	addi	sp,sp,16
    80008b58:	00008067          	ret
    80008b5c:	00001517          	auipc	a0,0x1
    80008b60:	d0c50513          	addi	a0,a0,-756 # 80009868 <digits+0x48>
    80008b64:	fffff097          	auipc	ra,0xfffff
    80008b68:	018080e7          	jalr	24(ra) # 80007b7c <panic>
    80008b6c:	00001517          	auipc	a0,0x1
    80008b70:	ce450513          	addi	a0,a0,-796 # 80009850 <digits+0x30>
    80008b74:	fffff097          	auipc	ra,0xfffff
    80008b78:	008080e7          	jalr	8(ra) # 80007b7c <panic>

0000000080008b7c <push_on>:
    80008b7c:	fe010113          	addi	sp,sp,-32
    80008b80:	00813823          	sd	s0,16(sp)
    80008b84:	00113c23          	sd	ra,24(sp)
    80008b88:	00913423          	sd	s1,8(sp)
    80008b8c:	02010413          	addi	s0,sp,32
    80008b90:	100024f3          	csrr	s1,sstatus
    80008b94:	100027f3          	csrr	a5,sstatus
    80008b98:	0027e793          	ori	a5,a5,2
    80008b9c:	10079073          	csrw	sstatus,a5
    80008ba0:	ffffe097          	auipc	ra,0xffffe
    80008ba4:	61c080e7          	jalr	1564(ra) # 800071bc <mycpu>
    80008ba8:	07852783          	lw	a5,120(a0)
    80008bac:	02078663          	beqz	a5,80008bd8 <push_on+0x5c>
    80008bb0:	ffffe097          	auipc	ra,0xffffe
    80008bb4:	60c080e7          	jalr	1548(ra) # 800071bc <mycpu>
    80008bb8:	07852783          	lw	a5,120(a0)
    80008bbc:	01813083          	ld	ra,24(sp)
    80008bc0:	01013403          	ld	s0,16(sp)
    80008bc4:	0017879b          	addiw	a5,a5,1
    80008bc8:	06f52c23          	sw	a5,120(a0)
    80008bcc:	00813483          	ld	s1,8(sp)
    80008bd0:	02010113          	addi	sp,sp,32
    80008bd4:	00008067          	ret
    80008bd8:	0014d493          	srli	s1,s1,0x1
    80008bdc:	ffffe097          	auipc	ra,0xffffe
    80008be0:	5e0080e7          	jalr	1504(ra) # 800071bc <mycpu>
    80008be4:	0014f493          	andi	s1,s1,1
    80008be8:	06952e23          	sw	s1,124(a0)
    80008bec:	fc5ff06f          	j	80008bb0 <push_on+0x34>

0000000080008bf0 <pop_on>:
    80008bf0:	ff010113          	addi	sp,sp,-16
    80008bf4:	00813023          	sd	s0,0(sp)
    80008bf8:	00113423          	sd	ra,8(sp)
    80008bfc:	01010413          	addi	s0,sp,16
    80008c00:	ffffe097          	auipc	ra,0xffffe
    80008c04:	5bc080e7          	jalr	1468(ra) # 800071bc <mycpu>
    80008c08:	100027f3          	csrr	a5,sstatus
    80008c0c:	0027f793          	andi	a5,a5,2
    80008c10:	04078463          	beqz	a5,80008c58 <pop_on+0x68>
    80008c14:	07852783          	lw	a5,120(a0)
    80008c18:	02f05863          	blez	a5,80008c48 <pop_on+0x58>
    80008c1c:	fff7879b          	addiw	a5,a5,-1
    80008c20:	06f52c23          	sw	a5,120(a0)
    80008c24:	07853783          	ld	a5,120(a0)
    80008c28:	00079863          	bnez	a5,80008c38 <pop_on+0x48>
    80008c2c:	100027f3          	csrr	a5,sstatus
    80008c30:	ffd7f793          	andi	a5,a5,-3
    80008c34:	10079073          	csrw	sstatus,a5
    80008c38:	00813083          	ld	ra,8(sp)
    80008c3c:	00013403          	ld	s0,0(sp)
    80008c40:	01010113          	addi	sp,sp,16
    80008c44:	00008067          	ret
    80008c48:	00001517          	auipc	a0,0x1
    80008c4c:	c4850513          	addi	a0,a0,-952 # 80009890 <digits+0x70>
    80008c50:	fffff097          	auipc	ra,0xfffff
    80008c54:	f2c080e7          	jalr	-212(ra) # 80007b7c <panic>
    80008c58:	00001517          	auipc	a0,0x1
    80008c5c:	c1850513          	addi	a0,a0,-1000 # 80009870 <digits+0x50>
    80008c60:	fffff097          	auipc	ra,0xfffff
    80008c64:	f1c080e7          	jalr	-228(ra) # 80007b7c <panic>

0000000080008c68 <__memset>:
    80008c68:	ff010113          	addi	sp,sp,-16
    80008c6c:	00813423          	sd	s0,8(sp)
    80008c70:	01010413          	addi	s0,sp,16
    80008c74:	1a060e63          	beqz	a2,80008e30 <__memset+0x1c8>
    80008c78:	40a007b3          	neg	a5,a0
    80008c7c:	0077f793          	andi	a5,a5,7
    80008c80:	00778693          	addi	a3,a5,7
    80008c84:	00b00813          	li	a6,11
    80008c88:	0ff5f593          	andi	a1,a1,255
    80008c8c:	fff6071b          	addiw	a4,a2,-1
    80008c90:	1b06e663          	bltu	a3,a6,80008e3c <__memset+0x1d4>
    80008c94:	1cd76463          	bltu	a4,a3,80008e5c <__memset+0x1f4>
    80008c98:	1a078e63          	beqz	a5,80008e54 <__memset+0x1ec>
    80008c9c:	00b50023          	sb	a1,0(a0)
    80008ca0:	00100713          	li	a4,1
    80008ca4:	1ae78463          	beq	a5,a4,80008e4c <__memset+0x1e4>
    80008ca8:	00b500a3          	sb	a1,1(a0)
    80008cac:	00200713          	li	a4,2
    80008cb0:	1ae78a63          	beq	a5,a4,80008e64 <__memset+0x1fc>
    80008cb4:	00b50123          	sb	a1,2(a0)
    80008cb8:	00300713          	li	a4,3
    80008cbc:	18e78463          	beq	a5,a4,80008e44 <__memset+0x1dc>
    80008cc0:	00b501a3          	sb	a1,3(a0)
    80008cc4:	00400713          	li	a4,4
    80008cc8:	1ae78263          	beq	a5,a4,80008e6c <__memset+0x204>
    80008ccc:	00b50223          	sb	a1,4(a0)
    80008cd0:	00500713          	li	a4,5
    80008cd4:	1ae78063          	beq	a5,a4,80008e74 <__memset+0x20c>
    80008cd8:	00b502a3          	sb	a1,5(a0)
    80008cdc:	00700713          	li	a4,7
    80008ce0:	18e79e63          	bne	a5,a4,80008e7c <__memset+0x214>
    80008ce4:	00b50323          	sb	a1,6(a0)
    80008ce8:	00700e93          	li	t4,7
    80008cec:	00859713          	slli	a4,a1,0x8
    80008cf0:	00e5e733          	or	a4,a1,a4
    80008cf4:	01059e13          	slli	t3,a1,0x10
    80008cf8:	01c76e33          	or	t3,a4,t3
    80008cfc:	01859313          	slli	t1,a1,0x18
    80008d00:	006e6333          	or	t1,t3,t1
    80008d04:	02059893          	slli	a7,a1,0x20
    80008d08:	40f60e3b          	subw	t3,a2,a5
    80008d0c:	011368b3          	or	a7,t1,a7
    80008d10:	02859813          	slli	a6,a1,0x28
    80008d14:	0108e833          	or	a6,a7,a6
    80008d18:	03059693          	slli	a3,a1,0x30
    80008d1c:	003e589b          	srliw	a7,t3,0x3
    80008d20:	00d866b3          	or	a3,a6,a3
    80008d24:	03859713          	slli	a4,a1,0x38
    80008d28:	00389813          	slli	a6,a7,0x3
    80008d2c:	00f507b3          	add	a5,a0,a5
    80008d30:	00e6e733          	or	a4,a3,a4
    80008d34:	000e089b          	sext.w	a7,t3
    80008d38:	00f806b3          	add	a3,a6,a5
    80008d3c:	00e7b023          	sd	a4,0(a5)
    80008d40:	00878793          	addi	a5,a5,8
    80008d44:	fed79ce3          	bne	a5,a3,80008d3c <__memset+0xd4>
    80008d48:	ff8e7793          	andi	a5,t3,-8
    80008d4c:	0007871b          	sext.w	a4,a5
    80008d50:	01d787bb          	addw	a5,a5,t4
    80008d54:	0ce88e63          	beq	a7,a4,80008e30 <__memset+0x1c8>
    80008d58:	00f50733          	add	a4,a0,a5
    80008d5c:	00b70023          	sb	a1,0(a4)
    80008d60:	0017871b          	addiw	a4,a5,1
    80008d64:	0cc77663          	bgeu	a4,a2,80008e30 <__memset+0x1c8>
    80008d68:	00e50733          	add	a4,a0,a4
    80008d6c:	00b70023          	sb	a1,0(a4)
    80008d70:	0027871b          	addiw	a4,a5,2
    80008d74:	0ac77e63          	bgeu	a4,a2,80008e30 <__memset+0x1c8>
    80008d78:	00e50733          	add	a4,a0,a4
    80008d7c:	00b70023          	sb	a1,0(a4)
    80008d80:	0037871b          	addiw	a4,a5,3
    80008d84:	0ac77663          	bgeu	a4,a2,80008e30 <__memset+0x1c8>
    80008d88:	00e50733          	add	a4,a0,a4
    80008d8c:	00b70023          	sb	a1,0(a4)
    80008d90:	0047871b          	addiw	a4,a5,4
    80008d94:	08c77e63          	bgeu	a4,a2,80008e30 <__memset+0x1c8>
    80008d98:	00e50733          	add	a4,a0,a4
    80008d9c:	00b70023          	sb	a1,0(a4)
    80008da0:	0057871b          	addiw	a4,a5,5
    80008da4:	08c77663          	bgeu	a4,a2,80008e30 <__memset+0x1c8>
    80008da8:	00e50733          	add	a4,a0,a4
    80008dac:	00b70023          	sb	a1,0(a4)
    80008db0:	0067871b          	addiw	a4,a5,6
    80008db4:	06c77e63          	bgeu	a4,a2,80008e30 <__memset+0x1c8>
    80008db8:	00e50733          	add	a4,a0,a4
    80008dbc:	00b70023          	sb	a1,0(a4)
    80008dc0:	0077871b          	addiw	a4,a5,7
    80008dc4:	06c77663          	bgeu	a4,a2,80008e30 <__memset+0x1c8>
    80008dc8:	00e50733          	add	a4,a0,a4
    80008dcc:	00b70023          	sb	a1,0(a4)
    80008dd0:	0087871b          	addiw	a4,a5,8
    80008dd4:	04c77e63          	bgeu	a4,a2,80008e30 <__memset+0x1c8>
    80008dd8:	00e50733          	add	a4,a0,a4
    80008ddc:	00b70023          	sb	a1,0(a4)
    80008de0:	0097871b          	addiw	a4,a5,9
    80008de4:	04c77663          	bgeu	a4,a2,80008e30 <__memset+0x1c8>
    80008de8:	00e50733          	add	a4,a0,a4
    80008dec:	00b70023          	sb	a1,0(a4)
    80008df0:	00a7871b          	addiw	a4,a5,10
    80008df4:	02c77e63          	bgeu	a4,a2,80008e30 <__memset+0x1c8>
    80008df8:	00e50733          	add	a4,a0,a4
    80008dfc:	00b70023          	sb	a1,0(a4)
    80008e00:	00b7871b          	addiw	a4,a5,11
    80008e04:	02c77663          	bgeu	a4,a2,80008e30 <__memset+0x1c8>
    80008e08:	00e50733          	add	a4,a0,a4
    80008e0c:	00b70023          	sb	a1,0(a4)
    80008e10:	00c7871b          	addiw	a4,a5,12
    80008e14:	00c77e63          	bgeu	a4,a2,80008e30 <__memset+0x1c8>
    80008e18:	00e50733          	add	a4,a0,a4
    80008e1c:	00b70023          	sb	a1,0(a4)
    80008e20:	00d7879b          	addiw	a5,a5,13
    80008e24:	00c7f663          	bgeu	a5,a2,80008e30 <__memset+0x1c8>
    80008e28:	00f507b3          	add	a5,a0,a5
    80008e2c:	00b78023          	sb	a1,0(a5)
    80008e30:	00813403          	ld	s0,8(sp)
    80008e34:	01010113          	addi	sp,sp,16
    80008e38:	00008067          	ret
    80008e3c:	00b00693          	li	a3,11
    80008e40:	e55ff06f          	j	80008c94 <__memset+0x2c>
    80008e44:	00300e93          	li	t4,3
    80008e48:	ea5ff06f          	j	80008cec <__memset+0x84>
    80008e4c:	00100e93          	li	t4,1
    80008e50:	e9dff06f          	j	80008cec <__memset+0x84>
    80008e54:	00000e93          	li	t4,0
    80008e58:	e95ff06f          	j	80008cec <__memset+0x84>
    80008e5c:	00000793          	li	a5,0
    80008e60:	ef9ff06f          	j	80008d58 <__memset+0xf0>
    80008e64:	00200e93          	li	t4,2
    80008e68:	e85ff06f          	j	80008cec <__memset+0x84>
    80008e6c:	00400e93          	li	t4,4
    80008e70:	e7dff06f          	j	80008cec <__memset+0x84>
    80008e74:	00500e93          	li	t4,5
    80008e78:	e75ff06f          	j	80008cec <__memset+0x84>
    80008e7c:	00600e93          	li	t4,6
    80008e80:	e6dff06f          	j	80008cec <__memset+0x84>

0000000080008e84 <__memmove>:
    80008e84:	ff010113          	addi	sp,sp,-16
    80008e88:	00813423          	sd	s0,8(sp)
    80008e8c:	01010413          	addi	s0,sp,16
    80008e90:	0e060863          	beqz	a2,80008f80 <__memmove+0xfc>
    80008e94:	fff6069b          	addiw	a3,a2,-1
    80008e98:	0006881b          	sext.w	a6,a3
    80008e9c:	0ea5e863          	bltu	a1,a0,80008f8c <__memmove+0x108>
    80008ea0:	00758713          	addi	a4,a1,7
    80008ea4:	00a5e7b3          	or	a5,a1,a0
    80008ea8:	40a70733          	sub	a4,a4,a0
    80008eac:	0077f793          	andi	a5,a5,7
    80008eb0:	00f73713          	sltiu	a4,a4,15
    80008eb4:	00174713          	xori	a4,a4,1
    80008eb8:	0017b793          	seqz	a5,a5
    80008ebc:	00e7f7b3          	and	a5,a5,a4
    80008ec0:	10078863          	beqz	a5,80008fd0 <__memmove+0x14c>
    80008ec4:	00900793          	li	a5,9
    80008ec8:	1107f463          	bgeu	a5,a6,80008fd0 <__memmove+0x14c>
    80008ecc:	0036581b          	srliw	a6,a2,0x3
    80008ed0:	fff8081b          	addiw	a6,a6,-1
    80008ed4:	02081813          	slli	a6,a6,0x20
    80008ed8:	01d85893          	srli	a7,a6,0x1d
    80008edc:	00858813          	addi	a6,a1,8
    80008ee0:	00058793          	mv	a5,a1
    80008ee4:	00050713          	mv	a4,a0
    80008ee8:	01088833          	add	a6,a7,a6
    80008eec:	0007b883          	ld	a7,0(a5)
    80008ef0:	00878793          	addi	a5,a5,8
    80008ef4:	00870713          	addi	a4,a4,8
    80008ef8:	ff173c23          	sd	a7,-8(a4)
    80008efc:	ff0798e3          	bne	a5,a6,80008eec <__memmove+0x68>
    80008f00:	ff867713          	andi	a4,a2,-8
    80008f04:	02071793          	slli	a5,a4,0x20
    80008f08:	0207d793          	srli	a5,a5,0x20
    80008f0c:	00f585b3          	add	a1,a1,a5
    80008f10:	40e686bb          	subw	a3,a3,a4
    80008f14:	00f507b3          	add	a5,a0,a5
    80008f18:	06e60463          	beq	a2,a4,80008f80 <__memmove+0xfc>
    80008f1c:	0005c703          	lbu	a4,0(a1)
    80008f20:	00e78023          	sb	a4,0(a5)
    80008f24:	04068e63          	beqz	a3,80008f80 <__memmove+0xfc>
    80008f28:	0015c603          	lbu	a2,1(a1)
    80008f2c:	00100713          	li	a4,1
    80008f30:	00c780a3          	sb	a2,1(a5)
    80008f34:	04e68663          	beq	a3,a4,80008f80 <__memmove+0xfc>
    80008f38:	0025c603          	lbu	a2,2(a1)
    80008f3c:	00200713          	li	a4,2
    80008f40:	00c78123          	sb	a2,2(a5)
    80008f44:	02e68e63          	beq	a3,a4,80008f80 <__memmove+0xfc>
    80008f48:	0035c603          	lbu	a2,3(a1)
    80008f4c:	00300713          	li	a4,3
    80008f50:	00c781a3          	sb	a2,3(a5)
    80008f54:	02e68663          	beq	a3,a4,80008f80 <__memmove+0xfc>
    80008f58:	0045c603          	lbu	a2,4(a1)
    80008f5c:	00400713          	li	a4,4
    80008f60:	00c78223          	sb	a2,4(a5)
    80008f64:	00e68e63          	beq	a3,a4,80008f80 <__memmove+0xfc>
    80008f68:	0055c603          	lbu	a2,5(a1)
    80008f6c:	00500713          	li	a4,5
    80008f70:	00c782a3          	sb	a2,5(a5)
    80008f74:	00e68663          	beq	a3,a4,80008f80 <__memmove+0xfc>
    80008f78:	0065c703          	lbu	a4,6(a1)
    80008f7c:	00e78323          	sb	a4,6(a5)
    80008f80:	00813403          	ld	s0,8(sp)
    80008f84:	01010113          	addi	sp,sp,16
    80008f88:	00008067          	ret
    80008f8c:	02061713          	slli	a4,a2,0x20
    80008f90:	02075713          	srli	a4,a4,0x20
    80008f94:	00e587b3          	add	a5,a1,a4
    80008f98:	f0f574e3          	bgeu	a0,a5,80008ea0 <__memmove+0x1c>
    80008f9c:	02069613          	slli	a2,a3,0x20
    80008fa0:	02065613          	srli	a2,a2,0x20
    80008fa4:	fff64613          	not	a2,a2
    80008fa8:	00e50733          	add	a4,a0,a4
    80008fac:	00c78633          	add	a2,a5,a2
    80008fb0:	fff7c683          	lbu	a3,-1(a5)
    80008fb4:	fff78793          	addi	a5,a5,-1
    80008fb8:	fff70713          	addi	a4,a4,-1
    80008fbc:	00d70023          	sb	a3,0(a4)
    80008fc0:	fec798e3          	bne	a5,a2,80008fb0 <__memmove+0x12c>
    80008fc4:	00813403          	ld	s0,8(sp)
    80008fc8:	01010113          	addi	sp,sp,16
    80008fcc:	00008067          	ret
    80008fd0:	02069713          	slli	a4,a3,0x20
    80008fd4:	02075713          	srli	a4,a4,0x20
    80008fd8:	00170713          	addi	a4,a4,1
    80008fdc:	00e50733          	add	a4,a0,a4
    80008fe0:	00050793          	mv	a5,a0
    80008fe4:	0005c683          	lbu	a3,0(a1)
    80008fe8:	00178793          	addi	a5,a5,1
    80008fec:	00158593          	addi	a1,a1,1
    80008ff0:	fed78fa3          	sb	a3,-1(a5)
    80008ff4:	fee798e3          	bne	a5,a4,80008fe4 <__memmove+0x160>
    80008ff8:	f89ff06f          	j	80008f80 <__memmove+0xfc>
    80008ffc:	0000                	unimp
	...
