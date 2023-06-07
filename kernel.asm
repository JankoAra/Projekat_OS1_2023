
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000c117          	auipc	sp,0xc
    80000004:	aa013103          	ld	sp,-1376(sp) # 8000baa0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	485060ef          	jal	ra,80006ca0 <start>

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
    80001184:	485000ef          	jal	ra,80001e08 <interruptRoutine>

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
    80001664:	4d07c783          	lbu	a5,1232(a5) # 8000bb30 <_ZN8KConsole11initializedE>
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
    80001688:	4ac48493          	addi	s1,s1,1196 # 8000bb30 <_ZN8KConsole11initializedE>
    8000168c:	0000a797          	auipc	a5,0xa
    80001690:	3e47b783          	ld	a5,996(a5) # 8000ba70 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001694:	0007b783          	ld	a5,0(a5)
    80001698:	00f4b423          	sd	a5,8(s1)
	sr = (uint8*)CONSOLE_STATUS;
    8000169c:	0000a797          	auipc	a5,0xa
    800016a0:	3e47b783          	ld	a5,996(a5) # 8000ba80 <_GLOBAL_OFFSET_TABLE_+0x18>
    800016a4:	0007b783          	ld	a5,0(a5)
    800016a8:	00f4b823          	sd	a5,16(s1)
	sem_open(&inputBufferHasSpace, capacity);
    800016ac:	01e00593          	li	a1,30
    800016b0:	0000a517          	auipc	a0,0xa
    800016b4:	49850513          	addi	a0,a0,1176 # 8000bb48 <_ZN8KConsole19inputBufferHasSpaceE>
    800016b8:	00000097          	auipc	ra,0x0
    800016bc:	de8080e7          	jalr	-536(ra) # 800014a0 <_Z8sem_openPP4KSemj>
	sem_open(&outputBufferHasSpace, capacity);
    800016c0:	01e00593          	li	a1,30
    800016c4:	0000a517          	auipc	a0,0xa
    800016c8:	48c50513          	addi	a0,a0,1164 # 8000bb50 <_ZN8KConsole20outputBufferHasSpaceE>
    800016cc:	00000097          	auipc	ra,0x0
    800016d0:	dd4080e7          	jalr	-556(ra) # 800014a0 <_Z8sem_openPP4KSemj>
	sem_open(&charsToInput, 0);
    800016d4:	00000593          	li	a1,0
    800016d8:	0000a517          	auipc	a0,0xa
    800016dc:	48050513          	addi	a0,a0,1152 # 8000bb58 <_ZN8KConsole12charsToInputE>
    800016e0:	00000097          	auipc	ra,0x0
    800016e4:	dc0080e7          	jalr	-576(ra) # 800014a0 <_Z8sem_openPP4KSemj>
	sem_open(&charsToOutput, 0);
    800016e8:	00000593          	li	a1,0
    800016ec:	0000a517          	auipc	a0,0xa
    800016f0:	47450513          	addi	a0,a0,1140 # 8000bb60 <_ZN8KConsole13charsToOutputE>
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
    80001738:	31c080e7          	jalr	796(ra) # 80005a50 <_Z11printStringPKc>
	printInteger((uint64)dr);
    8000173c:	0000a497          	auipc	s1,0xa
    80001740:	3f448493          	addi	s1,s1,1012 # 8000bb30 <_ZN8KConsole11initializedE>
    80001744:	0084b503          	ld	a0,8(s1)
    80001748:	00000097          	auipc	ra,0x0
    8000174c:	250080e7          	jalr	592(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    80001750:	00008517          	auipc	a0,0x8
    80001754:	e3850513          	addi	a0,a0,-456 # 80009588 <CONSOLE_STATUS+0x578>
    80001758:	00004097          	auipc	ra,0x4
    8000175c:	2f8080e7          	jalr	760(ra) # 80005a50 <_Z11printStringPKc>
	printString("CONSOLE_STATUS = ");
    80001760:	00008517          	auipc	a0,0x8
    80001764:	8d050513          	addi	a0,a0,-1840 # 80009030 <CONSOLE_STATUS+0x20>
    80001768:	00004097          	auipc	ra,0x4
    8000176c:	2e8080e7          	jalr	744(ra) # 80005a50 <_Z11printStringPKc>
	printInteger((uint64)sr);
    80001770:	0104b503          	ld	a0,16(s1)
    80001774:	00000097          	auipc	ra,0x0
    80001778:	224080e7          	jalr	548(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    8000177c:	00008517          	auipc	a0,0x8
    80001780:	e0c50513          	addi	a0,a0,-500 # 80009588 <CONSOLE_STATUS+0x578>
    80001784:	00004097          	auipc	ra,0x4
    80001788:	2cc080e7          	jalr	716(ra) # 80005a50 <_Z11printStringPKc>
	printString("*CONSOLE_RX = ");
    8000178c:	00008517          	auipc	a0,0x8
    80001790:	8bc50513          	addi	a0,a0,-1860 # 80009048 <CONSOLE_STATUS+0x38>
    80001794:	00004097          	auipc	ra,0x4
    80001798:	2bc080e7          	jalr	700(ra) # 80005a50 <_Z11printStringPKc>
	printInteger(*dr);
    8000179c:	0084b783          	ld	a5,8(s1)
    800017a0:	0007c503          	lbu	a0,0(a5)
    800017a4:	00000097          	auipc	ra,0x0
    800017a8:	1f4080e7          	jalr	500(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    800017ac:	00008517          	auipc	a0,0x8
    800017b0:	ddc50513          	addi	a0,a0,-548 # 80009588 <CONSOLE_STATUS+0x578>
    800017b4:	00004097          	auipc	ra,0x4
    800017b8:	29c080e7          	jalr	668(ra) # 80005a50 <_Z11printStringPKc>
	printString("*CONSOLE_STATUS = ");
    800017bc:	00008517          	auipc	a0,0x8
    800017c0:	89c50513          	addi	a0,a0,-1892 # 80009058 <CONSOLE_STATUS+0x48>
    800017c4:	00004097          	auipc	ra,0x4
    800017c8:	28c080e7          	jalr	652(ra) # 80005a50 <_Z11printStringPKc>
	printInteger(*sr);
    800017cc:	0104b783          	ld	a5,16(s1)
    800017d0:	0007c503          	lbu	a0,0(a5)
    800017d4:	00000097          	auipc	ra,0x0
    800017d8:	1c4080e7          	jalr	452(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    800017dc:	00008517          	auipc	a0,0x8
    800017e0:	dac50513          	addi	a0,a0,-596 # 80009588 <CONSOLE_STATUS+0x578>
    800017e4:	00004097          	auipc	ra,0x4
    800017e8:	26c080e7          	jalr	620(ra) # 80005a50 <_Z11printStringPKc>
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
    80001818:	31c48493          	addi	s1,s1,796 # 8000bb30 <_ZN8KConsole11initializedE>
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
    8000185c:	33872703          	lw	a4,824(a4) # 8000bb90 <_ZN8KConsole15inputBufferSizeE>
    80001860:	01e00793          	li	a5,30
    80001864:	04f70e63          	beq	a4,a5,800018c0 <_ZN8KConsole12placeInInputEc+0x68>
void KConsole::placeInInput(char c) {
    80001868:	ff010113          	addi	sp,sp,-16
    8000186c:	00113423          	sd	ra,8(sp)
    80001870:	00813023          	sd	s0,0(sp)
    80001874:	01010413          	addi	s0,sp,16
	inputBuffer[inputTail] = c;
    80001878:	0000a697          	auipc	a3,0xa
    8000187c:	2b868693          	addi	a3,a3,696 # 8000bb30 <_ZN8KConsole11initializedE>
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
    800018e4:	25048493          	addi	s1,s1,592 # 8000bb30 <_ZN8KConsole11initializedE>
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
    8000194c:	1e848493          	addi	s1,s1,488 # 8000bb30 <_ZN8KConsole11initializedE>
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
    800019d0:	1f47b783          	ld	a5,500(a5) # 8000bbc0 <_ZN9Scheduler4tailE>
    800019d4:	00078e63          	beqz	a5,800019f0 <_ZN9Scheduler3putEP3TCB+0x30>
		head = tail = tcb;
	} else {
		tail->nextInScheduler = tcb;
    800019d8:	02a7bc23          	sd	a0,56(a5)
		tail = tcb;
    800019dc:	0000a797          	auipc	a5,0xa
    800019e0:	1ea7b223          	sd	a0,484(a5) # 8000bbc0 <_ZN9Scheduler4tailE>
	}
}
    800019e4:	00813403          	ld	s0,8(sp)
    800019e8:	01010113          	addi	sp,sp,16
    800019ec:	00008067          	ret
		head = tail = tcb;
    800019f0:	0000a797          	auipc	a5,0xa
    800019f4:	1d078793          	addi	a5,a5,464 # 8000bbc0 <_ZN9Scheduler4tailE>
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
    80001a14:	1b070713          	addi	a4,a4,432 # 8000bbc0 <_ZN9Scheduler4tailE>
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
    80001a54:	18083803          	ld	a6,384(a6) # 8000bbd0 <_ZN9Scheduler12sleepingHeadE>
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
    80001a8c:	14a7b423          	sd	a0,328(a5) # 8000bbd0 <_ZN9Scheduler12sleepingHeadE>
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
    80001ad4:	10a7b023          	sd	a0,256(a5) # 8000bbd0 <_ZN9Scheduler12sleepingHeadE>
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
    80001af0:	0e47b783          	ld	a5,228(a5) # 8000bbd0 <_ZN9Scheduler12sleepingHeadE>
    80001af4:	06078a63          	beqz	a5,80001b68 <_ZN9Scheduler4wakeEv+0x7c>
	sleepingHead->timeToSleep--;
    80001af8:	0407b703          	ld	a4,64(a5)
    80001afc:	fff70713          	addi	a4,a4,-1
    80001b00:	04e7b023          	sd	a4,64(a5)
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001b04:	0000a517          	auipc	a0,0xa
    80001b08:	0cc53503          	ld	a0,204(a0) # 8000bbd0 <_ZN9Scheduler12sleepingHeadE>
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
    80001b3c:	08f73c23          	sd	a5,152(a4) # 8000bbd0 <_ZN9Scheduler12sleepingHeadE>
		thread->nextSleeping = nullptr;
    80001b40:	04053423          	sd	zero,72(a0)
		Scheduler::put(thread);
    80001b44:	00000097          	auipc	ra,0x0
    80001b48:	e7c080e7          	jalr	-388(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001b4c:	0000a517          	auipc	a0,0xa
    80001b50:	08453503          	ld	a0,132(a0) # 8000bbd0 <_ZN9Scheduler12sleepingHeadE>
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
    80001b6c:	fb010113          	addi	sp,sp,-80
    80001b70:	04113423          	sd	ra,72(sp)
    80001b74:	04813023          	sd	s0,64(sp)
    80001b78:	02913c23          	sd	s1,56(sp)
    80001b7c:	03213823          	sd	s2,48(sp)
    80001b80:	05010413          	addi	s0,sp,80
	//postavi adresu prekidne rutine u stvec
	Riscv::w_stvec((uint64)&interruptHandler);
    80001b84:	0000a797          	auipc	a5,0xa
    80001b88:	f547b783          	ld	a5,-172(a5) # 8000bad8 <_GLOBAL_OFFSET_TABLE_+0x70>
    80001b8c:	00078513          	mv	a0,a5
    80001b90:	00000097          	auipc	ra,0x0
    80001b94:	224080e7          	jalr	548(ra) # 80001db4 <_ZN5Riscv7w_stvecEm>

	//sem_open(&semA, 0);
	semA = new Semaphore(1);
    80001b98:	01000513          	li	a0,16
    80001b9c:	00001097          	auipc	ra,0x1
    80001ba0:	b1c080e7          	jalr	-1252(ra) # 800026b8 <_Znwm>
    80001ba4:	00050793          	mv	a5,a0
    80001ba8:	00078493          	mv	s1,a5
    80001bac:	00100593          	li	a1,1
    80001bb0:	00048513          	mv	a0,s1
    80001bb4:	00001097          	auipc	ra,0x1
    80001bb8:	df8080e7          	jalr	-520(ra) # 800029ac <_ZN9SemaphoreC1Ej>
    80001bbc:	0000a797          	auipc	a5,0xa
    80001bc0:	01c78793          	addi	a5,a5,28 # 8000bbd8 <semA>
    80001bc4:	0097b023          	sd	s1,0(a5)

	KConsole::initKConsole();
    80001bc8:	00000097          	auipc	ra,0x0
    80001bcc:	a98080e7          	jalr	-1384(ra) # 80001660 <_ZN8KConsole12initKConsoleEv>
//	printInteger(*(lista->peekFirst()));
//	delete lista;
//	println("");

	//testiranje kreiranja niti
	thread_t glavnaNit = nullptr;
    80001bd0:	fc043c23          	sd	zero,-40(s0)
	thread_t nit1 = nullptr;
    80001bd4:	fc043823          	sd	zero,-48(s0)
	thread_t nit2 = nullptr;
    80001bd8:	fc043423          	sd	zero,-56(s0)
	thread_t nit3 = nullptr;
    80001bdc:	fc043023          	sd	zero,-64(s0)
	thread_t idleNit = nullptr;
    80001be0:	fa043c23          	sd	zero,-72(s0)
	thread_t kernelConsumerThread = nullptr;
    80001be4:	fa043823          	sd	zero,-80(s0)
	thread_create(&glavnaNit, nullptr, nullptr);
    80001be8:	fd840793          	addi	a5,s0,-40
    80001bec:	00000613          	li	a2,0
    80001bf0:	00000593          	li	a1,0
    80001bf4:	00078513          	mv	a0,a5
    80001bf8:	fffff097          	auipc	ra,0xfffff
    80001bfc:	788080e7          	jalr	1928(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
	TCB::running = glavnaNit;
    80001c00:	fd843703          	ld	a4,-40(s0)
    80001c04:	0000a797          	auipc	a5,0xa
    80001c08:	ec47b783          	ld	a5,-316(a5) # 8000bac8 <_GLOBAL_OFFSET_TABLE_+0x60>
    80001c0c:	00e7b023          	sd	a4,0(a5)
	thread_create(&idleNit, idle, nullptr);
    80001c10:	fb840793          	addi	a5,s0,-72
    80001c14:	00000613          	li	a2,0
    80001c18:	00000597          	auipc	a1,0x0
    80001c1c:	13058593          	addi	a1,a1,304 # 80001d48 <_Z4idlePv>
    80001c20:	00078513          	mv	a0,a5
    80001c24:	fffff097          	auipc	ra,0xfffff
    80001c28:	75c080e7          	jalr	1884(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
	thread_create(&kernelConsumerThread, kernelConsumerFunction, nullptr);
    80001c2c:	fb040793          	addi	a5,s0,-80
    80001c30:	00000613          	li	a2,0
    80001c34:	00000597          	auipc	a1,0x0
    80001c38:	12458593          	addi	a1,a1,292 # 80001d58 <_Z22kernelConsumerFunctionPv>
    80001c3c:	00078513          	mv	a0,a5
    80001c40:	fffff097          	auipc	ra,0xfffff
    80001c44:	740080e7          	jalr	1856(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
//	q->putLast(nit1);
//	thread_t nitred3 = q->getFirst();
//	thread_t nitred2 = q->getFirst();
//	thread_t nitred1 = q->getFirst();

	thread_create(&nit1, nit1f, nullptr);
    80001c48:	fd040793          	addi	a5,s0,-48
    80001c4c:	00000613          	li	a2,0
    80001c50:	0000a597          	auipc	a1,0xa
    80001c54:	e685b583          	ld	a1,-408(a1) # 8000bab8 <_GLOBAL_OFFSET_TABLE_+0x50>
    80001c58:	00078513          	mv	a0,a5
    80001c5c:	fffff097          	auipc	ra,0xfffff
    80001c60:	724080e7          	jalr	1828(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
	thread_create(&nit2, nit2f, nullptr);
    80001c64:	fc840793          	addi	a5,s0,-56
    80001c68:	00000613          	li	a2,0
    80001c6c:	0000a597          	auipc	a1,0xa
    80001c70:	e245b583          	ld	a1,-476(a1) # 8000ba90 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001c74:	00078513          	mv	a0,a5
    80001c78:	fffff097          	auipc	ra,0xfffff
    80001c7c:	708080e7          	jalr	1800(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
	thread_create(&nit3, nit3f, nullptr);
    80001c80:	fc040793          	addi	a5,s0,-64
    80001c84:	00000613          	li	a2,0
    80001c88:	0000a597          	auipc	a1,0xa
    80001c8c:	e205b583          	ld	a1,-480(a1) # 8000baa8 <_GLOBAL_OFFSET_TABLE_+0x40>
    80001c90:	00078513          	mv	a0,a5
    80001c94:	fffff097          	auipc	ra,0xfffff
    80001c98:	6ec080e7          	jalr	1772(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>

	//omoguci prekide
	Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    80001c9c:	00200513          	li	a0,2
    80001ca0:	00000097          	auipc	ra,0x0
    80001ca4:	130080e7          	jalr	304(ra) # 80001dd0 <_ZN5Riscv10ms_sstatusEm>


//	while (!nitred1->isFinished() || !nitred2->isFinished()) {
//		thread_dispatch();
//	}
	thread_join(nit1);
    80001ca8:	fd043783          	ld	a5,-48(s0)
    80001cac:	00078513          	mv	a0,a5
    80001cb0:	fffff097          	auipc	ra,0xfffff
    80001cb4:	798080e7          	jalr	1944(ra) # 80001448 <_Z11thread_joinP3TCB>
	thread_join(nit2);
    80001cb8:	fc843783          	ld	a5,-56(s0)
    80001cbc:	00078513          	mv	a0,a5
    80001cc0:	fffff097          	auipc	ra,0xfffff
    80001cc4:	788080e7          	jalr	1928(ra) # 80001448 <_Z11thread_joinP3TCB>
	thread_join(nit3);
    80001cc8:	fc043783          	ld	a5,-64(s0)
    80001ccc:	00078513          	mv	a0,a5
    80001cd0:	fffff097          	auipc	ra,0xfffff
    80001cd4:	778080e7          	jalr	1912(ra) # 80001448 <_Z11thread_joinP3TCB>
	//thread_join(idleNit);

	printString("\nGotove user niti\n");
    80001cd8:	00007517          	auipc	a0,0x7
    80001cdc:	39850513          	addi	a0,a0,920 # 80009070 <CONSOLE_STATUS+0x60>
    80001ce0:	00004097          	auipc	ra,0x4
    80001ce4:	d70080e7          	jalr	-656(ra) # 80005a50 <_Z11printStringPKc>


	//KConsole::printConsoleState();
	//KConsole konzola;

	printString("\nSad cu da izadjem\n");
    80001ce8:	00007517          	auipc	a0,0x7
    80001cec:	3a050513          	addi	a0,a0,928 # 80009088 <CONSOLE_STATUS+0x78>
    80001cf0:	00004097          	auipc	ra,0x4
    80001cf4:	d60080e7          	jalr	-672(ra) # 80005a50 <_Z11printStringPKc>
	//zabrani prekide
	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    80001cf8:	00200513          	li	a0,2
    80001cfc:	00000097          	auipc	ra,0x0
    80001d00:	0f0080e7          	jalr	240(ra) # 80001dec <_ZN5Riscv10mc_sstatusEm>
//	thread_create(&userHandle, (TCB::Body)userMain, nullptr);
//	while (!userHandle->isFinished()) {
//		thread_dispatch();
//	}
//	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
	return 0;
    80001d04:	00000793          	li	a5,0
    80001d08:	0240006f          	j	80001d2c <main+0x1c0>
    80001d0c:	00050913          	mv	s2,a0
	semA = new Semaphore(1);
    80001d10:	00048513          	mv	a0,s1
    80001d14:	00001097          	auipc	ra,0x1
    80001d18:	9f4080e7          	jalr	-1548(ra) # 80002708 <_ZdlPv>
    80001d1c:	00090793          	mv	a5,s2
    80001d20:	00078513          	mv	a0,a5
    80001d24:	0000b097          	auipc	ra,0xb
    80001d28:	004080e7          	jalr	4(ra) # 8000cd28 <_Unwind_Resume>
    80001d2c:	00078513          	mv	a0,a5
    80001d30:	04813083          	ld	ra,72(sp)
    80001d34:	04013403          	ld	s0,64(sp)
    80001d38:	03813483          	ld	s1,56(sp)
    80001d3c:	03013903          	ld	s2,48(sp)
    80001d40:	05010113          	addi	sp,sp,80
    80001d44:	00008067          	ret

0000000080001d48 <_Z4idlePv>:
void idle(void*) {
    80001d48:	ff010113          	addi	sp,sp,-16
    80001d4c:	00813423          	sd	s0,8(sp)
    80001d50:	01010413          	addi	s0,sp,16
	while (1) {}
    80001d54:	0000006f          	j	80001d54 <_Z4idlePv+0xc>

0000000080001d58 <_Z22kernelConsumerFunctionPv>:
void kernelConsumerFunction(void*) {
    80001d58:	ff010113          	addi	sp,sp,-16
    80001d5c:	00113423          	sd	ra,8(sp)
    80001d60:	00813023          	sd	s0,0(sp)
    80001d64:	01010413          	addi	s0,sp,16
    80001d68:	0280006f          	j	80001d90 <_Z22kernelConsumerFunctionPv+0x38>
		*KConsole::dr = c;
    80001d6c:	0000a797          	auipc	a5,0xa
    80001d70:	d447b783          	ld	a5,-700(a5) # 8000bab0 <_GLOBAL_OFFSET_TABLE_+0x48>
    80001d74:	0007b783          	ld	a5,0(a5)
    80001d78:	00a78023          	sb	a0,0(a5)
		sem_signal(KConsole::outputBufferHasSpace);
    80001d7c:	0000a797          	auipc	a5,0xa
    80001d80:	d447b783          	ld	a5,-700(a5) # 8000bac0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001d84:	0007b503          	ld	a0,0(a5)
    80001d88:	fffff097          	auipc	ra,0xfffff
    80001d8c:	7b0080e7          	jalr	1968(ra) # 80001538 <_Z10sem_signalP4KSem>
		char c = KConsole::getFromOutput();
    80001d90:	00000097          	auipc	ra,0x0
    80001d94:	a70080e7          	jalr	-1424(ra) # 80001800 <_ZN8KConsole13getFromOutputEv>
		while (!(*KConsole::sr & CONSOLE_TX_STATUS_BIT)) {}
    80001d98:	0000a797          	auipc	a5,0xa
    80001d9c:	d507b783          	ld	a5,-688(a5) # 8000bae8 <_GLOBAL_OFFSET_TABLE_+0x80>
    80001da0:	0007b783          	ld	a5,0(a5)
    80001da4:	0007c783          	lbu	a5,0(a5)
    80001da8:	0207f793          	andi	a5,a5,32
    80001dac:	fe0786e3          	beqz	a5,80001d98 <_Z22kernelConsumerFunctionPv+0x40>
    80001db0:	fbdff06f          	j	80001d6c <_Z22kernelConsumerFunctionPv+0x14>

0000000080001db4 <_ZN5Riscv7w_stvecEm>:
	uint64 volatile stvec;
	__asm__ volatile("csrr %[stvec], stvec": [stvec] "=r"(stvec));
	return stvec;
}

inline void Riscv::w_stvec(uint64 stvec) {
    80001db4:	ff010113          	addi	sp,sp,-16
    80001db8:	00813423          	sd	s0,8(sp)
    80001dbc:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw stvec, %[stvec]": :[stvec] "r"(stvec));
    80001dc0:	10551073          	csrw	stvec,a0
}
    80001dc4:	00813403          	ld	s0,8(sp)
    80001dc8:	01010113          	addi	sp,sp,16
    80001dcc:	00008067          	ret

0000000080001dd0 <_ZN5Riscv10ms_sstatusEm>:

inline void Riscv::w_sip(uint64 sip) {
	__asm__ volatile("csrw sip, %[sip]": :[sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
    80001dd0:	ff010113          	addi	sp,sp,-16
    80001dd4:	00813423          	sd	s0,8(sp)
    80001dd8:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80001ddc:	10052073          	csrs	sstatus,a0
}
    80001de0:	00813403          	ld	s0,8(sp)
    80001de4:	01010113          	addi	sp,sp,16
    80001de8:	00008067          	ret

0000000080001dec <_ZN5Riscv10mc_sstatusEm>:

inline void Riscv::mc_sstatus(uint64 mask) {
    80001dec:	ff010113          	addi	sp,sp,-16
    80001df0:	00813423          	sd	s0,8(sp)
    80001df4:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80001df8:	10053073          	csrc	sstatus,a0
}
    80001dfc:	00813403          	ld	s0,8(sp)
    80001e00:	01010113          	addi	sp,sp,16
    80001e04:	00008067          	ret

0000000080001e08 <interruptRoutine>:
#include "../test/printing.hpp"

//void printInteger(int i);

#pragma GCC optimize("O0")
extern "C" void interruptRoutine() {
    80001e08:	ec010113          	addi	sp,sp,-320
    80001e0c:	12113c23          	sd	ra,312(sp)
    80001e10:	12813823          	sd	s0,304(sp)
    80001e14:	14010413          	addi	s0,sp,320
	uint64 scause, sepc, sstatus;
	__asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001e18:	14202373          	csrr	t1,scause
    80001e1c:	fc643c23          	sd	t1,-40(s0)
	__asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001e20:	14102373          	csrr	t1,sepc
    80001e24:	fc643823          	sd	t1,-48(s0)
	__asm__ volatile("csrr %[status], sstatus":[status] "=r"(
			sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001e28:	10002373          	csrr	t1,sstatus
    80001e2c:	fc643423          	sd	t1,-56(s0)
	uint64 a0, a1, a2, a3, a4, a5, a6, a7;
	__asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001e30:	00050313          	mv	t1,a0
    80001e34:	fc643023          	sd	t1,-64(s0)
	__asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001e38:	00058313          	mv	t1,a1
    80001e3c:	fa643c23          	sd	t1,-72(s0)
	__asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001e40:	00060313          	mv	t1,a2
    80001e44:	fa643823          	sd	t1,-80(s0)
	__asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001e48:	00068313          	mv	t1,a3
    80001e4c:	fa643423          	sd	t1,-88(s0)
	__asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001e50:	00070313          	mv	t1,a4
    80001e54:	fa643023          	sd	t1,-96(s0)
	__asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001e58:	00078313          	mv	t1,a5
    80001e5c:	f8643c23          	sd	t1,-104(s0)
	__asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001e60:	00080313          	mv	t1,a6
    80001e64:	f8643823          	sd	t1,-112(s0)
	__asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001e68:	00088313          	mv	t1,a7
    80001e6c:	f8643423          	sd	t1,-120(s0)

	if (scause == 0x09 || scause == 0x08) {
    80001e70:	fd843703          	ld	a4,-40(s0)
    80001e74:	00900793          	li	a5,9
    80001e78:	00f70863          	beq	a4,a5,80001e88 <interruptRoutine+0x80>
    80001e7c:	fd843703          	ld	a4,-40(s0)
    80001e80:	00800793          	li	a5,8
    80001e84:	50f71663          	bne	a4,a5,80002390 <interruptRoutine+0x588>
		//prekid zbog poziva ecall
		uint64 opCode = a0;
    80001e88:	fc043783          	ld	a5,-64(s0)
    80001e8c:	f6f43c23          	sd	a5,-136(s0)
		switch (opCode) {
    80001e90:	f7843703          	ld	a4,-136(s0)
    80001e94:	09100793          	li	a5,145
    80001e98:	38f70063          	beq	a4,a5,80002218 <interruptRoutine+0x410>
    80001e9c:	f7843703          	ld	a4,-136(s0)
    80001ea0:	09100793          	li	a5,145
    80001ea4:	44e7ee63          	bltu	a5,a4,80002300 <interruptRoutine+0x4f8>
    80001ea8:	f7843703          	ld	a4,-136(s0)
    80001eac:	09000793          	li	a5,144
    80001eb0:	32f70863          	beq	a4,a5,800021e0 <interruptRoutine+0x3d8>
    80001eb4:	f7843703          	ld	a4,-136(s0)
    80001eb8:	09000793          	li	a5,144
    80001ebc:	44e7e263          	bltu	a5,a4,80002300 <interruptRoutine+0x4f8>
    80001ec0:	f7843703          	ld	a4,-136(s0)
    80001ec4:	08100793          	li	a5,129
    80001ec8:	30f70063          	beq	a4,a5,800021c8 <interruptRoutine+0x3c0>
    80001ecc:	f7843703          	ld	a4,-136(s0)
    80001ed0:	08100793          	li	a5,129
    80001ed4:	42e7e663          	bltu	a5,a4,80002300 <interruptRoutine+0x4f8>
    80001ed8:	f7843703          	ld	a4,-136(s0)
    80001edc:	04200793          	li	a5,66
    80001ee0:	04e7e263          	bltu	a5,a4,80001f24 <interruptRoutine+0x11c>
    80001ee4:	f7843783          	ld	a5,-136(s0)
    80001ee8:	40078c63          	beqz	a5,80002300 <interruptRoutine+0x4f8>
    80001eec:	f7843703          	ld	a4,-136(s0)
    80001ef0:	04200793          	li	a5,66
    80001ef4:	40e7e663          	bltu	a5,a4,80002300 <interruptRoutine+0x4f8>
    80001ef8:	f7843783          	ld	a5,-136(s0)
    80001efc:	00279713          	slli	a4,a5,0x2
    80001f00:	00007797          	auipc	a5,0x7
    80001f04:	21478793          	addi	a5,a5,532 # 80009114 <CONSOLE_STATUS+0x104>
    80001f08:	00f707b3          	add	a5,a4,a5
    80001f0c:	0007a783          	lw	a5,0(a5)
    80001f10:	0007871b          	sext.w	a4,a5
    80001f14:	00007797          	auipc	a5,0x7
    80001f18:	20078793          	addi	a5,a5,512 # 80009114 <CONSOLE_STATUS+0x104>
    80001f1c:	00f707b3          	add	a5,a4,a5
    80001f20:	00078067          	jr	a5
    80001f24:	f7843703          	ld	a4,-136(s0)
    80001f28:	08000793          	li	a5,128
    80001f2c:	22f70e63          	beq	a4,a5,80002168 <interruptRoutine+0x360>
    80001f30:	3d00006f          	j	80002300 <interruptRoutine+0x4f8>
			case 0x01:
				//mem_alloc
				size_t size;
				size = (size_t)a1;
    80001f34:	fb843783          	ld	a5,-72(s0)
    80001f38:	ecf43823          	sd	a5,-304(s0)
				//__asm__ volatile("mv %[size], a1":[size] "=r"(size));
				size = size * MEM_BLOCK_SIZE;
    80001f3c:	ed043783          	ld	a5,-304(s0)
    80001f40:	00679793          	slli	a5,a5,0x6
    80001f44:	ecf43823          	sd	a5,-304(s0)
				MemoryAllocator::kmalloc(size);
    80001f48:	00300593          	li	a1,3
    80001f4c:	ed043503          	ld	a0,-304(s0)
    80001f50:	00001097          	auipc	ra,0x1
    80001f54:	f68080e7          	jalr	-152(ra) # 80002eb8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
				__asm__ volatile("sd a0, 80(s0)");
    80001f58:	04a43823          	sd	a0,80(s0)
				break;
    80001f5c:	4100006f          	j	8000236c <interruptRoutine+0x564>
			case 0x02:
				//mem_free
				void* ptr;
				ptr = (void*)a1;
    80001f60:	fb843783          	ld	a5,-72(s0)
    80001f64:	ecf43c23          	sd	a5,-296(s0)
				//__asm__ volatile("mv %[ptr], a1" :[ptr]"=r"(ptr));
				MemoryAllocator::kfree(ptr);
    80001f68:	ed843503          	ld	a0,-296(s0)
    80001f6c:	00001097          	auipc	ra,0x1
    80001f70:	100080e7          	jalr	256(ra) # 8000306c <_ZN15MemoryAllocator5kfreeEPv>
				__asm__ volatile("sd a0, 80(s0)");
    80001f74:	04a43823          	sd	a0,80(s0)
				break;
    80001f78:	3f40006f          	j	8000236c <interruptRoutine+0x564>
			case 0x11:
				//thread_create
				thread_t* handle;
				handle = (thread_t*)a1;
    80001f7c:	fb843783          	ld	a5,-72(s0)
    80001f80:	eef43c23          	sd	a5,-264(s0)
				void (* function)(void*);
				function = (void (*)(void*))a2;
    80001f84:	fb043783          	ld	a5,-80(s0)
    80001f88:	eef43823          	sd	a5,-272(s0)
				void* args;
				args = (void*)a3;
    80001f8c:	fa843783          	ld	a5,-88(s0)
    80001f90:	eef43423          	sd	a5,-280(s0)
				uint64* sp;
				sp = (uint64*)a4;
    80001f94:	fa043783          	ld	a5,-96(s0)
    80001f98:	eef43023          	sd	a5,-288(s0)

				*handle = TCB::createThread(function, args, sp);
    80001f9c:	ee043603          	ld	a2,-288(s0)
    80001fa0:	ee843583          	ld	a1,-280(s0)
    80001fa4:	ef043503          	ld	a0,-272(s0)
    80001fa8:	00001097          	auipc	ra,0x1
    80001fac:	d3c080e7          	jalr	-708(ra) # 80002ce4 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80001fb0:	00050713          	mv	a4,a0
    80001fb4:	ef843783          	ld	a5,-264(s0)
    80001fb8:	00e7b023          	sd	a4,0(a5)
				TCB::start(*handle);
    80001fbc:	ef843783          	ld	a5,-264(s0)
    80001fc0:	0007b783          	ld	a5,0(a5)
    80001fc4:	00078513          	mv	a0,a5
    80001fc8:	00001097          	auipc	ra,0x1
    80001fcc:	e9c080e7          	jalr	-356(ra) # 80002e64 <_ZN3TCB5startEPS_>
				if (*handle != nullptr) {
    80001fd0:	ef843783          	ld	a5,-264(s0)
    80001fd4:	0007b783          	ld	a5,0(a5)
    80001fd8:	00078663          	beqz	a5,80001fe4 <interruptRoutine+0x1dc>
					__asm__ volatile("li a0, 0");
    80001fdc:	00000513          	li	a0,0
    80001fe0:	0080006f          	j	80001fe8 <interruptRoutine+0x1e0>
				} else {
					__asm__ volatile("li a0, -1");
    80001fe4:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    80001fe8:	04a43823          	sd	a0,80(s0)
				break;
    80001fec:	3800006f          	j	8000236c <interruptRoutine+0x564>
			case 0x12:
				//thread_exit
				TCB::running->setFinished(true);
    80001ff0:	0000a797          	auipc	a5,0xa
    80001ff4:	ad87b783          	ld	a5,-1320(a5) # 8000bac8 <_GLOBAL_OFFSET_TABLE_+0x60>
    80001ff8:	0007b783          	ld	a5,0(a5)
    80001ffc:	00100593          	li	a1,1
    80002000:	00078513          	mv	a0,a5
    80002004:	00000097          	auipc	ra,0x0
    80002008:	59c080e7          	jalr	1436(ra) # 800025a0 <_ZN3TCB11setFinishedEb>
				TCB::releaseJoined();
    8000200c:	00001097          	auipc	ra,0x1
    80002010:	dfc080e7          	jalr	-516(ra) # 80002e08 <_ZN3TCB13releaseJoinedEv>
				TCB::yield();
    80002014:	00001097          	auipc	ra,0x1
    80002018:	c68080e7          	jalr	-920(ra) # 80002c7c <_ZN3TCB5yieldEv>
				break;
    8000201c:	3500006f          	j	8000236c <interruptRoutine+0x564>
			case 0x13:
				//thread_dispatch
				TCB::yield();
    80002020:	00001097          	auipc	ra,0x1
    80002024:	c5c080e7          	jalr	-932(ra) # 80002c7c <_ZN3TCB5yieldEv>
				break;
    80002028:	3440006f          	j	8000236c <interruptRoutine+0x564>
			case 0x14:
				//thread_join
				thread_t handleToJoin;
				handleToJoin = (thread_t)a1;
    8000202c:	fb843783          	ld	a5,-72(s0)
    80002030:	f0f43023          	sd	a5,-256(s0)
				TCB::threadJoin(handleToJoin);
    80002034:	f0043503          	ld	a0,-256(s0)
    80002038:	00001097          	auipc	ra,0x1
    8000203c:	d88080e7          	jalr	-632(ra) # 80002dc0 <_ZN3TCB10threadJoinEPS_>
				TCB::yield();
    80002040:	00001097          	auipc	ra,0x1
    80002044:	c3c080e7          	jalr	-964(ra) # 80002c7c <_ZN3TCB5yieldEv>
				break;
    80002048:	3240006f          	j	8000236c <interruptRoutine+0x564>
			case 0x21:
				//sem_open
				sem_t* openHandle;
				openHandle = (sem_t*)a1;
    8000204c:	fb843783          	ld	a5,-72(s0)
    80002050:	f0f43823          	sd	a5,-240(s0)
				uint initVal;
				initVal = (uint)a2;
    80002054:	fb043783          	ld	a5,-80(s0)
    80002058:	f0f42623          	sw	a5,-244(s0)
				*openHandle = KSem::initSem(initVal);
    8000205c:	f0c42783          	lw	a5,-244(s0)
    80002060:	00078513          	mv	a0,a5
    80002064:	00001097          	auipc	ra,0x1
    80002068:	1a4080e7          	jalr	420(ra) # 80003208 <_ZN4KSem7initSemEj>
    8000206c:	00050713          	mv	a4,a0
    80002070:	f1043783          	ld	a5,-240(s0)
    80002074:	00e7b023          	sd	a4,0(a5)
				if (*openHandle != nullptr) {
    80002078:	f1043783          	ld	a5,-240(s0)
    8000207c:	0007b783          	ld	a5,0(a5)
    80002080:	00078663          	beqz	a5,8000208c <interruptRoutine+0x284>
					__asm__ volatile("li a0, 0");
    80002084:	00000513          	li	a0,0
    80002088:	0080006f          	j	80002090 <interruptRoutine+0x288>
				} else {
					__asm__ volatile("li a0, -1");
    8000208c:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    80002090:	04a43823          	sd	a0,80(s0)
				break;
    80002094:	2d80006f          	j	8000236c <interruptRoutine+0x564>
			case 0x22:
				//sem_close
				sem_t closeHandle;
				closeHandle = (sem_t)a1;
    80002098:	fb843783          	ld	a5,-72(s0)
    8000209c:	f0f43c23          	sd	a5,-232(s0)
				KSem::closeSem(closeHandle);
    800020a0:	f1843503          	ld	a0,-232(s0)
    800020a4:	00001097          	auipc	ra,0x1
    800020a8:	32c080e7          	jalr	812(ra) # 800033d0 <_ZN4KSem8closeSemEPS_>
				__asm__ volatile("sd a0, 80(s0)");
    800020ac:	04a43823          	sd	a0,80(s0)
				break;
    800020b0:	2bc0006f          	j	8000236c <interruptRoutine+0x564>
			case 0x23:
				//sem_wait
				sem_t waitHandle;
				waitHandle = (sem_t)a1;
    800020b4:	fb843783          	ld	a5,-72(s0)
    800020b8:	f2f43023          	sd	a5,-224(s0)
				waitHandle->wait();
    800020bc:	f2043503          	ld	a0,-224(s0)
    800020c0:	00001097          	auipc	ra,0x1
    800020c4:	1dc080e7          	jalr	476(ra) # 8000329c <_ZN4KSem4waitEv>
				__asm__ volatile("sd a0, 80(s0)");
    800020c8:	04a43823          	sd	a0,80(s0)
				break;
    800020cc:	2a00006f          	j	8000236c <interruptRoutine+0x564>
			case 0x24:
				//sem_signal
				sem_t signalHandle;
				signalHandle = (sem_t)a1;
    800020d0:	fb843783          	ld	a5,-72(s0)
    800020d4:	f2f43423          	sd	a5,-216(s0)
				signalHandle->signal();
    800020d8:	f2843503          	ld	a0,-216(s0)
    800020dc:	00001097          	auipc	ra,0x1
    800020e0:	278080e7          	jalr	632(ra) # 80003354 <_ZN4KSem6signalEv>
				__asm__ volatile("sd a0, 80(s0)");
    800020e4:	04a43823          	sd	a0,80(s0)
				break;
    800020e8:	2840006f          	j	8000236c <interruptRoutine+0x564>
			case 0x31:
				//time_sleep
				time_t timerPeriods;
				timerPeriods = (time_t)a1;
    800020ec:	fb843783          	ld	a5,-72(s0)
    800020f0:	f2f43823          	sd	a5,-208(s0)
				if (timerPeriods > 0) {
    800020f4:	f3043783          	ld	a5,-208(s0)
    800020f8:	00078663          	beqz	a5,80002104 <interruptRoutine+0x2fc>
					__asm__ volatile("li a0, 0");
    800020fc:	00000513          	li	a0,0
    80002100:	0080006f          	j	80002108 <interruptRoutine+0x300>
				} else {
					__asm__ volatile("li a0, -1");
    80002104:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    80002108:	04a43823          	sd	a0,80(s0)
				if (timerPeriods > 0) {
    8000210c:	f3043783          	ld	a5,-208(s0)
    80002110:	24078463          	beqz	a5,80002358 <interruptRoutine+0x550>
					Scheduler::putToSleep(TCB::running, timerPeriods);
    80002114:	0000a797          	auipc	a5,0xa
    80002118:	9b47b783          	ld	a5,-1612(a5) # 8000bac8 <_GLOBAL_OFFSET_TABLE_+0x60>
    8000211c:	0007b783          	ld	a5,0(a5)
    80002120:	f3043583          	ld	a1,-208(s0)
    80002124:	00078513          	mv	a0,a5
    80002128:	00000097          	auipc	ra,0x0
    8000212c:	91c080e7          	jalr	-1764(ra) # 80001a44 <_ZN9Scheduler10putToSleepEP3TCBm>
					TCB::yield();
    80002130:	00001097          	auipc	ra,0x1
    80002134:	b4c080e7          	jalr	-1204(ra) # 80002c7c <_ZN3TCB5yieldEv>
				}
				break;
    80002138:	2200006f          	j	80002358 <interruptRoutine+0x550>
			case 0x41:
				//getc
				KConsole::kgetc();
    8000213c:	fffff097          	auipc	ra,0xfffff
    80002140:	7f8080e7          	jalr	2040(ra) # 80001934 <_ZN8KConsole5kgetcEv>
				__asm__ volatile("sd a0, 80(s0)");
    80002144:	04a43823          	sd	a0,80(s0)
				break;
    80002148:	2240006f          	j	8000236c <interruptRoutine+0x564>
			case 0x42:
				//putc
				char c;
				c = (char)a1;
    8000214c:	fb843783          	ld	a5,-72(s0)
    80002150:	f2f40fa3          	sb	a5,-193(s0)
				KConsole::kputc(c);
    80002154:	f3f44783          	lbu	a5,-193(s0)
    80002158:	00078513          	mv	a0,a5
    8000215c:	fffff097          	auipc	ra,0xfffff
    80002160:	768080e7          	jalr	1896(ra) # 800018c4 <_ZN8KConsole5kputcEc>
				break;
    80002164:	2080006f          	j	8000236c <interruptRoutine+0x564>
			case 0x80:
				//alloc thread
				thread_t* handleAlloc;
				handleAlloc = (thread_t*)a1;
    80002168:	fb843783          	ld	a5,-72(s0)
    8000216c:	f4f43c23          	sd	a5,-168(s0)
				void (* foo)(void*);
				foo = (void (*)(void*))a2;
    80002170:	fb043783          	ld	a5,-80(s0)
    80002174:	f4f43823          	sd	a5,-176(s0)
				void* argsAlloc;
				argsAlloc = (void*)a3;
    80002178:	fa843783          	ld	a5,-88(s0)
    8000217c:	f4f43423          	sd	a5,-184(s0)
				uint64* spAlloc;
				spAlloc = (uint64*)a4;
    80002180:	fa043783          	ld	a5,-96(s0)
    80002184:	f4f43023          	sd	a5,-192(s0)

				*handleAlloc = TCB::createThread(foo, argsAlloc, spAlloc);
    80002188:	f4043603          	ld	a2,-192(s0)
    8000218c:	f4843583          	ld	a1,-184(s0)
    80002190:	f5043503          	ld	a0,-176(s0)
    80002194:	00001097          	auipc	ra,0x1
    80002198:	b50080e7          	jalr	-1200(ra) # 80002ce4 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    8000219c:	00050713          	mv	a4,a0
    800021a0:	f5843783          	ld	a5,-168(s0)
    800021a4:	00e7b023          	sd	a4,0(a5)
				if (*handleAlloc != nullptr) {
    800021a8:	f5843783          	ld	a5,-168(s0)
    800021ac:	0007b783          	ld	a5,0(a5)
    800021b0:	00078663          	beqz	a5,800021bc <interruptRoutine+0x3b4>
					__asm__ volatile("li a0, 0");
    800021b4:	00000513          	li	a0,0
    800021b8:	0080006f          	j	800021c0 <interruptRoutine+0x3b8>
				} else {
					__asm__ volatile("li a0, -1");
    800021bc:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    800021c0:	04a43823          	sd	a0,80(s0)
				break;
    800021c4:	1a80006f          	j	8000236c <interruptRoutine+0x564>
			case 0x81:
				//start thread
				thread_t threadStartHandle;
				threadStartHandle = (thread_t)a1;
    800021c8:	fb843783          	ld	a5,-72(s0)
    800021cc:	f6f43023          	sd	a5,-160(s0)
				Scheduler::put(threadStartHandle);
    800021d0:	f6043503          	ld	a0,-160(s0)
    800021d4:	fffff097          	auipc	ra,0xfffff
    800021d8:	7ec080e7          	jalr	2028(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
				break;
    800021dc:	1900006f          	j	8000236c <interruptRoutine+0x564>
			case 0x90:
				//printString
				const char* string;
				string = (const char*)a1;
    800021e0:	fb843783          	ld	a5,-72(s0)
    800021e4:	fef43423          	sd	a5,-24(s0)
				while (*string != '\0') {
    800021e8:	fe843783          	ld	a5,-24(s0)
    800021ec:	0007c783          	lbu	a5,0(a5)
    800021f0:	16078863          	beqz	a5,80002360 <interruptRoutine+0x558>
					putc(*string);
    800021f4:	fe843783          	ld	a5,-24(s0)
    800021f8:	0007c783          	lbu	a5,0(a5)
    800021fc:	00078513          	mv	a0,a5
    80002200:	fffff097          	auipc	ra,0xfffff
    80002204:	390080e7          	jalr	912(ra) # 80001590 <_Z4putcc>
					string++;
    80002208:	fe843783          	ld	a5,-24(s0)
    8000220c:	00178793          	addi	a5,a5,1
    80002210:	fef43423          	sd	a5,-24(s0)
				while (*string != '\0') {
    80002214:	fd5ff06f          	j	800021e8 <interruptRoutine+0x3e0>
				}
				break;
			case 0x91:
				//printInteger
				uint64 integer;
				integer = a1;
    80002218:	fb843783          	ld	a5,-72(s0)
    8000221c:	f6f43823          	sd	a5,-144(s0)
				static char digits[] = "0123456789";
				char buf[16];
				int i, neg;
				uint x;

				neg = 0;
    80002220:	f6042623          	sw	zero,-148(s0)
				if (integer < 0) {
					neg = 1;
					x = -integer;
				} else {
					x = integer;
    80002224:	f7043783          	ld	a5,-144(s0)
    80002228:	fef42023          	sw	a5,-32(s0)
				}

				i = 0;
    8000222c:	fe042223          	sw	zero,-28(s0)
				do {
					buf[i++] = digits[x % 10];
    80002230:	fe042703          	lw	a4,-32(s0)
    80002234:	00a00793          	li	a5,10
    80002238:	02f777bb          	remuw	a5,a4,a5
    8000223c:	0007861b          	sext.w	a2,a5
    80002240:	fe442783          	lw	a5,-28(s0)
    80002244:	0017871b          	addiw	a4,a5,1
    80002248:	fee42223          	sw	a4,-28(s0)
    8000224c:	00009697          	auipc	a3,0x9
    80002250:	5ec68693          	addi	a3,a3,1516 # 8000b838 <_ZZ16interruptRoutineE6digits>
    80002254:	02061713          	slli	a4,a2,0x20
    80002258:	02075713          	srli	a4,a4,0x20
    8000225c:	00e68733          	add	a4,a3,a4
    80002260:	00074703          	lbu	a4,0(a4)
    80002264:	ff040693          	addi	a3,s0,-16
    80002268:	00f687b3          	add	a5,a3,a5
    8000226c:	ece78823          	sb	a4,-304(a5)
				} while ((x /= 10) != 0);
    80002270:	fe042703          	lw	a4,-32(s0)
    80002274:	00a00793          	li	a5,10
    80002278:	02f757bb          	divuw	a5,a4,a5
    8000227c:	fef42023          	sw	a5,-32(s0)
    80002280:	fe042783          	lw	a5,-32(s0)
    80002284:	0007879b          	sext.w	a5,a5
    80002288:	00f037b3          	snez	a5,a5
    8000228c:	0ff7f793          	andi	a5,a5,255
    80002290:	00078463          	beqz	a5,80002298 <interruptRoutine+0x490>
				do {
    80002294:	f9dff06f          	j	80002230 <interruptRoutine+0x428>
				if (neg) buf[i++] = '-';
    80002298:	f6c42783          	lw	a5,-148(s0)
    8000229c:	0007879b          	sext.w	a5,a5
    800022a0:	02078063          	beqz	a5,800022c0 <interruptRoutine+0x4b8>
    800022a4:	fe442783          	lw	a5,-28(s0)
    800022a8:	0017871b          	addiw	a4,a5,1
    800022ac:	fee42223          	sw	a4,-28(s0)
    800022b0:	ff040713          	addi	a4,s0,-16
    800022b4:	00f707b3          	add	a5,a4,a5
    800022b8:	02d00713          	li	a4,45
    800022bc:	ece78823          	sb	a4,-304(a5)

				while (--i >= 0) {
    800022c0:	fe442783          	lw	a5,-28(s0)
    800022c4:	fff7879b          	addiw	a5,a5,-1
    800022c8:	fef42223          	sw	a5,-28(s0)
    800022cc:	fe442783          	lw	a5,-28(s0)
    800022d0:	fff7c793          	not	a5,a5
    800022d4:	01f7d79b          	srliw	a5,a5,0x1f
    800022d8:	0ff7f793          	andi	a5,a5,255
    800022dc:	08078663          	beqz	a5,80002368 <interruptRoutine+0x560>
					putc(buf[i]);
    800022e0:	fe442783          	lw	a5,-28(s0)
    800022e4:	ff040713          	addi	a4,s0,-16
    800022e8:	00f707b3          	add	a5,a4,a5
    800022ec:	ed07c783          	lbu	a5,-304(a5)
    800022f0:	00078513          	mv	a0,a5
    800022f4:	fffff097          	auipc	ra,0xfffff
    800022f8:	29c080e7          	jalr	668(ra) # 80001590 <_Z4putcc>
				while (--i >= 0) {
    800022fc:	fc5ff06f          	j	800022c0 <interruptRoutine+0x4b8>
				}
				break;
			default:
				printString("\nNepostojeci op code: ");
    80002300:	00007517          	auipc	a0,0x7
    80002304:	da050513          	addi	a0,a0,-608 # 800090a0 <CONSOLE_STATUS+0x90>
    80002308:	00003097          	auipc	ra,0x3
    8000230c:	748080e7          	jalr	1864(ra) # 80005a50 <_Z11printStringPKc>
				printInteger(opCode);
    80002310:	f7843503          	ld	a0,-136(s0)
    80002314:	fffff097          	auipc	ra,0xfffff
    80002318:	684080e7          	jalr	1668(ra) # 80001998 <_Z12printIntegerm>
				printString("\nscause: ");
    8000231c:	00007517          	auipc	a0,0x7
    80002320:	d9c50513          	addi	a0,a0,-612 # 800090b8 <CONSOLE_STATUS+0xa8>
    80002324:	00003097          	auipc	ra,0x3
    80002328:	72c080e7          	jalr	1836(ra) # 80005a50 <_Z11printStringPKc>
				printInteger(scause);
    8000232c:	fd843503          	ld	a0,-40(s0)
    80002330:	fffff097          	auipc	ra,0xfffff
    80002334:	668080e7          	jalr	1640(ra) # 80001998 <_Z12printIntegerm>
				printString("\nsepc: ");
    80002338:	00007517          	auipc	a0,0x7
    8000233c:	d9050513          	addi	a0,a0,-624 # 800090c8 <CONSOLE_STATUS+0xb8>
    80002340:	00003097          	auipc	ra,0x3
    80002344:	710080e7          	jalr	1808(ra) # 80005a50 <_Z11printStringPKc>
				printInteger(sepc);
    80002348:	fd043503          	ld	a0,-48(s0)
    8000234c:	fffff097          	auipc	ra,0xfffff
    80002350:	64c080e7          	jalr	1612(ra) # 80001998 <_Z12printIntegerm>
				break;
    80002354:	0180006f          	j	8000236c <interruptRoutine+0x564>
				break;
    80002358:	00000013          	nop
    8000235c:	0100006f          	j	8000236c <interruptRoutine+0x564>
				break;
    80002360:	00000013          	nop
    80002364:	0080006f          	j	8000236c <interruptRoutine+0x564>
				break;
    80002368:	00000013          	nop
		}
		//sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
		//sepc += 4;
		__asm__ volatile("addi %[dst], %[src], 0x4":[dst]"=r"(sepc):[src]"r"(
				sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000236c:	fd043303          	ld	t1,-48(s0)
    80002370:	00430313          	addi	t1,t1,4
    80002374:	fc643823          	sd	t1,-48(s0)
		__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002378:	fd043303          	ld	t1,-48(s0)
    8000237c:	14131073          	csrw	sepc,t1
		__asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002380:	fc843303          	ld	t1,-56(s0)
    80002384:	10031073          	csrw	sstatus,t1
    80002388:	00000013          	nop
		printString("scause: ");
		printInteger(scause);
		printString("\nsepc: ");
		printInteger(sepc);
	}
}
    8000238c:	1ac0006f          	j	80002538 <interruptRoutine+0x730>
	} else if (scause == (1UL << 63 | 9)) {
    80002390:	fd843703          	ld	a4,-40(s0)
    80002394:	fff00793          	li	a5,-1
    80002398:	03f79793          	slli	a5,a5,0x3f
    8000239c:	00978793          	addi	a5,a5,9
    800023a0:	0af71263          	bne	a4,a5,80002444 <interruptRoutine+0x63c>
		uint64 irq = plic_claim();
    800023a4:	00005097          	auipc	ra,0x5
    800023a8:	150080e7          	jalr	336(ra) # 800074f4 <plic_claim>
    800023ac:	00050793          	mv	a5,a0
    800023b0:	f8f43023          	sd	a5,-128(s0)
		if (irq == CONSOLE_IRQ) {
    800023b4:	f8043703          	ld	a4,-128(s0)
    800023b8:	00a00793          	li	a5,10
    800023bc:	04f71863          	bne	a4,a5,8000240c <interruptRoutine+0x604>
			if (*KConsole::sr & CONSOLE_RX_STATUS_BIT) {
    800023c0:	00009797          	auipc	a5,0x9
    800023c4:	7287b783          	ld	a5,1832(a5) # 8000bae8 <_GLOBAL_OFFSET_TABLE_+0x80>
    800023c8:	0007b783          	ld	a5,0(a5)
    800023cc:	0007c783          	lbu	a5,0(a5)
    800023d0:	0017f793          	andi	a5,a5,1
    800023d4:	02078063          	beqz	a5,800023f4 <interruptRoutine+0x5ec>
				KConsole::placeInInput(*KConsole::dr);
    800023d8:	00009797          	auipc	a5,0x9
    800023dc:	6d87b783          	ld	a5,1752(a5) # 8000bab0 <_GLOBAL_OFFSET_TABLE_+0x48>
    800023e0:	0007b783          	ld	a5,0(a5)
    800023e4:	0007c783          	lbu	a5,0(a5)
    800023e8:	00078513          	mv	a0,a5
    800023ec:	fffff097          	auipc	ra,0xfffff
    800023f0:	46c080e7          	jalr	1132(ra) # 80001858 <_ZN8KConsole12placeInInputEc>
			plic_complete(irq);
    800023f4:	f8043783          	ld	a5,-128(s0)
    800023f8:	0007879b          	sext.w	a5,a5
    800023fc:	00078513          	mv	a0,a5
    80002400:	00005097          	auipc	ra,0x5
    80002404:	12c080e7          	jalr	300(ra) # 8000752c <plic_complete>
    80002408:	0140006f          	j	8000241c <interruptRoutine+0x614>
			printString("Neki drugi prekid\n");
    8000240c:	00007517          	auipc	a0,0x7
    80002410:	cc450513          	addi	a0,a0,-828 # 800090d0 <CONSOLE_STATUS+0xc0>
    80002414:	00003097          	auipc	ra,0x3
    80002418:	63c080e7          	jalr	1596(ra) # 80005a50 <_Z11printStringPKc>
		Riscv::w_sepc(sepc);
    8000241c:	fd043503          	ld	a0,-48(s0)
    80002420:	00000097          	auipc	ra,0x0
    80002424:	12c080e7          	jalr	300(ra) # 8000254c <_ZN5Riscv6w_sepcEm>
		Riscv::w_sstatus(sstatus);
    80002428:	fc843503          	ld	a0,-56(s0)
    8000242c:	00000097          	auipc	ra,0x0
    80002430:	158080e7          	jalr	344(ra) # 80002584 <_ZN5Riscv9w_sstatusEm>
		Riscv::mc_sip(Riscv::SIP_SEIP);
    80002434:	20000513          	li	a0,512
    80002438:	00000097          	auipc	ra,0x0
    8000243c:	130080e7          	jalr	304(ra) # 80002568 <_ZN5Riscv6mc_sipEm>
}
    80002440:	0f80006f          	j	80002538 <interruptRoutine+0x730>
	} else if (scause == (1UL << 63 | 1)) {
    80002444:	fd843703          	ld	a4,-40(s0)
    80002448:	fff00793          	li	a5,-1
    8000244c:	03f79793          	slli	a5,a5,0x3f
    80002450:	00178793          	addi	a5,a5,1
    80002454:	08f71e63          	bne	a4,a5,800024f0 <interruptRoutine+0x6e8>
		Scheduler::wake();
    80002458:	fffff097          	auipc	ra,0xfffff
    8000245c:	694080e7          	jalr	1684(ra) # 80001aec <_ZN9Scheduler4wakeEv>
		TCB::runningTimeSlice++;
    80002460:	00009797          	auipc	a5,0x9
    80002464:	6187b783          	ld	a5,1560(a5) # 8000ba78 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002468:	0007b783          	ld	a5,0(a5)
    8000246c:	00178713          	addi	a4,a5,1
    80002470:	00009797          	auipc	a5,0x9
    80002474:	6087b783          	ld	a5,1544(a5) # 8000ba78 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002478:	00e7b023          	sd	a4,0(a5)
		if (TCB::runningTimeSlice >= TCB::running->getTimeSlice()) {
    8000247c:	00009797          	auipc	a5,0x9
    80002480:	64c7b783          	ld	a5,1612(a5) # 8000bac8 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002484:	0007b783          	ld	a5,0(a5)
    80002488:	00078513          	mv	a0,a5
    8000248c:	00000097          	auipc	ra,0x0
    80002490:	130080e7          	jalr	304(ra) # 800025bc <_ZN3TCB12getTimeSliceEv>
    80002494:	00050713          	mv	a4,a0
    80002498:	00009797          	auipc	a5,0x9
    8000249c:	5e07b783          	ld	a5,1504(a5) # 8000ba78 <_GLOBAL_OFFSET_TABLE_+0x10>
    800024a0:	0007b783          	ld	a5,0(a5)
    800024a4:	00e7b7b3          	sltu	a5,a5,a4
    800024a8:	0017c793          	xori	a5,a5,1
    800024ac:	0ff7f793          	andi	a5,a5,255
    800024b0:	00078c63          	beqz	a5,800024c8 <interruptRoutine+0x6c0>
			TCB::yield();
    800024b4:	00000097          	auipc	ra,0x0
    800024b8:	7c8080e7          	jalr	1992(ra) # 80002c7c <_ZN3TCB5yieldEv>
			TCB::runningTimeSlice = 0;
    800024bc:	00009797          	auipc	a5,0x9
    800024c0:	5bc7b783          	ld	a5,1468(a5) # 8000ba78 <_GLOBAL_OFFSET_TABLE_+0x10>
    800024c4:	0007b023          	sd	zero,0(a5)
		Riscv::w_sepc(sepc);
    800024c8:	fd043503          	ld	a0,-48(s0)
    800024cc:	00000097          	auipc	ra,0x0
    800024d0:	080080e7          	jalr	128(ra) # 8000254c <_ZN5Riscv6w_sepcEm>
		Riscv::w_sstatus(sstatus);
    800024d4:	fc843503          	ld	a0,-56(s0)
    800024d8:	00000097          	auipc	ra,0x0
    800024dc:	0ac080e7          	jalr	172(ra) # 80002584 <_ZN5Riscv9w_sstatusEm>
		Riscv::mc_sip(Riscv::SIP_SSIP);
    800024e0:	00200513          	li	a0,2
    800024e4:	00000097          	auipc	ra,0x0
    800024e8:	084080e7          	jalr	132(ra) # 80002568 <_ZN5Riscv6mc_sipEm>
}
    800024ec:	04c0006f          	j	80002538 <interruptRoutine+0x730>
		printString("\nGreska u prekidnoj rutini\n");
    800024f0:	00007517          	auipc	a0,0x7
    800024f4:	bf850513          	addi	a0,a0,-1032 # 800090e8 <CONSOLE_STATUS+0xd8>
    800024f8:	00003097          	auipc	ra,0x3
    800024fc:	558080e7          	jalr	1368(ra) # 80005a50 <_Z11printStringPKc>
		printString("scause: ");
    80002500:	00007517          	auipc	a0,0x7
    80002504:	c0850513          	addi	a0,a0,-1016 # 80009108 <CONSOLE_STATUS+0xf8>
    80002508:	00003097          	auipc	ra,0x3
    8000250c:	548080e7          	jalr	1352(ra) # 80005a50 <_Z11printStringPKc>
		printInteger(scause);
    80002510:	fd843503          	ld	a0,-40(s0)
    80002514:	fffff097          	auipc	ra,0xfffff
    80002518:	484080e7          	jalr	1156(ra) # 80001998 <_Z12printIntegerm>
		printString("\nsepc: ");
    8000251c:	00007517          	auipc	a0,0x7
    80002520:	bac50513          	addi	a0,a0,-1108 # 800090c8 <CONSOLE_STATUS+0xb8>
    80002524:	00003097          	auipc	ra,0x3
    80002528:	52c080e7          	jalr	1324(ra) # 80005a50 <_Z11printStringPKc>
		printInteger(sepc);
    8000252c:	fd043503          	ld	a0,-48(s0)
    80002530:	fffff097          	auipc	ra,0xfffff
    80002534:	468080e7          	jalr	1128(ra) # 80001998 <_Z12printIntegerm>
}
    80002538:	00000013          	nop
    8000253c:	13813083          	ld	ra,312(sp)
    80002540:	13013403          	ld	s0,304(sp)
    80002544:	14010113          	addi	sp,sp,320
    80002548:	00008067          	ret

000000008000254c <_ZN5Riscv6w_sepcEm>:
inline void Riscv::w_sepc(uint64 sepc) {
    8000254c:	ff010113          	addi	sp,sp,-16
    80002550:	00813423          	sd	s0,8(sp)
    80002554:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002558:	14151073          	csrw	sepc,a0
}
    8000255c:	00813403          	ld	s0,8(sp)
    80002560:	01010113          	addi	sp,sp,16
    80002564:	00008067          	ret

0000000080002568 <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    80002568:	ff010113          	addi	sp,sp,-16
    8000256c:	00813423          	sd	s0,8(sp)
    80002570:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    80002574:	14453073          	csrc	sip,a0
}
    80002578:	00813403          	ld	s0,8(sp)
    8000257c:	01010113          	addi	sp,sp,16
    80002580:	00008067          	ret

0000000080002584 <_ZN5Riscv9w_sstatusEm>:
	uint64 volatile sstatus;
	__asm__ volatile("csrr %[sstatus], sstatus": [sstatus] "=r"(sstatus));
	return sstatus;
}

inline void Riscv::w_sstatus(uint64 sstatus) {
    80002584:	ff010113          	addi	sp,sp,-16
    80002588:	00813423          	sd	s0,8(sp)
    8000258c:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw sstatus, %[sstatus]": :[sstatus] "r"(sstatus));
    80002590:	10051073          	csrw	sstatus,a0
}
    80002594:	00813403          	ld	s0,8(sp)
    80002598:	01010113          	addi	sp,sp,16
    8000259c:	00008067          	ret

00000000800025a0 <_ZN3TCB11setFinishedEb>:
	static TCB* createThread(Body function, void* args, uint64* stack);
	static void start(TCB* newTcb);

	bool isFinished() { return finished; }

	void setFinished(bool finish) { this->finished = finish; }
    800025a0:	ff010113          	addi	sp,sp,-16
    800025a4:	00813423          	sd	s0,8(sp)
    800025a8:	01010413          	addi	s0,sp,16
    800025ac:	02b50823          	sb	a1,48(a0)
    800025b0:	00813403          	ld	s0,8(sp)
    800025b4:	01010113          	addi	sp,sp,16
    800025b8:	00008067          	ret

00000000800025bc <_ZN3TCB12getTimeSliceEv>:

	bool isBlocked() { return blocked; }

	void setBlocked(bool block) { this->blocked = block; }

	uint64 getTimeSlice() { return timeSlice; }
    800025bc:	ff010113          	addi	sp,sp,-16
    800025c0:	00813423          	sd	s0,8(sp)
    800025c4:	01010413          	addi	s0,sp,16
    800025c8:	02853503          	ld	a0,40(a0)
    800025cc:	00813403          	ld	s0,8(sp)
    800025d0:	01010113          	addi	sp,sp,16
    800025d4:	00008067          	ret

00000000800025d8 <_ZN6Thread7wrapperEPv>:

	__asm__ volatile("ecall");
}

void Thread::wrapper(void* thread) {
	if(thread!=nullptr){
    800025d8:	02050863          	beqz	a0,80002608 <_ZN6Thread7wrapperEPv+0x30>
void Thread::wrapper(void* thread) {
    800025dc:	ff010113          	addi	sp,sp,-16
    800025e0:	00113423          	sd	ra,8(sp)
    800025e4:	00813023          	sd	s0,0(sp)
    800025e8:	01010413          	addi	s0,sp,16
		((Thread*)thread)->run();
    800025ec:	00053783          	ld	a5,0(a0)
    800025f0:	0107b783          	ld	a5,16(a5)
    800025f4:	000780e7          	jalr	a5
	}
}
    800025f8:	00813083          	ld	ra,8(sp)
    800025fc:	00013403          	ld	s0,0(sp)
    80002600:	01010113          	addi	sp,sp,16
    80002604:	00008067          	ret
    80002608:	00008067          	ret

000000008000260c <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    8000260c:	ff010113          	addi	sp,sp,-16
    80002610:	00113423          	sd	ra,8(sp)
    80002614:	00813023          	sd	s0,0(sp)
    80002618:	01010413          	addi	s0,sp,16
    8000261c:	00009797          	auipc	a5,0x9
    80002620:	26c78793          	addi	a5,a5,620 # 8000b888 <_ZTV6Thread+0x10>
    80002624:	00f53023          	sd	a5,0(a0)
	thread_exit();
    80002628:	fffff097          	auipc	ra,0xfffff
    8000262c:	dd8080e7          	jalr	-552(ra) # 80001400 <_Z11thread_exitv>
}
    80002630:	00813083          	ld	ra,8(sp)
    80002634:	00013403          	ld	s0,0(sp)
    80002638:	01010113          	addi	sp,sp,16
    8000263c:	00008067          	ret

0000000080002640 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
	sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    80002640:	fe010113          	addi	sp,sp,-32
    80002644:	00113c23          	sd	ra,24(sp)
    80002648:	00813823          	sd	s0,16(sp)
    8000264c:	00913423          	sd	s1,8(sp)
    80002650:	02010413          	addi	s0,sp,32
    80002654:	00050493          	mv	s1,a0
    80002658:	00009797          	auipc	a5,0x9
    8000265c:	25878793          	addi	a5,a5,600 # 8000b8b0 <_ZTV9Semaphore+0x10>
    80002660:	00f53023          	sd	a5,0(a0)
	sem_close(myHandle);
    80002664:	00853503          	ld	a0,8(a0)
    80002668:	fffff097          	auipc	ra,0xfffff
    8000266c:	e70080e7          	jalr	-400(ra) # 800014d8 <_Z9sem_closeP4KSem>
	delete myHandle;
    80002670:	0084b483          	ld	s1,8(s1)
    80002674:	02048863          	beqz	s1,800026a4 <_ZN9SemaphoreD1Ev+0x64>
			delete node;
		}
	}

	bool isEmpty() const {
		return front == nullptr;
    80002678:	0084b503          	ld	a0,8(s1)
		while (!isEmpty()) {
    8000267c:	00050e63          	beqz	a0,80002698 <_ZN9SemaphoreD1Ev+0x58>
			front = front->next;
    80002680:	00853783          	ld	a5,8(a0)
    80002684:	00f4b423          	sd	a5,8(s1)
			delete node;
    80002688:	fe0508e3          	beqz	a0,80002678 <_ZN9SemaphoreD1Ev+0x38>
			mem_free(ptr);
    8000268c:	fffff097          	auipc	ra,0xfffff
    80002690:	cc4080e7          	jalr	-828(ra) # 80001350 <_Z8mem_freePv>
		}
    80002694:	fe5ff06f          	j	80002678 <_ZN9SemaphoreD1Ev+0x38>
    80002698:	00048513          	mv	a0,s1
    8000269c:	00001097          	auipc	ra,0x1
    800026a0:	b44080e7          	jalr	-1212(ra) # 800031e0 <_ZN4KSemdlEPv>
}
    800026a4:	01813083          	ld	ra,24(sp)
    800026a8:	01013403          	ld	s0,16(sp)
    800026ac:	00813483          	ld	s1,8(sp)
    800026b0:	02010113          	addi	sp,sp,32
    800026b4:	00008067          	ret

00000000800026b8 <_Znwm>:
void* operator new(size_t size) {
    800026b8:	ff010113          	addi	sp,sp,-16
    800026bc:	00113423          	sd	ra,8(sp)
    800026c0:	00813023          	sd	s0,0(sp)
    800026c4:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    800026c8:	fffff097          	auipc	ra,0xfffff
    800026cc:	c48080e7          	jalr	-952(ra) # 80001310 <_Z9mem_allocm>
}
    800026d0:	00813083          	ld	ra,8(sp)
    800026d4:	00013403          	ld	s0,0(sp)
    800026d8:	01010113          	addi	sp,sp,16
    800026dc:	00008067          	ret

00000000800026e0 <_Znam>:
void* operator new[](size_t size) {
    800026e0:	ff010113          	addi	sp,sp,-16
    800026e4:	00113423          	sd	ra,8(sp)
    800026e8:	00813023          	sd	s0,0(sp)
    800026ec:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    800026f0:	fffff097          	auipc	ra,0xfffff
    800026f4:	c20080e7          	jalr	-992(ra) # 80001310 <_Z9mem_allocm>
}
    800026f8:	00813083          	ld	ra,8(sp)
    800026fc:	00013403          	ld	s0,0(sp)
    80002700:	01010113          	addi	sp,sp,16
    80002704:	00008067          	ret

0000000080002708 <_ZdlPv>:
noexcept {
    80002708:	ff010113          	addi	sp,sp,-16
    8000270c:	00113423          	sd	ra,8(sp)
    80002710:	00813023          	sd	s0,0(sp)
    80002714:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80002718:	fffff097          	auipc	ra,0xfffff
    8000271c:	c38080e7          	jalr	-968(ra) # 80001350 <_Z8mem_freePv>
}
    80002720:	00813083          	ld	ra,8(sp)
    80002724:	00013403          	ld	s0,0(sp)
    80002728:	01010113          	addi	sp,sp,16
    8000272c:	00008067          	ret

0000000080002730 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80002730:	fe010113          	addi	sp,sp,-32
    80002734:	00113c23          	sd	ra,24(sp)
    80002738:	00813823          	sd	s0,16(sp)
    8000273c:	00913423          	sd	s1,8(sp)
    80002740:	02010413          	addi	s0,sp,32
    80002744:	00050493          	mv	s1,a0
}
    80002748:	00000097          	auipc	ra,0x0
    8000274c:	ec4080e7          	jalr	-316(ra) # 8000260c <_ZN6ThreadD1Ev>
    80002750:	00048513          	mv	a0,s1
    80002754:	00000097          	auipc	ra,0x0
    80002758:	fb4080e7          	jalr	-76(ra) # 80002708 <_ZdlPv>
    8000275c:	01813083          	ld	ra,24(sp)
    80002760:	01013403          	ld	s0,16(sp)
    80002764:	00813483          	ld	s1,8(sp)
    80002768:	02010113          	addi	sp,sp,32
    8000276c:	00008067          	ret

0000000080002770 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80002770:	fe010113          	addi	sp,sp,-32
    80002774:	00113c23          	sd	ra,24(sp)
    80002778:	00813823          	sd	s0,16(sp)
    8000277c:	00913423          	sd	s1,8(sp)
    80002780:	02010413          	addi	s0,sp,32
    80002784:	00050493          	mv	s1,a0
}
    80002788:	00000097          	auipc	ra,0x0
    8000278c:	eb8080e7          	jalr	-328(ra) # 80002640 <_ZN9SemaphoreD1Ev>
    80002790:	00048513          	mv	a0,s1
    80002794:	00000097          	auipc	ra,0x0
    80002798:	f74080e7          	jalr	-140(ra) # 80002708 <_ZdlPv>
    8000279c:	01813083          	ld	ra,24(sp)
    800027a0:	01013403          	ld	s0,16(sp)
    800027a4:	00813483          	ld	s1,8(sp)
    800027a8:	02010113          	addi	sp,sp,32
    800027ac:	00008067          	ret

00000000800027b0 <_ZdaPv>:
noexcept {
    800027b0:	ff010113          	addi	sp,sp,-16
    800027b4:	00113423          	sd	ra,8(sp)
    800027b8:	00813023          	sd	s0,0(sp)
    800027bc:	01010413          	addi	s0,sp,16
mem_free(ptr);
    800027c0:	fffff097          	auipc	ra,0xfffff
    800027c4:	b90080e7          	jalr	-1136(ra) # 80001350 <_Z8mem_freePv>
}
    800027c8:	00813083          	ld	ra,8(sp)
    800027cc:	00013403          	ld	s0,0(sp)
    800027d0:	01010113          	addi	sp,sp,16
    800027d4:	00008067          	ret

00000000800027d8 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (* body)(void*), void* arg) {
    800027d8:	fd010113          	addi	sp,sp,-48
    800027dc:	02113423          	sd	ra,40(sp)
    800027e0:	02813023          	sd	s0,32(sp)
    800027e4:	00913c23          	sd	s1,24(sp)
    800027e8:	01213823          	sd	s2,16(sp)
    800027ec:	01313423          	sd	s3,8(sp)
    800027f0:	03010413          	addi	s0,sp,48
    800027f4:	00050493          	mv	s1,a0
    800027f8:	00058913          	mv	s2,a1
    800027fc:	00060993          	mv	s3,a2
    80002800:	00009797          	auipc	a5,0x9
    80002804:	08878793          	addi	a5,a5,136 # 8000b888 <_ZTV6Thread+0x10>
    80002808:	00f53023          	sd	a5,0(a0)
	this->body = body;
    8000280c:	00b53823          	sd	a1,16(a0)
	this->arg = arg;
    80002810:	00c53c23          	sd	a2,24(a0)
	if (body != nullptr) {
    80002814:	04058663          	beqz	a1,80002860 <_ZN6ThreadC1EPFvPvES0_+0x88>
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    80002818:	00001537          	lui	a0,0x1
    8000281c:	fffff097          	auipc	ra,0xfffff
    80002820:	af4080e7          	jalr	-1292(ra) # 80001310 <_Z9mem_allocm>
    80002824:	00050313          	mv	t1,a0
	__asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002828:	00030713          	mv	a4,t1
	__asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000282c:	00098693          	mv	a3,s3
			body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002830:	00090613          	mv	a2,s2
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002834:	00848493          	addi	s1,s1,8
    80002838:	00048593          	mv	a1,s1
	__asm__ volatile("li a0, 0x80");
    8000283c:	08000513          	li	a0,128
	__asm__ volatile("ecall");
    80002840:	00000073          	ecall
}
    80002844:	02813083          	ld	ra,40(sp)
    80002848:	02013403          	ld	s0,32(sp)
    8000284c:	01813483          	ld	s1,24(sp)
    80002850:	01013903          	ld	s2,16(sp)
    80002854:	00813983          	ld	s3,8(sp)
    80002858:	03010113          	addi	sp,sp,48
    8000285c:	00008067          	ret
	uint64* stack = nullptr;
    80002860:	00000313          	li	t1,0
    80002864:	fc5ff06f          	j	80002828 <_ZN6ThreadC1EPFvPvES0_+0x50>

0000000080002868 <_ZN6Thread5startEv>:
int Thread::start() {
    80002868:	ff010113          	addi	sp,sp,-16
    8000286c:	00813423          	sd	s0,8(sp)
    80002870:	01010413          	addi	s0,sp,16
	if (myHandle == nullptr) return -1;
    80002874:	00853303          	ld	t1,8(a0) # 1008 <_entry-0x7fffeff8>
    80002878:	02030063          	beqz	t1,80002898 <_ZN6Thread5startEv+0x30>
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000287c:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x81");
    80002880:	08100513          	li	a0,129
	__asm__ volatile("ecall");
    80002884:	00000073          	ecall
	return 0;
    80002888:	00000513          	li	a0,0
}
    8000288c:	00813403          	ld	s0,8(sp)
    80002890:	01010113          	addi	sp,sp,16
    80002894:	00008067          	ret
	if (myHandle == nullptr) return -1;
    80002898:	fff00513          	li	a0,-1
    8000289c:	ff1ff06f          	j	8000288c <_ZN6Thread5startEv+0x24>

00000000800028a0 <_ZN6Thread4joinEv>:
void Thread::join() {
    800028a0:	ff010113          	addi	sp,sp,-16
    800028a4:	00113423          	sd	ra,8(sp)
    800028a8:	00813023          	sd	s0,0(sp)
    800028ac:	01010413          	addi	s0,sp,16
	thread_join(myHandle);
    800028b0:	00853503          	ld	a0,8(a0)
    800028b4:	fffff097          	auipc	ra,0xfffff
    800028b8:	b94080e7          	jalr	-1132(ra) # 80001448 <_Z11thread_joinP3TCB>
}
    800028bc:	00813083          	ld	ra,8(sp)
    800028c0:	00013403          	ld	s0,0(sp)
    800028c4:	01010113          	addi	sp,sp,16
    800028c8:	00008067          	ret

00000000800028cc <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    800028cc:	ff010113          	addi	sp,sp,-16
    800028d0:	00113423          	sd	ra,8(sp)
    800028d4:	00813023          	sd	s0,0(sp)
    800028d8:	01010413          	addi	s0,sp,16
	thread_dispatch();
    800028dc:	fffff097          	auipc	ra,0xfffff
    800028e0:	b4c080e7          	jalr	-1204(ra) # 80001428 <_Z15thread_dispatchv>
}
    800028e4:	00813083          	ld	ra,8(sp)
    800028e8:	00013403          	ld	s0,0(sp)
    800028ec:	01010113          	addi	sp,sp,16
    800028f0:	00008067          	ret

00000000800028f4 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t t) {
    800028f4:	ff010113          	addi	sp,sp,-16
    800028f8:	00113423          	sd	ra,8(sp)
    800028fc:	00813023          	sd	s0,0(sp)
    80002900:	01010413          	addi	s0,sp,16
    80002904:	00050593          	mv	a1,a0
	Scheduler::putToSleep(TCB::running, t);
    80002908:	00009797          	auipc	a5,0x9
    8000290c:	1c07b783          	ld	a5,448(a5) # 8000bac8 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002910:	0007b503          	ld	a0,0(a5)
    80002914:	fffff097          	auipc	ra,0xfffff
    80002918:	130080e7          	jalr	304(ra) # 80001a44 <_ZN9Scheduler10putToSleepEP3TCBm>
}
    8000291c:	00000513          	li	a0,0
    80002920:	00813083          	ld	ra,8(sp)
    80002924:	00013403          	ld	s0,0(sp)
    80002928:	01010113          	addi	sp,sp,16
    8000292c:	00008067          	ret

0000000080002930 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80002930:	fe010113          	addi	sp,sp,-32
    80002934:	00113c23          	sd	ra,24(sp)
    80002938:	00813823          	sd	s0,16(sp)
    8000293c:	00913423          	sd	s1,8(sp)
    80002940:	02010413          	addi	s0,sp,32
    80002944:	00050493          	mv	s1,a0
    80002948:	00009797          	auipc	a5,0x9
    8000294c:	f4078793          	addi	a5,a5,-192 # 8000b888 <_ZTV6Thread+0x10>
    80002950:	00f53023          	sd	a5,0(a0)
	this->body = wrapper;
    80002954:	00000797          	auipc	a5,0x0
    80002958:	c8478793          	addi	a5,a5,-892 # 800025d8 <_ZN6Thread7wrapperEPv>
    8000295c:	00f53823          	sd	a5,16(a0)
	this->arg = this;
    80002960:	00a53c23          	sd	a0,24(a0)
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    80002964:	00001537          	lui	a0,0x1
    80002968:	fffff097          	auipc	ra,0xfffff
    8000296c:	9a8080e7          	jalr	-1624(ra) # 80001310 <_Z9mem_allocm>
    80002970:	00050313          	mv	t1,a0
	__asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002974:	00030713          	mv	a4,t1
	__asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002978:	0184b303          	ld	t1,24(s1)
    8000297c:	00030693          	mv	a3,t1
			body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002980:	0104b303          	ld	t1,16(s1)
    80002984:	00030613          	mv	a2,t1
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002988:	00848493          	addi	s1,s1,8
    8000298c:	00048593          	mv	a1,s1
	__asm__ volatile("li a0, 0x80");
    80002990:	08000513          	li	a0,128
	__asm__ volatile("ecall");
    80002994:	00000073          	ecall
}
    80002998:	01813083          	ld	ra,24(sp)
    8000299c:	01013403          	ld	s0,16(sp)
    800029a0:	00813483          	ld	s1,8(sp)
    800029a4:	02010113          	addi	sp,sp,32
    800029a8:	00008067          	ret

00000000800029ac <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    800029ac:	ff010113          	addi	sp,sp,-16
    800029b0:	00113423          	sd	ra,8(sp)
    800029b4:	00813023          	sd	s0,0(sp)
    800029b8:	01010413          	addi	s0,sp,16
    800029bc:	00009797          	auipc	a5,0x9
    800029c0:	ef478793          	addi	a5,a5,-268 # 8000b8b0 <_ZTV9Semaphore+0x10>
    800029c4:	00f53023          	sd	a5,0(a0) # 1000 <_entry-0x7ffff000>
	sem_open(&myHandle, init);
    800029c8:	00850513          	addi	a0,a0,8
    800029cc:	fffff097          	auipc	ra,0xfffff
    800029d0:	ad4080e7          	jalr	-1324(ra) # 800014a0 <_Z8sem_openPP4KSemj>
}
    800029d4:	00813083          	ld	ra,8(sp)
    800029d8:	00013403          	ld	s0,0(sp)
    800029dc:	01010113          	addi	sp,sp,16
    800029e0:	00008067          	ret

00000000800029e4 <_ZN9Semaphore4waitEv>:

int Semaphore::wait() {
    800029e4:	ff010113          	addi	sp,sp,-16
    800029e8:	00113423          	sd	ra,8(sp)
    800029ec:	00813023          	sd	s0,0(sp)
    800029f0:	01010413          	addi	s0,sp,16
	return sem_wait(myHandle);
    800029f4:	00853503          	ld	a0,8(a0)
    800029f8:	fffff097          	auipc	ra,0xfffff
    800029fc:	b10080e7          	jalr	-1264(ra) # 80001508 <_Z8sem_waitP4KSem>
}
    80002a00:	00813083          	ld	ra,8(sp)
    80002a04:	00013403          	ld	s0,0(sp)
    80002a08:	01010113          	addi	sp,sp,16
    80002a0c:	00008067          	ret

0000000080002a10 <_ZN9Semaphore6signalEv>:

int Semaphore::signal() {
    80002a10:	ff010113          	addi	sp,sp,-16
    80002a14:	00113423          	sd	ra,8(sp)
    80002a18:	00813023          	sd	s0,0(sp)
    80002a1c:	01010413          	addi	s0,sp,16
	return sem_signal(myHandle);
    80002a20:	00853503          	ld	a0,8(a0)
    80002a24:	fffff097          	auipc	ra,0xfffff
    80002a28:	b14080e7          	jalr	-1260(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    80002a2c:	00813083          	ld	ra,8(sp)
    80002a30:	00013403          	ld	s0,0(sp)
    80002a34:	01010113          	addi	sp,sp,16
    80002a38:	00008067          	ret

0000000080002a3c <_ZN14PeriodicThread9terminateEv>:

void PeriodicThread::terminate() {
    80002a3c:	ff010113          	addi	sp,sp,-16
    80002a40:	00813423          	sd	s0,8(sp)
    80002a44:	01010413          	addi	s0,sp,16

}
    80002a48:	00813403          	ld	s0,8(sp)
    80002a4c:	01010113          	addi	sp,sp,16
    80002a50:	00008067          	ret

0000000080002a54 <_ZN14PeriodicThreadC1Em>:

PeriodicThread::PeriodicThread(time_t period) {
    80002a54:	fe010113          	addi	sp,sp,-32
    80002a58:	00113c23          	sd	ra,24(sp)
    80002a5c:	00813823          	sd	s0,16(sp)
    80002a60:	00913423          	sd	s1,8(sp)
    80002a64:	02010413          	addi	s0,sp,32
    80002a68:	00050493          	mv	s1,a0
    80002a6c:	00000097          	auipc	ra,0x0
    80002a70:	ec4080e7          	jalr	-316(ra) # 80002930 <_ZN6ThreadC1Ev>
    80002a74:	00009797          	auipc	a5,0x9
    80002a78:	de478793          	addi	a5,a5,-540 # 8000b858 <_ZTV14PeriodicThread+0x10>
    80002a7c:	00f4b023          	sd	a5,0(s1)

}
    80002a80:	01813083          	ld	ra,24(sp)
    80002a84:	01013403          	ld	s0,16(sp)
    80002a88:	00813483          	ld	s1,8(sp)
    80002a8c:	02010113          	addi	sp,sp,32
    80002a90:	00008067          	ret

0000000080002a94 <_ZN7Console4getcEv>:

char Console::getc() {
    80002a94:	ff010113          	addi	sp,sp,-16
    80002a98:	00813423          	sd	s0,8(sp)
    80002a9c:	01010413          	addi	s0,sp,16
	return 0;
}
    80002aa0:	00000513          	li	a0,0
    80002aa4:	00813403          	ld	s0,8(sp)
    80002aa8:	01010113          	addi	sp,sp,16
    80002aac:	00008067          	ret

0000000080002ab0 <_ZN7Console4putcEc>:

void Console::putc(char) {
    80002ab0:	ff010113          	addi	sp,sp,-16
    80002ab4:	00813423          	sd	s0,8(sp)
    80002ab8:	01010413          	addi	s0,sp,16

}
    80002abc:	00813403          	ld	s0,8(sp)
    80002ac0:	01010113          	addi	sp,sp,16
    80002ac4:	00008067          	ret

0000000080002ac8 <_ZN6Thread3runEv>:
	static int sleep(time_t);

protected:
	Thread();

	virtual void run() {}
    80002ac8:	ff010113          	addi	sp,sp,-16
    80002acc:	00813423          	sd	s0,8(sp)
    80002ad0:	01010413          	addi	s0,sp,16
    80002ad4:	00813403          	ld	s0,8(sp)
    80002ad8:	01010113          	addi	sp,sp,16
    80002adc:	00008067          	ret

0000000080002ae0 <_ZN14PeriodicThread18periodicActivationEv>:
	void terminate();

protected:
	PeriodicThread(time_t period);

	virtual void periodicActivation() {}
    80002ae0:	ff010113          	addi	sp,sp,-16
    80002ae4:	00813423          	sd	s0,8(sp)
    80002ae8:	01010413          	addi	s0,sp,16
    80002aec:	00813403          	ld	s0,8(sp)
    80002af0:	01010113          	addi	sp,sp,16
    80002af4:	00008067          	ret

0000000080002af8 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80002af8:	ff010113          	addi	sp,sp,-16
    80002afc:	00113423          	sd	ra,8(sp)
    80002b00:	00813023          	sd	s0,0(sp)
    80002b04:	01010413          	addi	s0,sp,16
    80002b08:	00009797          	auipc	a5,0x9
    80002b0c:	d5078793          	addi	a5,a5,-688 # 8000b858 <_ZTV14PeriodicThread+0x10>
    80002b10:	00f53023          	sd	a5,0(a0)
    80002b14:	00000097          	auipc	ra,0x0
    80002b18:	af8080e7          	jalr	-1288(ra) # 8000260c <_ZN6ThreadD1Ev>
    80002b1c:	00813083          	ld	ra,8(sp)
    80002b20:	00013403          	ld	s0,0(sp)
    80002b24:	01010113          	addi	sp,sp,16
    80002b28:	00008067          	ret

0000000080002b2c <_ZN14PeriodicThreadD0Ev>:
    80002b2c:	fe010113          	addi	sp,sp,-32
    80002b30:	00113c23          	sd	ra,24(sp)
    80002b34:	00813823          	sd	s0,16(sp)
    80002b38:	00913423          	sd	s1,8(sp)
    80002b3c:	02010413          	addi	s0,sp,32
    80002b40:	00050493          	mv	s1,a0
    80002b44:	00009797          	auipc	a5,0x9
    80002b48:	d1478793          	addi	a5,a5,-748 # 8000b858 <_ZTV14PeriodicThread+0x10>
    80002b4c:	00f53023          	sd	a5,0(a0)
    80002b50:	00000097          	auipc	ra,0x0
    80002b54:	abc080e7          	jalr	-1348(ra) # 8000260c <_ZN6ThreadD1Ev>
    80002b58:	00048513          	mv	a0,s1
    80002b5c:	00000097          	auipc	ra,0x0
    80002b60:	bac080e7          	jalr	-1108(ra) # 80002708 <_ZdlPv>
    80002b64:	01813083          	ld	ra,24(sp)
    80002b68:	01013403          	ld	s0,16(sp)
    80002b6c:	00813483          	ld	s1,8(sp)
    80002b70:	02010113          	addi	sp,sp,32
    80002b74:	00008067          	ret

0000000080002b78 <_ZN3TCB7wrapperEv>:
	Riscv::pushRegisters();
	TCB::dispatch();
	Riscv::popRegisters();
}

void TCB::wrapper() {
    80002b78:	ff010113          	addi	sp,sp,-16
    80002b7c:	00113423          	sd	ra,8(sp)
    80002b80:	00813023          	sd	s0,0(sp)
    80002b84:	01010413          	addi	s0,sp,16
	//pocetak wrappera se izvrsava u supervisor modu,
	//jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch/yield)
	Riscv::popSppSpie();
    80002b88:	00000097          	auipc	ra,0x0
    80002b8c:	310080e7          	jalr	784(ra) # 80002e98 <_ZN5Riscv10popSppSpieEv>
	//na dalje se izvrsavamo u user modu
	running->threadFunction(running->args);
    80002b90:	00009797          	auipc	a5,0x9
    80002b94:	0507b783          	ld	a5,80(a5) # 8000bbe0 <_ZN3TCB7runningE>
    80002b98:	0107b703          	ld	a4,16(a5)
    80002b9c:	0207b503          	ld	a0,32(a5)
    80002ba0:	000700e7          	jalr	a4
	//running->finished = true;
	//i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
	thread_exit();
    80002ba4:	fffff097          	auipc	ra,0xfffff
    80002ba8:	85c080e7          	jalr	-1956(ra) # 80001400 <_Z11thread_exitv>
}
    80002bac:	00813083          	ld	ra,8(sp)
    80002bb0:	00013403          	ld	s0,0(sp)
    80002bb4:	01010113          	addi	sp,sp,16
    80002bb8:	00008067          	ret

0000000080002bbc <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80002bbc:	fe010113          	addi	sp,sp,-32
    80002bc0:	00113c23          	sd	ra,24(sp)
    80002bc4:	00813823          	sd	s0,16(sp)
    80002bc8:	00913423          	sd	s1,8(sp)
    80002bcc:	02010413          	addi	s0,sp,32
	TCB* old = TCB::running;
    80002bd0:	00009497          	auipc	s1,0x9
    80002bd4:	0104b483          	ld	s1,16(s1) # 8000bbe0 <_ZN3TCB7runningE>
	if (!old->finished && !old->blocked && old->timeToSleep == 0 && !old->needToJoin) {
    80002bd8:	0304c783          	lbu	a5,48(s1)
    80002bdc:	00079e63          	bnez	a5,80002bf8 <_ZN3TCB8dispatchEv+0x3c>
    80002be0:	0314c783          	lbu	a5,49(s1)
    80002be4:	00079a63          	bnez	a5,80002bf8 <_ZN3TCB8dispatchEv+0x3c>
    80002be8:	0404b783          	ld	a5,64(s1)
    80002bec:	00079663          	bnez	a5,80002bf8 <_ZN3TCB8dispatchEv+0x3c>
    80002bf0:	0324c783          	lbu	a5,50(s1)
    80002bf4:	04078663          	beqz	a5,80002c40 <_ZN3TCB8dispatchEv+0x84>
	TCB::running = Scheduler::get();
    80002bf8:	fffff097          	auipc	ra,0xfffff
    80002bfc:	e0c080e7          	jalr	-500(ra) # 80001a04 <_ZN9Scheduler3getEv>
    80002c00:	00050593          	mv	a1,a0
    80002c04:	00009797          	auipc	a5,0x9
    80002c08:	fdc78793          	addi	a5,a5,-36 # 8000bbe0 <_ZN3TCB7runningE>
    80002c0c:	00a7b023          	sd	a0,0(a5)
	TCB::runningTimeSlice = 0;
    80002c10:	0007b423          	sd	zero,8(a5)
	if (TCB::running->threadFunction == nullptr || TCB::running->threadFunction == kernelConsumerFunction ||
    80002c14:	01053783          	ld	a5,16(a0)
    80002c18:	02078c63          	beqz	a5,80002c50 <_ZN3TCB8dispatchEv+0x94>
    80002c1c:	00009717          	auipc	a4,0x9
    80002c20:	e7c73703          	ld	a4,-388(a4) # 8000ba98 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002c24:	02e78663          	beq	a5,a4,80002c50 <_ZN3TCB8dispatchEv+0x94>
    80002c28:	00009717          	auipc	a4,0x9
    80002c2c:	eb873703          	ld	a4,-328(a4) # 8000bae0 <_GLOBAL_OFFSET_TABLE_+0x78>
    80002c30:	02e78063          	beq	a5,a4,80002c50 <_ZN3TCB8dispatchEv+0x94>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002c34:	10000793          	li	a5,256
    80002c38:	1007b073          	csrc	sstatus,a5
}
    80002c3c:	01c0006f          	j	80002c58 <_ZN3TCB8dispatchEv+0x9c>
		Scheduler::put(old);
    80002c40:	00048513          	mv	a0,s1
    80002c44:	fffff097          	auipc	ra,0xfffff
    80002c48:	d7c080e7          	jalr	-644(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
    80002c4c:	fadff06f          	j	80002bf8 <_ZN3TCB8dispatchEv+0x3c>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80002c50:	10000793          	li	a5,256
    80002c54:	1007a073          	csrs	sstatus,a5
	if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    80002c58:	00b48863          	beq	s1,a1,80002c68 <_ZN3TCB8dispatchEv+0xac>
    80002c5c:	00048513          	mv	a0,s1
    80002c60:	ffffe097          	auipc	ra,0xffffe
    80002c64:	5b0080e7          	jalr	1456(ra) # 80001210 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80002c68:	01813083          	ld	ra,24(sp)
    80002c6c:	01013403          	ld	s0,16(sp)
    80002c70:	00813483          	ld	s1,8(sp)
    80002c74:	02010113          	addi	sp,sp,32
    80002c78:	00008067          	ret

0000000080002c7c <_ZN3TCB5yieldEv>:
void TCB::yield() {
    80002c7c:	ff010113          	addi	sp,sp,-16
    80002c80:	00113423          	sd	ra,8(sp)
    80002c84:	00813023          	sd	s0,0(sp)
    80002c88:	01010413          	addi	s0,sp,16
	Riscv::pushRegisters();
    80002c8c:	ffffe097          	auipc	ra,0xffffe
    80002c90:	374080e7          	jalr	884(ra) # 80001000 <_ZN5Riscv13pushRegistersEv>
	TCB::dispatch();
    80002c94:	00000097          	auipc	ra,0x0
    80002c98:	f28080e7          	jalr	-216(ra) # 80002bbc <_ZN3TCB8dispatchEv>
	Riscv::popRegisters();
    80002c9c:	ffffe097          	auipc	ra,0xffffe
    80002ca0:	3e0080e7          	jalr	992(ra) # 8000107c <_ZN5Riscv12popRegistersEv>
}
    80002ca4:	00813083          	ld	ra,8(sp)
    80002ca8:	00013403          	ld	s0,0(sp)
    80002cac:	01010113          	addi	sp,sp,16
    80002cb0:	00008067          	ret

0000000080002cb4 <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    80002cb4:	ff010113          	addi	sp,sp,-16
    80002cb8:	00113423          	sd	ra,8(sp)
    80002cbc:	00813023          	sd	s0,0(sp)
    80002cc0:	01010413          	addi	s0,sp,16
	return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::THREAD);
    80002cc4:	00200593          	li	a1,2
    80002cc8:	02050513          	addi	a0,a0,32
    80002ccc:	00000097          	auipc	ra,0x0
    80002cd0:	1ec080e7          	jalr	492(ra) # 80002eb8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
}
    80002cd4:	00813083          	ld	ra,8(sp)
    80002cd8:	00013403          	ld	s0,0(sp)
    80002cdc:	01010113          	addi	sp,sp,16
    80002ce0:	00008067          	ret

0000000080002ce4 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    80002ce4:	fd010113          	addi	sp,sp,-48
    80002ce8:	02113423          	sd	ra,40(sp)
    80002cec:	02813023          	sd	s0,32(sp)
    80002cf0:	00913c23          	sd	s1,24(sp)
    80002cf4:	01213823          	sd	s2,16(sp)
    80002cf8:	01313423          	sd	s3,8(sp)
    80002cfc:	03010413          	addi	s0,sp,48
    80002d00:	00050913          	mv	s2,a0
    80002d04:	00058993          	mv	s3,a1
    80002d08:	00060493          	mv	s1,a2
	TCB* newThread = new TCB(function, args, stack);
    80002d0c:	06000513          	li	a0,96
    80002d10:	00000097          	auipc	ra,0x0
    80002d14:	fa4080e7          	jalr	-92(ra) # 80002cb4 <_ZN3TCBnwEm>


	TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
													timeSlice(DEFAULT_TIME_SLICE), finished(false), blocked(false),
													needToJoin(false),
													nextInScheduler(nullptr), timeToSleep(0), nextSleeping(nullptr) {
    80002d18:	01253823          	sd	s2,16(a0)
    80002d1c:	00953c23          	sd	s1,24(a0)
    80002d20:	03353023          	sd	s3,32(a0)
    80002d24:	00200793          	li	a5,2
    80002d28:	02f53423          	sd	a5,40(a0)
    80002d2c:	02050823          	sb	zero,48(a0)
    80002d30:	020508a3          	sb	zero,49(a0)
    80002d34:	02050923          	sb	zero,50(a0)
    80002d38:	02053c23          	sd	zero,56(a0)
    80002d3c:	04053023          	sd	zero,64(a0)
    80002d40:	04053423          	sd	zero,72(a0)
	ThreadQueue() : front(nullptr), back(nullptr) {}
    80002d44:	04053823          	sd	zero,80(a0)
    80002d48:	04053c23          	sd	zero,88(a0)
		//formiranje pocetnog konteksta; specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80002d4c:	02090e63          	beqz	s2,80002d88 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xa4>
    80002d50:	00000797          	auipc	a5,0x0
    80002d54:	e2878793          	addi	a5,a5,-472 # 80002b78 <_ZN3TCB7wrapperEv>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80002d58:	02048c63          	beqz	s1,80002d90 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xac>
    80002d5c:	00008637          	lui	a2,0x8
    80002d60:	00c484b3          	add	s1,s1,a2
		this->context.ra = startRa;
    80002d64:	00f53023          	sd	a5,0(a0)
		this->context.sp = startSp;
    80002d68:	00953423          	sd	s1,8(a0)
}
    80002d6c:	02813083          	ld	ra,40(sp)
    80002d70:	02013403          	ld	s0,32(sp)
    80002d74:	01813483          	ld	s1,24(sp)
    80002d78:	01013903          	ld	s2,16(sp)
    80002d7c:	00813983          	ld	s3,8(sp)
    80002d80:	03010113          	addi	sp,sp,48
    80002d84:	00008067          	ret
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80002d88:	00000793          	li	a5,0
    80002d8c:	fcdff06f          	j	80002d58 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x74>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80002d90:	00000493          	li	s1,0
    80002d94:	fd1ff06f          	j	80002d64 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x80>

0000000080002d98 <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    80002d98:	ff010113          	addi	sp,sp,-16
    80002d9c:	00113423          	sd	ra,8(sp)
    80002da0:	00813023          	sd	s0,0(sp)
    80002da4:	01010413          	addi	s0,sp,16
	MemoryAllocator::kfree(ptr);
    80002da8:	00000097          	auipc	ra,0x0
    80002dac:	2c4080e7          	jalr	708(ra) # 8000306c <_ZN15MemoryAllocator5kfreeEPv>
}
    80002db0:	00813083          	ld	ra,8(sp)
    80002db4:	00013403          	ld	s0,0(sp)
    80002db8:	01010113          	addi	sp,sp,16
    80002dbc:	00008067          	ret

0000000080002dc0 <_ZN3TCB10threadJoinEPS_>:

void TCB::threadJoin(TCB* handle) {
	if (handle->finished) return;
    80002dc0:	03054783          	lbu	a5,48(a0)
    80002dc4:	00078463          	beqz	a5,80002dcc <_ZN3TCB10threadJoinEPS_+0xc>
    80002dc8:	00008067          	ret
void TCB::threadJoin(TCB* handle) {
    80002dcc:	ff010113          	addi	sp,sp,-16
    80002dd0:	00113423          	sd	ra,8(sp)
    80002dd4:	00813023          	sd	s0,0(sp)
    80002dd8:	01010413          	addi	s0,sp,16
	TCB::running->needToJoin = true;
    80002ddc:	00009597          	auipc	a1,0x9
    80002de0:	e045b583          	ld	a1,-508(a1) # 8000bbe0 <_ZN3TCB7runningE>
    80002de4:	00100793          	li	a5,1
    80002de8:	02f58923          	sb	a5,50(a1)
	handle->waitingToJoin.putLast(TCB::running);
    80002dec:	05050513          	addi	a0,a0,80
    80002df0:	ffffe097          	auipc	ra,0xffffe
    80002df4:	454080e7          	jalr	1108(ra) # 80001244 <_ZN11ThreadQueue7putLastEP3TCB>
}
    80002df8:	00813083          	ld	ra,8(sp)
    80002dfc:	00013403          	ld	s0,0(sp)
    80002e00:	01010113          	addi	sp,sp,16
    80002e04:	00008067          	ret

0000000080002e08 <_ZN3TCB13releaseJoinedEv>:

void TCB::releaseJoined() {
	while (!TCB::running->waitingToJoin.isEmpty()) {
    80002e08:	00009517          	auipc	a0,0x9
    80002e0c:	dd853503          	ld	a0,-552(a0) # 8000bbe0 <_ZN3TCB7runningE>
		return front == nullptr;
    80002e10:	05053783          	ld	a5,80(a0)
    80002e14:	04078663          	beqz	a5,80002e60 <_ZN3TCB13releaseJoinedEv+0x58>
void TCB::releaseJoined() {
    80002e18:	ff010113          	addi	sp,sp,-16
    80002e1c:	00113423          	sd	ra,8(sp)
    80002e20:	00813023          	sd	s0,0(sp)
    80002e24:	01010413          	addi	s0,sp,16
		TCB* tcb = TCB::running->waitingToJoin.getFirst();
    80002e28:	05050513          	addi	a0,a0,80
    80002e2c:	ffffe097          	auipc	ra,0xffffe
    80002e30:	484080e7          	jalr	1156(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
		tcb->needToJoin = false;
    80002e34:	02050923          	sb	zero,50(a0)
		Scheduler::put(tcb);
    80002e38:	fffff097          	auipc	ra,0xfffff
    80002e3c:	b88080e7          	jalr	-1144(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
	while (!TCB::running->waitingToJoin.isEmpty()) {
    80002e40:	00009517          	auipc	a0,0x9
    80002e44:	da053503          	ld	a0,-608(a0) # 8000bbe0 <_ZN3TCB7runningE>
    80002e48:	05053783          	ld	a5,80(a0)
    80002e4c:	fc079ee3          	bnez	a5,80002e28 <_ZN3TCB13releaseJoinedEv+0x20>
	}
}
    80002e50:	00813083          	ld	ra,8(sp)
    80002e54:	00013403          	ld	s0,0(sp)
    80002e58:	01010113          	addi	sp,sp,16
    80002e5c:	00008067          	ret
    80002e60:	00008067          	ret

0000000080002e64 <_ZN3TCB5startEPS_>:

void TCB::start(TCB* newTcb) {
	//startovanje niti(stavljanje u Scheduler); main nit je vec aktivna, ne stavlja se u Scheduler
	if (newTcb->threadFunction != nullptr) Scheduler::put(newTcb);
    80002e64:	01053783          	ld	a5,16(a0)
    80002e68:	02078663          	beqz	a5,80002e94 <_ZN3TCB5startEPS_+0x30>
void TCB::start(TCB* newTcb) {
    80002e6c:	ff010113          	addi	sp,sp,-16
    80002e70:	00113423          	sd	ra,8(sp)
    80002e74:	00813023          	sd	s0,0(sp)
    80002e78:	01010413          	addi	s0,sp,16
	if (newTcb->threadFunction != nullptr) Scheduler::put(newTcb);
    80002e7c:	fffff097          	auipc	ra,0xfffff
    80002e80:	b44080e7          	jalr	-1212(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
}
    80002e84:	00813083          	ld	ra,8(sp)
    80002e88:	00013403          	ld	s0,0(sp)
    80002e8c:	01010113          	addi	sp,sp,16
    80002e90:	00008067          	ret
    80002e94:	00008067          	ret

0000000080002e98 <_ZN5Riscv10popSppSpieEv>:
// Created by os on 5/17/23.
//

#include "../h/Riscv.hpp"

void Riscv::popSppSpie() {
    80002e98:	ff010113          	addi	sp,sp,-16
    80002e9c:	00813423          	sd	s0,8(sp)
    80002ea0:	01010413          	addi	s0,sp,16
	//ra pokazuje iza ove funkcije na nastavak wrappera
	__asm__ volatile("csrw sepc, ra");
    80002ea4:	14109073          	csrw	sepc,ra
	__asm__ volatile("sret");
    80002ea8:	10200073          	sret
    80002eac:	00813403          	ld	s0,8(sp)
    80002eb0:	01010113          	addi	sp,sp,16
    80002eb4:	00008067          	ret

0000000080002eb8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>:

bool MemoryAllocator::initialized = false;
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

void* MemoryAllocator::kmalloc(size_t size, Purpose pur) {
    80002eb8:	ff010113          	addi	sp,sp,-16
    80002ebc:	00813423          	sd	s0,8(sp)
    80002ec0:	01010413          	addi	s0,sp,16
	if (size <= 0) return nullptr;
    80002ec4:	12050c63          	beqz	a0,80002ffc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x144>

	//pocetna inicijalizacija
	if (!initialized) {
    80002ec8:	00009797          	auipc	a5,0x9
    80002ecc:	d287c783          	lbu	a5,-728(a5) # 8000bbf0 <_ZN15MemoryAllocator11initializedE>
    80002ed0:	04079863          	bnez	a5,80002f20 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x68>
		freeMemHead = (FreeMemSegment*)HEAP_START_ADDR;
    80002ed4:	00009617          	auipc	a2,0x9
    80002ed8:	bb463603          	ld	a2,-1100(a2) # 8000ba88 <_GLOBAL_OFFSET_TABLE_+0x20>
    80002edc:	00063783          	ld	a5,0(a2)
    80002ee0:	00009717          	auipc	a4,0x9
    80002ee4:	d1070713          	addi	a4,a4,-752 # 8000bbf0 <_ZN15MemoryAllocator11initializedE>
    80002ee8:	00f73423          	sd	a5,8(a4)
		freeMemHead->next = nullptr;
    80002eec:	0007b023          	sd	zero,0(a5)
		freeMemHead->prev = nullptr;
    80002ef0:	00873683          	ld	a3,8(a4)
    80002ef4:	0006b423          	sd	zero,8(a3)
		freeMemHead->size = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR - sizeof(FreeMemSegment);
    80002ef8:	00009797          	auipc	a5,0x9
    80002efc:	bd87b783          	ld	a5,-1064(a5) # 8000bad0 <_GLOBAL_OFFSET_TABLE_+0x68>
    80002f00:	0007b783          	ld	a5,0(a5)
    80002f04:	00063603          	ld	a2,0(a2)
    80002f08:	40c787b3          	sub	a5,a5,a2
    80002f0c:	fe878793          	addi	a5,a5,-24
    80002f10:	00f6b823          	sd	a5,16(a3)
		usedMemHead = nullptr;
    80002f14:	00073823          	sd	zero,16(a4)

		initialized = true;
    80002f18:	00100793          	li	a5,1
    80002f1c:	00f70023          	sb	a5,0(a4)
	}

	//alokacija uvek zaokruzena na blokove
	//size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
	size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80002f20:	00655793          	srli	a5,a0,0x6
    80002f24:	03f57513          	andi	a0,a0,63
    80002f28:	00050463          	beqz	a0,80002f30 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x78>
    80002f2c:	00100513          	li	a0,1
    80002f30:	00a78533          	add	a0,a5,a0
	size = blocks * MEM_BLOCK_SIZE;
    80002f34:	00651793          	slli	a5,a0,0x6

	//trazenje slobodnog segmenta po first-fit algoritmu
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80002f38:	00009517          	auipc	a0,0x9
    80002f3c:	cc053503          	ld	a0,-832(a0) # 8000bbf8 <_ZN15MemoryAllocator11freeMemHeadE>
    80002f40:	0a050063          	beqz	a0,80002fe0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x128>
		if (current->size < size) continue;
    80002f44:	01053703          	ld	a4,16(a0)
    80002f48:	06f76863          	bltu	a4,a5,80002fb8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x100>

		//pravljenje novog slobodnog fragmenta od ostatka fragmenta
		FreeMemSegment* remainderFree = (FreeMemSegment*)((char*)current + size);
    80002f4c:	00f506b3          	add	a3,a0,a5
		remainderFree->size = current->size - size;
    80002f50:	40f70733          	sub	a4,a4,a5
    80002f54:	00e6b823          	sd	a4,16(a3)
		remainderFree->prev = current->prev;
    80002f58:	00853703          	ld	a4,8(a0)
    80002f5c:	00e6b423          	sd	a4,8(a3)
		if (current->prev) current->prev->next = remainderFree;
    80002f60:	00070463          	beqz	a4,80002f68 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xb0>
    80002f64:	00d73023          	sd	a3,0(a4)
		remainderFree->next = current->next;
    80002f68:	00053703          	ld	a4,0(a0)
    80002f6c:	00e6b023          	sd	a4,0(a3)
		if (current->next) current->next->prev = remainderFree;
    80002f70:	00070463          	beqz	a4,80002f78 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xc0>
    80002f74:	00d73423          	sd	a3,8(a4)
		if (freeMemHead == current) freeMemHead = remainderFree;
    80002f78:	00009717          	auipc	a4,0x9
    80002f7c:	c8073703          	ld	a4,-896(a4) # 8000bbf8 <_ZN15MemoryAllocator11freeMemHeadE>
    80002f80:	04a70063          	beq	a4,a0,80002fc0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x108>

		//ubacivanje novog fragmenta u listu zauzetih fragmenata
		UsedMemSegment* newFragment = (UsedMemSegment*)current;
		newFragment->size = size;
    80002f84:	00f53423          	sd	a5,8(a0)
		newFragment->purpose = pur;
    80002f88:	00b52823          	sw	a1,16(a0)
		newFragment->usableFirstAddress = (char*)newFragment + sizeof(UsedMemSegment);
    80002f8c:	02050793          	addi	a5,a0,32
    80002f90:	00f53c23          	sd	a5,24(a0)
		UsedMemSegment* prevUsed = nullptr;
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    80002f94:	00009697          	auipc	a3,0x9
    80002f98:	c6c6b683          	ld	a3,-916(a3) # 8000bc00 <_ZN15MemoryAllocator11usedMemHeadE>
    80002f9c:	00068793          	mv	a5,a3
		UsedMemSegment* prevUsed = nullptr;
    80002fa0:	00000713          	li	a4,0
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    80002fa4:	02078463          	beqz	a5,80002fcc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x114>
    80002fa8:	02a7f263          	bgeu	a5,a0,80002fcc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x114>
    80002fac:	00078713          	mv	a4,a5
    80002fb0:	0007b783          	ld	a5,0(a5)
    80002fb4:	ff1ff06f          	j	80002fa4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xec>
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80002fb8:	00053503          	ld	a0,0(a0)
    80002fbc:	f85ff06f          	j	80002f40 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x88>
		if (freeMemHead == current) freeMemHead = remainderFree;
    80002fc0:	00009717          	auipc	a4,0x9
    80002fc4:	c2d73c23          	sd	a3,-968(a4) # 8000bbf8 <_ZN15MemoryAllocator11freeMemHeadE>
    80002fc8:	fbdff06f          	j	80002f84 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xcc>
		if (!prevUsed) {
    80002fcc:	02070063          	beqz	a4,80002fec <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x134>
			newFragment->next = usedMemHead;
			usedMemHead = newFragment;
		} else {
			newFragment->next = prevUsed->next;
    80002fd0:	00073783          	ld	a5,0(a4)
    80002fd4:	00f53023          	sd	a5,0(a0)
			prevUsed->next = newFragment;
    80002fd8:	00a73023          	sd	a0,0(a4)
		}
		//return (char*)newFragment + sizeof(UsedMemSegment);
		return newFragment->usableFirstAddress;
    80002fdc:	01853503          	ld	a0,24(a0)
	}
	return nullptr;
}
    80002fe0:	00813403          	ld	s0,8(sp)
    80002fe4:	01010113          	addi	sp,sp,16
    80002fe8:	00008067          	ret
			newFragment->next = usedMemHead;
    80002fec:	00d53023          	sd	a3,0(a0)
			usedMemHead = newFragment;
    80002ff0:	00009797          	auipc	a5,0x9
    80002ff4:	c0a7b823          	sd	a0,-1008(a5) # 8000bc00 <_ZN15MemoryAllocator11usedMemHeadE>
    80002ff8:	fe5ff06f          	j	80002fdc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x124>
	if (size <= 0) return nullptr;
    80002ffc:	00000513          	li	a0,0
    80003000:	fe1ff06f          	j	80002fe0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x128>

0000000080003004 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:
	tryToJoin(newFree);
	tryToJoin(prevFree);
	return 0;
}

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    80003004:	ff010113          	addi	sp,sp,-16
    80003008:	00813423          	sd	s0,8(sp)
    8000300c:	01010413          	addi	s0,sp,16
	if (!current) return 0;
    80003010:	04050663          	beqz	a0,8000305c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x58>
	bool nextExists = current->next != nullptr;
    80003014:	00053783          	ld	a5,0(a0)
	char* nextAddr = (char*)current + current->size;
    80003018:	01053703          	ld	a4,16(a0)
    8000301c:	00e506b3          	add	a3,a0,a4
	char* cnext = (char*)current->next;
	bool nextIsConnected = (nextAddr == cnext);
	if (nextExists && nextIsConnected) {
    80003020:	04078263          	beqz	a5,80003064 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x60>
    80003024:	00d78a63          	beq	a5,a3,80003038 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x34>
		current->size += current->next->size;
		current->next = current->next->next;
		if (current->next) current->next->prev = current;
		return 1;
	} else return 0;
    80003028:	00000513          	li	a0,0
}
    8000302c:	00813403          	ld	s0,8(sp)
    80003030:	01010113          	addi	sp,sp,16
    80003034:	00008067          	ret
		current->size += current->next->size;
    80003038:	0107b683          	ld	a3,16(a5)
    8000303c:	00d70733          	add	a4,a4,a3
    80003040:	00e53823          	sd	a4,16(a0)
		current->next = current->next->next;
    80003044:	0007b783          	ld	a5,0(a5)
    80003048:	00f53023          	sd	a5,0(a0)
		if (current->next) current->next->prev = current;
    8000304c:	00078463          	beqz	a5,80003054 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x50>
    80003050:	00a7b423          	sd	a0,8(a5)
		return 1;
    80003054:	00100513          	li	a0,1
    80003058:	fd5ff06f          	j	8000302c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	if (!current) return 0;
    8000305c:	00000513          	li	a0,0
    80003060:	fcdff06f          	j	8000302c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	} else return 0;
    80003064:	00000513          	li	a0,0
    80003068:	fc5ff06f          	j	8000302c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>

000000008000306c <_ZN15MemoryAllocator5kfreeEPv>:
	if (!ptr) return 0;
    8000306c:	10050463          	beqz	a0,80003174 <_ZN15MemoryAllocator5kfreeEPv+0x108>
    80003070:	00050693          	mv	a3,a0
	if (!usedMemHead) return -1;
    80003074:	00009797          	auipc	a5,0x9
    80003078:	b8c7b783          	ld	a5,-1140(a5) # 8000bc00 <_ZN15MemoryAllocator11usedMemHeadE>
    8000307c:	10078063          	beqz	a5,8000317c <_ZN15MemoryAllocator5kfreeEPv+0x110>
	ptr = (char*)ptr - sizeof(UsedMemSegment);
    80003080:	fe050513          	addi	a0,a0,-32
	UsedMemSegment* prevUsed = nullptr;
    80003084:	00000713          	li	a4,0
	for (; currentUsed && currentUsed != ptr; prevUsed = currentUsed, currentUsed = currentUsed->next);
    80003088:	00078a63          	beqz	a5,8000309c <_ZN15MemoryAllocator5kfreeEPv+0x30>
    8000308c:	00a78863          	beq	a5,a0,8000309c <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80003090:	00078713          	mv	a4,a5
    80003094:	0007b783          	ld	a5,0(a5)
    80003098:	ff1ff06f          	j	80003088 <_ZN15MemoryAllocator5kfreeEPv+0x1c>
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    8000309c:	0ea79463          	bne	a5,a0,80003184 <_ZN15MemoryAllocator5kfreeEPv+0x118>
int MemoryAllocator::kfree(void* ptr) {
    800030a0:	fe010113          	addi	sp,sp,-32
    800030a4:	00113c23          	sd	ra,24(sp)
    800030a8:	00813823          	sd	s0,16(sp)
    800030ac:	00913423          	sd	s1,8(sp)
    800030b0:	02010413          	addi	s0,sp,32
	if (prevUsed) prevUsed->next = currentUsed->next;
    800030b4:	02070863          	beqz	a4,800030e4 <_ZN15MemoryAllocator5kfreeEPv+0x78>
    800030b8:	0007b783          	ld	a5,0(a5)
    800030bc:	00f73023          	sd	a5,0(a4)
	if (!freeMemHead || ptr < (char*)freeMemHead) {
    800030c0:	00009797          	auipc	a5,0x9
    800030c4:	b387b783          	ld	a5,-1224(a5) # 8000bbf8 <_ZN15MemoryAllocator11freeMemHeadE>
    800030c8:	02078663          	beqz	a5,800030f4 <_ZN15MemoryAllocator5kfreeEPv+0x88>
    800030cc:	02f56863          	bltu	a0,a5,800030fc <_ZN15MemoryAllocator5kfreeEPv+0x90>
			 prevFree->next != nullptr && ptr > (char*)(prevFree->next); prevFree = prevFree->next);
    800030d0:	00078493          	mv	s1,a5
    800030d4:	0007b783          	ld	a5,0(a5)
    800030d8:	02078463          	beqz	a5,80003100 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    800030dc:	fea7eae3          	bltu	a5,a0,800030d0 <_ZN15MemoryAllocator5kfreeEPv+0x64>
    800030e0:	0200006f          	j	80003100 <_ZN15MemoryAllocator5kfreeEPv+0x94>
	else usedMemHead = currentUsed->next;
    800030e4:	0007b783          	ld	a5,0(a5)
    800030e8:	00009717          	auipc	a4,0x9
    800030ec:	b0f73c23          	sd	a5,-1256(a4) # 8000bc00 <_ZN15MemoryAllocator11usedMemHeadE>
    800030f0:	fd1ff06f          	j	800030c0 <_ZN15MemoryAllocator5kfreeEPv+0x54>
		prevFree = nullptr;
    800030f4:	00078493          	mv	s1,a5
    800030f8:	0080006f          	j	80003100 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    800030fc:	00000493          	li	s1,0
	size_t segmentSize = ((UsedMemSegment*)ptr)->size;
    80003100:	fe86b783          	ld	a5,-24(a3)
	newFree->size = segmentSize;
    80003104:	fef6b823          	sd	a5,-16(a3)
	newFree->prev = prevFree;
    80003108:	fe96b423          	sd	s1,-24(a3)
	if (prevFree) newFree->next = prevFree->next;
    8000310c:	04048663          	beqz	s1,80003158 <_ZN15MemoryAllocator5kfreeEPv+0xec>
    80003110:	0004b783          	ld	a5,0(s1)
    80003114:	fef6b023          	sd	a5,-32(a3)
	if (newFree->next) newFree->next->prev = newFree;
    80003118:	fe06b783          	ld	a5,-32(a3)
    8000311c:	00078463          	beqz	a5,80003124 <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    80003120:	00a7b423          	sd	a0,8(a5)
	if (prevFree) prevFree->next = newFree;
    80003124:	04048263          	beqz	s1,80003168 <_ZN15MemoryAllocator5kfreeEPv+0xfc>
    80003128:	00a4b023          	sd	a0,0(s1)
	tryToJoin(newFree);
    8000312c:	00000097          	auipc	ra,0x0
    80003130:	ed8080e7          	jalr	-296(ra) # 80003004 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	tryToJoin(prevFree);
    80003134:	00048513          	mv	a0,s1
    80003138:	00000097          	auipc	ra,0x0
    8000313c:	ecc080e7          	jalr	-308(ra) # 80003004 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	return 0;
    80003140:	00000513          	li	a0,0
}
    80003144:	01813083          	ld	ra,24(sp)
    80003148:	01013403          	ld	s0,16(sp)
    8000314c:	00813483          	ld	s1,8(sp)
    80003150:	02010113          	addi	sp,sp,32
    80003154:	00008067          	ret
	else newFree->next = freeMemHead;
    80003158:	00009797          	auipc	a5,0x9
    8000315c:	aa07b783          	ld	a5,-1376(a5) # 8000bbf8 <_ZN15MemoryAllocator11freeMemHeadE>
    80003160:	fef6b023          	sd	a5,-32(a3)
    80003164:	fb5ff06f          	j	80003118 <_ZN15MemoryAllocator5kfreeEPv+0xac>
	else freeMemHead = newFree;
    80003168:	00009797          	auipc	a5,0x9
    8000316c:	a8a7b823          	sd	a0,-1392(a5) # 8000bbf8 <_ZN15MemoryAllocator11freeMemHeadE>
    80003170:	fbdff06f          	j	8000312c <_ZN15MemoryAllocator5kfreeEPv+0xc0>
	if (!ptr) return 0;
    80003174:	00000513          	li	a0,0
    80003178:	00008067          	ret
	if (!usedMemHead) return -1;
    8000317c:	fff00513          	li	a0,-1
    80003180:	00008067          	ret
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80003184:	fff00513          	li	a0,-1
}
    80003188:	00008067          	ret

000000008000318c <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>:

bool MemoryAllocator::checkPurpose(void* ptr, MemoryAllocator::Purpose p) {
    8000318c:	ff010113          	addi	sp,sp,-16
    80003190:	00813423          	sd	s0,8(sp)
    80003194:	01010413          	addi	s0,sp,16
	ptr = (char*)ptr - sizeof(UsedMemSegment);
	return ((UsedMemSegment*)ptr)->purpose == p;
    80003198:	ff052503          	lw	a0,-16(a0)
    8000319c:	40b50533          	sub	a0,a0,a1
}
    800031a0:	00153513          	seqz	a0,a0
    800031a4:	00813403          	ld	s0,8(sp)
    800031a8:	01010113          	addi	sp,sp,16
    800031ac:	00008067          	ret

00000000800031b0 <_ZN4KSemnwEm>:

#include "../h/KSem.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void* KSem::operator new(size_t size) {
    800031b0:	ff010113          	addi	sp,sp,-16
    800031b4:	00113423          	sd	ra,8(sp)
    800031b8:	00813023          	sd	s0,0(sp)
    800031bc:	01010413          	addi	s0,sp,16
	return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::SEMAPHORE);
    800031c0:	00100593          	li	a1,1
    800031c4:	02050513          	addi	a0,a0,32
    800031c8:	00000097          	auipc	ra,0x0
    800031cc:	cf0080e7          	jalr	-784(ra) # 80002eb8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
}
    800031d0:	00813083          	ld	ra,8(sp)
    800031d4:	00013403          	ld	s0,0(sp)
    800031d8:	01010113          	addi	sp,sp,16
    800031dc:	00008067          	ret

00000000800031e0 <_ZN4KSemdlEPv>:

void KSem::operator delete(void* ptr) {
    800031e0:	ff010113          	addi	sp,sp,-16
    800031e4:	00113423          	sd	ra,8(sp)
    800031e8:	00813023          	sd	s0,0(sp)
    800031ec:	01010413          	addi	s0,sp,16
	MemoryAllocator::kfree(ptr);
    800031f0:	00000097          	auipc	ra,0x0
    800031f4:	e7c080e7          	jalr	-388(ra) # 8000306c <_ZN15MemoryAllocator5kfreeEPv>
}
    800031f8:	00813083          	ld	ra,8(sp)
    800031fc:	00013403          	ld	s0,0(sp)
    80003200:	01010113          	addi	sp,sp,16
    80003204:	00008067          	ret

0000000080003208 <_ZN4KSem7initSemEj>:

KSem* KSem::initSem(uint val) {
    80003208:	fe010113          	addi	sp,sp,-32
    8000320c:	00113c23          	sd	ra,24(sp)
    80003210:	00813823          	sd	s0,16(sp)
    80003214:	00913423          	sd	s1,8(sp)
    80003218:	02010413          	addi	s0,sp,32
    8000321c:	00050493          	mv	s1,a0
	return new KSem(val);
    80003220:	02000513          	li	a0,32
    80003224:	00000097          	auipc	ra,0x0
    80003228:	f8c080e7          	jalr	-116(ra) # 800031b0 <_ZN4KSemnwEm>
	void block();

	void unblock();

private:
	KSem(uint val) : val(val), working(true) {}
    8000322c:	00952023          	sw	s1,0(a0)
	ThreadQueue() : front(nullptr), back(nullptr) {}
    80003230:	00053423          	sd	zero,8(a0)
    80003234:	00053823          	sd	zero,16(a0)
    80003238:	00100713          	li	a4,1
    8000323c:	00e50c23          	sb	a4,24(a0)
}
    80003240:	01813083          	ld	ra,24(sp)
    80003244:	01013403          	ld	s0,16(sp)
    80003248:	00813483          	ld	s1,8(sp)
    8000324c:	02010113          	addi	sp,sp,32
    80003250:	00008067          	ret

0000000080003254 <_ZN4KSem5blockEv>:
	if (!working) return -3;
	if (val++ < 0) unblock();
	return 0;
}

void KSem::block() {
    80003254:	ff010113          	addi	sp,sp,-16
    80003258:	00113423          	sd	ra,8(sp)
    8000325c:	00813023          	sd	s0,0(sp)
    80003260:	01010413          	addi	s0,sp,16
	TCB::running->setBlocked(true);
    80003264:	00009797          	auipc	a5,0x9
    80003268:	8647b783          	ld	a5,-1948(a5) # 8000bac8 <_GLOBAL_OFFSET_TABLE_+0x60>
    8000326c:	0007b583          	ld	a1,0(a5)
	void setBlocked(bool block) { this->blocked = block; }
    80003270:	00100793          	li	a5,1
    80003274:	02f588a3          	sb	a5,49(a1)
	blocked.putLast(TCB::running);
    80003278:	00850513          	addi	a0,a0,8
    8000327c:	ffffe097          	auipc	ra,0xffffe
    80003280:	fc8080e7          	jalr	-56(ra) # 80001244 <_ZN11ThreadQueue7putLastEP3TCB>
	TCB::yield();
    80003284:	00000097          	auipc	ra,0x0
    80003288:	9f8080e7          	jalr	-1544(ra) # 80002c7c <_ZN3TCB5yieldEv>
}
    8000328c:	00813083          	ld	ra,8(sp)
    80003290:	00013403          	ld	s0,0(sp)
    80003294:	01010113          	addi	sp,sp,16
    80003298:	00008067          	ret

000000008000329c <_ZN4KSem4waitEv>:
int KSem::wait() {
    8000329c:	fe010113          	addi	sp,sp,-32
    800032a0:	00113c23          	sd	ra,24(sp)
    800032a4:	00813823          	sd	s0,16(sp)
    800032a8:	00913423          	sd	s1,8(sp)
    800032ac:	02010413          	addi	s0,sp,32
    800032b0:	00050493          	mv	s1,a0
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    800032b4:	00100593          	li	a1,1
    800032b8:	00000097          	auipc	ra,0x0
    800032bc:	ed4080e7          	jalr	-300(ra) # 8000318c <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>
    800032c0:	04050663          	beqz	a0,8000330c <_ZN4KSem4waitEv+0x70>
	if (!working) return -3;
    800032c4:	0184c783          	lbu	a5,24(s1)
    800032c8:	04078663          	beqz	a5,80003314 <_ZN4KSem4waitEv+0x78>
	if (--val < 0) {
    800032cc:	0004a783          	lw	a5,0(s1)
    800032d0:	fff7879b          	addiw	a5,a5,-1
    800032d4:	00f4a023          	sw	a5,0(s1)
    800032d8:	02079713          	slli	a4,a5,0x20
    800032dc:	00074e63          	bltz	a4,800032f8 <_ZN4KSem4waitEv+0x5c>
	return 0;
    800032e0:	00000513          	li	a0,0
}
    800032e4:	01813083          	ld	ra,24(sp)
    800032e8:	01013403          	ld	s0,16(sp)
    800032ec:	00813483          	ld	s1,8(sp)
    800032f0:	02010113          	addi	sp,sp,32
    800032f4:	00008067          	ret
		block();
    800032f8:	00048513          	mv	a0,s1
    800032fc:	00000097          	auipc	ra,0x0
    80003300:	f58080e7          	jalr	-168(ra) # 80003254 <_ZN4KSem5blockEv>
		return -1;
    80003304:	fff00513          	li	a0,-1
    80003308:	fddff06f          	j	800032e4 <_ZN4KSem4waitEv+0x48>
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    8000330c:	ffe00513          	li	a0,-2
    80003310:	fd5ff06f          	j	800032e4 <_ZN4KSem4waitEv+0x48>
	if (!working) return -3;
    80003314:	ffd00513          	li	a0,-3
    80003318:	fcdff06f          	j	800032e4 <_ZN4KSem4waitEv+0x48>

000000008000331c <_ZN4KSem7unblockEv>:

void KSem::unblock() {
    8000331c:	ff010113          	addi	sp,sp,-16
    80003320:	00113423          	sd	ra,8(sp)
    80003324:	00813023          	sd	s0,0(sp)
    80003328:	01010413          	addi	s0,sp,16
	TCB* tcb = blocked.getFirst();
    8000332c:	00850513          	addi	a0,a0,8
    80003330:	ffffe097          	auipc	ra,0xffffe
    80003334:	f80080e7          	jalr	-128(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
    80003338:	020508a3          	sb	zero,49(a0)
	tcb->setBlocked(false);
	Scheduler::put(tcb);
    8000333c:	ffffe097          	auipc	ra,0xffffe
    80003340:	684080e7          	jalr	1668(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
}
    80003344:	00813083          	ld	ra,8(sp)
    80003348:	00013403          	ld	s0,0(sp)
    8000334c:	01010113          	addi	sp,sp,16
    80003350:	00008067          	ret

0000000080003354 <_ZN4KSem6signalEv>:
int KSem::signal() {
    80003354:	fe010113          	addi	sp,sp,-32
    80003358:	00113c23          	sd	ra,24(sp)
    8000335c:	00813823          	sd	s0,16(sp)
    80003360:	00913423          	sd	s1,8(sp)
    80003364:	02010413          	addi	s0,sp,32
    80003368:	00050493          	mv	s1,a0
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    8000336c:	00100593          	li	a1,1
    80003370:	00000097          	auipc	ra,0x0
    80003374:	e1c080e7          	jalr	-484(ra) # 8000318c <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>
    80003378:	04050463          	beqz	a0,800033c0 <_ZN4KSem6signalEv+0x6c>
	if (!working) return -3;
    8000337c:	0184c783          	lbu	a5,24(s1)
    80003380:	04078463          	beqz	a5,800033c8 <_ZN4KSem6signalEv+0x74>
	if (val++ < 0) unblock();
    80003384:	0004a783          	lw	a5,0(s1)
    80003388:	0017871b          	addiw	a4,a5,1
    8000338c:	00e4a023          	sw	a4,0(s1)
    80003390:	0007ce63          	bltz	a5,800033ac <_ZN4KSem6signalEv+0x58>
	return 0;
    80003394:	00000513          	li	a0,0
}
    80003398:	01813083          	ld	ra,24(sp)
    8000339c:	01013403          	ld	s0,16(sp)
    800033a0:	00813483          	ld	s1,8(sp)
    800033a4:	02010113          	addi	sp,sp,32
    800033a8:	00008067          	ret
	if (val++ < 0) unblock();
    800033ac:	00048513          	mv	a0,s1
    800033b0:	00000097          	auipc	ra,0x0
    800033b4:	f6c080e7          	jalr	-148(ra) # 8000331c <_ZN4KSem7unblockEv>
	return 0;
    800033b8:	00000513          	li	a0,0
    800033bc:	fddff06f          	j	80003398 <_ZN4KSem6signalEv+0x44>
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    800033c0:	ffe00513          	li	a0,-2
    800033c4:	fd5ff06f          	j	80003398 <_ZN4KSem6signalEv+0x44>
	if (!working) return -3;
    800033c8:	ffd00513          	li	a0,-3
    800033cc:	fcdff06f          	j	80003398 <_ZN4KSem6signalEv+0x44>

00000000800033d0 <_ZN4KSem8closeSemEPS_>:

int KSem::closeSem(sem_t handle) {
    800033d0:	fe010113          	addi	sp,sp,-32
    800033d4:	00113c23          	sd	ra,24(sp)
    800033d8:	00813823          	sd	s0,16(sp)
    800033dc:	00913423          	sd	s1,8(sp)
    800033e0:	02010413          	addi	s0,sp,32
    800033e4:	00050493          	mv	s1,a0
	if (!MemoryAllocator::checkPurpose(handle, MemoryAllocator::SEMAPHORE)) return -2;
    800033e8:	00100593          	li	a1,1
    800033ec:	00000097          	auipc	ra,0x0
    800033f0:	da0080e7          	jalr	-608(ra) # 8000318c <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>
    800033f4:	04050263          	beqz	a0,80003438 <_ZN4KSem8closeSemEPS_+0x68>
	handle->working = false;
    800033f8:	00048c23          	sb	zero,24(s1)
    800033fc:	01c0006f          	j	80003418 <_ZN4KSem8closeSemEPS_+0x48>
	while (!handle->blocked.isEmpty()) {
		TCB* tcb = handle->blocked.getFirst();
    80003400:	00848513          	addi	a0,s1,8
    80003404:	ffffe097          	auipc	ra,0xffffe
    80003408:	eac080e7          	jalr	-340(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
    8000340c:	020508a3          	sb	zero,49(a0)
		tcb->setBlocked(false);
		Scheduler::put(tcb);
    80003410:	ffffe097          	auipc	ra,0xffffe
    80003414:	5b0080e7          	jalr	1456(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
		return front == nullptr;
    80003418:	0084b783          	ld	a5,8(s1)
	while (!handle->blocked.isEmpty()) {
    8000341c:	fe0792e3          	bnez	a5,80003400 <_ZN4KSem8closeSemEPS_+0x30>
	}
	return 0;
    80003420:	00000513          	li	a0,0
}
    80003424:	01813083          	ld	ra,24(sp)
    80003428:	01013403          	ld	s0,16(sp)
    8000342c:	00813483          	ld	s1,8(sp)
    80003430:	02010113          	addi	sp,sp,32
    80003434:	00008067          	ret
	if (!MemoryAllocator::checkPurpose(handle, MemoryAllocator::SEMAPHORE)) return -2;
    80003438:	ffe00513          	li	a0,-2
    8000343c:	fe9ff06f          	j	80003424 <_ZN4KSem8closeSemEPS_+0x54>

0000000080003440 <_Z10testMemoryv>:
//void printInteger(int i){
//	printInt(i);
//}
extern Semaphore* semA;

void testMemory() {
    80003440:	81010113          	addi	sp,sp,-2032
    80003444:	7e113423          	sd	ra,2024(sp)
    80003448:	7e813023          	sd	s0,2016(sp)
    8000344c:	7c913c23          	sd	s1,2008(sp)
    80003450:	7f010413          	addi	s0,sp,2032
    80003454:	83010113          	addi	sp,sp,-2000
	const uint64 NumAllocations = 500;    //zasto nece za preko 500????
	const uint64 AllocationSize = 16;

	// Allocate and initialize pointers
	int* allocations[NumAllocations];
	for (uint64 i = 0; i < NumAllocations; ++i)
    80003458:	00000713          	li	a4,0
    8000345c:	1f300793          	li	a5,499
    80003460:	02e7e263          	bltu	a5,a4,80003484 <_Z10testMemoryv+0x44>
		allocations[i] = nullptr;
    80003464:	fffff7b7          	lui	a5,0xfffff
    80003468:	00371693          	slli	a3,a4,0x3
    8000346c:	fe040613          	addi	a2,s0,-32
    80003470:	00f607b3          	add	a5,a2,a5
    80003474:	00d787b3          	add	a5,a5,a3
    80003478:	0607b023          	sd	zero,96(a5) # fffffffffffff060 <end+0xffffffff7fff21a0>
	for (uint64 i = 0; i < NumAllocations; ++i)
    8000347c:	00170713          	addi	a4,a4,1
    80003480:	fddff06f          	j	8000345c <_Z10testMemoryv+0x1c>

	// Allocate memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80003484:	00000493          	li	s1,0
    80003488:	1f300793          	li	a5,499
    8000348c:	0297ec63          	bltu	a5,s1,800034c4 <_Z10testMemoryv+0x84>
		allocations[i] = static_cast<int*>(MemoryAllocator::kmalloc(AllocationSize, MemoryAllocator::MISC));
    80003490:	00300593          	li	a1,3
    80003494:	01000513          	li	a0,16
    80003498:	00000097          	auipc	ra,0x0
    8000349c:	a20080e7          	jalr	-1504(ra) # 80002eb8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
    800034a0:	fffff737          	lui	a4,0xfffff
    800034a4:	00349793          	slli	a5,s1,0x3
    800034a8:	fe040693          	addi	a3,s0,-32
    800034ac:	00e68733          	add	a4,a3,a4
    800034b0:	00f707b3          	add	a5,a4,a5
    800034b4:	06a7b023          	sd	a0,96(a5)
		if (allocations[i] == nullptr) {
    800034b8:	00050663          	beqz	a0,800034c4 <_Z10testMemoryv+0x84>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    800034bc:	00148493          	addi	s1,s1,1
    800034c0:	fc9ff06f          	j	80003488 <_Z10testMemoryv+0x48>
    800034c4:	00000493          	li	s1,0
    800034c8:	0100006f          	j	800034d8 <_Z10testMemoryv+0x98>
	}

	// Free memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
		if (allocations[i] != nullptr) {
			if (MemoryAllocator::kfree(allocations[i]) != 0) {
    800034cc:	00000097          	auipc	ra,0x0
    800034d0:	ba0080e7          	jalr	-1120(ra) # 8000306c <_ZN15MemoryAllocator5kfreeEPv>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    800034d4:	00148493          	addi	s1,s1,1
    800034d8:	1f300793          	li	a5,499
    800034dc:	0297e263          	bltu	a5,s1,80003500 <_Z10testMemoryv+0xc0>
		if (allocations[i] != nullptr) {
    800034e0:	fffff737          	lui	a4,0xfffff
    800034e4:	00349793          	slli	a5,s1,0x3
    800034e8:	fe040693          	addi	a3,s0,-32
    800034ec:	00e68733          	add	a4,a3,a4
    800034f0:	00f707b3          	add	a5,a4,a5
    800034f4:	0607b503          	ld	a0,96(a5)
    800034f8:	fc051ae3          	bnez	a0,800034cc <_Z10testMemoryv+0x8c>
    800034fc:	fd9ff06f          	j	800034d4 <_Z10testMemoryv+0x94>
//				printString("\nDeallocation failed for index ");
//				printInteger(i);
			}
		}
	}
}
    80003500:	7d010113          	addi	sp,sp,2000
    80003504:	7e813083          	ld	ra,2024(sp)
    80003508:	7e013403          	ld	s0,2016(sp)
    8000350c:	7d813483          	ld	s1,2008(sp)
    80003510:	7f010113          	addi	sp,sp,2032
    80003514:	00008067          	ret

0000000080003518 <_Z5nit1fPv>:

void nit1f(void*) {
    80003518:	ff010113          	addi	sp,sp,-16
    8000351c:	00113423          	sd	ra,8(sp)
    80003520:	00813023          	sd	s0,0(sp)
    80003524:	01010413          	addi	s0,sp,16
//		printString("\nsem_wait za nit 1 vratio ");
//		printInteger(res);
//		printString("\n");
//	}

	printString("\nGotova nit 1\n");
    80003528:	00006517          	auipc	a0,0x6
    8000352c:	cf850513          	addi	a0,a0,-776 # 80009220 <CONSOLE_STATUS+0x210>
    80003530:	00002097          	auipc	ra,0x2
    80003534:	520080e7          	jalr	1312(ra) # 80005a50 <_Z11printStringPKc>
}
    80003538:	00813083          	ld	ra,8(sp)
    8000353c:	00013403          	ld	s0,0(sp)
    80003540:	01010113          	addi	sp,sp,16
    80003544:	00008067          	ret

0000000080003548 <_Z5nit2fPv>:

void nit2f(void* arg2) {
    80003548:	ff010113          	addi	sp,sp,-16
    8000354c:	00113423          	sd	ra,8(sp)
    80003550:	00813023          	sd	s0,0(sp)
    80003554:	01010413          	addi	s0,sp,16
//		//sem_close(semA);
//		printString("\nNit 2 ubija semafor\n");
//		delete semA;
//
//	}
	printString("\nGotova nit 2\n");
    80003558:	00006517          	auipc	a0,0x6
    8000355c:	cd850513          	addi	a0,a0,-808 # 80009230 <CONSOLE_STATUS+0x220>
    80003560:	00002097          	auipc	ra,0x2
    80003564:	4f0080e7          	jalr	1264(ra) # 80005a50 <_Z11printStringPKc>
}
    80003568:	00813083          	ld	ra,8(sp)
    8000356c:	00013403          	ld	s0,0(sp)
    80003570:	01010113          	addi	sp,sp,16
    80003574:	00008067          	ret

0000000080003578 <_Z5nit3fPv>:


void nit3f(void*) {
    80003578:	ff010113          	addi	sp,sp,-16
    8000357c:	00113423          	sd	ra,8(sp)
    80003580:	00813023          	sd	s0,0(sp)
    80003584:	01010413          	addi	s0,sp,16
	char slovo;

	slovo = getc();
    80003588:	ffffe097          	auipc	ra,0xffffe
    8000358c:	fe0080e7          	jalr	-32(ra) # 80001568 <_Z4getcv>
	putc(slovo);
    80003590:	ffffe097          	auipc	ra,0xffffe
    80003594:	000080e7          	jalr	ra # 80001590 <_Z4putcc>
	slovo = getc();
    80003598:	ffffe097          	auipc	ra,0xffffe
    8000359c:	fd0080e7          	jalr	-48(ra) # 80001568 <_Z4getcv>
	putc(slovo);
    800035a0:	ffffe097          	auipc	ra,0xffffe
    800035a4:	ff0080e7          	jalr	-16(ra) # 80001590 <_Z4putcc>
	slovo = getc();
    800035a8:	ffffe097          	auipc	ra,0xffffe
    800035ac:	fc0080e7          	jalr	-64(ra) # 80001568 <_Z4getcv>
	putc(slovo);
    800035b0:	ffffe097          	auipc	ra,0xffffe
    800035b4:	fe0080e7          	jalr	-32(ra) # 80001590 <_Z4putcc>
	printString("\nGotova nit3\n");
    800035b8:	00006517          	auipc	a0,0x6
    800035bc:	c8850513          	addi	a0,a0,-888 # 80009240 <CONSOLE_STATUS+0x230>
    800035c0:	00002097          	auipc	ra,0x2
    800035c4:	490080e7          	jalr	1168(ra) # 80005a50 <_Z11printStringPKc>
    800035c8:	00813083          	ld	ra,8(sp)
    800035cc:	00013403          	ld	s0,0(sp)
    800035d0:	01010113          	addi	sp,sp,16
    800035d4:	00008067          	ret

00000000800035d8 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    800035d8:	fe010113          	addi	sp,sp,-32
    800035dc:	00113c23          	sd	ra,24(sp)
    800035e0:	00813823          	sd	s0,16(sp)
    800035e4:	00913423          	sd	s1,8(sp)
    800035e8:	01213023          	sd	s2,0(sp)
    800035ec:	02010413          	addi	s0,sp,32
    800035f0:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    800035f4:	00000913          	li	s2,0
    800035f8:	00c0006f          	j	80003604 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    800035fc:	ffffe097          	auipc	ra,0xffffe
    80003600:	e2c080e7          	jalr	-468(ra) # 80001428 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
    80003604:	ffffe097          	auipc	ra,0xffffe
    80003608:	f64080e7          	jalr	-156(ra) # 80001568 <_Z4getcv>
    8000360c:	0005059b          	sext.w	a1,a0
    80003610:	02d00793          	li	a5,45
    80003614:	02f58a63          	beq	a1,a5,80003648 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80003618:	0084b503          	ld	a0,8(s1)
    8000361c:	00003097          	auipc	ra,0x3
    80003620:	400080e7          	jalr	1024(ra) # 80006a1c <_ZN6Buffer3putEi>
        i++;
    80003624:	0019071b          	addiw	a4,s2,1
    80003628:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    8000362c:	0004a683          	lw	a3,0(s1)
    80003630:	0026979b          	slliw	a5,a3,0x2
    80003634:	00d787bb          	addw	a5,a5,a3
    80003638:	0017979b          	slliw	a5,a5,0x1
    8000363c:	02f767bb          	remw	a5,a4,a5
    80003640:	fc0792e3          	bnez	a5,80003604 <_ZL16producerKeyboardPv+0x2c>
    80003644:	fb9ff06f          	j	800035fc <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80003648:	00100793          	li	a5,1
    8000364c:	00008717          	auipc	a4,0x8
    80003650:	5af72e23          	sw	a5,1468(a4) # 8000bc08 <_ZL9threadEnd>
    data->buffer->put('!');
    80003654:	02100593          	li	a1,33
    80003658:	0084b503          	ld	a0,8(s1)
    8000365c:	00003097          	auipc	ra,0x3
    80003660:	3c0080e7          	jalr	960(ra) # 80006a1c <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80003664:	0104b503          	ld	a0,16(s1)
    80003668:	ffffe097          	auipc	ra,0xffffe
    8000366c:	ed0080e7          	jalr	-304(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    80003670:	01813083          	ld	ra,24(sp)
    80003674:	01013403          	ld	s0,16(sp)
    80003678:	00813483          	ld	s1,8(sp)
    8000367c:	00013903          	ld	s2,0(sp)
    80003680:	02010113          	addi	sp,sp,32
    80003684:	00008067          	ret

0000000080003688 <_ZL8producerPv>:

static void producer(void *arg) {
    80003688:	fe010113          	addi	sp,sp,-32
    8000368c:	00113c23          	sd	ra,24(sp)
    80003690:	00813823          	sd	s0,16(sp)
    80003694:	00913423          	sd	s1,8(sp)
    80003698:	01213023          	sd	s2,0(sp)
    8000369c:	02010413          	addi	s0,sp,32
    800036a0:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800036a4:	00000913          	li	s2,0
    800036a8:	00c0006f          	j	800036b4 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    800036ac:	ffffe097          	auipc	ra,0xffffe
    800036b0:	d7c080e7          	jalr	-644(ra) # 80001428 <_Z15thread_dispatchv>
    while (!threadEnd) {
    800036b4:	00008797          	auipc	a5,0x8
    800036b8:	5547a783          	lw	a5,1364(a5) # 8000bc08 <_ZL9threadEnd>
    800036bc:	02079e63          	bnez	a5,800036f8 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    800036c0:	0004a583          	lw	a1,0(s1)
    800036c4:	0305859b          	addiw	a1,a1,48
    800036c8:	0084b503          	ld	a0,8(s1)
    800036cc:	00003097          	auipc	ra,0x3
    800036d0:	350080e7          	jalr	848(ra) # 80006a1c <_ZN6Buffer3putEi>
        i++;
    800036d4:	0019071b          	addiw	a4,s2,1
    800036d8:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800036dc:	0004a683          	lw	a3,0(s1)
    800036e0:	0026979b          	slliw	a5,a3,0x2
    800036e4:	00d787bb          	addw	a5,a5,a3
    800036e8:	0017979b          	slliw	a5,a5,0x1
    800036ec:	02f767bb          	remw	a5,a4,a5
    800036f0:	fc0792e3          	bnez	a5,800036b4 <_ZL8producerPv+0x2c>
    800036f4:	fb9ff06f          	j	800036ac <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    800036f8:	0104b503          	ld	a0,16(s1)
    800036fc:	ffffe097          	auipc	ra,0xffffe
    80003700:	e3c080e7          	jalr	-452(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    80003704:	01813083          	ld	ra,24(sp)
    80003708:	01013403          	ld	s0,16(sp)
    8000370c:	00813483          	ld	s1,8(sp)
    80003710:	00013903          	ld	s2,0(sp)
    80003714:	02010113          	addi	sp,sp,32
    80003718:	00008067          	ret

000000008000371c <_ZL8consumerPv>:

static void consumer(void *arg) {
    8000371c:	fd010113          	addi	sp,sp,-48
    80003720:	02113423          	sd	ra,40(sp)
    80003724:	02813023          	sd	s0,32(sp)
    80003728:	00913c23          	sd	s1,24(sp)
    8000372c:	01213823          	sd	s2,16(sp)
    80003730:	01313423          	sd	s3,8(sp)
    80003734:	03010413          	addi	s0,sp,48
    80003738:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    8000373c:	00000993          	li	s3,0
    80003740:	01c0006f          	j	8000375c <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80003744:	ffffe097          	auipc	ra,0xffffe
    80003748:	ce4080e7          	jalr	-796(ra) # 80001428 <_Z15thread_dispatchv>
    8000374c:	0500006f          	j	8000379c <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80003750:	00a00513          	li	a0,10
    80003754:	ffffe097          	auipc	ra,0xffffe
    80003758:	e3c080e7          	jalr	-452(ra) # 80001590 <_Z4putcc>
    while (!threadEnd) {
    8000375c:	00008797          	auipc	a5,0x8
    80003760:	4ac7a783          	lw	a5,1196(a5) # 8000bc08 <_ZL9threadEnd>
    80003764:	06079063          	bnez	a5,800037c4 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    80003768:	00893503          	ld	a0,8(s2)
    8000376c:	00003097          	auipc	ra,0x3
    80003770:	340080e7          	jalr	832(ra) # 80006aac <_ZN6Buffer3getEv>
        i++;
    80003774:	0019849b          	addiw	s1,s3,1
    80003778:	0004899b          	sext.w	s3,s1
        putc(key);
    8000377c:	0ff57513          	andi	a0,a0,255
    80003780:	ffffe097          	auipc	ra,0xffffe
    80003784:	e10080e7          	jalr	-496(ra) # 80001590 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80003788:	00092703          	lw	a4,0(s2)
    8000378c:	0027179b          	slliw	a5,a4,0x2
    80003790:	00e787bb          	addw	a5,a5,a4
    80003794:	02f4e7bb          	remw	a5,s1,a5
    80003798:	fa0786e3          	beqz	a5,80003744 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    8000379c:	05000793          	li	a5,80
    800037a0:	02f4e4bb          	remw	s1,s1,a5
    800037a4:	fa049ce3          	bnez	s1,8000375c <_ZL8consumerPv+0x40>
    800037a8:	fa9ff06f          	j	80003750 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    800037ac:	00893503          	ld	a0,8(s2)
    800037b0:	00003097          	auipc	ra,0x3
    800037b4:	2fc080e7          	jalr	764(ra) # 80006aac <_ZN6Buffer3getEv>
        putc(key);
    800037b8:	0ff57513          	andi	a0,a0,255
    800037bc:	ffffe097          	auipc	ra,0xffffe
    800037c0:	dd4080e7          	jalr	-556(ra) # 80001590 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    800037c4:	00893503          	ld	a0,8(s2)
    800037c8:	00003097          	auipc	ra,0x3
    800037cc:	370080e7          	jalr	880(ra) # 80006b38 <_ZN6Buffer6getCntEv>
    800037d0:	fca04ee3          	bgtz	a0,800037ac <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    800037d4:	01093503          	ld	a0,16(s2)
    800037d8:	ffffe097          	auipc	ra,0xffffe
    800037dc:	d60080e7          	jalr	-672(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    800037e0:	02813083          	ld	ra,40(sp)
    800037e4:	02013403          	ld	s0,32(sp)
    800037e8:	01813483          	ld	s1,24(sp)
    800037ec:	01013903          	ld	s2,16(sp)
    800037f0:	00813983          	ld	s3,8(sp)
    800037f4:	03010113          	addi	sp,sp,48
    800037f8:	00008067          	ret

00000000800037fc <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    800037fc:	f9010113          	addi	sp,sp,-112
    80003800:	06113423          	sd	ra,104(sp)
    80003804:	06813023          	sd	s0,96(sp)
    80003808:	04913c23          	sd	s1,88(sp)
    8000380c:	05213823          	sd	s2,80(sp)
    80003810:	05313423          	sd	s3,72(sp)
    80003814:	05413023          	sd	s4,64(sp)
    80003818:	03513c23          	sd	s5,56(sp)
    8000381c:	03613823          	sd	s6,48(sp)
    80003820:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80003824:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80003828:	00006517          	auipc	a0,0x6
    8000382c:	a2850513          	addi	a0,a0,-1496 # 80009250 <CONSOLE_STATUS+0x240>
    80003830:	00002097          	auipc	ra,0x2
    80003834:	220080e7          	jalr	544(ra) # 80005a50 <_Z11printStringPKc>
    getString(input, 30);
    80003838:	01e00593          	li	a1,30
    8000383c:	fa040493          	addi	s1,s0,-96
    80003840:	00048513          	mv	a0,s1
    80003844:	00002097          	auipc	ra,0x2
    80003848:	294080e7          	jalr	660(ra) # 80005ad8 <_Z9getStringPci>
    threadNum = stringToInt(input);
    8000384c:	00048513          	mv	a0,s1
    80003850:	00002097          	auipc	ra,0x2
    80003854:	360080e7          	jalr	864(ra) # 80005bb0 <_Z11stringToIntPKc>
    80003858:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    8000385c:	00006517          	auipc	a0,0x6
    80003860:	a1450513          	addi	a0,a0,-1516 # 80009270 <CONSOLE_STATUS+0x260>
    80003864:	00002097          	auipc	ra,0x2
    80003868:	1ec080e7          	jalr	492(ra) # 80005a50 <_Z11printStringPKc>
    getString(input, 30);
    8000386c:	01e00593          	li	a1,30
    80003870:	00048513          	mv	a0,s1
    80003874:	00002097          	auipc	ra,0x2
    80003878:	264080e7          	jalr	612(ra) # 80005ad8 <_Z9getStringPci>
    n = stringToInt(input);
    8000387c:	00048513          	mv	a0,s1
    80003880:	00002097          	auipc	ra,0x2
    80003884:	330080e7          	jalr	816(ra) # 80005bb0 <_Z11stringToIntPKc>
    80003888:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    8000388c:	00006517          	auipc	a0,0x6
    80003890:	a0450513          	addi	a0,a0,-1532 # 80009290 <CONSOLE_STATUS+0x280>
    80003894:	00002097          	auipc	ra,0x2
    80003898:	1bc080e7          	jalr	444(ra) # 80005a50 <_Z11printStringPKc>
    8000389c:	00000613          	li	a2,0
    800038a0:	00a00593          	li	a1,10
    800038a4:	00090513          	mv	a0,s2
    800038a8:	00002097          	auipc	ra,0x2
    800038ac:	358080e7          	jalr	856(ra) # 80005c00 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    800038b0:	00006517          	auipc	a0,0x6
    800038b4:	9f850513          	addi	a0,a0,-1544 # 800092a8 <CONSOLE_STATUS+0x298>
    800038b8:	00002097          	auipc	ra,0x2
    800038bc:	198080e7          	jalr	408(ra) # 80005a50 <_Z11printStringPKc>
    800038c0:	00000613          	li	a2,0
    800038c4:	00a00593          	li	a1,10
    800038c8:	00048513          	mv	a0,s1
    800038cc:	00002097          	auipc	ra,0x2
    800038d0:	334080e7          	jalr	820(ra) # 80005c00 <_Z8printIntiii>
    printString(".\n");
    800038d4:	00006517          	auipc	a0,0x6
    800038d8:	9ec50513          	addi	a0,a0,-1556 # 800092c0 <CONSOLE_STATUS+0x2b0>
    800038dc:	00002097          	auipc	ra,0x2
    800038e0:	174080e7          	jalr	372(ra) # 80005a50 <_Z11printStringPKc>
    if(threadNum > n) {
    800038e4:	0324c463          	blt	s1,s2,8000390c <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    800038e8:	03205c63          	blez	s2,80003920 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    800038ec:	03800513          	li	a0,56
    800038f0:	fffff097          	auipc	ra,0xfffff
    800038f4:	dc8080e7          	jalr	-568(ra) # 800026b8 <_Znwm>
    800038f8:	00050a13          	mv	s4,a0
    800038fc:	00048593          	mv	a1,s1
    80003900:	00003097          	auipc	ra,0x3
    80003904:	080080e7          	jalr	128(ra) # 80006980 <_ZN6BufferC1Ei>
    80003908:	0300006f          	j	80003938 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    8000390c:	00006517          	auipc	a0,0x6
    80003910:	9bc50513          	addi	a0,a0,-1604 # 800092c8 <CONSOLE_STATUS+0x2b8>
    80003914:	00002097          	auipc	ra,0x2
    80003918:	13c080e7          	jalr	316(ra) # 80005a50 <_Z11printStringPKc>
        return;
    8000391c:	0140006f          	j	80003930 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80003920:	00006517          	auipc	a0,0x6
    80003924:	9e850513          	addi	a0,a0,-1560 # 80009308 <CONSOLE_STATUS+0x2f8>
    80003928:	00002097          	auipc	ra,0x2
    8000392c:	128080e7          	jalr	296(ra) # 80005a50 <_Z11printStringPKc>
        return;
    80003930:	000b0113          	mv	sp,s6
    80003934:	1500006f          	j	80003a84 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80003938:	00000593          	li	a1,0
    8000393c:	00008517          	auipc	a0,0x8
    80003940:	2d450513          	addi	a0,a0,724 # 8000bc10 <_ZL10waitForAll>
    80003944:	ffffe097          	auipc	ra,0xffffe
    80003948:	b5c080e7          	jalr	-1188(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    thread_t threads[threadNum];
    8000394c:	00391793          	slli	a5,s2,0x3
    80003950:	00f78793          	addi	a5,a5,15
    80003954:	ff07f793          	andi	a5,a5,-16
    80003958:	40f10133          	sub	sp,sp,a5
    8000395c:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80003960:	0019071b          	addiw	a4,s2,1
    80003964:	00171793          	slli	a5,a4,0x1
    80003968:	00e787b3          	add	a5,a5,a4
    8000396c:	00379793          	slli	a5,a5,0x3
    80003970:	00f78793          	addi	a5,a5,15
    80003974:	ff07f793          	andi	a5,a5,-16
    80003978:	40f10133          	sub	sp,sp,a5
    8000397c:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80003980:	00191613          	slli	a2,s2,0x1
    80003984:	012607b3          	add	a5,a2,s2
    80003988:	00379793          	slli	a5,a5,0x3
    8000398c:	00f987b3          	add	a5,s3,a5
    80003990:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80003994:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80003998:	00008717          	auipc	a4,0x8
    8000399c:	27873703          	ld	a4,632(a4) # 8000bc10 <_ZL10waitForAll>
    800039a0:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    800039a4:	00078613          	mv	a2,a5
    800039a8:	00000597          	auipc	a1,0x0
    800039ac:	d7458593          	addi	a1,a1,-652 # 8000371c <_ZL8consumerPv>
    800039b0:	f9840513          	addi	a0,s0,-104
    800039b4:	ffffe097          	auipc	ra,0xffffe
    800039b8:	9cc080e7          	jalr	-1588(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    800039bc:	00000493          	li	s1,0
    800039c0:	0280006f          	j	800039e8 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    800039c4:	00000597          	auipc	a1,0x0
    800039c8:	c1458593          	addi	a1,a1,-1004 # 800035d8 <_ZL16producerKeyboardPv>
                      data + i);
    800039cc:	00179613          	slli	a2,a5,0x1
    800039d0:	00f60633          	add	a2,a2,a5
    800039d4:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    800039d8:	00c98633          	add	a2,s3,a2
    800039dc:	ffffe097          	auipc	ra,0xffffe
    800039e0:	9a4080e7          	jalr	-1628(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    800039e4:	0014849b          	addiw	s1,s1,1
    800039e8:	0524d263          	bge	s1,s2,80003a2c <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    800039ec:	00149793          	slli	a5,s1,0x1
    800039f0:	009787b3          	add	a5,a5,s1
    800039f4:	00379793          	slli	a5,a5,0x3
    800039f8:	00f987b3          	add	a5,s3,a5
    800039fc:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80003a00:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80003a04:	00008717          	auipc	a4,0x8
    80003a08:	20c73703          	ld	a4,524(a4) # 8000bc10 <_ZL10waitForAll>
    80003a0c:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80003a10:	00048793          	mv	a5,s1
    80003a14:	00349513          	slli	a0,s1,0x3
    80003a18:	00aa8533          	add	a0,s5,a0
    80003a1c:	fa9054e3          	blez	s1,800039c4 <_Z22producerConsumer_C_APIv+0x1c8>
    80003a20:	00000597          	auipc	a1,0x0
    80003a24:	c6858593          	addi	a1,a1,-920 # 80003688 <_ZL8producerPv>
    80003a28:	fa5ff06f          	j	800039cc <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80003a2c:	ffffe097          	auipc	ra,0xffffe
    80003a30:	9fc080e7          	jalr	-1540(ra) # 80001428 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80003a34:	00000493          	li	s1,0
    80003a38:	00994e63          	blt	s2,s1,80003a54 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80003a3c:	00008517          	auipc	a0,0x8
    80003a40:	1d453503          	ld	a0,468(a0) # 8000bc10 <_ZL10waitForAll>
    80003a44:	ffffe097          	auipc	ra,0xffffe
    80003a48:	ac4080e7          	jalr	-1340(ra) # 80001508 <_Z8sem_waitP4KSem>
    for (int i = 0; i <= threadNum; i++) {
    80003a4c:	0014849b          	addiw	s1,s1,1
    80003a50:	fe9ff06f          	j	80003a38 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80003a54:	00008517          	auipc	a0,0x8
    80003a58:	1bc53503          	ld	a0,444(a0) # 8000bc10 <_ZL10waitForAll>
    80003a5c:	ffffe097          	auipc	ra,0xffffe
    80003a60:	a7c080e7          	jalr	-1412(ra) # 800014d8 <_Z9sem_closeP4KSem>
    delete buffer;
    80003a64:	000a0e63          	beqz	s4,80003a80 <_Z22producerConsumer_C_APIv+0x284>
    80003a68:	000a0513          	mv	a0,s4
    80003a6c:	00003097          	auipc	ra,0x3
    80003a70:	154080e7          	jalr	340(ra) # 80006bc0 <_ZN6BufferD1Ev>
    80003a74:	000a0513          	mv	a0,s4
    80003a78:	fffff097          	auipc	ra,0xfffff
    80003a7c:	c90080e7          	jalr	-880(ra) # 80002708 <_ZdlPv>
    80003a80:	000b0113          	mv	sp,s6

}
    80003a84:	f9040113          	addi	sp,s0,-112
    80003a88:	06813083          	ld	ra,104(sp)
    80003a8c:	06013403          	ld	s0,96(sp)
    80003a90:	05813483          	ld	s1,88(sp)
    80003a94:	05013903          	ld	s2,80(sp)
    80003a98:	04813983          	ld	s3,72(sp)
    80003a9c:	04013a03          	ld	s4,64(sp)
    80003aa0:	03813a83          	ld	s5,56(sp)
    80003aa4:	03013b03          	ld	s6,48(sp)
    80003aa8:	07010113          	addi	sp,sp,112
    80003aac:	00008067          	ret
    80003ab0:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80003ab4:	000a0513          	mv	a0,s4
    80003ab8:	fffff097          	auipc	ra,0xfffff
    80003abc:	c50080e7          	jalr	-944(ra) # 80002708 <_ZdlPv>
    80003ac0:	00048513          	mv	a0,s1
    80003ac4:	00009097          	auipc	ra,0x9
    80003ac8:	264080e7          	jalr	612(ra) # 8000cd28 <_Unwind_Resume>

0000000080003acc <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003acc:	fe010113          	addi	sp,sp,-32
    80003ad0:	00113c23          	sd	ra,24(sp)
    80003ad4:	00813823          	sd	s0,16(sp)
    80003ad8:	00913423          	sd	s1,8(sp)
    80003adc:	01213023          	sd	s2,0(sp)
    80003ae0:	02010413          	addi	s0,sp,32
    80003ae4:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003ae8:	00100793          	li	a5,1
    80003aec:	02a7f863          	bgeu	a5,a0,80003b1c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80003af0:	00a00793          	li	a5,10
    80003af4:	02f577b3          	remu	a5,a0,a5
    80003af8:	02078e63          	beqz	a5,80003b34 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80003afc:	fff48513          	addi	a0,s1,-1
    80003b00:	00000097          	auipc	ra,0x0
    80003b04:	fcc080e7          	jalr	-52(ra) # 80003acc <_ZL9fibonaccim>
    80003b08:	00050913          	mv	s2,a0
    80003b0c:	ffe48513          	addi	a0,s1,-2
    80003b10:	00000097          	auipc	ra,0x0
    80003b14:	fbc080e7          	jalr	-68(ra) # 80003acc <_ZL9fibonaccim>
    80003b18:	00a90533          	add	a0,s2,a0
}
    80003b1c:	01813083          	ld	ra,24(sp)
    80003b20:	01013403          	ld	s0,16(sp)
    80003b24:	00813483          	ld	s1,8(sp)
    80003b28:	00013903          	ld	s2,0(sp)
    80003b2c:	02010113          	addi	sp,sp,32
    80003b30:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80003b34:	ffffe097          	auipc	ra,0xffffe
    80003b38:	8f4080e7          	jalr	-1804(ra) # 80001428 <_Z15thread_dispatchv>
    80003b3c:	fc1ff06f          	j	80003afc <_ZL9fibonaccim+0x30>

0000000080003b40 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80003b40:	fe010113          	addi	sp,sp,-32
    80003b44:	00113c23          	sd	ra,24(sp)
    80003b48:	00813823          	sd	s0,16(sp)
    80003b4c:	00913423          	sd	s1,8(sp)
    80003b50:	01213023          	sd	s2,0(sp)
    80003b54:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003b58:	00000913          	li	s2,0
    80003b5c:	0380006f          	j	80003b94 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003b60:	ffffe097          	auipc	ra,0xffffe
    80003b64:	8c8080e7          	jalr	-1848(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003b68:	00148493          	addi	s1,s1,1
    80003b6c:	000027b7          	lui	a5,0x2
    80003b70:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003b74:	0097ee63          	bltu	a5,s1,80003b90 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003b78:	00000713          	li	a4,0
    80003b7c:	000077b7          	lui	a5,0x7
    80003b80:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003b84:	fce7eee3          	bltu	a5,a4,80003b60 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80003b88:	00170713          	addi	a4,a4,1
    80003b8c:	ff1ff06f          	j	80003b7c <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003b90:	00190913          	addi	s2,s2,1
    80003b94:	00900793          	li	a5,9
    80003b98:	0527e063          	bltu	a5,s2,80003bd8 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003b9c:	00005517          	auipc	a0,0x5
    80003ba0:	79c50513          	addi	a0,a0,1948 # 80009338 <CONSOLE_STATUS+0x328>
    80003ba4:	00002097          	auipc	ra,0x2
    80003ba8:	eac080e7          	jalr	-340(ra) # 80005a50 <_Z11printStringPKc>
    80003bac:	00000613          	li	a2,0
    80003bb0:	00a00593          	li	a1,10
    80003bb4:	0009051b          	sext.w	a0,s2
    80003bb8:	00002097          	auipc	ra,0x2
    80003bbc:	048080e7          	jalr	72(ra) # 80005c00 <_Z8printIntiii>
    80003bc0:	00006517          	auipc	a0,0x6
    80003bc4:	9c850513          	addi	a0,a0,-1592 # 80009588 <CONSOLE_STATUS+0x578>
    80003bc8:	00002097          	auipc	ra,0x2
    80003bcc:	e88080e7          	jalr	-376(ra) # 80005a50 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003bd0:	00000493          	li	s1,0
    80003bd4:	f99ff06f          	j	80003b6c <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003bd8:	00005517          	auipc	a0,0x5
    80003bdc:	76850513          	addi	a0,a0,1896 # 80009340 <CONSOLE_STATUS+0x330>
    80003be0:	00002097          	auipc	ra,0x2
    80003be4:	e70080e7          	jalr	-400(ra) # 80005a50 <_Z11printStringPKc>
    finishedA = true;
    80003be8:	00100793          	li	a5,1
    80003bec:	00008717          	auipc	a4,0x8
    80003bf0:	02f70623          	sb	a5,44(a4) # 8000bc18 <_ZL9finishedA>
}
    80003bf4:	01813083          	ld	ra,24(sp)
    80003bf8:	01013403          	ld	s0,16(sp)
    80003bfc:	00813483          	ld	s1,8(sp)
    80003c00:	00013903          	ld	s2,0(sp)
    80003c04:	02010113          	addi	sp,sp,32
    80003c08:	00008067          	ret

0000000080003c0c <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80003c0c:	fe010113          	addi	sp,sp,-32
    80003c10:	00113c23          	sd	ra,24(sp)
    80003c14:	00813823          	sd	s0,16(sp)
    80003c18:	00913423          	sd	s1,8(sp)
    80003c1c:	01213023          	sd	s2,0(sp)
    80003c20:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003c24:	00000913          	li	s2,0
    80003c28:	0380006f          	j	80003c60 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003c2c:	ffffd097          	auipc	ra,0xffffd
    80003c30:	7fc080e7          	jalr	2044(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003c34:	00148493          	addi	s1,s1,1
    80003c38:	000027b7          	lui	a5,0x2
    80003c3c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003c40:	0097ee63          	bltu	a5,s1,80003c5c <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003c44:	00000713          	li	a4,0
    80003c48:	000077b7          	lui	a5,0x7
    80003c4c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003c50:	fce7eee3          	bltu	a5,a4,80003c2c <_ZN7WorkerB11workerBodyBEPv+0x20>
    80003c54:	00170713          	addi	a4,a4,1
    80003c58:	ff1ff06f          	j	80003c48 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003c5c:	00190913          	addi	s2,s2,1
    80003c60:	00f00793          	li	a5,15
    80003c64:	0527e063          	bltu	a5,s2,80003ca4 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003c68:	00005517          	auipc	a0,0x5
    80003c6c:	6e850513          	addi	a0,a0,1768 # 80009350 <CONSOLE_STATUS+0x340>
    80003c70:	00002097          	auipc	ra,0x2
    80003c74:	de0080e7          	jalr	-544(ra) # 80005a50 <_Z11printStringPKc>
    80003c78:	00000613          	li	a2,0
    80003c7c:	00a00593          	li	a1,10
    80003c80:	0009051b          	sext.w	a0,s2
    80003c84:	00002097          	auipc	ra,0x2
    80003c88:	f7c080e7          	jalr	-132(ra) # 80005c00 <_Z8printIntiii>
    80003c8c:	00006517          	auipc	a0,0x6
    80003c90:	8fc50513          	addi	a0,a0,-1796 # 80009588 <CONSOLE_STATUS+0x578>
    80003c94:	00002097          	auipc	ra,0x2
    80003c98:	dbc080e7          	jalr	-580(ra) # 80005a50 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003c9c:	00000493          	li	s1,0
    80003ca0:	f99ff06f          	j	80003c38 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80003ca4:	00005517          	auipc	a0,0x5
    80003ca8:	6b450513          	addi	a0,a0,1716 # 80009358 <CONSOLE_STATUS+0x348>
    80003cac:	00002097          	auipc	ra,0x2
    80003cb0:	da4080e7          	jalr	-604(ra) # 80005a50 <_Z11printStringPKc>
    finishedB = true;
    80003cb4:	00100793          	li	a5,1
    80003cb8:	00008717          	auipc	a4,0x8
    80003cbc:	f6f700a3          	sb	a5,-159(a4) # 8000bc19 <_ZL9finishedB>
    thread_dispatch();
    80003cc0:	ffffd097          	auipc	ra,0xffffd
    80003cc4:	768080e7          	jalr	1896(ra) # 80001428 <_Z15thread_dispatchv>
}
    80003cc8:	01813083          	ld	ra,24(sp)
    80003ccc:	01013403          	ld	s0,16(sp)
    80003cd0:	00813483          	ld	s1,8(sp)
    80003cd4:	00013903          	ld	s2,0(sp)
    80003cd8:	02010113          	addi	sp,sp,32
    80003cdc:	00008067          	ret

0000000080003ce0 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80003ce0:	fe010113          	addi	sp,sp,-32
    80003ce4:	00113c23          	sd	ra,24(sp)
    80003ce8:	00813823          	sd	s0,16(sp)
    80003cec:	00913423          	sd	s1,8(sp)
    80003cf0:	01213023          	sd	s2,0(sp)
    80003cf4:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80003cf8:	00000493          	li	s1,0
    80003cfc:	0400006f          	j	80003d3c <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003d00:	00005517          	auipc	a0,0x5
    80003d04:	66850513          	addi	a0,a0,1640 # 80009368 <CONSOLE_STATUS+0x358>
    80003d08:	00002097          	auipc	ra,0x2
    80003d0c:	d48080e7          	jalr	-696(ra) # 80005a50 <_Z11printStringPKc>
    80003d10:	00000613          	li	a2,0
    80003d14:	00a00593          	li	a1,10
    80003d18:	00048513          	mv	a0,s1
    80003d1c:	00002097          	auipc	ra,0x2
    80003d20:	ee4080e7          	jalr	-284(ra) # 80005c00 <_Z8printIntiii>
    80003d24:	00006517          	auipc	a0,0x6
    80003d28:	86450513          	addi	a0,a0,-1948 # 80009588 <CONSOLE_STATUS+0x578>
    80003d2c:	00002097          	auipc	ra,0x2
    80003d30:	d24080e7          	jalr	-732(ra) # 80005a50 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80003d34:	0014849b          	addiw	s1,s1,1
    80003d38:	0ff4f493          	andi	s1,s1,255
    80003d3c:	00200793          	li	a5,2
    80003d40:	fc97f0e3          	bgeu	a5,s1,80003d00 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80003d44:	00005517          	auipc	a0,0x5
    80003d48:	62c50513          	addi	a0,a0,1580 # 80009370 <CONSOLE_STATUS+0x360>
    80003d4c:	00002097          	auipc	ra,0x2
    80003d50:	d04080e7          	jalr	-764(ra) # 80005a50 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80003d54:	00700313          	li	t1,7
    thread_dispatch();
    80003d58:	ffffd097          	auipc	ra,0xffffd
    80003d5c:	6d0080e7          	jalr	1744(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80003d60:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80003d64:	00005517          	auipc	a0,0x5
    80003d68:	61c50513          	addi	a0,a0,1564 # 80009380 <CONSOLE_STATUS+0x370>
    80003d6c:	00002097          	auipc	ra,0x2
    80003d70:	ce4080e7          	jalr	-796(ra) # 80005a50 <_Z11printStringPKc>
    80003d74:	00000613          	li	a2,0
    80003d78:	00a00593          	li	a1,10
    80003d7c:	0009051b          	sext.w	a0,s2
    80003d80:	00002097          	auipc	ra,0x2
    80003d84:	e80080e7          	jalr	-384(ra) # 80005c00 <_Z8printIntiii>
    80003d88:	00006517          	auipc	a0,0x6
    80003d8c:	80050513          	addi	a0,a0,-2048 # 80009588 <CONSOLE_STATUS+0x578>
    80003d90:	00002097          	auipc	ra,0x2
    80003d94:	cc0080e7          	jalr	-832(ra) # 80005a50 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80003d98:	00c00513          	li	a0,12
    80003d9c:	00000097          	auipc	ra,0x0
    80003da0:	d30080e7          	jalr	-720(ra) # 80003acc <_ZL9fibonaccim>
    80003da4:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80003da8:	00005517          	auipc	a0,0x5
    80003dac:	5e050513          	addi	a0,a0,1504 # 80009388 <CONSOLE_STATUS+0x378>
    80003db0:	00002097          	auipc	ra,0x2
    80003db4:	ca0080e7          	jalr	-864(ra) # 80005a50 <_Z11printStringPKc>
    80003db8:	00000613          	li	a2,0
    80003dbc:	00a00593          	li	a1,10
    80003dc0:	0009051b          	sext.w	a0,s2
    80003dc4:	00002097          	auipc	ra,0x2
    80003dc8:	e3c080e7          	jalr	-452(ra) # 80005c00 <_Z8printIntiii>
    80003dcc:	00005517          	auipc	a0,0x5
    80003dd0:	7bc50513          	addi	a0,a0,1980 # 80009588 <CONSOLE_STATUS+0x578>
    80003dd4:	00002097          	auipc	ra,0x2
    80003dd8:	c7c080e7          	jalr	-900(ra) # 80005a50 <_Z11printStringPKc>
    80003ddc:	0400006f          	j	80003e1c <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003de0:	00005517          	auipc	a0,0x5
    80003de4:	58850513          	addi	a0,a0,1416 # 80009368 <CONSOLE_STATUS+0x358>
    80003de8:	00002097          	auipc	ra,0x2
    80003dec:	c68080e7          	jalr	-920(ra) # 80005a50 <_Z11printStringPKc>
    80003df0:	00000613          	li	a2,0
    80003df4:	00a00593          	li	a1,10
    80003df8:	00048513          	mv	a0,s1
    80003dfc:	00002097          	auipc	ra,0x2
    80003e00:	e04080e7          	jalr	-508(ra) # 80005c00 <_Z8printIntiii>
    80003e04:	00005517          	auipc	a0,0x5
    80003e08:	78450513          	addi	a0,a0,1924 # 80009588 <CONSOLE_STATUS+0x578>
    80003e0c:	00002097          	auipc	ra,0x2
    80003e10:	c44080e7          	jalr	-956(ra) # 80005a50 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80003e14:	0014849b          	addiw	s1,s1,1
    80003e18:	0ff4f493          	andi	s1,s1,255
    80003e1c:	00500793          	li	a5,5
    80003e20:	fc97f0e3          	bgeu	a5,s1,80003de0 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    80003e24:	00005517          	auipc	a0,0x5
    80003e28:	51c50513          	addi	a0,a0,1308 # 80009340 <CONSOLE_STATUS+0x330>
    80003e2c:	00002097          	auipc	ra,0x2
    80003e30:	c24080e7          	jalr	-988(ra) # 80005a50 <_Z11printStringPKc>
    finishedC = true;
    80003e34:	00100793          	li	a5,1
    80003e38:	00008717          	auipc	a4,0x8
    80003e3c:	def70123          	sb	a5,-542(a4) # 8000bc1a <_ZL9finishedC>
    thread_dispatch();
    80003e40:	ffffd097          	auipc	ra,0xffffd
    80003e44:	5e8080e7          	jalr	1512(ra) # 80001428 <_Z15thread_dispatchv>
}
    80003e48:	01813083          	ld	ra,24(sp)
    80003e4c:	01013403          	ld	s0,16(sp)
    80003e50:	00813483          	ld	s1,8(sp)
    80003e54:	00013903          	ld	s2,0(sp)
    80003e58:	02010113          	addi	sp,sp,32
    80003e5c:	00008067          	ret

0000000080003e60 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80003e60:	fe010113          	addi	sp,sp,-32
    80003e64:	00113c23          	sd	ra,24(sp)
    80003e68:	00813823          	sd	s0,16(sp)
    80003e6c:	00913423          	sd	s1,8(sp)
    80003e70:	01213023          	sd	s2,0(sp)
    80003e74:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80003e78:	00a00493          	li	s1,10
    80003e7c:	0400006f          	j	80003ebc <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003e80:	00005517          	auipc	a0,0x5
    80003e84:	51850513          	addi	a0,a0,1304 # 80009398 <CONSOLE_STATUS+0x388>
    80003e88:	00002097          	auipc	ra,0x2
    80003e8c:	bc8080e7          	jalr	-1080(ra) # 80005a50 <_Z11printStringPKc>
    80003e90:	00000613          	li	a2,0
    80003e94:	00a00593          	li	a1,10
    80003e98:	00048513          	mv	a0,s1
    80003e9c:	00002097          	auipc	ra,0x2
    80003ea0:	d64080e7          	jalr	-668(ra) # 80005c00 <_Z8printIntiii>
    80003ea4:	00005517          	auipc	a0,0x5
    80003ea8:	6e450513          	addi	a0,a0,1764 # 80009588 <CONSOLE_STATUS+0x578>
    80003eac:	00002097          	auipc	ra,0x2
    80003eb0:	ba4080e7          	jalr	-1116(ra) # 80005a50 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80003eb4:	0014849b          	addiw	s1,s1,1
    80003eb8:	0ff4f493          	andi	s1,s1,255
    80003ebc:	00c00793          	li	a5,12
    80003ec0:	fc97f0e3          	bgeu	a5,s1,80003e80 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80003ec4:	00005517          	auipc	a0,0x5
    80003ec8:	4dc50513          	addi	a0,a0,1244 # 800093a0 <CONSOLE_STATUS+0x390>
    80003ecc:	00002097          	auipc	ra,0x2
    80003ed0:	b84080e7          	jalr	-1148(ra) # 80005a50 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80003ed4:	00500313          	li	t1,5
    thread_dispatch();
    80003ed8:	ffffd097          	auipc	ra,0xffffd
    80003edc:	550080e7          	jalr	1360(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80003ee0:	01000513          	li	a0,16
    80003ee4:	00000097          	auipc	ra,0x0
    80003ee8:	be8080e7          	jalr	-1048(ra) # 80003acc <_ZL9fibonaccim>
    80003eec:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80003ef0:	00005517          	auipc	a0,0x5
    80003ef4:	4c050513          	addi	a0,a0,1216 # 800093b0 <CONSOLE_STATUS+0x3a0>
    80003ef8:	00002097          	auipc	ra,0x2
    80003efc:	b58080e7          	jalr	-1192(ra) # 80005a50 <_Z11printStringPKc>
    80003f00:	00000613          	li	a2,0
    80003f04:	00a00593          	li	a1,10
    80003f08:	0009051b          	sext.w	a0,s2
    80003f0c:	00002097          	auipc	ra,0x2
    80003f10:	cf4080e7          	jalr	-780(ra) # 80005c00 <_Z8printIntiii>
    80003f14:	00005517          	auipc	a0,0x5
    80003f18:	67450513          	addi	a0,a0,1652 # 80009588 <CONSOLE_STATUS+0x578>
    80003f1c:	00002097          	auipc	ra,0x2
    80003f20:	b34080e7          	jalr	-1228(ra) # 80005a50 <_Z11printStringPKc>
    80003f24:	0400006f          	j	80003f64 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003f28:	00005517          	auipc	a0,0x5
    80003f2c:	47050513          	addi	a0,a0,1136 # 80009398 <CONSOLE_STATUS+0x388>
    80003f30:	00002097          	auipc	ra,0x2
    80003f34:	b20080e7          	jalr	-1248(ra) # 80005a50 <_Z11printStringPKc>
    80003f38:	00000613          	li	a2,0
    80003f3c:	00a00593          	li	a1,10
    80003f40:	00048513          	mv	a0,s1
    80003f44:	00002097          	auipc	ra,0x2
    80003f48:	cbc080e7          	jalr	-836(ra) # 80005c00 <_Z8printIntiii>
    80003f4c:	00005517          	auipc	a0,0x5
    80003f50:	63c50513          	addi	a0,a0,1596 # 80009588 <CONSOLE_STATUS+0x578>
    80003f54:	00002097          	auipc	ra,0x2
    80003f58:	afc080e7          	jalr	-1284(ra) # 80005a50 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80003f5c:	0014849b          	addiw	s1,s1,1
    80003f60:	0ff4f493          	andi	s1,s1,255
    80003f64:	00f00793          	li	a5,15
    80003f68:	fc97f0e3          	bgeu	a5,s1,80003f28 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80003f6c:	00005517          	auipc	a0,0x5
    80003f70:	45450513          	addi	a0,a0,1108 # 800093c0 <CONSOLE_STATUS+0x3b0>
    80003f74:	00002097          	auipc	ra,0x2
    80003f78:	adc080e7          	jalr	-1316(ra) # 80005a50 <_Z11printStringPKc>
    finishedD = true;
    80003f7c:	00100793          	li	a5,1
    80003f80:	00008717          	auipc	a4,0x8
    80003f84:	c8f70da3          	sb	a5,-869(a4) # 8000bc1b <_ZL9finishedD>
    thread_dispatch();
    80003f88:	ffffd097          	auipc	ra,0xffffd
    80003f8c:	4a0080e7          	jalr	1184(ra) # 80001428 <_Z15thread_dispatchv>
}
    80003f90:	01813083          	ld	ra,24(sp)
    80003f94:	01013403          	ld	s0,16(sp)
    80003f98:	00813483          	ld	s1,8(sp)
    80003f9c:	00013903          	ld	s2,0(sp)
    80003fa0:	02010113          	addi	sp,sp,32
    80003fa4:	00008067          	ret

0000000080003fa8 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80003fa8:	fc010113          	addi	sp,sp,-64
    80003fac:	02113c23          	sd	ra,56(sp)
    80003fb0:	02813823          	sd	s0,48(sp)
    80003fb4:	02913423          	sd	s1,40(sp)
    80003fb8:	03213023          	sd	s2,32(sp)
    80003fbc:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80003fc0:	02000513          	li	a0,32
    80003fc4:	ffffe097          	auipc	ra,0xffffe
    80003fc8:	6f4080e7          	jalr	1780(ra) # 800026b8 <_Znwm>
    80003fcc:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80003fd0:	fffff097          	auipc	ra,0xfffff
    80003fd4:	960080e7          	jalr	-1696(ra) # 80002930 <_ZN6ThreadC1Ev>
    80003fd8:	00008797          	auipc	a5,0x8
    80003fdc:	8f878793          	addi	a5,a5,-1800 # 8000b8d0 <_ZTV7WorkerA+0x10>
    80003fe0:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80003fe4:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80003fe8:	00005517          	auipc	a0,0x5
    80003fec:	3e850513          	addi	a0,a0,1000 # 800093d0 <CONSOLE_STATUS+0x3c0>
    80003ff0:	00002097          	auipc	ra,0x2
    80003ff4:	a60080e7          	jalr	-1440(ra) # 80005a50 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80003ff8:	02000513          	li	a0,32
    80003ffc:	ffffe097          	auipc	ra,0xffffe
    80004000:	6bc080e7          	jalr	1724(ra) # 800026b8 <_Znwm>
    80004004:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80004008:	fffff097          	auipc	ra,0xfffff
    8000400c:	928080e7          	jalr	-1752(ra) # 80002930 <_ZN6ThreadC1Ev>
    80004010:	00008797          	auipc	a5,0x8
    80004014:	8e878793          	addi	a5,a5,-1816 # 8000b8f8 <_ZTV7WorkerB+0x10>
    80004018:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    8000401c:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80004020:	00005517          	auipc	a0,0x5
    80004024:	3c850513          	addi	a0,a0,968 # 800093e8 <CONSOLE_STATUS+0x3d8>
    80004028:	00002097          	auipc	ra,0x2
    8000402c:	a28080e7          	jalr	-1496(ra) # 80005a50 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80004030:	02000513          	li	a0,32
    80004034:	ffffe097          	auipc	ra,0xffffe
    80004038:	684080e7          	jalr	1668(ra) # 800026b8 <_Znwm>
    8000403c:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80004040:	fffff097          	auipc	ra,0xfffff
    80004044:	8f0080e7          	jalr	-1808(ra) # 80002930 <_ZN6ThreadC1Ev>
    80004048:	00008797          	auipc	a5,0x8
    8000404c:	8d878793          	addi	a5,a5,-1832 # 8000b920 <_ZTV7WorkerC+0x10>
    80004050:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80004054:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80004058:	00005517          	auipc	a0,0x5
    8000405c:	3a850513          	addi	a0,a0,936 # 80009400 <CONSOLE_STATUS+0x3f0>
    80004060:	00002097          	auipc	ra,0x2
    80004064:	9f0080e7          	jalr	-1552(ra) # 80005a50 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80004068:	02000513          	li	a0,32
    8000406c:	ffffe097          	auipc	ra,0xffffe
    80004070:	64c080e7          	jalr	1612(ra) # 800026b8 <_Znwm>
    80004074:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80004078:	fffff097          	auipc	ra,0xfffff
    8000407c:	8b8080e7          	jalr	-1864(ra) # 80002930 <_ZN6ThreadC1Ev>
    80004080:	00008797          	auipc	a5,0x8
    80004084:	8c878793          	addi	a5,a5,-1848 # 8000b948 <_ZTV7WorkerD+0x10>
    80004088:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    8000408c:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80004090:	00005517          	auipc	a0,0x5
    80004094:	38850513          	addi	a0,a0,904 # 80009418 <CONSOLE_STATUS+0x408>
    80004098:	00002097          	auipc	ra,0x2
    8000409c:	9b8080e7          	jalr	-1608(ra) # 80005a50 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    800040a0:	00000493          	li	s1,0
    800040a4:	00300793          	li	a5,3
    800040a8:	0297c663          	blt	a5,s1,800040d4 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    800040ac:	00349793          	slli	a5,s1,0x3
    800040b0:	fe040713          	addi	a4,s0,-32
    800040b4:	00f707b3          	add	a5,a4,a5
    800040b8:	fe07b503          	ld	a0,-32(a5)
    800040bc:	ffffe097          	auipc	ra,0xffffe
    800040c0:	7ac080e7          	jalr	1964(ra) # 80002868 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    800040c4:	0014849b          	addiw	s1,s1,1
    800040c8:	fddff06f          	j	800040a4 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    800040cc:	fffff097          	auipc	ra,0xfffff
    800040d0:	800080e7          	jalr	-2048(ra) # 800028cc <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800040d4:	00008797          	auipc	a5,0x8
    800040d8:	b447c783          	lbu	a5,-1212(a5) # 8000bc18 <_ZL9finishedA>
    800040dc:	fe0788e3          	beqz	a5,800040cc <_Z20Threads_CPP_API_testv+0x124>
    800040e0:	00008797          	auipc	a5,0x8
    800040e4:	b397c783          	lbu	a5,-1223(a5) # 8000bc19 <_ZL9finishedB>
    800040e8:	fe0782e3          	beqz	a5,800040cc <_Z20Threads_CPP_API_testv+0x124>
    800040ec:	00008797          	auipc	a5,0x8
    800040f0:	b2e7c783          	lbu	a5,-1234(a5) # 8000bc1a <_ZL9finishedC>
    800040f4:	fc078ce3          	beqz	a5,800040cc <_Z20Threads_CPP_API_testv+0x124>
    800040f8:	00008797          	auipc	a5,0x8
    800040fc:	b237c783          	lbu	a5,-1245(a5) # 8000bc1b <_ZL9finishedD>
    80004100:	fc0786e3          	beqz	a5,800040cc <_Z20Threads_CPP_API_testv+0x124>
    80004104:	fc040493          	addi	s1,s0,-64
    80004108:	0080006f          	j	80004110 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    8000410c:	00848493          	addi	s1,s1,8
    80004110:	fe040793          	addi	a5,s0,-32
    80004114:	08f48663          	beq	s1,a5,800041a0 <_Z20Threads_CPP_API_testv+0x1f8>
    80004118:	0004b503          	ld	a0,0(s1)
    8000411c:	fe0508e3          	beqz	a0,8000410c <_Z20Threads_CPP_API_testv+0x164>
    80004120:	00053783          	ld	a5,0(a0)
    80004124:	0087b783          	ld	a5,8(a5)
    80004128:	000780e7          	jalr	a5
    8000412c:	fe1ff06f          	j	8000410c <_Z20Threads_CPP_API_testv+0x164>
    80004130:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80004134:	00048513          	mv	a0,s1
    80004138:	ffffe097          	auipc	ra,0xffffe
    8000413c:	5d0080e7          	jalr	1488(ra) # 80002708 <_ZdlPv>
    80004140:	00090513          	mv	a0,s2
    80004144:	00009097          	auipc	ra,0x9
    80004148:	be4080e7          	jalr	-1052(ra) # 8000cd28 <_Unwind_Resume>
    8000414c:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80004150:	00048513          	mv	a0,s1
    80004154:	ffffe097          	auipc	ra,0xffffe
    80004158:	5b4080e7          	jalr	1460(ra) # 80002708 <_ZdlPv>
    8000415c:	00090513          	mv	a0,s2
    80004160:	00009097          	auipc	ra,0x9
    80004164:	bc8080e7          	jalr	-1080(ra) # 8000cd28 <_Unwind_Resume>
    80004168:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    8000416c:	00048513          	mv	a0,s1
    80004170:	ffffe097          	auipc	ra,0xffffe
    80004174:	598080e7          	jalr	1432(ra) # 80002708 <_ZdlPv>
    80004178:	00090513          	mv	a0,s2
    8000417c:	00009097          	auipc	ra,0x9
    80004180:	bac080e7          	jalr	-1108(ra) # 8000cd28 <_Unwind_Resume>
    80004184:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80004188:	00048513          	mv	a0,s1
    8000418c:	ffffe097          	auipc	ra,0xffffe
    80004190:	57c080e7          	jalr	1404(ra) # 80002708 <_ZdlPv>
    80004194:	00090513          	mv	a0,s2
    80004198:	00009097          	auipc	ra,0x9
    8000419c:	b90080e7          	jalr	-1136(ra) # 8000cd28 <_Unwind_Resume>
}
    800041a0:	03813083          	ld	ra,56(sp)
    800041a4:	03013403          	ld	s0,48(sp)
    800041a8:	02813483          	ld	s1,40(sp)
    800041ac:	02013903          	ld	s2,32(sp)
    800041b0:	04010113          	addi	sp,sp,64
    800041b4:	00008067          	ret

00000000800041b8 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    800041b8:	ff010113          	addi	sp,sp,-16
    800041bc:	00113423          	sd	ra,8(sp)
    800041c0:	00813023          	sd	s0,0(sp)
    800041c4:	01010413          	addi	s0,sp,16
    800041c8:	00007797          	auipc	a5,0x7
    800041cc:	70878793          	addi	a5,a5,1800 # 8000b8d0 <_ZTV7WorkerA+0x10>
    800041d0:	00f53023          	sd	a5,0(a0)
    800041d4:	ffffe097          	auipc	ra,0xffffe
    800041d8:	438080e7          	jalr	1080(ra) # 8000260c <_ZN6ThreadD1Ev>
    800041dc:	00813083          	ld	ra,8(sp)
    800041e0:	00013403          	ld	s0,0(sp)
    800041e4:	01010113          	addi	sp,sp,16
    800041e8:	00008067          	ret

00000000800041ec <_ZN7WorkerAD0Ev>:
    800041ec:	fe010113          	addi	sp,sp,-32
    800041f0:	00113c23          	sd	ra,24(sp)
    800041f4:	00813823          	sd	s0,16(sp)
    800041f8:	00913423          	sd	s1,8(sp)
    800041fc:	02010413          	addi	s0,sp,32
    80004200:	00050493          	mv	s1,a0
    80004204:	00007797          	auipc	a5,0x7
    80004208:	6cc78793          	addi	a5,a5,1740 # 8000b8d0 <_ZTV7WorkerA+0x10>
    8000420c:	00f53023          	sd	a5,0(a0)
    80004210:	ffffe097          	auipc	ra,0xffffe
    80004214:	3fc080e7          	jalr	1020(ra) # 8000260c <_ZN6ThreadD1Ev>
    80004218:	00048513          	mv	a0,s1
    8000421c:	ffffe097          	auipc	ra,0xffffe
    80004220:	4ec080e7          	jalr	1260(ra) # 80002708 <_ZdlPv>
    80004224:	01813083          	ld	ra,24(sp)
    80004228:	01013403          	ld	s0,16(sp)
    8000422c:	00813483          	ld	s1,8(sp)
    80004230:	02010113          	addi	sp,sp,32
    80004234:	00008067          	ret

0000000080004238 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80004238:	ff010113          	addi	sp,sp,-16
    8000423c:	00113423          	sd	ra,8(sp)
    80004240:	00813023          	sd	s0,0(sp)
    80004244:	01010413          	addi	s0,sp,16
    80004248:	00007797          	auipc	a5,0x7
    8000424c:	6b078793          	addi	a5,a5,1712 # 8000b8f8 <_ZTV7WorkerB+0x10>
    80004250:	00f53023          	sd	a5,0(a0)
    80004254:	ffffe097          	auipc	ra,0xffffe
    80004258:	3b8080e7          	jalr	952(ra) # 8000260c <_ZN6ThreadD1Ev>
    8000425c:	00813083          	ld	ra,8(sp)
    80004260:	00013403          	ld	s0,0(sp)
    80004264:	01010113          	addi	sp,sp,16
    80004268:	00008067          	ret

000000008000426c <_ZN7WorkerBD0Ev>:
    8000426c:	fe010113          	addi	sp,sp,-32
    80004270:	00113c23          	sd	ra,24(sp)
    80004274:	00813823          	sd	s0,16(sp)
    80004278:	00913423          	sd	s1,8(sp)
    8000427c:	02010413          	addi	s0,sp,32
    80004280:	00050493          	mv	s1,a0
    80004284:	00007797          	auipc	a5,0x7
    80004288:	67478793          	addi	a5,a5,1652 # 8000b8f8 <_ZTV7WorkerB+0x10>
    8000428c:	00f53023          	sd	a5,0(a0)
    80004290:	ffffe097          	auipc	ra,0xffffe
    80004294:	37c080e7          	jalr	892(ra) # 8000260c <_ZN6ThreadD1Ev>
    80004298:	00048513          	mv	a0,s1
    8000429c:	ffffe097          	auipc	ra,0xffffe
    800042a0:	46c080e7          	jalr	1132(ra) # 80002708 <_ZdlPv>
    800042a4:	01813083          	ld	ra,24(sp)
    800042a8:	01013403          	ld	s0,16(sp)
    800042ac:	00813483          	ld	s1,8(sp)
    800042b0:	02010113          	addi	sp,sp,32
    800042b4:	00008067          	ret

00000000800042b8 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    800042b8:	ff010113          	addi	sp,sp,-16
    800042bc:	00113423          	sd	ra,8(sp)
    800042c0:	00813023          	sd	s0,0(sp)
    800042c4:	01010413          	addi	s0,sp,16
    800042c8:	00007797          	auipc	a5,0x7
    800042cc:	65878793          	addi	a5,a5,1624 # 8000b920 <_ZTV7WorkerC+0x10>
    800042d0:	00f53023          	sd	a5,0(a0)
    800042d4:	ffffe097          	auipc	ra,0xffffe
    800042d8:	338080e7          	jalr	824(ra) # 8000260c <_ZN6ThreadD1Ev>
    800042dc:	00813083          	ld	ra,8(sp)
    800042e0:	00013403          	ld	s0,0(sp)
    800042e4:	01010113          	addi	sp,sp,16
    800042e8:	00008067          	ret

00000000800042ec <_ZN7WorkerCD0Ev>:
    800042ec:	fe010113          	addi	sp,sp,-32
    800042f0:	00113c23          	sd	ra,24(sp)
    800042f4:	00813823          	sd	s0,16(sp)
    800042f8:	00913423          	sd	s1,8(sp)
    800042fc:	02010413          	addi	s0,sp,32
    80004300:	00050493          	mv	s1,a0
    80004304:	00007797          	auipc	a5,0x7
    80004308:	61c78793          	addi	a5,a5,1564 # 8000b920 <_ZTV7WorkerC+0x10>
    8000430c:	00f53023          	sd	a5,0(a0)
    80004310:	ffffe097          	auipc	ra,0xffffe
    80004314:	2fc080e7          	jalr	764(ra) # 8000260c <_ZN6ThreadD1Ev>
    80004318:	00048513          	mv	a0,s1
    8000431c:	ffffe097          	auipc	ra,0xffffe
    80004320:	3ec080e7          	jalr	1004(ra) # 80002708 <_ZdlPv>
    80004324:	01813083          	ld	ra,24(sp)
    80004328:	01013403          	ld	s0,16(sp)
    8000432c:	00813483          	ld	s1,8(sp)
    80004330:	02010113          	addi	sp,sp,32
    80004334:	00008067          	ret

0000000080004338 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80004338:	ff010113          	addi	sp,sp,-16
    8000433c:	00113423          	sd	ra,8(sp)
    80004340:	00813023          	sd	s0,0(sp)
    80004344:	01010413          	addi	s0,sp,16
    80004348:	00007797          	auipc	a5,0x7
    8000434c:	60078793          	addi	a5,a5,1536 # 8000b948 <_ZTV7WorkerD+0x10>
    80004350:	00f53023          	sd	a5,0(a0)
    80004354:	ffffe097          	auipc	ra,0xffffe
    80004358:	2b8080e7          	jalr	696(ra) # 8000260c <_ZN6ThreadD1Ev>
    8000435c:	00813083          	ld	ra,8(sp)
    80004360:	00013403          	ld	s0,0(sp)
    80004364:	01010113          	addi	sp,sp,16
    80004368:	00008067          	ret

000000008000436c <_ZN7WorkerDD0Ev>:
    8000436c:	fe010113          	addi	sp,sp,-32
    80004370:	00113c23          	sd	ra,24(sp)
    80004374:	00813823          	sd	s0,16(sp)
    80004378:	00913423          	sd	s1,8(sp)
    8000437c:	02010413          	addi	s0,sp,32
    80004380:	00050493          	mv	s1,a0
    80004384:	00007797          	auipc	a5,0x7
    80004388:	5c478793          	addi	a5,a5,1476 # 8000b948 <_ZTV7WorkerD+0x10>
    8000438c:	00f53023          	sd	a5,0(a0)
    80004390:	ffffe097          	auipc	ra,0xffffe
    80004394:	27c080e7          	jalr	636(ra) # 8000260c <_ZN6ThreadD1Ev>
    80004398:	00048513          	mv	a0,s1
    8000439c:	ffffe097          	auipc	ra,0xffffe
    800043a0:	36c080e7          	jalr	876(ra) # 80002708 <_ZdlPv>
    800043a4:	01813083          	ld	ra,24(sp)
    800043a8:	01013403          	ld	s0,16(sp)
    800043ac:	00813483          	ld	s1,8(sp)
    800043b0:	02010113          	addi	sp,sp,32
    800043b4:	00008067          	ret

00000000800043b8 <_ZN7WorkerA3runEv>:
    void run() override {
    800043b8:	ff010113          	addi	sp,sp,-16
    800043bc:	00113423          	sd	ra,8(sp)
    800043c0:	00813023          	sd	s0,0(sp)
    800043c4:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    800043c8:	00000593          	li	a1,0
    800043cc:	fffff097          	auipc	ra,0xfffff
    800043d0:	774080e7          	jalr	1908(ra) # 80003b40 <_ZN7WorkerA11workerBodyAEPv>
    }
    800043d4:	00813083          	ld	ra,8(sp)
    800043d8:	00013403          	ld	s0,0(sp)
    800043dc:	01010113          	addi	sp,sp,16
    800043e0:	00008067          	ret

00000000800043e4 <_ZN7WorkerB3runEv>:
    void run() override {
    800043e4:	ff010113          	addi	sp,sp,-16
    800043e8:	00113423          	sd	ra,8(sp)
    800043ec:	00813023          	sd	s0,0(sp)
    800043f0:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    800043f4:	00000593          	li	a1,0
    800043f8:	00000097          	auipc	ra,0x0
    800043fc:	814080e7          	jalr	-2028(ra) # 80003c0c <_ZN7WorkerB11workerBodyBEPv>
    }
    80004400:	00813083          	ld	ra,8(sp)
    80004404:	00013403          	ld	s0,0(sp)
    80004408:	01010113          	addi	sp,sp,16
    8000440c:	00008067          	ret

0000000080004410 <_ZN7WorkerC3runEv>:
    void run() override {
    80004410:	ff010113          	addi	sp,sp,-16
    80004414:	00113423          	sd	ra,8(sp)
    80004418:	00813023          	sd	s0,0(sp)
    8000441c:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80004420:	00000593          	li	a1,0
    80004424:	00000097          	auipc	ra,0x0
    80004428:	8bc080e7          	jalr	-1860(ra) # 80003ce0 <_ZN7WorkerC11workerBodyCEPv>
    }
    8000442c:	00813083          	ld	ra,8(sp)
    80004430:	00013403          	ld	s0,0(sp)
    80004434:	01010113          	addi	sp,sp,16
    80004438:	00008067          	ret

000000008000443c <_ZN7WorkerD3runEv>:
    void run() override {
    8000443c:	ff010113          	addi	sp,sp,-16
    80004440:	00113423          	sd	ra,8(sp)
    80004444:	00813023          	sd	s0,0(sp)
    80004448:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    8000444c:	00000593          	li	a1,0
    80004450:	00000097          	auipc	ra,0x0
    80004454:	a10080e7          	jalr	-1520(ra) # 80003e60 <_ZN7WorkerD11workerBodyDEPv>
    }
    80004458:	00813083          	ld	ra,8(sp)
    8000445c:	00013403          	ld	s0,0(sp)
    80004460:	01010113          	addi	sp,sp,16
    80004464:	00008067          	ret

0000000080004468 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    80004468:	f8010113          	addi	sp,sp,-128
    8000446c:	06113c23          	sd	ra,120(sp)
    80004470:	06813823          	sd	s0,112(sp)
    80004474:	06913423          	sd	s1,104(sp)
    80004478:	07213023          	sd	s2,96(sp)
    8000447c:	05313c23          	sd	s3,88(sp)
    80004480:	05413823          	sd	s4,80(sp)
    80004484:	05513423          	sd	s5,72(sp)
    80004488:	05613023          	sd	s6,64(sp)
    8000448c:	03713c23          	sd	s7,56(sp)
    80004490:	03813823          	sd	s8,48(sp)
    80004494:	03913423          	sd	s9,40(sp)
    80004498:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    8000449c:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    800044a0:	00005517          	auipc	a0,0x5
    800044a4:	db050513          	addi	a0,a0,-592 # 80009250 <CONSOLE_STATUS+0x240>
    800044a8:	00001097          	auipc	ra,0x1
    800044ac:	5a8080e7          	jalr	1448(ra) # 80005a50 <_Z11printStringPKc>
    getString(input, 30);
    800044b0:	01e00593          	li	a1,30
    800044b4:	f8040493          	addi	s1,s0,-128
    800044b8:	00048513          	mv	a0,s1
    800044bc:	00001097          	auipc	ra,0x1
    800044c0:	61c080e7          	jalr	1564(ra) # 80005ad8 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800044c4:	00048513          	mv	a0,s1
    800044c8:	00001097          	auipc	ra,0x1
    800044cc:	6e8080e7          	jalr	1768(ra) # 80005bb0 <_Z11stringToIntPKc>
    800044d0:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    800044d4:	00005517          	auipc	a0,0x5
    800044d8:	d9c50513          	addi	a0,a0,-612 # 80009270 <CONSOLE_STATUS+0x260>
    800044dc:	00001097          	auipc	ra,0x1
    800044e0:	574080e7          	jalr	1396(ra) # 80005a50 <_Z11printStringPKc>
    getString(input, 30);
    800044e4:	01e00593          	li	a1,30
    800044e8:	00048513          	mv	a0,s1
    800044ec:	00001097          	auipc	ra,0x1
    800044f0:	5ec080e7          	jalr	1516(ra) # 80005ad8 <_Z9getStringPci>
    n = stringToInt(input);
    800044f4:	00048513          	mv	a0,s1
    800044f8:	00001097          	auipc	ra,0x1
    800044fc:	6b8080e7          	jalr	1720(ra) # 80005bb0 <_Z11stringToIntPKc>
    80004500:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80004504:	00005517          	auipc	a0,0x5
    80004508:	d8c50513          	addi	a0,a0,-628 # 80009290 <CONSOLE_STATUS+0x280>
    8000450c:	00001097          	auipc	ra,0x1
    80004510:	544080e7          	jalr	1348(ra) # 80005a50 <_Z11printStringPKc>
    printInt(threadNum);
    80004514:	00000613          	li	a2,0
    80004518:	00a00593          	li	a1,10
    8000451c:	00098513          	mv	a0,s3
    80004520:	00001097          	auipc	ra,0x1
    80004524:	6e0080e7          	jalr	1760(ra) # 80005c00 <_Z8printIntiii>
    printString(" i velicina bafera ");
    80004528:	00005517          	auipc	a0,0x5
    8000452c:	d8050513          	addi	a0,a0,-640 # 800092a8 <CONSOLE_STATUS+0x298>
    80004530:	00001097          	auipc	ra,0x1
    80004534:	520080e7          	jalr	1312(ra) # 80005a50 <_Z11printStringPKc>
    printInt(n);
    80004538:	00000613          	li	a2,0
    8000453c:	00a00593          	li	a1,10
    80004540:	00048513          	mv	a0,s1
    80004544:	00001097          	auipc	ra,0x1
    80004548:	6bc080e7          	jalr	1724(ra) # 80005c00 <_Z8printIntiii>
    printString(".\n");
    8000454c:	00005517          	auipc	a0,0x5
    80004550:	d7450513          	addi	a0,a0,-652 # 800092c0 <CONSOLE_STATUS+0x2b0>
    80004554:	00001097          	auipc	ra,0x1
    80004558:	4fc080e7          	jalr	1276(ra) # 80005a50 <_Z11printStringPKc>
    if (threadNum > n) {
    8000455c:	0334c463          	blt	s1,s3,80004584 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    80004560:	03305c63          	blez	s3,80004598 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80004564:	03800513          	li	a0,56
    80004568:	ffffe097          	auipc	ra,0xffffe
    8000456c:	150080e7          	jalr	336(ra) # 800026b8 <_Znwm>
    80004570:	00050a93          	mv	s5,a0
    80004574:	00048593          	mv	a1,s1
    80004578:	00001097          	auipc	ra,0x1
    8000457c:	7a8080e7          	jalr	1960(ra) # 80005d20 <_ZN9BufferCPPC1Ei>
    80004580:	0300006f          	j	800045b0 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80004584:	00005517          	auipc	a0,0x5
    80004588:	d4450513          	addi	a0,a0,-700 # 800092c8 <CONSOLE_STATUS+0x2b8>
    8000458c:	00001097          	auipc	ra,0x1
    80004590:	4c4080e7          	jalr	1220(ra) # 80005a50 <_Z11printStringPKc>
        return;
    80004594:	0140006f          	j	800045a8 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80004598:	00005517          	auipc	a0,0x5
    8000459c:	d7050513          	addi	a0,a0,-656 # 80009308 <CONSOLE_STATUS+0x2f8>
    800045a0:	00001097          	auipc	ra,0x1
    800045a4:	4b0080e7          	jalr	1200(ra) # 80005a50 <_Z11printStringPKc>
        return;
    800045a8:	000c0113          	mv	sp,s8
    800045ac:	2140006f          	j	800047c0 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    800045b0:	01000513          	li	a0,16
    800045b4:	ffffe097          	auipc	ra,0xffffe
    800045b8:	104080e7          	jalr	260(ra) # 800026b8 <_Znwm>
    800045bc:	00050913          	mv	s2,a0
    800045c0:	00000593          	li	a1,0
    800045c4:	ffffe097          	auipc	ra,0xffffe
    800045c8:	3e8080e7          	jalr	1000(ra) # 800029ac <_ZN9SemaphoreC1Ej>
    800045cc:	00007797          	auipc	a5,0x7
    800045d0:	6527be23          	sd	s2,1628(a5) # 8000bc28 <_ZL10waitForAll>
    Thread *producers[threadNum];
    800045d4:	00399793          	slli	a5,s3,0x3
    800045d8:	00f78793          	addi	a5,a5,15
    800045dc:	ff07f793          	andi	a5,a5,-16
    800045e0:	40f10133          	sub	sp,sp,a5
    800045e4:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    800045e8:	0019871b          	addiw	a4,s3,1
    800045ec:	00171793          	slli	a5,a4,0x1
    800045f0:	00e787b3          	add	a5,a5,a4
    800045f4:	00379793          	slli	a5,a5,0x3
    800045f8:	00f78793          	addi	a5,a5,15
    800045fc:	ff07f793          	andi	a5,a5,-16
    80004600:	40f10133          	sub	sp,sp,a5
    80004604:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80004608:	00199493          	slli	s1,s3,0x1
    8000460c:	013484b3          	add	s1,s1,s3
    80004610:	00349493          	slli	s1,s1,0x3
    80004614:	009b04b3          	add	s1,s6,s1
    80004618:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    8000461c:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80004620:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004624:	02800513          	li	a0,40
    80004628:	ffffe097          	auipc	ra,0xffffe
    8000462c:	090080e7          	jalr	144(ra) # 800026b8 <_Znwm>
    80004630:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80004634:	ffffe097          	auipc	ra,0xffffe
    80004638:	2fc080e7          	jalr	764(ra) # 80002930 <_ZN6ThreadC1Ev>
    8000463c:	00007797          	auipc	a5,0x7
    80004640:	38478793          	addi	a5,a5,900 # 8000b9c0 <_ZTV8Consumer+0x10>
    80004644:	00fbb023          	sd	a5,0(s7)
    80004648:	029bb023          	sd	s1,32(s7)
    consumer->start();
    8000464c:	000b8513          	mv	a0,s7
    80004650:	ffffe097          	auipc	ra,0xffffe
    80004654:	218080e7          	jalr	536(ra) # 80002868 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    80004658:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    8000465c:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    80004660:	00007797          	auipc	a5,0x7
    80004664:	5c87b783          	ld	a5,1480(a5) # 8000bc28 <_ZL10waitForAll>
    80004668:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    8000466c:	02800513          	li	a0,40
    80004670:	ffffe097          	auipc	ra,0xffffe
    80004674:	048080e7          	jalr	72(ra) # 800026b8 <_Znwm>
    80004678:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    8000467c:	ffffe097          	auipc	ra,0xffffe
    80004680:	2b4080e7          	jalr	692(ra) # 80002930 <_ZN6ThreadC1Ev>
    80004684:	00007797          	auipc	a5,0x7
    80004688:	2ec78793          	addi	a5,a5,748 # 8000b970 <_ZTV16ProducerKeyborad+0x10>
    8000468c:	00f4b023          	sd	a5,0(s1)
    80004690:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004694:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80004698:	00048513          	mv	a0,s1
    8000469c:	ffffe097          	auipc	ra,0xffffe
    800046a0:	1cc080e7          	jalr	460(ra) # 80002868 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    800046a4:	00100913          	li	s2,1
    800046a8:	0300006f          	j	800046d8 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    800046ac:	00007797          	auipc	a5,0x7
    800046b0:	2ec78793          	addi	a5,a5,748 # 8000b998 <_ZTV8Producer+0x10>
    800046b4:	00fcb023          	sd	a5,0(s9)
    800046b8:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    800046bc:	00391793          	slli	a5,s2,0x3
    800046c0:	00fa07b3          	add	a5,s4,a5
    800046c4:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    800046c8:	000c8513          	mv	a0,s9
    800046cc:	ffffe097          	auipc	ra,0xffffe
    800046d0:	19c080e7          	jalr	412(ra) # 80002868 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    800046d4:	0019091b          	addiw	s2,s2,1
    800046d8:	05395263          	bge	s2,s3,8000471c <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    800046dc:	00191493          	slli	s1,s2,0x1
    800046e0:	012484b3          	add	s1,s1,s2
    800046e4:	00349493          	slli	s1,s1,0x3
    800046e8:	009b04b3          	add	s1,s6,s1
    800046ec:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    800046f0:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    800046f4:	00007797          	auipc	a5,0x7
    800046f8:	5347b783          	ld	a5,1332(a5) # 8000bc28 <_ZL10waitForAll>
    800046fc:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80004700:	02800513          	li	a0,40
    80004704:	ffffe097          	auipc	ra,0xffffe
    80004708:	fb4080e7          	jalr	-76(ra) # 800026b8 <_Znwm>
    8000470c:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004710:	ffffe097          	auipc	ra,0xffffe
    80004714:	220080e7          	jalr	544(ra) # 80002930 <_ZN6ThreadC1Ev>
    80004718:	f95ff06f          	j	800046ac <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    8000471c:	ffffe097          	auipc	ra,0xffffe
    80004720:	1b0080e7          	jalr	432(ra) # 800028cc <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80004724:	00000493          	li	s1,0
    80004728:	0099ce63          	blt	s3,s1,80004744 <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    8000472c:	00007517          	auipc	a0,0x7
    80004730:	4fc53503          	ld	a0,1276(a0) # 8000bc28 <_ZL10waitForAll>
    80004734:	ffffe097          	auipc	ra,0xffffe
    80004738:	2b0080e7          	jalr	688(ra) # 800029e4 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    8000473c:	0014849b          	addiw	s1,s1,1
    80004740:	fe9ff06f          	j	80004728 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    80004744:	00007517          	auipc	a0,0x7
    80004748:	4e453503          	ld	a0,1252(a0) # 8000bc28 <_ZL10waitForAll>
    8000474c:	00050863          	beqz	a0,8000475c <_Z20testConsumerProducerv+0x2f4>
    80004750:	00053783          	ld	a5,0(a0)
    80004754:	0087b783          	ld	a5,8(a5)
    80004758:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    8000475c:	00000493          	li	s1,0
    80004760:	0080006f          	j	80004768 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    80004764:	0014849b          	addiw	s1,s1,1
    80004768:	0334d263          	bge	s1,s3,8000478c <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    8000476c:	00349793          	slli	a5,s1,0x3
    80004770:	00fa07b3          	add	a5,s4,a5
    80004774:	0007b503          	ld	a0,0(a5)
    80004778:	fe0506e3          	beqz	a0,80004764 <_Z20testConsumerProducerv+0x2fc>
    8000477c:	00053783          	ld	a5,0(a0)
    80004780:	0087b783          	ld	a5,8(a5)
    80004784:	000780e7          	jalr	a5
    80004788:	fddff06f          	j	80004764 <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    8000478c:	000b8a63          	beqz	s7,800047a0 <_Z20testConsumerProducerv+0x338>
    80004790:	000bb783          	ld	a5,0(s7)
    80004794:	0087b783          	ld	a5,8(a5)
    80004798:	000b8513          	mv	a0,s7
    8000479c:	000780e7          	jalr	a5
    delete buffer;
    800047a0:	000a8e63          	beqz	s5,800047bc <_Z20testConsumerProducerv+0x354>
    800047a4:	000a8513          	mv	a0,s5
    800047a8:	00002097          	auipc	ra,0x2
    800047ac:	870080e7          	jalr	-1936(ra) # 80006018 <_ZN9BufferCPPD1Ev>
    800047b0:	000a8513          	mv	a0,s5
    800047b4:	ffffe097          	auipc	ra,0xffffe
    800047b8:	f54080e7          	jalr	-172(ra) # 80002708 <_ZdlPv>
    800047bc:	000c0113          	mv	sp,s8
}
    800047c0:	f8040113          	addi	sp,s0,-128
    800047c4:	07813083          	ld	ra,120(sp)
    800047c8:	07013403          	ld	s0,112(sp)
    800047cc:	06813483          	ld	s1,104(sp)
    800047d0:	06013903          	ld	s2,96(sp)
    800047d4:	05813983          	ld	s3,88(sp)
    800047d8:	05013a03          	ld	s4,80(sp)
    800047dc:	04813a83          	ld	s5,72(sp)
    800047e0:	04013b03          	ld	s6,64(sp)
    800047e4:	03813b83          	ld	s7,56(sp)
    800047e8:	03013c03          	ld	s8,48(sp)
    800047ec:	02813c83          	ld	s9,40(sp)
    800047f0:	08010113          	addi	sp,sp,128
    800047f4:	00008067          	ret
    800047f8:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    800047fc:	000a8513          	mv	a0,s5
    80004800:	ffffe097          	auipc	ra,0xffffe
    80004804:	f08080e7          	jalr	-248(ra) # 80002708 <_ZdlPv>
    80004808:	00048513          	mv	a0,s1
    8000480c:	00008097          	auipc	ra,0x8
    80004810:	51c080e7          	jalr	1308(ra) # 8000cd28 <_Unwind_Resume>
    80004814:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80004818:	00090513          	mv	a0,s2
    8000481c:	ffffe097          	auipc	ra,0xffffe
    80004820:	eec080e7          	jalr	-276(ra) # 80002708 <_ZdlPv>
    80004824:	00048513          	mv	a0,s1
    80004828:	00008097          	auipc	ra,0x8
    8000482c:	500080e7          	jalr	1280(ra) # 8000cd28 <_Unwind_Resume>
    80004830:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004834:	000b8513          	mv	a0,s7
    80004838:	ffffe097          	auipc	ra,0xffffe
    8000483c:	ed0080e7          	jalr	-304(ra) # 80002708 <_ZdlPv>
    80004840:	00048513          	mv	a0,s1
    80004844:	00008097          	auipc	ra,0x8
    80004848:	4e4080e7          	jalr	1252(ra) # 8000cd28 <_Unwind_Resume>
    8000484c:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004850:	00048513          	mv	a0,s1
    80004854:	ffffe097          	auipc	ra,0xffffe
    80004858:	eb4080e7          	jalr	-332(ra) # 80002708 <_ZdlPv>
    8000485c:	00090513          	mv	a0,s2
    80004860:	00008097          	auipc	ra,0x8
    80004864:	4c8080e7          	jalr	1224(ra) # 8000cd28 <_Unwind_Resume>
    80004868:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    8000486c:	000c8513          	mv	a0,s9
    80004870:	ffffe097          	auipc	ra,0xffffe
    80004874:	e98080e7          	jalr	-360(ra) # 80002708 <_ZdlPv>
    80004878:	00048513          	mv	a0,s1
    8000487c:	00008097          	auipc	ra,0x8
    80004880:	4ac080e7          	jalr	1196(ra) # 8000cd28 <_Unwind_Resume>

0000000080004884 <_ZN8Consumer3runEv>:
    void run() override {
    80004884:	fd010113          	addi	sp,sp,-48
    80004888:	02113423          	sd	ra,40(sp)
    8000488c:	02813023          	sd	s0,32(sp)
    80004890:	00913c23          	sd	s1,24(sp)
    80004894:	01213823          	sd	s2,16(sp)
    80004898:	01313423          	sd	s3,8(sp)
    8000489c:	03010413          	addi	s0,sp,48
    800048a0:	00050913          	mv	s2,a0
        int i = 0;
    800048a4:	00000993          	li	s3,0
    800048a8:	0100006f          	j	800048b8 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    800048ac:	00a00513          	li	a0,10
    800048b0:	ffffe097          	auipc	ra,0xffffe
    800048b4:	200080e7          	jalr	512(ra) # 80002ab0 <_ZN7Console4putcEc>
        while (!threadEnd) {
    800048b8:	00007797          	auipc	a5,0x7
    800048bc:	3687a783          	lw	a5,872(a5) # 8000bc20 <_ZL9threadEnd>
    800048c0:	04079a63          	bnez	a5,80004914 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    800048c4:	02093783          	ld	a5,32(s2)
    800048c8:	0087b503          	ld	a0,8(a5)
    800048cc:	00001097          	auipc	ra,0x1
    800048d0:	638080e7          	jalr	1592(ra) # 80005f04 <_ZN9BufferCPP3getEv>
            i++;
    800048d4:	0019849b          	addiw	s1,s3,1
    800048d8:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    800048dc:	0ff57513          	andi	a0,a0,255
    800048e0:	ffffe097          	auipc	ra,0xffffe
    800048e4:	1d0080e7          	jalr	464(ra) # 80002ab0 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    800048e8:	05000793          	li	a5,80
    800048ec:	02f4e4bb          	remw	s1,s1,a5
    800048f0:	fc0494e3          	bnez	s1,800048b8 <_ZN8Consumer3runEv+0x34>
    800048f4:	fb9ff06f          	j	800048ac <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    800048f8:	02093783          	ld	a5,32(s2)
    800048fc:	0087b503          	ld	a0,8(a5)
    80004900:	00001097          	auipc	ra,0x1
    80004904:	604080e7          	jalr	1540(ra) # 80005f04 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80004908:	0ff57513          	andi	a0,a0,255
    8000490c:	ffffe097          	auipc	ra,0xffffe
    80004910:	1a4080e7          	jalr	420(ra) # 80002ab0 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80004914:	02093783          	ld	a5,32(s2)
    80004918:	0087b503          	ld	a0,8(a5)
    8000491c:	00001097          	auipc	ra,0x1
    80004920:	674080e7          	jalr	1652(ra) # 80005f90 <_ZN9BufferCPP6getCntEv>
    80004924:	fca04ae3          	bgtz	a0,800048f8 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80004928:	02093783          	ld	a5,32(s2)
    8000492c:	0107b503          	ld	a0,16(a5)
    80004930:	ffffe097          	auipc	ra,0xffffe
    80004934:	0e0080e7          	jalr	224(ra) # 80002a10 <_ZN9Semaphore6signalEv>
    }
    80004938:	02813083          	ld	ra,40(sp)
    8000493c:	02013403          	ld	s0,32(sp)
    80004940:	01813483          	ld	s1,24(sp)
    80004944:	01013903          	ld	s2,16(sp)
    80004948:	00813983          	ld	s3,8(sp)
    8000494c:	03010113          	addi	sp,sp,48
    80004950:	00008067          	ret

0000000080004954 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80004954:	ff010113          	addi	sp,sp,-16
    80004958:	00113423          	sd	ra,8(sp)
    8000495c:	00813023          	sd	s0,0(sp)
    80004960:	01010413          	addi	s0,sp,16
    80004964:	00007797          	auipc	a5,0x7
    80004968:	05c78793          	addi	a5,a5,92 # 8000b9c0 <_ZTV8Consumer+0x10>
    8000496c:	00f53023          	sd	a5,0(a0)
    80004970:	ffffe097          	auipc	ra,0xffffe
    80004974:	c9c080e7          	jalr	-868(ra) # 8000260c <_ZN6ThreadD1Ev>
    80004978:	00813083          	ld	ra,8(sp)
    8000497c:	00013403          	ld	s0,0(sp)
    80004980:	01010113          	addi	sp,sp,16
    80004984:	00008067          	ret

0000000080004988 <_ZN8ConsumerD0Ev>:
    80004988:	fe010113          	addi	sp,sp,-32
    8000498c:	00113c23          	sd	ra,24(sp)
    80004990:	00813823          	sd	s0,16(sp)
    80004994:	00913423          	sd	s1,8(sp)
    80004998:	02010413          	addi	s0,sp,32
    8000499c:	00050493          	mv	s1,a0
    800049a0:	00007797          	auipc	a5,0x7
    800049a4:	02078793          	addi	a5,a5,32 # 8000b9c0 <_ZTV8Consumer+0x10>
    800049a8:	00f53023          	sd	a5,0(a0)
    800049ac:	ffffe097          	auipc	ra,0xffffe
    800049b0:	c60080e7          	jalr	-928(ra) # 8000260c <_ZN6ThreadD1Ev>
    800049b4:	00048513          	mv	a0,s1
    800049b8:	ffffe097          	auipc	ra,0xffffe
    800049bc:	d50080e7          	jalr	-688(ra) # 80002708 <_ZdlPv>
    800049c0:	01813083          	ld	ra,24(sp)
    800049c4:	01013403          	ld	s0,16(sp)
    800049c8:	00813483          	ld	s1,8(sp)
    800049cc:	02010113          	addi	sp,sp,32
    800049d0:	00008067          	ret

00000000800049d4 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    800049d4:	ff010113          	addi	sp,sp,-16
    800049d8:	00113423          	sd	ra,8(sp)
    800049dc:	00813023          	sd	s0,0(sp)
    800049e0:	01010413          	addi	s0,sp,16
    800049e4:	00007797          	auipc	a5,0x7
    800049e8:	f8c78793          	addi	a5,a5,-116 # 8000b970 <_ZTV16ProducerKeyborad+0x10>
    800049ec:	00f53023          	sd	a5,0(a0)
    800049f0:	ffffe097          	auipc	ra,0xffffe
    800049f4:	c1c080e7          	jalr	-996(ra) # 8000260c <_ZN6ThreadD1Ev>
    800049f8:	00813083          	ld	ra,8(sp)
    800049fc:	00013403          	ld	s0,0(sp)
    80004a00:	01010113          	addi	sp,sp,16
    80004a04:	00008067          	ret

0000000080004a08 <_ZN16ProducerKeyboradD0Ev>:
    80004a08:	fe010113          	addi	sp,sp,-32
    80004a0c:	00113c23          	sd	ra,24(sp)
    80004a10:	00813823          	sd	s0,16(sp)
    80004a14:	00913423          	sd	s1,8(sp)
    80004a18:	02010413          	addi	s0,sp,32
    80004a1c:	00050493          	mv	s1,a0
    80004a20:	00007797          	auipc	a5,0x7
    80004a24:	f5078793          	addi	a5,a5,-176 # 8000b970 <_ZTV16ProducerKeyborad+0x10>
    80004a28:	00f53023          	sd	a5,0(a0)
    80004a2c:	ffffe097          	auipc	ra,0xffffe
    80004a30:	be0080e7          	jalr	-1056(ra) # 8000260c <_ZN6ThreadD1Ev>
    80004a34:	00048513          	mv	a0,s1
    80004a38:	ffffe097          	auipc	ra,0xffffe
    80004a3c:	cd0080e7          	jalr	-816(ra) # 80002708 <_ZdlPv>
    80004a40:	01813083          	ld	ra,24(sp)
    80004a44:	01013403          	ld	s0,16(sp)
    80004a48:	00813483          	ld	s1,8(sp)
    80004a4c:	02010113          	addi	sp,sp,32
    80004a50:	00008067          	ret

0000000080004a54 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80004a54:	ff010113          	addi	sp,sp,-16
    80004a58:	00113423          	sd	ra,8(sp)
    80004a5c:	00813023          	sd	s0,0(sp)
    80004a60:	01010413          	addi	s0,sp,16
    80004a64:	00007797          	auipc	a5,0x7
    80004a68:	f3478793          	addi	a5,a5,-204 # 8000b998 <_ZTV8Producer+0x10>
    80004a6c:	00f53023          	sd	a5,0(a0)
    80004a70:	ffffe097          	auipc	ra,0xffffe
    80004a74:	b9c080e7          	jalr	-1124(ra) # 8000260c <_ZN6ThreadD1Ev>
    80004a78:	00813083          	ld	ra,8(sp)
    80004a7c:	00013403          	ld	s0,0(sp)
    80004a80:	01010113          	addi	sp,sp,16
    80004a84:	00008067          	ret

0000000080004a88 <_ZN8ProducerD0Ev>:
    80004a88:	fe010113          	addi	sp,sp,-32
    80004a8c:	00113c23          	sd	ra,24(sp)
    80004a90:	00813823          	sd	s0,16(sp)
    80004a94:	00913423          	sd	s1,8(sp)
    80004a98:	02010413          	addi	s0,sp,32
    80004a9c:	00050493          	mv	s1,a0
    80004aa0:	00007797          	auipc	a5,0x7
    80004aa4:	ef878793          	addi	a5,a5,-264 # 8000b998 <_ZTV8Producer+0x10>
    80004aa8:	00f53023          	sd	a5,0(a0)
    80004aac:	ffffe097          	auipc	ra,0xffffe
    80004ab0:	b60080e7          	jalr	-1184(ra) # 8000260c <_ZN6ThreadD1Ev>
    80004ab4:	00048513          	mv	a0,s1
    80004ab8:	ffffe097          	auipc	ra,0xffffe
    80004abc:	c50080e7          	jalr	-944(ra) # 80002708 <_ZdlPv>
    80004ac0:	01813083          	ld	ra,24(sp)
    80004ac4:	01013403          	ld	s0,16(sp)
    80004ac8:	00813483          	ld	s1,8(sp)
    80004acc:	02010113          	addi	sp,sp,32
    80004ad0:	00008067          	ret

0000000080004ad4 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80004ad4:	fe010113          	addi	sp,sp,-32
    80004ad8:	00113c23          	sd	ra,24(sp)
    80004adc:	00813823          	sd	s0,16(sp)
    80004ae0:	00913423          	sd	s1,8(sp)
    80004ae4:	02010413          	addi	s0,sp,32
    80004ae8:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80004aec:	ffffd097          	auipc	ra,0xffffd
    80004af0:	a7c080e7          	jalr	-1412(ra) # 80001568 <_Z4getcv>
    80004af4:	0005059b          	sext.w	a1,a0
    80004af8:	01b00793          	li	a5,27
    80004afc:	00f58c63          	beq	a1,a5,80004b14 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80004b00:	0204b783          	ld	a5,32(s1)
    80004b04:	0087b503          	ld	a0,8(a5)
    80004b08:	00001097          	auipc	ra,0x1
    80004b0c:	36c080e7          	jalr	876(ra) # 80005e74 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80004b10:	fddff06f          	j	80004aec <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80004b14:	00100793          	li	a5,1
    80004b18:	00007717          	auipc	a4,0x7
    80004b1c:	10f72423          	sw	a5,264(a4) # 8000bc20 <_ZL9threadEnd>
        td->buffer->put('!');
    80004b20:	0204b783          	ld	a5,32(s1)
    80004b24:	02100593          	li	a1,33
    80004b28:	0087b503          	ld	a0,8(a5)
    80004b2c:	00001097          	auipc	ra,0x1
    80004b30:	348080e7          	jalr	840(ra) # 80005e74 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80004b34:	0204b783          	ld	a5,32(s1)
    80004b38:	0107b503          	ld	a0,16(a5)
    80004b3c:	ffffe097          	auipc	ra,0xffffe
    80004b40:	ed4080e7          	jalr	-300(ra) # 80002a10 <_ZN9Semaphore6signalEv>
    }
    80004b44:	01813083          	ld	ra,24(sp)
    80004b48:	01013403          	ld	s0,16(sp)
    80004b4c:	00813483          	ld	s1,8(sp)
    80004b50:	02010113          	addi	sp,sp,32
    80004b54:	00008067          	ret

0000000080004b58 <_ZN8Producer3runEv>:
    void run() override {
    80004b58:	fe010113          	addi	sp,sp,-32
    80004b5c:	00113c23          	sd	ra,24(sp)
    80004b60:	00813823          	sd	s0,16(sp)
    80004b64:	00913423          	sd	s1,8(sp)
    80004b68:	01213023          	sd	s2,0(sp)
    80004b6c:	02010413          	addi	s0,sp,32
    80004b70:	00050493          	mv	s1,a0
        int i = 0;
    80004b74:	00000913          	li	s2,0
        while (!threadEnd) {
    80004b78:	00007797          	auipc	a5,0x7
    80004b7c:	0a87a783          	lw	a5,168(a5) # 8000bc20 <_ZL9threadEnd>
    80004b80:	04079263          	bnez	a5,80004bc4 <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    80004b84:	0204b783          	ld	a5,32(s1)
    80004b88:	0007a583          	lw	a1,0(a5)
    80004b8c:	0305859b          	addiw	a1,a1,48
    80004b90:	0087b503          	ld	a0,8(a5)
    80004b94:	00001097          	auipc	ra,0x1
    80004b98:	2e0080e7          	jalr	736(ra) # 80005e74 <_ZN9BufferCPP3putEi>
            i++;
    80004b9c:	0019071b          	addiw	a4,s2,1
    80004ba0:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    80004ba4:	0204b783          	ld	a5,32(s1)
    80004ba8:	0007a783          	lw	a5,0(a5)
    80004bac:	00e787bb          	addw	a5,a5,a4
    80004bb0:	00500513          	li	a0,5
    80004bb4:	02a7e53b          	remw	a0,a5,a0
    80004bb8:	ffffe097          	auipc	ra,0xffffe
    80004bbc:	d3c080e7          	jalr	-708(ra) # 800028f4 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80004bc0:	fb9ff06f          	j	80004b78 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80004bc4:	0204b783          	ld	a5,32(s1)
    80004bc8:	0107b503          	ld	a0,16(a5)
    80004bcc:	ffffe097          	auipc	ra,0xffffe
    80004bd0:	e44080e7          	jalr	-444(ra) # 80002a10 <_ZN9Semaphore6signalEv>
    }
    80004bd4:	01813083          	ld	ra,24(sp)
    80004bd8:	01013403          	ld	s0,16(sp)
    80004bdc:	00813483          	ld	s1,8(sp)
    80004be0:	00013903          	ld	s2,0(sp)
    80004be4:	02010113          	addi	sp,sp,32
    80004be8:	00008067          	ret

0000000080004bec <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004bec:	fe010113          	addi	sp,sp,-32
    80004bf0:	00113c23          	sd	ra,24(sp)
    80004bf4:	00813823          	sd	s0,16(sp)
    80004bf8:	00913423          	sd	s1,8(sp)
    80004bfc:	01213023          	sd	s2,0(sp)
    80004c00:	02010413          	addi	s0,sp,32
    80004c04:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004c08:	00100793          	li	a5,1
    80004c0c:	02a7f863          	bgeu	a5,a0,80004c3c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004c10:	00a00793          	li	a5,10
    80004c14:	02f577b3          	remu	a5,a0,a5
    80004c18:	02078e63          	beqz	a5,80004c54 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004c1c:	fff48513          	addi	a0,s1,-1
    80004c20:	00000097          	auipc	ra,0x0
    80004c24:	fcc080e7          	jalr	-52(ra) # 80004bec <_ZL9fibonaccim>
    80004c28:	00050913          	mv	s2,a0
    80004c2c:	ffe48513          	addi	a0,s1,-2
    80004c30:	00000097          	auipc	ra,0x0
    80004c34:	fbc080e7          	jalr	-68(ra) # 80004bec <_ZL9fibonaccim>
    80004c38:	00a90533          	add	a0,s2,a0
}
    80004c3c:	01813083          	ld	ra,24(sp)
    80004c40:	01013403          	ld	s0,16(sp)
    80004c44:	00813483          	ld	s1,8(sp)
    80004c48:	00013903          	ld	s2,0(sp)
    80004c4c:	02010113          	addi	sp,sp,32
    80004c50:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80004c54:	ffffc097          	auipc	ra,0xffffc
    80004c58:	7d4080e7          	jalr	2004(ra) # 80001428 <_Z15thread_dispatchv>
    80004c5c:	fc1ff06f          	j	80004c1c <_ZL9fibonaccim+0x30>

0000000080004c60 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80004c60:	fe010113          	addi	sp,sp,-32
    80004c64:	00113c23          	sd	ra,24(sp)
    80004c68:	00813823          	sd	s0,16(sp)
    80004c6c:	00913423          	sd	s1,8(sp)
    80004c70:	01213023          	sd	s2,0(sp)
    80004c74:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004c78:	00a00493          	li	s1,10
    80004c7c:	0400006f          	j	80004cbc <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004c80:	00004517          	auipc	a0,0x4
    80004c84:	71850513          	addi	a0,a0,1816 # 80009398 <CONSOLE_STATUS+0x388>
    80004c88:	00001097          	auipc	ra,0x1
    80004c8c:	dc8080e7          	jalr	-568(ra) # 80005a50 <_Z11printStringPKc>
    80004c90:	00000613          	li	a2,0
    80004c94:	00a00593          	li	a1,10
    80004c98:	00048513          	mv	a0,s1
    80004c9c:	00001097          	auipc	ra,0x1
    80004ca0:	f64080e7          	jalr	-156(ra) # 80005c00 <_Z8printIntiii>
    80004ca4:	00005517          	auipc	a0,0x5
    80004ca8:	8e450513          	addi	a0,a0,-1820 # 80009588 <CONSOLE_STATUS+0x578>
    80004cac:	00001097          	auipc	ra,0x1
    80004cb0:	da4080e7          	jalr	-604(ra) # 80005a50 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004cb4:	0014849b          	addiw	s1,s1,1
    80004cb8:	0ff4f493          	andi	s1,s1,255
    80004cbc:	00c00793          	li	a5,12
    80004cc0:	fc97f0e3          	bgeu	a5,s1,80004c80 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80004cc4:	00004517          	auipc	a0,0x4
    80004cc8:	6dc50513          	addi	a0,a0,1756 # 800093a0 <CONSOLE_STATUS+0x390>
    80004ccc:	00001097          	auipc	ra,0x1
    80004cd0:	d84080e7          	jalr	-636(ra) # 80005a50 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004cd4:	00500313          	li	t1,5
    thread_dispatch();
    80004cd8:	ffffc097          	auipc	ra,0xffffc
    80004cdc:	750080e7          	jalr	1872(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004ce0:	01000513          	li	a0,16
    80004ce4:	00000097          	auipc	ra,0x0
    80004ce8:	f08080e7          	jalr	-248(ra) # 80004bec <_ZL9fibonaccim>
    80004cec:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004cf0:	00004517          	auipc	a0,0x4
    80004cf4:	6c050513          	addi	a0,a0,1728 # 800093b0 <CONSOLE_STATUS+0x3a0>
    80004cf8:	00001097          	auipc	ra,0x1
    80004cfc:	d58080e7          	jalr	-680(ra) # 80005a50 <_Z11printStringPKc>
    80004d00:	00000613          	li	a2,0
    80004d04:	00a00593          	li	a1,10
    80004d08:	0009051b          	sext.w	a0,s2
    80004d0c:	00001097          	auipc	ra,0x1
    80004d10:	ef4080e7          	jalr	-268(ra) # 80005c00 <_Z8printIntiii>
    80004d14:	00005517          	auipc	a0,0x5
    80004d18:	87450513          	addi	a0,a0,-1932 # 80009588 <CONSOLE_STATUS+0x578>
    80004d1c:	00001097          	auipc	ra,0x1
    80004d20:	d34080e7          	jalr	-716(ra) # 80005a50 <_Z11printStringPKc>
    80004d24:	0400006f          	j	80004d64 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004d28:	00004517          	auipc	a0,0x4
    80004d2c:	67050513          	addi	a0,a0,1648 # 80009398 <CONSOLE_STATUS+0x388>
    80004d30:	00001097          	auipc	ra,0x1
    80004d34:	d20080e7          	jalr	-736(ra) # 80005a50 <_Z11printStringPKc>
    80004d38:	00000613          	li	a2,0
    80004d3c:	00a00593          	li	a1,10
    80004d40:	00048513          	mv	a0,s1
    80004d44:	00001097          	auipc	ra,0x1
    80004d48:	ebc080e7          	jalr	-324(ra) # 80005c00 <_Z8printIntiii>
    80004d4c:	00005517          	auipc	a0,0x5
    80004d50:	83c50513          	addi	a0,a0,-1988 # 80009588 <CONSOLE_STATUS+0x578>
    80004d54:	00001097          	auipc	ra,0x1
    80004d58:	cfc080e7          	jalr	-772(ra) # 80005a50 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004d5c:	0014849b          	addiw	s1,s1,1
    80004d60:	0ff4f493          	andi	s1,s1,255
    80004d64:	00f00793          	li	a5,15
    80004d68:	fc97f0e3          	bgeu	a5,s1,80004d28 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80004d6c:	00004517          	auipc	a0,0x4
    80004d70:	65450513          	addi	a0,a0,1620 # 800093c0 <CONSOLE_STATUS+0x3b0>
    80004d74:	00001097          	auipc	ra,0x1
    80004d78:	cdc080e7          	jalr	-804(ra) # 80005a50 <_Z11printStringPKc>
    finishedD = true;
    80004d7c:	00100793          	li	a5,1
    80004d80:	00007717          	auipc	a4,0x7
    80004d84:	eaf70823          	sb	a5,-336(a4) # 8000bc30 <_ZL9finishedD>
    thread_dispatch();
    80004d88:	ffffc097          	auipc	ra,0xffffc
    80004d8c:	6a0080e7          	jalr	1696(ra) # 80001428 <_Z15thread_dispatchv>
}
    80004d90:	01813083          	ld	ra,24(sp)
    80004d94:	01013403          	ld	s0,16(sp)
    80004d98:	00813483          	ld	s1,8(sp)
    80004d9c:	00013903          	ld	s2,0(sp)
    80004da0:	02010113          	addi	sp,sp,32
    80004da4:	00008067          	ret

0000000080004da8 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80004da8:	fe010113          	addi	sp,sp,-32
    80004dac:	00113c23          	sd	ra,24(sp)
    80004db0:	00813823          	sd	s0,16(sp)
    80004db4:	00913423          	sd	s1,8(sp)
    80004db8:	01213023          	sd	s2,0(sp)
    80004dbc:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004dc0:	00000493          	li	s1,0
    80004dc4:	0400006f          	j	80004e04 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80004dc8:	00004517          	auipc	a0,0x4
    80004dcc:	5a050513          	addi	a0,a0,1440 # 80009368 <CONSOLE_STATUS+0x358>
    80004dd0:	00001097          	auipc	ra,0x1
    80004dd4:	c80080e7          	jalr	-896(ra) # 80005a50 <_Z11printStringPKc>
    80004dd8:	00000613          	li	a2,0
    80004ddc:	00a00593          	li	a1,10
    80004de0:	00048513          	mv	a0,s1
    80004de4:	00001097          	auipc	ra,0x1
    80004de8:	e1c080e7          	jalr	-484(ra) # 80005c00 <_Z8printIntiii>
    80004dec:	00004517          	auipc	a0,0x4
    80004df0:	79c50513          	addi	a0,a0,1948 # 80009588 <CONSOLE_STATUS+0x578>
    80004df4:	00001097          	auipc	ra,0x1
    80004df8:	c5c080e7          	jalr	-932(ra) # 80005a50 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004dfc:	0014849b          	addiw	s1,s1,1
    80004e00:	0ff4f493          	andi	s1,s1,255
    80004e04:	00200793          	li	a5,2
    80004e08:	fc97f0e3          	bgeu	a5,s1,80004dc8 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80004e0c:	00004517          	auipc	a0,0x4
    80004e10:	56450513          	addi	a0,a0,1380 # 80009370 <CONSOLE_STATUS+0x360>
    80004e14:	00001097          	auipc	ra,0x1
    80004e18:	c3c080e7          	jalr	-964(ra) # 80005a50 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004e1c:	00700313          	li	t1,7
    thread_dispatch();
    80004e20:	ffffc097          	auipc	ra,0xffffc
    80004e24:	608080e7          	jalr	1544(ra) # 80001428 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004e28:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80004e2c:	00004517          	auipc	a0,0x4
    80004e30:	55450513          	addi	a0,a0,1364 # 80009380 <CONSOLE_STATUS+0x370>
    80004e34:	00001097          	auipc	ra,0x1
    80004e38:	c1c080e7          	jalr	-996(ra) # 80005a50 <_Z11printStringPKc>
    80004e3c:	00000613          	li	a2,0
    80004e40:	00a00593          	li	a1,10
    80004e44:	0009051b          	sext.w	a0,s2
    80004e48:	00001097          	auipc	ra,0x1
    80004e4c:	db8080e7          	jalr	-584(ra) # 80005c00 <_Z8printIntiii>
    80004e50:	00004517          	auipc	a0,0x4
    80004e54:	73850513          	addi	a0,a0,1848 # 80009588 <CONSOLE_STATUS+0x578>
    80004e58:	00001097          	auipc	ra,0x1
    80004e5c:	bf8080e7          	jalr	-1032(ra) # 80005a50 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80004e60:	00c00513          	li	a0,12
    80004e64:	00000097          	auipc	ra,0x0
    80004e68:	d88080e7          	jalr	-632(ra) # 80004bec <_ZL9fibonaccim>
    80004e6c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80004e70:	00004517          	auipc	a0,0x4
    80004e74:	51850513          	addi	a0,a0,1304 # 80009388 <CONSOLE_STATUS+0x378>
    80004e78:	00001097          	auipc	ra,0x1
    80004e7c:	bd8080e7          	jalr	-1064(ra) # 80005a50 <_Z11printStringPKc>
    80004e80:	00000613          	li	a2,0
    80004e84:	00a00593          	li	a1,10
    80004e88:	0009051b          	sext.w	a0,s2
    80004e8c:	00001097          	auipc	ra,0x1
    80004e90:	d74080e7          	jalr	-652(ra) # 80005c00 <_Z8printIntiii>
    80004e94:	00004517          	auipc	a0,0x4
    80004e98:	6f450513          	addi	a0,a0,1780 # 80009588 <CONSOLE_STATUS+0x578>
    80004e9c:	00001097          	auipc	ra,0x1
    80004ea0:	bb4080e7          	jalr	-1100(ra) # 80005a50 <_Z11printStringPKc>
    80004ea4:	0400006f          	j	80004ee4 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80004ea8:	00004517          	auipc	a0,0x4
    80004eac:	4c050513          	addi	a0,a0,1216 # 80009368 <CONSOLE_STATUS+0x358>
    80004eb0:	00001097          	auipc	ra,0x1
    80004eb4:	ba0080e7          	jalr	-1120(ra) # 80005a50 <_Z11printStringPKc>
    80004eb8:	00000613          	li	a2,0
    80004ebc:	00a00593          	li	a1,10
    80004ec0:	00048513          	mv	a0,s1
    80004ec4:	00001097          	auipc	ra,0x1
    80004ec8:	d3c080e7          	jalr	-708(ra) # 80005c00 <_Z8printIntiii>
    80004ecc:	00004517          	auipc	a0,0x4
    80004ed0:	6bc50513          	addi	a0,a0,1724 # 80009588 <CONSOLE_STATUS+0x578>
    80004ed4:	00001097          	auipc	ra,0x1
    80004ed8:	b7c080e7          	jalr	-1156(ra) # 80005a50 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004edc:	0014849b          	addiw	s1,s1,1
    80004ee0:	0ff4f493          	andi	s1,s1,255
    80004ee4:	00500793          	li	a5,5
    80004ee8:	fc97f0e3          	bgeu	a5,s1,80004ea8 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80004eec:	00004517          	auipc	a0,0x4
    80004ef0:	45450513          	addi	a0,a0,1108 # 80009340 <CONSOLE_STATUS+0x330>
    80004ef4:	00001097          	auipc	ra,0x1
    80004ef8:	b5c080e7          	jalr	-1188(ra) # 80005a50 <_Z11printStringPKc>
    finishedC = true;
    80004efc:	00100793          	li	a5,1
    80004f00:	00007717          	auipc	a4,0x7
    80004f04:	d2f708a3          	sb	a5,-719(a4) # 8000bc31 <_ZL9finishedC>
    thread_dispatch();
    80004f08:	ffffc097          	auipc	ra,0xffffc
    80004f0c:	520080e7          	jalr	1312(ra) # 80001428 <_Z15thread_dispatchv>
}
    80004f10:	01813083          	ld	ra,24(sp)
    80004f14:	01013403          	ld	s0,16(sp)
    80004f18:	00813483          	ld	s1,8(sp)
    80004f1c:	00013903          	ld	s2,0(sp)
    80004f20:	02010113          	addi	sp,sp,32
    80004f24:	00008067          	ret

0000000080004f28 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80004f28:	fe010113          	addi	sp,sp,-32
    80004f2c:	00113c23          	sd	ra,24(sp)
    80004f30:	00813823          	sd	s0,16(sp)
    80004f34:	00913423          	sd	s1,8(sp)
    80004f38:	01213023          	sd	s2,0(sp)
    80004f3c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80004f40:	00000913          	li	s2,0
    80004f44:	0380006f          	j	80004f7c <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80004f48:	ffffc097          	auipc	ra,0xffffc
    80004f4c:	4e0080e7          	jalr	1248(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004f50:	00148493          	addi	s1,s1,1
    80004f54:	000027b7          	lui	a5,0x2
    80004f58:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004f5c:	0097ee63          	bltu	a5,s1,80004f78 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004f60:	00000713          	li	a4,0
    80004f64:	000077b7          	lui	a5,0x7
    80004f68:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004f6c:	fce7eee3          	bltu	a5,a4,80004f48 <_ZL11workerBodyBPv+0x20>
    80004f70:	00170713          	addi	a4,a4,1
    80004f74:	ff1ff06f          	j	80004f64 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80004f78:	00190913          	addi	s2,s2,1
    80004f7c:	00f00793          	li	a5,15
    80004f80:	0527e063          	bltu	a5,s2,80004fc0 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80004f84:	00004517          	auipc	a0,0x4
    80004f88:	3cc50513          	addi	a0,a0,972 # 80009350 <CONSOLE_STATUS+0x340>
    80004f8c:	00001097          	auipc	ra,0x1
    80004f90:	ac4080e7          	jalr	-1340(ra) # 80005a50 <_Z11printStringPKc>
    80004f94:	00000613          	li	a2,0
    80004f98:	00a00593          	li	a1,10
    80004f9c:	0009051b          	sext.w	a0,s2
    80004fa0:	00001097          	auipc	ra,0x1
    80004fa4:	c60080e7          	jalr	-928(ra) # 80005c00 <_Z8printIntiii>
    80004fa8:	00004517          	auipc	a0,0x4
    80004fac:	5e050513          	addi	a0,a0,1504 # 80009588 <CONSOLE_STATUS+0x578>
    80004fb0:	00001097          	auipc	ra,0x1
    80004fb4:	aa0080e7          	jalr	-1376(ra) # 80005a50 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004fb8:	00000493          	li	s1,0
    80004fbc:	f99ff06f          	j	80004f54 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80004fc0:	00004517          	auipc	a0,0x4
    80004fc4:	39850513          	addi	a0,a0,920 # 80009358 <CONSOLE_STATUS+0x348>
    80004fc8:	00001097          	auipc	ra,0x1
    80004fcc:	a88080e7          	jalr	-1400(ra) # 80005a50 <_Z11printStringPKc>
    finishedB = true;
    80004fd0:	00100793          	li	a5,1
    80004fd4:	00007717          	auipc	a4,0x7
    80004fd8:	c4f70f23          	sb	a5,-930(a4) # 8000bc32 <_ZL9finishedB>
    thread_dispatch();
    80004fdc:	ffffc097          	auipc	ra,0xffffc
    80004fe0:	44c080e7          	jalr	1100(ra) # 80001428 <_Z15thread_dispatchv>
}
    80004fe4:	01813083          	ld	ra,24(sp)
    80004fe8:	01013403          	ld	s0,16(sp)
    80004fec:	00813483          	ld	s1,8(sp)
    80004ff0:	00013903          	ld	s2,0(sp)
    80004ff4:	02010113          	addi	sp,sp,32
    80004ff8:	00008067          	ret

0000000080004ffc <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80004ffc:	fe010113          	addi	sp,sp,-32
    80005000:	00113c23          	sd	ra,24(sp)
    80005004:	00813823          	sd	s0,16(sp)
    80005008:	00913423          	sd	s1,8(sp)
    8000500c:	01213023          	sd	s2,0(sp)
    80005010:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80005014:	00000913          	li	s2,0
    80005018:	0380006f          	j	80005050 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    8000501c:	ffffc097          	auipc	ra,0xffffc
    80005020:	40c080e7          	jalr	1036(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005024:	00148493          	addi	s1,s1,1
    80005028:	000027b7          	lui	a5,0x2
    8000502c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005030:	0097ee63          	bltu	a5,s1,8000504c <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005034:	00000713          	li	a4,0
    80005038:	000077b7          	lui	a5,0x7
    8000503c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005040:	fce7eee3          	bltu	a5,a4,8000501c <_ZL11workerBodyAPv+0x20>
    80005044:	00170713          	addi	a4,a4,1
    80005048:	ff1ff06f          	j	80005038 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    8000504c:	00190913          	addi	s2,s2,1
    80005050:	00900793          	li	a5,9
    80005054:	0527e063          	bltu	a5,s2,80005094 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80005058:	00004517          	auipc	a0,0x4
    8000505c:	2e050513          	addi	a0,a0,736 # 80009338 <CONSOLE_STATUS+0x328>
    80005060:	00001097          	auipc	ra,0x1
    80005064:	9f0080e7          	jalr	-1552(ra) # 80005a50 <_Z11printStringPKc>
    80005068:	00000613          	li	a2,0
    8000506c:	00a00593          	li	a1,10
    80005070:	0009051b          	sext.w	a0,s2
    80005074:	00001097          	auipc	ra,0x1
    80005078:	b8c080e7          	jalr	-1140(ra) # 80005c00 <_Z8printIntiii>
    8000507c:	00004517          	auipc	a0,0x4
    80005080:	50c50513          	addi	a0,a0,1292 # 80009588 <CONSOLE_STATUS+0x578>
    80005084:	00001097          	auipc	ra,0x1
    80005088:	9cc080e7          	jalr	-1588(ra) # 80005a50 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    8000508c:	00000493          	li	s1,0
    80005090:	f99ff06f          	j	80005028 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80005094:	00004517          	auipc	a0,0x4
    80005098:	2ac50513          	addi	a0,a0,684 # 80009340 <CONSOLE_STATUS+0x330>
    8000509c:	00001097          	auipc	ra,0x1
    800050a0:	9b4080e7          	jalr	-1612(ra) # 80005a50 <_Z11printStringPKc>
    finishedA = true;
    800050a4:	00100793          	li	a5,1
    800050a8:	00007717          	auipc	a4,0x7
    800050ac:	b8f705a3          	sb	a5,-1141(a4) # 8000bc33 <_ZL9finishedA>
}
    800050b0:	01813083          	ld	ra,24(sp)
    800050b4:	01013403          	ld	s0,16(sp)
    800050b8:	00813483          	ld	s1,8(sp)
    800050bc:	00013903          	ld	s2,0(sp)
    800050c0:	02010113          	addi	sp,sp,32
    800050c4:	00008067          	ret

00000000800050c8 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    800050c8:	fd010113          	addi	sp,sp,-48
    800050cc:	02113423          	sd	ra,40(sp)
    800050d0:	02813023          	sd	s0,32(sp)
    800050d4:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    800050d8:	00000613          	li	a2,0
    800050dc:	00000597          	auipc	a1,0x0
    800050e0:	f2058593          	addi	a1,a1,-224 # 80004ffc <_ZL11workerBodyAPv>
    800050e4:	fd040513          	addi	a0,s0,-48
    800050e8:	ffffc097          	auipc	ra,0xffffc
    800050ec:	298080e7          	jalr	664(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    800050f0:	00004517          	auipc	a0,0x4
    800050f4:	2e050513          	addi	a0,a0,736 # 800093d0 <CONSOLE_STATUS+0x3c0>
    800050f8:	00001097          	auipc	ra,0x1
    800050fc:	958080e7          	jalr	-1704(ra) # 80005a50 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80005100:	00000613          	li	a2,0
    80005104:	00000597          	auipc	a1,0x0
    80005108:	e2458593          	addi	a1,a1,-476 # 80004f28 <_ZL11workerBodyBPv>
    8000510c:	fd840513          	addi	a0,s0,-40
    80005110:	ffffc097          	auipc	ra,0xffffc
    80005114:	270080e7          	jalr	624(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80005118:	00004517          	auipc	a0,0x4
    8000511c:	2d050513          	addi	a0,a0,720 # 800093e8 <CONSOLE_STATUS+0x3d8>
    80005120:	00001097          	auipc	ra,0x1
    80005124:	930080e7          	jalr	-1744(ra) # 80005a50 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80005128:	00000613          	li	a2,0
    8000512c:	00000597          	auipc	a1,0x0
    80005130:	c7c58593          	addi	a1,a1,-900 # 80004da8 <_ZL11workerBodyCPv>
    80005134:	fe040513          	addi	a0,s0,-32
    80005138:	ffffc097          	auipc	ra,0xffffc
    8000513c:	248080e7          	jalr	584(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80005140:	00004517          	auipc	a0,0x4
    80005144:	2c050513          	addi	a0,a0,704 # 80009400 <CONSOLE_STATUS+0x3f0>
    80005148:	00001097          	auipc	ra,0x1
    8000514c:	908080e7          	jalr	-1784(ra) # 80005a50 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80005150:	00000613          	li	a2,0
    80005154:	00000597          	auipc	a1,0x0
    80005158:	b0c58593          	addi	a1,a1,-1268 # 80004c60 <_ZL11workerBodyDPv>
    8000515c:	fe840513          	addi	a0,s0,-24
    80005160:	ffffc097          	auipc	ra,0xffffc
    80005164:	220080e7          	jalr	544(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80005168:	00004517          	auipc	a0,0x4
    8000516c:	2b050513          	addi	a0,a0,688 # 80009418 <CONSOLE_STATUS+0x408>
    80005170:	00001097          	auipc	ra,0x1
    80005174:	8e0080e7          	jalr	-1824(ra) # 80005a50 <_Z11printStringPKc>
    80005178:	00c0006f          	j	80005184 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    8000517c:	ffffc097          	auipc	ra,0xffffc
    80005180:	2ac080e7          	jalr	684(ra) # 80001428 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80005184:	00007797          	auipc	a5,0x7
    80005188:	aaf7c783          	lbu	a5,-1361(a5) # 8000bc33 <_ZL9finishedA>
    8000518c:	fe0788e3          	beqz	a5,8000517c <_Z18Threads_C_API_testv+0xb4>
    80005190:	00007797          	auipc	a5,0x7
    80005194:	aa27c783          	lbu	a5,-1374(a5) # 8000bc32 <_ZL9finishedB>
    80005198:	fe0782e3          	beqz	a5,8000517c <_Z18Threads_C_API_testv+0xb4>
    8000519c:	00007797          	auipc	a5,0x7
    800051a0:	a957c783          	lbu	a5,-1387(a5) # 8000bc31 <_ZL9finishedC>
    800051a4:	fc078ce3          	beqz	a5,8000517c <_Z18Threads_C_API_testv+0xb4>
    800051a8:	00007797          	auipc	a5,0x7
    800051ac:	a887c783          	lbu	a5,-1400(a5) # 8000bc30 <_ZL9finishedD>
    800051b0:	fc0786e3          	beqz	a5,8000517c <_Z18Threads_C_API_testv+0xb4>
    }

}
    800051b4:	02813083          	ld	ra,40(sp)
    800051b8:	02013403          	ld	s0,32(sp)
    800051bc:	03010113          	addi	sp,sp,48
    800051c0:	00008067          	ret

00000000800051c4 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    800051c4:	fd010113          	addi	sp,sp,-48
    800051c8:	02113423          	sd	ra,40(sp)
    800051cc:	02813023          	sd	s0,32(sp)
    800051d0:	00913c23          	sd	s1,24(sp)
    800051d4:	01213823          	sd	s2,16(sp)
    800051d8:	01313423          	sd	s3,8(sp)
    800051dc:	03010413          	addi	s0,sp,48
    800051e0:	00050993          	mv	s3,a0
    800051e4:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    800051e8:	00000913          	li	s2,0
    800051ec:	00c0006f          	j	800051f8 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    800051f0:	ffffd097          	auipc	ra,0xffffd
    800051f4:	6dc080e7          	jalr	1756(ra) # 800028cc <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    800051f8:	ffffc097          	auipc	ra,0xffffc
    800051fc:	370080e7          	jalr	880(ra) # 80001568 <_Z4getcv>
    80005200:	0005059b          	sext.w	a1,a0
    80005204:	01b00793          	li	a5,27
    80005208:	02f58a63          	beq	a1,a5,8000523c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    8000520c:	0084b503          	ld	a0,8(s1)
    80005210:	00001097          	auipc	ra,0x1
    80005214:	c64080e7          	jalr	-924(ra) # 80005e74 <_ZN9BufferCPP3putEi>
        i++;
    80005218:	0019071b          	addiw	a4,s2,1
    8000521c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005220:	0004a683          	lw	a3,0(s1)
    80005224:	0026979b          	slliw	a5,a3,0x2
    80005228:	00d787bb          	addw	a5,a5,a3
    8000522c:	0017979b          	slliw	a5,a5,0x1
    80005230:	02f767bb          	remw	a5,a4,a5
    80005234:	fc0792e3          	bnez	a5,800051f8 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    80005238:	fb9ff06f          	j	800051f0 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    8000523c:	00100793          	li	a5,1
    80005240:	00007717          	auipc	a4,0x7
    80005244:	9ef72c23          	sw	a5,-1544(a4) # 8000bc38 <_ZL9threadEnd>
    td->buffer->put('!');
    80005248:	0209b783          	ld	a5,32(s3)
    8000524c:	02100593          	li	a1,33
    80005250:	0087b503          	ld	a0,8(a5)
    80005254:	00001097          	auipc	ra,0x1
    80005258:	c20080e7          	jalr	-992(ra) # 80005e74 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    8000525c:	0104b503          	ld	a0,16(s1)
    80005260:	ffffd097          	auipc	ra,0xffffd
    80005264:	7b0080e7          	jalr	1968(ra) # 80002a10 <_ZN9Semaphore6signalEv>
}
    80005268:	02813083          	ld	ra,40(sp)
    8000526c:	02013403          	ld	s0,32(sp)
    80005270:	01813483          	ld	s1,24(sp)
    80005274:	01013903          	ld	s2,16(sp)
    80005278:	00813983          	ld	s3,8(sp)
    8000527c:	03010113          	addi	sp,sp,48
    80005280:	00008067          	ret

0000000080005284 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    80005284:	fe010113          	addi	sp,sp,-32
    80005288:	00113c23          	sd	ra,24(sp)
    8000528c:	00813823          	sd	s0,16(sp)
    80005290:	00913423          	sd	s1,8(sp)
    80005294:	01213023          	sd	s2,0(sp)
    80005298:	02010413          	addi	s0,sp,32
    8000529c:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800052a0:	00000913          	li	s2,0
    800052a4:	00c0006f          	j	800052b0 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    800052a8:	ffffd097          	auipc	ra,0xffffd
    800052ac:	624080e7          	jalr	1572(ra) # 800028cc <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    800052b0:	00007797          	auipc	a5,0x7
    800052b4:	9887a783          	lw	a5,-1656(a5) # 8000bc38 <_ZL9threadEnd>
    800052b8:	02079e63          	bnez	a5,800052f4 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    800052bc:	0004a583          	lw	a1,0(s1)
    800052c0:	0305859b          	addiw	a1,a1,48
    800052c4:	0084b503          	ld	a0,8(s1)
    800052c8:	00001097          	auipc	ra,0x1
    800052cc:	bac080e7          	jalr	-1108(ra) # 80005e74 <_ZN9BufferCPP3putEi>
        i++;
    800052d0:	0019071b          	addiw	a4,s2,1
    800052d4:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800052d8:	0004a683          	lw	a3,0(s1)
    800052dc:	0026979b          	slliw	a5,a3,0x2
    800052e0:	00d787bb          	addw	a5,a5,a3
    800052e4:	0017979b          	slliw	a5,a5,0x1
    800052e8:	02f767bb          	remw	a5,a4,a5
    800052ec:	fc0792e3          	bnez	a5,800052b0 <_ZN12ProducerSync8producerEPv+0x2c>
    800052f0:	fb9ff06f          	j	800052a8 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    800052f4:	0104b503          	ld	a0,16(s1)
    800052f8:	ffffd097          	auipc	ra,0xffffd
    800052fc:	718080e7          	jalr	1816(ra) # 80002a10 <_ZN9Semaphore6signalEv>
}
    80005300:	01813083          	ld	ra,24(sp)
    80005304:	01013403          	ld	s0,16(sp)
    80005308:	00813483          	ld	s1,8(sp)
    8000530c:	00013903          	ld	s2,0(sp)
    80005310:	02010113          	addi	sp,sp,32
    80005314:	00008067          	ret

0000000080005318 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80005318:	fd010113          	addi	sp,sp,-48
    8000531c:	02113423          	sd	ra,40(sp)
    80005320:	02813023          	sd	s0,32(sp)
    80005324:	00913c23          	sd	s1,24(sp)
    80005328:	01213823          	sd	s2,16(sp)
    8000532c:	01313423          	sd	s3,8(sp)
    80005330:	01413023          	sd	s4,0(sp)
    80005334:	03010413          	addi	s0,sp,48
    80005338:	00050993          	mv	s3,a0
    8000533c:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005340:	00000a13          	li	s4,0
    80005344:	01c0006f          	j	80005360 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80005348:	ffffd097          	auipc	ra,0xffffd
    8000534c:	584080e7          	jalr	1412(ra) # 800028cc <_ZN6Thread8dispatchEv>
    80005350:	0500006f          	j	800053a0 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80005354:	00a00513          	li	a0,10
    80005358:	ffffc097          	auipc	ra,0xffffc
    8000535c:	238080e7          	jalr	568(ra) # 80001590 <_Z4putcc>
    while (!threadEnd) {
    80005360:	00007797          	auipc	a5,0x7
    80005364:	8d87a783          	lw	a5,-1832(a5) # 8000bc38 <_ZL9threadEnd>
    80005368:	06079263          	bnez	a5,800053cc <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    8000536c:	00893503          	ld	a0,8(s2)
    80005370:	00001097          	auipc	ra,0x1
    80005374:	b94080e7          	jalr	-1132(ra) # 80005f04 <_ZN9BufferCPP3getEv>
        i++;
    80005378:	001a049b          	addiw	s1,s4,1
    8000537c:	00048a1b          	sext.w	s4,s1
        putc(key);
    80005380:	0ff57513          	andi	a0,a0,255
    80005384:	ffffc097          	auipc	ra,0xffffc
    80005388:	20c080e7          	jalr	524(ra) # 80001590 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    8000538c:	00092703          	lw	a4,0(s2)
    80005390:	0027179b          	slliw	a5,a4,0x2
    80005394:	00e787bb          	addw	a5,a5,a4
    80005398:	02f4e7bb          	remw	a5,s1,a5
    8000539c:	fa0786e3          	beqz	a5,80005348 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    800053a0:	05000793          	li	a5,80
    800053a4:	02f4e4bb          	remw	s1,s1,a5
    800053a8:	fa049ce3          	bnez	s1,80005360 <_ZN12ConsumerSync8consumerEPv+0x48>
    800053ac:	fa9ff06f          	j	80005354 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    800053b0:	0209b783          	ld	a5,32(s3)
    800053b4:	0087b503          	ld	a0,8(a5)
    800053b8:	00001097          	auipc	ra,0x1
    800053bc:	b4c080e7          	jalr	-1204(ra) # 80005f04 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    800053c0:	0ff57513          	andi	a0,a0,255
    800053c4:	ffffd097          	auipc	ra,0xffffd
    800053c8:	6ec080e7          	jalr	1772(ra) # 80002ab0 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    800053cc:	0209b783          	ld	a5,32(s3)
    800053d0:	0087b503          	ld	a0,8(a5)
    800053d4:	00001097          	auipc	ra,0x1
    800053d8:	bbc080e7          	jalr	-1092(ra) # 80005f90 <_ZN9BufferCPP6getCntEv>
    800053dc:	fca04ae3          	bgtz	a0,800053b0 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    800053e0:	01093503          	ld	a0,16(s2)
    800053e4:	ffffd097          	auipc	ra,0xffffd
    800053e8:	62c080e7          	jalr	1580(ra) # 80002a10 <_ZN9Semaphore6signalEv>
}
    800053ec:	02813083          	ld	ra,40(sp)
    800053f0:	02013403          	ld	s0,32(sp)
    800053f4:	01813483          	ld	s1,24(sp)
    800053f8:	01013903          	ld	s2,16(sp)
    800053fc:	00813983          	ld	s3,8(sp)
    80005400:	00013a03          	ld	s4,0(sp)
    80005404:	03010113          	addi	sp,sp,48
    80005408:	00008067          	ret

000000008000540c <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    8000540c:	f8010113          	addi	sp,sp,-128
    80005410:	06113c23          	sd	ra,120(sp)
    80005414:	06813823          	sd	s0,112(sp)
    80005418:	06913423          	sd	s1,104(sp)
    8000541c:	07213023          	sd	s2,96(sp)
    80005420:	05313c23          	sd	s3,88(sp)
    80005424:	05413823          	sd	s4,80(sp)
    80005428:	05513423          	sd	s5,72(sp)
    8000542c:	05613023          	sd	s6,64(sp)
    80005430:	03713c23          	sd	s7,56(sp)
    80005434:	03813823          	sd	s8,48(sp)
    80005438:	03913423          	sd	s9,40(sp)
    8000543c:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80005440:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80005444:	00004517          	auipc	a0,0x4
    80005448:	e0c50513          	addi	a0,a0,-500 # 80009250 <CONSOLE_STATUS+0x240>
    8000544c:	00000097          	auipc	ra,0x0
    80005450:	604080e7          	jalr	1540(ra) # 80005a50 <_Z11printStringPKc>
    getString(input, 30);
    80005454:	01e00593          	li	a1,30
    80005458:	f8040493          	addi	s1,s0,-128
    8000545c:	00048513          	mv	a0,s1
    80005460:	00000097          	auipc	ra,0x0
    80005464:	678080e7          	jalr	1656(ra) # 80005ad8 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80005468:	00048513          	mv	a0,s1
    8000546c:	00000097          	auipc	ra,0x0
    80005470:	744080e7          	jalr	1860(ra) # 80005bb0 <_Z11stringToIntPKc>
    80005474:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80005478:	00004517          	auipc	a0,0x4
    8000547c:	df850513          	addi	a0,a0,-520 # 80009270 <CONSOLE_STATUS+0x260>
    80005480:	00000097          	auipc	ra,0x0
    80005484:	5d0080e7          	jalr	1488(ra) # 80005a50 <_Z11printStringPKc>
    getString(input, 30);
    80005488:	01e00593          	li	a1,30
    8000548c:	00048513          	mv	a0,s1
    80005490:	00000097          	auipc	ra,0x0
    80005494:	648080e7          	jalr	1608(ra) # 80005ad8 <_Z9getStringPci>
    n = stringToInt(input);
    80005498:	00048513          	mv	a0,s1
    8000549c:	00000097          	auipc	ra,0x0
    800054a0:	714080e7          	jalr	1812(ra) # 80005bb0 <_Z11stringToIntPKc>
    800054a4:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    800054a8:	00004517          	auipc	a0,0x4
    800054ac:	de850513          	addi	a0,a0,-536 # 80009290 <CONSOLE_STATUS+0x280>
    800054b0:	00000097          	auipc	ra,0x0
    800054b4:	5a0080e7          	jalr	1440(ra) # 80005a50 <_Z11printStringPKc>
    800054b8:	00000613          	li	a2,0
    800054bc:	00a00593          	li	a1,10
    800054c0:	00090513          	mv	a0,s2
    800054c4:	00000097          	auipc	ra,0x0
    800054c8:	73c080e7          	jalr	1852(ra) # 80005c00 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    800054cc:	00004517          	auipc	a0,0x4
    800054d0:	ddc50513          	addi	a0,a0,-548 # 800092a8 <CONSOLE_STATUS+0x298>
    800054d4:	00000097          	auipc	ra,0x0
    800054d8:	57c080e7          	jalr	1404(ra) # 80005a50 <_Z11printStringPKc>
    800054dc:	00000613          	li	a2,0
    800054e0:	00a00593          	li	a1,10
    800054e4:	00048513          	mv	a0,s1
    800054e8:	00000097          	auipc	ra,0x0
    800054ec:	718080e7          	jalr	1816(ra) # 80005c00 <_Z8printIntiii>
    printString(".\n");
    800054f0:	00004517          	auipc	a0,0x4
    800054f4:	dd050513          	addi	a0,a0,-560 # 800092c0 <CONSOLE_STATUS+0x2b0>
    800054f8:	00000097          	auipc	ra,0x0
    800054fc:	558080e7          	jalr	1368(ra) # 80005a50 <_Z11printStringPKc>
    if(threadNum > n) {
    80005500:	0324c463          	blt	s1,s2,80005528 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80005504:	03205c63          	blez	s2,8000553c <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80005508:	03800513          	li	a0,56
    8000550c:	ffffd097          	auipc	ra,0xffffd
    80005510:	1ac080e7          	jalr	428(ra) # 800026b8 <_Znwm>
    80005514:	00050a93          	mv	s5,a0
    80005518:	00048593          	mv	a1,s1
    8000551c:	00001097          	auipc	ra,0x1
    80005520:	804080e7          	jalr	-2044(ra) # 80005d20 <_ZN9BufferCPPC1Ei>
    80005524:	0300006f          	j	80005554 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80005528:	00004517          	auipc	a0,0x4
    8000552c:	da050513          	addi	a0,a0,-608 # 800092c8 <CONSOLE_STATUS+0x2b8>
    80005530:	00000097          	auipc	ra,0x0
    80005534:	520080e7          	jalr	1312(ra) # 80005a50 <_Z11printStringPKc>
        return;
    80005538:	0140006f          	j	8000554c <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    8000553c:	00004517          	auipc	a0,0x4
    80005540:	dcc50513          	addi	a0,a0,-564 # 80009308 <CONSOLE_STATUS+0x2f8>
    80005544:	00000097          	auipc	ra,0x0
    80005548:	50c080e7          	jalr	1292(ra) # 80005a50 <_Z11printStringPKc>
        return;
    8000554c:	000b8113          	mv	sp,s7
    80005550:	2380006f          	j	80005788 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80005554:	01000513          	li	a0,16
    80005558:	ffffd097          	auipc	ra,0xffffd
    8000555c:	160080e7          	jalr	352(ra) # 800026b8 <_Znwm>
    80005560:	00050493          	mv	s1,a0
    80005564:	00000593          	li	a1,0
    80005568:	ffffd097          	auipc	ra,0xffffd
    8000556c:	444080e7          	jalr	1092(ra) # 800029ac <_ZN9SemaphoreC1Ej>
    80005570:	00006797          	auipc	a5,0x6
    80005574:	6c97b823          	sd	s1,1744(a5) # 8000bc40 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80005578:	00391793          	slli	a5,s2,0x3
    8000557c:	00f78793          	addi	a5,a5,15
    80005580:	ff07f793          	andi	a5,a5,-16
    80005584:	40f10133          	sub	sp,sp,a5
    80005588:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    8000558c:	0019071b          	addiw	a4,s2,1
    80005590:	00171793          	slli	a5,a4,0x1
    80005594:	00e787b3          	add	a5,a5,a4
    80005598:	00379793          	slli	a5,a5,0x3
    8000559c:	00f78793          	addi	a5,a5,15
    800055a0:	ff07f793          	andi	a5,a5,-16
    800055a4:	40f10133          	sub	sp,sp,a5
    800055a8:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    800055ac:	00191c13          	slli	s8,s2,0x1
    800055b0:	012c07b3          	add	a5,s8,s2
    800055b4:	00379793          	slli	a5,a5,0x3
    800055b8:	00fa07b3          	add	a5,s4,a5
    800055bc:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    800055c0:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    800055c4:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    800055c8:	02800513          	li	a0,40
    800055cc:	ffffd097          	auipc	ra,0xffffd
    800055d0:	0ec080e7          	jalr	236(ra) # 800026b8 <_Znwm>
    800055d4:	00050b13          	mv	s6,a0
    800055d8:	012c0c33          	add	s8,s8,s2
    800055dc:	003c1c13          	slli	s8,s8,0x3
    800055e0:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    800055e4:	ffffd097          	auipc	ra,0xffffd
    800055e8:	34c080e7          	jalr	844(ra) # 80002930 <_ZN6ThreadC1Ev>
    800055ec:	00006797          	auipc	a5,0x6
    800055f0:	44c78793          	addi	a5,a5,1100 # 8000ba38 <_ZTV12ConsumerSync+0x10>
    800055f4:	00fb3023          	sd	a5,0(s6)
    800055f8:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    800055fc:	000b0513          	mv	a0,s6
    80005600:	ffffd097          	auipc	ra,0xffffd
    80005604:	268080e7          	jalr	616(ra) # 80002868 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005608:	00000493          	li	s1,0
    8000560c:	0380006f          	j	80005644 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005610:	00006797          	auipc	a5,0x6
    80005614:	40078793          	addi	a5,a5,1024 # 8000ba10 <_ZTV12ProducerSync+0x10>
    80005618:	00fcb023          	sd	a5,0(s9)
    8000561c:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80005620:	00349793          	slli	a5,s1,0x3
    80005624:	00f987b3          	add	a5,s3,a5
    80005628:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    8000562c:	00349793          	slli	a5,s1,0x3
    80005630:	00f987b3          	add	a5,s3,a5
    80005634:	0007b503          	ld	a0,0(a5)
    80005638:	ffffd097          	auipc	ra,0xffffd
    8000563c:	230080e7          	jalr	560(ra) # 80002868 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005640:	0014849b          	addiw	s1,s1,1
    80005644:	0b24d063          	bge	s1,s2,800056e4 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    80005648:	00149793          	slli	a5,s1,0x1
    8000564c:	009787b3          	add	a5,a5,s1
    80005650:	00379793          	slli	a5,a5,0x3
    80005654:	00fa07b3          	add	a5,s4,a5
    80005658:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    8000565c:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80005660:	00006717          	auipc	a4,0x6
    80005664:	5e073703          	ld	a4,1504(a4) # 8000bc40 <_ZL10waitForAll>
    80005668:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    8000566c:	02905863          	blez	s1,8000569c <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80005670:	02800513          	li	a0,40
    80005674:	ffffd097          	auipc	ra,0xffffd
    80005678:	044080e7          	jalr	68(ra) # 800026b8 <_Znwm>
    8000567c:	00050c93          	mv	s9,a0
    80005680:	00149c13          	slli	s8,s1,0x1
    80005684:	009c0c33          	add	s8,s8,s1
    80005688:	003c1c13          	slli	s8,s8,0x3
    8000568c:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005690:	ffffd097          	auipc	ra,0xffffd
    80005694:	2a0080e7          	jalr	672(ra) # 80002930 <_ZN6ThreadC1Ev>
    80005698:	f79ff06f          	j	80005610 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    8000569c:	02800513          	li	a0,40
    800056a0:	ffffd097          	auipc	ra,0xffffd
    800056a4:	018080e7          	jalr	24(ra) # 800026b8 <_Znwm>
    800056a8:	00050c93          	mv	s9,a0
    800056ac:	00149c13          	slli	s8,s1,0x1
    800056b0:	009c0c33          	add	s8,s8,s1
    800056b4:	003c1c13          	slli	s8,s8,0x3
    800056b8:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    800056bc:	ffffd097          	auipc	ra,0xffffd
    800056c0:	274080e7          	jalr	628(ra) # 80002930 <_ZN6ThreadC1Ev>
    800056c4:	00006797          	auipc	a5,0x6
    800056c8:	32478793          	addi	a5,a5,804 # 8000b9e8 <_ZTV16ProducerKeyboard+0x10>
    800056cc:	00fcb023          	sd	a5,0(s9)
    800056d0:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    800056d4:	00349793          	slli	a5,s1,0x3
    800056d8:	00f987b3          	add	a5,s3,a5
    800056dc:	0197b023          	sd	s9,0(a5)
    800056e0:	f4dff06f          	j	8000562c <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    800056e4:	ffffd097          	auipc	ra,0xffffd
    800056e8:	1e8080e7          	jalr	488(ra) # 800028cc <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    800056ec:	00000493          	li	s1,0
    800056f0:	00994e63          	blt	s2,s1,8000570c <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    800056f4:	00006517          	auipc	a0,0x6
    800056f8:	54c53503          	ld	a0,1356(a0) # 8000bc40 <_ZL10waitForAll>
    800056fc:	ffffd097          	auipc	ra,0xffffd
    80005700:	2e8080e7          	jalr	744(ra) # 800029e4 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80005704:	0014849b          	addiw	s1,s1,1
    80005708:	fe9ff06f          	j	800056f0 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    8000570c:	00000493          	li	s1,0
    80005710:	0080006f          	j	80005718 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80005714:	0014849b          	addiw	s1,s1,1
    80005718:	0324d263          	bge	s1,s2,8000573c <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    8000571c:	00349793          	slli	a5,s1,0x3
    80005720:	00f987b3          	add	a5,s3,a5
    80005724:	0007b503          	ld	a0,0(a5)
    80005728:	fe0506e3          	beqz	a0,80005714 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    8000572c:	00053783          	ld	a5,0(a0)
    80005730:	0087b783          	ld	a5,8(a5)
    80005734:	000780e7          	jalr	a5
    80005738:	fddff06f          	j	80005714 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    8000573c:	000b0a63          	beqz	s6,80005750 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80005740:	000b3783          	ld	a5,0(s6)
    80005744:	0087b783          	ld	a5,8(a5)
    80005748:	000b0513          	mv	a0,s6
    8000574c:	000780e7          	jalr	a5
    delete waitForAll;
    80005750:	00006517          	auipc	a0,0x6
    80005754:	4f053503          	ld	a0,1264(a0) # 8000bc40 <_ZL10waitForAll>
    80005758:	00050863          	beqz	a0,80005768 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    8000575c:	00053783          	ld	a5,0(a0)
    80005760:	0087b783          	ld	a5,8(a5)
    80005764:	000780e7          	jalr	a5
    delete buffer;
    80005768:	000a8e63          	beqz	s5,80005784 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    8000576c:	000a8513          	mv	a0,s5
    80005770:	00001097          	auipc	ra,0x1
    80005774:	8a8080e7          	jalr	-1880(ra) # 80006018 <_ZN9BufferCPPD1Ev>
    80005778:	000a8513          	mv	a0,s5
    8000577c:	ffffd097          	auipc	ra,0xffffd
    80005780:	f8c080e7          	jalr	-116(ra) # 80002708 <_ZdlPv>
    80005784:	000b8113          	mv	sp,s7

}
    80005788:	f8040113          	addi	sp,s0,-128
    8000578c:	07813083          	ld	ra,120(sp)
    80005790:	07013403          	ld	s0,112(sp)
    80005794:	06813483          	ld	s1,104(sp)
    80005798:	06013903          	ld	s2,96(sp)
    8000579c:	05813983          	ld	s3,88(sp)
    800057a0:	05013a03          	ld	s4,80(sp)
    800057a4:	04813a83          	ld	s5,72(sp)
    800057a8:	04013b03          	ld	s6,64(sp)
    800057ac:	03813b83          	ld	s7,56(sp)
    800057b0:	03013c03          	ld	s8,48(sp)
    800057b4:	02813c83          	ld	s9,40(sp)
    800057b8:	08010113          	addi	sp,sp,128
    800057bc:	00008067          	ret
    800057c0:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    800057c4:	000a8513          	mv	a0,s5
    800057c8:	ffffd097          	auipc	ra,0xffffd
    800057cc:	f40080e7          	jalr	-192(ra) # 80002708 <_ZdlPv>
    800057d0:	00048513          	mv	a0,s1
    800057d4:	00007097          	auipc	ra,0x7
    800057d8:	554080e7          	jalr	1364(ra) # 8000cd28 <_Unwind_Resume>
    800057dc:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    800057e0:	00048513          	mv	a0,s1
    800057e4:	ffffd097          	auipc	ra,0xffffd
    800057e8:	f24080e7          	jalr	-220(ra) # 80002708 <_ZdlPv>
    800057ec:	00090513          	mv	a0,s2
    800057f0:	00007097          	auipc	ra,0x7
    800057f4:	538080e7          	jalr	1336(ra) # 8000cd28 <_Unwind_Resume>
    800057f8:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    800057fc:	000b0513          	mv	a0,s6
    80005800:	ffffd097          	auipc	ra,0xffffd
    80005804:	f08080e7          	jalr	-248(ra) # 80002708 <_ZdlPv>
    80005808:	00048513          	mv	a0,s1
    8000580c:	00007097          	auipc	ra,0x7
    80005810:	51c080e7          	jalr	1308(ra) # 8000cd28 <_Unwind_Resume>
    80005814:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80005818:	000c8513          	mv	a0,s9
    8000581c:	ffffd097          	auipc	ra,0xffffd
    80005820:	eec080e7          	jalr	-276(ra) # 80002708 <_ZdlPv>
    80005824:	00048513          	mv	a0,s1
    80005828:	00007097          	auipc	ra,0x7
    8000582c:	500080e7          	jalr	1280(ra) # 8000cd28 <_Unwind_Resume>
    80005830:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80005834:	000c8513          	mv	a0,s9
    80005838:	ffffd097          	auipc	ra,0xffffd
    8000583c:	ed0080e7          	jalr	-304(ra) # 80002708 <_ZdlPv>
    80005840:	00048513          	mv	a0,s1
    80005844:	00007097          	auipc	ra,0x7
    80005848:	4e4080e7          	jalr	1252(ra) # 8000cd28 <_Unwind_Resume>

000000008000584c <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    8000584c:	ff010113          	addi	sp,sp,-16
    80005850:	00113423          	sd	ra,8(sp)
    80005854:	00813023          	sd	s0,0(sp)
    80005858:	01010413          	addi	s0,sp,16
    8000585c:	00006797          	auipc	a5,0x6
    80005860:	1dc78793          	addi	a5,a5,476 # 8000ba38 <_ZTV12ConsumerSync+0x10>
    80005864:	00f53023          	sd	a5,0(a0)
    80005868:	ffffd097          	auipc	ra,0xffffd
    8000586c:	da4080e7          	jalr	-604(ra) # 8000260c <_ZN6ThreadD1Ev>
    80005870:	00813083          	ld	ra,8(sp)
    80005874:	00013403          	ld	s0,0(sp)
    80005878:	01010113          	addi	sp,sp,16
    8000587c:	00008067          	ret

0000000080005880 <_ZN12ConsumerSyncD0Ev>:
    80005880:	fe010113          	addi	sp,sp,-32
    80005884:	00113c23          	sd	ra,24(sp)
    80005888:	00813823          	sd	s0,16(sp)
    8000588c:	00913423          	sd	s1,8(sp)
    80005890:	02010413          	addi	s0,sp,32
    80005894:	00050493          	mv	s1,a0
    80005898:	00006797          	auipc	a5,0x6
    8000589c:	1a078793          	addi	a5,a5,416 # 8000ba38 <_ZTV12ConsumerSync+0x10>
    800058a0:	00f53023          	sd	a5,0(a0)
    800058a4:	ffffd097          	auipc	ra,0xffffd
    800058a8:	d68080e7          	jalr	-664(ra) # 8000260c <_ZN6ThreadD1Ev>
    800058ac:	00048513          	mv	a0,s1
    800058b0:	ffffd097          	auipc	ra,0xffffd
    800058b4:	e58080e7          	jalr	-424(ra) # 80002708 <_ZdlPv>
    800058b8:	01813083          	ld	ra,24(sp)
    800058bc:	01013403          	ld	s0,16(sp)
    800058c0:	00813483          	ld	s1,8(sp)
    800058c4:	02010113          	addi	sp,sp,32
    800058c8:	00008067          	ret

00000000800058cc <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    800058cc:	ff010113          	addi	sp,sp,-16
    800058d0:	00113423          	sd	ra,8(sp)
    800058d4:	00813023          	sd	s0,0(sp)
    800058d8:	01010413          	addi	s0,sp,16
    800058dc:	00006797          	auipc	a5,0x6
    800058e0:	13478793          	addi	a5,a5,308 # 8000ba10 <_ZTV12ProducerSync+0x10>
    800058e4:	00f53023          	sd	a5,0(a0)
    800058e8:	ffffd097          	auipc	ra,0xffffd
    800058ec:	d24080e7          	jalr	-732(ra) # 8000260c <_ZN6ThreadD1Ev>
    800058f0:	00813083          	ld	ra,8(sp)
    800058f4:	00013403          	ld	s0,0(sp)
    800058f8:	01010113          	addi	sp,sp,16
    800058fc:	00008067          	ret

0000000080005900 <_ZN12ProducerSyncD0Ev>:
    80005900:	fe010113          	addi	sp,sp,-32
    80005904:	00113c23          	sd	ra,24(sp)
    80005908:	00813823          	sd	s0,16(sp)
    8000590c:	00913423          	sd	s1,8(sp)
    80005910:	02010413          	addi	s0,sp,32
    80005914:	00050493          	mv	s1,a0
    80005918:	00006797          	auipc	a5,0x6
    8000591c:	0f878793          	addi	a5,a5,248 # 8000ba10 <_ZTV12ProducerSync+0x10>
    80005920:	00f53023          	sd	a5,0(a0)
    80005924:	ffffd097          	auipc	ra,0xffffd
    80005928:	ce8080e7          	jalr	-792(ra) # 8000260c <_ZN6ThreadD1Ev>
    8000592c:	00048513          	mv	a0,s1
    80005930:	ffffd097          	auipc	ra,0xffffd
    80005934:	dd8080e7          	jalr	-552(ra) # 80002708 <_ZdlPv>
    80005938:	01813083          	ld	ra,24(sp)
    8000593c:	01013403          	ld	s0,16(sp)
    80005940:	00813483          	ld	s1,8(sp)
    80005944:	02010113          	addi	sp,sp,32
    80005948:	00008067          	ret

000000008000594c <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    8000594c:	ff010113          	addi	sp,sp,-16
    80005950:	00113423          	sd	ra,8(sp)
    80005954:	00813023          	sd	s0,0(sp)
    80005958:	01010413          	addi	s0,sp,16
    8000595c:	00006797          	auipc	a5,0x6
    80005960:	08c78793          	addi	a5,a5,140 # 8000b9e8 <_ZTV16ProducerKeyboard+0x10>
    80005964:	00f53023          	sd	a5,0(a0)
    80005968:	ffffd097          	auipc	ra,0xffffd
    8000596c:	ca4080e7          	jalr	-860(ra) # 8000260c <_ZN6ThreadD1Ev>
    80005970:	00813083          	ld	ra,8(sp)
    80005974:	00013403          	ld	s0,0(sp)
    80005978:	01010113          	addi	sp,sp,16
    8000597c:	00008067          	ret

0000000080005980 <_ZN16ProducerKeyboardD0Ev>:
    80005980:	fe010113          	addi	sp,sp,-32
    80005984:	00113c23          	sd	ra,24(sp)
    80005988:	00813823          	sd	s0,16(sp)
    8000598c:	00913423          	sd	s1,8(sp)
    80005990:	02010413          	addi	s0,sp,32
    80005994:	00050493          	mv	s1,a0
    80005998:	00006797          	auipc	a5,0x6
    8000599c:	05078793          	addi	a5,a5,80 # 8000b9e8 <_ZTV16ProducerKeyboard+0x10>
    800059a0:	00f53023          	sd	a5,0(a0)
    800059a4:	ffffd097          	auipc	ra,0xffffd
    800059a8:	c68080e7          	jalr	-920(ra) # 8000260c <_ZN6ThreadD1Ev>
    800059ac:	00048513          	mv	a0,s1
    800059b0:	ffffd097          	auipc	ra,0xffffd
    800059b4:	d58080e7          	jalr	-680(ra) # 80002708 <_ZdlPv>
    800059b8:	01813083          	ld	ra,24(sp)
    800059bc:	01013403          	ld	s0,16(sp)
    800059c0:	00813483          	ld	s1,8(sp)
    800059c4:	02010113          	addi	sp,sp,32
    800059c8:	00008067          	ret

00000000800059cc <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    800059cc:	ff010113          	addi	sp,sp,-16
    800059d0:	00113423          	sd	ra,8(sp)
    800059d4:	00813023          	sd	s0,0(sp)
    800059d8:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    800059dc:	02053583          	ld	a1,32(a0)
    800059e0:	fffff097          	auipc	ra,0xfffff
    800059e4:	7e4080e7          	jalr	2020(ra) # 800051c4 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    800059e8:	00813083          	ld	ra,8(sp)
    800059ec:	00013403          	ld	s0,0(sp)
    800059f0:	01010113          	addi	sp,sp,16
    800059f4:	00008067          	ret

00000000800059f8 <_ZN12ProducerSync3runEv>:
    void run() override {
    800059f8:	ff010113          	addi	sp,sp,-16
    800059fc:	00113423          	sd	ra,8(sp)
    80005a00:	00813023          	sd	s0,0(sp)
    80005a04:	01010413          	addi	s0,sp,16
        producer(td);
    80005a08:	02053583          	ld	a1,32(a0)
    80005a0c:	00000097          	auipc	ra,0x0
    80005a10:	878080e7          	jalr	-1928(ra) # 80005284 <_ZN12ProducerSync8producerEPv>
    }
    80005a14:	00813083          	ld	ra,8(sp)
    80005a18:	00013403          	ld	s0,0(sp)
    80005a1c:	01010113          	addi	sp,sp,16
    80005a20:	00008067          	ret

0000000080005a24 <_ZN12ConsumerSync3runEv>:
    void run() override {
    80005a24:	ff010113          	addi	sp,sp,-16
    80005a28:	00113423          	sd	ra,8(sp)
    80005a2c:	00813023          	sd	s0,0(sp)
    80005a30:	01010413          	addi	s0,sp,16
        consumer(td);
    80005a34:	02053583          	ld	a1,32(a0)
    80005a38:	00000097          	auipc	ra,0x0
    80005a3c:	8e0080e7          	jalr	-1824(ra) # 80005318 <_ZN12ConsumerSync8consumerEPv>
    }
    80005a40:	00813083          	ld	ra,8(sp)
    80005a44:	00013403          	ld	s0,0(sp)
    80005a48:	01010113          	addi	sp,sp,16
    80005a4c:	00008067          	ret

0000000080005a50 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80005a50:	fe010113          	addi	sp,sp,-32
    80005a54:	00113c23          	sd	ra,24(sp)
    80005a58:	00813823          	sd	s0,16(sp)
    80005a5c:	00913423          	sd	s1,8(sp)
    80005a60:	02010413          	addi	s0,sp,32
    80005a64:	00050493          	mv	s1,a0
    LOCK();
    80005a68:	00100613          	li	a2,1
    80005a6c:	00000593          	li	a1,0
    80005a70:	00006517          	auipc	a0,0x6
    80005a74:	1d850513          	addi	a0,a0,472 # 8000bc48 <lockPrint>
    80005a78:	ffffb097          	auipc	ra,0xffffb
    80005a7c:	7ac080e7          	jalr	1964(ra) # 80001224 <copy_and_swap>
    80005a80:	00050863          	beqz	a0,80005a90 <_Z11printStringPKc+0x40>
    80005a84:	ffffc097          	auipc	ra,0xffffc
    80005a88:	9a4080e7          	jalr	-1628(ra) # 80001428 <_Z15thread_dispatchv>
    80005a8c:	fddff06f          	j	80005a68 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80005a90:	0004c503          	lbu	a0,0(s1)
    80005a94:	00050a63          	beqz	a0,80005aa8 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80005a98:	ffffc097          	auipc	ra,0xffffc
    80005a9c:	af8080e7          	jalr	-1288(ra) # 80001590 <_Z4putcc>
        string++;
    80005aa0:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80005aa4:	fedff06f          	j	80005a90 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80005aa8:	00000613          	li	a2,0
    80005aac:	00100593          	li	a1,1
    80005ab0:	00006517          	auipc	a0,0x6
    80005ab4:	19850513          	addi	a0,a0,408 # 8000bc48 <lockPrint>
    80005ab8:	ffffb097          	auipc	ra,0xffffb
    80005abc:	76c080e7          	jalr	1900(ra) # 80001224 <copy_and_swap>
    80005ac0:	fe0514e3          	bnez	a0,80005aa8 <_Z11printStringPKc+0x58>
}
    80005ac4:	01813083          	ld	ra,24(sp)
    80005ac8:	01013403          	ld	s0,16(sp)
    80005acc:	00813483          	ld	s1,8(sp)
    80005ad0:	02010113          	addi	sp,sp,32
    80005ad4:	00008067          	ret

0000000080005ad8 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80005ad8:	fd010113          	addi	sp,sp,-48
    80005adc:	02113423          	sd	ra,40(sp)
    80005ae0:	02813023          	sd	s0,32(sp)
    80005ae4:	00913c23          	sd	s1,24(sp)
    80005ae8:	01213823          	sd	s2,16(sp)
    80005aec:	01313423          	sd	s3,8(sp)
    80005af0:	01413023          	sd	s4,0(sp)
    80005af4:	03010413          	addi	s0,sp,48
    80005af8:	00050993          	mv	s3,a0
    80005afc:	00058a13          	mv	s4,a1
    LOCK();
    80005b00:	00100613          	li	a2,1
    80005b04:	00000593          	li	a1,0
    80005b08:	00006517          	auipc	a0,0x6
    80005b0c:	14050513          	addi	a0,a0,320 # 8000bc48 <lockPrint>
    80005b10:	ffffb097          	auipc	ra,0xffffb
    80005b14:	714080e7          	jalr	1812(ra) # 80001224 <copy_and_swap>
    80005b18:	00050863          	beqz	a0,80005b28 <_Z9getStringPci+0x50>
    80005b1c:	ffffc097          	auipc	ra,0xffffc
    80005b20:	90c080e7          	jalr	-1780(ra) # 80001428 <_Z15thread_dispatchv>
    80005b24:	fddff06f          	j	80005b00 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80005b28:	00000913          	li	s2,0
    80005b2c:	00090493          	mv	s1,s2
    80005b30:	0019091b          	addiw	s2,s2,1
    80005b34:	03495a63          	bge	s2,s4,80005b68 <_Z9getStringPci+0x90>
        cc = getc();
    80005b38:	ffffc097          	auipc	ra,0xffffc
    80005b3c:	a30080e7          	jalr	-1488(ra) # 80001568 <_Z4getcv>
        if(cc < 1)
    80005b40:	02050463          	beqz	a0,80005b68 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80005b44:	009984b3          	add	s1,s3,s1
    80005b48:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80005b4c:	00a00793          	li	a5,10
    80005b50:	00f50a63          	beq	a0,a5,80005b64 <_Z9getStringPci+0x8c>
    80005b54:	00d00793          	li	a5,13
    80005b58:	fcf51ae3          	bne	a0,a5,80005b2c <_Z9getStringPci+0x54>
        buf[i++] = c;
    80005b5c:	00090493          	mv	s1,s2
    80005b60:	0080006f          	j	80005b68 <_Z9getStringPci+0x90>
    80005b64:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80005b68:	009984b3          	add	s1,s3,s1
    80005b6c:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80005b70:	00000613          	li	a2,0
    80005b74:	00100593          	li	a1,1
    80005b78:	00006517          	auipc	a0,0x6
    80005b7c:	0d050513          	addi	a0,a0,208 # 8000bc48 <lockPrint>
    80005b80:	ffffb097          	auipc	ra,0xffffb
    80005b84:	6a4080e7          	jalr	1700(ra) # 80001224 <copy_and_swap>
    80005b88:	fe0514e3          	bnez	a0,80005b70 <_Z9getStringPci+0x98>
    return buf;
}
    80005b8c:	00098513          	mv	a0,s3
    80005b90:	02813083          	ld	ra,40(sp)
    80005b94:	02013403          	ld	s0,32(sp)
    80005b98:	01813483          	ld	s1,24(sp)
    80005b9c:	01013903          	ld	s2,16(sp)
    80005ba0:	00813983          	ld	s3,8(sp)
    80005ba4:	00013a03          	ld	s4,0(sp)
    80005ba8:	03010113          	addi	sp,sp,48
    80005bac:	00008067          	ret

0000000080005bb0 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80005bb0:	ff010113          	addi	sp,sp,-16
    80005bb4:	00813423          	sd	s0,8(sp)
    80005bb8:	01010413          	addi	s0,sp,16
    80005bbc:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80005bc0:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80005bc4:	0006c603          	lbu	a2,0(a3)
    80005bc8:	fd06071b          	addiw	a4,a2,-48
    80005bcc:	0ff77713          	andi	a4,a4,255
    80005bd0:	00900793          	li	a5,9
    80005bd4:	02e7e063          	bltu	a5,a4,80005bf4 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80005bd8:	0025179b          	slliw	a5,a0,0x2
    80005bdc:	00a787bb          	addw	a5,a5,a0
    80005be0:	0017979b          	slliw	a5,a5,0x1
    80005be4:	00168693          	addi	a3,a3,1
    80005be8:	00c787bb          	addw	a5,a5,a2
    80005bec:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80005bf0:	fd5ff06f          	j	80005bc4 <_Z11stringToIntPKc+0x14>
    return n;
}
    80005bf4:	00813403          	ld	s0,8(sp)
    80005bf8:	01010113          	addi	sp,sp,16
    80005bfc:	00008067          	ret

0000000080005c00 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80005c00:	fc010113          	addi	sp,sp,-64
    80005c04:	02113c23          	sd	ra,56(sp)
    80005c08:	02813823          	sd	s0,48(sp)
    80005c0c:	02913423          	sd	s1,40(sp)
    80005c10:	03213023          	sd	s2,32(sp)
    80005c14:	01313c23          	sd	s3,24(sp)
    80005c18:	04010413          	addi	s0,sp,64
    80005c1c:	00050493          	mv	s1,a0
    80005c20:	00058913          	mv	s2,a1
    80005c24:	00060993          	mv	s3,a2
    LOCK();
    80005c28:	00100613          	li	a2,1
    80005c2c:	00000593          	li	a1,0
    80005c30:	00006517          	auipc	a0,0x6
    80005c34:	01850513          	addi	a0,a0,24 # 8000bc48 <lockPrint>
    80005c38:	ffffb097          	auipc	ra,0xffffb
    80005c3c:	5ec080e7          	jalr	1516(ra) # 80001224 <copy_and_swap>
    80005c40:	00050863          	beqz	a0,80005c50 <_Z8printIntiii+0x50>
    80005c44:	ffffb097          	auipc	ra,0xffffb
    80005c48:	7e4080e7          	jalr	2020(ra) # 80001428 <_Z15thread_dispatchv>
    80005c4c:	fddff06f          	j	80005c28 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80005c50:	00098463          	beqz	s3,80005c58 <_Z8printIntiii+0x58>
    80005c54:	0804c463          	bltz	s1,80005cdc <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80005c58:	0004851b          	sext.w	a0,s1
    neg = 0;
    80005c5c:	00000593          	li	a1,0
    }

    i = 0;
    80005c60:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80005c64:	0009079b          	sext.w	a5,s2
    80005c68:	0325773b          	remuw	a4,a0,s2
    80005c6c:	00048613          	mv	a2,s1
    80005c70:	0014849b          	addiw	s1,s1,1
    80005c74:	02071693          	slli	a3,a4,0x20
    80005c78:	0206d693          	srli	a3,a3,0x20
    80005c7c:	00006717          	auipc	a4,0x6
    80005c80:	dd470713          	addi	a4,a4,-556 # 8000ba50 <digits>
    80005c84:	00d70733          	add	a4,a4,a3
    80005c88:	00074683          	lbu	a3,0(a4)
    80005c8c:	fd040713          	addi	a4,s0,-48
    80005c90:	00c70733          	add	a4,a4,a2
    80005c94:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80005c98:	0005071b          	sext.w	a4,a0
    80005c9c:	0325553b          	divuw	a0,a0,s2
    80005ca0:	fcf772e3          	bgeu	a4,a5,80005c64 <_Z8printIntiii+0x64>
    if(neg)
    80005ca4:	00058c63          	beqz	a1,80005cbc <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80005ca8:	fd040793          	addi	a5,s0,-48
    80005cac:	009784b3          	add	s1,a5,s1
    80005cb0:	02d00793          	li	a5,45
    80005cb4:	fef48823          	sb	a5,-16(s1)
    80005cb8:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80005cbc:	fff4849b          	addiw	s1,s1,-1
    80005cc0:	0204c463          	bltz	s1,80005ce8 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80005cc4:	fd040793          	addi	a5,s0,-48
    80005cc8:	009787b3          	add	a5,a5,s1
    80005ccc:	ff07c503          	lbu	a0,-16(a5)
    80005cd0:	ffffc097          	auipc	ra,0xffffc
    80005cd4:	8c0080e7          	jalr	-1856(ra) # 80001590 <_Z4putcc>
    80005cd8:	fe5ff06f          	j	80005cbc <_Z8printIntiii+0xbc>
        x = -xx;
    80005cdc:	4090053b          	negw	a0,s1
        neg = 1;
    80005ce0:	00100593          	li	a1,1
        x = -xx;
    80005ce4:	f7dff06f          	j	80005c60 <_Z8printIntiii+0x60>

    UNLOCK();
    80005ce8:	00000613          	li	a2,0
    80005cec:	00100593          	li	a1,1
    80005cf0:	00006517          	auipc	a0,0x6
    80005cf4:	f5850513          	addi	a0,a0,-168 # 8000bc48 <lockPrint>
    80005cf8:	ffffb097          	auipc	ra,0xffffb
    80005cfc:	52c080e7          	jalr	1324(ra) # 80001224 <copy_and_swap>
    80005d00:	fe0514e3          	bnez	a0,80005ce8 <_Z8printIntiii+0xe8>
    80005d04:	03813083          	ld	ra,56(sp)
    80005d08:	03013403          	ld	s0,48(sp)
    80005d0c:	02813483          	ld	s1,40(sp)
    80005d10:	02013903          	ld	s2,32(sp)
    80005d14:	01813983          	ld	s3,24(sp)
    80005d18:	04010113          	addi	sp,sp,64
    80005d1c:	00008067          	ret

0000000080005d20 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80005d20:	fd010113          	addi	sp,sp,-48
    80005d24:	02113423          	sd	ra,40(sp)
    80005d28:	02813023          	sd	s0,32(sp)
    80005d2c:	00913c23          	sd	s1,24(sp)
    80005d30:	01213823          	sd	s2,16(sp)
    80005d34:	01313423          	sd	s3,8(sp)
    80005d38:	03010413          	addi	s0,sp,48
    80005d3c:	00050493          	mv	s1,a0
    80005d40:	00058913          	mv	s2,a1
    80005d44:	0015879b          	addiw	a5,a1,1
    80005d48:	0007851b          	sext.w	a0,a5
    80005d4c:	00f4a023          	sw	a5,0(s1)
    80005d50:	0004a823          	sw	zero,16(s1)
    80005d54:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80005d58:	00251513          	slli	a0,a0,0x2
    80005d5c:	ffffb097          	auipc	ra,0xffffb
    80005d60:	5b4080e7          	jalr	1460(ra) # 80001310 <_Z9mem_allocm>
    80005d64:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80005d68:	01000513          	li	a0,16
    80005d6c:	ffffd097          	auipc	ra,0xffffd
    80005d70:	94c080e7          	jalr	-1716(ra) # 800026b8 <_Znwm>
    80005d74:	00050993          	mv	s3,a0
    80005d78:	00000593          	li	a1,0
    80005d7c:	ffffd097          	auipc	ra,0xffffd
    80005d80:	c30080e7          	jalr	-976(ra) # 800029ac <_ZN9SemaphoreC1Ej>
    80005d84:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80005d88:	01000513          	li	a0,16
    80005d8c:	ffffd097          	auipc	ra,0xffffd
    80005d90:	92c080e7          	jalr	-1748(ra) # 800026b8 <_Znwm>
    80005d94:	00050993          	mv	s3,a0
    80005d98:	00090593          	mv	a1,s2
    80005d9c:	ffffd097          	auipc	ra,0xffffd
    80005da0:	c10080e7          	jalr	-1008(ra) # 800029ac <_ZN9SemaphoreC1Ej>
    80005da4:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80005da8:	01000513          	li	a0,16
    80005dac:	ffffd097          	auipc	ra,0xffffd
    80005db0:	90c080e7          	jalr	-1780(ra) # 800026b8 <_Znwm>
    80005db4:	00050913          	mv	s2,a0
    80005db8:	00100593          	li	a1,1
    80005dbc:	ffffd097          	auipc	ra,0xffffd
    80005dc0:	bf0080e7          	jalr	-1040(ra) # 800029ac <_ZN9SemaphoreC1Ej>
    80005dc4:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80005dc8:	01000513          	li	a0,16
    80005dcc:	ffffd097          	auipc	ra,0xffffd
    80005dd0:	8ec080e7          	jalr	-1812(ra) # 800026b8 <_Znwm>
    80005dd4:	00050913          	mv	s2,a0
    80005dd8:	00100593          	li	a1,1
    80005ddc:	ffffd097          	auipc	ra,0xffffd
    80005de0:	bd0080e7          	jalr	-1072(ra) # 800029ac <_ZN9SemaphoreC1Ej>
    80005de4:	0324b823          	sd	s2,48(s1)
}
    80005de8:	02813083          	ld	ra,40(sp)
    80005dec:	02013403          	ld	s0,32(sp)
    80005df0:	01813483          	ld	s1,24(sp)
    80005df4:	01013903          	ld	s2,16(sp)
    80005df8:	00813983          	ld	s3,8(sp)
    80005dfc:	03010113          	addi	sp,sp,48
    80005e00:	00008067          	ret
    80005e04:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80005e08:	00098513          	mv	a0,s3
    80005e0c:	ffffd097          	auipc	ra,0xffffd
    80005e10:	8fc080e7          	jalr	-1796(ra) # 80002708 <_ZdlPv>
    80005e14:	00048513          	mv	a0,s1
    80005e18:	00007097          	auipc	ra,0x7
    80005e1c:	f10080e7          	jalr	-240(ra) # 8000cd28 <_Unwind_Resume>
    80005e20:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80005e24:	00098513          	mv	a0,s3
    80005e28:	ffffd097          	auipc	ra,0xffffd
    80005e2c:	8e0080e7          	jalr	-1824(ra) # 80002708 <_ZdlPv>
    80005e30:	00048513          	mv	a0,s1
    80005e34:	00007097          	auipc	ra,0x7
    80005e38:	ef4080e7          	jalr	-268(ra) # 8000cd28 <_Unwind_Resume>
    80005e3c:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80005e40:	00090513          	mv	a0,s2
    80005e44:	ffffd097          	auipc	ra,0xffffd
    80005e48:	8c4080e7          	jalr	-1852(ra) # 80002708 <_ZdlPv>
    80005e4c:	00048513          	mv	a0,s1
    80005e50:	00007097          	auipc	ra,0x7
    80005e54:	ed8080e7          	jalr	-296(ra) # 8000cd28 <_Unwind_Resume>
    80005e58:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80005e5c:	00090513          	mv	a0,s2
    80005e60:	ffffd097          	auipc	ra,0xffffd
    80005e64:	8a8080e7          	jalr	-1880(ra) # 80002708 <_ZdlPv>
    80005e68:	00048513          	mv	a0,s1
    80005e6c:	00007097          	auipc	ra,0x7
    80005e70:	ebc080e7          	jalr	-324(ra) # 8000cd28 <_Unwind_Resume>

0000000080005e74 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80005e74:	fe010113          	addi	sp,sp,-32
    80005e78:	00113c23          	sd	ra,24(sp)
    80005e7c:	00813823          	sd	s0,16(sp)
    80005e80:	00913423          	sd	s1,8(sp)
    80005e84:	01213023          	sd	s2,0(sp)
    80005e88:	02010413          	addi	s0,sp,32
    80005e8c:	00050493          	mv	s1,a0
    80005e90:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80005e94:	01853503          	ld	a0,24(a0)
    80005e98:	ffffd097          	auipc	ra,0xffffd
    80005e9c:	b4c080e7          	jalr	-1204(ra) # 800029e4 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80005ea0:	0304b503          	ld	a0,48(s1)
    80005ea4:	ffffd097          	auipc	ra,0xffffd
    80005ea8:	b40080e7          	jalr	-1216(ra) # 800029e4 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80005eac:	0084b783          	ld	a5,8(s1)
    80005eb0:	0144a703          	lw	a4,20(s1)
    80005eb4:	00271713          	slli	a4,a4,0x2
    80005eb8:	00e787b3          	add	a5,a5,a4
    80005ebc:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80005ec0:	0144a783          	lw	a5,20(s1)
    80005ec4:	0017879b          	addiw	a5,a5,1
    80005ec8:	0004a703          	lw	a4,0(s1)
    80005ecc:	02e7e7bb          	remw	a5,a5,a4
    80005ed0:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80005ed4:	0304b503          	ld	a0,48(s1)
    80005ed8:	ffffd097          	auipc	ra,0xffffd
    80005edc:	b38080e7          	jalr	-1224(ra) # 80002a10 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80005ee0:	0204b503          	ld	a0,32(s1)
    80005ee4:	ffffd097          	auipc	ra,0xffffd
    80005ee8:	b2c080e7          	jalr	-1236(ra) # 80002a10 <_ZN9Semaphore6signalEv>

}
    80005eec:	01813083          	ld	ra,24(sp)
    80005ef0:	01013403          	ld	s0,16(sp)
    80005ef4:	00813483          	ld	s1,8(sp)
    80005ef8:	00013903          	ld	s2,0(sp)
    80005efc:	02010113          	addi	sp,sp,32
    80005f00:	00008067          	ret

0000000080005f04 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80005f04:	fe010113          	addi	sp,sp,-32
    80005f08:	00113c23          	sd	ra,24(sp)
    80005f0c:	00813823          	sd	s0,16(sp)
    80005f10:	00913423          	sd	s1,8(sp)
    80005f14:	01213023          	sd	s2,0(sp)
    80005f18:	02010413          	addi	s0,sp,32
    80005f1c:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80005f20:	02053503          	ld	a0,32(a0)
    80005f24:	ffffd097          	auipc	ra,0xffffd
    80005f28:	ac0080e7          	jalr	-1344(ra) # 800029e4 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80005f2c:	0284b503          	ld	a0,40(s1)
    80005f30:	ffffd097          	auipc	ra,0xffffd
    80005f34:	ab4080e7          	jalr	-1356(ra) # 800029e4 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80005f38:	0084b703          	ld	a4,8(s1)
    80005f3c:	0104a783          	lw	a5,16(s1)
    80005f40:	00279693          	slli	a3,a5,0x2
    80005f44:	00d70733          	add	a4,a4,a3
    80005f48:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80005f4c:	0017879b          	addiw	a5,a5,1
    80005f50:	0004a703          	lw	a4,0(s1)
    80005f54:	02e7e7bb          	remw	a5,a5,a4
    80005f58:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80005f5c:	0284b503          	ld	a0,40(s1)
    80005f60:	ffffd097          	auipc	ra,0xffffd
    80005f64:	ab0080e7          	jalr	-1360(ra) # 80002a10 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80005f68:	0184b503          	ld	a0,24(s1)
    80005f6c:	ffffd097          	auipc	ra,0xffffd
    80005f70:	aa4080e7          	jalr	-1372(ra) # 80002a10 <_ZN9Semaphore6signalEv>

    return ret;
}
    80005f74:	00090513          	mv	a0,s2
    80005f78:	01813083          	ld	ra,24(sp)
    80005f7c:	01013403          	ld	s0,16(sp)
    80005f80:	00813483          	ld	s1,8(sp)
    80005f84:	00013903          	ld	s2,0(sp)
    80005f88:	02010113          	addi	sp,sp,32
    80005f8c:	00008067          	ret

0000000080005f90 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80005f90:	fe010113          	addi	sp,sp,-32
    80005f94:	00113c23          	sd	ra,24(sp)
    80005f98:	00813823          	sd	s0,16(sp)
    80005f9c:	00913423          	sd	s1,8(sp)
    80005fa0:	01213023          	sd	s2,0(sp)
    80005fa4:	02010413          	addi	s0,sp,32
    80005fa8:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80005fac:	02853503          	ld	a0,40(a0)
    80005fb0:	ffffd097          	auipc	ra,0xffffd
    80005fb4:	a34080e7          	jalr	-1484(ra) # 800029e4 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80005fb8:	0304b503          	ld	a0,48(s1)
    80005fbc:	ffffd097          	auipc	ra,0xffffd
    80005fc0:	a28080e7          	jalr	-1496(ra) # 800029e4 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80005fc4:	0144a783          	lw	a5,20(s1)
    80005fc8:	0104a903          	lw	s2,16(s1)
    80005fcc:	0327ce63          	blt	a5,s2,80006008 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80005fd0:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80005fd4:	0304b503          	ld	a0,48(s1)
    80005fd8:	ffffd097          	auipc	ra,0xffffd
    80005fdc:	a38080e7          	jalr	-1480(ra) # 80002a10 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80005fe0:	0284b503          	ld	a0,40(s1)
    80005fe4:	ffffd097          	auipc	ra,0xffffd
    80005fe8:	a2c080e7          	jalr	-1492(ra) # 80002a10 <_ZN9Semaphore6signalEv>

    return ret;
}
    80005fec:	00090513          	mv	a0,s2
    80005ff0:	01813083          	ld	ra,24(sp)
    80005ff4:	01013403          	ld	s0,16(sp)
    80005ff8:	00813483          	ld	s1,8(sp)
    80005ffc:	00013903          	ld	s2,0(sp)
    80006000:	02010113          	addi	sp,sp,32
    80006004:	00008067          	ret
        ret = cap - head + tail;
    80006008:	0004a703          	lw	a4,0(s1)
    8000600c:	4127093b          	subw	s2,a4,s2
    80006010:	00f9093b          	addw	s2,s2,a5
    80006014:	fc1ff06f          	j	80005fd4 <_ZN9BufferCPP6getCntEv+0x44>

0000000080006018 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80006018:	fe010113          	addi	sp,sp,-32
    8000601c:	00113c23          	sd	ra,24(sp)
    80006020:	00813823          	sd	s0,16(sp)
    80006024:	00913423          	sd	s1,8(sp)
    80006028:	02010413          	addi	s0,sp,32
    8000602c:	00050493          	mv	s1,a0
    Console::putc('\n');
    80006030:	00a00513          	li	a0,10
    80006034:	ffffd097          	auipc	ra,0xffffd
    80006038:	a7c080e7          	jalr	-1412(ra) # 80002ab0 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    8000603c:	00003517          	auipc	a0,0x3
    80006040:	3f450513          	addi	a0,a0,1012 # 80009430 <CONSOLE_STATUS+0x420>
    80006044:	00000097          	auipc	ra,0x0
    80006048:	a0c080e7          	jalr	-1524(ra) # 80005a50 <_Z11printStringPKc>
    while (getCnt()) {
    8000604c:	00048513          	mv	a0,s1
    80006050:	00000097          	auipc	ra,0x0
    80006054:	f40080e7          	jalr	-192(ra) # 80005f90 <_ZN9BufferCPP6getCntEv>
    80006058:	02050c63          	beqz	a0,80006090 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    8000605c:	0084b783          	ld	a5,8(s1)
    80006060:	0104a703          	lw	a4,16(s1)
    80006064:	00271713          	slli	a4,a4,0x2
    80006068:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    8000606c:	0007c503          	lbu	a0,0(a5)
    80006070:	ffffd097          	auipc	ra,0xffffd
    80006074:	a40080e7          	jalr	-1472(ra) # 80002ab0 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80006078:	0104a783          	lw	a5,16(s1)
    8000607c:	0017879b          	addiw	a5,a5,1
    80006080:	0004a703          	lw	a4,0(s1)
    80006084:	02e7e7bb          	remw	a5,a5,a4
    80006088:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    8000608c:	fc1ff06f          	j	8000604c <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80006090:	02100513          	li	a0,33
    80006094:	ffffd097          	auipc	ra,0xffffd
    80006098:	a1c080e7          	jalr	-1508(ra) # 80002ab0 <_ZN7Console4putcEc>
    Console::putc('\n');
    8000609c:	00a00513          	li	a0,10
    800060a0:	ffffd097          	auipc	ra,0xffffd
    800060a4:	a10080e7          	jalr	-1520(ra) # 80002ab0 <_ZN7Console4putcEc>
    mem_free(buffer);
    800060a8:	0084b503          	ld	a0,8(s1)
    800060ac:	ffffb097          	auipc	ra,0xffffb
    800060b0:	2a4080e7          	jalr	676(ra) # 80001350 <_Z8mem_freePv>
    delete itemAvailable;
    800060b4:	0204b503          	ld	a0,32(s1)
    800060b8:	00050863          	beqz	a0,800060c8 <_ZN9BufferCPPD1Ev+0xb0>
    800060bc:	00053783          	ld	a5,0(a0)
    800060c0:	0087b783          	ld	a5,8(a5)
    800060c4:	000780e7          	jalr	a5
    delete spaceAvailable;
    800060c8:	0184b503          	ld	a0,24(s1)
    800060cc:	00050863          	beqz	a0,800060dc <_ZN9BufferCPPD1Ev+0xc4>
    800060d0:	00053783          	ld	a5,0(a0)
    800060d4:	0087b783          	ld	a5,8(a5)
    800060d8:	000780e7          	jalr	a5
    delete mutexTail;
    800060dc:	0304b503          	ld	a0,48(s1)
    800060e0:	00050863          	beqz	a0,800060f0 <_ZN9BufferCPPD1Ev+0xd8>
    800060e4:	00053783          	ld	a5,0(a0)
    800060e8:	0087b783          	ld	a5,8(a5)
    800060ec:	000780e7          	jalr	a5
    delete mutexHead;
    800060f0:	0284b503          	ld	a0,40(s1)
    800060f4:	00050863          	beqz	a0,80006104 <_ZN9BufferCPPD1Ev+0xec>
    800060f8:	00053783          	ld	a5,0(a0)
    800060fc:	0087b783          	ld	a5,8(a5)
    80006100:	000780e7          	jalr	a5
}
    80006104:	01813083          	ld	ra,24(sp)
    80006108:	01013403          	ld	s0,16(sp)
    8000610c:	00813483          	ld	s1,8(sp)
    80006110:	02010113          	addi	sp,sp,32
    80006114:	00008067          	ret

0000000080006118 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    80006118:	fe010113          	addi	sp,sp,-32
    8000611c:	00113c23          	sd	ra,24(sp)
    80006120:	00813823          	sd	s0,16(sp)
    80006124:	00913423          	sd	s1,8(sp)
    80006128:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    8000612c:	00003517          	auipc	a0,0x3
    80006130:	31c50513          	addi	a0,a0,796 # 80009448 <CONSOLE_STATUS+0x438>
    80006134:	00000097          	auipc	ra,0x0
    80006138:	91c080e7          	jalr	-1764(ra) # 80005a50 <_Z11printStringPKc>
    int test = getc() - '0';
    8000613c:	ffffb097          	auipc	ra,0xffffb
    80006140:	42c080e7          	jalr	1068(ra) # 80001568 <_Z4getcv>
    80006144:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    80006148:	ffffb097          	auipc	ra,0xffffb
    8000614c:	420080e7          	jalr	1056(ra) # 80001568 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80006150:	00700793          	li	a5,7
    80006154:	1097e263          	bltu	a5,s1,80006258 <_Z8userMainv+0x140>
    80006158:	00249493          	slli	s1,s1,0x2
    8000615c:	00003717          	auipc	a4,0x3
    80006160:	54470713          	addi	a4,a4,1348 # 800096a0 <CONSOLE_STATUS+0x690>
    80006164:	00e484b3          	add	s1,s1,a4
    80006168:	0004a783          	lw	a5,0(s1)
    8000616c:	00e787b3          	add	a5,a5,a4
    80006170:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    80006174:	fffff097          	auipc	ra,0xfffff
    80006178:	f54080e7          	jalr	-172(ra) # 800050c8 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    8000617c:	00003517          	auipc	a0,0x3
    80006180:	2ec50513          	addi	a0,a0,748 # 80009468 <CONSOLE_STATUS+0x458>
    80006184:	00000097          	auipc	ra,0x0
    80006188:	8cc080e7          	jalr	-1844(ra) # 80005a50 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    8000618c:	01813083          	ld	ra,24(sp)
    80006190:	01013403          	ld	s0,16(sp)
    80006194:	00813483          	ld	s1,8(sp)
    80006198:	02010113          	addi	sp,sp,32
    8000619c:	00008067          	ret
            Threads_CPP_API_test();
    800061a0:	ffffe097          	auipc	ra,0xffffe
    800061a4:	e08080e7          	jalr	-504(ra) # 80003fa8 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    800061a8:	00003517          	auipc	a0,0x3
    800061ac:	30050513          	addi	a0,a0,768 # 800094a8 <CONSOLE_STATUS+0x498>
    800061b0:	00000097          	auipc	ra,0x0
    800061b4:	8a0080e7          	jalr	-1888(ra) # 80005a50 <_Z11printStringPKc>
            break;
    800061b8:	fd5ff06f          	j	8000618c <_Z8userMainv+0x74>
            producerConsumer_C_API();
    800061bc:	ffffd097          	auipc	ra,0xffffd
    800061c0:	640080e7          	jalr	1600(ra) # 800037fc <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    800061c4:	00003517          	auipc	a0,0x3
    800061c8:	32450513          	addi	a0,a0,804 # 800094e8 <CONSOLE_STATUS+0x4d8>
    800061cc:	00000097          	auipc	ra,0x0
    800061d0:	884080e7          	jalr	-1916(ra) # 80005a50 <_Z11printStringPKc>
            break;
    800061d4:	fb9ff06f          	j	8000618c <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    800061d8:	fffff097          	auipc	ra,0xfffff
    800061dc:	234080e7          	jalr	564(ra) # 8000540c <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    800061e0:	00003517          	auipc	a0,0x3
    800061e4:	35850513          	addi	a0,a0,856 # 80009538 <CONSOLE_STATUS+0x528>
    800061e8:	00000097          	auipc	ra,0x0
    800061ec:	868080e7          	jalr	-1944(ra) # 80005a50 <_Z11printStringPKc>
            break;
    800061f0:	f9dff06f          	j	8000618c <_Z8userMainv+0x74>
            testSleeping();
    800061f4:	00000097          	auipc	ra,0x0
    800061f8:	11c080e7          	jalr	284(ra) # 80006310 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    800061fc:	00003517          	auipc	a0,0x3
    80006200:	39450513          	addi	a0,a0,916 # 80009590 <CONSOLE_STATUS+0x580>
    80006204:	00000097          	auipc	ra,0x0
    80006208:	84c080e7          	jalr	-1972(ra) # 80005a50 <_Z11printStringPKc>
            break;
    8000620c:	f81ff06f          	j	8000618c <_Z8userMainv+0x74>
            testConsumerProducer();
    80006210:	ffffe097          	auipc	ra,0xffffe
    80006214:	258080e7          	jalr	600(ra) # 80004468 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    80006218:	00003517          	auipc	a0,0x3
    8000621c:	3a850513          	addi	a0,a0,936 # 800095c0 <CONSOLE_STATUS+0x5b0>
    80006220:	00000097          	auipc	ra,0x0
    80006224:	830080e7          	jalr	-2000(ra) # 80005a50 <_Z11printStringPKc>
            break;
    80006228:	f65ff06f          	j	8000618c <_Z8userMainv+0x74>
            System_Mode_test();
    8000622c:	00000097          	auipc	ra,0x0
    80006230:	658080e7          	jalr	1624(ra) # 80006884 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80006234:	00003517          	auipc	a0,0x3
    80006238:	3cc50513          	addi	a0,a0,972 # 80009600 <CONSOLE_STATUS+0x5f0>
    8000623c:	00000097          	auipc	ra,0x0
    80006240:	814080e7          	jalr	-2028(ra) # 80005a50 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80006244:	00003517          	auipc	a0,0x3
    80006248:	3dc50513          	addi	a0,a0,988 # 80009620 <CONSOLE_STATUS+0x610>
    8000624c:	00000097          	auipc	ra,0x0
    80006250:	804080e7          	jalr	-2044(ra) # 80005a50 <_Z11printStringPKc>
            break;
    80006254:	f39ff06f          	j	8000618c <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    80006258:	00003517          	auipc	a0,0x3
    8000625c:	42050513          	addi	a0,a0,1056 # 80009678 <CONSOLE_STATUS+0x668>
    80006260:	fffff097          	auipc	ra,0xfffff
    80006264:	7f0080e7          	jalr	2032(ra) # 80005a50 <_Z11printStringPKc>
    80006268:	f25ff06f          	j	8000618c <_Z8userMainv+0x74>

000000008000626c <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    8000626c:	fe010113          	addi	sp,sp,-32
    80006270:	00113c23          	sd	ra,24(sp)
    80006274:	00813823          	sd	s0,16(sp)
    80006278:	00913423          	sd	s1,8(sp)
    8000627c:	01213023          	sd	s2,0(sp)
    80006280:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    80006284:	00053903          	ld	s2,0(a0)
    int i = 6;
    80006288:	00600493          	li	s1,6
    while (--i > 0) {
    8000628c:	fff4849b          	addiw	s1,s1,-1
    80006290:	04905463          	blez	s1,800062d8 <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    80006294:	00003517          	auipc	a0,0x3
    80006298:	42c50513          	addi	a0,a0,1068 # 800096c0 <CONSOLE_STATUS+0x6b0>
    8000629c:	fffff097          	auipc	ra,0xfffff
    800062a0:	7b4080e7          	jalr	1972(ra) # 80005a50 <_Z11printStringPKc>
        printInt(sleep_time);
    800062a4:	00000613          	li	a2,0
    800062a8:	00a00593          	li	a1,10
    800062ac:	0009051b          	sext.w	a0,s2
    800062b0:	00000097          	auipc	ra,0x0
    800062b4:	950080e7          	jalr	-1712(ra) # 80005c00 <_Z8printIntiii>
        printString(" !\n");
    800062b8:	00003517          	auipc	a0,0x3
    800062bc:	41050513          	addi	a0,a0,1040 # 800096c8 <CONSOLE_STATUS+0x6b8>
    800062c0:	fffff097          	auipc	ra,0xfffff
    800062c4:	790080e7          	jalr	1936(ra) # 80005a50 <_Z11printStringPKc>
        time_sleep(sleep_time);
    800062c8:	00090513          	mv	a0,s2
    800062cc:	ffffb097          	auipc	ra,0xffffb
    800062d0:	1a4080e7          	jalr	420(ra) # 80001470 <_Z10time_sleepm>
    while (--i > 0) {
    800062d4:	fb9ff06f          	j	8000628c <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    800062d8:	00a00793          	li	a5,10
    800062dc:	02f95933          	divu	s2,s2,a5
    800062e0:	fff90913          	addi	s2,s2,-1
    800062e4:	00006797          	auipc	a5,0x6
    800062e8:	96c78793          	addi	a5,a5,-1684 # 8000bc50 <_ZL8finished>
    800062ec:	01278933          	add	s2,a5,s2
    800062f0:	00100793          	li	a5,1
    800062f4:	00f90023          	sb	a5,0(s2)
}
    800062f8:	01813083          	ld	ra,24(sp)
    800062fc:	01013403          	ld	s0,16(sp)
    80006300:	00813483          	ld	s1,8(sp)
    80006304:	00013903          	ld	s2,0(sp)
    80006308:	02010113          	addi	sp,sp,32
    8000630c:	00008067          	ret

0000000080006310 <_Z12testSleepingv>:

void testSleeping() {
    80006310:	fc010113          	addi	sp,sp,-64
    80006314:	02113c23          	sd	ra,56(sp)
    80006318:	02813823          	sd	s0,48(sp)
    8000631c:	02913423          	sd	s1,40(sp)
    80006320:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    80006324:	00a00793          	li	a5,10
    80006328:	fcf43823          	sd	a5,-48(s0)
    8000632c:	01400793          	li	a5,20
    80006330:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    80006334:	00000493          	li	s1,0
    80006338:	02c0006f          	j	80006364 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    8000633c:	00349793          	slli	a5,s1,0x3
    80006340:	fd040613          	addi	a2,s0,-48
    80006344:	00f60633          	add	a2,a2,a5
    80006348:	00000597          	auipc	a1,0x0
    8000634c:	f2458593          	addi	a1,a1,-220 # 8000626c <_ZL9sleepyRunPv>
    80006350:	fc040513          	addi	a0,s0,-64
    80006354:	00f50533          	add	a0,a0,a5
    80006358:	ffffb097          	auipc	ra,0xffffb
    8000635c:	028080e7          	jalr	40(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80006360:	0014849b          	addiw	s1,s1,1
    80006364:	00100793          	li	a5,1
    80006368:	fc97dae3          	bge	a5,s1,8000633c <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    8000636c:	00006797          	auipc	a5,0x6
    80006370:	8e47c783          	lbu	a5,-1820(a5) # 8000bc50 <_ZL8finished>
    80006374:	fe078ce3          	beqz	a5,8000636c <_Z12testSleepingv+0x5c>
    80006378:	00006797          	auipc	a5,0x6
    8000637c:	8d97c783          	lbu	a5,-1831(a5) # 8000bc51 <_ZL8finished+0x1>
    80006380:	fe0786e3          	beqz	a5,8000636c <_Z12testSleepingv+0x5c>
}
    80006384:	03813083          	ld	ra,56(sp)
    80006388:	03013403          	ld	s0,48(sp)
    8000638c:	02813483          	ld	s1,40(sp)
    80006390:	04010113          	addi	sp,sp,64
    80006394:	00008067          	ret

0000000080006398 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80006398:	fe010113          	addi	sp,sp,-32
    8000639c:	00113c23          	sd	ra,24(sp)
    800063a0:	00813823          	sd	s0,16(sp)
    800063a4:	00913423          	sd	s1,8(sp)
    800063a8:	01213023          	sd	s2,0(sp)
    800063ac:	02010413          	addi	s0,sp,32
    800063b0:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800063b4:	00100793          	li	a5,1
    800063b8:	02a7f863          	bgeu	a5,a0,800063e8 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800063bc:	00a00793          	li	a5,10
    800063c0:	02f577b3          	remu	a5,a0,a5
    800063c4:	02078e63          	beqz	a5,80006400 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800063c8:	fff48513          	addi	a0,s1,-1
    800063cc:	00000097          	auipc	ra,0x0
    800063d0:	fcc080e7          	jalr	-52(ra) # 80006398 <_ZL9fibonaccim>
    800063d4:	00050913          	mv	s2,a0
    800063d8:	ffe48513          	addi	a0,s1,-2
    800063dc:	00000097          	auipc	ra,0x0
    800063e0:	fbc080e7          	jalr	-68(ra) # 80006398 <_ZL9fibonaccim>
    800063e4:	00a90533          	add	a0,s2,a0
}
    800063e8:	01813083          	ld	ra,24(sp)
    800063ec:	01013403          	ld	s0,16(sp)
    800063f0:	00813483          	ld	s1,8(sp)
    800063f4:	00013903          	ld	s2,0(sp)
    800063f8:	02010113          	addi	sp,sp,32
    800063fc:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80006400:	ffffb097          	auipc	ra,0xffffb
    80006404:	028080e7          	jalr	40(ra) # 80001428 <_Z15thread_dispatchv>
    80006408:	fc1ff06f          	j	800063c8 <_ZL9fibonaccim+0x30>

000000008000640c <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    8000640c:	fe010113          	addi	sp,sp,-32
    80006410:	00113c23          	sd	ra,24(sp)
    80006414:	00813823          	sd	s0,16(sp)
    80006418:	00913423          	sd	s1,8(sp)
    8000641c:	01213023          	sd	s2,0(sp)
    80006420:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80006424:	00a00493          	li	s1,10
    80006428:	0400006f          	j	80006468 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000642c:	00003517          	auipc	a0,0x3
    80006430:	f6c50513          	addi	a0,a0,-148 # 80009398 <CONSOLE_STATUS+0x388>
    80006434:	fffff097          	auipc	ra,0xfffff
    80006438:	61c080e7          	jalr	1564(ra) # 80005a50 <_Z11printStringPKc>
    8000643c:	00000613          	li	a2,0
    80006440:	00a00593          	li	a1,10
    80006444:	00048513          	mv	a0,s1
    80006448:	fffff097          	auipc	ra,0xfffff
    8000644c:	7b8080e7          	jalr	1976(ra) # 80005c00 <_Z8printIntiii>
    80006450:	00003517          	auipc	a0,0x3
    80006454:	13850513          	addi	a0,a0,312 # 80009588 <CONSOLE_STATUS+0x578>
    80006458:	fffff097          	auipc	ra,0xfffff
    8000645c:	5f8080e7          	jalr	1528(ra) # 80005a50 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80006460:	0014849b          	addiw	s1,s1,1
    80006464:	0ff4f493          	andi	s1,s1,255
    80006468:	00c00793          	li	a5,12
    8000646c:	fc97f0e3          	bgeu	a5,s1,8000642c <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80006470:	00003517          	auipc	a0,0x3
    80006474:	f3050513          	addi	a0,a0,-208 # 800093a0 <CONSOLE_STATUS+0x390>
    80006478:	fffff097          	auipc	ra,0xfffff
    8000647c:	5d8080e7          	jalr	1496(ra) # 80005a50 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80006480:	00500313          	li	t1,5
    thread_dispatch();
    80006484:	ffffb097          	auipc	ra,0xffffb
    80006488:	fa4080e7          	jalr	-92(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    8000648c:	01000513          	li	a0,16
    80006490:	00000097          	auipc	ra,0x0
    80006494:	f08080e7          	jalr	-248(ra) # 80006398 <_ZL9fibonaccim>
    80006498:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    8000649c:	00003517          	auipc	a0,0x3
    800064a0:	f1450513          	addi	a0,a0,-236 # 800093b0 <CONSOLE_STATUS+0x3a0>
    800064a4:	fffff097          	auipc	ra,0xfffff
    800064a8:	5ac080e7          	jalr	1452(ra) # 80005a50 <_Z11printStringPKc>
    800064ac:	00000613          	li	a2,0
    800064b0:	00a00593          	li	a1,10
    800064b4:	0009051b          	sext.w	a0,s2
    800064b8:	fffff097          	auipc	ra,0xfffff
    800064bc:	748080e7          	jalr	1864(ra) # 80005c00 <_Z8printIntiii>
    800064c0:	00003517          	auipc	a0,0x3
    800064c4:	0c850513          	addi	a0,a0,200 # 80009588 <CONSOLE_STATUS+0x578>
    800064c8:	fffff097          	auipc	ra,0xfffff
    800064cc:	588080e7          	jalr	1416(ra) # 80005a50 <_Z11printStringPKc>
    800064d0:	0400006f          	j	80006510 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800064d4:	00003517          	auipc	a0,0x3
    800064d8:	ec450513          	addi	a0,a0,-316 # 80009398 <CONSOLE_STATUS+0x388>
    800064dc:	fffff097          	auipc	ra,0xfffff
    800064e0:	574080e7          	jalr	1396(ra) # 80005a50 <_Z11printStringPKc>
    800064e4:	00000613          	li	a2,0
    800064e8:	00a00593          	li	a1,10
    800064ec:	00048513          	mv	a0,s1
    800064f0:	fffff097          	auipc	ra,0xfffff
    800064f4:	710080e7          	jalr	1808(ra) # 80005c00 <_Z8printIntiii>
    800064f8:	00003517          	auipc	a0,0x3
    800064fc:	09050513          	addi	a0,a0,144 # 80009588 <CONSOLE_STATUS+0x578>
    80006500:	fffff097          	auipc	ra,0xfffff
    80006504:	550080e7          	jalr	1360(ra) # 80005a50 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80006508:	0014849b          	addiw	s1,s1,1
    8000650c:	0ff4f493          	andi	s1,s1,255
    80006510:	00f00793          	li	a5,15
    80006514:	fc97f0e3          	bgeu	a5,s1,800064d4 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80006518:	00003517          	auipc	a0,0x3
    8000651c:	ea850513          	addi	a0,a0,-344 # 800093c0 <CONSOLE_STATUS+0x3b0>
    80006520:	fffff097          	auipc	ra,0xfffff
    80006524:	530080e7          	jalr	1328(ra) # 80005a50 <_Z11printStringPKc>
    finishedD = true;
    80006528:	00100793          	li	a5,1
    8000652c:	00005717          	auipc	a4,0x5
    80006530:	72f70323          	sb	a5,1830(a4) # 8000bc52 <_ZL9finishedD>
    thread_dispatch();
    80006534:	ffffb097          	auipc	ra,0xffffb
    80006538:	ef4080e7          	jalr	-268(ra) # 80001428 <_Z15thread_dispatchv>
}
    8000653c:	01813083          	ld	ra,24(sp)
    80006540:	01013403          	ld	s0,16(sp)
    80006544:	00813483          	ld	s1,8(sp)
    80006548:	00013903          	ld	s2,0(sp)
    8000654c:	02010113          	addi	sp,sp,32
    80006550:	00008067          	ret

0000000080006554 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80006554:	fe010113          	addi	sp,sp,-32
    80006558:	00113c23          	sd	ra,24(sp)
    8000655c:	00813823          	sd	s0,16(sp)
    80006560:	00913423          	sd	s1,8(sp)
    80006564:	01213023          	sd	s2,0(sp)
    80006568:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    8000656c:	00000493          	li	s1,0
    80006570:	0400006f          	j	800065b0 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80006574:	00003517          	auipc	a0,0x3
    80006578:	df450513          	addi	a0,a0,-524 # 80009368 <CONSOLE_STATUS+0x358>
    8000657c:	fffff097          	auipc	ra,0xfffff
    80006580:	4d4080e7          	jalr	1236(ra) # 80005a50 <_Z11printStringPKc>
    80006584:	00000613          	li	a2,0
    80006588:	00a00593          	li	a1,10
    8000658c:	00048513          	mv	a0,s1
    80006590:	fffff097          	auipc	ra,0xfffff
    80006594:	670080e7          	jalr	1648(ra) # 80005c00 <_Z8printIntiii>
    80006598:	00003517          	auipc	a0,0x3
    8000659c:	ff050513          	addi	a0,a0,-16 # 80009588 <CONSOLE_STATUS+0x578>
    800065a0:	fffff097          	auipc	ra,0xfffff
    800065a4:	4b0080e7          	jalr	1200(ra) # 80005a50 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800065a8:	0014849b          	addiw	s1,s1,1
    800065ac:	0ff4f493          	andi	s1,s1,255
    800065b0:	00200793          	li	a5,2
    800065b4:	fc97f0e3          	bgeu	a5,s1,80006574 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    800065b8:	00003517          	auipc	a0,0x3
    800065bc:	db850513          	addi	a0,a0,-584 # 80009370 <CONSOLE_STATUS+0x360>
    800065c0:	fffff097          	auipc	ra,0xfffff
    800065c4:	490080e7          	jalr	1168(ra) # 80005a50 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800065c8:	00700313          	li	t1,7
    thread_dispatch();
    800065cc:	ffffb097          	auipc	ra,0xffffb
    800065d0:	e5c080e7          	jalr	-420(ra) # 80001428 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800065d4:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    800065d8:	00003517          	auipc	a0,0x3
    800065dc:	da850513          	addi	a0,a0,-600 # 80009380 <CONSOLE_STATUS+0x370>
    800065e0:	fffff097          	auipc	ra,0xfffff
    800065e4:	470080e7          	jalr	1136(ra) # 80005a50 <_Z11printStringPKc>
    800065e8:	00000613          	li	a2,0
    800065ec:	00a00593          	li	a1,10
    800065f0:	0009051b          	sext.w	a0,s2
    800065f4:	fffff097          	auipc	ra,0xfffff
    800065f8:	60c080e7          	jalr	1548(ra) # 80005c00 <_Z8printIntiii>
    800065fc:	00003517          	auipc	a0,0x3
    80006600:	f8c50513          	addi	a0,a0,-116 # 80009588 <CONSOLE_STATUS+0x578>
    80006604:	fffff097          	auipc	ra,0xfffff
    80006608:	44c080e7          	jalr	1100(ra) # 80005a50 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    8000660c:	00c00513          	li	a0,12
    80006610:	00000097          	auipc	ra,0x0
    80006614:	d88080e7          	jalr	-632(ra) # 80006398 <_ZL9fibonaccim>
    80006618:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    8000661c:	00003517          	auipc	a0,0x3
    80006620:	d6c50513          	addi	a0,a0,-660 # 80009388 <CONSOLE_STATUS+0x378>
    80006624:	fffff097          	auipc	ra,0xfffff
    80006628:	42c080e7          	jalr	1068(ra) # 80005a50 <_Z11printStringPKc>
    8000662c:	00000613          	li	a2,0
    80006630:	00a00593          	li	a1,10
    80006634:	0009051b          	sext.w	a0,s2
    80006638:	fffff097          	auipc	ra,0xfffff
    8000663c:	5c8080e7          	jalr	1480(ra) # 80005c00 <_Z8printIntiii>
    80006640:	00003517          	auipc	a0,0x3
    80006644:	f4850513          	addi	a0,a0,-184 # 80009588 <CONSOLE_STATUS+0x578>
    80006648:	fffff097          	auipc	ra,0xfffff
    8000664c:	408080e7          	jalr	1032(ra) # 80005a50 <_Z11printStringPKc>
    80006650:	0400006f          	j	80006690 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80006654:	00003517          	auipc	a0,0x3
    80006658:	d1450513          	addi	a0,a0,-748 # 80009368 <CONSOLE_STATUS+0x358>
    8000665c:	fffff097          	auipc	ra,0xfffff
    80006660:	3f4080e7          	jalr	1012(ra) # 80005a50 <_Z11printStringPKc>
    80006664:	00000613          	li	a2,0
    80006668:	00a00593          	li	a1,10
    8000666c:	00048513          	mv	a0,s1
    80006670:	fffff097          	auipc	ra,0xfffff
    80006674:	590080e7          	jalr	1424(ra) # 80005c00 <_Z8printIntiii>
    80006678:	00003517          	auipc	a0,0x3
    8000667c:	f1050513          	addi	a0,a0,-240 # 80009588 <CONSOLE_STATUS+0x578>
    80006680:	fffff097          	auipc	ra,0xfffff
    80006684:	3d0080e7          	jalr	976(ra) # 80005a50 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80006688:	0014849b          	addiw	s1,s1,1
    8000668c:	0ff4f493          	andi	s1,s1,255
    80006690:	00500793          	li	a5,5
    80006694:	fc97f0e3          	bgeu	a5,s1,80006654 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80006698:	00003517          	auipc	a0,0x3
    8000669c:	ca850513          	addi	a0,a0,-856 # 80009340 <CONSOLE_STATUS+0x330>
    800066a0:	fffff097          	auipc	ra,0xfffff
    800066a4:	3b0080e7          	jalr	944(ra) # 80005a50 <_Z11printStringPKc>
    finishedC = true;
    800066a8:	00100793          	li	a5,1
    800066ac:	00005717          	auipc	a4,0x5
    800066b0:	5af703a3          	sb	a5,1447(a4) # 8000bc53 <_ZL9finishedC>
    thread_dispatch();
    800066b4:	ffffb097          	auipc	ra,0xffffb
    800066b8:	d74080e7          	jalr	-652(ra) # 80001428 <_Z15thread_dispatchv>
}
    800066bc:	01813083          	ld	ra,24(sp)
    800066c0:	01013403          	ld	s0,16(sp)
    800066c4:	00813483          	ld	s1,8(sp)
    800066c8:	00013903          	ld	s2,0(sp)
    800066cc:	02010113          	addi	sp,sp,32
    800066d0:	00008067          	ret

00000000800066d4 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    800066d4:	fe010113          	addi	sp,sp,-32
    800066d8:	00113c23          	sd	ra,24(sp)
    800066dc:	00813823          	sd	s0,16(sp)
    800066e0:	00913423          	sd	s1,8(sp)
    800066e4:	01213023          	sd	s2,0(sp)
    800066e8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800066ec:	00000913          	li	s2,0
    800066f0:	0400006f          	j	80006730 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    800066f4:	ffffb097          	auipc	ra,0xffffb
    800066f8:	d34080e7          	jalr	-716(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800066fc:	00148493          	addi	s1,s1,1
    80006700:	000027b7          	lui	a5,0x2
    80006704:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006708:	0097ee63          	bltu	a5,s1,80006724 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    8000670c:	00000713          	li	a4,0
    80006710:	000077b7          	lui	a5,0x7
    80006714:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006718:	fce7eee3          	bltu	a5,a4,800066f4 <_ZL11workerBodyBPv+0x20>
    8000671c:	00170713          	addi	a4,a4,1
    80006720:	ff1ff06f          	j	80006710 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    80006724:	00a00793          	li	a5,10
    80006728:	04f90663          	beq	s2,a5,80006774 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    8000672c:	00190913          	addi	s2,s2,1
    80006730:	00f00793          	li	a5,15
    80006734:	0527e463          	bltu	a5,s2,8000677c <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80006738:	00003517          	auipc	a0,0x3
    8000673c:	c1850513          	addi	a0,a0,-1000 # 80009350 <CONSOLE_STATUS+0x340>
    80006740:	fffff097          	auipc	ra,0xfffff
    80006744:	310080e7          	jalr	784(ra) # 80005a50 <_Z11printStringPKc>
    80006748:	00000613          	li	a2,0
    8000674c:	00a00593          	li	a1,10
    80006750:	0009051b          	sext.w	a0,s2
    80006754:	fffff097          	auipc	ra,0xfffff
    80006758:	4ac080e7          	jalr	1196(ra) # 80005c00 <_Z8printIntiii>
    8000675c:	00003517          	auipc	a0,0x3
    80006760:	e2c50513          	addi	a0,a0,-468 # 80009588 <CONSOLE_STATUS+0x578>
    80006764:	fffff097          	auipc	ra,0xfffff
    80006768:	2ec080e7          	jalr	748(ra) # 80005a50 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    8000676c:	00000493          	li	s1,0
    80006770:	f91ff06f          	j	80006700 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    80006774:	14102ff3          	csrr	t6,sepc
    80006778:	fb5ff06f          	j	8000672c <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    8000677c:	00003517          	auipc	a0,0x3
    80006780:	bdc50513          	addi	a0,a0,-1060 # 80009358 <CONSOLE_STATUS+0x348>
    80006784:	fffff097          	auipc	ra,0xfffff
    80006788:	2cc080e7          	jalr	716(ra) # 80005a50 <_Z11printStringPKc>
    finishedB = true;
    8000678c:	00100793          	li	a5,1
    80006790:	00005717          	auipc	a4,0x5
    80006794:	4cf70223          	sb	a5,1220(a4) # 8000bc54 <_ZL9finishedB>
    thread_dispatch();
    80006798:	ffffb097          	auipc	ra,0xffffb
    8000679c:	c90080e7          	jalr	-880(ra) # 80001428 <_Z15thread_dispatchv>
}
    800067a0:	01813083          	ld	ra,24(sp)
    800067a4:	01013403          	ld	s0,16(sp)
    800067a8:	00813483          	ld	s1,8(sp)
    800067ac:	00013903          	ld	s2,0(sp)
    800067b0:	02010113          	addi	sp,sp,32
    800067b4:	00008067          	ret

00000000800067b8 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    800067b8:	fe010113          	addi	sp,sp,-32
    800067bc:	00113c23          	sd	ra,24(sp)
    800067c0:	00813823          	sd	s0,16(sp)
    800067c4:	00913423          	sd	s1,8(sp)
    800067c8:	01213023          	sd	s2,0(sp)
    800067cc:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800067d0:	00000913          	li	s2,0
    800067d4:	0380006f          	j	8000680c <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    800067d8:	ffffb097          	auipc	ra,0xffffb
    800067dc:	c50080e7          	jalr	-944(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800067e0:	00148493          	addi	s1,s1,1
    800067e4:	000027b7          	lui	a5,0x2
    800067e8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800067ec:	0097ee63          	bltu	a5,s1,80006808 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800067f0:	00000713          	li	a4,0
    800067f4:	000077b7          	lui	a5,0x7
    800067f8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800067fc:	fce7eee3          	bltu	a5,a4,800067d8 <_ZL11workerBodyAPv+0x20>
    80006800:	00170713          	addi	a4,a4,1
    80006804:	ff1ff06f          	j	800067f4 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80006808:	00190913          	addi	s2,s2,1
    8000680c:	00900793          	li	a5,9
    80006810:	0527e063          	bltu	a5,s2,80006850 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80006814:	00003517          	auipc	a0,0x3
    80006818:	b2450513          	addi	a0,a0,-1244 # 80009338 <CONSOLE_STATUS+0x328>
    8000681c:	fffff097          	auipc	ra,0xfffff
    80006820:	234080e7          	jalr	564(ra) # 80005a50 <_Z11printStringPKc>
    80006824:	00000613          	li	a2,0
    80006828:	00a00593          	li	a1,10
    8000682c:	0009051b          	sext.w	a0,s2
    80006830:	fffff097          	auipc	ra,0xfffff
    80006834:	3d0080e7          	jalr	976(ra) # 80005c00 <_Z8printIntiii>
    80006838:	00003517          	auipc	a0,0x3
    8000683c:	d5050513          	addi	a0,a0,-688 # 80009588 <CONSOLE_STATUS+0x578>
    80006840:	fffff097          	auipc	ra,0xfffff
    80006844:	210080e7          	jalr	528(ra) # 80005a50 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006848:	00000493          	li	s1,0
    8000684c:	f99ff06f          	j	800067e4 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80006850:	00003517          	auipc	a0,0x3
    80006854:	af050513          	addi	a0,a0,-1296 # 80009340 <CONSOLE_STATUS+0x330>
    80006858:	fffff097          	auipc	ra,0xfffff
    8000685c:	1f8080e7          	jalr	504(ra) # 80005a50 <_Z11printStringPKc>
    finishedA = true;
    80006860:	00100793          	li	a5,1
    80006864:	00005717          	auipc	a4,0x5
    80006868:	3ef708a3          	sb	a5,1009(a4) # 8000bc55 <_ZL9finishedA>
}
    8000686c:	01813083          	ld	ra,24(sp)
    80006870:	01013403          	ld	s0,16(sp)
    80006874:	00813483          	ld	s1,8(sp)
    80006878:	00013903          	ld	s2,0(sp)
    8000687c:	02010113          	addi	sp,sp,32
    80006880:	00008067          	ret

0000000080006884 <_Z16System_Mode_testv>:


void System_Mode_test() {
    80006884:	fd010113          	addi	sp,sp,-48
    80006888:	02113423          	sd	ra,40(sp)
    8000688c:	02813023          	sd	s0,32(sp)
    80006890:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80006894:	00000613          	li	a2,0
    80006898:	00000597          	auipc	a1,0x0
    8000689c:	f2058593          	addi	a1,a1,-224 # 800067b8 <_ZL11workerBodyAPv>
    800068a0:	fd040513          	addi	a0,s0,-48
    800068a4:	ffffb097          	auipc	ra,0xffffb
    800068a8:	adc080e7          	jalr	-1316(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    800068ac:	00003517          	auipc	a0,0x3
    800068b0:	b2450513          	addi	a0,a0,-1244 # 800093d0 <CONSOLE_STATUS+0x3c0>
    800068b4:	fffff097          	auipc	ra,0xfffff
    800068b8:	19c080e7          	jalr	412(ra) # 80005a50 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    800068bc:	00000613          	li	a2,0
    800068c0:	00000597          	auipc	a1,0x0
    800068c4:	e1458593          	addi	a1,a1,-492 # 800066d4 <_ZL11workerBodyBPv>
    800068c8:	fd840513          	addi	a0,s0,-40
    800068cc:	ffffb097          	auipc	ra,0xffffb
    800068d0:	ab4080e7          	jalr	-1356(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    800068d4:	00003517          	auipc	a0,0x3
    800068d8:	b1450513          	addi	a0,a0,-1260 # 800093e8 <CONSOLE_STATUS+0x3d8>
    800068dc:	fffff097          	auipc	ra,0xfffff
    800068e0:	174080e7          	jalr	372(ra) # 80005a50 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    800068e4:	00000613          	li	a2,0
    800068e8:	00000597          	auipc	a1,0x0
    800068ec:	c6c58593          	addi	a1,a1,-916 # 80006554 <_ZL11workerBodyCPv>
    800068f0:	fe040513          	addi	a0,s0,-32
    800068f4:	ffffb097          	auipc	ra,0xffffb
    800068f8:	a8c080e7          	jalr	-1396(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    800068fc:	00003517          	auipc	a0,0x3
    80006900:	b0450513          	addi	a0,a0,-1276 # 80009400 <CONSOLE_STATUS+0x3f0>
    80006904:	fffff097          	auipc	ra,0xfffff
    80006908:	14c080e7          	jalr	332(ra) # 80005a50 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    8000690c:	00000613          	li	a2,0
    80006910:	00000597          	auipc	a1,0x0
    80006914:	afc58593          	addi	a1,a1,-1284 # 8000640c <_ZL11workerBodyDPv>
    80006918:	fe840513          	addi	a0,s0,-24
    8000691c:	ffffb097          	auipc	ra,0xffffb
    80006920:	a64080e7          	jalr	-1436(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80006924:	00003517          	auipc	a0,0x3
    80006928:	af450513          	addi	a0,a0,-1292 # 80009418 <CONSOLE_STATUS+0x408>
    8000692c:	fffff097          	auipc	ra,0xfffff
    80006930:	124080e7          	jalr	292(ra) # 80005a50 <_Z11printStringPKc>
    80006934:	00c0006f          	j	80006940 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006938:	ffffb097          	auipc	ra,0xffffb
    8000693c:	af0080e7          	jalr	-1296(ra) # 80001428 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006940:	00005797          	auipc	a5,0x5
    80006944:	3157c783          	lbu	a5,789(a5) # 8000bc55 <_ZL9finishedA>
    80006948:	fe0788e3          	beqz	a5,80006938 <_Z16System_Mode_testv+0xb4>
    8000694c:	00005797          	auipc	a5,0x5
    80006950:	3087c783          	lbu	a5,776(a5) # 8000bc54 <_ZL9finishedB>
    80006954:	fe0782e3          	beqz	a5,80006938 <_Z16System_Mode_testv+0xb4>
    80006958:	00005797          	auipc	a5,0x5
    8000695c:	2fb7c783          	lbu	a5,763(a5) # 8000bc53 <_ZL9finishedC>
    80006960:	fc078ce3          	beqz	a5,80006938 <_Z16System_Mode_testv+0xb4>
    80006964:	00005797          	auipc	a5,0x5
    80006968:	2ee7c783          	lbu	a5,750(a5) # 8000bc52 <_ZL9finishedD>
    8000696c:	fc0786e3          	beqz	a5,80006938 <_Z16System_Mode_testv+0xb4>
    }

}
    80006970:	02813083          	ld	ra,40(sp)
    80006974:	02013403          	ld	s0,32(sp)
    80006978:	03010113          	addi	sp,sp,48
    8000697c:	00008067          	ret

0000000080006980 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006980:	fe010113          	addi	sp,sp,-32
    80006984:	00113c23          	sd	ra,24(sp)
    80006988:	00813823          	sd	s0,16(sp)
    8000698c:	00913423          	sd	s1,8(sp)
    80006990:	01213023          	sd	s2,0(sp)
    80006994:	02010413          	addi	s0,sp,32
    80006998:	00050493          	mv	s1,a0
    8000699c:	00058913          	mv	s2,a1
    800069a0:	0015879b          	addiw	a5,a1,1
    800069a4:	0007851b          	sext.w	a0,a5
    800069a8:	00f4a023          	sw	a5,0(s1)
    800069ac:	0004a823          	sw	zero,16(s1)
    800069b0:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    800069b4:	00251513          	slli	a0,a0,0x2
    800069b8:	ffffb097          	auipc	ra,0xffffb
    800069bc:	958080e7          	jalr	-1704(ra) # 80001310 <_Z9mem_allocm>
    800069c0:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    800069c4:	00000593          	li	a1,0
    800069c8:	02048513          	addi	a0,s1,32
    800069cc:	ffffb097          	auipc	ra,0xffffb
    800069d0:	ad4080e7          	jalr	-1324(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&spaceAvailable, _cap);
    800069d4:	00090593          	mv	a1,s2
    800069d8:	01848513          	addi	a0,s1,24
    800069dc:	ffffb097          	auipc	ra,0xffffb
    800069e0:	ac4080e7          	jalr	-1340(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&mutexHead, 1);
    800069e4:	00100593          	li	a1,1
    800069e8:	02848513          	addi	a0,s1,40
    800069ec:	ffffb097          	auipc	ra,0xffffb
    800069f0:	ab4080e7          	jalr	-1356(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&mutexTail, 1);
    800069f4:	00100593          	li	a1,1
    800069f8:	03048513          	addi	a0,s1,48
    800069fc:	ffffb097          	auipc	ra,0xffffb
    80006a00:	aa4080e7          	jalr	-1372(ra) # 800014a0 <_Z8sem_openPP4KSemj>
}
    80006a04:	01813083          	ld	ra,24(sp)
    80006a08:	01013403          	ld	s0,16(sp)
    80006a0c:	00813483          	ld	s1,8(sp)
    80006a10:	00013903          	ld	s2,0(sp)
    80006a14:	02010113          	addi	sp,sp,32
    80006a18:	00008067          	ret

0000000080006a1c <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80006a1c:	fe010113          	addi	sp,sp,-32
    80006a20:	00113c23          	sd	ra,24(sp)
    80006a24:	00813823          	sd	s0,16(sp)
    80006a28:	00913423          	sd	s1,8(sp)
    80006a2c:	01213023          	sd	s2,0(sp)
    80006a30:	02010413          	addi	s0,sp,32
    80006a34:	00050493          	mv	s1,a0
    80006a38:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80006a3c:	01853503          	ld	a0,24(a0)
    80006a40:	ffffb097          	auipc	ra,0xffffb
    80006a44:	ac8080e7          	jalr	-1336(ra) # 80001508 <_Z8sem_waitP4KSem>

    sem_wait(mutexTail);
    80006a48:	0304b503          	ld	a0,48(s1)
    80006a4c:	ffffb097          	auipc	ra,0xffffb
    80006a50:	abc080e7          	jalr	-1348(ra) # 80001508 <_Z8sem_waitP4KSem>
    buffer[tail] = val;
    80006a54:	0084b783          	ld	a5,8(s1)
    80006a58:	0144a703          	lw	a4,20(s1)
    80006a5c:	00271713          	slli	a4,a4,0x2
    80006a60:	00e787b3          	add	a5,a5,a4
    80006a64:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006a68:	0144a783          	lw	a5,20(s1)
    80006a6c:	0017879b          	addiw	a5,a5,1
    80006a70:	0004a703          	lw	a4,0(s1)
    80006a74:	02e7e7bb          	remw	a5,a5,a4
    80006a78:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80006a7c:	0304b503          	ld	a0,48(s1)
    80006a80:	ffffb097          	auipc	ra,0xffffb
    80006a84:	ab8080e7          	jalr	-1352(ra) # 80001538 <_Z10sem_signalP4KSem>

    sem_signal(itemAvailable);
    80006a88:	0204b503          	ld	a0,32(s1)
    80006a8c:	ffffb097          	auipc	ra,0xffffb
    80006a90:	aac080e7          	jalr	-1364(ra) # 80001538 <_Z10sem_signalP4KSem>

}
    80006a94:	01813083          	ld	ra,24(sp)
    80006a98:	01013403          	ld	s0,16(sp)
    80006a9c:	00813483          	ld	s1,8(sp)
    80006aa0:	00013903          	ld	s2,0(sp)
    80006aa4:	02010113          	addi	sp,sp,32
    80006aa8:	00008067          	ret

0000000080006aac <_ZN6Buffer3getEv>:

int Buffer::get() {
    80006aac:	fe010113          	addi	sp,sp,-32
    80006ab0:	00113c23          	sd	ra,24(sp)
    80006ab4:	00813823          	sd	s0,16(sp)
    80006ab8:	00913423          	sd	s1,8(sp)
    80006abc:	01213023          	sd	s2,0(sp)
    80006ac0:	02010413          	addi	s0,sp,32
    80006ac4:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80006ac8:	02053503          	ld	a0,32(a0)
    80006acc:	ffffb097          	auipc	ra,0xffffb
    80006ad0:	a3c080e7          	jalr	-1476(ra) # 80001508 <_Z8sem_waitP4KSem>

    sem_wait(mutexHead);
    80006ad4:	0284b503          	ld	a0,40(s1)
    80006ad8:	ffffb097          	auipc	ra,0xffffb
    80006adc:	a30080e7          	jalr	-1488(ra) # 80001508 <_Z8sem_waitP4KSem>

    int ret = buffer[head];
    80006ae0:	0084b703          	ld	a4,8(s1)
    80006ae4:	0104a783          	lw	a5,16(s1)
    80006ae8:	00279693          	slli	a3,a5,0x2
    80006aec:	00d70733          	add	a4,a4,a3
    80006af0:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006af4:	0017879b          	addiw	a5,a5,1
    80006af8:	0004a703          	lw	a4,0(s1)
    80006afc:	02e7e7bb          	remw	a5,a5,a4
    80006b00:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80006b04:	0284b503          	ld	a0,40(s1)
    80006b08:	ffffb097          	auipc	ra,0xffffb
    80006b0c:	a30080e7          	jalr	-1488(ra) # 80001538 <_Z10sem_signalP4KSem>

    sem_signal(spaceAvailable);
    80006b10:	0184b503          	ld	a0,24(s1)
    80006b14:	ffffb097          	auipc	ra,0xffffb
    80006b18:	a24080e7          	jalr	-1500(ra) # 80001538 <_Z10sem_signalP4KSem>

    return ret;
}
    80006b1c:	00090513          	mv	a0,s2
    80006b20:	01813083          	ld	ra,24(sp)
    80006b24:	01013403          	ld	s0,16(sp)
    80006b28:	00813483          	ld	s1,8(sp)
    80006b2c:	00013903          	ld	s2,0(sp)
    80006b30:	02010113          	addi	sp,sp,32
    80006b34:	00008067          	ret

0000000080006b38 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80006b38:	fe010113          	addi	sp,sp,-32
    80006b3c:	00113c23          	sd	ra,24(sp)
    80006b40:	00813823          	sd	s0,16(sp)
    80006b44:	00913423          	sd	s1,8(sp)
    80006b48:	01213023          	sd	s2,0(sp)
    80006b4c:	02010413          	addi	s0,sp,32
    80006b50:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80006b54:	02853503          	ld	a0,40(a0)
    80006b58:	ffffb097          	auipc	ra,0xffffb
    80006b5c:	9b0080e7          	jalr	-1616(ra) # 80001508 <_Z8sem_waitP4KSem>
    sem_wait(mutexTail);
    80006b60:	0304b503          	ld	a0,48(s1)
    80006b64:	ffffb097          	auipc	ra,0xffffb
    80006b68:	9a4080e7          	jalr	-1628(ra) # 80001508 <_Z8sem_waitP4KSem>

    if (tail >= head) {
    80006b6c:	0144a783          	lw	a5,20(s1)
    80006b70:	0104a903          	lw	s2,16(s1)
    80006b74:	0327ce63          	blt	a5,s2,80006bb0 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80006b78:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80006b7c:	0304b503          	ld	a0,48(s1)
    80006b80:	ffffb097          	auipc	ra,0xffffb
    80006b84:	9b8080e7          	jalr	-1608(ra) # 80001538 <_Z10sem_signalP4KSem>
    sem_signal(mutexHead);
    80006b88:	0284b503          	ld	a0,40(s1)
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
        ret = cap - head + tail;
    80006bb0:	0004a703          	lw	a4,0(s1)
    80006bb4:	4127093b          	subw	s2,a4,s2
    80006bb8:	00f9093b          	addw	s2,s2,a5
    80006bbc:	fc1ff06f          	j	80006b7c <_ZN6Buffer6getCntEv+0x44>

0000000080006bc0 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80006bc0:	fe010113          	addi	sp,sp,-32
    80006bc4:	00113c23          	sd	ra,24(sp)
    80006bc8:	00813823          	sd	s0,16(sp)
    80006bcc:	00913423          	sd	s1,8(sp)
    80006bd0:	02010413          	addi	s0,sp,32
    80006bd4:	00050493          	mv	s1,a0
    putc('\n');
    80006bd8:	00a00513          	li	a0,10
    80006bdc:	ffffb097          	auipc	ra,0xffffb
    80006be0:	9b4080e7          	jalr	-1612(ra) # 80001590 <_Z4putcc>
    printString("Buffer deleted!\n");
    80006be4:	00003517          	auipc	a0,0x3
    80006be8:	84c50513          	addi	a0,a0,-1972 # 80009430 <CONSOLE_STATUS+0x420>
    80006bec:	fffff097          	auipc	ra,0xfffff
    80006bf0:	e64080e7          	jalr	-412(ra) # 80005a50 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80006bf4:	00048513          	mv	a0,s1
    80006bf8:	00000097          	auipc	ra,0x0
    80006bfc:	f40080e7          	jalr	-192(ra) # 80006b38 <_ZN6Buffer6getCntEv>
    80006c00:	02a05c63          	blez	a0,80006c38 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80006c04:	0084b783          	ld	a5,8(s1)
    80006c08:	0104a703          	lw	a4,16(s1)
    80006c0c:	00271713          	slli	a4,a4,0x2
    80006c10:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80006c14:	0007c503          	lbu	a0,0(a5)
    80006c18:	ffffb097          	auipc	ra,0xffffb
    80006c1c:	978080e7          	jalr	-1672(ra) # 80001590 <_Z4putcc>
        head = (head + 1) % cap;
    80006c20:	0104a783          	lw	a5,16(s1)
    80006c24:	0017879b          	addiw	a5,a5,1
    80006c28:	0004a703          	lw	a4,0(s1)
    80006c2c:	02e7e7bb          	remw	a5,a5,a4
    80006c30:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80006c34:	fc1ff06f          	j	80006bf4 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80006c38:	02100513          	li	a0,33
    80006c3c:	ffffb097          	auipc	ra,0xffffb
    80006c40:	954080e7          	jalr	-1708(ra) # 80001590 <_Z4putcc>
    putc('\n');
    80006c44:	00a00513          	li	a0,10
    80006c48:	ffffb097          	auipc	ra,0xffffb
    80006c4c:	948080e7          	jalr	-1720(ra) # 80001590 <_Z4putcc>
    mem_free(buffer);
    80006c50:	0084b503          	ld	a0,8(s1)
    80006c54:	ffffa097          	auipc	ra,0xffffa
    80006c58:	6fc080e7          	jalr	1788(ra) # 80001350 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80006c5c:	0204b503          	ld	a0,32(s1)
    80006c60:	ffffb097          	auipc	ra,0xffffb
    80006c64:	878080e7          	jalr	-1928(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(spaceAvailable);
    80006c68:	0184b503          	ld	a0,24(s1)
    80006c6c:	ffffb097          	auipc	ra,0xffffb
    80006c70:	86c080e7          	jalr	-1940(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(mutexTail);
    80006c74:	0304b503          	ld	a0,48(s1)
    80006c78:	ffffb097          	auipc	ra,0xffffb
    80006c7c:	860080e7          	jalr	-1952(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(mutexHead);
    80006c80:	0284b503          	ld	a0,40(s1)
    80006c84:	ffffb097          	auipc	ra,0xffffb
    80006c88:	854080e7          	jalr	-1964(ra) # 800014d8 <_Z9sem_closeP4KSem>
}
    80006c8c:	01813083          	ld	ra,24(sp)
    80006c90:	01013403          	ld	s0,16(sp)
    80006c94:	00813483          	ld	s1,8(sp)
    80006c98:	02010113          	addi	sp,sp,32
    80006c9c:	00008067          	ret

0000000080006ca0 <start>:
    80006ca0:	ff010113          	addi	sp,sp,-16
    80006ca4:	00813423          	sd	s0,8(sp)
    80006ca8:	01010413          	addi	s0,sp,16
    80006cac:	300027f3          	csrr	a5,mstatus
    80006cb0:	ffffe737          	lui	a4,0xffffe
    80006cb4:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff193f>
    80006cb8:	00e7f7b3          	and	a5,a5,a4
    80006cbc:	00001737          	lui	a4,0x1
    80006cc0:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80006cc4:	00e7e7b3          	or	a5,a5,a4
    80006cc8:	30079073          	csrw	mstatus,a5
    80006ccc:	00000797          	auipc	a5,0x0
    80006cd0:	16078793          	addi	a5,a5,352 # 80006e2c <system_main>
    80006cd4:	34179073          	csrw	mepc,a5
    80006cd8:	00000793          	li	a5,0
    80006cdc:	18079073          	csrw	satp,a5
    80006ce0:	000107b7          	lui	a5,0x10
    80006ce4:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80006ce8:	30279073          	csrw	medeleg,a5
    80006cec:	30379073          	csrw	mideleg,a5
    80006cf0:	104027f3          	csrr	a5,sie
    80006cf4:	2227e793          	ori	a5,a5,546
    80006cf8:	10479073          	csrw	sie,a5
    80006cfc:	fff00793          	li	a5,-1
    80006d00:	00a7d793          	srli	a5,a5,0xa
    80006d04:	3b079073          	csrw	pmpaddr0,a5
    80006d08:	00f00793          	li	a5,15
    80006d0c:	3a079073          	csrw	pmpcfg0,a5
    80006d10:	f14027f3          	csrr	a5,mhartid
    80006d14:	0200c737          	lui	a4,0x200c
    80006d18:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80006d1c:	0007869b          	sext.w	a3,a5
    80006d20:	00269713          	slli	a4,a3,0x2
    80006d24:	000f4637          	lui	a2,0xf4
    80006d28:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80006d2c:	00d70733          	add	a4,a4,a3
    80006d30:	0037979b          	slliw	a5,a5,0x3
    80006d34:	020046b7          	lui	a3,0x2004
    80006d38:	00d787b3          	add	a5,a5,a3
    80006d3c:	00c585b3          	add	a1,a1,a2
    80006d40:	00371693          	slli	a3,a4,0x3
    80006d44:	00005717          	auipc	a4,0x5
    80006d48:	f1c70713          	addi	a4,a4,-228 # 8000bc60 <timer_scratch>
    80006d4c:	00b7b023          	sd	a1,0(a5)
    80006d50:	00d70733          	add	a4,a4,a3
    80006d54:	00f73c23          	sd	a5,24(a4)
    80006d58:	02c73023          	sd	a2,32(a4)
    80006d5c:	34071073          	csrw	mscratch,a4
    80006d60:	00000797          	auipc	a5,0x0
    80006d64:	6e078793          	addi	a5,a5,1760 # 80007440 <timervec>
    80006d68:	30579073          	csrw	mtvec,a5
    80006d6c:	300027f3          	csrr	a5,mstatus
    80006d70:	0087e793          	ori	a5,a5,8
    80006d74:	30079073          	csrw	mstatus,a5
    80006d78:	304027f3          	csrr	a5,mie
    80006d7c:	0807e793          	ori	a5,a5,128
    80006d80:	30479073          	csrw	mie,a5
    80006d84:	f14027f3          	csrr	a5,mhartid
    80006d88:	0007879b          	sext.w	a5,a5
    80006d8c:	00078213          	mv	tp,a5
    80006d90:	30200073          	mret
    80006d94:	00813403          	ld	s0,8(sp)
    80006d98:	01010113          	addi	sp,sp,16
    80006d9c:	00008067          	ret

0000000080006da0 <timerinit>:
    80006da0:	ff010113          	addi	sp,sp,-16
    80006da4:	00813423          	sd	s0,8(sp)
    80006da8:	01010413          	addi	s0,sp,16
    80006dac:	f14027f3          	csrr	a5,mhartid
    80006db0:	0200c737          	lui	a4,0x200c
    80006db4:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80006db8:	0007869b          	sext.w	a3,a5
    80006dbc:	00269713          	slli	a4,a3,0x2
    80006dc0:	000f4637          	lui	a2,0xf4
    80006dc4:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80006dc8:	00d70733          	add	a4,a4,a3
    80006dcc:	0037979b          	slliw	a5,a5,0x3
    80006dd0:	020046b7          	lui	a3,0x2004
    80006dd4:	00d787b3          	add	a5,a5,a3
    80006dd8:	00c585b3          	add	a1,a1,a2
    80006ddc:	00371693          	slli	a3,a4,0x3
    80006de0:	00005717          	auipc	a4,0x5
    80006de4:	e8070713          	addi	a4,a4,-384 # 8000bc60 <timer_scratch>
    80006de8:	00b7b023          	sd	a1,0(a5)
    80006dec:	00d70733          	add	a4,a4,a3
    80006df0:	00f73c23          	sd	a5,24(a4)
    80006df4:	02c73023          	sd	a2,32(a4)
    80006df8:	34071073          	csrw	mscratch,a4
    80006dfc:	00000797          	auipc	a5,0x0
    80006e00:	64478793          	addi	a5,a5,1604 # 80007440 <timervec>
    80006e04:	30579073          	csrw	mtvec,a5
    80006e08:	300027f3          	csrr	a5,mstatus
    80006e0c:	0087e793          	ori	a5,a5,8
    80006e10:	30079073          	csrw	mstatus,a5
    80006e14:	304027f3          	csrr	a5,mie
    80006e18:	0807e793          	ori	a5,a5,128
    80006e1c:	30479073          	csrw	mie,a5
    80006e20:	00813403          	ld	s0,8(sp)
    80006e24:	01010113          	addi	sp,sp,16
    80006e28:	00008067          	ret

0000000080006e2c <system_main>:
    80006e2c:	fe010113          	addi	sp,sp,-32
    80006e30:	00813823          	sd	s0,16(sp)
    80006e34:	00913423          	sd	s1,8(sp)
    80006e38:	00113c23          	sd	ra,24(sp)
    80006e3c:	02010413          	addi	s0,sp,32
    80006e40:	00000097          	auipc	ra,0x0
    80006e44:	0c4080e7          	jalr	196(ra) # 80006f04 <cpuid>
    80006e48:	00005497          	auipc	s1,0x5
    80006e4c:	cb848493          	addi	s1,s1,-840 # 8000bb00 <started>
    80006e50:	02050263          	beqz	a0,80006e74 <system_main+0x48>
    80006e54:	0004a783          	lw	a5,0(s1)
    80006e58:	0007879b          	sext.w	a5,a5
    80006e5c:	fe078ce3          	beqz	a5,80006e54 <system_main+0x28>
    80006e60:	0ff0000f          	fence
    80006e64:	00003517          	auipc	a0,0x3
    80006e68:	89c50513          	addi	a0,a0,-1892 # 80009700 <CONSOLE_STATUS+0x6f0>
    80006e6c:	00001097          	auipc	ra,0x1
    80006e70:	a70080e7          	jalr	-1424(ra) # 800078dc <panic>
    80006e74:	00001097          	auipc	ra,0x1
    80006e78:	9c4080e7          	jalr	-1596(ra) # 80007838 <consoleinit>
    80006e7c:	00001097          	auipc	ra,0x1
    80006e80:	150080e7          	jalr	336(ra) # 80007fcc <printfinit>
    80006e84:	00002517          	auipc	a0,0x2
    80006e88:	70450513          	addi	a0,a0,1796 # 80009588 <CONSOLE_STATUS+0x578>
    80006e8c:	00001097          	auipc	ra,0x1
    80006e90:	aac080e7          	jalr	-1364(ra) # 80007938 <__printf>
    80006e94:	00003517          	auipc	a0,0x3
    80006e98:	83c50513          	addi	a0,a0,-1988 # 800096d0 <CONSOLE_STATUS+0x6c0>
    80006e9c:	00001097          	auipc	ra,0x1
    80006ea0:	a9c080e7          	jalr	-1380(ra) # 80007938 <__printf>
    80006ea4:	00002517          	auipc	a0,0x2
    80006ea8:	6e450513          	addi	a0,a0,1764 # 80009588 <CONSOLE_STATUS+0x578>
    80006eac:	00001097          	auipc	ra,0x1
    80006eb0:	a8c080e7          	jalr	-1396(ra) # 80007938 <__printf>
    80006eb4:	00001097          	auipc	ra,0x1
    80006eb8:	4a4080e7          	jalr	1188(ra) # 80008358 <kinit>
    80006ebc:	00000097          	auipc	ra,0x0
    80006ec0:	148080e7          	jalr	328(ra) # 80007004 <trapinit>
    80006ec4:	00000097          	auipc	ra,0x0
    80006ec8:	16c080e7          	jalr	364(ra) # 80007030 <trapinithart>
    80006ecc:	00000097          	auipc	ra,0x0
    80006ed0:	5b4080e7          	jalr	1460(ra) # 80007480 <plicinit>
    80006ed4:	00000097          	auipc	ra,0x0
    80006ed8:	5d4080e7          	jalr	1492(ra) # 800074a8 <plicinithart>
    80006edc:	00000097          	auipc	ra,0x0
    80006ee0:	078080e7          	jalr	120(ra) # 80006f54 <userinit>
    80006ee4:	0ff0000f          	fence
    80006ee8:	00100793          	li	a5,1
    80006eec:	00002517          	auipc	a0,0x2
    80006ef0:	7fc50513          	addi	a0,a0,2044 # 800096e8 <CONSOLE_STATUS+0x6d8>
    80006ef4:	00f4a023          	sw	a5,0(s1)
    80006ef8:	00001097          	auipc	ra,0x1
    80006efc:	a40080e7          	jalr	-1472(ra) # 80007938 <__printf>
    80006f00:	0000006f          	j	80006f00 <system_main+0xd4>

0000000080006f04 <cpuid>:
    80006f04:	ff010113          	addi	sp,sp,-16
    80006f08:	00813423          	sd	s0,8(sp)
    80006f0c:	01010413          	addi	s0,sp,16
    80006f10:	00020513          	mv	a0,tp
    80006f14:	00813403          	ld	s0,8(sp)
    80006f18:	0005051b          	sext.w	a0,a0
    80006f1c:	01010113          	addi	sp,sp,16
    80006f20:	00008067          	ret

0000000080006f24 <mycpu>:
    80006f24:	ff010113          	addi	sp,sp,-16
    80006f28:	00813423          	sd	s0,8(sp)
    80006f2c:	01010413          	addi	s0,sp,16
    80006f30:	00020793          	mv	a5,tp
    80006f34:	00813403          	ld	s0,8(sp)
    80006f38:	0007879b          	sext.w	a5,a5
    80006f3c:	00779793          	slli	a5,a5,0x7
    80006f40:	00006517          	auipc	a0,0x6
    80006f44:	d5050513          	addi	a0,a0,-688 # 8000cc90 <cpus>
    80006f48:	00f50533          	add	a0,a0,a5
    80006f4c:	01010113          	addi	sp,sp,16
    80006f50:	00008067          	ret

0000000080006f54 <userinit>:
    80006f54:	ff010113          	addi	sp,sp,-16
    80006f58:	00813423          	sd	s0,8(sp)
    80006f5c:	01010413          	addi	s0,sp,16
    80006f60:	00813403          	ld	s0,8(sp)
    80006f64:	01010113          	addi	sp,sp,16
    80006f68:	ffffb317          	auipc	t1,0xffffb
    80006f6c:	c0430067          	jr	-1020(t1) # 80001b6c <main>

0000000080006f70 <either_copyout>:
    80006f70:	ff010113          	addi	sp,sp,-16
    80006f74:	00813023          	sd	s0,0(sp)
    80006f78:	00113423          	sd	ra,8(sp)
    80006f7c:	01010413          	addi	s0,sp,16
    80006f80:	02051663          	bnez	a0,80006fac <either_copyout+0x3c>
    80006f84:	00058513          	mv	a0,a1
    80006f88:	00060593          	mv	a1,a2
    80006f8c:	0006861b          	sext.w	a2,a3
    80006f90:	00002097          	auipc	ra,0x2
    80006f94:	c54080e7          	jalr	-940(ra) # 80008be4 <__memmove>
    80006f98:	00813083          	ld	ra,8(sp)
    80006f9c:	00013403          	ld	s0,0(sp)
    80006fa0:	00000513          	li	a0,0
    80006fa4:	01010113          	addi	sp,sp,16
    80006fa8:	00008067          	ret
    80006fac:	00002517          	auipc	a0,0x2
    80006fb0:	77c50513          	addi	a0,a0,1916 # 80009728 <CONSOLE_STATUS+0x718>
    80006fb4:	00001097          	auipc	ra,0x1
    80006fb8:	928080e7          	jalr	-1752(ra) # 800078dc <panic>

0000000080006fbc <either_copyin>:
    80006fbc:	ff010113          	addi	sp,sp,-16
    80006fc0:	00813023          	sd	s0,0(sp)
    80006fc4:	00113423          	sd	ra,8(sp)
    80006fc8:	01010413          	addi	s0,sp,16
    80006fcc:	02059463          	bnez	a1,80006ff4 <either_copyin+0x38>
    80006fd0:	00060593          	mv	a1,a2
    80006fd4:	0006861b          	sext.w	a2,a3
    80006fd8:	00002097          	auipc	ra,0x2
    80006fdc:	c0c080e7          	jalr	-1012(ra) # 80008be4 <__memmove>
    80006fe0:	00813083          	ld	ra,8(sp)
    80006fe4:	00013403          	ld	s0,0(sp)
    80006fe8:	00000513          	li	a0,0
    80006fec:	01010113          	addi	sp,sp,16
    80006ff0:	00008067          	ret
    80006ff4:	00002517          	auipc	a0,0x2
    80006ff8:	75c50513          	addi	a0,a0,1884 # 80009750 <CONSOLE_STATUS+0x740>
    80006ffc:	00001097          	auipc	ra,0x1
    80007000:	8e0080e7          	jalr	-1824(ra) # 800078dc <panic>

0000000080007004 <trapinit>:
    80007004:	ff010113          	addi	sp,sp,-16
    80007008:	00813423          	sd	s0,8(sp)
    8000700c:	01010413          	addi	s0,sp,16
    80007010:	00813403          	ld	s0,8(sp)
    80007014:	00002597          	auipc	a1,0x2
    80007018:	76458593          	addi	a1,a1,1892 # 80009778 <CONSOLE_STATUS+0x768>
    8000701c:	00006517          	auipc	a0,0x6
    80007020:	cf450513          	addi	a0,a0,-780 # 8000cd10 <tickslock>
    80007024:	01010113          	addi	sp,sp,16
    80007028:	00001317          	auipc	t1,0x1
    8000702c:	5c030067          	jr	1472(t1) # 800085e8 <initlock>

0000000080007030 <trapinithart>:
    80007030:	ff010113          	addi	sp,sp,-16
    80007034:	00813423          	sd	s0,8(sp)
    80007038:	01010413          	addi	s0,sp,16
    8000703c:	00000797          	auipc	a5,0x0
    80007040:	2f478793          	addi	a5,a5,756 # 80007330 <kernelvec>
    80007044:	10579073          	csrw	stvec,a5
    80007048:	00813403          	ld	s0,8(sp)
    8000704c:	01010113          	addi	sp,sp,16
    80007050:	00008067          	ret

0000000080007054 <usertrap>:
    80007054:	ff010113          	addi	sp,sp,-16
    80007058:	00813423          	sd	s0,8(sp)
    8000705c:	01010413          	addi	s0,sp,16
    80007060:	00813403          	ld	s0,8(sp)
    80007064:	01010113          	addi	sp,sp,16
    80007068:	00008067          	ret

000000008000706c <usertrapret>:
    8000706c:	ff010113          	addi	sp,sp,-16
    80007070:	00813423          	sd	s0,8(sp)
    80007074:	01010413          	addi	s0,sp,16
    80007078:	00813403          	ld	s0,8(sp)
    8000707c:	01010113          	addi	sp,sp,16
    80007080:	00008067          	ret

0000000080007084 <kerneltrap>:
    80007084:	fe010113          	addi	sp,sp,-32
    80007088:	00813823          	sd	s0,16(sp)
    8000708c:	00113c23          	sd	ra,24(sp)
    80007090:	00913423          	sd	s1,8(sp)
    80007094:	02010413          	addi	s0,sp,32
    80007098:	142025f3          	csrr	a1,scause
    8000709c:	100027f3          	csrr	a5,sstatus
    800070a0:	0027f793          	andi	a5,a5,2
    800070a4:	10079c63          	bnez	a5,800071bc <kerneltrap+0x138>
    800070a8:	142027f3          	csrr	a5,scause
    800070ac:	0207ce63          	bltz	a5,800070e8 <kerneltrap+0x64>
    800070b0:	00002517          	auipc	a0,0x2
    800070b4:	71050513          	addi	a0,a0,1808 # 800097c0 <CONSOLE_STATUS+0x7b0>
    800070b8:	00001097          	auipc	ra,0x1
    800070bc:	880080e7          	jalr	-1920(ra) # 80007938 <__printf>
    800070c0:	141025f3          	csrr	a1,sepc
    800070c4:	14302673          	csrr	a2,stval
    800070c8:	00002517          	auipc	a0,0x2
    800070cc:	70850513          	addi	a0,a0,1800 # 800097d0 <CONSOLE_STATUS+0x7c0>
    800070d0:	00001097          	auipc	ra,0x1
    800070d4:	868080e7          	jalr	-1944(ra) # 80007938 <__printf>
    800070d8:	00002517          	auipc	a0,0x2
    800070dc:	71050513          	addi	a0,a0,1808 # 800097e8 <CONSOLE_STATUS+0x7d8>
    800070e0:	00000097          	auipc	ra,0x0
    800070e4:	7fc080e7          	jalr	2044(ra) # 800078dc <panic>
    800070e8:	0ff7f713          	andi	a4,a5,255
    800070ec:	00900693          	li	a3,9
    800070f0:	04d70063          	beq	a4,a3,80007130 <kerneltrap+0xac>
    800070f4:	fff00713          	li	a4,-1
    800070f8:	03f71713          	slli	a4,a4,0x3f
    800070fc:	00170713          	addi	a4,a4,1
    80007100:	fae798e3          	bne	a5,a4,800070b0 <kerneltrap+0x2c>
    80007104:	00000097          	auipc	ra,0x0
    80007108:	e00080e7          	jalr	-512(ra) # 80006f04 <cpuid>
    8000710c:	06050663          	beqz	a0,80007178 <kerneltrap+0xf4>
    80007110:	144027f3          	csrr	a5,sip
    80007114:	ffd7f793          	andi	a5,a5,-3
    80007118:	14479073          	csrw	sip,a5
    8000711c:	01813083          	ld	ra,24(sp)
    80007120:	01013403          	ld	s0,16(sp)
    80007124:	00813483          	ld	s1,8(sp)
    80007128:	02010113          	addi	sp,sp,32
    8000712c:	00008067          	ret
    80007130:	00000097          	auipc	ra,0x0
    80007134:	3c4080e7          	jalr	964(ra) # 800074f4 <plic_claim>
    80007138:	00a00793          	li	a5,10
    8000713c:	00050493          	mv	s1,a0
    80007140:	06f50863          	beq	a0,a5,800071b0 <kerneltrap+0x12c>
    80007144:	fc050ce3          	beqz	a0,8000711c <kerneltrap+0x98>
    80007148:	00050593          	mv	a1,a0
    8000714c:	00002517          	auipc	a0,0x2
    80007150:	65450513          	addi	a0,a0,1620 # 800097a0 <CONSOLE_STATUS+0x790>
    80007154:	00000097          	auipc	ra,0x0
    80007158:	7e4080e7          	jalr	2020(ra) # 80007938 <__printf>
    8000715c:	01013403          	ld	s0,16(sp)
    80007160:	01813083          	ld	ra,24(sp)
    80007164:	00048513          	mv	a0,s1
    80007168:	00813483          	ld	s1,8(sp)
    8000716c:	02010113          	addi	sp,sp,32
    80007170:	00000317          	auipc	t1,0x0
    80007174:	3bc30067          	jr	956(t1) # 8000752c <plic_complete>
    80007178:	00006517          	auipc	a0,0x6
    8000717c:	b9850513          	addi	a0,a0,-1128 # 8000cd10 <tickslock>
    80007180:	00001097          	auipc	ra,0x1
    80007184:	48c080e7          	jalr	1164(ra) # 8000860c <acquire>
    80007188:	00005717          	auipc	a4,0x5
    8000718c:	97c70713          	addi	a4,a4,-1668 # 8000bb04 <ticks>
    80007190:	00072783          	lw	a5,0(a4)
    80007194:	00006517          	auipc	a0,0x6
    80007198:	b7c50513          	addi	a0,a0,-1156 # 8000cd10 <tickslock>
    8000719c:	0017879b          	addiw	a5,a5,1
    800071a0:	00f72023          	sw	a5,0(a4)
    800071a4:	00001097          	auipc	ra,0x1
    800071a8:	534080e7          	jalr	1332(ra) # 800086d8 <release>
    800071ac:	f65ff06f          	j	80007110 <kerneltrap+0x8c>
    800071b0:	00001097          	auipc	ra,0x1
    800071b4:	090080e7          	jalr	144(ra) # 80008240 <uartintr>
    800071b8:	fa5ff06f          	j	8000715c <kerneltrap+0xd8>
    800071bc:	00002517          	auipc	a0,0x2
    800071c0:	5c450513          	addi	a0,a0,1476 # 80009780 <CONSOLE_STATUS+0x770>
    800071c4:	00000097          	auipc	ra,0x0
    800071c8:	718080e7          	jalr	1816(ra) # 800078dc <panic>

00000000800071cc <clockintr>:
    800071cc:	fe010113          	addi	sp,sp,-32
    800071d0:	00813823          	sd	s0,16(sp)
    800071d4:	00913423          	sd	s1,8(sp)
    800071d8:	00113c23          	sd	ra,24(sp)
    800071dc:	02010413          	addi	s0,sp,32
    800071e0:	00006497          	auipc	s1,0x6
    800071e4:	b3048493          	addi	s1,s1,-1232 # 8000cd10 <tickslock>
    800071e8:	00048513          	mv	a0,s1
    800071ec:	00001097          	auipc	ra,0x1
    800071f0:	420080e7          	jalr	1056(ra) # 8000860c <acquire>
    800071f4:	00005717          	auipc	a4,0x5
    800071f8:	91070713          	addi	a4,a4,-1776 # 8000bb04 <ticks>
    800071fc:	00072783          	lw	a5,0(a4)
    80007200:	01013403          	ld	s0,16(sp)
    80007204:	01813083          	ld	ra,24(sp)
    80007208:	00048513          	mv	a0,s1
    8000720c:	0017879b          	addiw	a5,a5,1
    80007210:	00813483          	ld	s1,8(sp)
    80007214:	00f72023          	sw	a5,0(a4)
    80007218:	02010113          	addi	sp,sp,32
    8000721c:	00001317          	auipc	t1,0x1
    80007220:	4bc30067          	jr	1212(t1) # 800086d8 <release>

0000000080007224 <devintr>:
    80007224:	142027f3          	csrr	a5,scause
    80007228:	00000513          	li	a0,0
    8000722c:	0007c463          	bltz	a5,80007234 <devintr+0x10>
    80007230:	00008067          	ret
    80007234:	fe010113          	addi	sp,sp,-32
    80007238:	00813823          	sd	s0,16(sp)
    8000723c:	00113c23          	sd	ra,24(sp)
    80007240:	00913423          	sd	s1,8(sp)
    80007244:	02010413          	addi	s0,sp,32
    80007248:	0ff7f713          	andi	a4,a5,255
    8000724c:	00900693          	li	a3,9
    80007250:	04d70c63          	beq	a4,a3,800072a8 <devintr+0x84>
    80007254:	fff00713          	li	a4,-1
    80007258:	03f71713          	slli	a4,a4,0x3f
    8000725c:	00170713          	addi	a4,a4,1
    80007260:	00e78c63          	beq	a5,a4,80007278 <devintr+0x54>
    80007264:	01813083          	ld	ra,24(sp)
    80007268:	01013403          	ld	s0,16(sp)
    8000726c:	00813483          	ld	s1,8(sp)
    80007270:	02010113          	addi	sp,sp,32
    80007274:	00008067          	ret
    80007278:	00000097          	auipc	ra,0x0
    8000727c:	c8c080e7          	jalr	-884(ra) # 80006f04 <cpuid>
    80007280:	06050663          	beqz	a0,800072ec <devintr+0xc8>
    80007284:	144027f3          	csrr	a5,sip
    80007288:	ffd7f793          	andi	a5,a5,-3
    8000728c:	14479073          	csrw	sip,a5
    80007290:	01813083          	ld	ra,24(sp)
    80007294:	01013403          	ld	s0,16(sp)
    80007298:	00813483          	ld	s1,8(sp)
    8000729c:	00200513          	li	a0,2
    800072a0:	02010113          	addi	sp,sp,32
    800072a4:	00008067          	ret
    800072a8:	00000097          	auipc	ra,0x0
    800072ac:	24c080e7          	jalr	588(ra) # 800074f4 <plic_claim>
    800072b0:	00a00793          	li	a5,10
    800072b4:	00050493          	mv	s1,a0
    800072b8:	06f50663          	beq	a0,a5,80007324 <devintr+0x100>
    800072bc:	00100513          	li	a0,1
    800072c0:	fa0482e3          	beqz	s1,80007264 <devintr+0x40>
    800072c4:	00048593          	mv	a1,s1
    800072c8:	00002517          	auipc	a0,0x2
    800072cc:	4d850513          	addi	a0,a0,1240 # 800097a0 <CONSOLE_STATUS+0x790>
    800072d0:	00000097          	auipc	ra,0x0
    800072d4:	668080e7          	jalr	1640(ra) # 80007938 <__printf>
    800072d8:	00048513          	mv	a0,s1
    800072dc:	00000097          	auipc	ra,0x0
    800072e0:	250080e7          	jalr	592(ra) # 8000752c <plic_complete>
    800072e4:	00100513          	li	a0,1
    800072e8:	f7dff06f          	j	80007264 <devintr+0x40>
    800072ec:	00006517          	auipc	a0,0x6
    800072f0:	a2450513          	addi	a0,a0,-1500 # 8000cd10 <tickslock>
    800072f4:	00001097          	auipc	ra,0x1
    800072f8:	318080e7          	jalr	792(ra) # 8000860c <acquire>
    800072fc:	00005717          	auipc	a4,0x5
    80007300:	80870713          	addi	a4,a4,-2040 # 8000bb04 <ticks>
    80007304:	00072783          	lw	a5,0(a4)
    80007308:	00006517          	auipc	a0,0x6
    8000730c:	a0850513          	addi	a0,a0,-1528 # 8000cd10 <tickslock>
    80007310:	0017879b          	addiw	a5,a5,1
    80007314:	00f72023          	sw	a5,0(a4)
    80007318:	00001097          	auipc	ra,0x1
    8000731c:	3c0080e7          	jalr	960(ra) # 800086d8 <release>
    80007320:	f65ff06f          	j	80007284 <devintr+0x60>
    80007324:	00001097          	auipc	ra,0x1
    80007328:	f1c080e7          	jalr	-228(ra) # 80008240 <uartintr>
    8000732c:	fadff06f          	j	800072d8 <devintr+0xb4>

0000000080007330 <kernelvec>:
    80007330:	f0010113          	addi	sp,sp,-256
    80007334:	00113023          	sd	ra,0(sp)
    80007338:	00213423          	sd	sp,8(sp)
    8000733c:	00313823          	sd	gp,16(sp)
    80007340:	00413c23          	sd	tp,24(sp)
    80007344:	02513023          	sd	t0,32(sp)
    80007348:	02613423          	sd	t1,40(sp)
    8000734c:	02713823          	sd	t2,48(sp)
    80007350:	02813c23          	sd	s0,56(sp)
    80007354:	04913023          	sd	s1,64(sp)
    80007358:	04a13423          	sd	a0,72(sp)
    8000735c:	04b13823          	sd	a1,80(sp)
    80007360:	04c13c23          	sd	a2,88(sp)
    80007364:	06d13023          	sd	a3,96(sp)
    80007368:	06e13423          	sd	a4,104(sp)
    8000736c:	06f13823          	sd	a5,112(sp)
    80007370:	07013c23          	sd	a6,120(sp)
    80007374:	09113023          	sd	a7,128(sp)
    80007378:	09213423          	sd	s2,136(sp)
    8000737c:	09313823          	sd	s3,144(sp)
    80007380:	09413c23          	sd	s4,152(sp)
    80007384:	0b513023          	sd	s5,160(sp)
    80007388:	0b613423          	sd	s6,168(sp)
    8000738c:	0b713823          	sd	s7,176(sp)
    80007390:	0b813c23          	sd	s8,184(sp)
    80007394:	0d913023          	sd	s9,192(sp)
    80007398:	0da13423          	sd	s10,200(sp)
    8000739c:	0db13823          	sd	s11,208(sp)
    800073a0:	0dc13c23          	sd	t3,216(sp)
    800073a4:	0fd13023          	sd	t4,224(sp)
    800073a8:	0fe13423          	sd	t5,232(sp)
    800073ac:	0ff13823          	sd	t6,240(sp)
    800073b0:	cd5ff0ef          	jal	ra,80007084 <kerneltrap>
    800073b4:	00013083          	ld	ra,0(sp)
    800073b8:	00813103          	ld	sp,8(sp)
    800073bc:	01013183          	ld	gp,16(sp)
    800073c0:	02013283          	ld	t0,32(sp)
    800073c4:	02813303          	ld	t1,40(sp)
    800073c8:	03013383          	ld	t2,48(sp)
    800073cc:	03813403          	ld	s0,56(sp)
    800073d0:	04013483          	ld	s1,64(sp)
    800073d4:	04813503          	ld	a0,72(sp)
    800073d8:	05013583          	ld	a1,80(sp)
    800073dc:	05813603          	ld	a2,88(sp)
    800073e0:	06013683          	ld	a3,96(sp)
    800073e4:	06813703          	ld	a4,104(sp)
    800073e8:	07013783          	ld	a5,112(sp)
    800073ec:	07813803          	ld	a6,120(sp)
    800073f0:	08013883          	ld	a7,128(sp)
    800073f4:	08813903          	ld	s2,136(sp)
    800073f8:	09013983          	ld	s3,144(sp)
    800073fc:	09813a03          	ld	s4,152(sp)
    80007400:	0a013a83          	ld	s5,160(sp)
    80007404:	0a813b03          	ld	s6,168(sp)
    80007408:	0b013b83          	ld	s7,176(sp)
    8000740c:	0b813c03          	ld	s8,184(sp)
    80007410:	0c013c83          	ld	s9,192(sp)
    80007414:	0c813d03          	ld	s10,200(sp)
    80007418:	0d013d83          	ld	s11,208(sp)
    8000741c:	0d813e03          	ld	t3,216(sp)
    80007420:	0e013e83          	ld	t4,224(sp)
    80007424:	0e813f03          	ld	t5,232(sp)
    80007428:	0f013f83          	ld	t6,240(sp)
    8000742c:	10010113          	addi	sp,sp,256
    80007430:	10200073          	sret
    80007434:	00000013          	nop
    80007438:	00000013          	nop
    8000743c:	00000013          	nop

0000000080007440 <timervec>:
    80007440:	34051573          	csrrw	a0,mscratch,a0
    80007444:	00b53023          	sd	a1,0(a0)
    80007448:	00c53423          	sd	a2,8(a0)
    8000744c:	00d53823          	sd	a3,16(a0)
    80007450:	01853583          	ld	a1,24(a0)
    80007454:	02053603          	ld	a2,32(a0)
    80007458:	0005b683          	ld	a3,0(a1)
    8000745c:	00c686b3          	add	a3,a3,a2
    80007460:	00d5b023          	sd	a3,0(a1)
    80007464:	00200593          	li	a1,2
    80007468:	14459073          	csrw	sip,a1
    8000746c:	01053683          	ld	a3,16(a0)
    80007470:	00853603          	ld	a2,8(a0)
    80007474:	00053583          	ld	a1,0(a0)
    80007478:	34051573          	csrrw	a0,mscratch,a0
    8000747c:	30200073          	mret

0000000080007480 <plicinit>:
    80007480:	ff010113          	addi	sp,sp,-16
    80007484:	00813423          	sd	s0,8(sp)
    80007488:	01010413          	addi	s0,sp,16
    8000748c:	00813403          	ld	s0,8(sp)
    80007490:	0c0007b7          	lui	a5,0xc000
    80007494:	00100713          	li	a4,1
    80007498:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000749c:	00e7a223          	sw	a4,4(a5)
    800074a0:	01010113          	addi	sp,sp,16
    800074a4:	00008067          	ret

00000000800074a8 <plicinithart>:
    800074a8:	ff010113          	addi	sp,sp,-16
    800074ac:	00813023          	sd	s0,0(sp)
    800074b0:	00113423          	sd	ra,8(sp)
    800074b4:	01010413          	addi	s0,sp,16
    800074b8:	00000097          	auipc	ra,0x0
    800074bc:	a4c080e7          	jalr	-1460(ra) # 80006f04 <cpuid>
    800074c0:	0085171b          	slliw	a4,a0,0x8
    800074c4:	0c0027b7          	lui	a5,0xc002
    800074c8:	00e787b3          	add	a5,a5,a4
    800074cc:	40200713          	li	a4,1026
    800074d0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800074d4:	00813083          	ld	ra,8(sp)
    800074d8:	00013403          	ld	s0,0(sp)
    800074dc:	00d5151b          	slliw	a0,a0,0xd
    800074e0:	0c2017b7          	lui	a5,0xc201
    800074e4:	00a78533          	add	a0,a5,a0
    800074e8:	00052023          	sw	zero,0(a0)
    800074ec:	01010113          	addi	sp,sp,16
    800074f0:	00008067          	ret

00000000800074f4 <plic_claim>:
    800074f4:	ff010113          	addi	sp,sp,-16
    800074f8:	00813023          	sd	s0,0(sp)
    800074fc:	00113423          	sd	ra,8(sp)
    80007500:	01010413          	addi	s0,sp,16
    80007504:	00000097          	auipc	ra,0x0
    80007508:	a00080e7          	jalr	-1536(ra) # 80006f04 <cpuid>
    8000750c:	00813083          	ld	ra,8(sp)
    80007510:	00013403          	ld	s0,0(sp)
    80007514:	00d5151b          	slliw	a0,a0,0xd
    80007518:	0c2017b7          	lui	a5,0xc201
    8000751c:	00a78533          	add	a0,a5,a0
    80007520:	00452503          	lw	a0,4(a0)
    80007524:	01010113          	addi	sp,sp,16
    80007528:	00008067          	ret

000000008000752c <plic_complete>:
    8000752c:	fe010113          	addi	sp,sp,-32
    80007530:	00813823          	sd	s0,16(sp)
    80007534:	00913423          	sd	s1,8(sp)
    80007538:	00113c23          	sd	ra,24(sp)
    8000753c:	02010413          	addi	s0,sp,32
    80007540:	00050493          	mv	s1,a0
    80007544:	00000097          	auipc	ra,0x0
    80007548:	9c0080e7          	jalr	-1600(ra) # 80006f04 <cpuid>
    8000754c:	01813083          	ld	ra,24(sp)
    80007550:	01013403          	ld	s0,16(sp)
    80007554:	00d5179b          	slliw	a5,a0,0xd
    80007558:	0c201737          	lui	a4,0xc201
    8000755c:	00f707b3          	add	a5,a4,a5
    80007560:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80007564:	00813483          	ld	s1,8(sp)
    80007568:	02010113          	addi	sp,sp,32
    8000756c:	00008067          	ret

0000000080007570 <consolewrite>:
    80007570:	fb010113          	addi	sp,sp,-80
    80007574:	04813023          	sd	s0,64(sp)
    80007578:	04113423          	sd	ra,72(sp)
    8000757c:	02913c23          	sd	s1,56(sp)
    80007580:	03213823          	sd	s2,48(sp)
    80007584:	03313423          	sd	s3,40(sp)
    80007588:	03413023          	sd	s4,32(sp)
    8000758c:	01513c23          	sd	s5,24(sp)
    80007590:	05010413          	addi	s0,sp,80
    80007594:	06c05c63          	blez	a2,8000760c <consolewrite+0x9c>
    80007598:	00060993          	mv	s3,a2
    8000759c:	00050a13          	mv	s4,a0
    800075a0:	00058493          	mv	s1,a1
    800075a4:	00000913          	li	s2,0
    800075a8:	fff00a93          	li	s5,-1
    800075ac:	01c0006f          	j	800075c8 <consolewrite+0x58>
    800075b0:	fbf44503          	lbu	a0,-65(s0)
    800075b4:	0019091b          	addiw	s2,s2,1
    800075b8:	00148493          	addi	s1,s1,1
    800075bc:	00001097          	auipc	ra,0x1
    800075c0:	a9c080e7          	jalr	-1380(ra) # 80008058 <uartputc>
    800075c4:	03298063          	beq	s3,s2,800075e4 <consolewrite+0x74>
    800075c8:	00048613          	mv	a2,s1
    800075cc:	00100693          	li	a3,1
    800075d0:	000a0593          	mv	a1,s4
    800075d4:	fbf40513          	addi	a0,s0,-65
    800075d8:	00000097          	auipc	ra,0x0
    800075dc:	9e4080e7          	jalr	-1564(ra) # 80006fbc <either_copyin>
    800075e0:	fd5518e3          	bne	a0,s5,800075b0 <consolewrite+0x40>
    800075e4:	04813083          	ld	ra,72(sp)
    800075e8:	04013403          	ld	s0,64(sp)
    800075ec:	03813483          	ld	s1,56(sp)
    800075f0:	02813983          	ld	s3,40(sp)
    800075f4:	02013a03          	ld	s4,32(sp)
    800075f8:	01813a83          	ld	s5,24(sp)
    800075fc:	00090513          	mv	a0,s2
    80007600:	03013903          	ld	s2,48(sp)
    80007604:	05010113          	addi	sp,sp,80
    80007608:	00008067          	ret
    8000760c:	00000913          	li	s2,0
    80007610:	fd5ff06f          	j	800075e4 <consolewrite+0x74>

0000000080007614 <consoleread>:
    80007614:	f9010113          	addi	sp,sp,-112
    80007618:	06813023          	sd	s0,96(sp)
    8000761c:	04913c23          	sd	s1,88(sp)
    80007620:	05213823          	sd	s2,80(sp)
    80007624:	05313423          	sd	s3,72(sp)
    80007628:	05413023          	sd	s4,64(sp)
    8000762c:	03513c23          	sd	s5,56(sp)
    80007630:	03613823          	sd	s6,48(sp)
    80007634:	03713423          	sd	s7,40(sp)
    80007638:	03813023          	sd	s8,32(sp)
    8000763c:	06113423          	sd	ra,104(sp)
    80007640:	01913c23          	sd	s9,24(sp)
    80007644:	07010413          	addi	s0,sp,112
    80007648:	00060b93          	mv	s7,a2
    8000764c:	00050913          	mv	s2,a0
    80007650:	00058c13          	mv	s8,a1
    80007654:	00060b1b          	sext.w	s6,a2
    80007658:	00005497          	auipc	s1,0x5
    8000765c:	6e048493          	addi	s1,s1,1760 # 8000cd38 <cons>
    80007660:	00400993          	li	s3,4
    80007664:	fff00a13          	li	s4,-1
    80007668:	00a00a93          	li	s5,10
    8000766c:	05705e63          	blez	s7,800076c8 <consoleread+0xb4>
    80007670:	09c4a703          	lw	a4,156(s1)
    80007674:	0984a783          	lw	a5,152(s1)
    80007678:	0007071b          	sext.w	a4,a4
    8000767c:	08e78463          	beq	a5,a4,80007704 <consoleread+0xf0>
    80007680:	07f7f713          	andi	a4,a5,127
    80007684:	00e48733          	add	a4,s1,a4
    80007688:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000768c:	0017869b          	addiw	a3,a5,1
    80007690:	08d4ac23          	sw	a3,152(s1)
    80007694:	00070c9b          	sext.w	s9,a4
    80007698:	0b370663          	beq	a4,s3,80007744 <consoleread+0x130>
    8000769c:	00100693          	li	a3,1
    800076a0:	f9f40613          	addi	a2,s0,-97
    800076a4:	000c0593          	mv	a1,s8
    800076a8:	00090513          	mv	a0,s2
    800076ac:	f8e40fa3          	sb	a4,-97(s0)
    800076b0:	00000097          	auipc	ra,0x0
    800076b4:	8c0080e7          	jalr	-1856(ra) # 80006f70 <either_copyout>
    800076b8:	01450863          	beq	a0,s4,800076c8 <consoleread+0xb4>
    800076bc:	001c0c13          	addi	s8,s8,1
    800076c0:	fffb8b9b          	addiw	s7,s7,-1
    800076c4:	fb5c94e3          	bne	s9,s5,8000766c <consoleread+0x58>
    800076c8:	000b851b          	sext.w	a0,s7
    800076cc:	06813083          	ld	ra,104(sp)
    800076d0:	06013403          	ld	s0,96(sp)
    800076d4:	05813483          	ld	s1,88(sp)
    800076d8:	05013903          	ld	s2,80(sp)
    800076dc:	04813983          	ld	s3,72(sp)
    800076e0:	04013a03          	ld	s4,64(sp)
    800076e4:	03813a83          	ld	s5,56(sp)
    800076e8:	02813b83          	ld	s7,40(sp)
    800076ec:	02013c03          	ld	s8,32(sp)
    800076f0:	01813c83          	ld	s9,24(sp)
    800076f4:	40ab053b          	subw	a0,s6,a0
    800076f8:	03013b03          	ld	s6,48(sp)
    800076fc:	07010113          	addi	sp,sp,112
    80007700:	00008067          	ret
    80007704:	00001097          	auipc	ra,0x1
    80007708:	1d8080e7          	jalr	472(ra) # 800088dc <push_on>
    8000770c:	0984a703          	lw	a4,152(s1)
    80007710:	09c4a783          	lw	a5,156(s1)
    80007714:	0007879b          	sext.w	a5,a5
    80007718:	fef70ce3          	beq	a4,a5,80007710 <consoleread+0xfc>
    8000771c:	00001097          	auipc	ra,0x1
    80007720:	234080e7          	jalr	564(ra) # 80008950 <pop_on>
    80007724:	0984a783          	lw	a5,152(s1)
    80007728:	07f7f713          	andi	a4,a5,127
    8000772c:	00e48733          	add	a4,s1,a4
    80007730:	01874703          	lbu	a4,24(a4)
    80007734:	0017869b          	addiw	a3,a5,1
    80007738:	08d4ac23          	sw	a3,152(s1)
    8000773c:	00070c9b          	sext.w	s9,a4
    80007740:	f5371ee3          	bne	a4,s3,8000769c <consoleread+0x88>
    80007744:	000b851b          	sext.w	a0,s7
    80007748:	f96bf2e3          	bgeu	s7,s6,800076cc <consoleread+0xb8>
    8000774c:	08f4ac23          	sw	a5,152(s1)
    80007750:	f7dff06f          	j	800076cc <consoleread+0xb8>

0000000080007754 <consputc>:
    80007754:	10000793          	li	a5,256
    80007758:	00f50663          	beq	a0,a5,80007764 <consputc+0x10>
    8000775c:	00001317          	auipc	t1,0x1
    80007760:	9f430067          	jr	-1548(t1) # 80008150 <uartputc_sync>
    80007764:	ff010113          	addi	sp,sp,-16
    80007768:	00113423          	sd	ra,8(sp)
    8000776c:	00813023          	sd	s0,0(sp)
    80007770:	01010413          	addi	s0,sp,16
    80007774:	00800513          	li	a0,8
    80007778:	00001097          	auipc	ra,0x1
    8000777c:	9d8080e7          	jalr	-1576(ra) # 80008150 <uartputc_sync>
    80007780:	02000513          	li	a0,32
    80007784:	00001097          	auipc	ra,0x1
    80007788:	9cc080e7          	jalr	-1588(ra) # 80008150 <uartputc_sync>
    8000778c:	00013403          	ld	s0,0(sp)
    80007790:	00813083          	ld	ra,8(sp)
    80007794:	00800513          	li	a0,8
    80007798:	01010113          	addi	sp,sp,16
    8000779c:	00001317          	auipc	t1,0x1
    800077a0:	9b430067          	jr	-1612(t1) # 80008150 <uartputc_sync>

00000000800077a4 <consoleintr>:
    800077a4:	fe010113          	addi	sp,sp,-32
    800077a8:	00813823          	sd	s0,16(sp)
    800077ac:	00913423          	sd	s1,8(sp)
    800077b0:	01213023          	sd	s2,0(sp)
    800077b4:	00113c23          	sd	ra,24(sp)
    800077b8:	02010413          	addi	s0,sp,32
    800077bc:	00005917          	auipc	s2,0x5
    800077c0:	57c90913          	addi	s2,s2,1404 # 8000cd38 <cons>
    800077c4:	00050493          	mv	s1,a0
    800077c8:	00090513          	mv	a0,s2
    800077cc:	00001097          	auipc	ra,0x1
    800077d0:	e40080e7          	jalr	-448(ra) # 8000860c <acquire>
    800077d4:	02048c63          	beqz	s1,8000780c <consoleintr+0x68>
    800077d8:	0a092783          	lw	a5,160(s2)
    800077dc:	09892703          	lw	a4,152(s2)
    800077e0:	07f00693          	li	a3,127
    800077e4:	40e7873b          	subw	a4,a5,a4
    800077e8:	02e6e263          	bltu	a3,a4,8000780c <consoleintr+0x68>
    800077ec:	00d00713          	li	a4,13
    800077f0:	04e48063          	beq	s1,a4,80007830 <consoleintr+0x8c>
    800077f4:	07f7f713          	andi	a4,a5,127
    800077f8:	00e90733          	add	a4,s2,a4
    800077fc:	0017879b          	addiw	a5,a5,1
    80007800:	0af92023          	sw	a5,160(s2)
    80007804:	00970c23          	sb	s1,24(a4)
    80007808:	08f92e23          	sw	a5,156(s2)
    8000780c:	01013403          	ld	s0,16(sp)
    80007810:	01813083          	ld	ra,24(sp)
    80007814:	00813483          	ld	s1,8(sp)
    80007818:	00013903          	ld	s2,0(sp)
    8000781c:	00005517          	auipc	a0,0x5
    80007820:	51c50513          	addi	a0,a0,1308 # 8000cd38 <cons>
    80007824:	02010113          	addi	sp,sp,32
    80007828:	00001317          	auipc	t1,0x1
    8000782c:	eb030067          	jr	-336(t1) # 800086d8 <release>
    80007830:	00a00493          	li	s1,10
    80007834:	fc1ff06f          	j	800077f4 <consoleintr+0x50>

0000000080007838 <consoleinit>:
    80007838:	fe010113          	addi	sp,sp,-32
    8000783c:	00113c23          	sd	ra,24(sp)
    80007840:	00813823          	sd	s0,16(sp)
    80007844:	00913423          	sd	s1,8(sp)
    80007848:	02010413          	addi	s0,sp,32
    8000784c:	00005497          	auipc	s1,0x5
    80007850:	4ec48493          	addi	s1,s1,1260 # 8000cd38 <cons>
    80007854:	00048513          	mv	a0,s1
    80007858:	00002597          	auipc	a1,0x2
    8000785c:	fa058593          	addi	a1,a1,-96 # 800097f8 <CONSOLE_STATUS+0x7e8>
    80007860:	00001097          	auipc	ra,0x1
    80007864:	d88080e7          	jalr	-632(ra) # 800085e8 <initlock>
    80007868:	00000097          	auipc	ra,0x0
    8000786c:	7ac080e7          	jalr	1964(ra) # 80008014 <uartinit>
    80007870:	01813083          	ld	ra,24(sp)
    80007874:	01013403          	ld	s0,16(sp)
    80007878:	00000797          	auipc	a5,0x0
    8000787c:	d9c78793          	addi	a5,a5,-612 # 80007614 <consoleread>
    80007880:	0af4bc23          	sd	a5,184(s1)
    80007884:	00000797          	auipc	a5,0x0
    80007888:	cec78793          	addi	a5,a5,-788 # 80007570 <consolewrite>
    8000788c:	0cf4b023          	sd	a5,192(s1)
    80007890:	00813483          	ld	s1,8(sp)
    80007894:	02010113          	addi	sp,sp,32
    80007898:	00008067          	ret

000000008000789c <console_read>:
    8000789c:	ff010113          	addi	sp,sp,-16
    800078a0:	00813423          	sd	s0,8(sp)
    800078a4:	01010413          	addi	s0,sp,16
    800078a8:	00813403          	ld	s0,8(sp)
    800078ac:	00005317          	auipc	t1,0x5
    800078b0:	54433303          	ld	t1,1348(t1) # 8000cdf0 <devsw+0x10>
    800078b4:	01010113          	addi	sp,sp,16
    800078b8:	00030067          	jr	t1

00000000800078bc <console_write>:
    800078bc:	ff010113          	addi	sp,sp,-16
    800078c0:	00813423          	sd	s0,8(sp)
    800078c4:	01010413          	addi	s0,sp,16
    800078c8:	00813403          	ld	s0,8(sp)
    800078cc:	00005317          	auipc	t1,0x5
    800078d0:	52c33303          	ld	t1,1324(t1) # 8000cdf8 <devsw+0x18>
    800078d4:	01010113          	addi	sp,sp,16
    800078d8:	00030067          	jr	t1

00000000800078dc <panic>:
    800078dc:	fe010113          	addi	sp,sp,-32
    800078e0:	00113c23          	sd	ra,24(sp)
    800078e4:	00813823          	sd	s0,16(sp)
    800078e8:	00913423          	sd	s1,8(sp)
    800078ec:	02010413          	addi	s0,sp,32
    800078f0:	00050493          	mv	s1,a0
    800078f4:	00002517          	auipc	a0,0x2
    800078f8:	f0c50513          	addi	a0,a0,-244 # 80009800 <CONSOLE_STATUS+0x7f0>
    800078fc:	00005797          	auipc	a5,0x5
    80007900:	5807ae23          	sw	zero,1436(a5) # 8000ce98 <pr+0x18>
    80007904:	00000097          	auipc	ra,0x0
    80007908:	034080e7          	jalr	52(ra) # 80007938 <__printf>
    8000790c:	00048513          	mv	a0,s1
    80007910:	00000097          	auipc	ra,0x0
    80007914:	028080e7          	jalr	40(ra) # 80007938 <__printf>
    80007918:	00002517          	auipc	a0,0x2
    8000791c:	c7050513          	addi	a0,a0,-912 # 80009588 <CONSOLE_STATUS+0x578>
    80007920:	00000097          	auipc	ra,0x0
    80007924:	018080e7          	jalr	24(ra) # 80007938 <__printf>
    80007928:	00100793          	li	a5,1
    8000792c:	00004717          	auipc	a4,0x4
    80007930:	1cf72e23          	sw	a5,476(a4) # 8000bb08 <panicked>
    80007934:	0000006f          	j	80007934 <panic+0x58>

0000000080007938 <__printf>:
    80007938:	f3010113          	addi	sp,sp,-208
    8000793c:	08813023          	sd	s0,128(sp)
    80007940:	07313423          	sd	s3,104(sp)
    80007944:	09010413          	addi	s0,sp,144
    80007948:	05813023          	sd	s8,64(sp)
    8000794c:	08113423          	sd	ra,136(sp)
    80007950:	06913c23          	sd	s1,120(sp)
    80007954:	07213823          	sd	s2,112(sp)
    80007958:	07413023          	sd	s4,96(sp)
    8000795c:	05513c23          	sd	s5,88(sp)
    80007960:	05613823          	sd	s6,80(sp)
    80007964:	05713423          	sd	s7,72(sp)
    80007968:	03913c23          	sd	s9,56(sp)
    8000796c:	03a13823          	sd	s10,48(sp)
    80007970:	03b13423          	sd	s11,40(sp)
    80007974:	00005317          	auipc	t1,0x5
    80007978:	50c30313          	addi	t1,t1,1292 # 8000ce80 <pr>
    8000797c:	01832c03          	lw	s8,24(t1)
    80007980:	00b43423          	sd	a1,8(s0)
    80007984:	00c43823          	sd	a2,16(s0)
    80007988:	00d43c23          	sd	a3,24(s0)
    8000798c:	02e43023          	sd	a4,32(s0)
    80007990:	02f43423          	sd	a5,40(s0)
    80007994:	03043823          	sd	a6,48(s0)
    80007998:	03143c23          	sd	a7,56(s0)
    8000799c:	00050993          	mv	s3,a0
    800079a0:	4a0c1663          	bnez	s8,80007e4c <__printf+0x514>
    800079a4:	60098c63          	beqz	s3,80007fbc <__printf+0x684>
    800079a8:	0009c503          	lbu	a0,0(s3)
    800079ac:	00840793          	addi	a5,s0,8
    800079b0:	f6f43c23          	sd	a5,-136(s0)
    800079b4:	00000493          	li	s1,0
    800079b8:	22050063          	beqz	a0,80007bd8 <__printf+0x2a0>
    800079bc:	00002a37          	lui	s4,0x2
    800079c0:	00018ab7          	lui	s5,0x18
    800079c4:	000f4b37          	lui	s6,0xf4
    800079c8:	00989bb7          	lui	s7,0x989
    800079cc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    800079d0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    800079d4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    800079d8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    800079dc:	00148c9b          	addiw	s9,s1,1
    800079e0:	02500793          	li	a5,37
    800079e4:	01998933          	add	s2,s3,s9
    800079e8:	38f51263          	bne	a0,a5,80007d6c <__printf+0x434>
    800079ec:	00094783          	lbu	a5,0(s2)
    800079f0:	00078c9b          	sext.w	s9,a5
    800079f4:	1e078263          	beqz	a5,80007bd8 <__printf+0x2a0>
    800079f8:	0024849b          	addiw	s1,s1,2
    800079fc:	07000713          	li	a4,112
    80007a00:	00998933          	add	s2,s3,s1
    80007a04:	38e78a63          	beq	a5,a4,80007d98 <__printf+0x460>
    80007a08:	20f76863          	bltu	a4,a5,80007c18 <__printf+0x2e0>
    80007a0c:	42a78863          	beq	a5,a0,80007e3c <__printf+0x504>
    80007a10:	06400713          	li	a4,100
    80007a14:	40e79663          	bne	a5,a4,80007e20 <__printf+0x4e8>
    80007a18:	f7843783          	ld	a5,-136(s0)
    80007a1c:	0007a603          	lw	a2,0(a5)
    80007a20:	00878793          	addi	a5,a5,8
    80007a24:	f6f43c23          	sd	a5,-136(s0)
    80007a28:	42064a63          	bltz	a2,80007e5c <__printf+0x524>
    80007a2c:	00a00713          	li	a4,10
    80007a30:	02e677bb          	remuw	a5,a2,a4
    80007a34:	00002d97          	auipc	s11,0x2
    80007a38:	df4d8d93          	addi	s11,s11,-524 # 80009828 <digits>
    80007a3c:	00900593          	li	a1,9
    80007a40:	0006051b          	sext.w	a0,a2
    80007a44:	00000c93          	li	s9,0
    80007a48:	02079793          	slli	a5,a5,0x20
    80007a4c:	0207d793          	srli	a5,a5,0x20
    80007a50:	00fd87b3          	add	a5,s11,a5
    80007a54:	0007c783          	lbu	a5,0(a5)
    80007a58:	02e656bb          	divuw	a3,a2,a4
    80007a5c:	f8f40023          	sb	a5,-128(s0)
    80007a60:	14c5d863          	bge	a1,a2,80007bb0 <__printf+0x278>
    80007a64:	06300593          	li	a1,99
    80007a68:	00100c93          	li	s9,1
    80007a6c:	02e6f7bb          	remuw	a5,a3,a4
    80007a70:	02079793          	slli	a5,a5,0x20
    80007a74:	0207d793          	srli	a5,a5,0x20
    80007a78:	00fd87b3          	add	a5,s11,a5
    80007a7c:	0007c783          	lbu	a5,0(a5)
    80007a80:	02e6d73b          	divuw	a4,a3,a4
    80007a84:	f8f400a3          	sb	a5,-127(s0)
    80007a88:	12a5f463          	bgeu	a1,a0,80007bb0 <__printf+0x278>
    80007a8c:	00a00693          	li	a3,10
    80007a90:	00900593          	li	a1,9
    80007a94:	02d777bb          	remuw	a5,a4,a3
    80007a98:	02079793          	slli	a5,a5,0x20
    80007a9c:	0207d793          	srli	a5,a5,0x20
    80007aa0:	00fd87b3          	add	a5,s11,a5
    80007aa4:	0007c503          	lbu	a0,0(a5)
    80007aa8:	02d757bb          	divuw	a5,a4,a3
    80007aac:	f8a40123          	sb	a0,-126(s0)
    80007ab0:	48e5f263          	bgeu	a1,a4,80007f34 <__printf+0x5fc>
    80007ab4:	06300513          	li	a0,99
    80007ab8:	02d7f5bb          	remuw	a1,a5,a3
    80007abc:	02059593          	slli	a1,a1,0x20
    80007ac0:	0205d593          	srli	a1,a1,0x20
    80007ac4:	00bd85b3          	add	a1,s11,a1
    80007ac8:	0005c583          	lbu	a1,0(a1)
    80007acc:	02d7d7bb          	divuw	a5,a5,a3
    80007ad0:	f8b401a3          	sb	a1,-125(s0)
    80007ad4:	48e57263          	bgeu	a0,a4,80007f58 <__printf+0x620>
    80007ad8:	3e700513          	li	a0,999
    80007adc:	02d7f5bb          	remuw	a1,a5,a3
    80007ae0:	02059593          	slli	a1,a1,0x20
    80007ae4:	0205d593          	srli	a1,a1,0x20
    80007ae8:	00bd85b3          	add	a1,s11,a1
    80007aec:	0005c583          	lbu	a1,0(a1)
    80007af0:	02d7d7bb          	divuw	a5,a5,a3
    80007af4:	f8b40223          	sb	a1,-124(s0)
    80007af8:	46e57663          	bgeu	a0,a4,80007f64 <__printf+0x62c>
    80007afc:	02d7f5bb          	remuw	a1,a5,a3
    80007b00:	02059593          	slli	a1,a1,0x20
    80007b04:	0205d593          	srli	a1,a1,0x20
    80007b08:	00bd85b3          	add	a1,s11,a1
    80007b0c:	0005c583          	lbu	a1,0(a1)
    80007b10:	02d7d7bb          	divuw	a5,a5,a3
    80007b14:	f8b402a3          	sb	a1,-123(s0)
    80007b18:	46ea7863          	bgeu	s4,a4,80007f88 <__printf+0x650>
    80007b1c:	02d7f5bb          	remuw	a1,a5,a3
    80007b20:	02059593          	slli	a1,a1,0x20
    80007b24:	0205d593          	srli	a1,a1,0x20
    80007b28:	00bd85b3          	add	a1,s11,a1
    80007b2c:	0005c583          	lbu	a1,0(a1)
    80007b30:	02d7d7bb          	divuw	a5,a5,a3
    80007b34:	f8b40323          	sb	a1,-122(s0)
    80007b38:	3eeaf863          	bgeu	s5,a4,80007f28 <__printf+0x5f0>
    80007b3c:	02d7f5bb          	remuw	a1,a5,a3
    80007b40:	02059593          	slli	a1,a1,0x20
    80007b44:	0205d593          	srli	a1,a1,0x20
    80007b48:	00bd85b3          	add	a1,s11,a1
    80007b4c:	0005c583          	lbu	a1,0(a1)
    80007b50:	02d7d7bb          	divuw	a5,a5,a3
    80007b54:	f8b403a3          	sb	a1,-121(s0)
    80007b58:	42eb7e63          	bgeu	s6,a4,80007f94 <__printf+0x65c>
    80007b5c:	02d7f5bb          	remuw	a1,a5,a3
    80007b60:	02059593          	slli	a1,a1,0x20
    80007b64:	0205d593          	srli	a1,a1,0x20
    80007b68:	00bd85b3          	add	a1,s11,a1
    80007b6c:	0005c583          	lbu	a1,0(a1)
    80007b70:	02d7d7bb          	divuw	a5,a5,a3
    80007b74:	f8b40423          	sb	a1,-120(s0)
    80007b78:	42ebfc63          	bgeu	s7,a4,80007fb0 <__printf+0x678>
    80007b7c:	02079793          	slli	a5,a5,0x20
    80007b80:	0207d793          	srli	a5,a5,0x20
    80007b84:	00fd8db3          	add	s11,s11,a5
    80007b88:	000dc703          	lbu	a4,0(s11)
    80007b8c:	00a00793          	li	a5,10
    80007b90:	00900c93          	li	s9,9
    80007b94:	f8e404a3          	sb	a4,-119(s0)
    80007b98:	00065c63          	bgez	a2,80007bb0 <__printf+0x278>
    80007b9c:	f9040713          	addi	a4,s0,-112
    80007ba0:	00f70733          	add	a4,a4,a5
    80007ba4:	02d00693          	li	a3,45
    80007ba8:	fed70823          	sb	a3,-16(a4)
    80007bac:	00078c93          	mv	s9,a5
    80007bb0:	f8040793          	addi	a5,s0,-128
    80007bb4:	01978cb3          	add	s9,a5,s9
    80007bb8:	f7f40d13          	addi	s10,s0,-129
    80007bbc:	000cc503          	lbu	a0,0(s9)
    80007bc0:	fffc8c93          	addi	s9,s9,-1
    80007bc4:	00000097          	auipc	ra,0x0
    80007bc8:	b90080e7          	jalr	-1136(ra) # 80007754 <consputc>
    80007bcc:	ffac98e3          	bne	s9,s10,80007bbc <__printf+0x284>
    80007bd0:	00094503          	lbu	a0,0(s2)
    80007bd4:	e00514e3          	bnez	a0,800079dc <__printf+0xa4>
    80007bd8:	1a0c1663          	bnez	s8,80007d84 <__printf+0x44c>
    80007bdc:	08813083          	ld	ra,136(sp)
    80007be0:	08013403          	ld	s0,128(sp)
    80007be4:	07813483          	ld	s1,120(sp)
    80007be8:	07013903          	ld	s2,112(sp)
    80007bec:	06813983          	ld	s3,104(sp)
    80007bf0:	06013a03          	ld	s4,96(sp)
    80007bf4:	05813a83          	ld	s5,88(sp)
    80007bf8:	05013b03          	ld	s6,80(sp)
    80007bfc:	04813b83          	ld	s7,72(sp)
    80007c00:	04013c03          	ld	s8,64(sp)
    80007c04:	03813c83          	ld	s9,56(sp)
    80007c08:	03013d03          	ld	s10,48(sp)
    80007c0c:	02813d83          	ld	s11,40(sp)
    80007c10:	0d010113          	addi	sp,sp,208
    80007c14:	00008067          	ret
    80007c18:	07300713          	li	a4,115
    80007c1c:	1ce78a63          	beq	a5,a4,80007df0 <__printf+0x4b8>
    80007c20:	07800713          	li	a4,120
    80007c24:	1ee79e63          	bne	a5,a4,80007e20 <__printf+0x4e8>
    80007c28:	f7843783          	ld	a5,-136(s0)
    80007c2c:	0007a703          	lw	a4,0(a5)
    80007c30:	00878793          	addi	a5,a5,8
    80007c34:	f6f43c23          	sd	a5,-136(s0)
    80007c38:	28074263          	bltz	a4,80007ebc <__printf+0x584>
    80007c3c:	00002d97          	auipc	s11,0x2
    80007c40:	becd8d93          	addi	s11,s11,-1044 # 80009828 <digits>
    80007c44:	00f77793          	andi	a5,a4,15
    80007c48:	00fd87b3          	add	a5,s11,a5
    80007c4c:	0007c683          	lbu	a3,0(a5)
    80007c50:	00f00613          	li	a2,15
    80007c54:	0007079b          	sext.w	a5,a4
    80007c58:	f8d40023          	sb	a3,-128(s0)
    80007c5c:	0047559b          	srliw	a1,a4,0x4
    80007c60:	0047569b          	srliw	a3,a4,0x4
    80007c64:	00000c93          	li	s9,0
    80007c68:	0ee65063          	bge	a2,a4,80007d48 <__printf+0x410>
    80007c6c:	00f6f693          	andi	a3,a3,15
    80007c70:	00dd86b3          	add	a3,s11,a3
    80007c74:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80007c78:	0087d79b          	srliw	a5,a5,0x8
    80007c7c:	00100c93          	li	s9,1
    80007c80:	f8d400a3          	sb	a3,-127(s0)
    80007c84:	0cb67263          	bgeu	a2,a1,80007d48 <__printf+0x410>
    80007c88:	00f7f693          	andi	a3,a5,15
    80007c8c:	00dd86b3          	add	a3,s11,a3
    80007c90:	0006c583          	lbu	a1,0(a3)
    80007c94:	00f00613          	li	a2,15
    80007c98:	0047d69b          	srliw	a3,a5,0x4
    80007c9c:	f8b40123          	sb	a1,-126(s0)
    80007ca0:	0047d593          	srli	a1,a5,0x4
    80007ca4:	28f67e63          	bgeu	a2,a5,80007f40 <__printf+0x608>
    80007ca8:	00f6f693          	andi	a3,a3,15
    80007cac:	00dd86b3          	add	a3,s11,a3
    80007cb0:	0006c503          	lbu	a0,0(a3)
    80007cb4:	0087d813          	srli	a6,a5,0x8
    80007cb8:	0087d69b          	srliw	a3,a5,0x8
    80007cbc:	f8a401a3          	sb	a0,-125(s0)
    80007cc0:	28b67663          	bgeu	a2,a1,80007f4c <__printf+0x614>
    80007cc4:	00f6f693          	andi	a3,a3,15
    80007cc8:	00dd86b3          	add	a3,s11,a3
    80007ccc:	0006c583          	lbu	a1,0(a3)
    80007cd0:	00c7d513          	srli	a0,a5,0xc
    80007cd4:	00c7d69b          	srliw	a3,a5,0xc
    80007cd8:	f8b40223          	sb	a1,-124(s0)
    80007cdc:	29067a63          	bgeu	a2,a6,80007f70 <__printf+0x638>
    80007ce0:	00f6f693          	andi	a3,a3,15
    80007ce4:	00dd86b3          	add	a3,s11,a3
    80007ce8:	0006c583          	lbu	a1,0(a3)
    80007cec:	0107d813          	srli	a6,a5,0x10
    80007cf0:	0107d69b          	srliw	a3,a5,0x10
    80007cf4:	f8b402a3          	sb	a1,-123(s0)
    80007cf8:	28a67263          	bgeu	a2,a0,80007f7c <__printf+0x644>
    80007cfc:	00f6f693          	andi	a3,a3,15
    80007d00:	00dd86b3          	add	a3,s11,a3
    80007d04:	0006c683          	lbu	a3,0(a3)
    80007d08:	0147d79b          	srliw	a5,a5,0x14
    80007d0c:	f8d40323          	sb	a3,-122(s0)
    80007d10:	21067663          	bgeu	a2,a6,80007f1c <__printf+0x5e4>
    80007d14:	02079793          	slli	a5,a5,0x20
    80007d18:	0207d793          	srli	a5,a5,0x20
    80007d1c:	00fd8db3          	add	s11,s11,a5
    80007d20:	000dc683          	lbu	a3,0(s11)
    80007d24:	00800793          	li	a5,8
    80007d28:	00700c93          	li	s9,7
    80007d2c:	f8d403a3          	sb	a3,-121(s0)
    80007d30:	00075c63          	bgez	a4,80007d48 <__printf+0x410>
    80007d34:	f9040713          	addi	a4,s0,-112
    80007d38:	00f70733          	add	a4,a4,a5
    80007d3c:	02d00693          	li	a3,45
    80007d40:	fed70823          	sb	a3,-16(a4)
    80007d44:	00078c93          	mv	s9,a5
    80007d48:	f8040793          	addi	a5,s0,-128
    80007d4c:	01978cb3          	add	s9,a5,s9
    80007d50:	f7f40d13          	addi	s10,s0,-129
    80007d54:	000cc503          	lbu	a0,0(s9)
    80007d58:	fffc8c93          	addi	s9,s9,-1
    80007d5c:	00000097          	auipc	ra,0x0
    80007d60:	9f8080e7          	jalr	-1544(ra) # 80007754 <consputc>
    80007d64:	ff9d18e3          	bne	s10,s9,80007d54 <__printf+0x41c>
    80007d68:	0100006f          	j	80007d78 <__printf+0x440>
    80007d6c:	00000097          	auipc	ra,0x0
    80007d70:	9e8080e7          	jalr	-1560(ra) # 80007754 <consputc>
    80007d74:	000c8493          	mv	s1,s9
    80007d78:	00094503          	lbu	a0,0(s2)
    80007d7c:	c60510e3          	bnez	a0,800079dc <__printf+0xa4>
    80007d80:	e40c0ee3          	beqz	s8,80007bdc <__printf+0x2a4>
    80007d84:	00005517          	auipc	a0,0x5
    80007d88:	0fc50513          	addi	a0,a0,252 # 8000ce80 <pr>
    80007d8c:	00001097          	auipc	ra,0x1
    80007d90:	94c080e7          	jalr	-1716(ra) # 800086d8 <release>
    80007d94:	e49ff06f          	j	80007bdc <__printf+0x2a4>
    80007d98:	f7843783          	ld	a5,-136(s0)
    80007d9c:	03000513          	li	a0,48
    80007da0:	01000d13          	li	s10,16
    80007da4:	00878713          	addi	a4,a5,8
    80007da8:	0007bc83          	ld	s9,0(a5)
    80007dac:	f6e43c23          	sd	a4,-136(s0)
    80007db0:	00000097          	auipc	ra,0x0
    80007db4:	9a4080e7          	jalr	-1628(ra) # 80007754 <consputc>
    80007db8:	07800513          	li	a0,120
    80007dbc:	00000097          	auipc	ra,0x0
    80007dc0:	998080e7          	jalr	-1640(ra) # 80007754 <consputc>
    80007dc4:	00002d97          	auipc	s11,0x2
    80007dc8:	a64d8d93          	addi	s11,s11,-1436 # 80009828 <digits>
    80007dcc:	03ccd793          	srli	a5,s9,0x3c
    80007dd0:	00fd87b3          	add	a5,s11,a5
    80007dd4:	0007c503          	lbu	a0,0(a5)
    80007dd8:	fffd0d1b          	addiw	s10,s10,-1
    80007ddc:	004c9c93          	slli	s9,s9,0x4
    80007de0:	00000097          	auipc	ra,0x0
    80007de4:	974080e7          	jalr	-1676(ra) # 80007754 <consputc>
    80007de8:	fe0d12e3          	bnez	s10,80007dcc <__printf+0x494>
    80007dec:	f8dff06f          	j	80007d78 <__printf+0x440>
    80007df0:	f7843783          	ld	a5,-136(s0)
    80007df4:	0007bc83          	ld	s9,0(a5)
    80007df8:	00878793          	addi	a5,a5,8
    80007dfc:	f6f43c23          	sd	a5,-136(s0)
    80007e00:	000c9a63          	bnez	s9,80007e14 <__printf+0x4dc>
    80007e04:	1080006f          	j	80007f0c <__printf+0x5d4>
    80007e08:	001c8c93          	addi	s9,s9,1
    80007e0c:	00000097          	auipc	ra,0x0
    80007e10:	948080e7          	jalr	-1720(ra) # 80007754 <consputc>
    80007e14:	000cc503          	lbu	a0,0(s9)
    80007e18:	fe0518e3          	bnez	a0,80007e08 <__printf+0x4d0>
    80007e1c:	f5dff06f          	j	80007d78 <__printf+0x440>
    80007e20:	02500513          	li	a0,37
    80007e24:	00000097          	auipc	ra,0x0
    80007e28:	930080e7          	jalr	-1744(ra) # 80007754 <consputc>
    80007e2c:	000c8513          	mv	a0,s9
    80007e30:	00000097          	auipc	ra,0x0
    80007e34:	924080e7          	jalr	-1756(ra) # 80007754 <consputc>
    80007e38:	f41ff06f          	j	80007d78 <__printf+0x440>
    80007e3c:	02500513          	li	a0,37
    80007e40:	00000097          	auipc	ra,0x0
    80007e44:	914080e7          	jalr	-1772(ra) # 80007754 <consputc>
    80007e48:	f31ff06f          	j	80007d78 <__printf+0x440>
    80007e4c:	00030513          	mv	a0,t1
    80007e50:	00000097          	auipc	ra,0x0
    80007e54:	7bc080e7          	jalr	1980(ra) # 8000860c <acquire>
    80007e58:	b4dff06f          	j	800079a4 <__printf+0x6c>
    80007e5c:	40c0053b          	negw	a0,a2
    80007e60:	00a00713          	li	a4,10
    80007e64:	02e576bb          	remuw	a3,a0,a4
    80007e68:	00002d97          	auipc	s11,0x2
    80007e6c:	9c0d8d93          	addi	s11,s11,-1600 # 80009828 <digits>
    80007e70:	ff700593          	li	a1,-9
    80007e74:	02069693          	slli	a3,a3,0x20
    80007e78:	0206d693          	srli	a3,a3,0x20
    80007e7c:	00dd86b3          	add	a3,s11,a3
    80007e80:	0006c683          	lbu	a3,0(a3)
    80007e84:	02e557bb          	divuw	a5,a0,a4
    80007e88:	f8d40023          	sb	a3,-128(s0)
    80007e8c:	10b65e63          	bge	a2,a1,80007fa8 <__printf+0x670>
    80007e90:	06300593          	li	a1,99
    80007e94:	02e7f6bb          	remuw	a3,a5,a4
    80007e98:	02069693          	slli	a3,a3,0x20
    80007e9c:	0206d693          	srli	a3,a3,0x20
    80007ea0:	00dd86b3          	add	a3,s11,a3
    80007ea4:	0006c683          	lbu	a3,0(a3)
    80007ea8:	02e7d73b          	divuw	a4,a5,a4
    80007eac:	00200793          	li	a5,2
    80007eb0:	f8d400a3          	sb	a3,-127(s0)
    80007eb4:	bca5ece3          	bltu	a1,a0,80007a8c <__printf+0x154>
    80007eb8:	ce5ff06f          	j	80007b9c <__printf+0x264>
    80007ebc:	40e007bb          	negw	a5,a4
    80007ec0:	00002d97          	auipc	s11,0x2
    80007ec4:	968d8d93          	addi	s11,s11,-1688 # 80009828 <digits>
    80007ec8:	00f7f693          	andi	a3,a5,15
    80007ecc:	00dd86b3          	add	a3,s11,a3
    80007ed0:	0006c583          	lbu	a1,0(a3)
    80007ed4:	ff100613          	li	a2,-15
    80007ed8:	0047d69b          	srliw	a3,a5,0x4
    80007edc:	f8b40023          	sb	a1,-128(s0)
    80007ee0:	0047d59b          	srliw	a1,a5,0x4
    80007ee4:	0ac75e63          	bge	a4,a2,80007fa0 <__printf+0x668>
    80007ee8:	00f6f693          	andi	a3,a3,15
    80007eec:	00dd86b3          	add	a3,s11,a3
    80007ef0:	0006c603          	lbu	a2,0(a3)
    80007ef4:	00f00693          	li	a3,15
    80007ef8:	0087d79b          	srliw	a5,a5,0x8
    80007efc:	f8c400a3          	sb	a2,-127(s0)
    80007f00:	d8b6e4e3          	bltu	a3,a1,80007c88 <__printf+0x350>
    80007f04:	00200793          	li	a5,2
    80007f08:	e2dff06f          	j	80007d34 <__printf+0x3fc>
    80007f0c:	00002c97          	auipc	s9,0x2
    80007f10:	8fcc8c93          	addi	s9,s9,-1796 # 80009808 <CONSOLE_STATUS+0x7f8>
    80007f14:	02800513          	li	a0,40
    80007f18:	ef1ff06f          	j	80007e08 <__printf+0x4d0>
    80007f1c:	00700793          	li	a5,7
    80007f20:	00600c93          	li	s9,6
    80007f24:	e0dff06f          	j	80007d30 <__printf+0x3f8>
    80007f28:	00700793          	li	a5,7
    80007f2c:	00600c93          	li	s9,6
    80007f30:	c69ff06f          	j	80007b98 <__printf+0x260>
    80007f34:	00300793          	li	a5,3
    80007f38:	00200c93          	li	s9,2
    80007f3c:	c5dff06f          	j	80007b98 <__printf+0x260>
    80007f40:	00300793          	li	a5,3
    80007f44:	00200c93          	li	s9,2
    80007f48:	de9ff06f          	j	80007d30 <__printf+0x3f8>
    80007f4c:	00400793          	li	a5,4
    80007f50:	00300c93          	li	s9,3
    80007f54:	dddff06f          	j	80007d30 <__printf+0x3f8>
    80007f58:	00400793          	li	a5,4
    80007f5c:	00300c93          	li	s9,3
    80007f60:	c39ff06f          	j	80007b98 <__printf+0x260>
    80007f64:	00500793          	li	a5,5
    80007f68:	00400c93          	li	s9,4
    80007f6c:	c2dff06f          	j	80007b98 <__printf+0x260>
    80007f70:	00500793          	li	a5,5
    80007f74:	00400c93          	li	s9,4
    80007f78:	db9ff06f          	j	80007d30 <__printf+0x3f8>
    80007f7c:	00600793          	li	a5,6
    80007f80:	00500c93          	li	s9,5
    80007f84:	dadff06f          	j	80007d30 <__printf+0x3f8>
    80007f88:	00600793          	li	a5,6
    80007f8c:	00500c93          	li	s9,5
    80007f90:	c09ff06f          	j	80007b98 <__printf+0x260>
    80007f94:	00800793          	li	a5,8
    80007f98:	00700c93          	li	s9,7
    80007f9c:	bfdff06f          	j	80007b98 <__printf+0x260>
    80007fa0:	00100793          	li	a5,1
    80007fa4:	d91ff06f          	j	80007d34 <__printf+0x3fc>
    80007fa8:	00100793          	li	a5,1
    80007fac:	bf1ff06f          	j	80007b9c <__printf+0x264>
    80007fb0:	00900793          	li	a5,9
    80007fb4:	00800c93          	li	s9,8
    80007fb8:	be1ff06f          	j	80007b98 <__printf+0x260>
    80007fbc:	00002517          	auipc	a0,0x2
    80007fc0:	85450513          	addi	a0,a0,-1964 # 80009810 <CONSOLE_STATUS+0x800>
    80007fc4:	00000097          	auipc	ra,0x0
    80007fc8:	918080e7          	jalr	-1768(ra) # 800078dc <panic>

0000000080007fcc <printfinit>:
    80007fcc:	fe010113          	addi	sp,sp,-32
    80007fd0:	00813823          	sd	s0,16(sp)
    80007fd4:	00913423          	sd	s1,8(sp)
    80007fd8:	00113c23          	sd	ra,24(sp)
    80007fdc:	02010413          	addi	s0,sp,32
    80007fe0:	00005497          	auipc	s1,0x5
    80007fe4:	ea048493          	addi	s1,s1,-352 # 8000ce80 <pr>
    80007fe8:	00048513          	mv	a0,s1
    80007fec:	00002597          	auipc	a1,0x2
    80007ff0:	83458593          	addi	a1,a1,-1996 # 80009820 <CONSOLE_STATUS+0x810>
    80007ff4:	00000097          	auipc	ra,0x0
    80007ff8:	5f4080e7          	jalr	1524(ra) # 800085e8 <initlock>
    80007ffc:	01813083          	ld	ra,24(sp)
    80008000:	01013403          	ld	s0,16(sp)
    80008004:	0004ac23          	sw	zero,24(s1)
    80008008:	00813483          	ld	s1,8(sp)
    8000800c:	02010113          	addi	sp,sp,32
    80008010:	00008067          	ret

0000000080008014 <uartinit>:
    80008014:	ff010113          	addi	sp,sp,-16
    80008018:	00813423          	sd	s0,8(sp)
    8000801c:	01010413          	addi	s0,sp,16
    80008020:	100007b7          	lui	a5,0x10000
    80008024:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80008028:	f8000713          	li	a4,-128
    8000802c:	00e781a3          	sb	a4,3(a5)
    80008030:	00300713          	li	a4,3
    80008034:	00e78023          	sb	a4,0(a5)
    80008038:	000780a3          	sb	zero,1(a5)
    8000803c:	00e781a3          	sb	a4,3(a5)
    80008040:	00700693          	li	a3,7
    80008044:	00d78123          	sb	a3,2(a5)
    80008048:	00e780a3          	sb	a4,1(a5)
    8000804c:	00813403          	ld	s0,8(sp)
    80008050:	01010113          	addi	sp,sp,16
    80008054:	00008067          	ret

0000000080008058 <uartputc>:
    80008058:	00004797          	auipc	a5,0x4
    8000805c:	ab07a783          	lw	a5,-1360(a5) # 8000bb08 <panicked>
    80008060:	00078463          	beqz	a5,80008068 <uartputc+0x10>
    80008064:	0000006f          	j	80008064 <uartputc+0xc>
    80008068:	fd010113          	addi	sp,sp,-48
    8000806c:	02813023          	sd	s0,32(sp)
    80008070:	00913c23          	sd	s1,24(sp)
    80008074:	01213823          	sd	s2,16(sp)
    80008078:	01313423          	sd	s3,8(sp)
    8000807c:	02113423          	sd	ra,40(sp)
    80008080:	03010413          	addi	s0,sp,48
    80008084:	00004917          	auipc	s2,0x4
    80008088:	a8c90913          	addi	s2,s2,-1396 # 8000bb10 <uart_tx_r>
    8000808c:	00093783          	ld	a5,0(s2)
    80008090:	00004497          	auipc	s1,0x4
    80008094:	a8848493          	addi	s1,s1,-1400 # 8000bb18 <uart_tx_w>
    80008098:	0004b703          	ld	a4,0(s1)
    8000809c:	02078693          	addi	a3,a5,32
    800080a0:	00050993          	mv	s3,a0
    800080a4:	02e69c63          	bne	a3,a4,800080dc <uartputc+0x84>
    800080a8:	00001097          	auipc	ra,0x1
    800080ac:	834080e7          	jalr	-1996(ra) # 800088dc <push_on>
    800080b0:	00093783          	ld	a5,0(s2)
    800080b4:	0004b703          	ld	a4,0(s1)
    800080b8:	02078793          	addi	a5,a5,32
    800080bc:	00e79463          	bne	a5,a4,800080c4 <uartputc+0x6c>
    800080c0:	0000006f          	j	800080c0 <uartputc+0x68>
    800080c4:	00001097          	auipc	ra,0x1
    800080c8:	88c080e7          	jalr	-1908(ra) # 80008950 <pop_on>
    800080cc:	00093783          	ld	a5,0(s2)
    800080d0:	0004b703          	ld	a4,0(s1)
    800080d4:	02078693          	addi	a3,a5,32
    800080d8:	fce688e3          	beq	a3,a4,800080a8 <uartputc+0x50>
    800080dc:	01f77693          	andi	a3,a4,31
    800080e0:	00005597          	auipc	a1,0x5
    800080e4:	dc058593          	addi	a1,a1,-576 # 8000cea0 <uart_tx_buf>
    800080e8:	00d586b3          	add	a3,a1,a3
    800080ec:	00170713          	addi	a4,a4,1
    800080f0:	01368023          	sb	s3,0(a3)
    800080f4:	00e4b023          	sd	a4,0(s1)
    800080f8:	10000637          	lui	a2,0x10000
    800080fc:	02f71063          	bne	a4,a5,8000811c <uartputc+0xc4>
    80008100:	0340006f          	j	80008134 <uartputc+0xdc>
    80008104:	00074703          	lbu	a4,0(a4)
    80008108:	00f93023          	sd	a5,0(s2)
    8000810c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80008110:	00093783          	ld	a5,0(s2)
    80008114:	0004b703          	ld	a4,0(s1)
    80008118:	00f70e63          	beq	a4,a5,80008134 <uartputc+0xdc>
    8000811c:	00564683          	lbu	a3,5(a2)
    80008120:	01f7f713          	andi	a4,a5,31
    80008124:	00e58733          	add	a4,a1,a4
    80008128:	0206f693          	andi	a3,a3,32
    8000812c:	00178793          	addi	a5,a5,1
    80008130:	fc069ae3          	bnez	a3,80008104 <uartputc+0xac>
    80008134:	02813083          	ld	ra,40(sp)
    80008138:	02013403          	ld	s0,32(sp)
    8000813c:	01813483          	ld	s1,24(sp)
    80008140:	01013903          	ld	s2,16(sp)
    80008144:	00813983          	ld	s3,8(sp)
    80008148:	03010113          	addi	sp,sp,48
    8000814c:	00008067          	ret

0000000080008150 <uartputc_sync>:
    80008150:	ff010113          	addi	sp,sp,-16
    80008154:	00813423          	sd	s0,8(sp)
    80008158:	01010413          	addi	s0,sp,16
    8000815c:	00004717          	auipc	a4,0x4
    80008160:	9ac72703          	lw	a4,-1620(a4) # 8000bb08 <panicked>
    80008164:	02071663          	bnez	a4,80008190 <uartputc_sync+0x40>
    80008168:	00050793          	mv	a5,a0
    8000816c:	100006b7          	lui	a3,0x10000
    80008170:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80008174:	02077713          	andi	a4,a4,32
    80008178:	fe070ce3          	beqz	a4,80008170 <uartputc_sync+0x20>
    8000817c:	0ff7f793          	andi	a5,a5,255
    80008180:	00f68023          	sb	a5,0(a3)
    80008184:	00813403          	ld	s0,8(sp)
    80008188:	01010113          	addi	sp,sp,16
    8000818c:	00008067          	ret
    80008190:	0000006f          	j	80008190 <uartputc_sync+0x40>

0000000080008194 <uartstart>:
    80008194:	ff010113          	addi	sp,sp,-16
    80008198:	00813423          	sd	s0,8(sp)
    8000819c:	01010413          	addi	s0,sp,16
    800081a0:	00004617          	auipc	a2,0x4
    800081a4:	97060613          	addi	a2,a2,-1680 # 8000bb10 <uart_tx_r>
    800081a8:	00004517          	auipc	a0,0x4
    800081ac:	97050513          	addi	a0,a0,-1680 # 8000bb18 <uart_tx_w>
    800081b0:	00063783          	ld	a5,0(a2)
    800081b4:	00053703          	ld	a4,0(a0)
    800081b8:	04f70263          	beq	a4,a5,800081fc <uartstart+0x68>
    800081bc:	100005b7          	lui	a1,0x10000
    800081c0:	00005817          	auipc	a6,0x5
    800081c4:	ce080813          	addi	a6,a6,-800 # 8000cea0 <uart_tx_buf>
    800081c8:	01c0006f          	j	800081e4 <uartstart+0x50>
    800081cc:	0006c703          	lbu	a4,0(a3)
    800081d0:	00f63023          	sd	a5,0(a2)
    800081d4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800081d8:	00063783          	ld	a5,0(a2)
    800081dc:	00053703          	ld	a4,0(a0)
    800081e0:	00f70e63          	beq	a4,a5,800081fc <uartstart+0x68>
    800081e4:	01f7f713          	andi	a4,a5,31
    800081e8:	00e806b3          	add	a3,a6,a4
    800081ec:	0055c703          	lbu	a4,5(a1)
    800081f0:	00178793          	addi	a5,a5,1
    800081f4:	02077713          	andi	a4,a4,32
    800081f8:	fc071ae3          	bnez	a4,800081cc <uartstart+0x38>
    800081fc:	00813403          	ld	s0,8(sp)
    80008200:	01010113          	addi	sp,sp,16
    80008204:	00008067          	ret

0000000080008208 <uartgetc>:
    80008208:	ff010113          	addi	sp,sp,-16
    8000820c:	00813423          	sd	s0,8(sp)
    80008210:	01010413          	addi	s0,sp,16
    80008214:	10000737          	lui	a4,0x10000
    80008218:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000821c:	0017f793          	andi	a5,a5,1
    80008220:	00078c63          	beqz	a5,80008238 <uartgetc+0x30>
    80008224:	00074503          	lbu	a0,0(a4)
    80008228:	0ff57513          	andi	a0,a0,255
    8000822c:	00813403          	ld	s0,8(sp)
    80008230:	01010113          	addi	sp,sp,16
    80008234:	00008067          	ret
    80008238:	fff00513          	li	a0,-1
    8000823c:	ff1ff06f          	j	8000822c <uartgetc+0x24>

0000000080008240 <uartintr>:
    80008240:	100007b7          	lui	a5,0x10000
    80008244:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80008248:	0017f793          	andi	a5,a5,1
    8000824c:	0a078463          	beqz	a5,800082f4 <uartintr+0xb4>
    80008250:	fe010113          	addi	sp,sp,-32
    80008254:	00813823          	sd	s0,16(sp)
    80008258:	00913423          	sd	s1,8(sp)
    8000825c:	00113c23          	sd	ra,24(sp)
    80008260:	02010413          	addi	s0,sp,32
    80008264:	100004b7          	lui	s1,0x10000
    80008268:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000826c:	0ff57513          	andi	a0,a0,255
    80008270:	fffff097          	auipc	ra,0xfffff
    80008274:	534080e7          	jalr	1332(ra) # 800077a4 <consoleintr>
    80008278:	0054c783          	lbu	a5,5(s1)
    8000827c:	0017f793          	andi	a5,a5,1
    80008280:	fe0794e3          	bnez	a5,80008268 <uartintr+0x28>
    80008284:	00004617          	auipc	a2,0x4
    80008288:	88c60613          	addi	a2,a2,-1908 # 8000bb10 <uart_tx_r>
    8000828c:	00004517          	auipc	a0,0x4
    80008290:	88c50513          	addi	a0,a0,-1908 # 8000bb18 <uart_tx_w>
    80008294:	00063783          	ld	a5,0(a2)
    80008298:	00053703          	ld	a4,0(a0)
    8000829c:	04f70263          	beq	a4,a5,800082e0 <uartintr+0xa0>
    800082a0:	100005b7          	lui	a1,0x10000
    800082a4:	00005817          	auipc	a6,0x5
    800082a8:	bfc80813          	addi	a6,a6,-1028 # 8000cea0 <uart_tx_buf>
    800082ac:	01c0006f          	j	800082c8 <uartintr+0x88>
    800082b0:	0006c703          	lbu	a4,0(a3)
    800082b4:	00f63023          	sd	a5,0(a2)
    800082b8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800082bc:	00063783          	ld	a5,0(a2)
    800082c0:	00053703          	ld	a4,0(a0)
    800082c4:	00f70e63          	beq	a4,a5,800082e0 <uartintr+0xa0>
    800082c8:	01f7f713          	andi	a4,a5,31
    800082cc:	00e806b3          	add	a3,a6,a4
    800082d0:	0055c703          	lbu	a4,5(a1)
    800082d4:	00178793          	addi	a5,a5,1
    800082d8:	02077713          	andi	a4,a4,32
    800082dc:	fc071ae3          	bnez	a4,800082b0 <uartintr+0x70>
    800082e0:	01813083          	ld	ra,24(sp)
    800082e4:	01013403          	ld	s0,16(sp)
    800082e8:	00813483          	ld	s1,8(sp)
    800082ec:	02010113          	addi	sp,sp,32
    800082f0:	00008067          	ret
    800082f4:	00004617          	auipc	a2,0x4
    800082f8:	81c60613          	addi	a2,a2,-2020 # 8000bb10 <uart_tx_r>
    800082fc:	00004517          	auipc	a0,0x4
    80008300:	81c50513          	addi	a0,a0,-2020 # 8000bb18 <uart_tx_w>
    80008304:	00063783          	ld	a5,0(a2)
    80008308:	00053703          	ld	a4,0(a0)
    8000830c:	04f70263          	beq	a4,a5,80008350 <uartintr+0x110>
    80008310:	100005b7          	lui	a1,0x10000
    80008314:	00005817          	auipc	a6,0x5
    80008318:	b8c80813          	addi	a6,a6,-1140 # 8000cea0 <uart_tx_buf>
    8000831c:	01c0006f          	j	80008338 <uartintr+0xf8>
    80008320:	0006c703          	lbu	a4,0(a3)
    80008324:	00f63023          	sd	a5,0(a2)
    80008328:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000832c:	00063783          	ld	a5,0(a2)
    80008330:	00053703          	ld	a4,0(a0)
    80008334:	02f70063          	beq	a4,a5,80008354 <uartintr+0x114>
    80008338:	01f7f713          	andi	a4,a5,31
    8000833c:	00e806b3          	add	a3,a6,a4
    80008340:	0055c703          	lbu	a4,5(a1)
    80008344:	00178793          	addi	a5,a5,1
    80008348:	02077713          	andi	a4,a4,32
    8000834c:	fc071ae3          	bnez	a4,80008320 <uartintr+0xe0>
    80008350:	00008067          	ret
    80008354:	00008067          	ret

0000000080008358 <kinit>:
    80008358:	fc010113          	addi	sp,sp,-64
    8000835c:	02913423          	sd	s1,40(sp)
    80008360:	fffff7b7          	lui	a5,0xfffff
    80008364:	00006497          	auipc	s1,0x6
    80008368:	b5b48493          	addi	s1,s1,-1189 # 8000debf <end+0xfff>
    8000836c:	02813823          	sd	s0,48(sp)
    80008370:	01313c23          	sd	s3,24(sp)
    80008374:	00f4f4b3          	and	s1,s1,a5
    80008378:	02113c23          	sd	ra,56(sp)
    8000837c:	03213023          	sd	s2,32(sp)
    80008380:	01413823          	sd	s4,16(sp)
    80008384:	01513423          	sd	s5,8(sp)
    80008388:	04010413          	addi	s0,sp,64
    8000838c:	000017b7          	lui	a5,0x1
    80008390:	01100993          	li	s3,17
    80008394:	00f487b3          	add	a5,s1,a5
    80008398:	01b99993          	slli	s3,s3,0x1b
    8000839c:	06f9e063          	bltu	s3,a5,800083fc <kinit+0xa4>
    800083a0:	00005a97          	auipc	s5,0x5
    800083a4:	b20a8a93          	addi	s5,s5,-1248 # 8000cec0 <end>
    800083a8:	0754ec63          	bltu	s1,s5,80008420 <kinit+0xc8>
    800083ac:	0734fa63          	bgeu	s1,s3,80008420 <kinit+0xc8>
    800083b0:	00088a37          	lui	s4,0x88
    800083b4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800083b8:	00003917          	auipc	s2,0x3
    800083bc:	76890913          	addi	s2,s2,1896 # 8000bb20 <kmem>
    800083c0:	00ca1a13          	slli	s4,s4,0xc
    800083c4:	0140006f          	j	800083d8 <kinit+0x80>
    800083c8:	000017b7          	lui	a5,0x1
    800083cc:	00f484b3          	add	s1,s1,a5
    800083d0:	0554e863          	bltu	s1,s5,80008420 <kinit+0xc8>
    800083d4:	0534f663          	bgeu	s1,s3,80008420 <kinit+0xc8>
    800083d8:	00001637          	lui	a2,0x1
    800083dc:	00100593          	li	a1,1
    800083e0:	00048513          	mv	a0,s1
    800083e4:	00000097          	auipc	ra,0x0
    800083e8:	5e4080e7          	jalr	1508(ra) # 800089c8 <__memset>
    800083ec:	00093783          	ld	a5,0(s2)
    800083f0:	00f4b023          	sd	a5,0(s1)
    800083f4:	00993023          	sd	s1,0(s2)
    800083f8:	fd4498e3          	bne	s1,s4,800083c8 <kinit+0x70>
    800083fc:	03813083          	ld	ra,56(sp)
    80008400:	03013403          	ld	s0,48(sp)
    80008404:	02813483          	ld	s1,40(sp)
    80008408:	02013903          	ld	s2,32(sp)
    8000840c:	01813983          	ld	s3,24(sp)
    80008410:	01013a03          	ld	s4,16(sp)
    80008414:	00813a83          	ld	s5,8(sp)
    80008418:	04010113          	addi	sp,sp,64
    8000841c:	00008067          	ret
    80008420:	00001517          	auipc	a0,0x1
    80008424:	42050513          	addi	a0,a0,1056 # 80009840 <digits+0x18>
    80008428:	fffff097          	auipc	ra,0xfffff
    8000842c:	4b4080e7          	jalr	1204(ra) # 800078dc <panic>

0000000080008430 <freerange>:
    80008430:	fc010113          	addi	sp,sp,-64
    80008434:	000017b7          	lui	a5,0x1
    80008438:	02913423          	sd	s1,40(sp)
    8000843c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80008440:	009504b3          	add	s1,a0,s1
    80008444:	fffff537          	lui	a0,0xfffff
    80008448:	02813823          	sd	s0,48(sp)
    8000844c:	02113c23          	sd	ra,56(sp)
    80008450:	03213023          	sd	s2,32(sp)
    80008454:	01313c23          	sd	s3,24(sp)
    80008458:	01413823          	sd	s4,16(sp)
    8000845c:	01513423          	sd	s5,8(sp)
    80008460:	01613023          	sd	s6,0(sp)
    80008464:	04010413          	addi	s0,sp,64
    80008468:	00a4f4b3          	and	s1,s1,a0
    8000846c:	00f487b3          	add	a5,s1,a5
    80008470:	06f5e463          	bltu	a1,a5,800084d8 <freerange+0xa8>
    80008474:	00005a97          	auipc	s5,0x5
    80008478:	a4ca8a93          	addi	s5,s5,-1460 # 8000cec0 <end>
    8000847c:	0954e263          	bltu	s1,s5,80008500 <freerange+0xd0>
    80008480:	01100993          	li	s3,17
    80008484:	01b99993          	slli	s3,s3,0x1b
    80008488:	0734fc63          	bgeu	s1,s3,80008500 <freerange+0xd0>
    8000848c:	00058a13          	mv	s4,a1
    80008490:	00003917          	auipc	s2,0x3
    80008494:	69090913          	addi	s2,s2,1680 # 8000bb20 <kmem>
    80008498:	00002b37          	lui	s6,0x2
    8000849c:	0140006f          	j	800084b0 <freerange+0x80>
    800084a0:	000017b7          	lui	a5,0x1
    800084a4:	00f484b3          	add	s1,s1,a5
    800084a8:	0554ec63          	bltu	s1,s5,80008500 <freerange+0xd0>
    800084ac:	0534fa63          	bgeu	s1,s3,80008500 <freerange+0xd0>
    800084b0:	00001637          	lui	a2,0x1
    800084b4:	00100593          	li	a1,1
    800084b8:	00048513          	mv	a0,s1
    800084bc:	00000097          	auipc	ra,0x0
    800084c0:	50c080e7          	jalr	1292(ra) # 800089c8 <__memset>
    800084c4:	00093703          	ld	a4,0(s2)
    800084c8:	016487b3          	add	a5,s1,s6
    800084cc:	00e4b023          	sd	a4,0(s1)
    800084d0:	00993023          	sd	s1,0(s2)
    800084d4:	fcfa76e3          	bgeu	s4,a5,800084a0 <freerange+0x70>
    800084d8:	03813083          	ld	ra,56(sp)
    800084dc:	03013403          	ld	s0,48(sp)
    800084e0:	02813483          	ld	s1,40(sp)
    800084e4:	02013903          	ld	s2,32(sp)
    800084e8:	01813983          	ld	s3,24(sp)
    800084ec:	01013a03          	ld	s4,16(sp)
    800084f0:	00813a83          	ld	s5,8(sp)
    800084f4:	00013b03          	ld	s6,0(sp)
    800084f8:	04010113          	addi	sp,sp,64
    800084fc:	00008067          	ret
    80008500:	00001517          	auipc	a0,0x1
    80008504:	34050513          	addi	a0,a0,832 # 80009840 <digits+0x18>
    80008508:	fffff097          	auipc	ra,0xfffff
    8000850c:	3d4080e7          	jalr	980(ra) # 800078dc <panic>

0000000080008510 <kfree>:
    80008510:	fe010113          	addi	sp,sp,-32
    80008514:	00813823          	sd	s0,16(sp)
    80008518:	00113c23          	sd	ra,24(sp)
    8000851c:	00913423          	sd	s1,8(sp)
    80008520:	02010413          	addi	s0,sp,32
    80008524:	03451793          	slli	a5,a0,0x34
    80008528:	04079c63          	bnez	a5,80008580 <kfree+0x70>
    8000852c:	00005797          	auipc	a5,0x5
    80008530:	99478793          	addi	a5,a5,-1644 # 8000cec0 <end>
    80008534:	00050493          	mv	s1,a0
    80008538:	04f56463          	bltu	a0,a5,80008580 <kfree+0x70>
    8000853c:	01100793          	li	a5,17
    80008540:	01b79793          	slli	a5,a5,0x1b
    80008544:	02f57e63          	bgeu	a0,a5,80008580 <kfree+0x70>
    80008548:	00001637          	lui	a2,0x1
    8000854c:	00100593          	li	a1,1
    80008550:	00000097          	auipc	ra,0x0
    80008554:	478080e7          	jalr	1144(ra) # 800089c8 <__memset>
    80008558:	00003797          	auipc	a5,0x3
    8000855c:	5c878793          	addi	a5,a5,1480 # 8000bb20 <kmem>
    80008560:	0007b703          	ld	a4,0(a5)
    80008564:	01813083          	ld	ra,24(sp)
    80008568:	01013403          	ld	s0,16(sp)
    8000856c:	00e4b023          	sd	a4,0(s1)
    80008570:	0097b023          	sd	s1,0(a5)
    80008574:	00813483          	ld	s1,8(sp)
    80008578:	02010113          	addi	sp,sp,32
    8000857c:	00008067          	ret
    80008580:	00001517          	auipc	a0,0x1
    80008584:	2c050513          	addi	a0,a0,704 # 80009840 <digits+0x18>
    80008588:	fffff097          	auipc	ra,0xfffff
    8000858c:	354080e7          	jalr	852(ra) # 800078dc <panic>

0000000080008590 <kalloc>:
    80008590:	fe010113          	addi	sp,sp,-32
    80008594:	00813823          	sd	s0,16(sp)
    80008598:	00913423          	sd	s1,8(sp)
    8000859c:	00113c23          	sd	ra,24(sp)
    800085a0:	02010413          	addi	s0,sp,32
    800085a4:	00003797          	auipc	a5,0x3
    800085a8:	57c78793          	addi	a5,a5,1404 # 8000bb20 <kmem>
    800085ac:	0007b483          	ld	s1,0(a5)
    800085b0:	02048063          	beqz	s1,800085d0 <kalloc+0x40>
    800085b4:	0004b703          	ld	a4,0(s1)
    800085b8:	00001637          	lui	a2,0x1
    800085bc:	00500593          	li	a1,5
    800085c0:	00048513          	mv	a0,s1
    800085c4:	00e7b023          	sd	a4,0(a5)
    800085c8:	00000097          	auipc	ra,0x0
    800085cc:	400080e7          	jalr	1024(ra) # 800089c8 <__memset>
    800085d0:	01813083          	ld	ra,24(sp)
    800085d4:	01013403          	ld	s0,16(sp)
    800085d8:	00048513          	mv	a0,s1
    800085dc:	00813483          	ld	s1,8(sp)
    800085e0:	02010113          	addi	sp,sp,32
    800085e4:	00008067          	ret

00000000800085e8 <initlock>:
    800085e8:	ff010113          	addi	sp,sp,-16
    800085ec:	00813423          	sd	s0,8(sp)
    800085f0:	01010413          	addi	s0,sp,16
    800085f4:	00813403          	ld	s0,8(sp)
    800085f8:	00b53423          	sd	a1,8(a0)
    800085fc:	00052023          	sw	zero,0(a0)
    80008600:	00053823          	sd	zero,16(a0)
    80008604:	01010113          	addi	sp,sp,16
    80008608:	00008067          	ret

000000008000860c <acquire>:
    8000860c:	fe010113          	addi	sp,sp,-32
    80008610:	00813823          	sd	s0,16(sp)
    80008614:	00913423          	sd	s1,8(sp)
    80008618:	00113c23          	sd	ra,24(sp)
    8000861c:	01213023          	sd	s2,0(sp)
    80008620:	02010413          	addi	s0,sp,32
    80008624:	00050493          	mv	s1,a0
    80008628:	10002973          	csrr	s2,sstatus
    8000862c:	100027f3          	csrr	a5,sstatus
    80008630:	ffd7f793          	andi	a5,a5,-3
    80008634:	10079073          	csrw	sstatus,a5
    80008638:	fffff097          	auipc	ra,0xfffff
    8000863c:	8ec080e7          	jalr	-1812(ra) # 80006f24 <mycpu>
    80008640:	07852783          	lw	a5,120(a0)
    80008644:	06078e63          	beqz	a5,800086c0 <acquire+0xb4>
    80008648:	fffff097          	auipc	ra,0xfffff
    8000864c:	8dc080e7          	jalr	-1828(ra) # 80006f24 <mycpu>
    80008650:	07852783          	lw	a5,120(a0)
    80008654:	0004a703          	lw	a4,0(s1)
    80008658:	0017879b          	addiw	a5,a5,1
    8000865c:	06f52c23          	sw	a5,120(a0)
    80008660:	04071063          	bnez	a4,800086a0 <acquire+0x94>
    80008664:	00100713          	li	a4,1
    80008668:	00070793          	mv	a5,a4
    8000866c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80008670:	0007879b          	sext.w	a5,a5
    80008674:	fe079ae3          	bnez	a5,80008668 <acquire+0x5c>
    80008678:	0ff0000f          	fence
    8000867c:	fffff097          	auipc	ra,0xfffff
    80008680:	8a8080e7          	jalr	-1880(ra) # 80006f24 <mycpu>
    80008684:	01813083          	ld	ra,24(sp)
    80008688:	01013403          	ld	s0,16(sp)
    8000868c:	00a4b823          	sd	a0,16(s1)
    80008690:	00013903          	ld	s2,0(sp)
    80008694:	00813483          	ld	s1,8(sp)
    80008698:	02010113          	addi	sp,sp,32
    8000869c:	00008067          	ret
    800086a0:	0104b903          	ld	s2,16(s1)
    800086a4:	fffff097          	auipc	ra,0xfffff
    800086a8:	880080e7          	jalr	-1920(ra) # 80006f24 <mycpu>
    800086ac:	faa91ce3          	bne	s2,a0,80008664 <acquire+0x58>
    800086b0:	00001517          	auipc	a0,0x1
    800086b4:	19850513          	addi	a0,a0,408 # 80009848 <digits+0x20>
    800086b8:	fffff097          	auipc	ra,0xfffff
    800086bc:	224080e7          	jalr	548(ra) # 800078dc <panic>
    800086c0:	00195913          	srli	s2,s2,0x1
    800086c4:	fffff097          	auipc	ra,0xfffff
    800086c8:	860080e7          	jalr	-1952(ra) # 80006f24 <mycpu>
    800086cc:	00197913          	andi	s2,s2,1
    800086d0:	07252e23          	sw	s2,124(a0)
    800086d4:	f75ff06f          	j	80008648 <acquire+0x3c>

00000000800086d8 <release>:
    800086d8:	fe010113          	addi	sp,sp,-32
    800086dc:	00813823          	sd	s0,16(sp)
    800086e0:	00113c23          	sd	ra,24(sp)
    800086e4:	00913423          	sd	s1,8(sp)
    800086e8:	01213023          	sd	s2,0(sp)
    800086ec:	02010413          	addi	s0,sp,32
    800086f0:	00052783          	lw	a5,0(a0)
    800086f4:	00079a63          	bnez	a5,80008708 <release+0x30>
    800086f8:	00001517          	auipc	a0,0x1
    800086fc:	15850513          	addi	a0,a0,344 # 80009850 <digits+0x28>
    80008700:	fffff097          	auipc	ra,0xfffff
    80008704:	1dc080e7          	jalr	476(ra) # 800078dc <panic>
    80008708:	01053903          	ld	s2,16(a0)
    8000870c:	00050493          	mv	s1,a0
    80008710:	fffff097          	auipc	ra,0xfffff
    80008714:	814080e7          	jalr	-2028(ra) # 80006f24 <mycpu>
    80008718:	fea910e3          	bne	s2,a0,800086f8 <release+0x20>
    8000871c:	0004b823          	sd	zero,16(s1)
    80008720:	0ff0000f          	fence
    80008724:	0f50000f          	fence	iorw,ow
    80008728:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000872c:	ffffe097          	auipc	ra,0xffffe
    80008730:	7f8080e7          	jalr	2040(ra) # 80006f24 <mycpu>
    80008734:	100027f3          	csrr	a5,sstatus
    80008738:	0027f793          	andi	a5,a5,2
    8000873c:	04079a63          	bnez	a5,80008790 <release+0xb8>
    80008740:	07852783          	lw	a5,120(a0)
    80008744:	02f05e63          	blez	a5,80008780 <release+0xa8>
    80008748:	fff7871b          	addiw	a4,a5,-1
    8000874c:	06e52c23          	sw	a4,120(a0)
    80008750:	00071c63          	bnez	a4,80008768 <release+0x90>
    80008754:	07c52783          	lw	a5,124(a0)
    80008758:	00078863          	beqz	a5,80008768 <release+0x90>
    8000875c:	100027f3          	csrr	a5,sstatus
    80008760:	0027e793          	ori	a5,a5,2
    80008764:	10079073          	csrw	sstatus,a5
    80008768:	01813083          	ld	ra,24(sp)
    8000876c:	01013403          	ld	s0,16(sp)
    80008770:	00813483          	ld	s1,8(sp)
    80008774:	00013903          	ld	s2,0(sp)
    80008778:	02010113          	addi	sp,sp,32
    8000877c:	00008067          	ret
    80008780:	00001517          	auipc	a0,0x1
    80008784:	0f050513          	addi	a0,a0,240 # 80009870 <digits+0x48>
    80008788:	fffff097          	auipc	ra,0xfffff
    8000878c:	154080e7          	jalr	340(ra) # 800078dc <panic>
    80008790:	00001517          	auipc	a0,0x1
    80008794:	0c850513          	addi	a0,a0,200 # 80009858 <digits+0x30>
    80008798:	fffff097          	auipc	ra,0xfffff
    8000879c:	144080e7          	jalr	324(ra) # 800078dc <panic>

00000000800087a0 <holding>:
    800087a0:	00052783          	lw	a5,0(a0)
    800087a4:	00079663          	bnez	a5,800087b0 <holding+0x10>
    800087a8:	00000513          	li	a0,0
    800087ac:	00008067          	ret
    800087b0:	fe010113          	addi	sp,sp,-32
    800087b4:	00813823          	sd	s0,16(sp)
    800087b8:	00913423          	sd	s1,8(sp)
    800087bc:	00113c23          	sd	ra,24(sp)
    800087c0:	02010413          	addi	s0,sp,32
    800087c4:	01053483          	ld	s1,16(a0)
    800087c8:	ffffe097          	auipc	ra,0xffffe
    800087cc:	75c080e7          	jalr	1884(ra) # 80006f24 <mycpu>
    800087d0:	01813083          	ld	ra,24(sp)
    800087d4:	01013403          	ld	s0,16(sp)
    800087d8:	40a48533          	sub	a0,s1,a0
    800087dc:	00153513          	seqz	a0,a0
    800087e0:	00813483          	ld	s1,8(sp)
    800087e4:	02010113          	addi	sp,sp,32
    800087e8:	00008067          	ret

00000000800087ec <push_off>:
    800087ec:	fe010113          	addi	sp,sp,-32
    800087f0:	00813823          	sd	s0,16(sp)
    800087f4:	00113c23          	sd	ra,24(sp)
    800087f8:	00913423          	sd	s1,8(sp)
    800087fc:	02010413          	addi	s0,sp,32
    80008800:	100024f3          	csrr	s1,sstatus
    80008804:	100027f3          	csrr	a5,sstatus
    80008808:	ffd7f793          	andi	a5,a5,-3
    8000880c:	10079073          	csrw	sstatus,a5
    80008810:	ffffe097          	auipc	ra,0xffffe
    80008814:	714080e7          	jalr	1812(ra) # 80006f24 <mycpu>
    80008818:	07852783          	lw	a5,120(a0)
    8000881c:	02078663          	beqz	a5,80008848 <push_off+0x5c>
    80008820:	ffffe097          	auipc	ra,0xffffe
    80008824:	704080e7          	jalr	1796(ra) # 80006f24 <mycpu>
    80008828:	07852783          	lw	a5,120(a0)
    8000882c:	01813083          	ld	ra,24(sp)
    80008830:	01013403          	ld	s0,16(sp)
    80008834:	0017879b          	addiw	a5,a5,1
    80008838:	06f52c23          	sw	a5,120(a0)
    8000883c:	00813483          	ld	s1,8(sp)
    80008840:	02010113          	addi	sp,sp,32
    80008844:	00008067          	ret
    80008848:	0014d493          	srli	s1,s1,0x1
    8000884c:	ffffe097          	auipc	ra,0xffffe
    80008850:	6d8080e7          	jalr	1752(ra) # 80006f24 <mycpu>
    80008854:	0014f493          	andi	s1,s1,1
    80008858:	06952e23          	sw	s1,124(a0)
    8000885c:	fc5ff06f          	j	80008820 <push_off+0x34>

0000000080008860 <pop_off>:
    80008860:	ff010113          	addi	sp,sp,-16
    80008864:	00813023          	sd	s0,0(sp)
    80008868:	00113423          	sd	ra,8(sp)
    8000886c:	01010413          	addi	s0,sp,16
    80008870:	ffffe097          	auipc	ra,0xffffe
    80008874:	6b4080e7          	jalr	1716(ra) # 80006f24 <mycpu>
    80008878:	100027f3          	csrr	a5,sstatus
    8000887c:	0027f793          	andi	a5,a5,2
    80008880:	04079663          	bnez	a5,800088cc <pop_off+0x6c>
    80008884:	07852783          	lw	a5,120(a0)
    80008888:	02f05a63          	blez	a5,800088bc <pop_off+0x5c>
    8000888c:	fff7871b          	addiw	a4,a5,-1
    80008890:	06e52c23          	sw	a4,120(a0)
    80008894:	00071c63          	bnez	a4,800088ac <pop_off+0x4c>
    80008898:	07c52783          	lw	a5,124(a0)
    8000889c:	00078863          	beqz	a5,800088ac <pop_off+0x4c>
    800088a0:	100027f3          	csrr	a5,sstatus
    800088a4:	0027e793          	ori	a5,a5,2
    800088a8:	10079073          	csrw	sstatus,a5
    800088ac:	00813083          	ld	ra,8(sp)
    800088b0:	00013403          	ld	s0,0(sp)
    800088b4:	01010113          	addi	sp,sp,16
    800088b8:	00008067          	ret
    800088bc:	00001517          	auipc	a0,0x1
    800088c0:	fb450513          	addi	a0,a0,-76 # 80009870 <digits+0x48>
    800088c4:	fffff097          	auipc	ra,0xfffff
    800088c8:	018080e7          	jalr	24(ra) # 800078dc <panic>
    800088cc:	00001517          	auipc	a0,0x1
    800088d0:	f8c50513          	addi	a0,a0,-116 # 80009858 <digits+0x30>
    800088d4:	fffff097          	auipc	ra,0xfffff
    800088d8:	008080e7          	jalr	8(ra) # 800078dc <panic>

00000000800088dc <push_on>:
    800088dc:	fe010113          	addi	sp,sp,-32
    800088e0:	00813823          	sd	s0,16(sp)
    800088e4:	00113c23          	sd	ra,24(sp)
    800088e8:	00913423          	sd	s1,8(sp)
    800088ec:	02010413          	addi	s0,sp,32
    800088f0:	100024f3          	csrr	s1,sstatus
    800088f4:	100027f3          	csrr	a5,sstatus
    800088f8:	0027e793          	ori	a5,a5,2
    800088fc:	10079073          	csrw	sstatus,a5
    80008900:	ffffe097          	auipc	ra,0xffffe
    80008904:	624080e7          	jalr	1572(ra) # 80006f24 <mycpu>
    80008908:	07852783          	lw	a5,120(a0)
    8000890c:	02078663          	beqz	a5,80008938 <push_on+0x5c>
    80008910:	ffffe097          	auipc	ra,0xffffe
    80008914:	614080e7          	jalr	1556(ra) # 80006f24 <mycpu>
    80008918:	07852783          	lw	a5,120(a0)
    8000891c:	01813083          	ld	ra,24(sp)
    80008920:	01013403          	ld	s0,16(sp)
    80008924:	0017879b          	addiw	a5,a5,1
    80008928:	06f52c23          	sw	a5,120(a0)
    8000892c:	00813483          	ld	s1,8(sp)
    80008930:	02010113          	addi	sp,sp,32
    80008934:	00008067          	ret
    80008938:	0014d493          	srli	s1,s1,0x1
    8000893c:	ffffe097          	auipc	ra,0xffffe
    80008940:	5e8080e7          	jalr	1512(ra) # 80006f24 <mycpu>
    80008944:	0014f493          	andi	s1,s1,1
    80008948:	06952e23          	sw	s1,124(a0)
    8000894c:	fc5ff06f          	j	80008910 <push_on+0x34>

0000000080008950 <pop_on>:
    80008950:	ff010113          	addi	sp,sp,-16
    80008954:	00813023          	sd	s0,0(sp)
    80008958:	00113423          	sd	ra,8(sp)
    8000895c:	01010413          	addi	s0,sp,16
    80008960:	ffffe097          	auipc	ra,0xffffe
    80008964:	5c4080e7          	jalr	1476(ra) # 80006f24 <mycpu>
    80008968:	100027f3          	csrr	a5,sstatus
    8000896c:	0027f793          	andi	a5,a5,2
    80008970:	04078463          	beqz	a5,800089b8 <pop_on+0x68>
    80008974:	07852783          	lw	a5,120(a0)
    80008978:	02f05863          	blez	a5,800089a8 <pop_on+0x58>
    8000897c:	fff7879b          	addiw	a5,a5,-1
    80008980:	06f52c23          	sw	a5,120(a0)
    80008984:	07853783          	ld	a5,120(a0)
    80008988:	00079863          	bnez	a5,80008998 <pop_on+0x48>
    8000898c:	100027f3          	csrr	a5,sstatus
    80008990:	ffd7f793          	andi	a5,a5,-3
    80008994:	10079073          	csrw	sstatus,a5
    80008998:	00813083          	ld	ra,8(sp)
    8000899c:	00013403          	ld	s0,0(sp)
    800089a0:	01010113          	addi	sp,sp,16
    800089a4:	00008067          	ret
    800089a8:	00001517          	auipc	a0,0x1
    800089ac:	ef050513          	addi	a0,a0,-272 # 80009898 <digits+0x70>
    800089b0:	fffff097          	auipc	ra,0xfffff
    800089b4:	f2c080e7          	jalr	-212(ra) # 800078dc <panic>
    800089b8:	00001517          	auipc	a0,0x1
    800089bc:	ec050513          	addi	a0,a0,-320 # 80009878 <digits+0x50>
    800089c0:	fffff097          	auipc	ra,0xfffff
    800089c4:	f1c080e7          	jalr	-228(ra) # 800078dc <panic>

00000000800089c8 <__memset>:
    800089c8:	ff010113          	addi	sp,sp,-16
    800089cc:	00813423          	sd	s0,8(sp)
    800089d0:	01010413          	addi	s0,sp,16
    800089d4:	1a060e63          	beqz	a2,80008b90 <__memset+0x1c8>
    800089d8:	40a007b3          	neg	a5,a0
    800089dc:	0077f793          	andi	a5,a5,7
    800089e0:	00778693          	addi	a3,a5,7
    800089e4:	00b00813          	li	a6,11
    800089e8:	0ff5f593          	andi	a1,a1,255
    800089ec:	fff6071b          	addiw	a4,a2,-1
    800089f0:	1b06e663          	bltu	a3,a6,80008b9c <__memset+0x1d4>
    800089f4:	1cd76463          	bltu	a4,a3,80008bbc <__memset+0x1f4>
    800089f8:	1a078e63          	beqz	a5,80008bb4 <__memset+0x1ec>
    800089fc:	00b50023          	sb	a1,0(a0)
    80008a00:	00100713          	li	a4,1
    80008a04:	1ae78463          	beq	a5,a4,80008bac <__memset+0x1e4>
    80008a08:	00b500a3          	sb	a1,1(a0)
    80008a0c:	00200713          	li	a4,2
    80008a10:	1ae78a63          	beq	a5,a4,80008bc4 <__memset+0x1fc>
    80008a14:	00b50123          	sb	a1,2(a0)
    80008a18:	00300713          	li	a4,3
    80008a1c:	18e78463          	beq	a5,a4,80008ba4 <__memset+0x1dc>
    80008a20:	00b501a3          	sb	a1,3(a0)
    80008a24:	00400713          	li	a4,4
    80008a28:	1ae78263          	beq	a5,a4,80008bcc <__memset+0x204>
    80008a2c:	00b50223          	sb	a1,4(a0)
    80008a30:	00500713          	li	a4,5
    80008a34:	1ae78063          	beq	a5,a4,80008bd4 <__memset+0x20c>
    80008a38:	00b502a3          	sb	a1,5(a0)
    80008a3c:	00700713          	li	a4,7
    80008a40:	18e79e63          	bne	a5,a4,80008bdc <__memset+0x214>
    80008a44:	00b50323          	sb	a1,6(a0)
    80008a48:	00700e93          	li	t4,7
    80008a4c:	00859713          	slli	a4,a1,0x8
    80008a50:	00e5e733          	or	a4,a1,a4
    80008a54:	01059e13          	slli	t3,a1,0x10
    80008a58:	01c76e33          	or	t3,a4,t3
    80008a5c:	01859313          	slli	t1,a1,0x18
    80008a60:	006e6333          	or	t1,t3,t1
    80008a64:	02059893          	slli	a7,a1,0x20
    80008a68:	40f60e3b          	subw	t3,a2,a5
    80008a6c:	011368b3          	or	a7,t1,a7
    80008a70:	02859813          	slli	a6,a1,0x28
    80008a74:	0108e833          	or	a6,a7,a6
    80008a78:	03059693          	slli	a3,a1,0x30
    80008a7c:	003e589b          	srliw	a7,t3,0x3
    80008a80:	00d866b3          	or	a3,a6,a3
    80008a84:	03859713          	slli	a4,a1,0x38
    80008a88:	00389813          	slli	a6,a7,0x3
    80008a8c:	00f507b3          	add	a5,a0,a5
    80008a90:	00e6e733          	or	a4,a3,a4
    80008a94:	000e089b          	sext.w	a7,t3
    80008a98:	00f806b3          	add	a3,a6,a5
    80008a9c:	00e7b023          	sd	a4,0(a5)
    80008aa0:	00878793          	addi	a5,a5,8
    80008aa4:	fed79ce3          	bne	a5,a3,80008a9c <__memset+0xd4>
    80008aa8:	ff8e7793          	andi	a5,t3,-8
    80008aac:	0007871b          	sext.w	a4,a5
    80008ab0:	01d787bb          	addw	a5,a5,t4
    80008ab4:	0ce88e63          	beq	a7,a4,80008b90 <__memset+0x1c8>
    80008ab8:	00f50733          	add	a4,a0,a5
    80008abc:	00b70023          	sb	a1,0(a4)
    80008ac0:	0017871b          	addiw	a4,a5,1
    80008ac4:	0cc77663          	bgeu	a4,a2,80008b90 <__memset+0x1c8>
    80008ac8:	00e50733          	add	a4,a0,a4
    80008acc:	00b70023          	sb	a1,0(a4)
    80008ad0:	0027871b          	addiw	a4,a5,2
    80008ad4:	0ac77e63          	bgeu	a4,a2,80008b90 <__memset+0x1c8>
    80008ad8:	00e50733          	add	a4,a0,a4
    80008adc:	00b70023          	sb	a1,0(a4)
    80008ae0:	0037871b          	addiw	a4,a5,3
    80008ae4:	0ac77663          	bgeu	a4,a2,80008b90 <__memset+0x1c8>
    80008ae8:	00e50733          	add	a4,a0,a4
    80008aec:	00b70023          	sb	a1,0(a4)
    80008af0:	0047871b          	addiw	a4,a5,4
    80008af4:	08c77e63          	bgeu	a4,a2,80008b90 <__memset+0x1c8>
    80008af8:	00e50733          	add	a4,a0,a4
    80008afc:	00b70023          	sb	a1,0(a4)
    80008b00:	0057871b          	addiw	a4,a5,5
    80008b04:	08c77663          	bgeu	a4,a2,80008b90 <__memset+0x1c8>
    80008b08:	00e50733          	add	a4,a0,a4
    80008b0c:	00b70023          	sb	a1,0(a4)
    80008b10:	0067871b          	addiw	a4,a5,6
    80008b14:	06c77e63          	bgeu	a4,a2,80008b90 <__memset+0x1c8>
    80008b18:	00e50733          	add	a4,a0,a4
    80008b1c:	00b70023          	sb	a1,0(a4)
    80008b20:	0077871b          	addiw	a4,a5,7
    80008b24:	06c77663          	bgeu	a4,a2,80008b90 <__memset+0x1c8>
    80008b28:	00e50733          	add	a4,a0,a4
    80008b2c:	00b70023          	sb	a1,0(a4)
    80008b30:	0087871b          	addiw	a4,a5,8
    80008b34:	04c77e63          	bgeu	a4,a2,80008b90 <__memset+0x1c8>
    80008b38:	00e50733          	add	a4,a0,a4
    80008b3c:	00b70023          	sb	a1,0(a4)
    80008b40:	0097871b          	addiw	a4,a5,9
    80008b44:	04c77663          	bgeu	a4,a2,80008b90 <__memset+0x1c8>
    80008b48:	00e50733          	add	a4,a0,a4
    80008b4c:	00b70023          	sb	a1,0(a4)
    80008b50:	00a7871b          	addiw	a4,a5,10
    80008b54:	02c77e63          	bgeu	a4,a2,80008b90 <__memset+0x1c8>
    80008b58:	00e50733          	add	a4,a0,a4
    80008b5c:	00b70023          	sb	a1,0(a4)
    80008b60:	00b7871b          	addiw	a4,a5,11
    80008b64:	02c77663          	bgeu	a4,a2,80008b90 <__memset+0x1c8>
    80008b68:	00e50733          	add	a4,a0,a4
    80008b6c:	00b70023          	sb	a1,0(a4)
    80008b70:	00c7871b          	addiw	a4,a5,12
    80008b74:	00c77e63          	bgeu	a4,a2,80008b90 <__memset+0x1c8>
    80008b78:	00e50733          	add	a4,a0,a4
    80008b7c:	00b70023          	sb	a1,0(a4)
    80008b80:	00d7879b          	addiw	a5,a5,13
    80008b84:	00c7f663          	bgeu	a5,a2,80008b90 <__memset+0x1c8>
    80008b88:	00f507b3          	add	a5,a0,a5
    80008b8c:	00b78023          	sb	a1,0(a5)
    80008b90:	00813403          	ld	s0,8(sp)
    80008b94:	01010113          	addi	sp,sp,16
    80008b98:	00008067          	ret
    80008b9c:	00b00693          	li	a3,11
    80008ba0:	e55ff06f          	j	800089f4 <__memset+0x2c>
    80008ba4:	00300e93          	li	t4,3
    80008ba8:	ea5ff06f          	j	80008a4c <__memset+0x84>
    80008bac:	00100e93          	li	t4,1
    80008bb0:	e9dff06f          	j	80008a4c <__memset+0x84>
    80008bb4:	00000e93          	li	t4,0
    80008bb8:	e95ff06f          	j	80008a4c <__memset+0x84>
    80008bbc:	00000793          	li	a5,0
    80008bc0:	ef9ff06f          	j	80008ab8 <__memset+0xf0>
    80008bc4:	00200e93          	li	t4,2
    80008bc8:	e85ff06f          	j	80008a4c <__memset+0x84>
    80008bcc:	00400e93          	li	t4,4
    80008bd0:	e7dff06f          	j	80008a4c <__memset+0x84>
    80008bd4:	00500e93          	li	t4,5
    80008bd8:	e75ff06f          	j	80008a4c <__memset+0x84>
    80008bdc:	00600e93          	li	t4,6
    80008be0:	e6dff06f          	j	80008a4c <__memset+0x84>

0000000080008be4 <__memmove>:
    80008be4:	ff010113          	addi	sp,sp,-16
    80008be8:	00813423          	sd	s0,8(sp)
    80008bec:	01010413          	addi	s0,sp,16
    80008bf0:	0e060863          	beqz	a2,80008ce0 <__memmove+0xfc>
    80008bf4:	fff6069b          	addiw	a3,a2,-1
    80008bf8:	0006881b          	sext.w	a6,a3
    80008bfc:	0ea5e863          	bltu	a1,a0,80008cec <__memmove+0x108>
    80008c00:	00758713          	addi	a4,a1,7
    80008c04:	00a5e7b3          	or	a5,a1,a0
    80008c08:	40a70733          	sub	a4,a4,a0
    80008c0c:	0077f793          	andi	a5,a5,7
    80008c10:	00f73713          	sltiu	a4,a4,15
    80008c14:	00174713          	xori	a4,a4,1
    80008c18:	0017b793          	seqz	a5,a5
    80008c1c:	00e7f7b3          	and	a5,a5,a4
    80008c20:	10078863          	beqz	a5,80008d30 <__memmove+0x14c>
    80008c24:	00900793          	li	a5,9
    80008c28:	1107f463          	bgeu	a5,a6,80008d30 <__memmove+0x14c>
    80008c2c:	0036581b          	srliw	a6,a2,0x3
    80008c30:	fff8081b          	addiw	a6,a6,-1
    80008c34:	02081813          	slli	a6,a6,0x20
    80008c38:	01d85893          	srli	a7,a6,0x1d
    80008c3c:	00858813          	addi	a6,a1,8
    80008c40:	00058793          	mv	a5,a1
    80008c44:	00050713          	mv	a4,a0
    80008c48:	01088833          	add	a6,a7,a6
    80008c4c:	0007b883          	ld	a7,0(a5)
    80008c50:	00878793          	addi	a5,a5,8
    80008c54:	00870713          	addi	a4,a4,8
    80008c58:	ff173c23          	sd	a7,-8(a4)
    80008c5c:	ff0798e3          	bne	a5,a6,80008c4c <__memmove+0x68>
    80008c60:	ff867713          	andi	a4,a2,-8
    80008c64:	02071793          	slli	a5,a4,0x20
    80008c68:	0207d793          	srli	a5,a5,0x20
    80008c6c:	00f585b3          	add	a1,a1,a5
    80008c70:	40e686bb          	subw	a3,a3,a4
    80008c74:	00f507b3          	add	a5,a0,a5
    80008c78:	06e60463          	beq	a2,a4,80008ce0 <__memmove+0xfc>
    80008c7c:	0005c703          	lbu	a4,0(a1)
    80008c80:	00e78023          	sb	a4,0(a5)
    80008c84:	04068e63          	beqz	a3,80008ce0 <__memmove+0xfc>
    80008c88:	0015c603          	lbu	a2,1(a1)
    80008c8c:	00100713          	li	a4,1
    80008c90:	00c780a3          	sb	a2,1(a5)
    80008c94:	04e68663          	beq	a3,a4,80008ce0 <__memmove+0xfc>
    80008c98:	0025c603          	lbu	a2,2(a1)
    80008c9c:	00200713          	li	a4,2
    80008ca0:	00c78123          	sb	a2,2(a5)
    80008ca4:	02e68e63          	beq	a3,a4,80008ce0 <__memmove+0xfc>
    80008ca8:	0035c603          	lbu	a2,3(a1)
    80008cac:	00300713          	li	a4,3
    80008cb0:	00c781a3          	sb	a2,3(a5)
    80008cb4:	02e68663          	beq	a3,a4,80008ce0 <__memmove+0xfc>
    80008cb8:	0045c603          	lbu	a2,4(a1)
    80008cbc:	00400713          	li	a4,4
    80008cc0:	00c78223          	sb	a2,4(a5)
    80008cc4:	00e68e63          	beq	a3,a4,80008ce0 <__memmove+0xfc>
    80008cc8:	0055c603          	lbu	a2,5(a1)
    80008ccc:	00500713          	li	a4,5
    80008cd0:	00c782a3          	sb	a2,5(a5)
    80008cd4:	00e68663          	beq	a3,a4,80008ce0 <__memmove+0xfc>
    80008cd8:	0065c703          	lbu	a4,6(a1)
    80008cdc:	00e78323          	sb	a4,6(a5)
    80008ce0:	00813403          	ld	s0,8(sp)
    80008ce4:	01010113          	addi	sp,sp,16
    80008ce8:	00008067          	ret
    80008cec:	02061713          	slli	a4,a2,0x20
    80008cf0:	02075713          	srli	a4,a4,0x20
    80008cf4:	00e587b3          	add	a5,a1,a4
    80008cf8:	f0f574e3          	bgeu	a0,a5,80008c00 <__memmove+0x1c>
    80008cfc:	02069613          	slli	a2,a3,0x20
    80008d00:	02065613          	srli	a2,a2,0x20
    80008d04:	fff64613          	not	a2,a2
    80008d08:	00e50733          	add	a4,a0,a4
    80008d0c:	00c78633          	add	a2,a5,a2
    80008d10:	fff7c683          	lbu	a3,-1(a5)
    80008d14:	fff78793          	addi	a5,a5,-1
    80008d18:	fff70713          	addi	a4,a4,-1
    80008d1c:	00d70023          	sb	a3,0(a4)
    80008d20:	fec798e3          	bne	a5,a2,80008d10 <__memmove+0x12c>
    80008d24:	00813403          	ld	s0,8(sp)
    80008d28:	01010113          	addi	sp,sp,16
    80008d2c:	00008067          	ret
    80008d30:	02069713          	slli	a4,a3,0x20
    80008d34:	02075713          	srli	a4,a4,0x20
    80008d38:	00170713          	addi	a4,a4,1
    80008d3c:	00e50733          	add	a4,a0,a4
    80008d40:	00050793          	mv	a5,a0
    80008d44:	0005c683          	lbu	a3,0(a1)
    80008d48:	00178793          	addi	a5,a5,1
    80008d4c:	00158593          	addi	a1,a1,1
    80008d50:	fed78fa3          	sb	a3,-1(a5)
    80008d54:	fee798e3          	bne	a5,a4,80008d44 <__memmove+0x160>
    80008d58:	f89ff06f          	j	80008ce0 <__memmove+0xfc>
	...
