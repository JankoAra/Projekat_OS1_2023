
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000c117          	auipc	sp,0xc
    80000004:	99013103          	ld	sp,-1648(sp) # 8000b990 <_GLOBAL_OFFSET_TABLE_+0x28>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	7f4060ef          	jal	ra,80006810 <start>

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
    80001184:	009000ef          	jal	ra,8000198c <interruptRoutine>

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

void ThreadQueue::putLast(TCB* tcb) {
    80001244:	fe010113          	addi	sp,sp,-32
    80001248:	00113c23          	sd	ra,24(sp)
    8000124c:	00813823          	sd	s0,16(sp)
    80001250:	00913423          	sd	s1,8(sp)
    80001254:	01213023          	sd	s2,0(sp)
    80001258:	02010413          	addi	s0,sp,32
    8000125c:	00050493          	mv	s1,a0
    80001260:	00058913          	mv	s2,a1
		Node* next;

		Node(TCB* d) : data(d), next(nullptr) {}

		static void* operator new(size_t size) {
			return mem_alloc(size);
    80001264:	01000513          	li	a0,16
    80001268:	00000097          	auipc	ra,0x0
    8000126c:	0a8080e7          	jalr	168(ra) # 80001310 <_Z9mem_allocm>
		Node(TCB* d) : data(d), next(nullptr) {}
    80001270:	01253023          	sd	s2,0(a0)
    80001274:	00053423          	sd	zero,8(a0)
			delete node;
		}
	}

	bool isEmpty() const {
		return front == nullptr;
    80001278:	0004b783          	ld	a5,0(s1)
	Node* newNode = new Node(tcb);
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

TCB* ThreadQueue::getFirst() {
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
	Node* node = front;
	TCB* tcb = node->data;
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
    8000131c:	01850513          	addi	a0,a0,24
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

0000000080001660 <_ZN9Scheduler3putEP3TCB>:
//Scheduler* Scheduler::singleton = nullptr;
TCB* Scheduler::head = nullptr;
TCB* Scheduler::tail = nullptr;
TCB* Scheduler::sleepingHead = nullptr;

void Scheduler::put(TCB* tcb) {
    80001660:	ff010113          	addi	sp,sp,-16
    80001664:	00813423          	sd	s0,8(sp)
    80001668:	01010413          	addi	s0,sp,16
	if (tail == nullptr) {
    8000166c:	0000a797          	auipc	a5,0xa
    80001670:	3847b783          	ld	a5,900(a5) # 8000b9f0 <_ZN9Scheduler4tailE>
    80001674:	00078e63          	beqz	a5,80001690 <_ZN9Scheduler3putEP3TCB+0x30>
		head = tail = tcb;
	} else {
		tail->nextInScheduler = tcb;
    80001678:	02a7bc23          	sd	a0,56(a5)
		tail = tcb;
    8000167c:	0000a797          	auipc	a5,0xa
    80001680:	36a7ba23          	sd	a0,884(a5) # 8000b9f0 <_ZN9Scheduler4tailE>
	}
}
    80001684:	00813403          	ld	s0,8(sp)
    80001688:	01010113          	addi	sp,sp,16
    8000168c:	00008067          	ret
		head = tail = tcb;
    80001690:	0000a797          	auipc	a5,0xa
    80001694:	36078793          	addi	a5,a5,864 # 8000b9f0 <_ZN9Scheduler4tailE>
    80001698:	00a7b023          	sd	a0,0(a5)
    8000169c:	00a7b423          	sd	a0,8(a5)
    800016a0:	fe5ff06f          	j	80001684 <_ZN9Scheduler3putEP3TCB+0x24>

00000000800016a4 <_ZN9Scheduler3getEv>:

TCB* Scheduler::get() {
    800016a4:	ff010113          	addi	sp,sp,-16
    800016a8:	00813423          	sd	s0,8(sp)
    800016ac:	01010413          	addi	s0,sp,16
	TCB* firstThread = head;
    800016b0:	0000a717          	auipc	a4,0xa
    800016b4:	34070713          	addi	a4,a4,832 # 8000b9f0 <_ZN9Scheduler4tailE>
    800016b8:	00873503          	ld	a0,8(a4)
	head = head->nextInScheduler;
    800016bc:	03853783          	ld	a5,56(a0) # 1038 <_entry-0x7fffefc8>
    800016c0:	00f73423          	sd	a5,8(a4)
	if (head == nullptr) {
    800016c4:	00078a63          	beqz	a5,800016d8 <_ZN9Scheduler3getEv+0x34>
		tail = head = nullptr;
	}
	firstThread->nextInScheduler = nullptr;
    800016c8:	02053c23          	sd	zero,56(a0)
	return firstThread;
}
    800016cc:	00813403          	ld	s0,8(sp)
    800016d0:	01010113          	addi	sp,sp,16
    800016d4:	00008067          	ret
		tail = head = nullptr;
    800016d8:	00073423          	sd	zero,8(a4)
    800016dc:	00073023          	sd	zero,0(a4)
    800016e0:	fe9ff06f          	j	800016c8 <_ZN9Scheduler3getEv+0x24>

00000000800016e4 <_ZN9Scheduler10putToSleepEP3TCBm>:

void Scheduler::putToSleep(TCB* tcb, time_t sleepTime) {
    800016e4:	ff010113          	addi	sp,sp,-16
    800016e8:	00813423          	sd	s0,8(sp)
    800016ec:	01010413          	addi	s0,sp,16
	if (sleepingHead == nullptr) {
    800016f0:	0000a817          	auipc	a6,0xa
    800016f4:	31083803          	ld	a6,784(a6) # 8000ba00 <_ZN9Scheduler12sleepingHeadE>
    800016f8:	02080863          	beqz	a6,80001728 <_ZN9Scheduler10putToSleepEP3TCBm+0x44>
		tcb->timeToSleep = sleepTime;
		return;
	}
	TCB* prevSleeping = nullptr;
	time_t accumulated = 0;
	TCB* current = sleepingHead;
    800016fc:	00080793          	mv	a5,a6
	time_t accumulated = 0;
    80001700:	00000693          	li	a3,0
	TCB* prevSleeping = nullptr;
    80001704:	00000613          	li	a2,0
	for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
    80001708:	02078863          	beqz	a5,80001738 <_ZN9Scheduler10putToSleepEP3TCBm+0x54>
    8000170c:	0407b703          	ld	a4,64(a5)
    80001710:	00d70733          	add	a4,a4,a3
    80001714:	02b77263          	bgeu	a4,a1,80001738 <_ZN9Scheduler10putToSleepEP3TCBm+0x54>
		accumulated += current->timeToSleep;
    80001718:	00070693          	mv	a3,a4
		prevSleeping = current;
    8000171c:	00078613          	mv	a2,a5
	for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
    80001720:	0487b783          	ld	a5,72(a5)
    80001724:	fe5ff06f          	j	80001708 <_ZN9Scheduler10putToSleepEP3TCBm+0x24>
		sleepingHead = tcb;
    80001728:	0000a797          	auipc	a5,0xa
    8000172c:	2ca7bc23          	sd	a0,728(a5) # 8000ba00 <_ZN9Scheduler12sleepingHeadE>
		tcb->timeToSleep = sleepTime;
    80001730:	04b53023          	sd	a1,64(a0)
		return;
    80001734:	02c0006f          	j	80001760 <_ZN9Scheduler10putToSleepEP3TCBm+0x7c>
	}
	if (!prevSleeping) {
    80001738:	02060a63          	beqz	a2,8000176c <_ZN9Scheduler10putToSleepEP3TCBm+0x88>
		sleepingHead = tcb;
		tcb->timeToSleep = sleepTime;
		tcb->nextSleeping->timeToSleep -= sleepTime;
		return;
	}
	tcb->nextSleeping = current;
    8000173c:	04f53423          	sd	a5,72(a0)
	prevSleeping->nextSleeping = tcb;
    80001740:	04a63423          	sd	a0,72(a2)
	tcb->timeToSleep = sleepTime - accumulated;
    80001744:	40d58733          	sub	a4,a1,a3
    80001748:	04e53023          	sd	a4,64(a0)
	if (current) current->timeToSleep -= sleepTime - accumulated;
    8000174c:	00078a63          	beqz	a5,80001760 <_ZN9Scheduler10putToSleepEP3TCBm+0x7c>
    80001750:	40b686b3          	sub	a3,a3,a1
    80001754:	0407b703          	ld	a4,64(a5)
    80001758:	00d706b3          	add	a3,a4,a3
    8000175c:	04d7b023          	sd	a3,64(a5)
}
    80001760:	00813403          	ld	s0,8(sp)
    80001764:	01010113          	addi	sp,sp,16
    80001768:	00008067          	ret
		tcb->nextSleeping = sleepingHead;
    8000176c:	05053423          	sd	a6,72(a0)
		sleepingHead = tcb;
    80001770:	0000a797          	auipc	a5,0xa
    80001774:	28a7b823          	sd	a0,656(a5) # 8000ba00 <_ZN9Scheduler12sleepingHeadE>
		tcb->timeToSleep = sleepTime;
    80001778:	04b53023          	sd	a1,64(a0)
		tcb->nextSleeping->timeToSleep -= sleepTime;
    8000177c:	04083683          	ld	a3,64(a6)
    80001780:	40b686b3          	sub	a3,a3,a1
    80001784:	04d83023          	sd	a3,64(a6)
		return;
    80001788:	fd9ff06f          	j	80001760 <_ZN9Scheduler10putToSleepEP3TCBm+0x7c>

000000008000178c <_ZN9Scheduler4wakeEv>:

void Scheduler::wake() {
	if (!sleepingHead) return;
    8000178c:	0000a797          	auipc	a5,0xa
    80001790:	2747b783          	ld	a5,628(a5) # 8000ba00 <_ZN9Scheduler12sleepingHeadE>
    80001794:	06078a63          	beqz	a5,80001808 <_ZN9Scheduler4wakeEv+0x7c>
	sleepingHead->timeToSleep--;
    80001798:	0407b703          	ld	a4,64(a5)
    8000179c:	fff70713          	addi	a4,a4,-1
    800017a0:	04e7b023          	sd	a4,64(a5)
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    800017a4:	0000a517          	auipc	a0,0xa
    800017a8:	25c53503          	ld	a0,604(a0) # 8000ba00 <_ZN9Scheduler12sleepingHeadE>
    800017ac:	04050e63          	beqz	a0,80001808 <_ZN9Scheduler4wakeEv+0x7c>
    800017b0:	04053783          	ld	a5,64(a0)
    800017b4:	04079a63          	bnez	a5,80001808 <_ZN9Scheduler4wakeEv+0x7c>
void Scheduler::wake() {
    800017b8:	ff010113          	addi	sp,sp,-16
    800017bc:	00113423          	sd	ra,8(sp)
    800017c0:	00813023          	sd	s0,0(sp)
    800017c4:	01010413          	addi	s0,sp,16
    800017c8:	00c0006f          	j	800017d4 <_ZN9Scheduler4wakeEv+0x48>
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    800017cc:	04053783          	ld	a5,64(a0)
    800017d0:	02079463          	bnez	a5,800017f8 <_ZN9Scheduler4wakeEv+0x6c>
		TCB* thread = sleepingHead;
		sleepingHead = sleepingHead->nextSleeping;
    800017d4:	04853783          	ld	a5,72(a0)
    800017d8:	0000a717          	auipc	a4,0xa
    800017dc:	22f73423          	sd	a5,552(a4) # 8000ba00 <_ZN9Scheduler12sleepingHeadE>
		thread->nextSleeping = nullptr;
    800017e0:	04053423          	sd	zero,72(a0)
		Scheduler::put(thread);
    800017e4:	00000097          	auipc	ra,0x0
    800017e8:	e7c080e7          	jalr	-388(ra) # 80001660 <_ZN9Scheduler3putEP3TCB>
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    800017ec:	0000a517          	auipc	a0,0xa
    800017f0:	21453503          	ld	a0,532(a0) # 8000ba00 <_ZN9Scheduler12sleepingHeadE>
    800017f4:	fc051ce3          	bnez	a0,800017cc <_ZN9Scheduler4wakeEv+0x40>
	}
}
    800017f8:	00813083          	ld	ra,8(sp)
    800017fc:	00013403          	ld	s0,0(sp)
    80001800:	01010113          	addi	sp,sp,16
    80001804:	00008067          	ret
    80001808:	00008067          	ret

000000008000180c <main>:
	while (1) {}
}

#pragma GCC optimize("O0")

int main() {
    8000180c:	fd010113          	addi	sp,sp,-48
    80001810:	02113423          	sd	ra,40(sp)
    80001814:	02813023          	sd	s0,32(sp)
    80001818:	00913c23          	sd	s1,24(sp)
    8000181c:	01213823          	sd	s2,16(sp)
    80001820:	03010413          	addi	s0,sp,48
	//postavi adresu prekidne rutine u stvec
	Riscv::w_stvec((uint64)&interruptHandler);
    80001824:	0000a797          	auipc	a5,0xa
    80001828:	1847b783          	ld	a5,388(a5) # 8000b9a8 <_GLOBAL_OFFSET_TABLE_+0x40>
    8000182c:	00078513          	mv	a0,a5
    80001830:	00000097          	auipc	ra,0x0
    80001834:	108080e7          	jalr	264(ra) # 80001938 <_ZN5Riscv7w_stvecEm>

	//sem_open(&semA, 0);
	semA = new Semaphore(1);
    80001838:	01000513          	li	a0,16
    8000183c:	00001097          	auipc	ra,0x1
    80001840:	93c080e7          	jalr	-1732(ra) # 80002178 <_Znwm>
    80001844:	00050793          	mv	a5,a0
    80001848:	00078493          	mv	s1,a5
    8000184c:	00100593          	li	a1,1
    80001850:	00048513          	mv	a0,s1
    80001854:	00001097          	auipc	ra,0x1
    80001858:	ba8080e7          	jalr	-1112(ra) # 800023fc <_ZN9SemaphoreC1Ej>
    8000185c:	0000a797          	auipc	a5,0xa
    80001860:	1ac78793          	addi	a5,a5,428 # 8000ba08 <semA>
    80001864:	0097b023          	sd	s1,0(a5)
//	printString("\nSad cu da izadjem\n");

//testiranje svega
	thread_t mainHandle;
	thread_t userHandle;
	thread_create(&mainHandle, nullptr, nullptr);
    80001868:	fd840793          	addi	a5,s0,-40
    8000186c:	00000613          	li	a2,0
    80001870:	00000593          	li	a1,0
    80001874:	00078513          	mv	a0,a5
    80001878:	00000097          	auipc	ra,0x0
    8000187c:	b08080e7          	jalr	-1272(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
	TCB::running = mainHandle;
    80001880:	fd843703          	ld	a4,-40(s0)
    80001884:	0000a797          	auipc	a5,0xa
    80001888:	1147b783          	ld	a5,276(a5) # 8000b998 <_GLOBAL_OFFSET_TABLE_+0x30>
    8000188c:	00e7b023          	sd	a4,0(a5)
	thread_create(&userHandle, (TCB::Body)userMain, nullptr);
    80001890:	fd040793          	addi	a5,s0,-48
    80001894:	00000613          	li	a2,0
    80001898:	0000a597          	auipc	a1,0xa
    8000189c:	0d85b583          	ld	a1,216(a1) # 8000b970 <_GLOBAL_OFFSET_TABLE_+0x8>
    800018a0:	00078513          	mv	a0,a5
    800018a4:	00000097          	auipc	ra,0x0
    800018a8:	adc080e7          	jalr	-1316(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
	while (!userHandle->isFinished()) {
    800018ac:	fd043783          	ld	a5,-48(s0)
    800018b0:	00078513          	mv	a0,a5
    800018b4:	00000097          	auipc	ra,0x0
    800018b8:	0bc080e7          	jalr	188(ra) # 80001970 <_ZN3TCB10isFinishedEv>
    800018bc:	00050793          	mv	a5,a0
    800018c0:	0017c793          	xori	a5,a5,1
    800018c4:	0ff7f793          	andi	a5,a5,255
    800018c8:	00078863          	beqz	a5,800018d8 <main+0xcc>
		thread_dispatch();
    800018cc:	00000097          	auipc	ra,0x0
    800018d0:	b5c080e7          	jalr	-1188(ra) # 80001428 <_Z15thread_dispatchv>
	while (!userHandle->isFinished()) {
    800018d4:	fd9ff06f          	j	800018ac <main+0xa0>
	}
	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    800018d8:	00200513          	li	a0,2
    800018dc:	00000097          	auipc	ra,0x0
    800018e0:	078080e7          	jalr	120(ra) # 80001954 <_ZN5Riscv10mc_sstatusEm>
	return 0;
    800018e4:	00000793          	li	a5,0
    800018e8:	0240006f          	j	8000190c <main+0x100>
    800018ec:	00050913          	mv	s2,a0
	semA = new Semaphore(1);
    800018f0:	00048513          	mv	a0,s1
    800018f4:	00001097          	auipc	ra,0x1
    800018f8:	8d4080e7          	jalr	-1836(ra) # 800021c8 <_ZdlPv>
    800018fc:	00090793          	mv	a5,s2
    80001900:	00078513          	mv	a0,a5
    80001904:	0000b097          	auipc	ra,0xb
    80001908:	254080e7          	jalr	596(ra) # 8000cb58 <_Unwind_Resume>
    8000190c:	00078513          	mv	a0,a5
    80001910:	02813083          	ld	ra,40(sp)
    80001914:	02013403          	ld	s0,32(sp)
    80001918:	01813483          	ld	s1,24(sp)
    8000191c:	01013903          	ld	s2,16(sp)
    80001920:	03010113          	addi	sp,sp,48
    80001924:	00008067          	ret

0000000080001928 <_Z4idlePv>:
void idle(void*) {
    80001928:	ff010113          	addi	sp,sp,-16
    8000192c:	00813423          	sd	s0,8(sp)
    80001930:	01010413          	addi	s0,sp,16
	while (1) {}
    80001934:	0000006f          	j	80001934 <_Z4idlePv+0xc>

0000000080001938 <_ZN5Riscv7w_stvecEm>:
	uint64 volatile stvec;
	__asm__ volatile("csrr %[stvec], stvec": [stvec] "=r"(stvec));
	return stvec;
}

inline void Riscv::w_stvec(uint64 stvec) {
    80001938:	ff010113          	addi	sp,sp,-16
    8000193c:	00813423          	sd	s0,8(sp)
    80001940:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw stvec, %[stvec]": :[stvec] "r"(stvec));
    80001944:	10551073          	csrw	stvec,a0
}
    80001948:	00813403          	ld	s0,8(sp)
    8000194c:	01010113          	addi	sp,sp,16
    80001950:	00008067          	ret

0000000080001954 <_ZN5Riscv10mc_sstatusEm>:

inline void Riscv::ms_sstatus(uint64 mask) {
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
}

inline void Riscv::mc_sstatus(uint64 mask) {
    80001954:	ff010113          	addi	sp,sp,-16
    80001958:	00813423          	sd	s0,8(sp)
    8000195c:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80001960:	10053073          	csrc	sstatus,a0
}
    80001964:	00813403          	ld	s0,8(sp)
    80001968:	01010113          	addi	sp,sp,16
    8000196c:	00008067          	ret

0000000080001970 <_ZN3TCB10isFinishedEv>:
	using Body = void (*)(void*);

	static TCB* createThread(Body function, void* args, uint64* stack);
	static void start(TCB* newTcb);

	bool isFinished() { return finished; }
    80001970:	ff010113          	addi	sp,sp,-16
    80001974:	00813423          	sd	s0,8(sp)
    80001978:	01010413          	addi	s0,sp,16
    8000197c:	03054503          	lbu	a0,48(a0)
    80001980:	00813403          	ld	s0,8(sp)
    80001984:	01010113          	addi	sp,sp,16
    80001988:	00008067          	ret

000000008000198c <interruptRoutine>:

#include "../test/printing.hpp"
void printInteger(int i);

#pragma GCC optimize("O0")
extern "C" void interruptRoutine() {
    8000198c:	ec010113          	addi	sp,sp,-320
    80001990:	12113c23          	sd	ra,312(sp)
    80001994:	12813823          	sd	s0,304(sp)
    80001998:	14010413          	addi	s0,sp,320
	uint64 scause, sepc, sstatus;
	__asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000199c:	14202373          	csrr	t1,scause
    800019a0:	fc643c23          	sd	t1,-40(s0)
	__asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800019a4:	14102373          	csrr	t1,sepc
    800019a8:	fc643823          	sd	t1,-48(s0)
	__asm__ volatile("csrr %[status], sstatus":[status] "=r"(
			sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800019ac:	10002373          	csrr	t1,sstatus
    800019b0:	fc643423          	sd	t1,-56(s0)
	uint64 a0, a1, a2, a3, a4, a5, a6, a7;
	__asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800019b4:	00050313          	mv	t1,a0
    800019b8:	fc643023          	sd	t1,-64(s0)
	__asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800019bc:	00058313          	mv	t1,a1
    800019c0:	fa643c23          	sd	t1,-72(s0)
	__asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800019c4:	00060313          	mv	t1,a2
    800019c8:	fa643823          	sd	t1,-80(s0)
	__asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800019cc:	00068313          	mv	t1,a3
    800019d0:	fa643423          	sd	t1,-88(s0)
	__asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800019d4:	00070313          	mv	t1,a4
    800019d8:	fa643023          	sd	t1,-96(s0)
	__asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800019dc:	00078313          	mv	t1,a5
    800019e0:	f8643c23          	sd	t1,-104(s0)
	__asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800019e4:	00080313          	mv	t1,a6
    800019e8:	f8643823          	sd	t1,-112(s0)
	__asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800019ec:	00088313          	mv	t1,a7
    800019f0:	f8643423          	sd	t1,-120(s0)

	if (scause == 0x09 || scause == 0x08) {
    800019f4:	fd843703          	ld	a4,-40(s0)
    800019f8:	00900793          	li	a5,9
    800019fc:	00f70863          	beq	a4,a5,80001a0c <interruptRoutine+0x80>
    80001a00:	fd843703          	ld	a4,-40(s0)
    80001a04:	00800793          	li	a5,8
    80001a08:	50f71e63          	bne	a4,a5,80001f24 <interruptRoutine+0x598>
		//prekid zbog poziva ecall
		uint64 opCode = a0;
    80001a0c:	fc043783          	ld	a5,-64(s0)
    80001a10:	f8f43023          	sd	a5,-128(s0)
		switch (opCode) {
    80001a14:	f8043703          	ld	a4,-128(s0)
    80001a18:	09100793          	li	a5,145
    80001a1c:	38f70063          	beq	a4,a5,80001d9c <interruptRoutine+0x410>
    80001a20:	f8043703          	ld	a4,-128(s0)
    80001a24:	09100793          	li	a5,145
    80001a28:	44e7ee63          	bltu	a5,a4,80001e84 <interruptRoutine+0x4f8>
    80001a2c:	f8043703          	ld	a4,-128(s0)
    80001a30:	09000793          	li	a5,144
    80001a34:	32f70863          	beq	a4,a5,80001d64 <interruptRoutine+0x3d8>
    80001a38:	f8043703          	ld	a4,-128(s0)
    80001a3c:	09000793          	li	a5,144
    80001a40:	44e7e263          	bltu	a5,a4,80001e84 <interruptRoutine+0x4f8>
    80001a44:	f8043703          	ld	a4,-128(s0)
    80001a48:	08100793          	li	a5,129
    80001a4c:	30f70063          	beq	a4,a5,80001d4c <interruptRoutine+0x3c0>
    80001a50:	f8043703          	ld	a4,-128(s0)
    80001a54:	08100793          	li	a5,129
    80001a58:	42e7e663          	bltu	a5,a4,80001e84 <interruptRoutine+0x4f8>
    80001a5c:	f8043703          	ld	a4,-128(s0)
    80001a60:	04200793          	li	a5,66
    80001a64:	04e7e263          	bltu	a5,a4,80001aa8 <interruptRoutine+0x11c>
    80001a68:	f8043783          	ld	a5,-128(s0)
    80001a6c:	40078c63          	beqz	a5,80001e84 <interruptRoutine+0x4f8>
    80001a70:	f8043703          	ld	a4,-128(s0)
    80001a74:	04200793          	li	a5,66
    80001a78:	40e7e663          	bltu	a5,a4,80001e84 <interruptRoutine+0x4f8>
    80001a7c:	f8043783          	ld	a5,-128(s0)
    80001a80:	00279713          	slli	a4,a5,0x2
    80001a84:	00007797          	auipc	a5,0x7
    80001a88:	5f878793          	addi	a5,a5,1528 # 8000907c <CONSOLE_STATUS+0x6c>
    80001a8c:	00f707b3          	add	a5,a4,a5
    80001a90:	0007a783          	lw	a5,0(a5)
    80001a94:	0007871b          	sext.w	a4,a5
    80001a98:	00007797          	auipc	a5,0x7
    80001a9c:	5e478793          	addi	a5,a5,1508 # 8000907c <CONSOLE_STATUS+0x6c>
    80001aa0:	00f707b3          	add	a5,a4,a5
    80001aa4:	00078067          	jr	a5
    80001aa8:	f8043703          	ld	a4,-128(s0)
    80001aac:	08000793          	li	a5,128
    80001ab0:	22f70e63          	beq	a4,a5,80001cec <interruptRoutine+0x360>
    80001ab4:	3d00006f          	j	80001e84 <interruptRoutine+0x4f8>
			case 0x01:
				//mem_alloc
				size_t size;
				size = (size_t)a1;
    80001ab8:	fb843783          	ld	a5,-72(s0)
    80001abc:	ecf43c23          	sd	a5,-296(s0)
				//__asm__ volatile("mv %[size], a1":[size] "=r"(size));
				size = size * MEM_BLOCK_SIZE;
    80001ac0:	ed843783          	ld	a5,-296(s0)
    80001ac4:	00679793          	slli	a5,a5,0x6
    80001ac8:	ecf43c23          	sd	a5,-296(s0)
				MemoryAllocator::kmalloc(size);
    80001acc:	00300593          	li	a1,3
    80001ad0:	ed843503          	ld	a0,-296(s0)
    80001ad4:	00001097          	auipc	ra,0x1
    80001ad8:	e14080e7          	jalr	-492(ra) # 800028e8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
				__asm__ volatile("sd a0, 80(s0)");
    80001adc:	04a43823          	sd	a0,80(s0)
				break;
    80001ae0:	4280006f          	j	80001f08 <interruptRoutine+0x57c>
			case 0x02:
				//mem_free
				void* ptr;
				ptr = (void*)a1;
    80001ae4:	fb843783          	ld	a5,-72(s0)
    80001ae8:	eef43023          	sd	a5,-288(s0)
				//__asm__ volatile("mv %[ptr], a1" :[ptr]"=r"(ptr));
				MemoryAllocator::kfree(ptr);
    80001aec:	ee043503          	ld	a0,-288(s0)
    80001af0:	00001097          	auipc	ra,0x1
    80001af4:	fa4080e7          	jalr	-92(ra) # 80002a94 <_ZN15MemoryAllocator5kfreeEPv>
				__asm__ volatile("sd a0, 80(s0)");
    80001af8:	04a43823          	sd	a0,80(s0)
				break;
    80001afc:	40c0006f          	j	80001f08 <interruptRoutine+0x57c>
			case 0x11:
				//thread_create
				thread_t* handle;
				handle = (thread_t*)a1;
    80001b00:	fb843783          	ld	a5,-72(s0)
    80001b04:	f0f43023          	sd	a5,-256(s0)
				void (* function)(void*);
				function = (void (*)(void*))a2;
    80001b08:	fb043783          	ld	a5,-80(s0)
    80001b0c:	eef43c23          	sd	a5,-264(s0)
				void* args;
				args = (void*)a3;
    80001b10:	fa843783          	ld	a5,-88(s0)
    80001b14:	eef43823          	sd	a5,-272(s0)
				uint64* sp;
				sp = (uint64*)a4;
    80001b18:	fa043783          	ld	a5,-96(s0)
    80001b1c:	eef43423          	sd	a5,-280(s0)

				*handle = TCB::createThread(function, args, sp);
    80001b20:	ee843603          	ld	a2,-280(s0)
    80001b24:	ef043583          	ld	a1,-272(s0)
    80001b28:	ef843503          	ld	a0,-264(s0)
    80001b2c:	00001097          	auipc	ra,0x1
    80001b30:	bc8080e7          	jalr	-1080(ra) # 800026f4 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80001b34:	00050713          	mv	a4,a0
    80001b38:	f0043783          	ld	a5,-256(s0)
    80001b3c:	00e7b023          	sd	a4,0(a5)
				TCB::start(*handle);
    80001b40:	f0043783          	ld	a5,-256(s0)
    80001b44:	0007b783          	ld	a5,0(a5)
    80001b48:	00078513          	mv	a0,a5
    80001b4c:	00001097          	auipc	ra,0x1
    80001b50:	d48080e7          	jalr	-696(ra) # 80002894 <_ZN3TCB5startEPS_>
				if (*handle != nullptr) {
    80001b54:	f0043783          	ld	a5,-256(s0)
    80001b58:	0007b783          	ld	a5,0(a5)
    80001b5c:	00078663          	beqz	a5,80001b68 <interruptRoutine+0x1dc>
					__asm__ volatile("li a0, 0");
    80001b60:	00000513          	li	a0,0
    80001b64:	0080006f          	j	80001b6c <interruptRoutine+0x1e0>
				} else {
					__asm__ volatile("li a0, -1");
    80001b68:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    80001b6c:	04a43823          	sd	a0,80(s0)
				break;
    80001b70:	3980006f          	j	80001f08 <interruptRoutine+0x57c>
			case 0x12:
				//thread_exit
				TCB::running->setFinished(true);
    80001b74:	0000a797          	auipc	a5,0xa
    80001b78:	e247b783          	ld	a5,-476(a5) # 8000b998 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001b7c:	0007b783          	ld	a5,0(a5)
    80001b80:	00100593          	li	a1,1
    80001b84:	00078513          	mv	a0,a5
    80001b88:	00000097          	auipc	ra,0x0
    80001b8c:	528080e7          	jalr	1320(ra) # 800020b0 <_ZN3TCB11setFinishedEb>
				TCB::releaseJoined();
    80001b90:	00001097          	auipc	ra,0x1
    80001b94:	ca8080e7          	jalr	-856(ra) # 80002838 <_ZN3TCB13releaseJoinedEv>
				TCB::yield();
    80001b98:	00001097          	auipc	ra,0x1
    80001b9c:	af4080e7          	jalr	-1292(ra) # 8000268c <_ZN3TCB5yieldEv>
				break;
    80001ba0:	3680006f          	j	80001f08 <interruptRoutine+0x57c>
			case 0x13:
				//thread_dispatch
				TCB::yield();
    80001ba4:	00001097          	auipc	ra,0x1
    80001ba8:	ae8080e7          	jalr	-1304(ra) # 8000268c <_ZN3TCB5yieldEv>
				break;
    80001bac:	35c0006f          	j	80001f08 <interruptRoutine+0x57c>
			case 0x14:
				//thread_join
				thread_t handleToJoin;
				handleToJoin = (thread_t)a1;
    80001bb0:	fb843783          	ld	a5,-72(s0)
    80001bb4:	f0f43423          	sd	a5,-248(s0)
				TCB::threadJoin(handleToJoin);
    80001bb8:	f0843503          	ld	a0,-248(s0)
    80001bbc:	00001097          	auipc	ra,0x1
    80001bc0:	c34080e7          	jalr	-972(ra) # 800027f0 <_ZN3TCB10threadJoinEPS_>
				TCB::yield();
    80001bc4:	00001097          	auipc	ra,0x1
    80001bc8:	ac8080e7          	jalr	-1336(ra) # 8000268c <_ZN3TCB5yieldEv>
				break;
    80001bcc:	33c0006f          	j	80001f08 <interruptRoutine+0x57c>
			case 0x21:
				//sem_open
				sem_t* openHandle;
				openHandle = (sem_t*)a1;
    80001bd0:	fb843783          	ld	a5,-72(s0)
    80001bd4:	f0f43c23          	sd	a5,-232(s0)
				uint initVal;
				initVal = (uint)a2;
    80001bd8:	fb043783          	ld	a5,-80(s0)
    80001bdc:	f0f42a23          	sw	a5,-236(s0)
				*openHandle = KSem::initSem(initVal);
    80001be0:	f1442783          	lw	a5,-236(s0)
    80001be4:	00078513          	mv	a0,a5
    80001be8:	00001097          	auipc	ra,0x1
    80001bec:	048080e7          	jalr	72(ra) # 80002c30 <_ZN4KSem7initSemEj>
    80001bf0:	00050713          	mv	a4,a0
    80001bf4:	f1843783          	ld	a5,-232(s0)
    80001bf8:	00e7b023          	sd	a4,0(a5)
				if (*openHandle != nullptr) {
    80001bfc:	f1843783          	ld	a5,-232(s0)
    80001c00:	0007b783          	ld	a5,0(a5)
    80001c04:	00078663          	beqz	a5,80001c10 <interruptRoutine+0x284>
					__asm__ volatile("li a0, 0");
    80001c08:	00000513          	li	a0,0
    80001c0c:	0080006f          	j	80001c14 <interruptRoutine+0x288>
				} else {
					__asm__ volatile("li a0, -1");
    80001c10:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    80001c14:	04a43823          	sd	a0,80(s0)
				break;
    80001c18:	2f00006f          	j	80001f08 <interruptRoutine+0x57c>
			case 0x22:
				//sem_close
				sem_t closeHandle;
				closeHandle = (sem_t)a1;
    80001c1c:	fb843783          	ld	a5,-72(s0)
    80001c20:	f2f43023          	sd	a5,-224(s0)
				KSem::closeSem(closeHandle);
    80001c24:	f2043503          	ld	a0,-224(s0)
    80001c28:	00001097          	auipc	ra,0x1
    80001c2c:	1d0080e7          	jalr	464(ra) # 80002df8 <_ZN4KSem8closeSemEPS_>
				__asm__ volatile("sd a0, 80(s0)");
    80001c30:	04a43823          	sd	a0,80(s0)
				break;
    80001c34:	2d40006f          	j	80001f08 <interruptRoutine+0x57c>
			case 0x23:
				//sem_wait
				sem_t waitHandle;
				waitHandle = (sem_t)a1;
    80001c38:	fb843783          	ld	a5,-72(s0)
    80001c3c:	f2f43423          	sd	a5,-216(s0)
				waitHandle->wait();
    80001c40:	f2843503          	ld	a0,-216(s0)
    80001c44:	00001097          	auipc	ra,0x1
    80001c48:	080080e7          	jalr	128(ra) # 80002cc4 <_ZN4KSem4waitEv>
				__asm__ volatile("sd a0, 80(s0)");
    80001c4c:	04a43823          	sd	a0,80(s0)
				break;
    80001c50:	2b80006f          	j	80001f08 <interruptRoutine+0x57c>
			case 0x24:
				//sem_signal
				sem_t signalHandle;
				signalHandle = (sem_t)a1;
    80001c54:	fb843783          	ld	a5,-72(s0)
    80001c58:	f2f43823          	sd	a5,-208(s0)
				signalHandle->signal();
    80001c5c:	f3043503          	ld	a0,-208(s0)
    80001c60:	00001097          	auipc	ra,0x1
    80001c64:	11c080e7          	jalr	284(ra) # 80002d7c <_ZN4KSem6signalEv>
				__asm__ volatile("sd a0, 80(s0)");
    80001c68:	04a43823          	sd	a0,80(s0)
				break;
    80001c6c:	29c0006f          	j	80001f08 <interruptRoutine+0x57c>
			case 0x31:
				//time_sleep
				time_t timerPeriods;
				timerPeriods = (time_t)a1;
    80001c70:	fb843783          	ld	a5,-72(s0)
    80001c74:	f2f43c23          	sd	a5,-200(s0)
				if (timerPeriods > 0) {
    80001c78:	f3843783          	ld	a5,-200(s0)
    80001c7c:	00078663          	beqz	a5,80001c88 <interruptRoutine+0x2fc>
					__asm__ volatile("li a0, 0");
    80001c80:	00000513          	li	a0,0
    80001c84:	0080006f          	j	80001c8c <interruptRoutine+0x300>
				} else {
					__asm__ volatile("li a0, -1");
    80001c88:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    80001c8c:	04a43823          	sd	a0,80(s0)
				if (timerPeriods > 0) {
    80001c90:	f3843783          	ld	a5,-200(s0)
    80001c94:	26078063          	beqz	a5,80001ef4 <interruptRoutine+0x568>
					Scheduler::putToSleep(TCB::running, timerPeriods);
    80001c98:	0000a797          	auipc	a5,0xa
    80001c9c:	d007b783          	ld	a5,-768(a5) # 8000b998 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001ca0:	0007b783          	ld	a5,0(a5)
    80001ca4:	f3843583          	ld	a1,-200(s0)
    80001ca8:	00078513          	mv	a0,a5
    80001cac:	00000097          	auipc	ra,0x0
    80001cb0:	a38080e7          	jalr	-1480(ra) # 800016e4 <_ZN9Scheduler10putToSleepEP3TCBm>
					TCB::yield();
    80001cb4:	00001097          	auipc	ra,0x1
    80001cb8:	9d8080e7          	jalr	-1576(ra) # 8000268c <_ZN3TCB5yieldEv>
				}
				break;
    80001cbc:	2380006f          	j	80001ef4 <interruptRoutine+0x568>
			case 0x41:
				//getc
				__getc();
    80001cc0:	00007097          	auipc	ra,0x7
    80001cc4:	c48080e7          	jalr	-952(ra) # 80008908 <__getc>
				__asm__ volatile("sd a0, 80(s0)");
    80001cc8:	04a43823          	sd	a0,80(s0)
				break;
    80001ccc:	23c0006f          	j	80001f08 <interruptRoutine+0x57c>
			case 0x42:
				//putc
				char c;
				c = (char)a1;
    80001cd0:	fb843783          	ld	a5,-72(s0)
    80001cd4:	f4f403a3          	sb	a5,-185(s0)
				__putc(c);
    80001cd8:	f4744783          	lbu	a5,-185(s0)
    80001cdc:	00078513          	mv	a0,a5
    80001ce0:	00007097          	auipc	ra,0x7
    80001ce4:	bec080e7          	jalr	-1044(ra) # 800088cc <__putc>
				break;
    80001ce8:	2200006f          	j	80001f08 <interruptRoutine+0x57c>
			case 0x80:
				//alloc thread
				thread_t* handleAlloc;
				handleAlloc = (thread_t*)a1;
    80001cec:	fb843783          	ld	a5,-72(s0)
    80001cf0:	f6f43023          	sd	a5,-160(s0)
				void (* foo)(void*);
				foo = (void (*)(void*))a2;
    80001cf4:	fb043783          	ld	a5,-80(s0)
    80001cf8:	f4f43c23          	sd	a5,-168(s0)
				void* argsAlloc;
				argsAlloc = (void*)a3;
    80001cfc:	fa843783          	ld	a5,-88(s0)
    80001d00:	f4f43823          	sd	a5,-176(s0)
				uint64* spAlloc;
				spAlloc = (uint64*)a4;
    80001d04:	fa043783          	ld	a5,-96(s0)
    80001d08:	f4f43423          	sd	a5,-184(s0)

				*handleAlloc = TCB::createThread(foo, argsAlloc, spAlloc);
    80001d0c:	f4843603          	ld	a2,-184(s0)
    80001d10:	f5043583          	ld	a1,-176(s0)
    80001d14:	f5843503          	ld	a0,-168(s0)
    80001d18:	00001097          	auipc	ra,0x1
    80001d1c:	9dc080e7          	jalr	-1572(ra) # 800026f4 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80001d20:	00050713          	mv	a4,a0
    80001d24:	f6043783          	ld	a5,-160(s0)
    80001d28:	00e7b023          	sd	a4,0(a5)
				if (*handleAlloc != nullptr) {
    80001d2c:	f6043783          	ld	a5,-160(s0)
    80001d30:	0007b783          	ld	a5,0(a5)
    80001d34:	00078663          	beqz	a5,80001d40 <interruptRoutine+0x3b4>
					__asm__ volatile("li a0, 0");
    80001d38:	00000513          	li	a0,0
    80001d3c:	0080006f          	j	80001d44 <interruptRoutine+0x3b8>
				} else {
					__asm__ volatile("li a0, -1");
    80001d40:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    80001d44:	04a43823          	sd	a0,80(s0)
				break;
    80001d48:	1c00006f          	j	80001f08 <interruptRoutine+0x57c>
			case 0x81:
				//start thread
				thread_t threadStartHandle;
				threadStartHandle = (thread_t)a1;
    80001d4c:	fb843783          	ld	a5,-72(s0)
    80001d50:	f6f43423          	sd	a5,-152(s0)
				Scheduler::put(threadStartHandle);
    80001d54:	f6843503          	ld	a0,-152(s0)
    80001d58:	00000097          	auipc	ra,0x0
    80001d5c:	908080e7          	jalr	-1784(ra) # 80001660 <_ZN9Scheduler3putEP3TCB>
				break;
    80001d60:	1a80006f          	j	80001f08 <interruptRoutine+0x57c>
			case 0x90:
				//printString
				const char* string;
				string = (const char*)a1;
    80001d64:	fb843783          	ld	a5,-72(s0)
    80001d68:	fef43423          	sd	a5,-24(s0)
				while (*string != '\0') {
    80001d6c:	fe843783          	ld	a5,-24(s0)
    80001d70:	0007c783          	lbu	a5,0(a5)
    80001d74:	18078463          	beqz	a5,80001efc <interruptRoutine+0x570>
					__putc(*string);
    80001d78:	fe843783          	ld	a5,-24(s0)
    80001d7c:	0007c783          	lbu	a5,0(a5)
    80001d80:	00078513          	mv	a0,a5
    80001d84:	00007097          	auipc	ra,0x7
    80001d88:	b48080e7          	jalr	-1208(ra) # 800088cc <__putc>
					string++;
    80001d8c:	fe843783          	ld	a5,-24(s0)
    80001d90:	00178793          	addi	a5,a5,1
    80001d94:	fef43423          	sd	a5,-24(s0)
				while (*string != '\0') {
    80001d98:	fd5ff06f          	j	80001d6c <interruptRoutine+0x3e0>
				}
				break;
			case 0x91:
				//printInteger
				uint64 integer;
				integer = a1;
    80001d9c:	fb843783          	ld	a5,-72(s0)
    80001da0:	f6f43c23          	sd	a5,-136(s0)
				static char digits[] = "0123456789";
				char buf[16];
				int i, neg;
				uint x;

				neg = 0;
    80001da4:	f6042a23          	sw	zero,-140(s0)
				if (integer < 0) {
					neg = 1;
					x = -integer;
				} else {
					x = integer;
    80001da8:	f7843783          	ld	a5,-136(s0)
    80001dac:	fef42023          	sw	a5,-32(s0)
				}

				i = 0;
    80001db0:	fe042223          	sw	zero,-28(s0)
				do {
					buf[i++] = digits[x % 10];
    80001db4:	fe042703          	lw	a4,-32(s0)
    80001db8:	00a00793          	li	a5,10
    80001dbc:	02f777bb          	remuw	a5,a4,a5
    80001dc0:	0007861b          	sext.w	a2,a5
    80001dc4:	fe442783          	lw	a5,-28(s0)
    80001dc8:	0017871b          	addiw	a4,a5,1
    80001dcc:	fee42223          	sw	a4,-28(s0)
    80001dd0:	0000a697          	auipc	a3,0xa
    80001dd4:	96868693          	addi	a3,a3,-1688 # 8000b738 <_ZZ16interruptRoutineE6digits>
    80001dd8:	02061713          	slli	a4,a2,0x20
    80001ddc:	02075713          	srli	a4,a4,0x20
    80001de0:	00e68733          	add	a4,a3,a4
    80001de4:	00074703          	lbu	a4,0(a4)
    80001de8:	ff040693          	addi	a3,s0,-16
    80001dec:	00f687b3          	add	a5,a3,a5
    80001df0:	ece78c23          	sb	a4,-296(a5)
				} while ((x /= 10) != 0);
    80001df4:	fe042703          	lw	a4,-32(s0)
    80001df8:	00a00793          	li	a5,10
    80001dfc:	02f757bb          	divuw	a5,a4,a5
    80001e00:	fef42023          	sw	a5,-32(s0)
    80001e04:	fe042783          	lw	a5,-32(s0)
    80001e08:	0007879b          	sext.w	a5,a5
    80001e0c:	00f037b3          	snez	a5,a5
    80001e10:	0ff7f793          	andi	a5,a5,255
    80001e14:	00078463          	beqz	a5,80001e1c <interruptRoutine+0x490>
				do {
    80001e18:	f9dff06f          	j	80001db4 <interruptRoutine+0x428>
				if (neg) buf[i++] = '-';
    80001e1c:	f7442783          	lw	a5,-140(s0)
    80001e20:	0007879b          	sext.w	a5,a5
    80001e24:	02078063          	beqz	a5,80001e44 <interruptRoutine+0x4b8>
    80001e28:	fe442783          	lw	a5,-28(s0)
    80001e2c:	0017871b          	addiw	a4,a5,1
    80001e30:	fee42223          	sw	a4,-28(s0)
    80001e34:	ff040713          	addi	a4,s0,-16
    80001e38:	00f707b3          	add	a5,a4,a5
    80001e3c:	02d00713          	li	a4,45
    80001e40:	ece78c23          	sb	a4,-296(a5)

				while (--i >= 0) {
    80001e44:	fe442783          	lw	a5,-28(s0)
    80001e48:	fff7879b          	addiw	a5,a5,-1
    80001e4c:	fef42223          	sw	a5,-28(s0)
    80001e50:	fe442783          	lw	a5,-28(s0)
    80001e54:	fff7c793          	not	a5,a5
    80001e58:	01f7d79b          	srliw	a5,a5,0x1f
    80001e5c:	0ff7f793          	andi	a5,a5,255
    80001e60:	0a078263          	beqz	a5,80001f04 <interruptRoutine+0x578>
					__putc(buf[i]);
    80001e64:	fe442783          	lw	a5,-28(s0)
    80001e68:	ff040713          	addi	a4,s0,-16
    80001e6c:	00f707b3          	add	a5,a4,a5
    80001e70:	ed87c783          	lbu	a5,-296(a5)
    80001e74:	00078513          	mv	a0,a5
    80001e78:	00007097          	auipc	ra,0x7
    80001e7c:	a54080e7          	jalr	-1452(ra) # 800088cc <__putc>
				while (--i >= 0) {
    80001e80:	fc5ff06f          	j	80001e44 <interruptRoutine+0x4b8>
				}
				break;
			default:
				printString("\nNepostojeci op code: ");
    80001e84:	00007517          	auipc	a0,0x7
    80001e88:	19c50513          	addi	a0,a0,412 # 80009020 <CONSOLE_STATUS+0x10>
    80001e8c:	00003097          	auipc	ra,0x3
    80001e90:	734080e7          	jalr	1844(ra) # 800055c0 <_Z11printStringPKc>
				printInteger(opCode);
    80001e94:	f8043783          	ld	a5,-128(s0)
    80001e98:	0007879b          	sext.w	a5,a5
    80001e9c:	00078513          	mv	a0,a5
    80001ea0:	00001097          	auipc	ra,0x1
    80001ea4:	fc8080e7          	jalr	-56(ra) # 80002e68 <_Z12printIntegeri>
				printString("\nscause: ");
    80001ea8:	00007517          	auipc	a0,0x7
    80001eac:	19050513          	addi	a0,a0,400 # 80009038 <CONSOLE_STATUS+0x28>
    80001eb0:	00003097          	auipc	ra,0x3
    80001eb4:	710080e7          	jalr	1808(ra) # 800055c0 <_Z11printStringPKc>
				printInteger(scause);
    80001eb8:	fd843783          	ld	a5,-40(s0)
    80001ebc:	0007879b          	sext.w	a5,a5
    80001ec0:	00078513          	mv	a0,a5
    80001ec4:	00001097          	auipc	ra,0x1
    80001ec8:	fa4080e7          	jalr	-92(ra) # 80002e68 <_Z12printIntegeri>
				printString("\nsepc: ");
    80001ecc:	00007517          	auipc	a0,0x7
    80001ed0:	17c50513          	addi	a0,a0,380 # 80009048 <CONSOLE_STATUS+0x38>
    80001ed4:	00003097          	auipc	ra,0x3
    80001ed8:	6ec080e7          	jalr	1772(ra) # 800055c0 <_Z11printStringPKc>
				printInteger(sepc);
    80001edc:	fd043783          	ld	a5,-48(s0)
    80001ee0:	0007879b          	sext.w	a5,a5
    80001ee4:	00078513          	mv	a0,a5
    80001ee8:	00001097          	auipc	ra,0x1
    80001eec:	f80080e7          	jalr	-128(ra) # 80002e68 <_Z12printIntegeri>
				break;
    80001ef0:	0180006f          	j	80001f08 <interruptRoutine+0x57c>
				break;
    80001ef4:	00000013          	nop
    80001ef8:	0100006f          	j	80001f08 <interruptRoutine+0x57c>
				break;
    80001efc:	00000013          	nop
    80001f00:	0080006f          	j	80001f08 <interruptRoutine+0x57c>
				break;
    80001f04:	00000013          	nop
		}
		//sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
		//sepc += 4;
		__asm__ volatile("addi %[dst], %[src], 0x4":[dst]"=r"(sepc):[src]"r"(
				sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001f08:	fd043303          	ld	t1,-48(s0)
    80001f0c:	00430313          	addi	t1,t1,4
    80001f10:	fc643823          	sd	t1,-48(s0)
		__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001f14:	fd043303          	ld	t1,-48(s0)
    80001f18:	14131073          	csrw	sepc,t1
    80001f1c:	00000013          	nop
		printString("scause: ");
		printInteger(scause);
		printString("\nsepc: ");
		printInteger(sepc);
	}
}
    80001f20:	1280006f          	j	80002048 <interruptRoutine+0x6bc>
	} else if (scause == (1UL << 63 | 9)) {
    80001f24:	fd843703          	ld	a4,-40(s0)
    80001f28:	fff00793          	li	a5,-1
    80001f2c:	03f79793          	slli	a5,a5,0x3f
    80001f30:	00978793          	addi	a5,a5,9
    80001f34:	00f71863          	bne	a4,a5,80001f44 <interruptRoutine+0x5b8>
		console_handler();
    80001f38:	00007097          	auipc	ra,0x7
    80001f3c:	a08080e7          	jalr	-1528(ra) # 80008940 <console_handler>
}
    80001f40:	1080006f          	j	80002048 <interruptRoutine+0x6bc>
	} else if (scause == (1UL << 63 | 1)) {
    80001f44:	fd843703          	ld	a4,-40(s0)
    80001f48:	fff00793          	li	a5,-1
    80001f4c:	03f79793          	slli	a5,a5,0x3f
    80001f50:	00178793          	addi	a5,a5,1
    80001f54:	08f71e63          	bne	a4,a5,80001ff0 <interruptRoutine+0x664>
		Scheduler::wake();
    80001f58:	00000097          	auipc	ra,0x0
    80001f5c:	834080e7          	jalr	-1996(ra) # 8000178c <_ZN9Scheduler4wakeEv>
		TCB::runningTimeSlice++;
    80001f60:	0000a797          	auipc	a5,0xa
    80001f64:	a207b783          	ld	a5,-1504(a5) # 8000b980 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001f68:	0007b783          	ld	a5,0(a5)
    80001f6c:	00178713          	addi	a4,a5,1
    80001f70:	0000a797          	auipc	a5,0xa
    80001f74:	a107b783          	ld	a5,-1520(a5) # 8000b980 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001f78:	00e7b023          	sd	a4,0(a5)
		if (TCB::runningTimeSlice >= TCB::running->getTimeSlice()) {
    80001f7c:	0000a797          	auipc	a5,0xa
    80001f80:	a1c7b783          	ld	a5,-1508(a5) # 8000b998 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001f84:	0007b783          	ld	a5,0(a5)
    80001f88:	00078513          	mv	a0,a5
    80001f8c:	00000097          	auipc	ra,0x0
    80001f90:	140080e7          	jalr	320(ra) # 800020cc <_ZN3TCB12getTimeSliceEv>
    80001f94:	00050713          	mv	a4,a0
    80001f98:	0000a797          	auipc	a5,0xa
    80001f9c:	9e87b783          	ld	a5,-1560(a5) # 8000b980 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001fa0:	0007b783          	ld	a5,0(a5)
    80001fa4:	00e7b7b3          	sltu	a5,a5,a4
    80001fa8:	0017c793          	xori	a5,a5,1
    80001fac:	0ff7f793          	andi	a5,a5,255
    80001fb0:	00078c63          	beqz	a5,80001fc8 <interruptRoutine+0x63c>
			TCB::yield();
    80001fb4:	00000097          	auipc	ra,0x0
    80001fb8:	6d8080e7          	jalr	1752(ra) # 8000268c <_ZN3TCB5yieldEv>
			TCB::runningTimeSlice = 0;
    80001fbc:	0000a797          	auipc	a5,0xa
    80001fc0:	9c47b783          	ld	a5,-1596(a5) # 8000b980 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001fc4:	0007b023          	sd	zero,0(a5)
		Riscv::w_sepc(sepc);
    80001fc8:	fd043503          	ld	a0,-48(s0)
    80001fcc:	00000097          	auipc	ra,0x0
    80001fd0:	090080e7          	jalr	144(ra) # 8000205c <_ZN5Riscv6w_sepcEm>
		Riscv::w_sstatus(sstatus);
    80001fd4:	fc843503          	ld	a0,-56(s0)
    80001fd8:	00000097          	auipc	ra,0x0
    80001fdc:	0bc080e7          	jalr	188(ra) # 80002094 <_ZN5Riscv9w_sstatusEm>
		Riscv::mc_sip(Riscv::SIP_SSIP);
    80001fe0:	00200513          	li	a0,2
    80001fe4:	00000097          	auipc	ra,0x0
    80001fe8:	094080e7          	jalr	148(ra) # 80002078 <_ZN5Riscv6mc_sipEm>
}
    80001fec:	05c0006f          	j	80002048 <interruptRoutine+0x6bc>
		printString("\nGreska u prekidnoj rutini\n");
    80001ff0:	00007517          	auipc	a0,0x7
    80001ff4:	06050513          	addi	a0,a0,96 # 80009050 <CONSOLE_STATUS+0x40>
    80001ff8:	00003097          	auipc	ra,0x3
    80001ffc:	5c8080e7          	jalr	1480(ra) # 800055c0 <_Z11printStringPKc>
		printString("scause: ");
    80002000:	00007517          	auipc	a0,0x7
    80002004:	07050513          	addi	a0,a0,112 # 80009070 <CONSOLE_STATUS+0x60>
    80002008:	00003097          	auipc	ra,0x3
    8000200c:	5b8080e7          	jalr	1464(ra) # 800055c0 <_Z11printStringPKc>
		printInteger(scause);
    80002010:	fd843783          	ld	a5,-40(s0)
    80002014:	0007879b          	sext.w	a5,a5
    80002018:	00078513          	mv	a0,a5
    8000201c:	00001097          	auipc	ra,0x1
    80002020:	e4c080e7          	jalr	-436(ra) # 80002e68 <_Z12printIntegeri>
		printString("\nsepc: ");
    80002024:	00007517          	auipc	a0,0x7
    80002028:	02450513          	addi	a0,a0,36 # 80009048 <CONSOLE_STATUS+0x38>
    8000202c:	00003097          	auipc	ra,0x3
    80002030:	594080e7          	jalr	1428(ra) # 800055c0 <_Z11printStringPKc>
		printInteger(sepc);
    80002034:	fd043783          	ld	a5,-48(s0)
    80002038:	0007879b          	sext.w	a5,a5
    8000203c:	00078513          	mv	a0,a5
    80002040:	00001097          	auipc	ra,0x1
    80002044:	e28080e7          	jalr	-472(ra) # 80002e68 <_Z12printIntegeri>
}
    80002048:	00000013          	nop
    8000204c:	13813083          	ld	ra,312(sp)
    80002050:	13013403          	ld	s0,304(sp)
    80002054:	14010113          	addi	sp,sp,320
    80002058:	00008067          	ret

000000008000205c <_ZN5Riscv6w_sepcEm>:
inline void Riscv::w_sepc(uint64 sepc) {
    8000205c:	ff010113          	addi	sp,sp,-16
    80002060:	00813423          	sd	s0,8(sp)
    80002064:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002068:	14151073          	csrw	sepc,a0
}
    8000206c:	00813403          	ld	s0,8(sp)
    80002070:	01010113          	addi	sp,sp,16
    80002074:	00008067          	ret

0000000080002078 <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    80002078:	ff010113          	addi	sp,sp,-16
    8000207c:	00813423          	sd	s0,8(sp)
    80002080:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    80002084:	14453073          	csrc	sip,a0
}
    80002088:	00813403          	ld	s0,8(sp)
    8000208c:	01010113          	addi	sp,sp,16
    80002090:	00008067          	ret

0000000080002094 <_ZN5Riscv9w_sstatusEm>:
	uint64 volatile sstatus;
	__asm__ volatile("csrr %[sstatus], sstatus": [sstatus] "=r"(sstatus));
	return sstatus;
}

inline void Riscv::w_sstatus(uint64 sstatus) {
    80002094:	ff010113          	addi	sp,sp,-16
    80002098:	00813423          	sd	s0,8(sp)
    8000209c:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw sstatus, %[sstatus]": :[sstatus] "r"(sstatus));
    800020a0:	10051073          	csrw	sstatus,a0
}
    800020a4:	00813403          	ld	s0,8(sp)
    800020a8:	01010113          	addi	sp,sp,16
    800020ac:	00008067          	ret

00000000800020b0 <_ZN3TCB11setFinishedEb>:

	void setFinished(bool finish) { this->finished = finish; }
    800020b0:	ff010113          	addi	sp,sp,-16
    800020b4:	00813423          	sd	s0,8(sp)
    800020b8:	01010413          	addi	s0,sp,16
    800020bc:	02b50823          	sb	a1,48(a0)
    800020c0:	00813403          	ld	s0,8(sp)
    800020c4:	01010113          	addi	sp,sp,16
    800020c8:	00008067          	ret

00000000800020cc <_ZN3TCB12getTimeSliceEv>:

	bool isBlocked() { return blocked; }

	void setBlocked(bool block) { this->blocked = block; }

	uint64 getTimeSlice() { return timeSlice; }
    800020cc:	ff010113          	addi	sp,sp,-16
    800020d0:	00813423          	sd	s0,8(sp)
    800020d4:	01010413          	addi	s0,sp,16
    800020d8:	02853503          	ld	a0,40(a0)
    800020dc:	00813403          	ld	s0,8(sp)
    800020e0:	01010113          	addi	sp,sp,16
    800020e4:	00008067          	ret

00000000800020e8 <_ZN6ThreadD1Ev>:
	//a4 = pokazivac na najnizu adresu steka (stek raste ka nizim adresama, pokazuje na poslednju zauzetu)

	__asm__ volatile("ecall");
}

Thread::~Thread() {
    800020e8:	ff010113          	addi	sp,sp,-16
    800020ec:	00813423          	sd	s0,8(sp)
    800020f0:	01010413          	addi	s0,sp,16

}
    800020f4:	00813403          	ld	s0,8(sp)
    800020f8:	01010113          	addi	sp,sp,16
    800020fc:	00008067          	ret

0000000080002100 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
	sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    80002100:	fe010113          	addi	sp,sp,-32
    80002104:	00113c23          	sd	ra,24(sp)
    80002108:	00813823          	sd	s0,16(sp)
    8000210c:	00913423          	sd	s1,8(sp)
    80002110:	02010413          	addi	s0,sp,32
    80002114:	00050493          	mv	s1,a0
    80002118:	00009797          	auipc	a5,0x9
    8000211c:	69878793          	addi	a5,a5,1688 # 8000b7b0 <_ZTV9Semaphore+0x10>
    80002120:	00f53023          	sd	a5,0(a0)
	sem_close(myHandle);
    80002124:	00853503          	ld	a0,8(a0)
    80002128:	fffff097          	auipc	ra,0xfffff
    8000212c:	3b0080e7          	jalr	944(ra) # 800014d8 <_Z9sem_closeP4KSem>
	delete myHandle;
    80002130:	0084b483          	ld	s1,8(s1)
    80002134:	02048863          	beqz	s1,80002164 <_ZN9SemaphoreD1Ev+0x64>
			delete node;
		}
	}

	bool isEmpty() const {
		return front == nullptr;
    80002138:	0084b503          	ld	a0,8(s1)
		while (!isEmpty()) {
    8000213c:	00050e63          	beqz	a0,80002158 <_ZN9SemaphoreD1Ev+0x58>
			front = front->next;
    80002140:	00853783          	ld	a5,8(a0)
    80002144:	00f4b423          	sd	a5,8(s1)
			delete node;
    80002148:	fe0508e3          	beqz	a0,80002138 <_ZN9SemaphoreD1Ev+0x38>
			mem_free(ptr);
    8000214c:	fffff097          	auipc	ra,0xfffff
    80002150:	204080e7          	jalr	516(ra) # 80001350 <_Z8mem_freePv>
		}
    80002154:	fe5ff06f          	j	80002138 <_ZN9SemaphoreD1Ev+0x38>
    80002158:	00048513          	mv	a0,s1
    8000215c:	00001097          	auipc	ra,0x1
    80002160:	aac080e7          	jalr	-1364(ra) # 80002c08 <_ZN4KSemdlEPv>
}
    80002164:	01813083          	ld	ra,24(sp)
    80002168:	01013403          	ld	s0,16(sp)
    8000216c:	00813483          	ld	s1,8(sp)
    80002170:	02010113          	addi	sp,sp,32
    80002174:	00008067          	ret

0000000080002178 <_Znwm>:
void* operator new(size_t size) {
    80002178:	ff010113          	addi	sp,sp,-16
    8000217c:	00113423          	sd	ra,8(sp)
    80002180:	00813023          	sd	s0,0(sp)
    80002184:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    80002188:	fffff097          	auipc	ra,0xfffff
    8000218c:	188080e7          	jalr	392(ra) # 80001310 <_Z9mem_allocm>
}
    80002190:	00813083          	ld	ra,8(sp)
    80002194:	00013403          	ld	s0,0(sp)
    80002198:	01010113          	addi	sp,sp,16
    8000219c:	00008067          	ret

00000000800021a0 <_Znam>:
void* operator new[](size_t size) {
    800021a0:	ff010113          	addi	sp,sp,-16
    800021a4:	00113423          	sd	ra,8(sp)
    800021a8:	00813023          	sd	s0,0(sp)
    800021ac:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    800021b0:	fffff097          	auipc	ra,0xfffff
    800021b4:	160080e7          	jalr	352(ra) # 80001310 <_Z9mem_allocm>
}
    800021b8:	00813083          	ld	ra,8(sp)
    800021bc:	00013403          	ld	s0,0(sp)
    800021c0:	01010113          	addi	sp,sp,16
    800021c4:	00008067          	ret

00000000800021c8 <_ZdlPv>:
noexcept {
    800021c8:	ff010113          	addi	sp,sp,-16
    800021cc:	00113423          	sd	ra,8(sp)
    800021d0:	00813023          	sd	s0,0(sp)
    800021d4:	01010413          	addi	s0,sp,16
mem_free(ptr);
    800021d8:	fffff097          	auipc	ra,0xfffff
    800021dc:	178080e7          	jalr	376(ra) # 80001350 <_Z8mem_freePv>
}
    800021e0:	00813083          	ld	ra,8(sp)
    800021e4:	00013403          	ld	s0,0(sp)
    800021e8:	01010113          	addi	sp,sp,16
    800021ec:	00008067          	ret

00000000800021f0 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    800021f0:	ff010113          	addi	sp,sp,-16
    800021f4:	00113423          	sd	ra,8(sp)
    800021f8:	00813023          	sd	s0,0(sp)
    800021fc:	01010413          	addi	s0,sp,16
}
    80002200:	00000097          	auipc	ra,0x0
    80002204:	fc8080e7          	jalr	-56(ra) # 800021c8 <_ZdlPv>
    80002208:	00813083          	ld	ra,8(sp)
    8000220c:	00013403          	ld	s0,0(sp)
    80002210:	01010113          	addi	sp,sp,16
    80002214:	00008067          	ret

0000000080002218 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80002218:	fe010113          	addi	sp,sp,-32
    8000221c:	00113c23          	sd	ra,24(sp)
    80002220:	00813823          	sd	s0,16(sp)
    80002224:	00913423          	sd	s1,8(sp)
    80002228:	02010413          	addi	s0,sp,32
    8000222c:	00050493          	mv	s1,a0
}
    80002230:	00000097          	auipc	ra,0x0
    80002234:	ed0080e7          	jalr	-304(ra) # 80002100 <_ZN9SemaphoreD1Ev>
    80002238:	00048513          	mv	a0,s1
    8000223c:	00000097          	auipc	ra,0x0
    80002240:	f8c080e7          	jalr	-116(ra) # 800021c8 <_ZdlPv>
    80002244:	01813083          	ld	ra,24(sp)
    80002248:	01013403          	ld	s0,16(sp)
    8000224c:	00813483          	ld	s1,8(sp)
    80002250:	02010113          	addi	sp,sp,32
    80002254:	00008067          	ret

0000000080002258 <_ZdaPv>:
noexcept {
    80002258:	ff010113          	addi	sp,sp,-16
    8000225c:	00113423          	sd	ra,8(sp)
    80002260:	00813023          	sd	s0,0(sp)
    80002264:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80002268:	fffff097          	auipc	ra,0xfffff
    8000226c:	0e8080e7          	jalr	232(ra) # 80001350 <_Z8mem_freePv>
}
    80002270:	00813083          	ld	ra,8(sp)
    80002274:	00013403          	ld	s0,0(sp)
    80002278:	01010113          	addi	sp,sp,16
    8000227c:	00008067          	ret

0000000080002280 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (* body)(void*), void* arg) {
    80002280:	fd010113          	addi	sp,sp,-48
    80002284:	02113423          	sd	ra,40(sp)
    80002288:	02813023          	sd	s0,32(sp)
    8000228c:	00913c23          	sd	s1,24(sp)
    80002290:	01213823          	sd	s2,16(sp)
    80002294:	01313423          	sd	s3,8(sp)
    80002298:	03010413          	addi	s0,sp,48
    8000229c:	00050493          	mv	s1,a0
    800022a0:	00058913          	mv	s2,a1
    800022a4:	00060993          	mv	s3,a2
    800022a8:	00009797          	auipc	a5,0x9
    800022ac:	4e078793          	addi	a5,a5,1248 # 8000b788 <_ZTV6Thread+0x10>
    800022b0:	00f53023          	sd	a5,0(a0)
	this->body = body;
    800022b4:	00b53823          	sd	a1,16(a0)
	this->arg = arg;
    800022b8:	00c53c23          	sd	a2,24(a0)
	if (body != nullptr) {
    800022bc:	04058663          	beqz	a1,80002308 <_ZN6ThreadC1EPFvPvES0_+0x88>
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    800022c0:	00001537          	lui	a0,0x1
    800022c4:	fffff097          	auipc	ra,0xfffff
    800022c8:	04c080e7          	jalr	76(ra) # 80001310 <_Z9mem_allocm>
    800022cc:	00050313          	mv	t1,a0
	__asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800022d0:	00030713          	mv	a4,t1
	__asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800022d4:	00098693          	mv	a3,s3
			body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800022d8:	00090613          	mv	a2,s2
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800022dc:	00848493          	addi	s1,s1,8
    800022e0:	00048593          	mv	a1,s1
	__asm__ volatile("li a0, 0x80");
    800022e4:	08000513          	li	a0,128
	__asm__ volatile("ecall");
    800022e8:	00000073          	ecall
}
    800022ec:	02813083          	ld	ra,40(sp)
    800022f0:	02013403          	ld	s0,32(sp)
    800022f4:	01813483          	ld	s1,24(sp)
    800022f8:	01013903          	ld	s2,16(sp)
    800022fc:	00813983          	ld	s3,8(sp)
    80002300:	03010113          	addi	sp,sp,48
    80002304:	00008067          	ret
	uint64* stack = nullptr;
    80002308:	00000313          	li	t1,0
    8000230c:	fc5ff06f          	j	800022d0 <_ZN6ThreadC1EPFvPvES0_+0x50>

0000000080002310 <_ZN6Thread5startEv>:
int Thread::start() {
    80002310:	ff010113          	addi	sp,sp,-16
    80002314:	00813423          	sd	s0,8(sp)
    80002318:	01010413          	addi	s0,sp,16
	if (myHandle == nullptr) return -1;
    8000231c:	00853303          	ld	t1,8(a0) # 1008 <_entry-0x7fffeff8>
    80002320:	02030063          	beqz	t1,80002340 <_ZN6Thread5startEv+0x30>
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002324:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x81");
    80002328:	08100513          	li	a0,129
	__asm__ volatile("ecall");
    8000232c:	00000073          	ecall
	return 0;
    80002330:	00000513          	li	a0,0
}
    80002334:	00813403          	ld	s0,8(sp)
    80002338:	01010113          	addi	sp,sp,16
    8000233c:	00008067          	ret
	if (myHandle == nullptr) return -1;
    80002340:	fff00513          	li	a0,-1
    80002344:	ff1ff06f          	j	80002334 <_ZN6Thread5startEv+0x24>

0000000080002348 <_ZN6Thread4joinEv>:
void Thread::join() {
    80002348:	ff010113          	addi	sp,sp,-16
    8000234c:	00113423          	sd	ra,8(sp)
    80002350:	00813023          	sd	s0,0(sp)
    80002354:	01010413          	addi	s0,sp,16
	thread_join(myHandle);
    80002358:	00853503          	ld	a0,8(a0)
    8000235c:	fffff097          	auipc	ra,0xfffff
    80002360:	0ec080e7          	jalr	236(ra) # 80001448 <_Z11thread_joinP3TCB>
}
    80002364:	00813083          	ld	ra,8(sp)
    80002368:	00013403          	ld	s0,0(sp)
    8000236c:	01010113          	addi	sp,sp,16
    80002370:	00008067          	ret

0000000080002374 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80002374:	ff010113          	addi	sp,sp,-16
    80002378:	00113423          	sd	ra,8(sp)
    8000237c:	00813023          	sd	s0,0(sp)
    80002380:	01010413          	addi	s0,sp,16
	thread_dispatch();
    80002384:	fffff097          	auipc	ra,0xfffff
    80002388:	0a4080e7          	jalr	164(ra) # 80001428 <_Z15thread_dispatchv>
}
    8000238c:	00813083          	ld	ra,8(sp)
    80002390:	00013403          	ld	s0,0(sp)
    80002394:	01010113          	addi	sp,sp,16
    80002398:	00008067          	ret

000000008000239c <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t t) {
    8000239c:	ff010113          	addi	sp,sp,-16
    800023a0:	00113423          	sd	ra,8(sp)
    800023a4:	00813023          	sd	s0,0(sp)
    800023a8:	01010413          	addi	s0,sp,16
    800023ac:	00050593          	mv	a1,a0
	Scheduler::putToSleep(TCB::running, t);
    800023b0:	00009797          	auipc	a5,0x9
    800023b4:	5e87b783          	ld	a5,1512(a5) # 8000b998 <_GLOBAL_OFFSET_TABLE_+0x30>
    800023b8:	0007b503          	ld	a0,0(a5)
    800023bc:	fffff097          	auipc	ra,0xfffff
    800023c0:	328080e7          	jalr	808(ra) # 800016e4 <_ZN9Scheduler10putToSleepEP3TCBm>
}
    800023c4:	00000513          	li	a0,0
    800023c8:	00813083          	ld	ra,8(sp)
    800023cc:	00013403          	ld	s0,0(sp)
    800023d0:	01010113          	addi	sp,sp,16
    800023d4:	00008067          	ret

00000000800023d8 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    800023d8:	ff010113          	addi	sp,sp,-16
    800023dc:	00813423          	sd	s0,8(sp)
    800023e0:	01010413          	addi	s0,sp,16
    800023e4:	00009797          	auipc	a5,0x9
    800023e8:	3a478793          	addi	a5,a5,932 # 8000b788 <_ZTV6Thread+0x10>
    800023ec:	00f53023          	sd	a5,0(a0)
}
    800023f0:	00813403          	ld	s0,8(sp)
    800023f4:	01010113          	addi	sp,sp,16
    800023f8:	00008067          	ret

00000000800023fc <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    800023fc:	ff010113          	addi	sp,sp,-16
    80002400:	00113423          	sd	ra,8(sp)
    80002404:	00813023          	sd	s0,0(sp)
    80002408:	01010413          	addi	s0,sp,16
    8000240c:	00009797          	auipc	a5,0x9
    80002410:	3a478793          	addi	a5,a5,932 # 8000b7b0 <_ZTV9Semaphore+0x10>
    80002414:	00f53023          	sd	a5,0(a0)
	sem_open(&myHandle, init);
    80002418:	00850513          	addi	a0,a0,8
    8000241c:	fffff097          	auipc	ra,0xfffff
    80002420:	084080e7          	jalr	132(ra) # 800014a0 <_Z8sem_openPP4KSemj>
}
    80002424:	00813083          	ld	ra,8(sp)
    80002428:	00013403          	ld	s0,0(sp)
    8000242c:	01010113          	addi	sp,sp,16
    80002430:	00008067          	ret

0000000080002434 <_ZN9Semaphore4waitEv>:

int Semaphore::wait() {
    80002434:	ff010113          	addi	sp,sp,-16
    80002438:	00113423          	sd	ra,8(sp)
    8000243c:	00813023          	sd	s0,0(sp)
    80002440:	01010413          	addi	s0,sp,16
	return sem_wait(myHandle);
    80002444:	00853503          	ld	a0,8(a0)
    80002448:	fffff097          	auipc	ra,0xfffff
    8000244c:	0c0080e7          	jalr	192(ra) # 80001508 <_Z8sem_waitP4KSem>
}
    80002450:	00813083          	ld	ra,8(sp)
    80002454:	00013403          	ld	s0,0(sp)
    80002458:	01010113          	addi	sp,sp,16
    8000245c:	00008067          	ret

0000000080002460 <_ZN9Semaphore6signalEv>:

int Semaphore::signal() {
    80002460:	ff010113          	addi	sp,sp,-16
    80002464:	00113423          	sd	ra,8(sp)
    80002468:	00813023          	sd	s0,0(sp)
    8000246c:	01010413          	addi	s0,sp,16
	return sem_signal(myHandle);
    80002470:	00853503          	ld	a0,8(a0)
    80002474:	fffff097          	auipc	ra,0xfffff
    80002478:	0c4080e7          	jalr	196(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    8000247c:	00813083          	ld	ra,8(sp)
    80002480:	00013403          	ld	s0,0(sp)
    80002484:	01010113          	addi	sp,sp,16
    80002488:	00008067          	ret

000000008000248c <_ZN14PeriodicThread9terminateEv>:

void PeriodicThread::terminate() {
    8000248c:	ff010113          	addi	sp,sp,-16
    80002490:	00813423          	sd	s0,8(sp)
    80002494:	01010413          	addi	s0,sp,16

}
    80002498:	00813403          	ld	s0,8(sp)
    8000249c:	01010113          	addi	sp,sp,16
    800024a0:	00008067          	ret

00000000800024a4 <_ZN14PeriodicThreadC1Em>:

PeriodicThread::PeriodicThread(time_t period) {
    800024a4:	fe010113          	addi	sp,sp,-32
    800024a8:	00113c23          	sd	ra,24(sp)
    800024ac:	00813823          	sd	s0,16(sp)
    800024b0:	00913423          	sd	s1,8(sp)
    800024b4:	02010413          	addi	s0,sp,32
    800024b8:	00050493          	mv	s1,a0
    800024bc:	00000097          	auipc	ra,0x0
    800024c0:	f1c080e7          	jalr	-228(ra) # 800023d8 <_ZN6ThreadC1Ev>
    800024c4:	00009797          	auipc	a5,0x9
    800024c8:	29478793          	addi	a5,a5,660 # 8000b758 <_ZTV14PeriodicThread+0x10>
    800024cc:	00f4b023          	sd	a5,0(s1)

}
    800024d0:	01813083          	ld	ra,24(sp)
    800024d4:	01013403          	ld	s0,16(sp)
    800024d8:	00813483          	ld	s1,8(sp)
    800024dc:	02010113          	addi	sp,sp,32
    800024e0:	00008067          	ret

00000000800024e4 <_ZN7Console4getcEv>:

char Console::getc() {
    800024e4:	ff010113          	addi	sp,sp,-16
    800024e8:	00813423          	sd	s0,8(sp)
    800024ec:	01010413          	addi	s0,sp,16
	return 0;
}
    800024f0:	00000513          	li	a0,0
    800024f4:	00813403          	ld	s0,8(sp)
    800024f8:	01010113          	addi	sp,sp,16
    800024fc:	00008067          	ret

0000000080002500 <_ZN7Console4putcEc>:

void Console::putc(char) {
    80002500:	ff010113          	addi	sp,sp,-16
    80002504:	00813423          	sd	s0,8(sp)
    80002508:	01010413          	addi	s0,sp,16

}
    8000250c:	00813403          	ld	s0,8(sp)
    80002510:	01010113          	addi	sp,sp,16
    80002514:	00008067          	ret

0000000080002518 <_ZN6Thread3runEv>:
	static int sleep(time_t);

protected:
	Thread();

	virtual void run() {}
    80002518:	ff010113          	addi	sp,sp,-16
    8000251c:	00813423          	sd	s0,8(sp)
    80002520:	01010413          	addi	s0,sp,16
    80002524:	00813403          	ld	s0,8(sp)
    80002528:	01010113          	addi	sp,sp,16
    8000252c:	00008067          	ret

0000000080002530 <_ZN14PeriodicThread18periodicActivationEv>:
	void terminate();

protected:
	PeriodicThread(time_t period);

	virtual void periodicActivation() {}
    80002530:	ff010113          	addi	sp,sp,-16
    80002534:	00813423          	sd	s0,8(sp)
    80002538:	01010413          	addi	s0,sp,16
    8000253c:	00813403          	ld	s0,8(sp)
    80002540:	01010113          	addi	sp,sp,16
    80002544:	00008067          	ret

0000000080002548 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80002548:	ff010113          	addi	sp,sp,-16
    8000254c:	00813423          	sd	s0,8(sp)
    80002550:	01010413          	addi	s0,sp,16
    80002554:	00009797          	auipc	a5,0x9
    80002558:	20478793          	addi	a5,a5,516 # 8000b758 <_ZTV14PeriodicThread+0x10>
    8000255c:	00f53023          	sd	a5,0(a0)
    80002560:	00813403          	ld	s0,8(sp)
    80002564:	01010113          	addi	sp,sp,16
    80002568:	00008067          	ret

000000008000256c <_ZN14PeriodicThreadD0Ev>:
    8000256c:	ff010113          	addi	sp,sp,-16
    80002570:	00113423          	sd	ra,8(sp)
    80002574:	00813023          	sd	s0,0(sp)
    80002578:	01010413          	addi	s0,sp,16
    8000257c:	00009797          	auipc	a5,0x9
    80002580:	1dc78793          	addi	a5,a5,476 # 8000b758 <_ZTV14PeriodicThread+0x10>
    80002584:	00f53023          	sd	a5,0(a0)
    80002588:	00000097          	auipc	ra,0x0
    8000258c:	c40080e7          	jalr	-960(ra) # 800021c8 <_ZdlPv>
    80002590:	00813083          	ld	ra,8(sp)
    80002594:	00013403          	ld	s0,0(sp)
    80002598:	01010113          	addi	sp,sp,16
    8000259c:	00008067          	ret

00000000800025a0 <_ZN3TCB7wrapperEv>:
	Riscv::pushRegisters();
	TCB::dispatch();
	Riscv::popRegisters();
}

void TCB::wrapper() {
    800025a0:	ff010113          	addi	sp,sp,-16
    800025a4:	00113423          	sd	ra,8(sp)
    800025a8:	00813023          	sd	s0,0(sp)
    800025ac:	01010413          	addi	s0,sp,16
	//pocetak wrappera se izvrsava u supervisor modu,
	//jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch/yield)
	Riscv::popSppSpie();
    800025b0:	00000097          	auipc	ra,0x0
    800025b4:	318080e7          	jalr	792(ra) # 800028c8 <_ZN5Riscv10popSppSpieEv>
	//na dalje se izvrsavamo u user modu
	running->threadFunction(running->args);
    800025b8:	00009797          	auipc	a5,0x9
    800025bc:	4587b783          	ld	a5,1112(a5) # 8000ba10 <_ZN3TCB7runningE>
    800025c0:	0107b703          	ld	a4,16(a5)
    800025c4:	0207b503          	ld	a0,32(a5)
    800025c8:	000700e7          	jalr	a4
	//running->finished = true;
	//i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
	thread_exit();
    800025cc:	fffff097          	auipc	ra,0xfffff
    800025d0:	e34080e7          	jalr	-460(ra) # 80001400 <_Z11thread_exitv>
}
    800025d4:	00813083          	ld	ra,8(sp)
    800025d8:	00013403          	ld	s0,0(sp)
    800025dc:	01010113          	addi	sp,sp,16
    800025e0:	00008067          	ret

00000000800025e4 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    800025e4:	fe010113          	addi	sp,sp,-32
    800025e8:	00113c23          	sd	ra,24(sp)
    800025ec:	00813823          	sd	s0,16(sp)
    800025f0:	00913423          	sd	s1,8(sp)
    800025f4:	02010413          	addi	s0,sp,32
	TCB* old = TCB::running;
    800025f8:	00009497          	auipc	s1,0x9
    800025fc:	4184b483          	ld	s1,1048(s1) # 8000ba10 <_ZN3TCB7runningE>
	if (!old->finished && !old->blocked && old->timeToSleep == 0 && !old->needToJoin) {
    80002600:	0304c783          	lbu	a5,48(s1)
    80002604:	00079e63          	bnez	a5,80002620 <_ZN3TCB8dispatchEv+0x3c>
    80002608:	0314c783          	lbu	a5,49(s1)
    8000260c:	00079a63          	bnez	a5,80002620 <_ZN3TCB8dispatchEv+0x3c>
    80002610:	0404b783          	ld	a5,64(s1)
    80002614:	00079663          	bnez	a5,80002620 <_ZN3TCB8dispatchEv+0x3c>
    80002618:	0324c783          	lbu	a5,50(s1)
    8000261c:	04078a63          	beqz	a5,80002670 <_ZN3TCB8dispatchEv+0x8c>
	TCB::running = Scheduler::get();
    80002620:	fffff097          	auipc	ra,0xfffff
    80002624:	084080e7          	jalr	132(ra) # 800016a4 <_ZN9Scheduler3getEv>
    80002628:	00050593          	mv	a1,a0
    8000262c:	00009797          	auipc	a5,0x9
    80002630:	3e478793          	addi	a5,a5,996 # 8000ba10 <_ZN3TCB7runningE>
    80002634:	00a7b023          	sd	a0,0(a5)
	TCB::runningTimeSlice = 0;
    80002638:	0007b423          	sd	zero,8(a5)
	if (TCB::running->threadFunction == nullptr) {
    8000263c:	01053783          	ld	a5,16(a0)
    80002640:	04078063          	beqz	a5,80002680 <_ZN3TCB8dispatchEv+0x9c>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002644:	10000793          	li	a5,256
    80002648:	1007b073          	csrc	sstatus,a5
	if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    8000264c:	00b48863          	beq	s1,a1,8000265c <_ZN3TCB8dispatchEv+0x78>
    80002650:	00048513          	mv	a0,s1
    80002654:	fffff097          	auipc	ra,0xfffff
    80002658:	bbc080e7          	jalr	-1092(ra) # 80001210 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    8000265c:	01813083          	ld	ra,24(sp)
    80002660:	01013403          	ld	s0,16(sp)
    80002664:	00813483          	ld	s1,8(sp)
    80002668:	02010113          	addi	sp,sp,32
    8000266c:	00008067          	ret
		Scheduler::put(old);
    80002670:	00048513          	mv	a0,s1
    80002674:	fffff097          	auipc	ra,0xfffff
    80002678:	fec080e7          	jalr	-20(ra) # 80001660 <_ZN9Scheduler3putEP3TCB>
    8000267c:	fa5ff06f          	j	80002620 <_ZN3TCB8dispatchEv+0x3c>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80002680:	10000793          	li	a5,256
    80002684:	1007a073          	csrs	sstatus,a5
}
    80002688:	fc5ff06f          	j	8000264c <_ZN3TCB8dispatchEv+0x68>

000000008000268c <_ZN3TCB5yieldEv>:
void TCB::yield() {
    8000268c:	ff010113          	addi	sp,sp,-16
    80002690:	00113423          	sd	ra,8(sp)
    80002694:	00813023          	sd	s0,0(sp)
    80002698:	01010413          	addi	s0,sp,16
	Riscv::pushRegisters();
    8000269c:	fffff097          	auipc	ra,0xfffff
    800026a0:	964080e7          	jalr	-1692(ra) # 80001000 <_ZN5Riscv13pushRegistersEv>
	TCB::dispatch();
    800026a4:	00000097          	auipc	ra,0x0
    800026a8:	f40080e7          	jalr	-192(ra) # 800025e4 <_ZN3TCB8dispatchEv>
	Riscv::popRegisters();
    800026ac:	fffff097          	auipc	ra,0xfffff
    800026b0:	9d0080e7          	jalr	-1584(ra) # 8000107c <_ZN5Riscv12popRegistersEv>
}
    800026b4:	00813083          	ld	ra,8(sp)
    800026b8:	00013403          	ld	s0,0(sp)
    800026bc:	01010113          	addi	sp,sp,16
    800026c0:	00008067          	ret

00000000800026c4 <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    800026c4:	ff010113          	addi	sp,sp,-16
    800026c8:	00113423          	sd	ra,8(sp)
    800026cc:	00813023          	sd	s0,0(sp)
    800026d0:	01010413          	addi	s0,sp,16
	return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::THREAD);
    800026d4:	00200593          	li	a1,2
    800026d8:	01850513          	addi	a0,a0,24
    800026dc:	00000097          	auipc	ra,0x0
    800026e0:	20c080e7          	jalr	524(ra) # 800028e8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
}
    800026e4:	00813083          	ld	ra,8(sp)
    800026e8:	00013403          	ld	s0,0(sp)
    800026ec:	01010113          	addi	sp,sp,16
    800026f0:	00008067          	ret

00000000800026f4 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    800026f4:	fd010113          	addi	sp,sp,-48
    800026f8:	02113423          	sd	ra,40(sp)
    800026fc:	02813023          	sd	s0,32(sp)
    80002700:	00913c23          	sd	s1,24(sp)
    80002704:	01213823          	sd	s2,16(sp)
    80002708:	01313423          	sd	s3,8(sp)
    8000270c:	01413023          	sd	s4,0(sp)
    80002710:	03010413          	addi	s0,sp,48
    80002714:	00050993          	mv	s3,a0
    80002718:	00058a13          	mv	s4,a1
    8000271c:	00060913          	mv	s2,a2
	TCB* newThread = new TCB(function, args, stack);
    80002720:	06000513          	li	a0,96
    80002724:	00000097          	auipc	ra,0x0
    80002728:	fa0080e7          	jalr	-96(ra) # 800026c4 <_ZN3TCBnwEm>
    8000272c:	00050493          	mv	s1,a0


	TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
													timeSlice(DEFAULT_TIME_SLICE), finished(false), blocked(false),
													needToJoin(false),
													nextInScheduler(nullptr), timeToSleep(0), nextSleeping(nullptr) {
    80002730:	01353823          	sd	s3,16(a0)
    80002734:	01253c23          	sd	s2,24(a0)
    80002738:	03453023          	sd	s4,32(a0)
    8000273c:	00200793          	li	a5,2
    80002740:	02f53423          	sd	a5,40(a0)
    80002744:	02050823          	sb	zero,48(a0)
    80002748:	020508a3          	sb	zero,49(a0)
    8000274c:	02050923          	sb	zero,50(a0)
    80002750:	02053c23          	sd	zero,56(a0)
    80002754:	04053023          	sd	zero,64(a0)
    80002758:	04053423          	sd	zero,72(a0)
	ThreadQueue() : front(nullptr), back(nullptr) {}
    8000275c:	04053823          	sd	zero,80(a0)
    80002760:	04053c23          	sd	zero,88(a0)
		//formiranje pocetnog konteksta; specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80002764:	04098a63          	beqz	s3,800027b8 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xc4>
    80002768:	00000797          	auipc	a5,0x0
    8000276c:	e3878793          	addi	a5,a5,-456 # 800025a0 <_ZN3TCB7wrapperEv>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80002770:	04090863          	beqz	s2,800027c0 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xcc>
    80002774:	00008637          	lui	a2,0x8
    80002778:	00c90933          	add	s2,s2,a2
		this->context.ra = startRa;
    8000277c:	00f4b023          	sd	a5,0(s1)
		this->context.sp = startSp;
    80002780:	0124b423          	sd	s2,8(s1)
	if (function != nullptr) Scheduler::put(newThread);
    80002784:	00098863          	beqz	s3,80002794 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xa0>
    80002788:	00048513          	mv	a0,s1
    8000278c:	fffff097          	auipc	ra,0xfffff
    80002790:	ed4080e7          	jalr	-300(ra) # 80001660 <_ZN9Scheduler3putEP3TCB>
}
    80002794:	00048513          	mv	a0,s1
    80002798:	02813083          	ld	ra,40(sp)
    8000279c:	02013403          	ld	s0,32(sp)
    800027a0:	01813483          	ld	s1,24(sp)
    800027a4:	01013903          	ld	s2,16(sp)
    800027a8:	00813983          	ld	s3,8(sp)
    800027ac:	00013a03          	ld	s4,0(sp)
    800027b0:	03010113          	addi	sp,sp,48
    800027b4:	00008067          	ret
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    800027b8:	00000793          	li	a5,0
    800027bc:	fb5ff06f          	j	80002770 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x7c>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    800027c0:	00000913          	li	s2,0
    800027c4:	fb9ff06f          	j	8000277c <_ZN3TCB12createThreadEPFvPvES0_Pm+0x88>

00000000800027c8 <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    800027c8:	ff010113          	addi	sp,sp,-16
    800027cc:	00113423          	sd	ra,8(sp)
    800027d0:	00813023          	sd	s0,0(sp)
    800027d4:	01010413          	addi	s0,sp,16
	MemoryAllocator::kfree(ptr);
    800027d8:	00000097          	auipc	ra,0x0
    800027dc:	2bc080e7          	jalr	700(ra) # 80002a94 <_ZN15MemoryAllocator5kfreeEPv>
}
    800027e0:	00813083          	ld	ra,8(sp)
    800027e4:	00013403          	ld	s0,0(sp)
    800027e8:	01010113          	addi	sp,sp,16
    800027ec:	00008067          	ret

00000000800027f0 <_ZN3TCB10threadJoinEPS_>:

void TCB::threadJoin(TCB* handle) {
	if(handle->finished) return;
    800027f0:	03054783          	lbu	a5,48(a0)
    800027f4:	00078463          	beqz	a5,800027fc <_ZN3TCB10threadJoinEPS_+0xc>
    800027f8:	00008067          	ret
void TCB::threadJoin(TCB* handle) {
    800027fc:	ff010113          	addi	sp,sp,-16
    80002800:	00113423          	sd	ra,8(sp)
    80002804:	00813023          	sd	s0,0(sp)
    80002808:	01010413          	addi	s0,sp,16
	TCB::running->needToJoin = true;
    8000280c:	00009597          	auipc	a1,0x9
    80002810:	2045b583          	ld	a1,516(a1) # 8000ba10 <_ZN3TCB7runningE>
    80002814:	00100793          	li	a5,1
    80002818:	02f58923          	sb	a5,50(a1)
	handle->waitingToJoin.putLast(TCB::running);
    8000281c:	05050513          	addi	a0,a0,80
    80002820:	fffff097          	auipc	ra,0xfffff
    80002824:	a24080e7          	jalr	-1500(ra) # 80001244 <_ZN11ThreadQueue7putLastEP3TCB>
}
    80002828:	00813083          	ld	ra,8(sp)
    8000282c:	00013403          	ld	s0,0(sp)
    80002830:	01010113          	addi	sp,sp,16
    80002834:	00008067          	ret

0000000080002838 <_ZN3TCB13releaseJoinedEv>:

void TCB::releaseJoined() {
	while(!TCB::running->waitingToJoin.isEmpty()){
    80002838:	00009517          	auipc	a0,0x9
    8000283c:	1d853503          	ld	a0,472(a0) # 8000ba10 <_ZN3TCB7runningE>
		return front == nullptr;
    80002840:	05053783          	ld	a5,80(a0)
    80002844:	04078663          	beqz	a5,80002890 <_ZN3TCB13releaseJoinedEv+0x58>
void TCB::releaseJoined() {
    80002848:	ff010113          	addi	sp,sp,-16
    8000284c:	00113423          	sd	ra,8(sp)
    80002850:	00813023          	sd	s0,0(sp)
    80002854:	01010413          	addi	s0,sp,16
		TCB* tcb = TCB::running->waitingToJoin.getFirst();
    80002858:	05050513          	addi	a0,a0,80
    8000285c:	fffff097          	auipc	ra,0xfffff
    80002860:	a54080e7          	jalr	-1452(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
		tcb->needToJoin = false;
    80002864:	02050923          	sb	zero,50(a0)
		Scheduler::put(tcb);
    80002868:	fffff097          	auipc	ra,0xfffff
    8000286c:	df8080e7          	jalr	-520(ra) # 80001660 <_ZN9Scheduler3putEP3TCB>
	while(!TCB::running->waitingToJoin.isEmpty()){
    80002870:	00009517          	auipc	a0,0x9
    80002874:	1a053503          	ld	a0,416(a0) # 8000ba10 <_ZN3TCB7runningE>
    80002878:	05053783          	ld	a5,80(a0)
    8000287c:	fc079ee3          	bnez	a5,80002858 <_ZN3TCB13releaseJoinedEv+0x20>
	}
}
    80002880:	00813083          	ld	ra,8(sp)
    80002884:	00013403          	ld	s0,0(sp)
    80002888:	01010113          	addi	sp,sp,16
    8000288c:	00008067          	ret
    80002890:	00008067          	ret

0000000080002894 <_ZN3TCB5startEPS_>:

void TCB::start(TCB* newTcb) {
	//startovanje niti(stavljanje u Scheduler); main nit je vec aktivna, ne stavlja se u Scheduler
	if (newTcb->threadFunction != nullptr) Scheduler::put(newTcb);
    80002894:	01053783          	ld	a5,16(a0)
    80002898:	02078663          	beqz	a5,800028c4 <_ZN3TCB5startEPS_+0x30>
void TCB::start(TCB* newTcb) {
    8000289c:	ff010113          	addi	sp,sp,-16
    800028a0:	00113423          	sd	ra,8(sp)
    800028a4:	00813023          	sd	s0,0(sp)
    800028a8:	01010413          	addi	s0,sp,16
	if (newTcb->threadFunction != nullptr) Scheduler::put(newTcb);
    800028ac:	fffff097          	auipc	ra,0xfffff
    800028b0:	db4080e7          	jalr	-588(ra) # 80001660 <_ZN9Scheduler3putEP3TCB>
}
    800028b4:	00813083          	ld	ra,8(sp)
    800028b8:	00013403          	ld	s0,0(sp)
    800028bc:	01010113          	addi	sp,sp,16
    800028c0:	00008067          	ret
    800028c4:	00008067          	ret

00000000800028c8 <_ZN5Riscv10popSppSpieEv>:
// Created by os on 5/17/23.
//

#include "../h/Riscv.hpp"

void Riscv::popSppSpie() {
    800028c8:	ff010113          	addi	sp,sp,-16
    800028cc:	00813423          	sd	s0,8(sp)
    800028d0:	01010413          	addi	s0,sp,16
	//ra pokazuje iza ove funkcije na nastavak wrappera
	__asm__ volatile("csrw sepc, ra");
    800028d4:	14109073          	csrw	sepc,ra
	__asm__ volatile("sret");
    800028d8:	10200073          	sret
    800028dc:	00813403          	ld	s0,8(sp)
    800028e0:	01010113          	addi	sp,sp,16
    800028e4:	00008067          	ret

00000000800028e8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>:

bool MemoryAllocator::initialized = false;
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

void* MemoryAllocator::kmalloc(size_t size, Purpose pur) {
    800028e8:	ff010113          	addi	sp,sp,-16
    800028ec:	00813423          	sd	s0,8(sp)
    800028f0:	01010413          	addi	s0,sp,16
	if (size <= 0) return nullptr;
    800028f4:	12050863          	beqz	a0,80002a24 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x13c>

	//pocetna inicijalizacija
	if (!initialized) {
    800028f8:	00009797          	auipc	a5,0x9
    800028fc:	1287c783          	lbu	a5,296(a5) # 8000ba20 <_ZN15MemoryAllocator11initializedE>
    80002900:	04079863          	bnez	a5,80002950 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x68>
		freeMemHead = (FreeMemSegment*)HEAP_START_ADDR;
    80002904:	00009617          	auipc	a2,0x9
    80002908:	08463603          	ld	a2,132(a2) # 8000b988 <_GLOBAL_OFFSET_TABLE_+0x20>
    8000290c:	00063783          	ld	a5,0(a2)
    80002910:	00009717          	auipc	a4,0x9
    80002914:	11070713          	addi	a4,a4,272 # 8000ba20 <_ZN15MemoryAllocator11initializedE>
    80002918:	00f73423          	sd	a5,8(a4)
		freeMemHead->next = nullptr;
    8000291c:	0007b023          	sd	zero,0(a5)
		freeMemHead->prev = nullptr;
    80002920:	00873683          	ld	a3,8(a4)
    80002924:	0006b423          	sd	zero,8(a3)
		freeMemHead->size = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR - sizeof(FreeMemSegment);
    80002928:	00009797          	auipc	a5,0x9
    8000292c:	0787b783          	ld	a5,120(a5) # 8000b9a0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80002930:	0007b783          	ld	a5,0(a5)
    80002934:	00063603          	ld	a2,0(a2)
    80002938:	40c787b3          	sub	a5,a5,a2
    8000293c:	fe878793          	addi	a5,a5,-24
    80002940:	00f6b823          	sd	a5,16(a3)
		usedMemHead = nullptr;
    80002944:	00073823          	sd	zero,16(a4)

		initialized = true;
    80002948:	00100793          	li	a5,1
    8000294c:	00f70023          	sb	a5,0(a4)
	}

	//alokacija uvek zaokruzena na blokove
	//size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
	size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80002950:	00655793          	srli	a5,a0,0x6
    80002954:	03f57513          	andi	a0,a0,63
    80002958:	00050463          	beqz	a0,80002960 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x78>
    8000295c:	00100513          	li	a0,1
    80002960:	00a78533          	add	a0,a5,a0
	size = blocks * MEM_BLOCK_SIZE;
    80002964:	00651793          	slli	a5,a0,0x6

	//trazenje slobodnog segmenta po first-fit algoritmu
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80002968:	00009517          	auipc	a0,0x9
    8000296c:	0c053503          	ld	a0,192(a0) # 8000ba28 <_ZN15MemoryAllocator11freeMemHeadE>
    80002970:	08050c63          	beqz	a0,80002a08 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x120>
		if (current->size < size) continue;
    80002974:	01053703          	ld	a4,16(a0)
    80002978:	06f76463          	bltu	a4,a5,800029e0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xf8>

		//pravljenje novog slobodnog fragmenta od ostatka fragmenta
		FreeMemSegment* remainderFree = (FreeMemSegment*)((char*)current + size);
    8000297c:	00f506b3          	add	a3,a0,a5
		remainderFree->size = current->size - size;
    80002980:	40f70733          	sub	a4,a4,a5
    80002984:	00e6b823          	sd	a4,16(a3)
		remainderFree->prev = current->prev;
    80002988:	00853703          	ld	a4,8(a0)
    8000298c:	00e6b423          	sd	a4,8(a3)
		if (current->prev) current->prev->next = remainderFree;
    80002990:	00070463          	beqz	a4,80002998 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xb0>
    80002994:	00d73023          	sd	a3,0(a4)
		remainderFree->next = current->next;
    80002998:	00053703          	ld	a4,0(a0)
    8000299c:	00e6b023          	sd	a4,0(a3)
		if (current->next) current->next->prev = remainderFree;
    800029a0:	00070463          	beqz	a4,800029a8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xc0>
    800029a4:	00d73423          	sd	a3,8(a4)
		if (freeMemHead == current) freeMemHead = remainderFree;
    800029a8:	00009717          	auipc	a4,0x9
    800029ac:	08073703          	ld	a4,128(a4) # 8000ba28 <_ZN15MemoryAllocator11freeMemHeadE>
    800029b0:	02a70c63          	beq	a4,a0,800029e8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x100>

		//ubacivanje novog fragmenta u listu zauzetih fragmenata
		UsedMemSegment* newFragment = (UsedMemSegment*)current;
		newFragment->size = size;
    800029b4:	00f53423          	sd	a5,8(a0)
		newFragment->purpose = pur;
    800029b8:	00b52823          	sw	a1,16(a0)
		UsedMemSegment* prevUsed = nullptr;
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    800029bc:	00009697          	auipc	a3,0x9
    800029c0:	0746b683          	ld	a3,116(a3) # 8000ba30 <_ZN15MemoryAllocator11usedMemHeadE>
    800029c4:	00068793          	mv	a5,a3
		UsedMemSegment* prevUsed = nullptr;
    800029c8:	00000713          	li	a4,0
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    800029cc:	02078463          	beqz	a5,800029f4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x10c>
    800029d0:	02a7f263          	bgeu	a5,a0,800029f4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x10c>
    800029d4:	00078713          	mv	a4,a5
    800029d8:	0007b783          	ld	a5,0(a5)
    800029dc:	ff1ff06f          	j	800029cc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xe4>
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    800029e0:	00053503          	ld	a0,0(a0)
    800029e4:	f8dff06f          	j	80002970 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x88>
		if (freeMemHead == current) freeMemHead = remainderFree;
    800029e8:	00009717          	auipc	a4,0x9
    800029ec:	04d73023          	sd	a3,64(a4) # 8000ba28 <_ZN15MemoryAllocator11freeMemHeadE>
    800029f0:	fc5ff06f          	j	800029b4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xcc>
		if (!prevUsed) {
    800029f4:	02070063          	beqz	a4,80002a14 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x12c>
			newFragment->next = usedMemHead;
			usedMemHead = newFragment;
		} else {
			newFragment->next = prevUsed->next;
    800029f8:	00073783          	ld	a5,0(a4)
    800029fc:	00f53023          	sd	a5,0(a0)
			prevUsed->next = newFragment;
    80002a00:	00a73023          	sd	a0,0(a4)
		}
		return (char*)newFragment + sizeof(UsedMemSegment);
    80002a04:	01850513          	addi	a0,a0,24
	}
	return nullptr;
}
    80002a08:	00813403          	ld	s0,8(sp)
    80002a0c:	01010113          	addi	sp,sp,16
    80002a10:	00008067          	ret
			newFragment->next = usedMemHead;
    80002a14:	00d53023          	sd	a3,0(a0)
			usedMemHead = newFragment;
    80002a18:	00009797          	auipc	a5,0x9
    80002a1c:	00a7bc23          	sd	a0,24(a5) # 8000ba30 <_ZN15MemoryAllocator11usedMemHeadE>
    80002a20:	fe5ff06f          	j	80002a04 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x11c>
	if (size <= 0) return nullptr;
    80002a24:	00000513          	li	a0,0
    80002a28:	fe1ff06f          	j	80002a08 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x120>

0000000080002a2c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:
	tryToJoin(newFree);
	tryToJoin(prevFree);
	return 0;
}

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    80002a2c:	ff010113          	addi	sp,sp,-16
    80002a30:	00813423          	sd	s0,8(sp)
    80002a34:	01010413          	addi	s0,sp,16
	if (!current) return 0;
    80002a38:	04050663          	beqz	a0,80002a84 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x58>
	bool nextExists = current->next != nullptr;
    80002a3c:	00053783          	ld	a5,0(a0)
	char* nextAddr = (char*)current + current->size;
    80002a40:	01053703          	ld	a4,16(a0)
    80002a44:	00e506b3          	add	a3,a0,a4
	char* cnext = (char*)current->next;
	bool nextIsConnected = (nextAddr == cnext);
	if (nextExists && nextIsConnected) {
    80002a48:	04078263          	beqz	a5,80002a8c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x60>
    80002a4c:	00d78a63          	beq	a5,a3,80002a60 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x34>
		current->size += current->next->size;
		current->next = current->next->next;
		if (current->next) current->next->prev = current;
		return 1;
	} else return 0;
    80002a50:	00000513          	li	a0,0
}
    80002a54:	00813403          	ld	s0,8(sp)
    80002a58:	01010113          	addi	sp,sp,16
    80002a5c:	00008067          	ret
		current->size += current->next->size;
    80002a60:	0107b683          	ld	a3,16(a5)
    80002a64:	00d70733          	add	a4,a4,a3
    80002a68:	00e53823          	sd	a4,16(a0)
		current->next = current->next->next;
    80002a6c:	0007b783          	ld	a5,0(a5)
    80002a70:	00f53023          	sd	a5,0(a0)
		if (current->next) current->next->prev = current;
    80002a74:	00078463          	beqz	a5,80002a7c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x50>
    80002a78:	00a7b423          	sd	a0,8(a5)
		return 1;
    80002a7c:	00100513          	li	a0,1
    80002a80:	fd5ff06f          	j	80002a54 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	if (!current) return 0;
    80002a84:	00000513          	li	a0,0
    80002a88:	fcdff06f          	j	80002a54 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	} else return 0;
    80002a8c:	00000513          	li	a0,0
    80002a90:	fc5ff06f          	j	80002a54 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>

0000000080002a94 <_ZN15MemoryAllocator5kfreeEPv>:
	if (!ptr) return 0;
    80002a94:	10050463          	beqz	a0,80002b9c <_ZN15MemoryAllocator5kfreeEPv+0x108>
    80002a98:	00050693          	mv	a3,a0
	if (!usedMemHead) return -1;
    80002a9c:	00009797          	auipc	a5,0x9
    80002aa0:	f947b783          	ld	a5,-108(a5) # 8000ba30 <_ZN15MemoryAllocator11usedMemHeadE>
    80002aa4:	10078063          	beqz	a5,80002ba4 <_ZN15MemoryAllocator5kfreeEPv+0x110>
	ptr = (char*)ptr - sizeof(UsedMemSegment);
    80002aa8:	fe850513          	addi	a0,a0,-24
	UsedMemSegment* prevUsed = nullptr;
    80002aac:	00000713          	li	a4,0
	for (; currentUsed && currentUsed != ptr; prevUsed = currentUsed, currentUsed = currentUsed->next);
    80002ab0:	00078a63          	beqz	a5,80002ac4 <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80002ab4:	00a78863          	beq	a5,a0,80002ac4 <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80002ab8:	00078713          	mv	a4,a5
    80002abc:	0007b783          	ld	a5,0(a5)
    80002ac0:	ff1ff06f          	j	80002ab0 <_ZN15MemoryAllocator5kfreeEPv+0x1c>
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80002ac4:	0ea79463          	bne	a5,a0,80002bac <_ZN15MemoryAllocator5kfreeEPv+0x118>
int MemoryAllocator::kfree(void* ptr) {
    80002ac8:	fe010113          	addi	sp,sp,-32
    80002acc:	00113c23          	sd	ra,24(sp)
    80002ad0:	00813823          	sd	s0,16(sp)
    80002ad4:	00913423          	sd	s1,8(sp)
    80002ad8:	02010413          	addi	s0,sp,32
	if (prevUsed) prevUsed->next = currentUsed->next;
    80002adc:	02070863          	beqz	a4,80002b0c <_ZN15MemoryAllocator5kfreeEPv+0x78>
    80002ae0:	0007b783          	ld	a5,0(a5)
    80002ae4:	00f73023          	sd	a5,0(a4)
	if (!freeMemHead || ptr < (char*)freeMemHead) {
    80002ae8:	00009797          	auipc	a5,0x9
    80002aec:	f407b783          	ld	a5,-192(a5) # 8000ba28 <_ZN15MemoryAllocator11freeMemHeadE>
    80002af0:	02078663          	beqz	a5,80002b1c <_ZN15MemoryAllocator5kfreeEPv+0x88>
    80002af4:	02f56863          	bltu	a0,a5,80002b24 <_ZN15MemoryAllocator5kfreeEPv+0x90>
			 prevFree->next != nullptr && ptr > (char*)(prevFree->next); prevFree = prevFree->next);
    80002af8:	00078493          	mv	s1,a5
    80002afc:	0007b783          	ld	a5,0(a5)
    80002b00:	02078463          	beqz	a5,80002b28 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80002b04:	fea7eae3          	bltu	a5,a0,80002af8 <_ZN15MemoryAllocator5kfreeEPv+0x64>
    80002b08:	0200006f          	j	80002b28 <_ZN15MemoryAllocator5kfreeEPv+0x94>
	else usedMemHead = currentUsed->next;
    80002b0c:	0007b783          	ld	a5,0(a5)
    80002b10:	00009717          	auipc	a4,0x9
    80002b14:	f2f73023          	sd	a5,-224(a4) # 8000ba30 <_ZN15MemoryAllocator11usedMemHeadE>
    80002b18:	fd1ff06f          	j	80002ae8 <_ZN15MemoryAllocator5kfreeEPv+0x54>
		prevFree = nullptr;
    80002b1c:	00078493          	mv	s1,a5
    80002b20:	0080006f          	j	80002b28 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80002b24:	00000493          	li	s1,0
	size_t segmentSize = ((UsedMemSegment*)ptr)->size;
    80002b28:	ff06b783          	ld	a5,-16(a3)
	newFree->size = segmentSize;
    80002b2c:	fef6bc23          	sd	a5,-8(a3)
	newFree->prev = prevFree;
    80002b30:	fe96b823          	sd	s1,-16(a3)
	if (prevFree) newFree->next = prevFree->next;
    80002b34:	04048663          	beqz	s1,80002b80 <_ZN15MemoryAllocator5kfreeEPv+0xec>
    80002b38:	0004b783          	ld	a5,0(s1)
    80002b3c:	fef6b423          	sd	a5,-24(a3)
	if (newFree->next) newFree->next->prev = newFree;
    80002b40:	fe86b783          	ld	a5,-24(a3)
    80002b44:	00078463          	beqz	a5,80002b4c <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    80002b48:	00a7b423          	sd	a0,8(a5)
	if (prevFree) prevFree->next = newFree;
    80002b4c:	04048263          	beqz	s1,80002b90 <_ZN15MemoryAllocator5kfreeEPv+0xfc>
    80002b50:	00a4b023          	sd	a0,0(s1)
	tryToJoin(newFree);
    80002b54:	00000097          	auipc	ra,0x0
    80002b58:	ed8080e7          	jalr	-296(ra) # 80002a2c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	tryToJoin(prevFree);
    80002b5c:	00048513          	mv	a0,s1
    80002b60:	00000097          	auipc	ra,0x0
    80002b64:	ecc080e7          	jalr	-308(ra) # 80002a2c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	return 0;
    80002b68:	00000513          	li	a0,0
}
    80002b6c:	01813083          	ld	ra,24(sp)
    80002b70:	01013403          	ld	s0,16(sp)
    80002b74:	00813483          	ld	s1,8(sp)
    80002b78:	02010113          	addi	sp,sp,32
    80002b7c:	00008067          	ret
	else newFree->next = freeMemHead;
    80002b80:	00009797          	auipc	a5,0x9
    80002b84:	ea87b783          	ld	a5,-344(a5) # 8000ba28 <_ZN15MemoryAllocator11freeMemHeadE>
    80002b88:	fef6b423          	sd	a5,-24(a3)
    80002b8c:	fb5ff06f          	j	80002b40 <_ZN15MemoryAllocator5kfreeEPv+0xac>
	else freeMemHead = newFree;
    80002b90:	00009797          	auipc	a5,0x9
    80002b94:	e8a7bc23          	sd	a0,-360(a5) # 8000ba28 <_ZN15MemoryAllocator11freeMemHeadE>
    80002b98:	fbdff06f          	j	80002b54 <_ZN15MemoryAllocator5kfreeEPv+0xc0>
	if (!ptr) return 0;
    80002b9c:	00000513          	li	a0,0
    80002ba0:	00008067          	ret
	if (!usedMemHead) return -1;
    80002ba4:	fff00513          	li	a0,-1
    80002ba8:	00008067          	ret
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80002bac:	fff00513          	li	a0,-1
}
    80002bb0:	00008067          	ret

0000000080002bb4 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>:

bool MemoryAllocator::checkPurpose(void* ptr, MemoryAllocator::Purpose p) {
    80002bb4:	ff010113          	addi	sp,sp,-16
    80002bb8:	00813423          	sd	s0,8(sp)
    80002bbc:	01010413          	addi	s0,sp,16
	ptr = (char*)ptr - sizeof(UsedMemSegment);
	return ((UsedMemSegment*)ptr)->purpose == p;
    80002bc0:	ff852503          	lw	a0,-8(a0)
    80002bc4:	40b50533          	sub	a0,a0,a1
}
    80002bc8:	00153513          	seqz	a0,a0
    80002bcc:	00813403          	ld	s0,8(sp)
    80002bd0:	01010113          	addi	sp,sp,16
    80002bd4:	00008067          	ret

0000000080002bd8 <_ZN4KSemnwEm>:

#include "../h/KSem.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void* KSem::operator new(size_t size) {
    80002bd8:	ff010113          	addi	sp,sp,-16
    80002bdc:	00113423          	sd	ra,8(sp)
    80002be0:	00813023          	sd	s0,0(sp)
    80002be4:	01010413          	addi	s0,sp,16
	return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::SEMAPHORE);
    80002be8:	00100593          	li	a1,1
    80002bec:	01850513          	addi	a0,a0,24
    80002bf0:	00000097          	auipc	ra,0x0
    80002bf4:	cf8080e7          	jalr	-776(ra) # 800028e8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
}
    80002bf8:	00813083          	ld	ra,8(sp)
    80002bfc:	00013403          	ld	s0,0(sp)
    80002c00:	01010113          	addi	sp,sp,16
    80002c04:	00008067          	ret

0000000080002c08 <_ZN4KSemdlEPv>:

void KSem::operator delete(void* ptr) {
    80002c08:	ff010113          	addi	sp,sp,-16
    80002c0c:	00113423          	sd	ra,8(sp)
    80002c10:	00813023          	sd	s0,0(sp)
    80002c14:	01010413          	addi	s0,sp,16
	MemoryAllocator::kfree(ptr);
    80002c18:	00000097          	auipc	ra,0x0
    80002c1c:	e7c080e7          	jalr	-388(ra) # 80002a94 <_ZN15MemoryAllocator5kfreeEPv>
}
    80002c20:	00813083          	ld	ra,8(sp)
    80002c24:	00013403          	ld	s0,0(sp)
    80002c28:	01010113          	addi	sp,sp,16
    80002c2c:	00008067          	ret

0000000080002c30 <_ZN4KSem7initSemEj>:

KSem* KSem::initSem(uint val) {
    80002c30:	fe010113          	addi	sp,sp,-32
    80002c34:	00113c23          	sd	ra,24(sp)
    80002c38:	00813823          	sd	s0,16(sp)
    80002c3c:	00913423          	sd	s1,8(sp)
    80002c40:	02010413          	addi	s0,sp,32
    80002c44:	00050493          	mv	s1,a0
	return new KSem(val);
    80002c48:	02000513          	li	a0,32
    80002c4c:	00000097          	auipc	ra,0x0
    80002c50:	f8c080e7          	jalr	-116(ra) # 80002bd8 <_ZN4KSemnwEm>
	void block();

	void unblock();

private:
	KSem(uint val) : val(val), working(true) {}
    80002c54:	00952023          	sw	s1,0(a0)
	ThreadQueue() : front(nullptr), back(nullptr) {}
    80002c58:	00053423          	sd	zero,8(a0)
    80002c5c:	00053823          	sd	zero,16(a0)
    80002c60:	00100713          	li	a4,1
    80002c64:	00e50c23          	sb	a4,24(a0)
}
    80002c68:	01813083          	ld	ra,24(sp)
    80002c6c:	01013403          	ld	s0,16(sp)
    80002c70:	00813483          	ld	s1,8(sp)
    80002c74:	02010113          	addi	sp,sp,32
    80002c78:	00008067          	ret

0000000080002c7c <_ZN4KSem5blockEv>:
	if (!working) return -3;
	if (val++ < 0) unblock();
	return 0;
}

void KSem::block() {
    80002c7c:	ff010113          	addi	sp,sp,-16
    80002c80:	00113423          	sd	ra,8(sp)
    80002c84:	00813023          	sd	s0,0(sp)
    80002c88:	01010413          	addi	s0,sp,16
	TCB::running->setBlocked(true);
    80002c8c:	00009797          	auipc	a5,0x9
    80002c90:	d0c7b783          	ld	a5,-756(a5) # 8000b998 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002c94:	0007b583          	ld	a1,0(a5)
	void setBlocked(bool block) { this->blocked = block; }
    80002c98:	00100793          	li	a5,1
    80002c9c:	02f588a3          	sb	a5,49(a1)
	blocked.putLast(TCB::running);
    80002ca0:	00850513          	addi	a0,a0,8
    80002ca4:	ffffe097          	auipc	ra,0xffffe
    80002ca8:	5a0080e7          	jalr	1440(ra) # 80001244 <_ZN11ThreadQueue7putLastEP3TCB>
	TCB::yield();
    80002cac:	00000097          	auipc	ra,0x0
    80002cb0:	9e0080e7          	jalr	-1568(ra) # 8000268c <_ZN3TCB5yieldEv>
}
    80002cb4:	00813083          	ld	ra,8(sp)
    80002cb8:	00013403          	ld	s0,0(sp)
    80002cbc:	01010113          	addi	sp,sp,16
    80002cc0:	00008067          	ret

0000000080002cc4 <_ZN4KSem4waitEv>:
int KSem::wait() {
    80002cc4:	fe010113          	addi	sp,sp,-32
    80002cc8:	00113c23          	sd	ra,24(sp)
    80002ccc:	00813823          	sd	s0,16(sp)
    80002cd0:	00913423          	sd	s1,8(sp)
    80002cd4:	02010413          	addi	s0,sp,32
    80002cd8:	00050493          	mv	s1,a0
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    80002cdc:	00100593          	li	a1,1
    80002ce0:	00000097          	auipc	ra,0x0
    80002ce4:	ed4080e7          	jalr	-300(ra) # 80002bb4 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>
    80002ce8:	04050663          	beqz	a0,80002d34 <_ZN4KSem4waitEv+0x70>
	if (!working) return -3;
    80002cec:	0184c783          	lbu	a5,24(s1)
    80002cf0:	04078663          	beqz	a5,80002d3c <_ZN4KSem4waitEv+0x78>
	if (--val < 0) {
    80002cf4:	0004a783          	lw	a5,0(s1)
    80002cf8:	fff7879b          	addiw	a5,a5,-1
    80002cfc:	00f4a023          	sw	a5,0(s1)
    80002d00:	02079713          	slli	a4,a5,0x20
    80002d04:	00074e63          	bltz	a4,80002d20 <_ZN4KSem4waitEv+0x5c>
	return 0;
    80002d08:	00000513          	li	a0,0
}
    80002d0c:	01813083          	ld	ra,24(sp)
    80002d10:	01013403          	ld	s0,16(sp)
    80002d14:	00813483          	ld	s1,8(sp)
    80002d18:	02010113          	addi	sp,sp,32
    80002d1c:	00008067          	ret
		block();
    80002d20:	00048513          	mv	a0,s1
    80002d24:	00000097          	auipc	ra,0x0
    80002d28:	f58080e7          	jalr	-168(ra) # 80002c7c <_ZN4KSem5blockEv>
		return -1;
    80002d2c:	fff00513          	li	a0,-1
    80002d30:	fddff06f          	j	80002d0c <_ZN4KSem4waitEv+0x48>
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    80002d34:	ffe00513          	li	a0,-2
    80002d38:	fd5ff06f          	j	80002d0c <_ZN4KSem4waitEv+0x48>
	if (!working) return -3;
    80002d3c:	ffd00513          	li	a0,-3
    80002d40:	fcdff06f          	j	80002d0c <_ZN4KSem4waitEv+0x48>

0000000080002d44 <_ZN4KSem7unblockEv>:

void KSem::unblock() {
    80002d44:	ff010113          	addi	sp,sp,-16
    80002d48:	00113423          	sd	ra,8(sp)
    80002d4c:	00813023          	sd	s0,0(sp)
    80002d50:	01010413          	addi	s0,sp,16
	TCB* tcb = blocked.getFirst();
    80002d54:	00850513          	addi	a0,a0,8
    80002d58:	ffffe097          	auipc	ra,0xffffe
    80002d5c:	558080e7          	jalr	1368(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
    80002d60:	020508a3          	sb	zero,49(a0)
	tcb->setBlocked(false);
	Scheduler::put(tcb);
    80002d64:	fffff097          	auipc	ra,0xfffff
    80002d68:	8fc080e7          	jalr	-1796(ra) # 80001660 <_ZN9Scheduler3putEP3TCB>
}
    80002d6c:	00813083          	ld	ra,8(sp)
    80002d70:	00013403          	ld	s0,0(sp)
    80002d74:	01010113          	addi	sp,sp,16
    80002d78:	00008067          	ret

0000000080002d7c <_ZN4KSem6signalEv>:
int KSem::signal() {
    80002d7c:	fe010113          	addi	sp,sp,-32
    80002d80:	00113c23          	sd	ra,24(sp)
    80002d84:	00813823          	sd	s0,16(sp)
    80002d88:	00913423          	sd	s1,8(sp)
    80002d8c:	02010413          	addi	s0,sp,32
    80002d90:	00050493          	mv	s1,a0
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    80002d94:	00100593          	li	a1,1
    80002d98:	00000097          	auipc	ra,0x0
    80002d9c:	e1c080e7          	jalr	-484(ra) # 80002bb4 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>
    80002da0:	04050463          	beqz	a0,80002de8 <_ZN4KSem6signalEv+0x6c>
	if (!working) return -3;
    80002da4:	0184c783          	lbu	a5,24(s1)
    80002da8:	04078463          	beqz	a5,80002df0 <_ZN4KSem6signalEv+0x74>
	if (val++ < 0) unblock();
    80002dac:	0004a783          	lw	a5,0(s1)
    80002db0:	0017871b          	addiw	a4,a5,1
    80002db4:	00e4a023          	sw	a4,0(s1)
    80002db8:	0007ce63          	bltz	a5,80002dd4 <_ZN4KSem6signalEv+0x58>
	return 0;
    80002dbc:	00000513          	li	a0,0
}
    80002dc0:	01813083          	ld	ra,24(sp)
    80002dc4:	01013403          	ld	s0,16(sp)
    80002dc8:	00813483          	ld	s1,8(sp)
    80002dcc:	02010113          	addi	sp,sp,32
    80002dd0:	00008067          	ret
	if (val++ < 0) unblock();
    80002dd4:	00048513          	mv	a0,s1
    80002dd8:	00000097          	auipc	ra,0x0
    80002ddc:	f6c080e7          	jalr	-148(ra) # 80002d44 <_ZN4KSem7unblockEv>
	return 0;
    80002de0:	00000513          	li	a0,0
    80002de4:	fddff06f          	j	80002dc0 <_ZN4KSem6signalEv+0x44>
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    80002de8:	ffe00513          	li	a0,-2
    80002dec:	fd5ff06f          	j	80002dc0 <_ZN4KSem6signalEv+0x44>
	if (!working) return -3;
    80002df0:	ffd00513          	li	a0,-3
    80002df4:	fcdff06f          	j	80002dc0 <_ZN4KSem6signalEv+0x44>

0000000080002df8 <_ZN4KSem8closeSemEPS_>:

int KSem::closeSem(sem_t handle) {
    80002df8:	fe010113          	addi	sp,sp,-32
    80002dfc:	00113c23          	sd	ra,24(sp)
    80002e00:	00813823          	sd	s0,16(sp)
    80002e04:	00913423          	sd	s1,8(sp)
    80002e08:	02010413          	addi	s0,sp,32
    80002e0c:	00050493          	mv	s1,a0
	if (!MemoryAllocator::checkPurpose(handle, MemoryAllocator::SEMAPHORE)) return -2;
    80002e10:	00100593          	li	a1,1
    80002e14:	00000097          	auipc	ra,0x0
    80002e18:	da0080e7          	jalr	-608(ra) # 80002bb4 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>
    80002e1c:	04050263          	beqz	a0,80002e60 <_ZN4KSem8closeSemEPS_+0x68>
	handle->working = false;
    80002e20:	00048c23          	sb	zero,24(s1)
    80002e24:	01c0006f          	j	80002e40 <_ZN4KSem8closeSemEPS_+0x48>
	while (!handle->blocked.isEmpty()) {
		TCB* tcb = handle->blocked.getFirst();
    80002e28:	00848513          	addi	a0,s1,8
    80002e2c:	ffffe097          	auipc	ra,0xffffe
    80002e30:	484080e7          	jalr	1156(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
    80002e34:	020508a3          	sb	zero,49(a0)
		tcb->setBlocked(false);
		Scheduler::put(tcb);
    80002e38:	fffff097          	auipc	ra,0xfffff
    80002e3c:	828080e7          	jalr	-2008(ra) # 80001660 <_ZN9Scheduler3putEP3TCB>
		return front == nullptr;
    80002e40:	0084b783          	ld	a5,8(s1)
	while (!handle->blocked.isEmpty()) {
    80002e44:	fe0792e3          	bnez	a5,80002e28 <_ZN4KSem8closeSemEPS_+0x30>
	}
	return 0;
    80002e48:	00000513          	li	a0,0
}
    80002e4c:	01813083          	ld	ra,24(sp)
    80002e50:	01013403          	ld	s0,16(sp)
    80002e54:	00813483          	ld	s1,8(sp)
    80002e58:	02010113          	addi	sp,sp,32
    80002e5c:	00008067          	ret
	if (!MemoryAllocator::checkPurpose(handle, MemoryAllocator::SEMAPHORE)) return -2;
    80002e60:	ffe00513          	li	a0,-2
    80002e64:	fe9ff06f          	j	80002e4c <_ZN4KSem8closeSemEPS_+0x54>

0000000080002e68 <_Z12printIntegeri>:
#include "../h/TCB.hpp"
#include "../h/ThreadQueue.hpp"
//#include "../h/KSem.hpp"

#include "../test/printing.hpp"
void printInteger(int i){
    80002e68:	ff010113          	addi	sp,sp,-16
    80002e6c:	00113423          	sd	ra,8(sp)
    80002e70:	00813023          	sd	s0,0(sp)
    80002e74:	01010413          	addi	s0,sp,16
	printInt(i);
    80002e78:	00000613          	li	a2,0
    80002e7c:	00a00593          	li	a1,10
    80002e80:	00003097          	auipc	ra,0x3
    80002e84:	8f0080e7          	jalr	-1808(ra) # 80005770 <_Z8printIntiii>
}
    80002e88:	00813083          	ld	ra,8(sp)
    80002e8c:	00013403          	ld	s0,0(sp)
    80002e90:	01010113          	addi	sp,sp,16
    80002e94:	00008067          	ret

0000000080002e98 <_Z10testMemoryv>:
extern Semaphore* semA;

void testMemory() {
    80002e98:	81010113          	addi	sp,sp,-2032
    80002e9c:	7e113423          	sd	ra,2024(sp)
    80002ea0:	7e813023          	sd	s0,2016(sp)
    80002ea4:	7c913c23          	sd	s1,2008(sp)
    80002ea8:	7f010413          	addi	s0,sp,2032
    80002eac:	83010113          	addi	sp,sp,-2000
	const uint64 NumAllocations = 500;    //zasto nece za preko 500????
	const uint64 AllocationSize = 16;

	// Allocate and initialize pointers
	int* allocations[NumAllocations];
	for (uint64 i = 0; i < NumAllocations; ++i)
    80002eb0:	00000713          	li	a4,0
    80002eb4:	1f300793          	li	a5,499
    80002eb8:	02e7e263          	bltu	a5,a4,80002edc <_Z10testMemoryv+0x44>
		allocations[i] = nullptr;
    80002ebc:	fffff7b7          	lui	a5,0xfffff
    80002ec0:	00371693          	slli	a3,a4,0x3
    80002ec4:	fe040613          	addi	a2,s0,-32
    80002ec8:	00f607b3          	add	a5,a2,a5
    80002ecc:	00d787b3          	add	a5,a5,a3
    80002ed0:	0607b023          	sd	zero,96(a5) # fffffffffffff060 <end+0xffffffff7fff2370>
	for (uint64 i = 0; i < NumAllocations; ++i)
    80002ed4:	00170713          	addi	a4,a4,1
    80002ed8:	fddff06f          	j	80002eb4 <_Z10testMemoryv+0x1c>

	// Allocate memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80002edc:	00000493          	li	s1,0
    80002ee0:	1f300793          	li	a5,499
    80002ee4:	0297ec63          	bltu	a5,s1,80002f1c <_Z10testMemoryv+0x84>
		allocations[i] = static_cast<int*>(MemoryAllocator::kmalloc(AllocationSize, MemoryAllocator::MISC));
    80002ee8:	00300593          	li	a1,3
    80002eec:	01000513          	li	a0,16
    80002ef0:	00000097          	auipc	ra,0x0
    80002ef4:	9f8080e7          	jalr	-1544(ra) # 800028e8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
    80002ef8:	fffff737          	lui	a4,0xfffff
    80002efc:	00349793          	slli	a5,s1,0x3
    80002f00:	fe040693          	addi	a3,s0,-32
    80002f04:	00e68733          	add	a4,a3,a4
    80002f08:	00f707b3          	add	a5,a4,a5
    80002f0c:	06a7b023          	sd	a0,96(a5)
		if (allocations[i] == nullptr) {
    80002f10:	00050663          	beqz	a0,80002f1c <_Z10testMemoryv+0x84>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80002f14:	00148493          	addi	s1,s1,1
    80002f18:	fc9ff06f          	j	80002ee0 <_Z10testMemoryv+0x48>
    80002f1c:	00000493          	li	s1,0
    80002f20:	0100006f          	j	80002f30 <_Z10testMemoryv+0x98>
	}

	// Free memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
		if (allocations[i] != nullptr) {
			if (MemoryAllocator::kfree(allocations[i]) != 0) {
    80002f24:	00000097          	auipc	ra,0x0
    80002f28:	b70080e7          	jalr	-1168(ra) # 80002a94 <_ZN15MemoryAllocator5kfreeEPv>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80002f2c:	00148493          	addi	s1,s1,1
    80002f30:	1f300793          	li	a5,499
    80002f34:	0297e263          	bltu	a5,s1,80002f58 <_Z10testMemoryv+0xc0>
		if (allocations[i] != nullptr) {
    80002f38:	fffff737          	lui	a4,0xfffff
    80002f3c:	00349793          	slli	a5,s1,0x3
    80002f40:	fe040693          	addi	a3,s0,-32
    80002f44:	00e68733          	add	a4,a3,a4
    80002f48:	00f707b3          	add	a5,a4,a5
    80002f4c:	0607b503          	ld	a0,96(a5)
    80002f50:	fc051ae3          	bnez	a0,80002f24 <_Z10testMemoryv+0x8c>
    80002f54:	fd9ff06f          	j	80002f2c <_Z10testMemoryv+0x94>
//				printString("\nDeallocation failed for index ");
//				printInteger(i);
			}
		}
	}
}
    80002f58:	7d010113          	addi	sp,sp,2000
    80002f5c:	7e813083          	ld	ra,2024(sp)
    80002f60:	7e013403          	ld	s0,2016(sp)
    80002f64:	7d813483          	ld	s1,2008(sp)
    80002f68:	7f010113          	addi	sp,sp,2032
    80002f6c:	00008067          	ret

0000000080002f70 <_Z5nit1fPv>:

void nit1f(void*) {
    80002f70:	fe010113          	addi	sp,sp,-32
    80002f74:	00113c23          	sd	ra,24(sp)
    80002f78:	00813823          	sd	s0,16(sp)
    80002f7c:	00913423          	sd	s1,8(sp)
    80002f80:	01213023          	sd	s2,0(sp)
    80002f84:	02010413          	addi	s0,sp,32
	for(int i=0;i<3;i++){
    80002f88:	00000913          	li	s2,0
    80002f8c:	0440006f          	j	80002fd0 <_Z5nit1fPv+0x60>
		int res = (*semA).wait();
		if(res){
			printString("\nNit 1 cekala na semaforu\n");
		}
		else{
			printString("\nNit 1 nije cekala\n");
    80002f90:	00006517          	auipc	a0,0x6
    80002f94:	23850513          	addi	a0,a0,568 # 800091c8 <CONSOLE_STATUS+0x1b8>
    80002f98:	00002097          	auipc	ra,0x2
    80002f9c:	628080e7          	jalr	1576(ra) # 800055c0 <_Z11printStringPKc>
		}
		printString("\nsem_wait za nit 1 vratio ");
    80002fa0:	00006517          	auipc	a0,0x6
    80002fa4:	24050513          	addi	a0,a0,576 # 800091e0 <CONSOLE_STATUS+0x1d0>
    80002fa8:	00002097          	auipc	ra,0x2
    80002fac:	618080e7          	jalr	1560(ra) # 800055c0 <_Z11printStringPKc>
		printInteger(res);
    80002fb0:	00048513          	mv	a0,s1
    80002fb4:	00000097          	auipc	ra,0x0
    80002fb8:	eb4080e7          	jalr	-332(ra) # 80002e68 <_Z12printIntegeri>
		printString("\n");
    80002fbc:	00006517          	auipc	a0,0x6
    80002fc0:	5fc50513          	addi	a0,a0,1532 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80002fc4:	00002097          	auipc	ra,0x2
    80002fc8:	5fc080e7          	jalr	1532(ra) # 800055c0 <_Z11printStringPKc>
	for(int i=0;i<3;i++){
    80002fcc:	0019091b          	addiw	s2,s2,1
    80002fd0:	00200793          	li	a5,2
    80002fd4:	0527c263          	blt	a5,s2,80003018 <_Z5nit1fPv+0xa8>
		printString("\nNit 1 dolazi na semafor\n");
    80002fd8:	00006517          	auipc	a0,0x6
    80002fdc:	1b050513          	addi	a0,a0,432 # 80009188 <CONSOLE_STATUS+0x178>
    80002fe0:	00002097          	auipc	ra,0x2
    80002fe4:	5e0080e7          	jalr	1504(ra) # 800055c0 <_Z11printStringPKc>
		int res = (*semA).wait();
    80002fe8:	00009797          	auipc	a5,0x9
    80002fec:	9907b783          	ld	a5,-1648(a5) # 8000b978 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002ff0:	0007b503          	ld	a0,0(a5)
    80002ff4:	fffff097          	auipc	ra,0xfffff
    80002ff8:	440080e7          	jalr	1088(ra) # 80002434 <_ZN9Semaphore4waitEv>
    80002ffc:	00050493          	mv	s1,a0
		if(res){
    80003000:	f80508e3          	beqz	a0,80002f90 <_Z5nit1fPv+0x20>
			printString("\nNit 1 cekala na semaforu\n");
    80003004:	00006517          	auipc	a0,0x6
    80003008:	1a450513          	addi	a0,a0,420 # 800091a8 <CONSOLE_STATUS+0x198>
    8000300c:	00002097          	auipc	ra,0x2
    80003010:	5b4080e7          	jalr	1460(ra) # 800055c0 <_Z11printStringPKc>
    80003014:	f8dff06f          	j	80002fa0 <_Z5nit1fPv+0x30>
	}

	printString("\nGotova nit 1\n");
    80003018:	00006517          	auipc	a0,0x6
    8000301c:	1e850513          	addi	a0,a0,488 # 80009200 <CONSOLE_STATUS+0x1f0>
    80003020:	00002097          	auipc	ra,0x2
    80003024:	5a0080e7          	jalr	1440(ra) # 800055c0 <_Z11printStringPKc>
}
    80003028:	01813083          	ld	ra,24(sp)
    8000302c:	01013403          	ld	s0,16(sp)
    80003030:	00813483          	ld	s1,8(sp)
    80003034:	00013903          	ld	s2,0(sp)
    80003038:	02010113          	addi	sp,sp,32
    8000303c:	00008067          	ret

0000000080003040 <_Z5nit2fPv>:

void nit2f(void* arg2) {
    80003040:	fd010113          	addi	sp,sp,-48
    80003044:	02113423          	sd	ra,40(sp)
    80003048:	02813023          	sd	s0,32(sp)
    8000304c:	00913c23          	sd	s1,24(sp)
    80003050:	01213823          	sd	s2,16(sp)
    80003054:	01313423          	sd	s3,8(sp)
    80003058:	03010413          	addi	s0,sp,48
	for(int i=0;i<3;i++){
    8000305c:	00000913          	li	s2,0
    80003060:	0080006f          	j	80003068 <_Z5nit2fPv+0x28>
    80003064:	0019091b          	addiw	s2,s2,1
    80003068:	00200793          	li	a5,2
    8000306c:	0927c063          	blt	a5,s2,800030ec <_Z5nit2fPv+0xac>
		printString("\nNit 2 daje signal\n");
    80003070:	00006517          	auipc	a0,0x6
    80003074:	1a050513          	addi	a0,a0,416 # 80009210 <CONSOLE_STATUS+0x200>
    80003078:	00002097          	auipc	ra,0x2
    8000307c:	548080e7          	jalr	1352(ra) # 800055c0 <_Z11printStringPKc>
		//sem_signal(semA);
		int res = (*semA).signal();
    80003080:	00009997          	auipc	s3,0x9
    80003084:	8f89b983          	ld	s3,-1800(s3) # 8000b978 <_GLOBAL_OFFSET_TABLE_+0x10>
    80003088:	0009b503          	ld	a0,0(s3)
    8000308c:	fffff097          	auipc	ra,0xfffff
    80003090:	3d4080e7          	jalr	980(ra) # 80002460 <_ZN9Semaphore6signalEv>
    80003094:	00050493          	mv	s1,a0
		printString("\nPovratna vrednost signala je ");
    80003098:	00006517          	auipc	a0,0x6
    8000309c:	19050513          	addi	a0,a0,400 # 80009228 <CONSOLE_STATUS+0x218>
    800030a0:	00002097          	auipc	ra,0x2
    800030a4:	520080e7          	jalr	1312(ra) # 800055c0 <_Z11printStringPKc>
		printInteger(res);
    800030a8:	00048513          	mv	a0,s1
    800030ac:	00000097          	auipc	ra,0x0
    800030b0:	dbc080e7          	jalr	-580(ra) # 80002e68 <_Z12printIntegeri>
		printString("\n");
    800030b4:	00006517          	auipc	a0,0x6
    800030b8:	50450513          	addi	a0,a0,1284 # 800095b8 <CONSOLE_STATUS+0x5a8>
    800030bc:	00002097          	auipc	ra,0x2
    800030c0:	504080e7          	jalr	1284(ra) # 800055c0 <_Z11printStringPKc>
		//sem_close(semA);
		printString("\nNit 2 ubija semafor\n");
    800030c4:	00006517          	auipc	a0,0x6
    800030c8:	18450513          	addi	a0,a0,388 # 80009248 <CONSOLE_STATUS+0x238>
    800030cc:	00002097          	auipc	ra,0x2
    800030d0:	4f4080e7          	jalr	1268(ra) # 800055c0 <_Z11printStringPKc>
		delete semA;
    800030d4:	0009b503          	ld	a0,0(s3)
    800030d8:	f80506e3          	beqz	a0,80003064 <_Z5nit2fPv+0x24>
    800030dc:	00053783          	ld	a5,0(a0)
    800030e0:	0087b783          	ld	a5,8(a5)
    800030e4:	000780e7          	jalr	a5
    800030e8:	f7dff06f          	j	80003064 <_Z5nit2fPv+0x24>

	}
	printString("\nGotova nit 2\n");
    800030ec:	00006517          	auipc	a0,0x6
    800030f0:	17450513          	addi	a0,a0,372 # 80009260 <CONSOLE_STATUS+0x250>
    800030f4:	00002097          	auipc	ra,0x2
    800030f8:	4cc080e7          	jalr	1228(ra) # 800055c0 <_Z11printStringPKc>
}
    800030fc:	02813083          	ld	ra,40(sp)
    80003100:	02013403          	ld	s0,32(sp)
    80003104:	01813483          	ld	s1,24(sp)
    80003108:	01013903          	ld	s2,16(sp)
    8000310c:	00813983          	ld	s3,8(sp)
    80003110:	03010113          	addi	sp,sp,48
    80003114:	00008067          	ret

0000000080003118 <_Z5nit3fPv>:


void nit3f(void*) {
    80003118:	ff010113          	addi	sp,sp,-16
    8000311c:	00113423          	sd	ra,8(sp)
    80003120:	00813023          	sd	s0,0(sp)
    80003124:	01010413          	addi	s0,sp,16
//		printString("\n");
//		sem_wait(semA);
//		printString("Nit 3 prosla semafor\n");
//		time_sleep(10);
//	}
	printString("\nGotova nit3\n");
    80003128:	00006517          	auipc	a0,0x6
    8000312c:	14850513          	addi	a0,a0,328 # 80009270 <CONSOLE_STATUS+0x260>
    80003130:	00002097          	auipc	ra,0x2
    80003134:	490080e7          	jalr	1168(ra) # 800055c0 <_Z11printStringPKc>
    80003138:	00813083          	ld	ra,8(sp)
    8000313c:	00013403          	ld	s0,0(sp)
    80003140:	01010113          	addi	sp,sp,16
    80003144:	00008067          	ret

0000000080003148 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80003148:	fe010113          	addi	sp,sp,-32
    8000314c:	00113c23          	sd	ra,24(sp)
    80003150:	00813823          	sd	s0,16(sp)
    80003154:	00913423          	sd	s1,8(sp)
    80003158:	01213023          	sd	s2,0(sp)
    8000315c:	02010413          	addi	s0,sp,32
    80003160:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80003164:	00000913          	li	s2,0
    80003168:	00c0006f          	j	80003174 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    8000316c:	ffffe097          	auipc	ra,0xffffe
    80003170:	2bc080e7          	jalr	700(ra) # 80001428 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    80003174:	ffffe097          	auipc	ra,0xffffe
    80003178:	3f4080e7          	jalr	1012(ra) # 80001568 <_Z4getcv>
    8000317c:	0005059b          	sext.w	a1,a0
    80003180:	01b00793          	li	a5,27
    80003184:	02f58a63          	beq	a1,a5,800031b8 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80003188:	0084b503          	ld	a0,8(s1)
    8000318c:	00003097          	auipc	ra,0x3
    80003190:	400080e7          	jalr	1024(ra) # 8000658c <_ZN6Buffer3putEi>
        i++;
    80003194:	0019071b          	addiw	a4,s2,1
    80003198:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    8000319c:	0004a683          	lw	a3,0(s1)
    800031a0:	0026979b          	slliw	a5,a3,0x2
    800031a4:	00d787bb          	addw	a5,a5,a3
    800031a8:	0017979b          	slliw	a5,a5,0x1
    800031ac:	02f767bb          	remw	a5,a4,a5
    800031b0:	fc0792e3          	bnez	a5,80003174 <_ZL16producerKeyboardPv+0x2c>
    800031b4:	fb9ff06f          	j	8000316c <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    800031b8:	00100793          	li	a5,1
    800031bc:	00009717          	auipc	a4,0x9
    800031c0:	86f72e23          	sw	a5,-1924(a4) # 8000ba38 <_ZL9threadEnd>
    data->buffer->put('!');
    800031c4:	02100593          	li	a1,33
    800031c8:	0084b503          	ld	a0,8(s1)
    800031cc:	00003097          	auipc	ra,0x3
    800031d0:	3c0080e7          	jalr	960(ra) # 8000658c <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    800031d4:	0104b503          	ld	a0,16(s1)
    800031d8:	ffffe097          	auipc	ra,0xffffe
    800031dc:	360080e7          	jalr	864(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    800031e0:	01813083          	ld	ra,24(sp)
    800031e4:	01013403          	ld	s0,16(sp)
    800031e8:	00813483          	ld	s1,8(sp)
    800031ec:	00013903          	ld	s2,0(sp)
    800031f0:	02010113          	addi	sp,sp,32
    800031f4:	00008067          	ret

00000000800031f8 <_ZL8producerPv>:

static void producer(void *arg) {
    800031f8:	fe010113          	addi	sp,sp,-32
    800031fc:	00113c23          	sd	ra,24(sp)
    80003200:	00813823          	sd	s0,16(sp)
    80003204:	00913423          	sd	s1,8(sp)
    80003208:	01213023          	sd	s2,0(sp)
    8000320c:	02010413          	addi	s0,sp,32
    80003210:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003214:	00000913          	li	s2,0
    80003218:	00c0006f          	j	80003224 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    8000321c:	ffffe097          	auipc	ra,0xffffe
    80003220:	20c080e7          	jalr	524(ra) # 80001428 <_Z15thread_dispatchv>
    while (!threadEnd) {
    80003224:	00009797          	auipc	a5,0x9
    80003228:	8147a783          	lw	a5,-2028(a5) # 8000ba38 <_ZL9threadEnd>
    8000322c:	02079e63          	bnez	a5,80003268 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80003230:	0004a583          	lw	a1,0(s1)
    80003234:	0305859b          	addiw	a1,a1,48
    80003238:	0084b503          	ld	a0,8(s1)
    8000323c:	00003097          	auipc	ra,0x3
    80003240:	350080e7          	jalr	848(ra) # 8000658c <_ZN6Buffer3putEi>
        i++;
    80003244:	0019071b          	addiw	a4,s2,1
    80003248:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    8000324c:	0004a683          	lw	a3,0(s1)
    80003250:	0026979b          	slliw	a5,a3,0x2
    80003254:	00d787bb          	addw	a5,a5,a3
    80003258:	0017979b          	slliw	a5,a5,0x1
    8000325c:	02f767bb          	remw	a5,a4,a5
    80003260:	fc0792e3          	bnez	a5,80003224 <_ZL8producerPv+0x2c>
    80003264:	fb9ff06f          	j	8000321c <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80003268:	0104b503          	ld	a0,16(s1)
    8000326c:	ffffe097          	auipc	ra,0xffffe
    80003270:	2cc080e7          	jalr	716(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    80003274:	01813083          	ld	ra,24(sp)
    80003278:	01013403          	ld	s0,16(sp)
    8000327c:	00813483          	ld	s1,8(sp)
    80003280:	00013903          	ld	s2,0(sp)
    80003284:	02010113          	addi	sp,sp,32
    80003288:	00008067          	ret

000000008000328c <_ZL8consumerPv>:

static void consumer(void *arg) {
    8000328c:	fd010113          	addi	sp,sp,-48
    80003290:	02113423          	sd	ra,40(sp)
    80003294:	02813023          	sd	s0,32(sp)
    80003298:	00913c23          	sd	s1,24(sp)
    8000329c:	01213823          	sd	s2,16(sp)
    800032a0:	01313423          	sd	s3,8(sp)
    800032a4:	03010413          	addi	s0,sp,48
    800032a8:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800032ac:	00000993          	li	s3,0
    800032b0:	01c0006f          	j	800032cc <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    800032b4:	ffffe097          	auipc	ra,0xffffe
    800032b8:	174080e7          	jalr	372(ra) # 80001428 <_Z15thread_dispatchv>
    800032bc:	0500006f          	j	8000330c <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    800032c0:	00a00513          	li	a0,10
    800032c4:	ffffe097          	auipc	ra,0xffffe
    800032c8:	2cc080e7          	jalr	716(ra) # 80001590 <_Z4putcc>
    while (!threadEnd) {
    800032cc:	00008797          	auipc	a5,0x8
    800032d0:	76c7a783          	lw	a5,1900(a5) # 8000ba38 <_ZL9threadEnd>
    800032d4:	06079063          	bnez	a5,80003334 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    800032d8:	00893503          	ld	a0,8(s2)
    800032dc:	00003097          	auipc	ra,0x3
    800032e0:	340080e7          	jalr	832(ra) # 8000661c <_ZN6Buffer3getEv>
        i++;
    800032e4:	0019849b          	addiw	s1,s3,1
    800032e8:	0004899b          	sext.w	s3,s1
        putc(key);
    800032ec:	0ff57513          	andi	a0,a0,255
    800032f0:	ffffe097          	auipc	ra,0xffffe
    800032f4:	2a0080e7          	jalr	672(ra) # 80001590 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    800032f8:	00092703          	lw	a4,0(s2)
    800032fc:	0027179b          	slliw	a5,a4,0x2
    80003300:	00e787bb          	addw	a5,a5,a4
    80003304:	02f4e7bb          	remw	a5,s1,a5
    80003308:	fa0786e3          	beqz	a5,800032b4 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    8000330c:	05000793          	li	a5,80
    80003310:	02f4e4bb          	remw	s1,s1,a5
    80003314:	fa049ce3          	bnez	s1,800032cc <_ZL8consumerPv+0x40>
    80003318:	fa9ff06f          	j	800032c0 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    8000331c:	00893503          	ld	a0,8(s2)
    80003320:	00003097          	auipc	ra,0x3
    80003324:	2fc080e7          	jalr	764(ra) # 8000661c <_ZN6Buffer3getEv>
        putc(key);
    80003328:	0ff57513          	andi	a0,a0,255
    8000332c:	ffffe097          	auipc	ra,0xffffe
    80003330:	264080e7          	jalr	612(ra) # 80001590 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80003334:	00893503          	ld	a0,8(s2)
    80003338:	00003097          	auipc	ra,0x3
    8000333c:	370080e7          	jalr	880(ra) # 800066a8 <_ZN6Buffer6getCntEv>
    80003340:	fca04ee3          	bgtz	a0,8000331c <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80003344:	01093503          	ld	a0,16(s2)
    80003348:	ffffe097          	auipc	ra,0xffffe
    8000334c:	1f0080e7          	jalr	496(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    80003350:	02813083          	ld	ra,40(sp)
    80003354:	02013403          	ld	s0,32(sp)
    80003358:	01813483          	ld	s1,24(sp)
    8000335c:	01013903          	ld	s2,16(sp)
    80003360:	00813983          	ld	s3,8(sp)
    80003364:	03010113          	addi	sp,sp,48
    80003368:	00008067          	ret

000000008000336c <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    8000336c:	f9010113          	addi	sp,sp,-112
    80003370:	06113423          	sd	ra,104(sp)
    80003374:	06813023          	sd	s0,96(sp)
    80003378:	04913c23          	sd	s1,88(sp)
    8000337c:	05213823          	sd	s2,80(sp)
    80003380:	05313423          	sd	s3,72(sp)
    80003384:	05413023          	sd	s4,64(sp)
    80003388:	03513c23          	sd	s5,56(sp)
    8000338c:	03613823          	sd	s6,48(sp)
    80003390:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80003394:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80003398:	00006517          	auipc	a0,0x6
    8000339c:	ee850513          	addi	a0,a0,-280 # 80009280 <CONSOLE_STATUS+0x270>
    800033a0:	00002097          	auipc	ra,0x2
    800033a4:	220080e7          	jalr	544(ra) # 800055c0 <_Z11printStringPKc>
    getString(input, 30);
    800033a8:	01e00593          	li	a1,30
    800033ac:	fa040493          	addi	s1,s0,-96
    800033b0:	00048513          	mv	a0,s1
    800033b4:	00002097          	auipc	ra,0x2
    800033b8:	294080e7          	jalr	660(ra) # 80005648 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800033bc:	00048513          	mv	a0,s1
    800033c0:	00002097          	auipc	ra,0x2
    800033c4:	360080e7          	jalr	864(ra) # 80005720 <_Z11stringToIntPKc>
    800033c8:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    800033cc:	00006517          	auipc	a0,0x6
    800033d0:	ed450513          	addi	a0,a0,-300 # 800092a0 <CONSOLE_STATUS+0x290>
    800033d4:	00002097          	auipc	ra,0x2
    800033d8:	1ec080e7          	jalr	492(ra) # 800055c0 <_Z11printStringPKc>
    getString(input, 30);
    800033dc:	01e00593          	li	a1,30
    800033e0:	00048513          	mv	a0,s1
    800033e4:	00002097          	auipc	ra,0x2
    800033e8:	264080e7          	jalr	612(ra) # 80005648 <_Z9getStringPci>
    n = stringToInt(input);
    800033ec:	00048513          	mv	a0,s1
    800033f0:	00002097          	auipc	ra,0x2
    800033f4:	330080e7          	jalr	816(ra) # 80005720 <_Z11stringToIntPKc>
    800033f8:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    800033fc:	00006517          	auipc	a0,0x6
    80003400:	ec450513          	addi	a0,a0,-316 # 800092c0 <CONSOLE_STATUS+0x2b0>
    80003404:	00002097          	auipc	ra,0x2
    80003408:	1bc080e7          	jalr	444(ra) # 800055c0 <_Z11printStringPKc>
    8000340c:	00000613          	li	a2,0
    80003410:	00a00593          	li	a1,10
    80003414:	00090513          	mv	a0,s2
    80003418:	00002097          	auipc	ra,0x2
    8000341c:	358080e7          	jalr	856(ra) # 80005770 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80003420:	00006517          	auipc	a0,0x6
    80003424:	eb850513          	addi	a0,a0,-328 # 800092d8 <CONSOLE_STATUS+0x2c8>
    80003428:	00002097          	auipc	ra,0x2
    8000342c:	198080e7          	jalr	408(ra) # 800055c0 <_Z11printStringPKc>
    80003430:	00000613          	li	a2,0
    80003434:	00a00593          	li	a1,10
    80003438:	00048513          	mv	a0,s1
    8000343c:	00002097          	auipc	ra,0x2
    80003440:	334080e7          	jalr	820(ra) # 80005770 <_Z8printIntiii>
    printString(".\n");
    80003444:	00006517          	auipc	a0,0x6
    80003448:	eac50513          	addi	a0,a0,-340 # 800092f0 <CONSOLE_STATUS+0x2e0>
    8000344c:	00002097          	auipc	ra,0x2
    80003450:	174080e7          	jalr	372(ra) # 800055c0 <_Z11printStringPKc>
    if(threadNum > n) {
    80003454:	0324c463          	blt	s1,s2,8000347c <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80003458:	03205c63          	blez	s2,80003490 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    8000345c:	03800513          	li	a0,56
    80003460:	fffff097          	auipc	ra,0xfffff
    80003464:	d18080e7          	jalr	-744(ra) # 80002178 <_Znwm>
    80003468:	00050a13          	mv	s4,a0
    8000346c:	00048593          	mv	a1,s1
    80003470:	00003097          	auipc	ra,0x3
    80003474:	080080e7          	jalr	128(ra) # 800064f0 <_ZN6BufferC1Ei>
    80003478:	0300006f          	j	800034a8 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    8000347c:	00006517          	auipc	a0,0x6
    80003480:	e7c50513          	addi	a0,a0,-388 # 800092f8 <CONSOLE_STATUS+0x2e8>
    80003484:	00002097          	auipc	ra,0x2
    80003488:	13c080e7          	jalr	316(ra) # 800055c0 <_Z11printStringPKc>
        return;
    8000348c:	0140006f          	j	800034a0 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80003490:	00006517          	auipc	a0,0x6
    80003494:	ea850513          	addi	a0,a0,-344 # 80009338 <CONSOLE_STATUS+0x328>
    80003498:	00002097          	auipc	ra,0x2
    8000349c:	128080e7          	jalr	296(ra) # 800055c0 <_Z11printStringPKc>
        return;
    800034a0:	000b0113          	mv	sp,s6
    800034a4:	1500006f          	j	800035f4 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    800034a8:	00000593          	li	a1,0
    800034ac:	00008517          	auipc	a0,0x8
    800034b0:	59450513          	addi	a0,a0,1428 # 8000ba40 <_ZL10waitForAll>
    800034b4:	ffffe097          	auipc	ra,0xffffe
    800034b8:	fec080e7          	jalr	-20(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    thread_t threads[threadNum];
    800034bc:	00391793          	slli	a5,s2,0x3
    800034c0:	00f78793          	addi	a5,a5,15
    800034c4:	ff07f793          	andi	a5,a5,-16
    800034c8:	40f10133          	sub	sp,sp,a5
    800034cc:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    800034d0:	0019071b          	addiw	a4,s2,1
    800034d4:	00171793          	slli	a5,a4,0x1
    800034d8:	00e787b3          	add	a5,a5,a4
    800034dc:	00379793          	slli	a5,a5,0x3
    800034e0:	00f78793          	addi	a5,a5,15
    800034e4:	ff07f793          	andi	a5,a5,-16
    800034e8:	40f10133          	sub	sp,sp,a5
    800034ec:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    800034f0:	00191613          	slli	a2,s2,0x1
    800034f4:	012607b3          	add	a5,a2,s2
    800034f8:	00379793          	slli	a5,a5,0x3
    800034fc:	00f987b3          	add	a5,s3,a5
    80003500:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80003504:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80003508:	00008717          	auipc	a4,0x8
    8000350c:	53873703          	ld	a4,1336(a4) # 8000ba40 <_ZL10waitForAll>
    80003510:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80003514:	00078613          	mv	a2,a5
    80003518:	00000597          	auipc	a1,0x0
    8000351c:	d7458593          	addi	a1,a1,-652 # 8000328c <_ZL8consumerPv>
    80003520:	f9840513          	addi	a0,s0,-104
    80003524:	ffffe097          	auipc	ra,0xffffe
    80003528:	e5c080e7          	jalr	-420(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    8000352c:	00000493          	li	s1,0
    80003530:	0280006f          	j	80003558 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80003534:	00000597          	auipc	a1,0x0
    80003538:	c1458593          	addi	a1,a1,-1004 # 80003148 <_ZL16producerKeyboardPv>
                      data + i);
    8000353c:	00179613          	slli	a2,a5,0x1
    80003540:	00f60633          	add	a2,a2,a5
    80003544:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80003548:	00c98633          	add	a2,s3,a2
    8000354c:	ffffe097          	auipc	ra,0xffffe
    80003550:	e34080e7          	jalr	-460(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003554:	0014849b          	addiw	s1,s1,1
    80003558:	0524d263          	bge	s1,s2,8000359c <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    8000355c:	00149793          	slli	a5,s1,0x1
    80003560:	009787b3          	add	a5,a5,s1
    80003564:	00379793          	slli	a5,a5,0x3
    80003568:	00f987b3          	add	a5,s3,a5
    8000356c:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80003570:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80003574:	00008717          	auipc	a4,0x8
    80003578:	4cc73703          	ld	a4,1228(a4) # 8000ba40 <_ZL10waitForAll>
    8000357c:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80003580:	00048793          	mv	a5,s1
    80003584:	00349513          	slli	a0,s1,0x3
    80003588:	00aa8533          	add	a0,s5,a0
    8000358c:	fa9054e3          	blez	s1,80003534 <_Z22producerConsumer_C_APIv+0x1c8>
    80003590:	00000597          	auipc	a1,0x0
    80003594:	c6858593          	addi	a1,a1,-920 # 800031f8 <_ZL8producerPv>
    80003598:	fa5ff06f          	j	8000353c <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    8000359c:	ffffe097          	auipc	ra,0xffffe
    800035a0:	e8c080e7          	jalr	-372(ra) # 80001428 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    800035a4:	00000493          	li	s1,0
    800035a8:	00994e63          	blt	s2,s1,800035c4 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    800035ac:	00008517          	auipc	a0,0x8
    800035b0:	49453503          	ld	a0,1172(a0) # 8000ba40 <_ZL10waitForAll>
    800035b4:	ffffe097          	auipc	ra,0xffffe
    800035b8:	f54080e7          	jalr	-172(ra) # 80001508 <_Z8sem_waitP4KSem>
    for (int i = 0; i <= threadNum; i++) {
    800035bc:	0014849b          	addiw	s1,s1,1
    800035c0:	fe9ff06f          	j	800035a8 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    800035c4:	00008517          	auipc	a0,0x8
    800035c8:	47c53503          	ld	a0,1148(a0) # 8000ba40 <_ZL10waitForAll>
    800035cc:	ffffe097          	auipc	ra,0xffffe
    800035d0:	f0c080e7          	jalr	-244(ra) # 800014d8 <_Z9sem_closeP4KSem>
    delete buffer;
    800035d4:	000a0e63          	beqz	s4,800035f0 <_Z22producerConsumer_C_APIv+0x284>
    800035d8:	000a0513          	mv	a0,s4
    800035dc:	00003097          	auipc	ra,0x3
    800035e0:	154080e7          	jalr	340(ra) # 80006730 <_ZN6BufferD1Ev>
    800035e4:	000a0513          	mv	a0,s4
    800035e8:	fffff097          	auipc	ra,0xfffff
    800035ec:	be0080e7          	jalr	-1056(ra) # 800021c8 <_ZdlPv>
    800035f0:	000b0113          	mv	sp,s6

}
    800035f4:	f9040113          	addi	sp,s0,-112
    800035f8:	06813083          	ld	ra,104(sp)
    800035fc:	06013403          	ld	s0,96(sp)
    80003600:	05813483          	ld	s1,88(sp)
    80003604:	05013903          	ld	s2,80(sp)
    80003608:	04813983          	ld	s3,72(sp)
    8000360c:	04013a03          	ld	s4,64(sp)
    80003610:	03813a83          	ld	s5,56(sp)
    80003614:	03013b03          	ld	s6,48(sp)
    80003618:	07010113          	addi	sp,sp,112
    8000361c:	00008067          	ret
    80003620:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80003624:	000a0513          	mv	a0,s4
    80003628:	fffff097          	auipc	ra,0xfffff
    8000362c:	ba0080e7          	jalr	-1120(ra) # 800021c8 <_ZdlPv>
    80003630:	00048513          	mv	a0,s1
    80003634:	00009097          	auipc	ra,0x9
    80003638:	524080e7          	jalr	1316(ra) # 8000cb58 <_Unwind_Resume>

000000008000363c <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    8000363c:	fe010113          	addi	sp,sp,-32
    80003640:	00113c23          	sd	ra,24(sp)
    80003644:	00813823          	sd	s0,16(sp)
    80003648:	00913423          	sd	s1,8(sp)
    8000364c:	01213023          	sd	s2,0(sp)
    80003650:	02010413          	addi	s0,sp,32
    80003654:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003658:	00100793          	li	a5,1
    8000365c:	02a7f863          	bgeu	a5,a0,8000368c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80003660:	00a00793          	li	a5,10
    80003664:	02f577b3          	remu	a5,a0,a5
    80003668:	02078e63          	beqz	a5,800036a4 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    8000366c:	fff48513          	addi	a0,s1,-1
    80003670:	00000097          	auipc	ra,0x0
    80003674:	fcc080e7          	jalr	-52(ra) # 8000363c <_ZL9fibonaccim>
    80003678:	00050913          	mv	s2,a0
    8000367c:	ffe48513          	addi	a0,s1,-2
    80003680:	00000097          	auipc	ra,0x0
    80003684:	fbc080e7          	jalr	-68(ra) # 8000363c <_ZL9fibonaccim>
    80003688:	00a90533          	add	a0,s2,a0
}
    8000368c:	01813083          	ld	ra,24(sp)
    80003690:	01013403          	ld	s0,16(sp)
    80003694:	00813483          	ld	s1,8(sp)
    80003698:	00013903          	ld	s2,0(sp)
    8000369c:	02010113          	addi	sp,sp,32
    800036a0:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800036a4:	ffffe097          	auipc	ra,0xffffe
    800036a8:	d84080e7          	jalr	-636(ra) # 80001428 <_Z15thread_dispatchv>
    800036ac:	fc1ff06f          	j	8000366c <_ZL9fibonaccim+0x30>

00000000800036b0 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    800036b0:	fe010113          	addi	sp,sp,-32
    800036b4:	00113c23          	sd	ra,24(sp)
    800036b8:	00813823          	sd	s0,16(sp)
    800036bc:	00913423          	sd	s1,8(sp)
    800036c0:	01213023          	sd	s2,0(sp)
    800036c4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800036c8:	00000913          	li	s2,0
    800036cc:	0380006f          	j	80003704 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    800036d0:	ffffe097          	auipc	ra,0xffffe
    800036d4:	d58080e7          	jalr	-680(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800036d8:	00148493          	addi	s1,s1,1
    800036dc:	000027b7          	lui	a5,0x2
    800036e0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800036e4:	0097ee63          	bltu	a5,s1,80003700 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800036e8:	00000713          	li	a4,0
    800036ec:	000077b7          	lui	a5,0x7
    800036f0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800036f4:	fce7eee3          	bltu	a5,a4,800036d0 <_ZN7WorkerA11workerBodyAEPv+0x20>
    800036f8:	00170713          	addi	a4,a4,1
    800036fc:	ff1ff06f          	j	800036ec <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003700:	00190913          	addi	s2,s2,1
    80003704:	00900793          	li	a5,9
    80003708:	0527e063          	bltu	a5,s2,80003748 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    8000370c:	00006517          	auipc	a0,0x6
    80003710:	c5c50513          	addi	a0,a0,-932 # 80009368 <CONSOLE_STATUS+0x358>
    80003714:	00002097          	auipc	ra,0x2
    80003718:	eac080e7          	jalr	-340(ra) # 800055c0 <_Z11printStringPKc>
    8000371c:	00000613          	li	a2,0
    80003720:	00a00593          	li	a1,10
    80003724:	0009051b          	sext.w	a0,s2
    80003728:	00002097          	auipc	ra,0x2
    8000372c:	048080e7          	jalr	72(ra) # 80005770 <_Z8printIntiii>
    80003730:	00006517          	auipc	a0,0x6
    80003734:	e8850513          	addi	a0,a0,-376 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80003738:	00002097          	auipc	ra,0x2
    8000373c:	e88080e7          	jalr	-376(ra) # 800055c0 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003740:	00000493          	li	s1,0
    80003744:	f99ff06f          	j	800036dc <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003748:	00006517          	auipc	a0,0x6
    8000374c:	c2850513          	addi	a0,a0,-984 # 80009370 <CONSOLE_STATUS+0x360>
    80003750:	00002097          	auipc	ra,0x2
    80003754:	e70080e7          	jalr	-400(ra) # 800055c0 <_Z11printStringPKc>
    finishedA = true;
    80003758:	00100793          	li	a5,1
    8000375c:	00008717          	auipc	a4,0x8
    80003760:	2ef70623          	sb	a5,748(a4) # 8000ba48 <_ZL9finishedA>
}
    80003764:	01813083          	ld	ra,24(sp)
    80003768:	01013403          	ld	s0,16(sp)
    8000376c:	00813483          	ld	s1,8(sp)
    80003770:	00013903          	ld	s2,0(sp)
    80003774:	02010113          	addi	sp,sp,32
    80003778:	00008067          	ret

000000008000377c <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    8000377c:	fe010113          	addi	sp,sp,-32
    80003780:	00113c23          	sd	ra,24(sp)
    80003784:	00813823          	sd	s0,16(sp)
    80003788:	00913423          	sd	s1,8(sp)
    8000378c:	01213023          	sd	s2,0(sp)
    80003790:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003794:	00000913          	li	s2,0
    80003798:	0380006f          	j	800037d0 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    8000379c:	ffffe097          	auipc	ra,0xffffe
    800037a0:	c8c080e7          	jalr	-884(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800037a4:	00148493          	addi	s1,s1,1
    800037a8:	000027b7          	lui	a5,0x2
    800037ac:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800037b0:	0097ee63          	bltu	a5,s1,800037cc <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800037b4:	00000713          	li	a4,0
    800037b8:	000077b7          	lui	a5,0x7
    800037bc:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800037c0:	fce7eee3          	bltu	a5,a4,8000379c <_ZN7WorkerB11workerBodyBEPv+0x20>
    800037c4:	00170713          	addi	a4,a4,1
    800037c8:	ff1ff06f          	j	800037b8 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    800037cc:	00190913          	addi	s2,s2,1
    800037d0:	00f00793          	li	a5,15
    800037d4:	0527e063          	bltu	a5,s2,80003814 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800037d8:	00006517          	auipc	a0,0x6
    800037dc:	ba850513          	addi	a0,a0,-1112 # 80009380 <CONSOLE_STATUS+0x370>
    800037e0:	00002097          	auipc	ra,0x2
    800037e4:	de0080e7          	jalr	-544(ra) # 800055c0 <_Z11printStringPKc>
    800037e8:	00000613          	li	a2,0
    800037ec:	00a00593          	li	a1,10
    800037f0:	0009051b          	sext.w	a0,s2
    800037f4:	00002097          	auipc	ra,0x2
    800037f8:	f7c080e7          	jalr	-132(ra) # 80005770 <_Z8printIntiii>
    800037fc:	00006517          	auipc	a0,0x6
    80003800:	dbc50513          	addi	a0,a0,-580 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80003804:	00002097          	auipc	ra,0x2
    80003808:	dbc080e7          	jalr	-580(ra) # 800055c0 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    8000380c:	00000493          	li	s1,0
    80003810:	f99ff06f          	j	800037a8 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80003814:	00006517          	auipc	a0,0x6
    80003818:	b7450513          	addi	a0,a0,-1164 # 80009388 <CONSOLE_STATUS+0x378>
    8000381c:	00002097          	auipc	ra,0x2
    80003820:	da4080e7          	jalr	-604(ra) # 800055c0 <_Z11printStringPKc>
    finishedB = true;
    80003824:	00100793          	li	a5,1
    80003828:	00008717          	auipc	a4,0x8
    8000382c:	22f700a3          	sb	a5,545(a4) # 8000ba49 <_ZL9finishedB>
    thread_dispatch();
    80003830:	ffffe097          	auipc	ra,0xffffe
    80003834:	bf8080e7          	jalr	-1032(ra) # 80001428 <_Z15thread_dispatchv>
}
    80003838:	01813083          	ld	ra,24(sp)
    8000383c:	01013403          	ld	s0,16(sp)
    80003840:	00813483          	ld	s1,8(sp)
    80003844:	00013903          	ld	s2,0(sp)
    80003848:	02010113          	addi	sp,sp,32
    8000384c:	00008067          	ret

0000000080003850 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80003850:	fe010113          	addi	sp,sp,-32
    80003854:	00113c23          	sd	ra,24(sp)
    80003858:	00813823          	sd	s0,16(sp)
    8000385c:	00913423          	sd	s1,8(sp)
    80003860:	01213023          	sd	s2,0(sp)
    80003864:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80003868:	00000493          	li	s1,0
    8000386c:	0400006f          	j	800038ac <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003870:	00006517          	auipc	a0,0x6
    80003874:	b2850513          	addi	a0,a0,-1240 # 80009398 <CONSOLE_STATUS+0x388>
    80003878:	00002097          	auipc	ra,0x2
    8000387c:	d48080e7          	jalr	-696(ra) # 800055c0 <_Z11printStringPKc>
    80003880:	00000613          	li	a2,0
    80003884:	00a00593          	li	a1,10
    80003888:	00048513          	mv	a0,s1
    8000388c:	00002097          	auipc	ra,0x2
    80003890:	ee4080e7          	jalr	-284(ra) # 80005770 <_Z8printIntiii>
    80003894:	00006517          	auipc	a0,0x6
    80003898:	d2450513          	addi	a0,a0,-732 # 800095b8 <CONSOLE_STATUS+0x5a8>
    8000389c:	00002097          	auipc	ra,0x2
    800038a0:	d24080e7          	jalr	-732(ra) # 800055c0 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800038a4:	0014849b          	addiw	s1,s1,1
    800038a8:	0ff4f493          	andi	s1,s1,255
    800038ac:	00200793          	li	a5,2
    800038b0:	fc97f0e3          	bgeu	a5,s1,80003870 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    800038b4:	00006517          	auipc	a0,0x6
    800038b8:	aec50513          	addi	a0,a0,-1300 # 800093a0 <CONSOLE_STATUS+0x390>
    800038bc:	00002097          	auipc	ra,0x2
    800038c0:	d04080e7          	jalr	-764(ra) # 800055c0 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800038c4:	00700313          	li	t1,7
    thread_dispatch();
    800038c8:	ffffe097          	auipc	ra,0xffffe
    800038cc:	b60080e7          	jalr	-1184(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800038d0:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    800038d4:	00006517          	auipc	a0,0x6
    800038d8:	adc50513          	addi	a0,a0,-1316 # 800093b0 <CONSOLE_STATUS+0x3a0>
    800038dc:	00002097          	auipc	ra,0x2
    800038e0:	ce4080e7          	jalr	-796(ra) # 800055c0 <_Z11printStringPKc>
    800038e4:	00000613          	li	a2,0
    800038e8:	00a00593          	li	a1,10
    800038ec:	0009051b          	sext.w	a0,s2
    800038f0:	00002097          	auipc	ra,0x2
    800038f4:	e80080e7          	jalr	-384(ra) # 80005770 <_Z8printIntiii>
    800038f8:	00006517          	auipc	a0,0x6
    800038fc:	cc050513          	addi	a0,a0,-832 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80003900:	00002097          	auipc	ra,0x2
    80003904:	cc0080e7          	jalr	-832(ra) # 800055c0 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80003908:	00c00513          	li	a0,12
    8000390c:	00000097          	auipc	ra,0x0
    80003910:	d30080e7          	jalr	-720(ra) # 8000363c <_ZL9fibonaccim>
    80003914:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80003918:	00006517          	auipc	a0,0x6
    8000391c:	aa050513          	addi	a0,a0,-1376 # 800093b8 <CONSOLE_STATUS+0x3a8>
    80003920:	00002097          	auipc	ra,0x2
    80003924:	ca0080e7          	jalr	-864(ra) # 800055c0 <_Z11printStringPKc>
    80003928:	00000613          	li	a2,0
    8000392c:	00a00593          	li	a1,10
    80003930:	0009051b          	sext.w	a0,s2
    80003934:	00002097          	auipc	ra,0x2
    80003938:	e3c080e7          	jalr	-452(ra) # 80005770 <_Z8printIntiii>
    8000393c:	00006517          	auipc	a0,0x6
    80003940:	c7c50513          	addi	a0,a0,-900 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80003944:	00002097          	auipc	ra,0x2
    80003948:	c7c080e7          	jalr	-900(ra) # 800055c0 <_Z11printStringPKc>
    8000394c:	0400006f          	j	8000398c <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003950:	00006517          	auipc	a0,0x6
    80003954:	a4850513          	addi	a0,a0,-1464 # 80009398 <CONSOLE_STATUS+0x388>
    80003958:	00002097          	auipc	ra,0x2
    8000395c:	c68080e7          	jalr	-920(ra) # 800055c0 <_Z11printStringPKc>
    80003960:	00000613          	li	a2,0
    80003964:	00a00593          	li	a1,10
    80003968:	00048513          	mv	a0,s1
    8000396c:	00002097          	auipc	ra,0x2
    80003970:	e04080e7          	jalr	-508(ra) # 80005770 <_Z8printIntiii>
    80003974:	00006517          	auipc	a0,0x6
    80003978:	c4450513          	addi	a0,a0,-956 # 800095b8 <CONSOLE_STATUS+0x5a8>
    8000397c:	00002097          	auipc	ra,0x2
    80003980:	c44080e7          	jalr	-956(ra) # 800055c0 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80003984:	0014849b          	addiw	s1,s1,1
    80003988:	0ff4f493          	andi	s1,s1,255
    8000398c:	00500793          	li	a5,5
    80003990:	fc97f0e3          	bgeu	a5,s1,80003950 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    80003994:	00006517          	auipc	a0,0x6
    80003998:	9dc50513          	addi	a0,a0,-1572 # 80009370 <CONSOLE_STATUS+0x360>
    8000399c:	00002097          	auipc	ra,0x2
    800039a0:	c24080e7          	jalr	-988(ra) # 800055c0 <_Z11printStringPKc>
    finishedC = true;
    800039a4:	00100793          	li	a5,1
    800039a8:	00008717          	auipc	a4,0x8
    800039ac:	0af70123          	sb	a5,162(a4) # 8000ba4a <_ZL9finishedC>
    thread_dispatch();
    800039b0:	ffffe097          	auipc	ra,0xffffe
    800039b4:	a78080e7          	jalr	-1416(ra) # 80001428 <_Z15thread_dispatchv>
}
    800039b8:	01813083          	ld	ra,24(sp)
    800039bc:	01013403          	ld	s0,16(sp)
    800039c0:	00813483          	ld	s1,8(sp)
    800039c4:	00013903          	ld	s2,0(sp)
    800039c8:	02010113          	addi	sp,sp,32
    800039cc:	00008067          	ret

00000000800039d0 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    800039d0:	fe010113          	addi	sp,sp,-32
    800039d4:	00113c23          	sd	ra,24(sp)
    800039d8:	00813823          	sd	s0,16(sp)
    800039dc:	00913423          	sd	s1,8(sp)
    800039e0:	01213023          	sd	s2,0(sp)
    800039e4:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800039e8:	00a00493          	li	s1,10
    800039ec:	0400006f          	j	80003a2c <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800039f0:	00006517          	auipc	a0,0x6
    800039f4:	9d850513          	addi	a0,a0,-1576 # 800093c8 <CONSOLE_STATUS+0x3b8>
    800039f8:	00002097          	auipc	ra,0x2
    800039fc:	bc8080e7          	jalr	-1080(ra) # 800055c0 <_Z11printStringPKc>
    80003a00:	00000613          	li	a2,0
    80003a04:	00a00593          	li	a1,10
    80003a08:	00048513          	mv	a0,s1
    80003a0c:	00002097          	auipc	ra,0x2
    80003a10:	d64080e7          	jalr	-668(ra) # 80005770 <_Z8printIntiii>
    80003a14:	00006517          	auipc	a0,0x6
    80003a18:	ba450513          	addi	a0,a0,-1116 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80003a1c:	00002097          	auipc	ra,0x2
    80003a20:	ba4080e7          	jalr	-1116(ra) # 800055c0 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80003a24:	0014849b          	addiw	s1,s1,1
    80003a28:	0ff4f493          	andi	s1,s1,255
    80003a2c:	00c00793          	li	a5,12
    80003a30:	fc97f0e3          	bgeu	a5,s1,800039f0 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80003a34:	00006517          	auipc	a0,0x6
    80003a38:	99c50513          	addi	a0,a0,-1636 # 800093d0 <CONSOLE_STATUS+0x3c0>
    80003a3c:	00002097          	auipc	ra,0x2
    80003a40:	b84080e7          	jalr	-1148(ra) # 800055c0 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80003a44:	00500313          	li	t1,5
    thread_dispatch();
    80003a48:	ffffe097          	auipc	ra,0xffffe
    80003a4c:	9e0080e7          	jalr	-1568(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80003a50:	01000513          	li	a0,16
    80003a54:	00000097          	auipc	ra,0x0
    80003a58:	be8080e7          	jalr	-1048(ra) # 8000363c <_ZL9fibonaccim>
    80003a5c:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80003a60:	00006517          	auipc	a0,0x6
    80003a64:	98050513          	addi	a0,a0,-1664 # 800093e0 <CONSOLE_STATUS+0x3d0>
    80003a68:	00002097          	auipc	ra,0x2
    80003a6c:	b58080e7          	jalr	-1192(ra) # 800055c0 <_Z11printStringPKc>
    80003a70:	00000613          	li	a2,0
    80003a74:	00a00593          	li	a1,10
    80003a78:	0009051b          	sext.w	a0,s2
    80003a7c:	00002097          	auipc	ra,0x2
    80003a80:	cf4080e7          	jalr	-780(ra) # 80005770 <_Z8printIntiii>
    80003a84:	00006517          	auipc	a0,0x6
    80003a88:	b3450513          	addi	a0,a0,-1228 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80003a8c:	00002097          	auipc	ra,0x2
    80003a90:	b34080e7          	jalr	-1228(ra) # 800055c0 <_Z11printStringPKc>
    80003a94:	0400006f          	j	80003ad4 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003a98:	00006517          	auipc	a0,0x6
    80003a9c:	93050513          	addi	a0,a0,-1744 # 800093c8 <CONSOLE_STATUS+0x3b8>
    80003aa0:	00002097          	auipc	ra,0x2
    80003aa4:	b20080e7          	jalr	-1248(ra) # 800055c0 <_Z11printStringPKc>
    80003aa8:	00000613          	li	a2,0
    80003aac:	00a00593          	li	a1,10
    80003ab0:	00048513          	mv	a0,s1
    80003ab4:	00002097          	auipc	ra,0x2
    80003ab8:	cbc080e7          	jalr	-836(ra) # 80005770 <_Z8printIntiii>
    80003abc:	00006517          	auipc	a0,0x6
    80003ac0:	afc50513          	addi	a0,a0,-1284 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80003ac4:	00002097          	auipc	ra,0x2
    80003ac8:	afc080e7          	jalr	-1284(ra) # 800055c0 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80003acc:	0014849b          	addiw	s1,s1,1
    80003ad0:	0ff4f493          	andi	s1,s1,255
    80003ad4:	00f00793          	li	a5,15
    80003ad8:	fc97f0e3          	bgeu	a5,s1,80003a98 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80003adc:	00006517          	auipc	a0,0x6
    80003ae0:	91450513          	addi	a0,a0,-1772 # 800093f0 <CONSOLE_STATUS+0x3e0>
    80003ae4:	00002097          	auipc	ra,0x2
    80003ae8:	adc080e7          	jalr	-1316(ra) # 800055c0 <_Z11printStringPKc>
    finishedD = true;
    80003aec:	00100793          	li	a5,1
    80003af0:	00008717          	auipc	a4,0x8
    80003af4:	f4f70da3          	sb	a5,-165(a4) # 8000ba4b <_ZL9finishedD>
    thread_dispatch();
    80003af8:	ffffe097          	auipc	ra,0xffffe
    80003afc:	930080e7          	jalr	-1744(ra) # 80001428 <_Z15thread_dispatchv>
}
    80003b00:	01813083          	ld	ra,24(sp)
    80003b04:	01013403          	ld	s0,16(sp)
    80003b08:	00813483          	ld	s1,8(sp)
    80003b0c:	00013903          	ld	s2,0(sp)
    80003b10:	02010113          	addi	sp,sp,32
    80003b14:	00008067          	ret

0000000080003b18 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80003b18:	fc010113          	addi	sp,sp,-64
    80003b1c:	02113c23          	sd	ra,56(sp)
    80003b20:	02813823          	sd	s0,48(sp)
    80003b24:	02913423          	sd	s1,40(sp)
    80003b28:	03213023          	sd	s2,32(sp)
    80003b2c:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80003b30:	02000513          	li	a0,32
    80003b34:	ffffe097          	auipc	ra,0xffffe
    80003b38:	644080e7          	jalr	1604(ra) # 80002178 <_Znwm>
    80003b3c:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80003b40:	fffff097          	auipc	ra,0xfffff
    80003b44:	898080e7          	jalr	-1896(ra) # 800023d8 <_ZN6ThreadC1Ev>
    80003b48:	00008797          	auipc	a5,0x8
    80003b4c:	c8878793          	addi	a5,a5,-888 # 8000b7d0 <_ZTV7WorkerA+0x10>
    80003b50:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80003b54:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80003b58:	00006517          	auipc	a0,0x6
    80003b5c:	8a850513          	addi	a0,a0,-1880 # 80009400 <CONSOLE_STATUS+0x3f0>
    80003b60:	00002097          	auipc	ra,0x2
    80003b64:	a60080e7          	jalr	-1440(ra) # 800055c0 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80003b68:	02000513          	li	a0,32
    80003b6c:	ffffe097          	auipc	ra,0xffffe
    80003b70:	60c080e7          	jalr	1548(ra) # 80002178 <_Znwm>
    80003b74:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80003b78:	fffff097          	auipc	ra,0xfffff
    80003b7c:	860080e7          	jalr	-1952(ra) # 800023d8 <_ZN6ThreadC1Ev>
    80003b80:	00008797          	auipc	a5,0x8
    80003b84:	c7878793          	addi	a5,a5,-904 # 8000b7f8 <_ZTV7WorkerB+0x10>
    80003b88:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80003b8c:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80003b90:	00006517          	auipc	a0,0x6
    80003b94:	88850513          	addi	a0,a0,-1912 # 80009418 <CONSOLE_STATUS+0x408>
    80003b98:	00002097          	auipc	ra,0x2
    80003b9c:	a28080e7          	jalr	-1496(ra) # 800055c0 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80003ba0:	02000513          	li	a0,32
    80003ba4:	ffffe097          	auipc	ra,0xffffe
    80003ba8:	5d4080e7          	jalr	1492(ra) # 80002178 <_Znwm>
    80003bac:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80003bb0:	fffff097          	auipc	ra,0xfffff
    80003bb4:	828080e7          	jalr	-2008(ra) # 800023d8 <_ZN6ThreadC1Ev>
    80003bb8:	00008797          	auipc	a5,0x8
    80003bbc:	c6878793          	addi	a5,a5,-920 # 8000b820 <_ZTV7WorkerC+0x10>
    80003bc0:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80003bc4:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80003bc8:	00006517          	auipc	a0,0x6
    80003bcc:	86850513          	addi	a0,a0,-1944 # 80009430 <CONSOLE_STATUS+0x420>
    80003bd0:	00002097          	auipc	ra,0x2
    80003bd4:	9f0080e7          	jalr	-1552(ra) # 800055c0 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80003bd8:	02000513          	li	a0,32
    80003bdc:	ffffe097          	auipc	ra,0xffffe
    80003be0:	59c080e7          	jalr	1436(ra) # 80002178 <_Znwm>
    80003be4:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80003be8:	ffffe097          	auipc	ra,0xffffe
    80003bec:	7f0080e7          	jalr	2032(ra) # 800023d8 <_ZN6ThreadC1Ev>
    80003bf0:	00008797          	auipc	a5,0x8
    80003bf4:	c5878793          	addi	a5,a5,-936 # 8000b848 <_ZTV7WorkerD+0x10>
    80003bf8:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80003bfc:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80003c00:	00006517          	auipc	a0,0x6
    80003c04:	84850513          	addi	a0,a0,-1976 # 80009448 <CONSOLE_STATUS+0x438>
    80003c08:	00002097          	auipc	ra,0x2
    80003c0c:	9b8080e7          	jalr	-1608(ra) # 800055c0 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80003c10:	00000493          	li	s1,0
    80003c14:	00300793          	li	a5,3
    80003c18:	0297c663          	blt	a5,s1,80003c44 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80003c1c:	00349793          	slli	a5,s1,0x3
    80003c20:	fe040713          	addi	a4,s0,-32
    80003c24:	00f707b3          	add	a5,a4,a5
    80003c28:	fe07b503          	ld	a0,-32(a5)
    80003c2c:	ffffe097          	auipc	ra,0xffffe
    80003c30:	6e4080e7          	jalr	1764(ra) # 80002310 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80003c34:	0014849b          	addiw	s1,s1,1
    80003c38:	fddff06f          	j	80003c14 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80003c3c:	ffffe097          	auipc	ra,0xffffe
    80003c40:	738080e7          	jalr	1848(ra) # 80002374 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80003c44:	00008797          	auipc	a5,0x8
    80003c48:	e047c783          	lbu	a5,-508(a5) # 8000ba48 <_ZL9finishedA>
    80003c4c:	fe0788e3          	beqz	a5,80003c3c <_Z20Threads_CPP_API_testv+0x124>
    80003c50:	00008797          	auipc	a5,0x8
    80003c54:	df97c783          	lbu	a5,-519(a5) # 8000ba49 <_ZL9finishedB>
    80003c58:	fe0782e3          	beqz	a5,80003c3c <_Z20Threads_CPP_API_testv+0x124>
    80003c5c:	00008797          	auipc	a5,0x8
    80003c60:	dee7c783          	lbu	a5,-530(a5) # 8000ba4a <_ZL9finishedC>
    80003c64:	fc078ce3          	beqz	a5,80003c3c <_Z20Threads_CPP_API_testv+0x124>
    80003c68:	00008797          	auipc	a5,0x8
    80003c6c:	de37c783          	lbu	a5,-541(a5) # 8000ba4b <_ZL9finishedD>
    80003c70:	fc0786e3          	beqz	a5,80003c3c <_Z20Threads_CPP_API_testv+0x124>
    80003c74:	fc040493          	addi	s1,s0,-64
    80003c78:	0080006f          	j	80003c80 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    80003c7c:	00848493          	addi	s1,s1,8
    80003c80:	fe040793          	addi	a5,s0,-32
    80003c84:	08f48663          	beq	s1,a5,80003d10 <_Z20Threads_CPP_API_testv+0x1f8>
    80003c88:	0004b503          	ld	a0,0(s1)
    80003c8c:	fe0508e3          	beqz	a0,80003c7c <_Z20Threads_CPP_API_testv+0x164>
    80003c90:	00053783          	ld	a5,0(a0)
    80003c94:	0087b783          	ld	a5,8(a5)
    80003c98:	000780e7          	jalr	a5
    80003c9c:	fe1ff06f          	j	80003c7c <_Z20Threads_CPP_API_testv+0x164>
    80003ca0:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80003ca4:	00048513          	mv	a0,s1
    80003ca8:	ffffe097          	auipc	ra,0xffffe
    80003cac:	520080e7          	jalr	1312(ra) # 800021c8 <_ZdlPv>
    80003cb0:	00090513          	mv	a0,s2
    80003cb4:	00009097          	auipc	ra,0x9
    80003cb8:	ea4080e7          	jalr	-348(ra) # 8000cb58 <_Unwind_Resume>
    80003cbc:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80003cc0:	00048513          	mv	a0,s1
    80003cc4:	ffffe097          	auipc	ra,0xffffe
    80003cc8:	504080e7          	jalr	1284(ra) # 800021c8 <_ZdlPv>
    80003ccc:	00090513          	mv	a0,s2
    80003cd0:	00009097          	auipc	ra,0x9
    80003cd4:	e88080e7          	jalr	-376(ra) # 8000cb58 <_Unwind_Resume>
    80003cd8:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80003cdc:	00048513          	mv	a0,s1
    80003ce0:	ffffe097          	auipc	ra,0xffffe
    80003ce4:	4e8080e7          	jalr	1256(ra) # 800021c8 <_ZdlPv>
    80003ce8:	00090513          	mv	a0,s2
    80003cec:	00009097          	auipc	ra,0x9
    80003cf0:	e6c080e7          	jalr	-404(ra) # 8000cb58 <_Unwind_Resume>
    80003cf4:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80003cf8:	00048513          	mv	a0,s1
    80003cfc:	ffffe097          	auipc	ra,0xffffe
    80003d00:	4cc080e7          	jalr	1228(ra) # 800021c8 <_ZdlPv>
    80003d04:	00090513          	mv	a0,s2
    80003d08:	00009097          	auipc	ra,0x9
    80003d0c:	e50080e7          	jalr	-432(ra) # 8000cb58 <_Unwind_Resume>
}
    80003d10:	03813083          	ld	ra,56(sp)
    80003d14:	03013403          	ld	s0,48(sp)
    80003d18:	02813483          	ld	s1,40(sp)
    80003d1c:	02013903          	ld	s2,32(sp)
    80003d20:	04010113          	addi	sp,sp,64
    80003d24:	00008067          	ret

0000000080003d28 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80003d28:	ff010113          	addi	sp,sp,-16
    80003d2c:	00113423          	sd	ra,8(sp)
    80003d30:	00813023          	sd	s0,0(sp)
    80003d34:	01010413          	addi	s0,sp,16
    80003d38:	00008797          	auipc	a5,0x8
    80003d3c:	a9878793          	addi	a5,a5,-1384 # 8000b7d0 <_ZTV7WorkerA+0x10>
    80003d40:	00f53023          	sd	a5,0(a0)
    80003d44:	ffffe097          	auipc	ra,0xffffe
    80003d48:	3a4080e7          	jalr	932(ra) # 800020e8 <_ZN6ThreadD1Ev>
    80003d4c:	00813083          	ld	ra,8(sp)
    80003d50:	00013403          	ld	s0,0(sp)
    80003d54:	01010113          	addi	sp,sp,16
    80003d58:	00008067          	ret

0000000080003d5c <_ZN7WorkerAD0Ev>:
    80003d5c:	fe010113          	addi	sp,sp,-32
    80003d60:	00113c23          	sd	ra,24(sp)
    80003d64:	00813823          	sd	s0,16(sp)
    80003d68:	00913423          	sd	s1,8(sp)
    80003d6c:	02010413          	addi	s0,sp,32
    80003d70:	00050493          	mv	s1,a0
    80003d74:	00008797          	auipc	a5,0x8
    80003d78:	a5c78793          	addi	a5,a5,-1444 # 8000b7d0 <_ZTV7WorkerA+0x10>
    80003d7c:	00f53023          	sd	a5,0(a0)
    80003d80:	ffffe097          	auipc	ra,0xffffe
    80003d84:	368080e7          	jalr	872(ra) # 800020e8 <_ZN6ThreadD1Ev>
    80003d88:	00048513          	mv	a0,s1
    80003d8c:	ffffe097          	auipc	ra,0xffffe
    80003d90:	43c080e7          	jalr	1084(ra) # 800021c8 <_ZdlPv>
    80003d94:	01813083          	ld	ra,24(sp)
    80003d98:	01013403          	ld	s0,16(sp)
    80003d9c:	00813483          	ld	s1,8(sp)
    80003da0:	02010113          	addi	sp,sp,32
    80003da4:	00008067          	ret

0000000080003da8 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80003da8:	ff010113          	addi	sp,sp,-16
    80003dac:	00113423          	sd	ra,8(sp)
    80003db0:	00813023          	sd	s0,0(sp)
    80003db4:	01010413          	addi	s0,sp,16
    80003db8:	00008797          	auipc	a5,0x8
    80003dbc:	a4078793          	addi	a5,a5,-1472 # 8000b7f8 <_ZTV7WorkerB+0x10>
    80003dc0:	00f53023          	sd	a5,0(a0)
    80003dc4:	ffffe097          	auipc	ra,0xffffe
    80003dc8:	324080e7          	jalr	804(ra) # 800020e8 <_ZN6ThreadD1Ev>
    80003dcc:	00813083          	ld	ra,8(sp)
    80003dd0:	00013403          	ld	s0,0(sp)
    80003dd4:	01010113          	addi	sp,sp,16
    80003dd8:	00008067          	ret

0000000080003ddc <_ZN7WorkerBD0Ev>:
    80003ddc:	fe010113          	addi	sp,sp,-32
    80003de0:	00113c23          	sd	ra,24(sp)
    80003de4:	00813823          	sd	s0,16(sp)
    80003de8:	00913423          	sd	s1,8(sp)
    80003dec:	02010413          	addi	s0,sp,32
    80003df0:	00050493          	mv	s1,a0
    80003df4:	00008797          	auipc	a5,0x8
    80003df8:	a0478793          	addi	a5,a5,-1532 # 8000b7f8 <_ZTV7WorkerB+0x10>
    80003dfc:	00f53023          	sd	a5,0(a0)
    80003e00:	ffffe097          	auipc	ra,0xffffe
    80003e04:	2e8080e7          	jalr	744(ra) # 800020e8 <_ZN6ThreadD1Ev>
    80003e08:	00048513          	mv	a0,s1
    80003e0c:	ffffe097          	auipc	ra,0xffffe
    80003e10:	3bc080e7          	jalr	956(ra) # 800021c8 <_ZdlPv>
    80003e14:	01813083          	ld	ra,24(sp)
    80003e18:	01013403          	ld	s0,16(sp)
    80003e1c:	00813483          	ld	s1,8(sp)
    80003e20:	02010113          	addi	sp,sp,32
    80003e24:	00008067          	ret

0000000080003e28 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80003e28:	ff010113          	addi	sp,sp,-16
    80003e2c:	00113423          	sd	ra,8(sp)
    80003e30:	00813023          	sd	s0,0(sp)
    80003e34:	01010413          	addi	s0,sp,16
    80003e38:	00008797          	auipc	a5,0x8
    80003e3c:	9e878793          	addi	a5,a5,-1560 # 8000b820 <_ZTV7WorkerC+0x10>
    80003e40:	00f53023          	sd	a5,0(a0)
    80003e44:	ffffe097          	auipc	ra,0xffffe
    80003e48:	2a4080e7          	jalr	676(ra) # 800020e8 <_ZN6ThreadD1Ev>
    80003e4c:	00813083          	ld	ra,8(sp)
    80003e50:	00013403          	ld	s0,0(sp)
    80003e54:	01010113          	addi	sp,sp,16
    80003e58:	00008067          	ret

0000000080003e5c <_ZN7WorkerCD0Ev>:
    80003e5c:	fe010113          	addi	sp,sp,-32
    80003e60:	00113c23          	sd	ra,24(sp)
    80003e64:	00813823          	sd	s0,16(sp)
    80003e68:	00913423          	sd	s1,8(sp)
    80003e6c:	02010413          	addi	s0,sp,32
    80003e70:	00050493          	mv	s1,a0
    80003e74:	00008797          	auipc	a5,0x8
    80003e78:	9ac78793          	addi	a5,a5,-1620 # 8000b820 <_ZTV7WorkerC+0x10>
    80003e7c:	00f53023          	sd	a5,0(a0)
    80003e80:	ffffe097          	auipc	ra,0xffffe
    80003e84:	268080e7          	jalr	616(ra) # 800020e8 <_ZN6ThreadD1Ev>
    80003e88:	00048513          	mv	a0,s1
    80003e8c:	ffffe097          	auipc	ra,0xffffe
    80003e90:	33c080e7          	jalr	828(ra) # 800021c8 <_ZdlPv>
    80003e94:	01813083          	ld	ra,24(sp)
    80003e98:	01013403          	ld	s0,16(sp)
    80003e9c:	00813483          	ld	s1,8(sp)
    80003ea0:	02010113          	addi	sp,sp,32
    80003ea4:	00008067          	ret

0000000080003ea8 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80003ea8:	ff010113          	addi	sp,sp,-16
    80003eac:	00113423          	sd	ra,8(sp)
    80003eb0:	00813023          	sd	s0,0(sp)
    80003eb4:	01010413          	addi	s0,sp,16
    80003eb8:	00008797          	auipc	a5,0x8
    80003ebc:	99078793          	addi	a5,a5,-1648 # 8000b848 <_ZTV7WorkerD+0x10>
    80003ec0:	00f53023          	sd	a5,0(a0)
    80003ec4:	ffffe097          	auipc	ra,0xffffe
    80003ec8:	224080e7          	jalr	548(ra) # 800020e8 <_ZN6ThreadD1Ev>
    80003ecc:	00813083          	ld	ra,8(sp)
    80003ed0:	00013403          	ld	s0,0(sp)
    80003ed4:	01010113          	addi	sp,sp,16
    80003ed8:	00008067          	ret

0000000080003edc <_ZN7WorkerDD0Ev>:
    80003edc:	fe010113          	addi	sp,sp,-32
    80003ee0:	00113c23          	sd	ra,24(sp)
    80003ee4:	00813823          	sd	s0,16(sp)
    80003ee8:	00913423          	sd	s1,8(sp)
    80003eec:	02010413          	addi	s0,sp,32
    80003ef0:	00050493          	mv	s1,a0
    80003ef4:	00008797          	auipc	a5,0x8
    80003ef8:	95478793          	addi	a5,a5,-1708 # 8000b848 <_ZTV7WorkerD+0x10>
    80003efc:	00f53023          	sd	a5,0(a0)
    80003f00:	ffffe097          	auipc	ra,0xffffe
    80003f04:	1e8080e7          	jalr	488(ra) # 800020e8 <_ZN6ThreadD1Ev>
    80003f08:	00048513          	mv	a0,s1
    80003f0c:	ffffe097          	auipc	ra,0xffffe
    80003f10:	2bc080e7          	jalr	700(ra) # 800021c8 <_ZdlPv>
    80003f14:	01813083          	ld	ra,24(sp)
    80003f18:	01013403          	ld	s0,16(sp)
    80003f1c:	00813483          	ld	s1,8(sp)
    80003f20:	02010113          	addi	sp,sp,32
    80003f24:	00008067          	ret

0000000080003f28 <_ZN7WorkerA3runEv>:
    void run() override {
    80003f28:	ff010113          	addi	sp,sp,-16
    80003f2c:	00113423          	sd	ra,8(sp)
    80003f30:	00813023          	sd	s0,0(sp)
    80003f34:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80003f38:	00000593          	li	a1,0
    80003f3c:	fffff097          	auipc	ra,0xfffff
    80003f40:	774080e7          	jalr	1908(ra) # 800036b0 <_ZN7WorkerA11workerBodyAEPv>
    }
    80003f44:	00813083          	ld	ra,8(sp)
    80003f48:	00013403          	ld	s0,0(sp)
    80003f4c:	01010113          	addi	sp,sp,16
    80003f50:	00008067          	ret

0000000080003f54 <_ZN7WorkerB3runEv>:
    void run() override {
    80003f54:	ff010113          	addi	sp,sp,-16
    80003f58:	00113423          	sd	ra,8(sp)
    80003f5c:	00813023          	sd	s0,0(sp)
    80003f60:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80003f64:	00000593          	li	a1,0
    80003f68:	00000097          	auipc	ra,0x0
    80003f6c:	814080e7          	jalr	-2028(ra) # 8000377c <_ZN7WorkerB11workerBodyBEPv>
    }
    80003f70:	00813083          	ld	ra,8(sp)
    80003f74:	00013403          	ld	s0,0(sp)
    80003f78:	01010113          	addi	sp,sp,16
    80003f7c:	00008067          	ret

0000000080003f80 <_ZN7WorkerC3runEv>:
    void run() override {
    80003f80:	ff010113          	addi	sp,sp,-16
    80003f84:	00113423          	sd	ra,8(sp)
    80003f88:	00813023          	sd	s0,0(sp)
    80003f8c:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80003f90:	00000593          	li	a1,0
    80003f94:	00000097          	auipc	ra,0x0
    80003f98:	8bc080e7          	jalr	-1860(ra) # 80003850 <_ZN7WorkerC11workerBodyCEPv>
    }
    80003f9c:	00813083          	ld	ra,8(sp)
    80003fa0:	00013403          	ld	s0,0(sp)
    80003fa4:	01010113          	addi	sp,sp,16
    80003fa8:	00008067          	ret

0000000080003fac <_ZN7WorkerD3runEv>:
    void run() override {
    80003fac:	ff010113          	addi	sp,sp,-16
    80003fb0:	00113423          	sd	ra,8(sp)
    80003fb4:	00813023          	sd	s0,0(sp)
    80003fb8:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80003fbc:	00000593          	li	a1,0
    80003fc0:	00000097          	auipc	ra,0x0
    80003fc4:	a10080e7          	jalr	-1520(ra) # 800039d0 <_ZN7WorkerD11workerBodyDEPv>
    }
    80003fc8:	00813083          	ld	ra,8(sp)
    80003fcc:	00013403          	ld	s0,0(sp)
    80003fd0:	01010113          	addi	sp,sp,16
    80003fd4:	00008067          	ret

0000000080003fd8 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    80003fd8:	f8010113          	addi	sp,sp,-128
    80003fdc:	06113c23          	sd	ra,120(sp)
    80003fe0:	06813823          	sd	s0,112(sp)
    80003fe4:	06913423          	sd	s1,104(sp)
    80003fe8:	07213023          	sd	s2,96(sp)
    80003fec:	05313c23          	sd	s3,88(sp)
    80003ff0:	05413823          	sd	s4,80(sp)
    80003ff4:	05513423          	sd	s5,72(sp)
    80003ff8:	05613023          	sd	s6,64(sp)
    80003ffc:	03713c23          	sd	s7,56(sp)
    80004000:	03813823          	sd	s8,48(sp)
    80004004:	03913423          	sd	s9,40(sp)
    80004008:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    8000400c:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    80004010:	00005517          	auipc	a0,0x5
    80004014:	27050513          	addi	a0,a0,624 # 80009280 <CONSOLE_STATUS+0x270>
    80004018:	00001097          	auipc	ra,0x1
    8000401c:	5a8080e7          	jalr	1448(ra) # 800055c0 <_Z11printStringPKc>
    getString(input, 30);
    80004020:	01e00593          	li	a1,30
    80004024:	f8040493          	addi	s1,s0,-128
    80004028:	00048513          	mv	a0,s1
    8000402c:	00001097          	auipc	ra,0x1
    80004030:	61c080e7          	jalr	1564(ra) # 80005648 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80004034:	00048513          	mv	a0,s1
    80004038:	00001097          	auipc	ra,0x1
    8000403c:	6e8080e7          	jalr	1768(ra) # 80005720 <_Z11stringToIntPKc>
    80004040:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    80004044:	00005517          	auipc	a0,0x5
    80004048:	25c50513          	addi	a0,a0,604 # 800092a0 <CONSOLE_STATUS+0x290>
    8000404c:	00001097          	auipc	ra,0x1
    80004050:	574080e7          	jalr	1396(ra) # 800055c0 <_Z11printStringPKc>
    getString(input, 30);
    80004054:	01e00593          	li	a1,30
    80004058:	00048513          	mv	a0,s1
    8000405c:	00001097          	auipc	ra,0x1
    80004060:	5ec080e7          	jalr	1516(ra) # 80005648 <_Z9getStringPci>
    n = stringToInt(input);
    80004064:	00048513          	mv	a0,s1
    80004068:	00001097          	auipc	ra,0x1
    8000406c:	6b8080e7          	jalr	1720(ra) # 80005720 <_Z11stringToIntPKc>
    80004070:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80004074:	00005517          	auipc	a0,0x5
    80004078:	24c50513          	addi	a0,a0,588 # 800092c0 <CONSOLE_STATUS+0x2b0>
    8000407c:	00001097          	auipc	ra,0x1
    80004080:	544080e7          	jalr	1348(ra) # 800055c0 <_Z11printStringPKc>
    printInt(threadNum);
    80004084:	00000613          	li	a2,0
    80004088:	00a00593          	li	a1,10
    8000408c:	00098513          	mv	a0,s3
    80004090:	00001097          	auipc	ra,0x1
    80004094:	6e0080e7          	jalr	1760(ra) # 80005770 <_Z8printIntiii>
    printString(" i velicina bafera ");
    80004098:	00005517          	auipc	a0,0x5
    8000409c:	24050513          	addi	a0,a0,576 # 800092d8 <CONSOLE_STATUS+0x2c8>
    800040a0:	00001097          	auipc	ra,0x1
    800040a4:	520080e7          	jalr	1312(ra) # 800055c0 <_Z11printStringPKc>
    printInt(n);
    800040a8:	00000613          	li	a2,0
    800040ac:	00a00593          	li	a1,10
    800040b0:	00048513          	mv	a0,s1
    800040b4:	00001097          	auipc	ra,0x1
    800040b8:	6bc080e7          	jalr	1724(ra) # 80005770 <_Z8printIntiii>
    printString(".\n");
    800040bc:	00005517          	auipc	a0,0x5
    800040c0:	23450513          	addi	a0,a0,564 # 800092f0 <CONSOLE_STATUS+0x2e0>
    800040c4:	00001097          	auipc	ra,0x1
    800040c8:	4fc080e7          	jalr	1276(ra) # 800055c0 <_Z11printStringPKc>
    if (threadNum > n) {
    800040cc:	0334c463          	blt	s1,s3,800040f4 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    800040d0:	03305c63          	blez	s3,80004108 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    800040d4:	03800513          	li	a0,56
    800040d8:	ffffe097          	auipc	ra,0xffffe
    800040dc:	0a0080e7          	jalr	160(ra) # 80002178 <_Znwm>
    800040e0:	00050a93          	mv	s5,a0
    800040e4:	00048593          	mv	a1,s1
    800040e8:	00001097          	auipc	ra,0x1
    800040ec:	7a8080e7          	jalr	1960(ra) # 80005890 <_ZN9BufferCPPC1Ei>
    800040f0:	0300006f          	j	80004120 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800040f4:	00005517          	auipc	a0,0x5
    800040f8:	20450513          	addi	a0,a0,516 # 800092f8 <CONSOLE_STATUS+0x2e8>
    800040fc:	00001097          	auipc	ra,0x1
    80004100:	4c4080e7          	jalr	1220(ra) # 800055c0 <_Z11printStringPKc>
        return;
    80004104:	0140006f          	j	80004118 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80004108:	00005517          	auipc	a0,0x5
    8000410c:	23050513          	addi	a0,a0,560 # 80009338 <CONSOLE_STATUS+0x328>
    80004110:	00001097          	auipc	ra,0x1
    80004114:	4b0080e7          	jalr	1200(ra) # 800055c0 <_Z11printStringPKc>
        return;
    80004118:	000c0113          	mv	sp,s8
    8000411c:	2140006f          	j	80004330 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    80004120:	01000513          	li	a0,16
    80004124:	ffffe097          	auipc	ra,0xffffe
    80004128:	054080e7          	jalr	84(ra) # 80002178 <_Znwm>
    8000412c:	00050913          	mv	s2,a0
    80004130:	00000593          	li	a1,0
    80004134:	ffffe097          	auipc	ra,0xffffe
    80004138:	2c8080e7          	jalr	712(ra) # 800023fc <_ZN9SemaphoreC1Ej>
    8000413c:	00008797          	auipc	a5,0x8
    80004140:	9127be23          	sd	s2,-1764(a5) # 8000ba58 <_ZL10waitForAll>
    Thread *producers[threadNum];
    80004144:	00399793          	slli	a5,s3,0x3
    80004148:	00f78793          	addi	a5,a5,15
    8000414c:	ff07f793          	andi	a5,a5,-16
    80004150:	40f10133          	sub	sp,sp,a5
    80004154:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80004158:	0019871b          	addiw	a4,s3,1
    8000415c:	00171793          	slli	a5,a4,0x1
    80004160:	00e787b3          	add	a5,a5,a4
    80004164:	00379793          	slli	a5,a5,0x3
    80004168:	00f78793          	addi	a5,a5,15
    8000416c:	ff07f793          	andi	a5,a5,-16
    80004170:	40f10133          	sub	sp,sp,a5
    80004174:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80004178:	00199493          	slli	s1,s3,0x1
    8000417c:	013484b3          	add	s1,s1,s3
    80004180:	00349493          	slli	s1,s1,0x3
    80004184:	009b04b3          	add	s1,s6,s1
    80004188:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    8000418c:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80004190:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004194:	02800513          	li	a0,40
    80004198:	ffffe097          	auipc	ra,0xffffe
    8000419c:	fe0080e7          	jalr	-32(ra) # 80002178 <_Znwm>
    800041a0:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    800041a4:	ffffe097          	auipc	ra,0xffffe
    800041a8:	234080e7          	jalr	564(ra) # 800023d8 <_ZN6ThreadC1Ev>
    800041ac:	00007797          	auipc	a5,0x7
    800041b0:	71478793          	addi	a5,a5,1812 # 8000b8c0 <_ZTV8Consumer+0x10>
    800041b4:	00fbb023          	sd	a5,0(s7)
    800041b8:	029bb023          	sd	s1,32(s7)
    consumer->start();
    800041bc:	000b8513          	mv	a0,s7
    800041c0:	ffffe097          	auipc	ra,0xffffe
    800041c4:	150080e7          	jalr	336(ra) # 80002310 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    800041c8:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    800041cc:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    800041d0:	00008797          	auipc	a5,0x8
    800041d4:	8887b783          	ld	a5,-1912(a5) # 8000ba58 <_ZL10waitForAll>
    800041d8:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800041dc:	02800513          	li	a0,40
    800041e0:	ffffe097          	auipc	ra,0xffffe
    800041e4:	f98080e7          	jalr	-104(ra) # 80002178 <_Znwm>
    800041e8:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    800041ec:	ffffe097          	auipc	ra,0xffffe
    800041f0:	1ec080e7          	jalr	492(ra) # 800023d8 <_ZN6ThreadC1Ev>
    800041f4:	00007797          	auipc	a5,0x7
    800041f8:	67c78793          	addi	a5,a5,1660 # 8000b870 <_ZTV16ProducerKeyborad+0x10>
    800041fc:	00f4b023          	sd	a5,0(s1)
    80004200:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004204:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80004208:	00048513          	mv	a0,s1
    8000420c:	ffffe097          	auipc	ra,0xffffe
    80004210:	104080e7          	jalr	260(ra) # 80002310 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004214:	00100913          	li	s2,1
    80004218:	0300006f          	j	80004248 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    8000421c:	00007797          	auipc	a5,0x7
    80004220:	67c78793          	addi	a5,a5,1660 # 8000b898 <_ZTV8Producer+0x10>
    80004224:	00fcb023          	sd	a5,0(s9)
    80004228:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    8000422c:	00391793          	slli	a5,s2,0x3
    80004230:	00fa07b3          	add	a5,s4,a5
    80004234:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80004238:	000c8513          	mv	a0,s9
    8000423c:	ffffe097          	auipc	ra,0xffffe
    80004240:	0d4080e7          	jalr	212(ra) # 80002310 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004244:	0019091b          	addiw	s2,s2,1
    80004248:	05395263          	bge	s2,s3,8000428c <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    8000424c:	00191493          	slli	s1,s2,0x1
    80004250:	012484b3          	add	s1,s1,s2
    80004254:	00349493          	slli	s1,s1,0x3
    80004258:	009b04b3          	add	s1,s6,s1
    8000425c:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80004260:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80004264:	00007797          	auipc	a5,0x7
    80004268:	7f47b783          	ld	a5,2036(a5) # 8000ba58 <_ZL10waitForAll>
    8000426c:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80004270:	02800513          	li	a0,40
    80004274:	ffffe097          	auipc	ra,0xffffe
    80004278:	f04080e7          	jalr	-252(ra) # 80002178 <_Znwm>
    8000427c:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004280:	ffffe097          	auipc	ra,0xffffe
    80004284:	158080e7          	jalr	344(ra) # 800023d8 <_ZN6ThreadC1Ev>
    80004288:	f95ff06f          	j	8000421c <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    8000428c:	ffffe097          	auipc	ra,0xffffe
    80004290:	0e8080e7          	jalr	232(ra) # 80002374 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80004294:	00000493          	li	s1,0
    80004298:	0099ce63          	blt	s3,s1,800042b4 <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    8000429c:	00007517          	auipc	a0,0x7
    800042a0:	7bc53503          	ld	a0,1980(a0) # 8000ba58 <_ZL10waitForAll>
    800042a4:	ffffe097          	auipc	ra,0xffffe
    800042a8:	190080e7          	jalr	400(ra) # 80002434 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    800042ac:	0014849b          	addiw	s1,s1,1
    800042b0:	fe9ff06f          	j	80004298 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    800042b4:	00007517          	auipc	a0,0x7
    800042b8:	7a453503          	ld	a0,1956(a0) # 8000ba58 <_ZL10waitForAll>
    800042bc:	00050863          	beqz	a0,800042cc <_Z20testConsumerProducerv+0x2f4>
    800042c0:	00053783          	ld	a5,0(a0)
    800042c4:	0087b783          	ld	a5,8(a5)
    800042c8:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    800042cc:	00000493          	li	s1,0
    800042d0:	0080006f          	j	800042d8 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    800042d4:	0014849b          	addiw	s1,s1,1
    800042d8:	0334d263          	bge	s1,s3,800042fc <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    800042dc:	00349793          	slli	a5,s1,0x3
    800042e0:	00fa07b3          	add	a5,s4,a5
    800042e4:	0007b503          	ld	a0,0(a5)
    800042e8:	fe0506e3          	beqz	a0,800042d4 <_Z20testConsumerProducerv+0x2fc>
    800042ec:	00053783          	ld	a5,0(a0)
    800042f0:	0087b783          	ld	a5,8(a5)
    800042f4:	000780e7          	jalr	a5
    800042f8:	fddff06f          	j	800042d4 <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    800042fc:	000b8a63          	beqz	s7,80004310 <_Z20testConsumerProducerv+0x338>
    80004300:	000bb783          	ld	a5,0(s7)
    80004304:	0087b783          	ld	a5,8(a5)
    80004308:	000b8513          	mv	a0,s7
    8000430c:	000780e7          	jalr	a5
    delete buffer;
    80004310:	000a8e63          	beqz	s5,8000432c <_Z20testConsumerProducerv+0x354>
    80004314:	000a8513          	mv	a0,s5
    80004318:	00002097          	auipc	ra,0x2
    8000431c:	870080e7          	jalr	-1936(ra) # 80005b88 <_ZN9BufferCPPD1Ev>
    80004320:	000a8513          	mv	a0,s5
    80004324:	ffffe097          	auipc	ra,0xffffe
    80004328:	ea4080e7          	jalr	-348(ra) # 800021c8 <_ZdlPv>
    8000432c:	000c0113          	mv	sp,s8
}
    80004330:	f8040113          	addi	sp,s0,-128
    80004334:	07813083          	ld	ra,120(sp)
    80004338:	07013403          	ld	s0,112(sp)
    8000433c:	06813483          	ld	s1,104(sp)
    80004340:	06013903          	ld	s2,96(sp)
    80004344:	05813983          	ld	s3,88(sp)
    80004348:	05013a03          	ld	s4,80(sp)
    8000434c:	04813a83          	ld	s5,72(sp)
    80004350:	04013b03          	ld	s6,64(sp)
    80004354:	03813b83          	ld	s7,56(sp)
    80004358:	03013c03          	ld	s8,48(sp)
    8000435c:	02813c83          	ld	s9,40(sp)
    80004360:	08010113          	addi	sp,sp,128
    80004364:	00008067          	ret
    80004368:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    8000436c:	000a8513          	mv	a0,s5
    80004370:	ffffe097          	auipc	ra,0xffffe
    80004374:	e58080e7          	jalr	-424(ra) # 800021c8 <_ZdlPv>
    80004378:	00048513          	mv	a0,s1
    8000437c:	00008097          	auipc	ra,0x8
    80004380:	7dc080e7          	jalr	2012(ra) # 8000cb58 <_Unwind_Resume>
    80004384:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80004388:	00090513          	mv	a0,s2
    8000438c:	ffffe097          	auipc	ra,0xffffe
    80004390:	e3c080e7          	jalr	-452(ra) # 800021c8 <_ZdlPv>
    80004394:	00048513          	mv	a0,s1
    80004398:	00008097          	auipc	ra,0x8
    8000439c:	7c0080e7          	jalr	1984(ra) # 8000cb58 <_Unwind_Resume>
    800043a0:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    800043a4:	000b8513          	mv	a0,s7
    800043a8:	ffffe097          	auipc	ra,0xffffe
    800043ac:	e20080e7          	jalr	-480(ra) # 800021c8 <_ZdlPv>
    800043b0:	00048513          	mv	a0,s1
    800043b4:	00008097          	auipc	ra,0x8
    800043b8:	7a4080e7          	jalr	1956(ra) # 8000cb58 <_Unwind_Resume>
    800043bc:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800043c0:	00048513          	mv	a0,s1
    800043c4:	ffffe097          	auipc	ra,0xffffe
    800043c8:	e04080e7          	jalr	-508(ra) # 800021c8 <_ZdlPv>
    800043cc:	00090513          	mv	a0,s2
    800043d0:	00008097          	auipc	ra,0x8
    800043d4:	788080e7          	jalr	1928(ra) # 8000cb58 <_Unwind_Resume>
    800043d8:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    800043dc:	000c8513          	mv	a0,s9
    800043e0:	ffffe097          	auipc	ra,0xffffe
    800043e4:	de8080e7          	jalr	-536(ra) # 800021c8 <_ZdlPv>
    800043e8:	00048513          	mv	a0,s1
    800043ec:	00008097          	auipc	ra,0x8
    800043f0:	76c080e7          	jalr	1900(ra) # 8000cb58 <_Unwind_Resume>

00000000800043f4 <_ZN8Consumer3runEv>:
    void run() override {
    800043f4:	fd010113          	addi	sp,sp,-48
    800043f8:	02113423          	sd	ra,40(sp)
    800043fc:	02813023          	sd	s0,32(sp)
    80004400:	00913c23          	sd	s1,24(sp)
    80004404:	01213823          	sd	s2,16(sp)
    80004408:	01313423          	sd	s3,8(sp)
    8000440c:	03010413          	addi	s0,sp,48
    80004410:	00050913          	mv	s2,a0
        int i = 0;
    80004414:	00000993          	li	s3,0
    80004418:	0100006f          	j	80004428 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    8000441c:	00a00513          	li	a0,10
    80004420:	ffffe097          	auipc	ra,0xffffe
    80004424:	0e0080e7          	jalr	224(ra) # 80002500 <_ZN7Console4putcEc>
        while (!threadEnd) {
    80004428:	00007797          	auipc	a5,0x7
    8000442c:	6287a783          	lw	a5,1576(a5) # 8000ba50 <_ZL9threadEnd>
    80004430:	04079a63          	bnez	a5,80004484 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80004434:	02093783          	ld	a5,32(s2)
    80004438:	0087b503          	ld	a0,8(a5)
    8000443c:	00001097          	auipc	ra,0x1
    80004440:	638080e7          	jalr	1592(ra) # 80005a74 <_ZN9BufferCPP3getEv>
            i++;
    80004444:	0019849b          	addiw	s1,s3,1
    80004448:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    8000444c:	0ff57513          	andi	a0,a0,255
    80004450:	ffffe097          	auipc	ra,0xffffe
    80004454:	0b0080e7          	jalr	176(ra) # 80002500 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80004458:	05000793          	li	a5,80
    8000445c:	02f4e4bb          	remw	s1,s1,a5
    80004460:	fc0494e3          	bnez	s1,80004428 <_ZN8Consumer3runEv+0x34>
    80004464:	fb9ff06f          	j	8000441c <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80004468:	02093783          	ld	a5,32(s2)
    8000446c:	0087b503          	ld	a0,8(a5)
    80004470:	00001097          	auipc	ra,0x1
    80004474:	604080e7          	jalr	1540(ra) # 80005a74 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80004478:	0ff57513          	andi	a0,a0,255
    8000447c:	ffffe097          	auipc	ra,0xffffe
    80004480:	084080e7          	jalr	132(ra) # 80002500 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80004484:	02093783          	ld	a5,32(s2)
    80004488:	0087b503          	ld	a0,8(a5)
    8000448c:	00001097          	auipc	ra,0x1
    80004490:	674080e7          	jalr	1652(ra) # 80005b00 <_ZN9BufferCPP6getCntEv>
    80004494:	fca04ae3          	bgtz	a0,80004468 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80004498:	02093783          	ld	a5,32(s2)
    8000449c:	0107b503          	ld	a0,16(a5)
    800044a0:	ffffe097          	auipc	ra,0xffffe
    800044a4:	fc0080e7          	jalr	-64(ra) # 80002460 <_ZN9Semaphore6signalEv>
    }
    800044a8:	02813083          	ld	ra,40(sp)
    800044ac:	02013403          	ld	s0,32(sp)
    800044b0:	01813483          	ld	s1,24(sp)
    800044b4:	01013903          	ld	s2,16(sp)
    800044b8:	00813983          	ld	s3,8(sp)
    800044bc:	03010113          	addi	sp,sp,48
    800044c0:	00008067          	ret

00000000800044c4 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    800044c4:	ff010113          	addi	sp,sp,-16
    800044c8:	00113423          	sd	ra,8(sp)
    800044cc:	00813023          	sd	s0,0(sp)
    800044d0:	01010413          	addi	s0,sp,16
    800044d4:	00007797          	auipc	a5,0x7
    800044d8:	3ec78793          	addi	a5,a5,1004 # 8000b8c0 <_ZTV8Consumer+0x10>
    800044dc:	00f53023          	sd	a5,0(a0)
    800044e0:	ffffe097          	auipc	ra,0xffffe
    800044e4:	c08080e7          	jalr	-1016(ra) # 800020e8 <_ZN6ThreadD1Ev>
    800044e8:	00813083          	ld	ra,8(sp)
    800044ec:	00013403          	ld	s0,0(sp)
    800044f0:	01010113          	addi	sp,sp,16
    800044f4:	00008067          	ret

00000000800044f8 <_ZN8ConsumerD0Ev>:
    800044f8:	fe010113          	addi	sp,sp,-32
    800044fc:	00113c23          	sd	ra,24(sp)
    80004500:	00813823          	sd	s0,16(sp)
    80004504:	00913423          	sd	s1,8(sp)
    80004508:	02010413          	addi	s0,sp,32
    8000450c:	00050493          	mv	s1,a0
    80004510:	00007797          	auipc	a5,0x7
    80004514:	3b078793          	addi	a5,a5,944 # 8000b8c0 <_ZTV8Consumer+0x10>
    80004518:	00f53023          	sd	a5,0(a0)
    8000451c:	ffffe097          	auipc	ra,0xffffe
    80004520:	bcc080e7          	jalr	-1076(ra) # 800020e8 <_ZN6ThreadD1Ev>
    80004524:	00048513          	mv	a0,s1
    80004528:	ffffe097          	auipc	ra,0xffffe
    8000452c:	ca0080e7          	jalr	-864(ra) # 800021c8 <_ZdlPv>
    80004530:	01813083          	ld	ra,24(sp)
    80004534:	01013403          	ld	s0,16(sp)
    80004538:	00813483          	ld	s1,8(sp)
    8000453c:	02010113          	addi	sp,sp,32
    80004540:	00008067          	ret

0000000080004544 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80004544:	ff010113          	addi	sp,sp,-16
    80004548:	00113423          	sd	ra,8(sp)
    8000454c:	00813023          	sd	s0,0(sp)
    80004550:	01010413          	addi	s0,sp,16
    80004554:	00007797          	auipc	a5,0x7
    80004558:	31c78793          	addi	a5,a5,796 # 8000b870 <_ZTV16ProducerKeyborad+0x10>
    8000455c:	00f53023          	sd	a5,0(a0)
    80004560:	ffffe097          	auipc	ra,0xffffe
    80004564:	b88080e7          	jalr	-1144(ra) # 800020e8 <_ZN6ThreadD1Ev>
    80004568:	00813083          	ld	ra,8(sp)
    8000456c:	00013403          	ld	s0,0(sp)
    80004570:	01010113          	addi	sp,sp,16
    80004574:	00008067          	ret

0000000080004578 <_ZN16ProducerKeyboradD0Ev>:
    80004578:	fe010113          	addi	sp,sp,-32
    8000457c:	00113c23          	sd	ra,24(sp)
    80004580:	00813823          	sd	s0,16(sp)
    80004584:	00913423          	sd	s1,8(sp)
    80004588:	02010413          	addi	s0,sp,32
    8000458c:	00050493          	mv	s1,a0
    80004590:	00007797          	auipc	a5,0x7
    80004594:	2e078793          	addi	a5,a5,736 # 8000b870 <_ZTV16ProducerKeyborad+0x10>
    80004598:	00f53023          	sd	a5,0(a0)
    8000459c:	ffffe097          	auipc	ra,0xffffe
    800045a0:	b4c080e7          	jalr	-1204(ra) # 800020e8 <_ZN6ThreadD1Ev>
    800045a4:	00048513          	mv	a0,s1
    800045a8:	ffffe097          	auipc	ra,0xffffe
    800045ac:	c20080e7          	jalr	-992(ra) # 800021c8 <_ZdlPv>
    800045b0:	01813083          	ld	ra,24(sp)
    800045b4:	01013403          	ld	s0,16(sp)
    800045b8:	00813483          	ld	s1,8(sp)
    800045bc:	02010113          	addi	sp,sp,32
    800045c0:	00008067          	ret

00000000800045c4 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    800045c4:	ff010113          	addi	sp,sp,-16
    800045c8:	00113423          	sd	ra,8(sp)
    800045cc:	00813023          	sd	s0,0(sp)
    800045d0:	01010413          	addi	s0,sp,16
    800045d4:	00007797          	auipc	a5,0x7
    800045d8:	2c478793          	addi	a5,a5,708 # 8000b898 <_ZTV8Producer+0x10>
    800045dc:	00f53023          	sd	a5,0(a0)
    800045e0:	ffffe097          	auipc	ra,0xffffe
    800045e4:	b08080e7          	jalr	-1272(ra) # 800020e8 <_ZN6ThreadD1Ev>
    800045e8:	00813083          	ld	ra,8(sp)
    800045ec:	00013403          	ld	s0,0(sp)
    800045f0:	01010113          	addi	sp,sp,16
    800045f4:	00008067          	ret

00000000800045f8 <_ZN8ProducerD0Ev>:
    800045f8:	fe010113          	addi	sp,sp,-32
    800045fc:	00113c23          	sd	ra,24(sp)
    80004600:	00813823          	sd	s0,16(sp)
    80004604:	00913423          	sd	s1,8(sp)
    80004608:	02010413          	addi	s0,sp,32
    8000460c:	00050493          	mv	s1,a0
    80004610:	00007797          	auipc	a5,0x7
    80004614:	28878793          	addi	a5,a5,648 # 8000b898 <_ZTV8Producer+0x10>
    80004618:	00f53023          	sd	a5,0(a0)
    8000461c:	ffffe097          	auipc	ra,0xffffe
    80004620:	acc080e7          	jalr	-1332(ra) # 800020e8 <_ZN6ThreadD1Ev>
    80004624:	00048513          	mv	a0,s1
    80004628:	ffffe097          	auipc	ra,0xffffe
    8000462c:	ba0080e7          	jalr	-1120(ra) # 800021c8 <_ZdlPv>
    80004630:	01813083          	ld	ra,24(sp)
    80004634:	01013403          	ld	s0,16(sp)
    80004638:	00813483          	ld	s1,8(sp)
    8000463c:	02010113          	addi	sp,sp,32
    80004640:	00008067          	ret

0000000080004644 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80004644:	fe010113          	addi	sp,sp,-32
    80004648:	00113c23          	sd	ra,24(sp)
    8000464c:	00813823          	sd	s0,16(sp)
    80004650:	00913423          	sd	s1,8(sp)
    80004654:	02010413          	addi	s0,sp,32
    80004658:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    8000465c:	ffffd097          	auipc	ra,0xffffd
    80004660:	f0c080e7          	jalr	-244(ra) # 80001568 <_Z4getcv>
    80004664:	0005059b          	sext.w	a1,a0
    80004668:	01b00793          	li	a5,27
    8000466c:	00f58c63          	beq	a1,a5,80004684 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80004670:	0204b783          	ld	a5,32(s1)
    80004674:	0087b503          	ld	a0,8(a5)
    80004678:	00001097          	auipc	ra,0x1
    8000467c:	36c080e7          	jalr	876(ra) # 800059e4 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80004680:	fddff06f          	j	8000465c <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80004684:	00100793          	li	a5,1
    80004688:	00007717          	auipc	a4,0x7
    8000468c:	3cf72423          	sw	a5,968(a4) # 8000ba50 <_ZL9threadEnd>
        td->buffer->put('!');
    80004690:	0204b783          	ld	a5,32(s1)
    80004694:	02100593          	li	a1,33
    80004698:	0087b503          	ld	a0,8(a5)
    8000469c:	00001097          	auipc	ra,0x1
    800046a0:	348080e7          	jalr	840(ra) # 800059e4 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    800046a4:	0204b783          	ld	a5,32(s1)
    800046a8:	0107b503          	ld	a0,16(a5)
    800046ac:	ffffe097          	auipc	ra,0xffffe
    800046b0:	db4080e7          	jalr	-588(ra) # 80002460 <_ZN9Semaphore6signalEv>
    }
    800046b4:	01813083          	ld	ra,24(sp)
    800046b8:	01013403          	ld	s0,16(sp)
    800046bc:	00813483          	ld	s1,8(sp)
    800046c0:	02010113          	addi	sp,sp,32
    800046c4:	00008067          	ret

00000000800046c8 <_ZN8Producer3runEv>:
    void run() override {
    800046c8:	fe010113          	addi	sp,sp,-32
    800046cc:	00113c23          	sd	ra,24(sp)
    800046d0:	00813823          	sd	s0,16(sp)
    800046d4:	00913423          	sd	s1,8(sp)
    800046d8:	01213023          	sd	s2,0(sp)
    800046dc:	02010413          	addi	s0,sp,32
    800046e0:	00050493          	mv	s1,a0
        int i = 0;
    800046e4:	00000913          	li	s2,0
        while (!threadEnd) {
    800046e8:	00007797          	auipc	a5,0x7
    800046ec:	3687a783          	lw	a5,872(a5) # 8000ba50 <_ZL9threadEnd>
    800046f0:	04079263          	bnez	a5,80004734 <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    800046f4:	0204b783          	ld	a5,32(s1)
    800046f8:	0007a583          	lw	a1,0(a5)
    800046fc:	0305859b          	addiw	a1,a1,48
    80004700:	0087b503          	ld	a0,8(a5)
    80004704:	00001097          	auipc	ra,0x1
    80004708:	2e0080e7          	jalr	736(ra) # 800059e4 <_ZN9BufferCPP3putEi>
            i++;
    8000470c:	0019071b          	addiw	a4,s2,1
    80004710:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    80004714:	0204b783          	ld	a5,32(s1)
    80004718:	0007a783          	lw	a5,0(a5)
    8000471c:	00e787bb          	addw	a5,a5,a4
    80004720:	00500513          	li	a0,5
    80004724:	02a7e53b          	remw	a0,a5,a0
    80004728:	ffffe097          	auipc	ra,0xffffe
    8000472c:	c74080e7          	jalr	-908(ra) # 8000239c <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80004730:	fb9ff06f          	j	800046e8 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80004734:	0204b783          	ld	a5,32(s1)
    80004738:	0107b503          	ld	a0,16(a5)
    8000473c:	ffffe097          	auipc	ra,0xffffe
    80004740:	d24080e7          	jalr	-732(ra) # 80002460 <_ZN9Semaphore6signalEv>
    }
    80004744:	01813083          	ld	ra,24(sp)
    80004748:	01013403          	ld	s0,16(sp)
    8000474c:	00813483          	ld	s1,8(sp)
    80004750:	00013903          	ld	s2,0(sp)
    80004754:	02010113          	addi	sp,sp,32
    80004758:	00008067          	ret

000000008000475c <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    8000475c:	fe010113          	addi	sp,sp,-32
    80004760:	00113c23          	sd	ra,24(sp)
    80004764:	00813823          	sd	s0,16(sp)
    80004768:	00913423          	sd	s1,8(sp)
    8000476c:	01213023          	sd	s2,0(sp)
    80004770:	02010413          	addi	s0,sp,32
    80004774:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004778:	00100793          	li	a5,1
    8000477c:	02a7f863          	bgeu	a5,a0,800047ac <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004780:	00a00793          	li	a5,10
    80004784:	02f577b3          	remu	a5,a0,a5
    80004788:	02078e63          	beqz	a5,800047c4 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    8000478c:	fff48513          	addi	a0,s1,-1
    80004790:	00000097          	auipc	ra,0x0
    80004794:	fcc080e7          	jalr	-52(ra) # 8000475c <_ZL9fibonaccim>
    80004798:	00050913          	mv	s2,a0
    8000479c:	ffe48513          	addi	a0,s1,-2
    800047a0:	00000097          	auipc	ra,0x0
    800047a4:	fbc080e7          	jalr	-68(ra) # 8000475c <_ZL9fibonaccim>
    800047a8:	00a90533          	add	a0,s2,a0
}
    800047ac:	01813083          	ld	ra,24(sp)
    800047b0:	01013403          	ld	s0,16(sp)
    800047b4:	00813483          	ld	s1,8(sp)
    800047b8:	00013903          	ld	s2,0(sp)
    800047bc:	02010113          	addi	sp,sp,32
    800047c0:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800047c4:	ffffd097          	auipc	ra,0xffffd
    800047c8:	c64080e7          	jalr	-924(ra) # 80001428 <_Z15thread_dispatchv>
    800047cc:	fc1ff06f          	j	8000478c <_ZL9fibonaccim+0x30>

00000000800047d0 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    800047d0:	fe010113          	addi	sp,sp,-32
    800047d4:	00113c23          	sd	ra,24(sp)
    800047d8:	00813823          	sd	s0,16(sp)
    800047dc:	00913423          	sd	s1,8(sp)
    800047e0:	01213023          	sd	s2,0(sp)
    800047e4:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800047e8:	00a00493          	li	s1,10
    800047ec:	0400006f          	j	8000482c <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800047f0:	00005517          	auipc	a0,0x5
    800047f4:	bd850513          	addi	a0,a0,-1064 # 800093c8 <CONSOLE_STATUS+0x3b8>
    800047f8:	00001097          	auipc	ra,0x1
    800047fc:	dc8080e7          	jalr	-568(ra) # 800055c0 <_Z11printStringPKc>
    80004800:	00000613          	li	a2,0
    80004804:	00a00593          	li	a1,10
    80004808:	00048513          	mv	a0,s1
    8000480c:	00001097          	auipc	ra,0x1
    80004810:	f64080e7          	jalr	-156(ra) # 80005770 <_Z8printIntiii>
    80004814:	00005517          	auipc	a0,0x5
    80004818:	da450513          	addi	a0,a0,-604 # 800095b8 <CONSOLE_STATUS+0x5a8>
    8000481c:	00001097          	auipc	ra,0x1
    80004820:	da4080e7          	jalr	-604(ra) # 800055c0 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004824:	0014849b          	addiw	s1,s1,1
    80004828:	0ff4f493          	andi	s1,s1,255
    8000482c:	00c00793          	li	a5,12
    80004830:	fc97f0e3          	bgeu	a5,s1,800047f0 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80004834:	00005517          	auipc	a0,0x5
    80004838:	b9c50513          	addi	a0,a0,-1124 # 800093d0 <CONSOLE_STATUS+0x3c0>
    8000483c:	00001097          	auipc	ra,0x1
    80004840:	d84080e7          	jalr	-636(ra) # 800055c0 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004844:	00500313          	li	t1,5
    thread_dispatch();
    80004848:	ffffd097          	auipc	ra,0xffffd
    8000484c:	be0080e7          	jalr	-1056(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004850:	01000513          	li	a0,16
    80004854:	00000097          	auipc	ra,0x0
    80004858:	f08080e7          	jalr	-248(ra) # 8000475c <_ZL9fibonaccim>
    8000485c:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004860:	00005517          	auipc	a0,0x5
    80004864:	b8050513          	addi	a0,a0,-1152 # 800093e0 <CONSOLE_STATUS+0x3d0>
    80004868:	00001097          	auipc	ra,0x1
    8000486c:	d58080e7          	jalr	-680(ra) # 800055c0 <_Z11printStringPKc>
    80004870:	00000613          	li	a2,0
    80004874:	00a00593          	li	a1,10
    80004878:	0009051b          	sext.w	a0,s2
    8000487c:	00001097          	auipc	ra,0x1
    80004880:	ef4080e7          	jalr	-268(ra) # 80005770 <_Z8printIntiii>
    80004884:	00005517          	auipc	a0,0x5
    80004888:	d3450513          	addi	a0,a0,-716 # 800095b8 <CONSOLE_STATUS+0x5a8>
    8000488c:	00001097          	auipc	ra,0x1
    80004890:	d34080e7          	jalr	-716(ra) # 800055c0 <_Z11printStringPKc>
    80004894:	0400006f          	j	800048d4 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004898:	00005517          	auipc	a0,0x5
    8000489c:	b3050513          	addi	a0,a0,-1232 # 800093c8 <CONSOLE_STATUS+0x3b8>
    800048a0:	00001097          	auipc	ra,0x1
    800048a4:	d20080e7          	jalr	-736(ra) # 800055c0 <_Z11printStringPKc>
    800048a8:	00000613          	li	a2,0
    800048ac:	00a00593          	li	a1,10
    800048b0:	00048513          	mv	a0,s1
    800048b4:	00001097          	auipc	ra,0x1
    800048b8:	ebc080e7          	jalr	-324(ra) # 80005770 <_Z8printIntiii>
    800048bc:	00005517          	auipc	a0,0x5
    800048c0:	cfc50513          	addi	a0,a0,-772 # 800095b8 <CONSOLE_STATUS+0x5a8>
    800048c4:	00001097          	auipc	ra,0x1
    800048c8:	cfc080e7          	jalr	-772(ra) # 800055c0 <_Z11printStringPKc>
    for (; i < 16; i++) {
    800048cc:	0014849b          	addiw	s1,s1,1
    800048d0:	0ff4f493          	andi	s1,s1,255
    800048d4:	00f00793          	li	a5,15
    800048d8:	fc97f0e3          	bgeu	a5,s1,80004898 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    800048dc:	00005517          	auipc	a0,0x5
    800048e0:	b1450513          	addi	a0,a0,-1260 # 800093f0 <CONSOLE_STATUS+0x3e0>
    800048e4:	00001097          	auipc	ra,0x1
    800048e8:	cdc080e7          	jalr	-804(ra) # 800055c0 <_Z11printStringPKc>
    finishedD = true;
    800048ec:	00100793          	li	a5,1
    800048f0:	00007717          	auipc	a4,0x7
    800048f4:	16f70823          	sb	a5,368(a4) # 8000ba60 <_ZL9finishedD>
    thread_dispatch();
    800048f8:	ffffd097          	auipc	ra,0xffffd
    800048fc:	b30080e7          	jalr	-1232(ra) # 80001428 <_Z15thread_dispatchv>
}
    80004900:	01813083          	ld	ra,24(sp)
    80004904:	01013403          	ld	s0,16(sp)
    80004908:	00813483          	ld	s1,8(sp)
    8000490c:	00013903          	ld	s2,0(sp)
    80004910:	02010113          	addi	sp,sp,32
    80004914:	00008067          	ret

0000000080004918 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80004918:	fe010113          	addi	sp,sp,-32
    8000491c:	00113c23          	sd	ra,24(sp)
    80004920:	00813823          	sd	s0,16(sp)
    80004924:	00913423          	sd	s1,8(sp)
    80004928:	01213023          	sd	s2,0(sp)
    8000492c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004930:	00000493          	li	s1,0
    80004934:	0400006f          	j	80004974 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80004938:	00005517          	auipc	a0,0x5
    8000493c:	a6050513          	addi	a0,a0,-1440 # 80009398 <CONSOLE_STATUS+0x388>
    80004940:	00001097          	auipc	ra,0x1
    80004944:	c80080e7          	jalr	-896(ra) # 800055c0 <_Z11printStringPKc>
    80004948:	00000613          	li	a2,0
    8000494c:	00a00593          	li	a1,10
    80004950:	00048513          	mv	a0,s1
    80004954:	00001097          	auipc	ra,0x1
    80004958:	e1c080e7          	jalr	-484(ra) # 80005770 <_Z8printIntiii>
    8000495c:	00005517          	auipc	a0,0x5
    80004960:	c5c50513          	addi	a0,a0,-932 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80004964:	00001097          	auipc	ra,0x1
    80004968:	c5c080e7          	jalr	-932(ra) # 800055c0 <_Z11printStringPKc>
    for (; i < 3; i++) {
    8000496c:	0014849b          	addiw	s1,s1,1
    80004970:	0ff4f493          	andi	s1,s1,255
    80004974:	00200793          	li	a5,2
    80004978:	fc97f0e3          	bgeu	a5,s1,80004938 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    8000497c:	00005517          	auipc	a0,0x5
    80004980:	a2450513          	addi	a0,a0,-1500 # 800093a0 <CONSOLE_STATUS+0x390>
    80004984:	00001097          	auipc	ra,0x1
    80004988:	c3c080e7          	jalr	-964(ra) # 800055c0 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    8000498c:	00700313          	li	t1,7
    thread_dispatch();
    80004990:	ffffd097          	auipc	ra,0xffffd
    80004994:	a98080e7          	jalr	-1384(ra) # 80001428 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004998:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    8000499c:	00005517          	auipc	a0,0x5
    800049a0:	a1450513          	addi	a0,a0,-1516 # 800093b0 <CONSOLE_STATUS+0x3a0>
    800049a4:	00001097          	auipc	ra,0x1
    800049a8:	c1c080e7          	jalr	-996(ra) # 800055c0 <_Z11printStringPKc>
    800049ac:	00000613          	li	a2,0
    800049b0:	00a00593          	li	a1,10
    800049b4:	0009051b          	sext.w	a0,s2
    800049b8:	00001097          	auipc	ra,0x1
    800049bc:	db8080e7          	jalr	-584(ra) # 80005770 <_Z8printIntiii>
    800049c0:	00005517          	auipc	a0,0x5
    800049c4:	bf850513          	addi	a0,a0,-1032 # 800095b8 <CONSOLE_STATUS+0x5a8>
    800049c8:	00001097          	auipc	ra,0x1
    800049cc:	bf8080e7          	jalr	-1032(ra) # 800055c0 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    800049d0:	00c00513          	li	a0,12
    800049d4:	00000097          	auipc	ra,0x0
    800049d8:	d88080e7          	jalr	-632(ra) # 8000475c <_ZL9fibonaccim>
    800049dc:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800049e0:	00005517          	auipc	a0,0x5
    800049e4:	9d850513          	addi	a0,a0,-1576 # 800093b8 <CONSOLE_STATUS+0x3a8>
    800049e8:	00001097          	auipc	ra,0x1
    800049ec:	bd8080e7          	jalr	-1064(ra) # 800055c0 <_Z11printStringPKc>
    800049f0:	00000613          	li	a2,0
    800049f4:	00a00593          	li	a1,10
    800049f8:	0009051b          	sext.w	a0,s2
    800049fc:	00001097          	auipc	ra,0x1
    80004a00:	d74080e7          	jalr	-652(ra) # 80005770 <_Z8printIntiii>
    80004a04:	00005517          	auipc	a0,0x5
    80004a08:	bb450513          	addi	a0,a0,-1100 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80004a0c:	00001097          	auipc	ra,0x1
    80004a10:	bb4080e7          	jalr	-1100(ra) # 800055c0 <_Z11printStringPKc>
    80004a14:	0400006f          	j	80004a54 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80004a18:	00005517          	auipc	a0,0x5
    80004a1c:	98050513          	addi	a0,a0,-1664 # 80009398 <CONSOLE_STATUS+0x388>
    80004a20:	00001097          	auipc	ra,0x1
    80004a24:	ba0080e7          	jalr	-1120(ra) # 800055c0 <_Z11printStringPKc>
    80004a28:	00000613          	li	a2,0
    80004a2c:	00a00593          	li	a1,10
    80004a30:	00048513          	mv	a0,s1
    80004a34:	00001097          	auipc	ra,0x1
    80004a38:	d3c080e7          	jalr	-708(ra) # 80005770 <_Z8printIntiii>
    80004a3c:	00005517          	auipc	a0,0x5
    80004a40:	b7c50513          	addi	a0,a0,-1156 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80004a44:	00001097          	auipc	ra,0x1
    80004a48:	b7c080e7          	jalr	-1156(ra) # 800055c0 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004a4c:	0014849b          	addiw	s1,s1,1
    80004a50:	0ff4f493          	andi	s1,s1,255
    80004a54:	00500793          	li	a5,5
    80004a58:	fc97f0e3          	bgeu	a5,s1,80004a18 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80004a5c:	00005517          	auipc	a0,0x5
    80004a60:	91450513          	addi	a0,a0,-1772 # 80009370 <CONSOLE_STATUS+0x360>
    80004a64:	00001097          	auipc	ra,0x1
    80004a68:	b5c080e7          	jalr	-1188(ra) # 800055c0 <_Z11printStringPKc>
    finishedC = true;
    80004a6c:	00100793          	li	a5,1
    80004a70:	00007717          	auipc	a4,0x7
    80004a74:	fef708a3          	sb	a5,-15(a4) # 8000ba61 <_ZL9finishedC>
    thread_dispatch();
    80004a78:	ffffd097          	auipc	ra,0xffffd
    80004a7c:	9b0080e7          	jalr	-1616(ra) # 80001428 <_Z15thread_dispatchv>
}
    80004a80:	01813083          	ld	ra,24(sp)
    80004a84:	01013403          	ld	s0,16(sp)
    80004a88:	00813483          	ld	s1,8(sp)
    80004a8c:	00013903          	ld	s2,0(sp)
    80004a90:	02010113          	addi	sp,sp,32
    80004a94:	00008067          	ret

0000000080004a98 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80004a98:	fe010113          	addi	sp,sp,-32
    80004a9c:	00113c23          	sd	ra,24(sp)
    80004aa0:	00813823          	sd	s0,16(sp)
    80004aa4:	00913423          	sd	s1,8(sp)
    80004aa8:	01213023          	sd	s2,0(sp)
    80004aac:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80004ab0:	00000913          	li	s2,0
    80004ab4:	0380006f          	j	80004aec <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80004ab8:	ffffd097          	auipc	ra,0xffffd
    80004abc:	970080e7          	jalr	-1680(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004ac0:	00148493          	addi	s1,s1,1
    80004ac4:	000027b7          	lui	a5,0x2
    80004ac8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004acc:	0097ee63          	bltu	a5,s1,80004ae8 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004ad0:	00000713          	li	a4,0
    80004ad4:	000077b7          	lui	a5,0x7
    80004ad8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004adc:	fce7eee3          	bltu	a5,a4,80004ab8 <_ZL11workerBodyBPv+0x20>
    80004ae0:	00170713          	addi	a4,a4,1
    80004ae4:	ff1ff06f          	j	80004ad4 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80004ae8:	00190913          	addi	s2,s2,1
    80004aec:	00f00793          	li	a5,15
    80004af0:	0527e063          	bltu	a5,s2,80004b30 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80004af4:	00005517          	auipc	a0,0x5
    80004af8:	88c50513          	addi	a0,a0,-1908 # 80009380 <CONSOLE_STATUS+0x370>
    80004afc:	00001097          	auipc	ra,0x1
    80004b00:	ac4080e7          	jalr	-1340(ra) # 800055c0 <_Z11printStringPKc>
    80004b04:	00000613          	li	a2,0
    80004b08:	00a00593          	li	a1,10
    80004b0c:	0009051b          	sext.w	a0,s2
    80004b10:	00001097          	auipc	ra,0x1
    80004b14:	c60080e7          	jalr	-928(ra) # 80005770 <_Z8printIntiii>
    80004b18:	00005517          	auipc	a0,0x5
    80004b1c:	aa050513          	addi	a0,a0,-1376 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80004b20:	00001097          	auipc	ra,0x1
    80004b24:	aa0080e7          	jalr	-1376(ra) # 800055c0 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004b28:	00000493          	li	s1,0
    80004b2c:	f99ff06f          	j	80004ac4 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80004b30:	00005517          	auipc	a0,0x5
    80004b34:	85850513          	addi	a0,a0,-1960 # 80009388 <CONSOLE_STATUS+0x378>
    80004b38:	00001097          	auipc	ra,0x1
    80004b3c:	a88080e7          	jalr	-1400(ra) # 800055c0 <_Z11printStringPKc>
    finishedB = true;
    80004b40:	00100793          	li	a5,1
    80004b44:	00007717          	auipc	a4,0x7
    80004b48:	f0f70f23          	sb	a5,-226(a4) # 8000ba62 <_ZL9finishedB>
    thread_dispatch();
    80004b4c:	ffffd097          	auipc	ra,0xffffd
    80004b50:	8dc080e7          	jalr	-1828(ra) # 80001428 <_Z15thread_dispatchv>
}
    80004b54:	01813083          	ld	ra,24(sp)
    80004b58:	01013403          	ld	s0,16(sp)
    80004b5c:	00813483          	ld	s1,8(sp)
    80004b60:	00013903          	ld	s2,0(sp)
    80004b64:	02010113          	addi	sp,sp,32
    80004b68:	00008067          	ret

0000000080004b6c <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80004b6c:	fe010113          	addi	sp,sp,-32
    80004b70:	00113c23          	sd	ra,24(sp)
    80004b74:	00813823          	sd	s0,16(sp)
    80004b78:	00913423          	sd	s1,8(sp)
    80004b7c:	01213023          	sd	s2,0(sp)
    80004b80:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80004b84:	00000913          	li	s2,0
    80004b88:	0380006f          	j	80004bc0 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80004b8c:	ffffd097          	auipc	ra,0xffffd
    80004b90:	89c080e7          	jalr	-1892(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004b94:	00148493          	addi	s1,s1,1
    80004b98:	000027b7          	lui	a5,0x2
    80004b9c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004ba0:	0097ee63          	bltu	a5,s1,80004bbc <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004ba4:	00000713          	li	a4,0
    80004ba8:	000077b7          	lui	a5,0x7
    80004bac:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004bb0:	fce7eee3          	bltu	a5,a4,80004b8c <_ZL11workerBodyAPv+0x20>
    80004bb4:	00170713          	addi	a4,a4,1
    80004bb8:	ff1ff06f          	j	80004ba8 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80004bbc:	00190913          	addi	s2,s2,1
    80004bc0:	00900793          	li	a5,9
    80004bc4:	0527e063          	bltu	a5,s2,80004c04 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80004bc8:	00004517          	auipc	a0,0x4
    80004bcc:	7a050513          	addi	a0,a0,1952 # 80009368 <CONSOLE_STATUS+0x358>
    80004bd0:	00001097          	auipc	ra,0x1
    80004bd4:	9f0080e7          	jalr	-1552(ra) # 800055c0 <_Z11printStringPKc>
    80004bd8:	00000613          	li	a2,0
    80004bdc:	00a00593          	li	a1,10
    80004be0:	0009051b          	sext.w	a0,s2
    80004be4:	00001097          	auipc	ra,0x1
    80004be8:	b8c080e7          	jalr	-1140(ra) # 80005770 <_Z8printIntiii>
    80004bec:	00005517          	auipc	a0,0x5
    80004bf0:	9cc50513          	addi	a0,a0,-1588 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80004bf4:	00001097          	auipc	ra,0x1
    80004bf8:	9cc080e7          	jalr	-1588(ra) # 800055c0 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004bfc:	00000493          	li	s1,0
    80004c00:	f99ff06f          	j	80004b98 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80004c04:	00004517          	auipc	a0,0x4
    80004c08:	76c50513          	addi	a0,a0,1900 # 80009370 <CONSOLE_STATUS+0x360>
    80004c0c:	00001097          	auipc	ra,0x1
    80004c10:	9b4080e7          	jalr	-1612(ra) # 800055c0 <_Z11printStringPKc>
    finishedA = true;
    80004c14:	00100793          	li	a5,1
    80004c18:	00007717          	auipc	a4,0x7
    80004c1c:	e4f705a3          	sb	a5,-437(a4) # 8000ba63 <_ZL9finishedA>
}
    80004c20:	01813083          	ld	ra,24(sp)
    80004c24:	01013403          	ld	s0,16(sp)
    80004c28:	00813483          	ld	s1,8(sp)
    80004c2c:	00013903          	ld	s2,0(sp)
    80004c30:	02010113          	addi	sp,sp,32
    80004c34:	00008067          	ret

0000000080004c38 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80004c38:	fd010113          	addi	sp,sp,-48
    80004c3c:	02113423          	sd	ra,40(sp)
    80004c40:	02813023          	sd	s0,32(sp)
    80004c44:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80004c48:	00000613          	li	a2,0
    80004c4c:	00000597          	auipc	a1,0x0
    80004c50:	f2058593          	addi	a1,a1,-224 # 80004b6c <_ZL11workerBodyAPv>
    80004c54:	fd040513          	addi	a0,s0,-48
    80004c58:	ffffc097          	auipc	ra,0xffffc
    80004c5c:	728080e7          	jalr	1832(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80004c60:	00004517          	auipc	a0,0x4
    80004c64:	7a050513          	addi	a0,a0,1952 # 80009400 <CONSOLE_STATUS+0x3f0>
    80004c68:	00001097          	auipc	ra,0x1
    80004c6c:	958080e7          	jalr	-1704(ra) # 800055c0 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80004c70:	00000613          	li	a2,0
    80004c74:	00000597          	auipc	a1,0x0
    80004c78:	e2458593          	addi	a1,a1,-476 # 80004a98 <_ZL11workerBodyBPv>
    80004c7c:	fd840513          	addi	a0,s0,-40
    80004c80:	ffffc097          	auipc	ra,0xffffc
    80004c84:	700080e7          	jalr	1792(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80004c88:	00004517          	auipc	a0,0x4
    80004c8c:	79050513          	addi	a0,a0,1936 # 80009418 <CONSOLE_STATUS+0x408>
    80004c90:	00001097          	auipc	ra,0x1
    80004c94:	930080e7          	jalr	-1744(ra) # 800055c0 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80004c98:	00000613          	li	a2,0
    80004c9c:	00000597          	auipc	a1,0x0
    80004ca0:	c7c58593          	addi	a1,a1,-900 # 80004918 <_ZL11workerBodyCPv>
    80004ca4:	fe040513          	addi	a0,s0,-32
    80004ca8:	ffffc097          	auipc	ra,0xffffc
    80004cac:	6d8080e7          	jalr	1752(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80004cb0:	00004517          	auipc	a0,0x4
    80004cb4:	78050513          	addi	a0,a0,1920 # 80009430 <CONSOLE_STATUS+0x420>
    80004cb8:	00001097          	auipc	ra,0x1
    80004cbc:	908080e7          	jalr	-1784(ra) # 800055c0 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80004cc0:	00000613          	li	a2,0
    80004cc4:	00000597          	auipc	a1,0x0
    80004cc8:	b0c58593          	addi	a1,a1,-1268 # 800047d0 <_ZL11workerBodyDPv>
    80004ccc:	fe840513          	addi	a0,s0,-24
    80004cd0:	ffffc097          	auipc	ra,0xffffc
    80004cd4:	6b0080e7          	jalr	1712(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80004cd8:	00004517          	auipc	a0,0x4
    80004cdc:	77050513          	addi	a0,a0,1904 # 80009448 <CONSOLE_STATUS+0x438>
    80004ce0:	00001097          	auipc	ra,0x1
    80004ce4:	8e0080e7          	jalr	-1824(ra) # 800055c0 <_Z11printStringPKc>
    80004ce8:	00c0006f          	j	80004cf4 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80004cec:	ffffc097          	auipc	ra,0xffffc
    80004cf0:	73c080e7          	jalr	1852(ra) # 80001428 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80004cf4:	00007797          	auipc	a5,0x7
    80004cf8:	d6f7c783          	lbu	a5,-657(a5) # 8000ba63 <_ZL9finishedA>
    80004cfc:	fe0788e3          	beqz	a5,80004cec <_Z18Threads_C_API_testv+0xb4>
    80004d00:	00007797          	auipc	a5,0x7
    80004d04:	d627c783          	lbu	a5,-670(a5) # 8000ba62 <_ZL9finishedB>
    80004d08:	fe0782e3          	beqz	a5,80004cec <_Z18Threads_C_API_testv+0xb4>
    80004d0c:	00007797          	auipc	a5,0x7
    80004d10:	d557c783          	lbu	a5,-683(a5) # 8000ba61 <_ZL9finishedC>
    80004d14:	fc078ce3          	beqz	a5,80004cec <_Z18Threads_C_API_testv+0xb4>
    80004d18:	00007797          	auipc	a5,0x7
    80004d1c:	d487c783          	lbu	a5,-696(a5) # 8000ba60 <_ZL9finishedD>
    80004d20:	fc0786e3          	beqz	a5,80004cec <_Z18Threads_C_API_testv+0xb4>
    }

}
    80004d24:	02813083          	ld	ra,40(sp)
    80004d28:	02013403          	ld	s0,32(sp)
    80004d2c:	03010113          	addi	sp,sp,48
    80004d30:	00008067          	ret

0000000080004d34 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80004d34:	fd010113          	addi	sp,sp,-48
    80004d38:	02113423          	sd	ra,40(sp)
    80004d3c:	02813023          	sd	s0,32(sp)
    80004d40:	00913c23          	sd	s1,24(sp)
    80004d44:	01213823          	sd	s2,16(sp)
    80004d48:	01313423          	sd	s3,8(sp)
    80004d4c:	03010413          	addi	s0,sp,48
    80004d50:	00050993          	mv	s3,a0
    80004d54:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80004d58:	00000913          	li	s2,0
    80004d5c:	00c0006f          	j	80004d68 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80004d60:	ffffd097          	auipc	ra,0xffffd
    80004d64:	614080e7          	jalr	1556(ra) # 80002374 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80004d68:	ffffd097          	auipc	ra,0xffffd
    80004d6c:	800080e7          	jalr	-2048(ra) # 80001568 <_Z4getcv>
    80004d70:	0005059b          	sext.w	a1,a0
    80004d74:	01b00793          	li	a5,27
    80004d78:	02f58a63          	beq	a1,a5,80004dac <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80004d7c:	0084b503          	ld	a0,8(s1)
    80004d80:	00001097          	auipc	ra,0x1
    80004d84:	c64080e7          	jalr	-924(ra) # 800059e4 <_ZN9BufferCPP3putEi>
        i++;
    80004d88:	0019071b          	addiw	a4,s2,1
    80004d8c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80004d90:	0004a683          	lw	a3,0(s1)
    80004d94:	0026979b          	slliw	a5,a3,0x2
    80004d98:	00d787bb          	addw	a5,a5,a3
    80004d9c:	0017979b          	slliw	a5,a5,0x1
    80004da0:	02f767bb          	remw	a5,a4,a5
    80004da4:	fc0792e3          	bnez	a5,80004d68 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    80004da8:	fb9ff06f          	j	80004d60 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80004dac:	00100793          	li	a5,1
    80004db0:	00007717          	auipc	a4,0x7
    80004db4:	caf72c23          	sw	a5,-840(a4) # 8000ba68 <_ZL9threadEnd>
    td->buffer->put('!');
    80004db8:	0209b783          	ld	a5,32(s3)
    80004dbc:	02100593          	li	a1,33
    80004dc0:	0087b503          	ld	a0,8(a5)
    80004dc4:	00001097          	auipc	ra,0x1
    80004dc8:	c20080e7          	jalr	-992(ra) # 800059e4 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80004dcc:	0104b503          	ld	a0,16(s1)
    80004dd0:	ffffd097          	auipc	ra,0xffffd
    80004dd4:	690080e7          	jalr	1680(ra) # 80002460 <_ZN9Semaphore6signalEv>
}
    80004dd8:	02813083          	ld	ra,40(sp)
    80004ddc:	02013403          	ld	s0,32(sp)
    80004de0:	01813483          	ld	s1,24(sp)
    80004de4:	01013903          	ld	s2,16(sp)
    80004de8:	00813983          	ld	s3,8(sp)
    80004dec:	03010113          	addi	sp,sp,48
    80004df0:	00008067          	ret

0000000080004df4 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    80004df4:	fe010113          	addi	sp,sp,-32
    80004df8:	00113c23          	sd	ra,24(sp)
    80004dfc:	00813823          	sd	s0,16(sp)
    80004e00:	00913423          	sd	s1,8(sp)
    80004e04:	01213023          	sd	s2,0(sp)
    80004e08:	02010413          	addi	s0,sp,32
    80004e0c:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80004e10:	00000913          	li	s2,0
    80004e14:	00c0006f          	j	80004e20 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80004e18:	ffffd097          	auipc	ra,0xffffd
    80004e1c:	55c080e7          	jalr	1372(ra) # 80002374 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80004e20:	00007797          	auipc	a5,0x7
    80004e24:	c487a783          	lw	a5,-952(a5) # 8000ba68 <_ZL9threadEnd>
    80004e28:	02079e63          	bnez	a5,80004e64 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80004e2c:	0004a583          	lw	a1,0(s1)
    80004e30:	0305859b          	addiw	a1,a1,48
    80004e34:	0084b503          	ld	a0,8(s1)
    80004e38:	00001097          	auipc	ra,0x1
    80004e3c:	bac080e7          	jalr	-1108(ra) # 800059e4 <_ZN9BufferCPP3putEi>
        i++;
    80004e40:	0019071b          	addiw	a4,s2,1
    80004e44:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80004e48:	0004a683          	lw	a3,0(s1)
    80004e4c:	0026979b          	slliw	a5,a3,0x2
    80004e50:	00d787bb          	addw	a5,a5,a3
    80004e54:	0017979b          	slliw	a5,a5,0x1
    80004e58:	02f767bb          	remw	a5,a4,a5
    80004e5c:	fc0792e3          	bnez	a5,80004e20 <_ZN12ProducerSync8producerEPv+0x2c>
    80004e60:	fb9ff06f          	j	80004e18 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80004e64:	0104b503          	ld	a0,16(s1)
    80004e68:	ffffd097          	auipc	ra,0xffffd
    80004e6c:	5f8080e7          	jalr	1528(ra) # 80002460 <_ZN9Semaphore6signalEv>
}
    80004e70:	01813083          	ld	ra,24(sp)
    80004e74:	01013403          	ld	s0,16(sp)
    80004e78:	00813483          	ld	s1,8(sp)
    80004e7c:	00013903          	ld	s2,0(sp)
    80004e80:	02010113          	addi	sp,sp,32
    80004e84:	00008067          	ret

0000000080004e88 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80004e88:	fd010113          	addi	sp,sp,-48
    80004e8c:	02113423          	sd	ra,40(sp)
    80004e90:	02813023          	sd	s0,32(sp)
    80004e94:	00913c23          	sd	s1,24(sp)
    80004e98:	01213823          	sd	s2,16(sp)
    80004e9c:	01313423          	sd	s3,8(sp)
    80004ea0:	01413023          	sd	s4,0(sp)
    80004ea4:	03010413          	addi	s0,sp,48
    80004ea8:	00050993          	mv	s3,a0
    80004eac:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80004eb0:	00000a13          	li	s4,0
    80004eb4:	01c0006f          	j	80004ed0 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80004eb8:	ffffd097          	auipc	ra,0xffffd
    80004ebc:	4bc080e7          	jalr	1212(ra) # 80002374 <_ZN6Thread8dispatchEv>
    80004ec0:	0500006f          	j	80004f10 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80004ec4:	00a00513          	li	a0,10
    80004ec8:	ffffc097          	auipc	ra,0xffffc
    80004ecc:	6c8080e7          	jalr	1736(ra) # 80001590 <_Z4putcc>
    while (!threadEnd) {
    80004ed0:	00007797          	auipc	a5,0x7
    80004ed4:	b987a783          	lw	a5,-1128(a5) # 8000ba68 <_ZL9threadEnd>
    80004ed8:	06079263          	bnez	a5,80004f3c <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80004edc:	00893503          	ld	a0,8(s2)
    80004ee0:	00001097          	auipc	ra,0x1
    80004ee4:	b94080e7          	jalr	-1132(ra) # 80005a74 <_ZN9BufferCPP3getEv>
        i++;
    80004ee8:	001a049b          	addiw	s1,s4,1
    80004eec:	00048a1b          	sext.w	s4,s1
        putc(key);
    80004ef0:	0ff57513          	andi	a0,a0,255
    80004ef4:	ffffc097          	auipc	ra,0xffffc
    80004ef8:	69c080e7          	jalr	1692(ra) # 80001590 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80004efc:	00092703          	lw	a4,0(s2)
    80004f00:	0027179b          	slliw	a5,a4,0x2
    80004f04:	00e787bb          	addw	a5,a5,a4
    80004f08:	02f4e7bb          	remw	a5,s1,a5
    80004f0c:	fa0786e3          	beqz	a5,80004eb8 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80004f10:	05000793          	li	a5,80
    80004f14:	02f4e4bb          	remw	s1,s1,a5
    80004f18:	fa049ce3          	bnez	s1,80004ed0 <_ZN12ConsumerSync8consumerEPv+0x48>
    80004f1c:	fa9ff06f          	j	80004ec4 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80004f20:	0209b783          	ld	a5,32(s3)
    80004f24:	0087b503          	ld	a0,8(a5)
    80004f28:	00001097          	auipc	ra,0x1
    80004f2c:	b4c080e7          	jalr	-1204(ra) # 80005a74 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80004f30:	0ff57513          	andi	a0,a0,255
    80004f34:	ffffd097          	auipc	ra,0xffffd
    80004f38:	5cc080e7          	jalr	1484(ra) # 80002500 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80004f3c:	0209b783          	ld	a5,32(s3)
    80004f40:	0087b503          	ld	a0,8(a5)
    80004f44:	00001097          	auipc	ra,0x1
    80004f48:	bbc080e7          	jalr	-1092(ra) # 80005b00 <_ZN9BufferCPP6getCntEv>
    80004f4c:	fca04ae3          	bgtz	a0,80004f20 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80004f50:	01093503          	ld	a0,16(s2)
    80004f54:	ffffd097          	auipc	ra,0xffffd
    80004f58:	50c080e7          	jalr	1292(ra) # 80002460 <_ZN9Semaphore6signalEv>
}
    80004f5c:	02813083          	ld	ra,40(sp)
    80004f60:	02013403          	ld	s0,32(sp)
    80004f64:	01813483          	ld	s1,24(sp)
    80004f68:	01013903          	ld	s2,16(sp)
    80004f6c:	00813983          	ld	s3,8(sp)
    80004f70:	00013a03          	ld	s4,0(sp)
    80004f74:	03010113          	addi	sp,sp,48
    80004f78:	00008067          	ret

0000000080004f7c <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80004f7c:	f8010113          	addi	sp,sp,-128
    80004f80:	06113c23          	sd	ra,120(sp)
    80004f84:	06813823          	sd	s0,112(sp)
    80004f88:	06913423          	sd	s1,104(sp)
    80004f8c:	07213023          	sd	s2,96(sp)
    80004f90:	05313c23          	sd	s3,88(sp)
    80004f94:	05413823          	sd	s4,80(sp)
    80004f98:	05513423          	sd	s5,72(sp)
    80004f9c:	05613023          	sd	s6,64(sp)
    80004fa0:	03713c23          	sd	s7,56(sp)
    80004fa4:	03813823          	sd	s8,48(sp)
    80004fa8:	03913423          	sd	s9,40(sp)
    80004fac:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80004fb0:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80004fb4:	00004517          	auipc	a0,0x4
    80004fb8:	2cc50513          	addi	a0,a0,716 # 80009280 <CONSOLE_STATUS+0x270>
    80004fbc:	00000097          	auipc	ra,0x0
    80004fc0:	604080e7          	jalr	1540(ra) # 800055c0 <_Z11printStringPKc>
    getString(input, 30);
    80004fc4:	01e00593          	li	a1,30
    80004fc8:	f8040493          	addi	s1,s0,-128
    80004fcc:	00048513          	mv	a0,s1
    80004fd0:	00000097          	auipc	ra,0x0
    80004fd4:	678080e7          	jalr	1656(ra) # 80005648 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80004fd8:	00048513          	mv	a0,s1
    80004fdc:	00000097          	auipc	ra,0x0
    80004fe0:	744080e7          	jalr	1860(ra) # 80005720 <_Z11stringToIntPKc>
    80004fe4:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80004fe8:	00004517          	auipc	a0,0x4
    80004fec:	2b850513          	addi	a0,a0,696 # 800092a0 <CONSOLE_STATUS+0x290>
    80004ff0:	00000097          	auipc	ra,0x0
    80004ff4:	5d0080e7          	jalr	1488(ra) # 800055c0 <_Z11printStringPKc>
    getString(input, 30);
    80004ff8:	01e00593          	li	a1,30
    80004ffc:	00048513          	mv	a0,s1
    80005000:	00000097          	auipc	ra,0x0
    80005004:	648080e7          	jalr	1608(ra) # 80005648 <_Z9getStringPci>
    n = stringToInt(input);
    80005008:	00048513          	mv	a0,s1
    8000500c:	00000097          	auipc	ra,0x0
    80005010:	714080e7          	jalr	1812(ra) # 80005720 <_Z11stringToIntPKc>
    80005014:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80005018:	00004517          	auipc	a0,0x4
    8000501c:	2a850513          	addi	a0,a0,680 # 800092c0 <CONSOLE_STATUS+0x2b0>
    80005020:	00000097          	auipc	ra,0x0
    80005024:	5a0080e7          	jalr	1440(ra) # 800055c0 <_Z11printStringPKc>
    80005028:	00000613          	li	a2,0
    8000502c:	00a00593          	li	a1,10
    80005030:	00090513          	mv	a0,s2
    80005034:	00000097          	auipc	ra,0x0
    80005038:	73c080e7          	jalr	1852(ra) # 80005770 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    8000503c:	00004517          	auipc	a0,0x4
    80005040:	29c50513          	addi	a0,a0,668 # 800092d8 <CONSOLE_STATUS+0x2c8>
    80005044:	00000097          	auipc	ra,0x0
    80005048:	57c080e7          	jalr	1404(ra) # 800055c0 <_Z11printStringPKc>
    8000504c:	00000613          	li	a2,0
    80005050:	00a00593          	li	a1,10
    80005054:	00048513          	mv	a0,s1
    80005058:	00000097          	auipc	ra,0x0
    8000505c:	718080e7          	jalr	1816(ra) # 80005770 <_Z8printIntiii>
    printString(".\n");
    80005060:	00004517          	auipc	a0,0x4
    80005064:	29050513          	addi	a0,a0,656 # 800092f0 <CONSOLE_STATUS+0x2e0>
    80005068:	00000097          	auipc	ra,0x0
    8000506c:	558080e7          	jalr	1368(ra) # 800055c0 <_Z11printStringPKc>
    if(threadNum > n) {
    80005070:	0324c463          	blt	s1,s2,80005098 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80005074:	03205c63          	blez	s2,800050ac <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80005078:	03800513          	li	a0,56
    8000507c:	ffffd097          	auipc	ra,0xffffd
    80005080:	0fc080e7          	jalr	252(ra) # 80002178 <_Znwm>
    80005084:	00050a93          	mv	s5,a0
    80005088:	00048593          	mv	a1,s1
    8000508c:	00001097          	auipc	ra,0x1
    80005090:	804080e7          	jalr	-2044(ra) # 80005890 <_ZN9BufferCPPC1Ei>
    80005094:	0300006f          	j	800050c4 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80005098:	00004517          	auipc	a0,0x4
    8000509c:	26050513          	addi	a0,a0,608 # 800092f8 <CONSOLE_STATUS+0x2e8>
    800050a0:	00000097          	auipc	ra,0x0
    800050a4:	520080e7          	jalr	1312(ra) # 800055c0 <_Z11printStringPKc>
        return;
    800050a8:	0140006f          	j	800050bc <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800050ac:	00004517          	auipc	a0,0x4
    800050b0:	28c50513          	addi	a0,a0,652 # 80009338 <CONSOLE_STATUS+0x328>
    800050b4:	00000097          	auipc	ra,0x0
    800050b8:	50c080e7          	jalr	1292(ra) # 800055c0 <_Z11printStringPKc>
        return;
    800050bc:	000b8113          	mv	sp,s7
    800050c0:	2380006f          	j	800052f8 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    800050c4:	01000513          	li	a0,16
    800050c8:	ffffd097          	auipc	ra,0xffffd
    800050cc:	0b0080e7          	jalr	176(ra) # 80002178 <_Znwm>
    800050d0:	00050493          	mv	s1,a0
    800050d4:	00000593          	li	a1,0
    800050d8:	ffffd097          	auipc	ra,0xffffd
    800050dc:	324080e7          	jalr	804(ra) # 800023fc <_ZN9SemaphoreC1Ej>
    800050e0:	00007797          	auipc	a5,0x7
    800050e4:	9897b823          	sd	s1,-1648(a5) # 8000ba70 <_ZL10waitForAll>
    Thread* threads[threadNum];
    800050e8:	00391793          	slli	a5,s2,0x3
    800050ec:	00f78793          	addi	a5,a5,15
    800050f0:	ff07f793          	andi	a5,a5,-16
    800050f4:	40f10133          	sub	sp,sp,a5
    800050f8:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    800050fc:	0019071b          	addiw	a4,s2,1
    80005100:	00171793          	slli	a5,a4,0x1
    80005104:	00e787b3          	add	a5,a5,a4
    80005108:	00379793          	slli	a5,a5,0x3
    8000510c:	00f78793          	addi	a5,a5,15
    80005110:	ff07f793          	andi	a5,a5,-16
    80005114:	40f10133          	sub	sp,sp,a5
    80005118:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    8000511c:	00191c13          	slli	s8,s2,0x1
    80005120:	012c07b3          	add	a5,s8,s2
    80005124:	00379793          	slli	a5,a5,0x3
    80005128:	00fa07b3          	add	a5,s4,a5
    8000512c:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80005130:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80005134:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80005138:	02800513          	li	a0,40
    8000513c:	ffffd097          	auipc	ra,0xffffd
    80005140:	03c080e7          	jalr	60(ra) # 80002178 <_Znwm>
    80005144:	00050b13          	mv	s6,a0
    80005148:	012c0c33          	add	s8,s8,s2
    8000514c:	003c1c13          	slli	s8,s8,0x3
    80005150:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80005154:	ffffd097          	auipc	ra,0xffffd
    80005158:	284080e7          	jalr	644(ra) # 800023d8 <_ZN6ThreadC1Ev>
    8000515c:	00006797          	auipc	a5,0x6
    80005160:	7dc78793          	addi	a5,a5,2012 # 8000b938 <_ZTV12ConsumerSync+0x10>
    80005164:	00fb3023          	sd	a5,0(s6)
    80005168:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    8000516c:	000b0513          	mv	a0,s6
    80005170:	ffffd097          	auipc	ra,0xffffd
    80005174:	1a0080e7          	jalr	416(ra) # 80002310 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005178:	00000493          	li	s1,0
    8000517c:	0380006f          	j	800051b4 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005180:	00006797          	auipc	a5,0x6
    80005184:	79078793          	addi	a5,a5,1936 # 8000b910 <_ZTV12ProducerSync+0x10>
    80005188:	00fcb023          	sd	a5,0(s9)
    8000518c:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80005190:	00349793          	slli	a5,s1,0x3
    80005194:	00f987b3          	add	a5,s3,a5
    80005198:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    8000519c:	00349793          	slli	a5,s1,0x3
    800051a0:	00f987b3          	add	a5,s3,a5
    800051a4:	0007b503          	ld	a0,0(a5)
    800051a8:	ffffd097          	auipc	ra,0xffffd
    800051ac:	168080e7          	jalr	360(ra) # 80002310 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    800051b0:	0014849b          	addiw	s1,s1,1
    800051b4:	0b24d063          	bge	s1,s2,80005254 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    800051b8:	00149793          	slli	a5,s1,0x1
    800051bc:	009787b3          	add	a5,a5,s1
    800051c0:	00379793          	slli	a5,a5,0x3
    800051c4:	00fa07b3          	add	a5,s4,a5
    800051c8:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800051cc:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    800051d0:	00007717          	auipc	a4,0x7
    800051d4:	8a073703          	ld	a4,-1888(a4) # 8000ba70 <_ZL10waitForAll>
    800051d8:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    800051dc:	02905863          	blez	s1,8000520c <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    800051e0:	02800513          	li	a0,40
    800051e4:	ffffd097          	auipc	ra,0xffffd
    800051e8:	f94080e7          	jalr	-108(ra) # 80002178 <_Znwm>
    800051ec:	00050c93          	mv	s9,a0
    800051f0:	00149c13          	slli	s8,s1,0x1
    800051f4:	009c0c33          	add	s8,s8,s1
    800051f8:	003c1c13          	slli	s8,s8,0x3
    800051fc:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005200:	ffffd097          	auipc	ra,0xffffd
    80005204:	1d8080e7          	jalr	472(ra) # 800023d8 <_ZN6ThreadC1Ev>
    80005208:	f79ff06f          	j	80005180 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    8000520c:	02800513          	li	a0,40
    80005210:	ffffd097          	auipc	ra,0xffffd
    80005214:	f68080e7          	jalr	-152(ra) # 80002178 <_Znwm>
    80005218:	00050c93          	mv	s9,a0
    8000521c:	00149c13          	slli	s8,s1,0x1
    80005220:	009c0c33          	add	s8,s8,s1
    80005224:	003c1c13          	slli	s8,s8,0x3
    80005228:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    8000522c:	ffffd097          	auipc	ra,0xffffd
    80005230:	1ac080e7          	jalr	428(ra) # 800023d8 <_ZN6ThreadC1Ev>
    80005234:	00006797          	auipc	a5,0x6
    80005238:	6b478793          	addi	a5,a5,1716 # 8000b8e8 <_ZTV16ProducerKeyboard+0x10>
    8000523c:	00fcb023          	sd	a5,0(s9)
    80005240:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80005244:	00349793          	slli	a5,s1,0x3
    80005248:	00f987b3          	add	a5,s3,a5
    8000524c:	0197b023          	sd	s9,0(a5)
    80005250:	f4dff06f          	j	8000519c <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80005254:	ffffd097          	auipc	ra,0xffffd
    80005258:	120080e7          	jalr	288(ra) # 80002374 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    8000525c:	00000493          	li	s1,0
    80005260:	00994e63          	blt	s2,s1,8000527c <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80005264:	00007517          	auipc	a0,0x7
    80005268:	80c53503          	ld	a0,-2036(a0) # 8000ba70 <_ZL10waitForAll>
    8000526c:	ffffd097          	auipc	ra,0xffffd
    80005270:	1c8080e7          	jalr	456(ra) # 80002434 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80005274:	0014849b          	addiw	s1,s1,1
    80005278:	fe9ff06f          	j	80005260 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    8000527c:	00000493          	li	s1,0
    80005280:	0080006f          	j	80005288 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80005284:	0014849b          	addiw	s1,s1,1
    80005288:	0324d263          	bge	s1,s2,800052ac <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    8000528c:	00349793          	slli	a5,s1,0x3
    80005290:	00f987b3          	add	a5,s3,a5
    80005294:	0007b503          	ld	a0,0(a5)
    80005298:	fe0506e3          	beqz	a0,80005284 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    8000529c:	00053783          	ld	a5,0(a0)
    800052a0:	0087b783          	ld	a5,8(a5)
    800052a4:	000780e7          	jalr	a5
    800052a8:	fddff06f          	j	80005284 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    800052ac:	000b0a63          	beqz	s6,800052c0 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    800052b0:	000b3783          	ld	a5,0(s6)
    800052b4:	0087b783          	ld	a5,8(a5)
    800052b8:	000b0513          	mv	a0,s6
    800052bc:	000780e7          	jalr	a5
    delete waitForAll;
    800052c0:	00006517          	auipc	a0,0x6
    800052c4:	7b053503          	ld	a0,1968(a0) # 8000ba70 <_ZL10waitForAll>
    800052c8:	00050863          	beqz	a0,800052d8 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    800052cc:	00053783          	ld	a5,0(a0)
    800052d0:	0087b783          	ld	a5,8(a5)
    800052d4:	000780e7          	jalr	a5
    delete buffer;
    800052d8:	000a8e63          	beqz	s5,800052f4 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    800052dc:	000a8513          	mv	a0,s5
    800052e0:	00001097          	auipc	ra,0x1
    800052e4:	8a8080e7          	jalr	-1880(ra) # 80005b88 <_ZN9BufferCPPD1Ev>
    800052e8:	000a8513          	mv	a0,s5
    800052ec:	ffffd097          	auipc	ra,0xffffd
    800052f0:	edc080e7          	jalr	-292(ra) # 800021c8 <_ZdlPv>
    800052f4:	000b8113          	mv	sp,s7

}
    800052f8:	f8040113          	addi	sp,s0,-128
    800052fc:	07813083          	ld	ra,120(sp)
    80005300:	07013403          	ld	s0,112(sp)
    80005304:	06813483          	ld	s1,104(sp)
    80005308:	06013903          	ld	s2,96(sp)
    8000530c:	05813983          	ld	s3,88(sp)
    80005310:	05013a03          	ld	s4,80(sp)
    80005314:	04813a83          	ld	s5,72(sp)
    80005318:	04013b03          	ld	s6,64(sp)
    8000531c:	03813b83          	ld	s7,56(sp)
    80005320:	03013c03          	ld	s8,48(sp)
    80005324:	02813c83          	ld	s9,40(sp)
    80005328:	08010113          	addi	sp,sp,128
    8000532c:	00008067          	ret
    80005330:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80005334:	000a8513          	mv	a0,s5
    80005338:	ffffd097          	auipc	ra,0xffffd
    8000533c:	e90080e7          	jalr	-368(ra) # 800021c8 <_ZdlPv>
    80005340:	00048513          	mv	a0,s1
    80005344:	00008097          	auipc	ra,0x8
    80005348:	814080e7          	jalr	-2028(ra) # 8000cb58 <_Unwind_Resume>
    8000534c:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80005350:	00048513          	mv	a0,s1
    80005354:	ffffd097          	auipc	ra,0xffffd
    80005358:	e74080e7          	jalr	-396(ra) # 800021c8 <_ZdlPv>
    8000535c:	00090513          	mv	a0,s2
    80005360:	00007097          	auipc	ra,0x7
    80005364:	7f8080e7          	jalr	2040(ra) # 8000cb58 <_Unwind_Resume>
    80005368:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    8000536c:	000b0513          	mv	a0,s6
    80005370:	ffffd097          	auipc	ra,0xffffd
    80005374:	e58080e7          	jalr	-424(ra) # 800021c8 <_ZdlPv>
    80005378:	00048513          	mv	a0,s1
    8000537c:	00007097          	auipc	ra,0x7
    80005380:	7dc080e7          	jalr	2012(ra) # 8000cb58 <_Unwind_Resume>
    80005384:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80005388:	000c8513          	mv	a0,s9
    8000538c:	ffffd097          	auipc	ra,0xffffd
    80005390:	e3c080e7          	jalr	-452(ra) # 800021c8 <_ZdlPv>
    80005394:	00048513          	mv	a0,s1
    80005398:	00007097          	auipc	ra,0x7
    8000539c:	7c0080e7          	jalr	1984(ra) # 8000cb58 <_Unwind_Resume>
    800053a0:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    800053a4:	000c8513          	mv	a0,s9
    800053a8:	ffffd097          	auipc	ra,0xffffd
    800053ac:	e20080e7          	jalr	-480(ra) # 800021c8 <_ZdlPv>
    800053b0:	00048513          	mv	a0,s1
    800053b4:	00007097          	auipc	ra,0x7
    800053b8:	7a4080e7          	jalr	1956(ra) # 8000cb58 <_Unwind_Resume>

00000000800053bc <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    800053bc:	ff010113          	addi	sp,sp,-16
    800053c0:	00113423          	sd	ra,8(sp)
    800053c4:	00813023          	sd	s0,0(sp)
    800053c8:	01010413          	addi	s0,sp,16
    800053cc:	00006797          	auipc	a5,0x6
    800053d0:	56c78793          	addi	a5,a5,1388 # 8000b938 <_ZTV12ConsumerSync+0x10>
    800053d4:	00f53023          	sd	a5,0(a0)
    800053d8:	ffffd097          	auipc	ra,0xffffd
    800053dc:	d10080e7          	jalr	-752(ra) # 800020e8 <_ZN6ThreadD1Ev>
    800053e0:	00813083          	ld	ra,8(sp)
    800053e4:	00013403          	ld	s0,0(sp)
    800053e8:	01010113          	addi	sp,sp,16
    800053ec:	00008067          	ret

00000000800053f0 <_ZN12ConsumerSyncD0Ev>:
    800053f0:	fe010113          	addi	sp,sp,-32
    800053f4:	00113c23          	sd	ra,24(sp)
    800053f8:	00813823          	sd	s0,16(sp)
    800053fc:	00913423          	sd	s1,8(sp)
    80005400:	02010413          	addi	s0,sp,32
    80005404:	00050493          	mv	s1,a0
    80005408:	00006797          	auipc	a5,0x6
    8000540c:	53078793          	addi	a5,a5,1328 # 8000b938 <_ZTV12ConsumerSync+0x10>
    80005410:	00f53023          	sd	a5,0(a0)
    80005414:	ffffd097          	auipc	ra,0xffffd
    80005418:	cd4080e7          	jalr	-812(ra) # 800020e8 <_ZN6ThreadD1Ev>
    8000541c:	00048513          	mv	a0,s1
    80005420:	ffffd097          	auipc	ra,0xffffd
    80005424:	da8080e7          	jalr	-600(ra) # 800021c8 <_ZdlPv>
    80005428:	01813083          	ld	ra,24(sp)
    8000542c:	01013403          	ld	s0,16(sp)
    80005430:	00813483          	ld	s1,8(sp)
    80005434:	02010113          	addi	sp,sp,32
    80005438:	00008067          	ret

000000008000543c <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    8000543c:	ff010113          	addi	sp,sp,-16
    80005440:	00113423          	sd	ra,8(sp)
    80005444:	00813023          	sd	s0,0(sp)
    80005448:	01010413          	addi	s0,sp,16
    8000544c:	00006797          	auipc	a5,0x6
    80005450:	4c478793          	addi	a5,a5,1220 # 8000b910 <_ZTV12ProducerSync+0x10>
    80005454:	00f53023          	sd	a5,0(a0)
    80005458:	ffffd097          	auipc	ra,0xffffd
    8000545c:	c90080e7          	jalr	-880(ra) # 800020e8 <_ZN6ThreadD1Ev>
    80005460:	00813083          	ld	ra,8(sp)
    80005464:	00013403          	ld	s0,0(sp)
    80005468:	01010113          	addi	sp,sp,16
    8000546c:	00008067          	ret

0000000080005470 <_ZN12ProducerSyncD0Ev>:
    80005470:	fe010113          	addi	sp,sp,-32
    80005474:	00113c23          	sd	ra,24(sp)
    80005478:	00813823          	sd	s0,16(sp)
    8000547c:	00913423          	sd	s1,8(sp)
    80005480:	02010413          	addi	s0,sp,32
    80005484:	00050493          	mv	s1,a0
    80005488:	00006797          	auipc	a5,0x6
    8000548c:	48878793          	addi	a5,a5,1160 # 8000b910 <_ZTV12ProducerSync+0x10>
    80005490:	00f53023          	sd	a5,0(a0)
    80005494:	ffffd097          	auipc	ra,0xffffd
    80005498:	c54080e7          	jalr	-940(ra) # 800020e8 <_ZN6ThreadD1Ev>
    8000549c:	00048513          	mv	a0,s1
    800054a0:	ffffd097          	auipc	ra,0xffffd
    800054a4:	d28080e7          	jalr	-728(ra) # 800021c8 <_ZdlPv>
    800054a8:	01813083          	ld	ra,24(sp)
    800054ac:	01013403          	ld	s0,16(sp)
    800054b0:	00813483          	ld	s1,8(sp)
    800054b4:	02010113          	addi	sp,sp,32
    800054b8:	00008067          	ret

00000000800054bc <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    800054bc:	ff010113          	addi	sp,sp,-16
    800054c0:	00113423          	sd	ra,8(sp)
    800054c4:	00813023          	sd	s0,0(sp)
    800054c8:	01010413          	addi	s0,sp,16
    800054cc:	00006797          	auipc	a5,0x6
    800054d0:	41c78793          	addi	a5,a5,1052 # 8000b8e8 <_ZTV16ProducerKeyboard+0x10>
    800054d4:	00f53023          	sd	a5,0(a0)
    800054d8:	ffffd097          	auipc	ra,0xffffd
    800054dc:	c10080e7          	jalr	-1008(ra) # 800020e8 <_ZN6ThreadD1Ev>
    800054e0:	00813083          	ld	ra,8(sp)
    800054e4:	00013403          	ld	s0,0(sp)
    800054e8:	01010113          	addi	sp,sp,16
    800054ec:	00008067          	ret

00000000800054f0 <_ZN16ProducerKeyboardD0Ev>:
    800054f0:	fe010113          	addi	sp,sp,-32
    800054f4:	00113c23          	sd	ra,24(sp)
    800054f8:	00813823          	sd	s0,16(sp)
    800054fc:	00913423          	sd	s1,8(sp)
    80005500:	02010413          	addi	s0,sp,32
    80005504:	00050493          	mv	s1,a0
    80005508:	00006797          	auipc	a5,0x6
    8000550c:	3e078793          	addi	a5,a5,992 # 8000b8e8 <_ZTV16ProducerKeyboard+0x10>
    80005510:	00f53023          	sd	a5,0(a0)
    80005514:	ffffd097          	auipc	ra,0xffffd
    80005518:	bd4080e7          	jalr	-1068(ra) # 800020e8 <_ZN6ThreadD1Ev>
    8000551c:	00048513          	mv	a0,s1
    80005520:	ffffd097          	auipc	ra,0xffffd
    80005524:	ca8080e7          	jalr	-856(ra) # 800021c8 <_ZdlPv>
    80005528:	01813083          	ld	ra,24(sp)
    8000552c:	01013403          	ld	s0,16(sp)
    80005530:	00813483          	ld	s1,8(sp)
    80005534:	02010113          	addi	sp,sp,32
    80005538:	00008067          	ret

000000008000553c <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    8000553c:	ff010113          	addi	sp,sp,-16
    80005540:	00113423          	sd	ra,8(sp)
    80005544:	00813023          	sd	s0,0(sp)
    80005548:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    8000554c:	02053583          	ld	a1,32(a0)
    80005550:	fffff097          	auipc	ra,0xfffff
    80005554:	7e4080e7          	jalr	2020(ra) # 80004d34 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80005558:	00813083          	ld	ra,8(sp)
    8000555c:	00013403          	ld	s0,0(sp)
    80005560:	01010113          	addi	sp,sp,16
    80005564:	00008067          	ret

0000000080005568 <_ZN12ProducerSync3runEv>:
    void run() override {
    80005568:	ff010113          	addi	sp,sp,-16
    8000556c:	00113423          	sd	ra,8(sp)
    80005570:	00813023          	sd	s0,0(sp)
    80005574:	01010413          	addi	s0,sp,16
        producer(td);
    80005578:	02053583          	ld	a1,32(a0)
    8000557c:	00000097          	auipc	ra,0x0
    80005580:	878080e7          	jalr	-1928(ra) # 80004df4 <_ZN12ProducerSync8producerEPv>
    }
    80005584:	00813083          	ld	ra,8(sp)
    80005588:	00013403          	ld	s0,0(sp)
    8000558c:	01010113          	addi	sp,sp,16
    80005590:	00008067          	ret

0000000080005594 <_ZN12ConsumerSync3runEv>:
    void run() override {
    80005594:	ff010113          	addi	sp,sp,-16
    80005598:	00113423          	sd	ra,8(sp)
    8000559c:	00813023          	sd	s0,0(sp)
    800055a0:	01010413          	addi	s0,sp,16
        consumer(td);
    800055a4:	02053583          	ld	a1,32(a0)
    800055a8:	00000097          	auipc	ra,0x0
    800055ac:	8e0080e7          	jalr	-1824(ra) # 80004e88 <_ZN12ConsumerSync8consumerEPv>
    }
    800055b0:	00813083          	ld	ra,8(sp)
    800055b4:	00013403          	ld	s0,0(sp)
    800055b8:	01010113          	addi	sp,sp,16
    800055bc:	00008067          	ret

00000000800055c0 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    800055c0:	fe010113          	addi	sp,sp,-32
    800055c4:	00113c23          	sd	ra,24(sp)
    800055c8:	00813823          	sd	s0,16(sp)
    800055cc:	00913423          	sd	s1,8(sp)
    800055d0:	02010413          	addi	s0,sp,32
    800055d4:	00050493          	mv	s1,a0
    LOCK();
    800055d8:	00100613          	li	a2,1
    800055dc:	00000593          	li	a1,0
    800055e0:	00006517          	auipc	a0,0x6
    800055e4:	49850513          	addi	a0,a0,1176 # 8000ba78 <lockPrint>
    800055e8:	ffffc097          	auipc	ra,0xffffc
    800055ec:	c3c080e7          	jalr	-964(ra) # 80001224 <copy_and_swap>
    800055f0:	00050863          	beqz	a0,80005600 <_Z11printStringPKc+0x40>
    800055f4:	ffffc097          	auipc	ra,0xffffc
    800055f8:	e34080e7          	jalr	-460(ra) # 80001428 <_Z15thread_dispatchv>
    800055fc:	fddff06f          	j	800055d8 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80005600:	0004c503          	lbu	a0,0(s1)
    80005604:	00050a63          	beqz	a0,80005618 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80005608:	ffffc097          	auipc	ra,0xffffc
    8000560c:	f88080e7          	jalr	-120(ra) # 80001590 <_Z4putcc>
        string++;
    80005610:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80005614:	fedff06f          	j	80005600 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80005618:	00000613          	li	a2,0
    8000561c:	00100593          	li	a1,1
    80005620:	00006517          	auipc	a0,0x6
    80005624:	45850513          	addi	a0,a0,1112 # 8000ba78 <lockPrint>
    80005628:	ffffc097          	auipc	ra,0xffffc
    8000562c:	bfc080e7          	jalr	-1028(ra) # 80001224 <copy_and_swap>
    80005630:	fe0514e3          	bnez	a0,80005618 <_Z11printStringPKc+0x58>
}
    80005634:	01813083          	ld	ra,24(sp)
    80005638:	01013403          	ld	s0,16(sp)
    8000563c:	00813483          	ld	s1,8(sp)
    80005640:	02010113          	addi	sp,sp,32
    80005644:	00008067          	ret

0000000080005648 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80005648:	fd010113          	addi	sp,sp,-48
    8000564c:	02113423          	sd	ra,40(sp)
    80005650:	02813023          	sd	s0,32(sp)
    80005654:	00913c23          	sd	s1,24(sp)
    80005658:	01213823          	sd	s2,16(sp)
    8000565c:	01313423          	sd	s3,8(sp)
    80005660:	01413023          	sd	s4,0(sp)
    80005664:	03010413          	addi	s0,sp,48
    80005668:	00050993          	mv	s3,a0
    8000566c:	00058a13          	mv	s4,a1
    LOCK();
    80005670:	00100613          	li	a2,1
    80005674:	00000593          	li	a1,0
    80005678:	00006517          	auipc	a0,0x6
    8000567c:	40050513          	addi	a0,a0,1024 # 8000ba78 <lockPrint>
    80005680:	ffffc097          	auipc	ra,0xffffc
    80005684:	ba4080e7          	jalr	-1116(ra) # 80001224 <copy_and_swap>
    80005688:	00050863          	beqz	a0,80005698 <_Z9getStringPci+0x50>
    8000568c:	ffffc097          	auipc	ra,0xffffc
    80005690:	d9c080e7          	jalr	-612(ra) # 80001428 <_Z15thread_dispatchv>
    80005694:	fddff06f          	j	80005670 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80005698:	00000913          	li	s2,0
    8000569c:	00090493          	mv	s1,s2
    800056a0:	0019091b          	addiw	s2,s2,1
    800056a4:	03495a63          	bge	s2,s4,800056d8 <_Z9getStringPci+0x90>
        cc = getc();
    800056a8:	ffffc097          	auipc	ra,0xffffc
    800056ac:	ec0080e7          	jalr	-320(ra) # 80001568 <_Z4getcv>
        if(cc < 1)
    800056b0:	02050463          	beqz	a0,800056d8 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    800056b4:	009984b3          	add	s1,s3,s1
    800056b8:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    800056bc:	00a00793          	li	a5,10
    800056c0:	00f50a63          	beq	a0,a5,800056d4 <_Z9getStringPci+0x8c>
    800056c4:	00d00793          	li	a5,13
    800056c8:	fcf51ae3          	bne	a0,a5,8000569c <_Z9getStringPci+0x54>
        buf[i++] = c;
    800056cc:	00090493          	mv	s1,s2
    800056d0:	0080006f          	j	800056d8 <_Z9getStringPci+0x90>
    800056d4:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    800056d8:	009984b3          	add	s1,s3,s1
    800056dc:	00048023          	sb	zero,0(s1)

    UNLOCK();
    800056e0:	00000613          	li	a2,0
    800056e4:	00100593          	li	a1,1
    800056e8:	00006517          	auipc	a0,0x6
    800056ec:	39050513          	addi	a0,a0,912 # 8000ba78 <lockPrint>
    800056f0:	ffffc097          	auipc	ra,0xffffc
    800056f4:	b34080e7          	jalr	-1228(ra) # 80001224 <copy_and_swap>
    800056f8:	fe0514e3          	bnez	a0,800056e0 <_Z9getStringPci+0x98>
    return buf;
}
    800056fc:	00098513          	mv	a0,s3
    80005700:	02813083          	ld	ra,40(sp)
    80005704:	02013403          	ld	s0,32(sp)
    80005708:	01813483          	ld	s1,24(sp)
    8000570c:	01013903          	ld	s2,16(sp)
    80005710:	00813983          	ld	s3,8(sp)
    80005714:	00013a03          	ld	s4,0(sp)
    80005718:	03010113          	addi	sp,sp,48
    8000571c:	00008067          	ret

0000000080005720 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80005720:	ff010113          	addi	sp,sp,-16
    80005724:	00813423          	sd	s0,8(sp)
    80005728:	01010413          	addi	s0,sp,16
    8000572c:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80005730:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80005734:	0006c603          	lbu	a2,0(a3)
    80005738:	fd06071b          	addiw	a4,a2,-48
    8000573c:	0ff77713          	andi	a4,a4,255
    80005740:	00900793          	li	a5,9
    80005744:	02e7e063          	bltu	a5,a4,80005764 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80005748:	0025179b          	slliw	a5,a0,0x2
    8000574c:	00a787bb          	addw	a5,a5,a0
    80005750:	0017979b          	slliw	a5,a5,0x1
    80005754:	00168693          	addi	a3,a3,1
    80005758:	00c787bb          	addw	a5,a5,a2
    8000575c:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80005760:	fd5ff06f          	j	80005734 <_Z11stringToIntPKc+0x14>
    return n;
}
    80005764:	00813403          	ld	s0,8(sp)
    80005768:	01010113          	addi	sp,sp,16
    8000576c:	00008067          	ret

0000000080005770 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80005770:	fc010113          	addi	sp,sp,-64
    80005774:	02113c23          	sd	ra,56(sp)
    80005778:	02813823          	sd	s0,48(sp)
    8000577c:	02913423          	sd	s1,40(sp)
    80005780:	03213023          	sd	s2,32(sp)
    80005784:	01313c23          	sd	s3,24(sp)
    80005788:	04010413          	addi	s0,sp,64
    8000578c:	00050493          	mv	s1,a0
    80005790:	00058913          	mv	s2,a1
    80005794:	00060993          	mv	s3,a2
    LOCK();
    80005798:	00100613          	li	a2,1
    8000579c:	00000593          	li	a1,0
    800057a0:	00006517          	auipc	a0,0x6
    800057a4:	2d850513          	addi	a0,a0,728 # 8000ba78 <lockPrint>
    800057a8:	ffffc097          	auipc	ra,0xffffc
    800057ac:	a7c080e7          	jalr	-1412(ra) # 80001224 <copy_and_swap>
    800057b0:	00050863          	beqz	a0,800057c0 <_Z8printIntiii+0x50>
    800057b4:	ffffc097          	auipc	ra,0xffffc
    800057b8:	c74080e7          	jalr	-908(ra) # 80001428 <_Z15thread_dispatchv>
    800057bc:	fddff06f          	j	80005798 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    800057c0:	00098463          	beqz	s3,800057c8 <_Z8printIntiii+0x58>
    800057c4:	0804c463          	bltz	s1,8000584c <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    800057c8:	0004851b          	sext.w	a0,s1
    neg = 0;
    800057cc:	00000593          	li	a1,0
    }

    i = 0;
    800057d0:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    800057d4:	0009079b          	sext.w	a5,s2
    800057d8:	0325773b          	remuw	a4,a0,s2
    800057dc:	00048613          	mv	a2,s1
    800057e0:	0014849b          	addiw	s1,s1,1
    800057e4:	02071693          	slli	a3,a4,0x20
    800057e8:	0206d693          	srli	a3,a3,0x20
    800057ec:	00006717          	auipc	a4,0x6
    800057f0:	16470713          	addi	a4,a4,356 # 8000b950 <digits>
    800057f4:	00d70733          	add	a4,a4,a3
    800057f8:	00074683          	lbu	a3,0(a4)
    800057fc:	fd040713          	addi	a4,s0,-48
    80005800:	00c70733          	add	a4,a4,a2
    80005804:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80005808:	0005071b          	sext.w	a4,a0
    8000580c:	0325553b          	divuw	a0,a0,s2
    80005810:	fcf772e3          	bgeu	a4,a5,800057d4 <_Z8printIntiii+0x64>
    if(neg)
    80005814:	00058c63          	beqz	a1,8000582c <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80005818:	fd040793          	addi	a5,s0,-48
    8000581c:	009784b3          	add	s1,a5,s1
    80005820:	02d00793          	li	a5,45
    80005824:	fef48823          	sb	a5,-16(s1)
    80005828:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    8000582c:	fff4849b          	addiw	s1,s1,-1
    80005830:	0204c463          	bltz	s1,80005858 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80005834:	fd040793          	addi	a5,s0,-48
    80005838:	009787b3          	add	a5,a5,s1
    8000583c:	ff07c503          	lbu	a0,-16(a5)
    80005840:	ffffc097          	auipc	ra,0xffffc
    80005844:	d50080e7          	jalr	-688(ra) # 80001590 <_Z4putcc>
    80005848:	fe5ff06f          	j	8000582c <_Z8printIntiii+0xbc>
        x = -xx;
    8000584c:	4090053b          	negw	a0,s1
        neg = 1;
    80005850:	00100593          	li	a1,1
        x = -xx;
    80005854:	f7dff06f          	j	800057d0 <_Z8printIntiii+0x60>

    UNLOCK();
    80005858:	00000613          	li	a2,0
    8000585c:	00100593          	li	a1,1
    80005860:	00006517          	auipc	a0,0x6
    80005864:	21850513          	addi	a0,a0,536 # 8000ba78 <lockPrint>
    80005868:	ffffc097          	auipc	ra,0xffffc
    8000586c:	9bc080e7          	jalr	-1604(ra) # 80001224 <copy_and_swap>
    80005870:	fe0514e3          	bnez	a0,80005858 <_Z8printIntiii+0xe8>
    80005874:	03813083          	ld	ra,56(sp)
    80005878:	03013403          	ld	s0,48(sp)
    8000587c:	02813483          	ld	s1,40(sp)
    80005880:	02013903          	ld	s2,32(sp)
    80005884:	01813983          	ld	s3,24(sp)
    80005888:	04010113          	addi	sp,sp,64
    8000588c:	00008067          	ret

0000000080005890 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80005890:	fd010113          	addi	sp,sp,-48
    80005894:	02113423          	sd	ra,40(sp)
    80005898:	02813023          	sd	s0,32(sp)
    8000589c:	00913c23          	sd	s1,24(sp)
    800058a0:	01213823          	sd	s2,16(sp)
    800058a4:	01313423          	sd	s3,8(sp)
    800058a8:	03010413          	addi	s0,sp,48
    800058ac:	00050493          	mv	s1,a0
    800058b0:	00058913          	mv	s2,a1
    800058b4:	0015879b          	addiw	a5,a1,1
    800058b8:	0007851b          	sext.w	a0,a5
    800058bc:	00f4a023          	sw	a5,0(s1)
    800058c0:	0004a823          	sw	zero,16(s1)
    800058c4:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    800058c8:	00251513          	slli	a0,a0,0x2
    800058cc:	ffffc097          	auipc	ra,0xffffc
    800058d0:	a44080e7          	jalr	-1468(ra) # 80001310 <_Z9mem_allocm>
    800058d4:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    800058d8:	01000513          	li	a0,16
    800058dc:	ffffd097          	auipc	ra,0xffffd
    800058e0:	89c080e7          	jalr	-1892(ra) # 80002178 <_Znwm>
    800058e4:	00050993          	mv	s3,a0
    800058e8:	00000593          	li	a1,0
    800058ec:	ffffd097          	auipc	ra,0xffffd
    800058f0:	b10080e7          	jalr	-1264(ra) # 800023fc <_ZN9SemaphoreC1Ej>
    800058f4:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    800058f8:	01000513          	li	a0,16
    800058fc:	ffffd097          	auipc	ra,0xffffd
    80005900:	87c080e7          	jalr	-1924(ra) # 80002178 <_Znwm>
    80005904:	00050993          	mv	s3,a0
    80005908:	00090593          	mv	a1,s2
    8000590c:	ffffd097          	auipc	ra,0xffffd
    80005910:	af0080e7          	jalr	-1296(ra) # 800023fc <_ZN9SemaphoreC1Ej>
    80005914:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80005918:	01000513          	li	a0,16
    8000591c:	ffffd097          	auipc	ra,0xffffd
    80005920:	85c080e7          	jalr	-1956(ra) # 80002178 <_Znwm>
    80005924:	00050913          	mv	s2,a0
    80005928:	00100593          	li	a1,1
    8000592c:	ffffd097          	auipc	ra,0xffffd
    80005930:	ad0080e7          	jalr	-1328(ra) # 800023fc <_ZN9SemaphoreC1Ej>
    80005934:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80005938:	01000513          	li	a0,16
    8000593c:	ffffd097          	auipc	ra,0xffffd
    80005940:	83c080e7          	jalr	-1988(ra) # 80002178 <_Znwm>
    80005944:	00050913          	mv	s2,a0
    80005948:	00100593          	li	a1,1
    8000594c:	ffffd097          	auipc	ra,0xffffd
    80005950:	ab0080e7          	jalr	-1360(ra) # 800023fc <_ZN9SemaphoreC1Ej>
    80005954:	0324b823          	sd	s2,48(s1)
}
    80005958:	02813083          	ld	ra,40(sp)
    8000595c:	02013403          	ld	s0,32(sp)
    80005960:	01813483          	ld	s1,24(sp)
    80005964:	01013903          	ld	s2,16(sp)
    80005968:	00813983          	ld	s3,8(sp)
    8000596c:	03010113          	addi	sp,sp,48
    80005970:	00008067          	ret
    80005974:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80005978:	00098513          	mv	a0,s3
    8000597c:	ffffd097          	auipc	ra,0xffffd
    80005980:	84c080e7          	jalr	-1972(ra) # 800021c8 <_ZdlPv>
    80005984:	00048513          	mv	a0,s1
    80005988:	00007097          	auipc	ra,0x7
    8000598c:	1d0080e7          	jalr	464(ra) # 8000cb58 <_Unwind_Resume>
    80005990:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80005994:	00098513          	mv	a0,s3
    80005998:	ffffd097          	auipc	ra,0xffffd
    8000599c:	830080e7          	jalr	-2000(ra) # 800021c8 <_ZdlPv>
    800059a0:	00048513          	mv	a0,s1
    800059a4:	00007097          	auipc	ra,0x7
    800059a8:	1b4080e7          	jalr	436(ra) # 8000cb58 <_Unwind_Resume>
    800059ac:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    800059b0:	00090513          	mv	a0,s2
    800059b4:	ffffd097          	auipc	ra,0xffffd
    800059b8:	814080e7          	jalr	-2028(ra) # 800021c8 <_ZdlPv>
    800059bc:	00048513          	mv	a0,s1
    800059c0:	00007097          	auipc	ra,0x7
    800059c4:	198080e7          	jalr	408(ra) # 8000cb58 <_Unwind_Resume>
    800059c8:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    800059cc:	00090513          	mv	a0,s2
    800059d0:	ffffc097          	auipc	ra,0xffffc
    800059d4:	7f8080e7          	jalr	2040(ra) # 800021c8 <_ZdlPv>
    800059d8:	00048513          	mv	a0,s1
    800059dc:	00007097          	auipc	ra,0x7
    800059e0:	17c080e7          	jalr	380(ra) # 8000cb58 <_Unwind_Resume>

00000000800059e4 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    800059e4:	fe010113          	addi	sp,sp,-32
    800059e8:	00113c23          	sd	ra,24(sp)
    800059ec:	00813823          	sd	s0,16(sp)
    800059f0:	00913423          	sd	s1,8(sp)
    800059f4:	01213023          	sd	s2,0(sp)
    800059f8:	02010413          	addi	s0,sp,32
    800059fc:	00050493          	mv	s1,a0
    80005a00:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80005a04:	01853503          	ld	a0,24(a0)
    80005a08:	ffffd097          	auipc	ra,0xffffd
    80005a0c:	a2c080e7          	jalr	-1492(ra) # 80002434 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80005a10:	0304b503          	ld	a0,48(s1)
    80005a14:	ffffd097          	auipc	ra,0xffffd
    80005a18:	a20080e7          	jalr	-1504(ra) # 80002434 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80005a1c:	0084b783          	ld	a5,8(s1)
    80005a20:	0144a703          	lw	a4,20(s1)
    80005a24:	00271713          	slli	a4,a4,0x2
    80005a28:	00e787b3          	add	a5,a5,a4
    80005a2c:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80005a30:	0144a783          	lw	a5,20(s1)
    80005a34:	0017879b          	addiw	a5,a5,1
    80005a38:	0004a703          	lw	a4,0(s1)
    80005a3c:	02e7e7bb          	remw	a5,a5,a4
    80005a40:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80005a44:	0304b503          	ld	a0,48(s1)
    80005a48:	ffffd097          	auipc	ra,0xffffd
    80005a4c:	a18080e7          	jalr	-1512(ra) # 80002460 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80005a50:	0204b503          	ld	a0,32(s1)
    80005a54:	ffffd097          	auipc	ra,0xffffd
    80005a58:	a0c080e7          	jalr	-1524(ra) # 80002460 <_ZN9Semaphore6signalEv>

}
    80005a5c:	01813083          	ld	ra,24(sp)
    80005a60:	01013403          	ld	s0,16(sp)
    80005a64:	00813483          	ld	s1,8(sp)
    80005a68:	00013903          	ld	s2,0(sp)
    80005a6c:	02010113          	addi	sp,sp,32
    80005a70:	00008067          	ret

0000000080005a74 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80005a74:	fe010113          	addi	sp,sp,-32
    80005a78:	00113c23          	sd	ra,24(sp)
    80005a7c:	00813823          	sd	s0,16(sp)
    80005a80:	00913423          	sd	s1,8(sp)
    80005a84:	01213023          	sd	s2,0(sp)
    80005a88:	02010413          	addi	s0,sp,32
    80005a8c:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80005a90:	02053503          	ld	a0,32(a0)
    80005a94:	ffffd097          	auipc	ra,0xffffd
    80005a98:	9a0080e7          	jalr	-1632(ra) # 80002434 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80005a9c:	0284b503          	ld	a0,40(s1)
    80005aa0:	ffffd097          	auipc	ra,0xffffd
    80005aa4:	994080e7          	jalr	-1644(ra) # 80002434 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80005aa8:	0084b703          	ld	a4,8(s1)
    80005aac:	0104a783          	lw	a5,16(s1)
    80005ab0:	00279693          	slli	a3,a5,0x2
    80005ab4:	00d70733          	add	a4,a4,a3
    80005ab8:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80005abc:	0017879b          	addiw	a5,a5,1
    80005ac0:	0004a703          	lw	a4,0(s1)
    80005ac4:	02e7e7bb          	remw	a5,a5,a4
    80005ac8:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80005acc:	0284b503          	ld	a0,40(s1)
    80005ad0:	ffffd097          	auipc	ra,0xffffd
    80005ad4:	990080e7          	jalr	-1648(ra) # 80002460 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80005ad8:	0184b503          	ld	a0,24(s1)
    80005adc:	ffffd097          	auipc	ra,0xffffd
    80005ae0:	984080e7          	jalr	-1660(ra) # 80002460 <_ZN9Semaphore6signalEv>

    return ret;
}
    80005ae4:	00090513          	mv	a0,s2
    80005ae8:	01813083          	ld	ra,24(sp)
    80005aec:	01013403          	ld	s0,16(sp)
    80005af0:	00813483          	ld	s1,8(sp)
    80005af4:	00013903          	ld	s2,0(sp)
    80005af8:	02010113          	addi	sp,sp,32
    80005afc:	00008067          	ret

0000000080005b00 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80005b00:	fe010113          	addi	sp,sp,-32
    80005b04:	00113c23          	sd	ra,24(sp)
    80005b08:	00813823          	sd	s0,16(sp)
    80005b0c:	00913423          	sd	s1,8(sp)
    80005b10:	01213023          	sd	s2,0(sp)
    80005b14:	02010413          	addi	s0,sp,32
    80005b18:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80005b1c:	02853503          	ld	a0,40(a0)
    80005b20:	ffffd097          	auipc	ra,0xffffd
    80005b24:	914080e7          	jalr	-1772(ra) # 80002434 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80005b28:	0304b503          	ld	a0,48(s1)
    80005b2c:	ffffd097          	auipc	ra,0xffffd
    80005b30:	908080e7          	jalr	-1784(ra) # 80002434 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80005b34:	0144a783          	lw	a5,20(s1)
    80005b38:	0104a903          	lw	s2,16(s1)
    80005b3c:	0327ce63          	blt	a5,s2,80005b78 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80005b40:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80005b44:	0304b503          	ld	a0,48(s1)
    80005b48:	ffffd097          	auipc	ra,0xffffd
    80005b4c:	918080e7          	jalr	-1768(ra) # 80002460 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80005b50:	0284b503          	ld	a0,40(s1)
    80005b54:	ffffd097          	auipc	ra,0xffffd
    80005b58:	90c080e7          	jalr	-1780(ra) # 80002460 <_ZN9Semaphore6signalEv>

    return ret;
}
    80005b5c:	00090513          	mv	a0,s2
    80005b60:	01813083          	ld	ra,24(sp)
    80005b64:	01013403          	ld	s0,16(sp)
    80005b68:	00813483          	ld	s1,8(sp)
    80005b6c:	00013903          	ld	s2,0(sp)
    80005b70:	02010113          	addi	sp,sp,32
    80005b74:	00008067          	ret
        ret = cap - head + tail;
    80005b78:	0004a703          	lw	a4,0(s1)
    80005b7c:	4127093b          	subw	s2,a4,s2
    80005b80:	00f9093b          	addw	s2,s2,a5
    80005b84:	fc1ff06f          	j	80005b44 <_ZN9BufferCPP6getCntEv+0x44>

0000000080005b88 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80005b88:	fe010113          	addi	sp,sp,-32
    80005b8c:	00113c23          	sd	ra,24(sp)
    80005b90:	00813823          	sd	s0,16(sp)
    80005b94:	00913423          	sd	s1,8(sp)
    80005b98:	02010413          	addi	s0,sp,32
    80005b9c:	00050493          	mv	s1,a0
    Console::putc('\n');
    80005ba0:	00a00513          	li	a0,10
    80005ba4:	ffffd097          	auipc	ra,0xffffd
    80005ba8:	95c080e7          	jalr	-1700(ra) # 80002500 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80005bac:	00004517          	auipc	a0,0x4
    80005bb0:	8b450513          	addi	a0,a0,-1868 # 80009460 <CONSOLE_STATUS+0x450>
    80005bb4:	00000097          	auipc	ra,0x0
    80005bb8:	a0c080e7          	jalr	-1524(ra) # 800055c0 <_Z11printStringPKc>
    while (getCnt()) {
    80005bbc:	00048513          	mv	a0,s1
    80005bc0:	00000097          	auipc	ra,0x0
    80005bc4:	f40080e7          	jalr	-192(ra) # 80005b00 <_ZN9BufferCPP6getCntEv>
    80005bc8:	02050c63          	beqz	a0,80005c00 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80005bcc:	0084b783          	ld	a5,8(s1)
    80005bd0:	0104a703          	lw	a4,16(s1)
    80005bd4:	00271713          	slli	a4,a4,0x2
    80005bd8:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80005bdc:	0007c503          	lbu	a0,0(a5)
    80005be0:	ffffd097          	auipc	ra,0xffffd
    80005be4:	920080e7          	jalr	-1760(ra) # 80002500 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80005be8:	0104a783          	lw	a5,16(s1)
    80005bec:	0017879b          	addiw	a5,a5,1
    80005bf0:	0004a703          	lw	a4,0(s1)
    80005bf4:	02e7e7bb          	remw	a5,a5,a4
    80005bf8:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80005bfc:	fc1ff06f          	j	80005bbc <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80005c00:	02100513          	li	a0,33
    80005c04:	ffffd097          	auipc	ra,0xffffd
    80005c08:	8fc080e7          	jalr	-1796(ra) # 80002500 <_ZN7Console4putcEc>
    Console::putc('\n');
    80005c0c:	00a00513          	li	a0,10
    80005c10:	ffffd097          	auipc	ra,0xffffd
    80005c14:	8f0080e7          	jalr	-1808(ra) # 80002500 <_ZN7Console4putcEc>
    mem_free(buffer);
    80005c18:	0084b503          	ld	a0,8(s1)
    80005c1c:	ffffb097          	auipc	ra,0xffffb
    80005c20:	734080e7          	jalr	1844(ra) # 80001350 <_Z8mem_freePv>
    delete itemAvailable;
    80005c24:	0204b503          	ld	a0,32(s1)
    80005c28:	00050863          	beqz	a0,80005c38 <_ZN9BufferCPPD1Ev+0xb0>
    80005c2c:	00053783          	ld	a5,0(a0)
    80005c30:	0087b783          	ld	a5,8(a5)
    80005c34:	000780e7          	jalr	a5
    delete spaceAvailable;
    80005c38:	0184b503          	ld	a0,24(s1)
    80005c3c:	00050863          	beqz	a0,80005c4c <_ZN9BufferCPPD1Ev+0xc4>
    80005c40:	00053783          	ld	a5,0(a0)
    80005c44:	0087b783          	ld	a5,8(a5)
    80005c48:	000780e7          	jalr	a5
    delete mutexTail;
    80005c4c:	0304b503          	ld	a0,48(s1)
    80005c50:	00050863          	beqz	a0,80005c60 <_ZN9BufferCPPD1Ev+0xd8>
    80005c54:	00053783          	ld	a5,0(a0)
    80005c58:	0087b783          	ld	a5,8(a5)
    80005c5c:	000780e7          	jalr	a5
    delete mutexHead;
    80005c60:	0284b503          	ld	a0,40(s1)
    80005c64:	00050863          	beqz	a0,80005c74 <_ZN9BufferCPPD1Ev+0xec>
    80005c68:	00053783          	ld	a5,0(a0)
    80005c6c:	0087b783          	ld	a5,8(a5)
    80005c70:	000780e7          	jalr	a5
}
    80005c74:	01813083          	ld	ra,24(sp)
    80005c78:	01013403          	ld	s0,16(sp)
    80005c7c:	00813483          	ld	s1,8(sp)
    80005c80:	02010113          	addi	sp,sp,32
    80005c84:	00008067          	ret

0000000080005c88 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    80005c88:	fe010113          	addi	sp,sp,-32
    80005c8c:	00113c23          	sd	ra,24(sp)
    80005c90:	00813823          	sd	s0,16(sp)
    80005c94:	00913423          	sd	s1,8(sp)
    80005c98:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80005c9c:	00003517          	auipc	a0,0x3
    80005ca0:	7dc50513          	addi	a0,a0,2012 # 80009478 <CONSOLE_STATUS+0x468>
    80005ca4:	00000097          	auipc	ra,0x0
    80005ca8:	91c080e7          	jalr	-1764(ra) # 800055c0 <_Z11printStringPKc>
    int test = getc() - '0';
    80005cac:	ffffc097          	auipc	ra,0xffffc
    80005cb0:	8bc080e7          	jalr	-1860(ra) # 80001568 <_Z4getcv>
    80005cb4:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    80005cb8:	ffffc097          	auipc	ra,0xffffc
    80005cbc:	8b0080e7          	jalr	-1872(ra) # 80001568 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80005cc0:	00700793          	li	a5,7
    80005cc4:	1097e263          	bltu	a5,s1,80005dc8 <_Z8userMainv+0x140>
    80005cc8:	00249493          	slli	s1,s1,0x2
    80005ccc:	00004717          	auipc	a4,0x4
    80005cd0:	a0470713          	addi	a4,a4,-1532 # 800096d0 <CONSOLE_STATUS+0x6c0>
    80005cd4:	00e484b3          	add	s1,s1,a4
    80005cd8:	0004a783          	lw	a5,0(s1)
    80005cdc:	00e787b3          	add	a5,a5,a4
    80005ce0:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    80005ce4:	fffff097          	auipc	ra,0xfffff
    80005ce8:	f54080e7          	jalr	-172(ra) # 80004c38 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80005cec:	00003517          	auipc	a0,0x3
    80005cf0:	7ac50513          	addi	a0,a0,1964 # 80009498 <CONSOLE_STATUS+0x488>
    80005cf4:	00000097          	auipc	ra,0x0
    80005cf8:	8cc080e7          	jalr	-1844(ra) # 800055c0 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80005cfc:	01813083          	ld	ra,24(sp)
    80005d00:	01013403          	ld	s0,16(sp)
    80005d04:	00813483          	ld	s1,8(sp)
    80005d08:	02010113          	addi	sp,sp,32
    80005d0c:	00008067          	ret
            Threads_CPP_API_test();
    80005d10:	ffffe097          	auipc	ra,0xffffe
    80005d14:	e08080e7          	jalr	-504(ra) # 80003b18 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80005d18:	00003517          	auipc	a0,0x3
    80005d1c:	7c050513          	addi	a0,a0,1984 # 800094d8 <CONSOLE_STATUS+0x4c8>
    80005d20:	00000097          	auipc	ra,0x0
    80005d24:	8a0080e7          	jalr	-1888(ra) # 800055c0 <_Z11printStringPKc>
            break;
    80005d28:	fd5ff06f          	j	80005cfc <_Z8userMainv+0x74>
            producerConsumer_C_API();
    80005d2c:	ffffd097          	auipc	ra,0xffffd
    80005d30:	640080e7          	jalr	1600(ra) # 8000336c <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80005d34:	00003517          	auipc	a0,0x3
    80005d38:	7e450513          	addi	a0,a0,2020 # 80009518 <CONSOLE_STATUS+0x508>
    80005d3c:	00000097          	auipc	ra,0x0
    80005d40:	884080e7          	jalr	-1916(ra) # 800055c0 <_Z11printStringPKc>
            break;
    80005d44:	fb9ff06f          	j	80005cfc <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    80005d48:	fffff097          	auipc	ra,0xfffff
    80005d4c:	234080e7          	jalr	564(ra) # 80004f7c <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80005d50:	00004517          	auipc	a0,0x4
    80005d54:	81850513          	addi	a0,a0,-2024 # 80009568 <CONSOLE_STATUS+0x558>
    80005d58:	00000097          	auipc	ra,0x0
    80005d5c:	868080e7          	jalr	-1944(ra) # 800055c0 <_Z11printStringPKc>
            break;
    80005d60:	f9dff06f          	j	80005cfc <_Z8userMainv+0x74>
            testSleeping();
    80005d64:	00000097          	auipc	ra,0x0
    80005d68:	11c080e7          	jalr	284(ra) # 80005e80 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    80005d6c:	00004517          	auipc	a0,0x4
    80005d70:	85450513          	addi	a0,a0,-1964 # 800095c0 <CONSOLE_STATUS+0x5b0>
    80005d74:	00000097          	auipc	ra,0x0
    80005d78:	84c080e7          	jalr	-1972(ra) # 800055c0 <_Z11printStringPKc>
            break;
    80005d7c:	f81ff06f          	j	80005cfc <_Z8userMainv+0x74>
            testConsumerProducer();
    80005d80:	ffffe097          	auipc	ra,0xffffe
    80005d84:	258080e7          	jalr	600(ra) # 80003fd8 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    80005d88:	00004517          	auipc	a0,0x4
    80005d8c:	86850513          	addi	a0,a0,-1944 # 800095f0 <CONSOLE_STATUS+0x5e0>
    80005d90:	00000097          	auipc	ra,0x0
    80005d94:	830080e7          	jalr	-2000(ra) # 800055c0 <_Z11printStringPKc>
            break;
    80005d98:	f65ff06f          	j	80005cfc <_Z8userMainv+0x74>
            System_Mode_test();
    80005d9c:	00000097          	auipc	ra,0x0
    80005da0:	658080e7          	jalr	1624(ra) # 800063f4 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80005da4:	00004517          	auipc	a0,0x4
    80005da8:	88c50513          	addi	a0,a0,-1908 # 80009630 <CONSOLE_STATUS+0x620>
    80005dac:	00000097          	auipc	ra,0x0
    80005db0:	814080e7          	jalr	-2028(ra) # 800055c0 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80005db4:	00004517          	auipc	a0,0x4
    80005db8:	89c50513          	addi	a0,a0,-1892 # 80009650 <CONSOLE_STATUS+0x640>
    80005dbc:	00000097          	auipc	ra,0x0
    80005dc0:	804080e7          	jalr	-2044(ra) # 800055c0 <_Z11printStringPKc>
            break;
    80005dc4:	f39ff06f          	j	80005cfc <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    80005dc8:	00004517          	auipc	a0,0x4
    80005dcc:	8e050513          	addi	a0,a0,-1824 # 800096a8 <CONSOLE_STATUS+0x698>
    80005dd0:	fffff097          	auipc	ra,0xfffff
    80005dd4:	7f0080e7          	jalr	2032(ra) # 800055c0 <_Z11printStringPKc>
    80005dd8:	f25ff06f          	j	80005cfc <_Z8userMainv+0x74>

0000000080005ddc <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    80005ddc:	fe010113          	addi	sp,sp,-32
    80005de0:	00113c23          	sd	ra,24(sp)
    80005de4:	00813823          	sd	s0,16(sp)
    80005de8:	00913423          	sd	s1,8(sp)
    80005dec:	01213023          	sd	s2,0(sp)
    80005df0:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    80005df4:	00053903          	ld	s2,0(a0)
    int i = 6;
    80005df8:	00600493          	li	s1,6
    while (--i > 0) {
    80005dfc:	fff4849b          	addiw	s1,s1,-1
    80005e00:	04905463          	blez	s1,80005e48 <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    80005e04:	00004517          	auipc	a0,0x4
    80005e08:	8ec50513          	addi	a0,a0,-1812 # 800096f0 <CONSOLE_STATUS+0x6e0>
    80005e0c:	fffff097          	auipc	ra,0xfffff
    80005e10:	7b4080e7          	jalr	1972(ra) # 800055c0 <_Z11printStringPKc>
        printInt(sleep_time);
    80005e14:	00000613          	li	a2,0
    80005e18:	00a00593          	li	a1,10
    80005e1c:	0009051b          	sext.w	a0,s2
    80005e20:	00000097          	auipc	ra,0x0
    80005e24:	950080e7          	jalr	-1712(ra) # 80005770 <_Z8printIntiii>
        printString(" !\n");
    80005e28:	00004517          	auipc	a0,0x4
    80005e2c:	8d050513          	addi	a0,a0,-1840 # 800096f8 <CONSOLE_STATUS+0x6e8>
    80005e30:	fffff097          	auipc	ra,0xfffff
    80005e34:	790080e7          	jalr	1936(ra) # 800055c0 <_Z11printStringPKc>
        time_sleep(sleep_time);
    80005e38:	00090513          	mv	a0,s2
    80005e3c:	ffffb097          	auipc	ra,0xffffb
    80005e40:	634080e7          	jalr	1588(ra) # 80001470 <_Z10time_sleepm>
    while (--i > 0) {
    80005e44:	fb9ff06f          	j	80005dfc <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    80005e48:	00a00793          	li	a5,10
    80005e4c:	02f95933          	divu	s2,s2,a5
    80005e50:	fff90913          	addi	s2,s2,-1
    80005e54:	00006797          	auipc	a5,0x6
    80005e58:	c2c78793          	addi	a5,a5,-980 # 8000ba80 <_ZL8finished>
    80005e5c:	01278933          	add	s2,a5,s2
    80005e60:	00100793          	li	a5,1
    80005e64:	00f90023          	sb	a5,0(s2)
}
    80005e68:	01813083          	ld	ra,24(sp)
    80005e6c:	01013403          	ld	s0,16(sp)
    80005e70:	00813483          	ld	s1,8(sp)
    80005e74:	00013903          	ld	s2,0(sp)
    80005e78:	02010113          	addi	sp,sp,32
    80005e7c:	00008067          	ret

0000000080005e80 <_Z12testSleepingv>:

void testSleeping() {
    80005e80:	fc010113          	addi	sp,sp,-64
    80005e84:	02113c23          	sd	ra,56(sp)
    80005e88:	02813823          	sd	s0,48(sp)
    80005e8c:	02913423          	sd	s1,40(sp)
    80005e90:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    80005e94:	00a00793          	li	a5,10
    80005e98:	fcf43823          	sd	a5,-48(s0)
    80005e9c:	01400793          	li	a5,20
    80005ea0:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    80005ea4:	00000493          	li	s1,0
    80005ea8:	02c0006f          	j	80005ed4 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    80005eac:	00349793          	slli	a5,s1,0x3
    80005eb0:	fd040613          	addi	a2,s0,-48
    80005eb4:	00f60633          	add	a2,a2,a5
    80005eb8:	00000597          	auipc	a1,0x0
    80005ebc:	f2458593          	addi	a1,a1,-220 # 80005ddc <_ZL9sleepyRunPv>
    80005ec0:	fc040513          	addi	a0,s0,-64
    80005ec4:	00f50533          	add	a0,a0,a5
    80005ec8:	ffffb097          	auipc	ra,0xffffb
    80005ecc:	4b8080e7          	jalr	1208(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80005ed0:	0014849b          	addiw	s1,s1,1
    80005ed4:	00100793          	li	a5,1
    80005ed8:	fc97dae3          	bge	a5,s1,80005eac <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    80005edc:	00006797          	auipc	a5,0x6
    80005ee0:	ba47c783          	lbu	a5,-1116(a5) # 8000ba80 <_ZL8finished>
    80005ee4:	fe078ce3          	beqz	a5,80005edc <_Z12testSleepingv+0x5c>
    80005ee8:	00006797          	auipc	a5,0x6
    80005eec:	b997c783          	lbu	a5,-1127(a5) # 8000ba81 <_ZL8finished+0x1>
    80005ef0:	fe0786e3          	beqz	a5,80005edc <_Z12testSleepingv+0x5c>
}
    80005ef4:	03813083          	ld	ra,56(sp)
    80005ef8:	03013403          	ld	s0,48(sp)
    80005efc:	02813483          	ld	s1,40(sp)
    80005f00:	04010113          	addi	sp,sp,64
    80005f04:	00008067          	ret

0000000080005f08 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80005f08:	fe010113          	addi	sp,sp,-32
    80005f0c:	00113c23          	sd	ra,24(sp)
    80005f10:	00813823          	sd	s0,16(sp)
    80005f14:	00913423          	sd	s1,8(sp)
    80005f18:	01213023          	sd	s2,0(sp)
    80005f1c:	02010413          	addi	s0,sp,32
    80005f20:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80005f24:	00100793          	li	a5,1
    80005f28:	02a7f863          	bgeu	a5,a0,80005f58 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80005f2c:	00a00793          	li	a5,10
    80005f30:	02f577b3          	remu	a5,a0,a5
    80005f34:	02078e63          	beqz	a5,80005f70 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80005f38:	fff48513          	addi	a0,s1,-1
    80005f3c:	00000097          	auipc	ra,0x0
    80005f40:	fcc080e7          	jalr	-52(ra) # 80005f08 <_ZL9fibonaccim>
    80005f44:	00050913          	mv	s2,a0
    80005f48:	ffe48513          	addi	a0,s1,-2
    80005f4c:	00000097          	auipc	ra,0x0
    80005f50:	fbc080e7          	jalr	-68(ra) # 80005f08 <_ZL9fibonaccim>
    80005f54:	00a90533          	add	a0,s2,a0
}
    80005f58:	01813083          	ld	ra,24(sp)
    80005f5c:	01013403          	ld	s0,16(sp)
    80005f60:	00813483          	ld	s1,8(sp)
    80005f64:	00013903          	ld	s2,0(sp)
    80005f68:	02010113          	addi	sp,sp,32
    80005f6c:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80005f70:	ffffb097          	auipc	ra,0xffffb
    80005f74:	4b8080e7          	jalr	1208(ra) # 80001428 <_Z15thread_dispatchv>
    80005f78:	fc1ff06f          	j	80005f38 <_ZL9fibonaccim+0x30>

0000000080005f7c <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80005f7c:	fe010113          	addi	sp,sp,-32
    80005f80:	00113c23          	sd	ra,24(sp)
    80005f84:	00813823          	sd	s0,16(sp)
    80005f88:	00913423          	sd	s1,8(sp)
    80005f8c:	01213023          	sd	s2,0(sp)
    80005f90:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80005f94:	00a00493          	li	s1,10
    80005f98:	0400006f          	j	80005fd8 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005f9c:	00003517          	auipc	a0,0x3
    80005fa0:	42c50513          	addi	a0,a0,1068 # 800093c8 <CONSOLE_STATUS+0x3b8>
    80005fa4:	fffff097          	auipc	ra,0xfffff
    80005fa8:	61c080e7          	jalr	1564(ra) # 800055c0 <_Z11printStringPKc>
    80005fac:	00000613          	li	a2,0
    80005fb0:	00a00593          	li	a1,10
    80005fb4:	00048513          	mv	a0,s1
    80005fb8:	fffff097          	auipc	ra,0xfffff
    80005fbc:	7b8080e7          	jalr	1976(ra) # 80005770 <_Z8printIntiii>
    80005fc0:	00003517          	auipc	a0,0x3
    80005fc4:	5f850513          	addi	a0,a0,1528 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80005fc8:	fffff097          	auipc	ra,0xfffff
    80005fcc:	5f8080e7          	jalr	1528(ra) # 800055c0 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80005fd0:	0014849b          	addiw	s1,s1,1
    80005fd4:	0ff4f493          	andi	s1,s1,255
    80005fd8:	00c00793          	li	a5,12
    80005fdc:	fc97f0e3          	bgeu	a5,s1,80005f9c <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80005fe0:	00003517          	auipc	a0,0x3
    80005fe4:	3f050513          	addi	a0,a0,1008 # 800093d0 <CONSOLE_STATUS+0x3c0>
    80005fe8:	fffff097          	auipc	ra,0xfffff
    80005fec:	5d8080e7          	jalr	1496(ra) # 800055c0 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80005ff0:	00500313          	li	t1,5
    thread_dispatch();
    80005ff4:	ffffb097          	auipc	ra,0xffffb
    80005ff8:	434080e7          	jalr	1076(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80005ffc:	01000513          	li	a0,16
    80006000:	00000097          	auipc	ra,0x0
    80006004:	f08080e7          	jalr	-248(ra) # 80005f08 <_ZL9fibonaccim>
    80006008:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    8000600c:	00003517          	auipc	a0,0x3
    80006010:	3d450513          	addi	a0,a0,980 # 800093e0 <CONSOLE_STATUS+0x3d0>
    80006014:	fffff097          	auipc	ra,0xfffff
    80006018:	5ac080e7          	jalr	1452(ra) # 800055c0 <_Z11printStringPKc>
    8000601c:	00000613          	li	a2,0
    80006020:	00a00593          	li	a1,10
    80006024:	0009051b          	sext.w	a0,s2
    80006028:	fffff097          	auipc	ra,0xfffff
    8000602c:	748080e7          	jalr	1864(ra) # 80005770 <_Z8printIntiii>
    80006030:	00003517          	auipc	a0,0x3
    80006034:	58850513          	addi	a0,a0,1416 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80006038:	fffff097          	auipc	ra,0xfffff
    8000603c:	588080e7          	jalr	1416(ra) # 800055c0 <_Z11printStringPKc>
    80006040:	0400006f          	j	80006080 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006044:	00003517          	auipc	a0,0x3
    80006048:	38450513          	addi	a0,a0,900 # 800093c8 <CONSOLE_STATUS+0x3b8>
    8000604c:	fffff097          	auipc	ra,0xfffff
    80006050:	574080e7          	jalr	1396(ra) # 800055c0 <_Z11printStringPKc>
    80006054:	00000613          	li	a2,0
    80006058:	00a00593          	li	a1,10
    8000605c:	00048513          	mv	a0,s1
    80006060:	fffff097          	auipc	ra,0xfffff
    80006064:	710080e7          	jalr	1808(ra) # 80005770 <_Z8printIntiii>
    80006068:	00003517          	auipc	a0,0x3
    8000606c:	55050513          	addi	a0,a0,1360 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80006070:	fffff097          	auipc	ra,0xfffff
    80006074:	550080e7          	jalr	1360(ra) # 800055c0 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80006078:	0014849b          	addiw	s1,s1,1
    8000607c:	0ff4f493          	andi	s1,s1,255
    80006080:	00f00793          	li	a5,15
    80006084:	fc97f0e3          	bgeu	a5,s1,80006044 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80006088:	00003517          	auipc	a0,0x3
    8000608c:	36850513          	addi	a0,a0,872 # 800093f0 <CONSOLE_STATUS+0x3e0>
    80006090:	fffff097          	auipc	ra,0xfffff
    80006094:	530080e7          	jalr	1328(ra) # 800055c0 <_Z11printStringPKc>
    finishedD = true;
    80006098:	00100793          	li	a5,1
    8000609c:	00006717          	auipc	a4,0x6
    800060a0:	9ef70323          	sb	a5,-1562(a4) # 8000ba82 <_ZL9finishedD>
    thread_dispatch();
    800060a4:	ffffb097          	auipc	ra,0xffffb
    800060a8:	384080e7          	jalr	900(ra) # 80001428 <_Z15thread_dispatchv>
}
    800060ac:	01813083          	ld	ra,24(sp)
    800060b0:	01013403          	ld	s0,16(sp)
    800060b4:	00813483          	ld	s1,8(sp)
    800060b8:	00013903          	ld	s2,0(sp)
    800060bc:	02010113          	addi	sp,sp,32
    800060c0:	00008067          	ret

00000000800060c4 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800060c4:	fe010113          	addi	sp,sp,-32
    800060c8:	00113c23          	sd	ra,24(sp)
    800060cc:	00813823          	sd	s0,16(sp)
    800060d0:	00913423          	sd	s1,8(sp)
    800060d4:	01213023          	sd	s2,0(sp)
    800060d8:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800060dc:	00000493          	li	s1,0
    800060e0:	0400006f          	j	80006120 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800060e4:	00003517          	auipc	a0,0x3
    800060e8:	2b450513          	addi	a0,a0,692 # 80009398 <CONSOLE_STATUS+0x388>
    800060ec:	fffff097          	auipc	ra,0xfffff
    800060f0:	4d4080e7          	jalr	1236(ra) # 800055c0 <_Z11printStringPKc>
    800060f4:	00000613          	li	a2,0
    800060f8:	00a00593          	li	a1,10
    800060fc:	00048513          	mv	a0,s1
    80006100:	fffff097          	auipc	ra,0xfffff
    80006104:	670080e7          	jalr	1648(ra) # 80005770 <_Z8printIntiii>
    80006108:	00003517          	auipc	a0,0x3
    8000610c:	4b050513          	addi	a0,a0,1200 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80006110:	fffff097          	auipc	ra,0xfffff
    80006114:	4b0080e7          	jalr	1200(ra) # 800055c0 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80006118:	0014849b          	addiw	s1,s1,1
    8000611c:	0ff4f493          	andi	s1,s1,255
    80006120:	00200793          	li	a5,2
    80006124:	fc97f0e3          	bgeu	a5,s1,800060e4 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80006128:	00003517          	auipc	a0,0x3
    8000612c:	27850513          	addi	a0,a0,632 # 800093a0 <CONSOLE_STATUS+0x390>
    80006130:	fffff097          	auipc	ra,0xfffff
    80006134:	490080e7          	jalr	1168(ra) # 800055c0 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80006138:	00700313          	li	t1,7
    thread_dispatch();
    8000613c:	ffffb097          	auipc	ra,0xffffb
    80006140:	2ec080e7          	jalr	748(ra) # 80001428 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80006144:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80006148:	00003517          	auipc	a0,0x3
    8000614c:	26850513          	addi	a0,a0,616 # 800093b0 <CONSOLE_STATUS+0x3a0>
    80006150:	fffff097          	auipc	ra,0xfffff
    80006154:	470080e7          	jalr	1136(ra) # 800055c0 <_Z11printStringPKc>
    80006158:	00000613          	li	a2,0
    8000615c:	00a00593          	li	a1,10
    80006160:	0009051b          	sext.w	a0,s2
    80006164:	fffff097          	auipc	ra,0xfffff
    80006168:	60c080e7          	jalr	1548(ra) # 80005770 <_Z8printIntiii>
    8000616c:	00003517          	auipc	a0,0x3
    80006170:	44c50513          	addi	a0,a0,1100 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80006174:	fffff097          	auipc	ra,0xfffff
    80006178:	44c080e7          	jalr	1100(ra) # 800055c0 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    8000617c:	00c00513          	li	a0,12
    80006180:	00000097          	auipc	ra,0x0
    80006184:	d88080e7          	jalr	-632(ra) # 80005f08 <_ZL9fibonaccim>
    80006188:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    8000618c:	00003517          	auipc	a0,0x3
    80006190:	22c50513          	addi	a0,a0,556 # 800093b8 <CONSOLE_STATUS+0x3a8>
    80006194:	fffff097          	auipc	ra,0xfffff
    80006198:	42c080e7          	jalr	1068(ra) # 800055c0 <_Z11printStringPKc>
    8000619c:	00000613          	li	a2,0
    800061a0:	00a00593          	li	a1,10
    800061a4:	0009051b          	sext.w	a0,s2
    800061a8:	fffff097          	auipc	ra,0xfffff
    800061ac:	5c8080e7          	jalr	1480(ra) # 80005770 <_Z8printIntiii>
    800061b0:	00003517          	auipc	a0,0x3
    800061b4:	40850513          	addi	a0,a0,1032 # 800095b8 <CONSOLE_STATUS+0x5a8>
    800061b8:	fffff097          	auipc	ra,0xfffff
    800061bc:	408080e7          	jalr	1032(ra) # 800055c0 <_Z11printStringPKc>
    800061c0:	0400006f          	j	80006200 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800061c4:	00003517          	auipc	a0,0x3
    800061c8:	1d450513          	addi	a0,a0,468 # 80009398 <CONSOLE_STATUS+0x388>
    800061cc:	fffff097          	auipc	ra,0xfffff
    800061d0:	3f4080e7          	jalr	1012(ra) # 800055c0 <_Z11printStringPKc>
    800061d4:	00000613          	li	a2,0
    800061d8:	00a00593          	li	a1,10
    800061dc:	00048513          	mv	a0,s1
    800061e0:	fffff097          	auipc	ra,0xfffff
    800061e4:	590080e7          	jalr	1424(ra) # 80005770 <_Z8printIntiii>
    800061e8:	00003517          	auipc	a0,0x3
    800061ec:	3d050513          	addi	a0,a0,976 # 800095b8 <CONSOLE_STATUS+0x5a8>
    800061f0:	fffff097          	auipc	ra,0xfffff
    800061f4:	3d0080e7          	jalr	976(ra) # 800055c0 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800061f8:	0014849b          	addiw	s1,s1,1
    800061fc:	0ff4f493          	andi	s1,s1,255
    80006200:	00500793          	li	a5,5
    80006204:	fc97f0e3          	bgeu	a5,s1,800061c4 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80006208:	00003517          	auipc	a0,0x3
    8000620c:	16850513          	addi	a0,a0,360 # 80009370 <CONSOLE_STATUS+0x360>
    80006210:	fffff097          	auipc	ra,0xfffff
    80006214:	3b0080e7          	jalr	944(ra) # 800055c0 <_Z11printStringPKc>
    finishedC = true;
    80006218:	00100793          	li	a5,1
    8000621c:	00006717          	auipc	a4,0x6
    80006220:	86f703a3          	sb	a5,-1945(a4) # 8000ba83 <_ZL9finishedC>
    thread_dispatch();
    80006224:	ffffb097          	auipc	ra,0xffffb
    80006228:	204080e7          	jalr	516(ra) # 80001428 <_Z15thread_dispatchv>
}
    8000622c:	01813083          	ld	ra,24(sp)
    80006230:	01013403          	ld	s0,16(sp)
    80006234:	00813483          	ld	s1,8(sp)
    80006238:	00013903          	ld	s2,0(sp)
    8000623c:	02010113          	addi	sp,sp,32
    80006240:	00008067          	ret

0000000080006244 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80006244:	fe010113          	addi	sp,sp,-32
    80006248:	00113c23          	sd	ra,24(sp)
    8000624c:	00813823          	sd	s0,16(sp)
    80006250:	00913423          	sd	s1,8(sp)
    80006254:	01213023          	sd	s2,0(sp)
    80006258:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    8000625c:	00000913          	li	s2,0
    80006260:	0400006f          	j	800062a0 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    80006264:	ffffb097          	auipc	ra,0xffffb
    80006268:	1c4080e7          	jalr	452(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    8000626c:	00148493          	addi	s1,s1,1
    80006270:	000027b7          	lui	a5,0x2
    80006274:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006278:	0097ee63          	bltu	a5,s1,80006294 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    8000627c:	00000713          	li	a4,0
    80006280:	000077b7          	lui	a5,0x7
    80006284:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006288:	fce7eee3          	bltu	a5,a4,80006264 <_ZL11workerBodyBPv+0x20>
    8000628c:	00170713          	addi	a4,a4,1
    80006290:	ff1ff06f          	j	80006280 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    80006294:	00a00793          	li	a5,10
    80006298:	04f90663          	beq	s2,a5,800062e4 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    8000629c:	00190913          	addi	s2,s2,1
    800062a0:	00f00793          	li	a5,15
    800062a4:	0527e463          	bltu	a5,s2,800062ec <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    800062a8:	00003517          	auipc	a0,0x3
    800062ac:	0d850513          	addi	a0,a0,216 # 80009380 <CONSOLE_STATUS+0x370>
    800062b0:	fffff097          	auipc	ra,0xfffff
    800062b4:	310080e7          	jalr	784(ra) # 800055c0 <_Z11printStringPKc>
    800062b8:	00000613          	li	a2,0
    800062bc:	00a00593          	li	a1,10
    800062c0:	0009051b          	sext.w	a0,s2
    800062c4:	fffff097          	auipc	ra,0xfffff
    800062c8:	4ac080e7          	jalr	1196(ra) # 80005770 <_Z8printIntiii>
    800062cc:	00003517          	auipc	a0,0x3
    800062d0:	2ec50513          	addi	a0,a0,748 # 800095b8 <CONSOLE_STATUS+0x5a8>
    800062d4:	fffff097          	auipc	ra,0xfffff
    800062d8:	2ec080e7          	jalr	748(ra) # 800055c0 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800062dc:	00000493          	li	s1,0
    800062e0:	f91ff06f          	j	80006270 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    800062e4:	14102ff3          	csrr	t6,sepc
    800062e8:	fb5ff06f          	j	8000629c <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    800062ec:	00003517          	auipc	a0,0x3
    800062f0:	09c50513          	addi	a0,a0,156 # 80009388 <CONSOLE_STATUS+0x378>
    800062f4:	fffff097          	auipc	ra,0xfffff
    800062f8:	2cc080e7          	jalr	716(ra) # 800055c0 <_Z11printStringPKc>
    finishedB = true;
    800062fc:	00100793          	li	a5,1
    80006300:	00005717          	auipc	a4,0x5
    80006304:	78f70223          	sb	a5,1924(a4) # 8000ba84 <_ZL9finishedB>
    thread_dispatch();
    80006308:	ffffb097          	auipc	ra,0xffffb
    8000630c:	120080e7          	jalr	288(ra) # 80001428 <_Z15thread_dispatchv>
}
    80006310:	01813083          	ld	ra,24(sp)
    80006314:	01013403          	ld	s0,16(sp)
    80006318:	00813483          	ld	s1,8(sp)
    8000631c:	00013903          	ld	s2,0(sp)
    80006320:	02010113          	addi	sp,sp,32
    80006324:	00008067          	ret

0000000080006328 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006328:	fe010113          	addi	sp,sp,-32
    8000632c:	00113c23          	sd	ra,24(sp)
    80006330:	00813823          	sd	s0,16(sp)
    80006334:	00913423          	sd	s1,8(sp)
    80006338:	01213023          	sd	s2,0(sp)
    8000633c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006340:	00000913          	li	s2,0
    80006344:	0380006f          	j	8000637c <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80006348:	ffffb097          	auipc	ra,0xffffb
    8000634c:	0e0080e7          	jalr	224(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006350:	00148493          	addi	s1,s1,1
    80006354:	000027b7          	lui	a5,0x2
    80006358:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000635c:	0097ee63          	bltu	a5,s1,80006378 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006360:	00000713          	li	a4,0
    80006364:	000077b7          	lui	a5,0x7
    80006368:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000636c:	fce7eee3          	bltu	a5,a4,80006348 <_ZL11workerBodyAPv+0x20>
    80006370:	00170713          	addi	a4,a4,1
    80006374:	ff1ff06f          	j	80006364 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80006378:	00190913          	addi	s2,s2,1
    8000637c:	00900793          	li	a5,9
    80006380:	0527e063          	bltu	a5,s2,800063c0 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80006384:	00003517          	auipc	a0,0x3
    80006388:	fe450513          	addi	a0,a0,-28 # 80009368 <CONSOLE_STATUS+0x358>
    8000638c:	fffff097          	auipc	ra,0xfffff
    80006390:	234080e7          	jalr	564(ra) # 800055c0 <_Z11printStringPKc>
    80006394:	00000613          	li	a2,0
    80006398:	00a00593          	li	a1,10
    8000639c:	0009051b          	sext.w	a0,s2
    800063a0:	fffff097          	auipc	ra,0xfffff
    800063a4:	3d0080e7          	jalr	976(ra) # 80005770 <_Z8printIntiii>
    800063a8:	00003517          	auipc	a0,0x3
    800063ac:	21050513          	addi	a0,a0,528 # 800095b8 <CONSOLE_STATUS+0x5a8>
    800063b0:	fffff097          	auipc	ra,0xfffff
    800063b4:	210080e7          	jalr	528(ra) # 800055c0 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800063b8:	00000493          	li	s1,0
    800063bc:	f99ff06f          	j	80006354 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    800063c0:	00003517          	auipc	a0,0x3
    800063c4:	fb050513          	addi	a0,a0,-80 # 80009370 <CONSOLE_STATUS+0x360>
    800063c8:	fffff097          	auipc	ra,0xfffff
    800063cc:	1f8080e7          	jalr	504(ra) # 800055c0 <_Z11printStringPKc>
    finishedA = true;
    800063d0:	00100793          	li	a5,1
    800063d4:	00005717          	auipc	a4,0x5
    800063d8:	6af708a3          	sb	a5,1713(a4) # 8000ba85 <_ZL9finishedA>
}
    800063dc:	01813083          	ld	ra,24(sp)
    800063e0:	01013403          	ld	s0,16(sp)
    800063e4:	00813483          	ld	s1,8(sp)
    800063e8:	00013903          	ld	s2,0(sp)
    800063ec:	02010113          	addi	sp,sp,32
    800063f0:	00008067          	ret

00000000800063f4 <_Z16System_Mode_testv>:


void System_Mode_test() {
    800063f4:	fd010113          	addi	sp,sp,-48
    800063f8:	02113423          	sd	ra,40(sp)
    800063fc:	02813023          	sd	s0,32(sp)
    80006400:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80006404:	00000613          	li	a2,0
    80006408:	00000597          	auipc	a1,0x0
    8000640c:	f2058593          	addi	a1,a1,-224 # 80006328 <_ZL11workerBodyAPv>
    80006410:	fd040513          	addi	a0,s0,-48
    80006414:	ffffb097          	auipc	ra,0xffffb
    80006418:	f6c080e7          	jalr	-148(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    8000641c:	00003517          	auipc	a0,0x3
    80006420:	fe450513          	addi	a0,a0,-28 # 80009400 <CONSOLE_STATUS+0x3f0>
    80006424:	fffff097          	auipc	ra,0xfffff
    80006428:	19c080e7          	jalr	412(ra) # 800055c0 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    8000642c:	00000613          	li	a2,0
    80006430:	00000597          	auipc	a1,0x0
    80006434:	e1458593          	addi	a1,a1,-492 # 80006244 <_ZL11workerBodyBPv>
    80006438:	fd840513          	addi	a0,s0,-40
    8000643c:	ffffb097          	auipc	ra,0xffffb
    80006440:	f44080e7          	jalr	-188(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80006444:	00003517          	auipc	a0,0x3
    80006448:	fd450513          	addi	a0,a0,-44 # 80009418 <CONSOLE_STATUS+0x408>
    8000644c:	fffff097          	auipc	ra,0xfffff
    80006450:	174080e7          	jalr	372(ra) # 800055c0 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80006454:	00000613          	li	a2,0
    80006458:	00000597          	auipc	a1,0x0
    8000645c:	c6c58593          	addi	a1,a1,-916 # 800060c4 <_ZL11workerBodyCPv>
    80006460:	fe040513          	addi	a0,s0,-32
    80006464:	ffffb097          	auipc	ra,0xffffb
    80006468:	f1c080e7          	jalr	-228(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    8000646c:	00003517          	auipc	a0,0x3
    80006470:	fc450513          	addi	a0,a0,-60 # 80009430 <CONSOLE_STATUS+0x420>
    80006474:	fffff097          	auipc	ra,0xfffff
    80006478:	14c080e7          	jalr	332(ra) # 800055c0 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    8000647c:	00000613          	li	a2,0
    80006480:	00000597          	auipc	a1,0x0
    80006484:	afc58593          	addi	a1,a1,-1284 # 80005f7c <_ZL11workerBodyDPv>
    80006488:	fe840513          	addi	a0,s0,-24
    8000648c:	ffffb097          	auipc	ra,0xffffb
    80006490:	ef4080e7          	jalr	-268(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80006494:	00003517          	auipc	a0,0x3
    80006498:	fb450513          	addi	a0,a0,-76 # 80009448 <CONSOLE_STATUS+0x438>
    8000649c:	fffff097          	auipc	ra,0xfffff
    800064a0:	124080e7          	jalr	292(ra) # 800055c0 <_Z11printStringPKc>
    800064a4:	00c0006f          	j	800064b0 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    800064a8:	ffffb097          	auipc	ra,0xffffb
    800064ac:	f80080e7          	jalr	-128(ra) # 80001428 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800064b0:	00005797          	auipc	a5,0x5
    800064b4:	5d57c783          	lbu	a5,1493(a5) # 8000ba85 <_ZL9finishedA>
    800064b8:	fe0788e3          	beqz	a5,800064a8 <_Z16System_Mode_testv+0xb4>
    800064bc:	00005797          	auipc	a5,0x5
    800064c0:	5c87c783          	lbu	a5,1480(a5) # 8000ba84 <_ZL9finishedB>
    800064c4:	fe0782e3          	beqz	a5,800064a8 <_Z16System_Mode_testv+0xb4>
    800064c8:	00005797          	auipc	a5,0x5
    800064cc:	5bb7c783          	lbu	a5,1467(a5) # 8000ba83 <_ZL9finishedC>
    800064d0:	fc078ce3          	beqz	a5,800064a8 <_Z16System_Mode_testv+0xb4>
    800064d4:	00005797          	auipc	a5,0x5
    800064d8:	5ae7c783          	lbu	a5,1454(a5) # 8000ba82 <_ZL9finishedD>
    800064dc:	fc0786e3          	beqz	a5,800064a8 <_Z16System_Mode_testv+0xb4>
    }

}
    800064e0:	02813083          	ld	ra,40(sp)
    800064e4:	02013403          	ld	s0,32(sp)
    800064e8:	03010113          	addi	sp,sp,48
    800064ec:	00008067          	ret

00000000800064f0 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    800064f0:	fe010113          	addi	sp,sp,-32
    800064f4:	00113c23          	sd	ra,24(sp)
    800064f8:	00813823          	sd	s0,16(sp)
    800064fc:	00913423          	sd	s1,8(sp)
    80006500:	01213023          	sd	s2,0(sp)
    80006504:	02010413          	addi	s0,sp,32
    80006508:	00050493          	mv	s1,a0
    8000650c:	00058913          	mv	s2,a1
    80006510:	0015879b          	addiw	a5,a1,1
    80006514:	0007851b          	sext.w	a0,a5
    80006518:	00f4a023          	sw	a5,0(s1)
    8000651c:	0004a823          	sw	zero,16(s1)
    80006520:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006524:	00251513          	slli	a0,a0,0x2
    80006528:	ffffb097          	auipc	ra,0xffffb
    8000652c:	de8080e7          	jalr	-536(ra) # 80001310 <_Z9mem_allocm>
    80006530:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80006534:	00000593          	li	a1,0
    80006538:	02048513          	addi	a0,s1,32
    8000653c:	ffffb097          	auipc	ra,0xffffb
    80006540:	f64080e7          	jalr	-156(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&spaceAvailable, _cap);
    80006544:	00090593          	mv	a1,s2
    80006548:	01848513          	addi	a0,s1,24
    8000654c:	ffffb097          	auipc	ra,0xffffb
    80006550:	f54080e7          	jalr	-172(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&mutexHead, 1);
    80006554:	00100593          	li	a1,1
    80006558:	02848513          	addi	a0,s1,40
    8000655c:	ffffb097          	auipc	ra,0xffffb
    80006560:	f44080e7          	jalr	-188(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&mutexTail, 1);
    80006564:	00100593          	li	a1,1
    80006568:	03048513          	addi	a0,s1,48
    8000656c:	ffffb097          	auipc	ra,0xffffb
    80006570:	f34080e7          	jalr	-204(ra) # 800014a0 <_Z8sem_openPP4KSemj>
}
    80006574:	01813083          	ld	ra,24(sp)
    80006578:	01013403          	ld	s0,16(sp)
    8000657c:	00813483          	ld	s1,8(sp)
    80006580:	00013903          	ld	s2,0(sp)
    80006584:	02010113          	addi	sp,sp,32
    80006588:	00008067          	ret

000000008000658c <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    8000658c:	fe010113          	addi	sp,sp,-32
    80006590:	00113c23          	sd	ra,24(sp)
    80006594:	00813823          	sd	s0,16(sp)
    80006598:	00913423          	sd	s1,8(sp)
    8000659c:	01213023          	sd	s2,0(sp)
    800065a0:	02010413          	addi	s0,sp,32
    800065a4:	00050493          	mv	s1,a0
    800065a8:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    800065ac:	01853503          	ld	a0,24(a0)
    800065b0:	ffffb097          	auipc	ra,0xffffb
    800065b4:	f58080e7          	jalr	-168(ra) # 80001508 <_Z8sem_waitP4KSem>

    sem_wait(mutexTail);
    800065b8:	0304b503          	ld	a0,48(s1)
    800065bc:	ffffb097          	auipc	ra,0xffffb
    800065c0:	f4c080e7          	jalr	-180(ra) # 80001508 <_Z8sem_waitP4KSem>
    buffer[tail] = val;
    800065c4:	0084b783          	ld	a5,8(s1)
    800065c8:	0144a703          	lw	a4,20(s1)
    800065cc:	00271713          	slli	a4,a4,0x2
    800065d0:	00e787b3          	add	a5,a5,a4
    800065d4:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800065d8:	0144a783          	lw	a5,20(s1)
    800065dc:	0017879b          	addiw	a5,a5,1
    800065e0:	0004a703          	lw	a4,0(s1)
    800065e4:	02e7e7bb          	remw	a5,a5,a4
    800065e8:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    800065ec:	0304b503          	ld	a0,48(s1)
    800065f0:	ffffb097          	auipc	ra,0xffffb
    800065f4:	f48080e7          	jalr	-184(ra) # 80001538 <_Z10sem_signalP4KSem>

    sem_signal(itemAvailable);
    800065f8:	0204b503          	ld	a0,32(s1)
    800065fc:	ffffb097          	auipc	ra,0xffffb
    80006600:	f3c080e7          	jalr	-196(ra) # 80001538 <_Z10sem_signalP4KSem>

}
    80006604:	01813083          	ld	ra,24(sp)
    80006608:	01013403          	ld	s0,16(sp)
    8000660c:	00813483          	ld	s1,8(sp)
    80006610:	00013903          	ld	s2,0(sp)
    80006614:	02010113          	addi	sp,sp,32
    80006618:	00008067          	ret

000000008000661c <_ZN6Buffer3getEv>:

int Buffer::get() {
    8000661c:	fe010113          	addi	sp,sp,-32
    80006620:	00113c23          	sd	ra,24(sp)
    80006624:	00813823          	sd	s0,16(sp)
    80006628:	00913423          	sd	s1,8(sp)
    8000662c:	01213023          	sd	s2,0(sp)
    80006630:	02010413          	addi	s0,sp,32
    80006634:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80006638:	02053503          	ld	a0,32(a0)
    8000663c:	ffffb097          	auipc	ra,0xffffb
    80006640:	ecc080e7          	jalr	-308(ra) # 80001508 <_Z8sem_waitP4KSem>

    sem_wait(mutexHead);
    80006644:	0284b503          	ld	a0,40(s1)
    80006648:	ffffb097          	auipc	ra,0xffffb
    8000664c:	ec0080e7          	jalr	-320(ra) # 80001508 <_Z8sem_waitP4KSem>

    int ret = buffer[head];
    80006650:	0084b703          	ld	a4,8(s1)
    80006654:	0104a783          	lw	a5,16(s1)
    80006658:	00279693          	slli	a3,a5,0x2
    8000665c:	00d70733          	add	a4,a4,a3
    80006660:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006664:	0017879b          	addiw	a5,a5,1
    80006668:	0004a703          	lw	a4,0(s1)
    8000666c:	02e7e7bb          	remw	a5,a5,a4
    80006670:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80006674:	0284b503          	ld	a0,40(s1)
    80006678:	ffffb097          	auipc	ra,0xffffb
    8000667c:	ec0080e7          	jalr	-320(ra) # 80001538 <_Z10sem_signalP4KSem>

    sem_signal(spaceAvailable);
    80006680:	0184b503          	ld	a0,24(s1)
    80006684:	ffffb097          	auipc	ra,0xffffb
    80006688:	eb4080e7          	jalr	-332(ra) # 80001538 <_Z10sem_signalP4KSem>

    return ret;
}
    8000668c:	00090513          	mv	a0,s2
    80006690:	01813083          	ld	ra,24(sp)
    80006694:	01013403          	ld	s0,16(sp)
    80006698:	00813483          	ld	s1,8(sp)
    8000669c:	00013903          	ld	s2,0(sp)
    800066a0:	02010113          	addi	sp,sp,32
    800066a4:	00008067          	ret

00000000800066a8 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    800066a8:	fe010113          	addi	sp,sp,-32
    800066ac:	00113c23          	sd	ra,24(sp)
    800066b0:	00813823          	sd	s0,16(sp)
    800066b4:	00913423          	sd	s1,8(sp)
    800066b8:	01213023          	sd	s2,0(sp)
    800066bc:	02010413          	addi	s0,sp,32
    800066c0:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    800066c4:	02853503          	ld	a0,40(a0)
    800066c8:	ffffb097          	auipc	ra,0xffffb
    800066cc:	e40080e7          	jalr	-448(ra) # 80001508 <_Z8sem_waitP4KSem>
    sem_wait(mutexTail);
    800066d0:	0304b503          	ld	a0,48(s1)
    800066d4:	ffffb097          	auipc	ra,0xffffb
    800066d8:	e34080e7          	jalr	-460(ra) # 80001508 <_Z8sem_waitP4KSem>

    if (tail >= head) {
    800066dc:	0144a783          	lw	a5,20(s1)
    800066e0:	0104a903          	lw	s2,16(s1)
    800066e4:	0327ce63          	blt	a5,s2,80006720 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    800066e8:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    800066ec:	0304b503          	ld	a0,48(s1)
    800066f0:	ffffb097          	auipc	ra,0xffffb
    800066f4:	e48080e7          	jalr	-440(ra) # 80001538 <_Z10sem_signalP4KSem>
    sem_signal(mutexHead);
    800066f8:	0284b503          	ld	a0,40(s1)
    800066fc:	ffffb097          	auipc	ra,0xffffb
    80006700:	e3c080e7          	jalr	-452(ra) # 80001538 <_Z10sem_signalP4KSem>

    return ret;
}
    80006704:	00090513          	mv	a0,s2
    80006708:	01813083          	ld	ra,24(sp)
    8000670c:	01013403          	ld	s0,16(sp)
    80006710:	00813483          	ld	s1,8(sp)
    80006714:	00013903          	ld	s2,0(sp)
    80006718:	02010113          	addi	sp,sp,32
    8000671c:	00008067          	ret
        ret = cap - head + tail;
    80006720:	0004a703          	lw	a4,0(s1)
    80006724:	4127093b          	subw	s2,a4,s2
    80006728:	00f9093b          	addw	s2,s2,a5
    8000672c:	fc1ff06f          	j	800066ec <_ZN6Buffer6getCntEv+0x44>

0000000080006730 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80006730:	fe010113          	addi	sp,sp,-32
    80006734:	00113c23          	sd	ra,24(sp)
    80006738:	00813823          	sd	s0,16(sp)
    8000673c:	00913423          	sd	s1,8(sp)
    80006740:	02010413          	addi	s0,sp,32
    80006744:	00050493          	mv	s1,a0
    putc('\n');
    80006748:	00a00513          	li	a0,10
    8000674c:	ffffb097          	auipc	ra,0xffffb
    80006750:	e44080e7          	jalr	-444(ra) # 80001590 <_Z4putcc>
    printString("Buffer deleted!\n");
    80006754:	00003517          	auipc	a0,0x3
    80006758:	d0c50513          	addi	a0,a0,-756 # 80009460 <CONSOLE_STATUS+0x450>
    8000675c:	fffff097          	auipc	ra,0xfffff
    80006760:	e64080e7          	jalr	-412(ra) # 800055c0 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80006764:	00048513          	mv	a0,s1
    80006768:	00000097          	auipc	ra,0x0
    8000676c:	f40080e7          	jalr	-192(ra) # 800066a8 <_ZN6Buffer6getCntEv>
    80006770:	02a05c63          	blez	a0,800067a8 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80006774:	0084b783          	ld	a5,8(s1)
    80006778:	0104a703          	lw	a4,16(s1)
    8000677c:	00271713          	slli	a4,a4,0x2
    80006780:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80006784:	0007c503          	lbu	a0,0(a5)
    80006788:	ffffb097          	auipc	ra,0xffffb
    8000678c:	e08080e7          	jalr	-504(ra) # 80001590 <_Z4putcc>
        head = (head + 1) % cap;
    80006790:	0104a783          	lw	a5,16(s1)
    80006794:	0017879b          	addiw	a5,a5,1
    80006798:	0004a703          	lw	a4,0(s1)
    8000679c:	02e7e7bb          	remw	a5,a5,a4
    800067a0:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    800067a4:	fc1ff06f          	j	80006764 <_ZN6BufferD1Ev+0x34>
    putc('!');
    800067a8:	02100513          	li	a0,33
    800067ac:	ffffb097          	auipc	ra,0xffffb
    800067b0:	de4080e7          	jalr	-540(ra) # 80001590 <_Z4putcc>
    putc('\n');
    800067b4:	00a00513          	li	a0,10
    800067b8:	ffffb097          	auipc	ra,0xffffb
    800067bc:	dd8080e7          	jalr	-552(ra) # 80001590 <_Z4putcc>
    mem_free(buffer);
    800067c0:	0084b503          	ld	a0,8(s1)
    800067c4:	ffffb097          	auipc	ra,0xffffb
    800067c8:	b8c080e7          	jalr	-1140(ra) # 80001350 <_Z8mem_freePv>
    sem_close(itemAvailable);
    800067cc:	0204b503          	ld	a0,32(s1)
    800067d0:	ffffb097          	auipc	ra,0xffffb
    800067d4:	d08080e7          	jalr	-760(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(spaceAvailable);
    800067d8:	0184b503          	ld	a0,24(s1)
    800067dc:	ffffb097          	auipc	ra,0xffffb
    800067e0:	cfc080e7          	jalr	-772(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(mutexTail);
    800067e4:	0304b503          	ld	a0,48(s1)
    800067e8:	ffffb097          	auipc	ra,0xffffb
    800067ec:	cf0080e7          	jalr	-784(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(mutexHead);
    800067f0:	0284b503          	ld	a0,40(s1)
    800067f4:	ffffb097          	auipc	ra,0xffffb
    800067f8:	ce4080e7          	jalr	-796(ra) # 800014d8 <_Z9sem_closeP4KSem>
}
    800067fc:	01813083          	ld	ra,24(sp)
    80006800:	01013403          	ld	s0,16(sp)
    80006804:	00813483          	ld	s1,8(sp)
    80006808:	02010113          	addi	sp,sp,32
    8000680c:	00008067          	ret

0000000080006810 <start>:
    80006810:	ff010113          	addi	sp,sp,-16
    80006814:	00813423          	sd	s0,8(sp)
    80006818:	01010413          	addi	s0,sp,16
    8000681c:	300027f3          	csrr	a5,mstatus
    80006820:	ffffe737          	lui	a4,0xffffe
    80006824:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff1b0f>
    80006828:	00e7f7b3          	and	a5,a5,a4
    8000682c:	00001737          	lui	a4,0x1
    80006830:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80006834:	00e7e7b3          	or	a5,a5,a4
    80006838:	30079073          	csrw	mstatus,a5
    8000683c:	00000797          	auipc	a5,0x0
    80006840:	16078793          	addi	a5,a5,352 # 8000699c <system_main>
    80006844:	34179073          	csrw	mepc,a5
    80006848:	00000793          	li	a5,0
    8000684c:	18079073          	csrw	satp,a5
    80006850:	000107b7          	lui	a5,0x10
    80006854:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80006858:	30279073          	csrw	medeleg,a5
    8000685c:	30379073          	csrw	mideleg,a5
    80006860:	104027f3          	csrr	a5,sie
    80006864:	2227e793          	ori	a5,a5,546
    80006868:	10479073          	csrw	sie,a5
    8000686c:	fff00793          	li	a5,-1
    80006870:	00a7d793          	srli	a5,a5,0xa
    80006874:	3b079073          	csrw	pmpaddr0,a5
    80006878:	00f00793          	li	a5,15
    8000687c:	3a079073          	csrw	pmpcfg0,a5
    80006880:	f14027f3          	csrr	a5,mhartid
    80006884:	0200c737          	lui	a4,0x200c
    80006888:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000688c:	0007869b          	sext.w	a3,a5
    80006890:	00269713          	slli	a4,a3,0x2
    80006894:	000f4637          	lui	a2,0xf4
    80006898:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000689c:	00d70733          	add	a4,a4,a3
    800068a0:	0037979b          	slliw	a5,a5,0x3
    800068a4:	020046b7          	lui	a3,0x2004
    800068a8:	00d787b3          	add	a5,a5,a3
    800068ac:	00c585b3          	add	a1,a1,a2
    800068b0:	00371693          	slli	a3,a4,0x3
    800068b4:	00005717          	auipc	a4,0x5
    800068b8:	1dc70713          	addi	a4,a4,476 # 8000ba90 <timer_scratch>
    800068bc:	00b7b023          	sd	a1,0(a5)
    800068c0:	00d70733          	add	a4,a4,a3
    800068c4:	00f73c23          	sd	a5,24(a4)
    800068c8:	02c73023          	sd	a2,32(a4)
    800068cc:	34071073          	csrw	mscratch,a4
    800068d0:	00000797          	auipc	a5,0x0
    800068d4:	6e078793          	addi	a5,a5,1760 # 80006fb0 <timervec>
    800068d8:	30579073          	csrw	mtvec,a5
    800068dc:	300027f3          	csrr	a5,mstatus
    800068e0:	0087e793          	ori	a5,a5,8
    800068e4:	30079073          	csrw	mstatus,a5
    800068e8:	304027f3          	csrr	a5,mie
    800068ec:	0807e793          	ori	a5,a5,128
    800068f0:	30479073          	csrw	mie,a5
    800068f4:	f14027f3          	csrr	a5,mhartid
    800068f8:	0007879b          	sext.w	a5,a5
    800068fc:	00078213          	mv	tp,a5
    80006900:	30200073          	mret
    80006904:	00813403          	ld	s0,8(sp)
    80006908:	01010113          	addi	sp,sp,16
    8000690c:	00008067          	ret

0000000080006910 <timerinit>:
    80006910:	ff010113          	addi	sp,sp,-16
    80006914:	00813423          	sd	s0,8(sp)
    80006918:	01010413          	addi	s0,sp,16
    8000691c:	f14027f3          	csrr	a5,mhartid
    80006920:	0200c737          	lui	a4,0x200c
    80006924:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80006928:	0007869b          	sext.w	a3,a5
    8000692c:	00269713          	slli	a4,a3,0x2
    80006930:	000f4637          	lui	a2,0xf4
    80006934:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80006938:	00d70733          	add	a4,a4,a3
    8000693c:	0037979b          	slliw	a5,a5,0x3
    80006940:	020046b7          	lui	a3,0x2004
    80006944:	00d787b3          	add	a5,a5,a3
    80006948:	00c585b3          	add	a1,a1,a2
    8000694c:	00371693          	slli	a3,a4,0x3
    80006950:	00005717          	auipc	a4,0x5
    80006954:	14070713          	addi	a4,a4,320 # 8000ba90 <timer_scratch>
    80006958:	00b7b023          	sd	a1,0(a5)
    8000695c:	00d70733          	add	a4,a4,a3
    80006960:	00f73c23          	sd	a5,24(a4)
    80006964:	02c73023          	sd	a2,32(a4)
    80006968:	34071073          	csrw	mscratch,a4
    8000696c:	00000797          	auipc	a5,0x0
    80006970:	64478793          	addi	a5,a5,1604 # 80006fb0 <timervec>
    80006974:	30579073          	csrw	mtvec,a5
    80006978:	300027f3          	csrr	a5,mstatus
    8000697c:	0087e793          	ori	a5,a5,8
    80006980:	30079073          	csrw	mstatus,a5
    80006984:	304027f3          	csrr	a5,mie
    80006988:	0807e793          	ori	a5,a5,128
    8000698c:	30479073          	csrw	mie,a5
    80006990:	00813403          	ld	s0,8(sp)
    80006994:	01010113          	addi	sp,sp,16
    80006998:	00008067          	ret

000000008000699c <system_main>:
    8000699c:	fe010113          	addi	sp,sp,-32
    800069a0:	00813823          	sd	s0,16(sp)
    800069a4:	00913423          	sd	s1,8(sp)
    800069a8:	00113c23          	sd	ra,24(sp)
    800069ac:	02010413          	addi	s0,sp,32
    800069b0:	00000097          	auipc	ra,0x0
    800069b4:	0c4080e7          	jalr	196(ra) # 80006a74 <cpuid>
    800069b8:	00005497          	auipc	s1,0x5
    800069bc:	00848493          	addi	s1,s1,8 # 8000b9c0 <started>
    800069c0:	02050263          	beqz	a0,800069e4 <system_main+0x48>
    800069c4:	0004a783          	lw	a5,0(s1)
    800069c8:	0007879b          	sext.w	a5,a5
    800069cc:	fe078ce3          	beqz	a5,800069c4 <system_main+0x28>
    800069d0:	0ff0000f          	fence
    800069d4:	00003517          	auipc	a0,0x3
    800069d8:	d5c50513          	addi	a0,a0,-676 # 80009730 <CONSOLE_STATUS+0x720>
    800069dc:	00001097          	auipc	ra,0x1
    800069e0:	a70080e7          	jalr	-1424(ra) # 8000744c <panic>
    800069e4:	00001097          	auipc	ra,0x1
    800069e8:	9c4080e7          	jalr	-1596(ra) # 800073a8 <consoleinit>
    800069ec:	00001097          	auipc	ra,0x1
    800069f0:	150080e7          	jalr	336(ra) # 80007b3c <printfinit>
    800069f4:	00003517          	auipc	a0,0x3
    800069f8:	bc450513          	addi	a0,a0,-1084 # 800095b8 <CONSOLE_STATUS+0x5a8>
    800069fc:	00001097          	auipc	ra,0x1
    80006a00:	aac080e7          	jalr	-1364(ra) # 800074a8 <__printf>
    80006a04:	00003517          	auipc	a0,0x3
    80006a08:	cfc50513          	addi	a0,a0,-772 # 80009700 <CONSOLE_STATUS+0x6f0>
    80006a0c:	00001097          	auipc	ra,0x1
    80006a10:	a9c080e7          	jalr	-1380(ra) # 800074a8 <__printf>
    80006a14:	00003517          	auipc	a0,0x3
    80006a18:	ba450513          	addi	a0,a0,-1116 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80006a1c:	00001097          	auipc	ra,0x1
    80006a20:	a8c080e7          	jalr	-1396(ra) # 800074a8 <__printf>
    80006a24:	00001097          	auipc	ra,0x1
    80006a28:	4a4080e7          	jalr	1188(ra) # 80007ec8 <kinit>
    80006a2c:	00000097          	auipc	ra,0x0
    80006a30:	148080e7          	jalr	328(ra) # 80006b74 <trapinit>
    80006a34:	00000097          	auipc	ra,0x0
    80006a38:	16c080e7          	jalr	364(ra) # 80006ba0 <trapinithart>
    80006a3c:	00000097          	auipc	ra,0x0
    80006a40:	5b4080e7          	jalr	1460(ra) # 80006ff0 <plicinit>
    80006a44:	00000097          	auipc	ra,0x0
    80006a48:	5d4080e7          	jalr	1492(ra) # 80007018 <plicinithart>
    80006a4c:	00000097          	auipc	ra,0x0
    80006a50:	078080e7          	jalr	120(ra) # 80006ac4 <userinit>
    80006a54:	0ff0000f          	fence
    80006a58:	00100793          	li	a5,1
    80006a5c:	00003517          	auipc	a0,0x3
    80006a60:	cbc50513          	addi	a0,a0,-836 # 80009718 <CONSOLE_STATUS+0x708>
    80006a64:	00f4a023          	sw	a5,0(s1)
    80006a68:	00001097          	auipc	ra,0x1
    80006a6c:	a40080e7          	jalr	-1472(ra) # 800074a8 <__printf>
    80006a70:	0000006f          	j	80006a70 <system_main+0xd4>

0000000080006a74 <cpuid>:
    80006a74:	ff010113          	addi	sp,sp,-16
    80006a78:	00813423          	sd	s0,8(sp)
    80006a7c:	01010413          	addi	s0,sp,16
    80006a80:	00020513          	mv	a0,tp
    80006a84:	00813403          	ld	s0,8(sp)
    80006a88:	0005051b          	sext.w	a0,a0
    80006a8c:	01010113          	addi	sp,sp,16
    80006a90:	00008067          	ret

0000000080006a94 <mycpu>:
    80006a94:	ff010113          	addi	sp,sp,-16
    80006a98:	00813423          	sd	s0,8(sp)
    80006a9c:	01010413          	addi	s0,sp,16
    80006aa0:	00020793          	mv	a5,tp
    80006aa4:	00813403          	ld	s0,8(sp)
    80006aa8:	0007879b          	sext.w	a5,a5
    80006aac:	00779793          	slli	a5,a5,0x7
    80006ab0:	00006517          	auipc	a0,0x6
    80006ab4:	01050513          	addi	a0,a0,16 # 8000cac0 <cpus>
    80006ab8:	00f50533          	add	a0,a0,a5
    80006abc:	01010113          	addi	sp,sp,16
    80006ac0:	00008067          	ret

0000000080006ac4 <userinit>:
    80006ac4:	ff010113          	addi	sp,sp,-16
    80006ac8:	00813423          	sd	s0,8(sp)
    80006acc:	01010413          	addi	s0,sp,16
    80006ad0:	00813403          	ld	s0,8(sp)
    80006ad4:	01010113          	addi	sp,sp,16
    80006ad8:	ffffb317          	auipc	t1,0xffffb
    80006adc:	d3430067          	jr	-716(t1) # 8000180c <main>

0000000080006ae0 <either_copyout>:
    80006ae0:	ff010113          	addi	sp,sp,-16
    80006ae4:	00813023          	sd	s0,0(sp)
    80006ae8:	00113423          	sd	ra,8(sp)
    80006aec:	01010413          	addi	s0,sp,16
    80006af0:	02051663          	bnez	a0,80006b1c <either_copyout+0x3c>
    80006af4:	00058513          	mv	a0,a1
    80006af8:	00060593          	mv	a1,a2
    80006afc:	0006861b          	sext.w	a2,a3
    80006b00:	00002097          	auipc	ra,0x2
    80006b04:	c54080e7          	jalr	-940(ra) # 80008754 <__memmove>
    80006b08:	00813083          	ld	ra,8(sp)
    80006b0c:	00013403          	ld	s0,0(sp)
    80006b10:	00000513          	li	a0,0
    80006b14:	01010113          	addi	sp,sp,16
    80006b18:	00008067          	ret
    80006b1c:	00003517          	auipc	a0,0x3
    80006b20:	c3c50513          	addi	a0,a0,-964 # 80009758 <CONSOLE_STATUS+0x748>
    80006b24:	00001097          	auipc	ra,0x1
    80006b28:	928080e7          	jalr	-1752(ra) # 8000744c <panic>

0000000080006b2c <either_copyin>:
    80006b2c:	ff010113          	addi	sp,sp,-16
    80006b30:	00813023          	sd	s0,0(sp)
    80006b34:	00113423          	sd	ra,8(sp)
    80006b38:	01010413          	addi	s0,sp,16
    80006b3c:	02059463          	bnez	a1,80006b64 <either_copyin+0x38>
    80006b40:	00060593          	mv	a1,a2
    80006b44:	0006861b          	sext.w	a2,a3
    80006b48:	00002097          	auipc	ra,0x2
    80006b4c:	c0c080e7          	jalr	-1012(ra) # 80008754 <__memmove>
    80006b50:	00813083          	ld	ra,8(sp)
    80006b54:	00013403          	ld	s0,0(sp)
    80006b58:	00000513          	li	a0,0
    80006b5c:	01010113          	addi	sp,sp,16
    80006b60:	00008067          	ret
    80006b64:	00003517          	auipc	a0,0x3
    80006b68:	c1c50513          	addi	a0,a0,-996 # 80009780 <CONSOLE_STATUS+0x770>
    80006b6c:	00001097          	auipc	ra,0x1
    80006b70:	8e0080e7          	jalr	-1824(ra) # 8000744c <panic>

0000000080006b74 <trapinit>:
    80006b74:	ff010113          	addi	sp,sp,-16
    80006b78:	00813423          	sd	s0,8(sp)
    80006b7c:	01010413          	addi	s0,sp,16
    80006b80:	00813403          	ld	s0,8(sp)
    80006b84:	00003597          	auipc	a1,0x3
    80006b88:	c2458593          	addi	a1,a1,-988 # 800097a8 <CONSOLE_STATUS+0x798>
    80006b8c:	00006517          	auipc	a0,0x6
    80006b90:	fb450513          	addi	a0,a0,-76 # 8000cb40 <tickslock>
    80006b94:	01010113          	addi	sp,sp,16
    80006b98:	00001317          	auipc	t1,0x1
    80006b9c:	5c030067          	jr	1472(t1) # 80008158 <initlock>

0000000080006ba0 <trapinithart>:
    80006ba0:	ff010113          	addi	sp,sp,-16
    80006ba4:	00813423          	sd	s0,8(sp)
    80006ba8:	01010413          	addi	s0,sp,16
    80006bac:	00000797          	auipc	a5,0x0
    80006bb0:	2f478793          	addi	a5,a5,756 # 80006ea0 <kernelvec>
    80006bb4:	10579073          	csrw	stvec,a5
    80006bb8:	00813403          	ld	s0,8(sp)
    80006bbc:	01010113          	addi	sp,sp,16
    80006bc0:	00008067          	ret

0000000080006bc4 <usertrap>:
    80006bc4:	ff010113          	addi	sp,sp,-16
    80006bc8:	00813423          	sd	s0,8(sp)
    80006bcc:	01010413          	addi	s0,sp,16
    80006bd0:	00813403          	ld	s0,8(sp)
    80006bd4:	01010113          	addi	sp,sp,16
    80006bd8:	00008067          	ret

0000000080006bdc <usertrapret>:
    80006bdc:	ff010113          	addi	sp,sp,-16
    80006be0:	00813423          	sd	s0,8(sp)
    80006be4:	01010413          	addi	s0,sp,16
    80006be8:	00813403          	ld	s0,8(sp)
    80006bec:	01010113          	addi	sp,sp,16
    80006bf0:	00008067          	ret

0000000080006bf4 <kerneltrap>:
    80006bf4:	fe010113          	addi	sp,sp,-32
    80006bf8:	00813823          	sd	s0,16(sp)
    80006bfc:	00113c23          	sd	ra,24(sp)
    80006c00:	00913423          	sd	s1,8(sp)
    80006c04:	02010413          	addi	s0,sp,32
    80006c08:	142025f3          	csrr	a1,scause
    80006c0c:	100027f3          	csrr	a5,sstatus
    80006c10:	0027f793          	andi	a5,a5,2
    80006c14:	10079c63          	bnez	a5,80006d2c <kerneltrap+0x138>
    80006c18:	142027f3          	csrr	a5,scause
    80006c1c:	0207ce63          	bltz	a5,80006c58 <kerneltrap+0x64>
    80006c20:	00003517          	auipc	a0,0x3
    80006c24:	bd050513          	addi	a0,a0,-1072 # 800097f0 <CONSOLE_STATUS+0x7e0>
    80006c28:	00001097          	auipc	ra,0x1
    80006c2c:	880080e7          	jalr	-1920(ra) # 800074a8 <__printf>
    80006c30:	141025f3          	csrr	a1,sepc
    80006c34:	14302673          	csrr	a2,stval
    80006c38:	00003517          	auipc	a0,0x3
    80006c3c:	bc850513          	addi	a0,a0,-1080 # 80009800 <CONSOLE_STATUS+0x7f0>
    80006c40:	00001097          	auipc	ra,0x1
    80006c44:	868080e7          	jalr	-1944(ra) # 800074a8 <__printf>
    80006c48:	00003517          	auipc	a0,0x3
    80006c4c:	bd050513          	addi	a0,a0,-1072 # 80009818 <CONSOLE_STATUS+0x808>
    80006c50:	00000097          	auipc	ra,0x0
    80006c54:	7fc080e7          	jalr	2044(ra) # 8000744c <panic>
    80006c58:	0ff7f713          	andi	a4,a5,255
    80006c5c:	00900693          	li	a3,9
    80006c60:	04d70063          	beq	a4,a3,80006ca0 <kerneltrap+0xac>
    80006c64:	fff00713          	li	a4,-1
    80006c68:	03f71713          	slli	a4,a4,0x3f
    80006c6c:	00170713          	addi	a4,a4,1
    80006c70:	fae798e3          	bne	a5,a4,80006c20 <kerneltrap+0x2c>
    80006c74:	00000097          	auipc	ra,0x0
    80006c78:	e00080e7          	jalr	-512(ra) # 80006a74 <cpuid>
    80006c7c:	06050663          	beqz	a0,80006ce8 <kerneltrap+0xf4>
    80006c80:	144027f3          	csrr	a5,sip
    80006c84:	ffd7f793          	andi	a5,a5,-3
    80006c88:	14479073          	csrw	sip,a5
    80006c8c:	01813083          	ld	ra,24(sp)
    80006c90:	01013403          	ld	s0,16(sp)
    80006c94:	00813483          	ld	s1,8(sp)
    80006c98:	02010113          	addi	sp,sp,32
    80006c9c:	00008067          	ret
    80006ca0:	00000097          	auipc	ra,0x0
    80006ca4:	3c4080e7          	jalr	964(ra) # 80007064 <plic_claim>
    80006ca8:	00a00793          	li	a5,10
    80006cac:	00050493          	mv	s1,a0
    80006cb0:	06f50863          	beq	a0,a5,80006d20 <kerneltrap+0x12c>
    80006cb4:	fc050ce3          	beqz	a0,80006c8c <kerneltrap+0x98>
    80006cb8:	00050593          	mv	a1,a0
    80006cbc:	00003517          	auipc	a0,0x3
    80006cc0:	b1450513          	addi	a0,a0,-1260 # 800097d0 <CONSOLE_STATUS+0x7c0>
    80006cc4:	00000097          	auipc	ra,0x0
    80006cc8:	7e4080e7          	jalr	2020(ra) # 800074a8 <__printf>
    80006ccc:	01013403          	ld	s0,16(sp)
    80006cd0:	01813083          	ld	ra,24(sp)
    80006cd4:	00048513          	mv	a0,s1
    80006cd8:	00813483          	ld	s1,8(sp)
    80006cdc:	02010113          	addi	sp,sp,32
    80006ce0:	00000317          	auipc	t1,0x0
    80006ce4:	3bc30067          	jr	956(t1) # 8000709c <plic_complete>
    80006ce8:	00006517          	auipc	a0,0x6
    80006cec:	e5850513          	addi	a0,a0,-424 # 8000cb40 <tickslock>
    80006cf0:	00001097          	auipc	ra,0x1
    80006cf4:	48c080e7          	jalr	1164(ra) # 8000817c <acquire>
    80006cf8:	00005717          	auipc	a4,0x5
    80006cfc:	ccc70713          	addi	a4,a4,-820 # 8000b9c4 <ticks>
    80006d00:	00072783          	lw	a5,0(a4)
    80006d04:	00006517          	auipc	a0,0x6
    80006d08:	e3c50513          	addi	a0,a0,-452 # 8000cb40 <tickslock>
    80006d0c:	0017879b          	addiw	a5,a5,1
    80006d10:	00f72023          	sw	a5,0(a4)
    80006d14:	00001097          	auipc	ra,0x1
    80006d18:	534080e7          	jalr	1332(ra) # 80008248 <release>
    80006d1c:	f65ff06f          	j	80006c80 <kerneltrap+0x8c>
    80006d20:	00001097          	auipc	ra,0x1
    80006d24:	090080e7          	jalr	144(ra) # 80007db0 <uartintr>
    80006d28:	fa5ff06f          	j	80006ccc <kerneltrap+0xd8>
    80006d2c:	00003517          	auipc	a0,0x3
    80006d30:	a8450513          	addi	a0,a0,-1404 # 800097b0 <CONSOLE_STATUS+0x7a0>
    80006d34:	00000097          	auipc	ra,0x0
    80006d38:	718080e7          	jalr	1816(ra) # 8000744c <panic>

0000000080006d3c <clockintr>:
    80006d3c:	fe010113          	addi	sp,sp,-32
    80006d40:	00813823          	sd	s0,16(sp)
    80006d44:	00913423          	sd	s1,8(sp)
    80006d48:	00113c23          	sd	ra,24(sp)
    80006d4c:	02010413          	addi	s0,sp,32
    80006d50:	00006497          	auipc	s1,0x6
    80006d54:	df048493          	addi	s1,s1,-528 # 8000cb40 <tickslock>
    80006d58:	00048513          	mv	a0,s1
    80006d5c:	00001097          	auipc	ra,0x1
    80006d60:	420080e7          	jalr	1056(ra) # 8000817c <acquire>
    80006d64:	00005717          	auipc	a4,0x5
    80006d68:	c6070713          	addi	a4,a4,-928 # 8000b9c4 <ticks>
    80006d6c:	00072783          	lw	a5,0(a4)
    80006d70:	01013403          	ld	s0,16(sp)
    80006d74:	01813083          	ld	ra,24(sp)
    80006d78:	00048513          	mv	a0,s1
    80006d7c:	0017879b          	addiw	a5,a5,1
    80006d80:	00813483          	ld	s1,8(sp)
    80006d84:	00f72023          	sw	a5,0(a4)
    80006d88:	02010113          	addi	sp,sp,32
    80006d8c:	00001317          	auipc	t1,0x1
    80006d90:	4bc30067          	jr	1212(t1) # 80008248 <release>

0000000080006d94 <devintr>:
    80006d94:	142027f3          	csrr	a5,scause
    80006d98:	00000513          	li	a0,0
    80006d9c:	0007c463          	bltz	a5,80006da4 <devintr+0x10>
    80006da0:	00008067          	ret
    80006da4:	fe010113          	addi	sp,sp,-32
    80006da8:	00813823          	sd	s0,16(sp)
    80006dac:	00113c23          	sd	ra,24(sp)
    80006db0:	00913423          	sd	s1,8(sp)
    80006db4:	02010413          	addi	s0,sp,32
    80006db8:	0ff7f713          	andi	a4,a5,255
    80006dbc:	00900693          	li	a3,9
    80006dc0:	04d70c63          	beq	a4,a3,80006e18 <devintr+0x84>
    80006dc4:	fff00713          	li	a4,-1
    80006dc8:	03f71713          	slli	a4,a4,0x3f
    80006dcc:	00170713          	addi	a4,a4,1
    80006dd0:	00e78c63          	beq	a5,a4,80006de8 <devintr+0x54>
    80006dd4:	01813083          	ld	ra,24(sp)
    80006dd8:	01013403          	ld	s0,16(sp)
    80006ddc:	00813483          	ld	s1,8(sp)
    80006de0:	02010113          	addi	sp,sp,32
    80006de4:	00008067          	ret
    80006de8:	00000097          	auipc	ra,0x0
    80006dec:	c8c080e7          	jalr	-884(ra) # 80006a74 <cpuid>
    80006df0:	06050663          	beqz	a0,80006e5c <devintr+0xc8>
    80006df4:	144027f3          	csrr	a5,sip
    80006df8:	ffd7f793          	andi	a5,a5,-3
    80006dfc:	14479073          	csrw	sip,a5
    80006e00:	01813083          	ld	ra,24(sp)
    80006e04:	01013403          	ld	s0,16(sp)
    80006e08:	00813483          	ld	s1,8(sp)
    80006e0c:	00200513          	li	a0,2
    80006e10:	02010113          	addi	sp,sp,32
    80006e14:	00008067          	ret
    80006e18:	00000097          	auipc	ra,0x0
    80006e1c:	24c080e7          	jalr	588(ra) # 80007064 <plic_claim>
    80006e20:	00a00793          	li	a5,10
    80006e24:	00050493          	mv	s1,a0
    80006e28:	06f50663          	beq	a0,a5,80006e94 <devintr+0x100>
    80006e2c:	00100513          	li	a0,1
    80006e30:	fa0482e3          	beqz	s1,80006dd4 <devintr+0x40>
    80006e34:	00048593          	mv	a1,s1
    80006e38:	00003517          	auipc	a0,0x3
    80006e3c:	99850513          	addi	a0,a0,-1640 # 800097d0 <CONSOLE_STATUS+0x7c0>
    80006e40:	00000097          	auipc	ra,0x0
    80006e44:	668080e7          	jalr	1640(ra) # 800074a8 <__printf>
    80006e48:	00048513          	mv	a0,s1
    80006e4c:	00000097          	auipc	ra,0x0
    80006e50:	250080e7          	jalr	592(ra) # 8000709c <plic_complete>
    80006e54:	00100513          	li	a0,1
    80006e58:	f7dff06f          	j	80006dd4 <devintr+0x40>
    80006e5c:	00006517          	auipc	a0,0x6
    80006e60:	ce450513          	addi	a0,a0,-796 # 8000cb40 <tickslock>
    80006e64:	00001097          	auipc	ra,0x1
    80006e68:	318080e7          	jalr	792(ra) # 8000817c <acquire>
    80006e6c:	00005717          	auipc	a4,0x5
    80006e70:	b5870713          	addi	a4,a4,-1192 # 8000b9c4 <ticks>
    80006e74:	00072783          	lw	a5,0(a4)
    80006e78:	00006517          	auipc	a0,0x6
    80006e7c:	cc850513          	addi	a0,a0,-824 # 8000cb40 <tickslock>
    80006e80:	0017879b          	addiw	a5,a5,1
    80006e84:	00f72023          	sw	a5,0(a4)
    80006e88:	00001097          	auipc	ra,0x1
    80006e8c:	3c0080e7          	jalr	960(ra) # 80008248 <release>
    80006e90:	f65ff06f          	j	80006df4 <devintr+0x60>
    80006e94:	00001097          	auipc	ra,0x1
    80006e98:	f1c080e7          	jalr	-228(ra) # 80007db0 <uartintr>
    80006e9c:	fadff06f          	j	80006e48 <devintr+0xb4>

0000000080006ea0 <kernelvec>:
    80006ea0:	f0010113          	addi	sp,sp,-256
    80006ea4:	00113023          	sd	ra,0(sp)
    80006ea8:	00213423          	sd	sp,8(sp)
    80006eac:	00313823          	sd	gp,16(sp)
    80006eb0:	00413c23          	sd	tp,24(sp)
    80006eb4:	02513023          	sd	t0,32(sp)
    80006eb8:	02613423          	sd	t1,40(sp)
    80006ebc:	02713823          	sd	t2,48(sp)
    80006ec0:	02813c23          	sd	s0,56(sp)
    80006ec4:	04913023          	sd	s1,64(sp)
    80006ec8:	04a13423          	sd	a0,72(sp)
    80006ecc:	04b13823          	sd	a1,80(sp)
    80006ed0:	04c13c23          	sd	a2,88(sp)
    80006ed4:	06d13023          	sd	a3,96(sp)
    80006ed8:	06e13423          	sd	a4,104(sp)
    80006edc:	06f13823          	sd	a5,112(sp)
    80006ee0:	07013c23          	sd	a6,120(sp)
    80006ee4:	09113023          	sd	a7,128(sp)
    80006ee8:	09213423          	sd	s2,136(sp)
    80006eec:	09313823          	sd	s3,144(sp)
    80006ef0:	09413c23          	sd	s4,152(sp)
    80006ef4:	0b513023          	sd	s5,160(sp)
    80006ef8:	0b613423          	sd	s6,168(sp)
    80006efc:	0b713823          	sd	s7,176(sp)
    80006f00:	0b813c23          	sd	s8,184(sp)
    80006f04:	0d913023          	sd	s9,192(sp)
    80006f08:	0da13423          	sd	s10,200(sp)
    80006f0c:	0db13823          	sd	s11,208(sp)
    80006f10:	0dc13c23          	sd	t3,216(sp)
    80006f14:	0fd13023          	sd	t4,224(sp)
    80006f18:	0fe13423          	sd	t5,232(sp)
    80006f1c:	0ff13823          	sd	t6,240(sp)
    80006f20:	cd5ff0ef          	jal	ra,80006bf4 <kerneltrap>
    80006f24:	00013083          	ld	ra,0(sp)
    80006f28:	00813103          	ld	sp,8(sp)
    80006f2c:	01013183          	ld	gp,16(sp)
    80006f30:	02013283          	ld	t0,32(sp)
    80006f34:	02813303          	ld	t1,40(sp)
    80006f38:	03013383          	ld	t2,48(sp)
    80006f3c:	03813403          	ld	s0,56(sp)
    80006f40:	04013483          	ld	s1,64(sp)
    80006f44:	04813503          	ld	a0,72(sp)
    80006f48:	05013583          	ld	a1,80(sp)
    80006f4c:	05813603          	ld	a2,88(sp)
    80006f50:	06013683          	ld	a3,96(sp)
    80006f54:	06813703          	ld	a4,104(sp)
    80006f58:	07013783          	ld	a5,112(sp)
    80006f5c:	07813803          	ld	a6,120(sp)
    80006f60:	08013883          	ld	a7,128(sp)
    80006f64:	08813903          	ld	s2,136(sp)
    80006f68:	09013983          	ld	s3,144(sp)
    80006f6c:	09813a03          	ld	s4,152(sp)
    80006f70:	0a013a83          	ld	s5,160(sp)
    80006f74:	0a813b03          	ld	s6,168(sp)
    80006f78:	0b013b83          	ld	s7,176(sp)
    80006f7c:	0b813c03          	ld	s8,184(sp)
    80006f80:	0c013c83          	ld	s9,192(sp)
    80006f84:	0c813d03          	ld	s10,200(sp)
    80006f88:	0d013d83          	ld	s11,208(sp)
    80006f8c:	0d813e03          	ld	t3,216(sp)
    80006f90:	0e013e83          	ld	t4,224(sp)
    80006f94:	0e813f03          	ld	t5,232(sp)
    80006f98:	0f013f83          	ld	t6,240(sp)
    80006f9c:	10010113          	addi	sp,sp,256
    80006fa0:	10200073          	sret
    80006fa4:	00000013          	nop
    80006fa8:	00000013          	nop
    80006fac:	00000013          	nop

0000000080006fb0 <timervec>:
    80006fb0:	34051573          	csrrw	a0,mscratch,a0
    80006fb4:	00b53023          	sd	a1,0(a0)
    80006fb8:	00c53423          	sd	a2,8(a0)
    80006fbc:	00d53823          	sd	a3,16(a0)
    80006fc0:	01853583          	ld	a1,24(a0)
    80006fc4:	02053603          	ld	a2,32(a0)
    80006fc8:	0005b683          	ld	a3,0(a1)
    80006fcc:	00c686b3          	add	a3,a3,a2
    80006fd0:	00d5b023          	sd	a3,0(a1)
    80006fd4:	00200593          	li	a1,2
    80006fd8:	14459073          	csrw	sip,a1
    80006fdc:	01053683          	ld	a3,16(a0)
    80006fe0:	00853603          	ld	a2,8(a0)
    80006fe4:	00053583          	ld	a1,0(a0)
    80006fe8:	34051573          	csrrw	a0,mscratch,a0
    80006fec:	30200073          	mret

0000000080006ff0 <plicinit>:
    80006ff0:	ff010113          	addi	sp,sp,-16
    80006ff4:	00813423          	sd	s0,8(sp)
    80006ff8:	01010413          	addi	s0,sp,16
    80006ffc:	00813403          	ld	s0,8(sp)
    80007000:	0c0007b7          	lui	a5,0xc000
    80007004:	00100713          	li	a4,1
    80007008:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000700c:	00e7a223          	sw	a4,4(a5)
    80007010:	01010113          	addi	sp,sp,16
    80007014:	00008067          	ret

0000000080007018 <plicinithart>:
    80007018:	ff010113          	addi	sp,sp,-16
    8000701c:	00813023          	sd	s0,0(sp)
    80007020:	00113423          	sd	ra,8(sp)
    80007024:	01010413          	addi	s0,sp,16
    80007028:	00000097          	auipc	ra,0x0
    8000702c:	a4c080e7          	jalr	-1460(ra) # 80006a74 <cpuid>
    80007030:	0085171b          	slliw	a4,a0,0x8
    80007034:	0c0027b7          	lui	a5,0xc002
    80007038:	00e787b3          	add	a5,a5,a4
    8000703c:	40200713          	li	a4,1026
    80007040:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80007044:	00813083          	ld	ra,8(sp)
    80007048:	00013403          	ld	s0,0(sp)
    8000704c:	00d5151b          	slliw	a0,a0,0xd
    80007050:	0c2017b7          	lui	a5,0xc201
    80007054:	00a78533          	add	a0,a5,a0
    80007058:	00052023          	sw	zero,0(a0)
    8000705c:	01010113          	addi	sp,sp,16
    80007060:	00008067          	ret

0000000080007064 <plic_claim>:
    80007064:	ff010113          	addi	sp,sp,-16
    80007068:	00813023          	sd	s0,0(sp)
    8000706c:	00113423          	sd	ra,8(sp)
    80007070:	01010413          	addi	s0,sp,16
    80007074:	00000097          	auipc	ra,0x0
    80007078:	a00080e7          	jalr	-1536(ra) # 80006a74 <cpuid>
    8000707c:	00813083          	ld	ra,8(sp)
    80007080:	00013403          	ld	s0,0(sp)
    80007084:	00d5151b          	slliw	a0,a0,0xd
    80007088:	0c2017b7          	lui	a5,0xc201
    8000708c:	00a78533          	add	a0,a5,a0
    80007090:	00452503          	lw	a0,4(a0)
    80007094:	01010113          	addi	sp,sp,16
    80007098:	00008067          	ret

000000008000709c <plic_complete>:
    8000709c:	fe010113          	addi	sp,sp,-32
    800070a0:	00813823          	sd	s0,16(sp)
    800070a4:	00913423          	sd	s1,8(sp)
    800070a8:	00113c23          	sd	ra,24(sp)
    800070ac:	02010413          	addi	s0,sp,32
    800070b0:	00050493          	mv	s1,a0
    800070b4:	00000097          	auipc	ra,0x0
    800070b8:	9c0080e7          	jalr	-1600(ra) # 80006a74 <cpuid>
    800070bc:	01813083          	ld	ra,24(sp)
    800070c0:	01013403          	ld	s0,16(sp)
    800070c4:	00d5179b          	slliw	a5,a0,0xd
    800070c8:	0c201737          	lui	a4,0xc201
    800070cc:	00f707b3          	add	a5,a4,a5
    800070d0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800070d4:	00813483          	ld	s1,8(sp)
    800070d8:	02010113          	addi	sp,sp,32
    800070dc:	00008067          	ret

00000000800070e0 <consolewrite>:
    800070e0:	fb010113          	addi	sp,sp,-80
    800070e4:	04813023          	sd	s0,64(sp)
    800070e8:	04113423          	sd	ra,72(sp)
    800070ec:	02913c23          	sd	s1,56(sp)
    800070f0:	03213823          	sd	s2,48(sp)
    800070f4:	03313423          	sd	s3,40(sp)
    800070f8:	03413023          	sd	s4,32(sp)
    800070fc:	01513c23          	sd	s5,24(sp)
    80007100:	05010413          	addi	s0,sp,80
    80007104:	06c05c63          	blez	a2,8000717c <consolewrite+0x9c>
    80007108:	00060993          	mv	s3,a2
    8000710c:	00050a13          	mv	s4,a0
    80007110:	00058493          	mv	s1,a1
    80007114:	00000913          	li	s2,0
    80007118:	fff00a93          	li	s5,-1
    8000711c:	01c0006f          	j	80007138 <consolewrite+0x58>
    80007120:	fbf44503          	lbu	a0,-65(s0)
    80007124:	0019091b          	addiw	s2,s2,1
    80007128:	00148493          	addi	s1,s1,1
    8000712c:	00001097          	auipc	ra,0x1
    80007130:	a9c080e7          	jalr	-1380(ra) # 80007bc8 <uartputc>
    80007134:	03298063          	beq	s3,s2,80007154 <consolewrite+0x74>
    80007138:	00048613          	mv	a2,s1
    8000713c:	00100693          	li	a3,1
    80007140:	000a0593          	mv	a1,s4
    80007144:	fbf40513          	addi	a0,s0,-65
    80007148:	00000097          	auipc	ra,0x0
    8000714c:	9e4080e7          	jalr	-1564(ra) # 80006b2c <either_copyin>
    80007150:	fd5518e3          	bne	a0,s5,80007120 <consolewrite+0x40>
    80007154:	04813083          	ld	ra,72(sp)
    80007158:	04013403          	ld	s0,64(sp)
    8000715c:	03813483          	ld	s1,56(sp)
    80007160:	02813983          	ld	s3,40(sp)
    80007164:	02013a03          	ld	s4,32(sp)
    80007168:	01813a83          	ld	s5,24(sp)
    8000716c:	00090513          	mv	a0,s2
    80007170:	03013903          	ld	s2,48(sp)
    80007174:	05010113          	addi	sp,sp,80
    80007178:	00008067          	ret
    8000717c:	00000913          	li	s2,0
    80007180:	fd5ff06f          	j	80007154 <consolewrite+0x74>

0000000080007184 <consoleread>:
    80007184:	f9010113          	addi	sp,sp,-112
    80007188:	06813023          	sd	s0,96(sp)
    8000718c:	04913c23          	sd	s1,88(sp)
    80007190:	05213823          	sd	s2,80(sp)
    80007194:	05313423          	sd	s3,72(sp)
    80007198:	05413023          	sd	s4,64(sp)
    8000719c:	03513c23          	sd	s5,56(sp)
    800071a0:	03613823          	sd	s6,48(sp)
    800071a4:	03713423          	sd	s7,40(sp)
    800071a8:	03813023          	sd	s8,32(sp)
    800071ac:	06113423          	sd	ra,104(sp)
    800071b0:	01913c23          	sd	s9,24(sp)
    800071b4:	07010413          	addi	s0,sp,112
    800071b8:	00060b93          	mv	s7,a2
    800071bc:	00050913          	mv	s2,a0
    800071c0:	00058c13          	mv	s8,a1
    800071c4:	00060b1b          	sext.w	s6,a2
    800071c8:	00006497          	auipc	s1,0x6
    800071cc:	9a048493          	addi	s1,s1,-1632 # 8000cb68 <cons>
    800071d0:	00400993          	li	s3,4
    800071d4:	fff00a13          	li	s4,-1
    800071d8:	00a00a93          	li	s5,10
    800071dc:	05705e63          	blez	s7,80007238 <consoleread+0xb4>
    800071e0:	09c4a703          	lw	a4,156(s1)
    800071e4:	0984a783          	lw	a5,152(s1)
    800071e8:	0007071b          	sext.w	a4,a4
    800071ec:	08e78463          	beq	a5,a4,80007274 <consoleread+0xf0>
    800071f0:	07f7f713          	andi	a4,a5,127
    800071f4:	00e48733          	add	a4,s1,a4
    800071f8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800071fc:	0017869b          	addiw	a3,a5,1
    80007200:	08d4ac23          	sw	a3,152(s1)
    80007204:	00070c9b          	sext.w	s9,a4
    80007208:	0b370663          	beq	a4,s3,800072b4 <consoleread+0x130>
    8000720c:	00100693          	li	a3,1
    80007210:	f9f40613          	addi	a2,s0,-97
    80007214:	000c0593          	mv	a1,s8
    80007218:	00090513          	mv	a0,s2
    8000721c:	f8e40fa3          	sb	a4,-97(s0)
    80007220:	00000097          	auipc	ra,0x0
    80007224:	8c0080e7          	jalr	-1856(ra) # 80006ae0 <either_copyout>
    80007228:	01450863          	beq	a0,s4,80007238 <consoleread+0xb4>
    8000722c:	001c0c13          	addi	s8,s8,1
    80007230:	fffb8b9b          	addiw	s7,s7,-1
    80007234:	fb5c94e3          	bne	s9,s5,800071dc <consoleread+0x58>
    80007238:	000b851b          	sext.w	a0,s7
    8000723c:	06813083          	ld	ra,104(sp)
    80007240:	06013403          	ld	s0,96(sp)
    80007244:	05813483          	ld	s1,88(sp)
    80007248:	05013903          	ld	s2,80(sp)
    8000724c:	04813983          	ld	s3,72(sp)
    80007250:	04013a03          	ld	s4,64(sp)
    80007254:	03813a83          	ld	s5,56(sp)
    80007258:	02813b83          	ld	s7,40(sp)
    8000725c:	02013c03          	ld	s8,32(sp)
    80007260:	01813c83          	ld	s9,24(sp)
    80007264:	40ab053b          	subw	a0,s6,a0
    80007268:	03013b03          	ld	s6,48(sp)
    8000726c:	07010113          	addi	sp,sp,112
    80007270:	00008067          	ret
    80007274:	00001097          	auipc	ra,0x1
    80007278:	1d8080e7          	jalr	472(ra) # 8000844c <push_on>
    8000727c:	0984a703          	lw	a4,152(s1)
    80007280:	09c4a783          	lw	a5,156(s1)
    80007284:	0007879b          	sext.w	a5,a5
    80007288:	fef70ce3          	beq	a4,a5,80007280 <consoleread+0xfc>
    8000728c:	00001097          	auipc	ra,0x1
    80007290:	234080e7          	jalr	564(ra) # 800084c0 <pop_on>
    80007294:	0984a783          	lw	a5,152(s1)
    80007298:	07f7f713          	andi	a4,a5,127
    8000729c:	00e48733          	add	a4,s1,a4
    800072a0:	01874703          	lbu	a4,24(a4)
    800072a4:	0017869b          	addiw	a3,a5,1
    800072a8:	08d4ac23          	sw	a3,152(s1)
    800072ac:	00070c9b          	sext.w	s9,a4
    800072b0:	f5371ee3          	bne	a4,s3,8000720c <consoleread+0x88>
    800072b4:	000b851b          	sext.w	a0,s7
    800072b8:	f96bf2e3          	bgeu	s7,s6,8000723c <consoleread+0xb8>
    800072bc:	08f4ac23          	sw	a5,152(s1)
    800072c0:	f7dff06f          	j	8000723c <consoleread+0xb8>

00000000800072c4 <consputc>:
    800072c4:	10000793          	li	a5,256
    800072c8:	00f50663          	beq	a0,a5,800072d4 <consputc+0x10>
    800072cc:	00001317          	auipc	t1,0x1
    800072d0:	9f430067          	jr	-1548(t1) # 80007cc0 <uartputc_sync>
    800072d4:	ff010113          	addi	sp,sp,-16
    800072d8:	00113423          	sd	ra,8(sp)
    800072dc:	00813023          	sd	s0,0(sp)
    800072e0:	01010413          	addi	s0,sp,16
    800072e4:	00800513          	li	a0,8
    800072e8:	00001097          	auipc	ra,0x1
    800072ec:	9d8080e7          	jalr	-1576(ra) # 80007cc0 <uartputc_sync>
    800072f0:	02000513          	li	a0,32
    800072f4:	00001097          	auipc	ra,0x1
    800072f8:	9cc080e7          	jalr	-1588(ra) # 80007cc0 <uartputc_sync>
    800072fc:	00013403          	ld	s0,0(sp)
    80007300:	00813083          	ld	ra,8(sp)
    80007304:	00800513          	li	a0,8
    80007308:	01010113          	addi	sp,sp,16
    8000730c:	00001317          	auipc	t1,0x1
    80007310:	9b430067          	jr	-1612(t1) # 80007cc0 <uartputc_sync>

0000000080007314 <consoleintr>:
    80007314:	fe010113          	addi	sp,sp,-32
    80007318:	00813823          	sd	s0,16(sp)
    8000731c:	00913423          	sd	s1,8(sp)
    80007320:	01213023          	sd	s2,0(sp)
    80007324:	00113c23          	sd	ra,24(sp)
    80007328:	02010413          	addi	s0,sp,32
    8000732c:	00006917          	auipc	s2,0x6
    80007330:	83c90913          	addi	s2,s2,-1988 # 8000cb68 <cons>
    80007334:	00050493          	mv	s1,a0
    80007338:	00090513          	mv	a0,s2
    8000733c:	00001097          	auipc	ra,0x1
    80007340:	e40080e7          	jalr	-448(ra) # 8000817c <acquire>
    80007344:	02048c63          	beqz	s1,8000737c <consoleintr+0x68>
    80007348:	0a092783          	lw	a5,160(s2)
    8000734c:	09892703          	lw	a4,152(s2)
    80007350:	07f00693          	li	a3,127
    80007354:	40e7873b          	subw	a4,a5,a4
    80007358:	02e6e263          	bltu	a3,a4,8000737c <consoleintr+0x68>
    8000735c:	00d00713          	li	a4,13
    80007360:	04e48063          	beq	s1,a4,800073a0 <consoleintr+0x8c>
    80007364:	07f7f713          	andi	a4,a5,127
    80007368:	00e90733          	add	a4,s2,a4
    8000736c:	0017879b          	addiw	a5,a5,1
    80007370:	0af92023          	sw	a5,160(s2)
    80007374:	00970c23          	sb	s1,24(a4)
    80007378:	08f92e23          	sw	a5,156(s2)
    8000737c:	01013403          	ld	s0,16(sp)
    80007380:	01813083          	ld	ra,24(sp)
    80007384:	00813483          	ld	s1,8(sp)
    80007388:	00013903          	ld	s2,0(sp)
    8000738c:	00005517          	auipc	a0,0x5
    80007390:	7dc50513          	addi	a0,a0,2012 # 8000cb68 <cons>
    80007394:	02010113          	addi	sp,sp,32
    80007398:	00001317          	auipc	t1,0x1
    8000739c:	eb030067          	jr	-336(t1) # 80008248 <release>
    800073a0:	00a00493          	li	s1,10
    800073a4:	fc1ff06f          	j	80007364 <consoleintr+0x50>

00000000800073a8 <consoleinit>:
    800073a8:	fe010113          	addi	sp,sp,-32
    800073ac:	00113c23          	sd	ra,24(sp)
    800073b0:	00813823          	sd	s0,16(sp)
    800073b4:	00913423          	sd	s1,8(sp)
    800073b8:	02010413          	addi	s0,sp,32
    800073bc:	00005497          	auipc	s1,0x5
    800073c0:	7ac48493          	addi	s1,s1,1964 # 8000cb68 <cons>
    800073c4:	00048513          	mv	a0,s1
    800073c8:	00002597          	auipc	a1,0x2
    800073cc:	46058593          	addi	a1,a1,1120 # 80009828 <CONSOLE_STATUS+0x818>
    800073d0:	00001097          	auipc	ra,0x1
    800073d4:	d88080e7          	jalr	-632(ra) # 80008158 <initlock>
    800073d8:	00000097          	auipc	ra,0x0
    800073dc:	7ac080e7          	jalr	1964(ra) # 80007b84 <uartinit>
    800073e0:	01813083          	ld	ra,24(sp)
    800073e4:	01013403          	ld	s0,16(sp)
    800073e8:	00000797          	auipc	a5,0x0
    800073ec:	d9c78793          	addi	a5,a5,-612 # 80007184 <consoleread>
    800073f0:	0af4bc23          	sd	a5,184(s1)
    800073f4:	00000797          	auipc	a5,0x0
    800073f8:	cec78793          	addi	a5,a5,-788 # 800070e0 <consolewrite>
    800073fc:	0cf4b023          	sd	a5,192(s1)
    80007400:	00813483          	ld	s1,8(sp)
    80007404:	02010113          	addi	sp,sp,32
    80007408:	00008067          	ret

000000008000740c <console_read>:
    8000740c:	ff010113          	addi	sp,sp,-16
    80007410:	00813423          	sd	s0,8(sp)
    80007414:	01010413          	addi	s0,sp,16
    80007418:	00813403          	ld	s0,8(sp)
    8000741c:	00006317          	auipc	t1,0x6
    80007420:	80433303          	ld	t1,-2044(t1) # 8000cc20 <devsw+0x10>
    80007424:	01010113          	addi	sp,sp,16
    80007428:	00030067          	jr	t1

000000008000742c <console_write>:
    8000742c:	ff010113          	addi	sp,sp,-16
    80007430:	00813423          	sd	s0,8(sp)
    80007434:	01010413          	addi	s0,sp,16
    80007438:	00813403          	ld	s0,8(sp)
    8000743c:	00005317          	auipc	t1,0x5
    80007440:	7ec33303          	ld	t1,2028(t1) # 8000cc28 <devsw+0x18>
    80007444:	01010113          	addi	sp,sp,16
    80007448:	00030067          	jr	t1

000000008000744c <panic>:
    8000744c:	fe010113          	addi	sp,sp,-32
    80007450:	00113c23          	sd	ra,24(sp)
    80007454:	00813823          	sd	s0,16(sp)
    80007458:	00913423          	sd	s1,8(sp)
    8000745c:	02010413          	addi	s0,sp,32
    80007460:	00050493          	mv	s1,a0
    80007464:	00002517          	auipc	a0,0x2
    80007468:	3cc50513          	addi	a0,a0,972 # 80009830 <CONSOLE_STATUS+0x820>
    8000746c:	00006797          	auipc	a5,0x6
    80007470:	8407ae23          	sw	zero,-1956(a5) # 8000ccc8 <pr+0x18>
    80007474:	00000097          	auipc	ra,0x0
    80007478:	034080e7          	jalr	52(ra) # 800074a8 <__printf>
    8000747c:	00048513          	mv	a0,s1
    80007480:	00000097          	auipc	ra,0x0
    80007484:	028080e7          	jalr	40(ra) # 800074a8 <__printf>
    80007488:	00002517          	auipc	a0,0x2
    8000748c:	13050513          	addi	a0,a0,304 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80007490:	00000097          	auipc	ra,0x0
    80007494:	018080e7          	jalr	24(ra) # 800074a8 <__printf>
    80007498:	00100793          	li	a5,1
    8000749c:	00004717          	auipc	a4,0x4
    800074a0:	52f72623          	sw	a5,1324(a4) # 8000b9c8 <panicked>
    800074a4:	0000006f          	j	800074a4 <panic+0x58>

00000000800074a8 <__printf>:
    800074a8:	f3010113          	addi	sp,sp,-208
    800074ac:	08813023          	sd	s0,128(sp)
    800074b0:	07313423          	sd	s3,104(sp)
    800074b4:	09010413          	addi	s0,sp,144
    800074b8:	05813023          	sd	s8,64(sp)
    800074bc:	08113423          	sd	ra,136(sp)
    800074c0:	06913c23          	sd	s1,120(sp)
    800074c4:	07213823          	sd	s2,112(sp)
    800074c8:	07413023          	sd	s4,96(sp)
    800074cc:	05513c23          	sd	s5,88(sp)
    800074d0:	05613823          	sd	s6,80(sp)
    800074d4:	05713423          	sd	s7,72(sp)
    800074d8:	03913c23          	sd	s9,56(sp)
    800074dc:	03a13823          	sd	s10,48(sp)
    800074e0:	03b13423          	sd	s11,40(sp)
    800074e4:	00005317          	auipc	t1,0x5
    800074e8:	7cc30313          	addi	t1,t1,1996 # 8000ccb0 <pr>
    800074ec:	01832c03          	lw	s8,24(t1)
    800074f0:	00b43423          	sd	a1,8(s0)
    800074f4:	00c43823          	sd	a2,16(s0)
    800074f8:	00d43c23          	sd	a3,24(s0)
    800074fc:	02e43023          	sd	a4,32(s0)
    80007500:	02f43423          	sd	a5,40(s0)
    80007504:	03043823          	sd	a6,48(s0)
    80007508:	03143c23          	sd	a7,56(s0)
    8000750c:	00050993          	mv	s3,a0
    80007510:	4a0c1663          	bnez	s8,800079bc <__printf+0x514>
    80007514:	60098c63          	beqz	s3,80007b2c <__printf+0x684>
    80007518:	0009c503          	lbu	a0,0(s3)
    8000751c:	00840793          	addi	a5,s0,8
    80007520:	f6f43c23          	sd	a5,-136(s0)
    80007524:	00000493          	li	s1,0
    80007528:	22050063          	beqz	a0,80007748 <__printf+0x2a0>
    8000752c:	00002a37          	lui	s4,0x2
    80007530:	00018ab7          	lui	s5,0x18
    80007534:	000f4b37          	lui	s6,0xf4
    80007538:	00989bb7          	lui	s7,0x989
    8000753c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80007540:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80007544:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80007548:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000754c:	00148c9b          	addiw	s9,s1,1
    80007550:	02500793          	li	a5,37
    80007554:	01998933          	add	s2,s3,s9
    80007558:	38f51263          	bne	a0,a5,800078dc <__printf+0x434>
    8000755c:	00094783          	lbu	a5,0(s2)
    80007560:	00078c9b          	sext.w	s9,a5
    80007564:	1e078263          	beqz	a5,80007748 <__printf+0x2a0>
    80007568:	0024849b          	addiw	s1,s1,2
    8000756c:	07000713          	li	a4,112
    80007570:	00998933          	add	s2,s3,s1
    80007574:	38e78a63          	beq	a5,a4,80007908 <__printf+0x460>
    80007578:	20f76863          	bltu	a4,a5,80007788 <__printf+0x2e0>
    8000757c:	42a78863          	beq	a5,a0,800079ac <__printf+0x504>
    80007580:	06400713          	li	a4,100
    80007584:	40e79663          	bne	a5,a4,80007990 <__printf+0x4e8>
    80007588:	f7843783          	ld	a5,-136(s0)
    8000758c:	0007a603          	lw	a2,0(a5)
    80007590:	00878793          	addi	a5,a5,8
    80007594:	f6f43c23          	sd	a5,-136(s0)
    80007598:	42064a63          	bltz	a2,800079cc <__printf+0x524>
    8000759c:	00a00713          	li	a4,10
    800075a0:	02e677bb          	remuw	a5,a2,a4
    800075a4:	00002d97          	auipc	s11,0x2
    800075a8:	2b4d8d93          	addi	s11,s11,692 # 80009858 <digits>
    800075ac:	00900593          	li	a1,9
    800075b0:	0006051b          	sext.w	a0,a2
    800075b4:	00000c93          	li	s9,0
    800075b8:	02079793          	slli	a5,a5,0x20
    800075bc:	0207d793          	srli	a5,a5,0x20
    800075c0:	00fd87b3          	add	a5,s11,a5
    800075c4:	0007c783          	lbu	a5,0(a5)
    800075c8:	02e656bb          	divuw	a3,a2,a4
    800075cc:	f8f40023          	sb	a5,-128(s0)
    800075d0:	14c5d863          	bge	a1,a2,80007720 <__printf+0x278>
    800075d4:	06300593          	li	a1,99
    800075d8:	00100c93          	li	s9,1
    800075dc:	02e6f7bb          	remuw	a5,a3,a4
    800075e0:	02079793          	slli	a5,a5,0x20
    800075e4:	0207d793          	srli	a5,a5,0x20
    800075e8:	00fd87b3          	add	a5,s11,a5
    800075ec:	0007c783          	lbu	a5,0(a5)
    800075f0:	02e6d73b          	divuw	a4,a3,a4
    800075f4:	f8f400a3          	sb	a5,-127(s0)
    800075f8:	12a5f463          	bgeu	a1,a0,80007720 <__printf+0x278>
    800075fc:	00a00693          	li	a3,10
    80007600:	00900593          	li	a1,9
    80007604:	02d777bb          	remuw	a5,a4,a3
    80007608:	02079793          	slli	a5,a5,0x20
    8000760c:	0207d793          	srli	a5,a5,0x20
    80007610:	00fd87b3          	add	a5,s11,a5
    80007614:	0007c503          	lbu	a0,0(a5)
    80007618:	02d757bb          	divuw	a5,a4,a3
    8000761c:	f8a40123          	sb	a0,-126(s0)
    80007620:	48e5f263          	bgeu	a1,a4,80007aa4 <__printf+0x5fc>
    80007624:	06300513          	li	a0,99
    80007628:	02d7f5bb          	remuw	a1,a5,a3
    8000762c:	02059593          	slli	a1,a1,0x20
    80007630:	0205d593          	srli	a1,a1,0x20
    80007634:	00bd85b3          	add	a1,s11,a1
    80007638:	0005c583          	lbu	a1,0(a1)
    8000763c:	02d7d7bb          	divuw	a5,a5,a3
    80007640:	f8b401a3          	sb	a1,-125(s0)
    80007644:	48e57263          	bgeu	a0,a4,80007ac8 <__printf+0x620>
    80007648:	3e700513          	li	a0,999
    8000764c:	02d7f5bb          	remuw	a1,a5,a3
    80007650:	02059593          	slli	a1,a1,0x20
    80007654:	0205d593          	srli	a1,a1,0x20
    80007658:	00bd85b3          	add	a1,s11,a1
    8000765c:	0005c583          	lbu	a1,0(a1)
    80007660:	02d7d7bb          	divuw	a5,a5,a3
    80007664:	f8b40223          	sb	a1,-124(s0)
    80007668:	46e57663          	bgeu	a0,a4,80007ad4 <__printf+0x62c>
    8000766c:	02d7f5bb          	remuw	a1,a5,a3
    80007670:	02059593          	slli	a1,a1,0x20
    80007674:	0205d593          	srli	a1,a1,0x20
    80007678:	00bd85b3          	add	a1,s11,a1
    8000767c:	0005c583          	lbu	a1,0(a1)
    80007680:	02d7d7bb          	divuw	a5,a5,a3
    80007684:	f8b402a3          	sb	a1,-123(s0)
    80007688:	46ea7863          	bgeu	s4,a4,80007af8 <__printf+0x650>
    8000768c:	02d7f5bb          	remuw	a1,a5,a3
    80007690:	02059593          	slli	a1,a1,0x20
    80007694:	0205d593          	srli	a1,a1,0x20
    80007698:	00bd85b3          	add	a1,s11,a1
    8000769c:	0005c583          	lbu	a1,0(a1)
    800076a0:	02d7d7bb          	divuw	a5,a5,a3
    800076a4:	f8b40323          	sb	a1,-122(s0)
    800076a8:	3eeaf863          	bgeu	s5,a4,80007a98 <__printf+0x5f0>
    800076ac:	02d7f5bb          	remuw	a1,a5,a3
    800076b0:	02059593          	slli	a1,a1,0x20
    800076b4:	0205d593          	srli	a1,a1,0x20
    800076b8:	00bd85b3          	add	a1,s11,a1
    800076bc:	0005c583          	lbu	a1,0(a1)
    800076c0:	02d7d7bb          	divuw	a5,a5,a3
    800076c4:	f8b403a3          	sb	a1,-121(s0)
    800076c8:	42eb7e63          	bgeu	s6,a4,80007b04 <__printf+0x65c>
    800076cc:	02d7f5bb          	remuw	a1,a5,a3
    800076d0:	02059593          	slli	a1,a1,0x20
    800076d4:	0205d593          	srli	a1,a1,0x20
    800076d8:	00bd85b3          	add	a1,s11,a1
    800076dc:	0005c583          	lbu	a1,0(a1)
    800076e0:	02d7d7bb          	divuw	a5,a5,a3
    800076e4:	f8b40423          	sb	a1,-120(s0)
    800076e8:	42ebfc63          	bgeu	s7,a4,80007b20 <__printf+0x678>
    800076ec:	02079793          	slli	a5,a5,0x20
    800076f0:	0207d793          	srli	a5,a5,0x20
    800076f4:	00fd8db3          	add	s11,s11,a5
    800076f8:	000dc703          	lbu	a4,0(s11)
    800076fc:	00a00793          	li	a5,10
    80007700:	00900c93          	li	s9,9
    80007704:	f8e404a3          	sb	a4,-119(s0)
    80007708:	00065c63          	bgez	a2,80007720 <__printf+0x278>
    8000770c:	f9040713          	addi	a4,s0,-112
    80007710:	00f70733          	add	a4,a4,a5
    80007714:	02d00693          	li	a3,45
    80007718:	fed70823          	sb	a3,-16(a4)
    8000771c:	00078c93          	mv	s9,a5
    80007720:	f8040793          	addi	a5,s0,-128
    80007724:	01978cb3          	add	s9,a5,s9
    80007728:	f7f40d13          	addi	s10,s0,-129
    8000772c:	000cc503          	lbu	a0,0(s9)
    80007730:	fffc8c93          	addi	s9,s9,-1
    80007734:	00000097          	auipc	ra,0x0
    80007738:	b90080e7          	jalr	-1136(ra) # 800072c4 <consputc>
    8000773c:	ffac98e3          	bne	s9,s10,8000772c <__printf+0x284>
    80007740:	00094503          	lbu	a0,0(s2)
    80007744:	e00514e3          	bnez	a0,8000754c <__printf+0xa4>
    80007748:	1a0c1663          	bnez	s8,800078f4 <__printf+0x44c>
    8000774c:	08813083          	ld	ra,136(sp)
    80007750:	08013403          	ld	s0,128(sp)
    80007754:	07813483          	ld	s1,120(sp)
    80007758:	07013903          	ld	s2,112(sp)
    8000775c:	06813983          	ld	s3,104(sp)
    80007760:	06013a03          	ld	s4,96(sp)
    80007764:	05813a83          	ld	s5,88(sp)
    80007768:	05013b03          	ld	s6,80(sp)
    8000776c:	04813b83          	ld	s7,72(sp)
    80007770:	04013c03          	ld	s8,64(sp)
    80007774:	03813c83          	ld	s9,56(sp)
    80007778:	03013d03          	ld	s10,48(sp)
    8000777c:	02813d83          	ld	s11,40(sp)
    80007780:	0d010113          	addi	sp,sp,208
    80007784:	00008067          	ret
    80007788:	07300713          	li	a4,115
    8000778c:	1ce78a63          	beq	a5,a4,80007960 <__printf+0x4b8>
    80007790:	07800713          	li	a4,120
    80007794:	1ee79e63          	bne	a5,a4,80007990 <__printf+0x4e8>
    80007798:	f7843783          	ld	a5,-136(s0)
    8000779c:	0007a703          	lw	a4,0(a5)
    800077a0:	00878793          	addi	a5,a5,8
    800077a4:	f6f43c23          	sd	a5,-136(s0)
    800077a8:	28074263          	bltz	a4,80007a2c <__printf+0x584>
    800077ac:	00002d97          	auipc	s11,0x2
    800077b0:	0acd8d93          	addi	s11,s11,172 # 80009858 <digits>
    800077b4:	00f77793          	andi	a5,a4,15
    800077b8:	00fd87b3          	add	a5,s11,a5
    800077bc:	0007c683          	lbu	a3,0(a5)
    800077c0:	00f00613          	li	a2,15
    800077c4:	0007079b          	sext.w	a5,a4
    800077c8:	f8d40023          	sb	a3,-128(s0)
    800077cc:	0047559b          	srliw	a1,a4,0x4
    800077d0:	0047569b          	srliw	a3,a4,0x4
    800077d4:	00000c93          	li	s9,0
    800077d8:	0ee65063          	bge	a2,a4,800078b8 <__printf+0x410>
    800077dc:	00f6f693          	andi	a3,a3,15
    800077e0:	00dd86b3          	add	a3,s11,a3
    800077e4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800077e8:	0087d79b          	srliw	a5,a5,0x8
    800077ec:	00100c93          	li	s9,1
    800077f0:	f8d400a3          	sb	a3,-127(s0)
    800077f4:	0cb67263          	bgeu	a2,a1,800078b8 <__printf+0x410>
    800077f8:	00f7f693          	andi	a3,a5,15
    800077fc:	00dd86b3          	add	a3,s11,a3
    80007800:	0006c583          	lbu	a1,0(a3)
    80007804:	00f00613          	li	a2,15
    80007808:	0047d69b          	srliw	a3,a5,0x4
    8000780c:	f8b40123          	sb	a1,-126(s0)
    80007810:	0047d593          	srli	a1,a5,0x4
    80007814:	28f67e63          	bgeu	a2,a5,80007ab0 <__printf+0x608>
    80007818:	00f6f693          	andi	a3,a3,15
    8000781c:	00dd86b3          	add	a3,s11,a3
    80007820:	0006c503          	lbu	a0,0(a3)
    80007824:	0087d813          	srli	a6,a5,0x8
    80007828:	0087d69b          	srliw	a3,a5,0x8
    8000782c:	f8a401a3          	sb	a0,-125(s0)
    80007830:	28b67663          	bgeu	a2,a1,80007abc <__printf+0x614>
    80007834:	00f6f693          	andi	a3,a3,15
    80007838:	00dd86b3          	add	a3,s11,a3
    8000783c:	0006c583          	lbu	a1,0(a3)
    80007840:	00c7d513          	srli	a0,a5,0xc
    80007844:	00c7d69b          	srliw	a3,a5,0xc
    80007848:	f8b40223          	sb	a1,-124(s0)
    8000784c:	29067a63          	bgeu	a2,a6,80007ae0 <__printf+0x638>
    80007850:	00f6f693          	andi	a3,a3,15
    80007854:	00dd86b3          	add	a3,s11,a3
    80007858:	0006c583          	lbu	a1,0(a3)
    8000785c:	0107d813          	srli	a6,a5,0x10
    80007860:	0107d69b          	srliw	a3,a5,0x10
    80007864:	f8b402a3          	sb	a1,-123(s0)
    80007868:	28a67263          	bgeu	a2,a0,80007aec <__printf+0x644>
    8000786c:	00f6f693          	andi	a3,a3,15
    80007870:	00dd86b3          	add	a3,s11,a3
    80007874:	0006c683          	lbu	a3,0(a3)
    80007878:	0147d79b          	srliw	a5,a5,0x14
    8000787c:	f8d40323          	sb	a3,-122(s0)
    80007880:	21067663          	bgeu	a2,a6,80007a8c <__printf+0x5e4>
    80007884:	02079793          	slli	a5,a5,0x20
    80007888:	0207d793          	srli	a5,a5,0x20
    8000788c:	00fd8db3          	add	s11,s11,a5
    80007890:	000dc683          	lbu	a3,0(s11)
    80007894:	00800793          	li	a5,8
    80007898:	00700c93          	li	s9,7
    8000789c:	f8d403a3          	sb	a3,-121(s0)
    800078a0:	00075c63          	bgez	a4,800078b8 <__printf+0x410>
    800078a4:	f9040713          	addi	a4,s0,-112
    800078a8:	00f70733          	add	a4,a4,a5
    800078ac:	02d00693          	li	a3,45
    800078b0:	fed70823          	sb	a3,-16(a4)
    800078b4:	00078c93          	mv	s9,a5
    800078b8:	f8040793          	addi	a5,s0,-128
    800078bc:	01978cb3          	add	s9,a5,s9
    800078c0:	f7f40d13          	addi	s10,s0,-129
    800078c4:	000cc503          	lbu	a0,0(s9)
    800078c8:	fffc8c93          	addi	s9,s9,-1
    800078cc:	00000097          	auipc	ra,0x0
    800078d0:	9f8080e7          	jalr	-1544(ra) # 800072c4 <consputc>
    800078d4:	ff9d18e3          	bne	s10,s9,800078c4 <__printf+0x41c>
    800078d8:	0100006f          	j	800078e8 <__printf+0x440>
    800078dc:	00000097          	auipc	ra,0x0
    800078e0:	9e8080e7          	jalr	-1560(ra) # 800072c4 <consputc>
    800078e4:	000c8493          	mv	s1,s9
    800078e8:	00094503          	lbu	a0,0(s2)
    800078ec:	c60510e3          	bnez	a0,8000754c <__printf+0xa4>
    800078f0:	e40c0ee3          	beqz	s8,8000774c <__printf+0x2a4>
    800078f4:	00005517          	auipc	a0,0x5
    800078f8:	3bc50513          	addi	a0,a0,956 # 8000ccb0 <pr>
    800078fc:	00001097          	auipc	ra,0x1
    80007900:	94c080e7          	jalr	-1716(ra) # 80008248 <release>
    80007904:	e49ff06f          	j	8000774c <__printf+0x2a4>
    80007908:	f7843783          	ld	a5,-136(s0)
    8000790c:	03000513          	li	a0,48
    80007910:	01000d13          	li	s10,16
    80007914:	00878713          	addi	a4,a5,8
    80007918:	0007bc83          	ld	s9,0(a5)
    8000791c:	f6e43c23          	sd	a4,-136(s0)
    80007920:	00000097          	auipc	ra,0x0
    80007924:	9a4080e7          	jalr	-1628(ra) # 800072c4 <consputc>
    80007928:	07800513          	li	a0,120
    8000792c:	00000097          	auipc	ra,0x0
    80007930:	998080e7          	jalr	-1640(ra) # 800072c4 <consputc>
    80007934:	00002d97          	auipc	s11,0x2
    80007938:	f24d8d93          	addi	s11,s11,-220 # 80009858 <digits>
    8000793c:	03ccd793          	srli	a5,s9,0x3c
    80007940:	00fd87b3          	add	a5,s11,a5
    80007944:	0007c503          	lbu	a0,0(a5)
    80007948:	fffd0d1b          	addiw	s10,s10,-1
    8000794c:	004c9c93          	slli	s9,s9,0x4
    80007950:	00000097          	auipc	ra,0x0
    80007954:	974080e7          	jalr	-1676(ra) # 800072c4 <consputc>
    80007958:	fe0d12e3          	bnez	s10,8000793c <__printf+0x494>
    8000795c:	f8dff06f          	j	800078e8 <__printf+0x440>
    80007960:	f7843783          	ld	a5,-136(s0)
    80007964:	0007bc83          	ld	s9,0(a5)
    80007968:	00878793          	addi	a5,a5,8
    8000796c:	f6f43c23          	sd	a5,-136(s0)
    80007970:	000c9a63          	bnez	s9,80007984 <__printf+0x4dc>
    80007974:	1080006f          	j	80007a7c <__printf+0x5d4>
    80007978:	001c8c93          	addi	s9,s9,1
    8000797c:	00000097          	auipc	ra,0x0
    80007980:	948080e7          	jalr	-1720(ra) # 800072c4 <consputc>
    80007984:	000cc503          	lbu	a0,0(s9)
    80007988:	fe0518e3          	bnez	a0,80007978 <__printf+0x4d0>
    8000798c:	f5dff06f          	j	800078e8 <__printf+0x440>
    80007990:	02500513          	li	a0,37
    80007994:	00000097          	auipc	ra,0x0
    80007998:	930080e7          	jalr	-1744(ra) # 800072c4 <consputc>
    8000799c:	000c8513          	mv	a0,s9
    800079a0:	00000097          	auipc	ra,0x0
    800079a4:	924080e7          	jalr	-1756(ra) # 800072c4 <consputc>
    800079a8:	f41ff06f          	j	800078e8 <__printf+0x440>
    800079ac:	02500513          	li	a0,37
    800079b0:	00000097          	auipc	ra,0x0
    800079b4:	914080e7          	jalr	-1772(ra) # 800072c4 <consputc>
    800079b8:	f31ff06f          	j	800078e8 <__printf+0x440>
    800079bc:	00030513          	mv	a0,t1
    800079c0:	00000097          	auipc	ra,0x0
    800079c4:	7bc080e7          	jalr	1980(ra) # 8000817c <acquire>
    800079c8:	b4dff06f          	j	80007514 <__printf+0x6c>
    800079cc:	40c0053b          	negw	a0,a2
    800079d0:	00a00713          	li	a4,10
    800079d4:	02e576bb          	remuw	a3,a0,a4
    800079d8:	00002d97          	auipc	s11,0x2
    800079dc:	e80d8d93          	addi	s11,s11,-384 # 80009858 <digits>
    800079e0:	ff700593          	li	a1,-9
    800079e4:	02069693          	slli	a3,a3,0x20
    800079e8:	0206d693          	srli	a3,a3,0x20
    800079ec:	00dd86b3          	add	a3,s11,a3
    800079f0:	0006c683          	lbu	a3,0(a3)
    800079f4:	02e557bb          	divuw	a5,a0,a4
    800079f8:	f8d40023          	sb	a3,-128(s0)
    800079fc:	10b65e63          	bge	a2,a1,80007b18 <__printf+0x670>
    80007a00:	06300593          	li	a1,99
    80007a04:	02e7f6bb          	remuw	a3,a5,a4
    80007a08:	02069693          	slli	a3,a3,0x20
    80007a0c:	0206d693          	srli	a3,a3,0x20
    80007a10:	00dd86b3          	add	a3,s11,a3
    80007a14:	0006c683          	lbu	a3,0(a3)
    80007a18:	02e7d73b          	divuw	a4,a5,a4
    80007a1c:	00200793          	li	a5,2
    80007a20:	f8d400a3          	sb	a3,-127(s0)
    80007a24:	bca5ece3          	bltu	a1,a0,800075fc <__printf+0x154>
    80007a28:	ce5ff06f          	j	8000770c <__printf+0x264>
    80007a2c:	40e007bb          	negw	a5,a4
    80007a30:	00002d97          	auipc	s11,0x2
    80007a34:	e28d8d93          	addi	s11,s11,-472 # 80009858 <digits>
    80007a38:	00f7f693          	andi	a3,a5,15
    80007a3c:	00dd86b3          	add	a3,s11,a3
    80007a40:	0006c583          	lbu	a1,0(a3)
    80007a44:	ff100613          	li	a2,-15
    80007a48:	0047d69b          	srliw	a3,a5,0x4
    80007a4c:	f8b40023          	sb	a1,-128(s0)
    80007a50:	0047d59b          	srliw	a1,a5,0x4
    80007a54:	0ac75e63          	bge	a4,a2,80007b10 <__printf+0x668>
    80007a58:	00f6f693          	andi	a3,a3,15
    80007a5c:	00dd86b3          	add	a3,s11,a3
    80007a60:	0006c603          	lbu	a2,0(a3)
    80007a64:	00f00693          	li	a3,15
    80007a68:	0087d79b          	srliw	a5,a5,0x8
    80007a6c:	f8c400a3          	sb	a2,-127(s0)
    80007a70:	d8b6e4e3          	bltu	a3,a1,800077f8 <__printf+0x350>
    80007a74:	00200793          	li	a5,2
    80007a78:	e2dff06f          	j	800078a4 <__printf+0x3fc>
    80007a7c:	00002c97          	auipc	s9,0x2
    80007a80:	dbcc8c93          	addi	s9,s9,-580 # 80009838 <CONSOLE_STATUS+0x828>
    80007a84:	02800513          	li	a0,40
    80007a88:	ef1ff06f          	j	80007978 <__printf+0x4d0>
    80007a8c:	00700793          	li	a5,7
    80007a90:	00600c93          	li	s9,6
    80007a94:	e0dff06f          	j	800078a0 <__printf+0x3f8>
    80007a98:	00700793          	li	a5,7
    80007a9c:	00600c93          	li	s9,6
    80007aa0:	c69ff06f          	j	80007708 <__printf+0x260>
    80007aa4:	00300793          	li	a5,3
    80007aa8:	00200c93          	li	s9,2
    80007aac:	c5dff06f          	j	80007708 <__printf+0x260>
    80007ab0:	00300793          	li	a5,3
    80007ab4:	00200c93          	li	s9,2
    80007ab8:	de9ff06f          	j	800078a0 <__printf+0x3f8>
    80007abc:	00400793          	li	a5,4
    80007ac0:	00300c93          	li	s9,3
    80007ac4:	dddff06f          	j	800078a0 <__printf+0x3f8>
    80007ac8:	00400793          	li	a5,4
    80007acc:	00300c93          	li	s9,3
    80007ad0:	c39ff06f          	j	80007708 <__printf+0x260>
    80007ad4:	00500793          	li	a5,5
    80007ad8:	00400c93          	li	s9,4
    80007adc:	c2dff06f          	j	80007708 <__printf+0x260>
    80007ae0:	00500793          	li	a5,5
    80007ae4:	00400c93          	li	s9,4
    80007ae8:	db9ff06f          	j	800078a0 <__printf+0x3f8>
    80007aec:	00600793          	li	a5,6
    80007af0:	00500c93          	li	s9,5
    80007af4:	dadff06f          	j	800078a0 <__printf+0x3f8>
    80007af8:	00600793          	li	a5,6
    80007afc:	00500c93          	li	s9,5
    80007b00:	c09ff06f          	j	80007708 <__printf+0x260>
    80007b04:	00800793          	li	a5,8
    80007b08:	00700c93          	li	s9,7
    80007b0c:	bfdff06f          	j	80007708 <__printf+0x260>
    80007b10:	00100793          	li	a5,1
    80007b14:	d91ff06f          	j	800078a4 <__printf+0x3fc>
    80007b18:	00100793          	li	a5,1
    80007b1c:	bf1ff06f          	j	8000770c <__printf+0x264>
    80007b20:	00900793          	li	a5,9
    80007b24:	00800c93          	li	s9,8
    80007b28:	be1ff06f          	j	80007708 <__printf+0x260>
    80007b2c:	00002517          	auipc	a0,0x2
    80007b30:	d1450513          	addi	a0,a0,-748 # 80009840 <CONSOLE_STATUS+0x830>
    80007b34:	00000097          	auipc	ra,0x0
    80007b38:	918080e7          	jalr	-1768(ra) # 8000744c <panic>

0000000080007b3c <printfinit>:
    80007b3c:	fe010113          	addi	sp,sp,-32
    80007b40:	00813823          	sd	s0,16(sp)
    80007b44:	00913423          	sd	s1,8(sp)
    80007b48:	00113c23          	sd	ra,24(sp)
    80007b4c:	02010413          	addi	s0,sp,32
    80007b50:	00005497          	auipc	s1,0x5
    80007b54:	16048493          	addi	s1,s1,352 # 8000ccb0 <pr>
    80007b58:	00048513          	mv	a0,s1
    80007b5c:	00002597          	auipc	a1,0x2
    80007b60:	cf458593          	addi	a1,a1,-780 # 80009850 <CONSOLE_STATUS+0x840>
    80007b64:	00000097          	auipc	ra,0x0
    80007b68:	5f4080e7          	jalr	1524(ra) # 80008158 <initlock>
    80007b6c:	01813083          	ld	ra,24(sp)
    80007b70:	01013403          	ld	s0,16(sp)
    80007b74:	0004ac23          	sw	zero,24(s1)
    80007b78:	00813483          	ld	s1,8(sp)
    80007b7c:	02010113          	addi	sp,sp,32
    80007b80:	00008067          	ret

0000000080007b84 <uartinit>:
    80007b84:	ff010113          	addi	sp,sp,-16
    80007b88:	00813423          	sd	s0,8(sp)
    80007b8c:	01010413          	addi	s0,sp,16
    80007b90:	100007b7          	lui	a5,0x10000
    80007b94:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80007b98:	f8000713          	li	a4,-128
    80007b9c:	00e781a3          	sb	a4,3(a5)
    80007ba0:	00300713          	li	a4,3
    80007ba4:	00e78023          	sb	a4,0(a5)
    80007ba8:	000780a3          	sb	zero,1(a5)
    80007bac:	00e781a3          	sb	a4,3(a5)
    80007bb0:	00700693          	li	a3,7
    80007bb4:	00d78123          	sb	a3,2(a5)
    80007bb8:	00e780a3          	sb	a4,1(a5)
    80007bbc:	00813403          	ld	s0,8(sp)
    80007bc0:	01010113          	addi	sp,sp,16
    80007bc4:	00008067          	ret

0000000080007bc8 <uartputc>:
    80007bc8:	00004797          	auipc	a5,0x4
    80007bcc:	e007a783          	lw	a5,-512(a5) # 8000b9c8 <panicked>
    80007bd0:	00078463          	beqz	a5,80007bd8 <uartputc+0x10>
    80007bd4:	0000006f          	j	80007bd4 <uartputc+0xc>
    80007bd8:	fd010113          	addi	sp,sp,-48
    80007bdc:	02813023          	sd	s0,32(sp)
    80007be0:	00913c23          	sd	s1,24(sp)
    80007be4:	01213823          	sd	s2,16(sp)
    80007be8:	01313423          	sd	s3,8(sp)
    80007bec:	02113423          	sd	ra,40(sp)
    80007bf0:	03010413          	addi	s0,sp,48
    80007bf4:	00004917          	auipc	s2,0x4
    80007bf8:	ddc90913          	addi	s2,s2,-548 # 8000b9d0 <uart_tx_r>
    80007bfc:	00093783          	ld	a5,0(s2)
    80007c00:	00004497          	auipc	s1,0x4
    80007c04:	dd848493          	addi	s1,s1,-552 # 8000b9d8 <uart_tx_w>
    80007c08:	0004b703          	ld	a4,0(s1)
    80007c0c:	02078693          	addi	a3,a5,32
    80007c10:	00050993          	mv	s3,a0
    80007c14:	02e69c63          	bne	a3,a4,80007c4c <uartputc+0x84>
    80007c18:	00001097          	auipc	ra,0x1
    80007c1c:	834080e7          	jalr	-1996(ra) # 8000844c <push_on>
    80007c20:	00093783          	ld	a5,0(s2)
    80007c24:	0004b703          	ld	a4,0(s1)
    80007c28:	02078793          	addi	a5,a5,32
    80007c2c:	00e79463          	bne	a5,a4,80007c34 <uartputc+0x6c>
    80007c30:	0000006f          	j	80007c30 <uartputc+0x68>
    80007c34:	00001097          	auipc	ra,0x1
    80007c38:	88c080e7          	jalr	-1908(ra) # 800084c0 <pop_on>
    80007c3c:	00093783          	ld	a5,0(s2)
    80007c40:	0004b703          	ld	a4,0(s1)
    80007c44:	02078693          	addi	a3,a5,32
    80007c48:	fce688e3          	beq	a3,a4,80007c18 <uartputc+0x50>
    80007c4c:	01f77693          	andi	a3,a4,31
    80007c50:	00005597          	auipc	a1,0x5
    80007c54:	08058593          	addi	a1,a1,128 # 8000ccd0 <uart_tx_buf>
    80007c58:	00d586b3          	add	a3,a1,a3
    80007c5c:	00170713          	addi	a4,a4,1
    80007c60:	01368023          	sb	s3,0(a3)
    80007c64:	00e4b023          	sd	a4,0(s1)
    80007c68:	10000637          	lui	a2,0x10000
    80007c6c:	02f71063          	bne	a4,a5,80007c8c <uartputc+0xc4>
    80007c70:	0340006f          	j	80007ca4 <uartputc+0xdc>
    80007c74:	00074703          	lbu	a4,0(a4)
    80007c78:	00f93023          	sd	a5,0(s2)
    80007c7c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80007c80:	00093783          	ld	a5,0(s2)
    80007c84:	0004b703          	ld	a4,0(s1)
    80007c88:	00f70e63          	beq	a4,a5,80007ca4 <uartputc+0xdc>
    80007c8c:	00564683          	lbu	a3,5(a2)
    80007c90:	01f7f713          	andi	a4,a5,31
    80007c94:	00e58733          	add	a4,a1,a4
    80007c98:	0206f693          	andi	a3,a3,32
    80007c9c:	00178793          	addi	a5,a5,1
    80007ca0:	fc069ae3          	bnez	a3,80007c74 <uartputc+0xac>
    80007ca4:	02813083          	ld	ra,40(sp)
    80007ca8:	02013403          	ld	s0,32(sp)
    80007cac:	01813483          	ld	s1,24(sp)
    80007cb0:	01013903          	ld	s2,16(sp)
    80007cb4:	00813983          	ld	s3,8(sp)
    80007cb8:	03010113          	addi	sp,sp,48
    80007cbc:	00008067          	ret

0000000080007cc0 <uartputc_sync>:
    80007cc0:	ff010113          	addi	sp,sp,-16
    80007cc4:	00813423          	sd	s0,8(sp)
    80007cc8:	01010413          	addi	s0,sp,16
    80007ccc:	00004717          	auipc	a4,0x4
    80007cd0:	cfc72703          	lw	a4,-772(a4) # 8000b9c8 <panicked>
    80007cd4:	02071663          	bnez	a4,80007d00 <uartputc_sync+0x40>
    80007cd8:	00050793          	mv	a5,a0
    80007cdc:	100006b7          	lui	a3,0x10000
    80007ce0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80007ce4:	02077713          	andi	a4,a4,32
    80007ce8:	fe070ce3          	beqz	a4,80007ce0 <uartputc_sync+0x20>
    80007cec:	0ff7f793          	andi	a5,a5,255
    80007cf0:	00f68023          	sb	a5,0(a3)
    80007cf4:	00813403          	ld	s0,8(sp)
    80007cf8:	01010113          	addi	sp,sp,16
    80007cfc:	00008067          	ret
    80007d00:	0000006f          	j	80007d00 <uartputc_sync+0x40>

0000000080007d04 <uartstart>:
    80007d04:	ff010113          	addi	sp,sp,-16
    80007d08:	00813423          	sd	s0,8(sp)
    80007d0c:	01010413          	addi	s0,sp,16
    80007d10:	00004617          	auipc	a2,0x4
    80007d14:	cc060613          	addi	a2,a2,-832 # 8000b9d0 <uart_tx_r>
    80007d18:	00004517          	auipc	a0,0x4
    80007d1c:	cc050513          	addi	a0,a0,-832 # 8000b9d8 <uart_tx_w>
    80007d20:	00063783          	ld	a5,0(a2)
    80007d24:	00053703          	ld	a4,0(a0)
    80007d28:	04f70263          	beq	a4,a5,80007d6c <uartstart+0x68>
    80007d2c:	100005b7          	lui	a1,0x10000
    80007d30:	00005817          	auipc	a6,0x5
    80007d34:	fa080813          	addi	a6,a6,-96 # 8000ccd0 <uart_tx_buf>
    80007d38:	01c0006f          	j	80007d54 <uartstart+0x50>
    80007d3c:	0006c703          	lbu	a4,0(a3)
    80007d40:	00f63023          	sd	a5,0(a2)
    80007d44:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80007d48:	00063783          	ld	a5,0(a2)
    80007d4c:	00053703          	ld	a4,0(a0)
    80007d50:	00f70e63          	beq	a4,a5,80007d6c <uartstart+0x68>
    80007d54:	01f7f713          	andi	a4,a5,31
    80007d58:	00e806b3          	add	a3,a6,a4
    80007d5c:	0055c703          	lbu	a4,5(a1)
    80007d60:	00178793          	addi	a5,a5,1
    80007d64:	02077713          	andi	a4,a4,32
    80007d68:	fc071ae3          	bnez	a4,80007d3c <uartstart+0x38>
    80007d6c:	00813403          	ld	s0,8(sp)
    80007d70:	01010113          	addi	sp,sp,16
    80007d74:	00008067          	ret

0000000080007d78 <uartgetc>:
    80007d78:	ff010113          	addi	sp,sp,-16
    80007d7c:	00813423          	sd	s0,8(sp)
    80007d80:	01010413          	addi	s0,sp,16
    80007d84:	10000737          	lui	a4,0x10000
    80007d88:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80007d8c:	0017f793          	andi	a5,a5,1
    80007d90:	00078c63          	beqz	a5,80007da8 <uartgetc+0x30>
    80007d94:	00074503          	lbu	a0,0(a4)
    80007d98:	0ff57513          	andi	a0,a0,255
    80007d9c:	00813403          	ld	s0,8(sp)
    80007da0:	01010113          	addi	sp,sp,16
    80007da4:	00008067          	ret
    80007da8:	fff00513          	li	a0,-1
    80007dac:	ff1ff06f          	j	80007d9c <uartgetc+0x24>

0000000080007db0 <uartintr>:
    80007db0:	100007b7          	lui	a5,0x10000
    80007db4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80007db8:	0017f793          	andi	a5,a5,1
    80007dbc:	0a078463          	beqz	a5,80007e64 <uartintr+0xb4>
    80007dc0:	fe010113          	addi	sp,sp,-32
    80007dc4:	00813823          	sd	s0,16(sp)
    80007dc8:	00913423          	sd	s1,8(sp)
    80007dcc:	00113c23          	sd	ra,24(sp)
    80007dd0:	02010413          	addi	s0,sp,32
    80007dd4:	100004b7          	lui	s1,0x10000
    80007dd8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80007ddc:	0ff57513          	andi	a0,a0,255
    80007de0:	fffff097          	auipc	ra,0xfffff
    80007de4:	534080e7          	jalr	1332(ra) # 80007314 <consoleintr>
    80007de8:	0054c783          	lbu	a5,5(s1)
    80007dec:	0017f793          	andi	a5,a5,1
    80007df0:	fe0794e3          	bnez	a5,80007dd8 <uartintr+0x28>
    80007df4:	00004617          	auipc	a2,0x4
    80007df8:	bdc60613          	addi	a2,a2,-1060 # 8000b9d0 <uart_tx_r>
    80007dfc:	00004517          	auipc	a0,0x4
    80007e00:	bdc50513          	addi	a0,a0,-1060 # 8000b9d8 <uart_tx_w>
    80007e04:	00063783          	ld	a5,0(a2)
    80007e08:	00053703          	ld	a4,0(a0)
    80007e0c:	04f70263          	beq	a4,a5,80007e50 <uartintr+0xa0>
    80007e10:	100005b7          	lui	a1,0x10000
    80007e14:	00005817          	auipc	a6,0x5
    80007e18:	ebc80813          	addi	a6,a6,-324 # 8000ccd0 <uart_tx_buf>
    80007e1c:	01c0006f          	j	80007e38 <uartintr+0x88>
    80007e20:	0006c703          	lbu	a4,0(a3)
    80007e24:	00f63023          	sd	a5,0(a2)
    80007e28:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80007e2c:	00063783          	ld	a5,0(a2)
    80007e30:	00053703          	ld	a4,0(a0)
    80007e34:	00f70e63          	beq	a4,a5,80007e50 <uartintr+0xa0>
    80007e38:	01f7f713          	andi	a4,a5,31
    80007e3c:	00e806b3          	add	a3,a6,a4
    80007e40:	0055c703          	lbu	a4,5(a1)
    80007e44:	00178793          	addi	a5,a5,1
    80007e48:	02077713          	andi	a4,a4,32
    80007e4c:	fc071ae3          	bnez	a4,80007e20 <uartintr+0x70>
    80007e50:	01813083          	ld	ra,24(sp)
    80007e54:	01013403          	ld	s0,16(sp)
    80007e58:	00813483          	ld	s1,8(sp)
    80007e5c:	02010113          	addi	sp,sp,32
    80007e60:	00008067          	ret
    80007e64:	00004617          	auipc	a2,0x4
    80007e68:	b6c60613          	addi	a2,a2,-1172 # 8000b9d0 <uart_tx_r>
    80007e6c:	00004517          	auipc	a0,0x4
    80007e70:	b6c50513          	addi	a0,a0,-1172 # 8000b9d8 <uart_tx_w>
    80007e74:	00063783          	ld	a5,0(a2)
    80007e78:	00053703          	ld	a4,0(a0)
    80007e7c:	04f70263          	beq	a4,a5,80007ec0 <uartintr+0x110>
    80007e80:	100005b7          	lui	a1,0x10000
    80007e84:	00005817          	auipc	a6,0x5
    80007e88:	e4c80813          	addi	a6,a6,-436 # 8000ccd0 <uart_tx_buf>
    80007e8c:	01c0006f          	j	80007ea8 <uartintr+0xf8>
    80007e90:	0006c703          	lbu	a4,0(a3)
    80007e94:	00f63023          	sd	a5,0(a2)
    80007e98:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80007e9c:	00063783          	ld	a5,0(a2)
    80007ea0:	00053703          	ld	a4,0(a0)
    80007ea4:	02f70063          	beq	a4,a5,80007ec4 <uartintr+0x114>
    80007ea8:	01f7f713          	andi	a4,a5,31
    80007eac:	00e806b3          	add	a3,a6,a4
    80007eb0:	0055c703          	lbu	a4,5(a1)
    80007eb4:	00178793          	addi	a5,a5,1
    80007eb8:	02077713          	andi	a4,a4,32
    80007ebc:	fc071ae3          	bnez	a4,80007e90 <uartintr+0xe0>
    80007ec0:	00008067          	ret
    80007ec4:	00008067          	ret

0000000080007ec8 <kinit>:
    80007ec8:	fc010113          	addi	sp,sp,-64
    80007ecc:	02913423          	sd	s1,40(sp)
    80007ed0:	fffff7b7          	lui	a5,0xfffff
    80007ed4:	00006497          	auipc	s1,0x6
    80007ed8:	e1b48493          	addi	s1,s1,-485 # 8000dcef <end+0xfff>
    80007edc:	02813823          	sd	s0,48(sp)
    80007ee0:	01313c23          	sd	s3,24(sp)
    80007ee4:	00f4f4b3          	and	s1,s1,a5
    80007ee8:	02113c23          	sd	ra,56(sp)
    80007eec:	03213023          	sd	s2,32(sp)
    80007ef0:	01413823          	sd	s4,16(sp)
    80007ef4:	01513423          	sd	s5,8(sp)
    80007ef8:	04010413          	addi	s0,sp,64
    80007efc:	000017b7          	lui	a5,0x1
    80007f00:	01100993          	li	s3,17
    80007f04:	00f487b3          	add	a5,s1,a5
    80007f08:	01b99993          	slli	s3,s3,0x1b
    80007f0c:	06f9e063          	bltu	s3,a5,80007f6c <kinit+0xa4>
    80007f10:	00005a97          	auipc	s5,0x5
    80007f14:	de0a8a93          	addi	s5,s5,-544 # 8000ccf0 <end>
    80007f18:	0754ec63          	bltu	s1,s5,80007f90 <kinit+0xc8>
    80007f1c:	0734fa63          	bgeu	s1,s3,80007f90 <kinit+0xc8>
    80007f20:	00088a37          	lui	s4,0x88
    80007f24:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80007f28:	00004917          	auipc	s2,0x4
    80007f2c:	ab890913          	addi	s2,s2,-1352 # 8000b9e0 <kmem>
    80007f30:	00ca1a13          	slli	s4,s4,0xc
    80007f34:	0140006f          	j	80007f48 <kinit+0x80>
    80007f38:	000017b7          	lui	a5,0x1
    80007f3c:	00f484b3          	add	s1,s1,a5
    80007f40:	0554e863          	bltu	s1,s5,80007f90 <kinit+0xc8>
    80007f44:	0534f663          	bgeu	s1,s3,80007f90 <kinit+0xc8>
    80007f48:	00001637          	lui	a2,0x1
    80007f4c:	00100593          	li	a1,1
    80007f50:	00048513          	mv	a0,s1
    80007f54:	00000097          	auipc	ra,0x0
    80007f58:	5e4080e7          	jalr	1508(ra) # 80008538 <__memset>
    80007f5c:	00093783          	ld	a5,0(s2)
    80007f60:	00f4b023          	sd	a5,0(s1)
    80007f64:	00993023          	sd	s1,0(s2)
    80007f68:	fd4498e3          	bne	s1,s4,80007f38 <kinit+0x70>
    80007f6c:	03813083          	ld	ra,56(sp)
    80007f70:	03013403          	ld	s0,48(sp)
    80007f74:	02813483          	ld	s1,40(sp)
    80007f78:	02013903          	ld	s2,32(sp)
    80007f7c:	01813983          	ld	s3,24(sp)
    80007f80:	01013a03          	ld	s4,16(sp)
    80007f84:	00813a83          	ld	s5,8(sp)
    80007f88:	04010113          	addi	sp,sp,64
    80007f8c:	00008067          	ret
    80007f90:	00002517          	auipc	a0,0x2
    80007f94:	8e050513          	addi	a0,a0,-1824 # 80009870 <digits+0x18>
    80007f98:	fffff097          	auipc	ra,0xfffff
    80007f9c:	4b4080e7          	jalr	1204(ra) # 8000744c <panic>

0000000080007fa0 <freerange>:
    80007fa0:	fc010113          	addi	sp,sp,-64
    80007fa4:	000017b7          	lui	a5,0x1
    80007fa8:	02913423          	sd	s1,40(sp)
    80007fac:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80007fb0:	009504b3          	add	s1,a0,s1
    80007fb4:	fffff537          	lui	a0,0xfffff
    80007fb8:	02813823          	sd	s0,48(sp)
    80007fbc:	02113c23          	sd	ra,56(sp)
    80007fc0:	03213023          	sd	s2,32(sp)
    80007fc4:	01313c23          	sd	s3,24(sp)
    80007fc8:	01413823          	sd	s4,16(sp)
    80007fcc:	01513423          	sd	s5,8(sp)
    80007fd0:	01613023          	sd	s6,0(sp)
    80007fd4:	04010413          	addi	s0,sp,64
    80007fd8:	00a4f4b3          	and	s1,s1,a0
    80007fdc:	00f487b3          	add	a5,s1,a5
    80007fe0:	06f5e463          	bltu	a1,a5,80008048 <freerange+0xa8>
    80007fe4:	00005a97          	auipc	s5,0x5
    80007fe8:	d0ca8a93          	addi	s5,s5,-756 # 8000ccf0 <end>
    80007fec:	0954e263          	bltu	s1,s5,80008070 <freerange+0xd0>
    80007ff0:	01100993          	li	s3,17
    80007ff4:	01b99993          	slli	s3,s3,0x1b
    80007ff8:	0734fc63          	bgeu	s1,s3,80008070 <freerange+0xd0>
    80007ffc:	00058a13          	mv	s4,a1
    80008000:	00004917          	auipc	s2,0x4
    80008004:	9e090913          	addi	s2,s2,-1568 # 8000b9e0 <kmem>
    80008008:	00002b37          	lui	s6,0x2
    8000800c:	0140006f          	j	80008020 <freerange+0x80>
    80008010:	000017b7          	lui	a5,0x1
    80008014:	00f484b3          	add	s1,s1,a5
    80008018:	0554ec63          	bltu	s1,s5,80008070 <freerange+0xd0>
    8000801c:	0534fa63          	bgeu	s1,s3,80008070 <freerange+0xd0>
    80008020:	00001637          	lui	a2,0x1
    80008024:	00100593          	li	a1,1
    80008028:	00048513          	mv	a0,s1
    8000802c:	00000097          	auipc	ra,0x0
    80008030:	50c080e7          	jalr	1292(ra) # 80008538 <__memset>
    80008034:	00093703          	ld	a4,0(s2)
    80008038:	016487b3          	add	a5,s1,s6
    8000803c:	00e4b023          	sd	a4,0(s1)
    80008040:	00993023          	sd	s1,0(s2)
    80008044:	fcfa76e3          	bgeu	s4,a5,80008010 <freerange+0x70>
    80008048:	03813083          	ld	ra,56(sp)
    8000804c:	03013403          	ld	s0,48(sp)
    80008050:	02813483          	ld	s1,40(sp)
    80008054:	02013903          	ld	s2,32(sp)
    80008058:	01813983          	ld	s3,24(sp)
    8000805c:	01013a03          	ld	s4,16(sp)
    80008060:	00813a83          	ld	s5,8(sp)
    80008064:	00013b03          	ld	s6,0(sp)
    80008068:	04010113          	addi	sp,sp,64
    8000806c:	00008067          	ret
    80008070:	00002517          	auipc	a0,0x2
    80008074:	80050513          	addi	a0,a0,-2048 # 80009870 <digits+0x18>
    80008078:	fffff097          	auipc	ra,0xfffff
    8000807c:	3d4080e7          	jalr	980(ra) # 8000744c <panic>

0000000080008080 <kfree>:
    80008080:	fe010113          	addi	sp,sp,-32
    80008084:	00813823          	sd	s0,16(sp)
    80008088:	00113c23          	sd	ra,24(sp)
    8000808c:	00913423          	sd	s1,8(sp)
    80008090:	02010413          	addi	s0,sp,32
    80008094:	03451793          	slli	a5,a0,0x34
    80008098:	04079c63          	bnez	a5,800080f0 <kfree+0x70>
    8000809c:	00005797          	auipc	a5,0x5
    800080a0:	c5478793          	addi	a5,a5,-940 # 8000ccf0 <end>
    800080a4:	00050493          	mv	s1,a0
    800080a8:	04f56463          	bltu	a0,a5,800080f0 <kfree+0x70>
    800080ac:	01100793          	li	a5,17
    800080b0:	01b79793          	slli	a5,a5,0x1b
    800080b4:	02f57e63          	bgeu	a0,a5,800080f0 <kfree+0x70>
    800080b8:	00001637          	lui	a2,0x1
    800080bc:	00100593          	li	a1,1
    800080c0:	00000097          	auipc	ra,0x0
    800080c4:	478080e7          	jalr	1144(ra) # 80008538 <__memset>
    800080c8:	00004797          	auipc	a5,0x4
    800080cc:	91878793          	addi	a5,a5,-1768 # 8000b9e0 <kmem>
    800080d0:	0007b703          	ld	a4,0(a5)
    800080d4:	01813083          	ld	ra,24(sp)
    800080d8:	01013403          	ld	s0,16(sp)
    800080dc:	00e4b023          	sd	a4,0(s1)
    800080e0:	0097b023          	sd	s1,0(a5)
    800080e4:	00813483          	ld	s1,8(sp)
    800080e8:	02010113          	addi	sp,sp,32
    800080ec:	00008067          	ret
    800080f0:	00001517          	auipc	a0,0x1
    800080f4:	78050513          	addi	a0,a0,1920 # 80009870 <digits+0x18>
    800080f8:	fffff097          	auipc	ra,0xfffff
    800080fc:	354080e7          	jalr	852(ra) # 8000744c <panic>

0000000080008100 <kalloc>:
    80008100:	fe010113          	addi	sp,sp,-32
    80008104:	00813823          	sd	s0,16(sp)
    80008108:	00913423          	sd	s1,8(sp)
    8000810c:	00113c23          	sd	ra,24(sp)
    80008110:	02010413          	addi	s0,sp,32
    80008114:	00004797          	auipc	a5,0x4
    80008118:	8cc78793          	addi	a5,a5,-1844 # 8000b9e0 <kmem>
    8000811c:	0007b483          	ld	s1,0(a5)
    80008120:	02048063          	beqz	s1,80008140 <kalloc+0x40>
    80008124:	0004b703          	ld	a4,0(s1)
    80008128:	00001637          	lui	a2,0x1
    8000812c:	00500593          	li	a1,5
    80008130:	00048513          	mv	a0,s1
    80008134:	00e7b023          	sd	a4,0(a5)
    80008138:	00000097          	auipc	ra,0x0
    8000813c:	400080e7          	jalr	1024(ra) # 80008538 <__memset>
    80008140:	01813083          	ld	ra,24(sp)
    80008144:	01013403          	ld	s0,16(sp)
    80008148:	00048513          	mv	a0,s1
    8000814c:	00813483          	ld	s1,8(sp)
    80008150:	02010113          	addi	sp,sp,32
    80008154:	00008067          	ret

0000000080008158 <initlock>:
    80008158:	ff010113          	addi	sp,sp,-16
    8000815c:	00813423          	sd	s0,8(sp)
    80008160:	01010413          	addi	s0,sp,16
    80008164:	00813403          	ld	s0,8(sp)
    80008168:	00b53423          	sd	a1,8(a0)
    8000816c:	00052023          	sw	zero,0(a0)
    80008170:	00053823          	sd	zero,16(a0)
    80008174:	01010113          	addi	sp,sp,16
    80008178:	00008067          	ret

000000008000817c <acquire>:
    8000817c:	fe010113          	addi	sp,sp,-32
    80008180:	00813823          	sd	s0,16(sp)
    80008184:	00913423          	sd	s1,8(sp)
    80008188:	00113c23          	sd	ra,24(sp)
    8000818c:	01213023          	sd	s2,0(sp)
    80008190:	02010413          	addi	s0,sp,32
    80008194:	00050493          	mv	s1,a0
    80008198:	10002973          	csrr	s2,sstatus
    8000819c:	100027f3          	csrr	a5,sstatus
    800081a0:	ffd7f793          	andi	a5,a5,-3
    800081a4:	10079073          	csrw	sstatus,a5
    800081a8:	fffff097          	auipc	ra,0xfffff
    800081ac:	8ec080e7          	jalr	-1812(ra) # 80006a94 <mycpu>
    800081b0:	07852783          	lw	a5,120(a0)
    800081b4:	06078e63          	beqz	a5,80008230 <acquire+0xb4>
    800081b8:	fffff097          	auipc	ra,0xfffff
    800081bc:	8dc080e7          	jalr	-1828(ra) # 80006a94 <mycpu>
    800081c0:	07852783          	lw	a5,120(a0)
    800081c4:	0004a703          	lw	a4,0(s1)
    800081c8:	0017879b          	addiw	a5,a5,1
    800081cc:	06f52c23          	sw	a5,120(a0)
    800081d0:	04071063          	bnez	a4,80008210 <acquire+0x94>
    800081d4:	00100713          	li	a4,1
    800081d8:	00070793          	mv	a5,a4
    800081dc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800081e0:	0007879b          	sext.w	a5,a5
    800081e4:	fe079ae3          	bnez	a5,800081d8 <acquire+0x5c>
    800081e8:	0ff0000f          	fence
    800081ec:	fffff097          	auipc	ra,0xfffff
    800081f0:	8a8080e7          	jalr	-1880(ra) # 80006a94 <mycpu>
    800081f4:	01813083          	ld	ra,24(sp)
    800081f8:	01013403          	ld	s0,16(sp)
    800081fc:	00a4b823          	sd	a0,16(s1)
    80008200:	00013903          	ld	s2,0(sp)
    80008204:	00813483          	ld	s1,8(sp)
    80008208:	02010113          	addi	sp,sp,32
    8000820c:	00008067          	ret
    80008210:	0104b903          	ld	s2,16(s1)
    80008214:	fffff097          	auipc	ra,0xfffff
    80008218:	880080e7          	jalr	-1920(ra) # 80006a94 <mycpu>
    8000821c:	faa91ce3          	bne	s2,a0,800081d4 <acquire+0x58>
    80008220:	00001517          	auipc	a0,0x1
    80008224:	65850513          	addi	a0,a0,1624 # 80009878 <digits+0x20>
    80008228:	fffff097          	auipc	ra,0xfffff
    8000822c:	224080e7          	jalr	548(ra) # 8000744c <panic>
    80008230:	00195913          	srli	s2,s2,0x1
    80008234:	fffff097          	auipc	ra,0xfffff
    80008238:	860080e7          	jalr	-1952(ra) # 80006a94 <mycpu>
    8000823c:	00197913          	andi	s2,s2,1
    80008240:	07252e23          	sw	s2,124(a0)
    80008244:	f75ff06f          	j	800081b8 <acquire+0x3c>

0000000080008248 <release>:
    80008248:	fe010113          	addi	sp,sp,-32
    8000824c:	00813823          	sd	s0,16(sp)
    80008250:	00113c23          	sd	ra,24(sp)
    80008254:	00913423          	sd	s1,8(sp)
    80008258:	01213023          	sd	s2,0(sp)
    8000825c:	02010413          	addi	s0,sp,32
    80008260:	00052783          	lw	a5,0(a0)
    80008264:	00079a63          	bnez	a5,80008278 <release+0x30>
    80008268:	00001517          	auipc	a0,0x1
    8000826c:	61850513          	addi	a0,a0,1560 # 80009880 <digits+0x28>
    80008270:	fffff097          	auipc	ra,0xfffff
    80008274:	1dc080e7          	jalr	476(ra) # 8000744c <panic>
    80008278:	01053903          	ld	s2,16(a0)
    8000827c:	00050493          	mv	s1,a0
    80008280:	fffff097          	auipc	ra,0xfffff
    80008284:	814080e7          	jalr	-2028(ra) # 80006a94 <mycpu>
    80008288:	fea910e3          	bne	s2,a0,80008268 <release+0x20>
    8000828c:	0004b823          	sd	zero,16(s1)
    80008290:	0ff0000f          	fence
    80008294:	0f50000f          	fence	iorw,ow
    80008298:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000829c:	ffffe097          	auipc	ra,0xffffe
    800082a0:	7f8080e7          	jalr	2040(ra) # 80006a94 <mycpu>
    800082a4:	100027f3          	csrr	a5,sstatus
    800082a8:	0027f793          	andi	a5,a5,2
    800082ac:	04079a63          	bnez	a5,80008300 <release+0xb8>
    800082b0:	07852783          	lw	a5,120(a0)
    800082b4:	02f05e63          	blez	a5,800082f0 <release+0xa8>
    800082b8:	fff7871b          	addiw	a4,a5,-1
    800082bc:	06e52c23          	sw	a4,120(a0)
    800082c0:	00071c63          	bnez	a4,800082d8 <release+0x90>
    800082c4:	07c52783          	lw	a5,124(a0)
    800082c8:	00078863          	beqz	a5,800082d8 <release+0x90>
    800082cc:	100027f3          	csrr	a5,sstatus
    800082d0:	0027e793          	ori	a5,a5,2
    800082d4:	10079073          	csrw	sstatus,a5
    800082d8:	01813083          	ld	ra,24(sp)
    800082dc:	01013403          	ld	s0,16(sp)
    800082e0:	00813483          	ld	s1,8(sp)
    800082e4:	00013903          	ld	s2,0(sp)
    800082e8:	02010113          	addi	sp,sp,32
    800082ec:	00008067          	ret
    800082f0:	00001517          	auipc	a0,0x1
    800082f4:	5b050513          	addi	a0,a0,1456 # 800098a0 <digits+0x48>
    800082f8:	fffff097          	auipc	ra,0xfffff
    800082fc:	154080e7          	jalr	340(ra) # 8000744c <panic>
    80008300:	00001517          	auipc	a0,0x1
    80008304:	58850513          	addi	a0,a0,1416 # 80009888 <digits+0x30>
    80008308:	fffff097          	auipc	ra,0xfffff
    8000830c:	144080e7          	jalr	324(ra) # 8000744c <panic>

0000000080008310 <holding>:
    80008310:	00052783          	lw	a5,0(a0)
    80008314:	00079663          	bnez	a5,80008320 <holding+0x10>
    80008318:	00000513          	li	a0,0
    8000831c:	00008067          	ret
    80008320:	fe010113          	addi	sp,sp,-32
    80008324:	00813823          	sd	s0,16(sp)
    80008328:	00913423          	sd	s1,8(sp)
    8000832c:	00113c23          	sd	ra,24(sp)
    80008330:	02010413          	addi	s0,sp,32
    80008334:	01053483          	ld	s1,16(a0)
    80008338:	ffffe097          	auipc	ra,0xffffe
    8000833c:	75c080e7          	jalr	1884(ra) # 80006a94 <mycpu>
    80008340:	01813083          	ld	ra,24(sp)
    80008344:	01013403          	ld	s0,16(sp)
    80008348:	40a48533          	sub	a0,s1,a0
    8000834c:	00153513          	seqz	a0,a0
    80008350:	00813483          	ld	s1,8(sp)
    80008354:	02010113          	addi	sp,sp,32
    80008358:	00008067          	ret

000000008000835c <push_off>:
    8000835c:	fe010113          	addi	sp,sp,-32
    80008360:	00813823          	sd	s0,16(sp)
    80008364:	00113c23          	sd	ra,24(sp)
    80008368:	00913423          	sd	s1,8(sp)
    8000836c:	02010413          	addi	s0,sp,32
    80008370:	100024f3          	csrr	s1,sstatus
    80008374:	100027f3          	csrr	a5,sstatus
    80008378:	ffd7f793          	andi	a5,a5,-3
    8000837c:	10079073          	csrw	sstatus,a5
    80008380:	ffffe097          	auipc	ra,0xffffe
    80008384:	714080e7          	jalr	1812(ra) # 80006a94 <mycpu>
    80008388:	07852783          	lw	a5,120(a0)
    8000838c:	02078663          	beqz	a5,800083b8 <push_off+0x5c>
    80008390:	ffffe097          	auipc	ra,0xffffe
    80008394:	704080e7          	jalr	1796(ra) # 80006a94 <mycpu>
    80008398:	07852783          	lw	a5,120(a0)
    8000839c:	01813083          	ld	ra,24(sp)
    800083a0:	01013403          	ld	s0,16(sp)
    800083a4:	0017879b          	addiw	a5,a5,1
    800083a8:	06f52c23          	sw	a5,120(a0)
    800083ac:	00813483          	ld	s1,8(sp)
    800083b0:	02010113          	addi	sp,sp,32
    800083b4:	00008067          	ret
    800083b8:	0014d493          	srli	s1,s1,0x1
    800083bc:	ffffe097          	auipc	ra,0xffffe
    800083c0:	6d8080e7          	jalr	1752(ra) # 80006a94 <mycpu>
    800083c4:	0014f493          	andi	s1,s1,1
    800083c8:	06952e23          	sw	s1,124(a0)
    800083cc:	fc5ff06f          	j	80008390 <push_off+0x34>

00000000800083d0 <pop_off>:
    800083d0:	ff010113          	addi	sp,sp,-16
    800083d4:	00813023          	sd	s0,0(sp)
    800083d8:	00113423          	sd	ra,8(sp)
    800083dc:	01010413          	addi	s0,sp,16
    800083e0:	ffffe097          	auipc	ra,0xffffe
    800083e4:	6b4080e7          	jalr	1716(ra) # 80006a94 <mycpu>
    800083e8:	100027f3          	csrr	a5,sstatus
    800083ec:	0027f793          	andi	a5,a5,2
    800083f0:	04079663          	bnez	a5,8000843c <pop_off+0x6c>
    800083f4:	07852783          	lw	a5,120(a0)
    800083f8:	02f05a63          	blez	a5,8000842c <pop_off+0x5c>
    800083fc:	fff7871b          	addiw	a4,a5,-1
    80008400:	06e52c23          	sw	a4,120(a0)
    80008404:	00071c63          	bnez	a4,8000841c <pop_off+0x4c>
    80008408:	07c52783          	lw	a5,124(a0)
    8000840c:	00078863          	beqz	a5,8000841c <pop_off+0x4c>
    80008410:	100027f3          	csrr	a5,sstatus
    80008414:	0027e793          	ori	a5,a5,2
    80008418:	10079073          	csrw	sstatus,a5
    8000841c:	00813083          	ld	ra,8(sp)
    80008420:	00013403          	ld	s0,0(sp)
    80008424:	01010113          	addi	sp,sp,16
    80008428:	00008067          	ret
    8000842c:	00001517          	auipc	a0,0x1
    80008430:	47450513          	addi	a0,a0,1140 # 800098a0 <digits+0x48>
    80008434:	fffff097          	auipc	ra,0xfffff
    80008438:	018080e7          	jalr	24(ra) # 8000744c <panic>
    8000843c:	00001517          	auipc	a0,0x1
    80008440:	44c50513          	addi	a0,a0,1100 # 80009888 <digits+0x30>
    80008444:	fffff097          	auipc	ra,0xfffff
    80008448:	008080e7          	jalr	8(ra) # 8000744c <panic>

000000008000844c <push_on>:
    8000844c:	fe010113          	addi	sp,sp,-32
    80008450:	00813823          	sd	s0,16(sp)
    80008454:	00113c23          	sd	ra,24(sp)
    80008458:	00913423          	sd	s1,8(sp)
    8000845c:	02010413          	addi	s0,sp,32
    80008460:	100024f3          	csrr	s1,sstatus
    80008464:	100027f3          	csrr	a5,sstatus
    80008468:	0027e793          	ori	a5,a5,2
    8000846c:	10079073          	csrw	sstatus,a5
    80008470:	ffffe097          	auipc	ra,0xffffe
    80008474:	624080e7          	jalr	1572(ra) # 80006a94 <mycpu>
    80008478:	07852783          	lw	a5,120(a0)
    8000847c:	02078663          	beqz	a5,800084a8 <push_on+0x5c>
    80008480:	ffffe097          	auipc	ra,0xffffe
    80008484:	614080e7          	jalr	1556(ra) # 80006a94 <mycpu>
    80008488:	07852783          	lw	a5,120(a0)
    8000848c:	01813083          	ld	ra,24(sp)
    80008490:	01013403          	ld	s0,16(sp)
    80008494:	0017879b          	addiw	a5,a5,1
    80008498:	06f52c23          	sw	a5,120(a0)
    8000849c:	00813483          	ld	s1,8(sp)
    800084a0:	02010113          	addi	sp,sp,32
    800084a4:	00008067          	ret
    800084a8:	0014d493          	srli	s1,s1,0x1
    800084ac:	ffffe097          	auipc	ra,0xffffe
    800084b0:	5e8080e7          	jalr	1512(ra) # 80006a94 <mycpu>
    800084b4:	0014f493          	andi	s1,s1,1
    800084b8:	06952e23          	sw	s1,124(a0)
    800084bc:	fc5ff06f          	j	80008480 <push_on+0x34>

00000000800084c0 <pop_on>:
    800084c0:	ff010113          	addi	sp,sp,-16
    800084c4:	00813023          	sd	s0,0(sp)
    800084c8:	00113423          	sd	ra,8(sp)
    800084cc:	01010413          	addi	s0,sp,16
    800084d0:	ffffe097          	auipc	ra,0xffffe
    800084d4:	5c4080e7          	jalr	1476(ra) # 80006a94 <mycpu>
    800084d8:	100027f3          	csrr	a5,sstatus
    800084dc:	0027f793          	andi	a5,a5,2
    800084e0:	04078463          	beqz	a5,80008528 <pop_on+0x68>
    800084e4:	07852783          	lw	a5,120(a0)
    800084e8:	02f05863          	blez	a5,80008518 <pop_on+0x58>
    800084ec:	fff7879b          	addiw	a5,a5,-1
    800084f0:	06f52c23          	sw	a5,120(a0)
    800084f4:	07853783          	ld	a5,120(a0)
    800084f8:	00079863          	bnez	a5,80008508 <pop_on+0x48>
    800084fc:	100027f3          	csrr	a5,sstatus
    80008500:	ffd7f793          	andi	a5,a5,-3
    80008504:	10079073          	csrw	sstatus,a5
    80008508:	00813083          	ld	ra,8(sp)
    8000850c:	00013403          	ld	s0,0(sp)
    80008510:	01010113          	addi	sp,sp,16
    80008514:	00008067          	ret
    80008518:	00001517          	auipc	a0,0x1
    8000851c:	3b050513          	addi	a0,a0,944 # 800098c8 <digits+0x70>
    80008520:	fffff097          	auipc	ra,0xfffff
    80008524:	f2c080e7          	jalr	-212(ra) # 8000744c <panic>
    80008528:	00001517          	auipc	a0,0x1
    8000852c:	38050513          	addi	a0,a0,896 # 800098a8 <digits+0x50>
    80008530:	fffff097          	auipc	ra,0xfffff
    80008534:	f1c080e7          	jalr	-228(ra) # 8000744c <panic>

0000000080008538 <__memset>:
    80008538:	ff010113          	addi	sp,sp,-16
    8000853c:	00813423          	sd	s0,8(sp)
    80008540:	01010413          	addi	s0,sp,16
    80008544:	1a060e63          	beqz	a2,80008700 <__memset+0x1c8>
    80008548:	40a007b3          	neg	a5,a0
    8000854c:	0077f793          	andi	a5,a5,7
    80008550:	00778693          	addi	a3,a5,7
    80008554:	00b00813          	li	a6,11
    80008558:	0ff5f593          	andi	a1,a1,255
    8000855c:	fff6071b          	addiw	a4,a2,-1
    80008560:	1b06e663          	bltu	a3,a6,8000870c <__memset+0x1d4>
    80008564:	1cd76463          	bltu	a4,a3,8000872c <__memset+0x1f4>
    80008568:	1a078e63          	beqz	a5,80008724 <__memset+0x1ec>
    8000856c:	00b50023          	sb	a1,0(a0)
    80008570:	00100713          	li	a4,1
    80008574:	1ae78463          	beq	a5,a4,8000871c <__memset+0x1e4>
    80008578:	00b500a3          	sb	a1,1(a0)
    8000857c:	00200713          	li	a4,2
    80008580:	1ae78a63          	beq	a5,a4,80008734 <__memset+0x1fc>
    80008584:	00b50123          	sb	a1,2(a0)
    80008588:	00300713          	li	a4,3
    8000858c:	18e78463          	beq	a5,a4,80008714 <__memset+0x1dc>
    80008590:	00b501a3          	sb	a1,3(a0)
    80008594:	00400713          	li	a4,4
    80008598:	1ae78263          	beq	a5,a4,8000873c <__memset+0x204>
    8000859c:	00b50223          	sb	a1,4(a0)
    800085a0:	00500713          	li	a4,5
    800085a4:	1ae78063          	beq	a5,a4,80008744 <__memset+0x20c>
    800085a8:	00b502a3          	sb	a1,5(a0)
    800085ac:	00700713          	li	a4,7
    800085b0:	18e79e63          	bne	a5,a4,8000874c <__memset+0x214>
    800085b4:	00b50323          	sb	a1,6(a0)
    800085b8:	00700e93          	li	t4,7
    800085bc:	00859713          	slli	a4,a1,0x8
    800085c0:	00e5e733          	or	a4,a1,a4
    800085c4:	01059e13          	slli	t3,a1,0x10
    800085c8:	01c76e33          	or	t3,a4,t3
    800085cc:	01859313          	slli	t1,a1,0x18
    800085d0:	006e6333          	or	t1,t3,t1
    800085d4:	02059893          	slli	a7,a1,0x20
    800085d8:	40f60e3b          	subw	t3,a2,a5
    800085dc:	011368b3          	or	a7,t1,a7
    800085e0:	02859813          	slli	a6,a1,0x28
    800085e4:	0108e833          	or	a6,a7,a6
    800085e8:	03059693          	slli	a3,a1,0x30
    800085ec:	003e589b          	srliw	a7,t3,0x3
    800085f0:	00d866b3          	or	a3,a6,a3
    800085f4:	03859713          	slli	a4,a1,0x38
    800085f8:	00389813          	slli	a6,a7,0x3
    800085fc:	00f507b3          	add	a5,a0,a5
    80008600:	00e6e733          	or	a4,a3,a4
    80008604:	000e089b          	sext.w	a7,t3
    80008608:	00f806b3          	add	a3,a6,a5
    8000860c:	00e7b023          	sd	a4,0(a5)
    80008610:	00878793          	addi	a5,a5,8
    80008614:	fed79ce3          	bne	a5,a3,8000860c <__memset+0xd4>
    80008618:	ff8e7793          	andi	a5,t3,-8
    8000861c:	0007871b          	sext.w	a4,a5
    80008620:	01d787bb          	addw	a5,a5,t4
    80008624:	0ce88e63          	beq	a7,a4,80008700 <__memset+0x1c8>
    80008628:	00f50733          	add	a4,a0,a5
    8000862c:	00b70023          	sb	a1,0(a4)
    80008630:	0017871b          	addiw	a4,a5,1
    80008634:	0cc77663          	bgeu	a4,a2,80008700 <__memset+0x1c8>
    80008638:	00e50733          	add	a4,a0,a4
    8000863c:	00b70023          	sb	a1,0(a4)
    80008640:	0027871b          	addiw	a4,a5,2
    80008644:	0ac77e63          	bgeu	a4,a2,80008700 <__memset+0x1c8>
    80008648:	00e50733          	add	a4,a0,a4
    8000864c:	00b70023          	sb	a1,0(a4)
    80008650:	0037871b          	addiw	a4,a5,3
    80008654:	0ac77663          	bgeu	a4,a2,80008700 <__memset+0x1c8>
    80008658:	00e50733          	add	a4,a0,a4
    8000865c:	00b70023          	sb	a1,0(a4)
    80008660:	0047871b          	addiw	a4,a5,4
    80008664:	08c77e63          	bgeu	a4,a2,80008700 <__memset+0x1c8>
    80008668:	00e50733          	add	a4,a0,a4
    8000866c:	00b70023          	sb	a1,0(a4)
    80008670:	0057871b          	addiw	a4,a5,5
    80008674:	08c77663          	bgeu	a4,a2,80008700 <__memset+0x1c8>
    80008678:	00e50733          	add	a4,a0,a4
    8000867c:	00b70023          	sb	a1,0(a4)
    80008680:	0067871b          	addiw	a4,a5,6
    80008684:	06c77e63          	bgeu	a4,a2,80008700 <__memset+0x1c8>
    80008688:	00e50733          	add	a4,a0,a4
    8000868c:	00b70023          	sb	a1,0(a4)
    80008690:	0077871b          	addiw	a4,a5,7
    80008694:	06c77663          	bgeu	a4,a2,80008700 <__memset+0x1c8>
    80008698:	00e50733          	add	a4,a0,a4
    8000869c:	00b70023          	sb	a1,0(a4)
    800086a0:	0087871b          	addiw	a4,a5,8
    800086a4:	04c77e63          	bgeu	a4,a2,80008700 <__memset+0x1c8>
    800086a8:	00e50733          	add	a4,a0,a4
    800086ac:	00b70023          	sb	a1,0(a4)
    800086b0:	0097871b          	addiw	a4,a5,9
    800086b4:	04c77663          	bgeu	a4,a2,80008700 <__memset+0x1c8>
    800086b8:	00e50733          	add	a4,a0,a4
    800086bc:	00b70023          	sb	a1,0(a4)
    800086c0:	00a7871b          	addiw	a4,a5,10
    800086c4:	02c77e63          	bgeu	a4,a2,80008700 <__memset+0x1c8>
    800086c8:	00e50733          	add	a4,a0,a4
    800086cc:	00b70023          	sb	a1,0(a4)
    800086d0:	00b7871b          	addiw	a4,a5,11
    800086d4:	02c77663          	bgeu	a4,a2,80008700 <__memset+0x1c8>
    800086d8:	00e50733          	add	a4,a0,a4
    800086dc:	00b70023          	sb	a1,0(a4)
    800086e0:	00c7871b          	addiw	a4,a5,12
    800086e4:	00c77e63          	bgeu	a4,a2,80008700 <__memset+0x1c8>
    800086e8:	00e50733          	add	a4,a0,a4
    800086ec:	00b70023          	sb	a1,0(a4)
    800086f0:	00d7879b          	addiw	a5,a5,13
    800086f4:	00c7f663          	bgeu	a5,a2,80008700 <__memset+0x1c8>
    800086f8:	00f507b3          	add	a5,a0,a5
    800086fc:	00b78023          	sb	a1,0(a5)
    80008700:	00813403          	ld	s0,8(sp)
    80008704:	01010113          	addi	sp,sp,16
    80008708:	00008067          	ret
    8000870c:	00b00693          	li	a3,11
    80008710:	e55ff06f          	j	80008564 <__memset+0x2c>
    80008714:	00300e93          	li	t4,3
    80008718:	ea5ff06f          	j	800085bc <__memset+0x84>
    8000871c:	00100e93          	li	t4,1
    80008720:	e9dff06f          	j	800085bc <__memset+0x84>
    80008724:	00000e93          	li	t4,0
    80008728:	e95ff06f          	j	800085bc <__memset+0x84>
    8000872c:	00000793          	li	a5,0
    80008730:	ef9ff06f          	j	80008628 <__memset+0xf0>
    80008734:	00200e93          	li	t4,2
    80008738:	e85ff06f          	j	800085bc <__memset+0x84>
    8000873c:	00400e93          	li	t4,4
    80008740:	e7dff06f          	j	800085bc <__memset+0x84>
    80008744:	00500e93          	li	t4,5
    80008748:	e75ff06f          	j	800085bc <__memset+0x84>
    8000874c:	00600e93          	li	t4,6
    80008750:	e6dff06f          	j	800085bc <__memset+0x84>

0000000080008754 <__memmove>:
    80008754:	ff010113          	addi	sp,sp,-16
    80008758:	00813423          	sd	s0,8(sp)
    8000875c:	01010413          	addi	s0,sp,16
    80008760:	0e060863          	beqz	a2,80008850 <__memmove+0xfc>
    80008764:	fff6069b          	addiw	a3,a2,-1
    80008768:	0006881b          	sext.w	a6,a3
    8000876c:	0ea5e863          	bltu	a1,a0,8000885c <__memmove+0x108>
    80008770:	00758713          	addi	a4,a1,7
    80008774:	00a5e7b3          	or	a5,a1,a0
    80008778:	40a70733          	sub	a4,a4,a0
    8000877c:	0077f793          	andi	a5,a5,7
    80008780:	00f73713          	sltiu	a4,a4,15
    80008784:	00174713          	xori	a4,a4,1
    80008788:	0017b793          	seqz	a5,a5
    8000878c:	00e7f7b3          	and	a5,a5,a4
    80008790:	10078863          	beqz	a5,800088a0 <__memmove+0x14c>
    80008794:	00900793          	li	a5,9
    80008798:	1107f463          	bgeu	a5,a6,800088a0 <__memmove+0x14c>
    8000879c:	0036581b          	srliw	a6,a2,0x3
    800087a0:	fff8081b          	addiw	a6,a6,-1
    800087a4:	02081813          	slli	a6,a6,0x20
    800087a8:	01d85893          	srli	a7,a6,0x1d
    800087ac:	00858813          	addi	a6,a1,8
    800087b0:	00058793          	mv	a5,a1
    800087b4:	00050713          	mv	a4,a0
    800087b8:	01088833          	add	a6,a7,a6
    800087bc:	0007b883          	ld	a7,0(a5)
    800087c0:	00878793          	addi	a5,a5,8
    800087c4:	00870713          	addi	a4,a4,8
    800087c8:	ff173c23          	sd	a7,-8(a4)
    800087cc:	ff0798e3          	bne	a5,a6,800087bc <__memmove+0x68>
    800087d0:	ff867713          	andi	a4,a2,-8
    800087d4:	02071793          	slli	a5,a4,0x20
    800087d8:	0207d793          	srli	a5,a5,0x20
    800087dc:	00f585b3          	add	a1,a1,a5
    800087e0:	40e686bb          	subw	a3,a3,a4
    800087e4:	00f507b3          	add	a5,a0,a5
    800087e8:	06e60463          	beq	a2,a4,80008850 <__memmove+0xfc>
    800087ec:	0005c703          	lbu	a4,0(a1)
    800087f0:	00e78023          	sb	a4,0(a5)
    800087f4:	04068e63          	beqz	a3,80008850 <__memmove+0xfc>
    800087f8:	0015c603          	lbu	a2,1(a1)
    800087fc:	00100713          	li	a4,1
    80008800:	00c780a3          	sb	a2,1(a5)
    80008804:	04e68663          	beq	a3,a4,80008850 <__memmove+0xfc>
    80008808:	0025c603          	lbu	a2,2(a1)
    8000880c:	00200713          	li	a4,2
    80008810:	00c78123          	sb	a2,2(a5)
    80008814:	02e68e63          	beq	a3,a4,80008850 <__memmove+0xfc>
    80008818:	0035c603          	lbu	a2,3(a1)
    8000881c:	00300713          	li	a4,3
    80008820:	00c781a3          	sb	a2,3(a5)
    80008824:	02e68663          	beq	a3,a4,80008850 <__memmove+0xfc>
    80008828:	0045c603          	lbu	a2,4(a1)
    8000882c:	00400713          	li	a4,4
    80008830:	00c78223          	sb	a2,4(a5)
    80008834:	00e68e63          	beq	a3,a4,80008850 <__memmove+0xfc>
    80008838:	0055c603          	lbu	a2,5(a1)
    8000883c:	00500713          	li	a4,5
    80008840:	00c782a3          	sb	a2,5(a5)
    80008844:	00e68663          	beq	a3,a4,80008850 <__memmove+0xfc>
    80008848:	0065c703          	lbu	a4,6(a1)
    8000884c:	00e78323          	sb	a4,6(a5)
    80008850:	00813403          	ld	s0,8(sp)
    80008854:	01010113          	addi	sp,sp,16
    80008858:	00008067          	ret
    8000885c:	02061713          	slli	a4,a2,0x20
    80008860:	02075713          	srli	a4,a4,0x20
    80008864:	00e587b3          	add	a5,a1,a4
    80008868:	f0f574e3          	bgeu	a0,a5,80008770 <__memmove+0x1c>
    8000886c:	02069613          	slli	a2,a3,0x20
    80008870:	02065613          	srli	a2,a2,0x20
    80008874:	fff64613          	not	a2,a2
    80008878:	00e50733          	add	a4,a0,a4
    8000887c:	00c78633          	add	a2,a5,a2
    80008880:	fff7c683          	lbu	a3,-1(a5)
    80008884:	fff78793          	addi	a5,a5,-1
    80008888:	fff70713          	addi	a4,a4,-1
    8000888c:	00d70023          	sb	a3,0(a4)
    80008890:	fec798e3          	bne	a5,a2,80008880 <__memmove+0x12c>
    80008894:	00813403          	ld	s0,8(sp)
    80008898:	01010113          	addi	sp,sp,16
    8000889c:	00008067          	ret
    800088a0:	02069713          	slli	a4,a3,0x20
    800088a4:	02075713          	srli	a4,a4,0x20
    800088a8:	00170713          	addi	a4,a4,1
    800088ac:	00e50733          	add	a4,a0,a4
    800088b0:	00050793          	mv	a5,a0
    800088b4:	0005c683          	lbu	a3,0(a1)
    800088b8:	00178793          	addi	a5,a5,1
    800088bc:	00158593          	addi	a1,a1,1
    800088c0:	fed78fa3          	sb	a3,-1(a5)
    800088c4:	fee798e3          	bne	a5,a4,800088b4 <__memmove+0x160>
    800088c8:	f89ff06f          	j	80008850 <__memmove+0xfc>

00000000800088cc <__putc>:
    800088cc:	fe010113          	addi	sp,sp,-32
    800088d0:	00813823          	sd	s0,16(sp)
    800088d4:	00113c23          	sd	ra,24(sp)
    800088d8:	02010413          	addi	s0,sp,32
    800088dc:	00050793          	mv	a5,a0
    800088e0:	fef40593          	addi	a1,s0,-17
    800088e4:	00100613          	li	a2,1
    800088e8:	00000513          	li	a0,0
    800088ec:	fef407a3          	sb	a5,-17(s0)
    800088f0:	fffff097          	auipc	ra,0xfffff
    800088f4:	b3c080e7          	jalr	-1220(ra) # 8000742c <console_write>
    800088f8:	01813083          	ld	ra,24(sp)
    800088fc:	01013403          	ld	s0,16(sp)
    80008900:	02010113          	addi	sp,sp,32
    80008904:	00008067          	ret

0000000080008908 <__getc>:
    80008908:	fe010113          	addi	sp,sp,-32
    8000890c:	00813823          	sd	s0,16(sp)
    80008910:	00113c23          	sd	ra,24(sp)
    80008914:	02010413          	addi	s0,sp,32
    80008918:	fe840593          	addi	a1,s0,-24
    8000891c:	00100613          	li	a2,1
    80008920:	00000513          	li	a0,0
    80008924:	fffff097          	auipc	ra,0xfffff
    80008928:	ae8080e7          	jalr	-1304(ra) # 8000740c <console_read>
    8000892c:	fe844503          	lbu	a0,-24(s0)
    80008930:	01813083          	ld	ra,24(sp)
    80008934:	01013403          	ld	s0,16(sp)
    80008938:	02010113          	addi	sp,sp,32
    8000893c:	00008067          	ret

0000000080008940 <console_handler>:
    80008940:	fe010113          	addi	sp,sp,-32
    80008944:	00813823          	sd	s0,16(sp)
    80008948:	00113c23          	sd	ra,24(sp)
    8000894c:	00913423          	sd	s1,8(sp)
    80008950:	02010413          	addi	s0,sp,32
    80008954:	14202773          	csrr	a4,scause
    80008958:	100027f3          	csrr	a5,sstatus
    8000895c:	0027f793          	andi	a5,a5,2
    80008960:	06079e63          	bnez	a5,800089dc <console_handler+0x9c>
    80008964:	00074c63          	bltz	a4,8000897c <console_handler+0x3c>
    80008968:	01813083          	ld	ra,24(sp)
    8000896c:	01013403          	ld	s0,16(sp)
    80008970:	00813483          	ld	s1,8(sp)
    80008974:	02010113          	addi	sp,sp,32
    80008978:	00008067          	ret
    8000897c:	0ff77713          	andi	a4,a4,255
    80008980:	00900793          	li	a5,9
    80008984:	fef712e3          	bne	a4,a5,80008968 <console_handler+0x28>
    80008988:	ffffe097          	auipc	ra,0xffffe
    8000898c:	6dc080e7          	jalr	1756(ra) # 80007064 <plic_claim>
    80008990:	00a00793          	li	a5,10
    80008994:	00050493          	mv	s1,a0
    80008998:	02f50c63          	beq	a0,a5,800089d0 <console_handler+0x90>
    8000899c:	fc0506e3          	beqz	a0,80008968 <console_handler+0x28>
    800089a0:	00050593          	mv	a1,a0
    800089a4:	00001517          	auipc	a0,0x1
    800089a8:	e2c50513          	addi	a0,a0,-468 # 800097d0 <CONSOLE_STATUS+0x7c0>
    800089ac:	fffff097          	auipc	ra,0xfffff
    800089b0:	afc080e7          	jalr	-1284(ra) # 800074a8 <__printf>
    800089b4:	01013403          	ld	s0,16(sp)
    800089b8:	01813083          	ld	ra,24(sp)
    800089bc:	00048513          	mv	a0,s1
    800089c0:	00813483          	ld	s1,8(sp)
    800089c4:	02010113          	addi	sp,sp,32
    800089c8:	ffffe317          	auipc	t1,0xffffe
    800089cc:	6d430067          	jr	1748(t1) # 8000709c <plic_complete>
    800089d0:	fffff097          	auipc	ra,0xfffff
    800089d4:	3e0080e7          	jalr	992(ra) # 80007db0 <uartintr>
    800089d8:	fddff06f          	j	800089b4 <console_handler+0x74>
    800089dc:	00001517          	auipc	a0,0x1
    800089e0:	ef450513          	addi	a0,a0,-268 # 800098d0 <digits+0x78>
    800089e4:	fffff097          	auipc	ra,0xfffff
    800089e8:	a68080e7          	jalr	-1432(ra) # 8000744c <panic>
	...
