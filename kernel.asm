
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
    8000001c:	4fd060ef          	jal	ra,80006d18 <start>

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
    80001738:	394080e7          	jalr	916(ra) # 80005ac8 <_Z11printStringPKc>
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
    8000175c:	370080e7          	jalr	880(ra) # 80005ac8 <_Z11printStringPKc>
	printString("CONSOLE_STATUS = ");
    80001760:	00008517          	auipc	a0,0x8
    80001764:	8d050513          	addi	a0,a0,-1840 # 80009030 <CONSOLE_STATUS+0x20>
    80001768:	00004097          	auipc	ra,0x4
    8000176c:	360080e7          	jalr	864(ra) # 80005ac8 <_Z11printStringPKc>
	printInteger((uint64)sr);
    80001770:	0104b503          	ld	a0,16(s1)
    80001774:	00000097          	auipc	ra,0x0
    80001778:	224080e7          	jalr	548(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    8000177c:	00008517          	auipc	a0,0x8
    80001780:	dec50513          	addi	a0,a0,-532 # 80009568 <CONSOLE_STATUS+0x558>
    80001784:	00004097          	auipc	ra,0x4
    80001788:	344080e7          	jalr	836(ra) # 80005ac8 <_Z11printStringPKc>
	printString("*CONSOLE_RX = ");
    8000178c:	00008517          	auipc	a0,0x8
    80001790:	8bc50513          	addi	a0,a0,-1860 # 80009048 <CONSOLE_STATUS+0x38>
    80001794:	00004097          	auipc	ra,0x4
    80001798:	334080e7          	jalr	820(ra) # 80005ac8 <_Z11printStringPKc>
	printInteger(*dr);
    8000179c:	0084b783          	ld	a5,8(s1)
    800017a0:	0007c503          	lbu	a0,0(a5)
    800017a4:	00000097          	auipc	ra,0x0
    800017a8:	1f4080e7          	jalr	500(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    800017ac:	00008517          	auipc	a0,0x8
    800017b0:	dbc50513          	addi	a0,a0,-580 # 80009568 <CONSOLE_STATUS+0x558>
    800017b4:	00004097          	auipc	ra,0x4
    800017b8:	314080e7          	jalr	788(ra) # 80005ac8 <_Z11printStringPKc>
	printString("*CONSOLE_STATUS = ");
    800017bc:	00008517          	auipc	a0,0x8
    800017c0:	89c50513          	addi	a0,a0,-1892 # 80009058 <CONSOLE_STATUS+0x48>
    800017c4:	00004097          	auipc	ra,0x4
    800017c8:	304080e7          	jalr	772(ra) # 80005ac8 <_Z11printStringPKc>
	printInteger(*sr);
    800017cc:	0104b783          	ld	a5,16(s1)
    800017d0:	0007c503          	lbu	a0,0(a5)
    800017d4:	00000097          	auipc	ra,0x0
    800017d8:	1c4080e7          	jalr	452(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    800017dc:	00008517          	auipc	a0,0x8
    800017e0:	d8c50513          	addi	a0,a0,-628 # 80009568 <CONSOLE_STATUS+0x558>
    800017e4:	00004097          	auipc	ra,0x4
    800017e8:	2e4080e7          	jalr	740(ra) # 80005ac8 <_Z11printStringPKc>
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
    80001b9c:	614080e7          	jalr	1556(ra) # 800031ac <_ZN15MemoryAllocator19initMemoryAllocatorEv>


	//sem_open(&semA, 0);
	semA = new Semaphore(1);
    80001ba0:	01000513          	li	a0,16
    80001ba4:	00001097          	auipc	ra,0x1
    80001ba8:	afc080e7          	jalr	-1284(ra) # 800026a0 <_Znwm>
    80001bac:	00050793          	mv	a5,a0
    80001bb0:	00078493          	mv	s1,a5
    80001bb4:	00100593          	li	a1,1
    80001bb8:	00048513          	mv	a0,s1
    80001bbc:	00001097          	auipc	ra,0x1
    80001bc0:	dd8080e7          	jalr	-552(ra) # 80002994 <_ZN9SemaphoreC1Ej>
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
    80001cb0:	a44080e7          	jalr	-1468(ra) # 800026f0 <_ZdlPv>
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
    80001ef8:	fc8080e7          	jalr	-56(ra) # 80002ebc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
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
    80001f14:	158080e7          	jalr	344(ra) # 80003068 <_ZN15MemoryAllocator5kfreeEPv>
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
    80001f50:	d9c080e7          	jalr	-612(ra) # 80002ce8 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80001f54:	00050713          	mv	a4,a0
    80001f58:	ef843783          	ld	a5,-264(s0)
    80001f5c:	00e7b023          	sd	a4,0(a5)
				TCB::start(*handle);
    80001f60:	ef843783          	ld	a5,-264(s0)
    80001f64:	0007b783          	ld	a5,0(a5)
    80001f68:	00078513          	mv	a0,a5
    80001f6c:	00001097          	auipc	ra,0x1
    80001f70:	efc080e7          	jalr	-260(ra) # 80002e68 <_ZN3TCB5startEPS_>
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
    80001fb4:	e5c080e7          	jalr	-420(ra) # 80002e0c <_ZN3TCB13releaseJoinedEv>
				TCB::yield();
    80001fb8:	00001097          	auipc	ra,0x1
    80001fbc:	cc8080e7          	jalr	-824(ra) # 80002c80 <_ZN3TCB5yieldEv>
				break;
    80001fc0:	3500006f          	j	80002310 <interruptRoutine+0x564>
			case 0x13:
				//thread_dispatch
				TCB::yield();
    80001fc4:	00001097          	auipc	ra,0x1
    80001fc8:	cbc080e7          	jalr	-836(ra) # 80002c80 <_ZN3TCB5yieldEv>
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
    80001fe0:	de8080e7          	jalr	-536(ra) # 80002dc4 <_ZN3TCB10threadJoinEPS_>
				TCB::yield();
    80001fe4:	00001097          	auipc	ra,0x1
    80001fe8:	c9c080e7          	jalr	-868(ra) # 80002c80 <_ZN3TCB5yieldEv>
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
    8000200c:	268080e7          	jalr	616(ra) # 80003270 <_ZN4KSem7initSemEj>
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
    8000204c:	3f0080e7          	jalr	1008(ra) # 80003438 <_ZN4KSem8closeSemEPS_>
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
    80002068:	2a0080e7          	jalr	672(ra) # 80003304 <_ZN4KSem4waitEv>
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
    80002084:	33c080e7          	jalr	828(ra) # 800033bc <_ZN4KSem6signalEv>
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
    800020d8:	bac080e7          	jalr	-1108(ra) # 80002c80 <_ZN3TCB5yieldEv>
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
    8000213c:	bb0080e7          	jalr	-1104(ra) # 80002ce8 <_ZN3TCB12createThreadEPFvPvES0_Pm>
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
    800022ac:	00004097          	auipc	ra,0x4
    800022b0:	81c080e7          	jalr	-2020(ra) # 80005ac8 <_Z11printStringPKc>
				printInteger(opCode);
    800022b4:	f7843503          	ld	a0,-136(s0)
    800022b8:	fffff097          	auipc	ra,0xfffff
    800022bc:	6e0080e7          	jalr	1760(ra) # 80001998 <_Z12printIntegerm>
				printString("\nscause: ");
    800022c0:	00007517          	auipc	a0,0x7
    800022c4:	dc850513          	addi	a0,a0,-568 # 80009088 <CONSOLE_STATUS+0x78>
    800022c8:	00004097          	auipc	ra,0x4
    800022cc:	800080e7          	jalr	-2048(ra) # 80005ac8 <_Z11printStringPKc>
				printInteger(scause);
    800022d0:	fd843503          	ld	a0,-40(s0)
    800022d4:	fffff097          	auipc	ra,0xfffff
    800022d8:	6c4080e7          	jalr	1732(ra) # 80001998 <_Z12printIntegerm>
				printString("\nsepc: ");
    800022dc:	00007517          	auipc	a0,0x7
    800022e0:	dbc50513          	addi	a0,a0,-580 # 80009098 <CONSOLE_STATUS+0x88>
    800022e4:	00003097          	auipc	ra,0x3
    800022e8:	7e4080e7          	jalr	2020(ra) # 80005ac8 <_Z11printStringPKc>
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
    8000234c:	22c080e7          	jalr	556(ra) # 80007574 <plic_claim>
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
    800023a8:	208080e7          	jalr	520(ra) # 800075ac <plic_complete>
    800023ac:	0140006f          	j	800023c0 <interruptRoutine+0x614>
			printString("Neki drugi prekid\n");
    800023b0:	00007517          	auipc	a0,0x7
    800023b4:	cf050513          	addi	a0,a0,-784 # 800090a0 <CONSOLE_STATUS+0x90>
    800023b8:	00003097          	auipc	ra,0x3
    800023bc:	710080e7          	jalr	1808(ra) # 80005ac8 <_Z11printStringPKc>
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
    80002458:	00001097          	auipc	ra,0x1
    8000245c:	828080e7          	jalr	-2008(ra) # 80002c80 <_ZN3TCB5yieldEv>
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
    800024a0:	62c080e7          	jalr	1580(ra) # 80005ac8 <_Z11printStringPKc>
		printString("scause: ");
    800024a4:	00007517          	auipc	a0,0x7
    800024a8:	c3450513          	addi	a0,a0,-972 # 800090d8 <CONSOLE_STATUS+0xc8>
    800024ac:	00003097          	auipc	ra,0x3
    800024b0:	61c080e7          	jalr	1564(ra) # 80005ac8 <_Z11printStringPKc>
		printInteger(scause);
    800024b4:	fd843503          	ld	a0,-40(s0)
    800024b8:	fffff097          	auipc	ra,0xfffff
    800024bc:	4e0080e7          	jalr	1248(ra) # 80001998 <_Z12printIntegerm>
		printString("\nsepc: ");
    800024c0:	00007517          	auipc	a0,0x7
    800024c4:	bd850513          	addi	a0,a0,-1064 # 80009098 <CONSOLE_STATUS+0x88>
    800024c8:	00003097          	auipc	ra,0x3
    800024cc:	600080e7          	jalr	1536(ra) # 80005ac8 <_Z11printStringPKc>
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
    800025b0:	fe010113          	addi	sp,sp,-32
    800025b4:	00113c23          	sd	ra,24(sp)
    800025b8:	00813823          	sd	s0,16(sp)
    800025bc:	00913423          	sd	s1,8(sp)
    800025c0:	02010413          	addi	s0,sp,32
    800025c4:	00050493          	mv	s1,a0
    800025c8:	00009797          	auipc	a5,0x9
    800025cc:	2d078793          	addi	a5,a5,720 # 8000b898 <_ZTV6Thread+0x10>
    800025d0:	00f53023          	sd	a5,0(a0)
	thread_join(this->myHandle);
    800025d4:	00853503          	ld	a0,8(a0)
    800025d8:	fffff097          	auipc	ra,0xfffff
    800025dc:	e70080e7          	jalr	-400(ra) # 80001448 <_Z11thread_joinP3TCB>
	delete myHandle;
    800025e0:	0084b483          	ld	s1,8(s1)
    800025e4:	02048863          	beqz	s1,80002614 <_ZN6ThreadD1Ev+0x64>
			delete node;
		}
	}

	bool isEmpty() const {
		return front == nullptr;
    800025e8:	0504b503          	ld	a0,80(s1)
		while (!isEmpty()) {
    800025ec:	00050e63          	beqz	a0,80002608 <_ZN6ThreadD1Ev+0x58>
			front = front->next;
    800025f0:	00853783          	ld	a5,8(a0)
    800025f4:	04f4b823          	sd	a5,80(s1)
			delete node;
    800025f8:	fe0508e3          	beqz	a0,800025e8 <_ZN6ThreadD1Ev+0x38>
			mem_free(ptr);
    800025fc:	fffff097          	auipc	ra,0xfffff
    80002600:	d54080e7          	jalr	-684(ra) # 80001350 <_Z8mem_freePv>
		}
    80002604:	fe5ff06f          	j	800025e8 <_ZN6ThreadD1Ev+0x38>
    80002608:	00048513          	mv	a0,s1
    8000260c:	00000097          	auipc	ra,0x0
    80002610:	790080e7          	jalr	1936(ra) # 80002d9c <_ZN3TCBdlEPv>
}
    80002614:	01813083          	ld	ra,24(sp)
    80002618:	01013403          	ld	s0,16(sp)
    8000261c:	00813483          	ld	s1,8(sp)
    80002620:	02010113          	addi	sp,sp,32
    80002624:	00008067          	ret

0000000080002628 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
	sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    80002628:	fe010113          	addi	sp,sp,-32
    8000262c:	00113c23          	sd	ra,24(sp)
    80002630:	00813823          	sd	s0,16(sp)
    80002634:	00913423          	sd	s1,8(sp)
    80002638:	02010413          	addi	s0,sp,32
    8000263c:	00050493          	mv	s1,a0
    80002640:	00009797          	auipc	a5,0x9
    80002644:	28078793          	addi	a5,a5,640 # 8000b8c0 <_ZTV9Semaphore+0x10>
    80002648:	00f53023          	sd	a5,0(a0)
	sem_close(myHandle);
    8000264c:	00853503          	ld	a0,8(a0)
    80002650:	fffff097          	auipc	ra,0xfffff
    80002654:	e88080e7          	jalr	-376(ra) # 800014d8 <_Z9sem_closeP4KSem>
	delete myHandle;
    80002658:	0084b483          	ld	s1,8(s1)
    8000265c:	02048863          	beqz	s1,8000268c <_ZN9SemaphoreD1Ev+0x64>
		return front == nullptr;
    80002660:	0084b503          	ld	a0,8(s1)
		while (!isEmpty()) {
    80002664:	00050e63          	beqz	a0,80002680 <_ZN9SemaphoreD1Ev+0x58>
			front = front->next;
    80002668:	00853783          	ld	a5,8(a0)
    8000266c:	00f4b423          	sd	a5,8(s1)
			delete node;
    80002670:	fe0508e3          	beqz	a0,80002660 <_ZN9SemaphoreD1Ev+0x38>
			mem_free(ptr);
    80002674:	fffff097          	auipc	ra,0xfffff
    80002678:	cdc080e7          	jalr	-804(ra) # 80001350 <_Z8mem_freePv>
		}
    8000267c:	fe5ff06f          	j	80002660 <_ZN9SemaphoreD1Ev+0x38>
    80002680:	00048513          	mv	a0,s1
    80002684:	00001097          	auipc	ra,0x1
    80002688:	bc4080e7          	jalr	-1084(ra) # 80003248 <_ZN4KSemdlEPv>
}
    8000268c:	01813083          	ld	ra,24(sp)
    80002690:	01013403          	ld	s0,16(sp)
    80002694:	00813483          	ld	s1,8(sp)
    80002698:	02010113          	addi	sp,sp,32
    8000269c:	00008067          	ret

00000000800026a0 <_Znwm>:
void* operator new(size_t size) {
    800026a0:	ff010113          	addi	sp,sp,-16
    800026a4:	00113423          	sd	ra,8(sp)
    800026a8:	00813023          	sd	s0,0(sp)
    800026ac:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    800026b0:	fffff097          	auipc	ra,0xfffff
    800026b4:	c60080e7          	jalr	-928(ra) # 80001310 <_Z9mem_allocm>
}
    800026b8:	00813083          	ld	ra,8(sp)
    800026bc:	00013403          	ld	s0,0(sp)
    800026c0:	01010113          	addi	sp,sp,16
    800026c4:	00008067          	ret

00000000800026c8 <_Znam>:
void* operator new[](size_t size) {
    800026c8:	ff010113          	addi	sp,sp,-16
    800026cc:	00113423          	sd	ra,8(sp)
    800026d0:	00813023          	sd	s0,0(sp)
    800026d4:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    800026d8:	fffff097          	auipc	ra,0xfffff
    800026dc:	c38080e7          	jalr	-968(ra) # 80001310 <_Z9mem_allocm>
}
    800026e0:	00813083          	ld	ra,8(sp)
    800026e4:	00013403          	ld	s0,0(sp)
    800026e8:	01010113          	addi	sp,sp,16
    800026ec:	00008067          	ret

00000000800026f0 <_ZdlPv>:
noexcept {
    800026f0:	ff010113          	addi	sp,sp,-16
    800026f4:	00113423          	sd	ra,8(sp)
    800026f8:	00813023          	sd	s0,0(sp)
    800026fc:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80002700:	fffff097          	auipc	ra,0xfffff
    80002704:	c50080e7          	jalr	-944(ra) # 80001350 <_Z8mem_freePv>
}
    80002708:	00813083          	ld	ra,8(sp)
    8000270c:	00013403          	ld	s0,0(sp)
    80002710:	01010113          	addi	sp,sp,16
    80002714:	00008067          	ret

0000000080002718 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80002718:	fe010113          	addi	sp,sp,-32
    8000271c:	00113c23          	sd	ra,24(sp)
    80002720:	00813823          	sd	s0,16(sp)
    80002724:	00913423          	sd	s1,8(sp)
    80002728:	02010413          	addi	s0,sp,32
    8000272c:	00050493          	mv	s1,a0
}
    80002730:	00000097          	auipc	ra,0x0
    80002734:	e80080e7          	jalr	-384(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80002738:	00048513          	mv	a0,s1
    8000273c:	00000097          	auipc	ra,0x0
    80002740:	fb4080e7          	jalr	-76(ra) # 800026f0 <_ZdlPv>
    80002744:	01813083          	ld	ra,24(sp)
    80002748:	01013403          	ld	s0,16(sp)
    8000274c:	00813483          	ld	s1,8(sp)
    80002750:	02010113          	addi	sp,sp,32
    80002754:	00008067          	ret

0000000080002758 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80002758:	fe010113          	addi	sp,sp,-32
    8000275c:	00113c23          	sd	ra,24(sp)
    80002760:	00813823          	sd	s0,16(sp)
    80002764:	00913423          	sd	s1,8(sp)
    80002768:	02010413          	addi	s0,sp,32
    8000276c:	00050493          	mv	s1,a0
}
    80002770:	00000097          	auipc	ra,0x0
    80002774:	eb8080e7          	jalr	-328(ra) # 80002628 <_ZN9SemaphoreD1Ev>
    80002778:	00048513          	mv	a0,s1
    8000277c:	00000097          	auipc	ra,0x0
    80002780:	f74080e7          	jalr	-140(ra) # 800026f0 <_ZdlPv>
    80002784:	01813083          	ld	ra,24(sp)
    80002788:	01013403          	ld	s0,16(sp)
    8000278c:	00813483          	ld	s1,8(sp)
    80002790:	02010113          	addi	sp,sp,32
    80002794:	00008067          	ret

0000000080002798 <_ZdaPv>:
noexcept {
    80002798:	ff010113          	addi	sp,sp,-16
    8000279c:	00113423          	sd	ra,8(sp)
    800027a0:	00813023          	sd	s0,0(sp)
    800027a4:	01010413          	addi	s0,sp,16
mem_free(ptr);
    800027a8:	fffff097          	auipc	ra,0xfffff
    800027ac:	ba8080e7          	jalr	-1112(ra) # 80001350 <_Z8mem_freePv>
}
    800027b0:	00813083          	ld	ra,8(sp)
    800027b4:	00013403          	ld	s0,0(sp)
    800027b8:	01010113          	addi	sp,sp,16
    800027bc:	00008067          	ret

00000000800027c0 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (* body)(void*), void* arg) {
    800027c0:	fd010113          	addi	sp,sp,-48
    800027c4:	02113423          	sd	ra,40(sp)
    800027c8:	02813023          	sd	s0,32(sp)
    800027cc:	00913c23          	sd	s1,24(sp)
    800027d0:	01213823          	sd	s2,16(sp)
    800027d4:	01313423          	sd	s3,8(sp)
    800027d8:	03010413          	addi	s0,sp,48
    800027dc:	00050493          	mv	s1,a0
    800027e0:	00058913          	mv	s2,a1
    800027e4:	00060993          	mv	s3,a2
    800027e8:	00009797          	auipc	a5,0x9
    800027ec:	0b078793          	addi	a5,a5,176 # 8000b898 <_ZTV6Thread+0x10>
    800027f0:	00f53023          	sd	a5,0(a0)
	this->body = body;
    800027f4:	00b53823          	sd	a1,16(a0)
	this->arg = arg;
    800027f8:	00c53c23          	sd	a2,24(a0)
	if (body != nullptr) {
    800027fc:	04058663          	beqz	a1,80002848 <_ZN6ThreadC1EPFvPvES0_+0x88>
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    80002800:	00001537          	lui	a0,0x1
    80002804:	fffff097          	auipc	ra,0xfffff
    80002808:	b0c080e7          	jalr	-1268(ra) # 80001310 <_Z9mem_allocm>
    8000280c:	00050313          	mv	t1,a0
	__asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002810:	00030713          	mv	a4,t1
	__asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002814:	00098693          	mv	a3,s3
			body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002818:	00090613          	mv	a2,s2
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000281c:	00848493          	addi	s1,s1,8
    80002820:	00048593          	mv	a1,s1
	__asm__ volatile("li a0, 0x80");
    80002824:	08000513          	li	a0,128
	__asm__ volatile("ecall");
    80002828:	00000073          	ecall
}
    8000282c:	02813083          	ld	ra,40(sp)
    80002830:	02013403          	ld	s0,32(sp)
    80002834:	01813483          	ld	s1,24(sp)
    80002838:	01013903          	ld	s2,16(sp)
    8000283c:	00813983          	ld	s3,8(sp)
    80002840:	03010113          	addi	sp,sp,48
    80002844:	00008067          	ret
	uint64* stack = nullptr;
    80002848:	00000313          	li	t1,0
    8000284c:	fc5ff06f          	j	80002810 <_ZN6ThreadC1EPFvPvES0_+0x50>

0000000080002850 <_ZN6Thread5startEv>:
int Thread::start() {
    80002850:	ff010113          	addi	sp,sp,-16
    80002854:	00813423          	sd	s0,8(sp)
    80002858:	01010413          	addi	s0,sp,16
	if (myHandle == nullptr) return -1;
    8000285c:	00853303          	ld	t1,8(a0) # 1008 <_entry-0x7fffeff8>
    80002860:	02030063          	beqz	t1,80002880 <_ZN6Thread5startEv+0x30>
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002864:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x81");
    80002868:	08100513          	li	a0,129
	__asm__ volatile("ecall");
    8000286c:	00000073          	ecall
	return 0;
    80002870:	00000513          	li	a0,0
}
    80002874:	00813403          	ld	s0,8(sp)
    80002878:	01010113          	addi	sp,sp,16
    8000287c:	00008067          	ret
	if (myHandle == nullptr) return -1;
    80002880:	fff00513          	li	a0,-1
    80002884:	ff1ff06f          	j	80002874 <_ZN6Thread5startEv+0x24>

0000000080002888 <_ZN6Thread4joinEv>:
void Thread::join() {
    80002888:	ff010113          	addi	sp,sp,-16
    8000288c:	00113423          	sd	ra,8(sp)
    80002890:	00813023          	sd	s0,0(sp)
    80002894:	01010413          	addi	s0,sp,16
	thread_join(myHandle);
    80002898:	00853503          	ld	a0,8(a0)
    8000289c:	fffff097          	auipc	ra,0xfffff
    800028a0:	bac080e7          	jalr	-1108(ra) # 80001448 <_Z11thread_joinP3TCB>
}
    800028a4:	00813083          	ld	ra,8(sp)
    800028a8:	00013403          	ld	s0,0(sp)
    800028ac:	01010113          	addi	sp,sp,16
    800028b0:	00008067          	ret

00000000800028b4 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    800028b4:	ff010113          	addi	sp,sp,-16
    800028b8:	00113423          	sd	ra,8(sp)
    800028bc:	00813023          	sd	s0,0(sp)
    800028c0:	01010413          	addi	s0,sp,16
	thread_dispatch();
    800028c4:	fffff097          	auipc	ra,0xfffff
    800028c8:	b64080e7          	jalr	-1180(ra) # 80001428 <_Z15thread_dispatchv>
}
    800028cc:	00813083          	ld	ra,8(sp)
    800028d0:	00013403          	ld	s0,0(sp)
    800028d4:	01010113          	addi	sp,sp,16
    800028d8:	00008067          	ret

00000000800028dc <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t t) {
    800028dc:	ff010113          	addi	sp,sp,-16
    800028e0:	00113423          	sd	ra,8(sp)
    800028e4:	00813023          	sd	s0,0(sp)
    800028e8:	01010413          	addi	s0,sp,16
    800028ec:	00050593          	mv	a1,a0
	Scheduler::putToSleep(TCB::running, t);
    800028f0:	00009797          	auipc	a5,0x9
    800028f4:	1e07b783          	ld	a5,480(a5) # 8000bad0 <_GLOBAL_OFFSET_TABLE_+0x58>
    800028f8:	0007b503          	ld	a0,0(a5)
    800028fc:	fffff097          	auipc	ra,0xfffff
    80002900:	148080e7          	jalr	328(ra) # 80001a44 <_ZN9Scheduler10putToSleepEP3TCBm>
}
    80002904:	00000513          	li	a0,0
    80002908:	00813083          	ld	ra,8(sp)
    8000290c:	00013403          	ld	s0,0(sp)
    80002910:	01010113          	addi	sp,sp,16
    80002914:	00008067          	ret

0000000080002918 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80002918:	fe010113          	addi	sp,sp,-32
    8000291c:	00113c23          	sd	ra,24(sp)
    80002920:	00813823          	sd	s0,16(sp)
    80002924:	00913423          	sd	s1,8(sp)
    80002928:	02010413          	addi	s0,sp,32
    8000292c:	00050493          	mv	s1,a0
    80002930:	00009797          	auipc	a5,0x9
    80002934:	f6878793          	addi	a5,a5,-152 # 8000b898 <_ZTV6Thread+0x10>
    80002938:	00f53023          	sd	a5,0(a0)
	this->body = wrapper;
    8000293c:	00000797          	auipc	a5,0x0
    80002940:	c4078793          	addi	a5,a5,-960 # 8000257c <_ZN6Thread7wrapperEPv>
    80002944:	00f53823          	sd	a5,16(a0)
	this->arg = this;
    80002948:	00a53c23          	sd	a0,24(a0)
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    8000294c:	00001537          	lui	a0,0x1
    80002950:	fffff097          	auipc	ra,0xfffff
    80002954:	9c0080e7          	jalr	-1600(ra) # 80001310 <_Z9mem_allocm>
    80002958:	00050313          	mv	t1,a0
	__asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000295c:	00030713          	mv	a4,t1
	__asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002960:	0184b303          	ld	t1,24(s1)
    80002964:	00030693          	mv	a3,t1
			body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002968:	0104b303          	ld	t1,16(s1)
    8000296c:	00030613          	mv	a2,t1
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002970:	00848493          	addi	s1,s1,8
    80002974:	00048593          	mv	a1,s1
	__asm__ volatile("li a0, 0x80");
    80002978:	08000513          	li	a0,128
	__asm__ volatile("ecall");
    8000297c:	00000073          	ecall
}
    80002980:	01813083          	ld	ra,24(sp)
    80002984:	01013403          	ld	s0,16(sp)
    80002988:	00813483          	ld	s1,8(sp)
    8000298c:	02010113          	addi	sp,sp,32
    80002990:	00008067          	ret

0000000080002994 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80002994:	ff010113          	addi	sp,sp,-16
    80002998:	00113423          	sd	ra,8(sp)
    8000299c:	00813023          	sd	s0,0(sp)
    800029a0:	01010413          	addi	s0,sp,16
    800029a4:	00009797          	auipc	a5,0x9
    800029a8:	f1c78793          	addi	a5,a5,-228 # 8000b8c0 <_ZTV9Semaphore+0x10>
    800029ac:	00f53023          	sd	a5,0(a0) # 1000 <_entry-0x7ffff000>
	sem_open(&myHandle, init);
    800029b0:	00850513          	addi	a0,a0,8
    800029b4:	fffff097          	auipc	ra,0xfffff
    800029b8:	aec080e7          	jalr	-1300(ra) # 800014a0 <_Z8sem_openPP4KSemj>
}
    800029bc:	00813083          	ld	ra,8(sp)
    800029c0:	00013403          	ld	s0,0(sp)
    800029c4:	01010113          	addi	sp,sp,16
    800029c8:	00008067          	ret

00000000800029cc <_ZN9Semaphore4waitEv>:

int Semaphore::wait() {
    800029cc:	ff010113          	addi	sp,sp,-16
    800029d0:	00113423          	sd	ra,8(sp)
    800029d4:	00813023          	sd	s0,0(sp)
    800029d8:	01010413          	addi	s0,sp,16
	return sem_wait(myHandle);
    800029dc:	00853503          	ld	a0,8(a0)
    800029e0:	fffff097          	auipc	ra,0xfffff
    800029e4:	b28080e7          	jalr	-1240(ra) # 80001508 <_Z8sem_waitP4KSem>
}
    800029e8:	00813083          	ld	ra,8(sp)
    800029ec:	00013403          	ld	s0,0(sp)
    800029f0:	01010113          	addi	sp,sp,16
    800029f4:	00008067          	ret

00000000800029f8 <_ZN9Semaphore6signalEv>:

int Semaphore::signal() {
    800029f8:	ff010113          	addi	sp,sp,-16
    800029fc:	00113423          	sd	ra,8(sp)
    80002a00:	00813023          	sd	s0,0(sp)
    80002a04:	01010413          	addi	s0,sp,16
	return sem_signal(myHandle);
    80002a08:	00853503          	ld	a0,8(a0)
    80002a0c:	fffff097          	auipc	ra,0xfffff
    80002a10:	b2c080e7          	jalr	-1236(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    80002a14:	00813083          	ld	ra,8(sp)
    80002a18:	00013403          	ld	s0,0(sp)
    80002a1c:	01010113          	addi	sp,sp,16
    80002a20:	00008067          	ret

0000000080002a24 <_ZN14PeriodicThread9terminateEv>:

void PeriodicThread::terminate() {
    80002a24:	ff010113          	addi	sp,sp,-16
    80002a28:	00813423          	sd	s0,8(sp)
    80002a2c:	01010413          	addi	s0,sp,16

}
    80002a30:	00813403          	ld	s0,8(sp)
    80002a34:	01010113          	addi	sp,sp,16
    80002a38:	00008067          	ret

0000000080002a3c <_ZN14PeriodicThreadC1Em>:

PeriodicThread::PeriodicThread(time_t period) {
    80002a3c:	fe010113          	addi	sp,sp,-32
    80002a40:	00113c23          	sd	ra,24(sp)
    80002a44:	00813823          	sd	s0,16(sp)
    80002a48:	00913423          	sd	s1,8(sp)
    80002a4c:	02010413          	addi	s0,sp,32
    80002a50:	00050493          	mv	s1,a0
    80002a54:	00000097          	auipc	ra,0x0
    80002a58:	ec4080e7          	jalr	-316(ra) # 80002918 <_ZN6ThreadC1Ev>
    80002a5c:	00009797          	auipc	a5,0x9
    80002a60:	e0c78793          	addi	a5,a5,-500 # 8000b868 <_ZTV14PeriodicThread+0x10>
    80002a64:	00f4b023          	sd	a5,0(s1)

}
    80002a68:	01813083          	ld	ra,24(sp)
    80002a6c:	01013403          	ld	s0,16(sp)
    80002a70:	00813483          	ld	s1,8(sp)
    80002a74:	02010113          	addi	sp,sp,32
    80002a78:	00008067          	ret

0000000080002a7c <_ZN7Console4getcEv>:

char Console::getc() {
    80002a7c:	ff010113          	addi	sp,sp,-16
    80002a80:	00113423          	sd	ra,8(sp)
    80002a84:	00813023          	sd	s0,0(sp)
    80002a88:	01010413          	addi	s0,sp,16
	return ::getc();
    80002a8c:	fffff097          	auipc	ra,0xfffff
    80002a90:	adc080e7          	jalr	-1316(ra) # 80001568 <_Z4getcv>
}
    80002a94:	00813083          	ld	ra,8(sp)
    80002a98:	00013403          	ld	s0,0(sp)
    80002a9c:	01010113          	addi	sp,sp,16
    80002aa0:	00008067          	ret

0000000080002aa4 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80002aa4:	ff010113          	addi	sp,sp,-16
    80002aa8:	00113423          	sd	ra,8(sp)
    80002aac:	00813023          	sd	s0,0(sp)
    80002ab0:	01010413          	addi	s0,sp,16
	::putc(c);
    80002ab4:	fffff097          	auipc	ra,0xfffff
    80002ab8:	adc080e7          	jalr	-1316(ra) # 80001590 <_Z4putcc>
}
    80002abc:	00813083          	ld	ra,8(sp)
    80002ac0:	00013403          	ld	s0,0(sp)
    80002ac4:	01010113          	addi	sp,sp,16
    80002ac8:	00008067          	ret

0000000080002acc <_ZN6Thread3runEv>:
	static int sleep(time_t);

protected:
	Thread();

	virtual void run() {}
    80002acc:	ff010113          	addi	sp,sp,-16
    80002ad0:	00813423          	sd	s0,8(sp)
    80002ad4:	01010413          	addi	s0,sp,16
    80002ad8:	00813403          	ld	s0,8(sp)
    80002adc:	01010113          	addi	sp,sp,16
    80002ae0:	00008067          	ret

0000000080002ae4 <_ZN14PeriodicThread18periodicActivationEv>:
	void terminate();

protected:
	PeriodicThread(time_t period);

	virtual void periodicActivation() {}
    80002ae4:	ff010113          	addi	sp,sp,-16
    80002ae8:	00813423          	sd	s0,8(sp)
    80002aec:	01010413          	addi	s0,sp,16
    80002af0:	00813403          	ld	s0,8(sp)
    80002af4:	01010113          	addi	sp,sp,16
    80002af8:	00008067          	ret

0000000080002afc <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80002afc:	ff010113          	addi	sp,sp,-16
    80002b00:	00113423          	sd	ra,8(sp)
    80002b04:	00813023          	sd	s0,0(sp)
    80002b08:	01010413          	addi	s0,sp,16
    80002b0c:	00009797          	auipc	a5,0x9
    80002b10:	d5c78793          	addi	a5,a5,-676 # 8000b868 <_ZTV14PeriodicThread+0x10>
    80002b14:	00f53023          	sd	a5,0(a0)
    80002b18:	00000097          	auipc	ra,0x0
    80002b1c:	a98080e7          	jalr	-1384(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80002b20:	00813083          	ld	ra,8(sp)
    80002b24:	00013403          	ld	s0,0(sp)
    80002b28:	01010113          	addi	sp,sp,16
    80002b2c:	00008067          	ret

0000000080002b30 <_ZN14PeriodicThreadD0Ev>:
    80002b30:	fe010113          	addi	sp,sp,-32
    80002b34:	00113c23          	sd	ra,24(sp)
    80002b38:	00813823          	sd	s0,16(sp)
    80002b3c:	00913423          	sd	s1,8(sp)
    80002b40:	02010413          	addi	s0,sp,32
    80002b44:	00050493          	mv	s1,a0
    80002b48:	00009797          	auipc	a5,0x9
    80002b4c:	d2078793          	addi	a5,a5,-736 # 8000b868 <_ZTV14PeriodicThread+0x10>
    80002b50:	00f53023          	sd	a5,0(a0)
    80002b54:	00000097          	auipc	ra,0x0
    80002b58:	a5c080e7          	jalr	-1444(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80002b5c:	00048513          	mv	a0,s1
    80002b60:	00000097          	auipc	ra,0x0
    80002b64:	b90080e7          	jalr	-1136(ra) # 800026f0 <_ZdlPv>
    80002b68:	01813083          	ld	ra,24(sp)
    80002b6c:	01013403          	ld	s0,16(sp)
    80002b70:	00813483          	ld	s1,8(sp)
    80002b74:	02010113          	addi	sp,sp,32
    80002b78:	00008067          	ret

0000000080002b7c <_ZN3TCB7wrapperEv>:
	Riscv::pushRegisters();
	TCB::dispatch();
	Riscv::popRegisters();
}

void TCB::wrapper() {
    80002b7c:	ff010113          	addi	sp,sp,-16
    80002b80:	00113423          	sd	ra,8(sp)
    80002b84:	00813023          	sd	s0,0(sp)
    80002b88:	01010413          	addi	s0,sp,16
	//pocetak wrappera se izvrsava u supervisor modu,
	//jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch/yield)
	Riscv::popSppSpie();
    80002b8c:	00000097          	auipc	ra,0x0
    80002b90:	310080e7          	jalr	784(ra) # 80002e9c <_ZN5Riscv10popSppSpieEv>
	//na dalje se izvrsavamo u user modu
	running->threadFunction(running->args);
    80002b94:	00009797          	auipc	a5,0x9
    80002b98:	05c7b783          	ld	a5,92(a5) # 8000bbf0 <_ZN3TCB7runningE>
    80002b9c:	0107b703          	ld	a4,16(a5)
    80002ba0:	0207b503          	ld	a0,32(a5)
    80002ba4:	000700e7          	jalr	a4
	//running->finished = true;
	//i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
	thread_exit();
    80002ba8:	fffff097          	auipc	ra,0xfffff
    80002bac:	858080e7          	jalr	-1960(ra) # 80001400 <_Z11thread_exitv>
}
    80002bb0:	00813083          	ld	ra,8(sp)
    80002bb4:	00013403          	ld	s0,0(sp)
    80002bb8:	01010113          	addi	sp,sp,16
    80002bbc:	00008067          	ret

0000000080002bc0 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80002bc0:	fe010113          	addi	sp,sp,-32
    80002bc4:	00113c23          	sd	ra,24(sp)
    80002bc8:	00813823          	sd	s0,16(sp)
    80002bcc:	00913423          	sd	s1,8(sp)
    80002bd0:	02010413          	addi	s0,sp,32
	TCB* old = TCB::running;
    80002bd4:	00009497          	auipc	s1,0x9
    80002bd8:	01c4b483          	ld	s1,28(s1) # 8000bbf0 <_ZN3TCB7runningE>
	if (!old->finished && !old->blocked && old->timeToSleep == 0 && !old->needToJoin) {
    80002bdc:	0304c783          	lbu	a5,48(s1)
    80002be0:	00079e63          	bnez	a5,80002bfc <_ZN3TCB8dispatchEv+0x3c>
    80002be4:	0314c783          	lbu	a5,49(s1)
    80002be8:	00079a63          	bnez	a5,80002bfc <_ZN3TCB8dispatchEv+0x3c>
    80002bec:	0404b783          	ld	a5,64(s1)
    80002bf0:	00079663          	bnez	a5,80002bfc <_ZN3TCB8dispatchEv+0x3c>
    80002bf4:	0324c783          	lbu	a5,50(s1)
    80002bf8:	04078663          	beqz	a5,80002c44 <_ZN3TCB8dispatchEv+0x84>
	TCB::running = Scheduler::get();
    80002bfc:	fffff097          	auipc	ra,0xfffff
    80002c00:	e08080e7          	jalr	-504(ra) # 80001a04 <_ZN9Scheduler3getEv>
    80002c04:	00050593          	mv	a1,a0
    80002c08:	00009797          	auipc	a5,0x9
    80002c0c:	fe878793          	addi	a5,a5,-24 # 8000bbf0 <_ZN3TCB7runningE>
    80002c10:	00a7b023          	sd	a0,0(a5)
	TCB::runningTimeSlice = 0;
    80002c14:	0007b423          	sd	zero,8(a5)
	if (TCB::running->threadFunction == nullptr || TCB::running->threadFunction == kernelConsumerFunction ||
    80002c18:	01053783          	ld	a5,16(a0)
    80002c1c:	02078c63          	beqz	a5,80002c54 <_ZN3TCB8dispatchEv+0x94>
    80002c20:	00009717          	auipc	a4,0x9
    80002c24:	e8873703          	ld	a4,-376(a4) # 8000baa8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002c28:	02e78663          	beq	a5,a4,80002c54 <_ZN3TCB8dispatchEv+0x94>
    80002c2c:	00009717          	auipc	a4,0x9
    80002c30:	ebc73703          	ld	a4,-324(a4) # 8000bae8 <_GLOBAL_OFFSET_TABLE_+0x70>
    80002c34:	02e78063          	beq	a5,a4,80002c54 <_ZN3TCB8dispatchEv+0x94>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002c38:	10000793          	li	a5,256
    80002c3c:	1007b073          	csrc	sstatus,a5
}
    80002c40:	01c0006f          	j	80002c5c <_ZN3TCB8dispatchEv+0x9c>
		Scheduler::put(old);
    80002c44:	00048513          	mv	a0,s1
    80002c48:	fffff097          	auipc	ra,0xfffff
    80002c4c:	d78080e7          	jalr	-648(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
    80002c50:	fadff06f          	j	80002bfc <_ZN3TCB8dispatchEv+0x3c>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80002c54:	10000793          	li	a5,256
    80002c58:	1007a073          	csrs	sstatus,a5
	if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    80002c5c:	00b48863          	beq	s1,a1,80002c6c <_ZN3TCB8dispatchEv+0xac>
    80002c60:	00048513          	mv	a0,s1
    80002c64:	ffffe097          	auipc	ra,0xffffe
    80002c68:	5ac080e7          	jalr	1452(ra) # 80001210 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80002c6c:	01813083          	ld	ra,24(sp)
    80002c70:	01013403          	ld	s0,16(sp)
    80002c74:	00813483          	ld	s1,8(sp)
    80002c78:	02010113          	addi	sp,sp,32
    80002c7c:	00008067          	ret

0000000080002c80 <_ZN3TCB5yieldEv>:
void TCB::yield() {
    80002c80:	ff010113          	addi	sp,sp,-16
    80002c84:	00113423          	sd	ra,8(sp)
    80002c88:	00813023          	sd	s0,0(sp)
    80002c8c:	01010413          	addi	s0,sp,16
	Riscv::pushRegisters();
    80002c90:	ffffe097          	auipc	ra,0xffffe
    80002c94:	370080e7          	jalr	880(ra) # 80001000 <_ZN5Riscv13pushRegistersEv>
	TCB::dispatch();
    80002c98:	00000097          	auipc	ra,0x0
    80002c9c:	f28080e7          	jalr	-216(ra) # 80002bc0 <_ZN3TCB8dispatchEv>
	Riscv::popRegisters();
    80002ca0:	ffffe097          	auipc	ra,0xffffe
    80002ca4:	3dc080e7          	jalr	988(ra) # 8000107c <_ZN5Riscv12popRegistersEv>
}
    80002ca8:	00813083          	ld	ra,8(sp)
    80002cac:	00013403          	ld	s0,0(sp)
    80002cb0:	01010113          	addi	sp,sp,16
    80002cb4:	00008067          	ret

0000000080002cb8 <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    80002cb8:	ff010113          	addi	sp,sp,-16
    80002cbc:	00113423          	sd	ra,8(sp)
    80002cc0:	00813023          	sd	s0,0(sp)
    80002cc4:	01010413          	addi	s0,sp,16
	return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::THREAD);
    80002cc8:	00200593          	li	a1,2
    80002ccc:	02050513          	addi	a0,a0,32
    80002cd0:	00000097          	auipc	ra,0x0
    80002cd4:	1ec080e7          	jalr	492(ra) # 80002ebc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
}
    80002cd8:	00813083          	ld	ra,8(sp)
    80002cdc:	00013403          	ld	s0,0(sp)
    80002ce0:	01010113          	addi	sp,sp,16
    80002ce4:	00008067          	ret

0000000080002ce8 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    80002ce8:	fd010113          	addi	sp,sp,-48
    80002cec:	02113423          	sd	ra,40(sp)
    80002cf0:	02813023          	sd	s0,32(sp)
    80002cf4:	00913c23          	sd	s1,24(sp)
    80002cf8:	01213823          	sd	s2,16(sp)
    80002cfc:	01313423          	sd	s3,8(sp)
    80002d00:	03010413          	addi	s0,sp,48
    80002d04:	00050913          	mv	s2,a0
    80002d08:	00058993          	mv	s3,a1
    80002d0c:	00060493          	mv	s1,a2
	TCB* newThread = new TCB(function, args, stack);
    80002d10:	06000513          	li	a0,96
    80002d14:	00000097          	auipc	ra,0x0
    80002d18:	fa4080e7          	jalr	-92(ra) # 80002cb8 <_ZN3TCBnwEm>
													needToJoin(false),
													nextInScheduler(nullptr), timeToSleep(0), nextSleeping(nullptr) {
		//formiranje pocetnog konteksta; specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
		this->context.ra = startRa;
    80002d1c:	01253823          	sd	s2,16(a0)
    80002d20:	00953c23          	sd	s1,24(a0)
    80002d24:	03353023          	sd	s3,32(a0)
    80002d28:	00200793          	li	a5,2
    80002d2c:	02f53423          	sd	a5,40(a0)
    80002d30:	02050823          	sb	zero,48(a0)
    80002d34:	020508a3          	sb	zero,49(a0)
    80002d38:	02050923          	sb	zero,50(a0)
    80002d3c:	02053c23          	sd	zero,56(a0)
    80002d40:	04053023          	sd	zero,64(a0)
    80002d44:	04053423          	sd	zero,72(a0)
	ThreadQueue() : front(nullptr), back(nullptr) {}
    80002d48:	04053823          	sd	zero,80(a0)
    80002d4c:	04053c23          	sd	zero,88(a0)
		this->context.sp = startSp;
	}
    80002d50:	02090e63          	beqz	s2,80002d8c <_ZN3TCB12createThreadEPFvPvES0_Pm+0xa4>
    80002d54:	00000797          	auipc	a5,0x0
    80002d58:	e2878793          	addi	a5,a5,-472 # 80002b7c <_ZN3TCB7wrapperEv>

    80002d5c:	02048c63          	beqz	s1,80002d94 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xac>
    80002d60:	00008637          	lui	a2,0x8
    80002d64:	00c484b3          	add	s1,s1,a2

    80002d68:	00f53023          	sd	a5,0(a0)
	static void contextSwitch(Context* oldContext, Context* newContext);    //implementacija u asm
    80002d6c:	00953423          	sd	s1,8(a0)
}
    80002d70:	02813083          	ld	ra,40(sp)
    80002d74:	02013403          	ld	s0,32(sp)
    80002d78:	01813483          	ld	s1,24(sp)
    80002d7c:	01013903          	ld	s2,16(sp)
    80002d80:	00813983          	ld	s3,8(sp)
    80002d84:	03010113          	addi	sp,sp,48
    80002d88:	00008067          	ret
	}
    80002d8c:	00000793          	li	a5,0
    80002d90:	fcdff06f          	j	80002d5c <_ZN3TCB12createThreadEPFvPvES0_Pm+0x74>

    80002d94:	00000493          	li	s1,0
    80002d98:	fd1ff06f          	j	80002d68 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x80>

0000000080002d9c <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    80002d9c:	ff010113          	addi	sp,sp,-16
    80002da0:	00113423          	sd	ra,8(sp)
    80002da4:	00813023          	sd	s0,0(sp)
    80002da8:	01010413          	addi	s0,sp,16
	MemoryAllocator::kfree(ptr);
    80002dac:	00000097          	auipc	ra,0x0
    80002db0:	2bc080e7          	jalr	700(ra) # 80003068 <_ZN15MemoryAllocator5kfreeEPv>
}
    80002db4:	00813083          	ld	ra,8(sp)
    80002db8:	00013403          	ld	s0,0(sp)
    80002dbc:	01010113          	addi	sp,sp,16
    80002dc0:	00008067          	ret

0000000080002dc4 <_ZN3TCB10threadJoinEPS_>:

void TCB::threadJoin(TCB* handle) {
	if (handle->finished) return;
    80002dc4:	03054783          	lbu	a5,48(a0)
    80002dc8:	00078463          	beqz	a5,80002dd0 <_ZN3TCB10threadJoinEPS_+0xc>
    80002dcc:	00008067          	ret
void TCB::threadJoin(TCB* handle) {
    80002dd0:	ff010113          	addi	sp,sp,-16
    80002dd4:	00113423          	sd	ra,8(sp)
    80002dd8:	00813023          	sd	s0,0(sp)
    80002ddc:	01010413          	addi	s0,sp,16
	TCB::running->needToJoin = true;
    80002de0:	00009597          	auipc	a1,0x9
    80002de4:	e105b583          	ld	a1,-496(a1) # 8000bbf0 <_ZN3TCB7runningE>
    80002de8:	00100793          	li	a5,1
    80002dec:	02f58923          	sb	a5,50(a1)
	handle->waitingToJoin.putLast(TCB::running);
    80002df0:	05050513          	addi	a0,a0,80
    80002df4:	ffffe097          	auipc	ra,0xffffe
    80002df8:	450080e7          	jalr	1104(ra) # 80001244 <_ZN11ThreadQueue7putLastEP3TCB>
}
    80002dfc:	00813083          	ld	ra,8(sp)
    80002e00:	00013403          	ld	s0,0(sp)
    80002e04:	01010113          	addi	sp,sp,16
    80002e08:	00008067          	ret

0000000080002e0c <_ZN3TCB13releaseJoinedEv>:

void TCB::releaseJoined() {
	while (!TCB::running->waitingToJoin.isEmpty()) {
    80002e0c:	00009517          	auipc	a0,0x9
    80002e10:	de453503          	ld	a0,-540(a0) # 8000bbf0 <_ZN3TCB7runningE>
		return front == nullptr;
    80002e14:	05053783          	ld	a5,80(a0)
    80002e18:	04078663          	beqz	a5,80002e64 <_ZN3TCB13releaseJoinedEv+0x58>
void TCB::releaseJoined() {
    80002e1c:	ff010113          	addi	sp,sp,-16
    80002e20:	00113423          	sd	ra,8(sp)
    80002e24:	00813023          	sd	s0,0(sp)
    80002e28:	01010413          	addi	s0,sp,16
		TCB* tcb = TCB::running->waitingToJoin.getFirst();
    80002e2c:	05050513          	addi	a0,a0,80
    80002e30:	ffffe097          	auipc	ra,0xffffe
    80002e34:	480080e7          	jalr	1152(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
		tcb->needToJoin = false;
    80002e38:	02050923          	sb	zero,50(a0)
		Scheduler::put(tcb);
    80002e3c:	fffff097          	auipc	ra,0xfffff
    80002e40:	b84080e7          	jalr	-1148(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
	while (!TCB::running->waitingToJoin.isEmpty()) {
    80002e44:	00009517          	auipc	a0,0x9
    80002e48:	dac53503          	ld	a0,-596(a0) # 8000bbf0 <_ZN3TCB7runningE>
    80002e4c:	05053783          	ld	a5,80(a0)
    80002e50:	fc079ee3          	bnez	a5,80002e2c <_ZN3TCB13releaseJoinedEv+0x20>
	}
}
    80002e54:	00813083          	ld	ra,8(sp)
    80002e58:	00013403          	ld	s0,0(sp)
    80002e5c:	01010113          	addi	sp,sp,16
    80002e60:	00008067          	ret
    80002e64:	00008067          	ret

0000000080002e68 <_ZN3TCB5startEPS_>:

void TCB::start(TCB* newTcb) {
	//startovanje niti(stavljanje u Scheduler); main nit je vec aktivna, ne stavlja se u Scheduler
	if (newTcb->threadFunction != nullptr) Scheduler::put(newTcb);
    80002e68:	01053783          	ld	a5,16(a0)
    80002e6c:	02078663          	beqz	a5,80002e98 <_ZN3TCB5startEPS_+0x30>
void TCB::start(TCB* newTcb) {
    80002e70:	ff010113          	addi	sp,sp,-16
    80002e74:	00113423          	sd	ra,8(sp)
    80002e78:	00813023          	sd	s0,0(sp)
    80002e7c:	01010413          	addi	s0,sp,16
	if (newTcb->threadFunction != nullptr) Scheduler::put(newTcb);
    80002e80:	fffff097          	auipc	ra,0xfffff
    80002e84:	b40080e7          	jalr	-1216(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
}
    80002e88:	00813083          	ld	ra,8(sp)
    80002e8c:	00013403          	ld	s0,0(sp)
    80002e90:	01010113          	addi	sp,sp,16
    80002e94:	00008067          	ret
    80002e98:	00008067          	ret

0000000080002e9c <_ZN5Riscv10popSppSpieEv>:
// Created by os on 5/17/23.
//

#include "../h/Riscv.hpp"

void Riscv::popSppSpie() {
    80002e9c:	ff010113          	addi	sp,sp,-16
    80002ea0:	00813423          	sd	s0,8(sp)
    80002ea4:	01010413          	addi	s0,sp,16
	//ra pokazuje iza ove funkcije na nastavak wrappera
	__asm__ volatile("csrw sepc, ra");
    80002ea8:	14109073          	csrw	sepc,ra
	__asm__ volatile("sret");
    80002eac:	10200073          	sret
    80002eb0:	00813403          	ld	s0,8(sp)
    80002eb4:	01010113          	addi	sp,sp,16
    80002eb8:	00008067          	ret

0000000080002ebc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>:

bool MemoryAllocator::initialized = false;
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

void* MemoryAllocator::kmalloc(size_t size, Purpose pur) {
    80002ebc:	ff010113          	addi	sp,sp,-16
    80002ec0:	00813423          	sd	s0,8(sp)
    80002ec4:	01010413          	addi	s0,sp,16
	//size je u broju bajtova, ukljucuje i mesto potrebno za zaglavlje UsedMemSegment
	if (size <= 0) return nullptr;
    80002ec8:	12050863          	beqz	a0,80002ff8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x13c>


	//alokacija uvek zaokruzena na blokove
	//size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
	size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80002ecc:	00655793          	srli	a5,a0,0x6
    80002ed0:	03f57513          	andi	a0,a0,63
    80002ed4:	00050463          	beqz	a0,80002edc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x20>
    80002ed8:	00100513          	li	a0,1
    80002edc:	00a78533          	add	a0,a5,a0
	size = blocks * MEM_BLOCK_SIZE;
    80002ee0:	00651793          	slli	a5,a0,0x6

	//trazenje slobodnog segmenta po first-fit algoritmu
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80002ee4:	00009517          	auipc	a0,0x9
    80002ee8:	d1c53503          	ld	a0,-740(a0) # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80002eec:	0e050863          	beqz	a0,80002fdc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x120>
		if (current->size < size) continue;
    80002ef0:	01053703          	ld	a4,16(a0)
    80002ef4:	06f76a63          	bltu	a4,a5,80002f68 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xac>

		//pravljenje novog slobodnog fragmenta od ostatka fragmenta
		FreeMemSegment* remainderFree = (FreeMemSegment*)((char*)current + size);
    80002ef8:	00f506b3          	add	a3,a0,a5
		size_t remainingSize = current->size - size;
    80002efc:	40f70633          	sub	a2,a4,a5
		if (remainingSize <= sizeof(UsedMemSegment)) {
    80002f00:	02000813          	li	a6,32
    80002f04:	06c86e63          	bltu	a6,a2,80002f80 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xc4>
			//ne preostaje dovoljno veliki slobodni segment;dodeljujemo ceo trenutno alociranom
			size += remainingSize;
			if (current->prev) current->prev->next = current->next;
    80002f08:	00853783          	ld	a5,8(a0)
    80002f0c:	00078663          	beqz	a5,80002f18 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x5c>
    80002f10:	00053683          	ld	a3,0(a0)
    80002f14:	00d7b023          	sd	a3,0(a5)
			if (current->next) current->next->prev = current->prev;
    80002f18:	00053783          	ld	a5,0(a0)
    80002f1c:	00078663          	beqz	a5,80002f28 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x6c>
    80002f20:	00853683          	ld	a3,8(a0)
    80002f24:	00d7b423          	sd	a3,8(a5)
			if (freeMemHead == current) freeMemHead = current->next;
    80002f28:	00009797          	auipc	a5,0x9
    80002f2c:	cd87b783          	ld	a5,-808(a5) # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80002f30:	04a78063          	beq	a5,a0,80002f70 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xb4>
			if (current->next) current->next->prev = remainderFree;
			if (freeMemHead == current) freeMemHead = remainderFree;
		}
		//ubacivanje novog fragmenta u listu zauzetih fragmenata
		UsedMemSegment* newFragment = (UsedMemSegment*)current;
		newFragment->size = size;
    80002f34:	00e53423          	sd	a4,8(a0)
		newFragment->purpose = pur;
    80002f38:	00b52823          	sw	a1,16(a0)
		newFragment->usableFirstAddress = (char*)newFragment + sizeof(UsedMemSegment);
    80002f3c:	02050793          	addi	a5,a0,32
    80002f40:	00f53c23          	sd	a5,24(a0)
		UsedMemSegment* prevUsed = nullptr;
		for (UsedMemSegment* cur = usedMemHead;
    80002f44:	00009697          	auipc	a3,0x9
    80002f48:	cc46b683          	ld	a3,-828(a3) # 8000bc08 <_ZN15MemoryAllocator11usedMemHeadE>
    80002f4c:	00068793          	mv	a5,a3
		UsedMemSegment* prevUsed = nullptr;
    80002f50:	00000713          	li	a4,0
			 cur && ((char*)cur < (char*)newFragment); cur = cur->next) {
    80002f54:	06078a63          	beqz	a5,80002fc8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x10c>
    80002f58:	06a7f863          	bgeu	a5,a0,80002fc8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x10c>
			prevUsed = cur;
    80002f5c:	00078713          	mv	a4,a5
			 cur && ((char*)cur < (char*)newFragment); cur = cur->next) {
    80002f60:	0007b783          	ld	a5,0(a5)
		for (UsedMemSegment* cur = usedMemHead;
    80002f64:	ff1ff06f          	j	80002f54 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x98>
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80002f68:	00053503          	ld	a0,0(a0)
    80002f6c:	f81ff06f          	j	80002eec <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x30>
			if (freeMemHead == current) freeMemHead = current->next;
    80002f70:	00053783          	ld	a5,0(a0)
    80002f74:	00009697          	auipc	a3,0x9
    80002f78:	c8f6b623          	sd	a5,-884(a3) # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80002f7c:	fb9ff06f          	j	80002f34 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x78>
			remainderFree->size = remainingSize;
    80002f80:	00c6b823          	sd	a2,16(a3)
			remainderFree->prev = current->prev;
    80002f84:	00853703          	ld	a4,8(a0)
    80002f88:	00e6b423          	sd	a4,8(a3)
			if (current->prev) current->prev->next = remainderFree;
    80002f8c:	00070463          	beqz	a4,80002f94 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xd8>
    80002f90:	00d73023          	sd	a3,0(a4)
			remainderFree->next = current->next;
    80002f94:	00053703          	ld	a4,0(a0)
    80002f98:	00e6b023          	sd	a4,0(a3)
			if (current->next) current->next->prev = remainderFree;
    80002f9c:	00070463          	beqz	a4,80002fa4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xe8>
    80002fa0:	00d73423          	sd	a3,8(a4)
			if (freeMemHead == current) freeMemHead = remainderFree;
    80002fa4:	00009717          	auipc	a4,0x9
    80002fa8:	c5c73703          	ld	a4,-932(a4) # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    80002fac:	00a70663          	beq	a4,a0,80002fb8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xfc>
	size = blocks * MEM_BLOCK_SIZE;
    80002fb0:	00078713          	mv	a4,a5
    80002fb4:	f81ff06f          	j	80002f34 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x78>
			if (freeMemHead == current) freeMemHead = remainderFree;
    80002fb8:	00009717          	auipc	a4,0x9
    80002fbc:	c4d73423          	sd	a3,-952(a4) # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
	size = blocks * MEM_BLOCK_SIZE;
    80002fc0:	00078713          	mv	a4,a5
    80002fc4:	f71ff06f          	j	80002f34 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x78>
		}
		if (!prevUsed) {
    80002fc8:	02070063          	beqz	a4,80002fe8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x12c>
			newFragment->next = usedMemHead;
			usedMemHead = newFragment;
		} else {
			newFragment->next = prevUsed->next;
    80002fcc:	00073783          	ld	a5,0(a4)
    80002fd0:	00f53023          	sd	a5,0(a0)
			prevUsed->next = newFragment;
    80002fd4:	00a73023          	sd	a0,0(a4)
		}
		//return (char*)newFragment + sizeof(UsedMemSegment);
		return newFragment->usableFirstAddress;
    80002fd8:	01853503          	ld	a0,24(a0)
	}
	return nullptr;
}
    80002fdc:	00813403          	ld	s0,8(sp)
    80002fe0:	01010113          	addi	sp,sp,16
    80002fe4:	00008067          	ret
			newFragment->next = usedMemHead;
    80002fe8:	00d53023          	sd	a3,0(a0)
			usedMemHead = newFragment;
    80002fec:	00009797          	auipc	a5,0x9
    80002ff0:	c0a7be23          	sd	a0,-996(a5) # 8000bc08 <_ZN15MemoryAllocator11usedMemHeadE>
    80002ff4:	fe5ff06f          	j	80002fd8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x11c>
	if (size <= 0) return nullptr;
    80002ff8:	00000513          	li	a0,0
    80002ffc:	fe1ff06f          	j	80002fdc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x120>

0000000080003000 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:
	tryToJoin(newFree);
	tryToJoin(prevFree);
	return 0;
}

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    80003000:	ff010113          	addi	sp,sp,-16
    80003004:	00813423          	sd	s0,8(sp)
    80003008:	01010413          	addi	s0,sp,16
	if (!current) return 0;
    8000300c:	04050663          	beqz	a0,80003058 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x58>
	bool nextExists = current->next != nullptr;
    80003010:	00053783          	ld	a5,0(a0)
	char* nextAddr = (char*)current + current->size;
    80003014:	01053703          	ld	a4,16(a0)
    80003018:	00e506b3          	add	a3,a0,a4
	char* cnext = (char*)current->next;
	bool nextIsConnected = (nextAddr == cnext);
	if (nextExists && nextIsConnected) {
    8000301c:	04078263          	beqz	a5,80003060 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x60>
    80003020:	00d78a63          	beq	a5,a3,80003034 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x34>
		current->size += current->next->size;
		current->next = current->next->next;
		if (current->next) current->next->prev = current;
		return 1;
	} else return 0;
    80003024:	00000513          	li	a0,0
}
    80003028:	00813403          	ld	s0,8(sp)
    8000302c:	01010113          	addi	sp,sp,16
    80003030:	00008067          	ret
		current->size += current->next->size;
    80003034:	0107b683          	ld	a3,16(a5)
    80003038:	00d70733          	add	a4,a4,a3
    8000303c:	00e53823          	sd	a4,16(a0)
		current->next = current->next->next;
    80003040:	0007b783          	ld	a5,0(a5)
    80003044:	00f53023          	sd	a5,0(a0)
		if (current->next) current->next->prev = current;
    80003048:	00078463          	beqz	a5,80003050 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x50>
    8000304c:	00a7b423          	sd	a0,8(a5)
		return 1;
    80003050:	00100513          	li	a0,1
    80003054:	fd5ff06f          	j	80003028 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	if (!current) return 0;
    80003058:	00000513          	li	a0,0
    8000305c:	fcdff06f          	j	80003028 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	} else return 0;
    80003060:	00000513          	li	a0,0
    80003064:	fc5ff06f          	j	80003028 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>

0000000080003068 <_ZN15MemoryAllocator5kfreeEPv>:
	if (!ptr) return 0;
    80003068:	10050463          	beqz	a0,80003170 <_ZN15MemoryAllocator5kfreeEPv+0x108>
    8000306c:	00050693          	mv	a3,a0
	if (!usedMemHead) return -1;
    80003070:	00009797          	auipc	a5,0x9
    80003074:	b987b783          	ld	a5,-1128(a5) # 8000bc08 <_ZN15MemoryAllocator11usedMemHeadE>
    80003078:	10078063          	beqz	a5,80003178 <_ZN15MemoryAllocator5kfreeEPv+0x110>
	ptr = (char*)ptr - sizeof(UsedMemSegment);
    8000307c:	fe050513          	addi	a0,a0,-32
	UsedMemSegment* prevUsed = nullptr;
    80003080:	00000713          	li	a4,0
	for (; currentUsed && ((char*)currentUsed != (char*)ptr); currentUsed = currentUsed->next) {
    80003084:	00078a63          	beqz	a5,80003098 <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80003088:	00a78863          	beq	a5,a0,80003098 <_ZN15MemoryAllocator5kfreeEPv+0x30>
		prevUsed = currentUsed;
    8000308c:	00078713          	mv	a4,a5
	for (; currentUsed && ((char*)currentUsed != (char*)ptr); currentUsed = currentUsed->next) {
    80003090:	0007b783          	ld	a5,0(a5)
    80003094:	ff1ff06f          	j	80003084 <_ZN15MemoryAllocator5kfreeEPv+0x1c>
	if ((char*)currentUsed != (char*)ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80003098:	0ea79463          	bne	a5,a0,80003180 <_ZN15MemoryAllocator5kfreeEPv+0x118>
int MemoryAllocator::kfree(void* ptr) {
    8000309c:	fe010113          	addi	sp,sp,-32
    800030a0:	00113c23          	sd	ra,24(sp)
    800030a4:	00813823          	sd	s0,16(sp)
    800030a8:	00913423          	sd	s1,8(sp)
    800030ac:	02010413          	addi	s0,sp,32
	if (prevUsed) prevUsed->next = currentUsed->next;
    800030b0:	02070863          	beqz	a4,800030e0 <_ZN15MemoryAllocator5kfreeEPv+0x78>
    800030b4:	0007b783          	ld	a5,0(a5)
    800030b8:	00f73023          	sd	a5,0(a4)
	if (!freeMemHead || ((char*)ptr < (char*)freeMemHead)) {
    800030bc:	00009797          	auipc	a5,0x9
    800030c0:	b447b783          	ld	a5,-1212(a5) # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    800030c4:	02078663          	beqz	a5,800030f0 <_ZN15MemoryAllocator5kfreeEPv+0x88>
    800030c8:	02f56863          	bltu	a0,a5,800030f8 <_ZN15MemoryAllocator5kfreeEPv+0x90>
			 prevFree->next && (char*)ptr > (char*)(prevFree->next); prevFree = prevFree->next);
    800030cc:	00078493          	mv	s1,a5
    800030d0:	0007b783          	ld	a5,0(a5)
    800030d4:	02078463          	beqz	a5,800030fc <_ZN15MemoryAllocator5kfreeEPv+0x94>
    800030d8:	fea7eae3          	bltu	a5,a0,800030cc <_ZN15MemoryAllocator5kfreeEPv+0x64>
    800030dc:	0200006f          	j	800030fc <_ZN15MemoryAllocator5kfreeEPv+0x94>
	else usedMemHead = currentUsed->next;
    800030e0:	0007b783          	ld	a5,0(a5)
    800030e4:	00009717          	auipc	a4,0x9
    800030e8:	b2f73223          	sd	a5,-1244(a4) # 8000bc08 <_ZN15MemoryAllocator11usedMemHeadE>
    800030ec:	fd1ff06f          	j	800030bc <_ZN15MemoryAllocator5kfreeEPv+0x54>
		prevFree = nullptr;
    800030f0:	00078493          	mv	s1,a5
    800030f4:	0080006f          	j	800030fc <_ZN15MemoryAllocator5kfreeEPv+0x94>
    800030f8:	00000493          	li	s1,0
	size_t segmentSize = ((UsedMemSegment*)ptr)->size;
    800030fc:	fe86b783          	ld	a5,-24(a3)
	newFree->size = segmentSize;
    80003100:	fef6b823          	sd	a5,-16(a3)
	newFree->prev = prevFree;
    80003104:	fe96b423          	sd	s1,-24(a3)
	if (prevFree) newFree->next = prevFree->next;
    80003108:	04048663          	beqz	s1,80003154 <_ZN15MemoryAllocator5kfreeEPv+0xec>
    8000310c:	0004b783          	ld	a5,0(s1)
    80003110:	fef6b023          	sd	a5,-32(a3)
	if (newFree->next) newFree->next->prev = newFree;
    80003114:	fe06b783          	ld	a5,-32(a3)
    80003118:	00078463          	beqz	a5,80003120 <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    8000311c:	00a7b423          	sd	a0,8(a5)
	if (prevFree) prevFree->next = newFree;
    80003120:	04048263          	beqz	s1,80003164 <_ZN15MemoryAllocator5kfreeEPv+0xfc>
    80003124:	00a4b023          	sd	a0,0(s1)
	tryToJoin(newFree);
    80003128:	00000097          	auipc	ra,0x0
    8000312c:	ed8080e7          	jalr	-296(ra) # 80003000 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	tryToJoin(prevFree);
    80003130:	00048513          	mv	a0,s1
    80003134:	00000097          	auipc	ra,0x0
    80003138:	ecc080e7          	jalr	-308(ra) # 80003000 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	return 0;
    8000313c:	00000513          	li	a0,0
}
    80003140:	01813083          	ld	ra,24(sp)
    80003144:	01013403          	ld	s0,16(sp)
    80003148:	00813483          	ld	s1,8(sp)
    8000314c:	02010113          	addi	sp,sp,32
    80003150:	00008067          	ret
	else newFree->next = freeMemHead;
    80003154:	00009797          	auipc	a5,0x9
    80003158:	aac7b783          	ld	a5,-1364(a5) # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    8000315c:	fef6b023          	sd	a5,-32(a3)
    80003160:	fb5ff06f          	j	80003114 <_ZN15MemoryAllocator5kfreeEPv+0xac>
	else freeMemHead = newFree;
    80003164:	00009797          	auipc	a5,0x9
    80003168:	a8a7be23          	sd	a0,-1380(a5) # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    8000316c:	fbdff06f          	j	80003128 <_ZN15MemoryAllocator5kfreeEPv+0xc0>
	if (!ptr) return 0;
    80003170:	00000513          	li	a0,0
    80003174:	00008067          	ret
	if (!usedMemHead) return -1;
    80003178:	fff00513          	li	a0,-1
    8000317c:	00008067          	ret
	if ((char*)currentUsed != (char*)ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80003180:	fff00513          	li	a0,-1
}
    80003184:	00008067          	ret

0000000080003188 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>:

bool MemoryAllocator::checkPurpose(void* ptr, MemoryAllocator::Purpose p) {
    80003188:	ff010113          	addi	sp,sp,-16
    8000318c:	00813423          	sd	s0,8(sp)
    80003190:	01010413          	addi	s0,sp,16
	ptr = (char*)ptr - sizeof(UsedMemSegment);
	return ((UsedMemSegment*)ptr)->purpose == p;
    80003194:	ff052503          	lw	a0,-16(a0)
    80003198:	40b50533          	sub	a0,a0,a1
}
    8000319c:	00153513          	seqz	a0,a0
    800031a0:	00813403          	ld	s0,8(sp)
    800031a4:	01010113          	addi	sp,sp,16
    800031a8:	00008067          	ret

00000000800031ac <_ZN15MemoryAllocator19initMemoryAllocatorEv>:

void MemoryAllocator::initMemoryAllocator() {
    800031ac:	ff010113          	addi	sp,sp,-16
    800031b0:	00813423          	sd	s0,8(sp)
    800031b4:	01010413          	addi	s0,sp,16
//pocetna inicijalizacija
	if (!initialized) {
    800031b8:	00009797          	auipc	a5,0x9
    800031bc:	a587c783          	lbu	a5,-1448(a5) # 8000bc10 <_ZN15MemoryAllocator11initializedE>
    800031c0:	04079663          	bnez	a5,8000320c <_ZN15MemoryAllocator19initMemoryAllocatorEv+0x60>
		freeMemHead = (FreeMemSegment*)HEAP_START_ADDR;
    800031c4:	00009617          	auipc	a2,0x9
    800031c8:	8dc63603          	ld	a2,-1828(a2) # 8000baa0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800031cc:	00063703          	ld	a4,0(a2)
    800031d0:	00009797          	auipc	a5,0x9
    800031d4:	a3078793          	addi	a5,a5,-1488 # 8000bc00 <_ZN15MemoryAllocator11freeMemHeadE>
    800031d8:	00e7b023          	sd	a4,0(a5)
		freeMemHead->next = nullptr;
    800031dc:	00073023          	sd	zero,0(a4)
		freeMemHead->prev = nullptr;
    800031e0:	0007b683          	ld	a3,0(a5)
    800031e4:	0006b423          	sd	zero,8(a3)
		freeMemHead->size = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR;//- sizeof(FreeMemSegment);
    800031e8:	00009717          	auipc	a4,0x9
    800031ec:	8f073703          	ld	a4,-1808(a4) # 8000bad8 <_GLOBAL_OFFSET_TABLE_+0x60>
    800031f0:	00073703          	ld	a4,0(a4)
    800031f4:	00063603          	ld	a2,0(a2)
    800031f8:	40c70733          	sub	a4,a4,a2
    800031fc:	00e6b823          	sd	a4,16(a3)
		usedMemHead = nullptr;
    80003200:	0007b423          	sd	zero,8(a5)

		initialized = true;
    80003204:	00100713          	li	a4,1
    80003208:	00e78823          	sb	a4,16(a5)
	}
}
    8000320c:	00813403          	ld	s0,8(sp)
    80003210:	01010113          	addi	sp,sp,16
    80003214:	00008067          	ret

0000000080003218 <_ZN4KSemnwEm>:

#include "../h/KSem.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void* KSem::operator new(size_t size) {
    80003218:	ff010113          	addi	sp,sp,-16
    8000321c:	00113423          	sd	ra,8(sp)
    80003220:	00813023          	sd	s0,0(sp)
    80003224:	01010413          	addi	s0,sp,16
	return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::SEMAPHORE);
    80003228:	00100593          	li	a1,1
    8000322c:	02050513          	addi	a0,a0,32
    80003230:	00000097          	auipc	ra,0x0
    80003234:	c8c080e7          	jalr	-884(ra) # 80002ebc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
}
    80003238:	00813083          	ld	ra,8(sp)
    8000323c:	00013403          	ld	s0,0(sp)
    80003240:	01010113          	addi	sp,sp,16
    80003244:	00008067          	ret

0000000080003248 <_ZN4KSemdlEPv>:

void KSem::operator delete(void* ptr) {
    80003248:	ff010113          	addi	sp,sp,-16
    8000324c:	00113423          	sd	ra,8(sp)
    80003250:	00813023          	sd	s0,0(sp)
    80003254:	01010413          	addi	s0,sp,16
	MemoryAllocator::kfree(ptr);
    80003258:	00000097          	auipc	ra,0x0
    8000325c:	e10080e7          	jalr	-496(ra) # 80003068 <_ZN15MemoryAllocator5kfreeEPv>
}
    80003260:	00813083          	ld	ra,8(sp)
    80003264:	00013403          	ld	s0,0(sp)
    80003268:	01010113          	addi	sp,sp,16
    8000326c:	00008067          	ret

0000000080003270 <_ZN4KSem7initSemEj>:

KSem* KSem::initSem(uint val) {
    80003270:	fe010113          	addi	sp,sp,-32
    80003274:	00113c23          	sd	ra,24(sp)
    80003278:	00813823          	sd	s0,16(sp)
    8000327c:	00913423          	sd	s1,8(sp)
    80003280:	02010413          	addi	s0,sp,32
    80003284:	00050493          	mv	s1,a0
	return new KSem(val);
    80003288:	02000513          	li	a0,32
    8000328c:	00000097          	auipc	ra,0x0
    80003290:	f8c080e7          	jalr	-116(ra) # 80003218 <_ZN4KSemnwEm>
	void block();

	void unblock();

private:
	KSem(uint val) : val(val), working(true) {}
    80003294:	00952023          	sw	s1,0(a0)
	ThreadQueue() : front(nullptr), back(nullptr) {}
    80003298:	00053423          	sd	zero,8(a0)
    8000329c:	00053823          	sd	zero,16(a0)
    800032a0:	00100713          	li	a4,1
    800032a4:	00e50c23          	sb	a4,24(a0)
}
    800032a8:	01813083          	ld	ra,24(sp)
    800032ac:	01013403          	ld	s0,16(sp)
    800032b0:	00813483          	ld	s1,8(sp)
    800032b4:	02010113          	addi	sp,sp,32
    800032b8:	00008067          	ret

00000000800032bc <_ZN4KSem5blockEv>:
	if (!working) return -3;
	if (val++ < 0) unblock();
	return 0;
}

void KSem::block() {
    800032bc:	ff010113          	addi	sp,sp,-16
    800032c0:	00113423          	sd	ra,8(sp)
    800032c4:	00813023          	sd	s0,0(sp)
    800032c8:	01010413          	addi	s0,sp,16
	TCB::running->setBlocked(true);
    800032cc:	00009797          	auipc	a5,0x9
    800032d0:	8047b783          	ld	a5,-2044(a5) # 8000bad0 <_GLOBAL_OFFSET_TABLE_+0x58>
    800032d4:	0007b583          	ld	a1,0(a5)
	void setBlocked(bool block) { this->blocked = block; }
    800032d8:	00100793          	li	a5,1
    800032dc:	02f588a3          	sb	a5,49(a1)
	blocked.putLast(TCB::running);
    800032e0:	00850513          	addi	a0,a0,8
    800032e4:	ffffe097          	auipc	ra,0xffffe
    800032e8:	f60080e7          	jalr	-160(ra) # 80001244 <_ZN11ThreadQueue7putLastEP3TCB>
	TCB::yield();
    800032ec:	00000097          	auipc	ra,0x0
    800032f0:	994080e7          	jalr	-1644(ra) # 80002c80 <_ZN3TCB5yieldEv>
}
    800032f4:	00813083          	ld	ra,8(sp)
    800032f8:	00013403          	ld	s0,0(sp)
    800032fc:	01010113          	addi	sp,sp,16
    80003300:	00008067          	ret

0000000080003304 <_ZN4KSem4waitEv>:
int KSem::wait() {
    80003304:	fe010113          	addi	sp,sp,-32
    80003308:	00113c23          	sd	ra,24(sp)
    8000330c:	00813823          	sd	s0,16(sp)
    80003310:	00913423          	sd	s1,8(sp)
    80003314:	02010413          	addi	s0,sp,32
    80003318:	00050493          	mv	s1,a0
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    8000331c:	00100593          	li	a1,1
    80003320:	00000097          	auipc	ra,0x0
    80003324:	e68080e7          	jalr	-408(ra) # 80003188 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>
    80003328:	04050663          	beqz	a0,80003374 <_ZN4KSem4waitEv+0x70>
	if (!working) return -3;
    8000332c:	0184c783          	lbu	a5,24(s1)
    80003330:	04078663          	beqz	a5,8000337c <_ZN4KSem4waitEv+0x78>
	if (--val < 0) {
    80003334:	0004a783          	lw	a5,0(s1)
    80003338:	fff7879b          	addiw	a5,a5,-1
    8000333c:	00f4a023          	sw	a5,0(s1)
    80003340:	02079713          	slli	a4,a5,0x20
    80003344:	00074e63          	bltz	a4,80003360 <_ZN4KSem4waitEv+0x5c>
	return 0;
    80003348:	00000513          	li	a0,0
}
    8000334c:	01813083          	ld	ra,24(sp)
    80003350:	01013403          	ld	s0,16(sp)
    80003354:	00813483          	ld	s1,8(sp)
    80003358:	02010113          	addi	sp,sp,32
    8000335c:	00008067          	ret
		block();
    80003360:	00048513          	mv	a0,s1
    80003364:	00000097          	auipc	ra,0x0
    80003368:	f58080e7          	jalr	-168(ra) # 800032bc <_ZN4KSem5blockEv>
		return -1;
    8000336c:	fff00513          	li	a0,-1
    80003370:	fddff06f          	j	8000334c <_ZN4KSem4waitEv+0x48>
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    80003374:	ffe00513          	li	a0,-2
    80003378:	fd5ff06f          	j	8000334c <_ZN4KSem4waitEv+0x48>
	if (!working) return -3;
    8000337c:	ffd00513          	li	a0,-3
    80003380:	fcdff06f          	j	8000334c <_ZN4KSem4waitEv+0x48>

0000000080003384 <_ZN4KSem7unblockEv>:

void KSem::unblock() {
    80003384:	ff010113          	addi	sp,sp,-16
    80003388:	00113423          	sd	ra,8(sp)
    8000338c:	00813023          	sd	s0,0(sp)
    80003390:	01010413          	addi	s0,sp,16
	TCB* tcb = blocked.getFirst();
    80003394:	00850513          	addi	a0,a0,8
    80003398:	ffffe097          	auipc	ra,0xffffe
    8000339c:	f18080e7          	jalr	-232(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
    800033a0:	020508a3          	sb	zero,49(a0)
	tcb->setBlocked(false);
	Scheduler::put(tcb);
    800033a4:	ffffe097          	auipc	ra,0xffffe
    800033a8:	61c080e7          	jalr	1564(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
}
    800033ac:	00813083          	ld	ra,8(sp)
    800033b0:	00013403          	ld	s0,0(sp)
    800033b4:	01010113          	addi	sp,sp,16
    800033b8:	00008067          	ret

00000000800033bc <_ZN4KSem6signalEv>:
int KSem::signal() {
    800033bc:	fe010113          	addi	sp,sp,-32
    800033c0:	00113c23          	sd	ra,24(sp)
    800033c4:	00813823          	sd	s0,16(sp)
    800033c8:	00913423          	sd	s1,8(sp)
    800033cc:	02010413          	addi	s0,sp,32
    800033d0:	00050493          	mv	s1,a0
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    800033d4:	00100593          	li	a1,1
    800033d8:	00000097          	auipc	ra,0x0
    800033dc:	db0080e7          	jalr	-592(ra) # 80003188 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>
    800033e0:	04050463          	beqz	a0,80003428 <_ZN4KSem6signalEv+0x6c>
	if (!working) return -3;
    800033e4:	0184c783          	lbu	a5,24(s1)
    800033e8:	04078463          	beqz	a5,80003430 <_ZN4KSem6signalEv+0x74>
	if (val++ < 0) unblock();
    800033ec:	0004a783          	lw	a5,0(s1)
    800033f0:	0017871b          	addiw	a4,a5,1
    800033f4:	00e4a023          	sw	a4,0(s1)
    800033f8:	0007ce63          	bltz	a5,80003414 <_ZN4KSem6signalEv+0x58>
	return 0;
    800033fc:	00000513          	li	a0,0
}
    80003400:	01813083          	ld	ra,24(sp)
    80003404:	01013403          	ld	s0,16(sp)
    80003408:	00813483          	ld	s1,8(sp)
    8000340c:	02010113          	addi	sp,sp,32
    80003410:	00008067          	ret
	if (val++ < 0) unblock();
    80003414:	00048513          	mv	a0,s1
    80003418:	00000097          	auipc	ra,0x0
    8000341c:	f6c080e7          	jalr	-148(ra) # 80003384 <_ZN4KSem7unblockEv>
	return 0;
    80003420:	00000513          	li	a0,0
    80003424:	fddff06f          	j	80003400 <_ZN4KSem6signalEv+0x44>
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    80003428:	ffe00513          	li	a0,-2
    8000342c:	fd5ff06f          	j	80003400 <_ZN4KSem6signalEv+0x44>
	if (!working) return -3;
    80003430:	ffd00513          	li	a0,-3
    80003434:	fcdff06f          	j	80003400 <_ZN4KSem6signalEv+0x44>

0000000080003438 <_ZN4KSem8closeSemEPS_>:

int KSem::closeSem(sem_t handle) {
    80003438:	fe010113          	addi	sp,sp,-32
    8000343c:	00113c23          	sd	ra,24(sp)
    80003440:	00813823          	sd	s0,16(sp)
    80003444:	00913423          	sd	s1,8(sp)
    80003448:	02010413          	addi	s0,sp,32
    8000344c:	00050493          	mv	s1,a0
	if (!MemoryAllocator::checkPurpose(handle, MemoryAllocator::SEMAPHORE)) return -2;
    80003450:	00100593          	li	a1,1
    80003454:	00000097          	auipc	ra,0x0
    80003458:	d34080e7          	jalr	-716(ra) # 80003188 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>
    8000345c:	04050263          	beqz	a0,800034a0 <_ZN4KSem8closeSemEPS_+0x68>
	handle->working = false;
    80003460:	00048c23          	sb	zero,24(s1)
    80003464:	01c0006f          	j	80003480 <_ZN4KSem8closeSemEPS_+0x48>
	while (!handle->blocked.isEmpty()) {
		TCB* tcb = handle->blocked.getFirst();
    80003468:	00848513          	addi	a0,s1,8
    8000346c:	ffffe097          	auipc	ra,0xffffe
    80003470:	e44080e7          	jalr	-444(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
    80003474:	020508a3          	sb	zero,49(a0)
		tcb->setBlocked(false);
		Scheduler::put(tcb);
    80003478:	ffffe097          	auipc	ra,0xffffe
    8000347c:	548080e7          	jalr	1352(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
		return front == nullptr;
    80003480:	0084b783          	ld	a5,8(s1)
	while (!handle->blocked.isEmpty()) {
    80003484:	fe0792e3          	bnez	a5,80003468 <_ZN4KSem8closeSemEPS_+0x30>
	}
	return 0;
    80003488:	00000513          	li	a0,0
}
    8000348c:	01813083          	ld	ra,24(sp)
    80003490:	01013403          	ld	s0,16(sp)
    80003494:	00813483          	ld	s1,8(sp)
    80003498:	02010113          	addi	sp,sp,32
    8000349c:	00008067          	ret
	if (!MemoryAllocator::checkPurpose(handle, MemoryAllocator::SEMAPHORE)) return -2;
    800034a0:	ffe00513          	li	a0,-2
    800034a4:	fe9ff06f          	j	8000348c <_ZN4KSem8closeSemEPS_+0x54>

00000000800034a8 <_Z10testMemoryv>:
//void printInteger(int i){
//	printInt(i);
//}
extern Semaphore* semA;

void testMemory() {
    800034a8:	81010113          	addi	sp,sp,-2032
    800034ac:	7e113423          	sd	ra,2024(sp)
    800034b0:	7e813023          	sd	s0,2016(sp)
    800034b4:	7c913c23          	sd	s1,2008(sp)
    800034b8:	7f010413          	addi	s0,sp,2032
    800034bc:	83010113          	addi	sp,sp,-2000
	const uint64 NumAllocations = 500;    //zasto nece za preko 500????
	const uint64 AllocationSize = 16;

	// Allocate and initialize pointers
	int* allocations[NumAllocations];
	for (uint64 i = 0; i < NumAllocations; ++i)
    800034c0:	00000713          	li	a4,0
    800034c4:	1f300793          	li	a5,499
    800034c8:	02e7e263          	bltu	a5,a4,800034ec <_Z10testMemoryv+0x44>
		allocations[i] = nullptr;
    800034cc:	fffff7b7          	lui	a5,0xfffff
    800034d0:	00371693          	slli	a3,a4,0x3
    800034d4:	fe040613          	addi	a2,s0,-32
    800034d8:	00f607b3          	add	a5,a2,a5
    800034dc:	00d787b3          	add	a5,a5,a3
    800034e0:	0607b023          	sd	zero,96(a5) # fffffffffffff060 <end+0xffffffff7fff2190>
	for (uint64 i = 0; i < NumAllocations; ++i)
    800034e4:	00170713          	addi	a4,a4,1
    800034e8:	fddff06f          	j	800034c4 <_Z10testMemoryv+0x1c>

	// Allocate memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
    800034ec:	00000493          	li	s1,0
    800034f0:	1f300793          	li	a5,499
    800034f4:	0297ec63          	bltu	a5,s1,8000352c <_Z10testMemoryv+0x84>
		allocations[i] = (int*)MemoryAllocator::kmalloc(
    800034f8:	00300593          	li	a1,3
    800034fc:	03000513          	li	a0,48
    80003500:	00000097          	auipc	ra,0x0
    80003504:	9bc080e7          	jalr	-1604(ra) # 80002ebc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
    80003508:	fffff737          	lui	a4,0xfffff
    8000350c:	00349793          	slli	a5,s1,0x3
    80003510:	fe040693          	addi	a3,s0,-32
    80003514:	00e68733          	add	a4,a3,a4
    80003518:	00f707b3          	add	a5,a4,a5
    8000351c:	06a7b023          	sd	a0,96(a5)
				AllocationSize + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::MISC);
		if (allocations[i] == nullptr) {
    80003520:	00050663          	beqz	a0,8000352c <_Z10testMemoryv+0x84>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80003524:	00148493          	addi	s1,s1,1
    80003528:	fc9ff06f          	j	800034f0 <_Z10testMemoryv+0x48>
    8000352c:	00000493          	li	s1,0
    80003530:	0100006f          	j	80003540 <_Z10testMemoryv+0x98>
	}

	// Free memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
		if (allocations[i] != nullptr) {
			if (MemoryAllocator::kfree(allocations[i]) != 0) {
    80003534:	00000097          	auipc	ra,0x0
    80003538:	b34080e7          	jalr	-1228(ra) # 80003068 <_ZN15MemoryAllocator5kfreeEPv>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    8000353c:	00148493          	addi	s1,s1,1
    80003540:	1f300793          	li	a5,499
    80003544:	0297e263          	bltu	a5,s1,80003568 <_Z10testMemoryv+0xc0>
		if (allocations[i] != nullptr) {
    80003548:	fffff737          	lui	a4,0xfffff
    8000354c:	00349793          	slli	a5,s1,0x3
    80003550:	fe040693          	addi	a3,s0,-32
    80003554:	00e68733          	add	a4,a3,a4
    80003558:	00f707b3          	add	a5,a4,a5
    8000355c:	0607b503          	ld	a0,96(a5)
    80003560:	fc051ae3          	bnez	a0,80003534 <_Z10testMemoryv+0x8c>
    80003564:	fd9ff06f          	j	8000353c <_Z10testMemoryv+0x94>
//				printString("\nDeallocation failed for index ");
//				printInteger(i);
			}
		}
	}
}
    80003568:	7d010113          	addi	sp,sp,2000
    8000356c:	7e813083          	ld	ra,2024(sp)
    80003570:	7e013403          	ld	s0,2016(sp)
    80003574:	7d813483          	ld	s1,2008(sp)
    80003578:	7f010113          	addi	sp,sp,2032
    8000357c:	00008067          	ret

0000000080003580 <_Z5nit1fPv>:

void nit1f(void*) {
    80003580:	ff010113          	addi	sp,sp,-16
    80003584:	00113423          	sd	ra,8(sp)
    80003588:	00813023          	sd	s0,0(sp)
    8000358c:	01010413          	addi	s0,sp,16
//		printString("\nsem_wait za nit 1 vratio ");
//		printInteger(res);
//		printString("\n");
//	}

	printString("\nGotova nit 1\n");
    80003590:	00006517          	auipc	a0,0x6
    80003594:	c6050513          	addi	a0,a0,-928 # 800091f0 <CONSOLE_STATUS+0x1e0>
    80003598:	00002097          	auipc	ra,0x2
    8000359c:	530080e7          	jalr	1328(ra) # 80005ac8 <_Z11printStringPKc>
}
    800035a0:	00813083          	ld	ra,8(sp)
    800035a4:	00013403          	ld	s0,0(sp)
    800035a8:	01010113          	addi	sp,sp,16
    800035ac:	00008067          	ret

00000000800035b0 <_Z5nit2fPv>:

void nit2f(void* arg2) {
    800035b0:	ff010113          	addi	sp,sp,-16
    800035b4:	00113423          	sd	ra,8(sp)
    800035b8:	00813023          	sd	s0,0(sp)
    800035bc:	01010413          	addi	s0,sp,16
//		//sem_close(semA);
//		printString("\nNit 2 ubija semafor\n");
//		delete semA;
//
//	}
	printString("\nGotova nit 2\n");
    800035c0:	00006517          	auipc	a0,0x6
    800035c4:	c4050513          	addi	a0,a0,-960 # 80009200 <CONSOLE_STATUS+0x1f0>
    800035c8:	00002097          	auipc	ra,0x2
    800035cc:	500080e7          	jalr	1280(ra) # 80005ac8 <_Z11printStringPKc>
}
    800035d0:	00813083          	ld	ra,8(sp)
    800035d4:	00013403          	ld	s0,0(sp)
    800035d8:	01010113          	addi	sp,sp,16
    800035dc:	00008067          	ret

00000000800035e0 <_Z5nit3fPv>:


void nit3f(void*) {
    800035e0:	fe010113          	addi	sp,sp,-32
    800035e4:	00113c23          	sd	ra,24(sp)
    800035e8:	00813823          	sd	s0,16(sp)
    800035ec:	00913423          	sd	s1,8(sp)
    800035f0:	02010413          	addi	s0,sp,32
    800035f4:	0180006f          	j	8000360c <_Z5nit3fPv+0x2c>
	char slovo;
	do {
		slovo = getc();
		putc(slovo);
		if (slovo == '\r') putc('\n');
    800035f8:	00a00513          	li	a0,10
    800035fc:	ffffe097          	auipc	ra,0xffffe
    80003600:	f94080e7          	jalr	-108(ra) # 80001590 <_Z4putcc>
	} while (slovo != '0');
    80003604:	03000793          	li	a5,48
    80003608:	02f48263          	beq	s1,a5,8000362c <_Z5nit3fPv+0x4c>
		slovo = getc();
    8000360c:	ffffe097          	auipc	ra,0xffffe
    80003610:	f5c080e7          	jalr	-164(ra) # 80001568 <_Z4getcv>
    80003614:	00050493          	mv	s1,a0
		putc(slovo);
    80003618:	ffffe097          	auipc	ra,0xffffe
    8000361c:	f78080e7          	jalr	-136(ra) # 80001590 <_Z4putcc>
		if (slovo == '\r') putc('\n');
    80003620:	00d00793          	li	a5,13
    80003624:	fef490e3          	bne	s1,a5,80003604 <_Z5nit3fPv+0x24>
    80003628:	fd1ff06f          	j	800035f8 <_Z5nit3fPv+0x18>

	printString("\nGotova nit3\n");
    8000362c:	00006517          	auipc	a0,0x6
    80003630:	be450513          	addi	a0,a0,-1052 # 80009210 <CONSOLE_STATUS+0x200>
    80003634:	00002097          	auipc	ra,0x2
    80003638:	494080e7          	jalr	1172(ra) # 80005ac8 <_Z11printStringPKc>
    8000363c:	01813083          	ld	ra,24(sp)
    80003640:	01013403          	ld	s0,16(sp)
    80003644:	00813483          	ld	s1,8(sp)
    80003648:	02010113          	addi	sp,sp,32
    8000364c:	00008067          	ret

0000000080003650 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80003650:	fe010113          	addi	sp,sp,-32
    80003654:	00113c23          	sd	ra,24(sp)
    80003658:	00813823          	sd	s0,16(sp)
    8000365c:	00913423          	sd	s1,8(sp)
    80003660:	01213023          	sd	s2,0(sp)
    80003664:	02010413          	addi	s0,sp,32
    80003668:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    8000366c:	00000913          	li	s2,0
    80003670:	00c0006f          	j	8000367c <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003674:	ffffe097          	auipc	ra,0xffffe
    80003678:	db4080e7          	jalr	-588(ra) # 80001428 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
    8000367c:	ffffe097          	auipc	ra,0xffffe
    80003680:	eec080e7          	jalr	-276(ra) # 80001568 <_Z4getcv>
    80003684:	0005059b          	sext.w	a1,a0
    80003688:	02d00793          	li	a5,45
    8000368c:	02f58a63          	beq	a1,a5,800036c0 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80003690:	0084b503          	ld	a0,8(s1)
    80003694:	00003097          	auipc	ra,0x3
    80003698:	400080e7          	jalr	1024(ra) # 80006a94 <_ZN6Buffer3putEi>
        i++;
    8000369c:	0019071b          	addiw	a4,s2,1
    800036a0:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800036a4:	0004a683          	lw	a3,0(s1)
    800036a8:	0026979b          	slliw	a5,a3,0x2
    800036ac:	00d787bb          	addw	a5,a5,a3
    800036b0:	0017979b          	slliw	a5,a5,0x1
    800036b4:	02f767bb          	remw	a5,a4,a5
    800036b8:	fc0792e3          	bnez	a5,8000367c <_ZL16producerKeyboardPv+0x2c>
    800036bc:	fb9ff06f          	j	80003674 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    800036c0:	00100793          	li	a5,1
    800036c4:	00008717          	auipc	a4,0x8
    800036c8:	54f72a23          	sw	a5,1364(a4) # 8000bc18 <_ZL9threadEnd>
    data->buffer->put('!');
    800036cc:	02100593          	li	a1,33
    800036d0:	0084b503          	ld	a0,8(s1)
    800036d4:	00003097          	auipc	ra,0x3
    800036d8:	3c0080e7          	jalr	960(ra) # 80006a94 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    800036dc:	0104b503          	ld	a0,16(s1)
    800036e0:	ffffe097          	auipc	ra,0xffffe
    800036e4:	e58080e7          	jalr	-424(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    800036e8:	01813083          	ld	ra,24(sp)
    800036ec:	01013403          	ld	s0,16(sp)
    800036f0:	00813483          	ld	s1,8(sp)
    800036f4:	00013903          	ld	s2,0(sp)
    800036f8:	02010113          	addi	sp,sp,32
    800036fc:	00008067          	ret

0000000080003700 <_ZL8producerPv>:

static void producer(void *arg) {
    80003700:	fe010113          	addi	sp,sp,-32
    80003704:	00113c23          	sd	ra,24(sp)
    80003708:	00813823          	sd	s0,16(sp)
    8000370c:	00913423          	sd	s1,8(sp)
    80003710:	01213023          	sd	s2,0(sp)
    80003714:	02010413          	addi	s0,sp,32
    80003718:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    8000371c:	00000913          	li	s2,0
    80003720:	00c0006f          	j	8000372c <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003724:	ffffe097          	auipc	ra,0xffffe
    80003728:	d04080e7          	jalr	-764(ra) # 80001428 <_Z15thread_dispatchv>
    while (!threadEnd) {
    8000372c:	00008797          	auipc	a5,0x8
    80003730:	4ec7a783          	lw	a5,1260(a5) # 8000bc18 <_ZL9threadEnd>
    80003734:	02079e63          	bnez	a5,80003770 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80003738:	0004a583          	lw	a1,0(s1)
    8000373c:	0305859b          	addiw	a1,a1,48
    80003740:	0084b503          	ld	a0,8(s1)
    80003744:	00003097          	auipc	ra,0x3
    80003748:	350080e7          	jalr	848(ra) # 80006a94 <_ZN6Buffer3putEi>
        i++;
    8000374c:	0019071b          	addiw	a4,s2,1
    80003750:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003754:	0004a683          	lw	a3,0(s1)
    80003758:	0026979b          	slliw	a5,a3,0x2
    8000375c:	00d787bb          	addw	a5,a5,a3
    80003760:	0017979b          	slliw	a5,a5,0x1
    80003764:	02f767bb          	remw	a5,a4,a5
    80003768:	fc0792e3          	bnez	a5,8000372c <_ZL8producerPv+0x2c>
    8000376c:	fb9ff06f          	j	80003724 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80003770:	0104b503          	ld	a0,16(s1)
    80003774:	ffffe097          	auipc	ra,0xffffe
    80003778:	dc4080e7          	jalr	-572(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    8000377c:	01813083          	ld	ra,24(sp)
    80003780:	01013403          	ld	s0,16(sp)
    80003784:	00813483          	ld	s1,8(sp)
    80003788:	00013903          	ld	s2,0(sp)
    8000378c:	02010113          	addi	sp,sp,32
    80003790:	00008067          	ret

0000000080003794 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80003794:	fd010113          	addi	sp,sp,-48
    80003798:	02113423          	sd	ra,40(sp)
    8000379c:	02813023          	sd	s0,32(sp)
    800037a0:	00913c23          	sd	s1,24(sp)
    800037a4:	01213823          	sd	s2,16(sp)
    800037a8:	01313423          	sd	s3,8(sp)
    800037ac:	03010413          	addi	s0,sp,48
    800037b0:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800037b4:	00000993          	li	s3,0
    800037b8:	01c0006f          	j	800037d4 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    800037bc:	ffffe097          	auipc	ra,0xffffe
    800037c0:	c6c080e7          	jalr	-916(ra) # 80001428 <_Z15thread_dispatchv>
    800037c4:	0500006f          	j	80003814 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    800037c8:	00a00513          	li	a0,10
    800037cc:	ffffe097          	auipc	ra,0xffffe
    800037d0:	dc4080e7          	jalr	-572(ra) # 80001590 <_Z4putcc>
    while (!threadEnd) {
    800037d4:	00008797          	auipc	a5,0x8
    800037d8:	4447a783          	lw	a5,1092(a5) # 8000bc18 <_ZL9threadEnd>
    800037dc:	06079063          	bnez	a5,8000383c <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    800037e0:	00893503          	ld	a0,8(s2)
    800037e4:	00003097          	auipc	ra,0x3
    800037e8:	340080e7          	jalr	832(ra) # 80006b24 <_ZN6Buffer3getEv>
        i++;
    800037ec:	0019849b          	addiw	s1,s3,1
    800037f0:	0004899b          	sext.w	s3,s1
        putc(key);
    800037f4:	0ff57513          	andi	a0,a0,255
    800037f8:	ffffe097          	auipc	ra,0xffffe
    800037fc:	d98080e7          	jalr	-616(ra) # 80001590 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80003800:	00092703          	lw	a4,0(s2)
    80003804:	0027179b          	slliw	a5,a4,0x2
    80003808:	00e787bb          	addw	a5,a5,a4
    8000380c:	02f4e7bb          	remw	a5,s1,a5
    80003810:	fa0786e3          	beqz	a5,800037bc <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80003814:	05000793          	li	a5,80
    80003818:	02f4e4bb          	remw	s1,s1,a5
    8000381c:	fa049ce3          	bnez	s1,800037d4 <_ZL8consumerPv+0x40>
    80003820:	fa9ff06f          	j	800037c8 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80003824:	00893503          	ld	a0,8(s2)
    80003828:	00003097          	auipc	ra,0x3
    8000382c:	2fc080e7          	jalr	764(ra) # 80006b24 <_ZN6Buffer3getEv>
        putc(key);
    80003830:	0ff57513          	andi	a0,a0,255
    80003834:	ffffe097          	auipc	ra,0xffffe
    80003838:	d5c080e7          	jalr	-676(ra) # 80001590 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    8000383c:	00893503          	ld	a0,8(s2)
    80003840:	00003097          	auipc	ra,0x3
    80003844:	370080e7          	jalr	880(ra) # 80006bb0 <_ZN6Buffer6getCntEv>
    80003848:	fca04ee3          	bgtz	a0,80003824 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    8000384c:	01093503          	ld	a0,16(s2)
    80003850:	ffffe097          	auipc	ra,0xffffe
    80003854:	ce8080e7          	jalr	-792(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    80003858:	02813083          	ld	ra,40(sp)
    8000385c:	02013403          	ld	s0,32(sp)
    80003860:	01813483          	ld	s1,24(sp)
    80003864:	01013903          	ld	s2,16(sp)
    80003868:	00813983          	ld	s3,8(sp)
    8000386c:	03010113          	addi	sp,sp,48
    80003870:	00008067          	ret

0000000080003874 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80003874:	f9010113          	addi	sp,sp,-112
    80003878:	06113423          	sd	ra,104(sp)
    8000387c:	06813023          	sd	s0,96(sp)
    80003880:	04913c23          	sd	s1,88(sp)
    80003884:	05213823          	sd	s2,80(sp)
    80003888:	05313423          	sd	s3,72(sp)
    8000388c:	05413023          	sd	s4,64(sp)
    80003890:	03513c23          	sd	s5,56(sp)
    80003894:	03613823          	sd	s6,48(sp)
    80003898:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    8000389c:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    800038a0:	00006517          	auipc	a0,0x6
    800038a4:	98050513          	addi	a0,a0,-1664 # 80009220 <CONSOLE_STATUS+0x210>
    800038a8:	00002097          	auipc	ra,0x2
    800038ac:	220080e7          	jalr	544(ra) # 80005ac8 <_Z11printStringPKc>
    getString(input, 30);
    800038b0:	01e00593          	li	a1,30
    800038b4:	fa040493          	addi	s1,s0,-96
    800038b8:	00048513          	mv	a0,s1
    800038bc:	00002097          	auipc	ra,0x2
    800038c0:	294080e7          	jalr	660(ra) # 80005b50 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800038c4:	00048513          	mv	a0,s1
    800038c8:	00002097          	auipc	ra,0x2
    800038cc:	360080e7          	jalr	864(ra) # 80005c28 <_Z11stringToIntPKc>
    800038d0:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    800038d4:	00006517          	auipc	a0,0x6
    800038d8:	96c50513          	addi	a0,a0,-1684 # 80009240 <CONSOLE_STATUS+0x230>
    800038dc:	00002097          	auipc	ra,0x2
    800038e0:	1ec080e7          	jalr	492(ra) # 80005ac8 <_Z11printStringPKc>
    getString(input, 30);
    800038e4:	01e00593          	li	a1,30
    800038e8:	00048513          	mv	a0,s1
    800038ec:	00002097          	auipc	ra,0x2
    800038f0:	264080e7          	jalr	612(ra) # 80005b50 <_Z9getStringPci>
    n = stringToInt(input);
    800038f4:	00048513          	mv	a0,s1
    800038f8:	00002097          	auipc	ra,0x2
    800038fc:	330080e7          	jalr	816(ra) # 80005c28 <_Z11stringToIntPKc>
    80003900:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80003904:	00006517          	auipc	a0,0x6
    80003908:	95c50513          	addi	a0,a0,-1700 # 80009260 <CONSOLE_STATUS+0x250>
    8000390c:	00002097          	auipc	ra,0x2
    80003910:	1bc080e7          	jalr	444(ra) # 80005ac8 <_Z11printStringPKc>
    80003914:	00000613          	li	a2,0
    80003918:	00a00593          	li	a1,10
    8000391c:	00090513          	mv	a0,s2
    80003920:	00002097          	auipc	ra,0x2
    80003924:	358080e7          	jalr	856(ra) # 80005c78 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80003928:	00006517          	auipc	a0,0x6
    8000392c:	95050513          	addi	a0,a0,-1712 # 80009278 <CONSOLE_STATUS+0x268>
    80003930:	00002097          	auipc	ra,0x2
    80003934:	198080e7          	jalr	408(ra) # 80005ac8 <_Z11printStringPKc>
    80003938:	00000613          	li	a2,0
    8000393c:	00a00593          	li	a1,10
    80003940:	00048513          	mv	a0,s1
    80003944:	00002097          	auipc	ra,0x2
    80003948:	334080e7          	jalr	820(ra) # 80005c78 <_Z8printIntiii>
    printString(".\n");
    8000394c:	00006517          	auipc	a0,0x6
    80003950:	94450513          	addi	a0,a0,-1724 # 80009290 <CONSOLE_STATUS+0x280>
    80003954:	00002097          	auipc	ra,0x2
    80003958:	174080e7          	jalr	372(ra) # 80005ac8 <_Z11printStringPKc>
    if(threadNum > n) {
    8000395c:	0324c463          	blt	s1,s2,80003984 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80003960:	03205c63          	blez	s2,80003998 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80003964:	03800513          	li	a0,56
    80003968:	fffff097          	auipc	ra,0xfffff
    8000396c:	d38080e7          	jalr	-712(ra) # 800026a0 <_Znwm>
    80003970:	00050a13          	mv	s4,a0
    80003974:	00048593          	mv	a1,s1
    80003978:	00003097          	auipc	ra,0x3
    8000397c:	080080e7          	jalr	128(ra) # 800069f8 <_ZN6BufferC1Ei>
    80003980:	0300006f          	j	800039b0 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80003984:	00006517          	auipc	a0,0x6
    80003988:	91450513          	addi	a0,a0,-1772 # 80009298 <CONSOLE_STATUS+0x288>
    8000398c:	00002097          	auipc	ra,0x2
    80003990:	13c080e7          	jalr	316(ra) # 80005ac8 <_Z11printStringPKc>
        return;
    80003994:	0140006f          	j	800039a8 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80003998:	00006517          	auipc	a0,0x6
    8000399c:	94050513          	addi	a0,a0,-1728 # 800092d8 <CONSOLE_STATUS+0x2c8>
    800039a0:	00002097          	auipc	ra,0x2
    800039a4:	128080e7          	jalr	296(ra) # 80005ac8 <_Z11printStringPKc>
        return;
    800039a8:	000b0113          	mv	sp,s6
    800039ac:	1500006f          	j	80003afc <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    800039b0:	00000593          	li	a1,0
    800039b4:	00008517          	auipc	a0,0x8
    800039b8:	26c50513          	addi	a0,a0,620 # 8000bc20 <_ZL10waitForAll>
    800039bc:	ffffe097          	auipc	ra,0xffffe
    800039c0:	ae4080e7          	jalr	-1308(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    thread_t threads[threadNum];
    800039c4:	00391793          	slli	a5,s2,0x3
    800039c8:	00f78793          	addi	a5,a5,15
    800039cc:	ff07f793          	andi	a5,a5,-16
    800039d0:	40f10133          	sub	sp,sp,a5
    800039d4:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    800039d8:	0019071b          	addiw	a4,s2,1
    800039dc:	00171793          	slli	a5,a4,0x1
    800039e0:	00e787b3          	add	a5,a5,a4
    800039e4:	00379793          	slli	a5,a5,0x3
    800039e8:	00f78793          	addi	a5,a5,15
    800039ec:	ff07f793          	andi	a5,a5,-16
    800039f0:	40f10133          	sub	sp,sp,a5
    800039f4:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    800039f8:	00191613          	slli	a2,s2,0x1
    800039fc:	012607b3          	add	a5,a2,s2
    80003a00:	00379793          	slli	a5,a5,0x3
    80003a04:	00f987b3          	add	a5,s3,a5
    80003a08:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80003a0c:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80003a10:	00008717          	auipc	a4,0x8
    80003a14:	21073703          	ld	a4,528(a4) # 8000bc20 <_ZL10waitForAll>
    80003a18:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80003a1c:	00078613          	mv	a2,a5
    80003a20:	00000597          	auipc	a1,0x0
    80003a24:	d7458593          	addi	a1,a1,-652 # 80003794 <_ZL8consumerPv>
    80003a28:	f9840513          	addi	a0,s0,-104
    80003a2c:	ffffe097          	auipc	ra,0xffffe
    80003a30:	954080e7          	jalr	-1708(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003a34:	00000493          	li	s1,0
    80003a38:	0280006f          	j	80003a60 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80003a3c:	00000597          	auipc	a1,0x0
    80003a40:	c1458593          	addi	a1,a1,-1004 # 80003650 <_ZL16producerKeyboardPv>
                      data + i);
    80003a44:	00179613          	slli	a2,a5,0x1
    80003a48:	00f60633          	add	a2,a2,a5
    80003a4c:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80003a50:	00c98633          	add	a2,s3,a2
    80003a54:	ffffe097          	auipc	ra,0xffffe
    80003a58:	92c080e7          	jalr	-1748(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003a5c:	0014849b          	addiw	s1,s1,1
    80003a60:	0524d263          	bge	s1,s2,80003aa4 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80003a64:	00149793          	slli	a5,s1,0x1
    80003a68:	009787b3          	add	a5,a5,s1
    80003a6c:	00379793          	slli	a5,a5,0x3
    80003a70:	00f987b3          	add	a5,s3,a5
    80003a74:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80003a78:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80003a7c:	00008717          	auipc	a4,0x8
    80003a80:	1a473703          	ld	a4,420(a4) # 8000bc20 <_ZL10waitForAll>
    80003a84:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80003a88:	00048793          	mv	a5,s1
    80003a8c:	00349513          	slli	a0,s1,0x3
    80003a90:	00aa8533          	add	a0,s5,a0
    80003a94:	fa9054e3          	blez	s1,80003a3c <_Z22producerConsumer_C_APIv+0x1c8>
    80003a98:	00000597          	auipc	a1,0x0
    80003a9c:	c6858593          	addi	a1,a1,-920 # 80003700 <_ZL8producerPv>
    80003aa0:	fa5ff06f          	j	80003a44 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80003aa4:	ffffe097          	auipc	ra,0xffffe
    80003aa8:	984080e7          	jalr	-1660(ra) # 80001428 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80003aac:	00000493          	li	s1,0
    80003ab0:	00994e63          	blt	s2,s1,80003acc <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80003ab4:	00008517          	auipc	a0,0x8
    80003ab8:	16c53503          	ld	a0,364(a0) # 8000bc20 <_ZL10waitForAll>
    80003abc:	ffffe097          	auipc	ra,0xffffe
    80003ac0:	a4c080e7          	jalr	-1460(ra) # 80001508 <_Z8sem_waitP4KSem>
    for (int i = 0; i <= threadNum; i++) {
    80003ac4:	0014849b          	addiw	s1,s1,1
    80003ac8:	fe9ff06f          	j	80003ab0 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80003acc:	00008517          	auipc	a0,0x8
    80003ad0:	15453503          	ld	a0,340(a0) # 8000bc20 <_ZL10waitForAll>
    80003ad4:	ffffe097          	auipc	ra,0xffffe
    80003ad8:	a04080e7          	jalr	-1532(ra) # 800014d8 <_Z9sem_closeP4KSem>
    delete buffer;
    80003adc:	000a0e63          	beqz	s4,80003af8 <_Z22producerConsumer_C_APIv+0x284>
    80003ae0:	000a0513          	mv	a0,s4
    80003ae4:	00003097          	auipc	ra,0x3
    80003ae8:	154080e7          	jalr	340(ra) # 80006c38 <_ZN6BufferD1Ev>
    80003aec:	000a0513          	mv	a0,s4
    80003af0:	fffff097          	auipc	ra,0xfffff
    80003af4:	c00080e7          	jalr	-1024(ra) # 800026f0 <_ZdlPv>
    80003af8:	000b0113          	mv	sp,s6

}
    80003afc:	f9040113          	addi	sp,s0,-112
    80003b00:	06813083          	ld	ra,104(sp)
    80003b04:	06013403          	ld	s0,96(sp)
    80003b08:	05813483          	ld	s1,88(sp)
    80003b0c:	05013903          	ld	s2,80(sp)
    80003b10:	04813983          	ld	s3,72(sp)
    80003b14:	04013a03          	ld	s4,64(sp)
    80003b18:	03813a83          	ld	s5,56(sp)
    80003b1c:	03013b03          	ld	s6,48(sp)
    80003b20:	07010113          	addi	sp,sp,112
    80003b24:	00008067          	ret
    80003b28:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80003b2c:	000a0513          	mv	a0,s4
    80003b30:	fffff097          	auipc	ra,0xfffff
    80003b34:	bc0080e7          	jalr	-1088(ra) # 800026f0 <_ZdlPv>
    80003b38:	00048513          	mv	a0,s1
    80003b3c:	00009097          	auipc	ra,0x9
    80003b40:	1fc080e7          	jalr	508(ra) # 8000cd38 <_Unwind_Resume>

0000000080003b44 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003b44:	fe010113          	addi	sp,sp,-32
    80003b48:	00113c23          	sd	ra,24(sp)
    80003b4c:	00813823          	sd	s0,16(sp)
    80003b50:	00913423          	sd	s1,8(sp)
    80003b54:	01213023          	sd	s2,0(sp)
    80003b58:	02010413          	addi	s0,sp,32
    80003b5c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003b60:	00100793          	li	a5,1
    80003b64:	02a7f863          	bgeu	a5,a0,80003b94 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80003b68:	00a00793          	li	a5,10
    80003b6c:	02f577b3          	remu	a5,a0,a5
    80003b70:	02078e63          	beqz	a5,80003bac <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80003b74:	fff48513          	addi	a0,s1,-1
    80003b78:	00000097          	auipc	ra,0x0
    80003b7c:	fcc080e7          	jalr	-52(ra) # 80003b44 <_ZL9fibonaccim>
    80003b80:	00050913          	mv	s2,a0
    80003b84:	ffe48513          	addi	a0,s1,-2
    80003b88:	00000097          	auipc	ra,0x0
    80003b8c:	fbc080e7          	jalr	-68(ra) # 80003b44 <_ZL9fibonaccim>
    80003b90:	00a90533          	add	a0,s2,a0
}
    80003b94:	01813083          	ld	ra,24(sp)
    80003b98:	01013403          	ld	s0,16(sp)
    80003b9c:	00813483          	ld	s1,8(sp)
    80003ba0:	00013903          	ld	s2,0(sp)
    80003ba4:	02010113          	addi	sp,sp,32
    80003ba8:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80003bac:	ffffe097          	auipc	ra,0xffffe
    80003bb0:	87c080e7          	jalr	-1924(ra) # 80001428 <_Z15thread_dispatchv>
    80003bb4:	fc1ff06f          	j	80003b74 <_ZL9fibonaccim+0x30>

0000000080003bb8 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80003bb8:	fe010113          	addi	sp,sp,-32
    80003bbc:	00113c23          	sd	ra,24(sp)
    80003bc0:	00813823          	sd	s0,16(sp)
    80003bc4:	00913423          	sd	s1,8(sp)
    80003bc8:	01213023          	sd	s2,0(sp)
    80003bcc:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003bd0:	00000913          	li	s2,0
    80003bd4:	0380006f          	j	80003c0c <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003bd8:	ffffe097          	auipc	ra,0xffffe
    80003bdc:	850080e7          	jalr	-1968(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003be0:	00148493          	addi	s1,s1,1
    80003be4:	000027b7          	lui	a5,0x2
    80003be8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003bec:	0097ee63          	bltu	a5,s1,80003c08 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003bf0:	00000713          	li	a4,0
    80003bf4:	000077b7          	lui	a5,0x7
    80003bf8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003bfc:	fce7eee3          	bltu	a5,a4,80003bd8 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80003c00:	00170713          	addi	a4,a4,1
    80003c04:	ff1ff06f          	j	80003bf4 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003c08:	00190913          	addi	s2,s2,1
    80003c0c:	00900793          	li	a5,9
    80003c10:	0527e063          	bltu	a5,s2,80003c50 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003c14:	00005517          	auipc	a0,0x5
    80003c18:	6f450513          	addi	a0,a0,1780 # 80009308 <CONSOLE_STATUS+0x2f8>
    80003c1c:	00002097          	auipc	ra,0x2
    80003c20:	eac080e7          	jalr	-340(ra) # 80005ac8 <_Z11printStringPKc>
    80003c24:	00000613          	li	a2,0
    80003c28:	00a00593          	li	a1,10
    80003c2c:	0009051b          	sext.w	a0,s2
    80003c30:	00002097          	auipc	ra,0x2
    80003c34:	048080e7          	jalr	72(ra) # 80005c78 <_Z8printIntiii>
    80003c38:	00006517          	auipc	a0,0x6
    80003c3c:	93050513          	addi	a0,a0,-1744 # 80009568 <CONSOLE_STATUS+0x558>
    80003c40:	00002097          	auipc	ra,0x2
    80003c44:	e88080e7          	jalr	-376(ra) # 80005ac8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003c48:	00000493          	li	s1,0
    80003c4c:	f99ff06f          	j	80003be4 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003c50:	00005517          	auipc	a0,0x5
    80003c54:	6c050513          	addi	a0,a0,1728 # 80009310 <CONSOLE_STATUS+0x300>
    80003c58:	00002097          	auipc	ra,0x2
    80003c5c:	e70080e7          	jalr	-400(ra) # 80005ac8 <_Z11printStringPKc>
    finishedA = true;
    80003c60:	00100793          	li	a5,1
    80003c64:	00008717          	auipc	a4,0x8
    80003c68:	fcf70223          	sb	a5,-60(a4) # 8000bc28 <_ZL9finishedA>
}
    80003c6c:	01813083          	ld	ra,24(sp)
    80003c70:	01013403          	ld	s0,16(sp)
    80003c74:	00813483          	ld	s1,8(sp)
    80003c78:	00013903          	ld	s2,0(sp)
    80003c7c:	02010113          	addi	sp,sp,32
    80003c80:	00008067          	ret

0000000080003c84 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80003c84:	fe010113          	addi	sp,sp,-32
    80003c88:	00113c23          	sd	ra,24(sp)
    80003c8c:	00813823          	sd	s0,16(sp)
    80003c90:	00913423          	sd	s1,8(sp)
    80003c94:	01213023          	sd	s2,0(sp)
    80003c98:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003c9c:	00000913          	li	s2,0
    80003ca0:	0380006f          	j	80003cd8 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003ca4:	ffffd097          	auipc	ra,0xffffd
    80003ca8:	784080e7          	jalr	1924(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003cac:	00148493          	addi	s1,s1,1
    80003cb0:	000027b7          	lui	a5,0x2
    80003cb4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003cb8:	0097ee63          	bltu	a5,s1,80003cd4 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003cbc:	00000713          	li	a4,0
    80003cc0:	000077b7          	lui	a5,0x7
    80003cc4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003cc8:	fce7eee3          	bltu	a5,a4,80003ca4 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80003ccc:	00170713          	addi	a4,a4,1
    80003cd0:	ff1ff06f          	j	80003cc0 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003cd4:	00190913          	addi	s2,s2,1
    80003cd8:	00f00793          	li	a5,15
    80003cdc:	0527e063          	bltu	a5,s2,80003d1c <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003ce0:	00005517          	auipc	a0,0x5
    80003ce4:	64050513          	addi	a0,a0,1600 # 80009320 <CONSOLE_STATUS+0x310>
    80003ce8:	00002097          	auipc	ra,0x2
    80003cec:	de0080e7          	jalr	-544(ra) # 80005ac8 <_Z11printStringPKc>
    80003cf0:	00000613          	li	a2,0
    80003cf4:	00a00593          	li	a1,10
    80003cf8:	0009051b          	sext.w	a0,s2
    80003cfc:	00002097          	auipc	ra,0x2
    80003d00:	f7c080e7          	jalr	-132(ra) # 80005c78 <_Z8printIntiii>
    80003d04:	00006517          	auipc	a0,0x6
    80003d08:	86450513          	addi	a0,a0,-1948 # 80009568 <CONSOLE_STATUS+0x558>
    80003d0c:	00002097          	auipc	ra,0x2
    80003d10:	dbc080e7          	jalr	-580(ra) # 80005ac8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003d14:	00000493          	li	s1,0
    80003d18:	f99ff06f          	j	80003cb0 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80003d1c:	00005517          	auipc	a0,0x5
    80003d20:	60c50513          	addi	a0,a0,1548 # 80009328 <CONSOLE_STATUS+0x318>
    80003d24:	00002097          	auipc	ra,0x2
    80003d28:	da4080e7          	jalr	-604(ra) # 80005ac8 <_Z11printStringPKc>
    finishedB = true;
    80003d2c:	00100793          	li	a5,1
    80003d30:	00008717          	auipc	a4,0x8
    80003d34:	eef70ca3          	sb	a5,-263(a4) # 8000bc29 <_ZL9finishedB>
    thread_dispatch();
    80003d38:	ffffd097          	auipc	ra,0xffffd
    80003d3c:	6f0080e7          	jalr	1776(ra) # 80001428 <_Z15thread_dispatchv>
}
    80003d40:	01813083          	ld	ra,24(sp)
    80003d44:	01013403          	ld	s0,16(sp)
    80003d48:	00813483          	ld	s1,8(sp)
    80003d4c:	00013903          	ld	s2,0(sp)
    80003d50:	02010113          	addi	sp,sp,32
    80003d54:	00008067          	ret

0000000080003d58 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80003d58:	fe010113          	addi	sp,sp,-32
    80003d5c:	00113c23          	sd	ra,24(sp)
    80003d60:	00813823          	sd	s0,16(sp)
    80003d64:	00913423          	sd	s1,8(sp)
    80003d68:	01213023          	sd	s2,0(sp)
    80003d6c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80003d70:	00000493          	li	s1,0
    80003d74:	0400006f          	j	80003db4 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003d78:	00005517          	auipc	a0,0x5
    80003d7c:	5c050513          	addi	a0,a0,1472 # 80009338 <CONSOLE_STATUS+0x328>
    80003d80:	00002097          	auipc	ra,0x2
    80003d84:	d48080e7          	jalr	-696(ra) # 80005ac8 <_Z11printStringPKc>
    80003d88:	00000613          	li	a2,0
    80003d8c:	00a00593          	li	a1,10
    80003d90:	00048513          	mv	a0,s1
    80003d94:	00002097          	auipc	ra,0x2
    80003d98:	ee4080e7          	jalr	-284(ra) # 80005c78 <_Z8printIntiii>
    80003d9c:	00005517          	auipc	a0,0x5
    80003da0:	7cc50513          	addi	a0,a0,1996 # 80009568 <CONSOLE_STATUS+0x558>
    80003da4:	00002097          	auipc	ra,0x2
    80003da8:	d24080e7          	jalr	-732(ra) # 80005ac8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80003dac:	0014849b          	addiw	s1,s1,1
    80003db0:	0ff4f493          	andi	s1,s1,255
    80003db4:	00200793          	li	a5,2
    80003db8:	fc97f0e3          	bgeu	a5,s1,80003d78 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80003dbc:	00005517          	auipc	a0,0x5
    80003dc0:	58450513          	addi	a0,a0,1412 # 80009340 <CONSOLE_STATUS+0x330>
    80003dc4:	00002097          	auipc	ra,0x2
    80003dc8:	d04080e7          	jalr	-764(ra) # 80005ac8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80003dcc:	00700313          	li	t1,7
    thread_dispatch();
    80003dd0:	ffffd097          	auipc	ra,0xffffd
    80003dd4:	658080e7          	jalr	1624(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80003dd8:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80003ddc:	00005517          	auipc	a0,0x5
    80003de0:	57450513          	addi	a0,a0,1396 # 80009350 <CONSOLE_STATUS+0x340>
    80003de4:	00002097          	auipc	ra,0x2
    80003de8:	ce4080e7          	jalr	-796(ra) # 80005ac8 <_Z11printStringPKc>
    80003dec:	00000613          	li	a2,0
    80003df0:	00a00593          	li	a1,10
    80003df4:	0009051b          	sext.w	a0,s2
    80003df8:	00002097          	auipc	ra,0x2
    80003dfc:	e80080e7          	jalr	-384(ra) # 80005c78 <_Z8printIntiii>
    80003e00:	00005517          	auipc	a0,0x5
    80003e04:	76850513          	addi	a0,a0,1896 # 80009568 <CONSOLE_STATUS+0x558>
    80003e08:	00002097          	auipc	ra,0x2
    80003e0c:	cc0080e7          	jalr	-832(ra) # 80005ac8 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80003e10:	00c00513          	li	a0,12
    80003e14:	00000097          	auipc	ra,0x0
    80003e18:	d30080e7          	jalr	-720(ra) # 80003b44 <_ZL9fibonaccim>
    80003e1c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80003e20:	00005517          	auipc	a0,0x5
    80003e24:	53850513          	addi	a0,a0,1336 # 80009358 <CONSOLE_STATUS+0x348>
    80003e28:	00002097          	auipc	ra,0x2
    80003e2c:	ca0080e7          	jalr	-864(ra) # 80005ac8 <_Z11printStringPKc>
    80003e30:	00000613          	li	a2,0
    80003e34:	00a00593          	li	a1,10
    80003e38:	0009051b          	sext.w	a0,s2
    80003e3c:	00002097          	auipc	ra,0x2
    80003e40:	e3c080e7          	jalr	-452(ra) # 80005c78 <_Z8printIntiii>
    80003e44:	00005517          	auipc	a0,0x5
    80003e48:	72450513          	addi	a0,a0,1828 # 80009568 <CONSOLE_STATUS+0x558>
    80003e4c:	00002097          	auipc	ra,0x2
    80003e50:	c7c080e7          	jalr	-900(ra) # 80005ac8 <_Z11printStringPKc>
    80003e54:	0400006f          	j	80003e94 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003e58:	00005517          	auipc	a0,0x5
    80003e5c:	4e050513          	addi	a0,a0,1248 # 80009338 <CONSOLE_STATUS+0x328>
    80003e60:	00002097          	auipc	ra,0x2
    80003e64:	c68080e7          	jalr	-920(ra) # 80005ac8 <_Z11printStringPKc>
    80003e68:	00000613          	li	a2,0
    80003e6c:	00a00593          	li	a1,10
    80003e70:	00048513          	mv	a0,s1
    80003e74:	00002097          	auipc	ra,0x2
    80003e78:	e04080e7          	jalr	-508(ra) # 80005c78 <_Z8printIntiii>
    80003e7c:	00005517          	auipc	a0,0x5
    80003e80:	6ec50513          	addi	a0,a0,1772 # 80009568 <CONSOLE_STATUS+0x558>
    80003e84:	00002097          	auipc	ra,0x2
    80003e88:	c44080e7          	jalr	-956(ra) # 80005ac8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80003e8c:	0014849b          	addiw	s1,s1,1
    80003e90:	0ff4f493          	andi	s1,s1,255
    80003e94:	00500793          	li	a5,5
    80003e98:	fc97f0e3          	bgeu	a5,s1,80003e58 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("C finished!\n");
    80003e9c:	00005517          	auipc	a0,0x5
    80003ea0:	4cc50513          	addi	a0,a0,1228 # 80009368 <CONSOLE_STATUS+0x358>
    80003ea4:	00002097          	auipc	ra,0x2
    80003ea8:	c24080e7          	jalr	-988(ra) # 80005ac8 <_Z11printStringPKc>
    finishedC = true;
    80003eac:	00100793          	li	a5,1
    80003eb0:	00008717          	auipc	a4,0x8
    80003eb4:	d6f70d23          	sb	a5,-646(a4) # 8000bc2a <_ZL9finishedC>
    thread_dispatch();
    80003eb8:	ffffd097          	auipc	ra,0xffffd
    80003ebc:	570080e7          	jalr	1392(ra) # 80001428 <_Z15thread_dispatchv>
}
    80003ec0:	01813083          	ld	ra,24(sp)
    80003ec4:	01013403          	ld	s0,16(sp)
    80003ec8:	00813483          	ld	s1,8(sp)
    80003ecc:	00013903          	ld	s2,0(sp)
    80003ed0:	02010113          	addi	sp,sp,32
    80003ed4:	00008067          	ret

0000000080003ed8 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80003ed8:	fe010113          	addi	sp,sp,-32
    80003edc:	00113c23          	sd	ra,24(sp)
    80003ee0:	00813823          	sd	s0,16(sp)
    80003ee4:	00913423          	sd	s1,8(sp)
    80003ee8:	01213023          	sd	s2,0(sp)
    80003eec:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80003ef0:	00a00493          	li	s1,10
    80003ef4:	0400006f          	j	80003f34 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003ef8:	00005517          	auipc	a0,0x5
    80003efc:	48050513          	addi	a0,a0,1152 # 80009378 <CONSOLE_STATUS+0x368>
    80003f00:	00002097          	auipc	ra,0x2
    80003f04:	bc8080e7          	jalr	-1080(ra) # 80005ac8 <_Z11printStringPKc>
    80003f08:	00000613          	li	a2,0
    80003f0c:	00a00593          	li	a1,10
    80003f10:	00048513          	mv	a0,s1
    80003f14:	00002097          	auipc	ra,0x2
    80003f18:	d64080e7          	jalr	-668(ra) # 80005c78 <_Z8printIntiii>
    80003f1c:	00005517          	auipc	a0,0x5
    80003f20:	64c50513          	addi	a0,a0,1612 # 80009568 <CONSOLE_STATUS+0x558>
    80003f24:	00002097          	auipc	ra,0x2
    80003f28:	ba4080e7          	jalr	-1116(ra) # 80005ac8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80003f2c:	0014849b          	addiw	s1,s1,1
    80003f30:	0ff4f493          	andi	s1,s1,255
    80003f34:	00c00793          	li	a5,12
    80003f38:	fc97f0e3          	bgeu	a5,s1,80003ef8 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80003f3c:	00005517          	auipc	a0,0x5
    80003f40:	44450513          	addi	a0,a0,1092 # 80009380 <CONSOLE_STATUS+0x370>
    80003f44:	00002097          	auipc	ra,0x2
    80003f48:	b84080e7          	jalr	-1148(ra) # 80005ac8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80003f4c:	00500313          	li	t1,5
    thread_dispatch();
    80003f50:	ffffd097          	auipc	ra,0xffffd
    80003f54:	4d8080e7          	jalr	1240(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80003f58:	01000513          	li	a0,16
    80003f5c:	00000097          	auipc	ra,0x0
    80003f60:	be8080e7          	jalr	-1048(ra) # 80003b44 <_ZL9fibonaccim>
    80003f64:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80003f68:	00005517          	auipc	a0,0x5
    80003f6c:	42850513          	addi	a0,a0,1064 # 80009390 <CONSOLE_STATUS+0x380>
    80003f70:	00002097          	auipc	ra,0x2
    80003f74:	b58080e7          	jalr	-1192(ra) # 80005ac8 <_Z11printStringPKc>
    80003f78:	00000613          	li	a2,0
    80003f7c:	00a00593          	li	a1,10
    80003f80:	0009051b          	sext.w	a0,s2
    80003f84:	00002097          	auipc	ra,0x2
    80003f88:	cf4080e7          	jalr	-780(ra) # 80005c78 <_Z8printIntiii>
    80003f8c:	00005517          	auipc	a0,0x5
    80003f90:	5dc50513          	addi	a0,a0,1500 # 80009568 <CONSOLE_STATUS+0x558>
    80003f94:	00002097          	auipc	ra,0x2
    80003f98:	b34080e7          	jalr	-1228(ra) # 80005ac8 <_Z11printStringPKc>
    80003f9c:	0400006f          	j	80003fdc <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003fa0:	00005517          	auipc	a0,0x5
    80003fa4:	3d850513          	addi	a0,a0,984 # 80009378 <CONSOLE_STATUS+0x368>
    80003fa8:	00002097          	auipc	ra,0x2
    80003fac:	b20080e7          	jalr	-1248(ra) # 80005ac8 <_Z11printStringPKc>
    80003fb0:	00000613          	li	a2,0
    80003fb4:	00a00593          	li	a1,10
    80003fb8:	00048513          	mv	a0,s1
    80003fbc:	00002097          	auipc	ra,0x2
    80003fc0:	cbc080e7          	jalr	-836(ra) # 80005c78 <_Z8printIntiii>
    80003fc4:	00005517          	auipc	a0,0x5
    80003fc8:	5a450513          	addi	a0,a0,1444 # 80009568 <CONSOLE_STATUS+0x558>
    80003fcc:	00002097          	auipc	ra,0x2
    80003fd0:	afc080e7          	jalr	-1284(ra) # 80005ac8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80003fd4:	0014849b          	addiw	s1,s1,1
    80003fd8:	0ff4f493          	andi	s1,s1,255
    80003fdc:	00f00793          	li	a5,15
    80003fe0:	fc97f0e3          	bgeu	a5,s1,80003fa0 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80003fe4:	00005517          	auipc	a0,0x5
    80003fe8:	3bc50513          	addi	a0,a0,956 # 800093a0 <CONSOLE_STATUS+0x390>
    80003fec:	00002097          	auipc	ra,0x2
    80003ff0:	adc080e7          	jalr	-1316(ra) # 80005ac8 <_Z11printStringPKc>
    finishedD = true;
    80003ff4:	00100793          	li	a5,1
    80003ff8:	00008717          	auipc	a4,0x8
    80003ffc:	c2f709a3          	sb	a5,-973(a4) # 8000bc2b <_ZL9finishedD>
    thread_dispatch();
    80004000:	ffffd097          	auipc	ra,0xffffd
    80004004:	428080e7          	jalr	1064(ra) # 80001428 <_Z15thread_dispatchv>
}
    80004008:	01813083          	ld	ra,24(sp)
    8000400c:	01013403          	ld	s0,16(sp)
    80004010:	00813483          	ld	s1,8(sp)
    80004014:	00013903          	ld	s2,0(sp)
    80004018:	02010113          	addi	sp,sp,32
    8000401c:	00008067          	ret

0000000080004020 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80004020:	fc010113          	addi	sp,sp,-64
    80004024:	02113c23          	sd	ra,56(sp)
    80004028:	02813823          	sd	s0,48(sp)
    8000402c:	02913423          	sd	s1,40(sp)
    80004030:	03213023          	sd	s2,32(sp)
    80004034:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80004038:	02000513          	li	a0,32
    8000403c:	ffffe097          	auipc	ra,0xffffe
    80004040:	664080e7          	jalr	1636(ra) # 800026a0 <_Znwm>
    80004044:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80004048:	fffff097          	auipc	ra,0xfffff
    8000404c:	8d0080e7          	jalr	-1840(ra) # 80002918 <_ZN6ThreadC1Ev>
    80004050:	00008797          	auipc	a5,0x8
    80004054:	89078793          	addi	a5,a5,-1904 # 8000b8e0 <_ZTV7WorkerA+0x10>
    80004058:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    8000405c:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80004060:	00005517          	auipc	a0,0x5
    80004064:	35050513          	addi	a0,a0,848 # 800093b0 <CONSOLE_STATUS+0x3a0>
    80004068:	00002097          	auipc	ra,0x2
    8000406c:	a60080e7          	jalr	-1440(ra) # 80005ac8 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80004070:	02000513          	li	a0,32
    80004074:	ffffe097          	auipc	ra,0xffffe
    80004078:	62c080e7          	jalr	1580(ra) # 800026a0 <_Znwm>
    8000407c:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80004080:	fffff097          	auipc	ra,0xfffff
    80004084:	898080e7          	jalr	-1896(ra) # 80002918 <_ZN6ThreadC1Ev>
    80004088:	00008797          	auipc	a5,0x8
    8000408c:	88078793          	addi	a5,a5,-1920 # 8000b908 <_ZTV7WorkerB+0x10>
    80004090:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80004094:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80004098:	00005517          	auipc	a0,0x5
    8000409c:	33050513          	addi	a0,a0,816 # 800093c8 <CONSOLE_STATUS+0x3b8>
    800040a0:	00002097          	auipc	ra,0x2
    800040a4:	a28080e7          	jalr	-1496(ra) # 80005ac8 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    800040a8:	02000513          	li	a0,32
    800040ac:	ffffe097          	auipc	ra,0xffffe
    800040b0:	5f4080e7          	jalr	1524(ra) # 800026a0 <_Znwm>
    800040b4:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    800040b8:	fffff097          	auipc	ra,0xfffff
    800040bc:	860080e7          	jalr	-1952(ra) # 80002918 <_ZN6ThreadC1Ev>
    800040c0:	00008797          	auipc	a5,0x8
    800040c4:	87078793          	addi	a5,a5,-1936 # 8000b930 <_ZTV7WorkerC+0x10>
    800040c8:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    800040cc:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    800040d0:	00005517          	auipc	a0,0x5
    800040d4:	31050513          	addi	a0,a0,784 # 800093e0 <CONSOLE_STATUS+0x3d0>
    800040d8:	00002097          	auipc	ra,0x2
    800040dc:	9f0080e7          	jalr	-1552(ra) # 80005ac8 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    800040e0:	02000513          	li	a0,32
    800040e4:	ffffe097          	auipc	ra,0xffffe
    800040e8:	5bc080e7          	jalr	1468(ra) # 800026a0 <_Znwm>
    800040ec:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    800040f0:	fffff097          	auipc	ra,0xfffff
    800040f4:	828080e7          	jalr	-2008(ra) # 80002918 <_ZN6ThreadC1Ev>
    800040f8:	00008797          	auipc	a5,0x8
    800040fc:	86078793          	addi	a5,a5,-1952 # 8000b958 <_ZTV7WorkerD+0x10>
    80004100:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80004104:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80004108:	00005517          	auipc	a0,0x5
    8000410c:	2f050513          	addi	a0,a0,752 # 800093f8 <CONSOLE_STATUS+0x3e8>
    80004110:	00002097          	auipc	ra,0x2
    80004114:	9b8080e7          	jalr	-1608(ra) # 80005ac8 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80004118:	00000493          	li	s1,0
    8000411c:	00300793          	li	a5,3
    80004120:	0297c663          	blt	a5,s1,8000414c <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80004124:	00349793          	slli	a5,s1,0x3
    80004128:	fe040713          	addi	a4,s0,-32
    8000412c:	00f707b3          	add	a5,a4,a5
    80004130:	fe07b503          	ld	a0,-32(a5)
    80004134:	ffffe097          	auipc	ra,0xffffe
    80004138:	71c080e7          	jalr	1820(ra) # 80002850 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    8000413c:	0014849b          	addiw	s1,s1,1
    80004140:	fddff06f          	j	8000411c <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80004144:	ffffe097          	auipc	ra,0xffffe
    80004148:	770080e7          	jalr	1904(ra) # 800028b4 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    8000414c:	00008797          	auipc	a5,0x8
    80004150:	adc7c783          	lbu	a5,-1316(a5) # 8000bc28 <_ZL9finishedA>
    80004154:	fe0788e3          	beqz	a5,80004144 <_Z20Threads_CPP_API_testv+0x124>
    80004158:	00008797          	auipc	a5,0x8
    8000415c:	ad17c783          	lbu	a5,-1327(a5) # 8000bc29 <_ZL9finishedB>
    80004160:	fe0782e3          	beqz	a5,80004144 <_Z20Threads_CPP_API_testv+0x124>
    80004164:	00008797          	auipc	a5,0x8
    80004168:	ac67c783          	lbu	a5,-1338(a5) # 8000bc2a <_ZL9finishedC>
    8000416c:	fc078ce3          	beqz	a5,80004144 <_Z20Threads_CPP_API_testv+0x124>
    80004170:	00008797          	auipc	a5,0x8
    80004174:	abb7c783          	lbu	a5,-1349(a5) # 8000bc2b <_ZL9finishedD>
    80004178:	fc0786e3          	beqz	a5,80004144 <_Z20Threads_CPP_API_testv+0x124>
    8000417c:	fc040493          	addi	s1,s0,-64
    80004180:	0080006f          	j	80004188 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) {
    80004184:	00848493          	addi	s1,s1,8
    80004188:	fe040793          	addi	a5,s0,-32
    8000418c:	08f48663          	beq	s1,a5,80004218 <_Z20Threads_CPP_API_testv+0x1f8>
    80004190:	0004b503          	ld	a0,0(s1)
		delete thread;
    80004194:	fe0508e3          	beqz	a0,80004184 <_Z20Threads_CPP_API_testv+0x164>
    80004198:	00053783          	ld	a5,0(a0)
    8000419c:	0087b783          	ld	a5,8(a5)
    800041a0:	000780e7          	jalr	a5
    800041a4:	fe1ff06f          	j	80004184 <_Z20Threads_CPP_API_testv+0x164>
    800041a8:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    800041ac:	00048513          	mv	a0,s1
    800041b0:	ffffe097          	auipc	ra,0xffffe
    800041b4:	540080e7          	jalr	1344(ra) # 800026f0 <_ZdlPv>
    800041b8:	00090513          	mv	a0,s2
    800041bc:	00009097          	auipc	ra,0x9
    800041c0:	b7c080e7          	jalr	-1156(ra) # 8000cd38 <_Unwind_Resume>
    800041c4:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    800041c8:	00048513          	mv	a0,s1
    800041cc:	ffffe097          	auipc	ra,0xffffe
    800041d0:	524080e7          	jalr	1316(ra) # 800026f0 <_ZdlPv>
    800041d4:	00090513          	mv	a0,s2
    800041d8:	00009097          	auipc	ra,0x9
    800041dc:	b60080e7          	jalr	-1184(ra) # 8000cd38 <_Unwind_Resume>
    800041e0:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    800041e4:	00048513          	mv	a0,s1
    800041e8:	ffffe097          	auipc	ra,0xffffe
    800041ec:	508080e7          	jalr	1288(ra) # 800026f0 <_ZdlPv>
    800041f0:	00090513          	mv	a0,s2
    800041f4:	00009097          	auipc	ra,0x9
    800041f8:	b44080e7          	jalr	-1212(ra) # 8000cd38 <_Unwind_Resume>
    800041fc:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80004200:	00048513          	mv	a0,s1
    80004204:	ffffe097          	auipc	ra,0xffffe
    80004208:	4ec080e7          	jalr	1260(ra) # 800026f0 <_ZdlPv>
    8000420c:	00090513          	mv	a0,s2
    80004210:	00009097          	auipc	ra,0x9
    80004214:	b28080e7          	jalr	-1240(ra) # 8000cd38 <_Unwind_Resume>
	}
}
    80004218:	03813083          	ld	ra,56(sp)
    8000421c:	03013403          	ld	s0,48(sp)
    80004220:	02813483          	ld	s1,40(sp)
    80004224:	02013903          	ld	s2,32(sp)
    80004228:	04010113          	addi	sp,sp,64
    8000422c:	00008067          	ret

0000000080004230 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80004230:	ff010113          	addi	sp,sp,-16
    80004234:	00113423          	sd	ra,8(sp)
    80004238:	00813023          	sd	s0,0(sp)
    8000423c:	01010413          	addi	s0,sp,16
    80004240:	00007797          	auipc	a5,0x7
    80004244:	6a078793          	addi	a5,a5,1696 # 8000b8e0 <_ZTV7WorkerA+0x10>
    80004248:	00f53023          	sd	a5,0(a0)
    8000424c:	ffffe097          	auipc	ra,0xffffe
    80004250:	364080e7          	jalr	868(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80004254:	00813083          	ld	ra,8(sp)
    80004258:	00013403          	ld	s0,0(sp)
    8000425c:	01010113          	addi	sp,sp,16
    80004260:	00008067          	ret

0000000080004264 <_ZN7WorkerAD0Ev>:
    80004264:	fe010113          	addi	sp,sp,-32
    80004268:	00113c23          	sd	ra,24(sp)
    8000426c:	00813823          	sd	s0,16(sp)
    80004270:	00913423          	sd	s1,8(sp)
    80004274:	02010413          	addi	s0,sp,32
    80004278:	00050493          	mv	s1,a0
    8000427c:	00007797          	auipc	a5,0x7
    80004280:	66478793          	addi	a5,a5,1636 # 8000b8e0 <_ZTV7WorkerA+0x10>
    80004284:	00f53023          	sd	a5,0(a0)
    80004288:	ffffe097          	auipc	ra,0xffffe
    8000428c:	328080e7          	jalr	808(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80004290:	00048513          	mv	a0,s1
    80004294:	ffffe097          	auipc	ra,0xffffe
    80004298:	45c080e7          	jalr	1116(ra) # 800026f0 <_ZdlPv>
    8000429c:	01813083          	ld	ra,24(sp)
    800042a0:	01013403          	ld	s0,16(sp)
    800042a4:	00813483          	ld	s1,8(sp)
    800042a8:	02010113          	addi	sp,sp,32
    800042ac:	00008067          	ret

00000000800042b0 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    800042b0:	ff010113          	addi	sp,sp,-16
    800042b4:	00113423          	sd	ra,8(sp)
    800042b8:	00813023          	sd	s0,0(sp)
    800042bc:	01010413          	addi	s0,sp,16
    800042c0:	00007797          	auipc	a5,0x7
    800042c4:	64878793          	addi	a5,a5,1608 # 8000b908 <_ZTV7WorkerB+0x10>
    800042c8:	00f53023          	sd	a5,0(a0)
    800042cc:	ffffe097          	auipc	ra,0xffffe
    800042d0:	2e4080e7          	jalr	740(ra) # 800025b0 <_ZN6ThreadD1Ev>
    800042d4:	00813083          	ld	ra,8(sp)
    800042d8:	00013403          	ld	s0,0(sp)
    800042dc:	01010113          	addi	sp,sp,16
    800042e0:	00008067          	ret

00000000800042e4 <_ZN7WorkerBD0Ev>:
    800042e4:	fe010113          	addi	sp,sp,-32
    800042e8:	00113c23          	sd	ra,24(sp)
    800042ec:	00813823          	sd	s0,16(sp)
    800042f0:	00913423          	sd	s1,8(sp)
    800042f4:	02010413          	addi	s0,sp,32
    800042f8:	00050493          	mv	s1,a0
    800042fc:	00007797          	auipc	a5,0x7
    80004300:	60c78793          	addi	a5,a5,1548 # 8000b908 <_ZTV7WorkerB+0x10>
    80004304:	00f53023          	sd	a5,0(a0)
    80004308:	ffffe097          	auipc	ra,0xffffe
    8000430c:	2a8080e7          	jalr	680(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80004310:	00048513          	mv	a0,s1
    80004314:	ffffe097          	auipc	ra,0xffffe
    80004318:	3dc080e7          	jalr	988(ra) # 800026f0 <_ZdlPv>
    8000431c:	01813083          	ld	ra,24(sp)
    80004320:	01013403          	ld	s0,16(sp)
    80004324:	00813483          	ld	s1,8(sp)
    80004328:	02010113          	addi	sp,sp,32
    8000432c:	00008067          	ret

0000000080004330 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80004330:	ff010113          	addi	sp,sp,-16
    80004334:	00113423          	sd	ra,8(sp)
    80004338:	00813023          	sd	s0,0(sp)
    8000433c:	01010413          	addi	s0,sp,16
    80004340:	00007797          	auipc	a5,0x7
    80004344:	5f078793          	addi	a5,a5,1520 # 8000b930 <_ZTV7WorkerC+0x10>
    80004348:	00f53023          	sd	a5,0(a0)
    8000434c:	ffffe097          	auipc	ra,0xffffe
    80004350:	264080e7          	jalr	612(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80004354:	00813083          	ld	ra,8(sp)
    80004358:	00013403          	ld	s0,0(sp)
    8000435c:	01010113          	addi	sp,sp,16
    80004360:	00008067          	ret

0000000080004364 <_ZN7WorkerCD0Ev>:
    80004364:	fe010113          	addi	sp,sp,-32
    80004368:	00113c23          	sd	ra,24(sp)
    8000436c:	00813823          	sd	s0,16(sp)
    80004370:	00913423          	sd	s1,8(sp)
    80004374:	02010413          	addi	s0,sp,32
    80004378:	00050493          	mv	s1,a0
    8000437c:	00007797          	auipc	a5,0x7
    80004380:	5b478793          	addi	a5,a5,1460 # 8000b930 <_ZTV7WorkerC+0x10>
    80004384:	00f53023          	sd	a5,0(a0)
    80004388:	ffffe097          	auipc	ra,0xffffe
    8000438c:	228080e7          	jalr	552(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80004390:	00048513          	mv	a0,s1
    80004394:	ffffe097          	auipc	ra,0xffffe
    80004398:	35c080e7          	jalr	860(ra) # 800026f0 <_ZdlPv>
    8000439c:	01813083          	ld	ra,24(sp)
    800043a0:	01013403          	ld	s0,16(sp)
    800043a4:	00813483          	ld	s1,8(sp)
    800043a8:	02010113          	addi	sp,sp,32
    800043ac:	00008067          	ret

00000000800043b0 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    800043b0:	ff010113          	addi	sp,sp,-16
    800043b4:	00113423          	sd	ra,8(sp)
    800043b8:	00813023          	sd	s0,0(sp)
    800043bc:	01010413          	addi	s0,sp,16
    800043c0:	00007797          	auipc	a5,0x7
    800043c4:	59878793          	addi	a5,a5,1432 # 8000b958 <_ZTV7WorkerD+0x10>
    800043c8:	00f53023          	sd	a5,0(a0)
    800043cc:	ffffe097          	auipc	ra,0xffffe
    800043d0:	1e4080e7          	jalr	484(ra) # 800025b0 <_ZN6ThreadD1Ev>
    800043d4:	00813083          	ld	ra,8(sp)
    800043d8:	00013403          	ld	s0,0(sp)
    800043dc:	01010113          	addi	sp,sp,16
    800043e0:	00008067          	ret

00000000800043e4 <_ZN7WorkerDD0Ev>:
    800043e4:	fe010113          	addi	sp,sp,-32
    800043e8:	00113c23          	sd	ra,24(sp)
    800043ec:	00813823          	sd	s0,16(sp)
    800043f0:	00913423          	sd	s1,8(sp)
    800043f4:	02010413          	addi	s0,sp,32
    800043f8:	00050493          	mv	s1,a0
    800043fc:	00007797          	auipc	a5,0x7
    80004400:	55c78793          	addi	a5,a5,1372 # 8000b958 <_ZTV7WorkerD+0x10>
    80004404:	00f53023          	sd	a5,0(a0)
    80004408:	ffffe097          	auipc	ra,0xffffe
    8000440c:	1a8080e7          	jalr	424(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80004410:	00048513          	mv	a0,s1
    80004414:	ffffe097          	auipc	ra,0xffffe
    80004418:	2dc080e7          	jalr	732(ra) # 800026f0 <_ZdlPv>
    8000441c:	01813083          	ld	ra,24(sp)
    80004420:	01013403          	ld	s0,16(sp)
    80004424:	00813483          	ld	s1,8(sp)
    80004428:	02010113          	addi	sp,sp,32
    8000442c:	00008067          	ret

0000000080004430 <_ZN7WorkerA3runEv>:
    void run() override {
    80004430:	ff010113          	addi	sp,sp,-16
    80004434:	00113423          	sd	ra,8(sp)
    80004438:	00813023          	sd	s0,0(sp)
    8000443c:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80004440:	00000593          	li	a1,0
    80004444:	fffff097          	auipc	ra,0xfffff
    80004448:	774080e7          	jalr	1908(ra) # 80003bb8 <_ZN7WorkerA11workerBodyAEPv>
    }
    8000444c:	00813083          	ld	ra,8(sp)
    80004450:	00013403          	ld	s0,0(sp)
    80004454:	01010113          	addi	sp,sp,16
    80004458:	00008067          	ret

000000008000445c <_ZN7WorkerB3runEv>:
    void run() override {
    8000445c:	ff010113          	addi	sp,sp,-16
    80004460:	00113423          	sd	ra,8(sp)
    80004464:	00813023          	sd	s0,0(sp)
    80004468:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    8000446c:	00000593          	li	a1,0
    80004470:	00000097          	auipc	ra,0x0
    80004474:	814080e7          	jalr	-2028(ra) # 80003c84 <_ZN7WorkerB11workerBodyBEPv>
    }
    80004478:	00813083          	ld	ra,8(sp)
    8000447c:	00013403          	ld	s0,0(sp)
    80004480:	01010113          	addi	sp,sp,16
    80004484:	00008067          	ret

0000000080004488 <_ZN7WorkerC3runEv>:
    void run() override {
    80004488:	ff010113          	addi	sp,sp,-16
    8000448c:	00113423          	sd	ra,8(sp)
    80004490:	00813023          	sd	s0,0(sp)
    80004494:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80004498:	00000593          	li	a1,0
    8000449c:	00000097          	auipc	ra,0x0
    800044a0:	8bc080e7          	jalr	-1860(ra) # 80003d58 <_ZN7WorkerC11workerBodyCEPv>
    }
    800044a4:	00813083          	ld	ra,8(sp)
    800044a8:	00013403          	ld	s0,0(sp)
    800044ac:	01010113          	addi	sp,sp,16
    800044b0:	00008067          	ret

00000000800044b4 <_ZN7WorkerD3runEv>:
    void run() override {
    800044b4:	ff010113          	addi	sp,sp,-16
    800044b8:	00113423          	sd	ra,8(sp)
    800044bc:	00813023          	sd	s0,0(sp)
    800044c0:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    800044c4:	00000593          	li	a1,0
    800044c8:	00000097          	auipc	ra,0x0
    800044cc:	a10080e7          	jalr	-1520(ra) # 80003ed8 <_ZN7WorkerD11workerBodyDEPv>
    }
    800044d0:	00813083          	ld	ra,8(sp)
    800044d4:	00013403          	ld	s0,0(sp)
    800044d8:	01010113          	addi	sp,sp,16
    800044dc:	00008067          	ret

00000000800044e0 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    800044e0:	f8010113          	addi	sp,sp,-128
    800044e4:	06113c23          	sd	ra,120(sp)
    800044e8:	06813823          	sd	s0,112(sp)
    800044ec:	06913423          	sd	s1,104(sp)
    800044f0:	07213023          	sd	s2,96(sp)
    800044f4:	05313c23          	sd	s3,88(sp)
    800044f8:	05413823          	sd	s4,80(sp)
    800044fc:	05513423          	sd	s5,72(sp)
    80004500:	05613023          	sd	s6,64(sp)
    80004504:	03713c23          	sd	s7,56(sp)
    80004508:	03813823          	sd	s8,48(sp)
    8000450c:	03913423          	sd	s9,40(sp)
    80004510:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    80004514:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    80004518:	00005517          	auipc	a0,0x5
    8000451c:	d0850513          	addi	a0,a0,-760 # 80009220 <CONSOLE_STATUS+0x210>
    80004520:	00001097          	auipc	ra,0x1
    80004524:	5a8080e7          	jalr	1448(ra) # 80005ac8 <_Z11printStringPKc>
    getString(input, 30);
    80004528:	01e00593          	li	a1,30
    8000452c:	f8040493          	addi	s1,s0,-128
    80004530:	00048513          	mv	a0,s1
    80004534:	00001097          	auipc	ra,0x1
    80004538:	61c080e7          	jalr	1564(ra) # 80005b50 <_Z9getStringPci>
    threadNum = stringToInt(input);
    8000453c:	00048513          	mv	a0,s1
    80004540:	00001097          	auipc	ra,0x1
    80004544:	6e8080e7          	jalr	1768(ra) # 80005c28 <_Z11stringToIntPKc>
    80004548:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    8000454c:	00005517          	auipc	a0,0x5
    80004550:	cf450513          	addi	a0,a0,-780 # 80009240 <CONSOLE_STATUS+0x230>
    80004554:	00001097          	auipc	ra,0x1
    80004558:	574080e7          	jalr	1396(ra) # 80005ac8 <_Z11printStringPKc>
    getString(input, 30);
    8000455c:	01e00593          	li	a1,30
    80004560:	00048513          	mv	a0,s1
    80004564:	00001097          	auipc	ra,0x1
    80004568:	5ec080e7          	jalr	1516(ra) # 80005b50 <_Z9getStringPci>
    n = stringToInt(input);
    8000456c:	00048513          	mv	a0,s1
    80004570:	00001097          	auipc	ra,0x1
    80004574:	6b8080e7          	jalr	1720(ra) # 80005c28 <_Z11stringToIntPKc>
    80004578:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    8000457c:	00005517          	auipc	a0,0x5
    80004580:	ce450513          	addi	a0,a0,-796 # 80009260 <CONSOLE_STATUS+0x250>
    80004584:	00001097          	auipc	ra,0x1
    80004588:	544080e7          	jalr	1348(ra) # 80005ac8 <_Z11printStringPKc>
    printInt(threadNum);
    8000458c:	00000613          	li	a2,0
    80004590:	00a00593          	li	a1,10
    80004594:	00098513          	mv	a0,s3
    80004598:	00001097          	auipc	ra,0x1
    8000459c:	6e0080e7          	jalr	1760(ra) # 80005c78 <_Z8printIntiii>
    printString(" i velicina bafera ");
    800045a0:	00005517          	auipc	a0,0x5
    800045a4:	cd850513          	addi	a0,a0,-808 # 80009278 <CONSOLE_STATUS+0x268>
    800045a8:	00001097          	auipc	ra,0x1
    800045ac:	520080e7          	jalr	1312(ra) # 80005ac8 <_Z11printStringPKc>
    printInt(n);
    800045b0:	00000613          	li	a2,0
    800045b4:	00a00593          	li	a1,10
    800045b8:	00048513          	mv	a0,s1
    800045bc:	00001097          	auipc	ra,0x1
    800045c0:	6bc080e7          	jalr	1724(ra) # 80005c78 <_Z8printIntiii>
    printString(".\n");
    800045c4:	00005517          	auipc	a0,0x5
    800045c8:	ccc50513          	addi	a0,a0,-820 # 80009290 <CONSOLE_STATUS+0x280>
    800045cc:	00001097          	auipc	ra,0x1
    800045d0:	4fc080e7          	jalr	1276(ra) # 80005ac8 <_Z11printStringPKc>
    if (threadNum > n) {
    800045d4:	0334c463          	blt	s1,s3,800045fc <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    800045d8:	03305c63          	blez	s3,80004610 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    800045dc:	03800513          	li	a0,56
    800045e0:	ffffe097          	auipc	ra,0xffffe
    800045e4:	0c0080e7          	jalr	192(ra) # 800026a0 <_Znwm>
    800045e8:	00050a93          	mv	s5,a0
    800045ec:	00048593          	mv	a1,s1
    800045f0:	00001097          	auipc	ra,0x1
    800045f4:	7a8080e7          	jalr	1960(ra) # 80005d98 <_ZN9BufferCPPC1Ei>
    800045f8:	0300006f          	j	80004628 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800045fc:	00005517          	auipc	a0,0x5
    80004600:	c9c50513          	addi	a0,a0,-868 # 80009298 <CONSOLE_STATUS+0x288>
    80004604:	00001097          	auipc	ra,0x1
    80004608:	4c4080e7          	jalr	1220(ra) # 80005ac8 <_Z11printStringPKc>
        return;
    8000460c:	0140006f          	j	80004620 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80004610:	00005517          	auipc	a0,0x5
    80004614:	cc850513          	addi	a0,a0,-824 # 800092d8 <CONSOLE_STATUS+0x2c8>
    80004618:	00001097          	auipc	ra,0x1
    8000461c:	4b0080e7          	jalr	1200(ra) # 80005ac8 <_Z11printStringPKc>
        return;
    80004620:	000c0113          	mv	sp,s8
    80004624:	2140006f          	j	80004838 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    80004628:	01000513          	li	a0,16
    8000462c:	ffffe097          	auipc	ra,0xffffe
    80004630:	074080e7          	jalr	116(ra) # 800026a0 <_Znwm>
    80004634:	00050913          	mv	s2,a0
    80004638:	00000593          	li	a1,0
    8000463c:	ffffe097          	auipc	ra,0xffffe
    80004640:	358080e7          	jalr	856(ra) # 80002994 <_ZN9SemaphoreC1Ej>
    80004644:	00007797          	auipc	a5,0x7
    80004648:	5f27ba23          	sd	s2,1524(a5) # 8000bc38 <_ZL10waitForAll>
    Thread *producers[threadNum];
    8000464c:	00399793          	slli	a5,s3,0x3
    80004650:	00f78793          	addi	a5,a5,15
    80004654:	ff07f793          	andi	a5,a5,-16
    80004658:	40f10133          	sub	sp,sp,a5
    8000465c:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80004660:	0019871b          	addiw	a4,s3,1
    80004664:	00171793          	slli	a5,a4,0x1
    80004668:	00e787b3          	add	a5,a5,a4
    8000466c:	00379793          	slli	a5,a5,0x3
    80004670:	00f78793          	addi	a5,a5,15
    80004674:	ff07f793          	andi	a5,a5,-16
    80004678:	40f10133          	sub	sp,sp,a5
    8000467c:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80004680:	00199493          	slli	s1,s3,0x1
    80004684:	013484b3          	add	s1,s1,s3
    80004688:	00349493          	slli	s1,s1,0x3
    8000468c:	009b04b3          	add	s1,s6,s1
    80004690:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80004694:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80004698:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    8000469c:	02800513          	li	a0,40
    800046a0:	ffffe097          	auipc	ra,0xffffe
    800046a4:	000080e7          	jalr	ra # 800026a0 <_Znwm>
    800046a8:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    800046ac:	ffffe097          	auipc	ra,0xffffe
    800046b0:	26c080e7          	jalr	620(ra) # 80002918 <_ZN6ThreadC1Ev>
    800046b4:	00007797          	auipc	a5,0x7
    800046b8:	31c78793          	addi	a5,a5,796 # 8000b9d0 <_ZTV8Consumer+0x10>
    800046bc:	00fbb023          	sd	a5,0(s7)
    800046c0:	029bb023          	sd	s1,32(s7)
    consumer->start();
    800046c4:	000b8513          	mv	a0,s7
    800046c8:	ffffe097          	auipc	ra,0xffffe
    800046cc:	188080e7          	jalr	392(ra) # 80002850 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    800046d0:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    800046d4:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    800046d8:	00007797          	auipc	a5,0x7
    800046dc:	5607b783          	ld	a5,1376(a5) # 8000bc38 <_ZL10waitForAll>
    800046e0:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800046e4:	02800513          	li	a0,40
    800046e8:	ffffe097          	auipc	ra,0xffffe
    800046ec:	fb8080e7          	jalr	-72(ra) # 800026a0 <_Znwm>
    800046f0:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    800046f4:	ffffe097          	auipc	ra,0xffffe
    800046f8:	224080e7          	jalr	548(ra) # 80002918 <_ZN6ThreadC1Ev>
    800046fc:	00007797          	auipc	a5,0x7
    80004700:	28478793          	addi	a5,a5,644 # 8000b980 <_ZTV16ProducerKeyborad+0x10>
    80004704:	00f4b023          	sd	a5,0(s1)
    80004708:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    8000470c:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80004710:	00048513          	mv	a0,s1
    80004714:	ffffe097          	auipc	ra,0xffffe
    80004718:	13c080e7          	jalr	316(ra) # 80002850 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    8000471c:	00100913          	li	s2,1
    80004720:	0300006f          	j	80004750 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004724:	00007797          	auipc	a5,0x7
    80004728:	28478793          	addi	a5,a5,644 # 8000b9a8 <_ZTV8Producer+0x10>
    8000472c:	00fcb023          	sd	a5,0(s9)
    80004730:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    80004734:	00391793          	slli	a5,s2,0x3
    80004738:	00fa07b3          	add	a5,s4,a5
    8000473c:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80004740:	000c8513          	mv	a0,s9
    80004744:	ffffe097          	auipc	ra,0xffffe
    80004748:	10c080e7          	jalr	268(ra) # 80002850 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    8000474c:	0019091b          	addiw	s2,s2,1
    80004750:	05395263          	bge	s2,s3,80004794 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80004754:	00191493          	slli	s1,s2,0x1
    80004758:	012484b3          	add	s1,s1,s2
    8000475c:	00349493          	slli	s1,s1,0x3
    80004760:	009b04b3          	add	s1,s6,s1
    80004764:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80004768:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    8000476c:	00007797          	auipc	a5,0x7
    80004770:	4cc7b783          	ld	a5,1228(a5) # 8000bc38 <_ZL10waitForAll>
    80004774:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80004778:	02800513          	li	a0,40
    8000477c:	ffffe097          	auipc	ra,0xffffe
    80004780:	f24080e7          	jalr	-220(ra) # 800026a0 <_Znwm>
    80004784:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004788:	ffffe097          	auipc	ra,0xffffe
    8000478c:	190080e7          	jalr	400(ra) # 80002918 <_ZN6ThreadC1Ev>
    80004790:	f95ff06f          	j	80004724 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    80004794:	ffffe097          	auipc	ra,0xffffe
    80004798:	120080e7          	jalr	288(ra) # 800028b4 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    8000479c:	00000493          	li	s1,0
    800047a0:	0099ce63          	blt	s3,s1,800047bc <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    800047a4:	00007517          	auipc	a0,0x7
    800047a8:	49453503          	ld	a0,1172(a0) # 8000bc38 <_ZL10waitForAll>
    800047ac:	ffffe097          	auipc	ra,0xffffe
    800047b0:	220080e7          	jalr	544(ra) # 800029cc <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    800047b4:	0014849b          	addiw	s1,s1,1
    800047b8:	fe9ff06f          	j	800047a0 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    800047bc:	00007517          	auipc	a0,0x7
    800047c0:	47c53503          	ld	a0,1148(a0) # 8000bc38 <_ZL10waitForAll>
    800047c4:	00050863          	beqz	a0,800047d4 <_Z20testConsumerProducerv+0x2f4>
    800047c8:	00053783          	ld	a5,0(a0)
    800047cc:	0087b783          	ld	a5,8(a5)
    800047d0:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    800047d4:	00000493          	li	s1,0
    800047d8:	0080006f          	j	800047e0 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    800047dc:	0014849b          	addiw	s1,s1,1
    800047e0:	0334d263          	bge	s1,s3,80004804 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    800047e4:	00349793          	slli	a5,s1,0x3
    800047e8:	00fa07b3          	add	a5,s4,a5
    800047ec:	0007b503          	ld	a0,0(a5)
    800047f0:	fe0506e3          	beqz	a0,800047dc <_Z20testConsumerProducerv+0x2fc>
    800047f4:	00053783          	ld	a5,0(a0)
    800047f8:	0087b783          	ld	a5,8(a5)
    800047fc:	000780e7          	jalr	a5
    80004800:	fddff06f          	j	800047dc <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    80004804:	000b8a63          	beqz	s7,80004818 <_Z20testConsumerProducerv+0x338>
    80004808:	000bb783          	ld	a5,0(s7)
    8000480c:	0087b783          	ld	a5,8(a5)
    80004810:	000b8513          	mv	a0,s7
    80004814:	000780e7          	jalr	a5
    delete buffer;
    80004818:	000a8e63          	beqz	s5,80004834 <_Z20testConsumerProducerv+0x354>
    8000481c:	000a8513          	mv	a0,s5
    80004820:	00002097          	auipc	ra,0x2
    80004824:	870080e7          	jalr	-1936(ra) # 80006090 <_ZN9BufferCPPD1Ev>
    80004828:	000a8513          	mv	a0,s5
    8000482c:	ffffe097          	auipc	ra,0xffffe
    80004830:	ec4080e7          	jalr	-316(ra) # 800026f0 <_ZdlPv>
    80004834:	000c0113          	mv	sp,s8
}
    80004838:	f8040113          	addi	sp,s0,-128
    8000483c:	07813083          	ld	ra,120(sp)
    80004840:	07013403          	ld	s0,112(sp)
    80004844:	06813483          	ld	s1,104(sp)
    80004848:	06013903          	ld	s2,96(sp)
    8000484c:	05813983          	ld	s3,88(sp)
    80004850:	05013a03          	ld	s4,80(sp)
    80004854:	04813a83          	ld	s5,72(sp)
    80004858:	04013b03          	ld	s6,64(sp)
    8000485c:	03813b83          	ld	s7,56(sp)
    80004860:	03013c03          	ld	s8,48(sp)
    80004864:	02813c83          	ld	s9,40(sp)
    80004868:	08010113          	addi	sp,sp,128
    8000486c:	00008067          	ret
    80004870:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80004874:	000a8513          	mv	a0,s5
    80004878:	ffffe097          	auipc	ra,0xffffe
    8000487c:	e78080e7          	jalr	-392(ra) # 800026f0 <_ZdlPv>
    80004880:	00048513          	mv	a0,s1
    80004884:	00008097          	auipc	ra,0x8
    80004888:	4b4080e7          	jalr	1204(ra) # 8000cd38 <_Unwind_Resume>
    8000488c:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80004890:	00090513          	mv	a0,s2
    80004894:	ffffe097          	auipc	ra,0xffffe
    80004898:	e5c080e7          	jalr	-420(ra) # 800026f0 <_ZdlPv>
    8000489c:	00048513          	mv	a0,s1
    800048a0:	00008097          	auipc	ra,0x8
    800048a4:	498080e7          	jalr	1176(ra) # 8000cd38 <_Unwind_Resume>
    800048a8:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    800048ac:	000b8513          	mv	a0,s7
    800048b0:	ffffe097          	auipc	ra,0xffffe
    800048b4:	e40080e7          	jalr	-448(ra) # 800026f0 <_ZdlPv>
    800048b8:	00048513          	mv	a0,s1
    800048bc:	00008097          	auipc	ra,0x8
    800048c0:	47c080e7          	jalr	1148(ra) # 8000cd38 <_Unwind_Resume>
    800048c4:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800048c8:	00048513          	mv	a0,s1
    800048cc:	ffffe097          	auipc	ra,0xffffe
    800048d0:	e24080e7          	jalr	-476(ra) # 800026f0 <_ZdlPv>
    800048d4:	00090513          	mv	a0,s2
    800048d8:	00008097          	auipc	ra,0x8
    800048dc:	460080e7          	jalr	1120(ra) # 8000cd38 <_Unwind_Resume>
    800048e0:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    800048e4:	000c8513          	mv	a0,s9
    800048e8:	ffffe097          	auipc	ra,0xffffe
    800048ec:	e08080e7          	jalr	-504(ra) # 800026f0 <_ZdlPv>
    800048f0:	00048513          	mv	a0,s1
    800048f4:	00008097          	auipc	ra,0x8
    800048f8:	444080e7          	jalr	1092(ra) # 8000cd38 <_Unwind_Resume>

00000000800048fc <_ZN8Consumer3runEv>:
    void run() override {
    800048fc:	fd010113          	addi	sp,sp,-48
    80004900:	02113423          	sd	ra,40(sp)
    80004904:	02813023          	sd	s0,32(sp)
    80004908:	00913c23          	sd	s1,24(sp)
    8000490c:	01213823          	sd	s2,16(sp)
    80004910:	01313423          	sd	s3,8(sp)
    80004914:	03010413          	addi	s0,sp,48
    80004918:	00050913          	mv	s2,a0
        int i = 0;
    8000491c:	00000993          	li	s3,0
    80004920:	0100006f          	j	80004930 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    80004924:	00a00513          	li	a0,10
    80004928:	ffffe097          	auipc	ra,0xffffe
    8000492c:	17c080e7          	jalr	380(ra) # 80002aa4 <_ZN7Console4putcEc>
        while (!threadEnd) {
    80004930:	00007797          	auipc	a5,0x7
    80004934:	3007a783          	lw	a5,768(a5) # 8000bc30 <_ZL9threadEnd>
    80004938:	04079a63          	bnez	a5,8000498c <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    8000493c:	02093783          	ld	a5,32(s2)
    80004940:	0087b503          	ld	a0,8(a5)
    80004944:	00001097          	auipc	ra,0x1
    80004948:	638080e7          	jalr	1592(ra) # 80005f7c <_ZN9BufferCPP3getEv>
            i++;
    8000494c:	0019849b          	addiw	s1,s3,1
    80004950:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80004954:	0ff57513          	andi	a0,a0,255
    80004958:	ffffe097          	auipc	ra,0xffffe
    8000495c:	14c080e7          	jalr	332(ra) # 80002aa4 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80004960:	05000793          	li	a5,80
    80004964:	02f4e4bb          	remw	s1,s1,a5
    80004968:	fc0494e3          	bnez	s1,80004930 <_ZN8Consumer3runEv+0x34>
    8000496c:	fb9ff06f          	j	80004924 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80004970:	02093783          	ld	a5,32(s2)
    80004974:	0087b503          	ld	a0,8(a5)
    80004978:	00001097          	auipc	ra,0x1
    8000497c:	604080e7          	jalr	1540(ra) # 80005f7c <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80004980:	0ff57513          	andi	a0,a0,255
    80004984:	ffffe097          	auipc	ra,0xffffe
    80004988:	120080e7          	jalr	288(ra) # 80002aa4 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    8000498c:	02093783          	ld	a5,32(s2)
    80004990:	0087b503          	ld	a0,8(a5)
    80004994:	00001097          	auipc	ra,0x1
    80004998:	674080e7          	jalr	1652(ra) # 80006008 <_ZN9BufferCPP6getCntEv>
    8000499c:	fca04ae3          	bgtz	a0,80004970 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    800049a0:	02093783          	ld	a5,32(s2)
    800049a4:	0107b503          	ld	a0,16(a5)
    800049a8:	ffffe097          	auipc	ra,0xffffe
    800049ac:	050080e7          	jalr	80(ra) # 800029f8 <_ZN9Semaphore6signalEv>
    }
    800049b0:	02813083          	ld	ra,40(sp)
    800049b4:	02013403          	ld	s0,32(sp)
    800049b8:	01813483          	ld	s1,24(sp)
    800049bc:	01013903          	ld	s2,16(sp)
    800049c0:	00813983          	ld	s3,8(sp)
    800049c4:	03010113          	addi	sp,sp,48
    800049c8:	00008067          	ret

00000000800049cc <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    800049cc:	ff010113          	addi	sp,sp,-16
    800049d0:	00113423          	sd	ra,8(sp)
    800049d4:	00813023          	sd	s0,0(sp)
    800049d8:	01010413          	addi	s0,sp,16
    800049dc:	00007797          	auipc	a5,0x7
    800049e0:	ff478793          	addi	a5,a5,-12 # 8000b9d0 <_ZTV8Consumer+0x10>
    800049e4:	00f53023          	sd	a5,0(a0)
    800049e8:	ffffe097          	auipc	ra,0xffffe
    800049ec:	bc8080e7          	jalr	-1080(ra) # 800025b0 <_ZN6ThreadD1Ev>
    800049f0:	00813083          	ld	ra,8(sp)
    800049f4:	00013403          	ld	s0,0(sp)
    800049f8:	01010113          	addi	sp,sp,16
    800049fc:	00008067          	ret

0000000080004a00 <_ZN8ConsumerD0Ev>:
    80004a00:	fe010113          	addi	sp,sp,-32
    80004a04:	00113c23          	sd	ra,24(sp)
    80004a08:	00813823          	sd	s0,16(sp)
    80004a0c:	00913423          	sd	s1,8(sp)
    80004a10:	02010413          	addi	s0,sp,32
    80004a14:	00050493          	mv	s1,a0
    80004a18:	00007797          	auipc	a5,0x7
    80004a1c:	fb878793          	addi	a5,a5,-72 # 8000b9d0 <_ZTV8Consumer+0x10>
    80004a20:	00f53023          	sd	a5,0(a0)
    80004a24:	ffffe097          	auipc	ra,0xffffe
    80004a28:	b8c080e7          	jalr	-1140(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80004a2c:	00048513          	mv	a0,s1
    80004a30:	ffffe097          	auipc	ra,0xffffe
    80004a34:	cc0080e7          	jalr	-832(ra) # 800026f0 <_ZdlPv>
    80004a38:	01813083          	ld	ra,24(sp)
    80004a3c:	01013403          	ld	s0,16(sp)
    80004a40:	00813483          	ld	s1,8(sp)
    80004a44:	02010113          	addi	sp,sp,32
    80004a48:	00008067          	ret

0000000080004a4c <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80004a4c:	ff010113          	addi	sp,sp,-16
    80004a50:	00113423          	sd	ra,8(sp)
    80004a54:	00813023          	sd	s0,0(sp)
    80004a58:	01010413          	addi	s0,sp,16
    80004a5c:	00007797          	auipc	a5,0x7
    80004a60:	f2478793          	addi	a5,a5,-220 # 8000b980 <_ZTV16ProducerKeyborad+0x10>
    80004a64:	00f53023          	sd	a5,0(a0)
    80004a68:	ffffe097          	auipc	ra,0xffffe
    80004a6c:	b48080e7          	jalr	-1208(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80004a70:	00813083          	ld	ra,8(sp)
    80004a74:	00013403          	ld	s0,0(sp)
    80004a78:	01010113          	addi	sp,sp,16
    80004a7c:	00008067          	ret

0000000080004a80 <_ZN16ProducerKeyboradD0Ev>:
    80004a80:	fe010113          	addi	sp,sp,-32
    80004a84:	00113c23          	sd	ra,24(sp)
    80004a88:	00813823          	sd	s0,16(sp)
    80004a8c:	00913423          	sd	s1,8(sp)
    80004a90:	02010413          	addi	s0,sp,32
    80004a94:	00050493          	mv	s1,a0
    80004a98:	00007797          	auipc	a5,0x7
    80004a9c:	ee878793          	addi	a5,a5,-280 # 8000b980 <_ZTV16ProducerKeyborad+0x10>
    80004aa0:	00f53023          	sd	a5,0(a0)
    80004aa4:	ffffe097          	auipc	ra,0xffffe
    80004aa8:	b0c080e7          	jalr	-1268(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80004aac:	00048513          	mv	a0,s1
    80004ab0:	ffffe097          	auipc	ra,0xffffe
    80004ab4:	c40080e7          	jalr	-960(ra) # 800026f0 <_ZdlPv>
    80004ab8:	01813083          	ld	ra,24(sp)
    80004abc:	01013403          	ld	s0,16(sp)
    80004ac0:	00813483          	ld	s1,8(sp)
    80004ac4:	02010113          	addi	sp,sp,32
    80004ac8:	00008067          	ret

0000000080004acc <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80004acc:	ff010113          	addi	sp,sp,-16
    80004ad0:	00113423          	sd	ra,8(sp)
    80004ad4:	00813023          	sd	s0,0(sp)
    80004ad8:	01010413          	addi	s0,sp,16
    80004adc:	00007797          	auipc	a5,0x7
    80004ae0:	ecc78793          	addi	a5,a5,-308 # 8000b9a8 <_ZTV8Producer+0x10>
    80004ae4:	00f53023          	sd	a5,0(a0)
    80004ae8:	ffffe097          	auipc	ra,0xffffe
    80004aec:	ac8080e7          	jalr	-1336(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80004af0:	00813083          	ld	ra,8(sp)
    80004af4:	00013403          	ld	s0,0(sp)
    80004af8:	01010113          	addi	sp,sp,16
    80004afc:	00008067          	ret

0000000080004b00 <_ZN8ProducerD0Ev>:
    80004b00:	fe010113          	addi	sp,sp,-32
    80004b04:	00113c23          	sd	ra,24(sp)
    80004b08:	00813823          	sd	s0,16(sp)
    80004b0c:	00913423          	sd	s1,8(sp)
    80004b10:	02010413          	addi	s0,sp,32
    80004b14:	00050493          	mv	s1,a0
    80004b18:	00007797          	auipc	a5,0x7
    80004b1c:	e9078793          	addi	a5,a5,-368 # 8000b9a8 <_ZTV8Producer+0x10>
    80004b20:	00f53023          	sd	a5,0(a0)
    80004b24:	ffffe097          	auipc	ra,0xffffe
    80004b28:	a8c080e7          	jalr	-1396(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80004b2c:	00048513          	mv	a0,s1
    80004b30:	ffffe097          	auipc	ra,0xffffe
    80004b34:	bc0080e7          	jalr	-1088(ra) # 800026f0 <_ZdlPv>
    80004b38:	01813083          	ld	ra,24(sp)
    80004b3c:	01013403          	ld	s0,16(sp)
    80004b40:	00813483          	ld	s1,8(sp)
    80004b44:	02010113          	addi	sp,sp,32
    80004b48:	00008067          	ret

0000000080004b4c <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80004b4c:	fe010113          	addi	sp,sp,-32
    80004b50:	00113c23          	sd	ra,24(sp)
    80004b54:	00813823          	sd	s0,16(sp)
    80004b58:	00913423          	sd	s1,8(sp)
    80004b5c:	02010413          	addi	s0,sp,32
    80004b60:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80004b64:	ffffd097          	auipc	ra,0xffffd
    80004b68:	a04080e7          	jalr	-1532(ra) # 80001568 <_Z4getcv>
    80004b6c:	0005059b          	sext.w	a1,a0
    80004b70:	01b00793          	li	a5,27
    80004b74:	00f58c63          	beq	a1,a5,80004b8c <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80004b78:	0204b783          	ld	a5,32(s1)
    80004b7c:	0087b503          	ld	a0,8(a5)
    80004b80:	00001097          	auipc	ra,0x1
    80004b84:	36c080e7          	jalr	876(ra) # 80005eec <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80004b88:	fddff06f          	j	80004b64 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80004b8c:	00100793          	li	a5,1
    80004b90:	00007717          	auipc	a4,0x7
    80004b94:	0af72023          	sw	a5,160(a4) # 8000bc30 <_ZL9threadEnd>
        td->buffer->put('!');
    80004b98:	0204b783          	ld	a5,32(s1)
    80004b9c:	02100593          	li	a1,33
    80004ba0:	0087b503          	ld	a0,8(a5)
    80004ba4:	00001097          	auipc	ra,0x1
    80004ba8:	348080e7          	jalr	840(ra) # 80005eec <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80004bac:	0204b783          	ld	a5,32(s1)
    80004bb0:	0107b503          	ld	a0,16(a5)
    80004bb4:	ffffe097          	auipc	ra,0xffffe
    80004bb8:	e44080e7          	jalr	-444(ra) # 800029f8 <_ZN9Semaphore6signalEv>
    }
    80004bbc:	01813083          	ld	ra,24(sp)
    80004bc0:	01013403          	ld	s0,16(sp)
    80004bc4:	00813483          	ld	s1,8(sp)
    80004bc8:	02010113          	addi	sp,sp,32
    80004bcc:	00008067          	ret

0000000080004bd0 <_ZN8Producer3runEv>:
    void run() override {
    80004bd0:	fe010113          	addi	sp,sp,-32
    80004bd4:	00113c23          	sd	ra,24(sp)
    80004bd8:	00813823          	sd	s0,16(sp)
    80004bdc:	00913423          	sd	s1,8(sp)
    80004be0:	01213023          	sd	s2,0(sp)
    80004be4:	02010413          	addi	s0,sp,32
    80004be8:	00050493          	mv	s1,a0
        int i = 0;
    80004bec:	00000913          	li	s2,0
        while (!threadEnd) {
    80004bf0:	00007797          	auipc	a5,0x7
    80004bf4:	0407a783          	lw	a5,64(a5) # 8000bc30 <_ZL9threadEnd>
    80004bf8:	04079263          	bnez	a5,80004c3c <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    80004bfc:	0204b783          	ld	a5,32(s1)
    80004c00:	0007a583          	lw	a1,0(a5)
    80004c04:	0305859b          	addiw	a1,a1,48
    80004c08:	0087b503          	ld	a0,8(a5)
    80004c0c:	00001097          	auipc	ra,0x1
    80004c10:	2e0080e7          	jalr	736(ra) # 80005eec <_ZN9BufferCPP3putEi>
            i++;
    80004c14:	0019071b          	addiw	a4,s2,1
    80004c18:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    80004c1c:	0204b783          	ld	a5,32(s1)
    80004c20:	0007a783          	lw	a5,0(a5)
    80004c24:	00e787bb          	addw	a5,a5,a4
    80004c28:	00500513          	li	a0,5
    80004c2c:	02a7e53b          	remw	a0,a5,a0
    80004c30:	ffffe097          	auipc	ra,0xffffe
    80004c34:	cac080e7          	jalr	-852(ra) # 800028dc <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80004c38:	fb9ff06f          	j	80004bf0 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80004c3c:	0204b783          	ld	a5,32(s1)
    80004c40:	0107b503          	ld	a0,16(a5)
    80004c44:	ffffe097          	auipc	ra,0xffffe
    80004c48:	db4080e7          	jalr	-588(ra) # 800029f8 <_ZN9Semaphore6signalEv>
    }
    80004c4c:	01813083          	ld	ra,24(sp)
    80004c50:	01013403          	ld	s0,16(sp)
    80004c54:	00813483          	ld	s1,8(sp)
    80004c58:	00013903          	ld	s2,0(sp)
    80004c5c:	02010113          	addi	sp,sp,32
    80004c60:	00008067          	ret

0000000080004c64 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004c64:	fe010113          	addi	sp,sp,-32
    80004c68:	00113c23          	sd	ra,24(sp)
    80004c6c:	00813823          	sd	s0,16(sp)
    80004c70:	00913423          	sd	s1,8(sp)
    80004c74:	01213023          	sd	s2,0(sp)
    80004c78:	02010413          	addi	s0,sp,32
    80004c7c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004c80:	00100793          	li	a5,1
    80004c84:	02a7f863          	bgeu	a5,a0,80004cb4 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004c88:	00a00793          	li	a5,10
    80004c8c:	02f577b3          	remu	a5,a0,a5
    80004c90:	02078e63          	beqz	a5,80004ccc <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004c94:	fff48513          	addi	a0,s1,-1
    80004c98:	00000097          	auipc	ra,0x0
    80004c9c:	fcc080e7          	jalr	-52(ra) # 80004c64 <_ZL9fibonaccim>
    80004ca0:	00050913          	mv	s2,a0
    80004ca4:	ffe48513          	addi	a0,s1,-2
    80004ca8:	00000097          	auipc	ra,0x0
    80004cac:	fbc080e7          	jalr	-68(ra) # 80004c64 <_ZL9fibonaccim>
    80004cb0:	00a90533          	add	a0,s2,a0
}
    80004cb4:	01813083          	ld	ra,24(sp)
    80004cb8:	01013403          	ld	s0,16(sp)
    80004cbc:	00813483          	ld	s1,8(sp)
    80004cc0:	00013903          	ld	s2,0(sp)
    80004cc4:	02010113          	addi	sp,sp,32
    80004cc8:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80004ccc:	ffffc097          	auipc	ra,0xffffc
    80004cd0:	75c080e7          	jalr	1884(ra) # 80001428 <_Z15thread_dispatchv>
    80004cd4:	fc1ff06f          	j	80004c94 <_ZL9fibonaccim+0x30>

0000000080004cd8 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80004cd8:	fe010113          	addi	sp,sp,-32
    80004cdc:	00113c23          	sd	ra,24(sp)
    80004ce0:	00813823          	sd	s0,16(sp)
    80004ce4:	00913423          	sd	s1,8(sp)
    80004ce8:	01213023          	sd	s2,0(sp)
    80004cec:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004cf0:	00a00493          	li	s1,10
    80004cf4:	0400006f          	j	80004d34 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004cf8:	00004517          	auipc	a0,0x4
    80004cfc:	68050513          	addi	a0,a0,1664 # 80009378 <CONSOLE_STATUS+0x368>
    80004d00:	00001097          	auipc	ra,0x1
    80004d04:	dc8080e7          	jalr	-568(ra) # 80005ac8 <_Z11printStringPKc>
    80004d08:	00000613          	li	a2,0
    80004d0c:	00a00593          	li	a1,10
    80004d10:	00048513          	mv	a0,s1
    80004d14:	00001097          	auipc	ra,0x1
    80004d18:	f64080e7          	jalr	-156(ra) # 80005c78 <_Z8printIntiii>
    80004d1c:	00005517          	auipc	a0,0x5
    80004d20:	84c50513          	addi	a0,a0,-1972 # 80009568 <CONSOLE_STATUS+0x558>
    80004d24:	00001097          	auipc	ra,0x1
    80004d28:	da4080e7          	jalr	-604(ra) # 80005ac8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004d2c:	0014849b          	addiw	s1,s1,1
    80004d30:	0ff4f493          	andi	s1,s1,255
    80004d34:	00c00793          	li	a5,12
    80004d38:	fc97f0e3          	bgeu	a5,s1,80004cf8 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80004d3c:	00004517          	auipc	a0,0x4
    80004d40:	64450513          	addi	a0,a0,1604 # 80009380 <CONSOLE_STATUS+0x370>
    80004d44:	00001097          	auipc	ra,0x1
    80004d48:	d84080e7          	jalr	-636(ra) # 80005ac8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004d4c:	00500313          	li	t1,5
    thread_dispatch();
    80004d50:	ffffc097          	auipc	ra,0xffffc
    80004d54:	6d8080e7          	jalr	1752(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004d58:	01000513          	li	a0,16
    80004d5c:	00000097          	auipc	ra,0x0
    80004d60:	f08080e7          	jalr	-248(ra) # 80004c64 <_ZL9fibonaccim>
    80004d64:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004d68:	00004517          	auipc	a0,0x4
    80004d6c:	62850513          	addi	a0,a0,1576 # 80009390 <CONSOLE_STATUS+0x380>
    80004d70:	00001097          	auipc	ra,0x1
    80004d74:	d58080e7          	jalr	-680(ra) # 80005ac8 <_Z11printStringPKc>
    80004d78:	00000613          	li	a2,0
    80004d7c:	00a00593          	li	a1,10
    80004d80:	0009051b          	sext.w	a0,s2
    80004d84:	00001097          	auipc	ra,0x1
    80004d88:	ef4080e7          	jalr	-268(ra) # 80005c78 <_Z8printIntiii>
    80004d8c:	00004517          	auipc	a0,0x4
    80004d90:	7dc50513          	addi	a0,a0,2012 # 80009568 <CONSOLE_STATUS+0x558>
    80004d94:	00001097          	auipc	ra,0x1
    80004d98:	d34080e7          	jalr	-716(ra) # 80005ac8 <_Z11printStringPKc>
    80004d9c:	0400006f          	j	80004ddc <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004da0:	00004517          	auipc	a0,0x4
    80004da4:	5d850513          	addi	a0,a0,1496 # 80009378 <CONSOLE_STATUS+0x368>
    80004da8:	00001097          	auipc	ra,0x1
    80004dac:	d20080e7          	jalr	-736(ra) # 80005ac8 <_Z11printStringPKc>
    80004db0:	00000613          	li	a2,0
    80004db4:	00a00593          	li	a1,10
    80004db8:	00048513          	mv	a0,s1
    80004dbc:	00001097          	auipc	ra,0x1
    80004dc0:	ebc080e7          	jalr	-324(ra) # 80005c78 <_Z8printIntiii>
    80004dc4:	00004517          	auipc	a0,0x4
    80004dc8:	7a450513          	addi	a0,a0,1956 # 80009568 <CONSOLE_STATUS+0x558>
    80004dcc:	00001097          	auipc	ra,0x1
    80004dd0:	cfc080e7          	jalr	-772(ra) # 80005ac8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004dd4:	0014849b          	addiw	s1,s1,1
    80004dd8:	0ff4f493          	andi	s1,s1,255
    80004ddc:	00f00793          	li	a5,15
    80004de0:	fc97f0e3          	bgeu	a5,s1,80004da0 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80004de4:	00004517          	auipc	a0,0x4
    80004de8:	5bc50513          	addi	a0,a0,1468 # 800093a0 <CONSOLE_STATUS+0x390>
    80004dec:	00001097          	auipc	ra,0x1
    80004df0:	cdc080e7          	jalr	-804(ra) # 80005ac8 <_Z11printStringPKc>
    finishedD = true;
    80004df4:	00100793          	li	a5,1
    80004df8:	00007717          	auipc	a4,0x7
    80004dfc:	e4f70423          	sb	a5,-440(a4) # 8000bc40 <_ZL9finishedD>
    thread_dispatch();
    80004e00:	ffffc097          	auipc	ra,0xffffc
    80004e04:	628080e7          	jalr	1576(ra) # 80001428 <_Z15thread_dispatchv>
}
    80004e08:	01813083          	ld	ra,24(sp)
    80004e0c:	01013403          	ld	s0,16(sp)
    80004e10:	00813483          	ld	s1,8(sp)
    80004e14:	00013903          	ld	s2,0(sp)
    80004e18:	02010113          	addi	sp,sp,32
    80004e1c:	00008067          	ret

0000000080004e20 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80004e20:	fe010113          	addi	sp,sp,-32
    80004e24:	00113c23          	sd	ra,24(sp)
    80004e28:	00813823          	sd	s0,16(sp)
    80004e2c:	00913423          	sd	s1,8(sp)
    80004e30:	01213023          	sd	s2,0(sp)
    80004e34:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004e38:	00000493          	li	s1,0
    80004e3c:	0400006f          	j	80004e7c <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80004e40:	00004517          	auipc	a0,0x4
    80004e44:	4f850513          	addi	a0,a0,1272 # 80009338 <CONSOLE_STATUS+0x328>
    80004e48:	00001097          	auipc	ra,0x1
    80004e4c:	c80080e7          	jalr	-896(ra) # 80005ac8 <_Z11printStringPKc>
    80004e50:	00000613          	li	a2,0
    80004e54:	00a00593          	li	a1,10
    80004e58:	00048513          	mv	a0,s1
    80004e5c:	00001097          	auipc	ra,0x1
    80004e60:	e1c080e7          	jalr	-484(ra) # 80005c78 <_Z8printIntiii>
    80004e64:	00004517          	auipc	a0,0x4
    80004e68:	70450513          	addi	a0,a0,1796 # 80009568 <CONSOLE_STATUS+0x558>
    80004e6c:	00001097          	auipc	ra,0x1
    80004e70:	c5c080e7          	jalr	-932(ra) # 80005ac8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004e74:	0014849b          	addiw	s1,s1,1
    80004e78:	0ff4f493          	andi	s1,s1,255
    80004e7c:	00200793          	li	a5,2
    80004e80:	fc97f0e3          	bgeu	a5,s1,80004e40 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80004e84:	00004517          	auipc	a0,0x4
    80004e88:	4bc50513          	addi	a0,a0,1212 # 80009340 <CONSOLE_STATUS+0x330>
    80004e8c:	00001097          	auipc	ra,0x1
    80004e90:	c3c080e7          	jalr	-964(ra) # 80005ac8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004e94:	00700313          	li	t1,7
    thread_dispatch();
    80004e98:	ffffc097          	auipc	ra,0xffffc
    80004e9c:	590080e7          	jalr	1424(ra) # 80001428 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004ea0:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80004ea4:	00004517          	auipc	a0,0x4
    80004ea8:	4ac50513          	addi	a0,a0,1196 # 80009350 <CONSOLE_STATUS+0x340>
    80004eac:	00001097          	auipc	ra,0x1
    80004eb0:	c1c080e7          	jalr	-996(ra) # 80005ac8 <_Z11printStringPKc>
    80004eb4:	00000613          	li	a2,0
    80004eb8:	00a00593          	li	a1,10
    80004ebc:	0009051b          	sext.w	a0,s2
    80004ec0:	00001097          	auipc	ra,0x1
    80004ec4:	db8080e7          	jalr	-584(ra) # 80005c78 <_Z8printIntiii>
    80004ec8:	00004517          	auipc	a0,0x4
    80004ecc:	6a050513          	addi	a0,a0,1696 # 80009568 <CONSOLE_STATUS+0x558>
    80004ed0:	00001097          	auipc	ra,0x1
    80004ed4:	bf8080e7          	jalr	-1032(ra) # 80005ac8 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80004ed8:	00c00513          	li	a0,12
    80004edc:	00000097          	auipc	ra,0x0
    80004ee0:	d88080e7          	jalr	-632(ra) # 80004c64 <_ZL9fibonaccim>
    80004ee4:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80004ee8:	00004517          	auipc	a0,0x4
    80004eec:	47050513          	addi	a0,a0,1136 # 80009358 <CONSOLE_STATUS+0x348>
    80004ef0:	00001097          	auipc	ra,0x1
    80004ef4:	bd8080e7          	jalr	-1064(ra) # 80005ac8 <_Z11printStringPKc>
    80004ef8:	00000613          	li	a2,0
    80004efc:	00a00593          	li	a1,10
    80004f00:	0009051b          	sext.w	a0,s2
    80004f04:	00001097          	auipc	ra,0x1
    80004f08:	d74080e7          	jalr	-652(ra) # 80005c78 <_Z8printIntiii>
    80004f0c:	00004517          	auipc	a0,0x4
    80004f10:	65c50513          	addi	a0,a0,1628 # 80009568 <CONSOLE_STATUS+0x558>
    80004f14:	00001097          	auipc	ra,0x1
    80004f18:	bb4080e7          	jalr	-1100(ra) # 80005ac8 <_Z11printStringPKc>
    80004f1c:	0400006f          	j	80004f5c <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80004f20:	00004517          	auipc	a0,0x4
    80004f24:	41850513          	addi	a0,a0,1048 # 80009338 <CONSOLE_STATUS+0x328>
    80004f28:	00001097          	auipc	ra,0x1
    80004f2c:	ba0080e7          	jalr	-1120(ra) # 80005ac8 <_Z11printStringPKc>
    80004f30:	00000613          	li	a2,0
    80004f34:	00a00593          	li	a1,10
    80004f38:	00048513          	mv	a0,s1
    80004f3c:	00001097          	auipc	ra,0x1
    80004f40:	d3c080e7          	jalr	-708(ra) # 80005c78 <_Z8printIntiii>
    80004f44:	00004517          	auipc	a0,0x4
    80004f48:	62450513          	addi	a0,a0,1572 # 80009568 <CONSOLE_STATUS+0x558>
    80004f4c:	00001097          	auipc	ra,0x1
    80004f50:	b7c080e7          	jalr	-1156(ra) # 80005ac8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004f54:	0014849b          	addiw	s1,s1,1
    80004f58:	0ff4f493          	andi	s1,s1,255
    80004f5c:	00500793          	li	a5,5
    80004f60:	fc97f0e3          	bgeu	a5,s1,80004f20 <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    80004f64:	00004517          	auipc	a0,0x4
    80004f68:	40450513          	addi	a0,a0,1028 # 80009368 <CONSOLE_STATUS+0x358>
    80004f6c:	00001097          	auipc	ra,0x1
    80004f70:	b5c080e7          	jalr	-1188(ra) # 80005ac8 <_Z11printStringPKc>
    finishedC = true;
    80004f74:	00100793          	li	a5,1
    80004f78:	00007717          	auipc	a4,0x7
    80004f7c:	ccf704a3          	sb	a5,-823(a4) # 8000bc41 <_ZL9finishedC>
    thread_dispatch();
    80004f80:	ffffc097          	auipc	ra,0xffffc
    80004f84:	4a8080e7          	jalr	1192(ra) # 80001428 <_Z15thread_dispatchv>
}
    80004f88:	01813083          	ld	ra,24(sp)
    80004f8c:	01013403          	ld	s0,16(sp)
    80004f90:	00813483          	ld	s1,8(sp)
    80004f94:	00013903          	ld	s2,0(sp)
    80004f98:	02010113          	addi	sp,sp,32
    80004f9c:	00008067          	ret

0000000080004fa0 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80004fa0:	fe010113          	addi	sp,sp,-32
    80004fa4:	00113c23          	sd	ra,24(sp)
    80004fa8:	00813823          	sd	s0,16(sp)
    80004fac:	00913423          	sd	s1,8(sp)
    80004fb0:	01213023          	sd	s2,0(sp)
    80004fb4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80004fb8:	00000913          	li	s2,0
    80004fbc:	0380006f          	j	80004ff4 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80004fc0:	ffffc097          	auipc	ra,0xffffc
    80004fc4:	468080e7          	jalr	1128(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004fc8:	00148493          	addi	s1,s1,1
    80004fcc:	000027b7          	lui	a5,0x2
    80004fd0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004fd4:	0097ee63          	bltu	a5,s1,80004ff0 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004fd8:	00000713          	li	a4,0
    80004fdc:	000077b7          	lui	a5,0x7
    80004fe0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004fe4:	fce7eee3          	bltu	a5,a4,80004fc0 <_ZL11workerBodyBPv+0x20>
    80004fe8:	00170713          	addi	a4,a4,1
    80004fec:	ff1ff06f          	j	80004fdc <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80004ff0:	00190913          	addi	s2,s2,1
    80004ff4:	00f00793          	li	a5,15
    80004ff8:	0527e063          	bltu	a5,s2,80005038 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80004ffc:	00004517          	auipc	a0,0x4
    80005000:	32450513          	addi	a0,a0,804 # 80009320 <CONSOLE_STATUS+0x310>
    80005004:	00001097          	auipc	ra,0x1
    80005008:	ac4080e7          	jalr	-1340(ra) # 80005ac8 <_Z11printStringPKc>
    8000500c:	00000613          	li	a2,0
    80005010:	00a00593          	li	a1,10
    80005014:	0009051b          	sext.w	a0,s2
    80005018:	00001097          	auipc	ra,0x1
    8000501c:	c60080e7          	jalr	-928(ra) # 80005c78 <_Z8printIntiii>
    80005020:	00004517          	auipc	a0,0x4
    80005024:	54850513          	addi	a0,a0,1352 # 80009568 <CONSOLE_STATUS+0x558>
    80005028:	00001097          	auipc	ra,0x1
    8000502c:	aa0080e7          	jalr	-1376(ra) # 80005ac8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005030:	00000493          	li	s1,0
    80005034:	f99ff06f          	j	80004fcc <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80005038:	00004517          	auipc	a0,0x4
    8000503c:	2f050513          	addi	a0,a0,752 # 80009328 <CONSOLE_STATUS+0x318>
    80005040:	00001097          	auipc	ra,0x1
    80005044:	a88080e7          	jalr	-1400(ra) # 80005ac8 <_Z11printStringPKc>
    finishedB = true;
    80005048:	00100793          	li	a5,1
    8000504c:	00007717          	auipc	a4,0x7
    80005050:	bef70b23          	sb	a5,-1034(a4) # 8000bc42 <_ZL9finishedB>
    thread_dispatch();
    80005054:	ffffc097          	auipc	ra,0xffffc
    80005058:	3d4080e7          	jalr	980(ra) # 80001428 <_Z15thread_dispatchv>
}
    8000505c:	01813083          	ld	ra,24(sp)
    80005060:	01013403          	ld	s0,16(sp)
    80005064:	00813483          	ld	s1,8(sp)
    80005068:	00013903          	ld	s2,0(sp)
    8000506c:	02010113          	addi	sp,sp,32
    80005070:	00008067          	ret

0000000080005074 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80005074:	fe010113          	addi	sp,sp,-32
    80005078:	00113c23          	sd	ra,24(sp)
    8000507c:	00813823          	sd	s0,16(sp)
    80005080:	00913423          	sd	s1,8(sp)
    80005084:	01213023          	sd	s2,0(sp)
    80005088:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    8000508c:	00000913          	li	s2,0
    80005090:	0380006f          	j	800050c8 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80005094:	ffffc097          	auipc	ra,0xffffc
    80005098:	394080e7          	jalr	916(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    8000509c:	00148493          	addi	s1,s1,1
    800050a0:	000027b7          	lui	a5,0x2
    800050a4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800050a8:	0097ee63          	bltu	a5,s1,800050c4 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800050ac:	00000713          	li	a4,0
    800050b0:	000077b7          	lui	a5,0x7
    800050b4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800050b8:	fce7eee3          	bltu	a5,a4,80005094 <_ZL11workerBodyAPv+0x20>
    800050bc:	00170713          	addi	a4,a4,1
    800050c0:	ff1ff06f          	j	800050b0 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800050c4:	00190913          	addi	s2,s2,1
    800050c8:	00900793          	li	a5,9
    800050cc:	0527e063          	bltu	a5,s2,8000510c <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800050d0:	00004517          	auipc	a0,0x4
    800050d4:	23850513          	addi	a0,a0,568 # 80009308 <CONSOLE_STATUS+0x2f8>
    800050d8:	00001097          	auipc	ra,0x1
    800050dc:	9f0080e7          	jalr	-1552(ra) # 80005ac8 <_Z11printStringPKc>
    800050e0:	00000613          	li	a2,0
    800050e4:	00a00593          	li	a1,10
    800050e8:	0009051b          	sext.w	a0,s2
    800050ec:	00001097          	auipc	ra,0x1
    800050f0:	b8c080e7          	jalr	-1140(ra) # 80005c78 <_Z8printIntiii>
    800050f4:	00004517          	auipc	a0,0x4
    800050f8:	47450513          	addi	a0,a0,1140 # 80009568 <CONSOLE_STATUS+0x558>
    800050fc:	00001097          	auipc	ra,0x1
    80005100:	9cc080e7          	jalr	-1588(ra) # 80005ac8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005104:	00000493          	li	s1,0
    80005108:	f99ff06f          	j	800050a0 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    8000510c:	00004517          	auipc	a0,0x4
    80005110:	20450513          	addi	a0,a0,516 # 80009310 <CONSOLE_STATUS+0x300>
    80005114:	00001097          	auipc	ra,0x1
    80005118:	9b4080e7          	jalr	-1612(ra) # 80005ac8 <_Z11printStringPKc>
    finishedA = true;
    8000511c:	00100793          	li	a5,1
    80005120:	00007717          	auipc	a4,0x7
    80005124:	b2f701a3          	sb	a5,-1245(a4) # 8000bc43 <_ZL9finishedA>
}
    80005128:	01813083          	ld	ra,24(sp)
    8000512c:	01013403          	ld	s0,16(sp)
    80005130:	00813483          	ld	s1,8(sp)
    80005134:	00013903          	ld	s2,0(sp)
    80005138:	02010113          	addi	sp,sp,32
    8000513c:	00008067          	ret

0000000080005140 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80005140:	fd010113          	addi	sp,sp,-48
    80005144:	02113423          	sd	ra,40(sp)
    80005148:	02813023          	sd	s0,32(sp)
    8000514c:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80005150:	00000613          	li	a2,0
    80005154:	00000597          	auipc	a1,0x0
    80005158:	f2058593          	addi	a1,a1,-224 # 80005074 <_ZL11workerBodyAPv>
    8000515c:	fd040513          	addi	a0,s0,-48
    80005160:	ffffc097          	auipc	ra,0xffffc
    80005164:	220080e7          	jalr	544(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80005168:	00004517          	auipc	a0,0x4
    8000516c:	24850513          	addi	a0,a0,584 # 800093b0 <CONSOLE_STATUS+0x3a0>
    80005170:	00001097          	auipc	ra,0x1
    80005174:	958080e7          	jalr	-1704(ra) # 80005ac8 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80005178:	00000613          	li	a2,0
    8000517c:	00000597          	auipc	a1,0x0
    80005180:	e2458593          	addi	a1,a1,-476 # 80004fa0 <_ZL11workerBodyBPv>
    80005184:	fd840513          	addi	a0,s0,-40
    80005188:	ffffc097          	auipc	ra,0xffffc
    8000518c:	1f8080e7          	jalr	504(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80005190:	00004517          	auipc	a0,0x4
    80005194:	23850513          	addi	a0,a0,568 # 800093c8 <CONSOLE_STATUS+0x3b8>
    80005198:	00001097          	auipc	ra,0x1
    8000519c:	930080e7          	jalr	-1744(ra) # 80005ac8 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    800051a0:	00000613          	li	a2,0
    800051a4:	00000597          	auipc	a1,0x0
    800051a8:	c7c58593          	addi	a1,a1,-900 # 80004e20 <_ZL11workerBodyCPv>
    800051ac:	fe040513          	addi	a0,s0,-32
    800051b0:	ffffc097          	auipc	ra,0xffffc
    800051b4:	1d0080e7          	jalr	464(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    800051b8:	00004517          	auipc	a0,0x4
    800051bc:	22850513          	addi	a0,a0,552 # 800093e0 <CONSOLE_STATUS+0x3d0>
    800051c0:	00001097          	auipc	ra,0x1
    800051c4:	908080e7          	jalr	-1784(ra) # 80005ac8 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    800051c8:	00000613          	li	a2,0
    800051cc:	00000597          	auipc	a1,0x0
    800051d0:	b0c58593          	addi	a1,a1,-1268 # 80004cd8 <_ZL11workerBodyDPv>
    800051d4:	fe840513          	addi	a0,s0,-24
    800051d8:	ffffc097          	auipc	ra,0xffffc
    800051dc:	1a8080e7          	jalr	424(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    800051e0:	00004517          	auipc	a0,0x4
    800051e4:	21850513          	addi	a0,a0,536 # 800093f8 <CONSOLE_STATUS+0x3e8>
    800051e8:	00001097          	auipc	ra,0x1
    800051ec:	8e0080e7          	jalr	-1824(ra) # 80005ac8 <_Z11printStringPKc>
    800051f0:	00c0006f          	j	800051fc <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    800051f4:	ffffc097          	auipc	ra,0xffffc
    800051f8:	234080e7          	jalr	564(ra) # 80001428 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800051fc:	00007797          	auipc	a5,0x7
    80005200:	a477c783          	lbu	a5,-1465(a5) # 8000bc43 <_ZL9finishedA>
    80005204:	fe0788e3          	beqz	a5,800051f4 <_Z18Threads_C_API_testv+0xb4>
    80005208:	00007797          	auipc	a5,0x7
    8000520c:	a3a7c783          	lbu	a5,-1478(a5) # 8000bc42 <_ZL9finishedB>
    80005210:	fe0782e3          	beqz	a5,800051f4 <_Z18Threads_C_API_testv+0xb4>
    80005214:	00007797          	auipc	a5,0x7
    80005218:	a2d7c783          	lbu	a5,-1491(a5) # 8000bc41 <_ZL9finishedC>
    8000521c:	fc078ce3          	beqz	a5,800051f4 <_Z18Threads_C_API_testv+0xb4>
    80005220:	00007797          	auipc	a5,0x7
    80005224:	a207c783          	lbu	a5,-1504(a5) # 8000bc40 <_ZL9finishedD>
    80005228:	fc0786e3          	beqz	a5,800051f4 <_Z18Threads_C_API_testv+0xb4>
    }

}
    8000522c:	02813083          	ld	ra,40(sp)
    80005230:	02013403          	ld	s0,32(sp)
    80005234:	03010113          	addi	sp,sp,48
    80005238:	00008067          	ret

000000008000523c <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    8000523c:	fd010113          	addi	sp,sp,-48
    80005240:	02113423          	sd	ra,40(sp)
    80005244:	02813023          	sd	s0,32(sp)
    80005248:	00913c23          	sd	s1,24(sp)
    8000524c:	01213823          	sd	s2,16(sp)
    80005250:	01313423          	sd	s3,8(sp)
    80005254:	03010413          	addi	s0,sp,48
    80005258:	00050993          	mv	s3,a0
    8000525c:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80005260:	00000913          	li	s2,0
    80005264:	00c0006f          	j	80005270 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005268:	ffffd097          	auipc	ra,0xffffd
    8000526c:	64c080e7          	jalr	1612(ra) # 800028b4 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80005270:	ffffc097          	auipc	ra,0xffffc
    80005274:	2f8080e7          	jalr	760(ra) # 80001568 <_Z4getcv>
    80005278:	0005059b          	sext.w	a1,a0
    8000527c:	01b00793          	li	a5,27
    80005280:	02f58a63          	beq	a1,a5,800052b4 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80005284:	0084b503          	ld	a0,8(s1)
    80005288:	00001097          	auipc	ra,0x1
    8000528c:	c64080e7          	jalr	-924(ra) # 80005eec <_ZN9BufferCPP3putEi>
        i++;
    80005290:	0019071b          	addiw	a4,s2,1
    80005294:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005298:	0004a683          	lw	a3,0(s1)
    8000529c:	0026979b          	slliw	a5,a3,0x2
    800052a0:	00d787bb          	addw	a5,a5,a3
    800052a4:	0017979b          	slliw	a5,a5,0x1
    800052a8:	02f767bb          	remw	a5,a4,a5
    800052ac:	fc0792e3          	bnez	a5,80005270 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    800052b0:	fb9ff06f          	j	80005268 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    800052b4:	00100793          	li	a5,1
    800052b8:	00007717          	auipc	a4,0x7
    800052bc:	98f72823          	sw	a5,-1648(a4) # 8000bc48 <_ZL9threadEnd>
    td->buffer->put('!');
    800052c0:	0209b783          	ld	a5,32(s3)
    800052c4:	02100593          	li	a1,33
    800052c8:	0087b503          	ld	a0,8(a5)
    800052cc:	00001097          	auipc	ra,0x1
    800052d0:	c20080e7          	jalr	-992(ra) # 80005eec <_ZN9BufferCPP3putEi>

    data->wait->signal();
    800052d4:	0104b503          	ld	a0,16(s1)
    800052d8:	ffffd097          	auipc	ra,0xffffd
    800052dc:	720080e7          	jalr	1824(ra) # 800029f8 <_ZN9Semaphore6signalEv>
}
    800052e0:	02813083          	ld	ra,40(sp)
    800052e4:	02013403          	ld	s0,32(sp)
    800052e8:	01813483          	ld	s1,24(sp)
    800052ec:	01013903          	ld	s2,16(sp)
    800052f0:	00813983          	ld	s3,8(sp)
    800052f4:	03010113          	addi	sp,sp,48
    800052f8:	00008067          	ret

00000000800052fc <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    800052fc:	fe010113          	addi	sp,sp,-32
    80005300:	00113c23          	sd	ra,24(sp)
    80005304:	00813823          	sd	s0,16(sp)
    80005308:	00913423          	sd	s1,8(sp)
    8000530c:	01213023          	sd	s2,0(sp)
    80005310:	02010413          	addi	s0,sp,32
    80005314:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005318:	00000913          	li	s2,0
    8000531c:	00c0006f          	j	80005328 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005320:	ffffd097          	auipc	ra,0xffffd
    80005324:	594080e7          	jalr	1428(ra) # 800028b4 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80005328:	00007797          	auipc	a5,0x7
    8000532c:	9207a783          	lw	a5,-1760(a5) # 8000bc48 <_ZL9threadEnd>
    80005330:	02079e63          	bnez	a5,8000536c <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80005334:	0004a583          	lw	a1,0(s1)
    80005338:	0305859b          	addiw	a1,a1,48
    8000533c:	0084b503          	ld	a0,8(s1)
    80005340:	00001097          	auipc	ra,0x1
    80005344:	bac080e7          	jalr	-1108(ra) # 80005eec <_ZN9BufferCPP3putEi>
        i++;
    80005348:	0019071b          	addiw	a4,s2,1
    8000534c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005350:	0004a683          	lw	a3,0(s1)
    80005354:	0026979b          	slliw	a5,a3,0x2
    80005358:	00d787bb          	addw	a5,a5,a3
    8000535c:	0017979b          	slliw	a5,a5,0x1
    80005360:	02f767bb          	remw	a5,a4,a5
    80005364:	fc0792e3          	bnez	a5,80005328 <_ZN12ProducerSync8producerEPv+0x2c>
    80005368:	fb9ff06f          	j	80005320 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    8000536c:	0104b503          	ld	a0,16(s1)
    80005370:	ffffd097          	auipc	ra,0xffffd
    80005374:	688080e7          	jalr	1672(ra) # 800029f8 <_ZN9Semaphore6signalEv>
}
    80005378:	01813083          	ld	ra,24(sp)
    8000537c:	01013403          	ld	s0,16(sp)
    80005380:	00813483          	ld	s1,8(sp)
    80005384:	00013903          	ld	s2,0(sp)
    80005388:	02010113          	addi	sp,sp,32
    8000538c:	00008067          	ret

0000000080005390 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80005390:	fd010113          	addi	sp,sp,-48
    80005394:	02113423          	sd	ra,40(sp)
    80005398:	02813023          	sd	s0,32(sp)
    8000539c:	00913c23          	sd	s1,24(sp)
    800053a0:	01213823          	sd	s2,16(sp)
    800053a4:	01313423          	sd	s3,8(sp)
    800053a8:	01413023          	sd	s4,0(sp)
    800053ac:	03010413          	addi	s0,sp,48
    800053b0:	00050993          	mv	s3,a0
    800053b4:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800053b8:	00000a13          	li	s4,0
    800053bc:	01c0006f          	j	800053d8 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    800053c0:	ffffd097          	auipc	ra,0xffffd
    800053c4:	4f4080e7          	jalr	1268(ra) # 800028b4 <_ZN6Thread8dispatchEv>
    800053c8:	0500006f          	j	80005418 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    800053cc:	00a00513          	li	a0,10
    800053d0:	ffffc097          	auipc	ra,0xffffc
    800053d4:	1c0080e7          	jalr	448(ra) # 80001590 <_Z4putcc>
    while (!threadEnd) {
    800053d8:	00007797          	auipc	a5,0x7
    800053dc:	8707a783          	lw	a5,-1936(a5) # 8000bc48 <_ZL9threadEnd>
    800053e0:	06079263          	bnez	a5,80005444 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    800053e4:	00893503          	ld	a0,8(s2)
    800053e8:	00001097          	auipc	ra,0x1
    800053ec:	b94080e7          	jalr	-1132(ra) # 80005f7c <_ZN9BufferCPP3getEv>
        i++;
    800053f0:	001a049b          	addiw	s1,s4,1
    800053f4:	00048a1b          	sext.w	s4,s1
        putc(key);
    800053f8:	0ff57513          	andi	a0,a0,255
    800053fc:	ffffc097          	auipc	ra,0xffffc
    80005400:	194080e7          	jalr	404(ra) # 80001590 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80005404:	00092703          	lw	a4,0(s2)
    80005408:	0027179b          	slliw	a5,a4,0x2
    8000540c:	00e787bb          	addw	a5,a5,a4
    80005410:	02f4e7bb          	remw	a5,s1,a5
    80005414:	fa0786e3          	beqz	a5,800053c0 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80005418:	05000793          	li	a5,80
    8000541c:	02f4e4bb          	remw	s1,s1,a5
    80005420:	fa049ce3          	bnez	s1,800053d8 <_ZN12ConsumerSync8consumerEPv+0x48>
    80005424:	fa9ff06f          	j	800053cc <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80005428:	0209b783          	ld	a5,32(s3)
    8000542c:	0087b503          	ld	a0,8(a5)
    80005430:	00001097          	auipc	ra,0x1
    80005434:	b4c080e7          	jalr	-1204(ra) # 80005f7c <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80005438:	0ff57513          	andi	a0,a0,255
    8000543c:	ffffd097          	auipc	ra,0xffffd
    80005440:	668080e7          	jalr	1640(ra) # 80002aa4 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80005444:	0209b783          	ld	a5,32(s3)
    80005448:	0087b503          	ld	a0,8(a5)
    8000544c:	00001097          	auipc	ra,0x1
    80005450:	bbc080e7          	jalr	-1092(ra) # 80006008 <_ZN9BufferCPP6getCntEv>
    80005454:	fca04ae3          	bgtz	a0,80005428 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80005458:	01093503          	ld	a0,16(s2)
    8000545c:	ffffd097          	auipc	ra,0xffffd
    80005460:	59c080e7          	jalr	1436(ra) # 800029f8 <_ZN9Semaphore6signalEv>
}
    80005464:	02813083          	ld	ra,40(sp)
    80005468:	02013403          	ld	s0,32(sp)
    8000546c:	01813483          	ld	s1,24(sp)
    80005470:	01013903          	ld	s2,16(sp)
    80005474:	00813983          	ld	s3,8(sp)
    80005478:	00013a03          	ld	s4,0(sp)
    8000547c:	03010113          	addi	sp,sp,48
    80005480:	00008067          	ret

0000000080005484 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80005484:	f8010113          	addi	sp,sp,-128
    80005488:	06113c23          	sd	ra,120(sp)
    8000548c:	06813823          	sd	s0,112(sp)
    80005490:	06913423          	sd	s1,104(sp)
    80005494:	07213023          	sd	s2,96(sp)
    80005498:	05313c23          	sd	s3,88(sp)
    8000549c:	05413823          	sd	s4,80(sp)
    800054a0:	05513423          	sd	s5,72(sp)
    800054a4:	05613023          	sd	s6,64(sp)
    800054a8:	03713c23          	sd	s7,56(sp)
    800054ac:	03813823          	sd	s8,48(sp)
    800054b0:	03913423          	sd	s9,40(sp)
    800054b4:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    800054b8:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    800054bc:	00004517          	auipc	a0,0x4
    800054c0:	d6450513          	addi	a0,a0,-668 # 80009220 <CONSOLE_STATUS+0x210>
    800054c4:	00000097          	auipc	ra,0x0
    800054c8:	604080e7          	jalr	1540(ra) # 80005ac8 <_Z11printStringPKc>
    getString(input, 30);
    800054cc:	01e00593          	li	a1,30
    800054d0:	f8040493          	addi	s1,s0,-128
    800054d4:	00048513          	mv	a0,s1
    800054d8:	00000097          	auipc	ra,0x0
    800054dc:	678080e7          	jalr	1656(ra) # 80005b50 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800054e0:	00048513          	mv	a0,s1
    800054e4:	00000097          	auipc	ra,0x0
    800054e8:	744080e7          	jalr	1860(ra) # 80005c28 <_Z11stringToIntPKc>
    800054ec:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    800054f0:	00004517          	auipc	a0,0x4
    800054f4:	d5050513          	addi	a0,a0,-688 # 80009240 <CONSOLE_STATUS+0x230>
    800054f8:	00000097          	auipc	ra,0x0
    800054fc:	5d0080e7          	jalr	1488(ra) # 80005ac8 <_Z11printStringPKc>
    getString(input, 30);
    80005500:	01e00593          	li	a1,30
    80005504:	00048513          	mv	a0,s1
    80005508:	00000097          	auipc	ra,0x0
    8000550c:	648080e7          	jalr	1608(ra) # 80005b50 <_Z9getStringPci>
    n = stringToInt(input);
    80005510:	00048513          	mv	a0,s1
    80005514:	00000097          	auipc	ra,0x0
    80005518:	714080e7          	jalr	1812(ra) # 80005c28 <_Z11stringToIntPKc>
    8000551c:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80005520:	00004517          	auipc	a0,0x4
    80005524:	d4050513          	addi	a0,a0,-704 # 80009260 <CONSOLE_STATUS+0x250>
    80005528:	00000097          	auipc	ra,0x0
    8000552c:	5a0080e7          	jalr	1440(ra) # 80005ac8 <_Z11printStringPKc>
    80005530:	00000613          	li	a2,0
    80005534:	00a00593          	li	a1,10
    80005538:	00090513          	mv	a0,s2
    8000553c:	00000097          	auipc	ra,0x0
    80005540:	73c080e7          	jalr	1852(ra) # 80005c78 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005544:	00004517          	auipc	a0,0x4
    80005548:	d3450513          	addi	a0,a0,-716 # 80009278 <CONSOLE_STATUS+0x268>
    8000554c:	00000097          	auipc	ra,0x0
    80005550:	57c080e7          	jalr	1404(ra) # 80005ac8 <_Z11printStringPKc>
    80005554:	00000613          	li	a2,0
    80005558:	00a00593          	li	a1,10
    8000555c:	00048513          	mv	a0,s1
    80005560:	00000097          	auipc	ra,0x0
    80005564:	718080e7          	jalr	1816(ra) # 80005c78 <_Z8printIntiii>
    printString(".\n");
    80005568:	00004517          	auipc	a0,0x4
    8000556c:	d2850513          	addi	a0,a0,-728 # 80009290 <CONSOLE_STATUS+0x280>
    80005570:	00000097          	auipc	ra,0x0
    80005574:	558080e7          	jalr	1368(ra) # 80005ac8 <_Z11printStringPKc>
    if(threadNum > n) {
    80005578:	0324c463          	blt	s1,s2,800055a0 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    8000557c:	03205c63          	blez	s2,800055b4 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80005580:	03800513          	li	a0,56
    80005584:	ffffd097          	auipc	ra,0xffffd
    80005588:	11c080e7          	jalr	284(ra) # 800026a0 <_Znwm>
    8000558c:	00050a93          	mv	s5,a0
    80005590:	00048593          	mv	a1,s1
    80005594:	00001097          	auipc	ra,0x1
    80005598:	804080e7          	jalr	-2044(ra) # 80005d98 <_ZN9BufferCPPC1Ei>
    8000559c:	0300006f          	j	800055cc <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800055a0:	00004517          	auipc	a0,0x4
    800055a4:	cf850513          	addi	a0,a0,-776 # 80009298 <CONSOLE_STATUS+0x288>
    800055a8:	00000097          	auipc	ra,0x0
    800055ac:	520080e7          	jalr	1312(ra) # 80005ac8 <_Z11printStringPKc>
        return;
    800055b0:	0140006f          	j	800055c4 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800055b4:	00004517          	auipc	a0,0x4
    800055b8:	d2450513          	addi	a0,a0,-732 # 800092d8 <CONSOLE_STATUS+0x2c8>
    800055bc:	00000097          	auipc	ra,0x0
    800055c0:	50c080e7          	jalr	1292(ra) # 80005ac8 <_Z11printStringPKc>
        return;
    800055c4:	000b8113          	mv	sp,s7
    800055c8:	2380006f          	j	80005800 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    800055cc:	01000513          	li	a0,16
    800055d0:	ffffd097          	auipc	ra,0xffffd
    800055d4:	0d0080e7          	jalr	208(ra) # 800026a0 <_Znwm>
    800055d8:	00050493          	mv	s1,a0
    800055dc:	00000593          	li	a1,0
    800055e0:	ffffd097          	auipc	ra,0xffffd
    800055e4:	3b4080e7          	jalr	948(ra) # 80002994 <_ZN9SemaphoreC1Ej>
    800055e8:	00006797          	auipc	a5,0x6
    800055ec:	6697b423          	sd	s1,1640(a5) # 8000bc50 <_ZL10waitForAll>
    Thread* threads[threadNum];
    800055f0:	00391793          	slli	a5,s2,0x3
    800055f4:	00f78793          	addi	a5,a5,15
    800055f8:	ff07f793          	andi	a5,a5,-16
    800055fc:	40f10133          	sub	sp,sp,a5
    80005600:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80005604:	0019071b          	addiw	a4,s2,1
    80005608:	00171793          	slli	a5,a4,0x1
    8000560c:	00e787b3          	add	a5,a5,a4
    80005610:	00379793          	slli	a5,a5,0x3
    80005614:	00f78793          	addi	a5,a5,15
    80005618:	ff07f793          	andi	a5,a5,-16
    8000561c:	40f10133          	sub	sp,sp,a5
    80005620:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80005624:	00191c13          	slli	s8,s2,0x1
    80005628:	012c07b3          	add	a5,s8,s2
    8000562c:	00379793          	slli	a5,a5,0x3
    80005630:	00fa07b3          	add	a5,s4,a5
    80005634:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80005638:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    8000563c:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80005640:	02800513          	li	a0,40
    80005644:	ffffd097          	auipc	ra,0xffffd
    80005648:	05c080e7          	jalr	92(ra) # 800026a0 <_Znwm>
    8000564c:	00050b13          	mv	s6,a0
    80005650:	012c0c33          	add	s8,s8,s2
    80005654:	003c1c13          	slli	s8,s8,0x3
    80005658:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    8000565c:	ffffd097          	auipc	ra,0xffffd
    80005660:	2bc080e7          	jalr	700(ra) # 80002918 <_ZN6ThreadC1Ev>
    80005664:	00006797          	auipc	a5,0x6
    80005668:	3e478793          	addi	a5,a5,996 # 8000ba48 <_ZTV12ConsumerSync+0x10>
    8000566c:	00fb3023          	sd	a5,0(s6)
    80005670:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80005674:	000b0513          	mv	a0,s6
    80005678:	ffffd097          	auipc	ra,0xffffd
    8000567c:	1d8080e7          	jalr	472(ra) # 80002850 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005680:	00000493          	li	s1,0
    80005684:	0380006f          	j	800056bc <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005688:	00006797          	auipc	a5,0x6
    8000568c:	39878793          	addi	a5,a5,920 # 8000ba20 <_ZTV12ProducerSync+0x10>
    80005690:	00fcb023          	sd	a5,0(s9)
    80005694:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80005698:	00349793          	slli	a5,s1,0x3
    8000569c:	00f987b3          	add	a5,s3,a5
    800056a0:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    800056a4:	00349793          	slli	a5,s1,0x3
    800056a8:	00f987b3          	add	a5,s3,a5
    800056ac:	0007b503          	ld	a0,0(a5)
    800056b0:	ffffd097          	auipc	ra,0xffffd
    800056b4:	1a0080e7          	jalr	416(ra) # 80002850 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    800056b8:	0014849b          	addiw	s1,s1,1
    800056bc:	0b24d063          	bge	s1,s2,8000575c <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    800056c0:	00149793          	slli	a5,s1,0x1
    800056c4:	009787b3          	add	a5,a5,s1
    800056c8:	00379793          	slli	a5,a5,0x3
    800056cc:	00fa07b3          	add	a5,s4,a5
    800056d0:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800056d4:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    800056d8:	00006717          	auipc	a4,0x6
    800056dc:	57873703          	ld	a4,1400(a4) # 8000bc50 <_ZL10waitForAll>
    800056e0:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    800056e4:	02905863          	blez	s1,80005714 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    800056e8:	02800513          	li	a0,40
    800056ec:	ffffd097          	auipc	ra,0xffffd
    800056f0:	fb4080e7          	jalr	-76(ra) # 800026a0 <_Znwm>
    800056f4:	00050c93          	mv	s9,a0
    800056f8:	00149c13          	slli	s8,s1,0x1
    800056fc:	009c0c33          	add	s8,s8,s1
    80005700:	003c1c13          	slli	s8,s8,0x3
    80005704:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005708:	ffffd097          	auipc	ra,0xffffd
    8000570c:	210080e7          	jalr	528(ra) # 80002918 <_ZN6ThreadC1Ev>
    80005710:	f79ff06f          	j	80005688 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80005714:	02800513          	li	a0,40
    80005718:	ffffd097          	auipc	ra,0xffffd
    8000571c:	f88080e7          	jalr	-120(ra) # 800026a0 <_Znwm>
    80005720:	00050c93          	mv	s9,a0
    80005724:	00149c13          	slli	s8,s1,0x1
    80005728:	009c0c33          	add	s8,s8,s1
    8000572c:	003c1c13          	slli	s8,s8,0x3
    80005730:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80005734:	ffffd097          	auipc	ra,0xffffd
    80005738:	1e4080e7          	jalr	484(ra) # 80002918 <_ZN6ThreadC1Ev>
    8000573c:	00006797          	auipc	a5,0x6
    80005740:	2bc78793          	addi	a5,a5,700 # 8000b9f8 <_ZTV16ProducerKeyboard+0x10>
    80005744:	00fcb023          	sd	a5,0(s9)
    80005748:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    8000574c:	00349793          	slli	a5,s1,0x3
    80005750:	00f987b3          	add	a5,s3,a5
    80005754:	0197b023          	sd	s9,0(a5)
    80005758:	f4dff06f          	j	800056a4 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    8000575c:	ffffd097          	auipc	ra,0xffffd
    80005760:	158080e7          	jalr	344(ra) # 800028b4 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80005764:	00000493          	li	s1,0
    80005768:	00994e63          	blt	s2,s1,80005784 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    8000576c:	00006517          	auipc	a0,0x6
    80005770:	4e453503          	ld	a0,1252(a0) # 8000bc50 <_ZL10waitForAll>
    80005774:	ffffd097          	auipc	ra,0xffffd
    80005778:	258080e7          	jalr	600(ra) # 800029cc <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    8000577c:	0014849b          	addiw	s1,s1,1
    80005780:	fe9ff06f          	j	80005768 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80005784:	00000493          	li	s1,0
    80005788:	0080006f          	j	80005790 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    8000578c:	0014849b          	addiw	s1,s1,1
    80005790:	0324d263          	bge	s1,s2,800057b4 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80005794:	00349793          	slli	a5,s1,0x3
    80005798:	00f987b3          	add	a5,s3,a5
    8000579c:	0007b503          	ld	a0,0(a5)
    800057a0:	fe0506e3          	beqz	a0,8000578c <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    800057a4:	00053783          	ld	a5,0(a0)
    800057a8:	0087b783          	ld	a5,8(a5)
    800057ac:	000780e7          	jalr	a5
    800057b0:	fddff06f          	j	8000578c <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    800057b4:	000b0a63          	beqz	s6,800057c8 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    800057b8:	000b3783          	ld	a5,0(s6)
    800057bc:	0087b783          	ld	a5,8(a5)
    800057c0:	000b0513          	mv	a0,s6
    800057c4:	000780e7          	jalr	a5
    delete waitForAll;
    800057c8:	00006517          	auipc	a0,0x6
    800057cc:	48853503          	ld	a0,1160(a0) # 8000bc50 <_ZL10waitForAll>
    800057d0:	00050863          	beqz	a0,800057e0 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    800057d4:	00053783          	ld	a5,0(a0)
    800057d8:	0087b783          	ld	a5,8(a5)
    800057dc:	000780e7          	jalr	a5
    delete buffer;
    800057e0:	000a8e63          	beqz	s5,800057fc <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    800057e4:	000a8513          	mv	a0,s5
    800057e8:	00001097          	auipc	ra,0x1
    800057ec:	8a8080e7          	jalr	-1880(ra) # 80006090 <_ZN9BufferCPPD1Ev>
    800057f0:	000a8513          	mv	a0,s5
    800057f4:	ffffd097          	auipc	ra,0xffffd
    800057f8:	efc080e7          	jalr	-260(ra) # 800026f0 <_ZdlPv>
    800057fc:	000b8113          	mv	sp,s7

}
    80005800:	f8040113          	addi	sp,s0,-128
    80005804:	07813083          	ld	ra,120(sp)
    80005808:	07013403          	ld	s0,112(sp)
    8000580c:	06813483          	ld	s1,104(sp)
    80005810:	06013903          	ld	s2,96(sp)
    80005814:	05813983          	ld	s3,88(sp)
    80005818:	05013a03          	ld	s4,80(sp)
    8000581c:	04813a83          	ld	s5,72(sp)
    80005820:	04013b03          	ld	s6,64(sp)
    80005824:	03813b83          	ld	s7,56(sp)
    80005828:	03013c03          	ld	s8,48(sp)
    8000582c:	02813c83          	ld	s9,40(sp)
    80005830:	08010113          	addi	sp,sp,128
    80005834:	00008067          	ret
    80005838:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    8000583c:	000a8513          	mv	a0,s5
    80005840:	ffffd097          	auipc	ra,0xffffd
    80005844:	eb0080e7          	jalr	-336(ra) # 800026f0 <_ZdlPv>
    80005848:	00048513          	mv	a0,s1
    8000584c:	00007097          	auipc	ra,0x7
    80005850:	4ec080e7          	jalr	1260(ra) # 8000cd38 <_Unwind_Resume>
    80005854:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80005858:	00048513          	mv	a0,s1
    8000585c:	ffffd097          	auipc	ra,0xffffd
    80005860:	e94080e7          	jalr	-364(ra) # 800026f0 <_ZdlPv>
    80005864:	00090513          	mv	a0,s2
    80005868:	00007097          	auipc	ra,0x7
    8000586c:	4d0080e7          	jalr	1232(ra) # 8000cd38 <_Unwind_Resume>
    80005870:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80005874:	000b0513          	mv	a0,s6
    80005878:	ffffd097          	auipc	ra,0xffffd
    8000587c:	e78080e7          	jalr	-392(ra) # 800026f0 <_ZdlPv>
    80005880:	00048513          	mv	a0,s1
    80005884:	00007097          	auipc	ra,0x7
    80005888:	4b4080e7          	jalr	1204(ra) # 8000cd38 <_Unwind_Resume>
    8000588c:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80005890:	000c8513          	mv	a0,s9
    80005894:	ffffd097          	auipc	ra,0xffffd
    80005898:	e5c080e7          	jalr	-420(ra) # 800026f0 <_ZdlPv>
    8000589c:	00048513          	mv	a0,s1
    800058a0:	00007097          	auipc	ra,0x7
    800058a4:	498080e7          	jalr	1176(ra) # 8000cd38 <_Unwind_Resume>
    800058a8:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    800058ac:	000c8513          	mv	a0,s9
    800058b0:	ffffd097          	auipc	ra,0xffffd
    800058b4:	e40080e7          	jalr	-448(ra) # 800026f0 <_ZdlPv>
    800058b8:	00048513          	mv	a0,s1
    800058bc:	00007097          	auipc	ra,0x7
    800058c0:	47c080e7          	jalr	1148(ra) # 8000cd38 <_Unwind_Resume>

00000000800058c4 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    800058c4:	ff010113          	addi	sp,sp,-16
    800058c8:	00113423          	sd	ra,8(sp)
    800058cc:	00813023          	sd	s0,0(sp)
    800058d0:	01010413          	addi	s0,sp,16
    800058d4:	00006797          	auipc	a5,0x6
    800058d8:	17478793          	addi	a5,a5,372 # 8000ba48 <_ZTV12ConsumerSync+0x10>
    800058dc:	00f53023          	sd	a5,0(a0)
    800058e0:	ffffd097          	auipc	ra,0xffffd
    800058e4:	cd0080e7          	jalr	-816(ra) # 800025b0 <_ZN6ThreadD1Ev>
    800058e8:	00813083          	ld	ra,8(sp)
    800058ec:	00013403          	ld	s0,0(sp)
    800058f0:	01010113          	addi	sp,sp,16
    800058f4:	00008067          	ret

00000000800058f8 <_ZN12ConsumerSyncD0Ev>:
    800058f8:	fe010113          	addi	sp,sp,-32
    800058fc:	00113c23          	sd	ra,24(sp)
    80005900:	00813823          	sd	s0,16(sp)
    80005904:	00913423          	sd	s1,8(sp)
    80005908:	02010413          	addi	s0,sp,32
    8000590c:	00050493          	mv	s1,a0
    80005910:	00006797          	auipc	a5,0x6
    80005914:	13878793          	addi	a5,a5,312 # 8000ba48 <_ZTV12ConsumerSync+0x10>
    80005918:	00f53023          	sd	a5,0(a0)
    8000591c:	ffffd097          	auipc	ra,0xffffd
    80005920:	c94080e7          	jalr	-876(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80005924:	00048513          	mv	a0,s1
    80005928:	ffffd097          	auipc	ra,0xffffd
    8000592c:	dc8080e7          	jalr	-568(ra) # 800026f0 <_ZdlPv>
    80005930:	01813083          	ld	ra,24(sp)
    80005934:	01013403          	ld	s0,16(sp)
    80005938:	00813483          	ld	s1,8(sp)
    8000593c:	02010113          	addi	sp,sp,32
    80005940:	00008067          	ret

0000000080005944 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80005944:	ff010113          	addi	sp,sp,-16
    80005948:	00113423          	sd	ra,8(sp)
    8000594c:	00813023          	sd	s0,0(sp)
    80005950:	01010413          	addi	s0,sp,16
    80005954:	00006797          	auipc	a5,0x6
    80005958:	0cc78793          	addi	a5,a5,204 # 8000ba20 <_ZTV12ProducerSync+0x10>
    8000595c:	00f53023          	sd	a5,0(a0)
    80005960:	ffffd097          	auipc	ra,0xffffd
    80005964:	c50080e7          	jalr	-944(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80005968:	00813083          	ld	ra,8(sp)
    8000596c:	00013403          	ld	s0,0(sp)
    80005970:	01010113          	addi	sp,sp,16
    80005974:	00008067          	ret

0000000080005978 <_ZN12ProducerSyncD0Ev>:
    80005978:	fe010113          	addi	sp,sp,-32
    8000597c:	00113c23          	sd	ra,24(sp)
    80005980:	00813823          	sd	s0,16(sp)
    80005984:	00913423          	sd	s1,8(sp)
    80005988:	02010413          	addi	s0,sp,32
    8000598c:	00050493          	mv	s1,a0
    80005990:	00006797          	auipc	a5,0x6
    80005994:	09078793          	addi	a5,a5,144 # 8000ba20 <_ZTV12ProducerSync+0x10>
    80005998:	00f53023          	sd	a5,0(a0)
    8000599c:	ffffd097          	auipc	ra,0xffffd
    800059a0:	c14080e7          	jalr	-1004(ra) # 800025b0 <_ZN6ThreadD1Ev>
    800059a4:	00048513          	mv	a0,s1
    800059a8:	ffffd097          	auipc	ra,0xffffd
    800059ac:	d48080e7          	jalr	-696(ra) # 800026f0 <_ZdlPv>
    800059b0:	01813083          	ld	ra,24(sp)
    800059b4:	01013403          	ld	s0,16(sp)
    800059b8:	00813483          	ld	s1,8(sp)
    800059bc:	02010113          	addi	sp,sp,32
    800059c0:	00008067          	ret

00000000800059c4 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    800059c4:	ff010113          	addi	sp,sp,-16
    800059c8:	00113423          	sd	ra,8(sp)
    800059cc:	00813023          	sd	s0,0(sp)
    800059d0:	01010413          	addi	s0,sp,16
    800059d4:	00006797          	auipc	a5,0x6
    800059d8:	02478793          	addi	a5,a5,36 # 8000b9f8 <_ZTV16ProducerKeyboard+0x10>
    800059dc:	00f53023          	sd	a5,0(a0)
    800059e0:	ffffd097          	auipc	ra,0xffffd
    800059e4:	bd0080e7          	jalr	-1072(ra) # 800025b0 <_ZN6ThreadD1Ev>
    800059e8:	00813083          	ld	ra,8(sp)
    800059ec:	00013403          	ld	s0,0(sp)
    800059f0:	01010113          	addi	sp,sp,16
    800059f4:	00008067          	ret

00000000800059f8 <_ZN16ProducerKeyboardD0Ev>:
    800059f8:	fe010113          	addi	sp,sp,-32
    800059fc:	00113c23          	sd	ra,24(sp)
    80005a00:	00813823          	sd	s0,16(sp)
    80005a04:	00913423          	sd	s1,8(sp)
    80005a08:	02010413          	addi	s0,sp,32
    80005a0c:	00050493          	mv	s1,a0
    80005a10:	00006797          	auipc	a5,0x6
    80005a14:	fe878793          	addi	a5,a5,-24 # 8000b9f8 <_ZTV16ProducerKeyboard+0x10>
    80005a18:	00f53023          	sd	a5,0(a0)
    80005a1c:	ffffd097          	auipc	ra,0xffffd
    80005a20:	b94080e7          	jalr	-1132(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80005a24:	00048513          	mv	a0,s1
    80005a28:	ffffd097          	auipc	ra,0xffffd
    80005a2c:	cc8080e7          	jalr	-824(ra) # 800026f0 <_ZdlPv>
    80005a30:	01813083          	ld	ra,24(sp)
    80005a34:	01013403          	ld	s0,16(sp)
    80005a38:	00813483          	ld	s1,8(sp)
    80005a3c:	02010113          	addi	sp,sp,32
    80005a40:	00008067          	ret

0000000080005a44 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80005a44:	ff010113          	addi	sp,sp,-16
    80005a48:	00113423          	sd	ra,8(sp)
    80005a4c:	00813023          	sd	s0,0(sp)
    80005a50:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80005a54:	02053583          	ld	a1,32(a0)
    80005a58:	fffff097          	auipc	ra,0xfffff
    80005a5c:	7e4080e7          	jalr	2020(ra) # 8000523c <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80005a60:	00813083          	ld	ra,8(sp)
    80005a64:	00013403          	ld	s0,0(sp)
    80005a68:	01010113          	addi	sp,sp,16
    80005a6c:	00008067          	ret

0000000080005a70 <_ZN12ProducerSync3runEv>:
    void run() override {
    80005a70:	ff010113          	addi	sp,sp,-16
    80005a74:	00113423          	sd	ra,8(sp)
    80005a78:	00813023          	sd	s0,0(sp)
    80005a7c:	01010413          	addi	s0,sp,16
        producer(td);
    80005a80:	02053583          	ld	a1,32(a0)
    80005a84:	00000097          	auipc	ra,0x0
    80005a88:	878080e7          	jalr	-1928(ra) # 800052fc <_ZN12ProducerSync8producerEPv>
    }
    80005a8c:	00813083          	ld	ra,8(sp)
    80005a90:	00013403          	ld	s0,0(sp)
    80005a94:	01010113          	addi	sp,sp,16
    80005a98:	00008067          	ret

0000000080005a9c <_ZN12ConsumerSync3runEv>:
    void run() override {
    80005a9c:	ff010113          	addi	sp,sp,-16
    80005aa0:	00113423          	sd	ra,8(sp)
    80005aa4:	00813023          	sd	s0,0(sp)
    80005aa8:	01010413          	addi	s0,sp,16
        consumer(td);
    80005aac:	02053583          	ld	a1,32(a0)
    80005ab0:	00000097          	auipc	ra,0x0
    80005ab4:	8e0080e7          	jalr	-1824(ra) # 80005390 <_ZN12ConsumerSync8consumerEPv>
    }
    80005ab8:	00813083          	ld	ra,8(sp)
    80005abc:	00013403          	ld	s0,0(sp)
    80005ac0:	01010113          	addi	sp,sp,16
    80005ac4:	00008067          	ret

0000000080005ac8 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80005ac8:	fe010113          	addi	sp,sp,-32
    80005acc:	00113c23          	sd	ra,24(sp)
    80005ad0:	00813823          	sd	s0,16(sp)
    80005ad4:	00913423          	sd	s1,8(sp)
    80005ad8:	02010413          	addi	s0,sp,32
    80005adc:	00050493          	mv	s1,a0
    LOCK();
    80005ae0:	00100613          	li	a2,1
    80005ae4:	00000593          	li	a1,0
    80005ae8:	00006517          	auipc	a0,0x6
    80005aec:	17050513          	addi	a0,a0,368 # 8000bc58 <lockPrint>
    80005af0:	ffffb097          	auipc	ra,0xffffb
    80005af4:	734080e7          	jalr	1844(ra) # 80001224 <copy_and_swap>
    80005af8:	00050863          	beqz	a0,80005b08 <_Z11printStringPKc+0x40>
    80005afc:	ffffc097          	auipc	ra,0xffffc
    80005b00:	92c080e7          	jalr	-1748(ra) # 80001428 <_Z15thread_dispatchv>
    80005b04:	fddff06f          	j	80005ae0 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80005b08:	0004c503          	lbu	a0,0(s1)
    80005b0c:	00050a63          	beqz	a0,80005b20 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80005b10:	ffffc097          	auipc	ra,0xffffc
    80005b14:	a80080e7          	jalr	-1408(ra) # 80001590 <_Z4putcc>
        string++;
    80005b18:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80005b1c:	fedff06f          	j	80005b08 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80005b20:	00000613          	li	a2,0
    80005b24:	00100593          	li	a1,1
    80005b28:	00006517          	auipc	a0,0x6
    80005b2c:	13050513          	addi	a0,a0,304 # 8000bc58 <lockPrint>
    80005b30:	ffffb097          	auipc	ra,0xffffb
    80005b34:	6f4080e7          	jalr	1780(ra) # 80001224 <copy_and_swap>
    80005b38:	fe0514e3          	bnez	a0,80005b20 <_Z11printStringPKc+0x58>
}
    80005b3c:	01813083          	ld	ra,24(sp)
    80005b40:	01013403          	ld	s0,16(sp)
    80005b44:	00813483          	ld	s1,8(sp)
    80005b48:	02010113          	addi	sp,sp,32
    80005b4c:	00008067          	ret

0000000080005b50 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80005b50:	fd010113          	addi	sp,sp,-48
    80005b54:	02113423          	sd	ra,40(sp)
    80005b58:	02813023          	sd	s0,32(sp)
    80005b5c:	00913c23          	sd	s1,24(sp)
    80005b60:	01213823          	sd	s2,16(sp)
    80005b64:	01313423          	sd	s3,8(sp)
    80005b68:	01413023          	sd	s4,0(sp)
    80005b6c:	03010413          	addi	s0,sp,48
    80005b70:	00050993          	mv	s3,a0
    80005b74:	00058a13          	mv	s4,a1
    LOCK();
    80005b78:	00100613          	li	a2,1
    80005b7c:	00000593          	li	a1,0
    80005b80:	00006517          	auipc	a0,0x6
    80005b84:	0d850513          	addi	a0,a0,216 # 8000bc58 <lockPrint>
    80005b88:	ffffb097          	auipc	ra,0xffffb
    80005b8c:	69c080e7          	jalr	1692(ra) # 80001224 <copy_and_swap>
    80005b90:	00050863          	beqz	a0,80005ba0 <_Z9getStringPci+0x50>
    80005b94:	ffffc097          	auipc	ra,0xffffc
    80005b98:	894080e7          	jalr	-1900(ra) # 80001428 <_Z15thread_dispatchv>
    80005b9c:	fddff06f          	j	80005b78 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80005ba0:	00000913          	li	s2,0
    80005ba4:	00090493          	mv	s1,s2
    80005ba8:	0019091b          	addiw	s2,s2,1
    80005bac:	03495a63          	bge	s2,s4,80005be0 <_Z9getStringPci+0x90>
        cc = getc();
    80005bb0:	ffffc097          	auipc	ra,0xffffc
    80005bb4:	9b8080e7          	jalr	-1608(ra) # 80001568 <_Z4getcv>
        if(cc < 1)
    80005bb8:	02050463          	beqz	a0,80005be0 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80005bbc:	009984b3          	add	s1,s3,s1
    80005bc0:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80005bc4:	00a00793          	li	a5,10
    80005bc8:	00f50a63          	beq	a0,a5,80005bdc <_Z9getStringPci+0x8c>
    80005bcc:	00d00793          	li	a5,13
    80005bd0:	fcf51ae3          	bne	a0,a5,80005ba4 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80005bd4:	00090493          	mv	s1,s2
    80005bd8:	0080006f          	j	80005be0 <_Z9getStringPci+0x90>
    80005bdc:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80005be0:	009984b3          	add	s1,s3,s1
    80005be4:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80005be8:	00000613          	li	a2,0
    80005bec:	00100593          	li	a1,1
    80005bf0:	00006517          	auipc	a0,0x6
    80005bf4:	06850513          	addi	a0,a0,104 # 8000bc58 <lockPrint>
    80005bf8:	ffffb097          	auipc	ra,0xffffb
    80005bfc:	62c080e7          	jalr	1580(ra) # 80001224 <copy_and_swap>
    80005c00:	fe0514e3          	bnez	a0,80005be8 <_Z9getStringPci+0x98>
    return buf;
}
    80005c04:	00098513          	mv	a0,s3
    80005c08:	02813083          	ld	ra,40(sp)
    80005c0c:	02013403          	ld	s0,32(sp)
    80005c10:	01813483          	ld	s1,24(sp)
    80005c14:	01013903          	ld	s2,16(sp)
    80005c18:	00813983          	ld	s3,8(sp)
    80005c1c:	00013a03          	ld	s4,0(sp)
    80005c20:	03010113          	addi	sp,sp,48
    80005c24:	00008067          	ret

0000000080005c28 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80005c28:	ff010113          	addi	sp,sp,-16
    80005c2c:	00813423          	sd	s0,8(sp)
    80005c30:	01010413          	addi	s0,sp,16
    80005c34:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80005c38:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80005c3c:	0006c603          	lbu	a2,0(a3)
    80005c40:	fd06071b          	addiw	a4,a2,-48
    80005c44:	0ff77713          	andi	a4,a4,255
    80005c48:	00900793          	li	a5,9
    80005c4c:	02e7e063          	bltu	a5,a4,80005c6c <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80005c50:	0025179b          	slliw	a5,a0,0x2
    80005c54:	00a787bb          	addw	a5,a5,a0
    80005c58:	0017979b          	slliw	a5,a5,0x1
    80005c5c:	00168693          	addi	a3,a3,1
    80005c60:	00c787bb          	addw	a5,a5,a2
    80005c64:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80005c68:	fd5ff06f          	j	80005c3c <_Z11stringToIntPKc+0x14>
    return n;
}
    80005c6c:	00813403          	ld	s0,8(sp)
    80005c70:	01010113          	addi	sp,sp,16
    80005c74:	00008067          	ret

0000000080005c78 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80005c78:	fc010113          	addi	sp,sp,-64
    80005c7c:	02113c23          	sd	ra,56(sp)
    80005c80:	02813823          	sd	s0,48(sp)
    80005c84:	02913423          	sd	s1,40(sp)
    80005c88:	03213023          	sd	s2,32(sp)
    80005c8c:	01313c23          	sd	s3,24(sp)
    80005c90:	04010413          	addi	s0,sp,64
    80005c94:	00050493          	mv	s1,a0
    80005c98:	00058913          	mv	s2,a1
    80005c9c:	00060993          	mv	s3,a2
    LOCK();
    80005ca0:	00100613          	li	a2,1
    80005ca4:	00000593          	li	a1,0
    80005ca8:	00006517          	auipc	a0,0x6
    80005cac:	fb050513          	addi	a0,a0,-80 # 8000bc58 <lockPrint>
    80005cb0:	ffffb097          	auipc	ra,0xffffb
    80005cb4:	574080e7          	jalr	1396(ra) # 80001224 <copy_and_swap>
    80005cb8:	00050863          	beqz	a0,80005cc8 <_Z8printIntiii+0x50>
    80005cbc:	ffffb097          	auipc	ra,0xffffb
    80005cc0:	76c080e7          	jalr	1900(ra) # 80001428 <_Z15thread_dispatchv>
    80005cc4:	fddff06f          	j	80005ca0 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80005cc8:	00098463          	beqz	s3,80005cd0 <_Z8printIntiii+0x58>
    80005ccc:	0804c463          	bltz	s1,80005d54 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80005cd0:	0004851b          	sext.w	a0,s1
    neg = 0;
    80005cd4:	00000593          	li	a1,0
    }

    i = 0;
    80005cd8:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80005cdc:	0009079b          	sext.w	a5,s2
    80005ce0:	0325773b          	remuw	a4,a0,s2
    80005ce4:	00048613          	mv	a2,s1
    80005ce8:	0014849b          	addiw	s1,s1,1
    80005cec:	02071693          	slli	a3,a4,0x20
    80005cf0:	0206d693          	srli	a3,a3,0x20
    80005cf4:	00006717          	auipc	a4,0x6
    80005cf8:	d6c70713          	addi	a4,a4,-660 # 8000ba60 <digits>
    80005cfc:	00d70733          	add	a4,a4,a3
    80005d00:	00074683          	lbu	a3,0(a4)
    80005d04:	fd040713          	addi	a4,s0,-48
    80005d08:	00c70733          	add	a4,a4,a2
    80005d0c:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80005d10:	0005071b          	sext.w	a4,a0
    80005d14:	0325553b          	divuw	a0,a0,s2
    80005d18:	fcf772e3          	bgeu	a4,a5,80005cdc <_Z8printIntiii+0x64>
    if(neg)
    80005d1c:	00058c63          	beqz	a1,80005d34 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80005d20:	fd040793          	addi	a5,s0,-48
    80005d24:	009784b3          	add	s1,a5,s1
    80005d28:	02d00793          	li	a5,45
    80005d2c:	fef48823          	sb	a5,-16(s1)
    80005d30:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80005d34:	fff4849b          	addiw	s1,s1,-1
    80005d38:	0204c463          	bltz	s1,80005d60 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80005d3c:	fd040793          	addi	a5,s0,-48
    80005d40:	009787b3          	add	a5,a5,s1
    80005d44:	ff07c503          	lbu	a0,-16(a5)
    80005d48:	ffffc097          	auipc	ra,0xffffc
    80005d4c:	848080e7          	jalr	-1976(ra) # 80001590 <_Z4putcc>
    80005d50:	fe5ff06f          	j	80005d34 <_Z8printIntiii+0xbc>
        x = -xx;
    80005d54:	4090053b          	negw	a0,s1
        neg = 1;
    80005d58:	00100593          	li	a1,1
        x = -xx;
    80005d5c:	f7dff06f          	j	80005cd8 <_Z8printIntiii+0x60>

    UNLOCK();
    80005d60:	00000613          	li	a2,0
    80005d64:	00100593          	li	a1,1
    80005d68:	00006517          	auipc	a0,0x6
    80005d6c:	ef050513          	addi	a0,a0,-272 # 8000bc58 <lockPrint>
    80005d70:	ffffb097          	auipc	ra,0xffffb
    80005d74:	4b4080e7          	jalr	1204(ra) # 80001224 <copy_and_swap>
    80005d78:	fe0514e3          	bnez	a0,80005d60 <_Z8printIntiii+0xe8>
    80005d7c:	03813083          	ld	ra,56(sp)
    80005d80:	03013403          	ld	s0,48(sp)
    80005d84:	02813483          	ld	s1,40(sp)
    80005d88:	02013903          	ld	s2,32(sp)
    80005d8c:	01813983          	ld	s3,24(sp)
    80005d90:	04010113          	addi	sp,sp,64
    80005d94:	00008067          	ret

0000000080005d98 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80005d98:	fd010113          	addi	sp,sp,-48
    80005d9c:	02113423          	sd	ra,40(sp)
    80005da0:	02813023          	sd	s0,32(sp)
    80005da4:	00913c23          	sd	s1,24(sp)
    80005da8:	01213823          	sd	s2,16(sp)
    80005dac:	01313423          	sd	s3,8(sp)
    80005db0:	03010413          	addi	s0,sp,48
    80005db4:	00050493          	mv	s1,a0
    80005db8:	00058913          	mv	s2,a1
    80005dbc:	0015879b          	addiw	a5,a1,1
    80005dc0:	0007851b          	sext.w	a0,a5
    80005dc4:	00f4a023          	sw	a5,0(s1)
    80005dc8:	0004a823          	sw	zero,16(s1)
    80005dcc:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80005dd0:	00251513          	slli	a0,a0,0x2
    80005dd4:	ffffb097          	auipc	ra,0xffffb
    80005dd8:	53c080e7          	jalr	1340(ra) # 80001310 <_Z9mem_allocm>
    80005ddc:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80005de0:	01000513          	li	a0,16
    80005de4:	ffffd097          	auipc	ra,0xffffd
    80005de8:	8bc080e7          	jalr	-1860(ra) # 800026a0 <_Znwm>
    80005dec:	00050993          	mv	s3,a0
    80005df0:	00000593          	li	a1,0
    80005df4:	ffffd097          	auipc	ra,0xffffd
    80005df8:	ba0080e7          	jalr	-1120(ra) # 80002994 <_ZN9SemaphoreC1Ej>
    80005dfc:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80005e00:	01000513          	li	a0,16
    80005e04:	ffffd097          	auipc	ra,0xffffd
    80005e08:	89c080e7          	jalr	-1892(ra) # 800026a0 <_Znwm>
    80005e0c:	00050993          	mv	s3,a0
    80005e10:	00090593          	mv	a1,s2
    80005e14:	ffffd097          	auipc	ra,0xffffd
    80005e18:	b80080e7          	jalr	-1152(ra) # 80002994 <_ZN9SemaphoreC1Ej>
    80005e1c:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80005e20:	01000513          	li	a0,16
    80005e24:	ffffd097          	auipc	ra,0xffffd
    80005e28:	87c080e7          	jalr	-1924(ra) # 800026a0 <_Znwm>
    80005e2c:	00050913          	mv	s2,a0
    80005e30:	00100593          	li	a1,1
    80005e34:	ffffd097          	auipc	ra,0xffffd
    80005e38:	b60080e7          	jalr	-1184(ra) # 80002994 <_ZN9SemaphoreC1Ej>
    80005e3c:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80005e40:	01000513          	li	a0,16
    80005e44:	ffffd097          	auipc	ra,0xffffd
    80005e48:	85c080e7          	jalr	-1956(ra) # 800026a0 <_Znwm>
    80005e4c:	00050913          	mv	s2,a0
    80005e50:	00100593          	li	a1,1
    80005e54:	ffffd097          	auipc	ra,0xffffd
    80005e58:	b40080e7          	jalr	-1216(ra) # 80002994 <_ZN9SemaphoreC1Ej>
    80005e5c:	0324b823          	sd	s2,48(s1)
}
    80005e60:	02813083          	ld	ra,40(sp)
    80005e64:	02013403          	ld	s0,32(sp)
    80005e68:	01813483          	ld	s1,24(sp)
    80005e6c:	01013903          	ld	s2,16(sp)
    80005e70:	00813983          	ld	s3,8(sp)
    80005e74:	03010113          	addi	sp,sp,48
    80005e78:	00008067          	ret
    80005e7c:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80005e80:	00098513          	mv	a0,s3
    80005e84:	ffffd097          	auipc	ra,0xffffd
    80005e88:	86c080e7          	jalr	-1940(ra) # 800026f0 <_ZdlPv>
    80005e8c:	00048513          	mv	a0,s1
    80005e90:	00007097          	auipc	ra,0x7
    80005e94:	ea8080e7          	jalr	-344(ra) # 8000cd38 <_Unwind_Resume>
    80005e98:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80005e9c:	00098513          	mv	a0,s3
    80005ea0:	ffffd097          	auipc	ra,0xffffd
    80005ea4:	850080e7          	jalr	-1968(ra) # 800026f0 <_ZdlPv>
    80005ea8:	00048513          	mv	a0,s1
    80005eac:	00007097          	auipc	ra,0x7
    80005eb0:	e8c080e7          	jalr	-372(ra) # 8000cd38 <_Unwind_Resume>
    80005eb4:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80005eb8:	00090513          	mv	a0,s2
    80005ebc:	ffffd097          	auipc	ra,0xffffd
    80005ec0:	834080e7          	jalr	-1996(ra) # 800026f0 <_ZdlPv>
    80005ec4:	00048513          	mv	a0,s1
    80005ec8:	00007097          	auipc	ra,0x7
    80005ecc:	e70080e7          	jalr	-400(ra) # 8000cd38 <_Unwind_Resume>
    80005ed0:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80005ed4:	00090513          	mv	a0,s2
    80005ed8:	ffffd097          	auipc	ra,0xffffd
    80005edc:	818080e7          	jalr	-2024(ra) # 800026f0 <_ZdlPv>
    80005ee0:	00048513          	mv	a0,s1
    80005ee4:	00007097          	auipc	ra,0x7
    80005ee8:	e54080e7          	jalr	-428(ra) # 8000cd38 <_Unwind_Resume>

0000000080005eec <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80005eec:	fe010113          	addi	sp,sp,-32
    80005ef0:	00113c23          	sd	ra,24(sp)
    80005ef4:	00813823          	sd	s0,16(sp)
    80005ef8:	00913423          	sd	s1,8(sp)
    80005efc:	01213023          	sd	s2,0(sp)
    80005f00:	02010413          	addi	s0,sp,32
    80005f04:	00050493          	mv	s1,a0
    80005f08:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80005f0c:	01853503          	ld	a0,24(a0)
    80005f10:	ffffd097          	auipc	ra,0xffffd
    80005f14:	abc080e7          	jalr	-1348(ra) # 800029cc <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80005f18:	0304b503          	ld	a0,48(s1)
    80005f1c:	ffffd097          	auipc	ra,0xffffd
    80005f20:	ab0080e7          	jalr	-1360(ra) # 800029cc <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80005f24:	0084b783          	ld	a5,8(s1)
    80005f28:	0144a703          	lw	a4,20(s1)
    80005f2c:	00271713          	slli	a4,a4,0x2
    80005f30:	00e787b3          	add	a5,a5,a4
    80005f34:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80005f38:	0144a783          	lw	a5,20(s1)
    80005f3c:	0017879b          	addiw	a5,a5,1
    80005f40:	0004a703          	lw	a4,0(s1)
    80005f44:	02e7e7bb          	remw	a5,a5,a4
    80005f48:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80005f4c:	0304b503          	ld	a0,48(s1)
    80005f50:	ffffd097          	auipc	ra,0xffffd
    80005f54:	aa8080e7          	jalr	-1368(ra) # 800029f8 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80005f58:	0204b503          	ld	a0,32(s1)
    80005f5c:	ffffd097          	auipc	ra,0xffffd
    80005f60:	a9c080e7          	jalr	-1380(ra) # 800029f8 <_ZN9Semaphore6signalEv>

}
    80005f64:	01813083          	ld	ra,24(sp)
    80005f68:	01013403          	ld	s0,16(sp)
    80005f6c:	00813483          	ld	s1,8(sp)
    80005f70:	00013903          	ld	s2,0(sp)
    80005f74:	02010113          	addi	sp,sp,32
    80005f78:	00008067          	ret

0000000080005f7c <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80005f7c:	fe010113          	addi	sp,sp,-32
    80005f80:	00113c23          	sd	ra,24(sp)
    80005f84:	00813823          	sd	s0,16(sp)
    80005f88:	00913423          	sd	s1,8(sp)
    80005f8c:	01213023          	sd	s2,0(sp)
    80005f90:	02010413          	addi	s0,sp,32
    80005f94:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80005f98:	02053503          	ld	a0,32(a0)
    80005f9c:	ffffd097          	auipc	ra,0xffffd
    80005fa0:	a30080e7          	jalr	-1488(ra) # 800029cc <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80005fa4:	0284b503          	ld	a0,40(s1)
    80005fa8:	ffffd097          	auipc	ra,0xffffd
    80005fac:	a24080e7          	jalr	-1500(ra) # 800029cc <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80005fb0:	0084b703          	ld	a4,8(s1)
    80005fb4:	0104a783          	lw	a5,16(s1)
    80005fb8:	00279693          	slli	a3,a5,0x2
    80005fbc:	00d70733          	add	a4,a4,a3
    80005fc0:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80005fc4:	0017879b          	addiw	a5,a5,1
    80005fc8:	0004a703          	lw	a4,0(s1)
    80005fcc:	02e7e7bb          	remw	a5,a5,a4
    80005fd0:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80005fd4:	0284b503          	ld	a0,40(s1)
    80005fd8:	ffffd097          	auipc	ra,0xffffd
    80005fdc:	a20080e7          	jalr	-1504(ra) # 800029f8 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80005fe0:	0184b503          	ld	a0,24(s1)
    80005fe4:	ffffd097          	auipc	ra,0xffffd
    80005fe8:	a14080e7          	jalr	-1516(ra) # 800029f8 <_ZN9Semaphore6signalEv>

    return ret;
}
    80005fec:	00090513          	mv	a0,s2
    80005ff0:	01813083          	ld	ra,24(sp)
    80005ff4:	01013403          	ld	s0,16(sp)
    80005ff8:	00813483          	ld	s1,8(sp)
    80005ffc:	00013903          	ld	s2,0(sp)
    80006000:	02010113          	addi	sp,sp,32
    80006004:	00008067          	ret

0000000080006008 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80006008:	fe010113          	addi	sp,sp,-32
    8000600c:	00113c23          	sd	ra,24(sp)
    80006010:	00813823          	sd	s0,16(sp)
    80006014:	00913423          	sd	s1,8(sp)
    80006018:	01213023          	sd	s2,0(sp)
    8000601c:	02010413          	addi	s0,sp,32
    80006020:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80006024:	02853503          	ld	a0,40(a0)
    80006028:	ffffd097          	auipc	ra,0xffffd
    8000602c:	9a4080e7          	jalr	-1628(ra) # 800029cc <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80006030:	0304b503          	ld	a0,48(s1)
    80006034:	ffffd097          	auipc	ra,0xffffd
    80006038:	998080e7          	jalr	-1640(ra) # 800029cc <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    8000603c:	0144a783          	lw	a5,20(s1)
    80006040:	0104a903          	lw	s2,16(s1)
    80006044:	0327ce63          	blt	a5,s2,80006080 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80006048:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    8000604c:	0304b503          	ld	a0,48(s1)
    80006050:	ffffd097          	auipc	ra,0xffffd
    80006054:	9a8080e7          	jalr	-1624(ra) # 800029f8 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80006058:	0284b503          	ld	a0,40(s1)
    8000605c:	ffffd097          	auipc	ra,0xffffd
    80006060:	99c080e7          	jalr	-1636(ra) # 800029f8 <_ZN9Semaphore6signalEv>

    return ret;
}
    80006064:	00090513          	mv	a0,s2
    80006068:	01813083          	ld	ra,24(sp)
    8000606c:	01013403          	ld	s0,16(sp)
    80006070:	00813483          	ld	s1,8(sp)
    80006074:	00013903          	ld	s2,0(sp)
    80006078:	02010113          	addi	sp,sp,32
    8000607c:	00008067          	ret
        ret = cap - head + tail;
    80006080:	0004a703          	lw	a4,0(s1)
    80006084:	4127093b          	subw	s2,a4,s2
    80006088:	00f9093b          	addw	s2,s2,a5
    8000608c:	fc1ff06f          	j	8000604c <_ZN9BufferCPP6getCntEv+0x44>

0000000080006090 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80006090:	fe010113          	addi	sp,sp,-32
    80006094:	00113c23          	sd	ra,24(sp)
    80006098:	00813823          	sd	s0,16(sp)
    8000609c:	00913423          	sd	s1,8(sp)
    800060a0:	02010413          	addi	s0,sp,32
    800060a4:	00050493          	mv	s1,a0
    Console::putc('\n');
    800060a8:	00a00513          	li	a0,10
    800060ac:	ffffd097          	auipc	ra,0xffffd
    800060b0:	9f8080e7          	jalr	-1544(ra) # 80002aa4 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    800060b4:	00003517          	auipc	a0,0x3
    800060b8:	35c50513          	addi	a0,a0,860 # 80009410 <CONSOLE_STATUS+0x400>
    800060bc:	00000097          	auipc	ra,0x0
    800060c0:	a0c080e7          	jalr	-1524(ra) # 80005ac8 <_Z11printStringPKc>
    while (getCnt()) {
    800060c4:	00048513          	mv	a0,s1
    800060c8:	00000097          	auipc	ra,0x0
    800060cc:	f40080e7          	jalr	-192(ra) # 80006008 <_ZN9BufferCPP6getCntEv>
    800060d0:	02050c63          	beqz	a0,80006108 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    800060d4:	0084b783          	ld	a5,8(s1)
    800060d8:	0104a703          	lw	a4,16(s1)
    800060dc:	00271713          	slli	a4,a4,0x2
    800060e0:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    800060e4:	0007c503          	lbu	a0,0(a5)
    800060e8:	ffffd097          	auipc	ra,0xffffd
    800060ec:	9bc080e7          	jalr	-1604(ra) # 80002aa4 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    800060f0:	0104a783          	lw	a5,16(s1)
    800060f4:	0017879b          	addiw	a5,a5,1
    800060f8:	0004a703          	lw	a4,0(s1)
    800060fc:	02e7e7bb          	remw	a5,a5,a4
    80006100:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80006104:	fc1ff06f          	j	800060c4 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80006108:	02100513          	li	a0,33
    8000610c:	ffffd097          	auipc	ra,0xffffd
    80006110:	998080e7          	jalr	-1640(ra) # 80002aa4 <_ZN7Console4putcEc>
    Console::putc('\n');
    80006114:	00a00513          	li	a0,10
    80006118:	ffffd097          	auipc	ra,0xffffd
    8000611c:	98c080e7          	jalr	-1652(ra) # 80002aa4 <_ZN7Console4putcEc>
    mem_free(buffer);
    80006120:	0084b503          	ld	a0,8(s1)
    80006124:	ffffb097          	auipc	ra,0xffffb
    80006128:	22c080e7          	jalr	556(ra) # 80001350 <_Z8mem_freePv>
    delete itemAvailable;
    8000612c:	0204b503          	ld	a0,32(s1)
    80006130:	00050863          	beqz	a0,80006140 <_ZN9BufferCPPD1Ev+0xb0>
    80006134:	00053783          	ld	a5,0(a0)
    80006138:	0087b783          	ld	a5,8(a5)
    8000613c:	000780e7          	jalr	a5
    delete spaceAvailable;
    80006140:	0184b503          	ld	a0,24(s1)
    80006144:	00050863          	beqz	a0,80006154 <_ZN9BufferCPPD1Ev+0xc4>
    80006148:	00053783          	ld	a5,0(a0)
    8000614c:	0087b783          	ld	a5,8(a5)
    80006150:	000780e7          	jalr	a5
    delete mutexTail;
    80006154:	0304b503          	ld	a0,48(s1)
    80006158:	00050863          	beqz	a0,80006168 <_ZN9BufferCPPD1Ev+0xd8>
    8000615c:	00053783          	ld	a5,0(a0)
    80006160:	0087b783          	ld	a5,8(a5)
    80006164:	000780e7          	jalr	a5
    delete mutexHead;
    80006168:	0284b503          	ld	a0,40(s1)
    8000616c:	00050863          	beqz	a0,8000617c <_ZN9BufferCPPD1Ev+0xec>
    80006170:	00053783          	ld	a5,0(a0)
    80006174:	0087b783          	ld	a5,8(a5)
    80006178:	000780e7          	jalr	a5
}
    8000617c:	01813083          	ld	ra,24(sp)
    80006180:	01013403          	ld	s0,16(sp)
    80006184:	00813483          	ld	s1,8(sp)
    80006188:	02010113          	addi	sp,sp,32
    8000618c:	00008067          	ret

0000000080006190 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    80006190:	fe010113          	addi	sp,sp,-32
    80006194:	00113c23          	sd	ra,24(sp)
    80006198:	00813823          	sd	s0,16(sp)
    8000619c:	00913423          	sd	s1,8(sp)
    800061a0:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    800061a4:	00003517          	auipc	a0,0x3
    800061a8:	28450513          	addi	a0,a0,644 # 80009428 <CONSOLE_STATUS+0x418>
    800061ac:	00000097          	auipc	ra,0x0
    800061b0:	91c080e7          	jalr	-1764(ra) # 80005ac8 <_Z11printStringPKc>
    int test = getc() - '0';
    800061b4:	ffffb097          	auipc	ra,0xffffb
    800061b8:	3b4080e7          	jalr	948(ra) # 80001568 <_Z4getcv>
    800061bc:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    800061c0:	ffffb097          	auipc	ra,0xffffb
    800061c4:	3a8080e7          	jalr	936(ra) # 80001568 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    800061c8:	00700793          	li	a5,7
    800061cc:	1097e263          	bltu	a5,s1,800062d0 <_Z8userMainv+0x140>
    800061d0:	00249493          	slli	s1,s1,0x2
    800061d4:	00003717          	auipc	a4,0x3
    800061d8:	4ac70713          	addi	a4,a4,1196 # 80009680 <CONSOLE_STATUS+0x670>
    800061dc:	00e484b3          	add	s1,s1,a4
    800061e0:	0004a783          	lw	a5,0(s1)
    800061e4:	00e787b3          	add	a5,a5,a4
    800061e8:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    800061ec:	fffff097          	auipc	ra,0xfffff
    800061f0:	f54080e7          	jalr	-172(ra) # 80005140 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    800061f4:	00003517          	auipc	a0,0x3
    800061f8:	25450513          	addi	a0,a0,596 # 80009448 <CONSOLE_STATUS+0x438>
    800061fc:	00000097          	auipc	ra,0x0
    80006200:	8cc080e7          	jalr	-1844(ra) # 80005ac8 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80006204:	01813083          	ld	ra,24(sp)
    80006208:	01013403          	ld	s0,16(sp)
    8000620c:	00813483          	ld	s1,8(sp)
    80006210:	02010113          	addi	sp,sp,32
    80006214:	00008067          	ret
            Threads_CPP_API_test();
    80006218:	ffffe097          	auipc	ra,0xffffe
    8000621c:	e08080e7          	jalr	-504(ra) # 80004020 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80006220:	00003517          	auipc	a0,0x3
    80006224:	26850513          	addi	a0,a0,616 # 80009488 <CONSOLE_STATUS+0x478>
    80006228:	00000097          	auipc	ra,0x0
    8000622c:	8a0080e7          	jalr	-1888(ra) # 80005ac8 <_Z11printStringPKc>
            break;
    80006230:	fd5ff06f          	j	80006204 <_Z8userMainv+0x74>
            producerConsumer_C_API();
    80006234:	ffffd097          	auipc	ra,0xffffd
    80006238:	640080e7          	jalr	1600(ra) # 80003874 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    8000623c:	00003517          	auipc	a0,0x3
    80006240:	28c50513          	addi	a0,a0,652 # 800094c8 <CONSOLE_STATUS+0x4b8>
    80006244:	00000097          	auipc	ra,0x0
    80006248:	884080e7          	jalr	-1916(ra) # 80005ac8 <_Z11printStringPKc>
            break;
    8000624c:	fb9ff06f          	j	80006204 <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    80006250:	fffff097          	auipc	ra,0xfffff
    80006254:	234080e7          	jalr	564(ra) # 80005484 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80006258:	00003517          	auipc	a0,0x3
    8000625c:	2c050513          	addi	a0,a0,704 # 80009518 <CONSOLE_STATUS+0x508>
    80006260:	00000097          	auipc	ra,0x0
    80006264:	868080e7          	jalr	-1944(ra) # 80005ac8 <_Z11printStringPKc>
            break;
    80006268:	f9dff06f          	j	80006204 <_Z8userMainv+0x74>
            testSleeping();
    8000626c:	00000097          	auipc	ra,0x0
    80006270:	11c080e7          	jalr	284(ra) # 80006388 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    80006274:	00003517          	auipc	a0,0x3
    80006278:	2fc50513          	addi	a0,a0,764 # 80009570 <CONSOLE_STATUS+0x560>
    8000627c:	00000097          	auipc	ra,0x0
    80006280:	84c080e7          	jalr	-1972(ra) # 80005ac8 <_Z11printStringPKc>
            break;
    80006284:	f81ff06f          	j	80006204 <_Z8userMainv+0x74>
            testConsumerProducer();
    80006288:	ffffe097          	auipc	ra,0xffffe
    8000628c:	258080e7          	jalr	600(ra) # 800044e0 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    80006290:	00003517          	auipc	a0,0x3
    80006294:	31050513          	addi	a0,a0,784 # 800095a0 <CONSOLE_STATUS+0x590>
    80006298:	00000097          	auipc	ra,0x0
    8000629c:	830080e7          	jalr	-2000(ra) # 80005ac8 <_Z11printStringPKc>
            break;
    800062a0:	f65ff06f          	j	80006204 <_Z8userMainv+0x74>
            System_Mode_test();
    800062a4:	00000097          	auipc	ra,0x0
    800062a8:	658080e7          	jalr	1624(ra) # 800068fc <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    800062ac:	00003517          	auipc	a0,0x3
    800062b0:	33450513          	addi	a0,a0,820 # 800095e0 <CONSOLE_STATUS+0x5d0>
    800062b4:	00000097          	auipc	ra,0x0
    800062b8:	814080e7          	jalr	-2028(ra) # 80005ac8 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    800062bc:	00003517          	auipc	a0,0x3
    800062c0:	34450513          	addi	a0,a0,836 # 80009600 <CONSOLE_STATUS+0x5f0>
    800062c4:	00000097          	auipc	ra,0x0
    800062c8:	804080e7          	jalr	-2044(ra) # 80005ac8 <_Z11printStringPKc>
            break;
    800062cc:	f39ff06f          	j	80006204 <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    800062d0:	00003517          	auipc	a0,0x3
    800062d4:	38850513          	addi	a0,a0,904 # 80009658 <CONSOLE_STATUS+0x648>
    800062d8:	fffff097          	auipc	ra,0xfffff
    800062dc:	7f0080e7          	jalr	2032(ra) # 80005ac8 <_Z11printStringPKc>
    800062e0:	f25ff06f          	j	80006204 <_Z8userMainv+0x74>

00000000800062e4 <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    800062e4:	fe010113          	addi	sp,sp,-32
    800062e8:	00113c23          	sd	ra,24(sp)
    800062ec:	00813823          	sd	s0,16(sp)
    800062f0:	00913423          	sd	s1,8(sp)
    800062f4:	01213023          	sd	s2,0(sp)
    800062f8:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    800062fc:	00053903          	ld	s2,0(a0)
    int i = 6;
    80006300:	00600493          	li	s1,6
    while (--i > 0) {
    80006304:	fff4849b          	addiw	s1,s1,-1
    80006308:	04905463          	blez	s1,80006350 <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    8000630c:	00003517          	auipc	a0,0x3
    80006310:	39450513          	addi	a0,a0,916 # 800096a0 <CONSOLE_STATUS+0x690>
    80006314:	fffff097          	auipc	ra,0xfffff
    80006318:	7b4080e7          	jalr	1972(ra) # 80005ac8 <_Z11printStringPKc>
        printInt(sleep_time);
    8000631c:	00000613          	li	a2,0
    80006320:	00a00593          	li	a1,10
    80006324:	0009051b          	sext.w	a0,s2
    80006328:	00000097          	auipc	ra,0x0
    8000632c:	950080e7          	jalr	-1712(ra) # 80005c78 <_Z8printIntiii>
        printString(" !\n");
    80006330:	00003517          	auipc	a0,0x3
    80006334:	37850513          	addi	a0,a0,888 # 800096a8 <CONSOLE_STATUS+0x698>
    80006338:	fffff097          	auipc	ra,0xfffff
    8000633c:	790080e7          	jalr	1936(ra) # 80005ac8 <_Z11printStringPKc>
        time_sleep(sleep_time);
    80006340:	00090513          	mv	a0,s2
    80006344:	ffffb097          	auipc	ra,0xffffb
    80006348:	12c080e7          	jalr	300(ra) # 80001470 <_Z10time_sleepm>
    while (--i > 0) {
    8000634c:	fb9ff06f          	j	80006304 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    80006350:	00a00793          	li	a5,10
    80006354:	02f95933          	divu	s2,s2,a5
    80006358:	fff90913          	addi	s2,s2,-1
    8000635c:	00006797          	auipc	a5,0x6
    80006360:	90478793          	addi	a5,a5,-1788 # 8000bc60 <_ZL8finished>
    80006364:	01278933          	add	s2,a5,s2
    80006368:	00100793          	li	a5,1
    8000636c:	00f90023          	sb	a5,0(s2)
}
    80006370:	01813083          	ld	ra,24(sp)
    80006374:	01013403          	ld	s0,16(sp)
    80006378:	00813483          	ld	s1,8(sp)
    8000637c:	00013903          	ld	s2,0(sp)
    80006380:	02010113          	addi	sp,sp,32
    80006384:	00008067          	ret

0000000080006388 <_Z12testSleepingv>:

void testSleeping() {
    80006388:	fc010113          	addi	sp,sp,-64
    8000638c:	02113c23          	sd	ra,56(sp)
    80006390:	02813823          	sd	s0,48(sp)
    80006394:	02913423          	sd	s1,40(sp)
    80006398:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    8000639c:	00a00793          	li	a5,10
    800063a0:	fcf43823          	sd	a5,-48(s0)
    800063a4:	01400793          	li	a5,20
    800063a8:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    800063ac:	00000493          	li	s1,0
    800063b0:	02c0006f          	j	800063dc <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    800063b4:	00349793          	slli	a5,s1,0x3
    800063b8:	fd040613          	addi	a2,s0,-48
    800063bc:	00f60633          	add	a2,a2,a5
    800063c0:	00000597          	auipc	a1,0x0
    800063c4:	f2458593          	addi	a1,a1,-220 # 800062e4 <_ZL9sleepyRunPv>
    800063c8:	fc040513          	addi	a0,s0,-64
    800063cc:	00f50533          	add	a0,a0,a5
    800063d0:	ffffb097          	auipc	ra,0xffffb
    800063d4:	fb0080e7          	jalr	-80(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    800063d8:	0014849b          	addiw	s1,s1,1
    800063dc:	00100793          	li	a5,1
    800063e0:	fc97dae3          	bge	a5,s1,800063b4 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    800063e4:	00006797          	auipc	a5,0x6
    800063e8:	87c7c783          	lbu	a5,-1924(a5) # 8000bc60 <_ZL8finished>
    800063ec:	fe078ce3          	beqz	a5,800063e4 <_Z12testSleepingv+0x5c>
    800063f0:	00006797          	auipc	a5,0x6
    800063f4:	8717c783          	lbu	a5,-1935(a5) # 8000bc61 <_ZL8finished+0x1>
    800063f8:	fe0786e3          	beqz	a5,800063e4 <_Z12testSleepingv+0x5c>
}
    800063fc:	03813083          	ld	ra,56(sp)
    80006400:	03013403          	ld	s0,48(sp)
    80006404:	02813483          	ld	s1,40(sp)
    80006408:	04010113          	addi	sp,sp,64
    8000640c:	00008067          	ret

0000000080006410 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80006410:	fe010113          	addi	sp,sp,-32
    80006414:	00113c23          	sd	ra,24(sp)
    80006418:	00813823          	sd	s0,16(sp)
    8000641c:	00913423          	sd	s1,8(sp)
    80006420:	01213023          	sd	s2,0(sp)
    80006424:	02010413          	addi	s0,sp,32
    80006428:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    8000642c:	00100793          	li	a5,1
    80006430:	02a7f863          	bgeu	a5,a0,80006460 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80006434:	00a00793          	li	a5,10
    80006438:	02f577b3          	remu	a5,a0,a5
    8000643c:	02078e63          	beqz	a5,80006478 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80006440:	fff48513          	addi	a0,s1,-1
    80006444:	00000097          	auipc	ra,0x0
    80006448:	fcc080e7          	jalr	-52(ra) # 80006410 <_ZL9fibonaccim>
    8000644c:	00050913          	mv	s2,a0
    80006450:	ffe48513          	addi	a0,s1,-2
    80006454:	00000097          	auipc	ra,0x0
    80006458:	fbc080e7          	jalr	-68(ra) # 80006410 <_ZL9fibonaccim>
    8000645c:	00a90533          	add	a0,s2,a0
}
    80006460:	01813083          	ld	ra,24(sp)
    80006464:	01013403          	ld	s0,16(sp)
    80006468:	00813483          	ld	s1,8(sp)
    8000646c:	00013903          	ld	s2,0(sp)
    80006470:	02010113          	addi	sp,sp,32
    80006474:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80006478:	ffffb097          	auipc	ra,0xffffb
    8000647c:	fb0080e7          	jalr	-80(ra) # 80001428 <_Z15thread_dispatchv>
    80006480:	fc1ff06f          	j	80006440 <_ZL9fibonaccim+0x30>

0000000080006484 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80006484:	fe010113          	addi	sp,sp,-32
    80006488:	00113c23          	sd	ra,24(sp)
    8000648c:	00813823          	sd	s0,16(sp)
    80006490:	00913423          	sd	s1,8(sp)
    80006494:	01213023          	sd	s2,0(sp)
    80006498:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    8000649c:	00a00493          	li	s1,10
    800064a0:	0400006f          	j	800064e0 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800064a4:	00003517          	auipc	a0,0x3
    800064a8:	ed450513          	addi	a0,a0,-300 # 80009378 <CONSOLE_STATUS+0x368>
    800064ac:	fffff097          	auipc	ra,0xfffff
    800064b0:	61c080e7          	jalr	1564(ra) # 80005ac8 <_Z11printStringPKc>
    800064b4:	00000613          	li	a2,0
    800064b8:	00a00593          	li	a1,10
    800064bc:	00048513          	mv	a0,s1
    800064c0:	fffff097          	auipc	ra,0xfffff
    800064c4:	7b8080e7          	jalr	1976(ra) # 80005c78 <_Z8printIntiii>
    800064c8:	00003517          	auipc	a0,0x3
    800064cc:	0a050513          	addi	a0,a0,160 # 80009568 <CONSOLE_STATUS+0x558>
    800064d0:	fffff097          	auipc	ra,0xfffff
    800064d4:	5f8080e7          	jalr	1528(ra) # 80005ac8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800064d8:	0014849b          	addiw	s1,s1,1
    800064dc:	0ff4f493          	andi	s1,s1,255
    800064e0:	00c00793          	li	a5,12
    800064e4:	fc97f0e3          	bgeu	a5,s1,800064a4 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800064e8:	00003517          	auipc	a0,0x3
    800064ec:	e9850513          	addi	a0,a0,-360 # 80009380 <CONSOLE_STATUS+0x370>
    800064f0:	fffff097          	auipc	ra,0xfffff
    800064f4:	5d8080e7          	jalr	1496(ra) # 80005ac8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800064f8:	00500313          	li	t1,5
    thread_dispatch();
    800064fc:	ffffb097          	auipc	ra,0xffffb
    80006500:	f2c080e7          	jalr	-212(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80006504:	01000513          	li	a0,16
    80006508:	00000097          	auipc	ra,0x0
    8000650c:	f08080e7          	jalr	-248(ra) # 80006410 <_ZL9fibonaccim>
    80006510:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80006514:	00003517          	auipc	a0,0x3
    80006518:	e7c50513          	addi	a0,a0,-388 # 80009390 <CONSOLE_STATUS+0x380>
    8000651c:	fffff097          	auipc	ra,0xfffff
    80006520:	5ac080e7          	jalr	1452(ra) # 80005ac8 <_Z11printStringPKc>
    80006524:	00000613          	li	a2,0
    80006528:	00a00593          	li	a1,10
    8000652c:	0009051b          	sext.w	a0,s2
    80006530:	fffff097          	auipc	ra,0xfffff
    80006534:	748080e7          	jalr	1864(ra) # 80005c78 <_Z8printIntiii>
    80006538:	00003517          	auipc	a0,0x3
    8000653c:	03050513          	addi	a0,a0,48 # 80009568 <CONSOLE_STATUS+0x558>
    80006540:	fffff097          	auipc	ra,0xfffff
    80006544:	588080e7          	jalr	1416(ra) # 80005ac8 <_Z11printStringPKc>
    80006548:	0400006f          	j	80006588 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000654c:	00003517          	auipc	a0,0x3
    80006550:	e2c50513          	addi	a0,a0,-468 # 80009378 <CONSOLE_STATUS+0x368>
    80006554:	fffff097          	auipc	ra,0xfffff
    80006558:	574080e7          	jalr	1396(ra) # 80005ac8 <_Z11printStringPKc>
    8000655c:	00000613          	li	a2,0
    80006560:	00a00593          	li	a1,10
    80006564:	00048513          	mv	a0,s1
    80006568:	fffff097          	auipc	ra,0xfffff
    8000656c:	710080e7          	jalr	1808(ra) # 80005c78 <_Z8printIntiii>
    80006570:	00003517          	auipc	a0,0x3
    80006574:	ff850513          	addi	a0,a0,-8 # 80009568 <CONSOLE_STATUS+0x558>
    80006578:	fffff097          	auipc	ra,0xfffff
    8000657c:	550080e7          	jalr	1360(ra) # 80005ac8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80006580:	0014849b          	addiw	s1,s1,1
    80006584:	0ff4f493          	andi	s1,s1,255
    80006588:	00f00793          	li	a5,15
    8000658c:	fc97f0e3          	bgeu	a5,s1,8000654c <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80006590:	00003517          	auipc	a0,0x3
    80006594:	e1050513          	addi	a0,a0,-496 # 800093a0 <CONSOLE_STATUS+0x390>
    80006598:	fffff097          	auipc	ra,0xfffff
    8000659c:	530080e7          	jalr	1328(ra) # 80005ac8 <_Z11printStringPKc>
    finishedD = true;
    800065a0:	00100793          	li	a5,1
    800065a4:	00005717          	auipc	a4,0x5
    800065a8:	6af70f23          	sb	a5,1726(a4) # 8000bc62 <_ZL9finishedD>
    thread_dispatch();
    800065ac:	ffffb097          	auipc	ra,0xffffb
    800065b0:	e7c080e7          	jalr	-388(ra) # 80001428 <_Z15thread_dispatchv>
}
    800065b4:	01813083          	ld	ra,24(sp)
    800065b8:	01013403          	ld	s0,16(sp)
    800065bc:	00813483          	ld	s1,8(sp)
    800065c0:	00013903          	ld	s2,0(sp)
    800065c4:	02010113          	addi	sp,sp,32
    800065c8:	00008067          	ret

00000000800065cc <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800065cc:	fe010113          	addi	sp,sp,-32
    800065d0:	00113c23          	sd	ra,24(sp)
    800065d4:	00813823          	sd	s0,16(sp)
    800065d8:	00913423          	sd	s1,8(sp)
    800065dc:	01213023          	sd	s2,0(sp)
    800065e0:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800065e4:	00000493          	li	s1,0
    800065e8:	0400006f          	j	80006628 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800065ec:	00003517          	auipc	a0,0x3
    800065f0:	d4c50513          	addi	a0,a0,-692 # 80009338 <CONSOLE_STATUS+0x328>
    800065f4:	fffff097          	auipc	ra,0xfffff
    800065f8:	4d4080e7          	jalr	1236(ra) # 80005ac8 <_Z11printStringPKc>
    800065fc:	00000613          	li	a2,0
    80006600:	00a00593          	li	a1,10
    80006604:	00048513          	mv	a0,s1
    80006608:	fffff097          	auipc	ra,0xfffff
    8000660c:	670080e7          	jalr	1648(ra) # 80005c78 <_Z8printIntiii>
    80006610:	00003517          	auipc	a0,0x3
    80006614:	f5850513          	addi	a0,a0,-168 # 80009568 <CONSOLE_STATUS+0x558>
    80006618:	fffff097          	auipc	ra,0xfffff
    8000661c:	4b0080e7          	jalr	1200(ra) # 80005ac8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80006620:	0014849b          	addiw	s1,s1,1
    80006624:	0ff4f493          	andi	s1,s1,255
    80006628:	00200793          	li	a5,2
    8000662c:	fc97f0e3          	bgeu	a5,s1,800065ec <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80006630:	00003517          	auipc	a0,0x3
    80006634:	d1050513          	addi	a0,a0,-752 # 80009340 <CONSOLE_STATUS+0x330>
    80006638:	fffff097          	auipc	ra,0xfffff
    8000663c:	490080e7          	jalr	1168(ra) # 80005ac8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80006640:	00700313          	li	t1,7
    thread_dispatch();
    80006644:	ffffb097          	auipc	ra,0xffffb
    80006648:	de4080e7          	jalr	-540(ra) # 80001428 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    8000664c:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80006650:	00003517          	auipc	a0,0x3
    80006654:	d0050513          	addi	a0,a0,-768 # 80009350 <CONSOLE_STATUS+0x340>
    80006658:	fffff097          	auipc	ra,0xfffff
    8000665c:	470080e7          	jalr	1136(ra) # 80005ac8 <_Z11printStringPKc>
    80006660:	00000613          	li	a2,0
    80006664:	00a00593          	li	a1,10
    80006668:	0009051b          	sext.w	a0,s2
    8000666c:	fffff097          	auipc	ra,0xfffff
    80006670:	60c080e7          	jalr	1548(ra) # 80005c78 <_Z8printIntiii>
    80006674:	00003517          	auipc	a0,0x3
    80006678:	ef450513          	addi	a0,a0,-268 # 80009568 <CONSOLE_STATUS+0x558>
    8000667c:	fffff097          	auipc	ra,0xfffff
    80006680:	44c080e7          	jalr	1100(ra) # 80005ac8 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80006684:	00c00513          	li	a0,12
    80006688:	00000097          	auipc	ra,0x0
    8000668c:	d88080e7          	jalr	-632(ra) # 80006410 <_ZL9fibonaccim>
    80006690:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006694:	00003517          	auipc	a0,0x3
    80006698:	cc450513          	addi	a0,a0,-828 # 80009358 <CONSOLE_STATUS+0x348>
    8000669c:	fffff097          	auipc	ra,0xfffff
    800066a0:	42c080e7          	jalr	1068(ra) # 80005ac8 <_Z11printStringPKc>
    800066a4:	00000613          	li	a2,0
    800066a8:	00a00593          	li	a1,10
    800066ac:	0009051b          	sext.w	a0,s2
    800066b0:	fffff097          	auipc	ra,0xfffff
    800066b4:	5c8080e7          	jalr	1480(ra) # 80005c78 <_Z8printIntiii>
    800066b8:	00003517          	auipc	a0,0x3
    800066bc:	eb050513          	addi	a0,a0,-336 # 80009568 <CONSOLE_STATUS+0x558>
    800066c0:	fffff097          	auipc	ra,0xfffff
    800066c4:	408080e7          	jalr	1032(ra) # 80005ac8 <_Z11printStringPKc>
    800066c8:	0400006f          	j	80006708 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800066cc:	00003517          	auipc	a0,0x3
    800066d0:	c6c50513          	addi	a0,a0,-916 # 80009338 <CONSOLE_STATUS+0x328>
    800066d4:	fffff097          	auipc	ra,0xfffff
    800066d8:	3f4080e7          	jalr	1012(ra) # 80005ac8 <_Z11printStringPKc>
    800066dc:	00000613          	li	a2,0
    800066e0:	00a00593          	li	a1,10
    800066e4:	00048513          	mv	a0,s1
    800066e8:	fffff097          	auipc	ra,0xfffff
    800066ec:	590080e7          	jalr	1424(ra) # 80005c78 <_Z8printIntiii>
    800066f0:	00003517          	auipc	a0,0x3
    800066f4:	e7850513          	addi	a0,a0,-392 # 80009568 <CONSOLE_STATUS+0x558>
    800066f8:	fffff097          	auipc	ra,0xfffff
    800066fc:	3d0080e7          	jalr	976(ra) # 80005ac8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80006700:	0014849b          	addiw	s1,s1,1
    80006704:	0ff4f493          	andi	s1,s1,255
    80006708:	00500793          	li	a5,5
    8000670c:	fc97f0e3          	bgeu	a5,s1,800066cc <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80006710:	00003517          	auipc	a0,0x3
    80006714:	c0050513          	addi	a0,a0,-1024 # 80009310 <CONSOLE_STATUS+0x300>
    80006718:	fffff097          	auipc	ra,0xfffff
    8000671c:	3b0080e7          	jalr	944(ra) # 80005ac8 <_Z11printStringPKc>
    finishedC = true;
    80006720:	00100793          	li	a5,1
    80006724:	00005717          	auipc	a4,0x5
    80006728:	52f70fa3          	sb	a5,1343(a4) # 8000bc63 <_ZL9finishedC>
    thread_dispatch();
    8000672c:	ffffb097          	auipc	ra,0xffffb
    80006730:	cfc080e7          	jalr	-772(ra) # 80001428 <_Z15thread_dispatchv>
}
    80006734:	01813083          	ld	ra,24(sp)
    80006738:	01013403          	ld	s0,16(sp)
    8000673c:	00813483          	ld	s1,8(sp)
    80006740:	00013903          	ld	s2,0(sp)
    80006744:	02010113          	addi	sp,sp,32
    80006748:	00008067          	ret

000000008000674c <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    8000674c:	fe010113          	addi	sp,sp,-32
    80006750:	00113c23          	sd	ra,24(sp)
    80006754:	00813823          	sd	s0,16(sp)
    80006758:	00913423          	sd	s1,8(sp)
    8000675c:	01213023          	sd	s2,0(sp)
    80006760:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006764:	00000913          	li	s2,0
    80006768:	0400006f          	j	800067a8 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    8000676c:	ffffb097          	auipc	ra,0xffffb
    80006770:	cbc080e7          	jalr	-836(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006774:	00148493          	addi	s1,s1,1
    80006778:	000027b7          	lui	a5,0x2
    8000677c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006780:	0097ee63          	bltu	a5,s1,8000679c <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006784:	00000713          	li	a4,0
    80006788:	000077b7          	lui	a5,0x7
    8000678c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006790:	fce7eee3          	bltu	a5,a4,8000676c <_ZL11workerBodyBPv+0x20>
    80006794:	00170713          	addi	a4,a4,1
    80006798:	ff1ff06f          	j	80006788 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    8000679c:	00a00793          	li	a5,10
    800067a0:	04f90663          	beq	s2,a5,800067ec <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    800067a4:	00190913          	addi	s2,s2,1
    800067a8:	00f00793          	li	a5,15
    800067ac:	0527e463          	bltu	a5,s2,800067f4 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    800067b0:	00003517          	auipc	a0,0x3
    800067b4:	b7050513          	addi	a0,a0,-1168 # 80009320 <CONSOLE_STATUS+0x310>
    800067b8:	fffff097          	auipc	ra,0xfffff
    800067bc:	310080e7          	jalr	784(ra) # 80005ac8 <_Z11printStringPKc>
    800067c0:	00000613          	li	a2,0
    800067c4:	00a00593          	li	a1,10
    800067c8:	0009051b          	sext.w	a0,s2
    800067cc:	fffff097          	auipc	ra,0xfffff
    800067d0:	4ac080e7          	jalr	1196(ra) # 80005c78 <_Z8printIntiii>
    800067d4:	00003517          	auipc	a0,0x3
    800067d8:	d9450513          	addi	a0,a0,-620 # 80009568 <CONSOLE_STATUS+0x558>
    800067dc:	fffff097          	auipc	ra,0xfffff
    800067e0:	2ec080e7          	jalr	748(ra) # 80005ac8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800067e4:	00000493          	li	s1,0
    800067e8:	f91ff06f          	j	80006778 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    800067ec:	14102ff3          	csrr	t6,sepc
    800067f0:	fb5ff06f          	j	800067a4 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    800067f4:	00003517          	auipc	a0,0x3
    800067f8:	b3450513          	addi	a0,a0,-1228 # 80009328 <CONSOLE_STATUS+0x318>
    800067fc:	fffff097          	auipc	ra,0xfffff
    80006800:	2cc080e7          	jalr	716(ra) # 80005ac8 <_Z11printStringPKc>
    finishedB = true;
    80006804:	00100793          	li	a5,1
    80006808:	00005717          	auipc	a4,0x5
    8000680c:	44f70e23          	sb	a5,1116(a4) # 8000bc64 <_ZL9finishedB>
    thread_dispatch();
    80006810:	ffffb097          	auipc	ra,0xffffb
    80006814:	c18080e7          	jalr	-1000(ra) # 80001428 <_Z15thread_dispatchv>
}
    80006818:	01813083          	ld	ra,24(sp)
    8000681c:	01013403          	ld	s0,16(sp)
    80006820:	00813483          	ld	s1,8(sp)
    80006824:	00013903          	ld	s2,0(sp)
    80006828:	02010113          	addi	sp,sp,32
    8000682c:	00008067          	ret

0000000080006830 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006830:	fe010113          	addi	sp,sp,-32
    80006834:	00113c23          	sd	ra,24(sp)
    80006838:	00813823          	sd	s0,16(sp)
    8000683c:	00913423          	sd	s1,8(sp)
    80006840:	01213023          	sd	s2,0(sp)
    80006844:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006848:	00000913          	li	s2,0
    8000684c:	0380006f          	j	80006884 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80006850:	ffffb097          	auipc	ra,0xffffb
    80006854:	bd8080e7          	jalr	-1064(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006858:	00148493          	addi	s1,s1,1
    8000685c:	000027b7          	lui	a5,0x2
    80006860:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006864:	0097ee63          	bltu	a5,s1,80006880 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006868:	00000713          	li	a4,0
    8000686c:	000077b7          	lui	a5,0x7
    80006870:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006874:	fce7eee3          	bltu	a5,a4,80006850 <_ZL11workerBodyAPv+0x20>
    80006878:	00170713          	addi	a4,a4,1
    8000687c:	ff1ff06f          	j	8000686c <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80006880:	00190913          	addi	s2,s2,1
    80006884:	00900793          	li	a5,9
    80006888:	0527e063          	bltu	a5,s2,800068c8 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    8000688c:	00003517          	auipc	a0,0x3
    80006890:	a7c50513          	addi	a0,a0,-1412 # 80009308 <CONSOLE_STATUS+0x2f8>
    80006894:	fffff097          	auipc	ra,0xfffff
    80006898:	234080e7          	jalr	564(ra) # 80005ac8 <_Z11printStringPKc>
    8000689c:	00000613          	li	a2,0
    800068a0:	00a00593          	li	a1,10
    800068a4:	0009051b          	sext.w	a0,s2
    800068a8:	fffff097          	auipc	ra,0xfffff
    800068ac:	3d0080e7          	jalr	976(ra) # 80005c78 <_Z8printIntiii>
    800068b0:	00003517          	auipc	a0,0x3
    800068b4:	cb850513          	addi	a0,a0,-840 # 80009568 <CONSOLE_STATUS+0x558>
    800068b8:	fffff097          	auipc	ra,0xfffff
    800068bc:	210080e7          	jalr	528(ra) # 80005ac8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800068c0:	00000493          	li	s1,0
    800068c4:	f99ff06f          	j	8000685c <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    800068c8:	00003517          	auipc	a0,0x3
    800068cc:	a4850513          	addi	a0,a0,-1464 # 80009310 <CONSOLE_STATUS+0x300>
    800068d0:	fffff097          	auipc	ra,0xfffff
    800068d4:	1f8080e7          	jalr	504(ra) # 80005ac8 <_Z11printStringPKc>
    finishedA = true;
    800068d8:	00100793          	li	a5,1
    800068dc:	00005717          	auipc	a4,0x5
    800068e0:	38f704a3          	sb	a5,905(a4) # 8000bc65 <_ZL9finishedA>
}
    800068e4:	01813083          	ld	ra,24(sp)
    800068e8:	01013403          	ld	s0,16(sp)
    800068ec:	00813483          	ld	s1,8(sp)
    800068f0:	00013903          	ld	s2,0(sp)
    800068f4:	02010113          	addi	sp,sp,32
    800068f8:	00008067          	ret

00000000800068fc <_Z16System_Mode_testv>:


void System_Mode_test() {
    800068fc:	fd010113          	addi	sp,sp,-48
    80006900:	02113423          	sd	ra,40(sp)
    80006904:	02813023          	sd	s0,32(sp)
    80006908:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    8000690c:	00000613          	li	a2,0
    80006910:	00000597          	auipc	a1,0x0
    80006914:	f2058593          	addi	a1,a1,-224 # 80006830 <_ZL11workerBodyAPv>
    80006918:	fd040513          	addi	a0,s0,-48
    8000691c:	ffffb097          	auipc	ra,0xffffb
    80006920:	a64080e7          	jalr	-1436(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80006924:	00003517          	auipc	a0,0x3
    80006928:	a8c50513          	addi	a0,a0,-1396 # 800093b0 <CONSOLE_STATUS+0x3a0>
    8000692c:	fffff097          	auipc	ra,0xfffff
    80006930:	19c080e7          	jalr	412(ra) # 80005ac8 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80006934:	00000613          	li	a2,0
    80006938:	00000597          	auipc	a1,0x0
    8000693c:	e1458593          	addi	a1,a1,-492 # 8000674c <_ZL11workerBodyBPv>
    80006940:	fd840513          	addi	a0,s0,-40
    80006944:	ffffb097          	auipc	ra,0xffffb
    80006948:	a3c080e7          	jalr	-1476(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    8000694c:	00003517          	auipc	a0,0x3
    80006950:	a7c50513          	addi	a0,a0,-1412 # 800093c8 <CONSOLE_STATUS+0x3b8>
    80006954:	fffff097          	auipc	ra,0xfffff
    80006958:	174080e7          	jalr	372(ra) # 80005ac8 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    8000695c:	00000613          	li	a2,0
    80006960:	00000597          	auipc	a1,0x0
    80006964:	c6c58593          	addi	a1,a1,-916 # 800065cc <_ZL11workerBodyCPv>
    80006968:	fe040513          	addi	a0,s0,-32
    8000696c:	ffffb097          	auipc	ra,0xffffb
    80006970:	a14080e7          	jalr	-1516(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80006974:	00003517          	auipc	a0,0x3
    80006978:	a6c50513          	addi	a0,a0,-1428 # 800093e0 <CONSOLE_STATUS+0x3d0>
    8000697c:	fffff097          	auipc	ra,0xfffff
    80006980:	14c080e7          	jalr	332(ra) # 80005ac8 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80006984:	00000613          	li	a2,0
    80006988:	00000597          	auipc	a1,0x0
    8000698c:	afc58593          	addi	a1,a1,-1284 # 80006484 <_ZL11workerBodyDPv>
    80006990:	fe840513          	addi	a0,s0,-24
    80006994:	ffffb097          	auipc	ra,0xffffb
    80006998:	9ec080e7          	jalr	-1556(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    8000699c:	00003517          	auipc	a0,0x3
    800069a0:	a5c50513          	addi	a0,a0,-1444 # 800093f8 <CONSOLE_STATUS+0x3e8>
    800069a4:	fffff097          	auipc	ra,0xfffff
    800069a8:	124080e7          	jalr	292(ra) # 80005ac8 <_Z11printStringPKc>
    800069ac:	00c0006f          	j	800069b8 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    800069b0:	ffffb097          	auipc	ra,0xffffb
    800069b4:	a78080e7          	jalr	-1416(ra) # 80001428 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800069b8:	00005797          	auipc	a5,0x5
    800069bc:	2ad7c783          	lbu	a5,685(a5) # 8000bc65 <_ZL9finishedA>
    800069c0:	fe0788e3          	beqz	a5,800069b0 <_Z16System_Mode_testv+0xb4>
    800069c4:	00005797          	auipc	a5,0x5
    800069c8:	2a07c783          	lbu	a5,672(a5) # 8000bc64 <_ZL9finishedB>
    800069cc:	fe0782e3          	beqz	a5,800069b0 <_Z16System_Mode_testv+0xb4>
    800069d0:	00005797          	auipc	a5,0x5
    800069d4:	2937c783          	lbu	a5,659(a5) # 8000bc63 <_ZL9finishedC>
    800069d8:	fc078ce3          	beqz	a5,800069b0 <_Z16System_Mode_testv+0xb4>
    800069dc:	00005797          	auipc	a5,0x5
    800069e0:	2867c783          	lbu	a5,646(a5) # 8000bc62 <_ZL9finishedD>
    800069e4:	fc0786e3          	beqz	a5,800069b0 <_Z16System_Mode_testv+0xb4>
    }

}
    800069e8:	02813083          	ld	ra,40(sp)
    800069ec:	02013403          	ld	s0,32(sp)
    800069f0:	03010113          	addi	sp,sp,48
    800069f4:	00008067          	ret

00000000800069f8 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    800069f8:	fe010113          	addi	sp,sp,-32
    800069fc:	00113c23          	sd	ra,24(sp)
    80006a00:	00813823          	sd	s0,16(sp)
    80006a04:	00913423          	sd	s1,8(sp)
    80006a08:	01213023          	sd	s2,0(sp)
    80006a0c:	02010413          	addi	s0,sp,32
    80006a10:	00050493          	mv	s1,a0
    80006a14:	00058913          	mv	s2,a1
    80006a18:	0015879b          	addiw	a5,a1,1
    80006a1c:	0007851b          	sext.w	a0,a5
    80006a20:	00f4a023          	sw	a5,0(s1)
    80006a24:	0004a823          	sw	zero,16(s1)
    80006a28:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006a2c:	00251513          	slli	a0,a0,0x2
    80006a30:	ffffb097          	auipc	ra,0xffffb
    80006a34:	8e0080e7          	jalr	-1824(ra) # 80001310 <_Z9mem_allocm>
    80006a38:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80006a3c:	00000593          	li	a1,0
    80006a40:	02048513          	addi	a0,s1,32
    80006a44:	ffffb097          	auipc	ra,0xffffb
    80006a48:	a5c080e7          	jalr	-1444(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&spaceAvailable, _cap);
    80006a4c:	00090593          	mv	a1,s2
    80006a50:	01848513          	addi	a0,s1,24
    80006a54:	ffffb097          	auipc	ra,0xffffb
    80006a58:	a4c080e7          	jalr	-1460(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&mutexHead, 1);
    80006a5c:	00100593          	li	a1,1
    80006a60:	02848513          	addi	a0,s1,40
    80006a64:	ffffb097          	auipc	ra,0xffffb
    80006a68:	a3c080e7          	jalr	-1476(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&mutexTail, 1);
    80006a6c:	00100593          	li	a1,1
    80006a70:	03048513          	addi	a0,s1,48
    80006a74:	ffffb097          	auipc	ra,0xffffb
    80006a78:	a2c080e7          	jalr	-1492(ra) # 800014a0 <_Z8sem_openPP4KSemj>
}
    80006a7c:	01813083          	ld	ra,24(sp)
    80006a80:	01013403          	ld	s0,16(sp)
    80006a84:	00813483          	ld	s1,8(sp)
    80006a88:	00013903          	ld	s2,0(sp)
    80006a8c:	02010113          	addi	sp,sp,32
    80006a90:	00008067          	ret

0000000080006a94 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80006a94:	fe010113          	addi	sp,sp,-32
    80006a98:	00113c23          	sd	ra,24(sp)
    80006a9c:	00813823          	sd	s0,16(sp)
    80006aa0:	00913423          	sd	s1,8(sp)
    80006aa4:	01213023          	sd	s2,0(sp)
    80006aa8:	02010413          	addi	s0,sp,32
    80006aac:	00050493          	mv	s1,a0
    80006ab0:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80006ab4:	01853503          	ld	a0,24(a0)
    80006ab8:	ffffb097          	auipc	ra,0xffffb
    80006abc:	a50080e7          	jalr	-1456(ra) # 80001508 <_Z8sem_waitP4KSem>

    sem_wait(mutexTail);
    80006ac0:	0304b503          	ld	a0,48(s1)
    80006ac4:	ffffb097          	auipc	ra,0xffffb
    80006ac8:	a44080e7          	jalr	-1468(ra) # 80001508 <_Z8sem_waitP4KSem>
    buffer[tail] = val;
    80006acc:	0084b783          	ld	a5,8(s1)
    80006ad0:	0144a703          	lw	a4,20(s1)
    80006ad4:	00271713          	slli	a4,a4,0x2
    80006ad8:	00e787b3          	add	a5,a5,a4
    80006adc:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006ae0:	0144a783          	lw	a5,20(s1)
    80006ae4:	0017879b          	addiw	a5,a5,1
    80006ae8:	0004a703          	lw	a4,0(s1)
    80006aec:	02e7e7bb          	remw	a5,a5,a4
    80006af0:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80006af4:	0304b503          	ld	a0,48(s1)
    80006af8:	ffffb097          	auipc	ra,0xffffb
    80006afc:	a40080e7          	jalr	-1472(ra) # 80001538 <_Z10sem_signalP4KSem>

    sem_signal(itemAvailable);
    80006b00:	0204b503          	ld	a0,32(s1)
    80006b04:	ffffb097          	auipc	ra,0xffffb
    80006b08:	a34080e7          	jalr	-1484(ra) # 80001538 <_Z10sem_signalP4KSem>

}
    80006b0c:	01813083          	ld	ra,24(sp)
    80006b10:	01013403          	ld	s0,16(sp)
    80006b14:	00813483          	ld	s1,8(sp)
    80006b18:	00013903          	ld	s2,0(sp)
    80006b1c:	02010113          	addi	sp,sp,32
    80006b20:	00008067          	ret

0000000080006b24 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80006b24:	fe010113          	addi	sp,sp,-32
    80006b28:	00113c23          	sd	ra,24(sp)
    80006b2c:	00813823          	sd	s0,16(sp)
    80006b30:	00913423          	sd	s1,8(sp)
    80006b34:	01213023          	sd	s2,0(sp)
    80006b38:	02010413          	addi	s0,sp,32
    80006b3c:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80006b40:	02053503          	ld	a0,32(a0)
    80006b44:	ffffb097          	auipc	ra,0xffffb
    80006b48:	9c4080e7          	jalr	-1596(ra) # 80001508 <_Z8sem_waitP4KSem>

    sem_wait(mutexHead);
    80006b4c:	0284b503          	ld	a0,40(s1)
    80006b50:	ffffb097          	auipc	ra,0xffffb
    80006b54:	9b8080e7          	jalr	-1608(ra) # 80001508 <_Z8sem_waitP4KSem>

    int ret = buffer[head];
    80006b58:	0084b703          	ld	a4,8(s1)
    80006b5c:	0104a783          	lw	a5,16(s1)
    80006b60:	00279693          	slli	a3,a5,0x2
    80006b64:	00d70733          	add	a4,a4,a3
    80006b68:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006b6c:	0017879b          	addiw	a5,a5,1
    80006b70:	0004a703          	lw	a4,0(s1)
    80006b74:	02e7e7bb          	remw	a5,a5,a4
    80006b78:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80006b7c:	0284b503          	ld	a0,40(s1)
    80006b80:	ffffb097          	auipc	ra,0xffffb
    80006b84:	9b8080e7          	jalr	-1608(ra) # 80001538 <_Z10sem_signalP4KSem>

    sem_signal(spaceAvailable);
    80006b88:	0184b503          	ld	a0,24(s1)
    80006b8c:	ffffb097          	auipc	ra,0xffffb
    80006b90:	9ac080e7          	jalr	-1620(ra) # 80001538 <_Z10sem_signalP4KSem>

    return ret;
}
    80006b94:	00090513          	mv	a0,s2
    80006b98:	01813083          	ld	ra,24(sp)
    80006b9c:	01013403          	ld	s0,16(sp)
    80006ba0:	00813483          	ld	s1,8(sp)
    80006ba4:	00013903          	ld	s2,0(sp)
    80006ba8:	02010113          	addi	sp,sp,32
    80006bac:	00008067          	ret

0000000080006bb0 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80006bb0:	fe010113          	addi	sp,sp,-32
    80006bb4:	00113c23          	sd	ra,24(sp)
    80006bb8:	00813823          	sd	s0,16(sp)
    80006bbc:	00913423          	sd	s1,8(sp)
    80006bc0:	01213023          	sd	s2,0(sp)
    80006bc4:	02010413          	addi	s0,sp,32
    80006bc8:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80006bcc:	02853503          	ld	a0,40(a0)
    80006bd0:	ffffb097          	auipc	ra,0xffffb
    80006bd4:	938080e7          	jalr	-1736(ra) # 80001508 <_Z8sem_waitP4KSem>
    sem_wait(mutexTail);
    80006bd8:	0304b503          	ld	a0,48(s1)
    80006bdc:	ffffb097          	auipc	ra,0xffffb
    80006be0:	92c080e7          	jalr	-1748(ra) # 80001508 <_Z8sem_waitP4KSem>

    if (tail >= head) {
    80006be4:	0144a783          	lw	a5,20(s1)
    80006be8:	0104a903          	lw	s2,16(s1)
    80006bec:	0327ce63          	blt	a5,s2,80006c28 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80006bf0:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80006bf4:	0304b503          	ld	a0,48(s1)
    80006bf8:	ffffb097          	auipc	ra,0xffffb
    80006bfc:	940080e7          	jalr	-1728(ra) # 80001538 <_Z10sem_signalP4KSem>
    sem_signal(mutexHead);
    80006c00:	0284b503          	ld	a0,40(s1)
    80006c04:	ffffb097          	auipc	ra,0xffffb
    80006c08:	934080e7          	jalr	-1740(ra) # 80001538 <_Z10sem_signalP4KSem>

    return ret;
}
    80006c0c:	00090513          	mv	a0,s2
    80006c10:	01813083          	ld	ra,24(sp)
    80006c14:	01013403          	ld	s0,16(sp)
    80006c18:	00813483          	ld	s1,8(sp)
    80006c1c:	00013903          	ld	s2,0(sp)
    80006c20:	02010113          	addi	sp,sp,32
    80006c24:	00008067          	ret
        ret = cap - head + tail;
    80006c28:	0004a703          	lw	a4,0(s1)
    80006c2c:	4127093b          	subw	s2,a4,s2
    80006c30:	00f9093b          	addw	s2,s2,a5
    80006c34:	fc1ff06f          	j	80006bf4 <_ZN6Buffer6getCntEv+0x44>

0000000080006c38 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80006c38:	fe010113          	addi	sp,sp,-32
    80006c3c:	00113c23          	sd	ra,24(sp)
    80006c40:	00813823          	sd	s0,16(sp)
    80006c44:	00913423          	sd	s1,8(sp)
    80006c48:	02010413          	addi	s0,sp,32
    80006c4c:	00050493          	mv	s1,a0
    putc('\n');
    80006c50:	00a00513          	li	a0,10
    80006c54:	ffffb097          	auipc	ra,0xffffb
    80006c58:	93c080e7          	jalr	-1732(ra) # 80001590 <_Z4putcc>
    printString("Buffer deleted!\n");
    80006c5c:	00002517          	auipc	a0,0x2
    80006c60:	7b450513          	addi	a0,a0,1972 # 80009410 <CONSOLE_STATUS+0x400>
    80006c64:	fffff097          	auipc	ra,0xfffff
    80006c68:	e64080e7          	jalr	-412(ra) # 80005ac8 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80006c6c:	00048513          	mv	a0,s1
    80006c70:	00000097          	auipc	ra,0x0
    80006c74:	f40080e7          	jalr	-192(ra) # 80006bb0 <_ZN6Buffer6getCntEv>
    80006c78:	02a05c63          	blez	a0,80006cb0 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80006c7c:	0084b783          	ld	a5,8(s1)
    80006c80:	0104a703          	lw	a4,16(s1)
    80006c84:	00271713          	slli	a4,a4,0x2
    80006c88:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80006c8c:	0007c503          	lbu	a0,0(a5)
    80006c90:	ffffb097          	auipc	ra,0xffffb
    80006c94:	900080e7          	jalr	-1792(ra) # 80001590 <_Z4putcc>
        head = (head + 1) % cap;
    80006c98:	0104a783          	lw	a5,16(s1)
    80006c9c:	0017879b          	addiw	a5,a5,1
    80006ca0:	0004a703          	lw	a4,0(s1)
    80006ca4:	02e7e7bb          	remw	a5,a5,a4
    80006ca8:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80006cac:	fc1ff06f          	j	80006c6c <_ZN6BufferD1Ev+0x34>
    putc('!');
    80006cb0:	02100513          	li	a0,33
    80006cb4:	ffffb097          	auipc	ra,0xffffb
    80006cb8:	8dc080e7          	jalr	-1828(ra) # 80001590 <_Z4putcc>
    putc('\n');
    80006cbc:	00a00513          	li	a0,10
    80006cc0:	ffffb097          	auipc	ra,0xffffb
    80006cc4:	8d0080e7          	jalr	-1840(ra) # 80001590 <_Z4putcc>
    mem_free(buffer);
    80006cc8:	0084b503          	ld	a0,8(s1)
    80006ccc:	ffffa097          	auipc	ra,0xffffa
    80006cd0:	684080e7          	jalr	1668(ra) # 80001350 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80006cd4:	0204b503          	ld	a0,32(s1)
    80006cd8:	ffffb097          	auipc	ra,0xffffb
    80006cdc:	800080e7          	jalr	-2048(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(spaceAvailable);
    80006ce0:	0184b503          	ld	a0,24(s1)
    80006ce4:	ffffa097          	auipc	ra,0xffffa
    80006ce8:	7f4080e7          	jalr	2036(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(mutexTail);
    80006cec:	0304b503          	ld	a0,48(s1)
    80006cf0:	ffffa097          	auipc	ra,0xffffa
    80006cf4:	7e8080e7          	jalr	2024(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(mutexHead);
    80006cf8:	0284b503          	ld	a0,40(s1)
    80006cfc:	ffffa097          	auipc	ra,0xffffa
    80006d00:	7dc080e7          	jalr	2012(ra) # 800014d8 <_Z9sem_closeP4KSem>
}
    80006d04:	01813083          	ld	ra,24(sp)
    80006d08:	01013403          	ld	s0,16(sp)
    80006d0c:	00813483          	ld	s1,8(sp)
    80006d10:	02010113          	addi	sp,sp,32
    80006d14:	00008067          	ret

0000000080006d18 <start>:
    80006d18:	ff010113          	addi	sp,sp,-16
    80006d1c:	00813423          	sd	s0,8(sp)
    80006d20:	01010413          	addi	s0,sp,16
    80006d24:	300027f3          	csrr	a5,mstatus
    80006d28:	ffffe737          	lui	a4,0xffffe
    80006d2c:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff192f>
    80006d30:	00e7f7b3          	and	a5,a5,a4
    80006d34:	00001737          	lui	a4,0x1
    80006d38:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80006d3c:	00e7e7b3          	or	a5,a5,a4
    80006d40:	30079073          	csrw	mstatus,a5
    80006d44:	00000797          	auipc	a5,0x0
    80006d48:	16078793          	addi	a5,a5,352 # 80006ea4 <system_main>
    80006d4c:	34179073          	csrw	mepc,a5
    80006d50:	00000793          	li	a5,0
    80006d54:	18079073          	csrw	satp,a5
    80006d58:	000107b7          	lui	a5,0x10
    80006d5c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80006d60:	30279073          	csrw	medeleg,a5
    80006d64:	30379073          	csrw	mideleg,a5
    80006d68:	104027f3          	csrr	a5,sie
    80006d6c:	2227e793          	ori	a5,a5,546
    80006d70:	10479073          	csrw	sie,a5
    80006d74:	fff00793          	li	a5,-1
    80006d78:	00a7d793          	srli	a5,a5,0xa
    80006d7c:	3b079073          	csrw	pmpaddr0,a5
    80006d80:	00f00793          	li	a5,15
    80006d84:	3a079073          	csrw	pmpcfg0,a5
    80006d88:	f14027f3          	csrr	a5,mhartid
    80006d8c:	0200c737          	lui	a4,0x200c
    80006d90:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80006d94:	0007869b          	sext.w	a3,a5
    80006d98:	00269713          	slli	a4,a3,0x2
    80006d9c:	000f4637          	lui	a2,0xf4
    80006da0:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80006da4:	00d70733          	add	a4,a4,a3
    80006da8:	0037979b          	slliw	a5,a5,0x3
    80006dac:	020046b7          	lui	a3,0x2004
    80006db0:	00d787b3          	add	a5,a5,a3
    80006db4:	00c585b3          	add	a1,a1,a2
    80006db8:	00371693          	slli	a3,a4,0x3
    80006dbc:	00005717          	auipc	a4,0x5
    80006dc0:	eb470713          	addi	a4,a4,-332 # 8000bc70 <timer_scratch>
    80006dc4:	00b7b023          	sd	a1,0(a5)
    80006dc8:	00d70733          	add	a4,a4,a3
    80006dcc:	00f73c23          	sd	a5,24(a4)
    80006dd0:	02c73023          	sd	a2,32(a4)
    80006dd4:	34071073          	csrw	mscratch,a4
    80006dd8:	00000797          	auipc	a5,0x0
    80006ddc:	6e878793          	addi	a5,a5,1768 # 800074c0 <timervec>
    80006de0:	30579073          	csrw	mtvec,a5
    80006de4:	300027f3          	csrr	a5,mstatus
    80006de8:	0087e793          	ori	a5,a5,8
    80006dec:	30079073          	csrw	mstatus,a5
    80006df0:	304027f3          	csrr	a5,mie
    80006df4:	0807e793          	ori	a5,a5,128
    80006df8:	30479073          	csrw	mie,a5
    80006dfc:	f14027f3          	csrr	a5,mhartid
    80006e00:	0007879b          	sext.w	a5,a5
    80006e04:	00078213          	mv	tp,a5
    80006e08:	30200073          	mret
    80006e0c:	00813403          	ld	s0,8(sp)
    80006e10:	01010113          	addi	sp,sp,16
    80006e14:	00008067          	ret

0000000080006e18 <timerinit>:
    80006e18:	ff010113          	addi	sp,sp,-16
    80006e1c:	00813423          	sd	s0,8(sp)
    80006e20:	01010413          	addi	s0,sp,16
    80006e24:	f14027f3          	csrr	a5,mhartid
    80006e28:	0200c737          	lui	a4,0x200c
    80006e2c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80006e30:	0007869b          	sext.w	a3,a5
    80006e34:	00269713          	slli	a4,a3,0x2
    80006e38:	000f4637          	lui	a2,0xf4
    80006e3c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80006e40:	00d70733          	add	a4,a4,a3
    80006e44:	0037979b          	slliw	a5,a5,0x3
    80006e48:	020046b7          	lui	a3,0x2004
    80006e4c:	00d787b3          	add	a5,a5,a3
    80006e50:	00c585b3          	add	a1,a1,a2
    80006e54:	00371693          	slli	a3,a4,0x3
    80006e58:	00005717          	auipc	a4,0x5
    80006e5c:	e1870713          	addi	a4,a4,-488 # 8000bc70 <timer_scratch>
    80006e60:	00b7b023          	sd	a1,0(a5)
    80006e64:	00d70733          	add	a4,a4,a3
    80006e68:	00f73c23          	sd	a5,24(a4)
    80006e6c:	02c73023          	sd	a2,32(a4)
    80006e70:	34071073          	csrw	mscratch,a4
    80006e74:	00000797          	auipc	a5,0x0
    80006e78:	64c78793          	addi	a5,a5,1612 # 800074c0 <timervec>
    80006e7c:	30579073          	csrw	mtvec,a5
    80006e80:	300027f3          	csrr	a5,mstatus
    80006e84:	0087e793          	ori	a5,a5,8
    80006e88:	30079073          	csrw	mstatus,a5
    80006e8c:	304027f3          	csrr	a5,mie
    80006e90:	0807e793          	ori	a5,a5,128
    80006e94:	30479073          	csrw	mie,a5
    80006e98:	00813403          	ld	s0,8(sp)
    80006e9c:	01010113          	addi	sp,sp,16
    80006ea0:	00008067          	ret

0000000080006ea4 <system_main>:
    80006ea4:	fe010113          	addi	sp,sp,-32
    80006ea8:	00813823          	sd	s0,16(sp)
    80006eac:	00913423          	sd	s1,8(sp)
    80006eb0:	00113c23          	sd	ra,24(sp)
    80006eb4:	02010413          	addi	s0,sp,32
    80006eb8:	00000097          	auipc	ra,0x0
    80006ebc:	0c4080e7          	jalr	196(ra) # 80006f7c <cpuid>
    80006ec0:	00005497          	auipc	s1,0x5
    80006ec4:	c5048493          	addi	s1,s1,-944 # 8000bb10 <started>
    80006ec8:	02050263          	beqz	a0,80006eec <system_main+0x48>
    80006ecc:	0004a783          	lw	a5,0(s1)
    80006ed0:	0007879b          	sext.w	a5,a5
    80006ed4:	fe078ce3          	beqz	a5,80006ecc <system_main+0x28>
    80006ed8:	0ff0000f          	fence
    80006edc:	00003517          	auipc	a0,0x3
    80006ee0:	80450513          	addi	a0,a0,-2044 # 800096e0 <CONSOLE_STATUS+0x6d0>
    80006ee4:	00001097          	auipc	ra,0x1
    80006ee8:	a78080e7          	jalr	-1416(ra) # 8000795c <panic>
    80006eec:	00001097          	auipc	ra,0x1
    80006ef0:	9cc080e7          	jalr	-1588(ra) # 800078b8 <consoleinit>
    80006ef4:	00001097          	auipc	ra,0x1
    80006ef8:	158080e7          	jalr	344(ra) # 8000804c <printfinit>
    80006efc:	00002517          	auipc	a0,0x2
    80006f00:	66c50513          	addi	a0,a0,1644 # 80009568 <CONSOLE_STATUS+0x558>
    80006f04:	00001097          	auipc	ra,0x1
    80006f08:	ab4080e7          	jalr	-1356(ra) # 800079b8 <__printf>
    80006f0c:	00002517          	auipc	a0,0x2
    80006f10:	7a450513          	addi	a0,a0,1956 # 800096b0 <CONSOLE_STATUS+0x6a0>
    80006f14:	00001097          	auipc	ra,0x1
    80006f18:	aa4080e7          	jalr	-1372(ra) # 800079b8 <__printf>
    80006f1c:	00002517          	auipc	a0,0x2
    80006f20:	64c50513          	addi	a0,a0,1612 # 80009568 <CONSOLE_STATUS+0x558>
    80006f24:	00001097          	auipc	ra,0x1
    80006f28:	a94080e7          	jalr	-1388(ra) # 800079b8 <__printf>
    80006f2c:	00001097          	auipc	ra,0x1
    80006f30:	4ac080e7          	jalr	1196(ra) # 800083d8 <kinit>
    80006f34:	00000097          	auipc	ra,0x0
    80006f38:	148080e7          	jalr	328(ra) # 8000707c <trapinit>
    80006f3c:	00000097          	auipc	ra,0x0
    80006f40:	16c080e7          	jalr	364(ra) # 800070a8 <trapinithart>
    80006f44:	00000097          	auipc	ra,0x0
    80006f48:	5bc080e7          	jalr	1468(ra) # 80007500 <plicinit>
    80006f4c:	00000097          	auipc	ra,0x0
    80006f50:	5dc080e7          	jalr	1500(ra) # 80007528 <plicinithart>
    80006f54:	00000097          	auipc	ra,0x0
    80006f58:	078080e7          	jalr	120(ra) # 80006fcc <userinit>
    80006f5c:	0ff0000f          	fence
    80006f60:	00100793          	li	a5,1
    80006f64:	00002517          	auipc	a0,0x2
    80006f68:	76450513          	addi	a0,a0,1892 # 800096c8 <CONSOLE_STATUS+0x6b8>
    80006f6c:	00f4a023          	sw	a5,0(s1)
    80006f70:	00001097          	auipc	ra,0x1
    80006f74:	a48080e7          	jalr	-1464(ra) # 800079b8 <__printf>
    80006f78:	0000006f          	j	80006f78 <system_main+0xd4>

0000000080006f7c <cpuid>:
    80006f7c:	ff010113          	addi	sp,sp,-16
    80006f80:	00813423          	sd	s0,8(sp)
    80006f84:	01010413          	addi	s0,sp,16
    80006f88:	00020513          	mv	a0,tp
    80006f8c:	00813403          	ld	s0,8(sp)
    80006f90:	0005051b          	sext.w	a0,a0
    80006f94:	01010113          	addi	sp,sp,16
    80006f98:	00008067          	ret

0000000080006f9c <mycpu>:
    80006f9c:	ff010113          	addi	sp,sp,-16
    80006fa0:	00813423          	sd	s0,8(sp)
    80006fa4:	01010413          	addi	s0,sp,16
    80006fa8:	00020793          	mv	a5,tp
    80006fac:	00813403          	ld	s0,8(sp)
    80006fb0:	0007879b          	sext.w	a5,a5
    80006fb4:	00779793          	slli	a5,a5,0x7
    80006fb8:	00006517          	auipc	a0,0x6
    80006fbc:	ce850513          	addi	a0,a0,-792 # 8000cca0 <cpus>
    80006fc0:	00f50533          	add	a0,a0,a5
    80006fc4:	01010113          	addi	sp,sp,16
    80006fc8:	00008067          	ret

0000000080006fcc <userinit>:
    80006fcc:	ff010113          	addi	sp,sp,-16
    80006fd0:	00813423          	sd	s0,8(sp)
    80006fd4:	01010413          	addi	s0,sp,16
    80006fd8:	00813403          	ld	s0,8(sp)
    80006fdc:	01010113          	addi	sp,sp,16
    80006fe0:	ffffb317          	auipc	t1,0xffffb
    80006fe4:	b8c30067          	jr	-1140(t1) # 80001b6c <main>

0000000080006fe8 <either_copyout>:
    80006fe8:	ff010113          	addi	sp,sp,-16
    80006fec:	00813023          	sd	s0,0(sp)
    80006ff0:	00113423          	sd	ra,8(sp)
    80006ff4:	01010413          	addi	s0,sp,16
    80006ff8:	02051663          	bnez	a0,80007024 <either_copyout+0x3c>
    80006ffc:	00058513          	mv	a0,a1
    80007000:	00060593          	mv	a1,a2
    80007004:	0006861b          	sext.w	a2,a3
    80007008:	00002097          	auipc	ra,0x2
    8000700c:	c5c080e7          	jalr	-932(ra) # 80008c64 <__memmove>
    80007010:	00813083          	ld	ra,8(sp)
    80007014:	00013403          	ld	s0,0(sp)
    80007018:	00000513          	li	a0,0
    8000701c:	01010113          	addi	sp,sp,16
    80007020:	00008067          	ret
    80007024:	00002517          	auipc	a0,0x2
    80007028:	6e450513          	addi	a0,a0,1764 # 80009708 <CONSOLE_STATUS+0x6f8>
    8000702c:	00001097          	auipc	ra,0x1
    80007030:	930080e7          	jalr	-1744(ra) # 8000795c <panic>

0000000080007034 <either_copyin>:
    80007034:	ff010113          	addi	sp,sp,-16
    80007038:	00813023          	sd	s0,0(sp)
    8000703c:	00113423          	sd	ra,8(sp)
    80007040:	01010413          	addi	s0,sp,16
    80007044:	02059463          	bnez	a1,8000706c <either_copyin+0x38>
    80007048:	00060593          	mv	a1,a2
    8000704c:	0006861b          	sext.w	a2,a3
    80007050:	00002097          	auipc	ra,0x2
    80007054:	c14080e7          	jalr	-1004(ra) # 80008c64 <__memmove>
    80007058:	00813083          	ld	ra,8(sp)
    8000705c:	00013403          	ld	s0,0(sp)
    80007060:	00000513          	li	a0,0
    80007064:	01010113          	addi	sp,sp,16
    80007068:	00008067          	ret
    8000706c:	00002517          	auipc	a0,0x2
    80007070:	6c450513          	addi	a0,a0,1732 # 80009730 <CONSOLE_STATUS+0x720>
    80007074:	00001097          	auipc	ra,0x1
    80007078:	8e8080e7          	jalr	-1816(ra) # 8000795c <panic>

000000008000707c <trapinit>:
    8000707c:	ff010113          	addi	sp,sp,-16
    80007080:	00813423          	sd	s0,8(sp)
    80007084:	01010413          	addi	s0,sp,16
    80007088:	00813403          	ld	s0,8(sp)
    8000708c:	00002597          	auipc	a1,0x2
    80007090:	6cc58593          	addi	a1,a1,1740 # 80009758 <CONSOLE_STATUS+0x748>
    80007094:	00006517          	auipc	a0,0x6
    80007098:	c8c50513          	addi	a0,a0,-884 # 8000cd20 <tickslock>
    8000709c:	01010113          	addi	sp,sp,16
    800070a0:	00001317          	auipc	t1,0x1
    800070a4:	5c830067          	jr	1480(t1) # 80008668 <initlock>

00000000800070a8 <trapinithart>:
    800070a8:	ff010113          	addi	sp,sp,-16
    800070ac:	00813423          	sd	s0,8(sp)
    800070b0:	01010413          	addi	s0,sp,16
    800070b4:	00000797          	auipc	a5,0x0
    800070b8:	2fc78793          	addi	a5,a5,764 # 800073b0 <kernelvec>
    800070bc:	10579073          	csrw	stvec,a5
    800070c0:	00813403          	ld	s0,8(sp)
    800070c4:	01010113          	addi	sp,sp,16
    800070c8:	00008067          	ret

00000000800070cc <usertrap>:
    800070cc:	ff010113          	addi	sp,sp,-16
    800070d0:	00813423          	sd	s0,8(sp)
    800070d4:	01010413          	addi	s0,sp,16
    800070d8:	00813403          	ld	s0,8(sp)
    800070dc:	01010113          	addi	sp,sp,16
    800070e0:	00008067          	ret

00000000800070e4 <usertrapret>:
    800070e4:	ff010113          	addi	sp,sp,-16
    800070e8:	00813423          	sd	s0,8(sp)
    800070ec:	01010413          	addi	s0,sp,16
    800070f0:	00813403          	ld	s0,8(sp)
    800070f4:	01010113          	addi	sp,sp,16
    800070f8:	00008067          	ret

00000000800070fc <kerneltrap>:
    800070fc:	fe010113          	addi	sp,sp,-32
    80007100:	00813823          	sd	s0,16(sp)
    80007104:	00113c23          	sd	ra,24(sp)
    80007108:	00913423          	sd	s1,8(sp)
    8000710c:	02010413          	addi	s0,sp,32
    80007110:	142025f3          	csrr	a1,scause
    80007114:	100027f3          	csrr	a5,sstatus
    80007118:	0027f793          	andi	a5,a5,2
    8000711c:	10079c63          	bnez	a5,80007234 <kerneltrap+0x138>
    80007120:	142027f3          	csrr	a5,scause
    80007124:	0207ce63          	bltz	a5,80007160 <kerneltrap+0x64>
    80007128:	00002517          	auipc	a0,0x2
    8000712c:	67850513          	addi	a0,a0,1656 # 800097a0 <CONSOLE_STATUS+0x790>
    80007130:	00001097          	auipc	ra,0x1
    80007134:	888080e7          	jalr	-1912(ra) # 800079b8 <__printf>
    80007138:	141025f3          	csrr	a1,sepc
    8000713c:	14302673          	csrr	a2,stval
    80007140:	00002517          	auipc	a0,0x2
    80007144:	67050513          	addi	a0,a0,1648 # 800097b0 <CONSOLE_STATUS+0x7a0>
    80007148:	00001097          	auipc	ra,0x1
    8000714c:	870080e7          	jalr	-1936(ra) # 800079b8 <__printf>
    80007150:	00002517          	auipc	a0,0x2
    80007154:	67850513          	addi	a0,a0,1656 # 800097c8 <CONSOLE_STATUS+0x7b8>
    80007158:	00001097          	auipc	ra,0x1
    8000715c:	804080e7          	jalr	-2044(ra) # 8000795c <panic>
    80007160:	0ff7f713          	andi	a4,a5,255
    80007164:	00900693          	li	a3,9
    80007168:	04d70063          	beq	a4,a3,800071a8 <kerneltrap+0xac>
    8000716c:	fff00713          	li	a4,-1
    80007170:	03f71713          	slli	a4,a4,0x3f
    80007174:	00170713          	addi	a4,a4,1
    80007178:	fae798e3          	bne	a5,a4,80007128 <kerneltrap+0x2c>
    8000717c:	00000097          	auipc	ra,0x0
    80007180:	e00080e7          	jalr	-512(ra) # 80006f7c <cpuid>
    80007184:	06050663          	beqz	a0,800071f0 <kerneltrap+0xf4>
    80007188:	144027f3          	csrr	a5,sip
    8000718c:	ffd7f793          	andi	a5,a5,-3
    80007190:	14479073          	csrw	sip,a5
    80007194:	01813083          	ld	ra,24(sp)
    80007198:	01013403          	ld	s0,16(sp)
    8000719c:	00813483          	ld	s1,8(sp)
    800071a0:	02010113          	addi	sp,sp,32
    800071a4:	00008067          	ret
    800071a8:	00000097          	auipc	ra,0x0
    800071ac:	3cc080e7          	jalr	972(ra) # 80007574 <plic_claim>
    800071b0:	00a00793          	li	a5,10
    800071b4:	00050493          	mv	s1,a0
    800071b8:	06f50863          	beq	a0,a5,80007228 <kerneltrap+0x12c>
    800071bc:	fc050ce3          	beqz	a0,80007194 <kerneltrap+0x98>
    800071c0:	00050593          	mv	a1,a0
    800071c4:	00002517          	auipc	a0,0x2
    800071c8:	5bc50513          	addi	a0,a0,1468 # 80009780 <CONSOLE_STATUS+0x770>
    800071cc:	00000097          	auipc	ra,0x0
    800071d0:	7ec080e7          	jalr	2028(ra) # 800079b8 <__printf>
    800071d4:	01013403          	ld	s0,16(sp)
    800071d8:	01813083          	ld	ra,24(sp)
    800071dc:	00048513          	mv	a0,s1
    800071e0:	00813483          	ld	s1,8(sp)
    800071e4:	02010113          	addi	sp,sp,32
    800071e8:	00000317          	auipc	t1,0x0
    800071ec:	3c430067          	jr	964(t1) # 800075ac <plic_complete>
    800071f0:	00006517          	auipc	a0,0x6
    800071f4:	b3050513          	addi	a0,a0,-1232 # 8000cd20 <tickslock>
    800071f8:	00001097          	auipc	ra,0x1
    800071fc:	494080e7          	jalr	1172(ra) # 8000868c <acquire>
    80007200:	00005717          	auipc	a4,0x5
    80007204:	91470713          	addi	a4,a4,-1772 # 8000bb14 <ticks>
    80007208:	00072783          	lw	a5,0(a4)
    8000720c:	00006517          	auipc	a0,0x6
    80007210:	b1450513          	addi	a0,a0,-1260 # 8000cd20 <tickslock>
    80007214:	0017879b          	addiw	a5,a5,1
    80007218:	00f72023          	sw	a5,0(a4)
    8000721c:	00001097          	auipc	ra,0x1
    80007220:	53c080e7          	jalr	1340(ra) # 80008758 <release>
    80007224:	f65ff06f          	j	80007188 <kerneltrap+0x8c>
    80007228:	00001097          	auipc	ra,0x1
    8000722c:	098080e7          	jalr	152(ra) # 800082c0 <uartintr>
    80007230:	fa5ff06f          	j	800071d4 <kerneltrap+0xd8>
    80007234:	00002517          	auipc	a0,0x2
    80007238:	52c50513          	addi	a0,a0,1324 # 80009760 <CONSOLE_STATUS+0x750>
    8000723c:	00000097          	auipc	ra,0x0
    80007240:	720080e7          	jalr	1824(ra) # 8000795c <panic>

0000000080007244 <clockintr>:
    80007244:	fe010113          	addi	sp,sp,-32
    80007248:	00813823          	sd	s0,16(sp)
    8000724c:	00913423          	sd	s1,8(sp)
    80007250:	00113c23          	sd	ra,24(sp)
    80007254:	02010413          	addi	s0,sp,32
    80007258:	00006497          	auipc	s1,0x6
    8000725c:	ac848493          	addi	s1,s1,-1336 # 8000cd20 <tickslock>
    80007260:	00048513          	mv	a0,s1
    80007264:	00001097          	auipc	ra,0x1
    80007268:	428080e7          	jalr	1064(ra) # 8000868c <acquire>
    8000726c:	00005717          	auipc	a4,0x5
    80007270:	8a870713          	addi	a4,a4,-1880 # 8000bb14 <ticks>
    80007274:	00072783          	lw	a5,0(a4)
    80007278:	01013403          	ld	s0,16(sp)
    8000727c:	01813083          	ld	ra,24(sp)
    80007280:	00048513          	mv	a0,s1
    80007284:	0017879b          	addiw	a5,a5,1
    80007288:	00813483          	ld	s1,8(sp)
    8000728c:	00f72023          	sw	a5,0(a4)
    80007290:	02010113          	addi	sp,sp,32
    80007294:	00001317          	auipc	t1,0x1
    80007298:	4c430067          	jr	1220(t1) # 80008758 <release>

000000008000729c <devintr>:
    8000729c:	142027f3          	csrr	a5,scause
    800072a0:	00000513          	li	a0,0
    800072a4:	0007c463          	bltz	a5,800072ac <devintr+0x10>
    800072a8:	00008067          	ret
    800072ac:	fe010113          	addi	sp,sp,-32
    800072b0:	00813823          	sd	s0,16(sp)
    800072b4:	00113c23          	sd	ra,24(sp)
    800072b8:	00913423          	sd	s1,8(sp)
    800072bc:	02010413          	addi	s0,sp,32
    800072c0:	0ff7f713          	andi	a4,a5,255
    800072c4:	00900693          	li	a3,9
    800072c8:	04d70c63          	beq	a4,a3,80007320 <devintr+0x84>
    800072cc:	fff00713          	li	a4,-1
    800072d0:	03f71713          	slli	a4,a4,0x3f
    800072d4:	00170713          	addi	a4,a4,1
    800072d8:	00e78c63          	beq	a5,a4,800072f0 <devintr+0x54>
    800072dc:	01813083          	ld	ra,24(sp)
    800072e0:	01013403          	ld	s0,16(sp)
    800072e4:	00813483          	ld	s1,8(sp)
    800072e8:	02010113          	addi	sp,sp,32
    800072ec:	00008067          	ret
    800072f0:	00000097          	auipc	ra,0x0
    800072f4:	c8c080e7          	jalr	-884(ra) # 80006f7c <cpuid>
    800072f8:	06050663          	beqz	a0,80007364 <devintr+0xc8>
    800072fc:	144027f3          	csrr	a5,sip
    80007300:	ffd7f793          	andi	a5,a5,-3
    80007304:	14479073          	csrw	sip,a5
    80007308:	01813083          	ld	ra,24(sp)
    8000730c:	01013403          	ld	s0,16(sp)
    80007310:	00813483          	ld	s1,8(sp)
    80007314:	00200513          	li	a0,2
    80007318:	02010113          	addi	sp,sp,32
    8000731c:	00008067          	ret
    80007320:	00000097          	auipc	ra,0x0
    80007324:	254080e7          	jalr	596(ra) # 80007574 <plic_claim>
    80007328:	00a00793          	li	a5,10
    8000732c:	00050493          	mv	s1,a0
    80007330:	06f50663          	beq	a0,a5,8000739c <devintr+0x100>
    80007334:	00100513          	li	a0,1
    80007338:	fa0482e3          	beqz	s1,800072dc <devintr+0x40>
    8000733c:	00048593          	mv	a1,s1
    80007340:	00002517          	auipc	a0,0x2
    80007344:	44050513          	addi	a0,a0,1088 # 80009780 <CONSOLE_STATUS+0x770>
    80007348:	00000097          	auipc	ra,0x0
    8000734c:	670080e7          	jalr	1648(ra) # 800079b8 <__printf>
    80007350:	00048513          	mv	a0,s1
    80007354:	00000097          	auipc	ra,0x0
    80007358:	258080e7          	jalr	600(ra) # 800075ac <plic_complete>
    8000735c:	00100513          	li	a0,1
    80007360:	f7dff06f          	j	800072dc <devintr+0x40>
    80007364:	00006517          	auipc	a0,0x6
    80007368:	9bc50513          	addi	a0,a0,-1604 # 8000cd20 <tickslock>
    8000736c:	00001097          	auipc	ra,0x1
    80007370:	320080e7          	jalr	800(ra) # 8000868c <acquire>
    80007374:	00004717          	auipc	a4,0x4
    80007378:	7a070713          	addi	a4,a4,1952 # 8000bb14 <ticks>
    8000737c:	00072783          	lw	a5,0(a4)
    80007380:	00006517          	auipc	a0,0x6
    80007384:	9a050513          	addi	a0,a0,-1632 # 8000cd20 <tickslock>
    80007388:	0017879b          	addiw	a5,a5,1
    8000738c:	00f72023          	sw	a5,0(a4)
    80007390:	00001097          	auipc	ra,0x1
    80007394:	3c8080e7          	jalr	968(ra) # 80008758 <release>
    80007398:	f65ff06f          	j	800072fc <devintr+0x60>
    8000739c:	00001097          	auipc	ra,0x1
    800073a0:	f24080e7          	jalr	-220(ra) # 800082c0 <uartintr>
    800073a4:	fadff06f          	j	80007350 <devintr+0xb4>
	...

00000000800073b0 <kernelvec>:
    800073b0:	f0010113          	addi	sp,sp,-256
    800073b4:	00113023          	sd	ra,0(sp)
    800073b8:	00213423          	sd	sp,8(sp)
    800073bc:	00313823          	sd	gp,16(sp)
    800073c0:	00413c23          	sd	tp,24(sp)
    800073c4:	02513023          	sd	t0,32(sp)
    800073c8:	02613423          	sd	t1,40(sp)
    800073cc:	02713823          	sd	t2,48(sp)
    800073d0:	02813c23          	sd	s0,56(sp)
    800073d4:	04913023          	sd	s1,64(sp)
    800073d8:	04a13423          	sd	a0,72(sp)
    800073dc:	04b13823          	sd	a1,80(sp)
    800073e0:	04c13c23          	sd	a2,88(sp)
    800073e4:	06d13023          	sd	a3,96(sp)
    800073e8:	06e13423          	sd	a4,104(sp)
    800073ec:	06f13823          	sd	a5,112(sp)
    800073f0:	07013c23          	sd	a6,120(sp)
    800073f4:	09113023          	sd	a7,128(sp)
    800073f8:	09213423          	sd	s2,136(sp)
    800073fc:	09313823          	sd	s3,144(sp)
    80007400:	09413c23          	sd	s4,152(sp)
    80007404:	0b513023          	sd	s5,160(sp)
    80007408:	0b613423          	sd	s6,168(sp)
    8000740c:	0b713823          	sd	s7,176(sp)
    80007410:	0b813c23          	sd	s8,184(sp)
    80007414:	0d913023          	sd	s9,192(sp)
    80007418:	0da13423          	sd	s10,200(sp)
    8000741c:	0db13823          	sd	s11,208(sp)
    80007420:	0dc13c23          	sd	t3,216(sp)
    80007424:	0fd13023          	sd	t4,224(sp)
    80007428:	0fe13423          	sd	t5,232(sp)
    8000742c:	0ff13823          	sd	t6,240(sp)
    80007430:	ccdff0ef          	jal	ra,800070fc <kerneltrap>
    80007434:	00013083          	ld	ra,0(sp)
    80007438:	00813103          	ld	sp,8(sp)
    8000743c:	01013183          	ld	gp,16(sp)
    80007440:	02013283          	ld	t0,32(sp)
    80007444:	02813303          	ld	t1,40(sp)
    80007448:	03013383          	ld	t2,48(sp)
    8000744c:	03813403          	ld	s0,56(sp)
    80007450:	04013483          	ld	s1,64(sp)
    80007454:	04813503          	ld	a0,72(sp)
    80007458:	05013583          	ld	a1,80(sp)
    8000745c:	05813603          	ld	a2,88(sp)
    80007460:	06013683          	ld	a3,96(sp)
    80007464:	06813703          	ld	a4,104(sp)
    80007468:	07013783          	ld	a5,112(sp)
    8000746c:	07813803          	ld	a6,120(sp)
    80007470:	08013883          	ld	a7,128(sp)
    80007474:	08813903          	ld	s2,136(sp)
    80007478:	09013983          	ld	s3,144(sp)
    8000747c:	09813a03          	ld	s4,152(sp)
    80007480:	0a013a83          	ld	s5,160(sp)
    80007484:	0a813b03          	ld	s6,168(sp)
    80007488:	0b013b83          	ld	s7,176(sp)
    8000748c:	0b813c03          	ld	s8,184(sp)
    80007490:	0c013c83          	ld	s9,192(sp)
    80007494:	0c813d03          	ld	s10,200(sp)
    80007498:	0d013d83          	ld	s11,208(sp)
    8000749c:	0d813e03          	ld	t3,216(sp)
    800074a0:	0e013e83          	ld	t4,224(sp)
    800074a4:	0e813f03          	ld	t5,232(sp)
    800074a8:	0f013f83          	ld	t6,240(sp)
    800074ac:	10010113          	addi	sp,sp,256
    800074b0:	10200073          	sret
    800074b4:	00000013          	nop
    800074b8:	00000013          	nop
    800074bc:	00000013          	nop

00000000800074c0 <timervec>:
    800074c0:	34051573          	csrrw	a0,mscratch,a0
    800074c4:	00b53023          	sd	a1,0(a0)
    800074c8:	00c53423          	sd	a2,8(a0)
    800074cc:	00d53823          	sd	a3,16(a0)
    800074d0:	01853583          	ld	a1,24(a0)
    800074d4:	02053603          	ld	a2,32(a0)
    800074d8:	0005b683          	ld	a3,0(a1)
    800074dc:	00c686b3          	add	a3,a3,a2
    800074e0:	00d5b023          	sd	a3,0(a1)
    800074e4:	00200593          	li	a1,2
    800074e8:	14459073          	csrw	sip,a1
    800074ec:	01053683          	ld	a3,16(a0)
    800074f0:	00853603          	ld	a2,8(a0)
    800074f4:	00053583          	ld	a1,0(a0)
    800074f8:	34051573          	csrrw	a0,mscratch,a0
    800074fc:	30200073          	mret

0000000080007500 <plicinit>:
    80007500:	ff010113          	addi	sp,sp,-16
    80007504:	00813423          	sd	s0,8(sp)
    80007508:	01010413          	addi	s0,sp,16
    8000750c:	00813403          	ld	s0,8(sp)
    80007510:	0c0007b7          	lui	a5,0xc000
    80007514:	00100713          	li	a4,1
    80007518:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000751c:	00e7a223          	sw	a4,4(a5)
    80007520:	01010113          	addi	sp,sp,16
    80007524:	00008067          	ret

0000000080007528 <plicinithart>:
    80007528:	ff010113          	addi	sp,sp,-16
    8000752c:	00813023          	sd	s0,0(sp)
    80007530:	00113423          	sd	ra,8(sp)
    80007534:	01010413          	addi	s0,sp,16
    80007538:	00000097          	auipc	ra,0x0
    8000753c:	a44080e7          	jalr	-1468(ra) # 80006f7c <cpuid>
    80007540:	0085171b          	slliw	a4,a0,0x8
    80007544:	0c0027b7          	lui	a5,0xc002
    80007548:	00e787b3          	add	a5,a5,a4
    8000754c:	40200713          	li	a4,1026
    80007550:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80007554:	00813083          	ld	ra,8(sp)
    80007558:	00013403          	ld	s0,0(sp)
    8000755c:	00d5151b          	slliw	a0,a0,0xd
    80007560:	0c2017b7          	lui	a5,0xc201
    80007564:	00a78533          	add	a0,a5,a0
    80007568:	00052023          	sw	zero,0(a0)
    8000756c:	01010113          	addi	sp,sp,16
    80007570:	00008067          	ret

0000000080007574 <plic_claim>:
    80007574:	ff010113          	addi	sp,sp,-16
    80007578:	00813023          	sd	s0,0(sp)
    8000757c:	00113423          	sd	ra,8(sp)
    80007580:	01010413          	addi	s0,sp,16
    80007584:	00000097          	auipc	ra,0x0
    80007588:	9f8080e7          	jalr	-1544(ra) # 80006f7c <cpuid>
    8000758c:	00813083          	ld	ra,8(sp)
    80007590:	00013403          	ld	s0,0(sp)
    80007594:	00d5151b          	slliw	a0,a0,0xd
    80007598:	0c2017b7          	lui	a5,0xc201
    8000759c:	00a78533          	add	a0,a5,a0
    800075a0:	00452503          	lw	a0,4(a0)
    800075a4:	01010113          	addi	sp,sp,16
    800075a8:	00008067          	ret

00000000800075ac <plic_complete>:
    800075ac:	fe010113          	addi	sp,sp,-32
    800075b0:	00813823          	sd	s0,16(sp)
    800075b4:	00913423          	sd	s1,8(sp)
    800075b8:	00113c23          	sd	ra,24(sp)
    800075bc:	02010413          	addi	s0,sp,32
    800075c0:	00050493          	mv	s1,a0
    800075c4:	00000097          	auipc	ra,0x0
    800075c8:	9b8080e7          	jalr	-1608(ra) # 80006f7c <cpuid>
    800075cc:	01813083          	ld	ra,24(sp)
    800075d0:	01013403          	ld	s0,16(sp)
    800075d4:	00d5179b          	slliw	a5,a0,0xd
    800075d8:	0c201737          	lui	a4,0xc201
    800075dc:	00f707b3          	add	a5,a4,a5
    800075e0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800075e4:	00813483          	ld	s1,8(sp)
    800075e8:	02010113          	addi	sp,sp,32
    800075ec:	00008067          	ret

00000000800075f0 <consolewrite>:
    800075f0:	fb010113          	addi	sp,sp,-80
    800075f4:	04813023          	sd	s0,64(sp)
    800075f8:	04113423          	sd	ra,72(sp)
    800075fc:	02913c23          	sd	s1,56(sp)
    80007600:	03213823          	sd	s2,48(sp)
    80007604:	03313423          	sd	s3,40(sp)
    80007608:	03413023          	sd	s4,32(sp)
    8000760c:	01513c23          	sd	s5,24(sp)
    80007610:	05010413          	addi	s0,sp,80
    80007614:	06c05c63          	blez	a2,8000768c <consolewrite+0x9c>
    80007618:	00060993          	mv	s3,a2
    8000761c:	00050a13          	mv	s4,a0
    80007620:	00058493          	mv	s1,a1
    80007624:	00000913          	li	s2,0
    80007628:	fff00a93          	li	s5,-1
    8000762c:	01c0006f          	j	80007648 <consolewrite+0x58>
    80007630:	fbf44503          	lbu	a0,-65(s0)
    80007634:	0019091b          	addiw	s2,s2,1
    80007638:	00148493          	addi	s1,s1,1
    8000763c:	00001097          	auipc	ra,0x1
    80007640:	a9c080e7          	jalr	-1380(ra) # 800080d8 <uartputc>
    80007644:	03298063          	beq	s3,s2,80007664 <consolewrite+0x74>
    80007648:	00048613          	mv	a2,s1
    8000764c:	00100693          	li	a3,1
    80007650:	000a0593          	mv	a1,s4
    80007654:	fbf40513          	addi	a0,s0,-65
    80007658:	00000097          	auipc	ra,0x0
    8000765c:	9dc080e7          	jalr	-1572(ra) # 80007034 <either_copyin>
    80007660:	fd5518e3          	bne	a0,s5,80007630 <consolewrite+0x40>
    80007664:	04813083          	ld	ra,72(sp)
    80007668:	04013403          	ld	s0,64(sp)
    8000766c:	03813483          	ld	s1,56(sp)
    80007670:	02813983          	ld	s3,40(sp)
    80007674:	02013a03          	ld	s4,32(sp)
    80007678:	01813a83          	ld	s5,24(sp)
    8000767c:	00090513          	mv	a0,s2
    80007680:	03013903          	ld	s2,48(sp)
    80007684:	05010113          	addi	sp,sp,80
    80007688:	00008067          	ret
    8000768c:	00000913          	li	s2,0
    80007690:	fd5ff06f          	j	80007664 <consolewrite+0x74>

0000000080007694 <consoleread>:
    80007694:	f9010113          	addi	sp,sp,-112
    80007698:	06813023          	sd	s0,96(sp)
    8000769c:	04913c23          	sd	s1,88(sp)
    800076a0:	05213823          	sd	s2,80(sp)
    800076a4:	05313423          	sd	s3,72(sp)
    800076a8:	05413023          	sd	s4,64(sp)
    800076ac:	03513c23          	sd	s5,56(sp)
    800076b0:	03613823          	sd	s6,48(sp)
    800076b4:	03713423          	sd	s7,40(sp)
    800076b8:	03813023          	sd	s8,32(sp)
    800076bc:	06113423          	sd	ra,104(sp)
    800076c0:	01913c23          	sd	s9,24(sp)
    800076c4:	07010413          	addi	s0,sp,112
    800076c8:	00060b93          	mv	s7,a2
    800076cc:	00050913          	mv	s2,a0
    800076d0:	00058c13          	mv	s8,a1
    800076d4:	00060b1b          	sext.w	s6,a2
    800076d8:	00005497          	auipc	s1,0x5
    800076dc:	67048493          	addi	s1,s1,1648 # 8000cd48 <cons>
    800076e0:	00400993          	li	s3,4
    800076e4:	fff00a13          	li	s4,-1
    800076e8:	00a00a93          	li	s5,10
    800076ec:	05705e63          	blez	s7,80007748 <consoleread+0xb4>
    800076f0:	09c4a703          	lw	a4,156(s1)
    800076f4:	0984a783          	lw	a5,152(s1)
    800076f8:	0007071b          	sext.w	a4,a4
    800076fc:	08e78463          	beq	a5,a4,80007784 <consoleread+0xf0>
    80007700:	07f7f713          	andi	a4,a5,127
    80007704:	00e48733          	add	a4,s1,a4
    80007708:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000770c:	0017869b          	addiw	a3,a5,1
    80007710:	08d4ac23          	sw	a3,152(s1)
    80007714:	00070c9b          	sext.w	s9,a4
    80007718:	0b370663          	beq	a4,s3,800077c4 <consoleread+0x130>
    8000771c:	00100693          	li	a3,1
    80007720:	f9f40613          	addi	a2,s0,-97
    80007724:	000c0593          	mv	a1,s8
    80007728:	00090513          	mv	a0,s2
    8000772c:	f8e40fa3          	sb	a4,-97(s0)
    80007730:	00000097          	auipc	ra,0x0
    80007734:	8b8080e7          	jalr	-1864(ra) # 80006fe8 <either_copyout>
    80007738:	01450863          	beq	a0,s4,80007748 <consoleread+0xb4>
    8000773c:	001c0c13          	addi	s8,s8,1
    80007740:	fffb8b9b          	addiw	s7,s7,-1
    80007744:	fb5c94e3          	bne	s9,s5,800076ec <consoleread+0x58>
    80007748:	000b851b          	sext.w	a0,s7
    8000774c:	06813083          	ld	ra,104(sp)
    80007750:	06013403          	ld	s0,96(sp)
    80007754:	05813483          	ld	s1,88(sp)
    80007758:	05013903          	ld	s2,80(sp)
    8000775c:	04813983          	ld	s3,72(sp)
    80007760:	04013a03          	ld	s4,64(sp)
    80007764:	03813a83          	ld	s5,56(sp)
    80007768:	02813b83          	ld	s7,40(sp)
    8000776c:	02013c03          	ld	s8,32(sp)
    80007770:	01813c83          	ld	s9,24(sp)
    80007774:	40ab053b          	subw	a0,s6,a0
    80007778:	03013b03          	ld	s6,48(sp)
    8000777c:	07010113          	addi	sp,sp,112
    80007780:	00008067          	ret
    80007784:	00001097          	auipc	ra,0x1
    80007788:	1d8080e7          	jalr	472(ra) # 8000895c <push_on>
    8000778c:	0984a703          	lw	a4,152(s1)
    80007790:	09c4a783          	lw	a5,156(s1)
    80007794:	0007879b          	sext.w	a5,a5
    80007798:	fef70ce3          	beq	a4,a5,80007790 <consoleread+0xfc>
    8000779c:	00001097          	auipc	ra,0x1
    800077a0:	234080e7          	jalr	564(ra) # 800089d0 <pop_on>
    800077a4:	0984a783          	lw	a5,152(s1)
    800077a8:	07f7f713          	andi	a4,a5,127
    800077ac:	00e48733          	add	a4,s1,a4
    800077b0:	01874703          	lbu	a4,24(a4)
    800077b4:	0017869b          	addiw	a3,a5,1
    800077b8:	08d4ac23          	sw	a3,152(s1)
    800077bc:	00070c9b          	sext.w	s9,a4
    800077c0:	f5371ee3          	bne	a4,s3,8000771c <consoleread+0x88>
    800077c4:	000b851b          	sext.w	a0,s7
    800077c8:	f96bf2e3          	bgeu	s7,s6,8000774c <consoleread+0xb8>
    800077cc:	08f4ac23          	sw	a5,152(s1)
    800077d0:	f7dff06f          	j	8000774c <consoleread+0xb8>

00000000800077d4 <consputc>:
    800077d4:	10000793          	li	a5,256
    800077d8:	00f50663          	beq	a0,a5,800077e4 <consputc+0x10>
    800077dc:	00001317          	auipc	t1,0x1
    800077e0:	9f430067          	jr	-1548(t1) # 800081d0 <uartputc_sync>
    800077e4:	ff010113          	addi	sp,sp,-16
    800077e8:	00113423          	sd	ra,8(sp)
    800077ec:	00813023          	sd	s0,0(sp)
    800077f0:	01010413          	addi	s0,sp,16
    800077f4:	00800513          	li	a0,8
    800077f8:	00001097          	auipc	ra,0x1
    800077fc:	9d8080e7          	jalr	-1576(ra) # 800081d0 <uartputc_sync>
    80007800:	02000513          	li	a0,32
    80007804:	00001097          	auipc	ra,0x1
    80007808:	9cc080e7          	jalr	-1588(ra) # 800081d0 <uartputc_sync>
    8000780c:	00013403          	ld	s0,0(sp)
    80007810:	00813083          	ld	ra,8(sp)
    80007814:	00800513          	li	a0,8
    80007818:	01010113          	addi	sp,sp,16
    8000781c:	00001317          	auipc	t1,0x1
    80007820:	9b430067          	jr	-1612(t1) # 800081d0 <uartputc_sync>

0000000080007824 <consoleintr>:
    80007824:	fe010113          	addi	sp,sp,-32
    80007828:	00813823          	sd	s0,16(sp)
    8000782c:	00913423          	sd	s1,8(sp)
    80007830:	01213023          	sd	s2,0(sp)
    80007834:	00113c23          	sd	ra,24(sp)
    80007838:	02010413          	addi	s0,sp,32
    8000783c:	00005917          	auipc	s2,0x5
    80007840:	50c90913          	addi	s2,s2,1292 # 8000cd48 <cons>
    80007844:	00050493          	mv	s1,a0
    80007848:	00090513          	mv	a0,s2
    8000784c:	00001097          	auipc	ra,0x1
    80007850:	e40080e7          	jalr	-448(ra) # 8000868c <acquire>
    80007854:	02048c63          	beqz	s1,8000788c <consoleintr+0x68>
    80007858:	0a092783          	lw	a5,160(s2)
    8000785c:	09892703          	lw	a4,152(s2)
    80007860:	07f00693          	li	a3,127
    80007864:	40e7873b          	subw	a4,a5,a4
    80007868:	02e6e263          	bltu	a3,a4,8000788c <consoleintr+0x68>
    8000786c:	00d00713          	li	a4,13
    80007870:	04e48063          	beq	s1,a4,800078b0 <consoleintr+0x8c>
    80007874:	07f7f713          	andi	a4,a5,127
    80007878:	00e90733          	add	a4,s2,a4
    8000787c:	0017879b          	addiw	a5,a5,1
    80007880:	0af92023          	sw	a5,160(s2)
    80007884:	00970c23          	sb	s1,24(a4)
    80007888:	08f92e23          	sw	a5,156(s2)
    8000788c:	01013403          	ld	s0,16(sp)
    80007890:	01813083          	ld	ra,24(sp)
    80007894:	00813483          	ld	s1,8(sp)
    80007898:	00013903          	ld	s2,0(sp)
    8000789c:	00005517          	auipc	a0,0x5
    800078a0:	4ac50513          	addi	a0,a0,1196 # 8000cd48 <cons>
    800078a4:	02010113          	addi	sp,sp,32
    800078a8:	00001317          	auipc	t1,0x1
    800078ac:	eb030067          	jr	-336(t1) # 80008758 <release>
    800078b0:	00a00493          	li	s1,10
    800078b4:	fc1ff06f          	j	80007874 <consoleintr+0x50>

00000000800078b8 <consoleinit>:
    800078b8:	fe010113          	addi	sp,sp,-32
    800078bc:	00113c23          	sd	ra,24(sp)
    800078c0:	00813823          	sd	s0,16(sp)
    800078c4:	00913423          	sd	s1,8(sp)
    800078c8:	02010413          	addi	s0,sp,32
    800078cc:	00005497          	auipc	s1,0x5
    800078d0:	47c48493          	addi	s1,s1,1148 # 8000cd48 <cons>
    800078d4:	00048513          	mv	a0,s1
    800078d8:	00002597          	auipc	a1,0x2
    800078dc:	f0058593          	addi	a1,a1,-256 # 800097d8 <CONSOLE_STATUS+0x7c8>
    800078e0:	00001097          	auipc	ra,0x1
    800078e4:	d88080e7          	jalr	-632(ra) # 80008668 <initlock>
    800078e8:	00000097          	auipc	ra,0x0
    800078ec:	7ac080e7          	jalr	1964(ra) # 80008094 <uartinit>
    800078f0:	01813083          	ld	ra,24(sp)
    800078f4:	01013403          	ld	s0,16(sp)
    800078f8:	00000797          	auipc	a5,0x0
    800078fc:	d9c78793          	addi	a5,a5,-612 # 80007694 <consoleread>
    80007900:	0af4bc23          	sd	a5,184(s1)
    80007904:	00000797          	auipc	a5,0x0
    80007908:	cec78793          	addi	a5,a5,-788 # 800075f0 <consolewrite>
    8000790c:	0cf4b023          	sd	a5,192(s1)
    80007910:	00813483          	ld	s1,8(sp)
    80007914:	02010113          	addi	sp,sp,32
    80007918:	00008067          	ret

000000008000791c <console_read>:
    8000791c:	ff010113          	addi	sp,sp,-16
    80007920:	00813423          	sd	s0,8(sp)
    80007924:	01010413          	addi	s0,sp,16
    80007928:	00813403          	ld	s0,8(sp)
    8000792c:	00005317          	auipc	t1,0x5
    80007930:	4d433303          	ld	t1,1236(t1) # 8000ce00 <devsw+0x10>
    80007934:	01010113          	addi	sp,sp,16
    80007938:	00030067          	jr	t1

000000008000793c <console_write>:
    8000793c:	ff010113          	addi	sp,sp,-16
    80007940:	00813423          	sd	s0,8(sp)
    80007944:	01010413          	addi	s0,sp,16
    80007948:	00813403          	ld	s0,8(sp)
    8000794c:	00005317          	auipc	t1,0x5
    80007950:	4bc33303          	ld	t1,1212(t1) # 8000ce08 <devsw+0x18>
    80007954:	01010113          	addi	sp,sp,16
    80007958:	00030067          	jr	t1

000000008000795c <panic>:
    8000795c:	fe010113          	addi	sp,sp,-32
    80007960:	00113c23          	sd	ra,24(sp)
    80007964:	00813823          	sd	s0,16(sp)
    80007968:	00913423          	sd	s1,8(sp)
    8000796c:	02010413          	addi	s0,sp,32
    80007970:	00050493          	mv	s1,a0
    80007974:	00002517          	auipc	a0,0x2
    80007978:	e6c50513          	addi	a0,a0,-404 # 800097e0 <CONSOLE_STATUS+0x7d0>
    8000797c:	00005797          	auipc	a5,0x5
    80007980:	5207a623          	sw	zero,1324(a5) # 8000cea8 <pr+0x18>
    80007984:	00000097          	auipc	ra,0x0
    80007988:	034080e7          	jalr	52(ra) # 800079b8 <__printf>
    8000798c:	00048513          	mv	a0,s1
    80007990:	00000097          	auipc	ra,0x0
    80007994:	028080e7          	jalr	40(ra) # 800079b8 <__printf>
    80007998:	00002517          	auipc	a0,0x2
    8000799c:	bd050513          	addi	a0,a0,-1072 # 80009568 <CONSOLE_STATUS+0x558>
    800079a0:	00000097          	auipc	ra,0x0
    800079a4:	018080e7          	jalr	24(ra) # 800079b8 <__printf>
    800079a8:	00100793          	li	a5,1
    800079ac:	00004717          	auipc	a4,0x4
    800079b0:	16f72623          	sw	a5,364(a4) # 8000bb18 <panicked>
    800079b4:	0000006f          	j	800079b4 <panic+0x58>

00000000800079b8 <__printf>:
    800079b8:	f3010113          	addi	sp,sp,-208
    800079bc:	08813023          	sd	s0,128(sp)
    800079c0:	07313423          	sd	s3,104(sp)
    800079c4:	09010413          	addi	s0,sp,144
    800079c8:	05813023          	sd	s8,64(sp)
    800079cc:	08113423          	sd	ra,136(sp)
    800079d0:	06913c23          	sd	s1,120(sp)
    800079d4:	07213823          	sd	s2,112(sp)
    800079d8:	07413023          	sd	s4,96(sp)
    800079dc:	05513c23          	sd	s5,88(sp)
    800079e0:	05613823          	sd	s6,80(sp)
    800079e4:	05713423          	sd	s7,72(sp)
    800079e8:	03913c23          	sd	s9,56(sp)
    800079ec:	03a13823          	sd	s10,48(sp)
    800079f0:	03b13423          	sd	s11,40(sp)
    800079f4:	00005317          	auipc	t1,0x5
    800079f8:	49c30313          	addi	t1,t1,1180 # 8000ce90 <pr>
    800079fc:	01832c03          	lw	s8,24(t1)
    80007a00:	00b43423          	sd	a1,8(s0)
    80007a04:	00c43823          	sd	a2,16(s0)
    80007a08:	00d43c23          	sd	a3,24(s0)
    80007a0c:	02e43023          	sd	a4,32(s0)
    80007a10:	02f43423          	sd	a5,40(s0)
    80007a14:	03043823          	sd	a6,48(s0)
    80007a18:	03143c23          	sd	a7,56(s0)
    80007a1c:	00050993          	mv	s3,a0
    80007a20:	4a0c1663          	bnez	s8,80007ecc <__printf+0x514>
    80007a24:	60098c63          	beqz	s3,8000803c <__printf+0x684>
    80007a28:	0009c503          	lbu	a0,0(s3)
    80007a2c:	00840793          	addi	a5,s0,8
    80007a30:	f6f43c23          	sd	a5,-136(s0)
    80007a34:	00000493          	li	s1,0
    80007a38:	22050063          	beqz	a0,80007c58 <__printf+0x2a0>
    80007a3c:	00002a37          	lui	s4,0x2
    80007a40:	00018ab7          	lui	s5,0x18
    80007a44:	000f4b37          	lui	s6,0xf4
    80007a48:	00989bb7          	lui	s7,0x989
    80007a4c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80007a50:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80007a54:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80007a58:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80007a5c:	00148c9b          	addiw	s9,s1,1
    80007a60:	02500793          	li	a5,37
    80007a64:	01998933          	add	s2,s3,s9
    80007a68:	38f51263          	bne	a0,a5,80007dec <__printf+0x434>
    80007a6c:	00094783          	lbu	a5,0(s2)
    80007a70:	00078c9b          	sext.w	s9,a5
    80007a74:	1e078263          	beqz	a5,80007c58 <__printf+0x2a0>
    80007a78:	0024849b          	addiw	s1,s1,2
    80007a7c:	07000713          	li	a4,112
    80007a80:	00998933          	add	s2,s3,s1
    80007a84:	38e78a63          	beq	a5,a4,80007e18 <__printf+0x460>
    80007a88:	20f76863          	bltu	a4,a5,80007c98 <__printf+0x2e0>
    80007a8c:	42a78863          	beq	a5,a0,80007ebc <__printf+0x504>
    80007a90:	06400713          	li	a4,100
    80007a94:	40e79663          	bne	a5,a4,80007ea0 <__printf+0x4e8>
    80007a98:	f7843783          	ld	a5,-136(s0)
    80007a9c:	0007a603          	lw	a2,0(a5)
    80007aa0:	00878793          	addi	a5,a5,8
    80007aa4:	f6f43c23          	sd	a5,-136(s0)
    80007aa8:	42064a63          	bltz	a2,80007edc <__printf+0x524>
    80007aac:	00a00713          	li	a4,10
    80007ab0:	02e677bb          	remuw	a5,a2,a4
    80007ab4:	00002d97          	auipc	s11,0x2
    80007ab8:	d54d8d93          	addi	s11,s11,-684 # 80009808 <digits>
    80007abc:	00900593          	li	a1,9
    80007ac0:	0006051b          	sext.w	a0,a2
    80007ac4:	00000c93          	li	s9,0
    80007ac8:	02079793          	slli	a5,a5,0x20
    80007acc:	0207d793          	srli	a5,a5,0x20
    80007ad0:	00fd87b3          	add	a5,s11,a5
    80007ad4:	0007c783          	lbu	a5,0(a5)
    80007ad8:	02e656bb          	divuw	a3,a2,a4
    80007adc:	f8f40023          	sb	a5,-128(s0)
    80007ae0:	14c5d863          	bge	a1,a2,80007c30 <__printf+0x278>
    80007ae4:	06300593          	li	a1,99
    80007ae8:	00100c93          	li	s9,1
    80007aec:	02e6f7bb          	remuw	a5,a3,a4
    80007af0:	02079793          	slli	a5,a5,0x20
    80007af4:	0207d793          	srli	a5,a5,0x20
    80007af8:	00fd87b3          	add	a5,s11,a5
    80007afc:	0007c783          	lbu	a5,0(a5)
    80007b00:	02e6d73b          	divuw	a4,a3,a4
    80007b04:	f8f400a3          	sb	a5,-127(s0)
    80007b08:	12a5f463          	bgeu	a1,a0,80007c30 <__printf+0x278>
    80007b0c:	00a00693          	li	a3,10
    80007b10:	00900593          	li	a1,9
    80007b14:	02d777bb          	remuw	a5,a4,a3
    80007b18:	02079793          	slli	a5,a5,0x20
    80007b1c:	0207d793          	srli	a5,a5,0x20
    80007b20:	00fd87b3          	add	a5,s11,a5
    80007b24:	0007c503          	lbu	a0,0(a5)
    80007b28:	02d757bb          	divuw	a5,a4,a3
    80007b2c:	f8a40123          	sb	a0,-126(s0)
    80007b30:	48e5f263          	bgeu	a1,a4,80007fb4 <__printf+0x5fc>
    80007b34:	06300513          	li	a0,99
    80007b38:	02d7f5bb          	remuw	a1,a5,a3
    80007b3c:	02059593          	slli	a1,a1,0x20
    80007b40:	0205d593          	srli	a1,a1,0x20
    80007b44:	00bd85b3          	add	a1,s11,a1
    80007b48:	0005c583          	lbu	a1,0(a1)
    80007b4c:	02d7d7bb          	divuw	a5,a5,a3
    80007b50:	f8b401a3          	sb	a1,-125(s0)
    80007b54:	48e57263          	bgeu	a0,a4,80007fd8 <__printf+0x620>
    80007b58:	3e700513          	li	a0,999
    80007b5c:	02d7f5bb          	remuw	a1,a5,a3
    80007b60:	02059593          	slli	a1,a1,0x20
    80007b64:	0205d593          	srli	a1,a1,0x20
    80007b68:	00bd85b3          	add	a1,s11,a1
    80007b6c:	0005c583          	lbu	a1,0(a1)
    80007b70:	02d7d7bb          	divuw	a5,a5,a3
    80007b74:	f8b40223          	sb	a1,-124(s0)
    80007b78:	46e57663          	bgeu	a0,a4,80007fe4 <__printf+0x62c>
    80007b7c:	02d7f5bb          	remuw	a1,a5,a3
    80007b80:	02059593          	slli	a1,a1,0x20
    80007b84:	0205d593          	srli	a1,a1,0x20
    80007b88:	00bd85b3          	add	a1,s11,a1
    80007b8c:	0005c583          	lbu	a1,0(a1)
    80007b90:	02d7d7bb          	divuw	a5,a5,a3
    80007b94:	f8b402a3          	sb	a1,-123(s0)
    80007b98:	46ea7863          	bgeu	s4,a4,80008008 <__printf+0x650>
    80007b9c:	02d7f5bb          	remuw	a1,a5,a3
    80007ba0:	02059593          	slli	a1,a1,0x20
    80007ba4:	0205d593          	srli	a1,a1,0x20
    80007ba8:	00bd85b3          	add	a1,s11,a1
    80007bac:	0005c583          	lbu	a1,0(a1)
    80007bb0:	02d7d7bb          	divuw	a5,a5,a3
    80007bb4:	f8b40323          	sb	a1,-122(s0)
    80007bb8:	3eeaf863          	bgeu	s5,a4,80007fa8 <__printf+0x5f0>
    80007bbc:	02d7f5bb          	remuw	a1,a5,a3
    80007bc0:	02059593          	slli	a1,a1,0x20
    80007bc4:	0205d593          	srli	a1,a1,0x20
    80007bc8:	00bd85b3          	add	a1,s11,a1
    80007bcc:	0005c583          	lbu	a1,0(a1)
    80007bd0:	02d7d7bb          	divuw	a5,a5,a3
    80007bd4:	f8b403a3          	sb	a1,-121(s0)
    80007bd8:	42eb7e63          	bgeu	s6,a4,80008014 <__printf+0x65c>
    80007bdc:	02d7f5bb          	remuw	a1,a5,a3
    80007be0:	02059593          	slli	a1,a1,0x20
    80007be4:	0205d593          	srli	a1,a1,0x20
    80007be8:	00bd85b3          	add	a1,s11,a1
    80007bec:	0005c583          	lbu	a1,0(a1)
    80007bf0:	02d7d7bb          	divuw	a5,a5,a3
    80007bf4:	f8b40423          	sb	a1,-120(s0)
    80007bf8:	42ebfc63          	bgeu	s7,a4,80008030 <__printf+0x678>
    80007bfc:	02079793          	slli	a5,a5,0x20
    80007c00:	0207d793          	srli	a5,a5,0x20
    80007c04:	00fd8db3          	add	s11,s11,a5
    80007c08:	000dc703          	lbu	a4,0(s11)
    80007c0c:	00a00793          	li	a5,10
    80007c10:	00900c93          	li	s9,9
    80007c14:	f8e404a3          	sb	a4,-119(s0)
    80007c18:	00065c63          	bgez	a2,80007c30 <__printf+0x278>
    80007c1c:	f9040713          	addi	a4,s0,-112
    80007c20:	00f70733          	add	a4,a4,a5
    80007c24:	02d00693          	li	a3,45
    80007c28:	fed70823          	sb	a3,-16(a4)
    80007c2c:	00078c93          	mv	s9,a5
    80007c30:	f8040793          	addi	a5,s0,-128
    80007c34:	01978cb3          	add	s9,a5,s9
    80007c38:	f7f40d13          	addi	s10,s0,-129
    80007c3c:	000cc503          	lbu	a0,0(s9)
    80007c40:	fffc8c93          	addi	s9,s9,-1
    80007c44:	00000097          	auipc	ra,0x0
    80007c48:	b90080e7          	jalr	-1136(ra) # 800077d4 <consputc>
    80007c4c:	ffac98e3          	bne	s9,s10,80007c3c <__printf+0x284>
    80007c50:	00094503          	lbu	a0,0(s2)
    80007c54:	e00514e3          	bnez	a0,80007a5c <__printf+0xa4>
    80007c58:	1a0c1663          	bnez	s8,80007e04 <__printf+0x44c>
    80007c5c:	08813083          	ld	ra,136(sp)
    80007c60:	08013403          	ld	s0,128(sp)
    80007c64:	07813483          	ld	s1,120(sp)
    80007c68:	07013903          	ld	s2,112(sp)
    80007c6c:	06813983          	ld	s3,104(sp)
    80007c70:	06013a03          	ld	s4,96(sp)
    80007c74:	05813a83          	ld	s5,88(sp)
    80007c78:	05013b03          	ld	s6,80(sp)
    80007c7c:	04813b83          	ld	s7,72(sp)
    80007c80:	04013c03          	ld	s8,64(sp)
    80007c84:	03813c83          	ld	s9,56(sp)
    80007c88:	03013d03          	ld	s10,48(sp)
    80007c8c:	02813d83          	ld	s11,40(sp)
    80007c90:	0d010113          	addi	sp,sp,208
    80007c94:	00008067          	ret
    80007c98:	07300713          	li	a4,115
    80007c9c:	1ce78a63          	beq	a5,a4,80007e70 <__printf+0x4b8>
    80007ca0:	07800713          	li	a4,120
    80007ca4:	1ee79e63          	bne	a5,a4,80007ea0 <__printf+0x4e8>
    80007ca8:	f7843783          	ld	a5,-136(s0)
    80007cac:	0007a703          	lw	a4,0(a5)
    80007cb0:	00878793          	addi	a5,a5,8
    80007cb4:	f6f43c23          	sd	a5,-136(s0)
    80007cb8:	28074263          	bltz	a4,80007f3c <__printf+0x584>
    80007cbc:	00002d97          	auipc	s11,0x2
    80007cc0:	b4cd8d93          	addi	s11,s11,-1204 # 80009808 <digits>
    80007cc4:	00f77793          	andi	a5,a4,15
    80007cc8:	00fd87b3          	add	a5,s11,a5
    80007ccc:	0007c683          	lbu	a3,0(a5)
    80007cd0:	00f00613          	li	a2,15
    80007cd4:	0007079b          	sext.w	a5,a4
    80007cd8:	f8d40023          	sb	a3,-128(s0)
    80007cdc:	0047559b          	srliw	a1,a4,0x4
    80007ce0:	0047569b          	srliw	a3,a4,0x4
    80007ce4:	00000c93          	li	s9,0
    80007ce8:	0ee65063          	bge	a2,a4,80007dc8 <__printf+0x410>
    80007cec:	00f6f693          	andi	a3,a3,15
    80007cf0:	00dd86b3          	add	a3,s11,a3
    80007cf4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80007cf8:	0087d79b          	srliw	a5,a5,0x8
    80007cfc:	00100c93          	li	s9,1
    80007d00:	f8d400a3          	sb	a3,-127(s0)
    80007d04:	0cb67263          	bgeu	a2,a1,80007dc8 <__printf+0x410>
    80007d08:	00f7f693          	andi	a3,a5,15
    80007d0c:	00dd86b3          	add	a3,s11,a3
    80007d10:	0006c583          	lbu	a1,0(a3)
    80007d14:	00f00613          	li	a2,15
    80007d18:	0047d69b          	srliw	a3,a5,0x4
    80007d1c:	f8b40123          	sb	a1,-126(s0)
    80007d20:	0047d593          	srli	a1,a5,0x4
    80007d24:	28f67e63          	bgeu	a2,a5,80007fc0 <__printf+0x608>
    80007d28:	00f6f693          	andi	a3,a3,15
    80007d2c:	00dd86b3          	add	a3,s11,a3
    80007d30:	0006c503          	lbu	a0,0(a3)
    80007d34:	0087d813          	srli	a6,a5,0x8
    80007d38:	0087d69b          	srliw	a3,a5,0x8
    80007d3c:	f8a401a3          	sb	a0,-125(s0)
    80007d40:	28b67663          	bgeu	a2,a1,80007fcc <__printf+0x614>
    80007d44:	00f6f693          	andi	a3,a3,15
    80007d48:	00dd86b3          	add	a3,s11,a3
    80007d4c:	0006c583          	lbu	a1,0(a3)
    80007d50:	00c7d513          	srli	a0,a5,0xc
    80007d54:	00c7d69b          	srliw	a3,a5,0xc
    80007d58:	f8b40223          	sb	a1,-124(s0)
    80007d5c:	29067a63          	bgeu	a2,a6,80007ff0 <__printf+0x638>
    80007d60:	00f6f693          	andi	a3,a3,15
    80007d64:	00dd86b3          	add	a3,s11,a3
    80007d68:	0006c583          	lbu	a1,0(a3)
    80007d6c:	0107d813          	srli	a6,a5,0x10
    80007d70:	0107d69b          	srliw	a3,a5,0x10
    80007d74:	f8b402a3          	sb	a1,-123(s0)
    80007d78:	28a67263          	bgeu	a2,a0,80007ffc <__printf+0x644>
    80007d7c:	00f6f693          	andi	a3,a3,15
    80007d80:	00dd86b3          	add	a3,s11,a3
    80007d84:	0006c683          	lbu	a3,0(a3)
    80007d88:	0147d79b          	srliw	a5,a5,0x14
    80007d8c:	f8d40323          	sb	a3,-122(s0)
    80007d90:	21067663          	bgeu	a2,a6,80007f9c <__printf+0x5e4>
    80007d94:	02079793          	slli	a5,a5,0x20
    80007d98:	0207d793          	srli	a5,a5,0x20
    80007d9c:	00fd8db3          	add	s11,s11,a5
    80007da0:	000dc683          	lbu	a3,0(s11)
    80007da4:	00800793          	li	a5,8
    80007da8:	00700c93          	li	s9,7
    80007dac:	f8d403a3          	sb	a3,-121(s0)
    80007db0:	00075c63          	bgez	a4,80007dc8 <__printf+0x410>
    80007db4:	f9040713          	addi	a4,s0,-112
    80007db8:	00f70733          	add	a4,a4,a5
    80007dbc:	02d00693          	li	a3,45
    80007dc0:	fed70823          	sb	a3,-16(a4)
    80007dc4:	00078c93          	mv	s9,a5
    80007dc8:	f8040793          	addi	a5,s0,-128
    80007dcc:	01978cb3          	add	s9,a5,s9
    80007dd0:	f7f40d13          	addi	s10,s0,-129
    80007dd4:	000cc503          	lbu	a0,0(s9)
    80007dd8:	fffc8c93          	addi	s9,s9,-1
    80007ddc:	00000097          	auipc	ra,0x0
    80007de0:	9f8080e7          	jalr	-1544(ra) # 800077d4 <consputc>
    80007de4:	ff9d18e3          	bne	s10,s9,80007dd4 <__printf+0x41c>
    80007de8:	0100006f          	j	80007df8 <__printf+0x440>
    80007dec:	00000097          	auipc	ra,0x0
    80007df0:	9e8080e7          	jalr	-1560(ra) # 800077d4 <consputc>
    80007df4:	000c8493          	mv	s1,s9
    80007df8:	00094503          	lbu	a0,0(s2)
    80007dfc:	c60510e3          	bnez	a0,80007a5c <__printf+0xa4>
    80007e00:	e40c0ee3          	beqz	s8,80007c5c <__printf+0x2a4>
    80007e04:	00005517          	auipc	a0,0x5
    80007e08:	08c50513          	addi	a0,a0,140 # 8000ce90 <pr>
    80007e0c:	00001097          	auipc	ra,0x1
    80007e10:	94c080e7          	jalr	-1716(ra) # 80008758 <release>
    80007e14:	e49ff06f          	j	80007c5c <__printf+0x2a4>
    80007e18:	f7843783          	ld	a5,-136(s0)
    80007e1c:	03000513          	li	a0,48
    80007e20:	01000d13          	li	s10,16
    80007e24:	00878713          	addi	a4,a5,8
    80007e28:	0007bc83          	ld	s9,0(a5)
    80007e2c:	f6e43c23          	sd	a4,-136(s0)
    80007e30:	00000097          	auipc	ra,0x0
    80007e34:	9a4080e7          	jalr	-1628(ra) # 800077d4 <consputc>
    80007e38:	07800513          	li	a0,120
    80007e3c:	00000097          	auipc	ra,0x0
    80007e40:	998080e7          	jalr	-1640(ra) # 800077d4 <consputc>
    80007e44:	00002d97          	auipc	s11,0x2
    80007e48:	9c4d8d93          	addi	s11,s11,-1596 # 80009808 <digits>
    80007e4c:	03ccd793          	srli	a5,s9,0x3c
    80007e50:	00fd87b3          	add	a5,s11,a5
    80007e54:	0007c503          	lbu	a0,0(a5)
    80007e58:	fffd0d1b          	addiw	s10,s10,-1
    80007e5c:	004c9c93          	slli	s9,s9,0x4
    80007e60:	00000097          	auipc	ra,0x0
    80007e64:	974080e7          	jalr	-1676(ra) # 800077d4 <consputc>
    80007e68:	fe0d12e3          	bnez	s10,80007e4c <__printf+0x494>
    80007e6c:	f8dff06f          	j	80007df8 <__printf+0x440>
    80007e70:	f7843783          	ld	a5,-136(s0)
    80007e74:	0007bc83          	ld	s9,0(a5)
    80007e78:	00878793          	addi	a5,a5,8
    80007e7c:	f6f43c23          	sd	a5,-136(s0)
    80007e80:	000c9a63          	bnez	s9,80007e94 <__printf+0x4dc>
    80007e84:	1080006f          	j	80007f8c <__printf+0x5d4>
    80007e88:	001c8c93          	addi	s9,s9,1
    80007e8c:	00000097          	auipc	ra,0x0
    80007e90:	948080e7          	jalr	-1720(ra) # 800077d4 <consputc>
    80007e94:	000cc503          	lbu	a0,0(s9)
    80007e98:	fe0518e3          	bnez	a0,80007e88 <__printf+0x4d0>
    80007e9c:	f5dff06f          	j	80007df8 <__printf+0x440>
    80007ea0:	02500513          	li	a0,37
    80007ea4:	00000097          	auipc	ra,0x0
    80007ea8:	930080e7          	jalr	-1744(ra) # 800077d4 <consputc>
    80007eac:	000c8513          	mv	a0,s9
    80007eb0:	00000097          	auipc	ra,0x0
    80007eb4:	924080e7          	jalr	-1756(ra) # 800077d4 <consputc>
    80007eb8:	f41ff06f          	j	80007df8 <__printf+0x440>
    80007ebc:	02500513          	li	a0,37
    80007ec0:	00000097          	auipc	ra,0x0
    80007ec4:	914080e7          	jalr	-1772(ra) # 800077d4 <consputc>
    80007ec8:	f31ff06f          	j	80007df8 <__printf+0x440>
    80007ecc:	00030513          	mv	a0,t1
    80007ed0:	00000097          	auipc	ra,0x0
    80007ed4:	7bc080e7          	jalr	1980(ra) # 8000868c <acquire>
    80007ed8:	b4dff06f          	j	80007a24 <__printf+0x6c>
    80007edc:	40c0053b          	negw	a0,a2
    80007ee0:	00a00713          	li	a4,10
    80007ee4:	02e576bb          	remuw	a3,a0,a4
    80007ee8:	00002d97          	auipc	s11,0x2
    80007eec:	920d8d93          	addi	s11,s11,-1760 # 80009808 <digits>
    80007ef0:	ff700593          	li	a1,-9
    80007ef4:	02069693          	slli	a3,a3,0x20
    80007ef8:	0206d693          	srli	a3,a3,0x20
    80007efc:	00dd86b3          	add	a3,s11,a3
    80007f00:	0006c683          	lbu	a3,0(a3)
    80007f04:	02e557bb          	divuw	a5,a0,a4
    80007f08:	f8d40023          	sb	a3,-128(s0)
    80007f0c:	10b65e63          	bge	a2,a1,80008028 <__printf+0x670>
    80007f10:	06300593          	li	a1,99
    80007f14:	02e7f6bb          	remuw	a3,a5,a4
    80007f18:	02069693          	slli	a3,a3,0x20
    80007f1c:	0206d693          	srli	a3,a3,0x20
    80007f20:	00dd86b3          	add	a3,s11,a3
    80007f24:	0006c683          	lbu	a3,0(a3)
    80007f28:	02e7d73b          	divuw	a4,a5,a4
    80007f2c:	00200793          	li	a5,2
    80007f30:	f8d400a3          	sb	a3,-127(s0)
    80007f34:	bca5ece3          	bltu	a1,a0,80007b0c <__printf+0x154>
    80007f38:	ce5ff06f          	j	80007c1c <__printf+0x264>
    80007f3c:	40e007bb          	negw	a5,a4
    80007f40:	00002d97          	auipc	s11,0x2
    80007f44:	8c8d8d93          	addi	s11,s11,-1848 # 80009808 <digits>
    80007f48:	00f7f693          	andi	a3,a5,15
    80007f4c:	00dd86b3          	add	a3,s11,a3
    80007f50:	0006c583          	lbu	a1,0(a3)
    80007f54:	ff100613          	li	a2,-15
    80007f58:	0047d69b          	srliw	a3,a5,0x4
    80007f5c:	f8b40023          	sb	a1,-128(s0)
    80007f60:	0047d59b          	srliw	a1,a5,0x4
    80007f64:	0ac75e63          	bge	a4,a2,80008020 <__printf+0x668>
    80007f68:	00f6f693          	andi	a3,a3,15
    80007f6c:	00dd86b3          	add	a3,s11,a3
    80007f70:	0006c603          	lbu	a2,0(a3)
    80007f74:	00f00693          	li	a3,15
    80007f78:	0087d79b          	srliw	a5,a5,0x8
    80007f7c:	f8c400a3          	sb	a2,-127(s0)
    80007f80:	d8b6e4e3          	bltu	a3,a1,80007d08 <__printf+0x350>
    80007f84:	00200793          	li	a5,2
    80007f88:	e2dff06f          	j	80007db4 <__printf+0x3fc>
    80007f8c:	00002c97          	auipc	s9,0x2
    80007f90:	85cc8c93          	addi	s9,s9,-1956 # 800097e8 <CONSOLE_STATUS+0x7d8>
    80007f94:	02800513          	li	a0,40
    80007f98:	ef1ff06f          	j	80007e88 <__printf+0x4d0>
    80007f9c:	00700793          	li	a5,7
    80007fa0:	00600c93          	li	s9,6
    80007fa4:	e0dff06f          	j	80007db0 <__printf+0x3f8>
    80007fa8:	00700793          	li	a5,7
    80007fac:	00600c93          	li	s9,6
    80007fb0:	c69ff06f          	j	80007c18 <__printf+0x260>
    80007fb4:	00300793          	li	a5,3
    80007fb8:	00200c93          	li	s9,2
    80007fbc:	c5dff06f          	j	80007c18 <__printf+0x260>
    80007fc0:	00300793          	li	a5,3
    80007fc4:	00200c93          	li	s9,2
    80007fc8:	de9ff06f          	j	80007db0 <__printf+0x3f8>
    80007fcc:	00400793          	li	a5,4
    80007fd0:	00300c93          	li	s9,3
    80007fd4:	dddff06f          	j	80007db0 <__printf+0x3f8>
    80007fd8:	00400793          	li	a5,4
    80007fdc:	00300c93          	li	s9,3
    80007fe0:	c39ff06f          	j	80007c18 <__printf+0x260>
    80007fe4:	00500793          	li	a5,5
    80007fe8:	00400c93          	li	s9,4
    80007fec:	c2dff06f          	j	80007c18 <__printf+0x260>
    80007ff0:	00500793          	li	a5,5
    80007ff4:	00400c93          	li	s9,4
    80007ff8:	db9ff06f          	j	80007db0 <__printf+0x3f8>
    80007ffc:	00600793          	li	a5,6
    80008000:	00500c93          	li	s9,5
    80008004:	dadff06f          	j	80007db0 <__printf+0x3f8>
    80008008:	00600793          	li	a5,6
    8000800c:	00500c93          	li	s9,5
    80008010:	c09ff06f          	j	80007c18 <__printf+0x260>
    80008014:	00800793          	li	a5,8
    80008018:	00700c93          	li	s9,7
    8000801c:	bfdff06f          	j	80007c18 <__printf+0x260>
    80008020:	00100793          	li	a5,1
    80008024:	d91ff06f          	j	80007db4 <__printf+0x3fc>
    80008028:	00100793          	li	a5,1
    8000802c:	bf1ff06f          	j	80007c1c <__printf+0x264>
    80008030:	00900793          	li	a5,9
    80008034:	00800c93          	li	s9,8
    80008038:	be1ff06f          	j	80007c18 <__printf+0x260>
    8000803c:	00001517          	auipc	a0,0x1
    80008040:	7b450513          	addi	a0,a0,1972 # 800097f0 <CONSOLE_STATUS+0x7e0>
    80008044:	00000097          	auipc	ra,0x0
    80008048:	918080e7          	jalr	-1768(ra) # 8000795c <panic>

000000008000804c <printfinit>:
    8000804c:	fe010113          	addi	sp,sp,-32
    80008050:	00813823          	sd	s0,16(sp)
    80008054:	00913423          	sd	s1,8(sp)
    80008058:	00113c23          	sd	ra,24(sp)
    8000805c:	02010413          	addi	s0,sp,32
    80008060:	00005497          	auipc	s1,0x5
    80008064:	e3048493          	addi	s1,s1,-464 # 8000ce90 <pr>
    80008068:	00048513          	mv	a0,s1
    8000806c:	00001597          	auipc	a1,0x1
    80008070:	79458593          	addi	a1,a1,1940 # 80009800 <CONSOLE_STATUS+0x7f0>
    80008074:	00000097          	auipc	ra,0x0
    80008078:	5f4080e7          	jalr	1524(ra) # 80008668 <initlock>
    8000807c:	01813083          	ld	ra,24(sp)
    80008080:	01013403          	ld	s0,16(sp)
    80008084:	0004ac23          	sw	zero,24(s1)
    80008088:	00813483          	ld	s1,8(sp)
    8000808c:	02010113          	addi	sp,sp,32
    80008090:	00008067          	ret

0000000080008094 <uartinit>:
    80008094:	ff010113          	addi	sp,sp,-16
    80008098:	00813423          	sd	s0,8(sp)
    8000809c:	01010413          	addi	s0,sp,16
    800080a0:	100007b7          	lui	a5,0x10000
    800080a4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800080a8:	f8000713          	li	a4,-128
    800080ac:	00e781a3          	sb	a4,3(a5)
    800080b0:	00300713          	li	a4,3
    800080b4:	00e78023          	sb	a4,0(a5)
    800080b8:	000780a3          	sb	zero,1(a5)
    800080bc:	00e781a3          	sb	a4,3(a5)
    800080c0:	00700693          	li	a3,7
    800080c4:	00d78123          	sb	a3,2(a5)
    800080c8:	00e780a3          	sb	a4,1(a5)
    800080cc:	00813403          	ld	s0,8(sp)
    800080d0:	01010113          	addi	sp,sp,16
    800080d4:	00008067          	ret

00000000800080d8 <uartputc>:
    800080d8:	00004797          	auipc	a5,0x4
    800080dc:	a407a783          	lw	a5,-1472(a5) # 8000bb18 <panicked>
    800080e0:	00078463          	beqz	a5,800080e8 <uartputc+0x10>
    800080e4:	0000006f          	j	800080e4 <uartputc+0xc>
    800080e8:	fd010113          	addi	sp,sp,-48
    800080ec:	02813023          	sd	s0,32(sp)
    800080f0:	00913c23          	sd	s1,24(sp)
    800080f4:	01213823          	sd	s2,16(sp)
    800080f8:	01313423          	sd	s3,8(sp)
    800080fc:	02113423          	sd	ra,40(sp)
    80008100:	03010413          	addi	s0,sp,48
    80008104:	00004917          	auipc	s2,0x4
    80008108:	a1c90913          	addi	s2,s2,-1508 # 8000bb20 <uart_tx_r>
    8000810c:	00093783          	ld	a5,0(s2)
    80008110:	00004497          	auipc	s1,0x4
    80008114:	a1848493          	addi	s1,s1,-1512 # 8000bb28 <uart_tx_w>
    80008118:	0004b703          	ld	a4,0(s1)
    8000811c:	02078693          	addi	a3,a5,32
    80008120:	00050993          	mv	s3,a0
    80008124:	02e69c63          	bne	a3,a4,8000815c <uartputc+0x84>
    80008128:	00001097          	auipc	ra,0x1
    8000812c:	834080e7          	jalr	-1996(ra) # 8000895c <push_on>
    80008130:	00093783          	ld	a5,0(s2)
    80008134:	0004b703          	ld	a4,0(s1)
    80008138:	02078793          	addi	a5,a5,32
    8000813c:	00e79463          	bne	a5,a4,80008144 <uartputc+0x6c>
    80008140:	0000006f          	j	80008140 <uartputc+0x68>
    80008144:	00001097          	auipc	ra,0x1
    80008148:	88c080e7          	jalr	-1908(ra) # 800089d0 <pop_on>
    8000814c:	00093783          	ld	a5,0(s2)
    80008150:	0004b703          	ld	a4,0(s1)
    80008154:	02078693          	addi	a3,a5,32
    80008158:	fce688e3          	beq	a3,a4,80008128 <uartputc+0x50>
    8000815c:	01f77693          	andi	a3,a4,31
    80008160:	00005597          	auipc	a1,0x5
    80008164:	d5058593          	addi	a1,a1,-688 # 8000ceb0 <uart_tx_buf>
    80008168:	00d586b3          	add	a3,a1,a3
    8000816c:	00170713          	addi	a4,a4,1
    80008170:	01368023          	sb	s3,0(a3)
    80008174:	00e4b023          	sd	a4,0(s1)
    80008178:	10000637          	lui	a2,0x10000
    8000817c:	02f71063          	bne	a4,a5,8000819c <uartputc+0xc4>
    80008180:	0340006f          	j	800081b4 <uartputc+0xdc>
    80008184:	00074703          	lbu	a4,0(a4)
    80008188:	00f93023          	sd	a5,0(s2)
    8000818c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80008190:	00093783          	ld	a5,0(s2)
    80008194:	0004b703          	ld	a4,0(s1)
    80008198:	00f70e63          	beq	a4,a5,800081b4 <uartputc+0xdc>
    8000819c:	00564683          	lbu	a3,5(a2)
    800081a0:	01f7f713          	andi	a4,a5,31
    800081a4:	00e58733          	add	a4,a1,a4
    800081a8:	0206f693          	andi	a3,a3,32
    800081ac:	00178793          	addi	a5,a5,1
    800081b0:	fc069ae3          	bnez	a3,80008184 <uartputc+0xac>
    800081b4:	02813083          	ld	ra,40(sp)
    800081b8:	02013403          	ld	s0,32(sp)
    800081bc:	01813483          	ld	s1,24(sp)
    800081c0:	01013903          	ld	s2,16(sp)
    800081c4:	00813983          	ld	s3,8(sp)
    800081c8:	03010113          	addi	sp,sp,48
    800081cc:	00008067          	ret

00000000800081d0 <uartputc_sync>:
    800081d0:	ff010113          	addi	sp,sp,-16
    800081d4:	00813423          	sd	s0,8(sp)
    800081d8:	01010413          	addi	s0,sp,16
    800081dc:	00004717          	auipc	a4,0x4
    800081e0:	93c72703          	lw	a4,-1732(a4) # 8000bb18 <panicked>
    800081e4:	02071663          	bnez	a4,80008210 <uartputc_sync+0x40>
    800081e8:	00050793          	mv	a5,a0
    800081ec:	100006b7          	lui	a3,0x10000
    800081f0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800081f4:	02077713          	andi	a4,a4,32
    800081f8:	fe070ce3          	beqz	a4,800081f0 <uartputc_sync+0x20>
    800081fc:	0ff7f793          	andi	a5,a5,255
    80008200:	00f68023          	sb	a5,0(a3)
    80008204:	00813403          	ld	s0,8(sp)
    80008208:	01010113          	addi	sp,sp,16
    8000820c:	00008067          	ret
    80008210:	0000006f          	j	80008210 <uartputc_sync+0x40>

0000000080008214 <uartstart>:
    80008214:	ff010113          	addi	sp,sp,-16
    80008218:	00813423          	sd	s0,8(sp)
    8000821c:	01010413          	addi	s0,sp,16
    80008220:	00004617          	auipc	a2,0x4
    80008224:	90060613          	addi	a2,a2,-1792 # 8000bb20 <uart_tx_r>
    80008228:	00004517          	auipc	a0,0x4
    8000822c:	90050513          	addi	a0,a0,-1792 # 8000bb28 <uart_tx_w>
    80008230:	00063783          	ld	a5,0(a2)
    80008234:	00053703          	ld	a4,0(a0)
    80008238:	04f70263          	beq	a4,a5,8000827c <uartstart+0x68>
    8000823c:	100005b7          	lui	a1,0x10000
    80008240:	00005817          	auipc	a6,0x5
    80008244:	c7080813          	addi	a6,a6,-912 # 8000ceb0 <uart_tx_buf>
    80008248:	01c0006f          	j	80008264 <uartstart+0x50>
    8000824c:	0006c703          	lbu	a4,0(a3)
    80008250:	00f63023          	sd	a5,0(a2)
    80008254:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80008258:	00063783          	ld	a5,0(a2)
    8000825c:	00053703          	ld	a4,0(a0)
    80008260:	00f70e63          	beq	a4,a5,8000827c <uartstart+0x68>
    80008264:	01f7f713          	andi	a4,a5,31
    80008268:	00e806b3          	add	a3,a6,a4
    8000826c:	0055c703          	lbu	a4,5(a1)
    80008270:	00178793          	addi	a5,a5,1
    80008274:	02077713          	andi	a4,a4,32
    80008278:	fc071ae3          	bnez	a4,8000824c <uartstart+0x38>
    8000827c:	00813403          	ld	s0,8(sp)
    80008280:	01010113          	addi	sp,sp,16
    80008284:	00008067          	ret

0000000080008288 <uartgetc>:
    80008288:	ff010113          	addi	sp,sp,-16
    8000828c:	00813423          	sd	s0,8(sp)
    80008290:	01010413          	addi	s0,sp,16
    80008294:	10000737          	lui	a4,0x10000
    80008298:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000829c:	0017f793          	andi	a5,a5,1
    800082a0:	00078c63          	beqz	a5,800082b8 <uartgetc+0x30>
    800082a4:	00074503          	lbu	a0,0(a4)
    800082a8:	0ff57513          	andi	a0,a0,255
    800082ac:	00813403          	ld	s0,8(sp)
    800082b0:	01010113          	addi	sp,sp,16
    800082b4:	00008067          	ret
    800082b8:	fff00513          	li	a0,-1
    800082bc:	ff1ff06f          	j	800082ac <uartgetc+0x24>

00000000800082c0 <uartintr>:
    800082c0:	100007b7          	lui	a5,0x10000
    800082c4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800082c8:	0017f793          	andi	a5,a5,1
    800082cc:	0a078463          	beqz	a5,80008374 <uartintr+0xb4>
    800082d0:	fe010113          	addi	sp,sp,-32
    800082d4:	00813823          	sd	s0,16(sp)
    800082d8:	00913423          	sd	s1,8(sp)
    800082dc:	00113c23          	sd	ra,24(sp)
    800082e0:	02010413          	addi	s0,sp,32
    800082e4:	100004b7          	lui	s1,0x10000
    800082e8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800082ec:	0ff57513          	andi	a0,a0,255
    800082f0:	fffff097          	auipc	ra,0xfffff
    800082f4:	534080e7          	jalr	1332(ra) # 80007824 <consoleintr>
    800082f8:	0054c783          	lbu	a5,5(s1)
    800082fc:	0017f793          	andi	a5,a5,1
    80008300:	fe0794e3          	bnez	a5,800082e8 <uartintr+0x28>
    80008304:	00004617          	auipc	a2,0x4
    80008308:	81c60613          	addi	a2,a2,-2020 # 8000bb20 <uart_tx_r>
    8000830c:	00004517          	auipc	a0,0x4
    80008310:	81c50513          	addi	a0,a0,-2020 # 8000bb28 <uart_tx_w>
    80008314:	00063783          	ld	a5,0(a2)
    80008318:	00053703          	ld	a4,0(a0)
    8000831c:	04f70263          	beq	a4,a5,80008360 <uartintr+0xa0>
    80008320:	100005b7          	lui	a1,0x10000
    80008324:	00005817          	auipc	a6,0x5
    80008328:	b8c80813          	addi	a6,a6,-1140 # 8000ceb0 <uart_tx_buf>
    8000832c:	01c0006f          	j	80008348 <uartintr+0x88>
    80008330:	0006c703          	lbu	a4,0(a3)
    80008334:	00f63023          	sd	a5,0(a2)
    80008338:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000833c:	00063783          	ld	a5,0(a2)
    80008340:	00053703          	ld	a4,0(a0)
    80008344:	00f70e63          	beq	a4,a5,80008360 <uartintr+0xa0>
    80008348:	01f7f713          	andi	a4,a5,31
    8000834c:	00e806b3          	add	a3,a6,a4
    80008350:	0055c703          	lbu	a4,5(a1)
    80008354:	00178793          	addi	a5,a5,1
    80008358:	02077713          	andi	a4,a4,32
    8000835c:	fc071ae3          	bnez	a4,80008330 <uartintr+0x70>
    80008360:	01813083          	ld	ra,24(sp)
    80008364:	01013403          	ld	s0,16(sp)
    80008368:	00813483          	ld	s1,8(sp)
    8000836c:	02010113          	addi	sp,sp,32
    80008370:	00008067          	ret
    80008374:	00003617          	auipc	a2,0x3
    80008378:	7ac60613          	addi	a2,a2,1964 # 8000bb20 <uart_tx_r>
    8000837c:	00003517          	auipc	a0,0x3
    80008380:	7ac50513          	addi	a0,a0,1964 # 8000bb28 <uart_tx_w>
    80008384:	00063783          	ld	a5,0(a2)
    80008388:	00053703          	ld	a4,0(a0)
    8000838c:	04f70263          	beq	a4,a5,800083d0 <uartintr+0x110>
    80008390:	100005b7          	lui	a1,0x10000
    80008394:	00005817          	auipc	a6,0x5
    80008398:	b1c80813          	addi	a6,a6,-1252 # 8000ceb0 <uart_tx_buf>
    8000839c:	01c0006f          	j	800083b8 <uartintr+0xf8>
    800083a0:	0006c703          	lbu	a4,0(a3)
    800083a4:	00f63023          	sd	a5,0(a2)
    800083a8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800083ac:	00063783          	ld	a5,0(a2)
    800083b0:	00053703          	ld	a4,0(a0)
    800083b4:	02f70063          	beq	a4,a5,800083d4 <uartintr+0x114>
    800083b8:	01f7f713          	andi	a4,a5,31
    800083bc:	00e806b3          	add	a3,a6,a4
    800083c0:	0055c703          	lbu	a4,5(a1)
    800083c4:	00178793          	addi	a5,a5,1
    800083c8:	02077713          	andi	a4,a4,32
    800083cc:	fc071ae3          	bnez	a4,800083a0 <uartintr+0xe0>
    800083d0:	00008067          	ret
    800083d4:	00008067          	ret

00000000800083d8 <kinit>:
    800083d8:	fc010113          	addi	sp,sp,-64
    800083dc:	02913423          	sd	s1,40(sp)
    800083e0:	fffff7b7          	lui	a5,0xfffff
    800083e4:	00006497          	auipc	s1,0x6
    800083e8:	aeb48493          	addi	s1,s1,-1301 # 8000decf <end+0xfff>
    800083ec:	02813823          	sd	s0,48(sp)
    800083f0:	01313c23          	sd	s3,24(sp)
    800083f4:	00f4f4b3          	and	s1,s1,a5
    800083f8:	02113c23          	sd	ra,56(sp)
    800083fc:	03213023          	sd	s2,32(sp)
    80008400:	01413823          	sd	s4,16(sp)
    80008404:	01513423          	sd	s5,8(sp)
    80008408:	04010413          	addi	s0,sp,64
    8000840c:	000017b7          	lui	a5,0x1
    80008410:	01100993          	li	s3,17
    80008414:	00f487b3          	add	a5,s1,a5
    80008418:	01b99993          	slli	s3,s3,0x1b
    8000841c:	06f9e063          	bltu	s3,a5,8000847c <kinit+0xa4>
    80008420:	00005a97          	auipc	s5,0x5
    80008424:	ab0a8a93          	addi	s5,s5,-1360 # 8000ced0 <end>
    80008428:	0754ec63          	bltu	s1,s5,800084a0 <kinit+0xc8>
    8000842c:	0734fa63          	bgeu	s1,s3,800084a0 <kinit+0xc8>
    80008430:	00088a37          	lui	s4,0x88
    80008434:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80008438:	00003917          	auipc	s2,0x3
    8000843c:	6f890913          	addi	s2,s2,1784 # 8000bb30 <kmem>
    80008440:	00ca1a13          	slli	s4,s4,0xc
    80008444:	0140006f          	j	80008458 <kinit+0x80>
    80008448:	000017b7          	lui	a5,0x1
    8000844c:	00f484b3          	add	s1,s1,a5
    80008450:	0554e863          	bltu	s1,s5,800084a0 <kinit+0xc8>
    80008454:	0534f663          	bgeu	s1,s3,800084a0 <kinit+0xc8>
    80008458:	00001637          	lui	a2,0x1
    8000845c:	00100593          	li	a1,1
    80008460:	00048513          	mv	a0,s1
    80008464:	00000097          	auipc	ra,0x0
    80008468:	5e4080e7          	jalr	1508(ra) # 80008a48 <__memset>
    8000846c:	00093783          	ld	a5,0(s2)
    80008470:	00f4b023          	sd	a5,0(s1)
    80008474:	00993023          	sd	s1,0(s2)
    80008478:	fd4498e3          	bne	s1,s4,80008448 <kinit+0x70>
    8000847c:	03813083          	ld	ra,56(sp)
    80008480:	03013403          	ld	s0,48(sp)
    80008484:	02813483          	ld	s1,40(sp)
    80008488:	02013903          	ld	s2,32(sp)
    8000848c:	01813983          	ld	s3,24(sp)
    80008490:	01013a03          	ld	s4,16(sp)
    80008494:	00813a83          	ld	s5,8(sp)
    80008498:	04010113          	addi	sp,sp,64
    8000849c:	00008067          	ret
    800084a0:	00001517          	auipc	a0,0x1
    800084a4:	38050513          	addi	a0,a0,896 # 80009820 <digits+0x18>
    800084a8:	fffff097          	auipc	ra,0xfffff
    800084ac:	4b4080e7          	jalr	1204(ra) # 8000795c <panic>

00000000800084b0 <freerange>:
    800084b0:	fc010113          	addi	sp,sp,-64
    800084b4:	000017b7          	lui	a5,0x1
    800084b8:	02913423          	sd	s1,40(sp)
    800084bc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800084c0:	009504b3          	add	s1,a0,s1
    800084c4:	fffff537          	lui	a0,0xfffff
    800084c8:	02813823          	sd	s0,48(sp)
    800084cc:	02113c23          	sd	ra,56(sp)
    800084d0:	03213023          	sd	s2,32(sp)
    800084d4:	01313c23          	sd	s3,24(sp)
    800084d8:	01413823          	sd	s4,16(sp)
    800084dc:	01513423          	sd	s5,8(sp)
    800084e0:	01613023          	sd	s6,0(sp)
    800084e4:	04010413          	addi	s0,sp,64
    800084e8:	00a4f4b3          	and	s1,s1,a0
    800084ec:	00f487b3          	add	a5,s1,a5
    800084f0:	06f5e463          	bltu	a1,a5,80008558 <freerange+0xa8>
    800084f4:	00005a97          	auipc	s5,0x5
    800084f8:	9dca8a93          	addi	s5,s5,-1572 # 8000ced0 <end>
    800084fc:	0954e263          	bltu	s1,s5,80008580 <freerange+0xd0>
    80008500:	01100993          	li	s3,17
    80008504:	01b99993          	slli	s3,s3,0x1b
    80008508:	0734fc63          	bgeu	s1,s3,80008580 <freerange+0xd0>
    8000850c:	00058a13          	mv	s4,a1
    80008510:	00003917          	auipc	s2,0x3
    80008514:	62090913          	addi	s2,s2,1568 # 8000bb30 <kmem>
    80008518:	00002b37          	lui	s6,0x2
    8000851c:	0140006f          	j	80008530 <freerange+0x80>
    80008520:	000017b7          	lui	a5,0x1
    80008524:	00f484b3          	add	s1,s1,a5
    80008528:	0554ec63          	bltu	s1,s5,80008580 <freerange+0xd0>
    8000852c:	0534fa63          	bgeu	s1,s3,80008580 <freerange+0xd0>
    80008530:	00001637          	lui	a2,0x1
    80008534:	00100593          	li	a1,1
    80008538:	00048513          	mv	a0,s1
    8000853c:	00000097          	auipc	ra,0x0
    80008540:	50c080e7          	jalr	1292(ra) # 80008a48 <__memset>
    80008544:	00093703          	ld	a4,0(s2)
    80008548:	016487b3          	add	a5,s1,s6
    8000854c:	00e4b023          	sd	a4,0(s1)
    80008550:	00993023          	sd	s1,0(s2)
    80008554:	fcfa76e3          	bgeu	s4,a5,80008520 <freerange+0x70>
    80008558:	03813083          	ld	ra,56(sp)
    8000855c:	03013403          	ld	s0,48(sp)
    80008560:	02813483          	ld	s1,40(sp)
    80008564:	02013903          	ld	s2,32(sp)
    80008568:	01813983          	ld	s3,24(sp)
    8000856c:	01013a03          	ld	s4,16(sp)
    80008570:	00813a83          	ld	s5,8(sp)
    80008574:	00013b03          	ld	s6,0(sp)
    80008578:	04010113          	addi	sp,sp,64
    8000857c:	00008067          	ret
    80008580:	00001517          	auipc	a0,0x1
    80008584:	2a050513          	addi	a0,a0,672 # 80009820 <digits+0x18>
    80008588:	fffff097          	auipc	ra,0xfffff
    8000858c:	3d4080e7          	jalr	980(ra) # 8000795c <panic>

0000000080008590 <kfree>:
    80008590:	fe010113          	addi	sp,sp,-32
    80008594:	00813823          	sd	s0,16(sp)
    80008598:	00113c23          	sd	ra,24(sp)
    8000859c:	00913423          	sd	s1,8(sp)
    800085a0:	02010413          	addi	s0,sp,32
    800085a4:	03451793          	slli	a5,a0,0x34
    800085a8:	04079c63          	bnez	a5,80008600 <kfree+0x70>
    800085ac:	00005797          	auipc	a5,0x5
    800085b0:	92478793          	addi	a5,a5,-1756 # 8000ced0 <end>
    800085b4:	00050493          	mv	s1,a0
    800085b8:	04f56463          	bltu	a0,a5,80008600 <kfree+0x70>
    800085bc:	01100793          	li	a5,17
    800085c0:	01b79793          	slli	a5,a5,0x1b
    800085c4:	02f57e63          	bgeu	a0,a5,80008600 <kfree+0x70>
    800085c8:	00001637          	lui	a2,0x1
    800085cc:	00100593          	li	a1,1
    800085d0:	00000097          	auipc	ra,0x0
    800085d4:	478080e7          	jalr	1144(ra) # 80008a48 <__memset>
    800085d8:	00003797          	auipc	a5,0x3
    800085dc:	55878793          	addi	a5,a5,1368 # 8000bb30 <kmem>
    800085e0:	0007b703          	ld	a4,0(a5)
    800085e4:	01813083          	ld	ra,24(sp)
    800085e8:	01013403          	ld	s0,16(sp)
    800085ec:	00e4b023          	sd	a4,0(s1)
    800085f0:	0097b023          	sd	s1,0(a5)
    800085f4:	00813483          	ld	s1,8(sp)
    800085f8:	02010113          	addi	sp,sp,32
    800085fc:	00008067          	ret
    80008600:	00001517          	auipc	a0,0x1
    80008604:	22050513          	addi	a0,a0,544 # 80009820 <digits+0x18>
    80008608:	fffff097          	auipc	ra,0xfffff
    8000860c:	354080e7          	jalr	852(ra) # 8000795c <panic>

0000000080008610 <kalloc>:
    80008610:	fe010113          	addi	sp,sp,-32
    80008614:	00813823          	sd	s0,16(sp)
    80008618:	00913423          	sd	s1,8(sp)
    8000861c:	00113c23          	sd	ra,24(sp)
    80008620:	02010413          	addi	s0,sp,32
    80008624:	00003797          	auipc	a5,0x3
    80008628:	50c78793          	addi	a5,a5,1292 # 8000bb30 <kmem>
    8000862c:	0007b483          	ld	s1,0(a5)
    80008630:	02048063          	beqz	s1,80008650 <kalloc+0x40>
    80008634:	0004b703          	ld	a4,0(s1)
    80008638:	00001637          	lui	a2,0x1
    8000863c:	00500593          	li	a1,5
    80008640:	00048513          	mv	a0,s1
    80008644:	00e7b023          	sd	a4,0(a5)
    80008648:	00000097          	auipc	ra,0x0
    8000864c:	400080e7          	jalr	1024(ra) # 80008a48 <__memset>
    80008650:	01813083          	ld	ra,24(sp)
    80008654:	01013403          	ld	s0,16(sp)
    80008658:	00048513          	mv	a0,s1
    8000865c:	00813483          	ld	s1,8(sp)
    80008660:	02010113          	addi	sp,sp,32
    80008664:	00008067          	ret

0000000080008668 <initlock>:
    80008668:	ff010113          	addi	sp,sp,-16
    8000866c:	00813423          	sd	s0,8(sp)
    80008670:	01010413          	addi	s0,sp,16
    80008674:	00813403          	ld	s0,8(sp)
    80008678:	00b53423          	sd	a1,8(a0)
    8000867c:	00052023          	sw	zero,0(a0)
    80008680:	00053823          	sd	zero,16(a0)
    80008684:	01010113          	addi	sp,sp,16
    80008688:	00008067          	ret

000000008000868c <acquire>:
    8000868c:	fe010113          	addi	sp,sp,-32
    80008690:	00813823          	sd	s0,16(sp)
    80008694:	00913423          	sd	s1,8(sp)
    80008698:	00113c23          	sd	ra,24(sp)
    8000869c:	01213023          	sd	s2,0(sp)
    800086a0:	02010413          	addi	s0,sp,32
    800086a4:	00050493          	mv	s1,a0
    800086a8:	10002973          	csrr	s2,sstatus
    800086ac:	100027f3          	csrr	a5,sstatus
    800086b0:	ffd7f793          	andi	a5,a5,-3
    800086b4:	10079073          	csrw	sstatus,a5
    800086b8:	fffff097          	auipc	ra,0xfffff
    800086bc:	8e4080e7          	jalr	-1820(ra) # 80006f9c <mycpu>
    800086c0:	07852783          	lw	a5,120(a0)
    800086c4:	06078e63          	beqz	a5,80008740 <acquire+0xb4>
    800086c8:	fffff097          	auipc	ra,0xfffff
    800086cc:	8d4080e7          	jalr	-1836(ra) # 80006f9c <mycpu>
    800086d0:	07852783          	lw	a5,120(a0)
    800086d4:	0004a703          	lw	a4,0(s1)
    800086d8:	0017879b          	addiw	a5,a5,1
    800086dc:	06f52c23          	sw	a5,120(a0)
    800086e0:	04071063          	bnez	a4,80008720 <acquire+0x94>
    800086e4:	00100713          	li	a4,1
    800086e8:	00070793          	mv	a5,a4
    800086ec:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800086f0:	0007879b          	sext.w	a5,a5
    800086f4:	fe079ae3          	bnez	a5,800086e8 <acquire+0x5c>
    800086f8:	0ff0000f          	fence
    800086fc:	fffff097          	auipc	ra,0xfffff
    80008700:	8a0080e7          	jalr	-1888(ra) # 80006f9c <mycpu>
    80008704:	01813083          	ld	ra,24(sp)
    80008708:	01013403          	ld	s0,16(sp)
    8000870c:	00a4b823          	sd	a0,16(s1)
    80008710:	00013903          	ld	s2,0(sp)
    80008714:	00813483          	ld	s1,8(sp)
    80008718:	02010113          	addi	sp,sp,32
    8000871c:	00008067          	ret
    80008720:	0104b903          	ld	s2,16(s1)
    80008724:	fffff097          	auipc	ra,0xfffff
    80008728:	878080e7          	jalr	-1928(ra) # 80006f9c <mycpu>
    8000872c:	faa91ce3          	bne	s2,a0,800086e4 <acquire+0x58>
    80008730:	00001517          	auipc	a0,0x1
    80008734:	0f850513          	addi	a0,a0,248 # 80009828 <digits+0x20>
    80008738:	fffff097          	auipc	ra,0xfffff
    8000873c:	224080e7          	jalr	548(ra) # 8000795c <panic>
    80008740:	00195913          	srli	s2,s2,0x1
    80008744:	fffff097          	auipc	ra,0xfffff
    80008748:	858080e7          	jalr	-1960(ra) # 80006f9c <mycpu>
    8000874c:	00197913          	andi	s2,s2,1
    80008750:	07252e23          	sw	s2,124(a0)
    80008754:	f75ff06f          	j	800086c8 <acquire+0x3c>

0000000080008758 <release>:
    80008758:	fe010113          	addi	sp,sp,-32
    8000875c:	00813823          	sd	s0,16(sp)
    80008760:	00113c23          	sd	ra,24(sp)
    80008764:	00913423          	sd	s1,8(sp)
    80008768:	01213023          	sd	s2,0(sp)
    8000876c:	02010413          	addi	s0,sp,32
    80008770:	00052783          	lw	a5,0(a0)
    80008774:	00079a63          	bnez	a5,80008788 <release+0x30>
    80008778:	00001517          	auipc	a0,0x1
    8000877c:	0b850513          	addi	a0,a0,184 # 80009830 <digits+0x28>
    80008780:	fffff097          	auipc	ra,0xfffff
    80008784:	1dc080e7          	jalr	476(ra) # 8000795c <panic>
    80008788:	01053903          	ld	s2,16(a0)
    8000878c:	00050493          	mv	s1,a0
    80008790:	fffff097          	auipc	ra,0xfffff
    80008794:	80c080e7          	jalr	-2036(ra) # 80006f9c <mycpu>
    80008798:	fea910e3          	bne	s2,a0,80008778 <release+0x20>
    8000879c:	0004b823          	sd	zero,16(s1)
    800087a0:	0ff0000f          	fence
    800087a4:	0f50000f          	fence	iorw,ow
    800087a8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800087ac:	ffffe097          	auipc	ra,0xffffe
    800087b0:	7f0080e7          	jalr	2032(ra) # 80006f9c <mycpu>
    800087b4:	100027f3          	csrr	a5,sstatus
    800087b8:	0027f793          	andi	a5,a5,2
    800087bc:	04079a63          	bnez	a5,80008810 <release+0xb8>
    800087c0:	07852783          	lw	a5,120(a0)
    800087c4:	02f05e63          	blez	a5,80008800 <release+0xa8>
    800087c8:	fff7871b          	addiw	a4,a5,-1
    800087cc:	06e52c23          	sw	a4,120(a0)
    800087d0:	00071c63          	bnez	a4,800087e8 <release+0x90>
    800087d4:	07c52783          	lw	a5,124(a0)
    800087d8:	00078863          	beqz	a5,800087e8 <release+0x90>
    800087dc:	100027f3          	csrr	a5,sstatus
    800087e0:	0027e793          	ori	a5,a5,2
    800087e4:	10079073          	csrw	sstatus,a5
    800087e8:	01813083          	ld	ra,24(sp)
    800087ec:	01013403          	ld	s0,16(sp)
    800087f0:	00813483          	ld	s1,8(sp)
    800087f4:	00013903          	ld	s2,0(sp)
    800087f8:	02010113          	addi	sp,sp,32
    800087fc:	00008067          	ret
    80008800:	00001517          	auipc	a0,0x1
    80008804:	05050513          	addi	a0,a0,80 # 80009850 <digits+0x48>
    80008808:	fffff097          	auipc	ra,0xfffff
    8000880c:	154080e7          	jalr	340(ra) # 8000795c <panic>
    80008810:	00001517          	auipc	a0,0x1
    80008814:	02850513          	addi	a0,a0,40 # 80009838 <digits+0x30>
    80008818:	fffff097          	auipc	ra,0xfffff
    8000881c:	144080e7          	jalr	324(ra) # 8000795c <panic>

0000000080008820 <holding>:
    80008820:	00052783          	lw	a5,0(a0)
    80008824:	00079663          	bnez	a5,80008830 <holding+0x10>
    80008828:	00000513          	li	a0,0
    8000882c:	00008067          	ret
    80008830:	fe010113          	addi	sp,sp,-32
    80008834:	00813823          	sd	s0,16(sp)
    80008838:	00913423          	sd	s1,8(sp)
    8000883c:	00113c23          	sd	ra,24(sp)
    80008840:	02010413          	addi	s0,sp,32
    80008844:	01053483          	ld	s1,16(a0)
    80008848:	ffffe097          	auipc	ra,0xffffe
    8000884c:	754080e7          	jalr	1876(ra) # 80006f9c <mycpu>
    80008850:	01813083          	ld	ra,24(sp)
    80008854:	01013403          	ld	s0,16(sp)
    80008858:	40a48533          	sub	a0,s1,a0
    8000885c:	00153513          	seqz	a0,a0
    80008860:	00813483          	ld	s1,8(sp)
    80008864:	02010113          	addi	sp,sp,32
    80008868:	00008067          	ret

000000008000886c <push_off>:
    8000886c:	fe010113          	addi	sp,sp,-32
    80008870:	00813823          	sd	s0,16(sp)
    80008874:	00113c23          	sd	ra,24(sp)
    80008878:	00913423          	sd	s1,8(sp)
    8000887c:	02010413          	addi	s0,sp,32
    80008880:	100024f3          	csrr	s1,sstatus
    80008884:	100027f3          	csrr	a5,sstatus
    80008888:	ffd7f793          	andi	a5,a5,-3
    8000888c:	10079073          	csrw	sstatus,a5
    80008890:	ffffe097          	auipc	ra,0xffffe
    80008894:	70c080e7          	jalr	1804(ra) # 80006f9c <mycpu>
    80008898:	07852783          	lw	a5,120(a0)
    8000889c:	02078663          	beqz	a5,800088c8 <push_off+0x5c>
    800088a0:	ffffe097          	auipc	ra,0xffffe
    800088a4:	6fc080e7          	jalr	1788(ra) # 80006f9c <mycpu>
    800088a8:	07852783          	lw	a5,120(a0)
    800088ac:	01813083          	ld	ra,24(sp)
    800088b0:	01013403          	ld	s0,16(sp)
    800088b4:	0017879b          	addiw	a5,a5,1
    800088b8:	06f52c23          	sw	a5,120(a0)
    800088bc:	00813483          	ld	s1,8(sp)
    800088c0:	02010113          	addi	sp,sp,32
    800088c4:	00008067          	ret
    800088c8:	0014d493          	srli	s1,s1,0x1
    800088cc:	ffffe097          	auipc	ra,0xffffe
    800088d0:	6d0080e7          	jalr	1744(ra) # 80006f9c <mycpu>
    800088d4:	0014f493          	andi	s1,s1,1
    800088d8:	06952e23          	sw	s1,124(a0)
    800088dc:	fc5ff06f          	j	800088a0 <push_off+0x34>

00000000800088e0 <pop_off>:
    800088e0:	ff010113          	addi	sp,sp,-16
    800088e4:	00813023          	sd	s0,0(sp)
    800088e8:	00113423          	sd	ra,8(sp)
    800088ec:	01010413          	addi	s0,sp,16
    800088f0:	ffffe097          	auipc	ra,0xffffe
    800088f4:	6ac080e7          	jalr	1708(ra) # 80006f9c <mycpu>
    800088f8:	100027f3          	csrr	a5,sstatus
    800088fc:	0027f793          	andi	a5,a5,2
    80008900:	04079663          	bnez	a5,8000894c <pop_off+0x6c>
    80008904:	07852783          	lw	a5,120(a0)
    80008908:	02f05a63          	blez	a5,8000893c <pop_off+0x5c>
    8000890c:	fff7871b          	addiw	a4,a5,-1
    80008910:	06e52c23          	sw	a4,120(a0)
    80008914:	00071c63          	bnez	a4,8000892c <pop_off+0x4c>
    80008918:	07c52783          	lw	a5,124(a0)
    8000891c:	00078863          	beqz	a5,8000892c <pop_off+0x4c>
    80008920:	100027f3          	csrr	a5,sstatus
    80008924:	0027e793          	ori	a5,a5,2
    80008928:	10079073          	csrw	sstatus,a5
    8000892c:	00813083          	ld	ra,8(sp)
    80008930:	00013403          	ld	s0,0(sp)
    80008934:	01010113          	addi	sp,sp,16
    80008938:	00008067          	ret
    8000893c:	00001517          	auipc	a0,0x1
    80008940:	f1450513          	addi	a0,a0,-236 # 80009850 <digits+0x48>
    80008944:	fffff097          	auipc	ra,0xfffff
    80008948:	018080e7          	jalr	24(ra) # 8000795c <panic>
    8000894c:	00001517          	auipc	a0,0x1
    80008950:	eec50513          	addi	a0,a0,-276 # 80009838 <digits+0x30>
    80008954:	fffff097          	auipc	ra,0xfffff
    80008958:	008080e7          	jalr	8(ra) # 8000795c <panic>

000000008000895c <push_on>:
    8000895c:	fe010113          	addi	sp,sp,-32
    80008960:	00813823          	sd	s0,16(sp)
    80008964:	00113c23          	sd	ra,24(sp)
    80008968:	00913423          	sd	s1,8(sp)
    8000896c:	02010413          	addi	s0,sp,32
    80008970:	100024f3          	csrr	s1,sstatus
    80008974:	100027f3          	csrr	a5,sstatus
    80008978:	0027e793          	ori	a5,a5,2
    8000897c:	10079073          	csrw	sstatus,a5
    80008980:	ffffe097          	auipc	ra,0xffffe
    80008984:	61c080e7          	jalr	1564(ra) # 80006f9c <mycpu>
    80008988:	07852783          	lw	a5,120(a0)
    8000898c:	02078663          	beqz	a5,800089b8 <push_on+0x5c>
    80008990:	ffffe097          	auipc	ra,0xffffe
    80008994:	60c080e7          	jalr	1548(ra) # 80006f9c <mycpu>
    80008998:	07852783          	lw	a5,120(a0)
    8000899c:	01813083          	ld	ra,24(sp)
    800089a0:	01013403          	ld	s0,16(sp)
    800089a4:	0017879b          	addiw	a5,a5,1
    800089a8:	06f52c23          	sw	a5,120(a0)
    800089ac:	00813483          	ld	s1,8(sp)
    800089b0:	02010113          	addi	sp,sp,32
    800089b4:	00008067          	ret
    800089b8:	0014d493          	srli	s1,s1,0x1
    800089bc:	ffffe097          	auipc	ra,0xffffe
    800089c0:	5e0080e7          	jalr	1504(ra) # 80006f9c <mycpu>
    800089c4:	0014f493          	andi	s1,s1,1
    800089c8:	06952e23          	sw	s1,124(a0)
    800089cc:	fc5ff06f          	j	80008990 <push_on+0x34>

00000000800089d0 <pop_on>:
    800089d0:	ff010113          	addi	sp,sp,-16
    800089d4:	00813023          	sd	s0,0(sp)
    800089d8:	00113423          	sd	ra,8(sp)
    800089dc:	01010413          	addi	s0,sp,16
    800089e0:	ffffe097          	auipc	ra,0xffffe
    800089e4:	5bc080e7          	jalr	1468(ra) # 80006f9c <mycpu>
    800089e8:	100027f3          	csrr	a5,sstatus
    800089ec:	0027f793          	andi	a5,a5,2
    800089f0:	04078463          	beqz	a5,80008a38 <pop_on+0x68>
    800089f4:	07852783          	lw	a5,120(a0)
    800089f8:	02f05863          	blez	a5,80008a28 <pop_on+0x58>
    800089fc:	fff7879b          	addiw	a5,a5,-1
    80008a00:	06f52c23          	sw	a5,120(a0)
    80008a04:	07853783          	ld	a5,120(a0)
    80008a08:	00079863          	bnez	a5,80008a18 <pop_on+0x48>
    80008a0c:	100027f3          	csrr	a5,sstatus
    80008a10:	ffd7f793          	andi	a5,a5,-3
    80008a14:	10079073          	csrw	sstatus,a5
    80008a18:	00813083          	ld	ra,8(sp)
    80008a1c:	00013403          	ld	s0,0(sp)
    80008a20:	01010113          	addi	sp,sp,16
    80008a24:	00008067          	ret
    80008a28:	00001517          	auipc	a0,0x1
    80008a2c:	e5050513          	addi	a0,a0,-432 # 80009878 <digits+0x70>
    80008a30:	fffff097          	auipc	ra,0xfffff
    80008a34:	f2c080e7          	jalr	-212(ra) # 8000795c <panic>
    80008a38:	00001517          	auipc	a0,0x1
    80008a3c:	e2050513          	addi	a0,a0,-480 # 80009858 <digits+0x50>
    80008a40:	fffff097          	auipc	ra,0xfffff
    80008a44:	f1c080e7          	jalr	-228(ra) # 8000795c <panic>

0000000080008a48 <__memset>:
    80008a48:	ff010113          	addi	sp,sp,-16
    80008a4c:	00813423          	sd	s0,8(sp)
    80008a50:	01010413          	addi	s0,sp,16
    80008a54:	1a060e63          	beqz	a2,80008c10 <__memset+0x1c8>
    80008a58:	40a007b3          	neg	a5,a0
    80008a5c:	0077f793          	andi	a5,a5,7
    80008a60:	00778693          	addi	a3,a5,7
    80008a64:	00b00813          	li	a6,11
    80008a68:	0ff5f593          	andi	a1,a1,255
    80008a6c:	fff6071b          	addiw	a4,a2,-1
    80008a70:	1b06e663          	bltu	a3,a6,80008c1c <__memset+0x1d4>
    80008a74:	1cd76463          	bltu	a4,a3,80008c3c <__memset+0x1f4>
    80008a78:	1a078e63          	beqz	a5,80008c34 <__memset+0x1ec>
    80008a7c:	00b50023          	sb	a1,0(a0)
    80008a80:	00100713          	li	a4,1
    80008a84:	1ae78463          	beq	a5,a4,80008c2c <__memset+0x1e4>
    80008a88:	00b500a3          	sb	a1,1(a0)
    80008a8c:	00200713          	li	a4,2
    80008a90:	1ae78a63          	beq	a5,a4,80008c44 <__memset+0x1fc>
    80008a94:	00b50123          	sb	a1,2(a0)
    80008a98:	00300713          	li	a4,3
    80008a9c:	18e78463          	beq	a5,a4,80008c24 <__memset+0x1dc>
    80008aa0:	00b501a3          	sb	a1,3(a0)
    80008aa4:	00400713          	li	a4,4
    80008aa8:	1ae78263          	beq	a5,a4,80008c4c <__memset+0x204>
    80008aac:	00b50223          	sb	a1,4(a0)
    80008ab0:	00500713          	li	a4,5
    80008ab4:	1ae78063          	beq	a5,a4,80008c54 <__memset+0x20c>
    80008ab8:	00b502a3          	sb	a1,5(a0)
    80008abc:	00700713          	li	a4,7
    80008ac0:	18e79e63          	bne	a5,a4,80008c5c <__memset+0x214>
    80008ac4:	00b50323          	sb	a1,6(a0)
    80008ac8:	00700e93          	li	t4,7
    80008acc:	00859713          	slli	a4,a1,0x8
    80008ad0:	00e5e733          	or	a4,a1,a4
    80008ad4:	01059e13          	slli	t3,a1,0x10
    80008ad8:	01c76e33          	or	t3,a4,t3
    80008adc:	01859313          	slli	t1,a1,0x18
    80008ae0:	006e6333          	or	t1,t3,t1
    80008ae4:	02059893          	slli	a7,a1,0x20
    80008ae8:	40f60e3b          	subw	t3,a2,a5
    80008aec:	011368b3          	or	a7,t1,a7
    80008af0:	02859813          	slli	a6,a1,0x28
    80008af4:	0108e833          	or	a6,a7,a6
    80008af8:	03059693          	slli	a3,a1,0x30
    80008afc:	003e589b          	srliw	a7,t3,0x3
    80008b00:	00d866b3          	or	a3,a6,a3
    80008b04:	03859713          	slli	a4,a1,0x38
    80008b08:	00389813          	slli	a6,a7,0x3
    80008b0c:	00f507b3          	add	a5,a0,a5
    80008b10:	00e6e733          	or	a4,a3,a4
    80008b14:	000e089b          	sext.w	a7,t3
    80008b18:	00f806b3          	add	a3,a6,a5
    80008b1c:	00e7b023          	sd	a4,0(a5)
    80008b20:	00878793          	addi	a5,a5,8
    80008b24:	fed79ce3          	bne	a5,a3,80008b1c <__memset+0xd4>
    80008b28:	ff8e7793          	andi	a5,t3,-8
    80008b2c:	0007871b          	sext.w	a4,a5
    80008b30:	01d787bb          	addw	a5,a5,t4
    80008b34:	0ce88e63          	beq	a7,a4,80008c10 <__memset+0x1c8>
    80008b38:	00f50733          	add	a4,a0,a5
    80008b3c:	00b70023          	sb	a1,0(a4)
    80008b40:	0017871b          	addiw	a4,a5,1
    80008b44:	0cc77663          	bgeu	a4,a2,80008c10 <__memset+0x1c8>
    80008b48:	00e50733          	add	a4,a0,a4
    80008b4c:	00b70023          	sb	a1,0(a4)
    80008b50:	0027871b          	addiw	a4,a5,2
    80008b54:	0ac77e63          	bgeu	a4,a2,80008c10 <__memset+0x1c8>
    80008b58:	00e50733          	add	a4,a0,a4
    80008b5c:	00b70023          	sb	a1,0(a4)
    80008b60:	0037871b          	addiw	a4,a5,3
    80008b64:	0ac77663          	bgeu	a4,a2,80008c10 <__memset+0x1c8>
    80008b68:	00e50733          	add	a4,a0,a4
    80008b6c:	00b70023          	sb	a1,0(a4)
    80008b70:	0047871b          	addiw	a4,a5,4
    80008b74:	08c77e63          	bgeu	a4,a2,80008c10 <__memset+0x1c8>
    80008b78:	00e50733          	add	a4,a0,a4
    80008b7c:	00b70023          	sb	a1,0(a4)
    80008b80:	0057871b          	addiw	a4,a5,5
    80008b84:	08c77663          	bgeu	a4,a2,80008c10 <__memset+0x1c8>
    80008b88:	00e50733          	add	a4,a0,a4
    80008b8c:	00b70023          	sb	a1,0(a4)
    80008b90:	0067871b          	addiw	a4,a5,6
    80008b94:	06c77e63          	bgeu	a4,a2,80008c10 <__memset+0x1c8>
    80008b98:	00e50733          	add	a4,a0,a4
    80008b9c:	00b70023          	sb	a1,0(a4)
    80008ba0:	0077871b          	addiw	a4,a5,7
    80008ba4:	06c77663          	bgeu	a4,a2,80008c10 <__memset+0x1c8>
    80008ba8:	00e50733          	add	a4,a0,a4
    80008bac:	00b70023          	sb	a1,0(a4)
    80008bb0:	0087871b          	addiw	a4,a5,8
    80008bb4:	04c77e63          	bgeu	a4,a2,80008c10 <__memset+0x1c8>
    80008bb8:	00e50733          	add	a4,a0,a4
    80008bbc:	00b70023          	sb	a1,0(a4)
    80008bc0:	0097871b          	addiw	a4,a5,9
    80008bc4:	04c77663          	bgeu	a4,a2,80008c10 <__memset+0x1c8>
    80008bc8:	00e50733          	add	a4,a0,a4
    80008bcc:	00b70023          	sb	a1,0(a4)
    80008bd0:	00a7871b          	addiw	a4,a5,10
    80008bd4:	02c77e63          	bgeu	a4,a2,80008c10 <__memset+0x1c8>
    80008bd8:	00e50733          	add	a4,a0,a4
    80008bdc:	00b70023          	sb	a1,0(a4)
    80008be0:	00b7871b          	addiw	a4,a5,11
    80008be4:	02c77663          	bgeu	a4,a2,80008c10 <__memset+0x1c8>
    80008be8:	00e50733          	add	a4,a0,a4
    80008bec:	00b70023          	sb	a1,0(a4)
    80008bf0:	00c7871b          	addiw	a4,a5,12
    80008bf4:	00c77e63          	bgeu	a4,a2,80008c10 <__memset+0x1c8>
    80008bf8:	00e50733          	add	a4,a0,a4
    80008bfc:	00b70023          	sb	a1,0(a4)
    80008c00:	00d7879b          	addiw	a5,a5,13
    80008c04:	00c7f663          	bgeu	a5,a2,80008c10 <__memset+0x1c8>
    80008c08:	00f507b3          	add	a5,a0,a5
    80008c0c:	00b78023          	sb	a1,0(a5)
    80008c10:	00813403          	ld	s0,8(sp)
    80008c14:	01010113          	addi	sp,sp,16
    80008c18:	00008067          	ret
    80008c1c:	00b00693          	li	a3,11
    80008c20:	e55ff06f          	j	80008a74 <__memset+0x2c>
    80008c24:	00300e93          	li	t4,3
    80008c28:	ea5ff06f          	j	80008acc <__memset+0x84>
    80008c2c:	00100e93          	li	t4,1
    80008c30:	e9dff06f          	j	80008acc <__memset+0x84>
    80008c34:	00000e93          	li	t4,0
    80008c38:	e95ff06f          	j	80008acc <__memset+0x84>
    80008c3c:	00000793          	li	a5,0
    80008c40:	ef9ff06f          	j	80008b38 <__memset+0xf0>
    80008c44:	00200e93          	li	t4,2
    80008c48:	e85ff06f          	j	80008acc <__memset+0x84>
    80008c4c:	00400e93          	li	t4,4
    80008c50:	e7dff06f          	j	80008acc <__memset+0x84>
    80008c54:	00500e93          	li	t4,5
    80008c58:	e75ff06f          	j	80008acc <__memset+0x84>
    80008c5c:	00600e93          	li	t4,6
    80008c60:	e6dff06f          	j	80008acc <__memset+0x84>

0000000080008c64 <__memmove>:
    80008c64:	ff010113          	addi	sp,sp,-16
    80008c68:	00813423          	sd	s0,8(sp)
    80008c6c:	01010413          	addi	s0,sp,16
    80008c70:	0e060863          	beqz	a2,80008d60 <__memmove+0xfc>
    80008c74:	fff6069b          	addiw	a3,a2,-1
    80008c78:	0006881b          	sext.w	a6,a3
    80008c7c:	0ea5e863          	bltu	a1,a0,80008d6c <__memmove+0x108>
    80008c80:	00758713          	addi	a4,a1,7
    80008c84:	00a5e7b3          	or	a5,a1,a0
    80008c88:	40a70733          	sub	a4,a4,a0
    80008c8c:	0077f793          	andi	a5,a5,7
    80008c90:	00f73713          	sltiu	a4,a4,15
    80008c94:	00174713          	xori	a4,a4,1
    80008c98:	0017b793          	seqz	a5,a5
    80008c9c:	00e7f7b3          	and	a5,a5,a4
    80008ca0:	10078863          	beqz	a5,80008db0 <__memmove+0x14c>
    80008ca4:	00900793          	li	a5,9
    80008ca8:	1107f463          	bgeu	a5,a6,80008db0 <__memmove+0x14c>
    80008cac:	0036581b          	srliw	a6,a2,0x3
    80008cb0:	fff8081b          	addiw	a6,a6,-1
    80008cb4:	02081813          	slli	a6,a6,0x20
    80008cb8:	01d85893          	srli	a7,a6,0x1d
    80008cbc:	00858813          	addi	a6,a1,8
    80008cc0:	00058793          	mv	a5,a1
    80008cc4:	00050713          	mv	a4,a0
    80008cc8:	01088833          	add	a6,a7,a6
    80008ccc:	0007b883          	ld	a7,0(a5)
    80008cd0:	00878793          	addi	a5,a5,8
    80008cd4:	00870713          	addi	a4,a4,8
    80008cd8:	ff173c23          	sd	a7,-8(a4)
    80008cdc:	ff0798e3          	bne	a5,a6,80008ccc <__memmove+0x68>
    80008ce0:	ff867713          	andi	a4,a2,-8
    80008ce4:	02071793          	slli	a5,a4,0x20
    80008ce8:	0207d793          	srli	a5,a5,0x20
    80008cec:	00f585b3          	add	a1,a1,a5
    80008cf0:	40e686bb          	subw	a3,a3,a4
    80008cf4:	00f507b3          	add	a5,a0,a5
    80008cf8:	06e60463          	beq	a2,a4,80008d60 <__memmove+0xfc>
    80008cfc:	0005c703          	lbu	a4,0(a1)
    80008d00:	00e78023          	sb	a4,0(a5)
    80008d04:	04068e63          	beqz	a3,80008d60 <__memmove+0xfc>
    80008d08:	0015c603          	lbu	a2,1(a1)
    80008d0c:	00100713          	li	a4,1
    80008d10:	00c780a3          	sb	a2,1(a5)
    80008d14:	04e68663          	beq	a3,a4,80008d60 <__memmove+0xfc>
    80008d18:	0025c603          	lbu	a2,2(a1)
    80008d1c:	00200713          	li	a4,2
    80008d20:	00c78123          	sb	a2,2(a5)
    80008d24:	02e68e63          	beq	a3,a4,80008d60 <__memmove+0xfc>
    80008d28:	0035c603          	lbu	a2,3(a1)
    80008d2c:	00300713          	li	a4,3
    80008d30:	00c781a3          	sb	a2,3(a5)
    80008d34:	02e68663          	beq	a3,a4,80008d60 <__memmove+0xfc>
    80008d38:	0045c603          	lbu	a2,4(a1)
    80008d3c:	00400713          	li	a4,4
    80008d40:	00c78223          	sb	a2,4(a5)
    80008d44:	00e68e63          	beq	a3,a4,80008d60 <__memmove+0xfc>
    80008d48:	0055c603          	lbu	a2,5(a1)
    80008d4c:	00500713          	li	a4,5
    80008d50:	00c782a3          	sb	a2,5(a5)
    80008d54:	00e68663          	beq	a3,a4,80008d60 <__memmove+0xfc>
    80008d58:	0065c703          	lbu	a4,6(a1)
    80008d5c:	00e78323          	sb	a4,6(a5)
    80008d60:	00813403          	ld	s0,8(sp)
    80008d64:	01010113          	addi	sp,sp,16
    80008d68:	00008067          	ret
    80008d6c:	02061713          	slli	a4,a2,0x20
    80008d70:	02075713          	srli	a4,a4,0x20
    80008d74:	00e587b3          	add	a5,a1,a4
    80008d78:	f0f574e3          	bgeu	a0,a5,80008c80 <__memmove+0x1c>
    80008d7c:	02069613          	slli	a2,a3,0x20
    80008d80:	02065613          	srli	a2,a2,0x20
    80008d84:	fff64613          	not	a2,a2
    80008d88:	00e50733          	add	a4,a0,a4
    80008d8c:	00c78633          	add	a2,a5,a2
    80008d90:	fff7c683          	lbu	a3,-1(a5)
    80008d94:	fff78793          	addi	a5,a5,-1
    80008d98:	fff70713          	addi	a4,a4,-1
    80008d9c:	00d70023          	sb	a3,0(a4)
    80008da0:	fec798e3          	bne	a5,a2,80008d90 <__memmove+0x12c>
    80008da4:	00813403          	ld	s0,8(sp)
    80008da8:	01010113          	addi	sp,sp,16
    80008dac:	00008067          	ret
    80008db0:	02069713          	slli	a4,a3,0x20
    80008db4:	02075713          	srli	a4,a4,0x20
    80008db8:	00170713          	addi	a4,a4,1
    80008dbc:	00e50733          	add	a4,a0,a4
    80008dc0:	00050793          	mv	a5,a0
    80008dc4:	0005c683          	lbu	a3,0(a1)
    80008dc8:	00178793          	addi	a5,a5,1
    80008dcc:	00158593          	addi	a1,a1,1
    80008dd0:	fed78fa3          	sb	a3,-1(a5)
    80008dd4:	fee798e3          	bne	a5,a4,80008dc4 <__memmove+0x160>
    80008dd8:	f89ff06f          	j	80008d60 <__memmove+0xfc>
	...
