
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000d117          	auipc	sp,0xd
    80000004:	a9813103          	ld	sp,-1384(sp) # 8000ca98 <_GLOBAL_OFFSET_TABLE_+0x40>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	02c070ef          	jal	ra,80007048 <start>

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
    80001184:	345000ef          	jal	ra,80001cc8 <interruptRoutine>

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

inline void scall() {
	__asm__ volatile("ecall");
}

void* mem_alloc(size_t size) {
    80001310:	ff010113          	addi	sp,sp,-16
    80001314:	00813423          	sd	s0,8(sp)
    80001318:	01010413          	addi	s0,sp,16
	//na size moramo dodati zaglavlje segmenta
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
	//a1 = broj blokova velicine MEM_BLOCK_SIZE za alokaciju

	scall();

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
	//a1 = pokazivac na memoriju koju treba dealocirati

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
	//uint64* stack = (start_routine != nullptr ? (uint64*)MemoryAllocator::kmalloc(DEFAULT_STACK_SIZE) : nullptr);
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
	__asm__ volatile("mv %[status], a0":[status] "=r"(character));
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

int thread_alloc(thread_t* handle, TCB::Body function, void* arg){
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

void thread_start(thread_t handle){
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
    80001664:	4c07c783          	lbu	a5,1216(a5) # 8000cb20 <_ZN8KConsole11initializedE>
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
    80001688:	49c48493          	addi	s1,s1,1180 # 8000cb20 <_ZN8KConsole11initializedE>
    8000168c:	0000b797          	auipc	a5,0xb
    80001690:	3dc7b783          	ld	a5,988(a5) # 8000ca68 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001694:	0007b783          	ld	a5,0(a5)
    80001698:	00f4b423          	sd	a5,8(s1)
	sr = (uint8*)CONSOLE_STATUS;
    8000169c:	0000b797          	auipc	a5,0xb
    800016a0:	3dc7b783          	ld	a5,988(a5) # 8000ca78 <_GLOBAL_OFFSET_TABLE_+0x20>
    800016a4:	0007b783          	ld	a5,0(a5)
    800016a8:	00f4b823          	sd	a5,16(s1)
	sem_open(&inputBufferHasSpace, capacity);
    800016ac:	03200593          	li	a1,50
    800016b0:	0000b517          	auipc	a0,0xb
    800016b4:	48850513          	addi	a0,a0,1160 # 8000cb38 <_ZN8KConsole19inputBufferHasSpaceE>
    800016b8:	00000097          	auipc	ra,0x0
    800016bc:	de8080e7          	jalr	-536(ra) # 800014a0 <_Z8sem_openPP4KSemj>
	sem_open(&outputBufferHasSpace, capacity);
    800016c0:	03200593          	li	a1,50
    800016c4:	0000b517          	auipc	a0,0xb
    800016c8:	47c50513          	addi	a0,a0,1148 # 8000cb40 <_ZN8KConsole20outputBufferHasSpaceE>
    800016cc:	00000097          	auipc	ra,0x0
    800016d0:	dd4080e7          	jalr	-556(ra) # 800014a0 <_Z8sem_openPP4KSemj>
	sem_open(&charsToInput, 0);
    800016d4:	00000593          	li	a1,0
    800016d8:	0000b517          	auipc	a0,0xb
    800016dc:	47050513          	addi	a0,a0,1136 # 8000cb48 <_ZN8KConsole12charsToInputE>
    800016e0:	00000097          	auipc	ra,0x0
    800016e4:	dc0080e7          	jalr	-576(ra) # 800014a0 <_Z8sem_openPP4KSemj>
	sem_open(&charsToOutput, 0);
    800016e8:	00000593          	li	a1,0
    800016ec:	0000b517          	auipc	a0,0xb
    800016f0:	46450513          	addi	a0,a0,1124 # 8000cb50 <_ZN8KConsole13charsToOutputE>
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
    80001738:	6c4080e7          	jalr	1732(ra) # 80005df8 <_Z11printStringPKc>
	printInteger((uint64)dr);
    8000173c:	0000b497          	auipc	s1,0xb
    80001740:	3e448493          	addi	s1,s1,996 # 8000cb20 <_ZN8KConsole11initializedE>
    80001744:	0084b503          	ld	a0,8(s1)
    80001748:	00000097          	auipc	ra,0x0
    8000174c:	250080e7          	jalr	592(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    80001750:	00009517          	auipc	a0,0x9
    80001754:	e2050513          	addi	a0,a0,-480 # 8000a570 <CONSOLE_STATUS+0x560>
    80001758:	00004097          	auipc	ra,0x4
    8000175c:	6a0080e7          	jalr	1696(ra) # 80005df8 <_Z11printStringPKc>
	printString("CONSOLE_STATUS = ");
    80001760:	00009517          	auipc	a0,0x9
    80001764:	8d050513          	addi	a0,a0,-1840 # 8000a030 <CONSOLE_STATUS+0x20>
    80001768:	00004097          	auipc	ra,0x4
    8000176c:	690080e7          	jalr	1680(ra) # 80005df8 <_Z11printStringPKc>
	printInteger((uint64)sr);
    80001770:	0104b503          	ld	a0,16(s1)
    80001774:	00000097          	auipc	ra,0x0
    80001778:	224080e7          	jalr	548(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    8000177c:	00009517          	auipc	a0,0x9
    80001780:	df450513          	addi	a0,a0,-524 # 8000a570 <CONSOLE_STATUS+0x560>
    80001784:	00004097          	auipc	ra,0x4
    80001788:	674080e7          	jalr	1652(ra) # 80005df8 <_Z11printStringPKc>
	printString("*CONSOLE_RX = ");
    8000178c:	00009517          	auipc	a0,0x9
    80001790:	8bc50513          	addi	a0,a0,-1860 # 8000a048 <CONSOLE_STATUS+0x38>
    80001794:	00004097          	auipc	ra,0x4
    80001798:	664080e7          	jalr	1636(ra) # 80005df8 <_Z11printStringPKc>
	printInteger(*dr);
    8000179c:	0084b783          	ld	a5,8(s1)
    800017a0:	0007c503          	lbu	a0,0(a5)
    800017a4:	00000097          	auipc	ra,0x0
    800017a8:	1f4080e7          	jalr	500(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    800017ac:	00009517          	auipc	a0,0x9
    800017b0:	dc450513          	addi	a0,a0,-572 # 8000a570 <CONSOLE_STATUS+0x560>
    800017b4:	00004097          	auipc	ra,0x4
    800017b8:	644080e7          	jalr	1604(ra) # 80005df8 <_Z11printStringPKc>
	printString("*CONSOLE_STATUS = ");
    800017bc:	00009517          	auipc	a0,0x9
    800017c0:	89c50513          	addi	a0,a0,-1892 # 8000a058 <CONSOLE_STATUS+0x48>
    800017c4:	00004097          	auipc	ra,0x4
    800017c8:	634080e7          	jalr	1588(ra) # 80005df8 <_Z11printStringPKc>
	printInteger(*sr);
    800017cc:	0104b783          	ld	a5,16(s1)
    800017d0:	0007c503          	lbu	a0,0(a5)
    800017d4:	00000097          	auipc	ra,0x0
    800017d8:	1c4080e7          	jalr	452(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    800017dc:	00009517          	auipc	a0,0x9
    800017e0:	d9450513          	addi	a0,a0,-620 # 8000a570 <CONSOLE_STATUS+0x560>
    800017e4:	00004097          	auipc	ra,0x4
    800017e8:	614080e7          	jalr	1556(ra) # 80005df8 <_Z11printStringPKc>
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
    80001818:	30c48493          	addi	s1,s1,780 # 8000cb20 <_ZN8KConsole11initializedE>
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
    8000185c:	33c72703          	lw	a4,828(a4) # 8000cb94 <_ZN8KConsole15inputBufferSizeE>
    80001860:	03200793          	li	a5,50
    80001864:	04f70e63          	beq	a4,a5,800018c0 <_ZN8KConsole12placeInInputEc+0x68>
void KConsole::placeInInput(char c) {
    80001868:	ff010113          	addi	sp,sp,-16
    8000186c:	00113423          	sd	ra,8(sp)
    80001870:	00813023          	sd	s0,0(sp)
    80001874:	01010413          	addi	s0,sp,16
	inputBuffer[inputTail] = c;
    80001878:	0000b697          	auipc	a3,0xb
    8000187c:	2a868693          	addi	a3,a3,680 # 8000cb20 <_ZN8KConsole11initializedE>
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
    800018e4:	24048493          	addi	s1,s1,576 # 8000cb20 <_ZN8KConsole11initializedE>
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
    8000194c:	1d848493          	addi	s1,s1,472 # 8000cb20 <_ZN8KConsole11initializedE>
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
	__asm__ volatile("mv a1, %[ptr]": :[ptr] "r"(integer):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800019a8:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x91");
    800019ac:	09100513          	li	a0,145

	__asm__ volatile("ecall");
    800019b0:	00000073          	ecall
}
    800019b4:	00813403          	ld	s0,8(sp)
    800019b8:	01010113          	addi	sp,sp,16
    800019bc:	00008067          	ret

00000000800019c0 <_ZN9Scheduler3putEP3TCB>:
//Scheduler* Scheduler::singleton = nullptr;
TCB* Scheduler::head = nullptr;
TCB* Scheduler::tail = nullptr;
TCB* Scheduler::sleepingHead = nullptr;

void Scheduler::put(TCB* tcb) {
    800019c0:	ff010113          	addi	sp,sp,-16
    800019c4:	00813423          	sd	s0,8(sp)
    800019c8:	01010413          	addi	s0,sp,16
	if (tail == nullptr) {
    800019cc:	0000b797          	auipc	a5,0xb
    800019d0:	2147b783          	ld	a5,532(a5) # 8000cbe0 <_ZN9Scheduler4tailE>
    800019d4:	00078e63          	beqz	a5,800019f0 <_ZN9Scheduler3putEP3TCB+0x30>
		head = tail = tcb;
	} else {
		tail->nextInScheduler = tcb;
    800019d8:	02a7bc23          	sd	a0,56(a5)
		tail = tcb;
    800019dc:	0000b797          	auipc	a5,0xb
    800019e0:	20a7b223          	sd	a0,516(a5) # 8000cbe0 <_ZN9Scheduler4tailE>
	}
}
    800019e4:	00813403          	ld	s0,8(sp)
    800019e8:	01010113          	addi	sp,sp,16
    800019ec:	00008067          	ret
		head = tail = tcb;
    800019f0:	0000b797          	auipc	a5,0xb
    800019f4:	1f078793          	addi	a5,a5,496 # 8000cbe0 <_ZN9Scheduler4tailE>
    800019f8:	00a7b023          	sd	a0,0(a5)
    800019fc:	00a7b423          	sd	a0,8(a5)
    80001a00:	fe5ff06f          	j	800019e4 <_ZN9Scheduler3putEP3TCB+0x24>

0000000080001a04 <_ZN9Scheduler3getEv>:

TCB* Scheduler::get() {
    80001a04:	ff010113          	addi	sp,sp,-16
    80001a08:	00813423          	sd	s0,8(sp)
    80001a0c:	01010413          	addi	s0,sp,16
	TCB* firstThread = head;
    80001a10:	0000b717          	auipc	a4,0xb
    80001a14:	1d070713          	addi	a4,a4,464 # 8000cbe0 <_ZN9Scheduler4tailE>
    80001a18:	00873503          	ld	a0,8(a4)
	head = head->nextInScheduler;
    80001a1c:	03853783          	ld	a5,56(a0)
    80001a20:	00f73423          	sd	a5,8(a4)
	if (head == nullptr) {
    80001a24:	00078a63          	beqz	a5,80001a38 <_ZN9Scheduler3getEv+0x34>
		tail = head = nullptr;
	}
	firstThread->nextInScheduler = nullptr;
    80001a28:	02053c23          	sd	zero,56(a0)
	return firstThread;
}
    80001a2c:	00813403          	ld	s0,8(sp)
    80001a30:	01010113          	addi	sp,sp,16
    80001a34:	00008067          	ret
		tail = head = nullptr;
    80001a38:	00073423          	sd	zero,8(a4)
    80001a3c:	00073023          	sd	zero,0(a4)
    80001a40:	fe9ff06f          	j	80001a28 <_ZN9Scheduler3getEv+0x24>

0000000080001a44 <_ZN9Scheduler10putToSleepEP3TCBm>:

void Scheduler::putToSleep(TCB* tcb, time_t sleepTime) {
    80001a44:	ff010113          	addi	sp,sp,-16
    80001a48:	00813423          	sd	s0,8(sp)
    80001a4c:	01010413          	addi	s0,sp,16
	if (sleepingHead == nullptr) {
    80001a50:	0000b817          	auipc	a6,0xb
    80001a54:	1a083803          	ld	a6,416(a6) # 8000cbf0 <_ZN9Scheduler12sleepingHeadE>
    80001a58:	02080863          	beqz	a6,80001a88 <_ZN9Scheduler10putToSleepEP3TCBm+0x44>
		tcb->timeToSleep = sleepTime;
		return;
	}
	TCB* prevSleeping = nullptr;
	time_t accumulated = 0;
	TCB* current = sleepingHead;
    80001a5c:	00080793          	mv	a5,a6
	time_t accumulated = 0;
    80001a60:	00000693          	li	a3,0
	TCB* prevSleeping = nullptr;
    80001a64:	00000613          	li	a2,0
	for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
    80001a68:	02078863          	beqz	a5,80001a98 <_ZN9Scheduler10putToSleepEP3TCBm+0x54>
    80001a6c:	0407b703          	ld	a4,64(a5)
    80001a70:	00d70733          	add	a4,a4,a3
    80001a74:	02b77263          	bgeu	a4,a1,80001a98 <_ZN9Scheduler10putToSleepEP3TCBm+0x54>
		accumulated += current->timeToSleep;
    80001a78:	00070693          	mv	a3,a4
		prevSleeping = current;
    80001a7c:	00078613          	mv	a2,a5
	for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
    80001a80:	0487b783          	ld	a5,72(a5)
    80001a84:	fe5ff06f          	j	80001a68 <_ZN9Scheduler10putToSleepEP3TCBm+0x24>
		sleepingHead = tcb;
    80001a88:	0000b797          	auipc	a5,0xb
    80001a8c:	16a7b423          	sd	a0,360(a5) # 8000cbf0 <_ZN9Scheduler12sleepingHeadE>
		tcb->timeToSleep = sleepTime;
    80001a90:	04b53023          	sd	a1,64(a0)
		return;
    80001a94:	02c0006f          	j	80001ac0 <_ZN9Scheduler10putToSleepEP3TCBm+0x7c>
	}
	if (!prevSleeping) {
    80001a98:	02060a63          	beqz	a2,80001acc <_ZN9Scheduler10putToSleepEP3TCBm+0x88>
		sleepingHead = tcb;
		tcb->timeToSleep = sleepTime;
		tcb->nextSleeping->timeToSleep -= sleepTime;
		return;
	}
	tcb->nextSleeping = current;
    80001a9c:	04f53423          	sd	a5,72(a0)
	prevSleeping->nextSleeping = tcb;
    80001aa0:	04a63423          	sd	a0,72(a2)
	tcb->timeToSleep = sleepTime - accumulated;
    80001aa4:	40d58733          	sub	a4,a1,a3
    80001aa8:	04e53023          	sd	a4,64(a0)
	if (current) current->timeToSleep -= sleepTime - accumulated;
    80001aac:	00078a63          	beqz	a5,80001ac0 <_ZN9Scheduler10putToSleepEP3TCBm+0x7c>
    80001ab0:	40b686b3          	sub	a3,a3,a1
    80001ab4:	0407b703          	ld	a4,64(a5)
    80001ab8:	00d706b3          	add	a3,a4,a3
    80001abc:	04d7b023          	sd	a3,64(a5)
}
    80001ac0:	00813403          	ld	s0,8(sp)
    80001ac4:	01010113          	addi	sp,sp,16
    80001ac8:	00008067          	ret
		tcb->nextSleeping = sleepingHead;
    80001acc:	05053423          	sd	a6,72(a0)
		sleepingHead = tcb;
    80001ad0:	0000b797          	auipc	a5,0xb
    80001ad4:	12a7b023          	sd	a0,288(a5) # 8000cbf0 <_ZN9Scheduler12sleepingHeadE>
		tcb->timeToSleep = sleepTime;
    80001ad8:	04b53023          	sd	a1,64(a0)
		tcb->nextSleeping->timeToSleep -= sleepTime;
    80001adc:	04083683          	ld	a3,64(a6)
    80001ae0:	40b686b3          	sub	a3,a3,a1
    80001ae4:	04d83023          	sd	a3,64(a6)
		return;
    80001ae8:	fd9ff06f          	j	80001ac0 <_ZN9Scheduler10putToSleepEP3TCBm+0x7c>

0000000080001aec <_ZN9Scheduler4wakeEv>:

void Scheduler::wake() {
	if (!sleepingHead) return;
    80001aec:	0000b797          	auipc	a5,0xb
    80001af0:	1047b783          	ld	a5,260(a5) # 8000cbf0 <_ZN9Scheduler12sleepingHeadE>
    80001af4:	06078a63          	beqz	a5,80001b68 <_ZN9Scheduler4wakeEv+0x7c>
	sleepingHead->timeToSleep--;
    80001af8:	0407b703          	ld	a4,64(a5)
    80001afc:	fff70713          	addi	a4,a4,-1
    80001b00:	04e7b023          	sd	a4,64(a5)
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001b04:	0000b517          	auipc	a0,0xb
    80001b08:	0ec53503          	ld	a0,236(a0) # 8000cbf0 <_ZN9Scheduler12sleepingHeadE>
    80001b0c:	04050e63          	beqz	a0,80001b68 <_ZN9Scheduler4wakeEv+0x7c>
    80001b10:	04053783          	ld	a5,64(a0)
    80001b14:	04079a63          	bnez	a5,80001b68 <_ZN9Scheduler4wakeEv+0x7c>
void Scheduler::wake() {
    80001b18:	ff010113          	addi	sp,sp,-16
    80001b1c:	00113423          	sd	ra,8(sp)
    80001b20:	00813023          	sd	s0,0(sp)
    80001b24:	01010413          	addi	s0,sp,16
    80001b28:	00c0006f          	j	80001b34 <_ZN9Scheduler4wakeEv+0x48>
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001b2c:	04053783          	ld	a5,64(a0)
    80001b30:	02079463          	bnez	a5,80001b58 <_ZN9Scheduler4wakeEv+0x6c>
		TCB* thread = sleepingHead;
		sleepingHead = sleepingHead->nextSleeping;
    80001b34:	04853783          	ld	a5,72(a0)
    80001b38:	0000b717          	auipc	a4,0xb
    80001b3c:	0af73c23          	sd	a5,184(a4) # 8000cbf0 <_ZN9Scheduler12sleepingHeadE>
		thread->nextSleeping = nullptr;
    80001b40:	04053423          	sd	zero,72(a0)
		Scheduler::put(thread);
    80001b44:	00000097          	auipc	ra,0x0
    80001b48:	e7c080e7          	jalr	-388(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001b4c:	0000b517          	auipc	a0,0xb
    80001b50:	0a453503          	ld	a0,164(a0) # 8000cbf0 <_ZN9Scheduler12sleepingHeadE>
    80001b54:	fc051ce3          	bnez	a0,80001b2c <_ZN9Scheduler4wakeEv+0x40>
	}
}
    80001b58:	00813083          	ld	ra,8(sp)
    80001b5c:	00013403          	ld	s0,0(sp)
    80001b60:	01010113          	addi	sp,sp,16
    80001b64:	00008067          	ret
    80001b68:	00008067          	ret

0000000080001b6c <_Z4idlePv>:

extern "C" void interruptHandler();

void userMain();

void idle(void*) {
    80001b6c:	ff010113          	addi	sp,sp,-16
    80001b70:	00113423          	sd	ra,8(sp)
    80001b74:	00813023          	sd	s0,0(sp)
    80001b78:	01010413          	addi	s0,sp,16
    while (1) { thread_dispatch(); }
    80001b7c:	00000097          	auipc	ra,0x0
    80001b80:	8ac080e7          	jalr	-1876(ra) # 80001428 <_Z15thread_dispatchv>
    80001b84:	ff9ff06f          	j	80001b7c <_Z4idlePv+0x10>

0000000080001b88 <_Z22kernelConsumerFunctionPv>:
}

void kernelConsumerFunction(void*) {
    80001b88:	ff010113          	addi	sp,sp,-16
    80001b8c:	00113423          	sd	ra,8(sp)
    80001b90:	00813023          	sd	s0,0(sp)
    80001b94:	01010413          	addi	s0,sp,16
    80001b98:	0280006f          	j	80001bc0 <_Z22kernelConsumerFunctionPv+0x38>
    while (1) {
        char c = KConsole::getFromOutput();
        while (!(*KConsole::sr & CONSOLE_TX_STATUS_BIT)) {}
        *KConsole::dr = c;
    80001b9c:	0000b797          	auipc	a5,0xb
    80001ba0:	f047b783          	ld	a5,-252(a5) # 8000caa0 <_GLOBAL_OFFSET_TABLE_+0x48>
    80001ba4:	0007b783          	ld	a5,0(a5)
    80001ba8:	00a78023          	sb	a0,0(a5)
        sem_signal(KConsole::outputBufferHasSpace);
    80001bac:	0000b797          	auipc	a5,0xb
    80001bb0:	efc7b783          	ld	a5,-260(a5) # 8000caa8 <_GLOBAL_OFFSET_TABLE_+0x50>
    80001bb4:	0007b503          	ld	a0,0(a5)
    80001bb8:	00000097          	auipc	ra,0x0
    80001bbc:	980080e7          	jalr	-1664(ra) # 80001538 <_Z10sem_signalP4KSem>
        char c = KConsole::getFromOutput();
    80001bc0:	00000097          	auipc	ra,0x0
    80001bc4:	c40080e7          	jalr	-960(ra) # 80001800 <_ZN8KConsole13getFromOutputEv>
        while (!(*KConsole::sr & CONSOLE_TX_STATUS_BIT)) {}
    80001bc8:	0000b797          	auipc	a5,0xb
    80001bcc:	f107b783          	ld	a5,-240(a5) # 8000cad8 <_GLOBAL_OFFSET_TABLE_+0x80>
    80001bd0:	0007b783          	ld	a5,0(a5)
    80001bd4:	0007c783          	lbu	a5,0(a5)
    80001bd8:	0207f793          	andi	a5,a5,32
    80001bdc:	fe0786e3          	beqz	a5,80001bc8 <_Z22kernelConsumerFunctionPv+0x40>
    80001be0:	fbdff06f          	j	80001b9c <_Z22kernelConsumerFunctionPv+0x14>

0000000080001be4 <main>:
    }

}

int main() {
    80001be4:	fd010113          	addi	sp,sp,-48
    80001be8:	02113423          	sd	ra,40(sp)
    80001bec:	02813023          	sd	s0,32(sp)
    80001bf0:	03010413          	addi	s0,sp,48
    //postavi adresu prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80001bf4:	0000b797          	auipc	a5,0xb
    80001bf8:	ecc7b783          	ld	a5,-308(a5) # 8000cac0 <_GLOBAL_OFFSET_TABLE_+0x68>
    80001bfc:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    MemoryAllocator::initMemoryAllocator();
    80001c00:	00002097          	auipc	ra,0x2
    80001c04:	824080e7          	jalr	-2012(ra) # 80003424 <_ZN15MemoryAllocator19initMemoryAllocatorEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    80001c08:	00000097          	auipc	ra,0x0
    80001c0c:	a58080e7          	jalr	-1448(ra) # 80001660 <_ZN8KConsole12initKConsoleEv>
    //pravljenje niti
    thread_t mainHandle;
    thread_t userHandle;
    thread_t idleHandle;
    thread_t consoleOutputHandle;
    thread_create(&mainHandle, nullptr, nullptr);
    80001c10:	00000613          	li	a2,0
    80001c14:	00000593          	li	a1,0
    80001c18:	fe840513          	addi	a0,s0,-24
    80001c1c:	fffff097          	auipc	ra,0xfffff
    80001c20:	764080e7          	jalr	1892(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::running = mainHandle;
    80001c24:	0000b797          	auipc	a5,0xb
    80001c28:	e8c7b783          	ld	a5,-372(a5) # 8000cab0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001c2c:	fe843703          	ld	a4,-24(s0)
    80001c30:	00e7b023          	sd	a4,0(a5)
    thread_create(&userHandle, (TCB::Body) userMain, nullptr);
    80001c34:	00000613          	li	a2,0
    80001c38:	0000b597          	auipc	a1,0xb
    80001c3c:	e285b583          	ld	a1,-472(a1) # 8000ca60 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001c40:	fe040513          	addi	a0,s0,-32
    80001c44:	fffff097          	auipc	ra,0xfffff
    80001c48:	73c080e7          	jalr	1852(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&consoleOutputHandle, kernelConsumerFunction, nullptr);
    80001c4c:	00000613          	li	a2,0
    80001c50:	00000597          	auipc	a1,0x0
    80001c54:	f3858593          	addi	a1,a1,-200 # 80001b88 <_Z22kernelConsumerFunctionPv>
    80001c58:	fd040513          	addi	a0,s0,-48
    80001c5c:	fffff097          	auipc	ra,0xfffff
    80001c60:	724080e7          	jalr	1828(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&idleHandle, idle, nullptr);
    80001c64:	00000613          	li	a2,0
    80001c68:	00000597          	auipc	a1,0x0
    80001c6c:	f0458593          	addi	a1,a1,-252 # 80001b6c <_Z4idlePv>
    80001c70:	fd840513          	addi	a0,s0,-40
    80001c74:	fffff097          	auipc	ra,0xfffff
    80001c78:	70c080e7          	jalr	1804(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
inline void Riscv::w_sip(uint64 sip) {
	__asm__ volatile("csrw sip, %[sip]": :[sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80001c7c:	00200793          	li	a5,2
    80001c80:	1007a073          	csrs	sstatus,a5

    //omogucavanje prekida
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    //cekanje da se userMain zavrsi
    thread_join(userHandle);
    80001c84:	fe043503          	ld	a0,-32(s0)
    80001c88:	fffff097          	auipc	ra,0xfffff
    80001c8c:	7c0080e7          	jalr	1984(ra) # 80001448 <_Z11thread_joinP3TCB>


    //printString("\nSad cu da izadjem\n");

    //flush output bafera za konzolu
    while (KConsole::outputHead != KConsole::outputTail) {}
    80001c90:	0000b797          	auipc	a5,0xb
    80001c94:	e007b783          	ld	a5,-512(a5) # 8000ca90 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001c98:	0007a703          	lw	a4,0(a5)
    80001c9c:	0000b797          	auipc	a5,0xb
    80001ca0:	e347b783          	ld	a5,-460(a5) # 8000cad0 <_GLOBAL_OFFSET_TABLE_+0x78>
    80001ca4:	0007a783          	lw	a5,0(a5)
    80001ca8:	fef714e3          	bne	a4,a5,80001c90 <main+0xac>
}

inline void Riscv::mc_sstatus(uint64 mask) {
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80001cac:	00200793          	li	a5,2
    80001cb0:	1007b073          	csrc	sstatus,a5
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    return 0;


    80001cb4:	00000513          	li	a0,0
    80001cb8:	02813083          	ld	ra,40(sp)
    80001cbc:	02013403          	ld	s0,32(sp)
    80001cc0:	03010113          	addi	sp,sp,48
    80001cc4:	00008067          	ret

0000000080001cc8 <interruptRoutine>:
#include "../test/printing.hpp"

//void printInteger(int i);

#pragma GCC optimize("O0")
extern "C" void interruptRoutine() {
    80001cc8:	ec010113          	addi	sp,sp,-320
    80001ccc:	12113c23          	sd	ra,312(sp)
    80001cd0:	12813823          	sd	s0,304(sp)
    80001cd4:	14010413          	addi	s0,sp,320
	uint64 scause, sepc, sstatus;
	__asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001cd8:	14202373          	csrr	t1,scause
    80001cdc:	fc643c23          	sd	t1,-40(s0)
	__asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001ce0:	14102373          	csrr	t1,sepc
    80001ce4:	fc643823          	sd	t1,-48(s0)
	__asm__ volatile("csrr %[status], sstatus":[status] "=r"(
			sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001ce8:	10002373          	csrr	t1,sstatus
    80001cec:	fc643423          	sd	t1,-56(s0)
	uint64 a0, a1, a2, a3, a4, a5, a6, a7;
	__asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001cf0:	00050313          	mv	t1,a0
    80001cf4:	fc643023          	sd	t1,-64(s0)
	__asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001cf8:	00058313          	mv	t1,a1
    80001cfc:	fa643c23          	sd	t1,-72(s0)
	__asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001d00:	00060313          	mv	t1,a2
    80001d04:	fa643823          	sd	t1,-80(s0)
	__asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001d08:	00068313          	mv	t1,a3
    80001d0c:	fa643423          	sd	t1,-88(s0)
	__asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001d10:	00070313          	mv	t1,a4
    80001d14:	fa643023          	sd	t1,-96(s0)
	__asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001d18:	00078313          	mv	t1,a5
    80001d1c:	f8643c23          	sd	t1,-104(s0)
	__asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001d20:	00080313          	mv	t1,a6
    80001d24:	f8643823          	sd	t1,-112(s0)
	__asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001d28:	00088313          	mv	t1,a7
    80001d2c:	f8643423          	sd	t1,-120(s0)

	if (scause == 0x09 || scause == 0x08) {
    80001d30:	fd843703          	ld	a4,-40(s0)
    80001d34:	00900793          	li	a5,9
    80001d38:	00f70863          	beq	a4,a5,80001d48 <interruptRoutine+0x80>
    80001d3c:	fd843703          	ld	a4,-40(s0)
    80001d40:	00800793          	li	a5,8
    80001d44:	50f71663          	bne	a4,a5,80002250 <interruptRoutine+0x588>
		//prekid zbog poziva ecall
		uint64 opCode = a0;
    80001d48:	fc043783          	ld	a5,-64(s0)
    80001d4c:	f6f43c23          	sd	a5,-136(s0)
		switch (opCode) {
    80001d50:	f7843703          	ld	a4,-136(s0)
    80001d54:	09100793          	li	a5,145
    80001d58:	38f70063          	beq	a4,a5,800020d8 <interruptRoutine+0x410>
    80001d5c:	f7843703          	ld	a4,-136(s0)
    80001d60:	09100793          	li	a5,145
    80001d64:	44e7ee63          	bltu	a5,a4,800021c0 <interruptRoutine+0x4f8>
    80001d68:	f7843703          	ld	a4,-136(s0)
    80001d6c:	09000793          	li	a5,144
    80001d70:	32f70863          	beq	a4,a5,800020a0 <interruptRoutine+0x3d8>
    80001d74:	f7843703          	ld	a4,-136(s0)
    80001d78:	09000793          	li	a5,144
    80001d7c:	44e7e263          	bltu	a5,a4,800021c0 <interruptRoutine+0x4f8>
    80001d80:	f7843703          	ld	a4,-136(s0)
    80001d84:	08100793          	li	a5,129
    80001d88:	30f70063          	beq	a4,a5,80002088 <interruptRoutine+0x3c0>
    80001d8c:	f7843703          	ld	a4,-136(s0)
    80001d90:	08100793          	li	a5,129
    80001d94:	42e7e663          	bltu	a5,a4,800021c0 <interruptRoutine+0x4f8>
    80001d98:	f7843703          	ld	a4,-136(s0)
    80001d9c:	04200793          	li	a5,66
    80001da0:	04e7e263          	bltu	a5,a4,80001de4 <interruptRoutine+0x11c>
    80001da4:	f7843783          	ld	a5,-136(s0)
    80001da8:	40078c63          	beqz	a5,800021c0 <interruptRoutine+0x4f8>
    80001dac:	f7843703          	ld	a4,-136(s0)
    80001db0:	04200793          	li	a5,66
    80001db4:	40e7e663          	bltu	a5,a4,800021c0 <interruptRoutine+0x4f8>
    80001db8:	f7843783          	ld	a5,-136(s0)
    80001dbc:	00279713          	slli	a4,a5,0x2
    80001dc0:	00008797          	auipc	a5,0x8
    80001dc4:	32478793          	addi	a5,a5,804 # 8000a0e4 <CONSOLE_STATUS+0xd4>
    80001dc8:	00f707b3          	add	a5,a4,a5
    80001dcc:	0007a783          	lw	a5,0(a5)
    80001dd0:	0007871b          	sext.w	a4,a5
    80001dd4:	00008797          	auipc	a5,0x8
    80001dd8:	31078793          	addi	a5,a5,784 # 8000a0e4 <CONSOLE_STATUS+0xd4>
    80001ddc:	00f707b3          	add	a5,a4,a5
    80001de0:	00078067          	jr	a5
    80001de4:	f7843703          	ld	a4,-136(s0)
    80001de8:	08000793          	li	a5,128
    80001dec:	22f70e63          	beq	a4,a5,80002028 <interruptRoutine+0x360>
    80001df0:	3d00006f          	j	800021c0 <interruptRoutine+0x4f8>
			case 0x01:
				//mem_alloc
				size_t size;
				size = (size_t)a1;	//size je broj blokova koje treba alocirati
    80001df4:	fb843783          	ld	a5,-72(s0)
    80001df8:	ecf43823          	sd	a5,-304(s0)
				size = size * MEM_BLOCK_SIZE;
    80001dfc:	ed043783          	ld	a5,-304(s0)
    80001e00:	00679793          	slli	a5,a5,0x6
    80001e04:	ecf43823          	sd	a5,-304(s0)
				MemoryAllocator::kmalloc(size);
    80001e08:	00300593          	li	a1,3
    80001e0c:	ed043503          	ld	a0,-304(s0)
    80001e10:	00001097          	auipc	ra,0x1
    80001e14:	02c080e7          	jalr	44(ra) # 80002e3c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
				__asm__ volatile("sd a0, 80(s0)");
    80001e18:	04a43823          	sd	a0,80(s0)
				break;
    80001e1c:	4100006f          	j	8000222c <interruptRoutine+0x564>
			case 0x02:
				//mem_free
				void* ptr;
				ptr = (void*)a1;
    80001e20:	fb843783          	ld	a5,-72(s0)
    80001e24:	ecf43c23          	sd	a5,-296(s0)
				MemoryAllocator::kfree(ptr);
    80001e28:	ed843503          	ld	a0,-296(s0)
    80001e2c:	00001097          	auipc	ra,0x1
    80001e30:	2b8080e7          	jalr	696(ra) # 800030e4 <_ZN15MemoryAllocator5kfreeEPv>
				__asm__ volatile("sd a0, 80(s0)");
    80001e34:	04a43823          	sd	a0,80(s0)
				break;
    80001e38:	3f40006f          	j	8000222c <interruptRoutine+0x564>
			case 0x11:
				//thread_create
				thread_t* handle;
				handle = (thread_t*)a1;
    80001e3c:	fb843783          	ld	a5,-72(s0)
    80001e40:	eef43c23          	sd	a5,-264(s0)
				void (* function)(void*);
				function = (void (*)(void*))a2;
    80001e44:	fb043783          	ld	a5,-80(s0)
    80001e48:	eef43823          	sd	a5,-272(s0)
				void* args;
				args = (void*)a3;
    80001e4c:	fa843783          	ld	a5,-88(s0)
    80001e50:	eef43423          	sd	a5,-280(s0)
				uint64* sp;
				sp = (uint64*)a4;
    80001e54:	fa043783          	ld	a5,-96(s0)
    80001e58:	eef43023          	sd	a5,-288(s0)

				*handle = TCB::createThread(function, args, sp);
    80001e5c:	ee043603          	ld	a2,-288(s0)
    80001e60:	ee843583          	ld	a1,-280(s0)
    80001e64:	ef043503          	ld	a0,-272(s0)
    80001e68:	00001097          	auipc	ra,0x1
    80001e6c:	e00080e7          	jalr	-512(ra) # 80002c68 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80001e70:	00050713          	mv	a4,a0
    80001e74:	ef843783          	ld	a5,-264(s0)
    80001e78:	00e7b023          	sd	a4,0(a5)
				TCB::start(*handle);
    80001e7c:	ef843783          	ld	a5,-264(s0)
    80001e80:	0007b783          	ld	a5,0(a5)
    80001e84:	00078513          	mv	a0,a5
    80001e88:	00001097          	auipc	ra,0x1
    80001e8c:	f60080e7          	jalr	-160(ra) # 80002de8 <_ZN3TCB5startEPS_>
				if (*handle != nullptr) {
    80001e90:	ef843783          	ld	a5,-264(s0)
    80001e94:	0007b783          	ld	a5,0(a5)
    80001e98:	00078663          	beqz	a5,80001ea4 <interruptRoutine+0x1dc>
					__asm__ volatile("li a0, 0");
    80001e9c:	00000513          	li	a0,0
    80001ea0:	0080006f          	j	80001ea8 <interruptRoutine+0x1e0>
				} else {
					__asm__ volatile("li a0, -1");
    80001ea4:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    80001ea8:	04a43823          	sd	a0,80(s0)
				break;
    80001eac:	3800006f          	j	8000222c <interruptRoutine+0x564>
			case 0x12:
				//thread_exit
				TCB::running->setFinished(true);
    80001eb0:	0000b797          	auipc	a5,0xb
    80001eb4:	c007b783          	ld	a5,-1024(a5) # 8000cab0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001eb8:	0007b783          	ld	a5,0(a5)
    80001ebc:	00100593          	li	a1,1
    80001ec0:	00078513          	mv	a0,a5
    80001ec4:	00000097          	auipc	ra,0x0
    80001ec8:	59c080e7          	jalr	1436(ra) # 80002460 <_ZN3TCB11setFinishedEb>
				TCB::releaseJoined();
    80001ecc:	00001097          	auipc	ra,0x1
    80001ed0:	ec0080e7          	jalr	-320(ra) # 80002d8c <_ZN3TCB13releaseJoinedEv>
				TCB::yield();
    80001ed4:	00001097          	auipc	ra,0x1
    80001ed8:	d34080e7          	jalr	-716(ra) # 80002c08 <_ZN3TCB5yieldEv>
				break;
    80001edc:	3500006f          	j	8000222c <interruptRoutine+0x564>
			case 0x13:
				//thread_dispatch
				TCB::yield();
    80001ee0:	00001097          	auipc	ra,0x1
    80001ee4:	d28080e7          	jalr	-728(ra) # 80002c08 <_ZN3TCB5yieldEv>
				break;
    80001ee8:	3440006f          	j	8000222c <interruptRoutine+0x564>
			case 0x14:
				//thread_join
				thread_t handleToJoin;
				handleToJoin = (thread_t)a1;
    80001eec:	fb843783          	ld	a5,-72(s0)
    80001ef0:	f0f43023          	sd	a5,-256(s0)
				TCB::threadJoin(handleToJoin);
    80001ef4:	f0043503          	ld	a0,-256(s0)
    80001ef8:	00001097          	auipc	ra,0x1
    80001efc:	e4c080e7          	jalr	-436(ra) # 80002d44 <_ZN3TCB10threadJoinEPS_>
				TCB::yield();
    80001f00:	00001097          	auipc	ra,0x1
    80001f04:	d08080e7          	jalr	-760(ra) # 80002c08 <_ZN3TCB5yieldEv>
				break;
    80001f08:	3240006f          	j	8000222c <interruptRoutine+0x564>
			case 0x21:
				//sem_open
				sem_t* openHandle;
				openHandle = (sem_t*)a1;
    80001f0c:	fb843783          	ld	a5,-72(s0)
    80001f10:	f0f43823          	sd	a5,-240(s0)
				uint initVal;
				initVal = (uint)a2;
    80001f14:	fb043783          	ld	a5,-80(s0)
    80001f18:	f0f42623          	sw	a5,-244(s0)
				*openHandle = KSem::initSem(initVal);
    80001f1c:	f0c42783          	lw	a5,-244(s0)
    80001f20:	00078513          	mv	a0,a5
    80001f24:	00001097          	auipc	ra,0x1
    80001f28:	604080e7          	jalr	1540(ra) # 80003528 <_ZN4KSem7initSemEj>
    80001f2c:	00050713          	mv	a4,a0
    80001f30:	f1043783          	ld	a5,-240(s0)
    80001f34:	00e7b023          	sd	a4,0(a5)
				if (*openHandle != nullptr) {
    80001f38:	f1043783          	ld	a5,-240(s0)
    80001f3c:	0007b783          	ld	a5,0(a5)
    80001f40:	00078663          	beqz	a5,80001f4c <interruptRoutine+0x284>
					__asm__ volatile("li a0, 0");
    80001f44:	00000513          	li	a0,0
    80001f48:	0080006f          	j	80001f50 <interruptRoutine+0x288>
				} else {
					__asm__ volatile("li a0, -1");
    80001f4c:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    80001f50:	04a43823          	sd	a0,80(s0)
				break;
    80001f54:	2d80006f          	j	8000222c <interruptRoutine+0x564>
			case 0x22:
				//sem_close
				sem_t closeHandle;
				closeHandle = (sem_t)a1;
    80001f58:	fb843783          	ld	a5,-72(s0)
    80001f5c:	f0f43c23          	sd	a5,-232(s0)
				KSem::closeSem(closeHandle);
    80001f60:	f1843503          	ld	a0,-232(s0)
    80001f64:	00001097          	auipc	ra,0x1
    80001f68:	73c080e7          	jalr	1852(ra) # 800036a0 <_ZN4KSem8closeSemEPS_>
				__asm__ volatile("sd a0, 80(s0)");
    80001f6c:	04a43823          	sd	a0,80(s0)
				break;
    80001f70:	2bc0006f          	j	8000222c <interruptRoutine+0x564>
			case 0x23:
				//sem_wait
				sem_t waitHandle;
				waitHandle = (sem_t)a1;
    80001f74:	fb843783          	ld	a5,-72(s0)
    80001f78:	f2f43023          	sd	a5,-224(s0)
				waitHandle->wait();
    80001f7c:	f2043503          	ld	a0,-224(s0)
    80001f80:	00001097          	auipc	ra,0x1
    80001f84:	63c080e7          	jalr	1596(ra) # 800035bc <_ZN4KSem4waitEv>
				__asm__ volatile("sd a0, 80(s0)");
    80001f88:	04a43823          	sd	a0,80(s0)
				break;
    80001f8c:	2a00006f          	j	8000222c <interruptRoutine+0x564>
			case 0x24:
				//sem_signal
				sem_t signalHandle;
				signalHandle = (sem_t)a1;
    80001f90:	fb843783          	ld	a5,-72(s0)
    80001f94:	f2f43423          	sd	a5,-216(s0)
				signalHandle->signal();
    80001f98:	f2843503          	ld	a0,-216(s0)
    80001f9c:	00001097          	auipc	ra,0x1
    80001fa0:	6b0080e7          	jalr	1712(ra) # 8000364c <_ZN4KSem6signalEv>
				__asm__ volatile("sd a0, 80(s0)");
    80001fa4:	04a43823          	sd	a0,80(s0)
				break;
    80001fa8:	2840006f          	j	8000222c <interruptRoutine+0x564>
			case 0x31:
				//time_sleep
				time_t timerPeriods;
				timerPeriods = (time_t)a1;
    80001fac:	fb843783          	ld	a5,-72(s0)
    80001fb0:	f2f43823          	sd	a5,-208(s0)
				if (timerPeriods > 0) {
    80001fb4:	f3043783          	ld	a5,-208(s0)
    80001fb8:	00078663          	beqz	a5,80001fc4 <interruptRoutine+0x2fc>
					__asm__ volatile("li a0, 0");
    80001fbc:	00000513          	li	a0,0
    80001fc0:	0080006f          	j	80001fc8 <interruptRoutine+0x300>
				} else {
					__asm__ volatile("li a0, -1");
    80001fc4:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    80001fc8:	04a43823          	sd	a0,80(s0)
				if (timerPeriods > 0) {
    80001fcc:	f3043783          	ld	a5,-208(s0)
    80001fd0:	24078463          	beqz	a5,80002218 <interruptRoutine+0x550>
					Scheduler::putToSleep(TCB::running, timerPeriods);
    80001fd4:	0000b797          	auipc	a5,0xb
    80001fd8:	adc7b783          	ld	a5,-1316(a5) # 8000cab0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001fdc:	0007b783          	ld	a5,0(a5)
    80001fe0:	f3043583          	ld	a1,-208(s0)
    80001fe4:	00078513          	mv	a0,a5
    80001fe8:	00000097          	auipc	ra,0x0
    80001fec:	a5c080e7          	jalr	-1444(ra) # 80001a44 <_ZN9Scheduler10putToSleepEP3TCBm>
					TCB::yield();
    80001ff0:	00001097          	auipc	ra,0x1
    80001ff4:	c18080e7          	jalr	-1000(ra) # 80002c08 <_ZN3TCB5yieldEv>
				}
				break;
    80001ff8:	2200006f          	j	80002218 <interruptRoutine+0x550>
			case 0x41:
				//getc
				KConsole::kgetc();
    80001ffc:	00000097          	auipc	ra,0x0
    80002000:	938080e7          	jalr	-1736(ra) # 80001934 <_ZN8KConsole5kgetcEv>
				__asm__ volatile("sd a0, 80(s0)");
    80002004:	04a43823          	sd	a0,80(s0)
				break;
    80002008:	2240006f          	j	8000222c <interruptRoutine+0x564>
			case 0x42:
				//putc
				char c;
				c = (char)a1;
    8000200c:	fb843783          	ld	a5,-72(s0)
    80002010:	f2f40fa3          	sb	a5,-193(s0)
				KConsole::kputc(c);
    80002014:	f3f44783          	lbu	a5,-193(s0)
    80002018:	00078513          	mv	a0,a5
    8000201c:	00000097          	auipc	ra,0x0
    80002020:	8a8080e7          	jalr	-1880(ra) # 800018c4 <_ZN8KConsole5kputcEc>
				break;
    80002024:	2080006f          	j	8000222c <interruptRoutine+0x564>
			case 0x80:
				//alloc thread
				thread_t* handleAlloc;
				handleAlloc = (thread_t*)a1;
    80002028:	fb843783          	ld	a5,-72(s0)
    8000202c:	f4f43c23          	sd	a5,-168(s0)
				void (* foo)(void*);
				foo = (void (*)(void*))a2;
    80002030:	fb043783          	ld	a5,-80(s0)
    80002034:	f4f43823          	sd	a5,-176(s0)
				void* argsAlloc;
				argsAlloc = (void*)a3;
    80002038:	fa843783          	ld	a5,-88(s0)
    8000203c:	f4f43423          	sd	a5,-184(s0)
				uint64* spAlloc;
				spAlloc = (uint64*)a4;
    80002040:	fa043783          	ld	a5,-96(s0)
    80002044:	f4f43023          	sd	a5,-192(s0)

				*handleAlloc = TCB::createThread(foo, argsAlloc, spAlloc);
    80002048:	f4043603          	ld	a2,-192(s0)
    8000204c:	f4843583          	ld	a1,-184(s0)
    80002050:	f5043503          	ld	a0,-176(s0)
    80002054:	00001097          	auipc	ra,0x1
    80002058:	c14080e7          	jalr	-1004(ra) # 80002c68 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    8000205c:	00050713          	mv	a4,a0
    80002060:	f5843783          	ld	a5,-168(s0)
    80002064:	00e7b023          	sd	a4,0(a5)
				if (*handleAlloc != nullptr) {
    80002068:	f5843783          	ld	a5,-168(s0)
    8000206c:	0007b783          	ld	a5,0(a5)
    80002070:	00078663          	beqz	a5,8000207c <interruptRoutine+0x3b4>
					__asm__ volatile("li a0, 0");
    80002074:	00000513          	li	a0,0
    80002078:	0080006f          	j	80002080 <interruptRoutine+0x3b8>
				} else {
					__asm__ volatile("li a0, -1");
    8000207c:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    80002080:	04a43823          	sd	a0,80(s0)
				break;
    80002084:	1a80006f          	j	8000222c <interruptRoutine+0x564>
			case 0x81:
				//start thread
				thread_t threadStartHandle;
				threadStartHandle = (thread_t)a1;
    80002088:	fb843783          	ld	a5,-72(s0)
    8000208c:	f6f43023          	sd	a5,-160(s0)
				Scheduler::put(threadStartHandle);
    80002090:	f6043503          	ld	a0,-160(s0)
    80002094:	00000097          	auipc	ra,0x0
    80002098:	92c080e7          	jalr	-1748(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
				break;
    8000209c:	1900006f          	j	8000222c <interruptRoutine+0x564>
			case 0x90:
				//printString
				const char* string;
				string = (const char*)a1;
    800020a0:	fb843783          	ld	a5,-72(s0)
    800020a4:	fef43423          	sd	a5,-24(s0)
				while (*string != '\0') {
    800020a8:	fe843783          	ld	a5,-24(s0)
    800020ac:	0007c783          	lbu	a5,0(a5)
    800020b0:	16078863          	beqz	a5,80002220 <interruptRoutine+0x558>
					putc(*string);
    800020b4:	fe843783          	ld	a5,-24(s0)
    800020b8:	0007c783          	lbu	a5,0(a5)
    800020bc:	00078513          	mv	a0,a5
    800020c0:	fffff097          	auipc	ra,0xfffff
    800020c4:	4d0080e7          	jalr	1232(ra) # 80001590 <_Z4putcc>
					string++;
    800020c8:	fe843783          	ld	a5,-24(s0)
    800020cc:	00178793          	addi	a5,a5,1
    800020d0:	fef43423          	sd	a5,-24(s0)
				while (*string != '\0') {
    800020d4:	fd5ff06f          	j	800020a8 <interruptRoutine+0x3e0>
				}
				break;
			case 0x91:
				//printInteger
				uint64 integer;
				integer = a1;
    800020d8:	fb843783          	ld	a5,-72(s0)
    800020dc:	f6f43823          	sd	a5,-144(s0)
				static char digits[] = "0123456789";
				char buf[16];
				int i, neg;
				uint x;

				neg = 0;
    800020e0:	f6042623          	sw	zero,-148(s0)
				if (integer < 0) {
					neg = 1;
					x = -integer;
				} else {
					x = integer;
    800020e4:	f7043783          	ld	a5,-144(s0)
    800020e8:	fef42023          	sw	a5,-32(s0)
				}

				i = 0;
    800020ec:	fe042223          	sw	zero,-28(s0)
				do {
					buf[i++] = digits[x % 10];
    800020f0:	fe042703          	lw	a4,-32(s0)
    800020f4:	00a00793          	li	a5,10
    800020f8:	02f777bb          	remuw	a5,a4,a5
    800020fc:	0007861b          	sext.w	a2,a5
    80002100:	fe442783          	lw	a5,-28(s0)
    80002104:	0017871b          	addiw	a4,a5,1
    80002108:	fee42223          	sw	a4,-28(s0)
    8000210c:	0000a697          	auipc	a3,0xa
    80002110:	71468693          	addi	a3,a3,1812 # 8000c820 <_ZZ16interruptRoutineE6digits>
    80002114:	02061713          	slli	a4,a2,0x20
    80002118:	02075713          	srli	a4,a4,0x20
    8000211c:	00e68733          	add	a4,a3,a4
    80002120:	00074703          	lbu	a4,0(a4)
    80002124:	ff040693          	addi	a3,s0,-16
    80002128:	00f687b3          	add	a5,a3,a5
    8000212c:	ece78823          	sb	a4,-304(a5)
				} while ((x /= 10) != 0);
    80002130:	fe042703          	lw	a4,-32(s0)
    80002134:	00a00793          	li	a5,10
    80002138:	02f757bb          	divuw	a5,a4,a5
    8000213c:	fef42023          	sw	a5,-32(s0)
    80002140:	fe042783          	lw	a5,-32(s0)
    80002144:	0007879b          	sext.w	a5,a5
    80002148:	00f037b3          	snez	a5,a5
    8000214c:	0ff7f793          	andi	a5,a5,255
    80002150:	00078463          	beqz	a5,80002158 <interruptRoutine+0x490>
				do {
    80002154:	f9dff06f          	j	800020f0 <interruptRoutine+0x428>
				if (neg) buf[i++] = '-';
    80002158:	f6c42783          	lw	a5,-148(s0)
    8000215c:	0007879b          	sext.w	a5,a5
    80002160:	02078063          	beqz	a5,80002180 <interruptRoutine+0x4b8>
    80002164:	fe442783          	lw	a5,-28(s0)
    80002168:	0017871b          	addiw	a4,a5,1
    8000216c:	fee42223          	sw	a4,-28(s0)
    80002170:	ff040713          	addi	a4,s0,-16
    80002174:	00f707b3          	add	a5,a4,a5
    80002178:	02d00713          	li	a4,45
    8000217c:	ece78823          	sb	a4,-304(a5)

				while (--i >= 0) {
    80002180:	fe442783          	lw	a5,-28(s0)
    80002184:	fff7879b          	addiw	a5,a5,-1
    80002188:	fef42223          	sw	a5,-28(s0)
    8000218c:	fe442783          	lw	a5,-28(s0)
    80002190:	fff7c793          	not	a5,a5
    80002194:	01f7d79b          	srliw	a5,a5,0x1f
    80002198:	0ff7f793          	andi	a5,a5,255
    8000219c:	08078663          	beqz	a5,80002228 <interruptRoutine+0x560>
					putc(buf[i]);
    800021a0:	fe442783          	lw	a5,-28(s0)
    800021a4:	ff040713          	addi	a4,s0,-16
    800021a8:	00f707b3          	add	a5,a4,a5
    800021ac:	ed07c783          	lbu	a5,-304(a5)
    800021b0:	00078513          	mv	a0,a5
    800021b4:	fffff097          	auipc	ra,0xfffff
    800021b8:	3dc080e7          	jalr	988(ra) # 80001590 <_Z4putcc>
				while (--i >= 0) {
    800021bc:	fc5ff06f          	j	80002180 <interruptRoutine+0x4b8>
				}
				break;
			default:
				printString("\nNepostojeci op code: ");
    800021c0:	00008517          	auipc	a0,0x8
    800021c4:	eb050513          	addi	a0,a0,-336 # 8000a070 <CONSOLE_STATUS+0x60>
    800021c8:	00004097          	auipc	ra,0x4
    800021cc:	c30080e7          	jalr	-976(ra) # 80005df8 <_Z11printStringPKc>
				printInteger(opCode);
    800021d0:	f7843503          	ld	a0,-136(s0)
    800021d4:	fffff097          	auipc	ra,0xfffff
    800021d8:	7c4080e7          	jalr	1988(ra) # 80001998 <_Z12printIntegerm>
				printString("\nscause: ");
    800021dc:	00008517          	auipc	a0,0x8
    800021e0:	eac50513          	addi	a0,a0,-340 # 8000a088 <CONSOLE_STATUS+0x78>
    800021e4:	00004097          	auipc	ra,0x4
    800021e8:	c14080e7          	jalr	-1004(ra) # 80005df8 <_Z11printStringPKc>
				printInteger(scause);
    800021ec:	fd843503          	ld	a0,-40(s0)
    800021f0:	fffff097          	auipc	ra,0xfffff
    800021f4:	7a8080e7          	jalr	1960(ra) # 80001998 <_Z12printIntegerm>
				printString("\nsepc: ");
    800021f8:	00008517          	auipc	a0,0x8
    800021fc:	ea050513          	addi	a0,a0,-352 # 8000a098 <CONSOLE_STATUS+0x88>
    80002200:	00004097          	auipc	ra,0x4
    80002204:	bf8080e7          	jalr	-1032(ra) # 80005df8 <_Z11printStringPKc>
				printInteger(sepc);
    80002208:	fd043503          	ld	a0,-48(s0)
    8000220c:	fffff097          	auipc	ra,0xfffff
    80002210:	78c080e7          	jalr	1932(ra) # 80001998 <_Z12printIntegerm>
				break;
    80002214:	0180006f          	j	8000222c <interruptRoutine+0x564>
				break;
    80002218:	00000013          	nop
    8000221c:	0100006f          	j	8000222c <interruptRoutine+0x564>
				break;
    80002220:	00000013          	nop
    80002224:	0080006f          	j	8000222c <interruptRoutine+0x564>
				break;
    80002228:	00000013          	nop
		}
		//sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
		//sepc += 4;
		__asm__ volatile("addi %[dst], %[src], 0x4":[dst]"=r"(sepc):[src]"r"(
				sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000222c:	fd043303          	ld	t1,-48(s0)
    80002230:	00430313          	addi	t1,t1,4
    80002234:	fc643823          	sd	t1,-48(s0)
		__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002238:	fd043303          	ld	t1,-48(s0)
    8000223c:	14131073          	csrw	sepc,t1
		__asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002240:	fc843303          	ld	t1,-56(s0)
    80002244:	10031073          	csrw	sstatus,t1
    80002248:	00000013          	nop
		printString("scause: ");
		printInteger(scause);
		printString("\nsepc: ");
		printInteger(sepc);
	}
}
    8000224c:	1ac0006f          	j	800023f8 <interruptRoutine+0x730>
	} else if (scause == (1UL << 63 | 9)) {
    80002250:	fd843703          	ld	a4,-40(s0)
    80002254:	fff00793          	li	a5,-1
    80002258:	03f79793          	slli	a5,a5,0x3f
    8000225c:	00978793          	addi	a5,a5,9
    80002260:	0af71263          	bne	a4,a5,80002304 <interruptRoutine+0x63c>
		uint64 irq = plic_claim();
    80002264:	00005097          	auipc	ra,0x5
    80002268:	640080e7          	jalr	1600(ra) # 800078a4 <plic_claim>
    8000226c:	00050793          	mv	a5,a0
    80002270:	f8f43023          	sd	a5,-128(s0)
		if (irq == CONSOLE_IRQ) {
    80002274:	f8043703          	ld	a4,-128(s0)
    80002278:	00a00793          	li	a5,10
    8000227c:	04f71863          	bne	a4,a5,800022cc <interruptRoutine+0x604>
			if (*KConsole::sr & CONSOLE_RX_STATUS_BIT) {
    80002280:	0000b797          	auipc	a5,0xb
    80002284:	8587b783          	ld	a5,-1960(a5) # 8000cad8 <_GLOBAL_OFFSET_TABLE_+0x80>
    80002288:	0007b783          	ld	a5,0(a5)
    8000228c:	0007c783          	lbu	a5,0(a5)
    80002290:	0017f793          	andi	a5,a5,1
    80002294:	02078063          	beqz	a5,800022b4 <interruptRoutine+0x5ec>
				KConsole::placeInInput(*KConsole::dr);
    80002298:	0000b797          	auipc	a5,0xb
    8000229c:	8087b783          	ld	a5,-2040(a5) # 8000caa0 <_GLOBAL_OFFSET_TABLE_+0x48>
    800022a0:	0007b783          	ld	a5,0(a5)
    800022a4:	0007c783          	lbu	a5,0(a5)
    800022a8:	00078513          	mv	a0,a5
    800022ac:	fffff097          	auipc	ra,0xfffff
    800022b0:	5ac080e7          	jalr	1452(ra) # 80001858 <_ZN8KConsole12placeInInputEc>
			plic_complete(irq);
    800022b4:	f8043783          	ld	a5,-128(s0)
    800022b8:	0007879b          	sext.w	a5,a5
    800022bc:	00078513          	mv	a0,a5
    800022c0:	00005097          	auipc	ra,0x5
    800022c4:	61c080e7          	jalr	1564(ra) # 800078dc <plic_complete>
    800022c8:	0140006f          	j	800022dc <interruptRoutine+0x614>
			printString("Neki drugi prekid\n");
    800022cc:	00008517          	auipc	a0,0x8
    800022d0:	dd450513          	addi	a0,a0,-556 # 8000a0a0 <CONSOLE_STATUS+0x90>
    800022d4:	00004097          	auipc	ra,0x4
    800022d8:	b24080e7          	jalr	-1244(ra) # 80005df8 <_Z11printStringPKc>
		Riscv::w_sepc(sepc);
    800022dc:	fd043503          	ld	a0,-48(s0)
    800022e0:	00000097          	auipc	ra,0x0
    800022e4:	12c080e7          	jalr	300(ra) # 8000240c <_ZN5Riscv6w_sepcEm>
		Riscv::w_sstatus(sstatus);
    800022e8:	fc843503          	ld	a0,-56(s0)
    800022ec:	00000097          	auipc	ra,0x0
    800022f0:	158080e7          	jalr	344(ra) # 80002444 <_ZN5Riscv9w_sstatusEm>
		Riscv::mc_sip(Riscv::SIP_SEIP);
    800022f4:	20000513          	li	a0,512
    800022f8:	00000097          	auipc	ra,0x0
    800022fc:	130080e7          	jalr	304(ra) # 80002428 <_ZN5Riscv6mc_sipEm>
}
    80002300:	0f80006f          	j	800023f8 <interruptRoutine+0x730>
	} else if (scause == (1UL << 63 | 1)) {
    80002304:	fd843703          	ld	a4,-40(s0)
    80002308:	fff00793          	li	a5,-1
    8000230c:	03f79793          	slli	a5,a5,0x3f
    80002310:	00178793          	addi	a5,a5,1
    80002314:	08f71e63          	bne	a4,a5,800023b0 <interruptRoutine+0x6e8>
		Scheduler::wake();
    80002318:	fffff097          	auipc	ra,0xfffff
    8000231c:	7d4080e7          	jalr	2004(ra) # 80001aec <_ZN9Scheduler4wakeEv>
		TCB::runningTimeSlice++;
    80002320:	0000a797          	auipc	a5,0xa
    80002324:	7507b783          	ld	a5,1872(a5) # 8000ca70 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002328:	0007b783          	ld	a5,0(a5)
    8000232c:	00178713          	addi	a4,a5,1
    80002330:	0000a797          	auipc	a5,0xa
    80002334:	7407b783          	ld	a5,1856(a5) # 8000ca70 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002338:	00e7b023          	sd	a4,0(a5)
		if (TCB::runningTimeSlice >= TCB::running->getTimeSlice()) {
    8000233c:	0000a797          	auipc	a5,0xa
    80002340:	7747b783          	ld	a5,1908(a5) # 8000cab0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002344:	0007b783          	ld	a5,0(a5)
    80002348:	00078513          	mv	a0,a5
    8000234c:	00000097          	auipc	ra,0x0
    80002350:	130080e7          	jalr	304(ra) # 8000247c <_ZN3TCB12getTimeSliceEv>
    80002354:	00050713          	mv	a4,a0
    80002358:	0000a797          	auipc	a5,0xa
    8000235c:	7187b783          	ld	a5,1816(a5) # 8000ca70 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002360:	0007b783          	ld	a5,0(a5)
    80002364:	00e7b7b3          	sltu	a5,a5,a4
    80002368:	0017c793          	xori	a5,a5,1
    8000236c:	0ff7f793          	andi	a5,a5,255
    80002370:	00078c63          	beqz	a5,80002388 <interruptRoutine+0x6c0>
			TCB::yield();
    80002374:	00001097          	auipc	ra,0x1
    80002378:	894080e7          	jalr	-1900(ra) # 80002c08 <_ZN3TCB5yieldEv>
			TCB::runningTimeSlice = 0;
    8000237c:	0000a797          	auipc	a5,0xa
    80002380:	6f47b783          	ld	a5,1780(a5) # 8000ca70 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002384:	0007b023          	sd	zero,0(a5)
		Riscv::w_sepc(sepc);
    80002388:	fd043503          	ld	a0,-48(s0)
    8000238c:	00000097          	auipc	ra,0x0
    80002390:	080080e7          	jalr	128(ra) # 8000240c <_ZN5Riscv6w_sepcEm>
		Riscv::w_sstatus(sstatus);
    80002394:	fc843503          	ld	a0,-56(s0)
    80002398:	00000097          	auipc	ra,0x0
    8000239c:	0ac080e7          	jalr	172(ra) # 80002444 <_ZN5Riscv9w_sstatusEm>
		Riscv::mc_sip(Riscv::SIP_SSIP);
    800023a0:	00200513          	li	a0,2
    800023a4:	00000097          	auipc	ra,0x0
    800023a8:	084080e7          	jalr	132(ra) # 80002428 <_ZN5Riscv6mc_sipEm>
}
    800023ac:	04c0006f          	j	800023f8 <interruptRoutine+0x730>
		printString("\nGreska u prekidnoj rutini\n");
    800023b0:	00008517          	auipc	a0,0x8
    800023b4:	d0850513          	addi	a0,a0,-760 # 8000a0b8 <CONSOLE_STATUS+0xa8>
    800023b8:	00004097          	auipc	ra,0x4
    800023bc:	a40080e7          	jalr	-1472(ra) # 80005df8 <_Z11printStringPKc>
		printString("scause: ");
    800023c0:	00008517          	auipc	a0,0x8
    800023c4:	d1850513          	addi	a0,a0,-744 # 8000a0d8 <CONSOLE_STATUS+0xc8>
    800023c8:	00004097          	auipc	ra,0x4
    800023cc:	a30080e7          	jalr	-1488(ra) # 80005df8 <_Z11printStringPKc>
		printInteger(scause);
    800023d0:	fd843503          	ld	a0,-40(s0)
    800023d4:	fffff097          	auipc	ra,0xfffff
    800023d8:	5c4080e7          	jalr	1476(ra) # 80001998 <_Z12printIntegerm>
		printString("\nsepc: ");
    800023dc:	00008517          	auipc	a0,0x8
    800023e0:	cbc50513          	addi	a0,a0,-836 # 8000a098 <CONSOLE_STATUS+0x88>
    800023e4:	00004097          	auipc	ra,0x4
    800023e8:	a14080e7          	jalr	-1516(ra) # 80005df8 <_Z11printStringPKc>
		printInteger(sepc);
    800023ec:	fd043503          	ld	a0,-48(s0)
    800023f0:	fffff097          	auipc	ra,0xfffff
    800023f4:	5a8080e7          	jalr	1448(ra) # 80001998 <_Z12printIntegerm>
}
    800023f8:	00000013          	nop
    800023fc:	13813083          	ld	ra,312(sp)
    80002400:	13013403          	ld	s0,304(sp)
    80002404:	14010113          	addi	sp,sp,320
    80002408:	00008067          	ret

000000008000240c <_ZN5Riscv6w_sepcEm>:
inline void Riscv::w_sepc(uint64 sepc) {
    8000240c:	ff010113          	addi	sp,sp,-16
    80002410:	00813423          	sd	s0,8(sp)
    80002414:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002418:	14151073          	csrw	sepc,a0
}
    8000241c:	00813403          	ld	s0,8(sp)
    80002420:	01010113          	addi	sp,sp,16
    80002424:	00008067          	ret

0000000080002428 <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    80002428:	ff010113          	addi	sp,sp,-16
    8000242c:	00813423          	sd	s0,8(sp)
    80002430:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    80002434:	14453073          	csrc	sip,a0
}
    80002438:	00813403          	ld	s0,8(sp)
    8000243c:	01010113          	addi	sp,sp,16
    80002440:	00008067          	ret

0000000080002444 <_ZN5Riscv9w_sstatusEm>:
	uint64 volatile sstatus;
	__asm__ volatile("csrr %[sstatus], sstatus": [sstatus] "=r"(sstatus));
	return sstatus;
}

inline void Riscv::w_sstatus(uint64 sstatus) {
    80002444:	ff010113          	addi	sp,sp,-16
    80002448:	00813423          	sd	s0,8(sp)
    8000244c:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw sstatus, %[sstatus]": :[sstatus] "r"(sstatus));
    80002450:	10051073          	csrw	sstatus,a0
}
    80002454:	00813403          	ld	s0,8(sp)
    80002458:	01010113          	addi	sp,sp,16
    8000245c:	00008067          	ret

0000000080002460 <_ZN3TCB11setFinishedEb>:
	static TCB* createThread(Body function, void* args, uint64* stack);
	static void start(TCB* newTcb);

	bool isFinished() { return finished; }

	void setFinished(bool finish) { this->finished = finish; }
    80002460:	ff010113          	addi	sp,sp,-16
    80002464:	00813423          	sd	s0,8(sp)
    80002468:	01010413          	addi	s0,sp,16
    8000246c:	02b50823          	sb	a1,48(a0)
    80002470:	00813403          	ld	s0,8(sp)
    80002474:	01010113          	addi	sp,sp,16
    80002478:	00008067          	ret

000000008000247c <_ZN3TCB12getTimeSliceEv>:

	bool isBlocked() { return blocked; }

	void setBlocked(bool block) { this->blocked = block; }

	uint64 getTimeSlice() { return timeSlice; }
    8000247c:	ff010113          	addi	sp,sp,-16
    80002480:	00813423          	sd	s0,8(sp)
    80002484:	01010413          	addi	s0,sp,16
    80002488:	02853503          	ld	a0,40(a0)
    8000248c:	00813403          	ld	s0,8(sp)
    80002490:	01010113          	addi	sp,sp,16
    80002494:	00008067          	ret

0000000080002498 <_ZN6Thread7wrapperEPv>:

	__asm__ volatile("ecall");
}

void Thread::wrapper(void* thread) {
	if (thread != nullptr) {
    80002498:	02050863          	beqz	a0,800024c8 <_ZN6Thread7wrapperEPv+0x30>
void Thread::wrapper(void* thread) {
    8000249c:	ff010113          	addi	sp,sp,-16
    800024a0:	00113423          	sd	ra,8(sp)
    800024a4:	00813023          	sd	s0,0(sp)
    800024a8:	01010413          	addi	s0,sp,16
		((Thread*)thread)->run();
    800024ac:	00053783          	ld	a5,0(a0)
    800024b0:	0107b783          	ld	a5,16(a5)
    800024b4:	000780e7          	jalr	a5
	}
}
    800024b8:	00813083          	ld	ra,8(sp)
    800024bc:	00013403          	ld	s0,0(sp)
    800024c0:	01010113          	addi	sp,sp,16
    800024c4:	00008067          	ret
    800024c8:	00008067          	ret

00000000800024cc <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    800024cc:	fe010113          	addi	sp,sp,-32
    800024d0:	00113c23          	sd	ra,24(sp)
    800024d4:	00813823          	sd	s0,16(sp)
    800024d8:	00913423          	sd	s1,8(sp)
    800024dc:	02010413          	addi	s0,sp,32
    800024e0:	00050493          	mv	s1,a0
    800024e4:	0000a797          	auipc	a5,0xa
    800024e8:	38c78793          	addi	a5,a5,908 # 8000c870 <_ZTV6Thread+0x10>
    800024ec:	00f53023          	sd	a5,0(a0)
	thread_join(this->myHandle);
    800024f0:	00853503          	ld	a0,8(a0)
    800024f4:	fffff097          	auipc	ra,0xfffff
    800024f8:	f54080e7          	jalr	-172(ra) # 80001448 <_Z11thread_joinP3TCB>
	delete myHandle;
    800024fc:	0084b483          	ld	s1,8(s1)
    80002500:	02048863          	beqz	s1,80002530 <_ZN6ThreadD1Ev+0x64>
            delete node;
        }
    }

    bool isEmpty() const {
        bool ret = front == nullptr;
    80002504:	0504b503          	ld	a0,80(s1)
        while (!isEmpty()) {
    80002508:	00050e63          	beqz	a0,80002524 <_ZN6ThreadD1Ev+0x58>
            front = front->next;
    8000250c:	00853783          	ld	a5,8(a0)
    80002510:	04f4b823          	sd	a5,80(s1)
            delete node;
    80002514:	fe0508e3          	beqz	a0,80002504 <_ZN6ThreadD1Ev+0x38>
            mem_free(ptr);
    80002518:	fffff097          	auipc	ra,0xfffff
    8000251c:	e38080e7          	jalr	-456(ra) # 80001350 <_Z8mem_freePv>
        }
    80002520:	fe5ff06f          	j	80002504 <_ZN6ThreadD1Ev+0x38>
    80002524:	00048513          	mv	a0,s1
    80002528:	00000097          	auipc	ra,0x0
    8000252c:	7f4080e7          	jalr	2036(ra) # 80002d1c <_ZN3TCBdlEPv>
}
    80002530:	01813083          	ld	ra,24(sp)
    80002534:	01013403          	ld	s0,16(sp)
    80002538:	00813483          	ld	s1,8(sp)
    8000253c:	02010113          	addi	sp,sp,32
    80002540:	00008067          	ret

0000000080002544 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
	sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    80002544:	fe010113          	addi	sp,sp,-32
    80002548:	00113c23          	sd	ra,24(sp)
    8000254c:	00813823          	sd	s0,16(sp)
    80002550:	00913423          	sd	s1,8(sp)
    80002554:	02010413          	addi	s0,sp,32
    80002558:	00050493          	mv	s1,a0
    8000255c:	0000a797          	auipc	a5,0xa
    80002560:	33c78793          	addi	a5,a5,828 # 8000c898 <_ZTV9Semaphore+0x10>
    80002564:	00f53023          	sd	a5,0(a0)
	sem_close(myHandle);
    80002568:	00853503          	ld	a0,8(a0)
    8000256c:	fffff097          	auipc	ra,0xfffff
    80002570:	f6c080e7          	jalr	-148(ra) # 800014d8 <_Z9sem_closeP4KSem>
	delete myHandle;
    80002574:	0084b483          	ld	s1,8(s1)
    80002578:	02048863          	beqz	s1,800025a8 <_ZN9SemaphoreD1Ev+0x64>
        bool ret = front == nullptr;
    8000257c:	0084b503          	ld	a0,8(s1)
        while (!isEmpty()) {
    80002580:	00050e63          	beqz	a0,8000259c <_ZN9SemaphoreD1Ev+0x58>
            front = front->next;
    80002584:	00853783          	ld	a5,8(a0)
    80002588:	00f4b423          	sd	a5,8(s1)
            delete node;
    8000258c:	fe0508e3          	beqz	a0,8000257c <_ZN9SemaphoreD1Ev+0x38>
            mem_free(ptr);
    80002590:	fffff097          	auipc	ra,0xfffff
    80002594:	dc0080e7          	jalr	-576(ra) # 80001350 <_Z8mem_freePv>
        }
    80002598:	fe5ff06f          	j	8000257c <_ZN9SemaphoreD1Ev+0x38>
    8000259c:	00048513          	mv	a0,s1
    800025a0:	00001097          	auipc	ra,0x1
    800025a4:	f60080e7          	jalr	-160(ra) # 80003500 <_ZN4KSemdlEPv>
}
    800025a8:	01813083          	ld	ra,24(sp)
    800025ac:	01013403          	ld	s0,16(sp)
    800025b0:	00813483          	ld	s1,8(sp)
    800025b4:	02010113          	addi	sp,sp,32
    800025b8:	00008067          	ret

00000000800025bc <_Znwm>:
void* operator new(size_t size) {
    800025bc:	ff010113          	addi	sp,sp,-16
    800025c0:	00113423          	sd	ra,8(sp)
    800025c4:	00813023          	sd	s0,0(sp)
    800025c8:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    800025cc:	fffff097          	auipc	ra,0xfffff
    800025d0:	d44080e7          	jalr	-700(ra) # 80001310 <_Z9mem_allocm>
}
    800025d4:	00813083          	ld	ra,8(sp)
    800025d8:	00013403          	ld	s0,0(sp)
    800025dc:	01010113          	addi	sp,sp,16
    800025e0:	00008067          	ret

00000000800025e4 <_Znam>:
void* operator new[](size_t size) {
    800025e4:	ff010113          	addi	sp,sp,-16
    800025e8:	00113423          	sd	ra,8(sp)
    800025ec:	00813023          	sd	s0,0(sp)
    800025f0:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    800025f4:	fffff097          	auipc	ra,0xfffff
    800025f8:	d1c080e7          	jalr	-740(ra) # 80001310 <_Z9mem_allocm>
}
    800025fc:	00813083          	ld	ra,8(sp)
    80002600:	00013403          	ld	s0,0(sp)
    80002604:	01010113          	addi	sp,sp,16
    80002608:	00008067          	ret

000000008000260c <_ZdlPv>:
noexcept {
    8000260c:	ff010113          	addi	sp,sp,-16
    80002610:	00113423          	sd	ra,8(sp)
    80002614:	00813023          	sd	s0,0(sp)
    80002618:	01010413          	addi	s0,sp,16
mem_free(ptr);
    8000261c:	fffff097          	auipc	ra,0xfffff
    80002620:	d34080e7          	jalr	-716(ra) # 80001350 <_Z8mem_freePv>
}
    80002624:	00813083          	ld	ra,8(sp)
    80002628:	00013403          	ld	s0,0(sp)
    8000262c:	01010113          	addi	sp,sp,16
    80002630:	00008067          	ret

0000000080002634 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80002634:	fe010113          	addi	sp,sp,-32
    80002638:	00113c23          	sd	ra,24(sp)
    8000263c:	00813823          	sd	s0,16(sp)
    80002640:	00913423          	sd	s1,8(sp)
    80002644:	02010413          	addi	s0,sp,32
    80002648:	00050493          	mv	s1,a0
}
    8000264c:	00000097          	auipc	ra,0x0
    80002650:	e80080e7          	jalr	-384(ra) # 800024cc <_ZN6ThreadD1Ev>
    80002654:	00048513          	mv	a0,s1
    80002658:	00000097          	auipc	ra,0x0
    8000265c:	fb4080e7          	jalr	-76(ra) # 8000260c <_ZdlPv>
    80002660:	01813083          	ld	ra,24(sp)
    80002664:	01013403          	ld	s0,16(sp)
    80002668:	00813483          	ld	s1,8(sp)
    8000266c:	02010113          	addi	sp,sp,32
    80002670:	00008067          	ret

0000000080002674 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80002674:	fe010113          	addi	sp,sp,-32
    80002678:	00113c23          	sd	ra,24(sp)
    8000267c:	00813823          	sd	s0,16(sp)
    80002680:	00913423          	sd	s1,8(sp)
    80002684:	02010413          	addi	s0,sp,32
    80002688:	00050493          	mv	s1,a0
}
    8000268c:	00000097          	auipc	ra,0x0
    80002690:	eb8080e7          	jalr	-328(ra) # 80002544 <_ZN9SemaphoreD1Ev>
    80002694:	00048513          	mv	a0,s1
    80002698:	00000097          	auipc	ra,0x0
    8000269c:	f74080e7          	jalr	-140(ra) # 8000260c <_ZdlPv>
    800026a0:	01813083          	ld	ra,24(sp)
    800026a4:	01013403          	ld	s0,16(sp)
    800026a8:	00813483          	ld	s1,8(sp)
    800026ac:	02010113          	addi	sp,sp,32
    800026b0:	00008067          	ret

00000000800026b4 <_ZdaPv>:
noexcept {
    800026b4:	ff010113          	addi	sp,sp,-16
    800026b8:	00113423          	sd	ra,8(sp)
    800026bc:	00813023          	sd	s0,0(sp)
    800026c0:	01010413          	addi	s0,sp,16
mem_free(ptr);
    800026c4:	fffff097          	auipc	ra,0xfffff
    800026c8:	c8c080e7          	jalr	-884(ra) # 80001350 <_Z8mem_freePv>
}
    800026cc:	00813083          	ld	ra,8(sp)
    800026d0:	00013403          	ld	s0,0(sp)
    800026d4:	01010113          	addi	sp,sp,16
    800026d8:	00008067          	ret

00000000800026dc <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (* body)(void*), void* arg) {
    800026dc:	fd010113          	addi	sp,sp,-48
    800026e0:	02113423          	sd	ra,40(sp)
    800026e4:	02813023          	sd	s0,32(sp)
    800026e8:	00913c23          	sd	s1,24(sp)
    800026ec:	01213823          	sd	s2,16(sp)
    800026f0:	01313423          	sd	s3,8(sp)
    800026f4:	03010413          	addi	s0,sp,48
    800026f8:	00050493          	mv	s1,a0
    800026fc:	00058913          	mv	s2,a1
    80002700:	00060993          	mv	s3,a2
    80002704:	0000a797          	auipc	a5,0xa
    80002708:	16c78793          	addi	a5,a5,364 # 8000c870 <_ZTV6Thread+0x10>
    8000270c:	00f53023          	sd	a5,0(a0)
	this->body = body;
    80002710:	00b53823          	sd	a1,16(a0)
	this->arg = arg;
    80002714:	00c53c23          	sd	a2,24(a0)
	if (body != nullptr) {
    80002718:	04058663          	beqz	a1,80002764 <_ZN6ThreadC1EPFvPvES0_+0x88>
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    8000271c:	00001537          	lui	a0,0x1
    80002720:	fffff097          	auipc	ra,0xfffff
    80002724:	bf0080e7          	jalr	-1040(ra) # 80001310 <_Z9mem_allocm>
    80002728:	00050313          	mv	t1,a0
	__asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000272c:	00030713          	mv	a4,t1
	__asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002730:	00098693          	mv	a3,s3
			body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002734:	00090613          	mv	a2,s2
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002738:	00848493          	addi	s1,s1,8
    8000273c:	00048593          	mv	a1,s1
	__asm__ volatile("li a0, 0x80");
    80002740:	08000513          	li	a0,128
	__asm__ volatile("ecall");
    80002744:	00000073          	ecall
}
    80002748:	02813083          	ld	ra,40(sp)
    8000274c:	02013403          	ld	s0,32(sp)
    80002750:	01813483          	ld	s1,24(sp)
    80002754:	01013903          	ld	s2,16(sp)
    80002758:	00813983          	ld	s3,8(sp)
    8000275c:	03010113          	addi	sp,sp,48
    80002760:	00008067          	ret
	uint64* stack = nullptr;
    80002764:	00000313          	li	t1,0
    80002768:	fc5ff06f          	j	8000272c <_ZN6ThreadC1EPFvPvES0_+0x50>

000000008000276c <_ZN6Thread5startEv>:
int Thread::start() {
    8000276c:	ff010113          	addi	sp,sp,-16
    80002770:	00813423          	sd	s0,8(sp)
    80002774:	01010413          	addi	s0,sp,16
	if (myHandle == nullptr) return -1;
    80002778:	00853303          	ld	t1,8(a0) # 1008 <_entry-0x7fffeff8>
    8000277c:	02030063          	beqz	t1,8000279c <_ZN6Thread5startEv+0x30>
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002780:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x81");
    80002784:	08100513          	li	a0,129
	__asm__ volatile("ecall");
    80002788:	00000073          	ecall
	return 0;
    8000278c:	00000513          	li	a0,0
}
    80002790:	00813403          	ld	s0,8(sp)
    80002794:	01010113          	addi	sp,sp,16
    80002798:	00008067          	ret
	if (myHandle == nullptr) return -1;
    8000279c:	fff00513          	li	a0,-1
    800027a0:	ff1ff06f          	j	80002790 <_ZN6Thread5startEv+0x24>

00000000800027a4 <_ZN6Thread4joinEv>:
void Thread::join() {
    800027a4:	ff010113          	addi	sp,sp,-16
    800027a8:	00113423          	sd	ra,8(sp)
    800027ac:	00813023          	sd	s0,0(sp)
    800027b0:	01010413          	addi	s0,sp,16
	thread_join(myHandle);
    800027b4:	00853503          	ld	a0,8(a0)
    800027b8:	fffff097          	auipc	ra,0xfffff
    800027bc:	c90080e7          	jalr	-880(ra) # 80001448 <_Z11thread_joinP3TCB>
}
    800027c0:	00813083          	ld	ra,8(sp)
    800027c4:	00013403          	ld	s0,0(sp)
    800027c8:	01010113          	addi	sp,sp,16
    800027cc:	00008067          	ret

00000000800027d0 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    800027d0:	ff010113          	addi	sp,sp,-16
    800027d4:	00113423          	sd	ra,8(sp)
    800027d8:	00813023          	sd	s0,0(sp)
    800027dc:	01010413          	addi	s0,sp,16
	thread_dispatch();
    800027e0:	fffff097          	auipc	ra,0xfffff
    800027e4:	c48080e7          	jalr	-952(ra) # 80001428 <_Z15thread_dispatchv>
}
    800027e8:	00813083          	ld	ra,8(sp)
    800027ec:	00013403          	ld	s0,0(sp)
    800027f0:	01010113          	addi	sp,sp,16
    800027f4:	00008067          	ret

00000000800027f8 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t t) {
    800027f8:	ff010113          	addi	sp,sp,-16
    800027fc:	00113423          	sd	ra,8(sp)
    80002800:	00813023          	sd	s0,0(sp)
    80002804:	01010413          	addi	s0,sp,16
    80002808:	00050593          	mv	a1,a0
	Scheduler::putToSleep(TCB::running, t);
    8000280c:	0000a797          	auipc	a5,0xa
    80002810:	2a47b783          	ld	a5,676(a5) # 8000cab0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002814:	0007b503          	ld	a0,0(a5)
    80002818:	fffff097          	auipc	ra,0xfffff
    8000281c:	22c080e7          	jalr	556(ra) # 80001a44 <_ZN9Scheduler10putToSleepEP3TCBm>
}
    80002820:	00000513          	li	a0,0
    80002824:	00813083          	ld	ra,8(sp)
    80002828:	00013403          	ld	s0,0(sp)
    8000282c:	01010113          	addi	sp,sp,16
    80002830:	00008067          	ret

0000000080002834 <_ZN14PeriodicThread15periodicWrapperEPv>:
}

PeriodicThread::PeriodicThread(time_t period) : Thread(periodicWrapper, this), period(period) {
}

void PeriodicThread::periodicWrapper(void* pThread) {
    80002834:	fe010113          	addi	sp,sp,-32
    80002838:	00113c23          	sd	ra,24(sp)
    8000283c:	00813823          	sd	s0,16(sp)
    80002840:	00913423          	sd	s1,8(sp)
    80002844:	02010413          	addi	s0,sp,32
    80002848:	00050493          	mv	s1,a0
	if (pThread != nullptr) {
    8000284c:	02050263          	beqz	a0,80002870 <_ZN14PeriodicThread15periodicWrapperEPv+0x3c>
		PeriodicThread* ptr = (PeriodicThread*)pThread;
		while (1) {
			ptr->periodicActivation();
    80002850:	0004b783          	ld	a5,0(s1)
    80002854:	0187b783          	ld	a5,24(a5)
    80002858:	00048513          	mv	a0,s1
    8000285c:	000780e7          	jalr	a5
			Thread::sleep(ptr->period);
    80002860:	0204b503          	ld	a0,32(s1)
    80002864:	00000097          	auipc	ra,0x0
    80002868:	f94080e7          	jalr	-108(ra) # 800027f8 <_ZN6Thread5sleepEm>
		while (1) {
    8000286c:	fe5ff06f          	j	80002850 <_ZN14PeriodicThread15periodicWrapperEPv+0x1c>
		}
	}
}
    80002870:	01813083          	ld	ra,24(sp)
    80002874:	01013403          	ld	s0,16(sp)
    80002878:	00813483          	ld	s1,8(sp)
    8000287c:	02010113          	addi	sp,sp,32
    80002880:	00008067          	ret

0000000080002884 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80002884:	fe010113          	addi	sp,sp,-32
    80002888:	00113c23          	sd	ra,24(sp)
    8000288c:	00813823          	sd	s0,16(sp)
    80002890:	00913423          	sd	s1,8(sp)
    80002894:	02010413          	addi	s0,sp,32
    80002898:	00050493          	mv	s1,a0
    8000289c:	0000a797          	auipc	a5,0xa
    800028a0:	fd478793          	addi	a5,a5,-44 # 8000c870 <_ZTV6Thread+0x10>
    800028a4:	00f53023          	sd	a5,0(a0)
	this->body = wrapper;
    800028a8:	00000797          	auipc	a5,0x0
    800028ac:	bf078793          	addi	a5,a5,-1040 # 80002498 <_ZN6Thread7wrapperEPv>
    800028b0:	00f53823          	sd	a5,16(a0)
	this->arg = this;
    800028b4:	00a53c23          	sd	a0,24(a0)
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    800028b8:	00001537          	lui	a0,0x1
    800028bc:	fffff097          	auipc	ra,0xfffff
    800028c0:	a54080e7          	jalr	-1452(ra) # 80001310 <_Z9mem_allocm>
    800028c4:	00050313          	mv	t1,a0
	__asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800028c8:	00030713          	mv	a4,t1
	__asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800028cc:	0184b303          	ld	t1,24(s1)
    800028d0:	00030693          	mv	a3,t1
			body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800028d4:	0104b303          	ld	t1,16(s1)
    800028d8:	00030613          	mv	a2,t1
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800028dc:	00848493          	addi	s1,s1,8
    800028e0:	00048593          	mv	a1,s1
	__asm__ volatile("li a0, 0x80");
    800028e4:	08000513          	li	a0,128
	__asm__ volatile("ecall");
    800028e8:	00000073          	ecall
}
    800028ec:	01813083          	ld	ra,24(sp)
    800028f0:	01013403          	ld	s0,16(sp)
    800028f4:	00813483          	ld	s1,8(sp)
    800028f8:	02010113          	addi	sp,sp,32
    800028fc:	00008067          	ret

0000000080002900 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80002900:	ff010113          	addi	sp,sp,-16
    80002904:	00113423          	sd	ra,8(sp)
    80002908:	00813023          	sd	s0,0(sp)
    8000290c:	01010413          	addi	s0,sp,16
    80002910:	0000a797          	auipc	a5,0xa
    80002914:	f8878793          	addi	a5,a5,-120 # 8000c898 <_ZTV9Semaphore+0x10>
    80002918:	00f53023          	sd	a5,0(a0) # 1000 <_entry-0x7ffff000>
	sem_open(&myHandle, init);
    8000291c:	00850513          	addi	a0,a0,8
    80002920:	fffff097          	auipc	ra,0xfffff
    80002924:	b80080e7          	jalr	-1152(ra) # 800014a0 <_Z8sem_openPP4KSemj>
}
    80002928:	00813083          	ld	ra,8(sp)
    8000292c:	00013403          	ld	s0,0(sp)
    80002930:	01010113          	addi	sp,sp,16
    80002934:	00008067          	ret

0000000080002938 <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    80002938:	ff010113          	addi	sp,sp,-16
    8000293c:	00113423          	sd	ra,8(sp)
    80002940:	00813023          	sd	s0,0(sp)
    80002944:	01010413          	addi	s0,sp,16
	return sem_wait(myHandle);
    80002948:	00853503          	ld	a0,8(a0)
    8000294c:	fffff097          	auipc	ra,0xfffff
    80002950:	bbc080e7          	jalr	-1092(ra) # 80001508 <_Z8sem_waitP4KSem>
}
    80002954:	00813083          	ld	ra,8(sp)
    80002958:	00013403          	ld	s0,0(sp)
    8000295c:	01010113          	addi	sp,sp,16
    80002960:	00008067          	ret

0000000080002964 <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    80002964:	ff010113          	addi	sp,sp,-16
    80002968:	00113423          	sd	ra,8(sp)
    8000296c:	00813023          	sd	s0,0(sp)
    80002970:	01010413          	addi	s0,sp,16
	return sem_signal(myHandle);
    80002974:	00853503          	ld	a0,8(a0)
    80002978:	fffff097          	auipc	ra,0xfffff
    8000297c:	bc0080e7          	jalr	-1088(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    80002980:	00813083          	ld	ra,8(sp)
    80002984:	00013403          	ld	s0,0(sp)
    80002988:	01010113          	addi	sp,sp,16
    8000298c:	00008067          	ret

0000000080002990 <_ZN14PeriodicThread9terminateEv>:
void PeriodicThread::terminate() {
    80002990:	ff010113          	addi	sp,sp,-16
    80002994:	00813423          	sd	s0,8(sp)
    80002998:	01010413          	addi	s0,sp,16
}
    8000299c:	00813403          	ld	s0,8(sp)
    800029a0:	01010113          	addi	sp,sp,16
    800029a4:	00008067          	ret

00000000800029a8 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period) : Thread(periodicWrapper, this), period(period) {
    800029a8:	fe010113          	addi	sp,sp,-32
    800029ac:	00113c23          	sd	ra,24(sp)
    800029b0:	00813823          	sd	s0,16(sp)
    800029b4:	00913423          	sd	s1,8(sp)
    800029b8:	01213023          	sd	s2,0(sp)
    800029bc:	02010413          	addi	s0,sp,32
    800029c0:	00050493          	mv	s1,a0
    800029c4:	00058913          	mv	s2,a1
    800029c8:	00050613          	mv	a2,a0
    800029cc:	00000597          	auipc	a1,0x0
    800029d0:	e6858593          	addi	a1,a1,-408 # 80002834 <_ZN14PeriodicThread15periodicWrapperEPv>
    800029d4:	00000097          	auipc	ra,0x0
    800029d8:	d08080e7          	jalr	-760(ra) # 800026dc <_ZN6ThreadC1EPFvPvES0_>
    800029dc:	0000a797          	auipc	a5,0xa
    800029e0:	e6478793          	addi	a5,a5,-412 # 8000c840 <_ZTV14PeriodicThread+0x10>
    800029e4:	00f4b023          	sd	a5,0(s1)
    800029e8:	0324b023          	sd	s2,32(s1)
}
    800029ec:	01813083          	ld	ra,24(sp)
    800029f0:	01013403          	ld	s0,16(sp)
    800029f4:	00813483          	ld	s1,8(sp)
    800029f8:	00013903          	ld	s2,0(sp)
    800029fc:	02010113          	addi	sp,sp,32
    80002a00:	00008067          	ret

0000000080002a04 <_ZN7Console4getcEv>:

char Console::getc() {
    80002a04:	ff010113          	addi	sp,sp,-16
    80002a08:	00113423          	sd	ra,8(sp)
    80002a0c:	00813023          	sd	s0,0(sp)
    80002a10:	01010413          	addi	s0,sp,16
	return ::getc();
    80002a14:	fffff097          	auipc	ra,0xfffff
    80002a18:	b54080e7          	jalr	-1196(ra) # 80001568 <_Z4getcv>
}
    80002a1c:	00813083          	ld	ra,8(sp)
    80002a20:	00013403          	ld	s0,0(sp)
    80002a24:	01010113          	addi	sp,sp,16
    80002a28:	00008067          	ret

0000000080002a2c <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80002a2c:	ff010113          	addi	sp,sp,-16
    80002a30:	00113423          	sd	ra,8(sp)
    80002a34:	00813023          	sd	s0,0(sp)
    80002a38:	01010413          	addi	s0,sp,16
	::putc(c);
    80002a3c:	fffff097          	auipc	ra,0xfffff
    80002a40:	b54080e7          	jalr	-1196(ra) # 80001590 <_Z4putcc>
}
    80002a44:	00813083          	ld	ra,8(sp)
    80002a48:	00013403          	ld	s0,0(sp)
    80002a4c:	01010113          	addi	sp,sp,16
    80002a50:	00008067          	ret

0000000080002a54 <_ZN6Thread3runEv>:
	static int sleep(time_t);

protected:
	Thread();

	virtual void run() {}
    80002a54:	ff010113          	addi	sp,sp,-16
    80002a58:	00813423          	sd	s0,8(sp)
    80002a5c:	01010413          	addi	s0,sp,16
    80002a60:	00813403          	ld	s0,8(sp)
    80002a64:	01010113          	addi	sp,sp,16
    80002a68:	00008067          	ret

0000000080002a6c <_ZN14PeriodicThread18periodicActivationEv>:
	void terminate();

protected:
	PeriodicThread(time_t period);

	virtual void periodicActivation() {}
    80002a6c:	ff010113          	addi	sp,sp,-16
    80002a70:	00813423          	sd	s0,8(sp)
    80002a74:	01010413          	addi	s0,sp,16
    80002a78:	00813403          	ld	s0,8(sp)
    80002a7c:	01010113          	addi	sp,sp,16
    80002a80:	00008067          	ret

0000000080002a84 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80002a84:	ff010113          	addi	sp,sp,-16
    80002a88:	00113423          	sd	ra,8(sp)
    80002a8c:	00813023          	sd	s0,0(sp)
    80002a90:	01010413          	addi	s0,sp,16
    80002a94:	0000a797          	auipc	a5,0xa
    80002a98:	dac78793          	addi	a5,a5,-596 # 8000c840 <_ZTV14PeriodicThread+0x10>
    80002a9c:	00f53023          	sd	a5,0(a0)
    80002aa0:	00000097          	auipc	ra,0x0
    80002aa4:	a2c080e7          	jalr	-1492(ra) # 800024cc <_ZN6ThreadD1Ev>
    80002aa8:	00813083          	ld	ra,8(sp)
    80002aac:	00013403          	ld	s0,0(sp)
    80002ab0:	01010113          	addi	sp,sp,16
    80002ab4:	00008067          	ret

0000000080002ab8 <_ZN14PeriodicThreadD0Ev>:
    80002ab8:	fe010113          	addi	sp,sp,-32
    80002abc:	00113c23          	sd	ra,24(sp)
    80002ac0:	00813823          	sd	s0,16(sp)
    80002ac4:	00913423          	sd	s1,8(sp)
    80002ac8:	02010413          	addi	s0,sp,32
    80002acc:	00050493          	mv	s1,a0
    80002ad0:	0000a797          	auipc	a5,0xa
    80002ad4:	d7078793          	addi	a5,a5,-656 # 8000c840 <_ZTV14PeriodicThread+0x10>
    80002ad8:	00f53023          	sd	a5,0(a0)
    80002adc:	00000097          	auipc	ra,0x0
    80002ae0:	9f0080e7          	jalr	-1552(ra) # 800024cc <_ZN6ThreadD1Ev>
    80002ae4:	00048513          	mv	a0,s1
    80002ae8:	00000097          	auipc	ra,0x0
    80002aec:	b24080e7          	jalr	-1244(ra) # 8000260c <_ZdlPv>
    80002af0:	01813083          	ld	ra,24(sp)
    80002af4:	01013403          	ld	s0,16(sp)
    80002af8:	00813483          	ld	s1,8(sp)
    80002afc:	02010113          	addi	sp,sp,32
    80002b00:	00008067          	ret

0000000080002b04 <_ZN3TCB7wrapperEv>:
	Riscv::pushRegisters();
	TCB::dispatch();
	Riscv::popRegisters();
}

void TCB::wrapper() {
    80002b04:	ff010113          	addi	sp,sp,-16
    80002b08:	00113423          	sd	ra,8(sp)
    80002b0c:	00813023          	sd	s0,0(sp)
    80002b10:	01010413          	addi	s0,sp,16
	//pocetak wrappera se izvrsava u supervisor modu,
	//jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch/yield)
	Riscv::popSppSpie();
    80002b14:	00000097          	auipc	ra,0x0
    80002b18:	308080e7          	jalr	776(ra) # 80002e1c <_ZN5Riscv10popSppSpieEv>
	//na dalje se izvrsavamo u user modu
	running->threadFunction(running->args);
    80002b1c:	0000a797          	auipc	a5,0xa
    80002b20:	0dc7b783          	ld	a5,220(a5) # 8000cbf8 <_ZN3TCB7runningE>
    80002b24:	0107b703          	ld	a4,16(a5)
    80002b28:	0207b503          	ld	a0,32(a5)
    80002b2c:	000700e7          	jalr	a4
	//running->finished = true;
	//i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
	thread_exit();
    80002b30:	fffff097          	auipc	ra,0xfffff
    80002b34:	8d0080e7          	jalr	-1840(ra) # 80001400 <_Z11thread_exitv>
}
    80002b38:	00813083          	ld	ra,8(sp)
    80002b3c:	00013403          	ld	s0,0(sp)
    80002b40:	01010113          	addi	sp,sp,16
    80002b44:	00008067          	ret

0000000080002b48 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80002b48:	fe010113          	addi	sp,sp,-32
    80002b4c:	00113c23          	sd	ra,24(sp)
    80002b50:	00813823          	sd	s0,16(sp)
    80002b54:	00913423          	sd	s1,8(sp)
    80002b58:	02010413          	addi	s0,sp,32
	TCB* old = TCB::running;
    80002b5c:	0000a497          	auipc	s1,0xa
    80002b60:	09c4b483          	ld	s1,156(s1) # 8000cbf8 <_ZN3TCB7runningE>
	if (!old->finished && !old->blocked && old->timeToSleep == 0 && !old->needToJoin) {
    80002b64:	0304c783          	lbu	a5,48(s1)
    80002b68:	00079e63          	bnez	a5,80002b84 <_ZN3TCB8dispatchEv+0x3c>
    80002b6c:	0314c783          	lbu	a5,49(s1)
    80002b70:	00079a63          	bnez	a5,80002b84 <_ZN3TCB8dispatchEv+0x3c>
    80002b74:	0404b783          	ld	a5,64(s1)
    80002b78:	00079663          	bnez	a5,80002b84 <_ZN3TCB8dispatchEv+0x3c>
    80002b7c:	0324c783          	lbu	a5,50(s1)
    80002b80:	04078663          	beqz	a5,80002bcc <_ZN3TCB8dispatchEv+0x84>
	TCB::running = Scheduler::get();
    80002b84:	fffff097          	auipc	ra,0xfffff
    80002b88:	e80080e7          	jalr	-384(ra) # 80001a04 <_ZN9Scheduler3getEv>
    80002b8c:	00050593          	mv	a1,a0
    80002b90:	0000a797          	auipc	a5,0xa
    80002b94:	06878793          	addi	a5,a5,104 # 8000cbf8 <_ZN3TCB7runningE>
    80002b98:	00a7b023          	sd	a0,0(a5)
	TCB::runningTimeSlice = 0;
    80002b9c:	0007b423          	sd	zero,8(a5)
	if (TCB::running->threadFunction == nullptr || TCB::running->threadFunction == kernelConsumerFunction ||
    80002ba0:	01053783          	ld	a5,16(a0)
    80002ba4:	02078c63          	beqz	a5,80002bdc <_ZN3TCB8dispatchEv+0x94>
    80002ba8:	0000a717          	auipc	a4,0xa
    80002bac:	ee073703          	ld	a4,-288(a4) # 8000ca88 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002bb0:	02e78663          	beq	a5,a4,80002bdc <_ZN3TCB8dispatchEv+0x94>
    80002bb4:	0000a717          	auipc	a4,0xa
    80002bb8:	f1473703          	ld	a4,-236(a4) # 8000cac8 <_GLOBAL_OFFSET_TABLE_+0x70>
    80002bbc:	02e78063          	beq	a5,a4,80002bdc <_ZN3TCB8dispatchEv+0x94>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002bc0:	10000793          	li	a5,256
    80002bc4:	1007b073          	csrc	sstatus,a5
}
    80002bc8:	01c0006f          	j	80002be4 <_ZN3TCB8dispatchEv+0x9c>
		Scheduler::put(old);
    80002bcc:	00048513          	mv	a0,s1
    80002bd0:	fffff097          	auipc	ra,0xfffff
    80002bd4:	df0080e7          	jalr	-528(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
    80002bd8:	fadff06f          	j	80002b84 <_ZN3TCB8dispatchEv+0x3c>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80002bdc:	10000793          	li	a5,256
    80002be0:	1007a073          	csrs	sstatus,a5
	if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    80002be4:	00b48863          	beq	s1,a1,80002bf4 <_ZN3TCB8dispatchEv+0xac>
    80002be8:	00048513          	mv	a0,s1
    80002bec:	ffffe097          	auipc	ra,0xffffe
    80002bf0:	624080e7          	jalr	1572(ra) # 80001210 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80002bf4:	01813083          	ld	ra,24(sp)
    80002bf8:	01013403          	ld	s0,16(sp)
    80002bfc:	00813483          	ld	s1,8(sp)
    80002c00:	02010113          	addi	sp,sp,32
    80002c04:	00008067          	ret

0000000080002c08 <_ZN3TCB5yieldEv>:
void TCB::yield() {
    80002c08:	ff010113          	addi	sp,sp,-16
    80002c0c:	00113423          	sd	ra,8(sp)
    80002c10:	00813023          	sd	s0,0(sp)
    80002c14:	01010413          	addi	s0,sp,16
	Riscv::pushRegisters();
    80002c18:	ffffe097          	auipc	ra,0xffffe
    80002c1c:	3e8080e7          	jalr	1000(ra) # 80001000 <_ZN5Riscv13pushRegistersEv>
	TCB::dispatch();
    80002c20:	00000097          	auipc	ra,0x0
    80002c24:	f28080e7          	jalr	-216(ra) # 80002b48 <_ZN3TCB8dispatchEv>
	Riscv::popRegisters();
    80002c28:	ffffe097          	auipc	ra,0xffffe
    80002c2c:	454080e7          	jalr	1108(ra) # 8000107c <_ZN5Riscv12popRegistersEv>
}
    80002c30:	00813083          	ld	ra,8(sp)
    80002c34:	00013403          	ld	s0,0(sp)
    80002c38:	01010113          	addi	sp,sp,16
    80002c3c:	00008067          	ret

0000000080002c40 <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    80002c40:	ff010113          	addi	sp,sp,-16
    80002c44:	00113423          	sd	ra,8(sp)
    80002c48:	00813023          	sd	s0,0(sp)
    80002c4c:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80002c50:	ffffe097          	auipc	ra,0xffffe
    80002c54:	6c0080e7          	jalr	1728(ra) # 80001310 <_Z9mem_allocm>
	//return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::THREAD);
}
    80002c58:	00813083          	ld	ra,8(sp)
    80002c5c:	00013403          	ld	s0,0(sp)
    80002c60:	01010113          	addi	sp,sp,16
    80002c64:	00008067          	ret

0000000080002c68 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    80002c68:	fd010113          	addi	sp,sp,-48
    80002c6c:	02113423          	sd	ra,40(sp)
    80002c70:	02813023          	sd	s0,32(sp)
    80002c74:	00913c23          	sd	s1,24(sp)
    80002c78:	01213823          	sd	s2,16(sp)
    80002c7c:	01313423          	sd	s3,8(sp)
    80002c80:	03010413          	addi	s0,sp,48
    80002c84:	00050913          	mv	s2,a0
    80002c88:	00058993          	mv	s3,a1
    80002c8c:	00060493          	mv	s1,a2
	TCB* newThread = new TCB(function, args, stack);
    80002c90:	06000513          	li	a0,96
    80002c94:	00000097          	auipc	ra,0x0
    80002c98:	fac080e7          	jalr	-84(ra) # 80002c40 <_ZN3TCBnwEm>


	TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
													timeSlice(DEFAULT_TIME_SLICE), finished(false), blocked(false),
													needToJoin(false),
													nextInScheduler(nullptr), timeToSleep(0), nextSleeping(nullptr) {
    80002c9c:	01253823          	sd	s2,16(a0)
    80002ca0:	00953c23          	sd	s1,24(a0)
    80002ca4:	03353023          	sd	s3,32(a0)
    80002ca8:	00200793          	li	a5,2
    80002cac:	02f53423          	sd	a5,40(a0)
    80002cb0:	02050823          	sb	zero,48(a0)
    80002cb4:	020508a3          	sb	zero,49(a0)
    80002cb8:	02050923          	sb	zero,50(a0)
    80002cbc:	02053c23          	sd	zero,56(a0)
    80002cc0:	04053023          	sd	zero,64(a0)
    80002cc4:	04053423          	sd	zero,72(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    80002cc8:	04053823          	sd	zero,80(a0)
    80002ccc:	04053c23          	sd	zero,88(a0)
		//formiranje pocetnog konteksta; specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80002cd0:	02090e63          	beqz	s2,80002d0c <_ZN3TCB12createThreadEPFvPvES0_Pm+0xa4>
    80002cd4:	00000797          	auipc	a5,0x0
    80002cd8:	e3078793          	addi	a5,a5,-464 # 80002b04 <_ZN3TCB7wrapperEv>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80002cdc:	02048c63          	beqz	s1,80002d14 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xac>
    80002ce0:	00008637          	lui	a2,0x8
    80002ce4:	00c484b3          	add	s1,s1,a2
		this->context.ra = startRa;
    80002ce8:	00f53023          	sd	a5,0(a0)
		this->context.sp = startSp;
    80002cec:	00953423          	sd	s1,8(a0)
}
    80002cf0:	02813083          	ld	ra,40(sp)
    80002cf4:	02013403          	ld	s0,32(sp)
    80002cf8:	01813483          	ld	s1,24(sp)
    80002cfc:	01013903          	ld	s2,16(sp)
    80002d00:	00813983          	ld	s3,8(sp)
    80002d04:	03010113          	addi	sp,sp,48
    80002d08:	00008067          	ret
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80002d0c:	00000793          	li	a5,0
    80002d10:	fcdff06f          	j	80002cdc <_ZN3TCB12createThreadEPFvPvES0_Pm+0x74>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80002d14:	00000493          	li	s1,0
    80002d18:	fd1ff06f          	j	80002ce8 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x80>

0000000080002d1c <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    80002d1c:	ff010113          	addi	sp,sp,-16
    80002d20:	00113423          	sd	ra,8(sp)
    80002d24:	00813023          	sd	s0,0(sp)
    80002d28:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80002d2c:	ffffe097          	auipc	ra,0xffffe
    80002d30:	624080e7          	jalr	1572(ra) # 80001350 <_Z8mem_freePv>
	//MemoryAllocator::kfree(ptr);
}
    80002d34:	00813083          	ld	ra,8(sp)
    80002d38:	00013403          	ld	s0,0(sp)
    80002d3c:	01010113          	addi	sp,sp,16
    80002d40:	00008067          	ret

0000000080002d44 <_ZN3TCB10threadJoinEPS_>:

void TCB::threadJoin(TCB* handle) {
	if (handle->finished) return;
    80002d44:	03054783          	lbu	a5,48(a0)
    80002d48:	00078463          	beqz	a5,80002d50 <_ZN3TCB10threadJoinEPS_+0xc>
    80002d4c:	00008067          	ret
void TCB::threadJoin(TCB* handle) {
    80002d50:	ff010113          	addi	sp,sp,-16
    80002d54:	00113423          	sd	ra,8(sp)
    80002d58:	00813023          	sd	s0,0(sp)
    80002d5c:	01010413          	addi	s0,sp,16
	TCB::running->needToJoin = true;
    80002d60:	0000a597          	auipc	a1,0xa
    80002d64:	e985b583          	ld	a1,-360(a1) # 8000cbf8 <_ZN3TCB7runningE>
    80002d68:	00100793          	li	a5,1
    80002d6c:	02f58923          	sb	a5,50(a1)
	handle->waitingToJoin.putLast(TCB::running);
    80002d70:	05050513          	addi	a0,a0,80
    80002d74:	ffffe097          	auipc	ra,0xffffe
    80002d78:	4d0080e7          	jalr	1232(ra) # 80001244 <_ZN11ThreadQueue7putLastEP3TCB>
}
    80002d7c:	00813083          	ld	ra,8(sp)
    80002d80:	00013403          	ld	s0,0(sp)
    80002d84:	01010113          	addi	sp,sp,16
    80002d88:	00008067          	ret

0000000080002d8c <_ZN3TCB13releaseJoinedEv>:

void TCB::releaseJoined() {
	while (!TCB::running->waitingToJoin.isEmpty()) {
    80002d8c:	0000a517          	auipc	a0,0xa
    80002d90:	e6c53503          	ld	a0,-404(a0) # 8000cbf8 <_ZN3TCB7runningE>
        bool ret = front == nullptr;
    80002d94:	05053783          	ld	a5,80(a0)
    80002d98:	04078663          	beqz	a5,80002de4 <_ZN3TCB13releaseJoinedEv+0x58>
void TCB::releaseJoined() {
    80002d9c:	ff010113          	addi	sp,sp,-16
    80002da0:	00113423          	sd	ra,8(sp)
    80002da4:	00813023          	sd	s0,0(sp)
    80002da8:	01010413          	addi	s0,sp,16
		TCB* tcb = TCB::running->waitingToJoin.getFirst();
    80002dac:	05050513          	addi	a0,a0,80
    80002db0:	ffffe097          	auipc	ra,0xffffe
    80002db4:	500080e7          	jalr	1280(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
		tcb->needToJoin = false;
    80002db8:	02050923          	sb	zero,50(a0)
		Scheduler::put(tcb);
    80002dbc:	fffff097          	auipc	ra,0xfffff
    80002dc0:	c04080e7          	jalr	-1020(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
	while (!TCB::running->waitingToJoin.isEmpty()) {
    80002dc4:	0000a517          	auipc	a0,0xa
    80002dc8:	e3453503          	ld	a0,-460(a0) # 8000cbf8 <_ZN3TCB7runningE>
    80002dcc:	05053783          	ld	a5,80(a0)
    80002dd0:	fc079ee3          	bnez	a5,80002dac <_ZN3TCB13releaseJoinedEv+0x20>
	}
}
    80002dd4:	00813083          	ld	ra,8(sp)
    80002dd8:	00013403          	ld	s0,0(sp)
    80002ddc:	01010113          	addi	sp,sp,16
    80002de0:	00008067          	ret
    80002de4:	00008067          	ret

0000000080002de8 <_ZN3TCB5startEPS_>:

void TCB::start(TCB* newTcb) {
	//startovanje niti(stavljanje u Scheduler); main nit je vec aktivna, ne stavlja se u Scheduler
	if (newTcb->threadFunction != nullptr) Scheduler::put(newTcb);
    80002de8:	01053783          	ld	a5,16(a0)
    80002dec:	02078663          	beqz	a5,80002e18 <_ZN3TCB5startEPS_+0x30>
void TCB::start(TCB* newTcb) {
    80002df0:	ff010113          	addi	sp,sp,-16
    80002df4:	00113423          	sd	ra,8(sp)
    80002df8:	00813023          	sd	s0,0(sp)
    80002dfc:	01010413          	addi	s0,sp,16
	if (newTcb->threadFunction != nullptr) Scheduler::put(newTcb);
    80002e00:	fffff097          	auipc	ra,0xfffff
    80002e04:	bc0080e7          	jalr	-1088(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
}
    80002e08:	00813083          	ld	ra,8(sp)
    80002e0c:	00013403          	ld	s0,0(sp)
    80002e10:	01010113          	addi	sp,sp,16
    80002e14:	00008067          	ret
    80002e18:	00008067          	ret

0000000080002e1c <_ZN5Riscv10popSppSpieEv>:
// Created by os on 5/17/23.
//

#include "../h/Riscv.hpp"

void Riscv::popSppSpie() {
    80002e1c:	ff010113          	addi	sp,sp,-16
    80002e20:	00813423          	sd	s0,8(sp)
    80002e24:	01010413          	addi	s0,sp,16
	//ra pokazuje iza ove funkcije na nastavak wrappera
	__asm__ volatile("csrw sepc, ra");
    80002e28:	14109073          	csrw	sepc,ra
	__asm__ volatile("sret");
    80002e2c:	10200073          	sret
    80002e30:	00813403          	ld	s0,8(sp)
    80002e34:	01010113          	addi	sp,sp,16
    80002e38:	00008067          	ret

0000000080002e3c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>:
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

#pragma GCC optimize("O0")

void* MemoryAllocator::kmalloc(size_t size, Purpose pur) {
    80002e3c:	fa010113          	addi	sp,sp,-96
    80002e40:	04813c23          	sd	s0,88(sp)
    80002e44:	06010413          	addi	s0,sp,96
    80002e48:	faa43423          	sd	a0,-88(s0)
    80002e4c:	00058793          	mv	a5,a1
    80002e50:	faf42223          	sw	a5,-92(s0)
    //size je u broju bajtova, ukljucuje i mesto potrebno za zaglavlje UsedMemSegment
    if (size <= 0) return nullptr;
    80002e54:	fa843783          	ld	a5,-88(s0)
    80002e58:	00079663          	bnez	a5,80002e64 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x28>
    80002e5c:	00000793          	li	a5,0
    80002e60:	2740006f          	j	800030d4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x298>
//        printString("Greska");
//    }

    //alokacija uvek zaokruzena na blokove
    //size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
    size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80002e64:	fa843783          	ld	a5,-88(s0)
    80002e68:	0067d713          	srli	a4,a5,0x6
    80002e6c:	fa843783          	ld	a5,-88(s0)
    80002e70:	03f7f793          	andi	a5,a5,63
    80002e74:	00078663          	beqz	a5,80002e80 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x44>
    80002e78:	00100793          	li	a5,1
    80002e7c:	0080006f          	j	80002e84 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x48>
    80002e80:	00000793          	li	a5,0
    80002e84:	00e787b3          	add	a5,a5,a4
    80002e88:	fcf43823          	sd	a5,-48(s0)
    size = blocks * MEM_BLOCK_SIZE;
    80002e8c:	fd043783          	ld	a5,-48(s0)
    80002e90:	00679793          	slli	a5,a5,0x6
    80002e94:	faf43423          	sd	a5,-88(s0)

    //trazenje slobodnog segmenta po first-fit algoritmu
    for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80002e98:	0000a797          	auipc	a5,0xa
    80002e9c:	d7878793          	addi	a5,a5,-648 # 8000cc10 <_ZN15MemoryAllocator11freeMemHeadE>
    80002ea0:	0007b783          	ld	a5,0(a5)
    80002ea4:	fef43423          	sd	a5,-24(s0)
    80002ea8:	fe843783          	ld	a5,-24(s0)
    80002eac:	22078263          	beqz	a5,800030d0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x294>
        if (current->size < size) continue;
    80002eb0:	fe843783          	ld	a5,-24(s0)
    80002eb4:	0107b783          	ld	a5,16(a5)
    80002eb8:	fa843703          	ld	a4,-88(s0)
    80002ebc:	20e7e063          	bltu	a5,a4,800030bc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x280>

        //pravljenje novog slobodnog fragmenta od ostatka fragmenta
        FreeMemSegment* remainderFree = (FreeMemSegment*) ((char*) current + size);
    80002ec0:	fe843703          	ld	a4,-24(s0)
    80002ec4:	fa843783          	ld	a5,-88(s0)
    80002ec8:	00f707b3          	add	a5,a4,a5
    80002ecc:	fcf43423          	sd	a5,-56(s0)
        size_t remainingSize = current->size - size;
    80002ed0:	fe843783          	ld	a5,-24(s0)
    80002ed4:	0107b703          	ld	a4,16(a5)
    80002ed8:	fa843783          	ld	a5,-88(s0)
    80002edc:	40f707b3          	sub	a5,a4,a5
    80002ee0:	fcf43023          	sd	a5,-64(s0)
        if (remainingSize <= sizeof(UsedMemSegment)) {
    80002ee4:	fc043703          	ld	a4,-64(s0)
    80002ee8:	02000793          	li	a5,32
    80002eec:	08e7e063          	bltu	a5,a4,80002f6c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x130>
            //ne preostaje dovoljno veliki slobodni segment;dodeljujemo ceo trenutno alociranom
            size += remainingSize;
    80002ef0:	fa843703          	ld	a4,-88(s0)
    80002ef4:	fc043783          	ld	a5,-64(s0)
    80002ef8:	00f707b3          	add	a5,a4,a5
    80002efc:	faf43423          	sd	a5,-88(s0)
            if (current->prev) current->prev->next = current->next;
    80002f00:	fe843783          	ld	a5,-24(s0)
    80002f04:	0087b783          	ld	a5,8(a5)
    80002f08:	00078c63          	beqz	a5,80002f20 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xe4>
    80002f0c:	fe843783          	ld	a5,-24(s0)
    80002f10:	0087b783          	ld	a5,8(a5)
    80002f14:	fe843703          	ld	a4,-24(s0)
    80002f18:	00073703          	ld	a4,0(a4)
    80002f1c:	00e7b023          	sd	a4,0(a5)
            if (current->next) current->next->prev = current->prev;
    80002f20:	fe843783          	ld	a5,-24(s0)
    80002f24:	0007b783          	ld	a5,0(a5)
    80002f28:	00078c63          	beqz	a5,80002f40 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x104>
    80002f2c:	fe843783          	ld	a5,-24(s0)
    80002f30:	0007b783          	ld	a5,0(a5)
    80002f34:	fe843703          	ld	a4,-24(s0)
    80002f38:	00873703          	ld	a4,8(a4)
    80002f3c:	00e7b423          	sd	a4,8(a5)
            if (freeMemHead == current) { freeMemHead = current->next; }
    80002f40:	0000a797          	auipc	a5,0xa
    80002f44:	cd078793          	addi	a5,a5,-816 # 8000cc10 <_ZN15MemoryAllocator11freeMemHeadE>
    80002f48:	0007b783          	ld	a5,0(a5)
    80002f4c:	fe843703          	ld	a4,-24(s0)
    80002f50:	0af71263          	bne	a4,a5,80002ff4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b8>
    80002f54:	fe843783          	ld	a5,-24(s0)
    80002f58:	0007b703          	ld	a4,0(a5)
    80002f5c:	0000a797          	auipc	a5,0xa
    80002f60:	cb478793          	addi	a5,a5,-844 # 8000cc10 <_ZN15MemoryAllocator11freeMemHeadE>
    80002f64:	00e7b023          	sd	a4,0(a5)
    80002f68:	08c0006f          	j	80002ff4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b8>
        } else {
            remainderFree->size = remainingSize;
    80002f6c:	fc843783          	ld	a5,-56(s0)
    80002f70:	fc043703          	ld	a4,-64(s0)
    80002f74:	00e7b823          	sd	a4,16(a5)
            remainderFree->prev = current->prev;
    80002f78:	fe843783          	ld	a5,-24(s0)
    80002f7c:	0087b703          	ld	a4,8(a5)
    80002f80:	fc843783          	ld	a5,-56(s0)
    80002f84:	00e7b423          	sd	a4,8(a5)
            if (current->prev) current->prev->next = remainderFree;
    80002f88:	fe843783          	ld	a5,-24(s0)
    80002f8c:	0087b783          	ld	a5,8(a5)
    80002f90:	00078a63          	beqz	a5,80002fa4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x168>
    80002f94:	fe843783          	ld	a5,-24(s0)
    80002f98:	0087b783          	ld	a5,8(a5)
    80002f9c:	fc843703          	ld	a4,-56(s0)
    80002fa0:	00e7b023          	sd	a4,0(a5)
            remainderFree->next = current->next;
    80002fa4:	fe843783          	ld	a5,-24(s0)
    80002fa8:	0007b703          	ld	a4,0(a5)
    80002fac:	fc843783          	ld	a5,-56(s0)
    80002fb0:	00e7b023          	sd	a4,0(a5)
            if (current->next) current->next->prev = remainderFree;
    80002fb4:	fe843783          	ld	a5,-24(s0)
    80002fb8:	0007b783          	ld	a5,0(a5)
    80002fbc:	00078a63          	beqz	a5,80002fd0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x194>
    80002fc0:	fe843783          	ld	a5,-24(s0)
    80002fc4:	0007b783          	ld	a5,0(a5)
    80002fc8:	fc843703          	ld	a4,-56(s0)
    80002fcc:	00e7b423          	sd	a4,8(a5)
            if (freeMemHead == current) { freeMemHead = remainderFree; }
    80002fd0:	0000a797          	auipc	a5,0xa
    80002fd4:	c4078793          	addi	a5,a5,-960 # 8000cc10 <_ZN15MemoryAllocator11freeMemHeadE>
    80002fd8:	0007b783          	ld	a5,0(a5)
    80002fdc:	fe843703          	ld	a4,-24(s0)
    80002fe0:	00f71a63          	bne	a4,a5,80002ff4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b8>
    80002fe4:	0000a797          	auipc	a5,0xa
    80002fe8:	c2c78793          	addi	a5,a5,-980 # 8000cc10 <_ZN15MemoryAllocator11freeMemHeadE>
    80002fec:	fc843703          	ld	a4,-56(s0)
    80002ff0:	00e7b023          	sd	a4,0(a5)
        }
        //ubacivanje novog fragmenta u listu zauzetih fragmenata
        UsedMemSegment* newFragment = (UsedMemSegment*) current;
    80002ff4:	fe843783          	ld	a5,-24(s0)
    80002ff8:	faf43c23          	sd	a5,-72(s0)
        newFragment->size = size;
    80002ffc:	fb843783          	ld	a5,-72(s0)
    80003000:	fa843703          	ld	a4,-88(s0)
    80003004:	00e7b423          	sd	a4,8(a5)
        newFragment->purpose = pur;
    80003008:	fb843783          	ld	a5,-72(s0)
    8000300c:	fa442703          	lw	a4,-92(s0)
    80003010:	00e7a823          	sw	a4,16(a5)
        newFragment->usableFirstAddress = (char*) newFragment + sizeof(UsedMemSegment);
    80003014:	fb843783          	ld	a5,-72(s0)
    80003018:	02078713          	addi	a4,a5,32
    8000301c:	fb843783          	ld	a5,-72(s0)
    80003020:	00e7bc23          	sd	a4,24(a5)
        UsedMemSegment* prevUsed = nullptr;
    80003024:	fe043023          	sd	zero,-32(s0)
        for (UsedMemSegment* cur = usedMemHead;
    80003028:	0000a797          	auipc	a5,0xa
    8000302c:	be078793          	addi	a5,a5,-1056 # 8000cc08 <_ZN15MemoryAllocator11usedMemHeadE>
    80003030:	0007b783          	ld	a5,0(a5)
    80003034:	fcf43c23          	sd	a5,-40(s0)
             cur && ((char*) cur < (char*) newFragment); cur = cur->next) {
    80003038:	fd843783          	ld	a5,-40(s0)
    8000303c:	02078463          	beqz	a5,80003064 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
    80003040:	fd843703          	ld	a4,-40(s0)
    80003044:	fb843783          	ld	a5,-72(s0)
    80003048:	00f77e63          	bgeu	a4,a5,80003064 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
            prevUsed = cur;
    8000304c:	fd843783          	ld	a5,-40(s0)
    80003050:	fef43023          	sd	a5,-32(s0)
             cur && ((char*) cur < (char*) newFragment); cur = cur->next) {
    80003054:	fd843783          	ld	a5,-40(s0)
    80003058:	0007b783          	ld	a5,0(a5)
    8000305c:	fcf43c23          	sd	a5,-40(s0)
        for (UsedMemSegment* cur = usedMemHead;
    80003060:	fd9ff06f          	j	80003038 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1fc>
        }
        if (!prevUsed) {
    80003064:	fe043783          	ld	a5,-32(s0)
    80003068:	02079663          	bnez	a5,80003094 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x258>
            newFragment->next = usedMemHead;
    8000306c:	0000a797          	auipc	a5,0xa
    80003070:	b9c78793          	addi	a5,a5,-1124 # 8000cc08 <_ZN15MemoryAllocator11usedMemHeadE>
    80003074:	0007b703          	ld	a4,0(a5)
    80003078:	fb843783          	ld	a5,-72(s0)
    8000307c:	00e7b023          	sd	a4,0(a5)
            usedMemHead = newFragment;
    80003080:	0000a797          	auipc	a5,0xa
    80003084:	b8878793          	addi	a5,a5,-1144 # 8000cc08 <_ZN15MemoryAllocator11usedMemHeadE>
    80003088:	fb843703          	ld	a4,-72(s0)
    8000308c:	00e7b023          	sd	a4,0(a5)
    80003090:	0200006f          	j	800030b0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x274>
        } else {
            newFragment->next = prevUsed->next;
    80003094:	fe043783          	ld	a5,-32(s0)
    80003098:	0007b703          	ld	a4,0(a5)
    8000309c:	fb843783          	ld	a5,-72(s0)
    800030a0:	00e7b023          	sd	a4,0(a5)
            prevUsed->next = newFragment;
    800030a4:	fe043783          	ld	a5,-32(s0)
    800030a8:	fb843703          	ld	a4,-72(s0)
    800030ac:	00e7b023          	sd	a4,0(a5)
        }
        //return (char*)newFragment + sizeof(UsedMemSegment);
        return newFragment->usableFirstAddress;
    800030b0:	fb843783          	ld	a5,-72(s0)
    800030b4:	0187b783          	ld	a5,24(a5)
    800030b8:	01c0006f          	j	800030d4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x298>
        if (current->size < size) continue;
    800030bc:	00000013          	nop
    for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    800030c0:	fe843783          	ld	a5,-24(s0)
    800030c4:	0007b783          	ld	a5,0(a5)
    800030c8:	fef43423          	sd	a5,-24(s0)
    800030cc:	dddff06f          	j	80002ea8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x6c>
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
    80003104:	1d40006f          	j	800032d8 <_ZN15MemoryAllocator5kfreeEPv+0x1f4>
    if (!usedMemHead) return -1;
    80003108:	0000a797          	auipc	a5,0xa
    8000310c:	b0078793          	addi	a5,a5,-1280 # 8000cc08 <_ZN15MemoryAllocator11usedMemHeadE>
    80003110:	0007b783          	ld	a5,0(a5)
    80003114:	00079663          	bnez	a5,80003120 <_ZN15MemoryAllocator5kfreeEPv+0x3c>
    80003118:	fff00793          	li	a5,-1
    8000311c:	1bc0006f          	j	800032d8 <_ZN15MemoryAllocator5kfreeEPv+0x1f4>
    //ptr pokazuje na usableFirstAddress, pre toga je zaglavlje segmenta
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    80003120:	fb843783          	ld	a5,-72(s0)
    80003124:	fe078793          	addi	a5,a5,-32
    80003128:	faf43c23          	sd	a5,-72(s0)

    //trazenje adrese ptr u listi zauzetih segmenata
    UsedMemSegment* currentUsed = usedMemHead;
    8000312c:	0000a797          	auipc	a5,0xa
    80003130:	adc78793          	addi	a5,a5,-1316 # 8000cc08 <_ZN15MemoryAllocator11usedMemHeadE>
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
    8000317c:	15c0006f          	j	800032d8 <_ZN15MemoryAllocator5kfreeEPv+0x1f4>

    //prevezivanje liste zauzetih segmenata
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
    800031a8:	a6478793          	addi	a5,a5,-1436 # 8000cc08 <_ZN15MemoryAllocator11usedMemHeadE>
    800031ac:	00e7b023          	sd	a4,0(a5)

    //oslobadjanje segmenta i ubacivanje u listu slobodnih
    FreeMemSegment* prevFree = nullptr;
    800031b0:	fc043c23          	sd	zero,-40(s0)
    if (!freeMemHead || ((char*) ptr < (char*) freeMemHead)) {
    800031b4:	0000a797          	auipc	a5,0xa
    800031b8:	a5c78793          	addi	a5,a5,-1444 # 8000cc10 <_ZN15MemoryAllocator11freeMemHeadE>
    800031bc:	0007b783          	ld	a5,0(a5)
    800031c0:	00078c63          	beqz	a5,800031d8 <_ZN15MemoryAllocator5kfreeEPv+0xf4>
    800031c4:	0000a797          	auipc	a5,0xa
    800031c8:	a4c78793          	addi	a5,a5,-1460 # 8000cc10 <_ZN15MemoryAllocator11freeMemHeadE>
    800031cc:	0007b783          	ld	a5,0(a5)
    800031d0:	fb843703          	ld	a4,-72(s0)
    800031d4:	00f77663          	bgeu	a4,a5,800031e0 <_ZN15MemoryAllocator5kfreeEPv+0xfc>
        prevFree = nullptr;
    800031d8:	fc043c23          	sd	zero,-40(s0)
    800031dc:	0400006f          	j	8000321c <_ZN15MemoryAllocator5kfreeEPv+0x138>
    } else {
        for (prevFree = freeMemHead;
    800031e0:	0000a797          	auipc	a5,0xa
    800031e4:	a3078793          	addi	a5,a5,-1488 # 8000cc10 <_ZN15MemoryAllocator11freeMemHeadE>
    800031e8:	0007b783          	ld	a5,0(a5)
    800031ec:	fcf43c23          	sd	a5,-40(s0)
             prevFree->next && (char*) ptr > (char*) (prevFree->next); prevFree = prevFree->next);
    800031f0:	fd843783          	ld	a5,-40(s0)
    800031f4:	0007b783          	ld	a5,0(a5)
    800031f8:	02078263          	beqz	a5,8000321c <_ZN15MemoryAllocator5kfreeEPv+0x138>
    800031fc:	fd843783          	ld	a5,-40(s0)
    80003200:	0007b783          	ld	a5,0(a5)
    80003204:	fb843703          	ld	a4,-72(s0)
    80003208:	00e7fa63          	bgeu	a5,a4,8000321c <_ZN15MemoryAllocator5kfreeEPv+0x138>
    8000320c:	fd843783          	ld	a5,-40(s0)
    80003210:	0007b783          	ld	a5,0(a5)
    80003214:	fcf43c23          	sd	a5,-40(s0)
        for (prevFree = freeMemHead;
    80003218:	fd9ff06f          	j	800031f0 <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    }
    FreeMemSegment* newFree = (FreeMemSegment*) ptr;
    8000321c:	fb843783          	ld	a5,-72(s0)
    80003220:	fcf43823          	sd	a5,-48(s0)
    size_t segmentSize = ((UsedMemSegment*) ptr)->size;
    80003224:	fb843783          	ld	a5,-72(s0)
    80003228:	0087b783          	ld	a5,8(a5)
    8000322c:	fcf43423          	sd	a5,-56(s0)
    newFree->size = segmentSize;
    80003230:	fd043783          	ld	a5,-48(s0)
    80003234:	fc843703          	ld	a4,-56(s0)
    80003238:	00e7b823          	sd	a4,16(a5)
    newFree->prev = prevFree;
    8000323c:	fd043783          	ld	a5,-48(s0)
    80003240:	fd843703          	ld	a4,-40(s0)
    80003244:	00e7b423          	sd	a4,8(a5)
    if (prevFree) newFree->next = prevFree->next;
    80003248:	fd843783          	ld	a5,-40(s0)
    8000324c:	00078c63          	beqz	a5,80003264 <_ZN15MemoryAllocator5kfreeEPv+0x180>
    80003250:	fd843783          	ld	a5,-40(s0)
    80003254:	0007b703          	ld	a4,0(a5)
    80003258:	fd043783          	ld	a5,-48(s0)
    8000325c:	00e7b023          	sd	a4,0(a5)
    80003260:	0180006f          	j	80003278 <_ZN15MemoryAllocator5kfreeEPv+0x194>
    else newFree->next = freeMemHead;
    80003264:	0000a797          	auipc	a5,0xa
    80003268:	9ac78793          	addi	a5,a5,-1620 # 8000cc10 <_ZN15MemoryAllocator11freeMemHeadE>
    8000326c:	0007b703          	ld	a4,0(a5)
    80003270:	fd043783          	ld	a5,-48(s0)
    80003274:	00e7b023          	sd	a4,0(a5)
    if (newFree->next) newFree->next->prev = newFree;
    80003278:	fd043783          	ld	a5,-48(s0)
    8000327c:	0007b783          	ld	a5,0(a5)
    80003280:	00078a63          	beqz	a5,80003294 <_ZN15MemoryAllocator5kfreeEPv+0x1b0>
    80003284:	fd043783          	ld	a5,-48(s0)
    80003288:	0007b783          	ld	a5,0(a5)
    8000328c:	fd043703          	ld	a4,-48(s0)
    80003290:	00e7b423          	sd	a4,8(a5)
    if (prevFree) prevFree->next = newFree;
    80003294:	fd843783          	ld	a5,-40(s0)
    80003298:	00078a63          	beqz	a5,800032ac <_ZN15MemoryAllocator5kfreeEPv+0x1c8>
    8000329c:	fd843783          	ld	a5,-40(s0)
    800032a0:	fd043703          	ld	a4,-48(s0)
    800032a4:	00e7b023          	sd	a4,0(a5)
    800032a8:	0140006f          	j	800032bc <_ZN15MemoryAllocator5kfreeEPv+0x1d8>
    else freeMemHead = newFree;
    800032ac:	0000a797          	auipc	a5,0xa
    800032b0:	96478793          	addi	a5,a5,-1692 # 8000cc10 <_ZN15MemoryAllocator11freeMemHeadE>
    800032b4:	fd043703          	ld	a4,-48(s0)
    800032b8:	00e7b023          	sd	a4,0(a5)

    //spajanje uzastopnih slobodnih segmenata
    tryToJoin(newFree);
    800032bc:	fd043503          	ld	a0,-48(s0)
    800032c0:	00000097          	auipc	ra,0x0
    800032c4:	02c080e7          	jalr	44(ra) # 800032ec <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    tryToJoin(prevFree);
    800032c8:	fd843503          	ld	a0,-40(s0)
    800032cc:	00000097          	auipc	ra,0x0
    800032d0:	020080e7          	jalr	32(ra) # 800032ec <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    return 0;
    800032d4:	00000793          	li	a5,0
}
    800032d8:	00078513          	mv	a0,a5
    800032dc:	04813083          	ld	ra,72(sp)
    800032e0:	04013403          	ld	s0,64(sp)
    800032e4:	05010113          	addi	sp,sp,80
    800032e8:	00008067          	ret

00000000800032ec <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:

#pragma GCC optimize("O0")

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    800032ec:	fc010113          	addi	sp,sp,-64
    800032f0:	02813c23          	sd	s0,56(sp)
    800032f4:	04010413          	addi	s0,sp,64
    800032f8:	fca43423          	sd	a0,-56(s0)
    if (!current) return 0;
    800032fc:	fc843783          	ld	a5,-56(s0)
    80003300:	00079663          	bnez	a5,8000330c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x20>
    80003304:	00000793          	li	a5,0
    80003308:	0bc0006f          	j	800033c4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xd8>
    bool nextExists = current->next != nullptr;
    8000330c:	fc843783          	ld	a5,-56(s0)
    80003310:	0007b783          	ld	a5,0(a5)
    80003314:	00f037b3          	snez	a5,a5
    80003318:	fef407a3          	sb	a5,-17(s0)
    char* nextAddr = (char*) current + current->size;
    8000331c:	fc843783          	ld	a5,-56(s0)
    80003320:	0107b783          	ld	a5,16(a5)
    80003324:	fc843703          	ld	a4,-56(s0)
    80003328:	00f707b3          	add	a5,a4,a5
    8000332c:	fef43023          	sd	a5,-32(s0)
    char* cnext = (char*) current->next;
    80003330:	fc843783          	ld	a5,-56(s0)
    80003334:	0007b783          	ld	a5,0(a5)
    80003338:	fcf43c23          	sd	a5,-40(s0)
    bool nextIsConnected = (nextAddr == cnext);
    8000333c:	fe043703          	ld	a4,-32(s0)
    80003340:	fd843783          	ld	a5,-40(s0)
    80003344:	40f707b3          	sub	a5,a4,a5
    80003348:	0017b793          	seqz	a5,a5
    8000334c:	fcf40ba3          	sb	a5,-41(s0)
    if (nextExists && nextIsConnected) {
    80003350:	fef44783          	lbu	a5,-17(s0)
    80003354:	0ff7f793          	andi	a5,a5,255
    80003358:	06078463          	beqz	a5,800033c0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xd4>
    8000335c:	fd744783          	lbu	a5,-41(s0)
    80003360:	0ff7f793          	andi	a5,a5,255
    80003364:	04078e63          	beqz	a5,800033c0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xd4>
        current->size += current->next->size;
    80003368:	fc843783          	ld	a5,-56(s0)
    8000336c:	0107b703          	ld	a4,16(a5)
    80003370:	fc843783          	ld	a5,-56(s0)
    80003374:	0007b783          	ld	a5,0(a5)
    80003378:	0107b783          	ld	a5,16(a5)
    8000337c:	00f70733          	add	a4,a4,a5
    80003380:	fc843783          	ld	a5,-56(s0)
    80003384:	00e7b823          	sd	a4,16(a5)
        current->next = current->next->next;
    80003388:	fc843783          	ld	a5,-56(s0)
    8000338c:	0007b783          	ld	a5,0(a5)
    80003390:	0007b703          	ld	a4,0(a5)
    80003394:	fc843783          	ld	a5,-56(s0)
    80003398:	00e7b023          	sd	a4,0(a5)
        if (current->next) current->next->prev = current;
    8000339c:	fc843783          	ld	a5,-56(s0)
    800033a0:	0007b783          	ld	a5,0(a5)
    800033a4:	00078a63          	beqz	a5,800033b8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xcc>
    800033a8:	fc843783          	ld	a5,-56(s0)
    800033ac:	0007b783          	ld	a5,0(a5)
    800033b0:	fc843703          	ld	a4,-56(s0)
    800033b4:	00e7b423          	sd	a4,8(a5)
        return 1;
    800033b8:	00100793          	li	a5,1
    800033bc:	0080006f          	j	800033c4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xd8>
    } else return 0;
    800033c0:	00000793          	li	a5,0
}
    800033c4:	00078513          	mv	a0,a5
    800033c8:	03813403          	ld	s0,56(sp)
    800033cc:	04010113          	addi	sp,sp,64
    800033d0:	00008067          	ret

00000000800033d4 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>:

bool MemoryAllocator::checkPurpose(void* ptr, MemoryAllocator::Purpose p) {
    800033d4:	fe010113          	addi	sp,sp,-32
    800033d8:	00813c23          	sd	s0,24(sp)
    800033dc:	02010413          	addi	s0,sp,32
    800033e0:	fea43423          	sd	a0,-24(s0)
    800033e4:	00058793          	mv	a5,a1
    800033e8:	fef42223          	sw	a5,-28(s0)
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    800033ec:	fe843783          	ld	a5,-24(s0)
    800033f0:	fe078793          	addi	a5,a5,-32
    800033f4:	fef43423          	sd	a5,-24(s0)
    return ((UsedMemSegment*) ptr)->purpose == p;
    800033f8:	fe843783          	ld	a5,-24(s0)
    800033fc:	0107a703          	lw	a4,16(a5)
    80003400:	fe442783          	lw	a5,-28(s0)
    80003404:	0007879b          	sext.w	a5,a5
    80003408:	40e787b3          	sub	a5,a5,a4
    8000340c:	0017b793          	seqz	a5,a5
    80003410:	0ff7f793          	andi	a5,a5,255
}
    80003414:	00078513          	mv	a0,a5
    80003418:	01813403          	ld	s0,24(sp)
    8000341c:	02010113          	addi	sp,sp,32
    80003420:	00008067          	ret

0000000080003424 <_ZN15MemoryAllocator19initMemoryAllocatorEv>:

void MemoryAllocator::initMemoryAllocator() {
    80003424:	ff010113          	addi	sp,sp,-16
    80003428:	00813423          	sd	s0,8(sp)
    8000342c:	01010413          	addi	s0,sp,16
//pocetna inicijalizacija
    if (!initialized) {
    80003430:	00009797          	auipc	a5,0x9
    80003434:	7e878793          	addi	a5,a5,2024 # 8000cc18 <_ZN15MemoryAllocator11initializedE>
    80003438:	0007c783          	lbu	a5,0(a5)
    8000343c:	0017c793          	xori	a5,a5,1
    80003440:	0ff7f793          	andi	a5,a5,255
    80003444:	08078263          	beqz	a5,800034c8 <_ZN15MemoryAllocator19initMemoryAllocatorEv+0xa4>
        freeMemHead = (FreeMemSegment*) HEAP_START_ADDR;
    80003448:	00009797          	auipc	a5,0x9
    8000344c:	6387b783          	ld	a5,1592(a5) # 8000ca80 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003450:	0007b703          	ld	a4,0(a5)
    80003454:	00009797          	auipc	a5,0x9
    80003458:	7bc78793          	addi	a5,a5,1980 # 8000cc10 <_ZN15MemoryAllocator11freeMemHeadE>
    8000345c:	00e7b023          	sd	a4,0(a5)
        freeMemHead->next = nullptr;
    80003460:	00009797          	auipc	a5,0x9
    80003464:	7b078793          	addi	a5,a5,1968 # 8000cc10 <_ZN15MemoryAllocator11freeMemHeadE>
    80003468:	0007b783          	ld	a5,0(a5)
    8000346c:	0007b023          	sd	zero,0(a5)
        freeMemHead->prev = nullptr;
    80003470:	00009797          	auipc	a5,0x9
    80003474:	7a078793          	addi	a5,a5,1952 # 8000cc10 <_ZN15MemoryAllocator11freeMemHeadE>
    80003478:	0007b783          	ld	a5,0(a5)
    8000347c:	0007b423          	sd	zero,8(a5)
        freeMemHead->size = (char*) HEAP_END_ADDR - (char*) HEAP_START_ADDR;//- sizeof(FreeMemSegment);
    80003480:	00009797          	auipc	a5,0x9
    80003484:	6387b783          	ld	a5,1592(a5) # 8000cab8 <_GLOBAL_OFFSET_TABLE_+0x60>
    80003488:	0007b703          	ld	a4,0(a5)
    8000348c:	00009797          	auipc	a5,0x9
    80003490:	5f47b783          	ld	a5,1524(a5) # 8000ca80 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003494:	0007b783          	ld	a5,0(a5)
    80003498:	40f70733          	sub	a4,a4,a5
    8000349c:	00009797          	auipc	a5,0x9
    800034a0:	77478793          	addi	a5,a5,1908 # 8000cc10 <_ZN15MemoryAllocator11freeMemHeadE>
    800034a4:	0007b783          	ld	a5,0(a5)
    800034a8:	00e7b823          	sd	a4,16(a5)
        usedMemHead = nullptr;
    800034ac:	00009797          	auipc	a5,0x9
    800034b0:	75c78793          	addi	a5,a5,1884 # 8000cc08 <_ZN15MemoryAllocator11usedMemHeadE>
    800034b4:	0007b023          	sd	zero,0(a5)

        initialized = true;
    800034b8:	00009797          	auipc	a5,0x9
    800034bc:	76078793          	addi	a5,a5,1888 # 8000cc18 <_ZN15MemoryAllocator11initializedE>
    800034c0:	00100713          	li	a4,1
    800034c4:	00e78023          	sb	a4,0(a5)
    }
}
    800034c8:	00000013          	nop
    800034cc:	00813403          	ld	s0,8(sp)
    800034d0:	01010113          	addi	sp,sp,16
    800034d4:	00008067          	ret

00000000800034d8 <_ZN4KSemnwEm>:

#include "../h/KSem.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void* KSem::operator new(size_t size) {
    800034d8:	ff010113          	addi	sp,sp,-16
    800034dc:	00113423          	sd	ra,8(sp)
    800034e0:	00813023          	sd	s0,0(sp)
    800034e4:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    800034e8:	ffffe097          	auipc	ra,0xffffe
    800034ec:	e28080e7          	jalr	-472(ra) # 80001310 <_Z9mem_allocm>
	//return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::SEMAPHORE);
}
    800034f0:	00813083          	ld	ra,8(sp)
    800034f4:	00013403          	ld	s0,0(sp)
    800034f8:	01010113          	addi	sp,sp,16
    800034fc:	00008067          	ret

0000000080003500 <_ZN4KSemdlEPv>:

void KSem::operator delete(void* ptr) {
    80003500:	ff010113          	addi	sp,sp,-16
    80003504:	00113423          	sd	ra,8(sp)
    80003508:	00813023          	sd	s0,0(sp)
    8000350c:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80003510:	ffffe097          	auipc	ra,0xffffe
    80003514:	e40080e7          	jalr	-448(ra) # 80001350 <_Z8mem_freePv>
	//MemoryAllocator::kfree(ptr);
}
    80003518:	00813083          	ld	ra,8(sp)
    8000351c:	00013403          	ld	s0,0(sp)
    80003520:	01010113          	addi	sp,sp,16
    80003524:	00008067          	ret

0000000080003528 <_ZN4KSem7initSemEj>:

KSem* KSem::initSem(uint val) {
    80003528:	fe010113          	addi	sp,sp,-32
    8000352c:	00113c23          	sd	ra,24(sp)
    80003530:	00813823          	sd	s0,16(sp)
    80003534:	00913423          	sd	s1,8(sp)
    80003538:	02010413          	addi	s0,sp,32
    8000353c:	00050493          	mv	s1,a0
	return new KSem(val);
    80003540:	02000513          	li	a0,32
    80003544:	00000097          	auipc	ra,0x0
    80003548:	f94080e7          	jalr	-108(ra) # 800034d8 <_ZN4KSemnwEm>
	void block();

	void unblock();

private:
	KSem(uint val) : val(val), working(true) {}
    8000354c:	00952023          	sw	s1,0(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    80003550:	00053423          	sd	zero,8(a0)
    80003554:	00053823          	sd	zero,16(a0)
    80003558:	00100713          	li	a4,1
    8000355c:	00e50c23          	sb	a4,24(a0)
}
    80003560:	01813083          	ld	ra,24(sp)
    80003564:	01013403          	ld	s0,16(sp)
    80003568:	00813483          	ld	s1,8(sp)
    8000356c:	02010113          	addi	sp,sp,32
    80003570:	00008067          	ret

0000000080003574 <_ZN4KSem5blockEv>:
		unblock();
	}
	return 0;
}

void KSem::block() {
    80003574:	ff010113          	addi	sp,sp,-16
    80003578:	00113423          	sd	ra,8(sp)
    8000357c:	00813023          	sd	s0,0(sp)
    80003580:	01010413          	addi	s0,sp,16
	TCB::running->setBlocked(true);
    80003584:	00009797          	auipc	a5,0x9
    80003588:	52c7b783          	ld	a5,1324(a5) # 8000cab0 <_GLOBAL_OFFSET_TABLE_+0x58>
    8000358c:	0007b583          	ld	a1,0(a5)
	void setBlocked(bool block) { this->blocked = block; }
    80003590:	00100793          	li	a5,1
    80003594:	02f588a3          	sb	a5,49(a1)
	blocked.putLast(TCB::running);
    80003598:	00850513          	addi	a0,a0,8
    8000359c:	ffffe097          	auipc	ra,0xffffe
    800035a0:	ca8080e7          	jalr	-856(ra) # 80001244 <_ZN11ThreadQueue7putLastEP3TCB>
	TCB::yield();
    800035a4:	fffff097          	auipc	ra,0xfffff
    800035a8:	664080e7          	jalr	1636(ra) # 80002c08 <_ZN3TCB5yieldEv>
}
    800035ac:	00813083          	ld	ra,8(sp)
    800035b0:	00013403          	ld	s0,0(sp)
    800035b4:	01010113          	addi	sp,sp,16
    800035b8:	00008067          	ret

00000000800035bc <_ZN4KSem4waitEv>:
	if (!working) return -3;
    800035bc:	01854783          	lbu	a5,24(a0)
    800035c0:	04078663          	beqz	a5,8000360c <_ZN4KSem4waitEv+0x50>
	if (--val < 0) {
    800035c4:	00052783          	lw	a5,0(a0)
    800035c8:	fff7879b          	addiw	a5,a5,-1
    800035cc:	00f52023          	sw	a5,0(a0)
    800035d0:	02079713          	slli	a4,a5,0x20
    800035d4:	00074663          	bltz	a4,800035e0 <_ZN4KSem4waitEv+0x24>
	return 0;
    800035d8:	00000513          	li	a0,0
}
    800035dc:	00008067          	ret
int KSem::wait() {
    800035e0:	ff010113          	addi	sp,sp,-16
    800035e4:	00113423          	sd	ra,8(sp)
    800035e8:	00813023          	sd	s0,0(sp)
    800035ec:	01010413          	addi	s0,sp,16
		block();
    800035f0:	00000097          	auipc	ra,0x0
    800035f4:	f84080e7          	jalr	-124(ra) # 80003574 <_ZN4KSem5blockEv>
		return -1;
    800035f8:	fff00513          	li	a0,-1
}
    800035fc:	00813083          	ld	ra,8(sp)
    80003600:	00013403          	ld	s0,0(sp)
    80003604:	01010113          	addi	sp,sp,16
    80003608:	00008067          	ret
	if (!working) return -3;
    8000360c:	ffd00513          	li	a0,-3
    80003610:	00008067          	ret

0000000080003614 <_ZN4KSem7unblockEv>:

void KSem::unblock() {
    80003614:	ff010113          	addi	sp,sp,-16
    80003618:	00113423          	sd	ra,8(sp)
    8000361c:	00813023          	sd	s0,0(sp)
    80003620:	01010413          	addi	s0,sp,16
	TCB* tcb = blocked.getFirst();
    80003624:	00850513          	addi	a0,a0,8
    80003628:	ffffe097          	auipc	ra,0xffffe
    8000362c:	c88080e7          	jalr	-888(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
    80003630:	020508a3          	sb	zero,49(a0)
	tcb->setBlocked(false);
	Scheduler::put(tcb);
    80003634:	ffffe097          	auipc	ra,0xffffe
    80003638:	38c080e7          	jalr	908(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
}
    8000363c:	00813083          	ld	ra,8(sp)
    80003640:	00013403          	ld	s0,0(sp)
    80003644:	01010113          	addi	sp,sp,16
    80003648:	00008067          	ret

000000008000364c <_ZN4KSem6signalEv>:
	if (!working) return -3;
    8000364c:	01854783          	lbu	a5,24(a0)
    80003650:	04078463          	beqz	a5,80003698 <_ZN4KSem6signalEv+0x4c>
	if (val++ < 0) {
    80003654:	00052783          	lw	a5,0(a0)
    80003658:	0017871b          	addiw	a4,a5,1
    8000365c:	00e52023          	sw	a4,0(a0)
    80003660:	0007c663          	bltz	a5,8000366c <_ZN4KSem6signalEv+0x20>
	return 0;
    80003664:	00000513          	li	a0,0
}
    80003668:	00008067          	ret
int KSem::signal() {
    8000366c:	ff010113          	addi	sp,sp,-16
    80003670:	00113423          	sd	ra,8(sp)
    80003674:	00813023          	sd	s0,0(sp)
    80003678:	01010413          	addi	s0,sp,16
		unblock();
    8000367c:	00000097          	auipc	ra,0x0
    80003680:	f98080e7          	jalr	-104(ra) # 80003614 <_ZN4KSem7unblockEv>
	return 0;
    80003684:	00000513          	li	a0,0
}
    80003688:	00813083          	ld	ra,8(sp)
    8000368c:	00013403          	ld	s0,0(sp)
    80003690:	01010113          	addi	sp,sp,16
    80003694:	00008067          	ret
	if (!working) return -3;
    80003698:	ffd00513          	li	a0,-3
    8000369c:	00008067          	ret

00000000800036a0 <_ZN4KSem8closeSemEPS_>:

int KSem::closeSem(sem_t handle) {
    800036a0:	fe010113          	addi	sp,sp,-32
    800036a4:	00113c23          	sd	ra,24(sp)
    800036a8:	00813823          	sd	s0,16(sp)
    800036ac:	00913423          	sd	s1,8(sp)
    800036b0:	02010413          	addi	s0,sp,32
    800036b4:	00050493          	mv	s1,a0
	//if (!MemoryAllocator::checkPurpose(handle, MemoryAllocator::SEMAPHORE)) return -2;
	handle->working = false;
    800036b8:	00050c23          	sb	zero,24(a0)
        bool ret = front == nullptr;
    800036bc:	0084b783          	ld	a5,8(s1)
	while (!handle->blocked.isEmpty()) {
    800036c0:	02078063          	beqz	a5,800036e0 <_ZN4KSem8closeSemEPS_+0x40>
		TCB* tcb = handle->blocked.getFirst();
    800036c4:	00848513          	addi	a0,s1,8
    800036c8:	ffffe097          	auipc	ra,0xffffe
    800036cc:	be8080e7          	jalr	-1048(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
    800036d0:	020508a3          	sb	zero,49(a0)
		tcb->setBlocked(false);
		Scheduler::put(tcb);
    800036d4:	ffffe097          	auipc	ra,0xffffe
    800036d8:	2ec080e7          	jalr	748(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
	while (!handle->blocked.isEmpty()) {
    800036dc:	fe1ff06f          	j	800036bc <_ZN4KSem8closeSemEPS_+0x1c>
	}
	return 0;
}
    800036e0:	00000513          	li	a0,0
    800036e4:	01813083          	ld	ra,24(sp)
    800036e8:	01013403          	ld	s0,16(sp)
    800036ec:	00813483          	ld	s1,8(sp)
    800036f0:	02010113          	addi	sp,sp,32
    800036f4:	00008067          	ret

00000000800036f8 <_Z10testMemoryv>:
    return pok;
}

#pragma GCC optimize("O0")

void testMemory() {
    800036f8:	e6010113          	addi	sp,sp,-416
    800036fc:	18113c23          	sd	ra,408(sp)
    80003700:	18813823          	sd	s0,400(sp)
    80003704:	1a010413          	addi	s0,sp,416
    char* pokazivaci[50];
    pokazivaci[0] = nullptr;
    80003708:	e6043023          	sd	zero,-416(s0)
    pokazivaci[0] = upisi(1024 + 768);
    8000370c:	70000513          	li	a0,1792
    80003710:	00000097          	auipc	ra,0x0
    80003714:	1f8080e7          	jalr	504(ra) # 80003908 <_Z5upisim>
    80003718:	00050793          	mv	a5,a0
    8000371c:	e6f43023          	sd	a5,-416(s0)
    if (pokazivaci[0]) {
    80003720:	e6043783          	ld	a5,-416(s0)
    80003724:	02078c63          	beqz	a5,8000375c <_Z10testMemoryv+0x64>
        if (pokazivaci[0][0] == '8') {
    80003728:	e6043783          	ld	a5,-416(s0)
    8000372c:	0007c783          	lbu	a5,0(a5)
    80003730:	00078713          	mv	a4,a5
    80003734:	03800793          	li	a5,56
    80003738:	00f71a63          	bne	a4,a5,8000374c <_Z10testMemoryv+0x54>
            printString("nea");
    8000373c:	00007517          	auipc	a0,0x7
    80003740:	ab450513          	addi	a0,a0,-1356 # 8000a1f0 <CONSOLE_STATUS+0x1e0>
    80003744:	00002097          	auipc	ra,0x2
    80003748:	6b4080e7          	jalr	1716(ra) # 80005df8 <_Z11printStringPKc>
        }
        MemoryAllocator::kfree(pokazivaci[0]);
    8000374c:	e6043783          	ld	a5,-416(s0)
    80003750:	00078513          	mv	a0,a5
    80003754:	00000097          	auipc	ra,0x0
    80003758:	990080e7          	jalr	-1648(ra) # 800030e4 <_ZN15MemoryAllocator5kfreeEPv>
    }


    pokazivaci[0] = upisi(4096);
    8000375c:	00001537          	lui	a0,0x1
    80003760:	00000097          	auipc	ra,0x0
    80003764:	1a8080e7          	jalr	424(ra) # 80003908 <_Z5upisim>
    80003768:	00050793          	mv	a5,a0
    8000376c:	e6f43023          	sd	a5,-416(s0)
    if (pokazivaci[0]) {
    80003770:	e6043783          	ld	a5,-416(s0)
    80003774:	00078a63          	beqz	a5,80003788 <_Z10testMemoryv+0x90>
        MemoryAllocator::kfree(pokazivaci[0]);
    80003778:	e6043783          	ld	a5,-416(s0)
    8000377c:	00078513          	mv	a0,a5
    80003780:	00000097          	auipc	ra,0x0
    80003784:	964080e7          	jalr	-1692(ra) # 800030e4 <_ZN15MemoryAllocator5kfreeEPv>
    }

    pokazivaci[0] = upisi(1024 + 768);
    80003788:	70000513          	li	a0,1792
    8000378c:	00000097          	auipc	ra,0x0
    80003790:	17c080e7          	jalr	380(ra) # 80003908 <_Z5upisim>
    80003794:	00050793          	mv	a5,a0
    80003798:	e6f43023          	sd	a5,-416(s0)
    MemoryAllocator::kfree(pokazivaci[0]);
    8000379c:	e6043783          	ld	a5,-416(s0)
    800037a0:	00078513          	mv	a0,a5
    800037a4:	00000097          	auipc	ra,0x0
    800037a8:	940080e7          	jalr	-1728(ra) # 800030e4 <_ZN15MemoryAllocator5kfreeEPv>

}
    800037ac:	00000013          	nop
    800037b0:	19813083          	ld	ra,408(sp)
    800037b4:	19013403          	ld	s0,400(sp)
    800037b8:	1a010113          	addi	sp,sp,416
    800037bc:	00008067          	ret

00000000800037c0 <_Z5nit1fPv>:

void nit1f(void*) {
    800037c0:	fe010113          	addi	sp,sp,-32
    800037c4:	00113c23          	sd	ra,24(sp)
    800037c8:	00813823          	sd	s0,16(sp)
    800037cc:	02010413          	addi	s0,sp,32
    800037d0:	fea43423          	sd	a0,-24(s0)
//		printString("\nsem_wait za nit 1 vratio ");
//		printInteger(res);
//		printString("\n");
//	}

    printString("\nGotova nit 1\n");
    800037d4:	00007517          	auipc	a0,0x7
    800037d8:	a2450513          	addi	a0,a0,-1500 # 8000a1f8 <CONSOLE_STATUS+0x1e8>
    800037dc:	00002097          	auipc	ra,0x2
    800037e0:	61c080e7          	jalr	1564(ra) # 80005df8 <_Z11printStringPKc>
}
    800037e4:	00000013          	nop
    800037e8:	01813083          	ld	ra,24(sp)
    800037ec:	01013403          	ld	s0,16(sp)
    800037f0:	02010113          	addi	sp,sp,32
    800037f4:	00008067          	ret

00000000800037f8 <_Z5nit2fPv>:

void nit2f(void* arg2) {
    800037f8:	fe010113          	addi	sp,sp,-32
    800037fc:	00113c23          	sd	ra,24(sp)
    80003800:	00813823          	sd	s0,16(sp)
    80003804:	02010413          	addi	s0,sp,32
    80003808:	fea43423          	sd	a0,-24(s0)
//		//sem_close(semA);
//		printString("\nNit 2 ubija semafor\n");
//		delete semA;
//
//	}
    printString("\nGotova nit 2\n");
    8000380c:	00007517          	auipc	a0,0x7
    80003810:	9fc50513          	addi	a0,a0,-1540 # 8000a208 <CONSOLE_STATUS+0x1f8>
    80003814:	00002097          	auipc	ra,0x2
    80003818:	5e4080e7          	jalr	1508(ra) # 80005df8 <_Z11printStringPKc>
}
    8000381c:	00000013          	nop
    80003820:	01813083          	ld	ra,24(sp)
    80003824:	01013403          	ld	s0,16(sp)
    80003828:	02010113          	addi	sp,sp,32
    8000382c:	00008067          	ret

0000000080003830 <_Z5nit3fPv>:


void nit3f(void*) {
    80003830:	fd010113          	addi	sp,sp,-48
    80003834:	02113423          	sd	ra,40(sp)
    80003838:	02813023          	sd	s0,32(sp)
    8000383c:	03010413          	addi	s0,sp,48
    80003840:	fca43c23          	sd	a0,-40(s0)
    char slovo;
    do {
        slovo = getc();
    80003844:	ffffe097          	auipc	ra,0xffffe
    80003848:	d24080e7          	jalr	-732(ra) # 80001568 <_Z4getcv>
    8000384c:	00050793          	mv	a5,a0
    80003850:	fef407a3          	sb	a5,-17(s0)
        putc(slovo);
    80003854:	fef44783          	lbu	a5,-17(s0)
    80003858:	00078513          	mv	a0,a5
    8000385c:	ffffe097          	auipc	ra,0xffffe
    80003860:	d34080e7          	jalr	-716(ra) # 80001590 <_Z4putcc>
        if (slovo == '\r') putc('\n');
    80003864:	fef44783          	lbu	a5,-17(s0)
    80003868:	0ff7f713          	andi	a4,a5,255
    8000386c:	00d00793          	li	a5,13
    80003870:	00f71863          	bne	a4,a5,80003880 <_Z5nit3fPv+0x50>
    80003874:	00a00513          	li	a0,10
    80003878:	ffffe097          	auipc	ra,0xffffe
    8000387c:	d18080e7          	jalr	-744(ra) # 80001590 <_Z4putcc>
    } while (slovo != '0');
    80003880:	fef44783          	lbu	a5,-17(s0)
    80003884:	0ff7f713          	andi	a4,a5,255
    80003888:	03000793          	li	a5,48
    8000388c:	00f70463          	beq	a4,a5,80003894 <_Z5nit3fPv+0x64>
    do {
    80003890:	fb5ff06f          	j	80003844 <_Z5nit3fPv+0x14>

    printString("\nGotova nit3\n");
    80003894:	00007517          	auipc	a0,0x7
    80003898:	98450513          	addi	a0,a0,-1660 # 8000a218 <CONSOLE_STATUS+0x208>
    8000389c:	00002097          	auipc	ra,0x2
    800038a0:	55c080e7          	jalr	1372(ra) # 80005df8 <_Z11printStringPKc>
}
    800038a4:	00000013          	nop
    800038a8:	02813083          	ld	ra,40(sp)
    800038ac:	02013403          	ld	s0,32(sp)
    800038b0:	03010113          	addi	sp,sp,48
    800038b4:	00008067          	ret

00000000800038b8 <_Z8testMainv>:

int testMain() {
    800038b8:	ff010113          	addi	sp,sp,-16
    800038bc:	00113423          	sd	ra,8(sp)
    800038c0:	00813023          	sd	s0,0(sp)
    800038c4:	01010413          	addi	s0,sp,16
//postavi adresu prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    800038c8:	00009797          	auipc	a5,0x9
    800038cc:	1f87b783          	ld	a5,504(a5) # 8000cac0 <_GLOBAL_OFFSET_TABLE_+0x68>
    800038d0:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    MemoryAllocator::initMemoryAllocator();
    800038d4:	00000097          	auipc	ra,0x0
    800038d8:	b50080e7          	jalr	-1200(ra) # 80003424 <_ZN15MemoryAllocator19initMemoryAllocatorEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    800038dc:	ffffe097          	auipc	ra,0xffffe
    800038e0:	d84080e7          	jalr	-636(ra) # 80001660 <_ZN8KConsole12initKConsoleEv>
//	printString("\nGotove user niti\n");
//
//	printString("\nSad cu da izadjem\n");
//	while(KConsole::outputHead!=KConsole::outputTail){}
//	//zabrani prekide
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    800038e4:	00200513          	li	a0,2
    800038e8:	00000097          	auipc	ra,0x0
    800038ec:	07c080e7          	jalr	124(ra) # 80003964 <_ZN5Riscv10mc_sstatusEm>


    return 0;
    800038f0:	00000793          	li	a5,0
    800038f4:	00078513          	mv	a0,a5
    800038f8:	00813083          	ld	ra,8(sp)
    800038fc:	00013403          	ld	s0,0(sp)
    80003900:	01010113          	addi	sp,sp,16
    80003904:	00008067          	ret

0000000080003908 <_Z5upisim>:
char* upisi(size_t alociraj) {
    80003908:	fe010113          	addi	sp,sp,-32
    8000390c:	00113c23          	sd	ra,24(sp)
    80003910:	00813823          	sd	s0,16(sp)
    80003914:	00913423          	sd	s1,8(sp)
    80003918:	02010413          	addi	s0,sp,32
    8000391c:	00050493          	mv	s1,a0
    char* pok = (char*) MemoryAllocator::kmalloc(alociraj);
    80003920:	00300593          	li	a1,3
    80003924:	fffff097          	auipc	ra,0xfffff
    80003928:	518080e7          	jalr	1304(ra) # 80002e3c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
    if (pok) {
    8000392c:	02050263          	beqz	a0,80003950 <_Z5upisim+0x48>
        for (uint64 i = 0; i < alociraj - sizeof(MemoryAllocator::UsedMemSegment); i++) {
    80003930:	00000793          	li	a5,0
    80003934:	0140006f          	j	80003948 <_Z5upisim+0x40>
            pok[i] = '8';
    80003938:	00f50733          	add	a4,a0,a5
    8000393c:	03800693          	li	a3,56
    80003940:	00d70023          	sb	a3,0(a4)
        for (uint64 i = 0; i < alociraj - sizeof(MemoryAllocator::UsedMemSegment); i++) {
    80003944:	00178793          	addi	a5,a5,1
    80003948:	fe048713          	addi	a4,s1,-32
    8000394c:	fee7e6e3          	bltu	a5,a4,80003938 <_Z5upisim+0x30>
}
    80003950:	01813083          	ld	ra,24(sp)
    80003954:	01013403          	ld	s0,16(sp)
    80003958:	00813483          	ld	s1,8(sp)
    8000395c:	02010113          	addi	sp,sp,32
    80003960:	00008067          	ret

0000000080003964 <_ZN5Riscv10mc_sstatusEm>:
inline void Riscv::mc_sstatus(uint64 mask) {
    80003964:	ff010113          	addi	sp,sp,-16
    80003968:	00813423          	sd	s0,8(sp)
    8000396c:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80003970:	10053073          	csrc	sstatus,a0
}
    80003974:	00813403          	ld	s0,8(sp)
    80003978:	01010113          	addi	sp,sp,16
    8000397c:	00008067          	ret

0000000080003980 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80003980:	fe010113          	addi	sp,sp,-32
    80003984:	00113c23          	sd	ra,24(sp)
    80003988:	00813823          	sd	s0,16(sp)
    8000398c:	00913423          	sd	s1,8(sp)
    80003990:	01213023          	sd	s2,0(sp)
    80003994:	02010413          	addi	s0,sp,32
    80003998:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    8000399c:	00000913          	li	s2,0
    800039a0:	00c0006f          	j	800039ac <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    800039a4:	ffffe097          	auipc	ra,0xffffe
    800039a8:	a84080e7          	jalr	-1404(ra) # 80001428 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
    800039ac:	ffffe097          	auipc	ra,0xffffe
    800039b0:	bbc080e7          	jalr	-1092(ra) # 80001568 <_Z4getcv>
    800039b4:	0005059b          	sext.w	a1,a0
    800039b8:	02d00793          	li	a5,45
    800039bc:	02f58a63          	beq	a1,a5,800039f0 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    800039c0:	0084b503          	ld	a0,8(s1)
    800039c4:	00003097          	auipc	ra,0x3
    800039c8:	400080e7          	jalr	1024(ra) # 80006dc4 <_ZN6Buffer3putEi>
        i++;
    800039cc:	0019071b          	addiw	a4,s2,1
    800039d0:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800039d4:	0004a683          	lw	a3,0(s1)
    800039d8:	0026979b          	slliw	a5,a3,0x2
    800039dc:	00d787bb          	addw	a5,a5,a3
    800039e0:	0017979b          	slliw	a5,a5,0x1
    800039e4:	02f767bb          	remw	a5,a4,a5
    800039e8:	fc0792e3          	bnez	a5,800039ac <_ZL16producerKeyboardPv+0x2c>
    800039ec:	fb9ff06f          	j	800039a4 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    800039f0:	00100793          	li	a5,1
    800039f4:	00009717          	auipc	a4,0x9
    800039f8:	22f72623          	sw	a5,556(a4) # 8000cc20 <_ZL9threadEnd>
    data->buffer->put('!');
    800039fc:	02100593          	li	a1,33
    80003a00:	0084b503          	ld	a0,8(s1)
    80003a04:	00003097          	auipc	ra,0x3
    80003a08:	3c0080e7          	jalr	960(ra) # 80006dc4 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80003a0c:	0104b503          	ld	a0,16(s1)
    80003a10:	ffffe097          	auipc	ra,0xffffe
    80003a14:	b28080e7          	jalr	-1240(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    80003a18:	01813083          	ld	ra,24(sp)
    80003a1c:	01013403          	ld	s0,16(sp)
    80003a20:	00813483          	ld	s1,8(sp)
    80003a24:	00013903          	ld	s2,0(sp)
    80003a28:	02010113          	addi	sp,sp,32
    80003a2c:	00008067          	ret

0000000080003a30 <_ZL8producerPv>:

static void producer(void *arg) {
    80003a30:	fe010113          	addi	sp,sp,-32
    80003a34:	00113c23          	sd	ra,24(sp)
    80003a38:	00813823          	sd	s0,16(sp)
    80003a3c:	00913423          	sd	s1,8(sp)
    80003a40:	01213023          	sd	s2,0(sp)
    80003a44:	02010413          	addi	s0,sp,32
    80003a48:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003a4c:	00000913          	li	s2,0
    80003a50:	00c0006f          	j	80003a5c <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003a54:	ffffe097          	auipc	ra,0xffffe
    80003a58:	9d4080e7          	jalr	-1580(ra) # 80001428 <_Z15thread_dispatchv>
    while (!threadEnd) {
    80003a5c:	00009797          	auipc	a5,0x9
    80003a60:	1c47a783          	lw	a5,452(a5) # 8000cc20 <_ZL9threadEnd>
    80003a64:	02079e63          	bnez	a5,80003aa0 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80003a68:	0004a583          	lw	a1,0(s1)
    80003a6c:	0305859b          	addiw	a1,a1,48
    80003a70:	0084b503          	ld	a0,8(s1)
    80003a74:	00003097          	auipc	ra,0x3
    80003a78:	350080e7          	jalr	848(ra) # 80006dc4 <_ZN6Buffer3putEi>
        i++;
    80003a7c:	0019071b          	addiw	a4,s2,1
    80003a80:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003a84:	0004a683          	lw	a3,0(s1)
    80003a88:	0026979b          	slliw	a5,a3,0x2
    80003a8c:	00d787bb          	addw	a5,a5,a3
    80003a90:	0017979b          	slliw	a5,a5,0x1
    80003a94:	02f767bb          	remw	a5,a4,a5
    80003a98:	fc0792e3          	bnez	a5,80003a5c <_ZL8producerPv+0x2c>
    80003a9c:	fb9ff06f          	j	80003a54 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80003aa0:	0104b503          	ld	a0,16(s1)
    80003aa4:	ffffe097          	auipc	ra,0xffffe
    80003aa8:	a94080e7          	jalr	-1388(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    80003aac:	01813083          	ld	ra,24(sp)
    80003ab0:	01013403          	ld	s0,16(sp)
    80003ab4:	00813483          	ld	s1,8(sp)
    80003ab8:	00013903          	ld	s2,0(sp)
    80003abc:	02010113          	addi	sp,sp,32
    80003ac0:	00008067          	ret

0000000080003ac4 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80003ac4:	fd010113          	addi	sp,sp,-48
    80003ac8:	02113423          	sd	ra,40(sp)
    80003acc:	02813023          	sd	s0,32(sp)
    80003ad0:	00913c23          	sd	s1,24(sp)
    80003ad4:	01213823          	sd	s2,16(sp)
    80003ad8:	01313423          	sd	s3,8(sp)
    80003adc:	03010413          	addi	s0,sp,48
    80003ae0:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003ae4:	00000993          	li	s3,0
    80003ae8:	01c0006f          	j	80003b04 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80003aec:	ffffe097          	auipc	ra,0xffffe
    80003af0:	93c080e7          	jalr	-1732(ra) # 80001428 <_Z15thread_dispatchv>
    80003af4:	0500006f          	j	80003b44 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80003af8:	00a00513          	li	a0,10
    80003afc:	ffffe097          	auipc	ra,0xffffe
    80003b00:	a94080e7          	jalr	-1388(ra) # 80001590 <_Z4putcc>
    while (!threadEnd) {
    80003b04:	00009797          	auipc	a5,0x9
    80003b08:	11c7a783          	lw	a5,284(a5) # 8000cc20 <_ZL9threadEnd>
    80003b0c:	06079063          	bnez	a5,80003b6c <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    80003b10:	00893503          	ld	a0,8(s2)
    80003b14:	00003097          	auipc	ra,0x3
    80003b18:	340080e7          	jalr	832(ra) # 80006e54 <_ZN6Buffer3getEv>
        i++;
    80003b1c:	0019849b          	addiw	s1,s3,1
    80003b20:	0004899b          	sext.w	s3,s1
        putc(key);
    80003b24:	0ff57513          	andi	a0,a0,255
    80003b28:	ffffe097          	auipc	ra,0xffffe
    80003b2c:	a68080e7          	jalr	-1432(ra) # 80001590 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80003b30:	00092703          	lw	a4,0(s2)
    80003b34:	0027179b          	slliw	a5,a4,0x2
    80003b38:	00e787bb          	addw	a5,a5,a4
    80003b3c:	02f4e7bb          	remw	a5,s1,a5
    80003b40:	fa0786e3          	beqz	a5,80003aec <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80003b44:	05000793          	li	a5,80
    80003b48:	02f4e4bb          	remw	s1,s1,a5
    80003b4c:	fa049ce3          	bnez	s1,80003b04 <_ZL8consumerPv+0x40>
    80003b50:	fa9ff06f          	j	80003af8 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80003b54:	00893503          	ld	a0,8(s2)
    80003b58:	00003097          	auipc	ra,0x3
    80003b5c:	2fc080e7          	jalr	764(ra) # 80006e54 <_ZN6Buffer3getEv>
        putc(key);
    80003b60:	0ff57513          	andi	a0,a0,255
    80003b64:	ffffe097          	auipc	ra,0xffffe
    80003b68:	a2c080e7          	jalr	-1492(ra) # 80001590 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80003b6c:	00893503          	ld	a0,8(s2)
    80003b70:	00003097          	auipc	ra,0x3
    80003b74:	370080e7          	jalr	880(ra) # 80006ee0 <_ZN6Buffer6getCntEv>
    80003b78:	fca04ee3          	bgtz	a0,80003b54 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80003b7c:	01093503          	ld	a0,16(s2)
    80003b80:	ffffe097          	auipc	ra,0xffffe
    80003b84:	9b8080e7          	jalr	-1608(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    80003b88:	02813083          	ld	ra,40(sp)
    80003b8c:	02013403          	ld	s0,32(sp)
    80003b90:	01813483          	ld	s1,24(sp)
    80003b94:	01013903          	ld	s2,16(sp)
    80003b98:	00813983          	ld	s3,8(sp)
    80003b9c:	03010113          	addi	sp,sp,48
    80003ba0:	00008067          	ret

0000000080003ba4 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80003ba4:	f9010113          	addi	sp,sp,-112
    80003ba8:	06113423          	sd	ra,104(sp)
    80003bac:	06813023          	sd	s0,96(sp)
    80003bb0:	04913c23          	sd	s1,88(sp)
    80003bb4:	05213823          	sd	s2,80(sp)
    80003bb8:	05313423          	sd	s3,72(sp)
    80003bbc:	05413023          	sd	s4,64(sp)
    80003bc0:	03513c23          	sd	s5,56(sp)
    80003bc4:	03613823          	sd	s6,48(sp)
    80003bc8:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80003bcc:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80003bd0:	00006517          	auipc	a0,0x6
    80003bd4:	65850513          	addi	a0,a0,1624 # 8000a228 <CONSOLE_STATUS+0x218>
    80003bd8:	00002097          	auipc	ra,0x2
    80003bdc:	220080e7          	jalr	544(ra) # 80005df8 <_Z11printStringPKc>
    getString(input, 30);
    80003be0:	01e00593          	li	a1,30
    80003be4:	fa040493          	addi	s1,s0,-96
    80003be8:	00048513          	mv	a0,s1
    80003bec:	00002097          	auipc	ra,0x2
    80003bf0:	294080e7          	jalr	660(ra) # 80005e80 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80003bf4:	00048513          	mv	a0,s1
    80003bf8:	00002097          	auipc	ra,0x2
    80003bfc:	360080e7          	jalr	864(ra) # 80005f58 <_Z11stringToIntPKc>
    80003c00:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80003c04:	00006517          	auipc	a0,0x6
    80003c08:	64450513          	addi	a0,a0,1604 # 8000a248 <CONSOLE_STATUS+0x238>
    80003c0c:	00002097          	auipc	ra,0x2
    80003c10:	1ec080e7          	jalr	492(ra) # 80005df8 <_Z11printStringPKc>
    getString(input, 30);
    80003c14:	01e00593          	li	a1,30
    80003c18:	00048513          	mv	a0,s1
    80003c1c:	00002097          	auipc	ra,0x2
    80003c20:	264080e7          	jalr	612(ra) # 80005e80 <_Z9getStringPci>
    n = stringToInt(input);
    80003c24:	00048513          	mv	a0,s1
    80003c28:	00002097          	auipc	ra,0x2
    80003c2c:	330080e7          	jalr	816(ra) # 80005f58 <_Z11stringToIntPKc>
    80003c30:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80003c34:	00006517          	auipc	a0,0x6
    80003c38:	63450513          	addi	a0,a0,1588 # 8000a268 <CONSOLE_STATUS+0x258>
    80003c3c:	00002097          	auipc	ra,0x2
    80003c40:	1bc080e7          	jalr	444(ra) # 80005df8 <_Z11printStringPKc>
	printInt(threadNum);
    80003c44:	00000613          	li	a2,0
    80003c48:	00a00593          	li	a1,10
    80003c4c:	00090513          	mv	a0,s2
    80003c50:	00002097          	auipc	ra,0x2
    80003c54:	358080e7          	jalr	856(ra) # 80005fa8 <_Z8printIntiii>
    printString(" i velicina bafera ");
    80003c58:	00006517          	auipc	a0,0x6
    80003c5c:	62850513          	addi	a0,a0,1576 # 8000a280 <CONSOLE_STATUS+0x270>
    80003c60:	00002097          	auipc	ra,0x2
    80003c64:	198080e7          	jalr	408(ra) # 80005df8 <_Z11printStringPKc>
	printInt(n);
    80003c68:	00000613          	li	a2,0
    80003c6c:	00a00593          	li	a1,10
    80003c70:	00048513          	mv	a0,s1
    80003c74:	00002097          	auipc	ra,0x2
    80003c78:	334080e7          	jalr	820(ra) # 80005fa8 <_Z8printIntiii>
    printString(".\n");
    80003c7c:	00006517          	auipc	a0,0x6
    80003c80:	61c50513          	addi	a0,a0,1564 # 8000a298 <CONSOLE_STATUS+0x288>
    80003c84:	00002097          	auipc	ra,0x2
    80003c88:	174080e7          	jalr	372(ra) # 80005df8 <_Z11printStringPKc>
    if(threadNum > n) {
    80003c8c:	0324c463          	blt	s1,s2,80003cb4 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80003c90:	03205c63          	blez	s2,80003cc8 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80003c94:	03800513          	li	a0,56
    80003c98:	fffff097          	auipc	ra,0xfffff
    80003c9c:	924080e7          	jalr	-1756(ra) # 800025bc <_Znwm>
    80003ca0:	00050a13          	mv	s4,a0
    80003ca4:	00048593          	mv	a1,s1
    80003ca8:	00003097          	auipc	ra,0x3
    80003cac:	080080e7          	jalr	128(ra) # 80006d28 <_ZN6BufferC1Ei>
    80003cb0:	0300006f          	j	80003ce0 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80003cb4:	00006517          	auipc	a0,0x6
    80003cb8:	5ec50513          	addi	a0,a0,1516 # 8000a2a0 <CONSOLE_STATUS+0x290>
    80003cbc:	00002097          	auipc	ra,0x2
    80003cc0:	13c080e7          	jalr	316(ra) # 80005df8 <_Z11printStringPKc>
        return;
    80003cc4:	0140006f          	j	80003cd8 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80003cc8:	00006517          	auipc	a0,0x6
    80003ccc:	61850513          	addi	a0,a0,1560 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80003cd0:	00002097          	auipc	ra,0x2
    80003cd4:	128080e7          	jalr	296(ra) # 80005df8 <_Z11printStringPKc>
        return;
    80003cd8:	000b0113          	mv	sp,s6
    80003cdc:	1500006f          	j	80003e2c <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80003ce0:	00000593          	li	a1,0
    80003ce4:	00009517          	auipc	a0,0x9
    80003ce8:	f4450513          	addi	a0,a0,-188 # 8000cc28 <_ZL10waitForAll>
    80003cec:	ffffd097          	auipc	ra,0xffffd
    80003cf0:	7b4080e7          	jalr	1972(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    thread_t threads[threadNum];
    80003cf4:	00391793          	slli	a5,s2,0x3
    80003cf8:	00f78793          	addi	a5,a5,15
    80003cfc:	ff07f793          	andi	a5,a5,-16
    80003d00:	40f10133          	sub	sp,sp,a5
    80003d04:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80003d08:	0019071b          	addiw	a4,s2,1
    80003d0c:	00171793          	slli	a5,a4,0x1
    80003d10:	00e787b3          	add	a5,a5,a4
    80003d14:	00379793          	slli	a5,a5,0x3
    80003d18:	00f78793          	addi	a5,a5,15
    80003d1c:	ff07f793          	andi	a5,a5,-16
    80003d20:	40f10133          	sub	sp,sp,a5
    80003d24:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80003d28:	00191613          	slli	a2,s2,0x1
    80003d2c:	012607b3          	add	a5,a2,s2
    80003d30:	00379793          	slli	a5,a5,0x3
    80003d34:	00f987b3          	add	a5,s3,a5
    80003d38:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80003d3c:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80003d40:	00009717          	auipc	a4,0x9
    80003d44:	ee873703          	ld	a4,-280(a4) # 8000cc28 <_ZL10waitForAll>
    80003d48:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80003d4c:	00078613          	mv	a2,a5
    80003d50:	00000597          	auipc	a1,0x0
    80003d54:	d7458593          	addi	a1,a1,-652 # 80003ac4 <_ZL8consumerPv>
    80003d58:	f9840513          	addi	a0,s0,-104
    80003d5c:	ffffd097          	auipc	ra,0xffffd
    80003d60:	624080e7          	jalr	1572(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003d64:	00000493          	li	s1,0
    80003d68:	0280006f          	j	80003d90 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80003d6c:	00000597          	auipc	a1,0x0
    80003d70:	c1458593          	addi	a1,a1,-1004 # 80003980 <_ZL16producerKeyboardPv>
                      data + i);
    80003d74:	00179613          	slli	a2,a5,0x1
    80003d78:	00f60633          	add	a2,a2,a5
    80003d7c:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80003d80:	00c98633          	add	a2,s3,a2
    80003d84:	ffffd097          	auipc	ra,0xffffd
    80003d88:	5fc080e7          	jalr	1532(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003d8c:	0014849b          	addiw	s1,s1,1
    80003d90:	0524d263          	bge	s1,s2,80003dd4 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80003d94:	00149793          	slli	a5,s1,0x1
    80003d98:	009787b3          	add	a5,a5,s1
    80003d9c:	00379793          	slli	a5,a5,0x3
    80003da0:	00f987b3          	add	a5,s3,a5
    80003da4:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80003da8:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80003dac:	00009717          	auipc	a4,0x9
    80003db0:	e7c73703          	ld	a4,-388(a4) # 8000cc28 <_ZL10waitForAll>
    80003db4:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80003db8:	00048793          	mv	a5,s1
    80003dbc:	00349513          	slli	a0,s1,0x3
    80003dc0:	00aa8533          	add	a0,s5,a0
    80003dc4:	fa9054e3          	blez	s1,80003d6c <_Z22producerConsumer_C_APIv+0x1c8>
    80003dc8:	00000597          	auipc	a1,0x0
    80003dcc:	c6858593          	addi	a1,a1,-920 # 80003a30 <_ZL8producerPv>
    80003dd0:	fa5ff06f          	j	80003d74 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80003dd4:	ffffd097          	auipc	ra,0xffffd
    80003dd8:	654080e7          	jalr	1620(ra) # 80001428 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80003ddc:	00000493          	li	s1,0
    80003de0:	00994e63          	blt	s2,s1,80003dfc <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80003de4:	00009517          	auipc	a0,0x9
    80003de8:	e4453503          	ld	a0,-444(a0) # 8000cc28 <_ZL10waitForAll>
    80003dec:	ffffd097          	auipc	ra,0xffffd
    80003df0:	71c080e7          	jalr	1820(ra) # 80001508 <_Z8sem_waitP4KSem>
    for (int i = 0; i <= threadNum; i++) {
    80003df4:	0014849b          	addiw	s1,s1,1
    80003df8:	fe9ff06f          	j	80003de0 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80003dfc:	00009517          	auipc	a0,0x9
    80003e00:	e2c53503          	ld	a0,-468(a0) # 8000cc28 <_ZL10waitForAll>
    80003e04:	ffffd097          	auipc	ra,0xffffd
    80003e08:	6d4080e7          	jalr	1748(ra) # 800014d8 <_Z9sem_closeP4KSem>
    delete buffer;
    80003e0c:	000a0e63          	beqz	s4,80003e28 <_Z22producerConsumer_C_APIv+0x284>
    80003e10:	000a0513          	mv	a0,s4
    80003e14:	00003097          	auipc	ra,0x3
    80003e18:	154080e7          	jalr	340(ra) # 80006f68 <_ZN6BufferD1Ev>
    80003e1c:	000a0513          	mv	a0,s4
    80003e20:	ffffe097          	auipc	ra,0xffffe
    80003e24:	7ec080e7          	jalr	2028(ra) # 8000260c <_ZdlPv>
    80003e28:	000b0113          	mv	sp,s6

}
    80003e2c:	f9040113          	addi	sp,s0,-112
    80003e30:	06813083          	ld	ra,104(sp)
    80003e34:	06013403          	ld	s0,96(sp)
    80003e38:	05813483          	ld	s1,88(sp)
    80003e3c:	05013903          	ld	s2,80(sp)
    80003e40:	04813983          	ld	s3,72(sp)
    80003e44:	04013a03          	ld	s4,64(sp)
    80003e48:	03813a83          	ld	s5,56(sp)
    80003e4c:	03013b03          	ld	s6,48(sp)
    80003e50:	07010113          	addi	sp,sp,112
    80003e54:	00008067          	ret
    80003e58:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80003e5c:	000a0513          	mv	a0,s4
    80003e60:	ffffe097          	auipc	ra,0xffffe
    80003e64:	7ac080e7          	jalr	1964(ra) # 8000260c <_ZdlPv>
    80003e68:	00048513          	mv	a0,s1
    80003e6c:	0000a097          	auipc	ra,0xa
    80003e70:	ecc080e7          	jalr	-308(ra) # 8000dd38 <_Unwind_Resume>

0000000080003e74 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003e74:	fe010113          	addi	sp,sp,-32
    80003e78:	00113c23          	sd	ra,24(sp)
    80003e7c:	00813823          	sd	s0,16(sp)
    80003e80:	00913423          	sd	s1,8(sp)
    80003e84:	01213023          	sd	s2,0(sp)
    80003e88:	02010413          	addi	s0,sp,32
    80003e8c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003e90:	00100793          	li	a5,1
    80003e94:	02a7f863          	bgeu	a5,a0,80003ec4 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80003e98:	00a00793          	li	a5,10
    80003e9c:	02f577b3          	remu	a5,a0,a5
    80003ea0:	02078e63          	beqz	a5,80003edc <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80003ea4:	fff48513          	addi	a0,s1,-1
    80003ea8:	00000097          	auipc	ra,0x0
    80003eac:	fcc080e7          	jalr	-52(ra) # 80003e74 <_ZL9fibonaccim>
    80003eb0:	00050913          	mv	s2,a0
    80003eb4:	ffe48513          	addi	a0,s1,-2
    80003eb8:	00000097          	auipc	ra,0x0
    80003ebc:	fbc080e7          	jalr	-68(ra) # 80003e74 <_ZL9fibonaccim>
    80003ec0:	00a90533          	add	a0,s2,a0
}
    80003ec4:	01813083          	ld	ra,24(sp)
    80003ec8:	01013403          	ld	s0,16(sp)
    80003ecc:	00813483          	ld	s1,8(sp)
    80003ed0:	00013903          	ld	s2,0(sp)
    80003ed4:	02010113          	addi	sp,sp,32
    80003ed8:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80003edc:	ffffd097          	auipc	ra,0xffffd
    80003ee0:	54c080e7          	jalr	1356(ra) # 80001428 <_Z15thread_dispatchv>
    80003ee4:	fc1ff06f          	j	80003ea4 <_ZL9fibonaccim+0x30>

0000000080003ee8 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80003ee8:	fe010113          	addi	sp,sp,-32
    80003eec:	00113c23          	sd	ra,24(sp)
    80003ef0:	00813823          	sd	s0,16(sp)
    80003ef4:	00913423          	sd	s1,8(sp)
    80003ef8:	01213023          	sd	s2,0(sp)
    80003efc:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003f00:	00000913          	li	s2,0
    80003f04:	0380006f          	j	80003f3c <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003f08:	ffffd097          	auipc	ra,0xffffd
    80003f0c:	520080e7          	jalr	1312(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003f10:	00148493          	addi	s1,s1,1
    80003f14:	000027b7          	lui	a5,0x2
    80003f18:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003f1c:	0097ee63          	bltu	a5,s1,80003f38 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003f20:	00000713          	li	a4,0
    80003f24:	000077b7          	lui	a5,0x7
    80003f28:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003f2c:	fce7eee3          	bltu	a5,a4,80003f08 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80003f30:	00170713          	addi	a4,a4,1
    80003f34:	ff1ff06f          	j	80003f24 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003f38:	00190913          	addi	s2,s2,1
    80003f3c:	00900793          	li	a5,9
    80003f40:	0527e063          	bltu	a5,s2,80003f80 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003f44:	00006517          	auipc	a0,0x6
    80003f48:	3cc50513          	addi	a0,a0,972 # 8000a310 <CONSOLE_STATUS+0x300>
    80003f4c:	00002097          	auipc	ra,0x2
    80003f50:	eac080e7          	jalr	-340(ra) # 80005df8 <_Z11printStringPKc>
    80003f54:	00000613          	li	a2,0
    80003f58:	00a00593          	li	a1,10
    80003f5c:	0009051b          	sext.w	a0,s2
    80003f60:	00002097          	auipc	ra,0x2
    80003f64:	048080e7          	jalr	72(ra) # 80005fa8 <_Z8printIntiii>
    80003f68:	00006517          	auipc	a0,0x6
    80003f6c:	60850513          	addi	a0,a0,1544 # 8000a570 <CONSOLE_STATUS+0x560>
    80003f70:	00002097          	auipc	ra,0x2
    80003f74:	e88080e7          	jalr	-376(ra) # 80005df8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003f78:	00000493          	li	s1,0
    80003f7c:	f99ff06f          	j	80003f14 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003f80:	00006517          	auipc	a0,0x6
    80003f84:	39850513          	addi	a0,a0,920 # 8000a318 <CONSOLE_STATUS+0x308>
    80003f88:	00002097          	auipc	ra,0x2
    80003f8c:	e70080e7          	jalr	-400(ra) # 80005df8 <_Z11printStringPKc>
    finishedA = true;
    80003f90:	00100793          	li	a5,1
    80003f94:	00009717          	auipc	a4,0x9
    80003f98:	c8f70e23          	sb	a5,-868(a4) # 8000cc30 <_ZL9finishedA>
}
    80003f9c:	01813083          	ld	ra,24(sp)
    80003fa0:	01013403          	ld	s0,16(sp)
    80003fa4:	00813483          	ld	s1,8(sp)
    80003fa8:	00013903          	ld	s2,0(sp)
    80003fac:	02010113          	addi	sp,sp,32
    80003fb0:	00008067          	ret

0000000080003fb4 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80003fb4:	fe010113          	addi	sp,sp,-32
    80003fb8:	00113c23          	sd	ra,24(sp)
    80003fbc:	00813823          	sd	s0,16(sp)
    80003fc0:	00913423          	sd	s1,8(sp)
    80003fc4:	01213023          	sd	s2,0(sp)
    80003fc8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003fcc:	00000913          	li	s2,0
    80003fd0:	0380006f          	j	80004008 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003fd4:	ffffd097          	auipc	ra,0xffffd
    80003fd8:	454080e7          	jalr	1108(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003fdc:	00148493          	addi	s1,s1,1
    80003fe0:	000027b7          	lui	a5,0x2
    80003fe4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003fe8:	0097ee63          	bltu	a5,s1,80004004 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003fec:	00000713          	li	a4,0
    80003ff0:	000077b7          	lui	a5,0x7
    80003ff4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003ff8:	fce7eee3          	bltu	a5,a4,80003fd4 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80003ffc:	00170713          	addi	a4,a4,1
    80004000:	ff1ff06f          	j	80003ff0 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80004004:	00190913          	addi	s2,s2,1
    80004008:	00f00793          	li	a5,15
    8000400c:	0527e063          	bltu	a5,s2,8000404c <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80004010:	00006517          	auipc	a0,0x6
    80004014:	31850513          	addi	a0,a0,792 # 8000a328 <CONSOLE_STATUS+0x318>
    80004018:	00002097          	auipc	ra,0x2
    8000401c:	de0080e7          	jalr	-544(ra) # 80005df8 <_Z11printStringPKc>
    80004020:	00000613          	li	a2,0
    80004024:	00a00593          	li	a1,10
    80004028:	0009051b          	sext.w	a0,s2
    8000402c:	00002097          	auipc	ra,0x2
    80004030:	f7c080e7          	jalr	-132(ra) # 80005fa8 <_Z8printIntiii>
    80004034:	00006517          	auipc	a0,0x6
    80004038:	53c50513          	addi	a0,a0,1340 # 8000a570 <CONSOLE_STATUS+0x560>
    8000403c:	00002097          	auipc	ra,0x2
    80004040:	dbc080e7          	jalr	-580(ra) # 80005df8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004044:	00000493          	li	s1,0
    80004048:	f99ff06f          	j	80003fe0 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    8000404c:	00006517          	auipc	a0,0x6
    80004050:	2e450513          	addi	a0,a0,740 # 8000a330 <CONSOLE_STATUS+0x320>
    80004054:	00002097          	auipc	ra,0x2
    80004058:	da4080e7          	jalr	-604(ra) # 80005df8 <_Z11printStringPKc>
    finishedB = true;
    8000405c:	00100793          	li	a5,1
    80004060:	00009717          	auipc	a4,0x9
    80004064:	bcf708a3          	sb	a5,-1071(a4) # 8000cc31 <_ZL9finishedB>
    thread_dispatch();
    80004068:	ffffd097          	auipc	ra,0xffffd
    8000406c:	3c0080e7          	jalr	960(ra) # 80001428 <_Z15thread_dispatchv>
}
    80004070:	01813083          	ld	ra,24(sp)
    80004074:	01013403          	ld	s0,16(sp)
    80004078:	00813483          	ld	s1,8(sp)
    8000407c:	00013903          	ld	s2,0(sp)
    80004080:	02010113          	addi	sp,sp,32
    80004084:	00008067          	ret

0000000080004088 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80004088:	fe010113          	addi	sp,sp,-32
    8000408c:	00113c23          	sd	ra,24(sp)
    80004090:	00813823          	sd	s0,16(sp)
    80004094:	00913423          	sd	s1,8(sp)
    80004098:	01213023          	sd	s2,0(sp)
    8000409c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800040a0:	00000493          	li	s1,0
    800040a4:	0400006f          	j	800040e4 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    800040a8:	00006517          	auipc	a0,0x6
    800040ac:	29850513          	addi	a0,a0,664 # 8000a340 <CONSOLE_STATUS+0x330>
    800040b0:	00002097          	auipc	ra,0x2
    800040b4:	d48080e7          	jalr	-696(ra) # 80005df8 <_Z11printStringPKc>
    800040b8:	00000613          	li	a2,0
    800040bc:	00a00593          	li	a1,10
    800040c0:	00048513          	mv	a0,s1
    800040c4:	00002097          	auipc	ra,0x2
    800040c8:	ee4080e7          	jalr	-284(ra) # 80005fa8 <_Z8printIntiii>
    800040cc:	00006517          	auipc	a0,0x6
    800040d0:	4a450513          	addi	a0,a0,1188 # 8000a570 <CONSOLE_STATUS+0x560>
    800040d4:	00002097          	auipc	ra,0x2
    800040d8:	d24080e7          	jalr	-732(ra) # 80005df8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800040dc:	0014849b          	addiw	s1,s1,1
    800040e0:	0ff4f493          	andi	s1,s1,255
    800040e4:	00200793          	li	a5,2
    800040e8:	fc97f0e3          	bgeu	a5,s1,800040a8 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    800040ec:	00006517          	auipc	a0,0x6
    800040f0:	25c50513          	addi	a0,a0,604 # 8000a348 <CONSOLE_STATUS+0x338>
    800040f4:	00002097          	auipc	ra,0x2
    800040f8:	d04080e7          	jalr	-764(ra) # 80005df8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800040fc:	00700313          	li	t1,7
    thread_dispatch();
    80004100:	ffffd097          	auipc	ra,0xffffd
    80004104:	328080e7          	jalr	808(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004108:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    8000410c:	00006517          	auipc	a0,0x6
    80004110:	24c50513          	addi	a0,a0,588 # 8000a358 <CONSOLE_STATUS+0x348>
    80004114:	00002097          	auipc	ra,0x2
    80004118:	ce4080e7          	jalr	-796(ra) # 80005df8 <_Z11printStringPKc>
    8000411c:	00000613          	li	a2,0
    80004120:	00a00593          	li	a1,10
    80004124:	0009051b          	sext.w	a0,s2
    80004128:	00002097          	auipc	ra,0x2
    8000412c:	e80080e7          	jalr	-384(ra) # 80005fa8 <_Z8printIntiii>
    80004130:	00006517          	auipc	a0,0x6
    80004134:	44050513          	addi	a0,a0,1088 # 8000a570 <CONSOLE_STATUS+0x560>
    80004138:	00002097          	auipc	ra,0x2
    8000413c:	cc0080e7          	jalr	-832(ra) # 80005df8 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80004140:	00c00513          	li	a0,12
    80004144:	00000097          	auipc	ra,0x0
    80004148:	d30080e7          	jalr	-720(ra) # 80003e74 <_ZL9fibonaccim>
    8000414c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80004150:	00006517          	auipc	a0,0x6
    80004154:	21050513          	addi	a0,a0,528 # 8000a360 <CONSOLE_STATUS+0x350>
    80004158:	00002097          	auipc	ra,0x2
    8000415c:	ca0080e7          	jalr	-864(ra) # 80005df8 <_Z11printStringPKc>
    80004160:	00000613          	li	a2,0
    80004164:	00a00593          	li	a1,10
    80004168:	0009051b          	sext.w	a0,s2
    8000416c:	00002097          	auipc	ra,0x2
    80004170:	e3c080e7          	jalr	-452(ra) # 80005fa8 <_Z8printIntiii>
    80004174:	00006517          	auipc	a0,0x6
    80004178:	3fc50513          	addi	a0,a0,1020 # 8000a570 <CONSOLE_STATUS+0x560>
    8000417c:	00002097          	auipc	ra,0x2
    80004180:	c7c080e7          	jalr	-900(ra) # 80005df8 <_Z11printStringPKc>
    80004184:	0400006f          	j	800041c4 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80004188:	00006517          	auipc	a0,0x6
    8000418c:	1b850513          	addi	a0,a0,440 # 8000a340 <CONSOLE_STATUS+0x330>
    80004190:	00002097          	auipc	ra,0x2
    80004194:	c68080e7          	jalr	-920(ra) # 80005df8 <_Z11printStringPKc>
    80004198:	00000613          	li	a2,0
    8000419c:	00a00593          	li	a1,10
    800041a0:	00048513          	mv	a0,s1
    800041a4:	00002097          	auipc	ra,0x2
    800041a8:	e04080e7          	jalr	-508(ra) # 80005fa8 <_Z8printIntiii>
    800041ac:	00006517          	auipc	a0,0x6
    800041b0:	3c450513          	addi	a0,a0,964 # 8000a570 <CONSOLE_STATUS+0x560>
    800041b4:	00002097          	auipc	ra,0x2
    800041b8:	c44080e7          	jalr	-956(ra) # 80005df8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800041bc:	0014849b          	addiw	s1,s1,1
    800041c0:	0ff4f493          	andi	s1,s1,255
    800041c4:	00500793          	li	a5,5
    800041c8:	fc97f0e3          	bgeu	a5,s1,80004188 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("C finished!\n");
    800041cc:	00006517          	auipc	a0,0x6
    800041d0:	1a450513          	addi	a0,a0,420 # 8000a370 <CONSOLE_STATUS+0x360>
    800041d4:	00002097          	auipc	ra,0x2
    800041d8:	c24080e7          	jalr	-988(ra) # 80005df8 <_Z11printStringPKc>
    finishedC = true;
    800041dc:	00100793          	li	a5,1
    800041e0:	00009717          	auipc	a4,0x9
    800041e4:	a4f70923          	sb	a5,-1454(a4) # 8000cc32 <_ZL9finishedC>
    thread_dispatch();
    800041e8:	ffffd097          	auipc	ra,0xffffd
    800041ec:	240080e7          	jalr	576(ra) # 80001428 <_Z15thread_dispatchv>
}
    800041f0:	01813083          	ld	ra,24(sp)
    800041f4:	01013403          	ld	s0,16(sp)
    800041f8:	00813483          	ld	s1,8(sp)
    800041fc:	00013903          	ld	s2,0(sp)
    80004200:	02010113          	addi	sp,sp,32
    80004204:	00008067          	ret

0000000080004208 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80004208:	fe010113          	addi	sp,sp,-32
    8000420c:	00113c23          	sd	ra,24(sp)
    80004210:	00813823          	sd	s0,16(sp)
    80004214:	00913423          	sd	s1,8(sp)
    80004218:	01213023          	sd	s2,0(sp)
    8000421c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004220:	00a00493          	li	s1,10
    80004224:	0400006f          	j	80004264 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004228:	00006517          	auipc	a0,0x6
    8000422c:	15850513          	addi	a0,a0,344 # 8000a380 <CONSOLE_STATUS+0x370>
    80004230:	00002097          	auipc	ra,0x2
    80004234:	bc8080e7          	jalr	-1080(ra) # 80005df8 <_Z11printStringPKc>
    80004238:	00000613          	li	a2,0
    8000423c:	00a00593          	li	a1,10
    80004240:	00048513          	mv	a0,s1
    80004244:	00002097          	auipc	ra,0x2
    80004248:	d64080e7          	jalr	-668(ra) # 80005fa8 <_Z8printIntiii>
    8000424c:	00006517          	auipc	a0,0x6
    80004250:	32450513          	addi	a0,a0,804 # 8000a570 <CONSOLE_STATUS+0x560>
    80004254:	00002097          	auipc	ra,0x2
    80004258:	ba4080e7          	jalr	-1116(ra) # 80005df8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    8000425c:	0014849b          	addiw	s1,s1,1
    80004260:	0ff4f493          	andi	s1,s1,255
    80004264:	00c00793          	li	a5,12
    80004268:	fc97f0e3          	bgeu	a5,s1,80004228 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    8000426c:	00006517          	auipc	a0,0x6
    80004270:	11c50513          	addi	a0,a0,284 # 8000a388 <CONSOLE_STATUS+0x378>
    80004274:	00002097          	auipc	ra,0x2
    80004278:	b84080e7          	jalr	-1148(ra) # 80005df8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    8000427c:	00500313          	li	t1,5
    thread_dispatch();
    80004280:	ffffd097          	auipc	ra,0xffffd
    80004284:	1a8080e7          	jalr	424(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004288:	01000513          	li	a0,16
    8000428c:	00000097          	auipc	ra,0x0
    80004290:	be8080e7          	jalr	-1048(ra) # 80003e74 <_ZL9fibonaccim>
    80004294:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004298:	00006517          	auipc	a0,0x6
    8000429c:	10050513          	addi	a0,a0,256 # 8000a398 <CONSOLE_STATUS+0x388>
    800042a0:	00002097          	auipc	ra,0x2
    800042a4:	b58080e7          	jalr	-1192(ra) # 80005df8 <_Z11printStringPKc>
    800042a8:	00000613          	li	a2,0
    800042ac:	00a00593          	li	a1,10
    800042b0:	0009051b          	sext.w	a0,s2
    800042b4:	00002097          	auipc	ra,0x2
    800042b8:	cf4080e7          	jalr	-780(ra) # 80005fa8 <_Z8printIntiii>
    800042bc:	00006517          	auipc	a0,0x6
    800042c0:	2b450513          	addi	a0,a0,692 # 8000a570 <CONSOLE_STATUS+0x560>
    800042c4:	00002097          	auipc	ra,0x2
    800042c8:	b34080e7          	jalr	-1228(ra) # 80005df8 <_Z11printStringPKc>
    800042cc:	0400006f          	j	8000430c <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800042d0:	00006517          	auipc	a0,0x6
    800042d4:	0b050513          	addi	a0,a0,176 # 8000a380 <CONSOLE_STATUS+0x370>
    800042d8:	00002097          	auipc	ra,0x2
    800042dc:	b20080e7          	jalr	-1248(ra) # 80005df8 <_Z11printStringPKc>
    800042e0:	00000613          	li	a2,0
    800042e4:	00a00593          	li	a1,10
    800042e8:	00048513          	mv	a0,s1
    800042ec:	00002097          	auipc	ra,0x2
    800042f0:	cbc080e7          	jalr	-836(ra) # 80005fa8 <_Z8printIntiii>
    800042f4:	00006517          	auipc	a0,0x6
    800042f8:	27c50513          	addi	a0,a0,636 # 8000a570 <CONSOLE_STATUS+0x560>
    800042fc:	00002097          	auipc	ra,0x2
    80004300:	afc080e7          	jalr	-1284(ra) # 80005df8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004304:	0014849b          	addiw	s1,s1,1
    80004308:	0ff4f493          	andi	s1,s1,255
    8000430c:	00f00793          	li	a5,15
    80004310:	fc97f0e3          	bgeu	a5,s1,800042d0 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80004314:	00006517          	auipc	a0,0x6
    80004318:	09450513          	addi	a0,a0,148 # 8000a3a8 <CONSOLE_STATUS+0x398>
    8000431c:	00002097          	auipc	ra,0x2
    80004320:	adc080e7          	jalr	-1316(ra) # 80005df8 <_Z11printStringPKc>
    finishedD = true;
    80004324:	00100793          	li	a5,1
    80004328:	00009717          	auipc	a4,0x9
    8000432c:	90f705a3          	sb	a5,-1781(a4) # 8000cc33 <_ZL9finishedD>
    thread_dispatch();
    80004330:	ffffd097          	auipc	ra,0xffffd
    80004334:	0f8080e7          	jalr	248(ra) # 80001428 <_Z15thread_dispatchv>
}
    80004338:	01813083          	ld	ra,24(sp)
    8000433c:	01013403          	ld	s0,16(sp)
    80004340:	00813483          	ld	s1,8(sp)
    80004344:	00013903          	ld	s2,0(sp)
    80004348:	02010113          	addi	sp,sp,32
    8000434c:	00008067          	ret

0000000080004350 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80004350:	fc010113          	addi	sp,sp,-64
    80004354:	02113c23          	sd	ra,56(sp)
    80004358:	02813823          	sd	s0,48(sp)
    8000435c:	02913423          	sd	s1,40(sp)
    80004360:	03213023          	sd	s2,32(sp)
    80004364:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80004368:	02000513          	li	a0,32
    8000436c:	ffffe097          	auipc	ra,0xffffe
    80004370:	250080e7          	jalr	592(ra) # 800025bc <_Znwm>
    80004374:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80004378:	ffffe097          	auipc	ra,0xffffe
    8000437c:	50c080e7          	jalr	1292(ra) # 80002884 <_ZN6ThreadC1Ev>
    80004380:	00008797          	auipc	a5,0x8
    80004384:	54078793          	addi	a5,a5,1344 # 8000c8c0 <_ZTV7WorkerA+0x10>
    80004388:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    8000438c:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80004390:	00006517          	auipc	a0,0x6
    80004394:	02850513          	addi	a0,a0,40 # 8000a3b8 <CONSOLE_STATUS+0x3a8>
    80004398:	00002097          	auipc	ra,0x2
    8000439c:	a60080e7          	jalr	-1440(ra) # 80005df8 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    800043a0:	02000513          	li	a0,32
    800043a4:	ffffe097          	auipc	ra,0xffffe
    800043a8:	218080e7          	jalr	536(ra) # 800025bc <_Znwm>
    800043ac:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    800043b0:	ffffe097          	auipc	ra,0xffffe
    800043b4:	4d4080e7          	jalr	1236(ra) # 80002884 <_ZN6ThreadC1Ev>
    800043b8:	00008797          	auipc	a5,0x8
    800043bc:	53078793          	addi	a5,a5,1328 # 8000c8e8 <_ZTV7WorkerB+0x10>
    800043c0:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    800043c4:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    800043c8:	00006517          	auipc	a0,0x6
    800043cc:	00850513          	addi	a0,a0,8 # 8000a3d0 <CONSOLE_STATUS+0x3c0>
    800043d0:	00002097          	auipc	ra,0x2
    800043d4:	a28080e7          	jalr	-1496(ra) # 80005df8 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    800043d8:	02000513          	li	a0,32
    800043dc:	ffffe097          	auipc	ra,0xffffe
    800043e0:	1e0080e7          	jalr	480(ra) # 800025bc <_Znwm>
    800043e4:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    800043e8:	ffffe097          	auipc	ra,0xffffe
    800043ec:	49c080e7          	jalr	1180(ra) # 80002884 <_ZN6ThreadC1Ev>
    800043f0:	00008797          	auipc	a5,0x8
    800043f4:	52078793          	addi	a5,a5,1312 # 8000c910 <_ZTV7WorkerC+0x10>
    800043f8:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    800043fc:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80004400:	00006517          	auipc	a0,0x6
    80004404:	fe850513          	addi	a0,a0,-24 # 8000a3e8 <CONSOLE_STATUS+0x3d8>
    80004408:	00002097          	auipc	ra,0x2
    8000440c:	9f0080e7          	jalr	-1552(ra) # 80005df8 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80004410:	02000513          	li	a0,32
    80004414:	ffffe097          	auipc	ra,0xffffe
    80004418:	1a8080e7          	jalr	424(ra) # 800025bc <_Znwm>
    8000441c:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80004420:	ffffe097          	auipc	ra,0xffffe
    80004424:	464080e7          	jalr	1124(ra) # 80002884 <_ZN6ThreadC1Ev>
    80004428:	00008797          	auipc	a5,0x8
    8000442c:	51078793          	addi	a5,a5,1296 # 8000c938 <_ZTV7WorkerD+0x10>
    80004430:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80004434:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80004438:	00006517          	auipc	a0,0x6
    8000443c:	fc850513          	addi	a0,a0,-56 # 8000a400 <CONSOLE_STATUS+0x3f0>
    80004440:	00002097          	auipc	ra,0x2
    80004444:	9b8080e7          	jalr	-1608(ra) # 80005df8 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80004448:	00000493          	li	s1,0
    8000444c:	00300793          	li	a5,3
    80004450:	0297c663          	blt	a5,s1,8000447c <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80004454:	00349793          	slli	a5,s1,0x3
    80004458:	fe040713          	addi	a4,s0,-32
    8000445c:	00f707b3          	add	a5,a4,a5
    80004460:	fe07b503          	ld	a0,-32(a5)
    80004464:	ffffe097          	auipc	ra,0xffffe
    80004468:	308080e7          	jalr	776(ra) # 8000276c <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    8000446c:	0014849b          	addiw	s1,s1,1
    80004470:	fddff06f          	j	8000444c <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80004474:	ffffe097          	auipc	ra,0xffffe
    80004478:	35c080e7          	jalr	860(ra) # 800027d0 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    8000447c:	00008797          	auipc	a5,0x8
    80004480:	7b47c783          	lbu	a5,1972(a5) # 8000cc30 <_ZL9finishedA>
    80004484:	fe0788e3          	beqz	a5,80004474 <_Z20Threads_CPP_API_testv+0x124>
    80004488:	00008797          	auipc	a5,0x8
    8000448c:	7a97c783          	lbu	a5,1961(a5) # 8000cc31 <_ZL9finishedB>
    80004490:	fe0782e3          	beqz	a5,80004474 <_Z20Threads_CPP_API_testv+0x124>
    80004494:	00008797          	auipc	a5,0x8
    80004498:	79e7c783          	lbu	a5,1950(a5) # 8000cc32 <_ZL9finishedC>
    8000449c:	fc078ce3          	beqz	a5,80004474 <_Z20Threads_CPP_API_testv+0x124>
    800044a0:	00008797          	auipc	a5,0x8
    800044a4:	7937c783          	lbu	a5,1939(a5) # 8000cc33 <_ZL9finishedD>
    800044a8:	fc0786e3          	beqz	a5,80004474 <_Z20Threads_CPP_API_testv+0x124>
    800044ac:	fc040493          	addi	s1,s0,-64
    800044b0:	0080006f          	j	800044b8 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) {
    800044b4:	00848493          	addi	s1,s1,8
    800044b8:	fe040793          	addi	a5,s0,-32
    800044bc:	08f48663          	beq	s1,a5,80004548 <_Z20Threads_CPP_API_testv+0x1f8>
    800044c0:	0004b503          	ld	a0,0(s1)
		delete thread;
    800044c4:	fe0508e3          	beqz	a0,800044b4 <_Z20Threads_CPP_API_testv+0x164>
    800044c8:	00053783          	ld	a5,0(a0)
    800044cc:	0087b783          	ld	a5,8(a5)
    800044d0:	000780e7          	jalr	a5
    800044d4:	fe1ff06f          	j	800044b4 <_Z20Threads_CPP_API_testv+0x164>
    800044d8:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    800044dc:	00048513          	mv	a0,s1
    800044e0:	ffffe097          	auipc	ra,0xffffe
    800044e4:	12c080e7          	jalr	300(ra) # 8000260c <_ZdlPv>
    800044e8:	00090513          	mv	a0,s2
    800044ec:	0000a097          	auipc	ra,0xa
    800044f0:	84c080e7          	jalr	-1972(ra) # 8000dd38 <_Unwind_Resume>
    800044f4:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    800044f8:	00048513          	mv	a0,s1
    800044fc:	ffffe097          	auipc	ra,0xffffe
    80004500:	110080e7          	jalr	272(ra) # 8000260c <_ZdlPv>
    80004504:	00090513          	mv	a0,s2
    80004508:	0000a097          	auipc	ra,0xa
    8000450c:	830080e7          	jalr	-2000(ra) # 8000dd38 <_Unwind_Resume>
    80004510:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80004514:	00048513          	mv	a0,s1
    80004518:	ffffe097          	auipc	ra,0xffffe
    8000451c:	0f4080e7          	jalr	244(ra) # 8000260c <_ZdlPv>
    80004520:	00090513          	mv	a0,s2
    80004524:	0000a097          	auipc	ra,0xa
    80004528:	814080e7          	jalr	-2028(ra) # 8000dd38 <_Unwind_Resume>
    8000452c:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80004530:	00048513          	mv	a0,s1
    80004534:	ffffe097          	auipc	ra,0xffffe
    80004538:	0d8080e7          	jalr	216(ra) # 8000260c <_ZdlPv>
    8000453c:	00090513          	mv	a0,s2
    80004540:	00009097          	auipc	ra,0x9
    80004544:	7f8080e7          	jalr	2040(ra) # 8000dd38 <_Unwind_Resume>
	}
}
    80004548:	03813083          	ld	ra,56(sp)
    8000454c:	03013403          	ld	s0,48(sp)
    80004550:	02813483          	ld	s1,40(sp)
    80004554:	02013903          	ld	s2,32(sp)
    80004558:	04010113          	addi	sp,sp,64
    8000455c:	00008067          	ret

0000000080004560 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80004560:	ff010113          	addi	sp,sp,-16
    80004564:	00113423          	sd	ra,8(sp)
    80004568:	00813023          	sd	s0,0(sp)
    8000456c:	01010413          	addi	s0,sp,16
    80004570:	00008797          	auipc	a5,0x8
    80004574:	35078793          	addi	a5,a5,848 # 8000c8c0 <_ZTV7WorkerA+0x10>
    80004578:	00f53023          	sd	a5,0(a0)
    8000457c:	ffffe097          	auipc	ra,0xffffe
    80004580:	f50080e7          	jalr	-176(ra) # 800024cc <_ZN6ThreadD1Ev>
    80004584:	00813083          	ld	ra,8(sp)
    80004588:	00013403          	ld	s0,0(sp)
    8000458c:	01010113          	addi	sp,sp,16
    80004590:	00008067          	ret

0000000080004594 <_ZN7WorkerAD0Ev>:
    80004594:	fe010113          	addi	sp,sp,-32
    80004598:	00113c23          	sd	ra,24(sp)
    8000459c:	00813823          	sd	s0,16(sp)
    800045a0:	00913423          	sd	s1,8(sp)
    800045a4:	02010413          	addi	s0,sp,32
    800045a8:	00050493          	mv	s1,a0
    800045ac:	00008797          	auipc	a5,0x8
    800045b0:	31478793          	addi	a5,a5,788 # 8000c8c0 <_ZTV7WorkerA+0x10>
    800045b4:	00f53023          	sd	a5,0(a0)
    800045b8:	ffffe097          	auipc	ra,0xffffe
    800045bc:	f14080e7          	jalr	-236(ra) # 800024cc <_ZN6ThreadD1Ev>
    800045c0:	00048513          	mv	a0,s1
    800045c4:	ffffe097          	auipc	ra,0xffffe
    800045c8:	048080e7          	jalr	72(ra) # 8000260c <_ZdlPv>
    800045cc:	01813083          	ld	ra,24(sp)
    800045d0:	01013403          	ld	s0,16(sp)
    800045d4:	00813483          	ld	s1,8(sp)
    800045d8:	02010113          	addi	sp,sp,32
    800045dc:	00008067          	ret

00000000800045e0 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    800045e0:	ff010113          	addi	sp,sp,-16
    800045e4:	00113423          	sd	ra,8(sp)
    800045e8:	00813023          	sd	s0,0(sp)
    800045ec:	01010413          	addi	s0,sp,16
    800045f0:	00008797          	auipc	a5,0x8
    800045f4:	2f878793          	addi	a5,a5,760 # 8000c8e8 <_ZTV7WorkerB+0x10>
    800045f8:	00f53023          	sd	a5,0(a0)
    800045fc:	ffffe097          	auipc	ra,0xffffe
    80004600:	ed0080e7          	jalr	-304(ra) # 800024cc <_ZN6ThreadD1Ev>
    80004604:	00813083          	ld	ra,8(sp)
    80004608:	00013403          	ld	s0,0(sp)
    8000460c:	01010113          	addi	sp,sp,16
    80004610:	00008067          	ret

0000000080004614 <_ZN7WorkerBD0Ev>:
    80004614:	fe010113          	addi	sp,sp,-32
    80004618:	00113c23          	sd	ra,24(sp)
    8000461c:	00813823          	sd	s0,16(sp)
    80004620:	00913423          	sd	s1,8(sp)
    80004624:	02010413          	addi	s0,sp,32
    80004628:	00050493          	mv	s1,a0
    8000462c:	00008797          	auipc	a5,0x8
    80004630:	2bc78793          	addi	a5,a5,700 # 8000c8e8 <_ZTV7WorkerB+0x10>
    80004634:	00f53023          	sd	a5,0(a0)
    80004638:	ffffe097          	auipc	ra,0xffffe
    8000463c:	e94080e7          	jalr	-364(ra) # 800024cc <_ZN6ThreadD1Ev>
    80004640:	00048513          	mv	a0,s1
    80004644:	ffffe097          	auipc	ra,0xffffe
    80004648:	fc8080e7          	jalr	-56(ra) # 8000260c <_ZdlPv>
    8000464c:	01813083          	ld	ra,24(sp)
    80004650:	01013403          	ld	s0,16(sp)
    80004654:	00813483          	ld	s1,8(sp)
    80004658:	02010113          	addi	sp,sp,32
    8000465c:	00008067          	ret

0000000080004660 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80004660:	ff010113          	addi	sp,sp,-16
    80004664:	00113423          	sd	ra,8(sp)
    80004668:	00813023          	sd	s0,0(sp)
    8000466c:	01010413          	addi	s0,sp,16
    80004670:	00008797          	auipc	a5,0x8
    80004674:	2a078793          	addi	a5,a5,672 # 8000c910 <_ZTV7WorkerC+0x10>
    80004678:	00f53023          	sd	a5,0(a0)
    8000467c:	ffffe097          	auipc	ra,0xffffe
    80004680:	e50080e7          	jalr	-432(ra) # 800024cc <_ZN6ThreadD1Ev>
    80004684:	00813083          	ld	ra,8(sp)
    80004688:	00013403          	ld	s0,0(sp)
    8000468c:	01010113          	addi	sp,sp,16
    80004690:	00008067          	ret

0000000080004694 <_ZN7WorkerCD0Ev>:
    80004694:	fe010113          	addi	sp,sp,-32
    80004698:	00113c23          	sd	ra,24(sp)
    8000469c:	00813823          	sd	s0,16(sp)
    800046a0:	00913423          	sd	s1,8(sp)
    800046a4:	02010413          	addi	s0,sp,32
    800046a8:	00050493          	mv	s1,a0
    800046ac:	00008797          	auipc	a5,0x8
    800046b0:	26478793          	addi	a5,a5,612 # 8000c910 <_ZTV7WorkerC+0x10>
    800046b4:	00f53023          	sd	a5,0(a0)
    800046b8:	ffffe097          	auipc	ra,0xffffe
    800046bc:	e14080e7          	jalr	-492(ra) # 800024cc <_ZN6ThreadD1Ev>
    800046c0:	00048513          	mv	a0,s1
    800046c4:	ffffe097          	auipc	ra,0xffffe
    800046c8:	f48080e7          	jalr	-184(ra) # 8000260c <_ZdlPv>
    800046cc:	01813083          	ld	ra,24(sp)
    800046d0:	01013403          	ld	s0,16(sp)
    800046d4:	00813483          	ld	s1,8(sp)
    800046d8:	02010113          	addi	sp,sp,32
    800046dc:	00008067          	ret

00000000800046e0 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    800046e0:	ff010113          	addi	sp,sp,-16
    800046e4:	00113423          	sd	ra,8(sp)
    800046e8:	00813023          	sd	s0,0(sp)
    800046ec:	01010413          	addi	s0,sp,16
    800046f0:	00008797          	auipc	a5,0x8
    800046f4:	24878793          	addi	a5,a5,584 # 8000c938 <_ZTV7WorkerD+0x10>
    800046f8:	00f53023          	sd	a5,0(a0)
    800046fc:	ffffe097          	auipc	ra,0xffffe
    80004700:	dd0080e7          	jalr	-560(ra) # 800024cc <_ZN6ThreadD1Ev>
    80004704:	00813083          	ld	ra,8(sp)
    80004708:	00013403          	ld	s0,0(sp)
    8000470c:	01010113          	addi	sp,sp,16
    80004710:	00008067          	ret

0000000080004714 <_ZN7WorkerDD0Ev>:
    80004714:	fe010113          	addi	sp,sp,-32
    80004718:	00113c23          	sd	ra,24(sp)
    8000471c:	00813823          	sd	s0,16(sp)
    80004720:	00913423          	sd	s1,8(sp)
    80004724:	02010413          	addi	s0,sp,32
    80004728:	00050493          	mv	s1,a0
    8000472c:	00008797          	auipc	a5,0x8
    80004730:	20c78793          	addi	a5,a5,524 # 8000c938 <_ZTV7WorkerD+0x10>
    80004734:	00f53023          	sd	a5,0(a0)
    80004738:	ffffe097          	auipc	ra,0xffffe
    8000473c:	d94080e7          	jalr	-620(ra) # 800024cc <_ZN6ThreadD1Ev>
    80004740:	00048513          	mv	a0,s1
    80004744:	ffffe097          	auipc	ra,0xffffe
    80004748:	ec8080e7          	jalr	-312(ra) # 8000260c <_ZdlPv>
    8000474c:	01813083          	ld	ra,24(sp)
    80004750:	01013403          	ld	s0,16(sp)
    80004754:	00813483          	ld	s1,8(sp)
    80004758:	02010113          	addi	sp,sp,32
    8000475c:	00008067          	ret

0000000080004760 <_ZN7WorkerA3runEv>:
    void run() override {
    80004760:	ff010113          	addi	sp,sp,-16
    80004764:	00113423          	sd	ra,8(sp)
    80004768:	00813023          	sd	s0,0(sp)
    8000476c:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80004770:	00000593          	li	a1,0
    80004774:	fffff097          	auipc	ra,0xfffff
    80004778:	774080e7          	jalr	1908(ra) # 80003ee8 <_ZN7WorkerA11workerBodyAEPv>
    }
    8000477c:	00813083          	ld	ra,8(sp)
    80004780:	00013403          	ld	s0,0(sp)
    80004784:	01010113          	addi	sp,sp,16
    80004788:	00008067          	ret

000000008000478c <_ZN7WorkerB3runEv>:
    void run() override {
    8000478c:	ff010113          	addi	sp,sp,-16
    80004790:	00113423          	sd	ra,8(sp)
    80004794:	00813023          	sd	s0,0(sp)
    80004798:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    8000479c:	00000593          	li	a1,0
    800047a0:	00000097          	auipc	ra,0x0
    800047a4:	814080e7          	jalr	-2028(ra) # 80003fb4 <_ZN7WorkerB11workerBodyBEPv>
    }
    800047a8:	00813083          	ld	ra,8(sp)
    800047ac:	00013403          	ld	s0,0(sp)
    800047b0:	01010113          	addi	sp,sp,16
    800047b4:	00008067          	ret

00000000800047b8 <_ZN7WorkerC3runEv>:
    void run() override {
    800047b8:	ff010113          	addi	sp,sp,-16
    800047bc:	00113423          	sd	ra,8(sp)
    800047c0:	00813023          	sd	s0,0(sp)
    800047c4:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    800047c8:	00000593          	li	a1,0
    800047cc:	00000097          	auipc	ra,0x0
    800047d0:	8bc080e7          	jalr	-1860(ra) # 80004088 <_ZN7WorkerC11workerBodyCEPv>
    }
    800047d4:	00813083          	ld	ra,8(sp)
    800047d8:	00013403          	ld	s0,0(sp)
    800047dc:	01010113          	addi	sp,sp,16
    800047e0:	00008067          	ret

00000000800047e4 <_ZN7WorkerD3runEv>:
    void run() override {
    800047e4:	ff010113          	addi	sp,sp,-16
    800047e8:	00113423          	sd	ra,8(sp)
    800047ec:	00813023          	sd	s0,0(sp)
    800047f0:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    800047f4:	00000593          	li	a1,0
    800047f8:	00000097          	auipc	ra,0x0
    800047fc:	a10080e7          	jalr	-1520(ra) # 80004208 <_ZN7WorkerD11workerBodyDEPv>
    }
    80004800:	00813083          	ld	ra,8(sp)
    80004804:	00013403          	ld	s0,0(sp)
    80004808:	01010113          	addi	sp,sp,16
    8000480c:	00008067          	ret

0000000080004810 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    80004810:	f8010113          	addi	sp,sp,-128
    80004814:	06113c23          	sd	ra,120(sp)
    80004818:	06813823          	sd	s0,112(sp)
    8000481c:	06913423          	sd	s1,104(sp)
    80004820:	07213023          	sd	s2,96(sp)
    80004824:	05313c23          	sd	s3,88(sp)
    80004828:	05413823          	sd	s4,80(sp)
    8000482c:	05513423          	sd	s5,72(sp)
    80004830:	05613023          	sd	s6,64(sp)
    80004834:	03713c23          	sd	s7,56(sp)
    80004838:	03813823          	sd	s8,48(sp)
    8000483c:	03913423          	sd	s9,40(sp)
    80004840:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    80004844:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    80004848:	00006517          	auipc	a0,0x6
    8000484c:	9e050513          	addi	a0,a0,-1568 # 8000a228 <CONSOLE_STATUS+0x218>
    80004850:	00001097          	auipc	ra,0x1
    80004854:	5a8080e7          	jalr	1448(ra) # 80005df8 <_Z11printStringPKc>
    getString(input, 30);
    80004858:	01e00593          	li	a1,30
    8000485c:	f8040493          	addi	s1,s0,-128
    80004860:	00048513          	mv	a0,s1
    80004864:	00001097          	auipc	ra,0x1
    80004868:	61c080e7          	jalr	1564(ra) # 80005e80 <_Z9getStringPci>
    threadNum = stringToInt(input);
    8000486c:	00048513          	mv	a0,s1
    80004870:	00001097          	auipc	ra,0x1
    80004874:	6e8080e7          	jalr	1768(ra) # 80005f58 <_Z11stringToIntPKc>
    80004878:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    8000487c:	00006517          	auipc	a0,0x6
    80004880:	9cc50513          	addi	a0,a0,-1588 # 8000a248 <CONSOLE_STATUS+0x238>
    80004884:	00001097          	auipc	ra,0x1
    80004888:	574080e7          	jalr	1396(ra) # 80005df8 <_Z11printStringPKc>
    getString(input, 30);
    8000488c:	01e00593          	li	a1,30
    80004890:	00048513          	mv	a0,s1
    80004894:	00001097          	auipc	ra,0x1
    80004898:	5ec080e7          	jalr	1516(ra) # 80005e80 <_Z9getStringPci>
    n = stringToInt(input);
    8000489c:	00048513          	mv	a0,s1
    800048a0:	00001097          	auipc	ra,0x1
    800048a4:	6b8080e7          	jalr	1720(ra) # 80005f58 <_Z11stringToIntPKc>
    800048a8:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    800048ac:	00006517          	auipc	a0,0x6
    800048b0:	9bc50513          	addi	a0,a0,-1604 # 8000a268 <CONSOLE_STATUS+0x258>
    800048b4:	00001097          	auipc	ra,0x1
    800048b8:	544080e7          	jalr	1348(ra) # 80005df8 <_Z11printStringPKc>
    printInt(threadNum);
    800048bc:	00000613          	li	a2,0
    800048c0:	00a00593          	li	a1,10
    800048c4:	00098513          	mv	a0,s3
    800048c8:	00001097          	auipc	ra,0x1
    800048cc:	6e0080e7          	jalr	1760(ra) # 80005fa8 <_Z8printIntiii>
    printString(" i velicina bafera ");
    800048d0:	00006517          	auipc	a0,0x6
    800048d4:	9b050513          	addi	a0,a0,-1616 # 8000a280 <CONSOLE_STATUS+0x270>
    800048d8:	00001097          	auipc	ra,0x1
    800048dc:	520080e7          	jalr	1312(ra) # 80005df8 <_Z11printStringPKc>
    printInt(n);
    800048e0:	00000613          	li	a2,0
    800048e4:	00a00593          	li	a1,10
    800048e8:	00048513          	mv	a0,s1
    800048ec:	00001097          	auipc	ra,0x1
    800048f0:	6bc080e7          	jalr	1724(ra) # 80005fa8 <_Z8printIntiii>
    printString(".\n");
    800048f4:	00006517          	auipc	a0,0x6
    800048f8:	9a450513          	addi	a0,a0,-1628 # 8000a298 <CONSOLE_STATUS+0x288>
    800048fc:	00001097          	auipc	ra,0x1
    80004900:	4fc080e7          	jalr	1276(ra) # 80005df8 <_Z11printStringPKc>
    if (threadNum > n) {
    80004904:	0334c463          	blt	s1,s3,8000492c <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    80004908:	03305c63          	blez	s3,80004940 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    8000490c:	03800513          	li	a0,56
    80004910:	ffffe097          	auipc	ra,0xffffe
    80004914:	cac080e7          	jalr	-852(ra) # 800025bc <_Znwm>
    80004918:	00050a93          	mv	s5,a0
    8000491c:	00048593          	mv	a1,s1
    80004920:	00001097          	auipc	ra,0x1
    80004924:	7a8080e7          	jalr	1960(ra) # 800060c8 <_ZN9BufferCPPC1Ei>
    80004928:	0300006f          	j	80004958 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    8000492c:	00006517          	auipc	a0,0x6
    80004930:	97450513          	addi	a0,a0,-1676 # 8000a2a0 <CONSOLE_STATUS+0x290>
    80004934:	00001097          	auipc	ra,0x1
    80004938:	4c4080e7          	jalr	1220(ra) # 80005df8 <_Z11printStringPKc>
        return;
    8000493c:	0140006f          	j	80004950 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80004940:	00006517          	auipc	a0,0x6
    80004944:	9a050513          	addi	a0,a0,-1632 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80004948:	00001097          	auipc	ra,0x1
    8000494c:	4b0080e7          	jalr	1200(ra) # 80005df8 <_Z11printStringPKc>
        return;
    80004950:	000c0113          	mv	sp,s8
    80004954:	2140006f          	j	80004b68 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    80004958:	01000513          	li	a0,16
    8000495c:	ffffe097          	auipc	ra,0xffffe
    80004960:	c60080e7          	jalr	-928(ra) # 800025bc <_Znwm>
    80004964:	00050913          	mv	s2,a0
    80004968:	00000593          	li	a1,0
    8000496c:	ffffe097          	auipc	ra,0xffffe
    80004970:	f94080e7          	jalr	-108(ra) # 80002900 <_ZN9SemaphoreC1Ej>
    80004974:	00008797          	auipc	a5,0x8
    80004978:	2d27b623          	sd	s2,716(a5) # 8000cc40 <_ZL10waitForAll>
    Thread *producers[threadNum];
    8000497c:	00399793          	slli	a5,s3,0x3
    80004980:	00f78793          	addi	a5,a5,15
    80004984:	ff07f793          	andi	a5,a5,-16
    80004988:	40f10133          	sub	sp,sp,a5
    8000498c:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80004990:	0019871b          	addiw	a4,s3,1
    80004994:	00171793          	slli	a5,a4,0x1
    80004998:	00e787b3          	add	a5,a5,a4
    8000499c:	00379793          	slli	a5,a5,0x3
    800049a0:	00f78793          	addi	a5,a5,15
    800049a4:	ff07f793          	andi	a5,a5,-16
    800049a8:	40f10133          	sub	sp,sp,a5
    800049ac:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    800049b0:	00199493          	slli	s1,s3,0x1
    800049b4:	013484b3          	add	s1,s1,s3
    800049b8:	00349493          	slli	s1,s1,0x3
    800049bc:	009b04b3          	add	s1,s6,s1
    800049c0:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    800049c4:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    800049c8:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    800049cc:	02800513          	li	a0,40
    800049d0:	ffffe097          	auipc	ra,0xffffe
    800049d4:	bec080e7          	jalr	-1044(ra) # 800025bc <_Znwm>
    800049d8:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    800049dc:	ffffe097          	auipc	ra,0xffffe
    800049e0:	ea8080e7          	jalr	-344(ra) # 80002884 <_ZN6ThreadC1Ev>
    800049e4:	00008797          	auipc	a5,0x8
    800049e8:	fcc78793          	addi	a5,a5,-52 # 8000c9b0 <_ZTV8Consumer+0x10>
    800049ec:	00fbb023          	sd	a5,0(s7)
    800049f0:	029bb023          	sd	s1,32(s7)
    consumer->start();
    800049f4:	000b8513          	mv	a0,s7
    800049f8:	ffffe097          	auipc	ra,0xffffe
    800049fc:	d74080e7          	jalr	-652(ra) # 8000276c <_ZN6Thread5startEv>
    threadData[0].id = 0;
    80004a00:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    80004a04:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    80004a08:	00008797          	auipc	a5,0x8
    80004a0c:	2387b783          	ld	a5,568(a5) # 8000cc40 <_ZL10waitForAll>
    80004a10:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004a14:	02800513          	li	a0,40
    80004a18:	ffffe097          	auipc	ra,0xffffe
    80004a1c:	ba4080e7          	jalr	-1116(ra) # 800025bc <_Znwm>
    80004a20:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80004a24:	ffffe097          	auipc	ra,0xffffe
    80004a28:	e60080e7          	jalr	-416(ra) # 80002884 <_ZN6ThreadC1Ev>
    80004a2c:	00008797          	auipc	a5,0x8
    80004a30:	f3478793          	addi	a5,a5,-204 # 8000c960 <_ZTV16ProducerKeyborad+0x10>
    80004a34:	00f4b023          	sd	a5,0(s1)
    80004a38:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004a3c:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80004a40:	00048513          	mv	a0,s1
    80004a44:	ffffe097          	auipc	ra,0xffffe
    80004a48:	d28080e7          	jalr	-728(ra) # 8000276c <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004a4c:	00100913          	li	s2,1
    80004a50:	0300006f          	j	80004a80 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004a54:	00008797          	auipc	a5,0x8
    80004a58:	f3478793          	addi	a5,a5,-204 # 8000c988 <_ZTV8Producer+0x10>
    80004a5c:	00fcb023          	sd	a5,0(s9)
    80004a60:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    80004a64:	00391793          	slli	a5,s2,0x3
    80004a68:	00fa07b3          	add	a5,s4,a5
    80004a6c:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80004a70:	000c8513          	mv	a0,s9
    80004a74:	ffffe097          	auipc	ra,0xffffe
    80004a78:	cf8080e7          	jalr	-776(ra) # 8000276c <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004a7c:	0019091b          	addiw	s2,s2,1
    80004a80:	05395263          	bge	s2,s3,80004ac4 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80004a84:	00191493          	slli	s1,s2,0x1
    80004a88:	012484b3          	add	s1,s1,s2
    80004a8c:	00349493          	slli	s1,s1,0x3
    80004a90:	009b04b3          	add	s1,s6,s1
    80004a94:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80004a98:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80004a9c:	00008797          	auipc	a5,0x8
    80004aa0:	1a47b783          	ld	a5,420(a5) # 8000cc40 <_ZL10waitForAll>
    80004aa4:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80004aa8:	02800513          	li	a0,40
    80004aac:	ffffe097          	auipc	ra,0xffffe
    80004ab0:	b10080e7          	jalr	-1264(ra) # 800025bc <_Znwm>
    80004ab4:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004ab8:	ffffe097          	auipc	ra,0xffffe
    80004abc:	dcc080e7          	jalr	-564(ra) # 80002884 <_ZN6ThreadC1Ev>
    80004ac0:	f95ff06f          	j	80004a54 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    80004ac4:	ffffe097          	auipc	ra,0xffffe
    80004ac8:	d0c080e7          	jalr	-756(ra) # 800027d0 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80004acc:	00000493          	li	s1,0
    80004ad0:	0099ce63          	blt	s3,s1,80004aec <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    80004ad4:	00008517          	auipc	a0,0x8
    80004ad8:	16c53503          	ld	a0,364(a0) # 8000cc40 <_ZL10waitForAll>
    80004adc:	ffffe097          	auipc	ra,0xffffe
    80004ae0:	e5c080e7          	jalr	-420(ra) # 80002938 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80004ae4:	0014849b          	addiw	s1,s1,1
    80004ae8:	fe9ff06f          	j	80004ad0 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    80004aec:	00008517          	auipc	a0,0x8
    80004af0:	15453503          	ld	a0,340(a0) # 8000cc40 <_ZL10waitForAll>
    80004af4:	00050863          	beqz	a0,80004b04 <_Z20testConsumerProducerv+0x2f4>
    80004af8:	00053783          	ld	a5,0(a0)
    80004afc:	0087b783          	ld	a5,8(a5)
    80004b00:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    80004b04:	00000493          	li	s1,0
    80004b08:	0080006f          	j	80004b10 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    80004b0c:	0014849b          	addiw	s1,s1,1
    80004b10:	0334d263          	bge	s1,s3,80004b34 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    80004b14:	00349793          	slli	a5,s1,0x3
    80004b18:	00fa07b3          	add	a5,s4,a5
    80004b1c:	0007b503          	ld	a0,0(a5)
    80004b20:	fe0506e3          	beqz	a0,80004b0c <_Z20testConsumerProducerv+0x2fc>
    80004b24:	00053783          	ld	a5,0(a0)
    80004b28:	0087b783          	ld	a5,8(a5)
    80004b2c:	000780e7          	jalr	a5
    80004b30:	fddff06f          	j	80004b0c <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    80004b34:	000b8a63          	beqz	s7,80004b48 <_Z20testConsumerProducerv+0x338>
    80004b38:	000bb783          	ld	a5,0(s7)
    80004b3c:	0087b783          	ld	a5,8(a5)
    80004b40:	000b8513          	mv	a0,s7
    80004b44:	000780e7          	jalr	a5
    delete buffer;
    80004b48:	000a8e63          	beqz	s5,80004b64 <_Z20testConsumerProducerv+0x354>
    80004b4c:	000a8513          	mv	a0,s5
    80004b50:	00002097          	auipc	ra,0x2
    80004b54:	870080e7          	jalr	-1936(ra) # 800063c0 <_ZN9BufferCPPD1Ev>
    80004b58:	000a8513          	mv	a0,s5
    80004b5c:	ffffe097          	auipc	ra,0xffffe
    80004b60:	ab0080e7          	jalr	-1360(ra) # 8000260c <_ZdlPv>
    80004b64:	000c0113          	mv	sp,s8
}
    80004b68:	f8040113          	addi	sp,s0,-128
    80004b6c:	07813083          	ld	ra,120(sp)
    80004b70:	07013403          	ld	s0,112(sp)
    80004b74:	06813483          	ld	s1,104(sp)
    80004b78:	06013903          	ld	s2,96(sp)
    80004b7c:	05813983          	ld	s3,88(sp)
    80004b80:	05013a03          	ld	s4,80(sp)
    80004b84:	04813a83          	ld	s5,72(sp)
    80004b88:	04013b03          	ld	s6,64(sp)
    80004b8c:	03813b83          	ld	s7,56(sp)
    80004b90:	03013c03          	ld	s8,48(sp)
    80004b94:	02813c83          	ld	s9,40(sp)
    80004b98:	08010113          	addi	sp,sp,128
    80004b9c:	00008067          	ret
    80004ba0:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80004ba4:	000a8513          	mv	a0,s5
    80004ba8:	ffffe097          	auipc	ra,0xffffe
    80004bac:	a64080e7          	jalr	-1436(ra) # 8000260c <_ZdlPv>
    80004bb0:	00048513          	mv	a0,s1
    80004bb4:	00009097          	auipc	ra,0x9
    80004bb8:	184080e7          	jalr	388(ra) # 8000dd38 <_Unwind_Resume>
    80004bbc:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80004bc0:	00090513          	mv	a0,s2
    80004bc4:	ffffe097          	auipc	ra,0xffffe
    80004bc8:	a48080e7          	jalr	-1464(ra) # 8000260c <_ZdlPv>
    80004bcc:	00048513          	mv	a0,s1
    80004bd0:	00009097          	auipc	ra,0x9
    80004bd4:	168080e7          	jalr	360(ra) # 8000dd38 <_Unwind_Resume>
    80004bd8:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004bdc:	000b8513          	mv	a0,s7
    80004be0:	ffffe097          	auipc	ra,0xffffe
    80004be4:	a2c080e7          	jalr	-1492(ra) # 8000260c <_ZdlPv>
    80004be8:	00048513          	mv	a0,s1
    80004bec:	00009097          	auipc	ra,0x9
    80004bf0:	14c080e7          	jalr	332(ra) # 8000dd38 <_Unwind_Resume>
    80004bf4:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004bf8:	00048513          	mv	a0,s1
    80004bfc:	ffffe097          	auipc	ra,0xffffe
    80004c00:	a10080e7          	jalr	-1520(ra) # 8000260c <_ZdlPv>
    80004c04:	00090513          	mv	a0,s2
    80004c08:	00009097          	auipc	ra,0x9
    80004c0c:	130080e7          	jalr	304(ra) # 8000dd38 <_Unwind_Resume>
    80004c10:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    80004c14:	000c8513          	mv	a0,s9
    80004c18:	ffffe097          	auipc	ra,0xffffe
    80004c1c:	9f4080e7          	jalr	-1548(ra) # 8000260c <_ZdlPv>
    80004c20:	00048513          	mv	a0,s1
    80004c24:	00009097          	auipc	ra,0x9
    80004c28:	114080e7          	jalr	276(ra) # 8000dd38 <_Unwind_Resume>

0000000080004c2c <_ZN8Consumer3runEv>:
    void run() override {
    80004c2c:	fd010113          	addi	sp,sp,-48
    80004c30:	02113423          	sd	ra,40(sp)
    80004c34:	02813023          	sd	s0,32(sp)
    80004c38:	00913c23          	sd	s1,24(sp)
    80004c3c:	01213823          	sd	s2,16(sp)
    80004c40:	01313423          	sd	s3,8(sp)
    80004c44:	03010413          	addi	s0,sp,48
    80004c48:	00050913          	mv	s2,a0
        int i = 0;
    80004c4c:	00000993          	li	s3,0
    80004c50:	0100006f          	j	80004c60 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    80004c54:	00a00513          	li	a0,10
    80004c58:	ffffe097          	auipc	ra,0xffffe
    80004c5c:	dd4080e7          	jalr	-556(ra) # 80002a2c <_ZN7Console4putcEc>
        while (!threadEnd) {
    80004c60:	00008797          	auipc	a5,0x8
    80004c64:	fd87a783          	lw	a5,-40(a5) # 8000cc38 <_ZL9threadEnd>
    80004c68:	04079a63          	bnez	a5,80004cbc <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80004c6c:	02093783          	ld	a5,32(s2)
    80004c70:	0087b503          	ld	a0,8(a5)
    80004c74:	00001097          	auipc	ra,0x1
    80004c78:	638080e7          	jalr	1592(ra) # 800062ac <_ZN9BufferCPP3getEv>
            i++;
    80004c7c:	0019849b          	addiw	s1,s3,1
    80004c80:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80004c84:	0ff57513          	andi	a0,a0,255
    80004c88:	ffffe097          	auipc	ra,0xffffe
    80004c8c:	da4080e7          	jalr	-604(ra) # 80002a2c <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80004c90:	05000793          	li	a5,80
    80004c94:	02f4e4bb          	remw	s1,s1,a5
    80004c98:	fc0494e3          	bnez	s1,80004c60 <_ZN8Consumer3runEv+0x34>
    80004c9c:	fb9ff06f          	j	80004c54 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80004ca0:	02093783          	ld	a5,32(s2)
    80004ca4:	0087b503          	ld	a0,8(a5)
    80004ca8:	00001097          	auipc	ra,0x1
    80004cac:	604080e7          	jalr	1540(ra) # 800062ac <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80004cb0:	0ff57513          	andi	a0,a0,255
    80004cb4:	ffffe097          	auipc	ra,0xffffe
    80004cb8:	d78080e7          	jalr	-648(ra) # 80002a2c <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80004cbc:	02093783          	ld	a5,32(s2)
    80004cc0:	0087b503          	ld	a0,8(a5)
    80004cc4:	00001097          	auipc	ra,0x1
    80004cc8:	674080e7          	jalr	1652(ra) # 80006338 <_ZN9BufferCPP6getCntEv>
    80004ccc:	fca04ae3          	bgtz	a0,80004ca0 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80004cd0:	02093783          	ld	a5,32(s2)
    80004cd4:	0107b503          	ld	a0,16(a5)
    80004cd8:	ffffe097          	auipc	ra,0xffffe
    80004cdc:	c8c080e7          	jalr	-884(ra) # 80002964 <_ZN9Semaphore6signalEv>
    }
    80004ce0:	02813083          	ld	ra,40(sp)
    80004ce4:	02013403          	ld	s0,32(sp)
    80004ce8:	01813483          	ld	s1,24(sp)
    80004cec:	01013903          	ld	s2,16(sp)
    80004cf0:	00813983          	ld	s3,8(sp)
    80004cf4:	03010113          	addi	sp,sp,48
    80004cf8:	00008067          	ret

0000000080004cfc <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80004cfc:	ff010113          	addi	sp,sp,-16
    80004d00:	00113423          	sd	ra,8(sp)
    80004d04:	00813023          	sd	s0,0(sp)
    80004d08:	01010413          	addi	s0,sp,16
    80004d0c:	00008797          	auipc	a5,0x8
    80004d10:	ca478793          	addi	a5,a5,-860 # 8000c9b0 <_ZTV8Consumer+0x10>
    80004d14:	00f53023          	sd	a5,0(a0)
    80004d18:	ffffd097          	auipc	ra,0xffffd
    80004d1c:	7b4080e7          	jalr	1972(ra) # 800024cc <_ZN6ThreadD1Ev>
    80004d20:	00813083          	ld	ra,8(sp)
    80004d24:	00013403          	ld	s0,0(sp)
    80004d28:	01010113          	addi	sp,sp,16
    80004d2c:	00008067          	ret

0000000080004d30 <_ZN8ConsumerD0Ev>:
    80004d30:	fe010113          	addi	sp,sp,-32
    80004d34:	00113c23          	sd	ra,24(sp)
    80004d38:	00813823          	sd	s0,16(sp)
    80004d3c:	00913423          	sd	s1,8(sp)
    80004d40:	02010413          	addi	s0,sp,32
    80004d44:	00050493          	mv	s1,a0
    80004d48:	00008797          	auipc	a5,0x8
    80004d4c:	c6878793          	addi	a5,a5,-920 # 8000c9b0 <_ZTV8Consumer+0x10>
    80004d50:	00f53023          	sd	a5,0(a0)
    80004d54:	ffffd097          	auipc	ra,0xffffd
    80004d58:	778080e7          	jalr	1912(ra) # 800024cc <_ZN6ThreadD1Ev>
    80004d5c:	00048513          	mv	a0,s1
    80004d60:	ffffe097          	auipc	ra,0xffffe
    80004d64:	8ac080e7          	jalr	-1876(ra) # 8000260c <_ZdlPv>
    80004d68:	01813083          	ld	ra,24(sp)
    80004d6c:	01013403          	ld	s0,16(sp)
    80004d70:	00813483          	ld	s1,8(sp)
    80004d74:	02010113          	addi	sp,sp,32
    80004d78:	00008067          	ret

0000000080004d7c <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80004d7c:	ff010113          	addi	sp,sp,-16
    80004d80:	00113423          	sd	ra,8(sp)
    80004d84:	00813023          	sd	s0,0(sp)
    80004d88:	01010413          	addi	s0,sp,16
    80004d8c:	00008797          	auipc	a5,0x8
    80004d90:	bd478793          	addi	a5,a5,-1068 # 8000c960 <_ZTV16ProducerKeyborad+0x10>
    80004d94:	00f53023          	sd	a5,0(a0)
    80004d98:	ffffd097          	auipc	ra,0xffffd
    80004d9c:	734080e7          	jalr	1844(ra) # 800024cc <_ZN6ThreadD1Ev>
    80004da0:	00813083          	ld	ra,8(sp)
    80004da4:	00013403          	ld	s0,0(sp)
    80004da8:	01010113          	addi	sp,sp,16
    80004dac:	00008067          	ret

0000000080004db0 <_ZN16ProducerKeyboradD0Ev>:
    80004db0:	fe010113          	addi	sp,sp,-32
    80004db4:	00113c23          	sd	ra,24(sp)
    80004db8:	00813823          	sd	s0,16(sp)
    80004dbc:	00913423          	sd	s1,8(sp)
    80004dc0:	02010413          	addi	s0,sp,32
    80004dc4:	00050493          	mv	s1,a0
    80004dc8:	00008797          	auipc	a5,0x8
    80004dcc:	b9878793          	addi	a5,a5,-1128 # 8000c960 <_ZTV16ProducerKeyborad+0x10>
    80004dd0:	00f53023          	sd	a5,0(a0)
    80004dd4:	ffffd097          	auipc	ra,0xffffd
    80004dd8:	6f8080e7          	jalr	1784(ra) # 800024cc <_ZN6ThreadD1Ev>
    80004ddc:	00048513          	mv	a0,s1
    80004de0:	ffffe097          	auipc	ra,0xffffe
    80004de4:	82c080e7          	jalr	-2004(ra) # 8000260c <_ZdlPv>
    80004de8:	01813083          	ld	ra,24(sp)
    80004dec:	01013403          	ld	s0,16(sp)
    80004df0:	00813483          	ld	s1,8(sp)
    80004df4:	02010113          	addi	sp,sp,32
    80004df8:	00008067          	ret

0000000080004dfc <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80004dfc:	ff010113          	addi	sp,sp,-16
    80004e00:	00113423          	sd	ra,8(sp)
    80004e04:	00813023          	sd	s0,0(sp)
    80004e08:	01010413          	addi	s0,sp,16
    80004e0c:	00008797          	auipc	a5,0x8
    80004e10:	b7c78793          	addi	a5,a5,-1156 # 8000c988 <_ZTV8Producer+0x10>
    80004e14:	00f53023          	sd	a5,0(a0)
    80004e18:	ffffd097          	auipc	ra,0xffffd
    80004e1c:	6b4080e7          	jalr	1716(ra) # 800024cc <_ZN6ThreadD1Ev>
    80004e20:	00813083          	ld	ra,8(sp)
    80004e24:	00013403          	ld	s0,0(sp)
    80004e28:	01010113          	addi	sp,sp,16
    80004e2c:	00008067          	ret

0000000080004e30 <_ZN8ProducerD0Ev>:
    80004e30:	fe010113          	addi	sp,sp,-32
    80004e34:	00113c23          	sd	ra,24(sp)
    80004e38:	00813823          	sd	s0,16(sp)
    80004e3c:	00913423          	sd	s1,8(sp)
    80004e40:	02010413          	addi	s0,sp,32
    80004e44:	00050493          	mv	s1,a0
    80004e48:	00008797          	auipc	a5,0x8
    80004e4c:	b4078793          	addi	a5,a5,-1216 # 8000c988 <_ZTV8Producer+0x10>
    80004e50:	00f53023          	sd	a5,0(a0)
    80004e54:	ffffd097          	auipc	ra,0xffffd
    80004e58:	678080e7          	jalr	1656(ra) # 800024cc <_ZN6ThreadD1Ev>
    80004e5c:	00048513          	mv	a0,s1
    80004e60:	ffffd097          	auipc	ra,0xffffd
    80004e64:	7ac080e7          	jalr	1964(ra) # 8000260c <_ZdlPv>
    80004e68:	01813083          	ld	ra,24(sp)
    80004e6c:	01013403          	ld	s0,16(sp)
    80004e70:	00813483          	ld	s1,8(sp)
    80004e74:	02010113          	addi	sp,sp,32
    80004e78:	00008067          	ret

0000000080004e7c <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80004e7c:	fe010113          	addi	sp,sp,-32
    80004e80:	00113c23          	sd	ra,24(sp)
    80004e84:	00813823          	sd	s0,16(sp)
    80004e88:	00913423          	sd	s1,8(sp)
    80004e8c:	02010413          	addi	s0,sp,32
    80004e90:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80004e94:	ffffc097          	auipc	ra,0xffffc
    80004e98:	6d4080e7          	jalr	1748(ra) # 80001568 <_Z4getcv>
    80004e9c:	0005059b          	sext.w	a1,a0
    80004ea0:	01b00793          	li	a5,27
    80004ea4:	00f58c63          	beq	a1,a5,80004ebc <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80004ea8:	0204b783          	ld	a5,32(s1)
    80004eac:	0087b503          	ld	a0,8(a5)
    80004eb0:	00001097          	auipc	ra,0x1
    80004eb4:	36c080e7          	jalr	876(ra) # 8000621c <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80004eb8:	fddff06f          	j	80004e94 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80004ebc:	00100793          	li	a5,1
    80004ec0:	00008717          	auipc	a4,0x8
    80004ec4:	d6f72c23          	sw	a5,-648(a4) # 8000cc38 <_ZL9threadEnd>
        td->buffer->put('!');
    80004ec8:	0204b783          	ld	a5,32(s1)
    80004ecc:	02100593          	li	a1,33
    80004ed0:	0087b503          	ld	a0,8(a5)
    80004ed4:	00001097          	auipc	ra,0x1
    80004ed8:	348080e7          	jalr	840(ra) # 8000621c <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80004edc:	0204b783          	ld	a5,32(s1)
    80004ee0:	0107b503          	ld	a0,16(a5)
    80004ee4:	ffffe097          	auipc	ra,0xffffe
    80004ee8:	a80080e7          	jalr	-1408(ra) # 80002964 <_ZN9Semaphore6signalEv>
    }
    80004eec:	01813083          	ld	ra,24(sp)
    80004ef0:	01013403          	ld	s0,16(sp)
    80004ef4:	00813483          	ld	s1,8(sp)
    80004ef8:	02010113          	addi	sp,sp,32
    80004efc:	00008067          	ret

0000000080004f00 <_ZN8Producer3runEv>:
    void run() override {
    80004f00:	fe010113          	addi	sp,sp,-32
    80004f04:	00113c23          	sd	ra,24(sp)
    80004f08:	00813823          	sd	s0,16(sp)
    80004f0c:	00913423          	sd	s1,8(sp)
    80004f10:	01213023          	sd	s2,0(sp)
    80004f14:	02010413          	addi	s0,sp,32
    80004f18:	00050493          	mv	s1,a0
        int i = 0;
    80004f1c:	00000913          	li	s2,0
        while (!threadEnd) {
    80004f20:	00008797          	auipc	a5,0x8
    80004f24:	d187a783          	lw	a5,-744(a5) # 8000cc38 <_ZL9threadEnd>
    80004f28:	04079263          	bnez	a5,80004f6c <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    80004f2c:	0204b783          	ld	a5,32(s1)
    80004f30:	0007a583          	lw	a1,0(a5)
    80004f34:	0305859b          	addiw	a1,a1,48
    80004f38:	0087b503          	ld	a0,8(a5)
    80004f3c:	00001097          	auipc	ra,0x1
    80004f40:	2e0080e7          	jalr	736(ra) # 8000621c <_ZN9BufferCPP3putEi>
            i++;
    80004f44:	0019071b          	addiw	a4,s2,1
    80004f48:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    80004f4c:	0204b783          	ld	a5,32(s1)
    80004f50:	0007a783          	lw	a5,0(a5)
    80004f54:	00e787bb          	addw	a5,a5,a4
    80004f58:	00500513          	li	a0,5
    80004f5c:	02a7e53b          	remw	a0,a5,a0
    80004f60:	ffffe097          	auipc	ra,0xffffe
    80004f64:	898080e7          	jalr	-1896(ra) # 800027f8 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80004f68:	fb9ff06f          	j	80004f20 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80004f6c:	0204b783          	ld	a5,32(s1)
    80004f70:	0107b503          	ld	a0,16(a5)
    80004f74:	ffffe097          	auipc	ra,0xffffe
    80004f78:	9f0080e7          	jalr	-1552(ra) # 80002964 <_ZN9Semaphore6signalEv>
    }
    80004f7c:	01813083          	ld	ra,24(sp)
    80004f80:	01013403          	ld	s0,16(sp)
    80004f84:	00813483          	ld	s1,8(sp)
    80004f88:	00013903          	ld	s2,0(sp)
    80004f8c:	02010113          	addi	sp,sp,32
    80004f90:	00008067          	ret

0000000080004f94 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004f94:	fe010113          	addi	sp,sp,-32
    80004f98:	00113c23          	sd	ra,24(sp)
    80004f9c:	00813823          	sd	s0,16(sp)
    80004fa0:	00913423          	sd	s1,8(sp)
    80004fa4:	01213023          	sd	s2,0(sp)
    80004fa8:	02010413          	addi	s0,sp,32
    80004fac:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004fb0:	00100793          	li	a5,1
    80004fb4:	02a7f863          	bgeu	a5,a0,80004fe4 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004fb8:	00a00793          	li	a5,10
    80004fbc:	02f577b3          	remu	a5,a0,a5
    80004fc0:	02078e63          	beqz	a5,80004ffc <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004fc4:	fff48513          	addi	a0,s1,-1
    80004fc8:	00000097          	auipc	ra,0x0
    80004fcc:	fcc080e7          	jalr	-52(ra) # 80004f94 <_ZL9fibonaccim>
    80004fd0:	00050913          	mv	s2,a0
    80004fd4:	ffe48513          	addi	a0,s1,-2
    80004fd8:	00000097          	auipc	ra,0x0
    80004fdc:	fbc080e7          	jalr	-68(ra) # 80004f94 <_ZL9fibonaccim>
    80004fe0:	00a90533          	add	a0,s2,a0
}
    80004fe4:	01813083          	ld	ra,24(sp)
    80004fe8:	01013403          	ld	s0,16(sp)
    80004fec:	00813483          	ld	s1,8(sp)
    80004ff0:	00013903          	ld	s2,0(sp)
    80004ff4:	02010113          	addi	sp,sp,32
    80004ff8:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80004ffc:	ffffc097          	auipc	ra,0xffffc
    80005000:	42c080e7          	jalr	1068(ra) # 80001428 <_Z15thread_dispatchv>
    80005004:	fc1ff06f          	j	80004fc4 <_ZL9fibonaccim+0x30>

0000000080005008 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80005008:	fe010113          	addi	sp,sp,-32
    8000500c:	00113c23          	sd	ra,24(sp)
    80005010:	00813823          	sd	s0,16(sp)
    80005014:	00913423          	sd	s1,8(sp)
    80005018:	01213023          	sd	s2,0(sp)
    8000501c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80005020:	00a00493          	li	s1,10
    80005024:	0400006f          	j	80005064 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005028:	00005517          	auipc	a0,0x5
    8000502c:	35850513          	addi	a0,a0,856 # 8000a380 <CONSOLE_STATUS+0x370>
    80005030:	00001097          	auipc	ra,0x1
    80005034:	dc8080e7          	jalr	-568(ra) # 80005df8 <_Z11printStringPKc>
    80005038:	00000613          	li	a2,0
    8000503c:	00a00593          	li	a1,10
    80005040:	00048513          	mv	a0,s1
    80005044:	00001097          	auipc	ra,0x1
    80005048:	f64080e7          	jalr	-156(ra) # 80005fa8 <_Z8printIntiii>
    8000504c:	00005517          	auipc	a0,0x5
    80005050:	52450513          	addi	a0,a0,1316 # 8000a570 <CONSOLE_STATUS+0x560>
    80005054:	00001097          	auipc	ra,0x1
    80005058:	da4080e7          	jalr	-604(ra) # 80005df8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    8000505c:	0014849b          	addiw	s1,s1,1
    80005060:	0ff4f493          	andi	s1,s1,255
    80005064:	00c00793          	li	a5,12
    80005068:	fc97f0e3          	bgeu	a5,s1,80005028 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    8000506c:	00005517          	auipc	a0,0x5
    80005070:	31c50513          	addi	a0,a0,796 # 8000a388 <CONSOLE_STATUS+0x378>
    80005074:	00001097          	auipc	ra,0x1
    80005078:	d84080e7          	jalr	-636(ra) # 80005df8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    8000507c:	00500313          	li	t1,5
    thread_dispatch();
    80005080:	ffffc097          	auipc	ra,0xffffc
    80005084:	3a8080e7          	jalr	936(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80005088:	01000513          	li	a0,16
    8000508c:	00000097          	auipc	ra,0x0
    80005090:	f08080e7          	jalr	-248(ra) # 80004f94 <_ZL9fibonaccim>
    80005094:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80005098:	00005517          	auipc	a0,0x5
    8000509c:	30050513          	addi	a0,a0,768 # 8000a398 <CONSOLE_STATUS+0x388>
    800050a0:	00001097          	auipc	ra,0x1
    800050a4:	d58080e7          	jalr	-680(ra) # 80005df8 <_Z11printStringPKc>
    800050a8:	00000613          	li	a2,0
    800050ac:	00a00593          	li	a1,10
    800050b0:	0009051b          	sext.w	a0,s2
    800050b4:	00001097          	auipc	ra,0x1
    800050b8:	ef4080e7          	jalr	-268(ra) # 80005fa8 <_Z8printIntiii>
    800050bc:	00005517          	auipc	a0,0x5
    800050c0:	4b450513          	addi	a0,a0,1204 # 8000a570 <CONSOLE_STATUS+0x560>
    800050c4:	00001097          	auipc	ra,0x1
    800050c8:	d34080e7          	jalr	-716(ra) # 80005df8 <_Z11printStringPKc>
    800050cc:	0400006f          	j	8000510c <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800050d0:	00005517          	auipc	a0,0x5
    800050d4:	2b050513          	addi	a0,a0,688 # 8000a380 <CONSOLE_STATUS+0x370>
    800050d8:	00001097          	auipc	ra,0x1
    800050dc:	d20080e7          	jalr	-736(ra) # 80005df8 <_Z11printStringPKc>
    800050e0:	00000613          	li	a2,0
    800050e4:	00a00593          	li	a1,10
    800050e8:	00048513          	mv	a0,s1
    800050ec:	00001097          	auipc	ra,0x1
    800050f0:	ebc080e7          	jalr	-324(ra) # 80005fa8 <_Z8printIntiii>
    800050f4:	00005517          	auipc	a0,0x5
    800050f8:	47c50513          	addi	a0,a0,1148 # 8000a570 <CONSOLE_STATUS+0x560>
    800050fc:	00001097          	auipc	ra,0x1
    80005100:	cfc080e7          	jalr	-772(ra) # 80005df8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80005104:	0014849b          	addiw	s1,s1,1
    80005108:	0ff4f493          	andi	s1,s1,255
    8000510c:	00f00793          	li	a5,15
    80005110:	fc97f0e3          	bgeu	a5,s1,800050d0 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80005114:	00005517          	auipc	a0,0x5
    80005118:	29450513          	addi	a0,a0,660 # 8000a3a8 <CONSOLE_STATUS+0x398>
    8000511c:	00001097          	auipc	ra,0x1
    80005120:	cdc080e7          	jalr	-804(ra) # 80005df8 <_Z11printStringPKc>
    finishedD = true;
    80005124:	00100793          	li	a5,1
    80005128:	00008717          	auipc	a4,0x8
    8000512c:	b2f70023          	sb	a5,-1248(a4) # 8000cc48 <_ZL9finishedD>
    thread_dispatch();
    80005130:	ffffc097          	auipc	ra,0xffffc
    80005134:	2f8080e7          	jalr	760(ra) # 80001428 <_Z15thread_dispatchv>
}
    80005138:	01813083          	ld	ra,24(sp)
    8000513c:	01013403          	ld	s0,16(sp)
    80005140:	00813483          	ld	s1,8(sp)
    80005144:	00013903          	ld	s2,0(sp)
    80005148:	02010113          	addi	sp,sp,32
    8000514c:	00008067          	ret

0000000080005150 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80005150:	fe010113          	addi	sp,sp,-32
    80005154:	00113c23          	sd	ra,24(sp)
    80005158:	00813823          	sd	s0,16(sp)
    8000515c:	00913423          	sd	s1,8(sp)
    80005160:	01213023          	sd	s2,0(sp)
    80005164:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80005168:	00000493          	li	s1,0
    8000516c:	0400006f          	j	800051ac <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80005170:	00005517          	auipc	a0,0x5
    80005174:	1d050513          	addi	a0,a0,464 # 8000a340 <CONSOLE_STATUS+0x330>
    80005178:	00001097          	auipc	ra,0x1
    8000517c:	c80080e7          	jalr	-896(ra) # 80005df8 <_Z11printStringPKc>
    80005180:	00000613          	li	a2,0
    80005184:	00a00593          	li	a1,10
    80005188:	00048513          	mv	a0,s1
    8000518c:	00001097          	auipc	ra,0x1
    80005190:	e1c080e7          	jalr	-484(ra) # 80005fa8 <_Z8printIntiii>
    80005194:	00005517          	auipc	a0,0x5
    80005198:	3dc50513          	addi	a0,a0,988 # 8000a570 <CONSOLE_STATUS+0x560>
    8000519c:	00001097          	auipc	ra,0x1
    800051a0:	c5c080e7          	jalr	-932(ra) # 80005df8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800051a4:	0014849b          	addiw	s1,s1,1
    800051a8:	0ff4f493          	andi	s1,s1,255
    800051ac:	00200793          	li	a5,2
    800051b0:	fc97f0e3          	bgeu	a5,s1,80005170 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    800051b4:	00005517          	auipc	a0,0x5
    800051b8:	19450513          	addi	a0,a0,404 # 8000a348 <CONSOLE_STATUS+0x338>
    800051bc:	00001097          	auipc	ra,0x1
    800051c0:	c3c080e7          	jalr	-964(ra) # 80005df8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800051c4:	00700313          	li	t1,7
    thread_dispatch();
    800051c8:	ffffc097          	auipc	ra,0xffffc
    800051cc:	260080e7          	jalr	608(ra) # 80001428 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800051d0:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    800051d4:	00005517          	auipc	a0,0x5
    800051d8:	18450513          	addi	a0,a0,388 # 8000a358 <CONSOLE_STATUS+0x348>
    800051dc:	00001097          	auipc	ra,0x1
    800051e0:	c1c080e7          	jalr	-996(ra) # 80005df8 <_Z11printStringPKc>
    800051e4:	00000613          	li	a2,0
    800051e8:	00a00593          	li	a1,10
    800051ec:	0009051b          	sext.w	a0,s2
    800051f0:	00001097          	auipc	ra,0x1
    800051f4:	db8080e7          	jalr	-584(ra) # 80005fa8 <_Z8printIntiii>
    800051f8:	00005517          	auipc	a0,0x5
    800051fc:	37850513          	addi	a0,a0,888 # 8000a570 <CONSOLE_STATUS+0x560>
    80005200:	00001097          	auipc	ra,0x1
    80005204:	bf8080e7          	jalr	-1032(ra) # 80005df8 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80005208:	00c00513          	li	a0,12
    8000520c:	00000097          	auipc	ra,0x0
    80005210:	d88080e7          	jalr	-632(ra) # 80004f94 <_ZL9fibonaccim>
    80005214:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80005218:	00005517          	auipc	a0,0x5
    8000521c:	14850513          	addi	a0,a0,328 # 8000a360 <CONSOLE_STATUS+0x350>
    80005220:	00001097          	auipc	ra,0x1
    80005224:	bd8080e7          	jalr	-1064(ra) # 80005df8 <_Z11printStringPKc>
    80005228:	00000613          	li	a2,0
    8000522c:	00a00593          	li	a1,10
    80005230:	0009051b          	sext.w	a0,s2
    80005234:	00001097          	auipc	ra,0x1
    80005238:	d74080e7          	jalr	-652(ra) # 80005fa8 <_Z8printIntiii>
    8000523c:	00005517          	auipc	a0,0x5
    80005240:	33450513          	addi	a0,a0,820 # 8000a570 <CONSOLE_STATUS+0x560>
    80005244:	00001097          	auipc	ra,0x1
    80005248:	bb4080e7          	jalr	-1100(ra) # 80005df8 <_Z11printStringPKc>
    8000524c:	0400006f          	j	8000528c <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80005250:	00005517          	auipc	a0,0x5
    80005254:	0f050513          	addi	a0,a0,240 # 8000a340 <CONSOLE_STATUS+0x330>
    80005258:	00001097          	auipc	ra,0x1
    8000525c:	ba0080e7          	jalr	-1120(ra) # 80005df8 <_Z11printStringPKc>
    80005260:	00000613          	li	a2,0
    80005264:	00a00593          	li	a1,10
    80005268:	00048513          	mv	a0,s1
    8000526c:	00001097          	auipc	ra,0x1
    80005270:	d3c080e7          	jalr	-708(ra) # 80005fa8 <_Z8printIntiii>
    80005274:	00005517          	auipc	a0,0x5
    80005278:	2fc50513          	addi	a0,a0,764 # 8000a570 <CONSOLE_STATUS+0x560>
    8000527c:	00001097          	auipc	ra,0x1
    80005280:	b7c080e7          	jalr	-1156(ra) # 80005df8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80005284:	0014849b          	addiw	s1,s1,1
    80005288:	0ff4f493          	andi	s1,s1,255
    8000528c:	00500793          	li	a5,5
    80005290:	fc97f0e3          	bgeu	a5,s1,80005250 <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    80005294:	00005517          	auipc	a0,0x5
    80005298:	0dc50513          	addi	a0,a0,220 # 8000a370 <CONSOLE_STATUS+0x360>
    8000529c:	00001097          	auipc	ra,0x1
    800052a0:	b5c080e7          	jalr	-1188(ra) # 80005df8 <_Z11printStringPKc>
    finishedC = true;
    800052a4:	00100793          	li	a5,1
    800052a8:	00008717          	auipc	a4,0x8
    800052ac:	9af700a3          	sb	a5,-1631(a4) # 8000cc49 <_ZL9finishedC>
    thread_dispatch();
    800052b0:	ffffc097          	auipc	ra,0xffffc
    800052b4:	178080e7          	jalr	376(ra) # 80001428 <_Z15thread_dispatchv>
}
    800052b8:	01813083          	ld	ra,24(sp)
    800052bc:	01013403          	ld	s0,16(sp)
    800052c0:	00813483          	ld	s1,8(sp)
    800052c4:	00013903          	ld	s2,0(sp)
    800052c8:	02010113          	addi	sp,sp,32
    800052cc:	00008067          	ret

00000000800052d0 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    800052d0:	fe010113          	addi	sp,sp,-32
    800052d4:	00113c23          	sd	ra,24(sp)
    800052d8:	00813823          	sd	s0,16(sp)
    800052dc:	00913423          	sd	s1,8(sp)
    800052e0:	01213023          	sd	s2,0(sp)
    800052e4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800052e8:	00000913          	li	s2,0
    800052ec:	0380006f          	j	80005324 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    800052f0:	ffffc097          	auipc	ra,0xffffc
    800052f4:	138080e7          	jalr	312(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800052f8:	00148493          	addi	s1,s1,1
    800052fc:	000027b7          	lui	a5,0x2
    80005300:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005304:	0097ee63          	bltu	a5,s1,80005320 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005308:	00000713          	li	a4,0
    8000530c:	000077b7          	lui	a5,0x7
    80005310:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005314:	fce7eee3          	bltu	a5,a4,800052f0 <_ZL11workerBodyBPv+0x20>
    80005318:	00170713          	addi	a4,a4,1
    8000531c:	ff1ff06f          	j	8000530c <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80005320:	00190913          	addi	s2,s2,1
    80005324:	00f00793          	li	a5,15
    80005328:	0527e063          	bltu	a5,s2,80005368 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    8000532c:	00005517          	auipc	a0,0x5
    80005330:	ffc50513          	addi	a0,a0,-4 # 8000a328 <CONSOLE_STATUS+0x318>
    80005334:	00001097          	auipc	ra,0x1
    80005338:	ac4080e7          	jalr	-1340(ra) # 80005df8 <_Z11printStringPKc>
    8000533c:	00000613          	li	a2,0
    80005340:	00a00593          	li	a1,10
    80005344:	0009051b          	sext.w	a0,s2
    80005348:	00001097          	auipc	ra,0x1
    8000534c:	c60080e7          	jalr	-928(ra) # 80005fa8 <_Z8printIntiii>
    80005350:	00005517          	auipc	a0,0x5
    80005354:	22050513          	addi	a0,a0,544 # 8000a570 <CONSOLE_STATUS+0x560>
    80005358:	00001097          	auipc	ra,0x1
    8000535c:	aa0080e7          	jalr	-1376(ra) # 80005df8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005360:	00000493          	li	s1,0
    80005364:	f99ff06f          	j	800052fc <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80005368:	00005517          	auipc	a0,0x5
    8000536c:	fc850513          	addi	a0,a0,-56 # 8000a330 <CONSOLE_STATUS+0x320>
    80005370:	00001097          	auipc	ra,0x1
    80005374:	a88080e7          	jalr	-1400(ra) # 80005df8 <_Z11printStringPKc>
    finishedB = true;
    80005378:	00100793          	li	a5,1
    8000537c:	00008717          	auipc	a4,0x8
    80005380:	8cf70723          	sb	a5,-1842(a4) # 8000cc4a <_ZL9finishedB>
    thread_dispatch();
    80005384:	ffffc097          	auipc	ra,0xffffc
    80005388:	0a4080e7          	jalr	164(ra) # 80001428 <_Z15thread_dispatchv>
}
    8000538c:	01813083          	ld	ra,24(sp)
    80005390:	01013403          	ld	s0,16(sp)
    80005394:	00813483          	ld	s1,8(sp)
    80005398:	00013903          	ld	s2,0(sp)
    8000539c:	02010113          	addi	sp,sp,32
    800053a0:	00008067          	ret

00000000800053a4 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    800053a4:	fe010113          	addi	sp,sp,-32
    800053a8:	00113c23          	sd	ra,24(sp)
    800053ac:	00813823          	sd	s0,16(sp)
    800053b0:	00913423          	sd	s1,8(sp)
    800053b4:	01213023          	sd	s2,0(sp)
    800053b8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800053bc:	00000913          	li	s2,0
    800053c0:	0380006f          	j	800053f8 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    800053c4:	ffffc097          	auipc	ra,0xffffc
    800053c8:	064080e7          	jalr	100(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800053cc:	00148493          	addi	s1,s1,1
    800053d0:	000027b7          	lui	a5,0x2
    800053d4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800053d8:	0097ee63          	bltu	a5,s1,800053f4 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800053dc:	00000713          	li	a4,0
    800053e0:	000077b7          	lui	a5,0x7
    800053e4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800053e8:	fce7eee3          	bltu	a5,a4,800053c4 <_ZL11workerBodyAPv+0x20>
    800053ec:	00170713          	addi	a4,a4,1
    800053f0:	ff1ff06f          	j	800053e0 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800053f4:	00190913          	addi	s2,s2,1
    800053f8:	00900793          	li	a5,9
    800053fc:	0527e063          	bltu	a5,s2,8000543c <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80005400:	00005517          	auipc	a0,0x5
    80005404:	f1050513          	addi	a0,a0,-240 # 8000a310 <CONSOLE_STATUS+0x300>
    80005408:	00001097          	auipc	ra,0x1
    8000540c:	9f0080e7          	jalr	-1552(ra) # 80005df8 <_Z11printStringPKc>
    80005410:	00000613          	li	a2,0
    80005414:	00a00593          	li	a1,10
    80005418:	0009051b          	sext.w	a0,s2
    8000541c:	00001097          	auipc	ra,0x1
    80005420:	b8c080e7          	jalr	-1140(ra) # 80005fa8 <_Z8printIntiii>
    80005424:	00005517          	auipc	a0,0x5
    80005428:	14c50513          	addi	a0,a0,332 # 8000a570 <CONSOLE_STATUS+0x560>
    8000542c:	00001097          	auipc	ra,0x1
    80005430:	9cc080e7          	jalr	-1588(ra) # 80005df8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005434:	00000493          	li	s1,0
    80005438:	f99ff06f          	j	800053d0 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    8000543c:	00005517          	auipc	a0,0x5
    80005440:	edc50513          	addi	a0,a0,-292 # 8000a318 <CONSOLE_STATUS+0x308>
    80005444:	00001097          	auipc	ra,0x1
    80005448:	9b4080e7          	jalr	-1612(ra) # 80005df8 <_Z11printStringPKc>
    finishedA = true;
    8000544c:	00100793          	li	a5,1
    80005450:	00007717          	auipc	a4,0x7
    80005454:	7ef70da3          	sb	a5,2043(a4) # 8000cc4b <_ZL9finishedA>
}
    80005458:	01813083          	ld	ra,24(sp)
    8000545c:	01013403          	ld	s0,16(sp)
    80005460:	00813483          	ld	s1,8(sp)
    80005464:	00013903          	ld	s2,0(sp)
    80005468:	02010113          	addi	sp,sp,32
    8000546c:	00008067          	ret

0000000080005470 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80005470:	fd010113          	addi	sp,sp,-48
    80005474:	02113423          	sd	ra,40(sp)
    80005478:	02813023          	sd	s0,32(sp)
    8000547c:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80005480:	00000613          	li	a2,0
    80005484:	00000597          	auipc	a1,0x0
    80005488:	f2058593          	addi	a1,a1,-224 # 800053a4 <_ZL11workerBodyAPv>
    8000548c:	fd040513          	addi	a0,s0,-48
    80005490:	ffffc097          	auipc	ra,0xffffc
    80005494:	ef0080e7          	jalr	-272(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80005498:	00005517          	auipc	a0,0x5
    8000549c:	f2050513          	addi	a0,a0,-224 # 8000a3b8 <CONSOLE_STATUS+0x3a8>
    800054a0:	00001097          	auipc	ra,0x1
    800054a4:	958080e7          	jalr	-1704(ra) # 80005df8 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    800054a8:	00000613          	li	a2,0
    800054ac:	00000597          	auipc	a1,0x0
    800054b0:	e2458593          	addi	a1,a1,-476 # 800052d0 <_ZL11workerBodyBPv>
    800054b4:	fd840513          	addi	a0,s0,-40
    800054b8:	ffffc097          	auipc	ra,0xffffc
    800054bc:	ec8080e7          	jalr	-312(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    800054c0:	00005517          	auipc	a0,0x5
    800054c4:	f1050513          	addi	a0,a0,-240 # 8000a3d0 <CONSOLE_STATUS+0x3c0>
    800054c8:	00001097          	auipc	ra,0x1
    800054cc:	930080e7          	jalr	-1744(ra) # 80005df8 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    800054d0:	00000613          	li	a2,0
    800054d4:	00000597          	auipc	a1,0x0
    800054d8:	c7c58593          	addi	a1,a1,-900 # 80005150 <_ZL11workerBodyCPv>
    800054dc:	fe040513          	addi	a0,s0,-32
    800054e0:	ffffc097          	auipc	ra,0xffffc
    800054e4:	ea0080e7          	jalr	-352(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    800054e8:	00005517          	auipc	a0,0x5
    800054ec:	f0050513          	addi	a0,a0,-256 # 8000a3e8 <CONSOLE_STATUS+0x3d8>
    800054f0:	00001097          	auipc	ra,0x1
    800054f4:	908080e7          	jalr	-1784(ra) # 80005df8 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    800054f8:	00000613          	li	a2,0
    800054fc:	00000597          	auipc	a1,0x0
    80005500:	b0c58593          	addi	a1,a1,-1268 # 80005008 <_ZL11workerBodyDPv>
    80005504:	fe840513          	addi	a0,s0,-24
    80005508:	ffffc097          	auipc	ra,0xffffc
    8000550c:	e78080e7          	jalr	-392(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80005510:	00005517          	auipc	a0,0x5
    80005514:	ef050513          	addi	a0,a0,-272 # 8000a400 <CONSOLE_STATUS+0x3f0>
    80005518:	00001097          	auipc	ra,0x1
    8000551c:	8e0080e7          	jalr	-1824(ra) # 80005df8 <_Z11printStringPKc>
    80005520:	00c0006f          	j	8000552c <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80005524:	ffffc097          	auipc	ra,0xffffc
    80005528:	f04080e7          	jalr	-252(ra) # 80001428 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    8000552c:	00007797          	auipc	a5,0x7
    80005530:	71f7c783          	lbu	a5,1823(a5) # 8000cc4b <_ZL9finishedA>
    80005534:	fe0788e3          	beqz	a5,80005524 <_Z18Threads_C_API_testv+0xb4>
    80005538:	00007797          	auipc	a5,0x7
    8000553c:	7127c783          	lbu	a5,1810(a5) # 8000cc4a <_ZL9finishedB>
    80005540:	fe0782e3          	beqz	a5,80005524 <_Z18Threads_C_API_testv+0xb4>
    80005544:	00007797          	auipc	a5,0x7
    80005548:	7057c783          	lbu	a5,1797(a5) # 8000cc49 <_ZL9finishedC>
    8000554c:	fc078ce3          	beqz	a5,80005524 <_Z18Threads_C_API_testv+0xb4>
    80005550:	00007797          	auipc	a5,0x7
    80005554:	6f87c783          	lbu	a5,1784(a5) # 8000cc48 <_ZL9finishedD>
    80005558:	fc0786e3          	beqz	a5,80005524 <_Z18Threads_C_API_testv+0xb4>
    }

}
    8000555c:	02813083          	ld	ra,40(sp)
    80005560:	02013403          	ld	s0,32(sp)
    80005564:	03010113          	addi	sp,sp,48
    80005568:	00008067          	ret

000000008000556c <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    8000556c:	fd010113          	addi	sp,sp,-48
    80005570:	02113423          	sd	ra,40(sp)
    80005574:	02813023          	sd	s0,32(sp)
    80005578:	00913c23          	sd	s1,24(sp)
    8000557c:	01213823          	sd	s2,16(sp)
    80005580:	01313423          	sd	s3,8(sp)
    80005584:	03010413          	addi	s0,sp,48
    80005588:	00050993          	mv	s3,a0
    8000558c:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80005590:	00000913          	li	s2,0
    80005594:	00c0006f          	j	800055a0 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005598:	ffffd097          	auipc	ra,0xffffd
    8000559c:	238080e7          	jalr	568(ra) # 800027d0 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    800055a0:	ffffc097          	auipc	ra,0xffffc
    800055a4:	fc8080e7          	jalr	-56(ra) # 80001568 <_Z4getcv>
    800055a8:	0005059b          	sext.w	a1,a0
    800055ac:	01b00793          	li	a5,27
    800055b0:	02f58a63          	beq	a1,a5,800055e4 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    800055b4:	0084b503          	ld	a0,8(s1)
    800055b8:	00001097          	auipc	ra,0x1
    800055bc:	c64080e7          	jalr	-924(ra) # 8000621c <_ZN9BufferCPP3putEi>
        i++;
    800055c0:	0019071b          	addiw	a4,s2,1
    800055c4:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800055c8:	0004a683          	lw	a3,0(s1)
    800055cc:	0026979b          	slliw	a5,a3,0x2
    800055d0:	00d787bb          	addw	a5,a5,a3
    800055d4:	0017979b          	slliw	a5,a5,0x1
    800055d8:	02f767bb          	remw	a5,a4,a5
    800055dc:	fc0792e3          	bnez	a5,800055a0 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    800055e0:	fb9ff06f          	j	80005598 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    800055e4:	00100793          	li	a5,1
    800055e8:	00007717          	auipc	a4,0x7
    800055ec:	66f72423          	sw	a5,1640(a4) # 8000cc50 <_ZL9threadEnd>
    td->buffer->put('!');
    800055f0:	0209b783          	ld	a5,32(s3)
    800055f4:	02100593          	li	a1,33
    800055f8:	0087b503          	ld	a0,8(a5)
    800055fc:	00001097          	auipc	ra,0x1
    80005600:	c20080e7          	jalr	-992(ra) # 8000621c <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80005604:	0104b503          	ld	a0,16(s1)
    80005608:	ffffd097          	auipc	ra,0xffffd
    8000560c:	35c080e7          	jalr	860(ra) # 80002964 <_ZN9Semaphore6signalEv>
}
    80005610:	02813083          	ld	ra,40(sp)
    80005614:	02013403          	ld	s0,32(sp)
    80005618:	01813483          	ld	s1,24(sp)
    8000561c:	01013903          	ld	s2,16(sp)
    80005620:	00813983          	ld	s3,8(sp)
    80005624:	03010113          	addi	sp,sp,48
    80005628:	00008067          	ret

000000008000562c <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    8000562c:	fe010113          	addi	sp,sp,-32
    80005630:	00113c23          	sd	ra,24(sp)
    80005634:	00813823          	sd	s0,16(sp)
    80005638:	00913423          	sd	s1,8(sp)
    8000563c:	01213023          	sd	s2,0(sp)
    80005640:	02010413          	addi	s0,sp,32
    80005644:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005648:	00000913          	li	s2,0
    8000564c:	00c0006f          	j	80005658 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005650:	ffffd097          	auipc	ra,0xffffd
    80005654:	180080e7          	jalr	384(ra) # 800027d0 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80005658:	00007797          	auipc	a5,0x7
    8000565c:	5f87a783          	lw	a5,1528(a5) # 8000cc50 <_ZL9threadEnd>
    80005660:	02079e63          	bnez	a5,8000569c <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80005664:	0004a583          	lw	a1,0(s1)
    80005668:	0305859b          	addiw	a1,a1,48
    8000566c:	0084b503          	ld	a0,8(s1)
    80005670:	00001097          	auipc	ra,0x1
    80005674:	bac080e7          	jalr	-1108(ra) # 8000621c <_ZN9BufferCPP3putEi>
        i++;
    80005678:	0019071b          	addiw	a4,s2,1
    8000567c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005680:	0004a683          	lw	a3,0(s1)
    80005684:	0026979b          	slliw	a5,a3,0x2
    80005688:	00d787bb          	addw	a5,a5,a3
    8000568c:	0017979b          	slliw	a5,a5,0x1
    80005690:	02f767bb          	remw	a5,a4,a5
    80005694:	fc0792e3          	bnez	a5,80005658 <_ZN12ProducerSync8producerEPv+0x2c>
    80005698:	fb9ff06f          	j	80005650 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    8000569c:	0104b503          	ld	a0,16(s1)
    800056a0:	ffffd097          	auipc	ra,0xffffd
    800056a4:	2c4080e7          	jalr	708(ra) # 80002964 <_ZN9Semaphore6signalEv>
}
    800056a8:	01813083          	ld	ra,24(sp)
    800056ac:	01013403          	ld	s0,16(sp)
    800056b0:	00813483          	ld	s1,8(sp)
    800056b4:	00013903          	ld	s2,0(sp)
    800056b8:	02010113          	addi	sp,sp,32
    800056bc:	00008067          	ret

00000000800056c0 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    800056c0:	fd010113          	addi	sp,sp,-48
    800056c4:	02113423          	sd	ra,40(sp)
    800056c8:	02813023          	sd	s0,32(sp)
    800056cc:	00913c23          	sd	s1,24(sp)
    800056d0:	01213823          	sd	s2,16(sp)
    800056d4:	01313423          	sd	s3,8(sp)
    800056d8:	01413023          	sd	s4,0(sp)
    800056dc:	03010413          	addi	s0,sp,48
    800056e0:	00050993          	mv	s3,a0
    800056e4:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800056e8:	00000a13          	li	s4,0
    800056ec:	01c0006f          	j	80005708 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    800056f0:	ffffd097          	auipc	ra,0xffffd
    800056f4:	0e0080e7          	jalr	224(ra) # 800027d0 <_ZN6Thread8dispatchEv>
    800056f8:	0500006f          	j	80005748 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    800056fc:	00a00513          	li	a0,10
    80005700:	ffffc097          	auipc	ra,0xffffc
    80005704:	e90080e7          	jalr	-368(ra) # 80001590 <_Z4putcc>
    while (!threadEnd) {
    80005708:	00007797          	auipc	a5,0x7
    8000570c:	5487a783          	lw	a5,1352(a5) # 8000cc50 <_ZL9threadEnd>
    80005710:	06079263          	bnez	a5,80005774 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80005714:	00893503          	ld	a0,8(s2)
    80005718:	00001097          	auipc	ra,0x1
    8000571c:	b94080e7          	jalr	-1132(ra) # 800062ac <_ZN9BufferCPP3getEv>
        i++;
    80005720:	001a049b          	addiw	s1,s4,1
    80005724:	00048a1b          	sext.w	s4,s1
        putc(key);
    80005728:	0ff57513          	andi	a0,a0,255
    8000572c:	ffffc097          	auipc	ra,0xffffc
    80005730:	e64080e7          	jalr	-412(ra) # 80001590 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80005734:	00092703          	lw	a4,0(s2)
    80005738:	0027179b          	slliw	a5,a4,0x2
    8000573c:	00e787bb          	addw	a5,a5,a4
    80005740:	02f4e7bb          	remw	a5,s1,a5
    80005744:	fa0786e3          	beqz	a5,800056f0 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80005748:	05000793          	li	a5,80
    8000574c:	02f4e4bb          	remw	s1,s1,a5
    80005750:	fa049ce3          	bnez	s1,80005708 <_ZN12ConsumerSync8consumerEPv+0x48>
    80005754:	fa9ff06f          	j	800056fc <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80005758:	0209b783          	ld	a5,32(s3)
    8000575c:	0087b503          	ld	a0,8(a5)
    80005760:	00001097          	auipc	ra,0x1
    80005764:	b4c080e7          	jalr	-1204(ra) # 800062ac <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80005768:	0ff57513          	andi	a0,a0,255
    8000576c:	ffffd097          	auipc	ra,0xffffd
    80005770:	2c0080e7          	jalr	704(ra) # 80002a2c <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80005774:	0209b783          	ld	a5,32(s3)
    80005778:	0087b503          	ld	a0,8(a5)
    8000577c:	00001097          	auipc	ra,0x1
    80005780:	bbc080e7          	jalr	-1092(ra) # 80006338 <_ZN9BufferCPP6getCntEv>
    80005784:	fca04ae3          	bgtz	a0,80005758 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80005788:	01093503          	ld	a0,16(s2)
    8000578c:	ffffd097          	auipc	ra,0xffffd
    80005790:	1d8080e7          	jalr	472(ra) # 80002964 <_ZN9Semaphore6signalEv>
}
    80005794:	02813083          	ld	ra,40(sp)
    80005798:	02013403          	ld	s0,32(sp)
    8000579c:	01813483          	ld	s1,24(sp)
    800057a0:	01013903          	ld	s2,16(sp)
    800057a4:	00813983          	ld	s3,8(sp)
    800057a8:	00013a03          	ld	s4,0(sp)
    800057ac:	03010113          	addi	sp,sp,48
    800057b0:	00008067          	ret

00000000800057b4 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    800057b4:	f8010113          	addi	sp,sp,-128
    800057b8:	06113c23          	sd	ra,120(sp)
    800057bc:	06813823          	sd	s0,112(sp)
    800057c0:	06913423          	sd	s1,104(sp)
    800057c4:	07213023          	sd	s2,96(sp)
    800057c8:	05313c23          	sd	s3,88(sp)
    800057cc:	05413823          	sd	s4,80(sp)
    800057d0:	05513423          	sd	s5,72(sp)
    800057d4:	05613023          	sd	s6,64(sp)
    800057d8:	03713c23          	sd	s7,56(sp)
    800057dc:	03813823          	sd	s8,48(sp)
    800057e0:	03913423          	sd	s9,40(sp)
    800057e4:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    800057e8:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    800057ec:	00005517          	auipc	a0,0x5
    800057f0:	a3c50513          	addi	a0,a0,-1476 # 8000a228 <CONSOLE_STATUS+0x218>
    800057f4:	00000097          	auipc	ra,0x0
    800057f8:	604080e7          	jalr	1540(ra) # 80005df8 <_Z11printStringPKc>
    getString(input, 30);
    800057fc:	01e00593          	li	a1,30
    80005800:	f8040493          	addi	s1,s0,-128
    80005804:	00048513          	mv	a0,s1
    80005808:	00000097          	auipc	ra,0x0
    8000580c:	678080e7          	jalr	1656(ra) # 80005e80 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80005810:	00048513          	mv	a0,s1
    80005814:	00000097          	auipc	ra,0x0
    80005818:	744080e7          	jalr	1860(ra) # 80005f58 <_Z11stringToIntPKc>
    8000581c:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80005820:	00005517          	auipc	a0,0x5
    80005824:	a2850513          	addi	a0,a0,-1496 # 8000a248 <CONSOLE_STATUS+0x238>
    80005828:	00000097          	auipc	ra,0x0
    8000582c:	5d0080e7          	jalr	1488(ra) # 80005df8 <_Z11printStringPKc>
    getString(input, 30);
    80005830:	01e00593          	li	a1,30
    80005834:	00048513          	mv	a0,s1
    80005838:	00000097          	auipc	ra,0x0
    8000583c:	648080e7          	jalr	1608(ra) # 80005e80 <_Z9getStringPci>
    n = stringToInt(input);
    80005840:	00048513          	mv	a0,s1
    80005844:	00000097          	auipc	ra,0x0
    80005848:	714080e7          	jalr	1812(ra) # 80005f58 <_Z11stringToIntPKc>
    8000584c:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80005850:	00005517          	auipc	a0,0x5
    80005854:	a1850513          	addi	a0,a0,-1512 # 8000a268 <CONSOLE_STATUS+0x258>
    80005858:	00000097          	auipc	ra,0x0
    8000585c:	5a0080e7          	jalr	1440(ra) # 80005df8 <_Z11printStringPKc>
    80005860:	00000613          	li	a2,0
    80005864:	00a00593          	li	a1,10
    80005868:	00090513          	mv	a0,s2
    8000586c:	00000097          	auipc	ra,0x0
    80005870:	73c080e7          	jalr	1852(ra) # 80005fa8 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005874:	00005517          	auipc	a0,0x5
    80005878:	a0c50513          	addi	a0,a0,-1524 # 8000a280 <CONSOLE_STATUS+0x270>
    8000587c:	00000097          	auipc	ra,0x0
    80005880:	57c080e7          	jalr	1404(ra) # 80005df8 <_Z11printStringPKc>
    80005884:	00000613          	li	a2,0
    80005888:	00a00593          	li	a1,10
    8000588c:	00048513          	mv	a0,s1
    80005890:	00000097          	auipc	ra,0x0
    80005894:	718080e7          	jalr	1816(ra) # 80005fa8 <_Z8printIntiii>
    printString(".\n");
    80005898:	00005517          	auipc	a0,0x5
    8000589c:	a0050513          	addi	a0,a0,-1536 # 8000a298 <CONSOLE_STATUS+0x288>
    800058a0:	00000097          	auipc	ra,0x0
    800058a4:	558080e7          	jalr	1368(ra) # 80005df8 <_Z11printStringPKc>
    if(threadNum > n) {
    800058a8:	0324c463          	blt	s1,s2,800058d0 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    800058ac:	03205c63          	blez	s2,800058e4 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    800058b0:	03800513          	li	a0,56
    800058b4:	ffffd097          	auipc	ra,0xffffd
    800058b8:	d08080e7          	jalr	-760(ra) # 800025bc <_Znwm>
    800058bc:	00050a93          	mv	s5,a0
    800058c0:	00048593          	mv	a1,s1
    800058c4:	00001097          	auipc	ra,0x1
    800058c8:	804080e7          	jalr	-2044(ra) # 800060c8 <_ZN9BufferCPPC1Ei>
    800058cc:	0300006f          	j	800058fc <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800058d0:	00005517          	auipc	a0,0x5
    800058d4:	9d050513          	addi	a0,a0,-1584 # 8000a2a0 <CONSOLE_STATUS+0x290>
    800058d8:	00000097          	auipc	ra,0x0
    800058dc:	520080e7          	jalr	1312(ra) # 80005df8 <_Z11printStringPKc>
        return;
    800058e0:	0140006f          	j	800058f4 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800058e4:	00005517          	auipc	a0,0x5
    800058e8:	9fc50513          	addi	a0,a0,-1540 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    800058ec:	00000097          	auipc	ra,0x0
    800058f0:	50c080e7          	jalr	1292(ra) # 80005df8 <_Z11printStringPKc>
        return;
    800058f4:	000b8113          	mv	sp,s7
    800058f8:	2380006f          	j	80005b30 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    800058fc:	01000513          	li	a0,16
    80005900:	ffffd097          	auipc	ra,0xffffd
    80005904:	cbc080e7          	jalr	-836(ra) # 800025bc <_Znwm>
    80005908:	00050493          	mv	s1,a0
    8000590c:	00000593          	li	a1,0
    80005910:	ffffd097          	auipc	ra,0xffffd
    80005914:	ff0080e7          	jalr	-16(ra) # 80002900 <_ZN9SemaphoreC1Ej>
    80005918:	00007797          	auipc	a5,0x7
    8000591c:	3497b023          	sd	s1,832(a5) # 8000cc58 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80005920:	00391793          	slli	a5,s2,0x3
    80005924:	00f78793          	addi	a5,a5,15
    80005928:	ff07f793          	andi	a5,a5,-16
    8000592c:	40f10133          	sub	sp,sp,a5
    80005930:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80005934:	0019071b          	addiw	a4,s2,1
    80005938:	00171793          	slli	a5,a4,0x1
    8000593c:	00e787b3          	add	a5,a5,a4
    80005940:	00379793          	slli	a5,a5,0x3
    80005944:	00f78793          	addi	a5,a5,15
    80005948:	ff07f793          	andi	a5,a5,-16
    8000594c:	40f10133          	sub	sp,sp,a5
    80005950:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80005954:	00191c13          	slli	s8,s2,0x1
    80005958:	012c07b3          	add	a5,s8,s2
    8000595c:	00379793          	slli	a5,a5,0x3
    80005960:	00fa07b3          	add	a5,s4,a5
    80005964:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80005968:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    8000596c:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80005970:	02800513          	li	a0,40
    80005974:	ffffd097          	auipc	ra,0xffffd
    80005978:	c48080e7          	jalr	-952(ra) # 800025bc <_Znwm>
    8000597c:	00050b13          	mv	s6,a0
    80005980:	012c0c33          	add	s8,s8,s2
    80005984:	003c1c13          	slli	s8,s8,0x3
    80005988:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    8000598c:	ffffd097          	auipc	ra,0xffffd
    80005990:	ef8080e7          	jalr	-264(ra) # 80002884 <_ZN6ThreadC1Ev>
    80005994:	00007797          	auipc	a5,0x7
    80005998:	09478793          	addi	a5,a5,148 # 8000ca28 <_ZTV12ConsumerSync+0x10>
    8000599c:	00fb3023          	sd	a5,0(s6)
    800059a0:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    800059a4:	000b0513          	mv	a0,s6
    800059a8:	ffffd097          	auipc	ra,0xffffd
    800059ac:	dc4080e7          	jalr	-572(ra) # 8000276c <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    800059b0:	00000493          	li	s1,0
    800059b4:	0380006f          	j	800059ec <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    800059b8:	00007797          	auipc	a5,0x7
    800059bc:	04878793          	addi	a5,a5,72 # 8000ca00 <_ZTV12ProducerSync+0x10>
    800059c0:	00fcb023          	sd	a5,0(s9)
    800059c4:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    800059c8:	00349793          	slli	a5,s1,0x3
    800059cc:	00f987b3          	add	a5,s3,a5
    800059d0:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    800059d4:	00349793          	slli	a5,s1,0x3
    800059d8:	00f987b3          	add	a5,s3,a5
    800059dc:	0007b503          	ld	a0,0(a5)
    800059e0:	ffffd097          	auipc	ra,0xffffd
    800059e4:	d8c080e7          	jalr	-628(ra) # 8000276c <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    800059e8:	0014849b          	addiw	s1,s1,1
    800059ec:	0b24d063          	bge	s1,s2,80005a8c <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    800059f0:	00149793          	slli	a5,s1,0x1
    800059f4:	009787b3          	add	a5,a5,s1
    800059f8:	00379793          	slli	a5,a5,0x3
    800059fc:	00fa07b3          	add	a5,s4,a5
    80005a00:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80005a04:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80005a08:	00007717          	auipc	a4,0x7
    80005a0c:	25073703          	ld	a4,592(a4) # 8000cc58 <_ZL10waitForAll>
    80005a10:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80005a14:	02905863          	blez	s1,80005a44 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80005a18:	02800513          	li	a0,40
    80005a1c:	ffffd097          	auipc	ra,0xffffd
    80005a20:	ba0080e7          	jalr	-1120(ra) # 800025bc <_Znwm>
    80005a24:	00050c93          	mv	s9,a0
    80005a28:	00149c13          	slli	s8,s1,0x1
    80005a2c:	009c0c33          	add	s8,s8,s1
    80005a30:	003c1c13          	slli	s8,s8,0x3
    80005a34:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005a38:	ffffd097          	auipc	ra,0xffffd
    80005a3c:	e4c080e7          	jalr	-436(ra) # 80002884 <_ZN6ThreadC1Ev>
    80005a40:	f79ff06f          	j	800059b8 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80005a44:	02800513          	li	a0,40
    80005a48:	ffffd097          	auipc	ra,0xffffd
    80005a4c:	b74080e7          	jalr	-1164(ra) # 800025bc <_Znwm>
    80005a50:	00050c93          	mv	s9,a0
    80005a54:	00149c13          	slli	s8,s1,0x1
    80005a58:	009c0c33          	add	s8,s8,s1
    80005a5c:	003c1c13          	slli	s8,s8,0x3
    80005a60:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80005a64:	ffffd097          	auipc	ra,0xffffd
    80005a68:	e20080e7          	jalr	-480(ra) # 80002884 <_ZN6ThreadC1Ev>
    80005a6c:	00007797          	auipc	a5,0x7
    80005a70:	f6c78793          	addi	a5,a5,-148 # 8000c9d8 <_ZTV16ProducerKeyboard+0x10>
    80005a74:	00fcb023          	sd	a5,0(s9)
    80005a78:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80005a7c:	00349793          	slli	a5,s1,0x3
    80005a80:	00f987b3          	add	a5,s3,a5
    80005a84:	0197b023          	sd	s9,0(a5)
    80005a88:	f4dff06f          	j	800059d4 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80005a8c:	ffffd097          	auipc	ra,0xffffd
    80005a90:	d44080e7          	jalr	-700(ra) # 800027d0 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80005a94:	00000493          	li	s1,0
    80005a98:	00994e63          	blt	s2,s1,80005ab4 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80005a9c:	00007517          	auipc	a0,0x7
    80005aa0:	1bc53503          	ld	a0,444(a0) # 8000cc58 <_ZL10waitForAll>
    80005aa4:	ffffd097          	auipc	ra,0xffffd
    80005aa8:	e94080e7          	jalr	-364(ra) # 80002938 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80005aac:	0014849b          	addiw	s1,s1,1
    80005ab0:	fe9ff06f          	j	80005a98 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80005ab4:	00000493          	li	s1,0
    80005ab8:	0080006f          	j	80005ac0 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80005abc:	0014849b          	addiw	s1,s1,1
    80005ac0:	0324d263          	bge	s1,s2,80005ae4 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80005ac4:	00349793          	slli	a5,s1,0x3
    80005ac8:	00f987b3          	add	a5,s3,a5
    80005acc:	0007b503          	ld	a0,0(a5)
    80005ad0:	fe0506e3          	beqz	a0,80005abc <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80005ad4:	00053783          	ld	a5,0(a0)
    80005ad8:	0087b783          	ld	a5,8(a5)
    80005adc:	000780e7          	jalr	a5
    80005ae0:	fddff06f          	j	80005abc <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80005ae4:	000b0a63          	beqz	s6,80005af8 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80005ae8:	000b3783          	ld	a5,0(s6)
    80005aec:	0087b783          	ld	a5,8(a5)
    80005af0:	000b0513          	mv	a0,s6
    80005af4:	000780e7          	jalr	a5
    delete waitForAll;
    80005af8:	00007517          	auipc	a0,0x7
    80005afc:	16053503          	ld	a0,352(a0) # 8000cc58 <_ZL10waitForAll>
    80005b00:	00050863          	beqz	a0,80005b10 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80005b04:	00053783          	ld	a5,0(a0)
    80005b08:	0087b783          	ld	a5,8(a5)
    80005b0c:	000780e7          	jalr	a5
    delete buffer;
    80005b10:	000a8e63          	beqz	s5,80005b2c <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80005b14:	000a8513          	mv	a0,s5
    80005b18:	00001097          	auipc	ra,0x1
    80005b1c:	8a8080e7          	jalr	-1880(ra) # 800063c0 <_ZN9BufferCPPD1Ev>
    80005b20:	000a8513          	mv	a0,s5
    80005b24:	ffffd097          	auipc	ra,0xffffd
    80005b28:	ae8080e7          	jalr	-1304(ra) # 8000260c <_ZdlPv>
    80005b2c:	000b8113          	mv	sp,s7

}
    80005b30:	f8040113          	addi	sp,s0,-128
    80005b34:	07813083          	ld	ra,120(sp)
    80005b38:	07013403          	ld	s0,112(sp)
    80005b3c:	06813483          	ld	s1,104(sp)
    80005b40:	06013903          	ld	s2,96(sp)
    80005b44:	05813983          	ld	s3,88(sp)
    80005b48:	05013a03          	ld	s4,80(sp)
    80005b4c:	04813a83          	ld	s5,72(sp)
    80005b50:	04013b03          	ld	s6,64(sp)
    80005b54:	03813b83          	ld	s7,56(sp)
    80005b58:	03013c03          	ld	s8,48(sp)
    80005b5c:	02813c83          	ld	s9,40(sp)
    80005b60:	08010113          	addi	sp,sp,128
    80005b64:	00008067          	ret
    80005b68:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80005b6c:	000a8513          	mv	a0,s5
    80005b70:	ffffd097          	auipc	ra,0xffffd
    80005b74:	a9c080e7          	jalr	-1380(ra) # 8000260c <_ZdlPv>
    80005b78:	00048513          	mv	a0,s1
    80005b7c:	00008097          	auipc	ra,0x8
    80005b80:	1bc080e7          	jalr	444(ra) # 8000dd38 <_Unwind_Resume>
    80005b84:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80005b88:	00048513          	mv	a0,s1
    80005b8c:	ffffd097          	auipc	ra,0xffffd
    80005b90:	a80080e7          	jalr	-1408(ra) # 8000260c <_ZdlPv>
    80005b94:	00090513          	mv	a0,s2
    80005b98:	00008097          	auipc	ra,0x8
    80005b9c:	1a0080e7          	jalr	416(ra) # 8000dd38 <_Unwind_Resume>
    80005ba0:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80005ba4:	000b0513          	mv	a0,s6
    80005ba8:	ffffd097          	auipc	ra,0xffffd
    80005bac:	a64080e7          	jalr	-1436(ra) # 8000260c <_ZdlPv>
    80005bb0:	00048513          	mv	a0,s1
    80005bb4:	00008097          	auipc	ra,0x8
    80005bb8:	184080e7          	jalr	388(ra) # 8000dd38 <_Unwind_Resume>
    80005bbc:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80005bc0:	000c8513          	mv	a0,s9
    80005bc4:	ffffd097          	auipc	ra,0xffffd
    80005bc8:	a48080e7          	jalr	-1464(ra) # 8000260c <_ZdlPv>
    80005bcc:	00048513          	mv	a0,s1
    80005bd0:	00008097          	auipc	ra,0x8
    80005bd4:	168080e7          	jalr	360(ra) # 8000dd38 <_Unwind_Resume>
    80005bd8:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80005bdc:	000c8513          	mv	a0,s9
    80005be0:	ffffd097          	auipc	ra,0xffffd
    80005be4:	a2c080e7          	jalr	-1492(ra) # 8000260c <_ZdlPv>
    80005be8:	00048513          	mv	a0,s1
    80005bec:	00008097          	auipc	ra,0x8
    80005bf0:	14c080e7          	jalr	332(ra) # 8000dd38 <_Unwind_Resume>

0000000080005bf4 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80005bf4:	ff010113          	addi	sp,sp,-16
    80005bf8:	00113423          	sd	ra,8(sp)
    80005bfc:	00813023          	sd	s0,0(sp)
    80005c00:	01010413          	addi	s0,sp,16
    80005c04:	00007797          	auipc	a5,0x7
    80005c08:	e2478793          	addi	a5,a5,-476 # 8000ca28 <_ZTV12ConsumerSync+0x10>
    80005c0c:	00f53023          	sd	a5,0(a0)
    80005c10:	ffffd097          	auipc	ra,0xffffd
    80005c14:	8bc080e7          	jalr	-1860(ra) # 800024cc <_ZN6ThreadD1Ev>
    80005c18:	00813083          	ld	ra,8(sp)
    80005c1c:	00013403          	ld	s0,0(sp)
    80005c20:	01010113          	addi	sp,sp,16
    80005c24:	00008067          	ret

0000000080005c28 <_ZN12ConsumerSyncD0Ev>:
    80005c28:	fe010113          	addi	sp,sp,-32
    80005c2c:	00113c23          	sd	ra,24(sp)
    80005c30:	00813823          	sd	s0,16(sp)
    80005c34:	00913423          	sd	s1,8(sp)
    80005c38:	02010413          	addi	s0,sp,32
    80005c3c:	00050493          	mv	s1,a0
    80005c40:	00007797          	auipc	a5,0x7
    80005c44:	de878793          	addi	a5,a5,-536 # 8000ca28 <_ZTV12ConsumerSync+0x10>
    80005c48:	00f53023          	sd	a5,0(a0)
    80005c4c:	ffffd097          	auipc	ra,0xffffd
    80005c50:	880080e7          	jalr	-1920(ra) # 800024cc <_ZN6ThreadD1Ev>
    80005c54:	00048513          	mv	a0,s1
    80005c58:	ffffd097          	auipc	ra,0xffffd
    80005c5c:	9b4080e7          	jalr	-1612(ra) # 8000260c <_ZdlPv>
    80005c60:	01813083          	ld	ra,24(sp)
    80005c64:	01013403          	ld	s0,16(sp)
    80005c68:	00813483          	ld	s1,8(sp)
    80005c6c:	02010113          	addi	sp,sp,32
    80005c70:	00008067          	ret

0000000080005c74 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80005c74:	ff010113          	addi	sp,sp,-16
    80005c78:	00113423          	sd	ra,8(sp)
    80005c7c:	00813023          	sd	s0,0(sp)
    80005c80:	01010413          	addi	s0,sp,16
    80005c84:	00007797          	auipc	a5,0x7
    80005c88:	d7c78793          	addi	a5,a5,-644 # 8000ca00 <_ZTV12ProducerSync+0x10>
    80005c8c:	00f53023          	sd	a5,0(a0)
    80005c90:	ffffd097          	auipc	ra,0xffffd
    80005c94:	83c080e7          	jalr	-1988(ra) # 800024cc <_ZN6ThreadD1Ev>
    80005c98:	00813083          	ld	ra,8(sp)
    80005c9c:	00013403          	ld	s0,0(sp)
    80005ca0:	01010113          	addi	sp,sp,16
    80005ca4:	00008067          	ret

0000000080005ca8 <_ZN12ProducerSyncD0Ev>:
    80005ca8:	fe010113          	addi	sp,sp,-32
    80005cac:	00113c23          	sd	ra,24(sp)
    80005cb0:	00813823          	sd	s0,16(sp)
    80005cb4:	00913423          	sd	s1,8(sp)
    80005cb8:	02010413          	addi	s0,sp,32
    80005cbc:	00050493          	mv	s1,a0
    80005cc0:	00007797          	auipc	a5,0x7
    80005cc4:	d4078793          	addi	a5,a5,-704 # 8000ca00 <_ZTV12ProducerSync+0x10>
    80005cc8:	00f53023          	sd	a5,0(a0)
    80005ccc:	ffffd097          	auipc	ra,0xffffd
    80005cd0:	800080e7          	jalr	-2048(ra) # 800024cc <_ZN6ThreadD1Ev>
    80005cd4:	00048513          	mv	a0,s1
    80005cd8:	ffffd097          	auipc	ra,0xffffd
    80005cdc:	934080e7          	jalr	-1740(ra) # 8000260c <_ZdlPv>
    80005ce0:	01813083          	ld	ra,24(sp)
    80005ce4:	01013403          	ld	s0,16(sp)
    80005ce8:	00813483          	ld	s1,8(sp)
    80005cec:	02010113          	addi	sp,sp,32
    80005cf0:	00008067          	ret

0000000080005cf4 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80005cf4:	ff010113          	addi	sp,sp,-16
    80005cf8:	00113423          	sd	ra,8(sp)
    80005cfc:	00813023          	sd	s0,0(sp)
    80005d00:	01010413          	addi	s0,sp,16
    80005d04:	00007797          	auipc	a5,0x7
    80005d08:	cd478793          	addi	a5,a5,-812 # 8000c9d8 <_ZTV16ProducerKeyboard+0x10>
    80005d0c:	00f53023          	sd	a5,0(a0)
    80005d10:	ffffc097          	auipc	ra,0xffffc
    80005d14:	7bc080e7          	jalr	1980(ra) # 800024cc <_ZN6ThreadD1Ev>
    80005d18:	00813083          	ld	ra,8(sp)
    80005d1c:	00013403          	ld	s0,0(sp)
    80005d20:	01010113          	addi	sp,sp,16
    80005d24:	00008067          	ret

0000000080005d28 <_ZN16ProducerKeyboardD0Ev>:
    80005d28:	fe010113          	addi	sp,sp,-32
    80005d2c:	00113c23          	sd	ra,24(sp)
    80005d30:	00813823          	sd	s0,16(sp)
    80005d34:	00913423          	sd	s1,8(sp)
    80005d38:	02010413          	addi	s0,sp,32
    80005d3c:	00050493          	mv	s1,a0
    80005d40:	00007797          	auipc	a5,0x7
    80005d44:	c9878793          	addi	a5,a5,-872 # 8000c9d8 <_ZTV16ProducerKeyboard+0x10>
    80005d48:	00f53023          	sd	a5,0(a0)
    80005d4c:	ffffc097          	auipc	ra,0xffffc
    80005d50:	780080e7          	jalr	1920(ra) # 800024cc <_ZN6ThreadD1Ev>
    80005d54:	00048513          	mv	a0,s1
    80005d58:	ffffd097          	auipc	ra,0xffffd
    80005d5c:	8b4080e7          	jalr	-1868(ra) # 8000260c <_ZdlPv>
    80005d60:	01813083          	ld	ra,24(sp)
    80005d64:	01013403          	ld	s0,16(sp)
    80005d68:	00813483          	ld	s1,8(sp)
    80005d6c:	02010113          	addi	sp,sp,32
    80005d70:	00008067          	ret

0000000080005d74 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80005d74:	ff010113          	addi	sp,sp,-16
    80005d78:	00113423          	sd	ra,8(sp)
    80005d7c:	00813023          	sd	s0,0(sp)
    80005d80:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80005d84:	02053583          	ld	a1,32(a0)
    80005d88:	fffff097          	auipc	ra,0xfffff
    80005d8c:	7e4080e7          	jalr	2020(ra) # 8000556c <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80005d90:	00813083          	ld	ra,8(sp)
    80005d94:	00013403          	ld	s0,0(sp)
    80005d98:	01010113          	addi	sp,sp,16
    80005d9c:	00008067          	ret

0000000080005da0 <_ZN12ProducerSync3runEv>:
    void run() override {
    80005da0:	ff010113          	addi	sp,sp,-16
    80005da4:	00113423          	sd	ra,8(sp)
    80005da8:	00813023          	sd	s0,0(sp)
    80005dac:	01010413          	addi	s0,sp,16
        producer(td);
    80005db0:	02053583          	ld	a1,32(a0)
    80005db4:	00000097          	auipc	ra,0x0
    80005db8:	878080e7          	jalr	-1928(ra) # 8000562c <_ZN12ProducerSync8producerEPv>
    }
    80005dbc:	00813083          	ld	ra,8(sp)
    80005dc0:	00013403          	ld	s0,0(sp)
    80005dc4:	01010113          	addi	sp,sp,16
    80005dc8:	00008067          	ret

0000000080005dcc <_ZN12ConsumerSync3runEv>:
    void run() override {
    80005dcc:	ff010113          	addi	sp,sp,-16
    80005dd0:	00113423          	sd	ra,8(sp)
    80005dd4:	00813023          	sd	s0,0(sp)
    80005dd8:	01010413          	addi	s0,sp,16
        consumer(td);
    80005ddc:	02053583          	ld	a1,32(a0)
    80005de0:	00000097          	auipc	ra,0x0
    80005de4:	8e0080e7          	jalr	-1824(ra) # 800056c0 <_ZN12ConsumerSync8consumerEPv>
    }
    80005de8:	00813083          	ld	ra,8(sp)
    80005dec:	00013403          	ld	s0,0(sp)
    80005df0:	01010113          	addi	sp,sp,16
    80005df4:	00008067          	ret

0000000080005df8 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80005df8:	fe010113          	addi	sp,sp,-32
    80005dfc:	00113c23          	sd	ra,24(sp)
    80005e00:	00813823          	sd	s0,16(sp)
    80005e04:	00913423          	sd	s1,8(sp)
    80005e08:	02010413          	addi	s0,sp,32
    80005e0c:	00050493          	mv	s1,a0
    LOCK();
    80005e10:	00100613          	li	a2,1
    80005e14:	00000593          	li	a1,0
    80005e18:	00007517          	auipc	a0,0x7
    80005e1c:	e4850513          	addi	a0,a0,-440 # 8000cc60 <lockPrint>
    80005e20:	ffffb097          	auipc	ra,0xffffb
    80005e24:	404080e7          	jalr	1028(ra) # 80001224 <copy_and_swap>
    80005e28:	00050863          	beqz	a0,80005e38 <_Z11printStringPKc+0x40>
    80005e2c:	ffffb097          	auipc	ra,0xffffb
    80005e30:	5fc080e7          	jalr	1532(ra) # 80001428 <_Z15thread_dispatchv>
    80005e34:	fddff06f          	j	80005e10 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80005e38:	0004c503          	lbu	a0,0(s1)
    80005e3c:	00050a63          	beqz	a0,80005e50 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80005e40:	ffffb097          	auipc	ra,0xffffb
    80005e44:	750080e7          	jalr	1872(ra) # 80001590 <_Z4putcc>
        string++;
    80005e48:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80005e4c:	fedff06f          	j	80005e38 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80005e50:	00000613          	li	a2,0
    80005e54:	00100593          	li	a1,1
    80005e58:	00007517          	auipc	a0,0x7
    80005e5c:	e0850513          	addi	a0,a0,-504 # 8000cc60 <lockPrint>
    80005e60:	ffffb097          	auipc	ra,0xffffb
    80005e64:	3c4080e7          	jalr	964(ra) # 80001224 <copy_and_swap>
    80005e68:	fe0514e3          	bnez	a0,80005e50 <_Z11printStringPKc+0x58>
}
    80005e6c:	01813083          	ld	ra,24(sp)
    80005e70:	01013403          	ld	s0,16(sp)
    80005e74:	00813483          	ld	s1,8(sp)
    80005e78:	02010113          	addi	sp,sp,32
    80005e7c:	00008067          	ret

0000000080005e80 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80005e80:	fd010113          	addi	sp,sp,-48
    80005e84:	02113423          	sd	ra,40(sp)
    80005e88:	02813023          	sd	s0,32(sp)
    80005e8c:	00913c23          	sd	s1,24(sp)
    80005e90:	01213823          	sd	s2,16(sp)
    80005e94:	01313423          	sd	s3,8(sp)
    80005e98:	01413023          	sd	s4,0(sp)
    80005e9c:	03010413          	addi	s0,sp,48
    80005ea0:	00050993          	mv	s3,a0
    80005ea4:	00058a13          	mv	s4,a1
    LOCK();
    80005ea8:	00100613          	li	a2,1
    80005eac:	00000593          	li	a1,0
    80005eb0:	00007517          	auipc	a0,0x7
    80005eb4:	db050513          	addi	a0,a0,-592 # 8000cc60 <lockPrint>
    80005eb8:	ffffb097          	auipc	ra,0xffffb
    80005ebc:	36c080e7          	jalr	876(ra) # 80001224 <copy_and_swap>
    80005ec0:	00050863          	beqz	a0,80005ed0 <_Z9getStringPci+0x50>
    80005ec4:	ffffb097          	auipc	ra,0xffffb
    80005ec8:	564080e7          	jalr	1380(ra) # 80001428 <_Z15thread_dispatchv>
    80005ecc:	fddff06f          	j	80005ea8 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80005ed0:	00000913          	li	s2,0
    80005ed4:	00090493          	mv	s1,s2
    80005ed8:	0019091b          	addiw	s2,s2,1
    80005edc:	03495a63          	bge	s2,s4,80005f10 <_Z9getStringPci+0x90>
        cc = getc();
    80005ee0:	ffffb097          	auipc	ra,0xffffb
    80005ee4:	688080e7          	jalr	1672(ra) # 80001568 <_Z4getcv>
        if(cc < 1)
    80005ee8:	02050463          	beqz	a0,80005f10 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80005eec:	009984b3          	add	s1,s3,s1
    80005ef0:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80005ef4:	00a00793          	li	a5,10
    80005ef8:	00f50a63          	beq	a0,a5,80005f0c <_Z9getStringPci+0x8c>
    80005efc:	00d00793          	li	a5,13
    80005f00:	fcf51ae3          	bne	a0,a5,80005ed4 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80005f04:	00090493          	mv	s1,s2
    80005f08:	0080006f          	j	80005f10 <_Z9getStringPci+0x90>
    80005f0c:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80005f10:	009984b3          	add	s1,s3,s1
    80005f14:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80005f18:	00000613          	li	a2,0
    80005f1c:	00100593          	li	a1,1
    80005f20:	00007517          	auipc	a0,0x7
    80005f24:	d4050513          	addi	a0,a0,-704 # 8000cc60 <lockPrint>
    80005f28:	ffffb097          	auipc	ra,0xffffb
    80005f2c:	2fc080e7          	jalr	764(ra) # 80001224 <copy_and_swap>
    80005f30:	fe0514e3          	bnez	a0,80005f18 <_Z9getStringPci+0x98>
    return buf;
}
    80005f34:	00098513          	mv	a0,s3
    80005f38:	02813083          	ld	ra,40(sp)
    80005f3c:	02013403          	ld	s0,32(sp)
    80005f40:	01813483          	ld	s1,24(sp)
    80005f44:	01013903          	ld	s2,16(sp)
    80005f48:	00813983          	ld	s3,8(sp)
    80005f4c:	00013a03          	ld	s4,0(sp)
    80005f50:	03010113          	addi	sp,sp,48
    80005f54:	00008067          	ret

0000000080005f58 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80005f58:	ff010113          	addi	sp,sp,-16
    80005f5c:	00813423          	sd	s0,8(sp)
    80005f60:	01010413          	addi	s0,sp,16
    80005f64:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80005f68:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80005f6c:	0006c603          	lbu	a2,0(a3)
    80005f70:	fd06071b          	addiw	a4,a2,-48
    80005f74:	0ff77713          	andi	a4,a4,255
    80005f78:	00900793          	li	a5,9
    80005f7c:	02e7e063          	bltu	a5,a4,80005f9c <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80005f80:	0025179b          	slliw	a5,a0,0x2
    80005f84:	00a787bb          	addw	a5,a5,a0
    80005f88:	0017979b          	slliw	a5,a5,0x1
    80005f8c:	00168693          	addi	a3,a3,1
    80005f90:	00c787bb          	addw	a5,a5,a2
    80005f94:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80005f98:	fd5ff06f          	j	80005f6c <_Z11stringToIntPKc+0x14>
    return n;
}
    80005f9c:	00813403          	ld	s0,8(sp)
    80005fa0:	01010113          	addi	sp,sp,16
    80005fa4:	00008067          	ret

0000000080005fa8 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80005fa8:	fc010113          	addi	sp,sp,-64
    80005fac:	02113c23          	sd	ra,56(sp)
    80005fb0:	02813823          	sd	s0,48(sp)
    80005fb4:	02913423          	sd	s1,40(sp)
    80005fb8:	03213023          	sd	s2,32(sp)
    80005fbc:	01313c23          	sd	s3,24(sp)
    80005fc0:	04010413          	addi	s0,sp,64
    80005fc4:	00050493          	mv	s1,a0
    80005fc8:	00058913          	mv	s2,a1
    80005fcc:	00060993          	mv	s3,a2
    LOCK();
    80005fd0:	00100613          	li	a2,1
    80005fd4:	00000593          	li	a1,0
    80005fd8:	00007517          	auipc	a0,0x7
    80005fdc:	c8850513          	addi	a0,a0,-888 # 8000cc60 <lockPrint>
    80005fe0:	ffffb097          	auipc	ra,0xffffb
    80005fe4:	244080e7          	jalr	580(ra) # 80001224 <copy_and_swap>
    80005fe8:	00050863          	beqz	a0,80005ff8 <_Z8printIntiii+0x50>
    80005fec:	ffffb097          	auipc	ra,0xffffb
    80005ff0:	43c080e7          	jalr	1084(ra) # 80001428 <_Z15thread_dispatchv>
    80005ff4:	fddff06f          	j	80005fd0 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80005ff8:	00098463          	beqz	s3,80006000 <_Z8printIntiii+0x58>
    80005ffc:	0804c463          	bltz	s1,80006084 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80006000:	0004851b          	sext.w	a0,s1
    neg = 0;
    80006004:	00000593          	li	a1,0
    }

    i = 0;
    80006008:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    8000600c:	0009079b          	sext.w	a5,s2
    80006010:	0325773b          	remuw	a4,a0,s2
    80006014:	00048613          	mv	a2,s1
    80006018:	0014849b          	addiw	s1,s1,1
    8000601c:	02071693          	slli	a3,a4,0x20
    80006020:	0206d693          	srli	a3,a3,0x20
    80006024:	00007717          	auipc	a4,0x7
    80006028:	a1c70713          	addi	a4,a4,-1508 # 8000ca40 <digits>
    8000602c:	00d70733          	add	a4,a4,a3
    80006030:	00074683          	lbu	a3,0(a4)
    80006034:	fd040713          	addi	a4,s0,-48
    80006038:	00c70733          	add	a4,a4,a2
    8000603c:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80006040:	0005071b          	sext.w	a4,a0
    80006044:	0325553b          	divuw	a0,a0,s2
    80006048:	fcf772e3          	bgeu	a4,a5,8000600c <_Z8printIntiii+0x64>
    if(neg)
    8000604c:	00058c63          	beqz	a1,80006064 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80006050:	fd040793          	addi	a5,s0,-48
    80006054:	009784b3          	add	s1,a5,s1
    80006058:	02d00793          	li	a5,45
    8000605c:	fef48823          	sb	a5,-16(s1)
    80006060:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80006064:	fff4849b          	addiw	s1,s1,-1
    80006068:	0204c463          	bltz	s1,80006090 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    8000606c:	fd040793          	addi	a5,s0,-48
    80006070:	009787b3          	add	a5,a5,s1
    80006074:	ff07c503          	lbu	a0,-16(a5)
    80006078:	ffffb097          	auipc	ra,0xffffb
    8000607c:	518080e7          	jalr	1304(ra) # 80001590 <_Z4putcc>
    80006080:	fe5ff06f          	j	80006064 <_Z8printIntiii+0xbc>
        x = -xx;
    80006084:	4090053b          	negw	a0,s1
        neg = 1;
    80006088:	00100593          	li	a1,1
        x = -xx;
    8000608c:	f7dff06f          	j	80006008 <_Z8printIntiii+0x60>

    UNLOCK();
    80006090:	00000613          	li	a2,0
    80006094:	00100593          	li	a1,1
    80006098:	00007517          	auipc	a0,0x7
    8000609c:	bc850513          	addi	a0,a0,-1080 # 8000cc60 <lockPrint>
    800060a0:	ffffb097          	auipc	ra,0xffffb
    800060a4:	184080e7          	jalr	388(ra) # 80001224 <copy_and_swap>
    800060a8:	fe0514e3          	bnez	a0,80006090 <_Z8printIntiii+0xe8>
    800060ac:	03813083          	ld	ra,56(sp)
    800060b0:	03013403          	ld	s0,48(sp)
    800060b4:	02813483          	ld	s1,40(sp)
    800060b8:	02013903          	ld	s2,32(sp)
    800060bc:	01813983          	ld	s3,24(sp)
    800060c0:	04010113          	addi	sp,sp,64
    800060c4:	00008067          	ret

00000000800060c8 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    800060c8:	fd010113          	addi	sp,sp,-48
    800060cc:	02113423          	sd	ra,40(sp)
    800060d0:	02813023          	sd	s0,32(sp)
    800060d4:	00913c23          	sd	s1,24(sp)
    800060d8:	01213823          	sd	s2,16(sp)
    800060dc:	01313423          	sd	s3,8(sp)
    800060e0:	03010413          	addi	s0,sp,48
    800060e4:	00050493          	mv	s1,a0
    800060e8:	00058913          	mv	s2,a1
    800060ec:	0015879b          	addiw	a5,a1,1
    800060f0:	0007851b          	sext.w	a0,a5
    800060f4:	00f4a023          	sw	a5,0(s1)
    800060f8:	0004a823          	sw	zero,16(s1)
    800060fc:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006100:	00251513          	slli	a0,a0,0x2
    80006104:	ffffb097          	auipc	ra,0xffffb
    80006108:	20c080e7          	jalr	524(ra) # 80001310 <_Z9mem_allocm>
    8000610c:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80006110:	01000513          	li	a0,16
    80006114:	ffffc097          	auipc	ra,0xffffc
    80006118:	4a8080e7          	jalr	1192(ra) # 800025bc <_Znwm>
    8000611c:	00050993          	mv	s3,a0
    80006120:	00000593          	li	a1,0
    80006124:	ffffc097          	auipc	ra,0xffffc
    80006128:	7dc080e7          	jalr	2012(ra) # 80002900 <_ZN9SemaphoreC1Ej>
    8000612c:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80006130:	01000513          	li	a0,16
    80006134:	ffffc097          	auipc	ra,0xffffc
    80006138:	488080e7          	jalr	1160(ra) # 800025bc <_Znwm>
    8000613c:	00050993          	mv	s3,a0
    80006140:	00090593          	mv	a1,s2
    80006144:	ffffc097          	auipc	ra,0xffffc
    80006148:	7bc080e7          	jalr	1980(ra) # 80002900 <_ZN9SemaphoreC1Ej>
    8000614c:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80006150:	01000513          	li	a0,16
    80006154:	ffffc097          	auipc	ra,0xffffc
    80006158:	468080e7          	jalr	1128(ra) # 800025bc <_Znwm>
    8000615c:	00050913          	mv	s2,a0
    80006160:	00100593          	li	a1,1
    80006164:	ffffc097          	auipc	ra,0xffffc
    80006168:	79c080e7          	jalr	1948(ra) # 80002900 <_ZN9SemaphoreC1Ej>
    8000616c:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80006170:	01000513          	li	a0,16
    80006174:	ffffc097          	auipc	ra,0xffffc
    80006178:	448080e7          	jalr	1096(ra) # 800025bc <_Znwm>
    8000617c:	00050913          	mv	s2,a0
    80006180:	00100593          	li	a1,1
    80006184:	ffffc097          	auipc	ra,0xffffc
    80006188:	77c080e7          	jalr	1916(ra) # 80002900 <_ZN9SemaphoreC1Ej>
    8000618c:	0324b823          	sd	s2,48(s1)
}
    80006190:	02813083          	ld	ra,40(sp)
    80006194:	02013403          	ld	s0,32(sp)
    80006198:	01813483          	ld	s1,24(sp)
    8000619c:	01013903          	ld	s2,16(sp)
    800061a0:	00813983          	ld	s3,8(sp)
    800061a4:	03010113          	addi	sp,sp,48
    800061a8:	00008067          	ret
    800061ac:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    800061b0:	00098513          	mv	a0,s3
    800061b4:	ffffc097          	auipc	ra,0xffffc
    800061b8:	458080e7          	jalr	1112(ra) # 8000260c <_ZdlPv>
    800061bc:	00048513          	mv	a0,s1
    800061c0:	00008097          	auipc	ra,0x8
    800061c4:	b78080e7          	jalr	-1160(ra) # 8000dd38 <_Unwind_Resume>
    800061c8:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    800061cc:	00098513          	mv	a0,s3
    800061d0:	ffffc097          	auipc	ra,0xffffc
    800061d4:	43c080e7          	jalr	1084(ra) # 8000260c <_ZdlPv>
    800061d8:	00048513          	mv	a0,s1
    800061dc:	00008097          	auipc	ra,0x8
    800061e0:	b5c080e7          	jalr	-1188(ra) # 8000dd38 <_Unwind_Resume>
    800061e4:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    800061e8:	00090513          	mv	a0,s2
    800061ec:	ffffc097          	auipc	ra,0xffffc
    800061f0:	420080e7          	jalr	1056(ra) # 8000260c <_ZdlPv>
    800061f4:	00048513          	mv	a0,s1
    800061f8:	00008097          	auipc	ra,0x8
    800061fc:	b40080e7          	jalr	-1216(ra) # 8000dd38 <_Unwind_Resume>
    80006200:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80006204:	00090513          	mv	a0,s2
    80006208:	ffffc097          	auipc	ra,0xffffc
    8000620c:	404080e7          	jalr	1028(ra) # 8000260c <_ZdlPv>
    80006210:	00048513          	mv	a0,s1
    80006214:	00008097          	auipc	ra,0x8
    80006218:	b24080e7          	jalr	-1244(ra) # 8000dd38 <_Unwind_Resume>

000000008000621c <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    8000621c:	fe010113          	addi	sp,sp,-32
    80006220:	00113c23          	sd	ra,24(sp)
    80006224:	00813823          	sd	s0,16(sp)
    80006228:	00913423          	sd	s1,8(sp)
    8000622c:	01213023          	sd	s2,0(sp)
    80006230:	02010413          	addi	s0,sp,32
    80006234:	00050493          	mv	s1,a0
    80006238:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    8000623c:	01853503          	ld	a0,24(a0)
    80006240:	ffffc097          	auipc	ra,0xffffc
    80006244:	6f8080e7          	jalr	1784(ra) # 80002938 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80006248:	0304b503          	ld	a0,48(s1)
    8000624c:	ffffc097          	auipc	ra,0xffffc
    80006250:	6ec080e7          	jalr	1772(ra) # 80002938 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80006254:	0084b783          	ld	a5,8(s1)
    80006258:	0144a703          	lw	a4,20(s1)
    8000625c:	00271713          	slli	a4,a4,0x2
    80006260:	00e787b3          	add	a5,a5,a4
    80006264:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006268:	0144a783          	lw	a5,20(s1)
    8000626c:	0017879b          	addiw	a5,a5,1
    80006270:	0004a703          	lw	a4,0(s1)
    80006274:	02e7e7bb          	remw	a5,a5,a4
    80006278:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    8000627c:	0304b503          	ld	a0,48(s1)
    80006280:	ffffc097          	auipc	ra,0xffffc
    80006284:	6e4080e7          	jalr	1764(ra) # 80002964 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80006288:	0204b503          	ld	a0,32(s1)
    8000628c:	ffffc097          	auipc	ra,0xffffc
    80006290:	6d8080e7          	jalr	1752(ra) # 80002964 <_ZN9Semaphore6signalEv>

}
    80006294:	01813083          	ld	ra,24(sp)
    80006298:	01013403          	ld	s0,16(sp)
    8000629c:	00813483          	ld	s1,8(sp)
    800062a0:	00013903          	ld	s2,0(sp)
    800062a4:	02010113          	addi	sp,sp,32
    800062a8:	00008067          	ret

00000000800062ac <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    800062ac:	fe010113          	addi	sp,sp,-32
    800062b0:	00113c23          	sd	ra,24(sp)
    800062b4:	00813823          	sd	s0,16(sp)
    800062b8:	00913423          	sd	s1,8(sp)
    800062bc:	01213023          	sd	s2,0(sp)
    800062c0:	02010413          	addi	s0,sp,32
    800062c4:	00050493          	mv	s1,a0
    itemAvailable->wait();
    800062c8:	02053503          	ld	a0,32(a0)
    800062cc:	ffffc097          	auipc	ra,0xffffc
    800062d0:	66c080e7          	jalr	1644(ra) # 80002938 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    800062d4:	0284b503          	ld	a0,40(s1)
    800062d8:	ffffc097          	auipc	ra,0xffffc
    800062dc:	660080e7          	jalr	1632(ra) # 80002938 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    800062e0:	0084b703          	ld	a4,8(s1)
    800062e4:	0104a783          	lw	a5,16(s1)
    800062e8:	00279693          	slli	a3,a5,0x2
    800062ec:	00d70733          	add	a4,a4,a3
    800062f0:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    800062f4:	0017879b          	addiw	a5,a5,1
    800062f8:	0004a703          	lw	a4,0(s1)
    800062fc:	02e7e7bb          	remw	a5,a5,a4
    80006300:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80006304:	0284b503          	ld	a0,40(s1)
    80006308:	ffffc097          	auipc	ra,0xffffc
    8000630c:	65c080e7          	jalr	1628(ra) # 80002964 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80006310:	0184b503          	ld	a0,24(s1)
    80006314:	ffffc097          	auipc	ra,0xffffc
    80006318:	650080e7          	jalr	1616(ra) # 80002964 <_ZN9Semaphore6signalEv>

    return ret;
}
    8000631c:	00090513          	mv	a0,s2
    80006320:	01813083          	ld	ra,24(sp)
    80006324:	01013403          	ld	s0,16(sp)
    80006328:	00813483          	ld	s1,8(sp)
    8000632c:	00013903          	ld	s2,0(sp)
    80006330:	02010113          	addi	sp,sp,32
    80006334:	00008067          	ret

0000000080006338 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80006338:	fe010113          	addi	sp,sp,-32
    8000633c:	00113c23          	sd	ra,24(sp)
    80006340:	00813823          	sd	s0,16(sp)
    80006344:	00913423          	sd	s1,8(sp)
    80006348:	01213023          	sd	s2,0(sp)
    8000634c:	02010413          	addi	s0,sp,32
    80006350:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80006354:	02853503          	ld	a0,40(a0)
    80006358:	ffffc097          	auipc	ra,0xffffc
    8000635c:	5e0080e7          	jalr	1504(ra) # 80002938 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80006360:	0304b503          	ld	a0,48(s1)
    80006364:	ffffc097          	auipc	ra,0xffffc
    80006368:	5d4080e7          	jalr	1492(ra) # 80002938 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    8000636c:	0144a783          	lw	a5,20(s1)
    80006370:	0104a903          	lw	s2,16(s1)
    80006374:	0327ce63          	blt	a5,s2,800063b0 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80006378:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    8000637c:	0304b503          	ld	a0,48(s1)
    80006380:	ffffc097          	auipc	ra,0xffffc
    80006384:	5e4080e7          	jalr	1508(ra) # 80002964 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80006388:	0284b503          	ld	a0,40(s1)
    8000638c:	ffffc097          	auipc	ra,0xffffc
    80006390:	5d8080e7          	jalr	1496(ra) # 80002964 <_ZN9Semaphore6signalEv>

    return ret;
}
    80006394:	00090513          	mv	a0,s2
    80006398:	01813083          	ld	ra,24(sp)
    8000639c:	01013403          	ld	s0,16(sp)
    800063a0:	00813483          	ld	s1,8(sp)
    800063a4:	00013903          	ld	s2,0(sp)
    800063a8:	02010113          	addi	sp,sp,32
    800063ac:	00008067          	ret
        ret = cap - head + tail;
    800063b0:	0004a703          	lw	a4,0(s1)
    800063b4:	4127093b          	subw	s2,a4,s2
    800063b8:	00f9093b          	addw	s2,s2,a5
    800063bc:	fc1ff06f          	j	8000637c <_ZN9BufferCPP6getCntEv+0x44>

00000000800063c0 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    800063c0:	fe010113          	addi	sp,sp,-32
    800063c4:	00113c23          	sd	ra,24(sp)
    800063c8:	00813823          	sd	s0,16(sp)
    800063cc:	00913423          	sd	s1,8(sp)
    800063d0:	02010413          	addi	s0,sp,32
    800063d4:	00050493          	mv	s1,a0
    Console::putc('\n');
    800063d8:	00a00513          	li	a0,10
    800063dc:	ffffc097          	auipc	ra,0xffffc
    800063e0:	650080e7          	jalr	1616(ra) # 80002a2c <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    800063e4:	00004517          	auipc	a0,0x4
    800063e8:	03450513          	addi	a0,a0,52 # 8000a418 <CONSOLE_STATUS+0x408>
    800063ec:	00000097          	auipc	ra,0x0
    800063f0:	a0c080e7          	jalr	-1524(ra) # 80005df8 <_Z11printStringPKc>
    while (getCnt()) {
    800063f4:	00048513          	mv	a0,s1
    800063f8:	00000097          	auipc	ra,0x0
    800063fc:	f40080e7          	jalr	-192(ra) # 80006338 <_ZN9BufferCPP6getCntEv>
    80006400:	02050c63          	beqz	a0,80006438 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80006404:	0084b783          	ld	a5,8(s1)
    80006408:	0104a703          	lw	a4,16(s1)
    8000640c:	00271713          	slli	a4,a4,0x2
    80006410:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80006414:	0007c503          	lbu	a0,0(a5)
    80006418:	ffffc097          	auipc	ra,0xffffc
    8000641c:	614080e7          	jalr	1556(ra) # 80002a2c <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80006420:	0104a783          	lw	a5,16(s1)
    80006424:	0017879b          	addiw	a5,a5,1
    80006428:	0004a703          	lw	a4,0(s1)
    8000642c:	02e7e7bb          	remw	a5,a5,a4
    80006430:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80006434:	fc1ff06f          	j	800063f4 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80006438:	02100513          	li	a0,33
    8000643c:	ffffc097          	auipc	ra,0xffffc
    80006440:	5f0080e7          	jalr	1520(ra) # 80002a2c <_ZN7Console4putcEc>
    Console::putc('\n');
    80006444:	00a00513          	li	a0,10
    80006448:	ffffc097          	auipc	ra,0xffffc
    8000644c:	5e4080e7          	jalr	1508(ra) # 80002a2c <_ZN7Console4putcEc>
    mem_free(buffer);
    80006450:	0084b503          	ld	a0,8(s1)
    80006454:	ffffb097          	auipc	ra,0xffffb
    80006458:	efc080e7          	jalr	-260(ra) # 80001350 <_Z8mem_freePv>
    delete itemAvailable;
    8000645c:	0204b503          	ld	a0,32(s1)
    80006460:	00050863          	beqz	a0,80006470 <_ZN9BufferCPPD1Ev+0xb0>
    80006464:	00053783          	ld	a5,0(a0)
    80006468:	0087b783          	ld	a5,8(a5)
    8000646c:	000780e7          	jalr	a5
    delete spaceAvailable;
    80006470:	0184b503          	ld	a0,24(s1)
    80006474:	00050863          	beqz	a0,80006484 <_ZN9BufferCPPD1Ev+0xc4>
    80006478:	00053783          	ld	a5,0(a0)
    8000647c:	0087b783          	ld	a5,8(a5)
    80006480:	000780e7          	jalr	a5
    delete mutexTail;
    80006484:	0304b503          	ld	a0,48(s1)
    80006488:	00050863          	beqz	a0,80006498 <_ZN9BufferCPPD1Ev+0xd8>
    8000648c:	00053783          	ld	a5,0(a0)
    80006490:	0087b783          	ld	a5,8(a5)
    80006494:	000780e7          	jalr	a5
    delete mutexHead;
    80006498:	0284b503          	ld	a0,40(s1)
    8000649c:	00050863          	beqz	a0,800064ac <_ZN9BufferCPPD1Ev+0xec>
    800064a0:	00053783          	ld	a5,0(a0)
    800064a4:	0087b783          	ld	a5,8(a5)
    800064a8:	000780e7          	jalr	a5
}
    800064ac:	01813083          	ld	ra,24(sp)
    800064b0:	01013403          	ld	s0,16(sp)
    800064b4:	00813483          	ld	s1,8(sp)
    800064b8:	02010113          	addi	sp,sp,32
    800064bc:	00008067          	ret

00000000800064c0 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    800064c0:	fe010113          	addi	sp,sp,-32
    800064c4:	00113c23          	sd	ra,24(sp)
    800064c8:	00813823          	sd	s0,16(sp)
    800064cc:	00913423          	sd	s1,8(sp)
    800064d0:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    800064d4:	00004517          	auipc	a0,0x4
    800064d8:	f5c50513          	addi	a0,a0,-164 # 8000a430 <CONSOLE_STATUS+0x420>
    800064dc:	00000097          	auipc	ra,0x0
    800064e0:	91c080e7          	jalr	-1764(ra) # 80005df8 <_Z11printStringPKc>
    int test = getc() - '0';
    800064e4:	ffffb097          	auipc	ra,0xffffb
    800064e8:	084080e7          	jalr	132(ra) # 80001568 <_Z4getcv>
    800064ec:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    800064f0:	ffffb097          	auipc	ra,0xffffb
    800064f4:	078080e7          	jalr	120(ra) # 80001568 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    800064f8:	00700793          	li	a5,7
    800064fc:	1097e263          	bltu	a5,s1,80006600 <_Z8userMainv+0x140>
    80006500:	00249493          	slli	s1,s1,0x2
    80006504:	00004717          	auipc	a4,0x4
    80006508:	18470713          	addi	a4,a4,388 # 8000a688 <CONSOLE_STATUS+0x678>
    8000650c:	00e484b3          	add	s1,s1,a4
    80006510:	0004a783          	lw	a5,0(s1)
    80006514:	00e787b3          	add	a5,a5,a4
    80006518:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    8000651c:	fffff097          	auipc	ra,0xfffff
    80006520:	f54080e7          	jalr	-172(ra) # 80005470 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80006524:	00004517          	auipc	a0,0x4
    80006528:	f2c50513          	addi	a0,a0,-212 # 8000a450 <CONSOLE_STATUS+0x440>
    8000652c:	00000097          	auipc	ra,0x0
    80006530:	8cc080e7          	jalr	-1844(ra) # 80005df8 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80006534:	01813083          	ld	ra,24(sp)
    80006538:	01013403          	ld	s0,16(sp)
    8000653c:	00813483          	ld	s1,8(sp)
    80006540:	02010113          	addi	sp,sp,32
    80006544:	00008067          	ret
            Threads_CPP_API_test();
    80006548:	ffffe097          	auipc	ra,0xffffe
    8000654c:	e08080e7          	jalr	-504(ra) # 80004350 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80006550:	00004517          	auipc	a0,0x4
    80006554:	f4050513          	addi	a0,a0,-192 # 8000a490 <CONSOLE_STATUS+0x480>
    80006558:	00000097          	auipc	ra,0x0
    8000655c:	8a0080e7          	jalr	-1888(ra) # 80005df8 <_Z11printStringPKc>
            break;
    80006560:	fd5ff06f          	j	80006534 <_Z8userMainv+0x74>
            producerConsumer_C_API();
    80006564:	ffffd097          	auipc	ra,0xffffd
    80006568:	640080e7          	jalr	1600(ra) # 80003ba4 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    8000656c:	00004517          	auipc	a0,0x4
    80006570:	f6450513          	addi	a0,a0,-156 # 8000a4d0 <CONSOLE_STATUS+0x4c0>
    80006574:	00000097          	auipc	ra,0x0
    80006578:	884080e7          	jalr	-1916(ra) # 80005df8 <_Z11printStringPKc>
            break;
    8000657c:	fb9ff06f          	j	80006534 <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    80006580:	fffff097          	auipc	ra,0xfffff
    80006584:	234080e7          	jalr	564(ra) # 800057b4 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80006588:	00004517          	auipc	a0,0x4
    8000658c:	f9850513          	addi	a0,a0,-104 # 8000a520 <CONSOLE_STATUS+0x510>
    80006590:	00000097          	auipc	ra,0x0
    80006594:	868080e7          	jalr	-1944(ra) # 80005df8 <_Z11printStringPKc>
            break;
    80006598:	f9dff06f          	j	80006534 <_Z8userMainv+0x74>
            testSleeping();
    8000659c:	00000097          	auipc	ra,0x0
    800065a0:	11c080e7          	jalr	284(ra) # 800066b8 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    800065a4:	00004517          	auipc	a0,0x4
    800065a8:	fd450513          	addi	a0,a0,-44 # 8000a578 <CONSOLE_STATUS+0x568>
    800065ac:	00000097          	auipc	ra,0x0
    800065b0:	84c080e7          	jalr	-1972(ra) # 80005df8 <_Z11printStringPKc>
            break;
    800065b4:	f81ff06f          	j	80006534 <_Z8userMainv+0x74>
            testConsumerProducer();
    800065b8:	ffffe097          	auipc	ra,0xffffe
    800065bc:	258080e7          	jalr	600(ra) # 80004810 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    800065c0:	00004517          	auipc	a0,0x4
    800065c4:	fe850513          	addi	a0,a0,-24 # 8000a5a8 <CONSOLE_STATUS+0x598>
    800065c8:	00000097          	auipc	ra,0x0
    800065cc:	830080e7          	jalr	-2000(ra) # 80005df8 <_Z11printStringPKc>
            break;
    800065d0:	f65ff06f          	j	80006534 <_Z8userMainv+0x74>
            System_Mode_test();
    800065d4:	00000097          	auipc	ra,0x0
    800065d8:	658080e7          	jalr	1624(ra) # 80006c2c <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    800065dc:	00004517          	auipc	a0,0x4
    800065e0:	00c50513          	addi	a0,a0,12 # 8000a5e8 <CONSOLE_STATUS+0x5d8>
    800065e4:	00000097          	auipc	ra,0x0
    800065e8:	814080e7          	jalr	-2028(ra) # 80005df8 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    800065ec:	00004517          	auipc	a0,0x4
    800065f0:	01c50513          	addi	a0,a0,28 # 8000a608 <CONSOLE_STATUS+0x5f8>
    800065f4:	00000097          	auipc	ra,0x0
    800065f8:	804080e7          	jalr	-2044(ra) # 80005df8 <_Z11printStringPKc>
            break;
    800065fc:	f39ff06f          	j	80006534 <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    80006600:	00004517          	auipc	a0,0x4
    80006604:	06050513          	addi	a0,a0,96 # 8000a660 <CONSOLE_STATUS+0x650>
    80006608:	fffff097          	auipc	ra,0xfffff
    8000660c:	7f0080e7          	jalr	2032(ra) # 80005df8 <_Z11printStringPKc>
    80006610:	f25ff06f          	j	80006534 <_Z8userMainv+0x74>

0000000080006614 <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    80006614:	fe010113          	addi	sp,sp,-32
    80006618:	00113c23          	sd	ra,24(sp)
    8000661c:	00813823          	sd	s0,16(sp)
    80006620:	00913423          	sd	s1,8(sp)
    80006624:	01213023          	sd	s2,0(sp)
    80006628:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    8000662c:	00053903          	ld	s2,0(a0)
    int i = 6;
    80006630:	00600493          	li	s1,6
    while (--i > 0) {
    80006634:	fff4849b          	addiw	s1,s1,-1
    80006638:	04905463          	blez	s1,80006680 <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    8000663c:	00004517          	auipc	a0,0x4
    80006640:	06c50513          	addi	a0,a0,108 # 8000a6a8 <CONSOLE_STATUS+0x698>
    80006644:	fffff097          	auipc	ra,0xfffff
    80006648:	7b4080e7          	jalr	1972(ra) # 80005df8 <_Z11printStringPKc>
        printInt(sleep_time);
    8000664c:	00000613          	li	a2,0
    80006650:	00a00593          	li	a1,10
    80006654:	0009051b          	sext.w	a0,s2
    80006658:	00000097          	auipc	ra,0x0
    8000665c:	950080e7          	jalr	-1712(ra) # 80005fa8 <_Z8printIntiii>
        printString(" !\n");
    80006660:	00004517          	auipc	a0,0x4
    80006664:	05050513          	addi	a0,a0,80 # 8000a6b0 <CONSOLE_STATUS+0x6a0>
    80006668:	fffff097          	auipc	ra,0xfffff
    8000666c:	790080e7          	jalr	1936(ra) # 80005df8 <_Z11printStringPKc>
        time_sleep(sleep_time);
    80006670:	00090513          	mv	a0,s2
    80006674:	ffffb097          	auipc	ra,0xffffb
    80006678:	dfc080e7          	jalr	-516(ra) # 80001470 <_Z10time_sleepm>
    while (--i > 0) {
    8000667c:	fb9ff06f          	j	80006634 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    80006680:	00a00793          	li	a5,10
    80006684:	02f95933          	divu	s2,s2,a5
    80006688:	fff90913          	addi	s2,s2,-1
    8000668c:	00006797          	auipc	a5,0x6
    80006690:	5dc78793          	addi	a5,a5,1500 # 8000cc68 <_ZL8finished>
    80006694:	01278933          	add	s2,a5,s2
    80006698:	00100793          	li	a5,1
    8000669c:	00f90023          	sb	a5,0(s2)
}
    800066a0:	01813083          	ld	ra,24(sp)
    800066a4:	01013403          	ld	s0,16(sp)
    800066a8:	00813483          	ld	s1,8(sp)
    800066ac:	00013903          	ld	s2,0(sp)
    800066b0:	02010113          	addi	sp,sp,32
    800066b4:	00008067          	ret

00000000800066b8 <_Z12testSleepingv>:

void testSleeping() {
    800066b8:	fc010113          	addi	sp,sp,-64
    800066bc:	02113c23          	sd	ra,56(sp)
    800066c0:	02813823          	sd	s0,48(sp)
    800066c4:	02913423          	sd	s1,40(sp)
    800066c8:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    800066cc:	00a00793          	li	a5,10
    800066d0:	fcf43823          	sd	a5,-48(s0)
    800066d4:	01400793          	li	a5,20
    800066d8:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    800066dc:	00000493          	li	s1,0
    800066e0:	02c0006f          	j	8000670c <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    800066e4:	00349793          	slli	a5,s1,0x3
    800066e8:	fd040613          	addi	a2,s0,-48
    800066ec:	00f60633          	add	a2,a2,a5
    800066f0:	00000597          	auipc	a1,0x0
    800066f4:	f2458593          	addi	a1,a1,-220 # 80006614 <_ZL9sleepyRunPv>
    800066f8:	fc040513          	addi	a0,s0,-64
    800066fc:	00f50533          	add	a0,a0,a5
    80006700:	ffffb097          	auipc	ra,0xffffb
    80006704:	c80080e7          	jalr	-896(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80006708:	0014849b          	addiw	s1,s1,1
    8000670c:	00100793          	li	a5,1
    80006710:	fc97dae3          	bge	a5,s1,800066e4 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    80006714:	00006797          	auipc	a5,0x6
    80006718:	5547c783          	lbu	a5,1364(a5) # 8000cc68 <_ZL8finished>
    8000671c:	fe078ce3          	beqz	a5,80006714 <_Z12testSleepingv+0x5c>
    80006720:	00006797          	auipc	a5,0x6
    80006724:	5497c783          	lbu	a5,1353(a5) # 8000cc69 <_ZL8finished+0x1>
    80006728:	fe0786e3          	beqz	a5,80006714 <_Z12testSleepingv+0x5c>
}
    8000672c:	03813083          	ld	ra,56(sp)
    80006730:	03013403          	ld	s0,48(sp)
    80006734:	02813483          	ld	s1,40(sp)
    80006738:	04010113          	addi	sp,sp,64
    8000673c:	00008067          	ret

0000000080006740 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80006740:	fe010113          	addi	sp,sp,-32
    80006744:	00113c23          	sd	ra,24(sp)
    80006748:	00813823          	sd	s0,16(sp)
    8000674c:	00913423          	sd	s1,8(sp)
    80006750:	01213023          	sd	s2,0(sp)
    80006754:	02010413          	addi	s0,sp,32
    80006758:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    8000675c:	00100793          	li	a5,1
    80006760:	02a7f863          	bgeu	a5,a0,80006790 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80006764:	00a00793          	li	a5,10
    80006768:	02f577b3          	remu	a5,a0,a5
    8000676c:	02078e63          	beqz	a5,800067a8 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80006770:	fff48513          	addi	a0,s1,-1
    80006774:	00000097          	auipc	ra,0x0
    80006778:	fcc080e7          	jalr	-52(ra) # 80006740 <_ZL9fibonaccim>
    8000677c:	00050913          	mv	s2,a0
    80006780:	ffe48513          	addi	a0,s1,-2
    80006784:	00000097          	auipc	ra,0x0
    80006788:	fbc080e7          	jalr	-68(ra) # 80006740 <_ZL9fibonaccim>
    8000678c:	00a90533          	add	a0,s2,a0
}
    80006790:	01813083          	ld	ra,24(sp)
    80006794:	01013403          	ld	s0,16(sp)
    80006798:	00813483          	ld	s1,8(sp)
    8000679c:	00013903          	ld	s2,0(sp)
    800067a0:	02010113          	addi	sp,sp,32
    800067a4:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800067a8:	ffffb097          	auipc	ra,0xffffb
    800067ac:	c80080e7          	jalr	-896(ra) # 80001428 <_Z15thread_dispatchv>
    800067b0:	fc1ff06f          	j	80006770 <_ZL9fibonaccim+0x30>

00000000800067b4 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    800067b4:	fe010113          	addi	sp,sp,-32
    800067b8:	00113c23          	sd	ra,24(sp)
    800067bc:	00813823          	sd	s0,16(sp)
    800067c0:	00913423          	sd	s1,8(sp)
    800067c4:	01213023          	sd	s2,0(sp)
    800067c8:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800067cc:	00a00493          	li	s1,10
    800067d0:	0400006f          	j	80006810 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800067d4:	00004517          	auipc	a0,0x4
    800067d8:	bac50513          	addi	a0,a0,-1108 # 8000a380 <CONSOLE_STATUS+0x370>
    800067dc:	fffff097          	auipc	ra,0xfffff
    800067e0:	61c080e7          	jalr	1564(ra) # 80005df8 <_Z11printStringPKc>
    800067e4:	00000613          	li	a2,0
    800067e8:	00a00593          	li	a1,10
    800067ec:	00048513          	mv	a0,s1
    800067f0:	fffff097          	auipc	ra,0xfffff
    800067f4:	7b8080e7          	jalr	1976(ra) # 80005fa8 <_Z8printIntiii>
    800067f8:	00004517          	auipc	a0,0x4
    800067fc:	d7850513          	addi	a0,a0,-648 # 8000a570 <CONSOLE_STATUS+0x560>
    80006800:	fffff097          	auipc	ra,0xfffff
    80006804:	5f8080e7          	jalr	1528(ra) # 80005df8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80006808:	0014849b          	addiw	s1,s1,1
    8000680c:	0ff4f493          	andi	s1,s1,255
    80006810:	00c00793          	li	a5,12
    80006814:	fc97f0e3          	bgeu	a5,s1,800067d4 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80006818:	00004517          	auipc	a0,0x4
    8000681c:	b7050513          	addi	a0,a0,-1168 # 8000a388 <CONSOLE_STATUS+0x378>
    80006820:	fffff097          	auipc	ra,0xfffff
    80006824:	5d8080e7          	jalr	1496(ra) # 80005df8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80006828:	00500313          	li	t1,5
    thread_dispatch();
    8000682c:	ffffb097          	auipc	ra,0xffffb
    80006830:	bfc080e7          	jalr	-1028(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80006834:	01000513          	li	a0,16
    80006838:	00000097          	auipc	ra,0x0
    8000683c:	f08080e7          	jalr	-248(ra) # 80006740 <_ZL9fibonaccim>
    80006840:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80006844:	00004517          	auipc	a0,0x4
    80006848:	b5450513          	addi	a0,a0,-1196 # 8000a398 <CONSOLE_STATUS+0x388>
    8000684c:	fffff097          	auipc	ra,0xfffff
    80006850:	5ac080e7          	jalr	1452(ra) # 80005df8 <_Z11printStringPKc>
    80006854:	00000613          	li	a2,0
    80006858:	00a00593          	li	a1,10
    8000685c:	0009051b          	sext.w	a0,s2
    80006860:	fffff097          	auipc	ra,0xfffff
    80006864:	748080e7          	jalr	1864(ra) # 80005fa8 <_Z8printIntiii>
    80006868:	00004517          	auipc	a0,0x4
    8000686c:	d0850513          	addi	a0,a0,-760 # 8000a570 <CONSOLE_STATUS+0x560>
    80006870:	fffff097          	auipc	ra,0xfffff
    80006874:	588080e7          	jalr	1416(ra) # 80005df8 <_Z11printStringPKc>
    80006878:	0400006f          	j	800068b8 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000687c:	00004517          	auipc	a0,0x4
    80006880:	b0450513          	addi	a0,a0,-1276 # 8000a380 <CONSOLE_STATUS+0x370>
    80006884:	fffff097          	auipc	ra,0xfffff
    80006888:	574080e7          	jalr	1396(ra) # 80005df8 <_Z11printStringPKc>
    8000688c:	00000613          	li	a2,0
    80006890:	00a00593          	li	a1,10
    80006894:	00048513          	mv	a0,s1
    80006898:	fffff097          	auipc	ra,0xfffff
    8000689c:	710080e7          	jalr	1808(ra) # 80005fa8 <_Z8printIntiii>
    800068a0:	00004517          	auipc	a0,0x4
    800068a4:	cd050513          	addi	a0,a0,-816 # 8000a570 <CONSOLE_STATUS+0x560>
    800068a8:	fffff097          	auipc	ra,0xfffff
    800068ac:	550080e7          	jalr	1360(ra) # 80005df8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    800068b0:	0014849b          	addiw	s1,s1,1
    800068b4:	0ff4f493          	andi	s1,s1,255
    800068b8:	00f00793          	li	a5,15
    800068bc:	fc97f0e3          	bgeu	a5,s1,8000687c <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    800068c0:	00004517          	auipc	a0,0x4
    800068c4:	ae850513          	addi	a0,a0,-1304 # 8000a3a8 <CONSOLE_STATUS+0x398>
    800068c8:	fffff097          	auipc	ra,0xfffff
    800068cc:	530080e7          	jalr	1328(ra) # 80005df8 <_Z11printStringPKc>
    finishedD = true;
    800068d0:	00100793          	li	a5,1
    800068d4:	00006717          	auipc	a4,0x6
    800068d8:	38f70b23          	sb	a5,918(a4) # 8000cc6a <_ZL9finishedD>
    thread_dispatch();
    800068dc:	ffffb097          	auipc	ra,0xffffb
    800068e0:	b4c080e7          	jalr	-1204(ra) # 80001428 <_Z15thread_dispatchv>
}
    800068e4:	01813083          	ld	ra,24(sp)
    800068e8:	01013403          	ld	s0,16(sp)
    800068ec:	00813483          	ld	s1,8(sp)
    800068f0:	00013903          	ld	s2,0(sp)
    800068f4:	02010113          	addi	sp,sp,32
    800068f8:	00008067          	ret

00000000800068fc <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800068fc:	fe010113          	addi	sp,sp,-32
    80006900:	00113c23          	sd	ra,24(sp)
    80006904:	00813823          	sd	s0,16(sp)
    80006908:	00913423          	sd	s1,8(sp)
    8000690c:	01213023          	sd	s2,0(sp)
    80006910:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80006914:	00000493          	li	s1,0
    80006918:	0400006f          	j	80006958 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    8000691c:	00004517          	auipc	a0,0x4
    80006920:	a2450513          	addi	a0,a0,-1500 # 8000a340 <CONSOLE_STATUS+0x330>
    80006924:	fffff097          	auipc	ra,0xfffff
    80006928:	4d4080e7          	jalr	1236(ra) # 80005df8 <_Z11printStringPKc>
    8000692c:	00000613          	li	a2,0
    80006930:	00a00593          	li	a1,10
    80006934:	00048513          	mv	a0,s1
    80006938:	fffff097          	auipc	ra,0xfffff
    8000693c:	670080e7          	jalr	1648(ra) # 80005fa8 <_Z8printIntiii>
    80006940:	00004517          	auipc	a0,0x4
    80006944:	c3050513          	addi	a0,a0,-976 # 8000a570 <CONSOLE_STATUS+0x560>
    80006948:	fffff097          	auipc	ra,0xfffff
    8000694c:	4b0080e7          	jalr	1200(ra) # 80005df8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80006950:	0014849b          	addiw	s1,s1,1
    80006954:	0ff4f493          	andi	s1,s1,255
    80006958:	00200793          	li	a5,2
    8000695c:	fc97f0e3          	bgeu	a5,s1,8000691c <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80006960:	00004517          	auipc	a0,0x4
    80006964:	9e850513          	addi	a0,a0,-1560 # 8000a348 <CONSOLE_STATUS+0x338>
    80006968:	fffff097          	auipc	ra,0xfffff
    8000696c:	490080e7          	jalr	1168(ra) # 80005df8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80006970:	00700313          	li	t1,7
    thread_dispatch();
    80006974:	ffffb097          	auipc	ra,0xffffb
    80006978:	ab4080e7          	jalr	-1356(ra) # 80001428 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    8000697c:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80006980:	00004517          	auipc	a0,0x4
    80006984:	9d850513          	addi	a0,a0,-1576 # 8000a358 <CONSOLE_STATUS+0x348>
    80006988:	fffff097          	auipc	ra,0xfffff
    8000698c:	470080e7          	jalr	1136(ra) # 80005df8 <_Z11printStringPKc>
    80006990:	00000613          	li	a2,0
    80006994:	00a00593          	li	a1,10
    80006998:	0009051b          	sext.w	a0,s2
    8000699c:	fffff097          	auipc	ra,0xfffff
    800069a0:	60c080e7          	jalr	1548(ra) # 80005fa8 <_Z8printIntiii>
    800069a4:	00004517          	auipc	a0,0x4
    800069a8:	bcc50513          	addi	a0,a0,-1076 # 8000a570 <CONSOLE_STATUS+0x560>
    800069ac:	fffff097          	auipc	ra,0xfffff
    800069b0:	44c080e7          	jalr	1100(ra) # 80005df8 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    800069b4:	00c00513          	li	a0,12
    800069b8:	00000097          	auipc	ra,0x0
    800069bc:	d88080e7          	jalr	-632(ra) # 80006740 <_ZL9fibonaccim>
    800069c0:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800069c4:	00004517          	auipc	a0,0x4
    800069c8:	99c50513          	addi	a0,a0,-1636 # 8000a360 <CONSOLE_STATUS+0x350>
    800069cc:	fffff097          	auipc	ra,0xfffff
    800069d0:	42c080e7          	jalr	1068(ra) # 80005df8 <_Z11printStringPKc>
    800069d4:	00000613          	li	a2,0
    800069d8:	00a00593          	li	a1,10
    800069dc:	0009051b          	sext.w	a0,s2
    800069e0:	fffff097          	auipc	ra,0xfffff
    800069e4:	5c8080e7          	jalr	1480(ra) # 80005fa8 <_Z8printIntiii>
    800069e8:	00004517          	auipc	a0,0x4
    800069ec:	b8850513          	addi	a0,a0,-1144 # 8000a570 <CONSOLE_STATUS+0x560>
    800069f0:	fffff097          	auipc	ra,0xfffff
    800069f4:	408080e7          	jalr	1032(ra) # 80005df8 <_Z11printStringPKc>
    800069f8:	0400006f          	j	80006a38 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800069fc:	00004517          	auipc	a0,0x4
    80006a00:	94450513          	addi	a0,a0,-1724 # 8000a340 <CONSOLE_STATUS+0x330>
    80006a04:	fffff097          	auipc	ra,0xfffff
    80006a08:	3f4080e7          	jalr	1012(ra) # 80005df8 <_Z11printStringPKc>
    80006a0c:	00000613          	li	a2,0
    80006a10:	00a00593          	li	a1,10
    80006a14:	00048513          	mv	a0,s1
    80006a18:	fffff097          	auipc	ra,0xfffff
    80006a1c:	590080e7          	jalr	1424(ra) # 80005fa8 <_Z8printIntiii>
    80006a20:	00004517          	auipc	a0,0x4
    80006a24:	b5050513          	addi	a0,a0,-1200 # 8000a570 <CONSOLE_STATUS+0x560>
    80006a28:	fffff097          	auipc	ra,0xfffff
    80006a2c:	3d0080e7          	jalr	976(ra) # 80005df8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80006a30:	0014849b          	addiw	s1,s1,1
    80006a34:	0ff4f493          	andi	s1,s1,255
    80006a38:	00500793          	li	a5,5
    80006a3c:	fc97f0e3          	bgeu	a5,s1,800069fc <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80006a40:	00004517          	auipc	a0,0x4
    80006a44:	8d850513          	addi	a0,a0,-1832 # 8000a318 <CONSOLE_STATUS+0x308>
    80006a48:	fffff097          	auipc	ra,0xfffff
    80006a4c:	3b0080e7          	jalr	944(ra) # 80005df8 <_Z11printStringPKc>
    finishedC = true;
    80006a50:	00100793          	li	a5,1
    80006a54:	00006717          	auipc	a4,0x6
    80006a58:	20f70ba3          	sb	a5,535(a4) # 8000cc6b <_ZL9finishedC>
    thread_dispatch();
    80006a5c:	ffffb097          	auipc	ra,0xffffb
    80006a60:	9cc080e7          	jalr	-1588(ra) # 80001428 <_Z15thread_dispatchv>
}
    80006a64:	01813083          	ld	ra,24(sp)
    80006a68:	01013403          	ld	s0,16(sp)
    80006a6c:	00813483          	ld	s1,8(sp)
    80006a70:	00013903          	ld	s2,0(sp)
    80006a74:	02010113          	addi	sp,sp,32
    80006a78:	00008067          	ret

0000000080006a7c <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80006a7c:	fe010113          	addi	sp,sp,-32
    80006a80:	00113c23          	sd	ra,24(sp)
    80006a84:	00813823          	sd	s0,16(sp)
    80006a88:	00913423          	sd	s1,8(sp)
    80006a8c:	01213023          	sd	s2,0(sp)
    80006a90:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006a94:	00000913          	li	s2,0
    80006a98:	0400006f          	j	80006ad8 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    80006a9c:	ffffb097          	auipc	ra,0xffffb
    80006aa0:	98c080e7          	jalr	-1652(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006aa4:	00148493          	addi	s1,s1,1
    80006aa8:	000027b7          	lui	a5,0x2
    80006aac:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006ab0:	0097ee63          	bltu	a5,s1,80006acc <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006ab4:	00000713          	li	a4,0
    80006ab8:	000077b7          	lui	a5,0x7
    80006abc:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006ac0:	fce7eee3          	bltu	a5,a4,80006a9c <_ZL11workerBodyBPv+0x20>
    80006ac4:	00170713          	addi	a4,a4,1
    80006ac8:	ff1ff06f          	j	80006ab8 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    80006acc:	00a00793          	li	a5,10
    80006ad0:	04f90663          	beq	s2,a5,80006b1c <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80006ad4:	00190913          	addi	s2,s2,1
    80006ad8:	00f00793          	li	a5,15
    80006adc:	0527e463          	bltu	a5,s2,80006b24 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80006ae0:	00004517          	auipc	a0,0x4
    80006ae4:	84850513          	addi	a0,a0,-1976 # 8000a328 <CONSOLE_STATUS+0x318>
    80006ae8:	fffff097          	auipc	ra,0xfffff
    80006aec:	310080e7          	jalr	784(ra) # 80005df8 <_Z11printStringPKc>
    80006af0:	00000613          	li	a2,0
    80006af4:	00a00593          	li	a1,10
    80006af8:	0009051b          	sext.w	a0,s2
    80006afc:	fffff097          	auipc	ra,0xfffff
    80006b00:	4ac080e7          	jalr	1196(ra) # 80005fa8 <_Z8printIntiii>
    80006b04:	00004517          	auipc	a0,0x4
    80006b08:	a6c50513          	addi	a0,a0,-1428 # 8000a570 <CONSOLE_STATUS+0x560>
    80006b0c:	fffff097          	auipc	ra,0xfffff
    80006b10:	2ec080e7          	jalr	748(ra) # 80005df8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006b14:	00000493          	li	s1,0
    80006b18:	f91ff06f          	j	80006aa8 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    80006b1c:	14102ff3          	csrr	t6,sepc
    80006b20:	fb5ff06f          	j	80006ad4 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    80006b24:	00004517          	auipc	a0,0x4
    80006b28:	80c50513          	addi	a0,a0,-2036 # 8000a330 <CONSOLE_STATUS+0x320>
    80006b2c:	fffff097          	auipc	ra,0xfffff
    80006b30:	2cc080e7          	jalr	716(ra) # 80005df8 <_Z11printStringPKc>
    finishedB = true;
    80006b34:	00100793          	li	a5,1
    80006b38:	00006717          	auipc	a4,0x6
    80006b3c:	12f70a23          	sb	a5,308(a4) # 8000cc6c <_ZL9finishedB>
    thread_dispatch();
    80006b40:	ffffb097          	auipc	ra,0xffffb
    80006b44:	8e8080e7          	jalr	-1816(ra) # 80001428 <_Z15thread_dispatchv>
}
    80006b48:	01813083          	ld	ra,24(sp)
    80006b4c:	01013403          	ld	s0,16(sp)
    80006b50:	00813483          	ld	s1,8(sp)
    80006b54:	00013903          	ld	s2,0(sp)
    80006b58:	02010113          	addi	sp,sp,32
    80006b5c:	00008067          	ret

0000000080006b60 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006b60:	fe010113          	addi	sp,sp,-32
    80006b64:	00113c23          	sd	ra,24(sp)
    80006b68:	00813823          	sd	s0,16(sp)
    80006b6c:	00913423          	sd	s1,8(sp)
    80006b70:	01213023          	sd	s2,0(sp)
    80006b74:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006b78:	00000913          	li	s2,0
    80006b7c:	0380006f          	j	80006bb4 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80006b80:	ffffb097          	auipc	ra,0xffffb
    80006b84:	8a8080e7          	jalr	-1880(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006b88:	00148493          	addi	s1,s1,1
    80006b8c:	000027b7          	lui	a5,0x2
    80006b90:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006b94:	0097ee63          	bltu	a5,s1,80006bb0 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006b98:	00000713          	li	a4,0
    80006b9c:	000077b7          	lui	a5,0x7
    80006ba0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006ba4:	fce7eee3          	bltu	a5,a4,80006b80 <_ZL11workerBodyAPv+0x20>
    80006ba8:	00170713          	addi	a4,a4,1
    80006bac:	ff1ff06f          	j	80006b9c <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80006bb0:	00190913          	addi	s2,s2,1
    80006bb4:	00900793          	li	a5,9
    80006bb8:	0527e063          	bltu	a5,s2,80006bf8 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80006bbc:	00003517          	auipc	a0,0x3
    80006bc0:	75450513          	addi	a0,a0,1876 # 8000a310 <CONSOLE_STATUS+0x300>
    80006bc4:	fffff097          	auipc	ra,0xfffff
    80006bc8:	234080e7          	jalr	564(ra) # 80005df8 <_Z11printStringPKc>
    80006bcc:	00000613          	li	a2,0
    80006bd0:	00a00593          	li	a1,10
    80006bd4:	0009051b          	sext.w	a0,s2
    80006bd8:	fffff097          	auipc	ra,0xfffff
    80006bdc:	3d0080e7          	jalr	976(ra) # 80005fa8 <_Z8printIntiii>
    80006be0:	00004517          	auipc	a0,0x4
    80006be4:	99050513          	addi	a0,a0,-1648 # 8000a570 <CONSOLE_STATUS+0x560>
    80006be8:	fffff097          	auipc	ra,0xfffff
    80006bec:	210080e7          	jalr	528(ra) # 80005df8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006bf0:	00000493          	li	s1,0
    80006bf4:	f99ff06f          	j	80006b8c <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80006bf8:	00003517          	auipc	a0,0x3
    80006bfc:	72050513          	addi	a0,a0,1824 # 8000a318 <CONSOLE_STATUS+0x308>
    80006c00:	fffff097          	auipc	ra,0xfffff
    80006c04:	1f8080e7          	jalr	504(ra) # 80005df8 <_Z11printStringPKc>
    finishedA = true;
    80006c08:	00100793          	li	a5,1
    80006c0c:	00006717          	auipc	a4,0x6
    80006c10:	06f700a3          	sb	a5,97(a4) # 8000cc6d <_ZL9finishedA>
}
    80006c14:	01813083          	ld	ra,24(sp)
    80006c18:	01013403          	ld	s0,16(sp)
    80006c1c:	00813483          	ld	s1,8(sp)
    80006c20:	00013903          	ld	s2,0(sp)
    80006c24:	02010113          	addi	sp,sp,32
    80006c28:	00008067          	ret

0000000080006c2c <_Z16System_Mode_testv>:


void System_Mode_test() {
    80006c2c:	fd010113          	addi	sp,sp,-48
    80006c30:	02113423          	sd	ra,40(sp)
    80006c34:	02813023          	sd	s0,32(sp)
    80006c38:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80006c3c:	00000613          	li	a2,0
    80006c40:	00000597          	auipc	a1,0x0
    80006c44:	f2058593          	addi	a1,a1,-224 # 80006b60 <_ZL11workerBodyAPv>
    80006c48:	fd040513          	addi	a0,s0,-48
    80006c4c:	ffffa097          	auipc	ra,0xffffa
    80006c50:	734080e7          	jalr	1844(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80006c54:	00003517          	auipc	a0,0x3
    80006c58:	76450513          	addi	a0,a0,1892 # 8000a3b8 <CONSOLE_STATUS+0x3a8>
    80006c5c:	fffff097          	auipc	ra,0xfffff
    80006c60:	19c080e7          	jalr	412(ra) # 80005df8 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80006c64:	00000613          	li	a2,0
    80006c68:	00000597          	auipc	a1,0x0
    80006c6c:	e1458593          	addi	a1,a1,-492 # 80006a7c <_ZL11workerBodyBPv>
    80006c70:	fd840513          	addi	a0,s0,-40
    80006c74:	ffffa097          	auipc	ra,0xffffa
    80006c78:	70c080e7          	jalr	1804(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80006c7c:	00003517          	auipc	a0,0x3
    80006c80:	75450513          	addi	a0,a0,1876 # 8000a3d0 <CONSOLE_STATUS+0x3c0>
    80006c84:	fffff097          	auipc	ra,0xfffff
    80006c88:	174080e7          	jalr	372(ra) # 80005df8 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80006c8c:	00000613          	li	a2,0
    80006c90:	00000597          	auipc	a1,0x0
    80006c94:	c6c58593          	addi	a1,a1,-916 # 800068fc <_ZL11workerBodyCPv>
    80006c98:	fe040513          	addi	a0,s0,-32
    80006c9c:	ffffa097          	auipc	ra,0xffffa
    80006ca0:	6e4080e7          	jalr	1764(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80006ca4:	00003517          	auipc	a0,0x3
    80006ca8:	74450513          	addi	a0,a0,1860 # 8000a3e8 <CONSOLE_STATUS+0x3d8>
    80006cac:	fffff097          	auipc	ra,0xfffff
    80006cb0:	14c080e7          	jalr	332(ra) # 80005df8 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80006cb4:	00000613          	li	a2,0
    80006cb8:	00000597          	auipc	a1,0x0
    80006cbc:	afc58593          	addi	a1,a1,-1284 # 800067b4 <_ZL11workerBodyDPv>
    80006cc0:	fe840513          	addi	a0,s0,-24
    80006cc4:	ffffa097          	auipc	ra,0xffffa
    80006cc8:	6bc080e7          	jalr	1724(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80006ccc:	00003517          	auipc	a0,0x3
    80006cd0:	73450513          	addi	a0,a0,1844 # 8000a400 <CONSOLE_STATUS+0x3f0>
    80006cd4:	fffff097          	auipc	ra,0xfffff
    80006cd8:	124080e7          	jalr	292(ra) # 80005df8 <_Z11printStringPKc>
    80006cdc:	00c0006f          	j	80006ce8 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006ce0:	ffffa097          	auipc	ra,0xffffa
    80006ce4:	748080e7          	jalr	1864(ra) # 80001428 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006ce8:	00006797          	auipc	a5,0x6
    80006cec:	f857c783          	lbu	a5,-123(a5) # 8000cc6d <_ZL9finishedA>
    80006cf0:	fe0788e3          	beqz	a5,80006ce0 <_Z16System_Mode_testv+0xb4>
    80006cf4:	00006797          	auipc	a5,0x6
    80006cf8:	f787c783          	lbu	a5,-136(a5) # 8000cc6c <_ZL9finishedB>
    80006cfc:	fe0782e3          	beqz	a5,80006ce0 <_Z16System_Mode_testv+0xb4>
    80006d00:	00006797          	auipc	a5,0x6
    80006d04:	f6b7c783          	lbu	a5,-149(a5) # 8000cc6b <_ZL9finishedC>
    80006d08:	fc078ce3          	beqz	a5,80006ce0 <_Z16System_Mode_testv+0xb4>
    80006d0c:	00006797          	auipc	a5,0x6
    80006d10:	f5e7c783          	lbu	a5,-162(a5) # 8000cc6a <_ZL9finishedD>
    80006d14:	fc0786e3          	beqz	a5,80006ce0 <_Z16System_Mode_testv+0xb4>
    }

}
    80006d18:	02813083          	ld	ra,40(sp)
    80006d1c:	02013403          	ld	s0,32(sp)
    80006d20:	03010113          	addi	sp,sp,48
    80006d24:	00008067          	ret

0000000080006d28 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006d28:	fe010113          	addi	sp,sp,-32
    80006d2c:	00113c23          	sd	ra,24(sp)
    80006d30:	00813823          	sd	s0,16(sp)
    80006d34:	00913423          	sd	s1,8(sp)
    80006d38:	01213023          	sd	s2,0(sp)
    80006d3c:	02010413          	addi	s0,sp,32
    80006d40:	00050493          	mv	s1,a0
    80006d44:	00058913          	mv	s2,a1
    80006d48:	0015879b          	addiw	a5,a1,1
    80006d4c:	0007851b          	sext.w	a0,a5
    80006d50:	00f4a023          	sw	a5,0(s1)
    80006d54:	0004a823          	sw	zero,16(s1)
    80006d58:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006d5c:	00251513          	slli	a0,a0,0x2
    80006d60:	ffffa097          	auipc	ra,0xffffa
    80006d64:	5b0080e7          	jalr	1456(ra) # 80001310 <_Z9mem_allocm>
    80006d68:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80006d6c:	00000593          	li	a1,0
    80006d70:	02048513          	addi	a0,s1,32
    80006d74:	ffffa097          	auipc	ra,0xffffa
    80006d78:	72c080e7          	jalr	1836(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&spaceAvailable, _cap);
    80006d7c:	00090593          	mv	a1,s2
    80006d80:	01848513          	addi	a0,s1,24
    80006d84:	ffffa097          	auipc	ra,0xffffa
    80006d88:	71c080e7          	jalr	1820(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&mutexHead, 1);
    80006d8c:	00100593          	li	a1,1
    80006d90:	02848513          	addi	a0,s1,40
    80006d94:	ffffa097          	auipc	ra,0xffffa
    80006d98:	70c080e7          	jalr	1804(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&mutexTail, 1);
    80006d9c:	00100593          	li	a1,1
    80006da0:	03048513          	addi	a0,s1,48
    80006da4:	ffffa097          	auipc	ra,0xffffa
    80006da8:	6fc080e7          	jalr	1788(ra) # 800014a0 <_Z8sem_openPP4KSemj>
}
    80006dac:	01813083          	ld	ra,24(sp)
    80006db0:	01013403          	ld	s0,16(sp)
    80006db4:	00813483          	ld	s1,8(sp)
    80006db8:	00013903          	ld	s2,0(sp)
    80006dbc:	02010113          	addi	sp,sp,32
    80006dc0:	00008067          	ret

0000000080006dc4 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80006dc4:	fe010113          	addi	sp,sp,-32
    80006dc8:	00113c23          	sd	ra,24(sp)
    80006dcc:	00813823          	sd	s0,16(sp)
    80006dd0:	00913423          	sd	s1,8(sp)
    80006dd4:	01213023          	sd	s2,0(sp)
    80006dd8:	02010413          	addi	s0,sp,32
    80006ddc:	00050493          	mv	s1,a0
    80006de0:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80006de4:	01853503          	ld	a0,24(a0)
    80006de8:	ffffa097          	auipc	ra,0xffffa
    80006dec:	720080e7          	jalr	1824(ra) # 80001508 <_Z8sem_waitP4KSem>

    sem_wait(mutexTail);
    80006df0:	0304b503          	ld	a0,48(s1)
    80006df4:	ffffa097          	auipc	ra,0xffffa
    80006df8:	714080e7          	jalr	1812(ra) # 80001508 <_Z8sem_waitP4KSem>
    buffer[tail] = val;
    80006dfc:	0084b783          	ld	a5,8(s1)
    80006e00:	0144a703          	lw	a4,20(s1)
    80006e04:	00271713          	slli	a4,a4,0x2
    80006e08:	00e787b3          	add	a5,a5,a4
    80006e0c:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006e10:	0144a783          	lw	a5,20(s1)
    80006e14:	0017879b          	addiw	a5,a5,1
    80006e18:	0004a703          	lw	a4,0(s1)
    80006e1c:	02e7e7bb          	remw	a5,a5,a4
    80006e20:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80006e24:	0304b503          	ld	a0,48(s1)
    80006e28:	ffffa097          	auipc	ra,0xffffa
    80006e2c:	710080e7          	jalr	1808(ra) # 80001538 <_Z10sem_signalP4KSem>

    sem_signal(itemAvailable);
    80006e30:	0204b503          	ld	a0,32(s1)
    80006e34:	ffffa097          	auipc	ra,0xffffa
    80006e38:	704080e7          	jalr	1796(ra) # 80001538 <_Z10sem_signalP4KSem>

}
    80006e3c:	01813083          	ld	ra,24(sp)
    80006e40:	01013403          	ld	s0,16(sp)
    80006e44:	00813483          	ld	s1,8(sp)
    80006e48:	00013903          	ld	s2,0(sp)
    80006e4c:	02010113          	addi	sp,sp,32
    80006e50:	00008067          	ret

0000000080006e54 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80006e54:	fe010113          	addi	sp,sp,-32
    80006e58:	00113c23          	sd	ra,24(sp)
    80006e5c:	00813823          	sd	s0,16(sp)
    80006e60:	00913423          	sd	s1,8(sp)
    80006e64:	01213023          	sd	s2,0(sp)
    80006e68:	02010413          	addi	s0,sp,32
    80006e6c:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80006e70:	02053503          	ld	a0,32(a0)
    80006e74:	ffffa097          	auipc	ra,0xffffa
    80006e78:	694080e7          	jalr	1684(ra) # 80001508 <_Z8sem_waitP4KSem>

    sem_wait(mutexHead);
    80006e7c:	0284b503          	ld	a0,40(s1)
    80006e80:	ffffa097          	auipc	ra,0xffffa
    80006e84:	688080e7          	jalr	1672(ra) # 80001508 <_Z8sem_waitP4KSem>

    int ret = buffer[head];
    80006e88:	0084b703          	ld	a4,8(s1)
    80006e8c:	0104a783          	lw	a5,16(s1)
    80006e90:	00279693          	slli	a3,a5,0x2
    80006e94:	00d70733          	add	a4,a4,a3
    80006e98:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006e9c:	0017879b          	addiw	a5,a5,1
    80006ea0:	0004a703          	lw	a4,0(s1)
    80006ea4:	02e7e7bb          	remw	a5,a5,a4
    80006ea8:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80006eac:	0284b503          	ld	a0,40(s1)
    80006eb0:	ffffa097          	auipc	ra,0xffffa
    80006eb4:	688080e7          	jalr	1672(ra) # 80001538 <_Z10sem_signalP4KSem>

    sem_signal(spaceAvailable);
    80006eb8:	0184b503          	ld	a0,24(s1)
    80006ebc:	ffffa097          	auipc	ra,0xffffa
    80006ec0:	67c080e7          	jalr	1660(ra) # 80001538 <_Z10sem_signalP4KSem>

    return ret;
}
    80006ec4:	00090513          	mv	a0,s2
    80006ec8:	01813083          	ld	ra,24(sp)
    80006ecc:	01013403          	ld	s0,16(sp)
    80006ed0:	00813483          	ld	s1,8(sp)
    80006ed4:	00013903          	ld	s2,0(sp)
    80006ed8:	02010113          	addi	sp,sp,32
    80006edc:	00008067          	ret

0000000080006ee0 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80006ee0:	fe010113          	addi	sp,sp,-32
    80006ee4:	00113c23          	sd	ra,24(sp)
    80006ee8:	00813823          	sd	s0,16(sp)
    80006eec:	00913423          	sd	s1,8(sp)
    80006ef0:	01213023          	sd	s2,0(sp)
    80006ef4:	02010413          	addi	s0,sp,32
    80006ef8:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80006efc:	02853503          	ld	a0,40(a0)
    80006f00:	ffffa097          	auipc	ra,0xffffa
    80006f04:	608080e7          	jalr	1544(ra) # 80001508 <_Z8sem_waitP4KSem>
    sem_wait(mutexTail);
    80006f08:	0304b503          	ld	a0,48(s1)
    80006f0c:	ffffa097          	auipc	ra,0xffffa
    80006f10:	5fc080e7          	jalr	1532(ra) # 80001508 <_Z8sem_waitP4KSem>

    if (tail >= head) {
    80006f14:	0144a783          	lw	a5,20(s1)
    80006f18:	0104a903          	lw	s2,16(s1)
    80006f1c:	0327ce63          	blt	a5,s2,80006f58 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80006f20:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80006f24:	0304b503          	ld	a0,48(s1)
    80006f28:	ffffa097          	auipc	ra,0xffffa
    80006f2c:	610080e7          	jalr	1552(ra) # 80001538 <_Z10sem_signalP4KSem>
    sem_signal(mutexHead);
    80006f30:	0284b503          	ld	a0,40(s1)
    80006f34:	ffffa097          	auipc	ra,0xffffa
    80006f38:	604080e7          	jalr	1540(ra) # 80001538 <_Z10sem_signalP4KSem>

    return ret;
}
    80006f3c:	00090513          	mv	a0,s2
    80006f40:	01813083          	ld	ra,24(sp)
    80006f44:	01013403          	ld	s0,16(sp)
    80006f48:	00813483          	ld	s1,8(sp)
    80006f4c:	00013903          	ld	s2,0(sp)
    80006f50:	02010113          	addi	sp,sp,32
    80006f54:	00008067          	ret
        ret = cap - head + tail;
    80006f58:	0004a703          	lw	a4,0(s1)
    80006f5c:	4127093b          	subw	s2,a4,s2
    80006f60:	00f9093b          	addw	s2,s2,a5
    80006f64:	fc1ff06f          	j	80006f24 <_ZN6Buffer6getCntEv+0x44>

0000000080006f68 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80006f68:	fe010113          	addi	sp,sp,-32
    80006f6c:	00113c23          	sd	ra,24(sp)
    80006f70:	00813823          	sd	s0,16(sp)
    80006f74:	00913423          	sd	s1,8(sp)
    80006f78:	02010413          	addi	s0,sp,32
    80006f7c:	00050493          	mv	s1,a0
    putc('\n');
    80006f80:	00a00513          	li	a0,10
    80006f84:	ffffa097          	auipc	ra,0xffffa
    80006f88:	60c080e7          	jalr	1548(ra) # 80001590 <_Z4putcc>
    printString("Buffer deleted!\n");
    80006f8c:	00003517          	auipc	a0,0x3
    80006f90:	48c50513          	addi	a0,a0,1164 # 8000a418 <CONSOLE_STATUS+0x408>
    80006f94:	fffff097          	auipc	ra,0xfffff
    80006f98:	e64080e7          	jalr	-412(ra) # 80005df8 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80006f9c:	00048513          	mv	a0,s1
    80006fa0:	00000097          	auipc	ra,0x0
    80006fa4:	f40080e7          	jalr	-192(ra) # 80006ee0 <_ZN6Buffer6getCntEv>
    80006fa8:	02a05c63          	blez	a0,80006fe0 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80006fac:	0084b783          	ld	a5,8(s1)
    80006fb0:	0104a703          	lw	a4,16(s1)
    80006fb4:	00271713          	slli	a4,a4,0x2
    80006fb8:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80006fbc:	0007c503          	lbu	a0,0(a5)
    80006fc0:	ffffa097          	auipc	ra,0xffffa
    80006fc4:	5d0080e7          	jalr	1488(ra) # 80001590 <_Z4putcc>
        head = (head + 1) % cap;
    80006fc8:	0104a783          	lw	a5,16(s1)
    80006fcc:	0017879b          	addiw	a5,a5,1
    80006fd0:	0004a703          	lw	a4,0(s1)
    80006fd4:	02e7e7bb          	remw	a5,a5,a4
    80006fd8:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80006fdc:	fc1ff06f          	j	80006f9c <_ZN6BufferD1Ev+0x34>
    putc('!');
    80006fe0:	02100513          	li	a0,33
    80006fe4:	ffffa097          	auipc	ra,0xffffa
    80006fe8:	5ac080e7          	jalr	1452(ra) # 80001590 <_Z4putcc>
    putc('\n');
    80006fec:	00a00513          	li	a0,10
    80006ff0:	ffffa097          	auipc	ra,0xffffa
    80006ff4:	5a0080e7          	jalr	1440(ra) # 80001590 <_Z4putcc>
    mem_free(buffer);
    80006ff8:	0084b503          	ld	a0,8(s1)
    80006ffc:	ffffa097          	auipc	ra,0xffffa
    80007000:	354080e7          	jalr	852(ra) # 80001350 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80007004:	0204b503          	ld	a0,32(s1)
    80007008:	ffffa097          	auipc	ra,0xffffa
    8000700c:	4d0080e7          	jalr	1232(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(spaceAvailable);
    80007010:	0184b503          	ld	a0,24(s1)
    80007014:	ffffa097          	auipc	ra,0xffffa
    80007018:	4c4080e7          	jalr	1220(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(mutexTail);
    8000701c:	0304b503          	ld	a0,48(s1)
    80007020:	ffffa097          	auipc	ra,0xffffa
    80007024:	4b8080e7          	jalr	1208(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(mutexHead);
    80007028:	0284b503          	ld	a0,40(s1)
    8000702c:	ffffa097          	auipc	ra,0xffffa
    80007030:	4ac080e7          	jalr	1196(ra) # 800014d8 <_Z9sem_closeP4KSem>
}
    80007034:	01813083          	ld	ra,24(sp)
    80007038:	01013403          	ld	s0,16(sp)
    8000703c:	00813483          	ld	s1,8(sp)
    80007040:	02010113          	addi	sp,sp,32
    80007044:	00008067          	ret

0000000080007048 <start>:
    80007048:	ff010113          	addi	sp,sp,-16
    8000704c:	00813423          	sd	s0,8(sp)
    80007050:	01010413          	addi	s0,sp,16
    80007054:	300027f3          	csrr	a5,mstatus
    80007058:	ffffe737          	lui	a4,0xffffe
    8000705c:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff092f>
    80007060:	00e7f7b3          	and	a5,a5,a4
    80007064:	00001737          	lui	a4,0x1
    80007068:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    8000706c:	00e7e7b3          	or	a5,a5,a4
    80007070:	30079073          	csrw	mstatus,a5
    80007074:	00000797          	auipc	a5,0x0
    80007078:	16078793          	addi	a5,a5,352 # 800071d4 <system_main>
    8000707c:	34179073          	csrw	mepc,a5
    80007080:	00000793          	li	a5,0
    80007084:	18079073          	csrw	satp,a5
    80007088:	000107b7          	lui	a5,0x10
    8000708c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80007090:	30279073          	csrw	medeleg,a5
    80007094:	30379073          	csrw	mideleg,a5
    80007098:	104027f3          	csrr	a5,sie
    8000709c:	2227e793          	ori	a5,a5,546
    800070a0:	10479073          	csrw	sie,a5
    800070a4:	fff00793          	li	a5,-1
    800070a8:	00a7d793          	srli	a5,a5,0xa
    800070ac:	3b079073          	csrw	pmpaddr0,a5
    800070b0:	00f00793          	li	a5,15
    800070b4:	3a079073          	csrw	pmpcfg0,a5
    800070b8:	f14027f3          	csrr	a5,mhartid
    800070bc:	0200c737          	lui	a4,0x200c
    800070c0:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800070c4:	0007869b          	sext.w	a3,a5
    800070c8:	00269713          	slli	a4,a3,0x2
    800070cc:	000f4637          	lui	a2,0xf4
    800070d0:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800070d4:	00d70733          	add	a4,a4,a3
    800070d8:	0037979b          	slliw	a5,a5,0x3
    800070dc:	020046b7          	lui	a3,0x2004
    800070e0:	00d787b3          	add	a5,a5,a3
    800070e4:	00c585b3          	add	a1,a1,a2
    800070e8:	00371693          	slli	a3,a4,0x3
    800070ec:	00006717          	auipc	a4,0x6
    800070f0:	b8470713          	addi	a4,a4,-1148 # 8000cc70 <timer_scratch>
    800070f4:	00b7b023          	sd	a1,0(a5)
    800070f8:	00d70733          	add	a4,a4,a3
    800070fc:	00f73c23          	sd	a5,24(a4)
    80007100:	02c73023          	sd	a2,32(a4)
    80007104:	34071073          	csrw	mscratch,a4
    80007108:	00000797          	auipc	a5,0x0
    8000710c:	6e878793          	addi	a5,a5,1768 # 800077f0 <timervec>
    80007110:	30579073          	csrw	mtvec,a5
    80007114:	300027f3          	csrr	a5,mstatus
    80007118:	0087e793          	ori	a5,a5,8
    8000711c:	30079073          	csrw	mstatus,a5
    80007120:	304027f3          	csrr	a5,mie
    80007124:	0807e793          	ori	a5,a5,128
    80007128:	30479073          	csrw	mie,a5
    8000712c:	f14027f3          	csrr	a5,mhartid
    80007130:	0007879b          	sext.w	a5,a5
    80007134:	00078213          	mv	tp,a5
    80007138:	30200073          	mret
    8000713c:	00813403          	ld	s0,8(sp)
    80007140:	01010113          	addi	sp,sp,16
    80007144:	00008067          	ret

0000000080007148 <timerinit>:
    80007148:	ff010113          	addi	sp,sp,-16
    8000714c:	00813423          	sd	s0,8(sp)
    80007150:	01010413          	addi	s0,sp,16
    80007154:	f14027f3          	csrr	a5,mhartid
    80007158:	0200c737          	lui	a4,0x200c
    8000715c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80007160:	0007869b          	sext.w	a3,a5
    80007164:	00269713          	slli	a4,a3,0x2
    80007168:	000f4637          	lui	a2,0xf4
    8000716c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80007170:	00d70733          	add	a4,a4,a3
    80007174:	0037979b          	slliw	a5,a5,0x3
    80007178:	020046b7          	lui	a3,0x2004
    8000717c:	00d787b3          	add	a5,a5,a3
    80007180:	00c585b3          	add	a1,a1,a2
    80007184:	00371693          	slli	a3,a4,0x3
    80007188:	00006717          	auipc	a4,0x6
    8000718c:	ae870713          	addi	a4,a4,-1304 # 8000cc70 <timer_scratch>
    80007190:	00b7b023          	sd	a1,0(a5)
    80007194:	00d70733          	add	a4,a4,a3
    80007198:	00f73c23          	sd	a5,24(a4)
    8000719c:	02c73023          	sd	a2,32(a4)
    800071a0:	34071073          	csrw	mscratch,a4
    800071a4:	00000797          	auipc	a5,0x0
    800071a8:	64c78793          	addi	a5,a5,1612 # 800077f0 <timervec>
    800071ac:	30579073          	csrw	mtvec,a5
    800071b0:	300027f3          	csrr	a5,mstatus
    800071b4:	0087e793          	ori	a5,a5,8
    800071b8:	30079073          	csrw	mstatus,a5
    800071bc:	304027f3          	csrr	a5,mie
    800071c0:	0807e793          	ori	a5,a5,128
    800071c4:	30479073          	csrw	mie,a5
    800071c8:	00813403          	ld	s0,8(sp)
    800071cc:	01010113          	addi	sp,sp,16
    800071d0:	00008067          	ret

00000000800071d4 <system_main>:
    800071d4:	fe010113          	addi	sp,sp,-32
    800071d8:	00813823          	sd	s0,16(sp)
    800071dc:	00913423          	sd	s1,8(sp)
    800071e0:	00113c23          	sd	ra,24(sp)
    800071e4:	02010413          	addi	s0,sp,32
    800071e8:	00000097          	auipc	ra,0x0
    800071ec:	0c4080e7          	jalr	196(ra) # 800072ac <cpuid>
    800071f0:	00006497          	auipc	s1,0x6
    800071f4:	90048493          	addi	s1,s1,-1792 # 8000caf0 <started>
    800071f8:	02050263          	beqz	a0,8000721c <system_main+0x48>
    800071fc:	0004a783          	lw	a5,0(s1)
    80007200:	0007879b          	sext.w	a5,a5
    80007204:	fe078ce3          	beqz	a5,800071fc <system_main+0x28>
    80007208:	0ff0000f          	fence
    8000720c:	00003517          	auipc	a0,0x3
    80007210:	4dc50513          	addi	a0,a0,1244 # 8000a6e8 <CONSOLE_STATUS+0x6d8>
    80007214:	00001097          	auipc	ra,0x1
    80007218:	a78080e7          	jalr	-1416(ra) # 80007c8c <panic>
    8000721c:	00001097          	auipc	ra,0x1
    80007220:	9cc080e7          	jalr	-1588(ra) # 80007be8 <consoleinit>
    80007224:	00001097          	auipc	ra,0x1
    80007228:	158080e7          	jalr	344(ra) # 8000837c <printfinit>
    8000722c:	00003517          	auipc	a0,0x3
    80007230:	34450513          	addi	a0,a0,836 # 8000a570 <CONSOLE_STATUS+0x560>
    80007234:	00001097          	auipc	ra,0x1
    80007238:	ab4080e7          	jalr	-1356(ra) # 80007ce8 <__printf>
    8000723c:	00003517          	auipc	a0,0x3
    80007240:	47c50513          	addi	a0,a0,1148 # 8000a6b8 <CONSOLE_STATUS+0x6a8>
    80007244:	00001097          	auipc	ra,0x1
    80007248:	aa4080e7          	jalr	-1372(ra) # 80007ce8 <__printf>
    8000724c:	00003517          	auipc	a0,0x3
    80007250:	32450513          	addi	a0,a0,804 # 8000a570 <CONSOLE_STATUS+0x560>
    80007254:	00001097          	auipc	ra,0x1
    80007258:	a94080e7          	jalr	-1388(ra) # 80007ce8 <__printf>
    8000725c:	00001097          	auipc	ra,0x1
    80007260:	4ac080e7          	jalr	1196(ra) # 80008708 <kinit>
    80007264:	00000097          	auipc	ra,0x0
    80007268:	148080e7          	jalr	328(ra) # 800073ac <trapinit>
    8000726c:	00000097          	auipc	ra,0x0
    80007270:	16c080e7          	jalr	364(ra) # 800073d8 <trapinithart>
    80007274:	00000097          	auipc	ra,0x0
    80007278:	5bc080e7          	jalr	1468(ra) # 80007830 <plicinit>
    8000727c:	00000097          	auipc	ra,0x0
    80007280:	5dc080e7          	jalr	1500(ra) # 80007858 <plicinithart>
    80007284:	00000097          	auipc	ra,0x0
    80007288:	078080e7          	jalr	120(ra) # 800072fc <userinit>
    8000728c:	0ff0000f          	fence
    80007290:	00100793          	li	a5,1
    80007294:	00003517          	auipc	a0,0x3
    80007298:	43c50513          	addi	a0,a0,1084 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    8000729c:	00f4a023          	sw	a5,0(s1)
    800072a0:	00001097          	auipc	ra,0x1
    800072a4:	a48080e7          	jalr	-1464(ra) # 80007ce8 <__printf>
    800072a8:	0000006f          	j	800072a8 <system_main+0xd4>

00000000800072ac <cpuid>:
    800072ac:	ff010113          	addi	sp,sp,-16
    800072b0:	00813423          	sd	s0,8(sp)
    800072b4:	01010413          	addi	s0,sp,16
    800072b8:	00020513          	mv	a0,tp
    800072bc:	00813403          	ld	s0,8(sp)
    800072c0:	0005051b          	sext.w	a0,a0
    800072c4:	01010113          	addi	sp,sp,16
    800072c8:	00008067          	ret

00000000800072cc <mycpu>:
    800072cc:	ff010113          	addi	sp,sp,-16
    800072d0:	00813423          	sd	s0,8(sp)
    800072d4:	01010413          	addi	s0,sp,16
    800072d8:	00020793          	mv	a5,tp
    800072dc:	00813403          	ld	s0,8(sp)
    800072e0:	0007879b          	sext.w	a5,a5
    800072e4:	00779793          	slli	a5,a5,0x7
    800072e8:	00007517          	auipc	a0,0x7
    800072ec:	9b850513          	addi	a0,a0,-1608 # 8000dca0 <cpus>
    800072f0:	00f50533          	add	a0,a0,a5
    800072f4:	01010113          	addi	sp,sp,16
    800072f8:	00008067          	ret

00000000800072fc <userinit>:
    800072fc:	ff010113          	addi	sp,sp,-16
    80007300:	00813423          	sd	s0,8(sp)
    80007304:	01010413          	addi	s0,sp,16
    80007308:	00813403          	ld	s0,8(sp)
    8000730c:	01010113          	addi	sp,sp,16
    80007310:	ffffb317          	auipc	t1,0xffffb
    80007314:	8d430067          	jr	-1836(t1) # 80001be4 <main>

0000000080007318 <either_copyout>:
    80007318:	ff010113          	addi	sp,sp,-16
    8000731c:	00813023          	sd	s0,0(sp)
    80007320:	00113423          	sd	ra,8(sp)
    80007324:	01010413          	addi	s0,sp,16
    80007328:	02051663          	bnez	a0,80007354 <either_copyout+0x3c>
    8000732c:	00058513          	mv	a0,a1
    80007330:	00060593          	mv	a1,a2
    80007334:	0006861b          	sext.w	a2,a3
    80007338:	00002097          	auipc	ra,0x2
    8000733c:	c5c080e7          	jalr	-932(ra) # 80008f94 <__memmove>
    80007340:	00813083          	ld	ra,8(sp)
    80007344:	00013403          	ld	s0,0(sp)
    80007348:	00000513          	li	a0,0
    8000734c:	01010113          	addi	sp,sp,16
    80007350:	00008067          	ret
    80007354:	00003517          	auipc	a0,0x3
    80007358:	3bc50513          	addi	a0,a0,956 # 8000a710 <CONSOLE_STATUS+0x700>
    8000735c:	00001097          	auipc	ra,0x1
    80007360:	930080e7          	jalr	-1744(ra) # 80007c8c <panic>

0000000080007364 <either_copyin>:
    80007364:	ff010113          	addi	sp,sp,-16
    80007368:	00813023          	sd	s0,0(sp)
    8000736c:	00113423          	sd	ra,8(sp)
    80007370:	01010413          	addi	s0,sp,16
    80007374:	02059463          	bnez	a1,8000739c <either_copyin+0x38>
    80007378:	00060593          	mv	a1,a2
    8000737c:	0006861b          	sext.w	a2,a3
    80007380:	00002097          	auipc	ra,0x2
    80007384:	c14080e7          	jalr	-1004(ra) # 80008f94 <__memmove>
    80007388:	00813083          	ld	ra,8(sp)
    8000738c:	00013403          	ld	s0,0(sp)
    80007390:	00000513          	li	a0,0
    80007394:	01010113          	addi	sp,sp,16
    80007398:	00008067          	ret
    8000739c:	00003517          	auipc	a0,0x3
    800073a0:	39c50513          	addi	a0,a0,924 # 8000a738 <CONSOLE_STATUS+0x728>
    800073a4:	00001097          	auipc	ra,0x1
    800073a8:	8e8080e7          	jalr	-1816(ra) # 80007c8c <panic>

00000000800073ac <trapinit>:
    800073ac:	ff010113          	addi	sp,sp,-16
    800073b0:	00813423          	sd	s0,8(sp)
    800073b4:	01010413          	addi	s0,sp,16
    800073b8:	00813403          	ld	s0,8(sp)
    800073bc:	00003597          	auipc	a1,0x3
    800073c0:	3a458593          	addi	a1,a1,932 # 8000a760 <CONSOLE_STATUS+0x750>
    800073c4:	00007517          	auipc	a0,0x7
    800073c8:	95c50513          	addi	a0,a0,-1700 # 8000dd20 <tickslock>
    800073cc:	01010113          	addi	sp,sp,16
    800073d0:	00001317          	auipc	t1,0x1
    800073d4:	5c830067          	jr	1480(t1) # 80008998 <initlock>

00000000800073d8 <trapinithart>:
    800073d8:	ff010113          	addi	sp,sp,-16
    800073dc:	00813423          	sd	s0,8(sp)
    800073e0:	01010413          	addi	s0,sp,16
    800073e4:	00000797          	auipc	a5,0x0
    800073e8:	2fc78793          	addi	a5,a5,764 # 800076e0 <kernelvec>
    800073ec:	10579073          	csrw	stvec,a5
    800073f0:	00813403          	ld	s0,8(sp)
    800073f4:	01010113          	addi	sp,sp,16
    800073f8:	00008067          	ret

00000000800073fc <usertrap>:
    800073fc:	ff010113          	addi	sp,sp,-16
    80007400:	00813423          	sd	s0,8(sp)
    80007404:	01010413          	addi	s0,sp,16
    80007408:	00813403          	ld	s0,8(sp)
    8000740c:	01010113          	addi	sp,sp,16
    80007410:	00008067          	ret

0000000080007414 <usertrapret>:
    80007414:	ff010113          	addi	sp,sp,-16
    80007418:	00813423          	sd	s0,8(sp)
    8000741c:	01010413          	addi	s0,sp,16
    80007420:	00813403          	ld	s0,8(sp)
    80007424:	01010113          	addi	sp,sp,16
    80007428:	00008067          	ret

000000008000742c <kerneltrap>:
    8000742c:	fe010113          	addi	sp,sp,-32
    80007430:	00813823          	sd	s0,16(sp)
    80007434:	00113c23          	sd	ra,24(sp)
    80007438:	00913423          	sd	s1,8(sp)
    8000743c:	02010413          	addi	s0,sp,32
    80007440:	142025f3          	csrr	a1,scause
    80007444:	100027f3          	csrr	a5,sstatus
    80007448:	0027f793          	andi	a5,a5,2
    8000744c:	10079c63          	bnez	a5,80007564 <kerneltrap+0x138>
    80007450:	142027f3          	csrr	a5,scause
    80007454:	0207ce63          	bltz	a5,80007490 <kerneltrap+0x64>
    80007458:	00003517          	auipc	a0,0x3
    8000745c:	35050513          	addi	a0,a0,848 # 8000a7a8 <CONSOLE_STATUS+0x798>
    80007460:	00001097          	auipc	ra,0x1
    80007464:	888080e7          	jalr	-1912(ra) # 80007ce8 <__printf>
    80007468:	141025f3          	csrr	a1,sepc
    8000746c:	14302673          	csrr	a2,stval
    80007470:	00003517          	auipc	a0,0x3
    80007474:	34850513          	addi	a0,a0,840 # 8000a7b8 <CONSOLE_STATUS+0x7a8>
    80007478:	00001097          	auipc	ra,0x1
    8000747c:	870080e7          	jalr	-1936(ra) # 80007ce8 <__printf>
    80007480:	00003517          	auipc	a0,0x3
    80007484:	35050513          	addi	a0,a0,848 # 8000a7d0 <CONSOLE_STATUS+0x7c0>
    80007488:	00001097          	auipc	ra,0x1
    8000748c:	804080e7          	jalr	-2044(ra) # 80007c8c <panic>
    80007490:	0ff7f713          	andi	a4,a5,255
    80007494:	00900693          	li	a3,9
    80007498:	04d70063          	beq	a4,a3,800074d8 <kerneltrap+0xac>
    8000749c:	fff00713          	li	a4,-1
    800074a0:	03f71713          	slli	a4,a4,0x3f
    800074a4:	00170713          	addi	a4,a4,1
    800074a8:	fae798e3          	bne	a5,a4,80007458 <kerneltrap+0x2c>
    800074ac:	00000097          	auipc	ra,0x0
    800074b0:	e00080e7          	jalr	-512(ra) # 800072ac <cpuid>
    800074b4:	06050663          	beqz	a0,80007520 <kerneltrap+0xf4>
    800074b8:	144027f3          	csrr	a5,sip
    800074bc:	ffd7f793          	andi	a5,a5,-3
    800074c0:	14479073          	csrw	sip,a5
    800074c4:	01813083          	ld	ra,24(sp)
    800074c8:	01013403          	ld	s0,16(sp)
    800074cc:	00813483          	ld	s1,8(sp)
    800074d0:	02010113          	addi	sp,sp,32
    800074d4:	00008067          	ret
    800074d8:	00000097          	auipc	ra,0x0
    800074dc:	3cc080e7          	jalr	972(ra) # 800078a4 <plic_claim>
    800074e0:	00a00793          	li	a5,10
    800074e4:	00050493          	mv	s1,a0
    800074e8:	06f50863          	beq	a0,a5,80007558 <kerneltrap+0x12c>
    800074ec:	fc050ce3          	beqz	a0,800074c4 <kerneltrap+0x98>
    800074f0:	00050593          	mv	a1,a0
    800074f4:	00003517          	auipc	a0,0x3
    800074f8:	29450513          	addi	a0,a0,660 # 8000a788 <CONSOLE_STATUS+0x778>
    800074fc:	00000097          	auipc	ra,0x0
    80007500:	7ec080e7          	jalr	2028(ra) # 80007ce8 <__printf>
    80007504:	01013403          	ld	s0,16(sp)
    80007508:	01813083          	ld	ra,24(sp)
    8000750c:	00048513          	mv	a0,s1
    80007510:	00813483          	ld	s1,8(sp)
    80007514:	02010113          	addi	sp,sp,32
    80007518:	00000317          	auipc	t1,0x0
    8000751c:	3c430067          	jr	964(t1) # 800078dc <plic_complete>
    80007520:	00007517          	auipc	a0,0x7
    80007524:	80050513          	addi	a0,a0,-2048 # 8000dd20 <tickslock>
    80007528:	00001097          	auipc	ra,0x1
    8000752c:	494080e7          	jalr	1172(ra) # 800089bc <acquire>
    80007530:	00005717          	auipc	a4,0x5
    80007534:	5c470713          	addi	a4,a4,1476 # 8000caf4 <ticks>
    80007538:	00072783          	lw	a5,0(a4)
    8000753c:	00006517          	auipc	a0,0x6
    80007540:	7e450513          	addi	a0,a0,2020 # 8000dd20 <tickslock>
    80007544:	0017879b          	addiw	a5,a5,1
    80007548:	00f72023          	sw	a5,0(a4)
    8000754c:	00001097          	auipc	ra,0x1
    80007550:	53c080e7          	jalr	1340(ra) # 80008a88 <release>
    80007554:	f65ff06f          	j	800074b8 <kerneltrap+0x8c>
    80007558:	00001097          	auipc	ra,0x1
    8000755c:	098080e7          	jalr	152(ra) # 800085f0 <uartintr>
    80007560:	fa5ff06f          	j	80007504 <kerneltrap+0xd8>
    80007564:	00003517          	auipc	a0,0x3
    80007568:	20450513          	addi	a0,a0,516 # 8000a768 <CONSOLE_STATUS+0x758>
    8000756c:	00000097          	auipc	ra,0x0
    80007570:	720080e7          	jalr	1824(ra) # 80007c8c <panic>

0000000080007574 <clockintr>:
    80007574:	fe010113          	addi	sp,sp,-32
    80007578:	00813823          	sd	s0,16(sp)
    8000757c:	00913423          	sd	s1,8(sp)
    80007580:	00113c23          	sd	ra,24(sp)
    80007584:	02010413          	addi	s0,sp,32
    80007588:	00006497          	auipc	s1,0x6
    8000758c:	79848493          	addi	s1,s1,1944 # 8000dd20 <tickslock>
    80007590:	00048513          	mv	a0,s1
    80007594:	00001097          	auipc	ra,0x1
    80007598:	428080e7          	jalr	1064(ra) # 800089bc <acquire>
    8000759c:	00005717          	auipc	a4,0x5
    800075a0:	55870713          	addi	a4,a4,1368 # 8000caf4 <ticks>
    800075a4:	00072783          	lw	a5,0(a4)
    800075a8:	01013403          	ld	s0,16(sp)
    800075ac:	01813083          	ld	ra,24(sp)
    800075b0:	00048513          	mv	a0,s1
    800075b4:	0017879b          	addiw	a5,a5,1
    800075b8:	00813483          	ld	s1,8(sp)
    800075bc:	00f72023          	sw	a5,0(a4)
    800075c0:	02010113          	addi	sp,sp,32
    800075c4:	00001317          	auipc	t1,0x1
    800075c8:	4c430067          	jr	1220(t1) # 80008a88 <release>

00000000800075cc <devintr>:
    800075cc:	142027f3          	csrr	a5,scause
    800075d0:	00000513          	li	a0,0
    800075d4:	0007c463          	bltz	a5,800075dc <devintr+0x10>
    800075d8:	00008067          	ret
    800075dc:	fe010113          	addi	sp,sp,-32
    800075e0:	00813823          	sd	s0,16(sp)
    800075e4:	00113c23          	sd	ra,24(sp)
    800075e8:	00913423          	sd	s1,8(sp)
    800075ec:	02010413          	addi	s0,sp,32
    800075f0:	0ff7f713          	andi	a4,a5,255
    800075f4:	00900693          	li	a3,9
    800075f8:	04d70c63          	beq	a4,a3,80007650 <devintr+0x84>
    800075fc:	fff00713          	li	a4,-1
    80007600:	03f71713          	slli	a4,a4,0x3f
    80007604:	00170713          	addi	a4,a4,1
    80007608:	00e78c63          	beq	a5,a4,80007620 <devintr+0x54>
    8000760c:	01813083          	ld	ra,24(sp)
    80007610:	01013403          	ld	s0,16(sp)
    80007614:	00813483          	ld	s1,8(sp)
    80007618:	02010113          	addi	sp,sp,32
    8000761c:	00008067          	ret
    80007620:	00000097          	auipc	ra,0x0
    80007624:	c8c080e7          	jalr	-884(ra) # 800072ac <cpuid>
    80007628:	06050663          	beqz	a0,80007694 <devintr+0xc8>
    8000762c:	144027f3          	csrr	a5,sip
    80007630:	ffd7f793          	andi	a5,a5,-3
    80007634:	14479073          	csrw	sip,a5
    80007638:	01813083          	ld	ra,24(sp)
    8000763c:	01013403          	ld	s0,16(sp)
    80007640:	00813483          	ld	s1,8(sp)
    80007644:	00200513          	li	a0,2
    80007648:	02010113          	addi	sp,sp,32
    8000764c:	00008067          	ret
    80007650:	00000097          	auipc	ra,0x0
    80007654:	254080e7          	jalr	596(ra) # 800078a4 <plic_claim>
    80007658:	00a00793          	li	a5,10
    8000765c:	00050493          	mv	s1,a0
    80007660:	06f50663          	beq	a0,a5,800076cc <devintr+0x100>
    80007664:	00100513          	li	a0,1
    80007668:	fa0482e3          	beqz	s1,8000760c <devintr+0x40>
    8000766c:	00048593          	mv	a1,s1
    80007670:	00003517          	auipc	a0,0x3
    80007674:	11850513          	addi	a0,a0,280 # 8000a788 <CONSOLE_STATUS+0x778>
    80007678:	00000097          	auipc	ra,0x0
    8000767c:	670080e7          	jalr	1648(ra) # 80007ce8 <__printf>
    80007680:	00048513          	mv	a0,s1
    80007684:	00000097          	auipc	ra,0x0
    80007688:	258080e7          	jalr	600(ra) # 800078dc <plic_complete>
    8000768c:	00100513          	li	a0,1
    80007690:	f7dff06f          	j	8000760c <devintr+0x40>
    80007694:	00006517          	auipc	a0,0x6
    80007698:	68c50513          	addi	a0,a0,1676 # 8000dd20 <tickslock>
    8000769c:	00001097          	auipc	ra,0x1
    800076a0:	320080e7          	jalr	800(ra) # 800089bc <acquire>
    800076a4:	00005717          	auipc	a4,0x5
    800076a8:	45070713          	addi	a4,a4,1104 # 8000caf4 <ticks>
    800076ac:	00072783          	lw	a5,0(a4)
    800076b0:	00006517          	auipc	a0,0x6
    800076b4:	67050513          	addi	a0,a0,1648 # 8000dd20 <tickslock>
    800076b8:	0017879b          	addiw	a5,a5,1
    800076bc:	00f72023          	sw	a5,0(a4)
    800076c0:	00001097          	auipc	ra,0x1
    800076c4:	3c8080e7          	jalr	968(ra) # 80008a88 <release>
    800076c8:	f65ff06f          	j	8000762c <devintr+0x60>
    800076cc:	00001097          	auipc	ra,0x1
    800076d0:	f24080e7          	jalr	-220(ra) # 800085f0 <uartintr>
    800076d4:	fadff06f          	j	80007680 <devintr+0xb4>
	...

00000000800076e0 <kernelvec>:
    800076e0:	f0010113          	addi	sp,sp,-256
    800076e4:	00113023          	sd	ra,0(sp)
    800076e8:	00213423          	sd	sp,8(sp)
    800076ec:	00313823          	sd	gp,16(sp)
    800076f0:	00413c23          	sd	tp,24(sp)
    800076f4:	02513023          	sd	t0,32(sp)
    800076f8:	02613423          	sd	t1,40(sp)
    800076fc:	02713823          	sd	t2,48(sp)
    80007700:	02813c23          	sd	s0,56(sp)
    80007704:	04913023          	sd	s1,64(sp)
    80007708:	04a13423          	sd	a0,72(sp)
    8000770c:	04b13823          	sd	a1,80(sp)
    80007710:	04c13c23          	sd	a2,88(sp)
    80007714:	06d13023          	sd	a3,96(sp)
    80007718:	06e13423          	sd	a4,104(sp)
    8000771c:	06f13823          	sd	a5,112(sp)
    80007720:	07013c23          	sd	a6,120(sp)
    80007724:	09113023          	sd	a7,128(sp)
    80007728:	09213423          	sd	s2,136(sp)
    8000772c:	09313823          	sd	s3,144(sp)
    80007730:	09413c23          	sd	s4,152(sp)
    80007734:	0b513023          	sd	s5,160(sp)
    80007738:	0b613423          	sd	s6,168(sp)
    8000773c:	0b713823          	sd	s7,176(sp)
    80007740:	0b813c23          	sd	s8,184(sp)
    80007744:	0d913023          	sd	s9,192(sp)
    80007748:	0da13423          	sd	s10,200(sp)
    8000774c:	0db13823          	sd	s11,208(sp)
    80007750:	0dc13c23          	sd	t3,216(sp)
    80007754:	0fd13023          	sd	t4,224(sp)
    80007758:	0fe13423          	sd	t5,232(sp)
    8000775c:	0ff13823          	sd	t6,240(sp)
    80007760:	ccdff0ef          	jal	ra,8000742c <kerneltrap>
    80007764:	00013083          	ld	ra,0(sp)
    80007768:	00813103          	ld	sp,8(sp)
    8000776c:	01013183          	ld	gp,16(sp)
    80007770:	02013283          	ld	t0,32(sp)
    80007774:	02813303          	ld	t1,40(sp)
    80007778:	03013383          	ld	t2,48(sp)
    8000777c:	03813403          	ld	s0,56(sp)
    80007780:	04013483          	ld	s1,64(sp)
    80007784:	04813503          	ld	a0,72(sp)
    80007788:	05013583          	ld	a1,80(sp)
    8000778c:	05813603          	ld	a2,88(sp)
    80007790:	06013683          	ld	a3,96(sp)
    80007794:	06813703          	ld	a4,104(sp)
    80007798:	07013783          	ld	a5,112(sp)
    8000779c:	07813803          	ld	a6,120(sp)
    800077a0:	08013883          	ld	a7,128(sp)
    800077a4:	08813903          	ld	s2,136(sp)
    800077a8:	09013983          	ld	s3,144(sp)
    800077ac:	09813a03          	ld	s4,152(sp)
    800077b0:	0a013a83          	ld	s5,160(sp)
    800077b4:	0a813b03          	ld	s6,168(sp)
    800077b8:	0b013b83          	ld	s7,176(sp)
    800077bc:	0b813c03          	ld	s8,184(sp)
    800077c0:	0c013c83          	ld	s9,192(sp)
    800077c4:	0c813d03          	ld	s10,200(sp)
    800077c8:	0d013d83          	ld	s11,208(sp)
    800077cc:	0d813e03          	ld	t3,216(sp)
    800077d0:	0e013e83          	ld	t4,224(sp)
    800077d4:	0e813f03          	ld	t5,232(sp)
    800077d8:	0f013f83          	ld	t6,240(sp)
    800077dc:	10010113          	addi	sp,sp,256
    800077e0:	10200073          	sret
    800077e4:	00000013          	nop
    800077e8:	00000013          	nop
    800077ec:	00000013          	nop

00000000800077f0 <timervec>:
    800077f0:	34051573          	csrrw	a0,mscratch,a0
    800077f4:	00b53023          	sd	a1,0(a0)
    800077f8:	00c53423          	sd	a2,8(a0)
    800077fc:	00d53823          	sd	a3,16(a0)
    80007800:	01853583          	ld	a1,24(a0)
    80007804:	02053603          	ld	a2,32(a0)
    80007808:	0005b683          	ld	a3,0(a1)
    8000780c:	00c686b3          	add	a3,a3,a2
    80007810:	00d5b023          	sd	a3,0(a1)
    80007814:	00200593          	li	a1,2
    80007818:	14459073          	csrw	sip,a1
    8000781c:	01053683          	ld	a3,16(a0)
    80007820:	00853603          	ld	a2,8(a0)
    80007824:	00053583          	ld	a1,0(a0)
    80007828:	34051573          	csrrw	a0,mscratch,a0
    8000782c:	30200073          	mret

0000000080007830 <plicinit>:
    80007830:	ff010113          	addi	sp,sp,-16
    80007834:	00813423          	sd	s0,8(sp)
    80007838:	01010413          	addi	s0,sp,16
    8000783c:	00813403          	ld	s0,8(sp)
    80007840:	0c0007b7          	lui	a5,0xc000
    80007844:	00100713          	li	a4,1
    80007848:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000784c:	00e7a223          	sw	a4,4(a5)
    80007850:	01010113          	addi	sp,sp,16
    80007854:	00008067          	ret

0000000080007858 <plicinithart>:
    80007858:	ff010113          	addi	sp,sp,-16
    8000785c:	00813023          	sd	s0,0(sp)
    80007860:	00113423          	sd	ra,8(sp)
    80007864:	01010413          	addi	s0,sp,16
    80007868:	00000097          	auipc	ra,0x0
    8000786c:	a44080e7          	jalr	-1468(ra) # 800072ac <cpuid>
    80007870:	0085171b          	slliw	a4,a0,0x8
    80007874:	0c0027b7          	lui	a5,0xc002
    80007878:	00e787b3          	add	a5,a5,a4
    8000787c:	40200713          	li	a4,1026
    80007880:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80007884:	00813083          	ld	ra,8(sp)
    80007888:	00013403          	ld	s0,0(sp)
    8000788c:	00d5151b          	slliw	a0,a0,0xd
    80007890:	0c2017b7          	lui	a5,0xc201
    80007894:	00a78533          	add	a0,a5,a0
    80007898:	00052023          	sw	zero,0(a0)
    8000789c:	01010113          	addi	sp,sp,16
    800078a0:	00008067          	ret

00000000800078a4 <plic_claim>:
    800078a4:	ff010113          	addi	sp,sp,-16
    800078a8:	00813023          	sd	s0,0(sp)
    800078ac:	00113423          	sd	ra,8(sp)
    800078b0:	01010413          	addi	s0,sp,16
    800078b4:	00000097          	auipc	ra,0x0
    800078b8:	9f8080e7          	jalr	-1544(ra) # 800072ac <cpuid>
    800078bc:	00813083          	ld	ra,8(sp)
    800078c0:	00013403          	ld	s0,0(sp)
    800078c4:	00d5151b          	slliw	a0,a0,0xd
    800078c8:	0c2017b7          	lui	a5,0xc201
    800078cc:	00a78533          	add	a0,a5,a0
    800078d0:	00452503          	lw	a0,4(a0)
    800078d4:	01010113          	addi	sp,sp,16
    800078d8:	00008067          	ret

00000000800078dc <plic_complete>:
    800078dc:	fe010113          	addi	sp,sp,-32
    800078e0:	00813823          	sd	s0,16(sp)
    800078e4:	00913423          	sd	s1,8(sp)
    800078e8:	00113c23          	sd	ra,24(sp)
    800078ec:	02010413          	addi	s0,sp,32
    800078f0:	00050493          	mv	s1,a0
    800078f4:	00000097          	auipc	ra,0x0
    800078f8:	9b8080e7          	jalr	-1608(ra) # 800072ac <cpuid>
    800078fc:	01813083          	ld	ra,24(sp)
    80007900:	01013403          	ld	s0,16(sp)
    80007904:	00d5179b          	slliw	a5,a0,0xd
    80007908:	0c201737          	lui	a4,0xc201
    8000790c:	00f707b3          	add	a5,a4,a5
    80007910:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80007914:	00813483          	ld	s1,8(sp)
    80007918:	02010113          	addi	sp,sp,32
    8000791c:	00008067          	ret

0000000080007920 <consolewrite>:
    80007920:	fb010113          	addi	sp,sp,-80
    80007924:	04813023          	sd	s0,64(sp)
    80007928:	04113423          	sd	ra,72(sp)
    8000792c:	02913c23          	sd	s1,56(sp)
    80007930:	03213823          	sd	s2,48(sp)
    80007934:	03313423          	sd	s3,40(sp)
    80007938:	03413023          	sd	s4,32(sp)
    8000793c:	01513c23          	sd	s5,24(sp)
    80007940:	05010413          	addi	s0,sp,80
    80007944:	06c05c63          	blez	a2,800079bc <consolewrite+0x9c>
    80007948:	00060993          	mv	s3,a2
    8000794c:	00050a13          	mv	s4,a0
    80007950:	00058493          	mv	s1,a1
    80007954:	00000913          	li	s2,0
    80007958:	fff00a93          	li	s5,-1
    8000795c:	01c0006f          	j	80007978 <consolewrite+0x58>
    80007960:	fbf44503          	lbu	a0,-65(s0)
    80007964:	0019091b          	addiw	s2,s2,1
    80007968:	00148493          	addi	s1,s1,1
    8000796c:	00001097          	auipc	ra,0x1
    80007970:	a9c080e7          	jalr	-1380(ra) # 80008408 <uartputc>
    80007974:	03298063          	beq	s3,s2,80007994 <consolewrite+0x74>
    80007978:	00048613          	mv	a2,s1
    8000797c:	00100693          	li	a3,1
    80007980:	000a0593          	mv	a1,s4
    80007984:	fbf40513          	addi	a0,s0,-65
    80007988:	00000097          	auipc	ra,0x0
    8000798c:	9dc080e7          	jalr	-1572(ra) # 80007364 <either_copyin>
    80007990:	fd5518e3          	bne	a0,s5,80007960 <consolewrite+0x40>
    80007994:	04813083          	ld	ra,72(sp)
    80007998:	04013403          	ld	s0,64(sp)
    8000799c:	03813483          	ld	s1,56(sp)
    800079a0:	02813983          	ld	s3,40(sp)
    800079a4:	02013a03          	ld	s4,32(sp)
    800079a8:	01813a83          	ld	s5,24(sp)
    800079ac:	00090513          	mv	a0,s2
    800079b0:	03013903          	ld	s2,48(sp)
    800079b4:	05010113          	addi	sp,sp,80
    800079b8:	00008067          	ret
    800079bc:	00000913          	li	s2,0
    800079c0:	fd5ff06f          	j	80007994 <consolewrite+0x74>

00000000800079c4 <consoleread>:
    800079c4:	f9010113          	addi	sp,sp,-112
    800079c8:	06813023          	sd	s0,96(sp)
    800079cc:	04913c23          	sd	s1,88(sp)
    800079d0:	05213823          	sd	s2,80(sp)
    800079d4:	05313423          	sd	s3,72(sp)
    800079d8:	05413023          	sd	s4,64(sp)
    800079dc:	03513c23          	sd	s5,56(sp)
    800079e0:	03613823          	sd	s6,48(sp)
    800079e4:	03713423          	sd	s7,40(sp)
    800079e8:	03813023          	sd	s8,32(sp)
    800079ec:	06113423          	sd	ra,104(sp)
    800079f0:	01913c23          	sd	s9,24(sp)
    800079f4:	07010413          	addi	s0,sp,112
    800079f8:	00060b93          	mv	s7,a2
    800079fc:	00050913          	mv	s2,a0
    80007a00:	00058c13          	mv	s8,a1
    80007a04:	00060b1b          	sext.w	s6,a2
    80007a08:	00006497          	auipc	s1,0x6
    80007a0c:	34048493          	addi	s1,s1,832 # 8000dd48 <cons>
    80007a10:	00400993          	li	s3,4
    80007a14:	fff00a13          	li	s4,-1
    80007a18:	00a00a93          	li	s5,10
    80007a1c:	05705e63          	blez	s7,80007a78 <consoleread+0xb4>
    80007a20:	09c4a703          	lw	a4,156(s1)
    80007a24:	0984a783          	lw	a5,152(s1)
    80007a28:	0007071b          	sext.w	a4,a4
    80007a2c:	08e78463          	beq	a5,a4,80007ab4 <consoleread+0xf0>
    80007a30:	07f7f713          	andi	a4,a5,127
    80007a34:	00e48733          	add	a4,s1,a4
    80007a38:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80007a3c:	0017869b          	addiw	a3,a5,1
    80007a40:	08d4ac23          	sw	a3,152(s1)
    80007a44:	00070c9b          	sext.w	s9,a4
    80007a48:	0b370663          	beq	a4,s3,80007af4 <consoleread+0x130>
    80007a4c:	00100693          	li	a3,1
    80007a50:	f9f40613          	addi	a2,s0,-97
    80007a54:	000c0593          	mv	a1,s8
    80007a58:	00090513          	mv	a0,s2
    80007a5c:	f8e40fa3          	sb	a4,-97(s0)
    80007a60:	00000097          	auipc	ra,0x0
    80007a64:	8b8080e7          	jalr	-1864(ra) # 80007318 <either_copyout>
    80007a68:	01450863          	beq	a0,s4,80007a78 <consoleread+0xb4>
    80007a6c:	001c0c13          	addi	s8,s8,1
    80007a70:	fffb8b9b          	addiw	s7,s7,-1
    80007a74:	fb5c94e3          	bne	s9,s5,80007a1c <consoleread+0x58>
    80007a78:	000b851b          	sext.w	a0,s7
    80007a7c:	06813083          	ld	ra,104(sp)
    80007a80:	06013403          	ld	s0,96(sp)
    80007a84:	05813483          	ld	s1,88(sp)
    80007a88:	05013903          	ld	s2,80(sp)
    80007a8c:	04813983          	ld	s3,72(sp)
    80007a90:	04013a03          	ld	s4,64(sp)
    80007a94:	03813a83          	ld	s5,56(sp)
    80007a98:	02813b83          	ld	s7,40(sp)
    80007a9c:	02013c03          	ld	s8,32(sp)
    80007aa0:	01813c83          	ld	s9,24(sp)
    80007aa4:	40ab053b          	subw	a0,s6,a0
    80007aa8:	03013b03          	ld	s6,48(sp)
    80007aac:	07010113          	addi	sp,sp,112
    80007ab0:	00008067          	ret
    80007ab4:	00001097          	auipc	ra,0x1
    80007ab8:	1d8080e7          	jalr	472(ra) # 80008c8c <push_on>
    80007abc:	0984a703          	lw	a4,152(s1)
    80007ac0:	09c4a783          	lw	a5,156(s1)
    80007ac4:	0007879b          	sext.w	a5,a5
    80007ac8:	fef70ce3          	beq	a4,a5,80007ac0 <consoleread+0xfc>
    80007acc:	00001097          	auipc	ra,0x1
    80007ad0:	234080e7          	jalr	564(ra) # 80008d00 <pop_on>
    80007ad4:	0984a783          	lw	a5,152(s1)
    80007ad8:	07f7f713          	andi	a4,a5,127
    80007adc:	00e48733          	add	a4,s1,a4
    80007ae0:	01874703          	lbu	a4,24(a4)
    80007ae4:	0017869b          	addiw	a3,a5,1
    80007ae8:	08d4ac23          	sw	a3,152(s1)
    80007aec:	00070c9b          	sext.w	s9,a4
    80007af0:	f5371ee3          	bne	a4,s3,80007a4c <consoleread+0x88>
    80007af4:	000b851b          	sext.w	a0,s7
    80007af8:	f96bf2e3          	bgeu	s7,s6,80007a7c <consoleread+0xb8>
    80007afc:	08f4ac23          	sw	a5,152(s1)
    80007b00:	f7dff06f          	j	80007a7c <consoleread+0xb8>

0000000080007b04 <consputc>:
    80007b04:	10000793          	li	a5,256
    80007b08:	00f50663          	beq	a0,a5,80007b14 <consputc+0x10>
    80007b0c:	00001317          	auipc	t1,0x1
    80007b10:	9f430067          	jr	-1548(t1) # 80008500 <uartputc_sync>
    80007b14:	ff010113          	addi	sp,sp,-16
    80007b18:	00113423          	sd	ra,8(sp)
    80007b1c:	00813023          	sd	s0,0(sp)
    80007b20:	01010413          	addi	s0,sp,16
    80007b24:	00800513          	li	a0,8
    80007b28:	00001097          	auipc	ra,0x1
    80007b2c:	9d8080e7          	jalr	-1576(ra) # 80008500 <uartputc_sync>
    80007b30:	02000513          	li	a0,32
    80007b34:	00001097          	auipc	ra,0x1
    80007b38:	9cc080e7          	jalr	-1588(ra) # 80008500 <uartputc_sync>
    80007b3c:	00013403          	ld	s0,0(sp)
    80007b40:	00813083          	ld	ra,8(sp)
    80007b44:	00800513          	li	a0,8
    80007b48:	01010113          	addi	sp,sp,16
    80007b4c:	00001317          	auipc	t1,0x1
    80007b50:	9b430067          	jr	-1612(t1) # 80008500 <uartputc_sync>

0000000080007b54 <consoleintr>:
    80007b54:	fe010113          	addi	sp,sp,-32
    80007b58:	00813823          	sd	s0,16(sp)
    80007b5c:	00913423          	sd	s1,8(sp)
    80007b60:	01213023          	sd	s2,0(sp)
    80007b64:	00113c23          	sd	ra,24(sp)
    80007b68:	02010413          	addi	s0,sp,32
    80007b6c:	00006917          	auipc	s2,0x6
    80007b70:	1dc90913          	addi	s2,s2,476 # 8000dd48 <cons>
    80007b74:	00050493          	mv	s1,a0
    80007b78:	00090513          	mv	a0,s2
    80007b7c:	00001097          	auipc	ra,0x1
    80007b80:	e40080e7          	jalr	-448(ra) # 800089bc <acquire>
    80007b84:	02048c63          	beqz	s1,80007bbc <consoleintr+0x68>
    80007b88:	0a092783          	lw	a5,160(s2)
    80007b8c:	09892703          	lw	a4,152(s2)
    80007b90:	07f00693          	li	a3,127
    80007b94:	40e7873b          	subw	a4,a5,a4
    80007b98:	02e6e263          	bltu	a3,a4,80007bbc <consoleintr+0x68>
    80007b9c:	00d00713          	li	a4,13
    80007ba0:	04e48063          	beq	s1,a4,80007be0 <consoleintr+0x8c>
    80007ba4:	07f7f713          	andi	a4,a5,127
    80007ba8:	00e90733          	add	a4,s2,a4
    80007bac:	0017879b          	addiw	a5,a5,1
    80007bb0:	0af92023          	sw	a5,160(s2)
    80007bb4:	00970c23          	sb	s1,24(a4)
    80007bb8:	08f92e23          	sw	a5,156(s2)
    80007bbc:	01013403          	ld	s0,16(sp)
    80007bc0:	01813083          	ld	ra,24(sp)
    80007bc4:	00813483          	ld	s1,8(sp)
    80007bc8:	00013903          	ld	s2,0(sp)
    80007bcc:	00006517          	auipc	a0,0x6
    80007bd0:	17c50513          	addi	a0,a0,380 # 8000dd48 <cons>
    80007bd4:	02010113          	addi	sp,sp,32
    80007bd8:	00001317          	auipc	t1,0x1
    80007bdc:	eb030067          	jr	-336(t1) # 80008a88 <release>
    80007be0:	00a00493          	li	s1,10
    80007be4:	fc1ff06f          	j	80007ba4 <consoleintr+0x50>

0000000080007be8 <consoleinit>:
    80007be8:	fe010113          	addi	sp,sp,-32
    80007bec:	00113c23          	sd	ra,24(sp)
    80007bf0:	00813823          	sd	s0,16(sp)
    80007bf4:	00913423          	sd	s1,8(sp)
    80007bf8:	02010413          	addi	s0,sp,32
    80007bfc:	00006497          	auipc	s1,0x6
    80007c00:	14c48493          	addi	s1,s1,332 # 8000dd48 <cons>
    80007c04:	00048513          	mv	a0,s1
    80007c08:	00003597          	auipc	a1,0x3
    80007c0c:	bd858593          	addi	a1,a1,-1064 # 8000a7e0 <CONSOLE_STATUS+0x7d0>
    80007c10:	00001097          	auipc	ra,0x1
    80007c14:	d88080e7          	jalr	-632(ra) # 80008998 <initlock>
    80007c18:	00000097          	auipc	ra,0x0
    80007c1c:	7ac080e7          	jalr	1964(ra) # 800083c4 <uartinit>
    80007c20:	01813083          	ld	ra,24(sp)
    80007c24:	01013403          	ld	s0,16(sp)
    80007c28:	00000797          	auipc	a5,0x0
    80007c2c:	d9c78793          	addi	a5,a5,-612 # 800079c4 <consoleread>
    80007c30:	0af4bc23          	sd	a5,184(s1)
    80007c34:	00000797          	auipc	a5,0x0
    80007c38:	cec78793          	addi	a5,a5,-788 # 80007920 <consolewrite>
    80007c3c:	0cf4b023          	sd	a5,192(s1)
    80007c40:	00813483          	ld	s1,8(sp)
    80007c44:	02010113          	addi	sp,sp,32
    80007c48:	00008067          	ret

0000000080007c4c <console_read>:
    80007c4c:	ff010113          	addi	sp,sp,-16
    80007c50:	00813423          	sd	s0,8(sp)
    80007c54:	01010413          	addi	s0,sp,16
    80007c58:	00813403          	ld	s0,8(sp)
    80007c5c:	00006317          	auipc	t1,0x6
    80007c60:	1a433303          	ld	t1,420(t1) # 8000de00 <devsw+0x10>
    80007c64:	01010113          	addi	sp,sp,16
    80007c68:	00030067          	jr	t1

0000000080007c6c <console_write>:
    80007c6c:	ff010113          	addi	sp,sp,-16
    80007c70:	00813423          	sd	s0,8(sp)
    80007c74:	01010413          	addi	s0,sp,16
    80007c78:	00813403          	ld	s0,8(sp)
    80007c7c:	00006317          	auipc	t1,0x6
    80007c80:	18c33303          	ld	t1,396(t1) # 8000de08 <devsw+0x18>
    80007c84:	01010113          	addi	sp,sp,16
    80007c88:	00030067          	jr	t1

0000000080007c8c <panic>:
    80007c8c:	fe010113          	addi	sp,sp,-32
    80007c90:	00113c23          	sd	ra,24(sp)
    80007c94:	00813823          	sd	s0,16(sp)
    80007c98:	00913423          	sd	s1,8(sp)
    80007c9c:	02010413          	addi	s0,sp,32
    80007ca0:	00050493          	mv	s1,a0
    80007ca4:	00003517          	auipc	a0,0x3
    80007ca8:	b4450513          	addi	a0,a0,-1212 # 8000a7e8 <CONSOLE_STATUS+0x7d8>
    80007cac:	00006797          	auipc	a5,0x6
    80007cb0:	1e07ae23          	sw	zero,508(a5) # 8000dea8 <pr+0x18>
    80007cb4:	00000097          	auipc	ra,0x0
    80007cb8:	034080e7          	jalr	52(ra) # 80007ce8 <__printf>
    80007cbc:	00048513          	mv	a0,s1
    80007cc0:	00000097          	auipc	ra,0x0
    80007cc4:	028080e7          	jalr	40(ra) # 80007ce8 <__printf>
    80007cc8:	00003517          	auipc	a0,0x3
    80007ccc:	8a850513          	addi	a0,a0,-1880 # 8000a570 <CONSOLE_STATUS+0x560>
    80007cd0:	00000097          	auipc	ra,0x0
    80007cd4:	018080e7          	jalr	24(ra) # 80007ce8 <__printf>
    80007cd8:	00100793          	li	a5,1
    80007cdc:	00005717          	auipc	a4,0x5
    80007ce0:	e0f72e23          	sw	a5,-484(a4) # 8000caf8 <panicked>
    80007ce4:	0000006f          	j	80007ce4 <panic+0x58>

0000000080007ce8 <__printf>:
    80007ce8:	f3010113          	addi	sp,sp,-208
    80007cec:	08813023          	sd	s0,128(sp)
    80007cf0:	07313423          	sd	s3,104(sp)
    80007cf4:	09010413          	addi	s0,sp,144
    80007cf8:	05813023          	sd	s8,64(sp)
    80007cfc:	08113423          	sd	ra,136(sp)
    80007d00:	06913c23          	sd	s1,120(sp)
    80007d04:	07213823          	sd	s2,112(sp)
    80007d08:	07413023          	sd	s4,96(sp)
    80007d0c:	05513c23          	sd	s5,88(sp)
    80007d10:	05613823          	sd	s6,80(sp)
    80007d14:	05713423          	sd	s7,72(sp)
    80007d18:	03913c23          	sd	s9,56(sp)
    80007d1c:	03a13823          	sd	s10,48(sp)
    80007d20:	03b13423          	sd	s11,40(sp)
    80007d24:	00006317          	auipc	t1,0x6
    80007d28:	16c30313          	addi	t1,t1,364 # 8000de90 <pr>
    80007d2c:	01832c03          	lw	s8,24(t1)
    80007d30:	00b43423          	sd	a1,8(s0)
    80007d34:	00c43823          	sd	a2,16(s0)
    80007d38:	00d43c23          	sd	a3,24(s0)
    80007d3c:	02e43023          	sd	a4,32(s0)
    80007d40:	02f43423          	sd	a5,40(s0)
    80007d44:	03043823          	sd	a6,48(s0)
    80007d48:	03143c23          	sd	a7,56(s0)
    80007d4c:	00050993          	mv	s3,a0
    80007d50:	4a0c1663          	bnez	s8,800081fc <__printf+0x514>
    80007d54:	60098c63          	beqz	s3,8000836c <__printf+0x684>
    80007d58:	0009c503          	lbu	a0,0(s3)
    80007d5c:	00840793          	addi	a5,s0,8
    80007d60:	f6f43c23          	sd	a5,-136(s0)
    80007d64:	00000493          	li	s1,0
    80007d68:	22050063          	beqz	a0,80007f88 <__printf+0x2a0>
    80007d6c:	00002a37          	lui	s4,0x2
    80007d70:	00018ab7          	lui	s5,0x18
    80007d74:	000f4b37          	lui	s6,0xf4
    80007d78:	00989bb7          	lui	s7,0x989
    80007d7c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80007d80:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80007d84:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80007d88:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80007d8c:	00148c9b          	addiw	s9,s1,1
    80007d90:	02500793          	li	a5,37
    80007d94:	01998933          	add	s2,s3,s9
    80007d98:	38f51263          	bne	a0,a5,8000811c <__printf+0x434>
    80007d9c:	00094783          	lbu	a5,0(s2)
    80007da0:	00078c9b          	sext.w	s9,a5
    80007da4:	1e078263          	beqz	a5,80007f88 <__printf+0x2a0>
    80007da8:	0024849b          	addiw	s1,s1,2
    80007dac:	07000713          	li	a4,112
    80007db0:	00998933          	add	s2,s3,s1
    80007db4:	38e78a63          	beq	a5,a4,80008148 <__printf+0x460>
    80007db8:	20f76863          	bltu	a4,a5,80007fc8 <__printf+0x2e0>
    80007dbc:	42a78863          	beq	a5,a0,800081ec <__printf+0x504>
    80007dc0:	06400713          	li	a4,100
    80007dc4:	40e79663          	bne	a5,a4,800081d0 <__printf+0x4e8>
    80007dc8:	f7843783          	ld	a5,-136(s0)
    80007dcc:	0007a603          	lw	a2,0(a5)
    80007dd0:	00878793          	addi	a5,a5,8
    80007dd4:	f6f43c23          	sd	a5,-136(s0)
    80007dd8:	42064a63          	bltz	a2,8000820c <__printf+0x524>
    80007ddc:	00a00713          	li	a4,10
    80007de0:	02e677bb          	remuw	a5,a2,a4
    80007de4:	00003d97          	auipc	s11,0x3
    80007de8:	a2cd8d93          	addi	s11,s11,-1492 # 8000a810 <digits>
    80007dec:	00900593          	li	a1,9
    80007df0:	0006051b          	sext.w	a0,a2
    80007df4:	00000c93          	li	s9,0
    80007df8:	02079793          	slli	a5,a5,0x20
    80007dfc:	0207d793          	srli	a5,a5,0x20
    80007e00:	00fd87b3          	add	a5,s11,a5
    80007e04:	0007c783          	lbu	a5,0(a5)
    80007e08:	02e656bb          	divuw	a3,a2,a4
    80007e0c:	f8f40023          	sb	a5,-128(s0)
    80007e10:	14c5d863          	bge	a1,a2,80007f60 <__printf+0x278>
    80007e14:	06300593          	li	a1,99
    80007e18:	00100c93          	li	s9,1
    80007e1c:	02e6f7bb          	remuw	a5,a3,a4
    80007e20:	02079793          	slli	a5,a5,0x20
    80007e24:	0207d793          	srli	a5,a5,0x20
    80007e28:	00fd87b3          	add	a5,s11,a5
    80007e2c:	0007c783          	lbu	a5,0(a5)
    80007e30:	02e6d73b          	divuw	a4,a3,a4
    80007e34:	f8f400a3          	sb	a5,-127(s0)
    80007e38:	12a5f463          	bgeu	a1,a0,80007f60 <__printf+0x278>
    80007e3c:	00a00693          	li	a3,10
    80007e40:	00900593          	li	a1,9
    80007e44:	02d777bb          	remuw	a5,a4,a3
    80007e48:	02079793          	slli	a5,a5,0x20
    80007e4c:	0207d793          	srli	a5,a5,0x20
    80007e50:	00fd87b3          	add	a5,s11,a5
    80007e54:	0007c503          	lbu	a0,0(a5)
    80007e58:	02d757bb          	divuw	a5,a4,a3
    80007e5c:	f8a40123          	sb	a0,-126(s0)
    80007e60:	48e5f263          	bgeu	a1,a4,800082e4 <__printf+0x5fc>
    80007e64:	06300513          	li	a0,99
    80007e68:	02d7f5bb          	remuw	a1,a5,a3
    80007e6c:	02059593          	slli	a1,a1,0x20
    80007e70:	0205d593          	srli	a1,a1,0x20
    80007e74:	00bd85b3          	add	a1,s11,a1
    80007e78:	0005c583          	lbu	a1,0(a1)
    80007e7c:	02d7d7bb          	divuw	a5,a5,a3
    80007e80:	f8b401a3          	sb	a1,-125(s0)
    80007e84:	48e57263          	bgeu	a0,a4,80008308 <__printf+0x620>
    80007e88:	3e700513          	li	a0,999
    80007e8c:	02d7f5bb          	remuw	a1,a5,a3
    80007e90:	02059593          	slli	a1,a1,0x20
    80007e94:	0205d593          	srli	a1,a1,0x20
    80007e98:	00bd85b3          	add	a1,s11,a1
    80007e9c:	0005c583          	lbu	a1,0(a1)
    80007ea0:	02d7d7bb          	divuw	a5,a5,a3
    80007ea4:	f8b40223          	sb	a1,-124(s0)
    80007ea8:	46e57663          	bgeu	a0,a4,80008314 <__printf+0x62c>
    80007eac:	02d7f5bb          	remuw	a1,a5,a3
    80007eb0:	02059593          	slli	a1,a1,0x20
    80007eb4:	0205d593          	srli	a1,a1,0x20
    80007eb8:	00bd85b3          	add	a1,s11,a1
    80007ebc:	0005c583          	lbu	a1,0(a1)
    80007ec0:	02d7d7bb          	divuw	a5,a5,a3
    80007ec4:	f8b402a3          	sb	a1,-123(s0)
    80007ec8:	46ea7863          	bgeu	s4,a4,80008338 <__printf+0x650>
    80007ecc:	02d7f5bb          	remuw	a1,a5,a3
    80007ed0:	02059593          	slli	a1,a1,0x20
    80007ed4:	0205d593          	srli	a1,a1,0x20
    80007ed8:	00bd85b3          	add	a1,s11,a1
    80007edc:	0005c583          	lbu	a1,0(a1)
    80007ee0:	02d7d7bb          	divuw	a5,a5,a3
    80007ee4:	f8b40323          	sb	a1,-122(s0)
    80007ee8:	3eeaf863          	bgeu	s5,a4,800082d8 <__printf+0x5f0>
    80007eec:	02d7f5bb          	remuw	a1,a5,a3
    80007ef0:	02059593          	slli	a1,a1,0x20
    80007ef4:	0205d593          	srli	a1,a1,0x20
    80007ef8:	00bd85b3          	add	a1,s11,a1
    80007efc:	0005c583          	lbu	a1,0(a1)
    80007f00:	02d7d7bb          	divuw	a5,a5,a3
    80007f04:	f8b403a3          	sb	a1,-121(s0)
    80007f08:	42eb7e63          	bgeu	s6,a4,80008344 <__printf+0x65c>
    80007f0c:	02d7f5bb          	remuw	a1,a5,a3
    80007f10:	02059593          	slli	a1,a1,0x20
    80007f14:	0205d593          	srli	a1,a1,0x20
    80007f18:	00bd85b3          	add	a1,s11,a1
    80007f1c:	0005c583          	lbu	a1,0(a1)
    80007f20:	02d7d7bb          	divuw	a5,a5,a3
    80007f24:	f8b40423          	sb	a1,-120(s0)
    80007f28:	42ebfc63          	bgeu	s7,a4,80008360 <__printf+0x678>
    80007f2c:	02079793          	slli	a5,a5,0x20
    80007f30:	0207d793          	srli	a5,a5,0x20
    80007f34:	00fd8db3          	add	s11,s11,a5
    80007f38:	000dc703          	lbu	a4,0(s11)
    80007f3c:	00a00793          	li	a5,10
    80007f40:	00900c93          	li	s9,9
    80007f44:	f8e404a3          	sb	a4,-119(s0)
    80007f48:	00065c63          	bgez	a2,80007f60 <__printf+0x278>
    80007f4c:	f9040713          	addi	a4,s0,-112
    80007f50:	00f70733          	add	a4,a4,a5
    80007f54:	02d00693          	li	a3,45
    80007f58:	fed70823          	sb	a3,-16(a4)
    80007f5c:	00078c93          	mv	s9,a5
    80007f60:	f8040793          	addi	a5,s0,-128
    80007f64:	01978cb3          	add	s9,a5,s9
    80007f68:	f7f40d13          	addi	s10,s0,-129
    80007f6c:	000cc503          	lbu	a0,0(s9)
    80007f70:	fffc8c93          	addi	s9,s9,-1
    80007f74:	00000097          	auipc	ra,0x0
    80007f78:	b90080e7          	jalr	-1136(ra) # 80007b04 <consputc>
    80007f7c:	ffac98e3          	bne	s9,s10,80007f6c <__printf+0x284>
    80007f80:	00094503          	lbu	a0,0(s2)
    80007f84:	e00514e3          	bnez	a0,80007d8c <__printf+0xa4>
    80007f88:	1a0c1663          	bnez	s8,80008134 <__printf+0x44c>
    80007f8c:	08813083          	ld	ra,136(sp)
    80007f90:	08013403          	ld	s0,128(sp)
    80007f94:	07813483          	ld	s1,120(sp)
    80007f98:	07013903          	ld	s2,112(sp)
    80007f9c:	06813983          	ld	s3,104(sp)
    80007fa0:	06013a03          	ld	s4,96(sp)
    80007fa4:	05813a83          	ld	s5,88(sp)
    80007fa8:	05013b03          	ld	s6,80(sp)
    80007fac:	04813b83          	ld	s7,72(sp)
    80007fb0:	04013c03          	ld	s8,64(sp)
    80007fb4:	03813c83          	ld	s9,56(sp)
    80007fb8:	03013d03          	ld	s10,48(sp)
    80007fbc:	02813d83          	ld	s11,40(sp)
    80007fc0:	0d010113          	addi	sp,sp,208
    80007fc4:	00008067          	ret
    80007fc8:	07300713          	li	a4,115
    80007fcc:	1ce78a63          	beq	a5,a4,800081a0 <__printf+0x4b8>
    80007fd0:	07800713          	li	a4,120
    80007fd4:	1ee79e63          	bne	a5,a4,800081d0 <__printf+0x4e8>
    80007fd8:	f7843783          	ld	a5,-136(s0)
    80007fdc:	0007a703          	lw	a4,0(a5)
    80007fe0:	00878793          	addi	a5,a5,8
    80007fe4:	f6f43c23          	sd	a5,-136(s0)
    80007fe8:	28074263          	bltz	a4,8000826c <__printf+0x584>
    80007fec:	00003d97          	auipc	s11,0x3
    80007ff0:	824d8d93          	addi	s11,s11,-2012 # 8000a810 <digits>
    80007ff4:	00f77793          	andi	a5,a4,15
    80007ff8:	00fd87b3          	add	a5,s11,a5
    80007ffc:	0007c683          	lbu	a3,0(a5)
    80008000:	00f00613          	li	a2,15
    80008004:	0007079b          	sext.w	a5,a4
    80008008:	f8d40023          	sb	a3,-128(s0)
    8000800c:	0047559b          	srliw	a1,a4,0x4
    80008010:	0047569b          	srliw	a3,a4,0x4
    80008014:	00000c93          	li	s9,0
    80008018:	0ee65063          	bge	a2,a4,800080f8 <__printf+0x410>
    8000801c:	00f6f693          	andi	a3,a3,15
    80008020:	00dd86b3          	add	a3,s11,a3
    80008024:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80008028:	0087d79b          	srliw	a5,a5,0x8
    8000802c:	00100c93          	li	s9,1
    80008030:	f8d400a3          	sb	a3,-127(s0)
    80008034:	0cb67263          	bgeu	a2,a1,800080f8 <__printf+0x410>
    80008038:	00f7f693          	andi	a3,a5,15
    8000803c:	00dd86b3          	add	a3,s11,a3
    80008040:	0006c583          	lbu	a1,0(a3)
    80008044:	00f00613          	li	a2,15
    80008048:	0047d69b          	srliw	a3,a5,0x4
    8000804c:	f8b40123          	sb	a1,-126(s0)
    80008050:	0047d593          	srli	a1,a5,0x4
    80008054:	28f67e63          	bgeu	a2,a5,800082f0 <__printf+0x608>
    80008058:	00f6f693          	andi	a3,a3,15
    8000805c:	00dd86b3          	add	a3,s11,a3
    80008060:	0006c503          	lbu	a0,0(a3)
    80008064:	0087d813          	srli	a6,a5,0x8
    80008068:	0087d69b          	srliw	a3,a5,0x8
    8000806c:	f8a401a3          	sb	a0,-125(s0)
    80008070:	28b67663          	bgeu	a2,a1,800082fc <__printf+0x614>
    80008074:	00f6f693          	andi	a3,a3,15
    80008078:	00dd86b3          	add	a3,s11,a3
    8000807c:	0006c583          	lbu	a1,0(a3)
    80008080:	00c7d513          	srli	a0,a5,0xc
    80008084:	00c7d69b          	srliw	a3,a5,0xc
    80008088:	f8b40223          	sb	a1,-124(s0)
    8000808c:	29067a63          	bgeu	a2,a6,80008320 <__printf+0x638>
    80008090:	00f6f693          	andi	a3,a3,15
    80008094:	00dd86b3          	add	a3,s11,a3
    80008098:	0006c583          	lbu	a1,0(a3)
    8000809c:	0107d813          	srli	a6,a5,0x10
    800080a0:	0107d69b          	srliw	a3,a5,0x10
    800080a4:	f8b402a3          	sb	a1,-123(s0)
    800080a8:	28a67263          	bgeu	a2,a0,8000832c <__printf+0x644>
    800080ac:	00f6f693          	andi	a3,a3,15
    800080b0:	00dd86b3          	add	a3,s11,a3
    800080b4:	0006c683          	lbu	a3,0(a3)
    800080b8:	0147d79b          	srliw	a5,a5,0x14
    800080bc:	f8d40323          	sb	a3,-122(s0)
    800080c0:	21067663          	bgeu	a2,a6,800082cc <__printf+0x5e4>
    800080c4:	02079793          	slli	a5,a5,0x20
    800080c8:	0207d793          	srli	a5,a5,0x20
    800080cc:	00fd8db3          	add	s11,s11,a5
    800080d0:	000dc683          	lbu	a3,0(s11)
    800080d4:	00800793          	li	a5,8
    800080d8:	00700c93          	li	s9,7
    800080dc:	f8d403a3          	sb	a3,-121(s0)
    800080e0:	00075c63          	bgez	a4,800080f8 <__printf+0x410>
    800080e4:	f9040713          	addi	a4,s0,-112
    800080e8:	00f70733          	add	a4,a4,a5
    800080ec:	02d00693          	li	a3,45
    800080f0:	fed70823          	sb	a3,-16(a4)
    800080f4:	00078c93          	mv	s9,a5
    800080f8:	f8040793          	addi	a5,s0,-128
    800080fc:	01978cb3          	add	s9,a5,s9
    80008100:	f7f40d13          	addi	s10,s0,-129
    80008104:	000cc503          	lbu	a0,0(s9)
    80008108:	fffc8c93          	addi	s9,s9,-1
    8000810c:	00000097          	auipc	ra,0x0
    80008110:	9f8080e7          	jalr	-1544(ra) # 80007b04 <consputc>
    80008114:	ff9d18e3          	bne	s10,s9,80008104 <__printf+0x41c>
    80008118:	0100006f          	j	80008128 <__printf+0x440>
    8000811c:	00000097          	auipc	ra,0x0
    80008120:	9e8080e7          	jalr	-1560(ra) # 80007b04 <consputc>
    80008124:	000c8493          	mv	s1,s9
    80008128:	00094503          	lbu	a0,0(s2)
    8000812c:	c60510e3          	bnez	a0,80007d8c <__printf+0xa4>
    80008130:	e40c0ee3          	beqz	s8,80007f8c <__printf+0x2a4>
    80008134:	00006517          	auipc	a0,0x6
    80008138:	d5c50513          	addi	a0,a0,-676 # 8000de90 <pr>
    8000813c:	00001097          	auipc	ra,0x1
    80008140:	94c080e7          	jalr	-1716(ra) # 80008a88 <release>
    80008144:	e49ff06f          	j	80007f8c <__printf+0x2a4>
    80008148:	f7843783          	ld	a5,-136(s0)
    8000814c:	03000513          	li	a0,48
    80008150:	01000d13          	li	s10,16
    80008154:	00878713          	addi	a4,a5,8
    80008158:	0007bc83          	ld	s9,0(a5)
    8000815c:	f6e43c23          	sd	a4,-136(s0)
    80008160:	00000097          	auipc	ra,0x0
    80008164:	9a4080e7          	jalr	-1628(ra) # 80007b04 <consputc>
    80008168:	07800513          	li	a0,120
    8000816c:	00000097          	auipc	ra,0x0
    80008170:	998080e7          	jalr	-1640(ra) # 80007b04 <consputc>
    80008174:	00002d97          	auipc	s11,0x2
    80008178:	69cd8d93          	addi	s11,s11,1692 # 8000a810 <digits>
    8000817c:	03ccd793          	srli	a5,s9,0x3c
    80008180:	00fd87b3          	add	a5,s11,a5
    80008184:	0007c503          	lbu	a0,0(a5)
    80008188:	fffd0d1b          	addiw	s10,s10,-1
    8000818c:	004c9c93          	slli	s9,s9,0x4
    80008190:	00000097          	auipc	ra,0x0
    80008194:	974080e7          	jalr	-1676(ra) # 80007b04 <consputc>
    80008198:	fe0d12e3          	bnez	s10,8000817c <__printf+0x494>
    8000819c:	f8dff06f          	j	80008128 <__printf+0x440>
    800081a0:	f7843783          	ld	a5,-136(s0)
    800081a4:	0007bc83          	ld	s9,0(a5)
    800081a8:	00878793          	addi	a5,a5,8
    800081ac:	f6f43c23          	sd	a5,-136(s0)
    800081b0:	000c9a63          	bnez	s9,800081c4 <__printf+0x4dc>
    800081b4:	1080006f          	j	800082bc <__printf+0x5d4>
    800081b8:	001c8c93          	addi	s9,s9,1
    800081bc:	00000097          	auipc	ra,0x0
    800081c0:	948080e7          	jalr	-1720(ra) # 80007b04 <consputc>
    800081c4:	000cc503          	lbu	a0,0(s9)
    800081c8:	fe0518e3          	bnez	a0,800081b8 <__printf+0x4d0>
    800081cc:	f5dff06f          	j	80008128 <__printf+0x440>
    800081d0:	02500513          	li	a0,37
    800081d4:	00000097          	auipc	ra,0x0
    800081d8:	930080e7          	jalr	-1744(ra) # 80007b04 <consputc>
    800081dc:	000c8513          	mv	a0,s9
    800081e0:	00000097          	auipc	ra,0x0
    800081e4:	924080e7          	jalr	-1756(ra) # 80007b04 <consputc>
    800081e8:	f41ff06f          	j	80008128 <__printf+0x440>
    800081ec:	02500513          	li	a0,37
    800081f0:	00000097          	auipc	ra,0x0
    800081f4:	914080e7          	jalr	-1772(ra) # 80007b04 <consputc>
    800081f8:	f31ff06f          	j	80008128 <__printf+0x440>
    800081fc:	00030513          	mv	a0,t1
    80008200:	00000097          	auipc	ra,0x0
    80008204:	7bc080e7          	jalr	1980(ra) # 800089bc <acquire>
    80008208:	b4dff06f          	j	80007d54 <__printf+0x6c>
    8000820c:	40c0053b          	negw	a0,a2
    80008210:	00a00713          	li	a4,10
    80008214:	02e576bb          	remuw	a3,a0,a4
    80008218:	00002d97          	auipc	s11,0x2
    8000821c:	5f8d8d93          	addi	s11,s11,1528 # 8000a810 <digits>
    80008220:	ff700593          	li	a1,-9
    80008224:	02069693          	slli	a3,a3,0x20
    80008228:	0206d693          	srli	a3,a3,0x20
    8000822c:	00dd86b3          	add	a3,s11,a3
    80008230:	0006c683          	lbu	a3,0(a3)
    80008234:	02e557bb          	divuw	a5,a0,a4
    80008238:	f8d40023          	sb	a3,-128(s0)
    8000823c:	10b65e63          	bge	a2,a1,80008358 <__printf+0x670>
    80008240:	06300593          	li	a1,99
    80008244:	02e7f6bb          	remuw	a3,a5,a4
    80008248:	02069693          	slli	a3,a3,0x20
    8000824c:	0206d693          	srli	a3,a3,0x20
    80008250:	00dd86b3          	add	a3,s11,a3
    80008254:	0006c683          	lbu	a3,0(a3)
    80008258:	02e7d73b          	divuw	a4,a5,a4
    8000825c:	00200793          	li	a5,2
    80008260:	f8d400a3          	sb	a3,-127(s0)
    80008264:	bca5ece3          	bltu	a1,a0,80007e3c <__printf+0x154>
    80008268:	ce5ff06f          	j	80007f4c <__printf+0x264>
    8000826c:	40e007bb          	negw	a5,a4
    80008270:	00002d97          	auipc	s11,0x2
    80008274:	5a0d8d93          	addi	s11,s11,1440 # 8000a810 <digits>
    80008278:	00f7f693          	andi	a3,a5,15
    8000827c:	00dd86b3          	add	a3,s11,a3
    80008280:	0006c583          	lbu	a1,0(a3)
    80008284:	ff100613          	li	a2,-15
    80008288:	0047d69b          	srliw	a3,a5,0x4
    8000828c:	f8b40023          	sb	a1,-128(s0)
    80008290:	0047d59b          	srliw	a1,a5,0x4
    80008294:	0ac75e63          	bge	a4,a2,80008350 <__printf+0x668>
    80008298:	00f6f693          	andi	a3,a3,15
    8000829c:	00dd86b3          	add	a3,s11,a3
    800082a0:	0006c603          	lbu	a2,0(a3)
    800082a4:	00f00693          	li	a3,15
    800082a8:	0087d79b          	srliw	a5,a5,0x8
    800082ac:	f8c400a3          	sb	a2,-127(s0)
    800082b0:	d8b6e4e3          	bltu	a3,a1,80008038 <__printf+0x350>
    800082b4:	00200793          	li	a5,2
    800082b8:	e2dff06f          	j	800080e4 <__printf+0x3fc>
    800082bc:	00002c97          	auipc	s9,0x2
    800082c0:	534c8c93          	addi	s9,s9,1332 # 8000a7f0 <CONSOLE_STATUS+0x7e0>
    800082c4:	02800513          	li	a0,40
    800082c8:	ef1ff06f          	j	800081b8 <__printf+0x4d0>
    800082cc:	00700793          	li	a5,7
    800082d0:	00600c93          	li	s9,6
    800082d4:	e0dff06f          	j	800080e0 <__printf+0x3f8>
    800082d8:	00700793          	li	a5,7
    800082dc:	00600c93          	li	s9,6
    800082e0:	c69ff06f          	j	80007f48 <__printf+0x260>
    800082e4:	00300793          	li	a5,3
    800082e8:	00200c93          	li	s9,2
    800082ec:	c5dff06f          	j	80007f48 <__printf+0x260>
    800082f0:	00300793          	li	a5,3
    800082f4:	00200c93          	li	s9,2
    800082f8:	de9ff06f          	j	800080e0 <__printf+0x3f8>
    800082fc:	00400793          	li	a5,4
    80008300:	00300c93          	li	s9,3
    80008304:	dddff06f          	j	800080e0 <__printf+0x3f8>
    80008308:	00400793          	li	a5,4
    8000830c:	00300c93          	li	s9,3
    80008310:	c39ff06f          	j	80007f48 <__printf+0x260>
    80008314:	00500793          	li	a5,5
    80008318:	00400c93          	li	s9,4
    8000831c:	c2dff06f          	j	80007f48 <__printf+0x260>
    80008320:	00500793          	li	a5,5
    80008324:	00400c93          	li	s9,4
    80008328:	db9ff06f          	j	800080e0 <__printf+0x3f8>
    8000832c:	00600793          	li	a5,6
    80008330:	00500c93          	li	s9,5
    80008334:	dadff06f          	j	800080e0 <__printf+0x3f8>
    80008338:	00600793          	li	a5,6
    8000833c:	00500c93          	li	s9,5
    80008340:	c09ff06f          	j	80007f48 <__printf+0x260>
    80008344:	00800793          	li	a5,8
    80008348:	00700c93          	li	s9,7
    8000834c:	bfdff06f          	j	80007f48 <__printf+0x260>
    80008350:	00100793          	li	a5,1
    80008354:	d91ff06f          	j	800080e4 <__printf+0x3fc>
    80008358:	00100793          	li	a5,1
    8000835c:	bf1ff06f          	j	80007f4c <__printf+0x264>
    80008360:	00900793          	li	a5,9
    80008364:	00800c93          	li	s9,8
    80008368:	be1ff06f          	j	80007f48 <__printf+0x260>
    8000836c:	00002517          	auipc	a0,0x2
    80008370:	48c50513          	addi	a0,a0,1164 # 8000a7f8 <CONSOLE_STATUS+0x7e8>
    80008374:	00000097          	auipc	ra,0x0
    80008378:	918080e7          	jalr	-1768(ra) # 80007c8c <panic>

000000008000837c <printfinit>:
    8000837c:	fe010113          	addi	sp,sp,-32
    80008380:	00813823          	sd	s0,16(sp)
    80008384:	00913423          	sd	s1,8(sp)
    80008388:	00113c23          	sd	ra,24(sp)
    8000838c:	02010413          	addi	s0,sp,32
    80008390:	00006497          	auipc	s1,0x6
    80008394:	b0048493          	addi	s1,s1,-1280 # 8000de90 <pr>
    80008398:	00048513          	mv	a0,s1
    8000839c:	00002597          	auipc	a1,0x2
    800083a0:	46c58593          	addi	a1,a1,1132 # 8000a808 <CONSOLE_STATUS+0x7f8>
    800083a4:	00000097          	auipc	ra,0x0
    800083a8:	5f4080e7          	jalr	1524(ra) # 80008998 <initlock>
    800083ac:	01813083          	ld	ra,24(sp)
    800083b0:	01013403          	ld	s0,16(sp)
    800083b4:	0004ac23          	sw	zero,24(s1)
    800083b8:	00813483          	ld	s1,8(sp)
    800083bc:	02010113          	addi	sp,sp,32
    800083c0:	00008067          	ret

00000000800083c4 <uartinit>:
    800083c4:	ff010113          	addi	sp,sp,-16
    800083c8:	00813423          	sd	s0,8(sp)
    800083cc:	01010413          	addi	s0,sp,16
    800083d0:	100007b7          	lui	a5,0x10000
    800083d4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800083d8:	f8000713          	li	a4,-128
    800083dc:	00e781a3          	sb	a4,3(a5)
    800083e0:	00300713          	li	a4,3
    800083e4:	00e78023          	sb	a4,0(a5)
    800083e8:	000780a3          	sb	zero,1(a5)
    800083ec:	00e781a3          	sb	a4,3(a5)
    800083f0:	00700693          	li	a3,7
    800083f4:	00d78123          	sb	a3,2(a5)
    800083f8:	00e780a3          	sb	a4,1(a5)
    800083fc:	00813403          	ld	s0,8(sp)
    80008400:	01010113          	addi	sp,sp,16
    80008404:	00008067          	ret

0000000080008408 <uartputc>:
    80008408:	00004797          	auipc	a5,0x4
    8000840c:	6f07a783          	lw	a5,1776(a5) # 8000caf8 <panicked>
    80008410:	00078463          	beqz	a5,80008418 <uartputc+0x10>
    80008414:	0000006f          	j	80008414 <uartputc+0xc>
    80008418:	fd010113          	addi	sp,sp,-48
    8000841c:	02813023          	sd	s0,32(sp)
    80008420:	00913c23          	sd	s1,24(sp)
    80008424:	01213823          	sd	s2,16(sp)
    80008428:	01313423          	sd	s3,8(sp)
    8000842c:	02113423          	sd	ra,40(sp)
    80008430:	03010413          	addi	s0,sp,48
    80008434:	00004917          	auipc	s2,0x4
    80008438:	6cc90913          	addi	s2,s2,1740 # 8000cb00 <uart_tx_r>
    8000843c:	00093783          	ld	a5,0(s2)
    80008440:	00004497          	auipc	s1,0x4
    80008444:	6c848493          	addi	s1,s1,1736 # 8000cb08 <uart_tx_w>
    80008448:	0004b703          	ld	a4,0(s1)
    8000844c:	02078693          	addi	a3,a5,32
    80008450:	00050993          	mv	s3,a0
    80008454:	02e69c63          	bne	a3,a4,8000848c <uartputc+0x84>
    80008458:	00001097          	auipc	ra,0x1
    8000845c:	834080e7          	jalr	-1996(ra) # 80008c8c <push_on>
    80008460:	00093783          	ld	a5,0(s2)
    80008464:	0004b703          	ld	a4,0(s1)
    80008468:	02078793          	addi	a5,a5,32
    8000846c:	00e79463          	bne	a5,a4,80008474 <uartputc+0x6c>
    80008470:	0000006f          	j	80008470 <uartputc+0x68>
    80008474:	00001097          	auipc	ra,0x1
    80008478:	88c080e7          	jalr	-1908(ra) # 80008d00 <pop_on>
    8000847c:	00093783          	ld	a5,0(s2)
    80008480:	0004b703          	ld	a4,0(s1)
    80008484:	02078693          	addi	a3,a5,32
    80008488:	fce688e3          	beq	a3,a4,80008458 <uartputc+0x50>
    8000848c:	01f77693          	andi	a3,a4,31
    80008490:	00006597          	auipc	a1,0x6
    80008494:	a2058593          	addi	a1,a1,-1504 # 8000deb0 <uart_tx_buf>
    80008498:	00d586b3          	add	a3,a1,a3
    8000849c:	00170713          	addi	a4,a4,1
    800084a0:	01368023          	sb	s3,0(a3)
    800084a4:	00e4b023          	sd	a4,0(s1)
    800084a8:	10000637          	lui	a2,0x10000
    800084ac:	02f71063          	bne	a4,a5,800084cc <uartputc+0xc4>
    800084b0:	0340006f          	j	800084e4 <uartputc+0xdc>
    800084b4:	00074703          	lbu	a4,0(a4)
    800084b8:	00f93023          	sd	a5,0(s2)
    800084bc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800084c0:	00093783          	ld	a5,0(s2)
    800084c4:	0004b703          	ld	a4,0(s1)
    800084c8:	00f70e63          	beq	a4,a5,800084e4 <uartputc+0xdc>
    800084cc:	00564683          	lbu	a3,5(a2)
    800084d0:	01f7f713          	andi	a4,a5,31
    800084d4:	00e58733          	add	a4,a1,a4
    800084d8:	0206f693          	andi	a3,a3,32
    800084dc:	00178793          	addi	a5,a5,1
    800084e0:	fc069ae3          	bnez	a3,800084b4 <uartputc+0xac>
    800084e4:	02813083          	ld	ra,40(sp)
    800084e8:	02013403          	ld	s0,32(sp)
    800084ec:	01813483          	ld	s1,24(sp)
    800084f0:	01013903          	ld	s2,16(sp)
    800084f4:	00813983          	ld	s3,8(sp)
    800084f8:	03010113          	addi	sp,sp,48
    800084fc:	00008067          	ret

0000000080008500 <uartputc_sync>:
    80008500:	ff010113          	addi	sp,sp,-16
    80008504:	00813423          	sd	s0,8(sp)
    80008508:	01010413          	addi	s0,sp,16
    8000850c:	00004717          	auipc	a4,0x4
    80008510:	5ec72703          	lw	a4,1516(a4) # 8000caf8 <panicked>
    80008514:	02071663          	bnez	a4,80008540 <uartputc_sync+0x40>
    80008518:	00050793          	mv	a5,a0
    8000851c:	100006b7          	lui	a3,0x10000
    80008520:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80008524:	02077713          	andi	a4,a4,32
    80008528:	fe070ce3          	beqz	a4,80008520 <uartputc_sync+0x20>
    8000852c:	0ff7f793          	andi	a5,a5,255
    80008530:	00f68023          	sb	a5,0(a3)
    80008534:	00813403          	ld	s0,8(sp)
    80008538:	01010113          	addi	sp,sp,16
    8000853c:	00008067          	ret
    80008540:	0000006f          	j	80008540 <uartputc_sync+0x40>

0000000080008544 <uartstart>:
    80008544:	ff010113          	addi	sp,sp,-16
    80008548:	00813423          	sd	s0,8(sp)
    8000854c:	01010413          	addi	s0,sp,16
    80008550:	00004617          	auipc	a2,0x4
    80008554:	5b060613          	addi	a2,a2,1456 # 8000cb00 <uart_tx_r>
    80008558:	00004517          	auipc	a0,0x4
    8000855c:	5b050513          	addi	a0,a0,1456 # 8000cb08 <uart_tx_w>
    80008560:	00063783          	ld	a5,0(a2)
    80008564:	00053703          	ld	a4,0(a0)
    80008568:	04f70263          	beq	a4,a5,800085ac <uartstart+0x68>
    8000856c:	100005b7          	lui	a1,0x10000
    80008570:	00006817          	auipc	a6,0x6
    80008574:	94080813          	addi	a6,a6,-1728 # 8000deb0 <uart_tx_buf>
    80008578:	01c0006f          	j	80008594 <uartstart+0x50>
    8000857c:	0006c703          	lbu	a4,0(a3)
    80008580:	00f63023          	sd	a5,0(a2)
    80008584:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80008588:	00063783          	ld	a5,0(a2)
    8000858c:	00053703          	ld	a4,0(a0)
    80008590:	00f70e63          	beq	a4,a5,800085ac <uartstart+0x68>
    80008594:	01f7f713          	andi	a4,a5,31
    80008598:	00e806b3          	add	a3,a6,a4
    8000859c:	0055c703          	lbu	a4,5(a1)
    800085a0:	00178793          	addi	a5,a5,1
    800085a4:	02077713          	andi	a4,a4,32
    800085a8:	fc071ae3          	bnez	a4,8000857c <uartstart+0x38>
    800085ac:	00813403          	ld	s0,8(sp)
    800085b0:	01010113          	addi	sp,sp,16
    800085b4:	00008067          	ret

00000000800085b8 <uartgetc>:
    800085b8:	ff010113          	addi	sp,sp,-16
    800085bc:	00813423          	sd	s0,8(sp)
    800085c0:	01010413          	addi	s0,sp,16
    800085c4:	10000737          	lui	a4,0x10000
    800085c8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800085cc:	0017f793          	andi	a5,a5,1
    800085d0:	00078c63          	beqz	a5,800085e8 <uartgetc+0x30>
    800085d4:	00074503          	lbu	a0,0(a4)
    800085d8:	0ff57513          	andi	a0,a0,255
    800085dc:	00813403          	ld	s0,8(sp)
    800085e0:	01010113          	addi	sp,sp,16
    800085e4:	00008067          	ret
    800085e8:	fff00513          	li	a0,-1
    800085ec:	ff1ff06f          	j	800085dc <uartgetc+0x24>

00000000800085f0 <uartintr>:
    800085f0:	100007b7          	lui	a5,0x10000
    800085f4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800085f8:	0017f793          	andi	a5,a5,1
    800085fc:	0a078463          	beqz	a5,800086a4 <uartintr+0xb4>
    80008600:	fe010113          	addi	sp,sp,-32
    80008604:	00813823          	sd	s0,16(sp)
    80008608:	00913423          	sd	s1,8(sp)
    8000860c:	00113c23          	sd	ra,24(sp)
    80008610:	02010413          	addi	s0,sp,32
    80008614:	100004b7          	lui	s1,0x10000
    80008618:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000861c:	0ff57513          	andi	a0,a0,255
    80008620:	fffff097          	auipc	ra,0xfffff
    80008624:	534080e7          	jalr	1332(ra) # 80007b54 <consoleintr>
    80008628:	0054c783          	lbu	a5,5(s1)
    8000862c:	0017f793          	andi	a5,a5,1
    80008630:	fe0794e3          	bnez	a5,80008618 <uartintr+0x28>
    80008634:	00004617          	auipc	a2,0x4
    80008638:	4cc60613          	addi	a2,a2,1228 # 8000cb00 <uart_tx_r>
    8000863c:	00004517          	auipc	a0,0x4
    80008640:	4cc50513          	addi	a0,a0,1228 # 8000cb08 <uart_tx_w>
    80008644:	00063783          	ld	a5,0(a2)
    80008648:	00053703          	ld	a4,0(a0)
    8000864c:	04f70263          	beq	a4,a5,80008690 <uartintr+0xa0>
    80008650:	100005b7          	lui	a1,0x10000
    80008654:	00006817          	auipc	a6,0x6
    80008658:	85c80813          	addi	a6,a6,-1956 # 8000deb0 <uart_tx_buf>
    8000865c:	01c0006f          	j	80008678 <uartintr+0x88>
    80008660:	0006c703          	lbu	a4,0(a3)
    80008664:	00f63023          	sd	a5,0(a2)
    80008668:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000866c:	00063783          	ld	a5,0(a2)
    80008670:	00053703          	ld	a4,0(a0)
    80008674:	00f70e63          	beq	a4,a5,80008690 <uartintr+0xa0>
    80008678:	01f7f713          	andi	a4,a5,31
    8000867c:	00e806b3          	add	a3,a6,a4
    80008680:	0055c703          	lbu	a4,5(a1)
    80008684:	00178793          	addi	a5,a5,1
    80008688:	02077713          	andi	a4,a4,32
    8000868c:	fc071ae3          	bnez	a4,80008660 <uartintr+0x70>
    80008690:	01813083          	ld	ra,24(sp)
    80008694:	01013403          	ld	s0,16(sp)
    80008698:	00813483          	ld	s1,8(sp)
    8000869c:	02010113          	addi	sp,sp,32
    800086a0:	00008067          	ret
    800086a4:	00004617          	auipc	a2,0x4
    800086a8:	45c60613          	addi	a2,a2,1116 # 8000cb00 <uart_tx_r>
    800086ac:	00004517          	auipc	a0,0x4
    800086b0:	45c50513          	addi	a0,a0,1116 # 8000cb08 <uart_tx_w>
    800086b4:	00063783          	ld	a5,0(a2)
    800086b8:	00053703          	ld	a4,0(a0)
    800086bc:	04f70263          	beq	a4,a5,80008700 <uartintr+0x110>
    800086c0:	100005b7          	lui	a1,0x10000
    800086c4:	00005817          	auipc	a6,0x5
    800086c8:	7ec80813          	addi	a6,a6,2028 # 8000deb0 <uart_tx_buf>
    800086cc:	01c0006f          	j	800086e8 <uartintr+0xf8>
    800086d0:	0006c703          	lbu	a4,0(a3)
    800086d4:	00f63023          	sd	a5,0(a2)
    800086d8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800086dc:	00063783          	ld	a5,0(a2)
    800086e0:	00053703          	ld	a4,0(a0)
    800086e4:	02f70063          	beq	a4,a5,80008704 <uartintr+0x114>
    800086e8:	01f7f713          	andi	a4,a5,31
    800086ec:	00e806b3          	add	a3,a6,a4
    800086f0:	0055c703          	lbu	a4,5(a1)
    800086f4:	00178793          	addi	a5,a5,1
    800086f8:	02077713          	andi	a4,a4,32
    800086fc:	fc071ae3          	bnez	a4,800086d0 <uartintr+0xe0>
    80008700:	00008067          	ret
    80008704:	00008067          	ret

0000000080008708 <kinit>:
    80008708:	fc010113          	addi	sp,sp,-64
    8000870c:	02913423          	sd	s1,40(sp)
    80008710:	fffff7b7          	lui	a5,0xfffff
    80008714:	00006497          	auipc	s1,0x6
    80008718:	7bb48493          	addi	s1,s1,1979 # 8000eecf <end+0xfff>
    8000871c:	02813823          	sd	s0,48(sp)
    80008720:	01313c23          	sd	s3,24(sp)
    80008724:	00f4f4b3          	and	s1,s1,a5
    80008728:	02113c23          	sd	ra,56(sp)
    8000872c:	03213023          	sd	s2,32(sp)
    80008730:	01413823          	sd	s4,16(sp)
    80008734:	01513423          	sd	s5,8(sp)
    80008738:	04010413          	addi	s0,sp,64
    8000873c:	000017b7          	lui	a5,0x1
    80008740:	01100993          	li	s3,17
    80008744:	00f487b3          	add	a5,s1,a5
    80008748:	01b99993          	slli	s3,s3,0x1b
    8000874c:	06f9e063          	bltu	s3,a5,800087ac <kinit+0xa4>
    80008750:	00005a97          	auipc	s5,0x5
    80008754:	780a8a93          	addi	s5,s5,1920 # 8000ded0 <end>
    80008758:	0754ec63          	bltu	s1,s5,800087d0 <kinit+0xc8>
    8000875c:	0734fa63          	bgeu	s1,s3,800087d0 <kinit+0xc8>
    80008760:	00088a37          	lui	s4,0x88
    80008764:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80008768:	00004917          	auipc	s2,0x4
    8000876c:	3a890913          	addi	s2,s2,936 # 8000cb10 <kmem>
    80008770:	00ca1a13          	slli	s4,s4,0xc
    80008774:	0140006f          	j	80008788 <kinit+0x80>
    80008778:	000017b7          	lui	a5,0x1
    8000877c:	00f484b3          	add	s1,s1,a5
    80008780:	0554e863          	bltu	s1,s5,800087d0 <kinit+0xc8>
    80008784:	0534f663          	bgeu	s1,s3,800087d0 <kinit+0xc8>
    80008788:	00001637          	lui	a2,0x1
    8000878c:	00100593          	li	a1,1
    80008790:	00048513          	mv	a0,s1
    80008794:	00000097          	auipc	ra,0x0
    80008798:	5e4080e7          	jalr	1508(ra) # 80008d78 <__memset>
    8000879c:	00093783          	ld	a5,0(s2)
    800087a0:	00f4b023          	sd	a5,0(s1)
    800087a4:	00993023          	sd	s1,0(s2)
    800087a8:	fd4498e3          	bne	s1,s4,80008778 <kinit+0x70>
    800087ac:	03813083          	ld	ra,56(sp)
    800087b0:	03013403          	ld	s0,48(sp)
    800087b4:	02813483          	ld	s1,40(sp)
    800087b8:	02013903          	ld	s2,32(sp)
    800087bc:	01813983          	ld	s3,24(sp)
    800087c0:	01013a03          	ld	s4,16(sp)
    800087c4:	00813a83          	ld	s5,8(sp)
    800087c8:	04010113          	addi	sp,sp,64
    800087cc:	00008067          	ret
    800087d0:	00002517          	auipc	a0,0x2
    800087d4:	05850513          	addi	a0,a0,88 # 8000a828 <digits+0x18>
    800087d8:	fffff097          	auipc	ra,0xfffff
    800087dc:	4b4080e7          	jalr	1204(ra) # 80007c8c <panic>

00000000800087e0 <freerange>:
    800087e0:	fc010113          	addi	sp,sp,-64
    800087e4:	000017b7          	lui	a5,0x1
    800087e8:	02913423          	sd	s1,40(sp)
    800087ec:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800087f0:	009504b3          	add	s1,a0,s1
    800087f4:	fffff537          	lui	a0,0xfffff
    800087f8:	02813823          	sd	s0,48(sp)
    800087fc:	02113c23          	sd	ra,56(sp)
    80008800:	03213023          	sd	s2,32(sp)
    80008804:	01313c23          	sd	s3,24(sp)
    80008808:	01413823          	sd	s4,16(sp)
    8000880c:	01513423          	sd	s5,8(sp)
    80008810:	01613023          	sd	s6,0(sp)
    80008814:	04010413          	addi	s0,sp,64
    80008818:	00a4f4b3          	and	s1,s1,a0
    8000881c:	00f487b3          	add	a5,s1,a5
    80008820:	06f5e463          	bltu	a1,a5,80008888 <freerange+0xa8>
    80008824:	00005a97          	auipc	s5,0x5
    80008828:	6aca8a93          	addi	s5,s5,1708 # 8000ded0 <end>
    8000882c:	0954e263          	bltu	s1,s5,800088b0 <freerange+0xd0>
    80008830:	01100993          	li	s3,17
    80008834:	01b99993          	slli	s3,s3,0x1b
    80008838:	0734fc63          	bgeu	s1,s3,800088b0 <freerange+0xd0>
    8000883c:	00058a13          	mv	s4,a1
    80008840:	00004917          	auipc	s2,0x4
    80008844:	2d090913          	addi	s2,s2,720 # 8000cb10 <kmem>
    80008848:	00002b37          	lui	s6,0x2
    8000884c:	0140006f          	j	80008860 <freerange+0x80>
    80008850:	000017b7          	lui	a5,0x1
    80008854:	00f484b3          	add	s1,s1,a5
    80008858:	0554ec63          	bltu	s1,s5,800088b0 <freerange+0xd0>
    8000885c:	0534fa63          	bgeu	s1,s3,800088b0 <freerange+0xd0>
    80008860:	00001637          	lui	a2,0x1
    80008864:	00100593          	li	a1,1
    80008868:	00048513          	mv	a0,s1
    8000886c:	00000097          	auipc	ra,0x0
    80008870:	50c080e7          	jalr	1292(ra) # 80008d78 <__memset>
    80008874:	00093703          	ld	a4,0(s2)
    80008878:	016487b3          	add	a5,s1,s6
    8000887c:	00e4b023          	sd	a4,0(s1)
    80008880:	00993023          	sd	s1,0(s2)
    80008884:	fcfa76e3          	bgeu	s4,a5,80008850 <freerange+0x70>
    80008888:	03813083          	ld	ra,56(sp)
    8000888c:	03013403          	ld	s0,48(sp)
    80008890:	02813483          	ld	s1,40(sp)
    80008894:	02013903          	ld	s2,32(sp)
    80008898:	01813983          	ld	s3,24(sp)
    8000889c:	01013a03          	ld	s4,16(sp)
    800088a0:	00813a83          	ld	s5,8(sp)
    800088a4:	00013b03          	ld	s6,0(sp)
    800088a8:	04010113          	addi	sp,sp,64
    800088ac:	00008067          	ret
    800088b0:	00002517          	auipc	a0,0x2
    800088b4:	f7850513          	addi	a0,a0,-136 # 8000a828 <digits+0x18>
    800088b8:	fffff097          	auipc	ra,0xfffff
    800088bc:	3d4080e7          	jalr	980(ra) # 80007c8c <panic>

00000000800088c0 <kfree>:
    800088c0:	fe010113          	addi	sp,sp,-32
    800088c4:	00813823          	sd	s0,16(sp)
    800088c8:	00113c23          	sd	ra,24(sp)
    800088cc:	00913423          	sd	s1,8(sp)
    800088d0:	02010413          	addi	s0,sp,32
    800088d4:	03451793          	slli	a5,a0,0x34
    800088d8:	04079c63          	bnez	a5,80008930 <kfree+0x70>
    800088dc:	00005797          	auipc	a5,0x5
    800088e0:	5f478793          	addi	a5,a5,1524 # 8000ded0 <end>
    800088e4:	00050493          	mv	s1,a0
    800088e8:	04f56463          	bltu	a0,a5,80008930 <kfree+0x70>
    800088ec:	01100793          	li	a5,17
    800088f0:	01b79793          	slli	a5,a5,0x1b
    800088f4:	02f57e63          	bgeu	a0,a5,80008930 <kfree+0x70>
    800088f8:	00001637          	lui	a2,0x1
    800088fc:	00100593          	li	a1,1
    80008900:	00000097          	auipc	ra,0x0
    80008904:	478080e7          	jalr	1144(ra) # 80008d78 <__memset>
    80008908:	00004797          	auipc	a5,0x4
    8000890c:	20878793          	addi	a5,a5,520 # 8000cb10 <kmem>
    80008910:	0007b703          	ld	a4,0(a5)
    80008914:	01813083          	ld	ra,24(sp)
    80008918:	01013403          	ld	s0,16(sp)
    8000891c:	00e4b023          	sd	a4,0(s1)
    80008920:	0097b023          	sd	s1,0(a5)
    80008924:	00813483          	ld	s1,8(sp)
    80008928:	02010113          	addi	sp,sp,32
    8000892c:	00008067          	ret
    80008930:	00002517          	auipc	a0,0x2
    80008934:	ef850513          	addi	a0,a0,-264 # 8000a828 <digits+0x18>
    80008938:	fffff097          	auipc	ra,0xfffff
    8000893c:	354080e7          	jalr	852(ra) # 80007c8c <panic>

0000000080008940 <kalloc>:
    80008940:	fe010113          	addi	sp,sp,-32
    80008944:	00813823          	sd	s0,16(sp)
    80008948:	00913423          	sd	s1,8(sp)
    8000894c:	00113c23          	sd	ra,24(sp)
    80008950:	02010413          	addi	s0,sp,32
    80008954:	00004797          	auipc	a5,0x4
    80008958:	1bc78793          	addi	a5,a5,444 # 8000cb10 <kmem>
    8000895c:	0007b483          	ld	s1,0(a5)
    80008960:	02048063          	beqz	s1,80008980 <kalloc+0x40>
    80008964:	0004b703          	ld	a4,0(s1)
    80008968:	00001637          	lui	a2,0x1
    8000896c:	00500593          	li	a1,5
    80008970:	00048513          	mv	a0,s1
    80008974:	00e7b023          	sd	a4,0(a5)
    80008978:	00000097          	auipc	ra,0x0
    8000897c:	400080e7          	jalr	1024(ra) # 80008d78 <__memset>
    80008980:	01813083          	ld	ra,24(sp)
    80008984:	01013403          	ld	s0,16(sp)
    80008988:	00048513          	mv	a0,s1
    8000898c:	00813483          	ld	s1,8(sp)
    80008990:	02010113          	addi	sp,sp,32
    80008994:	00008067          	ret

0000000080008998 <initlock>:
    80008998:	ff010113          	addi	sp,sp,-16
    8000899c:	00813423          	sd	s0,8(sp)
    800089a0:	01010413          	addi	s0,sp,16
    800089a4:	00813403          	ld	s0,8(sp)
    800089a8:	00b53423          	sd	a1,8(a0)
    800089ac:	00052023          	sw	zero,0(a0)
    800089b0:	00053823          	sd	zero,16(a0)
    800089b4:	01010113          	addi	sp,sp,16
    800089b8:	00008067          	ret

00000000800089bc <acquire>:
    800089bc:	fe010113          	addi	sp,sp,-32
    800089c0:	00813823          	sd	s0,16(sp)
    800089c4:	00913423          	sd	s1,8(sp)
    800089c8:	00113c23          	sd	ra,24(sp)
    800089cc:	01213023          	sd	s2,0(sp)
    800089d0:	02010413          	addi	s0,sp,32
    800089d4:	00050493          	mv	s1,a0
    800089d8:	10002973          	csrr	s2,sstatus
    800089dc:	100027f3          	csrr	a5,sstatus
    800089e0:	ffd7f793          	andi	a5,a5,-3
    800089e4:	10079073          	csrw	sstatus,a5
    800089e8:	fffff097          	auipc	ra,0xfffff
    800089ec:	8e4080e7          	jalr	-1820(ra) # 800072cc <mycpu>
    800089f0:	07852783          	lw	a5,120(a0)
    800089f4:	06078e63          	beqz	a5,80008a70 <acquire+0xb4>
    800089f8:	fffff097          	auipc	ra,0xfffff
    800089fc:	8d4080e7          	jalr	-1836(ra) # 800072cc <mycpu>
    80008a00:	07852783          	lw	a5,120(a0)
    80008a04:	0004a703          	lw	a4,0(s1)
    80008a08:	0017879b          	addiw	a5,a5,1
    80008a0c:	06f52c23          	sw	a5,120(a0)
    80008a10:	04071063          	bnez	a4,80008a50 <acquire+0x94>
    80008a14:	00100713          	li	a4,1
    80008a18:	00070793          	mv	a5,a4
    80008a1c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80008a20:	0007879b          	sext.w	a5,a5
    80008a24:	fe079ae3          	bnez	a5,80008a18 <acquire+0x5c>
    80008a28:	0ff0000f          	fence
    80008a2c:	fffff097          	auipc	ra,0xfffff
    80008a30:	8a0080e7          	jalr	-1888(ra) # 800072cc <mycpu>
    80008a34:	01813083          	ld	ra,24(sp)
    80008a38:	01013403          	ld	s0,16(sp)
    80008a3c:	00a4b823          	sd	a0,16(s1)
    80008a40:	00013903          	ld	s2,0(sp)
    80008a44:	00813483          	ld	s1,8(sp)
    80008a48:	02010113          	addi	sp,sp,32
    80008a4c:	00008067          	ret
    80008a50:	0104b903          	ld	s2,16(s1)
    80008a54:	fffff097          	auipc	ra,0xfffff
    80008a58:	878080e7          	jalr	-1928(ra) # 800072cc <mycpu>
    80008a5c:	faa91ce3          	bne	s2,a0,80008a14 <acquire+0x58>
    80008a60:	00002517          	auipc	a0,0x2
    80008a64:	dd050513          	addi	a0,a0,-560 # 8000a830 <digits+0x20>
    80008a68:	fffff097          	auipc	ra,0xfffff
    80008a6c:	224080e7          	jalr	548(ra) # 80007c8c <panic>
    80008a70:	00195913          	srli	s2,s2,0x1
    80008a74:	fffff097          	auipc	ra,0xfffff
    80008a78:	858080e7          	jalr	-1960(ra) # 800072cc <mycpu>
    80008a7c:	00197913          	andi	s2,s2,1
    80008a80:	07252e23          	sw	s2,124(a0)
    80008a84:	f75ff06f          	j	800089f8 <acquire+0x3c>

0000000080008a88 <release>:
    80008a88:	fe010113          	addi	sp,sp,-32
    80008a8c:	00813823          	sd	s0,16(sp)
    80008a90:	00113c23          	sd	ra,24(sp)
    80008a94:	00913423          	sd	s1,8(sp)
    80008a98:	01213023          	sd	s2,0(sp)
    80008a9c:	02010413          	addi	s0,sp,32
    80008aa0:	00052783          	lw	a5,0(a0)
    80008aa4:	00079a63          	bnez	a5,80008ab8 <release+0x30>
    80008aa8:	00002517          	auipc	a0,0x2
    80008aac:	d9050513          	addi	a0,a0,-624 # 8000a838 <digits+0x28>
    80008ab0:	fffff097          	auipc	ra,0xfffff
    80008ab4:	1dc080e7          	jalr	476(ra) # 80007c8c <panic>
    80008ab8:	01053903          	ld	s2,16(a0)
    80008abc:	00050493          	mv	s1,a0
    80008ac0:	fffff097          	auipc	ra,0xfffff
    80008ac4:	80c080e7          	jalr	-2036(ra) # 800072cc <mycpu>
    80008ac8:	fea910e3          	bne	s2,a0,80008aa8 <release+0x20>
    80008acc:	0004b823          	sd	zero,16(s1)
    80008ad0:	0ff0000f          	fence
    80008ad4:	0f50000f          	fence	iorw,ow
    80008ad8:	0804a02f          	amoswap.w	zero,zero,(s1)
    80008adc:	ffffe097          	auipc	ra,0xffffe
    80008ae0:	7f0080e7          	jalr	2032(ra) # 800072cc <mycpu>
    80008ae4:	100027f3          	csrr	a5,sstatus
    80008ae8:	0027f793          	andi	a5,a5,2
    80008aec:	04079a63          	bnez	a5,80008b40 <release+0xb8>
    80008af0:	07852783          	lw	a5,120(a0)
    80008af4:	02f05e63          	blez	a5,80008b30 <release+0xa8>
    80008af8:	fff7871b          	addiw	a4,a5,-1
    80008afc:	06e52c23          	sw	a4,120(a0)
    80008b00:	00071c63          	bnez	a4,80008b18 <release+0x90>
    80008b04:	07c52783          	lw	a5,124(a0)
    80008b08:	00078863          	beqz	a5,80008b18 <release+0x90>
    80008b0c:	100027f3          	csrr	a5,sstatus
    80008b10:	0027e793          	ori	a5,a5,2
    80008b14:	10079073          	csrw	sstatus,a5
    80008b18:	01813083          	ld	ra,24(sp)
    80008b1c:	01013403          	ld	s0,16(sp)
    80008b20:	00813483          	ld	s1,8(sp)
    80008b24:	00013903          	ld	s2,0(sp)
    80008b28:	02010113          	addi	sp,sp,32
    80008b2c:	00008067          	ret
    80008b30:	00002517          	auipc	a0,0x2
    80008b34:	d2850513          	addi	a0,a0,-728 # 8000a858 <digits+0x48>
    80008b38:	fffff097          	auipc	ra,0xfffff
    80008b3c:	154080e7          	jalr	340(ra) # 80007c8c <panic>
    80008b40:	00002517          	auipc	a0,0x2
    80008b44:	d0050513          	addi	a0,a0,-768 # 8000a840 <digits+0x30>
    80008b48:	fffff097          	auipc	ra,0xfffff
    80008b4c:	144080e7          	jalr	324(ra) # 80007c8c <panic>

0000000080008b50 <holding>:
    80008b50:	00052783          	lw	a5,0(a0)
    80008b54:	00079663          	bnez	a5,80008b60 <holding+0x10>
    80008b58:	00000513          	li	a0,0
    80008b5c:	00008067          	ret
    80008b60:	fe010113          	addi	sp,sp,-32
    80008b64:	00813823          	sd	s0,16(sp)
    80008b68:	00913423          	sd	s1,8(sp)
    80008b6c:	00113c23          	sd	ra,24(sp)
    80008b70:	02010413          	addi	s0,sp,32
    80008b74:	01053483          	ld	s1,16(a0)
    80008b78:	ffffe097          	auipc	ra,0xffffe
    80008b7c:	754080e7          	jalr	1876(ra) # 800072cc <mycpu>
    80008b80:	01813083          	ld	ra,24(sp)
    80008b84:	01013403          	ld	s0,16(sp)
    80008b88:	40a48533          	sub	a0,s1,a0
    80008b8c:	00153513          	seqz	a0,a0
    80008b90:	00813483          	ld	s1,8(sp)
    80008b94:	02010113          	addi	sp,sp,32
    80008b98:	00008067          	ret

0000000080008b9c <push_off>:
    80008b9c:	fe010113          	addi	sp,sp,-32
    80008ba0:	00813823          	sd	s0,16(sp)
    80008ba4:	00113c23          	sd	ra,24(sp)
    80008ba8:	00913423          	sd	s1,8(sp)
    80008bac:	02010413          	addi	s0,sp,32
    80008bb0:	100024f3          	csrr	s1,sstatus
    80008bb4:	100027f3          	csrr	a5,sstatus
    80008bb8:	ffd7f793          	andi	a5,a5,-3
    80008bbc:	10079073          	csrw	sstatus,a5
    80008bc0:	ffffe097          	auipc	ra,0xffffe
    80008bc4:	70c080e7          	jalr	1804(ra) # 800072cc <mycpu>
    80008bc8:	07852783          	lw	a5,120(a0)
    80008bcc:	02078663          	beqz	a5,80008bf8 <push_off+0x5c>
    80008bd0:	ffffe097          	auipc	ra,0xffffe
    80008bd4:	6fc080e7          	jalr	1788(ra) # 800072cc <mycpu>
    80008bd8:	07852783          	lw	a5,120(a0)
    80008bdc:	01813083          	ld	ra,24(sp)
    80008be0:	01013403          	ld	s0,16(sp)
    80008be4:	0017879b          	addiw	a5,a5,1
    80008be8:	06f52c23          	sw	a5,120(a0)
    80008bec:	00813483          	ld	s1,8(sp)
    80008bf0:	02010113          	addi	sp,sp,32
    80008bf4:	00008067          	ret
    80008bf8:	0014d493          	srli	s1,s1,0x1
    80008bfc:	ffffe097          	auipc	ra,0xffffe
    80008c00:	6d0080e7          	jalr	1744(ra) # 800072cc <mycpu>
    80008c04:	0014f493          	andi	s1,s1,1
    80008c08:	06952e23          	sw	s1,124(a0)
    80008c0c:	fc5ff06f          	j	80008bd0 <push_off+0x34>

0000000080008c10 <pop_off>:
    80008c10:	ff010113          	addi	sp,sp,-16
    80008c14:	00813023          	sd	s0,0(sp)
    80008c18:	00113423          	sd	ra,8(sp)
    80008c1c:	01010413          	addi	s0,sp,16
    80008c20:	ffffe097          	auipc	ra,0xffffe
    80008c24:	6ac080e7          	jalr	1708(ra) # 800072cc <mycpu>
    80008c28:	100027f3          	csrr	a5,sstatus
    80008c2c:	0027f793          	andi	a5,a5,2
    80008c30:	04079663          	bnez	a5,80008c7c <pop_off+0x6c>
    80008c34:	07852783          	lw	a5,120(a0)
    80008c38:	02f05a63          	blez	a5,80008c6c <pop_off+0x5c>
    80008c3c:	fff7871b          	addiw	a4,a5,-1
    80008c40:	06e52c23          	sw	a4,120(a0)
    80008c44:	00071c63          	bnez	a4,80008c5c <pop_off+0x4c>
    80008c48:	07c52783          	lw	a5,124(a0)
    80008c4c:	00078863          	beqz	a5,80008c5c <pop_off+0x4c>
    80008c50:	100027f3          	csrr	a5,sstatus
    80008c54:	0027e793          	ori	a5,a5,2
    80008c58:	10079073          	csrw	sstatus,a5
    80008c5c:	00813083          	ld	ra,8(sp)
    80008c60:	00013403          	ld	s0,0(sp)
    80008c64:	01010113          	addi	sp,sp,16
    80008c68:	00008067          	ret
    80008c6c:	00002517          	auipc	a0,0x2
    80008c70:	bec50513          	addi	a0,a0,-1044 # 8000a858 <digits+0x48>
    80008c74:	fffff097          	auipc	ra,0xfffff
    80008c78:	018080e7          	jalr	24(ra) # 80007c8c <panic>
    80008c7c:	00002517          	auipc	a0,0x2
    80008c80:	bc450513          	addi	a0,a0,-1084 # 8000a840 <digits+0x30>
    80008c84:	fffff097          	auipc	ra,0xfffff
    80008c88:	008080e7          	jalr	8(ra) # 80007c8c <panic>

0000000080008c8c <push_on>:
    80008c8c:	fe010113          	addi	sp,sp,-32
    80008c90:	00813823          	sd	s0,16(sp)
    80008c94:	00113c23          	sd	ra,24(sp)
    80008c98:	00913423          	sd	s1,8(sp)
    80008c9c:	02010413          	addi	s0,sp,32
    80008ca0:	100024f3          	csrr	s1,sstatus
    80008ca4:	100027f3          	csrr	a5,sstatus
    80008ca8:	0027e793          	ori	a5,a5,2
    80008cac:	10079073          	csrw	sstatus,a5
    80008cb0:	ffffe097          	auipc	ra,0xffffe
    80008cb4:	61c080e7          	jalr	1564(ra) # 800072cc <mycpu>
    80008cb8:	07852783          	lw	a5,120(a0)
    80008cbc:	02078663          	beqz	a5,80008ce8 <push_on+0x5c>
    80008cc0:	ffffe097          	auipc	ra,0xffffe
    80008cc4:	60c080e7          	jalr	1548(ra) # 800072cc <mycpu>
    80008cc8:	07852783          	lw	a5,120(a0)
    80008ccc:	01813083          	ld	ra,24(sp)
    80008cd0:	01013403          	ld	s0,16(sp)
    80008cd4:	0017879b          	addiw	a5,a5,1
    80008cd8:	06f52c23          	sw	a5,120(a0)
    80008cdc:	00813483          	ld	s1,8(sp)
    80008ce0:	02010113          	addi	sp,sp,32
    80008ce4:	00008067          	ret
    80008ce8:	0014d493          	srli	s1,s1,0x1
    80008cec:	ffffe097          	auipc	ra,0xffffe
    80008cf0:	5e0080e7          	jalr	1504(ra) # 800072cc <mycpu>
    80008cf4:	0014f493          	andi	s1,s1,1
    80008cf8:	06952e23          	sw	s1,124(a0)
    80008cfc:	fc5ff06f          	j	80008cc0 <push_on+0x34>

0000000080008d00 <pop_on>:
    80008d00:	ff010113          	addi	sp,sp,-16
    80008d04:	00813023          	sd	s0,0(sp)
    80008d08:	00113423          	sd	ra,8(sp)
    80008d0c:	01010413          	addi	s0,sp,16
    80008d10:	ffffe097          	auipc	ra,0xffffe
    80008d14:	5bc080e7          	jalr	1468(ra) # 800072cc <mycpu>
    80008d18:	100027f3          	csrr	a5,sstatus
    80008d1c:	0027f793          	andi	a5,a5,2
    80008d20:	04078463          	beqz	a5,80008d68 <pop_on+0x68>
    80008d24:	07852783          	lw	a5,120(a0)
    80008d28:	02f05863          	blez	a5,80008d58 <pop_on+0x58>
    80008d2c:	fff7879b          	addiw	a5,a5,-1
    80008d30:	06f52c23          	sw	a5,120(a0)
    80008d34:	07853783          	ld	a5,120(a0)
    80008d38:	00079863          	bnez	a5,80008d48 <pop_on+0x48>
    80008d3c:	100027f3          	csrr	a5,sstatus
    80008d40:	ffd7f793          	andi	a5,a5,-3
    80008d44:	10079073          	csrw	sstatus,a5
    80008d48:	00813083          	ld	ra,8(sp)
    80008d4c:	00013403          	ld	s0,0(sp)
    80008d50:	01010113          	addi	sp,sp,16
    80008d54:	00008067          	ret
    80008d58:	00002517          	auipc	a0,0x2
    80008d5c:	b2850513          	addi	a0,a0,-1240 # 8000a880 <digits+0x70>
    80008d60:	fffff097          	auipc	ra,0xfffff
    80008d64:	f2c080e7          	jalr	-212(ra) # 80007c8c <panic>
    80008d68:	00002517          	auipc	a0,0x2
    80008d6c:	af850513          	addi	a0,a0,-1288 # 8000a860 <digits+0x50>
    80008d70:	fffff097          	auipc	ra,0xfffff
    80008d74:	f1c080e7          	jalr	-228(ra) # 80007c8c <panic>

0000000080008d78 <__memset>:
    80008d78:	ff010113          	addi	sp,sp,-16
    80008d7c:	00813423          	sd	s0,8(sp)
    80008d80:	01010413          	addi	s0,sp,16
    80008d84:	1a060e63          	beqz	a2,80008f40 <__memset+0x1c8>
    80008d88:	40a007b3          	neg	a5,a0
    80008d8c:	0077f793          	andi	a5,a5,7
    80008d90:	00778693          	addi	a3,a5,7
    80008d94:	00b00813          	li	a6,11
    80008d98:	0ff5f593          	andi	a1,a1,255
    80008d9c:	fff6071b          	addiw	a4,a2,-1
    80008da0:	1b06e663          	bltu	a3,a6,80008f4c <__memset+0x1d4>
    80008da4:	1cd76463          	bltu	a4,a3,80008f6c <__memset+0x1f4>
    80008da8:	1a078e63          	beqz	a5,80008f64 <__memset+0x1ec>
    80008dac:	00b50023          	sb	a1,0(a0)
    80008db0:	00100713          	li	a4,1
    80008db4:	1ae78463          	beq	a5,a4,80008f5c <__memset+0x1e4>
    80008db8:	00b500a3          	sb	a1,1(a0)
    80008dbc:	00200713          	li	a4,2
    80008dc0:	1ae78a63          	beq	a5,a4,80008f74 <__memset+0x1fc>
    80008dc4:	00b50123          	sb	a1,2(a0)
    80008dc8:	00300713          	li	a4,3
    80008dcc:	18e78463          	beq	a5,a4,80008f54 <__memset+0x1dc>
    80008dd0:	00b501a3          	sb	a1,3(a0)
    80008dd4:	00400713          	li	a4,4
    80008dd8:	1ae78263          	beq	a5,a4,80008f7c <__memset+0x204>
    80008ddc:	00b50223          	sb	a1,4(a0)
    80008de0:	00500713          	li	a4,5
    80008de4:	1ae78063          	beq	a5,a4,80008f84 <__memset+0x20c>
    80008de8:	00b502a3          	sb	a1,5(a0)
    80008dec:	00700713          	li	a4,7
    80008df0:	18e79e63          	bne	a5,a4,80008f8c <__memset+0x214>
    80008df4:	00b50323          	sb	a1,6(a0)
    80008df8:	00700e93          	li	t4,7
    80008dfc:	00859713          	slli	a4,a1,0x8
    80008e00:	00e5e733          	or	a4,a1,a4
    80008e04:	01059e13          	slli	t3,a1,0x10
    80008e08:	01c76e33          	or	t3,a4,t3
    80008e0c:	01859313          	slli	t1,a1,0x18
    80008e10:	006e6333          	or	t1,t3,t1
    80008e14:	02059893          	slli	a7,a1,0x20
    80008e18:	40f60e3b          	subw	t3,a2,a5
    80008e1c:	011368b3          	or	a7,t1,a7
    80008e20:	02859813          	slli	a6,a1,0x28
    80008e24:	0108e833          	or	a6,a7,a6
    80008e28:	03059693          	slli	a3,a1,0x30
    80008e2c:	003e589b          	srliw	a7,t3,0x3
    80008e30:	00d866b3          	or	a3,a6,a3
    80008e34:	03859713          	slli	a4,a1,0x38
    80008e38:	00389813          	slli	a6,a7,0x3
    80008e3c:	00f507b3          	add	a5,a0,a5
    80008e40:	00e6e733          	or	a4,a3,a4
    80008e44:	000e089b          	sext.w	a7,t3
    80008e48:	00f806b3          	add	a3,a6,a5
    80008e4c:	00e7b023          	sd	a4,0(a5)
    80008e50:	00878793          	addi	a5,a5,8
    80008e54:	fed79ce3          	bne	a5,a3,80008e4c <__memset+0xd4>
    80008e58:	ff8e7793          	andi	a5,t3,-8
    80008e5c:	0007871b          	sext.w	a4,a5
    80008e60:	01d787bb          	addw	a5,a5,t4
    80008e64:	0ce88e63          	beq	a7,a4,80008f40 <__memset+0x1c8>
    80008e68:	00f50733          	add	a4,a0,a5
    80008e6c:	00b70023          	sb	a1,0(a4)
    80008e70:	0017871b          	addiw	a4,a5,1
    80008e74:	0cc77663          	bgeu	a4,a2,80008f40 <__memset+0x1c8>
    80008e78:	00e50733          	add	a4,a0,a4
    80008e7c:	00b70023          	sb	a1,0(a4)
    80008e80:	0027871b          	addiw	a4,a5,2
    80008e84:	0ac77e63          	bgeu	a4,a2,80008f40 <__memset+0x1c8>
    80008e88:	00e50733          	add	a4,a0,a4
    80008e8c:	00b70023          	sb	a1,0(a4)
    80008e90:	0037871b          	addiw	a4,a5,3
    80008e94:	0ac77663          	bgeu	a4,a2,80008f40 <__memset+0x1c8>
    80008e98:	00e50733          	add	a4,a0,a4
    80008e9c:	00b70023          	sb	a1,0(a4)
    80008ea0:	0047871b          	addiw	a4,a5,4
    80008ea4:	08c77e63          	bgeu	a4,a2,80008f40 <__memset+0x1c8>
    80008ea8:	00e50733          	add	a4,a0,a4
    80008eac:	00b70023          	sb	a1,0(a4)
    80008eb0:	0057871b          	addiw	a4,a5,5
    80008eb4:	08c77663          	bgeu	a4,a2,80008f40 <__memset+0x1c8>
    80008eb8:	00e50733          	add	a4,a0,a4
    80008ebc:	00b70023          	sb	a1,0(a4)
    80008ec0:	0067871b          	addiw	a4,a5,6
    80008ec4:	06c77e63          	bgeu	a4,a2,80008f40 <__memset+0x1c8>
    80008ec8:	00e50733          	add	a4,a0,a4
    80008ecc:	00b70023          	sb	a1,0(a4)
    80008ed0:	0077871b          	addiw	a4,a5,7
    80008ed4:	06c77663          	bgeu	a4,a2,80008f40 <__memset+0x1c8>
    80008ed8:	00e50733          	add	a4,a0,a4
    80008edc:	00b70023          	sb	a1,0(a4)
    80008ee0:	0087871b          	addiw	a4,a5,8
    80008ee4:	04c77e63          	bgeu	a4,a2,80008f40 <__memset+0x1c8>
    80008ee8:	00e50733          	add	a4,a0,a4
    80008eec:	00b70023          	sb	a1,0(a4)
    80008ef0:	0097871b          	addiw	a4,a5,9
    80008ef4:	04c77663          	bgeu	a4,a2,80008f40 <__memset+0x1c8>
    80008ef8:	00e50733          	add	a4,a0,a4
    80008efc:	00b70023          	sb	a1,0(a4)
    80008f00:	00a7871b          	addiw	a4,a5,10
    80008f04:	02c77e63          	bgeu	a4,a2,80008f40 <__memset+0x1c8>
    80008f08:	00e50733          	add	a4,a0,a4
    80008f0c:	00b70023          	sb	a1,0(a4)
    80008f10:	00b7871b          	addiw	a4,a5,11
    80008f14:	02c77663          	bgeu	a4,a2,80008f40 <__memset+0x1c8>
    80008f18:	00e50733          	add	a4,a0,a4
    80008f1c:	00b70023          	sb	a1,0(a4)
    80008f20:	00c7871b          	addiw	a4,a5,12
    80008f24:	00c77e63          	bgeu	a4,a2,80008f40 <__memset+0x1c8>
    80008f28:	00e50733          	add	a4,a0,a4
    80008f2c:	00b70023          	sb	a1,0(a4)
    80008f30:	00d7879b          	addiw	a5,a5,13
    80008f34:	00c7f663          	bgeu	a5,a2,80008f40 <__memset+0x1c8>
    80008f38:	00f507b3          	add	a5,a0,a5
    80008f3c:	00b78023          	sb	a1,0(a5)
    80008f40:	00813403          	ld	s0,8(sp)
    80008f44:	01010113          	addi	sp,sp,16
    80008f48:	00008067          	ret
    80008f4c:	00b00693          	li	a3,11
    80008f50:	e55ff06f          	j	80008da4 <__memset+0x2c>
    80008f54:	00300e93          	li	t4,3
    80008f58:	ea5ff06f          	j	80008dfc <__memset+0x84>
    80008f5c:	00100e93          	li	t4,1
    80008f60:	e9dff06f          	j	80008dfc <__memset+0x84>
    80008f64:	00000e93          	li	t4,0
    80008f68:	e95ff06f          	j	80008dfc <__memset+0x84>
    80008f6c:	00000793          	li	a5,0
    80008f70:	ef9ff06f          	j	80008e68 <__memset+0xf0>
    80008f74:	00200e93          	li	t4,2
    80008f78:	e85ff06f          	j	80008dfc <__memset+0x84>
    80008f7c:	00400e93          	li	t4,4
    80008f80:	e7dff06f          	j	80008dfc <__memset+0x84>
    80008f84:	00500e93          	li	t4,5
    80008f88:	e75ff06f          	j	80008dfc <__memset+0x84>
    80008f8c:	00600e93          	li	t4,6
    80008f90:	e6dff06f          	j	80008dfc <__memset+0x84>

0000000080008f94 <__memmove>:
    80008f94:	ff010113          	addi	sp,sp,-16
    80008f98:	00813423          	sd	s0,8(sp)
    80008f9c:	01010413          	addi	s0,sp,16
    80008fa0:	0e060863          	beqz	a2,80009090 <__memmove+0xfc>
    80008fa4:	fff6069b          	addiw	a3,a2,-1
    80008fa8:	0006881b          	sext.w	a6,a3
    80008fac:	0ea5e863          	bltu	a1,a0,8000909c <__memmove+0x108>
    80008fb0:	00758713          	addi	a4,a1,7
    80008fb4:	00a5e7b3          	or	a5,a1,a0
    80008fb8:	40a70733          	sub	a4,a4,a0
    80008fbc:	0077f793          	andi	a5,a5,7
    80008fc0:	00f73713          	sltiu	a4,a4,15
    80008fc4:	00174713          	xori	a4,a4,1
    80008fc8:	0017b793          	seqz	a5,a5
    80008fcc:	00e7f7b3          	and	a5,a5,a4
    80008fd0:	10078863          	beqz	a5,800090e0 <__memmove+0x14c>
    80008fd4:	00900793          	li	a5,9
    80008fd8:	1107f463          	bgeu	a5,a6,800090e0 <__memmove+0x14c>
    80008fdc:	0036581b          	srliw	a6,a2,0x3
    80008fe0:	fff8081b          	addiw	a6,a6,-1
    80008fe4:	02081813          	slli	a6,a6,0x20
    80008fe8:	01d85893          	srli	a7,a6,0x1d
    80008fec:	00858813          	addi	a6,a1,8
    80008ff0:	00058793          	mv	a5,a1
    80008ff4:	00050713          	mv	a4,a0
    80008ff8:	01088833          	add	a6,a7,a6
    80008ffc:	0007b883          	ld	a7,0(a5)
    80009000:	00878793          	addi	a5,a5,8
    80009004:	00870713          	addi	a4,a4,8
    80009008:	ff173c23          	sd	a7,-8(a4)
    8000900c:	ff0798e3          	bne	a5,a6,80008ffc <__memmove+0x68>
    80009010:	ff867713          	andi	a4,a2,-8
    80009014:	02071793          	slli	a5,a4,0x20
    80009018:	0207d793          	srli	a5,a5,0x20
    8000901c:	00f585b3          	add	a1,a1,a5
    80009020:	40e686bb          	subw	a3,a3,a4
    80009024:	00f507b3          	add	a5,a0,a5
    80009028:	06e60463          	beq	a2,a4,80009090 <__memmove+0xfc>
    8000902c:	0005c703          	lbu	a4,0(a1)
    80009030:	00e78023          	sb	a4,0(a5)
    80009034:	04068e63          	beqz	a3,80009090 <__memmove+0xfc>
    80009038:	0015c603          	lbu	a2,1(a1)
    8000903c:	00100713          	li	a4,1
    80009040:	00c780a3          	sb	a2,1(a5)
    80009044:	04e68663          	beq	a3,a4,80009090 <__memmove+0xfc>
    80009048:	0025c603          	lbu	a2,2(a1)
    8000904c:	00200713          	li	a4,2
    80009050:	00c78123          	sb	a2,2(a5)
    80009054:	02e68e63          	beq	a3,a4,80009090 <__memmove+0xfc>
    80009058:	0035c603          	lbu	a2,3(a1)
    8000905c:	00300713          	li	a4,3
    80009060:	00c781a3          	sb	a2,3(a5)
    80009064:	02e68663          	beq	a3,a4,80009090 <__memmove+0xfc>
    80009068:	0045c603          	lbu	a2,4(a1)
    8000906c:	00400713          	li	a4,4
    80009070:	00c78223          	sb	a2,4(a5)
    80009074:	00e68e63          	beq	a3,a4,80009090 <__memmove+0xfc>
    80009078:	0055c603          	lbu	a2,5(a1)
    8000907c:	00500713          	li	a4,5
    80009080:	00c782a3          	sb	a2,5(a5)
    80009084:	00e68663          	beq	a3,a4,80009090 <__memmove+0xfc>
    80009088:	0065c703          	lbu	a4,6(a1)
    8000908c:	00e78323          	sb	a4,6(a5)
    80009090:	00813403          	ld	s0,8(sp)
    80009094:	01010113          	addi	sp,sp,16
    80009098:	00008067          	ret
    8000909c:	02061713          	slli	a4,a2,0x20
    800090a0:	02075713          	srli	a4,a4,0x20
    800090a4:	00e587b3          	add	a5,a1,a4
    800090a8:	f0f574e3          	bgeu	a0,a5,80008fb0 <__memmove+0x1c>
    800090ac:	02069613          	slli	a2,a3,0x20
    800090b0:	02065613          	srli	a2,a2,0x20
    800090b4:	fff64613          	not	a2,a2
    800090b8:	00e50733          	add	a4,a0,a4
    800090bc:	00c78633          	add	a2,a5,a2
    800090c0:	fff7c683          	lbu	a3,-1(a5)
    800090c4:	fff78793          	addi	a5,a5,-1
    800090c8:	fff70713          	addi	a4,a4,-1
    800090cc:	00d70023          	sb	a3,0(a4)
    800090d0:	fec798e3          	bne	a5,a2,800090c0 <__memmove+0x12c>
    800090d4:	00813403          	ld	s0,8(sp)
    800090d8:	01010113          	addi	sp,sp,16
    800090dc:	00008067          	ret
    800090e0:	02069713          	slli	a4,a3,0x20
    800090e4:	02075713          	srli	a4,a4,0x20
    800090e8:	00170713          	addi	a4,a4,1
    800090ec:	00e50733          	add	a4,a0,a4
    800090f0:	00050793          	mv	a5,a0
    800090f4:	0005c683          	lbu	a3,0(a1)
    800090f8:	00178793          	addi	a5,a5,1
    800090fc:	00158593          	addi	a1,a1,1
    80009100:	fed78fa3          	sb	a3,-1(a5)
    80009104:	fee798e3          	bne	a5,a4,800090f4 <__memmove+0x160>
    80009108:	f89ff06f          	j	80009090 <__memmove+0xfc>
	...
