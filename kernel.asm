
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000c117          	auipc	sp,0xc
    80000004:	ab813103          	ld	sp,-1352(sp) # 8000bab8 <_GLOBAL_OFFSET_TABLE_+0x40>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	4b9060ef          	jal	ra,80006cd4 <start>

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
    80001184:	429000ef          	jal	ra,80001dac <interruptRoutine>

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
    80001660:	0000a797          	auipc	a5,0xa
    80001664:	4e07c783          	lbu	a5,1248(a5) # 8000bb40 <_ZN8KConsole11initializedE>
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
    80001688:	4bc48493          	addi	s1,s1,1212 # 8000bb40 <_ZN8KConsole11initializedE>
    8000168c:	0000a797          	auipc	a5,0xa
    80001690:	3fc7b783          	ld	a5,1020(a5) # 8000ba88 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001694:	0007b783          	ld	a5,0(a5)
    80001698:	00f4b423          	sd	a5,8(s1)
	sr = (uint8*)CONSOLE_STATUS;
    8000169c:	0000a797          	auipc	a5,0xa
    800016a0:	3fc7b783          	ld	a5,1020(a5) # 8000ba98 <_GLOBAL_OFFSET_TABLE_+0x20>
    800016a4:	0007b783          	ld	a5,0(a5)
    800016a8:	00f4b823          	sd	a5,16(s1)
	sem_open(&inputBufferHasSpace, capacity);
    800016ac:	01e00593          	li	a1,30
    800016b0:	0000a517          	auipc	a0,0xa
    800016b4:	4a850513          	addi	a0,a0,1192 # 8000bb58 <_ZN8KConsole19inputBufferHasSpaceE>
    800016b8:	00000097          	auipc	ra,0x0
    800016bc:	de8080e7          	jalr	-536(ra) # 800014a0 <_Z8sem_openPP4KSemj>
	sem_open(&outputBufferHasSpace, capacity);
    800016c0:	01e00593          	li	a1,30
    800016c4:	0000a517          	auipc	a0,0xa
    800016c8:	49c50513          	addi	a0,a0,1180 # 8000bb60 <_ZN8KConsole20outputBufferHasSpaceE>
    800016cc:	00000097          	auipc	ra,0x0
    800016d0:	dd4080e7          	jalr	-556(ra) # 800014a0 <_Z8sem_openPP4KSemj>
	sem_open(&charsToInput, 0);
    800016d4:	00000593          	li	a1,0
    800016d8:	0000a517          	auipc	a0,0xa
    800016dc:	49050513          	addi	a0,a0,1168 # 8000bb68 <_ZN8KConsole12charsToInputE>
    800016e0:	00000097          	auipc	ra,0x0
    800016e4:	dc0080e7          	jalr	-576(ra) # 800014a0 <_Z8sem_openPP4KSemj>
	sem_open(&charsToOutput, 0);
    800016e8:	00000593          	li	a1,0
    800016ec:	0000a517          	auipc	a0,0xa
    800016f0:	48450513          	addi	a0,a0,1156 # 8000bb70 <_ZN8KConsole13charsToOutputE>
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
    80001738:	350080e7          	jalr	848(ra) # 80005a84 <_Z11printStringPKc>
	printInteger((uint64)dr);
    8000173c:	0000a497          	auipc	s1,0xa
    80001740:	40448493          	addi	s1,s1,1028 # 8000bb40 <_ZN8KConsole11initializedE>
    80001744:	0084b503          	ld	a0,8(s1)
    80001748:	00000097          	auipc	ra,0x0
    8000174c:	250080e7          	jalr	592(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    80001750:	00008517          	auipc	a0,0x8
    80001754:	e1850513          	addi	a0,a0,-488 # 80009568 <CONSOLE_STATUS+0x558>
    80001758:	00004097          	auipc	ra,0x4
    8000175c:	32c080e7          	jalr	812(ra) # 80005a84 <_Z11printStringPKc>
	printString("CONSOLE_STATUS = ");
    80001760:	00008517          	auipc	a0,0x8
    80001764:	8d050513          	addi	a0,a0,-1840 # 80009030 <CONSOLE_STATUS+0x20>
    80001768:	00004097          	auipc	ra,0x4
    8000176c:	31c080e7          	jalr	796(ra) # 80005a84 <_Z11printStringPKc>
	printInteger((uint64)sr);
    80001770:	0104b503          	ld	a0,16(s1)
    80001774:	00000097          	auipc	ra,0x0
    80001778:	224080e7          	jalr	548(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    8000177c:	00008517          	auipc	a0,0x8
    80001780:	dec50513          	addi	a0,a0,-532 # 80009568 <CONSOLE_STATUS+0x558>
    80001784:	00004097          	auipc	ra,0x4
    80001788:	300080e7          	jalr	768(ra) # 80005a84 <_Z11printStringPKc>
	printString("*CONSOLE_RX = ");
    8000178c:	00008517          	auipc	a0,0x8
    80001790:	8bc50513          	addi	a0,a0,-1860 # 80009048 <CONSOLE_STATUS+0x38>
    80001794:	00004097          	auipc	ra,0x4
    80001798:	2f0080e7          	jalr	752(ra) # 80005a84 <_Z11printStringPKc>
	printInteger(*dr);
    8000179c:	0084b783          	ld	a5,8(s1)
    800017a0:	0007c503          	lbu	a0,0(a5)
    800017a4:	00000097          	auipc	ra,0x0
    800017a8:	1f4080e7          	jalr	500(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    800017ac:	00008517          	auipc	a0,0x8
    800017b0:	dbc50513          	addi	a0,a0,-580 # 80009568 <CONSOLE_STATUS+0x558>
    800017b4:	00004097          	auipc	ra,0x4
    800017b8:	2d0080e7          	jalr	720(ra) # 80005a84 <_Z11printStringPKc>
	printString("*CONSOLE_STATUS = ");
    800017bc:	00008517          	auipc	a0,0x8
    800017c0:	89c50513          	addi	a0,a0,-1892 # 80009058 <CONSOLE_STATUS+0x48>
    800017c4:	00004097          	auipc	ra,0x4
    800017c8:	2c0080e7          	jalr	704(ra) # 80005a84 <_Z11printStringPKc>
	printInteger(*sr);
    800017cc:	0104b783          	ld	a5,16(s1)
    800017d0:	0007c503          	lbu	a0,0(a5)
    800017d4:	00000097          	auipc	ra,0x0
    800017d8:	1c4080e7          	jalr	452(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    800017dc:	00008517          	auipc	a0,0x8
    800017e0:	d8c50513          	addi	a0,a0,-628 # 80009568 <CONSOLE_STATUS+0x558>
    800017e4:	00004097          	auipc	ra,0x4
    800017e8:	2a0080e7          	jalr	672(ra) # 80005a84 <_Z11printStringPKc>
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
    80001818:	32c48493          	addi	s1,s1,812 # 8000bb40 <_ZN8KConsole11initializedE>
    8000181c:	0304b503          	ld	a0,48(s1)
    80001820:	00000097          	auipc	ra,0x0
    80001824:	ce8080e7          	jalr	-792(ra) # 80001508 <_Z8sem_waitP4KSem>
	char c = outputBuffer[outputHead];
    80001828:	0384a783          	lw	a5,56(s1)
    8000182c:	00f48733          	add	a4,s1,a5
	outputHead = (outputHead + 1) % capacity;
    80001830:	0017879b          	addiw	a5,a5,1
    80001834:	01e00693          	li	a3,30
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
    8000185c:	34872703          	lw	a4,840(a4) # 8000bba0 <_ZN8KConsole15inputBufferSizeE>
    80001860:	01e00793          	li	a5,30
    80001864:	04f70e63          	beq	a4,a5,800018c0 <_ZN8KConsole12placeInInputEc+0x68>
void KConsole::placeInInput(char c) {
    80001868:	ff010113          	addi	sp,sp,-16
    8000186c:	00113423          	sd	ra,8(sp)
    80001870:	00813023          	sd	s0,0(sp)
    80001874:	01010413          	addi	s0,sp,16
	inputBuffer[inputTail] = c;
    80001878:	0000a697          	auipc	a3,0xa
    8000187c:	2c868693          	addi	a3,a3,712 # 8000bb40 <_ZN8KConsole11initializedE>
    80001880:	0646a783          	lw	a5,100(a3)
    80001884:	00f68633          	add	a2,a3,a5
    80001888:	06a60423          	sb	a0,104(a2)
	inputTail = (inputTail + 1) % capacity;
    8000188c:	0017879b          	addiw	a5,a5,1
    80001890:	01e00613          	li	a2,30
    80001894:	02c7e7bb          	remw	a5,a5,a2
    80001898:	06f6a223          	sw	a5,100(a3)
	inputBufferSize++;
    8000189c:	0017071b          	addiw	a4,a4,1
    800018a0:	06e6a023          	sw	a4,96(a3)
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
    800018e4:	26048493          	addi	s1,s1,608 # 8000bb40 <_ZN8KConsole11initializedE>
    800018e8:	0204b503          	ld	a0,32(s1)
    800018ec:	00000097          	auipc	ra,0x0
    800018f0:	c1c080e7          	jalr	-996(ra) # 80001508 <_Z8sem_waitP4KSem>
	outputBuffer[outputTail] = c;
    800018f4:	0884a783          	lw	a5,136(s1)
    800018f8:	00f48733          	add	a4,s1,a5
    800018fc:	05270023          	sb	s2,64(a4)
	outputTail = (outputTail + 1) % capacity;
    80001900:	0017879b          	addiw	a5,a5,1
    80001904:	01e00713          	li	a4,30
    80001908:	02e7e7bb          	remw	a5,a5,a4
    8000190c:	08f4a423          	sw	a5,136(s1)
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
    8000194c:	1f848493          	addi	s1,s1,504 # 8000bb40 <_ZN8KConsole11initializedE>
    80001950:	0284b503          	ld	a0,40(s1)
    80001954:	00000097          	auipc	ra,0x0
    80001958:	bb4080e7          	jalr	-1100(ra) # 80001508 <_Z8sem_waitP4KSem>
	char c = inputBuffer[inputHead];
    8000195c:	08c4a783          	lw	a5,140(s1)
    80001960:	00f48733          	add	a4,s1,a5
	inputHead = (inputHead + 1) % capacity;
    80001964:	0017879b          	addiw	a5,a5,1
    80001968:	01e00693          	li	a3,30
    8000196c:	02d7e7bb          	remw	a5,a5,a3
    80001970:	08f4a623          	sw	a5,140(s1)
	inputBufferSize--;
    80001974:	0604a783          	lw	a5,96(s1)
    80001978:	fff7879b          	addiw	a5,a5,-1
    8000197c:	06f4a023          	sw	a5,96(s1)
	return c;
}
    80001980:	06874503          	lbu	a0,104(a4)
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
    800019cc:	0000a797          	auipc	a5,0xa
    800019d0:	2047b783          	ld	a5,516(a5) # 8000bbd0 <_ZN9Scheduler4tailE>
    800019d4:	00078e63          	beqz	a5,800019f0 <_ZN9Scheduler3putEP3TCB+0x30>
		head = tail = tcb;
	} else {
		tail->nextInScheduler = tcb;
    800019d8:	02a7bc23          	sd	a0,56(a5)
		tail = tcb;
    800019dc:	0000a797          	auipc	a5,0xa
    800019e0:	1ea7ba23          	sd	a0,500(a5) # 8000bbd0 <_ZN9Scheduler4tailE>
	}
}
    800019e4:	00813403          	ld	s0,8(sp)
    800019e8:	01010113          	addi	sp,sp,16
    800019ec:	00008067          	ret
		head = tail = tcb;
    800019f0:	0000a797          	auipc	a5,0xa
    800019f4:	1e078793          	addi	a5,a5,480 # 8000bbd0 <_ZN9Scheduler4tailE>
    800019f8:	00a7b023          	sd	a0,0(a5)
    800019fc:	00a7b423          	sd	a0,8(a5)
    80001a00:	fe5ff06f          	j	800019e4 <_ZN9Scheduler3putEP3TCB+0x24>

0000000080001a04 <_ZN9Scheduler3getEv>:

TCB* Scheduler::get() {
    80001a04:	ff010113          	addi	sp,sp,-16
    80001a08:	00813423          	sd	s0,8(sp)
    80001a0c:	01010413          	addi	s0,sp,16
	TCB* firstThread = head;
    80001a10:	0000a717          	auipc	a4,0xa
    80001a14:	1c070713          	addi	a4,a4,448 # 8000bbd0 <_ZN9Scheduler4tailE>
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
    80001a50:	0000a817          	auipc	a6,0xa
    80001a54:	19083803          	ld	a6,400(a6) # 8000bbe0 <_ZN9Scheduler12sleepingHeadE>
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
    80001a88:	0000a797          	auipc	a5,0xa
    80001a8c:	14a7bc23          	sd	a0,344(a5) # 8000bbe0 <_ZN9Scheduler12sleepingHeadE>
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
    80001ad0:	0000a797          	auipc	a5,0xa
    80001ad4:	10a7b823          	sd	a0,272(a5) # 8000bbe0 <_ZN9Scheduler12sleepingHeadE>
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
    80001aec:	0000a797          	auipc	a5,0xa
    80001af0:	0f47b783          	ld	a5,244(a5) # 8000bbe0 <_ZN9Scheduler12sleepingHeadE>
    80001af4:	06078a63          	beqz	a5,80001b68 <_ZN9Scheduler4wakeEv+0x7c>
	sleepingHead->timeToSleep--;
    80001af8:	0407b703          	ld	a4,64(a5)
    80001afc:	fff70713          	addi	a4,a4,-1
    80001b00:	04e7b023          	sd	a4,64(a5)
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001b04:	0000a517          	auipc	a0,0xa
    80001b08:	0dc53503          	ld	a0,220(a0) # 8000bbe0 <_ZN9Scheduler12sleepingHeadE>
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
    80001b38:	0000a717          	auipc	a4,0xa
    80001b3c:	0af73423          	sd	a5,168(a4) # 8000bbe0 <_ZN9Scheduler12sleepingHeadE>
		thread->nextSleeping = nullptr;
    80001b40:	04053423          	sd	zero,72(a0)
		Scheduler::put(thread);
    80001b44:	00000097          	auipc	ra,0x0
    80001b48:	e7c080e7          	jalr	-388(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001b4c:	0000a517          	auipc	a0,0xa
    80001b50:	09453503          	ld	a0,148(a0) # 8000bbe0 <_ZN9Scheduler12sleepingHeadE>
    80001b54:	fc051ce3          	bnez	a0,80001b2c <_ZN9Scheduler4wakeEv+0x40>
	}
}
    80001b58:	00813083          	ld	ra,8(sp)
    80001b5c:	00013403          	ld	s0,0(sp)
    80001b60:	01010113          	addi	sp,sp,16
    80001b64:	00008067          	ret
    80001b68:	00008067          	ret

0000000080001b6c <main>:

}

#pragma GCC optimize("O0")

int main() {
    80001b6c:	fc010113          	addi	sp,sp,-64
    80001b70:	02113c23          	sd	ra,56(sp)
    80001b74:	02813823          	sd	s0,48(sp)
    80001b78:	02913423          	sd	s1,40(sp)
    80001b7c:	03213023          	sd	s2,32(sp)
    80001b80:	04010413          	addi	s0,sp,64
	//postavi adresu prekidne rutine u stvec
	Riscv::w_stvec((uint64)&interruptHandler);
    80001b84:	0000a797          	auipc	a5,0xa
    80001b88:	f5c7b783          	ld	a5,-164(a5) # 8000bae0 <_GLOBAL_OFFSET_TABLE_+0x68>
    80001b8c:	00078513          	mv	a0,a5
    80001b90:	00000097          	auipc	ra,0x0
    80001b94:	1c8080e7          	jalr	456(ra) # 80001d58 <_ZN5Riscv7w_stvecEm>

	MemoryAllocator::initMemoryAllocator();
    80001b98:	00001097          	auipc	ra,0x1
    80001b9c:	5d0080e7          	jalr	1488(ra) # 80003168 <_ZN15MemoryAllocator19initMemoryAllocatorEv>


	//sem_open(&semA, 0);
	semA = new Semaphore(1);
    80001ba0:	01000513          	li	a0,16
    80001ba4:	00001097          	auipc	ra,0x1
    80001ba8:	ab8080e7          	jalr	-1352(ra) # 8000265c <_Znwm>
    80001bac:	00050793          	mv	a5,a0
    80001bb0:	00078493          	mv	s1,a5
    80001bb4:	00100593          	li	a1,1
    80001bb8:	00048513          	mv	a0,s1
    80001bbc:	00001097          	auipc	ra,0x1
    80001bc0:	d94080e7          	jalr	-620(ra) # 80002950 <_ZN9SemaphoreC1Ej>
    80001bc4:	0000a797          	auipc	a5,0xa
    80001bc8:	02478793          	addi	a5,a5,36 # 8000bbe8 <semA>
    80001bcc:	0097b023          	sd	s1,0(a5)


	KConsole::initKConsole();
    80001bd0:	00000097          	auipc	ra,0x0
    80001bd4:	a90080e7          	jalr	-1392(ra) # 80001660 <_ZN8KConsole12initKConsoleEv>
//testiranje svega
	thread_t mainHandle;
	thread_t userHandle;
	thread_t idleHandle;
	thread_t consoleOutputHandle;
	thread_create(&mainHandle, nullptr, nullptr);
    80001bd8:	fd840793          	addi	a5,s0,-40
    80001bdc:	00000613          	li	a2,0
    80001be0:	00000593          	li	a1,0
    80001be4:	00078513          	mv	a0,a5
    80001be8:	fffff097          	auipc	ra,0xfffff
    80001bec:	798080e7          	jalr	1944(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
	TCB::running = mainHandle;
    80001bf0:	fd843703          	ld	a4,-40(s0)
    80001bf4:	0000a797          	auipc	a5,0xa
    80001bf8:	edc7b783          	ld	a5,-292(a5) # 8000bad0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001bfc:	00e7b023          	sd	a4,0(a5)
	thread_create(&idleHandle, idle, nullptr);
    80001c00:	fc840793          	addi	a5,s0,-56
    80001c04:	00000613          	li	a2,0
    80001c08:	00000597          	auipc	a1,0x0
    80001c0c:	0d858593          	addi	a1,a1,216 # 80001ce0 <_Z4idlePv>
    80001c10:	00078513          	mv	a0,a5
    80001c14:	fffff097          	auipc	ra,0xfffff
    80001c18:	76c080e7          	jalr	1900(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
	thread_create(&consoleOutputHandle, kernelConsumerFunction, nullptr);
    80001c1c:	fc040793          	addi	a5,s0,-64
    80001c20:	00000613          	li	a2,0
    80001c24:	00000597          	auipc	a1,0x0
    80001c28:	0d858593          	addi	a1,a1,216 # 80001cfc <_Z22kernelConsumerFunctionPv>
    80001c2c:	00078513          	mv	a0,a5
    80001c30:	fffff097          	auipc	ra,0xfffff
    80001c34:	750080e7          	jalr	1872(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
	thread_create(&userHandle, (TCB::Body)userMain, nullptr);
    80001c38:	fd040793          	addi	a5,s0,-48
    80001c3c:	00000613          	li	a2,0
    80001c40:	0000a597          	auipc	a1,0xa
    80001c44:	e405b583          	ld	a1,-448(a1) # 8000ba80 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001c48:	00078513          	mv	a0,a5
    80001c4c:	fffff097          	auipc	ra,0xfffff
    80001c50:	734080e7          	jalr	1844(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>

	Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    80001c54:	00200513          	li	a0,2
    80001c58:	00000097          	auipc	ra,0x0
    80001c5c:	11c080e7          	jalr	284(ra) # 80001d74 <_ZN5Riscv10ms_sstatusEm>
	thread_join(userHandle);
    80001c60:	fd043783          	ld	a5,-48(s0)
    80001c64:	00078513          	mv	a0,a5
    80001c68:	fffff097          	auipc	ra,0xfffff
    80001c6c:	7e0080e7          	jalr	2016(ra) # 80001448 <_Z11thread_joinP3TCB>
	//printString("\nSad cu da izadjem\n");
	while(KConsole::outputHead!=KConsole::outputTail){}
    80001c70:	0000a797          	auipc	a5,0xa
    80001c74:	e407b783          	ld	a5,-448(a5) # 8000bab0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001c78:	0007a703          	lw	a4,0(a5)
    80001c7c:	0000a797          	auipc	a5,0xa
    80001c80:	e747b783          	ld	a5,-396(a5) # 8000baf0 <_GLOBAL_OFFSET_TABLE_+0x78>
    80001c84:	0007a783          	lw	a5,0(a5)
    80001c88:	00f70463          	beq	a4,a5,80001c90 <main+0x124>
    80001c8c:	fe5ff06f          	j	80001c70 <main+0x104>
	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    80001c90:	00200513          	li	a0,2
    80001c94:	00000097          	auipc	ra,0x0
    80001c98:	0fc080e7          	jalr	252(ra) # 80001d90 <_ZN5Riscv10mc_sstatusEm>
	return 0;
    80001c9c:	00000793          	li	a5,0
    80001ca0:	0240006f          	j	80001cc4 <main+0x158>
    80001ca4:	00050913          	mv	s2,a0
	semA = new Semaphore(1);
    80001ca8:	00048513          	mv	a0,s1
    80001cac:	00001097          	auipc	ra,0x1
    80001cb0:	a00080e7          	jalr	-1536(ra) # 800026ac <_ZdlPv>
    80001cb4:	00090793          	mv	a5,s2
    80001cb8:	00078513          	mv	a0,a5
    80001cbc:	0000b097          	auipc	ra,0xb
    80001cc0:	07c080e7          	jalr	124(ra) # 8000cd38 <_Unwind_Resume>
    80001cc4:	00078513          	mv	a0,a5
    80001cc8:	03813083          	ld	ra,56(sp)
    80001ccc:	03013403          	ld	s0,48(sp)
    80001cd0:	02813483          	ld	s1,40(sp)
    80001cd4:	02013903          	ld	s2,32(sp)
    80001cd8:	04010113          	addi	sp,sp,64
    80001cdc:	00008067          	ret

0000000080001ce0 <_Z4idlePv>:
void idle(void*) {
    80001ce0:	ff010113          	addi	sp,sp,-16
    80001ce4:	00113423          	sd	ra,8(sp)
    80001ce8:	00813023          	sd	s0,0(sp)
    80001cec:	01010413          	addi	s0,sp,16
	while (1) {thread_dispatch();}
    80001cf0:	fffff097          	auipc	ra,0xfffff
    80001cf4:	738080e7          	jalr	1848(ra) # 80001428 <_Z15thread_dispatchv>
    80001cf8:	ff9ff06f          	j	80001cf0 <_Z4idlePv+0x10>

0000000080001cfc <_Z22kernelConsumerFunctionPv>:
void kernelConsumerFunction(void*) {
    80001cfc:	ff010113          	addi	sp,sp,-16
    80001d00:	00113423          	sd	ra,8(sp)
    80001d04:	00813023          	sd	s0,0(sp)
    80001d08:	01010413          	addi	s0,sp,16
    80001d0c:	0280006f          	j	80001d34 <_Z22kernelConsumerFunctionPv+0x38>
		*KConsole::dr = c;
    80001d10:	0000a797          	auipc	a5,0xa
    80001d14:	db07b783          	ld	a5,-592(a5) # 8000bac0 <_GLOBAL_OFFSET_TABLE_+0x48>
    80001d18:	0007b783          	ld	a5,0(a5)
    80001d1c:	00a78023          	sb	a0,0(a5)
		sem_signal(KConsole::outputBufferHasSpace);
    80001d20:	0000a797          	auipc	a5,0xa
    80001d24:	da87b783          	ld	a5,-600(a5) # 8000bac8 <_GLOBAL_OFFSET_TABLE_+0x50>
    80001d28:	0007b503          	ld	a0,0(a5)
    80001d2c:	00000097          	auipc	ra,0x0
    80001d30:	80c080e7          	jalr	-2036(ra) # 80001538 <_Z10sem_signalP4KSem>
		char c = KConsole::getFromOutput();
    80001d34:	00000097          	auipc	ra,0x0
    80001d38:	acc080e7          	jalr	-1332(ra) # 80001800 <_ZN8KConsole13getFromOutputEv>
		while (!(*KConsole::sr & CONSOLE_TX_STATUS_BIT)) {}
    80001d3c:	0000a797          	auipc	a5,0xa
    80001d40:	dbc7b783          	ld	a5,-580(a5) # 8000baf8 <_GLOBAL_OFFSET_TABLE_+0x80>
    80001d44:	0007b783          	ld	a5,0(a5)
    80001d48:	0007c783          	lbu	a5,0(a5)
    80001d4c:	0207f793          	andi	a5,a5,32
    80001d50:	fe0786e3          	beqz	a5,80001d3c <_Z22kernelConsumerFunctionPv+0x40>
    80001d54:	fbdff06f          	j	80001d10 <_Z22kernelConsumerFunctionPv+0x14>

0000000080001d58 <_ZN5Riscv7w_stvecEm>:
	uint64 volatile stvec;
	__asm__ volatile("csrr %[stvec], stvec": [stvec] "=r"(stvec));
	return stvec;
}

inline void Riscv::w_stvec(uint64 stvec) {
    80001d58:	ff010113          	addi	sp,sp,-16
    80001d5c:	00813423          	sd	s0,8(sp)
    80001d60:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw stvec, %[stvec]": :[stvec] "r"(stvec));
    80001d64:	10551073          	csrw	stvec,a0
}
    80001d68:	00813403          	ld	s0,8(sp)
    80001d6c:	01010113          	addi	sp,sp,16
    80001d70:	00008067          	ret

0000000080001d74 <_ZN5Riscv10ms_sstatusEm>:

inline void Riscv::w_sip(uint64 sip) {
	__asm__ volatile("csrw sip, %[sip]": :[sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
    80001d74:	ff010113          	addi	sp,sp,-16
    80001d78:	00813423          	sd	s0,8(sp)
    80001d7c:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80001d80:	10052073          	csrs	sstatus,a0
}
    80001d84:	00813403          	ld	s0,8(sp)
    80001d88:	01010113          	addi	sp,sp,16
    80001d8c:	00008067          	ret

0000000080001d90 <_ZN5Riscv10mc_sstatusEm>:

inline void Riscv::mc_sstatus(uint64 mask) {
    80001d90:	ff010113          	addi	sp,sp,-16
    80001d94:	00813423          	sd	s0,8(sp)
    80001d98:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80001d9c:	10053073          	csrc	sstatus,a0
}
    80001da0:	00813403          	ld	s0,8(sp)
    80001da4:	01010113          	addi	sp,sp,16
    80001da8:	00008067          	ret

0000000080001dac <interruptRoutine>:
#include "../test/printing.hpp"

//void printInteger(int i);

#pragma GCC optimize("O0")
extern "C" void interruptRoutine() {
    80001dac:	ec010113          	addi	sp,sp,-320
    80001db0:	12113c23          	sd	ra,312(sp)
    80001db4:	12813823          	sd	s0,304(sp)
    80001db8:	14010413          	addi	s0,sp,320
	uint64 scause, sepc, sstatus;
	__asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001dbc:	14202373          	csrr	t1,scause
    80001dc0:	fc643c23          	sd	t1,-40(s0)
	__asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001dc4:	14102373          	csrr	t1,sepc
    80001dc8:	fc643823          	sd	t1,-48(s0)
	__asm__ volatile("csrr %[status], sstatus":[status] "=r"(
			sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001dcc:	10002373          	csrr	t1,sstatus
    80001dd0:	fc643423          	sd	t1,-56(s0)
	uint64 a0, a1, a2, a3, a4, a5, a6, a7;
	__asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001dd4:	00050313          	mv	t1,a0
    80001dd8:	fc643023          	sd	t1,-64(s0)
	__asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001ddc:	00058313          	mv	t1,a1
    80001de0:	fa643c23          	sd	t1,-72(s0)
	__asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001de4:	00060313          	mv	t1,a2
    80001de8:	fa643823          	sd	t1,-80(s0)
	__asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001dec:	00068313          	mv	t1,a3
    80001df0:	fa643423          	sd	t1,-88(s0)
	__asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001df4:	00070313          	mv	t1,a4
    80001df8:	fa643023          	sd	t1,-96(s0)
	__asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001dfc:	00078313          	mv	t1,a5
    80001e00:	f8643c23          	sd	t1,-104(s0)
	__asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001e04:	00080313          	mv	t1,a6
    80001e08:	f8643823          	sd	t1,-112(s0)
	__asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001e0c:	00088313          	mv	t1,a7
    80001e10:	f8643423          	sd	t1,-120(s0)

	if (scause == 0x09 || scause == 0x08) {
    80001e14:	fd843703          	ld	a4,-40(s0)
    80001e18:	00900793          	li	a5,9
    80001e1c:	00f70863          	beq	a4,a5,80001e2c <interruptRoutine+0x80>
    80001e20:	fd843703          	ld	a4,-40(s0)
    80001e24:	00800793          	li	a5,8
    80001e28:	50f71663          	bne	a4,a5,80002334 <interruptRoutine+0x588>
		//prekid zbog poziva ecall
		uint64 opCode = a0;
    80001e2c:	fc043783          	ld	a5,-64(s0)
    80001e30:	f6f43c23          	sd	a5,-136(s0)
		switch (opCode) {
    80001e34:	f7843703          	ld	a4,-136(s0)
    80001e38:	09100793          	li	a5,145
    80001e3c:	38f70063          	beq	a4,a5,800021bc <interruptRoutine+0x410>
    80001e40:	f7843703          	ld	a4,-136(s0)
    80001e44:	09100793          	li	a5,145
    80001e48:	44e7ee63          	bltu	a5,a4,800022a4 <interruptRoutine+0x4f8>
    80001e4c:	f7843703          	ld	a4,-136(s0)
    80001e50:	09000793          	li	a5,144
    80001e54:	32f70863          	beq	a4,a5,80002184 <interruptRoutine+0x3d8>
    80001e58:	f7843703          	ld	a4,-136(s0)
    80001e5c:	09000793          	li	a5,144
    80001e60:	44e7e263          	bltu	a5,a4,800022a4 <interruptRoutine+0x4f8>
    80001e64:	f7843703          	ld	a4,-136(s0)
    80001e68:	08100793          	li	a5,129
    80001e6c:	30f70063          	beq	a4,a5,8000216c <interruptRoutine+0x3c0>
    80001e70:	f7843703          	ld	a4,-136(s0)
    80001e74:	08100793          	li	a5,129
    80001e78:	42e7e663          	bltu	a5,a4,800022a4 <interruptRoutine+0x4f8>
    80001e7c:	f7843703          	ld	a4,-136(s0)
    80001e80:	04200793          	li	a5,66
    80001e84:	04e7e263          	bltu	a5,a4,80001ec8 <interruptRoutine+0x11c>
    80001e88:	f7843783          	ld	a5,-136(s0)
    80001e8c:	40078c63          	beqz	a5,800022a4 <interruptRoutine+0x4f8>
    80001e90:	f7843703          	ld	a4,-136(s0)
    80001e94:	04200793          	li	a5,66
    80001e98:	40e7e663          	bltu	a5,a4,800022a4 <interruptRoutine+0x4f8>
    80001e9c:	f7843783          	ld	a5,-136(s0)
    80001ea0:	00279713          	slli	a4,a5,0x2
    80001ea4:	00007797          	auipc	a5,0x7
    80001ea8:	24078793          	addi	a5,a5,576 # 800090e4 <CONSOLE_STATUS+0xd4>
    80001eac:	00f707b3          	add	a5,a4,a5
    80001eb0:	0007a783          	lw	a5,0(a5)
    80001eb4:	0007871b          	sext.w	a4,a5
    80001eb8:	00007797          	auipc	a5,0x7
    80001ebc:	22c78793          	addi	a5,a5,556 # 800090e4 <CONSOLE_STATUS+0xd4>
    80001ec0:	00f707b3          	add	a5,a4,a5
    80001ec4:	00078067          	jr	a5
    80001ec8:	f7843703          	ld	a4,-136(s0)
    80001ecc:	08000793          	li	a5,128
    80001ed0:	22f70e63          	beq	a4,a5,8000210c <interruptRoutine+0x360>
    80001ed4:	3d00006f          	j	800022a4 <interruptRoutine+0x4f8>
			case 0x01:
				//mem_alloc
				size_t size;
				size = (size_t)a1;	//size je broj blokova koje treba alocirati
    80001ed8:	fb843783          	ld	a5,-72(s0)
    80001edc:	ecf43823          	sd	a5,-304(s0)
				size = size * MEM_BLOCK_SIZE;
    80001ee0:	ed043783          	ld	a5,-304(s0)
    80001ee4:	00679793          	slli	a5,a5,0x6
    80001ee8:	ecf43823          	sd	a5,-304(s0)
				MemoryAllocator::kmalloc(size);
    80001eec:	00300593          	li	a1,3
    80001ef0:	ed043503          	ld	a0,-304(s0)
    80001ef4:	00001097          	auipc	ra,0x1
    80001ef8:	f84080e7          	jalr	-124(ra) # 80002e78 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
				__asm__ volatile("sd a0, 80(s0)");
    80001efc:	04a43823          	sd	a0,80(s0)
				break;
    80001f00:	4100006f          	j	80002310 <interruptRoutine+0x564>
			case 0x02:
				//mem_free
				void* ptr;
				ptr = (void*)a1;
    80001f04:	fb843783          	ld	a5,-72(s0)
    80001f08:	ecf43c23          	sd	a5,-296(s0)
				MemoryAllocator::kfree(ptr);
    80001f0c:	ed843503          	ld	a0,-296(s0)
    80001f10:	00001097          	auipc	ra,0x1
    80001f14:	114080e7          	jalr	276(ra) # 80003024 <_ZN15MemoryAllocator5kfreeEPv>
				__asm__ volatile("sd a0, 80(s0)");
    80001f18:	04a43823          	sd	a0,80(s0)
				break;
    80001f1c:	3f40006f          	j	80002310 <interruptRoutine+0x564>
			case 0x11:
				//thread_create
				thread_t* handle;
				handle = (thread_t*)a1;
    80001f20:	fb843783          	ld	a5,-72(s0)
    80001f24:	eef43c23          	sd	a5,-264(s0)
				void (* function)(void*);
				function = (void (*)(void*))a2;
    80001f28:	fb043783          	ld	a5,-80(s0)
    80001f2c:	eef43823          	sd	a5,-272(s0)
				void* args;
				args = (void*)a3;
    80001f30:	fa843783          	ld	a5,-88(s0)
    80001f34:	eef43423          	sd	a5,-280(s0)
				uint64* sp;
				sp = (uint64*)a4;
    80001f38:	fa043783          	ld	a5,-96(s0)
    80001f3c:	eef43023          	sd	a5,-288(s0)

				*handle = TCB::createThread(function, args, sp);
    80001f40:	ee043603          	ld	a2,-288(s0)
    80001f44:	ee843583          	ld	a1,-280(s0)
    80001f48:	ef043503          	ld	a0,-272(s0)
    80001f4c:	00001097          	auipc	ra,0x1
    80001f50:	d58080e7          	jalr	-680(ra) # 80002ca4 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80001f54:	00050713          	mv	a4,a0
    80001f58:	ef843783          	ld	a5,-264(s0)
    80001f5c:	00e7b023          	sd	a4,0(a5)
				TCB::start(*handle);
    80001f60:	ef843783          	ld	a5,-264(s0)
    80001f64:	0007b783          	ld	a5,0(a5)
    80001f68:	00078513          	mv	a0,a5
    80001f6c:	00001097          	auipc	ra,0x1
    80001f70:	eb8080e7          	jalr	-328(ra) # 80002e24 <_ZN3TCB5startEPS_>
				if (*handle != nullptr) {
    80001f74:	ef843783          	ld	a5,-264(s0)
    80001f78:	0007b783          	ld	a5,0(a5)
    80001f7c:	00078663          	beqz	a5,80001f88 <interruptRoutine+0x1dc>
					__asm__ volatile("li a0, 0");
    80001f80:	00000513          	li	a0,0
    80001f84:	0080006f          	j	80001f8c <interruptRoutine+0x1e0>
				} else {
					__asm__ volatile("li a0, -1");
    80001f88:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    80001f8c:	04a43823          	sd	a0,80(s0)
				break;
    80001f90:	3800006f          	j	80002310 <interruptRoutine+0x564>
			case 0x12:
				//thread_exit
				TCB::running->setFinished(true);
    80001f94:	0000a797          	auipc	a5,0xa
    80001f98:	b3c7b783          	ld	a5,-1220(a5) # 8000bad0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001f9c:	0007b783          	ld	a5,0(a5)
    80001fa0:	00100593          	li	a1,1
    80001fa4:	00078513          	mv	a0,a5
    80001fa8:	00000097          	auipc	ra,0x0
    80001fac:	59c080e7          	jalr	1436(ra) # 80002544 <_ZN3TCB11setFinishedEb>
				TCB::releaseJoined();
    80001fb0:	00001097          	auipc	ra,0x1
    80001fb4:	e18080e7          	jalr	-488(ra) # 80002dc8 <_ZN3TCB13releaseJoinedEv>
				TCB::yield();
    80001fb8:	00001097          	auipc	ra,0x1
    80001fbc:	c84080e7          	jalr	-892(ra) # 80002c3c <_ZN3TCB5yieldEv>
				break;
    80001fc0:	3500006f          	j	80002310 <interruptRoutine+0x564>
			case 0x13:
				//thread_dispatch
				TCB::yield();
    80001fc4:	00001097          	auipc	ra,0x1
    80001fc8:	c78080e7          	jalr	-904(ra) # 80002c3c <_ZN3TCB5yieldEv>
				break;
    80001fcc:	3440006f          	j	80002310 <interruptRoutine+0x564>
			case 0x14:
				//thread_join
				thread_t handleToJoin;
				handleToJoin = (thread_t)a1;
    80001fd0:	fb843783          	ld	a5,-72(s0)
    80001fd4:	f0f43023          	sd	a5,-256(s0)
				TCB::threadJoin(handleToJoin);
    80001fd8:	f0043503          	ld	a0,-256(s0)
    80001fdc:	00001097          	auipc	ra,0x1
    80001fe0:	da4080e7          	jalr	-604(ra) # 80002d80 <_ZN3TCB10threadJoinEPS_>
				TCB::yield();
    80001fe4:	00001097          	auipc	ra,0x1
    80001fe8:	c58080e7          	jalr	-936(ra) # 80002c3c <_ZN3TCB5yieldEv>
				break;
    80001fec:	3240006f          	j	80002310 <interruptRoutine+0x564>
			case 0x21:
				//sem_open
				sem_t* openHandle;
				openHandle = (sem_t*)a1;
    80001ff0:	fb843783          	ld	a5,-72(s0)
    80001ff4:	f0f43823          	sd	a5,-240(s0)
				uint initVal;
				initVal = (uint)a2;
    80001ff8:	fb043783          	ld	a5,-80(s0)
    80001ffc:	f0f42623          	sw	a5,-244(s0)
				*openHandle = KSem::initSem(initVal);
    80002000:	f0c42783          	lw	a5,-244(s0)
    80002004:	00078513          	mv	a0,a5
    80002008:	00001097          	auipc	ra,0x1
    8000200c:	224080e7          	jalr	548(ra) # 8000322c <_ZN4KSem7initSemEj>
    80002010:	00050713          	mv	a4,a0
    80002014:	f1043783          	ld	a5,-240(s0)
    80002018:	00e7b023          	sd	a4,0(a5)
				if (*openHandle != nullptr) {
    8000201c:	f1043783          	ld	a5,-240(s0)
    80002020:	0007b783          	ld	a5,0(a5)
    80002024:	00078663          	beqz	a5,80002030 <interruptRoutine+0x284>
					__asm__ volatile("li a0, 0");
    80002028:	00000513          	li	a0,0
    8000202c:	0080006f          	j	80002034 <interruptRoutine+0x288>
				} else {
					__asm__ volatile("li a0, -1");
    80002030:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    80002034:	04a43823          	sd	a0,80(s0)
				break;
    80002038:	2d80006f          	j	80002310 <interruptRoutine+0x564>
			case 0x22:
				//sem_close
				sem_t closeHandle;
				closeHandle = (sem_t)a1;
    8000203c:	fb843783          	ld	a5,-72(s0)
    80002040:	f0f43c23          	sd	a5,-232(s0)
				KSem::closeSem(closeHandle);
    80002044:	f1843503          	ld	a0,-232(s0)
    80002048:	00001097          	auipc	ra,0x1
    8000204c:	3ac080e7          	jalr	940(ra) # 800033f4 <_ZN4KSem8closeSemEPS_>
				__asm__ volatile("sd a0, 80(s0)");
    80002050:	04a43823          	sd	a0,80(s0)
				break;
    80002054:	2bc0006f          	j	80002310 <interruptRoutine+0x564>
			case 0x23:
				//sem_wait
				sem_t waitHandle;
				waitHandle = (sem_t)a1;
    80002058:	fb843783          	ld	a5,-72(s0)
    8000205c:	f2f43023          	sd	a5,-224(s0)
				waitHandle->wait();
    80002060:	f2043503          	ld	a0,-224(s0)
    80002064:	00001097          	auipc	ra,0x1
    80002068:	25c080e7          	jalr	604(ra) # 800032c0 <_ZN4KSem4waitEv>
				__asm__ volatile("sd a0, 80(s0)");
    8000206c:	04a43823          	sd	a0,80(s0)
				break;
    80002070:	2a00006f          	j	80002310 <interruptRoutine+0x564>
			case 0x24:
				//sem_signal
				sem_t signalHandle;
				signalHandle = (sem_t)a1;
    80002074:	fb843783          	ld	a5,-72(s0)
    80002078:	f2f43423          	sd	a5,-216(s0)
				signalHandle->signal();
    8000207c:	f2843503          	ld	a0,-216(s0)
    80002080:	00001097          	auipc	ra,0x1
    80002084:	2f8080e7          	jalr	760(ra) # 80003378 <_ZN4KSem6signalEv>
				__asm__ volatile("sd a0, 80(s0)");
    80002088:	04a43823          	sd	a0,80(s0)
				break;
    8000208c:	2840006f          	j	80002310 <interruptRoutine+0x564>
			case 0x31:
				//time_sleep
				time_t timerPeriods;
				timerPeriods = (time_t)a1;
    80002090:	fb843783          	ld	a5,-72(s0)
    80002094:	f2f43823          	sd	a5,-208(s0)
				if (timerPeriods > 0) {
    80002098:	f3043783          	ld	a5,-208(s0)
    8000209c:	00078663          	beqz	a5,800020a8 <interruptRoutine+0x2fc>
					__asm__ volatile("li a0, 0");
    800020a0:	00000513          	li	a0,0
    800020a4:	0080006f          	j	800020ac <interruptRoutine+0x300>
				} else {
					__asm__ volatile("li a0, -1");
    800020a8:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    800020ac:	04a43823          	sd	a0,80(s0)
				if (timerPeriods > 0) {
    800020b0:	f3043783          	ld	a5,-208(s0)
    800020b4:	24078463          	beqz	a5,800022fc <interruptRoutine+0x550>
					Scheduler::putToSleep(TCB::running, timerPeriods);
    800020b8:	0000a797          	auipc	a5,0xa
    800020bc:	a187b783          	ld	a5,-1512(a5) # 8000bad0 <_GLOBAL_OFFSET_TABLE_+0x58>
    800020c0:	0007b783          	ld	a5,0(a5)
    800020c4:	f3043583          	ld	a1,-208(s0)
    800020c8:	00078513          	mv	a0,a5
    800020cc:	00000097          	auipc	ra,0x0
    800020d0:	978080e7          	jalr	-1672(ra) # 80001a44 <_ZN9Scheduler10putToSleepEP3TCBm>
					TCB::yield();
    800020d4:	00001097          	auipc	ra,0x1
    800020d8:	b68080e7          	jalr	-1176(ra) # 80002c3c <_ZN3TCB5yieldEv>
				}
				break;
    800020dc:	2200006f          	j	800022fc <interruptRoutine+0x550>
			case 0x41:
				//getc
				KConsole::kgetc();
    800020e0:	00000097          	auipc	ra,0x0
    800020e4:	854080e7          	jalr	-1964(ra) # 80001934 <_ZN8KConsole5kgetcEv>
				__asm__ volatile("sd a0, 80(s0)");
    800020e8:	04a43823          	sd	a0,80(s0)
				break;
    800020ec:	2240006f          	j	80002310 <interruptRoutine+0x564>
			case 0x42:
				//putc
				char c;
				c = (char)a1;
    800020f0:	fb843783          	ld	a5,-72(s0)
    800020f4:	f2f40fa3          	sb	a5,-193(s0)
				KConsole::kputc(c);
    800020f8:	f3f44783          	lbu	a5,-193(s0)
    800020fc:	00078513          	mv	a0,a5
    80002100:	fffff097          	auipc	ra,0xfffff
    80002104:	7c4080e7          	jalr	1988(ra) # 800018c4 <_ZN8KConsole5kputcEc>
				break;
    80002108:	2080006f          	j	80002310 <interruptRoutine+0x564>
			case 0x80:
				//alloc thread
				thread_t* handleAlloc;
				handleAlloc = (thread_t*)a1;
    8000210c:	fb843783          	ld	a5,-72(s0)
    80002110:	f4f43c23          	sd	a5,-168(s0)
				void (* foo)(void*);
				foo = (void (*)(void*))a2;
    80002114:	fb043783          	ld	a5,-80(s0)
    80002118:	f4f43823          	sd	a5,-176(s0)
				void* argsAlloc;
				argsAlloc = (void*)a3;
    8000211c:	fa843783          	ld	a5,-88(s0)
    80002120:	f4f43423          	sd	a5,-184(s0)
				uint64* spAlloc;
				spAlloc = (uint64*)a4;
    80002124:	fa043783          	ld	a5,-96(s0)
    80002128:	f4f43023          	sd	a5,-192(s0)

				*handleAlloc = TCB::createThread(foo, argsAlloc, spAlloc);
    8000212c:	f4043603          	ld	a2,-192(s0)
    80002130:	f4843583          	ld	a1,-184(s0)
    80002134:	f5043503          	ld	a0,-176(s0)
    80002138:	00001097          	auipc	ra,0x1
    8000213c:	b6c080e7          	jalr	-1172(ra) # 80002ca4 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80002140:	00050713          	mv	a4,a0
    80002144:	f5843783          	ld	a5,-168(s0)
    80002148:	00e7b023          	sd	a4,0(a5)
				if (*handleAlloc != nullptr) {
    8000214c:	f5843783          	ld	a5,-168(s0)
    80002150:	0007b783          	ld	a5,0(a5)
    80002154:	00078663          	beqz	a5,80002160 <interruptRoutine+0x3b4>
					__asm__ volatile("li a0, 0");
    80002158:	00000513          	li	a0,0
    8000215c:	0080006f          	j	80002164 <interruptRoutine+0x3b8>
				} else {
					__asm__ volatile("li a0, -1");
    80002160:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    80002164:	04a43823          	sd	a0,80(s0)
				break;
    80002168:	1a80006f          	j	80002310 <interruptRoutine+0x564>
			case 0x81:
				//start thread
				thread_t threadStartHandle;
				threadStartHandle = (thread_t)a1;
    8000216c:	fb843783          	ld	a5,-72(s0)
    80002170:	f6f43023          	sd	a5,-160(s0)
				Scheduler::put(threadStartHandle);
    80002174:	f6043503          	ld	a0,-160(s0)
    80002178:	00000097          	auipc	ra,0x0
    8000217c:	848080e7          	jalr	-1976(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
				break;
    80002180:	1900006f          	j	80002310 <interruptRoutine+0x564>
			case 0x90:
				//printString
				const char* string;
				string = (const char*)a1;
    80002184:	fb843783          	ld	a5,-72(s0)
    80002188:	fef43423          	sd	a5,-24(s0)
				while (*string != '\0') {
    8000218c:	fe843783          	ld	a5,-24(s0)
    80002190:	0007c783          	lbu	a5,0(a5)
    80002194:	16078863          	beqz	a5,80002304 <interruptRoutine+0x558>
					putc(*string);
    80002198:	fe843783          	ld	a5,-24(s0)
    8000219c:	0007c783          	lbu	a5,0(a5)
    800021a0:	00078513          	mv	a0,a5
    800021a4:	fffff097          	auipc	ra,0xfffff
    800021a8:	3ec080e7          	jalr	1004(ra) # 80001590 <_Z4putcc>
					string++;
    800021ac:	fe843783          	ld	a5,-24(s0)
    800021b0:	00178793          	addi	a5,a5,1
    800021b4:	fef43423          	sd	a5,-24(s0)
				while (*string != '\0') {
    800021b8:	fd5ff06f          	j	8000218c <interruptRoutine+0x3e0>
				}
				break;
			case 0x91:
				//printInteger
				uint64 integer;
				integer = a1;
    800021bc:	fb843783          	ld	a5,-72(s0)
    800021c0:	f6f43823          	sd	a5,-144(s0)
				static char digits[] = "0123456789";
				char buf[16];
				int i, neg;
				uint x;

				neg = 0;
    800021c4:	f6042623          	sw	zero,-148(s0)
				if (integer < 0) {
					neg = 1;
					x = -integer;
				} else {
					x = integer;
    800021c8:	f7043783          	ld	a5,-144(s0)
    800021cc:	fef42023          	sw	a5,-32(s0)
				}

				i = 0;
    800021d0:	fe042223          	sw	zero,-28(s0)
				do {
					buf[i++] = digits[x % 10];
    800021d4:	fe042703          	lw	a4,-32(s0)
    800021d8:	00a00793          	li	a5,10
    800021dc:	02f777bb          	remuw	a5,a4,a5
    800021e0:	0007861b          	sext.w	a2,a5
    800021e4:	fe442783          	lw	a5,-28(s0)
    800021e8:	0017871b          	addiw	a4,a5,1
    800021ec:	fee42223          	sw	a4,-28(s0)
    800021f0:	00009697          	auipc	a3,0x9
    800021f4:	65868693          	addi	a3,a3,1624 # 8000b848 <_ZZ16interruptRoutineE6digits>
    800021f8:	02061713          	slli	a4,a2,0x20
    800021fc:	02075713          	srli	a4,a4,0x20
    80002200:	00e68733          	add	a4,a3,a4
    80002204:	00074703          	lbu	a4,0(a4)
    80002208:	ff040693          	addi	a3,s0,-16
    8000220c:	00f687b3          	add	a5,a3,a5
    80002210:	ece78823          	sb	a4,-304(a5)
				} while ((x /= 10) != 0);
    80002214:	fe042703          	lw	a4,-32(s0)
    80002218:	00a00793          	li	a5,10
    8000221c:	02f757bb          	divuw	a5,a4,a5
    80002220:	fef42023          	sw	a5,-32(s0)
    80002224:	fe042783          	lw	a5,-32(s0)
    80002228:	0007879b          	sext.w	a5,a5
    8000222c:	00f037b3          	snez	a5,a5
    80002230:	0ff7f793          	andi	a5,a5,255
    80002234:	00078463          	beqz	a5,8000223c <interruptRoutine+0x490>
				do {
    80002238:	f9dff06f          	j	800021d4 <interruptRoutine+0x428>
				if (neg) buf[i++] = '-';
    8000223c:	f6c42783          	lw	a5,-148(s0)
    80002240:	0007879b          	sext.w	a5,a5
    80002244:	02078063          	beqz	a5,80002264 <interruptRoutine+0x4b8>
    80002248:	fe442783          	lw	a5,-28(s0)
    8000224c:	0017871b          	addiw	a4,a5,1
    80002250:	fee42223          	sw	a4,-28(s0)
    80002254:	ff040713          	addi	a4,s0,-16
    80002258:	00f707b3          	add	a5,a4,a5
    8000225c:	02d00713          	li	a4,45
    80002260:	ece78823          	sb	a4,-304(a5)

				while (--i >= 0) {
    80002264:	fe442783          	lw	a5,-28(s0)
    80002268:	fff7879b          	addiw	a5,a5,-1
    8000226c:	fef42223          	sw	a5,-28(s0)
    80002270:	fe442783          	lw	a5,-28(s0)
    80002274:	fff7c793          	not	a5,a5
    80002278:	01f7d79b          	srliw	a5,a5,0x1f
    8000227c:	0ff7f793          	andi	a5,a5,255
    80002280:	08078663          	beqz	a5,8000230c <interruptRoutine+0x560>
					putc(buf[i]);
    80002284:	fe442783          	lw	a5,-28(s0)
    80002288:	ff040713          	addi	a4,s0,-16
    8000228c:	00f707b3          	add	a5,a4,a5
    80002290:	ed07c783          	lbu	a5,-304(a5)
    80002294:	00078513          	mv	a0,a5
    80002298:	fffff097          	auipc	ra,0xfffff
    8000229c:	2f8080e7          	jalr	760(ra) # 80001590 <_Z4putcc>
				while (--i >= 0) {
    800022a0:	fc5ff06f          	j	80002264 <interruptRoutine+0x4b8>
				}
				break;
			default:
				printString("\nNepostojeci op code: ");
    800022a4:	00007517          	auipc	a0,0x7
    800022a8:	dcc50513          	addi	a0,a0,-564 # 80009070 <CONSOLE_STATUS+0x60>
    800022ac:	00003097          	auipc	ra,0x3
    800022b0:	7d8080e7          	jalr	2008(ra) # 80005a84 <_Z11printStringPKc>
				printInteger(opCode);
    800022b4:	f7843503          	ld	a0,-136(s0)
    800022b8:	fffff097          	auipc	ra,0xfffff
    800022bc:	6e0080e7          	jalr	1760(ra) # 80001998 <_Z12printIntegerm>
				printString("\nscause: ");
    800022c0:	00007517          	auipc	a0,0x7
    800022c4:	dc850513          	addi	a0,a0,-568 # 80009088 <CONSOLE_STATUS+0x78>
    800022c8:	00003097          	auipc	ra,0x3
    800022cc:	7bc080e7          	jalr	1980(ra) # 80005a84 <_Z11printStringPKc>
				printInteger(scause);
    800022d0:	fd843503          	ld	a0,-40(s0)
    800022d4:	fffff097          	auipc	ra,0xfffff
    800022d8:	6c4080e7          	jalr	1732(ra) # 80001998 <_Z12printIntegerm>
				printString("\nsepc: ");
    800022dc:	00007517          	auipc	a0,0x7
    800022e0:	dbc50513          	addi	a0,a0,-580 # 80009098 <CONSOLE_STATUS+0x88>
    800022e4:	00003097          	auipc	ra,0x3
    800022e8:	7a0080e7          	jalr	1952(ra) # 80005a84 <_Z11printStringPKc>
				printInteger(sepc);
    800022ec:	fd043503          	ld	a0,-48(s0)
    800022f0:	fffff097          	auipc	ra,0xfffff
    800022f4:	6a8080e7          	jalr	1704(ra) # 80001998 <_Z12printIntegerm>
				break;
    800022f8:	0180006f          	j	80002310 <interruptRoutine+0x564>
				break;
    800022fc:	00000013          	nop
    80002300:	0100006f          	j	80002310 <interruptRoutine+0x564>
				break;
    80002304:	00000013          	nop
    80002308:	0080006f          	j	80002310 <interruptRoutine+0x564>
				break;
    8000230c:	00000013          	nop
		}
		//sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
		//sepc += 4;
		__asm__ volatile("addi %[dst], %[src], 0x4":[dst]"=r"(sepc):[src]"r"(
				sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002310:	fd043303          	ld	t1,-48(s0)
    80002314:	00430313          	addi	t1,t1,4
    80002318:	fc643823          	sd	t1,-48(s0)
		__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000231c:	fd043303          	ld	t1,-48(s0)
    80002320:	14131073          	csrw	sepc,t1
		__asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002324:	fc843303          	ld	t1,-56(s0)
    80002328:	10031073          	csrw	sstatus,t1
    8000232c:	00000013          	nop
		printString("scause: ");
		printInteger(scause);
		printString("\nsepc: ");
		printInteger(sepc);
	}
}
    80002330:	1ac0006f          	j	800024dc <interruptRoutine+0x730>
	} else if (scause == (1UL << 63 | 9)) {
    80002334:	fd843703          	ld	a4,-40(s0)
    80002338:	fff00793          	li	a5,-1
    8000233c:	03f79793          	slli	a5,a5,0x3f
    80002340:	00978793          	addi	a5,a5,9
    80002344:	0af71263          	bne	a4,a5,800023e8 <interruptRoutine+0x63c>
		uint64 irq = plic_claim();
    80002348:	00005097          	auipc	ra,0x5
    8000234c:	1ec080e7          	jalr	492(ra) # 80007534 <plic_claim>
    80002350:	00050793          	mv	a5,a0
    80002354:	f8f43023          	sd	a5,-128(s0)
		if (irq == CONSOLE_IRQ) {
    80002358:	f8043703          	ld	a4,-128(s0)
    8000235c:	00a00793          	li	a5,10
    80002360:	04f71863          	bne	a4,a5,800023b0 <interruptRoutine+0x604>
			if (*KConsole::sr & CONSOLE_RX_STATUS_BIT) {
    80002364:	00009797          	auipc	a5,0x9
    80002368:	7947b783          	ld	a5,1940(a5) # 8000baf8 <_GLOBAL_OFFSET_TABLE_+0x80>
    8000236c:	0007b783          	ld	a5,0(a5)
    80002370:	0007c783          	lbu	a5,0(a5)
    80002374:	0017f793          	andi	a5,a5,1
    80002378:	02078063          	beqz	a5,80002398 <interruptRoutine+0x5ec>
				KConsole::placeInInput(*KConsole::dr);
    8000237c:	00009797          	auipc	a5,0x9
    80002380:	7447b783          	ld	a5,1860(a5) # 8000bac0 <_GLOBAL_OFFSET_TABLE_+0x48>
    80002384:	0007b783          	ld	a5,0(a5)
    80002388:	0007c783          	lbu	a5,0(a5)
    8000238c:	00078513          	mv	a0,a5
    80002390:	fffff097          	auipc	ra,0xfffff
    80002394:	4c8080e7          	jalr	1224(ra) # 80001858 <_ZN8KConsole12placeInInputEc>
			plic_complete(irq);
    80002398:	f8043783          	ld	a5,-128(s0)
    8000239c:	0007879b          	sext.w	a5,a5
    800023a0:	00078513          	mv	a0,a5
    800023a4:	00005097          	auipc	ra,0x5
    800023a8:	1c8080e7          	jalr	456(ra) # 8000756c <plic_complete>
    800023ac:	0140006f          	j	800023c0 <interruptRoutine+0x614>
			printString("Neki drugi prekid\n");
    800023b0:	00007517          	auipc	a0,0x7
    800023b4:	cf050513          	addi	a0,a0,-784 # 800090a0 <CONSOLE_STATUS+0x90>
    800023b8:	00003097          	auipc	ra,0x3
    800023bc:	6cc080e7          	jalr	1740(ra) # 80005a84 <_Z11printStringPKc>
		Riscv::w_sepc(sepc);
    800023c0:	fd043503          	ld	a0,-48(s0)
    800023c4:	00000097          	auipc	ra,0x0
    800023c8:	12c080e7          	jalr	300(ra) # 800024f0 <_ZN5Riscv6w_sepcEm>
		Riscv::w_sstatus(sstatus);
    800023cc:	fc843503          	ld	a0,-56(s0)
    800023d0:	00000097          	auipc	ra,0x0
    800023d4:	158080e7          	jalr	344(ra) # 80002528 <_ZN5Riscv9w_sstatusEm>
		Riscv::mc_sip(Riscv::SIP_SEIP);
    800023d8:	20000513          	li	a0,512
    800023dc:	00000097          	auipc	ra,0x0
    800023e0:	130080e7          	jalr	304(ra) # 8000250c <_ZN5Riscv6mc_sipEm>
}
    800023e4:	0f80006f          	j	800024dc <interruptRoutine+0x730>
	} else if (scause == (1UL << 63 | 1)) {
    800023e8:	fd843703          	ld	a4,-40(s0)
    800023ec:	fff00793          	li	a5,-1
    800023f0:	03f79793          	slli	a5,a5,0x3f
    800023f4:	00178793          	addi	a5,a5,1
    800023f8:	08f71e63          	bne	a4,a5,80002494 <interruptRoutine+0x6e8>
		Scheduler::wake();
    800023fc:	fffff097          	auipc	ra,0xfffff
    80002400:	6f0080e7          	jalr	1776(ra) # 80001aec <_ZN9Scheduler4wakeEv>
		TCB::runningTimeSlice++;
    80002404:	00009797          	auipc	a5,0x9
    80002408:	68c7b783          	ld	a5,1676(a5) # 8000ba90 <_GLOBAL_OFFSET_TABLE_+0x18>
    8000240c:	0007b783          	ld	a5,0(a5)
    80002410:	00178713          	addi	a4,a5,1
    80002414:	00009797          	auipc	a5,0x9
    80002418:	67c7b783          	ld	a5,1660(a5) # 8000ba90 <_GLOBAL_OFFSET_TABLE_+0x18>
    8000241c:	00e7b023          	sd	a4,0(a5)
		if (TCB::runningTimeSlice >= TCB::running->getTimeSlice()) {
    80002420:	00009797          	auipc	a5,0x9
    80002424:	6b07b783          	ld	a5,1712(a5) # 8000bad0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002428:	0007b783          	ld	a5,0(a5)
    8000242c:	00078513          	mv	a0,a5
    80002430:	00000097          	auipc	ra,0x0
    80002434:	130080e7          	jalr	304(ra) # 80002560 <_ZN3TCB12getTimeSliceEv>
    80002438:	00050713          	mv	a4,a0
    8000243c:	00009797          	auipc	a5,0x9
    80002440:	6547b783          	ld	a5,1620(a5) # 8000ba90 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002444:	0007b783          	ld	a5,0(a5)
    80002448:	00e7b7b3          	sltu	a5,a5,a4
    8000244c:	0017c793          	xori	a5,a5,1
    80002450:	0ff7f793          	andi	a5,a5,255
    80002454:	00078c63          	beqz	a5,8000246c <interruptRoutine+0x6c0>
			TCB::yield();
    80002458:	00000097          	auipc	ra,0x0
    8000245c:	7e4080e7          	jalr	2020(ra) # 80002c3c <_ZN3TCB5yieldEv>
			TCB::runningTimeSlice = 0;
    80002460:	00009797          	auipc	a5,0x9
    80002464:	6307b783          	ld	a5,1584(a5) # 8000ba90 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002468:	0007b023          	sd	zero,0(a5)
		Riscv::w_sepc(sepc);
    8000246c:	fd043503          	ld	a0,-48(s0)
    80002470:	00000097          	auipc	ra,0x0
    80002474:	080080e7          	jalr	128(ra) # 800024f0 <_ZN5Riscv6w_sepcEm>
		Riscv::w_sstatus(sstatus);
    80002478:	fc843503          	ld	a0,-56(s0)
    8000247c:	00000097          	auipc	ra,0x0
    80002480:	0ac080e7          	jalr	172(ra) # 80002528 <_ZN5Riscv9w_sstatusEm>
		Riscv::mc_sip(Riscv::SIP_SSIP);
    80002484:	00200513          	li	a0,2
    80002488:	00000097          	auipc	ra,0x0
    8000248c:	084080e7          	jalr	132(ra) # 8000250c <_ZN5Riscv6mc_sipEm>
}
    80002490:	04c0006f          	j	800024dc <interruptRoutine+0x730>
		printString("\nGreska u prekidnoj rutini\n");
    80002494:	00007517          	auipc	a0,0x7
    80002498:	c2450513          	addi	a0,a0,-988 # 800090b8 <CONSOLE_STATUS+0xa8>
    8000249c:	00003097          	auipc	ra,0x3
    800024a0:	5e8080e7          	jalr	1512(ra) # 80005a84 <_Z11printStringPKc>
		printString("scause: ");
    800024a4:	00007517          	auipc	a0,0x7
    800024a8:	c3450513          	addi	a0,a0,-972 # 800090d8 <CONSOLE_STATUS+0xc8>
    800024ac:	00003097          	auipc	ra,0x3
    800024b0:	5d8080e7          	jalr	1496(ra) # 80005a84 <_Z11printStringPKc>
		printInteger(scause);
    800024b4:	fd843503          	ld	a0,-40(s0)
    800024b8:	fffff097          	auipc	ra,0xfffff
    800024bc:	4e0080e7          	jalr	1248(ra) # 80001998 <_Z12printIntegerm>
		printString("\nsepc: ");
    800024c0:	00007517          	auipc	a0,0x7
    800024c4:	bd850513          	addi	a0,a0,-1064 # 80009098 <CONSOLE_STATUS+0x88>
    800024c8:	00003097          	auipc	ra,0x3
    800024cc:	5bc080e7          	jalr	1468(ra) # 80005a84 <_Z11printStringPKc>
		printInteger(sepc);
    800024d0:	fd043503          	ld	a0,-48(s0)
    800024d4:	fffff097          	auipc	ra,0xfffff
    800024d8:	4c4080e7          	jalr	1220(ra) # 80001998 <_Z12printIntegerm>
}
    800024dc:	00000013          	nop
    800024e0:	13813083          	ld	ra,312(sp)
    800024e4:	13013403          	ld	s0,304(sp)
    800024e8:	14010113          	addi	sp,sp,320
    800024ec:	00008067          	ret

00000000800024f0 <_ZN5Riscv6w_sepcEm>:
inline void Riscv::w_sepc(uint64 sepc) {
    800024f0:	ff010113          	addi	sp,sp,-16
    800024f4:	00813423          	sd	s0,8(sp)
    800024f8:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    800024fc:	14151073          	csrw	sepc,a0
}
    80002500:	00813403          	ld	s0,8(sp)
    80002504:	01010113          	addi	sp,sp,16
    80002508:	00008067          	ret

000000008000250c <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    8000250c:	ff010113          	addi	sp,sp,-16
    80002510:	00813423          	sd	s0,8(sp)
    80002514:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    80002518:	14453073          	csrc	sip,a0
}
    8000251c:	00813403          	ld	s0,8(sp)
    80002520:	01010113          	addi	sp,sp,16
    80002524:	00008067          	ret

0000000080002528 <_ZN5Riscv9w_sstatusEm>:
	uint64 volatile sstatus;
	__asm__ volatile("csrr %[sstatus], sstatus": [sstatus] "=r"(sstatus));
	return sstatus;
}

inline void Riscv::w_sstatus(uint64 sstatus) {
    80002528:	ff010113          	addi	sp,sp,-16
    8000252c:	00813423          	sd	s0,8(sp)
    80002530:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw sstatus, %[sstatus]": :[sstatus] "r"(sstatus));
    80002534:	10051073          	csrw	sstatus,a0
}
    80002538:	00813403          	ld	s0,8(sp)
    8000253c:	01010113          	addi	sp,sp,16
    80002540:	00008067          	ret

0000000080002544 <_ZN3TCB11setFinishedEb>:
	static TCB* createThread(Body function, void* args, uint64* stack);
	static void start(TCB* newTcb);

	bool isFinished() { return finished; }

	void setFinished(bool finish) { this->finished = finish; }
    80002544:	ff010113          	addi	sp,sp,-16
    80002548:	00813423          	sd	s0,8(sp)
    8000254c:	01010413          	addi	s0,sp,16
    80002550:	02b50823          	sb	a1,48(a0)
    80002554:	00813403          	ld	s0,8(sp)
    80002558:	01010113          	addi	sp,sp,16
    8000255c:	00008067          	ret

0000000080002560 <_ZN3TCB12getTimeSliceEv>:

	bool isBlocked() { return blocked; }

	void setBlocked(bool block) { this->blocked = block; }

	uint64 getTimeSlice() { return timeSlice; }
    80002560:	ff010113          	addi	sp,sp,-16
    80002564:	00813423          	sd	s0,8(sp)
    80002568:	01010413          	addi	s0,sp,16
    8000256c:	02853503          	ld	a0,40(a0)
    80002570:	00813403          	ld	s0,8(sp)
    80002574:	01010113          	addi	sp,sp,16
    80002578:	00008067          	ret

000000008000257c <_ZN6Thread7wrapperEPv>:

	__asm__ volatile("ecall");
}

void Thread::wrapper(void* thread) {
	if(thread!=nullptr){
    8000257c:	02050863          	beqz	a0,800025ac <_ZN6Thread7wrapperEPv+0x30>
void Thread::wrapper(void* thread) {
    80002580:	ff010113          	addi	sp,sp,-16
    80002584:	00113423          	sd	ra,8(sp)
    80002588:	00813023          	sd	s0,0(sp)
    8000258c:	01010413          	addi	s0,sp,16
		((Thread*)thread)->run();
    80002590:	00053783          	ld	a5,0(a0)
    80002594:	0107b783          	ld	a5,16(a5)
    80002598:	000780e7          	jalr	a5
	}
}
    8000259c:	00813083          	ld	ra,8(sp)
    800025a0:	00013403          	ld	s0,0(sp)
    800025a4:	01010113          	addi	sp,sp,16
    800025a8:	00008067          	ret
    800025ac:	00008067          	ret

00000000800025b0 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    800025b0:	ff010113          	addi	sp,sp,-16
    800025b4:	00113423          	sd	ra,8(sp)
    800025b8:	00813023          	sd	s0,0(sp)
    800025bc:	01010413          	addi	s0,sp,16
    800025c0:	00009797          	auipc	a5,0x9
    800025c4:	2d878793          	addi	a5,a5,728 # 8000b898 <_ZTV6Thread+0x10>
    800025c8:	00f53023          	sd	a5,0(a0)
	thread_exit();
    800025cc:	fffff097          	auipc	ra,0xfffff
    800025d0:	e34080e7          	jalr	-460(ra) # 80001400 <_Z11thread_exitv>
}
    800025d4:	00813083          	ld	ra,8(sp)
    800025d8:	00013403          	ld	s0,0(sp)
    800025dc:	01010113          	addi	sp,sp,16
    800025e0:	00008067          	ret

00000000800025e4 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
	sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    800025e4:	fe010113          	addi	sp,sp,-32
    800025e8:	00113c23          	sd	ra,24(sp)
    800025ec:	00813823          	sd	s0,16(sp)
    800025f0:	00913423          	sd	s1,8(sp)
    800025f4:	02010413          	addi	s0,sp,32
    800025f8:	00050493          	mv	s1,a0
    800025fc:	00009797          	auipc	a5,0x9
    80002600:	2c478793          	addi	a5,a5,708 # 8000b8c0 <_ZTV9Semaphore+0x10>
    80002604:	00f53023          	sd	a5,0(a0)
	sem_close(myHandle);
    80002608:	00853503          	ld	a0,8(a0)
    8000260c:	fffff097          	auipc	ra,0xfffff
    80002610:	ecc080e7          	jalr	-308(ra) # 800014d8 <_Z9sem_closeP4KSem>
	delete myHandle;
    80002614:	0084b483          	ld	s1,8(s1)
    80002618:	02048863          	beqz	s1,80002648 <_ZN9SemaphoreD1Ev+0x64>
			delete node;
		}
	}

	bool isEmpty() const {
		return front == nullptr;
    8000261c:	0084b503          	ld	a0,8(s1)
		while (!isEmpty()) {
    80002620:	00050e63          	beqz	a0,8000263c <_ZN9SemaphoreD1Ev+0x58>
			front = front->next;
    80002624:	00853783          	ld	a5,8(a0)
    80002628:	00f4b423          	sd	a5,8(s1)
			delete node;
    8000262c:	fe0508e3          	beqz	a0,8000261c <_ZN9SemaphoreD1Ev+0x38>
			mem_free(ptr);
    80002630:	fffff097          	auipc	ra,0xfffff
    80002634:	d20080e7          	jalr	-736(ra) # 80001350 <_Z8mem_freePv>
		}
    80002638:	fe5ff06f          	j	8000261c <_ZN9SemaphoreD1Ev+0x38>
    8000263c:	00048513          	mv	a0,s1
    80002640:	00001097          	auipc	ra,0x1
    80002644:	bc4080e7          	jalr	-1084(ra) # 80003204 <_ZN4KSemdlEPv>
}
    80002648:	01813083          	ld	ra,24(sp)
    8000264c:	01013403          	ld	s0,16(sp)
    80002650:	00813483          	ld	s1,8(sp)
    80002654:	02010113          	addi	sp,sp,32
    80002658:	00008067          	ret

000000008000265c <_Znwm>:
void* operator new(size_t size) {
    8000265c:	ff010113          	addi	sp,sp,-16
    80002660:	00113423          	sd	ra,8(sp)
    80002664:	00813023          	sd	s0,0(sp)
    80002668:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    8000266c:	fffff097          	auipc	ra,0xfffff
    80002670:	ca4080e7          	jalr	-860(ra) # 80001310 <_Z9mem_allocm>
}
    80002674:	00813083          	ld	ra,8(sp)
    80002678:	00013403          	ld	s0,0(sp)
    8000267c:	01010113          	addi	sp,sp,16
    80002680:	00008067          	ret

0000000080002684 <_Znam>:
void* operator new[](size_t size) {
    80002684:	ff010113          	addi	sp,sp,-16
    80002688:	00113423          	sd	ra,8(sp)
    8000268c:	00813023          	sd	s0,0(sp)
    80002690:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    80002694:	fffff097          	auipc	ra,0xfffff
    80002698:	c7c080e7          	jalr	-900(ra) # 80001310 <_Z9mem_allocm>
}
    8000269c:	00813083          	ld	ra,8(sp)
    800026a0:	00013403          	ld	s0,0(sp)
    800026a4:	01010113          	addi	sp,sp,16
    800026a8:	00008067          	ret

00000000800026ac <_ZdlPv>:
noexcept {
    800026ac:	ff010113          	addi	sp,sp,-16
    800026b0:	00113423          	sd	ra,8(sp)
    800026b4:	00813023          	sd	s0,0(sp)
    800026b8:	01010413          	addi	s0,sp,16
mem_free(ptr);
    800026bc:	fffff097          	auipc	ra,0xfffff
    800026c0:	c94080e7          	jalr	-876(ra) # 80001350 <_Z8mem_freePv>
}
    800026c4:	00813083          	ld	ra,8(sp)
    800026c8:	00013403          	ld	s0,0(sp)
    800026cc:	01010113          	addi	sp,sp,16
    800026d0:	00008067          	ret

00000000800026d4 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    800026d4:	fe010113          	addi	sp,sp,-32
    800026d8:	00113c23          	sd	ra,24(sp)
    800026dc:	00813823          	sd	s0,16(sp)
    800026e0:	00913423          	sd	s1,8(sp)
    800026e4:	02010413          	addi	s0,sp,32
    800026e8:	00050493          	mv	s1,a0
}
    800026ec:	00000097          	auipc	ra,0x0
    800026f0:	ec4080e7          	jalr	-316(ra) # 800025b0 <_ZN6ThreadD1Ev>
    800026f4:	00048513          	mv	a0,s1
    800026f8:	00000097          	auipc	ra,0x0
    800026fc:	fb4080e7          	jalr	-76(ra) # 800026ac <_ZdlPv>
    80002700:	01813083          	ld	ra,24(sp)
    80002704:	01013403          	ld	s0,16(sp)
    80002708:	00813483          	ld	s1,8(sp)
    8000270c:	02010113          	addi	sp,sp,32
    80002710:	00008067          	ret

0000000080002714 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80002714:	fe010113          	addi	sp,sp,-32
    80002718:	00113c23          	sd	ra,24(sp)
    8000271c:	00813823          	sd	s0,16(sp)
    80002720:	00913423          	sd	s1,8(sp)
    80002724:	02010413          	addi	s0,sp,32
    80002728:	00050493          	mv	s1,a0
}
    8000272c:	00000097          	auipc	ra,0x0
    80002730:	eb8080e7          	jalr	-328(ra) # 800025e4 <_ZN9SemaphoreD1Ev>
    80002734:	00048513          	mv	a0,s1
    80002738:	00000097          	auipc	ra,0x0
    8000273c:	f74080e7          	jalr	-140(ra) # 800026ac <_ZdlPv>
    80002740:	01813083          	ld	ra,24(sp)
    80002744:	01013403          	ld	s0,16(sp)
    80002748:	00813483          	ld	s1,8(sp)
    8000274c:	02010113          	addi	sp,sp,32
    80002750:	00008067          	ret

0000000080002754 <_ZdaPv>:
noexcept {
    80002754:	ff010113          	addi	sp,sp,-16
    80002758:	00113423          	sd	ra,8(sp)
    8000275c:	00813023          	sd	s0,0(sp)
    80002760:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80002764:	fffff097          	auipc	ra,0xfffff
    80002768:	bec080e7          	jalr	-1044(ra) # 80001350 <_Z8mem_freePv>
}
    8000276c:	00813083          	ld	ra,8(sp)
    80002770:	00013403          	ld	s0,0(sp)
    80002774:	01010113          	addi	sp,sp,16
    80002778:	00008067          	ret

000000008000277c <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (* body)(void*), void* arg) {
    8000277c:	fd010113          	addi	sp,sp,-48
    80002780:	02113423          	sd	ra,40(sp)
    80002784:	02813023          	sd	s0,32(sp)
    80002788:	00913c23          	sd	s1,24(sp)
    8000278c:	01213823          	sd	s2,16(sp)
    80002790:	01313423          	sd	s3,8(sp)
    80002794:	03010413          	addi	s0,sp,48
    80002798:	00050493          	mv	s1,a0
    8000279c:	00058913          	mv	s2,a1
    800027a0:	00060993          	mv	s3,a2
    800027a4:	00009797          	auipc	a5,0x9
    800027a8:	0f478793          	addi	a5,a5,244 # 8000b898 <_ZTV6Thread+0x10>
    800027ac:	00f53023          	sd	a5,0(a0)
	this->body = body;
    800027b0:	00b53823          	sd	a1,16(a0)
	this->arg = arg;
    800027b4:	00c53c23          	sd	a2,24(a0)
	if (body != nullptr) {
    800027b8:	04058663          	beqz	a1,80002804 <_ZN6ThreadC1EPFvPvES0_+0x88>
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    800027bc:	00001537          	lui	a0,0x1
    800027c0:	fffff097          	auipc	ra,0xfffff
    800027c4:	b50080e7          	jalr	-1200(ra) # 80001310 <_Z9mem_allocm>
    800027c8:	00050313          	mv	t1,a0
	__asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800027cc:	00030713          	mv	a4,t1
	__asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800027d0:	00098693          	mv	a3,s3
			body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800027d4:	00090613          	mv	a2,s2
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800027d8:	00848493          	addi	s1,s1,8
    800027dc:	00048593          	mv	a1,s1
	__asm__ volatile("li a0, 0x80");
    800027e0:	08000513          	li	a0,128
	__asm__ volatile("ecall");
    800027e4:	00000073          	ecall
}
    800027e8:	02813083          	ld	ra,40(sp)
    800027ec:	02013403          	ld	s0,32(sp)
    800027f0:	01813483          	ld	s1,24(sp)
    800027f4:	01013903          	ld	s2,16(sp)
    800027f8:	00813983          	ld	s3,8(sp)
    800027fc:	03010113          	addi	sp,sp,48
    80002800:	00008067          	ret
	uint64* stack = nullptr;
    80002804:	00000313          	li	t1,0
    80002808:	fc5ff06f          	j	800027cc <_ZN6ThreadC1EPFvPvES0_+0x50>

000000008000280c <_ZN6Thread5startEv>:
int Thread::start() {
    8000280c:	ff010113          	addi	sp,sp,-16
    80002810:	00813423          	sd	s0,8(sp)
    80002814:	01010413          	addi	s0,sp,16
	if (myHandle == nullptr) return -1;
    80002818:	00853303          	ld	t1,8(a0) # 1008 <_entry-0x7fffeff8>
    8000281c:	02030063          	beqz	t1,8000283c <_ZN6Thread5startEv+0x30>
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002820:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x81");
    80002824:	08100513          	li	a0,129
	__asm__ volatile("ecall");
    80002828:	00000073          	ecall
	return 0;
    8000282c:	00000513          	li	a0,0
}
    80002830:	00813403          	ld	s0,8(sp)
    80002834:	01010113          	addi	sp,sp,16
    80002838:	00008067          	ret
	if (myHandle == nullptr) return -1;
    8000283c:	fff00513          	li	a0,-1
    80002840:	ff1ff06f          	j	80002830 <_ZN6Thread5startEv+0x24>

0000000080002844 <_ZN6Thread4joinEv>:
void Thread::join() {
    80002844:	ff010113          	addi	sp,sp,-16
    80002848:	00113423          	sd	ra,8(sp)
    8000284c:	00813023          	sd	s0,0(sp)
    80002850:	01010413          	addi	s0,sp,16
	thread_join(myHandle);
    80002854:	00853503          	ld	a0,8(a0)
    80002858:	fffff097          	auipc	ra,0xfffff
    8000285c:	bf0080e7          	jalr	-1040(ra) # 80001448 <_Z11thread_joinP3TCB>
}
    80002860:	00813083          	ld	ra,8(sp)
    80002864:	00013403          	ld	s0,0(sp)
    80002868:	01010113          	addi	sp,sp,16
    8000286c:	00008067          	ret

0000000080002870 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80002870:	ff010113          	addi	sp,sp,-16
    80002874:	00113423          	sd	ra,8(sp)
    80002878:	00813023          	sd	s0,0(sp)
    8000287c:	01010413          	addi	s0,sp,16
	thread_dispatch();
    80002880:	fffff097          	auipc	ra,0xfffff
    80002884:	ba8080e7          	jalr	-1112(ra) # 80001428 <_Z15thread_dispatchv>
}
    80002888:	00813083          	ld	ra,8(sp)
    8000288c:	00013403          	ld	s0,0(sp)
    80002890:	01010113          	addi	sp,sp,16
    80002894:	00008067          	ret

0000000080002898 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t t) {
    80002898:	ff010113          	addi	sp,sp,-16
    8000289c:	00113423          	sd	ra,8(sp)
    800028a0:	00813023          	sd	s0,0(sp)
    800028a4:	01010413          	addi	s0,sp,16
    800028a8:	00050593          	mv	a1,a0
	Scheduler::putToSleep(TCB::running, t);
    800028ac:	00009797          	auipc	a5,0x9
    800028b0:	2247b783          	ld	a5,548(a5) # 8000bad0 <_GLOBAL_OFFSET_TABLE_+0x58>
    800028b4:	0007b503          	ld	a0,0(a5)
    800028b8:	fffff097          	auipc	ra,0xfffff
    800028bc:	18c080e7          	jalr	396(ra) # 80001a44 <_ZN9Scheduler10putToSleepEP3TCBm>
}
    800028c0:	00000513          	li	a0,0
    800028c4:	00813083          	ld	ra,8(sp)
    800028c8:	00013403          	ld	s0,0(sp)
    800028cc:	01010113          	addi	sp,sp,16
    800028d0:	00008067          	ret

00000000800028d4 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    800028d4:	fe010113          	addi	sp,sp,-32
    800028d8:	00113c23          	sd	ra,24(sp)
    800028dc:	00813823          	sd	s0,16(sp)
    800028e0:	00913423          	sd	s1,8(sp)
    800028e4:	02010413          	addi	s0,sp,32
    800028e8:	00050493          	mv	s1,a0
    800028ec:	00009797          	auipc	a5,0x9
    800028f0:	fac78793          	addi	a5,a5,-84 # 8000b898 <_ZTV6Thread+0x10>
    800028f4:	00f53023          	sd	a5,0(a0)
	this->body = wrapper;
    800028f8:	00000797          	auipc	a5,0x0
    800028fc:	c8478793          	addi	a5,a5,-892 # 8000257c <_ZN6Thread7wrapperEPv>
    80002900:	00f53823          	sd	a5,16(a0)
	this->arg = this;
    80002904:	00a53c23          	sd	a0,24(a0)
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    80002908:	00001537          	lui	a0,0x1
    8000290c:	fffff097          	auipc	ra,0xfffff
    80002910:	a04080e7          	jalr	-1532(ra) # 80001310 <_Z9mem_allocm>
    80002914:	00050313          	mv	t1,a0
	__asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002918:	00030713          	mv	a4,t1
	__asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000291c:	0184b303          	ld	t1,24(s1)
    80002920:	00030693          	mv	a3,t1
			body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002924:	0104b303          	ld	t1,16(s1)
    80002928:	00030613          	mv	a2,t1
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000292c:	00848493          	addi	s1,s1,8
    80002930:	00048593          	mv	a1,s1
	__asm__ volatile("li a0, 0x80");
    80002934:	08000513          	li	a0,128
	__asm__ volatile("ecall");
    80002938:	00000073          	ecall
}
    8000293c:	01813083          	ld	ra,24(sp)
    80002940:	01013403          	ld	s0,16(sp)
    80002944:	00813483          	ld	s1,8(sp)
    80002948:	02010113          	addi	sp,sp,32
    8000294c:	00008067          	ret

0000000080002950 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80002950:	ff010113          	addi	sp,sp,-16
    80002954:	00113423          	sd	ra,8(sp)
    80002958:	00813023          	sd	s0,0(sp)
    8000295c:	01010413          	addi	s0,sp,16
    80002960:	00009797          	auipc	a5,0x9
    80002964:	f6078793          	addi	a5,a5,-160 # 8000b8c0 <_ZTV9Semaphore+0x10>
    80002968:	00f53023          	sd	a5,0(a0) # 1000 <_entry-0x7ffff000>
	sem_open(&myHandle, init);
    8000296c:	00850513          	addi	a0,a0,8
    80002970:	fffff097          	auipc	ra,0xfffff
    80002974:	b30080e7          	jalr	-1232(ra) # 800014a0 <_Z8sem_openPP4KSemj>
}
    80002978:	00813083          	ld	ra,8(sp)
    8000297c:	00013403          	ld	s0,0(sp)
    80002980:	01010113          	addi	sp,sp,16
    80002984:	00008067          	ret

0000000080002988 <_ZN9Semaphore4waitEv>:

int Semaphore::wait() {
    80002988:	ff010113          	addi	sp,sp,-16
    8000298c:	00113423          	sd	ra,8(sp)
    80002990:	00813023          	sd	s0,0(sp)
    80002994:	01010413          	addi	s0,sp,16
	return sem_wait(myHandle);
    80002998:	00853503          	ld	a0,8(a0)
    8000299c:	fffff097          	auipc	ra,0xfffff
    800029a0:	b6c080e7          	jalr	-1172(ra) # 80001508 <_Z8sem_waitP4KSem>
}
    800029a4:	00813083          	ld	ra,8(sp)
    800029a8:	00013403          	ld	s0,0(sp)
    800029ac:	01010113          	addi	sp,sp,16
    800029b0:	00008067          	ret

00000000800029b4 <_ZN9Semaphore6signalEv>:

int Semaphore::signal() {
    800029b4:	ff010113          	addi	sp,sp,-16
    800029b8:	00113423          	sd	ra,8(sp)
    800029bc:	00813023          	sd	s0,0(sp)
    800029c0:	01010413          	addi	s0,sp,16
	return sem_signal(myHandle);
    800029c4:	00853503          	ld	a0,8(a0)
    800029c8:	fffff097          	auipc	ra,0xfffff
    800029cc:	b70080e7          	jalr	-1168(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    800029d0:	00813083          	ld	ra,8(sp)
    800029d4:	00013403          	ld	s0,0(sp)
    800029d8:	01010113          	addi	sp,sp,16
    800029dc:	00008067          	ret

00000000800029e0 <_ZN14PeriodicThread9terminateEv>:

void PeriodicThread::terminate() {
    800029e0:	ff010113          	addi	sp,sp,-16
    800029e4:	00813423          	sd	s0,8(sp)
    800029e8:	01010413          	addi	s0,sp,16

}
    800029ec:	00813403          	ld	s0,8(sp)
    800029f0:	01010113          	addi	sp,sp,16
    800029f4:	00008067          	ret

00000000800029f8 <_ZN14PeriodicThreadC1Em>:

PeriodicThread::PeriodicThread(time_t period) {
    800029f8:	fe010113          	addi	sp,sp,-32
    800029fc:	00113c23          	sd	ra,24(sp)
    80002a00:	00813823          	sd	s0,16(sp)
    80002a04:	00913423          	sd	s1,8(sp)
    80002a08:	02010413          	addi	s0,sp,32
    80002a0c:	00050493          	mv	s1,a0
    80002a10:	00000097          	auipc	ra,0x0
    80002a14:	ec4080e7          	jalr	-316(ra) # 800028d4 <_ZN6ThreadC1Ev>
    80002a18:	00009797          	auipc	a5,0x9
    80002a1c:	e5078793          	addi	a5,a5,-432 # 8000b868 <_ZTV14PeriodicThread+0x10>
    80002a20:	00f4b023          	sd	a5,0(s1)

}
    80002a24:	01813083          	ld	ra,24(sp)
    80002a28:	01013403          	ld	s0,16(sp)
    80002a2c:	00813483          	ld	s1,8(sp)
    80002a30:	02010113          	addi	sp,sp,32
    80002a34:	00008067          	ret

0000000080002a38 <_ZN7Console4getcEv>:

char Console::getc() {
    80002a38:	ff010113          	addi	sp,sp,-16
    80002a3c:	00113423          	sd	ra,8(sp)
    80002a40:	00813023          	sd	s0,0(sp)
    80002a44:	01010413          	addi	s0,sp,16
	return ::getc();
    80002a48:	fffff097          	auipc	ra,0xfffff
    80002a4c:	b20080e7          	jalr	-1248(ra) # 80001568 <_Z4getcv>
}
    80002a50:	00813083          	ld	ra,8(sp)
    80002a54:	00013403          	ld	s0,0(sp)
    80002a58:	01010113          	addi	sp,sp,16
    80002a5c:	00008067          	ret

0000000080002a60 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80002a60:	ff010113          	addi	sp,sp,-16
    80002a64:	00113423          	sd	ra,8(sp)
    80002a68:	00813023          	sd	s0,0(sp)
    80002a6c:	01010413          	addi	s0,sp,16
	::putc(c);
    80002a70:	fffff097          	auipc	ra,0xfffff
    80002a74:	b20080e7          	jalr	-1248(ra) # 80001590 <_Z4putcc>
}
    80002a78:	00813083          	ld	ra,8(sp)
    80002a7c:	00013403          	ld	s0,0(sp)
    80002a80:	01010113          	addi	sp,sp,16
    80002a84:	00008067          	ret

0000000080002a88 <_ZN6Thread3runEv>:
	static int sleep(time_t);

protected:
	Thread();

	virtual void run() {}
    80002a88:	ff010113          	addi	sp,sp,-16
    80002a8c:	00813423          	sd	s0,8(sp)
    80002a90:	01010413          	addi	s0,sp,16
    80002a94:	00813403          	ld	s0,8(sp)
    80002a98:	01010113          	addi	sp,sp,16
    80002a9c:	00008067          	ret

0000000080002aa0 <_ZN14PeriodicThread18periodicActivationEv>:
	void terminate();

protected:
	PeriodicThread(time_t period);

	virtual void periodicActivation() {}
    80002aa0:	ff010113          	addi	sp,sp,-16
    80002aa4:	00813423          	sd	s0,8(sp)
    80002aa8:	01010413          	addi	s0,sp,16
    80002aac:	00813403          	ld	s0,8(sp)
    80002ab0:	01010113          	addi	sp,sp,16
    80002ab4:	00008067          	ret

0000000080002ab8 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80002ab8:	ff010113          	addi	sp,sp,-16
    80002abc:	00113423          	sd	ra,8(sp)
    80002ac0:	00813023          	sd	s0,0(sp)
    80002ac4:	01010413          	addi	s0,sp,16
    80002ac8:	00009797          	auipc	a5,0x9
    80002acc:	da078793          	addi	a5,a5,-608 # 8000b868 <_ZTV14PeriodicThread+0x10>
    80002ad0:	00f53023          	sd	a5,0(a0)
    80002ad4:	00000097          	auipc	ra,0x0
    80002ad8:	adc080e7          	jalr	-1316(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80002adc:	00813083          	ld	ra,8(sp)
    80002ae0:	00013403          	ld	s0,0(sp)
    80002ae4:	01010113          	addi	sp,sp,16
    80002ae8:	00008067          	ret

0000000080002aec <_ZN14PeriodicThreadD0Ev>:
    80002aec:	fe010113          	addi	sp,sp,-32
    80002af0:	00113c23          	sd	ra,24(sp)
    80002af4:	00813823          	sd	s0,16(sp)
    80002af8:	00913423          	sd	s1,8(sp)
    80002afc:	02010413          	addi	s0,sp,32
    80002b00:	00050493          	mv	s1,a0
    80002b04:	00009797          	auipc	a5,0x9
    80002b08:	d6478793          	addi	a5,a5,-668 # 8000b868 <_ZTV14PeriodicThread+0x10>
    80002b0c:	00f53023          	sd	a5,0(a0)
    80002b10:	00000097          	auipc	ra,0x0
    80002b14:	aa0080e7          	jalr	-1376(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80002b18:	00048513          	mv	a0,s1
    80002b1c:	00000097          	auipc	ra,0x0
    80002b20:	b90080e7          	jalr	-1136(ra) # 800026ac <_ZdlPv>
    80002b24:	01813083          	ld	ra,24(sp)
    80002b28:	01013403          	ld	s0,16(sp)
    80002b2c:	00813483          	ld	s1,8(sp)
    80002b30:	02010113          	addi	sp,sp,32
    80002b34:	00008067          	ret

0000000080002b38 <_ZN3TCB7wrapperEv>:
	Riscv::pushRegisters();
	TCB::dispatch();
	Riscv::popRegisters();
}

void TCB::wrapper() {
    80002b38:	ff010113          	addi	sp,sp,-16
    80002b3c:	00113423          	sd	ra,8(sp)
    80002b40:	00813023          	sd	s0,0(sp)
    80002b44:	01010413          	addi	s0,sp,16
	//pocetak wrappera se izvrsava u supervisor modu,
	//jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch/yield)
	Riscv::popSppSpie();
    80002b48:	00000097          	auipc	ra,0x0
    80002b4c:	310080e7          	jalr	784(ra) # 80002e58 <_ZN5Riscv10popSppSpieEv>
	//na dalje se izvrsavamo u user modu
	running->threadFunction(running->args);
    80002b50:	00009797          	auipc	a5,0x9
    80002b54:	0a07b783          	ld	a5,160(a5) # 8000bbf0 <_ZN3TCB7runningE>
    80002b58:	0107b703          	ld	a4,16(a5)
    80002b5c:	0207b503          	ld	a0,32(a5)
    80002b60:	000700e7          	jalr	a4
	//running->finished = true;
	//i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
	thread_exit();
    80002b64:	fffff097          	auipc	ra,0xfffff
    80002b68:	89c080e7          	jalr	-1892(ra) # 80001400 <_Z11thread_exitv>
}
    80002b6c:	00813083          	ld	ra,8(sp)
    80002b70:	00013403          	ld	s0,0(sp)
    80002b74:	01010113          	addi	sp,sp,16
    80002b78:	00008067          	ret

0000000080002b7c <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80002b7c:	fe010113          	addi	sp,sp,-32
    80002b80:	00113c23          	sd	ra,24(sp)
    80002b84:	00813823          	sd	s0,16(sp)
    80002b88:	00913423          	sd	s1,8(sp)
    80002b8c:	02010413          	addi	s0,sp,32
	TCB* old = TCB::running;
    80002b90:	00009497          	auipc	s1,0x9
    80002b94:	0604b483          	ld	s1,96(s1) # 8000bbf0 <_ZN3TCB7runningE>
	if (!old->finished && !old->blocked && old->timeToSleep == 0 && !old->needToJoin) {
    80002b98:	0304c783          	lbu	a5,48(s1)
    80002b9c:	00079e63          	bnez	a5,80002bb8 <_ZN3TCB8dispatchEv+0x3c>
    80002ba0:	0314c783          	lbu	a5,49(s1)
    80002ba4:	00079a63          	bnez	a5,80002bb8 <_ZN3TCB8dispatchEv+0x3c>
    80002ba8:	0404b783          	ld	a5,64(s1)
    80002bac:	00079663          	bnez	a5,80002bb8 <_ZN3TCB8dispatchEv+0x3c>
    80002bb0:	0324c783          	lbu	a5,50(s1)
    80002bb4:	04078663          	beqz	a5,80002c00 <_ZN3TCB8dispatchEv+0x84>
	TCB::running = Scheduler::get();
    80002bb8:	fffff097          	auipc	ra,0xfffff
    80002bbc:	e4c080e7          	jalr	-436(ra) # 80001a04 <_ZN9Scheduler3getEv>
    80002bc0:	00050593          	mv	a1,a0
    80002bc4:	00009797          	auipc	a5,0x9
    80002bc8:	02c78793          	addi	a5,a5,44 # 8000bbf0 <_ZN3TCB7runningE>
    80002bcc:	00a7b023          	sd	a0,0(a5)
	TCB::runningTimeSlice = 0;
    80002bd0:	0007b423          	sd	zero,8(a5)
	if (TCB::running->threadFunction == nullptr || TCB::running->threadFunction == kernelConsumerFunction ||
    80002bd4:	01053783          	ld	a5,16(a0)
    80002bd8:	02078c63          	beqz	a5,80002c10 <_ZN3TCB8dispatchEv+0x94>
    80002bdc:	00009717          	auipc	a4,0x9
    80002be0:	ecc73703          	ld	a4,-308(a4) # 8000baa8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002be4:	02e78663          	beq	a5,a4,80002c10 <_ZN3TCB8dispatchEv+0x94>
    80002be8:	00009717          	auipc	a4,0x9
    80002bec:	f0073703          	ld	a4,-256(a4) # 8000bae8 <_GLOBAL_OFFSET_TABLE_+0x70>
    80002bf0:	02e78063          	beq	a5,a4,80002c10 <_ZN3TCB8dispatchEv+0x94>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002bf4:	10000793          	li	a5,256
    80002bf8:	1007b073          	csrc	sstatus,a5
}
    80002bfc:	01c0006f          	j	80002c18 <_ZN3TCB8dispatchEv+0x9c>
		Scheduler::put(old);
    80002c00:	00048513          	mv	a0,s1
    80002c04:	fffff097          	auipc	ra,0xfffff
    80002c08:	dbc080e7          	jalr	-580(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
    80002c0c:	fadff06f          	j	80002bb8 <_ZN3TCB8dispatchEv+0x3c>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80002c10:	10000793          	li	a5,256
    80002c14:	1007a073          	csrs	sstatus,a5
	if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    80002c18:	00b48863          	beq	s1,a1,80002c28 <_ZN3TCB8dispatchEv+0xac>
    80002c1c:	00048513          	mv	a0,s1
    80002c20:	ffffe097          	auipc	ra,0xffffe
    80002c24:	5f0080e7          	jalr	1520(ra) # 80001210 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80002c28:	01813083          	ld	ra,24(sp)
    80002c2c:	01013403          	ld	s0,16(sp)
    80002c30:	00813483          	ld	s1,8(sp)
    80002c34:	02010113          	addi	sp,sp,32
    80002c38:	00008067          	ret

0000000080002c3c <_ZN3TCB5yieldEv>:
void TCB::yield() {
    80002c3c:	ff010113          	addi	sp,sp,-16
    80002c40:	00113423          	sd	ra,8(sp)
    80002c44:	00813023          	sd	s0,0(sp)
    80002c48:	01010413          	addi	s0,sp,16
	Riscv::pushRegisters();
    80002c4c:	ffffe097          	auipc	ra,0xffffe
    80002c50:	3b4080e7          	jalr	948(ra) # 80001000 <_ZN5Riscv13pushRegistersEv>
	TCB::dispatch();
    80002c54:	00000097          	auipc	ra,0x0
    80002c58:	f28080e7          	jalr	-216(ra) # 80002b7c <_ZN3TCB8dispatchEv>
	Riscv::popRegisters();
    80002c5c:	ffffe097          	auipc	ra,0xffffe
    80002c60:	420080e7          	jalr	1056(ra) # 8000107c <_ZN5Riscv12popRegistersEv>
}
    80002c64:	00813083          	ld	ra,8(sp)
    80002c68:	00013403          	ld	s0,0(sp)
    80002c6c:	01010113          	addi	sp,sp,16
    80002c70:	00008067          	ret

0000000080002c74 <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    80002c74:	ff010113          	addi	sp,sp,-16
    80002c78:	00113423          	sd	ra,8(sp)
    80002c7c:	00813023          	sd	s0,0(sp)
    80002c80:	01010413          	addi	s0,sp,16
	return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::THREAD);
    80002c84:	00200593          	li	a1,2
    80002c88:	02050513          	addi	a0,a0,32
    80002c8c:	00000097          	auipc	ra,0x0
    80002c90:	1ec080e7          	jalr	492(ra) # 80002e78 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
}
    80002c94:	00813083          	ld	ra,8(sp)
    80002c98:	00013403          	ld	s0,0(sp)
    80002c9c:	01010113          	addi	sp,sp,16
    80002ca0:	00008067          	ret

0000000080002ca4 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    80002ca4:	fd010113          	addi	sp,sp,-48
    80002ca8:	02113423          	sd	ra,40(sp)
    80002cac:	02813023          	sd	s0,32(sp)
    80002cb0:	00913c23          	sd	s1,24(sp)
    80002cb4:	01213823          	sd	s2,16(sp)
    80002cb8:	01313423          	sd	s3,8(sp)
    80002cbc:	03010413          	addi	s0,sp,48
    80002cc0:	00050913          	mv	s2,a0
    80002cc4:	00058993          	mv	s3,a1
    80002cc8:	00060493          	mv	s1,a2
	TCB* newThread = new TCB(function, args, stack);
    80002ccc:	06000513          	li	a0,96
    80002cd0:	00000097          	auipc	ra,0x0
    80002cd4:	fa4080e7          	jalr	-92(ra) # 80002c74 <_ZN3TCBnwEm>


	TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
													timeSlice(DEFAULT_TIME_SLICE), finished(false), blocked(false),
													needToJoin(false),
													nextInScheduler(nullptr), timeToSleep(0), nextSleeping(nullptr) {
    80002cd8:	01253823          	sd	s2,16(a0)
    80002cdc:	00953c23          	sd	s1,24(a0)
    80002ce0:	03353023          	sd	s3,32(a0)
    80002ce4:	00200793          	li	a5,2
    80002ce8:	02f53423          	sd	a5,40(a0)
    80002cec:	02050823          	sb	zero,48(a0)
    80002cf0:	020508a3          	sb	zero,49(a0)
    80002cf4:	02050923          	sb	zero,50(a0)
    80002cf8:	02053c23          	sd	zero,56(a0)
    80002cfc:	04053023          	sd	zero,64(a0)
    80002d00:	04053423          	sd	zero,72(a0)
	ThreadQueue() : front(nullptr), back(nullptr) {}
    80002d04:	04053823          	sd	zero,80(a0)
    80002d08:	04053c23          	sd	zero,88(a0)
		//formiranje pocetnog konteksta; specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80002d0c:	02090e63          	beqz	s2,80002d48 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xa4>
    80002d10:	00000797          	auipc	a5,0x0
    80002d14:	e2878793          	addi	a5,a5,-472 # 80002b38 <_ZN3TCB7wrapperEv>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80002d18:	02048c63          	beqz	s1,80002d50 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xac>
    80002d1c:	00008637          	lui	a2,0x8
    80002d20:	00c484b3          	add	s1,s1,a2
		this->context.ra = startRa;
    80002d24:	00f53023          	sd	a5,0(a0)
		this->context.sp = startSp;
    80002d28:	00953423          	sd	s1,8(a0)
}
    80002d2c:	02813083          	ld	ra,40(sp)
    80002d30:	02013403          	ld	s0,32(sp)
    80002d34:	01813483          	ld	s1,24(sp)
    80002d38:	01013903          	ld	s2,16(sp)
    80002d3c:	00813983          	ld	s3,8(sp)
    80002d40:	03010113          	addi	sp,sp,48
    80002d44:	00008067          	ret
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80002d48:	00000793          	li	a5,0
    80002d4c:	fcdff06f          	j	80002d18 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x74>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80002d50:	00000493          	li	s1,0
    80002d54:	fd1ff06f          	j	80002d24 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x80>

0000000080002d58 <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    80002d58:	ff010113          	addi	sp,sp,-16
    80002d5c:	00113423          	sd	ra,8(sp)
    80002d60:	00813023          	sd	s0,0(sp)
    80002d64:	01010413          	addi	s0,sp,16
	MemoryAllocator::kfree(ptr);
    80002d68:	00000097          	auipc	ra,0x0
    80002d6c:	2bc080e7          	jalr	700(ra) # 80003024 <_ZN15MemoryAllocator5kfreeEPv>
}
    80002d70:	00813083          	ld	ra,8(sp)
    80002d74:	00013403          	ld	s0,0(sp)
    80002d78:	01010113          	addi	sp,sp,16
    80002d7c:	00008067          	ret

0000000080002d80 <_ZN3TCB10threadJoinEPS_>:

void TCB::threadJoin(TCB* handle) {
	if (handle->finished) return;
    80002d80:	03054783          	lbu	a5,48(a0)
    80002d84:	00078463          	beqz	a5,80002d8c <_ZN3TCB10threadJoinEPS_+0xc>
    80002d88:	00008067          	ret
void TCB::threadJoin(TCB* handle) {
    80002d8c:	ff010113          	addi	sp,sp,-16
    80002d90:	00113423          	sd	ra,8(sp)
    80002d94:	00813023          	sd	s0,0(sp)
    80002d98:	01010413          	addi	s0,sp,16
	TCB::running->needToJoin = true;
    80002d9c:	00009597          	auipc	a1,0x9
    80002da0:	e545b583          	ld	a1,-428(a1) # 8000bbf0 <_ZN3TCB7runningE>
    80002da4:	00100793          	li	a5,1
    80002da8:	02f58923          	sb	a5,50(a1)
	handle->waitingToJoin.putLast(TCB::running);
    80002dac:	05050513          	addi	a0,a0,80
    80002db0:	ffffe097          	auipc	ra,0xffffe
    80002db4:	494080e7          	jalr	1172(ra) # 80001244 <_ZN11ThreadQueue7putLastEP3TCB>
}
    80002db8:	00813083          	ld	ra,8(sp)
    80002dbc:	00013403          	ld	s0,0(sp)
    80002dc0:	01010113          	addi	sp,sp,16
    80002dc4:	00008067          	ret

0000000080002dc8 <_ZN3TCB13releaseJoinedEv>:

void TCB::releaseJoined() {
	while (!TCB::running->waitingToJoin.isEmpty()) {
    80002dc8:	00009517          	auipc	a0,0x9
    80002dcc:	e2853503          	ld	a0,-472(a0) # 8000bbf0 <_ZN3TCB7runningE>
		return front == nullptr;
    80002dd0:	05053783          	ld	a5,80(a0)
    80002dd4:	04078663          	beqz	a5,80002e20 <_ZN3TCB13releaseJoinedEv+0x58>
void TCB::releaseJoined() {
    80002dd8:	ff010113          	addi	sp,sp,-16
    80002ddc:	00113423          	sd	ra,8(sp)
    80002de0:	00813023          	sd	s0,0(sp)
    80002de4:	01010413          	addi	s0,sp,16
		TCB* tcb = TCB::running->waitingToJoin.getFirst();
    80002de8:	05050513          	addi	a0,a0,80
    80002dec:	ffffe097          	auipc	ra,0xffffe
    80002df0:	4c4080e7          	jalr	1220(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
		tcb->needToJoin = false;
    80002df4:	02050923          	sb	zero,50(a0)
		Scheduler::put(tcb);
    80002df8:	fffff097          	auipc	ra,0xfffff
    80002dfc:	bc8080e7          	jalr	-1080(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
	while (!TCB::running->waitingToJoin.isEmpty()) {
    80002e00:	00009517          	auipc	a0,0x9
    80002e04:	df053503          	ld	a0,-528(a0) # 8000bbf0 <_ZN3TCB7runningE>
    80002e08:	05053783          	ld	a5,80(a0)
    80002e0c:	fc079ee3          	bnez	a5,80002de8 <_ZN3TCB13releaseJoinedEv+0x20>
	}
}
    80002e10:	00813083          	ld	ra,8(sp)
    80002e14:	00013403          	ld	s0,0(sp)
    80002e18:	01010113          	addi	sp,sp,16
    80002e1c:	00008067          	ret
    80002e20:	00008067          	ret

0000000080002e24 <_ZN3TCB5startEPS_>:

void TCB::start(TCB* newTcb) {
	//startovanje niti(stavljanje u Scheduler); main nit je vec aktivna, ne stavlja se u Scheduler
	if (newTcb->threadFunction != nullptr) Scheduler::put(newTcb);
    80002e24:	01053783          	ld	a5,16(a0)
    80002e28:	02078663          	beqz	a5,80002e54 <_ZN3TCB5startEPS_+0x30>
void TCB::start(TCB* newTcb) {
    80002e2c:	ff010113          	addi	sp,sp,-16
    80002e30:	00113423          	sd	ra,8(sp)
    80002e34:	00813023          	sd	s0,0(sp)
    80002e38:	01010413          	addi	s0,sp,16
	if (newTcb->threadFunction != nullptr) Scheduler::put(newTcb);
    80002e3c:	fffff097          	auipc	ra,0xfffff
    80002e40:	b84080e7          	jalr	-1148(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
}
    80002e44:	00813083          	ld	ra,8(sp)
    80002e48:	00013403          	ld	s0,0(sp)
    80002e4c:	01010113          	addi	sp,sp,16
    80002e50:	00008067          	ret
    80002e54:	00008067          	ret

0000000080002e58 <_ZN5Riscv10popSppSpieEv>:
// Created by os on 5/17/23.
//

#include "../h/Riscv.hpp"

void Riscv::popSppSpie() {
    80002e58:	ff010113          	addi	sp,sp,-16
    80002e5c:	00813423          	sd	s0,8(sp)
    80002e60:	01010413          	addi	s0,sp,16
	//ra pokazuje iza ove funkcije na nastavak wrappera
	__asm__ volatile("csrw sepc, ra");
    80002e64:	14109073          	csrw	sepc,ra
	__asm__ volatile("sret");
    80002e68:	10200073          	sret
    80002e6c:	00813403          	ld	s0,8(sp)
    80002e70:	01010113          	addi	sp,sp,16
    80002e74:	00008067          	ret

0000000080002e78 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>:

bool MemoryAllocator::initialized = false;
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

void* MemoryAllocator::kmalloc(size_t size, Purpose pur) {
    80002e78:	ff010113          	addi	sp,sp,-16
    80002e7c:	00813423          	sd	s0,8(sp)
    80002e80:	01010413          	addi	s0,sp,16
	//size je u broju bajtova, ukljucuje i mesto potrebno za zaglavlje UsedMemSegment
	if (size <= 0) return nullptr;
    80002e84:	12050863          	beqz	a0,80002fb4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x13c>


	//alokacija uvek zaokruzena na blokove
	//size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
	size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80002e88:	00655793          	srli	a5,a0,0x6
    80002e8c:	03f57513          	andi	a0,a0,63
    80002e90:	00050463          	beqz	a0,80002e98 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x20>
    80002e94:	00100513          	li	a0,1
    80002e98:	00a78533          	add	a0,a5,a0
	size = blocks * MEM_BLOCK_SIZE;
    80002e9c:	00651793          	slli	a5,a0,0x6

	//trazenje slobodnog segmenta po first-fit algoritmu
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80002ea0:	00009517          	auipc	a0,0x9
    80002ea4:	d6053503          	ld	a0,-672(a0) # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80002ea8:	0e050863          	beqz	a0,80002f98 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x120>
		if (current->size < size) continue;
    80002eac:	01053703          	ld	a4,16(a0)
    80002eb0:	06f76a63          	bltu	a4,a5,80002f24 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xac>

		//pravljenje novog slobodnog fragmenta od ostatka fragmenta
		FreeMemSegment* remainderFree = (FreeMemSegment*)((char*)current + size);
    80002eb4:	00f506b3          	add	a3,a0,a5
		size_t remainingSize = current->size - size;
    80002eb8:	40f70633          	sub	a2,a4,a5
		if (remainingSize <= sizeof(UsedMemSegment)) {
    80002ebc:	02000813          	li	a6,32
    80002ec0:	06c86e63          	bltu	a6,a2,80002f3c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xc4>
			//ne preostaje dovoljno veliki slobodni segment;dodeljujemo ceo trenutno alociranom
			size += remainingSize;
			if (current->prev) current->prev->next = current->next;
    80002ec4:	00853783          	ld	a5,8(a0)
    80002ec8:	00078663          	beqz	a5,80002ed4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x5c>
    80002ecc:	00053683          	ld	a3,0(a0)
    80002ed0:	00d7b023          	sd	a3,0(a5)
			if (current->next) current->next->prev = current->prev;
    80002ed4:	00053783          	ld	a5,0(a0)
    80002ed8:	00078663          	beqz	a5,80002ee4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x6c>
    80002edc:	00853683          	ld	a3,8(a0)
    80002ee0:	00d7b423          	sd	a3,8(a5)
			if (freeMemHead == current) freeMemHead = current->next;
    80002ee4:	00009797          	auipc	a5,0x9
    80002ee8:	d1c7b783          	ld	a5,-740(a5) # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80002eec:	04a78063          	beq	a5,a0,80002f2c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xb4>
			if (current->next) current->next->prev = remainderFree;
			if (freeMemHead == current) freeMemHead = remainderFree;
		}
		//ubacivanje novog fragmenta u listu zauzetih fragmenata
		UsedMemSegment* newFragment = (UsedMemSegment*)current;
		newFragment->size = size;
    80002ef0:	00e53423          	sd	a4,8(a0)
		newFragment->purpose = pur;
    80002ef4:	00b52823          	sw	a1,16(a0)
		newFragment->usableFirstAddress = (char*)newFragment + sizeof(UsedMemSegment);
    80002ef8:	02050793          	addi	a5,a0,32
    80002efc:	00f53c23          	sd	a5,24(a0)
		UsedMemSegment* prevUsed = nullptr;
		for (UsedMemSegment* cur = usedMemHead;
    80002f00:	00009697          	auipc	a3,0x9
    80002f04:	d086b683          	ld	a3,-760(a3) # 8000bc08 <_ZN15MemoryAllocator11usedMemHeadE>
    80002f08:	00068793          	mv	a5,a3
		UsedMemSegment* prevUsed = nullptr;
    80002f0c:	00000713          	li	a4,0
			 cur && ((char*)cur < (char*)newFragment); cur = cur->next) {
    80002f10:	06078a63          	beqz	a5,80002f84 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x10c>
    80002f14:	06a7f863          	bgeu	a5,a0,80002f84 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x10c>
			prevUsed = cur;
    80002f18:	00078713          	mv	a4,a5
			 cur && ((char*)cur < (char*)newFragment); cur = cur->next) {
    80002f1c:	0007b783          	ld	a5,0(a5)
		for (UsedMemSegment* cur = usedMemHead;
    80002f20:	ff1ff06f          	j	80002f10 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x98>
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80002f24:	00053503          	ld	a0,0(a0)
    80002f28:	f81ff06f          	j	80002ea8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x30>
			if (freeMemHead == current) freeMemHead = current->next;
    80002f2c:	00053783          	ld	a5,0(a0)
    80002f30:	00009697          	auipc	a3,0x9
    80002f34:	ccf6b823          	sd	a5,-816(a3) # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80002f38:	fb9ff06f          	j	80002ef0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x78>
			remainderFree->size = remainingSize;
    80002f3c:	00c6b823          	sd	a2,16(a3)
			remainderFree->prev = current->prev;
    80002f40:	00853703          	ld	a4,8(a0)
    80002f44:	00e6b423          	sd	a4,8(a3)
			if (current->prev) current->prev->next = remainderFree;
    80002f48:	00070463          	beqz	a4,80002f50 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xd8>
    80002f4c:	00d73023          	sd	a3,0(a4)
			remainderFree->next = current->next;
    80002f50:	00053703          	ld	a4,0(a0)
    80002f54:	00e6b023          	sd	a4,0(a3)
			if (current->next) current->next->prev = remainderFree;
    80002f58:	00070463          	beqz	a4,80002f60 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xe8>
    80002f5c:	00d73423          	sd	a3,8(a4)
			if (freeMemHead == current) freeMemHead = remainderFree;
    80002f60:	00009717          	auipc	a4,0x9
    80002f64:	ca073703          	ld	a4,-864(a4) # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80002f68:	00a70663          	beq	a4,a0,80002f74 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xfc>
	size = blocks * MEM_BLOCK_SIZE;
    80002f6c:	00078713          	mv	a4,a5
    80002f70:	f81ff06f          	j	80002ef0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x78>
			if (freeMemHead == current) freeMemHead = remainderFree;
    80002f74:	00009717          	auipc	a4,0x9
    80002f78:	c8d73623          	sd	a3,-884(a4) # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
	size = blocks * MEM_BLOCK_SIZE;
    80002f7c:	00078713          	mv	a4,a5
    80002f80:	f71ff06f          	j	80002ef0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x78>
		}
		if (!prevUsed) {
    80002f84:	02070063          	beqz	a4,80002fa4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x12c>
			newFragment->next = usedMemHead;
			usedMemHead = newFragment;
		} else {
			newFragment->next = prevUsed->next;
    80002f88:	00073783          	ld	a5,0(a4)
    80002f8c:	00f53023          	sd	a5,0(a0)
			prevUsed->next = newFragment;
    80002f90:	00a73023          	sd	a0,0(a4)
		}
		//return (char*)newFragment + sizeof(UsedMemSegment);
		return newFragment->usableFirstAddress;
    80002f94:	01853503          	ld	a0,24(a0)
	}
	return nullptr;
}
    80002f98:	00813403          	ld	s0,8(sp)
    80002f9c:	01010113          	addi	sp,sp,16
    80002fa0:	00008067          	ret
			newFragment->next = usedMemHead;
    80002fa4:	00d53023          	sd	a3,0(a0)
			usedMemHead = newFragment;
    80002fa8:	00009797          	auipc	a5,0x9
    80002fac:	c6a7b023          	sd	a0,-928(a5) # 8000bc08 <_ZN15MemoryAllocator11usedMemHeadE>
    80002fb0:	fe5ff06f          	j	80002f94 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x11c>
	if (size <= 0) return nullptr;
    80002fb4:	00000513          	li	a0,0
    80002fb8:	fe1ff06f          	j	80002f98 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x120>

0000000080002fbc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:
	tryToJoin(newFree);
	tryToJoin(prevFree);
	return 0;
}

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    80002fbc:	ff010113          	addi	sp,sp,-16
    80002fc0:	00813423          	sd	s0,8(sp)
    80002fc4:	01010413          	addi	s0,sp,16
	if (!current) return 0;
    80002fc8:	04050663          	beqz	a0,80003014 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x58>
	bool nextExists = current->next != nullptr;
    80002fcc:	00053783          	ld	a5,0(a0)
	char* nextAddr = (char*)current + current->size;
    80002fd0:	01053703          	ld	a4,16(a0)
    80002fd4:	00e506b3          	add	a3,a0,a4
	char* cnext = (char*)current->next;
	bool nextIsConnected = (nextAddr == cnext);
	if (nextExists && nextIsConnected) {
    80002fd8:	04078263          	beqz	a5,8000301c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x60>
    80002fdc:	00d78a63          	beq	a5,a3,80002ff0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x34>
		current->size += current->next->size;
		current->next = current->next->next;
		if (current->next) current->next->prev = current;
		return 1;
	} else return 0;
    80002fe0:	00000513          	li	a0,0
}
    80002fe4:	00813403          	ld	s0,8(sp)
    80002fe8:	01010113          	addi	sp,sp,16
    80002fec:	00008067          	ret
		current->size += current->next->size;
    80002ff0:	0107b683          	ld	a3,16(a5)
    80002ff4:	00d70733          	add	a4,a4,a3
    80002ff8:	00e53823          	sd	a4,16(a0)
		current->next = current->next->next;
    80002ffc:	0007b783          	ld	a5,0(a5)
    80003000:	00f53023          	sd	a5,0(a0)
		if (current->next) current->next->prev = current;
    80003004:	00078463          	beqz	a5,8000300c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x50>
    80003008:	00a7b423          	sd	a0,8(a5)
		return 1;
    8000300c:	00100513          	li	a0,1
    80003010:	fd5ff06f          	j	80002fe4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	if (!current) return 0;
    80003014:	00000513          	li	a0,0
    80003018:	fcdff06f          	j	80002fe4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	} else return 0;
    8000301c:	00000513          	li	a0,0
    80003020:	fc5ff06f          	j	80002fe4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>

0000000080003024 <_ZN15MemoryAllocator5kfreeEPv>:
	if (!ptr) return 0;
    80003024:	10050463          	beqz	a0,8000312c <_ZN15MemoryAllocator5kfreeEPv+0x108>
    80003028:	00050693          	mv	a3,a0
	if (!usedMemHead) return -1;
    8000302c:	00009797          	auipc	a5,0x9
    80003030:	bdc7b783          	ld	a5,-1060(a5) # 8000bc08 <_ZN15MemoryAllocator11usedMemHeadE>
    80003034:	10078063          	beqz	a5,80003134 <_ZN15MemoryAllocator5kfreeEPv+0x110>
	ptr = (char*)ptr - sizeof(UsedMemSegment);
    80003038:	fe050513          	addi	a0,a0,-32
	UsedMemSegment* prevUsed = nullptr;
    8000303c:	00000713          	li	a4,0
	for (; currentUsed && ((char*)currentUsed != (char*)ptr); currentUsed = currentUsed->next) {
    80003040:	00078a63          	beqz	a5,80003054 <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80003044:	00a78863          	beq	a5,a0,80003054 <_ZN15MemoryAllocator5kfreeEPv+0x30>
		prevUsed = currentUsed;
    80003048:	00078713          	mv	a4,a5
	for (; currentUsed && ((char*)currentUsed != (char*)ptr); currentUsed = currentUsed->next) {
    8000304c:	0007b783          	ld	a5,0(a5)
    80003050:	ff1ff06f          	j	80003040 <_ZN15MemoryAllocator5kfreeEPv+0x1c>
	if ((char*)currentUsed != (char*)ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80003054:	0ea79463          	bne	a5,a0,8000313c <_ZN15MemoryAllocator5kfreeEPv+0x118>
int MemoryAllocator::kfree(void* ptr) {
    80003058:	fe010113          	addi	sp,sp,-32
    8000305c:	00113c23          	sd	ra,24(sp)
    80003060:	00813823          	sd	s0,16(sp)
    80003064:	00913423          	sd	s1,8(sp)
    80003068:	02010413          	addi	s0,sp,32
	if (prevUsed) prevUsed->next = currentUsed->next;
    8000306c:	02070863          	beqz	a4,8000309c <_ZN15MemoryAllocator5kfreeEPv+0x78>
    80003070:	0007b783          	ld	a5,0(a5)
    80003074:	00f73023          	sd	a5,0(a4)
	if (!freeMemHead || ((char*)ptr < (char*)freeMemHead)) {
    80003078:	00009797          	auipc	a5,0x9
    8000307c:	b887b783          	ld	a5,-1144(a5) # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80003080:	02078663          	beqz	a5,800030ac <_ZN15MemoryAllocator5kfreeEPv+0x88>
    80003084:	02f56863          	bltu	a0,a5,800030b4 <_ZN15MemoryAllocator5kfreeEPv+0x90>
			 prevFree->next && (char*)ptr > (char*)(prevFree->next); prevFree = prevFree->next);
    80003088:	00078493          	mv	s1,a5
    8000308c:	0007b783          	ld	a5,0(a5)
    80003090:	02078463          	beqz	a5,800030b8 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80003094:	fea7eae3          	bltu	a5,a0,80003088 <_ZN15MemoryAllocator5kfreeEPv+0x64>
    80003098:	0200006f          	j	800030b8 <_ZN15MemoryAllocator5kfreeEPv+0x94>
	else usedMemHead = currentUsed->next;
    8000309c:	0007b783          	ld	a5,0(a5)
    800030a0:	00009717          	auipc	a4,0x9
    800030a4:	b6f73423          	sd	a5,-1176(a4) # 8000bc08 <_ZN15MemoryAllocator11usedMemHeadE>
    800030a8:	fd1ff06f          	j	80003078 <_ZN15MemoryAllocator5kfreeEPv+0x54>
		prevFree = nullptr;
    800030ac:	00078493          	mv	s1,a5
    800030b0:	0080006f          	j	800030b8 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    800030b4:	00000493          	li	s1,0
	size_t segmentSize = ((UsedMemSegment*)ptr)->size;
    800030b8:	fe86b783          	ld	a5,-24(a3)
	newFree->size = segmentSize;
    800030bc:	fef6b823          	sd	a5,-16(a3)
	newFree->prev = prevFree;
    800030c0:	fe96b423          	sd	s1,-24(a3)
	if (prevFree) newFree->next = prevFree->next;
    800030c4:	04048663          	beqz	s1,80003110 <_ZN15MemoryAllocator5kfreeEPv+0xec>
    800030c8:	0004b783          	ld	a5,0(s1)
    800030cc:	fef6b023          	sd	a5,-32(a3)
	if (newFree->next) newFree->next->prev = newFree;
    800030d0:	fe06b783          	ld	a5,-32(a3)
    800030d4:	00078463          	beqz	a5,800030dc <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    800030d8:	00a7b423          	sd	a0,8(a5)
	if (prevFree) prevFree->next = newFree;
    800030dc:	04048263          	beqz	s1,80003120 <_ZN15MemoryAllocator5kfreeEPv+0xfc>
    800030e0:	00a4b023          	sd	a0,0(s1)
	tryToJoin(newFree);
    800030e4:	00000097          	auipc	ra,0x0
    800030e8:	ed8080e7          	jalr	-296(ra) # 80002fbc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	tryToJoin(prevFree);
    800030ec:	00048513          	mv	a0,s1
    800030f0:	00000097          	auipc	ra,0x0
    800030f4:	ecc080e7          	jalr	-308(ra) # 80002fbc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	return 0;
    800030f8:	00000513          	li	a0,0
}
    800030fc:	01813083          	ld	ra,24(sp)
    80003100:	01013403          	ld	s0,16(sp)
    80003104:	00813483          	ld	s1,8(sp)
    80003108:	02010113          	addi	sp,sp,32
    8000310c:	00008067          	ret
	else newFree->next = freeMemHead;
    80003110:	00009797          	auipc	a5,0x9
    80003114:	af07b783          	ld	a5,-1296(a5) # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80003118:	fef6b023          	sd	a5,-32(a3)
    8000311c:	fb5ff06f          	j	800030d0 <_ZN15MemoryAllocator5kfreeEPv+0xac>
	else freeMemHead = newFree;
    80003120:	00009797          	auipc	a5,0x9
    80003124:	aea7b023          	sd	a0,-1312(a5) # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80003128:	fbdff06f          	j	800030e4 <_ZN15MemoryAllocator5kfreeEPv+0xc0>
	if (!ptr) return 0;
    8000312c:	00000513          	li	a0,0
    80003130:	00008067          	ret
	if (!usedMemHead) return -1;
    80003134:	fff00513          	li	a0,-1
    80003138:	00008067          	ret
	if ((char*)currentUsed != (char*)ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    8000313c:	fff00513          	li	a0,-1
}
    80003140:	00008067          	ret

0000000080003144 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>:

bool MemoryAllocator::checkPurpose(void* ptr, MemoryAllocator::Purpose p) {
    80003144:	ff010113          	addi	sp,sp,-16
    80003148:	00813423          	sd	s0,8(sp)
    8000314c:	01010413          	addi	s0,sp,16
	ptr = (char*)ptr - sizeof(UsedMemSegment);
	return ((UsedMemSegment*)ptr)->purpose == p;
    80003150:	ff052503          	lw	a0,-16(a0)
    80003154:	40b50533          	sub	a0,a0,a1
}
    80003158:	00153513          	seqz	a0,a0
    8000315c:	00813403          	ld	s0,8(sp)
    80003160:	01010113          	addi	sp,sp,16
    80003164:	00008067          	ret

0000000080003168 <_ZN15MemoryAllocator19initMemoryAllocatorEv>:

void MemoryAllocator::initMemoryAllocator() {
    80003168:	ff010113          	addi	sp,sp,-16
    8000316c:	00813423          	sd	s0,8(sp)
    80003170:	01010413          	addi	s0,sp,16
//pocetna inicijalizacija
	if (!initialized) {
    80003174:	00009797          	auipc	a5,0x9
    80003178:	a9c7c783          	lbu	a5,-1380(a5) # 8000bc10 <_ZN15MemoryAllocator11initializedE>
    8000317c:	04079663          	bnez	a5,800031c8 <_ZN15MemoryAllocator19initMemoryAllocatorEv+0x60>
		freeMemHead = (FreeMemSegment*)HEAP_START_ADDR;
    80003180:	00009617          	auipc	a2,0x9
    80003184:	92063603          	ld	a2,-1760(a2) # 8000baa0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003188:	00063703          	ld	a4,0(a2)
    8000318c:	00009797          	auipc	a5,0x9
    80003190:	a7478793          	addi	a5,a5,-1420 # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80003194:	00e7b023          	sd	a4,0(a5)
		freeMemHead->next = nullptr;
    80003198:	00073023          	sd	zero,0(a4)
		freeMemHead->prev = nullptr;
    8000319c:	0007b683          	ld	a3,0(a5)
    800031a0:	0006b423          	sd	zero,8(a3)
		freeMemHead->size = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR;//- sizeof(FreeMemSegment);
    800031a4:	00009717          	auipc	a4,0x9
    800031a8:	93473703          	ld	a4,-1740(a4) # 8000bad8 <_GLOBAL_OFFSET_TABLE_+0x60>
    800031ac:	00073703          	ld	a4,0(a4)
    800031b0:	00063603          	ld	a2,0(a2)
    800031b4:	40c70733          	sub	a4,a4,a2
    800031b8:	00e6b823          	sd	a4,16(a3)
		usedMemHead = nullptr;
    800031bc:	0007b423          	sd	zero,8(a5)

		initialized = true;
    800031c0:	00100713          	li	a4,1
    800031c4:	00e78823          	sb	a4,16(a5)
	}
}
    800031c8:	00813403          	ld	s0,8(sp)
    800031cc:	01010113          	addi	sp,sp,16
    800031d0:	00008067          	ret

00000000800031d4 <_ZN4KSemnwEm>:

#include "../h/KSem.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void* KSem::operator new(size_t size) {
    800031d4:	ff010113          	addi	sp,sp,-16
    800031d8:	00113423          	sd	ra,8(sp)
    800031dc:	00813023          	sd	s0,0(sp)
    800031e0:	01010413          	addi	s0,sp,16
	return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::SEMAPHORE);
    800031e4:	00100593          	li	a1,1
    800031e8:	02050513          	addi	a0,a0,32
    800031ec:	00000097          	auipc	ra,0x0
    800031f0:	c8c080e7          	jalr	-884(ra) # 80002e78 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
}
    800031f4:	00813083          	ld	ra,8(sp)
    800031f8:	00013403          	ld	s0,0(sp)
    800031fc:	01010113          	addi	sp,sp,16
    80003200:	00008067          	ret

0000000080003204 <_ZN4KSemdlEPv>:

void KSem::operator delete(void* ptr) {
    80003204:	ff010113          	addi	sp,sp,-16
    80003208:	00113423          	sd	ra,8(sp)
    8000320c:	00813023          	sd	s0,0(sp)
    80003210:	01010413          	addi	s0,sp,16
	MemoryAllocator::kfree(ptr);
    80003214:	00000097          	auipc	ra,0x0
    80003218:	e10080e7          	jalr	-496(ra) # 80003024 <_ZN15MemoryAllocator5kfreeEPv>
}
    8000321c:	00813083          	ld	ra,8(sp)
    80003220:	00013403          	ld	s0,0(sp)
    80003224:	01010113          	addi	sp,sp,16
    80003228:	00008067          	ret

000000008000322c <_ZN4KSem7initSemEj>:

KSem* KSem::initSem(uint val) {
    8000322c:	fe010113          	addi	sp,sp,-32
    80003230:	00113c23          	sd	ra,24(sp)
    80003234:	00813823          	sd	s0,16(sp)
    80003238:	00913423          	sd	s1,8(sp)
    8000323c:	02010413          	addi	s0,sp,32
    80003240:	00050493          	mv	s1,a0
	return new KSem(val);
    80003244:	02000513          	li	a0,32
    80003248:	00000097          	auipc	ra,0x0
    8000324c:	f8c080e7          	jalr	-116(ra) # 800031d4 <_ZN4KSemnwEm>
	void block();

	void unblock();

private:
	KSem(uint val) : val(val), working(true) {}
    80003250:	00952023          	sw	s1,0(a0)
	ThreadQueue() : front(nullptr), back(nullptr) {}
    80003254:	00053423          	sd	zero,8(a0)
    80003258:	00053823          	sd	zero,16(a0)
    8000325c:	00100713          	li	a4,1
    80003260:	00e50c23          	sb	a4,24(a0)
}
    80003264:	01813083          	ld	ra,24(sp)
    80003268:	01013403          	ld	s0,16(sp)
    8000326c:	00813483          	ld	s1,8(sp)
    80003270:	02010113          	addi	sp,sp,32
    80003274:	00008067          	ret

0000000080003278 <_ZN4KSem5blockEv>:
	if (!working) return -3;
	if (val++ < 0) unblock();
	return 0;
}

void KSem::block() {
    80003278:	ff010113          	addi	sp,sp,-16
    8000327c:	00113423          	sd	ra,8(sp)
    80003280:	00813023          	sd	s0,0(sp)
    80003284:	01010413          	addi	s0,sp,16
	TCB::running->setBlocked(true);
    80003288:	00009797          	auipc	a5,0x9
    8000328c:	8487b783          	ld	a5,-1976(a5) # 8000bad0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80003290:	0007b583          	ld	a1,0(a5)
	void setBlocked(bool block) { this->blocked = block; }
    80003294:	00100793          	li	a5,1
    80003298:	02f588a3          	sb	a5,49(a1)
	blocked.putLast(TCB::running);
    8000329c:	00850513          	addi	a0,a0,8
    800032a0:	ffffe097          	auipc	ra,0xffffe
    800032a4:	fa4080e7          	jalr	-92(ra) # 80001244 <_ZN11ThreadQueue7putLastEP3TCB>
	TCB::yield();
    800032a8:	00000097          	auipc	ra,0x0
    800032ac:	994080e7          	jalr	-1644(ra) # 80002c3c <_ZN3TCB5yieldEv>
}
    800032b0:	00813083          	ld	ra,8(sp)
    800032b4:	00013403          	ld	s0,0(sp)
    800032b8:	01010113          	addi	sp,sp,16
    800032bc:	00008067          	ret

00000000800032c0 <_ZN4KSem4waitEv>:
int KSem::wait() {
    800032c0:	fe010113          	addi	sp,sp,-32
    800032c4:	00113c23          	sd	ra,24(sp)
    800032c8:	00813823          	sd	s0,16(sp)
    800032cc:	00913423          	sd	s1,8(sp)
    800032d0:	02010413          	addi	s0,sp,32
    800032d4:	00050493          	mv	s1,a0
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    800032d8:	00100593          	li	a1,1
    800032dc:	00000097          	auipc	ra,0x0
    800032e0:	e68080e7          	jalr	-408(ra) # 80003144 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>
    800032e4:	04050663          	beqz	a0,80003330 <_ZN4KSem4waitEv+0x70>
	if (!working) return -3;
    800032e8:	0184c783          	lbu	a5,24(s1)
    800032ec:	04078663          	beqz	a5,80003338 <_ZN4KSem4waitEv+0x78>
	if (--val < 0) {
    800032f0:	0004a783          	lw	a5,0(s1)
    800032f4:	fff7879b          	addiw	a5,a5,-1
    800032f8:	00f4a023          	sw	a5,0(s1)
    800032fc:	02079713          	slli	a4,a5,0x20
    80003300:	00074e63          	bltz	a4,8000331c <_ZN4KSem4waitEv+0x5c>
	return 0;
    80003304:	00000513          	li	a0,0
}
    80003308:	01813083          	ld	ra,24(sp)
    8000330c:	01013403          	ld	s0,16(sp)
    80003310:	00813483          	ld	s1,8(sp)
    80003314:	02010113          	addi	sp,sp,32
    80003318:	00008067          	ret
		block();
    8000331c:	00048513          	mv	a0,s1
    80003320:	00000097          	auipc	ra,0x0
    80003324:	f58080e7          	jalr	-168(ra) # 80003278 <_ZN4KSem5blockEv>
		return -1;
    80003328:	fff00513          	li	a0,-1
    8000332c:	fddff06f          	j	80003308 <_ZN4KSem4waitEv+0x48>
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    80003330:	ffe00513          	li	a0,-2
    80003334:	fd5ff06f          	j	80003308 <_ZN4KSem4waitEv+0x48>
	if (!working) return -3;
    80003338:	ffd00513          	li	a0,-3
    8000333c:	fcdff06f          	j	80003308 <_ZN4KSem4waitEv+0x48>

0000000080003340 <_ZN4KSem7unblockEv>:

void KSem::unblock() {
    80003340:	ff010113          	addi	sp,sp,-16
    80003344:	00113423          	sd	ra,8(sp)
    80003348:	00813023          	sd	s0,0(sp)
    8000334c:	01010413          	addi	s0,sp,16
	TCB* tcb = blocked.getFirst();
    80003350:	00850513          	addi	a0,a0,8
    80003354:	ffffe097          	auipc	ra,0xffffe
    80003358:	f5c080e7          	jalr	-164(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
    8000335c:	020508a3          	sb	zero,49(a0)
	tcb->setBlocked(false);
	Scheduler::put(tcb);
    80003360:	ffffe097          	auipc	ra,0xffffe
    80003364:	660080e7          	jalr	1632(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
}
    80003368:	00813083          	ld	ra,8(sp)
    8000336c:	00013403          	ld	s0,0(sp)
    80003370:	01010113          	addi	sp,sp,16
    80003374:	00008067          	ret

0000000080003378 <_ZN4KSem6signalEv>:
int KSem::signal() {
    80003378:	fe010113          	addi	sp,sp,-32
    8000337c:	00113c23          	sd	ra,24(sp)
    80003380:	00813823          	sd	s0,16(sp)
    80003384:	00913423          	sd	s1,8(sp)
    80003388:	02010413          	addi	s0,sp,32
    8000338c:	00050493          	mv	s1,a0
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    80003390:	00100593          	li	a1,1
    80003394:	00000097          	auipc	ra,0x0
    80003398:	db0080e7          	jalr	-592(ra) # 80003144 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>
    8000339c:	04050463          	beqz	a0,800033e4 <_ZN4KSem6signalEv+0x6c>
	if (!working) return -3;
    800033a0:	0184c783          	lbu	a5,24(s1)
    800033a4:	04078463          	beqz	a5,800033ec <_ZN4KSem6signalEv+0x74>
	if (val++ < 0) unblock();
    800033a8:	0004a783          	lw	a5,0(s1)
    800033ac:	0017871b          	addiw	a4,a5,1
    800033b0:	00e4a023          	sw	a4,0(s1)
    800033b4:	0007ce63          	bltz	a5,800033d0 <_ZN4KSem6signalEv+0x58>
	return 0;
    800033b8:	00000513          	li	a0,0
}
    800033bc:	01813083          	ld	ra,24(sp)
    800033c0:	01013403          	ld	s0,16(sp)
    800033c4:	00813483          	ld	s1,8(sp)
    800033c8:	02010113          	addi	sp,sp,32
    800033cc:	00008067          	ret
	if (val++ < 0) unblock();
    800033d0:	00048513          	mv	a0,s1
    800033d4:	00000097          	auipc	ra,0x0
    800033d8:	f6c080e7          	jalr	-148(ra) # 80003340 <_ZN4KSem7unblockEv>
	return 0;
    800033dc:	00000513          	li	a0,0
    800033e0:	fddff06f          	j	800033bc <_ZN4KSem6signalEv+0x44>
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    800033e4:	ffe00513          	li	a0,-2
    800033e8:	fd5ff06f          	j	800033bc <_ZN4KSem6signalEv+0x44>
	if (!working) return -3;
    800033ec:	ffd00513          	li	a0,-3
    800033f0:	fcdff06f          	j	800033bc <_ZN4KSem6signalEv+0x44>

00000000800033f4 <_ZN4KSem8closeSemEPS_>:

int KSem::closeSem(sem_t handle) {
    800033f4:	fe010113          	addi	sp,sp,-32
    800033f8:	00113c23          	sd	ra,24(sp)
    800033fc:	00813823          	sd	s0,16(sp)
    80003400:	00913423          	sd	s1,8(sp)
    80003404:	02010413          	addi	s0,sp,32
    80003408:	00050493          	mv	s1,a0
	if (!MemoryAllocator::checkPurpose(handle, MemoryAllocator::SEMAPHORE)) return -2;
    8000340c:	00100593          	li	a1,1
    80003410:	00000097          	auipc	ra,0x0
    80003414:	d34080e7          	jalr	-716(ra) # 80003144 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>
    80003418:	04050263          	beqz	a0,8000345c <_ZN4KSem8closeSemEPS_+0x68>
	handle->working = false;
    8000341c:	00048c23          	sb	zero,24(s1)
    80003420:	01c0006f          	j	8000343c <_ZN4KSem8closeSemEPS_+0x48>
	while (!handle->blocked.isEmpty()) {
		TCB* tcb = handle->blocked.getFirst();
    80003424:	00848513          	addi	a0,s1,8
    80003428:	ffffe097          	auipc	ra,0xffffe
    8000342c:	e88080e7          	jalr	-376(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
    80003430:	020508a3          	sb	zero,49(a0)
		tcb->setBlocked(false);
		Scheduler::put(tcb);
    80003434:	ffffe097          	auipc	ra,0xffffe
    80003438:	58c080e7          	jalr	1420(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
		return front == nullptr;
    8000343c:	0084b783          	ld	a5,8(s1)
	while (!handle->blocked.isEmpty()) {
    80003440:	fe0792e3          	bnez	a5,80003424 <_ZN4KSem8closeSemEPS_+0x30>
	}
	return 0;
    80003444:	00000513          	li	a0,0
}
    80003448:	01813083          	ld	ra,24(sp)
    8000344c:	01013403          	ld	s0,16(sp)
    80003450:	00813483          	ld	s1,8(sp)
    80003454:	02010113          	addi	sp,sp,32
    80003458:	00008067          	ret
	if (!MemoryAllocator::checkPurpose(handle, MemoryAllocator::SEMAPHORE)) return -2;
    8000345c:	ffe00513          	li	a0,-2
    80003460:	fe9ff06f          	j	80003448 <_ZN4KSem8closeSemEPS_+0x54>

0000000080003464 <_Z10testMemoryv>:
//void printInteger(int i){
//	printInt(i);
//}
extern Semaphore* semA;

void testMemory() {
    80003464:	81010113          	addi	sp,sp,-2032
    80003468:	7e113423          	sd	ra,2024(sp)
    8000346c:	7e813023          	sd	s0,2016(sp)
    80003470:	7c913c23          	sd	s1,2008(sp)
    80003474:	7f010413          	addi	s0,sp,2032
    80003478:	83010113          	addi	sp,sp,-2000
	const uint64 NumAllocations = 500;    //zasto nece za preko 500????
	const uint64 AllocationSize = 16;

	// Allocate and initialize pointers
	int* allocations[NumAllocations];
	for (uint64 i = 0; i < NumAllocations; ++i)
    8000347c:	00000713          	li	a4,0
    80003480:	1f300793          	li	a5,499
    80003484:	02e7e263          	bltu	a5,a4,800034a8 <_Z10testMemoryv+0x44>
		allocations[i] = nullptr;
    80003488:	fffff7b7          	lui	a5,0xfffff
    8000348c:	00371693          	slli	a3,a4,0x3
    80003490:	fe040613          	addi	a2,s0,-32
    80003494:	00f607b3          	add	a5,a2,a5
    80003498:	00d787b3          	add	a5,a5,a3
    8000349c:	0607b023          	sd	zero,96(a5) # fffffffffffff060 <end+0xffffffff7fff2190>
	for (uint64 i = 0; i < NumAllocations; ++i)
    800034a0:	00170713          	addi	a4,a4,1
    800034a4:	fddff06f          	j	80003480 <_Z10testMemoryv+0x1c>

	// Allocate memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
    800034a8:	00000493          	li	s1,0
    800034ac:	1f300793          	li	a5,499
    800034b0:	0297ec63          	bltu	a5,s1,800034e8 <_Z10testMemoryv+0x84>
		allocations[i] = (int*)MemoryAllocator::kmalloc(
    800034b4:	00300593          	li	a1,3
    800034b8:	03000513          	li	a0,48
    800034bc:	00000097          	auipc	ra,0x0
    800034c0:	9bc080e7          	jalr	-1604(ra) # 80002e78 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
    800034c4:	fffff737          	lui	a4,0xfffff
    800034c8:	00349793          	slli	a5,s1,0x3
    800034cc:	fe040693          	addi	a3,s0,-32
    800034d0:	00e68733          	add	a4,a3,a4
    800034d4:	00f707b3          	add	a5,a4,a5
    800034d8:	06a7b023          	sd	a0,96(a5)
				AllocationSize + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::MISC);
		if (allocations[i] == nullptr) {
    800034dc:	00050663          	beqz	a0,800034e8 <_Z10testMemoryv+0x84>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    800034e0:	00148493          	addi	s1,s1,1
    800034e4:	fc9ff06f          	j	800034ac <_Z10testMemoryv+0x48>
    800034e8:	00000493          	li	s1,0
    800034ec:	0100006f          	j	800034fc <_Z10testMemoryv+0x98>
	}

	// Free memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
		if (allocations[i] != nullptr) {
			if (MemoryAllocator::kfree(allocations[i]) != 0) {
    800034f0:	00000097          	auipc	ra,0x0
    800034f4:	b34080e7          	jalr	-1228(ra) # 80003024 <_ZN15MemoryAllocator5kfreeEPv>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    800034f8:	00148493          	addi	s1,s1,1
    800034fc:	1f300793          	li	a5,499
    80003500:	0297e263          	bltu	a5,s1,80003524 <_Z10testMemoryv+0xc0>
		if (allocations[i] != nullptr) {
    80003504:	fffff737          	lui	a4,0xfffff
    80003508:	00349793          	slli	a5,s1,0x3
    8000350c:	fe040693          	addi	a3,s0,-32
    80003510:	00e68733          	add	a4,a3,a4
    80003514:	00f707b3          	add	a5,a4,a5
    80003518:	0607b503          	ld	a0,96(a5)
    8000351c:	fc051ae3          	bnez	a0,800034f0 <_Z10testMemoryv+0x8c>
    80003520:	fd9ff06f          	j	800034f8 <_Z10testMemoryv+0x94>
//				printString("\nDeallocation failed for index ");
//				printInteger(i);
			}
		}
	}
}
    80003524:	7d010113          	addi	sp,sp,2000
    80003528:	7e813083          	ld	ra,2024(sp)
    8000352c:	7e013403          	ld	s0,2016(sp)
    80003530:	7d813483          	ld	s1,2008(sp)
    80003534:	7f010113          	addi	sp,sp,2032
    80003538:	00008067          	ret

000000008000353c <_Z5nit1fPv>:

void nit1f(void*) {
    8000353c:	ff010113          	addi	sp,sp,-16
    80003540:	00113423          	sd	ra,8(sp)
    80003544:	00813023          	sd	s0,0(sp)
    80003548:	01010413          	addi	s0,sp,16
//		printString("\nsem_wait za nit 1 vratio ");
//		printInteger(res);
//		printString("\n");
//	}

	printString("\nGotova nit 1\n");
    8000354c:	00006517          	auipc	a0,0x6
    80003550:	ca450513          	addi	a0,a0,-860 # 800091f0 <CONSOLE_STATUS+0x1e0>
    80003554:	00002097          	auipc	ra,0x2
    80003558:	530080e7          	jalr	1328(ra) # 80005a84 <_Z11printStringPKc>
}
    8000355c:	00813083          	ld	ra,8(sp)
    80003560:	00013403          	ld	s0,0(sp)
    80003564:	01010113          	addi	sp,sp,16
    80003568:	00008067          	ret

000000008000356c <_Z5nit2fPv>:

void nit2f(void* arg2) {
    8000356c:	ff010113          	addi	sp,sp,-16
    80003570:	00113423          	sd	ra,8(sp)
    80003574:	00813023          	sd	s0,0(sp)
    80003578:	01010413          	addi	s0,sp,16
//		//sem_close(semA);
//		printString("\nNit 2 ubija semafor\n");
//		delete semA;
//
//	}
	printString("\nGotova nit 2\n");
    8000357c:	00006517          	auipc	a0,0x6
    80003580:	c8450513          	addi	a0,a0,-892 # 80009200 <CONSOLE_STATUS+0x1f0>
    80003584:	00002097          	auipc	ra,0x2
    80003588:	500080e7          	jalr	1280(ra) # 80005a84 <_Z11printStringPKc>
}
    8000358c:	00813083          	ld	ra,8(sp)
    80003590:	00013403          	ld	s0,0(sp)
    80003594:	01010113          	addi	sp,sp,16
    80003598:	00008067          	ret

000000008000359c <_Z5nit3fPv>:


void nit3f(void*) {
    8000359c:	fe010113          	addi	sp,sp,-32
    800035a0:	00113c23          	sd	ra,24(sp)
    800035a4:	00813823          	sd	s0,16(sp)
    800035a8:	00913423          	sd	s1,8(sp)
    800035ac:	02010413          	addi	s0,sp,32
    800035b0:	0180006f          	j	800035c8 <_Z5nit3fPv+0x2c>
	char slovo;
	do {
		slovo = getc();
		putc(slovo);
		if (slovo == '\r') putc('\n');
    800035b4:	00a00513          	li	a0,10
    800035b8:	ffffe097          	auipc	ra,0xffffe
    800035bc:	fd8080e7          	jalr	-40(ra) # 80001590 <_Z4putcc>
	} while (slovo != '0');
    800035c0:	03000793          	li	a5,48
    800035c4:	02f48263          	beq	s1,a5,800035e8 <_Z5nit3fPv+0x4c>
		slovo = getc();
    800035c8:	ffffe097          	auipc	ra,0xffffe
    800035cc:	fa0080e7          	jalr	-96(ra) # 80001568 <_Z4getcv>
    800035d0:	00050493          	mv	s1,a0
		putc(slovo);
    800035d4:	ffffe097          	auipc	ra,0xffffe
    800035d8:	fbc080e7          	jalr	-68(ra) # 80001590 <_Z4putcc>
		if (slovo == '\r') putc('\n');
    800035dc:	00d00793          	li	a5,13
    800035e0:	fef490e3          	bne	s1,a5,800035c0 <_Z5nit3fPv+0x24>
    800035e4:	fd1ff06f          	j	800035b4 <_Z5nit3fPv+0x18>

	printString("\nGotova nit3\n");
    800035e8:	00006517          	auipc	a0,0x6
    800035ec:	c2850513          	addi	a0,a0,-984 # 80009210 <CONSOLE_STATUS+0x200>
    800035f0:	00002097          	auipc	ra,0x2
    800035f4:	494080e7          	jalr	1172(ra) # 80005a84 <_Z11printStringPKc>
    800035f8:	01813083          	ld	ra,24(sp)
    800035fc:	01013403          	ld	s0,16(sp)
    80003600:	00813483          	ld	s1,8(sp)
    80003604:	02010113          	addi	sp,sp,32
    80003608:	00008067          	ret

000000008000360c <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    8000360c:	fe010113          	addi	sp,sp,-32
    80003610:	00113c23          	sd	ra,24(sp)
    80003614:	00813823          	sd	s0,16(sp)
    80003618:	00913423          	sd	s1,8(sp)
    8000361c:	01213023          	sd	s2,0(sp)
    80003620:	02010413          	addi	s0,sp,32
    80003624:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80003628:	00000913          	li	s2,0
    8000362c:	00c0006f          	j	80003638 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003630:	ffffe097          	auipc	ra,0xffffe
    80003634:	df8080e7          	jalr	-520(ra) # 80001428 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
    80003638:	ffffe097          	auipc	ra,0xffffe
    8000363c:	f30080e7          	jalr	-208(ra) # 80001568 <_Z4getcv>
    80003640:	0005059b          	sext.w	a1,a0
    80003644:	02d00793          	li	a5,45
    80003648:	02f58a63          	beq	a1,a5,8000367c <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    8000364c:	0084b503          	ld	a0,8(s1)
    80003650:	00003097          	auipc	ra,0x3
    80003654:	400080e7          	jalr	1024(ra) # 80006a50 <_ZN6Buffer3putEi>
        i++;
    80003658:	0019071b          	addiw	a4,s2,1
    8000365c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003660:	0004a683          	lw	a3,0(s1)
    80003664:	0026979b          	slliw	a5,a3,0x2
    80003668:	00d787bb          	addw	a5,a5,a3
    8000366c:	0017979b          	slliw	a5,a5,0x1
    80003670:	02f767bb          	remw	a5,a4,a5
    80003674:	fc0792e3          	bnez	a5,80003638 <_ZL16producerKeyboardPv+0x2c>
    80003678:	fb9ff06f          	j	80003630 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    8000367c:	00100793          	li	a5,1
    80003680:	00008717          	auipc	a4,0x8
    80003684:	58f72c23          	sw	a5,1432(a4) # 8000bc18 <_ZL9threadEnd>
    data->buffer->put('!');
    80003688:	02100593          	li	a1,33
    8000368c:	0084b503          	ld	a0,8(s1)
    80003690:	00003097          	auipc	ra,0x3
    80003694:	3c0080e7          	jalr	960(ra) # 80006a50 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80003698:	0104b503          	ld	a0,16(s1)
    8000369c:	ffffe097          	auipc	ra,0xffffe
    800036a0:	e9c080e7          	jalr	-356(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    800036a4:	01813083          	ld	ra,24(sp)
    800036a8:	01013403          	ld	s0,16(sp)
    800036ac:	00813483          	ld	s1,8(sp)
    800036b0:	00013903          	ld	s2,0(sp)
    800036b4:	02010113          	addi	sp,sp,32
    800036b8:	00008067          	ret

00000000800036bc <_ZL8producerPv>:

static void producer(void *arg) {
    800036bc:	fe010113          	addi	sp,sp,-32
    800036c0:	00113c23          	sd	ra,24(sp)
    800036c4:	00813823          	sd	s0,16(sp)
    800036c8:	00913423          	sd	s1,8(sp)
    800036cc:	01213023          	sd	s2,0(sp)
    800036d0:	02010413          	addi	s0,sp,32
    800036d4:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800036d8:	00000913          	li	s2,0
    800036dc:	00c0006f          	j	800036e8 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    800036e0:	ffffe097          	auipc	ra,0xffffe
    800036e4:	d48080e7          	jalr	-696(ra) # 80001428 <_Z15thread_dispatchv>
    while (!threadEnd) {
    800036e8:	00008797          	auipc	a5,0x8
    800036ec:	5307a783          	lw	a5,1328(a5) # 8000bc18 <_ZL9threadEnd>
    800036f0:	02079e63          	bnez	a5,8000372c <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    800036f4:	0004a583          	lw	a1,0(s1)
    800036f8:	0305859b          	addiw	a1,a1,48
    800036fc:	0084b503          	ld	a0,8(s1)
    80003700:	00003097          	auipc	ra,0x3
    80003704:	350080e7          	jalr	848(ra) # 80006a50 <_ZN6Buffer3putEi>
        i++;
    80003708:	0019071b          	addiw	a4,s2,1
    8000370c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003710:	0004a683          	lw	a3,0(s1)
    80003714:	0026979b          	slliw	a5,a3,0x2
    80003718:	00d787bb          	addw	a5,a5,a3
    8000371c:	0017979b          	slliw	a5,a5,0x1
    80003720:	02f767bb          	remw	a5,a4,a5
    80003724:	fc0792e3          	bnez	a5,800036e8 <_ZL8producerPv+0x2c>
    80003728:	fb9ff06f          	j	800036e0 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    8000372c:	0104b503          	ld	a0,16(s1)
    80003730:	ffffe097          	auipc	ra,0xffffe
    80003734:	e08080e7          	jalr	-504(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    80003738:	01813083          	ld	ra,24(sp)
    8000373c:	01013403          	ld	s0,16(sp)
    80003740:	00813483          	ld	s1,8(sp)
    80003744:	00013903          	ld	s2,0(sp)
    80003748:	02010113          	addi	sp,sp,32
    8000374c:	00008067          	ret

0000000080003750 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80003750:	fd010113          	addi	sp,sp,-48
    80003754:	02113423          	sd	ra,40(sp)
    80003758:	02813023          	sd	s0,32(sp)
    8000375c:	00913c23          	sd	s1,24(sp)
    80003760:	01213823          	sd	s2,16(sp)
    80003764:	01313423          	sd	s3,8(sp)
    80003768:	03010413          	addi	s0,sp,48
    8000376c:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003770:	00000993          	li	s3,0
    80003774:	01c0006f          	j	80003790 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80003778:	ffffe097          	auipc	ra,0xffffe
    8000377c:	cb0080e7          	jalr	-848(ra) # 80001428 <_Z15thread_dispatchv>
    80003780:	0500006f          	j	800037d0 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80003784:	00a00513          	li	a0,10
    80003788:	ffffe097          	auipc	ra,0xffffe
    8000378c:	e08080e7          	jalr	-504(ra) # 80001590 <_Z4putcc>
    while (!threadEnd) {
    80003790:	00008797          	auipc	a5,0x8
    80003794:	4887a783          	lw	a5,1160(a5) # 8000bc18 <_ZL9threadEnd>
    80003798:	06079063          	bnez	a5,800037f8 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    8000379c:	00893503          	ld	a0,8(s2)
    800037a0:	00003097          	auipc	ra,0x3
    800037a4:	340080e7          	jalr	832(ra) # 80006ae0 <_ZN6Buffer3getEv>
        i++;
    800037a8:	0019849b          	addiw	s1,s3,1
    800037ac:	0004899b          	sext.w	s3,s1
        putc(key);
    800037b0:	0ff57513          	andi	a0,a0,255
    800037b4:	ffffe097          	auipc	ra,0xffffe
    800037b8:	ddc080e7          	jalr	-548(ra) # 80001590 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    800037bc:	00092703          	lw	a4,0(s2)
    800037c0:	0027179b          	slliw	a5,a4,0x2
    800037c4:	00e787bb          	addw	a5,a5,a4
    800037c8:	02f4e7bb          	remw	a5,s1,a5
    800037cc:	fa0786e3          	beqz	a5,80003778 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    800037d0:	05000793          	li	a5,80
    800037d4:	02f4e4bb          	remw	s1,s1,a5
    800037d8:	fa049ce3          	bnez	s1,80003790 <_ZL8consumerPv+0x40>
    800037dc:	fa9ff06f          	j	80003784 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    800037e0:	00893503          	ld	a0,8(s2)
    800037e4:	00003097          	auipc	ra,0x3
    800037e8:	2fc080e7          	jalr	764(ra) # 80006ae0 <_ZN6Buffer3getEv>
        putc(key);
    800037ec:	0ff57513          	andi	a0,a0,255
    800037f0:	ffffe097          	auipc	ra,0xffffe
    800037f4:	da0080e7          	jalr	-608(ra) # 80001590 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    800037f8:	00893503          	ld	a0,8(s2)
    800037fc:	00003097          	auipc	ra,0x3
    80003800:	370080e7          	jalr	880(ra) # 80006b6c <_ZN6Buffer6getCntEv>
    80003804:	fca04ee3          	bgtz	a0,800037e0 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80003808:	01093503          	ld	a0,16(s2)
    8000380c:	ffffe097          	auipc	ra,0xffffe
    80003810:	d2c080e7          	jalr	-724(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    80003814:	02813083          	ld	ra,40(sp)
    80003818:	02013403          	ld	s0,32(sp)
    8000381c:	01813483          	ld	s1,24(sp)
    80003820:	01013903          	ld	s2,16(sp)
    80003824:	00813983          	ld	s3,8(sp)
    80003828:	03010113          	addi	sp,sp,48
    8000382c:	00008067          	ret

0000000080003830 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80003830:	f9010113          	addi	sp,sp,-112
    80003834:	06113423          	sd	ra,104(sp)
    80003838:	06813023          	sd	s0,96(sp)
    8000383c:	04913c23          	sd	s1,88(sp)
    80003840:	05213823          	sd	s2,80(sp)
    80003844:	05313423          	sd	s3,72(sp)
    80003848:	05413023          	sd	s4,64(sp)
    8000384c:	03513c23          	sd	s5,56(sp)
    80003850:	03613823          	sd	s6,48(sp)
    80003854:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80003858:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    8000385c:	00006517          	auipc	a0,0x6
    80003860:	9c450513          	addi	a0,a0,-1596 # 80009220 <CONSOLE_STATUS+0x210>
    80003864:	00002097          	auipc	ra,0x2
    80003868:	220080e7          	jalr	544(ra) # 80005a84 <_Z11printStringPKc>
    getString(input, 30);
    8000386c:	01e00593          	li	a1,30
    80003870:	fa040493          	addi	s1,s0,-96
    80003874:	00048513          	mv	a0,s1
    80003878:	00002097          	auipc	ra,0x2
    8000387c:	294080e7          	jalr	660(ra) # 80005b0c <_Z9getStringPci>
    threadNum = stringToInt(input);
    80003880:	00048513          	mv	a0,s1
    80003884:	00002097          	auipc	ra,0x2
    80003888:	360080e7          	jalr	864(ra) # 80005be4 <_Z11stringToIntPKc>
    8000388c:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80003890:	00006517          	auipc	a0,0x6
    80003894:	9b050513          	addi	a0,a0,-1616 # 80009240 <CONSOLE_STATUS+0x230>
    80003898:	00002097          	auipc	ra,0x2
    8000389c:	1ec080e7          	jalr	492(ra) # 80005a84 <_Z11printStringPKc>
    getString(input, 30);
    800038a0:	01e00593          	li	a1,30
    800038a4:	00048513          	mv	a0,s1
    800038a8:	00002097          	auipc	ra,0x2
    800038ac:	264080e7          	jalr	612(ra) # 80005b0c <_Z9getStringPci>
    n = stringToInt(input);
    800038b0:	00048513          	mv	a0,s1
    800038b4:	00002097          	auipc	ra,0x2
    800038b8:	330080e7          	jalr	816(ra) # 80005be4 <_Z11stringToIntPKc>
    800038bc:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    800038c0:	00006517          	auipc	a0,0x6
    800038c4:	9a050513          	addi	a0,a0,-1632 # 80009260 <CONSOLE_STATUS+0x250>
    800038c8:	00002097          	auipc	ra,0x2
    800038cc:	1bc080e7          	jalr	444(ra) # 80005a84 <_Z11printStringPKc>
    800038d0:	00000613          	li	a2,0
    800038d4:	00a00593          	li	a1,10
    800038d8:	00090513          	mv	a0,s2
    800038dc:	00002097          	auipc	ra,0x2
    800038e0:	358080e7          	jalr	856(ra) # 80005c34 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    800038e4:	00006517          	auipc	a0,0x6
    800038e8:	99450513          	addi	a0,a0,-1644 # 80009278 <CONSOLE_STATUS+0x268>
    800038ec:	00002097          	auipc	ra,0x2
    800038f0:	198080e7          	jalr	408(ra) # 80005a84 <_Z11printStringPKc>
    800038f4:	00000613          	li	a2,0
    800038f8:	00a00593          	li	a1,10
    800038fc:	00048513          	mv	a0,s1
    80003900:	00002097          	auipc	ra,0x2
    80003904:	334080e7          	jalr	820(ra) # 80005c34 <_Z8printIntiii>
    printString(".\n");
    80003908:	00006517          	auipc	a0,0x6
    8000390c:	98850513          	addi	a0,a0,-1656 # 80009290 <CONSOLE_STATUS+0x280>
    80003910:	00002097          	auipc	ra,0x2
    80003914:	174080e7          	jalr	372(ra) # 80005a84 <_Z11printStringPKc>
    if(threadNum > n) {
    80003918:	0324c463          	blt	s1,s2,80003940 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    8000391c:	03205c63          	blez	s2,80003954 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80003920:	03800513          	li	a0,56
    80003924:	fffff097          	auipc	ra,0xfffff
    80003928:	d38080e7          	jalr	-712(ra) # 8000265c <_Znwm>
    8000392c:	00050a13          	mv	s4,a0
    80003930:	00048593          	mv	a1,s1
    80003934:	00003097          	auipc	ra,0x3
    80003938:	080080e7          	jalr	128(ra) # 800069b4 <_ZN6BufferC1Ei>
    8000393c:	0300006f          	j	8000396c <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80003940:	00006517          	auipc	a0,0x6
    80003944:	95850513          	addi	a0,a0,-1704 # 80009298 <CONSOLE_STATUS+0x288>
    80003948:	00002097          	auipc	ra,0x2
    8000394c:	13c080e7          	jalr	316(ra) # 80005a84 <_Z11printStringPKc>
        return;
    80003950:	0140006f          	j	80003964 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80003954:	00006517          	auipc	a0,0x6
    80003958:	98450513          	addi	a0,a0,-1660 # 800092d8 <CONSOLE_STATUS+0x2c8>
    8000395c:	00002097          	auipc	ra,0x2
    80003960:	128080e7          	jalr	296(ra) # 80005a84 <_Z11printStringPKc>
        return;
    80003964:	000b0113          	mv	sp,s6
    80003968:	1500006f          	j	80003ab8 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    8000396c:	00000593          	li	a1,0
    80003970:	00008517          	auipc	a0,0x8
    80003974:	2b050513          	addi	a0,a0,688 # 8000bc20 <_ZL10waitForAll>
    80003978:	ffffe097          	auipc	ra,0xffffe
    8000397c:	b28080e7          	jalr	-1240(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    thread_t threads[threadNum];
    80003980:	00391793          	slli	a5,s2,0x3
    80003984:	00f78793          	addi	a5,a5,15
    80003988:	ff07f793          	andi	a5,a5,-16
    8000398c:	40f10133          	sub	sp,sp,a5
    80003990:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80003994:	0019071b          	addiw	a4,s2,1
    80003998:	00171793          	slli	a5,a4,0x1
    8000399c:	00e787b3          	add	a5,a5,a4
    800039a0:	00379793          	slli	a5,a5,0x3
    800039a4:	00f78793          	addi	a5,a5,15
    800039a8:	ff07f793          	andi	a5,a5,-16
    800039ac:	40f10133          	sub	sp,sp,a5
    800039b0:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    800039b4:	00191613          	slli	a2,s2,0x1
    800039b8:	012607b3          	add	a5,a2,s2
    800039bc:	00379793          	slli	a5,a5,0x3
    800039c0:	00f987b3          	add	a5,s3,a5
    800039c4:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    800039c8:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    800039cc:	00008717          	auipc	a4,0x8
    800039d0:	25473703          	ld	a4,596(a4) # 8000bc20 <_ZL10waitForAll>
    800039d4:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    800039d8:	00078613          	mv	a2,a5
    800039dc:	00000597          	auipc	a1,0x0
    800039e0:	d7458593          	addi	a1,a1,-652 # 80003750 <_ZL8consumerPv>
    800039e4:	f9840513          	addi	a0,s0,-104
    800039e8:	ffffe097          	auipc	ra,0xffffe
    800039ec:	998080e7          	jalr	-1640(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    800039f0:	00000493          	li	s1,0
    800039f4:	0280006f          	j	80003a1c <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    800039f8:	00000597          	auipc	a1,0x0
    800039fc:	c1458593          	addi	a1,a1,-1004 # 8000360c <_ZL16producerKeyboardPv>
                      data + i);
    80003a00:	00179613          	slli	a2,a5,0x1
    80003a04:	00f60633          	add	a2,a2,a5
    80003a08:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80003a0c:	00c98633          	add	a2,s3,a2
    80003a10:	ffffe097          	auipc	ra,0xffffe
    80003a14:	970080e7          	jalr	-1680(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003a18:	0014849b          	addiw	s1,s1,1
    80003a1c:	0524d263          	bge	s1,s2,80003a60 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80003a20:	00149793          	slli	a5,s1,0x1
    80003a24:	009787b3          	add	a5,a5,s1
    80003a28:	00379793          	slli	a5,a5,0x3
    80003a2c:	00f987b3          	add	a5,s3,a5
    80003a30:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80003a34:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80003a38:	00008717          	auipc	a4,0x8
    80003a3c:	1e873703          	ld	a4,488(a4) # 8000bc20 <_ZL10waitForAll>
    80003a40:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80003a44:	00048793          	mv	a5,s1
    80003a48:	00349513          	slli	a0,s1,0x3
    80003a4c:	00aa8533          	add	a0,s5,a0
    80003a50:	fa9054e3          	blez	s1,800039f8 <_Z22producerConsumer_C_APIv+0x1c8>
    80003a54:	00000597          	auipc	a1,0x0
    80003a58:	c6858593          	addi	a1,a1,-920 # 800036bc <_ZL8producerPv>
    80003a5c:	fa5ff06f          	j	80003a00 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80003a60:	ffffe097          	auipc	ra,0xffffe
    80003a64:	9c8080e7          	jalr	-1592(ra) # 80001428 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80003a68:	00000493          	li	s1,0
    80003a6c:	00994e63          	blt	s2,s1,80003a88 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80003a70:	00008517          	auipc	a0,0x8
    80003a74:	1b053503          	ld	a0,432(a0) # 8000bc20 <_ZL10waitForAll>
    80003a78:	ffffe097          	auipc	ra,0xffffe
    80003a7c:	a90080e7          	jalr	-1392(ra) # 80001508 <_Z8sem_waitP4KSem>
    for (int i = 0; i <= threadNum; i++) {
    80003a80:	0014849b          	addiw	s1,s1,1
    80003a84:	fe9ff06f          	j	80003a6c <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80003a88:	00008517          	auipc	a0,0x8
    80003a8c:	19853503          	ld	a0,408(a0) # 8000bc20 <_ZL10waitForAll>
    80003a90:	ffffe097          	auipc	ra,0xffffe
    80003a94:	a48080e7          	jalr	-1464(ra) # 800014d8 <_Z9sem_closeP4KSem>
    delete buffer;
    80003a98:	000a0e63          	beqz	s4,80003ab4 <_Z22producerConsumer_C_APIv+0x284>
    80003a9c:	000a0513          	mv	a0,s4
    80003aa0:	00003097          	auipc	ra,0x3
    80003aa4:	154080e7          	jalr	340(ra) # 80006bf4 <_ZN6BufferD1Ev>
    80003aa8:	000a0513          	mv	a0,s4
    80003aac:	fffff097          	auipc	ra,0xfffff
    80003ab0:	c00080e7          	jalr	-1024(ra) # 800026ac <_ZdlPv>
    80003ab4:	000b0113          	mv	sp,s6

}
    80003ab8:	f9040113          	addi	sp,s0,-112
    80003abc:	06813083          	ld	ra,104(sp)
    80003ac0:	06013403          	ld	s0,96(sp)
    80003ac4:	05813483          	ld	s1,88(sp)
    80003ac8:	05013903          	ld	s2,80(sp)
    80003acc:	04813983          	ld	s3,72(sp)
    80003ad0:	04013a03          	ld	s4,64(sp)
    80003ad4:	03813a83          	ld	s5,56(sp)
    80003ad8:	03013b03          	ld	s6,48(sp)
    80003adc:	07010113          	addi	sp,sp,112
    80003ae0:	00008067          	ret
    80003ae4:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80003ae8:	000a0513          	mv	a0,s4
    80003aec:	fffff097          	auipc	ra,0xfffff
    80003af0:	bc0080e7          	jalr	-1088(ra) # 800026ac <_ZdlPv>
    80003af4:	00048513          	mv	a0,s1
    80003af8:	00009097          	auipc	ra,0x9
    80003afc:	240080e7          	jalr	576(ra) # 8000cd38 <_Unwind_Resume>

0000000080003b00 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003b00:	fe010113          	addi	sp,sp,-32
    80003b04:	00113c23          	sd	ra,24(sp)
    80003b08:	00813823          	sd	s0,16(sp)
    80003b0c:	00913423          	sd	s1,8(sp)
    80003b10:	01213023          	sd	s2,0(sp)
    80003b14:	02010413          	addi	s0,sp,32
    80003b18:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003b1c:	00100793          	li	a5,1
    80003b20:	02a7f863          	bgeu	a5,a0,80003b50 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80003b24:	00a00793          	li	a5,10
    80003b28:	02f577b3          	remu	a5,a0,a5
    80003b2c:	02078e63          	beqz	a5,80003b68 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80003b30:	fff48513          	addi	a0,s1,-1
    80003b34:	00000097          	auipc	ra,0x0
    80003b38:	fcc080e7          	jalr	-52(ra) # 80003b00 <_ZL9fibonaccim>
    80003b3c:	00050913          	mv	s2,a0
    80003b40:	ffe48513          	addi	a0,s1,-2
    80003b44:	00000097          	auipc	ra,0x0
    80003b48:	fbc080e7          	jalr	-68(ra) # 80003b00 <_ZL9fibonaccim>
    80003b4c:	00a90533          	add	a0,s2,a0
}
    80003b50:	01813083          	ld	ra,24(sp)
    80003b54:	01013403          	ld	s0,16(sp)
    80003b58:	00813483          	ld	s1,8(sp)
    80003b5c:	00013903          	ld	s2,0(sp)
    80003b60:	02010113          	addi	sp,sp,32
    80003b64:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80003b68:	ffffe097          	auipc	ra,0xffffe
    80003b6c:	8c0080e7          	jalr	-1856(ra) # 80001428 <_Z15thread_dispatchv>
    80003b70:	fc1ff06f          	j	80003b30 <_ZL9fibonaccim+0x30>

0000000080003b74 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80003b74:	fe010113          	addi	sp,sp,-32
    80003b78:	00113c23          	sd	ra,24(sp)
    80003b7c:	00813823          	sd	s0,16(sp)
    80003b80:	00913423          	sd	s1,8(sp)
    80003b84:	01213023          	sd	s2,0(sp)
    80003b88:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003b8c:	00000913          	li	s2,0
    80003b90:	0380006f          	j	80003bc8 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003b94:	ffffe097          	auipc	ra,0xffffe
    80003b98:	894080e7          	jalr	-1900(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003b9c:	00148493          	addi	s1,s1,1
    80003ba0:	000027b7          	lui	a5,0x2
    80003ba4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003ba8:	0097ee63          	bltu	a5,s1,80003bc4 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003bac:	00000713          	li	a4,0
    80003bb0:	000077b7          	lui	a5,0x7
    80003bb4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003bb8:	fce7eee3          	bltu	a5,a4,80003b94 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80003bbc:	00170713          	addi	a4,a4,1
    80003bc0:	ff1ff06f          	j	80003bb0 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003bc4:	00190913          	addi	s2,s2,1
    80003bc8:	00900793          	li	a5,9
    80003bcc:	0527e063          	bltu	a5,s2,80003c0c <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003bd0:	00005517          	auipc	a0,0x5
    80003bd4:	73850513          	addi	a0,a0,1848 # 80009308 <CONSOLE_STATUS+0x2f8>
    80003bd8:	00002097          	auipc	ra,0x2
    80003bdc:	eac080e7          	jalr	-340(ra) # 80005a84 <_Z11printStringPKc>
    80003be0:	00000613          	li	a2,0
    80003be4:	00a00593          	li	a1,10
    80003be8:	0009051b          	sext.w	a0,s2
    80003bec:	00002097          	auipc	ra,0x2
    80003bf0:	048080e7          	jalr	72(ra) # 80005c34 <_Z8printIntiii>
    80003bf4:	00006517          	auipc	a0,0x6
    80003bf8:	97450513          	addi	a0,a0,-1676 # 80009568 <CONSOLE_STATUS+0x558>
    80003bfc:	00002097          	auipc	ra,0x2
    80003c00:	e88080e7          	jalr	-376(ra) # 80005a84 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003c04:	00000493          	li	s1,0
    80003c08:	f99ff06f          	j	80003ba0 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003c0c:	00005517          	auipc	a0,0x5
    80003c10:	70450513          	addi	a0,a0,1796 # 80009310 <CONSOLE_STATUS+0x300>
    80003c14:	00002097          	auipc	ra,0x2
    80003c18:	e70080e7          	jalr	-400(ra) # 80005a84 <_Z11printStringPKc>
    finishedA = true;
    80003c1c:	00100793          	li	a5,1
    80003c20:	00008717          	auipc	a4,0x8
    80003c24:	00f70423          	sb	a5,8(a4) # 8000bc28 <_ZL9finishedA>
}
    80003c28:	01813083          	ld	ra,24(sp)
    80003c2c:	01013403          	ld	s0,16(sp)
    80003c30:	00813483          	ld	s1,8(sp)
    80003c34:	00013903          	ld	s2,0(sp)
    80003c38:	02010113          	addi	sp,sp,32
    80003c3c:	00008067          	ret

0000000080003c40 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80003c40:	fe010113          	addi	sp,sp,-32
    80003c44:	00113c23          	sd	ra,24(sp)
    80003c48:	00813823          	sd	s0,16(sp)
    80003c4c:	00913423          	sd	s1,8(sp)
    80003c50:	01213023          	sd	s2,0(sp)
    80003c54:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003c58:	00000913          	li	s2,0
    80003c5c:	0380006f          	j	80003c94 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003c60:	ffffd097          	auipc	ra,0xffffd
    80003c64:	7c8080e7          	jalr	1992(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003c68:	00148493          	addi	s1,s1,1
    80003c6c:	000027b7          	lui	a5,0x2
    80003c70:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003c74:	0097ee63          	bltu	a5,s1,80003c90 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003c78:	00000713          	li	a4,0
    80003c7c:	000077b7          	lui	a5,0x7
    80003c80:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003c84:	fce7eee3          	bltu	a5,a4,80003c60 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80003c88:	00170713          	addi	a4,a4,1
    80003c8c:	ff1ff06f          	j	80003c7c <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003c90:	00190913          	addi	s2,s2,1
    80003c94:	00f00793          	li	a5,15
    80003c98:	0527e063          	bltu	a5,s2,80003cd8 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003c9c:	00005517          	auipc	a0,0x5
    80003ca0:	68450513          	addi	a0,a0,1668 # 80009320 <CONSOLE_STATUS+0x310>
    80003ca4:	00002097          	auipc	ra,0x2
    80003ca8:	de0080e7          	jalr	-544(ra) # 80005a84 <_Z11printStringPKc>
    80003cac:	00000613          	li	a2,0
    80003cb0:	00a00593          	li	a1,10
    80003cb4:	0009051b          	sext.w	a0,s2
    80003cb8:	00002097          	auipc	ra,0x2
    80003cbc:	f7c080e7          	jalr	-132(ra) # 80005c34 <_Z8printIntiii>
    80003cc0:	00006517          	auipc	a0,0x6
    80003cc4:	8a850513          	addi	a0,a0,-1880 # 80009568 <CONSOLE_STATUS+0x558>
    80003cc8:	00002097          	auipc	ra,0x2
    80003ccc:	dbc080e7          	jalr	-580(ra) # 80005a84 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003cd0:	00000493          	li	s1,0
    80003cd4:	f99ff06f          	j	80003c6c <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80003cd8:	00005517          	auipc	a0,0x5
    80003cdc:	65050513          	addi	a0,a0,1616 # 80009328 <CONSOLE_STATUS+0x318>
    80003ce0:	00002097          	auipc	ra,0x2
    80003ce4:	da4080e7          	jalr	-604(ra) # 80005a84 <_Z11printStringPKc>
    finishedB = true;
    80003ce8:	00100793          	li	a5,1
    80003cec:	00008717          	auipc	a4,0x8
    80003cf0:	f2f70ea3          	sb	a5,-195(a4) # 8000bc29 <_ZL9finishedB>
    thread_dispatch();
    80003cf4:	ffffd097          	auipc	ra,0xffffd
    80003cf8:	734080e7          	jalr	1844(ra) # 80001428 <_Z15thread_dispatchv>
}
    80003cfc:	01813083          	ld	ra,24(sp)
    80003d00:	01013403          	ld	s0,16(sp)
    80003d04:	00813483          	ld	s1,8(sp)
    80003d08:	00013903          	ld	s2,0(sp)
    80003d0c:	02010113          	addi	sp,sp,32
    80003d10:	00008067          	ret

0000000080003d14 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80003d14:	fe010113          	addi	sp,sp,-32
    80003d18:	00113c23          	sd	ra,24(sp)
    80003d1c:	00813823          	sd	s0,16(sp)
    80003d20:	00913423          	sd	s1,8(sp)
    80003d24:	01213023          	sd	s2,0(sp)
    80003d28:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80003d2c:	00000493          	li	s1,0
    80003d30:	0400006f          	j	80003d70 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003d34:	00005517          	auipc	a0,0x5
    80003d38:	60450513          	addi	a0,a0,1540 # 80009338 <CONSOLE_STATUS+0x328>
    80003d3c:	00002097          	auipc	ra,0x2
    80003d40:	d48080e7          	jalr	-696(ra) # 80005a84 <_Z11printStringPKc>
    80003d44:	00000613          	li	a2,0
    80003d48:	00a00593          	li	a1,10
    80003d4c:	00048513          	mv	a0,s1
    80003d50:	00002097          	auipc	ra,0x2
    80003d54:	ee4080e7          	jalr	-284(ra) # 80005c34 <_Z8printIntiii>
    80003d58:	00006517          	auipc	a0,0x6
    80003d5c:	81050513          	addi	a0,a0,-2032 # 80009568 <CONSOLE_STATUS+0x558>
    80003d60:	00002097          	auipc	ra,0x2
    80003d64:	d24080e7          	jalr	-732(ra) # 80005a84 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80003d68:	0014849b          	addiw	s1,s1,1
    80003d6c:	0ff4f493          	andi	s1,s1,255
    80003d70:	00200793          	li	a5,2
    80003d74:	fc97f0e3          	bgeu	a5,s1,80003d34 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80003d78:	00005517          	auipc	a0,0x5
    80003d7c:	5c850513          	addi	a0,a0,1480 # 80009340 <CONSOLE_STATUS+0x330>
    80003d80:	00002097          	auipc	ra,0x2
    80003d84:	d04080e7          	jalr	-764(ra) # 80005a84 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80003d88:	00700313          	li	t1,7
    thread_dispatch();
    80003d8c:	ffffd097          	auipc	ra,0xffffd
    80003d90:	69c080e7          	jalr	1692(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80003d94:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80003d98:	00005517          	auipc	a0,0x5
    80003d9c:	5b850513          	addi	a0,a0,1464 # 80009350 <CONSOLE_STATUS+0x340>
    80003da0:	00002097          	auipc	ra,0x2
    80003da4:	ce4080e7          	jalr	-796(ra) # 80005a84 <_Z11printStringPKc>
    80003da8:	00000613          	li	a2,0
    80003dac:	00a00593          	li	a1,10
    80003db0:	0009051b          	sext.w	a0,s2
    80003db4:	00002097          	auipc	ra,0x2
    80003db8:	e80080e7          	jalr	-384(ra) # 80005c34 <_Z8printIntiii>
    80003dbc:	00005517          	auipc	a0,0x5
    80003dc0:	7ac50513          	addi	a0,a0,1964 # 80009568 <CONSOLE_STATUS+0x558>
    80003dc4:	00002097          	auipc	ra,0x2
    80003dc8:	cc0080e7          	jalr	-832(ra) # 80005a84 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80003dcc:	00c00513          	li	a0,12
    80003dd0:	00000097          	auipc	ra,0x0
    80003dd4:	d30080e7          	jalr	-720(ra) # 80003b00 <_ZL9fibonaccim>
    80003dd8:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80003ddc:	00005517          	auipc	a0,0x5
    80003de0:	57c50513          	addi	a0,a0,1404 # 80009358 <CONSOLE_STATUS+0x348>
    80003de4:	00002097          	auipc	ra,0x2
    80003de8:	ca0080e7          	jalr	-864(ra) # 80005a84 <_Z11printStringPKc>
    80003dec:	00000613          	li	a2,0
    80003df0:	00a00593          	li	a1,10
    80003df4:	0009051b          	sext.w	a0,s2
    80003df8:	00002097          	auipc	ra,0x2
    80003dfc:	e3c080e7          	jalr	-452(ra) # 80005c34 <_Z8printIntiii>
    80003e00:	00005517          	auipc	a0,0x5
    80003e04:	76850513          	addi	a0,a0,1896 # 80009568 <CONSOLE_STATUS+0x558>
    80003e08:	00002097          	auipc	ra,0x2
    80003e0c:	c7c080e7          	jalr	-900(ra) # 80005a84 <_Z11printStringPKc>
    80003e10:	0400006f          	j	80003e50 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003e14:	00005517          	auipc	a0,0x5
    80003e18:	52450513          	addi	a0,a0,1316 # 80009338 <CONSOLE_STATUS+0x328>
    80003e1c:	00002097          	auipc	ra,0x2
    80003e20:	c68080e7          	jalr	-920(ra) # 80005a84 <_Z11printStringPKc>
    80003e24:	00000613          	li	a2,0
    80003e28:	00a00593          	li	a1,10
    80003e2c:	00048513          	mv	a0,s1
    80003e30:	00002097          	auipc	ra,0x2
    80003e34:	e04080e7          	jalr	-508(ra) # 80005c34 <_Z8printIntiii>
    80003e38:	00005517          	auipc	a0,0x5
    80003e3c:	73050513          	addi	a0,a0,1840 # 80009568 <CONSOLE_STATUS+0x558>
    80003e40:	00002097          	auipc	ra,0x2
    80003e44:	c44080e7          	jalr	-956(ra) # 80005a84 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80003e48:	0014849b          	addiw	s1,s1,1
    80003e4c:	0ff4f493          	andi	s1,s1,255
    80003e50:	00500793          	li	a5,5
    80003e54:	fc97f0e3          	bgeu	a5,s1,80003e14 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    80003e58:	00005517          	auipc	a0,0x5
    80003e5c:	4b850513          	addi	a0,a0,1208 # 80009310 <CONSOLE_STATUS+0x300>
    80003e60:	00002097          	auipc	ra,0x2
    80003e64:	c24080e7          	jalr	-988(ra) # 80005a84 <_Z11printStringPKc>
    finishedC = true;
    80003e68:	00100793          	li	a5,1
    80003e6c:	00008717          	auipc	a4,0x8
    80003e70:	daf70f23          	sb	a5,-578(a4) # 8000bc2a <_ZL9finishedC>
    thread_dispatch();
    80003e74:	ffffd097          	auipc	ra,0xffffd
    80003e78:	5b4080e7          	jalr	1460(ra) # 80001428 <_Z15thread_dispatchv>
}
    80003e7c:	01813083          	ld	ra,24(sp)
    80003e80:	01013403          	ld	s0,16(sp)
    80003e84:	00813483          	ld	s1,8(sp)
    80003e88:	00013903          	ld	s2,0(sp)
    80003e8c:	02010113          	addi	sp,sp,32
    80003e90:	00008067          	ret

0000000080003e94 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80003e94:	fe010113          	addi	sp,sp,-32
    80003e98:	00113c23          	sd	ra,24(sp)
    80003e9c:	00813823          	sd	s0,16(sp)
    80003ea0:	00913423          	sd	s1,8(sp)
    80003ea4:	01213023          	sd	s2,0(sp)
    80003ea8:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80003eac:	00a00493          	li	s1,10
    80003eb0:	0400006f          	j	80003ef0 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003eb4:	00005517          	auipc	a0,0x5
    80003eb8:	4b450513          	addi	a0,a0,1204 # 80009368 <CONSOLE_STATUS+0x358>
    80003ebc:	00002097          	auipc	ra,0x2
    80003ec0:	bc8080e7          	jalr	-1080(ra) # 80005a84 <_Z11printStringPKc>
    80003ec4:	00000613          	li	a2,0
    80003ec8:	00a00593          	li	a1,10
    80003ecc:	00048513          	mv	a0,s1
    80003ed0:	00002097          	auipc	ra,0x2
    80003ed4:	d64080e7          	jalr	-668(ra) # 80005c34 <_Z8printIntiii>
    80003ed8:	00005517          	auipc	a0,0x5
    80003edc:	69050513          	addi	a0,a0,1680 # 80009568 <CONSOLE_STATUS+0x558>
    80003ee0:	00002097          	auipc	ra,0x2
    80003ee4:	ba4080e7          	jalr	-1116(ra) # 80005a84 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80003ee8:	0014849b          	addiw	s1,s1,1
    80003eec:	0ff4f493          	andi	s1,s1,255
    80003ef0:	00c00793          	li	a5,12
    80003ef4:	fc97f0e3          	bgeu	a5,s1,80003eb4 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80003ef8:	00005517          	auipc	a0,0x5
    80003efc:	47850513          	addi	a0,a0,1144 # 80009370 <CONSOLE_STATUS+0x360>
    80003f00:	00002097          	auipc	ra,0x2
    80003f04:	b84080e7          	jalr	-1148(ra) # 80005a84 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80003f08:	00500313          	li	t1,5
    thread_dispatch();
    80003f0c:	ffffd097          	auipc	ra,0xffffd
    80003f10:	51c080e7          	jalr	1308(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80003f14:	01000513          	li	a0,16
    80003f18:	00000097          	auipc	ra,0x0
    80003f1c:	be8080e7          	jalr	-1048(ra) # 80003b00 <_ZL9fibonaccim>
    80003f20:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80003f24:	00005517          	auipc	a0,0x5
    80003f28:	45c50513          	addi	a0,a0,1116 # 80009380 <CONSOLE_STATUS+0x370>
    80003f2c:	00002097          	auipc	ra,0x2
    80003f30:	b58080e7          	jalr	-1192(ra) # 80005a84 <_Z11printStringPKc>
    80003f34:	00000613          	li	a2,0
    80003f38:	00a00593          	li	a1,10
    80003f3c:	0009051b          	sext.w	a0,s2
    80003f40:	00002097          	auipc	ra,0x2
    80003f44:	cf4080e7          	jalr	-780(ra) # 80005c34 <_Z8printIntiii>
    80003f48:	00005517          	auipc	a0,0x5
    80003f4c:	62050513          	addi	a0,a0,1568 # 80009568 <CONSOLE_STATUS+0x558>
    80003f50:	00002097          	auipc	ra,0x2
    80003f54:	b34080e7          	jalr	-1228(ra) # 80005a84 <_Z11printStringPKc>
    80003f58:	0400006f          	j	80003f98 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003f5c:	00005517          	auipc	a0,0x5
    80003f60:	40c50513          	addi	a0,a0,1036 # 80009368 <CONSOLE_STATUS+0x358>
    80003f64:	00002097          	auipc	ra,0x2
    80003f68:	b20080e7          	jalr	-1248(ra) # 80005a84 <_Z11printStringPKc>
    80003f6c:	00000613          	li	a2,0
    80003f70:	00a00593          	li	a1,10
    80003f74:	00048513          	mv	a0,s1
    80003f78:	00002097          	auipc	ra,0x2
    80003f7c:	cbc080e7          	jalr	-836(ra) # 80005c34 <_Z8printIntiii>
    80003f80:	00005517          	auipc	a0,0x5
    80003f84:	5e850513          	addi	a0,a0,1512 # 80009568 <CONSOLE_STATUS+0x558>
    80003f88:	00002097          	auipc	ra,0x2
    80003f8c:	afc080e7          	jalr	-1284(ra) # 80005a84 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80003f90:	0014849b          	addiw	s1,s1,1
    80003f94:	0ff4f493          	andi	s1,s1,255
    80003f98:	00f00793          	li	a5,15
    80003f9c:	fc97f0e3          	bgeu	a5,s1,80003f5c <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80003fa0:	00005517          	auipc	a0,0x5
    80003fa4:	3f050513          	addi	a0,a0,1008 # 80009390 <CONSOLE_STATUS+0x380>
    80003fa8:	00002097          	auipc	ra,0x2
    80003fac:	adc080e7          	jalr	-1316(ra) # 80005a84 <_Z11printStringPKc>
    finishedD = true;
    80003fb0:	00100793          	li	a5,1
    80003fb4:	00008717          	auipc	a4,0x8
    80003fb8:	c6f70ba3          	sb	a5,-905(a4) # 8000bc2b <_ZL9finishedD>
    thread_dispatch();
    80003fbc:	ffffd097          	auipc	ra,0xffffd
    80003fc0:	46c080e7          	jalr	1132(ra) # 80001428 <_Z15thread_dispatchv>
}
    80003fc4:	01813083          	ld	ra,24(sp)
    80003fc8:	01013403          	ld	s0,16(sp)
    80003fcc:	00813483          	ld	s1,8(sp)
    80003fd0:	00013903          	ld	s2,0(sp)
    80003fd4:	02010113          	addi	sp,sp,32
    80003fd8:	00008067          	ret

0000000080003fdc <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80003fdc:	fc010113          	addi	sp,sp,-64
    80003fe0:	02113c23          	sd	ra,56(sp)
    80003fe4:	02813823          	sd	s0,48(sp)
    80003fe8:	02913423          	sd	s1,40(sp)
    80003fec:	03213023          	sd	s2,32(sp)
    80003ff0:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80003ff4:	02000513          	li	a0,32
    80003ff8:	ffffe097          	auipc	ra,0xffffe
    80003ffc:	664080e7          	jalr	1636(ra) # 8000265c <_Znwm>
    80004000:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80004004:	fffff097          	auipc	ra,0xfffff
    80004008:	8d0080e7          	jalr	-1840(ra) # 800028d4 <_ZN6ThreadC1Ev>
    8000400c:	00008797          	auipc	a5,0x8
    80004010:	8d478793          	addi	a5,a5,-1836 # 8000b8e0 <_ZTV7WorkerA+0x10>
    80004014:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80004018:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    8000401c:	00005517          	auipc	a0,0x5
    80004020:	38450513          	addi	a0,a0,900 # 800093a0 <CONSOLE_STATUS+0x390>
    80004024:	00002097          	auipc	ra,0x2
    80004028:	a60080e7          	jalr	-1440(ra) # 80005a84 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    8000402c:	02000513          	li	a0,32
    80004030:	ffffe097          	auipc	ra,0xffffe
    80004034:	62c080e7          	jalr	1580(ra) # 8000265c <_Znwm>
    80004038:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    8000403c:	fffff097          	auipc	ra,0xfffff
    80004040:	898080e7          	jalr	-1896(ra) # 800028d4 <_ZN6ThreadC1Ev>
    80004044:	00008797          	auipc	a5,0x8
    80004048:	8c478793          	addi	a5,a5,-1852 # 8000b908 <_ZTV7WorkerB+0x10>
    8000404c:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80004050:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80004054:	00005517          	auipc	a0,0x5
    80004058:	36450513          	addi	a0,a0,868 # 800093b8 <CONSOLE_STATUS+0x3a8>
    8000405c:	00002097          	auipc	ra,0x2
    80004060:	a28080e7          	jalr	-1496(ra) # 80005a84 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80004064:	02000513          	li	a0,32
    80004068:	ffffe097          	auipc	ra,0xffffe
    8000406c:	5f4080e7          	jalr	1524(ra) # 8000265c <_Znwm>
    80004070:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80004074:	fffff097          	auipc	ra,0xfffff
    80004078:	860080e7          	jalr	-1952(ra) # 800028d4 <_ZN6ThreadC1Ev>
    8000407c:	00008797          	auipc	a5,0x8
    80004080:	8b478793          	addi	a5,a5,-1868 # 8000b930 <_ZTV7WorkerC+0x10>
    80004084:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80004088:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    8000408c:	00005517          	auipc	a0,0x5
    80004090:	34450513          	addi	a0,a0,836 # 800093d0 <CONSOLE_STATUS+0x3c0>
    80004094:	00002097          	auipc	ra,0x2
    80004098:	9f0080e7          	jalr	-1552(ra) # 80005a84 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    8000409c:	02000513          	li	a0,32
    800040a0:	ffffe097          	auipc	ra,0xffffe
    800040a4:	5bc080e7          	jalr	1468(ra) # 8000265c <_Znwm>
    800040a8:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    800040ac:	fffff097          	auipc	ra,0xfffff
    800040b0:	828080e7          	jalr	-2008(ra) # 800028d4 <_ZN6ThreadC1Ev>
    800040b4:	00008797          	auipc	a5,0x8
    800040b8:	8a478793          	addi	a5,a5,-1884 # 8000b958 <_ZTV7WorkerD+0x10>
    800040bc:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    800040c0:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    800040c4:	00005517          	auipc	a0,0x5
    800040c8:	32450513          	addi	a0,a0,804 # 800093e8 <CONSOLE_STATUS+0x3d8>
    800040cc:	00002097          	auipc	ra,0x2
    800040d0:	9b8080e7          	jalr	-1608(ra) # 80005a84 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    800040d4:	00000493          	li	s1,0
    800040d8:	00300793          	li	a5,3
    800040dc:	0297c663          	blt	a5,s1,80004108 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    800040e0:	00349793          	slli	a5,s1,0x3
    800040e4:	fe040713          	addi	a4,s0,-32
    800040e8:	00f707b3          	add	a5,a4,a5
    800040ec:	fe07b503          	ld	a0,-32(a5)
    800040f0:	ffffe097          	auipc	ra,0xffffe
    800040f4:	71c080e7          	jalr	1820(ra) # 8000280c <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    800040f8:	0014849b          	addiw	s1,s1,1
    800040fc:	fddff06f          	j	800040d8 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80004100:	ffffe097          	auipc	ra,0xffffe
    80004104:	770080e7          	jalr	1904(ra) # 80002870 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80004108:	00008797          	auipc	a5,0x8
    8000410c:	b207c783          	lbu	a5,-1248(a5) # 8000bc28 <_ZL9finishedA>
    80004110:	fe0788e3          	beqz	a5,80004100 <_Z20Threads_CPP_API_testv+0x124>
    80004114:	00008797          	auipc	a5,0x8
    80004118:	b157c783          	lbu	a5,-1259(a5) # 8000bc29 <_ZL9finishedB>
    8000411c:	fe0782e3          	beqz	a5,80004100 <_Z20Threads_CPP_API_testv+0x124>
    80004120:	00008797          	auipc	a5,0x8
    80004124:	b0a7c783          	lbu	a5,-1270(a5) # 8000bc2a <_ZL9finishedC>
    80004128:	fc078ce3          	beqz	a5,80004100 <_Z20Threads_CPP_API_testv+0x124>
    8000412c:	00008797          	auipc	a5,0x8
    80004130:	aff7c783          	lbu	a5,-1281(a5) # 8000bc2b <_ZL9finishedD>
    80004134:	fc0786e3          	beqz	a5,80004100 <_Z20Threads_CPP_API_testv+0x124>
    80004138:	fc040493          	addi	s1,s0,-64
    8000413c:	0080006f          	j	80004144 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    80004140:	00848493          	addi	s1,s1,8
    80004144:	fe040793          	addi	a5,s0,-32
    80004148:	08f48663          	beq	s1,a5,800041d4 <_Z20Threads_CPP_API_testv+0x1f8>
    8000414c:	0004b503          	ld	a0,0(s1)
    80004150:	fe0508e3          	beqz	a0,80004140 <_Z20Threads_CPP_API_testv+0x164>
    80004154:	00053783          	ld	a5,0(a0)
    80004158:	0087b783          	ld	a5,8(a5)
    8000415c:	000780e7          	jalr	a5
    80004160:	fe1ff06f          	j	80004140 <_Z20Threads_CPP_API_testv+0x164>
    80004164:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80004168:	00048513          	mv	a0,s1
    8000416c:	ffffe097          	auipc	ra,0xffffe
    80004170:	540080e7          	jalr	1344(ra) # 800026ac <_ZdlPv>
    80004174:	00090513          	mv	a0,s2
    80004178:	00009097          	auipc	ra,0x9
    8000417c:	bc0080e7          	jalr	-1088(ra) # 8000cd38 <_Unwind_Resume>
    80004180:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80004184:	00048513          	mv	a0,s1
    80004188:	ffffe097          	auipc	ra,0xffffe
    8000418c:	524080e7          	jalr	1316(ra) # 800026ac <_ZdlPv>
    80004190:	00090513          	mv	a0,s2
    80004194:	00009097          	auipc	ra,0x9
    80004198:	ba4080e7          	jalr	-1116(ra) # 8000cd38 <_Unwind_Resume>
    8000419c:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    800041a0:	00048513          	mv	a0,s1
    800041a4:	ffffe097          	auipc	ra,0xffffe
    800041a8:	508080e7          	jalr	1288(ra) # 800026ac <_ZdlPv>
    800041ac:	00090513          	mv	a0,s2
    800041b0:	00009097          	auipc	ra,0x9
    800041b4:	b88080e7          	jalr	-1144(ra) # 8000cd38 <_Unwind_Resume>
    800041b8:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    800041bc:	00048513          	mv	a0,s1
    800041c0:	ffffe097          	auipc	ra,0xffffe
    800041c4:	4ec080e7          	jalr	1260(ra) # 800026ac <_ZdlPv>
    800041c8:	00090513          	mv	a0,s2
    800041cc:	00009097          	auipc	ra,0x9
    800041d0:	b6c080e7          	jalr	-1172(ra) # 8000cd38 <_Unwind_Resume>
}
    800041d4:	03813083          	ld	ra,56(sp)
    800041d8:	03013403          	ld	s0,48(sp)
    800041dc:	02813483          	ld	s1,40(sp)
    800041e0:	02013903          	ld	s2,32(sp)
    800041e4:	04010113          	addi	sp,sp,64
    800041e8:	00008067          	ret

00000000800041ec <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    800041ec:	ff010113          	addi	sp,sp,-16
    800041f0:	00113423          	sd	ra,8(sp)
    800041f4:	00813023          	sd	s0,0(sp)
    800041f8:	01010413          	addi	s0,sp,16
    800041fc:	00007797          	auipc	a5,0x7
    80004200:	6e478793          	addi	a5,a5,1764 # 8000b8e0 <_ZTV7WorkerA+0x10>
    80004204:	00f53023          	sd	a5,0(a0)
    80004208:	ffffe097          	auipc	ra,0xffffe
    8000420c:	3a8080e7          	jalr	936(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80004210:	00813083          	ld	ra,8(sp)
    80004214:	00013403          	ld	s0,0(sp)
    80004218:	01010113          	addi	sp,sp,16
    8000421c:	00008067          	ret

0000000080004220 <_ZN7WorkerAD0Ev>:
    80004220:	fe010113          	addi	sp,sp,-32
    80004224:	00113c23          	sd	ra,24(sp)
    80004228:	00813823          	sd	s0,16(sp)
    8000422c:	00913423          	sd	s1,8(sp)
    80004230:	02010413          	addi	s0,sp,32
    80004234:	00050493          	mv	s1,a0
    80004238:	00007797          	auipc	a5,0x7
    8000423c:	6a878793          	addi	a5,a5,1704 # 8000b8e0 <_ZTV7WorkerA+0x10>
    80004240:	00f53023          	sd	a5,0(a0)
    80004244:	ffffe097          	auipc	ra,0xffffe
    80004248:	36c080e7          	jalr	876(ra) # 800025b0 <_ZN6ThreadD1Ev>
    8000424c:	00048513          	mv	a0,s1
    80004250:	ffffe097          	auipc	ra,0xffffe
    80004254:	45c080e7          	jalr	1116(ra) # 800026ac <_ZdlPv>
    80004258:	01813083          	ld	ra,24(sp)
    8000425c:	01013403          	ld	s0,16(sp)
    80004260:	00813483          	ld	s1,8(sp)
    80004264:	02010113          	addi	sp,sp,32
    80004268:	00008067          	ret

000000008000426c <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    8000426c:	ff010113          	addi	sp,sp,-16
    80004270:	00113423          	sd	ra,8(sp)
    80004274:	00813023          	sd	s0,0(sp)
    80004278:	01010413          	addi	s0,sp,16
    8000427c:	00007797          	auipc	a5,0x7
    80004280:	68c78793          	addi	a5,a5,1676 # 8000b908 <_ZTV7WorkerB+0x10>
    80004284:	00f53023          	sd	a5,0(a0)
    80004288:	ffffe097          	auipc	ra,0xffffe
    8000428c:	328080e7          	jalr	808(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80004290:	00813083          	ld	ra,8(sp)
    80004294:	00013403          	ld	s0,0(sp)
    80004298:	01010113          	addi	sp,sp,16
    8000429c:	00008067          	ret

00000000800042a0 <_ZN7WorkerBD0Ev>:
    800042a0:	fe010113          	addi	sp,sp,-32
    800042a4:	00113c23          	sd	ra,24(sp)
    800042a8:	00813823          	sd	s0,16(sp)
    800042ac:	00913423          	sd	s1,8(sp)
    800042b0:	02010413          	addi	s0,sp,32
    800042b4:	00050493          	mv	s1,a0
    800042b8:	00007797          	auipc	a5,0x7
    800042bc:	65078793          	addi	a5,a5,1616 # 8000b908 <_ZTV7WorkerB+0x10>
    800042c0:	00f53023          	sd	a5,0(a0)
    800042c4:	ffffe097          	auipc	ra,0xffffe
    800042c8:	2ec080e7          	jalr	748(ra) # 800025b0 <_ZN6ThreadD1Ev>
    800042cc:	00048513          	mv	a0,s1
    800042d0:	ffffe097          	auipc	ra,0xffffe
    800042d4:	3dc080e7          	jalr	988(ra) # 800026ac <_ZdlPv>
    800042d8:	01813083          	ld	ra,24(sp)
    800042dc:	01013403          	ld	s0,16(sp)
    800042e0:	00813483          	ld	s1,8(sp)
    800042e4:	02010113          	addi	sp,sp,32
    800042e8:	00008067          	ret

00000000800042ec <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    800042ec:	ff010113          	addi	sp,sp,-16
    800042f0:	00113423          	sd	ra,8(sp)
    800042f4:	00813023          	sd	s0,0(sp)
    800042f8:	01010413          	addi	s0,sp,16
    800042fc:	00007797          	auipc	a5,0x7
    80004300:	63478793          	addi	a5,a5,1588 # 8000b930 <_ZTV7WorkerC+0x10>
    80004304:	00f53023          	sd	a5,0(a0)
    80004308:	ffffe097          	auipc	ra,0xffffe
    8000430c:	2a8080e7          	jalr	680(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80004310:	00813083          	ld	ra,8(sp)
    80004314:	00013403          	ld	s0,0(sp)
    80004318:	01010113          	addi	sp,sp,16
    8000431c:	00008067          	ret

0000000080004320 <_ZN7WorkerCD0Ev>:
    80004320:	fe010113          	addi	sp,sp,-32
    80004324:	00113c23          	sd	ra,24(sp)
    80004328:	00813823          	sd	s0,16(sp)
    8000432c:	00913423          	sd	s1,8(sp)
    80004330:	02010413          	addi	s0,sp,32
    80004334:	00050493          	mv	s1,a0
    80004338:	00007797          	auipc	a5,0x7
    8000433c:	5f878793          	addi	a5,a5,1528 # 8000b930 <_ZTV7WorkerC+0x10>
    80004340:	00f53023          	sd	a5,0(a0)
    80004344:	ffffe097          	auipc	ra,0xffffe
    80004348:	26c080e7          	jalr	620(ra) # 800025b0 <_ZN6ThreadD1Ev>
    8000434c:	00048513          	mv	a0,s1
    80004350:	ffffe097          	auipc	ra,0xffffe
    80004354:	35c080e7          	jalr	860(ra) # 800026ac <_ZdlPv>
    80004358:	01813083          	ld	ra,24(sp)
    8000435c:	01013403          	ld	s0,16(sp)
    80004360:	00813483          	ld	s1,8(sp)
    80004364:	02010113          	addi	sp,sp,32
    80004368:	00008067          	ret

000000008000436c <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    8000436c:	ff010113          	addi	sp,sp,-16
    80004370:	00113423          	sd	ra,8(sp)
    80004374:	00813023          	sd	s0,0(sp)
    80004378:	01010413          	addi	s0,sp,16
    8000437c:	00007797          	auipc	a5,0x7
    80004380:	5dc78793          	addi	a5,a5,1500 # 8000b958 <_ZTV7WorkerD+0x10>
    80004384:	00f53023          	sd	a5,0(a0)
    80004388:	ffffe097          	auipc	ra,0xffffe
    8000438c:	228080e7          	jalr	552(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80004390:	00813083          	ld	ra,8(sp)
    80004394:	00013403          	ld	s0,0(sp)
    80004398:	01010113          	addi	sp,sp,16
    8000439c:	00008067          	ret

00000000800043a0 <_ZN7WorkerDD0Ev>:
    800043a0:	fe010113          	addi	sp,sp,-32
    800043a4:	00113c23          	sd	ra,24(sp)
    800043a8:	00813823          	sd	s0,16(sp)
    800043ac:	00913423          	sd	s1,8(sp)
    800043b0:	02010413          	addi	s0,sp,32
    800043b4:	00050493          	mv	s1,a0
    800043b8:	00007797          	auipc	a5,0x7
    800043bc:	5a078793          	addi	a5,a5,1440 # 8000b958 <_ZTV7WorkerD+0x10>
    800043c0:	00f53023          	sd	a5,0(a0)
    800043c4:	ffffe097          	auipc	ra,0xffffe
    800043c8:	1ec080e7          	jalr	492(ra) # 800025b0 <_ZN6ThreadD1Ev>
    800043cc:	00048513          	mv	a0,s1
    800043d0:	ffffe097          	auipc	ra,0xffffe
    800043d4:	2dc080e7          	jalr	732(ra) # 800026ac <_ZdlPv>
    800043d8:	01813083          	ld	ra,24(sp)
    800043dc:	01013403          	ld	s0,16(sp)
    800043e0:	00813483          	ld	s1,8(sp)
    800043e4:	02010113          	addi	sp,sp,32
    800043e8:	00008067          	ret

00000000800043ec <_ZN7WorkerA3runEv>:
    void run() override {
    800043ec:	ff010113          	addi	sp,sp,-16
    800043f0:	00113423          	sd	ra,8(sp)
    800043f4:	00813023          	sd	s0,0(sp)
    800043f8:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    800043fc:	00000593          	li	a1,0
    80004400:	fffff097          	auipc	ra,0xfffff
    80004404:	774080e7          	jalr	1908(ra) # 80003b74 <_ZN7WorkerA11workerBodyAEPv>
    }
    80004408:	00813083          	ld	ra,8(sp)
    8000440c:	00013403          	ld	s0,0(sp)
    80004410:	01010113          	addi	sp,sp,16
    80004414:	00008067          	ret

0000000080004418 <_ZN7WorkerB3runEv>:
    void run() override {
    80004418:	ff010113          	addi	sp,sp,-16
    8000441c:	00113423          	sd	ra,8(sp)
    80004420:	00813023          	sd	s0,0(sp)
    80004424:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80004428:	00000593          	li	a1,0
    8000442c:	00000097          	auipc	ra,0x0
    80004430:	814080e7          	jalr	-2028(ra) # 80003c40 <_ZN7WorkerB11workerBodyBEPv>
    }
    80004434:	00813083          	ld	ra,8(sp)
    80004438:	00013403          	ld	s0,0(sp)
    8000443c:	01010113          	addi	sp,sp,16
    80004440:	00008067          	ret

0000000080004444 <_ZN7WorkerC3runEv>:
    void run() override {
    80004444:	ff010113          	addi	sp,sp,-16
    80004448:	00113423          	sd	ra,8(sp)
    8000444c:	00813023          	sd	s0,0(sp)
    80004450:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80004454:	00000593          	li	a1,0
    80004458:	00000097          	auipc	ra,0x0
    8000445c:	8bc080e7          	jalr	-1860(ra) # 80003d14 <_ZN7WorkerC11workerBodyCEPv>
    }
    80004460:	00813083          	ld	ra,8(sp)
    80004464:	00013403          	ld	s0,0(sp)
    80004468:	01010113          	addi	sp,sp,16
    8000446c:	00008067          	ret

0000000080004470 <_ZN7WorkerD3runEv>:
    void run() override {
    80004470:	ff010113          	addi	sp,sp,-16
    80004474:	00113423          	sd	ra,8(sp)
    80004478:	00813023          	sd	s0,0(sp)
    8000447c:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80004480:	00000593          	li	a1,0
    80004484:	00000097          	auipc	ra,0x0
    80004488:	a10080e7          	jalr	-1520(ra) # 80003e94 <_ZN7WorkerD11workerBodyDEPv>
    }
    8000448c:	00813083          	ld	ra,8(sp)
    80004490:	00013403          	ld	s0,0(sp)
    80004494:	01010113          	addi	sp,sp,16
    80004498:	00008067          	ret

000000008000449c <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    8000449c:	f8010113          	addi	sp,sp,-128
    800044a0:	06113c23          	sd	ra,120(sp)
    800044a4:	06813823          	sd	s0,112(sp)
    800044a8:	06913423          	sd	s1,104(sp)
    800044ac:	07213023          	sd	s2,96(sp)
    800044b0:	05313c23          	sd	s3,88(sp)
    800044b4:	05413823          	sd	s4,80(sp)
    800044b8:	05513423          	sd	s5,72(sp)
    800044bc:	05613023          	sd	s6,64(sp)
    800044c0:	03713c23          	sd	s7,56(sp)
    800044c4:	03813823          	sd	s8,48(sp)
    800044c8:	03913423          	sd	s9,40(sp)
    800044cc:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    800044d0:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    800044d4:	00005517          	auipc	a0,0x5
    800044d8:	d4c50513          	addi	a0,a0,-692 # 80009220 <CONSOLE_STATUS+0x210>
    800044dc:	00001097          	auipc	ra,0x1
    800044e0:	5a8080e7          	jalr	1448(ra) # 80005a84 <_Z11printStringPKc>
    getString(input, 30);
    800044e4:	01e00593          	li	a1,30
    800044e8:	f8040493          	addi	s1,s0,-128
    800044ec:	00048513          	mv	a0,s1
    800044f0:	00001097          	auipc	ra,0x1
    800044f4:	61c080e7          	jalr	1564(ra) # 80005b0c <_Z9getStringPci>
    threadNum = stringToInt(input);
    800044f8:	00048513          	mv	a0,s1
    800044fc:	00001097          	auipc	ra,0x1
    80004500:	6e8080e7          	jalr	1768(ra) # 80005be4 <_Z11stringToIntPKc>
    80004504:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    80004508:	00005517          	auipc	a0,0x5
    8000450c:	d3850513          	addi	a0,a0,-712 # 80009240 <CONSOLE_STATUS+0x230>
    80004510:	00001097          	auipc	ra,0x1
    80004514:	574080e7          	jalr	1396(ra) # 80005a84 <_Z11printStringPKc>
    getString(input, 30);
    80004518:	01e00593          	li	a1,30
    8000451c:	00048513          	mv	a0,s1
    80004520:	00001097          	auipc	ra,0x1
    80004524:	5ec080e7          	jalr	1516(ra) # 80005b0c <_Z9getStringPci>
    n = stringToInt(input);
    80004528:	00048513          	mv	a0,s1
    8000452c:	00001097          	auipc	ra,0x1
    80004530:	6b8080e7          	jalr	1720(ra) # 80005be4 <_Z11stringToIntPKc>
    80004534:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80004538:	00005517          	auipc	a0,0x5
    8000453c:	d2850513          	addi	a0,a0,-728 # 80009260 <CONSOLE_STATUS+0x250>
    80004540:	00001097          	auipc	ra,0x1
    80004544:	544080e7          	jalr	1348(ra) # 80005a84 <_Z11printStringPKc>
    printInt(threadNum);
    80004548:	00000613          	li	a2,0
    8000454c:	00a00593          	li	a1,10
    80004550:	00098513          	mv	a0,s3
    80004554:	00001097          	auipc	ra,0x1
    80004558:	6e0080e7          	jalr	1760(ra) # 80005c34 <_Z8printIntiii>
    printString(" i velicina bafera ");
    8000455c:	00005517          	auipc	a0,0x5
    80004560:	d1c50513          	addi	a0,a0,-740 # 80009278 <CONSOLE_STATUS+0x268>
    80004564:	00001097          	auipc	ra,0x1
    80004568:	520080e7          	jalr	1312(ra) # 80005a84 <_Z11printStringPKc>
    printInt(n);
    8000456c:	00000613          	li	a2,0
    80004570:	00a00593          	li	a1,10
    80004574:	00048513          	mv	a0,s1
    80004578:	00001097          	auipc	ra,0x1
    8000457c:	6bc080e7          	jalr	1724(ra) # 80005c34 <_Z8printIntiii>
    printString(".\n");
    80004580:	00005517          	auipc	a0,0x5
    80004584:	d1050513          	addi	a0,a0,-752 # 80009290 <CONSOLE_STATUS+0x280>
    80004588:	00001097          	auipc	ra,0x1
    8000458c:	4fc080e7          	jalr	1276(ra) # 80005a84 <_Z11printStringPKc>
    if (threadNum > n) {
    80004590:	0334c463          	blt	s1,s3,800045b8 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    80004594:	03305c63          	blez	s3,800045cc <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80004598:	03800513          	li	a0,56
    8000459c:	ffffe097          	auipc	ra,0xffffe
    800045a0:	0c0080e7          	jalr	192(ra) # 8000265c <_Znwm>
    800045a4:	00050a93          	mv	s5,a0
    800045a8:	00048593          	mv	a1,s1
    800045ac:	00001097          	auipc	ra,0x1
    800045b0:	7a8080e7          	jalr	1960(ra) # 80005d54 <_ZN9BufferCPPC1Ei>
    800045b4:	0300006f          	j	800045e4 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800045b8:	00005517          	auipc	a0,0x5
    800045bc:	ce050513          	addi	a0,a0,-800 # 80009298 <CONSOLE_STATUS+0x288>
    800045c0:	00001097          	auipc	ra,0x1
    800045c4:	4c4080e7          	jalr	1220(ra) # 80005a84 <_Z11printStringPKc>
        return;
    800045c8:	0140006f          	j	800045dc <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800045cc:	00005517          	auipc	a0,0x5
    800045d0:	d0c50513          	addi	a0,a0,-756 # 800092d8 <CONSOLE_STATUS+0x2c8>
    800045d4:	00001097          	auipc	ra,0x1
    800045d8:	4b0080e7          	jalr	1200(ra) # 80005a84 <_Z11printStringPKc>
        return;
    800045dc:	000c0113          	mv	sp,s8
    800045e0:	2140006f          	j	800047f4 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    800045e4:	01000513          	li	a0,16
    800045e8:	ffffe097          	auipc	ra,0xffffe
    800045ec:	074080e7          	jalr	116(ra) # 8000265c <_Znwm>
    800045f0:	00050913          	mv	s2,a0
    800045f4:	00000593          	li	a1,0
    800045f8:	ffffe097          	auipc	ra,0xffffe
    800045fc:	358080e7          	jalr	856(ra) # 80002950 <_ZN9SemaphoreC1Ej>
    80004600:	00007797          	auipc	a5,0x7
    80004604:	6327bc23          	sd	s2,1592(a5) # 8000bc38 <_ZL10waitForAll>
    Thread *producers[threadNum];
    80004608:	00399793          	slli	a5,s3,0x3
    8000460c:	00f78793          	addi	a5,a5,15
    80004610:	ff07f793          	andi	a5,a5,-16
    80004614:	40f10133          	sub	sp,sp,a5
    80004618:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    8000461c:	0019871b          	addiw	a4,s3,1
    80004620:	00171793          	slli	a5,a4,0x1
    80004624:	00e787b3          	add	a5,a5,a4
    80004628:	00379793          	slli	a5,a5,0x3
    8000462c:	00f78793          	addi	a5,a5,15
    80004630:	ff07f793          	andi	a5,a5,-16
    80004634:	40f10133          	sub	sp,sp,a5
    80004638:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    8000463c:	00199493          	slli	s1,s3,0x1
    80004640:	013484b3          	add	s1,s1,s3
    80004644:	00349493          	slli	s1,s1,0x3
    80004648:	009b04b3          	add	s1,s6,s1
    8000464c:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80004650:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80004654:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004658:	02800513          	li	a0,40
    8000465c:	ffffe097          	auipc	ra,0xffffe
    80004660:	000080e7          	jalr	ra # 8000265c <_Znwm>
    80004664:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80004668:	ffffe097          	auipc	ra,0xffffe
    8000466c:	26c080e7          	jalr	620(ra) # 800028d4 <_ZN6ThreadC1Ev>
    80004670:	00007797          	auipc	a5,0x7
    80004674:	36078793          	addi	a5,a5,864 # 8000b9d0 <_ZTV8Consumer+0x10>
    80004678:	00fbb023          	sd	a5,0(s7)
    8000467c:	029bb023          	sd	s1,32(s7)
    consumer->start();
    80004680:	000b8513          	mv	a0,s7
    80004684:	ffffe097          	auipc	ra,0xffffe
    80004688:	188080e7          	jalr	392(ra) # 8000280c <_ZN6Thread5startEv>
    threadData[0].id = 0;
    8000468c:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    80004690:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    80004694:	00007797          	auipc	a5,0x7
    80004698:	5a47b783          	ld	a5,1444(a5) # 8000bc38 <_ZL10waitForAll>
    8000469c:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800046a0:	02800513          	li	a0,40
    800046a4:	ffffe097          	auipc	ra,0xffffe
    800046a8:	fb8080e7          	jalr	-72(ra) # 8000265c <_Znwm>
    800046ac:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    800046b0:	ffffe097          	auipc	ra,0xffffe
    800046b4:	224080e7          	jalr	548(ra) # 800028d4 <_ZN6ThreadC1Ev>
    800046b8:	00007797          	auipc	a5,0x7
    800046bc:	2c878793          	addi	a5,a5,712 # 8000b980 <_ZTV16ProducerKeyborad+0x10>
    800046c0:	00f4b023          	sd	a5,0(s1)
    800046c4:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800046c8:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    800046cc:	00048513          	mv	a0,s1
    800046d0:	ffffe097          	auipc	ra,0xffffe
    800046d4:	13c080e7          	jalr	316(ra) # 8000280c <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    800046d8:	00100913          	li	s2,1
    800046dc:	0300006f          	j	8000470c <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    800046e0:	00007797          	auipc	a5,0x7
    800046e4:	2c878793          	addi	a5,a5,712 # 8000b9a8 <_ZTV8Producer+0x10>
    800046e8:	00fcb023          	sd	a5,0(s9)
    800046ec:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    800046f0:	00391793          	slli	a5,s2,0x3
    800046f4:	00fa07b3          	add	a5,s4,a5
    800046f8:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    800046fc:	000c8513          	mv	a0,s9
    80004700:	ffffe097          	auipc	ra,0xffffe
    80004704:	10c080e7          	jalr	268(ra) # 8000280c <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004708:	0019091b          	addiw	s2,s2,1
    8000470c:	05395263          	bge	s2,s3,80004750 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80004710:	00191493          	slli	s1,s2,0x1
    80004714:	012484b3          	add	s1,s1,s2
    80004718:	00349493          	slli	s1,s1,0x3
    8000471c:	009b04b3          	add	s1,s6,s1
    80004720:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80004724:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80004728:	00007797          	auipc	a5,0x7
    8000472c:	5107b783          	ld	a5,1296(a5) # 8000bc38 <_ZL10waitForAll>
    80004730:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80004734:	02800513          	li	a0,40
    80004738:	ffffe097          	auipc	ra,0xffffe
    8000473c:	f24080e7          	jalr	-220(ra) # 8000265c <_Znwm>
    80004740:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004744:	ffffe097          	auipc	ra,0xffffe
    80004748:	190080e7          	jalr	400(ra) # 800028d4 <_ZN6ThreadC1Ev>
    8000474c:	f95ff06f          	j	800046e0 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    80004750:	ffffe097          	auipc	ra,0xffffe
    80004754:	120080e7          	jalr	288(ra) # 80002870 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80004758:	00000493          	li	s1,0
    8000475c:	0099ce63          	blt	s3,s1,80004778 <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    80004760:	00007517          	auipc	a0,0x7
    80004764:	4d853503          	ld	a0,1240(a0) # 8000bc38 <_ZL10waitForAll>
    80004768:	ffffe097          	auipc	ra,0xffffe
    8000476c:	220080e7          	jalr	544(ra) # 80002988 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80004770:	0014849b          	addiw	s1,s1,1
    80004774:	fe9ff06f          	j	8000475c <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    80004778:	00007517          	auipc	a0,0x7
    8000477c:	4c053503          	ld	a0,1216(a0) # 8000bc38 <_ZL10waitForAll>
    80004780:	00050863          	beqz	a0,80004790 <_Z20testConsumerProducerv+0x2f4>
    80004784:	00053783          	ld	a5,0(a0)
    80004788:	0087b783          	ld	a5,8(a5)
    8000478c:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    80004790:	00000493          	li	s1,0
    80004794:	0080006f          	j	8000479c <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    80004798:	0014849b          	addiw	s1,s1,1
    8000479c:	0334d263          	bge	s1,s3,800047c0 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    800047a0:	00349793          	slli	a5,s1,0x3
    800047a4:	00fa07b3          	add	a5,s4,a5
    800047a8:	0007b503          	ld	a0,0(a5)
    800047ac:	fe0506e3          	beqz	a0,80004798 <_Z20testConsumerProducerv+0x2fc>
    800047b0:	00053783          	ld	a5,0(a0)
    800047b4:	0087b783          	ld	a5,8(a5)
    800047b8:	000780e7          	jalr	a5
    800047bc:	fddff06f          	j	80004798 <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    800047c0:	000b8a63          	beqz	s7,800047d4 <_Z20testConsumerProducerv+0x338>
    800047c4:	000bb783          	ld	a5,0(s7)
    800047c8:	0087b783          	ld	a5,8(a5)
    800047cc:	000b8513          	mv	a0,s7
    800047d0:	000780e7          	jalr	a5
    delete buffer;
    800047d4:	000a8e63          	beqz	s5,800047f0 <_Z20testConsumerProducerv+0x354>
    800047d8:	000a8513          	mv	a0,s5
    800047dc:	00002097          	auipc	ra,0x2
    800047e0:	870080e7          	jalr	-1936(ra) # 8000604c <_ZN9BufferCPPD1Ev>
    800047e4:	000a8513          	mv	a0,s5
    800047e8:	ffffe097          	auipc	ra,0xffffe
    800047ec:	ec4080e7          	jalr	-316(ra) # 800026ac <_ZdlPv>
    800047f0:	000c0113          	mv	sp,s8
}
    800047f4:	f8040113          	addi	sp,s0,-128
    800047f8:	07813083          	ld	ra,120(sp)
    800047fc:	07013403          	ld	s0,112(sp)
    80004800:	06813483          	ld	s1,104(sp)
    80004804:	06013903          	ld	s2,96(sp)
    80004808:	05813983          	ld	s3,88(sp)
    8000480c:	05013a03          	ld	s4,80(sp)
    80004810:	04813a83          	ld	s5,72(sp)
    80004814:	04013b03          	ld	s6,64(sp)
    80004818:	03813b83          	ld	s7,56(sp)
    8000481c:	03013c03          	ld	s8,48(sp)
    80004820:	02813c83          	ld	s9,40(sp)
    80004824:	08010113          	addi	sp,sp,128
    80004828:	00008067          	ret
    8000482c:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80004830:	000a8513          	mv	a0,s5
    80004834:	ffffe097          	auipc	ra,0xffffe
    80004838:	e78080e7          	jalr	-392(ra) # 800026ac <_ZdlPv>
    8000483c:	00048513          	mv	a0,s1
    80004840:	00008097          	auipc	ra,0x8
    80004844:	4f8080e7          	jalr	1272(ra) # 8000cd38 <_Unwind_Resume>
    80004848:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    8000484c:	00090513          	mv	a0,s2
    80004850:	ffffe097          	auipc	ra,0xffffe
    80004854:	e5c080e7          	jalr	-420(ra) # 800026ac <_ZdlPv>
    80004858:	00048513          	mv	a0,s1
    8000485c:	00008097          	auipc	ra,0x8
    80004860:	4dc080e7          	jalr	1244(ra) # 8000cd38 <_Unwind_Resume>
    80004864:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004868:	000b8513          	mv	a0,s7
    8000486c:	ffffe097          	auipc	ra,0xffffe
    80004870:	e40080e7          	jalr	-448(ra) # 800026ac <_ZdlPv>
    80004874:	00048513          	mv	a0,s1
    80004878:	00008097          	auipc	ra,0x8
    8000487c:	4c0080e7          	jalr	1216(ra) # 8000cd38 <_Unwind_Resume>
    80004880:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004884:	00048513          	mv	a0,s1
    80004888:	ffffe097          	auipc	ra,0xffffe
    8000488c:	e24080e7          	jalr	-476(ra) # 800026ac <_ZdlPv>
    80004890:	00090513          	mv	a0,s2
    80004894:	00008097          	auipc	ra,0x8
    80004898:	4a4080e7          	jalr	1188(ra) # 8000cd38 <_Unwind_Resume>
    8000489c:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    800048a0:	000c8513          	mv	a0,s9
    800048a4:	ffffe097          	auipc	ra,0xffffe
    800048a8:	e08080e7          	jalr	-504(ra) # 800026ac <_ZdlPv>
    800048ac:	00048513          	mv	a0,s1
    800048b0:	00008097          	auipc	ra,0x8
    800048b4:	488080e7          	jalr	1160(ra) # 8000cd38 <_Unwind_Resume>

00000000800048b8 <_ZN8Consumer3runEv>:
    void run() override {
    800048b8:	fd010113          	addi	sp,sp,-48
    800048bc:	02113423          	sd	ra,40(sp)
    800048c0:	02813023          	sd	s0,32(sp)
    800048c4:	00913c23          	sd	s1,24(sp)
    800048c8:	01213823          	sd	s2,16(sp)
    800048cc:	01313423          	sd	s3,8(sp)
    800048d0:	03010413          	addi	s0,sp,48
    800048d4:	00050913          	mv	s2,a0
        int i = 0;
    800048d8:	00000993          	li	s3,0
    800048dc:	0100006f          	j	800048ec <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    800048e0:	00a00513          	li	a0,10
    800048e4:	ffffe097          	auipc	ra,0xffffe
    800048e8:	17c080e7          	jalr	380(ra) # 80002a60 <_ZN7Console4putcEc>
        while (!threadEnd) {
    800048ec:	00007797          	auipc	a5,0x7
    800048f0:	3447a783          	lw	a5,836(a5) # 8000bc30 <_ZL9threadEnd>
    800048f4:	04079a63          	bnez	a5,80004948 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    800048f8:	02093783          	ld	a5,32(s2)
    800048fc:	0087b503          	ld	a0,8(a5)
    80004900:	00001097          	auipc	ra,0x1
    80004904:	638080e7          	jalr	1592(ra) # 80005f38 <_ZN9BufferCPP3getEv>
            i++;
    80004908:	0019849b          	addiw	s1,s3,1
    8000490c:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80004910:	0ff57513          	andi	a0,a0,255
    80004914:	ffffe097          	auipc	ra,0xffffe
    80004918:	14c080e7          	jalr	332(ra) # 80002a60 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    8000491c:	05000793          	li	a5,80
    80004920:	02f4e4bb          	remw	s1,s1,a5
    80004924:	fc0494e3          	bnez	s1,800048ec <_ZN8Consumer3runEv+0x34>
    80004928:	fb9ff06f          	j	800048e0 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    8000492c:	02093783          	ld	a5,32(s2)
    80004930:	0087b503          	ld	a0,8(a5)
    80004934:	00001097          	auipc	ra,0x1
    80004938:	604080e7          	jalr	1540(ra) # 80005f38 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    8000493c:	0ff57513          	andi	a0,a0,255
    80004940:	ffffe097          	auipc	ra,0xffffe
    80004944:	120080e7          	jalr	288(ra) # 80002a60 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80004948:	02093783          	ld	a5,32(s2)
    8000494c:	0087b503          	ld	a0,8(a5)
    80004950:	00001097          	auipc	ra,0x1
    80004954:	674080e7          	jalr	1652(ra) # 80005fc4 <_ZN9BufferCPP6getCntEv>
    80004958:	fca04ae3          	bgtz	a0,8000492c <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    8000495c:	02093783          	ld	a5,32(s2)
    80004960:	0107b503          	ld	a0,16(a5)
    80004964:	ffffe097          	auipc	ra,0xffffe
    80004968:	050080e7          	jalr	80(ra) # 800029b4 <_ZN9Semaphore6signalEv>
    }
    8000496c:	02813083          	ld	ra,40(sp)
    80004970:	02013403          	ld	s0,32(sp)
    80004974:	01813483          	ld	s1,24(sp)
    80004978:	01013903          	ld	s2,16(sp)
    8000497c:	00813983          	ld	s3,8(sp)
    80004980:	03010113          	addi	sp,sp,48
    80004984:	00008067          	ret

0000000080004988 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80004988:	ff010113          	addi	sp,sp,-16
    8000498c:	00113423          	sd	ra,8(sp)
    80004990:	00813023          	sd	s0,0(sp)
    80004994:	01010413          	addi	s0,sp,16
    80004998:	00007797          	auipc	a5,0x7
    8000499c:	03878793          	addi	a5,a5,56 # 8000b9d0 <_ZTV8Consumer+0x10>
    800049a0:	00f53023          	sd	a5,0(a0)
    800049a4:	ffffe097          	auipc	ra,0xffffe
    800049a8:	c0c080e7          	jalr	-1012(ra) # 800025b0 <_ZN6ThreadD1Ev>
    800049ac:	00813083          	ld	ra,8(sp)
    800049b0:	00013403          	ld	s0,0(sp)
    800049b4:	01010113          	addi	sp,sp,16
    800049b8:	00008067          	ret

00000000800049bc <_ZN8ConsumerD0Ev>:
    800049bc:	fe010113          	addi	sp,sp,-32
    800049c0:	00113c23          	sd	ra,24(sp)
    800049c4:	00813823          	sd	s0,16(sp)
    800049c8:	00913423          	sd	s1,8(sp)
    800049cc:	02010413          	addi	s0,sp,32
    800049d0:	00050493          	mv	s1,a0
    800049d4:	00007797          	auipc	a5,0x7
    800049d8:	ffc78793          	addi	a5,a5,-4 # 8000b9d0 <_ZTV8Consumer+0x10>
    800049dc:	00f53023          	sd	a5,0(a0)
    800049e0:	ffffe097          	auipc	ra,0xffffe
    800049e4:	bd0080e7          	jalr	-1072(ra) # 800025b0 <_ZN6ThreadD1Ev>
    800049e8:	00048513          	mv	a0,s1
    800049ec:	ffffe097          	auipc	ra,0xffffe
    800049f0:	cc0080e7          	jalr	-832(ra) # 800026ac <_ZdlPv>
    800049f4:	01813083          	ld	ra,24(sp)
    800049f8:	01013403          	ld	s0,16(sp)
    800049fc:	00813483          	ld	s1,8(sp)
    80004a00:	02010113          	addi	sp,sp,32
    80004a04:	00008067          	ret

0000000080004a08 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80004a08:	ff010113          	addi	sp,sp,-16
    80004a0c:	00113423          	sd	ra,8(sp)
    80004a10:	00813023          	sd	s0,0(sp)
    80004a14:	01010413          	addi	s0,sp,16
    80004a18:	00007797          	auipc	a5,0x7
    80004a1c:	f6878793          	addi	a5,a5,-152 # 8000b980 <_ZTV16ProducerKeyborad+0x10>
    80004a20:	00f53023          	sd	a5,0(a0)
    80004a24:	ffffe097          	auipc	ra,0xffffe
    80004a28:	b8c080e7          	jalr	-1140(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80004a2c:	00813083          	ld	ra,8(sp)
    80004a30:	00013403          	ld	s0,0(sp)
    80004a34:	01010113          	addi	sp,sp,16
    80004a38:	00008067          	ret

0000000080004a3c <_ZN16ProducerKeyboradD0Ev>:
    80004a3c:	fe010113          	addi	sp,sp,-32
    80004a40:	00113c23          	sd	ra,24(sp)
    80004a44:	00813823          	sd	s0,16(sp)
    80004a48:	00913423          	sd	s1,8(sp)
    80004a4c:	02010413          	addi	s0,sp,32
    80004a50:	00050493          	mv	s1,a0
    80004a54:	00007797          	auipc	a5,0x7
    80004a58:	f2c78793          	addi	a5,a5,-212 # 8000b980 <_ZTV16ProducerKeyborad+0x10>
    80004a5c:	00f53023          	sd	a5,0(a0)
    80004a60:	ffffe097          	auipc	ra,0xffffe
    80004a64:	b50080e7          	jalr	-1200(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80004a68:	00048513          	mv	a0,s1
    80004a6c:	ffffe097          	auipc	ra,0xffffe
    80004a70:	c40080e7          	jalr	-960(ra) # 800026ac <_ZdlPv>
    80004a74:	01813083          	ld	ra,24(sp)
    80004a78:	01013403          	ld	s0,16(sp)
    80004a7c:	00813483          	ld	s1,8(sp)
    80004a80:	02010113          	addi	sp,sp,32
    80004a84:	00008067          	ret

0000000080004a88 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80004a88:	ff010113          	addi	sp,sp,-16
    80004a8c:	00113423          	sd	ra,8(sp)
    80004a90:	00813023          	sd	s0,0(sp)
    80004a94:	01010413          	addi	s0,sp,16
    80004a98:	00007797          	auipc	a5,0x7
    80004a9c:	f1078793          	addi	a5,a5,-240 # 8000b9a8 <_ZTV8Producer+0x10>
    80004aa0:	00f53023          	sd	a5,0(a0)
    80004aa4:	ffffe097          	auipc	ra,0xffffe
    80004aa8:	b0c080e7          	jalr	-1268(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80004aac:	00813083          	ld	ra,8(sp)
    80004ab0:	00013403          	ld	s0,0(sp)
    80004ab4:	01010113          	addi	sp,sp,16
    80004ab8:	00008067          	ret

0000000080004abc <_ZN8ProducerD0Ev>:
    80004abc:	fe010113          	addi	sp,sp,-32
    80004ac0:	00113c23          	sd	ra,24(sp)
    80004ac4:	00813823          	sd	s0,16(sp)
    80004ac8:	00913423          	sd	s1,8(sp)
    80004acc:	02010413          	addi	s0,sp,32
    80004ad0:	00050493          	mv	s1,a0
    80004ad4:	00007797          	auipc	a5,0x7
    80004ad8:	ed478793          	addi	a5,a5,-300 # 8000b9a8 <_ZTV8Producer+0x10>
    80004adc:	00f53023          	sd	a5,0(a0)
    80004ae0:	ffffe097          	auipc	ra,0xffffe
    80004ae4:	ad0080e7          	jalr	-1328(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80004ae8:	00048513          	mv	a0,s1
    80004aec:	ffffe097          	auipc	ra,0xffffe
    80004af0:	bc0080e7          	jalr	-1088(ra) # 800026ac <_ZdlPv>
    80004af4:	01813083          	ld	ra,24(sp)
    80004af8:	01013403          	ld	s0,16(sp)
    80004afc:	00813483          	ld	s1,8(sp)
    80004b00:	02010113          	addi	sp,sp,32
    80004b04:	00008067          	ret

0000000080004b08 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80004b08:	fe010113          	addi	sp,sp,-32
    80004b0c:	00113c23          	sd	ra,24(sp)
    80004b10:	00813823          	sd	s0,16(sp)
    80004b14:	00913423          	sd	s1,8(sp)
    80004b18:	02010413          	addi	s0,sp,32
    80004b1c:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80004b20:	ffffd097          	auipc	ra,0xffffd
    80004b24:	a48080e7          	jalr	-1464(ra) # 80001568 <_Z4getcv>
    80004b28:	0005059b          	sext.w	a1,a0
    80004b2c:	01b00793          	li	a5,27
    80004b30:	00f58c63          	beq	a1,a5,80004b48 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80004b34:	0204b783          	ld	a5,32(s1)
    80004b38:	0087b503          	ld	a0,8(a5)
    80004b3c:	00001097          	auipc	ra,0x1
    80004b40:	36c080e7          	jalr	876(ra) # 80005ea8 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80004b44:	fddff06f          	j	80004b20 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80004b48:	00100793          	li	a5,1
    80004b4c:	00007717          	auipc	a4,0x7
    80004b50:	0ef72223          	sw	a5,228(a4) # 8000bc30 <_ZL9threadEnd>
        td->buffer->put('!');
    80004b54:	0204b783          	ld	a5,32(s1)
    80004b58:	02100593          	li	a1,33
    80004b5c:	0087b503          	ld	a0,8(a5)
    80004b60:	00001097          	auipc	ra,0x1
    80004b64:	348080e7          	jalr	840(ra) # 80005ea8 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80004b68:	0204b783          	ld	a5,32(s1)
    80004b6c:	0107b503          	ld	a0,16(a5)
    80004b70:	ffffe097          	auipc	ra,0xffffe
    80004b74:	e44080e7          	jalr	-444(ra) # 800029b4 <_ZN9Semaphore6signalEv>
    }
    80004b78:	01813083          	ld	ra,24(sp)
    80004b7c:	01013403          	ld	s0,16(sp)
    80004b80:	00813483          	ld	s1,8(sp)
    80004b84:	02010113          	addi	sp,sp,32
    80004b88:	00008067          	ret

0000000080004b8c <_ZN8Producer3runEv>:
    void run() override {
    80004b8c:	fe010113          	addi	sp,sp,-32
    80004b90:	00113c23          	sd	ra,24(sp)
    80004b94:	00813823          	sd	s0,16(sp)
    80004b98:	00913423          	sd	s1,8(sp)
    80004b9c:	01213023          	sd	s2,0(sp)
    80004ba0:	02010413          	addi	s0,sp,32
    80004ba4:	00050493          	mv	s1,a0
        int i = 0;
    80004ba8:	00000913          	li	s2,0
        while (!threadEnd) {
    80004bac:	00007797          	auipc	a5,0x7
    80004bb0:	0847a783          	lw	a5,132(a5) # 8000bc30 <_ZL9threadEnd>
    80004bb4:	04079263          	bnez	a5,80004bf8 <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    80004bb8:	0204b783          	ld	a5,32(s1)
    80004bbc:	0007a583          	lw	a1,0(a5)
    80004bc0:	0305859b          	addiw	a1,a1,48
    80004bc4:	0087b503          	ld	a0,8(a5)
    80004bc8:	00001097          	auipc	ra,0x1
    80004bcc:	2e0080e7          	jalr	736(ra) # 80005ea8 <_ZN9BufferCPP3putEi>
            i++;
    80004bd0:	0019071b          	addiw	a4,s2,1
    80004bd4:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    80004bd8:	0204b783          	ld	a5,32(s1)
    80004bdc:	0007a783          	lw	a5,0(a5)
    80004be0:	00e787bb          	addw	a5,a5,a4
    80004be4:	00500513          	li	a0,5
    80004be8:	02a7e53b          	remw	a0,a5,a0
    80004bec:	ffffe097          	auipc	ra,0xffffe
    80004bf0:	cac080e7          	jalr	-852(ra) # 80002898 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80004bf4:	fb9ff06f          	j	80004bac <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80004bf8:	0204b783          	ld	a5,32(s1)
    80004bfc:	0107b503          	ld	a0,16(a5)
    80004c00:	ffffe097          	auipc	ra,0xffffe
    80004c04:	db4080e7          	jalr	-588(ra) # 800029b4 <_ZN9Semaphore6signalEv>
    }
    80004c08:	01813083          	ld	ra,24(sp)
    80004c0c:	01013403          	ld	s0,16(sp)
    80004c10:	00813483          	ld	s1,8(sp)
    80004c14:	00013903          	ld	s2,0(sp)
    80004c18:	02010113          	addi	sp,sp,32
    80004c1c:	00008067          	ret

0000000080004c20 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004c20:	fe010113          	addi	sp,sp,-32
    80004c24:	00113c23          	sd	ra,24(sp)
    80004c28:	00813823          	sd	s0,16(sp)
    80004c2c:	00913423          	sd	s1,8(sp)
    80004c30:	01213023          	sd	s2,0(sp)
    80004c34:	02010413          	addi	s0,sp,32
    80004c38:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004c3c:	00100793          	li	a5,1
    80004c40:	02a7f863          	bgeu	a5,a0,80004c70 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004c44:	00a00793          	li	a5,10
    80004c48:	02f577b3          	remu	a5,a0,a5
    80004c4c:	02078e63          	beqz	a5,80004c88 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004c50:	fff48513          	addi	a0,s1,-1
    80004c54:	00000097          	auipc	ra,0x0
    80004c58:	fcc080e7          	jalr	-52(ra) # 80004c20 <_ZL9fibonaccim>
    80004c5c:	00050913          	mv	s2,a0
    80004c60:	ffe48513          	addi	a0,s1,-2
    80004c64:	00000097          	auipc	ra,0x0
    80004c68:	fbc080e7          	jalr	-68(ra) # 80004c20 <_ZL9fibonaccim>
    80004c6c:	00a90533          	add	a0,s2,a0
}
    80004c70:	01813083          	ld	ra,24(sp)
    80004c74:	01013403          	ld	s0,16(sp)
    80004c78:	00813483          	ld	s1,8(sp)
    80004c7c:	00013903          	ld	s2,0(sp)
    80004c80:	02010113          	addi	sp,sp,32
    80004c84:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80004c88:	ffffc097          	auipc	ra,0xffffc
    80004c8c:	7a0080e7          	jalr	1952(ra) # 80001428 <_Z15thread_dispatchv>
    80004c90:	fc1ff06f          	j	80004c50 <_ZL9fibonaccim+0x30>

0000000080004c94 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80004c94:	fe010113          	addi	sp,sp,-32
    80004c98:	00113c23          	sd	ra,24(sp)
    80004c9c:	00813823          	sd	s0,16(sp)
    80004ca0:	00913423          	sd	s1,8(sp)
    80004ca4:	01213023          	sd	s2,0(sp)
    80004ca8:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004cac:	00a00493          	li	s1,10
    80004cb0:	0400006f          	j	80004cf0 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004cb4:	00004517          	auipc	a0,0x4
    80004cb8:	6b450513          	addi	a0,a0,1716 # 80009368 <CONSOLE_STATUS+0x358>
    80004cbc:	00001097          	auipc	ra,0x1
    80004cc0:	dc8080e7          	jalr	-568(ra) # 80005a84 <_Z11printStringPKc>
    80004cc4:	00000613          	li	a2,0
    80004cc8:	00a00593          	li	a1,10
    80004ccc:	00048513          	mv	a0,s1
    80004cd0:	00001097          	auipc	ra,0x1
    80004cd4:	f64080e7          	jalr	-156(ra) # 80005c34 <_Z8printIntiii>
    80004cd8:	00005517          	auipc	a0,0x5
    80004cdc:	89050513          	addi	a0,a0,-1904 # 80009568 <CONSOLE_STATUS+0x558>
    80004ce0:	00001097          	auipc	ra,0x1
    80004ce4:	da4080e7          	jalr	-604(ra) # 80005a84 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004ce8:	0014849b          	addiw	s1,s1,1
    80004cec:	0ff4f493          	andi	s1,s1,255
    80004cf0:	00c00793          	li	a5,12
    80004cf4:	fc97f0e3          	bgeu	a5,s1,80004cb4 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80004cf8:	00004517          	auipc	a0,0x4
    80004cfc:	67850513          	addi	a0,a0,1656 # 80009370 <CONSOLE_STATUS+0x360>
    80004d00:	00001097          	auipc	ra,0x1
    80004d04:	d84080e7          	jalr	-636(ra) # 80005a84 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004d08:	00500313          	li	t1,5
    thread_dispatch();
    80004d0c:	ffffc097          	auipc	ra,0xffffc
    80004d10:	71c080e7          	jalr	1820(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004d14:	01000513          	li	a0,16
    80004d18:	00000097          	auipc	ra,0x0
    80004d1c:	f08080e7          	jalr	-248(ra) # 80004c20 <_ZL9fibonaccim>
    80004d20:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004d24:	00004517          	auipc	a0,0x4
    80004d28:	65c50513          	addi	a0,a0,1628 # 80009380 <CONSOLE_STATUS+0x370>
    80004d2c:	00001097          	auipc	ra,0x1
    80004d30:	d58080e7          	jalr	-680(ra) # 80005a84 <_Z11printStringPKc>
    80004d34:	00000613          	li	a2,0
    80004d38:	00a00593          	li	a1,10
    80004d3c:	0009051b          	sext.w	a0,s2
    80004d40:	00001097          	auipc	ra,0x1
    80004d44:	ef4080e7          	jalr	-268(ra) # 80005c34 <_Z8printIntiii>
    80004d48:	00005517          	auipc	a0,0x5
    80004d4c:	82050513          	addi	a0,a0,-2016 # 80009568 <CONSOLE_STATUS+0x558>
    80004d50:	00001097          	auipc	ra,0x1
    80004d54:	d34080e7          	jalr	-716(ra) # 80005a84 <_Z11printStringPKc>
    80004d58:	0400006f          	j	80004d98 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004d5c:	00004517          	auipc	a0,0x4
    80004d60:	60c50513          	addi	a0,a0,1548 # 80009368 <CONSOLE_STATUS+0x358>
    80004d64:	00001097          	auipc	ra,0x1
    80004d68:	d20080e7          	jalr	-736(ra) # 80005a84 <_Z11printStringPKc>
    80004d6c:	00000613          	li	a2,0
    80004d70:	00a00593          	li	a1,10
    80004d74:	00048513          	mv	a0,s1
    80004d78:	00001097          	auipc	ra,0x1
    80004d7c:	ebc080e7          	jalr	-324(ra) # 80005c34 <_Z8printIntiii>
    80004d80:	00004517          	auipc	a0,0x4
    80004d84:	7e850513          	addi	a0,a0,2024 # 80009568 <CONSOLE_STATUS+0x558>
    80004d88:	00001097          	auipc	ra,0x1
    80004d8c:	cfc080e7          	jalr	-772(ra) # 80005a84 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004d90:	0014849b          	addiw	s1,s1,1
    80004d94:	0ff4f493          	andi	s1,s1,255
    80004d98:	00f00793          	li	a5,15
    80004d9c:	fc97f0e3          	bgeu	a5,s1,80004d5c <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80004da0:	00004517          	auipc	a0,0x4
    80004da4:	5f050513          	addi	a0,a0,1520 # 80009390 <CONSOLE_STATUS+0x380>
    80004da8:	00001097          	auipc	ra,0x1
    80004dac:	cdc080e7          	jalr	-804(ra) # 80005a84 <_Z11printStringPKc>
    finishedD = true;
    80004db0:	00100793          	li	a5,1
    80004db4:	00007717          	auipc	a4,0x7
    80004db8:	e8f70623          	sb	a5,-372(a4) # 8000bc40 <_ZL9finishedD>
    thread_dispatch();
    80004dbc:	ffffc097          	auipc	ra,0xffffc
    80004dc0:	66c080e7          	jalr	1644(ra) # 80001428 <_Z15thread_dispatchv>
}
    80004dc4:	01813083          	ld	ra,24(sp)
    80004dc8:	01013403          	ld	s0,16(sp)
    80004dcc:	00813483          	ld	s1,8(sp)
    80004dd0:	00013903          	ld	s2,0(sp)
    80004dd4:	02010113          	addi	sp,sp,32
    80004dd8:	00008067          	ret

0000000080004ddc <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80004ddc:	fe010113          	addi	sp,sp,-32
    80004de0:	00113c23          	sd	ra,24(sp)
    80004de4:	00813823          	sd	s0,16(sp)
    80004de8:	00913423          	sd	s1,8(sp)
    80004dec:	01213023          	sd	s2,0(sp)
    80004df0:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004df4:	00000493          	li	s1,0
    80004df8:	0400006f          	j	80004e38 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80004dfc:	00004517          	auipc	a0,0x4
    80004e00:	53c50513          	addi	a0,a0,1340 # 80009338 <CONSOLE_STATUS+0x328>
    80004e04:	00001097          	auipc	ra,0x1
    80004e08:	c80080e7          	jalr	-896(ra) # 80005a84 <_Z11printStringPKc>
    80004e0c:	00000613          	li	a2,0
    80004e10:	00a00593          	li	a1,10
    80004e14:	00048513          	mv	a0,s1
    80004e18:	00001097          	auipc	ra,0x1
    80004e1c:	e1c080e7          	jalr	-484(ra) # 80005c34 <_Z8printIntiii>
    80004e20:	00004517          	auipc	a0,0x4
    80004e24:	74850513          	addi	a0,a0,1864 # 80009568 <CONSOLE_STATUS+0x558>
    80004e28:	00001097          	auipc	ra,0x1
    80004e2c:	c5c080e7          	jalr	-932(ra) # 80005a84 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004e30:	0014849b          	addiw	s1,s1,1
    80004e34:	0ff4f493          	andi	s1,s1,255
    80004e38:	00200793          	li	a5,2
    80004e3c:	fc97f0e3          	bgeu	a5,s1,80004dfc <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80004e40:	00004517          	auipc	a0,0x4
    80004e44:	50050513          	addi	a0,a0,1280 # 80009340 <CONSOLE_STATUS+0x330>
    80004e48:	00001097          	auipc	ra,0x1
    80004e4c:	c3c080e7          	jalr	-964(ra) # 80005a84 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004e50:	00700313          	li	t1,7
    thread_dispatch();
    80004e54:	ffffc097          	auipc	ra,0xffffc
    80004e58:	5d4080e7          	jalr	1492(ra) # 80001428 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004e5c:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80004e60:	00004517          	auipc	a0,0x4
    80004e64:	4f050513          	addi	a0,a0,1264 # 80009350 <CONSOLE_STATUS+0x340>
    80004e68:	00001097          	auipc	ra,0x1
    80004e6c:	c1c080e7          	jalr	-996(ra) # 80005a84 <_Z11printStringPKc>
    80004e70:	00000613          	li	a2,0
    80004e74:	00a00593          	li	a1,10
    80004e78:	0009051b          	sext.w	a0,s2
    80004e7c:	00001097          	auipc	ra,0x1
    80004e80:	db8080e7          	jalr	-584(ra) # 80005c34 <_Z8printIntiii>
    80004e84:	00004517          	auipc	a0,0x4
    80004e88:	6e450513          	addi	a0,a0,1764 # 80009568 <CONSOLE_STATUS+0x558>
    80004e8c:	00001097          	auipc	ra,0x1
    80004e90:	bf8080e7          	jalr	-1032(ra) # 80005a84 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80004e94:	00c00513          	li	a0,12
    80004e98:	00000097          	auipc	ra,0x0
    80004e9c:	d88080e7          	jalr	-632(ra) # 80004c20 <_ZL9fibonaccim>
    80004ea0:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80004ea4:	00004517          	auipc	a0,0x4
    80004ea8:	4b450513          	addi	a0,a0,1204 # 80009358 <CONSOLE_STATUS+0x348>
    80004eac:	00001097          	auipc	ra,0x1
    80004eb0:	bd8080e7          	jalr	-1064(ra) # 80005a84 <_Z11printStringPKc>
    80004eb4:	00000613          	li	a2,0
    80004eb8:	00a00593          	li	a1,10
    80004ebc:	0009051b          	sext.w	a0,s2
    80004ec0:	00001097          	auipc	ra,0x1
    80004ec4:	d74080e7          	jalr	-652(ra) # 80005c34 <_Z8printIntiii>
    80004ec8:	00004517          	auipc	a0,0x4
    80004ecc:	6a050513          	addi	a0,a0,1696 # 80009568 <CONSOLE_STATUS+0x558>
    80004ed0:	00001097          	auipc	ra,0x1
    80004ed4:	bb4080e7          	jalr	-1100(ra) # 80005a84 <_Z11printStringPKc>
    80004ed8:	0400006f          	j	80004f18 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80004edc:	00004517          	auipc	a0,0x4
    80004ee0:	45c50513          	addi	a0,a0,1116 # 80009338 <CONSOLE_STATUS+0x328>
    80004ee4:	00001097          	auipc	ra,0x1
    80004ee8:	ba0080e7          	jalr	-1120(ra) # 80005a84 <_Z11printStringPKc>
    80004eec:	00000613          	li	a2,0
    80004ef0:	00a00593          	li	a1,10
    80004ef4:	00048513          	mv	a0,s1
    80004ef8:	00001097          	auipc	ra,0x1
    80004efc:	d3c080e7          	jalr	-708(ra) # 80005c34 <_Z8printIntiii>
    80004f00:	00004517          	auipc	a0,0x4
    80004f04:	66850513          	addi	a0,a0,1640 # 80009568 <CONSOLE_STATUS+0x558>
    80004f08:	00001097          	auipc	ra,0x1
    80004f0c:	b7c080e7          	jalr	-1156(ra) # 80005a84 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004f10:	0014849b          	addiw	s1,s1,1
    80004f14:	0ff4f493          	andi	s1,s1,255
    80004f18:	00500793          	li	a5,5
    80004f1c:	fc97f0e3          	bgeu	a5,s1,80004edc <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    80004f20:	00004517          	auipc	a0,0x4
    80004f24:	4e050513          	addi	a0,a0,1248 # 80009400 <CONSOLE_STATUS+0x3f0>
    80004f28:	00001097          	auipc	ra,0x1
    80004f2c:	b5c080e7          	jalr	-1188(ra) # 80005a84 <_Z11printStringPKc>
    finishedC = true;
    80004f30:	00100793          	li	a5,1
    80004f34:	00007717          	auipc	a4,0x7
    80004f38:	d0f706a3          	sb	a5,-755(a4) # 8000bc41 <_ZL9finishedC>
    thread_dispatch();
    80004f3c:	ffffc097          	auipc	ra,0xffffc
    80004f40:	4ec080e7          	jalr	1260(ra) # 80001428 <_Z15thread_dispatchv>
}
    80004f44:	01813083          	ld	ra,24(sp)
    80004f48:	01013403          	ld	s0,16(sp)
    80004f4c:	00813483          	ld	s1,8(sp)
    80004f50:	00013903          	ld	s2,0(sp)
    80004f54:	02010113          	addi	sp,sp,32
    80004f58:	00008067          	ret

0000000080004f5c <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80004f5c:	fe010113          	addi	sp,sp,-32
    80004f60:	00113c23          	sd	ra,24(sp)
    80004f64:	00813823          	sd	s0,16(sp)
    80004f68:	00913423          	sd	s1,8(sp)
    80004f6c:	01213023          	sd	s2,0(sp)
    80004f70:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80004f74:	00000913          	li	s2,0
    80004f78:	0380006f          	j	80004fb0 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80004f7c:	ffffc097          	auipc	ra,0xffffc
    80004f80:	4ac080e7          	jalr	1196(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004f84:	00148493          	addi	s1,s1,1
    80004f88:	000027b7          	lui	a5,0x2
    80004f8c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004f90:	0097ee63          	bltu	a5,s1,80004fac <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004f94:	00000713          	li	a4,0
    80004f98:	000077b7          	lui	a5,0x7
    80004f9c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004fa0:	fce7eee3          	bltu	a5,a4,80004f7c <_ZL11workerBodyBPv+0x20>
    80004fa4:	00170713          	addi	a4,a4,1
    80004fa8:	ff1ff06f          	j	80004f98 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80004fac:	00190913          	addi	s2,s2,1
    80004fb0:	00f00793          	li	a5,15
    80004fb4:	0527e063          	bltu	a5,s2,80004ff4 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80004fb8:	00004517          	auipc	a0,0x4
    80004fbc:	36850513          	addi	a0,a0,872 # 80009320 <CONSOLE_STATUS+0x310>
    80004fc0:	00001097          	auipc	ra,0x1
    80004fc4:	ac4080e7          	jalr	-1340(ra) # 80005a84 <_Z11printStringPKc>
    80004fc8:	00000613          	li	a2,0
    80004fcc:	00a00593          	li	a1,10
    80004fd0:	0009051b          	sext.w	a0,s2
    80004fd4:	00001097          	auipc	ra,0x1
    80004fd8:	c60080e7          	jalr	-928(ra) # 80005c34 <_Z8printIntiii>
    80004fdc:	00004517          	auipc	a0,0x4
    80004fe0:	58c50513          	addi	a0,a0,1420 # 80009568 <CONSOLE_STATUS+0x558>
    80004fe4:	00001097          	auipc	ra,0x1
    80004fe8:	aa0080e7          	jalr	-1376(ra) # 80005a84 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004fec:	00000493          	li	s1,0
    80004ff0:	f99ff06f          	j	80004f88 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80004ff4:	00004517          	auipc	a0,0x4
    80004ff8:	33450513          	addi	a0,a0,820 # 80009328 <CONSOLE_STATUS+0x318>
    80004ffc:	00001097          	auipc	ra,0x1
    80005000:	a88080e7          	jalr	-1400(ra) # 80005a84 <_Z11printStringPKc>
    finishedB = true;
    80005004:	00100793          	li	a5,1
    80005008:	00007717          	auipc	a4,0x7
    8000500c:	c2f70d23          	sb	a5,-966(a4) # 8000bc42 <_ZL9finishedB>
    thread_dispatch();
    80005010:	ffffc097          	auipc	ra,0xffffc
    80005014:	418080e7          	jalr	1048(ra) # 80001428 <_Z15thread_dispatchv>
}
    80005018:	01813083          	ld	ra,24(sp)
    8000501c:	01013403          	ld	s0,16(sp)
    80005020:	00813483          	ld	s1,8(sp)
    80005024:	00013903          	ld	s2,0(sp)
    80005028:	02010113          	addi	sp,sp,32
    8000502c:	00008067          	ret

0000000080005030 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80005030:	fe010113          	addi	sp,sp,-32
    80005034:	00113c23          	sd	ra,24(sp)
    80005038:	00813823          	sd	s0,16(sp)
    8000503c:	00913423          	sd	s1,8(sp)
    80005040:	01213023          	sd	s2,0(sp)
    80005044:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80005048:	00000913          	li	s2,0
    8000504c:	0380006f          	j	80005084 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80005050:	ffffc097          	auipc	ra,0xffffc
    80005054:	3d8080e7          	jalr	984(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005058:	00148493          	addi	s1,s1,1
    8000505c:	000027b7          	lui	a5,0x2
    80005060:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005064:	0097ee63          	bltu	a5,s1,80005080 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005068:	00000713          	li	a4,0
    8000506c:	000077b7          	lui	a5,0x7
    80005070:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005074:	fce7eee3          	bltu	a5,a4,80005050 <_ZL11workerBodyAPv+0x20>
    80005078:	00170713          	addi	a4,a4,1
    8000507c:	ff1ff06f          	j	8000506c <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80005080:	00190913          	addi	s2,s2,1
    80005084:	00900793          	li	a5,9
    80005088:	0527e063          	bltu	a5,s2,800050c8 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    8000508c:	00004517          	auipc	a0,0x4
    80005090:	27c50513          	addi	a0,a0,636 # 80009308 <CONSOLE_STATUS+0x2f8>
    80005094:	00001097          	auipc	ra,0x1
    80005098:	9f0080e7          	jalr	-1552(ra) # 80005a84 <_Z11printStringPKc>
    8000509c:	00000613          	li	a2,0
    800050a0:	00a00593          	li	a1,10
    800050a4:	0009051b          	sext.w	a0,s2
    800050a8:	00001097          	auipc	ra,0x1
    800050ac:	b8c080e7          	jalr	-1140(ra) # 80005c34 <_Z8printIntiii>
    800050b0:	00004517          	auipc	a0,0x4
    800050b4:	4b850513          	addi	a0,a0,1208 # 80009568 <CONSOLE_STATUS+0x558>
    800050b8:	00001097          	auipc	ra,0x1
    800050bc:	9cc080e7          	jalr	-1588(ra) # 80005a84 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800050c0:	00000493          	li	s1,0
    800050c4:	f99ff06f          	j	8000505c <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    800050c8:	00004517          	auipc	a0,0x4
    800050cc:	24850513          	addi	a0,a0,584 # 80009310 <CONSOLE_STATUS+0x300>
    800050d0:	00001097          	auipc	ra,0x1
    800050d4:	9b4080e7          	jalr	-1612(ra) # 80005a84 <_Z11printStringPKc>
    finishedA = true;
    800050d8:	00100793          	li	a5,1
    800050dc:	00007717          	auipc	a4,0x7
    800050e0:	b6f703a3          	sb	a5,-1177(a4) # 8000bc43 <_ZL9finishedA>
}
    800050e4:	01813083          	ld	ra,24(sp)
    800050e8:	01013403          	ld	s0,16(sp)
    800050ec:	00813483          	ld	s1,8(sp)
    800050f0:	00013903          	ld	s2,0(sp)
    800050f4:	02010113          	addi	sp,sp,32
    800050f8:	00008067          	ret

00000000800050fc <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    800050fc:	fd010113          	addi	sp,sp,-48
    80005100:	02113423          	sd	ra,40(sp)
    80005104:	02813023          	sd	s0,32(sp)
    80005108:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    8000510c:	00000613          	li	a2,0
    80005110:	00000597          	auipc	a1,0x0
    80005114:	f2058593          	addi	a1,a1,-224 # 80005030 <_ZL11workerBodyAPv>
    80005118:	fd040513          	addi	a0,s0,-48
    8000511c:	ffffc097          	auipc	ra,0xffffc
    80005120:	264080e7          	jalr	612(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80005124:	00004517          	auipc	a0,0x4
    80005128:	27c50513          	addi	a0,a0,636 # 800093a0 <CONSOLE_STATUS+0x390>
    8000512c:	00001097          	auipc	ra,0x1
    80005130:	958080e7          	jalr	-1704(ra) # 80005a84 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80005134:	00000613          	li	a2,0
    80005138:	00000597          	auipc	a1,0x0
    8000513c:	e2458593          	addi	a1,a1,-476 # 80004f5c <_ZL11workerBodyBPv>
    80005140:	fd840513          	addi	a0,s0,-40
    80005144:	ffffc097          	auipc	ra,0xffffc
    80005148:	23c080e7          	jalr	572(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    8000514c:	00004517          	auipc	a0,0x4
    80005150:	26c50513          	addi	a0,a0,620 # 800093b8 <CONSOLE_STATUS+0x3a8>
    80005154:	00001097          	auipc	ra,0x1
    80005158:	930080e7          	jalr	-1744(ra) # 80005a84 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    8000515c:	00000613          	li	a2,0
    80005160:	00000597          	auipc	a1,0x0
    80005164:	c7c58593          	addi	a1,a1,-900 # 80004ddc <_ZL11workerBodyCPv>
    80005168:	fe040513          	addi	a0,s0,-32
    8000516c:	ffffc097          	auipc	ra,0xffffc
    80005170:	214080e7          	jalr	532(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80005174:	00004517          	auipc	a0,0x4
    80005178:	25c50513          	addi	a0,a0,604 # 800093d0 <CONSOLE_STATUS+0x3c0>
    8000517c:	00001097          	auipc	ra,0x1
    80005180:	908080e7          	jalr	-1784(ra) # 80005a84 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80005184:	00000613          	li	a2,0
    80005188:	00000597          	auipc	a1,0x0
    8000518c:	b0c58593          	addi	a1,a1,-1268 # 80004c94 <_ZL11workerBodyDPv>
    80005190:	fe840513          	addi	a0,s0,-24
    80005194:	ffffc097          	auipc	ra,0xffffc
    80005198:	1ec080e7          	jalr	492(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    8000519c:	00004517          	auipc	a0,0x4
    800051a0:	24c50513          	addi	a0,a0,588 # 800093e8 <CONSOLE_STATUS+0x3d8>
    800051a4:	00001097          	auipc	ra,0x1
    800051a8:	8e0080e7          	jalr	-1824(ra) # 80005a84 <_Z11printStringPKc>
    800051ac:	00c0006f          	j	800051b8 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    800051b0:	ffffc097          	auipc	ra,0xffffc
    800051b4:	278080e7          	jalr	632(ra) # 80001428 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800051b8:	00007797          	auipc	a5,0x7
    800051bc:	a8b7c783          	lbu	a5,-1397(a5) # 8000bc43 <_ZL9finishedA>
    800051c0:	fe0788e3          	beqz	a5,800051b0 <_Z18Threads_C_API_testv+0xb4>
    800051c4:	00007797          	auipc	a5,0x7
    800051c8:	a7e7c783          	lbu	a5,-1410(a5) # 8000bc42 <_ZL9finishedB>
    800051cc:	fe0782e3          	beqz	a5,800051b0 <_Z18Threads_C_API_testv+0xb4>
    800051d0:	00007797          	auipc	a5,0x7
    800051d4:	a717c783          	lbu	a5,-1423(a5) # 8000bc41 <_ZL9finishedC>
    800051d8:	fc078ce3          	beqz	a5,800051b0 <_Z18Threads_C_API_testv+0xb4>
    800051dc:	00007797          	auipc	a5,0x7
    800051e0:	a647c783          	lbu	a5,-1436(a5) # 8000bc40 <_ZL9finishedD>
    800051e4:	fc0786e3          	beqz	a5,800051b0 <_Z18Threads_C_API_testv+0xb4>
    }

}
    800051e8:	02813083          	ld	ra,40(sp)
    800051ec:	02013403          	ld	s0,32(sp)
    800051f0:	03010113          	addi	sp,sp,48
    800051f4:	00008067          	ret

00000000800051f8 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    800051f8:	fd010113          	addi	sp,sp,-48
    800051fc:	02113423          	sd	ra,40(sp)
    80005200:	02813023          	sd	s0,32(sp)
    80005204:	00913c23          	sd	s1,24(sp)
    80005208:	01213823          	sd	s2,16(sp)
    8000520c:	01313423          	sd	s3,8(sp)
    80005210:	03010413          	addi	s0,sp,48
    80005214:	00050993          	mv	s3,a0
    80005218:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    8000521c:	00000913          	li	s2,0
    80005220:	00c0006f          	j	8000522c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005224:	ffffd097          	auipc	ra,0xffffd
    80005228:	64c080e7          	jalr	1612(ra) # 80002870 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    8000522c:	ffffc097          	auipc	ra,0xffffc
    80005230:	33c080e7          	jalr	828(ra) # 80001568 <_Z4getcv>
    80005234:	0005059b          	sext.w	a1,a0
    80005238:	01b00793          	li	a5,27
    8000523c:	02f58a63          	beq	a1,a5,80005270 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80005240:	0084b503          	ld	a0,8(s1)
    80005244:	00001097          	auipc	ra,0x1
    80005248:	c64080e7          	jalr	-924(ra) # 80005ea8 <_ZN9BufferCPP3putEi>
        i++;
    8000524c:	0019071b          	addiw	a4,s2,1
    80005250:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005254:	0004a683          	lw	a3,0(s1)
    80005258:	0026979b          	slliw	a5,a3,0x2
    8000525c:	00d787bb          	addw	a5,a5,a3
    80005260:	0017979b          	slliw	a5,a5,0x1
    80005264:	02f767bb          	remw	a5,a4,a5
    80005268:	fc0792e3          	bnez	a5,8000522c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    8000526c:	fb9ff06f          	j	80005224 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80005270:	00100793          	li	a5,1
    80005274:	00007717          	auipc	a4,0x7
    80005278:	9cf72a23          	sw	a5,-1580(a4) # 8000bc48 <_ZL9threadEnd>
    td->buffer->put('!');
    8000527c:	0209b783          	ld	a5,32(s3)
    80005280:	02100593          	li	a1,33
    80005284:	0087b503          	ld	a0,8(a5)
    80005288:	00001097          	auipc	ra,0x1
    8000528c:	c20080e7          	jalr	-992(ra) # 80005ea8 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80005290:	0104b503          	ld	a0,16(s1)
    80005294:	ffffd097          	auipc	ra,0xffffd
    80005298:	720080e7          	jalr	1824(ra) # 800029b4 <_ZN9Semaphore6signalEv>
}
    8000529c:	02813083          	ld	ra,40(sp)
    800052a0:	02013403          	ld	s0,32(sp)
    800052a4:	01813483          	ld	s1,24(sp)
    800052a8:	01013903          	ld	s2,16(sp)
    800052ac:	00813983          	ld	s3,8(sp)
    800052b0:	03010113          	addi	sp,sp,48
    800052b4:	00008067          	ret

00000000800052b8 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    800052b8:	fe010113          	addi	sp,sp,-32
    800052bc:	00113c23          	sd	ra,24(sp)
    800052c0:	00813823          	sd	s0,16(sp)
    800052c4:	00913423          	sd	s1,8(sp)
    800052c8:	01213023          	sd	s2,0(sp)
    800052cc:	02010413          	addi	s0,sp,32
    800052d0:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800052d4:	00000913          	li	s2,0
    800052d8:	00c0006f          	j	800052e4 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    800052dc:	ffffd097          	auipc	ra,0xffffd
    800052e0:	594080e7          	jalr	1428(ra) # 80002870 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    800052e4:	00007797          	auipc	a5,0x7
    800052e8:	9647a783          	lw	a5,-1692(a5) # 8000bc48 <_ZL9threadEnd>
    800052ec:	02079e63          	bnez	a5,80005328 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    800052f0:	0004a583          	lw	a1,0(s1)
    800052f4:	0305859b          	addiw	a1,a1,48
    800052f8:	0084b503          	ld	a0,8(s1)
    800052fc:	00001097          	auipc	ra,0x1
    80005300:	bac080e7          	jalr	-1108(ra) # 80005ea8 <_ZN9BufferCPP3putEi>
        i++;
    80005304:	0019071b          	addiw	a4,s2,1
    80005308:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    8000530c:	0004a683          	lw	a3,0(s1)
    80005310:	0026979b          	slliw	a5,a3,0x2
    80005314:	00d787bb          	addw	a5,a5,a3
    80005318:	0017979b          	slliw	a5,a5,0x1
    8000531c:	02f767bb          	remw	a5,a4,a5
    80005320:	fc0792e3          	bnez	a5,800052e4 <_ZN12ProducerSync8producerEPv+0x2c>
    80005324:	fb9ff06f          	j	800052dc <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80005328:	0104b503          	ld	a0,16(s1)
    8000532c:	ffffd097          	auipc	ra,0xffffd
    80005330:	688080e7          	jalr	1672(ra) # 800029b4 <_ZN9Semaphore6signalEv>
}
    80005334:	01813083          	ld	ra,24(sp)
    80005338:	01013403          	ld	s0,16(sp)
    8000533c:	00813483          	ld	s1,8(sp)
    80005340:	00013903          	ld	s2,0(sp)
    80005344:	02010113          	addi	sp,sp,32
    80005348:	00008067          	ret

000000008000534c <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    8000534c:	fd010113          	addi	sp,sp,-48
    80005350:	02113423          	sd	ra,40(sp)
    80005354:	02813023          	sd	s0,32(sp)
    80005358:	00913c23          	sd	s1,24(sp)
    8000535c:	01213823          	sd	s2,16(sp)
    80005360:	01313423          	sd	s3,8(sp)
    80005364:	01413023          	sd	s4,0(sp)
    80005368:	03010413          	addi	s0,sp,48
    8000536c:	00050993          	mv	s3,a0
    80005370:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005374:	00000a13          	li	s4,0
    80005378:	01c0006f          	j	80005394 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    8000537c:	ffffd097          	auipc	ra,0xffffd
    80005380:	4f4080e7          	jalr	1268(ra) # 80002870 <_ZN6Thread8dispatchEv>
    80005384:	0500006f          	j	800053d4 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80005388:	00a00513          	li	a0,10
    8000538c:	ffffc097          	auipc	ra,0xffffc
    80005390:	204080e7          	jalr	516(ra) # 80001590 <_Z4putcc>
    while (!threadEnd) {
    80005394:	00007797          	auipc	a5,0x7
    80005398:	8b47a783          	lw	a5,-1868(a5) # 8000bc48 <_ZL9threadEnd>
    8000539c:	06079263          	bnez	a5,80005400 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    800053a0:	00893503          	ld	a0,8(s2)
    800053a4:	00001097          	auipc	ra,0x1
    800053a8:	b94080e7          	jalr	-1132(ra) # 80005f38 <_ZN9BufferCPP3getEv>
        i++;
    800053ac:	001a049b          	addiw	s1,s4,1
    800053b0:	00048a1b          	sext.w	s4,s1
        putc(key);
    800053b4:	0ff57513          	andi	a0,a0,255
    800053b8:	ffffc097          	auipc	ra,0xffffc
    800053bc:	1d8080e7          	jalr	472(ra) # 80001590 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    800053c0:	00092703          	lw	a4,0(s2)
    800053c4:	0027179b          	slliw	a5,a4,0x2
    800053c8:	00e787bb          	addw	a5,a5,a4
    800053cc:	02f4e7bb          	remw	a5,s1,a5
    800053d0:	fa0786e3          	beqz	a5,8000537c <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    800053d4:	05000793          	li	a5,80
    800053d8:	02f4e4bb          	remw	s1,s1,a5
    800053dc:	fa049ce3          	bnez	s1,80005394 <_ZN12ConsumerSync8consumerEPv+0x48>
    800053e0:	fa9ff06f          	j	80005388 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    800053e4:	0209b783          	ld	a5,32(s3)
    800053e8:	0087b503          	ld	a0,8(a5)
    800053ec:	00001097          	auipc	ra,0x1
    800053f0:	b4c080e7          	jalr	-1204(ra) # 80005f38 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    800053f4:	0ff57513          	andi	a0,a0,255
    800053f8:	ffffd097          	auipc	ra,0xffffd
    800053fc:	668080e7          	jalr	1640(ra) # 80002a60 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80005400:	0209b783          	ld	a5,32(s3)
    80005404:	0087b503          	ld	a0,8(a5)
    80005408:	00001097          	auipc	ra,0x1
    8000540c:	bbc080e7          	jalr	-1092(ra) # 80005fc4 <_ZN9BufferCPP6getCntEv>
    80005410:	fca04ae3          	bgtz	a0,800053e4 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80005414:	01093503          	ld	a0,16(s2)
    80005418:	ffffd097          	auipc	ra,0xffffd
    8000541c:	59c080e7          	jalr	1436(ra) # 800029b4 <_ZN9Semaphore6signalEv>
}
    80005420:	02813083          	ld	ra,40(sp)
    80005424:	02013403          	ld	s0,32(sp)
    80005428:	01813483          	ld	s1,24(sp)
    8000542c:	01013903          	ld	s2,16(sp)
    80005430:	00813983          	ld	s3,8(sp)
    80005434:	00013a03          	ld	s4,0(sp)
    80005438:	03010113          	addi	sp,sp,48
    8000543c:	00008067          	ret

0000000080005440 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80005440:	f8010113          	addi	sp,sp,-128
    80005444:	06113c23          	sd	ra,120(sp)
    80005448:	06813823          	sd	s0,112(sp)
    8000544c:	06913423          	sd	s1,104(sp)
    80005450:	07213023          	sd	s2,96(sp)
    80005454:	05313c23          	sd	s3,88(sp)
    80005458:	05413823          	sd	s4,80(sp)
    8000545c:	05513423          	sd	s5,72(sp)
    80005460:	05613023          	sd	s6,64(sp)
    80005464:	03713c23          	sd	s7,56(sp)
    80005468:	03813823          	sd	s8,48(sp)
    8000546c:	03913423          	sd	s9,40(sp)
    80005470:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80005474:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80005478:	00004517          	auipc	a0,0x4
    8000547c:	da850513          	addi	a0,a0,-600 # 80009220 <CONSOLE_STATUS+0x210>
    80005480:	00000097          	auipc	ra,0x0
    80005484:	604080e7          	jalr	1540(ra) # 80005a84 <_Z11printStringPKc>
    getString(input, 30);
    80005488:	01e00593          	li	a1,30
    8000548c:	f8040493          	addi	s1,s0,-128
    80005490:	00048513          	mv	a0,s1
    80005494:	00000097          	auipc	ra,0x0
    80005498:	678080e7          	jalr	1656(ra) # 80005b0c <_Z9getStringPci>
    threadNum = stringToInt(input);
    8000549c:	00048513          	mv	a0,s1
    800054a0:	00000097          	auipc	ra,0x0
    800054a4:	744080e7          	jalr	1860(ra) # 80005be4 <_Z11stringToIntPKc>
    800054a8:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    800054ac:	00004517          	auipc	a0,0x4
    800054b0:	d9450513          	addi	a0,a0,-620 # 80009240 <CONSOLE_STATUS+0x230>
    800054b4:	00000097          	auipc	ra,0x0
    800054b8:	5d0080e7          	jalr	1488(ra) # 80005a84 <_Z11printStringPKc>
    getString(input, 30);
    800054bc:	01e00593          	li	a1,30
    800054c0:	00048513          	mv	a0,s1
    800054c4:	00000097          	auipc	ra,0x0
    800054c8:	648080e7          	jalr	1608(ra) # 80005b0c <_Z9getStringPci>
    n = stringToInt(input);
    800054cc:	00048513          	mv	a0,s1
    800054d0:	00000097          	auipc	ra,0x0
    800054d4:	714080e7          	jalr	1812(ra) # 80005be4 <_Z11stringToIntPKc>
    800054d8:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    800054dc:	00004517          	auipc	a0,0x4
    800054e0:	d8450513          	addi	a0,a0,-636 # 80009260 <CONSOLE_STATUS+0x250>
    800054e4:	00000097          	auipc	ra,0x0
    800054e8:	5a0080e7          	jalr	1440(ra) # 80005a84 <_Z11printStringPKc>
    800054ec:	00000613          	li	a2,0
    800054f0:	00a00593          	li	a1,10
    800054f4:	00090513          	mv	a0,s2
    800054f8:	00000097          	auipc	ra,0x0
    800054fc:	73c080e7          	jalr	1852(ra) # 80005c34 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005500:	00004517          	auipc	a0,0x4
    80005504:	d7850513          	addi	a0,a0,-648 # 80009278 <CONSOLE_STATUS+0x268>
    80005508:	00000097          	auipc	ra,0x0
    8000550c:	57c080e7          	jalr	1404(ra) # 80005a84 <_Z11printStringPKc>
    80005510:	00000613          	li	a2,0
    80005514:	00a00593          	li	a1,10
    80005518:	00048513          	mv	a0,s1
    8000551c:	00000097          	auipc	ra,0x0
    80005520:	718080e7          	jalr	1816(ra) # 80005c34 <_Z8printIntiii>
    printString(".\n");
    80005524:	00004517          	auipc	a0,0x4
    80005528:	d6c50513          	addi	a0,a0,-660 # 80009290 <CONSOLE_STATUS+0x280>
    8000552c:	00000097          	auipc	ra,0x0
    80005530:	558080e7          	jalr	1368(ra) # 80005a84 <_Z11printStringPKc>
    if(threadNum > n) {
    80005534:	0324c463          	blt	s1,s2,8000555c <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80005538:	03205c63          	blez	s2,80005570 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    8000553c:	03800513          	li	a0,56
    80005540:	ffffd097          	auipc	ra,0xffffd
    80005544:	11c080e7          	jalr	284(ra) # 8000265c <_Znwm>
    80005548:	00050a93          	mv	s5,a0
    8000554c:	00048593          	mv	a1,s1
    80005550:	00001097          	auipc	ra,0x1
    80005554:	804080e7          	jalr	-2044(ra) # 80005d54 <_ZN9BufferCPPC1Ei>
    80005558:	0300006f          	j	80005588 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    8000555c:	00004517          	auipc	a0,0x4
    80005560:	d3c50513          	addi	a0,a0,-708 # 80009298 <CONSOLE_STATUS+0x288>
    80005564:	00000097          	auipc	ra,0x0
    80005568:	520080e7          	jalr	1312(ra) # 80005a84 <_Z11printStringPKc>
        return;
    8000556c:	0140006f          	j	80005580 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80005570:	00004517          	auipc	a0,0x4
    80005574:	d6850513          	addi	a0,a0,-664 # 800092d8 <CONSOLE_STATUS+0x2c8>
    80005578:	00000097          	auipc	ra,0x0
    8000557c:	50c080e7          	jalr	1292(ra) # 80005a84 <_Z11printStringPKc>
        return;
    80005580:	000b8113          	mv	sp,s7
    80005584:	2380006f          	j	800057bc <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80005588:	01000513          	li	a0,16
    8000558c:	ffffd097          	auipc	ra,0xffffd
    80005590:	0d0080e7          	jalr	208(ra) # 8000265c <_Znwm>
    80005594:	00050493          	mv	s1,a0
    80005598:	00000593          	li	a1,0
    8000559c:	ffffd097          	auipc	ra,0xffffd
    800055a0:	3b4080e7          	jalr	948(ra) # 80002950 <_ZN9SemaphoreC1Ej>
    800055a4:	00006797          	auipc	a5,0x6
    800055a8:	6a97b623          	sd	s1,1708(a5) # 8000bc50 <_ZL10waitForAll>
    Thread* threads[threadNum];
    800055ac:	00391793          	slli	a5,s2,0x3
    800055b0:	00f78793          	addi	a5,a5,15
    800055b4:	ff07f793          	andi	a5,a5,-16
    800055b8:	40f10133          	sub	sp,sp,a5
    800055bc:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    800055c0:	0019071b          	addiw	a4,s2,1
    800055c4:	00171793          	slli	a5,a4,0x1
    800055c8:	00e787b3          	add	a5,a5,a4
    800055cc:	00379793          	slli	a5,a5,0x3
    800055d0:	00f78793          	addi	a5,a5,15
    800055d4:	ff07f793          	andi	a5,a5,-16
    800055d8:	40f10133          	sub	sp,sp,a5
    800055dc:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    800055e0:	00191c13          	slli	s8,s2,0x1
    800055e4:	012c07b3          	add	a5,s8,s2
    800055e8:	00379793          	slli	a5,a5,0x3
    800055ec:	00fa07b3          	add	a5,s4,a5
    800055f0:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    800055f4:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    800055f8:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    800055fc:	02800513          	li	a0,40
    80005600:	ffffd097          	auipc	ra,0xffffd
    80005604:	05c080e7          	jalr	92(ra) # 8000265c <_Znwm>
    80005608:	00050b13          	mv	s6,a0
    8000560c:	012c0c33          	add	s8,s8,s2
    80005610:	003c1c13          	slli	s8,s8,0x3
    80005614:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80005618:	ffffd097          	auipc	ra,0xffffd
    8000561c:	2bc080e7          	jalr	700(ra) # 800028d4 <_ZN6ThreadC1Ev>
    80005620:	00006797          	auipc	a5,0x6
    80005624:	42878793          	addi	a5,a5,1064 # 8000ba48 <_ZTV12ConsumerSync+0x10>
    80005628:	00fb3023          	sd	a5,0(s6)
    8000562c:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80005630:	000b0513          	mv	a0,s6
    80005634:	ffffd097          	auipc	ra,0xffffd
    80005638:	1d8080e7          	jalr	472(ra) # 8000280c <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    8000563c:	00000493          	li	s1,0
    80005640:	0380006f          	j	80005678 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005644:	00006797          	auipc	a5,0x6
    80005648:	3dc78793          	addi	a5,a5,988 # 8000ba20 <_ZTV12ProducerSync+0x10>
    8000564c:	00fcb023          	sd	a5,0(s9)
    80005650:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80005654:	00349793          	slli	a5,s1,0x3
    80005658:	00f987b3          	add	a5,s3,a5
    8000565c:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80005660:	00349793          	slli	a5,s1,0x3
    80005664:	00f987b3          	add	a5,s3,a5
    80005668:	0007b503          	ld	a0,0(a5)
    8000566c:	ffffd097          	auipc	ra,0xffffd
    80005670:	1a0080e7          	jalr	416(ra) # 8000280c <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005674:	0014849b          	addiw	s1,s1,1
    80005678:	0b24d063          	bge	s1,s2,80005718 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    8000567c:	00149793          	slli	a5,s1,0x1
    80005680:	009787b3          	add	a5,a5,s1
    80005684:	00379793          	slli	a5,a5,0x3
    80005688:	00fa07b3          	add	a5,s4,a5
    8000568c:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80005690:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80005694:	00006717          	auipc	a4,0x6
    80005698:	5bc73703          	ld	a4,1468(a4) # 8000bc50 <_ZL10waitForAll>
    8000569c:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    800056a0:	02905863          	blez	s1,800056d0 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    800056a4:	02800513          	li	a0,40
    800056a8:	ffffd097          	auipc	ra,0xffffd
    800056ac:	fb4080e7          	jalr	-76(ra) # 8000265c <_Znwm>
    800056b0:	00050c93          	mv	s9,a0
    800056b4:	00149c13          	slli	s8,s1,0x1
    800056b8:	009c0c33          	add	s8,s8,s1
    800056bc:	003c1c13          	slli	s8,s8,0x3
    800056c0:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    800056c4:	ffffd097          	auipc	ra,0xffffd
    800056c8:	210080e7          	jalr	528(ra) # 800028d4 <_ZN6ThreadC1Ev>
    800056cc:	f79ff06f          	j	80005644 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    800056d0:	02800513          	li	a0,40
    800056d4:	ffffd097          	auipc	ra,0xffffd
    800056d8:	f88080e7          	jalr	-120(ra) # 8000265c <_Znwm>
    800056dc:	00050c93          	mv	s9,a0
    800056e0:	00149c13          	slli	s8,s1,0x1
    800056e4:	009c0c33          	add	s8,s8,s1
    800056e8:	003c1c13          	slli	s8,s8,0x3
    800056ec:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    800056f0:	ffffd097          	auipc	ra,0xffffd
    800056f4:	1e4080e7          	jalr	484(ra) # 800028d4 <_ZN6ThreadC1Ev>
    800056f8:	00006797          	auipc	a5,0x6
    800056fc:	30078793          	addi	a5,a5,768 # 8000b9f8 <_ZTV16ProducerKeyboard+0x10>
    80005700:	00fcb023          	sd	a5,0(s9)
    80005704:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80005708:	00349793          	slli	a5,s1,0x3
    8000570c:	00f987b3          	add	a5,s3,a5
    80005710:	0197b023          	sd	s9,0(a5)
    80005714:	f4dff06f          	j	80005660 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80005718:	ffffd097          	auipc	ra,0xffffd
    8000571c:	158080e7          	jalr	344(ra) # 80002870 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80005720:	00000493          	li	s1,0
    80005724:	00994e63          	blt	s2,s1,80005740 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80005728:	00006517          	auipc	a0,0x6
    8000572c:	52853503          	ld	a0,1320(a0) # 8000bc50 <_ZL10waitForAll>
    80005730:	ffffd097          	auipc	ra,0xffffd
    80005734:	258080e7          	jalr	600(ra) # 80002988 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80005738:	0014849b          	addiw	s1,s1,1
    8000573c:	fe9ff06f          	j	80005724 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80005740:	00000493          	li	s1,0
    80005744:	0080006f          	j	8000574c <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80005748:	0014849b          	addiw	s1,s1,1
    8000574c:	0324d263          	bge	s1,s2,80005770 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80005750:	00349793          	slli	a5,s1,0x3
    80005754:	00f987b3          	add	a5,s3,a5
    80005758:	0007b503          	ld	a0,0(a5)
    8000575c:	fe0506e3          	beqz	a0,80005748 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80005760:	00053783          	ld	a5,0(a0)
    80005764:	0087b783          	ld	a5,8(a5)
    80005768:	000780e7          	jalr	a5
    8000576c:	fddff06f          	j	80005748 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80005770:	000b0a63          	beqz	s6,80005784 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80005774:	000b3783          	ld	a5,0(s6)
    80005778:	0087b783          	ld	a5,8(a5)
    8000577c:	000b0513          	mv	a0,s6
    80005780:	000780e7          	jalr	a5
    delete waitForAll;
    80005784:	00006517          	auipc	a0,0x6
    80005788:	4cc53503          	ld	a0,1228(a0) # 8000bc50 <_ZL10waitForAll>
    8000578c:	00050863          	beqz	a0,8000579c <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80005790:	00053783          	ld	a5,0(a0)
    80005794:	0087b783          	ld	a5,8(a5)
    80005798:	000780e7          	jalr	a5
    delete buffer;
    8000579c:	000a8e63          	beqz	s5,800057b8 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    800057a0:	000a8513          	mv	a0,s5
    800057a4:	00001097          	auipc	ra,0x1
    800057a8:	8a8080e7          	jalr	-1880(ra) # 8000604c <_ZN9BufferCPPD1Ev>
    800057ac:	000a8513          	mv	a0,s5
    800057b0:	ffffd097          	auipc	ra,0xffffd
    800057b4:	efc080e7          	jalr	-260(ra) # 800026ac <_ZdlPv>
    800057b8:	000b8113          	mv	sp,s7

}
    800057bc:	f8040113          	addi	sp,s0,-128
    800057c0:	07813083          	ld	ra,120(sp)
    800057c4:	07013403          	ld	s0,112(sp)
    800057c8:	06813483          	ld	s1,104(sp)
    800057cc:	06013903          	ld	s2,96(sp)
    800057d0:	05813983          	ld	s3,88(sp)
    800057d4:	05013a03          	ld	s4,80(sp)
    800057d8:	04813a83          	ld	s5,72(sp)
    800057dc:	04013b03          	ld	s6,64(sp)
    800057e0:	03813b83          	ld	s7,56(sp)
    800057e4:	03013c03          	ld	s8,48(sp)
    800057e8:	02813c83          	ld	s9,40(sp)
    800057ec:	08010113          	addi	sp,sp,128
    800057f0:	00008067          	ret
    800057f4:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    800057f8:	000a8513          	mv	a0,s5
    800057fc:	ffffd097          	auipc	ra,0xffffd
    80005800:	eb0080e7          	jalr	-336(ra) # 800026ac <_ZdlPv>
    80005804:	00048513          	mv	a0,s1
    80005808:	00007097          	auipc	ra,0x7
    8000580c:	530080e7          	jalr	1328(ra) # 8000cd38 <_Unwind_Resume>
    80005810:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80005814:	00048513          	mv	a0,s1
    80005818:	ffffd097          	auipc	ra,0xffffd
    8000581c:	e94080e7          	jalr	-364(ra) # 800026ac <_ZdlPv>
    80005820:	00090513          	mv	a0,s2
    80005824:	00007097          	auipc	ra,0x7
    80005828:	514080e7          	jalr	1300(ra) # 8000cd38 <_Unwind_Resume>
    8000582c:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80005830:	000b0513          	mv	a0,s6
    80005834:	ffffd097          	auipc	ra,0xffffd
    80005838:	e78080e7          	jalr	-392(ra) # 800026ac <_ZdlPv>
    8000583c:	00048513          	mv	a0,s1
    80005840:	00007097          	auipc	ra,0x7
    80005844:	4f8080e7          	jalr	1272(ra) # 8000cd38 <_Unwind_Resume>
    80005848:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    8000584c:	000c8513          	mv	a0,s9
    80005850:	ffffd097          	auipc	ra,0xffffd
    80005854:	e5c080e7          	jalr	-420(ra) # 800026ac <_ZdlPv>
    80005858:	00048513          	mv	a0,s1
    8000585c:	00007097          	auipc	ra,0x7
    80005860:	4dc080e7          	jalr	1244(ra) # 8000cd38 <_Unwind_Resume>
    80005864:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80005868:	000c8513          	mv	a0,s9
    8000586c:	ffffd097          	auipc	ra,0xffffd
    80005870:	e40080e7          	jalr	-448(ra) # 800026ac <_ZdlPv>
    80005874:	00048513          	mv	a0,s1
    80005878:	00007097          	auipc	ra,0x7
    8000587c:	4c0080e7          	jalr	1216(ra) # 8000cd38 <_Unwind_Resume>

0000000080005880 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80005880:	ff010113          	addi	sp,sp,-16
    80005884:	00113423          	sd	ra,8(sp)
    80005888:	00813023          	sd	s0,0(sp)
    8000588c:	01010413          	addi	s0,sp,16
    80005890:	00006797          	auipc	a5,0x6
    80005894:	1b878793          	addi	a5,a5,440 # 8000ba48 <_ZTV12ConsumerSync+0x10>
    80005898:	00f53023          	sd	a5,0(a0)
    8000589c:	ffffd097          	auipc	ra,0xffffd
    800058a0:	d14080e7          	jalr	-748(ra) # 800025b0 <_ZN6ThreadD1Ev>
    800058a4:	00813083          	ld	ra,8(sp)
    800058a8:	00013403          	ld	s0,0(sp)
    800058ac:	01010113          	addi	sp,sp,16
    800058b0:	00008067          	ret

00000000800058b4 <_ZN12ConsumerSyncD0Ev>:
    800058b4:	fe010113          	addi	sp,sp,-32
    800058b8:	00113c23          	sd	ra,24(sp)
    800058bc:	00813823          	sd	s0,16(sp)
    800058c0:	00913423          	sd	s1,8(sp)
    800058c4:	02010413          	addi	s0,sp,32
    800058c8:	00050493          	mv	s1,a0
    800058cc:	00006797          	auipc	a5,0x6
    800058d0:	17c78793          	addi	a5,a5,380 # 8000ba48 <_ZTV12ConsumerSync+0x10>
    800058d4:	00f53023          	sd	a5,0(a0)
    800058d8:	ffffd097          	auipc	ra,0xffffd
    800058dc:	cd8080e7          	jalr	-808(ra) # 800025b0 <_ZN6ThreadD1Ev>
    800058e0:	00048513          	mv	a0,s1
    800058e4:	ffffd097          	auipc	ra,0xffffd
    800058e8:	dc8080e7          	jalr	-568(ra) # 800026ac <_ZdlPv>
    800058ec:	01813083          	ld	ra,24(sp)
    800058f0:	01013403          	ld	s0,16(sp)
    800058f4:	00813483          	ld	s1,8(sp)
    800058f8:	02010113          	addi	sp,sp,32
    800058fc:	00008067          	ret

0000000080005900 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80005900:	ff010113          	addi	sp,sp,-16
    80005904:	00113423          	sd	ra,8(sp)
    80005908:	00813023          	sd	s0,0(sp)
    8000590c:	01010413          	addi	s0,sp,16
    80005910:	00006797          	auipc	a5,0x6
    80005914:	11078793          	addi	a5,a5,272 # 8000ba20 <_ZTV12ProducerSync+0x10>
    80005918:	00f53023          	sd	a5,0(a0)
    8000591c:	ffffd097          	auipc	ra,0xffffd
    80005920:	c94080e7          	jalr	-876(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80005924:	00813083          	ld	ra,8(sp)
    80005928:	00013403          	ld	s0,0(sp)
    8000592c:	01010113          	addi	sp,sp,16
    80005930:	00008067          	ret

0000000080005934 <_ZN12ProducerSyncD0Ev>:
    80005934:	fe010113          	addi	sp,sp,-32
    80005938:	00113c23          	sd	ra,24(sp)
    8000593c:	00813823          	sd	s0,16(sp)
    80005940:	00913423          	sd	s1,8(sp)
    80005944:	02010413          	addi	s0,sp,32
    80005948:	00050493          	mv	s1,a0
    8000594c:	00006797          	auipc	a5,0x6
    80005950:	0d478793          	addi	a5,a5,212 # 8000ba20 <_ZTV12ProducerSync+0x10>
    80005954:	00f53023          	sd	a5,0(a0)
    80005958:	ffffd097          	auipc	ra,0xffffd
    8000595c:	c58080e7          	jalr	-936(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80005960:	00048513          	mv	a0,s1
    80005964:	ffffd097          	auipc	ra,0xffffd
    80005968:	d48080e7          	jalr	-696(ra) # 800026ac <_ZdlPv>
    8000596c:	01813083          	ld	ra,24(sp)
    80005970:	01013403          	ld	s0,16(sp)
    80005974:	00813483          	ld	s1,8(sp)
    80005978:	02010113          	addi	sp,sp,32
    8000597c:	00008067          	ret

0000000080005980 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80005980:	ff010113          	addi	sp,sp,-16
    80005984:	00113423          	sd	ra,8(sp)
    80005988:	00813023          	sd	s0,0(sp)
    8000598c:	01010413          	addi	s0,sp,16
    80005990:	00006797          	auipc	a5,0x6
    80005994:	06878793          	addi	a5,a5,104 # 8000b9f8 <_ZTV16ProducerKeyboard+0x10>
    80005998:	00f53023          	sd	a5,0(a0)
    8000599c:	ffffd097          	auipc	ra,0xffffd
    800059a0:	c14080e7          	jalr	-1004(ra) # 800025b0 <_ZN6ThreadD1Ev>
    800059a4:	00813083          	ld	ra,8(sp)
    800059a8:	00013403          	ld	s0,0(sp)
    800059ac:	01010113          	addi	sp,sp,16
    800059b0:	00008067          	ret

00000000800059b4 <_ZN16ProducerKeyboardD0Ev>:
    800059b4:	fe010113          	addi	sp,sp,-32
    800059b8:	00113c23          	sd	ra,24(sp)
    800059bc:	00813823          	sd	s0,16(sp)
    800059c0:	00913423          	sd	s1,8(sp)
    800059c4:	02010413          	addi	s0,sp,32
    800059c8:	00050493          	mv	s1,a0
    800059cc:	00006797          	auipc	a5,0x6
    800059d0:	02c78793          	addi	a5,a5,44 # 8000b9f8 <_ZTV16ProducerKeyboard+0x10>
    800059d4:	00f53023          	sd	a5,0(a0)
    800059d8:	ffffd097          	auipc	ra,0xffffd
    800059dc:	bd8080e7          	jalr	-1064(ra) # 800025b0 <_ZN6ThreadD1Ev>
    800059e0:	00048513          	mv	a0,s1
    800059e4:	ffffd097          	auipc	ra,0xffffd
    800059e8:	cc8080e7          	jalr	-824(ra) # 800026ac <_ZdlPv>
    800059ec:	01813083          	ld	ra,24(sp)
    800059f0:	01013403          	ld	s0,16(sp)
    800059f4:	00813483          	ld	s1,8(sp)
    800059f8:	02010113          	addi	sp,sp,32
    800059fc:	00008067          	ret

0000000080005a00 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80005a00:	ff010113          	addi	sp,sp,-16
    80005a04:	00113423          	sd	ra,8(sp)
    80005a08:	00813023          	sd	s0,0(sp)
    80005a0c:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80005a10:	02053583          	ld	a1,32(a0)
    80005a14:	fffff097          	auipc	ra,0xfffff
    80005a18:	7e4080e7          	jalr	2020(ra) # 800051f8 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80005a1c:	00813083          	ld	ra,8(sp)
    80005a20:	00013403          	ld	s0,0(sp)
    80005a24:	01010113          	addi	sp,sp,16
    80005a28:	00008067          	ret

0000000080005a2c <_ZN12ProducerSync3runEv>:
    void run() override {
    80005a2c:	ff010113          	addi	sp,sp,-16
    80005a30:	00113423          	sd	ra,8(sp)
    80005a34:	00813023          	sd	s0,0(sp)
    80005a38:	01010413          	addi	s0,sp,16
        producer(td);
    80005a3c:	02053583          	ld	a1,32(a0)
    80005a40:	00000097          	auipc	ra,0x0
    80005a44:	878080e7          	jalr	-1928(ra) # 800052b8 <_ZN12ProducerSync8producerEPv>
    }
    80005a48:	00813083          	ld	ra,8(sp)
    80005a4c:	00013403          	ld	s0,0(sp)
    80005a50:	01010113          	addi	sp,sp,16
    80005a54:	00008067          	ret

0000000080005a58 <_ZN12ConsumerSync3runEv>:
    void run() override {
    80005a58:	ff010113          	addi	sp,sp,-16
    80005a5c:	00113423          	sd	ra,8(sp)
    80005a60:	00813023          	sd	s0,0(sp)
    80005a64:	01010413          	addi	s0,sp,16
        consumer(td);
    80005a68:	02053583          	ld	a1,32(a0)
    80005a6c:	00000097          	auipc	ra,0x0
    80005a70:	8e0080e7          	jalr	-1824(ra) # 8000534c <_ZN12ConsumerSync8consumerEPv>
    }
    80005a74:	00813083          	ld	ra,8(sp)
    80005a78:	00013403          	ld	s0,0(sp)
    80005a7c:	01010113          	addi	sp,sp,16
    80005a80:	00008067          	ret

0000000080005a84 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80005a84:	fe010113          	addi	sp,sp,-32
    80005a88:	00113c23          	sd	ra,24(sp)
    80005a8c:	00813823          	sd	s0,16(sp)
    80005a90:	00913423          	sd	s1,8(sp)
    80005a94:	02010413          	addi	s0,sp,32
    80005a98:	00050493          	mv	s1,a0
    LOCK();
    80005a9c:	00100613          	li	a2,1
    80005aa0:	00000593          	li	a1,0
    80005aa4:	00006517          	auipc	a0,0x6
    80005aa8:	1b450513          	addi	a0,a0,436 # 8000bc58 <lockPrint>
    80005aac:	ffffb097          	auipc	ra,0xffffb
    80005ab0:	778080e7          	jalr	1912(ra) # 80001224 <copy_and_swap>
    80005ab4:	00050863          	beqz	a0,80005ac4 <_Z11printStringPKc+0x40>
    80005ab8:	ffffc097          	auipc	ra,0xffffc
    80005abc:	970080e7          	jalr	-1680(ra) # 80001428 <_Z15thread_dispatchv>
    80005ac0:	fddff06f          	j	80005a9c <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80005ac4:	0004c503          	lbu	a0,0(s1)
    80005ac8:	00050a63          	beqz	a0,80005adc <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80005acc:	ffffc097          	auipc	ra,0xffffc
    80005ad0:	ac4080e7          	jalr	-1340(ra) # 80001590 <_Z4putcc>
        string++;
    80005ad4:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80005ad8:	fedff06f          	j	80005ac4 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80005adc:	00000613          	li	a2,0
    80005ae0:	00100593          	li	a1,1
    80005ae4:	00006517          	auipc	a0,0x6
    80005ae8:	17450513          	addi	a0,a0,372 # 8000bc58 <lockPrint>
    80005aec:	ffffb097          	auipc	ra,0xffffb
    80005af0:	738080e7          	jalr	1848(ra) # 80001224 <copy_and_swap>
    80005af4:	fe0514e3          	bnez	a0,80005adc <_Z11printStringPKc+0x58>
}
    80005af8:	01813083          	ld	ra,24(sp)
    80005afc:	01013403          	ld	s0,16(sp)
    80005b00:	00813483          	ld	s1,8(sp)
    80005b04:	02010113          	addi	sp,sp,32
    80005b08:	00008067          	ret

0000000080005b0c <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80005b0c:	fd010113          	addi	sp,sp,-48
    80005b10:	02113423          	sd	ra,40(sp)
    80005b14:	02813023          	sd	s0,32(sp)
    80005b18:	00913c23          	sd	s1,24(sp)
    80005b1c:	01213823          	sd	s2,16(sp)
    80005b20:	01313423          	sd	s3,8(sp)
    80005b24:	01413023          	sd	s4,0(sp)
    80005b28:	03010413          	addi	s0,sp,48
    80005b2c:	00050993          	mv	s3,a0
    80005b30:	00058a13          	mv	s4,a1
    LOCK();
    80005b34:	00100613          	li	a2,1
    80005b38:	00000593          	li	a1,0
    80005b3c:	00006517          	auipc	a0,0x6
    80005b40:	11c50513          	addi	a0,a0,284 # 8000bc58 <lockPrint>
    80005b44:	ffffb097          	auipc	ra,0xffffb
    80005b48:	6e0080e7          	jalr	1760(ra) # 80001224 <copy_and_swap>
    80005b4c:	00050863          	beqz	a0,80005b5c <_Z9getStringPci+0x50>
    80005b50:	ffffc097          	auipc	ra,0xffffc
    80005b54:	8d8080e7          	jalr	-1832(ra) # 80001428 <_Z15thread_dispatchv>
    80005b58:	fddff06f          	j	80005b34 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80005b5c:	00000913          	li	s2,0
    80005b60:	00090493          	mv	s1,s2
    80005b64:	0019091b          	addiw	s2,s2,1
    80005b68:	03495a63          	bge	s2,s4,80005b9c <_Z9getStringPci+0x90>
        cc = getc();
    80005b6c:	ffffc097          	auipc	ra,0xffffc
    80005b70:	9fc080e7          	jalr	-1540(ra) # 80001568 <_Z4getcv>
        if(cc < 1)
    80005b74:	02050463          	beqz	a0,80005b9c <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80005b78:	009984b3          	add	s1,s3,s1
    80005b7c:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80005b80:	00a00793          	li	a5,10
    80005b84:	00f50a63          	beq	a0,a5,80005b98 <_Z9getStringPci+0x8c>
    80005b88:	00d00793          	li	a5,13
    80005b8c:	fcf51ae3          	bne	a0,a5,80005b60 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80005b90:	00090493          	mv	s1,s2
    80005b94:	0080006f          	j	80005b9c <_Z9getStringPci+0x90>
    80005b98:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80005b9c:	009984b3          	add	s1,s3,s1
    80005ba0:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80005ba4:	00000613          	li	a2,0
    80005ba8:	00100593          	li	a1,1
    80005bac:	00006517          	auipc	a0,0x6
    80005bb0:	0ac50513          	addi	a0,a0,172 # 8000bc58 <lockPrint>
    80005bb4:	ffffb097          	auipc	ra,0xffffb
    80005bb8:	670080e7          	jalr	1648(ra) # 80001224 <copy_and_swap>
    80005bbc:	fe0514e3          	bnez	a0,80005ba4 <_Z9getStringPci+0x98>
    return buf;
}
    80005bc0:	00098513          	mv	a0,s3
    80005bc4:	02813083          	ld	ra,40(sp)
    80005bc8:	02013403          	ld	s0,32(sp)
    80005bcc:	01813483          	ld	s1,24(sp)
    80005bd0:	01013903          	ld	s2,16(sp)
    80005bd4:	00813983          	ld	s3,8(sp)
    80005bd8:	00013a03          	ld	s4,0(sp)
    80005bdc:	03010113          	addi	sp,sp,48
    80005be0:	00008067          	ret

0000000080005be4 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80005be4:	ff010113          	addi	sp,sp,-16
    80005be8:	00813423          	sd	s0,8(sp)
    80005bec:	01010413          	addi	s0,sp,16
    80005bf0:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80005bf4:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80005bf8:	0006c603          	lbu	a2,0(a3)
    80005bfc:	fd06071b          	addiw	a4,a2,-48
    80005c00:	0ff77713          	andi	a4,a4,255
    80005c04:	00900793          	li	a5,9
    80005c08:	02e7e063          	bltu	a5,a4,80005c28 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80005c0c:	0025179b          	slliw	a5,a0,0x2
    80005c10:	00a787bb          	addw	a5,a5,a0
    80005c14:	0017979b          	slliw	a5,a5,0x1
    80005c18:	00168693          	addi	a3,a3,1
    80005c1c:	00c787bb          	addw	a5,a5,a2
    80005c20:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80005c24:	fd5ff06f          	j	80005bf8 <_Z11stringToIntPKc+0x14>
    return n;
}
    80005c28:	00813403          	ld	s0,8(sp)
    80005c2c:	01010113          	addi	sp,sp,16
    80005c30:	00008067          	ret

0000000080005c34 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80005c34:	fc010113          	addi	sp,sp,-64
    80005c38:	02113c23          	sd	ra,56(sp)
    80005c3c:	02813823          	sd	s0,48(sp)
    80005c40:	02913423          	sd	s1,40(sp)
    80005c44:	03213023          	sd	s2,32(sp)
    80005c48:	01313c23          	sd	s3,24(sp)
    80005c4c:	04010413          	addi	s0,sp,64
    80005c50:	00050493          	mv	s1,a0
    80005c54:	00058913          	mv	s2,a1
    80005c58:	00060993          	mv	s3,a2
    LOCK();
    80005c5c:	00100613          	li	a2,1
    80005c60:	00000593          	li	a1,0
    80005c64:	00006517          	auipc	a0,0x6
    80005c68:	ff450513          	addi	a0,a0,-12 # 8000bc58 <lockPrint>
    80005c6c:	ffffb097          	auipc	ra,0xffffb
    80005c70:	5b8080e7          	jalr	1464(ra) # 80001224 <copy_and_swap>
    80005c74:	00050863          	beqz	a0,80005c84 <_Z8printIntiii+0x50>
    80005c78:	ffffb097          	auipc	ra,0xffffb
    80005c7c:	7b0080e7          	jalr	1968(ra) # 80001428 <_Z15thread_dispatchv>
    80005c80:	fddff06f          	j	80005c5c <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80005c84:	00098463          	beqz	s3,80005c8c <_Z8printIntiii+0x58>
    80005c88:	0804c463          	bltz	s1,80005d10 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80005c8c:	0004851b          	sext.w	a0,s1
    neg = 0;
    80005c90:	00000593          	li	a1,0
    }

    i = 0;
    80005c94:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80005c98:	0009079b          	sext.w	a5,s2
    80005c9c:	0325773b          	remuw	a4,a0,s2
    80005ca0:	00048613          	mv	a2,s1
    80005ca4:	0014849b          	addiw	s1,s1,1
    80005ca8:	02071693          	slli	a3,a4,0x20
    80005cac:	0206d693          	srli	a3,a3,0x20
    80005cb0:	00006717          	auipc	a4,0x6
    80005cb4:	db070713          	addi	a4,a4,-592 # 8000ba60 <digits>
    80005cb8:	00d70733          	add	a4,a4,a3
    80005cbc:	00074683          	lbu	a3,0(a4)
    80005cc0:	fd040713          	addi	a4,s0,-48
    80005cc4:	00c70733          	add	a4,a4,a2
    80005cc8:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80005ccc:	0005071b          	sext.w	a4,a0
    80005cd0:	0325553b          	divuw	a0,a0,s2
    80005cd4:	fcf772e3          	bgeu	a4,a5,80005c98 <_Z8printIntiii+0x64>
    if(neg)
    80005cd8:	00058c63          	beqz	a1,80005cf0 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80005cdc:	fd040793          	addi	a5,s0,-48
    80005ce0:	009784b3          	add	s1,a5,s1
    80005ce4:	02d00793          	li	a5,45
    80005ce8:	fef48823          	sb	a5,-16(s1)
    80005cec:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80005cf0:	fff4849b          	addiw	s1,s1,-1
    80005cf4:	0204c463          	bltz	s1,80005d1c <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80005cf8:	fd040793          	addi	a5,s0,-48
    80005cfc:	009787b3          	add	a5,a5,s1
    80005d00:	ff07c503          	lbu	a0,-16(a5)
    80005d04:	ffffc097          	auipc	ra,0xffffc
    80005d08:	88c080e7          	jalr	-1908(ra) # 80001590 <_Z4putcc>
    80005d0c:	fe5ff06f          	j	80005cf0 <_Z8printIntiii+0xbc>
        x = -xx;
    80005d10:	4090053b          	negw	a0,s1
        neg = 1;
    80005d14:	00100593          	li	a1,1
        x = -xx;
    80005d18:	f7dff06f          	j	80005c94 <_Z8printIntiii+0x60>

    UNLOCK();
    80005d1c:	00000613          	li	a2,0
    80005d20:	00100593          	li	a1,1
    80005d24:	00006517          	auipc	a0,0x6
    80005d28:	f3450513          	addi	a0,a0,-204 # 8000bc58 <lockPrint>
    80005d2c:	ffffb097          	auipc	ra,0xffffb
    80005d30:	4f8080e7          	jalr	1272(ra) # 80001224 <copy_and_swap>
    80005d34:	fe0514e3          	bnez	a0,80005d1c <_Z8printIntiii+0xe8>
    80005d38:	03813083          	ld	ra,56(sp)
    80005d3c:	03013403          	ld	s0,48(sp)
    80005d40:	02813483          	ld	s1,40(sp)
    80005d44:	02013903          	ld	s2,32(sp)
    80005d48:	01813983          	ld	s3,24(sp)
    80005d4c:	04010113          	addi	sp,sp,64
    80005d50:	00008067          	ret

0000000080005d54 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80005d54:	fd010113          	addi	sp,sp,-48
    80005d58:	02113423          	sd	ra,40(sp)
    80005d5c:	02813023          	sd	s0,32(sp)
    80005d60:	00913c23          	sd	s1,24(sp)
    80005d64:	01213823          	sd	s2,16(sp)
    80005d68:	01313423          	sd	s3,8(sp)
    80005d6c:	03010413          	addi	s0,sp,48
    80005d70:	00050493          	mv	s1,a0
    80005d74:	00058913          	mv	s2,a1
    80005d78:	0015879b          	addiw	a5,a1,1
    80005d7c:	0007851b          	sext.w	a0,a5
    80005d80:	00f4a023          	sw	a5,0(s1)
    80005d84:	0004a823          	sw	zero,16(s1)
    80005d88:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80005d8c:	00251513          	slli	a0,a0,0x2
    80005d90:	ffffb097          	auipc	ra,0xffffb
    80005d94:	580080e7          	jalr	1408(ra) # 80001310 <_Z9mem_allocm>
    80005d98:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80005d9c:	01000513          	li	a0,16
    80005da0:	ffffd097          	auipc	ra,0xffffd
    80005da4:	8bc080e7          	jalr	-1860(ra) # 8000265c <_Znwm>
    80005da8:	00050993          	mv	s3,a0
    80005dac:	00000593          	li	a1,0
    80005db0:	ffffd097          	auipc	ra,0xffffd
    80005db4:	ba0080e7          	jalr	-1120(ra) # 80002950 <_ZN9SemaphoreC1Ej>
    80005db8:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80005dbc:	01000513          	li	a0,16
    80005dc0:	ffffd097          	auipc	ra,0xffffd
    80005dc4:	89c080e7          	jalr	-1892(ra) # 8000265c <_Znwm>
    80005dc8:	00050993          	mv	s3,a0
    80005dcc:	00090593          	mv	a1,s2
    80005dd0:	ffffd097          	auipc	ra,0xffffd
    80005dd4:	b80080e7          	jalr	-1152(ra) # 80002950 <_ZN9SemaphoreC1Ej>
    80005dd8:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80005ddc:	01000513          	li	a0,16
    80005de0:	ffffd097          	auipc	ra,0xffffd
    80005de4:	87c080e7          	jalr	-1924(ra) # 8000265c <_Znwm>
    80005de8:	00050913          	mv	s2,a0
    80005dec:	00100593          	li	a1,1
    80005df0:	ffffd097          	auipc	ra,0xffffd
    80005df4:	b60080e7          	jalr	-1184(ra) # 80002950 <_ZN9SemaphoreC1Ej>
    80005df8:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80005dfc:	01000513          	li	a0,16
    80005e00:	ffffd097          	auipc	ra,0xffffd
    80005e04:	85c080e7          	jalr	-1956(ra) # 8000265c <_Znwm>
    80005e08:	00050913          	mv	s2,a0
    80005e0c:	00100593          	li	a1,1
    80005e10:	ffffd097          	auipc	ra,0xffffd
    80005e14:	b40080e7          	jalr	-1216(ra) # 80002950 <_ZN9SemaphoreC1Ej>
    80005e18:	0324b823          	sd	s2,48(s1)
}
    80005e1c:	02813083          	ld	ra,40(sp)
    80005e20:	02013403          	ld	s0,32(sp)
    80005e24:	01813483          	ld	s1,24(sp)
    80005e28:	01013903          	ld	s2,16(sp)
    80005e2c:	00813983          	ld	s3,8(sp)
    80005e30:	03010113          	addi	sp,sp,48
    80005e34:	00008067          	ret
    80005e38:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80005e3c:	00098513          	mv	a0,s3
    80005e40:	ffffd097          	auipc	ra,0xffffd
    80005e44:	86c080e7          	jalr	-1940(ra) # 800026ac <_ZdlPv>
    80005e48:	00048513          	mv	a0,s1
    80005e4c:	00007097          	auipc	ra,0x7
    80005e50:	eec080e7          	jalr	-276(ra) # 8000cd38 <_Unwind_Resume>
    80005e54:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80005e58:	00098513          	mv	a0,s3
    80005e5c:	ffffd097          	auipc	ra,0xffffd
    80005e60:	850080e7          	jalr	-1968(ra) # 800026ac <_ZdlPv>
    80005e64:	00048513          	mv	a0,s1
    80005e68:	00007097          	auipc	ra,0x7
    80005e6c:	ed0080e7          	jalr	-304(ra) # 8000cd38 <_Unwind_Resume>
    80005e70:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80005e74:	00090513          	mv	a0,s2
    80005e78:	ffffd097          	auipc	ra,0xffffd
    80005e7c:	834080e7          	jalr	-1996(ra) # 800026ac <_ZdlPv>
    80005e80:	00048513          	mv	a0,s1
    80005e84:	00007097          	auipc	ra,0x7
    80005e88:	eb4080e7          	jalr	-332(ra) # 8000cd38 <_Unwind_Resume>
    80005e8c:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80005e90:	00090513          	mv	a0,s2
    80005e94:	ffffd097          	auipc	ra,0xffffd
    80005e98:	818080e7          	jalr	-2024(ra) # 800026ac <_ZdlPv>
    80005e9c:	00048513          	mv	a0,s1
    80005ea0:	00007097          	auipc	ra,0x7
    80005ea4:	e98080e7          	jalr	-360(ra) # 8000cd38 <_Unwind_Resume>

0000000080005ea8 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80005ea8:	fe010113          	addi	sp,sp,-32
    80005eac:	00113c23          	sd	ra,24(sp)
    80005eb0:	00813823          	sd	s0,16(sp)
    80005eb4:	00913423          	sd	s1,8(sp)
    80005eb8:	01213023          	sd	s2,0(sp)
    80005ebc:	02010413          	addi	s0,sp,32
    80005ec0:	00050493          	mv	s1,a0
    80005ec4:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80005ec8:	01853503          	ld	a0,24(a0)
    80005ecc:	ffffd097          	auipc	ra,0xffffd
    80005ed0:	abc080e7          	jalr	-1348(ra) # 80002988 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80005ed4:	0304b503          	ld	a0,48(s1)
    80005ed8:	ffffd097          	auipc	ra,0xffffd
    80005edc:	ab0080e7          	jalr	-1360(ra) # 80002988 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80005ee0:	0084b783          	ld	a5,8(s1)
    80005ee4:	0144a703          	lw	a4,20(s1)
    80005ee8:	00271713          	slli	a4,a4,0x2
    80005eec:	00e787b3          	add	a5,a5,a4
    80005ef0:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80005ef4:	0144a783          	lw	a5,20(s1)
    80005ef8:	0017879b          	addiw	a5,a5,1
    80005efc:	0004a703          	lw	a4,0(s1)
    80005f00:	02e7e7bb          	remw	a5,a5,a4
    80005f04:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80005f08:	0304b503          	ld	a0,48(s1)
    80005f0c:	ffffd097          	auipc	ra,0xffffd
    80005f10:	aa8080e7          	jalr	-1368(ra) # 800029b4 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80005f14:	0204b503          	ld	a0,32(s1)
    80005f18:	ffffd097          	auipc	ra,0xffffd
    80005f1c:	a9c080e7          	jalr	-1380(ra) # 800029b4 <_ZN9Semaphore6signalEv>

}
    80005f20:	01813083          	ld	ra,24(sp)
    80005f24:	01013403          	ld	s0,16(sp)
    80005f28:	00813483          	ld	s1,8(sp)
    80005f2c:	00013903          	ld	s2,0(sp)
    80005f30:	02010113          	addi	sp,sp,32
    80005f34:	00008067          	ret

0000000080005f38 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80005f38:	fe010113          	addi	sp,sp,-32
    80005f3c:	00113c23          	sd	ra,24(sp)
    80005f40:	00813823          	sd	s0,16(sp)
    80005f44:	00913423          	sd	s1,8(sp)
    80005f48:	01213023          	sd	s2,0(sp)
    80005f4c:	02010413          	addi	s0,sp,32
    80005f50:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80005f54:	02053503          	ld	a0,32(a0)
    80005f58:	ffffd097          	auipc	ra,0xffffd
    80005f5c:	a30080e7          	jalr	-1488(ra) # 80002988 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80005f60:	0284b503          	ld	a0,40(s1)
    80005f64:	ffffd097          	auipc	ra,0xffffd
    80005f68:	a24080e7          	jalr	-1500(ra) # 80002988 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80005f6c:	0084b703          	ld	a4,8(s1)
    80005f70:	0104a783          	lw	a5,16(s1)
    80005f74:	00279693          	slli	a3,a5,0x2
    80005f78:	00d70733          	add	a4,a4,a3
    80005f7c:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80005f80:	0017879b          	addiw	a5,a5,1
    80005f84:	0004a703          	lw	a4,0(s1)
    80005f88:	02e7e7bb          	remw	a5,a5,a4
    80005f8c:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80005f90:	0284b503          	ld	a0,40(s1)
    80005f94:	ffffd097          	auipc	ra,0xffffd
    80005f98:	a20080e7          	jalr	-1504(ra) # 800029b4 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80005f9c:	0184b503          	ld	a0,24(s1)
    80005fa0:	ffffd097          	auipc	ra,0xffffd
    80005fa4:	a14080e7          	jalr	-1516(ra) # 800029b4 <_ZN9Semaphore6signalEv>

    return ret;
}
    80005fa8:	00090513          	mv	a0,s2
    80005fac:	01813083          	ld	ra,24(sp)
    80005fb0:	01013403          	ld	s0,16(sp)
    80005fb4:	00813483          	ld	s1,8(sp)
    80005fb8:	00013903          	ld	s2,0(sp)
    80005fbc:	02010113          	addi	sp,sp,32
    80005fc0:	00008067          	ret

0000000080005fc4 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80005fc4:	fe010113          	addi	sp,sp,-32
    80005fc8:	00113c23          	sd	ra,24(sp)
    80005fcc:	00813823          	sd	s0,16(sp)
    80005fd0:	00913423          	sd	s1,8(sp)
    80005fd4:	01213023          	sd	s2,0(sp)
    80005fd8:	02010413          	addi	s0,sp,32
    80005fdc:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80005fe0:	02853503          	ld	a0,40(a0)
    80005fe4:	ffffd097          	auipc	ra,0xffffd
    80005fe8:	9a4080e7          	jalr	-1628(ra) # 80002988 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80005fec:	0304b503          	ld	a0,48(s1)
    80005ff0:	ffffd097          	auipc	ra,0xffffd
    80005ff4:	998080e7          	jalr	-1640(ra) # 80002988 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80005ff8:	0144a783          	lw	a5,20(s1)
    80005ffc:	0104a903          	lw	s2,16(s1)
    80006000:	0327ce63          	blt	a5,s2,8000603c <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80006004:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80006008:	0304b503          	ld	a0,48(s1)
    8000600c:	ffffd097          	auipc	ra,0xffffd
    80006010:	9a8080e7          	jalr	-1624(ra) # 800029b4 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80006014:	0284b503          	ld	a0,40(s1)
    80006018:	ffffd097          	auipc	ra,0xffffd
    8000601c:	99c080e7          	jalr	-1636(ra) # 800029b4 <_ZN9Semaphore6signalEv>

    return ret;
}
    80006020:	00090513          	mv	a0,s2
    80006024:	01813083          	ld	ra,24(sp)
    80006028:	01013403          	ld	s0,16(sp)
    8000602c:	00813483          	ld	s1,8(sp)
    80006030:	00013903          	ld	s2,0(sp)
    80006034:	02010113          	addi	sp,sp,32
    80006038:	00008067          	ret
        ret = cap - head + tail;
    8000603c:	0004a703          	lw	a4,0(s1)
    80006040:	4127093b          	subw	s2,a4,s2
    80006044:	00f9093b          	addw	s2,s2,a5
    80006048:	fc1ff06f          	j	80006008 <_ZN9BufferCPP6getCntEv+0x44>

000000008000604c <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    8000604c:	fe010113          	addi	sp,sp,-32
    80006050:	00113c23          	sd	ra,24(sp)
    80006054:	00813823          	sd	s0,16(sp)
    80006058:	00913423          	sd	s1,8(sp)
    8000605c:	02010413          	addi	s0,sp,32
    80006060:	00050493          	mv	s1,a0
    Console::putc('\n');
    80006064:	00a00513          	li	a0,10
    80006068:	ffffd097          	auipc	ra,0xffffd
    8000606c:	9f8080e7          	jalr	-1544(ra) # 80002a60 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80006070:	00003517          	auipc	a0,0x3
    80006074:	3a050513          	addi	a0,a0,928 # 80009410 <CONSOLE_STATUS+0x400>
    80006078:	00000097          	auipc	ra,0x0
    8000607c:	a0c080e7          	jalr	-1524(ra) # 80005a84 <_Z11printStringPKc>
    while (getCnt()) {
    80006080:	00048513          	mv	a0,s1
    80006084:	00000097          	auipc	ra,0x0
    80006088:	f40080e7          	jalr	-192(ra) # 80005fc4 <_ZN9BufferCPP6getCntEv>
    8000608c:	02050c63          	beqz	a0,800060c4 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80006090:	0084b783          	ld	a5,8(s1)
    80006094:	0104a703          	lw	a4,16(s1)
    80006098:	00271713          	slli	a4,a4,0x2
    8000609c:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    800060a0:	0007c503          	lbu	a0,0(a5)
    800060a4:	ffffd097          	auipc	ra,0xffffd
    800060a8:	9bc080e7          	jalr	-1604(ra) # 80002a60 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    800060ac:	0104a783          	lw	a5,16(s1)
    800060b0:	0017879b          	addiw	a5,a5,1
    800060b4:	0004a703          	lw	a4,0(s1)
    800060b8:	02e7e7bb          	remw	a5,a5,a4
    800060bc:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    800060c0:	fc1ff06f          	j	80006080 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    800060c4:	02100513          	li	a0,33
    800060c8:	ffffd097          	auipc	ra,0xffffd
    800060cc:	998080e7          	jalr	-1640(ra) # 80002a60 <_ZN7Console4putcEc>
    Console::putc('\n');
    800060d0:	00a00513          	li	a0,10
    800060d4:	ffffd097          	auipc	ra,0xffffd
    800060d8:	98c080e7          	jalr	-1652(ra) # 80002a60 <_ZN7Console4putcEc>
    mem_free(buffer);
    800060dc:	0084b503          	ld	a0,8(s1)
    800060e0:	ffffb097          	auipc	ra,0xffffb
    800060e4:	270080e7          	jalr	624(ra) # 80001350 <_Z8mem_freePv>
    delete itemAvailable;
    800060e8:	0204b503          	ld	a0,32(s1)
    800060ec:	00050863          	beqz	a0,800060fc <_ZN9BufferCPPD1Ev+0xb0>
    800060f0:	00053783          	ld	a5,0(a0)
    800060f4:	0087b783          	ld	a5,8(a5)
    800060f8:	000780e7          	jalr	a5
    delete spaceAvailable;
    800060fc:	0184b503          	ld	a0,24(s1)
    80006100:	00050863          	beqz	a0,80006110 <_ZN9BufferCPPD1Ev+0xc4>
    80006104:	00053783          	ld	a5,0(a0)
    80006108:	0087b783          	ld	a5,8(a5)
    8000610c:	000780e7          	jalr	a5
    delete mutexTail;
    80006110:	0304b503          	ld	a0,48(s1)
    80006114:	00050863          	beqz	a0,80006124 <_ZN9BufferCPPD1Ev+0xd8>
    80006118:	00053783          	ld	a5,0(a0)
    8000611c:	0087b783          	ld	a5,8(a5)
    80006120:	000780e7          	jalr	a5
    delete mutexHead;
    80006124:	0284b503          	ld	a0,40(s1)
    80006128:	00050863          	beqz	a0,80006138 <_ZN9BufferCPPD1Ev+0xec>
    8000612c:	00053783          	ld	a5,0(a0)
    80006130:	0087b783          	ld	a5,8(a5)
    80006134:	000780e7          	jalr	a5
}
    80006138:	01813083          	ld	ra,24(sp)
    8000613c:	01013403          	ld	s0,16(sp)
    80006140:	00813483          	ld	s1,8(sp)
    80006144:	02010113          	addi	sp,sp,32
    80006148:	00008067          	ret

000000008000614c <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    8000614c:	fe010113          	addi	sp,sp,-32
    80006150:	00113c23          	sd	ra,24(sp)
    80006154:	00813823          	sd	s0,16(sp)
    80006158:	00913423          	sd	s1,8(sp)
    8000615c:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80006160:	00003517          	auipc	a0,0x3
    80006164:	2c850513          	addi	a0,a0,712 # 80009428 <CONSOLE_STATUS+0x418>
    80006168:	00000097          	auipc	ra,0x0
    8000616c:	91c080e7          	jalr	-1764(ra) # 80005a84 <_Z11printStringPKc>
    int test = getc() - '0';
    80006170:	ffffb097          	auipc	ra,0xffffb
    80006174:	3f8080e7          	jalr	1016(ra) # 80001568 <_Z4getcv>
    80006178:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    8000617c:	ffffb097          	auipc	ra,0xffffb
    80006180:	3ec080e7          	jalr	1004(ra) # 80001568 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80006184:	00700793          	li	a5,7
    80006188:	1097e263          	bltu	a5,s1,8000628c <_Z8userMainv+0x140>
    8000618c:	00249493          	slli	s1,s1,0x2
    80006190:	00003717          	auipc	a4,0x3
    80006194:	4f070713          	addi	a4,a4,1264 # 80009680 <CONSOLE_STATUS+0x670>
    80006198:	00e484b3          	add	s1,s1,a4
    8000619c:	0004a783          	lw	a5,0(s1)
    800061a0:	00e787b3          	add	a5,a5,a4
    800061a4:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    800061a8:	fffff097          	auipc	ra,0xfffff
    800061ac:	f54080e7          	jalr	-172(ra) # 800050fc <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    800061b0:	00003517          	auipc	a0,0x3
    800061b4:	29850513          	addi	a0,a0,664 # 80009448 <CONSOLE_STATUS+0x438>
    800061b8:	00000097          	auipc	ra,0x0
    800061bc:	8cc080e7          	jalr	-1844(ra) # 80005a84 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    800061c0:	01813083          	ld	ra,24(sp)
    800061c4:	01013403          	ld	s0,16(sp)
    800061c8:	00813483          	ld	s1,8(sp)
    800061cc:	02010113          	addi	sp,sp,32
    800061d0:	00008067          	ret
            Threads_CPP_API_test();
    800061d4:	ffffe097          	auipc	ra,0xffffe
    800061d8:	e08080e7          	jalr	-504(ra) # 80003fdc <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    800061dc:	00003517          	auipc	a0,0x3
    800061e0:	2ac50513          	addi	a0,a0,684 # 80009488 <CONSOLE_STATUS+0x478>
    800061e4:	00000097          	auipc	ra,0x0
    800061e8:	8a0080e7          	jalr	-1888(ra) # 80005a84 <_Z11printStringPKc>
            break;
    800061ec:	fd5ff06f          	j	800061c0 <_Z8userMainv+0x74>
            producerConsumer_C_API();
    800061f0:	ffffd097          	auipc	ra,0xffffd
    800061f4:	640080e7          	jalr	1600(ra) # 80003830 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    800061f8:	00003517          	auipc	a0,0x3
    800061fc:	2d050513          	addi	a0,a0,720 # 800094c8 <CONSOLE_STATUS+0x4b8>
    80006200:	00000097          	auipc	ra,0x0
    80006204:	884080e7          	jalr	-1916(ra) # 80005a84 <_Z11printStringPKc>
            break;
    80006208:	fb9ff06f          	j	800061c0 <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    8000620c:	fffff097          	auipc	ra,0xfffff
    80006210:	234080e7          	jalr	564(ra) # 80005440 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80006214:	00003517          	auipc	a0,0x3
    80006218:	30450513          	addi	a0,a0,772 # 80009518 <CONSOLE_STATUS+0x508>
    8000621c:	00000097          	auipc	ra,0x0
    80006220:	868080e7          	jalr	-1944(ra) # 80005a84 <_Z11printStringPKc>
            break;
    80006224:	f9dff06f          	j	800061c0 <_Z8userMainv+0x74>
            testSleeping();
    80006228:	00000097          	auipc	ra,0x0
    8000622c:	11c080e7          	jalr	284(ra) # 80006344 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    80006230:	00003517          	auipc	a0,0x3
    80006234:	34050513          	addi	a0,a0,832 # 80009570 <CONSOLE_STATUS+0x560>
    80006238:	00000097          	auipc	ra,0x0
    8000623c:	84c080e7          	jalr	-1972(ra) # 80005a84 <_Z11printStringPKc>
            break;
    80006240:	f81ff06f          	j	800061c0 <_Z8userMainv+0x74>
            testConsumerProducer();
    80006244:	ffffe097          	auipc	ra,0xffffe
    80006248:	258080e7          	jalr	600(ra) # 8000449c <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    8000624c:	00003517          	auipc	a0,0x3
    80006250:	35450513          	addi	a0,a0,852 # 800095a0 <CONSOLE_STATUS+0x590>
    80006254:	00000097          	auipc	ra,0x0
    80006258:	830080e7          	jalr	-2000(ra) # 80005a84 <_Z11printStringPKc>
            break;
    8000625c:	f65ff06f          	j	800061c0 <_Z8userMainv+0x74>
            System_Mode_test();
    80006260:	00000097          	auipc	ra,0x0
    80006264:	658080e7          	jalr	1624(ra) # 800068b8 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80006268:	00003517          	auipc	a0,0x3
    8000626c:	37850513          	addi	a0,a0,888 # 800095e0 <CONSOLE_STATUS+0x5d0>
    80006270:	00000097          	auipc	ra,0x0
    80006274:	814080e7          	jalr	-2028(ra) # 80005a84 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80006278:	00003517          	auipc	a0,0x3
    8000627c:	38850513          	addi	a0,a0,904 # 80009600 <CONSOLE_STATUS+0x5f0>
    80006280:	00000097          	auipc	ra,0x0
    80006284:	804080e7          	jalr	-2044(ra) # 80005a84 <_Z11printStringPKc>
            break;
    80006288:	f39ff06f          	j	800061c0 <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    8000628c:	00003517          	auipc	a0,0x3
    80006290:	3cc50513          	addi	a0,a0,972 # 80009658 <CONSOLE_STATUS+0x648>
    80006294:	fffff097          	auipc	ra,0xfffff
    80006298:	7f0080e7          	jalr	2032(ra) # 80005a84 <_Z11printStringPKc>
    8000629c:	f25ff06f          	j	800061c0 <_Z8userMainv+0x74>

00000000800062a0 <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    800062a0:	fe010113          	addi	sp,sp,-32
    800062a4:	00113c23          	sd	ra,24(sp)
    800062a8:	00813823          	sd	s0,16(sp)
    800062ac:	00913423          	sd	s1,8(sp)
    800062b0:	01213023          	sd	s2,0(sp)
    800062b4:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    800062b8:	00053903          	ld	s2,0(a0)
    int i = 6;
    800062bc:	00600493          	li	s1,6
    while (--i > 0) {
    800062c0:	fff4849b          	addiw	s1,s1,-1
    800062c4:	04905463          	blez	s1,8000630c <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    800062c8:	00003517          	auipc	a0,0x3
    800062cc:	3d850513          	addi	a0,a0,984 # 800096a0 <CONSOLE_STATUS+0x690>
    800062d0:	fffff097          	auipc	ra,0xfffff
    800062d4:	7b4080e7          	jalr	1972(ra) # 80005a84 <_Z11printStringPKc>
        printInt(sleep_time);
    800062d8:	00000613          	li	a2,0
    800062dc:	00a00593          	li	a1,10
    800062e0:	0009051b          	sext.w	a0,s2
    800062e4:	00000097          	auipc	ra,0x0
    800062e8:	950080e7          	jalr	-1712(ra) # 80005c34 <_Z8printIntiii>
        printString(" !\n");
    800062ec:	00003517          	auipc	a0,0x3
    800062f0:	3bc50513          	addi	a0,a0,956 # 800096a8 <CONSOLE_STATUS+0x698>
    800062f4:	fffff097          	auipc	ra,0xfffff
    800062f8:	790080e7          	jalr	1936(ra) # 80005a84 <_Z11printStringPKc>
        time_sleep(sleep_time);
    800062fc:	00090513          	mv	a0,s2
    80006300:	ffffb097          	auipc	ra,0xffffb
    80006304:	170080e7          	jalr	368(ra) # 80001470 <_Z10time_sleepm>
    while (--i > 0) {
    80006308:	fb9ff06f          	j	800062c0 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    8000630c:	00a00793          	li	a5,10
    80006310:	02f95933          	divu	s2,s2,a5
    80006314:	fff90913          	addi	s2,s2,-1
    80006318:	00006797          	auipc	a5,0x6
    8000631c:	94878793          	addi	a5,a5,-1720 # 8000bc60 <_ZL8finished>
    80006320:	01278933          	add	s2,a5,s2
    80006324:	00100793          	li	a5,1
    80006328:	00f90023          	sb	a5,0(s2)
}
    8000632c:	01813083          	ld	ra,24(sp)
    80006330:	01013403          	ld	s0,16(sp)
    80006334:	00813483          	ld	s1,8(sp)
    80006338:	00013903          	ld	s2,0(sp)
    8000633c:	02010113          	addi	sp,sp,32
    80006340:	00008067          	ret

0000000080006344 <_Z12testSleepingv>:

void testSleeping() {
    80006344:	fc010113          	addi	sp,sp,-64
    80006348:	02113c23          	sd	ra,56(sp)
    8000634c:	02813823          	sd	s0,48(sp)
    80006350:	02913423          	sd	s1,40(sp)
    80006354:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    80006358:	00a00793          	li	a5,10
    8000635c:	fcf43823          	sd	a5,-48(s0)
    80006360:	01400793          	li	a5,20
    80006364:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    80006368:	00000493          	li	s1,0
    8000636c:	02c0006f          	j	80006398 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    80006370:	00349793          	slli	a5,s1,0x3
    80006374:	fd040613          	addi	a2,s0,-48
    80006378:	00f60633          	add	a2,a2,a5
    8000637c:	00000597          	auipc	a1,0x0
    80006380:	f2458593          	addi	a1,a1,-220 # 800062a0 <_ZL9sleepyRunPv>
    80006384:	fc040513          	addi	a0,s0,-64
    80006388:	00f50533          	add	a0,a0,a5
    8000638c:	ffffb097          	auipc	ra,0xffffb
    80006390:	ff4080e7          	jalr	-12(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80006394:	0014849b          	addiw	s1,s1,1
    80006398:	00100793          	li	a5,1
    8000639c:	fc97dae3          	bge	a5,s1,80006370 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    800063a0:	00006797          	auipc	a5,0x6
    800063a4:	8c07c783          	lbu	a5,-1856(a5) # 8000bc60 <_ZL8finished>
    800063a8:	fe078ce3          	beqz	a5,800063a0 <_Z12testSleepingv+0x5c>
    800063ac:	00006797          	auipc	a5,0x6
    800063b0:	8b57c783          	lbu	a5,-1867(a5) # 8000bc61 <_ZL8finished+0x1>
    800063b4:	fe0786e3          	beqz	a5,800063a0 <_Z12testSleepingv+0x5c>
}
    800063b8:	03813083          	ld	ra,56(sp)
    800063bc:	03013403          	ld	s0,48(sp)
    800063c0:	02813483          	ld	s1,40(sp)
    800063c4:	04010113          	addi	sp,sp,64
    800063c8:	00008067          	ret

00000000800063cc <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800063cc:	fe010113          	addi	sp,sp,-32
    800063d0:	00113c23          	sd	ra,24(sp)
    800063d4:	00813823          	sd	s0,16(sp)
    800063d8:	00913423          	sd	s1,8(sp)
    800063dc:	01213023          	sd	s2,0(sp)
    800063e0:	02010413          	addi	s0,sp,32
    800063e4:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800063e8:	00100793          	li	a5,1
    800063ec:	02a7f863          	bgeu	a5,a0,8000641c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800063f0:	00a00793          	li	a5,10
    800063f4:	02f577b3          	remu	a5,a0,a5
    800063f8:	02078e63          	beqz	a5,80006434 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800063fc:	fff48513          	addi	a0,s1,-1
    80006400:	00000097          	auipc	ra,0x0
    80006404:	fcc080e7          	jalr	-52(ra) # 800063cc <_ZL9fibonaccim>
    80006408:	00050913          	mv	s2,a0
    8000640c:	ffe48513          	addi	a0,s1,-2
    80006410:	00000097          	auipc	ra,0x0
    80006414:	fbc080e7          	jalr	-68(ra) # 800063cc <_ZL9fibonaccim>
    80006418:	00a90533          	add	a0,s2,a0
}
    8000641c:	01813083          	ld	ra,24(sp)
    80006420:	01013403          	ld	s0,16(sp)
    80006424:	00813483          	ld	s1,8(sp)
    80006428:	00013903          	ld	s2,0(sp)
    8000642c:	02010113          	addi	sp,sp,32
    80006430:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80006434:	ffffb097          	auipc	ra,0xffffb
    80006438:	ff4080e7          	jalr	-12(ra) # 80001428 <_Z15thread_dispatchv>
    8000643c:	fc1ff06f          	j	800063fc <_ZL9fibonaccim+0x30>

0000000080006440 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80006440:	fe010113          	addi	sp,sp,-32
    80006444:	00113c23          	sd	ra,24(sp)
    80006448:	00813823          	sd	s0,16(sp)
    8000644c:	00913423          	sd	s1,8(sp)
    80006450:	01213023          	sd	s2,0(sp)
    80006454:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80006458:	00a00493          	li	s1,10
    8000645c:	0400006f          	j	8000649c <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006460:	00003517          	auipc	a0,0x3
    80006464:	f0850513          	addi	a0,a0,-248 # 80009368 <CONSOLE_STATUS+0x358>
    80006468:	fffff097          	auipc	ra,0xfffff
    8000646c:	61c080e7          	jalr	1564(ra) # 80005a84 <_Z11printStringPKc>
    80006470:	00000613          	li	a2,0
    80006474:	00a00593          	li	a1,10
    80006478:	00048513          	mv	a0,s1
    8000647c:	fffff097          	auipc	ra,0xfffff
    80006480:	7b8080e7          	jalr	1976(ra) # 80005c34 <_Z8printIntiii>
    80006484:	00003517          	auipc	a0,0x3
    80006488:	0e450513          	addi	a0,a0,228 # 80009568 <CONSOLE_STATUS+0x558>
    8000648c:	fffff097          	auipc	ra,0xfffff
    80006490:	5f8080e7          	jalr	1528(ra) # 80005a84 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80006494:	0014849b          	addiw	s1,s1,1
    80006498:	0ff4f493          	andi	s1,s1,255
    8000649c:	00c00793          	li	a5,12
    800064a0:	fc97f0e3          	bgeu	a5,s1,80006460 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800064a4:	00003517          	auipc	a0,0x3
    800064a8:	ecc50513          	addi	a0,a0,-308 # 80009370 <CONSOLE_STATUS+0x360>
    800064ac:	fffff097          	auipc	ra,0xfffff
    800064b0:	5d8080e7          	jalr	1496(ra) # 80005a84 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800064b4:	00500313          	li	t1,5
    thread_dispatch();
    800064b8:	ffffb097          	auipc	ra,0xffffb
    800064bc:	f70080e7          	jalr	-144(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800064c0:	01000513          	li	a0,16
    800064c4:	00000097          	auipc	ra,0x0
    800064c8:	f08080e7          	jalr	-248(ra) # 800063cc <_ZL9fibonaccim>
    800064cc:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800064d0:	00003517          	auipc	a0,0x3
    800064d4:	eb050513          	addi	a0,a0,-336 # 80009380 <CONSOLE_STATUS+0x370>
    800064d8:	fffff097          	auipc	ra,0xfffff
    800064dc:	5ac080e7          	jalr	1452(ra) # 80005a84 <_Z11printStringPKc>
    800064e0:	00000613          	li	a2,0
    800064e4:	00a00593          	li	a1,10
    800064e8:	0009051b          	sext.w	a0,s2
    800064ec:	fffff097          	auipc	ra,0xfffff
    800064f0:	748080e7          	jalr	1864(ra) # 80005c34 <_Z8printIntiii>
    800064f4:	00003517          	auipc	a0,0x3
    800064f8:	07450513          	addi	a0,a0,116 # 80009568 <CONSOLE_STATUS+0x558>
    800064fc:	fffff097          	auipc	ra,0xfffff
    80006500:	588080e7          	jalr	1416(ra) # 80005a84 <_Z11printStringPKc>
    80006504:	0400006f          	j	80006544 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006508:	00003517          	auipc	a0,0x3
    8000650c:	e6050513          	addi	a0,a0,-416 # 80009368 <CONSOLE_STATUS+0x358>
    80006510:	fffff097          	auipc	ra,0xfffff
    80006514:	574080e7          	jalr	1396(ra) # 80005a84 <_Z11printStringPKc>
    80006518:	00000613          	li	a2,0
    8000651c:	00a00593          	li	a1,10
    80006520:	00048513          	mv	a0,s1
    80006524:	fffff097          	auipc	ra,0xfffff
    80006528:	710080e7          	jalr	1808(ra) # 80005c34 <_Z8printIntiii>
    8000652c:	00003517          	auipc	a0,0x3
    80006530:	03c50513          	addi	a0,a0,60 # 80009568 <CONSOLE_STATUS+0x558>
    80006534:	fffff097          	auipc	ra,0xfffff
    80006538:	550080e7          	jalr	1360(ra) # 80005a84 <_Z11printStringPKc>
    for (; i < 16; i++) {
    8000653c:	0014849b          	addiw	s1,s1,1
    80006540:	0ff4f493          	andi	s1,s1,255
    80006544:	00f00793          	li	a5,15
    80006548:	fc97f0e3          	bgeu	a5,s1,80006508 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    8000654c:	00003517          	auipc	a0,0x3
    80006550:	e4450513          	addi	a0,a0,-444 # 80009390 <CONSOLE_STATUS+0x380>
    80006554:	fffff097          	auipc	ra,0xfffff
    80006558:	530080e7          	jalr	1328(ra) # 80005a84 <_Z11printStringPKc>
    finishedD = true;
    8000655c:	00100793          	li	a5,1
    80006560:	00005717          	auipc	a4,0x5
    80006564:	70f70123          	sb	a5,1794(a4) # 8000bc62 <_ZL9finishedD>
    thread_dispatch();
    80006568:	ffffb097          	auipc	ra,0xffffb
    8000656c:	ec0080e7          	jalr	-320(ra) # 80001428 <_Z15thread_dispatchv>
}
    80006570:	01813083          	ld	ra,24(sp)
    80006574:	01013403          	ld	s0,16(sp)
    80006578:	00813483          	ld	s1,8(sp)
    8000657c:	00013903          	ld	s2,0(sp)
    80006580:	02010113          	addi	sp,sp,32
    80006584:	00008067          	ret

0000000080006588 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80006588:	fe010113          	addi	sp,sp,-32
    8000658c:	00113c23          	sd	ra,24(sp)
    80006590:	00813823          	sd	s0,16(sp)
    80006594:	00913423          	sd	s1,8(sp)
    80006598:	01213023          	sd	s2,0(sp)
    8000659c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800065a0:	00000493          	li	s1,0
    800065a4:	0400006f          	j	800065e4 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800065a8:	00003517          	auipc	a0,0x3
    800065ac:	d9050513          	addi	a0,a0,-624 # 80009338 <CONSOLE_STATUS+0x328>
    800065b0:	fffff097          	auipc	ra,0xfffff
    800065b4:	4d4080e7          	jalr	1236(ra) # 80005a84 <_Z11printStringPKc>
    800065b8:	00000613          	li	a2,0
    800065bc:	00a00593          	li	a1,10
    800065c0:	00048513          	mv	a0,s1
    800065c4:	fffff097          	auipc	ra,0xfffff
    800065c8:	670080e7          	jalr	1648(ra) # 80005c34 <_Z8printIntiii>
    800065cc:	00003517          	auipc	a0,0x3
    800065d0:	f9c50513          	addi	a0,a0,-100 # 80009568 <CONSOLE_STATUS+0x558>
    800065d4:	fffff097          	auipc	ra,0xfffff
    800065d8:	4b0080e7          	jalr	1200(ra) # 80005a84 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800065dc:	0014849b          	addiw	s1,s1,1
    800065e0:	0ff4f493          	andi	s1,s1,255
    800065e4:	00200793          	li	a5,2
    800065e8:	fc97f0e3          	bgeu	a5,s1,800065a8 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    800065ec:	00003517          	auipc	a0,0x3
    800065f0:	d5450513          	addi	a0,a0,-684 # 80009340 <CONSOLE_STATUS+0x330>
    800065f4:	fffff097          	auipc	ra,0xfffff
    800065f8:	490080e7          	jalr	1168(ra) # 80005a84 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800065fc:	00700313          	li	t1,7
    thread_dispatch();
    80006600:	ffffb097          	auipc	ra,0xffffb
    80006604:	e28080e7          	jalr	-472(ra) # 80001428 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80006608:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    8000660c:	00003517          	auipc	a0,0x3
    80006610:	d4450513          	addi	a0,a0,-700 # 80009350 <CONSOLE_STATUS+0x340>
    80006614:	fffff097          	auipc	ra,0xfffff
    80006618:	470080e7          	jalr	1136(ra) # 80005a84 <_Z11printStringPKc>
    8000661c:	00000613          	li	a2,0
    80006620:	00a00593          	li	a1,10
    80006624:	0009051b          	sext.w	a0,s2
    80006628:	fffff097          	auipc	ra,0xfffff
    8000662c:	60c080e7          	jalr	1548(ra) # 80005c34 <_Z8printIntiii>
    80006630:	00003517          	auipc	a0,0x3
    80006634:	f3850513          	addi	a0,a0,-200 # 80009568 <CONSOLE_STATUS+0x558>
    80006638:	fffff097          	auipc	ra,0xfffff
    8000663c:	44c080e7          	jalr	1100(ra) # 80005a84 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80006640:	00c00513          	li	a0,12
    80006644:	00000097          	auipc	ra,0x0
    80006648:	d88080e7          	jalr	-632(ra) # 800063cc <_ZL9fibonaccim>
    8000664c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006650:	00003517          	auipc	a0,0x3
    80006654:	d0850513          	addi	a0,a0,-760 # 80009358 <CONSOLE_STATUS+0x348>
    80006658:	fffff097          	auipc	ra,0xfffff
    8000665c:	42c080e7          	jalr	1068(ra) # 80005a84 <_Z11printStringPKc>
    80006660:	00000613          	li	a2,0
    80006664:	00a00593          	li	a1,10
    80006668:	0009051b          	sext.w	a0,s2
    8000666c:	fffff097          	auipc	ra,0xfffff
    80006670:	5c8080e7          	jalr	1480(ra) # 80005c34 <_Z8printIntiii>
    80006674:	00003517          	auipc	a0,0x3
    80006678:	ef450513          	addi	a0,a0,-268 # 80009568 <CONSOLE_STATUS+0x558>
    8000667c:	fffff097          	auipc	ra,0xfffff
    80006680:	408080e7          	jalr	1032(ra) # 80005a84 <_Z11printStringPKc>
    80006684:	0400006f          	j	800066c4 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80006688:	00003517          	auipc	a0,0x3
    8000668c:	cb050513          	addi	a0,a0,-848 # 80009338 <CONSOLE_STATUS+0x328>
    80006690:	fffff097          	auipc	ra,0xfffff
    80006694:	3f4080e7          	jalr	1012(ra) # 80005a84 <_Z11printStringPKc>
    80006698:	00000613          	li	a2,0
    8000669c:	00a00593          	li	a1,10
    800066a0:	00048513          	mv	a0,s1
    800066a4:	fffff097          	auipc	ra,0xfffff
    800066a8:	590080e7          	jalr	1424(ra) # 80005c34 <_Z8printIntiii>
    800066ac:	00003517          	auipc	a0,0x3
    800066b0:	ebc50513          	addi	a0,a0,-324 # 80009568 <CONSOLE_STATUS+0x558>
    800066b4:	fffff097          	auipc	ra,0xfffff
    800066b8:	3d0080e7          	jalr	976(ra) # 80005a84 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800066bc:	0014849b          	addiw	s1,s1,1
    800066c0:	0ff4f493          	andi	s1,s1,255
    800066c4:	00500793          	li	a5,5
    800066c8:	fc97f0e3          	bgeu	a5,s1,80006688 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    800066cc:	00003517          	auipc	a0,0x3
    800066d0:	c4450513          	addi	a0,a0,-956 # 80009310 <CONSOLE_STATUS+0x300>
    800066d4:	fffff097          	auipc	ra,0xfffff
    800066d8:	3b0080e7          	jalr	944(ra) # 80005a84 <_Z11printStringPKc>
    finishedC = true;
    800066dc:	00100793          	li	a5,1
    800066e0:	00005717          	auipc	a4,0x5
    800066e4:	58f701a3          	sb	a5,1411(a4) # 8000bc63 <_ZL9finishedC>
    thread_dispatch();
    800066e8:	ffffb097          	auipc	ra,0xffffb
    800066ec:	d40080e7          	jalr	-704(ra) # 80001428 <_Z15thread_dispatchv>
}
    800066f0:	01813083          	ld	ra,24(sp)
    800066f4:	01013403          	ld	s0,16(sp)
    800066f8:	00813483          	ld	s1,8(sp)
    800066fc:	00013903          	ld	s2,0(sp)
    80006700:	02010113          	addi	sp,sp,32
    80006704:	00008067          	ret

0000000080006708 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80006708:	fe010113          	addi	sp,sp,-32
    8000670c:	00113c23          	sd	ra,24(sp)
    80006710:	00813823          	sd	s0,16(sp)
    80006714:	00913423          	sd	s1,8(sp)
    80006718:	01213023          	sd	s2,0(sp)
    8000671c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006720:	00000913          	li	s2,0
    80006724:	0400006f          	j	80006764 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    80006728:	ffffb097          	auipc	ra,0xffffb
    8000672c:	d00080e7          	jalr	-768(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006730:	00148493          	addi	s1,s1,1
    80006734:	000027b7          	lui	a5,0x2
    80006738:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000673c:	0097ee63          	bltu	a5,s1,80006758 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006740:	00000713          	li	a4,0
    80006744:	000077b7          	lui	a5,0x7
    80006748:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000674c:	fce7eee3          	bltu	a5,a4,80006728 <_ZL11workerBodyBPv+0x20>
    80006750:	00170713          	addi	a4,a4,1
    80006754:	ff1ff06f          	j	80006744 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    80006758:	00a00793          	li	a5,10
    8000675c:	04f90663          	beq	s2,a5,800067a8 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80006760:	00190913          	addi	s2,s2,1
    80006764:	00f00793          	li	a5,15
    80006768:	0527e463          	bltu	a5,s2,800067b0 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    8000676c:	00003517          	auipc	a0,0x3
    80006770:	bb450513          	addi	a0,a0,-1100 # 80009320 <CONSOLE_STATUS+0x310>
    80006774:	fffff097          	auipc	ra,0xfffff
    80006778:	310080e7          	jalr	784(ra) # 80005a84 <_Z11printStringPKc>
    8000677c:	00000613          	li	a2,0
    80006780:	00a00593          	li	a1,10
    80006784:	0009051b          	sext.w	a0,s2
    80006788:	fffff097          	auipc	ra,0xfffff
    8000678c:	4ac080e7          	jalr	1196(ra) # 80005c34 <_Z8printIntiii>
    80006790:	00003517          	auipc	a0,0x3
    80006794:	dd850513          	addi	a0,a0,-552 # 80009568 <CONSOLE_STATUS+0x558>
    80006798:	fffff097          	auipc	ra,0xfffff
    8000679c:	2ec080e7          	jalr	748(ra) # 80005a84 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800067a0:	00000493          	li	s1,0
    800067a4:	f91ff06f          	j	80006734 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    800067a8:	14102ff3          	csrr	t6,sepc
    800067ac:	fb5ff06f          	j	80006760 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    800067b0:	00003517          	auipc	a0,0x3
    800067b4:	b7850513          	addi	a0,a0,-1160 # 80009328 <CONSOLE_STATUS+0x318>
    800067b8:	fffff097          	auipc	ra,0xfffff
    800067bc:	2cc080e7          	jalr	716(ra) # 80005a84 <_Z11printStringPKc>
    finishedB = true;
    800067c0:	00100793          	li	a5,1
    800067c4:	00005717          	auipc	a4,0x5
    800067c8:	4af70023          	sb	a5,1184(a4) # 8000bc64 <_ZL9finishedB>
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

00000000800067ec <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    800067ec:	fe010113          	addi	sp,sp,-32
    800067f0:	00113c23          	sd	ra,24(sp)
    800067f4:	00813823          	sd	s0,16(sp)
    800067f8:	00913423          	sd	s1,8(sp)
    800067fc:	01213023          	sd	s2,0(sp)
    80006800:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006804:	00000913          	li	s2,0
    80006808:	0380006f          	j	80006840 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    8000680c:	ffffb097          	auipc	ra,0xffffb
    80006810:	c1c080e7          	jalr	-996(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006814:	00148493          	addi	s1,s1,1
    80006818:	000027b7          	lui	a5,0x2
    8000681c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006820:	0097ee63          	bltu	a5,s1,8000683c <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006824:	00000713          	li	a4,0
    80006828:	000077b7          	lui	a5,0x7
    8000682c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006830:	fce7eee3          	bltu	a5,a4,8000680c <_ZL11workerBodyAPv+0x20>
    80006834:	00170713          	addi	a4,a4,1
    80006838:	ff1ff06f          	j	80006828 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    8000683c:	00190913          	addi	s2,s2,1
    80006840:	00900793          	li	a5,9
    80006844:	0527e063          	bltu	a5,s2,80006884 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80006848:	00003517          	auipc	a0,0x3
    8000684c:	ac050513          	addi	a0,a0,-1344 # 80009308 <CONSOLE_STATUS+0x2f8>
    80006850:	fffff097          	auipc	ra,0xfffff
    80006854:	234080e7          	jalr	564(ra) # 80005a84 <_Z11printStringPKc>
    80006858:	00000613          	li	a2,0
    8000685c:	00a00593          	li	a1,10
    80006860:	0009051b          	sext.w	a0,s2
    80006864:	fffff097          	auipc	ra,0xfffff
    80006868:	3d0080e7          	jalr	976(ra) # 80005c34 <_Z8printIntiii>
    8000686c:	00003517          	auipc	a0,0x3
    80006870:	cfc50513          	addi	a0,a0,-772 # 80009568 <CONSOLE_STATUS+0x558>
    80006874:	fffff097          	auipc	ra,0xfffff
    80006878:	210080e7          	jalr	528(ra) # 80005a84 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    8000687c:	00000493          	li	s1,0
    80006880:	f99ff06f          	j	80006818 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80006884:	00003517          	auipc	a0,0x3
    80006888:	a8c50513          	addi	a0,a0,-1396 # 80009310 <CONSOLE_STATUS+0x300>
    8000688c:	fffff097          	auipc	ra,0xfffff
    80006890:	1f8080e7          	jalr	504(ra) # 80005a84 <_Z11printStringPKc>
    finishedA = true;
    80006894:	00100793          	li	a5,1
    80006898:	00005717          	auipc	a4,0x5
    8000689c:	3cf706a3          	sb	a5,973(a4) # 8000bc65 <_ZL9finishedA>
}
    800068a0:	01813083          	ld	ra,24(sp)
    800068a4:	01013403          	ld	s0,16(sp)
    800068a8:	00813483          	ld	s1,8(sp)
    800068ac:	00013903          	ld	s2,0(sp)
    800068b0:	02010113          	addi	sp,sp,32
    800068b4:	00008067          	ret

00000000800068b8 <_Z16System_Mode_testv>:


void System_Mode_test() {
    800068b8:	fd010113          	addi	sp,sp,-48
    800068bc:	02113423          	sd	ra,40(sp)
    800068c0:	02813023          	sd	s0,32(sp)
    800068c4:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    800068c8:	00000613          	li	a2,0
    800068cc:	00000597          	auipc	a1,0x0
    800068d0:	f2058593          	addi	a1,a1,-224 # 800067ec <_ZL11workerBodyAPv>
    800068d4:	fd040513          	addi	a0,s0,-48
    800068d8:	ffffb097          	auipc	ra,0xffffb
    800068dc:	aa8080e7          	jalr	-1368(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    800068e0:	00003517          	auipc	a0,0x3
    800068e4:	ac050513          	addi	a0,a0,-1344 # 800093a0 <CONSOLE_STATUS+0x390>
    800068e8:	fffff097          	auipc	ra,0xfffff
    800068ec:	19c080e7          	jalr	412(ra) # 80005a84 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    800068f0:	00000613          	li	a2,0
    800068f4:	00000597          	auipc	a1,0x0
    800068f8:	e1458593          	addi	a1,a1,-492 # 80006708 <_ZL11workerBodyBPv>
    800068fc:	fd840513          	addi	a0,s0,-40
    80006900:	ffffb097          	auipc	ra,0xffffb
    80006904:	a80080e7          	jalr	-1408(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80006908:	00003517          	auipc	a0,0x3
    8000690c:	ab050513          	addi	a0,a0,-1360 # 800093b8 <CONSOLE_STATUS+0x3a8>
    80006910:	fffff097          	auipc	ra,0xfffff
    80006914:	174080e7          	jalr	372(ra) # 80005a84 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80006918:	00000613          	li	a2,0
    8000691c:	00000597          	auipc	a1,0x0
    80006920:	c6c58593          	addi	a1,a1,-916 # 80006588 <_ZL11workerBodyCPv>
    80006924:	fe040513          	addi	a0,s0,-32
    80006928:	ffffb097          	auipc	ra,0xffffb
    8000692c:	a58080e7          	jalr	-1448(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80006930:	00003517          	auipc	a0,0x3
    80006934:	aa050513          	addi	a0,a0,-1376 # 800093d0 <CONSOLE_STATUS+0x3c0>
    80006938:	fffff097          	auipc	ra,0xfffff
    8000693c:	14c080e7          	jalr	332(ra) # 80005a84 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80006940:	00000613          	li	a2,0
    80006944:	00000597          	auipc	a1,0x0
    80006948:	afc58593          	addi	a1,a1,-1284 # 80006440 <_ZL11workerBodyDPv>
    8000694c:	fe840513          	addi	a0,s0,-24
    80006950:	ffffb097          	auipc	ra,0xffffb
    80006954:	a30080e7          	jalr	-1488(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80006958:	00003517          	auipc	a0,0x3
    8000695c:	a9050513          	addi	a0,a0,-1392 # 800093e8 <CONSOLE_STATUS+0x3d8>
    80006960:	fffff097          	auipc	ra,0xfffff
    80006964:	124080e7          	jalr	292(ra) # 80005a84 <_Z11printStringPKc>
    80006968:	00c0006f          	j	80006974 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    8000696c:	ffffb097          	auipc	ra,0xffffb
    80006970:	abc080e7          	jalr	-1348(ra) # 80001428 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006974:	00005797          	auipc	a5,0x5
    80006978:	2f17c783          	lbu	a5,753(a5) # 8000bc65 <_ZL9finishedA>
    8000697c:	fe0788e3          	beqz	a5,8000696c <_Z16System_Mode_testv+0xb4>
    80006980:	00005797          	auipc	a5,0x5
    80006984:	2e47c783          	lbu	a5,740(a5) # 8000bc64 <_ZL9finishedB>
    80006988:	fe0782e3          	beqz	a5,8000696c <_Z16System_Mode_testv+0xb4>
    8000698c:	00005797          	auipc	a5,0x5
    80006990:	2d77c783          	lbu	a5,727(a5) # 8000bc63 <_ZL9finishedC>
    80006994:	fc078ce3          	beqz	a5,8000696c <_Z16System_Mode_testv+0xb4>
    80006998:	00005797          	auipc	a5,0x5
    8000699c:	2ca7c783          	lbu	a5,714(a5) # 8000bc62 <_ZL9finishedD>
    800069a0:	fc0786e3          	beqz	a5,8000696c <_Z16System_Mode_testv+0xb4>
    }

}
    800069a4:	02813083          	ld	ra,40(sp)
    800069a8:	02013403          	ld	s0,32(sp)
    800069ac:	03010113          	addi	sp,sp,48
    800069b0:	00008067          	ret

00000000800069b4 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    800069b4:	fe010113          	addi	sp,sp,-32
    800069b8:	00113c23          	sd	ra,24(sp)
    800069bc:	00813823          	sd	s0,16(sp)
    800069c0:	00913423          	sd	s1,8(sp)
    800069c4:	01213023          	sd	s2,0(sp)
    800069c8:	02010413          	addi	s0,sp,32
    800069cc:	00050493          	mv	s1,a0
    800069d0:	00058913          	mv	s2,a1
    800069d4:	0015879b          	addiw	a5,a1,1
    800069d8:	0007851b          	sext.w	a0,a5
    800069dc:	00f4a023          	sw	a5,0(s1)
    800069e0:	0004a823          	sw	zero,16(s1)
    800069e4:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    800069e8:	00251513          	slli	a0,a0,0x2
    800069ec:	ffffb097          	auipc	ra,0xffffb
    800069f0:	924080e7          	jalr	-1756(ra) # 80001310 <_Z9mem_allocm>
    800069f4:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    800069f8:	00000593          	li	a1,0
    800069fc:	02048513          	addi	a0,s1,32
    80006a00:	ffffb097          	auipc	ra,0xffffb
    80006a04:	aa0080e7          	jalr	-1376(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&spaceAvailable, _cap);
    80006a08:	00090593          	mv	a1,s2
    80006a0c:	01848513          	addi	a0,s1,24
    80006a10:	ffffb097          	auipc	ra,0xffffb
    80006a14:	a90080e7          	jalr	-1392(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&mutexHead, 1);
    80006a18:	00100593          	li	a1,1
    80006a1c:	02848513          	addi	a0,s1,40
    80006a20:	ffffb097          	auipc	ra,0xffffb
    80006a24:	a80080e7          	jalr	-1408(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&mutexTail, 1);
    80006a28:	00100593          	li	a1,1
    80006a2c:	03048513          	addi	a0,s1,48
    80006a30:	ffffb097          	auipc	ra,0xffffb
    80006a34:	a70080e7          	jalr	-1424(ra) # 800014a0 <_Z8sem_openPP4KSemj>
}
    80006a38:	01813083          	ld	ra,24(sp)
    80006a3c:	01013403          	ld	s0,16(sp)
    80006a40:	00813483          	ld	s1,8(sp)
    80006a44:	00013903          	ld	s2,0(sp)
    80006a48:	02010113          	addi	sp,sp,32
    80006a4c:	00008067          	ret

0000000080006a50 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80006a50:	fe010113          	addi	sp,sp,-32
    80006a54:	00113c23          	sd	ra,24(sp)
    80006a58:	00813823          	sd	s0,16(sp)
    80006a5c:	00913423          	sd	s1,8(sp)
    80006a60:	01213023          	sd	s2,0(sp)
    80006a64:	02010413          	addi	s0,sp,32
    80006a68:	00050493          	mv	s1,a0
    80006a6c:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80006a70:	01853503          	ld	a0,24(a0)
    80006a74:	ffffb097          	auipc	ra,0xffffb
    80006a78:	a94080e7          	jalr	-1388(ra) # 80001508 <_Z8sem_waitP4KSem>

    sem_wait(mutexTail);
    80006a7c:	0304b503          	ld	a0,48(s1)
    80006a80:	ffffb097          	auipc	ra,0xffffb
    80006a84:	a88080e7          	jalr	-1400(ra) # 80001508 <_Z8sem_waitP4KSem>
    buffer[tail] = val;
    80006a88:	0084b783          	ld	a5,8(s1)
    80006a8c:	0144a703          	lw	a4,20(s1)
    80006a90:	00271713          	slli	a4,a4,0x2
    80006a94:	00e787b3          	add	a5,a5,a4
    80006a98:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006a9c:	0144a783          	lw	a5,20(s1)
    80006aa0:	0017879b          	addiw	a5,a5,1
    80006aa4:	0004a703          	lw	a4,0(s1)
    80006aa8:	02e7e7bb          	remw	a5,a5,a4
    80006aac:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80006ab0:	0304b503          	ld	a0,48(s1)
    80006ab4:	ffffb097          	auipc	ra,0xffffb
    80006ab8:	a84080e7          	jalr	-1404(ra) # 80001538 <_Z10sem_signalP4KSem>

    sem_signal(itemAvailable);
    80006abc:	0204b503          	ld	a0,32(s1)
    80006ac0:	ffffb097          	auipc	ra,0xffffb
    80006ac4:	a78080e7          	jalr	-1416(ra) # 80001538 <_Z10sem_signalP4KSem>

}
    80006ac8:	01813083          	ld	ra,24(sp)
    80006acc:	01013403          	ld	s0,16(sp)
    80006ad0:	00813483          	ld	s1,8(sp)
    80006ad4:	00013903          	ld	s2,0(sp)
    80006ad8:	02010113          	addi	sp,sp,32
    80006adc:	00008067          	ret

0000000080006ae0 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80006ae0:	fe010113          	addi	sp,sp,-32
    80006ae4:	00113c23          	sd	ra,24(sp)
    80006ae8:	00813823          	sd	s0,16(sp)
    80006aec:	00913423          	sd	s1,8(sp)
    80006af0:	01213023          	sd	s2,0(sp)
    80006af4:	02010413          	addi	s0,sp,32
    80006af8:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80006afc:	02053503          	ld	a0,32(a0)
    80006b00:	ffffb097          	auipc	ra,0xffffb
    80006b04:	a08080e7          	jalr	-1528(ra) # 80001508 <_Z8sem_waitP4KSem>

    sem_wait(mutexHead);
    80006b08:	0284b503          	ld	a0,40(s1)
    80006b0c:	ffffb097          	auipc	ra,0xffffb
    80006b10:	9fc080e7          	jalr	-1540(ra) # 80001508 <_Z8sem_waitP4KSem>

    int ret = buffer[head];
    80006b14:	0084b703          	ld	a4,8(s1)
    80006b18:	0104a783          	lw	a5,16(s1)
    80006b1c:	00279693          	slli	a3,a5,0x2
    80006b20:	00d70733          	add	a4,a4,a3
    80006b24:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006b28:	0017879b          	addiw	a5,a5,1
    80006b2c:	0004a703          	lw	a4,0(s1)
    80006b30:	02e7e7bb          	remw	a5,a5,a4
    80006b34:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80006b38:	0284b503          	ld	a0,40(s1)
    80006b3c:	ffffb097          	auipc	ra,0xffffb
    80006b40:	9fc080e7          	jalr	-1540(ra) # 80001538 <_Z10sem_signalP4KSem>

    sem_signal(spaceAvailable);
    80006b44:	0184b503          	ld	a0,24(s1)
    80006b48:	ffffb097          	auipc	ra,0xffffb
    80006b4c:	9f0080e7          	jalr	-1552(ra) # 80001538 <_Z10sem_signalP4KSem>

    return ret;
}
    80006b50:	00090513          	mv	a0,s2
    80006b54:	01813083          	ld	ra,24(sp)
    80006b58:	01013403          	ld	s0,16(sp)
    80006b5c:	00813483          	ld	s1,8(sp)
    80006b60:	00013903          	ld	s2,0(sp)
    80006b64:	02010113          	addi	sp,sp,32
    80006b68:	00008067          	ret

0000000080006b6c <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80006b6c:	fe010113          	addi	sp,sp,-32
    80006b70:	00113c23          	sd	ra,24(sp)
    80006b74:	00813823          	sd	s0,16(sp)
    80006b78:	00913423          	sd	s1,8(sp)
    80006b7c:	01213023          	sd	s2,0(sp)
    80006b80:	02010413          	addi	s0,sp,32
    80006b84:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80006b88:	02853503          	ld	a0,40(a0)
    80006b8c:	ffffb097          	auipc	ra,0xffffb
    80006b90:	97c080e7          	jalr	-1668(ra) # 80001508 <_Z8sem_waitP4KSem>
    sem_wait(mutexTail);
    80006b94:	0304b503          	ld	a0,48(s1)
    80006b98:	ffffb097          	auipc	ra,0xffffb
    80006b9c:	970080e7          	jalr	-1680(ra) # 80001508 <_Z8sem_waitP4KSem>

    if (tail >= head) {
    80006ba0:	0144a783          	lw	a5,20(s1)
    80006ba4:	0104a903          	lw	s2,16(s1)
    80006ba8:	0327ce63          	blt	a5,s2,80006be4 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80006bac:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80006bb0:	0304b503          	ld	a0,48(s1)
    80006bb4:	ffffb097          	auipc	ra,0xffffb
    80006bb8:	984080e7          	jalr	-1660(ra) # 80001538 <_Z10sem_signalP4KSem>
    sem_signal(mutexHead);
    80006bbc:	0284b503          	ld	a0,40(s1)
    80006bc0:	ffffb097          	auipc	ra,0xffffb
    80006bc4:	978080e7          	jalr	-1672(ra) # 80001538 <_Z10sem_signalP4KSem>

    return ret;
}
    80006bc8:	00090513          	mv	a0,s2
    80006bcc:	01813083          	ld	ra,24(sp)
    80006bd0:	01013403          	ld	s0,16(sp)
    80006bd4:	00813483          	ld	s1,8(sp)
    80006bd8:	00013903          	ld	s2,0(sp)
    80006bdc:	02010113          	addi	sp,sp,32
    80006be0:	00008067          	ret
        ret = cap - head + tail;
    80006be4:	0004a703          	lw	a4,0(s1)
    80006be8:	4127093b          	subw	s2,a4,s2
    80006bec:	00f9093b          	addw	s2,s2,a5
    80006bf0:	fc1ff06f          	j	80006bb0 <_ZN6Buffer6getCntEv+0x44>

0000000080006bf4 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80006bf4:	fe010113          	addi	sp,sp,-32
    80006bf8:	00113c23          	sd	ra,24(sp)
    80006bfc:	00813823          	sd	s0,16(sp)
    80006c00:	00913423          	sd	s1,8(sp)
    80006c04:	02010413          	addi	s0,sp,32
    80006c08:	00050493          	mv	s1,a0
    putc('\n');
    80006c0c:	00a00513          	li	a0,10
    80006c10:	ffffb097          	auipc	ra,0xffffb
    80006c14:	980080e7          	jalr	-1664(ra) # 80001590 <_Z4putcc>
    printString("Buffer deleted!\n");
    80006c18:	00002517          	auipc	a0,0x2
    80006c1c:	7f850513          	addi	a0,a0,2040 # 80009410 <CONSOLE_STATUS+0x400>
    80006c20:	fffff097          	auipc	ra,0xfffff
    80006c24:	e64080e7          	jalr	-412(ra) # 80005a84 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80006c28:	00048513          	mv	a0,s1
    80006c2c:	00000097          	auipc	ra,0x0
    80006c30:	f40080e7          	jalr	-192(ra) # 80006b6c <_ZN6Buffer6getCntEv>
    80006c34:	02a05c63          	blez	a0,80006c6c <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80006c38:	0084b783          	ld	a5,8(s1)
    80006c3c:	0104a703          	lw	a4,16(s1)
    80006c40:	00271713          	slli	a4,a4,0x2
    80006c44:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80006c48:	0007c503          	lbu	a0,0(a5)
    80006c4c:	ffffb097          	auipc	ra,0xffffb
    80006c50:	944080e7          	jalr	-1724(ra) # 80001590 <_Z4putcc>
        head = (head + 1) % cap;
    80006c54:	0104a783          	lw	a5,16(s1)
    80006c58:	0017879b          	addiw	a5,a5,1
    80006c5c:	0004a703          	lw	a4,0(s1)
    80006c60:	02e7e7bb          	remw	a5,a5,a4
    80006c64:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80006c68:	fc1ff06f          	j	80006c28 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80006c6c:	02100513          	li	a0,33
    80006c70:	ffffb097          	auipc	ra,0xffffb
    80006c74:	920080e7          	jalr	-1760(ra) # 80001590 <_Z4putcc>
    putc('\n');
    80006c78:	00a00513          	li	a0,10
    80006c7c:	ffffb097          	auipc	ra,0xffffb
    80006c80:	914080e7          	jalr	-1772(ra) # 80001590 <_Z4putcc>
    mem_free(buffer);
    80006c84:	0084b503          	ld	a0,8(s1)
    80006c88:	ffffa097          	auipc	ra,0xffffa
    80006c8c:	6c8080e7          	jalr	1736(ra) # 80001350 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80006c90:	0204b503          	ld	a0,32(s1)
    80006c94:	ffffb097          	auipc	ra,0xffffb
    80006c98:	844080e7          	jalr	-1980(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(spaceAvailable);
    80006c9c:	0184b503          	ld	a0,24(s1)
    80006ca0:	ffffb097          	auipc	ra,0xffffb
    80006ca4:	838080e7          	jalr	-1992(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(mutexTail);
    80006ca8:	0304b503          	ld	a0,48(s1)
    80006cac:	ffffb097          	auipc	ra,0xffffb
    80006cb0:	82c080e7          	jalr	-2004(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(mutexHead);
    80006cb4:	0284b503          	ld	a0,40(s1)
    80006cb8:	ffffb097          	auipc	ra,0xffffb
    80006cbc:	820080e7          	jalr	-2016(ra) # 800014d8 <_Z9sem_closeP4KSem>
}
    80006cc0:	01813083          	ld	ra,24(sp)
    80006cc4:	01013403          	ld	s0,16(sp)
    80006cc8:	00813483          	ld	s1,8(sp)
    80006ccc:	02010113          	addi	sp,sp,32
    80006cd0:	00008067          	ret

0000000080006cd4 <start>:
    80006cd4:	ff010113          	addi	sp,sp,-16
    80006cd8:	00813423          	sd	s0,8(sp)
    80006cdc:	01010413          	addi	s0,sp,16
    80006ce0:	300027f3          	csrr	a5,mstatus
    80006ce4:	ffffe737          	lui	a4,0xffffe
    80006ce8:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff192f>
    80006cec:	00e7f7b3          	and	a5,a5,a4
    80006cf0:	00001737          	lui	a4,0x1
    80006cf4:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80006cf8:	00e7e7b3          	or	a5,a5,a4
    80006cfc:	30079073          	csrw	mstatus,a5
    80006d00:	00000797          	auipc	a5,0x0
    80006d04:	16078793          	addi	a5,a5,352 # 80006e60 <system_main>
    80006d08:	34179073          	csrw	mepc,a5
    80006d0c:	00000793          	li	a5,0
    80006d10:	18079073          	csrw	satp,a5
    80006d14:	000107b7          	lui	a5,0x10
    80006d18:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80006d1c:	30279073          	csrw	medeleg,a5
    80006d20:	30379073          	csrw	mideleg,a5
    80006d24:	104027f3          	csrr	a5,sie
    80006d28:	2227e793          	ori	a5,a5,546
    80006d2c:	10479073          	csrw	sie,a5
    80006d30:	fff00793          	li	a5,-1
    80006d34:	00a7d793          	srli	a5,a5,0xa
    80006d38:	3b079073          	csrw	pmpaddr0,a5
    80006d3c:	00f00793          	li	a5,15
    80006d40:	3a079073          	csrw	pmpcfg0,a5
    80006d44:	f14027f3          	csrr	a5,mhartid
    80006d48:	0200c737          	lui	a4,0x200c
    80006d4c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80006d50:	0007869b          	sext.w	a3,a5
    80006d54:	00269713          	slli	a4,a3,0x2
    80006d58:	000f4637          	lui	a2,0xf4
    80006d5c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80006d60:	00d70733          	add	a4,a4,a3
    80006d64:	0037979b          	slliw	a5,a5,0x3
    80006d68:	020046b7          	lui	a3,0x2004
    80006d6c:	00d787b3          	add	a5,a5,a3
    80006d70:	00c585b3          	add	a1,a1,a2
    80006d74:	00371693          	slli	a3,a4,0x3
    80006d78:	00005717          	auipc	a4,0x5
    80006d7c:	ef870713          	addi	a4,a4,-264 # 8000bc70 <timer_scratch>
    80006d80:	00b7b023          	sd	a1,0(a5)
    80006d84:	00d70733          	add	a4,a4,a3
    80006d88:	00f73c23          	sd	a5,24(a4)
    80006d8c:	02c73023          	sd	a2,32(a4)
    80006d90:	34071073          	csrw	mscratch,a4
    80006d94:	00000797          	auipc	a5,0x0
    80006d98:	6ec78793          	addi	a5,a5,1772 # 80007480 <timervec>
    80006d9c:	30579073          	csrw	mtvec,a5
    80006da0:	300027f3          	csrr	a5,mstatus
    80006da4:	0087e793          	ori	a5,a5,8
    80006da8:	30079073          	csrw	mstatus,a5
    80006dac:	304027f3          	csrr	a5,mie
    80006db0:	0807e793          	ori	a5,a5,128
    80006db4:	30479073          	csrw	mie,a5
    80006db8:	f14027f3          	csrr	a5,mhartid
    80006dbc:	0007879b          	sext.w	a5,a5
    80006dc0:	00078213          	mv	tp,a5
    80006dc4:	30200073          	mret
    80006dc8:	00813403          	ld	s0,8(sp)
    80006dcc:	01010113          	addi	sp,sp,16
    80006dd0:	00008067          	ret

0000000080006dd4 <timerinit>:
    80006dd4:	ff010113          	addi	sp,sp,-16
    80006dd8:	00813423          	sd	s0,8(sp)
    80006ddc:	01010413          	addi	s0,sp,16
    80006de0:	f14027f3          	csrr	a5,mhartid
    80006de4:	0200c737          	lui	a4,0x200c
    80006de8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80006dec:	0007869b          	sext.w	a3,a5
    80006df0:	00269713          	slli	a4,a3,0x2
    80006df4:	000f4637          	lui	a2,0xf4
    80006df8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80006dfc:	00d70733          	add	a4,a4,a3
    80006e00:	0037979b          	slliw	a5,a5,0x3
    80006e04:	020046b7          	lui	a3,0x2004
    80006e08:	00d787b3          	add	a5,a5,a3
    80006e0c:	00c585b3          	add	a1,a1,a2
    80006e10:	00371693          	slli	a3,a4,0x3
    80006e14:	00005717          	auipc	a4,0x5
    80006e18:	e5c70713          	addi	a4,a4,-420 # 8000bc70 <timer_scratch>
    80006e1c:	00b7b023          	sd	a1,0(a5)
    80006e20:	00d70733          	add	a4,a4,a3
    80006e24:	00f73c23          	sd	a5,24(a4)
    80006e28:	02c73023          	sd	a2,32(a4)
    80006e2c:	34071073          	csrw	mscratch,a4
    80006e30:	00000797          	auipc	a5,0x0
    80006e34:	65078793          	addi	a5,a5,1616 # 80007480 <timervec>
    80006e38:	30579073          	csrw	mtvec,a5
    80006e3c:	300027f3          	csrr	a5,mstatus
    80006e40:	0087e793          	ori	a5,a5,8
    80006e44:	30079073          	csrw	mstatus,a5
    80006e48:	304027f3          	csrr	a5,mie
    80006e4c:	0807e793          	ori	a5,a5,128
    80006e50:	30479073          	csrw	mie,a5
    80006e54:	00813403          	ld	s0,8(sp)
    80006e58:	01010113          	addi	sp,sp,16
    80006e5c:	00008067          	ret

0000000080006e60 <system_main>:
    80006e60:	fe010113          	addi	sp,sp,-32
    80006e64:	00813823          	sd	s0,16(sp)
    80006e68:	00913423          	sd	s1,8(sp)
    80006e6c:	00113c23          	sd	ra,24(sp)
    80006e70:	02010413          	addi	s0,sp,32
    80006e74:	00000097          	auipc	ra,0x0
    80006e78:	0c4080e7          	jalr	196(ra) # 80006f38 <cpuid>
    80006e7c:	00005497          	auipc	s1,0x5
    80006e80:	c9448493          	addi	s1,s1,-876 # 8000bb10 <started>
    80006e84:	02050263          	beqz	a0,80006ea8 <system_main+0x48>
    80006e88:	0004a783          	lw	a5,0(s1)
    80006e8c:	0007879b          	sext.w	a5,a5
    80006e90:	fe078ce3          	beqz	a5,80006e88 <system_main+0x28>
    80006e94:	0ff0000f          	fence
    80006e98:	00003517          	auipc	a0,0x3
    80006e9c:	84850513          	addi	a0,a0,-1976 # 800096e0 <CONSOLE_STATUS+0x6d0>
    80006ea0:	00001097          	auipc	ra,0x1
    80006ea4:	a7c080e7          	jalr	-1412(ra) # 8000791c <panic>
    80006ea8:	00001097          	auipc	ra,0x1
    80006eac:	9d0080e7          	jalr	-1584(ra) # 80007878 <consoleinit>
    80006eb0:	00001097          	auipc	ra,0x1
    80006eb4:	15c080e7          	jalr	348(ra) # 8000800c <printfinit>
    80006eb8:	00002517          	auipc	a0,0x2
    80006ebc:	6b050513          	addi	a0,a0,1712 # 80009568 <CONSOLE_STATUS+0x558>
    80006ec0:	00001097          	auipc	ra,0x1
    80006ec4:	ab8080e7          	jalr	-1352(ra) # 80007978 <__printf>
    80006ec8:	00002517          	auipc	a0,0x2
    80006ecc:	7e850513          	addi	a0,a0,2024 # 800096b0 <CONSOLE_STATUS+0x6a0>
    80006ed0:	00001097          	auipc	ra,0x1
    80006ed4:	aa8080e7          	jalr	-1368(ra) # 80007978 <__printf>
    80006ed8:	00002517          	auipc	a0,0x2
    80006edc:	69050513          	addi	a0,a0,1680 # 80009568 <CONSOLE_STATUS+0x558>
    80006ee0:	00001097          	auipc	ra,0x1
    80006ee4:	a98080e7          	jalr	-1384(ra) # 80007978 <__printf>
    80006ee8:	00001097          	auipc	ra,0x1
    80006eec:	4b0080e7          	jalr	1200(ra) # 80008398 <kinit>
    80006ef0:	00000097          	auipc	ra,0x0
    80006ef4:	148080e7          	jalr	328(ra) # 80007038 <trapinit>
    80006ef8:	00000097          	auipc	ra,0x0
    80006efc:	16c080e7          	jalr	364(ra) # 80007064 <trapinithart>
    80006f00:	00000097          	auipc	ra,0x0
    80006f04:	5c0080e7          	jalr	1472(ra) # 800074c0 <plicinit>
    80006f08:	00000097          	auipc	ra,0x0
    80006f0c:	5e0080e7          	jalr	1504(ra) # 800074e8 <plicinithart>
    80006f10:	00000097          	auipc	ra,0x0
    80006f14:	078080e7          	jalr	120(ra) # 80006f88 <userinit>
    80006f18:	0ff0000f          	fence
    80006f1c:	00100793          	li	a5,1
    80006f20:	00002517          	auipc	a0,0x2
    80006f24:	7a850513          	addi	a0,a0,1960 # 800096c8 <CONSOLE_STATUS+0x6b8>
    80006f28:	00f4a023          	sw	a5,0(s1)
    80006f2c:	00001097          	auipc	ra,0x1
    80006f30:	a4c080e7          	jalr	-1460(ra) # 80007978 <__printf>
    80006f34:	0000006f          	j	80006f34 <system_main+0xd4>

0000000080006f38 <cpuid>:
    80006f38:	ff010113          	addi	sp,sp,-16
    80006f3c:	00813423          	sd	s0,8(sp)
    80006f40:	01010413          	addi	s0,sp,16
    80006f44:	00020513          	mv	a0,tp
    80006f48:	00813403          	ld	s0,8(sp)
    80006f4c:	0005051b          	sext.w	a0,a0
    80006f50:	01010113          	addi	sp,sp,16
    80006f54:	00008067          	ret

0000000080006f58 <mycpu>:
    80006f58:	ff010113          	addi	sp,sp,-16
    80006f5c:	00813423          	sd	s0,8(sp)
    80006f60:	01010413          	addi	s0,sp,16
    80006f64:	00020793          	mv	a5,tp
    80006f68:	00813403          	ld	s0,8(sp)
    80006f6c:	0007879b          	sext.w	a5,a5
    80006f70:	00779793          	slli	a5,a5,0x7
    80006f74:	00006517          	auipc	a0,0x6
    80006f78:	d2c50513          	addi	a0,a0,-724 # 8000cca0 <cpus>
    80006f7c:	00f50533          	add	a0,a0,a5
    80006f80:	01010113          	addi	sp,sp,16
    80006f84:	00008067          	ret

0000000080006f88 <userinit>:
    80006f88:	ff010113          	addi	sp,sp,-16
    80006f8c:	00813423          	sd	s0,8(sp)
    80006f90:	01010413          	addi	s0,sp,16
    80006f94:	00813403          	ld	s0,8(sp)
    80006f98:	01010113          	addi	sp,sp,16
    80006f9c:	ffffb317          	auipc	t1,0xffffb
    80006fa0:	bd030067          	jr	-1072(t1) # 80001b6c <main>

0000000080006fa4 <either_copyout>:
    80006fa4:	ff010113          	addi	sp,sp,-16
    80006fa8:	00813023          	sd	s0,0(sp)
    80006fac:	00113423          	sd	ra,8(sp)
    80006fb0:	01010413          	addi	s0,sp,16
    80006fb4:	02051663          	bnez	a0,80006fe0 <either_copyout+0x3c>
    80006fb8:	00058513          	mv	a0,a1
    80006fbc:	00060593          	mv	a1,a2
    80006fc0:	0006861b          	sext.w	a2,a3
    80006fc4:	00002097          	auipc	ra,0x2
    80006fc8:	c60080e7          	jalr	-928(ra) # 80008c24 <__memmove>
    80006fcc:	00813083          	ld	ra,8(sp)
    80006fd0:	00013403          	ld	s0,0(sp)
    80006fd4:	00000513          	li	a0,0
    80006fd8:	01010113          	addi	sp,sp,16
    80006fdc:	00008067          	ret
    80006fe0:	00002517          	auipc	a0,0x2
    80006fe4:	72850513          	addi	a0,a0,1832 # 80009708 <CONSOLE_STATUS+0x6f8>
    80006fe8:	00001097          	auipc	ra,0x1
    80006fec:	934080e7          	jalr	-1740(ra) # 8000791c <panic>

0000000080006ff0 <either_copyin>:
    80006ff0:	ff010113          	addi	sp,sp,-16
    80006ff4:	00813023          	sd	s0,0(sp)
    80006ff8:	00113423          	sd	ra,8(sp)
    80006ffc:	01010413          	addi	s0,sp,16
    80007000:	02059463          	bnez	a1,80007028 <either_copyin+0x38>
    80007004:	00060593          	mv	a1,a2
    80007008:	0006861b          	sext.w	a2,a3
    8000700c:	00002097          	auipc	ra,0x2
    80007010:	c18080e7          	jalr	-1000(ra) # 80008c24 <__memmove>
    80007014:	00813083          	ld	ra,8(sp)
    80007018:	00013403          	ld	s0,0(sp)
    8000701c:	00000513          	li	a0,0
    80007020:	01010113          	addi	sp,sp,16
    80007024:	00008067          	ret
    80007028:	00002517          	auipc	a0,0x2
    8000702c:	70850513          	addi	a0,a0,1800 # 80009730 <CONSOLE_STATUS+0x720>
    80007030:	00001097          	auipc	ra,0x1
    80007034:	8ec080e7          	jalr	-1812(ra) # 8000791c <panic>

0000000080007038 <trapinit>:
    80007038:	ff010113          	addi	sp,sp,-16
    8000703c:	00813423          	sd	s0,8(sp)
    80007040:	01010413          	addi	s0,sp,16
    80007044:	00813403          	ld	s0,8(sp)
    80007048:	00002597          	auipc	a1,0x2
    8000704c:	71058593          	addi	a1,a1,1808 # 80009758 <CONSOLE_STATUS+0x748>
    80007050:	00006517          	auipc	a0,0x6
    80007054:	cd050513          	addi	a0,a0,-816 # 8000cd20 <tickslock>
    80007058:	01010113          	addi	sp,sp,16
    8000705c:	00001317          	auipc	t1,0x1
    80007060:	5cc30067          	jr	1484(t1) # 80008628 <initlock>

0000000080007064 <trapinithart>:
    80007064:	ff010113          	addi	sp,sp,-16
    80007068:	00813423          	sd	s0,8(sp)
    8000706c:	01010413          	addi	s0,sp,16
    80007070:	00000797          	auipc	a5,0x0
    80007074:	30078793          	addi	a5,a5,768 # 80007370 <kernelvec>
    80007078:	10579073          	csrw	stvec,a5
    8000707c:	00813403          	ld	s0,8(sp)
    80007080:	01010113          	addi	sp,sp,16
    80007084:	00008067          	ret

0000000080007088 <usertrap>:
    80007088:	ff010113          	addi	sp,sp,-16
    8000708c:	00813423          	sd	s0,8(sp)
    80007090:	01010413          	addi	s0,sp,16
    80007094:	00813403          	ld	s0,8(sp)
    80007098:	01010113          	addi	sp,sp,16
    8000709c:	00008067          	ret

00000000800070a0 <usertrapret>:
    800070a0:	ff010113          	addi	sp,sp,-16
    800070a4:	00813423          	sd	s0,8(sp)
    800070a8:	01010413          	addi	s0,sp,16
    800070ac:	00813403          	ld	s0,8(sp)
    800070b0:	01010113          	addi	sp,sp,16
    800070b4:	00008067          	ret

00000000800070b8 <kerneltrap>:
    800070b8:	fe010113          	addi	sp,sp,-32
    800070bc:	00813823          	sd	s0,16(sp)
    800070c0:	00113c23          	sd	ra,24(sp)
    800070c4:	00913423          	sd	s1,8(sp)
    800070c8:	02010413          	addi	s0,sp,32
    800070cc:	142025f3          	csrr	a1,scause
    800070d0:	100027f3          	csrr	a5,sstatus
    800070d4:	0027f793          	andi	a5,a5,2
    800070d8:	10079c63          	bnez	a5,800071f0 <kerneltrap+0x138>
    800070dc:	142027f3          	csrr	a5,scause
    800070e0:	0207ce63          	bltz	a5,8000711c <kerneltrap+0x64>
    800070e4:	00002517          	auipc	a0,0x2
    800070e8:	6bc50513          	addi	a0,a0,1724 # 800097a0 <CONSOLE_STATUS+0x790>
    800070ec:	00001097          	auipc	ra,0x1
    800070f0:	88c080e7          	jalr	-1908(ra) # 80007978 <__printf>
    800070f4:	141025f3          	csrr	a1,sepc
    800070f8:	14302673          	csrr	a2,stval
    800070fc:	00002517          	auipc	a0,0x2
    80007100:	6b450513          	addi	a0,a0,1716 # 800097b0 <CONSOLE_STATUS+0x7a0>
    80007104:	00001097          	auipc	ra,0x1
    80007108:	874080e7          	jalr	-1932(ra) # 80007978 <__printf>
    8000710c:	00002517          	auipc	a0,0x2
    80007110:	6bc50513          	addi	a0,a0,1724 # 800097c8 <CONSOLE_STATUS+0x7b8>
    80007114:	00001097          	auipc	ra,0x1
    80007118:	808080e7          	jalr	-2040(ra) # 8000791c <panic>
    8000711c:	0ff7f713          	andi	a4,a5,255
    80007120:	00900693          	li	a3,9
    80007124:	04d70063          	beq	a4,a3,80007164 <kerneltrap+0xac>
    80007128:	fff00713          	li	a4,-1
    8000712c:	03f71713          	slli	a4,a4,0x3f
    80007130:	00170713          	addi	a4,a4,1
    80007134:	fae798e3          	bne	a5,a4,800070e4 <kerneltrap+0x2c>
    80007138:	00000097          	auipc	ra,0x0
    8000713c:	e00080e7          	jalr	-512(ra) # 80006f38 <cpuid>
    80007140:	06050663          	beqz	a0,800071ac <kerneltrap+0xf4>
    80007144:	144027f3          	csrr	a5,sip
    80007148:	ffd7f793          	andi	a5,a5,-3
    8000714c:	14479073          	csrw	sip,a5
    80007150:	01813083          	ld	ra,24(sp)
    80007154:	01013403          	ld	s0,16(sp)
    80007158:	00813483          	ld	s1,8(sp)
    8000715c:	02010113          	addi	sp,sp,32
    80007160:	00008067          	ret
    80007164:	00000097          	auipc	ra,0x0
    80007168:	3d0080e7          	jalr	976(ra) # 80007534 <plic_claim>
    8000716c:	00a00793          	li	a5,10
    80007170:	00050493          	mv	s1,a0
    80007174:	06f50863          	beq	a0,a5,800071e4 <kerneltrap+0x12c>
    80007178:	fc050ce3          	beqz	a0,80007150 <kerneltrap+0x98>
    8000717c:	00050593          	mv	a1,a0
    80007180:	00002517          	auipc	a0,0x2
    80007184:	60050513          	addi	a0,a0,1536 # 80009780 <CONSOLE_STATUS+0x770>
    80007188:	00000097          	auipc	ra,0x0
    8000718c:	7f0080e7          	jalr	2032(ra) # 80007978 <__printf>
    80007190:	01013403          	ld	s0,16(sp)
    80007194:	01813083          	ld	ra,24(sp)
    80007198:	00048513          	mv	a0,s1
    8000719c:	00813483          	ld	s1,8(sp)
    800071a0:	02010113          	addi	sp,sp,32
    800071a4:	00000317          	auipc	t1,0x0
    800071a8:	3c830067          	jr	968(t1) # 8000756c <plic_complete>
    800071ac:	00006517          	auipc	a0,0x6
    800071b0:	b7450513          	addi	a0,a0,-1164 # 8000cd20 <tickslock>
    800071b4:	00001097          	auipc	ra,0x1
    800071b8:	498080e7          	jalr	1176(ra) # 8000864c <acquire>
    800071bc:	00005717          	auipc	a4,0x5
    800071c0:	95870713          	addi	a4,a4,-1704 # 8000bb14 <ticks>
    800071c4:	00072783          	lw	a5,0(a4)
    800071c8:	00006517          	auipc	a0,0x6
    800071cc:	b5850513          	addi	a0,a0,-1192 # 8000cd20 <tickslock>
    800071d0:	0017879b          	addiw	a5,a5,1
    800071d4:	00f72023          	sw	a5,0(a4)
    800071d8:	00001097          	auipc	ra,0x1
    800071dc:	540080e7          	jalr	1344(ra) # 80008718 <release>
    800071e0:	f65ff06f          	j	80007144 <kerneltrap+0x8c>
    800071e4:	00001097          	auipc	ra,0x1
    800071e8:	09c080e7          	jalr	156(ra) # 80008280 <uartintr>
    800071ec:	fa5ff06f          	j	80007190 <kerneltrap+0xd8>
    800071f0:	00002517          	auipc	a0,0x2
    800071f4:	57050513          	addi	a0,a0,1392 # 80009760 <CONSOLE_STATUS+0x750>
    800071f8:	00000097          	auipc	ra,0x0
    800071fc:	724080e7          	jalr	1828(ra) # 8000791c <panic>

0000000080007200 <clockintr>:
    80007200:	fe010113          	addi	sp,sp,-32
    80007204:	00813823          	sd	s0,16(sp)
    80007208:	00913423          	sd	s1,8(sp)
    8000720c:	00113c23          	sd	ra,24(sp)
    80007210:	02010413          	addi	s0,sp,32
    80007214:	00006497          	auipc	s1,0x6
    80007218:	b0c48493          	addi	s1,s1,-1268 # 8000cd20 <tickslock>
    8000721c:	00048513          	mv	a0,s1
    80007220:	00001097          	auipc	ra,0x1
    80007224:	42c080e7          	jalr	1068(ra) # 8000864c <acquire>
    80007228:	00005717          	auipc	a4,0x5
    8000722c:	8ec70713          	addi	a4,a4,-1812 # 8000bb14 <ticks>
    80007230:	00072783          	lw	a5,0(a4)
    80007234:	01013403          	ld	s0,16(sp)
    80007238:	01813083          	ld	ra,24(sp)
    8000723c:	00048513          	mv	a0,s1
    80007240:	0017879b          	addiw	a5,a5,1
    80007244:	00813483          	ld	s1,8(sp)
    80007248:	00f72023          	sw	a5,0(a4)
    8000724c:	02010113          	addi	sp,sp,32
    80007250:	00001317          	auipc	t1,0x1
    80007254:	4c830067          	jr	1224(t1) # 80008718 <release>

0000000080007258 <devintr>:
    80007258:	142027f3          	csrr	a5,scause
    8000725c:	00000513          	li	a0,0
    80007260:	0007c463          	bltz	a5,80007268 <devintr+0x10>
    80007264:	00008067          	ret
    80007268:	fe010113          	addi	sp,sp,-32
    8000726c:	00813823          	sd	s0,16(sp)
    80007270:	00113c23          	sd	ra,24(sp)
    80007274:	00913423          	sd	s1,8(sp)
    80007278:	02010413          	addi	s0,sp,32
    8000727c:	0ff7f713          	andi	a4,a5,255
    80007280:	00900693          	li	a3,9
    80007284:	04d70c63          	beq	a4,a3,800072dc <devintr+0x84>
    80007288:	fff00713          	li	a4,-1
    8000728c:	03f71713          	slli	a4,a4,0x3f
    80007290:	00170713          	addi	a4,a4,1
    80007294:	00e78c63          	beq	a5,a4,800072ac <devintr+0x54>
    80007298:	01813083          	ld	ra,24(sp)
    8000729c:	01013403          	ld	s0,16(sp)
    800072a0:	00813483          	ld	s1,8(sp)
    800072a4:	02010113          	addi	sp,sp,32
    800072a8:	00008067          	ret
    800072ac:	00000097          	auipc	ra,0x0
    800072b0:	c8c080e7          	jalr	-884(ra) # 80006f38 <cpuid>
    800072b4:	06050663          	beqz	a0,80007320 <devintr+0xc8>
    800072b8:	144027f3          	csrr	a5,sip
    800072bc:	ffd7f793          	andi	a5,a5,-3
    800072c0:	14479073          	csrw	sip,a5
    800072c4:	01813083          	ld	ra,24(sp)
    800072c8:	01013403          	ld	s0,16(sp)
    800072cc:	00813483          	ld	s1,8(sp)
    800072d0:	00200513          	li	a0,2
    800072d4:	02010113          	addi	sp,sp,32
    800072d8:	00008067          	ret
    800072dc:	00000097          	auipc	ra,0x0
    800072e0:	258080e7          	jalr	600(ra) # 80007534 <plic_claim>
    800072e4:	00a00793          	li	a5,10
    800072e8:	00050493          	mv	s1,a0
    800072ec:	06f50663          	beq	a0,a5,80007358 <devintr+0x100>
    800072f0:	00100513          	li	a0,1
    800072f4:	fa0482e3          	beqz	s1,80007298 <devintr+0x40>
    800072f8:	00048593          	mv	a1,s1
    800072fc:	00002517          	auipc	a0,0x2
    80007300:	48450513          	addi	a0,a0,1156 # 80009780 <CONSOLE_STATUS+0x770>
    80007304:	00000097          	auipc	ra,0x0
    80007308:	674080e7          	jalr	1652(ra) # 80007978 <__printf>
    8000730c:	00048513          	mv	a0,s1
    80007310:	00000097          	auipc	ra,0x0
    80007314:	25c080e7          	jalr	604(ra) # 8000756c <plic_complete>
    80007318:	00100513          	li	a0,1
    8000731c:	f7dff06f          	j	80007298 <devintr+0x40>
    80007320:	00006517          	auipc	a0,0x6
    80007324:	a0050513          	addi	a0,a0,-1536 # 8000cd20 <tickslock>
    80007328:	00001097          	auipc	ra,0x1
    8000732c:	324080e7          	jalr	804(ra) # 8000864c <acquire>
    80007330:	00004717          	auipc	a4,0x4
    80007334:	7e470713          	addi	a4,a4,2020 # 8000bb14 <ticks>
    80007338:	00072783          	lw	a5,0(a4)
    8000733c:	00006517          	auipc	a0,0x6
    80007340:	9e450513          	addi	a0,a0,-1564 # 8000cd20 <tickslock>
    80007344:	0017879b          	addiw	a5,a5,1
    80007348:	00f72023          	sw	a5,0(a4)
    8000734c:	00001097          	auipc	ra,0x1
    80007350:	3cc080e7          	jalr	972(ra) # 80008718 <release>
    80007354:	f65ff06f          	j	800072b8 <devintr+0x60>
    80007358:	00001097          	auipc	ra,0x1
    8000735c:	f28080e7          	jalr	-216(ra) # 80008280 <uartintr>
    80007360:	fadff06f          	j	8000730c <devintr+0xb4>
	...

0000000080007370 <kernelvec>:
    80007370:	f0010113          	addi	sp,sp,-256
    80007374:	00113023          	sd	ra,0(sp)
    80007378:	00213423          	sd	sp,8(sp)
    8000737c:	00313823          	sd	gp,16(sp)
    80007380:	00413c23          	sd	tp,24(sp)
    80007384:	02513023          	sd	t0,32(sp)
    80007388:	02613423          	sd	t1,40(sp)
    8000738c:	02713823          	sd	t2,48(sp)
    80007390:	02813c23          	sd	s0,56(sp)
    80007394:	04913023          	sd	s1,64(sp)
    80007398:	04a13423          	sd	a0,72(sp)
    8000739c:	04b13823          	sd	a1,80(sp)
    800073a0:	04c13c23          	sd	a2,88(sp)
    800073a4:	06d13023          	sd	a3,96(sp)
    800073a8:	06e13423          	sd	a4,104(sp)
    800073ac:	06f13823          	sd	a5,112(sp)
    800073b0:	07013c23          	sd	a6,120(sp)
    800073b4:	09113023          	sd	a7,128(sp)
    800073b8:	09213423          	sd	s2,136(sp)
    800073bc:	09313823          	sd	s3,144(sp)
    800073c0:	09413c23          	sd	s4,152(sp)
    800073c4:	0b513023          	sd	s5,160(sp)
    800073c8:	0b613423          	sd	s6,168(sp)
    800073cc:	0b713823          	sd	s7,176(sp)
    800073d0:	0b813c23          	sd	s8,184(sp)
    800073d4:	0d913023          	sd	s9,192(sp)
    800073d8:	0da13423          	sd	s10,200(sp)
    800073dc:	0db13823          	sd	s11,208(sp)
    800073e0:	0dc13c23          	sd	t3,216(sp)
    800073e4:	0fd13023          	sd	t4,224(sp)
    800073e8:	0fe13423          	sd	t5,232(sp)
    800073ec:	0ff13823          	sd	t6,240(sp)
    800073f0:	cc9ff0ef          	jal	ra,800070b8 <kerneltrap>
    800073f4:	00013083          	ld	ra,0(sp)
    800073f8:	00813103          	ld	sp,8(sp)
    800073fc:	01013183          	ld	gp,16(sp)
    80007400:	02013283          	ld	t0,32(sp)
    80007404:	02813303          	ld	t1,40(sp)
    80007408:	03013383          	ld	t2,48(sp)
    8000740c:	03813403          	ld	s0,56(sp)
    80007410:	04013483          	ld	s1,64(sp)
    80007414:	04813503          	ld	a0,72(sp)
    80007418:	05013583          	ld	a1,80(sp)
    8000741c:	05813603          	ld	a2,88(sp)
    80007420:	06013683          	ld	a3,96(sp)
    80007424:	06813703          	ld	a4,104(sp)
    80007428:	07013783          	ld	a5,112(sp)
    8000742c:	07813803          	ld	a6,120(sp)
    80007430:	08013883          	ld	a7,128(sp)
    80007434:	08813903          	ld	s2,136(sp)
    80007438:	09013983          	ld	s3,144(sp)
    8000743c:	09813a03          	ld	s4,152(sp)
    80007440:	0a013a83          	ld	s5,160(sp)
    80007444:	0a813b03          	ld	s6,168(sp)
    80007448:	0b013b83          	ld	s7,176(sp)
    8000744c:	0b813c03          	ld	s8,184(sp)
    80007450:	0c013c83          	ld	s9,192(sp)
    80007454:	0c813d03          	ld	s10,200(sp)
    80007458:	0d013d83          	ld	s11,208(sp)
    8000745c:	0d813e03          	ld	t3,216(sp)
    80007460:	0e013e83          	ld	t4,224(sp)
    80007464:	0e813f03          	ld	t5,232(sp)
    80007468:	0f013f83          	ld	t6,240(sp)
    8000746c:	10010113          	addi	sp,sp,256
    80007470:	10200073          	sret
    80007474:	00000013          	nop
    80007478:	00000013          	nop
    8000747c:	00000013          	nop

0000000080007480 <timervec>:
    80007480:	34051573          	csrrw	a0,mscratch,a0
    80007484:	00b53023          	sd	a1,0(a0)
    80007488:	00c53423          	sd	a2,8(a0)
    8000748c:	00d53823          	sd	a3,16(a0)
    80007490:	01853583          	ld	a1,24(a0)
    80007494:	02053603          	ld	a2,32(a0)
    80007498:	0005b683          	ld	a3,0(a1)
    8000749c:	00c686b3          	add	a3,a3,a2
    800074a0:	00d5b023          	sd	a3,0(a1)
    800074a4:	00200593          	li	a1,2
    800074a8:	14459073          	csrw	sip,a1
    800074ac:	01053683          	ld	a3,16(a0)
    800074b0:	00853603          	ld	a2,8(a0)
    800074b4:	00053583          	ld	a1,0(a0)
    800074b8:	34051573          	csrrw	a0,mscratch,a0
    800074bc:	30200073          	mret

00000000800074c0 <plicinit>:
    800074c0:	ff010113          	addi	sp,sp,-16
    800074c4:	00813423          	sd	s0,8(sp)
    800074c8:	01010413          	addi	s0,sp,16
    800074cc:	00813403          	ld	s0,8(sp)
    800074d0:	0c0007b7          	lui	a5,0xc000
    800074d4:	00100713          	li	a4,1
    800074d8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800074dc:	00e7a223          	sw	a4,4(a5)
    800074e0:	01010113          	addi	sp,sp,16
    800074e4:	00008067          	ret

00000000800074e8 <plicinithart>:
    800074e8:	ff010113          	addi	sp,sp,-16
    800074ec:	00813023          	sd	s0,0(sp)
    800074f0:	00113423          	sd	ra,8(sp)
    800074f4:	01010413          	addi	s0,sp,16
    800074f8:	00000097          	auipc	ra,0x0
    800074fc:	a40080e7          	jalr	-1472(ra) # 80006f38 <cpuid>
    80007500:	0085171b          	slliw	a4,a0,0x8
    80007504:	0c0027b7          	lui	a5,0xc002
    80007508:	00e787b3          	add	a5,a5,a4
    8000750c:	40200713          	li	a4,1026
    80007510:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80007514:	00813083          	ld	ra,8(sp)
    80007518:	00013403          	ld	s0,0(sp)
    8000751c:	00d5151b          	slliw	a0,a0,0xd
    80007520:	0c2017b7          	lui	a5,0xc201
    80007524:	00a78533          	add	a0,a5,a0
    80007528:	00052023          	sw	zero,0(a0)
    8000752c:	01010113          	addi	sp,sp,16
    80007530:	00008067          	ret

0000000080007534 <plic_claim>:
    80007534:	ff010113          	addi	sp,sp,-16
    80007538:	00813023          	sd	s0,0(sp)
    8000753c:	00113423          	sd	ra,8(sp)
    80007540:	01010413          	addi	s0,sp,16
    80007544:	00000097          	auipc	ra,0x0
    80007548:	9f4080e7          	jalr	-1548(ra) # 80006f38 <cpuid>
    8000754c:	00813083          	ld	ra,8(sp)
    80007550:	00013403          	ld	s0,0(sp)
    80007554:	00d5151b          	slliw	a0,a0,0xd
    80007558:	0c2017b7          	lui	a5,0xc201
    8000755c:	00a78533          	add	a0,a5,a0
    80007560:	00452503          	lw	a0,4(a0)
    80007564:	01010113          	addi	sp,sp,16
    80007568:	00008067          	ret

000000008000756c <plic_complete>:
    8000756c:	fe010113          	addi	sp,sp,-32
    80007570:	00813823          	sd	s0,16(sp)
    80007574:	00913423          	sd	s1,8(sp)
    80007578:	00113c23          	sd	ra,24(sp)
    8000757c:	02010413          	addi	s0,sp,32
    80007580:	00050493          	mv	s1,a0
    80007584:	00000097          	auipc	ra,0x0
    80007588:	9b4080e7          	jalr	-1612(ra) # 80006f38 <cpuid>
    8000758c:	01813083          	ld	ra,24(sp)
    80007590:	01013403          	ld	s0,16(sp)
    80007594:	00d5179b          	slliw	a5,a0,0xd
    80007598:	0c201737          	lui	a4,0xc201
    8000759c:	00f707b3          	add	a5,a4,a5
    800075a0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800075a4:	00813483          	ld	s1,8(sp)
    800075a8:	02010113          	addi	sp,sp,32
    800075ac:	00008067          	ret

00000000800075b0 <consolewrite>:
    800075b0:	fb010113          	addi	sp,sp,-80
    800075b4:	04813023          	sd	s0,64(sp)
    800075b8:	04113423          	sd	ra,72(sp)
    800075bc:	02913c23          	sd	s1,56(sp)
    800075c0:	03213823          	sd	s2,48(sp)
    800075c4:	03313423          	sd	s3,40(sp)
    800075c8:	03413023          	sd	s4,32(sp)
    800075cc:	01513c23          	sd	s5,24(sp)
    800075d0:	05010413          	addi	s0,sp,80
    800075d4:	06c05c63          	blez	a2,8000764c <consolewrite+0x9c>
    800075d8:	00060993          	mv	s3,a2
    800075dc:	00050a13          	mv	s4,a0
    800075e0:	00058493          	mv	s1,a1
    800075e4:	00000913          	li	s2,0
    800075e8:	fff00a93          	li	s5,-1
    800075ec:	01c0006f          	j	80007608 <consolewrite+0x58>
    800075f0:	fbf44503          	lbu	a0,-65(s0)
    800075f4:	0019091b          	addiw	s2,s2,1
    800075f8:	00148493          	addi	s1,s1,1
    800075fc:	00001097          	auipc	ra,0x1
    80007600:	a9c080e7          	jalr	-1380(ra) # 80008098 <uartputc>
    80007604:	03298063          	beq	s3,s2,80007624 <consolewrite+0x74>
    80007608:	00048613          	mv	a2,s1
    8000760c:	00100693          	li	a3,1
    80007610:	000a0593          	mv	a1,s4
    80007614:	fbf40513          	addi	a0,s0,-65
    80007618:	00000097          	auipc	ra,0x0
    8000761c:	9d8080e7          	jalr	-1576(ra) # 80006ff0 <either_copyin>
    80007620:	fd5518e3          	bne	a0,s5,800075f0 <consolewrite+0x40>
    80007624:	04813083          	ld	ra,72(sp)
    80007628:	04013403          	ld	s0,64(sp)
    8000762c:	03813483          	ld	s1,56(sp)
    80007630:	02813983          	ld	s3,40(sp)
    80007634:	02013a03          	ld	s4,32(sp)
    80007638:	01813a83          	ld	s5,24(sp)
    8000763c:	00090513          	mv	a0,s2
    80007640:	03013903          	ld	s2,48(sp)
    80007644:	05010113          	addi	sp,sp,80
    80007648:	00008067          	ret
    8000764c:	00000913          	li	s2,0
    80007650:	fd5ff06f          	j	80007624 <consolewrite+0x74>

0000000080007654 <consoleread>:
    80007654:	f9010113          	addi	sp,sp,-112
    80007658:	06813023          	sd	s0,96(sp)
    8000765c:	04913c23          	sd	s1,88(sp)
    80007660:	05213823          	sd	s2,80(sp)
    80007664:	05313423          	sd	s3,72(sp)
    80007668:	05413023          	sd	s4,64(sp)
    8000766c:	03513c23          	sd	s5,56(sp)
    80007670:	03613823          	sd	s6,48(sp)
    80007674:	03713423          	sd	s7,40(sp)
    80007678:	03813023          	sd	s8,32(sp)
    8000767c:	06113423          	sd	ra,104(sp)
    80007680:	01913c23          	sd	s9,24(sp)
    80007684:	07010413          	addi	s0,sp,112
    80007688:	00060b93          	mv	s7,a2
    8000768c:	00050913          	mv	s2,a0
    80007690:	00058c13          	mv	s8,a1
    80007694:	00060b1b          	sext.w	s6,a2
    80007698:	00005497          	auipc	s1,0x5
    8000769c:	6b048493          	addi	s1,s1,1712 # 8000cd48 <cons>
    800076a0:	00400993          	li	s3,4
    800076a4:	fff00a13          	li	s4,-1
    800076a8:	00a00a93          	li	s5,10
    800076ac:	05705e63          	blez	s7,80007708 <consoleread+0xb4>
    800076b0:	09c4a703          	lw	a4,156(s1)
    800076b4:	0984a783          	lw	a5,152(s1)
    800076b8:	0007071b          	sext.w	a4,a4
    800076bc:	08e78463          	beq	a5,a4,80007744 <consoleread+0xf0>
    800076c0:	07f7f713          	andi	a4,a5,127
    800076c4:	00e48733          	add	a4,s1,a4
    800076c8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800076cc:	0017869b          	addiw	a3,a5,1
    800076d0:	08d4ac23          	sw	a3,152(s1)
    800076d4:	00070c9b          	sext.w	s9,a4
    800076d8:	0b370663          	beq	a4,s3,80007784 <consoleread+0x130>
    800076dc:	00100693          	li	a3,1
    800076e0:	f9f40613          	addi	a2,s0,-97
    800076e4:	000c0593          	mv	a1,s8
    800076e8:	00090513          	mv	a0,s2
    800076ec:	f8e40fa3          	sb	a4,-97(s0)
    800076f0:	00000097          	auipc	ra,0x0
    800076f4:	8b4080e7          	jalr	-1868(ra) # 80006fa4 <either_copyout>
    800076f8:	01450863          	beq	a0,s4,80007708 <consoleread+0xb4>
    800076fc:	001c0c13          	addi	s8,s8,1
    80007700:	fffb8b9b          	addiw	s7,s7,-1
    80007704:	fb5c94e3          	bne	s9,s5,800076ac <consoleread+0x58>
    80007708:	000b851b          	sext.w	a0,s7
    8000770c:	06813083          	ld	ra,104(sp)
    80007710:	06013403          	ld	s0,96(sp)
    80007714:	05813483          	ld	s1,88(sp)
    80007718:	05013903          	ld	s2,80(sp)
    8000771c:	04813983          	ld	s3,72(sp)
    80007720:	04013a03          	ld	s4,64(sp)
    80007724:	03813a83          	ld	s5,56(sp)
    80007728:	02813b83          	ld	s7,40(sp)
    8000772c:	02013c03          	ld	s8,32(sp)
    80007730:	01813c83          	ld	s9,24(sp)
    80007734:	40ab053b          	subw	a0,s6,a0
    80007738:	03013b03          	ld	s6,48(sp)
    8000773c:	07010113          	addi	sp,sp,112
    80007740:	00008067          	ret
    80007744:	00001097          	auipc	ra,0x1
    80007748:	1d8080e7          	jalr	472(ra) # 8000891c <push_on>
    8000774c:	0984a703          	lw	a4,152(s1)
    80007750:	09c4a783          	lw	a5,156(s1)
    80007754:	0007879b          	sext.w	a5,a5
    80007758:	fef70ce3          	beq	a4,a5,80007750 <consoleread+0xfc>
    8000775c:	00001097          	auipc	ra,0x1
    80007760:	234080e7          	jalr	564(ra) # 80008990 <pop_on>
    80007764:	0984a783          	lw	a5,152(s1)
    80007768:	07f7f713          	andi	a4,a5,127
    8000776c:	00e48733          	add	a4,s1,a4
    80007770:	01874703          	lbu	a4,24(a4)
    80007774:	0017869b          	addiw	a3,a5,1
    80007778:	08d4ac23          	sw	a3,152(s1)
    8000777c:	00070c9b          	sext.w	s9,a4
    80007780:	f5371ee3          	bne	a4,s3,800076dc <consoleread+0x88>
    80007784:	000b851b          	sext.w	a0,s7
    80007788:	f96bf2e3          	bgeu	s7,s6,8000770c <consoleread+0xb8>
    8000778c:	08f4ac23          	sw	a5,152(s1)
    80007790:	f7dff06f          	j	8000770c <consoleread+0xb8>

0000000080007794 <consputc>:
    80007794:	10000793          	li	a5,256
    80007798:	00f50663          	beq	a0,a5,800077a4 <consputc+0x10>
    8000779c:	00001317          	auipc	t1,0x1
    800077a0:	9f430067          	jr	-1548(t1) # 80008190 <uartputc_sync>
    800077a4:	ff010113          	addi	sp,sp,-16
    800077a8:	00113423          	sd	ra,8(sp)
    800077ac:	00813023          	sd	s0,0(sp)
    800077b0:	01010413          	addi	s0,sp,16
    800077b4:	00800513          	li	a0,8
    800077b8:	00001097          	auipc	ra,0x1
    800077bc:	9d8080e7          	jalr	-1576(ra) # 80008190 <uartputc_sync>
    800077c0:	02000513          	li	a0,32
    800077c4:	00001097          	auipc	ra,0x1
    800077c8:	9cc080e7          	jalr	-1588(ra) # 80008190 <uartputc_sync>
    800077cc:	00013403          	ld	s0,0(sp)
    800077d0:	00813083          	ld	ra,8(sp)
    800077d4:	00800513          	li	a0,8
    800077d8:	01010113          	addi	sp,sp,16
    800077dc:	00001317          	auipc	t1,0x1
    800077e0:	9b430067          	jr	-1612(t1) # 80008190 <uartputc_sync>

00000000800077e4 <consoleintr>:
    800077e4:	fe010113          	addi	sp,sp,-32
    800077e8:	00813823          	sd	s0,16(sp)
    800077ec:	00913423          	sd	s1,8(sp)
    800077f0:	01213023          	sd	s2,0(sp)
    800077f4:	00113c23          	sd	ra,24(sp)
    800077f8:	02010413          	addi	s0,sp,32
    800077fc:	00005917          	auipc	s2,0x5
    80007800:	54c90913          	addi	s2,s2,1356 # 8000cd48 <cons>
    80007804:	00050493          	mv	s1,a0
    80007808:	00090513          	mv	a0,s2
    8000780c:	00001097          	auipc	ra,0x1
    80007810:	e40080e7          	jalr	-448(ra) # 8000864c <acquire>
    80007814:	02048c63          	beqz	s1,8000784c <consoleintr+0x68>
    80007818:	0a092783          	lw	a5,160(s2)
    8000781c:	09892703          	lw	a4,152(s2)
    80007820:	07f00693          	li	a3,127
    80007824:	40e7873b          	subw	a4,a5,a4
    80007828:	02e6e263          	bltu	a3,a4,8000784c <consoleintr+0x68>
    8000782c:	00d00713          	li	a4,13
    80007830:	04e48063          	beq	s1,a4,80007870 <consoleintr+0x8c>
    80007834:	07f7f713          	andi	a4,a5,127
    80007838:	00e90733          	add	a4,s2,a4
    8000783c:	0017879b          	addiw	a5,a5,1
    80007840:	0af92023          	sw	a5,160(s2)
    80007844:	00970c23          	sb	s1,24(a4)
    80007848:	08f92e23          	sw	a5,156(s2)
    8000784c:	01013403          	ld	s0,16(sp)
    80007850:	01813083          	ld	ra,24(sp)
    80007854:	00813483          	ld	s1,8(sp)
    80007858:	00013903          	ld	s2,0(sp)
    8000785c:	00005517          	auipc	a0,0x5
    80007860:	4ec50513          	addi	a0,a0,1260 # 8000cd48 <cons>
    80007864:	02010113          	addi	sp,sp,32
    80007868:	00001317          	auipc	t1,0x1
    8000786c:	eb030067          	jr	-336(t1) # 80008718 <release>
    80007870:	00a00493          	li	s1,10
    80007874:	fc1ff06f          	j	80007834 <consoleintr+0x50>

0000000080007878 <consoleinit>:
    80007878:	fe010113          	addi	sp,sp,-32
    8000787c:	00113c23          	sd	ra,24(sp)
    80007880:	00813823          	sd	s0,16(sp)
    80007884:	00913423          	sd	s1,8(sp)
    80007888:	02010413          	addi	s0,sp,32
    8000788c:	00005497          	auipc	s1,0x5
    80007890:	4bc48493          	addi	s1,s1,1212 # 8000cd48 <cons>
    80007894:	00048513          	mv	a0,s1
    80007898:	00002597          	auipc	a1,0x2
    8000789c:	f4058593          	addi	a1,a1,-192 # 800097d8 <CONSOLE_STATUS+0x7c8>
    800078a0:	00001097          	auipc	ra,0x1
    800078a4:	d88080e7          	jalr	-632(ra) # 80008628 <initlock>
    800078a8:	00000097          	auipc	ra,0x0
    800078ac:	7ac080e7          	jalr	1964(ra) # 80008054 <uartinit>
    800078b0:	01813083          	ld	ra,24(sp)
    800078b4:	01013403          	ld	s0,16(sp)
    800078b8:	00000797          	auipc	a5,0x0
    800078bc:	d9c78793          	addi	a5,a5,-612 # 80007654 <consoleread>
    800078c0:	0af4bc23          	sd	a5,184(s1)
    800078c4:	00000797          	auipc	a5,0x0
    800078c8:	cec78793          	addi	a5,a5,-788 # 800075b0 <consolewrite>
    800078cc:	0cf4b023          	sd	a5,192(s1)
    800078d0:	00813483          	ld	s1,8(sp)
    800078d4:	02010113          	addi	sp,sp,32
    800078d8:	00008067          	ret

00000000800078dc <console_read>:
    800078dc:	ff010113          	addi	sp,sp,-16
    800078e0:	00813423          	sd	s0,8(sp)
    800078e4:	01010413          	addi	s0,sp,16
    800078e8:	00813403          	ld	s0,8(sp)
    800078ec:	00005317          	auipc	t1,0x5
    800078f0:	51433303          	ld	t1,1300(t1) # 8000ce00 <devsw+0x10>
    800078f4:	01010113          	addi	sp,sp,16
    800078f8:	00030067          	jr	t1

00000000800078fc <console_write>:
    800078fc:	ff010113          	addi	sp,sp,-16
    80007900:	00813423          	sd	s0,8(sp)
    80007904:	01010413          	addi	s0,sp,16
    80007908:	00813403          	ld	s0,8(sp)
    8000790c:	00005317          	auipc	t1,0x5
    80007910:	4fc33303          	ld	t1,1276(t1) # 8000ce08 <devsw+0x18>
    80007914:	01010113          	addi	sp,sp,16
    80007918:	00030067          	jr	t1

000000008000791c <panic>:
    8000791c:	fe010113          	addi	sp,sp,-32
    80007920:	00113c23          	sd	ra,24(sp)
    80007924:	00813823          	sd	s0,16(sp)
    80007928:	00913423          	sd	s1,8(sp)
    8000792c:	02010413          	addi	s0,sp,32
    80007930:	00050493          	mv	s1,a0
    80007934:	00002517          	auipc	a0,0x2
    80007938:	eac50513          	addi	a0,a0,-340 # 800097e0 <CONSOLE_STATUS+0x7d0>
    8000793c:	00005797          	auipc	a5,0x5
    80007940:	5607a623          	sw	zero,1388(a5) # 8000cea8 <pr+0x18>
    80007944:	00000097          	auipc	ra,0x0
    80007948:	034080e7          	jalr	52(ra) # 80007978 <__printf>
    8000794c:	00048513          	mv	a0,s1
    80007950:	00000097          	auipc	ra,0x0
    80007954:	028080e7          	jalr	40(ra) # 80007978 <__printf>
    80007958:	00002517          	auipc	a0,0x2
    8000795c:	c1050513          	addi	a0,a0,-1008 # 80009568 <CONSOLE_STATUS+0x558>
    80007960:	00000097          	auipc	ra,0x0
    80007964:	018080e7          	jalr	24(ra) # 80007978 <__printf>
    80007968:	00100793          	li	a5,1
    8000796c:	00004717          	auipc	a4,0x4
    80007970:	1af72623          	sw	a5,428(a4) # 8000bb18 <panicked>
    80007974:	0000006f          	j	80007974 <panic+0x58>

0000000080007978 <__printf>:
    80007978:	f3010113          	addi	sp,sp,-208
    8000797c:	08813023          	sd	s0,128(sp)
    80007980:	07313423          	sd	s3,104(sp)
    80007984:	09010413          	addi	s0,sp,144
    80007988:	05813023          	sd	s8,64(sp)
    8000798c:	08113423          	sd	ra,136(sp)
    80007990:	06913c23          	sd	s1,120(sp)
    80007994:	07213823          	sd	s2,112(sp)
    80007998:	07413023          	sd	s4,96(sp)
    8000799c:	05513c23          	sd	s5,88(sp)
    800079a0:	05613823          	sd	s6,80(sp)
    800079a4:	05713423          	sd	s7,72(sp)
    800079a8:	03913c23          	sd	s9,56(sp)
    800079ac:	03a13823          	sd	s10,48(sp)
    800079b0:	03b13423          	sd	s11,40(sp)
    800079b4:	00005317          	auipc	t1,0x5
    800079b8:	4dc30313          	addi	t1,t1,1244 # 8000ce90 <pr>
    800079bc:	01832c03          	lw	s8,24(t1)
    800079c0:	00b43423          	sd	a1,8(s0)
    800079c4:	00c43823          	sd	a2,16(s0)
    800079c8:	00d43c23          	sd	a3,24(s0)
    800079cc:	02e43023          	sd	a4,32(s0)
    800079d0:	02f43423          	sd	a5,40(s0)
    800079d4:	03043823          	sd	a6,48(s0)
    800079d8:	03143c23          	sd	a7,56(s0)
    800079dc:	00050993          	mv	s3,a0
    800079e0:	4a0c1663          	bnez	s8,80007e8c <__printf+0x514>
    800079e4:	60098c63          	beqz	s3,80007ffc <__printf+0x684>
    800079e8:	0009c503          	lbu	a0,0(s3)
    800079ec:	00840793          	addi	a5,s0,8
    800079f0:	f6f43c23          	sd	a5,-136(s0)
    800079f4:	00000493          	li	s1,0
    800079f8:	22050063          	beqz	a0,80007c18 <__printf+0x2a0>
    800079fc:	00002a37          	lui	s4,0x2
    80007a00:	00018ab7          	lui	s5,0x18
    80007a04:	000f4b37          	lui	s6,0xf4
    80007a08:	00989bb7          	lui	s7,0x989
    80007a0c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80007a10:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80007a14:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80007a18:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80007a1c:	00148c9b          	addiw	s9,s1,1
    80007a20:	02500793          	li	a5,37
    80007a24:	01998933          	add	s2,s3,s9
    80007a28:	38f51263          	bne	a0,a5,80007dac <__printf+0x434>
    80007a2c:	00094783          	lbu	a5,0(s2)
    80007a30:	00078c9b          	sext.w	s9,a5
    80007a34:	1e078263          	beqz	a5,80007c18 <__printf+0x2a0>
    80007a38:	0024849b          	addiw	s1,s1,2
    80007a3c:	07000713          	li	a4,112
    80007a40:	00998933          	add	s2,s3,s1
    80007a44:	38e78a63          	beq	a5,a4,80007dd8 <__printf+0x460>
    80007a48:	20f76863          	bltu	a4,a5,80007c58 <__printf+0x2e0>
    80007a4c:	42a78863          	beq	a5,a0,80007e7c <__printf+0x504>
    80007a50:	06400713          	li	a4,100
    80007a54:	40e79663          	bne	a5,a4,80007e60 <__printf+0x4e8>
    80007a58:	f7843783          	ld	a5,-136(s0)
    80007a5c:	0007a603          	lw	a2,0(a5)
    80007a60:	00878793          	addi	a5,a5,8
    80007a64:	f6f43c23          	sd	a5,-136(s0)
    80007a68:	42064a63          	bltz	a2,80007e9c <__printf+0x524>
    80007a6c:	00a00713          	li	a4,10
    80007a70:	02e677bb          	remuw	a5,a2,a4
    80007a74:	00002d97          	auipc	s11,0x2
    80007a78:	d94d8d93          	addi	s11,s11,-620 # 80009808 <digits>
    80007a7c:	00900593          	li	a1,9
    80007a80:	0006051b          	sext.w	a0,a2
    80007a84:	00000c93          	li	s9,0
    80007a88:	02079793          	slli	a5,a5,0x20
    80007a8c:	0207d793          	srli	a5,a5,0x20
    80007a90:	00fd87b3          	add	a5,s11,a5
    80007a94:	0007c783          	lbu	a5,0(a5)
    80007a98:	02e656bb          	divuw	a3,a2,a4
    80007a9c:	f8f40023          	sb	a5,-128(s0)
    80007aa0:	14c5d863          	bge	a1,a2,80007bf0 <__printf+0x278>
    80007aa4:	06300593          	li	a1,99
    80007aa8:	00100c93          	li	s9,1
    80007aac:	02e6f7bb          	remuw	a5,a3,a4
    80007ab0:	02079793          	slli	a5,a5,0x20
    80007ab4:	0207d793          	srli	a5,a5,0x20
    80007ab8:	00fd87b3          	add	a5,s11,a5
    80007abc:	0007c783          	lbu	a5,0(a5)
    80007ac0:	02e6d73b          	divuw	a4,a3,a4
    80007ac4:	f8f400a3          	sb	a5,-127(s0)
    80007ac8:	12a5f463          	bgeu	a1,a0,80007bf0 <__printf+0x278>
    80007acc:	00a00693          	li	a3,10
    80007ad0:	00900593          	li	a1,9
    80007ad4:	02d777bb          	remuw	a5,a4,a3
    80007ad8:	02079793          	slli	a5,a5,0x20
    80007adc:	0207d793          	srli	a5,a5,0x20
    80007ae0:	00fd87b3          	add	a5,s11,a5
    80007ae4:	0007c503          	lbu	a0,0(a5)
    80007ae8:	02d757bb          	divuw	a5,a4,a3
    80007aec:	f8a40123          	sb	a0,-126(s0)
    80007af0:	48e5f263          	bgeu	a1,a4,80007f74 <__printf+0x5fc>
    80007af4:	06300513          	li	a0,99
    80007af8:	02d7f5bb          	remuw	a1,a5,a3
    80007afc:	02059593          	slli	a1,a1,0x20
    80007b00:	0205d593          	srli	a1,a1,0x20
    80007b04:	00bd85b3          	add	a1,s11,a1
    80007b08:	0005c583          	lbu	a1,0(a1)
    80007b0c:	02d7d7bb          	divuw	a5,a5,a3
    80007b10:	f8b401a3          	sb	a1,-125(s0)
    80007b14:	48e57263          	bgeu	a0,a4,80007f98 <__printf+0x620>
    80007b18:	3e700513          	li	a0,999
    80007b1c:	02d7f5bb          	remuw	a1,a5,a3
    80007b20:	02059593          	slli	a1,a1,0x20
    80007b24:	0205d593          	srli	a1,a1,0x20
    80007b28:	00bd85b3          	add	a1,s11,a1
    80007b2c:	0005c583          	lbu	a1,0(a1)
    80007b30:	02d7d7bb          	divuw	a5,a5,a3
    80007b34:	f8b40223          	sb	a1,-124(s0)
    80007b38:	46e57663          	bgeu	a0,a4,80007fa4 <__printf+0x62c>
    80007b3c:	02d7f5bb          	remuw	a1,a5,a3
    80007b40:	02059593          	slli	a1,a1,0x20
    80007b44:	0205d593          	srli	a1,a1,0x20
    80007b48:	00bd85b3          	add	a1,s11,a1
    80007b4c:	0005c583          	lbu	a1,0(a1)
    80007b50:	02d7d7bb          	divuw	a5,a5,a3
    80007b54:	f8b402a3          	sb	a1,-123(s0)
    80007b58:	46ea7863          	bgeu	s4,a4,80007fc8 <__printf+0x650>
    80007b5c:	02d7f5bb          	remuw	a1,a5,a3
    80007b60:	02059593          	slli	a1,a1,0x20
    80007b64:	0205d593          	srli	a1,a1,0x20
    80007b68:	00bd85b3          	add	a1,s11,a1
    80007b6c:	0005c583          	lbu	a1,0(a1)
    80007b70:	02d7d7bb          	divuw	a5,a5,a3
    80007b74:	f8b40323          	sb	a1,-122(s0)
    80007b78:	3eeaf863          	bgeu	s5,a4,80007f68 <__printf+0x5f0>
    80007b7c:	02d7f5bb          	remuw	a1,a5,a3
    80007b80:	02059593          	slli	a1,a1,0x20
    80007b84:	0205d593          	srli	a1,a1,0x20
    80007b88:	00bd85b3          	add	a1,s11,a1
    80007b8c:	0005c583          	lbu	a1,0(a1)
    80007b90:	02d7d7bb          	divuw	a5,a5,a3
    80007b94:	f8b403a3          	sb	a1,-121(s0)
    80007b98:	42eb7e63          	bgeu	s6,a4,80007fd4 <__printf+0x65c>
    80007b9c:	02d7f5bb          	remuw	a1,a5,a3
    80007ba0:	02059593          	slli	a1,a1,0x20
    80007ba4:	0205d593          	srli	a1,a1,0x20
    80007ba8:	00bd85b3          	add	a1,s11,a1
    80007bac:	0005c583          	lbu	a1,0(a1)
    80007bb0:	02d7d7bb          	divuw	a5,a5,a3
    80007bb4:	f8b40423          	sb	a1,-120(s0)
    80007bb8:	42ebfc63          	bgeu	s7,a4,80007ff0 <__printf+0x678>
    80007bbc:	02079793          	slli	a5,a5,0x20
    80007bc0:	0207d793          	srli	a5,a5,0x20
    80007bc4:	00fd8db3          	add	s11,s11,a5
    80007bc8:	000dc703          	lbu	a4,0(s11)
    80007bcc:	00a00793          	li	a5,10
    80007bd0:	00900c93          	li	s9,9
    80007bd4:	f8e404a3          	sb	a4,-119(s0)
    80007bd8:	00065c63          	bgez	a2,80007bf0 <__printf+0x278>
    80007bdc:	f9040713          	addi	a4,s0,-112
    80007be0:	00f70733          	add	a4,a4,a5
    80007be4:	02d00693          	li	a3,45
    80007be8:	fed70823          	sb	a3,-16(a4)
    80007bec:	00078c93          	mv	s9,a5
    80007bf0:	f8040793          	addi	a5,s0,-128
    80007bf4:	01978cb3          	add	s9,a5,s9
    80007bf8:	f7f40d13          	addi	s10,s0,-129
    80007bfc:	000cc503          	lbu	a0,0(s9)
    80007c00:	fffc8c93          	addi	s9,s9,-1
    80007c04:	00000097          	auipc	ra,0x0
    80007c08:	b90080e7          	jalr	-1136(ra) # 80007794 <consputc>
    80007c0c:	ffac98e3          	bne	s9,s10,80007bfc <__printf+0x284>
    80007c10:	00094503          	lbu	a0,0(s2)
    80007c14:	e00514e3          	bnez	a0,80007a1c <__printf+0xa4>
    80007c18:	1a0c1663          	bnez	s8,80007dc4 <__printf+0x44c>
    80007c1c:	08813083          	ld	ra,136(sp)
    80007c20:	08013403          	ld	s0,128(sp)
    80007c24:	07813483          	ld	s1,120(sp)
    80007c28:	07013903          	ld	s2,112(sp)
    80007c2c:	06813983          	ld	s3,104(sp)
    80007c30:	06013a03          	ld	s4,96(sp)
    80007c34:	05813a83          	ld	s5,88(sp)
    80007c38:	05013b03          	ld	s6,80(sp)
    80007c3c:	04813b83          	ld	s7,72(sp)
    80007c40:	04013c03          	ld	s8,64(sp)
    80007c44:	03813c83          	ld	s9,56(sp)
    80007c48:	03013d03          	ld	s10,48(sp)
    80007c4c:	02813d83          	ld	s11,40(sp)
    80007c50:	0d010113          	addi	sp,sp,208
    80007c54:	00008067          	ret
    80007c58:	07300713          	li	a4,115
    80007c5c:	1ce78a63          	beq	a5,a4,80007e30 <__printf+0x4b8>
    80007c60:	07800713          	li	a4,120
    80007c64:	1ee79e63          	bne	a5,a4,80007e60 <__printf+0x4e8>
    80007c68:	f7843783          	ld	a5,-136(s0)
    80007c6c:	0007a703          	lw	a4,0(a5)
    80007c70:	00878793          	addi	a5,a5,8
    80007c74:	f6f43c23          	sd	a5,-136(s0)
    80007c78:	28074263          	bltz	a4,80007efc <__printf+0x584>
    80007c7c:	00002d97          	auipc	s11,0x2
    80007c80:	b8cd8d93          	addi	s11,s11,-1140 # 80009808 <digits>
    80007c84:	00f77793          	andi	a5,a4,15
    80007c88:	00fd87b3          	add	a5,s11,a5
    80007c8c:	0007c683          	lbu	a3,0(a5)
    80007c90:	00f00613          	li	a2,15
    80007c94:	0007079b          	sext.w	a5,a4
    80007c98:	f8d40023          	sb	a3,-128(s0)
    80007c9c:	0047559b          	srliw	a1,a4,0x4
    80007ca0:	0047569b          	srliw	a3,a4,0x4
    80007ca4:	00000c93          	li	s9,0
    80007ca8:	0ee65063          	bge	a2,a4,80007d88 <__printf+0x410>
    80007cac:	00f6f693          	andi	a3,a3,15
    80007cb0:	00dd86b3          	add	a3,s11,a3
    80007cb4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80007cb8:	0087d79b          	srliw	a5,a5,0x8
    80007cbc:	00100c93          	li	s9,1
    80007cc0:	f8d400a3          	sb	a3,-127(s0)
    80007cc4:	0cb67263          	bgeu	a2,a1,80007d88 <__printf+0x410>
    80007cc8:	00f7f693          	andi	a3,a5,15
    80007ccc:	00dd86b3          	add	a3,s11,a3
    80007cd0:	0006c583          	lbu	a1,0(a3)
    80007cd4:	00f00613          	li	a2,15
    80007cd8:	0047d69b          	srliw	a3,a5,0x4
    80007cdc:	f8b40123          	sb	a1,-126(s0)
    80007ce0:	0047d593          	srli	a1,a5,0x4
    80007ce4:	28f67e63          	bgeu	a2,a5,80007f80 <__printf+0x608>
    80007ce8:	00f6f693          	andi	a3,a3,15
    80007cec:	00dd86b3          	add	a3,s11,a3
    80007cf0:	0006c503          	lbu	a0,0(a3)
    80007cf4:	0087d813          	srli	a6,a5,0x8
    80007cf8:	0087d69b          	srliw	a3,a5,0x8
    80007cfc:	f8a401a3          	sb	a0,-125(s0)
    80007d00:	28b67663          	bgeu	a2,a1,80007f8c <__printf+0x614>
    80007d04:	00f6f693          	andi	a3,a3,15
    80007d08:	00dd86b3          	add	a3,s11,a3
    80007d0c:	0006c583          	lbu	a1,0(a3)
    80007d10:	00c7d513          	srli	a0,a5,0xc
    80007d14:	00c7d69b          	srliw	a3,a5,0xc
    80007d18:	f8b40223          	sb	a1,-124(s0)
    80007d1c:	29067a63          	bgeu	a2,a6,80007fb0 <__printf+0x638>
    80007d20:	00f6f693          	andi	a3,a3,15
    80007d24:	00dd86b3          	add	a3,s11,a3
    80007d28:	0006c583          	lbu	a1,0(a3)
    80007d2c:	0107d813          	srli	a6,a5,0x10
    80007d30:	0107d69b          	srliw	a3,a5,0x10
    80007d34:	f8b402a3          	sb	a1,-123(s0)
    80007d38:	28a67263          	bgeu	a2,a0,80007fbc <__printf+0x644>
    80007d3c:	00f6f693          	andi	a3,a3,15
    80007d40:	00dd86b3          	add	a3,s11,a3
    80007d44:	0006c683          	lbu	a3,0(a3)
    80007d48:	0147d79b          	srliw	a5,a5,0x14
    80007d4c:	f8d40323          	sb	a3,-122(s0)
    80007d50:	21067663          	bgeu	a2,a6,80007f5c <__printf+0x5e4>
    80007d54:	02079793          	slli	a5,a5,0x20
    80007d58:	0207d793          	srli	a5,a5,0x20
    80007d5c:	00fd8db3          	add	s11,s11,a5
    80007d60:	000dc683          	lbu	a3,0(s11)
    80007d64:	00800793          	li	a5,8
    80007d68:	00700c93          	li	s9,7
    80007d6c:	f8d403a3          	sb	a3,-121(s0)
    80007d70:	00075c63          	bgez	a4,80007d88 <__printf+0x410>
    80007d74:	f9040713          	addi	a4,s0,-112
    80007d78:	00f70733          	add	a4,a4,a5
    80007d7c:	02d00693          	li	a3,45
    80007d80:	fed70823          	sb	a3,-16(a4)
    80007d84:	00078c93          	mv	s9,a5
    80007d88:	f8040793          	addi	a5,s0,-128
    80007d8c:	01978cb3          	add	s9,a5,s9
    80007d90:	f7f40d13          	addi	s10,s0,-129
    80007d94:	000cc503          	lbu	a0,0(s9)
    80007d98:	fffc8c93          	addi	s9,s9,-1
    80007d9c:	00000097          	auipc	ra,0x0
    80007da0:	9f8080e7          	jalr	-1544(ra) # 80007794 <consputc>
    80007da4:	ff9d18e3          	bne	s10,s9,80007d94 <__printf+0x41c>
    80007da8:	0100006f          	j	80007db8 <__printf+0x440>
    80007dac:	00000097          	auipc	ra,0x0
    80007db0:	9e8080e7          	jalr	-1560(ra) # 80007794 <consputc>
    80007db4:	000c8493          	mv	s1,s9
    80007db8:	00094503          	lbu	a0,0(s2)
    80007dbc:	c60510e3          	bnez	a0,80007a1c <__printf+0xa4>
    80007dc0:	e40c0ee3          	beqz	s8,80007c1c <__printf+0x2a4>
    80007dc4:	00005517          	auipc	a0,0x5
    80007dc8:	0cc50513          	addi	a0,a0,204 # 8000ce90 <pr>
    80007dcc:	00001097          	auipc	ra,0x1
    80007dd0:	94c080e7          	jalr	-1716(ra) # 80008718 <release>
    80007dd4:	e49ff06f          	j	80007c1c <__printf+0x2a4>
    80007dd8:	f7843783          	ld	a5,-136(s0)
    80007ddc:	03000513          	li	a0,48
    80007de0:	01000d13          	li	s10,16
    80007de4:	00878713          	addi	a4,a5,8
    80007de8:	0007bc83          	ld	s9,0(a5)
    80007dec:	f6e43c23          	sd	a4,-136(s0)
    80007df0:	00000097          	auipc	ra,0x0
    80007df4:	9a4080e7          	jalr	-1628(ra) # 80007794 <consputc>
    80007df8:	07800513          	li	a0,120
    80007dfc:	00000097          	auipc	ra,0x0
    80007e00:	998080e7          	jalr	-1640(ra) # 80007794 <consputc>
    80007e04:	00002d97          	auipc	s11,0x2
    80007e08:	a04d8d93          	addi	s11,s11,-1532 # 80009808 <digits>
    80007e0c:	03ccd793          	srli	a5,s9,0x3c
    80007e10:	00fd87b3          	add	a5,s11,a5
    80007e14:	0007c503          	lbu	a0,0(a5)
    80007e18:	fffd0d1b          	addiw	s10,s10,-1
    80007e1c:	004c9c93          	slli	s9,s9,0x4
    80007e20:	00000097          	auipc	ra,0x0
    80007e24:	974080e7          	jalr	-1676(ra) # 80007794 <consputc>
    80007e28:	fe0d12e3          	bnez	s10,80007e0c <__printf+0x494>
    80007e2c:	f8dff06f          	j	80007db8 <__printf+0x440>
    80007e30:	f7843783          	ld	a5,-136(s0)
    80007e34:	0007bc83          	ld	s9,0(a5)
    80007e38:	00878793          	addi	a5,a5,8
    80007e3c:	f6f43c23          	sd	a5,-136(s0)
    80007e40:	000c9a63          	bnez	s9,80007e54 <__printf+0x4dc>
    80007e44:	1080006f          	j	80007f4c <__printf+0x5d4>
    80007e48:	001c8c93          	addi	s9,s9,1
    80007e4c:	00000097          	auipc	ra,0x0
    80007e50:	948080e7          	jalr	-1720(ra) # 80007794 <consputc>
    80007e54:	000cc503          	lbu	a0,0(s9)
    80007e58:	fe0518e3          	bnez	a0,80007e48 <__printf+0x4d0>
    80007e5c:	f5dff06f          	j	80007db8 <__printf+0x440>
    80007e60:	02500513          	li	a0,37
    80007e64:	00000097          	auipc	ra,0x0
    80007e68:	930080e7          	jalr	-1744(ra) # 80007794 <consputc>
    80007e6c:	000c8513          	mv	a0,s9
    80007e70:	00000097          	auipc	ra,0x0
    80007e74:	924080e7          	jalr	-1756(ra) # 80007794 <consputc>
    80007e78:	f41ff06f          	j	80007db8 <__printf+0x440>
    80007e7c:	02500513          	li	a0,37
    80007e80:	00000097          	auipc	ra,0x0
    80007e84:	914080e7          	jalr	-1772(ra) # 80007794 <consputc>
    80007e88:	f31ff06f          	j	80007db8 <__printf+0x440>
    80007e8c:	00030513          	mv	a0,t1
    80007e90:	00000097          	auipc	ra,0x0
    80007e94:	7bc080e7          	jalr	1980(ra) # 8000864c <acquire>
    80007e98:	b4dff06f          	j	800079e4 <__printf+0x6c>
    80007e9c:	40c0053b          	negw	a0,a2
    80007ea0:	00a00713          	li	a4,10
    80007ea4:	02e576bb          	remuw	a3,a0,a4
    80007ea8:	00002d97          	auipc	s11,0x2
    80007eac:	960d8d93          	addi	s11,s11,-1696 # 80009808 <digits>
    80007eb0:	ff700593          	li	a1,-9
    80007eb4:	02069693          	slli	a3,a3,0x20
    80007eb8:	0206d693          	srli	a3,a3,0x20
    80007ebc:	00dd86b3          	add	a3,s11,a3
    80007ec0:	0006c683          	lbu	a3,0(a3)
    80007ec4:	02e557bb          	divuw	a5,a0,a4
    80007ec8:	f8d40023          	sb	a3,-128(s0)
    80007ecc:	10b65e63          	bge	a2,a1,80007fe8 <__printf+0x670>
    80007ed0:	06300593          	li	a1,99
    80007ed4:	02e7f6bb          	remuw	a3,a5,a4
    80007ed8:	02069693          	slli	a3,a3,0x20
    80007edc:	0206d693          	srli	a3,a3,0x20
    80007ee0:	00dd86b3          	add	a3,s11,a3
    80007ee4:	0006c683          	lbu	a3,0(a3)
    80007ee8:	02e7d73b          	divuw	a4,a5,a4
    80007eec:	00200793          	li	a5,2
    80007ef0:	f8d400a3          	sb	a3,-127(s0)
    80007ef4:	bca5ece3          	bltu	a1,a0,80007acc <__printf+0x154>
    80007ef8:	ce5ff06f          	j	80007bdc <__printf+0x264>
    80007efc:	40e007bb          	negw	a5,a4
    80007f00:	00002d97          	auipc	s11,0x2
    80007f04:	908d8d93          	addi	s11,s11,-1784 # 80009808 <digits>
    80007f08:	00f7f693          	andi	a3,a5,15
    80007f0c:	00dd86b3          	add	a3,s11,a3
    80007f10:	0006c583          	lbu	a1,0(a3)
    80007f14:	ff100613          	li	a2,-15
    80007f18:	0047d69b          	srliw	a3,a5,0x4
    80007f1c:	f8b40023          	sb	a1,-128(s0)
    80007f20:	0047d59b          	srliw	a1,a5,0x4
    80007f24:	0ac75e63          	bge	a4,a2,80007fe0 <__printf+0x668>
    80007f28:	00f6f693          	andi	a3,a3,15
    80007f2c:	00dd86b3          	add	a3,s11,a3
    80007f30:	0006c603          	lbu	a2,0(a3)
    80007f34:	00f00693          	li	a3,15
    80007f38:	0087d79b          	srliw	a5,a5,0x8
    80007f3c:	f8c400a3          	sb	a2,-127(s0)
    80007f40:	d8b6e4e3          	bltu	a3,a1,80007cc8 <__printf+0x350>
    80007f44:	00200793          	li	a5,2
    80007f48:	e2dff06f          	j	80007d74 <__printf+0x3fc>
    80007f4c:	00002c97          	auipc	s9,0x2
    80007f50:	89cc8c93          	addi	s9,s9,-1892 # 800097e8 <CONSOLE_STATUS+0x7d8>
    80007f54:	02800513          	li	a0,40
    80007f58:	ef1ff06f          	j	80007e48 <__printf+0x4d0>
    80007f5c:	00700793          	li	a5,7
    80007f60:	00600c93          	li	s9,6
    80007f64:	e0dff06f          	j	80007d70 <__printf+0x3f8>
    80007f68:	00700793          	li	a5,7
    80007f6c:	00600c93          	li	s9,6
    80007f70:	c69ff06f          	j	80007bd8 <__printf+0x260>
    80007f74:	00300793          	li	a5,3
    80007f78:	00200c93          	li	s9,2
    80007f7c:	c5dff06f          	j	80007bd8 <__printf+0x260>
    80007f80:	00300793          	li	a5,3
    80007f84:	00200c93          	li	s9,2
    80007f88:	de9ff06f          	j	80007d70 <__printf+0x3f8>
    80007f8c:	00400793          	li	a5,4
    80007f90:	00300c93          	li	s9,3
    80007f94:	dddff06f          	j	80007d70 <__printf+0x3f8>
    80007f98:	00400793          	li	a5,4
    80007f9c:	00300c93          	li	s9,3
    80007fa0:	c39ff06f          	j	80007bd8 <__printf+0x260>
    80007fa4:	00500793          	li	a5,5
    80007fa8:	00400c93          	li	s9,4
    80007fac:	c2dff06f          	j	80007bd8 <__printf+0x260>
    80007fb0:	00500793          	li	a5,5
    80007fb4:	00400c93          	li	s9,4
    80007fb8:	db9ff06f          	j	80007d70 <__printf+0x3f8>
    80007fbc:	00600793          	li	a5,6
    80007fc0:	00500c93          	li	s9,5
    80007fc4:	dadff06f          	j	80007d70 <__printf+0x3f8>
    80007fc8:	00600793          	li	a5,6
    80007fcc:	00500c93          	li	s9,5
    80007fd0:	c09ff06f          	j	80007bd8 <__printf+0x260>
    80007fd4:	00800793          	li	a5,8
    80007fd8:	00700c93          	li	s9,7
    80007fdc:	bfdff06f          	j	80007bd8 <__printf+0x260>
    80007fe0:	00100793          	li	a5,1
    80007fe4:	d91ff06f          	j	80007d74 <__printf+0x3fc>
    80007fe8:	00100793          	li	a5,1
    80007fec:	bf1ff06f          	j	80007bdc <__printf+0x264>
    80007ff0:	00900793          	li	a5,9
    80007ff4:	00800c93          	li	s9,8
    80007ff8:	be1ff06f          	j	80007bd8 <__printf+0x260>
    80007ffc:	00001517          	auipc	a0,0x1
    80008000:	7f450513          	addi	a0,a0,2036 # 800097f0 <CONSOLE_STATUS+0x7e0>
    80008004:	00000097          	auipc	ra,0x0
    80008008:	918080e7          	jalr	-1768(ra) # 8000791c <panic>

000000008000800c <printfinit>:
    8000800c:	fe010113          	addi	sp,sp,-32
    80008010:	00813823          	sd	s0,16(sp)
    80008014:	00913423          	sd	s1,8(sp)
    80008018:	00113c23          	sd	ra,24(sp)
    8000801c:	02010413          	addi	s0,sp,32
    80008020:	00005497          	auipc	s1,0x5
    80008024:	e7048493          	addi	s1,s1,-400 # 8000ce90 <pr>
    80008028:	00048513          	mv	a0,s1
    8000802c:	00001597          	auipc	a1,0x1
    80008030:	7d458593          	addi	a1,a1,2004 # 80009800 <CONSOLE_STATUS+0x7f0>
    80008034:	00000097          	auipc	ra,0x0
    80008038:	5f4080e7          	jalr	1524(ra) # 80008628 <initlock>
    8000803c:	01813083          	ld	ra,24(sp)
    80008040:	01013403          	ld	s0,16(sp)
    80008044:	0004ac23          	sw	zero,24(s1)
    80008048:	00813483          	ld	s1,8(sp)
    8000804c:	02010113          	addi	sp,sp,32
    80008050:	00008067          	ret

0000000080008054 <uartinit>:
    80008054:	ff010113          	addi	sp,sp,-16
    80008058:	00813423          	sd	s0,8(sp)
    8000805c:	01010413          	addi	s0,sp,16
    80008060:	100007b7          	lui	a5,0x10000
    80008064:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80008068:	f8000713          	li	a4,-128
    8000806c:	00e781a3          	sb	a4,3(a5)
    80008070:	00300713          	li	a4,3
    80008074:	00e78023          	sb	a4,0(a5)
    80008078:	000780a3          	sb	zero,1(a5)
    8000807c:	00e781a3          	sb	a4,3(a5)
    80008080:	00700693          	li	a3,7
    80008084:	00d78123          	sb	a3,2(a5)
    80008088:	00e780a3          	sb	a4,1(a5)
    8000808c:	00813403          	ld	s0,8(sp)
    80008090:	01010113          	addi	sp,sp,16
    80008094:	00008067          	ret

0000000080008098 <uartputc>:
    80008098:	00004797          	auipc	a5,0x4
    8000809c:	a807a783          	lw	a5,-1408(a5) # 8000bb18 <panicked>
    800080a0:	00078463          	beqz	a5,800080a8 <uartputc+0x10>
    800080a4:	0000006f          	j	800080a4 <uartputc+0xc>
    800080a8:	fd010113          	addi	sp,sp,-48
    800080ac:	02813023          	sd	s0,32(sp)
    800080b0:	00913c23          	sd	s1,24(sp)
    800080b4:	01213823          	sd	s2,16(sp)
    800080b8:	01313423          	sd	s3,8(sp)
    800080bc:	02113423          	sd	ra,40(sp)
    800080c0:	03010413          	addi	s0,sp,48
    800080c4:	00004917          	auipc	s2,0x4
    800080c8:	a5c90913          	addi	s2,s2,-1444 # 8000bb20 <uart_tx_r>
    800080cc:	00093783          	ld	a5,0(s2)
    800080d0:	00004497          	auipc	s1,0x4
    800080d4:	a5848493          	addi	s1,s1,-1448 # 8000bb28 <uart_tx_w>
    800080d8:	0004b703          	ld	a4,0(s1)
    800080dc:	02078693          	addi	a3,a5,32
    800080e0:	00050993          	mv	s3,a0
    800080e4:	02e69c63          	bne	a3,a4,8000811c <uartputc+0x84>
    800080e8:	00001097          	auipc	ra,0x1
    800080ec:	834080e7          	jalr	-1996(ra) # 8000891c <push_on>
    800080f0:	00093783          	ld	a5,0(s2)
    800080f4:	0004b703          	ld	a4,0(s1)
    800080f8:	02078793          	addi	a5,a5,32
    800080fc:	00e79463          	bne	a5,a4,80008104 <uartputc+0x6c>
    80008100:	0000006f          	j	80008100 <uartputc+0x68>
    80008104:	00001097          	auipc	ra,0x1
    80008108:	88c080e7          	jalr	-1908(ra) # 80008990 <pop_on>
    8000810c:	00093783          	ld	a5,0(s2)
    80008110:	0004b703          	ld	a4,0(s1)
    80008114:	02078693          	addi	a3,a5,32
    80008118:	fce688e3          	beq	a3,a4,800080e8 <uartputc+0x50>
    8000811c:	01f77693          	andi	a3,a4,31
    80008120:	00005597          	auipc	a1,0x5
    80008124:	d9058593          	addi	a1,a1,-624 # 8000ceb0 <uart_tx_buf>
    80008128:	00d586b3          	add	a3,a1,a3
    8000812c:	00170713          	addi	a4,a4,1
    80008130:	01368023          	sb	s3,0(a3)
    80008134:	00e4b023          	sd	a4,0(s1)
    80008138:	10000637          	lui	a2,0x10000
    8000813c:	02f71063          	bne	a4,a5,8000815c <uartputc+0xc4>
    80008140:	0340006f          	j	80008174 <uartputc+0xdc>
    80008144:	00074703          	lbu	a4,0(a4)
    80008148:	00f93023          	sd	a5,0(s2)
    8000814c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80008150:	00093783          	ld	a5,0(s2)
    80008154:	0004b703          	ld	a4,0(s1)
    80008158:	00f70e63          	beq	a4,a5,80008174 <uartputc+0xdc>
    8000815c:	00564683          	lbu	a3,5(a2)
    80008160:	01f7f713          	andi	a4,a5,31
    80008164:	00e58733          	add	a4,a1,a4
    80008168:	0206f693          	andi	a3,a3,32
    8000816c:	00178793          	addi	a5,a5,1
    80008170:	fc069ae3          	bnez	a3,80008144 <uartputc+0xac>
    80008174:	02813083          	ld	ra,40(sp)
    80008178:	02013403          	ld	s0,32(sp)
    8000817c:	01813483          	ld	s1,24(sp)
    80008180:	01013903          	ld	s2,16(sp)
    80008184:	00813983          	ld	s3,8(sp)
    80008188:	03010113          	addi	sp,sp,48
    8000818c:	00008067          	ret

0000000080008190 <uartputc_sync>:
    80008190:	ff010113          	addi	sp,sp,-16
    80008194:	00813423          	sd	s0,8(sp)
    80008198:	01010413          	addi	s0,sp,16
    8000819c:	00004717          	auipc	a4,0x4
    800081a0:	97c72703          	lw	a4,-1668(a4) # 8000bb18 <panicked>
    800081a4:	02071663          	bnez	a4,800081d0 <uartputc_sync+0x40>
    800081a8:	00050793          	mv	a5,a0
    800081ac:	100006b7          	lui	a3,0x10000
    800081b0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800081b4:	02077713          	andi	a4,a4,32
    800081b8:	fe070ce3          	beqz	a4,800081b0 <uartputc_sync+0x20>
    800081bc:	0ff7f793          	andi	a5,a5,255
    800081c0:	00f68023          	sb	a5,0(a3)
    800081c4:	00813403          	ld	s0,8(sp)
    800081c8:	01010113          	addi	sp,sp,16
    800081cc:	00008067          	ret
    800081d0:	0000006f          	j	800081d0 <uartputc_sync+0x40>

00000000800081d4 <uartstart>:
    800081d4:	ff010113          	addi	sp,sp,-16
    800081d8:	00813423          	sd	s0,8(sp)
    800081dc:	01010413          	addi	s0,sp,16
    800081e0:	00004617          	auipc	a2,0x4
    800081e4:	94060613          	addi	a2,a2,-1728 # 8000bb20 <uart_tx_r>
    800081e8:	00004517          	auipc	a0,0x4
    800081ec:	94050513          	addi	a0,a0,-1728 # 8000bb28 <uart_tx_w>
    800081f0:	00063783          	ld	a5,0(a2)
    800081f4:	00053703          	ld	a4,0(a0)
    800081f8:	04f70263          	beq	a4,a5,8000823c <uartstart+0x68>
    800081fc:	100005b7          	lui	a1,0x10000
    80008200:	00005817          	auipc	a6,0x5
    80008204:	cb080813          	addi	a6,a6,-848 # 8000ceb0 <uart_tx_buf>
    80008208:	01c0006f          	j	80008224 <uartstart+0x50>
    8000820c:	0006c703          	lbu	a4,0(a3)
    80008210:	00f63023          	sd	a5,0(a2)
    80008214:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80008218:	00063783          	ld	a5,0(a2)
    8000821c:	00053703          	ld	a4,0(a0)
    80008220:	00f70e63          	beq	a4,a5,8000823c <uartstart+0x68>
    80008224:	01f7f713          	andi	a4,a5,31
    80008228:	00e806b3          	add	a3,a6,a4
    8000822c:	0055c703          	lbu	a4,5(a1)
    80008230:	00178793          	addi	a5,a5,1
    80008234:	02077713          	andi	a4,a4,32
    80008238:	fc071ae3          	bnez	a4,8000820c <uartstart+0x38>
    8000823c:	00813403          	ld	s0,8(sp)
    80008240:	01010113          	addi	sp,sp,16
    80008244:	00008067          	ret

0000000080008248 <uartgetc>:
    80008248:	ff010113          	addi	sp,sp,-16
    8000824c:	00813423          	sd	s0,8(sp)
    80008250:	01010413          	addi	s0,sp,16
    80008254:	10000737          	lui	a4,0x10000
    80008258:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000825c:	0017f793          	andi	a5,a5,1
    80008260:	00078c63          	beqz	a5,80008278 <uartgetc+0x30>
    80008264:	00074503          	lbu	a0,0(a4)
    80008268:	0ff57513          	andi	a0,a0,255
    8000826c:	00813403          	ld	s0,8(sp)
    80008270:	01010113          	addi	sp,sp,16
    80008274:	00008067          	ret
    80008278:	fff00513          	li	a0,-1
    8000827c:	ff1ff06f          	j	8000826c <uartgetc+0x24>

0000000080008280 <uartintr>:
    80008280:	100007b7          	lui	a5,0x10000
    80008284:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80008288:	0017f793          	andi	a5,a5,1
    8000828c:	0a078463          	beqz	a5,80008334 <uartintr+0xb4>
    80008290:	fe010113          	addi	sp,sp,-32
    80008294:	00813823          	sd	s0,16(sp)
    80008298:	00913423          	sd	s1,8(sp)
    8000829c:	00113c23          	sd	ra,24(sp)
    800082a0:	02010413          	addi	s0,sp,32
    800082a4:	100004b7          	lui	s1,0x10000
    800082a8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800082ac:	0ff57513          	andi	a0,a0,255
    800082b0:	fffff097          	auipc	ra,0xfffff
    800082b4:	534080e7          	jalr	1332(ra) # 800077e4 <consoleintr>
    800082b8:	0054c783          	lbu	a5,5(s1)
    800082bc:	0017f793          	andi	a5,a5,1
    800082c0:	fe0794e3          	bnez	a5,800082a8 <uartintr+0x28>
    800082c4:	00004617          	auipc	a2,0x4
    800082c8:	85c60613          	addi	a2,a2,-1956 # 8000bb20 <uart_tx_r>
    800082cc:	00004517          	auipc	a0,0x4
    800082d0:	85c50513          	addi	a0,a0,-1956 # 8000bb28 <uart_tx_w>
    800082d4:	00063783          	ld	a5,0(a2)
    800082d8:	00053703          	ld	a4,0(a0)
    800082dc:	04f70263          	beq	a4,a5,80008320 <uartintr+0xa0>
    800082e0:	100005b7          	lui	a1,0x10000
    800082e4:	00005817          	auipc	a6,0x5
    800082e8:	bcc80813          	addi	a6,a6,-1076 # 8000ceb0 <uart_tx_buf>
    800082ec:	01c0006f          	j	80008308 <uartintr+0x88>
    800082f0:	0006c703          	lbu	a4,0(a3)
    800082f4:	00f63023          	sd	a5,0(a2)
    800082f8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800082fc:	00063783          	ld	a5,0(a2)
    80008300:	00053703          	ld	a4,0(a0)
    80008304:	00f70e63          	beq	a4,a5,80008320 <uartintr+0xa0>
    80008308:	01f7f713          	andi	a4,a5,31
    8000830c:	00e806b3          	add	a3,a6,a4
    80008310:	0055c703          	lbu	a4,5(a1)
    80008314:	00178793          	addi	a5,a5,1
    80008318:	02077713          	andi	a4,a4,32
    8000831c:	fc071ae3          	bnez	a4,800082f0 <uartintr+0x70>
    80008320:	01813083          	ld	ra,24(sp)
    80008324:	01013403          	ld	s0,16(sp)
    80008328:	00813483          	ld	s1,8(sp)
    8000832c:	02010113          	addi	sp,sp,32
    80008330:	00008067          	ret
    80008334:	00003617          	auipc	a2,0x3
    80008338:	7ec60613          	addi	a2,a2,2028 # 8000bb20 <uart_tx_r>
    8000833c:	00003517          	auipc	a0,0x3
    80008340:	7ec50513          	addi	a0,a0,2028 # 8000bb28 <uart_tx_w>
    80008344:	00063783          	ld	a5,0(a2)
    80008348:	00053703          	ld	a4,0(a0)
    8000834c:	04f70263          	beq	a4,a5,80008390 <uartintr+0x110>
    80008350:	100005b7          	lui	a1,0x10000
    80008354:	00005817          	auipc	a6,0x5
    80008358:	b5c80813          	addi	a6,a6,-1188 # 8000ceb0 <uart_tx_buf>
    8000835c:	01c0006f          	j	80008378 <uartintr+0xf8>
    80008360:	0006c703          	lbu	a4,0(a3)
    80008364:	00f63023          	sd	a5,0(a2)
    80008368:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000836c:	00063783          	ld	a5,0(a2)
    80008370:	00053703          	ld	a4,0(a0)
    80008374:	02f70063          	beq	a4,a5,80008394 <uartintr+0x114>
    80008378:	01f7f713          	andi	a4,a5,31
    8000837c:	00e806b3          	add	a3,a6,a4
    80008380:	0055c703          	lbu	a4,5(a1)
    80008384:	00178793          	addi	a5,a5,1
    80008388:	02077713          	andi	a4,a4,32
    8000838c:	fc071ae3          	bnez	a4,80008360 <uartintr+0xe0>
    80008390:	00008067          	ret
    80008394:	00008067          	ret

0000000080008398 <kinit>:
    80008398:	fc010113          	addi	sp,sp,-64
    8000839c:	02913423          	sd	s1,40(sp)
    800083a0:	fffff7b7          	lui	a5,0xfffff
    800083a4:	00006497          	auipc	s1,0x6
    800083a8:	b2b48493          	addi	s1,s1,-1237 # 8000decf <end+0xfff>
    800083ac:	02813823          	sd	s0,48(sp)
    800083b0:	01313c23          	sd	s3,24(sp)
    800083b4:	00f4f4b3          	and	s1,s1,a5
    800083b8:	02113c23          	sd	ra,56(sp)
    800083bc:	03213023          	sd	s2,32(sp)
    800083c0:	01413823          	sd	s4,16(sp)
    800083c4:	01513423          	sd	s5,8(sp)
    800083c8:	04010413          	addi	s0,sp,64
    800083cc:	000017b7          	lui	a5,0x1
    800083d0:	01100993          	li	s3,17
    800083d4:	00f487b3          	add	a5,s1,a5
    800083d8:	01b99993          	slli	s3,s3,0x1b
    800083dc:	06f9e063          	bltu	s3,a5,8000843c <kinit+0xa4>
    800083e0:	00005a97          	auipc	s5,0x5
    800083e4:	af0a8a93          	addi	s5,s5,-1296 # 8000ced0 <end>
    800083e8:	0754ec63          	bltu	s1,s5,80008460 <kinit+0xc8>
    800083ec:	0734fa63          	bgeu	s1,s3,80008460 <kinit+0xc8>
    800083f0:	00088a37          	lui	s4,0x88
    800083f4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800083f8:	00003917          	auipc	s2,0x3
    800083fc:	73890913          	addi	s2,s2,1848 # 8000bb30 <kmem>
    80008400:	00ca1a13          	slli	s4,s4,0xc
    80008404:	0140006f          	j	80008418 <kinit+0x80>
    80008408:	000017b7          	lui	a5,0x1
    8000840c:	00f484b3          	add	s1,s1,a5
    80008410:	0554e863          	bltu	s1,s5,80008460 <kinit+0xc8>
    80008414:	0534f663          	bgeu	s1,s3,80008460 <kinit+0xc8>
    80008418:	00001637          	lui	a2,0x1
    8000841c:	00100593          	li	a1,1
    80008420:	00048513          	mv	a0,s1
    80008424:	00000097          	auipc	ra,0x0
    80008428:	5e4080e7          	jalr	1508(ra) # 80008a08 <__memset>
    8000842c:	00093783          	ld	a5,0(s2)
    80008430:	00f4b023          	sd	a5,0(s1)
    80008434:	00993023          	sd	s1,0(s2)
    80008438:	fd4498e3          	bne	s1,s4,80008408 <kinit+0x70>
    8000843c:	03813083          	ld	ra,56(sp)
    80008440:	03013403          	ld	s0,48(sp)
    80008444:	02813483          	ld	s1,40(sp)
    80008448:	02013903          	ld	s2,32(sp)
    8000844c:	01813983          	ld	s3,24(sp)
    80008450:	01013a03          	ld	s4,16(sp)
    80008454:	00813a83          	ld	s5,8(sp)
    80008458:	04010113          	addi	sp,sp,64
    8000845c:	00008067          	ret
    80008460:	00001517          	auipc	a0,0x1
    80008464:	3c050513          	addi	a0,a0,960 # 80009820 <digits+0x18>
    80008468:	fffff097          	auipc	ra,0xfffff
    8000846c:	4b4080e7          	jalr	1204(ra) # 8000791c <panic>

0000000080008470 <freerange>:
    80008470:	fc010113          	addi	sp,sp,-64
    80008474:	000017b7          	lui	a5,0x1
    80008478:	02913423          	sd	s1,40(sp)
    8000847c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80008480:	009504b3          	add	s1,a0,s1
    80008484:	fffff537          	lui	a0,0xfffff
    80008488:	02813823          	sd	s0,48(sp)
    8000848c:	02113c23          	sd	ra,56(sp)
    80008490:	03213023          	sd	s2,32(sp)
    80008494:	01313c23          	sd	s3,24(sp)
    80008498:	01413823          	sd	s4,16(sp)
    8000849c:	01513423          	sd	s5,8(sp)
    800084a0:	01613023          	sd	s6,0(sp)
    800084a4:	04010413          	addi	s0,sp,64
    800084a8:	00a4f4b3          	and	s1,s1,a0
    800084ac:	00f487b3          	add	a5,s1,a5
    800084b0:	06f5e463          	bltu	a1,a5,80008518 <freerange+0xa8>
    800084b4:	00005a97          	auipc	s5,0x5
    800084b8:	a1ca8a93          	addi	s5,s5,-1508 # 8000ced0 <end>
    800084bc:	0954e263          	bltu	s1,s5,80008540 <freerange+0xd0>
    800084c0:	01100993          	li	s3,17
    800084c4:	01b99993          	slli	s3,s3,0x1b
    800084c8:	0734fc63          	bgeu	s1,s3,80008540 <freerange+0xd0>
    800084cc:	00058a13          	mv	s4,a1
    800084d0:	00003917          	auipc	s2,0x3
    800084d4:	66090913          	addi	s2,s2,1632 # 8000bb30 <kmem>
    800084d8:	00002b37          	lui	s6,0x2
    800084dc:	0140006f          	j	800084f0 <freerange+0x80>
    800084e0:	000017b7          	lui	a5,0x1
    800084e4:	00f484b3          	add	s1,s1,a5
    800084e8:	0554ec63          	bltu	s1,s5,80008540 <freerange+0xd0>
    800084ec:	0534fa63          	bgeu	s1,s3,80008540 <freerange+0xd0>
    800084f0:	00001637          	lui	a2,0x1
    800084f4:	00100593          	li	a1,1
    800084f8:	00048513          	mv	a0,s1
    800084fc:	00000097          	auipc	ra,0x0
    80008500:	50c080e7          	jalr	1292(ra) # 80008a08 <__memset>
    80008504:	00093703          	ld	a4,0(s2)
    80008508:	016487b3          	add	a5,s1,s6
    8000850c:	00e4b023          	sd	a4,0(s1)
    80008510:	00993023          	sd	s1,0(s2)
    80008514:	fcfa76e3          	bgeu	s4,a5,800084e0 <freerange+0x70>
    80008518:	03813083          	ld	ra,56(sp)
    8000851c:	03013403          	ld	s0,48(sp)
    80008520:	02813483          	ld	s1,40(sp)
    80008524:	02013903          	ld	s2,32(sp)
    80008528:	01813983          	ld	s3,24(sp)
    8000852c:	01013a03          	ld	s4,16(sp)
    80008530:	00813a83          	ld	s5,8(sp)
    80008534:	00013b03          	ld	s6,0(sp)
    80008538:	04010113          	addi	sp,sp,64
    8000853c:	00008067          	ret
    80008540:	00001517          	auipc	a0,0x1
    80008544:	2e050513          	addi	a0,a0,736 # 80009820 <digits+0x18>
    80008548:	fffff097          	auipc	ra,0xfffff
    8000854c:	3d4080e7          	jalr	980(ra) # 8000791c <panic>

0000000080008550 <kfree>:
    80008550:	fe010113          	addi	sp,sp,-32
    80008554:	00813823          	sd	s0,16(sp)
    80008558:	00113c23          	sd	ra,24(sp)
    8000855c:	00913423          	sd	s1,8(sp)
    80008560:	02010413          	addi	s0,sp,32
    80008564:	03451793          	slli	a5,a0,0x34
    80008568:	04079c63          	bnez	a5,800085c0 <kfree+0x70>
    8000856c:	00005797          	auipc	a5,0x5
    80008570:	96478793          	addi	a5,a5,-1692 # 8000ced0 <end>
    80008574:	00050493          	mv	s1,a0
    80008578:	04f56463          	bltu	a0,a5,800085c0 <kfree+0x70>
    8000857c:	01100793          	li	a5,17
    80008580:	01b79793          	slli	a5,a5,0x1b
    80008584:	02f57e63          	bgeu	a0,a5,800085c0 <kfree+0x70>
    80008588:	00001637          	lui	a2,0x1
    8000858c:	00100593          	li	a1,1
    80008590:	00000097          	auipc	ra,0x0
    80008594:	478080e7          	jalr	1144(ra) # 80008a08 <__memset>
    80008598:	00003797          	auipc	a5,0x3
    8000859c:	59878793          	addi	a5,a5,1432 # 8000bb30 <kmem>
    800085a0:	0007b703          	ld	a4,0(a5)
    800085a4:	01813083          	ld	ra,24(sp)
    800085a8:	01013403          	ld	s0,16(sp)
    800085ac:	00e4b023          	sd	a4,0(s1)
    800085b0:	0097b023          	sd	s1,0(a5)
    800085b4:	00813483          	ld	s1,8(sp)
    800085b8:	02010113          	addi	sp,sp,32
    800085bc:	00008067          	ret
    800085c0:	00001517          	auipc	a0,0x1
    800085c4:	26050513          	addi	a0,a0,608 # 80009820 <digits+0x18>
    800085c8:	fffff097          	auipc	ra,0xfffff
    800085cc:	354080e7          	jalr	852(ra) # 8000791c <panic>

00000000800085d0 <kalloc>:
    800085d0:	fe010113          	addi	sp,sp,-32
    800085d4:	00813823          	sd	s0,16(sp)
    800085d8:	00913423          	sd	s1,8(sp)
    800085dc:	00113c23          	sd	ra,24(sp)
    800085e0:	02010413          	addi	s0,sp,32
    800085e4:	00003797          	auipc	a5,0x3
    800085e8:	54c78793          	addi	a5,a5,1356 # 8000bb30 <kmem>
    800085ec:	0007b483          	ld	s1,0(a5)
    800085f0:	02048063          	beqz	s1,80008610 <kalloc+0x40>
    800085f4:	0004b703          	ld	a4,0(s1)
    800085f8:	00001637          	lui	a2,0x1
    800085fc:	00500593          	li	a1,5
    80008600:	00048513          	mv	a0,s1
    80008604:	00e7b023          	sd	a4,0(a5)
    80008608:	00000097          	auipc	ra,0x0
    8000860c:	400080e7          	jalr	1024(ra) # 80008a08 <__memset>
    80008610:	01813083          	ld	ra,24(sp)
    80008614:	01013403          	ld	s0,16(sp)
    80008618:	00048513          	mv	a0,s1
    8000861c:	00813483          	ld	s1,8(sp)
    80008620:	02010113          	addi	sp,sp,32
    80008624:	00008067          	ret

0000000080008628 <initlock>:
    80008628:	ff010113          	addi	sp,sp,-16
    8000862c:	00813423          	sd	s0,8(sp)
    80008630:	01010413          	addi	s0,sp,16
    80008634:	00813403          	ld	s0,8(sp)
    80008638:	00b53423          	sd	a1,8(a0)
    8000863c:	00052023          	sw	zero,0(a0)
    80008640:	00053823          	sd	zero,16(a0)
    80008644:	01010113          	addi	sp,sp,16
    80008648:	00008067          	ret

000000008000864c <acquire>:
    8000864c:	fe010113          	addi	sp,sp,-32
    80008650:	00813823          	sd	s0,16(sp)
    80008654:	00913423          	sd	s1,8(sp)
    80008658:	00113c23          	sd	ra,24(sp)
    8000865c:	01213023          	sd	s2,0(sp)
    80008660:	02010413          	addi	s0,sp,32
    80008664:	00050493          	mv	s1,a0
    80008668:	10002973          	csrr	s2,sstatus
    8000866c:	100027f3          	csrr	a5,sstatus
    80008670:	ffd7f793          	andi	a5,a5,-3
    80008674:	10079073          	csrw	sstatus,a5
    80008678:	fffff097          	auipc	ra,0xfffff
    8000867c:	8e0080e7          	jalr	-1824(ra) # 80006f58 <mycpu>
    80008680:	07852783          	lw	a5,120(a0)
    80008684:	06078e63          	beqz	a5,80008700 <acquire+0xb4>
    80008688:	fffff097          	auipc	ra,0xfffff
    8000868c:	8d0080e7          	jalr	-1840(ra) # 80006f58 <mycpu>
    80008690:	07852783          	lw	a5,120(a0)
    80008694:	0004a703          	lw	a4,0(s1)
    80008698:	0017879b          	addiw	a5,a5,1
    8000869c:	06f52c23          	sw	a5,120(a0)
    800086a0:	04071063          	bnez	a4,800086e0 <acquire+0x94>
    800086a4:	00100713          	li	a4,1
    800086a8:	00070793          	mv	a5,a4
    800086ac:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800086b0:	0007879b          	sext.w	a5,a5
    800086b4:	fe079ae3          	bnez	a5,800086a8 <acquire+0x5c>
    800086b8:	0ff0000f          	fence
    800086bc:	fffff097          	auipc	ra,0xfffff
    800086c0:	89c080e7          	jalr	-1892(ra) # 80006f58 <mycpu>
    800086c4:	01813083          	ld	ra,24(sp)
    800086c8:	01013403          	ld	s0,16(sp)
    800086cc:	00a4b823          	sd	a0,16(s1)
    800086d0:	00013903          	ld	s2,0(sp)
    800086d4:	00813483          	ld	s1,8(sp)
    800086d8:	02010113          	addi	sp,sp,32
    800086dc:	00008067          	ret
    800086e0:	0104b903          	ld	s2,16(s1)
    800086e4:	fffff097          	auipc	ra,0xfffff
    800086e8:	874080e7          	jalr	-1932(ra) # 80006f58 <mycpu>
    800086ec:	faa91ce3          	bne	s2,a0,800086a4 <acquire+0x58>
    800086f0:	00001517          	auipc	a0,0x1
    800086f4:	13850513          	addi	a0,a0,312 # 80009828 <digits+0x20>
    800086f8:	fffff097          	auipc	ra,0xfffff
    800086fc:	224080e7          	jalr	548(ra) # 8000791c <panic>
    80008700:	00195913          	srli	s2,s2,0x1
    80008704:	fffff097          	auipc	ra,0xfffff
    80008708:	854080e7          	jalr	-1964(ra) # 80006f58 <mycpu>
    8000870c:	00197913          	andi	s2,s2,1
    80008710:	07252e23          	sw	s2,124(a0)
    80008714:	f75ff06f          	j	80008688 <acquire+0x3c>

0000000080008718 <release>:
    80008718:	fe010113          	addi	sp,sp,-32
    8000871c:	00813823          	sd	s0,16(sp)
    80008720:	00113c23          	sd	ra,24(sp)
    80008724:	00913423          	sd	s1,8(sp)
    80008728:	01213023          	sd	s2,0(sp)
    8000872c:	02010413          	addi	s0,sp,32
    80008730:	00052783          	lw	a5,0(a0)
    80008734:	00079a63          	bnez	a5,80008748 <release+0x30>
    80008738:	00001517          	auipc	a0,0x1
    8000873c:	0f850513          	addi	a0,a0,248 # 80009830 <digits+0x28>
    80008740:	fffff097          	auipc	ra,0xfffff
    80008744:	1dc080e7          	jalr	476(ra) # 8000791c <panic>
    80008748:	01053903          	ld	s2,16(a0)
    8000874c:	00050493          	mv	s1,a0
    80008750:	fffff097          	auipc	ra,0xfffff
    80008754:	808080e7          	jalr	-2040(ra) # 80006f58 <mycpu>
    80008758:	fea910e3          	bne	s2,a0,80008738 <release+0x20>
    8000875c:	0004b823          	sd	zero,16(s1)
    80008760:	0ff0000f          	fence
    80008764:	0f50000f          	fence	iorw,ow
    80008768:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000876c:	ffffe097          	auipc	ra,0xffffe
    80008770:	7ec080e7          	jalr	2028(ra) # 80006f58 <mycpu>
    80008774:	100027f3          	csrr	a5,sstatus
    80008778:	0027f793          	andi	a5,a5,2
    8000877c:	04079a63          	bnez	a5,800087d0 <release+0xb8>
    80008780:	07852783          	lw	a5,120(a0)
    80008784:	02f05e63          	blez	a5,800087c0 <release+0xa8>
    80008788:	fff7871b          	addiw	a4,a5,-1
    8000878c:	06e52c23          	sw	a4,120(a0)
    80008790:	00071c63          	bnez	a4,800087a8 <release+0x90>
    80008794:	07c52783          	lw	a5,124(a0)
    80008798:	00078863          	beqz	a5,800087a8 <release+0x90>
    8000879c:	100027f3          	csrr	a5,sstatus
    800087a0:	0027e793          	ori	a5,a5,2
    800087a4:	10079073          	csrw	sstatus,a5
    800087a8:	01813083          	ld	ra,24(sp)
    800087ac:	01013403          	ld	s0,16(sp)
    800087b0:	00813483          	ld	s1,8(sp)
    800087b4:	00013903          	ld	s2,0(sp)
    800087b8:	02010113          	addi	sp,sp,32
    800087bc:	00008067          	ret
    800087c0:	00001517          	auipc	a0,0x1
    800087c4:	09050513          	addi	a0,a0,144 # 80009850 <digits+0x48>
    800087c8:	fffff097          	auipc	ra,0xfffff
    800087cc:	154080e7          	jalr	340(ra) # 8000791c <panic>
    800087d0:	00001517          	auipc	a0,0x1
    800087d4:	06850513          	addi	a0,a0,104 # 80009838 <digits+0x30>
    800087d8:	fffff097          	auipc	ra,0xfffff
    800087dc:	144080e7          	jalr	324(ra) # 8000791c <panic>

00000000800087e0 <holding>:
    800087e0:	00052783          	lw	a5,0(a0)
    800087e4:	00079663          	bnez	a5,800087f0 <holding+0x10>
    800087e8:	00000513          	li	a0,0
    800087ec:	00008067          	ret
    800087f0:	fe010113          	addi	sp,sp,-32
    800087f4:	00813823          	sd	s0,16(sp)
    800087f8:	00913423          	sd	s1,8(sp)
    800087fc:	00113c23          	sd	ra,24(sp)
    80008800:	02010413          	addi	s0,sp,32
    80008804:	01053483          	ld	s1,16(a0)
    80008808:	ffffe097          	auipc	ra,0xffffe
    8000880c:	750080e7          	jalr	1872(ra) # 80006f58 <mycpu>
    80008810:	01813083          	ld	ra,24(sp)
    80008814:	01013403          	ld	s0,16(sp)
    80008818:	40a48533          	sub	a0,s1,a0
    8000881c:	00153513          	seqz	a0,a0
    80008820:	00813483          	ld	s1,8(sp)
    80008824:	02010113          	addi	sp,sp,32
    80008828:	00008067          	ret

000000008000882c <push_off>:
    8000882c:	fe010113          	addi	sp,sp,-32
    80008830:	00813823          	sd	s0,16(sp)
    80008834:	00113c23          	sd	ra,24(sp)
    80008838:	00913423          	sd	s1,8(sp)
    8000883c:	02010413          	addi	s0,sp,32
    80008840:	100024f3          	csrr	s1,sstatus
    80008844:	100027f3          	csrr	a5,sstatus
    80008848:	ffd7f793          	andi	a5,a5,-3
    8000884c:	10079073          	csrw	sstatus,a5
    80008850:	ffffe097          	auipc	ra,0xffffe
    80008854:	708080e7          	jalr	1800(ra) # 80006f58 <mycpu>
    80008858:	07852783          	lw	a5,120(a0)
    8000885c:	02078663          	beqz	a5,80008888 <push_off+0x5c>
    80008860:	ffffe097          	auipc	ra,0xffffe
    80008864:	6f8080e7          	jalr	1784(ra) # 80006f58 <mycpu>
    80008868:	07852783          	lw	a5,120(a0)
    8000886c:	01813083          	ld	ra,24(sp)
    80008870:	01013403          	ld	s0,16(sp)
    80008874:	0017879b          	addiw	a5,a5,1
    80008878:	06f52c23          	sw	a5,120(a0)
    8000887c:	00813483          	ld	s1,8(sp)
    80008880:	02010113          	addi	sp,sp,32
    80008884:	00008067          	ret
    80008888:	0014d493          	srli	s1,s1,0x1
    8000888c:	ffffe097          	auipc	ra,0xffffe
    80008890:	6cc080e7          	jalr	1740(ra) # 80006f58 <mycpu>
    80008894:	0014f493          	andi	s1,s1,1
    80008898:	06952e23          	sw	s1,124(a0)
    8000889c:	fc5ff06f          	j	80008860 <push_off+0x34>

00000000800088a0 <pop_off>:
    800088a0:	ff010113          	addi	sp,sp,-16
    800088a4:	00813023          	sd	s0,0(sp)
    800088a8:	00113423          	sd	ra,8(sp)
    800088ac:	01010413          	addi	s0,sp,16
    800088b0:	ffffe097          	auipc	ra,0xffffe
    800088b4:	6a8080e7          	jalr	1704(ra) # 80006f58 <mycpu>
    800088b8:	100027f3          	csrr	a5,sstatus
    800088bc:	0027f793          	andi	a5,a5,2
    800088c0:	04079663          	bnez	a5,8000890c <pop_off+0x6c>
    800088c4:	07852783          	lw	a5,120(a0)
    800088c8:	02f05a63          	blez	a5,800088fc <pop_off+0x5c>
    800088cc:	fff7871b          	addiw	a4,a5,-1
    800088d0:	06e52c23          	sw	a4,120(a0)
    800088d4:	00071c63          	bnez	a4,800088ec <pop_off+0x4c>
    800088d8:	07c52783          	lw	a5,124(a0)
    800088dc:	00078863          	beqz	a5,800088ec <pop_off+0x4c>
    800088e0:	100027f3          	csrr	a5,sstatus
    800088e4:	0027e793          	ori	a5,a5,2
    800088e8:	10079073          	csrw	sstatus,a5
    800088ec:	00813083          	ld	ra,8(sp)
    800088f0:	00013403          	ld	s0,0(sp)
    800088f4:	01010113          	addi	sp,sp,16
    800088f8:	00008067          	ret
    800088fc:	00001517          	auipc	a0,0x1
    80008900:	f5450513          	addi	a0,a0,-172 # 80009850 <digits+0x48>
    80008904:	fffff097          	auipc	ra,0xfffff
    80008908:	018080e7          	jalr	24(ra) # 8000791c <panic>
    8000890c:	00001517          	auipc	a0,0x1
    80008910:	f2c50513          	addi	a0,a0,-212 # 80009838 <digits+0x30>
    80008914:	fffff097          	auipc	ra,0xfffff
    80008918:	008080e7          	jalr	8(ra) # 8000791c <panic>

000000008000891c <push_on>:
    8000891c:	fe010113          	addi	sp,sp,-32
    80008920:	00813823          	sd	s0,16(sp)
    80008924:	00113c23          	sd	ra,24(sp)
    80008928:	00913423          	sd	s1,8(sp)
    8000892c:	02010413          	addi	s0,sp,32
    80008930:	100024f3          	csrr	s1,sstatus
    80008934:	100027f3          	csrr	a5,sstatus
    80008938:	0027e793          	ori	a5,a5,2
    8000893c:	10079073          	csrw	sstatus,a5
    80008940:	ffffe097          	auipc	ra,0xffffe
    80008944:	618080e7          	jalr	1560(ra) # 80006f58 <mycpu>
    80008948:	07852783          	lw	a5,120(a0)
    8000894c:	02078663          	beqz	a5,80008978 <push_on+0x5c>
    80008950:	ffffe097          	auipc	ra,0xffffe
    80008954:	608080e7          	jalr	1544(ra) # 80006f58 <mycpu>
    80008958:	07852783          	lw	a5,120(a0)
    8000895c:	01813083          	ld	ra,24(sp)
    80008960:	01013403          	ld	s0,16(sp)
    80008964:	0017879b          	addiw	a5,a5,1
    80008968:	06f52c23          	sw	a5,120(a0)
    8000896c:	00813483          	ld	s1,8(sp)
    80008970:	02010113          	addi	sp,sp,32
    80008974:	00008067          	ret
    80008978:	0014d493          	srli	s1,s1,0x1
    8000897c:	ffffe097          	auipc	ra,0xffffe
    80008980:	5dc080e7          	jalr	1500(ra) # 80006f58 <mycpu>
    80008984:	0014f493          	andi	s1,s1,1
    80008988:	06952e23          	sw	s1,124(a0)
    8000898c:	fc5ff06f          	j	80008950 <push_on+0x34>

0000000080008990 <pop_on>:
    80008990:	ff010113          	addi	sp,sp,-16
    80008994:	00813023          	sd	s0,0(sp)
    80008998:	00113423          	sd	ra,8(sp)
    8000899c:	01010413          	addi	s0,sp,16
    800089a0:	ffffe097          	auipc	ra,0xffffe
    800089a4:	5b8080e7          	jalr	1464(ra) # 80006f58 <mycpu>
    800089a8:	100027f3          	csrr	a5,sstatus
    800089ac:	0027f793          	andi	a5,a5,2
    800089b0:	04078463          	beqz	a5,800089f8 <pop_on+0x68>
    800089b4:	07852783          	lw	a5,120(a0)
    800089b8:	02f05863          	blez	a5,800089e8 <pop_on+0x58>
    800089bc:	fff7879b          	addiw	a5,a5,-1
    800089c0:	06f52c23          	sw	a5,120(a0)
    800089c4:	07853783          	ld	a5,120(a0)
    800089c8:	00079863          	bnez	a5,800089d8 <pop_on+0x48>
    800089cc:	100027f3          	csrr	a5,sstatus
    800089d0:	ffd7f793          	andi	a5,a5,-3
    800089d4:	10079073          	csrw	sstatus,a5
    800089d8:	00813083          	ld	ra,8(sp)
    800089dc:	00013403          	ld	s0,0(sp)
    800089e0:	01010113          	addi	sp,sp,16
    800089e4:	00008067          	ret
    800089e8:	00001517          	auipc	a0,0x1
    800089ec:	e9050513          	addi	a0,a0,-368 # 80009878 <digits+0x70>
    800089f0:	fffff097          	auipc	ra,0xfffff
    800089f4:	f2c080e7          	jalr	-212(ra) # 8000791c <panic>
    800089f8:	00001517          	auipc	a0,0x1
    800089fc:	e6050513          	addi	a0,a0,-416 # 80009858 <digits+0x50>
    80008a00:	fffff097          	auipc	ra,0xfffff
    80008a04:	f1c080e7          	jalr	-228(ra) # 8000791c <panic>

0000000080008a08 <__memset>:
    80008a08:	ff010113          	addi	sp,sp,-16
    80008a0c:	00813423          	sd	s0,8(sp)
    80008a10:	01010413          	addi	s0,sp,16
    80008a14:	1a060e63          	beqz	a2,80008bd0 <__memset+0x1c8>
    80008a18:	40a007b3          	neg	a5,a0
    80008a1c:	0077f793          	andi	a5,a5,7
    80008a20:	00778693          	addi	a3,a5,7
    80008a24:	00b00813          	li	a6,11
    80008a28:	0ff5f593          	andi	a1,a1,255
    80008a2c:	fff6071b          	addiw	a4,a2,-1
    80008a30:	1b06e663          	bltu	a3,a6,80008bdc <__memset+0x1d4>
    80008a34:	1cd76463          	bltu	a4,a3,80008bfc <__memset+0x1f4>
    80008a38:	1a078e63          	beqz	a5,80008bf4 <__memset+0x1ec>
    80008a3c:	00b50023          	sb	a1,0(a0)
    80008a40:	00100713          	li	a4,1
    80008a44:	1ae78463          	beq	a5,a4,80008bec <__memset+0x1e4>
    80008a48:	00b500a3          	sb	a1,1(a0)
    80008a4c:	00200713          	li	a4,2
    80008a50:	1ae78a63          	beq	a5,a4,80008c04 <__memset+0x1fc>
    80008a54:	00b50123          	sb	a1,2(a0)
    80008a58:	00300713          	li	a4,3
    80008a5c:	18e78463          	beq	a5,a4,80008be4 <__memset+0x1dc>
    80008a60:	00b501a3          	sb	a1,3(a0)
    80008a64:	00400713          	li	a4,4
    80008a68:	1ae78263          	beq	a5,a4,80008c0c <__memset+0x204>
    80008a6c:	00b50223          	sb	a1,4(a0)
    80008a70:	00500713          	li	a4,5
    80008a74:	1ae78063          	beq	a5,a4,80008c14 <__memset+0x20c>
    80008a78:	00b502a3          	sb	a1,5(a0)
    80008a7c:	00700713          	li	a4,7
    80008a80:	18e79e63          	bne	a5,a4,80008c1c <__memset+0x214>
    80008a84:	00b50323          	sb	a1,6(a0)
    80008a88:	00700e93          	li	t4,7
    80008a8c:	00859713          	slli	a4,a1,0x8
    80008a90:	00e5e733          	or	a4,a1,a4
    80008a94:	01059e13          	slli	t3,a1,0x10
    80008a98:	01c76e33          	or	t3,a4,t3
    80008a9c:	01859313          	slli	t1,a1,0x18
    80008aa0:	006e6333          	or	t1,t3,t1
    80008aa4:	02059893          	slli	a7,a1,0x20
    80008aa8:	40f60e3b          	subw	t3,a2,a5
    80008aac:	011368b3          	or	a7,t1,a7
    80008ab0:	02859813          	slli	a6,a1,0x28
    80008ab4:	0108e833          	or	a6,a7,a6
    80008ab8:	03059693          	slli	a3,a1,0x30
    80008abc:	003e589b          	srliw	a7,t3,0x3
    80008ac0:	00d866b3          	or	a3,a6,a3
    80008ac4:	03859713          	slli	a4,a1,0x38
    80008ac8:	00389813          	slli	a6,a7,0x3
    80008acc:	00f507b3          	add	a5,a0,a5
    80008ad0:	00e6e733          	or	a4,a3,a4
    80008ad4:	000e089b          	sext.w	a7,t3
    80008ad8:	00f806b3          	add	a3,a6,a5
    80008adc:	00e7b023          	sd	a4,0(a5)
    80008ae0:	00878793          	addi	a5,a5,8
    80008ae4:	fed79ce3          	bne	a5,a3,80008adc <__memset+0xd4>
    80008ae8:	ff8e7793          	andi	a5,t3,-8
    80008aec:	0007871b          	sext.w	a4,a5
    80008af0:	01d787bb          	addw	a5,a5,t4
    80008af4:	0ce88e63          	beq	a7,a4,80008bd0 <__memset+0x1c8>
    80008af8:	00f50733          	add	a4,a0,a5
    80008afc:	00b70023          	sb	a1,0(a4)
    80008b00:	0017871b          	addiw	a4,a5,1
    80008b04:	0cc77663          	bgeu	a4,a2,80008bd0 <__memset+0x1c8>
    80008b08:	00e50733          	add	a4,a0,a4
    80008b0c:	00b70023          	sb	a1,0(a4)
    80008b10:	0027871b          	addiw	a4,a5,2
    80008b14:	0ac77e63          	bgeu	a4,a2,80008bd0 <__memset+0x1c8>
    80008b18:	00e50733          	add	a4,a0,a4
    80008b1c:	00b70023          	sb	a1,0(a4)
    80008b20:	0037871b          	addiw	a4,a5,3
    80008b24:	0ac77663          	bgeu	a4,a2,80008bd0 <__memset+0x1c8>
    80008b28:	00e50733          	add	a4,a0,a4
    80008b2c:	00b70023          	sb	a1,0(a4)
    80008b30:	0047871b          	addiw	a4,a5,4
    80008b34:	08c77e63          	bgeu	a4,a2,80008bd0 <__memset+0x1c8>
    80008b38:	00e50733          	add	a4,a0,a4
    80008b3c:	00b70023          	sb	a1,0(a4)
    80008b40:	0057871b          	addiw	a4,a5,5
    80008b44:	08c77663          	bgeu	a4,a2,80008bd0 <__memset+0x1c8>
    80008b48:	00e50733          	add	a4,a0,a4
    80008b4c:	00b70023          	sb	a1,0(a4)
    80008b50:	0067871b          	addiw	a4,a5,6
    80008b54:	06c77e63          	bgeu	a4,a2,80008bd0 <__memset+0x1c8>
    80008b58:	00e50733          	add	a4,a0,a4
    80008b5c:	00b70023          	sb	a1,0(a4)
    80008b60:	0077871b          	addiw	a4,a5,7
    80008b64:	06c77663          	bgeu	a4,a2,80008bd0 <__memset+0x1c8>
    80008b68:	00e50733          	add	a4,a0,a4
    80008b6c:	00b70023          	sb	a1,0(a4)
    80008b70:	0087871b          	addiw	a4,a5,8
    80008b74:	04c77e63          	bgeu	a4,a2,80008bd0 <__memset+0x1c8>
    80008b78:	00e50733          	add	a4,a0,a4
    80008b7c:	00b70023          	sb	a1,0(a4)
    80008b80:	0097871b          	addiw	a4,a5,9
    80008b84:	04c77663          	bgeu	a4,a2,80008bd0 <__memset+0x1c8>
    80008b88:	00e50733          	add	a4,a0,a4
    80008b8c:	00b70023          	sb	a1,0(a4)
    80008b90:	00a7871b          	addiw	a4,a5,10
    80008b94:	02c77e63          	bgeu	a4,a2,80008bd0 <__memset+0x1c8>
    80008b98:	00e50733          	add	a4,a0,a4
    80008b9c:	00b70023          	sb	a1,0(a4)
    80008ba0:	00b7871b          	addiw	a4,a5,11
    80008ba4:	02c77663          	bgeu	a4,a2,80008bd0 <__memset+0x1c8>
    80008ba8:	00e50733          	add	a4,a0,a4
    80008bac:	00b70023          	sb	a1,0(a4)
    80008bb0:	00c7871b          	addiw	a4,a5,12
    80008bb4:	00c77e63          	bgeu	a4,a2,80008bd0 <__memset+0x1c8>
    80008bb8:	00e50733          	add	a4,a0,a4
    80008bbc:	00b70023          	sb	a1,0(a4)
    80008bc0:	00d7879b          	addiw	a5,a5,13
    80008bc4:	00c7f663          	bgeu	a5,a2,80008bd0 <__memset+0x1c8>
    80008bc8:	00f507b3          	add	a5,a0,a5
    80008bcc:	00b78023          	sb	a1,0(a5)
    80008bd0:	00813403          	ld	s0,8(sp)
    80008bd4:	01010113          	addi	sp,sp,16
    80008bd8:	00008067          	ret
    80008bdc:	00b00693          	li	a3,11
    80008be0:	e55ff06f          	j	80008a34 <__memset+0x2c>
    80008be4:	00300e93          	li	t4,3
    80008be8:	ea5ff06f          	j	80008a8c <__memset+0x84>
    80008bec:	00100e93          	li	t4,1
    80008bf0:	e9dff06f          	j	80008a8c <__memset+0x84>
    80008bf4:	00000e93          	li	t4,0
    80008bf8:	e95ff06f          	j	80008a8c <__memset+0x84>
    80008bfc:	00000793          	li	a5,0
    80008c00:	ef9ff06f          	j	80008af8 <__memset+0xf0>
    80008c04:	00200e93          	li	t4,2
    80008c08:	e85ff06f          	j	80008a8c <__memset+0x84>
    80008c0c:	00400e93          	li	t4,4
    80008c10:	e7dff06f          	j	80008a8c <__memset+0x84>
    80008c14:	00500e93          	li	t4,5
    80008c18:	e75ff06f          	j	80008a8c <__memset+0x84>
    80008c1c:	00600e93          	li	t4,6
    80008c20:	e6dff06f          	j	80008a8c <__memset+0x84>

0000000080008c24 <__memmove>:
    80008c24:	ff010113          	addi	sp,sp,-16
    80008c28:	00813423          	sd	s0,8(sp)
    80008c2c:	01010413          	addi	s0,sp,16
    80008c30:	0e060863          	beqz	a2,80008d20 <__memmove+0xfc>
    80008c34:	fff6069b          	addiw	a3,a2,-1
    80008c38:	0006881b          	sext.w	a6,a3
    80008c3c:	0ea5e863          	bltu	a1,a0,80008d2c <__memmove+0x108>
    80008c40:	00758713          	addi	a4,a1,7
    80008c44:	00a5e7b3          	or	a5,a1,a0
    80008c48:	40a70733          	sub	a4,a4,a0
    80008c4c:	0077f793          	andi	a5,a5,7
    80008c50:	00f73713          	sltiu	a4,a4,15
    80008c54:	00174713          	xori	a4,a4,1
    80008c58:	0017b793          	seqz	a5,a5
    80008c5c:	00e7f7b3          	and	a5,a5,a4
    80008c60:	10078863          	beqz	a5,80008d70 <__memmove+0x14c>
    80008c64:	00900793          	li	a5,9
    80008c68:	1107f463          	bgeu	a5,a6,80008d70 <__memmove+0x14c>
    80008c6c:	0036581b          	srliw	a6,a2,0x3
    80008c70:	fff8081b          	addiw	a6,a6,-1
    80008c74:	02081813          	slli	a6,a6,0x20
    80008c78:	01d85893          	srli	a7,a6,0x1d
    80008c7c:	00858813          	addi	a6,a1,8
    80008c80:	00058793          	mv	a5,a1
    80008c84:	00050713          	mv	a4,a0
    80008c88:	01088833          	add	a6,a7,a6
    80008c8c:	0007b883          	ld	a7,0(a5)
    80008c90:	00878793          	addi	a5,a5,8
    80008c94:	00870713          	addi	a4,a4,8
    80008c98:	ff173c23          	sd	a7,-8(a4)
    80008c9c:	ff0798e3          	bne	a5,a6,80008c8c <__memmove+0x68>
    80008ca0:	ff867713          	andi	a4,a2,-8
    80008ca4:	02071793          	slli	a5,a4,0x20
    80008ca8:	0207d793          	srli	a5,a5,0x20
    80008cac:	00f585b3          	add	a1,a1,a5
    80008cb0:	40e686bb          	subw	a3,a3,a4
    80008cb4:	00f507b3          	add	a5,a0,a5
    80008cb8:	06e60463          	beq	a2,a4,80008d20 <__memmove+0xfc>
    80008cbc:	0005c703          	lbu	a4,0(a1)
    80008cc0:	00e78023          	sb	a4,0(a5)
    80008cc4:	04068e63          	beqz	a3,80008d20 <__memmove+0xfc>
    80008cc8:	0015c603          	lbu	a2,1(a1)
    80008ccc:	00100713          	li	a4,1
    80008cd0:	00c780a3          	sb	a2,1(a5)
    80008cd4:	04e68663          	beq	a3,a4,80008d20 <__memmove+0xfc>
    80008cd8:	0025c603          	lbu	a2,2(a1)
    80008cdc:	00200713          	li	a4,2
    80008ce0:	00c78123          	sb	a2,2(a5)
    80008ce4:	02e68e63          	beq	a3,a4,80008d20 <__memmove+0xfc>
    80008ce8:	0035c603          	lbu	a2,3(a1)
    80008cec:	00300713          	li	a4,3
    80008cf0:	00c781a3          	sb	a2,3(a5)
    80008cf4:	02e68663          	beq	a3,a4,80008d20 <__memmove+0xfc>
    80008cf8:	0045c603          	lbu	a2,4(a1)
    80008cfc:	00400713          	li	a4,4
    80008d00:	00c78223          	sb	a2,4(a5)
    80008d04:	00e68e63          	beq	a3,a4,80008d20 <__memmove+0xfc>
    80008d08:	0055c603          	lbu	a2,5(a1)
    80008d0c:	00500713          	li	a4,5
    80008d10:	00c782a3          	sb	a2,5(a5)
    80008d14:	00e68663          	beq	a3,a4,80008d20 <__memmove+0xfc>
    80008d18:	0065c703          	lbu	a4,6(a1)
    80008d1c:	00e78323          	sb	a4,6(a5)
    80008d20:	00813403          	ld	s0,8(sp)
    80008d24:	01010113          	addi	sp,sp,16
    80008d28:	00008067          	ret
    80008d2c:	02061713          	slli	a4,a2,0x20
    80008d30:	02075713          	srli	a4,a4,0x20
    80008d34:	00e587b3          	add	a5,a1,a4
    80008d38:	f0f574e3          	bgeu	a0,a5,80008c40 <__memmove+0x1c>
    80008d3c:	02069613          	slli	a2,a3,0x20
    80008d40:	02065613          	srli	a2,a2,0x20
    80008d44:	fff64613          	not	a2,a2
    80008d48:	00e50733          	add	a4,a0,a4
    80008d4c:	00c78633          	add	a2,a5,a2
    80008d50:	fff7c683          	lbu	a3,-1(a5)
    80008d54:	fff78793          	addi	a5,a5,-1
    80008d58:	fff70713          	addi	a4,a4,-1
    80008d5c:	00d70023          	sb	a3,0(a4)
    80008d60:	fec798e3          	bne	a5,a2,80008d50 <__memmove+0x12c>
    80008d64:	00813403          	ld	s0,8(sp)
    80008d68:	01010113          	addi	sp,sp,16
    80008d6c:	00008067          	ret
    80008d70:	02069713          	slli	a4,a3,0x20
    80008d74:	02075713          	srli	a4,a4,0x20
    80008d78:	00170713          	addi	a4,a4,1
    80008d7c:	00e50733          	add	a4,a0,a4
    80008d80:	00050793          	mv	a5,a0
    80008d84:	0005c683          	lbu	a3,0(a1)
    80008d88:	00178793          	addi	a5,a5,1
    80008d8c:	00158593          	addi	a1,a1,1
    80008d90:	fed78fa3          	sb	a3,-1(a5)
    80008d94:	fee798e3          	bne	a5,a4,80008d84 <__memmove+0x160>
    80008d98:	f89ff06f          	j	80008d20 <__memmove+0xfc>
	...
