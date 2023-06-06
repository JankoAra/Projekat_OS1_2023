
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000c117          	auipc	sp,0xc
    80000004:	9d013103          	ld	sp,-1584(sp) # 8000b9d0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	0bd060ef          	jal	ra,800068d8 <start>

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
    80001670:	3c47b783          	ld	a5,964(a5) # 8000ba30 <_ZN9Scheduler4tailE>
    80001674:	00078e63          	beqz	a5,80001690 <_ZN9Scheduler3putEP3TCB+0x30>
		head = tail = tcb;
	} else {
		tail->nextInScheduler = tcb;
    80001678:	02a7bc23          	sd	a0,56(a5)
		tail = tcb;
    8000167c:	0000a797          	auipc	a5,0xa
    80001680:	3aa7ba23          	sd	a0,948(a5) # 8000ba30 <_ZN9Scheduler4tailE>
	}
}
    80001684:	00813403          	ld	s0,8(sp)
    80001688:	01010113          	addi	sp,sp,16
    8000168c:	00008067          	ret
		head = tail = tcb;
    80001690:	0000a797          	auipc	a5,0xa
    80001694:	3a078793          	addi	a5,a5,928 # 8000ba30 <_ZN9Scheduler4tailE>
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
    800016b4:	38070713          	addi	a4,a4,896 # 8000ba30 <_ZN9Scheduler4tailE>
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
    800016f4:	35083803          	ld	a6,848(a6) # 8000ba40 <_ZN9Scheduler12sleepingHeadE>
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
    8000172c:	30a7bc23          	sd	a0,792(a5) # 8000ba40 <_ZN9Scheduler12sleepingHeadE>
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
    80001774:	2ca7b823          	sd	a0,720(a5) # 8000ba40 <_ZN9Scheduler12sleepingHeadE>
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
    80001790:	2b47b783          	ld	a5,692(a5) # 8000ba40 <_ZN9Scheduler12sleepingHeadE>
    80001794:	06078a63          	beqz	a5,80001808 <_ZN9Scheduler4wakeEv+0x7c>
	sleepingHead->timeToSleep--;
    80001798:	0407b703          	ld	a4,64(a5)
    8000179c:	fff70713          	addi	a4,a4,-1
    800017a0:	04e7b023          	sd	a4,64(a5)
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    800017a4:	0000a517          	auipc	a0,0xa
    800017a8:	29c53503          	ld	a0,668(a0) # 8000ba40 <_ZN9Scheduler12sleepingHeadE>
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
    800017dc:	26f73423          	sd	a5,616(a4) # 8000ba40 <_ZN9Scheduler12sleepingHeadE>
		thread->nextSleeping = nullptr;
    800017e0:	04053423          	sd	zero,72(a0)
		Scheduler::put(thread);
    800017e4:	00000097          	auipc	ra,0x0
    800017e8:	e7c080e7          	jalr	-388(ra) # 80001660 <_ZN9Scheduler3putEP3TCB>
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    800017ec:	0000a517          	auipc	a0,0xa
    800017f0:	25453503          	ld	a0,596(a0) # 8000ba40 <_ZN9Scheduler12sleepingHeadE>
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
    80001828:	1c47b783          	ld	a5,452(a5) # 8000b9e8 <_GLOBAL_OFFSET_TABLE_+0x40>
    8000182c:	00078513          	mv	a0,a5
    80001830:	00000097          	auipc	ra,0x0
    80001834:	108080e7          	jalr	264(ra) # 80001938 <_ZN5Riscv7w_stvecEm>

	//sem_open(&semA, 0);
	semA = new Semaphore(1);
    80001838:	01000513          	li	a0,16
    8000183c:	00001097          	auipc	ra,0x1
    80001840:	98c080e7          	jalr	-1652(ra) # 800021c8 <_Znwm>
    80001844:	00050793          	mv	a5,a0
    80001848:	00078493          	mv	s1,a5
    8000184c:	00100593          	li	a1,1
    80001850:	00048513          	mv	a0,s1
    80001854:	00001097          	auipc	ra,0x1
    80001858:	c68080e7          	jalr	-920(ra) # 800024bc <_ZN9SemaphoreC1Ej>
    8000185c:	0000a797          	auipc	a5,0xa
    80001860:	1ec78793          	addi	a5,a5,492 # 8000ba48 <semA>
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
    80001888:	1547b783          	ld	a5,340(a5) # 8000b9d8 <_GLOBAL_OFFSET_TABLE_+0x30>
    8000188c:	00e7b023          	sd	a4,0(a5)
	thread_create(&userHandle, (TCB::Body)userMain, nullptr);
    80001890:	fd040793          	addi	a5,s0,-48
    80001894:	00000613          	li	a2,0
    80001898:	0000a597          	auipc	a1,0xa
    8000189c:	1185b583          	ld	a1,280(a1) # 8000b9b0 <_GLOBAL_OFFSET_TABLE_+0x8>
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
    800018f8:	924080e7          	jalr	-1756(ra) # 80002218 <_ZdlPv>
    800018fc:	00090793          	mv	a5,s2
    80001900:	00078513          	mv	a0,a5
    80001904:	0000b097          	auipc	ra,0xb
    80001908:	294080e7          	jalr	660(ra) # 8000cb98 <_Unwind_Resume>
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
    80001ad8:	edc080e7          	jalr	-292(ra) # 800029b0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
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
    80001af4:	06c080e7          	jalr	108(ra) # 80002b5c <_ZN15MemoryAllocator5kfreeEPv>
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
    80001b30:	cb0080e7          	jalr	-848(ra) # 800027dc <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80001b34:	00050713          	mv	a4,a0
    80001b38:	f0043783          	ld	a5,-256(s0)
    80001b3c:	00e7b023          	sd	a4,0(a5)
				TCB::start(*handle);
    80001b40:	f0043783          	ld	a5,-256(s0)
    80001b44:	0007b783          	ld	a5,0(a5)
    80001b48:	00078513          	mv	a0,a5
    80001b4c:	00001097          	auipc	ra,0x1
    80001b50:	e10080e7          	jalr	-496(ra) # 8000295c <_ZN3TCB5startEPS_>
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
    80001b78:	e647b783          	ld	a5,-412(a5) # 8000b9d8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001b7c:	0007b783          	ld	a5,0(a5)
    80001b80:	00100593          	li	a1,1
    80001b84:	00078513          	mv	a0,a5
    80001b88:	00000097          	auipc	ra,0x0
    80001b8c:	528080e7          	jalr	1320(ra) # 800020b0 <_ZN3TCB11setFinishedEb>
				TCB::releaseJoined();
    80001b90:	00001097          	auipc	ra,0x1
    80001b94:	d70080e7          	jalr	-656(ra) # 80002900 <_ZN3TCB13releaseJoinedEv>
				TCB::yield();
    80001b98:	00001097          	auipc	ra,0x1
    80001b9c:	bdc080e7          	jalr	-1060(ra) # 80002774 <_ZN3TCB5yieldEv>
				break;
    80001ba0:	3680006f          	j	80001f08 <interruptRoutine+0x57c>
			case 0x13:
				//thread_dispatch
				TCB::yield();
    80001ba4:	00001097          	auipc	ra,0x1
    80001ba8:	bd0080e7          	jalr	-1072(ra) # 80002774 <_ZN3TCB5yieldEv>
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
    80001bc0:	cfc080e7          	jalr	-772(ra) # 800028b8 <_ZN3TCB10threadJoinEPS_>
				TCB::yield();
    80001bc4:	00001097          	auipc	ra,0x1
    80001bc8:	bb0080e7          	jalr	-1104(ra) # 80002774 <_ZN3TCB5yieldEv>
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
    80001bec:	110080e7          	jalr	272(ra) # 80002cf8 <_ZN4KSem7initSemEj>
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
    80001c2c:	298080e7          	jalr	664(ra) # 80002ec0 <_ZN4KSem8closeSemEPS_>
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
    80001c48:	148080e7          	jalr	328(ra) # 80002d8c <_ZN4KSem4waitEv>
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
    80001c64:	1e4080e7          	jalr	484(ra) # 80002e44 <_ZN4KSem6signalEv>
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
    80001c9c:	d407b783          	ld	a5,-704(a5) # 8000b9d8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001ca0:	0007b783          	ld	a5,0(a5)
    80001ca4:	f3843583          	ld	a1,-200(s0)
    80001ca8:	00078513          	mv	a0,a5
    80001cac:	00000097          	auipc	ra,0x0
    80001cb0:	a38080e7          	jalr	-1480(ra) # 800016e4 <_ZN9Scheduler10putToSleepEP3TCBm>
					TCB::yield();
    80001cb4:	00001097          	auipc	ra,0x1
    80001cb8:	ac0080e7          	jalr	-1344(ra) # 80002774 <_ZN3TCB5yieldEv>
				}
				break;
    80001cbc:	2380006f          	j	80001ef4 <interruptRoutine+0x568>
			case 0x41:
				//getc
				__getc();
    80001cc0:	00007097          	auipc	ra,0x7
    80001cc4:	d18080e7          	jalr	-744(ra) # 800089d8 <__getc>
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
    80001ce4:	cbc080e7          	jalr	-836(ra) # 8000899c <__putc>
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
    80001d1c:	ac4080e7          	jalr	-1340(ra) # 800027dc <_ZN3TCB12createThreadEPFvPvES0_Pm>
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
    80001d88:	c18080e7          	jalr	-1000(ra) # 8000899c <__putc>
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
    80001dd4:	9a868693          	addi	a3,a3,-1624 # 8000b778 <_ZZ16interruptRoutineE6digits>
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
    80001e7c:	b24080e7          	jalr	-1244(ra) # 8000899c <__putc>
				while (--i >= 0) {
    80001e80:	fc5ff06f          	j	80001e44 <interruptRoutine+0x4b8>
				}
				break;
			default:
				printString("\nNepostojeci op code: ");
    80001e84:	00007517          	auipc	a0,0x7
    80001e88:	19c50513          	addi	a0,a0,412 # 80009020 <CONSOLE_STATUS+0x10>
    80001e8c:	00003097          	auipc	ra,0x3
    80001e90:	7fc080e7          	jalr	2044(ra) # 80005688 <_Z11printStringPKc>
				printInteger(opCode);
    80001e94:	f8043783          	ld	a5,-128(s0)
    80001e98:	0007879b          	sext.w	a5,a5
    80001e9c:	00078513          	mv	a0,a5
    80001ea0:	00001097          	auipc	ra,0x1
    80001ea4:	090080e7          	jalr	144(ra) # 80002f30 <_Z12printIntegeri>
				printString("\nscause: ");
    80001ea8:	00007517          	auipc	a0,0x7
    80001eac:	19050513          	addi	a0,a0,400 # 80009038 <CONSOLE_STATUS+0x28>
    80001eb0:	00003097          	auipc	ra,0x3
    80001eb4:	7d8080e7          	jalr	2008(ra) # 80005688 <_Z11printStringPKc>
				printInteger(scause);
    80001eb8:	fd843783          	ld	a5,-40(s0)
    80001ebc:	0007879b          	sext.w	a5,a5
    80001ec0:	00078513          	mv	a0,a5
    80001ec4:	00001097          	auipc	ra,0x1
    80001ec8:	06c080e7          	jalr	108(ra) # 80002f30 <_Z12printIntegeri>
				printString("\nsepc: ");
    80001ecc:	00007517          	auipc	a0,0x7
    80001ed0:	17c50513          	addi	a0,a0,380 # 80009048 <CONSOLE_STATUS+0x38>
    80001ed4:	00003097          	auipc	ra,0x3
    80001ed8:	7b4080e7          	jalr	1972(ra) # 80005688 <_Z11printStringPKc>
				printInteger(sepc);
    80001edc:	fd043783          	ld	a5,-48(s0)
    80001ee0:	0007879b          	sext.w	a5,a5
    80001ee4:	00078513          	mv	a0,a5
    80001ee8:	00001097          	auipc	ra,0x1
    80001eec:	048080e7          	jalr	72(ra) # 80002f30 <_Z12printIntegeri>
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
    80001f3c:	ad8080e7          	jalr	-1320(ra) # 80008a10 <console_handler>
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
    80001f64:	a607b783          	ld	a5,-1440(a5) # 8000b9c0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001f68:	0007b783          	ld	a5,0(a5)
    80001f6c:	00178713          	addi	a4,a5,1
    80001f70:	0000a797          	auipc	a5,0xa
    80001f74:	a507b783          	ld	a5,-1456(a5) # 8000b9c0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001f78:	00e7b023          	sd	a4,0(a5)
		if (TCB::runningTimeSlice >= TCB::running->getTimeSlice()) {
    80001f7c:	0000a797          	auipc	a5,0xa
    80001f80:	a5c7b783          	ld	a5,-1444(a5) # 8000b9d8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001f84:	0007b783          	ld	a5,0(a5)
    80001f88:	00078513          	mv	a0,a5
    80001f8c:	00000097          	auipc	ra,0x0
    80001f90:	140080e7          	jalr	320(ra) # 800020cc <_ZN3TCB12getTimeSliceEv>
    80001f94:	00050713          	mv	a4,a0
    80001f98:	0000a797          	auipc	a5,0xa
    80001f9c:	a287b783          	ld	a5,-1496(a5) # 8000b9c0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001fa0:	0007b783          	ld	a5,0(a5)
    80001fa4:	00e7b7b3          	sltu	a5,a5,a4
    80001fa8:	0017c793          	xori	a5,a5,1
    80001fac:	0ff7f793          	andi	a5,a5,255
    80001fb0:	00078c63          	beqz	a5,80001fc8 <interruptRoutine+0x63c>
			TCB::yield();
    80001fb4:	00000097          	auipc	ra,0x0
    80001fb8:	7c0080e7          	jalr	1984(ra) # 80002774 <_ZN3TCB5yieldEv>
			TCB::runningTimeSlice = 0;
    80001fbc:	0000a797          	auipc	a5,0xa
    80001fc0:	a047b783          	ld	a5,-1532(a5) # 8000b9c0 <_GLOBAL_OFFSET_TABLE_+0x18>
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
    80001ffc:	690080e7          	jalr	1680(ra) # 80005688 <_Z11printStringPKc>
		printString("scause: ");
    80002000:	00007517          	auipc	a0,0x7
    80002004:	07050513          	addi	a0,a0,112 # 80009070 <CONSOLE_STATUS+0x60>
    80002008:	00003097          	auipc	ra,0x3
    8000200c:	680080e7          	jalr	1664(ra) # 80005688 <_Z11printStringPKc>
		printInteger(scause);
    80002010:	fd843783          	ld	a5,-40(s0)
    80002014:	0007879b          	sext.w	a5,a5
    80002018:	00078513          	mv	a0,a5
    8000201c:	00001097          	auipc	ra,0x1
    80002020:	f14080e7          	jalr	-236(ra) # 80002f30 <_Z12printIntegeri>
		printString("\nsepc: ");
    80002024:	00007517          	auipc	a0,0x7
    80002028:	02450513          	addi	a0,a0,36 # 80009048 <CONSOLE_STATUS+0x38>
    8000202c:	00003097          	auipc	ra,0x3
    80002030:	65c080e7          	jalr	1628(ra) # 80005688 <_Z11printStringPKc>
		printInteger(sepc);
    80002034:	fd043783          	ld	a5,-48(s0)
    80002038:	0007879b          	sext.w	a5,a5
    8000203c:	00078513          	mv	a0,a5
    80002040:	00001097          	auipc	ra,0x1
    80002044:	ef0080e7          	jalr	-272(ra) # 80002f30 <_Z12printIntegeri>
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

00000000800020e8 <_ZN6Thread7wrapperEPv>:

	__asm__ volatile("ecall");
}

void Thread::wrapper(void* thread) {
	if(thread!=nullptr){
    800020e8:	02050863          	beqz	a0,80002118 <_ZN6Thread7wrapperEPv+0x30>
void Thread::wrapper(void* thread) {
    800020ec:	ff010113          	addi	sp,sp,-16
    800020f0:	00113423          	sd	ra,8(sp)
    800020f4:	00813023          	sd	s0,0(sp)
    800020f8:	01010413          	addi	s0,sp,16
		((Thread*)thread)->run();
    800020fc:	00053783          	ld	a5,0(a0)
    80002100:	0107b783          	ld	a5,16(a5)
    80002104:	000780e7          	jalr	a5
	}
}
    80002108:	00813083          	ld	ra,8(sp)
    8000210c:	00013403          	ld	s0,0(sp)
    80002110:	01010113          	addi	sp,sp,16
    80002114:	00008067          	ret
    80002118:	00008067          	ret

000000008000211c <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    8000211c:	ff010113          	addi	sp,sp,-16
    80002120:	00113423          	sd	ra,8(sp)
    80002124:	00813023          	sd	s0,0(sp)
    80002128:	01010413          	addi	s0,sp,16
    8000212c:	00009797          	auipc	a5,0x9
    80002130:	69c78793          	addi	a5,a5,1692 # 8000b7c8 <_ZTV6Thread+0x10>
    80002134:	00f53023          	sd	a5,0(a0)
	thread_exit();
    80002138:	fffff097          	auipc	ra,0xfffff
    8000213c:	2c8080e7          	jalr	712(ra) # 80001400 <_Z11thread_exitv>
}
    80002140:	00813083          	ld	ra,8(sp)
    80002144:	00013403          	ld	s0,0(sp)
    80002148:	01010113          	addi	sp,sp,16
    8000214c:	00008067          	ret

0000000080002150 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
	sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    80002150:	fe010113          	addi	sp,sp,-32
    80002154:	00113c23          	sd	ra,24(sp)
    80002158:	00813823          	sd	s0,16(sp)
    8000215c:	00913423          	sd	s1,8(sp)
    80002160:	02010413          	addi	s0,sp,32
    80002164:	00050493          	mv	s1,a0
    80002168:	00009797          	auipc	a5,0x9
    8000216c:	68878793          	addi	a5,a5,1672 # 8000b7f0 <_ZTV9Semaphore+0x10>
    80002170:	00f53023          	sd	a5,0(a0)
	sem_close(myHandle);
    80002174:	00853503          	ld	a0,8(a0)
    80002178:	fffff097          	auipc	ra,0xfffff
    8000217c:	360080e7          	jalr	864(ra) # 800014d8 <_Z9sem_closeP4KSem>
	delete myHandle;
    80002180:	0084b483          	ld	s1,8(s1)
    80002184:	02048863          	beqz	s1,800021b4 <_ZN9SemaphoreD1Ev+0x64>
			delete node;
		}
	}

	bool isEmpty() const {
		return front == nullptr;
    80002188:	0084b503          	ld	a0,8(s1)
		while (!isEmpty()) {
    8000218c:	00050e63          	beqz	a0,800021a8 <_ZN9SemaphoreD1Ev+0x58>
			front = front->next;
    80002190:	00853783          	ld	a5,8(a0)
    80002194:	00f4b423          	sd	a5,8(s1)
			delete node;
    80002198:	fe0508e3          	beqz	a0,80002188 <_ZN9SemaphoreD1Ev+0x38>
			mem_free(ptr);
    8000219c:	fffff097          	auipc	ra,0xfffff
    800021a0:	1b4080e7          	jalr	436(ra) # 80001350 <_Z8mem_freePv>
		}
    800021a4:	fe5ff06f          	j	80002188 <_ZN9SemaphoreD1Ev+0x38>
    800021a8:	00048513          	mv	a0,s1
    800021ac:	00001097          	auipc	ra,0x1
    800021b0:	b24080e7          	jalr	-1244(ra) # 80002cd0 <_ZN4KSemdlEPv>
}
    800021b4:	01813083          	ld	ra,24(sp)
    800021b8:	01013403          	ld	s0,16(sp)
    800021bc:	00813483          	ld	s1,8(sp)
    800021c0:	02010113          	addi	sp,sp,32
    800021c4:	00008067          	ret

00000000800021c8 <_Znwm>:
void* operator new(size_t size) {
    800021c8:	ff010113          	addi	sp,sp,-16
    800021cc:	00113423          	sd	ra,8(sp)
    800021d0:	00813023          	sd	s0,0(sp)
    800021d4:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    800021d8:	fffff097          	auipc	ra,0xfffff
    800021dc:	138080e7          	jalr	312(ra) # 80001310 <_Z9mem_allocm>
}
    800021e0:	00813083          	ld	ra,8(sp)
    800021e4:	00013403          	ld	s0,0(sp)
    800021e8:	01010113          	addi	sp,sp,16
    800021ec:	00008067          	ret

00000000800021f0 <_Znam>:
void* operator new[](size_t size) {
    800021f0:	ff010113          	addi	sp,sp,-16
    800021f4:	00113423          	sd	ra,8(sp)
    800021f8:	00813023          	sd	s0,0(sp)
    800021fc:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    80002200:	fffff097          	auipc	ra,0xfffff
    80002204:	110080e7          	jalr	272(ra) # 80001310 <_Z9mem_allocm>
}
    80002208:	00813083          	ld	ra,8(sp)
    8000220c:	00013403          	ld	s0,0(sp)
    80002210:	01010113          	addi	sp,sp,16
    80002214:	00008067          	ret

0000000080002218 <_ZdlPv>:
noexcept {
    80002218:	ff010113          	addi	sp,sp,-16
    8000221c:	00113423          	sd	ra,8(sp)
    80002220:	00813023          	sd	s0,0(sp)
    80002224:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80002228:	fffff097          	auipc	ra,0xfffff
    8000222c:	128080e7          	jalr	296(ra) # 80001350 <_Z8mem_freePv>
}
    80002230:	00813083          	ld	ra,8(sp)
    80002234:	00013403          	ld	s0,0(sp)
    80002238:	01010113          	addi	sp,sp,16
    8000223c:	00008067          	ret

0000000080002240 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80002240:	fe010113          	addi	sp,sp,-32
    80002244:	00113c23          	sd	ra,24(sp)
    80002248:	00813823          	sd	s0,16(sp)
    8000224c:	00913423          	sd	s1,8(sp)
    80002250:	02010413          	addi	s0,sp,32
    80002254:	00050493          	mv	s1,a0
}
    80002258:	00000097          	auipc	ra,0x0
    8000225c:	ec4080e7          	jalr	-316(ra) # 8000211c <_ZN6ThreadD1Ev>
    80002260:	00048513          	mv	a0,s1
    80002264:	00000097          	auipc	ra,0x0
    80002268:	fb4080e7          	jalr	-76(ra) # 80002218 <_ZdlPv>
    8000226c:	01813083          	ld	ra,24(sp)
    80002270:	01013403          	ld	s0,16(sp)
    80002274:	00813483          	ld	s1,8(sp)
    80002278:	02010113          	addi	sp,sp,32
    8000227c:	00008067          	ret

0000000080002280 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80002280:	fe010113          	addi	sp,sp,-32
    80002284:	00113c23          	sd	ra,24(sp)
    80002288:	00813823          	sd	s0,16(sp)
    8000228c:	00913423          	sd	s1,8(sp)
    80002290:	02010413          	addi	s0,sp,32
    80002294:	00050493          	mv	s1,a0
}
    80002298:	00000097          	auipc	ra,0x0
    8000229c:	eb8080e7          	jalr	-328(ra) # 80002150 <_ZN9SemaphoreD1Ev>
    800022a0:	00048513          	mv	a0,s1
    800022a4:	00000097          	auipc	ra,0x0
    800022a8:	f74080e7          	jalr	-140(ra) # 80002218 <_ZdlPv>
    800022ac:	01813083          	ld	ra,24(sp)
    800022b0:	01013403          	ld	s0,16(sp)
    800022b4:	00813483          	ld	s1,8(sp)
    800022b8:	02010113          	addi	sp,sp,32
    800022bc:	00008067          	ret

00000000800022c0 <_ZdaPv>:
noexcept {
    800022c0:	ff010113          	addi	sp,sp,-16
    800022c4:	00113423          	sd	ra,8(sp)
    800022c8:	00813023          	sd	s0,0(sp)
    800022cc:	01010413          	addi	s0,sp,16
mem_free(ptr);
    800022d0:	fffff097          	auipc	ra,0xfffff
    800022d4:	080080e7          	jalr	128(ra) # 80001350 <_Z8mem_freePv>
}
    800022d8:	00813083          	ld	ra,8(sp)
    800022dc:	00013403          	ld	s0,0(sp)
    800022e0:	01010113          	addi	sp,sp,16
    800022e4:	00008067          	ret

00000000800022e8 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (* body)(void*), void* arg) {
    800022e8:	fd010113          	addi	sp,sp,-48
    800022ec:	02113423          	sd	ra,40(sp)
    800022f0:	02813023          	sd	s0,32(sp)
    800022f4:	00913c23          	sd	s1,24(sp)
    800022f8:	01213823          	sd	s2,16(sp)
    800022fc:	01313423          	sd	s3,8(sp)
    80002300:	03010413          	addi	s0,sp,48
    80002304:	00050493          	mv	s1,a0
    80002308:	00058913          	mv	s2,a1
    8000230c:	00060993          	mv	s3,a2
    80002310:	00009797          	auipc	a5,0x9
    80002314:	4b878793          	addi	a5,a5,1208 # 8000b7c8 <_ZTV6Thread+0x10>
    80002318:	00f53023          	sd	a5,0(a0)
	this->body = body;
    8000231c:	00b53823          	sd	a1,16(a0)
	this->arg = arg;
    80002320:	00c53c23          	sd	a2,24(a0)
	if (body != nullptr) {
    80002324:	04058663          	beqz	a1,80002370 <_ZN6ThreadC1EPFvPvES0_+0x88>
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    80002328:	00001537          	lui	a0,0x1
    8000232c:	fffff097          	auipc	ra,0xfffff
    80002330:	fe4080e7          	jalr	-28(ra) # 80001310 <_Z9mem_allocm>
    80002334:	00050313          	mv	t1,a0
	__asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002338:	00030713          	mv	a4,t1
	__asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000233c:	00098693          	mv	a3,s3
			body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002340:	00090613          	mv	a2,s2
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002344:	00848493          	addi	s1,s1,8
    80002348:	00048593          	mv	a1,s1
	__asm__ volatile("li a0, 0x80");
    8000234c:	08000513          	li	a0,128
	__asm__ volatile("ecall");
    80002350:	00000073          	ecall
}
    80002354:	02813083          	ld	ra,40(sp)
    80002358:	02013403          	ld	s0,32(sp)
    8000235c:	01813483          	ld	s1,24(sp)
    80002360:	01013903          	ld	s2,16(sp)
    80002364:	00813983          	ld	s3,8(sp)
    80002368:	03010113          	addi	sp,sp,48
    8000236c:	00008067          	ret
	uint64* stack = nullptr;
    80002370:	00000313          	li	t1,0
    80002374:	fc5ff06f          	j	80002338 <_ZN6ThreadC1EPFvPvES0_+0x50>

0000000080002378 <_ZN6Thread5startEv>:
int Thread::start() {
    80002378:	ff010113          	addi	sp,sp,-16
    8000237c:	00813423          	sd	s0,8(sp)
    80002380:	01010413          	addi	s0,sp,16
	if (myHandle == nullptr) return -1;
    80002384:	00853303          	ld	t1,8(a0) # 1008 <_entry-0x7fffeff8>
    80002388:	02030063          	beqz	t1,800023a8 <_ZN6Thread5startEv+0x30>
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000238c:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x81");
    80002390:	08100513          	li	a0,129
	__asm__ volatile("ecall");
    80002394:	00000073          	ecall
	return 0;
    80002398:	00000513          	li	a0,0
}
    8000239c:	00813403          	ld	s0,8(sp)
    800023a0:	01010113          	addi	sp,sp,16
    800023a4:	00008067          	ret
	if (myHandle == nullptr) return -1;
    800023a8:	fff00513          	li	a0,-1
    800023ac:	ff1ff06f          	j	8000239c <_ZN6Thread5startEv+0x24>

00000000800023b0 <_ZN6Thread4joinEv>:
void Thread::join() {
    800023b0:	ff010113          	addi	sp,sp,-16
    800023b4:	00113423          	sd	ra,8(sp)
    800023b8:	00813023          	sd	s0,0(sp)
    800023bc:	01010413          	addi	s0,sp,16
	thread_join(myHandle);
    800023c0:	00853503          	ld	a0,8(a0)
    800023c4:	fffff097          	auipc	ra,0xfffff
    800023c8:	084080e7          	jalr	132(ra) # 80001448 <_Z11thread_joinP3TCB>
}
    800023cc:	00813083          	ld	ra,8(sp)
    800023d0:	00013403          	ld	s0,0(sp)
    800023d4:	01010113          	addi	sp,sp,16
    800023d8:	00008067          	ret

00000000800023dc <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    800023dc:	ff010113          	addi	sp,sp,-16
    800023e0:	00113423          	sd	ra,8(sp)
    800023e4:	00813023          	sd	s0,0(sp)
    800023e8:	01010413          	addi	s0,sp,16
	thread_dispatch();
    800023ec:	fffff097          	auipc	ra,0xfffff
    800023f0:	03c080e7          	jalr	60(ra) # 80001428 <_Z15thread_dispatchv>
}
    800023f4:	00813083          	ld	ra,8(sp)
    800023f8:	00013403          	ld	s0,0(sp)
    800023fc:	01010113          	addi	sp,sp,16
    80002400:	00008067          	ret

0000000080002404 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t t) {
    80002404:	ff010113          	addi	sp,sp,-16
    80002408:	00113423          	sd	ra,8(sp)
    8000240c:	00813023          	sd	s0,0(sp)
    80002410:	01010413          	addi	s0,sp,16
    80002414:	00050593          	mv	a1,a0
	Scheduler::putToSleep(TCB::running, t);
    80002418:	00009797          	auipc	a5,0x9
    8000241c:	5c07b783          	ld	a5,1472(a5) # 8000b9d8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002420:	0007b503          	ld	a0,0(a5)
    80002424:	fffff097          	auipc	ra,0xfffff
    80002428:	2c0080e7          	jalr	704(ra) # 800016e4 <_ZN9Scheduler10putToSleepEP3TCBm>
}
    8000242c:	00000513          	li	a0,0
    80002430:	00813083          	ld	ra,8(sp)
    80002434:	00013403          	ld	s0,0(sp)
    80002438:	01010113          	addi	sp,sp,16
    8000243c:	00008067          	ret

0000000080002440 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80002440:	fe010113          	addi	sp,sp,-32
    80002444:	00113c23          	sd	ra,24(sp)
    80002448:	00813823          	sd	s0,16(sp)
    8000244c:	00913423          	sd	s1,8(sp)
    80002450:	02010413          	addi	s0,sp,32
    80002454:	00050493          	mv	s1,a0
    80002458:	00009797          	auipc	a5,0x9
    8000245c:	37078793          	addi	a5,a5,880 # 8000b7c8 <_ZTV6Thread+0x10>
    80002460:	00f53023          	sd	a5,0(a0)
	this->body = wrapper;
    80002464:	00000797          	auipc	a5,0x0
    80002468:	c8478793          	addi	a5,a5,-892 # 800020e8 <_ZN6Thread7wrapperEPv>
    8000246c:	00f53823          	sd	a5,16(a0)
	this->arg = this;
    80002470:	00a53c23          	sd	a0,24(a0)
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    80002474:	00001537          	lui	a0,0x1
    80002478:	fffff097          	auipc	ra,0xfffff
    8000247c:	e98080e7          	jalr	-360(ra) # 80001310 <_Z9mem_allocm>
    80002480:	00050313          	mv	t1,a0
	__asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002484:	00030713          	mv	a4,t1
	__asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002488:	0184b303          	ld	t1,24(s1)
    8000248c:	00030693          	mv	a3,t1
			body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002490:	0104b303          	ld	t1,16(s1)
    80002494:	00030613          	mv	a2,t1
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002498:	00848493          	addi	s1,s1,8
    8000249c:	00048593          	mv	a1,s1
	__asm__ volatile("li a0, 0x80");
    800024a0:	08000513          	li	a0,128
	__asm__ volatile("ecall");
    800024a4:	00000073          	ecall
}
    800024a8:	01813083          	ld	ra,24(sp)
    800024ac:	01013403          	ld	s0,16(sp)
    800024b0:	00813483          	ld	s1,8(sp)
    800024b4:	02010113          	addi	sp,sp,32
    800024b8:	00008067          	ret

00000000800024bc <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    800024bc:	ff010113          	addi	sp,sp,-16
    800024c0:	00113423          	sd	ra,8(sp)
    800024c4:	00813023          	sd	s0,0(sp)
    800024c8:	01010413          	addi	s0,sp,16
    800024cc:	00009797          	auipc	a5,0x9
    800024d0:	32478793          	addi	a5,a5,804 # 8000b7f0 <_ZTV9Semaphore+0x10>
    800024d4:	00f53023          	sd	a5,0(a0) # 1000 <_entry-0x7ffff000>
	sem_open(&myHandle, init);
    800024d8:	00850513          	addi	a0,a0,8
    800024dc:	fffff097          	auipc	ra,0xfffff
    800024e0:	fc4080e7          	jalr	-60(ra) # 800014a0 <_Z8sem_openPP4KSemj>
}
    800024e4:	00813083          	ld	ra,8(sp)
    800024e8:	00013403          	ld	s0,0(sp)
    800024ec:	01010113          	addi	sp,sp,16
    800024f0:	00008067          	ret

00000000800024f4 <_ZN9Semaphore4waitEv>:

int Semaphore::wait() {
    800024f4:	ff010113          	addi	sp,sp,-16
    800024f8:	00113423          	sd	ra,8(sp)
    800024fc:	00813023          	sd	s0,0(sp)
    80002500:	01010413          	addi	s0,sp,16
	return sem_wait(myHandle);
    80002504:	00853503          	ld	a0,8(a0)
    80002508:	fffff097          	auipc	ra,0xfffff
    8000250c:	000080e7          	jalr	ra # 80001508 <_Z8sem_waitP4KSem>
}
    80002510:	00813083          	ld	ra,8(sp)
    80002514:	00013403          	ld	s0,0(sp)
    80002518:	01010113          	addi	sp,sp,16
    8000251c:	00008067          	ret

0000000080002520 <_ZN9Semaphore6signalEv>:

int Semaphore::signal() {
    80002520:	ff010113          	addi	sp,sp,-16
    80002524:	00113423          	sd	ra,8(sp)
    80002528:	00813023          	sd	s0,0(sp)
    8000252c:	01010413          	addi	s0,sp,16
	return sem_signal(myHandle);
    80002530:	00853503          	ld	a0,8(a0)
    80002534:	fffff097          	auipc	ra,0xfffff
    80002538:	004080e7          	jalr	4(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    8000253c:	00813083          	ld	ra,8(sp)
    80002540:	00013403          	ld	s0,0(sp)
    80002544:	01010113          	addi	sp,sp,16
    80002548:	00008067          	ret

000000008000254c <_ZN14PeriodicThread9terminateEv>:

void PeriodicThread::terminate() {
    8000254c:	ff010113          	addi	sp,sp,-16
    80002550:	00813423          	sd	s0,8(sp)
    80002554:	01010413          	addi	s0,sp,16

}
    80002558:	00813403          	ld	s0,8(sp)
    8000255c:	01010113          	addi	sp,sp,16
    80002560:	00008067          	ret

0000000080002564 <_ZN14PeriodicThreadC1Em>:

PeriodicThread::PeriodicThread(time_t period) {
    80002564:	fe010113          	addi	sp,sp,-32
    80002568:	00113c23          	sd	ra,24(sp)
    8000256c:	00813823          	sd	s0,16(sp)
    80002570:	00913423          	sd	s1,8(sp)
    80002574:	02010413          	addi	s0,sp,32
    80002578:	00050493          	mv	s1,a0
    8000257c:	00000097          	auipc	ra,0x0
    80002580:	ec4080e7          	jalr	-316(ra) # 80002440 <_ZN6ThreadC1Ev>
    80002584:	00009797          	auipc	a5,0x9
    80002588:	21478793          	addi	a5,a5,532 # 8000b798 <_ZTV14PeriodicThread+0x10>
    8000258c:	00f4b023          	sd	a5,0(s1)

}
    80002590:	01813083          	ld	ra,24(sp)
    80002594:	01013403          	ld	s0,16(sp)
    80002598:	00813483          	ld	s1,8(sp)
    8000259c:	02010113          	addi	sp,sp,32
    800025a0:	00008067          	ret

00000000800025a4 <_ZN7Console4getcEv>:

char Console::getc() {
    800025a4:	ff010113          	addi	sp,sp,-16
    800025a8:	00813423          	sd	s0,8(sp)
    800025ac:	01010413          	addi	s0,sp,16
	return 0;
}
    800025b0:	00000513          	li	a0,0
    800025b4:	00813403          	ld	s0,8(sp)
    800025b8:	01010113          	addi	sp,sp,16
    800025bc:	00008067          	ret

00000000800025c0 <_ZN7Console4putcEc>:

void Console::putc(char) {
    800025c0:	ff010113          	addi	sp,sp,-16
    800025c4:	00813423          	sd	s0,8(sp)
    800025c8:	01010413          	addi	s0,sp,16

}
    800025cc:	00813403          	ld	s0,8(sp)
    800025d0:	01010113          	addi	sp,sp,16
    800025d4:	00008067          	ret

00000000800025d8 <_ZN6Thread3runEv>:
	static int sleep(time_t);

protected:
	Thread();

	virtual void run() {}
    800025d8:	ff010113          	addi	sp,sp,-16
    800025dc:	00813423          	sd	s0,8(sp)
    800025e0:	01010413          	addi	s0,sp,16
    800025e4:	00813403          	ld	s0,8(sp)
    800025e8:	01010113          	addi	sp,sp,16
    800025ec:	00008067          	ret

00000000800025f0 <_ZN14PeriodicThread18periodicActivationEv>:
	void terminate();

protected:
	PeriodicThread(time_t period);

	virtual void periodicActivation() {}
    800025f0:	ff010113          	addi	sp,sp,-16
    800025f4:	00813423          	sd	s0,8(sp)
    800025f8:	01010413          	addi	s0,sp,16
    800025fc:	00813403          	ld	s0,8(sp)
    80002600:	01010113          	addi	sp,sp,16
    80002604:	00008067          	ret

0000000080002608 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80002608:	ff010113          	addi	sp,sp,-16
    8000260c:	00113423          	sd	ra,8(sp)
    80002610:	00813023          	sd	s0,0(sp)
    80002614:	01010413          	addi	s0,sp,16
    80002618:	00009797          	auipc	a5,0x9
    8000261c:	18078793          	addi	a5,a5,384 # 8000b798 <_ZTV14PeriodicThread+0x10>
    80002620:	00f53023          	sd	a5,0(a0)
    80002624:	00000097          	auipc	ra,0x0
    80002628:	af8080e7          	jalr	-1288(ra) # 8000211c <_ZN6ThreadD1Ev>
    8000262c:	00813083          	ld	ra,8(sp)
    80002630:	00013403          	ld	s0,0(sp)
    80002634:	01010113          	addi	sp,sp,16
    80002638:	00008067          	ret

000000008000263c <_ZN14PeriodicThreadD0Ev>:
    8000263c:	fe010113          	addi	sp,sp,-32
    80002640:	00113c23          	sd	ra,24(sp)
    80002644:	00813823          	sd	s0,16(sp)
    80002648:	00913423          	sd	s1,8(sp)
    8000264c:	02010413          	addi	s0,sp,32
    80002650:	00050493          	mv	s1,a0
    80002654:	00009797          	auipc	a5,0x9
    80002658:	14478793          	addi	a5,a5,324 # 8000b798 <_ZTV14PeriodicThread+0x10>
    8000265c:	00f53023          	sd	a5,0(a0)
    80002660:	00000097          	auipc	ra,0x0
    80002664:	abc080e7          	jalr	-1348(ra) # 8000211c <_ZN6ThreadD1Ev>
    80002668:	00048513          	mv	a0,s1
    8000266c:	00000097          	auipc	ra,0x0
    80002670:	bac080e7          	jalr	-1108(ra) # 80002218 <_ZdlPv>
    80002674:	01813083          	ld	ra,24(sp)
    80002678:	01013403          	ld	s0,16(sp)
    8000267c:	00813483          	ld	s1,8(sp)
    80002680:	02010113          	addi	sp,sp,32
    80002684:	00008067          	ret

0000000080002688 <_ZN3TCB7wrapperEv>:
	Riscv::pushRegisters();
	TCB::dispatch();
	Riscv::popRegisters();
}

void TCB::wrapper() {
    80002688:	ff010113          	addi	sp,sp,-16
    8000268c:	00113423          	sd	ra,8(sp)
    80002690:	00813023          	sd	s0,0(sp)
    80002694:	01010413          	addi	s0,sp,16
	//pocetak wrappera se izvrsava u supervisor modu,
	//jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch/yield)
	Riscv::popSppSpie();
    80002698:	00000097          	auipc	ra,0x0
    8000269c:	2f8080e7          	jalr	760(ra) # 80002990 <_ZN5Riscv10popSppSpieEv>
	//na dalje se izvrsavamo u user modu
	running->threadFunction(running->args);
    800026a0:	00009797          	auipc	a5,0x9
    800026a4:	3b07b783          	ld	a5,944(a5) # 8000ba50 <_ZN3TCB7runningE>
    800026a8:	0107b703          	ld	a4,16(a5)
    800026ac:	0207b503          	ld	a0,32(a5)
    800026b0:	000700e7          	jalr	a4
	//running->finished = true;
	//i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
	thread_exit();
    800026b4:	fffff097          	auipc	ra,0xfffff
    800026b8:	d4c080e7          	jalr	-692(ra) # 80001400 <_Z11thread_exitv>
}
    800026bc:	00813083          	ld	ra,8(sp)
    800026c0:	00013403          	ld	s0,0(sp)
    800026c4:	01010113          	addi	sp,sp,16
    800026c8:	00008067          	ret

00000000800026cc <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    800026cc:	fe010113          	addi	sp,sp,-32
    800026d0:	00113c23          	sd	ra,24(sp)
    800026d4:	00813823          	sd	s0,16(sp)
    800026d8:	00913423          	sd	s1,8(sp)
    800026dc:	02010413          	addi	s0,sp,32
	TCB* old = TCB::running;
    800026e0:	00009497          	auipc	s1,0x9
    800026e4:	3704b483          	ld	s1,880(s1) # 8000ba50 <_ZN3TCB7runningE>
	if (!old->finished && !old->blocked && old->timeToSleep == 0 && !old->needToJoin) {
    800026e8:	0304c783          	lbu	a5,48(s1)
    800026ec:	00079e63          	bnez	a5,80002708 <_ZN3TCB8dispatchEv+0x3c>
    800026f0:	0314c783          	lbu	a5,49(s1)
    800026f4:	00079a63          	bnez	a5,80002708 <_ZN3TCB8dispatchEv+0x3c>
    800026f8:	0404b783          	ld	a5,64(s1)
    800026fc:	00079663          	bnez	a5,80002708 <_ZN3TCB8dispatchEv+0x3c>
    80002700:	0324c783          	lbu	a5,50(s1)
    80002704:	04078a63          	beqz	a5,80002758 <_ZN3TCB8dispatchEv+0x8c>
	TCB::running = Scheduler::get();
    80002708:	fffff097          	auipc	ra,0xfffff
    8000270c:	f9c080e7          	jalr	-100(ra) # 800016a4 <_ZN9Scheduler3getEv>
    80002710:	00050593          	mv	a1,a0
    80002714:	00009797          	auipc	a5,0x9
    80002718:	33c78793          	addi	a5,a5,828 # 8000ba50 <_ZN3TCB7runningE>
    8000271c:	00a7b023          	sd	a0,0(a5)
	TCB::runningTimeSlice = 0;
    80002720:	0007b423          	sd	zero,8(a5)
	if (TCB::running->threadFunction == nullptr) {
    80002724:	01053783          	ld	a5,16(a0)
    80002728:	04078063          	beqz	a5,80002768 <_ZN3TCB8dispatchEv+0x9c>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    8000272c:	10000793          	li	a5,256
    80002730:	1007b073          	csrc	sstatus,a5
	if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    80002734:	00b48863          	beq	s1,a1,80002744 <_ZN3TCB8dispatchEv+0x78>
    80002738:	00048513          	mv	a0,s1
    8000273c:	fffff097          	auipc	ra,0xfffff
    80002740:	ad4080e7          	jalr	-1324(ra) # 80001210 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80002744:	01813083          	ld	ra,24(sp)
    80002748:	01013403          	ld	s0,16(sp)
    8000274c:	00813483          	ld	s1,8(sp)
    80002750:	02010113          	addi	sp,sp,32
    80002754:	00008067          	ret
		Scheduler::put(old);
    80002758:	00048513          	mv	a0,s1
    8000275c:	fffff097          	auipc	ra,0xfffff
    80002760:	f04080e7          	jalr	-252(ra) # 80001660 <_ZN9Scheduler3putEP3TCB>
    80002764:	fa5ff06f          	j	80002708 <_ZN3TCB8dispatchEv+0x3c>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80002768:	10000793          	li	a5,256
    8000276c:	1007a073          	csrs	sstatus,a5
}
    80002770:	fc5ff06f          	j	80002734 <_ZN3TCB8dispatchEv+0x68>

0000000080002774 <_ZN3TCB5yieldEv>:
void TCB::yield() {
    80002774:	ff010113          	addi	sp,sp,-16
    80002778:	00113423          	sd	ra,8(sp)
    8000277c:	00813023          	sd	s0,0(sp)
    80002780:	01010413          	addi	s0,sp,16
	Riscv::pushRegisters();
    80002784:	fffff097          	auipc	ra,0xfffff
    80002788:	87c080e7          	jalr	-1924(ra) # 80001000 <_ZN5Riscv13pushRegistersEv>
	TCB::dispatch();
    8000278c:	00000097          	auipc	ra,0x0
    80002790:	f40080e7          	jalr	-192(ra) # 800026cc <_ZN3TCB8dispatchEv>
	Riscv::popRegisters();
    80002794:	fffff097          	auipc	ra,0xfffff
    80002798:	8e8080e7          	jalr	-1816(ra) # 8000107c <_ZN5Riscv12popRegistersEv>
}
    8000279c:	00813083          	ld	ra,8(sp)
    800027a0:	00013403          	ld	s0,0(sp)
    800027a4:	01010113          	addi	sp,sp,16
    800027a8:	00008067          	ret

00000000800027ac <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    800027ac:	ff010113          	addi	sp,sp,-16
    800027b0:	00113423          	sd	ra,8(sp)
    800027b4:	00813023          	sd	s0,0(sp)
    800027b8:	01010413          	addi	s0,sp,16
	return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::THREAD);
    800027bc:	00200593          	li	a1,2
    800027c0:	01850513          	addi	a0,a0,24
    800027c4:	00000097          	auipc	ra,0x0
    800027c8:	1ec080e7          	jalr	492(ra) # 800029b0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
}
    800027cc:	00813083          	ld	ra,8(sp)
    800027d0:	00013403          	ld	s0,0(sp)
    800027d4:	01010113          	addi	sp,sp,16
    800027d8:	00008067          	ret

00000000800027dc <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    800027dc:	fd010113          	addi	sp,sp,-48
    800027e0:	02113423          	sd	ra,40(sp)
    800027e4:	02813023          	sd	s0,32(sp)
    800027e8:	00913c23          	sd	s1,24(sp)
    800027ec:	01213823          	sd	s2,16(sp)
    800027f0:	01313423          	sd	s3,8(sp)
    800027f4:	03010413          	addi	s0,sp,48
    800027f8:	00050913          	mv	s2,a0
    800027fc:	00058993          	mv	s3,a1
    80002800:	00060493          	mv	s1,a2
	TCB* newThread = new TCB(function, args, stack);
    80002804:	06000513          	li	a0,96
    80002808:	00000097          	auipc	ra,0x0
    8000280c:	fa4080e7          	jalr	-92(ra) # 800027ac <_ZN3TCBnwEm>


	TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
													timeSlice(DEFAULT_TIME_SLICE), finished(false), blocked(false),
													needToJoin(false),
													nextInScheduler(nullptr), timeToSleep(0), nextSleeping(nullptr) {
    80002810:	01253823          	sd	s2,16(a0)
    80002814:	00953c23          	sd	s1,24(a0)
    80002818:	03353023          	sd	s3,32(a0)
    8000281c:	00200793          	li	a5,2
    80002820:	02f53423          	sd	a5,40(a0)
    80002824:	02050823          	sb	zero,48(a0)
    80002828:	020508a3          	sb	zero,49(a0)
    8000282c:	02050923          	sb	zero,50(a0)
    80002830:	02053c23          	sd	zero,56(a0)
    80002834:	04053023          	sd	zero,64(a0)
    80002838:	04053423          	sd	zero,72(a0)
	ThreadQueue() : front(nullptr), back(nullptr) {}
    8000283c:	04053823          	sd	zero,80(a0)
    80002840:	04053c23          	sd	zero,88(a0)
		//formiranje pocetnog konteksta; specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80002844:	02090e63          	beqz	s2,80002880 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xa4>
    80002848:	00000797          	auipc	a5,0x0
    8000284c:	e4078793          	addi	a5,a5,-448 # 80002688 <_ZN3TCB7wrapperEv>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80002850:	02048c63          	beqz	s1,80002888 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xac>
    80002854:	00008637          	lui	a2,0x8
    80002858:	00c484b3          	add	s1,s1,a2
		this->context.ra = startRa;
    8000285c:	00f53023          	sd	a5,0(a0)
		this->context.sp = startSp;
    80002860:	00953423          	sd	s1,8(a0)
}
    80002864:	02813083          	ld	ra,40(sp)
    80002868:	02013403          	ld	s0,32(sp)
    8000286c:	01813483          	ld	s1,24(sp)
    80002870:	01013903          	ld	s2,16(sp)
    80002874:	00813983          	ld	s3,8(sp)
    80002878:	03010113          	addi	sp,sp,48
    8000287c:	00008067          	ret
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80002880:	00000793          	li	a5,0
    80002884:	fcdff06f          	j	80002850 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x74>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80002888:	00000493          	li	s1,0
    8000288c:	fd1ff06f          	j	8000285c <_ZN3TCB12createThreadEPFvPvES0_Pm+0x80>

0000000080002890 <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    80002890:	ff010113          	addi	sp,sp,-16
    80002894:	00113423          	sd	ra,8(sp)
    80002898:	00813023          	sd	s0,0(sp)
    8000289c:	01010413          	addi	s0,sp,16
	MemoryAllocator::kfree(ptr);
    800028a0:	00000097          	auipc	ra,0x0
    800028a4:	2bc080e7          	jalr	700(ra) # 80002b5c <_ZN15MemoryAllocator5kfreeEPv>
}
    800028a8:	00813083          	ld	ra,8(sp)
    800028ac:	00013403          	ld	s0,0(sp)
    800028b0:	01010113          	addi	sp,sp,16
    800028b4:	00008067          	ret

00000000800028b8 <_ZN3TCB10threadJoinEPS_>:

void TCB::threadJoin(TCB* handle) {
	if(handle->finished) return;
    800028b8:	03054783          	lbu	a5,48(a0)
    800028bc:	00078463          	beqz	a5,800028c4 <_ZN3TCB10threadJoinEPS_+0xc>
    800028c0:	00008067          	ret
void TCB::threadJoin(TCB* handle) {
    800028c4:	ff010113          	addi	sp,sp,-16
    800028c8:	00113423          	sd	ra,8(sp)
    800028cc:	00813023          	sd	s0,0(sp)
    800028d0:	01010413          	addi	s0,sp,16
	TCB::running->needToJoin = true;
    800028d4:	00009597          	auipc	a1,0x9
    800028d8:	17c5b583          	ld	a1,380(a1) # 8000ba50 <_ZN3TCB7runningE>
    800028dc:	00100793          	li	a5,1
    800028e0:	02f58923          	sb	a5,50(a1)
	handle->waitingToJoin.putLast(TCB::running);
    800028e4:	05050513          	addi	a0,a0,80
    800028e8:	fffff097          	auipc	ra,0xfffff
    800028ec:	95c080e7          	jalr	-1700(ra) # 80001244 <_ZN11ThreadQueue7putLastEP3TCB>
}
    800028f0:	00813083          	ld	ra,8(sp)
    800028f4:	00013403          	ld	s0,0(sp)
    800028f8:	01010113          	addi	sp,sp,16
    800028fc:	00008067          	ret

0000000080002900 <_ZN3TCB13releaseJoinedEv>:

void TCB::releaseJoined() {
	while(!TCB::running->waitingToJoin.isEmpty()){
    80002900:	00009517          	auipc	a0,0x9
    80002904:	15053503          	ld	a0,336(a0) # 8000ba50 <_ZN3TCB7runningE>
		return front == nullptr;
    80002908:	05053783          	ld	a5,80(a0)
    8000290c:	04078663          	beqz	a5,80002958 <_ZN3TCB13releaseJoinedEv+0x58>
void TCB::releaseJoined() {
    80002910:	ff010113          	addi	sp,sp,-16
    80002914:	00113423          	sd	ra,8(sp)
    80002918:	00813023          	sd	s0,0(sp)
    8000291c:	01010413          	addi	s0,sp,16
		TCB* tcb = TCB::running->waitingToJoin.getFirst();
    80002920:	05050513          	addi	a0,a0,80
    80002924:	fffff097          	auipc	ra,0xfffff
    80002928:	98c080e7          	jalr	-1652(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
		tcb->needToJoin = false;
    8000292c:	02050923          	sb	zero,50(a0)
		Scheduler::put(tcb);
    80002930:	fffff097          	auipc	ra,0xfffff
    80002934:	d30080e7          	jalr	-720(ra) # 80001660 <_ZN9Scheduler3putEP3TCB>
	while(!TCB::running->waitingToJoin.isEmpty()){
    80002938:	00009517          	auipc	a0,0x9
    8000293c:	11853503          	ld	a0,280(a0) # 8000ba50 <_ZN3TCB7runningE>
    80002940:	05053783          	ld	a5,80(a0)
    80002944:	fc079ee3          	bnez	a5,80002920 <_ZN3TCB13releaseJoinedEv+0x20>
	}
}
    80002948:	00813083          	ld	ra,8(sp)
    8000294c:	00013403          	ld	s0,0(sp)
    80002950:	01010113          	addi	sp,sp,16
    80002954:	00008067          	ret
    80002958:	00008067          	ret

000000008000295c <_ZN3TCB5startEPS_>:

void TCB::start(TCB* newTcb) {
	//startovanje niti(stavljanje u Scheduler); main nit je vec aktivna, ne stavlja se u Scheduler
	if (newTcb->threadFunction != nullptr) Scheduler::put(newTcb);
    8000295c:	01053783          	ld	a5,16(a0)
    80002960:	02078663          	beqz	a5,8000298c <_ZN3TCB5startEPS_+0x30>
void TCB::start(TCB* newTcb) {
    80002964:	ff010113          	addi	sp,sp,-16
    80002968:	00113423          	sd	ra,8(sp)
    8000296c:	00813023          	sd	s0,0(sp)
    80002970:	01010413          	addi	s0,sp,16
	if (newTcb->threadFunction != nullptr) Scheduler::put(newTcb);
    80002974:	fffff097          	auipc	ra,0xfffff
    80002978:	cec080e7          	jalr	-788(ra) # 80001660 <_ZN9Scheduler3putEP3TCB>
}
    8000297c:	00813083          	ld	ra,8(sp)
    80002980:	00013403          	ld	s0,0(sp)
    80002984:	01010113          	addi	sp,sp,16
    80002988:	00008067          	ret
    8000298c:	00008067          	ret

0000000080002990 <_ZN5Riscv10popSppSpieEv>:
// Created by os on 5/17/23.
//

#include "../h/Riscv.hpp"

void Riscv::popSppSpie() {
    80002990:	ff010113          	addi	sp,sp,-16
    80002994:	00813423          	sd	s0,8(sp)
    80002998:	01010413          	addi	s0,sp,16
	//ra pokazuje iza ove funkcije na nastavak wrappera
	__asm__ volatile("csrw sepc, ra");
    8000299c:	14109073          	csrw	sepc,ra
	__asm__ volatile("sret");
    800029a0:	10200073          	sret
    800029a4:	00813403          	ld	s0,8(sp)
    800029a8:	01010113          	addi	sp,sp,16
    800029ac:	00008067          	ret

00000000800029b0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>:

bool MemoryAllocator::initialized = false;
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

void* MemoryAllocator::kmalloc(size_t size, Purpose pur) {
    800029b0:	ff010113          	addi	sp,sp,-16
    800029b4:	00813423          	sd	s0,8(sp)
    800029b8:	01010413          	addi	s0,sp,16
	if (size <= 0) return nullptr;
    800029bc:	12050863          	beqz	a0,80002aec <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x13c>

	//pocetna inicijalizacija
	if (!initialized) {
    800029c0:	00009797          	auipc	a5,0x9
    800029c4:	0a07c783          	lbu	a5,160(a5) # 8000ba60 <_ZN15MemoryAllocator11initializedE>
    800029c8:	04079863          	bnez	a5,80002a18 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x68>
		freeMemHead = (FreeMemSegment*)HEAP_START_ADDR;
    800029cc:	00009617          	auipc	a2,0x9
    800029d0:	ffc63603          	ld	a2,-4(a2) # 8000b9c8 <_GLOBAL_OFFSET_TABLE_+0x20>
    800029d4:	00063783          	ld	a5,0(a2)
    800029d8:	00009717          	auipc	a4,0x9
    800029dc:	08870713          	addi	a4,a4,136 # 8000ba60 <_ZN15MemoryAllocator11initializedE>
    800029e0:	00f73423          	sd	a5,8(a4)
		freeMemHead->next = nullptr;
    800029e4:	0007b023          	sd	zero,0(a5)
		freeMemHead->prev = nullptr;
    800029e8:	00873683          	ld	a3,8(a4)
    800029ec:	0006b423          	sd	zero,8(a3)
		freeMemHead->size = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR - sizeof(FreeMemSegment);
    800029f0:	00009797          	auipc	a5,0x9
    800029f4:	ff07b783          	ld	a5,-16(a5) # 8000b9e0 <_GLOBAL_OFFSET_TABLE_+0x38>
    800029f8:	0007b783          	ld	a5,0(a5)
    800029fc:	00063603          	ld	a2,0(a2)
    80002a00:	40c787b3          	sub	a5,a5,a2
    80002a04:	fe878793          	addi	a5,a5,-24
    80002a08:	00f6b823          	sd	a5,16(a3)
		usedMemHead = nullptr;
    80002a0c:	00073823          	sd	zero,16(a4)

		initialized = true;
    80002a10:	00100793          	li	a5,1
    80002a14:	00f70023          	sb	a5,0(a4)
	}

	//alokacija uvek zaokruzena na blokove
	//size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
	size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80002a18:	00655793          	srli	a5,a0,0x6
    80002a1c:	03f57513          	andi	a0,a0,63
    80002a20:	00050463          	beqz	a0,80002a28 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x78>
    80002a24:	00100513          	li	a0,1
    80002a28:	00a78533          	add	a0,a5,a0
	size = blocks * MEM_BLOCK_SIZE;
    80002a2c:	00651793          	slli	a5,a0,0x6

	//trazenje slobodnog segmenta po first-fit algoritmu
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80002a30:	00009517          	auipc	a0,0x9
    80002a34:	03853503          	ld	a0,56(a0) # 8000ba68 <_ZN15MemoryAllocator11freeMemHeadE>
    80002a38:	08050c63          	beqz	a0,80002ad0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x120>
		if (current->size < size) continue;
    80002a3c:	01053703          	ld	a4,16(a0)
    80002a40:	06f76463          	bltu	a4,a5,80002aa8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xf8>

		//pravljenje novog slobodnog fragmenta od ostatka fragmenta
		FreeMemSegment* remainderFree = (FreeMemSegment*)((char*)current + size);
    80002a44:	00f506b3          	add	a3,a0,a5
		remainderFree->size = current->size - size;
    80002a48:	40f70733          	sub	a4,a4,a5
    80002a4c:	00e6b823          	sd	a4,16(a3)
		remainderFree->prev = current->prev;
    80002a50:	00853703          	ld	a4,8(a0)
    80002a54:	00e6b423          	sd	a4,8(a3)
		if (current->prev) current->prev->next = remainderFree;
    80002a58:	00070463          	beqz	a4,80002a60 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xb0>
    80002a5c:	00d73023          	sd	a3,0(a4)
		remainderFree->next = current->next;
    80002a60:	00053703          	ld	a4,0(a0)
    80002a64:	00e6b023          	sd	a4,0(a3)
		if (current->next) current->next->prev = remainderFree;
    80002a68:	00070463          	beqz	a4,80002a70 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xc0>
    80002a6c:	00d73423          	sd	a3,8(a4)
		if (freeMemHead == current) freeMemHead = remainderFree;
    80002a70:	00009717          	auipc	a4,0x9
    80002a74:	ff873703          	ld	a4,-8(a4) # 8000ba68 <_ZN15MemoryAllocator11freeMemHeadE>
    80002a78:	02a70c63          	beq	a4,a0,80002ab0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x100>

		//ubacivanje novog fragmenta u listu zauzetih fragmenata
		UsedMemSegment* newFragment = (UsedMemSegment*)current;
		newFragment->size = size;
    80002a7c:	00f53423          	sd	a5,8(a0)
		newFragment->purpose = pur;
    80002a80:	00b52823          	sw	a1,16(a0)
		UsedMemSegment* prevUsed = nullptr;
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    80002a84:	00009697          	auipc	a3,0x9
    80002a88:	fec6b683          	ld	a3,-20(a3) # 8000ba70 <_ZN15MemoryAllocator11usedMemHeadE>
    80002a8c:	00068793          	mv	a5,a3
		UsedMemSegment* prevUsed = nullptr;
    80002a90:	00000713          	li	a4,0
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    80002a94:	02078463          	beqz	a5,80002abc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x10c>
    80002a98:	02a7f263          	bgeu	a5,a0,80002abc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x10c>
    80002a9c:	00078713          	mv	a4,a5
    80002aa0:	0007b783          	ld	a5,0(a5)
    80002aa4:	ff1ff06f          	j	80002a94 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xe4>
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80002aa8:	00053503          	ld	a0,0(a0)
    80002aac:	f8dff06f          	j	80002a38 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x88>
		if (freeMemHead == current) freeMemHead = remainderFree;
    80002ab0:	00009717          	auipc	a4,0x9
    80002ab4:	fad73c23          	sd	a3,-72(a4) # 8000ba68 <_ZN15MemoryAllocator11freeMemHeadE>
    80002ab8:	fc5ff06f          	j	80002a7c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xcc>
		if (!prevUsed) {
    80002abc:	02070063          	beqz	a4,80002adc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x12c>
			newFragment->next = usedMemHead;
			usedMemHead = newFragment;
		} else {
			newFragment->next = prevUsed->next;
    80002ac0:	00073783          	ld	a5,0(a4)
    80002ac4:	00f53023          	sd	a5,0(a0)
			prevUsed->next = newFragment;
    80002ac8:	00a73023          	sd	a0,0(a4)
		}
		return (char*)newFragment + sizeof(UsedMemSegment);
    80002acc:	01850513          	addi	a0,a0,24
	}
	return nullptr;
}
    80002ad0:	00813403          	ld	s0,8(sp)
    80002ad4:	01010113          	addi	sp,sp,16
    80002ad8:	00008067          	ret
			newFragment->next = usedMemHead;
    80002adc:	00d53023          	sd	a3,0(a0)
			usedMemHead = newFragment;
    80002ae0:	00009797          	auipc	a5,0x9
    80002ae4:	f8a7b823          	sd	a0,-112(a5) # 8000ba70 <_ZN15MemoryAllocator11usedMemHeadE>
    80002ae8:	fe5ff06f          	j	80002acc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x11c>
	if (size <= 0) return nullptr;
    80002aec:	00000513          	li	a0,0
    80002af0:	fe1ff06f          	j	80002ad0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x120>

0000000080002af4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:
	tryToJoin(newFree);
	tryToJoin(prevFree);
	return 0;
}

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    80002af4:	ff010113          	addi	sp,sp,-16
    80002af8:	00813423          	sd	s0,8(sp)
    80002afc:	01010413          	addi	s0,sp,16
	if (!current) return 0;
    80002b00:	04050663          	beqz	a0,80002b4c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x58>
	bool nextExists = current->next != nullptr;
    80002b04:	00053783          	ld	a5,0(a0)
	char* nextAddr = (char*)current + current->size;
    80002b08:	01053703          	ld	a4,16(a0)
    80002b0c:	00e506b3          	add	a3,a0,a4
	char* cnext = (char*)current->next;
	bool nextIsConnected = (nextAddr == cnext);
	if (nextExists && nextIsConnected) {
    80002b10:	04078263          	beqz	a5,80002b54 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x60>
    80002b14:	00d78a63          	beq	a5,a3,80002b28 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x34>
		current->size += current->next->size;
		current->next = current->next->next;
		if (current->next) current->next->prev = current;
		return 1;
	} else return 0;
    80002b18:	00000513          	li	a0,0
}
    80002b1c:	00813403          	ld	s0,8(sp)
    80002b20:	01010113          	addi	sp,sp,16
    80002b24:	00008067          	ret
		current->size += current->next->size;
    80002b28:	0107b683          	ld	a3,16(a5)
    80002b2c:	00d70733          	add	a4,a4,a3
    80002b30:	00e53823          	sd	a4,16(a0)
		current->next = current->next->next;
    80002b34:	0007b783          	ld	a5,0(a5)
    80002b38:	00f53023          	sd	a5,0(a0)
		if (current->next) current->next->prev = current;
    80002b3c:	00078463          	beqz	a5,80002b44 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x50>
    80002b40:	00a7b423          	sd	a0,8(a5)
		return 1;
    80002b44:	00100513          	li	a0,1
    80002b48:	fd5ff06f          	j	80002b1c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	if (!current) return 0;
    80002b4c:	00000513          	li	a0,0
    80002b50:	fcdff06f          	j	80002b1c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	} else return 0;
    80002b54:	00000513          	li	a0,0
    80002b58:	fc5ff06f          	j	80002b1c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>

0000000080002b5c <_ZN15MemoryAllocator5kfreeEPv>:
	if (!ptr) return 0;
    80002b5c:	10050463          	beqz	a0,80002c64 <_ZN15MemoryAllocator5kfreeEPv+0x108>
    80002b60:	00050693          	mv	a3,a0
	if (!usedMemHead) return -1;
    80002b64:	00009797          	auipc	a5,0x9
    80002b68:	f0c7b783          	ld	a5,-244(a5) # 8000ba70 <_ZN15MemoryAllocator11usedMemHeadE>
    80002b6c:	10078063          	beqz	a5,80002c6c <_ZN15MemoryAllocator5kfreeEPv+0x110>
	ptr = (char*)ptr - sizeof(UsedMemSegment);
    80002b70:	fe850513          	addi	a0,a0,-24
	UsedMemSegment* prevUsed = nullptr;
    80002b74:	00000713          	li	a4,0
	for (; currentUsed && currentUsed != ptr; prevUsed = currentUsed, currentUsed = currentUsed->next);
    80002b78:	00078a63          	beqz	a5,80002b8c <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80002b7c:	00a78863          	beq	a5,a0,80002b8c <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80002b80:	00078713          	mv	a4,a5
    80002b84:	0007b783          	ld	a5,0(a5)
    80002b88:	ff1ff06f          	j	80002b78 <_ZN15MemoryAllocator5kfreeEPv+0x1c>
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80002b8c:	0ea79463          	bne	a5,a0,80002c74 <_ZN15MemoryAllocator5kfreeEPv+0x118>
int MemoryAllocator::kfree(void* ptr) {
    80002b90:	fe010113          	addi	sp,sp,-32
    80002b94:	00113c23          	sd	ra,24(sp)
    80002b98:	00813823          	sd	s0,16(sp)
    80002b9c:	00913423          	sd	s1,8(sp)
    80002ba0:	02010413          	addi	s0,sp,32
	if (prevUsed) prevUsed->next = currentUsed->next;
    80002ba4:	02070863          	beqz	a4,80002bd4 <_ZN15MemoryAllocator5kfreeEPv+0x78>
    80002ba8:	0007b783          	ld	a5,0(a5)
    80002bac:	00f73023          	sd	a5,0(a4)
	if (!freeMemHead || ptr < (char*)freeMemHead) {
    80002bb0:	00009797          	auipc	a5,0x9
    80002bb4:	eb87b783          	ld	a5,-328(a5) # 8000ba68 <_ZN15MemoryAllocator11freeMemHeadE>
    80002bb8:	02078663          	beqz	a5,80002be4 <_ZN15MemoryAllocator5kfreeEPv+0x88>
    80002bbc:	02f56863          	bltu	a0,a5,80002bec <_ZN15MemoryAllocator5kfreeEPv+0x90>
			 prevFree->next != nullptr && ptr > (char*)(prevFree->next); prevFree = prevFree->next);
    80002bc0:	00078493          	mv	s1,a5
    80002bc4:	0007b783          	ld	a5,0(a5)
    80002bc8:	02078463          	beqz	a5,80002bf0 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80002bcc:	fea7eae3          	bltu	a5,a0,80002bc0 <_ZN15MemoryAllocator5kfreeEPv+0x64>
    80002bd0:	0200006f          	j	80002bf0 <_ZN15MemoryAllocator5kfreeEPv+0x94>
	else usedMemHead = currentUsed->next;
    80002bd4:	0007b783          	ld	a5,0(a5)
    80002bd8:	00009717          	auipc	a4,0x9
    80002bdc:	e8f73c23          	sd	a5,-360(a4) # 8000ba70 <_ZN15MemoryAllocator11usedMemHeadE>
    80002be0:	fd1ff06f          	j	80002bb0 <_ZN15MemoryAllocator5kfreeEPv+0x54>
		prevFree = nullptr;
    80002be4:	00078493          	mv	s1,a5
    80002be8:	0080006f          	j	80002bf0 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80002bec:	00000493          	li	s1,0
	size_t segmentSize = ((UsedMemSegment*)ptr)->size;
    80002bf0:	ff06b783          	ld	a5,-16(a3)
	newFree->size = segmentSize;
    80002bf4:	fef6bc23          	sd	a5,-8(a3)
	newFree->prev = prevFree;
    80002bf8:	fe96b823          	sd	s1,-16(a3)
	if (prevFree) newFree->next = prevFree->next;
    80002bfc:	04048663          	beqz	s1,80002c48 <_ZN15MemoryAllocator5kfreeEPv+0xec>
    80002c00:	0004b783          	ld	a5,0(s1)
    80002c04:	fef6b423          	sd	a5,-24(a3)
	if (newFree->next) newFree->next->prev = newFree;
    80002c08:	fe86b783          	ld	a5,-24(a3)
    80002c0c:	00078463          	beqz	a5,80002c14 <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    80002c10:	00a7b423          	sd	a0,8(a5)
	if (prevFree) prevFree->next = newFree;
    80002c14:	04048263          	beqz	s1,80002c58 <_ZN15MemoryAllocator5kfreeEPv+0xfc>
    80002c18:	00a4b023          	sd	a0,0(s1)
	tryToJoin(newFree);
    80002c1c:	00000097          	auipc	ra,0x0
    80002c20:	ed8080e7          	jalr	-296(ra) # 80002af4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	tryToJoin(prevFree);
    80002c24:	00048513          	mv	a0,s1
    80002c28:	00000097          	auipc	ra,0x0
    80002c2c:	ecc080e7          	jalr	-308(ra) # 80002af4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	return 0;
    80002c30:	00000513          	li	a0,0
}
    80002c34:	01813083          	ld	ra,24(sp)
    80002c38:	01013403          	ld	s0,16(sp)
    80002c3c:	00813483          	ld	s1,8(sp)
    80002c40:	02010113          	addi	sp,sp,32
    80002c44:	00008067          	ret
	else newFree->next = freeMemHead;
    80002c48:	00009797          	auipc	a5,0x9
    80002c4c:	e207b783          	ld	a5,-480(a5) # 8000ba68 <_ZN15MemoryAllocator11freeMemHeadE>
    80002c50:	fef6b423          	sd	a5,-24(a3)
    80002c54:	fb5ff06f          	j	80002c08 <_ZN15MemoryAllocator5kfreeEPv+0xac>
	else freeMemHead = newFree;
    80002c58:	00009797          	auipc	a5,0x9
    80002c5c:	e0a7b823          	sd	a0,-496(a5) # 8000ba68 <_ZN15MemoryAllocator11freeMemHeadE>
    80002c60:	fbdff06f          	j	80002c1c <_ZN15MemoryAllocator5kfreeEPv+0xc0>
	if (!ptr) return 0;
    80002c64:	00000513          	li	a0,0
    80002c68:	00008067          	ret
	if (!usedMemHead) return -1;
    80002c6c:	fff00513          	li	a0,-1
    80002c70:	00008067          	ret
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80002c74:	fff00513          	li	a0,-1
}
    80002c78:	00008067          	ret

0000000080002c7c <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>:

bool MemoryAllocator::checkPurpose(void* ptr, MemoryAllocator::Purpose p) {
    80002c7c:	ff010113          	addi	sp,sp,-16
    80002c80:	00813423          	sd	s0,8(sp)
    80002c84:	01010413          	addi	s0,sp,16
	ptr = (char*)ptr - sizeof(UsedMemSegment);
	return ((UsedMemSegment*)ptr)->purpose == p;
    80002c88:	ff852503          	lw	a0,-8(a0)
    80002c8c:	40b50533          	sub	a0,a0,a1
}
    80002c90:	00153513          	seqz	a0,a0
    80002c94:	00813403          	ld	s0,8(sp)
    80002c98:	01010113          	addi	sp,sp,16
    80002c9c:	00008067          	ret

0000000080002ca0 <_ZN4KSemnwEm>:

#include "../h/KSem.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void* KSem::operator new(size_t size) {
    80002ca0:	ff010113          	addi	sp,sp,-16
    80002ca4:	00113423          	sd	ra,8(sp)
    80002ca8:	00813023          	sd	s0,0(sp)
    80002cac:	01010413          	addi	s0,sp,16
	return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::SEMAPHORE);
    80002cb0:	00100593          	li	a1,1
    80002cb4:	01850513          	addi	a0,a0,24
    80002cb8:	00000097          	auipc	ra,0x0
    80002cbc:	cf8080e7          	jalr	-776(ra) # 800029b0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
}
    80002cc0:	00813083          	ld	ra,8(sp)
    80002cc4:	00013403          	ld	s0,0(sp)
    80002cc8:	01010113          	addi	sp,sp,16
    80002ccc:	00008067          	ret

0000000080002cd0 <_ZN4KSemdlEPv>:

void KSem::operator delete(void* ptr) {
    80002cd0:	ff010113          	addi	sp,sp,-16
    80002cd4:	00113423          	sd	ra,8(sp)
    80002cd8:	00813023          	sd	s0,0(sp)
    80002cdc:	01010413          	addi	s0,sp,16
	MemoryAllocator::kfree(ptr);
    80002ce0:	00000097          	auipc	ra,0x0
    80002ce4:	e7c080e7          	jalr	-388(ra) # 80002b5c <_ZN15MemoryAllocator5kfreeEPv>
}
    80002ce8:	00813083          	ld	ra,8(sp)
    80002cec:	00013403          	ld	s0,0(sp)
    80002cf0:	01010113          	addi	sp,sp,16
    80002cf4:	00008067          	ret

0000000080002cf8 <_ZN4KSem7initSemEj>:

KSem* KSem::initSem(uint val) {
    80002cf8:	fe010113          	addi	sp,sp,-32
    80002cfc:	00113c23          	sd	ra,24(sp)
    80002d00:	00813823          	sd	s0,16(sp)
    80002d04:	00913423          	sd	s1,8(sp)
    80002d08:	02010413          	addi	s0,sp,32
    80002d0c:	00050493          	mv	s1,a0
	return new KSem(val);
    80002d10:	02000513          	li	a0,32
    80002d14:	00000097          	auipc	ra,0x0
    80002d18:	f8c080e7          	jalr	-116(ra) # 80002ca0 <_ZN4KSemnwEm>
	void block();

	void unblock();

private:
	KSem(uint val) : val(val), working(true) {}
    80002d1c:	00952023          	sw	s1,0(a0)
	ThreadQueue() : front(nullptr), back(nullptr) {}
    80002d20:	00053423          	sd	zero,8(a0)
    80002d24:	00053823          	sd	zero,16(a0)
    80002d28:	00100713          	li	a4,1
    80002d2c:	00e50c23          	sb	a4,24(a0)
}
    80002d30:	01813083          	ld	ra,24(sp)
    80002d34:	01013403          	ld	s0,16(sp)
    80002d38:	00813483          	ld	s1,8(sp)
    80002d3c:	02010113          	addi	sp,sp,32
    80002d40:	00008067          	ret

0000000080002d44 <_ZN4KSem5blockEv>:
	if (!working) return -3;
	if (val++ < 0) unblock();
	return 0;
}

void KSem::block() {
    80002d44:	ff010113          	addi	sp,sp,-16
    80002d48:	00113423          	sd	ra,8(sp)
    80002d4c:	00813023          	sd	s0,0(sp)
    80002d50:	01010413          	addi	s0,sp,16
	TCB::running->setBlocked(true);
    80002d54:	00009797          	auipc	a5,0x9
    80002d58:	c847b783          	ld	a5,-892(a5) # 8000b9d8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002d5c:	0007b583          	ld	a1,0(a5)
	void setBlocked(bool block) { this->blocked = block; }
    80002d60:	00100793          	li	a5,1
    80002d64:	02f588a3          	sb	a5,49(a1)
	blocked.putLast(TCB::running);
    80002d68:	00850513          	addi	a0,a0,8
    80002d6c:	ffffe097          	auipc	ra,0xffffe
    80002d70:	4d8080e7          	jalr	1240(ra) # 80001244 <_ZN11ThreadQueue7putLastEP3TCB>
	TCB::yield();
    80002d74:	00000097          	auipc	ra,0x0
    80002d78:	a00080e7          	jalr	-1536(ra) # 80002774 <_ZN3TCB5yieldEv>
}
    80002d7c:	00813083          	ld	ra,8(sp)
    80002d80:	00013403          	ld	s0,0(sp)
    80002d84:	01010113          	addi	sp,sp,16
    80002d88:	00008067          	ret

0000000080002d8c <_ZN4KSem4waitEv>:
int KSem::wait() {
    80002d8c:	fe010113          	addi	sp,sp,-32
    80002d90:	00113c23          	sd	ra,24(sp)
    80002d94:	00813823          	sd	s0,16(sp)
    80002d98:	00913423          	sd	s1,8(sp)
    80002d9c:	02010413          	addi	s0,sp,32
    80002da0:	00050493          	mv	s1,a0
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    80002da4:	00100593          	li	a1,1
    80002da8:	00000097          	auipc	ra,0x0
    80002dac:	ed4080e7          	jalr	-300(ra) # 80002c7c <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>
    80002db0:	04050663          	beqz	a0,80002dfc <_ZN4KSem4waitEv+0x70>
	if (!working) return -3;
    80002db4:	0184c783          	lbu	a5,24(s1)
    80002db8:	04078663          	beqz	a5,80002e04 <_ZN4KSem4waitEv+0x78>
	if (--val < 0) {
    80002dbc:	0004a783          	lw	a5,0(s1)
    80002dc0:	fff7879b          	addiw	a5,a5,-1
    80002dc4:	00f4a023          	sw	a5,0(s1)
    80002dc8:	02079713          	slli	a4,a5,0x20
    80002dcc:	00074e63          	bltz	a4,80002de8 <_ZN4KSem4waitEv+0x5c>
	return 0;
    80002dd0:	00000513          	li	a0,0
}
    80002dd4:	01813083          	ld	ra,24(sp)
    80002dd8:	01013403          	ld	s0,16(sp)
    80002ddc:	00813483          	ld	s1,8(sp)
    80002de0:	02010113          	addi	sp,sp,32
    80002de4:	00008067          	ret
		block();
    80002de8:	00048513          	mv	a0,s1
    80002dec:	00000097          	auipc	ra,0x0
    80002df0:	f58080e7          	jalr	-168(ra) # 80002d44 <_ZN4KSem5blockEv>
		return -1;
    80002df4:	fff00513          	li	a0,-1
    80002df8:	fddff06f          	j	80002dd4 <_ZN4KSem4waitEv+0x48>
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    80002dfc:	ffe00513          	li	a0,-2
    80002e00:	fd5ff06f          	j	80002dd4 <_ZN4KSem4waitEv+0x48>
	if (!working) return -3;
    80002e04:	ffd00513          	li	a0,-3
    80002e08:	fcdff06f          	j	80002dd4 <_ZN4KSem4waitEv+0x48>

0000000080002e0c <_ZN4KSem7unblockEv>:

void KSem::unblock() {
    80002e0c:	ff010113          	addi	sp,sp,-16
    80002e10:	00113423          	sd	ra,8(sp)
    80002e14:	00813023          	sd	s0,0(sp)
    80002e18:	01010413          	addi	s0,sp,16
	TCB* tcb = blocked.getFirst();
    80002e1c:	00850513          	addi	a0,a0,8
    80002e20:	ffffe097          	auipc	ra,0xffffe
    80002e24:	490080e7          	jalr	1168(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
    80002e28:	020508a3          	sb	zero,49(a0)
	tcb->setBlocked(false);
	Scheduler::put(tcb);
    80002e2c:	fffff097          	auipc	ra,0xfffff
    80002e30:	834080e7          	jalr	-1996(ra) # 80001660 <_ZN9Scheduler3putEP3TCB>
}
    80002e34:	00813083          	ld	ra,8(sp)
    80002e38:	00013403          	ld	s0,0(sp)
    80002e3c:	01010113          	addi	sp,sp,16
    80002e40:	00008067          	ret

0000000080002e44 <_ZN4KSem6signalEv>:
int KSem::signal() {
    80002e44:	fe010113          	addi	sp,sp,-32
    80002e48:	00113c23          	sd	ra,24(sp)
    80002e4c:	00813823          	sd	s0,16(sp)
    80002e50:	00913423          	sd	s1,8(sp)
    80002e54:	02010413          	addi	s0,sp,32
    80002e58:	00050493          	mv	s1,a0
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    80002e5c:	00100593          	li	a1,1
    80002e60:	00000097          	auipc	ra,0x0
    80002e64:	e1c080e7          	jalr	-484(ra) # 80002c7c <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>
    80002e68:	04050463          	beqz	a0,80002eb0 <_ZN4KSem6signalEv+0x6c>
	if (!working) return -3;
    80002e6c:	0184c783          	lbu	a5,24(s1)
    80002e70:	04078463          	beqz	a5,80002eb8 <_ZN4KSem6signalEv+0x74>
	if (val++ < 0) unblock();
    80002e74:	0004a783          	lw	a5,0(s1)
    80002e78:	0017871b          	addiw	a4,a5,1
    80002e7c:	00e4a023          	sw	a4,0(s1)
    80002e80:	0007ce63          	bltz	a5,80002e9c <_ZN4KSem6signalEv+0x58>
	return 0;
    80002e84:	00000513          	li	a0,0
}
    80002e88:	01813083          	ld	ra,24(sp)
    80002e8c:	01013403          	ld	s0,16(sp)
    80002e90:	00813483          	ld	s1,8(sp)
    80002e94:	02010113          	addi	sp,sp,32
    80002e98:	00008067          	ret
	if (val++ < 0) unblock();
    80002e9c:	00048513          	mv	a0,s1
    80002ea0:	00000097          	auipc	ra,0x0
    80002ea4:	f6c080e7          	jalr	-148(ra) # 80002e0c <_ZN4KSem7unblockEv>
	return 0;
    80002ea8:	00000513          	li	a0,0
    80002eac:	fddff06f          	j	80002e88 <_ZN4KSem6signalEv+0x44>
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    80002eb0:	ffe00513          	li	a0,-2
    80002eb4:	fd5ff06f          	j	80002e88 <_ZN4KSem6signalEv+0x44>
	if (!working) return -3;
    80002eb8:	ffd00513          	li	a0,-3
    80002ebc:	fcdff06f          	j	80002e88 <_ZN4KSem6signalEv+0x44>

0000000080002ec0 <_ZN4KSem8closeSemEPS_>:

int KSem::closeSem(sem_t handle) {
    80002ec0:	fe010113          	addi	sp,sp,-32
    80002ec4:	00113c23          	sd	ra,24(sp)
    80002ec8:	00813823          	sd	s0,16(sp)
    80002ecc:	00913423          	sd	s1,8(sp)
    80002ed0:	02010413          	addi	s0,sp,32
    80002ed4:	00050493          	mv	s1,a0
	if (!MemoryAllocator::checkPurpose(handle, MemoryAllocator::SEMAPHORE)) return -2;
    80002ed8:	00100593          	li	a1,1
    80002edc:	00000097          	auipc	ra,0x0
    80002ee0:	da0080e7          	jalr	-608(ra) # 80002c7c <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>
    80002ee4:	04050263          	beqz	a0,80002f28 <_ZN4KSem8closeSemEPS_+0x68>
	handle->working = false;
    80002ee8:	00048c23          	sb	zero,24(s1)
    80002eec:	01c0006f          	j	80002f08 <_ZN4KSem8closeSemEPS_+0x48>
	while (!handle->blocked.isEmpty()) {
		TCB* tcb = handle->blocked.getFirst();
    80002ef0:	00848513          	addi	a0,s1,8
    80002ef4:	ffffe097          	auipc	ra,0xffffe
    80002ef8:	3bc080e7          	jalr	956(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
    80002efc:	020508a3          	sb	zero,49(a0)
		tcb->setBlocked(false);
		Scheduler::put(tcb);
    80002f00:	ffffe097          	auipc	ra,0xffffe
    80002f04:	760080e7          	jalr	1888(ra) # 80001660 <_ZN9Scheduler3putEP3TCB>
		return front == nullptr;
    80002f08:	0084b783          	ld	a5,8(s1)
	while (!handle->blocked.isEmpty()) {
    80002f0c:	fe0792e3          	bnez	a5,80002ef0 <_ZN4KSem8closeSemEPS_+0x30>
	}
	return 0;
    80002f10:	00000513          	li	a0,0
}
    80002f14:	01813083          	ld	ra,24(sp)
    80002f18:	01013403          	ld	s0,16(sp)
    80002f1c:	00813483          	ld	s1,8(sp)
    80002f20:	02010113          	addi	sp,sp,32
    80002f24:	00008067          	ret
	if (!MemoryAllocator::checkPurpose(handle, MemoryAllocator::SEMAPHORE)) return -2;
    80002f28:	ffe00513          	li	a0,-2
    80002f2c:	fe9ff06f          	j	80002f14 <_ZN4KSem8closeSemEPS_+0x54>

0000000080002f30 <_Z12printIntegeri>:
#include "../h/TCB.hpp"
#include "../h/ThreadQueue.hpp"
//#include "../h/KSem.hpp"

#include "../test/printing.hpp"
void printInteger(int i){
    80002f30:	ff010113          	addi	sp,sp,-16
    80002f34:	00113423          	sd	ra,8(sp)
    80002f38:	00813023          	sd	s0,0(sp)
    80002f3c:	01010413          	addi	s0,sp,16
	printInt(i);
    80002f40:	00000613          	li	a2,0
    80002f44:	00a00593          	li	a1,10
    80002f48:	00003097          	auipc	ra,0x3
    80002f4c:	8f0080e7          	jalr	-1808(ra) # 80005838 <_Z8printIntiii>
}
    80002f50:	00813083          	ld	ra,8(sp)
    80002f54:	00013403          	ld	s0,0(sp)
    80002f58:	01010113          	addi	sp,sp,16
    80002f5c:	00008067          	ret

0000000080002f60 <_Z10testMemoryv>:
extern Semaphore* semA;

void testMemory() {
    80002f60:	81010113          	addi	sp,sp,-2032
    80002f64:	7e113423          	sd	ra,2024(sp)
    80002f68:	7e813023          	sd	s0,2016(sp)
    80002f6c:	7c913c23          	sd	s1,2008(sp)
    80002f70:	7f010413          	addi	s0,sp,2032
    80002f74:	83010113          	addi	sp,sp,-2000
	const uint64 NumAllocations = 500;    //zasto nece za preko 500????
	const uint64 AllocationSize = 16;

	// Allocate and initialize pointers
	int* allocations[NumAllocations];
	for (uint64 i = 0; i < NumAllocations; ++i)
    80002f78:	00000713          	li	a4,0
    80002f7c:	1f300793          	li	a5,499
    80002f80:	02e7e263          	bltu	a5,a4,80002fa4 <_Z10testMemoryv+0x44>
		allocations[i] = nullptr;
    80002f84:	fffff7b7          	lui	a5,0xfffff
    80002f88:	00371693          	slli	a3,a4,0x3
    80002f8c:	fe040613          	addi	a2,s0,-32
    80002f90:	00f607b3          	add	a5,a2,a5
    80002f94:	00d787b3          	add	a5,a5,a3
    80002f98:	0607b023          	sd	zero,96(a5) # fffffffffffff060 <end+0xffffffff7fff2330>
	for (uint64 i = 0; i < NumAllocations; ++i)
    80002f9c:	00170713          	addi	a4,a4,1
    80002fa0:	fddff06f          	j	80002f7c <_Z10testMemoryv+0x1c>

	// Allocate memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80002fa4:	00000493          	li	s1,0
    80002fa8:	1f300793          	li	a5,499
    80002fac:	0297ec63          	bltu	a5,s1,80002fe4 <_Z10testMemoryv+0x84>
		allocations[i] = static_cast<int*>(MemoryAllocator::kmalloc(AllocationSize, MemoryAllocator::MISC));
    80002fb0:	00300593          	li	a1,3
    80002fb4:	01000513          	li	a0,16
    80002fb8:	00000097          	auipc	ra,0x0
    80002fbc:	9f8080e7          	jalr	-1544(ra) # 800029b0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
    80002fc0:	fffff737          	lui	a4,0xfffff
    80002fc4:	00349793          	slli	a5,s1,0x3
    80002fc8:	fe040693          	addi	a3,s0,-32
    80002fcc:	00e68733          	add	a4,a3,a4
    80002fd0:	00f707b3          	add	a5,a4,a5
    80002fd4:	06a7b023          	sd	a0,96(a5)
		if (allocations[i] == nullptr) {
    80002fd8:	00050663          	beqz	a0,80002fe4 <_Z10testMemoryv+0x84>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80002fdc:	00148493          	addi	s1,s1,1
    80002fe0:	fc9ff06f          	j	80002fa8 <_Z10testMemoryv+0x48>
    80002fe4:	00000493          	li	s1,0
    80002fe8:	0100006f          	j	80002ff8 <_Z10testMemoryv+0x98>
	}

	// Free memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
		if (allocations[i] != nullptr) {
			if (MemoryAllocator::kfree(allocations[i]) != 0) {
    80002fec:	00000097          	auipc	ra,0x0
    80002ff0:	b70080e7          	jalr	-1168(ra) # 80002b5c <_ZN15MemoryAllocator5kfreeEPv>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80002ff4:	00148493          	addi	s1,s1,1
    80002ff8:	1f300793          	li	a5,499
    80002ffc:	0297e263          	bltu	a5,s1,80003020 <_Z10testMemoryv+0xc0>
		if (allocations[i] != nullptr) {
    80003000:	fffff737          	lui	a4,0xfffff
    80003004:	00349793          	slli	a5,s1,0x3
    80003008:	fe040693          	addi	a3,s0,-32
    8000300c:	00e68733          	add	a4,a3,a4
    80003010:	00f707b3          	add	a5,a4,a5
    80003014:	0607b503          	ld	a0,96(a5)
    80003018:	fc051ae3          	bnez	a0,80002fec <_Z10testMemoryv+0x8c>
    8000301c:	fd9ff06f          	j	80002ff4 <_Z10testMemoryv+0x94>
//				printString("\nDeallocation failed for index ");
//				printInteger(i);
			}
		}
	}
}
    80003020:	7d010113          	addi	sp,sp,2000
    80003024:	7e813083          	ld	ra,2024(sp)
    80003028:	7e013403          	ld	s0,2016(sp)
    8000302c:	7d813483          	ld	s1,2008(sp)
    80003030:	7f010113          	addi	sp,sp,2032
    80003034:	00008067          	ret

0000000080003038 <_Z5nit1fPv>:

void nit1f(void*) {
    80003038:	fe010113          	addi	sp,sp,-32
    8000303c:	00113c23          	sd	ra,24(sp)
    80003040:	00813823          	sd	s0,16(sp)
    80003044:	00913423          	sd	s1,8(sp)
    80003048:	01213023          	sd	s2,0(sp)
    8000304c:	02010413          	addi	s0,sp,32
	for(int i=0;i<3;i++){
    80003050:	00000913          	li	s2,0
    80003054:	0440006f          	j	80003098 <_Z5nit1fPv+0x60>
		int res = (*semA).wait();
		if(res){
			printString("\nNit 1 cekala na semaforu\n");
		}
		else{
			printString("\nNit 1 nije cekala\n");
    80003058:	00006517          	auipc	a0,0x6
    8000305c:	17050513          	addi	a0,a0,368 # 800091c8 <CONSOLE_STATUS+0x1b8>
    80003060:	00002097          	auipc	ra,0x2
    80003064:	628080e7          	jalr	1576(ra) # 80005688 <_Z11printStringPKc>
		}
		printString("\nsem_wait za nit 1 vratio ");
    80003068:	00006517          	auipc	a0,0x6
    8000306c:	17850513          	addi	a0,a0,376 # 800091e0 <CONSOLE_STATUS+0x1d0>
    80003070:	00002097          	auipc	ra,0x2
    80003074:	618080e7          	jalr	1560(ra) # 80005688 <_Z11printStringPKc>
		printInteger(res);
    80003078:	00048513          	mv	a0,s1
    8000307c:	00000097          	auipc	ra,0x0
    80003080:	eb4080e7          	jalr	-332(ra) # 80002f30 <_Z12printIntegeri>
		printString("\n");
    80003084:	00006517          	auipc	a0,0x6
    80003088:	53450513          	addi	a0,a0,1332 # 800095b8 <CONSOLE_STATUS+0x5a8>
    8000308c:	00002097          	auipc	ra,0x2
    80003090:	5fc080e7          	jalr	1532(ra) # 80005688 <_Z11printStringPKc>
	for(int i=0;i<3;i++){
    80003094:	0019091b          	addiw	s2,s2,1
    80003098:	00200793          	li	a5,2
    8000309c:	0527c263          	blt	a5,s2,800030e0 <_Z5nit1fPv+0xa8>
		printString("\nNit 1 dolazi na semafor\n");
    800030a0:	00006517          	auipc	a0,0x6
    800030a4:	0e850513          	addi	a0,a0,232 # 80009188 <CONSOLE_STATUS+0x178>
    800030a8:	00002097          	auipc	ra,0x2
    800030ac:	5e0080e7          	jalr	1504(ra) # 80005688 <_Z11printStringPKc>
		int res = (*semA).wait();
    800030b0:	00009797          	auipc	a5,0x9
    800030b4:	9087b783          	ld	a5,-1784(a5) # 8000b9b8 <_GLOBAL_OFFSET_TABLE_+0x10>
    800030b8:	0007b503          	ld	a0,0(a5)
    800030bc:	fffff097          	auipc	ra,0xfffff
    800030c0:	438080e7          	jalr	1080(ra) # 800024f4 <_ZN9Semaphore4waitEv>
    800030c4:	00050493          	mv	s1,a0
		if(res){
    800030c8:	f80508e3          	beqz	a0,80003058 <_Z5nit1fPv+0x20>
			printString("\nNit 1 cekala na semaforu\n");
    800030cc:	00006517          	auipc	a0,0x6
    800030d0:	0dc50513          	addi	a0,a0,220 # 800091a8 <CONSOLE_STATUS+0x198>
    800030d4:	00002097          	auipc	ra,0x2
    800030d8:	5b4080e7          	jalr	1460(ra) # 80005688 <_Z11printStringPKc>
    800030dc:	f8dff06f          	j	80003068 <_Z5nit1fPv+0x30>
	}

	printString("\nGotova nit 1\n");
    800030e0:	00006517          	auipc	a0,0x6
    800030e4:	12050513          	addi	a0,a0,288 # 80009200 <CONSOLE_STATUS+0x1f0>
    800030e8:	00002097          	auipc	ra,0x2
    800030ec:	5a0080e7          	jalr	1440(ra) # 80005688 <_Z11printStringPKc>
}
    800030f0:	01813083          	ld	ra,24(sp)
    800030f4:	01013403          	ld	s0,16(sp)
    800030f8:	00813483          	ld	s1,8(sp)
    800030fc:	00013903          	ld	s2,0(sp)
    80003100:	02010113          	addi	sp,sp,32
    80003104:	00008067          	ret

0000000080003108 <_Z5nit2fPv>:

void nit2f(void* arg2) {
    80003108:	fd010113          	addi	sp,sp,-48
    8000310c:	02113423          	sd	ra,40(sp)
    80003110:	02813023          	sd	s0,32(sp)
    80003114:	00913c23          	sd	s1,24(sp)
    80003118:	01213823          	sd	s2,16(sp)
    8000311c:	01313423          	sd	s3,8(sp)
    80003120:	03010413          	addi	s0,sp,48
	for(int i=0;i<3;i++){
    80003124:	00000913          	li	s2,0
    80003128:	0080006f          	j	80003130 <_Z5nit2fPv+0x28>
    8000312c:	0019091b          	addiw	s2,s2,1
    80003130:	00200793          	li	a5,2
    80003134:	0927c063          	blt	a5,s2,800031b4 <_Z5nit2fPv+0xac>
		printString("\nNit 2 daje signal\n");
    80003138:	00006517          	auipc	a0,0x6
    8000313c:	0d850513          	addi	a0,a0,216 # 80009210 <CONSOLE_STATUS+0x200>
    80003140:	00002097          	auipc	ra,0x2
    80003144:	548080e7          	jalr	1352(ra) # 80005688 <_Z11printStringPKc>
		//sem_signal(semA);
		int res = (*semA).signal();
    80003148:	00009997          	auipc	s3,0x9
    8000314c:	8709b983          	ld	s3,-1936(s3) # 8000b9b8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80003150:	0009b503          	ld	a0,0(s3)
    80003154:	fffff097          	auipc	ra,0xfffff
    80003158:	3cc080e7          	jalr	972(ra) # 80002520 <_ZN9Semaphore6signalEv>
    8000315c:	00050493          	mv	s1,a0
		printString("\nPovratna vrednost signala je ");
    80003160:	00006517          	auipc	a0,0x6
    80003164:	0c850513          	addi	a0,a0,200 # 80009228 <CONSOLE_STATUS+0x218>
    80003168:	00002097          	auipc	ra,0x2
    8000316c:	520080e7          	jalr	1312(ra) # 80005688 <_Z11printStringPKc>
		printInteger(res);
    80003170:	00048513          	mv	a0,s1
    80003174:	00000097          	auipc	ra,0x0
    80003178:	dbc080e7          	jalr	-580(ra) # 80002f30 <_Z12printIntegeri>
		printString("\n");
    8000317c:	00006517          	auipc	a0,0x6
    80003180:	43c50513          	addi	a0,a0,1084 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80003184:	00002097          	auipc	ra,0x2
    80003188:	504080e7          	jalr	1284(ra) # 80005688 <_Z11printStringPKc>
		//sem_close(semA);
		printString("\nNit 2 ubija semafor\n");
    8000318c:	00006517          	auipc	a0,0x6
    80003190:	0bc50513          	addi	a0,a0,188 # 80009248 <CONSOLE_STATUS+0x238>
    80003194:	00002097          	auipc	ra,0x2
    80003198:	4f4080e7          	jalr	1268(ra) # 80005688 <_Z11printStringPKc>
		delete semA;
    8000319c:	0009b503          	ld	a0,0(s3)
    800031a0:	f80506e3          	beqz	a0,8000312c <_Z5nit2fPv+0x24>
    800031a4:	00053783          	ld	a5,0(a0)
    800031a8:	0087b783          	ld	a5,8(a5)
    800031ac:	000780e7          	jalr	a5
    800031b0:	f7dff06f          	j	8000312c <_Z5nit2fPv+0x24>

	}
	printString("\nGotova nit 2\n");
    800031b4:	00006517          	auipc	a0,0x6
    800031b8:	0ac50513          	addi	a0,a0,172 # 80009260 <CONSOLE_STATUS+0x250>
    800031bc:	00002097          	auipc	ra,0x2
    800031c0:	4cc080e7          	jalr	1228(ra) # 80005688 <_Z11printStringPKc>
}
    800031c4:	02813083          	ld	ra,40(sp)
    800031c8:	02013403          	ld	s0,32(sp)
    800031cc:	01813483          	ld	s1,24(sp)
    800031d0:	01013903          	ld	s2,16(sp)
    800031d4:	00813983          	ld	s3,8(sp)
    800031d8:	03010113          	addi	sp,sp,48
    800031dc:	00008067          	ret

00000000800031e0 <_Z5nit3fPv>:


void nit3f(void*) {
    800031e0:	ff010113          	addi	sp,sp,-16
    800031e4:	00113423          	sd	ra,8(sp)
    800031e8:	00813023          	sd	s0,0(sp)
    800031ec:	01010413          	addi	s0,sp,16
//		printString("\n");
//		sem_wait(semA);
//		printString("Nit 3 prosla semafor\n");
//		time_sleep(10);
//	}
	printString("\nGotova nit3\n");
    800031f0:	00006517          	auipc	a0,0x6
    800031f4:	08050513          	addi	a0,a0,128 # 80009270 <CONSOLE_STATUS+0x260>
    800031f8:	00002097          	auipc	ra,0x2
    800031fc:	490080e7          	jalr	1168(ra) # 80005688 <_Z11printStringPKc>
    80003200:	00813083          	ld	ra,8(sp)
    80003204:	00013403          	ld	s0,0(sp)
    80003208:	01010113          	addi	sp,sp,16
    8000320c:	00008067          	ret

0000000080003210 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80003210:	fe010113          	addi	sp,sp,-32
    80003214:	00113c23          	sd	ra,24(sp)
    80003218:	00813823          	sd	s0,16(sp)
    8000321c:	00913423          	sd	s1,8(sp)
    80003220:	01213023          	sd	s2,0(sp)
    80003224:	02010413          	addi	s0,sp,32
    80003228:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    8000322c:	00000913          	li	s2,0
    80003230:	00c0006f          	j	8000323c <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003234:	ffffe097          	auipc	ra,0xffffe
    80003238:	1f4080e7          	jalr	500(ra) # 80001428 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
    8000323c:	ffffe097          	auipc	ra,0xffffe
    80003240:	32c080e7          	jalr	812(ra) # 80001568 <_Z4getcv>
    80003244:	0005059b          	sext.w	a1,a0
    80003248:	02d00793          	li	a5,45
    8000324c:	02f58a63          	beq	a1,a5,80003280 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80003250:	0084b503          	ld	a0,8(s1)
    80003254:	00003097          	auipc	ra,0x3
    80003258:	400080e7          	jalr	1024(ra) # 80006654 <_ZN6Buffer3putEi>
        i++;
    8000325c:	0019071b          	addiw	a4,s2,1
    80003260:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003264:	0004a683          	lw	a3,0(s1)
    80003268:	0026979b          	slliw	a5,a3,0x2
    8000326c:	00d787bb          	addw	a5,a5,a3
    80003270:	0017979b          	slliw	a5,a5,0x1
    80003274:	02f767bb          	remw	a5,a4,a5
    80003278:	fc0792e3          	bnez	a5,8000323c <_ZL16producerKeyboardPv+0x2c>
    8000327c:	fb9ff06f          	j	80003234 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80003280:	00100793          	li	a5,1
    80003284:	00008717          	auipc	a4,0x8
    80003288:	7ef72a23          	sw	a5,2036(a4) # 8000ba78 <_ZL9threadEnd>
    data->buffer->put('!');
    8000328c:	02100593          	li	a1,33
    80003290:	0084b503          	ld	a0,8(s1)
    80003294:	00003097          	auipc	ra,0x3
    80003298:	3c0080e7          	jalr	960(ra) # 80006654 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    8000329c:	0104b503          	ld	a0,16(s1)
    800032a0:	ffffe097          	auipc	ra,0xffffe
    800032a4:	298080e7          	jalr	664(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    800032a8:	01813083          	ld	ra,24(sp)
    800032ac:	01013403          	ld	s0,16(sp)
    800032b0:	00813483          	ld	s1,8(sp)
    800032b4:	00013903          	ld	s2,0(sp)
    800032b8:	02010113          	addi	sp,sp,32
    800032bc:	00008067          	ret

00000000800032c0 <_ZL8producerPv>:

static void producer(void *arg) {
    800032c0:	fe010113          	addi	sp,sp,-32
    800032c4:	00113c23          	sd	ra,24(sp)
    800032c8:	00813823          	sd	s0,16(sp)
    800032cc:	00913423          	sd	s1,8(sp)
    800032d0:	01213023          	sd	s2,0(sp)
    800032d4:	02010413          	addi	s0,sp,32
    800032d8:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800032dc:	00000913          	li	s2,0
    800032e0:	00c0006f          	j	800032ec <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    800032e4:	ffffe097          	auipc	ra,0xffffe
    800032e8:	144080e7          	jalr	324(ra) # 80001428 <_Z15thread_dispatchv>
    while (!threadEnd) {
    800032ec:	00008797          	auipc	a5,0x8
    800032f0:	78c7a783          	lw	a5,1932(a5) # 8000ba78 <_ZL9threadEnd>
    800032f4:	02079e63          	bnez	a5,80003330 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    800032f8:	0004a583          	lw	a1,0(s1)
    800032fc:	0305859b          	addiw	a1,a1,48
    80003300:	0084b503          	ld	a0,8(s1)
    80003304:	00003097          	auipc	ra,0x3
    80003308:	350080e7          	jalr	848(ra) # 80006654 <_ZN6Buffer3putEi>
        i++;
    8000330c:	0019071b          	addiw	a4,s2,1
    80003310:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003314:	0004a683          	lw	a3,0(s1)
    80003318:	0026979b          	slliw	a5,a3,0x2
    8000331c:	00d787bb          	addw	a5,a5,a3
    80003320:	0017979b          	slliw	a5,a5,0x1
    80003324:	02f767bb          	remw	a5,a4,a5
    80003328:	fc0792e3          	bnez	a5,800032ec <_ZL8producerPv+0x2c>
    8000332c:	fb9ff06f          	j	800032e4 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80003330:	0104b503          	ld	a0,16(s1)
    80003334:	ffffe097          	auipc	ra,0xffffe
    80003338:	204080e7          	jalr	516(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    8000333c:	01813083          	ld	ra,24(sp)
    80003340:	01013403          	ld	s0,16(sp)
    80003344:	00813483          	ld	s1,8(sp)
    80003348:	00013903          	ld	s2,0(sp)
    8000334c:	02010113          	addi	sp,sp,32
    80003350:	00008067          	ret

0000000080003354 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80003354:	fd010113          	addi	sp,sp,-48
    80003358:	02113423          	sd	ra,40(sp)
    8000335c:	02813023          	sd	s0,32(sp)
    80003360:	00913c23          	sd	s1,24(sp)
    80003364:	01213823          	sd	s2,16(sp)
    80003368:	01313423          	sd	s3,8(sp)
    8000336c:	03010413          	addi	s0,sp,48
    80003370:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003374:	00000993          	li	s3,0
    80003378:	01c0006f          	j	80003394 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    8000337c:	ffffe097          	auipc	ra,0xffffe
    80003380:	0ac080e7          	jalr	172(ra) # 80001428 <_Z15thread_dispatchv>
    80003384:	0500006f          	j	800033d4 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80003388:	00a00513          	li	a0,10
    8000338c:	ffffe097          	auipc	ra,0xffffe
    80003390:	204080e7          	jalr	516(ra) # 80001590 <_Z4putcc>
    while (!threadEnd) {
    80003394:	00008797          	auipc	a5,0x8
    80003398:	6e47a783          	lw	a5,1764(a5) # 8000ba78 <_ZL9threadEnd>
    8000339c:	06079063          	bnez	a5,800033fc <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    800033a0:	00893503          	ld	a0,8(s2)
    800033a4:	00003097          	auipc	ra,0x3
    800033a8:	340080e7          	jalr	832(ra) # 800066e4 <_ZN6Buffer3getEv>
        i++;
    800033ac:	0019849b          	addiw	s1,s3,1
    800033b0:	0004899b          	sext.w	s3,s1
        putc(key);
    800033b4:	0ff57513          	andi	a0,a0,255
    800033b8:	ffffe097          	auipc	ra,0xffffe
    800033bc:	1d8080e7          	jalr	472(ra) # 80001590 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    800033c0:	00092703          	lw	a4,0(s2)
    800033c4:	0027179b          	slliw	a5,a4,0x2
    800033c8:	00e787bb          	addw	a5,a5,a4
    800033cc:	02f4e7bb          	remw	a5,s1,a5
    800033d0:	fa0786e3          	beqz	a5,8000337c <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    800033d4:	05000793          	li	a5,80
    800033d8:	02f4e4bb          	remw	s1,s1,a5
    800033dc:	fa049ce3          	bnez	s1,80003394 <_ZL8consumerPv+0x40>
    800033e0:	fa9ff06f          	j	80003388 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    800033e4:	00893503          	ld	a0,8(s2)
    800033e8:	00003097          	auipc	ra,0x3
    800033ec:	2fc080e7          	jalr	764(ra) # 800066e4 <_ZN6Buffer3getEv>
        putc(key);
    800033f0:	0ff57513          	andi	a0,a0,255
    800033f4:	ffffe097          	auipc	ra,0xffffe
    800033f8:	19c080e7          	jalr	412(ra) # 80001590 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    800033fc:	00893503          	ld	a0,8(s2)
    80003400:	00003097          	auipc	ra,0x3
    80003404:	370080e7          	jalr	880(ra) # 80006770 <_ZN6Buffer6getCntEv>
    80003408:	fca04ee3          	bgtz	a0,800033e4 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    8000340c:	01093503          	ld	a0,16(s2)
    80003410:	ffffe097          	auipc	ra,0xffffe
    80003414:	128080e7          	jalr	296(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    80003418:	02813083          	ld	ra,40(sp)
    8000341c:	02013403          	ld	s0,32(sp)
    80003420:	01813483          	ld	s1,24(sp)
    80003424:	01013903          	ld	s2,16(sp)
    80003428:	00813983          	ld	s3,8(sp)
    8000342c:	03010113          	addi	sp,sp,48
    80003430:	00008067          	ret

0000000080003434 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80003434:	f9010113          	addi	sp,sp,-112
    80003438:	06113423          	sd	ra,104(sp)
    8000343c:	06813023          	sd	s0,96(sp)
    80003440:	04913c23          	sd	s1,88(sp)
    80003444:	05213823          	sd	s2,80(sp)
    80003448:	05313423          	sd	s3,72(sp)
    8000344c:	05413023          	sd	s4,64(sp)
    80003450:	03513c23          	sd	s5,56(sp)
    80003454:	03613823          	sd	s6,48(sp)
    80003458:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    8000345c:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80003460:	00006517          	auipc	a0,0x6
    80003464:	e2050513          	addi	a0,a0,-480 # 80009280 <CONSOLE_STATUS+0x270>
    80003468:	00002097          	auipc	ra,0x2
    8000346c:	220080e7          	jalr	544(ra) # 80005688 <_Z11printStringPKc>
    getString(input, 30);
    80003470:	01e00593          	li	a1,30
    80003474:	fa040493          	addi	s1,s0,-96
    80003478:	00048513          	mv	a0,s1
    8000347c:	00002097          	auipc	ra,0x2
    80003480:	294080e7          	jalr	660(ra) # 80005710 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80003484:	00048513          	mv	a0,s1
    80003488:	00002097          	auipc	ra,0x2
    8000348c:	360080e7          	jalr	864(ra) # 800057e8 <_Z11stringToIntPKc>
    80003490:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80003494:	00006517          	auipc	a0,0x6
    80003498:	e0c50513          	addi	a0,a0,-500 # 800092a0 <CONSOLE_STATUS+0x290>
    8000349c:	00002097          	auipc	ra,0x2
    800034a0:	1ec080e7          	jalr	492(ra) # 80005688 <_Z11printStringPKc>
    getString(input, 30);
    800034a4:	01e00593          	li	a1,30
    800034a8:	00048513          	mv	a0,s1
    800034ac:	00002097          	auipc	ra,0x2
    800034b0:	264080e7          	jalr	612(ra) # 80005710 <_Z9getStringPci>
    n = stringToInt(input);
    800034b4:	00048513          	mv	a0,s1
    800034b8:	00002097          	auipc	ra,0x2
    800034bc:	330080e7          	jalr	816(ra) # 800057e8 <_Z11stringToIntPKc>
    800034c0:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    800034c4:	00006517          	auipc	a0,0x6
    800034c8:	dfc50513          	addi	a0,a0,-516 # 800092c0 <CONSOLE_STATUS+0x2b0>
    800034cc:	00002097          	auipc	ra,0x2
    800034d0:	1bc080e7          	jalr	444(ra) # 80005688 <_Z11printStringPKc>
    800034d4:	00000613          	li	a2,0
    800034d8:	00a00593          	li	a1,10
    800034dc:	00090513          	mv	a0,s2
    800034e0:	00002097          	auipc	ra,0x2
    800034e4:	358080e7          	jalr	856(ra) # 80005838 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    800034e8:	00006517          	auipc	a0,0x6
    800034ec:	df050513          	addi	a0,a0,-528 # 800092d8 <CONSOLE_STATUS+0x2c8>
    800034f0:	00002097          	auipc	ra,0x2
    800034f4:	198080e7          	jalr	408(ra) # 80005688 <_Z11printStringPKc>
    800034f8:	00000613          	li	a2,0
    800034fc:	00a00593          	li	a1,10
    80003500:	00048513          	mv	a0,s1
    80003504:	00002097          	auipc	ra,0x2
    80003508:	334080e7          	jalr	820(ra) # 80005838 <_Z8printIntiii>
    printString(".\n");
    8000350c:	00006517          	auipc	a0,0x6
    80003510:	de450513          	addi	a0,a0,-540 # 800092f0 <CONSOLE_STATUS+0x2e0>
    80003514:	00002097          	auipc	ra,0x2
    80003518:	174080e7          	jalr	372(ra) # 80005688 <_Z11printStringPKc>
    if(threadNum > n) {
    8000351c:	0324c463          	blt	s1,s2,80003544 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80003520:	03205c63          	blez	s2,80003558 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80003524:	03800513          	li	a0,56
    80003528:	fffff097          	auipc	ra,0xfffff
    8000352c:	ca0080e7          	jalr	-864(ra) # 800021c8 <_Znwm>
    80003530:	00050a13          	mv	s4,a0
    80003534:	00048593          	mv	a1,s1
    80003538:	00003097          	auipc	ra,0x3
    8000353c:	080080e7          	jalr	128(ra) # 800065b8 <_ZN6BufferC1Ei>
    80003540:	0300006f          	j	80003570 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80003544:	00006517          	auipc	a0,0x6
    80003548:	db450513          	addi	a0,a0,-588 # 800092f8 <CONSOLE_STATUS+0x2e8>
    8000354c:	00002097          	auipc	ra,0x2
    80003550:	13c080e7          	jalr	316(ra) # 80005688 <_Z11printStringPKc>
        return;
    80003554:	0140006f          	j	80003568 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80003558:	00006517          	auipc	a0,0x6
    8000355c:	de050513          	addi	a0,a0,-544 # 80009338 <CONSOLE_STATUS+0x328>
    80003560:	00002097          	auipc	ra,0x2
    80003564:	128080e7          	jalr	296(ra) # 80005688 <_Z11printStringPKc>
        return;
    80003568:	000b0113          	mv	sp,s6
    8000356c:	1500006f          	j	800036bc <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80003570:	00000593          	li	a1,0
    80003574:	00008517          	auipc	a0,0x8
    80003578:	50c50513          	addi	a0,a0,1292 # 8000ba80 <_ZL10waitForAll>
    8000357c:	ffffe097          	auipc	ra,0xffffe
    80003580:	f24080e7          	jalr	-220(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    thread_t threads[threadNum];
    80003584:	00391793          	slli	a5,s2,0x3
    80003588:	00f78793          	addi	a5,a5,15
    8000358c:	ff07f793          	andi	a5,a5,-16
    80003590:	40f10133          	sub	sp,sp,a5
    80003594:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80003598:	0019071b          	addiw	a4,s2,1
    8000359c:	00171793          	slli	a5,a4,0x1
    800035a0:	00e787b3          	add	a5,a5,a4
    800035a4:	00379793          	slli	a5,a5,0x3
    800035a8:	00f78793          	addi	a5,a5,15
    800035ac:	ff07f793          	andi	a5,a5,-16
    800035b0:	40f10133          	sub	sp,sp,a5
    800035b4:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    800035b8:	00191613          	slli	a2,s2,0x1
    800035bc:	012607b3          	add	a5,a2,s2
    800035c0:	00379793          	slli	a5,a5,0x3
    800035c4:	00f987b3          	add	a5,s3,a5
    800035c8:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    800035cc:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    800035d0:	00008717          	auipc	a4,0x8
    800035d4:	4b073703          	ld	a4,1200(a4) # 8000ba80 <_ZL10waitForAll>
    800035d8:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    800035dc:	00078613          	mv	a2,a5
    800035e0:	00000597          	auipc	a1,0x0
    800035e4:	d7458593          	addi	a1,a1,-652 # 80003354 <_ZL8consumerPv>
    800035e8:	f9840513          	addi	a0,s0,-104
    800035ec:	ffffe097          	auipc	ra,0xffffe
    800035f0:	d94080e7          	jalr	-620(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    800035f4:	00000493          	li	s1,0
    800035f8:	0280006f          	j	80003620 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    800035fc:	00000597          	auipc	a1,0x0
    80003600:	c1458593          	addi	a1,a1,-1004 # 80003210 <_ZL16producerKeyboardPv>
                      data + i);
    80003604:	00179613          	slli	a2,a5,0x1
    80003608:	00f60633          	add	a2,a2,a5
    8000360c:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80003610:	00c98633          	add	a2,s3,a2
    80003614:	ffffe097          	auipc	ra,0xffffe
    80003618:	d6c080e7          	jalr	-660(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    8000361c:	0014849b          	addiw	s1,s1,1
    80003620:	0524d263          	bge	s1,s2,80003664 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80003624:	00149793          	slli	a5,s1,0x1
    80003628:	009787b3          	add	a5,a5,s1
    8000362c:	00379793          	slli	a5,a5,0x3
    80003630:	00f987b3          	add	a5,s3,a5
    80003634:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80003638:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    8000363c:	00008717          	auipc	a4,0x8
    80003640:	44473703          	ld	a4,1092(a4) # 8000ba80 <_ZL10waitForAll>
    80003644:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80003648:	00048793          	mv	a5,s1
    8000364c:	00349513          	slli	a0,s1,0x3
    80003650:	00aa8533          	add	a0,s5,a0
    80003654:	fa9054e3          	blez	s1,800035fc <_Z22producerConsumer_C_APIv+0x1c8>
    80003658:	00000597          	auipc	a1,0x0
    8000365c:	c6858593          	addi	a1,a1,-920 # 800032c0 <_ZL8producerPv>
    80003660:	fa5ff06f          	j	80003604 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80003664:	ffffe097          	auipc	ra,0xffffe
    80003668:	dc4080e7          	jalr	-572(ra) # 80001428 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    8000366c:	00000493          	li	s1,0
    80003670:	00994e63          	blt	s2,s1,8000368c <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80003674:	00008517          	auipc	a0,0x8
    80003678:	40c53503          	ld	a0,1036(a0) # 8000ba80 <_ZL10waitForAll>
    8000367c:	ffffe097          	auipc	ra,0xffffe
    80003680:	e8c080e7          	jalr	-372(ra) # 80001508 <_Z8sem_waitP4KSem>
    for (int i = 0; i <= threadNum; i++) {
    80003684:	0014849b          	addiw	s1,s1,1
    80003688:	fe9ff06f          	j	80003670 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    8000368c:	00008517          	auipc	a0,0x8
    80003690:	3f453503          	ld	a0,1012(a0) # 8000ba80 <_ZL10waitForAll>
    80003694:	ffffe097          	auipc	ra,0xffffe
    80003698:	e44080e7          	jalr	-444(ra) # 800014d8 <_Z9sem_closeP4KSem>
    delete buffer;
    8000369c:	000a0e63          	beqz	s4,800036b8 <_Z22producerConsumer_C_APIv+0x284>
    800036a0:	000a0513          	mv	a0,s4
    800036a4:	00003097          	auipc	ra,0x3
    800036a8:	154080e7          	jalr	340(ra) # 800067f8 <_ZN6BufferD1Ev>
    800036ac:	000a0513          	mv	a0,s4
    800036b0:	fffff097          	auipc	ra,0xfffff
    800036b4:	b68080e7          	jalr	-1176(ra) # 80002218 <_ZdlPv>
    800036b8:	000b0113          	mv	sp,s6

}
    800036bc:	f9040113          	addi	sp,s0,-112
    800036c0:	06813083          	ld	ra,104(sp)
    800036c4:	06013403          	ld	s0,96(sp)
    800036c8:	05813483          	ld	s1,88(sp)
    800036cc:	05013903          	ld	s2,80(sp)
    800036d0:	04813983          	ld	s3,72(sp)
    800036d4:	04013a03          	ld	s4,64(sp)
    800036d8:	03813a83          	ld	s5,56(sp)
    800036dc:	03013b03          	ld	s6,48(sp)
    800036e0:	07010113          	addi	sp,sp,112
    800036e4:	00008067          	ret
    800036e8:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    800036ec:	000a0513          	mv	a0,s4
    800036f0:	fffff097          	auipc	ra,0xfffff
    800036f4:	b28080e7          	jalr	-1240(ra) # 80002218 <_ZdlPv>
    800036f8:	00048513          	mv	a0,s1
    800036fc:	00009097          	auipc	ra,0x9
    80003700:	49c080e7          	jalr	1180(ra) # 8000cb98 <_Unwind_Resume>

0000000080003704 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003704:	fe010113          	addi	sp,sp,-32
    80003708:	00113c23          	sd	ra,24(sp)
    8000370c:	00813823          	sd	s0,16(sp)
    80003710:	00913423          	sd	s1,8(sp)
    80003714:	01213023          	sd	s2,0(sp)
    80003718:	02010413          	addi	s0,sp,32
    8000371c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003720:	00100793          	li	a5,1
    80003724:	02a7f863          	bgeu	a5,a0,80003754 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80003728:	00a00793          	li	a5,10
    8000372c:	02f577b3          	remu	a5,a0,a5
    80003730:	02078e63          	beqz	a5,8000376c <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80003734:	fff48513          	addi	a0,s1,-1
    80003738:	00000097          	auipc	ra,0x0
    8000373c:	fcc080e7          	jalr	-52(ra) # 80003704 <_ZL9fibonaccim>
    80003740:	00050913          	mv	s2,a0
    80003744:	ffe48513          	addi	a0,s1,-2
    80003748:	00000097          	auipc	ra,0x0
    8000374c:	fbc080e7          	jalr	-68(ra) # 80003704 <_ZL9fibonaccim>
    80003750:	00a90533          	add	a0,s2,a0
}
    80003754:	01813083          	ld	ra,24(sp)
    80003758:	01013403          	ld	s0,16(sp)
    8000375c:	00813483          	ld	s1,8(sp)
    80003760:	00013903          	ld	s2,0(sp)
    80003764:	02010113          	addi	sp,sp,32
    80003768:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    8000376c:	ffffe097          	auipc	ra,0xffffe
    80003770:	cbc080e7          	jalr	-836(ra) # 80001428 <_Z15thread_dispatchv>
    80003774:	fc1ff06f          	j	80003734 <_ZL9fibonaccim+0x30>

0000000080003778 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80003778:	fe010113          	addi	sp,sp,-32
    8000377c:	00113c23          	sd	ra,24(sp)
    80003780:	00813823          	sd	s0,16(sp)
    80003784:	00913423          	sd	s1,8(sp)
    80003788:	01213023          	sd	s2,0(sp)
    8000378c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003790:	00000913          	li	s2,0
    80003794:	0380006f          	j	800037cc <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003798:	ffffe097          	auipc	ra,0xffffe
    8000379c:	c90080e7          	jalr	-880(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800037a0:	00148493          	addi	s1,s1,1
    800037a4:	000027b7          	lui	a5,0x2
    800037a8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800037ac:	0097ee63          	bltu	a5,s1,800037c8 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800037b0:	00000713          	li	a4,0
    800037b4:	000077b7          	lui	a5,0x7
    800037b8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800037bc:	fce7eee3          	bltu	a5,a4,80003798 <_ZN7WorkerA11workerBodyAEPv+0x20>
    800037c0:	00170713          	addi	a4,a4,1
    800037c4:	ff1ff06f          	j	800037b4 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800037c8:	00190913          	addi	s2,s2,1
    800037cc:	00900793          	li	a5,9
    800037d0:	0527e063          	bltu	a5,s2,80003810 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800037d4:	00006517          	auipc	a0,0x6
    800037d8:	b9450513          	addi	a0,a0,-1132 # 80009368 <CONSOLE_STATUS+0x358>
    800037dc:	00002097          	auipc	ra,0x2
    800037e0:	eac080e7          	jalr	-340(ra) # 80005688 <_Z11printStringPKc>
    800037e4:	00000613          	li	a2,0
    800037e8:	00a00593          	li	a1,10
    800037ec:	0009051b          	sext.w	a0,s2
    800037f0:	00002097          	auipc	ra,0x2
    800037f4:	048080e7          	jalr	72(ra) # 80005838 <_Z8printIntiii>
    800037f8:	00006517          	auipc	a0,0x6
    800037fc:	dc050513          	addi	a0,a0,-576 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80003800:	00002097          	auipc	ra,0x2
    80003804:	e88080e7          	jalr	-376(ra) # 80005688 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003808:	00000493          	li	s1,0
    8000380c:	f99ff06f          	j	800037a4 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003810:	00006517          	auipc	a0,0x6
    80003814:	b6050513          	addi	a0,a0,-1184 # 80009370 <CONSOLE_STATUS+0x360>
    80003818:	00002097          	auipc	ra,0x2
    8000381c:	e70080e7          	jalr	-400(ra) # 80005688 <_Z11printStringPKc>
    finishedA = true;
    80003820:	00100793          	li	a5,1
    80003824:	00008717          	auipc	a4,0x8
    80003828:	26f70223          	sb	a5,612(a4) # 8000ba88 <_ZL9finishedA>
}
    8000382c:	01813083          	ld	ra,24(sp)
    80003830:	01013403          	ld	s0,16(sp)
    80003834:	00813483          	ld	s1,8(sp)
    80003838:	00013903          	ld	s2,0(sp)
    8000383c:	02010113          	addi	sp,sp,32
    80003840:	00008067          	ret

0000000080003844 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80003844:	fe010113          	addi	sp,sp,-32
    80003848:	00113c23          	sd	ra,24(sp)
    8000384c:	00813823          	sd	s0,16(sp)
    80003850:	00913423          	sd	s1,8(sp)
    80003854:	01213023          	sd	s2,0(sp)
    80003858:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    8000385c:	00000913          	li	s2,0
    80003860:	0380006f          	j	80003898 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003864:	ffffe097          	auipc	ra,0xffffe
    80003868:	bc4080e7          	jalr	-1084(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    8000386c:	00148493          	addi	s1,s1,1
    80003870:	000027b7          	lui	a5,0x2
    80003874:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003878:	0097ee63          	bltu	a5,s1,80003894 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    8000387c:	00000713          	li	a4,0
    80003880:	000077b7          	lui	a5,0x7
    80003884:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003888:	fce7eee3          	bltu	a5,a4,80003864 <_ZN7WorkerB11workerBodyBEPv+0x20>
    8000388c:	00170713          	addi	a4,a4,1
    80003890:	ff1ff06f          	j	80003880 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003894:	00190913          	addi	s2,s2,1
    80003898:	00f00793          	li	a5,15
    8000389c:	0527e063          	bltu	a5,s2,800038dc <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800038a0:	00006517          	auipc	a0,0x6
    800038a4:	ae050513          	addi	a0,a0,-1312 # 80009380 <CONSOLE_STATUS+0x370>
    800038a8:	00002097          	auipc	ra,0x2
    800038ac:	de0080e7          	jalr	-544(ra) # 80005688 <_Z11printStringPKc>
    800038b0:	00000613          	li	a2,0
    800038b4:	00a00593          	li	a1,10
    800038b8:	0009051b          	sext.w	a0,s2
    800038bc:	00002097          	auipc	ra,0x2
    800038c0:	f7c080e7          	jalr	-132(ra) # 80005838 <_Z8printIntiii>
    800038c4:	00006517          	auipc	a0,0x6
    800038c8:	cf450513          	addi	a0,a0,-780 # 800095b8 <CONSOLE_STATUS+0x5a8>
    800038cc:	00002097          	auipc	ra,0x2
    800038d0:	dbc080e7          	jalr	-580(ra) # 80005688 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800038d4:	00000493          	li	s1,0
    800038d8:	f99ff06f          	j	80003870 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    800038dc:	00006517          	auipc	a0,0x6
    800038e0:	aac50513          	addi	a0,a0,-1364 # 80009388 <CONSOLE_STATUS+0x378>
    800038e4:	00002097          	auipc	ra,0x2
    800038e8:	da4080e7          	jalr	-604(ra) # 80005688 <_Z11printStringPKc>
    finishedB = true;
    800038ec:	00100793          	li	a5,1
    800038f0:	00008717          	auipc	a4,0x8
    800038f4:	18f70ca3          	sb	a5,409(a4) # 8000ba89 <_ZL9finishedB>
    thread_dispatch();
    800038f8:	ffffe097          	auipc	ra,0xffffe
    800038fc:	b30080e7          	jalr	-1232(ra) # 80001428 <_Z15thread_dispatchv>
}
    80003900:	01813083          	ld	ra,24(sp)
    80003904:	01013403          	ld	s0,16(sp)
    80003908:	00813483          	ld	s1,8(sp)
    8000390c:	00013903          	ld	s2,0(sp)
    80003910:	02010113          	addi	sp,sp,32
    80003914:	00008067          	ret

0000000080003918 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80003918:	fe010113          	addi	sp,sp,-32
    8000391c:	00113c23          	sd	ra,24(sp)
    80003920:	00813823          	sd	s0,16(sp)
    80003924:	00913423          	sd	s1,8(sp)
    80003928:	01213023          	sd	s2,0(sp)
    8000392c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80003930:	00000493          	li	s1,0
    80003934:	0400006f          	j	80003974 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003938:	00006517          	auipc	a0,0x6
    8000393c:	a6050513          	addi	a0,a0,-1440 # 80009398 <CONSOLE_STATUS+0x388>
    80003940:	00002097          	auipc	ra,0x2
    80003944:	d48080e7          	jalr	-696(ra) # 80005688 <_Z11printStringPKc>
    80003948:	00000613          	li	a2,0
    8000394c:	00a00593          	li	a1,10
    80003950:	00048513          	mv	a0,s1
    80003954:	00002097          	auipc	ra,0x2
    80003958:	ee4080e7          	jalr	-284(ra) # 80005838 <_Z8printIntiii>
    8000395c:	00006517          	auipc	a0,0x6
    80003960:	c5c50513          	addi	a0,a0,-932 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80003964:	00002097          	auipc	ra,0x2
    80003968:	d24080e7          	jalr	-732(ra) # 80005688 <_Z11printStringPKc>
    for (; i < 3; i++) {
    8000396c:	0014849b          	addiw	s1,s1,1
    80003970:	0ff4f493          	andi	s1,s1,255
    80003974:	00200793          	li	a5,2
    80003978:	fc97f0e3          	bgeu	a5,s1,80003938 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    8000397c:	00006517          	auipc	a0,0x6
    80003980:	a2450513          	addi	a0,a0,-1500 # 800093a0 <CONSOLE_STATUS+0x390>
    80003984:	00002097          	auipc	ra,0x2
    80003988:	d04080e7          	jalr	-764(ra) # 80005688 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    8000398c:	00700313          	li	t1,7
    thread_dispatch();
    80003990:	ffffe097          	auipc	ra,0xffffe
    80003994:	a98080e7          	jalr	-1384(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80003998:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    8000399c:	00006517          	auipc	a0,0x6
    800039a0:	a1450513          	addi	a0,a0,-1516 # 800093b0 <CONSOLE_STATUS+0x3a0>
    800039a4:	00002097          	auipc	ra,0x2
    800039a8:	ce4080e7          	jalr	-796(ra) # 80005688 <_Z11printStringPKc>
    800039ac:	00000613          	li	a2,0
    800039b0:	00a00593          	li	a1,10
    800039b4:	0009051b          	sext.w	a0,s2
    800039b8:	00002097          	auipc	ra,0x2
    800039bc:	e80080e7          	jalr	-384(ra) # 80005838 <_Z8printIntiii>
    800039c0:	00006517          	auipc	a0,0x6
    800039c4:	bf850513          	addi	a0,a0,-1032 # 800095b8 <CONSOLE_STATUS+0x5a8>
    800039c8:	00002097          	auipc	ra,0x2
    800039cc:	cc0080e7          	jalr	-832(ra) # 80005688 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    800039d0:	00c00513          	li	a0,12
    800039d4:	00000097          	auipc	ra,0x0
    800039d8:	d30080e7          	jalr	-720(ra) # 80003704 <_ZL9fibonaccim>
    800039dc:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800039e0:	00006517          	auipc	a0,0x6
    800039e4:	9d850513          	addi	a0,a0,-1576 # 800093b8 <CONSOLE_STATUS+0x3a8>
    800039e8:	00002097          	auipc	ra,0x2
    800039ec:	ca0080e7          	jalr	-864(ra) # 80005688 <_Z11printStringPKc>
    800039f0:	00000613          	li	a2,0
    800039f4:	00a00593          	li	a1,10
    800039f8:	0009051b          	sext.w	a0,s2
    800039fc:	00002097          	auipc	ra,0x2
    80003a00:	e3c080e7          	jalr	-452(ra) # 80005838 <_Z8printIntiii>
    80003a04:	00006517          	auipc	a0,0x6
    80003a08:	bb450513          	addi	a0,a0,-1100 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80003a0c:	00002097          	auipc	ra,0x2
    80003a10:	c7c080e7          	jalr	-900(ra) # 80005688 <_Z11printStringPKc>
    80003a14:	0400006f          	j	80003a54 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003a18:	00006517          	auipc	a0,0x6
    80003a1c:	98050513          	addi	a0,a0,-1664 # 80009398 <CONSOLE_STATUS+0x388>
    80003a20:	00002097          	auipc	ra,0x2
    80003a24:	c68080e7          	jalr	-920(ra) # 80005688 <_Z11printStringPKc>
    80003a28:	00000613          	li	a2,0
    80003a2c:	00a00593          	li	a1,10
    80003a30:	00048513          	mv	a0,s1
    80003a34:	00002097          	auipc	ra,0x2
    80003a38:	e04080e7          	jalr	-508(ra) # 80005838 <_Z8printIntiii>
    80003a3c:	00006517          	auipc	a0,0x6
    80003a40:	b7c50513          	addi	a0,a0,-1156 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80003a44:	00002097          	auipc	ra,0x2
    80003a48:	c44080e7          	jalr	-956(ra) # 80005688 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80003a4c:	0014849b          	addiw	s1,s1,1
    80003a50:	0ff4f493          	andi	s1,s1,255
    80003a54:	00500793          	li	a5,5
    80003a58:	fc97f0e3          	bgeu	a5,s1,80003a18 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    80003a5c:	00006517          	auipc	a0,0x6
    80003a60:	91450513          	addi	a0,a0,-1772 # 80009370 <CONSOLE_STATUS+0x360>
    80003a64:	00002097          	auipc	ra,0x2
    80003a68:	c24080e7          	jalr	-988(ra) # 80005688 <_Z11printStringPKc>
    finishedC = true;
    80003a6c:	00100793          	li	a5,1
    80003a70:	00008717          	auipc	a4,0x8
    80003a74:	00f70d23          	sb	a5,26(a4) # 8000ba8a <_ZL9finishedC>
    thread_dispatch();
    80003a78:	ffffe097          	auipc	ra,0xffffe
    80003a7c:	9b0080e7          	jalr	-1616(ra) # 80001428 <_Z15thread_dispatchv>
}
    80003a80:	01813083          	ld	ra,24(sp)
    80003a84:	01013403          	ld	s0,16(sp)
    80003a88:	00813483          	ld	s1,8(sp)
    80003a8c:	00013903          	ld	s2,0(sp)
    80003a90:	02010113          	addi	sp,sp,32
    80003a94:	00008067          	ret

0000000080003a98 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80003a98:	fe010113          	addi	sp,sp,-32
    80003a9c:	00113c23          	sd	ra,24(sp)
    80003aa0:	00813823          	sd	s0,16(sp)
    80003aa4:	00913423          	sd	s1,8(sp)
    80003aa8:	01213023          	sd	s2,0(sp)
    80003aac:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80003ab0:	00a00493          	li	s1,10
    80003ab4:	0400006f          	j	80003af4 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003ab8:	00006517          	auipc	a0,0x6
    80003abc:	91050513          	addi	a0,a0,-1776 # 800093c8 <CONSOLE_STATUS+0x3b8>
    80003ac0:	00002097          	auipc	ra,0x2
    80003ac4:	bc8080e7          	jalr	-1080(ra) # 80005688 <_Z11printStringPKc>
    80003ac8:	00000613          	li	a2,0
    80003acc:	00a00593          	li	a1,10
    80003ad0:	00048513          	mv	a0,s1
    80003ad4:	00002097          	auipc	ra,0x2
    80003ad8:	d64080e7          	jalr	-668(ra) # 80005838 <_Z8printIntiii>
    80003adc:	00006517          	auipc	a0,0x6
    80003ae0:	adc50513          	addi	a0,a0,-1316 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80003ae4:	00002097          	auipc	ra,0x2
    80003ae8:	ba4080e7          	jalr	-1116(ra) # 80005688 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80003aec:	0014849b          	addiw	s1,s1,1
    80003af0:	0ff4f493          	andi	s1,s1,255
    80003af4:	00c00793          	li	a5,12
    80003af8:	fc97f0e3          	bgeu	a5,s1,80003ab8 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80003afc:	00006517          	auipc	a0,0x6
    80003b00:	8d450513          	addi	a0,a0,-1836 # 800093d0 <CONSOLE_STATUS+0x3c0>
    80003b04:	00002097          	auipc	ra,0x2
    80003b08:	b84080e7          	jalr	-1148(ra) # 80005688 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80003b0c:	00500313          	li	t1,5
    thread_dispatch();
    80003b10:	ffffe097          	auipc	ra,0xffffe
    80003b14:	918080e7          	jalr	-1768(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80003b18:	01000513          	li	a0,16
    80003b1c:	00000097          	auipc	ra,0x0
    80003b20:	be8080e7          	jalr	-1048(ra) # 80003704 <_ZL9fibonaccim>
    80003b24:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80003b28:	00006517          	auipc	a0,0x6
    80003b2c:	8b850513          	addi	a0,a0,-1864 # 800093e0 <CONSOLE_STATUS+0x3d0>
    80003b30:	00002097          	auipc	ra,0x2
    80003b34:	b58080e7          	jalr	-1192(ra) # 80005688 <_Z11printStringPKc>
    80003b38:	00000613          	li	a2,0
    80003b3c:	00a00593          	li	a1,10
    80003b40:	0009051b          	sext.w	a0,s2
    80003b44:	00002097          	auipc	ra,0x2
    80003b48:	cf4080e7          	jalr	-780(ra) # 80005838 <_Z8printIntiii>
    80003b4c:	00006517          	auipc	a0,0x6
    80003b50:	a6c50513          	addi	a0,a0,-1428 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80003b54:	00002097          	auipc	ra,0x2
    80003b58:	b34080e7          	jalr	-1228(ra) # 80005688 <_Z11printStringPKc>
    80003b5c:	0400006f          	j	80003b9c <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003b60:	00006517          	auipc	a0,0x6
    80003b64:	86850513          	addi	a0,a0,-1944 # 800093c8 <CONSOLE_STATUS+0x3b8>
    80003b68:	00002097          	auipc	ra,0x2
    80003b6c:	b20080e7          	jalr	-1248(ra) # 80005688 <_Z11printStringPKc>
    80003b70:	00000613          	li	a2,0
    80003b74:	00a00593          	li	a1,10
    80003b78:	00048513          	mv	a0,s1
    80003b7c:	00002097          	auipc	ra,0x2
    80003b80:	cbc080e7          	jalr	-836(ra) # 80005838 <_Z8printIntiii>
    80003b84:	00006517          	auipc	a0,0x6
    80003b88:	a3450513          	addi	a0,a0,-1484 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80003b8c:	00002097          	auipc	ra,0x2
    80003b90:	afc080e7          	jalr	-1284(ra) # 80005688 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80003b94:	0014849b          	addiw	s1,s1,1
    80003b98:	0ff4f493          	andi	s1,s1,255
    80003b9c:	00f00793          	li	a5,15
    80003ba0:	fc97f0e3          	bgeu	a5,s1,80003b60 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80003ba4:	00006517          	auipc	a0,0x6
    80003ba8:	84c50513          	addi	a0,a0,-1972 # 800093f0 <CONSOLE_STATUS+0x3e0>
    80003bac:	00002097          	auipc	ra,0x2
    80003bb0:	adc080e7          	jalr	-1316(ra) # 80005688 <_Z11printStringPKc>
    finishedD = true;
    80003bb4:	00100793          	li	a5,1
    80003bb8:	00008717          	auipc	a4,0x8
    80003bbc:	ecf709a3          	sb	a5,-301(a4) # 8000ba8b <_ZL9finishedD>
    thread_dispatch();
    80003bc0:	ffffe097          	auipc	ra,0xffffe
    80003bc4:	868080e7          	jalr	-1944(ra) # 80001428 <_Z15thread_dispatchv>
}
    80003bc8:	01813083          	ld	ra,24(sp)
    80003bcc:	01013403          	ld	s0,16(sp)
    80003bd0:	00813483          	ld	s1,8(sp)
    80003bd4:	00013903          	ld	s2,0(sp)
    80003bd8:	02010113          	addi	sp,sp,32
    80003bdc:	00008067          	ret

0000000080003be0 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80003be0:	fc010113          	addi	sp,sp,-64
    80003be4:	02113c23          	sd	ra,56(sp)
    80003be8:	02813823          	sd	s0,48(sp)
    80003bec:	02913423          	sd	s1,40(sp)
    80003bf0:	03213023          	sd	s2,32(sp)
    80003bf4:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80003bf8:	02000513          	li	a0,32
    80003bfc:	ffffe097          	auipc	ra,0xffffe
    80003c00:	5cc080e7          	jalr	1484(ra) # 800021c8 <_Znwm>
    80003c04:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80003c08:	fffff097          	auipc	ra,0xfffff
    80003c0c:	838080e7          	jalr	-1992(ra) # 80002440 <_ZN6ThreadC1Ev>
    80003c10:	00008797          	auipc	a5,0x8
    80003c14:	c0078793          	addi	a5,a5,-1024 # 8000b810 <_ZTV7WorkerA+0x10>
    80003c18:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80003c1c:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80003c20:	00005517          	auipc	a0,0x5
    80003c24:	7e050513          	addi	a0,a0,2016 # 80009400 <CONSOLE_STATUS+0x3f0>
    80003c28:	00002097          	auipc	ra,0x2
    80003c2c:	a60080e7          	jalr	-1440(ra) # 80005688 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80003c30:	02000513          	li	a0,32
    80003c34:	ffffe097          	auipc	ra,0xffffe
    80003c38:	594080e7          	jalr	1428(ra) # 800021c8 <_Znwm>
    80003c3c:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80003c40:	fffff097          	auipc	ra,0xfffff
    80003c44:	800080e7          	jalr	-2048(ra) # 80002440 <_ZN6ThreadC1Ev>
    80003c48:	00008797          	auipc	a5,0x8
    80003c4c:	bf078793          	addi	a5,a5,-1040 # 8000b838 <_ZTV7WorkerB+0x10>
    80003c50:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80003c54:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80003c58:	00005517          	auipc	a0,0x5
    80003c5c:	7c050513          	addi	a0,a0,1984 # 80009418 <CONSOLE_STATUS+0x408>
    80003c60:	00002097          	auipc	ra,0x2
    80003c64:	a28080e7          	jalr	-1496(ra) # 80005688 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80003c68:	02000513          	li	a0,32
    80003c6c:	ffffe097          	auipc	ra,0xffffe
    80003c70:	55c080e7          	jalr	1372(ra) # 800021c8 <_Znwm>
    80003c74:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80003c78:	ffffe097          	auipc	ra,0xffffe
    80003c7c:	7c8080e7          	jalr	1992(ra) # 80002440 <_ZN6ThreadC1Ev>
    80003c80:	00008797          	auipc	a5,0x8
    80003c84:	be078793          	addi	a5,a5,-1056 # 8000b860 <_ZTV7WorkerC+0x10>
    80003c88:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80003c8c:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80003c90:	00005517          	auipc	a0,0x5
    80003c94:	7a050513          	addi	a0,a0,1952 # 80009430 <CONSOLE_STATUS+0x420>
    80003c98:	00002097          	auipc	ra,0x2
    80003c9c:	9f0080e7          	jalr	-1552(ra) # 80005688 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80003ca0:	02000513          	li	a0,32
    80003ca4:	ffffe097          	auipc	ra,0xffffe
    80003ca8:	524080e7          	jalr	1316(ra) # 800021c8 <_Znwm>
    80003cac:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80003cb0:	ffffe097          	auipc	ra,0xffffe
    80003cb4:	790080e7          	jalr	1936(ra) # 80002440 <_ZN6ThreadC1Ev>
    80003cb8:	00008797          	auipc	a5,0x8
    80003cbc:	bd078793          	addi	a5,a5,-1072 # 8000b888 <_ZTV7WorkerD+0x10>
    80003cc0:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80003cc4:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80003cc8:	00005517          	auipc	a0,0x5
    80003ccc:	78050513          	addi	a0,a0,1920 # 80009448 <CONSOLE_STATUS+0x438>
    80003cd0:	00002097          	auipc	ra,0x2
    80003cd4:	9b8080e7          	jalr	-1608(ra) # 80005688 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80003cd8:	00000493          	li	s1,0
    80003cdc:	00300793          	li	a5,3
    80003ce0:	0297c663          	blt	a5,s1,80003d0c <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80003ce4:	00349793          	slli	a5,s1,0x3
    80003ce8:	fe040713          	addi	a4,s0,-32
    80003cec:	00f707b3          	add	a5,a4,a5
    80003cf0:	fe07b503          	ld	a0,-32(a5)
    80003cf4:	ffffe097          	auipc	ra,0xffffe
    80003cf8:	684080e7          	jalr	1668(ra) # 80002378 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80003cfc:	0014849b          	addiw	s1,s1,1
    80003d00:	fddff06f          	j	80003cdc <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80003d04:	ffffe097          	auipc	ra,0xffffe
    80003d08:	6d8080e7          	jalr	1752(ra) # 800023dc <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80003d0c:	00008797          	auipc	a5,0x8
    80003d10:	d7c7c783          	lbu	a5,-644(a5) # 8000ba88 <_ZL9finishedA>
    80003d14:	fe0788e3          	beqz	a5,80003d04 <_Z20Threads_CPP_API_testv+0x124>
    80003d18:	00008797          	auipc	a5,0x8
    80003d1c:	d717c783          	lbu	a5,-655(a5) # 8000ba89 <_ZL9finishedB>
    80003d20:	fe0782e3          	beqz	a5,80003d04 <_Z20Threads_CPP_API_testv+0x124>
    80003d24:	00008797          	auipc	a5,0x8
    80003d28:	d667c783          	lbu	a5,-666(a5) # 8000ba8a <_ZL9finishedC>
    80003d2c:	fc078ce3          	beqz	a5,80003d04 <_Z20Threads_CPP_API_testv+0x124>
    80003d30:	00008797          	auipc	a5,0x8
    80003d34:	d5b7c783          	lbu	a5,-677(a5) # 8000ba8b <_ZL9finishedD>
    80003d38:	fc0786e3          	beqz	a5,80003d04 <_Z20Threads_CPP_API_testv+0x124>
    80003d3c:	fc040493          	addi	s1,s0,-64
    80003d40:	0080006f          	j	80003d48 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    80003d44:	00848493          	addi	s1,s1,8
    80003d48:	fe040793          	addi	a5,s0,-32
    80003d4c:	08f48663          	beq	s1,a5,80003dd8 <_Z20Threads_CPP_API_testv+0x1f8>
    80003d50:	0004b503          	ld	a0,0(s1)
    80003d54:	fe0508e3          	beqz	a0,80003d44 <_Z20Threads_CPP_API_testv+0x164>
    80003d58:	00053783          	ld	a5,0(a0)
    80003d5c:	0087b783          	ld	a5,8(a5)
    80003d60:	000780e7          	jalr	a5
    80003d64:	fe1ff06f          	j	80003d44 <_Z20Threads_CPP_API_testv+0x164>
    80003d68:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80003d6c:	00048513          	mv	a0,s1
    80003d70:	ffffe097          	auipc	ra,0xffffe
    80003d74:	4a8080e7          	jalr	1192(ra) # 80002218 <_ZdlPv>
    80003d78:	00090513          	mv	a0,s2
    80003d7c:	00009097          	auipc	ra,0x9
    80003d80:	e1c080e7          	jalr	-484(ra) # 8000cb98 <_Unwind_Resume>
    80003d84:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80003d88:	00048513          	mv	a0,s1
    80003d8c:	ffffe097          	auipc	ra,0xffffe
    80003d90:	48c080e7          	jalr	1164(ra) # 80002218 <_ZdlPv>
    80003d94:	00090513          	mv	a0,s2
    80003d98:	00009097          	auipc	ra,0x9
    80003d9c:	e00080e7          	jalr	-512(ra) # 8000cb98 <_Unwind_Resume>
    80003da0:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80003da4:	00048513          	mv	a0,s1
    80003da8:	ffffe097          	auipc	ra,0xffffe
    80003dac:	470080e7          	jalr	1136(ra) # 80002218 <_ZdlPv>
    80003db0:	00090513          	mv	a0,s2
    80003db4:	00009097          	auipc	ra,0x9
    80003db8:	de4080e7          	jalr	-540(ra) # 8000cb98 <_Unwind_Resume>
    80003dbc:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80003dc0:	00048513          	mv	a0,s1
    80003dc4:	ffffe097          	auipc	ra,0xffffe
    80003dc8:	454080e7          	jalr	1108(ra) # 80002218 <_ZdlPv>
    80003dcc:	00090513          	mv	a0,s2
    80003dd0:	00009097          	auipc	ra,0x9
    80003dd4:	dc8080e7          	jalr	-568(ra) # 8000cb98 <_Unwind_Resume>
}
    80003dd8:	03813083          	ld	ra,56(sp)
    80003ddc:	03013403          	ld	s0,48(sp)
    80003de0:	02813483          	ld	s1,40(sp)
    80003de4:	02013903          	ld	s2,32(sp)
    80003de8:	04010113          	addi	sp,sp,64
    80003dec:	00008067          	ret

0000000080003df0 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80003df0:	ff010113          	addi	sp,sp,-16
    80003df4:	00113423          	sd	ra,8(sp)
    80003df8:	00813023          	sd	s0,0(sp)
    80003dfc:	01010413          	addi	s0,sp,16
    80003e00:	00008797          	auipc	a5,0x8
    80003e04:	a1078793          	addi	a5,a5,-1520 # 8000b810 <_ZTV7WorkerA+0x10>
    80003e08:	00f53023          	sd	a5,0(a0)
    80003e0c:	ffffe097          	auipc	ra,0xffffe
    80003e10:	310080e7          	jalr	784(ra) # 8000211c <_ZN6ThreadD1Ev>
    80003e14:	00813083          	ld	ra,8(sp)
    80003e18:	00013403          	ld	s0,0(sp)
    80003e1c:	01010113          	addi	sp,sp,16
    80003e20:	00008067          	ret

0000000080003e24 <_ZN7WorkerAD0Ev>:
    80003e24:	fe010113          	addi	sp,sp,-32
    80003e28:	00113c23          	sd	ra,24(sp)
    80003e2c:	00813823          	sd	s0,16(sp)
    80003e30:	00913423          	sd	s1,8(sp)
    80003e34:	02010413          	addi	s0,sp,32
    80003e38:	00050493          	mv	s1,a0
    80003e3c:	00008797          	auipc	a5,0x8
    80003e40:	9d478793          	addi	a5,a5,-1580 # 8000b810 <_ZTV7WorkerA+0x10>
    80003e44:	00f53023          	sd	a5,0(a0)
    80003e48:	ffffe097          	auipc	ra,0xffffe
    80003e4c:	2d4080e7          	jalr	724(ra) # 8000211c <_ZN6ThreadD1Ev>
    80003e50:	00048513          	mv	a0,s1
    80003e54:	ffffe097          	auipc	ra,0xffffe
    80003e58:	3c4080e7          	jalr	964(ra) # 80002218 <_ZdlPv>
    80003e5c:	01813083          	ld	ra,24(sp)
    80003e60:	01013403          	ld	s0,16(sp)
    80003e64:	00813483          	ld	s1,8(sp)
    80003e68:	02010113          	addi	sp,sp,32
    80003e6c:	00008067          	ret

0000000080003e70 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80003e70:	ff010113          	addi	sp,sp,-16
    80003e74:	00113423          	sd	ra,8(sp)
    80003e78:	00813023          	sd	s0,0(sp)
    80003e7c:	01010413          	addi	s0,sp,16
    80003e80:	00008797          	auipc	a5,0x8
    80003e84:	9b878793          	addi	a5,a5,-1608 # 8000b838 <_ZTV7WorkerB+0x10>
    80003e88:	00f53023          	sd	a5,0(a0)
    80003e8c:	ffffe097          	auipc	ra,0xffffe
    80003e90:	290080e7          	jalr	656(ra) # 8000211c <_ZN6ThreadD1Ev>
    80003e94:	00813083          	ld	ra,8(sp)
    80003e98:	00013403          	ld	s0,0(sp)
    80003e9c:	01010113          	addi	sp,sp,16
    80003ea0:	00008067          	ret

0000000080003ea4 <_ZN7WorkerBD0Ev>:
    80003ea4:	fe010113          	addi	sp,sp,-32
    80003ea8:	00113c23          	sd	ra,24(sp)
    80003eac:	00813823          	sd	s0,16(sp)
    80003eb0:	00913423          	sd	s1,8(sp)
    80003eb4:	02010413          	addi	s0,sp,32
    80003eb8:	00050493          	mv	s1,a0
    80003ebc:	00008797          	auipc	a5,0x8
    80003ec0:	97c78793          	addi	a5,a5,-1668 # 8000b838 <_ZTV7WorkerB+0x10>
    80003ec4:	00f53023          	sd	a5,0(a0)
    80003ec8:	ffffe097          	auipc	ra,0xffffe
    80003ecc:	254080e7          	jalr	596(ra) # 8000211c <_ZN6ThreadD1Ev>
    80003ed0:	00048513          	mv	a0,s1
    80003ed4:	ffffe097          	auipc	ra,0xffffe
    80003ed8:	344080e7          	jalr	836(ra) # 80002218 <_ZdlPv>
    80003edc:	01813083          	ld	ra,24(sp)
    80003ee0:	01013403          	ld	s0,16(sp)
    80003ee4:	00813483          	ld	s1,8(sp)
    80003ee8:	02010113          	addi	sp,sp,32
    80003eec:	00008067          	ret

0000000080003ef0 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80003ef0:	ff010113          	addi	sp,sp,-16
    80003ef4:	00113423          	sd	ra,8(sp)
    80003ef8:	00813023          	sd	s0,0(sp)
    80003efc:	01010413          	addi	s0,sp,16
    80003f00:	00008797          	auipc	a5,0x8
    80003f04:	96078793          	addi	a5,a5,-1696 # 8000b860 <_ZTV7WorkerC+0x10>
    80003f08:	00f53023          	sd	a5,0(a0)
    80003f0c:	ffffe097          	auipc	ra,0xffffe
    80003f10:	210080e7          	jalr	528(ra) # 8000211c <_ZN6ThreadD1Ev>
    80003f14:	00813083          	ld	ra,8(sp)
    80003f18:	00013403          	ld	s0,0(sp)
    80003f1c:	01010113          	addi	sp,sp,16
    80003f20:	00008067          	ret

0000000080003f24 <_ZN7WorkerCD0Ev>:
    80003f24:	fe010113          	addi	sp,sp,-32
    80003f28:	00113c23          	sd	ra,24(sp)
    80003f2c:	00813823          	sd	s0,16(sp)
    80003f30:	00913423          	sd	s1,8(sp)
    80003f34:	02010413          	addi	s0,sp,32
    80003f38:	00050493          	mv	s1,a0
    80003f3c:	00008797          	auipc	a5,0x8
    80003f40:	92478793          	addi	a5,a5,-1756 # 8000b860 <_ZTV7WorkerC+0x10>
    80003f44:	00f53023          	sd	a5,0(a0)
    80003f48:	ffffe097          	auipc	ra,0xffffe
    80003f4c:	1d4080e7          	jalr	468(ra) # 8000211c <_ZN6ThreadD1Ev>
    80003f50:	00048513          	mv	a0,s1
    80003f54:	ffffe097          	auipc	ra,0xffffe
    80003f58:	2c4080e7          	jalr	708(ra) # 80002218 <_ZdlPv>
    80003f5c:	01813083          	ld	ra,24(sp)
    80003f60:	01013403          	ld	s0,16(sp)
    80003f64:	00813483          	ld	s1,8(sp)
    80003f68:	02010113          	addi	sp,sp,32
    80003f6c:	00008067          	ret

0000000080003f70 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80003f70:	ff010113          	addi	sp,sp,-16
    80003f74:	00113423          	sd	ra,8(sp)
    80003f78:	00813023          	sd	s0,0(sp)
    80003f7c:	01010413          	addi	s0,sp,16
    80003f80:	00008797          	auipc	a5,0x8
    80003f84:	90878793          	addi	a5,a5,-1784 # 8000b888 <_ZTV7WorkerD+0x10>
    80003f88:	00f53023          	sd	a5,0(a0)
    80003f8c:	ffffe097          	auipc	ra,0xffffe
    80003f90:	190080e7          	jalr	400(ra) # 8000211c <_ZN6ThreadD1Ev>
    80003f94:	00813083          	ld	ra,8(sp)
    80003f98:	00013403          	ld	s0,0(sp)
    80003f9c:	01010113          	addi	sp,sp,16
    80003fa0:	00008067          	ret

0000000080003fa4 <_ZN7WorkerDD0Ev>:
    80003fa4:	fe010113          	addi	sp,sp,-32
    80003fa8:	00113c23          	sd	ra,24(sp)
    80003fac:	00813823          	sd	s0,16(sp)
    80003fb0:	00913423          	sd	s1,8(sp)
    80003fb4:	02010413          	addi	s0,sp,32
    80003fb8:	00050493          	mv	s1,a0
    80003fbc:	00008797          	auipc	a5,0x8
    80003fc0:	8cc78793          	addi	a5,a5,-1844 # 8000b888 <_ZTV7WorkerD+0x10>
    80003fc4:	00f53023          	sd	a5,0(a0)
    80003fc8:	ffffe097          	auipc	ra,0xffffe
    80003fcc:	154080e7          	jalr	340(ra) # 8000211c <_ZN6ThreadD1Ev>
    80003fd0:	00048513          	mv	a0,s1
    80003fd4:	ffffe097          	auipc	ra,0xffffe
    80003fd8:	244080e7          	jalr	580(ra) # 80002218 <_ZdlPv>
    80003fdc:	01813083          	ld	ra,24(sp)
    80003fe0:	01013403          	ld	s0,16(sp)
    80003fe4:	00813483          	ld	s1,8(sp)
    80003fe8:	02010113          	addi	sp,sp,32
    80003fec:	00008067          	ret

0000000080003ff0 <_ZN7WorkerA3runEv>:
    void run() override {
    80003ff0:	ff010113          	addi	sp,sp,-16
    80003ff4:	00113423          	sd	ra,8(sp)
    80003ff8:	00813023          	sd	s0,0(sp)
    80003ffc:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80004000:	00000593          	li	a1,0
    80004004:	fffff097          	auipc	ra,0xfffff
    80004008:	774080e7          	jalr	1908(ra) # 80003778 <_ZN7WorkerA11workerBodyAEPv>
    }
    8000400c:	00813083          	ld	ra,8(sp)
    80004010:	00013403          	ld	s0,0(sp)
    80004014:	01010113          	addi	sp,sp,16
    80004018:	00008067          	ret

000000008000401c <_ZN7WorkerB3runEv>:
    void run() override {
    8000401c:	ff010113          	addi	sp,sp,-16
    80004020:	00113423          	sd	ra,8(sp)
    80004024:	00813023          	sd	s0,0(sp)
    80004028:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    8000402c:	00000593          	li	a1,0
    80004030:	00000097          	auipc	ra,0x0
    80004034:	814080e7          	jalr	-2028(ra) # 80003844 <_ZN7WorkerB11workerBodyBEPv>
    }
    80004038:	00813083          	ld	ra,8(sp)
    8000403c:	00013403          	ld	s0,0(sp)
    80004040:	01010113          	addi	sp,sp,16
    80004044:	00008067          	ret

0000000080004048 <_ZN7WorkerC3runEv>:
    void run() override {
    80004048:	ff010113          	addi	sp,sp,-16
    8000404c:	00113423          	sd	ra,8(sp)
    80004050:	00813023          	sd	s0,0(sp)
    80004054:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80004058:	00000593          	li	a1,0
    8000405c:	00000097          	auipc	ra,0x0
    80004060:	8bc080e7          	jalr	-1860(ra) # 80003918 <_ZN7WorkerC11workerBodyCEPv>
    }
    80004064:	00813083          	ld	ra,8(sp)
    80004068:	00013403          	ld	s0,0(sp)
    8000406c:	01010113          	addi	sp,sp,16
    80004070:	00008067          	ret

0000000080004074 <_ZN7WorkerD3runEv>:
    void run() override {
    80004074:	ff010113          	addi	sp,sp,-16
    80004078:	00113423          	sd	ra,8(sp)
    8000407c:	00813023          	sd	s0,0(sp)
    80004080:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80004084:	00000593          	li	a1,0
    80004088:	00000097          	auipc	ra,0x0
    8000408c:	a10080e7          	jalr	-1520(ra) # 80003a98 <_ZN7WorkerD11workerBodyDEPv>
    }
    80004090:	00813083          	ld	ra,8(sp)
    80004094:	00013403          	ld	s0,0(sp)
    80004098:	01010113          	addi	sp,sp,16
    8000409c:	00008067          	ret

00000000800040a0 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    800040a0:	f8010113          	addi	sp,sp,-128
    800040a4:	06113c23          	sd	ra,120(sp)
    800040a8:	06813823          	sd	s0,112(sp)
    800040ac:	06913423          	sd	s1,104(sp)
    800040b0:	07213023          	sd	s2,96(sp)
    800040b4:	05313c23          	sd	s3,88(sp)
    800040b8:	05413823          	sd	s4,80(sp)
    800040bc:	05513423          	sd	s5,72(sp)
    800040c0:	05613023          	sd	s6,64(sp)
    800040c4:	03713c23          	sd	s7,56(sp)
    800040c8:	03813823          	sd	s8,48(sp)
    800040cc:	03913423          	sd	s9,40(sp)
    800040d0:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    800040d4:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    800040d8:	00005517          	auipc	a0,0x5
    800040dc:	1a850513          	addi	a0,a0,424 # 80009280 <CONSOLE_STATUS+0x270>
    800040e0:	00001097          	auipc	ra,0x1
    800040e4:	5a8080e7          	jalr	1448(ra) # 80005688 <_Z11printStringPKc>
    getString(input, 30);
    800040e8:	01e00593          	li	a1,30
    800040ec:	f8040493          	addi	s1,s0,-128
    800040f0:	00048513          	mv	a0,s1
    800040f4:	00001097          	auipc	ra,0x1
    800040f8:	61c080e7          	jalr	1564(ra) # 80005710 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800040fc:	00048513          	mv	a0,s1
    80004100:	00001097          	auipc	ra,0x1
    80004104:	6e8080e7          	jalr	1768(ra) # 800057e8 <_Z11stringToIntPKc>
    80004108:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    8000410c:	00005517          	auipc	a0,0x5
    80004110:	19450513          	addi	a0,a0,404 # 800092a0 <CONSOLE_STATUS+0x290>
    80004114:	00001097          	auipc	ra,0x1
    80004118:	574080e7          	jalr	1396(ra) # 80005688 <_Z11printStringPKc>
    getString(input, 30);
    8000411c:	01e00593          	li	a1,30
    80004120:	00048513          	mv	a0,s1
    80004124:	00001097          	auipc	ra,0x1
    80004128:	5ec080e7          	jalr	1516(ra) # 80005710 <_Z9getStringPci>
    n = stringToInt(input);
    8000412c:	00048513          	mv	a0,s1
    80004130:	00001097          	auipc	ra,0x1
    80004134:	6b8080e7          	jalr	1720(ra) # 800057e8 <_Z11stringToIntPKc>
    80004138:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    8000413c:	00005517          	auipc	a0,0x5
    80004140:	18450513          	addi	a0,a0,388 # 800092c0 <CONSOLE_STATUS+0x2b0>
    80004144:	00001097          	auipc	ra,0x1
    80004148:	544080e7          	jalr	1348(ra) # 80005688 <_Z11printStringPKc>
    printInt(threadNum);
    8000414c:	00000613          	li	a2,0
    80004150:	00a00593          	li	a1,10
    80004154:	00098513          	mv	a0,s3
    80004158:	00001097          	auipc	ra,0x1
    8000415c:	6e0080e7          	jalr	1760(ra) # 80005838 <_Z8printIntiii>
    printString(" i velicina bafera ");
    80004160:	00005517          	auipc	a0,0x5
    80004164:	17850513          	addi	a0,a0,376 # 800092d8 <CONSOLE_STATUS+0x2c8>
    80004168:	00001097          	auipc	ra,0x1
    8000416c:	520080e7          	jalr	1312(ra) # 80005688 <_Z11printStringPKc>
    printInt(n);
    80004170:	00000613          	li	a2,0
    80004174:	00a00593          	li	a1,10
    80004178:	00048513          	mv	a0,s1
    8000417c:	00001097          	auipc	ra,0x1
    80004180:	6bc080e7          	jalr	1724(ra) # 80005838 <_Z8printIntiii>
    printString(".\n");
    80004184:	00005517          	auipc	a0,0x5
    80004188:	16c50513          	addi	a0,a0,364 # 800092f0 <CONSOLE_STATUS+0x2e0>
    8000418c:	00001097          	auipc	ra,0x1
    80004190:	4fc080e7          	jalr	1276(ra) # 80005688 <_Z11printStringPKc>
    if (threadNum > n) {
    80004194:	0334c463          	blt	s1,s3,800041bc <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    80004198:	03305c63          	blez	s3,800041d0 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    8000419c:	03800513          	li	a0,56
    800041a0:	ffffe097          	auipc	ra,0xffffe
    800041a4:	028080e7          	jalr	40(ra) # 800021c8 <_Znwm>
    800041a8:	00050a93          	mv	s5,a0
    800041ac:	00048593          	mv	a1,s1
    800041b0:	00001097          	auipc	ra,0x1
    800041b4:	7a8080e7          	jalr	1960(ra) # 80005958 <_ZN9BufferCPPC1Ei>
    800041b8:	0300006f          	j	800041e8 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800041bc:	00005517          	auipc	a0,0x5
    800041c0:	13c50513          	addi	a0,a0,316 # 800092f8 <CONSOLE_STATUS+0x2e8>
    800041c4:	00001097          	auipc	ra,0x1
    800041c8:	4c4080e7          	jalr	1220(ra) # 80005688 <_Z11printStringPKc>
        return;
    800041cc:	0140006f          	j	800041e0 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800041d0:	00005517          	auipc	a0,0x5
    800041d4:	16850513          	addi	a0,a0,360 # 80009338 <CONSOLE_STATUS+0x328>
    800041d8:	00001097          	auipc	ra,0x1
    800041dc:	4b0080e7          	jalr	1200(ra) # 80005688 <_Z11printStringPKc>
        return;
    800041e0:	000c0113          	mv	sp,s8
    800041e4:	2140006f          	j	800043f8 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    800041e8:	01000513          	li	a0,16
    800041ec:	ffffe097          	auipc	ra,0xffffe
    800041f0:	fdc080e7          	jalr	-36(ra) # 800021c8 <_Znwm>
    800041f4:	00050913          	mv	s2,a0
    800041f8:	00000593          	li	a1,0
    800041fc:	ffffe097          	auipc	ra,0xffffe
    80004200:	2c0080e7          	jalr	704(ra) # 800024bc <_ZN9SemaphoreC1Ej>
    80004204:	00008797          	auipc	a5,0x8
    80004208:	8927ba23          	sd	s2,-1900(a5) # 8000ba98 <_ZL10waitForAll>
    Thread *producers[threadNum];
    8000420c:	00399793          	slli	a5,s3,0x3
    80004210:	00f78793          	addi	a5,a5,15
    80004214:	ff07f793          	andi	a5,a5,-16
    80004218:	40f10133          	sub	sp,sp,a5
    8000421c:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80004220:	0019871b          	addiw	a4,s3,1
    80004224:	00171793          	slli	a5,a4,0x1
    80004228:	00e787b3          	add	a5,a5,a4
    8000422c:	00379793          	slli	a5,a5,0x3
    80004230:	00f78793          	addi	a5,a5,15
    80004234:	ff07f793          	andi	a5,a5,-16
    80004238:	40f10133          	sub	sp,sp,a5
    8000423c:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80004240:	00199493          	slli	s1,s3,0x1
    80004244:	013484b3          	add	s1,s1,s3
    80004248:	00349493          	slli	s1,s1,0x3
    8000424c:	009b04b3          	add	s1,s6,s1
    80004250:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80004254:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80004258:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    8000425c:	02800513          	li	a0,40
    80004260:	ffffe097          	auipc	ra,0xffffe
    80004264:	f68080e7          	jalr	-152(ra) # 800021c8 <_Znwm>
    80004268:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    8000426c:	ffffe097          	auipc	ra,0xffffe
    80004270:	1d4080e7          	jalr	468(ra) # 80002440 <_ZN6ThreadC1Ev>
    80004274:	00007797          	auipc	a5,0x7
    80004278:	68c78793          	addi	a5,a5,1676 # 8000b900 <_ZTV8Consumer+0x10>
    8000427c:	00fbb023          	sd	a5,0(s7)
    80004280:	029bb023          	sd	s1,32(s7)
    consumer->start();
    80004284:	000b8513          	mv	a0,s7
    80004288:	ffffe097          	auipc	ra,0xffffe
    8000428c:	0f0080e7          	jalr	240(ra) # 80002378 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    80004290:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    80004294:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    80004298:	00008797          	auipc	a5,0x8
    8000429c:	8007b783          	ld	a5,-2048(a5) # 8000ba98 <_ZL10waitForAll>
    800042a0:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800042a4:	02800513          	li	a0,40
    800042a8:	ffffe097          	auipc	ra,0xffffe
    800042ac:	f20080e7          	jalr	-224(ra) # 800021c8 <_Znwm>
    800042b0:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    800042b4:	ffffe097          	auipc	ra,0xffffe
    800042b8:	18c080e7          	jalr	396(ra) # 80002440 <_ZN6ThreadC1Ev>
    800042bc:	00007797          	auipc	a5,0x7
    800042c0:	5f478793          	addi	a5,a5,1524 # 8000b8b0 <_ZTV16ProducerKeyborad+0x10>
    800042c4:	00f4b023          	sd	a5,0(s1)
    800042c8:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800042cc:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    800042d0:	00048513          	mv	a0,s1
    800042d4:	ffffe097          	auipc	ra,0xffffe
    800042d8:	0a4080e7          	jalr	164(ra) # 80002378 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    800042dc:	00100913          	li	s2,1
    800042e0:	0300006f          	j	80004310 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    800042e4:	00007797          	auipc	a5,0x7
    800042e8:	5f478793          	addi	a5,a5,1524 # 8000b8d8 <_ZTV8Producer+0x10>
    800042ec:	00fcb023          	sd	a5,0(s9)
    800042f0:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    800042f4:	00391793          	slli	a5,s2,0x3
    800042f8:	00fa07b3          	add	a5,s4,a5
    800042fc:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80004300:	000c8513          	mv	a0,s9
    80004304:	ffffe097          	auipc	ra,0xffffe
    80004308:	074080e7          	jalr	116(ra) # 80002378 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    8000430c:	0019091b          	addiw	s2,s2,1
    80004310:	05395263          	bge	s2,s3,80004354 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80004314:	00191493          	slli	s1,s2,0x1
    80004318:	012484b3          	add	s1,s1,s2
    8000431c:	00349493          	slli	s1,s1,0x3
    80004320:	009b04b3          	add	s1,s6,s1
    80004324:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80004328:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    8000432c:	00007797          	auipc	a5,0x7
    80004330:	76c7b783          	ld	a5,1900(a5) # 8000ba98 <_ZL10waitForAll>
    80004334:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80004338:	02800513          	li	a0,40
    8000433c:	ffffe097          	auipc	ra,0xffffe
    80004340:	e8c080e7          	jalr	-372(ra) # 800021c8 <_Znwm>
    80004344:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004348:	ffffe097          	auipc	ra,0xffffe
    8000434c:	0f8080e7          	jalr	248(ra) # 80002440 <_ZN6ThreadC1Ev>
    80004350:	f95ff06f          	j	800042e4 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    80004354:	ffffe097          	auipc	ra,0xffffe
    80004358:	088080e7          	jalr	136(ra) # 800023dc <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    8000435c:	00000493          	li	s1,0
    80004360:	0099ce63          	blt	s3,s1,8000437c <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    80004364:	00007517          	auipc	a0,0x7
    80004368:	73453503          	ld	a0,1844(a0) # 8000ba98 <_ZL10waitForAll>
    8000436c:	ffffe097          	auipc	ra,0xffffe
    80004370:	188080e7          	jalr	392(ra) # 800024f4 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80004374:	0014849b          	addiw	s1,s1,1
    80004378:	fe9ff06f          	j	80004360 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    8000437c:	00007517          	auipc	a0,0x7
    80004380:	71c53503          	ld	a0,1820(a0) # 8000ba98 <_ZL10waitForAll>
    80004384:	00050863          	beqz	a0,80004394 <_Z20testConsumerProducerv+0x2f4>
    80004388:	00053783          	ld	a5,0(a0)
    8000438c:	0087b783          	ld	a5,8(a5)
    80004390:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    80004394:	00000493          	li	s1,0
    80004398:	0080006f          	j	800043a0 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    8000439c:	0014849b          	addiw	s1,s1,1
    800043a0:	0334d263          	bge	s1,s3,800043c4 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    800043a4:	00349793          	slli	a5,s1,0x3
    800043a8:	00fa07b3          	add	a5,s4,a5
    800043ac:	0007b503          	ld	a0,0(a5)
    800043b0:	fe0506e3          	beqz	a0,8000439c <_Z20testConsumerProducerv+0x2fc>
    800043b4:	00053783          	ld	a5,0(a0)
    800043b8:	0087b783          	ld	a5,8(a5)
    800043bc:	000780e7          	jalr	a5
    800043c0:	fddff06f          	j	8000439c <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    800043c4:	000b8a63          	beqz	s7,800043d8 <_Z20testConsumerProducerv+0x338>
    800043c8:	000bb783          	ld	a5,0(s7)
    800043cc:	0087b783          	ld	a5,8(a5)
    800043d0:	000b8513          	mv	a0,s7
    800043d4:	000780e7          	jalr	a5
    delete buffer;
    800043d8:	000a8e63          	beqz	s5,800043f4 <_Z20testConsumerProducerv+0x354>
    800043dc:	000a8513          	mv	a0,s5
    800043e0:	00002097          	auipc	ra,0x2
    800043e4:	870080e7          	jalr	-1936(ra) # 80005c50 <_ZN9BufferCPPD1Ev>
    800043e8:	000a8513          	mv	a0,s5
    800043ec:	ffffe097          	auipc	ra,0xffffe
    800043f0:	e2c080e7          	jalr	-468(ra) # 80002218 <_ZdlPv>
    800043f4:	000c0113          	mv	sp,s8
}
    800043f8:	f8040113          	addi	sp,s0,-128
    800043fc:	07813083          	ld	ra,120(sp)
    80004400:	07013403          	ld	s0,112(sp)
    80004404:	06813483          	ld	s1,104(sp)
    80004408:	06013903          	ld	s2,96(sp)
    8000440c:	05813983          	ld	s3,88(sp)
    80004410:	05013a03          	ld	s4,80(sp)
    80004414:	04813a83          	ld	s5,72(sp)
    80004418:	04013b03          	ld	s6,64(sp)
    8000441c:	03813b83          	ld	s7,56(sp)
    80004420:	03013c03          	ld	s8,48(sp)
    80004424:	02813c83          	ld	s9,40(sp)
    80004428:	08010113          	addi	sp,sp,128
    8000442c:	00008067          	ret
    80004430:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80004434:	000a8513          	mv	a0,s5
    80004438:	ffffe097          	auipc	ra,0xffffe
    8000443c:	de0080e7          	jalr	-544(ra) # 80002218 <_ZdlPv>
    80004440:	00048513          	mv	a0,s1
    80004444:	00008097          	auipc	ra,0x8
    80004448:	754080e7          	jalr	1876(ra) # 8000cb98 <_Unwind_Resume>
    8000444c:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80004450:	00090513          	mv	a0,s2
    80004454:	ffffe097          	auipc	ra,0xffffe
    80004458:	dc4080e7          	jalr	-572(ra) # 80002218 <_ZdlPv>
    8000445c:	00048513          	mv	a0,s1
    80004460:	00008097          	auipc	ra,0x8
    80004464:	738080e7          	jalr	1848(ra) # 8000cb98 <_Unwind_Resume>
    80004468:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    8000446c:	000b8513          	mv	a0,s7
    80004470:	ffffe097          	auipc	ra,0xffffe
    80004474:	da8080e7          	jalr	-600(ra) # 80002218 <_ZdlPv>
    80004478:	00048513          	mv	a0,s1
    8000447c:	00008097          	auipc	ra,0x8
    80004480:	71c080e7          	jalr	1820(ra) # 8000cb98 <_Unwind_Resume>
    80004484:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004488:	00048513          	mv	a0,s1
    8000448c:	ffffe097          	auipc	ra,0xffffe
    80004490:	d8c080e7          	jalr	-628(ra) # 80002218 <_ZdlPv>
    80004494:	00090513          	mv	a0,s2
    80004498:	00008097          	auipc	ra,0x8
    8000449c:	700080e7          	jalr	1792(ra) # 8000cb98 <_Unwind_Resume>
    800044a0:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    800044a4:	000c8513          	mv	a0,s9
    800044a8:	ffffe097          	auipc	ra,0xffffe
    800044ac:	d70080e7          	jalr	-656(ra) # 80002218 <_ZdlPv>
    800044b0:	00048513          	mv	a0,s1
    800044b4:	00008097          	auipc	ra,0x8
    800044b8:	6e4080e7          	jalr	1764(ra) # 8000cb98 <_Unwind_Resume>

00000000800044bc <_ZN8Consumer3runEv>:
    void run() override {
    800044bc:	fd010113          	addi	sp,sp,-48
    800044c0:	02113423          	sd	ra,40(sp)
    800044c4:	02813023          	sd	s0,32(sp)
    800044c8:	00913c23          	sd	s1,24(sp)
    800044cc:	01213823          	sd	s2,16(sp)
    800044d0:	01313423          	sd	s3,8(sp)
    800044d4:	03010413          	addi	s0,sp,48
    800044d8:	00050913          	mv	s2,a0
        int i = 0;
    800044dc:	00000993          	li	s3,0
    800044e0:	0100006f          	j	800044f0 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    800044e4:	00a00513          	li	a0,10
    800044e8:	ffffe097          	auipc	ra,0xffffe
    800044ec:	0d8080e7          	jalr	216(ra) # 800025c0 <_ZN7Console4putcEc>
        while (!threadEnd) {
    800044f0:	00007797          	auipc	a5,0x7
    800044f4:	5a07a783          	lw	a5,1440(a5) # 8000ba90 <_ZL9threadEnd>
    800044f8:	04079a63          	bnez	a5,8000454c <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    800044fc:	02093783          	ld	a5,32(s2)
    80004500:	0087b503          	ld	a0,8(a5)
    80004504:	00001097          	auipc	ra,0x1
    80004508:	638080e7          	jalr	1592(ra) # 80005b3c <_ZN9BufferCPP3getEv>
            i++;
    8000450c:	0019849b          	addiw	s1,s3,1
    80004510:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80004514:	0ff57513          	andi	a0,a0,255
    80004518:	ffffe097          	auipc	ra,0xffffe
    8000451c:	0a8080e7          	jalr	168(ra) # 800025c0 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80004520:	05000793          	li	a5,80
    80004524:	02f4e4bb          	remw	s1,s1,a5
    80004528:	fc0494e3          	bnez	s1,800044f0 <_ZN8Consumer3runEv+0x34>
    8000452c:	fb9ff06f          	j	800044e4 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80004530:	02093783          	ld	a5,32(s2)
    80004534:	0087b503          	ld	a0,8(a5)
    80004538:	00001097          	auipc	ra,0x1
    8000453c:	604080e7          	jalr	1540(ra) # 80005b3c <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80004540:	0ff57513          	andi	a0,a0,255
    80004544:	ffffe097          	auipc	ra,0xffffe
    80004548:	07c080e7          	jalr	124(ra) # 800025c0 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    8000454c:	02093783          	ld	a5,32(s2)
    80004550:	0087b503          	ld	a0,8(a5)
    80004554:	00001097          	auipc	ra,0x1
    80004558:	674080e7          	jalr	1652(ra) # 80005bc8 <_ZN9BufferCPP6getCntEv>
    8000455c:	fca04ae3          	bgtz	a0,80004530 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80004560:	02093783          	ld	a5,32(s2)
    80004564:	0107b503          	ld	a0,16(a5)
    80004568:	ffffe097          	auipc	ra,0xffffe
    8000456c:	fb8080e7          	jalr	-72(ra) # 80002520 <_ZN9Semaphore6signalEv>
    }
    80004570:	02813083          	ld	ra,40(sp)
    80004574:	02013403          	ld	s0,32(sp)
    80004578:	01813483          	ld	s1,24(sp)
    8000457c:	01013903          	ld	s2,16(sp)
    80004580:	00813983          	ld	s3,8(sp)
    80004584:	03010113          	addi	sp,sp,48
    80004588:	00008067          	ret

000000008000458c <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    8000458c:	ff010113          	addi	sp,sp,-16
    80004590:	00113423          	sd	ra,8(sp)
    80004594:	00813023          	sd	s0,0(sp)
    80004598:	01010413          	addi	s0,sp,16
    8000459c:	00007797          	auipc	a5,0x7
    800045a0:	36478793          	addi	a5,a5,868 # 8000b900 <_ZTV8Consumer+0x10>
    800045a4:	00f53023          	sd	a5,0(a0)
    800045a8:	ffffe097          	auipc	ra,0xffffe
    800045ac:	b74080e7          	jalr	-1164(ra) # 8000211c <_ZN6ThreadD1Ev>
    800045b0:	00813083          	ld	ra,8(sp)
    800045b4:	00013403          	ld	s0,0(sp)
    800045b8:	01010113          	addi	sp,sp,16
    800045bc:	00008067          	ret

00000000800045c0 <_ZN8ConsumerD0Ev>:
    800045c0:	fe010113          	addi	sp,sp,-32
    800045c4:	00113c23          	sd	ra,24(sp)
    800045c8:	00813823          	sd	s0,16(sp)
    800045cc:	00913423          	sd	s1,8(sp)
    800045d0:	02010413          	addi	s0,sp,32
    800045d4:	00050493          	mv	s1,a0
    800045d8:	00007797          	auipc	a5,0x7
    800045dc:	32878793          	addi	a5,a5,808 # 8000b900 <_ZTV8Consumer+0x10>
    800045e0:	00f53023          	sd	a5,0(a0)
    800045e4:	ffffe097          	auipc	ra,0xffffe
    800045e8:	b38080e7          	jalr	-1224(ra) # 8000211c <_ZN6ThreadD1Ev>
    800045ec:	00048513          	mv	a0,s1
    800045f0:	ffffe097          	auipc	ra,0xffffe
    800045f4:	c28080e7          	jalr	-984(ra) # 80002218 <_ZdlPv>
    800045f8:	01813083          	ld	ra,24(sp)
    800045fc:	01013403          	ld	s0,16(sp)
    80004600:	00813483          	ld	s1,8(sp)
    80004604:	02010113          	addi	sp,sp,32
    80004608:	00008067          	ret

000000008000460c <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    8000460c:	ff010113          	addi	sp,sp,-16
    80004610:	00113423          	sd	ra,8(sp)
    80004614:	00813023          	sd	s0,0(sp)
    80004618:	01010413          	addi	s0,sp,16
    8000461c:	00007797          	auipc	a5,0x7
    80004620:	29478793          	addi	a5,a5,660 # 8000b8b0 <_ZTV16ProducerKeyborad+0x10>
    80004624:	00f53023          	sd	a5,0(a0)
    80004628:	ffffe097          	auipc	ra,0xffffe
    8000462c:	af4080e7          	jalr	-1292(ra) # 8000211c <_ZN6ThreadD1Ev>
    80004630:	00813083          	ld	ra,8(sp)
    80004634:	00013403          	ld	s0,0(sp)
    80004638:	01010113          	addi	sp,sp,16
    8000463c:	00008067          	ret

0000000080004640 <_ZN16ProducerKeyboradD0Ev>:
    80004640:	fe010113          	addi	sp,sp,-32
    80004644:	00113c23          	sd	ra,24(sp)
    80004648:	00813823          	sd	s0,16(sp)
    8000464c:	00913423          	sd	s1,8(sp)
    80004650:	02010413          	addi	s0,sp,32
    80004654:	00050493          	mv	s1,a0
    80004658:	00007797          	auipc	a5,0x7
    8000465c:	25878793          	addi	a5,a5,600 # 8000b8b0 <_ZTV16ProducerKeyborad+0x10>
    80004660:	00f53023          	sd	a5,0(a0)
    80004664:	ffffe097          	auipc	ra,0xffffe
    80004668:	ab8080e7          	jalr	-1352(ra) # 8000211c <_ZN6ThreadD1Ev>
    8000466c:	00048513          	mv	a0,s1
    80004670:	ffffe097          	auipc	ra,0xffffe
    80004674:	ba8080e7          	jalr	-1112(ra) # 80002218 <_ZdlPv>
    80004678:	01813083          	ld	ra,24(sp)
    8000467c:	01013403          	ld	s0,16(sp)
    80004680:	00813483          	ld	s1,8(sp)
    80004684:	02010113          	addi	sp,sp,32
    80004688:	00008067          	ret

000000008000468c <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    8000468c:	ff010113          	addi	sp,sp,-16
    80004690:	00113423          	sd	ra,8(sp)
    80004694:	00813023          	sd	s0,0(sp)
    80004698:	01010413          	addi	s0,sp,16
    8000469c:	00007797          	auipc	a5,0x7
    800046a0:	23c78793          	addi	a5,a5,572 # 8000b8d8 <_ZTV8Producer+0x10>
    800046a4:	00f53023          	sd	a5,0(a0)
    800046a8:	ffffe097          	auipc	ra,0xffffe
    800046ac:	a74080e7          	jalr	-1420(ra) # 8000211c <_ZN6ThreadD1Ev>
    800046b0:	00813083          	ld	ra,8(sp)
    800046b4:	00013403          	ld	s0,0(sp)
    800046b8:	01010113          	addi	sp,sp,16
    800046bc:	00008067          	ret

00000000800046c0 <_ZN8ProducerD0Ev>:
    800046c0:	fe010113          	addi	sp,sp,-32
    800046c4:	00113c23          	sd	ra,24(sp)
    800046c8:	00813823          	sd	s0,16(sp)
    800046cc:	00913423          	sd	s1,8(sp)
    800046d0:	02010413          	addi	s0,sp,32
    800046d4:	00050493          	mv	s1,a0
    800046d8:	00007797          	auipc	a5,0x7
    800046dc:	20078793          	addi	a5,a5,512 # 8000b8d8 <_ZTV8Producer+0x10>
    800046e0:	00f53023          	sd	a5,0(a0)
    800046e4:	ffffe097          	auipc	ra,0xffffe
    800046e8:	a38080e7          	jalr	-1480(ra) # 8000211c <_ZN6ThreadD1Ev>
    800046ec:	00048513          	mv	a0,s1
    800046f0:	ffffe097          	auipc	ra,0xffffe
    800046f4:	b28080e7          	jalr	-1240(ra) # 80002218 <_ZdlPv>
    800046f8:	01813083          	ld	ra,24(sp)
    800046fc:	01013403          	ld	s0,16(sp)
    80004700:	00813483          	ld	s1,8(sp)
    80004704:	02010113          	addi	sp,sp,32
    80004708:	00008067          	ret

000000008000470c <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    8000470c:	fe010113          	addi	sp,sp,-32
    80004710:	00113c23          	sd	ra,24(sp)
    80004714:	00813823          	sd	s0,16(sp)
    80004718:	00913423          	sd	s1,8(sp)
    8000471c:	02010413          	addi	s0,sp,32
    80004720:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80004724:	ffffd097          	auipc	ra,0xffffd
    80004728:	e44080e7          	jalr	-444(ra) # 80001568 <_Z4getcv>
    8000472c:	0005059b          	sext.w	a1,a0
    80004730:	01b00793          	li	a5,27
    80004734:	00f58c63          	beq	a1,a5,8000474c <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80004738:	0204b783          	ld	a5,32(s1)
    8000473c:	0087b503          	ld	a0,8(a5)
    80004740:	00001097          	auipc	ra,0x1
    80004744:	36c080e7          	jalr	876(ra) # 80005aac <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80004748:	fddff06f          	j	80004724 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    8000474c:	00100793          	li	a5,1
    80004750:	00007717          	auipc	a4,0x7
    80004754:	34f72023          	sw	a5,832(a4) # 8000ba90 <_ZL9threadEnd>
        td->buffer->put('!');
    80004758:	0204b783          	ld	a5,32(s1)
    8000475c:	02100593          	li	a1,33
    80004760:	0087b503          	ld	a0,8(a5)
    80004764:	00001097          	auipc	ra,0x1
    80004768:	348080e7          	jalr	840(ra) # 80005aac <_ZN9BufferCPP3putEi>
        td->sem->signal();
    8000476c:	0204b783          	ld	a5,32(s1)
    80004770:	0107b503          	ld	a0,16(a5)
    80004774:	ffffe097          	auipc	ra,0xffffe
    80004778:	dac080e7          	jalr	-596(ra) # 80002520 <_ZN9Semaphore6signalEv>
    }
    8000477c:	01813083          	ld	ra,24(sp)
    80004780:	01013403          	ld	s0,16(sp)
    80004784:	00813483          	ld	s1,8(sp)
    80004788:	02010113          	addi	sp,sp,32
    8000478c:	00008067          	ret

0000000080004790 <_ZN8Producer3runEv>:
    void run() override {
    80004790:	fe010113          	addi	sp,sp,-32
    80004794:	00113c23          	sd	ra,24(sp)
    80004798:	00813823          	sd	s0,16(sp)
    8000479c:	00913423          	sd	s1,8(sp)
    800047a0:	01213023          	sd	s2,0(sp)
    800047a4:	02010413          	addi	s0,sp,32
    800047a8:	00050493          	mv	s1,a0
        int i = 0;
    800047ac:	00000913          	li	s2,0
        while (!threadEnd) {
    800047b0:	00007797          	auipc	a5,0x7
    800047b4:	2e07a783          	lw	a5,736(a5) # 8000ba90 <_ZL9threadEnd>
    800047b8:	04079263          	bnez	a5,800047fc <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    800047bc:	0204b783          	ld	a5,32(s1)
    800047c0:	0007a583          	lw	a1,0(a5)
    800047c4:	0305859b          	addiw	a1,a1,48
    800047c8:	0087b503          	ld	a0,8(a5)
    800047cc:	00001097          	auipc	ra,0x1
    800047d0:	2e0080e7          	jalr	736(ra) # 80005aac <_ZN9BufferCPP3putEi>
            i++;
    800047d4:	0019071b          	addiw	a4,s2,1
    800047d8:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    800047dc:	0204b783          	ld	a5,32(s1)
    800047e0:	0007a783          	lw	a5,0(a5)
    800047e4:	00e787bb          	addw	a5,a5,a4
    800047e8:	00500513          	li	a0,5
    800047ec:	02a7e53b          	remw	a0,a5,a0
    800047f0:	ffffe097          	auipc	ra,0xffffe
    800047f4:	c14080e7          	jalr	-1004(ra) # 80002404 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    800047f8:	fb9ff06f          	j	800047b0 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    800047fc:	0204b783          	ld	a5,32(s1)
    80004800:	0107b503          	ld	a0,16(a5)
    80004804:	ffffe097          	auipc	ra,0xffffe
    80004808:	d1c080e7          	jalr	-740(ra) # 80002520 <_ZN9Semaphore6signalEv>
    }
    8000480c:	01813083          	ld	ra,24(sp)
    80004810:	01013403          	ld	s0,16(sp)
    80004814:	00813483          	ld	s1,8(sp)
    80004818:	00013903          	ld	s2,0(sp)
    8000481c:	02010113          	addi	sp,sp,32
    80004820:	00008067          	ret

0000000080004824 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004824:	fe010113          	addi	sp,sp,-32
    80004828:	00113c23          	sd	ra,24(sp)
    8000482c:	00813823          	sd	s0,16(sp)
    80004830:	00913423          	sd	s1,8(sp)
    80004834:	01213023          	sd	s2,0(sp)
    80004838:	02010413          	addi	s0,sp,32
    8000483c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004840:	00100793          	li	a5,1
    80004844:	02a7f863          	bgeu	a5,a0,80004874 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004848:	00a00793          	li	a5,10
    8000484c:	02f577b3          	remu	a5,a0,a5
    80004850:	02078e63          	beqz	a5,8000488c <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004854:	fff48513          	addi	a0,s1,-1
    80004858:	00000097          	auipc	ra,0x0
    8000485c:	fcc080e7          	jalr	-52(ra) # 80004824 <_ZL9fibonaccim>
    80004860:	00050913          	mv	s2,a0
    80004864:	ffe48513          	addi	a0,s1,-2
    80004868:	00000097          	auipc	ra,0x0
    8000486c:	fbc080e7          	jalr	-68(ra) # 80004824 <_ZL9fibonaccim>
    80004870:	00a90533          	add	a0,s2,a0
}
    80004874:	01813083          	ld	ra,24(sp)
    80004878:	01013403          	ld	s0,16(sp)
    8000487c:	00813483          	ld	s1,8(sp)
    80004880:	00013903          	ld	s2,0(sp)
    80004884:	02010113          	addi	sp,sp,32
    80004888:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    8000488c:	ffffd097          	auipc	ra,0xffffd
    80004890:	b9c080e7          	jalr	-1124(ra) # 80001428 <_Z15thread_dispatchv>
    80004894:	fc1ff06f          	j	80004854 <_ZL9fibonaccim+0x30>

0000000080004898 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80004898:	fe010113          	addi	sp,sp,-32
    8000489c:	00113c23          	sd	ra,24(sp)
    800048a0:	00813823          	sd	s0,16(sp)
    800048a4:	00913423          	sd	s1,8(sp)
    800048a8:	01213023          	sd	s2,0(sp)
    800048ac:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800048b0:	00a00493          	li	s1,10
    800048b4:	0400006f          	j	800048f4 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800048b8:	00005517          	auipc	a0,0x5
    800048bc:	b1050513          	addi	a0,a0,-1264 # 800093c8 <CONSOLE_STATUS+0x3b8>
    800048c0:	00001097          	auipc	ra,0x1
    800048c4:	dc8080e7          	jalr	-568(ra) # 80005688 <_Z11printStringPKc>
    800048c8:	00000613          	li	a2,0
    800048cc:	00a00593          	li	a1,10
    800048d0:	00048513          	mv	a0,s1
    800048d4:	00001097          	auipc	ra,0x1
    800048d8:	f64080e7          	jalr	-156(ra) # 80005838 <_Z8printIntiii>
    800048dc:	00005517          	auipc	a0,0x5
    800048e0:	cdc50513          	addi	a0,a0,-804 # 800095b8 <CONSOLE_STATUS+0x5a8>
    800048e4:	00001097          	auipc	ra,0x1
    800048e8:	da4080e7          	jalr	-604(ra) # 80005688 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800048ec:	0014849b          	addiw	s1,s1,1
    800048f0:	0ff4f493          	andi	s1,s1,255
    800048f4:	00c00793          	li	a5,12
    800048f8:	fc97f0e3          	bgeu	a5,s1,800048b8 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800048fc:	00005517          	auipc	a0,0x5
    80004900:	ad450513          	addi	a0,a0,-1324 # 800093d0 <CONSOLE_STATUS+0x3c0>
    80004904:	00001097          	auipc	ra,0x1
    80004908:	d84080e7          	jalr	-636(ra) # 80005688 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    8000490c:	00500313          	li	t1,5
    thread_dispatch();
    80004910:	ffffd097          	auipc	ra,0xffffd
    80004914:	b18080e7          	jalr	-1256(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004918:	01000513          	li	a0,16
    8000491c:	00000097          	auipc	ra,0x0
    80004920:	f08080e7          	jalr	-248(ra) # 80004824 <_ZL9fibonaccim>
    80004924:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004928:	00005517          	auipc	a0,0x5
    8000492c:	ab850513          	addi	a0,a0,-1352 # 800093e0 <CONSOLE_STATUS+0x3d0>
    80004930:	00001097          	auipc	ra,0x1
    80004934:	d58080e7          	jalr	-680(ra) # 80005688 <_Z11printStringPKc>
    80004938:	00000613          	li	a2,0
    8000493c:	00a00593          	li	a1,10
    80004940:	0009051b          	sext.w	a0,s2
    80004944:	00001097          	auipc	ra,0x1
    80004948:	ef4080e7          	jalr	-268(ra) # 80005838 <_Z8printIntiii>
    8000494c:	00005517          	auipc	a0,0x5
    80004950:	c6c50513          	addi	a0,a0,-916 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80004954:	00001097          	auipc	ra,0x1
    80004958:	d34080e7          	jalr	-716(ra) # 80005688 <_Z11printStringPKc>
    8000495c:	0400006f          	j	8000499c <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004960:	00005517          	auipc	a0,0x5
    80004964:	a6850513          	addi	a0,a0,-1432 # 800093c8 <CONSOLE_STATUS+0x3b8>
    80004968:	00001097          	auipc	ra,0x1
    8000496c:	d20080e7          	jalr	-736(ra) # 80005688 <_Z11printStringPKc>
    80004970:	00000613          	li	a2,0
    80004974:	00a00593          	li	a1,10
    80004978:	00048513          	mv	a0,s1
    8000497c:	00001097          	auipc	ra,0x1
    80004980:	ebc080e7          	jalr	-324(ra) # 80005838 <_Z8printIntiii>
    80004984:	00005517          	auipc	a0,0x5
    80004988:	c3450513          	addi	a0,a0,-972 # 800095b8 <CONSOLE_STATUS+0x5a8>
    8000498c:	00001097          	auipc	ra,0x1
    80004990:	cfc080e7          	jalr	-772(ra) # 80005688 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004994:	0014849b          	addiw	s1,s1,1
    80004998:	0ff4f493          	andi	s1,s1,255
    8000499c:	00f00793          	li	a5,15
    800049a0:	fc97f0e3          	bgeu	a5,s1,80004960 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    800049a4:	00005517          	auipc	a0,0x5
    800049a8:	a4c50513          	addi	a0,a0,-1460 # 800093f0 <CONSOLE_STATUS+0x3e0>
    800049ac:	00001097          	auipc	ra,0x1
    800049b0:	cdc080e7          	jalr	-804(ra) # 80005688 <_Z11printStringPKc>
    finishedD = true;
    800049b4:	00100793          	li	a5,1
    800049b8:	00007717          	auipc	a4,0x7
    800049bc:	0ef70423          	sb	a5,232(a4) # 8000baa0 <_ZL9finishedD>
    thread_dispatch();
    800049c0:	ffffd097          	auipc	ra,0xffffd
    800049c4:	a68080e7          	jalr	-1432(ra) # 80001428 <_Z15thread_dispatchv>
}
    800049c8:	01813083          	ld	ra,24(sp)
    800049cc:	01013403          	ld	s0,16(sp)
    800049d0:	00813483          	ld	s1,8(sp)
    800049d4:	00013903          	ld	s2,0(sp)
    800049d8:	02010113          	addi	sp,sp,32
    800049dc:	00008067          	ret

00000000800049e0 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800049e0:	fe010113          	addi	sp,sp,-32
    800049e4:	00113c23          	sd	ra,24(sp)
    800049e8:	00813823          	sd	s0,16(sp)
    800049ec:	00913423          	sd	s1,8(sp)
    800049f0:	01213023          	sd	s2,0(sp)
    800049f4:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800049f8:	00000493          	li	s1,0
    800049fc:	0400006f          	j	80004a3c <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80004a00:	00005517          	auipc	a0,0x5
    80004a04:	99850513          	addi	a0,a0,-1640 # 80009398 <CONSOLE_STATUS+0x388>
    80004a08:	00001097          	auipc	ra,0x1
    80004a0c:	c80080e7          	jalr	-896(ra) # 80005688 <_Z11printStringPKc>
    80004a10:	00000613          	li	a2,0
    80004a14:	00a00593          	li	a1,10
    80004a18:	00048513          	mv	a0,s1
    80004a1c:	00001097          	auipc	ra,0x1
    80004a20:	e1c080e7          	jalr	-484(ra) # 80005838 <_Z8printIntiii>
    80004a24:	00005517          	auipc	a0,0x5
    80004a28:	b9450513          	addi	a0,a0,-1132 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80004a2c:	00001097          	auipc	ra,0x1
    80004a30:	c5c080e7          	jalr	-932(ra) # 80005688 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004a34:	0014849b          	addiw	s1,s1,1
    80004a38:	0ff4f493          	andi	s1,s1,255
    80004a3c:	00200793          	li	a5,2
    80004a40:	fc97f0e3          	bgeu	a5,s1,80004a00 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80004a44:	00005517          	auipc	a0,0x5
    80004a48:	95c50513          	addi	a0,a0,-1700 # 800093a0 <CONSOLE_STATUS+0x390>
    80004a4c:	00001097          	auipc	ra,0x1
    80004a50:	c3c080e7          	jalr	-964(ra) # 80005688 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004a54:	00700313          	li	t1,7
    thread_dispatch();
    80004a58:	ffffd097          	auipc	ra,0xffffd
    80004a5c:	9d0080e7          	jalr	-1584(ra) # 80001428 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004a60:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80004a64:	00005517          	auipc	a0,0x5
    80004a68:	94c50513          	addi	a0,a0,-1716 # 800093b0 <CONSOLE_STATUS+0x3a0>
    80004a6c:	00001097          	auipc	ra,0x1
    80004a70:	c1c080e7          	jalr	-996(ra) # 80005688 <_Z11printStringPKc>
    80004a74:	00000613          	li	a2,0
    80004a78:	00a00593          	li	a1,10
    80004a7c:	0009051b          	sext.w	a0,s2
    80004a80:	00001097          	auipc	ra,0x1
    80004a84:	db8080e7          	jalr	-584(ra) # 80005838 <_Z8printIntiii>
    80004a88:	00005517          	auipc	a0,0x5
    80004a8c:	b3050513          	addi	a0,a0,-1232 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80004a90:	00001097          	auipc	ra,0x1
    80004a94:	bf8080e7          	jalr	-1032(ra) # 80005688 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80004a98:	00c00513          	li	a0,12
    80004a9c:	00000097          	auipc	ra,0x0
    80004aa0:	d88080e7          	jalr	-632(ra) # 80004824 <_ZL9fibonaccim>
    80004aa4:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80004aa8:	00005517          	auipc	a0,0x5
    80004aac:	91050513          	addi	a0,a0,-1776 # 800093b8 <CONSOLE_STATUS+0x3a8>
    80004ab0:	00001097          	auipc	ra,0x1
    80004ab4:	bd8080e7          	jalr	-1064(ra) # 80005688 <_Z11printStringPKc>
    80004ab8:	00000613          	li	a2,0
    80004abc:	00a00593          	li	a1,10
    80004ac0:	0009051b          	sext.w	a0,s2
    80004ac4:	00001097          	auipc	ra,0x1
    80004ac8:	d74080e7          	jalr	-652(ra) # 80005838 <_Z8printIntiii>
    80004acc:	00005517          	auipc	a0,0x5
    80004ad0:	aec50513          	addi	a0,a0,-1300 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80004ad4:	00001097          	auipc	ra,0x1
    80004ad8:	bb4080e7          	jalr	-1100(ra) # 80005688 <_Z11printStringPKc>
    80004adc:	0400006f          	j	80004b1c <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80004ae0:	00005517          	auipc	a0,0x5
    80004ae4:	8b850513          	addi	a0,a0,-1864 # 80009398 <CONSOLE_STATUS+0x388>
    80004ae8:	00001097          	auipc	ra,0x1
    80004aec:	ba0080e7          	jalr	-1120(ra) # 80005688 <_Z11printStringPKc>
    80004af0:	00000613          	li	a2,0
    80004af4:	00a00593          	li	a1,10
    80004af8:	00048513          	mv	a0,s1
    80004afc:	00001097          	auipc	ra,0x1
    80004b00:	d3c080e7          	jalr	-708(ra) # 80005838 <_Z8printIntiii>
    80004b04:	00005517          	auipc	a0,0x5
    80004b08:	ab450513          	addi	a0,a0,-1356 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80004b0c:	00001097          	auipc	ra,0x1
    80004b10:	b7c080e7          	jalr	-1156(ra) # 80005688 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004b14:	0014849b          	addiw	s1,s1,1
    80004b18:	0ff4f493          	andi	s1,s1,255
    80004b1c:	00500793          	li	a5,5
    80004b20:	fc97f0e3          	bgeu	a5,s1,80004ae0 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80004b24:	00005517          	auipc	a0,0x5
    80004b28:	84c50513          	addi	a0,a0,-1972 # 80009370 <CONSOLE_STATUS+0x360>
    80004b2c:	00001097          	auipc	ra,0x1
    80004b30:	b5c080e7          	jalr	-1188(ra) # 80005688 <_Z11printStringPKc>
    finishedC = true;
    80004b34:	00100793          	li	a5,1
    80004b38:	00007717          	auipc	a4,0x7
    80004b3c:	f6f704a3          	sb	a5,-151(a4) # 8000baa1 <_ZL9finishedC>
    thread_dispatch();
    80004b40:	ffffd097          	auipc	ra,0xffffd
    80004b44:	8e8080e7          	jalr	-1816(ra) # 80001428 <_Z15thread_dispatchv>
}
    80004b48:	01813083          	ld	ra,24(sp)
    80004b4c:	01013403          	ld	s0,16(sp)
    80004b50:	00813483          	ld	s1,8(sp)
    80004b54:	00013903          	ld	s2,0(sp)
    80004b58:	02010113          	addi	sp,sp,32
    80004b5c:	00008067          	ret

0000000080004b60 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80004b60:	fe010113          	addi	sp,sp,-32
    80004b64:	00113c23          	sd	ra,24(sp)
    80004b68:	00813823          	sd	s0,16(sp)
    80004b6c:	00913423          	sd	s1,8(sp)
    80004b70:	01213023          	sd	s2,0(sp)
    80004b74:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80004b78:	00000913          	li	s2,0
    80004b7c:	0380006f          	j	80004bb4 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80004b80:	ffffd097          	auipc	ra,0xffffd
    80004b84:	8a8080e7          	jalr	-1880(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004b88:	00148493          	addi	s1,s1,1
    80004b8c:	000027b7          	lui	a5,0x2
    80004b90:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004b94:	0097ee63          	bltu	a5,s1,80004bb0 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004b98:	00000713          	li	a4,0
    80004b9c:	000077b7          	lui	a5,0x7
    80004ba0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004ba4:	fce7eee3          	bltu	a5,a4,80004b80 <_ZL11workerBodyBPv+0x20>
    80004ba8:	00170713          	addi	a4,a4,1
    80004bac:	ff1ff06f          	j	80004b9c <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80004bb0:	00190913          	addi	s2,s2,1
    80004bb4:	00f00793          	li	a5,15
    80004bb8:	0527e063          	bltu	a5,s2,80004bf8 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80004bbc:	00004517          	auipc	a0,0x4
    80004bc0:	7c450513          	addi	a0,a0,1988 # 80009380 <CONSOLE_STATUS+0x370>
    80004bc4:	00001097          	auipc	ra,0x1
    80004bc8:	ac4080e7          	jalr	-1340(ra) # 80005688 <_Z11printStringPKc>
    80004bcc:	00000613          	li	a2,0
    80004bd0:	00a00593          	li	a1,10
    80004bd4:	0009051b          	sext.w	a0,s2
    80004bd8:	00001097          	auipc	ra,0x1
    80004bdc:	c60080e7          	jalr	-928(ra) # 80005838 <_Z8printIntiii>
    80004be0:	00005517          	auipc	a0,0x5
    80004be4:	9d850513          	addi	a0,a0,-1576 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80004be8:	00001097          	auipc	ra,0x1
    80004bec:	aa0080e7          	jalr	-1376(ra) # 80005688 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004bf0:	00000493          	li	s1,0
    80004bf4:	f99ff06f          	j	80004b8c <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80004bf8:	00004517          	auipc	a0,0x4
    80004bfc:	79050513          	addi	a0,a0,1936 # 80009388 <CONSOLE_STATUS+0x378>
    80004c00:	00001097          	auipc	ra,0x1
    80004c04:	a88080e7          	jalr	-1400(ra) # 80005688 <_Z11printStringPKc>
    finishedB = true;
    80004c08:	00100793          	li	a5,1
    80004c0c:	00007717          	auipc	a4,0x7
    80004c10:	e8f70b23          	sb	a5,-362(a4) # 8000baa2 <_ZL9finishedB>
    thread_dispatch();
    80004c14:	ffffd097          	auipc	ra,0xffffd
    80004c18:	814080e7          	jalr	-2028(ra) # 80001428 <_Z15thread_dispatchv>
}
    80004c1c:	01813083          	ld	ra,24(sp)
    80004c20:	01013403          	ld	s0,16(sp)
    80004c24:	00813483          	ld	s1,8(sp)
    80004c28:	00013903          	ld	s2,0(sp)
    80004c2c:	02010113          	addi	sp,sp,32
    80004c30:	00008067          	ret

0000000080004c34 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80004c34:	fe010113          	addi	sp,sp,-32
    80004c38:	00113c23          	sd	ra,24(sp)
    80004c3c:	00813823          	sd	s0,16(sp)
    80004c40:	00913423          	sd	s1,8(sp)
    80004c44:	01213023          	sd	s2,0(sp)
    80004c48:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80004c4c:	00000913          	li	s2,0
    80004c50:	0380006f          	j	80004c88 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80004c54:	ffffc097          	auipc	ra,0xffffc
    80004c58:	7d4080e7          	jalr	2004(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004c5c:	00148493          	addi	s1,s1,1
    80004c60:	000027b7          	lui	a5,0x2
    80004c64:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004c68:	0097ee63          	bltu	a5,s1,80004c84 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004c6c:	00000713          	li	a4,0
    80004c70:	000077b7          	lui	a5,0x7
    80004c74:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004c78:	fce7eee3          	bltu	a5,a4,80004c54 <_ZL11workerBodyAPv+0x20>
    80004c7c:	00170713          	addi	a4,a4,1
    80004c80:	ff1ff06f          	j	80004c70 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80004c84:	00190913          	addi	s2,s2,1
    80004c88:	00900793          	li	a5,9
    80004c8c:	0527e063          	bltu	a5,s2,80004ccc <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80004c90:	00004517          	auipc	a0,0x4
    80004c94:	6d850513          	addi	a0,a0,1752 # 80009368 <CONSOLE_STATUS+0x358>
    80004c98:	00001097          	auipc	ra,0x1
    80004c9c:	9f0080e7          	jalr	-1552(ra) # 80005688 <_Z11printStringPKc>
    80004ca0:	00000613          	li	a2,0
    80004ca4:	00a00593          	li	a1,10
    80004ca8:	0009051b          	sext.w	a0,s2
    80004cac:	00001097          	auipc	ra,0x1
    80004cb0:	b8c080e7          	jalr	-1140(ra) # 80005838 <_Z8printIntiii>
    80004cb4:	00005517          	auipc	a0,0x5
    80004cb8:	90450513          	addi	a0,a0,-1788 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80004cbc:	00001097          	auipc	ra,0x1
    80004cc0:	9cc080e7          	jalr	-1588(ra) # 80005688 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004cc4:	00000493          	li	s1,0
    80004cc8:	f99ff06f          	j	80004c60 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80004ccc:	00004517          	auipc	a0,0x4
    80004cd0:	6a450513          	addi	a0,a0,1700 # 80009370 <CONSOLE_STATUS+0x360>
    80004cd4:	00001097          	auipc	ra,0x1
    80004cd8:	9b4080e7          	jalr	-1612(ra) # 80005688 <_Z11printStringPKc>
    finishedA = true;
    80004cdc:	00100793          	li	a5,1
    80004ce0:	00007717          	auipc	a4,0x7
    80004ce4:	dcf701a3          	sb	a5,-573(a4) # 8000baa3 <_ZL9finishedA>
}
    80004ce8:	01813083          	ld	ra,24(sp)
    80004cec:	01013403          	ld	s0,16(sp)
    80004cf0:	00813483          	ld	s1,8(sp)
    80004cf4:	00013903          	ld	s2,0(sp)
    80004cf8:	02010113          	addi	sp,sp,32
    80004cfc:	00008067          	ret

0000000080004d00 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80004d00:	fd010113          	addi	sp,sp,-48
    80004d04:	02113423          	sd	ra,40(sp)
    80004d08:	02813023          	sd	s0,32(sp)
    80004d0c:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80004d10:	00000613          	li	a2,0
    80004d14:	00000597          	auipc	a1,0x0
    80004d18:	f2058593          	addi	a1,a1,-224 # 80004c34 <_ZL11workerBodyAPv>
    80004d1c:	fd040513          	addi	a0,s0,-48
    80004d20:	ffffc097          	auipc	ra,0xffffc
    80004d24:	660080e7          	jalr	1632(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80004d28:	00004517          	auipc	a0,0x4
    80004d2c:	6d850513          	addi	a0,a0,1752 # 80009400 <CONSOLE_STATUS+0x3f0>
    80004d30:	00001097          	auipc	ra,0x1
    80004d34:	958080e7          	jalr	-1704(ra) # 80005688 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80004d38:	00000613          	li	a2,0
    80004d3c:	00000597          	auipc	a1,0x0
    80004d40:	e2458593          	addi	a1,a1,-476 # 80004b60 <_ZL11workerBodyBPv>
    80004d44:	fd840513          	addi	a0,s0,-40
    80004d48:	ffffc097          	auipc	ra,0xffffc
    80004d4c:	638080e7          	jalr	1592(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80004d50:	00004517          	auipc	a0,0x4
    80004d54:	6c850513          	addi	a0,a0,1736 # 80009418 <CONSOLE_STATUS+0x408>
    80004d58:	00001097          	auipc	ra,0x1
    80004d5c:	930080e7          	jalr	-1744(ra) # 80005688 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80004d60:	00000613          	li	a2,0
    80004d64:	00000597          	auipc	a1,0x0
    80004d68:	c7c58593          	addi	a1,a1,-900 # 800049e0 <_ZL11workerBodyCPv>
    80004d6c:	fe040513          	addi	a0,s0,-32
    80004d70:	ffffc097          	auipc	ra,0xffffc
    80004d74:	610080e7          	jalr	1552(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80004d78:	00004517          	auipc	a0,0x4
    80004d7c:	6b850513          	addi	a0,a0,1720 # 80009430 <CONSOLE_STATUS+0x420>
    80004d80:	00001097          	auipc	ra,0x1
    80004d84:	908080e7          	jalr	-1784(ra) # 80005688 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80004d88:	00000613          	li	a2,0
    80004d8c:	00000597          	auipc	a1,0x0
    80004d90:	b0c58593          	addi	a1,a1,-1268 # 80004898 <_ZL11workerBodyDPv>
    80004d94:	fe840513          	addi	a0,s0,-24
    80004d98:	ffffc097          	auipc	ra,0xffffc
    80004d9c:	5e8080e7          	jalr	1512(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80004da0:	00004517          	auipc	a0,0x4
    80004da4:	6a850513          	addi	a0,a0,1704 # 80009448 <CONSOLE_STATUS+0x438>
    80004da8:	00001097          	auipc	ra,0x1
    80004dac:	8e0080e7          	jalr	-1824(ra) # 80005688 <_Z11printStringPKc>
    80004db0:	00c0006f          	j	80004dbc <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80004db4:	ffffc097          	auipc	ra,0xffffc
    80004db8:	674080e7          	jalr	1652(ra) # 80001428 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80004dbc:	00007797          	auipc	a5,0x7
    80004dc0:	ce77c783          	lbu	a5,-793(a5) # 8000baa3 <_ZL9finishedA>
    80004dc4:	fe0788e3          	beqz	a5,80004db4 <_Z18Threads_C_API_testv+0xb4>
    80004dc8:	00007797          	auipc	a5,0x7
    80004dcc:	cda7c783          	lbu	a5,-806(a5) # 8000baa2 <_ZL9finishedB>
    80004dd0:	fe0782e3          	beqz	a5,80004db4 <_Z18Threads_C_API_testv+0xb4>
    80004dd4:	00007797          	auipc	a5,0x7
    80004dd8:	ccd7c783          	lbu	a5,-819(a5) # 8000baa1 <_ZL9finishedC>
    80004ddc:	fc078ce3          	beqz	a5,80004db4 <_Z18Threads_C_API_testv+0xb4>
    80004de0:	00007797          	auipc	a5,0x7
    80004de4:	cc07c783          	lbu	a5,-832(a5) # 8000baa0 <_ZL9finishedD>
    80004de8:	fc0786e3          	beqz	a5,80004db4 <_Z18Threads_C_API_testv+0xb4>
    }

}
    80004dec:	02813083          	ld	ra,40(sp)
    80004df0:	02013403          	ld	s0,32(sp)
    80004df4:	03010113          	addi	sp,sp,48
    80004df8:	00008067          	ret

0000000080004dfc <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80004dfc:	fd010113          	addi	sp,sp,-48
    80004e00:	02113423          	sd	ra,40(sp)
    80004e04:	02813023          	sd	s0,32(sp)
    80004e08:	00913c23          	sd	s1,24(sp)
    80004e0c:	01213823          	sd	s2,16(sp)
    80004e10:	01313423          	sd	s3,8(sp)
    80004e14:	03010413          	addi	s0,sp,48
    80004e18:	00050993          	mv	s3,a0
    80004e1c:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80004e20:	00000913          	li	s2,0
    80004e24:	00c0006f          	j	80004e30 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80004e28:	ffffd097          	auipc	ra,0xffffd
    80004e2c:	5b4080e7          	jalr	1460(ra) # 800023dc <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80004e30:	ffffc097          	auipc	ra,0xffffc
    80004e34:	738080e7          	jalr	1848(ra) # 80001568 <_Z4getcv>
    80004e38:	0005059b          	sext.w	a1,a0
    80004e3c:	01b00793          	li	a5,27
    80004e40:	02f58a63          	beq	a1,a5,80004e74 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80004e44:	0084b503          	ld	a0,8(s1)
    80004e48:	00001097          	auipc	ra,0x1
    80004e4c:	c64080e7          	jalr	-924(ra) # 80005aac <_ZN9BufferCPP3putEi>
        i++;
    80004e50:	0019071b          	addiw	a4,s2,1
    80004e54:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80004e58:	0004a683          	lw	a3,0(s1)
    80004e5c:	0026979b          	slliw	a5,a3,0x2
    80004e60:	00d787bb          	addw	a5,a5,a3
    80004e64:	0017979b          	slliw	a5,a5,0x1
    80004e68:	02f767bb          	remw	a5,a4,a5
    80004e6c:	fc0792e3          	bnez	a5,80004e30 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    80004e70:	fb9ff06f          	j	80004e28 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80004e74:	00100793          	li	a5,1
    80004e78:	00007717          	auipc	a4,0x7
    80004e7c:	c2f72823          	sw	a5,-976(a4) # 8000baa8 <_ZL9threadEnd>
    td->buffer->put('!');
    80004e80:	0209b783          	ld	a5,32(s3)
    80004e84:	02100593          	li	a1,33
    80004e88:	0087b503          	ld	a0,8(a5)
    80004e8c:	00001097          	auipc	ra,0x1
    80004e90:	c20080e7          	jalr	-992(ra) # 80005aac <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80004e94:	0104b503          	ld	a0,16(s1)
    80004e98:	ffffd097          	auipc	ra,0xffffd
    80004e9c:	688080e7          	jalr	1672(ra) # 80002520 <_ZN9Semaphore6signalEv>
}
    80004ea0:	02813083          	ld	ra,40(sp)
    80004ea4:	02013403          	ld	s0,32(sp)
    80004ea8:	01813483          	ld	s1,24(sp)
    80004eac:	01013903          	ld	s2,16(sp)
    80004eb0:	00813983          	ld	s3,8(sp)
    80004eb4:	03010113          	addi	sp,sp,48
    80004eb8:	00008067          	ret

0000000080004ebc <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    80004ebc:	fe010113          	addi	sp,sp,-32
    80004ec0:	00113c23          	sd	ra,24(sp)
    80004ec4:	00813823          	sd	s0,16(sp)
    80004ec8:	00913423          	sd	s1,8(sp)
    80004ecc:	01213023          	sd	s2,0(sp)
    80004ed0:	02010413          	addi	s0,sp,32
    80004ed4:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80004ed8:	00000913          	li	s2,0
    80004edc:	00c0006f          	j	80004ee8 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80004ee0:	ffffd097          	auipc	ra,0xffffd
    80004ee4:	4fc080e7          	jalr	1276(ra) # 800023dc <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80004ee8:	00007797          	auipc	a5,0x7
    80004eec:	bc07a783          	lw	a5,-1088(a5) # 8000baa8 <_ZL9threadEnd>
    80004ef0:	02079e63          	bnez	a5,80004f2c <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80004ef4:	0004a583          	lw	a1,0(s1)
    80004ef8:	0305859b          	addiw	a1,a1,48
    80004efc:	0084b503          	ld	a0,8(s1)
    80004f00:	00001097          	auipc	ra,0x1
    80004f04:	bac080e7          	jalr	-1108(ra) # 80005aac <_ZN9BufferCPP3putEi>
        i++;
    80004f08:	0019071b          	addiw	a4,s2,1
    80004f0c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80004f10:	0004a683          	lw	a3,0(s1)
    80004f14:	0026979b          	slliw	a5,a3,0x2
    80004f18:	00d787bb          	addw	a5,a5,a3
    80004f1c:	0017979b          	slliw	a5,a5,0x1
    80004f20:	02f767bb          	remw	a5,a4,a5
    80004f24:	fc0792e3          	bnez	a5,80004ee8 <_ZN12ProducerSync8producerEPv+0x2c>
    80004f28:	fb9ff06f          	j	80004ee0 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80004f2c:	0104b503          	ld	a0,16(s1)
    80004f30:	ffffd097          	auipc	ra,0xffffd
    80004f34:	5f0080e7          	jalr	1520(ra) # 80002520 <_ZN9Semaphore6signalEv>
}
    80004f38:	01813083          	ld	ra,24(sp)
    80004f3c:	01013403          	ld	s0,16(sp)
    80004f40:	00813483          	ld	s1,8(sp)
    80004f44:	00013903          	ld	s2,0(sp)
    80004f48:	02010113          	addi	sp,sp,32
    80004f4c:	00008067          	ret

0000000080004f50 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80004f50:	fd010113          	addi	sp,sp,-48
    80004f54:	02113423          	sd	ra,40(sp)
    80004f58:	02813023          	sd	s0,32(sp)
    80004f5c:	00913c23          	sd	s1,24(sp)
    80004f60:	01213823          	sd	s2,16(sp)
    80004f64:	01313423          	sd	s3,8(sp)
    80004f68:	01413023          	sd	s4,0(sp)
    80004f6c:	03010413          	addi	s0,sp,48
    80004f70:	00050993          	mv	s3,a0
    80004f74:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80004f78:	00000a13          	li	s4,0
    80004f7c:	01c0006f          	j	80004f98 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80004f80:	ffffd097          	auipc	ra,0xffffd
    80004f84:	45c080e7          	jalr	1116(ra) # 800023dc <_ZN6Thread8dispatchEv>
    80004f88:	0500006f          	j	80004fd8 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80004f8c:	00a00513          	li	a0,10
    80004f90:	ffffc097          	auipc	ra,0xffffc
    80004f94:	600080e7          	jalr	1536(ra) # 80001590 <_Z4putcc>
    while (!threadEnd) {
    80004f98:	00007797          	auipc	a5,0x7
    80004f9c:	b107a783          	lw	a5,-1264(a5) # 8000baa8 <_ZL9threadEnd>
    80004fa0:	06079263          	bnez	a5,80005004 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80004fa4:	00893503          	ld	a0,8(s2)
    80004fa8:	00001097          	auipc	ra,0x1
    80004fac:	b94080e7          	jalr	-1132(ra) # 80005b3c <_ZN9BufferCPP3getEv>
        i++;
    80004fb0:	001a049b          	addiw	s1,s4,1
    80004fb4:	00048a1b          	sext.w	s4,s1
        putc(key);
    80004fb8:	0ff57513          	andi	a0,a0,255
    80004fbc:	ffffc097          	auipc	ra,0xffffc
    80004fc0:	5d4080e7          	jalr	1492(ra) # 80001590 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80004fc4:	00092703          	lw	a4,0(s2)
    80004fc8:	0027179b          	slliw	a5,a4,0x2
    80004fcc:	00e787bb          	addw	a5,a5,a4
    80004fd0:	02f4e7bb          	remw	a5,s1,a5
    80004fd4:	fa0786e3          	beqz	a5,80004f80 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80004fd8:	05000793          	li	a5,80
    80004fdc:	02f4e4bb          	remw	s1,s1,a5
    80004fe0:	fa049ce3          	bnez	s1,80004f98 <_ZN12ConsumerSync8consumerEPv+0x48>
    80004fe4:	fa9ff06f          	j	80004f8c <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80004fe8:	0209b783          	ld	a5,32(s3)
    80004fec:	0087b503          	ld	a0,8(a5)
    80004ff0:	00001097          	auipc	ra,0x1
    80004ff4:	b4c080e7          	jalr	-1204(ra) # 80005b3c <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80004ff8:	0ff57513          	andi	a0,a0,255
    80004ffc:	ffffd097          	auipc	ra,0xffffd
    80005000:	5c4080e7          	jalr	1476(ra) # 800025c0 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80005004:	0209b783          	ld	a5,32(s3)
    80005008:	0087b503          	ld	a0,8(a5)
    8000500c:	00001097          	auipc	ra,0x1
    80005010:	bbc080e7          	jalr	-1092(ra) # 80005bc8 <_ZN9BufferCPP6getCntEv>
    80005014:	fca04ae3          	bgtz	a0,80004fe8 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80005018:	01093503          	ld	a0,16(s2)
    8000501c:	ffffd097          	auipc	ra,0xffffd
    80005020:	504080e7          	jalr	1284(ra) # 80002520 <_ZN9Semaphore6signalEv>
}
    80005024:	02813083          	ld	ra,40(sp)
    80005028:	02013403          	ld	s0,32(sp)
    8000502c:	01813483          	ld	s1,24(sp)
    80005030:	01013903          	ld	s2,16(sp)
    80005034:	00813983          	ld	s3,8(sp)
    80005038:	00013a03          	ld	s4,0(sp)
    8000503c:	03010113          	addi	sp,sp,48
    80005040:	00008067          	ret

0000000080005044 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80005044:	f8010113          	addi	sp,sp,-128
    80005048:	06113c23          	sd	ra,120(sp)
    8000504c:	06813823          	sd	s0,112(sp)
    80005050:	06913423          	sd	s1,104(sp)
    80005054:	07213023          	sd	s2,96(sp)
    80005058:	05313c23          	sd	s3,88(sp)
    8000505c:	05413823          	sd	s4,80(sp)
    80005060:	05513423          	sd	s5,72(sp)
    80005064:	05613023          	sd	s6,64(sp)
    80005068:	03713c23          	sd	s7,56(sp)
    8000506c:	03813823          	sd	s8,48(sp)
    80005070:	03913423          	sd	s9,40(sp)
    80005074:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80005078:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    8000507c:	00004517          	auipc	a0,0x4
    80005080:	20450513          	addi	a0,a0,516 # 80009280 <CONSOLE_STATUS+0x270>
    80005084:	00000097          	auipc	ra,0x0
    80005088:	604080e7          	jalr	1540(ra) # 80005688 <_Z11printStringPKc>
    getString(input, 30);
    8000508c:	01e00593          	li	a1,30
    80005090:	f8040493          	addi	s1,s0,-128
    80005094:	00048513          	mv	a0,s1
    80005098:	00000097          	auipc	ra,0x0
    8000509c:	678080e7          	jalr	1656(ra) # 80005710 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800050a0:	00048513          	mv	a0,s1
    800050a4:	00000097          	auipc	ra,0x0
    800050a8:	744080e7          	jalr	1860(ra) # 800057e8 <_Z11stringToIntPKc>
    800050ac:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    800050b0:	00004517          	auipc	a0,0x4
    800050b4:	1f050513          	addi	a0,a0,496 # 800092a0 <CONSOLE_STATUS+0x290>
    800050b8:	00000097          	auipc	ra,0x0
    800050bc:	5d0080e7          	jalr	1488(ra) # 80005688 <_Z11printStringPKc>
    getString(input, 30);
    800050c0:	01e00593          	li	a1,30
    800050c4:	00048513          	mv	a0,s1
    800050c8:	00000097          	auipc	ra,0x0
    800050cc:	648080e7          	jalr	1608(ra) # 80005710 <_Z9getStringPci>
    n = stringToInt(input);
    800050d0:	00048513          	mv	a0,s1
    800050d4:	00000097          	auipc	ra,0x0
    800050d8:	714080e7          	jalr	1812(ra) # 800057e8 <_Z11stringToIntPKc>
    800050dc:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    800050e0:	00004517          	auipc	a0,0x4
    800050e4:	1e050513          	addi	a0,a0,480 # 800092c0 <CONSOLE_STATUS+0x2b0>
    800050e8:	00000097          	auipc	ra,0x0
    800050ec:	5a0080e7          	jalr	1440(ra) # 80005688 <_Z11printStringPKc>
    800050f0:	00000613          	li	a2,0
    800050f4:	00a00593          	li	a1,10
    800050f8:	00090513          	mv	a0,s2
    800050fc:	00000097          	auipc	ra,0x0
    80005100:	73c080e7          	jalr	1852(ra) # 80005838 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005104:	00004517          	auipc	a0,0x4
    80005108:	1d450513          	addi	a0,a0,468 # 800092d8 <CONSOLE_STATUS+0x2c8>
    8000510c:	00000097          	auipc	ra,0x0
    80005110:	57c080e7          	jalr	1404(ra) # 80005688 <_Z11printStringPKc>
    80005114:	00000613          	li	a2,0
    80005118:	00a00593          	li	a1,10
    8000511c:	00048513          	mv	a0,s1
    80005120:	00000097          	auipc	ra,0x0
    80005124:	718080e7          	jalr	1816(ra) # 80005838 <_Z8printIntiii>
    printString(".\n");
    80005128:	00004517          	auipc	a0,0x4
    8000512c:	1c850513          	addi	a0,a0,456 # 800092f0 <CONSOLE_STATUS+0x2e0>
    80005130:	00000097          	auipc	ra,0x0
    80005134:	558080e7          	jalr	1368(ra) # 80005688 <_Z11printStringPKc>
    if(threadNum > n) {
    80005138:	0324c463          	blt	s1,s2,80005160 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    8000513c:	03205c63          	blez	s2,80005174 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80005140:	03800513          	li	a0,56
    80005144:	ffffd097          	auipc	ra,0xffffd
    80005148:	084080e7          	jalr	132(ra) # 800021c8 <_Znwm>
    8000514c:	00050a93          	mv	s5,a0
    80005150:	00048593          	mv	a1,s1
    80005154:	00001097          	auipc	ra,0x1
    80005158:	804080e7          	jalr	-2044(ra) # 80005958 <_ZN9BufferCPPC1Ei>
    8000515c:	0300006f          	j	8000518c <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80005160:	00004517          	auipc	a0,0x4
    80005164:	19850513          	addi	a0,a0,408 # 800092f8 <CONSOLE_STATUS+0x2e8>
    80005168:	00000097          	auipc	ra,0x0
    8000516c:	520080e7          	jalr	1312(ra) # 80005688 <_Z11printStringPKc>
        return;
    80005170:	0140006f          	j	80005184 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80005174:	00004517          	auipc	a0,0x4
    80005178:	1c450513          	addi	a0,a0,452 # 80009338 <CONSOLE_STATUS+0x328>
    8000517c:	00000097          	auipc	ra,0x0
    80005180:	50c080e7          	jalr	1292(ra) # 80005688 <_Z11printStringPKc>
        return;
    80005184:	000b8113          	mv	sp,s7
    80005188:	2380006f          	j	800053c0 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    8000518c:	01000513          	li	a0,16
    80005190:	ffffd097          	auipc	ra,0xffffd
    80005194:	038080e7          	jalr	56(ra) # 800021c8 <_Znwm>
    80005198:	00050493          	mv	s1,a0
    8000519c:	00000593          	li	a1,0
    800051a0:	ffffd097          	auipc	ra,0xffffd
    800051a4:	31c080e7          	jalr	796(ra) # 800024bc <_ZN9SemaphoreC1Ej>
    800051a8:	00007797          	auipc	a5,0x7
    800051ac:	9097b423          	sd	s1,-1784(a5) # 8000bab0 <_ZL10waitForAll>
    Thread* threads[threadNum];
    800051b0:	00391793          	slli	a5,s2,0x3
    800051b4:	00f78793          	addi	a5,a5,15
    800051b8:	ff07f793          	andi	a5,a5,-16
    800051bc:	40f10133          	sub	sp,sp,a5
    800051c0:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    800051c4:	0019071b          	addiw	a4,s2,1
    800051c8:	00171793          	slli	a5,a4,0x1
    800051cc:	00e787b3          	add	a5,a5,a4
    800051d0:	00379793          	slli	a5,a5,0x3
    800051d4:	00f78793          	addi	a5,a5,15
    800051d8:	ff07f793          	andi	a5,a5,-16
    800051dc:	40f10133          	sub	sp,sp,a5
    800051e0:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    800051e4:	00191c13          	slli	s8,s2,0x1
    800051e8:	012c07b3          	add	a5,s8,s2
    800051ec:	00379793          	slli	a5,a5,0x3
    800051f0:	00fa07b3          	add	a5,s4,a5
    800051f4:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    800051f8:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    800051fc:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80005200:	02800513          	li	a0,40
    80005204:	ffffd097          	auipc	ra,0xffffd
    80005208:	fc4080e7          	jalr	-60(ra) # 800021c8 <_Znwm>
    8000520c:	00050b13          	mv	s6,a0
    80005210:	012c0c33          	add	s8,s8,s2
    80005214:	003c1c13          	slli	s8,s8,0x3
    80005218:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    8000521c:	ffffd097          	auipc	ra,0xffffd
    80005220:	224080e7          	jalr	548(ra) # 80002440 <_ZN6ThreadC1Ev>
    80005224:	00006797          	auipc	a5,0x6
    80005228:	75478793          	addi	a5,a5,1876 # 8000b978 <_ZTV12ConsumerSync+0x10>
    8000522c:	00fb3023          	sd	a5,0(s6)
    80005230:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80005234:	000b0513          	mv	a0,s6
    80005238:	ffffd097          	auipc	ra,0xffffd
    8000523c:	140080e7          	jalr	320(ra) # 80002378 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005240:	00000493          	li	s1,0
    80005244:	0380006f          	j	8000527c <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005248:	00006797          	auipc	a5,0x6
    8000524c:	70878793          	addi	a5,a5,1800 # 8000b950 <_ZTV12ProducerSync+0x10>
    80005250:	00fcb023          	sd	a5,0(s9)
    80005254:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80005258:	00349793          	slli	a5,s1,0x3
    8000525c:	00f987b3          	add	a5,s3,a5
    80005260:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80005264:	00349793          	slli	a5,s1,0x3
    80005268:	00f987b3          	add	a5,s3,a5
    8000526c:	0007b503          	ld	a0,0(a5)
    80005270:	ffffd097          	auipc	ra,0xffffd
    80005274:	108080e7          	jalr	264(ra) # 80002378 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005278:	0014849b          	addiw	s1,s1,1
    8000527c:	0b24d063          	bge	s1,s2,8000531c <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    80005280:	00149793          	slli	a5,s1,0x1
    80005284:	009787b3          	add	a5,a5,s1
    80005288:	00379793          	slli	a5,a5,0x3
    8000528c:	00fa07b3          	add	a5,s4,a5
    80005290:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80005294:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80005298:	00007717          	auipc	a4,0x7
    8000529c:	81873703          	ld	a4,-2024(a4) # 8000bab0 <_ZL10waitForAll>
    800052a0:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    800052a4:	02905863          	blez	s1,800052d4 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    800052a8:	02800513          	li	a0,40
    800052ac:	ffffd097          	auipc	ra,0xffffd
    800052b0:	f1c080e7          	jalr	-228(ra) # 800021c8 <_Znwm>
    800052b4:	00050c93          	mv	s9,a0
    800052b8:	00149c13          	slli	s8,s1,0x1
    800052bc:	009c0c33          	add	s8,s8,s1
    800052c0:	003c1c13          	slli	s8,s8,0x3
    800052c4:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    800052c8:	ffffd097          	auipc	ra,0xffffd
    800052cc:	178080e7          	jalr	376(ra) # 80002440 <_ZN6ThreadC1Ev>
    800052d0:	f79ff06f          	j	80005248 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    800052d4:	02800513          	li	a0,40
    800052d8:	ffffd097          	auipc	ra,0xffffd
    800052dc:	ef0080e7          	jalr	-272(ra) # 800021c8 <_Znwm>
    800052e0:	00050c93          	mv	s9,a0
    800052e4:	00149c13          	slli	s8,s1,0x1
    800052e8:	009c0c33          	add	s8,s8,s1
    800052ec:	003c1c13          	slli	s8,s8,0x3
    800052f0:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    800052f4:	ffffd097          	auipc	ra,0xffffd
    800052f8:	14c080e7          	jalr	332(ra) # 80002440 <_ZN6ThreadC1Ev>
    800052fc:	00006797          	auipc	a5,0x6
    80005300:	62c78793          	addi	a5,a5,1580 # 8000b928 <_ZTV16ProducerKeyboard+0x10>
    80005304:	00fcb023          	sd	a5,0(s9)
    80005308:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    8000530c:	00349793          	slli	a5,s1,0x3
    80005310:	00f987b3          	add	a5,s3,a5
    80005314:	0197b023          	sd	s9,0(a5)
    80005318:	f4dff06f          	j	80005264 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    8000531c:	ffffd097          	auipc	ra,0xffffd
    80005320:	0c0080e7          	jalr	192(ra) # 800023dc <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80005324:	00000493          	li	s1,0
    80005328:	00994e63          	blt	s2,s1,80005344 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    8000532c:	00006517          	auipc	a0,0x6
    80005330:	78453503          	ld	a0,1924(a0) # 8000bab0 <_ZL10waitForAll>
    80005334:	ffffd097          	auipc	ra,0xffffd
    80005338:	1c0080e7          	jalr	448(ra) # 800024f4 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    8000533c:	0014849b          	addiw	s1,s1,1
    80005340:	fe9ff06f          	j	80005328 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80005344:	00000493          	li	s1,0
    80005348:	0080006f          	j	80005350 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    8000534c:	0014849b          	addiw	s1,s1,1
    80005350:	0324d263          	bge	s1,s2,80005374 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80005354:	00349793          	slli	a5,s1,0x3
    80005358:	00f987b3          	add	a5,s3,a5
    8000535c:	0007b503          	ld	a0,0(a5)
    80005360:	fe0506e3          	beqz	a0,8000534c <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80005364:	00053783          	ld	a5,0(a0)
    80005368:	0087b783          	ld	a5,8(a5)
    8000536c:	000780e7          	jalr	a5
    80005370:	fddff06f          	j	8000534c <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80005374:	000b0a63          	beqz	s6,80005388 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80005378:	000b3783          	ld	a5,0(s6)
    8000537c:	0087b783          	ld	a5,8(a5)
    80005380:	000b0513          	mv	a0,s6
    80005384:	000780e7          	jalr	a5
    delete waitForAll;
    80005388:	00006517          	auipc	a0,0x6
    8000538c:	72853503          	ld	a0,1832(a0) # 8000bab0 <_ZL10waitForAll>
    80005390:	00050863          	beqz	a0,800053a0 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80005394:	00053783          	ld	a5,0(a0)
    80005398:	0087b783          	ld	a5,8(a5)
    8000539c:	000780e7          	jalr	a5
    delete buffer;
    800053a0:	000a8e63          	beqz	s5,800053bc <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    800053a4:	000a8513          	mv	a0,s5
    800053a8:	00001097          	auipc	ra,0x1
    800053ac:	8a8080e7          	jalr	-1880(ra) # 80005c50 <_ZN9BufferCPPD1Ev>
    800053b0:	000a8513          	mv	a0,s5
    800053b4:	ffffd097          	auipc	ra,0xffffd
    800053b8:	e64080e7          	jalr	-412(ra) # 80002218 <_ZdlPv>
    800053bc:	000b8113          	mv	sp,s7

}
    800053c0:	f8040113          	addi	sp,s0,-128
    800053c4:	07813083          	ld	ra,120(sp)
    800053c8:	07013403          	ld	s0,112(sp)
    800053cc:	06813483          	ld	s1,104(sp)
    800053d0:	06013903          	ld	s2,96(sp)
    800053d4:	05813983          	ld	s3,88(sp)
    800053d8:	05013a03          	ld	s4,80(sp)
    800053dc:	04813a83          	ld	s5,72(sp)
    800053e0:	04013b03          	ld	s6,64(sp)
    800053e4:	03813b83          	ld	s7,56(sp)
    800053e8:	03013c03          	ld	s8,48(sp)
    800053ec:	02813c83          	ld	s9,40(sp)
    800053f0:	08010113          	addi	sp,sp,128
    800053f4:	00008067          	ret
    800053f8:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    800053fc:	000a8513          	mv	a0,s5
    80005400:	ffffd097          	auipc	ra,0xffffd
    80005404:	e18080e7          	jalr	-488(ra) # 80002218 <_ZdlPv>
    80005408:	00048513          	mv	a0,s1
    8000540c:	00007097          	auipc	ra,0x7
    80005410:	78c080e7          	jalr	1932(ra) # 8000cb98 <_Unwind_Resume>
    80005414:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80005418:	00048513          	mv	a0,s1
    8000541c:	ffffd097          	auipc	ra,0xffffd
    80005420:	dfc080e7          	jalr	-516(ra) # 80002218 <_ZdlPv>
    80005424:	00090513          	mv	a0,s2
    80005428:	00007097          	auipc	ra,0x7
    8000542c:	770080e7          	jalr	1904(ra) # 8000cb98 <_Unwind_Resume>
    80005430:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80005434:	000b0513          	mv	a0,s6
    80005438:	ffffd097          	auipc	ra,0xffffd
    8000543c:	de0080e7          	jalr	-544(ra) # 80002218 <_ZdlPv>
    80005440:	00048513          	mv	a0,s1
    80005444:	00007097          	auipc	ra,0x7
    80005448:	754080e7          	jalr	1876(ra) # 8000cb98 <_Unwind_Resume>
    8000544c:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80005450:	000c8513          	mv	a0,s9
    80005454:	ffffd097          	auipc	ra,0xffffd
    80005458:	dc4080e7          	jalr	-572(ra) # 80002218 <_ZdlPv>
    8000545c:	00048513          	mv	a0,s1
    80005460:	00007097          	auipc	ra,0x7
    80005464:	738080e7          	jalr	1848(ra) # 8000cb98 <_Unwind_Resume>
    80005468:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    8000546c:	000c8513          	mv	a0,s9
    80005470:	ffffd097          	auipc	ra,0xffffd
    80005474:	da8080e7          	jalr	-600(ra) # 80002218 <_ZdlPv>
    80005478:	00048513          	mv	a0,s1
    8000547c:	00007097          	auipc	ra,0x7
    80005480:	71c080e7          	jalr	1820(ra) # 8000cb98 <_Unwind_Resume>

0000000080005484 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80005484:	ff010113          	addi	sp,sp,-16
    80005488:	00113423          	sd	ra,8(sp)
    8000548c:	00813023          	sd	s0,0(sp)
    80005490:	01010413          	addi	s0,sp,16
    80005494:	00006797          	auipc	a5,0x6
    80005498:	4e478793          	addi	a5,a5,1252 # 8000b978 <_ZTV12ConsumerSync+0x10>
    8000549c:	00f53023          	sd	a5,0(a0)
    800054a0:	ffffd097          	auipc	ra,0xffffd
    800054a4:	c7c080e7          	jalr	-900(ra) # 8000211c <_ZN6ThreadD1Ev>
    800054a8:	00813083          	ld	ra,8(sp)
    800054ac:	00013403          	ld	s0,0(sp)
    800054b0:	01010113          	addi	sp,sp,16
    800054b4:	00008067          	ret

00000000800054b8 <_ZN12ConsumerSyncD0Ev>:
    800054b8:	fe010113          	addi	sp,sp,-32
    800054bc:	00113c23          	sd	ra,24(sp)
    800054c0:	00813823          	sd	s0,16(sp)
    800054c4:	00913423          	sd	s1,8(sp)
    800054c8:	02010413          	addi	s0,sp,32
    800054cc:	00050493          	mv	s1,a0
    800054d0:	00006797          	auipc	a5,0x6
    800054d4:	4a878793          	addi	a5,a5,1192 # 8000b978 <_ZTV12ConsumerSync+0x10>
    800054d8:	00f53023          	sd	a5,0(a0)
    800054dc:	ffffd097          	auipc	ra,0xffffd
    800054e0:	c40080e7          	jalr	-960(ra) # 8000211c <_ZN6ThreadD1Ev>
    800054e4:	00048513          	mv	a0,s1
    800054e8:	ffffd097          	auipc	ra,0xffffd
    800054ec:	d30080e7          	jalr	-720(ra) # 80002218 <_ZdlPv>
    800054f0:	01813083          	ld	ra,24(sp)
    800054f4:	01013403          	ld	s0,16(sp)
    800054f8:	00813483          	ld	s1,8(sp)
    800054fc:	02010113          	addi	sp,sp,32
    80005500:	00008067          	ret

0000000080005504 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80005504:	ff010113          	addi	sp,sp,-16
    80005508:	00113423          	sd	ra,8(sp)
    8000550c:	00813023          	sd	s0,0(sp)
    80005510:	01010413          	addi	s0,sp,16
    80005514:	00006797          	auipc	a5,0x6
    80005518:	43c78793          	addi	a5,a5,1084 # 8000b950 <_ZTV12ProducerSync+0x10>
    8000551c:	00f53023          	sd	a5,0(a0)
    80005520:	ffffd097          	auipc	ra,0xffffd
    80005524:	bfc080e7          	jalr	-1028(ra) # 8000211c <_ZN6ThreadD1Ev>
    80005528:	00813083          	ld	ra,8(sp)
    8000552c:	00013403          	ld	s0,0(sp)
    80005530:	01010113          	addi	sp,sp,16
    80005534:	00008067          	ret

0000000080005538 <_ZN12ProducerSyncD0Ev>:
    80005538:	fe010113          	addi	sp,sp,-32
    8000553c:	00113c23          	sd	ra,24(sp)
    80005540:	00813823          	sd	s0,16(sp)
    80005544:	00913423          	sd	s1,8(sp)
    80005548:	02010413          	addi	s0,sp,32
    8000554c:	00050493          	mv	s1,a0
    80005550:	00006797          	auipc	a5,0x6
    80005554:	40078793          	addi	a5,a5,1024 # 8000b950 <_ZTV12ProducerSync+0x10>
    80005558:	00f53023          	sd	a5,0(a0)
    8000555c:	ffffd097          	auipc	ra,0xffffd
    80005560:	bc0080e7          	jalr	-1088(ra) # 8000211c <_ZN6ThreadD1Ev>
    80005564:	00048513          	mv	a0,s1
    80005568:	ffffd097          	auipc	ra,0xffffd
    8000556c:	cb0080e7          	jalr	-848(ra) # 80002218 <_ZdlPv>
    80005570:	01813083          	ld	ra,24(sp)
    80005574:	01013403          	ld	s0,16(sp)
    80005578:	00813483          	ld	s1,8(sp)
    8000557c:	02010113          	addi	sp,sp,32
    80005580:	00008067          	ret

0000000080005584 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80005584:	ff010113          	addi	sp,sp,-16
    80005588:	00113423          	sd	ra,8(sp)
    8000558c:	00813023          	sd	s0,0(sp)
    80005590:	01010413          	addi	s0,sp,16
    80005594:	00006797          	auipc	a5,0x6
    80005598:	39478793          	addi	a5,a5,916 # 8000b928 <_ZTV16ProducerKeyboard+0x10>
    8000559c:	00f53023          	sd	a5,0(a0)
    800055a0:	ffffd097          	auipc	ra,0xffffd
    800055a4:	b7c080e7          	jalr	-1156(ra) # 8000211c <_ZN6ThreadD1Ev>
    800055a8:	00813083          	ld	ra,8(sp)
    800055ac:	00013403          	ld	s0,0(sp)
    800055b0:	01010113          	addi	sp,sp,16
    800055b4:	00008067          	ret

00000000800055b8 <_ZN16ProducerKeyboardD0Ev>:
    800055b8:	fe010113          	addi	sp,sp,-32
    800055bc:	00113c23          	sd	ra,24(sp)
    800055c0:	00813823          	sd	s0,16(sp)
    800055c4:	00913423          	sd	s1,8(sp)
    800055c8:	02010413          	addi	s0,sp,32
    800055cc:	00050493          	mv	s1,a0
    800055d0:	00006797          	auipc	a5,0x6
    800055d4:	35878793          	addi	a5,a5,856 # 8000b928 <_ZTV16ProducerKeyboard+0x10>
    800055d8:	00f53023          	sd	a5,0(a0)
    800055dc:	ffffd097          	auipc	ra,0xffffd
    800055e0:	b40080e7          	jalr	-1216(ra) # 8000211c <_ZN6ThreadD1Ev>
    800055e4:	00048513          	mv	a0,s1
    800055e8:	ffffd097          	auipc	ra,0xffffd
    800055ec:	c30080e7          	jalr	-976(ra) # 80002218 <_ZdlPv>
    800055f0:	01813083          	ld	ra,24(sp)
    800055f4:	01013403          	ld	s0,16(sp)
    800055f8:	00813483          	ld	s1,8(sp)
    800055fc:	02010113          	addi	sp,sp,32
    80005600:	00008067          	ret

0000000080005604 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80005604:	ff010113          	addi	sp,sp,-16
    80005608:	00113423          	sd	ra,8(sp)
    8000560c:	00813023          	sd	s0,0(sp)
    80005610:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80005614:	02053583          	ld	a1,32(a0)
    80005618:	fffff097          	auipc	ra,0xfffff
    8000561c:	7e4080e7          	jalr	2020(ra) # 80004dfc <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80005620:	00813083          	ld	ra,8(sp)
    80005624:	00013403          	ld	s0,0(sp)
    80005628:	01010113          	addi	sp,sp,16
    8000562c:	00008067          	ret

0000000080005630 <_ZN12ProducerSync3runEv>:
    void run() override {
    80005630:	ff010113          	addi	sp,sp,-16
    80005634:	00113423          	sd	ra,8(sp)
    80005638:	00813023          	sd	s0,0(sp)
    8000563c:	01010413          	addi	s0,sp,16
        producer(td);
    80005640:	02053583          	ld	a1,32(a0)
    80005644:	00000097          	auipc	ra,0x0
    80005648:	878080e7          	jalr	-1928(ra) # 80004ebc <_ZN12ProducerSync8producerEPv>
    }
    8000564c:	00813083          	ld	ra,8(sp)
    80005650:	00013403          	ld	s0,0(sp)
    80005654:	01010113          	addi	sp,sp,16
    80005658:	00008067          	ret

000000008000565c <_ZN12ConsumerSync3runEv>:
    void run() override {
    8000565c:	ff010113          	addi	sp,sp,-16
    80005660:	00113423          	sd	ra,8(sp)
    80005664:	00813023          	sd	s0,0(sp)
    80005668:	01010413          	addi	s0,sp,16
        consumer(td);
    8000566c:	02053583          	ld	a1,32(a0)
    80005670:	00000097          	auipc	ra,0x0
    80005674:	8e0080e7          	jalr	-1824(ra) # 80004f50 <_ZN12ConsumerSync8consumerEPv>
    }
    80005678:	00813083          	ld	ra,8(sp)
    8000567c:	00013403          	ld	s0,0(sp)
    80005680:	01010113          	addi	sp,sp,16
    80005684:	00008067          	ret

0000000080005688 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80005688:	fe010113          	addi	sp,sp,-32
    8000568c:	00113c23          	sd	ra,24(sp)
    80005690:	00813823          	sd	s0,16(sp)
    80005694:	00913423          	sd	s1,8(sp)
    80005698:	02010413          	addi	s0,sp,32
    8000569c:	00050493          	mv	s1,a0
    LOCK();
    800056a0:	00100613          	li	a2,1
    800056a4:	00000593          	li	a1,0
    800056a8:	00006517          	auipc	a0,0x6
    800056ac:	41050513          	addi	a0,a0,1040 # 8000bab8 <lockPrint>
    800056b0:	ffffc097          	auipc	ra,0xffffc
    800056b4:	b74080e7          	jalr	-1164(ra) # 80001224 <copy_and_swap>
    800056b8:	00050863          	beqz	a0,800056c8 <_Z11printStringPKc+0x40>
    800056bc:	ffffc097          	auipc	ra,0xffffc
    800056c0:	d6c080e7          	jalr	-660(ra) # 80001428 <_Z15thread_dispatchv>
    800056c4:	fddff06f          	j	800056a0 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    800056c8:	0004c503          	lbu	a0,0(s1)
    800056cc:	00050a63          	beqz	a0,800056e0 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    800056d0:	ffffc097          	auipc	ra,0xffffc
    800056d4:	ec0080e7          	jalr	-320(ra) # 80001590 <_Z4putcc>
        string++;
    800056d8:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    800056dc:	fedff06f          	j	800056c8 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    800056e0:	00000613          	li	a2,0
    800056e4:	00100593          	li	a1,1
    800056e8:	00006517          	auipc	a0,0x6
    800056ec:	3d050513          	addi	a0,a0,976 # 8000bab8 <lockPrint>
    800056f0:	ffffc097          	auipc	ra,0xffffc
    800056f4:	b34080e7          	jalr	-1228(ra) # 80001224 <copy_and_swap>
    800056f8:	fe0514e3          	bnez	a0,800056e0 <_Z11printStringPKc+0x58>
}
    800056fc:	01813083          	ld	ra,24(sp)
    80005700:	01013403          	ld	s0,16(sp)
    80005704:	00813483          	ld	s1,8(sp)
    80005708:	02010113          	addi	sp,sp,32
    8000570c:	00008067          	ret

0000000080005710 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80005710:	fd010113          	addi	sp,sp,-48
    80005714:	02113423          	sd	ra,40(sp)
    80005718:	02813023          	sd	s0,32(sp)
    8000571c:	00913c23          	sd	s1,24(sp)
    80005720:	01213823          	sd	s2,16(sp)
    80005724:	01313423          	sd	s3,8(sp)
    80005728:	01413023          	sd	s4,0(sp)
    8000572c:	03010413          	addi	s0,sp,48
    80005730:	00050993          	mv	s3,a0
    80005734:	00058a13          	mv	s4,a1
    LOCK();
    80005738:	00100613          	li	a2,1
    8000573c:	00000593          	li	a1,0
    80005740:	00006517          	auipc	a0,0x6
    80005744:	37850513          	addi	a0,a0,888 # 8000bab8 <lockPrint>
    80005748:	ffffc097          	auipc	ra,0xffffc
    8000574c:	adc080e7          	jalr	-1316(ra) # 80001224 <copy_and_swap>
    80005750:	00050863          	beqz	a0,80005760 <_Z9getStringPci+0x50>
    80005754:	ffffc097          	auipc	ra,0xffffc
    80005758:	cd4080e7          	jalr	-812(ra) # 80001428 <_Z15thread_dispatchv>
    8000575c:	fddff06f          	j	80005738 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80005760:	00000913          	li	s2,0
    80005764:	00090493          	mv	s1,s2
    80005768:	0019091b          	addiw	s2,s2,1
    8000576c:	03495a63          	bge	s2,s4,800057a0 <_Z9getStringPci+0x90>
        cc = getc();
    80005770:	ffffc097          	auipc	ra,0xffffc
    80005774:	df8080e7          	jalr	-520(ra) # 80001568 <_Z4getcv>
        if(cc < 1)
    80005778:	02050463          	beqz	a0,800057a0 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    8000577c:	009984b3          	add	s1,s3,s1
    80005780:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80005784:	00a00793          	li	a5,10
    80005788:	00f50a63          	beq	a0,a5,8000579c <_Z9getStringPci+0x8c>
    8000578c:	00d00793          	li	a5,13
    80005790:	fcf51ae3          	bne	a0,a5,80005764 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80005794:	00090493          	mv	s1,s2
    80005798:	0080006f          	j	800057a0 <_Z9getStringPci+0x90>
    8000579c:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    800057a0:	009984b3          	add	s1,s3,s1
    800057a4:	00048023          	sb	zero,0(s1)

    UNLOCK();
    800057a8:	00000613          	li	a2,0
    800057ac:	00100593          	li	a1,1
    800057b0:	00006517          	auipc	a0,0x6
    800057b4:	30850513          	addi	a0,a0,776 # 8000bab8 <lockPrint>
    800057b8:	ffffc097          	auipc	ra,0xffffc
    800057bc:	a6c080e7          	jalr	-1428(ra) # 80001224 <copy_and_swap>
    800057c0:	fe0514e3          	bnez	a0,800057a8 <_Z9getStringPci+0x98>
    return buf;
}
    800057c4:	00098513          	mv	a0,s3
    800057c8:	02813083          	ld	ra,40(sp)
    800057cc:	02013403          	ld	s0,32(sp)
    800057d0:	01813483          	ld	s1,24(sp)
    800057d4:	01013903          	ld	s2,16(sp)
    800057d8:	00813983          	ld	s3,8(sp)
    800057dc:	00013a03          	ld	s4,0(sp)
    800057e0:	03010113          	addi	sp,sp,48
    800057e4:	00008067          	ret

00000000800057e8 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    800057e8:	ff010113          	addi	sp,sp,-16
    800057ec:	00813423          	sd	s0,8(sp)
    800057f0:	01010413          	addi	s0,sp,16
    800057f4:	00050693          	mv	a3,a0
    int n;

    n = 0;
    800057f8:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    800057fc:	0006c603          	lbu	a2,0(a3)
    80005800:	fd06071b          	addiw	a4,a2,-48
    80005804:	0ff77713          	andi	a4,a4,255
    80005808:	00900793          	li	a5,9
    8000580c:	02e7e063          	bltu	a5,a4,8000582c <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80005810:	0025179b          	slliw	a5,a0,0x2
    80005814:	00a787bb          	addw	a5,a5,a0
    80005818:	0017979b          	slliw	a5,a5,0x1
    8000581c:	00168693          	addi	a3,a3,1
    80005820:	00c787bb          	addw	a5,a5,a2
    80005824:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80005828:	fd5ff06f          	j	800057fc <_Z11stringToIntPKc+0x14>
    return n;
}
    8000582c:	00813403          	ld	s0,8(sp)
    80005830:	01010113          	addi	sp,sp,16
    80005834:	00008067          	ret

0000000080005838 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80005838:	fc010113          	addi	sp,sp,-64
    8000583c:	02113c23          	sd	ra,56(sp)
    80005840:	02813823          	sd	s0,48(sp)
    80005844:	02913423          	sd	s1,40(sp)
    80005848:	03213023          	sd	s2,32(sp)
    8000584c:	01313c23          	sd	s3,24(sp)
    80005850:	04010413          	addi	s0,sp,64
    80005854:	00050493          	mv	s1,a0
    80005858:	00058913          	mv	s2,a1
    8000585c:	00060993          	mv	s3,a2
    LOCK();
    80005860:	00100613          	li	a2,1
    80005864:	00000593          	li	a1,0
    80005868:	00006517          	auipc	a0,0x6
    8000586c:	25050513          	addi	a0,a0,592 # 8000bab8 <lockPrint>
    80005870:	ffffc097          	auipc	ra,0xffffc
    80005874:	9b4080e7          	jalr	-1612(ra) # 80001224 <copy_and_swap>
    80005878:	00050863          	beqz	a0,80005888 <_Z8printIntiii+0x50>
    8000587c:	ffffc097          	auipc	ra,0xffffc
    80005880:	bac080e7          	jalr	-1108(ra) # 80001428 <_Z15thread_dispatchv>
    80005884:	fddff06f          	j	80005860 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80005888:	00098463          	beqz	s3,80005890 <_Z8printIntiii+0x58>
    8000588c:	0804c463          	bltz	s1,80005914 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80005890:	0004851b          	sext.w	a0,s1
    neg = 0;
    80005894:	00000593          	li	a1,0
    }

    i = 0;
    80005898:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    8000589c:	0009079b          	sext.w	a5,s2
    800058a0:	0325773b          	remuw	a4,a0,s2
    800058a4:	00048613          	mv	a2,s1
    800058a8:	0014849b          	addiw	s1,s1,1
    800058ac:	02071693          	slli	a3,a4,0x20
    800058b0:	0206d693          	srli	a3,a3,0x20
    800058b4:	00006717          	auipc	a4,0x6
    800058b8:	0dc70713          	addi	a4,a4,220 # 8000b990 <digits>
    800058bc:	00d70733          	add	a4,a4,a3
    800058c0:	00074683          	lbu	a3,0(a4)
    800058c4:	fd040713          	addi	a4,s0,-48
    800058c8:	00c70733          	add	a4,a4,a2
    800058cc:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    800058d0:	0005071b          	sext.w	a4,a0
    800058d4:	0325553b          	divuw	a0,a0,s2
    800058d8:	fcf772e3          	bgeu	a4,a5,8000589c <_Z8printIntiii+0x64>
    if(neg)
    800058dc:	00058c63          	beqz	a1,800058f4 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    800058e0:	fd040793          	addi	a5,s0,-48
    800058e4:	009784b3          	add	s1,a5,s1
    800058e8:	02d00793          	li	a5,45
    800058ec:	fef48823          	sb	a5,-16(s1)
    800058f0:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    800058f4:	fff4849b          	addiw	s1,s1,-1
    800058f8:	0204c463          	bltz	s1,80005920 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    800058fc:	fd040793          	addi	a5,s0,-48
    80005900:	009787b3          	add	a5,a5,s1
    80005904:	ff07c503          	lbu	a0,-16(a5)
    80005908:	ffffc097          	auipc	ra,0xffffc
    8000590c:	c88080e7          	jalr	-888(ra) # 80001590 <_Z4putcc>
    80005910:	fe5ff06f          	j	800058f4 <_Z8printIntiii+0xbc>
        x = -xx;
    80005914:	4090053b          	negw	a0,s1
        neg = 1;
    80005918:	00100593          	li	a1,1
        x = -xx;
    8000591c:	f7dff06f          	j	80005898 <_Z8printIntiii+0x60>

    UNLOCK();
    80005920:	00000613          	li	a2,0
    80005924:	00100593          	li	a1,1
    80005928:	00006517          	auipc	a0,0x6
    8000592c:	19050513          	addi	a0,a0,400 # 8000bab8 <lockPrint>
    80005930:	ffffc097          	auipc	ra,0xffffc
    80005934:	8f4080e7          	jalr	-1804(ra) # 80001224 <copy_and_swap>
    80005938:	fe0514e3          	bnez	a0,80005920 <_Z8printIntiii+0xe8>
    8000593c:	03813083          	ld	ra,56(sp)
    80005940:	03013403          	ld	s0,48(sp)
    80005944:	02813483          	ld	s1,40(sp)
    80005948:	02013903          	ld	s2,32(sp)
    8000594c:	01813983          	ld	s3,24(sp)
    80005950:	04010113          	addi	sp,sp,64
    80005954:	00008067          	ret

0000000080005958 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80005958:	fd010113          	addi	sp,sp,-48
    8000595c:	02113423          	sd	ra,40(sp)
    80005960:	02813023          	sd	s0,32(sp)
    80005964:	00913c23          	sd	s1,24(sp)
    80005968:	01213823          	sd	s2,16(sp)
    8000596c:	01313423          	sd	s3,8(sp)
    80005970:	03010413          	addi	s0,sp,48
    80005974:	00050493          	mv	s1,a0
    80005978:	00058913          	mv	s2,a1
    8000597c:	0015879b          	addiw	a5,a1,1
    80005980:	0007851b          	sext.w	a0,a5
    80005984:	00f4a023          	sw	a5,0(s1)
    80005988:	0004a823          	sw	zero,16(s1)
    8000598c:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80005990:	00251513          	slli	a0,a0,0x2
    80005994:	ffffc097          	auipc	ra,0xffffc
    80005998:	97c080e7          	jalr	-1668(ra) # 80001310 <_Z9mem_allocm>
    8000599c:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    800059a0:	01000513          	li	a0,16
    800059a4:	ffffd097          	auipc	ra,0xffffd
    800059a8:	824080e7          	jalr	-2012(ra) # 800021c8 <_Znwm>
    800059ac:	00050993          	mv	s3,a0
    800059b0:	00000593          	li	a1,0
    800059b4:	ffffd097          	auipc	ra,0xffffd
    800059b8:	b08080e7          	jalr	-1272(ra) # 800024bc <_ZN9SemaphoreC1Ej>
    800059bc:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    800059c0:	01000513          	li	a0,16
    800059c4:	ffffd097          	auipc	ra,0xffffd
    800059c8:	804080e7          	jalr	-2044(ra) # 800021c8 <_Znwm>
    800059cc:	00050993          	mv	s3,a0
    800059d0:	00090593          	mv	a1,s2
    800059d4:	ffffd097          	auipc	ra,0xffffd
    800059d8:	ae8080e7          	jalr	-1304(ra) # 800024bc <_ZN9SemaphoreC1Ej>
    800059dc:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    800059e0:	01000513          	li	a0,16
    800059e4:	ffffc097          	auipc	ra,0xffffc
    800059e8:	7e4080e7          	jalr	2020(ra) # 800021c8 <_Znwm>
    800059ec:	00050913          	mv	s2,a0
    800059f0:	00100593          	li	a1,1
    800059f4:	ffffd097          	auipc	ra,0xffffd
    800059f8:	ac8080e7          	jalr	-1336(ra) # 800024bc <_ZN9SemaphoreC1Ej>
    800059fc:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80005a00:	01000513          	li	a0,16
    80005a04:	ffffc097          	auipc	ra,0xffffc
    80005a08:	7c4080e7          	jalr	1988(ra) # 800021c8 <_Znwm>
    80005a0c:	00050913          	mv	s2,a0
    80005a10:	00100593          	li	a1,1
    80005a14:	ffffd097          	auipc	ra,0xffffd
    80005a18:	aa8080e7          	jalr	-1368(ra) # 800024bc <_ZN9SemaphoreC1Ej>
    80005a1c:	0324b823          	sd	s2,48(s1)
}
    80005a20:	02813083          	ld	ra,40(sp)
    80005a24:	02013403          	ld	s0,32(sp)
    80005a28:	01813483          	ld	s1,24(sp)
    80005a2c:	01013903          	ld	s2,16(sp)
    80005a30:	00813983          	ld	s3,8(sp)
    80005a34:	03010113          	addi	sp,sp,48
    80005a38:	00008067          	ret
    80005a3c:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80005a40:	00098513          	mv	a0,s3
    80005a44:	ffffc097          	auipc	ra,0xffffc
    80005a48:	7d4080e7          	jalr	2004(ra) # 80002218 <_ZdlPv>
    80005a4c:	00048513          	mv	a0,s1
    80005a50:	00007097          	auipc	ra,0x7
    80005a54:	148080e7          	jalr	328(ra) # 8000cb98 <_Unwind_Resume>
    80005a58:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80005a5c:	00098513          	mv	a0,s3
    80005a60:	ffffc097          	auipc	ra,0xffffc
    80005a64:	7b8080e7          	jalr	1976(ra) # 80002218 <_ZdlPv>
    80005a68:	00048513          	mv	a0,s1
    80005a6c:	00007097          	auipc	ra,0x7
    80005a70:	12c080e7          	jalr	300(ra) # 8000cb98 <_Unwind_Resume>
    80005a74:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80005a78:	00090513          	mv	a0,s2
    80005a7c:	ffffc097          	auipc	ra,0xffffc
    80005a80:	79c080e7          	jalr	1948(ra) # 80002218 <_ZdlPv>
    80005a84:	00048513          	mv	a0,s1
    80005a88:	00007097          	auipc	ra,0x7
    80005a8c:	110080e7          	jalr	272(ra) # 8000cb98 <_Unwind_Resume>
    80005a90:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80005a94:	00090513          	mv	a0,s2
    80005a98:	ffffc097          	auipc	ra,0xffffc
    80005a9c:	780080e7          	jalr	1920(ra) # 80002218 <_ZdlPv>
    80005aa0:	00048513          	mv	a0,s1
    80005aa4:	00007097          	auipc	ra,0x7
    80005aa8:	0f4080e7          	jalr	244(ra) # 8000cb98 <_Unwind_Resume>

0000000080005aac <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80005aac:	fe010113          	addi	sp,sp,-32
    80005ab0:	00113c23          	sd	ra,24(sp)
    80005ab4:	00813823          	sd	s0,16(sp)
    80005ab8:	00913423          	sd	s1,8(sp)
    80005abc:	01213023          	sd	s2,0(sp)
    80005ac0:	02010413          	addi	s0,sp,32
    80005ac4:	00050493          	mv	s1,a0
    80005ac8:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80005acc:	01853503          	ld	a0,24(a0)
    80005ad0:	ffffd097          	auipc	ra,0xffffd
    80005ad4:	a24080e7          	jalr	-1500(ra) # 800024f4 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80005ad8:	0304b503          	ld	a0,48(s1)
    80005adc:	ffffd097          	auipc	ra,0xffffd
    80005ae0:	a18080e7          	jalr	-1512(ra) # 800024f4 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80005ae4:	0084b783          	ld	a5,8(s1)
    80005ae8:	0144a703          	lw	a4,20(s1)
    80005aec:	00271713          	slli	a4,a4,0x2
    80005af0:	00e787b3          	add	a5,a5,a4
    80005af4:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80005af8:	0144a783          	lw	a5,20(s1)
    80005afc:	0017879b          	addiw	a5,a5,1
    80005b00:	0004a703          	lw	a4,0(s1)
    80005b04:	02e7e7bb          	remw	a5,a5,a4
    80005b08:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80005b0c:	0304b503          	ld	a0,48(s1)
    80005b10:	ffffd097          	auipc	ra,0xffffd
    80005b14:	a10080e7          	jalr	-1520(ra) # 80002520 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80005b18:	0204b503          	ld	a0,32(s1)
    80005b1c:	ffffd097          	auipc	ra,0xffffd
    80005b20:	a04080e7          	jalr	-1532(ra) # 80002520 <_ZN9Semaphore6signalEv>

}
    80005b24:	01813083          	ld	ra,24(sp)
    80005b28:	01013403          	ld	s0,16(sp)
    80005b2c:	00813483          	ld	s1,8(sp)
    80005b30:	00013903          	ld	s2,0(sp)
    80005b34:	02010113          	addi	sp,sp,32
    80005b38:	00008067          	ret

0000000080005b3c <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80005b3c:	fe010113          	addi	sp,sp,-32
    80005b40:	00113c23          	sd	ra,24(sp)
    80005b44:	00813823          	sd	s0,16(sp)
    80005b48:	00913423          	sd	s1,8(sp)
    80005b4c:	01213023          	sd	s2,0(sp)
    80005b50:	02010413          	addi	s0,sp,32
    80005b54:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80005b58:	02053503          	ld	a0,32(a0)
    80005b5c:	ffffd097          	auipc	ra,0xffffd
    80005b60:	998080e7          	jalr	-1640(ra) # 800024f4 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80005b64:	0284b503          	ld	a0,40(s1)
    80005b68:	ffffd097          	auipc	ra,0xffffd
    80005b6c:	98c080e7          	jalr	-1652(ra) # 800024f4 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80005b70:	0084b703          	ld	a4,8(s1)
    80005b74:	0104a783          	lw	a5,16(s1)
    80005b78:	00279693          	slli	a3,a5,0x2
    80005b7c:	00d70733          	add	a4,a4,a3
    80005b80:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80005b84:	0017879b          	addiw	a5,a5,1
    80005b88:	0004a703          	lw	a4,0(s1)
    80005b8c:	02e7e7bb          	remw	a5,a5,a4
    80005b90:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80005b94:	0284b503          	ld	a0,40(s1)
    80005b98:	ffffd097          	auipc	ra,0xffffd
    80005b9c:	988080e7          	jalr	-1656(ra) # 80002520 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80005ba0:	0184b503          	ld	a0,24(s1)
    80005ba4:	ffffd097          	auipc	ra,0xffffd
    80005ba8:	97c080e7          	jalr	-1668(ra) # 80002520 <_ZN9Semaphore6signalEv>

    return ret;
}
    80005bac:	00090513          	mv	a0,s2
    80005bb0:	01813083          	ld	ra,24(sp)
    80005bb4:	01013403          	ld	s0,16(sp)
    80005bb8:	00813483          	ld	s1,8(sp)
    80005bbc:	00013903          	ld	s2,0(sp)
    80005bc0:	02010113          	addi	sp,sp,32
    80005bc4:	00008067          	ret

0000000080005bc8 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80005bc8:	fe010113          	addi	sp,sp,-32
    80005bcc:	00113c23          	sd	ra,24(sp)
    80005bd0:	00813823          	sd	s0,16(sp)
    80005bd4:	00913423          	sd	s1,8(sp)
    80005bd8:	01213023          	sd	s2,0(sp)
    80005bdc:	02010413          	addi	s0,sp,32
    80005be0:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80005be4:	02853503          	ld	a0,40(a0)
    80005be8:	ffffd097          	auipc	ra,0xffffd
    80005bec:	90c080e7          	jalr	-1780(ra) # 800024f4 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80005bf0:	0304b503          	ld	a0,48(s1)
    80005bf4:	ffffd097          	auipc	ra,0xffffd
    80005bf8:	900080e7          	jalr	-1792(ra) # 800024f4 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80005bfc:	0144a783          	lw	a5,20(s1)
    80005c00:	0104a903          	lw	s2,16(s1)
    80005c04:	0327ce63          	blt	a5,s2,80005c40 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80005c08:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80005c0c:	0304b503          	ld	a0,48(s1)
    80005c10:	ffffd097          	auipc	ra,0xffffd
    80005c14:	910080e7          	jalr	-1776(ra) # 80002520 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80005c18:	0284b503          	ld	a0,40(s1)
    80005c1c:	ffffd097          	auipc	ra,0xffffd
    80005c20:	904080e7          	jalr	-1788(ra) # 80002520 <_ZN9Semaphore6signalEv>

    return ret;
}
    80005c24:	00090513          	mv	a0,s2
    80005c28:	01813083          	ld	ra,24(sp)
    80005c2c:	01013403          	ld	s0,16(sp)
    80005c30:	00813483          	ld	s1,8(sp)
    80005c34:	00013903          	ld	s2,0(sp)
    80005c38:	02010113          	addi	sp,sp,32
    80005c3c:	00008067          	ret
        ret = cap - head + tail;
    80005c40:	0004a703          	lw	a4,0(s1)
    80005c44:	4127093b          	subw	s2,a4,s2
    80005c48:	00f9093b          	addw	s2,s2,a5
    80005c4c:	fc1ff06f          	j	80005c0c <_ZN9BufferCPP6getCntEv+0x44>

0000000080005c50 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80005c50:	fe010113          	addi	sp,sp,-32
    80005c54:	00113c23          	sd	ra,24(sp)
    80005c58:	00813823          	sd	s0,16(sp)
    80005c5c:	00913423          	sd	s1,8(sp)
    80005c60:	02010413          	addi	s0,sp,32
    80005c64:	00050493          	mv	s1,a0
    Console::putc('\n');
    80005c68:	00a00513          	li	a0,10
    80005c6c:	ffffd097          	auipc	ra,0xffffd
    80005c70:	954080e7          	jalr	-1708(ra) # 800025c0 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80005c74:	00003517          	auipc	a0,0x3
    80005c78:	7ec50513          	addi	a0,a0,2028 # 80009460 <CONSOLE_STATUS+0x450>
    80005c7c:	00000097          	auipc	ra,0x0
    80005c80:	a0c080e7          	jalr	-1524(ra) # 80005688 <_Z11printStringPKc>
    while (getCnt()) {
    80005c84:	00048513          	mv	a0,s1
    80005c88:	00000097          	auipc	ra,0x0
    80005c8c:	f40080e7          	jalr	-192(ra) # 80005bc8 <_ZN9BufferCPP6getCntEv>
    80005c90:	02050c63          	beqz	a0,80005cc8 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80005c94:	0084b783          	ld	a5,8(s1)
    80005c98:	0104a703          	lw	a4,16(s1)
    80005c9c:	00271713          	slli	a4,a4,0x2
    80005ca0:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80005ca4:	0007c503          	lbu	a0,0(a5)
    80005ca8:	ffffd097          	auipc	ra,0xffffd
    80005cac:	918080e7          	jalr	-1768(ra) # 800025c0 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80005cb0:	0104a783          	lw	a5,16(s1)
    80005cb4:	0017879b          	addiw	a5,a5,1
    80005cb8:	0004a703          	lw	a4,0(s1)
    80005cbc:	02e7e7bb          	remw	a5,a5,a4
    80005cc0:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80005cc4:	fc1ff06f          	j	80005c84 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80005cc8:	02100513          	li	a0,33
    80005ccc:	ffffd097          	auipc	ra,0xffffd
    80005cd0:	8f4080e7          	jalr	-1804(ra) # 800025c0 <_ZN7Console4putcEc>
    Console::putc('\n');
    80005cd4:	00a00513          	li	a0,10
    80005cd8:	ffffd097          	auipc	ra,0xffffd
    80005cdc:	8e8080e7          	jalr	-1816(ra) # 800025c0 <_ZN7Console4putcEc>
    mem_free(buffer);
    80005ce0:	0084b503          	ld	a0,8(s1)
    80005ce4:	ffffb097          	auipc	ra,0xffffb
    80005ce8:	66c080e7          	jalr	1644(ra) # 80001350 <_Z8mem_freePv>
    delete itemAvailable;
    80005cec:	0204b503          	ld	a0,32(s1)
    80005cf0:	00050863          	beqz	a0,80005d00 <_ZN9BufferCPPD1Ev+0xb0>
    80005cf4:	00053783          	ld	a5,0(a0)
    80005cf8:	0087b783          	ld	a5,8(a5)
    80005cfc:	000780e7          	jalr	a5
    delete spaceAvailable;
    80005d00:	0184b503          	ld	a0,24(s1)
    80005d04:	00050863          	beqz	a0,80005d14 <_ZN9BufferCPPD1Ev+0xc4>
    80005d08:	00053783          	ld	a5,0(a0)
    80005d0c:	0087b783          	ld	a5,8(a5)
    80005d10:	000780e7          	jalr	a5
    delete mutexTail;
    80005d14:	0304b503          	ld	a0,48(s1)
    80005d18:	00050863          	beqz	a0,80005d28 <_ZN9BufferCPPD1Ev+0xd8>
    80005d1c:	00053783          	ld	a5,0(a0)
    80005d20:	0087b783          	ld	a5,8(a5)
    80005d24:	000780e7          	jalr	a5
    delete mutexHead;
    80005d28:	0284b503          	ld	a0,40(s1)
    80005d2c:	00050863          	beqz	a0,80005d3c <_ZN9BufferCPPD1Ev+0xec>
    80005d30:	00053783          	ld	a5,0(a0)
    80005d34:	0087b783          	ld	a5,8(a5)
    80005d38:	000780e7          	jalr	a5
}
    80005d3c:	01813083          	ld	ra,24(sp)
    80005d40:	01013403          	ld	s0,16(sp)
    80005d44:	00813483          	ld	s1,8(sp)
    80005d48:	02010113          	addi	sp,sp,32
    80005d4c:	00008067          	ret

0000000080005d50 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    80005d50:	fe010113          	addi	sp,sp,-32
    80005d54:	00113c23          	sd	ra,24(sp)
    80005d58:	00813823          	sd	s0,16(sp)
    80005d5c:	00913423          	sd	s1,8(sp)
    80005d60:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80005d64:	00003517          	auipc	a0,0x3
    80005d68:	71450513          	addi	a0,a0,1812 # 80009478 <CONSOLE_STATUS+0x468>
    80005d6c:	00000097          	auipc	ra,0x0
    80005d70:	91c080e7          	jalr	-1764(ra) # 80005688 <_Z11printStringPKc>
    int test = getc() - '0';
    80005d74:	ffffb097          	auipc	ra,0xffffb
    80005d78:	7f4080e7          	jalr	2036(ra) # 80001568 <_Z4getcv>
    80005d7c:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    80005d80:	ffffb097          	auipc	ra,0xffffb
    80005d84:	7e8080e7          	jalr	2024(ra) # 80001568 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80005d88:	00700793          	li	a5,7
    80005d8c:	1097e263          	bltu	a5,s1,80005e90 <_Z8userMainv+0x140>
    80005d90:	00249493          	slli	s1,s1,0x2
    80005d94:	00004717          	auipc	a4,0x4
    80005d98:	93c70713          	addi	a4,a4,-1732 # 800096d0 <CONSOLE_STATUS+0x6c0>
    80005d9c:	00e484b3          	add	s1,s1,a4
    80005da0:	0004a783          	lw	a5,0(s1)
    80005da4:	00e787b3          	add	a5,a5,a4
    80005da8:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    80005dac:	fffff097          	auipc	ra,0xfffff
    80005db0:	f54080e7          	jalr	-172(ra) # 80004d00 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80005db4:	00003517          	auipc	a0,0x3
    80005db8:	6e450513          	addi	a0,a0,1764 # 80009498 <CONSOLE_STATUS+0x488>
    80005dbc:	00000097          	auipc	ra,0x0
    80005dc0:	8cc080e7          	jalr	-1844(ra) # 80005688 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80005dc4:	01813083          	ld	ra,24(sp)
    80005dc8:	01013403          	ld	s0,16(sp)
    80005dcc:	00813483          	ld	s1,8(sp)
    80005dd0:	02010113          	addi	sp,sp,32
    80005dd4:	00008067          	ret
            Threads_CPP_API_test();
    80005dd8:	ffffe097          	auipc	ra,0xffffe
    80005ddc:	e08080e7          	jalr	-504(ra) # 80003be0 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80005de0:	00003517          	auipc	a0,0x3
    80005de4:	6f850513          	addi	a0,a0,1784 # 800094d8 <CONSOLE_STATUS+0x4c8>
    80005de8:	00000097          	auipc	ra,0x0
    80005dec:	8a0080e7          	jalr	-1888(ra) # 80005688 <_Z11printStringPKc>
            break;
    80005df0:	fd5ff06f          	j	80005dc4 <_Z8userMainv+0x74>
            producerConsumer_C_API();
    80005df4:	ffffd097          	auipc	ra,0xffffd
    80005df8:	640080e7          	jalr	1600(ra) # 80003434 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80005dfc:	00003517          	auipc	a0,0x3
    80005e00:	71c50513          	addi	a0,a0,1820 # 80009518 <CONSOLE_STATUS+0x508>
    80005e04:	00000097          	auipc	ra,0x0
    80005e08:	884080e7          	jalr	-1916(ra) # 80005688 <_Z11printStringPKc>
            break;
    80005e0c:	fb9ff06f          	j	80005dc4 <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    80005e10:	fffff097          	auipc	ra,0xfffff
    80005e14:	234080e7          	jalr	564(ra) # 80005044 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80005e18:	00003517          	auipc	a0,0x3
    80005e1c:	75050513          	addi	a0,a0,1872 # 80009568 <CONSOLE_STATUS+0x558>
    80005e20:	00000097          	auipc	ra,0x0
    80005e24:	868080e7          	jalr	-1944(ra) # 80005688 <_Z11printStringPKc>
            break;
    80005e28:	f9dff06f          	j	80005dc4 <_Z8userMainv+0x74>
            testSleeping();
    80005e2c:	00000097          	auipc	ra,0x0
    80005e30:	11c080e7          	jalr	284(ra) # 80005f48 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    80005e34:	00003517          	auipc	a0,0x3
    80005e38:	78c50513          	addi	a0,a0,1932 # 800095c0 <CONSOLE_STATUS+0x5b0>
    80005e3c:	00000097          	auipc	ra,0x0
    80005e40:	84c080e7          	jalr	-1972(ra) # 80005688 <_Z11printStringPKc>
            break;
    80005e44:	f81ff06f          	j	80005dc4 <_Z8userMainv+0x74>
            testConsumerProducer();
    80005e48:	ffffe097          	auipc	ra,0xffffe
    80005e4c:	258080e7          	jalr	600(ra) # 800040a0 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    80005e50:	00003517          	auipc	a0,0x3
    80005e54:	7a050513          	addi	a0,a0,1952 # 800095f0 <CONSOLE_STATUS+0x5e0>
    80005e58:	00000097          	auipc	ra,0x0
    80005e5c:	830080e7          	jalr	-2000(ra) # 80005688 <_Z11printStringPKc>
            break;
    80005e60:	f65ff06f          	j	80005dc4 <_Z8userMainv+0x74>
            System_Mode_test();
    80005e64:	00000097          	auipc	ra,0x0
    80005e68:	658080e7          	jalr	1624(ra) # 800064bc <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80005e6c:	00003517          	auipc	a0,0x3
    80005e70:	7c450513          	addi	a0,a0,1988 # 80009630 <CONSOLE_STATUS+0x620>
    80005e74:	00000097          	auipc	ra,0x0
    80005e78:	814080e7          	jalr	-2028(ra) # 80005688 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80005e7c:	00003517          	auipc	a0,0x3
    80005e80:	7d450513          	addi	a0,a0,2004 # 80009650 <CONSOLE_STATUS+0x640>
    80005e84:	00000097          	auipc	ra,0x0
    80005e88:	804080e7          	jalr	-2044(ra) # 80005688 <_Z11printStringPKc>
            break;
    80005e8c:	f39ff06f          	j	80005dc4 <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    80005e90:	00004517          	auipc	a0,0x4
    80005e94:	81850513          	addi	a0,a0,-2024 # 800096a8 <CONSOLE_STATUS+0x698>
    80005e98:	fffff097          	auipc	ra,0xfffff
    80005e9c:	7f0080e7          	jalr	2032(ra) # 80005688 <_Z11printStringPKc>
    80005ea0:	f25ff06f          	j	80005dc4 <_Z8userMainv+0x74>

0000000080005ea4 <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    80005ea4:	fe010113          	addi	sp,sp,-32
    80005ea8:	00113c23          	sd	ra,24(sp)
    80005eac:	00813823          	sd	s0,16(sp)
    80005eb0:	00913423          	sd	s1,8(sp)
    80005eb4:	01213023          	sd	s2,0(sp)
    80005eb8:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    80005ebc:	00053903          	ld	s2,0(a0)
    int i = 6;
    80005ec0:	00600493          	li	s1,6
    while (--i > 0) {
    80005ec4:	fff4849b          	addiw	s1,s1,-1
    80005ec8:	04905463          	blez	s1,80005f10 <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    80005ecc:	00004517          	auipc	a0,0x4
    80005ed0:	82450513          	addi	a0,a0,-2012 # 800096f0 <CONSOLE_STATUS+0x6e0>
    80005ed4:	fffff097          	auipc	ra,0xfffff
    80005ed8:	7b4080e7          	jalr	1972(ra) # 80005688 <_Z11printStringPKc>
        printInt(sleep_time);
    80005edc:	00000613          	li	a2,0
    80005ee0:	00a00593          	li	a1,10
    80005ee4:	0009051b          	sext.w	a0,s2
    80005ee8:	00000097          	auipc	ra,0x0
    80005eec:	950080e7          	jalr	-1712(ra) # 80005838 <_Z8printIntiii>
        printString(" !\n");
    80005ef0:	00004517          	auipc	a0,0x4
    80005ef4:	80850513          	addi	a0,a0,-2040 # 800096f8 <CONSOLE_STATUS+0x6e8>
    80005ef8:	fffff097          	auipc	ra,0xfffff
    80005efc:	790080e7          	jalr	1936(ra) # 80005688 <_Z11printStringPKc>
        time_sleep(sleep_time);
    80005f00:	00090513          	mv	a0,s2
    80005f04:	ffffb097          	auipc	ra,0xffffb
    80005f08:	56c080e7          	jalr	1388(ra) # 80001470 <_Z10time_sleepm>
    while (--i > 0) {
    80005f0c:	fb9ff06f          	j	80005ec4 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    80005f10:	00a00793          	li	a5,10
    80005f14:	02f95933          	divu	s2,s2,a5
    80005f18:	fff90913          	addi	s2,s2,-1
    80005f1c:	00006797          	auipc	a5,0x6
    80005f20:	ba478793          	addi	a5,a5,-1116 # 8000bac0 <_ZL8finished>
    80005f24:	01278933          	add	s2,a5,s2
    80005f28:	00100793          	li	a5,1
    80005f2c:	00f90023          	sb	a5,0(s2)
}
    80005f30:	01813083          	ld	ra,24(sp)
    80005f34:	01013403          	ld	s0,16(sp)
    80005f38:	00813483          	ld	s1,8(sp)
    80005f3c:	00013903          	ld	s2,0(sp)
    80005f40:	02010113          	addi	sp,sp,32
    80005f44:	00008067          	ret

0000000080005f48 <_Z12testSleepingv>:

void testSleeping() {
    80005f48:	fc010113          	addi	sp,sp,-64
    80005f4c:	02113c23          	sd	ra,56(sp)
    80005f50:	02813823          	sd	s0,48(sp)
    80005f54:	02913423          	sd	s1,40(sp)
    80005f58:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    80005f5c:	00a00793          	li	a5,10
    80005f60:	fcf43823          	sd	a5,-48(s0)
    80005f64:	01400793          	li	a5,20
    80005f68:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    80005f6c:	00000493          	li	s1,0
    80005f70:	02c0006f          	j	80005f9c <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    80005f74:	00349793          	slli	a5,s1,0x3
    80005f78:	fd040613          	addi	a2,s0,-48
    80005f7c:	00f60633          	add	a2,a2,a5
    80005f80:	00000597          	auipc	a1,0x0
    80005f84:	f2458593          	addi	a1,a1,-220 # 80005ea4 <_ZL9sleepyRunPv>
    80005f88:	fc040513          	addi	a0,s0,-64
    80005f8c:	00f50533          	add	a0,a0,a5
    80005f90:	ffffb097          	auipc	ra,0xffffb
    80005f94:	3f0080e7          	jalr	1008(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80005f98:	0014849b          	addiw	s1,s1,1
    80005f9c:	00100793          	li	a5,1
    80005fa0:	fc97dae3          	bge	a5,s1,80005f74 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    80005fa4:	00006797          	auipc	a5,0x6
    80005fa8:	b1c7c783          	lbu	a5,-1252(a5) # 8000bac0 <_ZL8finished>
    80005fac:	fe078ce3          	beqz	a5,80005fa4 <_Z12testSleepingv+0x5c>
    80005fb0:	00006797          	auipc	a5,0x6
    80005fb4:	b117c783          	lbu	a5,-1263(a5) # 8000bac1 <_ZL8finished+0x1>
    80005fb8:	fe0786e3          	beqz	a5,80005fa4 <_Z12testSleepingv+0x5c>
}
    80005fbc:	03813083          	ld	ra,56(sp)
    80005fc0:	03013403          	ld	s0,48(sp)
    80005fc4:	02813483          	ld	s1,40(sp)
    80005fc8:	04010113          	addi	sp,sp,64
    80005fcc:	00008067          	ret

0000000080005fd0 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80005fd0:	fe010113          	addi	sp,sp,-32
    80005fd4:	00113c23          	sd	ra,24(sp)
    80005fd8:	00813823          	sd	s0,16(sp)
    80005fdc:	00913423          	sd	s1,8(sp)
    80005fe0:	01213023          	sd	s2,0(sp)
    80005fe4:	02010413          	addi	s0,sp,32
    80005fe8:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80005fec:	00100793          	li	a5,1
    80005ff0:	02a7f863          	bgeu	a5,a0,80006020 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80005ff4:	00a00793          	li	a5,10
    80005ff8:	02f577b3          	remu	a5,a0,a5
    80005ffc:	02078e63          	beqz	a5,80006038 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80006000:	fff48513          	addi	a0,s1,-1
    80006004:	00000097          	auipc	ra,0x0
    80006008:	fcc080e7          	jalr	-52(ra) # 80005fd0 <_ZL9fibonaccim>
    8000600c:	00050913          	mv	s2,a0
    80006010:	ffe48513          	addi	a0,s1,-2
    80006014:	00000097          	auipc	ra,0x0
    80006018:	fbc080e7          	jalr	-68(ra) # 80005fd0 <_ZL9fibonaccim>
    8000601c:	00a90533          	add	a0,s2,a0
}
    80006020:	01813083          	ld	ra,24(sp)
    80006024:	01013403          	ld	s0,16(sp)
    80006028:	00813483          	ld	s1,8(sp)
    8000602c:	00013903          	ld	s2,0(sp)
    80006030:	02010113          	addi	sp,sp,32
    80006034:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80006038:	ffffb097          	auipc	ra,0xffffb
    8000603c:	3f0080e7          	jalr	1008(ra) # 80001428 <_Z15thread_dispatchv>
    80006040:	fc1ff06f          	j	80006000 <_ZL9fibonaccim+0x30>

0000000080006044 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80006044:	fe010113          	addi	sp,sp,-32
    80006048:	00113c23          	sd	ra,24(sp)
    8000604c:	00813823          	sd	s0,16(sp)
    80006050:	00913423          	sd	s1,8(sp)
    80006054:	01213023          	sd	s2,0(sp)
    80006058:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    8000605c:	00a00493          	li	s1,10
    80006060:	0400006f          	j	800060a0 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006064:	00003517          	auipc	a0,0x3
    80006068:	36450513          	addi	a0,a0,868 # 800093c8 <CONSOLE_STATUS+0x3b8>
    8000606c:	fffff097          	auipc	ra,0xfffff
    80006070:	61c080e7          	jalr	1564(ra) # 80005688 <_Z11printStringPKc>
    80006074:	00000613          	li	a2,0
    80006078:	00a00593          	li	a1,10
    8000607c:	00048513          	mv	a0,s1
    80006080:	fffff097          	auipc	ra,0xfffff
    80006084:	7b8080e7          	jalr	1976(ra) # 80005838 <_Z8printIntiii>
    80006088:	00003517          	auipc	a0,0x3
    8000608c:	53050513          	addi	a0,a0,1328 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80006090:	fffff097          	auipc	ra,0xfffff
    80006094:	5f8080e7          	jalr	1528(ra) # 80005688 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80006098:	0014849b          	addiw	s1,s1,1
    8000609c:	0ff4f493          	andi	s1,s1,255
    800060a0:	00c00793          	li	a5,12
    800060a4:	fc97f0e3          	bgeu	a5,s1,80006064 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800060a8:	00003517          	auipc	a0,0x3
    800060ac:	32850513          	addi	a0,a0,808 # 800093d0 <CONSOLE_STATUS+0x3c0>
    800060b0:	fffff097          	auipc	ra,0xfffff
    800060b4:	5d8080e7          	jalr	1496(ra) # 80005688 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800060b8:	00500313          	li	t1,5
    thread_dispatch();
    800060bc:	ffffb097          	auipc	ra,0xffffb
    800060c0:	36c080e7          	jalr	876(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800060c4:	01000513          	li	a0,16
    800060c8:	00000097          	auipc	ra,0x0
    800060cc:	f08080e7          	jalr	-248(ra) # 80005fd0 <_ZL9fibonaccim>
    800060d0:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800060d4:	00003517          	auipc	a0,0x3
    800060d8:	30c50513          	addi	a0,a0,780 # 800093e0 <CONSOLE_STATUS+0x3d0>
    800060dc:	fffff097          	auipc	ra,0xfffff
    800060e0:	5ac080e7          	jalr	1452(ra) # 80005688 <_Z11printStringPKc>
    800060e4:	00000613          	li	a2,0
    800060e8:	00a00593          	li	a1,10
    800060ec:	0009051b          	sext.w	a0,s2
    800060f0:	fffff097          	auipc	ra,0xfffff
    800060f4:	748080e7          	jalr	1864(ra) # 80005838 <_Z8printIntiii>
    800060f8:	00003517          	auipc	a0,0x3
    800060fc:	4c050513          	addi	a0,a0,1216 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80006100:	fffff097          	auipc	ra,0xfffff
    80006104:	588080e7          	jalr	1416(ra) # 80005688 <_Z11printStringPKc>
    80006108:	0400006f          	j	80006148 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000610c:	00003517          	auipc	a0,0x3
    80006110:	2bc50513          	addi	a0,a0,700 # 800093c8 <CONSOLE_STATUS+0x3b8>
    80006114:	fffff097          	auipc	ra,0xfffff
    80006118:	574080e7          	jalr	1396(ra) # 80005688 <_Z11printStringPKc>
    8000611c:	00000613          	li	a2,0
    80006120:	00a00593          	li	a1,10
    80006124:	00048513          	mv	a0,s1
    80006128:	fffff097          	auipc	ra,0xfffff
    8000612c:	710080e7          	jalr	1808(ra) # 80005838 <_Z8printIntiii>
    80006130:	00003517          	auipc	a0,0x3
    80006134:	48850513          	addi	a0,a0,1160 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80006138:	fffff097          	auipc	ra,0xfffff
    8000613c:	550080e7          	jalr	1360(ra) # 80005688 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80006140:	0014849b          	addiw	s1,s1,1
    80006144:	0ff4f493          	andi	s1,s1,255
    80006148:	00f00793          	li	a5,15
    8000614c:	fc97f0e3          	bgeu	a5,s1,8000610c <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80006150:	00003517          	auipc	a0,0x3
    80006154:	2a050513          	addi	a0,a0,672 # 800093f0 <CONSOLE_STATUS+0x3e0>
    80006158:	fffff097          	auipc	ra,0xfffff
    8000615c:	530080e7          	jalr	1328(ra) # 80005688 <_Z11printStringPKc>
    finishedD = true;
    80006160:	00100793          	li	a5,1
    80006164:	00006717          	auipc	a4,0x6
    80006168:	94f70f23          	sb	a5,-1698(a4) # 8000bac2 <_ZL9finishedD>
    thread_dispatch();
    8000616c:	ffffb097          	auipc	ra,0xffffb
    80006170:	2bc080e7          	jalr	700(ra) # 80001428 <_Z15thread_dispatchv>
}
    80006174:	01813083          	ld	ra,24(sp)
    80006178:	01013403          	ld	s0,16(sp)
    8000617c:	00813483          	ld	s1,8(sp)
    80006180:	00013903          	ld	s2,0(sp)
    80006184:	02010113          	addi	sp,sp,32
    80006188:	00008067          	ret

000000008000618c <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    8000618c:	fe010113          	addi	sp,sp,-32
    80006190:	00113c23          	sd	ra,24(sp)
    80006194:	00813823          	sd	s0,16(sp)
    80006198:	00913423          	sd	s1,8(sp)
    8000619c:	01213023          	sd	s2,0(sp)
    800061a0:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800061a4:	00000493          	li	s1,0
    800061a8:	0400006f          	j	800061e8 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800061ac:	00003517          	auipc	a0,0x3
    800061b0:	1ec50513          	addi	a0,a0,492 # 80009398 <CONSOLE_STATUS+0x388>
    800061b4:	fffff097          	auipc	ra,0xfffff
    800061b8:	4d4080e7          	jalr	1236(ra) # 80005688 <_Z11printStringPKc>
    800061bc:	00000613          	li	a2,0
    800061c0:	00a00593          	li	a1,10
    800061c4:	00048513          	mv	a0,s1
    800061c8:	fffff097          	auipc	ra,0xfffff
    800061cc:	670080e7          	jalr	1648(ra) # 80005838 <_Z8printIntiii>
    800061d0:	00003517          	auipc	a0,0x3
    800061d4:	3e850513          	addi	a0,a0,1000 # 800095b8 <CONSOLE_STATUS+0x5a8>
    800061d8:	fffff097          	auipc	ra,0xfffff
    800061dc:	4b0080e7          	jalr	1200(ra) # 80005688 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800061e0:	0014849b          	addiw	s1,s1,1
    800061e4:	0ff4f493          	andi	s1,s1,255
    800061e8:	00200793          	li	a5,2
    800061ec:	fc97f0e3          	bgeu	a5,s1,800061ac <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    800061f0:	00003517          	auipc	a0,0x3
    800061f4:	1b050513          	addi	a0,a0,432 # 800093a0 <CONSOLE_STATUS+0x390>
    800061f8:	fffff097          	auipc	ra,0xfffff
    800061fc:	490080e7          	jalr	1168(ra) # 80005688 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80006200:	00700313          	li	t1,7
    thread_dispatch();
    80006204:	ffffb097          	auipc	ra,0xffffb
    80006208:	224080e7          	jalr	548(ra) # 80001428 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    8000620c:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80006210:	00003517          	auipc	a0,0x3
    80006214:	1a050513          	addi	a0,a0,416 # 800093b0 <CONSOLE_STATUS+0x3a0>
    80006218:	fffff097          	auipc	ra,0xfffff
    8000621c:	470080e7          	jalr	1136(ra) # 80005688 <_Z11printStringPKc>
    80006220:	00000613          	li	a2,0
    80006224:	00a00593          	li	a1,10
    80006228:	0009051b          	sext.w	a0,s2
    8000622c:	fffff097          	auipc	ra,0xfffff
    80006230:	60c080e7          	jalr	1548(ra) # 80005838 <_Z8printIntiii>
    80006234:	00003517          	auipc	a0,0x3
    80006238:	38450513          	addi	a0,a0,900 # 800095b8 <CONSOLE_STATUS+0x5a8>
    8000623c:	fffff097          	auipc	ra,0xfffff
    80006240:	44c080e7          	jalr	1100(ra) # 80005688 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80006244:	00c00513          	li	a0,12
    80006248:	00000097          	auipc	ra,0x0
    8000624c:	d88080e7          	jalr	-632(ra) # 80005fd0 <_ZL9fibonaccim>
    80006250:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006254:	00003517          	auipc	a0,0x3
    80006258:	16450513          	addi	a0,a0,356 # 800093b8 <CONSOLE_STATUS+0x3a8>
    8000625c:	fffff097          	auipc	ra,0xfffff
    80006260:	42c080e7          	jalr	1068(ra) # 80005688 <_Z11printStringPKc>
    80006264:	00000613          	li	a2,0
    80006268:	00a00593          	li	a1,10
    8000626c:	0009051b          	sext.w	a0,s2
    80006270:	fffff097          	auipc	ra,0xfffff
    80006274:	5c8080e7          	jalr	1480(ra) # 80005838 <_Z8printIntiii>
    80006278:	00003517          	auipc	a0,0x3
    8000627c:	34050513          	addi	a0,a0,832 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80006280:	fffff097          	auipc	ra,0xfffff
    80006284:	408080e7          	jalr	1032(ra) # 80005688 <_Z11printStringPKc>
    80006288:	0400006f          	j	800062c8 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    8000628c:	00003517          	auipc	a0,0x3
    80006290:	10c50513          	addi	a0,a0,268 # 80009398 <CONSOLE_STATUS+0x388>
    80006294:	fffff097          	auipc	ra,0xfffff
    80006298:	3f4080e7          	jalr	1012(ra) # 80005688 <_Z11printStringPKc>
    8000629c:	00000613          	li	a2,0
    800062a0:	00a00593          	li	a1,10
    800062a4:	00048513          	mv	a0,s1
    800062a8:	fffff097          	auipc	ra,0xfffff
    800062ac:	590080e7          	jalr	1424(ra) # 80005838 <_Z8printIntiii>
    800062b0:	00003517          	auipc	a0,0x3
    800062b4:	30850513          	addi	a0,a0,776 # 800095b8 <CONSOLE_STATUS+0x5a8>
    800062b8:	fffff097          	auipc	ra,0xfffff
    800062bc:	3d0080e7          	jalr	976(ra) # 80005688 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800062c0:	0014849b          	addiw	s1,s1,1
    800062c4:	0ff4f493          	andi	s1,s1,255
    800062c8:	00500793          	li	a5,5
    800062cc:	fc97f0e3          	bgeu	a5,s1,8000628c <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    800062d0:	00003517          	auipc	a0,0x3
    800062d4:	0a050513          	addi	a0,a0,160 # 80009370 <CONSOLE_STATUS+0x360>
    800062d8:	fffff097          	auipc	ra,0xfffff
    800062dc:	3b0080e7          	jalr	944(ra) # 80005688 <_Z11printStringPKc>
    finishedC = true;
    800062e0:	00100793          	li	a5,1
    800062e4:	00005717          	auipc	a4,0x5
    800062e8:	7cf70fa3          	sb	a5,2015(a4) # 8000bac3 <_ZL9finishedC>
    thread_dispatch();
    800062ec:	ffffb097          	auipc	ra,0xffffb
    800062f0:	13c080e7          	jalr	316(ra) # 80001428 <_Z15thread_dispatchv>
}
    800062f4:	01813083          	ld	ra,24(sp)
    800062f8:	01013403          	ld	s0,16(sp)
    800062fc:	00813483          	ld	s1,8(sp)
    80006300:	00013903          	ld	s2,0(sp)
    80006304:	02010113          	addi	sp,sp,32
    80006308:	00008067          	ret

000000008000630c <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    8000630c:	fe010113          	addi	sp,sp,-32
    80006310:	00113c23          	sd	ra,24(sp)
    80006314:	00813823          	sd	s0,16(sp)
    80006318:	00913423          	sd	s1,8(sp)
    8000631c:	01213023          	sd	s2,0(sp)
    80006320:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006324:	00000913          	li	s2,0
    80006328:	0400006f          	j	80006368 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    8000632c:	ffffb097          	auipc	ra,0xffffb
    80006330:	0fc080e7          	jalr	252(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006334:	00148493          	addi	s1,s1,1
    80006338:	000027b7          	lui	a5,0x2
    8000633c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006340:	0097ee63          	bltu	a5,s1,8000635c <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006344:	00000713          	li	a4,0
    80006348:	000077b7          	lui	a5,0x7
    8000634c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006350:	fce7eee3          	bltu	a5,a4,8000632c <_ZL11workerBodyBPv+0x20>
    80006354:	00170713          	addi	a4,a4,1
    80006358:	ff1ff06f          	j	80006348 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    8000635c:	00a00793          	li	a5,10
    80006360:	04f90663          	beq	s2,a5,800063ac <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80006364:	00190913          	addi	s2,s2,1
    80006368:	00f00793          	li	a5,15
    8000636c:	0527e463          	bltu	a5,s2,800063b4 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80006370:	00003517          	auipc	a0,0x3
    80006374:	01050513          	addi	a0,a0,16 # 80009380 <CONSOLE_STATUS+0x370>
    80006378:	fffff097          	auipc	ra,0xfffff
    8000637c:	310080e7          	jalr	784(ra) # 80005688 <_Z11printStringPKc>
    80006380:	00000613          	li	a2,0
    80006384:	00a00593          	li	a1,10
    80006388:	0009051b          	sext.w	a0,s2
    8000638c:	fffff097          	auipc	ra,0xfffff
    80006390:	4ac080e7          	jalr	1196(ra) # 80005838 <_Z8printIntiii>
    80006394:	00003517          	auipc	a0,0x3
    80006398:	22450513          	addi	a0,a0,548 # 800095b8 <CONSOLE_STATUS+0x5a8>
    8000639c:	fffff097          	auipc	ra,0xfffff
    800063a0:	2ec080e7          	jalr	748(ra) # 80005688 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800063a4:	00000493          	li	s1,0
    800063a8:	f91ff06f          	j	80006338 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    800063ac:	14102ff3          	csrr	t6,sepc
    800063b0:	fb5ff06f          	j	80006364 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    800063b4:	00003517          	auipc	a0,0x3
    800063b8:	fd450513          	addi	a0,a0,-44 # 80009388 <CONSOLE_STATUS+0x378>
    800063bc:	fffff097          	auipc	ra,0xfffff
    800063c0:	2cc080e7          	jalr	716(ra) # 80005688 <_Z11printStringPKc>
    finishedB = true;
    800063c4:	00100793          	li	a5,1
    800063c8:	00005717          	auipc	a4,0x5
    800063cc:	6ef70e23          	sb	a5,1788(a4) # 8000bac4 <_ZL9finishedB>
    thread_dispatch();
    800063d0:	ffffb097          	auipc	ra,0xffffb
    800063d4:	058080e7          	jalr	88(ra) # 80001428 <_Z15thread_dispatchv>
}
    800063d8:	01813083          	ld	ra,24(sp)
    800063dc:	01013403          	ld	s0,16(sp)
    800063e0:	00813483          	ld	s1,8(sp)
    800063e4:	00013903          	ld	s2,0(sp)
    800063e8:	02010113          	addi	sp,sp,32
    800063ec:	00008067          	ret

00000000800063f0 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    800063f0:	fe010113          	addi	sp,sp,-32
    800063f4:	00113c23          	sd	ra,24(sp)
    800063f8:	00813823          	sd	s0,16(sp)
    800063fc:	00913423          	sd	s1,8(sp)
    80006400:	01213023          	sd	s2,0(sp)
    80006404:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006408:	00000913          	li	s2,0
    8000640c:	0380006f          	j	80006444 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80006410:	ffffb097          	auipc	ra,0xffffb
    80006414:	018080e7          	jalr	24(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006418:	00148493          	addi	s1,s1,1
    8000641c:	000027b7          	lui	a5,0x2
    80006420:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006424:	0097ee63          	bltu	a5,s1,80006440 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006428:	00000713          	li	a4,0
    8000642c:	000077b7          	lui	a5,0x7
    80006430:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006434:	fce7eee3          	bltu	a5,a4,80006410 <_ZL11workerBodyAPv+0x20>
    80006438:	00170713          	addi	a4,a4,1
    8000643c:	ff1ff06f          	j	8000642c <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80006440:	00190913          	addi	s2,s2,1
    80006444:	00900793          	li	a5,9
    80006448:	0527e063          	bltu	a5,s2,80006488 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    8000644c:	00003517          	auipc	a0,0x3
    80006450:	f1c50513          	addi	a0,a0,-228 # 80009368 <CONSOLE_STATUS+0x358>
    80006454:	fffff097          	auipc	ra,0xfffff
    80006458:	234080e7          	jalr	564(ra) # 80005688 <_Z11printStringPKc>
    8000645c:	00000613          	li	a2,0
    80006460:	00a00593          	li	a1,10
    80006464:	0009051b          	sext.w	a0,s2
    80006468:	fffff097          	auipc	ra,0xfffff
    8000646c:	3d0080e7          	jalr	976(ra) # 80005838 <_Z8printIntiii>
    80006470:	00003517          	auipc	a0,0x3
    80006474:	14850513          	addi	a0,a0,328 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80006478:	fffff097          	auipc	ra,0xfffff
    8000647c:	210080e7          	jalr	528(ra) # 80005688 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006480:	00000493          	li	s1,0
    80006484:	f99ff06f          	j	8000641c <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80006488:	00003517          	auipc	a0,0x3
    8000648c:	ee850513          	addi	a0,a0,-280 # 80009370 <CONSOLE_STATUS+0x360>
    80006490:	fffff097          	auipc	ra,0xfffff
    80006494:	1f8080e7          	jalr	504(ra) # 80005688 <_Z11printStringPKc>
    finishedA = true;
    80006498:	00100793          	li	a5,1
    8000649c:	00005717          	auipc	a4,0x5
    800064a0:	62f704a3          	sb	a5,1577(a4) # 8000bac5 <_ZL9finishedA>
}
    800064a4:	01813083          	ld	ra,24(sp)
    800064a8:	01013403          	ld	s0,16(sp)
    800064ac:	00813483          	ld	s1,8(sp)
    800064b0:	00013903          	ld	s2,0(sp)
    800064b4:	02010113          	addi	sp,sp,32
    800064b8:	00008067          	ret

00000000800064bc <_Z16System_Mode_testv>:


void System_Mode_test() {
    800064bc:	fd010113          	addi	sp,sp,-48
    800064c0:	02113423          	sd	ra,40(sp)
    800064c4:	02813023          	sd	s0,32(sp)
    800064c8:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    800064cc:	00000613          	li	a2,0
    800064d0:	00000597          	auipc	a1,0x0
    800064d4:	f2058593          	addi	a1,a1,-224 # 800063f0 <_ZL11workerBodyAPv>
    800064d8:	fd040513          	addi	a0,s0,-48
    800064dc:	ffffb097          	auipc	ra,0xffffb
    800064e0:	ea4080e7          	jalr	-348(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    800064e4:	00003517          	auipc	a0,0x3
    800064e8:	f1c50513          	addi	a0,a0,-228 # 80009400 <CONSOLE_STATUS+0x3f0>
    800064ec:	fffff097          	auipc	ra,0xfffff
    800064f0:	19c080e7          	jalr	412(ra) # 80005688 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    800064f4:	00000613          	li	a2,0
    800064f8:	00000597          	auipc	a1,0x0
    800064fc:	e1458593          	addi	a1,a1,-492 # 8000630c <_ZL11workerBodyBPv>
    80006500:	fd840513          	addi	a0,s0,-40
    80006504:	ffffb097          	auipc	ra,0xffffb
    80006508:	e7c080e7          	jalr	-388(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    8000650c:	00003517          	auipc	a0,0x3
    80006510:	f0c50513          	addi	a0,a0,-244 # 80009418 <CONSOLE_STATUS+0x408>
    80006514:	fffff097          	auipc	ra,0xfffff
    80006518:	174080e7          	jalr	372(ra) # 80005688 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    8000651c:	00000613          	li	a2,0
    80006520:	00000597          	auipc	a1,0x0
    80006524:	c6c58593          	addi	a1,a1,-916 # 8000618c <_ZL11workerBodyCPv>
    80006528:	fe040513          	addi	a0,s0,-32
    8000652c:	ffffb097          	auipc	ra,0xffffb
    80006530:	e54080e7          	jalr	-428(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80006534:	00003517          	auipc	a0,0x3
    80006538:	efc50513          	addi	a0,a0,-260 # 80009430 <CONSOLE_STATUS+0x420>
    8000653c:	fffff097          	auipc	ra,0xfffff
    80006540:	14c080e7          	jalr	332(ra) # 80005688 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80006544:	00000613          	li	a2,0
    80006548:	00000597          	auipc	a1,0x0
    8000654c:	afc58593          	addi	a1,a1,-1284 # 80006044 <_ZL11workerBodyDPv>
    80006550:	fe840513          	addi	a0,s0,-24
    80006554:	ffffb097          	auipc	ra,0xffffb
    80006558:	e2c080e7          	jalr	-468(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    8000655c:	00003517          	auipc	a0,0x3
    80006560:	eec50513          	addi	a0,a0,-276 # 80009448 <CONSOLE_STATUS+0x438>
    80006564:	fffff097          	auipc	ra,0xfffff
    80006568:	124080e7          	jalr	292(ra) # 80005688 <_Z11printStringPKc>
    8000656c:	00c0006f          	j	80006578 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006570:	ffffb097          	auipc	ra,0xffffb
    80006574:	eb8080e7          	jalr	-328(ra) # 80001428 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006578:	00005797          	auipc	a5,0x5
    8000657c:	54d7c783          	lbu	a5,1357(a5) # 8000bac5 <_ZL9finishedA>
    80006580:	fe0788e3          	beqz	a5,80006570 <_Z16System_Mode_testv+0xb4>
    80006584:	00005797          	auipc	a5,0x5
    80006588:	5407c783          	lbu	a5,1344(a5) # 8000bac4 <_ZL9finishedB>
    8000658c:	fe0782e3          	beqz	a5,80006570 <_Z16System_Mode_testv+0xb4>
    80006590:	00005797          	auipc	a5,0x5
    80006594:	5337c783          	lbu	a5,1331(a5) # 8000bac3 <_ZL9finishedC>
    80006598:	fc078ce3          	beqz	a5,80006570 <_Z16System_Mode_testv+0xb4>
    8000659c:	00005797          	auipc	a5,0x5
    800065a0:	5267c783          	lbu	a5,1318(a5) # 8000bac2 <_ZL9finishedD>
    800065a4:	fc0786e3          	beqz	a5,80006570 <_Z16System_Mode_testv+0xb4>
    }

}
    800065a8:	02813083          	ld	ra,40(sp)
    800065ac:	02013403          	ld	s0,32(sp)
    800065b0:	03010113          	addi	sp,sp,48
    800065b4:	00008067          	ret

00000000800065b8 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    800065b8:	fe010113          	addi	sp,sp,-32
    800065bc:	00113c23          	sd	ra,24(sp)
    800065c0:	00813823          	sd	s0,16(sp)
    800065c4:	00913423          	sd	s1,8(sp)
    800065c8:	01213023          	sd	s2,0(sp)
    800065cc:	02010413          	addi	s0,sp,32
    800065d0:	00050493          	mv	s1,a0
    800065d4:	00058913          	mv	s2,a1
    800065d8:	0015879b          	addiw	a5,a1,1
    800065dc:	0007851b          	sext.w	a0,a5
    800065e0:	00f4a023          	sw	a5,0(s1)
    800065e4:	0004a823          	sw	zero,16(s1)
    800065e8:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    800065ec:	00251513          	slli	a0,a0,0x2
    800065f0:	ffffb097          	auipc	ra,0xffffb
    800065f4:	d20080e7          	jalr	-736(ra) # 80001310 <_Z9mem_allocm>
    800065f8:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    800065fc:	00000593          	li	a1,0
    80006600:	02048513          	addi	a0,s1,32
    80006604:	ffffb097          	auipc	ra,0xffffb
    80006608:	e9c080e7          	jalr	-356(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&spaceAvailable, _cap);
    8000660c:	00090593          	mv	a1,s2
    80006610:	01848513          	addi	a0,s1,24
    80006614:	ffffb097          	auipc	ra,0xffffb
    80006618:	e8c080e7          	jalr	-372(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&mutexHead, 1);
    8000661c:	00100593          	li	a1,1
    80006620:	02848513          	addi	a0,s1,40
    80006624:	ffffb097          	auipc	ra,0xffffb
    80006628:	e7c080e7          	jalr	-388(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&mutexTail, 1);
    8000662c:	00100593          	li	a1,1
    80006630:	03048513          	addi	a0,s1,48
    80006634:	ffffb097          	auipc	ra,0xffffb
    80006638:	e6c080e7          	jalr	-404(ra) # 800014a0 <_Z8sem_openPP4KSemj>
}
    8000663c:	01813083          	ld	ra,24(sp)
    80006640:	01013403          	ld	s0,16(sp)
    80006644:	00813483          	ld	s1,8(sp)
    80006648:	00013903          	ld	s2,0(sp)
    8000664c:	02010113          	addi	sp,sp,32
    80006650:	00008067          	ret

0000000080006654 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80006654:	fe010113          	addi	sp,sp,-32
    80006658:	00113c23          	sd	ra,24(sp)
    8000665c:	00813823          	sd	s0,16(sp)
    80006660:	00913423          	sd	s1,8(sp)
    80006664:	01213023          	sd	s2,0(sp)
    80006668:	02010413          	addi	s0,sp,32
    8000666c:	00050493          	mv	s1,a0
    80006670:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80006674:	01853503          	ld	a0,24(a0)
    80006678:	ffffb097          	auipc	ra,0xffffb
    8000667c:	e90080e7          	jalr	-368(ra) # 80001508 <_Z8sem_waitP4KSem>

    sem_wait(mutexTail);
    80006680:	0304b503          	ld	a0,48(s1)
    80006684:	ffffb097          	auipc	ra,0xffffb
    80006688:	e84080e7          	jalr	-380(ra) # 80001508 <_Z8sem_waitP4KSem>
    buffer[tail] = val;
    8000668c:	0084b783          	ld	a5,8(s1)
    80006690:	0144a703          	lw	a4,20(s1)
    80006694:	00271713          	slli	a4,a4,0x2
    80006698:	00e787b3          	add	a5,a5,a4
    8000669c:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800066a0:	0144a783          	lw	a5,20(s1)
    800066a4:	0017879b          	addiw	a5,a5,1
    800066a8:	0004a703          	lw	a4,0(s1)
    800066ac:	02e7e7bb          	remw	a5,a5,a4
    800066b0:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    800066b4:	0304b503          	ld	a0,48(s1)
    800066b8:	ffffb097          	auipc	ra,0xffffb
    800066bc:	e80080e7          	jalr	-384(ra) # 80001538 <_Z10sem_signalP4KSem>

    sem_signal(itemAvailable);
    800066c0:	0204b503          	ld	a0,32(s1)
    800066c4:	ffffb097          	auipc	ra,0xffffb
    800066c8:	e74080e7          	jalr	-396(ra) # 80001538 <_Z10sem_signalP4KSem>

}
    800066cc:	01813083          	ld	ra,24(sp)
    800066d0:	01013403          	ld	s0,16(sp)
    800066d4:	00813483          	ld	s1,8(sp)
    800066d8:	00013903          	ld	s2,0(sp)
    800066dc:	02010113          	addi	sp,sp,32
    800066e0:	00008067          	ret

00000000800066e4 <_ZN6Buffer3getEv>:

int Buffer::get() {
    800066e4:	fe010113          	addi	sp,sp,-32
    800066e8:	00113c23          	sd	ra,24(sp)
    800066ec:	00813823          	sd	s0,16(sp)
    800066f0:	00913423          	sd	s1,8(sp)
    800066f4:	01213023          	sd	s2,0(sp)
    800066f8:	02010413          	addi	s0,sp,32
    800066fc:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80006700:	02053503          	ld	a0,32(a0)
    80006704:	ffffb097          	auipc	ra,0xffffb
    80006708:	e04080e7          	jalr	-508(ra) # 80001508 <_Z8sem_waitP4KSem>

    sem_wait(mutexHead);
    8000670c:	0284b503          	ld	a0,40(s1)
    80006710:	ffffb097          	auipc	ra,0xffffb
    80006714:	df8080e7          	jalr	-520(ra) # 80001508 <_Z8sem_waitP4KSem>

    int ret = buffer[head];
    80006718:	0084b703          	ld	a4,8(s1)
    8000671c:	0104a783          	lw	a5,16(s1)
    80006720:	00279693          	slli	a3,a5,0x2
    80006724:	00d70733          	add	a4,a4,a3
    80006728:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    8000672c:	0017879b          	addiw	a5,a5,1
    80006730:	0004a703          	lw	a4,0(s1)
    80006734:	02e7e7bb          	remw	a5,a5,a4
    80006738:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    8000673c:	0284b503          	ld	a0,40(s1)
    80006740:	ffffb097          	auipc	ra,0xffffb
    80006744:	df8080e7          	jalr	-520(ra) # 80001538 <_Z10sem_signalP4KSem>

    sem_signal(spaceAvailable);
    80006748:	0184b503          	ld	a0,24(s1)
    8000674c:	ffffb097          	auipc	ra,0xffffb
    80006750:	dec080e7          	jalr	-532(ra) # 80001538 <_Z10sem_signalP4KSem>

    return ret;
}
    80006754:	00090513          	mv	a0,s2
    80006758:	01813083          	ld	ra,24(sp)
    8000675c:	01013403          	ld	s0,16(sp)
    80006760:	00813483          	ld	s1,8(sp)
    80006764:	00013903          	ld	s2,0(sp)
    80006768:	02010113          	addi	sp,sp,32
    8000676c:	00008067          	ret

0000000080006770 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80006770:	fe010113          	addi	sp,sp,-32
    80006774:	00113c23          	sd	ra,24(sp)
    80006778:	00813823          	sd	s0,16(sp)
    8000677c:	00913423          	sd	s1,8(sp)
    80006780:	01213023          	sd	s2,0(sp)
    80006784:	02010413          	addi	s0,sp,32
    80006788:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    8000678c:	02853503          	ld	a0,40(a0)
    80006790:	ffffb097          	auipc	ra,0xffffb
    80006794:	d78080e7          	jalr	-648(ra) # 80001508 <_Z8sem_waitP4KSem>
    sem_wait(mutexTail);
    80006798:	0304b503          	ld	a0,48(s1)
    8000679c:	ffffb097          	auipc	ra,0xffffb
    800067a0:	d6c080e7          	jalr	-660(ra) # 80001508 <_Z8sem_waitP4KSem>

    if (tail >= head) {
    800067a4:	0144a783          	lw	a5,20(s1)
    800067a8:	0104a903          	lw	s2,16(s1)
    800067ac:	0327ce63          	blt	a5,s2,800067e8 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    800067b0:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    800067b4:	0304b503          	ld	a0,48(s1)
    800067b8:	ffffb097          	auipc	ra,0xffffb
    800067bc:	d80080e7          	jalr	-640(ra) # 80001538 <_Z10sem_signalP4KSem>
    sem_signal(mutexHead);
    800067c0:	0284b503          	ld	a0,40(s1)
    800067c4:	ffffb097          	auipc	ra,0xffffb
    800067c8:	d74080e7          	jalr	-652(ra) # 80001538 <_Z10sem_signalP4KSem>

    return ret;
}
    800067cc:	00090513          	mv	a0,s2
    800067d0:	01813083          	ld	ra,24(sp)
    800067d4:	01013403          	ld	s0,16(sp)
    800067d8:	00813483          	ld	s1,8(sp)
    800067dc:	00013903          	ld	s2,0(sp)
    800067e0:	02010113          	addi	sp,sp,32
    800067e4:	00008067          	ret
        ret = cap - head + tail;
    800067e8:	0004a703          	lw	a4,0(s1)
    800067ec:	4127093b          	subw	s2,a4,s2
    800067f0:	00f9093b          	addw	s2,s2,a5
    800067f4:	fc1ff06f          	j	800067b4 <_ZN6Buffer6getCntEv+0x44>

00000000800067f8 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    800067f8:	fe010113          	addi	sp,sp,-32
    800067fc:	00113c23          	sd	ra,24(sp)
    80006800:	00813823          	sd	s0,16(sp)
    80006804:	00913423          	sd	s1,8(sp)
    80006808:	02010413          	addi	s0,sp,32
    8000680c:	00050493          	mv	s1,a0
    putc('\n');
    80006810:	00a00513          	li	a0,10
    80006814:	ffffb097          	auipc	ra,0xffffb
    80006818:	d7c080e7          	jalr	-644(ra) # 80001590 <_Z4putcc>
    printString("Buffer deleted!\n");
    8000681c:	00003517          	auipc	a0,0x3
    80006820:	c4450513          	addi	a0,a0,-956 # 80009460 <CONSOLE_STATUS+0x450>
    80006824:	fffff097          	auipc	ra,0xfffff
    80006828:	e64080e7          	jalr	-412(ra) # 80005688 <_Z11printStringPKc>
    while (getCnt() > 0) {
    8000682c:	00048513          	mv	a0,s1
    80006830:	00000097          	auipc	ra,0x0
    80006834:	f40080e7          	jalr	-192(ra) # 80006770 <_ZN6Buffer6getCntEv>
    80006838:	02a05c63          	blez	a0,80006870 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    8000683c:	0084b783          	ld	a5,8(s1)
    80006840:	0104a703          	lw	a4,16(s1)
    80006844:	00271713          	slli	a4,a4,0x2
    80006848:	00e787b3          	add	a5,a5,a4
        putc(ch);
    8000684c:	0007c503          	lbu	a0,0(a5)
    80006850:	ffffb097          	auipc	ra,0xffffb
    80006854:	d40080e7          	jalr	-704(ra) # 80001590 <_Z4putcc>
        head = (head + 1) % cap;
    80006858:	0104a783          	lw	a5,16(s1)
    8000685c:	0017879b          	addiw	a5,a5,1
    80006860:	0004a703          	lw	a4,0(s1)
    80006864:	02e7e7bb          	remw	a5,a5,a4
    80006868:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    8000686c:	fc1ff06f          	j	8000682c <_ZN6BufferD1Ev+0x34>
    putc('!');
    80006870:	02100513          	li	a0,33
    80006874:	ffffb097          	auipc	ra,0xffffb
    80006878:	d1c080e7          	jalr	-740(ra) # 80001590 <_Z4putcc>
    putc('\n');
    8000687c:	00a00513          	li	a0,10
    80006880:	ffffb097          	auipc	ra,0xffffb
    80006884:	d10080e7          	jalr	-752(ra) # 80001590 <_Z4putcc>
    mem_free(buffer);
    80006888:	0084b503          	ld	a0,8(s1)
    8000688c:	ffffb097          	auipc	ra,0xffffb
    80006890:	ac4080e7          	jalr	-1340(ra) # 80001350 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80006894:	0204b503          	ld	a0,32(s1)
    80006898:	ffffb097          	auipc	ra,0xffffb
    8000689c:	c40080e7          	jalr	-960(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(spaceAvailable);
    800068a0:	0184b503          	ld	a0,24(s1)
    800068a4:	ffffb097          	auipc	ra,0xffffb
    800068a8:	c34080e7          	jalr	-972(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(mutexTail);
    800068ac:	0304b503          	ld	a0,48(s1)
    800068b0:	ffffb097          	auipc	ra,0xffffb
    800068b4:	c28080e7          	jalr	-984(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(mutexHead);
    800068b8:	0284b503          	ld	a0,40(s1)
    800068bc:	ffffb097          	auipc	ra,0xffffb
    800068c0:	c1c080e7          	jalr	-996(ra) # 800014d8 <_Z9sem_closeP4KSem>
}
    800068c4:	01813083          	ld	ra,24(sp)
    800068c8:	01013403          	ld	s0,16(sp)
    800068cc:	00813483          	ld	s1,8(sp)
    800068d0:	02010113          	addi	sp,sp,32
    800068d4:	00008067          	ret

00000000800068d8 <start>:
    800068d8:	ff010113          	addi	sp,sp,-16
    800068dc:	00813423          	sd	s0,8(sp)
    800068e0:	01010413          	addi	s0,sp,16
    800068e4:	300027f3          	csrr	a5,mstatus
    800068e8:	ffffe737          	lui	a4,0xffffe
    800068ec:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff1acf>
    800068f0:	00e7f7b3          	and	a5,a5,a4
    800068f4:	00001737          	lui	a4,0x1
    800068f8:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800068fc:	00e7e7b3          	or	a5,a5,a4
    80006900:	30079073          	csrw	mstatus,a5
    80006904:	00000797          	auipc	a5,0x0
    80006908:	16078793          	addi	a5,a5,352 # 80006a64 <system_main>
    8000690c:	34179073          	csrw	mepc,a5
    80006910:	00000793          	li	a5,0
    80006914:	18079073          	csrw	satp,a5
    80006918:	000107b7          	lui	a5,0x10
    8000691c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80006920:	30279073          	csrw	medeleg,a5
    80006924:	30379073          	csrw	mideleg,a5
    80006928:	104027f3          	csrr	a5,sie
    8000692c:	2227e793          	ori	a5,a5,546
    80006930:	10479073          	csrw	sie,a5
    80006934:	fff00793          	li	a5,-1
    80006938:	00a7d793          	srli	a5,a5,0xa
    8000693c:	3b079073          	csrw	pmpaddr0,a5
    80006940:	00f00793          	li	a5,15
    80006944:	3a079073          	csrw	pmpcfg0,a5
    80006948:	f14027f3          	csrr	a5,mhartid
    8000694c:	0200c737          	lui	a4,0x200c
    80006950:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80006954:	0007869b          	sext.w	a3,a5
    80006958:	00269713          	slli	a4,a3,0x2
    8000695c:	000f4637          	lui	a2,0xf4
    80006960:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80006964:	00d70733          	add	a4,a4,a3
    80006968:	0037979b          	slliw	a5,a5,0x3
    8000696c:	020046b7          	lui	a3,0x2004
    80006970:	00d787b3          	add	a5,a5,a3
    80006974:	00c585b3          	add	a1,a1,a2
    80006978:	00371693          	slli	a3,a4,0x3
    8000697c:	00005717          	auipc	a4,0x5
    80006980:	15470713          	addi	a4,a4,340 # 8000bad0 <timer_scratch>
    80006984:	00b7b023          	sd	a1,0(a5)
    80006988:	00d70733          	add	a4,a4,a3
    8000698c:	00f73c23          	sd	a5,24(a4)
    80006990:	02c73023          	sd	a2,32(a4)
    80006994:	34071073          	csrw	mscratch,a4
    80006998:	00000797          	auipc	a5,0x0
    8000699c:	6e878793          	addi	a5,a5,1768 # 80007080 <timervec>
    800069a0:	30579073          	csrw	mtvec,a5
    800069a4:	300027f3          	csrr	a5,mstatus
    800069a8:	0087e793          	ori	a5,a5,8
    800069ac:	30079073          	csrw	mstatus,a5
    800069b0:	304027f3          	csrr	a5,mie
    800069b4:	0807e793          	ori	a5,a5,128
    800069b8:	30479073          	csrw	mie,a5
    800069bc:	f14027f3          	csrr	a5,mhartid
    800069c0:	0007879b          	sext.w	a5,a5
    800069c4:	00078213          	mv	tp,a5
    800069c8:	30200073          	mret
    800069cc:	00813403          	ld	s0,8(sp)
    800069d0:	01010113          	addi	sp,sp,16
    800069d4:	00008067          	ret

00000000800069d8 <timerinit>:
    800069d8:	ff010113          	addi	sp,sp,-16
    800069dc:	00813423          	sd	s0,8(sp)
    800069e0:	01010413          	addi	s0,sp,16
    800069e4:	f14027f3          	csrr	a5,mhartid
    800069e8:	0200c737          	lui	a4,0x200c
    800069ec:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800069f0:	0007869b          	sext.w	a3,a5
    800069f4:	00269713          	slli	a4,a3,0x2
    800069f8:	000f4637          	lui	a2,0xf4
    800069fc:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80006a00:	00d70733          	add	a4,a4,a3
    80006a04:	0037979b          	slliw	a5,a5,0x3
    80006a08:	020046b7          	lui	a3,0x2004
    80006a0c:	00d787b3          	add	a5,a5,a3
    80006a10:	00c585b3          	add	a1,a1,a2
    80006a14:	00371693          	slli	a3,a4,0x3
    80006a18:	00005717          	auipc	a4,0x5
    80006a1c:	0b870713          	addi	a4,a4,184 # 8000bad0 <timer_scratch>
    80006a20:	00b7b023          	sd	a1,0(a5)
    80006a24:	00d70733          	add	a4,a4,a3
    80006a28:	00f73c23          	sd	a5,24(a4)
    80006a2c:	02c73023          	sd	a2,32(a4)
    80006a30:	34071073          	csrw	mscratch,a4
    80006a34:	00000797          	auipc	a5,0x0
    80006a38:	64c78793          	addi	a5,a5,1612 # 80007080 <timervec>
    80006a3c:	30579073          	csrw	mtvec,a5
    80006a40:	300027f3          	csrr	a5,mstatus
    80006a44:	0087e793          	ori	a5,a5,8
    80006a48:	30079073          	csrw	mstatus,a5
    80006a4c:	304027f3          	csrr	a5,mie
    80006a50:	0807e793          	ori	a5,a5,128
    80006a54:	30479073          	csrw	mie,a5
    80006a58:	00813403          	ld	s0,8(sp)
    80006a5c:	01010113          	addi	sp,sp,16
    80006a60:	00008067          	ret

0000000080006a64 <system_main>:
    80006a64:	fe010113          	addi	sp,sp,-32
    80006a68:	00813823          	sd	s0,16(sp)
    80006a6c:	00913423          	sd	s1,8(sp)
    80006a70:	00113c23          	sd	ra,24(sp)
    80006a74:	02010413          	addi	s0,sp,32
    80006a78:	00000097          	auipc	ra,0x0
    80006a7c:	0c4080e7          	jalr	196(ra) # 80006b3c <cpuid>
    80006a80:	00005497          	auipc	s1,0x5
    80006a84:	f8048493          	addi	s1,s1,-128 # 8000ba00 <started>
    80006a88:	02050263          	beqz	a0,80006aac <system_main+0x48>
    80006a8c:	0004a783          	lw	a5,0(s1)
    80006a90:	0007879b          	sext.w	a5,a5
    80006a94:	fe078ce3          	beqz	a5,80006a8c <system_main+0x28>
    80006a98:	0ff0000f          	fence
    80006a9c:	00003517          	auipc	a0,0x3
    80006aa0:	c9450513          	addi	a0,a0,-876 # 80009730 <CONSOLE_STATUS+0x720>
    80006aa4:	00001097          	auipc	ra,0x1
    80006aa8:	a78080e7          	jalr	-1416(ra) # 8000751c <panic>
    80006aac:	00001097          	auipc	ra,0x1
    80006ab0:	9cc080e7          	jalr	-1588(ra) # 80007478 <consoleinit>
    80006ab4:	00001097          	auipc	ra,0x1
    80006ab8:	158080e7          	jalr	344(ra) # 80007c0c <printfinit>
    80006abc:	00003517          	auipc	a0,0x3
    80006ac0:	afc50513          	addi	a0,a0,-1284 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80006ac4:	00001097          	auipc	ra,0x1
    80006ac8:	ab4080e7          	jalr	-1356(ra) # 80007578 <__printf>
    80006acc:	00003517          	auipc	a0,0x3
    80006ad0:	c3450513          	addi	a0,a0,-972 # 80009700 <CONSOLE_STATUS+0x6f0>
    80006ad4:	00001097          	auipc	ra,0x1
    80006ad8:	aa4080e7          	jalr	-1372(ra) # 80007578 <__printf>
    80006adc:	00003517          	auipc	a0,0x3
    80006ae0:	adc50513          	addi	a0,a0,-1316 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80006ae4:	00001097          	auipc	ra,0x1
    80006ae8:	a94080e7          	jalr	-1388(ra) # 80007578 <__printf>
    80006aec:	00001097          	auipc	ra,0x1
    80006af0:	4ac080e7          	jalr	1196(ra) # 80007f98 <kinit>
    80006af4:	00000097          	auipc	ra,0x0
    80006af8:	148080e7          	jalr	328(ra) # 80006c3c <trapinit>
    80006afc:	00000097          	auipc	ra,0x0
    80006b00:	16c080e7          	jalr	364(ra) # 80006c68 <trapinithart>
    80006b04:	00000097          	auipc	ra,0x0
    80006b08:	5bc080e7          	jalr	1468(ra) # 800070c0 <plicinit>
    80006b0c:	00000097          	auipc	ra,0x0
    80006b10:	5dc080e7          	jalr	1500(ra) # 800070e8 <plicinithart>
    80006b14:	00000097          	auipc	ra,0x0
    80006b18:	078080e7          	jalr	120(ra) # 80006b8c <userinit>
    80006b1c:	0ff0000f          	fence
    80006b20:	00100793          	li	a5,1
    80006b24:	00003517          	auipc	a0,0x3
    80006b28:	bf450513          	addi	a0,a0,-1036 # 80009718 <CONSOLE_STATUS+0x708>
    80006b2c:	00f4a023          	sw	a5,0(s1)
    80006b30:	00001097          	auipc	ra,0x1
    80006b34:	a48080e7          	jalr	-1464(ra) # 80007578 <__printf>
    80006b38:	0000006f          	j	80006b38 <system_main+0xd4>

0000000080006b3c <cpuid>:
    80006b3c:	ff010113          	addi	sp,sp,-16
    80006b40:	00813423          	sd	s0,8(sp)
    80006b44:	01010413          	addi	s0,sp,16
    80006b48:	00020513          	mv	a0,tp
    80006b4c:	00813403          	ld	s0,8(sp)
    80006b50:	0005051b          	sext.w	a0,a0
    80006b54:	01010113          	addi	sp,sp,16
    80006b58:	00008067          	ret

0000000080006b5c <mycpu>:
    80006b5c:	ff010113          	addi	sp,sp,-16
    80006b60:	00813423          	sd	s0,8(sp)
    80006b64:	01010413          	addi	s0,sp,16
    80006b68:	00020793          	mv	a5,tp
    80006b6c:	00813403          	ld	s0,8(sp)
    80006b70:	0007879b          	sext.w	a5,a5
    80006b74:	00779793          	slli	a5,a5,0x7
    80006b78:	00006517          	auipc	a0,0x6
    80006b7c:	f8850513          	addi	a0,a0,-120 # 8000cb00 <cpus>
    80006b80:	00f50533          	add	a0,a0,a5
    80006b84:	01010113          	addi	sp,sp,16
    80006b88:	00008067          	ret

0000000080006b8c <userinit>:
    80006b8c:	ff010113          	addi	sp,sp,-16
    80006b90:	00813423          	sd	s0,8(sp)
    80006b94:	01010413          	addi	s0,sp,16
    80006b98:	00813403          	ld	s0,8(sp)
    80006b9c:	01010113          	addi	sp,sp,16
    80006ba0:	ffffb317          	auipc	t1,0xffffb
    80006ba4:	c6c30067          	jr	-916(t1) # 8000180c <main>

0000000080006ba8 <either_copyout>:
    80006ba8:	ff010113          	addi	sp,sp,-16
    80006bac:	00813023          	sd	s0,0(sp)
    80006bb0:	00113423          	sd	ra,8(sp)
    80006bb4:	01010413          	addi	s0,sp,16
    80006bb8:	02051663          	bnez	a0,80006be4 <either_copyout+0x3c>
    80006bbc:	00058513          	mv	a0,a1
    80006bc0:	00060593          	mv	a1,a2
    80006bc4:	0006861b          	sext.w	a2,a3
    80006bc8:	00002097          	auipc	ra,0x2
    80006bcc:	c5c080e7          	jalr	-932(ra) # 80008824 <__memmove>
    80006bd0:	00813083          	ld	ra,8(sp)
    80006bd4:	00013403          	ld	s0,0(sp)
    80006bd8:	00000513          	li	a0,0
    80006bdc:	01010113          	addi	sp,sp,16
    80006be0:	00008067          	ret
    80006be4:	00003517          	auipc	a0,0x3
    80006be8:	b7450513          	addi	a0,a0,-1164 # 80009758 <CONSOLE_STATUS+0x748>
    80006bec:	00001097          	auipc	ra,0x1
    80006bf0:	930080e7          	jalr	-1744(ra) # 8000751c <panic>

0000000080006bf4 <either_copyin>:
    80006bf4:	ff010113          	addi	sp,sp,-16
    80006bf8:	00813023          	sd	s0,0(sp)
    80006bfc:	00113423          	sd	ra,8(sp)
    80006c00:	01010413          	addi	s0,sp,16
    80006c04:	02059463          	bnez	a1,80006c2c <either_copyin+0x38>
    80006c08:	00060593          	mv	a1,a2
    80006c0c:	0006861b          	sext.w	a2,a3
    80006c10:	00002097          	auipc	ra,0x2
    80006c14:	c14080e7          	jalr	-1004(ra) # 80008824 <__memmove>
    80006c18:	00813083          	ld	ra,8(sp)
    80006c1c:	00013403          	ld	s0,0(sp)
    80006c20:	00000513          	li	a0,0
    80006c24:	01010113          	addi	sp,sp,16
    80006c28:	00008067          	ret
    80006c2c:	00003517          	auipc	a0,0x3
    80006c30:	b5450513          	addi	a0,a0,-1196 # 80009780 <CONSOLE_STATUS+0x770>
    80006c34:	00001097          	auipc	ra,0x1
    80006c38:	8e8080e7          	jalr	-1816(ra) # 8000751c <panic>

0000000080006c3c <trapinit>:
    80006c3c:	ff010113          	addi	sp,sp,-16
    80006c40:	00813423          	sd	s0,8(sp)
    80006c44:	01010413          	addi	s0,sp,16
    80006c48:	00813403          	ld	s0,8(sp)
    80006c4c:	00003597          	auipc	a1,0x3
    80006c50:	b5c58593          	addi	a1,a1,-1188 # 800097a8 <CONSOLE_STATUS+0x798>
    80006c54:	00006517          	auipc	a0,0x6
    80006c58:	f2c50513          	addi	a0,a0,-212 # 8000cb80 <tickslock>
    80006c5c:	01010113          	addi	sp,sp,16
    80006c60:	00001317          	auipc	t1,0x1
    80006c64:	5c830067          	jr	1480(t1) # 80008228 <initlock>

0000000080006c68 <trapinithart>:
    80006c68:	ff010113          	addi	sp,sp,-16
    80006c6c:	00813423          	sd	s0,8(sp)
    80006c70:	01010413          	addi	s0,sp,16
    80006c74:	00000797          	auipc	a5,0x0
    80006c78:	2fc78793          	addi	a5,a5,764 # 80006f70 <kernelvec>
    80006c7c:	10579073          	csrw	stvec,a5
    80006c80:	00813403          	ld	s0,8(sp)
    80006c84:	01010113          	addi	sp,sp,16
    80006c88:	00008067          	ret

0000000080006c8c <usertrap>:
    80006c8c:	ff010113          	addi	sp,sp,-16
    80006c90:	00813423          	sd	s0,8(sp)
    80006c94:	01010413          	addi	s0,sp,16
    80006c98:	00813403          	ld	s0,8(sp)
    80006c9c:	01010113          	addi	sp,sp,16
    80006ca0:	00008067          	ret

0000000080006ca4 <usertrapret>:
    80006ca4:	ff010113          	addi	sp,sp,-16
    80006ca8:	00813423          	sd	s0,8(sp)
    80006cac:	01010413          	addi	s0,sp,16
    80006cb0:	00813403          	ld	s0,8(sp)
    80006cb4:	01010113          	addi	sp,sp,16
    80006cb8:	00008067          	ret

0000000080006cbc <kerneltrap>:
    80006cbc:	fe010113          	addi	sp,sp,-32
    80006cc0:	00813823          	sd	s0,16(sp)
    80006cc4:	00113c23          	sd	ra,24(sp)
    80006cc8:	00913423          	sd	s1,8(sp)
    80006ccc:	02010413          	addi	s0,sp,32
    80006cd0:	142025f3          	csrr	a1,scause
    80006cd4:	100027f3          	csrr	a5,sstatus
    80006cd8:	0027f793          	andi	a5,a5,2
    80006cdc:	10079c63          	bnez	a5,80006df4 <kerneltrap+0x138>
    80006ce0:	142027f3          	csrr	a5,scause
    80006ce4:	0207ce63          	bltz	a5,80006d20 <kerneltrap+0x64>
    80006ce8:	00003517          	auipc	a0,0x3
    80006cec:	b0850513          	addi	a0,a0,-1272 # 800097f0 <CONSOLE_STATUS+0x7e0>
    80006cf0:	00001097          	auipc	ra,0x1
    80006cf4:	888080e7          	jalr	-1912(ra) # 80007578 <__printf>
    80006cf8:	141025f3          	csrr	a1,sepc
    80006cfc:	14302673          	csrr	a2,stval
    80006d00:	00003517          	auipc	a0,0x3
    80006d04:	b0050513          	addi	a0,a0,-1280 # 80009800 <CONSOLE_STATUS+0x7f0>
    80006d08:	00001097          	auipc	ra,0x1
    80006d0c:	870080e7          	jalr	-1936(ra) # 80007578 <__printf>
    80006d10:	00003517          	auipc	a0,0x3
    80006d14:	b0850513          	addi	a0,a0,-1272 # 80009818 <CONSOLE_STATUS+0x808>
    80006d18:	00001097          	auipc	ra,0x1
    80006d1c:	804080e7          	jalr	-2044(ra) # 8000751c <panic>
    80006d20:	0ff7f713          	andi	a4,a5,255
    80006d24:	00900693          	li	a3,9
    80006d28:	04d70063          	beq	a4,a3,80006d68 <kerneltrap+0xac>
    80006d2c:	fff00713          	li	a4,-1
    80006d30:	03f71713          	slli	a4,a4,0x3f
    80006d34:	00170713          	addi	a4,a4,1
    80006d38:	fae798e3          	bne	a5,a4,80006ce8 <kerneltrap+0x2c>
    80006d3c:	00000097          	auipc	ra,0x0
    80006d40:	e00080e7          	jalr	-512(ra) # 80006b3c <cpuid>
    80006d44:	06050663          	beqz	a0,80006db0 <kerneltrap+0xf4>
    80006d48:	144027f3          	csrr	a5,sip
    80006d4c:	ffd7f793          	andi	a5,a5,-3
    80006d50:	14479073          	csrw	sip,a5
    80006d54:	01813083          	ld	ra,24(sp)
    80006d58:	01013403          	ld	s0,16(sp)
    80006d5c:	00813483          	ld	s1,8(sp)
    80006d60:	02010113          	addi	sp,sp,32
    80006d64:	00008067          	ret
    80006d68:	00000097          	auipc	ra,0x0
    80006d6c:	3cc080e7          	jalr	972(ra) # 80007134 <plic_claim>
    80006d70:	00a00793          	li	a5,10
    80006d74:	00050493          	mv	s1,a0
    80006d78:	06f50863          	beq	a0,a5,80006de8 <kerneltrap+0x12c>
    80006d7c:	fc050ce3          	beqz	a0,80006d54 <kerneltrap+0x98>
    80006d80:	00050593          	mv	a1,a0
    80006d84:	00003517          	auipc	a0,0x3
    80006d88:	a4c50513          	addi	a0,a0,-1460 # 800097d0 <CONSOLE_STATUS+0x7c0>
    80006d8c:	00000097          	auipc	ra,0x0
    80006d90:	7ec080e7          	jalr	2028(ra) # 80007578 <__printf>
    80006d94:	01013403          	ld	s0,16(sp)
    80006d98:	01813083          	ld	ra,24(sp)
    80006d9c:	00048513          	mv	a0,s1
    80006da0:	00813483          	ld	s1,8(sp)
    80006da4:	02010113          	addi	sp,sp,32
    80006da8:	00000317          	auipc	t1,0x0
    80006dac:	3c430067          	jr	964(t1) # 8000716c <plic_complete>
    80006db0:	00006517          	auipc	a0,0x6
    80006db4:	dd050513          	addi	a0,a0,-560 # 8000cb80 <tickslock>
    80006db8:	00001097          	auipc	ra,0x1
    80006dbc:	494080e7          	jalr	1172(ra) # 8000824c <acquire>
    80006dc0:	00005717          	auipc	a4,0x5
    80006dc4:	c4470713          	addi	a4,a4,-956 # 8000ba04 <ticks>
    80006dc8:	00072783          	lw	a5,0(a4)
    80006dcc:	00006517          	auipc	a0,0x6
    80006dd0:	db450513          	addi	a0,a0,-588 # 8000cb80 <tickslock>
    80006dd4:	0017879b          	addiw	a5,a5,1
    80006dd8:	00f72023          	sw	a5,0(a4)
    80006ddc:	00001097          	auipc	ra,0x1
    80006de0:	53c080e7          	jalr	1340(ra) # 80008318 <release>
    80006de4:	f65ff06f          	j	80006d48 <kerneltrap+0x8c>
    80006de8:	00001097          	auipc	ra,0x1
    80006dec:	098080e7          	jalr	152(ra) # 80007e80 <uartintr>
    80006df0:	fa5ff06f          	j	80006d94 <kerneltrap+0xd8>
    80006df4:	00003517          	auipc	a0,0x3
    80006df8:	9bc50513          	addi	a0,a0,-1604 # 800097b0 <CONSOLE_STATUS+0x7a0>
    80006dfc:	00000097          	auipc	ra,0x0
    80006e00:	720080e7          	jalr	1824(ra) # 8000751c <panic>

0000000080006e04 <clockintr>:
    80006e04:	fe010113          	addi	sp,sp,-32
    80006e08:	00813823          	sd	s0,16(sp)
    80006e0c:	00913423          	sd	s1,8(sp)
    80006e10:	00113c23          	sd	ra,24(sp)
    80006e14:	02010413          	addi	s0,sp,32
    80006e18:	00006497          	auipc	s1,0x6
    80006e1c:	d6848493          	addi	s1,s1,-664 # 8000cb80 <tickslock>
    80006e20:	00048513          	mv	a0,s1
    80006e24:	00001097          	auipc	ra,0x1
    80006e28:	428080e7          	jalr	1064(ra) # 8000824c <acquire>
    80006e2c:	00005717          	auipc	a4,0x5
    80006e30:	bd870713          	addi	a4,a4,-1064 # 8000ba04 <ticks>
    80006e34:	00072783          	lw	a5,0(a4)
    80006e38:	01013403          	ld	s0,16(sp)
    80006e3c:	01813083          	ld	ra,24(sp)
    80006e40:	00048513          	mv	a0,s1
    80006e44:	0017879b          	addiw	a5,a5,1
    80006e48:	00813483          	ld	s1,8(sp)
    80006e4c:	00f72023          	sw	a5,0(a4)
    80006e50:	02010113          	addi	sp,sp,32
    80006e54:	00001317          	auipc	t1,0x1
    80006e58:	4c430067          	jr	1220(t1) # 80008318 <release>

0000000080006e5c <devintr>:
    80006e5c:	142027f3          	csrr	a5,scause
    80006e60:	00000513          	li	a0,0
    80006e64:	0007c463          	bltz	a5,80006e6c <devintr+0x10>
    80006e68:	00008067          	ret
    80006e6c:	fe010113          	addi	sp,sp,-32
    80006e70:	00813823          	sd	s0,16(sp)
    80006e74:	00113c23          	sd	ra,24(sp)
    80006e78:	00913423          	sd	s1,8(sp)
    80006e7c:	02010413          	addi	s0,sp,32
    80006e80:	0ff7f713          	andi	a4,a5,255
    80006e84:	00900693          	li	a3,9
    80006e88:	04d70c63          	beq	a4,a3,80006ee0 <devintr+0x84>
    80006e8c:	fff00713          	li	a4,-1
    80006e90:	03f71713          	slli	a4,a4,0x3f
    80006e94:	00170713          	addi	a4,a4,1
    80006e98:	00e78c63          	beq	a5,a4,80006eb0 <devintr+0x54>
    80006e9c:	01813083          	ld	ra,24(sp)
    80006ea0:	01013403          	ld	s0,16(sp)
    80006ea4:	00813483          	ld	s1,8(sp)
    80006ea8:	02010113          	addi	sp,sp,32
    80006eac:	00008067          	ret
    80006eb0:	00000097          	auipc	ra,0x0
    80006eb4:	c8c080e7          	jalr	-884(ra) # 80006b3c <cpuid>
    80006eb8:	06050663          	beqz	a0,80006f24 <devintr+0xc8>
    80006ebc:	144027f3          	csrr	a5,sip
    80006ec0:	ffd7f793          	andi	a5,a5,-3
    80006ec4:	14479073          	csrw	sip,a5
    80006ec8:	01813083          	ld	ra,24(sp)
    80006ecc:	01013403          	ld	s0,16(sp)
    80006ed0:	00813483          	ld	s1,8(sp)
    80006ed4:	00200513          	li	a0,2
    80006ed8:	02010113          	addi	sp,sp,32
    80006edc:	00008067          	ret
    80006ee0:	00000097          	auipc	ra,0x0
    80006ee4:	254080e7          	jalr	596(ra) # 80007134 <plic_claim>
    80006ee8:	00a00793          	li	a5,10
    80006eec:	00050493          	mv	s1,a0
    80006ef0:	06f50663          	beq	a0,a5,80006f5c <devintr+0x100>
    80006ef4:	00100513          	li	a0,1
    80006ef8:	fa0482e3          	beqz	s1,80006e9c <devintr+0x40>
    80006efc:	00048593          	mv	a1,s1
    80006f00:	00003517          	auipc	a0,0x3
    80006f04:	8d050513          	addi	a0,a0,-1840 # 800097d0 <CONSOLE_STATUS+0x7c0>
    80006f08:	00000097          	auipc	ra,0x0
    80006f0c:	670080e7          	jalr	1648(ra) # 80007578 <__printf>
    80006f10:	00048513          	mv	a0,s1
    80006f14:	00000097          	auipc	ra,0x0
    80006f18:	258080e7          	jalr	600(ra) # 8000716c <plic_complete>
    80006f1c:	00100513          	li	a0,1
    80006f20:	f7dff06f          	j	80006e9c <devintr+0x40>
    80006f24:	00006517          	auipc	a0,0x6
    80006f28:	c5c50513          	addi	a0,a0,-932 # 8000cb80 <tickslock>
    80006f2c:	00001097          	auipc	ra,0x1
    80006f30:	320080e7          	jalr	800(ra) # 8000824c <acquire>
    80006f34:	00005717          	auipc	a4,0x5
    80006f38:	ad070713          	addi	a4,a4,-1328 # 8000ba04 <ticks>
    80006f3c:	00072783          	lw	a5,0(a4)
    80006f40:	00006517          	auipc	a0,0x6
    80006f44:	c4050513          	addi	a0,a0,-960 # 8000cb80 <tickslock>
    80006f48:	0017879b          	addiw	a5,a5,1
    80006f4c:	00f72023          	sw	a5,0(a4)
    80006f50:	00001097          	auipc	ra,0x1
    80006f54:	3c8080e7          	jalr	968(ra) # 80008318 <release>
    80006f58:	f65ff06f          	j	80006ebc <devintr+0x60>
    80006f5c:	00001097          	auipc	ra,0x1
    80006f60:	f24080e7          	jalr	-220(ra) # 80007e80 <uartintr>
    80006f64:	fadff06f          	j	80006f10 <devintr+0xb4>
	...

0000000080006f70 <kernelvec>:
    80006f70:	f0010113          	addi	sp,sp,-256
    80006f74:	00113023          	sd	ra,0(sp)
    80006f78:	00213423          	sd	sp,8(sp)
    80006f7c:	00313823          	sd	gp,16(sp)
    80006f80:	00413c23          	sd	tp,24(sp)
    80006f84:	02513023          	sd	t0,32(sp)
    80006f88:	02613423          	sd	t1,40(sp)
    80006f8c:	02713823          	sd	t2,48(sp)
    80006f90:	02813c23          	sd	s0,56(sp)
    80006f94:	04913023          	sd	s1,64(sp)
    80006f98:	04a13423          	sd	a0,72(sp)
    80006f9c:	04b13823          	sd	a1,80(sp)
    80006fa0:	04c13c23          	sd	a2,88(sp)
    80006fa4:	06d13023          	sd	a3,96(sp)
    80006fa8:	06e13423          	sd	a4,104(sp)
    80006fac:	06f13823          	sd	a5,112(sp)
    80006fb0:	07013c23          	sd	a6,120(sp)
    80006fb4:	09113023          	sd	a7,128(sp)
    80006fb8:	09213423          	sd	s2,136(sp)
    80006fbc:	09313823          	sd	s3,144(sp)
    80006fc0:	09413c23          	sd	s4,152(sp)
    80006fc4:	0b513023          	sd	s5,160(sp)
    80006fc8:	0b613423          	sd	s6,168(sp)
    80006fcc:	0b713823          	sd	s7,176(sp)
    80006fd0:	0b813c23          	sd	s8,184(sp)
    80006fd4:	0d913023          	sd	s9,192(sp)
    80006fd8:	0da13423          	sd	s10,200(sp)
    80006fdc:	0db13823          	sd	s11,208(sp)
    80006fe0:	0dc13c23          	sd	t3,216(sp)
    80006fe4:	0fd13023          	sd	t4,224(sp)
    80006fe8:	0fe13423          	sd	t5,232(sp)
    80006fec:	0ff13823          	sd	t6,240(sp)
    80006ff0:	ccdff0ef          	jal	ra,80006cbc <kerneltrap>
    80006ff4:	00013083          	ld	ra,0(sp)
    80006ff8:	00813103          	ld	sp,8(sp)
    80006ffc:	01013183          	ld	gp,16(sp)
    80007000:	02013283          	ld	t0,32(sp)
    80007004:	02813303          	ld	t1,40(sp)
    80007008:	03013383          	ld	t2,48(sp)
    8000700c:	03813403          	ld	s0,56(sp)
    80007010:	04013483          	ld	s1,64(sp)
    80007014:	04813503          	ld	a0,72(sp)
    80007018:	05013583          	ld	a1,80(sp)
    8000701c:	05813603          	ld	a2,88(sp)
    80007020:	06013683          	ld	a3,96(sp)
    80007024:	06813703          	ld	a4,104(sp)
    80007028:	07013783          	ld	a5,112(sp)
    8000702c:	07813803          	ld	a6,120(sp)
    80007030:	08013883          	ld	a7,128(sp)
    80007034:	08813903          	ld	s2,136(sp)
    80007038:	09013983          	ld	s3,144(sp)
    8000703c:	09813a03          	ld	s4,152(sp)
    80007040:	0a013a83          	ld	s5,160(sp)
    80007044:	0a813b03          	ld	s6,168(sp)
    80007048:	0b013b83          	ld	s7,176(sp)
    8000704c:	0b813c03          	ld	s8,184(sp)
    80007050:	0c013c83          	ld	s9,192(sp)
    80007054:	0c813d03          	ld	s10,200(sp)
    80007058:	0d013d83          	ld	s11,208(sp)
    8000705c:	0d813e03          	ld	t3,216(sp)
    80007060:	0e013e83          	ld	t4,224(sp)
    80007064:	0e813f03          	ld	t5,232(sp)
    80007068:	0f013f83          	ld	t6,240(sp)
    8000706c:	10010113          	addi	sp,sp,256
    80007070:	10200073          	sret
    80007074:	00000013          	nop
    80007078:	00000013          	nop
    8000707c:	00000013          	nop

0000000080007080 <timervec>:
    80007080:	34051573          	csrrw	a0,mscratch,a0
    80007084:	00b53023          	sd	a1,0(a0)
    80007088:	00c53423          	sd	a2,8(a0)
    8000708c:	00d53823          	sd	a3,16(a0)
    80007090:	01853583          	ld	a1,24(a0)
    80007094:	02053603          	ld	a2,32(a0)
    80007098:	0005b683          	ld	a3,0(a1)
    8000709c:	00c686b3          	add	a3,a3,a2
    800070a0:	00d5b023          	sd	a3,0(a1)
    800070a4:	00200593          	li	a1,2
    800070a8:	14459073          	csrw	sip,a1
    800070ac:	01053683          	ld	a3,16(a0)
    800070b0:	00853603          	ld	a2,8(a0)
    800070b4:	00053583          	ld	a1,0(a0)
    800070b8:	34051573          	csrrw	a0,mscratch,a0
    800070bc:	30200073          	mret

00000000800070c0 <plicinit>:
    800070c0:	ff010113          	addi	sp,sp,-16
    800070c4:	00813423          	sd	s0,8(sp)
    800070c8:	01010413          	addi	s0,sp,16
    800070cc:	00813403          	ld	s0,8(sp)
    800070d0:	0c0007b7          	lui	a5,0xc000
    800070d4:	00100713          	li	a4,1
    800070d8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800070dc:	00e7a223          	sw	a4,4(a5)
    800070e0:	01010113          	addi	sp,sp,16
    800070e4:	00008067          	ret

00000000800070e8 <plicinithart>:
    800070e8:	ff010113          	addi	sp,sp,-16
    800070ec:	00813023          	sd	s0,0(sp)
    800070f0:	00113423          	sd	ra,8(sp)
    800070f4:	01010413          	addi	s0,sp,16
    800070f8:	00000097          	auipc	ra,0x0
    800070fc:	a44080e7          	jalr	-1468(ra) # 80006b3c <cpuid>
    80007100:	0085171b          	slliw	a4,a0,0x8
    80007104:	0c0027b7          	lui	a5,0xc002
    80007108:	00e787b3          	add	a5,a5,a4
    8000710c:	40200713          	li	a4,1026
    80007110:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80007114:	00813083          	ld	ra,8(sp)
    80007118:	00013403          	ld	s0,0(sp)
    8000711c:	00d5151b          	slliw	a0,a0,0xd
    80007120:	0c2017b7          	lui	a5,0xc201
    80007124:	00a78533          	add	a0,a5,a0
    80007128:	00052023          	sw	zero,0(a0)
    8000712c:	01010113          	addi	sp,sp,16
    80007130:	00008067          	ret

0000000080007134 <plic_claim>:
    80007134:	ff010113          	addi	sp,sp,-16
    80007138:	00813023          	sd	s0,0(sp)
    8000713c:	00113423          	sd	ra,8(sp)
    80007140:	01010413          	addi	s0,sp,16
    80007144:	00000097          	auipc	ra,0x0
    80007148:	9f8080e7          	jalr	-1544(ra) # 80006b3c <cpuid>
    8000714c:	00813083          	ld	ra,8(sp)
    80007150:	00013403          	ld	s0,0(sp)
    80007154:	00d5151b          	slliw	a0,a0,0xd
    80007158:	0c2017b7          	lui	a5,0xc201
    8000715c:	00a78533          	add	a0,a5,a0
    80007160:	00452503          	lw	a0,4(a0)
    80007164:	01010113          	addi	sp,sp,16
    80007168:	00008067          	ret

000000008000716c <plic_complete>:
    8000716c:	fe010113          	addi	sp,sp,-32
    80007170:	00813823          	sd	s0,16(sp)
    80007174:	00913423          	sd	s1,8(sp)
    80007178:	00113c23          	sd	ra,24(sp)
    8000717c:	02010413          	addi	s0,sp,32
    80007180:	00050493          	mv	s1,a0
    80007184:	00000097          	auipc	ra,0x0
    80007188:	9b8080e7          	jalr	-1608(ra) # 80006b3c <cpuid>
    8000718c:	01813083          	ld	ra,24(sp)
    80007190:	01013403          	ld	s0,16(sp)
    80007194:	00d5179b          	slliw	a5,a0,0xd
    80007198:	0c201737          	lui	a4,0xc201
    8000719c:	00f707b3          	add	a5,a4,a5
    800071a0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800071a4:	00813483          	ld	s1,8(sp)
    800071a8:	02010113          	addi	sp,sp,32
    800071ac:	00008067          	ret

00000000800071b0 <consolewrite>:
    800071b0:	fb010113          	addi	sp,sp,-80
    800071b4:	04813023          	sd	s0,64(sp)
    800071b8:	04113423          	sd	ra,72(sp)
    800071bc:	02913c23          	sd	s1,56(sp)
    800071c0:	03213823          	sd	s2,48(sp)
    800071c4:	03313423          	sd	s3,40(sp)
    800071c8:	03413023          	sd	s4,32(sp)
    800071cc:	01513c23          	sd	s5,24(sp)
    800071d0:	05010413          	addi	s0,sp,80
    800071d4:	06c05c63          	blez	a2,8000724c <consolewrite+0x9c>
    800071d8:	00060993          	mv	s3,a2
    800071dc:	00050a13          	mv	s4,a0
    800071e0:	00058493          	mv	s1,a1
    800071e4:	00000913          	li	s2,0
    800071e8:	fff00a93          	li	s5,-1
    800071ec:	01c0006f          	j	80007208 <consolewrite+0x58>
    800071f0:	fbf44503          	lbu	a0,-65(s0)
    800071f4:	0019091b          	addiw	s2,s2,1
    800071f8:	00148493          	addi	s1,s1,1
    800071fc:	00001097          	auipc	ra,0x1
    80007200:	a9c080e7          	jalr	-1380(ra) # 80007c98 <uartputc>
    80007204:	03298063          	beq	s3,s2,80007224 <consolewrite+0x74>
    80007208:	00048613          	mv	a2,s1
    8000720c:	00100693          	li	a3,1
    80007210:	000a0593          	mv	a1,s4
    80007214:	fbf40513          	addi	a0,s0,-65
    80007218:	00000097          	auipc	ra,0x0
    8000721c:	9dc080e7          	jalr	-1572(ra) # 80006bf4 <either_copyin>
    80007220:	fd5518e3          	bne	a0,s5,800071f0 <consolewrite+0x40>
    80007224:	04813083          	ld	ra,72(sp)
    80007228:	04013403          	ld	s0,64(sp)
    8000722c:	03813483          	ld	s1,56(sp)
    80007230:	02813983          	ld	s3,40(sp)
    80007234:	02013a03          	ld	s4,32(sp)
    80007238:	01813a83          	ld	s5,24(sp)
    8000723c:	00090513          	mv	a0,s2
    80007240:	03013903          	ld	s2,48(sp)
    80007244:	05010113          	addi	sp,sp,80
    80007248:	00008067          	ret
    8000724c:	00000913          	li	s2,0
    80007250:	fd5ff06f          	j	80007224 <consolewrite+0x74>

0000000080007254 <consoleread>:
    80007254:	f9010113          	addi	sp,sp,-112
    80007258:	06813023          	sd	s0,96(sp)
    8000725c:	04913c23          	sd	s1,88(sp)
    80007260:	05213823          	sd	s2,80(sp)
    80007264:	05313423          	sd	s3,72(sp)
    80007268:	05413023          	sd	s4,64(sp)
    8000726c:	03513c23          	sd	s5,56(sp)
    80007270:	03613823          	sd	s6,48(sp)
    80007274:	03713423          	sd	s7,40(sp)
    80007278:	03813023          	sd	s8,32(sp)
    8000727c:	06113423          	sd	ra,104(sp)
    80007280:	01913c23          	sd	s9,24(sp)
    80007284:	07010413          	addi	s0,sp,112
    80007288:	00060b93          	mv	s7,a2
    8000728c:	00050913          	mv	s2,a0
    80007290:	00058c13          	mv	s8,a1
    80007294:	00060b1b          	sext.w	s6,a2
    80007298:	00006497          	auipc	s1,0x6
    8000729c:	91048493          	addi	s1,s1,-1776 # 8000cba8 <cons>
    800072a0:	00400993          	li	s3,4
    800072a4:	fff00a13          	li	s4,-1
    800072a8:	00a00a93          	li	s5,10
    800072ac:	05705e63          	blez	s7,80007308 <consoleread+0xb4>
    800072b0:	09c4a703          	lw	a4,156(s1)
    800072b4:	0984a783          	lw	a5,152(s1)
    800072b8:	0007071b          	sext.w	a4,a4
    800072bc:	08e78463          	beq	a5,a4,80007344 <consoleread+0xf0>
    800072c0:	07f7f713          	andi	a4,a5,127
    800072c4:	00e48733          	add	a4,s1,a4
    800072c8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800072cc:	0017869b          	addiw	a3,a5,1
    800072d0:	08d4ac23          	sw	a3,152(s1)
    800072d4:	00070c9b          	sext.w	s9,a4
    800072d8:	0b370663          	beq	a4,s3,80007384 <consoleread+0x130>
    800072dc:	00100693          	li	a3,1
    800072e0:	f9f40613          	addi	a2,s0,-97
    800072e4:	000c0593          	mv	a1,s8
    800072e8:	00090513          	mv	a0,s2
    800072ec:	f8e40fa3          	sb	a4,-97(s0)
    800072f0:	00000097          	auipc	ra,0x0
    800072f4:	8b8080e7          	jalr	-1864(ra) # 80006ba8 <either_copyout>
    800072f8:	01450863          	beq	a0,s4,80007308 <consoleread+0xb4>
    800072fc:	001c0c13          	addi	s8,s8,1
    80007300:	fffb8b9b          	addiw	s7,s7,-1
    80007304:	fb5c94e3          	bne	s9,s5,800072ac <consoleread+0x58>
    80007308:	000b851b          	sext.w	a0,s7
    8000730c:	06813083          	ld	ra,104(sp)
    80007310:	06013403          	ld	s0,96(sp)
    80007314:	05813483          	ld	s1,88(sp)
    80007318:	05013903          	ld	s2,80(sp)
    8000731c:	04813983          	ld	s3,72(sp)
    80007320:	04013a03          	ld	s4,64(sp)
    80007324:	03813a83          	ld	s5,56(sp)
    80007328:	02813b83          	ld	s7,40(sp)
    8000732c:	02013c03          	ld	s8,32(sp)
    80007330:	01813c83          	ld	s9,24(sp)
    80007334:	40ab053b          	subw	a0,s6,a0
    80007338:	03013b03          	ld	s6,48(sp)
    8000733c:	07010113          	addi	sp,sp,112
    80007340:	00008067          	ret
    80007344:	00001097          	auipc	ra,0x1
    80007348:	1d8080e7          	jalr	472(ra) # 8000851c <push_on>
    8000734c:	0984a703          	lw	a4,152(s1)
    80007350:	09c4a783          	lw	a5,156(s1)
    80007354:	0007879b          	sext.w	a5,a5
    80007358:	fef70ce3          	beq	a4,a5,80007350 <consoleread+0xfc>
    8000735c:	00001097          	auipc	ra,0x1
    80007360:	234080e7          	jalr	564(ra) # 80008590 <pop_on>
    80007364:	0984a783          	lw	a5,152(s1)
    80007368:	07f7f713          	andi	a4,a5,127
    8000736c:	00e48733          	add	a4,s1,a4
    80007370:	01874703          	lbu	a4,24(a4)
    80007374:	0017869b          	addiw	a3,a5,1
    80007378:	08d4ac23          	sw	a3,152(s1)
    8000737c:	00070c9b          	sext.w	s9,a4
    80007380:	f5371ee3          	bne	a4,s3,800072dc <consoleread+0x88>
    80007384:	000b851b          	sext.w	a0,s7
    80007388:	f96bf2e3          	bgeu	s7,s6,8000730c <consoleread+0xb8>
    8000738c:	08f4ac23          	sw	a5,152(s1)
    80007390:	f7dff06f          	j	8000730c <consoleread+0xb8>

0000000080007394 <consputc>:
    80007394:	10000793          	li	a5,256
    80007398:	00f50663          	beq	a0,a5,800073a4 <consputc+0x10>
    8000739c:	00001317          	auipc	t1,0x1
    800073a0:	9f430067          	jr	-1548(t1) # 80007d90 <uartputc_sync>
    800073a4:	ff010113          	addi	sp,sp,-16
    800073a8:	00113423          	sd	ra,8(sp)
    800073ac:	00813023          	sd	s0,0(sp)
    800073b0:	01010413          	addi	s0,sp,16
    800073b4:	00800513          	li	a0,8
    800073b8:	00001097          	auipc	ra,0x1
    800073bc:	9d8080e7          	jalr	-1576(ra) # 80007d90 <uartputc_sync>
    800073c0:	02000513          	li	a0,32
    800073c4:	00001097          	auipc	ra,0x1
    800073c8:	9cc080e7          	jalr	-1588(ra) # 80007d90 <uartputc_sync>
    800073cc:	00013403          	ld	s0,0(sp)
    800073d0:	00813083          	ld	ra,8(sp)
    800073d4:	00800513          	li	a0,8
    800073d8:	01010113          	addi	sp,sp,16
    800073dc:	00001317          	auipc	t1,0x1
    800073e0:	9b430067          	jr	-1612(t1) # 80007d90 <uartputc_sync>

00000000800073e4 <consoleintr>:
    800073e4:	fe010113          	addi	sp,sp,-32
    800073e8:	00813823          	sd	s0,16(sp)
    800073ec:	00913423          	sd	s1,8(sp)
    800073f0:	01213023          	sd	s2,0(sp)
    800073f4:	00113c23          	sd	ra,24(sp)
    800073f8:	02010413          	addi	s0,sp,32
    800073fc:	00005917          	auipc	s2,0x5
    80007400:	7ac90913          	addi	s2,s2,1964 # 8000cba8 <cons>
    80007404:	00050493          	mv	s1,a0
    80007408:	00090513          	mv	a0,s2
    8000740c:	00001097          	auipc	ra,0x1
    80007410:	e40080e7          	jalr	-448(ra) # 8000824c <acquire>
    80007414:	02048c63          	beqz	s1,8000744c <consoleintr+0x68>
    80007418:	0a092783          	lw	a5,160(s2)
    8000741c:	09892703          	lw	a4,152(s2)
    80007420:	07f00693          	li	a3,127
    80007424:	40e7873b          	subw	a4,a5,a4
    80007428:	02e6e263          	bltu	a3,a4,8000744c <consoleintr+0x68>
    8000742c:	00d00713          	li	a4,13
    80007430:	04e48063          	beq	s1,a4,80007470 <consoleintr+0x8c>
    80007434:	07f7f713          	andi	a4,a5,127
    80007438:	00e90733          	add	a4,s2,a4
    8000743c:	0017879b          	addiw	a5,a5,1
    80007440:	0af92023          	sw	a5,160(s2)
    80007444:	00970c23          	sb	s1,24(a4)
    80007448:	08f92e23          	sw	a5,156(s2)
    8000744c:	01013403          	ld	s0,16(sp)
    80007450:	01813083          	ld	ra,24(sp)
    80007454:	00813483          	ld	s1,8(sp)
    80007458:	00013903          	ld	s2,0(sp)
    8000745c:	00005517          	auipc	a0,0x5
    80007460:	74c50513          	addi	a0,a0,1868 # 8000cba8 <cons>
    80007464:	02010113          	addi	sp,sp,32
    80007468:	00001317          	auipc	t1,0x1
    8000746c:	eb030067          	jr	-336(t1) # 80008318 <release>
    80007470:	00a00493          	li	s1,10
    80007474:	fc1ff06f          	j	80007434 <consoleintr+0x50>

0000000080007478 <consoleinit>:
    80007478:	fe010113          	addi	sp,sp,-32
    8000747c:	00113c23          	sd	ra,24(sp)
    80007480:	00813823          	sd	s0,16(sp)
    80007484:	00913423          	sd	s1,8(sp)
    80007488:	02010413          	addi	s0,sp,32
    8000748c:	00005497          	auipc	s1,0x5
    80007490:	71c48493          	addi	s1,s1,1820 # 8000cba8 <cons>
    80007494:	00048513          	mv	a0,s1
    80007498:	00002597          	auipc	a1,0x2
    8000749c:	39058593          	addi	a1,a1,912 # 80009828 <CONSOLE_STATUS+0x818>
    800074a0:	00001097          	auipc	ra,0x1
    800074a4:	d88080e7          	jalr	-632(ra) # 80008228 <initlock>
    800074a8:	00000097          	auipc	ra,0x0
    800074ac:	7ac080e7          	jalr	1964(ra) # 80007c54 <uartinit>
    800074b0:	01813083          	ld	ra,24(sp)
    800074b4:	01013403          	ld	s0,16(sp)
    800074b8:	00000797          	auipc	a5,0x0
    800074bc:	d9c78793          	addi	a5,a5,-612 # 80007254 <consoleread>
    800074c0:	0af4bc23          	sd	a5,184(s1)
    800074c4:	00000797          	auipc	a5,0x0
    800074c8:	cec78793          	addi	a5,a5,-788 # 800071b0 <consolewrite>
    800074cc:	0cf4b023          	sd	a5,192(s1)
    800074d0:	00813483          	ld	s1,8(sp)
    800074d4:	02010113          	addi	sp,sp,32
    800074d8:	00008067          	ret

00000000800074dc <console_read>:
    800074dc:	ff010113          	addi	sp,sp,-16
    800074e0:	00813423          	sd	s0,8(sp)
    800074e4:	01010413          	addi	s0,sp,16
    800074e8:	00813403          	ld	s0,8(sp)
    800074ec:	00005317          	auipc	t1,0x5
    800074f0:	77433303          	ld	t1,1908(t1) # 8000cc60 <devsw+0x10>
    800074f4:	01010113          	addi	sp,sp,16
    800074f8:	00030067          	jr	t1

00000000800074fc <console_write>:
    800074fc:	ff010113          	addi	sp,sp,-16
    80007500:	00813423          	sd	s0,8(sp)
    80007504:	01010413          	addi	s0,sp,16
    80007508:	00813403          	ld	s0,8(sp)
    8000750c:	00005317          	auipc	t1,0x5
    80007510:	75c33303          	ld	t1,1884(t1) # 8000cc68 <devsw+0x18>
    80007514:	01010113          	addi	sp,sp,16
    80007518:	00030067          	jr	t1

000000008000751c <panic>:
    8000751c:	fe010113          	addi	sp,sp,-32
    80007520:	00113c23          	sd	ra,24(sp)
    80007524:	00813823          	sd	s0,16(sp)
    80007528:	00913423          	sd	s1,8(sp)
    8000752c:	02010413          	addi	s0,sp,32
    80007530:	00050493          	mv	s1,a0
    80007534:	00002517          	auipc	a0,0x2
    80007538:	2fc50513          	addi	a0,a0,764 # 80009830 <CONSOLE_STATUS+0x820>
    8000753c:	00005797          	auipc	a5,0x5
    80007540:	7c07a623          	sw	zero,1996(a5) # 8000cd08 <pr+0x18>
    80007544:	00000097          	auipc	ra,0x0
    80007548:	034080e7          	jalr	52(ra) # 80007578 <__printf>
    8000754c:	00048513          	mv	a0,s1
    80007550:	00000097          	auipc	ra,0x0
    80007554:	028080e7          	jalr	40(ra) # 80007578 <__printf>
    80007558:	00002517          	auipc	a0,0x2
    8000755c:	06050513          	addi	a0,a0,96 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80007560:	00000097          	auipc	ra,0x0
    80007564:	018080e7          	jalr	24(ra) # 80007578 <__printf>
    80007568:	00100793          	li	a5,1
    8000756c:	00004717          	auipc	a4,0x4
    80007570:	48f72e23          	sw	a5,1180(a4) # 8000ba08 <panicked>
    80007574:	0000006f          	j	80007574 <panic+0x58>

0000000080007578 <__printf>:
    80007578:	f3010113          	addi	sp,sp,-208
    8000757c:	08813023          	sd	s0,128(sp)
    80007580:	07313423          	sd	s3,104(sp)
    80007584:	09010413          	addi	s0,sp,144
    80007588:	05813023          	sd	s8,64(sp)
    8000758c:	08113423          	sd	ra,136(sp)
    80007590:	06913c23          	sd	s1,120(sp)
    80007594:	07213823          	sd	s2,112(sp)
    80007598:	07413023          	sd	s4,96(sp)
    8000759c:	05513c23          	sd	s5,88(sp)
    800075a0:	05613823          	sd	s6,80(sp)
    800075a4:	05713423          	sd	s7,72(sp)
    800075a8:	03913c23          	sd	s9,56(sp)
    800075ac:	03a13823          	sd	s10,48(sp)
    800075b0:	03b13423          	sd	s11,40(sp)
    800075b4:	00005317          	auipc	t1,0x5
    800075b8:	73c30313          	addi	t1,t1,1852 # 8000ccf0 <pr>
    800075bc:	01832c03          	lw	s8,24(t1)
    800075c0:	00b43423          	sd	a1,8(s0)
    800075c4:	00c43823          	sd	a2,16(s0)
    800075c8:	00d43c23          	sd	a3,24(s0)
    800075cc:	02e43023          	sd	a4,32(s0)
    800075d0:	02f43423          	sd	a5,40(s0)
    800075d4:	03043823          	sd	a6,48(s0)
    800075d8:	03143c23          	sd	a7,56(s0)
    800075dc:	00050993          	mv	s3,a0
    800075e0:	4a0c1663          	bnez	s8,80007a8c <__printf+0x514>
    800075e4:	60098c63          	beqz	s3,80007bfc <__printf+0x684>
    800075e8:	0009c503          	lbu	a0,0(s3)
    800075ec:	00840793          	addi	a5,s0,8
    800075f0:	f6f43c23          	sd	a5,-136(s0)
    800075f4:	00000493          	li	s1,0
    800075f8:	22050063          	beqz	a0,80007818 <__printf+0x2a0>
    800075fc:	00002a37          	lui	s4,0x2
    80007600:	00018ab7          	lui	s5,0x18
    80007604:	000f4b37          	lui	s6,0xf4
    80007608:	00989bb7          	lui	s7,0x989
    8000760c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80007610:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80007614:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80007618:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000761c:	00148c9b          	addiw	s9,s1,1
    80007620:	02500793          	li	a5,37
    80007624:	01998933          	add	s2,s3,s9
    80007628:	38f51263          	bne	a0,a5,800079ac <__printf+0x434>
    8000762c:	00094783          	lbu	a5,0(s2)
    80007630:	00078c9b          	sext.w	s9,a5
    80007634:	1e078263          	beqz	a5,80007818 <__printf+0x2a0>
    80007638:	0024849b          	addiw	s1,s1,2
    8000763c:	07000713          	li	a4,112
    80007640:	00998933          	add	s2,s3,s1
    80007644:	38e78a63          	beq	a5,a4,800079d8 <__printf+0x460>
    80007648:	20f76863          	bltu	a4,a5,80007858 <__printf+0x2e0>
    8000764c:	42a78863          	beq	a5,a0,80007a7c <__printf+0x504>
    80007650:	06400713          	li	a4,100
    80007654:	40e79663          	bne	a5,a4,80007a60 <__printf+0x4e8>
    80007658:	f7843783          	ld	a5,-136(s0)
    8000765c:	0007a603          	lw	a2,0(a5)
    80007660:	00878793          	addi	a5,a5,8
    80007664:	f6f43c23          	sd	a5,-136(s0)
    80007668:	42064a63          	bltz	a2,80007a9c <__printf+0x524>
    8000766c:	00a00713          	li	a4,10
    80007670:	02e677bb          	remuw	a5,a2,a4
    80007674:	00002d97          	auipc	s11,0x2
    80007678:	1e4d8d93          	addi	s11,s11,484 # 80009858 <digits>
    8000767c:	00900593          	li	a1,9
    80007680:	0006051b          	sext.w	a0,a2
    80007684:	00000c93          	li	s9,0
    80007688:	02079793          	slli	a5,a5,0x20
    8000768c:	0207d793          	srli	a5,a5,0x20
    80007690:	00fd87b3          	add	a5,s11,a5
    80007694:	0007c783          	lbu	a5,0(a5)
    80007698:	02e656bb          	divuw	a3,a2,a4
    8000769c:	f8f40023          	sb	a5,-128(s0)
    800076a0:	14c5d863          	bge	a1,a2,800077f0 <__printf+0x278>
    800076a4:	06300593          	li	a1,99
    800076a8:	00100c93          	li	s9,1
    800076ac:	02e6f7bb          	remuw	a5,a3,a4
    800076b0:	02079793          	slli	a5,a5,0x20
    800076b4:	0207d793          	srli	a5,a5,0x20
    800076b8:	00fd87b3          	add	a5,s11,a5
    800076bc:	0007c783          	lbu	a5,0(a5)
    800076c0:	02e6d73b          	divuw	a4,a3,a4
    800076c4:	f8f400a3          	sb	a5,-127(s0)
    800076c8:	12a5f463          	bgeu	a1,a0,800077f0 <__printf+0x278>
    800076cc:	00a00693          	li	a3,10
    800076d0:	00900593          	li	a1,9
    800076d4:	02d777bb          	remuw	a5,a4,a3
    800076d8:	02079793          	slli	a5,a5,0x20
    800076dc:	0207d793          	srli	a5,a5,0x20
    800076e0:	00fd87b3          	add	a5,s11,a5
    800076e4:	0007c503          	lbu	a0,0(a5)
    800076e8:	02d757bb          	divuw	a5,a4,a3
    800076ec:	f8a40123          	sb	a0,-126(s0)
    800076f0:	48e5f263          	bgeu	a1,a4,80007b74 <__printf+0x5fc>
    800076f4:	06300513          	li	a0,99
    800076f8:	02d7f5bb          	remuw	a1,a5,a3
    800076fc:	02059593          	slli	a1,a1,0x20
    80007700:	0205d593          	srli	a1,a1,0x20
    80007704:	00bd85b3          	add	a1,s11,a1
    80007708:	0005c583          	lbu	a1,0(a1)
    8000770c:	02d7d7bb          	divuw	a5,a5,a3
    80007710:	f8b401a3          	sb	a1,-125(s0)
    80007714:	48e57263          	bgeu	a0,a4,80007b98 <__printf+0x620>
    80007718:	3e700513          	li	a0,999
    8000771c:	02d7f5bb          	remuw	a1,a5,a3
    80007720:	02059593          	slli	a1,a1,0x20
    80007724:	0205d593          	srli	a1,a1,0x20
    80007728:	00bd85b3          	add	a1,s11,a1
    8000772c:	0005c583          	lbu	a1,0(a1)
    80007730:	02d7d7bb          	divuw	a5,a5,a3
    80007734:	f8b40223          	sb	a1,-124(s0)
    80007738:	46e57663          	bgeu	a0,a4,80007ba4 <__printf+0x62c>
    8000773c:	02d7f5bb          	remuw	a1,a5,a3
    80007740:	02059593          	slli	a1,a1,0x20
    80007744:	0205d593          	srli	a1,a1,0x20
    80007748:	00bd85b3          	add	a1,s11,a1
    8000774c:	0005c583          	lbu	a1,0(a1)
    80007750:	02d7d7bb          	divuw	a5,a5,a3
    80007754:	f8b402a3          	sb	a1,-123(s0)
    80007758:	46ea7863          	bgeu	s4,a4,80007bc8 <__printf+0x650>
    8000775c:	02d7f5bb          	remuw	a1,a5,a3
    80007760:	02059593          	slli	a1,a1,0x20
    80007764:	0205d593          	srli	a1,a1,0x20
    80007768:	00bd85b3          	add	a1,s11,a1
    8000776c:	0005c583          	lbu	a1,0(a1)
    80007770:	02d7d7bb          	divuw	a5,a5,a3
    80007774:	f8b40323          	sb	a1,-122(s0)
    80007778:	3eeaf863          	bgeu	s5,a4,80007b68 <__printf+0x5f0>
    8000777c:	02d7f5bb          	remuw	a1,a5,a3
    80007780:	02059593          	slli	a1,a1,0x20
    80007784:	0205d593          	srli	a1,a1,0x20
    80007788:	00bd85b3          	add	a1,s11,a1
    8000778c:	0005c583          	lbu	a1,0(a1)
    80007790:	02d7d7bb          	divuw	a5,a5,a3
    80007794:	f8b403a3          	sb	a1,-121(s0)
    80007798:	42eb7e63          	bgeu	s6,a4,80007bd4 <__printf+0x65c>
    8000779c:	02d7f5bb          	remuw	a1,a5,a3
    800077a0:	02059593          	slli	a1,a1,0x20
    800077a4:	0205d593          	srli	a1,a1,0x20
    800077a8:	00bd85b3          	add	a1,s11,a1
    800077ac:	0005c583          	lbu	a1,0(a1)
    800077b0:	02d7d7bb          	divuw	a5,a5,a3
    800077b4:	f8b40423          	sb	a1,-120(s0)
    800077b8:	42ebfc63          	bgeu	s7,a4,80007bf0 <__printf+0x678>
    800077bc:	02079793          	slli	a5,a5,0x20
    800077c0:	0207d793          	srli	a5,a5,0x20
    800077c4:	00fd8db3          	add	s11,s11,a5
    800077c8:	000dc703          	lbu	a4,0(s11)
    800077cc:	00a00793          	li	a5,10
    800077d0:	00900c93          	li	s9,9
    800077d4:	f8e404a3          	sb	a4,-119(s0)
    800077d8:	00065c63          	bgez	a2,800077f0 <__printf+0x278>
    800077dc:	f9040713          	addi	a4,s0,-112
    800077e0:	00f70733          	add	a4,a4,a5
    800077e4:	02d00693          	li	a3,45
    800077e8:	fed70823          	sb	a3,-16(a4)
    800077ec:	00078c93          	mv	s9,a5
    800077f0:	f8040793          	addi	a5,s0,-128
    800077f4:	01978cb3          	add	s9,a5,s9
    800077f8:	f7f40d13          	addi	s10,s0,-129
    800077fc:	000cc503          	lbu	a0,0(s9)
    80007800:	fffc8c93          	addi	s9,s9,-1
    80007804:	00000097          	auipc	ra,0x0
    80007808:	b90080e7          	jalr	-1136(ra) # 80007394 <consputc>
    8000780c:	ffac98e3          	bne	s9,s10,800077fc <__printf+0x284>
    80007810:	00094503          	lbu	a0,0(s2)
    80007814:	e00514e3          	bnez	a0,8000761c <__printf+0xa4>
    80007818:	1a0c1663          	bnez	s8,800079c4 <__printf+0x44c>
    8000781c:	08813083          	ld	ra,136(sp)
    80007820:	08013403          	ld	s0,128(sp)
    80007824:	07813483          	ld	s1,120(sp)
    80007828:	07013903          	ld	s2,112(sp)
    8000782c:	06813983          	ld	s3,104(sp)
    80007830:	06013a03          	ld	s4,96(sp)
    80007834:	05813a83          	ld	s5,88(sp)
    80007838:	05013b03          	ld	s6,80(sp)
    8000783c:	04813b83          	ld	s7,72(sp)
    80007840:	04013c03          	ld	s8,64(sp)
    80007844:	03813c83          	ld	s9,56(sp)
    80007848:	03013d03          	ld	s10,48(sp)
    8000784c:	02813d83          	ld	s11,40(sp)
    80007850:	0d010113          	addi	sp,sp,208
    80007854:	00008067          	ret
    80007858:	07300713          	li	a4,115
    8000785c:	1ce78a63          	beq	a5,a4,80007a30 <__printf+0x4b8>
    80007860:	07800713          	li	a4,120
    80007864:	1ee79e63          	bne	a5,a4,80007a60 <__printf+0x4e8>
    80007868:	f7843783          	ld	a5,-136(s0)
    8000786c:	0007a703          	lw	a4,0(a5)
    80007870:	00878793          	addi	a5,a5,8
    80007874:	f6f43c23          	sd	a5,-136(s0)
    80007878:	28074263          	bltz	a4,80007afc <__printf+0x584>
    8000787c:	00002d97          	auipc	s11,0x2
    80007880:	fdcd8d93          	addi	s11,s11,-36 # 80009858 <digits>
    80007884:	00f77793          	andi	a5,a4,15
    80007888:	00fd87b3          	add	a5,s11,a5
    8000788c:	0007c683          	lbu	a3,0(a5)
    80007890:	00f00613          	li	a2,15
    80007894:	0007079b          	sext.w	a5,a4
    80007898:	f8d40023          	sb	a3,-128(s0)
    8000789c:	0047559b          	srliw	a1,a4,0x4
    800078a0:	0047569b          	srliw	a3,a4,0x4
    800078a4:	00000c93          	li	s9,0
    800078a8:	0ee65063          	bge	a2,a4,80007988 <__printf+0x410>
    800078ac:	00f6f693          	andi	a3,a3,15
    800078b0:	00dd86b3          	add	a3,s11,a3
    800078b4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800078b8:	0087d79b          	srliw	a5,a5,0x8
    800078bc:	00100c93          	li	s9,1
    800078c0:	f8d400a3          	sb	a3,-127(s0)
    800078c4:	0cb67263          	bgeu	a2,a1,80007988 <__printf+0x410>
    800078c8:	00f7f693          	andi	a3,a5,15
    800078cc:	00dd86b3          	add	a3,s11,a3
    800078d0:	0006c583          	lbu	a1,0(a3)
    800078d4:	00f00613          	li	a2,15
    800078d8:	0047d69b          	srliw	a3,a5,0x4
    800078dc:	f8b40123          	sb	a1,-126(s0)
    800078e0:	0047d593          	srli	a1,a5,0x4
    800078e4:	28f67e63          	bgeu	a2,a5,80007b80 <__printf+0x608>
    800078e8:	00f6f693          	andi	a3,a3,15
    800078ec:	00dd86b3          	add	a3,s11,a3
    800078f0:	0006c503          	lbu	a0,0(a3)
    800078f4:	0087d813          	srli	a6,a5,0x8
    800078f8:	0087d69b          	srliw	a3,a5,0x8
    800078fc:	f8a401a3          	sb	a0,-125(s0)
    80007900:	28b67663          	bgeu	a2,a1,80007b8c <__printf+0x614>
    80007904:	00f6f693          	andi	a3,a3,15
    80007908:	00dd86b3          	add	a3,s11,a3
    8000790c:	0006c583          	lbu	a1,0(a3)
    80007910:	00c7d513          	srli	a0,a5,0xc
    80007914:	00c7d69b          	srliw	a3,a5,0xc
    80007918:	f8b40223          	sb	a1,-124(s0)
    8000791c:	29067a63          	bgeu	a2,a6,80007bb0 <__printf+0x638>
    80007920:	00f6f693          	andi	a3,a3,15
    80007924:	00dd86b3          	add	a3,s11,a3
    80007928:	0006c583          	lbu	a1,0(a3)
    8000792c:	0107d813          	srli	a6,a5,0x10
    80007930:	0107d69b          	srliw	a3,a5,0x10
    80007934:	f8b402a3          	sb	a1,-123(s0)
    80007938:	28a67263          	bgeu	a2,a0,80007bbc <__printf+0x644>
    8000793c:	00f6f693          	andi	a3,a3,15
    80007940:	00dd86b3          	add	a3,s11,a3
    80007944:	0006c683          	lbu	a3,0(a3)
    80007948:	0147d79b          	srliw	a5,a5,0x14
    8000794c:	f8d40323          	sb	a3,-122(s0)
    80007950:	21067663          	bgeu	a2,a6,80007b5c <__printf+0x5e4>
    80007954:	02079793          	slli	a5,a5,0x20
    80007958:	0207d793          	srli	a5,a5,0x20
    8000795c:	00fd8db3          	add	s11,s11,a5
    80007960:	000dc683          	lbu	a3,0(s11)
    80007964:	00800793          	li	a5,8
    80007968:	00700c93          	li	s9,7
    8000796c:	f8d403a3          	sb	a3,-121(s0)
    80007970:	00075c63          	bgez	a4,80007988 <__printf+0x410>
    80007974:	f9040713          	addi	a4,s0,-112
    80007978:	00f70733          	add	a4,a4,a5
    8000797c:	02d00693          	li	a3,45
    80007980:	fed70823          	sb	a3,-16(a4)
    80007984:	00078c93          	mv	s9,a5
    80007988:	f8040793          	addi	a5,s0,-128
    8000798c:	01978cb3          	add	s9,a5,s9
    80007990:	f7f40d13          	addi	s10,s0,-129
    80007994:	000cc503          	lbu	a0,0(s9)
    80007998:	fffc8c93          	addi	s9,s9,-1
    8000799c:	00000097          	auipc	ra,0x0
    800079a0:	9f8080e7          	jalr	-1544(ra) # 80007394 <consputc>
    800079a4:	ff9d18e3          	bne	s10,s9,80007994 <__printf+0x41c>
    800079a8:	0100006f          	j	800079b8 <__printf+0x440>
    800079ac:	00000097          	auipc	ra,0x0
    800079b0:	9e8080e7          	jalr	-1560(ra) # 80007394 <consputc>
    800079b4:	000c8493          	mv	s1,s9
    800079b8:	00094503          	lbu	a0,0(s2)
    800079bc:	c60510e3          	bnez	a0,8000761c <__printf+0xa4>
    800079c0:	e40c0ee3          	beqz	s8,8000781c <__printf+0x2a4>
    800079c4:	00005517          	auipc	a0,0x5
    800079c8:	32c50513          	addi	a0,a0,812 # 8000ccf0 <pr>
    800079cc:	00001097          	auipc	ra,0x1
    800079d0:	94c080e7          	jalr	-1716(ra) # 80008318 <release>
    800079d4:	e49ff06f          	j	8000781c <__printf+0x2a4>
    800079d8:	f7843783          	ld	a5,-136(s0)
    800079dc:	03000513          	li	a0,48
    800079e0:	01000d13          	li	s10,16
    800079e4:	00878713          	addi	a4,a5,8
    800079e8:	0007bc83          	ld	s9,0(a5)
    800079ec:	f6e43c23          	sd	a4,-136(s0)
    800079f0:	00000097          	auipc	ra,0x0
    800079f4:	9a4080e7          	jalr	-1628(ra) # 80007394 <consputc>
    800079f8:	07800513          	li	a0,120
    800079fc:	00000097          	auipc	ra,0x0
    80007a00:	998080e7          	jalr	-1640(ra) # 80007394 <consputc>
    80007a04:	00002d97          	auipc	s11,0x2
    80007a08:	e54d8d93          	addi	s11,s11,-428 # 80009858 <digits>
    80007a0c:	03ccd793          	srli	a5,s9,0x3c
    80007a10:	00fd87b3          	add	a5,s11,a5
    80007a14:	0007c503          	lbu	a0,0(a5)
    80007a18:	fffd0d1b          	addiw	s10,s10,-1
    80007a1c:	004c9c93          	slli	s9,s9,0x4
    80007a20:	00000097          	auipc	ra,0x0
    80007a24:	974080e7          	jalr	-1676(ra) # 80007394 <consputc>
    80007a28:	fe0d12e3          	bnez	s10,80007a0c <__printf+0x494>
    80007a2c:	f8dff06f          	j	800079b8 <__printf+0x440>
    80007a30:	f7843783          	ld	a5,-136(s0)
    80007a34:	0007bc83          	ld	s9,0(a5)
    80007a38:	00878793          	addi	a5,a5,8
    80007a3c:	f6f43c23          	sd	a5,-136(s0)
    80007a40:	000c9a63          	bnez	s9,80007a54 <__printf+0x4dc>
    80007a44:	1080006f          	j	80007b4c <__printf+0x5d4>
    80007a48:	001c8c93          	addi	s9,s9,1
    80007a4c:	00000097          	auipc	ra,0x0
    80007a50:	948080e7          	jalr	-1720(ra) # 80007394 <consputc>
    80007a54:	000cc503          	lbu	a0,0(s9)
    80007a58:	fe0518e3          	bnez	a0,80007a48 <__printf+0x4d0>
    80007a5c:	f5dff06f          	j	800079b8 <__printf+0x440>
    80007a60:	02500513          	li	a0,37
    80007a64:	00000097          	auipc	ra,0x0
    80007a68:	930080e7          	jalr	-1744(ra) # 80007394 <consputc>
    80007a6c:	000c8513          	mv	a0,s9
    80007a70:	00000097          	auipc	ra,0x0
    80007a74:	924080e7          	jalr	-1756(ra) # 80007394 <consputc>
    80007a78:	f41ff06f          	j	800079b8 <__printf+0x440>
    80007a7c:	02500513          	li	a0,37
    80007a80:	00000097          	auipc	ra,0x0
    80007a84:	914080e7          	jalr	-1772(ra) # 80007394 <consputc>
    80007a88:	f31ff06f          	j	800079b8 <__printf+0x440>
    80007a8c:	00030513          	mv	a0,t1
    80007a90:	00000097          	auipc	ra,0x0
    80007a94:	7bc080e7          	jalr	1980(ra) # 8000824c <acquire>
    80007a98:	b4dff06f          	j	800075e4 <__printf+0x6c>
    80007a9c:	40c0053b          	negw	a0,a2
    80007aa0:	00a00713          	li	a4,10
    80007aa4:	02e576bb          	remuw	a3,a0,a4
    80007aa8:	00002d97          	auipc	s11,0x2
    80007aac:	db0d8d93          	addi	s11,s11,-592 # 80009858 <digits>
    80007ab0:	ff700593          	li	a1,-9
    80007ab4:	02069693          	slli	a3,a3,0x20
    80007ab8:	0206d693          	srli	a3,a3,0x20
    80007abc:	00dd86b3          	add	a3,s11,a3
    80007ac0:	0006c683          	lbu	a3,0(a3)
    80007ac4:	02e557bb          	divuw	a5,a0,a4
    80007ac8:	f8d40023          	sb	a3,-128(s0)
    80007acc:	10b65e63          	bge	a2,a1,80007be8 <__printf+0x670>
    80007ad0:	06300593          	li	a1,99
    80007ad4:	02e7f6bb          	remuw	a3,a5,a4
    80007ad8:	02069693          	slli	a3,a3,0x20
    80007adc:	0206d693          	srli	a3,a3,0x20
    80007ae0:	00dd86b3          	add	a3,s11,a3
    80007ae4:	0006c683          	lbu	a3,0(a3)
    80007ae8:	02e7d73b          	divuw	a4,a5,a4
    80007aec:	00200793          	li	a5,2
    80007af0:	f8d400a3          	sb	a3,-127(s0)
    80007af4:	bca5ece3          	bltu	a1,a0,800076cc <__printf+0x154>
    80007af8:	ce5ff06f          	j	800077dc <__printf+0x264>
    80007afc:	40e007bb          	negw	a5,a4
    80007b00:	00002d97          	auipc	s11,0x2
    80007b04:	d58d8d93          	addi	s11,s11,-680 # 80009858 <digits>
    80007b08:	00f7f693          	andi	a3,a5,15
    80007b0c:	00dd86b3          	add	a3,s11,a3
    80007b10:	0006c583          	lbu	a1,0(a3)
    80007b14:	ff100613          	li	a2,-15
    80007b18:	0047d69b          	srliw	a3,a5,0x4
    80007b1c:	f8b40023          	sb	a1,-128(s0)
    80007b20:	0047d59b          	srliw	a1,a5,0x4
    80007b24:	0ac75e63          	bge	a4,a2,80007be0 <__printf+0x668>
    80007b28:	00f6f693          	andi	a3,a3,15
    80007b2c:	00dd86b3          	add	a3,s11,a3
    80007b30:	0006c603          	lbu	a2,0(a3)
    80007b34:	00f00693          	li	a3,15
    80007b38:	0087d79b          	srliw	a5,a5,0x8
    80007b3c:	f8c400a3          	sb	a2,-127(s0)
    80007b40:	d8b6e4e3          	bltu	a3,a1,800078c8 <__printf+0x350>
    80007b44:	00200793          	li	a5,2
    80007b48:	e2dff06f          	j	80007974 <__printf+0x3fc>
    80007b4c:	00002c97          	auipc	s9,0x2
    80007b50:	cecc8c93          	addi	s9,s9,-788 # 80009838 <CONSOLE_STATUS+0x828>
    80007b54:	02800513          	li	a0,40
    80007b58:	ef1ff06f          	j	80007a48 <__printf+0x4d0>
    80007b5c:	00700793          	li	a5,7
    80007b60:	00600c93          	li	s9,6
    80007b64:	e0dff06f          	j	80007970 <__printf+0x3f8>
    80007b68:	00700793          	li	a5,7
    80007b6c:	00600c93          	li	s9,6
    80007b70:	c69ff06f          	j	800077d8 <__printf+0x260>
    80007b74:	00300793          	li	a5,3
    80007b78:	00200c93          	li	s9,2
    80007b7c:	c5dff06f          	j	800077d8 <__printf+0x260>
    80007b80:	00300793          	li	a5,3
    80007b84:	00200c93          	li	s9,2
    80007b88:	de9ff06f          	j	80007970 <__printf+0x3f8>
    80007b8c:	00400793          	li	a5,4
    80007b90:	00300c93          	li	s9,3
    80007b94:	dddff06f          	j	80007970 <__printf+0x3f8>
    80007b98:	00400793          	li	a5,4
    80007b9c:	00300c93          	li	s9,3
    80007ba0:	c39ff06f          	j	800077d8 <__printf+0x260>
    80007ba4:	00500793          	li	a5,5
    80007ba8:	00400c93          	li	s9,4
    80007bac:	c2dff06f          	j	800077d8 <__printf+0x260>
    80007bb0:	00500793          	li	a5,5
    80007bb4:	00400c93          	li	s9,4
    80007bb8:	db9ff06f          	j	80007970 <__printf+0x3f8>
    80007bbc:	00600793          	li	a5,6
    80007bc0:	00500c93          	li	s9,5
    80007bc4:	dadff06f          	j	80007970 <__printf+0x3f8>
    80007bc8:	00600793          	li	a5,6
    80007bcc:	00500c93          	li	s9,5
    80007bd0:	c09ff06f          	j	800077d8 <__printf+0x260>
    80007bd4:	00800793          	li	a5,8
    80007bd8:	00700c93          	li	s9,7
    80007bdc:	bfdff06f          	j	800077d8 <__printf+0x260>
    80007be0:	00100793          	li	a5,1
    80007be4:	d91ff06f          	j	80007974 <__printf+0x3fc>
    80007be8:	00100793          	li	a5,1
    80007bec:	bf1ff06f          	j	800077dc <__printf+0x264>
    80007bf0:	00900793          	li	a5,9
    80007bf4:	00800c93          	li	s9,8
    80007bf8:	be1ff06f          	j	800077d8 <__printf+0x260>
    80007bfc:	00002517          	auipc	a0,0x2
    80007c00:	c4450513          	addi	a0,a0,-956 # 80009840 <CONSOLE_STATUS+0x830>
    80007c04:	00000097          	auipc	ra,0x0
    80007c08:	918080e7          	jalr	-1768(ra) # 8000751c <panic>

0000000080007c0c <printfinit>:
    80007c0c:	fe010113          	addi	sp,sp,-32
    80007c10:	00813823          	sd	s0,16(sp)
    80007c14:	00913423          	sd	s1,8(sp)
    80007c18:	00113c23          	sd	ra,24(sp)
    80007c1c:	02010413          	addi	s0,sp,32
    80007c20:	00005497          	auipc	s1,0x5
    80007c24:	0d048493          	addi	s1,s1,208 # 8000ccf0 <pr>
    80007c28:	00048513          	mv	a0,s1
    80007c2c:	00002597          	auipc	a1,0x2
    80007c30:	c2458593          	addi	a1,a1,-988 # 80009850 <CONSOLE_STATUS+0x840>
    80007c34:	00000097          	auipc	ra,0x0
    80007c38:	5f4080e7          	jalr	1524(ra) # 80008228 <initlock>
    80007c3c:	01813083          	ld	ra,24(sp)
    80007c40:	01013403          	ld	s0,16(sp)
    80007c44:	0004ac23          	sw	zero,24(s1)
    80007c48:	00813483          	ld	s1,8(sp)
    80007c4c:	02010113          	addi	sp,sp,32
    80007c50:	00008067          	ret

0000000080007c54 <uartinit>:
    80007c54:	ff010113          	addi	sp,sp,-16
    80007c58:	00813423          	sd	s0,8(sp)
    80007c5c:	01010413          	addi	s0,sp,16
    80007c60:	100007b7          	lui	a5,0x10000
    80007c64:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80007c68:	f8000713          	li	a4,-128
    80007c6c:	00e781a3          	sb	a4,3(a5)
    80007c70:	00300713          	li	a4,3
    80007c74:	00e78023          	sb	a4,0(a5)
    80007c78:	000780a3          	sb	zero,1(a5)
    80007c7c:	00e781a3          	sb	a4,3(a5)
    80007c80:	00700693          	li	a3,7
    80007c84:	00d78123          	sb	a3,2(a5)
    80007c88:	00e780a3          	sb	a4,1(a5)
    80007c8c:	00813403          	ld	s0,8(sp)
    80007c90:	01010113          	addi	sp,sp,16
    80007c94:	00008067          	ret

0000000080007c98 <uartputc>:
    80007c98:	00004797          	auipc	a5,0x4
    80007c9c:	d707a783          	lw	a5,-656(a5) # 8000ba08 <panicked>
    80007ca0:	00078463          	beqz	a5,80007ca8 <uartputc+0x10>
    80007ca4:	0000006f          	j	80007ca4 <uartputc+0xc>
    80007ca8:	fd010113          	addi	sp,sp,-48
    80007cac:	02813023          	sd	s0,32(sp)
    80007cb0:	00913c23          	sd	s1,24(sp)
    80007cb4:	01213823          	sd	s2,16(sp)
    80007cb8:	01313423          	sd	s3,8(sp)
    80007cbc:	02113423          	sd	ra,40(sp)
    80007cc0:	03010413          	addi	s0,sp,48
    80007cc4:	00004917          	auipc	s2,0x4
    80007cc8:	d4c90913          	addi	s2,s2,-692 # 8000ba10 <uart_tx_r>
    80007ccc:	00093783          	ld	a5,0(s2)
    80007cd0:	00004497          	auipc	s1,0x4
    80007cd4:	d4848493          	addi	s1,s1,-696 # 8000ba18 <uart_tx_w>
    80007cd8:	0004b703          	ld	a4,0(s1)
    80007cdc:	02078693          	addi	a3,a5,32
    80007ce0:	00050993          	mv	s3,a0
    80007ce4:	02e69c63          	bne	a3,a4,80007d1c <uartputc+0x84>
    80007ce8:	00001097          	auipc	ra,0x1
    80007cec:	834080e7          	jalr	-1996(ra) # 8000851c <push_on>
    80007cf0:	00093783          	ld	a5,0(s2)
    80007cf4:	0004b703          	ld	a4,0(s1)
    80007cf8:	02078793          	addi	a5,a5,32
    80007cfc:	00e79463          	bne	a5,a4,80007d04 <uartputc+0x6c>
    80007d00:	0000006f          	j	80007d00 <uartputc+0x68>
    80007d04:	00001097          	auipc	ra,0x1
    80007d08:	88c080e7          	jalr	-1908(ra) # 80008590 <pop_on>
    80007d0c:	00093783          	ld	a5,0(s2)
    80007d10:	0004b703          	ld	a4,0(s1)
    80007d14:	02078693          	addi	a3,a5,32
    80007d18:	fce688e3          	beq	a3,a4,80007ce8 <uartputc+0x50>
    80007d1c:	01f77693          	andi	a3,a4,31
    80007d20:	00005597          	auipc	a1,0x5
    80007d24:	ff058593          	addi	a1,a1,-16 # 8000cd10 <uart_tx_buf>
    80007d28:	00d586b3          	add	a3,a1,a3
    80007d2c:	00170713          	addi	a4,a4,1
    80007d30:	01368023          	sb	s3,0(a3)
    80007d34:	00e4b023          	sd	a4,0(s1)
    80007d38:	10000637          	lui	a2,0x10000
    80007d3c:	02f71063          	bne	a4,a5,80007d5c <uartputc+0xc4>
    80007d40:	0340006f          	j	80007d74 <uartputc+0xdc>
    80007d44:	00074703          	lbu	a4,0(a4)
    80007d48:	00f93023          	sd	a5,0(s2)
    80007d4c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80007d50:	00093783          	ld	a5,0(s2)
    80007d54:	0004b703          	ld	a4,0(s1)
    80007d58:	00f70e63          	beq	a4,a5,80007d74 <uartputc+0xdc>
    80007d5c:	00564683          	lbu	a3,5(a2)
    80007d60:	01f7f713          	andi	a4,a5,31
    80007d64:	00e58733          	add	a4,a1,a4
    80007d68:	0206f693          	andi	a3,a3,32
    80007d6c:	00178793          	addi	a5,a5,1
    80007d70:	fc069ae3          	bnez	a3,80007d44 <uartputc+0xac>
    80007d74:	02813083          	ld	ra,40(sp)
    80007d78:	02013403          	ld	s0,32(sp)
    80007d7c:	01813483          	ld	s1,24(sp)
    80007d80:	01013903          	ld	s2,16(sp)
    80007d84:	00813983          	ld	s3,8(sp)
    80007d88:	03010113          	addi	sp,sp,48
    80007d8c:	00008067          	ret

0000000080007d90 <uartputc_sync>:
    80007d90:	ff010113          	addi	sp,sp,-16
    80007d94:	00813423          	sd	s0,8(sp)
    80007d98:	01010413          	addi	s0,sp,16
    80007d9c:	00004717          	auipc	a4,0x4
    80007da0:	c6c72703          	lw	a4,-916(a4) # 8000ba08 <panicked>
    80007da4:	02071663          	bnez	a4,80007dd0 <uartputc_sync+0x40>
    80007da8:	00050793          	mv	a5,a0
    80007dac:	100006b7          	lui	a3,0x10000
    80007db0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80007db4:	02077713          	andi	a4,a4,32
    80007db8:	fe070ce3          	beqz	a4,80007db0 <uartputc_sync+0x20>
    80007dbc:	0ff7f793          	andi	a5,a5,255
    80007dc0:	00f68023          	sb	a5,0(a3)
    80007dc4:	00813403          	ld	s0,8(sp)
    80007dc8:	01010113          	addi	sp,sp,16
    80007dcc:	00008067          	ret
    80007dd0:	0000006f          	j	80007dd0 <uartputc_sync+0x40>

0000000080007dd4 <uartstart>:
    80007dd4:	ff010113          	addi	sp,sp,-16
    80007dd8:	00813423          	sd	s0,8(sp)
    80007ddc:	01010413          	addi	s0,sp,16
    80007de0:	00004617          	auipc	a2,0x4
    80007de4:	c3060613          	addi	a2,a2,-976 # 8000ba10 <uart_tx_r>
    80007de8:	00004517          	auipc	a0,0x4
    80007dec:	c3050513          	addi	a0,a0,-976 # 8000ba18 <uart_tx_w>
    80007df0:	00063783          	ld	a5,0(a2)
    80007df4:	00053703          	ld	a4,0(a0)
    80007df8:	04f70263          	beq	a4,a5,80007e3c <uartstart+0x68>
    80007dfc:	100005b7          	lui	a1,0x10000
    80007e00:	00005817          	auipc	a6,0x5
    80007e04:	f1080813          	addi	a6,a6,-240 # 8000cd10 <uart_tx_buf>
    80007e08:	01c0006f          	j	80007e24 <uartstart+0x50>
    80007e0c:	0006c703          	lbu	a4,0(a3)
    80007e10:	00f63023          	sd	a5,0(a2)
    80007e14:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80007e18:	00063783          	ld	a5,0(a2)
    80007e1c:	00053703          	ld	a4,0(a0)
    80007e20:	00f70e63          	beq	a4,a5,80007e3c <uartstart+0x68>
    80007e24:	01f7f713          	andi	a4,a5,31
    80007e28:	00e806b3          	add	a3,a6,a4
    80007e2c:	0055c703          	lbu	a4,5(a1)
    80007e30:	00178793          	addi	a5,a5,1
    80007e34:	02077713          	andi	a4,a4,32
    80007e38:	fc071ae3          	bnez	a4,80007e0c <uartstart+0x38>
    80007e3c:	00813403          	ld	s0,8(sp)
    80007e40:	01010113          	addi	sp,sp,16
    80007e44:	00008067          	ret

0000000080007e48 <uartgetc>:
    80007e48:	ff010113          	addi	sp,sp,-16
    80007e4c:	00813423          	sd	s0,8(sp)
    80007e50:	01010413          	addi	s0,sp,16
    80007e54:	10000737          	lui	a4,0x10000
    80007e58:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80007e5c:	0017f793          	andi	a5,a5,1
    80007e60:	00078c63          	beqz	a5,80007e78 <uartgetc+0x30>
    80007e64:	00074503          	lbu	a0,0(a4)
    80007e68:	0ff57513          	andi	a0,a0,255
    80007e6c:	00813403          	ld	s0,8(sp)
    80007e70:	01010113          	addi	sp,sp,16
    80007e74:	00008067          	ret
    80007e78:	fff00513          	li	a0,-1
    80007e7c:	ff1ff06f          	j	80007e6c <uartgetc+0x24>

0000000080007e80 <uartintr>:
    80007e80:	100007b7          	lui	a5,0x10000
    80007e84:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80007e88:	0017f793          	andi	a5,a5,1
    80007e8c:	0a078463          	beqz	a5,80007f34 <uartintr+0xb4>
    80007e90:	fe010113          	addi	sp,sp,-32
    80007e94:	00813823          	sd	s0,16(sp)
    80007e98:	00913423          	sd	s1,8(sp)
    80007e9c:	00113c23          	sd	ra,24(sp)
    80007ea0:	02010413          	addi	s0,sp,32
    80007ea4:	100004b7          	lui	s1,0x10000
    80007ea8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80007eac:	0ff57513          	andi	a0,a0,255
    80007eb0:	fffff097          	auipc	ra,0xfffff
    80007eb4:	534080e7          	jalr	1332(ra) # 800073e4 <consoleintr>
    80007eb8:	0054c783          	lbu	a5,5(s1)
    80007ebc:	0017f793          	andi	a5,a5,1
    80007ec0:	fe0794e3          	bnez	a5,80007ea8 <uartintr+0x28>
    80007ec4:	00004617          	auipc	a2,0x4
    80007ec8:	b4c60613          	addi	a2,a2,-1204 # 8000ba10 <uart_tx_r>
    80007ecc:	00004517          	auipc	a0,0x4
    80007ed0:	b4c50513          	addi	a0,a0,-1204 # 8000ba18 <uart_tx_w>
    80007ed4:	00063783          	ld	a5,0(a2)
    80007ed8:	00053703          	ld	a4,0(a0)
    80007edc:	04f70263          	beq	a4,a5,80007f20 <uartintr+0xa0>
    80007ee0:	100005b7          	lui	a1,0x10000
    80007ee4:	00005817          	auipc	a6,0x5
    80007ee8:	e2c80813          	addi	a6,a6,-468 # 8000cd10 <uart_tx_buf>
    80007eec:	01c0006f          	j	80007f08 <uartintr+0x88>
    80007ef0:	0006c703          	lbu	a4,0(a3)
    80007ef4:	00f63023          	sd	a5,0(a2)
    80007ef8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80007efc:	00063783          	ld	a5,0(a2)
    80007f00:	00053703          	ld	a4,0(a0)
    80007f04:	00f70e63          	beq	a4,a5,80007f20 <uartintr+0xa0>
    80007f08:	01f7f713          	andi	a4,a5,31
    80007f0c:	00e806b3          	add	a3,a6,a4
    80007f10:	0055c703          	lbu	a4,5(a1)
    80007f14:	00178793          	addi	a5,a5,1
    80007f18:	02077713          	andi	a4,a4,32
    80007f1c:	fc071ae3          	bnez	a4,80007ef0 <uartintr+0x70>
    80007f20:	01813083          	ld	ra,24(sp)
    80007f24:	01013403          	ld	s0,16(sp)
    80007f28:	00813483          	ld	s1,8(sp)
    80007f2c:	02010113          	addi	sp,sp,32
    80007f30:	00008067          	ret
    80007f34:	00004617          	auipc	a2,0x4
    80007f38:	adc60613          	addi	a2,a2,-1316 # 8000ba10 <uart_tx_r>
    80007f3c:	00004517          	auipc	a0,0x4
    80007f40:	adc50513          	addi	a0,a0,-1316 # 8000ba18 <uart_tx_w>
    80007f44:	00063783          	ld	a5,0(a2)
    80007f48:	00053703          	ld	a4,0(a0)
    80007f4c:	04f70263          	beq	a4,a5,80007f90 <uartintr+0x110>
    80007f50:	100005b7          	lui	a1,0x10000
    80007f54:	00005817          	auipc	a6,0x5
    80007f58:	dbc80813          	addi	a6,a6,-580 # 8000cd10 <uart_tx_buf>
    80007f5c:	01c0006f          	j	80007f78 <uartintr+0xf8>
    80007f60:	0006c703          	lbu	a4,0(a3)
    80007f64:	00f63023          	sd	a5,0(a2)
    80007f68:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80007f6c:	00063783          	ld	a5,0(a2)
    80007f70:	00053703          	ld	a4,0(a0)
    80007f74:	02f70063          	beq	a4,a5,80007f94 <uartintr+0x114>
    80007f78:	01f7f713          	andi	a4,a5,31
    80007f7c:	00e806b3          	add	a3,a6,a4
    80007f80:	0055c703          	lbu	a4,5(a1)
    80007f84:	00178793          	addi	a5,a5,1
    80007f88:	02077713          	andi	a4,a4,32
    80007f8c:	fc071ae3          	bnez	a4,80007f60 <uartintr+0xe0>
    80007f90:	00008067          	ret
    80007f94:	00008067          	ret

0000000080007f98 <kinit>:
    80007f98:	fc010113          	addi	sp,sp,-64
    80007f9c:	02913423          	sd	s1,40(sp)
    80007fa0:	fffff7b7          	lui	a5,0xfffff
    80007fa4:	00006497          	auipc	s1,0x6
    80007fa8:	d8b48493          	addi	s1,s1,-629 # 8000dd2f <end+0xfff>
    80007fac:	02813823          	sd	s0,48(sp)
    80007fb0:	01313c23          	sd	s3,24(sp)
    80007fb4:	00f4f4b3          	and	s1,s1,a5
    80007fb8:	02113c23          	sd	ra,56(sp)
    80007fbc:	03213023          	sd	s2,32(sp)
    80007fc0:	01413823          	sd	s4,16(sp)
    80007fc4:	01513423          	sd	s5,8(sp)
    80007fc8:	04010413          	addi	s0,sp,64
    80007fcc:	000017b7          	lui	a5,0x1
    80007fd0:	01100993          	li	s3,17
    80007fd4:	00f487b3          	add	a5,s1,a5
    80007fd8:	01b99993          	slli	s3,s3,0x1b
    80007fdc:	06f9e063          	bltu	s3,a5,8000803c <kinit+0xa4>
    80007fe0:	00005a97          	auipc	s5,0x5
    80007fe4:	d50a8a93          	addi	s5,s5,-688 # 8000cd30 <end>
    80007fe8:	0754ec63          	bltu	s1,s5,80008060 <kinit+0xc8>
    80007fec:	0734fa63          	bgeu	s1,s3,80008060 <kinit+0xc8>
    80007ff0:	00088a37          	lui	s4,0x88
    80007ff4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80007ff8:	00004917          	auipc	s2,0x4
    80007ffc:	a2890913          	addi	s2,s2,-1496 # 8000ba20 <kmem>
    80008000:	00ca1a13          	slli	s4,s4,0xc
    80008004:	0140006f          	j	80008018 <kinit+0x80>
    80008008:	000017b7          	lui	a5,0x1
    8000800c:	00f484b3          	add	s1,s1,a5
    80008010:	0554e863          	bltu	s1,s5,80008060 <kinit+0xc8>
    80008014:	0534f663          	bgeu	s1,s3,80008060 <kinit+0xc8>
    80008018:	00001637          	lui	a2,0x1
    8000801c:	00100593          	li	a1,1
    80008020:	00048513          	mv	a0,s1
    80008024:	00000097          	auipc	ra,0x0
    80008028:	5e4080e7          	jalr	1508(ra) # 80008608 <__memset>
    8000802c:	00093783          	ld	a5,0(s2)
    80008030:	00f4b023          	sd	a5,0(s1)
    80008034:	00993023          	sd	s1,0(s2)
    80008038:	fd4498e3          	bne	s1,s4,80008008 <kinit+0x70>
    8000803c:	03813083          	ld	ra,56(sp)
    80008040:	03013403          	ld	s0,48(sp)
    80008044:	02813483          	ld	s1,40(sp)
    80008048:	02013903          	ld	s2,32(sp)
    8000804c:	01813983          	ld	s3,24(sp)
    80008050:	01013a03          	ld	s4,16(sp)
    80008054:	00813a83          	ld	s5,8(sp)
    80008058:	04010113          	addi	sp,sp,64
    8000805c:	00008067          	ret
    80008060:	00002517          	auipc	a0,0x2
    80008064:	81050513          	addi	a0,a0,-2032 # 80009870 <digits+0x18>
    80008068:	fffff097          	auipc	ra,0xfffff
    8000806c:	4b4080e7          	jalr	1204(ra) # 8000751c <panic>

0000000080008070 <freerange>:
    80008070:	fc010113          	addi	sp,sp,-64
    80008074:	000017b7          	lui	a5,0x1
    80008078:	02913423          	sd	s1,40(sp)
    8000807c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80008080:	009504b3          	add	s1,a0,s1
    80008084:	fffff537          	lui	a0,0xfffff
    80008088:	02813823          	sd	s0,48(sp)
    8000808c:	02113c23          	sd	ra,56(sp)
    80008090:	03213023          	sd	s2,32(sp)
    80008094:	01313c23          	sd	s3,24(sp)
    80008098:	01413823          	sd	s4,16(sp)
    8000809c:	01513423          	sd	s5,8(sp)
    800080a0:	01613023          	sd	s6,0(sp)
    800080a4:	04010413          	addi	s0,sp,64
    800080a8:	00a4f4b3          	and	s1,s1,a0
    800080ac:	00f487b3          	add	a5,s1,a5
    800080b0:	06f5e463          	bltu	a1,a5,80008118 <freerange+0xa8>
    800080b4:	00005a97          	auipc	s5,0x5
    800080b8:	c7ca8a93          	addi	s5,s5,-900 # 8000cd30 <end>
    800080bc:	0954e263          	bltu	s1,s5,80008140 <freerange+0xd0>
    800080c0:	01100993          	li	s3,17
    800080c4:	01b99993          	slli	s3,s3,0x1b
    800080c8:	0734fc63          	bgeu	s1,s3,80008140 <freerange+0xd0>
    800080cc:	00058a13          	mv	s4,a1
    800080d0:	00004917          	auipc	s2,0x4
    800080d4:	95090913          	addi	s2,s2,-1712 # 8000ba20 <kmem>
    800080d8:	00002b37          	lui	s6,0x2
    800080dc:	0140006f          	j	800080f0 <freerange+0x80>
    800080e0:	000017b7          	lui	a5,0x1
    800080e4:	00f484b3          	add	s1,s1,a5
    800080e8:	0554ec63          	bltu	s1,s5,80008140 <freerange+0xd0>
    800080ec:	0534fa63          	bgeu	s1,s3,80008140 <freerange+0xd0>
    800080f0:	00001637          	lui	a2,0x1
    800080f4:	00100593          	li	a1,1
    800080f8:	00048513          	mv	a0,s1
    800080fc:	00000097          	auipc	ra,0x0
    80008100:	50c080e7          	jalr	1292(ra) # 80008608 <__memset>
    80008104:	00093703          	ld	a4,0(s2)
    80008108:	016487b3          	add	a5,s1,s6
    8000810c:	00e4b023          	sd	a4,0(s1)
    80008110:	00993023          	sd	s1,0(s2)
    80008114:	fcfa76e3          	bgeu	s4,a5,800080e0 <freerange+0x70>
    80008118:	03813083          	ld	ra,56(sp)
    8000811c:	03013403          	ld	s0,48(sp)
    80008120:	02813483          	ld	s1,40(sp)
    80008124:	02013903          	ld	s2,32(sp)
    80008128:	01813983          	ld	s3,24(sp)
    8000812c:	01013a03          	ld	s4,16(sp)
    80008130:	00813a83          	ld	s5,8(sp)
    80008134:	00013b03          	ld	s6,0(sp)
    80008138:	04010113          	addi	sp,sp,64
    8000813c:	00008067          	ret
    80008140:	00001517          	auipc	a0,0x1
    80008144:	73050513          	addi	a0,a0,1840 # 80009870 <digits+0x18>
    80008148:	fffff097          	auipc	ra,0xfffff
    8000814c:	3d4080e7          	jalr	980(ra) # 8000751c <panic>

0000000080008150 <kfree>:
    80008150:	fe010113          	addi	sp,sp,-32
    80008154:	00813823          	sd	s0,16(sp)
    80008158:	00113c23          	sd	ra,24(sp)
    8000815c:	00913423          	sd	s1,8(sp)
    80008160:	02010413          	addi	s0,sp,32
    80008164:	03451793          	slli	a5,a0,0x34
    80008168:	04079c63          	bnez	a5,800081c0 <kfree+0x70>
    8000816c:	00005797          	auipc	a5,0x5
    80008170:	bc478793          	addi	a5,a5,-1084 # 8000cd30 <end>
    80008174:	00050493          	mv	s1,a0
    80008178:	04f56463          	bltu	a0,a5,800081c0 <kfree+0x70>
    8000817c:	01100793          	li	a5,17
    80008180:	01b79793          	slli	a5,a5,0x1b
    80008184:	02f57e63          	bgeu	a0,a5,800081c0 <kfree+0x70>
    80008188:	00001637          	lui	a2,0x1
    8000818c:	00100593          	li	a1,1
    80008190:	00000097          	auipc	ra,0x0
    80008194:	478080e7          	jalr	1144(ra) # 80008608 <__memset>
    80008198:	00004797          	auipc	a5,0x4
    8000819c:	88878793          	addi	a5,a5,-1912 # 8000ba20 <kmem>
    800081a0:	0007b703          	ld	a4,0(a5)
    800081a4:	01813083          	ld	ra,24(sp)
    800081a8:	01013403          	ld	s0,16(sp)
    800081ac:	00e4b023          	sd	a4,0(s1)
    800081b0:	0097b023          	sd	s1,0(a5)
    800081b4:	00813483          	ld	s1,8(sp)
    800081b8:	02010113          	addi	sp,sp,32
    800081bc:	00008067          	ret
    800081c0:	00001517          	auipc	a0,0x1
    800081c4:	6b050513          	addi	a0,a0,1712 # 80009870 <digits+0x18>
    800081c8:	fffff097          	auipc	ra,0xfffff
    800081cc:	354080e7          	jalr	852(ra) # 8000751c <panic>

00000000800081d0 <kalloc>:
    800081d0:	fe010113          	addi	sp,sp,-32
    800081d4:	00813823          	sd	s0,16(sp)
    800081d8:	00913423          	sd	s1,8(sp)
    800081dc:	00113c23          	sd	ra,24(sp)
    800081e0:	02010413          	addi	s0,sp,32
    800081e4:	00004797          	auipc	a5,0x4
    800081e8:	83c78793          	addi	a5,a5,-1988 # 8000ba20 <kmem>
    800081ec:	0007b483          	ld	s1,0(a5)
    800081f0:	02048063          	beqz	s1,80008210 <kalloc+0x40>
    800081f4:	0004b703          	ld	a4,0(s1)
    800081f8:	00001637          	lui	a2,0x1
    800081fc:	00500593          	li	a1,5
    80008200:	00048513          	mv	a0,s1
    80008204:	00e7b023          	sd	a4,0(a5)
    80008208:	00000097          	auipc	ra,0x0
    8000820c:	400080e7          	jalr	1024(ra) # 80008608 <__memset>
    80008210:	01813083          	ld	ra,24(sp)
    80008214:	01013403          	ld	s0,16(sp)
    80008218:	00048513          	mv	a0,s1
    8000821c:	00813483          	ld	s1,8(sp)
    80008220:	02010113          	addi	sp,sp,32
    80008224:	00008067          	ret

0000000080008228 <initlock>:
    80008228:	ff010113          	addi	sp,sp,-16
    8000822c:	00813423          	sd	s0,8(sp)
    80008230:	01010413          	addi	s0,sp,16
    80008234:	00813403          	ld	s0,8(sp)
    80008238:	00b53423          	sd	a1,8(a0)
    8000823c:	00052023          	sw	zero,0(a0)
    80008240:	00053823          	sd	zero,16(a0)
    80008244:	01010113          	addi	sp,sp,16
    80008248:	00008067          	ret

000000008000824c <acquire>:
    8000824c:	fe010113          	addi	sp,sp,-32
    80008250:	00813823          	sd	s0,16(sp)
    80008254:	00913423          	sd	s1,8(sp)
    80008258:	00113c23          	sd	ra,24(sp)
    8000825c:	01213023          	sd	s2,0(sp)
    80008260:	02010413          	addi	s0,sp,32
    80008264:	00050493          	mv	s1,a0
    80008268:	10002973          	csrr	s2,sstatus
    8000826c:	100027f3          	csrr	a5,sstatus
    80008270:	ffd7f793          	andi	a5,a5,-3
    80008274:	10079073          	csrw	sstatus,a5
    80008278:	fffff097          	auipc	ra,0xfffff
    8000827c:	8e4080e7          	jalr	-1820(ra) # 80006b5c <mycpu>
    80008280:	07852783          	lw	a5,120(a0)
    80008284:	06078e63          	beqz	a5,80008300 <acquire+0xb4>
    80008288:	fffff097          	auipc	ra,0xfffff
    8000828c:	8d4080e7          	jalr	-1836(ra) # 80006b5c <mycpu>
    80008290:	07852783          	lw	a5,120(a0)
    80008294:	0004a703          	lw	a4,0(s1)
    80008298:	0017879b          	addiw	a5,a5,1
    8000829c:	06f52c23          	sw	a5,120(a0)
    800082a0:	04071063          	bnez	a4,800082e0 <acquire+0x94>
    800082a4:	00100713          	li	a4,1
    800082a8:	00070793          	mv	a5,a4
    800082ac:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800082b0:	0007879b          	sext.w	a5,a5
    800082b4:	fe079ae3          	bnez	a5,800082a8 <acquire+0x5c>
    800082b8:	0ff0000f          	fence
    800082bc:	fffff097          	auipc	ra,0xfffff
    800082c0:	8a0080e7          	jalr	-1888(ra) # 80006b5c <mycpu>
    800082c4:	01813083          	ld	ra,24(sp)
    800082c8:	01013403          	ld	s0,16(sp)
    800082cc:	00a4b823          	sd	a0,16(s1)
    800082d0:	00013903          	ld	s2,0(sp)
    800082d4:	00813483          	ld	s1,8(sp)
    800082d8:	02010113          	addi	sp,sp,32
    800082dc:	00008067          	ret
    800082e0:	0104b903          	ld	s2,16(s1)
    800082e4:	fffff097          	auipc	ra,0xfffff
    800082e8:	878080e7          	jalr	-1928(ra) # 80006b5c <mycpu>
    800082ec:	faa91ce3          	bne	s2,a0,800082a4 <acquire+0x58>
    800082f0:	00001517          	auipc	a0,0x1
    800082f4:	58850513          	addi	a0,a0,1416 # 80009878 <digits+0x20>
    800082f8:	fffff097          	auipc	ra,0xfffff
    800082fc:	224080e7          	jalr	548(ra) # 8000751c <panic>
    80008300:	00195913          	srli	s2,s2,0x1
    80008304:	fffff097          	auipc	ra,0xfffff
    80008308:	858080e7          	jalr	-1960(ra) # 80006b5c <mycpu>
    8000830c:	00197913          	andi	s2,s2,1
    80008310:	07252e23          	sw	s2,124(a0)
    80008314:	f75ff06f          	j	80008288 <acquire+0x3c>

0000000080008318 <release>:
    80008318:	fe010113          	addi	sp,sp,-32
    8000831c:	00813823          	sd	s0,16(sp)
    80008320:	00113c23          	sd	ra,24(sp)
    80008324:	00913423          	sd	s1,8(sp)
    80008328:	01213023          	sd	s2,0(sp)
    8000832c:	02010413          	addi	s0,sp,32
    80008330:	00052783          	lw	a5,0(a0)
    80008334:	00079a63          	bnez	a5,80008348 <release+0x30>
    80008338:	00001517          	auipc	a0,0x1
    8000833c:	54850513          	addi	a0,a0,1352 # 80009880 <digits+0x28>
    80008340:	fffff097          	auipc	ra,0xfffff
    80008344:	1dc080e7          	jalr	476(ra) # 8000751c <panic>
    80008348:	01053903          	ld	s2,16(a0)
    8000834c:	00050493          	mv	s1,a0
    80008350:	fffff097          	auipc	ra,0xfffff
    80008354:	80c080e7          	jalr	-2036(ra) # 80006b5c <mycpu>
    80008358:	fea910e3          	bne	s2,a0,80008338 <release+0x20>
    8000835c:	0004b823          	sd	zero,16(s1)
    80008360:	0ff0000f          	fence
    80008364:	0f50000f          	fence	iorw,ow
    80008368:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000836c:	ffffe097          	auipc	ra,0xffffe
    80008370:	7f0080e7          	jalr	2032(ra) # 80006b5c <mycpu>
    80008374:	100027f3          	csrr	a5,sstatus
    80008378:	0027f793          	andi	a5,a5,2
    8000837c:	04079a63          	bnez	a5,800083d0 <release+0xb8>
    80008380:	07852783          	lw	a5,120(a0)
    80008384:	02f05e63          	blez	a5,800083c0 <release+0xa8>
    80008388:	fff7871b          	addiw	a4,a5,-1
    8000838c:	06e52c23          	sw	a4,120(a0)
    80008390:	00071c63          	bnez	a4,800083a8 <release+0x90>
    80008394:	07c52783          	lw	a5,124(a0)
    80008398:	00078863          	beqz	a5,800083a8 <release+0x90>
    8000839c:	100027f3          	csrr	a5,sstatus
    800083a0:	0027e793          	ori	a5,a5,2
    800083a4:	10079073          	csrw	sstatus,a5
    800083a8:	01813083          	ld	ra,24(sp)
    800083ac:	01013403          	ld	s0,16(sp)
    800083b0:	00813483          	ld	s1,8(sp)
    800083b4:	00013903          	ld	s2,0(sp)
    800083b8:	02010113          	addi	sp,sp,32
    800083bc:	00008067          	ret
    800083c0:	00001517          	auipc	a0,0x1
    800083c4:	4e050513          	addi	a0,a0,1248 # 800098a0 <digits+0x48>
    800083c8:	fffff097          	auipc	ra,0xfffff
    800083cc:	154080e7          	jalr	340(ra) # 8000751c <panic>
    800083d0:	00001517          	auipc	a0,0x1
    800083d4:	4b850513          	addi	a0,a0,1208 # 80009888 <digits+0x30>
    800083d8:	fffff097          	auipc	ra,0xfffff
    800083dc:	144080e7          	jalr	324(ra) # 8000751c <panic>

00000000800083e0 <holding>:
    800083e0:	00052783          	lw	a5,0(a0)
    800083e4:	00079663          	bnez	a5,800083f0 <holding+0x10>
    800083e8:	00000513          	li	a0,0
    800083ec:	00008067          	ret
    800083f0:	fe010113          	addi	sp,sp,-32
    800083f4:	00813823          	sd	s0,16(sp)
    800083f8:	00913423          	sd	s1,8(sp)
    800083fc:	00113c23          	sd	ra,24(sp)
    80008400:	02010413          	addi	s0,sp,32
    80008404:	01053483          	ld	s1,16(a0)
    80008408:	ffffe097          	auipc	ra,0xffffe
    8000840c:	754080e7          	jalr	1876(ra) # 80006b5c <mycpu>
    80008410:	01813083          	ld	ra,24(sp)
    80008414:	01013403          	ld	s0,16(sp)
    80008418:	40a48533          	sub	a0,s1,a0
    8000841c:	00153513          	seqz	a0,a0
    80008420:	00813483          	ld	s1,8(sp)
    80008424:	02010113          	addi	sp,sp,32
    80008428:	00008067          	ret

000000008000842c <push_off>:
    8000842c:	fe010113          	addi	sp,sp,-32
    80008430:	00813823          	sd	s0,16(sp)
    80008434:	00113c23          	sd	ra,24(sp)
    80008438:	00913423          	sd	s1,8(sp)
    8000843c:	02010413          	addi	s0,sp,32
    80008440:	100024f3          	csrr	s1,sstatus
    80008444:	100027f3          	csrr	a5,sstatus
    80008448:	ffd7f793          	andi	a5,a5,-3
    8000844c:	10079073          	csrw	sstatus,a5
    80008450:	ffffe097          	auipc	ra,0xffffe
    80008454:	70c080e7          	jalr	1804(ra) # 80006b5c <mycpu>
    80008458:	07852783          	lw	a5,120(a0)
    8000845c:	02078663          	beqz	a5,80008488 <push_off+0x5c>
    80008460:	ffffe097          	auipc	ra,0xffffe
    80008464:	6fc080e7          	jalr	1788(ra) # 80006b5c <mycpu>
    80008468:	07852783          	lw	a5,120(a0)
    8000846c:	01813083          	ld	ra,24(sp)
    80008470:	01013403          	ld	s0,16(sp)
    80008474:	0017879b          	addiw	a5,a5,1
    80008478:	06f52c23          	sw	a5,120(a0)
    8000847c:	00813483          	ld	s1,8(sp)
    80008480:	02010113          	addi	sp,sp,32
    80008484:	00008067          	ret
    80008488:	0014d493          	srli	s1,s1,0x1
    8000848c:	ffffe097          	auipc	ra,0xffffe
    80008490:	6d0080e7          	jalr	1744(ra) # 80006b5c <mycpu>
    80008494:	0014f493          	andi	s1,s1,1
    80008498:	06952e23          	sw	s1,124(a0)
    8000849c:	fc5ff06f          	j	80008460 <push_off+0x34>

00000000800084a0 <pop_off>:
    800084a0:	ff010113          	addi	sp,sp,-16
    800084a4:	00813023          	sd	s0,0(sp)
    800084a8:	00113423          	sd	ra,8(sp)
    800084ac:	01010413          	addi	s0,sp,16
    800084b0:	ffffe097          	auipc	ra,0xffffe
    800084b4:	6ac080e7          	jalr	1708(ra) # 80006b5c <mycpu>
    800084b8:	100027f3          	csrr	a5,sstatus
    800084bc:	0027f793          	andi	a5,a5,2
    800084c0:	04079663          	bnez	a5,8000850c <pop_off+0x6c>
    800084c4:	07852783          	lw	a5,120(a0)
    800084c8:	02f05a63          	blez	a5,800084fc <pop_off+0x5c>
    800084cc:	fff7871b          	addiw	a4,a5,-1
    800084d0:	06e52c23          	sw	a4,120(a0)
    800084d4:	00071c63          	bnez	a4,800084ec <pop_off+0x4c>
    800084d8:	07c52783          	lw	a5,124(a0)
    800084dc:	00078863          	beqz	a5,800084ec <pop_off+0x4c>
    800084e0:	100027f3          	csrr	a5,sstatus
    800084e4:	0027e793          	ori	a5,a5,2
    800084e8:	10079073          	csrw	sstatus,a5
    800084ec:	00813083          	ld	ra,8(sp)
    800084f0:	00013403          	ld	s0,0(sp)
    800084f4:	01010113          	addi	sp,sp,16
    800084f8:	00008067          	ret
    800084fc:	00001517          	auipc	a0,0x1
    80008500:	3a450513          	addi	a0,a0,932 # 800098a0 <digits+0x48>
    80008504:	fffff097          	auipc	ra,0xfffff
    80008508:	018080e7          	jalr	24(ra) # 8000751c <panic>
    8000850c:	00001517          	auipc	a0,0x1
    80008510:	37c50513          	addi	a0,a0,892 # 80009888 <digits+0x30>
    80008514:	fffff097          	auipc	ra,0xfffff
    80008518:	008080e7          	jalr	8(ra) # 8000751c <panic>

000000008000851c <push_on>:
    8000851c:	fe010113          	addi	sp,sp,-32
    80008520:	00813823          	sd	s0,16(sp)
    80008524:	00113c23          	sd	ra,24(sp)
    80008528:	00913423          	sd	s1,8(sp)
    8000852c:	02010413          	addi	s0,sp,32
    80008530:	100024f3          	csrr	s1,sstatus
    80008534:	100027f3          	csrr	a5,sstatus
    80008538:	0027e793          	ori	a5,a5,2
    8000853c:	10079073          	csrw	sstatus,a5
    80008540:	ffffe097          	auipc	ra,0xffffe
    80008544:	61c080e7          	jalr	1564(ra) # 80006b5c <mycpu>
    80008548:	07852783          	lw	a5,120(a0)
    8000854c:	02078663          	beqz	a5,80008578 <push_on+0x5c>
    80008550:	ffffe097          	auipc	ra,0xffffe
    80008554:	60c080e7          	jalr	1548(ra) # 80006b5c <mycpu>
    80008558:	07852783          	lw	a5,120(a0)
    8000855c:	01813083          	ld	ra,24(sp)
    80008560:	01013403          	ld	s0,16(sp)
    80008564:	0017879b          	addiw	a5,a5,1
    80008568:	06f52c23          	sw	a5,120(a0)
    8000856c:	00813483          	ld	s1,8(sp)
    80008570:	02010113          	addi	sp,sp,32
    80008574:	00008067          	ret
    80008578:	0014d493          	srli	s1,s1,0x1
    8000857c:	ffffe097          	auipc	ra,0xffffe
    80008580:	5e0080e7          	jalr	1504(ra) # 80006b5c <mycpu>
    80008584:	0014f493          	andi	s1,s1,1
    80008588:	06952e23          	sw	s1,124(a0)
    8000858c:	fc5ff06f          	j	80008550 <push_on+0x34>

0000000080008590 <pop_on>:
    80008590:	ff010113          	addi	sp,sp,-16
    80008594:	00813023          	sd	s0,0(sp)
    80008598:	00113423          	sd	ra,8(sp)
    8000859c:	01010413          	addi	s0,sp,16
    800085a0:	ffffe097          	auipc	ra,0xffffe
    800085a4:	5bc080e7          	jalr	1468(ra) # 80006b5c <mycpu>
    800085a8:	100027f3          	csrr	a5,sstatus
    800085ac:	0027f793          	andi	a5,a5,2
    800085b0:	04078463          	beqz	a5,800085f8 <pop_on+0x68>
    800085b4:	07852783          	lw	a5,120(a0)
    800085b8:	02f05863          	blez	a5,800085e8 <pop_on+0x58>
    800085bc:	fff7879b          	addiw	a5,a5,-1
    800085c0:	06f52c23          	sw	a5,120(a0)
    800085c4:	07853783          	ld	a5,120(a0)
    800085c8:	00079863          	bnez	a5,800085d8 <pop_on+0x48>
    800085cc:	100027f3          	csrr	a5,sstatus
    800085d0:	ffd7f793          	andi	a5,a5,-3
    800085d4:	10079073          	csrw	sstatus,a5
    800085d8:	00813083          	ld	ra,8(sp)
    800085dc:	00013403          	ld	s0,0(sp)
    800085e0:	01010113          	addi	sp,sp,16
    800085e4:	00008067          	ret
    800085e8:	00001517          	auipc	a0,0x1
    800085ec:	2e050513          	addi	a0,a0,736 # 800098c8 <digits+0x70>
    800085f0:	fffff097          	auipc	ra,0xfffff
    800085f4:	f2c080e7          	jalr	-212(ra) # 8000751c <panic>
    800085f8:	00001517          	auipc	a0,0x1
    800085fc:	2b050513          	addi	a0,a0,688 # 800098a8 <digits+0x50>
    80008600:	fffff097          	auipc	ra,0xfffff
    80008604:	f1c080e7          	jalr	-228(ra) # 8000751c <panic>

0000000080008608 <__memset>:
    80008608:	ff010113          	addi	sp,sp,-16
    8000860c:	00813423          	sd	s0,8(sp)
    80008610:	01010413          	addi	s0,sp,16
    80008614:	1a060e63          	beqz	a2,800087d0 <__memset+0x1c8>
    80008618:	40a007b3          	neg	a5,a0
    8000861c:	0077f793          	andi	a5,a5,7
    80008620:	00778693          	addi	a3,a5,7
    80008624:	00b00813          	li	a6,11
    80008628:	0ff5f593          	andi	a1,a1,255
    8000862c:	fff6071b          	addiw	a4,a2,-1
    80008630:	1b06e663          	bltu	a3,a6,800087dc <__memset+0x1d4>
    80008634:	1cd76463          	bltu	a4,a3,800087fc <__memset+0x1f4>
    80008638:	1a078e63          	beqz	a5,800087f4 <__memset+0x1ec>
    8000863c:	00b50023          	sb	a1,0(a0)
    80008640:	00100713          	li	a4,1
    80008644:	1ae78463          	beq	a5,a4,800087ec <__memset+0x1e4>
    80008648:	00b500a3          	sb	a1,1(a0)
    8000864c:	00200713          	li	a4,2
    80008650:	1ae78a63          	beq	a5,a4,80008804 <__memset+0x1fc>
    80008654:	00b50123          	sb	a1,2(a0)
    80008658:	00300713          	li	a4,3
    8000865c:	18e78463          	beq	a5,a4,800087e4 <__memset+0x1dc>
    80008660:	00b501a3          	sb	a1,3(a0)
    80008664:	00400713          	li	a4,4
    80008668:	1ae78263          	beq	a5,a4,8000880c <__memset+0x204>
    8000866c:	00b50223          	sb	a1,4(a0)
    80008670:	00500713          	li	a4,5
    80008674:	1ae78063          	beq	a5,a4,80008814 <__memset+0x20c>
    80008678:	00b502a3          	sb	a1,5(a0)
    8000867c:	00700713          	li	a4,7
    80008680:	18e79e63          	bne	a5,a4,8000881c <__memset+0x214>
    80008684:	00b50323          	sb	a1,6(a0)
    80008688:	00700e93          	li	t4,7
    8000868c:	00859713          	slli	a4,a1,0x8
    80008690:	00e5e733          	or	a4,a1,a4
    80008694:	01059e13          	slli	t3,a1,0x10
    80008698:	01c76e33          	or	t3,a4,t3
    8000869c:	01859313          	slli	t1,a1,0x18
    800086a0:	006e6333          	or	t1,t3,t1
    800086a4:	02059893          	slli	a7,a1,0x20
    800086a8:	40f60e3b          	subw	t3,a2,a5
    800086ac:	011368b3          	or	a7,t1,a7
    800086b0:	02859813          	slli	a6,a1,0x28
    800086b4:	0108e833          	or	a6,a7,a6
    800086b8:	03059693          	slli	a3,a1,0x30
    800086bc:	003e589b          	srliw	a7,t3,0x3
    800086c0:	00d866b3          	or	a3,a6,a3
    800086c4:	03859713          	slli	a4,a1,0x38
    800086c8:	00389813          	slli	a6,a7,0x3
    800086cc:	00f507b3          	add	a5,a0,a5
    800086d0:	00e6e733          	or	a4,a3,a4
    800086d4:	000e089b          	sext.w	a7,t3
    800086d8:	00f806b3          	add	a3,a6,a5
    800086dc:	00e7b023          	sd	a4,0(a5)
    800086e0:	00878793          	addi	a5,a5,8
    800086e4:	fed79ce3          	bne	a5,a3,800086dc <__memset+0xd4>
    800086e8:	ff8e7793          	andi	a5,t3,-8
    800086ec:	0007871b          	sext.w	a4,a5
    800086f0:	01d787bb          	addw	a5,a5,t4
    800086f4:	0ce88e63          	beq	a7,a4,800087d0 <__memset+0x1c8>
    800086f8:	00f50733          	add	a4,a0,a5
    800086fc:	00b70023          	sb	a1,0(a4)
    80008700:	0017871b          	addiw	a4,a5,1
    80008704:	0cc77663          	bgeu	a4,a2,800087d0 <__memset+0x1c8>
    80008708:	00e50733          	add	a4,a0,a4
    8000870c:	00b70023          	sb	a1,0(a4)
    80008710:	0027871b          	addiw	a4,a5,2
    80008714:	0ac77e63          	bgeu	a4,a2,800087d0 <__memset+0x1c8>
    80008718:	00e50733          	add	a4,a0,a4
    8000871c:	00b70023          	sb	a1,0(a4)
    80008720:	0037871b          	addiw	a4,a5,3
    80008724:	0ac77663          	bgeu	a4,a2,800087d0 <__memset+0x1c8>
    80008728:	00e50733          	add	a4,a0,a4
    8000872c:	00b70023          	sb	a1,0(a4)
    80008730:	0047871b          	addiw	a4,a5,4
    80008734:	08c77e63          	bgeu	a4,a2,800087d0 <__memset+0x1c8>
    80008738:	00e50733          	add	a4,a0,a4
    8000873c:	00b70023          	sb	a1,0(a4)
    80008740:	0057871b          	addiw	a4,a5,5
    80008744:	08c77663          	bgeu	a4,a2,800087d0 <__memset+0x1c8>
    80008748:	00e50733          	add	a4,a0,a4
    8000874c:	00b70023          	sb	a1,0(a4)
    80008750:	0067871b          	addiw	a4,a5,6
    80008754:	06c77e63          	bgeu	a4,a2,800087d0 <__memset+0x1c8>
    80008758:	00e50733          	add	a4,a0,a4
    8000875c:	00b70023          	sb	a1,0(a4)
    80008760:	0077871b          	addiw	a4,a5,7
    80008764:	06c77663          	bgeu	a4,a2,800087d0 <__memset+0x1c8>
    80008768:	00e50733          	add	a4,a0,a4
    8000876c:	00b70023          	sb	a1,0(a4)
    80008770:	0087871b          	addiw	a4,a5,8
    80008774:	04c77e63          	bgeu	a4,a2,800087d0 <__memset+0x1c8>
    80008778:	00e50733          	add	a4,a0,a4
    8000877c:	00b70023          	sb	a1,0(a4)
    80008780:	0097871b          	addiw	a4,a5,9
    80008784:	04c77663          	bgeu	a4,a2,800087d0 <__memset+0x1c8>
    80008788:	00e50733          	add	a4,a0,a4
    8000878c:	00b70023          	sb	a1,0(a4)
    80008790:	00a7871b          	addiw	a4,a5,10
    80008794:	02c77e63          	bgeu	a4,a2,800087d0 <__memset+0x1c8>
    80008798:	00e50733          	add	a4,a0,a4
    8000879c:	00b70023          	sb	a1,0(a4)
    800087a0:	00b7871b          	addiw	a4,a5,11
    800087a4:	02c77663          	bgeu	a4,a2,800087d0 <__memset+0x1c8>
    800087a8:	00e50733          	add	a4,a0,a4
    800087ac:	00b70023          	sb	a1,0(a4)
    800087b0:	00c7871b          	addiw	a4,a5,12
    800087b4:	00c77e63          	bgeu	a4,a2,800087d0 <__memset+0x1c8>
    800087b8:	00e50733          	add	a4,a0,a4
    800087bc:	00b70023          	sb	a1,0(a4)
    800087c0:	00d7879b          	addiw	a5,a5,13
    800087c4:	00c7f663          	bgeu	a5,a2,800087d0 <__memset+0x1c8>
    800087c8:	00f507b3          	add	a5,a0,a5
    800087cc:	00b78023          	sb	a1,0(a5)
    800087d0:	00813403          	ld	s0,8(sp)
    800087d4:	01010113          	addi	sp,sp,16
    800087d8:	00008067          	ret
    800087dc:	00b00693          	li	a3,11
    800087e0:	e55ff06f          	j	80008634 <__memset+0x2c>
    800087e4:	00300e93          	li	t4,3
    800087e8:	ea5ff06f          	j	8000868c <__memset+0x84>
    800087ec:	00100e93          	li	t4,1
    800087f0:	e9dff06f          	j	8000868c <__memset+0x84>
    800087f4:	00000e93          	li	t4,0
    800087f8:	e95ff06f          	j	8000868c <__memset+0x84>
    800087fc:	00000793          	li	a5,0
    80008800:	ef9ff06f          	j	800086f8 <__memset+0xf0>
    80008804:	00200e93          	li	t4,2
    80008808:	e85ff06f          	j	8000868c <__memset+0x84>
    8000880c:	00400e93          	li	t4,4
    80008810:	e7dff06f          	j	8000868c <__memset+0x84>
    80008814:	00500e93          	li	t4,5
    80008818:	e75ff06f          	j	8000868c <__memset+0x84>
    8000881c:	00600e93          	li	t4,6
    80008820:	e6dff06f          	j	8000868c <__memset+0x84>

0000000080008824 <__memmove>:
    80008824:	ff010113          	addi	sp,sp,-16
    80008828:	00813423          	sd	s0,8(sp)
    8000882c:	01010413          	addi	s0,sp,16
    80008830:	0e060863          	beqz	a2,80008920 <__memmove+0xfc>
    80008834:	fff6069b          	addiw	a3,a2,-1
    80008838:	0006881b          	sext.w	a6,a3
    8000883c:	0ea5e863          	bltu	a1,a0,8000892c <__memmove+0x108>
    80008840:	00758713          	addi	a4,a1,7
    80008844:	00a5e7b3          	or	a5,a1,a0
    80008848:	40a70733          	sub	a4,a4,a0
    8000884c:	0077f793          	andi	a5,a5,7
    80008850:	00f73713          	sltiu	a4,a4,15
    80008854:	00174713          	xori	a4,a4,1
    80008858:	0017b793          	seqz	a5,a5
    8000885c:	00e7f7b3          	and	a5,a5,a4
    80008860:	10078863          	beqz	a5,80008970 <__memmove+0x14c>
    80008864:	00900793          	li	a5,9
    80008868:	1107f463          	bgeu	a5,a6,80008970 <__memmove+0x14c>
    8000886c:	0036581b          	srliw	a6,a2,0x3
    80008870:	fff8081b          	addiw	a6,a6,-1
    80008874:	02081813          	slli	a6,a6,0x20
    80008878:	01d85893          	srli	a7,a6,0x1d
    8000887c:	00858813          	addi	a6,a1,8
    80008880:	00058793          	mv	a5,a1
    80008884:	00050713          	mv	a4,a0
    80008888:	01088833          	add	a6,a7,a6
    8000888c:	0007b883          	ld	a7,0(a5)
    80008890:	00878793          	addi	a5,a5,8
    80008894:	00870713          	addi	a4,a4,8
    80008898:	ff173c23          	sd	a7,-8(a4)
    8000889c:	ff0798e3          	bne	a5,a6,8000888c <__memmove+0x68>
    800088a0:	ff867713          	andi	a4,a2,-8
    800088a4:	02071793          	slli	a5,a4,0x20
    800088a8:	0207d793          	srli	a5,a5,0x20
    800088ac:	00f585b3          	add	a1,a1,a5
    800088b0:	40e686bb          	subw	a3,a3,a4
    800088b4:	00f507b3          	add	a5,a0,a5
    800088b8:	06e60463          	beq	a2,a4,80008920 <__memmove+0xfc>
    800088bc:	0005c703          	lbu	a4,0(a1)
    800088c0:	00e78023          	sb	a4,0(a5)
    800088c4:	04068e63          	beqz	a3,80008920 <__memmove+0xfc>
    800088c8:	0015c603          	lbu	a2,1(a1)
    800088cc:	00100713          	li	a4,1
    800088d0:	00c780a3          	sb	a2,1(a5)
    800088d4:	04e68663          	beq	a3,a4,80008920 <__memmove+0xfc>
    800088d8:	0025c603          	lbu	a2,2(a1)
    800088dc:	00200713          	li	a4,2
    800088e0:	00c78123          	sb	a2,2(a5)
    800088e4:	02e68e63          	beq	a3,a4,80008920 <__memmove+0xfc>
    800088e8:	0035c603          	lbu	a2,3(a1)
    800088ec:	00300713          	li	a4,3
    800088f0:	00c781a3          	sb	a2,3(a5)
    800088f4:	02e68663          	beq	a3,a4,80008920 <__memmove+0xfc>
    800088f8:	0045c603          	lbu	a2,4(a1)
    800088fc:	00400713          	li	a4,4
    80008900:	00c78223          	sb	a2,4(a5)
    80008904:	00e68e63          	beq	a3,a4,80008920 <__memmove+0xfc>
    80008908:	0055c603          	lbu	a2,5(a1)
    8000890c:	00500713          	li	a4,5
    80008910:	00c782a3          	sb	a2,5(a5)
    80008914:	00e68663          	beq	a3,a4,80008920 <__memmove+0xfc>
    80008918:	0065c703          	lbu	a4,6(a1)
    8000891c:	00e78323          	sb	a4,6(a5)
    80008920:	00813403          	ld	s0,8(sp)
    80008924:	01010113          	addi	sp,sp,16
    80008928:	00008067          	ret
    8000892c:	02061713          	slli	a4,a2,0x20
    80008930:	02075713          	srli	a4,a4,0x20
    80008934:	00e587b3          	add	a5,a1,a4
    80008938:	f0f574e3          	bgeu	a0,a5,80008840 <__memmove+0x1c>
    8000893c:	02069613          	slli	a2,a3,0x20
    80008940:	02065613          	srli	a2,a2,0x20
    80008944:	fff64613          	not	a2,a2
    80008948:	00e50733          	add	a4,a0,a4
    8000894c:	00c78633          	add	a2,a5,a2
    80008950:	fff7c683          	lbu	a3,-1(a5)
    80008954:	fff78793          	addi	a5,a5,-1
    80008958:	fff70713          	addi	a4,a4,-1
    8000895c:	00d70023          	sb	a3,0(a4)
    80008960:	fec798e3          	bne	a5,a2,80008950 <__memmove+0x12c>
    80008964:	00813403          	ld	s0,8(sp)
    80008968:	01010113          	addi	sp,sp,16
    8000896c:	00008067          	ret
    80008970:	02069713          	slli	a4,a3,0x20
    80008974:	02075713          	srli	a4,a4,0x20
    80008978:	00170713          	addi	a4,a4,1
    8000897c:	00e50733          	add	a4,a0,a4
    80008980:	00050793          	mv	a5,a0
    80008984:	0005c683          	lbu	a3,0(a1)
    80008988:	00178793          	addi	a5,a5,1
    8000898c:	00158593          	addi	a1,a1,1
    80008990:	fed78fa3          	sb	a3,-1(a5)
    80008994:	fee798e3          	bne	a5,a4,80008984 <__memmove+0x160>
    80008998:	f89ff06f          	j	80008920 <__memmove+0xfc>

000000008000899c <__putc>:
    8000899c:	fe010113          	addi	sp,sp,-32
    800089a0:	00813823          	sd	s0,16(sp)
    800089a4:	00113c23          	sd	ra,24(sp)
    800089a8:	02010413          	addi	s0,sp,32
    800089ac:	00050793          	mv	a5,a0
    800089b0:	fef40593          	addi	a1,s0,-17
    800089b4:	00100613          	li	a2,1
    800089b8:	00000513          	li	a0,0
    800089bc:	fef407a3          	sb	a5,-17(s0)
    800089c0:	fffff097          	auipc	ra,0xfffff
    800089c4:	b3c080e7          	jalr	-1220(ra) # 800074fc <console_write>
    800089c8:	01813083          	ld	ra,24(sp)
    800089cc:	01013403          	ld	s0,16(sp)
    800089d0:	02010113          	addi	sp,sp,32
    800089d4:	00008067          	ret

00000000800089d8 <__getc>:
    800089d8:	fe010113          	addi	sp,sp,-32
    800089dc:	00813823          	sd	s0,16(sp)
    800089e0:	00113c23          	sd	ra,24(sp)
    800089e4:	02010413          	addi	s0,sp,32
    800089e8:	fe840593          	addi	a1,s0,-24
    800089ec:	00100613          	li	a2,1
    800089f0:	00000513          	li	a0,0
    800089f4:	fffff097          	auipc	ra,0xfffff
    800089f8:	ae8080e7          	jalr	-1304(ra) # 800074dc <console_read>
    800089fc:	fe844503          	lbu	a0,-24(s0)
    80008a00:	01813083          	ld	ra,24(sp)
    80008a04:	01013403          	ld	s0,16(sp)
    80008a08:	02010113          	addi	sp,sp,32
    80008a0c:	00008067          	ret

0000000080008a10 <console_handler>:
    80008a10:	fe010113          	addi	sp,sp,-32
    80008a14:	00813823          	sd	s0,16(sp)
    80008a18:	00113c23          	sd	ra,24(sp)
    80008a1c:	00913423          	sd	s1,8(sp)
    80008a20:	02010413          	addi	s0,sp,32
    80008a24:	14202773          	csrr	a4,scause
    80008a28:	100027f3          	csrr	a5,sstatus
    80008a2c:	0027f793          	andi	a5,a5,2
    80008a30:	06079e63          	bnez	a5,80008aac <console_handler+0x9c>
    80008a34:	00074c63          	bltz	a4,80008a4c <console_handler+0x3c>
    80008a38:	01813083          	ld	ra,24(sp)
    80008a3c:	01013403          	ld	s0,16(sp)
    80008a40:	00813483          	ld	s1,8(sp)
    80008a44:	02010113          	addi	sp,sp,32
    80008a48:	00008067          	ret
    80008a4c:	0ff77713          	andi	a4,a4,255
    80008a50:	00900793          	li	a5,9
    80008a54:	fef712e3          	bne	a4,a5,80008a38 <console_handler+0x28>
    80008a58:	ffffe097          	auipc	ra,0xffffe
    80008a5c:	6dc080e7          	jalr	1756(ra) # 80007134 <plic_claim>
    80008a60:	00a00793          	li	a5,10
    80008a64:	00050493          	mv	s1,a0
    80008a68:	02f50c63          	beq	a0,a5,80008aa0 <console_handler+0x90>
    80008a6c:	fc0506e3          	beqz	a0,80008a38 <console_handler+0x28>
    80008a70:	00050593          	mv	a1,a0
    80008a74:	00001517          	auipc	a0,0x1
    80008a78:	d5c50513          	addi	a0,a0,-676 # 800097d0 <CONSOLE_STATUS+0x7c0>
    80008a7c:	fffff097          	auipc	ra,0xfffff
    80008a80:	afc080e7          	jalr	-1284(ra) # 80007578 <__printf>
    80008a84:	01013403          	ld	s0,16(sp)
    80008a88:	01813083          	ld	ra,24(sp)
    80008a8c:	00048513          	mv	a0,s1
    80008a90:	00813483          	ld	s1,8(sp)
    80008a94:	02010113          	addi	sp,sp,32
    80008a98:	ffffe317          	auipc	t1,0xffffe
    80008a9c:	6d430067          	jr	1748(t1) # 8000716c <plic_complete>
    80008aa0:	fffff097          	auipc	ra,0xfffff
    80008aa4:	3e0080e7          	jalr	992(ra) # 80007e80 <uartintr>
    80008aa8:	fddff06f          	j	80008a84 <console_handler+0x74>
    80008aac:	00001517          	auipc	a0,0x1
    80008ab0:	e2450513          	addi	a0,a0,-476 # 800098d0 <digits+0x78>
    80008ab4:	fffff097          	auipc	ra,0xfffff
    80008ab8:	a68080e7          	jalr	-1432(ra) # 8000751c <panic>
	...
