
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000c117          	auipc	sp,0xc
    80000004:	a9813103          	ld	sp,-1384(sp) # 8000ba98 <_GLOBAL_OFFSET_TABLE_+0x40>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	44d060ef          	jal	ra,80006c68 <start>

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
    80001184:	421000ef          	jal	ra,80001da4 <interruptRoutine>

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
    80001664:	4c07c783          	lbu	a5,1216(a5) # 8000bb20 <_ZN8KConsole11initializedE>
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
    80001688:	49c48493          	addi	s1,s1,1180 # 8000bb20 <_ZN8KConsole11initializedE>
    8000168c:	0000a797          	auipc	a5,0xa
    80001690:	3dc7b783          	ld	a5,988(a5) # 8000ba68 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001694:	0007b783          	ld	a5,0(a5)
    80001698:	00f4b423          	sd	a5,8(s1)
	sr = (uint8*)CONSOLE_STATUS;
    8000169c:	0000a797          	auipc	a5,0xa
    800016a0:	3dc7b783          	ld	a5,988(a5) # 8000ba78 <_GLOBAL_OFFSET_TABLE_+0x20>
    800016a4:	0007b783          	ld	a5,0(a5)
    800016a8:	00f4b823          	sd	a5,16(s1)
	sem_open(&inputBufferHasSpace, capacity);
    800016ac:	01e00593          	li	a1,30
    800016b0:	0000a517          	auipc	a0,0xa
    800016b4:	48850513          	addi	a0,a0,1160 # 8000bb38 <_ZN8KConsole19inputBufferHasSpaceE>
    800016b8:	00000097          	auipc	ra,0x0
    800016bc:	de8080e7          	jalr	-536(ra) # 800014a0 <_Z8sem_openPP4KSemj>
	sem_open(&outputBufferHasSpace, capacity);
    800016c0:	01e00593          	li	a1,30
    800016c4:	0000a517          	auipc	a0,0xa
    800016c8:	47c50513          	addi	a0,a0,1148 # 8000bb40 <_ZN8KConsole20outputBufferHasSpaceE>
    800016cc:	00000097          	auipc	ra,0x0
    800016d0:	dd4080e7          	jalr	-556(ra) # 800014a0 <_Z8sem_openPP4KSemj>
	sem_open(&charsToInput, 0);
    800016d4:	00000593          	li	a1,0
    800016d8:	0000a517          	auipc	a0,0xa
    800016dc:	47050513          	addi	a0,a0,1136 # 8000bb48 <_ZN8KConsole12charsToInputE>
    800016e0:	00000097          	auipc	ra,0x0
    800016e4:	dc0080e7          	jalr	-576(ra) # 800014a0 <_Z8sem_openPP4KSemj>
	sem_open(&charsToOutput, 0);
    800016e8:	00000593          	li	a1,0
    800016ec:	0000a517          	auipc	a0,0xa
    800016f0:	46450513          	addi	a0,a0,1124 # 8000bb50 <_ZN8KConsole13charsToOutputE>
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
    80001738:	2e4080e7          	jalr	740(ra) # 80005a18 <_Z11printStringPKc>
	printInteger((uint64)dr);
    8000173c:	0000a497          	auipc	s1,0xa
    80001740:	3e448493          	addi	s1,s1,996 # 8000bb20 <_ZN8KConsole11initializedE>
    80001744:	0084b503          	ld	a0,8(s1)
    80001748:	00000097          	auipc	ra,0x0
    8000174c:	250080e7          	jalr	592(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    80001750:	00008517          	auipc	a0,0x8
    80001754:	e1850513          	addi	a0,a0,-488 # 80009568 <CONSOLE_STATUS+0x558>
    80001758:	00004097          	auipc	ra,0x4
    8000175c:	2c0080e7          	jalr	704(ra) # 80005a18 <_Z11printStringPKc>
	printString("CONSOLE_STATUS = ");
    80001760:	00008517          	auipc	a0,0x8
    80001764:	8d050513          	addi	a0,a0,-1840 # 80009030 <CONSOLE_STATUS+0x20>
    80001768:	00004097          	auipc	ra,0x4
    8000176c:	2b0080e7          	jalr	688(ra) # 80005a18 <_Z11printStringPKc>
	printInteger((uint64)sr);
    80001770:	0104b503          	ld	a0,16(s1)
    80001774:	00000097          	auipc	ra,0x0
    80001778:	224080e7          	jalr	548(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    8000177c:	00008517          	auipc	a0,0x8
    80001780:	dec50513          	addi	a0,a0,-532 # 80009568 <CONSOLE_STATUS+0x558>
    80001784:	00004097          	auipc	ra,0x4
    80001788:	294080e7          	jalr	660(ra) # 80005a18 <_Z11printStringPKc>
	printString("*CONSOLE_RX = ");
    8000178c:	00008517          	auipc	a0,0x8
    80001790:	8bc50513          	addi	a0,a0,-1860 # 80009048 <CONSOLE_STATUS+0x38>
    80001794:	00004097          	auipc	ra,0x4
    80001798:	284080e7          	jalr	644(ra) # 80005a18 <_Z11printStringPKc>
	printInteger(*dr);
    8000179c:	0084b783          	ld	a5,8(s1)
    800017a0:	0007c503          	lbu	a0,0(a5)
    800017a4:	00000097          	auipc	ra,0x0
    800017a8:	1f4080e7          	jalr	500(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    800017ac:	00008517          	auipc	a0,0x8
    800017b0:	dbc50513          	addi	a0,a0,-580 # 80009568 <CONSOLE_STATUS+0x558>
    800017b4:	00004097          	auipc	ra,0x4
    800017b8:	264080e7          	jalr	612(ra) # 80005a18 <_Z11printStringPKc>
	printString("*CONSOLE_STATUS = ");
    800017bc:	00008517          	auipc	a0,0x8
    800017c0:	89c50513          	addi	a0,a0,-1892 # 80009058 <CONSOLE_STATUS+0x48>
    800017c4:	00004097          	auipc	ra,0x4
    800017c8:	254080e7          	jalr	596(ra) # 80005a18 <_Z11printStringPKc>
	printInteger(*sr);
    800017cc:	0104b783          	ld	a5,16(s1)
    800017d0:	0007c503          	lbu	a0,0(a5)
    800017d4:	00000097          	auipc	ra,0x0
    800017d8:	1c4080e7          	jalr	452(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    800017dc:	00008517          	auipc	a0,0x8
    800017e0:	d8c50513          	addi	a0,a0,-628 # 80009568 <CONSOLE_STATUS+0x558>
    800017e4:	00004097          	auipc	ra,0x4
    800017e8:	234080e7          	jalr	564(ra) # 80005a18 <_Z11printStringPKc>
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
    80001818:	30c48493          	addi	s1,s1,780 # 8000bb20 <_ZN8KConsole11initializedE>
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
    8000185c:	32872703          	lw	a4,808(a4) # 8000bb80 <_ZN8KConsole15inputBufferSizeE>
    80001860:	01e00793          	li	a5,30
    80001864:	04f70e63          	beq	a4,a5,800018c0 <_ZN8KConsole12placeInInputEc+0x68>
void KConsole::placeInInput(char c) {
    80001868:	ff010113          	addi	sp,sp,-16
    8000186c:	00113423          	sd	ra,8(sp)
    80001870:	00813023          	sd	s0,0(sp)
    80001874:	01010413          	addi	s0,sp,16
	inputBuffer[inputTail] = c;
    80001878:	0000a697          	auipc	a3,0xa
    8000187c:	2a868693          	addi	a3,a3,680 # 8000bb20 <_ZN8KConsole11initializedE>
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
    800018e4:	24048493          	addi	s1,s1,576 # 8000bb20 <_ZN8KConsole11initializedE>
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
    8000194c:	1d848493          	addi	s1,s1,472 # 8000bb20 <_ZN8KConsole11initializedE>
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
    800019d0:	1e47b783          	ld	a5,484(a5) # 8000bbb0 <_ZN9Scheduler4tailE>
    800019d4:	00078e63          	beqz	a5,800019f0 <_ZN9Scheduler3putEP3TCB+0x30>
		head = tail = tcb;
	} else {
		tail->nextInScheduler = tcb;
    800019d8:	02a7bc23          	sd	a0,56(a5)
		tail = tcb;
    800019dc:	0000a797          	auipc	a5,0xa
    800019e0:	1ca7ba23          	sd	a0,468(a5) # 8000bbb0 <_ZN9Scheduler4tailE>
	}
}
    800019e4:	00813403          	ld	s0,8(sp)
    800019e8:	01010113          	addi	sp,sp,16
    800019ec:	00008067          	ret
		head = tail = tcb;
    800019f0:	0000a797          	auipc	a5,0xa
    800019f4:	1c078793          	addi	a5,a5,448 # 8000bbb0 <_ZN9Scheduler4tailE>
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
    80001a14:	1a070713          	addi	a4,a4,416 # 8000bbb0 <_ZN9Scheduler4tailE>
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
    80001a54:	17083803          	ld	a6,368(a6) # 8000bbc0 <_ZN9Scheduler12sleepingHeadE>
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
    80001a8c:	12a7bc23          	sd	a0,312(a5) # 8000bbc0 <_ZN9Scheduler12sleepingHeadE>
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
    80001ad4:	0ea7b823          	sd	a0,240(a5) # 8000bbc0 <_ZN9Scheduler12sleepingHeadE>
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
    80001af0:	0d47b783          	ld	a5,212(a5) # 8000bbc0 <_ZN9Scheduler12sleepingHeadE>
    80001af4:	06078a63          	beqz	a5,80001b68 <_ZN9Scheduler4wakeEv+0x7c>
	sleepingHead->timeToSleep--;
    80001af8:	0407b703          	ld	a4,64(a5)
    80001afc:	fff70713          	addi	a4,a4,-1
    80001b00:	04e7b023          	sd	a4,64(a5)
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001b04:	0000a517          	auipc	a0,0xa
    80001b08:	0bc53503          	ld	a0,188(a0) # 8000bbc0 <_ZN9Scheduler12sleepingHeadE>
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
    80001b3c:	08f73423          	sd	a5,136(a4) # 8000bbc0 <_ZN9Scheduler12sleepingHeadE>
		thread->nextSleeping = nullptr;
    80001b40:	04053423          	sd	zero,72(a0)
		Scheduler::put(thread);
    80001b44:	00000097          	auipc	ra,0x0
    80001b48:	e7c080e7          	jalr	-388(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001b4c:	0000a517          	auipc	a0,0xa
    80001b50:	07453503          	ld	a0,116(a0) # 8000bbc0 <_ZN9Scheduler12sleepingHeadE>
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
    80001b88:	f3c7b783          	ld	a5,-196(a5) # 8000bac0 <_GLOBAL_OFFSET_TABLE_+0x68>
    80001b8c:	00078513          	mv	a0,a5
    80001b90:	00000097          	auipc	ra,0x0
    80001b94:	1c0080e7          	jalr	448(ra) # 80001d50 <_ZN5Riscv7w_stvecEm>

	//sem_open(&semA, 0);
	semA = new Semaphore(1);
    80001b98:	01000513          	li	a0,16
    80001b9c:	00001097          	auipc	ra,0x1
    80001ba0:	ab8080e7          	jalr	-1352(ra) # 80002654 <_Znwm>
    80001ba4:	00050793          	mv	a5,a0
    80001ba8:	00078493          	mv	s1,a5
    80001bac:	00100593          	li	a1,1
    80001bb0:	00048513          	mv	a0,s1
    80001bb4:	00001097          	auipc	ra,0x1
    80001bb8:	d94080e7          	jalr	-620(ra) # 80002948 <_ZN9SemaphoreC1Ej>
    80001bbc:	0000a797          	auipc	a5,0xa
    80001bc0:	00c78793          	addi	a5,a5,12 # 8000bbc8 <semA>
    80001bc4:	0097b023          	sd	s1,0(a5)

	KConsole::initKConsole();
    80001bc8:	00000097          	auipc	ra,0x0
    80001bcc:	a98080e7          	jalr	-1384(ra) # 80001660 <_ZN8KConsole12initKConsoleEv>
//testiranje svega
	thread_t mainHandle;
	thread_t userHandle;
	thread_t idleHandle;
	thread_t consoleOutputHandle;
	thread_create(&mainHandle, nullptr, nullptr);
    80001bd0:	fd840793          	addi	a5,s0,-40
    80001bd4:	00000613          	li	a2,0
    80001bd8:	00000593          	li	a1,0
    80001bdc:	00078513          	mv	a0,a5
    80001be0:	fffff097          	auipc	ra,0xfffff
    80001be4:	7a0080e7          	jalr	1952(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
	TCB::running = mainHandle;
    80001be8:	fd843703          	ld	a4,-40(s0)
    80001bec:	0000a797          	auipc	a5,0xa
    80001bf0:	ec47b783          	ld	a5,-316(a5) # 8000bab0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001bf4:	00e7b023          	sd	a4,0(a5)
	thread_create(&idleHandle, idle, nullptr);
    80001bf8:	fc840793          	addi	a5,s0,-56
    80001bfc:	00000613          	li	a2,0
    80001c00:	00000597          	auipc	a1,0x0
    80001c04:	0d858593          	addi	a1,a1,216 # 80001cd8 <_Z4idlePv>
    80001c08:	00078513          	mv	a0,a5
    80001c0c:	fffff097          	auipc	ra,0xfffff
    80001c10:	774080e7          	jalr	1908(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
	thread_create(&consoleOutputHandle, kernelConsumerFunction, nullptr);
    80001c14:	fc040793          	addi	a5,s0,-64
    80001c18:	00000613          	li	a2,0
    80001c1c:	00000597          	auipc	a1,0x0
    80001c20:	0d858593          	addi	a1,a1,216 # 80001cf4 <_Z22kernelConsumerFunctionPv>
    80001c24:	00078513          	mv	a0,a5
    80001c28:	fffff097          	auipc	ra,0xfffff
    80001c2c:	758080e7          	jalr	1880(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
	thread_create(&userHandle, (TCB::Body)userMain, nullptr);
    80001c30:	fd040793          	addi	a5,s0,-48
    80001c34:	00000613          	li	a2,0
    80001c38:	0000a597          	auipc	a1,0xa
    80001c3c:	e285b583          	ld	a1,-472(a1) # 8000ba60 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001c40:	00078513          	mv	a0,a5
    80001c44:	fffff097          	auipc	ra,0xfffff
    80001c48:	73c080e7          	jalr	1852(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>

	Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    80001c4c:	00200513          	li	a0,2
    80001c50:	00000097          	auipc	ra,0x0
    80001c54:	11c080e7          	jalr	284(ra) # 80001d6c <_ZN5Riscv10ms_sstatusEm>
	thread_join(userHandle);
    80001c58:	fd043783          	ld	a5,-48(s0)
    80001c5c:	00078513          	mv	a0,a5
    80001c60:	fffff097          	auipc	ra,0xfffff
    80001c64:	7e8080e7          	jalr	2024(ra) # 80001448 <_Z11thread_joinP3TCB>
	//printString("\nSad cu da izadjem\n");
	while(KConsole::outputHead!=KConsole::outputTail){}
    80001c68:	0000a797          	auipc	a5,0xa
    80001c6c:	e287b783          	ld	a5,-472(a5) # 8000ba90 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001c70:	0007a703          	lw	a4,0(a5)
    80001c74:	0000a797          	auipc	a5,0xa
    80001c78:	e5c7b783          	ld	a5,-420(a5) # 8000bad0 <_GLOBAL_OFFSET_TABLE_+0x78>
    80001c7c:	0007a783          	lw	a5,0(a5)
    80001c80:	00f70463          	beq	a4,a5,80001c88 <main+0x11c>
    80001c84:	fe5ff06f          	j	80001c68 <main+0xfc>
	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    80001c88:	00200513          	li	a0,2
    80001c8c:	00000097          	auipc	ra,0x0
    80001c90:	0fc080e7          	jalr	252(ra) # 80001d88 <_ZN5Riscv10mc_sstatusEm>
	return 0;
    80001c94:	00000793          	li	a5,0
    80001c98:	0240006f          	j	80001cbc <main+0x150>
    80001c9c:	00050913          	mv	s2,a0
	semA = new Semaphore(1);
    80001ca0:	00048513          	mv	a0,s1
    80001ca4:	00001097          	auipc	ra,0x1
    80001ca8:	a00080e7          	jalr	-1536(ra) # 800026a4 <_ZdlPv>
    80001cac:	00090793          	mv	a5,s2
    80001cb0:	00078513          	mv	a0,a5
    80001cb4:	0000b097          	auipc	ra,0xb
    80001cb8:	064080e7          	jalr	100(ra) # 8000cd18 <_Unwind_Resume>
    80001cbc:	00078513          	mv	a0,a5
    80001cc0:	03813083          	ld	ra,56(sp)
    80001cc4:	03013403          	ld	s0,48(sp)
    80001cc8:	02813483          	ld	s1,40(sp)
    80001ccc:	02013903          	ld	s2,32(sp)
    80001cd0:	04010113          	addi	sp,sp,64
    80001cd4:	00008067          	ret

0000000080001cd8 <_Z4idlePv>:
void idle(void*) {
    80001cd8:	ff010113          	addi	sp,sp,-16
    80001cdc:	00113423          	sd	ra,8(sp)
    80001ce0:	00813023          	sd	s0,0(sp)
    80001ce4:	01010413          	addi	s0,sp,16
	while (1) {thread_dispatch();}
    80001ce8:	fffff097          	auipc	ra,0xfffff
    80001cec:	740080e7          	jalr	1856(ra) # 80001428 <_Z15thread_dispatchv>
    80001cf0:	ff9ff06f          	j	80001ce8 <_Z4idlePv+0x10>

0000000080001cf4 <_Z22kernelConsumerFunctionPv>:
void kernelConsumerFunction(void*) {
    80001cf4:	ff010113          	addi	sp,sp,-16
    80001cf8:	00113423          	sd	ra,8(sp)
    80001cfc:	00813023          	sd	s0,0(sp)
    80001d00:	01010413          	addi	s0,sp,16
    80001d04:	0280006f          	j	80001d2c <_Z22kernelConsumerFunctionPv+0x38>
		*KConsole::dr = c;
    80001d08:	0000a797          	auipc	a5,0xa
    80001d0c:	d987b783          	ld	a5,-616(a5) # 8000baa0 <_GLOBAL_OFFSET_TABLE_+0x48>
    80001d10:	0007b783          	ld	a5,0(a5)
    80001d14:	00a78023          	sb	a0,0(a5)
		sem_signal(KConsole::outputBufferHasSpace);
    80001d18:	0000a797          	auipc	a5,0xa
    80001d1c:	d907b783          	ld	a5,-624(a5) # 8000baa8 <_GLOBAL_OFFSET_TABLE_+0x50>
    80001d20:	0007b503          	ld	a0,0(a5)
    80001d24:	00000097          	auipc	ra,0x0
    80001d28:	814080e7          	jalr	-2028(ra) # 80001538 <_Z10sem_signalP4KSem>
		char c = KConsole::getFromOutput();
    80001d2c:	00000097          	auipc	ra,0x0
    80001d30:	ad4080e7          	jalr	-1324(ra) # 80001800 <_ZN8KConsole13getFromOutputEv>
		while (!(*KConsole::sr & CONSOLE_TX_STATUS_BIT)) {}
    80001d34:	0000a797          	auipc	a5,0xa
    80001d38:	da47b783          	ld	a5,-604(a5) # 8000bad8 <_GLOBAL_OFFSET_TABLE_+0x80>
    80001d3c:	0007b783          	ld	a5,0(a5)
    80001d40:	0007c783          	lbu	a5,0(a5)
    80001d44:	0207f793          	andi	a5,a5,32
    80001d48:	fe0786e3          	beqz	a5,80001d34 <_Z22kernelConsumerFunctionPv+0x40>
    80001d4c:	fbdff06f          	j	80001d08 <_Z22kernelConsumerFunctionPv+0x14>

0000000080001d50 <_ZN5Riscv7w_stvecEm>:
	uint64 volatile stvec;
	__asm__ volatile("csrr %[stvec], stvec": [stvec] "=r"(stvec));
	return stvec;
}

inline void Riscv::w_stvec(uint64 stvec) {
    80001d50:	ff010113          	addi	sp,sp,-16
    80001d54:	00813423          	sd	s0,8(sp)
    80001d58:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw stvec, %[stvec]": :[stvec] "r"(stvec));
    80001d5c:	10551073          	csrw	stvec,a0
}
    80001d60:	00813403          	ld	s0,8(sp)
    80001d64:	01010113          	addi	sp,sp,16
    80001d68:	00008067          	ret

0000000080001d6c <_ZN5Riscv10ms_sstatusEm>:

inline void Riscv::w_sip(uint64 sip) {
	__asm__ volatile("csrw sip, %[sip]": :[sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
    80001d6c:	ff010113          	addi	sp,sp,-16
    80001d70:	00813423          	sd	s0,8(sp)
    80001d74:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80001d78:	10052073          	csrs	sstatus,a0
}
    80001d7c:	00813403          	ld	s0,8(sp)
    80001d80:	01010113          	addi	sp,sp,16
    80001d84:	00008067          	ret

0000000080001d88 <_ZN5Riscv10mc_sstatusEm>:

inline void Riscv::mc_sstatus(uint64 mask) {
    80001d88:	ff010113          	addi	sp,sp,-16
    80001d8c:	00813423          	sd	s0,8(sp)
    80001d90:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80001d94:	10053073          	csrc	sstatus,a0
}
    80001d98:	00813403          	ld	s0,8(sp)
    80001d9c:	01010113          	addi	sp,sp,16
    80001da0:	00008067          	ret

0000000080001da4 <interruptRoutine>:
#include "../test/printing.hpp"

//void printInteger(int i);

#pragma GCC optimize("O0")
extern "C" void interruptRoutine() {
    80001da4:	ec010113          	addi	sp,sp,-320
    80001da8:	12113c23          	sd	ra,312(sp)
    80001dac:	12813823          	sd	s0,304(sp)
    80001db0:	14010413          	addi	s0,sp,320
	uint64 scause, sepc, sstatus;
	__asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001db4:	14202373          	csrr	t1,scause
    80001db8:	fc643c23          	sd	t1,-40(s0)
	__asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001dbc:	14102373          	csrr	t1,sepc
    80001dc0:	fc643823          	sd	t1,-48(s0)
	__asm__ volatile("csrr %[status], sstatus":[status] "=r"(
			sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001dc4:	10002373          	csrr	t1,sstatus
    80001dc8:	fc643423          	sd	t1,-56(s0)
	uint64 a0, a1, a2, a3, a4, a5, a6, a7;
	__asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001dcc:	00050313          	mv	t1,a0
    80001dd0:	fc643023          	sd	t1,-64(s0)
	__asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001dd4:	00058313          	mv	t1,a1
    80001dd8:	fa643c23          	sd	t1,-72(s0)
	__asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001ddc:	00060313          	mv	t1,a2
    80001de0:	fa643823          	sd	t1,-80(s0)
	__asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001de4:	00068313          	mv	t1,a3
    80001de8:	fa643423          	sd	t1,-88(s0)
	__asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001dec:	00070313          	mv	t1,a4
    80001df0:	fa643023          	sd	t1,-96(s0)
	__asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001df4:	00078313          	mv	t1,a5
    80001df8:	f8643c23          	sd	t1,-104(s0)
	__asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001dfc:	00080313          	mv	t1,a6
    80001e00:	f8643823          	sd	t1,-112(s0)
	__asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001e04:	00088313          	mv	t1,a7
    80001e08:	f8643423          	sd	t1,-120(s0)

	if (scause == 0x09 || scause == 0x08) {
    80001e0c:	fd843703          	ld	a4,-40(s0)
    80001e10:	00900793          	li	a5,9
    80001e14:	00f70863          	beq	a4,a5,80001e24 <interruptRoutine+0x80>
    80001e18:	fd843703          	ld	a4,-40(s0)
    80001e1c:	00800793          	li	a5,8
    80001e20:	50f71663          	bne	a4,a5,8000232c <interruptRoutine+0x588>
		//prekid zbog poziva ecall
		uint64 opCode = a0;
    80001e24:	fc043783          	ld	a5,-64(s0)
    80001e28:	f6f43c23          	sd	a5,-136(s0)
		switch (opCode) {
    80001e2c:	f7843703          	ld	a4,-136(s0)
    80001e30:	09100793          	li	a5,145
    80001e34:	38f70063          	beq	a4,a5,800021b4 <interruptRoutine+0x410>
    80001e38:	f7843703          	ld	a4,-136(s0)
    80001e3c:	09100793          	li	a5,145
    80001e40:	44e7ee63          	bltu	a5,a4,8000229c <interruptRoutine+0x4f8>
    80001e44:	f7843703          	ld	a4,-136(s0)
    80001e48:	09000793          	li	a5,144
    80001e4c:	32f70863          	beq	a4,a5,8000217c <interruptRoutine+0x3d8>
    80001e50:	f7843703          	ld	a4,-136(s0)
    80001e54:	09000793          	li	a5,144
    80001e58:	44e7e263          	bltu	a5,a4,8000229c <interruptRoutine+0x4f8>
    80001e5c:	f7843703          	ld	a4,-136(s0)
    80001e60:	08100793          	li	a5,129
    80001e64:	30f70063          	beq	a4,a5,80002164 <interruptRoutine+0x3c0>
    80001e68:	f7843703          	ld	a4,-136(s0)
    80001e6c:	08100793          	li	a5,129
    80001e70:	42e7e663          	bltu	a5,a4,8000229c <interruptRoutine+0x4f8>
    80001e74:	f7843703          	ld	a4,-136(s0)
    80001e78:	04200793          	li	a5,66
    80001e7c:	04e7e263          	bltu	a5,a4,80001ec0 <interruptRoutine+0x11c>
    80001e80:	f7843783          	ld	a5,-136(s0)
    80001e84:	40078c63          	beqz	a5,8000229c <interruptRoutine+0x4f8>
    80001e88:	f7843703          	ld	a4,-136(s0)
    80001e8c:	04200793          	li	a5,66
    80001e90:	40e7e663          	bltu	a5,a4,8000229c <interruptRoutine+0x4f8>
    80001e94:	f7843783          	ld	a5,-136(s0)
    80001e98:	00279713          	slli	a4,a5,0x2
    80001e9c:	00007797          	auipc	a5,0x7
    80001ea0:	24878793          	addi	a5,a5,584 # 800090e4 <CONSOLE_STATUS+0xd4>
    80001ea4:	00f707b3          	add	a5,a4,a5
    80001ea8:	0007a783          	lw	a5,0(a5)
    80001eac:	0007871b          	sext.w	a4,a5
    80001eb0:	00007797          	auipc	a5,0x7
    80001eb4:	23478793          	addi	a5,a5,564 # 800090e4 <CONSOLE_STATUS+0xd4>
    80001eb8:	00f707b3          	add	a5,a4,a5
    80001ebc:	00078067          	jr	a5
    80001ec0:	f7843703          	ld	a4,-136(s0)
    80001ec4:	08000793          	li	a5,128
    80001ec8:	22f70e63          	beq	a4,a5,80002104 <interruptRoutine+0x360>
    80001ecc:	3d00006f          	j	8000229c <interruptRoutine+0x4f8>
			case 0x01:
				//mem_alloc
				size_t size;
				size = (size_t)a1;
    80001ed0:	fb843783          	ld	a5,-72(s0)
    80001ed4:	ecf43823          	sd	a5,-304(s0)
				//__asm__ volatile("mv %[size], a1":[size] "=r"(size));
				size = size * MEM_BLOCK_SIZE;
    80001ed8:	ed043783          	ld	a5,-304(s0)
    80001edc:	00679793          	slli	a5,a5,0x6
    80001ee0:	ecf43823          	sd	a5,-304(s0)
				MemoryAllocator::kmalloc(size);
    80001ee4:	00300593          	li	a1,3
    80001ee8:	ed043503          	ld	a0,-304(s0)
    80001eec:	00001097          	auipc	ra,0x1
    80001ef0:	f84080e7          	jalr	-124(ra) # 80002e70 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
				__asm__ volatile("sd a0, 80(s0)");
    80001ef4:	04a43823          	sd	a0,80(s0)
				break;
    80001ef8:	4100006f          	j	80002308 <interruptRoutine+0x564>
			case 0x02:
				//mem_free
				void* ptr;
				ptr = (void*)a1;
    80001efc:	fb843783          	ld	a5,-72(s0)
    80001f00:	ecf43c23          	sd	a5,-296(s0)
				//__asm__ volatile("mv %[ptr], a1" :[ptr]"=r"(ptr));
				MemoryAllocator::kfree(ptr);
    80001f04:	ed843503          	ld	a0,-296(s0)
    80001f08:	00001097          	auipc	ra,0x1
    80001f0c:	11c080e7          	jalr	284(ra) # 80003024 <_ZN15MemoryAllocator5kfreeEPv>
				__asm__ volatile("sd a0, 80(s0)");
    80001f10:	04a43823          	sd	a0,80(s0)
				break;
    80001f14:	3f40006f          	j	80002308 <interruptRoutine+0x564>
			case 0x11:
				//thread_create
				thread_t* handle;
				handle = (thread_t*)a1;
    80001f18:	fb843783          	ld	a5,-72(s0)
    80001f1c:	eef43c23          	sd	a5,-264(s0)
				void (* function)(void*);
				function = (void (*)(void*))a2;
    80001f20:	fb043783          	ld	a5,-80(s0)
    80001f24:	eef43823          	sd	a5,-272(s0)
				void* args;
				args = (void*)a3;
    80001f28:	fa843783          	ld	a5,-88(s0)
    80001f2c:	eef43423          	sd	a5,-280(s0)
				uint64* sp;
				sp = (uint64*)a4;
    80001f30:	fa043783          	ld	a5,-96(s0)
    80001f34:	eef43023          	sd	a5,-288(s0)

				*handle = TCB::createThread(function, args, sp);
    80001f38:	ee043603          	ld	a2,-288(s0)
    80001f3c:	ee843583          	ld	a1,-280(s0)
    80001f40:	ef043503          	ld	a0,-272(s0)
    80001f44:	00001097          	auipc	ra,0x1
    80001f48:	d58080e7          	jalr	-680(ra) # 80002c9c <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80001f4c:	00050713          	mv	a4,a0
    80001f50:	ef843783          	ld	a5,-264(s0)
    80001f54:	00e7b023          	sd	a4,0(a5)
				TCB::start(*handle);
    80001f58:	ef843783          	ld	a5,-264(s0)
    80001f5c:	0007b783          	ld	a5,0(a5)
    80001f60:	00078513          	mv	a0,a5
    80001f64:	00001097          	auipc	ra,0x1
    80001f68:	eb8080e7          	jalr	-328(ra) # 80002e1c <_ZN3TCB5startEPS_>
				if (*handle != nullptr) {
    80001f6c:	ef843783          	ld	a5,-264(s0)
    80001f70:	0007b783          	ld	a5,0(a5)
    80001f74:	00078663          	beqz	a5,80001f80 <interruptRoutine+0x1dc>
					__asm__ volatile("li a0, 0");
    80001f78:	00000513          	li	a0,0
    80001f7c:	0080006f          	j	80001f84 <interruptRoutine+0x1e0>
				} else {
					__asm__ volatile("li a0, -1");
    80001f80:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    80001f84:	04a43823          	sd	a0,80(s0)
				break;
    80001f88:	3800006f          	j	80002308 <interruptRoutine+0x564>
			case 0x12:
				//thread_exit
				TCB::running->setFinished(true);
    80001f8c:	0000a797          	auipc	a5,0xa
    80001f90:	b247b783          	ld	a5,-1244(a5) # 8000bab0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001f94:	0007b783          	ld	a5,0(a5)
    80001f98:	00100593          	li	a1,1
    80001f9c:	00078513          	mv	a0,a5
    80001fa0:	00000097          	auipc	ra,0x0
    80001fa4:	59c080e7          	jalr	1436(ra) # 8000253c <_ZN3TCB11setFinishedEb>
				TCB::releaseJoined();
    80001fa8:	00001097          	auipc	ra,0x1
    80001fac:	e18080e7          	jalr	-488(ra) # 80002dc0 <_ZN3TCB13releaseJoinedEv>
				TCB::yield();
    80001fb0:	00001097          	auipc	ra,0x1
    80001fb4:	c84080e7          	jalr	-892(ra) # 80002c34 <_ZN3TCB5yieldEv>
				break;
    80001fb8:	3500006f          	j	80002308 <interruptRoutine+0x564>
			case 0x13:
				//thread_dispatch
				TCB::yield();
    80001fbc:	00001097          	auipc	ra,0x1
    80001fc0:	c78080e7          	jalr	-904(ra) # 80002c34 <_ZN3TCB5yieldEv>
				break;
    80001fc4:	3440006f          	j	80002308 <interruptRoutine+0x564>
			case 0x14:
				//thread_join
				thread_t handleToJoin;
				handleToJoin = (thread_t)a1;
    80001fc8:	fb843783          	ld	a5,-72(s0)
    80001fcc:	f0f43023          	sd	a5,-256(s0)
				TCB::threadJoin(handleToJoin);
    80001fd0:	f0043503          	ld	a0,-256(s0)
    80001fd4:	00001097          	auipc	ra,0x1
    80001fd8:	da4080e7          	jalr	-604(ra) # 80002d78 <_ZN3TCB10threadJoinEPS_>
				TCB::yield();
    80001fdc:	00001097          	auipc	ra,0x1
    80001fe0:	c58080e7          	jalr	-936(ra) # 80002c34 <_ZN3TCB5yieldEv>
				break;
    80001fe4:	3240006f          	j	80002308 <interruptRoutine+0x564>
			case 0x21:
				//sem_open
				sem_t* openHandle;
				openHandle = (sem_t*)a1;
    80001fe8:	fb843783          	ld	a5,-72(s0)
    80001fec:	f0f43823          	sd	a5,-240(s0)
				uint initVal;
				initVal = (uint)a2;
    80001ff0:	fb043783          	ld	a5,-80(s0)
    80001ff4:	f0f42623          	sw	a5,-244(s0)
				*openHandle = KSem::initSem(initVal);
    80001ff8:	f0c42783          	lw	a5,-244(s0)
    80001ffc:	00078513          	mv	a0,a5
    80002000:	00001097          	auipc	ra,0x1
    80002004:	1c0080e7          	jalr	448(ra) # 800031c0 <_ZN4KSem7initSemEj>
    80002008:	00050713          	mv	a4,a0
    8000200c:	f1043783          	ld	a5,-240(s0)
    80002010:	00e7b023          	sd	a4,0(a5)
				if (*openHandle != nullptr) {
    80002014:	f1043783          	ld	a5,-240(s0)
    80002018:	0007b783          	ld	a5,0(a5)
    8000201c:	00078663          	beqz	a5,80002028 <interruptRoutine+0x284>
					__asm__ volatile("li a0, 0");
    80002020:	00000513          	li	a0,0
    80002024:	0080006f          	j	8000202c <interruptRoutine+0x288>
				} else {
					__asm__ volatile("li a0, -1");
    80002028:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    8000202c:	04a43823          	sd	a0,80(s0)
				break;
    80002030:	2d80006f          	j	80002308 <interruptRoutine+0x564>
			case 0x22:
				//sem_close
				sem_t closeHandle;
				closeHandle = (sem_t)a1;
    80002034:	fb843783          	ld	a5,-72(s0)
    80002038:	f0f43c23          	sd	a5,-232(s0)
				KSem::closeSem(closeHandle);
    8000203c:	f1843503          	ld	a0,-232(s0)
    80002040:	00001097          	auipc	ra,0x1
    80002044:	348080e7          	jalr	840(ra) # 80003388 <_ZN4KSem8closeSemEPS_>
				__asm__ volatile("sd a0, 80(s0)");
    80002048:	04a43823          	sd	a0,80(s0)
				break;
    8000204c:	2bc0006f          	j	80002308 <interruptRoutine+0x564>
			case 0x23:
				//sem_wait
				sem_t waitHandle;
				waitHandle = (sem_t)a1;
    80002050:	fb843783          	ld	a5,-72(s0)
    80002054:	f2f43023          	sd	a5,-224(s0)
				waitHandle->wait();
    80002058:	f2043503          	ld	a0,-224(s0)
    8000205c:	00001097          	auipc	ra,0x1
    80002060:	1f8080e7          	jalr	504(ra) # 80003254 <_ZN4KSem4waitEv>
				__asm__ volatile("sd a0, 80(s0)");
    80002064:	04a43823          	sd	a0,80(s0)
				break;
    80002068:	2a00006f          	j	80002308 <interruptRoutine+0x564>
			case 0x24:
				//sem_signal
				sem_t signalHandle;
				signalHandle = (sem_t)a1;
    8000206c:	fb843783          	ld	a5,-72(s0)
    80002070:	f2f43423          	sd	a5,-216(s0)
				signalHandle->signal();
    80002074:	f2843503          	ld	a0,-216(s0)
    80002078:	00001097          	auipc	ra,0x1
    8000207c:	294080e7          	jalr	660(ra) # 8000330c <_ZN4KSem6signalEv>
				__asm__ volatile("sd a0, 80(s0)");
    80002080:	04a43823          	sd	a0,80(s0)
				break;
    80002084:	2840006f          	j	80002308 <interruptRoutine+0x564>
			case 0x31:
				//time_sleep
				time_t timerPeriods;
				timerPeriods = (time_t)a1;
    80002088:	fb843783          	ld	a5,-72(s0)
    8000208c:	f2f43823          	sd	a5,-208(s0)
				if (timerPeriods > 0) {
    80002090:	f3043783          	ld	a5,-208(s0)
    80002094:	00078663          	beqz	a5,800020a0 <interruptRoutine+0x2fc>
					__asm__ volatile("li a0, 0");
    80002098:	00000513          	li	a0,0
    8000209c:	0080006f          	j	800020a4 <interruptRoutine+0x300>
				} else {
					__asm__ volatile("li a0, -1");
    800020a0:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    800020a4:	04a43823          	sd	a0,80(s0)
				if (timerPeriods > 0) {
    800020a8:	f3043783          	ld	a5,-208(s0)
    800020ac:	24078463          	beqz	a5,800022f4 <interruptRoutine+0x550>
					Scheduler::putToSleep(TCB::running, timerPeriods);
    800020b0:	0000a797          	auipc	a5,0xa
    800020b4:	a007b783          	ld	a5,-1536(a5) # 8000bab0 <_GLOBAL_OFFSET_TABLE_+0x58>
    800020b8:	0007b783          	ld	a5,0(a5)
    800020bc:	f3043583          	ld	a1,-208(s0)
    800020c0:	00078513          	mv	a0,a5
    800020c4:	00000097          	auipc	ra,0x0
    800020c8:	980080e7          	jalr	-1664(ra) # 80001a44 <_ZN9Scheduler10putToSleepEP3TCBm>
					TCB::yield();
    800020cc:	00001097          	auipc	ra,0x1
    800020d0:	b68080e7          	jalr	-1176(ra) # 80002c34 <_ZN3TCB5yieldEv>
				}
				break;
    800020d4:	2200006f          	j	800022f4 <interruptRoutine+0x550>
			case 0x41:
				//getc
				KConsole::kgetc();
    800020d8:	00000097          	auipc	ra,0x0
    800020dc:	85c080e7          	jalr	-1956(ra) # 80001934 <_ZN8KConsole5kgetcEv>
				__asm__ volatile("sd a0, 80(s0)");
    800020e0:	04a43823          	sd	a0,80(s0)
				break;
    800020e4:	2240006f          	j	80002308 <interruptRoutine+0x564>
			case 0x42:
				//putc
				char c;
				c = (char)a1;
    800020e8:	fb843783          	ld	a5,-72(s0)
    800020ec:	f2f40fa3          	sb	a5,-193(s0)
				KConsole::kputc(c);
    800020f0:	f3f44783          	lbu	a5,-193(s0)
    800020f4:	00078513          	mv	a0,a5
    800020f8:	fffff097          	auipc	ra,0xfffff
    800020fc:	7cc080e7          	jalr	1996(ra) # 800018c4 <_ZN8KConsole5kputcEc>
				break;
    80002100:	2080006f          	j	80002308 <interruptRoutine+0x564>
			case 0x80:
				//alloc thread
				thread_t* handleAlloc;
				handleAlloc = (thread_t*)a1;
    80002104:	fb843783          	ld	a5,-72(s0)
    80002108:	f4f43c23          	sd	a5,-168(s0)
				void (* foo)(void*);
				foo = (void (*)(void*))a2;
    8000210c:	fb043783          	ld	a5,-80(s0)
    80002110:	f4f43823          	sd	a5,-176(s0)
				void* argsAlloc;
				argsAlloc = (void*)a3;
    80002114:	fa843783          	ld	a5,-88(s0)
    80002118:	f4f43423          	sd	a5,-184(s0)
				uint64* spAlloc;
				spAlloc = (uint64*)a4;
    8000211c:	fa043783          	ld	a5,-96(s0)
    80002120:	f4f43023          	sd	a5,-192(s0)

				*handleAlloc = TCB::createThread(foo, argsAlloc, spAlloc);
    80002124:	f4043603          	ld	a2,-192(s0)
    80002128:	f4843583          	ld	a1,-184(s0)
    8000212c:	f5043503          	ld	a0,-176(s0)
    80002130:	00001097          	auipc	ra,0x1
    80002134:	b6c080e7          	jalr	-1172(ra) # 80002c9c <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80002138:	00050713          	mv	a4,a0
    8000213c:	f5843783          	ld	a5,-168(s0)
    80002140:	00e7b023          	sd	a4,0(a5)
				if (*handleAlloc != nullptr) {
    80002144:	f5843783          	ld	a5,-168(s0)
    80002148:	0007b783          	ld	a5,0(a5)
    8000214c:	00078663          	beqz	a5,80002158 <interruptRoutine+0x3b4>
					__asm__ volatile("li a0, 0");
    80002150:	00000513          	li	a0,0
    80002154:	0080006f          	j	8000215c <interruptRoutine+0x3b8>
				} else {
					__asm__ volatile("li a0, -1");
    80002158:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    8000215c:	04a43823          	sd	a0,80(s0)
				break;
    80002160:	1a80006f          	j	80002308 <interruptRoutine+0x564>
			case 0x81:
				//start thread
				thread_t threadStartHandle;
				threadStartHandle = (thread_t)a1;
    80002164:	fb843783          	ld	a5,-72(s0)
    80002168:	f6f43023          	sd	a5,-160(s0)
				Scheduler::put(threadStartHandle);
    8000216c:	f6043503          	ld	a0,-160(s0)
    80002170:	00000097          	auipc	ra,0x0
    80002174:	850080e7          	jalr	-1968(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
				break;
    80002178:	1900006f          	j	80002308 <interruptRoutine+0x564>
			case 0x90:
				//printString
				const char* string;
				string = (const char*)a1;
    8000217c:	fb843783          	ld	a5,-72(s0)
    80002180:	fef43423          	sd	a5,-24(s0)
				while (*string != '\0') {
    80002184:	fe843783          	ld	a5,-24(s0)
    80002188:	0007c783          	lbu	a5,0(a5)
    8000218c:	16078863          	beqz	a5,800022fc <interruptRoutine+0x558>
					putc(*string);
    80002190:	fe843783          	ld	a5,-24(s0)
    80002194:	0007c783          	lbu	a5,0(a5)
    80002198:	00078513          	mv	a0,a5
    8000219c:	fffff097          	auipc	ra,0xfffff
    800021a0:	3f4080e7          	jalr	1012(ra) # 80001590 <_Z4putcc>
					string++;
    800021a4:	fe843783          	ld	a5,-24(s0)
    800021a8:	00178793          	addi	a5,a5,1
    800021ac:	fef43423          	sd	a5,-24(s0)
				while (*string != '\0') {
    800021b0:	fd5ff06f          	j	80002184 <interruptRoutine+0x3e0>
				}
				break;
			case 0x91:
				//printInteger
				uint64 integer;
				integer = a1;
    800021b4:	fb843783          	ld	a5,-72(s0)
    800021b8:	f6f43823          	sd	a5,-144(s0)
				static char digits[] = "0123456789";
				char buf[16];
				int i, neg;
				uint x;

				neg = 0;
    800021bc:	f6042623          	sw	zero,-148(s0)
				if (integer < 0) {
					neg = 1;
					x = -integer;
				} else {
					x = integer;
    800021c0:	f7043783          	ld	a5,-144(s0)
    800021c4:	fef42023          	sw	a5,-32(s0)
				}

				i = 0;
    800021c8:	fe042223          	sw	zero,-28(s0)
				do {
					buf[i++] = digits[x % 10];
    800021cc:	fe042703          	lw	a4,-32(s0)
    800021d0:	00a00793          	li	a5,10
    800021d4:	02f777bb          	remuw	a5,a4,a5
    800021d8:	0007861b          	sext.w	a2,a5
    800021dc:	fe442783          	lw	a5,-28(s0)
    800021e0:	0017871b          	addiw	a4,a5,1
    800021e4:	fee42223          	sw	a4,-28(s0)
    800021e8:	00009697          	auipc	a3,0x9
    800021ec:	64068693          	addi	a3,a3,1600 # 8000b828 <_ZZ16interruptRoutineE6digits>
    800021f0:	02061713          	slli	a4,a2,0x20
    800021f4:	02075713          	srli	a4,a4,0x20
    800021f8:	00e68733          	add	a4,a3,a4
    800021fc:	00074703          	lbu	a4,0(a4)
    80002200:	ff040693          	addi	a3,s0,-16
    80002204:	00f687b3          	add	a5,a3,a5
    80002208:	ece78823          	sb	a4,-304(a5)
				} while ((x /= 10) != 0);
    8000220c:	fe042703          	lw	a4,-32(s0)
    80002210:	00a00793          	li	a5,10
    80002214:	02f757bb          	divuw	a5,a4,a5
    80002218:	fef42023          	sw	a5,-32(s0)
    8000221c:	fe042783          	lw	a5,-32(s0)
    80002220:	0007879b          	sext.w	a5,a5
    80002224:	00f037b3          	snez	a5,a5
    80002228:	0ff7f793          	andi	a5,a5,255
    8000222c:	00078463          	beqz	a5,80002234 <interruptRoutine+0x490>
				do {
    80002230:	f9dff06f          	j	800021cc <interruptRoutine+0x428>
				if (neg) buf[i++] = '-';
    80002234:	f6c42783          	lw	a5,-148(s0)
    80002238:	0007879b          	sext.w	a5,a5
    8000223c:	02078063          	beqz	a5,8000225c <interruptRoutine+0x4b8>
    80002240:	fe442783          	lw	a5,-28(s0)
    80002244:	0017871b          	addiw	a4,a5,1
    80002248:	fee42223          	sw	a4,-28(s0)
    8000224c:	ff040713          	addi	a4,s0,-16
    80002250:	00f707b3          	add	a5,a4,a5
    80002254:	02d00713          	li	a4,45
    80002258:	ece78823          	sb	a4,-304(a5)

				while (--i >= 0) {
    8000225c:	fe442783          	lw	a5,-28(s0)
    80002260:	fff7879b          	addiw	a5,a5,-1
    80002264:	fef42223          	sw	a5,-28(s0)
    80002268:	fe442783          	lw	a5,-28(s0)
    8000226c:	fff7c793          	not	a5,a5
    80002270:	01f7d79b          	srliw	a5,a5,0x1f
    80002274:	0ff7f793          	andi	a5,a5,255
    80002278:	08078663          	beqz	a5,80002304 <interruptRoutine+0x560>
					putc(buf[i]);
    8000227c:	fe442783          	lw	a5,-28(s0)
    80002280:	ff040713          	addi	a4,s0,-16
    80002284:	00f707b3          	add	a5,a4,a5
    80002288:	ed07c783          	lbu	a5,-304(a5)
    8000228c:	00078513          	mv	a0,a5
    80002290:	fffff097          	auipc	ra,0xfffff
    80002294:	300080e7          	jalr	768(ra) # 80001590 <_Z4putcc>
				while (--i >= 0) {
    80002298:	fc5ff06f          	j	8000225c <interruptRoutine+0x4b8>
				}
				break;
			default:
				printString("\nNepostojeci op code: ");
    8000229c:	00007517          	auipc	a0,0x7
    800022a0:	dd450513          	addi	a0,a0,-556 # 80009070 <CONSOLE_STATUS+0x60>
    800022a4:	00003097          	auipc	ra,0x3
    800022a8:	774080e7          	jalr	1908(ra) # 80005a18 <_Z11printStringPKc>
				printInteger(opCode);
    800022ac:	f7843503          	ld	a0,-136(s0)
    800022b0:	fffff097          	auipc	ra,0xfffff
    800022b4:	6e8080e7          	jalr	1768(ra) # 80001998 <_Z12printIntegerm>
				printString("\nscause: ");
    800022b8:	00007517          	auipc	a0,0x7
    800022bc:	dd050513          	addi	a0,a0,-560 # 80009088 <CONSOLE_STATUS+0x78>
    800022c0:	00003097          	auipc	ra,0x3
    800022c4:	758080e7          	jalr	1880(ra) # 80005a18 <_Z11printStringPKc>
				printInteger(scause);
    800022c8:	fd843503          	ld	a0,-40(s0)
    800022cc:	fffff097          	auipc	ra,0xfffff
    800022d0:	6cc080e7          	jalr	1740(ra) # 80001998 <_Z12printIntegerm>
				printString("\nsepc: ");
    800022d4:	00007517          	auipc	a0,0x7
    800022d8:	dc450513          	addi	a0,a0,-572 # 80009098 <CONSOLE_STATUS+0x88>
    800022dc:	00003097          	auipc	ra,0x3
    800022e0:	73c080e7          	jalr	1852(ra) # 80005a18 <_Z11printStringPKc>
				printInteger(sepc);
    800022e4:	fd043503          	ld	a0,-48(s0)
    800022e8:	fffff097          	auipc	ra,0xfffff
    800022ec:	6b0080e7          	jalr	1712(ra) # 80001998 <_Z12printIntegerm>
				break;
    800022f0:	0180006f          	j	80002308 <interruptRoutine+0x564>
				break;
    800022f4:	00000013          	nop
    800022f8:	0100006f          	j	80002308 <interruptRoutine+0x564>
				break;
    800022fc:	00000013          	nop
    80002300:	0080006f          	j	80002308 <interruptRoutine+0x564>
				break;
    80002304:	00000013          	nop
		}
		//sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
		//sepc += 4;
		__asm__ volatile("addi %[dst], %[src], 0x4":[dst]"=r"(sepc):[src]"r"(
				sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002308:	fd043303          	ld	t1,-48(s0)
    8000230c:	00430313          	addi	t1,t1,4
    80002310:	fc643823          	sd	t1,-48(s0)
		__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002314:	fd043303          	ld	t1,-48(s0)
    80002318:	14131073          	csrw	sepc,t1
		__asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000231c:	fc843303          	ld	t1,-56(s0)
    80002320:	10031073          	csrw	sstatus,t1
    80002324:	00000013          	nop
		printString("scause: ");
		printInteger(scause);
		printString("\nsepc: ");
		printInteger(sepc);
	}
}
    80002328:	1ac0006f          	j	800024d4 <interruptRoutine+0x730>
	} else if (scause == (1UL << 63 | 9)) {
    8000232c:	fd843703          	ld	a4,-40(s0)
    80002330:	fff00793          	li	a5,-1
    80002334:	03f79793          	slli	a5,a5,0x3f
    80002338:	00978793          	addi	a5,a5,9
    8000233c:	0af71263          	bne	a4,a5,800023e0 <interruptRoutine+0x63c>
		uint64 irq = plic_claim();
    80002340:	00005097          	auipc	ra,0x5
    80002344:	184080e7          	jalr	388(ra) # 800074c4 <plic_claim>
    80002348:	00050793          	mv	a5,a0
    8000234c:	f8f43023          	sd	a5,-128(s0)
		if (irq == CONSOLE_IRQ) {
    80002350:	f8043703          	ld	a4,-128(s0)
    80002354:	00a00793          	li	a5,10
    80002358:	04f71863          	bne	a4,a5,800023a8 <interruptRoutine+0x604>
			if (*KConsole::sr & CONSOLE_RX_STATUS_BIT) {
    8000235c:	00009797          	auipc	a5,0x9
    80002360:	77c7b783          	ld	a5,1916(a5) # 8000bad8 <_GLOBAL_OFFSET_TABLE_+0x80>
    80002364:	0007b783          	ld	a5,0(a5)
    80002368:	0007c783          	lbu	a5,0(a5)
    8000236c:	0017f793          	andi	a5,a5,1
    80002370:	02078063          	beqz	a5,80002390 <interruptRoutine+0x5ec>
				KConsole::placeInInput(*KConsole::dr);
    80002374:	00009797          	auipc	a5,0x9
    80002378:	72c7b783          	ld	a5,1836(a5) # 8000baa0 <_GLOBAL_OFFSET_TABLE_+0x48>
    8000237c:	0007b783          	ld	a5,0(a5)
    80002380:	0007c783          	lbu	a5,0(a5)
    80002384:	00078513          	mv	a0,a5
    80002388:	fffff097          	auipc	ra,0xfffff
    8000238c:	4d0080e7          	jalr	1232(ra) # 80001858 <_ZN8KConsole12placeInInputEc>
			plic_complete(irq);
    80002390:	f8043783          	ld	a5,-128(s0)
    80002394:	0007879b          	sext.w	a5,a5
    80002398:	00078513          	mv	a0,a5
    8000239c:	00005097          	auipc	ra,0x5
    800023a0:	160080e7          	jalr	352(ra) # 800074fc <plic_complete>
    800023a4:	0140006f          	j	800023b8 <interruptRoutine+0x614>
			printString("Neki drugi prekid\n");
    800023a8:	00007517          	auipc	a0,0x7
    800023ac:	cf850513          	addi	a0,a0,-776 # 800090a0 <CONSOLE_STATUS+0x90>
    800023b0:	00003097          	auipc	ra,0x3
    800023b4:	668080e7          	jalr	1640(ra) # 80005a18 <_Z11printStringPKc>
		Riscv::w_sepc(sepc);
    800023b8:	fd043503          	ld	a0,-48(s0)
    800023bc:	00000097          	auipc	ra,0x0
    800023c0:	12c080e7          	jalr	300(ra) # 800024e8 <_ZN5Riscv6w_sepcEm>
		Riscv::w_sstatus(sstatus);
    800023c4:	fc843503          	ld	a0,-56(s0)
    800023c8:	00000097          	auipc	ra,0x0
    800023cc:	158080e7          	jalr	344(ra) # 80002520 <_ZN5Riscv9w_sstatusEm>
		Riscv::mc_sip(Riscv::SIP_SEIP);
    800023d0:	20000513          	li	a0,512
    800023d4:	00000097          	auipc	ra,0x0
    800023d8:	130080e7          	jalr	304(ra) # 80002504 <_ZN5Riscv6mc_sipEm>
}
    800023dc:	0f80006f          	j	800024d4 <interruptRoutine+0x730>
	} else if (scause == (1UL << 63 | 1)) {
    800023e0:	fd843703          	ld	a4,-40(s0)
    800023e4:	fff00793          	li	a5,-1
    800023e8:	03f79793          	slli	a5,a5,0x3f
    800023ec:	00178793          	addi	a5,a5,1
    800023f0:	08f71e63          	bne	a4,a5,8000248c <interruptRoutine+0x6e8>
		Scheduler::wake();
    800023f4:	fffff097          	auipc	ra,0xfffff
    800023f8:	6f8080e7          	jalr	1784(ra) # 80001aec <_ZN9Scheduler4wakeEv>
		TCB::runningTimeSlice++;
    800023fc:	00009797          	auipc	a5,0x9
    80002400:	6747b783          	ld	a5,1652(a5) # 8000ba70 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002404:	0007b783          	ld	a5,0(a5)
    80002408:	00178713          	addi	a4,a5,1
    8000240c:	00009797          	auipc	a5,0x9
    80002410:	6647b783          	ld	a5,1636(a5) # 8000ba70 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002414:	00e7b023          	sd	a4,0(a5)
		if (TCB::runningTimeSlice >= TCB::running->getTimeSlice()) {
    80002418:	00009797          	auipc	a5,0x9
    8000241c:	6987b783          	ld	a5,1688(a5) # 8000bab0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002420:	0007b783          	ld	a5,0(a5)
    80002424:	00078513          	mv	a0,a5
    80002428:	00000097          	auipc	ra,0x0
    8000242c:	130080e7          	jalr	304(ra) # 80002558 <_ZN3TCB12getTimeSliceEv>
    80002430:	00050713          	mv	a4,a0
    80002434:	00009797          	auipc	a5,0x9
    80002438:	63c7b783          	ld	a5,1596(a5) # 8000ba70 <_GLOBAL_OFFSET_TABLE_+0x18>
    8000243c:	0007b783          	ld	a5,0(a5)
    80002440:	00e7b7b3          	sltu	a5,a5,a4
    80002444:	0017c793          	xori	a5,a5,1
    80002448:	0ff7f793          	andi	a5,a5,255
    8000244c:	00078c63          	beqz	a5,80002464 <interruptRoutine+0x6c0>
			TCB::yield();
    80002450:	00000097          	auipc	ra,0x0
    80002454:	7e4080e7          	jalr	2020(ra) # 80002c34 <_ZN3TCB5yieldEv>
			TCB::runningTimeSlice = 0;
    80002458:	00009797          	auipc	a5,0x9
    8000245c:	6187b783          	ld	a5,1560(a5) # 8000ba70 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002460:	0007b023          	sd	zero,0(a5)
		Riscv::w_sepc(sepc);
    80002464:	fd043503          	ld	a0,-48(s0)
    80002468:	00000097          	auipc	ra,0x0
    8000246c:	080080e7          	jalr	128(ra) # 800024e8 <_ZN5Riscv6w_sepcEm>
		Riscv::w_sstatus(sstatus);
    80002470:	fc843503          	ld	a0,-56(s0)
    80002474:	00000097          	auipc	ra,0x0
    80002478:	0ac080e7          	jalr	172(ra) # 80002520 <_ZN5Riscv9w_sstatusEm>
		Riscv::mc_sip(Riscv::SIP_SSIP);
    8000247c:	00200513          	li	a0,2
    80002480:	00000097          	auipc	ra,0x0
    80002484:	084080e7          	jalr	132(ra) # 80002504 <_ZN5Riscv6mc_sipEm>
}
    80002488:	04c0006f          	j	800024d4 <interruptRoutine+0x730>
		printString("\nGreska u prekidnoj rutini\n");
    8000248c:	00007517          	auipc	a0,0x7
    80002490:	c2c50513          	addi	a0,a0,-980 # 800090b8 <CONSOLE_STATUS+0xa8>
    80002494:	00003097          	auipc	ra,0x3
    80002498:	584080e7          	jalr	1412(ra) # 80005a18 <_Z11printStringPKc>
		printString("scause: ");
    8000249c:	00007517          	auipc	a0,0x7
    800024a0:	c3c50513          	addi	a0,a0,-964 # 800090d8 <CONSOLE_STATUS+0xc8>
    800024a4:	00003097          	auipc	ra,0x3
    800024a8:	574080e7          	jalr	1396(ra) # 80005a18 <_Z11printStringPKc>
		printInteger(scause);
    800024ac:	fd843503          	ld	a0,-40(s0)
    800024b0:	fffff097          	auipc	ra,0xfffff
    800024b4:	4e8080e7          	jalr	1256(ra) # 80001998 <_Z12printIntegerm>
		printString("\nsepc: ");
    800024b8:	00007517          	auipc	a0,0x7
    800024bc:	be050513          	addi	a0,a0,-1056 # 80009098 <CONSOLE_STATUS+0x88>
    800024c0:	00003097          	auipc	ra,0x3
    800024c4:	558080e7          	jalr	1368(ra) # 80005a18 <_Z11printStringPKc>
		printInteger(sepc);
    800024c8:	fd043503          	ld	a0,-48(s0)
    800024cc:	fffff097          	auipc	ra,0xfffff
    800024d0:	4cc080e7          	jalr	1228(ra) # 80001998 <_Z12printIntegerm>
}
    800024d4:	00000013          	nop
    800024d8:	13813083          	ld	ra,312(sp)
    800024dc:	13013403          	ld	s0,304(sp)
    800024e0:	14010113          	addi	sp,sp,320
    800024e4:	00008067          	ret

00000000800024e8 <_ZN5Riscv6w_sepcEm>:
inline void Riscv::w_sepc(uint64 sepc) {
    800024e8:	ff010113          	addi	sp,sp,-16
    800024ec:	00813423          	sd	s0,8(sp)
    800024f0:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    800024f4:	14151073          	csrw	sepc,a0
}
    800024f8:	00813403          	ld	s0,8(sp)
    800024fc:	01010113          	addi	sp,sp,16
    80002500:	00008067          	ret

0000000080002504 <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    80002504:	ff010113          	addi	sp,sp,-16
    80002508:	00813423          	sd	s0,8(sp)
    8000250c:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    80002510:	14453073          	csrc	sip,a0
}
    80002514:	00813403          	ld	s0,8(sp)
    80002518:	01010113          	addi	sp,sp,16
    8000251c:	00008067          	ret

0000000080002520 <_ZN5Riscv9w_sstatusEm>:
	uint64 volatile sstatus;
	__asm__ volatile("csrr %[sstatus], sstatus": [sstatus] "=r"(sstatus));
	return sstatus;
}

inline void Riscv::w_sstatus(uint64 sstatus) {
    80002520:	ff010113          	addi	sp,sp,-16
    80002524:	00813423          	sd	s0,8(sp)
    80002528:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw sstatus, %[sstatus]": :[sstatus] "r"(sstatus));
    8000252c:	10051073          	csrw	sstatus,a0
}
    80002530:	00813403          	ld	s0,8(sp)
    80002534:	01010113          	addi	sp,sp,16
    80002538:	00008067          	ret

000000008000253c <_ZN3TCB11setFinishedEb>:
	static TCB* createThread(Body function, void* args, uint64* stack);
	static void start(TCB* newTcb);

	bool isFinished() { return finished; }

	void setFinished(bool finish) { this->finished = finish; }
    8000253c:	ff010113          	addi	sp,sp,-16
    80002540:	00813423          	sd	s0,8(sp)
    80002544:	01010413          	addi	s0,sp,16
    80002548:	02b50823          	sb	a1,48(a0)
    8000254c:	00813403          	ld	s0,8(sp)
    80002550:	01010113          	addi	sp,sp,16
    80002554:	00008067          	ret

0000000080002558 <_ZN3TCB12getTimeSliceEv>:

	bool isBlocked() { return blocked; }

	void setBlocked(bool block) { this->blocked = block; }

	uint64 getTimeSlice() { return timeSlice; }
    80002558:	ff010113          	addi	sp,sp,-16
    8000255c:	00813423          	sd	s0,8(sp)
    80002560:	01010413          	addi	s0,sp,16
    80002564:	02853503          	ld	a0,40(a0)
    80002568:	00813403          	ld	s0,8(sp)
    8000256c:	01010113          	addi	sp,sp,16
    80002570:	00008067          	ret

0000000080002574 <_ZN6Thread7wrapperEPv>:

	__asm__ volatile("ecall");
}

void Thread::wrapper(void* thread) {
	if(thread!=nullptr){
    80002574:	02050863          	beqz	a0,800025a4 <_ZN6Thread7wrapperEPv+0x30>
void Thread::wrapper(void* thread) {
    80002578:	ff010113          	addi	sp,sp,-16
    8000257c:	00113423          	sd	ra,8(sp)
    80002580:	00813023          	sd	s0,0(sp)
    80002584:	01010413          	addi	s0,sp,16
		((Thread*)thread)->run();
    80002588:	00053783          	ld	a5,0(a0)
    8000258c:	0107b783          	ld	a5,16(a5)
    80002590:	000780e7          	jalr	a5
	}
}
    80002594:	00813083          	ld	ra,8(sp)
    80002598:	00013403          	ld	s0,0(sp)
    8000259c:	01010113          	addi	sp,sp,16
    800025a0:	00008067          	ret
    800025a4:	00008067          	ret

00000000800025a8 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    800025a8:	ff010113          	addi	sp,sp,-16
    800025ac:	00113423          	sd	ra,8(sp)
    800025b0:	00813023          	sd	s0,0(sp)
    800025b4:	01010413          	addi	s0,sp,16
    800025b8:	00009797          	auipc	a5,0x9
    800025bc:	2c078793          	addi	a5,a5,704 # 8000b878 <_ZTV6Thread+0x10>
    800025c0:	00f53023          	sd	a5,0(a0)
	thread_exit();
    800025c4:	fffff097          	auipc	ra,0xfffff
    800025c8:	e3c080e7          	jalr	-452(ra) # 80001400 <_Z11thread_exitv>
}
    800025cc:	00813083          	ld	ra,8(sp)
    800025d0:	00013403          	ld	s0,0(sp)
    800025d4:	01010113          	addi	sp,sp,16
    800025d8:	00008067          	ret

00000000800025dc <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
	sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    800025dc:	fe010113          	addi	sp,sp,-32
    800025e0:	00113c23          	sd	ra,24(sp)
    800025e4:	00813823          	sd	s0,16(sp)
    800025e8:	00913423          	sd	s1,8(sp)
    800025ec:	02010413          	addi	s0,sp,32
    800025f0:	00050493          	mv	s1,a0
    800025f4:	00009797          	auipc	a5,0x9
    800025f8:	2ac78793          	addi	a5,a5,684 # 8000b8a0 <_ZTV9Semaphore+0x10>
    800025fc:	00f53023          	sd	a5,0(a0)
	sem_close(myHandle);
    80002600:	00853503          	ld	a0,8(a0)
    80002604:	fffff097          	auipc	ra,0xfffff
    80002608:	ed4080e7          	jalr	-300(ra) # 800014d8 <_Z9sem_closeP4KSem>
	delete myHandle;
    8000260c:	0084b483          	ld	s1,8(s1)
    80002610:	02048863          	beqz	s1,80002640 <_ZN9SemaphoreD1Ev+0x64>
			delete node;
		}
	}

	bool isEmpty() const {
		return front == nullptr;
    80002614:	0084b503          	ld	a0,8(s1)
		while (!isEmpty()) {
    80002618:	00050e63          	beqz	a0,80002634 <_ZN9SemaphoreD1Ev+0x58>
			front = front->next;
    8000261c:	00853783          	ld	a5,8(a0)
    80002620:	00f4b423          	sd	a5,8(s1)
			delete node;
    80002624:	fe0508e3          	beqz	a0,80002614 <_ZN9SemaphoreD1Ev+0x38>
			mem_free(ptr);
    80002628:	fffff097          	auipc	ra,0xfffff
    8000262c:	d28080e7          	jalr	-728(ra) # 80001350 <_Z8mem_freePv>
		}
    80002630:	fe5ff06f          	j	80002614 <_ZN9SemaphoreD1Ev+0x38>
    80002634:	00048513          	mv	a0,s1
    80002638:	00001097          	auipc	ra,0x1
    8000263c:	b60080e7          	jalr	-1184(ra) # 80003198 <_ZN4KSemdlEPv>
}
    80002640:	01813083          	ld	ra,24(sp)
    80002644:	01013403          	ld	s0,16(sp)
    80002648:	00813483          	ld	s1,8(sp)
    8000264c:	02010113          	addi	sp,sp,32
    80002650:	00008067          	ret

0000000080002654 <_Znwm>:
void* operator new(size_t size) {
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

000000008000267c <_Znam>:
void* operator new[](size_t size) {
    8000267c:	ff010113          	addi	sp,sp,-16
    80002680:	00113423          	sd	ra,8(sp)
    80002684:	00813023          	sd	s0,0(sp)
    80002688:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    8000268c:	fffff097          	auipc	ra,0xfffff
    80002690:	c84080e7          	jalr	-892(ra) # 80001310 <_Z9mem_allocm>
}
    80002694:	00813083          	ld	ra,8(sp)
    80002698:	00013403          	ld	s0,0(sp)
    8000269c:	01010113          	addi	sp,sp,16
    800026a0:	00008067          	ret

00000000800026a4 <_ZdlPv>:
noexcept {
    800026a4:	ff010113          	addi	sp,sp,-16
    800026a8:	00113423          	sd	ra,8(sp)
    800026ac:	00813023          	sd	s0,0(sp)
    800026b0:	01010413          	addi	s0,sp,16
mem_free(ptr);
    800026b4:	fffff097          	auipc	ra,0xfffff
    800026b8:	c9c080e7          	jalr	-868(ra) # 80001350 <_Z8mem_freePv>
}
    800026bc:	00813083          	ld	ra,8(sp)
    800026c0:	00013403          	ld	s0,0(sp)
    800026c4:	01010113          	addi	sp,sp,16
    800026c8:	00008067          	ret

00000000800026cc <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    800026cc:	fe010113          	addi	sp,sp,-32
    800026d0:	00113c23          	sd	ra,24(sp)
    800026d4:	00813823          	sd	s0,16(sp)
    800026d8:	00913423          	sd	s1,8(sp)
    800026dc:	02010413          	addi	s0,sp,32
    800026e0:	00050493          	mv	s1,a0
}
    800026e4:	00000097          	auipc	ra,0x0
    800026e8:	ec4080e7          	jalr	-316(ra) # 800025a8 <_ZN6ThreadD1Ev>
    800026ec:	00048513          	mv	a0,s1
    800026f0:	00000097          	auipc	ra,0x0
    800026f4:	fb4080e7          	jalr	-76(ra) # 800026a4 <_ZdlPv>
    800026f8:	01813083          	ld	ra,24(sp)
    800026fc:	01013403          	ld	s0,16(sp)
    80002700:	00813483          	ld	s1,8(sp)
    80002704:	02010113          	addi	sp,sp,32
    80002708:	00008067          	ret

000000008000270c <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    8000270c:	fe010113          	addi	sp,sp,-32
    80002710:	00113c23          	sd	ra,24(sp)
    80002714:	00813823          	sd	s0,16(sp)
    80002718:	00913423          	sd	s1,8(sp)
    8000271c:	02010413          	addi	s0,sp,32
    80002720:	00050493          	mv	s1,a0
}
    80002724:	00000097          	auipc	ra,0x0
    80002728:	eb8080e7          	jalr	-328(ra) # 800025dc <_ZN9SemaphoreD1Ev>
    8000272c:	00048513          	mv	a0,s1
    80002730:	00000097          	auipc	ra,0x0
    80002734:	f74080e7          	jalr	-140(ra) # 800026a4 <_ZdlPv>
    80002738:	01813083          	ld	ra,24(sp)
    8000273c:	01013403          	ld	s0,16(sp)
    80002740:	00813483          	ld	s1,8(sp)
    80002744:	02010113          	addi	sp,sp,32
    80002748:	00008067          	ret

000000008000274c <_ZdaPv>:
noexcept {
    8000274c:	ff010113          	addi	sp,sp,-16
    80002750:	00113423          	sd	ra,8(sp)
    80002754:	00813023          	sd	s0,0(sp)
    80002758:	01010413          	addi	s0,sp,16
mem_free(ptr);
    8000275c:	fffff097          	auipc	ra,0xfffff
    80002760:	bf4080e7          	jalr	-1036(ra) # 80001350 <_Z8mem_freePv>
}
    80002764:	00813083          	ld	ra,8(sp)
    80002768:	00013403          	ld	s0,0(sp)
    8000276c:	01010113          	addi	sp,sp,16
    80002770:	00008067          	ret

0000000080002774 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (* body)(void*), void* arg) {
    80002774:	fd010113          	addi	sp,sp,-48
    80002778:	02113423          	sd	ra,40(sp)
    8000277c:	02813023          	sd	s0,32(sp)
    80002780:	00913c23          	sd	s1,24(sp)
    80002784:	01213823          	sd	s2,16(sp)
    80002788:	01313423          	sd	s3,8(sp)
    8000278c:	03010413          	addi	s0,sp,48
    80002790:	00050493          	mv	s1,a0
    80002794:	00058913          	mv	s2,a1
    80002798:	00060993          	mv	s3,a2
    8000279c:	00009797          	auipc	a5,0x9
    800027a0:	0dc78793          	addi	a5,a5,220 # 8000b878 <_ZTV6Thread+0x10>
    800027a4:	00f53023          	sd	a5,0(a0)
	this->body = body;
    800027a8:	00b53823          	sd	a1,16(a0)
	this->arg = arg;
    800027ac:	00c53c23          	sd	a2,24(a0)
	if (body != nullptr) {
    800027b0:	04058663          	beqz	a1,800027fc <_ZN6ThreadC1EPFvPvES0_+0x88>
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    800027b4:	00001537          	lui	a0,0x1
    800027b8:	fffff097          	auipc	ra,0xfffff
    800027bc:	b58080e7          	jalr	-1192(ra) # 80001310 <_Z9mem_allocm>
    800027c0:	00050313          	mv	t1,a0
	__asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800027c4:	00030713          	mv	a4,t1
	__asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800027c8:	00098693          	mv	a3,s3
			body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800027cc:	00090613          	mv	a2,s2
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800027d0:	00848493          	addi	s1,s1,8
    800027d4:	00048593          	mv	a1,s1
	__asm__ volatile("li a0, 0x80");
    800027d8:	08000513          	li	a0,128
	__asm__ volatile("ecall");
    800027dc:	00000073          	ecall
}
    800027e0:	02813083          	ld	ra,40(sp)
    800027e4:	02013403          	ld	s0,32(sp)
    800027e8:	01813483          	ld	s1,24(sp)
    800027ec:	01013903          	ld	s2,16(sp)
    800027f0:	00813983          	ld	s3,8(sp)
    800027f4:	03010113          	addi	sp,sp,48
    800027f8:	00008067          	ret
	uint64* stack = nullptr;
    800027fc:	00000313          	li	t1,0
    80002800:	fc5ff06f          	j	800027c4 <_ZN6ThreadC1EPFvPvES0_+0x50>

0000000080002804 <_ZN6Thread5startEv>:
int Thread::start() {
    80002804:	ff010113          	addi	sp,sp,-16
    80002808:	00813423          	sd	s0,8(sp)
    8000280c:	01010413          	addi	s0,sp,16
	if (myHandle == nullptr) return -1;
    80002810:	00853303          	ld	t1,8(a0) # 1008 <_entry-0x7fffeff8>
    80002814:	02030063          	beqz	t1,80002834 <_ZN6Thread5startEv+0x30>
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002818:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x81");
    8000281c:	08100513          	li	a0,129
	__asm__ volatile("ecall");
    80002820:	00000073          	ecall
	return 0;
    80002824:	00000513          	li	a0,0
}
    80002828:	00813403          	ld	s0,8(sp)
    8000282c:	01010113          	addi	sp,sp,16
    80002830:	00008067          	ret
	if (myHandle == nullptr) return -1;
    80002834:	fff00513          	li	a0,-1
    80002838:	ff1ff06f          	j	80002828 <_ZN6Thread5startEv+0x24>

000000008000283c <_ZN6Thread4joinEv>:
void Thread::join() {
    8000283c:	ff010113          	addi	sp,sp,-16
    80002840:	00113423          	sd	ra,8(sp)
    80002844:	00813023          	sd	s0,0(sp)
    80002848:	01010413          	addi	s0,sp,16
	thread_join(myHandle);
    8000284c:	00853503          	ld	a0,8(a0)
    80002850:	fffff097          	auipc	ra,0xfffff
    80002854:	bf8080e7          	jalr	-1032(ra) # 80001448 <_Z11thread_joinP3TCB>
}
    80002858:	00813083          	ld	ra,8(sp)
    8000285c:	00013403          	ld	s0,0(sp)
    80002860:	01010113          	addi	sp,sp,16
    80002864:	00008067          	ret

0000000080002868 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80002868:	ff010113          	addi	sp,sp,-16
    8000286c:	00113423          	sd	ra,8(sp)
    80002870:	00813023          	sd	s0,0(sp)
    80002874:	01010413          	addi	s0,sp,16
	thread_dispatch();
    80002878:	fffff097          	auipc	ra,0xfffff
    8000287c:	bb0080e7          	jalr	-1104(ra) # 80001428 <_Z15thread_dispatchv>
}
    80002880:	00813083          	ld	ra,8(sp)
    80002884:	00013403          	ld	s0,0(sp)
    80002888:	01010113          	addi	sp,sp,16
    8000288c:	00008067          	ret

0000000080002890 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t t) {
    80002890:	ff010113          	addi	sp,sp,-16
    80002894:	00113423          	sd	ra,8(sp)
    80002898:	00813023          	sd	s0,0(sp)
    8000289c:	01010413          	addi	s0,sp,16
    800028a0:	00050593          	mv	a1,a0
	Scheduler::putToSleep(TCB::running, t);
    800028a4:	00009797          	auipc	a5,0x9
    800028a8:	20c7b783          	ld	a5,524(a5) # 8000bab0 <_GLOBAL_OFFSET_TABLE_+0x58>
    800028ac:	0007b503          	ld	a0,0(a5)
    800028b0:	fffff097          	auipc	ra,0xfffff
    800028b4:	194080e7          	jalr	404(ra) # 80001a44 <_ZN9Scheduler10putToSleepEP3TCBm>
}
    800028b8:	00000513          	li	a0,0
    800028bc:	00813083          	ld	ra,8(sp)
    800028c0:	00013403          	ld	s0,0(sp)
    800028c4:	01010113          	addi	sp,sp,16
    800028c8:	00008067          	ret

00000000800028cc <_ZN6ThreadC1Ev>:
Thread::Thread() {
    800028cc:	fe010113          	addi	sp,sp,-32
    800028d0:	00113c23          	sd	ra,24(sp)
    800028d4:	00813823          	sd	s0,16(sp)
    800028d8:	00913423          	sd	s1,8(sp)
    800028dc:	02010413          	addi	s0,sp,32
    800028e0:	00050493          	mv	s1,a0
    800028e4:	00009797          	auipc	a5,0x9
    800028e8:	f9478793          	addi	a5,a5,-108 # 8000b878 <_ZTV6Thread+0x10>
    800028ec:	00f53023          	sd	a5,0(a0)
	this->body = wrapper;
    800028f0:	00000797          	auipc	a5,0x0
    800028f4:	c8478793          	addi	a5,a5,-892 # 80002574 <_ZN6Thread7wrapperEPv>
    800028f8:	00f53823          	sd	a5,16(a0)
	this->arg = this;
    800028fc:	00a53c23          	sd	a0,24(a0)
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    80002900:	00001537          	lui	a0,0x1
    80002904:	fffff097          	auipc	ra,0xfffff
    80002908:	a0c080e7          	jalr	-1524(ra) # 80001310 <_Z9mem_allocm>
    8000290c:	00050313          	mv	t1,a0
	__asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002910:	00030713          	mv	a4,t1
	__asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002914:	0184b303          	ld	t1,24(s1)
    80002918:	00030693          	mv	a3,t1
			body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000291c:	0104b303          	ld	t1,16(s1)
    80002920:	00030613          	mv	a2,t1
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002924:	00848493          	addi	s1,s1,8
    80002928:	00048593          	mv	a1,s1
	__asm__ volatile("li a0, 0x80");
    8000292c:	08000513          	li	a0,128
	__asm__ volatile("ecall");
    80002930:	00000073          	ecall
}
    80002934:	01813083          	ld	ra,24(sp)
    80002938:	01013403          	ld	s0,16(sp)
    8000293c:	00813483          	ld	s1,8(sp)
    80002940:	02010113          	addi	sp,sp,32
    80002944:	00008067          	ret

0000000080002948 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80002948:	ff010113          	addi	sp,sp,-16
    8000294c:	00113423          	sd	ra,8(sp)
    80002950:	00813023          	sd	s0,0(sp)
    80002954:	01010413          	addi	s0,sp,16
    80002958:	00009797          	auipc	a5,0x9
    8000295c:	f4878793          	addi	a5,a5,-184 # 8000b8a0 <_ZTV9Semaphore+0x10>
    80002960:	00f53023          	sd	a5,0(a0) # 1000 <_entry-0x7ffff000>
	sem_open(&myHandle, init);
    80002964:	00850513          	addi	a0,a0,8
    80002968:	fffff097          	auipc	ra,0xfffff
    8000296c:	b38080e7          	jalr	-1224(ra) # 800014a0 <_Z8sem_openPP4KSemj>
}
    80002970:	00813083          	ld	ra,8(sp)
    80002974:	00013403          	ld	s0,0(sp)
    80002978:	01010113          	addi	sp,sp,16
    8000297c:	00008067          	ret

0000000080002980 <_ZN9Semaphore4waitEv>:

int Semaphore::wait() {
    80002980:	ff010113          	addi	sp,sp,-16
    80002984:	00113423          	sd	ra,8(sp)
    80002988:	00813023          	sd	s0,0(sp)
    8000298c:	01010413          	addi	s0,sp,16
	return sem_wait(myHandle);
    80002990:	00853503          	ld	a0,8(a0)
    80002994:	fffff097          	auipc	ra,0xfffff
    80002998:	b74080e7          	jalr	-1164(ra) # 80001508 <_Z8sem_waitP4KSem>
}
    8000299c:	00813083          	ld	ra,8(sp)
    800029a0:	00013403          	ld	s0,0(sp)
    800029a4:	01010113          	addi	sp,sp,16
    800029a8:	00008067          	ret

00000000800029ac <_ZN9Semaphore6signalEv>:

int Semaphore::signal() {
    800029ac:	ff010113          	addi	sp,sp,-16
    800029b0:	00113423          	sd	ra,8(sp)
    800029b4:	00813023          	sd	s0,0(sp)
    800029b8:	01010413          	addi	s0,sp,16
	return sem_signal(myHandle);
    800029bc:	00853503          	ld	a0,8(a0)
    800029c0:	fffff097          	auipc	ra,0xfffff
    800029c4:	b78080e7          	jalr	-1160(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    800029c8:	00813083          	ld	ra,8(sp)
    800029cc:	00013403          	ld	s0,0(sp)
    800029d0:	01010113          	addi	sp,sp,16
    800029d4:	00008067          	ret

00000000800029d8 <_ZN14PeriodicThread9terminateEv>:

void PeriodicThread::terminate() {
    800029d8:	ff010113          	addi	sp,sp,-16
    800029dc:	00813423          	sd	s0,8(sp)
    800029e0:	01010413          	addi	s0,sp,16

}
    800029e4:	00813403          	ld	s0,8(sp)
    800029e8:	01010113          	addi	sp,sp,16
    800029ec:	00008067          	ret

00000000800029f0 <_ZN14PeriodicThreadC1Em>:

PeriodicThread::PeriodicThread(time_t period) {
    800029f0:	fe010113          	addi	sp,sp,-32
    800029f4:	00113c23          	sd	ra,24(sp)
    800029f8:	00813823          	sd	s0,16(sp)
    800029fc:	00913423          	sd	s1,8(sp)
    80002a00:	02010413          	addi	s0,sp,32
    80002a04:	00050493          	mv	s1,a0
    80002a08:	00000097          	auipc	ra,0x0
    80002a0c:	ec4080e7          	jalr	-316(ra) # 800028cc <_ZN6ThreadC1Ev>
    80002a10:	00009797          	auipc	a5,0x9
    80002a14:	e3878793          	addi	a5,a5,-456 # 8000b848 <_ZTV14PeriodicThread+0x10>
    80002a18:	00f4b023          	sd	a5,0(s1)

}
    80002a1c:	01813083          	ld	ra,24(sp)
    80002a20:	01013403          	ld	s0,16(sp)
    80002a24:	00813483          	ld	s1,8(sp)
    80002a28:	02010113          	addi	sp,sp,32
    80002a2c:	00008067          	ret

0000000080002a30 <_ZN7Console4getcEv>:

char Console::getc() {
    80002a30:	ff010113          	addi	sp,sp,-16
    80002a34:	00113423          	sd	ra,8(sp)
    80002a38:	00813023          	sd	s0,0(sp)
    80002a3c:	01010413          	addi	s0,sp,16
	return ::getc();
    80002a40:	fffff097          	auipc	ra,0xfffff
    80002a44:	b28080e7          	jalr	-1240(ra) # 80001568 <_Z4getcv>
}
    80002a48:	00813083          	ld	ra,8(sp)
    80002a4c:	00013403          	ld	s0,0(sp)
    80002a50:	01010113          	addi	sp,sp,16
    80002a54:	00008067          	ret

0000000080002a58 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80002a58:	ff010113          	addi	sp,sp,-16
    80002a5c:	00113423          	sd	ra,8(sp)
    80002a60:	00813023          	sd	s0,0(sp)
    80002a64:	01010413          	addi	s0,sp,16
	::putc(c);
    80002a68:	fffff097          	auipc	ra,0xfffff
    80002a6c:	b28080e7          	jalr	-1240(ra) # 80001590 <_Z4putcc>
}
    80002a70:	00813083          	ld	ra,8(sp)
    80002a74:	00013403          	ld	s0,0(sp)
    80002a78:	01010113          	addi	sp,sp,16
    80002a7c:	00008067          	ret

0000000080002a80 <_ZN6Thread3runEv>:
	static int sleep(time_t);

protected:
	Thread();

	virtual void run() {}
    80002a80:	ff010113          	addi	sp,sp,-16
    80002a84:	00813423          	sd	s0,8(sp)
    80002a88:	01010413          	addi	s0,sp,16
    80002a8c:	00813403          	ld	s0,8(sp)
    80002a90:	01010113          	addi	sp,sp,16
    80002a94:	00008067          	ret

0000000080002a98 <_ZN14PeriodicThread18periodicActivationEv>:
	void terminate();

protected:
	PeriodicThread(time_t period);

	virtual void periodicActivation() {}
    80002a98:	ff010113          	addi	sp,sp,-16
    80002a9c:	00813423          	sd	s0,8(sp)
    80002aa0:	01010413          	addi	s0,sp,16
    80002aa4:	00813403          	ld	s0,8(sp)
    80002aa8:	01010113          	addi	sp,sp,16
    80002aac:	00008067          	ret

0000000080002ab0 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80002ab0:	ff010113          	addi	sp,sp,-16
    80002ab4:	00113423          	sd	ra,8(sp)
    80002ab8:	00813023          	sd	s0,0(sp)
    80002abc:	01010413          	addi	s0,sp,16
    80002ac0:	00009797          	auipc	a5,0x9
    80002ac4:	d8878793          	addi	a5,a5,-632 # 8000b848 <_ZTV14PeriodicThread+0x10>
    80002ac8:	00f53023          	sd	a5,0(a0)
    80002acc:	00000097          	auipc	ra,0x0
    80002ad0:	adc080e7          	jalr	-1316(ra) # 800025a8 <_ZN6ThreadD1Ev>
    80002ad4:	00813083          	ld	ra,8(sp)
    80002ad8:	00013403          	ld	s0,0(sp)
    80002adc:	01010113          	addi	sp,sp,16
    80002ae0:	00008067          	ret

0000000080002ae4 <_ZN14PeriodicThreadD0Ev>:
    80002ae4:	fe010113          	addi	sp,sp,-32
    80002ae8:	00113c23          	sd	ra,24(sp)
    80002aec:	00813823          	sd	s0,16(sp)
    80002af0:	00913423          	sd	s1,8(sp)
    80002af4:	02010413          	addi	s0,sp,32
    80002af8:	00050493          	mv	s1,a0
    80002afc:	00009797          	auipc	a5,0x9
    80002b00:	d4c78793          	addi	a5,a5,-692 # 8000b848 <_ZTV14PeriodicThread+0x10>
    80002b04:	00f53023          	sd	a5,0(a0)
    80002b08:	00000097          	auipc	ra,0x0
    80002b0c:	aa0080e7          	jalr	-1376(ra) # 800025a8 <_ZN6ThreadD1Ev>
    80002b10:	00048513          	mv	a0,s1
    80002b14:	00000097          	auipc	ra,0x0
    80002b18:	b90080e7          	jalr	-1136(ra) # 800026a4 <_ZdlPv>
    80002b1c:	01813083          	ld	ra,24(sp)
    80002b20:	01013403          	ld	s0,16(sp)
    80002b24:	00813483          	ld	s1,8(sp)
    80002b28:	02010113          	addi	sp,sp,32
    80002b2c:	00008067          	ret

0000000080002b30 <_ZN3TCB7wrapperEv>:
	Riscv::pushRegisters();
	TCB::dispatch();
	Riscv::popRegisters();
}

void TCB::wrapper() {
    80002b30:	ff010113          	addi	sp,sp,-16
    80002b34:	00113423          	sd	ra,8(sp)
    80002b38:	00813023          	sd	s0,0(sp)
    80002b3c:	01010413          	addi	s0,sp,16
	//pocetak wrappera se izvrsava u supervisor modu,
	//jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch/yield)
	Riscv::popSppSpie();
    80002b40:	00000097          	auipc	ra,0x0
    80002b44:	310080e7          	jalr	784(ra) # 80002e50 <_ZN5Riscv10popSppSpieEv>
	//na dalje se izvrsavamo u user modu
	running->threadFunction(running->args);
    80002b48:	00009797          	auipc	a5,0x9
    80002b4c:	0887b783          	ld	a5,136(a5) # 8000bbd0 <_ZN3TCB7runningE>
    80002b50:	0107b703          	ld	a4,16(a5)
    80002b54:	0207b503          	ld	a0,32(a5)
    80002b58:	000700e7          	jalr	a4
	//running->finished = true;
	//i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
	thread_exit();
    80002b5c:	fffff097          	auipc	ra,0xfffff
    80002b60:	8a4080e7          	jalr	-1884(ra) # 80001400 <_Z11thread_exitv>
}
    80002b64:	00813083          	ld	ra,8(sp)
    80002b68:	00013403          	ld	s0,0(sp)
    80002b6c:	01010113          	addi	sp,sp,16
    80002b70:	00008067          	ret

0000000080002b74 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80002b74:	fe010113          	addi	sp,sp,-32
    80002b78:	00113c23          	sd	ra,24(sp)
    80002b7c:	00813823          	sd	s0,16(sp)
    80002b80:	00913423          	sd	s1,8(sp)
    80002b84:	02010413          	addi	s0,sp,32
	TCB* old = TCB::running;
    80002b88:	00009497          	auipc	s1,0x9
    80002b8c:	0484b483          	ld	s1,72(s1) # 8000bbd0 <_ZN3TCB7runningE>
	if (!old->finished && !old->blocked && old->timeToSleep == 0 && !old->needToJoin) {
    80002b90:	0304c783          	lbu	a5,48(s1)
    80002b94:	00079e63          	bnez	a5,80002bb0 <_ZN3TCB8dispatchEv+0x3c>
    80002b98:	0314c783          	lbu	a5,49(s1)
    80002b9c:	00079a63          	bnez	a5,80002bb0 <_ZN3TCB8dispatchEv+0x3c>
    80002ba0:	0404b783          	ld	a5,64(s1)
    80002ba4:	00079663          	bnez	a5,80002bb0 <_ZN3TCB8dispatchEv+0x3c>
    80002ba8:	0324c783          	lbu	a5,50(s1)
    80002bac:	04078663          	beqz	a5,80002bf8 <_ZN3TCB8dispatchEv+0x84>
	TCB::running = Scheduler::get();
    80002bb0:	fffff097          	auipc	ra,0xfffff
    80002bb4:	e54080e7          	jalr	-428(ra) # 80001a04 <_ZN9Scheduler3getEv>
    80002bb8:	00050593          	mv	a1,a0
    80002bbc:	00009797          	auipc	a5,0x9
    80002bc0:	01478793          	addi	a5,a5,20 # 8000bbd0 <_ZN3TCB7runningE>
    80002bc4:	00a7b023          	sd	a0,0(a5)
	TCB::runningTimeSlice = 0;
    80002bc8:	0007b423          	sd	zero,8(a5)
	if (TCB::running->threadFunction == nullptr || TCB::running->threadFunction == kernelConsumerFunction ||
    80002bcc:	01053783          	ld	a5,16(a0)
    80002bd0:	02078c63          	beqz	a5,80002c08 <_ZN3TCB8dispatchEv+0x94>
    80002bd4:	00009717          	auipc	a4,0x9
    80002bd8:	eb473703          	ld	a4,-332(a4) # 8000ba88 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002bdc:	02e78663          	beq	a5,a4,80002c08 <_ZN3TCB8dispatchEv+0x94>
    80002be0:	00009717          	auipc	a4,0x9
    80002be4:	ee873703          	ld	a4,-280(a4) # 8000bac8 <_GLOBAL_OFFSET_TABLE_+0x70>
    80002be8:	02e78063          	beq	a5,a4,80002c08 <_ZN3TCB8dispatchEv+0x94>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002bec:	10000793          	li	a5,256
    80002bf0:	1007b073          	csrc	sstatus,a5
}
    80002bf4:	01c0006f          	j	80002c10 <_ZN3TCB8dispatchEv+0x9c>
		Scheduler::put(old);
    80002bf8:	00048513          	mv	a0,s1
    80002bfc:	fffff097          	auipc	ra,0xfffff
    80002c00:	dc4080e7          	jalr	-572(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
    80002c04:	fadff06f          	j	80002bb0 <_ZN3TCB8dispatchEv+0x3c>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80002c08:	10000793          	li	a5,256
    80002c0c:	1007a073          	csrs	sstatus,a5
	if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    80002c10:	00b48863          	beq	s1,a1,80002c20 <_ZN3TCB8dispatchEv+0xac>
    80002c14:	00048513          	mv	a0,s1
    80002c18:	ffffe097          	auipc	ra,0xffffe
    80002c1c:	5f8080e7          	jalr	1528(ra) # 80001210 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80002c20:	01813083          	ld	ra,24(sp)
    80002c24:	01013403          	ld	s0,16(sp)
    80002c28:	00813483          	ld	s1,8(sp)
    80002c2c:	02010113          	addi	sp,sp,32
    80002c30:	00008067          	ret

0000000080002c34 <_ZN3TCB5yieldEv>:
void TCB::yield() {
    80002c34:	ff010113          	addi	sp,sp,-16
    80002c38:	00113423          	sd	ra,8(sp)
    80002c3c:	00813023          	sd	s0,0(sp)
    80002c40:	01010413          	addi	s0,sp,16
	Riscv::pushRegisters();
    80002c44:	ffffe097          	auipc	ra,0xffffe
    80002c48:	3bc080e7          	jalr	956(ra) # 80001000 <_ZN5Riscv13pushRegistersEv>
	TCB::dispatch();
    80002c4c:	00000097          	auipc	ra,0x0
    80002c50:	f28080e7          	jalr	-216(ra) # 80002b74 <_ZN3TCB8dispatchEv>
	Riscv::popRegisters();
    80002c54:	ffffe097          	auipc	ra,0xffffe
    80002c58:	428080e7          	jalr	1064(ra) # 8000107c <_ZN5Riscv12popRegistersEv>
}
    80002c5c:	00813083          	ld	ra,8(sp)
    80002c60:	00013403          	ld	s0,0(sp)
    80002c64:	01010113          	addi	sp,sp,16
    80002c68:	00008067          	ret

0000000080002c6c <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    80002c6c:	ff010113          	addi	sp,sp,-16
    80002c70:	00113423          	sd	ra,8(sp)
    80002c74:	00813023          	sd	s0,0(sp)
    80002c78:	01010413          	addi	s0,sp,16
	return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::THREAD);
    80002c7c:	00200593          	li	a1,2
    80002c80:	02050513          	addi	a0,a0,32
    80002c84:	00000097          	auipc	ra,0x0
    80002c88:	1ec080e7          	jalr	492(ra) # 80002e70 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
}
    80002c8c:	00813083          	ld	ra,8(sp)
    80002c90:	00013403          	ld	s0,0(sp)
    80002c94:	01010113          	addi	sp,sp,16
    80002c98:	00008067          	ret

0000000080002c9c <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    80002c9c:	fd010113          	addi	sp,sp,-48
    80002ca0:	02113423          	sd	ra,40(sp)
    80002ca4:	02813023          	sd	s0,32(sp)
    80002ca8:	00913c23          	sd	s1,24(sp)
    80002cac:	01213823          	sd	s2,16(sp)
    80002cb0:	01313423          	sd	s3,8(sp)
    80002cb4:	03010413          	addi	s0,sp,48
    80002cb8:	00050913          	mv	s2,a0
    80002cbc:	00058993          	mv	s3,a1
    80002cc0:	00060493          	mv	s1,a2
	TCB* newThread = new TCB(function, args, stack);
    80002cc4:	06000513          	li	a0,96
    80002cc8:	00000097          	auipc	ra,0x0
    80002ccc:	fa4080e7          	jalr	-92(ra) # 80002c6c <_ZN3TCBnwEm>


	TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
													timeSlice(DEFAULT_TIME_SLICE), finished(false), blocked(false),
													needToJoin(false),
													nextInScheduler(nullptr), timeToSleep(0), nextSleeping(nullptr) {
    80002cd0:	01253823          	sd	s2,16(a0)
    80002cd4:	00953c23          	sd	s1,24(a0)
    80002cd8:	03353023          	sd	s3,32(a0)
    80002cdc:	00200793          	li	a5,2
    80002ce0:	02f53423          	sd	a5,40(a0)
    80002ce4:	02050823          	sb	zero,48(a0)
    80002ce8:	020508a3          	sb	zero,49(a0)
    80002cec:	02050923          	sb	zero,50(a0)
    80002cf0:	02053c23          	sd	zero,56(a0)
    80002cf4:	04053023          	sd	zero,64(a0)
    80002cf8:	04053423          	sd	zero,72(a0)
	ThreadQueue() : front(nullptr), back(nullptr) {}
    80002cfc:	04053823          	sd	zero,80(a0)
    80002d00:	04053c23          	sd	zero,88(a0)
		//formiranje pocetnog konteksta; specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80002d04:	02090e63          	beqz	s2,80002d40 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xa4>
    80002d08:	00000797          	auipc	a5,0x0
    80002d0c:	e2878793          	addi	a5,a5,-472 # 80002b30 <_ZN3TCB7wrapperEv>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80002d10:	02048c63          	beqz	s1,80002d48 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xac>
    80002d14:	00008637          	lui	a2,0x8
    80002d18:	00c484b3          	add	s1,s1,a2
		this->context.ra = startRa;
    80002d1c:	00f53023          	sd	a5,0(a0)
		this->context.sp = startSp;
    80002d20:	00953423          	sd	s1,8(a0)
}
    80002d24:	02813083          	ld	ra,40(sp)
    80002d28:	02013403          	ld	s0,32(sp)
    80002d2c:	01813483          	ld	s1,24(sp)
    80002d30:	01013903          	ld	s2,16(sp)
    80002d34:	00813983          	ld	s3,8(sp)
    80002d38:	03010113          	addi	sp,sp,48
    80002d3c:	00008067          	ret
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80002d40:	00000793          	li	a5,0
    80002d44:	fcdff06f          	j	80002d10 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x74>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80002d48:	00000493          	li	s1,0
    80002d4c:	fd1ff06f          	j	80002d1c <_ZN3TCB12createThreadEPFvPvES0_Pm+0x80>

0000000080002d50 <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    80002d50:	ff010113          	addi	sp,sp,-16
    80002d54:	00113423          	sd	ra,8(sp)
    80002d58:	00813023          	sd	s0,0(sp)
    80002d5c:	01010413          	addi	s0,sp,16
	MemoryAllocator::kfree(ptr);
    80002d60:	00000097          	auipc	ra,0x0
    80002d64:	2c4080e7          	jalr	708(ra) # 80003024 <_ZN15MemoryAllocator5kfreeEPv>
}
    80002d68:	00813083          	ld	ra,8(sp)
    80002d6c:	00013403          	ld	s0,0(sp)
    80002d70:	01010113          	addi	sp,sp,16
    80002d74:	00008067          	ret

0000000080002d78 <_ZN3TCB10threadJoinEPS_>:

void TCB::threadJoin(TCB* handle) {
	if (handle->finished) return;
    80002d78:	03054783          	lbu	a5,48(a0)
    80002d7c:	00078463          	beqz	a5,80002d84 <_ZN3TCB10threadJoinEPS_+0xc>
    80002d80:	00008067          	ret
void TCB::threadJoin(TCB* handle) {
    80002d84:	ff010113          	addi	sp,sp,-16
    80002d88:	00113423          	sd	ra,8(sp)
    80002d8c:	00813023          	sd	s0,0(sp)
    80002d90:	01010413          	addi	s0,sp,16
	TCB::running->needToJoin = true;
    80002d94:	00009597          	auipc	a1,0x9
    80002d98:	e3c5b583          	ld	a1,-452(a1) # 8000bbd0 <_ZN3TCB7runningE>
    80002d9c:	00100793          	li	a5,1
    80002da0:	02f58923          	sb	a5,50(a1)
	handle->waitingToJoin.putLast(TCB::running);
    80002da4:	05050513          	addi	a0,a0,80
    80002da8:	ffffe097          	auipc	ra,0xffffe
    80002dac:	49c080e7          	jalr	1180(ra) # 80001244 <_ZN11ThreadQueue7putLastEP3TCB>
}
    80002db0:	00813083          	ld	ra,8(sp)
    80002db4:	00013403          	ld	s0,0(sp)
    80002db8:	01010113          	addi	sp,sp,16
    80002dbc:	00008067          	ret

0000000080002dc0 <_ZN3TCB13releaseJoinedEv>:

void TCB::releaseJoined() {
	while (!TCB::running->waitingToJoin.isEmpty()) {
    80002dc0:	00009517          	auipc	a0,0x9
    80002dc4:	e1053503          	ld	a0,-496(a0) # 8000bbd0 <_ZN3TCB7runningE>
		return front == nullptr;
    80002dc8:	05053783          	ld	a5,80(a0)
    80002dcc:	04078663          	beqz	a5,80002e18 <_ZN3TCB13releaseJoinedEv+0x58>
void TCB::releaseJoined() {
    80002dd0:	ff010113          	addi	sp,sp,-16
    80002dd4:	00113423          	sd	ra,8(sp)
    80002dd8:	00813023          	sd	s0,0(sp)
    80002ddc:	01010413          	addi	s0,sp,16
		TCB* tcb = TCB::running->waitingToJoin.getFirst();
    80002de0:	05050513          	addi	a0,a0,80
    80002de4:	ffffe097          	auipc	ra,0xffffe
    80002de8:	4cc080e7          	jalr	1228(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
		tcb->needToJoin = false;
    80002dec:	02050923          	sb	zero,50(a0)
		Scheduler::put(tcb);
    80002df0:	fffff097          	auipc	ra,0xfffff
    80002df4:	bd0080e7          	jalr	-1072(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
	while (!TCB::running->waitingToJoin.isEmpty()) {
    80002df8:	00009517          	auipc	a0,0x9
    80002dfc:	dd853503          	ld	a0,-552(a0) # 8000bbd0 <_ZN3TCB7runningE>
    80002e00:	05053783          	ld	a5,80(a0)
    80002e04:	fc079ee3          	bnez	a5,80002de0 <_ZN3TCB13releaseJoinedEv+0x20>
	}
}
    80002e08:	00813083          	ld	ra,8(sp)
    80002e0c:	00013403          	ld	s0,0(sp)
    80002e10:	01010113          	addi	sp,sp,16
    80002e14:	00008067          	ret
    80002e18:	00008067          	ret

0000000080002e1c <_ZN3TCB5startEPS_>:

void TCB::start(TCB* newTcb) {
	//startovanje niti(stavljanje u Scheduler); main nit je vec aktivna, ne stavlja se u Scheduler
	if (newTcb->threadFunction != nullptr) Scheduler::put(newTcb);
    80002e1c:	01053783          	ld	a5,16(a0)
    80002e20:	02078663          	beqz	a5,80002e4c <_ZN3TCB5startEPS_+0x30>
void TCB::start(TCB* newTcb) {
    80002e24:	ff010113          	addi	sp,sp,-16
    80002e28:	00113423          	sd	ra,8(sp)
    80002e2c:	00813023          	sd	s0,0(sp)
    80002e30:	01010413          	addi	s0,sp,16
	if (newTcb->threadFunction != nullptr) Scheduler::put(newTcb);
    80002e34:	fffff097          	auipc	ra,0xfffff
    80002e38:	b8c080e7          	jalr	-1140(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
}
    80002e3c:	00813083          	ld	ra,8(sp)
    80002e40:	00013403          	ld	s0,0(sp)
    80002e44:	01010113          	addi	sp,sp,16
    80002e48:	00008067          	ret
    80002e4c:	00008067          	ret

0000000080002e50 <_ZN5Riscv10popSppSpieEv>:
// Created by os on 5/17/23.
//

#include "../h/Riscv.hpp"

void Riscv::popSppSpie() {
    80002e50:	ff010113          	addi	sp,sp,-16
    80002e54:	00813423          	sd	s0,8(sp)
    80002e58:	01010413          	addi	s0,sp,16
	//ra pokazuje iza ove funkcije na nastavak wrappera
	__asm__ volatile("csrw sepc, ra");
    80002e5c:	14109073          	csrw	sepc,ra
	__asm__ volatile("sret");
    80002e60:	10200073          	sret
    80002e64:	00813403          	ld	s0,8(sp)
    80002e68:	01010113          	addi	sp,sp,16
    80002e6c:	00008067          	ret

0000000080002e70 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>:

bool MemoryAllocator::initialized = false;
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

void* MemoryAllocator::kmalloc(size_t size, Purpose pur) {
    80002e70:	ff010113          	addi	sp,sp,-16
    80002e74:	00813423          	sd	s0,8(sp)
    80002e78:	01010413          	addi	s0,sp,16
	if (size <= 0) return nullptr;
    80002e7c:	12050c63          	beqz	a0,80002fb4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x144>

	//pocetna inicijalizacija
	if (!initialized) {
    80002e80:	00009797          	auipc	a5,0x9
    80002e84:	d607c783          	lbu	a5,-672(a5) # 8000bbe0 <_ZN15MemoryAllocator11initializedE>
    80002e88:	04079863          	bnez	a5,80002ed8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x68>
		freeMemHead = (FreeMemSegment*)HEAP_START_ADDR;
    80002e8c:	00009617          	auipc	a2,0x9
    80002e90:	bf463603          	ld	a2,-1036(a2) # 8000ba80 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002e94:	00063783          	ld	a5,0(a2)
    80002e98:	00009717          	auipc	a4,0x9
    80002e9c:	d4870713          	addi	a4,a4,-696 # 8000bbe0 <_ZN15MemoryAllocator11initializedE>
    80002ea0:	00f73423          	sd	a5,8(a4)
		freeMemHead->next = nullptr;
    80002ea4:	0007b023          	sd	zero,0(a5)
		freeMemHead->prev = nullptr;
    80002ea8:	00873683          	ld	a3,8(a4)
    80002eac:	0006b423          	sd	zero,8(a3)
		freeMemHead->size = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR - sizeof(FreeMemSegment);
    80002eb0:	00009797          	auipc	a5,0x9
    80002eb4:	c087b783          	ld	a5,-1016(a5) # 8000bab8 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002eb8:	0007b783          	ld	a5,0(a5)
    80002ebc:	00063603          	ld	a2,0(a2)
    80002ec0:	40c787b3          	sub	a5,a5,a2
    80002ec4:	fe878793          	addi	a5,a5,-24
    80002ec8:	00f6b823          	sd	a5,16(a3)
		usedMemHead = nullptr;
    80002ecc:	00073823          	sd	zero,16(a4)

		initialized = true;
    80002ed0:	00100793          	li	a5,1
    80002ed4:	00f70023          	sb	a5,0(a4)
	}

	//alokacija uvek zaokruzena na blokove
	//size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
	size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80002ed8:	00655793          	srli	a5,a0,0x6
    80002edc:	03f57513          	andi	a0,a0,63
    80002ee0:	00050463          	beqz	a0,80002ee8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x78>
    80002ee4:	00100513          	li	a0,1
    80002ee8:	00a78533          	add	a0,a5,a0
	size = blocks * MEM_BLOCK_SIZE;
    80002eec:	00651793          	slli	a5,a0,0x6

	//trazenje slobodnog segmenta po first-fit algoritmu
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80002ef0:	00009517          	auipc	a0,0x9
    80002ef4:	cf853503          	ld	a0,-776(a0) # 8000bbe8 <_ZN15MemoryAllocator11freeMemHeadE>
    80002ef8:	0a050063          	beqz	a0,80002f98 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x128>
		if (current->size < size) continue;
    80002efc:	01053703          	ld	a4,16(a0)
    80002f00:	06f76863          	bltu	a4,a5,80002f70 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x100>

		//pravljenje novog slobodnog fragmenta od ostatka fragmenta
		FreeMemSegment* remainderFree = (FreeMemSegment*)((char*)current + size);
    80002f04:	00f506b3          	add	a3,a0,a5
		remainderFree->size = current->size - size;
    80002f08:	40f70733          	sub	a4,a4,a5
    80002f0c:	00e6b823          	sd	a4,16(a3)
		remainderFree->prev = current->prev;
    80002f10:	00853703          	ld	a4,8(a0)
    80002f14:	00e6b423          	sd	a4,8(a3)
		if (current->prev) current->prev->next = remainderFree;
    80002f18:	00070463          	beqz	a4,80002f20 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xb0>
    80002f1c:	00d73023          	sd	a3,0(a4)
		remainderFree->next = current->next;
    80002f20:	00053703          	ld	a4,0(a0)
    80002f24:	00e6b023          	sd	a4,0(a3)
		if (current->next) current->next->prev = remainderFree;
    80002f28:	00070463          	beqz	a4,80002f30 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xc0>
    80002f2c:	00d73423          	sd	a3,8(a4)
		if (freeMemHead == current) freeMemHead = remainderFree;
    80002f30:	00009717          	auipc	a4,0x9
    80002f34:	cb873703          	ld	a4,-840(a4) # 8000bbe8 <_ZN15MemoryAllocator11freeMemHeadE>
    80002f38:	04a70063          	beq	a4,a0,80002f78 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x108>

		//ubacivanje novog fragmenta u listu zauzetih fragmenata
		UsedMemSegment* newFragment = (UsedMemSegment*)current;
		newFragment->size = size;
    80002f3c:	00f53423          	sd	a5,8(a0)
		newFragment->purpose = pur;
    80002f40:	00b52823          	sw	a1,16(a0)
		newFragment->usableFirstAddress = (char*)newFragment + sizeof(UsedMemSegment);
    80002f44:	02050793          	addi	a5,a0,32
    80002f48:	00f53c23          	sd	a5,24(a0)
		UsedMemSegment* prevUsed = nullptr;
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    80002f4c:	00009697          	auipc	a3,0x9
    80002f50:	ca46b683          	ld	a3,-860(a3) # 8000bbf0 <_ZN15MemoryAllocator11usedMemHeadE>
    80002f54:	00068793          	mv	a5,a3
		UsedMemSegment* prevUsed = nullptr;
    80002f58:	00000713          	li	a4,0
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    80002f5c:	02078463          	beqz	a5,80002f84 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x114>
    80002f60:	02a7f263          	bgeu	a5,a0,80002f84 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x114>
    80002f64:	00078713          	mv	a4,a5
    80002f68:	0007b783          	ld	a5,0(a5)
    80002f6c:	ff1ff06f          	j	80002f5c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xec>
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80002f70:	00053503          	ld	a0,0(a0)
    80002f74:	f85ff06f          	j	80002ef8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x88>
		if (freeMemHead == current) freeMemHead = remainderFree;
    80002f78:	00009717          	auipc	a4,0x9
    80002f7c:	c6d73823          	sd	a3,-912(a4) # 8000bbe8 <_ZN15MemoryAllocator11freeMemHeadE>
    80002f80:	fbdff06f          	j	80002f3c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xcc>
		if (!prevUsed) {
    80002f84:	02070063          	beqz	a4,80002fa4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x134>
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
    80002fac:	c4a7b423          	sd	a0,-952(a5) # 8000bbf0 <_ZN15MemoryAllocator11usedMemHeadE>
    80002fb0:	fe5ff06f          	j	80002f94 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x124>
	if (size <= 0) return nullptr;
    80002fb4:	00000513          	li	a0,0
    80002fb8:	fe1ff06f          	j	80002f98 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x128>

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
    80003030:	bc47b783          	ld	a5,-1084(a5) # 8000bbf0 <_ZN15MemoryAllocator11usedMemHeadE>
    80003034:	10078063          	beqz	a5,80003134 <_ZN15MemoryAllocator5kfreeEPv+0x110>
	ptr = (char*)ptr - sizeof(UsedMemSegment);
    80003038:	fe050513          	addi	a0,a0,-32
	UsedMemSegment* prevUsed = nullptr;
    8000303c:	00000713          	li	a4,0
	for (; currentUsed && currentUsed != ptr; prevUsed = currentUsed, currentUsed = currentUsed->next);
    80003040:	00078a63          	beqz	a5,80003054 <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80003044:	00a78863          	beq	a5,a0,80003054 <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80003048:	00078713          	mv	a4,a5
    8000304c:	0007b783          	ld	a5,0(a5)
    80003050:	ff1ff06f          	j	80003040 <_ZN15MemoryAllocator5kfreeEPv+0x1c>
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
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
	if (!freeMemHead || ptr < (char*)freeMemHead) {
    80003078:	00009797          	auipc	a5,0x9
    8000307c:	b707b783          	ld	a5,-1168(a5) # 8000bbe8 <_ZN15MemoryAllocator11freeMemHeadE>
    80003080:	02078663          	beqz	a5,800030ac <_ZN15MemoryAllocator5kfreeEPv+0x88>
    80003084:	02f56863          	bltu	a0,a5,800030b4 <_ZN15MemoryAllocator5kfreeEPv+0x90>
			 prevFree->next != nullptr && ptr > (char*)(prevFree->next); prevFree = prevFree->next);
    80003088:	00078493          	mv	s1,a5
    8000308c:	0007b783          	ld	a5,0(a5)
    80003090:	02078463          	beqz	a5,800030b8 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80003094:	fea7eae3          	bltu	a5,a0,80003088 <_ZN15MemoryAllocator5kfreeEPv+0x64>
    80003098:	0200006f          	j	800030b8 <_ZN15MemoryAllocator5kfreeEPv+0x94>
	else usedMemHead = currentUsed->next;
    8000309c:	0007b783          	ld	a5,0(a5)
    800030a0:	00009717          	auipc	a4,0x9
    800030a4:	b4f73823          	sd	a5,-1200(a4) # 8000bbf0 <_ZN15MemoryAllocator11usedMemHeadE>
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
    80003114:	ad87b783          	ld	a5,-1320(a5) # 8000bbe8 <_ZN15MemoryAllocator11freeMemHeadE>
    80003118:	fef6b023          	sd	a5,-32(a3)
    8000311c:	fb5ff06f          	j	800030d0 <_ZN15MemoryAllocator5kfreeEPv+0xac>
	else freeMemHead = newFree;
    80003120:	00009797          	auipc	a5,0x9
    80003124:	aca7b423          	sd	a0,-1336(a5) # 8000bbe8 <_ZN15MemoryAllocator11freeMemHeadE>
    80003128:	fbdff06f          	j	800030e4 <_ZN15MemoryAllocator5kfreeEPv+0xc0>
	if (!ptr) return 0;
    8000312c:	00000513          	li	a0,0
    80003130:	00008067          	ret
	if (!usedMemHead) return -1;
    80003134:	fff00513          	li	a0,-1
    80003138:	00008067          	ret
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
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

0000000080003168 <_ZN4KSemnwEm>:

#include "../h/KSem.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void* KSem::operator new(size_t size) {
    80003168:	ff010113          	addi	sp,sp,-16
    8000316c:	00113423          	sd	ra,8(sp)
    80003170:	00813023          	sd	s0,0(sp)
    80003174:	01010413          	addi	s0,sp,16
	return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::SEMAPHORE);
    80003178:	00100593          	li	a1,1
    8000317c:	02050513          	addi	a0,a0,32
    80003180:	00000097          	auipc	ra,0x0
    80003184:	cf0080e7          	jalr	-784(ra) # 80002e70 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
}
    80003188:	00813083          	ld	ra,8(sp)
    8000318c:	00013403          	ld	s0,0(sp)
    80003190:	01010113          	addi	sp,sp,16
    80003194:	00008067          	ret

0000000080003198 <_ZN4KSemdlEPv>:

void KSem::operator delete(void* ptr) {
    80003198:	ff010113          	addi	sp,sp,-16
    8000319c:	00113423          	sd	ra,8(sp)
    800031a0:	00813023          	sd	s0,0(sp)
    800031a4:	01010413          	addi	s0,sp,16
	MemoryAllocator::kfree(ptr);
    800031a8:	00000097          	auipc	ra,0x0
    800031ac:	e7c080e7          	jalr	-388(ra) # 80003024 <_ZN15MemoryAllocator5kfreeEPv>
}
    800031b0:	00813083          	ld	ra,8(sp)
    800031b4:	00013403          	ld	s0,0(sp)
    800031b8:	01010113          	addi	sp,sp,16
    800031bc:	00008067          	ret

00000000800031c0 <_ZN4KSem7initSemEj>:

KSem* KSem::initSem(uint val) {
    800031c0:	fe010113          	addi	sp,sp,-32
    800031c4:	00113c23          	sd	ra,24(sp)
    800031c8:	00813823          	sd	s0,16(sp)
    800031cc:	00913423          	sd	s1,8(sp)
    800031d0:	02010413          	addi	s0,sp,32
    800031d4:	00050493          	mv	s1,a0
	return new KSem(val);
    800031d8:	02000513          	li	a0,32
    800031dc:	00000097          	auipc	ra,0x0
    800031e0:	f8c080e7          	jalr	-116(ra) # 80003168 <_ZN4KSemnwEm>
	void block();

	void unblock();

private:
	KSem(uint val) : val(val), working(true) {}
    800031e4:	00952023          	sw	s1,0(a0)
	ThreadQueue() : front(nullptr), back(nullptr) {}
    800031e8:	00053423          	sd	zero,8(a0)
    800031ec:	00053823          	sd	zero,16(a0)
    800031f0:	00100713          	li	a4,1
    800031f4:	00e50c23          	sb	a4,24(a0)
}
    800031f8:	01813083          	ld	ra,24(sp)
    800031fc:	01013403          	ld	s0,16(sp)
    80003200:	00813483          	ld	s1,8(sp)
    80003204:	02010113          	addi	sp,sp,32
    80003208:	00008067          	ret

000000008000320c <_ZN4KSem5blockEv>:
	if (!working) return -3;
	if (val++ < 0) unblock();
	return 0;
}

void KSem::block() {
    8000320c:	ff010113          	addi	sp,sp,-16
    80003210:	00113423          	sd	ra,8(sp)
    80003214:	00813023          	sd	s0,0(sp)
    80003218:	01010413          	addi	s0,sp,16
	TCB::running->setBlocked(true);
    8000321c:	00009797          	auipc	a5,0x9
    80003220:	8947b783          	ld	a5,-1900(a5) # 8000bab0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80003224:	0007b583          	ld	a1,0(a5)
	void setBlocked(bool block) { this->blocked = block; }
    80003228:	00100793          	li	a5,1
    8000322c:	02f588a3          	sb	a5,49(a1)
	blocked.putLast(TCB::running);
    80003230:	00850513          	addi	a0,a0,8
    80003234:	ffffe097          	auipc	ra,0xffffe
    80003238:	010080e7          	jalr	16(ra) # 80001244 <_ZN11ThreadQueue7putLastEP3TCB>
	TCB::yield();
    8000323c:	00000097          	auipc	ra,0x0
    80003240:	9f8080e7          	jalr	-1544(ra) # 80002c34 <_ZN3TCB5yieldEv>
}
    80003244:	00813083          	ld	ra,8(sp)
    80003248:	00013403          	ld	s0,0(sp)
    8000324c:	01010113          	addi	sp,sp,16
    80003250:	00008067          	ret

0000000080003254 <_ZN4KSem4waitEv>:
int KSem::wait() {
    80003254:	fe010113          	addi	sp,sp,-32
    80003258:	00113c23          	sd	ra,24(sp)
    8000325c:	00813823          	sd	s0,16(sp)
    80003260:	00913423          	sd	s1,8(sp)
    80003264:	02010413          	addi	s0,sp,32
    80003268:	00050493          	mv	s1,a0
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    8000326c:	00100593          	li	a1,1
    80003270:	00000097          	auipc	ra,0x0
    80003274:	ed4080e7          	jalr	-300(ra) # 80003144 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>
    80003278:	04050663          	beqz	a0,800032c4 <_ZN4KSem4waitEv+0x70>
	if (!working) return -3;
    8000327c:	0184c783          	lbu	a5,24(s1)
    80003280:	04078663          	beqz	a5,800032cc <_ZN4KSem4waitEv+0x78>
	if (--val < 0) {
    80003284:	0004a783          	lw	a5,0(s1)
    80003288:	fff7879b          	addiw	a5,a5,-1
    8000328c:	00f4a023          	sw	a5,0(s1)
    80003290:	02079713          	slli	a4,a5,0x20
    80003294:	00074e63          	bltz	a4,800032b0 <_ZN4KSem4waitEv+0x5c>
	return 0;
    80003298:	00000513          	li	a0,0
}
    8000329c:	01813083          	ld	ra,24(sp)
    800032a0:	01013403          	ld	s0,16(sp)
    800032a4:	00813483          	ld	s1,8(sp)
    800032a8:	02010113          	addi	sp,sp,32
    800032ac:	00008067          	ret
		block();
    800032b0:	00048513          	mv	a0,s1
    800032b4:	00000097          	auipc	ra,0x0
    800032b8:	f58080e7          	jalr	-168(ra) # 8000320c <_ZN4KSem5blockEv>
		return -1;
    800032bc:	fff00513          	li	a0,-1
    800032c0:	fddff06f          	j	8000329c <_ZN4KSem4waitEv+0x48>
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    800032c4:	ffe00513          	li	a0,-2
    800032c8:	fd5ff06f          	j	8000329c <_ZN4KSem4waitEv+0x48>
	if (!working) return -3;
    800032cc:	ffd00513          	li	a0,-3
    800032d0:	fcdff06f          	j	8000329c <_ZN4KSem4waitEv+0x48>

00000000800032d4 <_ZN4KSem7unblockEv>:

void KSem::unblock() {
    800032d4:	ff010113          	addi	sp,sp,-16
    800032d8:	00113423          	sd	ra,8(sp)
    800032dc:	00813023          	sd	s0,0(sp)
    800032e0:	01010413          	addi	s0,sp,16
	TCB* tcb = blocked.getFirst();
    800032e4:	00850513          	addi	a0,a0,8
    800032e8:	ffffe097          	auipc	ra,0xffffe
    800032ec:	fc8080e7          	jalr	-56(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
    800032f0:	020508a3          	sb	zero,49(a0)
	tcb->setBlocked(false);
	Scheduler::put(tcb);
    800032f4:	ffffe097          	auipc	ra,0xffffe
    800032f8:	6cc080e7          	jalr	1740(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
}
    800032fc:	00813083          	ld	ra,8(sp)
    80003300:	00013403          	ld	s0,0(sp)
    80003304:	01010113          	addi	sp,sp,16
    80003308:	00008067          	ret

000000008000330c <_ZN4KSem6signalEv>:
int KSem::signal() {
    8000330c:	fe010113          	addi	sp,sp,-32
    80003310:	00113c23          	sd	ra,24(sp)
    80003314:	00813823          	sd	s0,16(sp)
    80003318:	00913423          	sd	s1,8(sp)
    8000331c:	02010413          	addi	s0,sp,32
    80003320:	00050493          	mv	s1,a0
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    80003324:	00100593          	li	a1,1
    80003328:	00000097          	auipc	ra,0x0
    8000332c:	e1c080e7          	jalr	-484(ra) # 80003144 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>
    80003330:	04050463          	beqz	a0,80003378 <_ZN4KSem6signalEv+0x6c>
	if (!working) return -3;
    80003334:	0184c783          	lbu	a5,24(s1)
    80003338:	04078463          	beqz	a5,80003380 <_ZN4KSem6signalEv+0x74>
	if (val++ < 0) unblock();
    8000333c:	0004a783          	lw	a5,0(s1)
    80003340:	0017871b          	addiw	a4,a5,1
    80003344:	00e4a023          	sw	a4,0(s1)
    80003348:	0007ce63          	bltz	a5,80003364 <_ZN4KSem6signalEv+0x58>
	return 0;
    8000334c:	00000513          	li	a0,0
}
    80003350:	01813083          	ld	ra,24(sp)
    80003354:	01013403          	ld	s0,16(sp)
    80003358:	00813483          	ld	s1,8(sp)
    8000335c:	02010113          	addi	sp,sp,32
    80003360:	00008067          	ret
	if (val++ < 0) unblock();
    80003364:	00048513          	mv	a0,s1
    80003368:	00000097          	auipc	ra,0x0
    8000336c:	f6c080e7          	jalr	-148(ra) # 800032d4 <_ZN4KSem7unblockEv>
	return 0;
    80003370:	00000513          	li	a0,0
    80003374:	fddff06f          	j	80003350 <_ZN4KSem6signalEv+0x44>
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    80003378:	ffe00513          	li	a0,-2
    8000337c:	fd5ff06f          	j	80003350 <_ZN4KSem6signalEv+0x44>
	if (!working) return -3;
    80003380:	ffd00513          	li	a0,-3
    80003384:	fcdff06f          	j	80003350 <_ZN4KSem6signalEv+0x44>

0000000080003388 <_ZN4KSem8closeSemEPS_>:

int KSem::closeSem(sem_t handle) {
    80003388:	fe010113          	addi	sp,sp,-32
    8000338c:	00113c23          	sd	ra,24(sp)
    80003390:	00813823          	sd	s0,16(sp)
    80003394:	00913423          	sd	s1,8(sp)
    80003398:	02010413          	addi	s0,sp,32
    8000339c:	00050493          	mv	s1,a0
	if (!MemoryAllocator::checkPurpose(handle, MemoryAllocator::SEMAPHORE)) return -2;
    800033a0:	00100593          	li	a1,1
    800033a4:	00000097          	auipc	ra,0x0
    800033a8:	da0080e7          	jalr	-608(ra) # 80003144 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>
    800033ac:	04050263          	beqz	a0,800033f0 <_ZN4KSem8closeSemEPS_+0x68>
	handle->working = false;
    800033b0:	00048c23          	sb	zero,24(s1)
    800033b4:	01c0006f          	j	800033d0 <_ZN4KSem8closeSemEPS_+0x48>
	while (!handle->blocked.isEmpty()) {
		TCB* tcb = handle->blocked.getFirst();
    800033b8:	00848513          	addi	a0,s1,8
    800033bc:	ffffe097          	auipc	ra,0xffffe
    800033c0:	ef4080e7          	jalr	-268(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
    800033c4:	020508a3          	sb	zero,49(a0)
		tcb->setBlocked(false);
		Scheduler::put(tcb);
    800033c8:	ffffe097          	auipc	ra,0xffffe
    800033cc:	5f8080e7          	jalr	1528(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
		return front == nullptr;
    800033d0:	0084b783          	ld	a5,8(s1)
	while (!handle->blocked.isEmpty()) {
    800033d4:	fe0792e3          	bnez	a5,800033b8 <_ZN4KSem8closeSemEPS_+0x30>
	}
	return 0;
    800033d8:	00000513          	li	a0,0
}
    800033dc:	01813083          	ld	ra,24(sp)
    800033e0:	01013403          	ld	s0,16(sp)
    800033e4:	00813483          	ld	s1,8(sp)
    800033e8:	02010113          	addi	sp,sp,32
    800033ec:	00008067          	ret
	if (!MemoryAllocator::checkPurpose(handle, MemoryAllocator::SEMAPHORE)) return -2;
    800033f0:	ffe00513          	li	a0,-2
    800033f4:	fe9ff06f          	j	800033dc <_ZN4KSem8closeSemEPS_+0x54>

00000000800033f8 <_Z10testMemoryv>:
//void printInteger(int i){
//	printInt(i);
//}
extern Semaphore* semA;

void testMemory() {
    800033f8:	81010113          	addi	sp,sp,-2032
    800033fc:	7e113423          	sd	ra,2024(sp)
    80003400:	7e813023          	sd	s0,2016(sp)
    80003404:	7c913c23          	sd	s1,2008(sp)
    80003408:	7f010413          	addi	s0,sp,2032
    8000340c:	83010113          	addi	sp,sp,-2000
	const uint64 NumAllocations = 500;    //zasto nece za preko 500????
	const uint64 AllocationSize = 16;

	// Allocate and initialize pointers
	int* allocations[NumAllocations];
	for (uint64 i = 0; i < NumAllocations; ++i)
    80003410:	00000713          	li	a4,0
    80003414:	1f300793          	li	a5,499
    80003418:	02e7e263          	bltu	a5,a4,8000343c <_Z10testMemoryv+0x44>
		allocations[i] = nullptr;
    8000341c:	fffff7b7          	lui	a5,0xfffff
    80003420:	00371693          	slli	a3,a4,0x3
    80003424:	fe040613          	addi	a2,s0,-32
    80003428:	00f607b3          	add	a5,a2,a5
    8000342c:	00d787b3          	add	a5,a5,a3
    80003430:	0607b023          	sd	zero,96(a5) # fffffffffffff060 <end+0xffffffff7fff21b0>
	for (uint64 i = 0; i < NumAllocations; ++i)
    80003434:	00170713          	addi	a4,a4,1
    80003438:	fddff06f          	j	80003414 <_Z10testMemoryv+0x1c>

	// Allocate memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
    8000343c:	00000493          	li	s1,0
    80003440:	1f300793          	li	a5,499
    80003444:	0297ec63          	bltu	a5,s1,8000347c <_Z10testMemoryv+0x84>
		allocations[i] = static_cast<int*>(MemoryAllocator::kmalloc(AllocationSize, MemoryAllocator::MISC));
    80003448:	00300593          	li	a1,3
    8000344c:	01000513          	li	a0,16
    80003450:	00000097          	auipc	ra,0x0
    80003454:	a20080e7          	jalr	-1504(ra) # 80002e70 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
    80003458:	fffff737          	lui	a4,0xfffff
    8000345c:	00349793          	slli	a5,s1,0x3
    80003460:	fe040693          	addi	a3,s0,-32
    80003464:	00e68733          	add	a4,a3,a4
    80003468:	00f707b3          	add	a5,a4,a5
    8000346c:	06a7b023          	sd	a0,96(a5)
		if (allocations[i] == nullptr) {
    80003470:	00050663          	beqz	a0,8000347c <_Z10testMemoryv+0x84>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80003474:	00148493          	addi	s1,s1,1
    80003478:	fc9ff06f          	j	80003440 <_Z10testMemoryv+0x48>
    8000347c:	00000493          	li	s1,0
    80003480:	0100006f          	j	80003490 <_Z10testMemoryv+0x98>
	}

	// Free memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
		if (allocations[i] != nullptr) {
			if (MemoryAllocator::kfree(allocations[i]) != 0) {
    80003484:	00000097          	auipc	ra,0x0
    80003488:	ba0080e7          	jalr	-1120(ra) # 80003024 <_ZN15MemoryAllocator5kfreeEPv>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    8000348c:	00148493          	addi	s1,s1,1
    80003490:	1f300793          	li	a5,499
    80003494:	0297e263          	bltu	a5,s1,800034b8 <_Z10testMemoryv+0xc0>
		if (allocations[i] != nullptr) {
    80003498:	fffff737          	lui	a4,0xfffff
    8000349c:	00349793          	slli	a5,s1,0x3
    800034a0:	fe040693          	addi	a3,s0,-32
    800034a4:	00e68733          	add	a4,a3,a4
    800034a8:	00f707b3          	add	a5,a4,a5
    800034ac:	0607b503          	ld	a0,96(a5)
    800034b0:	fc051ae3          	bnez	a0,80003484 <_Z10testMemoryv+0x8c>
    800034b4:	fd9ff06f          	j	8000348c <_Z10testMemoryv+0x94>
//				printString("\nDeallocation failed for index ");
//				printInteger(i);
			}
		}
	}
}
    800034b8:	7d010113          	addi	sp,sp,2000
    800034bc:	7e813083          	ld	ra,2024(sp)
    800034c0:	7e013403          	ld	s0,2016(sp)
    800034c4:	7d813483          	ld	s1,2008(sp)
    800034c8:	7f010113          	addi	sp,sp,2032
    800034cc:	00008067          	ret

00000000800034d0 <_Z5nit1fPv>:

void nit1f(void*) {
    800034d0:	ff010113          	addi	sp,sp,-16
    800034d4:	00113423          	sd	ra,8(sp)
    800034d8:	00813023          	sd	s0,0(sp)
    800034dc:	01010413          	addi	s0,sp,16
//		printString("\nsem_wait za nit 1 vratio ");
//		printInteger(res);
//		printString("\n");
//	}

	printString("\nGotova nit 1\n");
    800034e0:	00006517          	auipc	a0,0x6
    800034e4:	d1050513          	addi	a0,a0,-752 # 800091f0 <CONSOLE_STATUS+0x1e0>
    800034e8:	00002097          	auipc	ra,0x2
    800034ec:	530080e7          	jalr	1328(ra) # 80005a18 <_Z11printStringPKc>
}
    800034f0:	00813083          	ld	ra,8(sp)
    800034f4:	00013403          	ld	s0,0(sp)
    800034f8:	01010113          	addi	sp,sp,16
    800034fc:	00008067          	ret

0000000080003500 <_Z5nit2fPv>:

void nit2f(void* arg2) {
    80003500:	ff010113          	addi	sp,sp,-16
    80003504:	00113423          	sd	ra,8(sp)
    80003508:	00813023          	sd	s0,0(sp)
    8000350c:	01010413          	addi	s0,sp,16
//		//sem_close(semA);
//		printString("\nNit 2 ubija semafor\n");
//		delete semA;
//
//	}
	printString("\nGotova nit 2\n");
    80003510:	00006517          	auipc	a0,0x6
    80003514:	cf050513          	addi	a0,a0,-784 # 80009200 <CONSOLE_STATUS+0x1f0>
    80003518:	00002097          	auipc	ra,0x2
    8000351c:	500080e7          	jalr	1280(ra) # 80005a18 <_Z11printStringPKc>
}
    80003520:	00813083          	ld	ra,8(sp)
    80003524:	00013403          	ld	s0,0(sp)
    80003528:	01010113          	addi	sp,sp,16
    8000352c:	00008067          	ret

0000000080003530 <_Z5nit3fPv>:


void nit3f(void*) {
    80003530:	fe010113          	addi	sp,sp,-32
    80003534:	00113c23          	sd	ra,24(sp)
    80003538:	00813823          	sd	s0,16(sp)
    8000353c:	00913423          	sd	s1,8(sp)
    80003540:	02010413          	addi	s0,sp,32
    80003544:	0180006f          	j	8000355c <_Z5nit3fPv+0x2c>
	char slovo;
	do {
		slovo = getc();
		putc(slovo);
		if(slovo=='\r') putc('\n');
    80003548:	00a00513          	li	a0,10
    8000354c:	ffffe097          	auipc	ra,0xffffe
    80003550:	044080e7          	jalr	68(ra) # 80001590 <_Z4putcc>
	} while (slovo != '0');
    80003554:	03000793          	li	a5,48
    80003558:	02f48263          	beq	s1,a5,8000357c <_Z5nit3fPv+0x4c>
		slovo = getc();
    8000355c:	ffffe097          	auipc	ra,0xffffe
    80003560:	00c080e7          	jalr	12(ra) # 80001568 <_Z4getcv>
    80003564:	00050493          	mv	s1,a0
		putc(slovo);
    80003568:	ffffe097          	auipc	ra,0xffffe
    8000356c:	028080e7          	jalr	40(ra) # 80001590 <_Z4putcc>
		if(slovo=='\r') putc('\n');
    80003570:	00d00793          	li	a5,13
    80003574:	fef490e3          	bne	s1,a5,80003554 <_Z5nit3fPv+0x24>
    80003578:	fd1ff06f          	j	80003548 <_Z5nit3fPv+0x18>

	printString("\nGotova nit3\n");
    8000357c:	00006517          	auipc	a0,0x6
    80003580:	c9450513          	addi	a0,a0,-876 # 80009210 <CONSOLE_STATUS+0x200>
    80003584:	00002097          	auipc	ra,0x2
    80003588:	494080e7          	jalr	1172(ra) # 80005a18 <_Z11printStringPKc>
    8000358c:	01813083          	ld	ra,24(sp)
    80003590:	01013403          	ld	s0,16(sp)
    80003594:	00813483          	ld	s1,8(sp)
    80003598:	02010113          	addi	sp,sp,32
    8000359c:	00008067          	ret

00000000800035a0 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    800035a0:	fe010113          	addi	sp,sp,-32
    800035a4:	00113c23          	sd	ra,24(sp)
    800035a8:	00813823          	sd	s0,16(sp)
    800035ac:	00913423          	sd	s1,8(sp)
    800035b0:	01213023          	sd	s2,0(sp)
    800035b4:	02010413          	addi	s0,sp,32
    800035b8:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    800035bc:	00000913          	li	s2,0
    800035c0:	00c0006f          	j	800035cc <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    800035c4:	ffffe097          	auipc	ra,0xffffe
    800035c8:	e64080e7          	jalr	-412(ra) # 80001428 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
    800035cc:	ffffe097          	auipc	ra,0xffffe
    800035d0:	f9c080e7          	jalr	-100(ra) # 80001568 <_Z4getcv>
    800035d4:	0005059b          	sext.w	a1,a0
    800035d8:	02d00793          	li	a5,45
    800035dc:	02f58a63          	beq	a1,a5,80003610 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    800035e0:	0084b503          	ld	a0,8(s1)
    800035e4:	00003097          	auipc	ra,0x3
    800035e8:	400080e7          	jalr	1024(ra) # 800069e4 <_ZN6Buffer3putEi>
        i++;
    800035ec:	0019071b          	addiw	a4,s2,1
    800035f0:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800035f4:	0004a683          	lw	a3,0(s1)
    800035f8:	0026979b          	slliw	a5,a3,0x2
    800035fc:	00d787bb          	addw	a5,a5,a3
    80003600:	0017979b          	slliw	a5,a5,0x1
    80003604:	02f767bb          	remw	a5,a4,a5
    80003608:	fc0792e3          	bnez	a5,800035cc <_ZL16producerKeyboardPv+0x2c>
    8000360c:	fb9ff06f          	j	800035c4 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80003610:	00100793          	li	a5,1
    80003614:	00008717          	auipc	a4,0x8
    80003618:	5ef72223          	sw	a5,1508(a4) # 8000bbf8 <_ZL9threadEnd>
    data->buffer->put('!');
    8000361c:	02100593          	li	a1,33
    80003620:	0084b503          	ld	a0,8(s1)
    80003624:	00003097          	auipc	ra,0x3
    80003628:	3c0080e7          	jalr	960(ra) # 800069e4 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    8000362c:	0104b503          	ld	a0,16(s1)
    80003630:	ffffe097          	auipc	ra,0xffffe
    80003634:	f08080e7          	jalr	-248(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    80003638:	01813083          	ld	ra,24(sp)
    8000363c:	01013403          	ld	s0,16(sp)
    80003640:	00813483          	ld	s1,8(sp)
    80003644:	00013903          	ld	s2,0(sp)
    80003648:	02010113          	addi	sp,sp,32
    8000364c:	00008067          	ret

0000000080003650 <_ZL8producerPv>:

static void producer(void *arg) {
    80003650:	fe010113          	addi	sp,sp,-32
    80003654:	00113c23          	sd	ra,24(sp)
    80003658:	00813823          	sd	s0,16(sp)
    8000365c:	00913423          	sd	s1,8(sp)
    80003660:	01213023          	sd	s2,0(sp)
    80003664:	02010413          	addi	s0,sp,32
    80003668:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    8000366c:	00000913          	li	s2,0
    80003670:	00c0006f          	j	8000367c <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003674:	ffffe097          	auipc	ra,0xffffe
    80003678:	db4080e7          	jalr	-588(ra) # 80001428 <_Z15thread_dispatchv>
    while (!threadEnd) {
    8000367c:	00008797          	auipc	a5,0x8
    80003680:	57c7a783          	lw	a5,1404(a5) # 8000bbf8 <_ZL9threadEnd>
    80003684:	02079e63          	bnez	a5,800036c0 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80003688:	0004a583          	lw	a1,0(s1)
    8000368c:	0305859b          	addiw	a1,a1,48
    80003690:	0084b503          	ld	a0,8(s1)
    80003694:	00003097          	auipc	ra,0x3
    80003698:	350080e7          	jalr	848(ra) # 800069e4 <_ZN6Buffer3putEi>
        i++;
    8000369c:	0019071b          	addiw	a4,s2,1
    800036a0:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800036a4:	0004a683          	lw	a3,0(s1)
    800036a8:	0026979b          	slliw	a5,a3,0x2
    800036ac:	00d787bb          	addw	a5,a5,a3
    800036b0:	0017979b          	slliw	a5,a5,0x1
    800036b4:	02f767bb          	remw	a5,a4,a5
    800036b8:	fc0792e3          	bnez	a5,8000367c <_ZL8producerPv+0x2c>
    800036bc:	fb9ff06f          	j	80003674 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    800036c0:	0104b503          	ld	a0,16(s1)
    800036c4:	ffffe097          	auipc	ra,0xffffe
    800036c8:	e74080e7          	jalr	-396(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    800036cc:	01813083          	ld	ra,24(sp)
    800036d0:	01013403          	ld	s0,16(sp)
    800036d4:	00813483          	ld	s1,8(sp)
    800036d8:	00013903          	ld	s2,0(sp)
    800036dc:	02010113          	addi	sp,sp,32
    800036e0:	00008067          	ret

00000000800036e4 <_ZL8consumerPv>:

static void consumer(void *arg) {
    800036e4:	fd010113          	addi	sp,sp,-48
    800036e8:	02113423          	sd	ra,40(sp)
    800036ec:	02813023          	sd	s0,32(sp)
    800036f0:	00913c23          	sd	s1,24(sp)
    800036f4:	01213823          	sd	s2,16(sp)
    800036f8:	01313423          	sd	s3,8(sp)
    800036fc:	03010413          	addi	s0,sp,48
    80003700:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003704:	00000993          	li	s3,0
    80003708:	01c0006f          	j	80003724 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    8000370c:	ffffe097          	auipc	ra,0xffffe
    80003710:	d1c080e7          	jalr	-740(ra) # 80001428 <_Z15thread_dispatchv>
    80003714:	0500006f          	j	80003764 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80003718:	00a00513          	li	a0,10
    8000371c:	ffffe097          	auipc	ra,0xffffe
    80003720:	e74080e7          	jalr	-396(ra) # 80001590 <_Z4putcc>
    while (!threadEnd) {
    80003724:	00008797          	auipc	a5,0x8
    80003728:	4d47a783          	lw	a5,1236(a5) # 8000bbf8 <_ZL9threadEnd>
    8000372c:	06079063          	bnez	a5,8000378c <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    80003730:	00893503          	ld	a0,8(s2)
    80003734:	00003097          	auipc	ra,0x3
    80003738:	340080e7          	jalr	832(ra) # 80006a74 <_ZN6Buffer3getEv>
        i++;
    8000373c:	0019849b          	addiw	s1,s3,1
    80003740:	0004899b          	sext.w	s3,s1
        putc(key);
    80003744:	0ff57513          	andi	a0,a0,255
    80003748:	ffffe097          	auipc	ra,0xffffe
    8000374c:	e48080e7          	jalr	-440(ra) # 80001590 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80003750:	00092703          	lw	a4,0(s2)
    80003754:	0027179b          	slliw	a5,a4,0x2
    80003758:	00e787bb          	addw	a5,a5,a4
    8000375c:	02f4e7bb          	remw	a5,s1,a5
    80003760:	fa0786e3          	beqz	a5,8000370c <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80003764:	05000793          	li	a5,80
    80003768:	02f4e4bb          	remw	s1,s1,a5
    8000376c:	fa049ce3          	bnez	s1,80003724 <_ZL8consumerPv+0x40>
    80003770:	fa9ff06f          	j	80003718 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80003774:	00893503          	ld	a0,8(s2)
    80003778:	00003097          	auipc	ra,0x3
    8000377c:	2fc080e7          	jalr	764(ra) # 80006a74 <_ZN6Buffer3getEv>
        putc(key);
    80003780:	0ff57513          	andi	a0,a0,255
    80003784:	ffffe097          	auipc	ra,0xffffe
    80003788:	e0c080e7          	jalr	-500(ra) # 80001590 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    8000378c:	00893503          	ld	a0,8(s2)
    80003790:	00003097          	auipc	ra,0x3
    80003794:	370080e7          	jalr	880(ra) # 80006b00 <_ZN6Buffer6getCntEv>
    80003798:	fca04ee3          	bgtz	a0,80003774 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    8000379c:	01093503          	ld	a0,16(s2)
    800037a0:	ffffe097          	auipc	ra,0xffffe
    800037a4:	d98080e7          	jalr	-616(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    800037a8:	02813083          	ld	ra,40(sp)
    800037ac:	02013403          	ld	s0,32(sp)
    800037b0:	01813483          	ld	s1,24(sp)
    800037b4:	01013903          	ld	s2,16(sp)
    800037b8:	00813983          	ld	s3,8(sp)
    800037bc:	03010113          	addi	sp,sp,48
    800037c0:	00008067          	ret

00000000800037c4 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    800037c4:	f9010113          	addi	sp,sp,-112
    800037c8:	06113423          	sd	ra,104(sp)
    800037cc:	06813023          	sd	s0,96(sp)
    800037d0:	04913c23          	sd	s1,88(sp)
    800037d4:	05213823          	sd	s2,80(sp)
    800037d8:	05313423          	sd	s3,72(sp)
    800037dc:	05413023          	sd	s4,64(sp)
    800037e0:	03513c23          	sd	s5,56(sp)
    800037e4:	03613823          	sd	s6,48(sp)
    800037e8:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    800037ec:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    800037f0:	00006517          	auipc	a0,0x6
    800037f4:	a3050513          	addi	a0,a0,-1488 # 80009220 <CONSOLE_STATUS+0x210>
    800037f8:	00002097          	auipc	ra,0x2
    800037fc:	220080e7          	jalr	544(ra) # 80005a18 <_Z11printStringPKc>
    getString(input, 30);
    80003800:	01e00593          	li	a1,30
    80003804:	fa040493          	addi	s1,s0,-96
    80003808:	00048513          	mv	a0,s1
    8000380c:	00002097          	auipc	ra,0x2
    80003810:	294080e7          	jalr	660(ra) # 80005aa0 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80003814:	00048513          	mv	a0,s1
    80003818:	00002097          	auipc	ra,0x2
    8000381c:	360080e7          	jalr	864(ra) # 80005b78 <_Z11stringToIntPKc>
    80003820:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80003824:	00006517          	auipc	a0,0x6
    80003828:	a1c50513          	addi	a0,a0,-1508 # 80009240 <CONSOLE_STATUS+0x230>
    8000382c:	00002097          	auipc	ra,0x2
    80003830:	1ec080e7          	jalr	492(ra) # 80005a18 <_Z11printStringPKc>
    getString(input, 30);
    80003834:	01e00593          	li	a1,30
    80003838:	00048513          	mv	a0,s1
    8000383c:	00002097          	auipc	ra,0x2
    80003840:	264080e7          	jalr	612(ra) # 80005aa0 <_Z9getStringPci>
    n = stringToInt(input);
    80003844:	00048513          	mv	a0,s1
    80003848:	00002097          	auipc	ra,0x2
    8000384c:	330080e7          	jalr	816(ra) # 80005b78 <_Z11stringToIntPKc>
    80003850:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80003854:	00006517          	auipc	a0,0x6
    80003858:	a0c50513          	addi	a0,a0,-1524 # 80009260 <CONSOLE_STATUS+0x250>
    8000385c:	00002097          	auipc	ra,0x2
    80003860:	1bc080e7          	jalr	444(ra) # 80005a18 <_Z11printStringPKc>
    80003864:	00000613          	li	a2,0
    80003868:	00a00593          	li	a1,10
    8000386c:	00090513          	mv	a0,s2
    80003870:	00002097          	auipc	ra,0x2
    80003874:	358080e7          	jalr	856(ra) # 80005bc8 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80003878:	00006517          	auipc	a0,0x6
    8000387c:	a0050513          	addi	a0,a0,-1536 # 80009278 <CONSOLE_STATUS+0x268>
    80003880:	00002097          	auipc	ra,0x2
    80003884:	198080e7          	jalr	408(ra) # 80005a18 <_Z11printStringPKc>
    80003888:	00000613          	li	a2,0
    8000388c:	00a00593          	li	a1,10
    80003890:	00048513          	mv	a0,s1
    80003894:	00002097          	auipc	ra,0x2
    80003898:	334080e7          	jalr	820(ra) # 80005bc8 <_Z8printIntiii>
    printString(".\n");
    8000389c:	00006517          	auipc	a0,0x6
    800038a0:	9f450513          	addi	a0,a0,-1548 # 80009290 <CONSOLE_STATUS+0x280>
    800038a4:	00002097          	auipc	ra,0x2
    800038a8:	174080e7          	jalr	372(ra) # 80005a18 <_Z11printStringPKc>
    if(threadNum > n) {
    800038ac:	0324c463          	blt	s1,s2,800038d4 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    800038b0:	03205c63          	blez	s2,800038e8 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    800038b4:	03800513          	li	a0,56
    800038b8:	fffff097          	auipc	ra,0xfffff
    800038bc:	d9c080e7          	jalr	-612(ra) # 80002654 <_Znwm>
    800038c0:	00050a13          	mv	s4,a0
    800038c4:	00048593          	mv	a1,s1
    800038c8:	00003097          	auipc	ra,0x3
    800038cc:	080080e7          	jalr	128(ra) # 80006948 <_ZN6BufferC1Ei>
    800038d0:	0300006f          	j	80003900 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800038d4:	00006517          	auipc	a0,0x6
    800038d8:	9c450513          	addi	a0,a0,-1596 # 80009298 <CONSOLE_STATUS+0x288>
    800038dc:	00002097          	auipc	ra,0x2
    800038e0:	13c080e7          	jalr	316(ra) # 80005a18 <_Z11printStringPKc>
        return;
    800038e4:	0140006f          	j	800038f8 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800038e8:	00006517          	auipc	a0,0x6
    800038ec:	9f050513          	addi	a0,a0,-1552 # 800092d8 <CONSOLE_STATUS+0x2c8>
    800038f0:	00002097          	auipc	ra,0x2
    800038f4:	128080e7          	jalr	296(ra) # 80005a18 <_Z11printStringPKc>
        return;
    800038f8:	000b0113          	mv	sp,s6
    800038fc:	1500006f          	j	80003a4c <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80003900:	00000593          	li	a1,0
    80003904:	00008517          	auipc	a0,0x8
    80003908:	2fc50513          	addi	a0,a0,764 # 8000bc00 <_ZL10waitForAll>
    8000390c:	ffffe097          	auipc	ra,0xffffe
    80003910:	b94080e7          	jalr	-1132(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    thread_t threads[threadNum];
    80003914:	00391793          	slli	a5,s2,0x3
    80003918:	00f78793          	addi	a5,a5,15
    8000391c:	ff07f793          	andi	a5,a5,-16
    80003920:	40f10133          	sub	sp,sp,a5
    80003924:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80003928:	0019071b          	addiw	a4,s2,1
    8000392c:	00171793          	slli	a5,a4,0x1
    80003930:	00e787b3          	add	a5,a5,a4
    80003934:	00379793          	slli	a5,a5,0x3
    80003938:	00f78793          	addi	a5,a5,15
    8000393c:	ff07f793          	andi	a5,a5,-16
    80003940:	40f10133          	sub	sp,sp,a5
    80003944:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80003948:	00191613          	slli	a2,s2,0x1
    8000394c:	012607b3          	add	a5,a2,s2
    80003950:	00379793          	slli	a5,a5,0x3
    80003954:	00f987b3          	add	a5,s3,a5
    80003958:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    8000395c:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80003960:	00008717          	auipc	a4,0x8
    80003964:	2a073703          	ld	a4,672(a4) # 8000bc00 <_ZL10waitForAll>
    80003968:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    8000396c:	00078613          	mv	a2,a5
    80003970:	00000597          	auipc	a1,0x0
    80003974:	d7458593          	addi	a1,a1,-652 # 800036e4 <_ZL8consumerPv>
    80003978:	f9840513          	addi	a0,s0,-104
    8000397c:	ffffe097          	auipc	ra,0xffffe
    80003980:	a04080e7          	jalr	-1532(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003984:	00000493          	li	s1,0
    80003988:	0280006f          	j	800039b0 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    8000398c:	00000597          	auipc	a1,0x0
    80003990:	c1458593          	addi	a1,a1,-1004 # 800035a0 <_ZL16producerKeyboardPv>
                      data + i);
    80003994:	00179613          	slli	a2,a5,0x1
    80003998:	00f60633          	add	a2,a2,a5
    8000399c:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    800039a0:	00c98633          	add	a2,s3,a2
    800039a4:	ffffe097          	auipc	ra,0xffffe
    800039a8:	9dc080e7          	jalr	-1572(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    800039ac:	0014849b          	addiw	s1,s1,1
    800039b0:	0524d263          	bge	s1,s2,800039f4 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    800039b4:	00149793          	slli	a5,s1,0x1
    800039b8:	009787b3          	add	a5,a5,s1
    800039bc:	00379793          	slli	a5,a5,0x3
    800039c0:	00f987b3          	add	a5,s3,a5
    800039c4:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800039c8:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    800039cc:	00008717          	auipc	a4,0x8
    800039d0:	23473703          	ld	a4,564(a4) # 8000bc00 <_ZL10waitForAll>
    800039d4:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    800039d8:	00048793          	mv	a5,s1
    800039dc:	00349513          	slli	a0,s1,0x3
    800039e0:	00aa8533          	add	a0,s5,a0
    800039e4:	fa9054e3          	blez	s1,8000398c <_Z22producerConsumer_C_APIv+0x1c8>
    800039e8:	00000597          	auipc	a1,0x0
    800039ec:	c6858593          	addi	a1,a1,-920 # 80003650 <_ZL8producerPv>
    800039f0:	fa5ff06f          	j	80003994 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    800039f4:	ffffe097          	auipc	ra,0xffffe
    800039f8:	a34080e7          	jalr	-1484(ra) # 80001428 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    800039fc:	00000493          	li	s1,0
    80003a00:	00994e63          	blt	s2,s1,80003a1c <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80003a04:	00008517          	auipc	a0,0x8
    80003a08:	1fc53503          	ld	a0,508(a0) # 8000bc00 <_ZL10waitForAll>
    80003a0c:	ffffe097          	auipc	ra,0xffffe
    80003a10:	afc080e7          	jalr	-1284(ra) # 80001508 <_Z8sem_waitP4KSem>
    for (int i = 0; i <= threadNum; i++) {
    80003a14:	0014849b          	addiw	s1,s1,1
    80003a18:	fe9ff06f          	j	80003a00 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80003a1c:	00008517          	auipc	a0,0x8
    80003a20:	1e453503          	ld	a0,484(a0) # 8000bc00 <_ZL10waitForAll>
    80003a24:	ffffe097          	auipc	ra,0xffffe
    80003a28:	ab4080e7          	jalr	-1356(ra) # 800014d8 <_Z9sem_closeP4KSem>
    delete buffer;
    80003a2c:	000a0e63          	beqz	s4,80003a48 <_Z22producerConsumer_C_APIv+0x284>
    80003a30:	000a0513          	mv	a0,s4
    80003a34:	00003097          	auipc	ra,0x3
    80003a38:	154080e7          	jalr	340(ra) # 80006b88 <_ZN6BufferD1Ev>
    80003a3c:	000a0513          	mv	a0,s4
    80003a40:	fffff097          	auipc	ra,0xfffff
    80003a44:	c64080e7          	jalr	-924(ra) # 800026a4 <_ZdlPv>
    80003a48:	000b0113          	mv	sp,s6

}
    80003a4c:	f9040113          	addi	sp,s0,-112
    80003a50:	06813083          	ld	ra,104(sp)
    80003a54:	06013403          	ld	s0,96(sp)
    80003a58:	05813483          	ld	s1,88(sp)
    80003a5c:	05013903          	ld	s2,80(sp)
    80003a60:	04813983          	ld	s3,72(sp)
    80003a64:	04013a03          	ld	s4,64(sp)
    80003a68:	03813a83          	ld	s5,56(sp)
    80003a6c:	03013b03          	ld	s6,48(sp)
    80003a70:	07010113          	addi	sp,sp,112
    80003a74:	00008067          	ret
    80003a78:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80003a7c:	000a0513          	mv	a0,s4
    80003a80:	fffff097          	auipc	ra,0xfffff
    80003a84:	c24080e7          	jalr	-988(ra) # 800026a4 <_ZdlPv>
    80003a88:	00048513          	mv	a0,s1
    80003a8c:	00009097          	auipc	ra,0x9
    80003a90:	28c080e7          	jalr	652(ra) # 8000cd18 <_Unwind_Resume>

0000000080003a94 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003a94:	fe010113          	addi	sp,sp,-32
    80003a98:	00113c23          	sd	ra,24(sp)
    80003a9c:	00813823          	sd	s0,16(sp)
    80003aa0:	00913423          	sd	s1,8(sp)
    80003aa4:	01213023          	sd	s2,0(sp)
    80003aa8:	02010413          	addi	s0,sp,32
    80003aac:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003ab0:	00100793          	li	a5,1
    80003ab4:	02a7f863          	bgeu	a5,a0,80003ae4 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80003ab8:	00a00793          	li	a5,10
    80003abc:	02f577b3          	remu	a5,a0,a5
    80003ac0:	02078e63          	beqz	a5,80003afc <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80003ac4:	fff48513          	addi	a0,s1,-1
    80003ac8:	00000097          	auipc	ra,0x0
    80003acc:	fcc080e7          	jalr	-52(ra) # 80003a94 <_ZL9fibonaccim>
    80003ad0:	00050913          	mv	s2,a0
    80003ad4:	ffe48513          	addi	a0,s1,-2
    80003ad8:	00000097          	auipc	ra,0x0
    80003adc:	fbc080e7          	jalr	-68(ra) # 80003a94 <_ZL9fibonaccim>
    80003ae0:	00a90533          	add	a0,s2,a0
}
    80003ae4:	01813083          	ld	ra,24(sp)
    80003ae8:	01013403          	ld	s0,16(sp)
    80003aec:	00813483          	ld	s1,8(sp)
    80003af0:	00013903          	ld	s2,0(sp)
    80003af4:	02010113          	addi	sp,sp,32
    80003af8:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80003afc:	ffffe097          	auipc	ra,0xffffe
    80003b00:	92c080e7          	jalr	-1748(ra) # 80001428 <_Z15thread_dispatchv>
    80003b04:	fc1ff06f          	j	80003ac4 <_ZL9fibonaccim+0x30>

0000000080003b08 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80003b08:	fe010113          	addi	sp,sp,-32
    80003b0c:	00113c23          	sd	ra,24(sp)
    80003b10:	00813823          	sd	s0,16(sp)
    80003b14:	00913423          	sd	s1,8(sp)
    80003b18:	01213023          	sd	s2,0(sp)
    80003b1c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003b20:	00000913          	li	s2,0
    80003b24:	0380006f          	j	80003b5c <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003b28:	ffffe097          	auipc	ra,0xffffe
    80003b2c:	900080e7          	jalr	-1792(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003b30:	00148493          	addi	s1,s1,1
    80003b34:	000027b7          	lui	a5,0x2
    80003b38:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003b3c:	0097ee63          	bltu	a5,s1,80003b58 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003b40:	00000713          	li	a4,0
    80003b44:	000077b7          	lui	a5,0x7
    80003b48:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003b4c:	fce7eee3          	bltu	a5,a4,80003b28 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80003b50:	00170713          	addi	a4,a4,1
    80003b54:	ff1ff06f          	j	80003b44 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003b58:	00190913          	addi	s2,s2,1
    80003b5c:	00900793          	li	a5,9
    80003b60:	0527e063          	bltu	a5,s2,80003ba0 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003b64:	00005517          	auipc	a0,0x5
    80003b68:	7a450513          	addi	a0,a0,1956 # 80009308 <CONSOLE_STATUS+0x2f8>
    80003b6c:	00002097          	auipc	ra,0x2
    80003b70:	eac080e7          	jalr	-340(ra) # 80005a18 <_Z11printStringPKc>
    80003b74:	00000613          	li	a2,0
    80003b78:	00a00593          	li	a1,10
    80003b7c:	0009051b          	sext.w	a0,s2
    80003b80:	00002097          	auipc	ra,0x2
    80003b84:	048080e7          	jalr	72(ra) # 80005bc8 <_Z8printIntiii>
    80003b88:	00006517          	auipc	a0,0x6
    80003b8c:	9e050513          	addi	a0,a0,-1568 # 80009568 <CONSOLE_STATUS+0x558>
    80003b90:	00002097          	auipc	ra,0x2
    80003b94:	e88080e7          	jalr	-376(ra) # 80005a18 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003b98:	00000493          	li	s1,0
    80003b9c:	f99ff06f          	j	80003b34 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003ba0:	00005517          	auipc	a0,0x5
    80003ba4:	77050513          	addi	a0,a0,1904 # 80009310 <CONSOLE_STATUS+0x300>
    80003ba8:	00002097          	auipc	ra,0x2
    80003bac:	e70080e7          	jalr	-400(ra) # 80005a18 <_Z11printStringPKc>
    finishedA = true;
    80003bb0:	00100793          	li	a5,1
    80003bb4:	00008717          	auipc	a4,0x8
    80003bb8:	04f70a23          	sb	a5,84(a4) # 8000bc08 <_ZL9finishedA>
}
    80003bbc:	01813083          	ld	ra,24(sp)
    80003bc0:	01013403          	ld	s0,16(sp)
    80003bc4:	00813483          	ld	s1,8(sp)
    80003bc8:	00013903          	ld	s2,0(sp)
    80003bcc:	02010113          	addi	sp,sp,32
    80003bd0:	00008067          	ret

0000000080003bd4 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80003bd4:	fe010113          	addi	sp,sp,-32
    80003bd8:	00113c23          	sd	ra,24(sp)
    80003bdc:	00813823          	sd	s0,16(sp)
    80003be0:	00913423          	sd	s1,8(sp)
    80003be4:	01213023          	sd	s2,0(sp)
    80003be8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003bec:	00000913          	li	s2,0
    80003bf0:	0380006f          	j	80003c28 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003bf4:	ffffe097          	auipc	ra,0xffffe
    80003bf8:	834080e7          	jalr	-1996(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003bfc:	00148493          	addi	s1,s1,1
    80003c00:	000027b7          	lui	a5,0x2
    80003c04:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003c08:	0097ee63          	bltu	a5,s1,80003c24 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003c0c:	00000713          	li	a4,0
    80003c10:	000077b7          	lui	a5,0x7
    80003c14:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003c18:	fce7eee3          	bltu	a5,a4,80003bf4 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80003c1c:	00170713          	addi	a4,a4,1
    80003c20:	ff1ff06f          	j	80003c10 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003c24:	00190913          	addi	s2,s2,1
    80003c28:	00f00793          	li	a5,15
    80003c2c:	0527e063          	bltu	a5,s2,80003c6c <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003c30:	00005517          	auipc	a0,0x5
    80003c34:	6f050513          	addi	a0,a0,1776 # 80009320 <CONSOLE_STATUS+0x310>
    80003c38:	00002097          	auipc	ra,0x2
    80003c3c:	de0080e7          	jalr	-544(ra) # 80005a18 <_Z11printStringPKc>
    80003c40:	00000613          	li	a2,0
    80003c44:	00a00593          	li	a1,10
    80003c48:	0009051b          	sext.w	a0,s2
    80003c4c:	00002097          	auipc	ra,0x2
    80003c50:	f7c080e7          	jalr	-132(ra) # 80005bc8 <_Z8printIntiii>
    80003c54:	00006517          	auipc	a0,0x6
    80003c58:	91450513          	addi	a0,a0,-1772 # 80009568 <CONSOLE_STATUS+0x558>
    80003c5c:	00002097          	auipc	ra,0x2
    80003c60:	dbc080e7          	jalr	-580(ra) # 80005a18 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003c64:	00000493          	li	s1,0
    80003c68:	f99ff06f          	j	80003c00 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80003c6c:	00005517          	auipc	a0,0x5
    80003c70:	6bc50513          	addi	a0,a0,1724 # 80009328 <CONSOLE_STATUS+0x318>
    80003c74:	00002097          	auipc	ra,0x2
    80003c78:	da4080e7          	jalr	-604(ra) # 80005a18 <_Z11printStringPKc>
    finishedB = true;
    80003c7c:	00100793          	li	a5,1
    80003c80:	00008717          	auipc	a4,0x8
    80003c84:	f8f704a3          	sb	a5,-119(a4) # 8000bc09 <_ZL9finishedB>
    thread_dispatch();
    80003c88:	ffffd097          	auipc	ra,0xffffd
    80003c8c:	7a0080e7          	jalr	1952(ra) # 80001428 <_Z15thread_dispatchv>
}
    80003c90:	01813083          	ld	ra,24(sp)
    80003c94:	01013403          	ld	s0,16(sp)
    80003c98:	00813483          	ld	s1,8(sp)
    80003c9c:	00013903          	ld	s2,0(sp)
    80003ca0:	02010113          	addi	sp,sp,32
    80003ca4:	00008067          	ret

0000000080003ca8 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80003ca8:	fe010113          	addi	sp,sp,-32
    80003cac:	00113c23          	sd	ra,24(sp)
    80003cb0:	00813823          	sd	s0,16(sp)
    80003cb4:	00913423          	sd	s1,8(sp)
    80003cb8:	01213023          	sd	s2,0(sp)
    80003cbc:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80003cc0:	00000493          	li	s1,0
    80003cc4:	0400006f          	j	80003d04 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003cc8:	00005517          	auipc	a0,0x5
    80003ccc:	67050513          	addi	a0,a0,1648 # 80009338 <CONSOLE_STATUS+0x328>
    80003cd0:	00002097          	auipc	ra,0x2
    80003cd4:	d48080e7          	jalr	-696(ra) # 80005a18 <_Z11printStringPKc>
    80003cd8:	00000613          	li	a2,0
    80003cdc:	00a00593          	li	a1,10
    80003ce0:	00048513          	mv	a0,s1
    80003ce4:	00002097          	auipc	ra,0x2
    80003ce8:	ee4080e7          	jalr	-284(ra) # 80005bc8 <_Z8printIntiii>
    80003cec:	00006517          	auipc	a0,0x6
    80003cf0:	87c50513          	addi	a0,a0,-1924 # 80009568 <CONSOLE_STATUS+0x558>
    80003cf4:	00002097          	auipc	ra,0x2
    80003cf8:	d24080e7          	jalr	-732(ra) # 80005a18 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80003cfc:	0014849b          	addiw	s1,s1,1
    80003d00:	0ff4f493          	andi	s1,s1,255
    80003d04:	00200793          	li	a5,2
    80003d08:	fc97f0e3          	bgeu	a5,s1,80003cc8 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80003d0c:	00005517          	auipc	a0,0x5
    80003d10:	63450513          	addi	a0,a0,1588 # 80009340 <CONSOLE_STATUS+0x330>
    80003d14:	00002097          	auipc	ra,0x2
    80003d18:	d04080e7          	jalr	-764(ra) # 80005a18 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80003d1c:	00700313          	li	t1,7
    thread_dispatch();
    80003d20:	ffffd097          	auipc	ra,0xffffd
    80003d24:	708080e7          	jalr	1800(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80003d28:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80003d2c:	00005517          	auipc	a0,0x5
    80003d30:	62450513          	addi	a0,a0,1572 # 80009350 <CONSOLE_STATUS+0x340>
    80003d34:	00002097          	auipc	ra,0x2
    80003d38:	ce4080e7          	jalr	-796(ra) # 80005a18 <_Z11printStringPKc>
    80003d3c:	00000613          	li	a2,0
    80003d40:	00a00593          	li	a1,10
    80003d44:	0009051b          	sext.w	a0,s2
    80003d48:	00002097          	auipc	ra,0x2
    80003d4c:	e80080e7          	jalr	-384(ra) # 80005bc8 <_Z8printIntiii>
    80003d50:	00006517          	auipc	a0,0x6
    80003d54:	81850513          	addi	a0,a0,-2024 # 80009568 <CONSOLE_STATUS+0x558>
    80003d58:	00002097          	auipc	ra,0x2
    80003d5c:	cc0080e7          	jalr	-832(ra) # 80005a18 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80003d60:	00c00513          	li	a0,12
    80003d64:	00000097          	auipc	ra,0x0
    80003d68:	d30080e7          	jalr	-720(ra) # 80003a94 <_ZL9fibonaccim>
    80003d6c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80003d70:	00005517          	auipc	a0,0x5
    80003d74:	5e850513          	addi	a0,a0,1512 # 80009358 <CONSOLE_STATUS+0x348>
    80003d78:	00002097          	auipc	ra,0x2
    80003d7c:	ca0080e7          	jalr	-864(ra) # 80005a18 <_Z11printStringPKc>
    80003d80:	00000613          	li	a2,0
    80003d84:	00a00593          	li	a1,10
    80003d88:	0009051b          	sext.w	a0,s2
    80003d8c:	00002097          	auipc	ra,0x2
    80003d90:	e3c080e7          	jalr	-452(ra) # 80005bc8 <_Z8printIntiii>
    80003d94:	00005517          	auipc	a0,0x5
    80003d98:	7d450513          	addi	a0,a0,2004 # 80009568 <CONSOLE_STATUS+0x558>
    80003d9c:	00002097          	auipc	ra,0x2
    80003da0:	c7c080e7          	jalr	-900(ra) # 80005a18 <_Z11printStringPKc>
    80003da4:	0400006f          	j	80003de4 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003da8:	00005517          	auipc	a0,0x5
    80003dac:	59050513          	addi	a0,a0,1424 # 80009338 <CONSOLE_STATUS+0x328>
    80003db0:	00002097          	auipc	ra,0x2
    80003db4:	c68080e7          	jalr	-920(ra) # 80005a18 <_Z11printStringPKc>
    80003db8:	00000613          	li	a2,0
    80003dbc:	00a00593          	li	a1,10
    80003dc0:	00048513          	mv	a0,s1
    80003dc4:	00002097          	auipc	ra,0x2
    80003dc8:	e04080e7          	jalr	-508(ra) # 80005bc8 <_Z8printIntiii>
    80003dcc:	00005517          	auipc	a0,0x5
    80003dd0:	79c50513          	addi	a0,a0,1948 # 80009568 <CONSOLE_STATUS+0x558>
    80003dd4:	00002097          	auipc	ra,0x2
    80003dd8:	c44080e7          	jalr	-956(ra) # 80005a18 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80003ddc:	0014849b          	addiw	s1,s1,1
    80003de0:	0ff4f493          	andi	s1,s1,255
    80003de4:	00500793          	li	a5,5
    80003de8:	fc97f0e3          	bgeu	a5,s1,80003da8 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    80003dec:	00005517          	auipc	a0,0x5
    80003df0:	52450513          	addi	a0,a0,1316 # 80009310 <CONSOLE_STATUS+0x300>
    80003df4:	00002097          	auipc	ra,0x2
    80003df8:	c24080e7          	jalr	-988(ra) # 80005a18 <_Z11printStringPKc>
    finishedC = true;
    80003dfc:	00100793          	li	a5,1
    80003e00:	00008717          	auipc	a4,0x8
    80003e04:	e0f70523          	sb	a5,-502(a4) # 8000bc0a <_ZL9finishedC>
    thread_dispatch();
    80003e08:	ffffd097          	auipc	ra,0xffffd
    80003e0c:	620080e7          	jalr	1568(ra) # 80001428 <_Z15thread_dispatchv>
}
    80003e10:	01813083          	ld	ra,24(sp)
    80003e14:	01013403          	ld	s0,16(sp)
    80003e18:	00813483          	ld	s1,8(sp)
    80003e1c:	00013903          	ld	s2,0(sp)
    80003e20:	02010113          	addi	sp,sp,32
    80003e24:	00008067          	ret

0000000080003e28 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80003e28:	fe010113          	addi	sp,sp,-32
    80003e2c:	00113c23          	sd	ra,24(sp)
    80003e30:	00813823          	sd	s0,16(sp)
    80003e34:	00913423          	sd	s1,8(sp)
    80003e38:	01213023          	sd	s2,0(sp)
    80003e3c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80003e40:	00a00493          	li	s1,10
    80003e44:	0400006f          	j	80003e84 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003e48:	00005517          	auipc	a0,0x5
    80003e4c:	52050513          	addi	a0,a0,1312 # 80009368 <CONSOLE_STATUS+0x358>
    80003e50:	00002097          	auipc	ra,0x2
    80003e54:	bc8080e7          	jalr	-1080(ra) # 80005a18 <_Z11printStringPKc>
    80003e58:	00000613          	li	a2,0
    80003e5c:	00a00593          	li	a1,10
    80003e60:	00048513          	mv	a0,s1
    80003e64:	00002097          	auipc	ra,0x2
    80003e68:	d64080e7          	jalr	-668(ra) # 80005bc8 <_Z8printIntiii>
    80003e6c:	00005517          	auipc	a0,0x5
    80003e70:	6fc50513          	addi	a0,a0,1788 # 80009568 <CONSOLE_STATUS+0x558>
    80003e74:	00002097          	auipc	ra,0x2
    80003e78:	ba4080e7          	jalr	-1116(ra) # 80005a18 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80003e7c:	0014849b          	addiw	s1,s1,1
    80003e80:	0ff4f493          	andi	s1,s1,255
    80003e84:	00c00793          	li	a5,12
    80003e88:	fc97f0e3          	bgeu	a5,s1,80003e48 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80003e8c:	00005517          	auipc	a0,0x5
    80003e90:	4e450513          	addi	a0,a0,1252 # 80009370 <CONSOLE_STATUS+0x360>
    80003e94:	00002097          	auipc	ra,0x2
    80003e98:	b84080e7          	jalr	-1148(ra) # 80005a18 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80003e9c:	00500313          	li	t1,5
    thread_dispatch();
    80003ea0:	ffffd097          	auipc	ra,0xffffd
    80003ea4:	588080e7          	jalr	1416(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80003ea8:	01000513          	li	a0,16
    80003eac:	00000097          	auipc	ra,0x0
    80003eb0:	be8080e7          	jalr	-1048(ra) # 80003a94 <_ZL9fibonaccim>
    80003eb4:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80003eb8:	00005517          	auipc	a0,0x5
    80003ebc:	4c850513          	addi	a0,a0,1224 # 80009380 <CONSOLE_STATUS+0x370>
    80003ec0:	00002097          	auipc	ra,0x2
    80003ec4:	b58080e7          	jalr	-1192(ra) # 80005a18 <_Z11printStringPKc>
    80003ec8:	00000613          	li	a2,0
    80003ecc:	00a00593          	li	a1,10
    80003ed0:	0009051b          	sext.w	a0,s2
    80003ed4:	00002097          	auipc	ra,0x2
    80003ed8:	cf4080e7          	jalr	-780(ra) # 80005bc8 <_Z8printIntiii>
    80003edc:	00005517          	auipc	a0,0x5
    80003ee0:	68c50513          	addi	a0,a0,1676 # 80009568 <CONSOLE_STATUS+0x558>
    80003ee4:	00002097          	auipc	ra,0x2
    80003ee8:	b34080e7          	jalr	-1228(ra) # 80005a18 <_Z11printStringPKc>
    80003eec:	0400006f          	j	80003f2c <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003ef0:	00005517          	auipc	a0,0x5
    80003ef4:	47850513          	addi	a0,a0,1144 # 80009368 <CONSOLE_STATUS+0x358>
    80003ef8:	00002097          	auipc	ra,0x2
    80003efc:	b20080e7          	jalr	-1248(ra) # 80005a18 <_Z11printStringPKc>
    80003f00:	00000613          	li	a2,0
    80003f04:	00a00593          	li	a1,10
    80003f08:	00048513          	mv	a0,s1
    80003f0c:	00002097          	auipc	ra,0x2
    80003f10:	cbc080e7          	jalr	-836(ra) # 80005bc8 <_Z8printIntiii>
    80003f14:	00005517          	auipc	a0,0x5
    80003f18:	65450513          	addi	a0,a0,1620 # 80009568 <CONSOLE_STATUS+0x558>
    80003f1c:	00002097          	auipc	ra,0x2
    80003f20:	afc080e7          	jalr	-1284(ra) # 80005a18 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80003f24:	0014849b          	addiw	s1,s1,1
    80003f28:	0ff4f493          	andi	s1,s1,255
    80003f2c:	00f00793          	li	a5,15
    80003f30:	fc97f0e3          	bgeu	a5,s1,80003ef0 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80003f34:	00005517          	auipc	a0,0x5
    80003f38:	45c50513          	addi	a0,a0,1116 # 80009390 <CONSOLE_STATUS+0x380>
    80003f3c:	00002097          	auipc	ra,0x2
    80003f40:	adc080e7          	jalr	-1316(ra) # 80005a18 <_Z11printStringPKc>
    finishedD = true;
    80003f44:	00100793          	li	a5,1
    80003f48:	00008717          	auipc	a4,0x8
    80003f4c:	ccf701a3          	sb	a5,-829(a4) # 8000bc0b <_ZL9finishedD>
    thread_dispatch();
    80003f50:	ffffd097          	auipc	ra,0xffffd
    80003f54:	4d8080e7          	jalr	1240(ra) # 80001428 <_Z15thread_dispatchv>
}
    80003f58:	01813083          	ld	ra,24(sp)
    80003f5c:	01013403          	ld	s0,16(sp)
    80003f60:	00813483          	ld	s1,8(sp)
    80003f64:	00013903          	ld	s2,0(sp)
    80003f68:	02010113          	addi	sp,sp,32
    80003f6c:	00008067          	ret

0000000080003f70 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80003f70:	fc010113          	addi	sp,sp,-64
    80003f74:	02113c23          	sd	ra,56(sp)
    80003f78:	02813823          	sd	s0,48(sp)
    80003f7c:	02913423          	sd	s1,40(sp)
    80003f80:	03213023          	sd	s2,32(sp)
    80003f84:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80003f88:	02000513          	li	a0,32
    80003f8c:	ffffe097          	auipc	ra,0xffffe
    80003f90:	6c8080e7          	jalr	1736(ra) # 80002654 <_Znwm>
    80003f94:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80003f98:	fffff097          	auipc	ra,0xfffff
    80003f9c:	934080e7          	jalr	-1740(ra) # 800028cc <_ZN6ThreadC1Ev>
    80003fa0:	00008797          	auipc	a5,0x8
    80003fa4:	92078793          	addi	a5,a5,-1760 # 8000b8c0 <_ZTV7WorkerA+0x10>
    80003fa8:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80003fac:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80003fb0:	00005517          	auipc	a0,0x5
    80003fb4:	3f050513          	addi	a0,a0,1008 # 800093a0 <CONSOLE_STATUS+0x390>
    80003fb8:	00002097          	auipc	ra,0x2
    80003fbc:	a60080e7          	jalr	-1440(ra) # 80005a18 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80003fc0:	02000513          	li	a0,32
    80003fc4:	ffffe097          	auipc	ra,0xffffe
    80003fc8:	690080e7          	jalr	1680(ra) # 80002654 <_Znwm>
    80003fcc:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80003fd0:	fffff097          	auipc	ra,0xfffff
    80003fd4:	8fc080e7          	jalr	-1796(ra) # 800028cc <_ZN6ThreadC1Ev>
    80003fd8:	00008797          	auipc	a5,0x8
    80003fdc:	91078793          	addi	a5,a5,-1776 # 8000b8e8 <_ZTV7WorkerB+0x10>
    80003fe0:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80003fe4:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80003fe8:	00005517          	auipc	a0,0x5
    80003fec:	3d050513          	addi	a0,a0,976 # 800093b8 <CONSOLE_STATUS+0x3a8>
    80003ff0:	00002097          	auipc	ra,0x2
    80003ff4:	a28080e7          	jalr	-1496(ra) # 80005a18 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80003ff8:	02000513          	li	a0,32
    80003ffc:	ffffe097          	auipc	ra,0xffffe
    80004000:	658080e7          	jalr	1624(ra) # 80002654 <_Znwm>
    80004004:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80004008:	fffff097          	auipc	ra,0xfffff
    8000400c:	8c4080e7          	jalr	-1852(ra) # 800028cc <_ZN6ThreadC1Ev>
    80004010:	00008797          	auipc	a5,0x8
    80004014:	90078793          	addi	a5,a5,-1792 # 8000b910 <_ZTV7WorkerC+0x10>
    80004018:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    8000401c:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80004020:	00005517          	auipc	a0,0x5
    80004024:	3b050513          	addi	a0,a0,944 # 800093d0 <CONSOLE_STATUS+0x3c0>
    80004028:	00002097          	auipc	ra,0x2
    8000402c:	9f0080e7          	jalr	-1552(ra) # 80005a18 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80004030:	02000513          	li	a0,32
    80004034:	ffffe097          	auipc	ra,0xffffe
    80004038:	620080e7          	jalr	1568(ra) # 80002654 <_Znwm>
    8000403c:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80004040:	fffff097          	auipc	ra,0xfffff
    80004044:	88c080e7          	jalr	-1908(ra) # 800028cc <_ZN6ThreadC1Ev>
    80004048:	00008797          	auipc	a5,0x8
    8000404c:	8f078793          	addi	a5,a5,-1808 # 8000b938 <_ZTV7WorkerD+0x10>
    80004050:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80004054:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80004058:	00005517          	auipc	a0,0x5
    8000405c:	39050513          	addi	a0,a0,912 # 800093e8 <CONSOLE_STATUS+0x3d8>
    80004060:	00002097          	auipc	ra,0x2
    80004064:	9b8080e7          	jalr	-1608(ra) # 80005a18 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80004068:	00000493          	li	s1,0
    8000406c:	00300793          	li	a5,3
    80004070:	0297c663          	blt	a5,s1,8000409c <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80004074:	00349793          	slli	a5,s1,0x3
    80004078:	fe040713          	addi	a4,s0,-32
    8000407c:	00f707b3          	add	a5,a4,a5
    80004080:	fe07b503          	ld	a0,-32(a5)
    80004084:	ffffe097          	auipc	ra,0xffffe
    80004088:	780080e7          	jalr	1920(ra) # 80002804 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    8000408c:	0014849b          	addiw	s1,s1,1
    80004090:	fddff06f          	j	8000406c <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80004094:	ffffe097          	auipc	ra,0xffffe
    80004098:	7d4080e7          	jalr	2004(ra) # 80002868 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    8000409c:	00008797          	auipc	a5,0x8
    800040a0:	b6c7c783          	lbu	a5,-1172(a5) # 8000bc08 <_ZL9finishedA>
    800040a4:	fe0788e3          	beqz	a5,80004094 <_Z20Threads_CPP_API_testv+0x124>
    800040a8:	00008797          	auipc	a5,0x8
    800040ac:	b617c783          	lbu	a5,-1183(a5) # 8000bc09 <_ZL9finishedB>
    800040b0:	fe0782e3          	beqz	a5,80004094 <_Z20Threads_CPP_API_testv+0x124>
    800040b4:	00008797          	auipc	a5,0x8
    800040b8:	b567c783          	lbu	a5,-1194(a5) # 8000bc0a <_ZL9finishedC>
    800040bc:	fc078ce3          	beqz	a5,80004094 <_Z20Threads_CPP_API_testv+0x124>
    800040c0:	00008797          	auipc	a5,0x8
    800040c4:	b4b7c783          	lbu	a5,-1205(a5) # 8000bc0b <_ZL9finishedD>
    800040c8:	fc0786e3          	beqz	a5,80004094 <_Z20Threads_CPP_API_testv+0x124>
    800040cc:	fc040493          	addi	s1,s0,-64
    800040d0:	0080006f          	j	800040d8 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    800040d4:	00848493          	addi	s1,s1,8
    800040d8:	fe040793          	addi	a5,s0,-32
    800040dc:	08f48663          	beq	s1,a5,80004168 <_Z20Threads_CPP_API_testv+0x1f8>
    800040e0:	0004b503          	ld	a0,0(s1)
    800040e4:	fe0508e3          	beqz	a0,800040d4 <_Z20Threads_CPP_API_testv+0x164>
    800040e8:	00053783          	ld	a5,0(a0)
    800040ec:	0087b783          	ld	a5,8(a5)
    800040f0:	000780e7          	jalr	a5
    800040f4:	fe1ff06f          	j	800040d4 <_Z20Threads_CPP_API_testv+0x164>
    800040f8:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    800040fc:	00048513          	mv	a0,s1
    80004100:	ffffe097          	auipc	ra,0xffffe
    80004104:	5a4080e7          	jalr	1444(ra) # 800026a4 <_ZdlPv>
    80004108:	00090513          	mv	a0,s2
    8000410c:	00009097          	auipc	ra,0x9
    80004110:	c0c080e7          	jalr	-1012(ra) # 8000cd18 <_Unwind_Resume>
    80004114:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80004118:	00048513          	mv	a0,s1
    8000411c:	ffffe097          	auipc	ra,0xffffe
    80004120:	588080e7          	jalr	1416(ra) # 800026a4 <_ZdlPv>
    80004124:	00090513          	mv	a0,s2
    80004128:	00009097          	auipc	ra,0x9
    8000412c:	bf0080e7          	jalr	-1040(ra) # 8000cd18 <_Unwind_Resume>
    80004130:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80004134:	00048513          	mv	a0,s1
    80004138:	ffffe097          	auipc	ra,0xffffe
    8000413c:	56c080e7          	jalr	1388(ra) # 800026a4 <_ZdlPv>
    80004140:	00090513          	mv	a0,s2
    80004144:	00009097          	auipc	ra,0x9
    80004148:	bd4080e7          	jalr	-1068(ra) # 8000cd18 <_Unwind_Resume>
    8000414c:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80004150:	00048513          	mv	a0,s1
    80004154:	ffffe097          	auipc	ra,0xffffe
    80004158:	550080e7          	jalr	1360(ra) # 800026a4 <_ZdlPv>
    8000415c:	00090513          	mv	a0,s2
    80004160:	00009097          	auipc	ra,0x9
    80004164:	bb8080e7          	jalr	-1096(ra) # 8000cd18 <_Unwind_Resume>
}
    80004168:	03813083          	ld	ra,56(sp)
    8000416c:	03013403          	ld	s0,48(sp)
    80004170:	02813483          	ld	s1,40(sp)
    80004174:	02013903          	ld	s2,32(sp)
    80004178:	04010113          	addi	sp,sp,64
    8000417c:	00008067          	ret

0000000080004180 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80004180:	ff010113          	addi	sp,sp,-16
    80004184:	00113423          	sd	ra,8(sp)
    80004188:	00813023          	sd	s0,0(sp)
    8000418c:	01010413          	addi	s0,sp,16
    80004190:	00007797          	auipc	a5,0x7
    80004194:	73078793          	addi	a5,a5,1840 # 8000b8c0 <_ZTV7WorkerA+0x10>
    80004198:	00f53023          	sd	a5,0(a0)
    8000419c:	ffffe097          	auipc	ra,0xffffe
    800041a0:	40c080e7          	jalr	1036(ra) # 800025a8 <_ZN6ThreadD1Ev>
    800041a4:	00813083          	ld	ra,8(sp)
    800041a8:	00013403          	ld	s0,0(sp)
    800041ac:	01010113          	addi	sp,sp,16
    800041b0:	00008067          	ret

00000000800041b4 <_ZN7WorkerAD0Ev>:
    800041b4:	fe010113          	addi	sp,sp,-32
    800041b8:	00113c23          	sd	ra,24(sp)
    800041bc:	00813823          	sd	s0,16(sp)
    800041c0:	00913423          	sd	s1,8(sp)
    800041c4:	02010413          	addi	s0,sp,32
    800041c8:	00050493          	mv	s1,a0
    800041cc:	00007797          	auipc	a5,0x7
    800041d0:	6f478793          	addi	a5,a5,1780 # 8000b8c0 <_ZTV7WorkerA+0x10>
    800041d4:	00f53023          	sd	a5,0(a0)
    800041d8:	ffffe097          	auipc	ra,0xffffe
    800041dc:	3d0080e7          	jalr	976(ra) # 800025a8 <_ZN6ThreadD1Ev>
    800041e0:	00048513          	mv	a0,s1
    800041e4:	ffffe097          	auipc	ra,0xffffe
    800041e8:	4c0080e7          	jalr	1216(ra) # 800026a4 <_ZdlPv>
    800041ec:	01813083          	ld	ra,24(sp)
    800041f0:	01013403          	ld	s0,16(sp)
    800041f4:	00813483          	ld	s1,8(sp)
    800041f8:	02010113          	addi	sp,sp,32
    800041fc:	00008067          	ret

0000000080004200 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80004200:	ff010113          	addi	sp,sp,-16
    80004204:	00113423          	sd	ra,8(sp)
    80004208:	00813023          	sd	s0,0(sp)
    8000420c:	01010413          	addi	s0,sp,16
    80004210:	00007797          	auipc	a5,0x7
    80004214:	6d878793          	addi	a5,a5,1752 # 8000b8e8 <_ZTV7WorkerB+0x10>
    80004218:	00f53023          	sd	a5,0(a0)
    8000421c:	ffffe097          	auipc	ra,0xffffe
    80004220:	38c080e7          	jalr	908(ra) # 800025a8 <_ZN6ThreadD1Ev>
    80004224:	00813083          	ld	ra,8(sp)
    80004228:	00013403          	ld	s0,0(sp)
    8000422c:	01010113          	addi	sp,sp,16
    80004230:	00008067          	ret

0000000080004234 <_ZN7WorkerBD0Ev>:
    80004234:	fe010113          	addi	sp,sp,-32
    80004238:	00113c23          	sd	ra,24(sp)
    8000423c:	00813823          	sd	s0,16(sp)
    80004240:	00913423          	sd	s1,8(sp)
    80004244:	02010413          	addi	s0,sp,32
    80004248:	00050493          	mv	s1,a0
    8000424c:	00007797          	auipc	a5,0x7
    80004250:	69c78793          	addi	a5,a5,1692 # 8000b8e8 <_ZTV7WorkerB+0x10>
    80004254:	00f53023          	sd	a5,0(a0)
    80004258:	ffffe097          	auipc	ra,0xffffe
    8000425c:	350080e7          	jalr	848(ra) # 800025a8 <_ZN6ThreadD1Ev>
    80004260:	00048513          	mv	a0,s1
    80004264:	ffffe097          	auipc	ra,0xffffe
    80004268:	440080e7          	jalr	1088(ra) # 800026a4 <_ZdlPv>
    8000426c:	01813083          	ld	ra,24(sp)
    80004270:	01013403          	ld	s0,16(sp)
    80004274:	00813483          	ld	s1,8(sp)
    80004278:	02010113          	addi	sp,sp,32
    8000427c:	00008067          	ret

0000000080004280 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80004280:	ff010113          	addi	sp,sp,-16
    80004284:	00113423          	sd	ra,8(sp)
    80004288:	00813023          	sd	s0,0(sp)
    8000428c:	01010413          	addi	s0,sp,16
    80004290:	00007797          	auipc	a5,0x7
    80004294:	68078793          	addi	a5,a5,1664 # 8000b910 <_ZTV7WorkerC+0x10>
    80004298:	00f53023          	sd	a5,0(a0)
    8000429c:	ffffe097          	auipc	ra,0xffffe
    800042a0:	30c080e7          	jalr	780(ra) # 800025a8 <_ZN6ThreadD1Ev>
    800042a4:	00813083          	ld	ra,8(sp)
    800042a8:	00013403          	ld	s0,0(sp)
    800042ac:	01010113          	addi	sp,sp,16
    800042b0:	00008067          	ret

00000000800042b4 <_ZN7WorkerCD0Ev>:
    800042b4:	fe010113          	addi	sp,sp,-32
    800042b8:	00113c23          	sd	ra,24(sp)
    800042bc:	00813823          	sd	s0,16(sp)
    800042c0:	00913423          	sd	s1,8(sp)
    800042c4:	02010413          	addi	s0,sp,32
    800042c8:	00050493          	mv	s1,a0
    800042cc:	00007797          	auipc	a5,0x7
    800042d0:	64478793          	addi	a5,a5,1604 # 8000b910 <_ZTV7WorkerC+0x10>
    800042d4:	00f53023          	sd	a5,0(a0)
    800042d8:	ffffe097          	auipc	ra,0xffffe
    800042dc:	2d0080e7          	jalr	720(ra) # 800025a8 <_ZN6ThreadD1Ev>
    800042e0:	00048513          	mv	a0,s1
    800042e4:	ffffe097          	auipc	ra,0xffffe
    800042e8:	3c0080e7          	jalr	960(ra) # 800026a4 <_ZdlPv>
    800042ec:	01813083          	ld	ra,24(sp)
    800042f0:	01013403          	ld	s0,16(sp)
    800042f4:	00813483          	ld	s1,8(sp)
    800042f8:	02010113          	addi	sp,sp,32
    800042fc:	00008067          	ret

0000000080004300 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80004300:	ff010113          	addi	sp,sp,-16
    80004304:	00113423          	sd	ra,8(sp)
    80004308:	00813023          	sd	s0,0(sp)
    8000430c:	01010413          	addi	s0,sp,16
    80004310:	00007797          	auipc	a5,0x7
    80004314:	62878793          	addi	a5,a5,1576 # 8000b938 <_ZTV7WorkerD+0x10>
    80004318:	00f53023          	sd	a5,0(a0)
    8000431c:	ffffe097          	auipc	ra,0xffffe
    80004320:	28c080e7          	jalr	652(ra) # 800025a8 <_ZN6ThreadD1Ev>
    80004324:	00813083          	ld	ra,8(sp)
    80004328:	00013403          	ld	s0,0(sp)
    8000432c:	01010113          	addi	sp,sp,16
    80004330:	00008067          	ret

0000000080004334 <_ZN7WorkerDD0Ev>:
    80004334:	fe010113          	addi	sp,sp,-32
    80004338:	00113c23          	sd	ra,24(sp)
    8000433c:	00813823          	sd	s0,16(sp)
    80004340:	00913423          	sd	s1,8(sp)
    80004344:	02010413          	addi	s0,sp,32
    80004348:	00050493          	mv	s1,a0
    8000434c:	00007797          	auipc	a5,0x7
    80004350:	5ec78793          	addi	a5,a5,1516 # 8000b938 <_ZTV7WorkerD+0x10>
    80004354:	00f53023          	sd	a5,0(a0)
    80004358:	ffffe097          	auipc	ra,0xffffe
    8000435c:	250080e7          	jalr	592(ra) # 800025a8 <_ZN6ThreadD1Ev>
    80004360:	00048513          	mv	a0,s1
    80004364:	ffffe097          	auipc	ra,0xffffe
    80004368:	340080e7          	jalr	832(ra) # 800026a4 <_ZdlPv>
    8000436c:	01813083          	ld	ra,24(sp)
    80004370:	01013403          	ld	s0,16(sp)
    80004374:	00813483          	ld	s1,8(sp)
    80004378:	02010113          	addi	sp,sp,32
    8000437c:	00008067          	ret

0000000080004380 <_ZN7WorkerA3runEv>:
    void run() override {
    80004380:	ff010113          	addi	sp,sp,-16
    80004384:	00113423          	sd	ra,8(sp)
    80004388:	00813023          	sd	s0,0(sp)
    8000438c:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80004390:	00000593          	li	a1,0
    80004394:	fffff097          	auipc	ra,0xfffff
    80004398:	774080e7          	jalr	1908(ra) # 80003b08 <_ZN7WorkerA11workerBodyAEPv>
    }
    8000439c:	00813083          	ld	ra,8(sp)
    800043a0:	00013403          	ld	s0,0(sp)
    800043a4:	01010113          	addi	sp,sp,16
    800043a8:	00008067          	ret

00000000800043ac <_ZN7WorkerB3runEv>:
    void run() override {
    800043ac:	ff010113          	addi	sp,sp,-16
    800043b0:	00113423          	sd	ra,8(sp)
    800043b4:	00813023          	sd	s0,0(sp)
    800043b8:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    800043bc:	00000593          	li	a1,0
    800043c0:	00000097          	auipc	ra,0x0
    800043c4:	814080e7          	jalr	-2028(ra) # 80003bd4 <_ZN7WorkerB11workerBodyBEPv>
    }
    800043c8:	00813083          	ld	ra,8(sp)
    800043cc:	00013403          	ld	s0,0(sp)
    800043d0:	01010113          	addi	sp,sp,16
    800043d4:	00008067          	ret

00000000800043d8 <_ZN7WorkerC3runEv>:
    void run() override {
    800043d8:	ff010113          	addi	sp,sp,-16
    800043dc:	00113423          	sd	ra,8(sp)
    800043e0:	00813023          	sd	s0,0(sp)
    800043e4:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    800043e8:	00000593          	li	a1,0
    800043ec:	00000097          	auipc	ra,0x0
    800043f0:	8bc080e7          	jalr	-1860(ra) # 80003ca8 <_ZN7WorkerC11workerBodyCEPv>
    }
    800043f4:	00813083          	ld	ra,8(sp)
    800043f8:	00013403          	ld	s0,0(sp)
    800043fc:	01010113          	addi	sp,sp,16
    80004400:	00008067          	ret

0000000080004404 <_ZN7WorkerD3runEv>:
    void run() override {
    80004404:	ff010113          	addi	sp,sp,-16
    80004408:	00113423          	sd	ra,8(sp)
    8000440c:	00813023          	sd	s0,0(sp)
    80004410:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80004414:	00000593          	li	a1,0
    80004418:	00000097          	auipc	ra,0x0
    8000441c:	a10080e7          	jalr	-1520(ra) # 80003e28 <_ZN7WorkerD11workerBodyDEPv>
    }
    80004420:	00813083          	ld	ra,8(sp)
    80004424:	00013403          	ld	s0,0(sp)
    80004428:	01010113          	addi	sp,sp,16
    8000442c:	00008067          	ret

0000000080004430 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    80004430:	f8010113          	addi	sp,sp,-128
    80004434:	06113c23          	sd	ra,120(sp)
    80004438:	06813823          	sd	s0,112(sp)
    8000443c:	06913423          	sd	s1,104(sp)
    80004440:	07213023          	sd	s2,96(sp)
    80004444:	05313c23          	sd	s3,88(sp)
    80004448:	05413823          	sd	s4,80(sp)
    8000444c:	05513423          	sd	s5,72(sp)
    80004450:	05613023          	sd	s6,64(sp)
    80004454:	03713c23          	sd	s7,56(sp)
    80004458:	03813823          	sd	s8,48(sp)
    8000445c:	03913423          	sd	s9,40(sp)
    80004460:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    80004464:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    80004468:	00005517          	auipc	a0,0x5
    8000446c:	db850513          	addi	a0,a0,-584 # 80009220 <CONSOLE_STATUS+0x210>
    80004470:	00001097          	auipc	ra,0x1
    80004474:	5a8080e7          	jalr	1448(ra) # 80005a18 <_Z11printStringPKc>
    getString(input, 30);
    80004478:	01e00593          	li	a1,30
    8000447c:	f8040493          	addi	s1,s0,-128
    80004480:	00048513          	mv	a0,s1
    80004484:	00001097          	auipc	ra,0x1
    80004488:	61c080e7          	jalr	1564(ra) # 80005aa0 <_Z9getStringPci>
    threadNum = stringToInt(input);
    8000448c:	00048513          	mv	a0,s1
    80004490:	00001097          	auipc	ra,0x1
    80004494:	6e8080e7          	jalr	1768(ra) # 80005b78 <_Z11stringToIntPKc>
    80004498:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    8000449c:	00005517          	auipc	a0,0x5
    800044a0:	da450513          	addi	a0,a0,-604 # 80009240 <CONSOLE_STATUS+0x230>
    800044a4:	00001097          	auipc	ra,0x1
    800044a8:	574080e7          	jalr	1396(ra) # 80005a18 <_Z11printStringPKc>
    getString(input, 30);
    800044ac:	01e00593          	li	a1,30
    800044b0:	00048513          	mv	a0,s1
    800044b4:	00001097          	auipc	ra,0x1
    800044b8:	5ec080e7          	jalr	1516(ra) # 80005aa0 <_Z9getStringPci>
    n = stringToInt(input);
    800044bc:	00048513          	mv	a0,s1
    800044c0:	00001097          	auipc	ra,0x1
    800044c4:	6b8080e7          	jalr	1720(ra) # 80005b78 <_Z11stringToIntPKc>
    800044c8:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    800044cc:	00005517          	auipc	a0,0x5
    800044d0:	d9450513          	addi	a0,a0,-620 # 80009260 <CONSOLE_STATUS+0x250>
    800044d4:	00001097          	auipc	ra,0x1
    800044d8:	544080e7          	jalr	1348(ra) # 80005a18 <_Z11printStringPKc>
    printInt(threadNum);
    800044dc:	00000613          	li	a2,0
    800044e0:	00a00593          	li	a1,10
    800044e4:	00098513          	mv	a0,s3
    800044e8:	00001097          	auipc	ra,0x1
    800044ec:	6e0080e7          	jalr	1760(ra) # 80005bc8 <_Z8printIntiii>
    printString(" i velicina bafera ");
    800044f0:	00005517          	auipc	a0,0x5
    800044f4:	d8850513          	addi	a0,a0,-632 # 80009278 <CONSOLE_STATUS+0x268>
    800044f8:	00001097          	auipc	ra,0x1
    800044fc:	520080e7          	jalr	1312(ra) # 80005a18 <_Z11printStringPKc>
    printInt(n);
    80004500:	00000613          	li	a2,0
    80004504:	00a00593          	li	a1,10
    80004508:	00048513          	mv	a0,s1
    8000450c:	00001097          	auipc	ra,0x1
    80004510:	6bc080e7          	jalr	1724(ra) # 80005bc8 <_Z8printIntiii>
    printString(".\n");
    80004514:	00005517          	auipc	a0,0x5
    80004518:	d7c50513          	addi	a0,a0,-644 # 80009290 <CONSOLE_STATUS+0x280>
    8000451c:	00001097          	auipc	ra,0x1
    80004520:	4fc080e7          	jalr	1276(ra) # 80005a18 <_Z11printStringPKc>
    if (threadNum > n) {
    80004524:	0334c463          	blt	s1,s3,8000454c <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    80004528:	03305c63          	blez	s3,80004560 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    8000452c:	03800513          	li	a0,56
    80004530:	ffffe097          	auipc	ra,0xffffe
    80004534:	124080e7          	jalr	292(ra) # 80002654 <_Znwm>
    80004538:	00050a93          	mv	s5,a0
    8000453c:	00048593          	mv	a1,s1
    80004540:	00001097          	auipc	ra,0x1
    80004544:	7a8080e7          	jalr	1960(ra) # 80005ce8 <_ZN9BufferCPPC1Ei>
    80004548:	0300006f          	j	80004578 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    8000454c:	00005517          	auipc	a0,0x5
    80004550:	d4c50513          	addi	a0,a0,-692 # 80009298 <CONSOLE_STATUS+0x288>
    80004554:	00001097          	auipc	ra,0x1
    80004558:	4c4080e7          	jalr	1220(ra) # 80005a18 <_Z11printStringPKc>
        return;
    8000455c:	0140006f          	j	80004570 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80004560:	00005517          	auipc	a0,0x5
    80004564:	d7850513          	addi	a0,a0,-648 # 800092d8 <CONSOLE_STATUS+0x2c8>
    80004568:	00001097          	auipc	ra,0x1
    8000456c:	4b0080e7          	jalr	1200(ra) # 80005a18 <_Z11printStringPKc>
        return;
    80004570:	000c0113          	mv	sp,s8
    80004574:	2140006f          	j	80004788 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    80004578:	01000513          	li	a0,16
    8000457c:	ffffe097          	auipc	ra,0xffffe
    80004580:	0d8080e7          	jalr	216(ra) # 80002654 <_Znwm>
    80004584:	00050913          	mv	s2,a0
    80004588:	00000593          	li	a1,0
    8000458c:	ffffe097          	auipc	ra,0xffffe
    80004590:	3bc080e7          	jalr	956(ra) # 80002948 <_ZN9SemaphoreC1Ej>
    80004594:	00007797          	auipc	a5,0x7
    80004598:	6927b223          	sd	s2,1668(a5) # 8000bc18 <_ZL10waitForAll>
    Thread *producers[threadNum];
    8000459c:	00399793          	slli	a5,s3,0x3
    800045a0:	00f78793          	addi	a5,a5,15
    800045a4:	ff07f793          	andi	a5,a5,-16
    800045a8:	40f10133          	sub	sp,sp,a5
    800045ac:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    800045b0:	0019871b          	addiw	a4,s3,1
    800045b4:	00171793          	slli	a5,a4,0x1
    800045b8:	00e787b3          	add	a5,a5,a4
    800045bc:	00379793          	slli	a5,a5,0x3
    800045c0:	00f78793          	addi	a5,a5,15
    800045c4:	ff07f793          	andi	a5,a5,-16
    800045c8:	40f10133          	sub	sp,sp,a5
    800045cc:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    800045d0:	00199493          	slli	s1,s3,0x1
    800045d4:	013484b3          	add	s1,s1,s3
    800045d8:	00349493          	slli	s1,s1,0x3
    800045dc:	009b04b3          	add	s1,s6,s1
    800045e0:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    800045e4:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    800045e8:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    800045ec:	02800513          	li	a0,40
    800045f0:	ffffe097          	auipc	ra,0xffffe
    800045f4:	064080e7          	jalr	100(ra) # 80002654 <_Znwm>
    800045f8:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    800045fc:	ffffe097          	auipc	ra,0xffffe
    80004600:	2d0080e7          	jalr	720(ra) # 800028cc <_ZN6ThreadC1Ev>
    80004604:	00007797          	auipc	a5,0x7
    80004608:	3ac78793          	addi	a5,a5,940 # 8000b9b0 <_ZTV8Consumer+0x10>
    8000460c:	00fbb023          	sd	a5,0(s7)
    80004610:	029bb023          	sd	s1,32(s7)
    consumer->start();
    80004614:	000b8513          	mv	a0,s7
    80004618:	ffffe097          	auipc	ra,0xffffe
    8000461c:	1ec080e7          	jalr	492(ra) # 80002804 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    80004620:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    80004624:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    80004628:	00007797          	auipc	a5,0x7
    8000462c:	5f07b783          	ld	a5,1520(a5) # 8000bc18 <_ZL10waitForAll>
    80004630:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004634:	02800513          	li	a0,40
    80004638:	ffffe097          	auipc	ra,0xffffe
    8000463c:	01c080e7          	jalr	28(ra) # 80002654 <_Znwm>
    80004640:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80004644:	ffffe097          	auipc	ra,0xffffe
    80004648:	288080e7          	jalr	648(ra) # 800028cc <_ZN6ThreadC1Ev>
    8000464c:	00007797          	auipc	a5,0x7
    80004650:	31478793          	addi	a5,a5,788 # 8000b960 <_ZTV16ProducerKeyborad+0x10>
    80004654:	00f4b023          	sd	a5,0(s1)
    80004658:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    8000465c:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80004660:	00048513          	mv	a0,s1
    80004664:	ffffe097          	auipc	ra,0xffffe
    80004668:	1a0080e7          	jalr	416(ra) # 80002804 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    8000466c:	00100913          	li	s2,1
    80004670:	0300006f          	j	800046a0 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004674:	00007797          	auipc	a5,0x7
    80004678:	31478793          	addi	a5,a5,788 # 8000b988 <_ZTV8Producer+0x10>
    8000467c:	00fcb023          	sd	a5,0(s9)
    80004680:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    80004684:	00391793          	slli	a5,s2,0x3
    80004688:	00fa07b3          	add	a5,s4,a5
    8000468c:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80004690:	000c8513          	mv	a0,s9
    80004694:	ffffe097          	auipc	ra,0xffffe
    80004698:	170080e7          	jalr	368(ra) # 80002804 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    8000469c:	0019091b          	addiw	s2,s2,1
    800046a0:	05395263          	bge	s2,s3,800046e4 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    800046a4:	00191493          	slli	s1,s2,0x1
    800046a8:	012484b3          	add	s1,s1,s2
    800046ac:	00349493          	slli	s1,s1,0x3
    800046b0:	009b04b3          	add	s1,s6,s1
    800046b4:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    800046b8:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    800046bc:	00007797          	auipc	a5,0x7
    800046c0:	55c7b783          	ld	a5,1372(a5) # 8000bc18 <_ZL10waitForAll>
    800046c4:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    800046c8:	02800513          	li	a0,40
    800046cc:	ffffe097          	auipc	ra,0xffffe
    800046d0:	f88080e7          	jalr	-120(ra) # 80002654 <_Znwm>
    800046d4:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    800046d8:	ffffe097          	auipc	ra,0xffffe
    800046dc:	1f4080e7          	jalr	500(ra) # 800028cc <_ZN6ThreadC1Ev>
    800046e0:	f95ff06f          	j	80004674 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    800046e4:	ffffe097          	auipc	ra,0xffffe
    800046e8:	184080e7          	jalr	388(ra) # 80002868 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    800046ec:	00000493          	li	s1,0
    800046f0:	0099ce63          	blt	s3,s1,8000470c <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    800046f4:	00007517          	auipc	a0,0x7
    800046f8:	52453503          	ld	a0,1316(a0) # 8000bc18 <_ZL10waitForAll>
    800046fc:	ffffe097          	auipc	ra,0xffffe
    80004700:	284080e7          	jalr	644(ra) # 80002980 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80004704:	0014849b          	addiw	s1,s1,1
    80004708:	fe9ff06f          	j	800046f0 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    8000470c:	00007517          	auipc	a0,0x7
    80004710:	50c53503          	ld	a0,1292(a0) # 8000bc18 <_ZL10waitForAll>
    80004714:	00050863          	beqz	a0,80004724 <_Z20testConsumerProducerv+0x2f4>
    80004718:	00053783          	ld	a5,0(a0)
    8000471c:	0087b783          	ld	a5,8(a5)
    80004720:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    80004724:	00000493          	li	s1,0
    80004728:	0080006f          	j	80004730 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    8000472c:	0014849b          	addiw	s1,s1,1
    80004730:	0334d263          	bge	s1,s3,80004754 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    80004734:	00349793          	slli	a5,s1,0x3
    80004738:	00fa07b3          	add	a5,s4,a5
    8000473c:	0007b503          	ld	a0,0(a5)
    80004740:	fe0506e3          	beqz	a0,8000472c <_Z20testConsumerProducerv+0x2fc>
    80004744:	00053783          	ld	a5,0(a0)
    80004748:	0087b783          	ld	a5,8(a5)
    8000474c:	000780e7          	jalr	a5
    80004750:	fddff06f          	j	8000472c <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    80004754:	000b8a63          	beqz	s7,80004768 <_Z20testConsumerProducerv+0x338>
    80004758:	000bb783          	ld	a5,0(s7)
    8000475c:	0087b783          	ld	a5,8(a5)
    80004760:	000b8513          	mv	a0,s7
    80004764:	000780e7          	jalr	a5
    delete buffer;
    80004768:	000a8e63          	beqz	s5,80004784 <_Z20testConsumerProducerv+0x354>
    8000476c:	000a8513          	mv	a0,s5
    80004770:	00002097          	auipc	ra,0x2
    80004774:	870080e7          	jalr	-1936(ra) # 80005fe0 <_ZN9BufferCPPD1Ev>
    80004778:	000a8513          	mv	a0,s5
    8000477c:	ffffe097          	auipc	ra,0xffffe
    80004780:	f28080e7          	jalr	-216(ra) # 800026a4 <_ZdlPv>
    80004784:	000c0113          	mv	sp,s8
}
    80004788:	f8040113          	addi	sp,s0,-128
    8000478c:	07813083          	ld	ra,120(sp)
    80004790:	07013403          	ld	s0,112(sp)
    80004794:	06813483          	ld	s1,104(sp)
    80004798:	06013903          	ld	s2,96(sp)
    8000479c:	05813983          	ld	s3,88(sp)
    800047a0:	05013a03          	ld	s4,80(sp)
    800047a4:	04813a83          	ld	s5,72(sp)
    800047a8:	04013b03          	ld	s6,64(sp)
    800047ac:	03813b83          	ld	s7,56(sp)
    800047b0:	03013c03          	ld	s8,48(sp)
    800047b4:	02813c83          	ld	s9,40(sp)
    800047b8:	08010113          	addi	sp,sp,128
    800047bc:	00008067          	ret
    800047c0:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    800047c4:	000a8513          	mv	a0,s5
    800047c8:	ffffe097          	auipc	ra,0xffffe
    800047cc:	edc080e7          	jalr	-292(ra) # 800026a4 <_ZdlPv>
    800047d0:	00048513          	mv	a0,s1
    800047d4:	00008097          	auipc	ra,0x8
    800047d8:	544080e7          	jalr	1348(ra) # 8000cd18 <_Unwind_Resume>
    800047dc:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    800047e0:	00090513          	mv	a0,s2
    800047e4:	ffffe097          	auipc	ra,0xffffe
    800047e8:	ec0080e7          	jalr	-320(ra) # 800026a4 <_ZdlPv>
    800047ec:	00048513          	mv	a0,s1
    800047f0:	00008097          	auipc	ra,0x8
    800047f4:	528080e7          	jalr	1320(ra) # 8000cd18 <_Unwind_Resume>
    800047f8:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    800047fc:	000b8513          	mv	a0,s7
    80004800:	ffffe097          	auipc	ra,0xffffe
    80004804:	ea4080e7          	jalr	-348(ra) # 800026a4 <_ZdlPv>
    80004808:	00048513          	mv	a0,s1
    8000480c:	00008097          	auipc	ra,0x8
    80004810:	50c080e7          	jalr	1292(ra) # 8000cd18 <_Unwind_Resume>
    80004814:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004818:	00048513          	mv	a0,s1
    8000481c:	ffffe097          	auipc	ra,0xffffe
    80004820:	e88080e7          	jalr	-376(ra) # 800026a4 <_ZdlPv>
    80004824:	00090513          	mv	a0,s2
    80004828:	00008097          	auipc	ra,0x8
    8000482c:	4f0080e7          	jalr	1264(ra) # 8000cd18 <_Unwind_Resume>
    80004830:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    80004834:	000c8513          	mv	a0,s9
    80004838:	ffffe097          	auipc	ra,0xffffe
    8000483c:	e6c080e7          	jalr	-404(ra) # 800026a4 <_ZdlPv>
    80004840:	00048513          	mv	a0,s1
    80004844:	00008097          	auipc	ra,0x8
    80004848:	4d4080e7          	jalr	1236(ra) # 8000cd18 <_Unwind_Resume>

000000008000484c <_ZN8Consumer3runEv>:
    void run() override {
    8000484c:	fd010113          	addi	sp,sp,-48
    80004850:	02113423          	sd	ra,40(sp)
    80004854:	02813023          	sd	s0,32(sp)
    80004858:	00913c23          	sd	s1,24(sp)
    8000485c:	01213823          	sd	s2,16(sp)
    80004860:	01313423          	sd	s3,8(sp)
    80004864:	03010413          	addi	s0,sp,48
    80004868:	00050913          	mv	s2,a0
        int i = 0;
    8000486c:	00000993          	li	s3,0
    80004870:	0100006f          	j	80004880 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    80004874:	00a00513          	li	a0,10
    80004878:	ffffe097          	auipc	ra,0xffffe
    8000487c:	1e0080e7          	jalr	480(ra) # 80002a58 <_ZN7Console4putcEc>
        while (!threadEnd) {
    80004880:	00007797          	auipc	a5,0x7
    80004884:	3907a783          	lw	a5,912(a5) # 8000bc10 <_ZL9threadEnd>
    80004888:	04079a63          	bnez	a5,800048dc <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    8000488c:	02093783          	ld	a5,32(s2)
    80004890:	0087b503          	ld	a0,8(a5)
    80004894:	00001097          	auipc	ra,0x1
    80004898:	638080e7          	jalr	1592(ra) # 80005ecc <_ZN9BufferCPP3getEv>
            i++;
    8000489c:	0019849b          	addiw	s1,s3,1
    800048a0:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    800048a4:	0ff57513          	andi	a0,a0,255
    800048a8:	ffffe097          	auipc	ra,0xffffe
    800048ac:	1b0080e7          	jalr	432(ra) # 80002a58 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    800048b0:	05000793          	li	a5,80
    800048b4:	02f4e4bb          	remw	s1,s1,a5
    800048b8:	fc0494e3          	bnez	s1,80004880 <_ZN8Consumer3runEv+0x34>
    800048bc:	fb9ff06f          	j	80004874 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    800048c0:	02093783          	ld	a5,32(s2)
    800048c4:	0087b503          	ld	a0,8(a5)
    800048c8:	00001097          	auipc	ra,0x1
    800048cc:	604080e7          	jalr	1540(ra) # 80005ecc <_ZN9BufferCPP3getEv>
            Console::putc(key);
    800048d0:	0ff57513          	andi	a0,a0,255
    800048d4:	ffffe097          	auipc	ra,0xffffe
    800048d8:	184080e7          	jalr	388(ra) # 80002a58 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    800048dc:	02093783          	ld	a5,32(s2)
    800048e0:	0087b503          	ld	a0,8(a5)
    800048e4:	00001097          	auipc	ra,0x1
    800048e8:	674080e7          	jalr	1652(ra) # 80005f58 <_ZN9BufferCPP6getCntEv>
    800048ec:	fca04ae3          	bgtz	a0,800048c0 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    800048f0:	02093783          	ld	a5,32(s2)
    800048f4:	0107b503          	ld	a0,16(a5)
    800048f8:	ffffe097          	auipc	ra,0xffffe
    800048fc:	0b4080e7          	jalr	180(ra) # 800029ac <_ZN9Semaphore6signalEv>
    }
    80004900:	02813083          	ld	ra,40(sp)
    80004904:	02013403          	ld	s0,32(sp)
    80004908:	01813483          	ld	s1,24(sp)
    8000490c:	01013903          	ld	s2,16(sp)
    80004910:	00813983          	ld	s3,8(sp)
    80004914:	03010113          	addi	sp,sp,48
    80004918:	00008067          	ret

000000008000491c <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    8000491c:	ff010113          	addi	sp,sp,-16
    80004920:	00113423          	sd	ra,8(sp)
    80004924:	00813023          	sd	s0,0(sp)
    80004928:	01010413          	addi	s0,sp,16
    8000492c:	00007797          	auipc	a5,0x7
    80004930:	08478793          	addi	a5,a5,132 # 8000b9b0 <_ZTV8Consumer+0x10>
    80004934:	00f53023          	sd	a5,0(a0)
    80004938:	ffffe097          	auipc	ra,0xffffe
    8000493c:	c70080e7          	jalr	-912(ra) # 800025a8 <_ZN6ThreadD1Ev>
    80004940:	00813083          	ld	ra,8(sp)
    80004944:	00013403          	ld	s0,0(sp)
    80004948:	01010113          	addi	sp,sp,16
    8000494c:	00008067          	ret

0000000080004950 <_ZN8ConsumerD0Ev>:
    80004950:	fe010113          	addi	sp,sp,-32
    80004954:	00113c23          	sd	ra,24(sp)
    80004958:	00813823          	sd	s0,16(sp)
    8000495c:	00913423          	sd	s1,8(sp)
    80004960:	02010413          	addi	s0,sp,32
    80004964:	00050493          	mv	s1,a0
    80004968:	00007797          	auipc	a5,0x7
    8000496c:	04878793          	addi	a5,a5,72 # 8000b9b0 <_ZTV8Consumer+0x10>
    80004970:	00f53023          	sd	a5,0(a0)
    80004974:	ffffe097          	auipc	ra,0xffffe
    80004978:	c34080e7          	jalr	-972(ra) # 800025a8 <_ZN6ThreadD1Ev>
    8000497c:	00048513          	mv	a0,s1
    80004980:	ffffe097          	auipc	ra,0xffffe
    80004984:	d24080e7          	jalr	-732(ra) # 800026a4 <_ZdlPv>
    80004988:	01813083          	ld	ra,24(sp)
    8000498c:	01013403          	ld	s0,16(sp)
    80004990:	00813483          	ld	s1,8(sp)
    80004994:	02010113          	addi	sp,sp,32
    80004998:	00008067          	ret

000000008000499c <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    8000499c:	ff010113          	addi	sp,sp,-16
    800049a0:	00113423          	sd	ra,8(sp)
    800049a4:	00813023          	sd	s0,0(sp)
    800049a8:	01010413          	addi	s0,sp,16
    800049ac:	00007797          	auipc	a5,0x7
    800049b0:	fb478793          	addi	a5,a5,-76 # 8000b960 <_ZTV16ProducerKeyborad+0x10>
    800049b4:	00f53023          	sd	a5,0(a0)
    800049b8:	ffffe097          	auipc	ra,0xffffe
    800049bc:	bf0080e7          	jalr	-1040(ra) # 800025a8 <_ZN6ThreadD1Ev>
    800049c0:	00813083          	ld	ra,8(sp)
    800049c4:	00013403          	ld	s0,0(sp)
    800049c8:	01010113          	addi	sp,sp,16
    800049cc:	00008067          	ret

00000000800049d0 <_ZN16ProducerKeyboradD0Ev>:
    800049d0:	fe010113          	addi	sp,sp,-32
    800049d4:	00113c23          	sd	ra,24(sp)
    800049d8:	00813823          	sd	s0,16(sp)
    800049dc:	00913423          	sd	s1,8(sp)
    800049e0:	02010413          	addi	s0,sp,32
    800049e4:	00050493          	mv	s1,a0
    800049e8:	00007797          	auipc	a5,0x7
    800049ec:	f7878793          	addi	a5,a5,-136 # 8000b960 <_ZTV16ProducerKeyborad+0x10>
    800049f0:	00f53023          	sd	a5,0(a0)
    800049f4:	ffffe097          	auipc	ra,0xffffe
    800049f8:	bb4080e7          	jalr	-1100(ra) # 800025a8 <_ZN6ThreadD1Ev>
    800049fc:	00048513          	mv	a0,s1
    80004a00:	ffffe097          	auipc	ra,0xffffe
    80004a04:	ca4080e7          	jalr	-860(ra) # 800026a4 <_ZdlPv>
    80004a08:	01813083          	ld	ra,24(sp)
    80004a0c:	01013403          	ld	s0,16(sp)
    80004a10:	00813483          	ld	s1,8(sp)
    80004a14:	02010113          	addi	sp,sp,32
    80004a18:	00008067          	ret

0000000080004a1c <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80004a1c:	ff010113          	addi	sp,sp,-16
    80004a20:	00113423          	sd	ra,8(sp)
    80004a24:	00813023          	sd	s0,0(sp)
    80004a28:	01010413          	addi	s0,sp,16
    80004a2c:	00007797          	auipc	a5,0x7
    80004a30:	f5c78793          	addi	a5,a5,-164 # 8000b988 <_ZTV8Producer+0x10>
    80004a34:	00f53023          	sd	a5,0(a0)
    80004a38:	ffffe097          	auipc	ra,0xffffe
    80004a3c:	b70080e7          	jalr	-1168(ra) # 800025a8 <_ZN6ThreadD1Ev>
    80004a40:	00813083          	ld	ra,8(sp)
    80004a44:	00013403          	ld	s0,0(sp)
    80004a48:	01010113          	addi	sp,sp,16
    80004a4c:	00008067          	ret

0000000080004a50 <_ZN8ProducerD0Ev>:
    80004a50:	fe010113          	addi	sp,sp,-32
    80004a54:	00113c23          	sd	ra,24(sp)
    80004a58:	00813823          	sd	s0,16(sp)
    80004a5c:	00913423          	sd	s1,8(sp)
    80004a60:	02010413          	addi	s0,sp,32
    80004a64:	00050493          	mv	s1,a0
    80004a68:	00007797          	auipc	a5,0x7
    80004a6c:	f2078793          	addi	a5,a5,-224 # 8000b988 <_ZTV8Producer+0x10>
    80004a70:	00f53023          	sd	a5,0(a0)
    80004a74:	ffffe097          	auipc	ra,0xffffe
    80004a78:	b34080e7          	jalr	-1228(ra) # 800025a8 <_ZN6ThreadD1Ev>
    80004a7c:	00048513          	mv	a0,s1
    80004a80:	ffffe097          	auipc	ra,0xffffe
    80004a84:	c24080e7          	jalr	-988(ra) # 800026a4 <_ZdlPv>
    80004a88:	01813083          	ld	ra,24(sp)
    80004a8c:	01013403          	ld	s0,16(sp)
    80004a90:	00813483          	ld	s1,8(sp)
    80004a94:	02010113          	addi	sp,sp,32
    80004a98:	00008067          	ret

0000000080004a9c <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80004a9c:	fe010113          	addi	sp,sp,-32
    80004aa0:	00113c23          	sd	ra,24(sp)
    80004aa4:	00813823          	sd	s0,16(sp)
    80004aa8:	00913423          	sd	s1,8(sp)
    80004aac:	02010413          	addi	s0,sp,32
    80004ab0:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80004ab4:	ffffd097          	auipc	ra,0xffffd
    80004ab8:	ab4080e7          	jalr	-1356(ra) # 80001568 <_Z4getcv>
    80004abc:	0005059b          	sext.w	a1,a0
    80004ac0:	01b00793          	li	a5,27
    80004ac4:	00f58c63          	beq	a1,a5,80004adc <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80004ac8:	0204b783          	ld	a5,32(s1)
    80004acc:	0087b503          	ld	a0,8(a5)
    80004ad0:	00001097          	auipc	ra,0x1
    80004ad4:	36c080e7          	jalr	876(ra) # 80005e3c <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80004ad8:	fddff06f          	j	80004ab4 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80004adc:	00100793          	li	a5,1
    80004ae0:	00007717          	auipc	a4,0x7
    80004ae4:	12f72823          	sw	a5,304(a4) # 8000bc10 <_ZL9threadEnd>
        td->buffer->put('!');
    80004ae8:	0204b783          	ld	a5,32(s1)
    80004aec:	02100593          	li	a1,33
    80004af0:	0087b503          	ld	a0,8(a5)
    80004af4:	00001097          	auipc	ra,0x1
    80004af8:	348080e7          	jalr	840(ra) # 80005e3c <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80004afc:	0204b783          	ld	a5,32(s1)
    80004b00:	0107b503          	ld	a0,16(a5)
    80004b04:	ffffe097          	auipc	ra,0xffffe
    80004b08:	ea8080e7          	jalr	-344(ra) # 800029ac <_ZN9Semaphore6signalEv>
    }
    80004b0c:	01813083          	ld	ra,24(sp)
    80004b10:	01013403          	ld	s0,16(sp)
    80004b14:	00813483          	ld	s1,8(sp)
    80004b18:	02010113          	addi	sp,sp,32
    80004b1c:	00008067          	ret

0000000080004b20 <_ZN8Producer3runEv>:
    void run() override {
    80004b20:	fe010113          	addi	sp,sp,-32
    80004b24:	00113c23          	sd	ra,24(sp)
    80004b28:	00813823          	sd	s0,16(sp)
    80004b2c:	00913423          	sd	s1,8(sp)
    80004b30:	01213023          	sd	s2,0(sp)
    80004b34:	02010413          	addi	s0,sp,32
    80004b38:	00050493          	mv	s1,a0
        int i = 0;
    80004b3c:	00000913          	li	s2,0
        while (!threadEnd) {
    80004b40:	00007797          	auipc	a5,0x7
    80004b44:	0d07a783          	lw	a5,208(a5) # 8000bc10 <_ZL9threadEnd>
    80004b48:	04079263          	bnez	a5,80004b8c <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    80004b4c:	0204b783          	ld	a5,32(s1)
    80004b50:	0007a583          	lw	a1,0(a5)
    80004b54:	0305859b          	addiw	a1,a1,48
    80004b58:	0087b503          	ld	a0,8(a5)
    80004b5c:	00001097          	auipc	ra,0x1
    80004b60:	2e0080e7          	jalr	736(ra) # 80005e3c <_ZN9BufferCPP3putEi>
            i++;
    80004b64:	0019071b          	addiw	a4,s2,1
    80004b68:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    80004b6c:	0204b783          	ld	a5,32(s1)
    80004b70:	0007a783          	lw	a5,0(a5)
    80004b74:	00e787bb          	addw	a5,a5,a4
    80004b78:	00500513          	li	a0,5
    80004b7c:	02a7e53b          	remw	a0,a5,a0
    80004b80:	ffffe097          	auipc	ra,0xffffe
    80004b84:	d10080e7          	jalr	-752(ra) # 80002890 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80004b88:	fb9ff06f          	j	80004b40 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80004b8c:	0204b783          	ld	a5,32(s1)
    80004b90:	0107b503          	ld	a0,16(a5)
    80004b94:	ffffe097          	auipc	ra,0xffffe
    80004b98:	e18080e7          	jalr	-488(ra) # 800029ac <_ZN9Semaphore6signalEv>
    }
    80004b9c:	01813083          	ld	ra,24(sp)
    80004ba0:	01013403          	ld	s0,16(sp)
    80004ba4:	00813483          	ld	s1,8(sp)
    80004ba8:	00013903          	ld	s2,0(sp)
    80004bac:	02010113          	addi	sp,sp,32
    80004bb0:	00008067          	ret

0000000080004bb4 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004bb4:	fe010113          	addi	sp,sp,-32
    80004bb8:	00113c23          	sd	ra,24(sp)
    80004bbc:	00813823          	sd	s0,16(sp)
    80004bc0:	00913423          	sd	s1,8(sp)
    80004bc4:	01213023          	sd	s2,0(sp)
    80004bc8:	02010413          	addi	s0,sp,32
    80004bcc:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004bd0:	00100793          	li	a5,1
    80004bd4:	02a7f863          	bgeu	a5,a0,80004c04 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004bd8:	00a00793          	li	a5,10
    80004bdc:	02f577b3          	remu	a5,a0,a5
    80004be0:	02078e63          	beqz	a5,80004c1c <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004be4:	fff48513          	addi	a0,s1,-1
    80004be8:	00000097          	auipc	ra,0x0
    80004bec:	fcc080e7          	jalr	-52(ra) # 80004bb4 <_ZL9fibonaccim>
    80004bf0:	00050913          	mv	s2,a0
    80004bf4:	ffe48513          	addi	a0,s1,-2
    80004bf8:	00000097          	auipc	ra,0x0
    80004bfc:	fbc080e7          	jalr	-68(ra) # 80004bb4 <_ZL9fibonaccim>
    80004c00:	00a90533          	add	a0,s2,a0
}
    80004c04:	01813083          	ld	ra,24(sp)
    80004c08:	01013403          	ld	s0,16(sp)
    80004c0c:	00813483          	ld	s1,8(sp)
    80004c10:	00013903          	ld	s2,0(sp)
    80004c14:	02010113          	addi	sp,sp,32
    80004c18:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80004c1c:	ffffd097          	auipc	ra,0xffffd
    80004c20:	80c080e7          	jalr	-2036(ra) # 80001428 <_Z15thread_dispatchv>
    80004c24:	fc1ff06f          	j	80004be4 <_ZL9fibonaccim+0x30>

0000000080004c28 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80004c28:	fe010113          	addi	sp,sp,-32
    80004c2c:	00113c23          	sd	ra,24(sp)
    80004c30:	00813823          	sd	s0,16(sp)
    80004c34:	00913423          	sd	s1,8(sp)
    80004c38:	01213023          	sd	s2,0(sp)
    80004c3c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004c40:	00a00493          	li	s1,10
    80004c44:	0400006f          	j	80004c84 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004c48:	00004517          	auipc	a0,0x4
    80004c4c:	72050513          	addi	a0,a0,1824 # 80009368 <CONSOLE_STATUS+0x358>
    80004c50:	00001097          	auipc	ra,0x1
    80004c54:	dc8080e7          	jalr	-568(ra) # 80005a18 <_Z11printStringPKc>
    80004c58:	00000613          	li	a2,0
    80004c5c:	00a00593          	li	a1,10
    80004c60:	00048513          	mv	a0,s1
    80004c64:	00001097          	auipc	ra,0x1
    80004c68:	f64080e7          	jalr	-156(ra) # 80005bc8 <_Z8printIntiii>
    80004c6c:	00005517          	auipc	a0,0x5
    80004c70:	8fc50513          	addi	a0,a0,-1796 # 80009568 <CONSOLE_STATUS+0x558>
    80004c74:	00001097          	auipc	ra,0x1
    80004c78:	da4080e7          	jalr	-604(ra) # 80005a18 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004c7c:	0014849b          	addiw	s1,s1,1
    80004c80:	0ff4f493          	andi	s1,s1,255
    80004c84:	00c00793          	li	a5,12
    80004c88:	fc97f0e3          	bgeu	a5,s1,80004c48 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80004c8c:	00004517          	auipc	a0,0x4
    80004c90:	6e450513          	addi	a0,a0,1764 # 80009370 <CONSOLE_STATUS+0x360>
    80004c94:	00001097          	auipc	ra,0x1
    80004c98:	d84080e7          	jalr	-636(ra) # 80005a18 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004c9c:	00500313          	li	t1,5
    thread_dispatch();
    80004ca0:	ffffc097          	auipc	ra,0xffffc
    80004ca4:	788080e7          	jalr	1928(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004ca8:	01000513          	li	a0,16
    80004cac:	00000097          	auipc	ra,0x0
    80004cb0:	f08080e7          	jalr	-248(ra) # 80004bb4 <_ZL9fibonaccim>
    80004cb4:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004cb8:	00004517          	auipc	a0,0x4
    80004cbc:	6c850513          	addi	a0,a0,1736 # 80009380 <CONSOLE_STATUS+0x370>
    80004cc0:	00001097          	auipc	ra,0x1
    80004cc4:	d58080e7          	jalr	-680(ra) # 80005a18 <_Z11printStringPKc>
    80004cc8:	00000613          	li	a2,0
    80004ccc:	00a00593          	li	a1,10
    80004cd0:	0009051b          	sext.w	a0,s2
    80004cd4:	00001097          	auipc	ra,0x1
    80004cd8:	ef4080e7          	jalr	-268(ra) # 80005bc8 <_Z8printIntiii>
    80004cdc:	00005517          	auipc	a0,0x5
    80004ce0:	88c50513          	addi	a0,a0,-1908 # 80009568 <CONSOLE_STATUS+0x558>
    80004ce4:	00001097          	auipc	ra,0x1
    80004ce8:	d34080e7          	jalr	-716(ra) # 80005a18 <_Z11printStringPKc>
    80004cec:	0400006f          	j	80004d2c <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004cf0:	00004517          	auipc	a0,0x4
    80004cf4:	67850513          	addi	a0,a0,1656 # 80009368 <CONSOLE_STATUS+0x358>
    80004cf8:	00001097          	auipc	ra,0x1
    80004cfc:	d20080e7          	jalr	-736(ra) # 80005a18 <_Z11printStringPKc>
    80004d00:	00000613          	li	a2,0
    80004d04:	00a00593          	li	a1,10
    80004d08:	00048513          	mv	a0,s1
    80004d0c:	00001097          	auipc	ra,0x1
    80004d10:	ebc080e7          	jalr	-324(ra) # 80005bc8 <_Z8printIntiii>
    80004d14:	00005517          	auipc	a0,0x5
    80004d18:	85450513          	addi	a0,a0,-1964 # 80009568 <CONSOLE_STATUS+0x558>
    80004d1c:	00001097          	auipc	ra,0x1
    80004d20:	cfc080e7          	jalr	-772(ra) # 80005a18 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004d24:	0014849b          	addiw	s1,s1,1
    80004d28:	0ff4f493          	andi	s1,s1,255
    80004d2c:	00f00793          	li	a5,15
    80004d30:	fc97f0e3          	bgeu	a5,s1,80004cf0 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80004d34:	00004517          	auipc	a0,0x4
    80004d38:	65c50513          	addi	a0,a0,1628 # 80009390 <CONSOLE_STATUS+0x380>
    80004d3c:	00001097          	auipc	ra,0x1
    80004d40:	cdc080e7          	jalr	-804(ra) # 80005a18 <_Z11printStringPKc>
    finishedD = true;
    80004d44:	00100793          	li	a5,1
    80004d48:	00007717          	auipc	a4,0x7
    80004d4c:	ecf70c23          	sb	a5,-296(a4) # 8000bc20 <_ZL9finishedD>
    thread_dispatch();
    80004d50:	ffffc097          	auipc	ra,0xffffc
    80004d54:	6d8080e7          	jalr	1752(ra) # 80001428 <_Z15thread_dispatchv>
}
    80004d58:	01813083          	ld	ra,24(sp)
    80004d5c:	01013403          	ld	s0,16(sp)
    80004d60:	00813483          	ld	s1,8(sp)
    80004d64:	00013903          	ld	s2,0(sp)
    80004d68:	02010113          	addi	sp,sp,32
    80004d6c:	00008067          	ret

0000000080004d70 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80004d70:	fe010113          	addi	sp,sp,-32
    80004d74:	00113c23          	sd	ra,24(sp)
    80004d78:	00813823          	sd	s0,16(sp)
    80004d7c:	00913423          	sd	s1,8(sp)
    80004d80:	01213023          	sd	s2,0(sp)
    80004d84:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004d88:	00000493          	li	s1,0
    80004d8c:	0400006f          	j	80004dcc <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80004d90:	00004517          	auipc	a0,0x4
    80004d94:	5a850513          	addi	a0,a0,1448 # 80009338 <CONSOLE_STATUS+0x328>
    80004d98:	00001097          	auipc	ra,0x1
    80004d9c:	c80080e7          	jalr	-896(ra) # 80005a18 <_Z11printStringPKc>
    80004da0:	00000613          	li	a2,0
    80004da4:	00a00593          	li	a1,10
    80004da8:	00048513          	mv	a0,s1
    80004dac:	00001097          	auipc	ra,0x1
    80004db0:	e1c080e7          	jalr	-484(ra) # 80005bc8 <_Z8printIntiii>
    80004db4:	00004517          	auipc	a0,0x4
    80004db8:	7b450513          	addi	a0,a0,1972 # 80009568 <CONSOLE_STATUS+0x558>
    80004dbc:	00001097          	auipc	ra,0x1
    80004dc0:	c5c080e7          	jalr	-932(ra) # 80005a18 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004dc4:	0014849b          	addiw	s1,s1,1
    80004dc8:	0ff4f493          	andi	s1,s1,255
    80004dcc:	00200793          	li	a5,2
    80004dd0:	fc97f0e3          	bgeu	a5,s1,80004d90 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80004dd4:	00004517          	auipc	a0,0x4
    80004dd8:	56c50513          	addi	a0,a0,1388 # 80009340 <CONSOLE_STATUS+0x330>
    80004ddc:	00001097          	auipc	ra,0x1
    80004de0:	c3c080e7          	jalr	-964(ra) # 80005a18 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004de4:	00700313          	li	t1,7
    thread_dispatch();
    80004de8:	ffffc097          	auipc	ra,0xffffc
    80004dec:	640080e7          	jalr	1600(ra) # 80001428 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004df0:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80004df4:	00004517          	auipc	a0,0x4
    80004df8:	55c50513          	addi	a0,a0,1372 # 80009350 <CONSOLE_STATUS+0x340>
    80004dfc:	00001097          	auipc	ra,0x1
    80004e00:	c1c080e7          	jalr	-996(ra) # 80005a18 <_Z11printStringPKc>
    80004e04:	00000613          	li	a2,0
    80004e08:	00a00593          	li	a1,10
    80004e0c:	0009051b          	sext.w	a0,s2
    80004e10:	00001097          	auipc	ra,0x1
    80004e14:	db8080e7          	jalr	-584(ra) # 80005bc8 <_Z8printIntiii>
    80004e18:	00004517          	auipc	a0,0x4
    80004e1c:	75050513          	addi	a0,a0,1872 # 80009568 <CONSOLE_STATUS+0x558>
    80004e20:	00001097          	auipc	ra,0x1
    80004e24:	bf8080e7          	jalr	-1032(ra) # 80005a18 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80004e28:	00c00513          	li	a0,12
    80004e2c:	00000097          	auipc	ra,0x0
    80004e30:	d88080e7          	jalr	-632(ra) # 80004bb4 <_ZL9fibonaccim>
    80004e34:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80004e38:	00004517          	auipc	a0,0x4
    80004e3c:	52050513          	addi	a0,a0,1312 # 80009358 <CONSOLE_STATUS+0x348>
    80004e40:	00001097          	auipc	ra,0x1
    80004e44:	bd8080e7          	jalr	-1064(ra) # 80005a18 <_Z11printStringPKc>
    80004e48:	00000613          	li	a2,0
    80004e4c:	00a00593          	li	a1,10
    80004e50:	0009051b          	sext.w	a0,s2
    80004e54:	00001097          	auipc	ra,0x1
    80004e58:	d74080e7          	jalr	-652(ra) # 80005bc8 <_Z8printIntiii>
    80004e5c:	00004517          	auipc	a0,0x4
    80004e60:	70c50513          	addi	a0,a0,1804 # 80009568 <CONSOLE_STATUS+0x558>
    80004e64:	00001097          	auipc	ra,0x1
    80004e68:	bb4080e7          	jalr	-1100(ra) # 80005a18 <_Z11printStringPKc>
    80004e6c:	0400006f          	j	80004eac <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80004e70:	00004517          	auipc	a0,0x4
    80004e74:	4c850513          	addi	a0,a0,1224 # 80009338 <CONSOLE_STATUS+0x328>
    80004e78:	00001097          	auipc	ra,0x1
    80004e7c:	ba0080e7          	jalr	-1120(ra) # 80005a18 <_Z11printStringPKc>
    80004e80:	00000613          	li	a2,0
    80004e84:	00a00593          	li	a1,10
    80004e88:	00048513          	mv	a0,s1
    80004e8c:	00001097          	auipc	ra,0x1
    80004e90:	d3c080e7          	jalr	-708(ra) # 80005bc8 <_Z8printIntiii>
    80004e94:	00004517          	auipc	a0,0x4
    80004e98:	6d450513          	addi	a0,a0,1748 # 80009568 <CONSOLE_STATUS+0x558>
    80004e9c:	00001097          	auipc	ra,0x1
    80004ea0:	b7c080e7          	jalr	-1156(ra) # 80005a18 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004ea4:	0014849b          	addiw	s1,s1,1
    80004ea8:	0ff4f493          	andi	s1,s1,255
    80004eac:	00500793          	li	a5,5
    80004eb0:	fc97f0e3          	bgeu	a5,s1,80004e70 <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    80004eb4:	00004517          	auipc	a0,0x4
    80004eb8:	54c50513          	addi	a0,a0,1356 # 80009400 <CONSOLE_STATUS+0x3f0>
    80004ebc:	00001097          	auipc	ra,0x1
    80004ec0:	b5c080e7          	jalr	-1188(ra) # 80005a18 <_Z11printStringPKc>
    finishedC = true;
    80004ec4:	00100793          	li	a5,1
    80004ec8:	00007717          	auipc	a4,0x7
    80004ecc:	d4f70ca3          	sb	a5,-679(a4) # 8000bc21 <_ZL9finishedC>
    thread_dispatch();
    80004ed0:	ffffc097          	auipc	ra,0xffffc
    80004ed4:	558080e7          	jalr	1368(ra) # 80001428 <_Z15thread_dispatchv>
}
    80004ed8:	01813083          	ld	ra,24(sp)
    80004edc:	01013403          	ld	s0,16(sp)
    80004ee0:	00813483          	ld	s1,8(sp)
    80004ee4:	00013903          	ld	s2,0(sp)
    80004ee8:	02010113          	addi	sp,sp,32
    80004eec:	00008067          	ret

0000000080004ef0 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80004ef0:	fe010113          	addi	sp,sp,-32
    80004ef4:	00113c23          	sd	ra,24(sp)
    80004ef8:	00813823          	sd	s0,16(sp)
    80004efc:	00913423          	sd	s1,8(sp)
    80004f00:	01213023          	sd	s2,0(sp)
    80004f04:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80004f08:	00000913          	li	s2,0
    80004f0c:	0380006f          	j	80004f44 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80004f10:	ffffc097          	auipc	ra,0xffffc
    80004f14:	518080e7          	jalr	1304(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004f18:	00148493          	addi	s1,s1,1
    80004f1c:	000027b7          	lui	a5,0x2
    80004f20:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004f24:	0097ee63          	bltu	a5,s1,80004f40 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004f28:	00000713          	li	a4,0
    80004f2c:	000077b7          	lui	a5,0x7
    80004f30:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004f34:	fce7eee3          	bltu	a5,a4,80004f10 <_ZL11workerBodyBPv+0x20>
    80004f38:	00170713          	addi	a4,a4,1
    80004f3c:	ff1ff06f          	j	80004f2c <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80004f40:	00190913          	addi	s2,s2,1
    80004f44:	00f00793          	li	a5,15
    80004f48:	0527e063          	bltu	a5,s2,80004f88 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80004f4c:	00004517          	auipc	a0,0x4
    80004f50:	3d450513          	addi	a0,a0,980 # 80009320 <CONSOLE_STATUS+0x310>
    80004f54:	00001097          	auipc	ra,0x1
    80004f58:	ac4080e7          	jalr	-1340(ra) # 80005a18 <_Z11printStringPKc>
    80004f5c:	00000613          	li	a2,0
    80004f60:	00a00593          	li	a1,10
    80004f64:	0009051b          	sext.w	a0,s2
    80004f68:	00001097          	auipc	ra,0x1
    80004f6c:	c60080e7          	jalr	-928(ra) # 80005bc8 <_Z8printIntiii>
    80004f70:	00004517          	auipc	a0,0x4
    80004f74:	5f850513          	addi	a0,a0,1528 # 80009568 <CONSOLE_STATUS+0x558>
    80004f78:	00001097          	auipc	ra,0x1
    80004f7c:	aa0080e7          	jalr	-1376(ra) # 80005a18 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004f80:	00000493          	li	s1,0
    80004f84:	f99ff06f          	j	80004f1c <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80004f88:	00004517          	auipc	a0,0x4
    80004f8c:	3a050513          	addi	a0,a0,928 # 80009328 <CONSOLE_STATUS+0x318>
    80004f90:	00001097          	auipc	ra,0x1
    80004f94:	a88080e7          	jalr	-1400(ra) # 80005a18 <_Z11printStringPKc>
    finishedB = true;
    80004f98:	00100793          	li	a5,1
    80004f9c:	00007717          	auipc	a4,0x7
    80004fa0:	c8f70323          	sb	a5,-890(a4) # 8000bc22 <_ZL9finishedB>
    thread_dispatch();
    80004fa4:	ffffc097          	auipc	ra,0xffffc
    80004fa8:	484080e7          	jalr	1156(ra) # 80001428 <_Z15thread_dispatchv>
}
    80004fac:	01813083          	ld	ra,24(sp)
    80004fb0:	01013403          	ld	s0,16(sp)
    80004fb4:	00813483          	ld	s1,8(sp)
    80004fb8:	00013903          	ld	s2,0(sp)
    80004fbc:	02010113          	addi	sp,sp,32
    80004fc0:	00008067          	ret

0000000080004fc4 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80004fc4:	fe010113          	addi	sp,sp,-32
    80004fc8:	00113c23          	sd	ra,24(sp)
    80004fcc:	00813823          	sd	s0,16(sp)
    80004fd0:	00913423          	sd	s1,8(sp)
    80004fd4:	01213023          	sd	s2,0(sp)
    80004fd8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80004fdc:	00000913          	li	s2,0
    80004fe0:	0380006f          	j	80005018 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80004fe4:	ffffc097          	auipc	ra,0xffffc
    80004fe8:	444080e7          	jalr	1092(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004fec:	00148493          	addi	s1,s1,1
    80004ff0:	000027b7          	lui	a5,0x2
    80004ff4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004ff8:	0097ee63          	bltu	a5,s1,80005014 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004ffc:	00000713          	li	a4,0
    80005000:	000077b7          	lui	a5,0x7
    80005004:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005008:	fce7eee3          	bltu	a5,a4,80004fe4 <_ZL11workerBodyAPv+0x20>
    8000500c:	00170713          	addi	a4,a4,1
    80005010:	ff1ff06f          	j	80005000 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80005014:	00190913          	addi	s2,s2,1
    80005018:	00900793          	li	a5,9
    8000501c:	0527e063          	bltu	a5,s2,8000505c <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80005020:	00004517          	auipc	a0,0x4
    80005024:	2e850513          	addi	a0,a0,744 # 80009308 <CONSOLE_STATUS+0x2f8>
    80005028:	00001097          	auipc	ra,0x1
    8000502c:	9f0080e7          	jalr	-1552(ra) # 80005a18 <_Z11printStringPKc>
    80005030:	00000613          	li	a2,0
    80005034:	00a00593          	li	a1,10
    80005038:	0009051b          	sext.w	a0,s2
    8000503c:	00001097          	auipc	ra,0x1
    80005040:	b8c080e7          	jalr	-1140(ra) # 80005bc8 <_Z8printIntiii>
    80005044:	00004517          	auipc	a0,0x4
    80005048:	52450513          	addi	a0,a0,1316 # 80009568 <CONSOLE_STATUS+0x558>
    8000504c:	00001097          	auipc	ra,0x1
    80005050:	9cc080e7          	jalr	-1588(ra) # 80005a18 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005054:	00000493          	li	s1,0
    80005058:	f99ff06f          	j	80004ff0 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    8000505c:	00004517          	auipc	a0,0x4
    80005060:	2b450513          	addi	a0,a0,692 # 80009310 <CONSOLE_STATUS+0x300>
    80005064:	00001097          	auipc	ra,0x1
    80005068:	9b4080e7          	jalr	-1612(ra) # 80005a18 <_Z11printStringPKc>
    finishedA = true;
    8000506c:	00100793          	li	a5,1
    80005070:	00007717          	auipc	a4,0x7
    80005074:	baf709a3          	sb	a5,-1101(a4) # 8000bc23 <_ZL9finishedA>
}
    80005078:	01813083          	ld	ra,24(sp)
    8000507c:	01013403          	ld	s0,16(sp)
    80005080:	00813483          	ld	s1,8(sp)
    80005084:	00013903          	ld	s2,0(sp)
    80005088:	02010113          	addi	sp,sp,32
    8000508c:	00008067          	ret

0000000080005090 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80005090:	fd010113          	addi	sp,sp,-48
    80005094:	02113423          	sd	ra,40(sp)
    80005098:	02813023          	sd	s0,32(sp)
    8000509c:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    800050a0:	00000613          	li	a2,0
    800050a4:	00000597          	auipc	a1,0x0
    800050a8:	f2058593          	addi	a1,a1,-224 # 80004fc4 <_ZL11workerBodyAPv>
    800050ac:	fd040513          	addi	a0,s0,-48
    800050b0:	ffffc097          	auipc	ra,0xffffc
    800050b4:	2d0080e7          	jalr	720(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    800050b8:	00004517          	auipc	a0,0x4
    800050bc:	2e850513          	addi	a0,a0,744 # 800093a0 <CONSOLE_STATUS+0x390>
    800050c0:	00001097          	auipc	ra,0x1
    800050c4:	958080e7          	jalr	-1704(ra) # 80005a18 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    800050c8:	00000613          	li	a2,0
    800050cc:	00000597          	auipc	a1,0x0
    800050d0:	e2458593          	addi	a1,a1,-476 # 80004ef0 <_ZL11workerBodyBPv>
    800050d4:	fd840513          	addi	a0,s0,-40
    800050d8:	ffffc097          	auipc	ra,0xffffc
    800050dc:	2a8080e7          	jalr	680(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    800050e0:	00004517          	auipc	a0,0x4
    800050e4:	2d850513          	addi	a0,a0,728 # 800093b8 <CONSOLE_STATUS+0x3a8>
    800050e8:	00001097          	auipc	ra,0x1
    800050ec:	930080e7          	jalr	-1744(ra) # 80005a18 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    800050f0:	00000613          	li	a2,0
    800050f4:	00000597          	auipc	a1,0x0
    800050f8:	c7c58593          	addi	a1,a1,-900 # 80004d70 <_ZL11workerBodyCPv>
    800050fc:	fe040513          	addi	a0,s0,-32
    80005100:	ffffc097          	auipc	ra,0xffffc
    80005104:	280080e7          	jalr	640(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80005108:	00004517          	auipc	a0,0x4
    8000510c:	2c850513          	addi	a0,a0,712 # 800093d0 <CONSOLE_STATUS+0x3c0>
    80005110:	00001097          	auipc	ra,0x1
    80005114:	908080e7          	jalr	-1784(ra) # 80005a18 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80005118:	00000613          	li	a2,0
    8000511c:	00000597          	auipc	a1,0x0
    80005120:	b0c58593          	addi	a1,a1,-1268 # 80004c28 <_ZL11workerBodyDPv>
    80005124:	fe840513          	addi	a0,s0,-24
    80005128:	ffffc097          	auipc	ra,0xffffc
    8000512c:	258080e7          	jalr	600(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80005130:	00004517          	auipc	a0,0x4
    80005134:	2b850513          	addi	a0,a0,696 # 800093e8 <CONSOLE_STATUS+0x3d8>
    80005138:	00001097          	auipc	ra,0x1
    8000513c:	8e0080e7          	jalr	-1824(ra) # 80005a18 <_Z11printStringPKc>
    80005140:	00c0006f          	j	8000514c <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80005144:	ffffc097          	auipc	ra,0xffffc
    80005148:	2e4080e7          	jalr	740(ra) # 80001428 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    8000514c:	00007797          	auipc	a5,0x7
    80005150:	ad77c783          	lbu	a5,-1321(a5) # 8000bc23 <_ZL9finishedA>
    80005154:	fe0788e3          	beqz	a5,80005144 <_Z18Threads_C_API_testv+0xb4>
    80005158:	00007797          	auipc	a5,0x7
    8000515c:	aca7c783          	lbu	a5,-1334(a5) # 8000bc22 <_ZL9finishedB>
    80005160:	fe0782e3          	beqz	a5,80005144 <_Z18Threads_C_API_testv+0xb4>
    80005164:	00007797          	auipc	a5,0x7
    80005168:	abd7c783          	lbu	a5,-1347(a5) # 8000bc21 <_ZL9finishedC>
    8000516c:	fc078ce3          	beqz	a5,80005144 <_Z18Threads_C_API_testv+0xb4>
    80005170:	00007797          	auipc	a5,0x7
    80005174:	ab07c783          	lbu	a5,-1360(a5) # 8000bc20 <_ZL9finishedD>
    80005178:	fc0786e3          	beqz	a5,80005144 <_Z18Threads_C_API_testv+0xb4>
    }

}
    8000517c:	02813083          	ld	ra,40(sp)
    80005180:	02013403          	ld	s0,32(sp)
    80005184:	03010113          	addi	sp,sp,48
    80005188:	00008067          	ret

000000008000518c <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    8000518c:	fd010113          	addi	sp,sp,-48
    80005190:	02113423          	sd	ra,40(sp)
    80005194:	02813023          	sd	s0,32(sp)
    80005198:	00913c23          	sd	s1,24(sp)
    8000519c:	01213823          	sd	s2,16(sp)
    800051a0:	01313423          	sd	s3,8(sp)
    800051a4:	03010413          	addi	s0,sp,48
    800051a8:	00050993          	mv	s3,a0
    800051ac:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    800051b0:	00000913          	li	s2,0
    800051b4:	00c0006f          	j	800051c0 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    800051b8:	ffffd097          	auipc	ra,0xffffd
    800051bc:	6b0080e7          	jalr	1712(ra) # 80002868 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    800051c0:	ffffc097          	auipc	ra,0xffffc
    800051c4:	3a8080e7          	jalr	936(ra) # 80001568 <_Z4getcv>
    800051c8:	0005059b          	sext.w	a1,a0
    800051cc:	01b00793          	li	a5,27
    800051d0:	02f58a63          	beq	a1,a5,80005204 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    800051d4:	0084b503          	ld	a0,8(s1)
    800051d8:	00001097          	auipc	ra,0x1
    800051dc:	c64080e7          	jalr	-924(ra) # 80005e3c <_ZN9BufferCPP3putEi>
        i++;
    800051e0:	0019071b          	addiw	a4,s2,1
    800051e4:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800051e8:	0004a683          	lw	a3,0(s1)
    800051ec:	0026979b          	slliw	a5,a3,0x2
    800051f0:	00d787bb          	addw	a5,a5,a3
    800051f4:	0017979b          	slliw	a5,a5,0x1
    800051f8:	02f767bb          	remw	a5,a4,a5
    800051fc:	fc0792e3          	bnez	a5,800051c0 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    80005200:	fb9ff06f          	j	800051b8 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80005204:	00100793          	li	a5,1
    80005208:	00007717          	auipc	a4,0x7
    8000520c:	a2f72023          	sw	a5,-1504(a4) # 8000bc28 <_ZL9threadEnd>
    td->buffer->put('!');
    80005210:	0209b783          	ld	a5,32(s3)
    80005214:	02100593          	li	a1,33
    80005218:	0087b503          	ld	a0,8(a5)
    8000521c:	00001097          	auipc	ra,0x1
    80005220:	c20080e7          	jalr	-992(ra) # 80005e3c <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80005224:	0104b503          	ld	a0,16(s1)
    80005228:	ffffd097          	auipc	ra,0xffffd
    8000522c:	784080e7          	jalr	1924(ra) # 800029ac <_ZN9Semaphore6signalEv>
}
    80005230:	02813083          	ld	ra,40(sp)
    80005234:	02013403          	ld	s0,32(sp)
    80005238:	01813483          	ld	s1,24(sp)
    8000523c:	01013903          	ld	s2,16(sp)
    80005240:	00813983          	ld	s3,8(sp)
    80005244:	03010113          	addi	sp,sp,48
    80005248:	00008067          	ret

000000008000524c <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    8000524c:	fe010113          	addi	sp,sp,-32
    80005250:	00113c23          	sd	ra,24(sp)
    80005254:	00813823          	sd	s0,16(sp)
    80005258:	00913423          	sd	s1,8(sp)
    8000525c:	01213023          	sd	s2,0(sp)
    80005260:	02010413          	addi	s0,sp,32
    80005264:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005268:	00000913          	li	s2,0
    8000526c:	00c0006f          	j	80005278 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005270:	ffffd097          	auipc	ra,0xffffd
    80005274:	5f8080e7          	jalr	1528(ra) # 80002868 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80005278:	00007797          	auipc	a5,0x7
    8000527c:	9b07a783          	lw	a5,-1616(a5) # 8000bc28 <_ZL9threadEnd>
    80005280:	02079e63          	bnez	a5,800052bc <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80005284:	0004a583          	lw	a1,0(s1)
    80005288:	0305859b          	addiw	a1,a1,48
    8000528c:	0084b503          	ld	a0,8(s1)
    80005290:	00001097          	auipc	ra,0x1
    80005294:	bac080e7          	jalr	-1108(ra) # 80005e3c <_ZN9BufferCPP3putEi>
        i++;
    80005298:	0019071b          	addiw	a4,s2,1
    8000529c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800052a0:	0004a683          	lw	a3,0(s1)
    800052a4:	0026979b          	slliw	a5,a3,0x2
    800052a8:	00d787bb          	addw	a5,a5,a3
    800052ac:	0017979b          	slliw	a5,a5,0x1
    800052b0:	02f767bb          	remw	a5,a4,a5
    800052b4:	fc0792e3          	bnez	a5,80005278 <_ZN12ProducerSync8producerEPv+0x2c>
    800052b8:	fb9ff06f          	j	80005270 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    800052bc:	0104b503          	ld	a0,16(s1)
    800052c0:	ffffd097          	auipc	ra,0xffffd
    800052c4:	6ec080e7          	jalr	1772(ra) # 800029ac <_ZN9Semaphore6signalEv>
}
    800052c8:	01813083          	ld	ra,24(sp)
    800052cc:	01013403          	ld	s0,16(sp)
    800052d0:	00813483          	ld	s1,8(sp)
    800052d4:	00013903          	ld	s2,0(sp)
    800052d8:	02010113          	addi	sp,sp,32
    800052dc:	00008067          	ret

00000000800052e0 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    800052e0:	fd010113          	addi	sp,sp,-48
    800052e4:	02113423          	sd	ra,40(sp)
    800052e8:	02813023          	sd	s0,32(sp)
    800052ec:	00913c23          	sd	s1,24(sp)
    800052f0:	01213823          	sd	s2,16(sp)
    800052f4:	01313423          	sd	s3,8(sp)
    800052f8:	01413023          	sd	s4,0(sp)
    800052fc:	03010413          	addi	s0,sp,48
    80005300:	00050993          	mv	s3,a0
    80005304:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005308:	00000a13          	li	s4,0
    8000530c:	01c0006f          	j	80005328 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80005310:	ffffd097          	auipc	ra,0xffffd
    80005314:	558080e7          	jalr	1368(ra) # 80002868 <_ZN6Thread8dispatchEv>
    80005318:	0500006f          	j	80005368 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    8000531c:	00a00513          	li	a0,10
    80005320:	ffffc097          	auipc	ra,0xffffc
    80005324:	270080e7          	jalr	624(ra) # 80001590 <_Z4putcc>
    while (!threadEnd) {
    80005328:	00007797          	auipc	a5,0x7
    8000532c:	9007a783          	lw	a5,-1792(a5) # 8000bc28 <_ZL9threadEnd>
    80005330:	06079263          	bnez	a5,80005394 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80005334:	00893503          	ld	a0,8(s2)
    80005338:	00001097          	auipc	ra,0x1
    8000533c:	b94080e7          	jalr	-1132(ra) # 80005ecc <_ZN9BufferCPP3getEv>
        i++;
    80005340:	001a049b          	addiw	s1,s4,1
    80005344:	00048a1b          	sext.w	s4,s1
        putc(key);
    80005348:	0ff57513          	andi	a0,a0,255
    8000534c:	ffffc097          	auipc	ra,0xffffc
    80005350:	244080e7          	jalr	580(ra) # 80001590 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80005354:	00092703          	lw	a4,0(s2)
    80005358:	0027179b          	slliw	a5,a4,0x2
    8000535c:	00e787bb          	addw	a5,a5,a4
    80005360:	02f4e7bb          	remw	a5,s1,a5
    80005364:	fa0786e3          	beqz	a5,80005310 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80005368:	05000793          	li	a5,80
    8000536c:	02f4e4bb          	remw	s1,s1,a5
    80005370:	fa049ce3          	bnez	s1,80005328 <_ZN12ConsumerSync8consumerEPv+0x48>
    80005374:	fa9ff06f          	j	8000531c <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80005378:	0209b783          	ld	a5,32(s3)
    8000537c:	0087b503          	ld	a0,8(a5)
    80005380:	00001097          	auipc	ra,0x1
    80005384:	b4c080e7          	jalr	-1204(ra) # 80005ecc <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80005388:	0ff57513          	andi	a0,a0,255
    8000538c:	ffffd097          	auipc	ra,0xffffd
    80005390:	6cc080e7          	jalr	1740(ra) # 80002a58 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80005394:	0209b783          	ld	a5,32(s3)
    80005398:	0087b503          	ld	a0,8(a5)
    8000539c:	00001097          	auipc	ra,0x1
    800053a0:	bbc080e7          	jalr	-1092(ra) # 80005f58 <_ZN9BufferCPP6getCntEv>
    800053a4:	fca04ae3          	bgtz	a0,80005378 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    800053a8:	01093503          	ld	a0,16(s2)
    800053ac:	ffffd097          	auipc	ra,0xffffd
    800053b0:	600080e7          	jalr	1536(ra) # 800029ac <_ZN9Semaphore6signalEv>
}
    800053b4:	02813083          	ld	ra,40(sp)
    800053b8:	02013403          	ld	s0,32(sp)
    800053bc:	01813483          	ld	s1,24(sp)
    800053c0:	01013903          	ld	s2,16(sp)
    800053c4:	00813983          	ld	s3,8(sp)
    800053c8:	00013a03          	ld	s4,0(sp)
    800053cc:	03010113          	addi	sp,sp,48
    800053d0:	00008067          	ret

00000000800053d4 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    800053d4:	f8010113          	addi	sp,sp,-128
    800053d8:	06113c23          	sd	ra,120(sp)
    800053dc:	06813823          	sd	s0,112(sp)
    800053e0:	06913423          	sd	s1,104(sp)
    800053e4:	07213023          	sd	s2,96(sp)
    800053e8:	05313c23          	sd	s3,88(sp)
    800053ec:	05413823          	sd	s4,80(sp)
    800053f0:	05513423          	sd	s5,72(sp)
    800053f4:	05613023          	sd	s6,64(sp)
    800053f8:	03713c23          	sd	s7,56(sp)
    800053fc:	03813823          	sd	s8,48(sp)
    80005400:	03913423          	sd	s9,40(sp)
    80005404:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80005408:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    8000540c:	00004517          	auipc	a0,0x4
    80005410:	e1450513          	addi	a0,a0,-492 # 80009220 <CONSOLE_STATUS+0x210>
    80005414:	00000097          	auipc	ra,0x0
    80005418:	604080e7          	jalr	1540(ra) # 80005a18 <_Z11printStringPKc>
    getString(input, 30);
    8000541c:	01e00593          	li	a1,30
    80005420:	f8040493          	addi	s1,s0,-128
    80005424:	00048513          	mv	a0,s1
    80005428:	00000097          	auipc	ra,0x0
    8000542c:	678080e7          	jalr	1656(ra) # 80005aa0 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80005430:	00048513          	mv	a0,s1
    80005434:	00000097          	auipc	ra,0x0
    80005438:	744080e7          	jalr	1860(ra) # 80005b78 <_Z11stringToIntPKc>
    8000543c:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80005440:	00004517          	auipc	a0,0x4
    80005444:	e0050513          	addi	a0,a0,-512 # 80009240 <CONSOLE_STATUS+0x230>
    80005448:	00000097          	auipc	ra,0x0
    8000544c:	5d0080e7          	jalr	1488(ra) # 80005a18 <_Z11printStringPKc>
    getString(input, 30);
    80005450:	01e00593          	li	a1,30
    80005454:	00048513          	mv	a0,s1
    80005458:	00000097          	auipc	ra,0x0
    8000545c:	648080e7          	jalr	1608(ra) # 80005aa0 <_Z9getStringPci>
    n = stringToInt(input);
    80005460:	00048513          	mv	a0,s1
    80005464:	00000097          	auipc	ra,0x0
    80005468:	714080e7          	jalr	1812(ra) # 80005b78 <_Z11stringToIntPKc>
    8000546c:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80005470:	00004517          	auipc	a0,0x4
    80005474:	df050513          	addi	a0,a0,-528 # 80009260 <CONSOLE_STATUS+0x250>
    80005478:	00000097          	auipc	ra,0x0
    8000547c:	5a0080e7          	jalr	1440(ra) # 80005a18 <_Z11printStringPKc>
    80005480:	00000613          	li	a2,0
    80005484:	00a00593          	li	a1,10
    80005488:	00090513          	mv	a0,s2
    8000548c:	00000097          	auipc	ra,0x0
    80005490:	73c080e7          	jalr	1852(ra) # 80005bc8 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005494:	00004517          	auipc	a0,0x4
    80005498:	de450513          	addi	a0,a0,-540 # 80009278 <CONSOLE_STATUS+0x268>
    8000549c:	00000097          	auipc	ra,0x0
    800054a0:	57c080e7          	jalr	1404(ra) # 80005a18 <_Z11printStringPKc>
    800054a4:	00000613          	li	a2,0
    800054a8:	00a00593          	li	a1,10
    800054ac:	00048513          	mv	a0,s1
    800054b0:	00000097          	auipc	ra,0x0
    800054b4:	718080e7          	jalr	1816(ra) # 80005bc8 <_Z8printIntiii>
    printString(".\n");
    800054b8:	00004517          	auipc	a0,0x4
    800054bc:	dd850513          	addi	a0,a0,-552 # 80009290 <CONSOLE_STATUS+0x280>
    800054c0:	00000097          	auipc	ra,0x0
    800054c4:	558080e7          	jalr	1368(ra) # 80005a18 <_Z11printStringPKc>
    if(threadNum > n) {
    800054c8:	0324c463          	blt	s1,s2,800054f0 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    800054cc:	03205c63          	blez	s2,80005504 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    800054d0:	03800513          	li	a0,56
    800054d4:	ffffd097          	auipc	ra,0xffffd
    800054d8:	180080e7          	jalr	384(ra) # 80002654 <_Znwm>
    800054dc:	00050a93          	mv	s5,a0
    800054e0:	00048593          	mv	a1,s1
    800054e4:	00001097          	auipc	ra,0x1
    800054e8:	804080e7          	jalr	-2044(ra) # 80005ce8 <_ZN9BufferCPPC1Ei>
    800054ec:	0300006f          	j	8000551c <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800054f0:	00004517          	auipc	a0,0x4
    800054f4:	da850513          	addi	a0,a0,-600 # 80009298 <CONSOLE_STATUS+0x288>
    800054f8:	00000097          	auipc	ra,0x0
    800054fc:	520080e7          	jalr	1312(ra) # 80005a18 <_Z11printStringPKc>
        return;
    80005500:	0140006f          	j	80005514 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80005504:	00004517          	auipc	a0,0x4
    80005508:	dd450513          	addi	a0,a0,-556 # 800092d8 <CONSOLE_STATUS+0x2c8>
    8000550c:	00000097          	auipc	ra,0x0
    80005510:	50c080e7          	jalr	1292(ra) # 80005a18 <_Z11printStringPKc>
        return;
    80005514:	000b8113          	mv	sp,s7
    80005518:	2380006f          	j	80005750 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    8000551c:	01000513          	li	a0,16
    80005520:	ffffd097          	auipc	ra,0xffffd
    80005524:	134080e7          	jalr	308(ra) # 80002654 <_Znwm>
    80005528:	00050493          	mv	s1,a0
    8000552c:	00000593          	li	a1,0
    80005530:	ffffd097          	auipc	ra,0xffffd
    80005534:	418080e7          	jalr	1048(ra) # 80002948 <_ZN9SemaphoreC1Ej>
    80005538:	00006797          	auipc	a5,0x6
    8000553c:	6e97bc23          	sd	s1,1784(a5) # 8000bc30 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80005540:	00391793          	slli	a5,s2,0x3
    80005544:	00f78793          	addi	a5,a5,15
    80005548:	ff07f793          	andi	a5,a5,-16
    8000554c:	40f10133          	sub	sp,sp,a5
    80005550:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80005554:	0019071b          	addiw	a4,s2,1
    80005558:	00171793          	slli	a5,a4,0x1
    8000555c:	00e787b3          	add	a5,a5,a4
    80005560:	00379793          	slli	a5,a5,0x3
    80005564:	00f78793          	addi	a5,a5,15
    80005568:	ff07f793          	andi	a5,a5,-16
    8000556c:	40f10133          	sub	sp,sp,a5
    80005570:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80005574:	00191c13          	slli	s8,s2,0x1
    80005578:	012c07b3          	add	a5,s8,s2
    8000557c:	00379793          	slli	a5,a5,0x3
    80005580:	00fa07b3          	add	a5,s4,a5
    80005584:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80005588:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    8000558c:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80005590:	02800513          	li	a0,40
    80005594:	ffffd097          	auipc	ra,0xffffd
    80005598:	0c0080e7          	jalr	192(ra) # 80002654 <_Znwm>
    8000559c:	00050b13          	mv	s6,a0
    800055a0:	012c0c33          	add	s8,s8,s2
    800055a4:	003c1c13          	slli	s8,s8,0x3
    800055a8:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    800055ac:	ffffd097          	auipc	ra,0xffffd
    800055b0:	320080e7          	jalr	800(ra) # 800028cc <_ZN6ThreadC1Ev>
    800055b4:	00006797          	auipc	a5,0x6
    800055b8:	47478793          	addi	a5,a5,1140 # 8000ba28 <_ZTV12ConsumerSync+0x10>
    800055bc:	00fb3023          	sd	a5,0(s6)
    800055c0:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    800055c4:	000b0513          	mv	a0,s6
    800055c8:	ffffd097          	auipc	ra,0xffffd
    800055cc:	23c080e7          	jalr	572(ra) # 80002804 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    800055d0:	00000493          	li	s1,0
    800055d4:	0380006f          	j	8000560c <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    800055d8:	00006797          	auipc	a5,0x6
    800055dc:	42878793          	addi	a5,a5,1064 # 8000ba00 <_ZTV12ProducerSync+0x10>
    800055e0:	00fcb023          	sd	a5,0(s9)
    800055e4:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    800055e8:	00349793          	slli	a5,s1,0x3
    800055ec:	00f987b3          	add	a5,s3,a5
    800055f0:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    800055f4:	00349793          	slli	a5,s1,0x3
    800055f8:	00f987b3          	add	a5,s3,a5
    800055fc:	0007b503          	ld	a0,0(a5)
    80005600:	ffffd097          	auipc	ra,0xffffd
    80005604:	204080e7          	jalr	516(ra) # 80002804 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005608:	0014849b          	addiw	s1,s1,1
    8000560c:	0b24d063          	bge	s1,s2,800056ac <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    80005610:	00149793          	slli	a5,s1,0x1
    80005614:	009787b3          	add	a5,a5,s1
    80005618:	00379793          	slli	a5,a5,0x3
    8000561c:	00fa07b3          	add	a5,s4,a5
    80005620:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80005624:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80005628:	00006717          	auipc	a4,0x6
    8000562c:	60873703          	ld	a4,1544(a4) # 8000bc30 <_ZL10waitForAll>
    80005630:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80005634:	02905863          	blez	s1,80005664 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80005638:	02800513          	li	a0,40
    8000563c:	ffffd097          	auipc	ra,0xffffd
    80005640:	018080e7          	jalr	24(ra) # 80002654 <_Znwm>
    80005644:	00050c93          	mv	s9,a0
    80005648:	00149c13          	slli	s8,s1,0x1
    8000564c:	009c0c33          	add	s8,s8,s1
    80005650:	003c1c13          	slli	s8,s8,0x3
    80005654:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005658:	ffffd097          	auipc	ra,0xffffd
    8000565c:	274080e7          	jalr	628(ra) # 800028cc <_ZN6ThreadC1Ev>
    80005660:	f79ff06f          	j	800055d8 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80005664:	02800513          	li	a0,40
    80005668:	ffffd097          	auipc	ra,0xffffd
    8000566c:	fec080e7          	jalr	-20(ra) # 80002654 <_Znwm>
    80005670:	00050c93          	mv	s9,a0
    80005674:	00149c13          	slli	s8,s1,0x1
    80005678:	009c0c33          	add	s8,s8,s1
    8000567c:	003c1c13          	slli	s8,s8,0x3
    80005680:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80005684:	ffffd097          	auipc	ra,0xffffd
    80005688:	248080e7          	jalr	584(ra) # 800028cc <_ZN6ThreadC1Ev>
    8000568c:	00006797          	auipc	a5,0x6
    80005690:	34c78793          	addi	a5,a5,844 # 8000b9d8 <_ZTV16ProducerKeyboard+0x10>
    80005694:	00fcb023          	sd	a5,0(s9)
    80005698:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    8000569c:	00349793          	slli	a5,s1,0x3
    800056a0:	00f987b3          	add	a5,s3,a5
    800056a4:	0197b023          	sd	s9,0(a5)
    800056a8:	f4dff06f          	j	800055f4 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    800056ac:	ffffd097          	auipc	ra,0xffffd
    800056b0:	1bc080e7          	jalr	444(ra) # 80002868 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    800056b4:	00000493          	li	s1,0
    800056b8:	00994e63          	blt	s2,s1,800056d4 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    800056bc:	00006517          	auipc	a0,0x6
    800056c0:	57453503          	ld	a0,1396(a0) # 8000bc30 <_ZL10waitForAll>
    800056c4:	ffffd097          	auipc	ra,0xffffd
    800056c8:	2bc080e7          	jalr	700(ra) # 80002980 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    800056cc:	0014849b          	addiw	s1,s1,1
    800056d0:	fe9ff06f          	j	800056b8 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    800056d4:	00000493          	li	s1,0
    800056d8:	0080006f          	j	800056e0 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    800056dc:	0014849b          	addiw	s1,s1,1
    800056e0:	0324d263          	bge	s1,s2,80005704 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    800056e4:	00349793          	slli	a5,s1,0x3
    800056e8:	00f987b3          	add	a5,s3,a5
    800056ec:	0007b503          	ld	a0,0(a5)
    800056f0:	fe0506e3          	beqz	a0,800056dc <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    800056f4:	00053783          	ld	a5,0(a0)
    800056f8:	0087b783          	ld	a5,8(a5)
    800056fc:	000780e7          	jalr	a5
    80005700:	fddff06f          	j	800056dc <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80005704:	000b0a63          	beqz	s6,80005718 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80005708:	000b3783          	ld	a5,0(s6)
    8000570c:	0087b783          	ld	a5,8(a5)
    80005710:	000b0513          	mv	a0,s6
    80005714:	000780e7          	jalr	a5
    delete waitForAll;
    80005718:	00006517          	auipc	a0,0x6
    8000571c:	51853503          	ld	a0,1304(a0) # 8000bc30 <_ZL10waitForAll>
    80005720:	00050863          	beqz	a0,80005730 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80005724:	00053783          	ld	a5,0(a0)
    80005728:	0087b783          	ld	a5,8(a5)
    8000572c:	000780e7          	jalr	a5
    delete buffer;
    80005730:	000a8e63          	beqz	s5,8000574c <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80005734:	000a8513          	mv	a0,s5
    80005738:	00001097          	auipc	ra,0x1
    8000573c:	8a8080e7          	jalr	-1880(ra) # 80005fe0 <_ZN9BufferCPPD1Ev>
    80005740:	000a8513          	mv	a0,s5
    80005744:	ffffd097          	auipc	ra,0xffffd
    80005748:	f60080e7          	jalr	-160(ra) # 800026a4 <_ZdlPv>
    8000574c:	000b8113          	mv	sp,s7

}
    80005750:	f8040113          	addi	sp,s0,-128
    80005754:	07813083          	ld	ra,120(sp)
    80005758:	07013403          	ld	s0,112(sp)
    8000575c:	06813483          	ld	s1,104(sp)
    80005760:	06013903          	ld	s2,96(sp)
    80005764:	05813983          	ld	s3,88(sp)
    80005768:	05013a03          	ld	s4,80(sp)
    8000576c:	04813a83          	ld	s5,72(sp)
    80005770:	04013b03          	ld	s6,64(sp)
    80005774:	03813b83          	ld	s7,56(sp)
    80005778:	03013c03          	ld	s8,48(sp)
    8000577c:	02813c83          	ld	s9,40(sp)
    80005780:	08010113          	addi	sp,sp,128
    80005784:	00008067          	ret
    80005788:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    8000578c:	000a8513          	mv	a0,s5
    80005790:	ffffd097          	auipc	ra,0xffffd
    80005794:	f14080e7          	jalr	-236(ra) # 800026a4 <_ZdlPv>
    80005798:	00048513          	mv	a0,s1
    8000579c:	00007097          	auipc	ra,0x7
    800057a0:	57c080e7          	jalr	1404(ra) # 8000cd18 <_Unwind_Resume>
    800057a4:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    800057a8:	00048513          	mv	a0,s1
    800057ac:	ffffd097          	auipc	ra,0xffffd
    800057b0:	ef8080e7          	jalr	-264(ra) # 800026a4 <_ZdlPv>
    800057b4:	00090513          	mv	a0,s2
    800057b8:	00007097          	auipc	ra,0x7
    800057bc:	560080e7          	jalr	1376(ra) # 8000cd18 <_Unwind_Resume>
    800057c0:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    800057c4:	000b0513          	mv	a0,s6
    800057c8:	ffffd097          	auipc	ra,0xffffd
    800057cc:	edc080e7          	jalr	-292(ra) # 800026a4 <_ZdlPv>
    800057d0:	00048513          	mv	a0,s1
    800057d4:	00007097          	auipc	ra,0x7
    800057d8:	544080e7          	jalr	1348(ra) # 8000cd18 <_Unwind_Resume>
    800057dc:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    800057e0:	000c8513          	mv	a0,s9
    800057e4:	ffffd097          	auipc	ra,0xffffd
    800057e8:	ec0080e7          	jalr	-320(ra) # 800026a4 <_ZdlPv>
    800057ec:	00048513          	mv	a0,s1
    800057f0:	00007097          	auipc	ra,0x7
    800057f4:	528080e7          	jalr	1320(ra) # 8000cd18 <_Unwind_Resume>
    800057f8:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    800057fc:	000c8513          	mv	a0,s9
    80005800:	ffffd097          	auipc	ra,0xffffd
    80005804:	ea4080e7          	jalr	-348(ra) # 800026a4 <_ZdlPv>
    80005808:	00048513          	mv	a0,s1
    8000580c:	00007097          	auipc	ra,0x7
    80005810:	50c080e7          	jalr	1292(ra) # 8000cd18 <_Unwind_Resume>

0000000080005814 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80005814:	ff010113          	addi	sp,sp,-16
    80005818:	00113423          	sd	ra,8(sp)
    8000581c:	00813023          	sd	s0,0(sp)
    80005820:	01010413          	addi	s0,sp,16
    80005824:	00006797          	auipc	a5,0x6
    80005828:	20478793          	addi	a5,a5,516 # 8000ba28 <_ZTV12ConsumerSync+0x10>
    8000582c:	00f53023          	sd	a5,0(a0)
    80005830:	ffffd097          	auipc	ra,0xffffd
    80005834:	d78080e7          	jalr	-648(ra) # 800025a8 <_ZN6ThreadD1Ev>
    80005838:	00813083          	ld	ra,8(sp)
    8000583c:	00013403          	ld	s0,0(sp)
    80005840:	01010113          	addi	sp,sp,16
    80005844:	00008067          	ret

0000000080005848 <_ZN12ConsumerSyncD0Ev>:
    80005848:	fe010113          	addi	sp,sp,-32
    8000584c:	00113c23          	sd	ra,24(sp)
    80005850:	00813823          	sd	s0,16(sp)
    80005854:	00913423          	sd	s1,8(sp)
    80005858:	02010413          	addi	s0,sp,32
    8000585c:	00050493          	mv	s1,a0
    80005860:	00006797          	auipc	a5,0x6
    80005864:	1c878793          	addi	a5,a5,456 # 8000ba28 <_ZTV12ConsumerSync+0x10>
    80005868:	00f53023          	sd	a5,0(a0)
    8000586c:	ffffd097          	auipc	ra,0xffffd
    80005870:	d3c080e7          	jalr	-708(ra) # 800025a8 <_ZN6ThreadD1Ev>
    80005874:	00048513          	mv	a0,s1
    80005878:	ffffd097          	auipc	ra,0xffffd
    8000587c:	e2c080e7          	jalr	-468(ra) # 800026a4 <_ZdlPv>
    80005880:	01813083          	ld	ra,24(sp)
    80005884:	01013403          	ld	s0,16(sp)
    80005888:	00813483          	ld	s1,8(sp)
    8000588c:	02010113          	addi	sp,sp,32
    80005890:	00008067          	ret

0000000080005894 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80005894:	ff010113          	addi	sp,sp,-16
    80005898:	00113423          	sd	ra,8(sp)
    8000589c:	00813023          	sd	s0,0(sp)
    800058a0:	01010413          	addi	s0,sp,16
    800058a4:	00006797          	auipc	a5,0x6
    800058a8:	15c78793          	addi	a5,a5,348 # 8000ba00 <_ZTV12ProducerSync+0x10>
    800058ac:	00f53023          	sd	a5,0(a0)
    800058b0:	ffffd097          	auipc	ra,0xffffd
    800058b4:	cf8080e7          	jalr	-776(ra) # 800025a8 <_ZN6ThreadD1Ev>
    800058b8:	00813083          	ld	ra,8(sp)
    800058bc:	00013403          	ld	s0,0(sp)
    800058c0:	01010113          	addi	sp,sp,16
    800058c4:	00008067          	ret

00000000800058c8 <_ZN12ProducerSyncD0Ev>:
    800058c8:	fe010113          	addi	sp,sp,-32
    800058cc:	00113c23          	sd	ra,24(sp)
    800058d0:	00813823          	sd	s0,16(sp)
    800058d4:	00913423          	sd	s1,8(sp)
    800058d8:	02010413          	addi	s0,sp,32
    800058dc:	00050493          	mv	s1,a0
    800058e0:	00006797          	auipc	a5,0x6
    800058e4:	12078793          	addi	a5,a5,288 # 8000ba00 <_ZTV12ProducerSync+0x10>
    800058e8:	00f53023          	sd	a5,0(a0)
    800058ec:	ffffd097          	auipc	ra,0xffffd
    800058f0:	cbc080e7          	jalr	-836(ra) # 800025a8 <_ZN6ThreadD1Ev>
    800058f4:	00048513          	mv	a0,s1
    800058f8:	ffffd097          	auipc	ra,0xffffd
    800058fc:	dac080e7          	jalr	-596(ra) # 800026a4 <_ZdlPv>
    80005900:	01813083          	ld	ra,24(sp)
    80005904:	01013403          	ld	s0,16(sp)
    80005908:	00813483          	ld	s1,8(sp)
    8000590c:	02010113          	addi	sp,sp,32
    80005910:	00008067          	ret

0000000080005914 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80005914:	ff010113          	addi	sp,sp,-16
    80005918:	00113423          	sd	ra,8(sp)
    8000591c:	00813023          	sd	s0,0(sp)
    80005920:	01010413          	addi	s0,sp,16
    80005924:	00006797          	auipc	a5,0x6
    80005928:	0b478793          	addi	a5,a5,180 # 8000b9d8 <_ZTV16ProducerKeyboard+0x10>
    8000592c:	00f53023          	sd	a5,0(a0)
    80005930:	ffffd097          	auipc	ra,0xffffd
    80005934:	c78080e7          	jalr	-904(ra) # 800025a8 <_ZN6ThreadD1Ev>
    80005938:	00813083          	ld	ra,8(sp)
    8000593c:	00013403          	ld	s0,0(sp)
    80005940:	01010113          	addi	sp,sp,16
    80005944:	00008067          	ret

0000000080005948 <_ZN16ProducerKeyboardD0Ev>:
    80005948:	fe010113          	addi	sp,sp,-32
    8000594c:	00113c23          	sd	ra,24(sp)
    80005950:	00813823          	sd	s0,16(sp)
    80005954:	00913423          	sd	s1,8(sp)
    80005958:	02010413          	addi	s0,sp,32
    8000595c:	00050493          	mv	s1,a0
    80005960:	00006797          	auipc	a5,0x6
    80005964:	07878793          	addi	a5,a5,120 # 8000b9d8 <_ZTV16ProducerKeyboard+0x10>
    80005968:	00f53023          	sd	a5,0(a0)
    8000596c:	ffffd097          	auipc	ra,0xffffd
    80005970:	c3c080e7          	jalr	-964(ra) # 800025a8 <_ZN6ThreadD1Ev>
    80005974:	00048513          	mv	a0,s1
    80005978:	ffffd097          	auipc	ra,0xffffd
    8000597c:	d2c080e7          	jalr	-724(ra) # 800026a4 <_ZdlPv>
    80005980:	01813083          	ld	ra,24(sp)
    80005984:	01013403          	ld	s0,16(sp)
    80005988:	00813483          	ld	s1,8(sp)
    8000598c:	02010113          	addi	sp,sp,32
    80005990:	00008067          	ret

0000000080005994 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80005994:	ff010113          	addi	sp,sp,-16
    80005998:	00113423          	sd	ra,8(sp)
    8000599c:	00813023          	sd	s0,0(sp)
    800059a0:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    800059a4:	02053583          	ld	a1,32(a0)
    800059a8:	fffff097          	auipc	ra,0xfffff
    800059ac:	7e4080e7          	jalr	2020(ra) # 8000518c <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    800059b0:	00813083          	ld	ra,8(sp)
    800059b4:	00013403          	ld	s0,0(sp)
    800059b8:	01010113          	addi	sp,sp,16
    800059bc:	00008067          	ret

00000000800059c0 <_ZN12ProducerSync3runEv>:
    void run() override {
    800059c0:	ff010113          	addi	sp,sp,-16
    800059c4:	00113423          	sd	ra,8(sp)
    800059c8:	00813023          	sd	s0,0(sp)
    800059cc:	01010413          	addi	s0,sp,16
        producer(td);
    800059d0:	02053583          	ld	a1,32(a0)
    800059d4:	00000097          	auipc	ra,0x0
    800059d8:	878080e7          	jalr	-1928(ra) # 8000524c <_ZN12ProducerSync8producerEPv>
    }
    800059dc:	00813083          	ld	ra,8(sp)
    800059e0:	00013403          	ld	s0,0(sp)
    800059e4:	01010113          	addi	sp,sp,16
    800059e8:	00008067          	ret

00000000800059ec <_ZN12ConsumerSync3runEv>:
    void run() override {
    800059ec:	ff010113          	addi	sp,sp,-16
    800059f0:	00113423          	sd	ra,8(sp)
    800059f4:	00813023          	sd	s0,0(sp)
    800059f8:	01010413          	addi	s0,sp,16
        consumer(td);
    800059fc:	02053583          	ld	a1,32(a0)
    80005a00:	00000097          	auipc	ra,0x0
    80005a04:	8e0080e7          	jalr	-1824(ra) # 800052e0 <_ZN12ConsumerSync8consumerEPv>
    }
    80005a08:	00813083          	ld	ra,8(sp)
    80005a0c:	00013403          	ld	s0,0(sp)
    80005a10:	01010113          	addi	sp,sp,16
    80005a14:	00008067          	ret

0000000080005a18 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80005a18:	fe010113          	addi	sp,sp,-32
    80005a1c:	00113c23          	sd	ra,24(sp)
    80005a20:	00813823          	sd	s0,16(sp)
    80005a24:	00913423          	sd	s1,8(sp)
    80005a28:	02010413          	addi	s0,sp,32
    80005a2c:	00050493          	mv	s1,a0
    LOCK();
    80005a30:	00100613          	li	a2,1
    80005a34:	00000593          	li	a1,0
    80005a38:	00006517          	auipc	a0,0x6
    80005a3c:	20050513          	addi	a0,a0,512 # 8000bc38 <lockPrint>
    80005a40:	ffffb097          	auipc	ra,0xffffb
    80005a44:	7e4080e7          	jalr	2020(ra) # 80001224 <copy_and_swap>
    80005a48:	00050863          	beqz	a0,80005a58 <_Z11printStringPKc+0x40>
    80005a4c:	ffffc097          	auipc	ra,0xffffc
    80005a50:	9dc080e7          	jalr	-1572(ra) # 80001428 <_Z15thread_dispatchv>
    80005a54:	fddff06f          	j	80005a30 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80005a58:	0004c503          	lbu	a0,0(s1)
    80005a5c:	00050a63          	beqz	a0,80005a70 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80005a60:	ffffc097          	auipc	ra,0xffffc
    80005a64:	b30080e7          	jalr	-1232(ra) # 80001590 <_Z4putcc>
        string++;
    80005a68:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80005a6c:	fedff06f          	j	80005a58 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80005a70:	00000613          	li	a2,0
    80005a74:	00100593          	li	a1,1
    80005a78:	00006517          	auipc	a0,0x6
    80005a7c:	1c050513          	addi	a0,a0,448 # 8000bc38 <lockPrint>
    80005a80:	ffffb097          	auipc	ra,0xffffb
    80005a84:	7a4080e7          	jalr	1956(ra) # 80001224 <copy_and_swap>
    80005a88:	fe0514e3          	bnez	a0,80005a70 <_Z11printStringPKc+0x58>
}
    80005a8c:	01813083          	ld	ra,24(sp)
    80005a90:	01013403          	ld	s0,16(sp)
    80005a94:	00813483          	ld	s1,8(sp)
    80005a98:	02010113          	addi	sp,sp,32
    80005a9c:	00008067          	ret

0000000080005aa0 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80005aa0:	fd010113          	addi	sp,sp,-48
    80005aa4:	02113423          	sd	ra,40(sp)
    80005aa8:	02813023          	sd	s0,32(sp)
    80005aac:	00913c23          	sd	s1,24(sp)
    80005ab0:	01213823          	sd	s2,16(sp)
    80005ab4:	01313423          	sd	s3,8(sp)
    80005ab8:	01413023          	sd	s4,0(sp)
    80005abc:	03010413          	addi	s0,sp,48
    80005ac0:	00050993          	mv	s3,a0
    80005ac4:	00058a13          	mv	s4,a1
    LOCK();
    80005ac8:	00100613          	li	a2,1
    80005acc:	00000593          	li	a1,0
    80005ad0:	00006517          	auipc	a0,0x6
    80005ad4:	16850513          	addi	a0,a0,360 # 8000bc38 <lockPrint>
    80005ad8:	ffffb097          	auipc	ra,0xffffb
    80005adc:	74c080e7          	jalr	1868(ra) # 80001224 <copy_and_swap>
    80005ae0:	00050863          	beqz	a0,80005af0 <_Z9getStringPci+0x50>
    80005ae4:	ffffc097          	auipc	ra,0xffffc
    80005ae8:	944080e7          	jalr	-1724(ra) # 80001428 <_Z15thread_dispatchv>
    80005aec:	fddff06f          	j	80005ac8 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80005af0:	00000913          	li	s2,0
    80005af4:	00090493          	mv	s1,s2
    80005af8:	0019091b          	addiw	s2,s2,1
    80005afc:	03495a63          	bge	s2,s4,80005b30 <_Z9getStringPci+0x90>
        cc = getc();
    80005b00:	ffffc097          	auipc	ra,0xffffc
    80005b04:	a68080e7          	jalr	-1432(ra) # 80001568 <_Z4getcv>
        if(cc < 1)
    80005b08:	02050463          	beqz	a0,80005b30 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80005b0c:	009984b3          	add	s1,s3,s1
    80005b10:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80005b14:	00a00793          	li	a5,10
    80005b18:	00f50a63          	beq	a0,a5,80005b2c <_Z9getStringPci+0x8c>
    80005b1c:	00d00793          	li	a5,13
    80005b20:	fcf51ae3          	bne	a0,a5,80005af4 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80005b24:	00090493          	mv	s1,s2
    80005b28:	0080006f          	j	80005b30 <_Z9getStringPci+0x90>
    80005b2c:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80005b30:	009984b3          	add	s1,s3,s1
    80005b34:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80005b38:	00000613          	li	a2,0
    80005b3c:	00100593          	li	a1,1
    80005b40:	00006517          	auipc	a0,0x6
    80005b44:	0f850513          	addi	a0,a0,248 # 8000bc38 <lockPrint>
    80005b48:	ffffb097          	auipc	ra,0xffffb
    80005b4c:	6dc080e7          	jalr	1756(ra) # 80001224 <copy_and_swap>
    80005b50:	fe0514e3          	bnez	a0,80005b38 <_Z9getStringPci+0x98>
    return buf;
}
    80005b54:	00098513          	mv	a0,s3
    80005b58:	02813083          	ld	ra,40(sp)
    80005b5c:	02013403          	ld	s0,32(sp)
    80005b60:	01813483          	ld	s1,24(sp)
    80005b64:	01013903          	ld	s2,16(sp)
    80005b68:	00813983          	ld	s3,8(sp)
    80005b6c:	00013a03          	ld	s4,0(sp)
    80005b70:	03010113          	addi	sp,sp,48
    80005b74:	00008067          	ret

0000000080005b78 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80005b78:	ff010113          	addi	sp,sp,-16
    80005b7c:	00813423          	sd	s0,8(sp)
    80005b80:	01010413          	addi	s0,sp,16
    80005b84:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80005b88:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80005b8c:	0006c603          	lbu	a2,0(a3)
    80005b90:	fd06071b          	addiw	a4,a2,-48
    80005b94:	0ff77713          	andi	a4,a4,255
    80005b98:	00900793          	li	a5,9
    80005b9c:	02e7e063          	bltu	a5,a4,80005bbc <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80005ba0:	0025179b          	slliw	a5,a0,0x2
    80005ba4:	00a787bb          	addw	a5,a5,a0
    80005ba8:	0017979b          	slliw	a5,a5,0x1
    80005bac:	00168693          	addi	a3,a3,1
    80005bb0:	00c787bb          	addw	a5,a5,a2
    80005bb4:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80005bb8:	fd5ff06f          	j	80005b8c <_Z11stringToIntPKc+0x14>
    return n;
}
    80005bbc:	00813403          	ld	s0,8(sp)
    80005bc0:	01010113          	addi	sp,sp,16
    80005bc4:	00008067          	ret

0000000080005bc8 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80005bc8:	fc010113          	addi	sp,sp,-64
    80005bcc:	02113c23          	sd	ra,56(sp)
    80005bd0:	02813823          	sd	s0,48(sp)
    80005bd4:	02913423          	sd	s1,40(sp)
    80005bd8:	03213023          	sd	s2,32(sp)
    80005bdc:	01313c23          	sd	s3,24(sp)
    80005be0:	04010413          	addi	s0,sp,64
    80005be4:	00050493          	mv	s1,a0
    80005be8:	00058913          	mv	s2,a1
    80005bec:	00060993          	mv	s3,a2
    LOCK();
    80005bf0:	00100613          	li	a2,1
    80005bf4:	00000593          	li	a1,0
    80005bf8:	00006517          	auipc	a0,0x6
    80005bfc:	04050513          	addi	a0,a0,64 # 8000bc38 <lockPrint>
    80005c00:	ffffb097          	auipc	ra,0xffffb
    80005c04:	624080e7          	jalr	1572(ra) # 80001224 <copy_and_swap>
    80005c08:	00050863          	beqz	a0,80005c18 <_Z8printIntiii+0x50>
    80005c0c:	ffffc097          	auipc	ra,0xffffc
    80005c10:	81c080e7          	jalr	-2020(ra) # 80001428 <_Z15thread_dispatchv>
    80005c14:	fddff06f          	j	80005bf0 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80005c18:	00098463          	beqz	s3,80005c20 <_Z8printIntiii+0x58>
    80005c1c:	0804c463          	bltz	s1,80005ca4 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80005c20:	0004851b          	sext.w	a0,s1
    neg = 0;
    80005c24:	00000593          	li	a1,0
    }

    i = 0;
    80005c28:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80005c2c:	0009079b          	sext.w	a5,s2
    80005c30:	0325773b          	remuw	a4,a0,s2
    80005c34:	00048613          	mv	a2,s1
    80005c38:	0014849b          	addiw	s1,s1,1
    80005c3c:	02071693          	slli	a3,a4,0x20
    80005c40:	0206d693          	srli	a3,a3,0x20
    80005c44:	00006717          	auipc	a4,0x6
    80005c48:	dfc70713          	addi	a4,a4,-516 # 8000ba40 <digits>
    80005c4c:	00d70733          	add	a4,a4,a3
    80005c50:	00074683          	lbu	a3,0(a4)
    80005c54:	fd040713          	addi	a4,s0,-48
    80005c58:	00c70733          	add	a4,a4,a2
    80005c5c:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80005c60:	0005071b          	sext.w	a4,a0
    80005c64:	0325553b          	divuw	a0,a0,s2
    80005c68:	fcf772e3          	bgeu	a4,a5,80005c2c <_Z8printIntiii+0x64>
    if(neg)
    80005c6c:	00058c63          	beqz	a1,80005c84 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80005c70:	fd040793          	addi	a5,s0,-48
    80005c74:	009784b3          	add	s1,a5,s1
    80005c78:	02d00793          	li	a5,45
    80005c7c:	fef48823          	sb	a5,-16(s1)
    80005c80:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80005c84:	fff4849b          	addiw	s1,s1,-1
    80005c88:	0204c463          	bltz	s1,80005cb0 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80005c8c:	fd040793          	addi	a5,s0,-48
    80005c90:	009787b3          	add	a5,a5,s1
    80005c94:	ff07c503          	lbu	a0,-16(a5)
    80005c98:	ffffc097          	auipc	ra,0xffffc
    80005c9c:	8f8080e7          	jalr	-1800(ra) # 80001590 <_Z4putcc>
    80005ca0:	fe5ff06f          	j	80005c84 <_Z8printIntiii+0xbc>
        x = -xx;
    80005ca4:	4090053b          	negw	a0,s1
        neg = 1;
    80005ca8:	00100593          	li	a1,1
        x = -xx;
    80005cac:	f7dff06f          	j	80005c28 <_Z8printIntiii+0x60>

    UNLOCK();
    80005cb0:	00000613          	li	a2,0
    80005cb4:	00100593          	li	a1,1
    80005cb8:	00006517          	auipc	a0,0x6
    80005cbc:	f8050513          	addi	a0,a0,-128 # 8000bc38 <lockPrint>
    80005cc0:	ffffb097          	auipc	ra,0xffffb
    80005cc4:	564080e7          	jalr	1380(ra) # 80001224 <copy_and_swap>
    80005cc8:	fe0514e3          	bnez	a0,80005cb0 <_Z8printIntiii+0xe8>
    80005ccc:	03813083          	ld	ra,56(sp)
    80005cd0:	03013403          	ld	s0,48(sp)
    80005cd4:	02813483          	ld	s1,40(sp)
    80005cd8:	02013903          	ld	s2,32(sp)
    80005cdc:	01813983          	ld	s3,24(sp)
    80005ce0:	04010113          	addi	sp,sp,64
    80005ce4:	00008067          	ret

0000000080005ce8 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80005ce8:	fd010113          	addi	sp,sp,-48
    80005cec:	02113423          	sd	ra,40(sp)
    80005cf0:	02813023          	sd	s0,32(sp)
    80005cf4:	00913c23          	sd	s1,24(sp)
    80005cf8:	01213823          	sd	s2,16(sp)
    80005cfc:	01313423          	sd	s3,8(sp)
    80005d00:	03010413          	addi	s0,sp,48
    80005d04:	00050493          	mv	s1,a0
    80005d08:	00058913          	mv	s2,a1
    80005d0c:	0015879b          	addiw	a5,a1,1
    80005d10:	0007851b          	sext.w	a0,a5
    80005d14:	00f4a023          	sw	a5,0(s1)
    80005d18:	0004a823          	sw	zero,16(s1)
    80005d1c:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80005d20:	00251513          	slli	a0,a0,0x2
    80005d24:	ffffb097          	auipc	ra,0xffffb
    80005d28:	5ec080e7          	jalr	1516(ra) # 80001310 <_Z9mem_allocm>
    80005d2c:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80005d30:	01000513          	li	a0,16
    80005d34:	ffffd097          	auipc	ra,0xffffd
    80005d38:	920080e7          	jalr	-1760(ra) # 80002654 <_Znwm>
    80005d3c:	00050993          	mv	s3,a0
    80005d40:	00000593          	li	a1,0
    80005d44:	ffffd097          	auipc	ra,0xffffd
    80005d48:	c04080e7          	jalr	-1020(ra) # 80002948 <_ZN9SemaphoreC1Ej>
    80005d4c:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80005d50:	01000513          	li	a0,16
    80005d54:	ffffd097          	auipc	ra,0xffffd
    80005d58:	900080e7          	jalr	-1792(ra) # 80002654 <_Znwm>
    80005d5c:	00050993          	mv	s3,a0
    80005d60:	00090593          	mv	a1,s2
    80005d64:	ffffd097          	auipc	ra,0xffffd
    80005d68:	be4080e7          	jalr	-1052(ra) # 80002948 <_ZN9SemaphoreC1Ej>
    80005d6c:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80005d70:	01000513          	li	a0,16
    80005d74:	ffffd097          	auipc	ra,0xffffd
    80005d78:	8e0080e7          	jalr	-1824(ra) # 80002654 <_Znwm>
    80005d7c:	00050913          	mv	s2,a0
    80005d80:	00100593          	li	a1,1
    80005d84:	ffffd097          	auipc	ra,0xffffd
    80005d88:	bc4080e7          	jalr	-1084(ra) # 80002948 <_ZN9SemaphoreC1Ej>
    80005d8c:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80005d90:	01000513          	li	a0,16
    80005d94:	ffffd097          	auipc	ra,0xffffd
    80005d98:	8c0080e7          	jalr	-1856(ra) # 80002654 <_Znwm>
    80005d9c:	00050913          	mv	s2,a0
    80005da0:	00100593          	li	a1,1
    80005da4:	ffffd097          	auipc	ra,0xffffd
    80005da8:	ba4080e7          	jalr	-1116(ra) # 80002948 <_ZN9SemaphoreC1Ej>
    80005dac:	0324b823          	sd	s2,48(s1)
}
    80005db0:	02813083          	ld	ra,40(sp)
    80005db4:	02013403          	ld	s0,32(sp)
    80005db8:	01813483          	ld	s1,24(sp)
    80005dbc:	01013903          	ld	s2,16(sp)
    80005dc0:	00813983          	ld	s3,8(sp)
    80005dc4:	03010113          	addi	sp,sp,48
    80005dc8:	00008067          	ret
    80005dcc:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80005dd0:	00098513          	mv	a0,s3
    80005dd4:	ffffd097          	auipc	ra,0xffffd
    80005dd8:	8d0080e7          	jalr	-1840(ra) # 800026a4 <_ZdlPv>
    80005ddc:	00048513          	mv	a0,s1
    80005de0:	00007097          	auipc	ra,0x7
    80005de4:	f38080e7          	jalr	-200(ra) # 8000cd18 <_Unwind_Resume>
    80005de8:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80005dec:	00098513          	mv	a0,s3
    80005df0:	ffffd097          	auipc	ra,0xffffd
    80005df4:	8b4080e7          	jalr	-1868(ra) # 800026a4 <_ZdlPv>
    80005df8:	00048513          	mv	a0,s1
    80005dfc:	00007097          	auipc	ra,0x7
    80005e00:	f1c080e7          	jalr	-228(ra) # 8000cd18 <_Unwind_Resume>
    80005e04:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80005e08:	00090513          	mv	a0,s2
    80005e0c:	ffffd097          	auipc	ra,0xffffd
    80005e10:	898080e7          	jalr	-1896(ra) # 800026a4 <_ZdlPv>
    80005e14:	00048513          	mv	a0,s1
    80005e18:	00007097          	auipc	ra,0x7
    80005e1c:	f00080e7          	jalr	-256(ra) # 8000cd18 <_Unwind_Resume>
    80005e20:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80005e24:	00090513          	mv	a0,s2
    80005e28:	ffffd097          	auipc	ra,0xffffd
    80005e2c:	87c080e7          	jalr	-1924(ra) # 800026a4 <_ZdlPv>
    80005e30:	00048513          	mv	a0,s1
    80005e34:	00007097          	auipc	ra,0x7
    80005e38:	ee4080e7          	jalr	-284(ra) # 8000cd18 <_Unwind_Resume>

0000000080005e3c <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80005e3c:	fe010113          	addi	sp,sp,-32
    80005e40:	00113c23          	sd	ra,24(sp)
    80005e44:	00813823          	sd	s0,16(sp)
    80005e48:	00913423          	sd	s1,8(sp)
    80005e4c:	01213023          	sd	s2,0(sp)
    80005e50:	02010413          	addi	s0,sp,32
    80005e54:	00050493          	mv	s1,a0
    80005e58:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80005e5c:	01853503          	ld	a0,24(a0)
    80005e60:	ffffd097          	auipc	ra,0xffffd
    80005e64:	b20080e7          	jalr	-1248(ra) # 80002980 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80005e68:	0304b503          	ld	a0,48(s1)
    80005e6c:	ffffd097          	auipc	ra,0xffffd
    80005e70:	b14080e7          	jalr	-1260(ra) # 80002980 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80005e74:	0084b783          	ld	a5,8(s1)
    80005e78:	0144a703          	lw	a4,20(s1)
    80005e7c:	00271713          	slli	a4,a4,0x2
    80005e80:	00e787b3          	add	a5,a5,a4
    80005e84:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80005e88:	0144a783          	lw	a5,20(s1)
    80005e8c:	0017879b          	addiw	a5,a5,1
    80005e90:	0004a703          	lw	a4,0(s1)
    80005e94:	02e7e7bb          	remw	a5,a5,a4
    80005e98:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80005e9c:	0304b503          	ld	a0,48(s1)
    80005ea0:	ffffd097          	auipc	ra,0xffffd
    80005ea4:	b0c080e7          	jalr	-1268(ra) # 800029ac <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80005ea8:	0204b503          	ld	a0,32(s1)
    80005eac:	ffffd097          	auipc	ra,0xffffd
    80005eb0:	b00080e7          	jalr	-1280(ra) # 800029ac <_ZN9Semaphore6signalEv>

}
    80005eb4:	01813083          	ld	ra,24(sp)
    80005eb8:	01013403          	ld	s0,16(sp)
    80005ebc:	00813483          	ld	s1,8(sp)
    80005ec0:	00013903          	ld	s2,0(sp)
    80005ec4:	02010113          	addi	sp,sp,32
    80005ec8:	00008067          	ret

0000000080005ecc <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80005ecc:	fe010113          	addi	sp,sp,-32
    80005ed0:	00113c23          	sd	ra,24(sp)
    80005ed4:	00813823          	sd	s0,16(sp)
    80005ed8:	00913423          	sd	s1,8(sp)
    80005edc:	01213023          	sd	s2,0(sp)
    80005ee0:	02010413          	addi	s0,sp,32
    80005ee4:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80005ee8:	02053503          	ld	a0,32(a0)
    80005eec:	ffffd097          	auipc	ra,0xffffd
    80005ef0:	a94080e7          	jalr	-1388(ra) # 80002980 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80005ef4:	0284b503          	ld	a0,40(s1)
    80005ef8:	ffffd097          	auipc	ra,0xffffd
    80005efc:	a88080e7          	jalr	-1400(ra) # 80002980 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80005f00:	0084b703          	ld	a4,8(s1)
    80005f04:	0104a783          	lw	a5,16(s1)
    80005f08:	00279693          	slli	a3,a5,0x2
    80005f0c:	00d70733          	add	a4,a4,a3
    80005f10:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80005f14:	0017879b          	addiw	a5,a5,1
    80005f18:	0004a703          	lw	a4,0(s1)
    80005f1c:	02e7e7bb          	remw	a5,a5,a4
    80005f20:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80005f24:	0284b503          	ld	a0,40(s1)
    80005f28:	ffffd097          	auipc	ra,0xffffd
    80005f2c:	a84080e7          	jalr	-1404(ra) # 800029ac <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80005f30:	0184b503          	ld	a0,24(s1)
    80005f34:	ffffd097          	auipc	ra,0xffffd
    80005f38:	a78080e7          	jalr	-1416(ra) # 800029ac <_ZN9Semaphore6signalEv>

    return ret;
}
    80005f3c:	00090513          	mv	a0,s2
    80005f40:	01813083          	ld	ra,24(sp)
    80005f44:	01013403          	ld	s0,16(sp)
    80005f48:	00813483          	ld	s1,8(sp)
    80005f4c:	00013903          	ld	s2,0(sp)
    80005f50:	02010113          	addi	sp,sp,32
    80005f54:	00008067          	ret

0000000080005f58 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80005f58:	fe010113          	addi	sp,sp,-32
    80005f5c:	00113c23          	sd	ra,24(sp)
    80005f60:	00813823          	sd	s0,16(sp)
    80005f64:	00913423          	sd	s1,8(sp)
    80005f68:	01213023          	sd	s2,0(sp)
    80005f6c:	02010413          	addi	s0,sp,32
    80005f70:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80005f74:	02853503          	ld	a0,40(a0)
    80005f78:	ffffd097          	auipc	ra,0xffffd
    80005f7c:	a08080e7          	jalr	-1528(ra) # 80002980 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80005f80:	0304b503          	ld	a0,48(s1)
    80005f84:	ffffd097          	auipc	ra,0xffffd
    80005f88:	9fc080e7          	jalr	-1540(ra) # 80002980 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80005f8c:	0144a783          	lw	a5,20(s1)
    80005f90:	0104a903          	lw	s2,16(s1)
    80005f94:	0327ce63          	blt	a5,s2,80005fd0 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80005f98:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80005f9c:	0304b503          	ld	a0,48(s1)
    80005fa0:	ffffd097          	auipc	ra,0xffffd
    80005fa4:	a0c080e7          	jalr	-1524(ra) # 800029ac <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80005fa8:	0284b503          	ld	a0,40(s1)
    80005fac:	ffffd097          	auipc	ra,0xffffd
    80005fb0:	a00080e7          	jalr	-1536(ra) # 800029ac <_ZN9Semaphore6signalEv>

    return ret;
}
    80005fb4:	00090513          	mv	a0,s2
    80005fb8:	01813083          	ld	ra,24(sp)
    80005fbc:	01013403          	ld	s0,16(sp)
    80005fc0:	00813483          	ld	s1,8(sp)
    80005fc4:	00013903          	ld	s2,0(sp)
    80005fc8:	02010113          	addi	sp,sp,32
    80005fcc:	00008067          	ret
        ret = cap - head + tail;
    80005fd0:	0004a703          	lw	a4,0(s1)
    80005fd4:	4127093b          	subw	s2,a4,s2
    80005fd8:	00f9093b          	addw	s2,s2,a5
    80005fdc:	fc1ff06f          	j	80005f9c <_ZN9BufferCPP6getCntEv+0x44>

0000000080005fe0 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80005fe0:	fe010113          	addi	sp,sp,-32
    80005fe4:	00113c23          	sd	ra,24(sp)
    80005fe8:	00813823          	sd	s0,16(sp)
    80005fec:	00913423          	sd	s1,8(sp)
    80005ff0:	02010413          	addi	s0,sp,32
    80005ff4:	00050493          	mv	s1,a0
    Console::putc('\n');
    80005ff8:	00a00513          	li	a0,10
    80005ffc:	ffffd097          	auipc	ra,0xffffd
    80006000:	a5c080e7          	jalr	-1444(ra) # 80002a58 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80006004:	00003517          	auipc	a0,0x3
    80006008:	40c50513          	addi	a0,a0,1036 # 80009410 <CONSOLE_STATUS+0x400>
    8000600c:	00000097          	auipc	ra,0x0
    80006010:	a0c080e7          	jalr	-1524(ra) # 80005a18 <_Z11printStringPKc>
    while (getCnt()) {
    80006014:	00048513          	mv	a0,s1
    80006018:	00000097          	auipc	ra,0x0
    8000601c:	f40080e7          	jalr	-192(ra) # 80005f58 <_ZN9BufferCPP6getCntEv>
    80006020:	02050c63          	beqz	a0,80006058 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80006024:	0084b783          	ld	a5,8(s1)
    80006028:	0104a703          	lw	a4,16(s1)
    8000602c:	00271713          	slli	a4,a4,0x2
    80006030:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80006034:	0007c503          	lbu	a0,0(a5)
    80006038:	ffffd097          	auipc	ra,0xffffd
    8000603c:	a20080e7          	jalr	-1504(ra) # 80002a58 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80006040:	0104a783          	lw	a5,16(s1)
    80006044:	0017879b          	addiw	a5,a5,1
    80006048:	0004a703          	lw	a4,0(s1)
    8000604c:	02e7e7bb          	remw	a5,a5,a4
    80006050:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80006054:	fc1ff06f          	j	80006014 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80006058:	02100513          	li	a0,33
    8000605c:	ffffd097          	auipc	ra,0xffffd
    80006060:	9fc080e7          	jalr	-1540(ra) # 80002a58 <_ZN7Console4putcEc>
    Console::putc('\n');
    80006064:	00a00513          	li	a0,10
    80006068:	ffffd097          	auipc	ra,0xffffd
    8000606c:	9f0080e7          	jalr	-1552(ra) # 80002a58 <_ZN7Console4putcEc>
    mem_free(buffer);
    80006070:	0084b503          	ld	a0,8(s1)
    80006074:	ffffb097          	auipc	ra,0xffffb
    80006078:	2dc080e7          	jalr	732(ra) # 80001350 <_Z8mem_freePv>
    delete itemAvailable;
    8000607c:	0204b503          	ld	a0,32(s1)
    80006080:	00050863          	beqz	a0,80006090 <_ZN9BufferCPPD1Ev+0xb0>
    80006084:	00053783          	ld	a5,0(a0)
    80006088:	0087b783          	ld	a5,8(a5)
    8000608c:	000780e7          	jalr	a5
    delete spaceAvailable;
    80006090:	0184b503          	ld	a0,24(s1)
    80006094:	00050863          	beqz	a0,800060a4 <_ZN9BufferCPPD1Ev+0xc4>
    80006098:	00053783          	ld	a5,0(a0)
    8000609c:	0087b783          	ld	a5,8(a5)
    800060a0:	000780e7          	jalr	a5
    delete mutexTail;
    800060a4:	0304b503          	ld	a0,48(s1)
    800060a8:	00050863          	beqz	a0,800060b8 <_ZN9BufferCPPD1Ev+0xd8>
    800060ac:	00053783          	ld	a5,0(a0)
    800060b0:	0087b783          	ld	a5,8(a5)
    800060b4:	000780e7          	jalr	a5
    delete mutexHead;
    800060b8:	0284b503          	ld	a0,40(s1)
    800060bc:	00050863          	beqz	a0,800060cc <_ZN9BufferCPPD1Ev+0xec>
    800060c0:	00053783          	ld	a5,0(a0)
    800060c4:	0087b783          	ld	a5,8(a5)
    800060c8:	000780e7          	jalr	a5
}
    800060cc:	01813083          	ld	ra,24(sp)
    800060d0:	01013403          	ld	s0,16(sp)
    800060d4:	00813483          	ld	s1,8(sp)
    800060d8:	02010113          	addi	sp,sp,32
    800060dc:	00008067          	ret

00000000800060e0 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    800060e0:	fe010113          	addi	sp,sp,-32
    800060e4:	00113c23          	sd	ra,24(sp)
    800060e8:	00813823          	sd	s0,16(sp)
    800060ec:	00913423          	sd	s1,8(sp)
    800060f0:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    800060f4:	00003517          	auipc	a0,0x3
    800060f8:	33450513          	addi	a0,a0,820 # 80009428 <CONSOLE_STATUS+0x418>
    800060fc:	00000097          	auipc	ra,0x0
    80006100:	91c080e7          	jalr	-1764(ra) # 80005a18 <_Z11printStringPKc>
    int test = getc() - '0';
    80006104:	ffffb097          	auipc	ra,0xffffb
    80006108:	464080e7          	jalr	1124(ra) # 80001568 <_Z4getcv>
    8000610c:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    80006110:	ffffb097          	auipc	ra,0xffffb
    80006114:	458080e7          	jalr	1112(ra) # 80001568 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80006118:	00700793          	li	a5,7
    8000611c:	1097e263          	bltu	a5,s1,80006220 <_Z8userMainv+0x140>
    80006120:	00249493          	slli	s1,s1,0x2
    80006124:	00003717          	auipc	a4,0x3
    80006128:	55c70713          	addi	a4,a4,1372 # 80009680 <CONSOLE_STATUS+0x670>
    8000612c:	00e484b3          	add	s1,s1,a4
    80006130:	0004a783          	lw	a5,0(s1)
    80006134:	00e787b3          	add	a5,a5,a4
    80006138:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    8000613c:	fffff097          	auipc	ra,0xfffff
    80006140:	f54080e7          	jalr	-172(ra) # 80005090 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80006144:	00003517          	auipc	a0,0x3
    80006148:	30450513          	addi	a0,a0,772 # 80009448 <CONSOLE_STATUS+0x438>
    8000614c:	00000097          	auipc	ra,0x0
    80006150:	8cc080e7          	jalr	-1844(ra) # 80005a18 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80006154:	01813083          	ld	ra,24(sp)
    80006158:	01013403          	ld	s0,16(sp)
    8000615c:	00813483          	ld	s1,8(sp)
    80006160:	02010113          	addi	sp,sp,32
    80006164:	00008067          	ret
            Threads_CPP_API_test();
    80006168:	ffffe097          	auipc	ra,0xffffe
    8000616c:	e08080e7          	jalr	-504(ra) # 80003f70 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80006170:	00003517          	auipc	a0,0x3
    80006174:	31850513          	addi	a0,a0,792 # 80009488 <CONSOLE_STATUS+0x478>
    80006178:	00000097          	auipc	ra,0x0
    8000617c:	8a0080e7          	jalr	-1888(ra) # 80005a18 <_Z11printStringPKc>
            break;
    80006180:	fd5ff06f          	j	80006154 <_Z8userMainv+0x74>
            producerConsumer_C_API();
    80006184:	ffffd097          	auipc	ra,0xffffd
    80006188:	640080e7          	jalr	1600(ra) # 800037c4 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    8000618c:	00003517          	auipc	a0,0x3
    80006190:	33c50513          	addi	a0,a0,828 # 800094c8 <CONSOLE_STATUS+0x4b8>
    80006194:	00000097          	auipc	ra,0x0
    80006198:	884080e7          	jalr	-1916(ra) # 80005a18 <_Z11printStringPKc>
            break;
    8000619c:	fb9ff06f          	j	80006154 <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    800061a0:	fffff097          	auipc	ra,0xfffff
    800061a4:	234080e7          	jalr	564(ra) # 800053d4 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    800061a8:	00003517          	auipc	a0,0x3
    800061ac:	37050513          	addi	a0,a0,880 # 80009518 <CONSOLE_STATUS+0x508>
    800061b0:	00000097          	auipc	ra,0x0
    800061b4:	868080e7          	jalr	-1944(ra) # 80005a18 <_Z11printStringPKc>
            break;
    800061b8:	f9dff06f          	j	80006154 <_Z8userMainv+0x74>
            testSleeping();
    800061bc:	00000097          	auipc	ra,0x0
    800061c0:	11c080e7          	jalr	284(ra) # 800062d8 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    800061c4:	00003517          	auipc	a0,0x3
    800061c8:	3ac50513          	addi	a0,a0,940 # 80009570 <CONSOLE_STATUS+0x560>
    800061cc:	00000097          	auipc	ra,0x0
    800061d0:	84c080e7          	jalr	-1972(ra) # 80005a18 <_Z11printStringPKc>
            break;
    800061d4:	f81ff06f          	j	80006154 <_Z8userMainv+0x74>
            testConsumerProducer();
    800061d8:	ffffe097          	auipc	ra,0xffffe
    800061dc:	258080e7          	jalr	600(ra) # 80004430 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    800061e0:	00003517          	auipc	a0,0x3
    800061e4:	3c050513          	addi	a0,a0,960 # 800095a0 <CONSOLE_STATUS+0x590>
    800061e8:	00000097          	auipc	ra,0x0
    800061ec:	830080e7          	jalr	-2000(ra) # 80005a18 <_Z11printStringPKc>
            break;
    800061f0:	f65ff06f          	j	80006154 <_Z8userMainv+0x74>
            System_Mode_test();
    800061f4:	00000097          	auipc	ra,0x0
    800061f8:	658080e7          	jalr	1624(ra) # 8000684c <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    800061fc:	00003517          	auipc	a0,0x3
    80006200:	3e450513          	addi	a0,a0,996 # 800095e0 <CONSOLE_STATUS+0x5d0>
    80006204:	00000097          	auipc	ra,0x0
    80006208:	814080e7          	jalr	-2028(ra) # 80005a18 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    8000620c:	00003517          	auipc	a0,0x3
    80006210:	3f450513          	addi	a0,a0,1012 # 80009600 <CONSOLE_STATUS+0x5f0>
    80006214:	00000097          	auipc	ra,0x0
    80006218:	804080e7          	jalr	-2044(ra) # 80005a18 <_Z11printStringPKc>
            break;
    8000621c:	f39ff06f          	j	80006154 <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    80006220:	00003517          	auipc	a0,0x3
    80006224:	43850513          	addi	a0,a0,1080 # 80009658 <CONSOLE_STATUS+0x648>
    80006228:	fffff097          	auipc	ra,0xfffff
    8000622c:	7f0080e7          	jalr	2032(ra) # 80005a18 <_Z11printStringPKc>
    80006230:	f25ff06f          	j	80006154 <_Z8userMainv+0x74>

0000000080006234 <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    80006234:	fe010113          	addi	sp,sp,-32
    80006238:	00113c23          	sd	ra,24(sp)
    8000623c:	00813823          	sd	s0,16(sp)
    80006240:	00913423          	sd	s1,8(sp)
    80006244:	01213023          	sd	s2,0(sp)
    80006248:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    8000624c:	00053903          	ld	s2,0(a0)
    int i = 6;
    80006250:	00600493          	li	s1,6
    while (--i > 0) {
    80006254:	fff4849b          	addiw	s1,s1,-1
    80006258:	04905463          	blez	s1,800062a0 <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    8000625c:	00003517          	auipc	a0,0x3
    80006260:	44450513          	addi	a0,a0,1092 # 800096a0 <CONSOLE_STATUS+0x690>
    80006264:	fffff097          	auipc	ra,0xfffff
    80006268:	7b4080e7          	jalr	1972(ra) # 80005a18 <_Z11printStringPKc>
        printInt(sleep_time);
    8000626c:	00000613          	li	a2,0
    80006270:	00a00593          	li	a1,10
    80006274:	0009051b          	sext.w	a0,s2
    80006278:	00000097          	auipc	ra,0x0
    8000627c:	950080e7          	jalr	-1712(ra) # 80005bc8 <_Z8printIntiii>
        printString(" !\n");
    80006280:	00003517          	auipc	a0,0x3
    80006284:	42850513          	addi	a0,a0,1064 # 800096a8 <CONSOLE_STATUS+0x698>
    80006288:	fffff097          	auipc	ra,0xfffff
    8000628c:	790080e7          	jalr	1936(ra) # 80005a18 <_Z11printStringPKc>
        time_sleep(sleep_time);
    80006290:	00090513          	mv	a0,s2
    80006294:	ffffb097          	auipc	ra,0xffffb
    80006298:	1dc080e7          	jalr	476(ra) # 80001470 <_Z10time_sleepm>
    while (--i > 0) {
    8000629c:	fb9ff06f          	j	80006254 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    800062a0:	00a00793          	li	a5,10
    800062a4:	02f95933          	divu	s2,s2,a5
    800062a8:	fff90913          	addi	s2,s2,-1
    800062ac:	00006797          	auipc	a5,0x6
    800062b0:	99478793          	addi	a5,a5,-1644 # 8000bc40 <_ZL8finished>
    800062b4:	01278933          	add	s2,a5,s2
    800062b8:	00100793          	li	a5,1
    800062bc:	00f90023          	sb	a5,0(s2)
}
    800062c0:	01813083          	ld	ra,24(sp)
    800062c4:	01013403          	ld	s0,16(sp)
    800062c8:	00813483          	ld	s1,8(sp)
    800062cc:	00013903          	ld	s2,0(sp)
    800062d0:	02010113          	addi	sp,sp,32
    800062d4:	00008067          	ret

00000000800062d8 <_Z12testSleepingv>:

void testSleeping() {
    800062d8:	fc010113          	addi	sp,sp,-64
    800062dc:	02113c23          	sd	ra,56(sp)
    800062e0:	02813823          	sd	s0,48(sp)
    800062e4:	02913423          	sd	s1,40(sp)
    800062e8:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    800062ec:	00a00793          	li	a5,10
    800062f0:	fcf43823          	sd	a5,-48(s0)
    800062f4:	01400793          	li	a5,20
    800062f8:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    800062fc:	00000493          	li	s1,0
    80006300:	02c0006f          	j	8000632c <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    80006304:	00349793          	slli	a5,s1,0x3
    80006308:	fd040613          	addi	a2,s0,-48
    8000630c:	00f60633          	add	a2,a2,a5
    80006310:	00000597          	auipc	a1,0x0
    80006314:	f2458593          	addi	a1,a1,-220 # 80006234 <_ZL9sleepyRunPv>
    80006318:	fc040513          	addi	a0,s0,-64
    8000631c:	00f50533          	add	a0,a0,a5
    80006320:	ffffb097          	auipc	ra,0xffffb
    80006324:	060080e7          	jalr	96(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80006328:	0014849b          	addiw	s1,s1,1
    8000632c:	00100793          	li	a5,1
    80006330:	fc97dae3          	bge	a5,s1,80006304 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    80006334:	00006797          	auipc	a5,0x6
    80006338:	90c7c783          	lbu	a5,-1780(a5) # 8000bc40 <_ZL8finished>
    8000633c:	fe078ce3          	beqz	a5,80006334 <_Z12testSleepingv+0x5c>
    80006340:	00006797          	auipc	a5,0x6
    80006344:	9017c783          	lbu	a5,-1791(a5) # 8000bc41 <_ZL8finished+0x1>
    80006348:	fe0786e3          	beqz	a5,80006334 <_Z12testSleepingv+0x5c>
}
    8000634c:	03813083          	ld	ra,56(sp)
    80006350:	03013403          	ld	s0,48(sp)
    80006354:	02813483          	ld	s1,40(sp)
    80006358:	04010113          	addi	sp,sp,64
    8000635c:	00008067          	ret

0000000080006360 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80006360:	fe010113          	addi	sp,sp,-32
    80006364:	00113c23          	sd	ra,24(sp)
    80006368:	00813823          	sd	s0,16(sp)
    8000636c:	00913423          	sd	s1,8(sp)
    80006370:	01213023          	sd	s2,0(sp)
    80006374:	02010413          	addi	s0,sp,32
    80006378:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    8000637c:	00100793          	li	a5,1
    80006380:	02a7f863          	bgeu	a5,a0,800063b0 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80006384:	00a00793          	li	a5,10
    80006388:	02f577b3          	remu	a5,a0,a5
    8000638c:	02078e63          	beqz	a5,800063c8 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80006390:	fff48513          	addi	a0,s1,-1
    80006394:	00000097          	auipc	ra,0x0
    80006398:	fcc080e7          	jalr	-52(ra) # 80006360 <_ZL9fibonaccim>
    8000639c:	00050913          	mv	s2,a0
    800063a0:	ffe48513          	addi	a0,s1,-2
    800063a4:	00000097          	auipc	ra,0x0
    800063a8:	fbc080e7          	jalr	-68(ra) # 80006360 <_ZL9fibonaccim>
    800063ac:	00a90533          	add	a0,s2,a0
}
    800063b0:	01813083          	ld	ra,24(sp)
    800063b4:	01013403          	ld	s0,16(sp)
    800063b8:	00813483          	ld	s1,8(sp)
    800063bc:	00013903          	ld	s2,0(sp)
    800063c0:	02010113          	addi	sp,sp,32
    800063c4:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800063c8:	ffffb097          	auipc	ra,0xffffb
    800063cc:	060080e7          	jalr	96(ra) # 80001428 <_Z15thread_dispatchv>
    800063d0:	fc1ff06f          	j	80006390 <_ZL9fibonaccim+0x30>

00000000800063d4 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    800063d4:	fe010113          	addi	sp,sp,-32
    800063d8:	00113c23          	sd	ra,24(sp)
    800063dc:	00813823          	sd	s0,16(sp)
    800063e0:	00913423          	sd	s1,8(sp)
    800063e4:	01213023          	sd	s2,0(sp)
    800063e8:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800063ec:	00a00493          	li	s1,10
    800063f0:	0400006f          	j	80006430 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800063f4:	00003517          	auipc	a0,0x3
    800063f8:	f7450513          	addi	a0,a0,-140 # 80009368 <CONSOLE_STATUS+0x358>
    800063fc:	fffff097          	auipc	ra,0xfffff
    80006400:	61c080e7          	jalr	1564(ra) # 80005a18 <_Z11printStringPKc>
    80006404:	00000613          	li	a2,0
    80006408:	00a00593          	li	a1,10
    8000640c:	00048513          	mv	a0,s1
    80006410:	fffff097          	auipc	ra,0xfffff
    80006414:	7b8080e7          	jalr	1976(ra) # 80005bc8 <_Z8printIntiii>
    80006418:	00003517          	auipc	a0,0x3
    8000641c:	15050513          	addi	a0,a0,336 # 80009568 <CONSOLE_STATUS+0x558>
    80006420:	fffff097          	auipc	ra,0xfffff
    80006424:	5f8080e7          	jalr	1528(ra) # 80005a18 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80006428:	0014849b          	addiw	s1,s1,1
    8000642c:	0ff4f493          	andi	s1,s1,255
    80006430:	00c00793          	li	a5,12
    80006434:	fc97f0e3          	bgeu	a5,s1,800063f4 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80006438:	00003517          	auipc	a0,0x3
    8000643c:	f3850513          	addi	a0,a0,-200 # 80009370 <CONSOLE_STATUS+0x360>
    80006440:	fffff097          	auipc	ra,0xfffff
    80006444:	5d8080e7          	jalr	1496(ra) # 80005a18 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80006448:	00500313          	li	t1,5
    thread_dispatch();
    8000644c:	ffffb097          	auipc	ra,0xffffb
    80006450:	fdc080e7          	jalr	-36(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80006454:	01000513          	li	a0,16
    80006458:	00000097          	auipc	ra,0x0
    8000645c:	f08080e7          	jalr	-248(ra) # 80006360 <_ZL9fibonaccim>
    80006460:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80006464:	00003517          	auipc	a0,0x3
    80006468:	f1c50513          	addi	a0,a0,-228 # 80009380 <CONSOLE_STATUS+0x370>
    8000646c:	fffff097          	auipc	ra,0xfffff
    80006470:	5ac080e7          	jalr	1452(ra) # 80005a18 <_Z11printStringPKc>
    80006474:	00000613          	li	a2,0
    80006478:	00a00593          	li	a1,10
    8000647c:	0009051b          	sext.w	a0,s2
    80006480:	fffff097          	auipc	ra,0xfffff
    80006484:	748080e7          	jalr	1864(ra) # 80005bc8 <_Z8printIntiii>
    80006488:	00003517          	auipc	a0,0x3
    8000648c:	0e050513          	addi	a0,a0,224 # 80009568 <CONSOLE_STATUS+0x558>
    80006490:	fffff097          	auipc	ra,0xfffff
    80006494:	588080e7          	jalr	1416(ra) # 80005a18 <_Z11printStringPKc>
    80006498:	0400006f          	j	800064d8 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000649c:	00003517          	auipc	a0,0x3
    800064a0:	ecc50513          	addi	a0,a0,-308 # 80009368 <CONSOLE_STATUS+0x358>
    800064a4:	fffff097          	auipc	ra,0xfffff
    800064a8:	574080e7          	jalr	1396(ra) # 80005a18 <_Z11printStringPKc>
    800064ac:	00000613          	li	a2,0
    800064b0:	00a00593          	li	a1,10
    800064b4:	00048513          	mv	a0,s1
    800064b8:	fffff097          	auipc	ra,0xfffff
    800064bc:	710080e7          	jalr	1808(ra) # 80005bc8 <_Z8printIntiii>
    800064c0:	00003517          	auipc	a0,0x3
    800064c4:	0a850513          	addi	a0,a0,168 # 80009568 <CONSOLE_STATUS+0x558>
    800064c8:	fffff097          	auipc	ra,0xfffff
    800064cc:	550080e7          	jalr	1360(ra) # 80005a18 <_Z11printStringPKc>
    for (; i < 16; i++) {
    800064d0:	0014849b          	addiw	s1,s1,1
    800064d4:	0ff4f493          	andi	s1,s1,255
    800064d8:	00f00793          	li	a5,15
    800064dc:	fc97f0e3          	bgeu	a5,s1,8000649c <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    800064e0:	00003517          	auipc	a0,0x3
    800064e4:	eb050513          	addi	a0,a0,-336 # 80009390 <CONSOLE_STATUS+0x380>
    800064e8:	fffff097          	auipc	ra,0xfffff
    800064ec:	530080e7          	jalr	1328(ra) # 80005a18 <_Z11printStringPKc>
    finishedD = true;
    800064f0:	00100793          	li	a5,1
    800064f4:	00005717          	auipc	a4,0x5
    800064f8:	74f70723          	sb	a5,1870(a4) # 8000bc42 <_ZL9finishedD>
    thread_dispatch();
    800064fc:	ffffb097          	auipc	ra,0xffffb
    80006500:	f2c080e7          	jalr	-212(ra) # 80001428 <_Z15thread_dispatchv>
}
    80006504:	01813083          	ld	ra,24(sp)
    80006508:	01013403          	ld	s0,16(sp)
    8000650c:	00813483          	ld	s1,8(sp)
    80006510:	00013903          	ld	s2,0(sp)
    80006514:	02010113          	addi	sp,sp,32
    80006518:	00008067          	ret

000000008000651c <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    8000651c:	fe010113          	addi	sp,sp,-32
    80006520:	00113c23          	sd	ra,24(sp)
    80006524:	00813823          	sd	s0,16(sp)
    80006528:	00913423          	sd	s1,8(sp)
    8000652c:	01213023          	sd	s2,0(sp)
    80006530:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80006534:	00000493          	li	s1,0
    80006538:	0400006f          	j	80006578 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    8000653c:	00003517          	auipc	a0,0x3
    80006540:	dfc50513          	addi	a0,a0,-516 # 80009338 <CONSOLE_STATUS+0x328>
    80006544:	fffff097          	auipc	ra,0xfffff
    80006548:	4d4080e7          	jalr	1236(ra) # 80005a18 <_Z11printStringPKc>
    8000654c:	00000613          	li	a2,0
    80006550:	00a00593          	li	a1,10
    80006554:	00048513          	mv	a0,s1
    80006558:	fffff097          	auipc	ra,0xfffff
    8000655c:	670080e7          	jalr	1648(ra) # 80005bc8 <_Z8printIntiii>
    80006560:	00003517          	auipc	a0,0x3
    80006564:	00850513          	addi	a0,a0,8 # 80009568 <CONSOLE_STATUS+0x558>
    80006568:	fffff097          	auipc	ra,0xfffff
    8000656c:	4b0080e7          	jalr	1200(ra) # 80005a18 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80006570:	0014849b          	addiw	s1,s1,1
    80006574:	0ff4f493          	andi	s1,s1,255
    80006578:	00200793          	li	a5,2
    8000657c:	fc97f0e3          	bgeu	a5,s1,8000653c <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80006580:	00003517          	auipc	a0,0x3
    80006584:	dc050513          	addi	a0,a0,-576 # 80009340 <CONSOLE_STATUS+0x330>
    80006588:	fffff097          	auipc	ra,0xfffff
    8000658c:	490080e7          	jalr	1168(ra) # 80005a18 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80006590:	00700313          	li	t1,7
    thread_dispatch();
    80006594:	ffffb097          	auipc	ra,0xffffb
    80006598:	e94080e7          	jalr	-364(ra) # 80001428 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    8000659c:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    800065a0:	00003517          	auipc	a0,0x3
    800065a4:	db050513          	addi	a0,a0,-592 # 80009350 <CONSOLE_STATUS+0x340>
    800065a8:	fffff097          	auipc	ra,0xfffff
    800065ac:	470080e7          	jalr	1136(ra) # 80005a18 <_Z11printStringPKc>
    800065b0:	00000613          	li	a2,0
    800065b4:	00a00593          	li	a1,10
    800065b8:	0009051b          	sext.w	a0,s2
    800065bc:	fffff097          	auipc	ra,0xfffff
    800065c0:	60c080e7          	jalr	1548(ra) # 80005bc8 <_Z8printIntiii>
    800065c4:	00003517          	auipc	a0,0x3
    800065c8:	fa450513          	addi	a0,a0,-92 # 80009568 <CONSOLE_STATUS+0x558>
    800065cc:	fffff097          	auipc	ra,0xfffff
    800065d0:	44c080e7          	jalr	1100(ra) # 80005a18 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    800065d4:	00c00513          	li	a0,12
    800065d8:	00000097          	auipc	ra,0x0
    800065dc:	d88080e7          	jalr	-632(ra) # 80006360 <_ZL9fibonaccim>
    800065e0:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800065e4:	00003517          	auipc	a0,0x3
    800065e8:	d7450513          	addi	a0,a0,-652 # 80009358 <CONSOLE_STATUS+0x348>
    800065ec:	fffff097          	auipc	ra,0xfffff
    800065f0:	42c080e7          	jalr	1068(ra) # 80005a18 <_Z11printStringPKc>
    800065f4:	00000613          	li	a2,0
    800065f8:	00a00593          	li	a1,10
    800065fc:	0009051b          	sext.w	a0,s2
    80006600:	fffff097          	auipc	ra,0xfffff
    80006604:	5c8080e7          	jalr	1480(ra) # 80005bc8 <_Z8printIntiii>
    80006608:	00003517          	auipc	a0,0x3
    8000660c:	f6050513          	addi	a0,a0,-160 # 80009568 <CONSOLE_STATUS+0x558>
    80006610:	fffff097          	auipc	ra,0xfffff
    80006614:	408080e7          	jalr	1032(ra) # 80005a18 <_Z11printStringPKc>
    80006618:	0400006f          	j	80006658 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    8000661c:	00003517          	auipc	a0,0x3
    80006620:	d1c50513          	addi	a0,a0,-740 # 80009338 <CONSOLE_STATUS+0x328>
    80006624:	fffff097          	auipc	ra,0xfffff
    80006628:	3f4080e7          	jalr	1012(ra) # 80005a18 <_Z11printStringPKc>
    8000662c:	00000613          	li	a2,0
    80006630:	00a00593          	li	a1,10
    80006634:	00048513          	mv	a0,s1
    80006638:	fffff097          	auipc	ra,0xfffff
    8000663c:	590080e7          	jalr	1424(ra) # 80005bc8 <_Z8printIntiii>
    80006640:	00003517          	auipc	a0,0x3
    80006644:	f2850513          	addi	a0,a0,-216 # 80009568 <CONSOLE_STATUS+0x558>
    80006648:	fffff097          	auipc	ra,0xfffff
    8000664c:	3d0080e7          	jalr	976(ra) # 80005a18 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80006650:	0014849b          	addiw	s1,s1,1
    80006654:	0ff4f493          	andi	s1,s1,255
    80006658:	00500793          	li	a5,5
    8000665c:	fc97f0e3          	bgeu	a5,s1,8000661c <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80006660:	00003517          	auipc	a0,0x3
    80006664:	cb050513          	addi	a0,a0,-848 # 80009310 <CONSOLE_STATUS+0x300>
    80006668:	fffff097          	auipc	ra,0xfffff
    8000666c:	3b0080e7          	jalr	944(ra) # 80005a18 <_Z11printStringPKc>
    finishedC = true;
    80006670:	00100793          	li	a5,1
    80006674:	00005717          	auipc	a4,0x5
    80006678:	5cf707a3          	sb	a5,1487(a4) # 8000bc43 <_ZL9finishedC>
    thread_dispatch();
    8000667c:	ffffb097          	auipc	ra,0xffffb
    80006680:	dac080e7          	jalr	-596(ra) # 80001428 <_Z15thread_dispatchv>
}
    80006684:	01813083          	ld	ra,24(sp)
    80006688:	01013403          	ld	s0,16(sp)
    8000668c:	00813483          	ld	s1,8(sp)
    80006690:	00013903          	ld	s2,0(sp)
    80006694:	02010113          	addi	sp,sp,32
    80006698:	00008067          	ret

000000008000669c <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    8000669c:	fe010113          	addi	sp,sp,-32
    800066a0:	00113c23          	sd	ra,24(sp)
    800066a4:	00813823          	sd	s0,16(sp)
    800066a8:	00913423          	sd	s1,8(sp)
    800066ac:	01213023          	sd	s2,0(sp)
    800066b0:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800066b4:	00000913          	li	s2,0
    800066b8:	0400006f          	j	800066f8 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    800066bc:	ffffb097          	auipc	ra,0xffffb
    800066c0:	d6c080e7          	jalr	-660(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800066c4:	00148493          	addi	s1,s1,1
    800066c8:	000027b7          	lui	a5,0x2
    800066cc:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800066d0:	0097ee63          	bltu	a5,s1,800066ec <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800066d4:	00000713          	li	a4,0
    800066d8:	000077b7          	lui	a5,0x7
    800066dc:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800066e0:	fce7eee3          	bltu	a5,a4,800066bc <_ZL11workerBodyBPv+0x20>
    800066e4:	00170713          	addi	a4,a4,1
    800066e8:	ff1ff06f          	j	800066d8 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    800066ec:	00a00793          	li	a5,10
    800066f0:	04f90663          	beq	s2,a5,8000673c <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    800066f4:	00190913          	addi	s2,s2,1
    800066f8:	00f00793          	li	a5,15
    800066fc:	0527e463          	bltu	a5,s2,80006744 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80006700:	00003517          	auipc	a0,0x3
    80006704:	c2050513          	addi	a0,a0,-992 # 80009320 <CONSOLE_STATUS+0x310>
    80006708:	fffff097          	auipc	ra,0xfffff
    8000670c:	310080e7          	jalr	784(ra) # 80005a18 <_Z11printStringPKc>
    80006710:	00000613          	li	a2,0
    80006714:	00a00593          	li	a1,10
    80006718:	0009051b          	sext.w	a0,s2
    8000671c:	fffff097          	auipc	ra,0xfffff
    80006720:	4ac080e7          	jalr	1196(ra) # 80005bc8 <_Z8printIntiii>
    80006724:	00003517          	auipc	a0,0x3
    80006728:	e4450513          	addi	a0,a0,-444 # 80009568 <CONSOLE_STATUS+0x558>
    8000672c:	fffff097          	auipc	ra,0xfffff
    80006730:	2ec080e7          	jalr	748(ra) # 80005a18 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006734:	00000493          	li	s1,0
    80006738:	f91ff06f          	j	800066c8 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    8000673c:	14102ff3          	csrr	t6,sepc
    80006740:	fb5ff06f          	j	800066f4 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    80006744:	00003517          	auipc	a0,0x3
    80006748:	be450513          	addi	a0,a0,-1052 # 80009328 <CONSOLE_STATUS+0x318>
    8000674c:	fffff097          	auipc	ra,0xfffff
    80006750:	2cc080e7          	jalr	716(ra) # 80005a18 <_Z11printStringPKc>
    finishedB = true;
    80006754:	00100793          	li	a5,1
    80006758:	00005717          	auipc	a4,0x5
    8000675c:	4ef70623          	sb	a5,1260(a4) # 8000bc44 <_ZL9finishedB>
    thread_dispatch();
    80006760:	ffffb097          	auipc	ra,0xffffb
    80006764:	cc8080e7          	jalr	-824(ra) # 80001428 <_Z15thread_dispatchv>
}
    80006768:	01813083          	ld	ra,24(sp)
    8000676c:	01013403          	ld	s0,16(sp)
    80006770:	00813483          	ld	s1,8(sp)
    80006774:	00013903          	ld	s2,0(sp)
    80006778:	02010113          	addi	sp,sp,32
    8000677c:	00008067          	ret

0000000080006780 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006780:	fe010113          	addi	sp,sp,-32
    80006784:	00113c23          	sd	ra,24(sp)
    80006788:	00813823          	sd	s0,16(sp)
    8000678c:	00913423          	sd	s1,8(sp)
    80006790:	01213023          	sd	s2,0(sp)
    80006794:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006798:	00000913          	li	s2,0
    8000679c:	0380006f          	j	800067d4 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    800067a0:	ffffb097          	auipc	ra,0xffffb
    800067a4:	c88080e7          	jalr	-888(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800067a8:	00148493          	addi	s1,s1,1
    800067ac:	000027b7          	lui	a5,0x2
    800067b0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800067b4:	0097ee63          	bltu	a5,s1,800067d0 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800067b8:	00000713          	li	a4,0
    800067bc:	000077b7          	lui	a5,0x7
    800067c0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800067c4:	fce7eee3          	bltu	a5,a4,800067a0 <_ZL11workerBodyAPv+0x20>
    800067c8:	00170713          	addi	a4,a4,1
    800067cc:	ff1ff06f          	j	800067bc <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800067d0:	00190913          	addi	s2,s2,1
    800067d4:	00900793          	li	a5,9
    800067d8:	0527e063          	bltu	a5,s2,80006818 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800067dc:	00003517          	auipc	a0,0x3
    800067e0:	b2c50513          	addi	a0,a0,-1236 # 80009308 <CONSOLE_STATUS+0x2f8>
    800067e4:	fffff097          	auipc	ra,0xfffff
    800067e8:	234080e7          	jalr	564(ra) # 80005a18 <_Z11printStringPKc>
    800067ec:	00000613          	li	a2,0
    800067f0:	00a00593          	li	a1,10
    800067f4:	0009051b          	sext.w	a0,s2
    800067f8:	fffff097          	auipc	ra,0xfffff
    800067fc:	3d0080e7          	jalr	976(ra) # 80005bc8 <_Z8printIntiii>
    80006800:	00003517          	auipc	a0,0x3
    80006804:	d6850513          	addi	a0,a0,-664 # 80009568 <CONSOLE_STATUS+0x558>
    80006808:	fffff097          	auipc	ra,0xfffff
    8000680c:	210080e7          	jalr	528(ra) # 80005a18 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006810:	00000493          	li	s1,0
    80006814:	f99ff06f          	j	800067ac <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80006818:	00003517          	auipc	a0,0x3
    8000681c:	af850513          	addi	a0,a0,-1288 # 80009310 <CONSOLE_STATUS+0x300>
    80006820:	fffff097          	auipc	ra,0xfffff
    80006824:	1f8080e7          	jalr	504(ra) # 80005a18 <_Z11printStringPKc>
    finishedA = true;
    80006828:	00100793          	li	a5,1
    8000682c:	00005717          	auipc	a4,0x5
    80006830:	40f70ca3          	sb	a5,1049(a4) # 8000bc45 <_ZL9finishedA>
}
    80006834:	01813083          	ld	ra,24(sp)
    80006838:	01013403          	ld	s0,16(sp)
    8000683c:	00813483          	ld	s1,8(sp)
    80006840:	00013903          	ld	s2,0(sp)
    80006844:	02010113          	addi	sp,sp,32
    80006848:	00008067          	ret

000000008000684c <_Z16System_Mode_testv>:


void System_Mode_test() {
    8000684c:	fd010113          	addi	sp,sp,-48
    80006850:	02113423          	sd	ra,40(sp)
    80006854:	02813023          	sd	s0,32(sp)
    80006858:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    8000685c:	00000613          	li	a2,0
    80006860:	00000597          	auipc	a1,0x0
    80006864:	f2058593          	addi	a1,a1,-224 # 80006780 <_ZL11workerBodyAPv>
    80006868:	fd040513          	addi	a0,s0,-48
    8000686c:	ffffb097          	auipc	ra,0xffffb
    80006870:	b14080e7          	jalr	-1260(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80006874:	00003517          	auipc	a0,0x3
    80006878:	b2c50513          	addi	a0,a0,-1236 # 800093a0 <CONSOLE_STATUS+0x390>
    8000687c:	fffff097          	auipc	ra,0xfffff
    80006880:	19c080e7          	jalr	412(ra) # 80005a18 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80006884:	00000613          	li	a2,0
    80006888:	00000597          	auipc	a1,0x0
    8000688c:	e1458593          	addi	a1,a1,-492 # 8000669c <_ZL11workerBodyBPv>
    80006890:	fd840513          	addi	a0,s0,-40
    80006894:	ffffb097          	auipc	ra,0xffffb
    80006898:	aec080e7          	jalr	-1300(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    8000689c:	00003517          	auipc	a0,0x3
    800068a0:	b1c50513          	addi	a0,a0,-1252 # 800093b8 <CONSOLE_STATUS+0x3a8>
    800068a4:	fffff097          	auipc	ra,0xfffff
    800068a8:	174080e7          	jalr	372(ra) # 80005a18 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    800068ac:	00000613          	li	a2,0
    800068b0:	00000597          	auipc	a1,0x0
    800068b4:	c6c58593          	addi	a1,a1,-916 # 8000651c <_ZL11workerBodyCPv>
    800068b8:	fe040513          	addi	a0,s0,-32
    800068bc:	ffffb097          	auipc	ra,0xffffb
    800068c0:	ac4080e7          	jalr	-1340(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    800068c4:	00003517          	auipc	a0,0x3
    800068c8:	b0c50513          	addi	a0,a0,-1268 # 800093d0 <CONSOLE_STATUS+0x3c0>
    800068cc:	fffff097          	auipc	ra,0xfffff
    800068d0:	14c080e7          	jalr	332(ra) # 80005a18 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    800068d4:	00000613          	li	a2,0
    800068d8:	00000597          	auipc	a1,0x0
    800068dc:	afc58593          	addi	a1,a1,-1284 # 800063d4 <_ZL11workerBodyDPv>
    800068e0:	fe840513          	addi	a0,s0,-24
    800068e4:	ffffb097          	auipc	ra,0xffffb
    800068e8:	a9c080e7          	jalr	-1380(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    800068ec:	00003517          	auipc	a0,0x3
    800068f0:	afc50513          	addi	a0,a0,-1284 # 800093e8 <CONSOLE_STATUS+0x3d8>
    800068f4:	fffff097          	auipc	ra,0xfffff
    800068f8:	124080e7          	jalr	292(ra) # 80005a18 <_Z11printStringPKc>
    800068fc:	00c0006f          	j	80006908 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006900:	ffffb097          	auipc	ra,0xffffb
    80006904:	b28080e7          	jalr	-1240(ra) # 80001428 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006908:	00005797          	auipc	a5,0x5
    8000690c:	33d7c783          	lbu	a5,829(a5) # 8000bc45 <_ZL9finishedA>
    80006910:	fe0788e3          	beqz	a5,80006900 <_Z16System_Mode_testv+0xb4>
    80006914:	00005797          	auipc	a5,0x5
    80006918:	3307c783          	lbu	a5,816(a5) # 8000bc44 <_ZL9finishedB>
    8000691c:	fe0782e3          	beqz	a5,80006900 <_Z16System_Mode_testv+0xb4>
    80006920:	00005797          	auipc	a5,0x5
    80006924:	3237c783          	lbu	a5,803(a5) # 8000bc43 <_ZL9finishedC>
    80006928:	fc078ce3          	beqz	a5,80006900 <_Z16System_Mode_testv+0xb4>
    8000692c:	00005797          	auipc	a5,0x5
    80006930:	3167c783          	lbu	a5,790(a5) # 8000bc42 <_ZL9finishedD>
    80006934:	fc0786e3          	beqz	a5,80006900 <_Z16System_Mode_testv+0xb4>
    }

}
    80006938:	02813083          	ld	ra,40(sp)
    8000693c:	02013403          	ld	s0,32(sp)
    80006940:	03010113          	addi	sp,sp,48
    80006944:	00008067          	ret

0000000080006948 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006948:	fe010113          	addi	sp,sp,-32
    8000694c:	00113c23          	sd	ra,24(sp)
    80006950:	00813823          	sd	s0,16(sp)
    80006954:	00913423          	sd	s1,8(sp)
    80006958:	01213023          	sd	s2,0(sp)
    8000695c:	02010413          	addi	s0,sp,32
    80006960:	00050493          	mv	s1,a0
    80006964:	00058913          	mv	s2,a1
    80006968:	0015879b          	addiw	a5,a1,1
    8000696c:	0007851b          	sext.w	a0,a5
    80006970:	00f4a023          	sw	a5,0(s1)
    80006974:	0004a823          	sw	zero,16(s1)
    80006978:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    8000697c:	00251513          	slli	a0,a0,0x2
    80006980:	ffffb097          	auipc	ra,0xffffb
    80006984:	990080e7          	jalr	-1648(ra) # 80001310 <_Z9mem_allocm>
    80006988:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    8000698c:	00000593          	li	a1,0
    80006990:	02048513          	addi	a0,s1,32
    80006994:	ffffb097          	auipc	ra,0xffffb
    80006998:	b0c080e7          	jalr	-1268(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&spaceAvailable, _cap);
    8000699c:	00090593          	mv	a1,s2
    800069a0:	01848513          	addi	a0,s1,24
    800069a4:	ffffb097          	auipc	ra,0xffffb
    800069a8:	afc080e7          	jalr	-1284(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&mutexHead, 1);
    800069ac:	00100593          	li	a1,1
    800069b0:	02848513          	addi	a0,s1,40
    800069b4:	ffffb097          	auipc	ra,0xffffb
    800069b8:	aec080e7          	jalr	-1300(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&mutexTail, 1);
    800069bc:	00100593          	li	a1,1
    800069c0:	03048513          	addi	a0,s1,48
    800069c4:	ffffb097          	auipc	ra,0xffffb
    800069c8:	adc080e7          	jalr	-1316(ra) # 800014a0 <_Z8sem_openPP4KSemj>
}
    800069cc:	01813083          	ld	ra,24(sp)
    800069d0:	01013403          	ld	s0,16(sp)
    800069d4:	00813483          	ld	s1,8(sp)
    800069d8:	00013903          	ld	s2,0(sp)
    800069dc:	02010113          	addi	sp,sp,32
    800069e0:	00008067          	ret

00000000800069e4 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    800069e4:	fe010113          	addi	sp,sp,-32
    800069e8:	00113c23          	sd	ra,24(sp)
    800069ec:	00813823          	sd	s0,16(sp)
    800069f0:	00913423          	sd	s1,8(sp)
    800069f4:	01213023          	sd	s2,0(sp)
    800069f8:	02010413          	addi	s0,sp,32
    800069fc:	00050493          	mv	s1,a0
    80006a00:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80006a04:	01853503          	ld	a0,24(a0)
    80006a08:	ffffb097          	auipc	ra,0xffffb
    80006a0c:	b00080e7          	jalr	-1280(ra) # 80001508 <_Z8sem_waitP4KSem>

    sem_wait(mutexTail);
    80006a10:	0304b503          	ld	a0,48(s1)
    80006a14:	ffffb097          	auipc	ra,0xffffb
    80006a18:	af4080e7          	jalr	-1292(ra) # 80001508 <_Z8sem_waitP4KSem>
    buffer[tail] = val;
    80006a1c:	0084b783          	ld	a5,8(s1)
    80006a20:	0144a703          	lw	a4,20(s1)
    80006a24:	00271713          	slli	a4,a4,0x2
    80006a28:	00e787b3          	add	a5,a5,a4
    80006a2c:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006a30:	0144a783          	lw	a5,20(s1)
    80006a34:	0017879b          	addiw	a5,a5,1
    80006a38:	0004a703          	lw	a4,0(s1)
    80006a3c:	02e7e7bb          	remw	a5,a5,a4
    80006a40:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80006a44:	0304b503          	ld	a0,48(s1)
    80006a48:	ffffb097          	auipc	ra,0xffffb
    80006a4c:	af0080e7          	jalr	-1296(ra) # 80001538 <_Z10sem_signalP4KSem>

    sem_signal(itemAvailable);
    80006a50:	0204b503          	ld	a0,32(s1)
    80006a54:	ffffb097          	auipc	ra,0xffffb
    80006a58:	ae4080e7          	jalr	-1308(ra) # 80001538 <_Z10sem_signalP4KSem>

}
    80006a5c:	01813083          	ld	ra,24(sp)
    80006a60:	01013403          	ld	s0,16(sp)
    80006a64:	00813483          	ld	s1,8(sp)
    80006a68:	00013903          	ld	s2,0(sp)
    80006a6c:	02010113          	addi	sp,sp,32
    80006a70:	00008067          	ret

0000000080006a74 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80006a74:	fe010113          	addi	sp,sp,-32
    80006a78:	00113c23          	sd	ra,24(sp)
    80006a7c:	00813823          	sd	s0,16(sp)
    80006a80:	00913423          	sd	s1,8(sp)
    80006a84:	01213023          	sd	s2,0(sp)
    80006a88:	02010413          	addi	s0,sp,32
    80006a8c:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80006a90:	02053503          	ld	a0,32(a0)
    80006a94:	ffffb097          	auipc	ra,0xffffb
    80006a98:	a74080e7          	jalr	-1420(ra) # 80001508 <_Z8sem_waitP4KSem>

    sem_wait(mutexHead);
    80006a9c:	0284b503          	ld	a0,40(s1)
    80006aa0:	ffffb097          	auipc	ra,0xffffb
    80006aa4:	a68080e7          	jalr	-1432(ra) # 80001508 <_Z8sem_waitP4KSem>

    int ret = buffer[head];
    80006aa8:	0084b703          	ld	a4,8(s1)
    80006aac:	0104a783          	lw	a5,16(s1)
    80006ab0:	00279693          	slli	a3,a5,0x2
    80006ab4:	00d70733          	add	a4,a4,a3
    80006ab8:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006abc:	0017879b          	addiw	a5,a5,1
    80006ac0:	0004a703          	lw	a4,0(s1)
    80006ac4:	02e7e7bb          	remw	a5,a5,a4
    80006ac8:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80006acc:	0284b503          	ld	a0,40(s1)
    80006ad0:	ffffb097          	auipc	ra,0xffffb
    80006ad4:	a68080e7          	jalr	-1432(ra) # 80001538 <_Z10sem_signalP4KSem>

    sem_signal(spaceAvailable);
    80006ad8:	0184b503          	ld	a0,24(s1)
    80006adc:	ffffb097          	auipc	ra,0xffffb
    80006ae0:	a5c080e7          	jalr	-1444(ra) # 80001538 <_Z10sem_signalP4KSem>

    return ret;
}
    80006ae4:	00090513          	mv	a0,s2
    80006ae8:	01813083          	ld	ra,24(sp)
    80006aec:	01013403          	ld	s0,16(sp)
    80006af0:	00813483          	ld	s1,8(sp)
    80006af4:	00013903          	ld	s2,0(sp)
    80006af8:	02010113          	addi	sp,sp,32
    80006afc:	00008067          	ret

0000000080006b00 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80006b00:	fe010113          	addi	sp,sp,-32
    80006b04:	00113c23          	sd	ra,24(sp)
    80006b08:	00813823          	sd	s0,16(sp)
    80006b0c:	00913423          	sd	s1,8(sp)
    80006b10:	01213023          	sd	s2,0(sp)
    80006b14:	02010413          	addi	s0,sp,32
    80006b18:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80006b1c:	02853503          	ld	a0,40(a0)
    80006b20:	ffffb097          	auipc	ra,0xffffb
    80006b24:	9e8080e7          	jalr	-1560(ra) # 80001508 <_Z8sem_waitP4KSem>
    sem_wait(mutexTail);
    80006b28:	0304b503          	ld	a0,48(s1)
    80006b2c:	ffffb097          	auipc	ra,0xffffb
    80006b30:	9dc080e7          	jalr	-1572(ra) # 80001508 <_Z8sem_waitP4KSem>

    if (tail >= head) {
    80006b34:	0144a783          	lw	a5,20(s1)
    80006b38:	0104a903          	lw	s2,16(s1)
    80006b3c:	0327ce63          	blt	a5,s2,80006b78 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80006b40:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80006b44:	0304b503          	ld	a0,48(s1)
    80006b48:	ffffb097          	auipc	ra,0xffffb
    80006b4c:	9f0080e7          	jalr	-1552(ra) # 80001538 <_Z10sem_signalP4KSem>
    sem_signal(mutexHead);
    80006b50:	0284b503          	ld	a0,40(s1)
    80006b54:	ffffb097          	auipc	ra,0xffffb
    80006b58:	9e4080e7          	jalr	-1564(ra) # 80001538 <_Z10sem_signalP4KSem>

    return ret;
}
    80006b5c:	00090513          	mv	a0,s2
    80006b60:	01813083          	ld	ra,24(sp)
    80006b64:	01013403          	ld	s0,16(sp)
    80006b68:	00813483          	ld	s1,8(sp)
    80006b6c:	00013903          	ld	s2,0(sp)
    80006b70:	02010113          	addi	sp,sp,32
    80006b74:	00008067          	ret
        ret = cap - head + tail;
    80006b78:	0004a703          	lw	a4,0(s1)
    80006b7c:	4127093b          	subw	s2,a4,s2
    80006b80:	00f9093b          	addw	s2,s2,a5
    80006b84:	fc1ff06f          	j	80006b44 <_ZN6Buffer6getCntEv+0x44>

0000000080006b88 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80006b88:	fe010113          	addi	sp,sp,-32
    80006b8c:	00113c23          	sd	ra,24(sp)
    80006b90:	00813823          	sd	s0,16(sp)
    80006b94:	00913423          	sd	s1,8(sp)
    80006b98:	02010413          	addi	s0,sp,32
    80006b9c:	00050493          	mv	s1,a0
    putc('\n');
    80006ba0:	00a00513          	li	a0,10
    80006ba4:	ffffb097          	auipc	ra,0xffffb
    80006ba8:	9ec080e7          	jalr	-1556(ra) # 80001590 <_Z4putcc>
    printString("Buffer deleted!\n");
    80006bac:	00003517          	auipc	a0,0x3
    80006bb0:	86450513          	addi	a0,a0,-1948 # 80009410 <CONSOLE_STATUS+0x400>
    80006bb4:	fffff097          	auipc	ra,0xfffff
    80006bb8:	e64080e7          	jalr	-412(ra) # 80005a18 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80006bbc:	00048513          	mv	a0,s1
    80006bc0:	00000097          	auipc	ra,0x0
    80006bc4:	f40080e7          	jalr	-192(ra) # 80006b00 <_ZN6Buffer6getCntEv>
    80006bc8:	02a05c63          	blez	a0,80006c00 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80006bcc:	0084b783          	ld	a5,8(s1)
    80006bd0:	0104a703          	lw	a4,16(s1)
    80006bd4:	00271713          	slli	a4,a4,0x2
    80006bd8:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80006bdc:	0007c503          	lbu	a0,0(a5)
    80006be0:	ffffb097          	auipc	ra,0xffffb
    80006be4:	9b0080e7          	jalr	-1616(ra) # 80001590 <_Z4putcc>
        head = (head + 1) % cap;
    80006be8:	0104a783          	lw	a5,16(s1)
    80006bec:	0017879b          	addiw	a5,a5,1
    80006bf0:	0004a703          	lw	a4,0(s1)
    80006bf4:	02e7e7bb          	remw	a5,a5,a4
    80006bf8:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80006bfc:	fc1ff06f          	j	80006bbc <_ZN6BufferD1Ev+0x34>
    putc('!');
    80006c00:	02100513          	li	a0,33
    80006c04:	ffffb097          	auipc	ra,0xffffb
    80006c08:	98c080e7          	jalr	-1652(ra) # 80001590 <_Z4putcc>
    putc('\n');
    80006c0c:	00a00513          	li	a0,10
    80006c10:	ffffb097          	auipc	ra,0xffffb
    80006c14:	980080e7          	jalr	-1664(ra) # 80001590 <_Z4putcc>
    mem_free(buffer);
    80006c18:	0084b503          	ld	a0,8(s1)
    80006c1c:	ffffa097          	auipc	ra,0xffffa
    80006c20:	734080e7          	jalr	1844(ra) # 80001350 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80006c24:	0204b503          	ld	a0,32(s1)
    80006c28:	ffffb097          	auipc	ra,0xffffb
    80006c2c:	8b0080e7          	jalr	-1872(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(spaceAvailable);
    80006c30:	0184b503          	ld	a0,24(s1)
    80006c34:	ffffb097          	auipc	ra,0xffffb
    80006c38:	8a4080e7          	jalr	-1884(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(mutexTail);
    80006c3c:	0304b503          	ld	a0,48(s1)
    80006c40:	ffffb097          	auipc	ra,0xffffb
    80006c44:	898080e7          	jalr	-1896(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(mutexHead);
    80006c48:	0284b503          	ld	a0,40(s1)
    80006c4c:	ffffb097          	auipc	ra,0xffffb
    80006c50:	88c080e7          	jalr	-1908(ra) # 800014d8 <_Z9sem_closeP4KSem>
}
    80006c54:	01813083          	ld	ra,24(sp)
    80006c58:	01013403          	ld	s0,16(sp)
    80006c5c:	00813483          	ld	s1,8(sp)
    80006c60:	02010113          	addi	sp,sp,32
    80006c64:	00008067          	ret

0000000080006c68 <start>:
    80006c68:	ff010113          	addi	sp,sp,-16
    80006c6c:	00813423          	sd	s0,8(sp)
    80006c70:	01010413          	addi	s0,sp,16
    80006c74:	300027f3          	csrr	a5,mstatus
    80006c78:	ffffe737          	lui	a4,0xffffe
    80006c7c:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff194f>
    80006c80:	00e7f7b3          	and	a5,a5,a4
    80006c84:	00001737          	lui	a4,0x1
    80006c88:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80006c8c:	00e7e7b3          	or	a5,a5,a4
    80006c90:	30079073          	csrw	mstatus,a5
    80006c94:	00000797          	auipc	a5,0x0
    80006c98:	16078793          	addi	a5,a5,352 # 80006df4 <system_main>
    80006c9c:	34179073          	csrw	mepc,a5
    80006ca0:	00000793          	li	a5,0
    80006ca4:	18079073          	csrw	satp,a5
    80006ca8:	000107b7          	lui	a5,0x10
    80006cac:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80006cb0:	30279073          	csrw	medeleg,a5
    80006cb4:	30379073          	csrw	mideleg,a5
    80006cb8:	104027f3          	csrr	a5,sie
    80006cbc:	2227e793          	ori	a5,a5,546
    80006cc0:	10479073          	csrw	sie,a5
    80006cc4:	fff00793          	li	a5,-1
    80006cc8:	00a7d793          	srli	a5,a5,0xa
    80006ccc:	3b079073          	csrw	pmpaddr0,a5
    80006cd0:	00f00793          	li	a5,15
    80006cd4:	3a079073          	csrw	pmpcfg0,a5
    80006cd8:	f14027f3          	csrr	a5,mhartid
    80006cdc:	0200c737          	lui	a4,0x200c
    80006ce0:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80006ce4:	0007869b          	sext.w	a3,a5
    80006ce8:	00269713          	slli	a4,a3,0x2
    80006cec:	000f4637          	lui	a2,0xf4
    80006cf0:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80006cf4:	00d70733          	add	a4,a4,a3
    80006cf8:	0037979b          	slliw	a5,a5,0x3
    80006cfc:	020046b7          	lui	a3,0x2004
    80006d00:	00d787b3          	add	a5,a5,a3
    80006d04:	00c585b3          	add	a1,a1,a2
    80006d08:	00371693          	slli	a3,a4,0x3
    80006d0c:	00005717          	auipc	a4,0x5
    80006d10:	f4470713          	addi	a4,a4,-188 # 8000bc50 <timer_scratch>
    80006d14:	00b7b023          	sd	a1,0(a5)
    80006d18:	00d70733          	add	a4,a4,a3
    80006d1c:	00f73c23          	sd	a5,24(a4)
    80006d20:	02c73023          	sd	a2,32(a4)
    80006d24:	34071073          	csrw	mscratch,a4
    80006d28:	00000797          	auipc	a5,0x0
    80006d2c:	6e878793          	addi	a5,a5,1768 # 80007410 <timervec>
    80006d30:	30579073          	csrw	mtvec,a5
    80006d34:	300027f3          	csrr	a5,mstatus
    80006d38:	0087e793          	ori	a5,a5,8
    80006d3c:	30079073          	csrw	mstatus,a5
    80006d40:	304027f3          	csrr	a5,mie
    80006d44:	0807e793          	ori	a5,a5,128
    80006d48:	30479073          	csrw	mie,a5
    80006d4c:	f14027f3          	csrr	a5,mhartid
    80006d50:	0007879b          	sext.w	a5,a5
    80006d54:	00078213          	mv	tp,a5
    80006d58:	30200073          	mret
    80006d5c:	00813403          	ld	s0,8(sp)
    80006d60:	01010113          	addi	sp,sp,16
    80006d64:	00008067          	ret

0000000080006d68 <timerinit>:
    80006d68:	ff010113          	addi	sp,sp,-16
    80006d6c:	00813423          	sd	s0,8(sp)
    80006d70:	01010413          	addi	s0,sp,16
    80006d74:	f14027f3          	csrr	a5,mhartid
    80006d78:	0200c737          	lui	a4,0x200c
    80006d7c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80006d80:	0007869b          	sext.w	a3,a5
    80006d84:	00269713          	slli	a4,a3,0x2
    80006d88:	000f4637          	lui	a2,0xf4
    80006d8c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80006d90:	00d70733          	add	a4,a4,a3
    80006d94:	0037979b          	slliw	a5,a5,0x3
    80006d98:	020046b7          	lui	a3,0x2004
    80006d9c:	00d787b3          	add	a5,a5,a3
    80006da0:	00c585b3          	add	a1,a1,a2
    80006da4:	00371693          	slli	a3,a4,0x3
    80006da8:	00005717          	auipc	a4,0x5
    80006dac:	ea870713          	addi	a4,a4,-344 # 8000bc50 <timer_scratch>
    80006db0:	00b7b023          	sd	a1,0(a5)
    80006db4:	00d70733          	add	a4,a4,a3
    80006db8:	00f73c23          	sd	a5,24(a4)
    80006dbc:	02c73023          	sd	a2,32(a4)
    80006dc0:	34071073          	csrw	mscratch,a4
    80006dc4:	00000797          	auipc	a5,0x0
    80006dc8:	64c78793          	addi	a5,a5,1612 # 80007410 <timervec>
    80006dcc:	30579073          	csrw	mtvec,a5
    80006dd0:	300027f3          	csrr	a5,mstatus
    80006dd4:	0087e793          	ori	a5,a5,8
    80006dd8:	30079073          	csrw	mstatus,a5
    80006ddc:	304027f3          	csrr	a5,mie
    80006de0:	0807e793          	ori	a5,a5,128
    80006de4:	30479073          	csrw	mie,a5
    80006de8:	00813403          	ld	s0,8(sp)
    80006dec:	01010113          	addi	sp,sp,16
    80006df0:	00008067          	ret

0000000080006df4 <system_main>:
    80006df4:	fe010113          	addi	sp,sp,-32
    80006df8:	00813823          	sd	s0,16(sp)
    80006dfc:	00913423          	sd	s1,8(sp)
    80006e00:	00113c23          	sd	ra,24(sp)
    80006e04:	02010413          	addi	s0,sp,32
    80006e08:	00000097          	auipc	ra,0x0
    80006e0c:	0c4080e7          	jalr	196(ra) # 80006ecc <cpuid>
    80006e10:	00005497          	auipc	s1,0x5
    80006e14:	ce048493          	addi	s1,s1,-800 # 8000baf0 <started>
    80006e18:	02050263          	beqz	a0,80006e3c <system_main+0x48>
    80006e1c:	0004a783          	lw	a5,0(s1)
    80006e20:	0007879b          	sext.w	a5,a5
    80006e24:	fe078ce3          	beqz	a5,80006e1c <system_main+0x28>
    80006e28:	0ff0000f          	fence
    80006e2c:	00003517          	auipc	a0,0x3
    80006e30:	8b450513          	addi	a0,a0,-1868 # 800096e0 <CONSOLE_STATUS+0x6d0>
    80006e34:	00001097          	auipc	ra,0x1
    80006e38:	a78080e7          	jalr	-1416(ra) # 800078ac <panic>
    80006e3c:	00001097          	auipc	ra,0x1
    80006e40:	9cc080e7          	jalr	-1588(ra) # 80007808 <consoleinit>
    80006e44:	00001097          	auipc	ra,0x1
    80006e48:	158080e7          	jalr	344(ra) # 80007f9c <printfinit>
    80006e4c:	00002517          	auipc	a0,0x2
    80006e50:	71c50513          	addi	a0,a0,1820 # 80009568 <CONSOLE_STATUS+0x558>
    80006e54:	00001097          	auipc	ra,0x1
    80006e58:	ab4080e7          	jalr	-1356(ra) # 80007908 <__printf>
    80006e5c:	00003517          	auipc	a0,0x3
    80006e60:	85450513          	addi	a0,a0,-1964 # 800096b0 <CONSOLE_STATUS+0x6a0>
    80006e64:	00001097          	auipc	ra,0x1
    80006e68:	aa4080e7          	jalr	-1372(ra) # 80007908 <__printf>
    80006e6c:	00002517          	auipc	a0,0x2
    80006e70:	6fc50513          	addi	a0,a0,1788 # 80009568 <CONSOLE_STATUS+0x558>
    80006e74:	00001097          	auipc	ra,0x1
    80006e78:	a94080e7          	jalr	-1388(ra) # 80007908 <__printf>
    80006e7c:	00001097          	auipc	ra,0x1
    80006e80:	4ac080e7          	jalr	1196(ra) # 80008328 <kinit>
    80006e84:	00000097          	auipc	ra,0x0
    80006e88:	148080e7          	jalr	328(ra) # 80006fcc <trapinit>
    80006e8c:	00000097          	auipc	ra,0x0
    80006e90:	16c080e7          	jalr	364(ra) # 80006ff8 <trapinithart>
    80006e94:	00000097          	auipc	ra,0x0
    80006e98:	5bc080e7          	jalr	1468(ra) # 80007450 <plicinit>
    80006e9c:	00000097          	auipc	ra,0x0
    80006ea0:	5dc080e7          	jalr	1500(ra) # 80007478 <plicinithart>
    80006ea4:	00000097          	auipc	ra,0x0
    80006ea8:	078080e7          	jalr	120(ra) # 80006f1c <userinit>
    80006eac:	0ff0000f          	fence
    80006eb0:	00100793          	li	a5,1
    80006eb4:	00003517          	auipc	a0,0x3
    80006eb8:	81450513          	addi	a0,a0,-2028 # 800096c8 <CONSOLE_STATUS+0x6b8>
    80006ebc:	00f4a023          	sw	a5,0(s1)
    80006ec0:	00001097          	auipc	ra,0x1
    80006ec4:	a48080e7          	jalr	-1464(ra) # 80007908 <__printf>
    80006ec8:	0000006f          	j	80006ec8 <system_main+0xd4>

0000000080006ecc <cpuid>:
    80006ecc:	ff010113          	addi	sp,sp,-16
    80006ed0:	00813423          	sd	s0,8(sp)
    80006ed4:	01010413          	addi	s0,sp,16
    80006ed8:	00020513          	mv	a0,tp
    80006edc:	00813403          	ld	s0,8(sp)
    80006ee0:	0005051b          	sext.w	a0,a0
    80006ee4:	01010113          	addi	sp,sp,16
    80006ee8:	00008067          	ret

0000000080006eec <mycpu>:
    80006eec:	ff010113          	addi	sp,sp,-16
    80006ef0:	00813423          	sd	s0,8(sp)
    80006ef4:	01010413          	addi	s0,sp,16
    80006ef8:	00020793          	mv	a5,tp
    80006efc:	00813403          	ld	s0,8(sp)
    80006f00:	0007879b          	sext.w	a5,a5
    80006f04:	00779793          	slli	a5,a5,0x7
    80006f08:	00006517          	auipc	a0,0x6
    80006f0c:	d7850513          	addi	a0,a0,-648 # 8000cc80 <cpus>
    80006f10:	00f50533          	add	a0,a0,a5
    80006f14:	01010113          	addi	sp,sp,16
    80006f18:	00008067          	ret

0000000080006f1c <userinit>:
    80006f1c:	ff010113          	addi	sp,sp,-16
    80006f20:	00813423          	sd	s0,8(sp)
    80006f24:	01010413          	addi	s0,sp,16
    80006f28:	00813403          	ld	s0,8(sp)
    80006f2c:	01010113          	addi	sp,sp,16
    80006f30:	ffffb317          	auipc	t1,0xffffb
    80006f34:	c3c30067          	jr	-964(t1) # 80001b6c <main>

0000000080006f38 <either_copyout>:
    80006f38:	ff010113          	addi	sp,sp,-16
    80006f3c:	00813023          	sd	s0,0(sp)
    80006f40:	00113423          	sd	ra,8(sp)
    80006f44:	01010413          	addi	s0,sp,16
    80006f48:	02051663          	bnez	a0,80006f74 <either_copyout+0x3c>
    80006f4c:	00058513          	mv	a0,a1
    80006f50:	00060593          	mv	a1,a2
    80006f54:	0006861b          	sext.w	a2,a3
    80006f58:	00002097          	auipc	ra,0x2
    80006f5c:	c5c080e7          	jalr	-932(ra) # 80008bb4 <__memmove>
    80006f60:	00813083          	ld	ra,8(sp)
    80006f64:	00013403          	ld	s0,0(sp)
    80006f68:	00000513          	li	a0,0
    80006f6c:	01010113          	addi	sp,sp,16
    80006f70:	00008067          	ret
    80006f74:	00002517          	auipc	a0,0x2
    80006f78:	79450513          	addi	a0,a0,1940 # 80009708 <CONSOLE_STATUS+0x6f8>
    80006f7c:	00001097          	auipc	ra,0x1
    80006f80:	930080e7          	jalr	-1744(ra) # 800078ac <panic>

0000000080006f84 <either_copyin>:
    80006f84:	ff010113          	addi	sp,sp,-16
    80006f88:	00813023          	sd	s0,0(sp)
    80006f8c:	00113423          	sd	ra,8(sp)
    80006f90:	01010413          	addi	s0,sp,16
    80006f94:	02059463          	bnez	a1,80006fbc <either_copyin+0x38>
    80006f98:	00060593          	mv	a1,a2
    80006f9c:	0006861b          	sext.w	a2,a3
    80006fa0:	00002097          	auipc	ra,0x2
    80006fa4:	c14080e7          	jalr	-1004(ra) # 80008bb4 <__memmove>
    80006fa8:	00813083          	ld	ra,8(sp)
    80006fac:	00013403          	ld	s0,0(sp)
    80006fb0:	00000513          	li	a0,0
    80006fb4:	01010113          	addi	sp,sp,16
    80006fb8:	00008067          	ret
    80006fbc:	00002517          	auipc	a0,0x2
    80006fc0:	77450513          	addi	a0,a0,1908 # 80009730 <CONSOLE_STATUS+0x720>
    80006fc4:	00001097          	auipc	ra,0x1
    80006fc8:	8e8080e7          	jalr	-1816(ra) # 800078ac <panic>

0000000080006fcc <trapinit>:
    80006fcc:	ff010113          	addi	sp,sp,-16
    80006fd0:	00813423          	sd	s0,8(sp)
    80006fd4:	01010413          	addi	s0,sp,16
    80006fd8:	00813403          	ld	s0,8(sp)
    80006fdc:	00002597          	auipc	a1,0x2
    80006fe0:	77c58593          	addi	a1,a1,1916 # 80009758 <CONSOLE_STATUS+0x748>
    80006fe4:	00006517          	auipc	a0,0x6
    80006fe8:	d1c50513          	addi	a0,a0,-740 # 8000cd00 <tickslock>
    80006fec:	01010113          	addi	sp,sp,16
    80006ff0:	00001317          	auipc	t1,0x1
    80006ff4:	5c830067          	jr	1480(t1) # 800085b8 <initlock>

0000000080006ff8 <trapinithart>:
    80006ff8:	ff010113          	addi	sp,sp,-16
    80006ffc:	00813423          	sd	s0,8(sp)
    80007000:	01010413          	addi	s0,sp,16
    80007004:	00000797          	auipc	a5,0x0
    80007008:	2fc78793          	addi	a5,a5,764 # 80007300 <kernelvec>
    8000700c:	10579073          	csrw	stvec,a5
    80007010:	00813403          	ld	s0,8(sp)
    80007014:	01010113          	addi	sp,sp,16
    80007018:	00008067          	ret

000000008000701c <usertrap>:
    8000701c:	ff010113          	addi	sp,sp,-16
    80007020:	00813423          	sd	s0,8(sp)
    80007024:	01010413          	addi	s0,sp,16
    80007028:	00813403          	ld	s0,8(sp)
    8000702c:	01010113          	addi	sp,sp,16
    80007030:	00008067          	ret

0000000080007034 <usertrapret>:
    80007034:	ff010113          	addi	sp,sp,-16
    80007038:	00813423          	sd	s0,8(sp)
    8000703c:	01010413          	addi	s0,sp,16
    80007040:	00813403          	ld	s0,8(sp)
    80007044:	01010113          	addi	sp,sp,16
    80007048:	00008067          	ret

000000008000704c <kerneltrap>:
    8000704c:	fe010113          	addi	sp,sp,-32
    80007050:	00813823          	sd	s0,16(sp)
    80007054:	00113c23          	sd	ra,24(sp)
    80007058:	00913423          	sd	s1,8(sp)
    8000705c:	02010413          	addi	s0,sp,32
    80007060:	142025f3          	csrr	a1,scause
    80007064:	100027f3          	csrr	a5,sstatus
    80007068:	0027f793          	andi	a5,a5,2
    8000706c:	10079c63          	bnez	a5,80007184 <kerneltrap+0x138>
    80007070:	142027f3          	csrr	a5,scause
    80007074:	0207ce63          	bltz	a5,800070b0 <kerneltrap+0x64>
    80007078:	00002517          	auipc	a0,0x2
    8000707c:	72850513          	addi	a0,a0,1832 # 800097a0 <CONSOLE_STATUS+0x790>
    80007080:	00001097          	auipc	ra,0x1
    80007084:	888080e7          	jalr	-1912(ra) # 80007908 <__printf>
    80007088:	141025f3          	csrr	a1,sepc
    8000708c:	14302673          	csrr	a2,stval
    80007090:	00002517          	auipc	a0,0x2
    80007094:	72050513          	addi	a0,a0,1824 # 800097b0 <CONSOLE_STATUS+0x7a0>
    80007098:	00001097          	auipc	ra,0x1
    8000709c:	870080e7          	jalr	-1936(ra) # 80007908 <__printf>
    800070a0:	00002517          	auipc	a0,0x2
    800070a4:	72850513          	addi	a0,a0,1832 # 800097c8 <CONSOLE_STATUS+0x7b8>
    800070a8:	00001097          	auipc	ra,0x1
    800070ac:	804080e7          	jalr	-2044(ra) # 800078ac <panic>
    800070b0:	0ff7f713          	andi	a4,a5,255
    800070b4:	00900693          	li	a3,9
    800070b8:	04d70063          	beq	a4,a3,800070f8 <kerneltrap+0xac>
    800070bc:	fff00713          	li	a4,-1
    800070c0:	03f71713          	slli	a4,a4,0x3f
    800070c4:	00170713          	addi	a4,a4,1
    800070c8:	fae798e3          	bne	a5,a4,80007078 <kerneltrap+0x2c>
    800070cc:	00000097          	auipc	ra,0x0
    800070d0:	e00080e7          	jalr	-512(ra) # 80006ecc <cpuid>
    800070d4:	06050663          	beqz	a0,80007140 <kerneltrap+0xf4>
    800070d8:	144027f3          	csrr	a5,sip
    800070dc:	ffd7f793          	andi	a5,a5,-3
    800070e0:	14479073          	csrw	sip,a5
    800070e4:	01813083          	ld	ra,24(sp)
    800070e8:	01013403          	ld	s0,16(sp)
    800070ec:	00813483          	ld	s1,8(sp)
    800070f0:	02010113          	addi	sp,sp,32
    800070f4:	00008067          	ret
    800070f8:	00000097          	auipc	ra,0x0
    800070fc:	3cc080e7          	jalr	972(ra) # 800074c4 <plic_claim>
    80007100:	00a00793          	li	a5,10
    80007104:	00050493          	mv	s1,a0
    80007108:	06f50863          	beq	a0,a5,80007178 <kerneltrap+0x12c>
    8000710c:	fc050ce3          	beqz	a0,800070e4 <kerneltrap+0x98>
    80007110:	00050593          	mv	a1,a0
    80007114:	00002517          	auipc	a0,0x2
    80007118:	66c50513          	addi	a0,a0,1644 # 80009780 <CONSOLE_STATUS+0x770>
    8000711c:	00000097          	auipc	ra,0x0
    80007120:	7ec080e7          	jalr	2028(ra) # 80007908 <__printf>
    80007124:	01013403          	ld	s0,16(sp)
    80007128:	01813083          	ld	ra,24(sp)
    8000712c:	00048513          	mv	a0,s1
    80007130:	00813483          	ld	s1,8(sp)
    80007134:	02010113          	addi	sp,sp,32
    80007138:	00000317          	auipc	t1,0x0
    8000713c:	3c430067          	jr	964(t1) # 800074fc <plic_complete>
    80007140:	00006517          	auipc	a0,0x6
    80007144:	bc050513          	addi	a0,a0,-1088 # 8000cd00 <tickslock>
    80007148:	00001097          	auipc	ra,0x1
    8000714c:	494080e7          	jalr	1172(ra) # 800085dc <acquire>
    80007150:	00005717          	auipc	a4,0x5
    80007154:	9a470713          	addi	a4,a4,-1628 # 8000baf4 <ticks>
    80007158:	00072783          	lw	a5,0(a4)
    8000715c:	00006517          	auipc	a0,0x6
    80007160:	ba450513          	addi	a0,a0,-1116 # 8000cd00 <tickslock>
    80007164:	0017879b          	addiw	a5,a5,1
    80007168:	00f72023          	sw	a5,0(a4)
    8000716c:	00001097          	auipc	ra,0x1
    80007170:	53c080e7          	jalr	1340(ra) # 800086a8 <release>
    80007174:	f65ff06f          	j	800070d8 <kerneltrap+0x8c>
    80007178:	00001097          	auipc	ra,0x1
    8000717c:	098080e7          	jalr	152(ra) # 80008210 <uartintr>
    80007180:	fa5ff06f          	j	80007124 <kerneltrap+0xd8>
    80007184:	00002517          	auipc	a0,0x2
    80007188:	5dc50513          	addi	a0,a0,1500 # 80009760 <CONSOLE_STATUS+0x750>
    8000718c:	00000097          	auipc	ra,0x0
    80007190:	720080e7          	jalr	1824(ra) # 800078ac <panic>

0000000080007194 <clockintr>:
    80007194:	fe010113          	addi	sp,sp,-32
    80007198:	00813823          	sd	s0,16(sp)
    8000719c:	00913423          	sd	s1,8(sp)
    800071a0:	00113c23          	sd	ra,24(sp)
    800071a4:	02010413          	addi	s0,sp,32
    800071a8:	00006497          	auipc	s1,0x6
    800071ac:	b5848493          	addi	s1,s1,-1192 # 8000cd00 <tickslock>
    800071b0:	00048513          	mv	a0,s1
    800071b4:	00001097          	auipc	ra,0x1
    800071b8:	428080e7          	jalr	1064(ra) # 800085dc <acquire>
    800071bc:	00005717          	auipc	a4,0x5
    800071c0:	93870713          	addi	a4,a4,-1736 # 8000baf4 <ticks>
    800071c4:	00072783          	lw	a5,0(a4)
    800071c8:	01013403          	ld	s0,16(sp)
    800071cc:	01813083          	ld	ra,24(sp)
    800071d0:	00048513          	mv	a0,s1
    800071d4:	0017879b          	addiw	a5,a5,1
    800071d8:	00813483          	ld	s1,8(sp)
    800071dc:	00f72023          	sw	a5,0(a4)
    800071e0:	02010113          	addi	sp,sp,32
    800071e4:	00001317          	auipc	t1,0x1
    800071e8:	4c430067          	jr	1220(t1) # 800086a8 <release>

00000000800071ec <devintr>:
    800071ec:	142027f3          	csrr	a5,scause
    800071f0:	00000513          	li	a0,0
    800071f4:	0007c463          	bltz	a5,800071fc <devintr+0x10>
    800071f8:	00008067          	ret
    800071fc:	fe010113          	addi	sp,sp,-32
    80007200:	00813823          	sd	s0,16(sp)
    80007204:	00113c23          	sd	ra,24(sp)
    80007208:	00913423          	sd	s1,8(sp)
    8000720c:	02010413          	addi	s0,sp,32
    80007210:	0ff7f713          	andi	a4,a5,255
    80007214:	00900693          	li	a3,9
    80007218:	04d70c63          	beq	a4,a3,80007270 <devintr+0x84>
    8000721c:	fff00713          	li	a4,-1
    80007220:	03f71713          	slli	a4,a4,0x3f
    80007224:	00170713          	addi	a4,a4,1
    80007228:	00e78c63          	beq	a5,a4,80007240 <devintr+0x54>
    8000722c:	01813083          	ld	ra,24(sp)
    80007230:	01013403          	ld	s0,16(sp)
    80007234:	00813483          	ld	s1,8(sp)
    80007238:	02010113          	addi	sp,sp,32
    8000723c:	00008067          	ret
    80007240:	00000097          	auipc	ra,0x0
    80007244:	c8c080e7          	jalr	-884(ra) # 80006ecc <cpuid>
    80007248:	06050663          	beqz	a0,800072b4 <devintr+0xc8>
    8000724c:	144027f3          	csrr	a5,sip
    80007250:	ffd7f793          	andi	a5,a5,-3
    80007254:	14479073          	csrw	sip,a5
    80007258:	01813083          	ld	ra,24(sp)
    8000725c:	01013403          	ld	s0,16(sp)
    80007260:	00813483          	ld	s1,8(sp)
    80007264:	00200513          	li	a0,2
    80007268:	02010113          	addi	sp,sp,32
    8000726c:	00008067          	ret
    80007270:	00000097          	auipc	ra,0x0
    80007274:	254080e7          	jalr	596(ra) # 800074c4 <plic_claim>
    80007278:	00a00793          	li	a5,10
    8000727c:	00050493          	mv	s1,a0
    80007280:	06f50663          	beq	a0,a5,800072ec <devintr+0x100>
    80007284:	00100513          	li	a0,1
    80007288:	fa0482e3          	beqz	s1,8000722c <devintr+0x40>
    8000728c:	00048593          	mv	a1,s1
    80007290:	00002517          	auipc	a0,0x2
    80007294:	4f050513          	addi	a0,a0,1264 # 80009780 <CONSOLE_STATUS+0x770>
    80007298:	00000097          	auipc	ra,0x0
    8000729c:	670080e7          	jalr	1648(ra) # 80007908 <__printf>
    800072a0:	00048513          	mv	a0,s1
    800072a4:	00000097          	auipc	ra,0x0
    800072a8:	258080e7          	jalr	600(ra) # 800074fc <plic_complete>
    800072ac:	00100513          	li	a0,1
    800072b0:	f7dff06f          	j	8000722c <devintr+0x40>
    800072b4:	00006517          	auipc	a0,0x6
    800072b8:	a4c50513          	addi	a0,a0,-1460 # 8000cd00 <tickslock>
    800072bc:	00001097          	auipc	ra,0x1
    800072c0:	320080e7          	jalr	800(ra) # 800085dc <acquire>
    800072c4:	00005717          	auipc	a4,0x5
    800072c8:	83070713          	addi	a4,a4,-2000 # 8000baf4 <ticks>
    800072cc:	00072783          	lw	a5,0(a4)
    800072d0:	00006517          	auipc	a0,0x6
    800072d4:	a3050513          	addi	a0,a0,-1488 # 8000cd00 <tickslock>
    800072d8:	0017879b          	addiw	a5,a5,1
    800072dc:	00f72023          	sw	a5,0(a4)
    800072e0:	00001097          	auipc	ra,0x1
    800072e4:	3c8080e7          	jalr	968(ra) # 800086a8 <release>
    800072e8:	f65ff06f          	j	8000724c <devintr+0x60>
    800072ec:	00001097          	auipc	ra,0x1
    800072f0:	f24080e7          	jalr	-220(ra) # 80008210 <uartintr>
    800072f4:	fadff06f          	j	800072a0 <devintr+0xb4>
	...

0000000080007300 <kernelvec>:
    80007300:	f0010113          	addi	sp,sp,-256
    80007304:	00113023          	sd	ra,0(sp)
    80007308:	00213423          	sd	sp,8(sp)
    8000730c:	00313823          	sd	gp,16(sp)
    80007310:	00413c23          	sd	tp,24(sp)
    80007314:	02513023          	sd	t0,32(sp)
    80007318:	02613423          	sd	t1,40(sp)
    8000731c:	02713823          	sd	t2,48(sp)
    80007320:	02813c23          	sd	s0,56(sp)
    80007324:	04913023          	sd	s1,64(sp)
    80007328:	04a13423          	sd	a0,72(sp)
    8000732c:	04b13823          	sd	a1,80(sp)
    80007330:	04c13c23          	sd	a2,88(sp)
    80007334:	06d13023          	sd	a3,96(sp)
    80007338:	06e13423          	sd	a4,104(sp)
    8000733c:	06f13823          	sd	a5,112(sp)
    80007340:	07013c23          	sd	a6,120(sp)
    80007344:	09113023          	sd	a7,128(sp)
    80007348:	09213423          	sd	s2,136(sp)
    8000734c:	09313823          	sd	s3,144(sp)
    80007350:	09413c23          	sd	s4,152(sp)
    80007354:	0b513023          	sd	s5,160(sp)
    80007358:	0b613423          	sd	s6,168(sp)
    8000735c:	0b713823          	sd	s7,176(sp)
    80007360:	0b813c23          	sd	s8,184(sp)
    80007364:	0d913023          	sd	s9,192(sp)
    80007368:	0da13423          	sd	s10,200(sp)
    8000736c:	0db13823          	sd	s11,208(sp)
    80007370:	0dc13c23          	sd	t3,216(sp)
    80007374:	0fd13023          	sd	t4,224(sp)
    80007378:	0fe13423          	sd	t5,232(sp)
    8000737c:	0ff13823          	sd	t6,240(sp)
    80007380:	ccdff0ef          	jal	ra,8000704c <kerneltrap>
    80007384:	00013083          	ld	ra,0(sp)
    80007388:	00813103          	ld	sp,8(sp)
    8000738c:	01013183          	ld	gp,16(sp)
    80007390:	02013283          	ld	t0,32(sp)
    80007394:	02813303          	ld	t1,40(sp)
    80007398:	03013383          	ld	t2,48(sp)
    8000739c:	03813403          	ld	s0,56(sp)
    800073a0:	04013483          	ld	s1,64(sp)
    800073a4:	04813503          	ld	a0,72(sp)
    800073a8:	05013583          	ld	a1,80(sp)
    800073ac:	05813603          	ld	a2,88(sp)
    800073b0:	06013683          	ld	a3,96(sp)
    800073b4:	06813703          	ld	a4,104(sp)
    800073b8:	07013783          	ld	a5,112(sp)
    800073bc:	07813803          	ld	a6,120(sp)
    800073c0:	08013883          	ld	a7,128(sp)
    800073c4:	08813903          	ld	s2,136(sp)
    800073c8:	09013983          	ld	s3,144(sp)
    800073cc:	09813a03          	ld	s4,152(sp)
    800073d0:	0a013a83          	ld	s5,160(sp)
    800073d4:	0a813b03          	ld	s6,168(sp)
    800073d8:	0b013b83          	ld	s7,176(sp)
    800073dc:	0b813c03          	ld	s8,184(sp)
    800073e0:	0c013c83          	ld	s9,192(sp)
    800073e4:	0c813d03          	ld	s10,200(sp)
    800073e8:	0d013d83          	ld	s11,208(sp)
    800073ec:	0d813e03          	ld	t3,216(sp)
    800073f0:	0e013e83          	ld	t4,224(sp)
    800073f4:	0e813f03          	ld	t5,232(sp)
    800073f8:	0f013f83          	ld	t6,240(sp)
    800073fc:	10010113          	addi	sp,sp,256
    80007400:	10200073          	sret
    80007404:	00000013          	nop
    80007408:	00000013          	nop
    8000740c:	00000013          	nop

0000000080007410 <timervec>:
    80007410:	34051573          	csrrw	a0,mscratch,a0
    80007414:	00b53023          	sd	a1,0(a0)
    80007418:	00c53423          	sd	a2,8(a0)
    8000741c:	00d53823          	sd	a3,16(a0)
    80007420:	01853583          	ld	a1,24(a0)
    80007424:	02053603          	ld	a2,32(a0)
    80007428:	0005b683          	ld	a3,0(a1)
    8000742c:	00c686b3          	add	a3,a3,a2
    80007430:	00d5b023          	sd	a3,0(a1)
    80007434:	00200593          	li	a1,2
    80007438:	14459073          	csrw	sip,a1
    8000743c:	01053683          	ld	a3,16(a0)
    80007440:	00853603          	ld	a2,8(a0)
    80007444:	00053583          	ld	a1,0(a0)
    80007448:	34051573          	csrrw	a0,mscratch,a0
    8000744c:	30200073          	mret

0000000080007450 <plicinit>:
    80007450:	ff010113          	addi	sp,sp,-16
    80007454:	00813423          	sd	s0,8(sp)
    80007458:	01010413          	addi	s0,sp,16
    8000745c:	00813403          	ld	s0,8(sp)
    80007460:	0c0007b7          	lui	a5,0xc000
    80007464:	00100713          	li	a4,1
    80007468:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000746c:	00e7a223          	sw	a4,4(a5)
    80007470:	01010113          	addi	sp,sp,16
    80007474:	00008067          	ret

0000000080007478 <plicinithart>:
    80007478:	ff010113          	addi	sp,sp,-16
    8000747c:	00813023          	sd	s0,0(sp)
    80007480:	00113423          	sd	ra,8(sp)
    80007484:	01010413          	addi	s0,sp,16
    80007488:	00000097          	auipc	ra,0x0
    8000748c:	a44080e7          	jalr	-1468(ra) # 80006ecc <cpuid>
    80007490:	0085171b          	slliw	a4,a0,0x8
    80007494:	0c0027b7          	lui	a5,0xc002
    80007498:	00e787b3          	add	a5,a5,a4
    8000749c:	40200713          	li	a4,1026
    800074a0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800074a4:	00813083          	ld	ra,8(sp)
    800074a8:	00013403          	ld	s0,0(sp)
    800074ac:	00d5151b          	slliw	a0,a0,0xd
    800074b0:	0c2017b7          	lui	a5,0xc201
    800074b4:	00a78533          	add	a0,a5,a0
    800074b8:	00052023          	sw	zero,0(a0)
    800074bc:	01010113          	addi	sp,sp,16
    800074c0:	00008067          	ret

00000000800074c4 <plic_claim>:
    800074c4:	ff010113          	addi	sp,sp,-16
    800074c8:	00813023          	sd	s0,0(sp)
    800074cc:	00113423          	sd	ra,8(sp)
    800074d0:	01010413          	addi	s0,sp,16
    800074d4:	00000097          	auipc	ra,0x0
    800074d8:	9f8080e7          	jalr	-1544(ra) # 80006ecc <cpuid>
    800074dc:	00813083          	ld	ra,8(sp)
    800074e0:	00013403          	ld	s0,0(sp)
    800074e4:	00d5151b          	slliw	a0,a0,0xd
    800074e8:	0c2017b7          	lui	a5,0xc201
    800074ec:	00a78533          	add	a0,a5,a0
    800074f0:	00452503          	lw	a0,4(a0)
    800074f4:	01010113          	addi	sp,sp,16
    800074f8:	00008067          	ret

00000000800074fc <plic_complete>:
    800074fc:	fe010113          	addi	sp,sp,-32
    80007500:	00813823          	sd	s0,16(sp)
    80007504:	00913423          	sd	s1,8(sp)
    80007508:	00113c23          	sd	ra,24(sp)
    8000750c:	02010413          	addi	s0,sp,32
    80007510:	00050493          	mv	s1,a0
    80007514:	00000097          	auipc	ra,0x0
    80007518:	9b8080e7          	jalr	-1608(ra) # 80006ecc <cpuid>
    8000751c:	01813083          	ld	ra,24(sp)
    80007520:	01013403          	ld	s0,16(sp)
    80007524:	00d5179b          	slliw	a5,a0,0xd
    80007528:	0c201737          	lui	a4,0xc201
    8000752c:	00f707b3          	add	a5,a4,a5
    80007530:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80007534:	00813483          	ld	s1,8(sp)
    80007538:	02010113          	addi	sp,sp,32
    8000753c:	00008067          	ret

0000000080007540 <consolewrite>:
    80007540:	fb010113          	addi	sp,sp,-80
    80007544:	04813023          	sd	s0,64(sp)
    80007548:	04113423          	sd	ra,72(sp)
    8000754c:	02913c23          	sd	s1,56(sp)
    80007550:	03213823          	sd	s2,48(sp)
    80007554:	03313423          	sd	s3,40(sp)
    80007558:	03413023          	sd	s4,32(sp)
    8000755c:	01513c23          	sd	s5,24(sp)
    80007560:	05010413          	addi	s0,sp,80
    80007564:	06c05c63          	blez	a2,800075dc <consolewrite+0x9c>
    80007568:	00060993          	mv	s3,a2
    8000756c:	00050a13          	mv	s4,a0
    80007570:	00058493          	mv	s1,a1
    80007574:	00000913          	li	s2,0
    80007578:	fff00a93          	li	s5,-1
    8000757c:	01c0006f          	j	80007598 <consolewrite+0x58>
    80007580:	fbf44503          	lbu	a0,-65(s0)
    80007584:	0019091b          	addiw	s2,s2,1
    80007588:	00148493          	addi	s1,s1,1
    8000758c:	00001097          	auipc	ra,0x1
    80007590:	a9c080e7          	jalr	-1380(ra) # 80008028 <uartputc>
    80007594:	03298063          	beq	s3,s2,800075b4 <consolewrite+0x74>
    80007598:	00048613          	mv	a2,s1
    8000759c:	00100693          	li	a3,1
    800075a0:	000a0593          	mv	a1,s4
    800075a4:	fbf40513          	addi	a0,s0,-65
    800075a8:	00000097          	auipc	ra,0x0
    800075ac:	9dc080e7          	jalr	-1572(ra) # 80006f84 <either_copyin>
    800075b0:	fd5518e3          	bne	a0,s5,80007580 <consolewrite+0x40>
    800075b4:	04813083          	ld	ra,72(sp)
    800075b8:	04013403          	ld	s0,64(sp)
    800075bc:	03813483          	ld	s1,56(sp)
    800075c0:	02813983          	ld	s3,40(sp)
    800075c4:	02013a03          	ld	s4,32(sp)
    800075c8:	01813a83          	ld	s5,24(sp)
    800075cc:	00090513          	mv	a0,s2
    800075d0:	03013903          	ld	s2,48(sp)
    800075d4:	05010113          	addi	sp,sp,80
    800075d8:	00008067          	ret
    800075dc:	00000913          	li	s2,0
    800075e0:	fd5ff06f          	j	800075b4 <consolewrite+0x74>

00000000800075e4 <consoleread>:
    800075e4:	f9010113          	addi	sp,sp,-112
    800075e8:	06813023          	sd	s0,96(sp)
    800075ec:	04913c23          	sd	s1,88(sp)
    800075f0:	05213823          	sd	s2,80(sp)
    800075f4:	05313423          	sd	s3,72(sp)
    800075f8:	05413023          	sd	s4,64(sp)
    800075fc:	03513c23          	sd	s5,56(sp)
    80007600:	03613823          	sd	s6,48(sp)
    80007604:	03713423          	sd	s7,40(sp)
    80007608:	03813023          	sd	s8,32(sp)
    8000760c:	06113423          	sd	ra,104(sp)
    80007610:	01913c23          	sd	s9,24(sp)
    80007614:	07010413          	addi	s0,sp,112
    80007618:	00060b93          	mv	s7,a2
    8000761c:	00050913          	mv	s2,a0
    80007620:	00058c13          	mv	s8,a1
    80007624:	00060b1b          	sext.w	s6,a2
    80007628:	00005497          	auipc	s1,0x5
    8000762c:	70048493          	addi	s1,s1,1792 # 8000cd28 <cons>
    80007630:	00400993          	li	s3,4
    80007634:	fff00a13          	li	s4,-1
    80007638:	00a00a93          	li	s5,10
    8000763c:	05705e63          	blez	s7,80007698 <consoleread+0xb4>
    80007640:	09c4a703          	lw	a4,156(s1)
    80007644:	0984a783          	lw	a5,152(s1)
    80007648:	0007071b          	sext.w	a4,a4
    8000764c:	08e78463          	beq	a5,a4,800076d4 <consoleread+0xf0>
    80007650:	07f7f713          	andi	a4,a5,127
    80007654:	00e48733          	add	a4,s1,a4
    80007658:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000765c:	0017869b          	addiw	a3,a5,1
    80007660:	08d4ac23          	sw	a3,152(s1)
    80007664:	00070c9b          	sext.w	s9,a4
    80007668:	0b370663          	beq	a4,s3,80007714 <consoleread+0x130>
    8000766c:	00100693          	li	a3,1
    80007670:	f9f40613          	addi	a2,s0,-97
    80007674:	000c0593          	mv	a1,s8
    80007678:	00090513          	mv	a0,s2
    8000767c:	f8e40fa3          	sb	a4,-97(s0)
    80007680:	00000097          	auipc	ra,0x0
    80007684:	8b8080e7          	jalr	-1864(ra) # 80006f38 <either_copyout>
    80007688:	01450863          	beq	a0,s4,80007698 <consoleread+0xb4>
    8000768c:	001c0c13          	addi	s8,s8,1
    80007690:	fffb8b9b          	addiw	s7,s7,-1
    80007694:	fb5c94e3          	bne	s9,s5,8000763c <consoleread+0x58>
    80007698:	000b851b          	sext.w	a0,s7
    8000769c:	06813083          	ld	ra,104(sp)
    800076a0:	06013403          	ld	s0,96(sp)
    800076a4:	05813483          	ld	s1,88(sp)
    800076a8:	05013903          	ld	s2,80(sp)
    800076ac:	04813983          	ld	s3,72(sp)
    800076b0:	04013a03          	ld	s4,64(sp)
    800076b4:	03813a83          	ld	s5,56(sp)
    800076b8:	02813b83          	ld	s7,40(sp)
    800076bc:	02013c03          	ld	s8,32(sp)
    800076c0:	01813c83          	ld	s9,24(sp)
    800076c4:	40ab053b          	subw	a0,s6,a0
    800076c8:	03013b03          	ld	s6,48(sp)
    800076cc:	07010113          	addi	sp,sp,112
    800076d0:	00008067          	ret
    800076d4:	00001097          	auipc	ra,0x1
    800076d8:	1d8080e7          	jalr	472(ra) # 800088ac <push_on>
    800076dc:	0984a703          	lw	a4,152(s1)
    800076e0:	09c4a783          	lw	a5,156(s1)
    800076e4:	0007879b          	sext.w	a5,a5
    800076e8:	fef70ce3          	beq	a4,a5,800076e0 <consoleread+0xfc>
    800076ec:	00001097          	auipc	ra,0x1
    800076f0:	234080e7          	jalr	564(ra) # 80008920 <pop_on>
    800076f4:	0984a783          	lw	a5,152(s1)
    800076f8:	07f7f713          	andi	a4,a5,127
    800076fc:	00e48733          	add	a4,s1,a4
    80007700:	01874703          	lbu	a4,24(a4)
    80007704:	0017869b          	addiw	a3,a5,1
    80007708:	08d4ac23          	sw	a3,152(s1)
    8000770c:	00070c9b          	sext.w	s9,a4
    80007710:	f5371ee3          	bne	a4,s3,8000766c <consoleread+0x88>
    80007714:	000b851b          	sext.w	a0,s7
    80007718:	f96bf2e3          	bgeu	s7,s6,8000769c <consoleread+0xb8>
    8000771c:	08f4ac23          	sw	a5,152(s1)
    80007720:	f7dff06f          	j	8000769c <consoleread+0xb8>

0000000080007724 <consputc>:
    80007724:	10000793          	li	a5,256
    80007728:	00f50663          	beq	a0,a5,80007734 <consputc+0x10>
    8000772c:	00001317          	auipc	t1,0x1
    80007730:	9f430067          	jr	-1548(t1) # 80008120 <uartputc_sync>
    80007734:	ff010113          	addi	sp,sp,-16
    80007738:	00113423          	sd	ra,8(sp)
    8000773c:	00813023          	sd	s0,0(sp)
    80007740:	01010413          	addi	s0,sp,16
    80007744:	00800513          	li	a0,8
    80007748:	00001097          	auipc	ra,0x1
    8000774c:	9d8080e7          	jalr	-1576(ra) # 80008120 <uartputc_sync>
    80007750:	02000513          	li	a0,32
    80007754:	00001097          	auipc	ra,0x1
    80007758:	9cc080e7          	jalr	-1588(ra) # 80008120 <uartputc_sync>
    8000775c:	00013403          	ld	s0,0(sp)
    80007760:	00813083          	ld	ra,8(sp)
    80007764:	00800513          	li	a0,8
    80007768:	01010113          	addi	sp,sp,16
    8000776c:	00001317          	auipc	t1,0x1
    80007770:	9b430067          	jr	-1612(t1) # 80008120 <uartputc_sync>

0000000080007774 <consoleintr>:
    80007774:	fe010113          	addi	sp,sp,-32
    80007778:	00813823          	sd	s0,16(sp)
    8000777c:	00913423          	sd	s1,8(sp)
    80007780:	01213023          	sd	s2,0(sp)
    80007784:	00113c23          	sd	ra,24(sp)
    80007788:	02010413          	addi	s0,sp,32
    8000778c:	00005917          	auipc	s2,0x5
    80007790:	59c90913          	addi	s2,s2,1436 # 8000cd28 <cons>
    80007794:	00050493          	mv	s1,a0
    80007798:	00090513          	mv	a0,s2
    8000779c:	00001097          	auipc	ra,0x1
    800077a0:	e40080e7          	jalr	-448(ra) # 800085dc <acquire>
    800077a4:	02048c63          	beqz	s1,800077dc <consoleintr+0x68>
    800077a8:	0a092783          	lw	a5,160(s2)
    800077ac:	09892703          	lw	a4,152(s2)
    800077b0:	07f00693          	li	a3,127
    800077b4:	40e7873b          	subw	a4,a5,a4
    800077b8:	02e6e263          	bltu	a3,a4,800077dc <consoleintr+0x68>
    800077bc:	00d00713          	li	a4,13
    800077c0:	04e48063          	beq	s1,a4,80007800 <consoleintr+0x8c>
    800077c4:	07f7f713          	andi	a4,a5,127
    800077c8:	00e90733          	add	a4,s2,a4
    800077cc:	0017879b          	addiw	a5,a5,1
    800077d0:	0af92023          	sw	a5,160(s2)
    800077d4:	00970c23          	sb	s1,24(a4)
    800077d8:	08f92e23          	sw	a5,156(s2)
    800077dc:	01013403          	ld	s0,16(sp)
    800077e0:	01813083          	ld	ra,24(sp)
    800077e4:	00813483          	ld	s1,8(sp)
    800077e8:	00013903          	ld	s2,0(sp)
    800077ec:	00005517          	auipc	a0,0x5
    800077f0:	53c50513          	addi	a0,a0,1340 # 8000cd28 <cons>
    800077f4:	02010113          	addi	sp,sp,32
    800077f8:	00001317          	auipc	t1,0x1
    800077fc:	eb030067          	jr	-336(t1) # 800086a8 <release>
    80007800:	00a00493          	li	s1,10
    80007804:	fc1ff06f          	j	800077c4 <consoleintr+0x50>

0000000080007808 <consoleinit>:
    80007808:	fe010113          	addi	sp,sp,-32
    8000780c:	00113c23          	sd	ra,24(sp)
    80007810:	00813823          	sd	s0,16(sp)
    80007814:	00913423          	sd	s1,8(sp)
    80007818:	02010413          	addi	s0,sp,32
    8000781c:	00005497          	auipc	s1,0x5
    80007820:	50c48493          	addi	s1,s1,1292 # 8000cd28 <cons>
    80007824:	00048513          	mv	a0,s1
    80007828:	00002597          	auipc	a1,0x2
    8000782c:	fb058593          	addi	a1,a1,-80 # 800097d8 <CONSOLE_STATUS+0x7c8>
    80007830:	00001097          	auipc	ra,0x1
    80007834:	d88080e7          	jalr	-632(ra) # 800085b8 <initlock>
    80007838:	00000097          	auipc	ra,0x0
    8000783c:	7ac080e7          	jalr	1964(ra) # 80007fe4 <uartinit>
    80007840:	01813083          	ld	ra,24(sp)
    80007844:	01013403          	ld	s0,16(sp)
    80007848:	00000797          	auipc	a5,0x0
    8000784c:	d9c78793          	addi	a5,a5,-612 # 800075e4 <consoleread>
    80007850:	0af4bc23          	sd	a5,184(s1)
    80007854:	00000797          	auipc	a5,0x0
    80007858:	cec78793          	addi	a5,a5,-788 # 80007540 <consolewrite>
    8000785c:	0cf4b023          	sd	a5,192(s1)
    80007860:	00813483          	ld	s1,8(sp)
    80007864:	02010113          	addi	sp,sp,32
    80007868:	00008067          	ret

000000008000786c <console_read>:
    8000786c:	ff010113          	addi	sp,sp,-16
    80007870:	00813423          	sd	s0,8(sp)
    80007874:	01010413          	addi	s0,sp,16
    80007878:	00813403          	ld	s0,8(sp)
    8000787c:	00005317          	auipc	t1,0x5
    80007880:	56433303          	ld	t1,1380(t1) # 8000cde0 <devsw+0x10>
    80007884:	01010113          	addi	sp,sp,16
    80007888:	00030067          	jr	t1

000000008000788c <console_write>:
    8000788c:	ff010113          	addi	sp,sp,-16
    80007890:	00813423          	sd	s0,8(sp)
    80007894:	01010413          	addi	s0,sp,16
    80007898:	00813403          	ld	s0,8(sp)
    8000789c:	00005317          	auipc	t1,0x5
    800078a0:	54c33303          	ld	t1,1356(t1) # 8000cde8 <devsw+0x18>
    800078a4:	01010113          	addi	sp,sp,16
    800078a8:	00030067          	jr	t1

00000000800078ac <panic>:
    800078ac:	fe010113          	addi	sp,sp,-32
    800078b0:	00113c23          	sd	ra,24(sp)
    800078b4:	00813823          	sd	s0,16(sp)
    800078b8:	00913423          	sd	s1,8(sp)
    800078bc:	02010413          	addi	s0,sp,32
    800078c0:	00050493          	mv	s1,a0
    800078c4:	00002517          	auipc	a0,0x2
    800078c8:	f1c50513          	addi	a0,a0,-228 # 800097e0 <CONSOLE_STATUS+0x7d0>
    800078cc:	00005797          	auipc	a5,0x5
    800078d0:	5a07ae23          	sw	zero,1468(a5) # 8000ce88 <pr+0x18>
    800078d4:	00000097          	auipc	ra,0x0
    800078d8:	034080e7          	jalr	52(ra) # 80007908 <__printf>
    800078dc:	00048513          	mv	a0,s1
    800078e0:	00000097          	auipc	ra,0x0
    800078e4:	028080e7          	jalr	40(ra) # 80007908 <__printf>
    800078e8:	00002517          	auipc	a0,0x2
    800078ec:	c8050513          	addi	a0,a0,-896 # 80009568 <CONSOLE_STATUS+0x558>
    800078f0:	00000097          	auipc	ra,0x0
    800078f4:	018080e7          	jalr	24(ra) # 80007908 <__printf>
    800078f8:	00100793          	li	a5,1
    800078fc:	00004717          	auipc	a4,0x4
    80007900:	1ef72e23          	sw	a5,508(a4) # 8000baf8 <panicked>
    80007904:	0000006f          	j	80007904 <panic+0x58>

0000000080007908 <__printf>:
    80007908:	f3010113          	addi	sp,sp,-208
    8000790c:	08813023          	sd	s0,128(sp)
    80007910:	07313423          	sd	s3,104(sp)
    80007914:	09010413          	addi	s0,sp,144
    80007918:	05813023          	sd	s8,64(sp)
    8000791c:	08113423          	sd	ra,136(sp)
    80007920:	06913c23          	sd	s1,120(sp)
    80007924:	07213823          	sd	s2,112(sp)
    80007928:	07413023          	sd	s4,96(sp)
    8000792c:	05513c23          	sd	s5,88(sp)
    80007930:	05613823          	sd	s6,80(sp)
    80007934:	05713423          	sd	s7,72(sp)
    80007938:	03913c23          	sd	s9,56(sp)
    8000793c:	03a13823          	sd	s10,48(sp)
    80007940:	03b13423          	sd	s11,40(sp)
    80007944:	00005317          	auipc	t1,0x5
    80007948:	52c30313          	addi	t1,t1,1324 # 8000ce70 <pr>
    8000794c:	01832c03          	lw	s8,24(t1)
    80007950:	00b43423          	sd	a1,8(s0)
    80007954:	00c43823          	sd	a2,16(s0)
    80007958:	00d43c23          	sd	a3,24(s0)
    8000795c:	02e43023          	sd	a4,32(s0)
    80007960:	02f43423          	sd	a5,40(s0)
    80007964:	03043823          	sd	a6,48(s0)
    80007968:	03143c23          	sd	a7,56(s0)
    8000796c:	00050993          	mv	s3,a0
    80007970:	4a0c1663          	bnez	s8,80007e1c <__printf+0x514>
    80007974:	60098c63          	beqz	s3,80007f8c <__printf+0x684>
    80007978:	0009c503          	lbu	a0,0(s3)
    8000797c:	00840793          	addi	a5,s0,8
    80007980:	f6f43c23          	sd	a5,-136(s0)
    80007984:	00000493          	li	s1,0
    80007988:	22050063          	beqz	a0,80007ba8 <__printf+0x2a0>
    8000798c:	00002a37          	lui	s4,0x2
    80007990:	00018ab7          	lui	s5,0x18
    80007994:	000f4b37          	lui	s6,0xf4
    80007998:	00989bb7          	lui	s7,0x989
    8000799c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    800079a0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    800079a4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    800079a8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    800079ac:	00148c9b          	addiw	s9,s1,1
    800079b0:	02500793          	li	a5,37
    800079b4:	01998933          	add	s2,s3,s9
    800079b8:	38f51263          	bne	a0,a5,80007d3c <__printf+0x434>
    800079bc:	00094783          	lbu	a5,0(s2)
    800079c0:	00078c9b          	sext.w	s9,a5
    800079c4:	1e078263          	beqz	a5,80007ba8 <__printf+0x2a0>
    800079c8:	0024849b          	addiw	s1,s1,2
    800079cc:	07000713          	li	a4,112
    800079d0:	00998933          	add	s2,s3,s1
    800079d4:	38e78a63          	beq	a5,a4,80007d68 <__printf+0x460>
    800079d8:	20f76863          	bltu	a4,a5,80007be8 <__printf+0x2e0>
    800079dc:	42a78863          	beq	a5,a0,80007e0c <__printf+0x504>
    800079e0:	06400713          	li	a4,100
    800079e4:	40e79663          	bne	a5,a4,80007df0 <__printf+0x4e8>
    800079e8:	f7843783          	ld	a5,-136(s0)
    800079ec:	0007a603          	lw	a2,0(a5)
    800079f0:	00878793          	addi	a5,a5,8
    800079f4:	f6f43c23          	sd	a5,-136(s0)
    800079f8:	42064a63          	bltz	a2,80007e2c <__printf+0x524>
    800079fc:	00a00713          	li	a4,10
    80007a00:	02e677bb          	remuw	a5,a2,a4
    80007a04:	00002d97          	auipc	s11,0x2
    80007a08:	e04d8d93          	addi	s11,s11,-508 # 80009808 <digits>
    80007a0c:	00900593          	li	a1,9
    80007a10:	0006051b          	sext.w	a0,a2
    80007a14:	00000c93          	li	s9,0
    80007a18:	02079793          	slli	a5,a5,0x20
    80007a1c:	0207d793          	srli	a5,a5,0x20
    80007a20:	00fd87b3          	add	a5,s11,a5
    80007a24:	0007c783          	lbu	a5,0(a5)
    80007a28:	02e656bb          	divuw	a3,a2,a4
    80007a2c:	f8f40023          	sb	a5,-128(s0)
    80007a30:	14c5d863          	bge	a1,a2,80007b80 <__printf+0x278>
    80007a34:	06300593          	li	a1,99
    80007a38:	00100c93          	li	s9,1
    80007a3c:	02e6f7bb          	remuw	a5,a3,a4
    80007a40:	02079793          	slli	a5,a5,0x20
    80007a44:	0207d793          	srli	a5,a5,0x20
    80007a48:	00fd87b3          	add	a5,s11,a5
    80007a4c:	0007c783          	lbu	a5,0(a5)
    80007a50:	02e6d73b          	divuw	a4,a3,a4
    80007a54:	f8f400a3          	sb	a5,-127(s0)
    80007a58:	12a5f463          	bgeu	a1,a0,80007b80 <__printf+0x278>
    80007a5c:	00a00693          	li	a3,10
    80007a60:	00900593          	li	a1,9
    80007a64:	02d777bb          	remuw	a5,a4,a3
    80007a68:	02079793          	slli	a5,a5,0x20
    80007a6c:	0207d793          	srli	a5,a5,0x20
    80007a70:	00fd87b3          	add	a5,s11,a5
    80007a74:	0007c503          	lbu	a0,0(a5)
    80007a78:	02d757bb          	divuw	a5,a4,a3
    80007a7c:	f8a40123          	sb	a0,-126(s0)
    80007a80:	48e5f263          	bgeu	a1,a4,80007f04 <__printf+0x5fc>
    80007a84:	06300513          	li	a0,99
    80007a88:	02d7f5bb          	remuw	a1,a5,a3
    80007a8c:	02059593          	slli	a1,a1,0x20
    80007a90:	0205d593          	srli	a1,a1,0x20
    80007a94:	00bd85b3          	add	a1,s11,a1
    80007a98:	0005c583          	lbu	a1,0(a1)
    80007a9c:	02d7d7bb          	divuw	a5,a5,a3
    80007aa0:	f8b401a3          	sb	a1,-125(s0)
    80007aa4:	48e57263          	bgeu	a0,a4,80007f28 <__printf+0x620>
    80007aa8:	3e700513          	li	a0,999
    80007aac:	02d7f5bb          	remuw	a1,a5,a3
    80007ab0:	02059593          	slli	a1,a1,0x20
    80007ab4:	0205d593          	srli	a1,a1,0x20
    80007ab8:	00bd85b3          	add	a1,s11,a1
    80007abc:	0005c583          	lbu	a1,0(a1)
    80007ac0:	02d7d7bb          	divuw	a5,a5,a3
    80007ac4:	f8b40223          	sb	a1,-124(s0)
    80007ac8:	46e57663          	bgeu	a0,a4,80007f34 <__printf+0x62c>
    80007acc:	02d7f5bb          	remuw	a1,a5,a3
    80007ad0:	02059593          	slli	a1,a1,0x20
    80007ad4:	0205d593          	srli	a1,a1,0x20
    80007ad8:	00bd85b3          	add	a1,s11,a1
    80007adc:	0005c583          	lbu	a1,0(a1)
    80007ae0:	02d7d7bb          	divuw	a5,a5,a3
    80007ae4:	f8b402a3          	sb	a1,-123(s0)
    80007ae8:	46ea7863          	bgeu	s4,a4,80007f58 <__printf+0x650>
    80007aec:	02d7f5bb          	remuw	a1,a5,a3
    80007af0:	02059593          	slli	a1,a1,0x20
    80007af4:	0205d593          	srli	a1,a1,0x20
    80007af8:	00bd85b3          	add	a1,s11,a1
    80007afc:	0005c583          	lbu	a1,0(a1)
    80007b00:	02d7d7bb          	divuw	a5,a5,a3
    80007b04:	f8b40323          	sb	a1,-122(s0)
    80007b08:	3eeaf863          	bgeu	s5,a4,80007ef8 <__printf+0x5f0>
    80007b0c:	02d7f5bb          	remuw	a1,a5,a3
    80007b10:	02059593          	slli	a1,a1,0x20
    80007b14:	0205d593          	srli	a1,a1,0x20
    80007b18:	00bd85b3          	add	a1,s11,a1
    80007b1c:	0005c583          	lbu	a1,0(a1)
    80007b20:	02d7d7bb          	divuw	a5,a5,a3
    80007b24:	f8b403a3          	sb	a1,-121(s0)
    80007b28:	42eb7e63          	bgeu	s6,a4,80007f64 <__printf+0x65c>
    80007b2c:	02d7f5bb          	remuw	a1,a5,a3
    80007b30:	02059593          	slli	a1,a1,0x20
    80007b34:	0205d593          	srli	a1,a1,0x20
    80007b38:	00bd85b3          	add	a1,s11,a1
    80007b3c:	0005c583          	lbu	a1,0(a1)
    80007b40:	02d7d7bb          	divuw	a5,a5,a3
    80007b44:	f8b40423          	sb	a1,-120(s0)
    80007b48:	42ebfc63          	bgeu	s7,a4,80007f80 <__printf+0x678>
    80007b4c:	02079793          	slli	a5,a5,0x20
    80007b50:	0207d793          	srli	a5,a5,0x20
    80007b54:	00fd8db3          	add	s11,s11,a5
    80007b58:	000dc703          	lbu	a4,0(s11)
    80007b5c:	00a00793          	li	a5,10
    80007b60:	00900c93          	li	s9,9
    80007b64:	f8e404a3          	sb	a4,-119(s0)
    80007b68:	00065c63          	bgez	a2,80007b80 <__printf+0x278>
    80007b6c:	f9040713          	addi	a4,s0,-112
    80007b70:	00f70733          	add	a4,a4,a5
    80007b74:	02d00693          	li	a3,45
    80007b78:	fed70823          	sb	a3,-16(a4)
    80007b7c:	00078c93          	mv	s9,a5
    80007b80:	f8040793          	addi	a5,s0,-128
    80007b84:	01978cb3          	add	s9,a5,s9
    80007b88:	f7f40d13          	addi	s10,s0,-129
    80007b8c:	000cc503          	lbu	a0,0(s9)
    80007b90:	fffc8c93          	addi	s9,s9,-1
    80007b94:	00000097          	auipc	ra,0x0
    80007b98:	b90080e7          	jalr	-1136(ra) # 80007724 <consputc>
    80007b9c:	ffac98e3          	bne	s9,s10,80007b8c <__printf+0x284>
    80007ba0:	00094503          	lbu	a0,0(s2)
    80007ba4:	e00514e3          	bnez	a0,800079ac <__printf+0xa4>
    80007ba8:	1a0c1663          	bnez	s8,80007d54 <__printf+0x44c>
    80007bac:	08813083          	ld	ra,136(sp)
    80007bb0:	08013403          	ld	s0,128(sp)
    80007bb4:	07813483          	ld	s1,120(sp)
    80007bb8:	07013903          	ld	s2,112(sp)
    80007bbc:	06813983          	ld	s3,104(sp)
    80007bc0:	06013a03          	ld	s4,96(sp)
    80007bc4:	05813a83          	ld	s5,88(sp)
    80007bc8:	05013b03          	ld	s6,80(sp)
    80007bcc:	04813b83          	ld	s7,72(sp)
    80007bd0:	04013c03          	ld	s8,64(sp)
    80007bd4:	03813c83          	ld	s9,56(sp)
    80007bd8:	03013d03          	ld	s10,48(sp)
    80007bdc:	02813d83          	ld	s11,40(sp)
    80007be0:	0d010113          	addi	sp,sp,208
    80007be4:	00008067          	ret
    80007be8:	07300713          	li	a4,115
    80007bec:	1ce78a63          	beq	a5,a4,80007dc0 <__printf+0x4b8>
    80007bf0:	07800713          	li	a4,120
    80007bf4:	1ee79e63          	bne	a5,a4,80007df0 <__printf+0x4e8>
    80007bf8:	f7843783          	ld	a5,-136(s0)
    80007bfc:	0007a703          	lw	a4,0(a5)
    80007c00:	00878793          	addi	a5,a5,8
    80007c04:	f6f43c23          	sd	a5,-136(s0)
    80007c08:	28074263          	bltz	a4,80007e8c <__printf+0x584>
    80007c0c:	00002d97          	auipc	s11,0x2
    80007c10:	bfcd8d93          	addi	s11,s11,-1028 # 80009808 <digits>
    80007c14:	00f77793          	andi	a5,a4,15
    80007c18:	00fd87b3          	add	a5,s11,a5
    80007c1c:	0007c683          	lbu	a3,0(a5)
    80007c20:	00f00613          	li	a2,15
    80007c24:	0007079b          	sext.w	a5,a4
    80007c28:	f8d40023          	sb	a3,-128(s0)
    80007c2c:	0047559b          	srliw	a1,a4,0x4
    80007c30:	0047569b          	srliw	a3,a4,0x4
    80007c34:	00000c93          	li	s9,0
    80007c38:	0ee65063          	bge	a2,a4,80007d18 <__printf+0x410>
    80007c3c:	00f6f693          	andi	a3,a3,15
    80007c40:	00dd86b3          	add	a3,s11,a3
    80007c44:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80007c48:	0087d79b          	srliw	a5,a5,0x8
    80007c4c:	00100c93          	li	s9,1
    80007c50:	f8d400a3          	sb	a3,-127(s0)
    80007c54:	0cb67263          	bgeu	a2,a1,80007d18 <__printf+0x410>
    80007c58:	00f7f693          	andi	a3,a5,15
    80007c5c:	00dd86b3          	add	a3,s11,a3
    80007c60:	0006c583          	lbu	a1,0(a3)
    80007c64:	00f00613          	li	a2,15
    80007c68:	0047d69b          	srliw	a3,a5,0x4
    80007c6c:	f8b40123          	sb	a1,-126(s0)
    80007c70:	0047d593          	srli	a1,a5,0x4
    80007c74:	28f67e63          	bgeu	a2,a5,80007f10 <__printf+0x608>
    80007c78:	00f6f693          	andi	a3,a3,15
    80007c7c:	00dd86b3          	add	a3,s11,a3
    80007c80:	0006c503          	lbu	a0,0(a3)
    80007c84:	0087d813          	srli	a6,a5,0x8
    80007c88:	0087d69b          	srliw	a3,a5,0x8
    80007c8c:	f8a401a3          	sb	a0,-125(s0)
    80007c90:	28b67663          	bgeu	a2,a1,80007f1c <__printf+0x614>
    80007c94:	00f6f693          	andi	a3,a3,15
    80007c98:	00dd86b3          	add	a3,s11,a3
    80007c9c:	0006c583          	lbu	a1,0(a3)
    80007ca0:	00c7d513          	srli	a0,a5,0xc
    80007ca4:	00c7d69b          	srliw	a3,a5,0xc
    80007ca8:	f8b40223          	sb	a1,-124(s0)
    80007cac:	29067a63          	bgeu	a2,a6,80007f40 <__printf+0x638>
    80007cb0:	00f6f693          	andi	a3,a3,15
    80007cb4:	00dd86b3          	add	a3,s11,a3
    80007cb8:	0006c583          	lbu	a1,0(a3)
    80007cbc:	0107d813          	srli	a6,a5,0x10
    80007cc0:	0107d69b          	srliw	a3,a5,0x10
    80007cc4:	f8b402a3          	sb	a1,-123(s0)
    80007cc8:	28a67263          	bgeu	a2,a0,80007f4c <__printf+0x644>
    80007ccc:	00f6f693          	andi	a3,a3,15
    80007cd0:	00dd86b3          	add	a3,s11,a3
    80007cd4:	0006c683          	lbu	a3,0(a3)
    80007cd8:	0147d79b          	srliw	a5,a5,0x14
    80007cdc:	f8d40323          	sb	a3,-122(s0)
    80007ce0:	21067663          	bgeu	a2,a6,80007eec <__printf+0x5e4>
    80007ce4:	02079793          	slli	a5,a5,0x20
    80007ce8:	0207d793          	srli	a5,a5,0x20
    80007cec:	00fd8db3          	add	s11,s11,a5
    80007cf0:	000dc683          	lbu	a3,0(s11)
    80007cf4:	00800793          	li	a5,8
    80007cf8:	00700c93          	li	s9,7
    80007cfc:	f8d403a3          	sb	a3,-121(s0)
    80007d00:	00075c63          	bgez	a4,80007d18 <__printf+0x410>
    80007d04:	f9040713          	addi	a4,s0,-112
    80007d08:	00f70733          	add	a4,a4,a5
    80007d0c:	02d00693          	li	a3,45
    80007d10:	fed70823          	sb	a3,-16(a4)
    80007d14:	00078c93          	mv	s9,a5
    80007d18:	f8040793          	addi	a5,s0,-128
    80007d1c:	01978cb3          	add	s9,a5,s9
    80007d20:	f7f40d13          	addi	s10,s0,-129
    80007d24:	000cc503          	lbu	a0,0(s9)
    80007d28:	fffc8c93          	addi	s9,s9,-1
    80007d2c:	00000097          	auipc	ra,0x0
    80007d30:	9f8080e7          	jalr	-1544(ra) # 80007724 <consputc>
    80007d34:	ff9d18e3          	bne	s10,s9,80007d24 <__printf+0x41c>
    80007d38:	0100006f          	j	80007d48 <__printf+0x440>
    80007d3c:	00000097          	auipc	ra,0x0
    80007d40:	9e8080e7          	jalr	-1560(ra) # 80007724 <consputc>
    80007d44:	000c8493          	mv	s1,s9
    80007d48:	00094503          	lbu	a0,0(s2)
    80007d4c:	c60510e3          	bnez	a0,800079ac <__printf+0xa4>
    80007d50:	e40c0ee3          	beqz	s8,80007bac <__printf+0x2a4>
    80007d54:	00005517          	auipc	a0,0x5
    80007d58:	11c50513          	addi	a0,a0,284 # 8000ce70 <pr>
    80007d5c:	00001097          	auipc	ra,0x1
    80007d60:	94c080e7          	jalr	-1716(ra) # 800086a8 <release>
    80007d64:	e49ff06f          	j	80007bac <__printf+0x2a4>
    80007d68:	f7843783          	ld	a5,-136(s0)
    80007d6c:	03000513          	li	a0,48
    80007d70:	01000d13          	li	s10,16
    80007d74:	00878713          	addi	a4,a5,8
    80007d78:	0007bc83          	ld	s9,0(a5)
    80007d7c:	f6e43c23          	sd	a4,-136(s0)
    80007d80:	00000097          	auipc	ra,0x0
    80007d84:	9a4080e7          	jalr	-1628(ra) # 80007724 <consputc>
    80007d88:	07800513          	li	a0,120
    80007d8c:	00000097          	auipc	ra,0x0
    80007d90:	998080e7          	jalr	-1640(ra) # 80007724 <consputc>
    80007d94:	00002d97          	auipc	s11,0x2
    80007d98:	a74d8d93          	addi	s11,s11,-1420 # 80009808 <digits>
    80007d9c:	03ccd793          	srli	a5,s9,0x3c
    80007da0:	00fd87b3          	add	a5,s11,a5
    80007da4:	0007c503          	lbu	a0,0(a5)
    80007da8:	fffd0d1b          	addiw	s10,s10,-1
    80007dac:	004c9c93          	slli	s9,s9,0x4
    80007db0:	00000097          	auipc	ra,0x0
    80007db4:	974080e7          	jalr	-1676(ra) # 80007724 <consputc>
    80007db8:	fe0d12e3          	bnez	s10,80007d9c <__printf+0x494>
    80007dbc:	f8dff06f          	j	80007d48 <__printf+0x440>
    80007dc0:	f7843783          	ld	a5,-136(s0)
    80007dc4:	0007bc83          	ld	s9,0(a5)
    80007dc8:	00878793          	addi	a5,a5,8
    80007dcc:	f6f43c23          	sd	a5,-136(s0)
    80007dd0:	000c9a63          	bnez	s9,80007de4 <__printf+0x4dc>
    80007dd4:	1080006f          	j	80007edc <__printf+0x5d4>
    80007dd8:	001c8c93          	addi	s9,s9,1
    80007ddc:	00000097          	auipc	ra,0x0
    80007de0:	948080e7          	jalr	-1720(ra) # 80007724 <consputc>
    80007de4:	000cc503          	lbu	a0,0(s9)
    80007de8:	fe0518e3          	bnez	a0,80007dd8 <__printf+0x4d0>
    80007dec:	f5dff06f          	j	80007d48 <__printf+0x440>
    80007df0:	02500513          	li	a0,37
    80007df4:	00000097          	auipc	ra,0x0
    80007df8:	930080e7          	jalr	-1744(ra) # 80007724 <consputc>
    80007dfc:	000c8513          	mv	a0,s9
    80007e00:	00000097          	auipc	ra,0x0
    80007e04:	924080e7          	jalr	-1756(ra) # 80007724 <consputc>
    80007e08:	f41ff06f          	j	80007d48 <__printf+0x440>
    80007e0c:	02500513          	li	a0,37
    80007e10:	00000097          	auipc	ra,0x0
    80007e14:	914080e7          	jalr	-1772(ra) # 80007724 <consputc>
    80007e18:	f31ff06f          	j	80007d48 <__printf+0x440>
    80007e1c:	00030513          	mv	a0,t1
    80007e20:	00000097          	auipc	ra,0x0
    80007e24:	7bc080e7          	jalr	1980(ra) # 800085dc <acquire>
    80007e28:	b4dff06f          	j	80007974 <__printf+0x6c>
    80007e2c:	40c0053b          	negw	a0,a2
    80007e30:	00a00713          	li	a4,10
    80007e34:	02e576bb          	remuw	a3,a0,a4
    80007e38:	00002d97          	auipc	s11,0x2
    80007e3c:	9d0d8d93          	addi	s11,s11,-1584 # 80009808 <digits>
    80007e40:	ff700593          	li	a1,-9
    80007e44:	02069693          	slli	a3,a3,0x20
    80007e48:	0206d693          	srli	a3,a3,0x20
    80007e4c:	00dd86b3          	add	a3,s11,a3
    80007e50:	0006c683          	lbu	a3,0(a3)
    80007e54:	02e557bb          	divuw	a5,a0,a4
    80007e58:	f8d40023          	sb	a3,-128(s0)
    80007e5c:	10b65e63          	bge	a2,a1,80007f78 <__printf+0x670>
    80007e60:	06300593          	li	a1,99
    80007e64:	02e7f6bb          	remuw	a3,a5,a4
    80007e68:	02069693          	slli	a3,a3,0x20
    80007e6c:	0206d693          	srli	a3,a3,0x20
    80007e70:	00dd86b3          	add	a3,s11,a3
    80007e74:	0006c683          	lbu	a3,0(a3)
    80007e78:	02e7d73b          	divuw	a4,a5,a4
    80007e7c:	00200793          	li	a5,2
    80007e80:	f8d400a3          	sb	a3,-127(s0)
    80007e84:	bca5ece3          	bltu	a1,a0,80007a5c <__printf+0x154>
    80007e88:	ce5ff06f          	j	80007b6c <__printf+0x264>
    80007e8c:	40e007bb          	negw	a5,a4
    80007e90:	00002d97          	auipc	s11,0x2
    80007e94:	978d8d93          	addi	s11,s11,-1672 # 80009808 <digits>
    80007e98:	00f7f693          	andi	a3,a5,15
    80007e9c:	00dd86b3          	add	a3,s11,a3
    80007ea0:	0006c583          	lbu	a1,0(a3)
    80007ea4:	ff100613          	li	a2,-15
    80007ea8:	0047d69b          	srliw	a3,a5,0x4
    80007eac:	f8b40023          	sb	a1,-128(s0)
    80007eb0:	0047d59b          	srliw	a1,a5,0x4
    80007eb4:	0ac75e63          	bge	a4,a2,80007f70 <__printf+0x668>
    80007eb8:	00f6f693          	andi	a3,a3,15
    80007ebc:	00dd86b3          	add	a3,s11,a3
    80007ec0:	0006c603          	lbu	a2,0(a3)
    80007ec4:	00f00693          	li	a3,15
    80007ec8:	0087d79b          	srliw	a5,a5,0x8
    80007ecc:	f8c400a3          	sb	a2,-127(s0)
    80007ed0:	d8b6e4e3          	bltu	a3,a1,80007c58 <__printf+0x350>
    80007ed4:	00200793          	li	a5,2
    80007ed8:	e2dff06f          	j	80007d04 <__printf+0x3fc>
    80007edc:	00002c97          	auipc	s9,0x2
    80007ee0:	90cc8c93          	addi	s9,s9,-1780 # 800097e8 <CONSOLE_STATUS+0x7d8>
    80007ee4:	02800513          	li	a0,40
    80007ee8:	ef1ff06f          	j	80007dd8 <__printf+0x4d0>
    80007eec:	00700793          	li	a5,7
    80007ef0:	00600c93          	li	s9,6
    80007ef4:	e0dff06f          	j	80007d00 <__printf+0x3f8>
    80007ef8:	00700793          	li	a5,7
    80007efc:	00600c93          	li	s9,6
    80007f00:	c69ff06f          	j	80007b68 <__printf+0x260>
    80007f04:	00300793          	li	a5,3
    80007f08:	00200c93          	li	s9,2
    80007f0c:	c5dff06f          	j	80007b68 <__printf+0x260>
    80007f10:	00300793          	li	a5,3
    80007f14:	00200c93          	li	s9,2
    80007f18:	de9ff06f          	j	80007d00 <__printf+0x3f8>
    80007f1c:	00400793          	li	a5,4
    80007f20:	00300c93          	li	s9,3
    80007f24:	dddff06f          	j	80007d00 <__printf+0x3f8>
    80007f28:	00400793          	li	a5,4
    80007f2c:	00300c93          	li	s9,3
    80007f30:	c39ff06f          	j	80007b68 <__printf+0x260>
    80007f34:	00500793          	li	a5,5
    80007f38:	00400c93          	li	s9,4
    80007f3c:	c2dff06f          	j	80007b68 <__printf+0x260>
    80007f40:	00500793          	li	a5,5
    80007f44:	00400c93          	li	s9,4
    80007f48:	db9ff06f          	j	80007d00 <__printf+0x3f8>
    80007f4c:	00600793          	li	a5,6
    80007f50:	00500c93          	li	s9,5
    80007f54:	dadff06f          	j	80007d00 <__printf+0x3f8>
    80007f58:	00600793          	li	a5,6
    80007f5c:	00500c93          	li	s9,5
    80007f60:	c09ff06f          	j	80007b68 <__printf+0x260>
    80007f64:	00800793          	li	a5,8
    80007f68:	00700c93          	li	s9,7
    80007f6c:	bfdff06f          	j	80007b68 <__printf+0x260>
    80007f70:	00100793          	li	a5,1
    80007f74:	d91ff06f          	j	80007d04 <__printf+0x3fc>
    80007f78:	00100793          	li	a5,1
    80007f7c:	bf1ff06f          	j	80007b6c <__printf+0x264>
    80007f80:	00900793          	li	a5,9
    80007f84:	00800c93          	li	s9,8
    80007f88:	be1ff06f          	j	80007b68 <__printf+0x260>
    80007f8c:	00002517          	auipc	a0,0x2
    80007f90:	86450513          	addi	a0,a0,-1948 # 800097f0 <CONSOLE_STATUS+0x7e0>
    80007f94:	00000097          	auipc	ra,0x0
    80007f98:	918080e7          	jalr	-1768(ra) # 800078ac <panic>

0000000080007f9c <printfinit>:
    80007f9c:	fe010113          	addi	sp,sp,-32
    80007fa0:	00813823          	sd	s0,16(sp)
    80007fa4:	00913423          	sd	s1,8(sp)
    80007fa8:	00113c23          	sd	ra,24(sp)
    80007fac:	02010413          	addi	s0,sp,32
    80007fb0:	00005497          	auipc	s1,0x5
    80007fb4:	ec048493          	addi	s1,s1,-320 # 8000ce70 <pr>
    80007fb8:	00048513          	mv	a0,s1
    80007fbc:	00002597          	auipc	a1,0x2
    80007fc0:	84458593          	addi	a1,a1,-1980 # 80009800 <CONSOLE_STATUS+0x7f0>
    80007fc4:	00000097          	auipc	ra,0x0
    80007fc8:	5f4080e7          	jalr	1524(ra) # 800085b8 <initlock>
    80007fcc:	01813083          	ld	ra,24(sp)
    80007fd0:	01013403          	ld	s0,16(sp)
    80007fd4:	0004ac23          	sw	zero,24(s1)
    80007fd8:	00813483          	ld	s1,8(sp)
    80007fdc:	02010113          	addi	sp,sp,32
    80007fe0:	00008067          	ret

0000000080007fe4 <uartinit>:
    80007fe4:	ff010113          	addi	sp,sp,-16
    80007fe8:	00813423          	sd	s0,8(sp)
    80007fec:	01010413          	addi	s0,sp,16
    80007ff0:	100007b7          	lui	a5,0x10000
    80007ff4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80007ff8:	f8000713          	li	a4,-128
    80007ffc:	00e781a3          	sb	a4,3(a5)
    80008000:	00300713          	li	a4,3
    80008004:	00e78023          	sb	a4,0(a5)
    80008008:	000780a3          	sb	zero,1(a5)
    8000800c:	00e781a3          	sb	a4,3(a5)
    80008010:	00700693          	li	a3,7
    80008014:	00d78123          	sb	a3,2(a5)
    80008018:	00e780a3          	sb	a4,1(a5)
    8000801c:	00813403          	ld	s0,8(sp)
    80008020:	01010113          	addi	sp,sp,16
    80008024:	00008067          	ret

0000000080008028 <uartputc>:
    80008028:	00004797          	auipc	a5,0x4
    8000802c:	ad07a783          	lw	a5,-1328(a5) # 8000baf8 <panicked>
    80008030:	00078463          	beqz	a5,80008038 <uartputc+0x10>
    80008034:	0000006f          	j	80008034 <uartputc+0xc>
    80008038:	fd010113          	addi	sp,sp,-48
    8000803c:	02813023          	sd	s0,32(sp)
    80008040:	00913c23          	sd	s1,24(sp)
    80008044:	01213823          	sd	s2,16(sp)
    80008048:	01313423          	sd	s3,8(sp)
    8000804c:	02113423          	sd	ra,40(sp)
    80008050:	03010413          	addi	s0,sp,48
    80008054:	00004917          	auipc	s2,0x4
    80008058:	aac90913          	addi	s2,s2,-1364 # 8000bb00 <uart_tx_r>
    8000805c:	00093783          	ld	a5,0(s2)
    80008060:	00004497          	auipc	s1,0x4
    80008064:	aa848493          	addi	s1,s1,-1368 # 8000bb08 <uart_tx_w>
    80008068:	0004b703          	ld	a4,0(s1)
    8000806c:	02078693          	addi	a3,a5,32
    80008070:	00050993          	mv	s3,a0
    80008074:	02e69c63          	bne	a3,a4,800080ac <uartputc+0x84>
    80008078:	00001097          	auipc	ra,0x1
    8000807c:	834080e7          	jalr	-1996(ra) # 800088ac <push_on>
    80008080:	00093783          	ld	a5,0(s2)
    80008084:	0004b703          	ld	a4,0(s1)
    80008088:	02078793          	addi	a5,a5,32
    8000808c:	00e79463          	bne	a5,a4,80008094 <uartputc+0x6c>
    80008090:	0000006f          	j	80008090 <uartputc+0x68>
    80008094:	00001097          	auipc	ra,0x1
    80008098:	88c080e7          	jalr	-1908(ra) # 80008920 <pop_on>
    8000809c:	00093783          	ld	a5,0(s2)
    800080a0:	0004b703          	ld	a4,0(s1)
    800080a4:	02078693          	addi	a3,a5,32
    800080a8:	fce688e3          	beq	a3,a4,80008078 <uartputc+0x50>
    800080ac:	01f77693          	andi	a3,a4,31
    800080b0:	00005597          	auipc	a1,0x5
    800080b4:	de058593          	addi	a1,a1,-544 # 8000ce90 <uart_tx_buf>
    800080b8:	00d586b3          	add	a3,a1,a3
    800080bc:	00170713          	addi	a4,a4,1
    800080c0:	01368023          	sb	s3,0(a3)
    800080c4:	00e4b023          	sd	a4,0(s1)
    800080c8:	10000637          	lui	a2,0x10000
    800080cc:	02f71063          	bne	a4,a5,800080ec <uartputc+0xc4>
    800080d0:	0340006f          	j	80008104 <uartputc+0xdc>
    800080d4:	00074703          	lbu	a4,0(a4)
    800080d8:	00f93023          	sd	a5,0(s2)
    800080dc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800080e0:	00093783          	ld	a5,0(s2)
    800080e4:	0004b703          	ld	a4,0(s1)
    800080e8:	00f70e63          	beq	a4,a5,80008104 <uartputc+0xdc>
    800080ec:	00564683          	lbu	a3,5(a2)
    800080f0:	01f7f713          	andi	a4,a5,31
    800080f4:	00e58733          	add	a4,a1,a4
    800080f8:	0206f693          	andi	a3,a3,32
    800080fc:	00178793          	addi	a5,a5,1
    80008100:	fc069ae3          	bnez	a3,800080d4 <uartputc+0xac>
    80008104:	02813083          	ld	ra,40(sp)
    80008108:	02013403          	ld	s0,32(sp)
    8000810c:	01813483          	ld	s1,24(sp)
    80008110:	01013903          	ld	s2,16(sp)
    80008114:	00813983          	ld	s3,8(sp)
    80008118:	03010113          	addi	sp,sp,48
    8000811c:	00008067          	ret

0000000080008120 <uartputc_sync>:
    80008120:	ff010113          	addi	sp,sp,-16
    80008124:	00813423          	sd	s0,8(sp)
    80008128:	01010413          	addi	s0,sp,16
    8000812c:	00004717          	auipc	a4,0x4
    80008130:	9cc72703          	lw	a4,-1588(a4) # 8000baf8 <panicked>
    80008134:	02071663          	bnez	a4,80008160 <uartputc_sync+0x40>
    80008138:	00050793          	mv	a5,a0
    8000813c:	100006b7          	lui	a3,0x10000
    80008140:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80008144:	02077713          	andi	a4,a4,32
    80008148:	fe070ce3          	beqz	a4,80008140 <uartputc_sync+0x20>
    8000814c:	0ff7f793          	andi	a5,a5,255
    80008150:	00f68023          	sb	a5,0(a3)
    80008154:	00813403          	ld	s0,8(sp)
    80008158:	01010113          	addi	sp,sp,16
    8000815c:	00008067          	ret
    80008160:	0000006f          	j	80008160 <uartputc_sync+0x40>

0000000080008164 <uartstart>:
    80008164:	ff010113          	addi	sp,sp,-16
    80008168:	00813423          	sd	s0,8(sp)
    8000816c:	01010413          	addi	s0,sp,16
    80008170:	00004617          	auipc	a2,0x4
    80008174:	99060613          	addi	a2,a2,-1648 # 8000bb00 <uart_tx_r>
    80008178:	00004517          	auipc	a0,0x4
    8000817c:	99050513          	addi	a0,a0,-1648 # 8000bb08 <uart_tx_w>
    80008180:	00063783          	ld	a5,0(a2)
    80008184:	00053703          	ld	a4,0(a0)
    80008188:	04f70263          	beq	a4,a5,800081cc <uartstart+0x68>
    8000818c:	100005b7          	lui	a1,0x10000
    80008190:	00005817          	auipc	a6,0x5
    80008194:	d0080813          	addi	a6,a6,-768 # 8000ce90 <uart_tx_buf>
    80008198:	01c0006f          	j	800081b4 <uartstart+0x50>
    8000819c:	0006c703          	lbu	a4,0(a3)
    800081a0:	00f63023          	sd	a5,0(a2)
    800081a4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800081a8:	00063783          	ld	a5,0(a2)
    800081ac:	00053703          	ld	a4,0(a0)
    800081b0:	00f70e63          	beq	a4,a5,800081cc <uartstart+0x68>
    800081b4:	01f7f713          	andi	a4,a5,31
    800081b8:	00e806b3          	add	a3,a6,a4
    800081bc:	0055c703          	lbu	a4,5(a1)
    800081c0:	00178793          	addi	a5,a5,1
    800081c4:	02077713          	andi	a4,a4,32
    800081c8:	fc071ae3          	bnez	a4,8000819c <uartstart+0x38>
    800081cc:	00813403          	ld	s0,8(sp)
    800081d0:	01010113          	addi	sp,sp,16
    800081d4:	00008067          	ret

00000000800081d8 <uartgetc>:
    800081d8:	ff010113          	addi	sp,sp,-16
    800081dc:	00813423          	sd	s0,8(sp)
    800081e0:	01010413          	addi	s0,sp,16
    800081e4:	10000737          	lui	a4,0x10000
    800081e8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800081ec:	0017f793          	andi	a5,a5,1
    800081f0:	00078c63          	beqz	a5,80008208 <uartgetc+0x30>
    800081f4:	00074503          	lbu	a0,0(a4)
    800081f8:	0ff57513          	andi	a0,a0,255
    800081fc:	00813403          	ld	s0,8(sp)
    80008200:	01010113          	addi	sp,sp,16
    80008204:	00008067          	ret
    80008208:	fff00513          	li	a0,-1
    8000820c:	ff1ff06f          	j	800081fc <uartgetc+0x24>

0000000080008210 <uartintr>:
    80008210:	100007b7          	lui	a5,0x10000
    80008214:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80008218:	0017f793          	andi	a5,a5,1
    8000821c:	0a078463          	beqz	a5,800082c4 <uartintr+0xb4>
    80008220:	fe010113          	addi	sp,sp,-32
    80008224:	00813823          	sd	s0,16(sp)
    80008228:	00913423          	sd	s1,8(sp)
    8000822c:	00113c23          	sd	ra,24(sp)
    80008230:	02010413          	addi	s0,sp,32
    80008234:	100004b7          	lui	s1,0x10000
    80008238:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000823c:	0ff57513          	andi	a0,a0,255
    80008240:	fffff097          	auipc	ra,0xfffff
    80008244:	534080e7          	jalr	1332(ra) # 80007774 <consoleintr>
    80008248:	0054c783          	lbu	a5,5(s1)
    8000824c:	0017f793          	andi	a5,a5,1
    80008250:	fe0794e3          	bnez	a5,80008238 <uartintr+0x28>
    80008254:	00004617          	auipc	a2,0x4
    80008258:	8ac60613          	addi	a2,a2,-1876 # 8000bb00 <uart_tx_r>
    8000825c:	00004517          	auipc	a0,0x4
    80008260:	8ac50513          	addi	a0,a0,-1876 # 8000bb08 <uart_tx_w>
    80008264:	00063783          	ld	a5,0(a2)
    80008268:	00053703          	ld	a4,0(a0)
    8000826c:	04f70263          	beq	a4,a5,800082b0 <uartintr+0xa0>
    80008270:	100005b7          	lui	a1,0x10000
    80008274:	00005817          	auipc	a6,0x5
    80008278:	c1c80813          	addi	a6,a6,-996 # 8000ce90 <uart_tx_buf>
    8000827c:	01c0006f          	j	80008298 <uartintr+0x88>
    80008280:	0006c703          	lbu	a4,0(a3)
    80008284:	00f63023          	sd	a5,0(a2)
    80008288:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000828c:	00063783          	ld	a5,0(a2)
    80008290:	00053703          	ld	a4,0(a0)
    80008294:	00f70e63          	beq	a4,a5,800082b0 <uartintr+0xa0>
    80008298:	01f7f713          	andi	a4,a5,31
    8000829c:	00e806b3          	add	a3,a6,a4
    800082a0:	0055c703          	lbu	a4,5(a1)
    800082a4:	00178793          	addi	a5,a5,1
    800082a8:	02077713          	andi	a4,a4,32
    800082ac:	fc071ae3          	bnez	a4,80008280 <uartintr+0x70>
    800082b0:	01813083          	ld	ra,24(sp)
    800082b4:	01013403          	ld	s0,16(sp)
    800082b8:	00813483          	ld	s1,8(sp)
    800082bc:	02010113          	addi	sp,sp,32
    800082c0:	00008067          	ret
    800082c4:	00004617          	auipc	a2,0x4
    800082c8:	83c60613          	addi	a2,a2,-1988 # 8000bb00 <uart_tx_r>
    800082cc:	00004517          	auipc	a0,0x4
    800082d0:	83c50513          	addi	a0,a0,-1988 # 8000bb08 <uart_tx_w>
    800082d4:	00063783          	ld	a5,0(a2)
    800082d8:	00053703          	ld	a4,0(a0)
    800082dc:	04f70263          	beq	a4,a5,80008320 <uartintr+0x110>
    800082e0:	100005b7          	lui	a1,0x10000
    800082e4:	00005817          	auipc	a6,0x5
    800082e8:	bac80813          	addi	a6,a6,-1108 # 8000ce90 <uart_tx_buf>
    800082ec:	01c0006f          	j	80008308 <uartintr+0xf8>
    800082f0:	0006c703          	lbu	a4,0(a3)
    800082f4:	00f63023          	sd	a5,0(a2)
    800082f8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800082fc:	00063783          	ld	a5,0(a2)
    80008300:	00053703          	ld	a4,0(a0)
    80008304:	02f70063          	beq	a4,a5,80008324 <uartintr+0x114>
    80008308:	01f7f713          	andi	a4,a5,31
    8000830c:	00e806b3          	add	a3,a6,a4
    80008310:	0055c703          	lbu	a4,5(a1)
    80008314:	00178793          	addi	a5,a5,1
    80008318:	02077713          	andi	a4,a4,32
    8000831c:	fc071ae3          	bnez	a4,800082f0 <uartintr+0xe0>
    80008320:	00008067          	ret
    80008324:	00008067          	ret

0000000080008328 <kinit>:
    80008328:	fc010113          	addi	sp,sp,-64
    8000832c:	02913423          	sd	s1,40(sp)
    80008330:	fffff7b7          	lui	a5,0xfffff
    80008334:	00006497          	auipc	s1,0x6
    80008338:	b7b48493          	addi	s1,s1,-1157 # 8000deaf <end+0xfff>
    8000833c:	02813823          	sd	s0,48(sp)
    80008340:	01313c23          	sd	s3,24(sp)
    80008344:	00f4f4b3          	and	s1,s1,a5
    80008348:	02113c23          	sd	ra,56(sp)
    8000834c:	03213023          	sd	s2,32(sp)
    80008350:	01413823          	sd	s4,16(sp)
    80008354:	01513423          	sd	s5,8(sp)
    80008358:	04010413          	addi	s0,sp,64
    8000835c:	000017b7          	lui	a5,0x1
    80008360:	01100993          	li	s3,17
    80008364:	00f487b3          	add	a5,s1,a5
    80008368:	01b99993          	slli	s3,s3,0x1b
    8000836c:	06f9e063          	bltu	s3,a5,800083cc <kinit+0xa4>
    80008370:	00005a97          	auipc	s5,0x5
    80008374:	b40a8a93          	addi	s5,s5,-1216 # 8000ceb0 <end>
    80008378:	0754ec63          	bltu	s1,s5,800083f0 <kinit+0xc8>
    8000837c:	0734fa63          	bgeu	s1,s3,800083f0 <kinit+0xc8>
    80008380:	00088a37          	lui	s4,0x88
    80008384:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80008388:	00003917          	auipc	s2,0x3
    8000838c:	78890913          	addi	s2,s2,1928 # 8000bb10 <kmem>
    80008390:	00ca1a13          	slli	s4,s4,0xc
    80008394:	0140006f          	j	800083a8 <kinit+0x80>
    80008398:	000017b7          	lui	a5,0x1
    8000839c:	00f484b3          	add	s1,s1,a5
    800083a0:	0554e863          	bltu	s1,s5,800083f0 <kinit+0xc8>
    800083a4:	0534f663          	bgeu	s1,s3,800083f0 <kinit+0xc8>
    800083a8:	00001637          	lui	a2,0x1
    800083ac:	00100593          	li	a1,1
    800083b0:	00048513          	mv	a0,s1
    800083b4:	00000097          	auipc	ra,0x0
    800083b8:	5e4080e7          	jalr	1508(ra) # 80008998 <__memset>
    800083bc:	00093783          	ld	a5,0(s2)
    800083c0:	00f4b023          	sd	a5,0(s1)
    800083c4:	00993023          	sd	s1,0(s2)
    800083c8:	fd4498e3          	bne	s1,s4,80008398 <kinit+0x70>
    800083cc:	03813083          	ld	ra,56(sp)
    800083d0:	03013403          	ld	s0,48(sp)
    800083d4:	02813483          	ld	s1,40(sp)
    800083d8:	02013903          	ld	s2,32(sp)
    800083dc:	01813983          	ld	s3,24(sp)
    800083e0:	01013a03          	ld	s4,16(sp)
    800083e4:	00813a83          	ld	s5,8(sp)
    800083e8:	04010113          	addi	sp,sp,64
    800083ec:	00008067          	ret
    800083f0:	00001517          	auipc	a0,0x1
    800083f4:	43050513          	addi	a0,a0,1072 # 80009820 <digits+0x18>
    800083f8:	fffff097          	auipc	ra,0xfffff
    800083fc:	4b4080e7          	jalr	1204(ra) # 800078ac <panic>

0000000080008400 <freerange>:
    80008400:	fc010113          	addi	sp,sp,-64
    80008404:	000017b7          	lui	a5,0x1
    80008408:	02913423          	sd	s1,40(sp)
    8000840c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80008410:	009504b3          	add	s1,a0,s1
    80008414:	fffff537          	lui	a0,0xfffff
    80008418:	02813823          	sd	s0,48(sp)
    8000841c:	02113c23          	sd	ra,56(sp)
    80008420:	03213023          	sd	s2,32(sp)
    80008424:	01313c23          	sd	s3,24(sp)
    80008428:	01413823          	sd	s4,16(sp)
    8000842c:	01513423          	sd	s5,8(sp)
    80008430:	01613023          	sd	s6,0(sp)
    80008434:	04010413          	addi	s0,sp,64
    80008438:	00a4f4b3          	and	s1,s1,a0
    8000843c:	00f487b3          	add	a5,s1,a5
    80008440:	06f5e463          	bltu	a1,a5,800084a8 <freerange+0xa8>
    80008444:	00005a97          	auipc	s5,0x5
    80008448:	a6ca8a93          	addi	s5,s5,-1428 # 8000ceb0 <end>
    8000844c:	0954e263          	bltu	s1,s5,800084d0 <freerange+0xd0>
    80008450:	01100993          	li	s3,17
    80008454:	01b99993          	slli	s3,s3,0x1b
    80008458:	0734fc63          	bgeu	s1,s3,800084d0 <freerange+0xd0>
    8000845c:	00058a13          	mv	s4,a1
    80008460:	00003917          	auipc	s2,0x3
    80008464:	6b090913          	addi	s2,s2,1712 # 8000bb10 <kmem>
    80008468:	00002b37          	lui	s6,0x2
    8000846c:	0140006f          	j	80008480 <freerange+0x80>
    80008470:	000017b7          	lui	a5,0x1
    80008474:	00f484b3          	add	s1,s1,a5
    80008478:	0554ec63          	bltu	s1,s5,800084d0 <freerange+0xd0>
    8000847c:	0534fa63          	bgeu	s1,s3,800084d0 <freerange+0xd0>
    80008480:	00001637          	lui	a2,0x1
    80008484:	00100593          	li	a1,1
    80008488:	00048513          	mv	a0,s1
    8000848c:	00000097          	auipc	ra,0x0
    80008490:	50c080e7          	jalr	1292(ra) # 80008998 <__memset>
    80008494:	00093703          	ld	a4,0(s2)
    80008498:	016487b3          	add	a5,s1,s6
    8000849c:	00e4b023          	sd	a4,0(s1)
    800084a0:	00993023          	sd	s1,0(s2)
    800084a4:	fcfa76e3          	bgeu	s4,a5,80008470 <freerange+0x70>
    800084a8:	03813083          	ld	ra,56(sp)
    800084ac:	03013403          	ld	s0,48(sp)
    800084b0:	02813483          	ld	s1,40(sp)
    800084b4:	02013903          	ld	s2,32(sp)
    800084b8:	01813983          	ld	s3,24(sp)
    800084bc:	01013a03          	ld	s4,16(sp)
    800084c0:	00813a83          	ld	s5,8(sp)
    800084c4:	00013b03          	ld	s6,0(sp)
    800084c8:	04010113          	addi	sp,sp,64
    800084cc:	00008067          	ret
    800084d0:	00001517          	auipc	a0,0x1
    800084d4:	35050513          	addi	a0,a0,848 # 80009820 <digits+0x18>
    800084d8:	fffff097          	auipc	ra,0xfffff
    800084dc:	3d4080e7          	jalr	980(ra) # 800078ac <panic>

00000000800084e0 <kfree>:
    800084e0:	fe010113          	addi	sp,sp,-32
    800084e4:	00813823          	sd	s0,16(sp)
    800084e8:	00113c23          	sd	ra,24(sp)
    800084ec:	00913423          	sd	s1,8(sp)
    800084f0:	02010413          	addi	s0,sp,32
    800084f4:	03451793          	slli	a5,a0,0x34
    800084f8:	04079c63          	bnez	a5,80008550 <kfree+0x70>
    800084fc:	00005797          	auipc	a5,0x5
    80008500:	9b478793          	addi	a5,a5,-1612 # 8000ceb0 <end>
    80008504:	00050493          	mv	s1,a0
    80008508:	04f56463          	bltu	a0,a5,80008550 <kfree+0x70>
    8000850c:	01100793          	li	a5,17
    80008510:	01b79793          	slli	a5,a5,0x1b
    80008514:	02f57e63          	bgeu	a0,a5,80008550 <kfree+0x70>
    80008518:	00001637          	lui	a2,0x1
    8000851c:	00100593          	li	a1,1
    80008520:	00000097          	auipc	ra,0x0
    80008524:	478080e7          	jalr	1144(ra) # 80008998 <__memset>
    80008528:	00003797          	auipc	a5,0x3
    8000852c:	5e878793          	addi	a5,a5,1512 # 8000bb10 <kmem>
    80008530:	0007b703          	ld	a4,0(a5)
    80008534:	01813083          	ld	ra,24(sp)
    80008538:	01013403          	ld	s0,16(sp)
    8000853c:	00e4b023          	sd	a4,0(s1)
    80008540:	0097b023          	sd	s1,0(a5)
    80008544:	00813483          	ld	s1,8(sp)
    80008548:	02010113          	addi	sp,sp,32
    8000854c:	00008067          	ret
    80008550:	00001517          	auipc	a0,0x1
    80008554:	2d050513          	addi	a0,a0,720 # 80009820 <digits+0x18>
    80008558:	fffff097          	auipc	ra,0xfffff
    8000855c:	354080e7          	jalr	852(ra) # 800078ac <panic>

0000000080008560 <kalloc>:
    80008560:	fe010113          	addi	sp,sp,-32
    80008564:	00813823          	sd	s0,16(sp)
    80008568:	00913423          	sd	s1,8(sp)
    8000856c:	00113c23          	sd	ra,24(sp)
    80008570:	02010413          	addi	s0,sp,32
    80008574:	00003797          	auipc	a5,0x3
    80008578:	59c78793          	addi	a5,a5,1436 # 8000bb10 <kmem>
    8000857c:	0007b483          	ld	s1,0(a5)
    80008580:	02048063          	beqz	s1,800085a0 <kalloc+0x40>
    80008584:	0004b703          	ld	a4,0(s1)
    80008588:	00001637          	lui	a2,0x1
    8000858c:	00500593          	li	a1,5
    80008590:	00048513          	mv	a0,s1
    80008594:	00e7b023          	sd	a4,0(a5)
    80008598:	00000097          	auipc	ra,0x0
    8000859c:	400080e7          	jalr	1024(ra) # 80008998 <__memset>
    800085a0:	01813083          	ld	ra,24(sp)
    800085a4:	01013403          	ld	s0,16(sp)
    800085a8:	00048513          	mv	a0,s1
    800085ac:	00813483          	ld	s1,8(sp)
    800085b0:	02010113          	addi	sp,sp,32
    800085b4:	00008067          	ret

00000000800085b8 <initlock>:
    800085b8:	ff010113          	addi	sp,sp,-16
    800085bc:	00813423          	sd	s0,8(sp)
    800085c0:	01010413          	addi	s0,sp,16
    800085c4:	00813403          	ld	s0,8(sp)
    800085c8:	00b53423          	sd	a1,8(a0)
    800085cc:	00052023          	sw	zero,0(a0)
    800085d0:	00053823          	sd	zero,16(a0)
    800085d4:	01010113          	addi	sp,sp,16
    800085d8:	00008067          	ret

00000000800085dc <acquire>:
    800085dc:	fe010113          	addi	sp,sp,-32
    800085e0:	00813823          	sd	s0,16(sp)
    800085e4:	00913423          	sd	s1,8(sp)
    800085e8:	00113c23          	sd	ra,24(sp)
    800085ec:	01213023          	sd	s2,0(sp)
    800085f0:	02010413          	addi	s0,sp,32
    800085f4:	00050493          	mv	s1,a0
    800085f8:	10002973          	csrr	s2,sstatus
    800085fc:	100027f3          	csrr	a5,sstatus
    80008600:	ffd7f793          	andi	a5,a5,-3
    80008604:	10079073          	csrw	sstatus,a5
    80008608:	fffff097          	auipc	ra,0xfffff
    8000860c:	8e4080e7          	jalr	-1820(ra) # 80006eec <mycpu>
    80008610:	07852783          	lw	a5,120(a0)
    80008614:	06078e63          	beqz	a5,80008690 <acquire+0xb4>
    80008618:	fffff097          	auipc	ra,0xfffff
    8000861c:	8d4080e7          	jalr	-1836(ra) # 80006eec <mycpu>
    80008620:	07852783          	lw	a5,120(a0)
    80008624:	0004a703          	lw	a4,0(s1)
    80008628:	0017879b          	addiw	a5,a5,1
    8000862c:	06f52c23          	sw	a5,120(a0)
    80008630:	04071063          	bnez	a4,80008670 <acquire+0x94>
    80008634:	00100713          	li	a4,1
    80008638:	00070793          	mv	a5,a4
    8000863c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80008640:	0007879b          	sext.w	a5,a5
    80008644:	fe079ae3          	bnez	a5,80008638 <acquire+0x5c>
    80008648:	0ff0000f          	fence
    8000864c:	fffff097          	auipc	ra,0xfffff
    80008650:	8a0080e7          	jalr	-1888(ra) # 80006eec <mycpu>
    80008654:	01813083          	ld	ra,24(sp)
    80008658:	01013403          	ld	s0,16(sp)
    8000865c:	00a4b823          	sd	a0,16(s1)
    80008660:	00013903          	ld	s2,0(sp)
    80008664:	00813483          	ld	s1,8(sp)
    80008668:	02010113          	addi	sp,sp,32
    8000866c:	00008067          	ret
    80008670:	0104b903          	ld	s2,16(s1)
    80008674:	fffff097          	auipc	ra,0xfffff
    80008678:	878080e7          	jalr	-1928(ra) # 80006eec <mycpu>
    8000867c:	faa91ce3          	bne	s2,a0,80008634 <acquire+0x58>
    80008680:	00001517          	auipc	a0,0x1
    80008684:	1a850513          	addi	a0,a0,424 # 80009828 <digits+0x20>
    80008688:	fffff097          	auipc	ra,0xfffff
    8000868c:	224080e7          	jalr	548(ra) # 800078ac <panic>
    80008690:	00195913          	srli	s2,s2,0x1
    80008694:	fffff097          	auipc	ra,0xfffff
    80008698:	858080e7          	jalr	-1960(ra) # 80006eec <mycpu>
    8000869c:	00197913          	andi	s2,s2,1
    800086a0:	07252e23          	sw	s2,124(a0)
    800086a4:	f75ff06f          	j	80008618 <acquire+0x3c>

00000000800086a8 <release>:
    800086a8:	fe010113          	addi	sp,sp,-32
    800086ac:	00813823          	sd	s0,16(sp)
    800086b0:	00113c23          	sd	ra,24(sp)
    800086b4:	00913423          	sd	s1,8(sp)
    800086b8:	01213023          	sd	s2,0(sp)
    800086bc:	02010413          	addi	s0,sp,32
    800086c0:	00052783          	lw	a5,0(a0)
    800086c4:	00079a63          	bnez	a5,800086d8 <release+0x30>
    800086c8:	00001517          	auipc	a0,0x1
    800086cc:	16850513          	addi	a0,a0,360 # 80009830 <digits+0x28>
    800086d0:	fffff097          	auipc	ra,0xfffff
    800086d4:	1dc080e7          	jalr	476(ra) # 800078ac <panic>
    800086d8:	01053903          	ld	s2,16(a0)
    800086dc:	00050493          	mv	s1,a0
    800086e0:	fffff097          	auipc	ra,0xfffff
    800086e4:	80c080e7          	jalr	-2036(ra) # 80006eec <mycpu>
    800086e8:	fea910e3          	bne	s2,a0,800086c8 <release+0x20>
    800086ec:	0004b823          	sd	zero,16(s1)
    800086f0:	0ff0000f          	fence
    800086f4:	0f50000f          	fence	iorw,ow
    800086f8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800086fc:	ffffe097          	auipc	ra,0xffffe
    80008700:	7f0080e7          	jalr	2032(ra) # 80006eec <mycpu>
    80008704:	100027f3          	csrr	a5,sstatus
    80008708:	0027f793          	andi	a5,a5,2
    8000870c:	04079a63          	bnez	a5,80008760 <release+0xb8>
    80008710:	07852783          	lw	a5,120(a0)
    80008714:	02f05e63          	blez	a5,80008750 <release+0xa8>
    80008718:	fff7871b          	addiw	a4,a5,-1
    8000871c:	06e52c23          	sw	a4,120(a0)
    80008720:	00071c63          	bnez	a4,80008738 <release+0x90>
    80008724:	07c52783          	lw	a5,124(a0)
    80008728:	00078863          	beqz	a5,80008738 <release+0x90>
    8000872c:	100027f3          	csrr	a5,sstatus
    80008730:	0027e793          	ori	a5,a5,2
    80008734:	10079073          	csrw	sstatus,a5
    80008738:	01813083          	ld	ra,24(sp)
    8000873c:	01013403          	ld	s0,16(sp)
    80008740:	00813483          	ld	s1,8(sp)
    80008744:	00013903          	ld	s2,0(sp)
    80008748:	02010113          	addi	sp,sp,32
    8000874c:	00008067          	ret
    80008750:	00001517          	auipc	a0,0x1
    80008754:	10050513          	addi	a0,a0,256 # 80009850 <digits+0x48>
    80008758:	fffff097          	auipc	ra,0xfffff
    8000875c:	154080e7          	jalr	340(ra) # 800078ac <panic>
    80008760:	00001517          	auipc	a0,0x1
    80008764:	0d850513          	addi	a0,a0,216 # 80009838 <digits+0x30>
    80008768:	fffff097          	auipc	ra,0xfffff
    8000876c:	144080e7          	jalr	324(ra) # 800078ac <panic>

0000000080008770 <holding>:
    80008770:	00052783          	lw	a5,0(a0)
    80008774:	00079663          	bnez	a5,80008780 <holding+0x10>
    80008778:	00000513          	li	a0,0
    8000877c:	00008067          	ret
    80008780:	fe010113          	addi	sp,sp,-32
    80008784:	00813823          	sd	s0,16(sp)
    80008788:	00913423          	sd	s1,8(sp)
    8000878c:	00113c23          	sd	ra,24(sp)
    80008790:	02010413          	addi	s0,sp,32
    80008794:	01053483          	ld	s1,16(a0)
    80008798:	ffffe097          	auipc	ra,0xffffe
    8000879c:	754080e7          	jalr	1876(ra) # 80006eec <mycpu>
    800087a0:	01813083          	ld	ra,24(sp)
    800087a4:	01013403          	ld	s0,16(sp)
    800087a8:	40a48533          	sub	a0,s1,a0
    800087ac:	00153513          	seqz	a0,a0
    800087b0:	00813483          	ld	s1,8(sp)
    800087b4:	02010113          	addi	sp,sp,32
    800087b8:	00008067          	ret

00000000800087bc <push_off>:
    800087bc:	fe010113          	addi	sp,sp,-32
    800087c0:	00813823          	sd	s0,16(sp)
    800087c4:	00113c23          	sd	ra,24(sp)
    800087c8:	00913423          	sd	s1,8(sp)
    800087cc:	02010413          	addi	s0,sp,32
    800087d0:	100024f3          	csrr	s1,sstatus
    800087d4:	100027f3          	csrr	a5,sstatus
    800087d8:	ffd7f793          	andi	a5,a5,-3
    800087dc:	10079073          	csrw	sstatus,a5
    800087e0:	ffffe097          	auipc	ra,0xffffe
    800087e4:	70c080e7          	jalr	1804(ra) # 80006eec <mycpu>
    800087e8:	07852783          	lw	a5,120(a0)
    800087ec:	02078663          	beqz	a5,80008818 <push_off+0x5c>
    800087f0:	ffffe097          	auipc	ra,0xffffe
    800087f4:	6fc080e7          	jalr	1788(ra) # 80006eec <mycpu>
    800087f8:	07852783          	lw	a5,120(a0)
    800087fc:	01813083          	ld	ra,24(sp)
    80008800:	01013403          	ld	s0,16(sp)
    80008804:	0017879b          	addiw	a5,a5,1
    80008808:	06f52c23          	sw	a5,120(a0)
    8000880c:	00813483          	ld	s1,8(sp)
    80008810:	02010113          	addi	sp,sp,32
    80008814:	00008067          	ret
    80008818:	0014d493          	srli	s1,s1,0x1
    8000881c:	ffffe097          	auipc	ra,0xffffe
    80008820:	6d0080e7          	jalr	1744(ra) # 80006eec <mycpu>
    80008824:	0014f493          	andi	s1,s1,1
    80008828:	06952e23          	sw	s1,124(a0)
    8000882c:	fc5ff06f          	j	800087f0 <push_off+0x34>

0000000080008830 <pop_off>:
    80008830:	ff010113          	addi	sp,sp,-16
    80008834:	00813023          	sd	s0,0(sp)
    80008838:	00113423          	sd	ra,8(sp)
    8000883c:	01010413          	addi	s0,sp,16
    80008840:	ffffe097          	auipc	ra,0xffffe
    80008844:	6ac080e7          	jalr	1708(ra) # 80006eec <mycpu>
    80008848:	100027f3          	csrr	a5,sstatus
    8000884c:	0027f793          	andi	a5,a5,2
    80008850:	04079663          	bnez	a5,8000889c <pop_off+0x6c>
    80008854:	07852783          	lw	a5,120(a0)
    80008858:	02f05a63          	blez	a5,8000888c <pop_off+0x5c>
    8000885c:	fff7871b          	addiw	a4,a5,-1
    80008860:	06e52c23          	sw	a4,120(a0)
    80008864:	00071c63          	bnez	a4,8000887c <pop_off+0x4c>
    80008868:	07c52783          	lw	a5,124(a0)
    8000886c:	00078863          	beqz	a5,8000887c <pop_off+0x4c>
    80008870:	100027f3          	csrr	a5,sstatus
    80008874:	0027e793          	ori	a5,a5,2
    80008878:	10079073          	csrw	sstatus,a5
    8000887c:	00813083          	ld	ra,8(sp)
    80008880:	00013403          	ld	s0,0(sp)
    80008884:	01010113          	addi	sp,sp,16
    80008888:	00008067          	ret
    8000888c:	00001517          	auipc	a0,0x1
    80008890:	fc450513          	addi	a0,a0,-60 # 80009850 <digits+0x48>
    80008894:	fffff097          	auipc	ra,0xfffff
    80008898:	018080e7          	jalr	24(ra) # 800078ac <panic>
    8000889c:	00001517          	auipc	a0,0x1
    800088a0:	f9c50513          	addi	a0,a0,-100 # 80009838 <digits+0x30>
    800088a4:	fffff097          	auipc	ra,0xfffff
    800088a8:	008080e7          	jalr	8(ra) # 800078ac <panic>

00000000800088ac <push_on>:
    800088ac:	fe010113          	addi	sp,sp,-32
    800088b0:	00813823          	sd	s0,16(sp)
    800088b4:	00113c23          	sd	ra,24(sp)
    800088b8:	00913423          	sd	s1,8(sp)
    800088bc:	02010413          	addi	s0,sp,32
    800088c0:	100024f3          	csrr	s1,sstatus
    800088c4:	100027f3          	csrr	a5,sstatus
    800088c8:	0027e793          	ori	a5,a5,2
    800088cc:	10079073          	csrw	sstatus,a5
    800088d0:	ffffe097          	auipc	ra,0xffffe
    800088d4:	61c080e7          	jalr	1564(ra) # 80006eec <mycpu>
    800088d8:	07852783          	lw	a5,120(a0)
    800088dc:	02078663          	beqz	a5,80008908 <push_on+0x5c>
    800088e0:	ffffe097          	auipc	ra,0xffffe
    800088e4:	60c080e7          	jalr	1548(ra) # 80006eec <mycpu>
    800088e8:	07852783          	lw	a5,120(a0)
    800088ec:	01813083          	ld	ra,24(sp)
    800088f0:	01013403          	ld	s0,16(sp)
    800088f4:	0017879b          	addiw	a5,a5,1
    800088f8:	06f52c23          	sw	a5,120(a0)
    800088fc:	00813483          	ld	s1,8(sp)
    80008900:	02010113          	addi	sp,sp,32
    80008904:	00008067          	ret
    80008908:	0014d493          	srli	s1,s1,0x1
    8000890c:	ffffe097          	auipc	ra,0xffffe
    80008910:	5e0080e7          	jalr	1504(ra) # 80006eec <mycpu>
    80008914:	0014f493          	andi	s1,s1,1
    80008918:	06952e23          	sw	s1,124(a0)
    8000891c:	fc5ff06f          	j	800088e0 <push_on+0x34>

0000000080008920 <pop_on>:
    80008920:	ff010113          	addi	sp,sp,-16
    80008924:	00813023          	sd	s0,0(sp)
    80008928:	00113423          	sd	ra,8(sp)
    8000892c:	01010413          	addi	s0,sp,16
    80008930:	ffffe097          	auipc	ra,0xffffe
    80008934:	5bc080e7          	jalr	1468(ra) # 80006eec <mycpu>
    80008938:	100027f3          	csrr	a5,sstatus
    8000893c:	0027f793          	andi	a5,a5,2
    80008940:	04078463          	beqz	a5,80008988 <pop_on+0x68>
    80008944:	07852783          	lw	a5,120(a0)
    80008948:	02f05863          	blez	a5,80008978 <pop_on+0x58>
    8000894c:	fff7879b          	addiw	a5,a5,-1
    80008950:	06f52c23          	sw	a5,120(a0)
    80008954:	07853783          	ld	a5,120(a0)
    80008958:	00079863          	bnez	a5,80008968 <pop_on+0x48>
    8000895c:	100027f3          	csrr	a5,sstatus
    80008960:	ffd7f793          	andi	a5,a5,-3
    80008964:	10079073          	csrw	sstatus,a5
    80008968:	00813083          	ld	ra,8(sp)
    8000896c:	00013403          	ld	s0,0(sp)
    80008970:	01010113          	addi	sp,sp,16
    80008974:	00008067          	ret
    80008978:	00001517          	auipc	a0,0x1
    8000897c:	f0050513          	addi	a0,a0,-256 # 80009878 <digits+0x70>
    80008980:	fffff097          	auipc	ra,0xfffff
    80008984:	f2c080e7          	jalr	-212(ra) # 800078ac <panic>
    80008988:	00001517          	auipc	a0,0x1
    8000898c:	ed050513          	addi	a0,a0,-304 # 80009858 <digits+0x50>
    80008990:	fffff097          	auipc	ra,0xfffff
    80008994:	f1c080e7          	jalr	-228(ra) # 800078ac <panic>

0000000080008998 <__memset>:
    80008998:	ff010113          	addi	sp,sp,-16
    8000899c:	00813423          	sd	s0,8(sp)
    800089a0:	01010413          	addi	s0,sp,16
    800089a4:	1a060e63          	beqz	a2,80008b60 <__memset+0x1c8>
    800089a8:	40a007b3          	neg	a5,a0
    800089ac:	0077f793          	andi	a5,a5,7
    800089b0:	00778693          	addi	a3,a5,7
    800089b4:	00b00813          	li	a6,11
    800089b8:	0ff5f593          	andi	a1,a1,255
    800089bc:	fff6071b          	addiw	a4,a2,-1
    800089c0:	1b06e663          	bltu	a3,a6,80008b6c <__memset+0x1d4>
    800089c4:	1cd76463          	bltu	a4,a3,80008b8c <__memset+0x1f4>
    800089c8:	1a078e63          	beqz	a5,80008b84 <__memset+0x1ec>
    800089cc:	00b50023          	sb	a1,0(a0)
    800089d0:	00100713          	li	a4,1
    800089d4:	1ae78463          	beq	a5,a4,80008b7c <__memset+0x1e4>
    800089d8:	00b500a3          	sb	a1,1(a0)
    800089dc:	00200713          	li	a4,2
    800089e0:	1ae78a63          	beq	a5,a4,80008b94 <__memset+0x1fc>
    800089e4:	00b50123          	sb	a1,2(a0)
    800089e8:	00300713          	li	a4,3
    800089ec:	18e78463          	beq	a5,a4,80008b74 <__memset+0x1dc>
    800089f0:	00b501a3          	sb	a1,3(a0)
    800089f4:	00400713          	li	a4,4
    800089f8:	1ae78263          	beq	a5,a4,80008b9c <__memset+0x204>
    800089fc:	00b50223          	sb	a1,4(a0)
    80008a00:	00500713          	li	a4,5
    80008a04:	1ae78063          	beq	a5,a4,80008ba4 <__memset+0x20c>
    80008a08:	00b502a3          	sb	a1,5(a0)
    80008a0c:	00700713          	li	a4,7
    80008a10:	18e79e63          	bne	a5,a4,80008bac <__memset+0x214>
    80008a14:	00b50323          	sb	a1,6(a0)
    80008a18:	00700e93          	li	t4,7
    80008a1c:	00859713          	slli	a4,a1,0x8
    80008a20:	00e5e733          	or	a4,a1,a4
    80008a24:	01059e13          	slli	t3,a1,0x10
    80008a28:	01c76e33          	or	t3,a4,t3
    80008a2c:	01859313          	slli	t1,a1,0x18
    80008a30:	006e6333          	or	t1,t3,t1
    80008a34:	02059893          	slli	a7,a1,0x20
    80008a38:	40f60e3b          	subw	t3,a2,a5
    80008a3c:	011368b3          	or	a7,t1,a7
    80008a40:	02859813          	slli	a6,a1,0x28
    80008a44:	0108e833          	or	a6,a7,a6
    80008a48:	03059693          	slli	a3,a1,0x30
    80008a4c:	003e589b          	srliw	a7,t3,0x3
    80008a50:	00d866b3          	or	a3,a6,a3
    80008a54:	03859713          	slli	a4,a1,0x38
    80008a58:	00389813          	slli	a6,a7,0x3
    80008a5c:	00f507b3          	add	a5,a0,a5
    80008a60:	00e6e733          	or	a4,a3,a4
    80008a64:	000e089b          	sext.w	a7,t3
    80008a68:	00f806b3          	add	a3,a6,a5
    80008a6c:	00e7b023          	sd	a4,0(a5)
    80008a70:	00878793          	addi	a5,a5,8
    80008a74:	fed79ce3          	bne	a5,a3,80008a6c <__memset+0xd4>
    80008a78:	ff8e7793          	andi	a5,t3,-8
    80008a7c:	0007871b          	sext.w	a4,a5
    80008a80:	01d787bb          	addw	a5,a5,t4
    80008a84:	0ce88e63          	beq	a7,a4,80008b60 <__memset+0x1c8>
    80008a88:	00f50733          	add	a4,a0,a5
    80008a8c:	00b70023          	sb	a1,0(a4)
    80008a90:	0017871b          	addiw	a4,a5,1
    80008a94:	0cc77663          	bgeu	a4,a2,80008b60 <__memset+0x1c8>
    80008a98:	00e50733          	add	a4,a0,a4
    80008a9c:	00b70023          	sb	a1,0(a4)
    80008aa0:	0027871b          	addiw	a4,a5,2
    80008aa4:	0ac77e63          	bgeu	a4,a2,80008b60 <__memset+0x1c8>
    80008aa8:	00e50733          	add	a4,a0,a4
    80008aac:	00b70023          	sb	a1,0(a4)
    80008ab0:	0037871b          	addiw	a4,a5,3
    80008ab4:	0ac77663          	bgeu	a4,a2,80008b60 <__memset+0x1c8>
    80008ab8:	00e50733          	add	a4,a0,a4
    80008abc:	00b70023          	sb	a1,0(a4)
    80008ac0:	0047871b          	addiw	a4,a5,4
    80008ac4:	08c77e63          	bgeu	a4,a2,80008b60 <__memset+0x1c8>
    80008ac8:	00e50733          	add	a4,a0,a4
    80008acc:	00b70023          	sb	a1,0(a4)
    80008ad0:	0057871b          	addiw	a4,a5,5
    80008ad4:	08c77663          	bgeu	a4,a2,80008b60 <__memset+0x1c8>
    80008ad8:	00e50733          	add	a4,a0,a4
    80008adc:	00b70023          	sb	a1,0(a4)
    80008ae0:	0067871b          	addiw	a4,a5,6
    80008ae4:	06c77e63          	bgeu	a4,a2,80008b60 <__memset+0x1c8>
    80008ae8:	00e50733          	add	a4,a0,a4
    80008aec:	00b70023          	sb	a1,0(a4)
    80008af0:	0077871b          	addiw	a4,a5,7
    80008af4:	06c77663          	bgeu	a4,a2,80008b60 <__memset+0x1c8>
    80008af8:	00e50733          	add	a4,a0,a4
    80008afc:	00b70023          	sb	a1,0(a4)
    80008b00:	0087871b          	addiw	a4,a5,8
    80008b04:	04c77e63          	bgeu	a4,a2,80008b60 <__memset+0x1c8>
    80008b08:	00e50733          	add	a4,a0,a4
    80008b0c:	00b70023          	sb	a1,0(a4)
    80008b10:	0097871b          	addiw	a4,a5,9
    80008b14:	04c77663          	bgeu	a4,a2,80008b60 <__memset+0x1c8>
    80008b18:	00e50733          	add	a4,a0,a4
    80008b1c:	00b70023          	sb	a1,0(a4)
    80008b20:	00a7871b          	addiw	a4,a5,10
    80008b24:	02c77e63          	bgeu	a4,a2,80008b60 <__memset+0x1c8>
    80008b28:	00e50733          	add	a4,a0,a4
    80008b2c:	00b70023          	sb	a1,0(a4)
    80008b30:	00b7871b          	addiw	a4,a5,11
    80008b34:	02c77663          	bgeu	a4,a2,80008b60 <__memset+0x1c8>
    80008b38:	00e50733          	add	a4,a0,a4
    80008b3c:	00b70023          	sb	a1,0(a4)
    80008b40:	00c7871b          	addiw	a4,a5,12
    80008b44:	00c77e63          	bgeu	a4,a2,80008b60 <__memset+0x1c8>
    80008b48:	00e50733          	add	a4,a0,a4
    80008b4c:	00b70023          	sb	a1,0(a4)
    80008b50:	00d7879b          	addiw	a5,a5,13
    80008b54:	00c7f663          	bgeu	a5,a2,80008b60 <__memset+0x1c8>
    80008b58:	00f507b3          	add	a5,a0,a5
    80008b5c:	00b78023          	sb	a1,0(a5)
    80008b60:	00813403          	ld	s0,8(sp)
    80008b64:	01010113          	addi	sp,sp,16
    80008b68:	00008067          	ret
    80008b6c:	00b00693          	li	a3,11
    80008b70:	e55ff06f          	j	800089c4 <__memset+0x2c>
    80008b74:	00300e93          	li	t4,3
    80008b78:	ea5ff06f          	j	80008a1c <__memset+0x84>
    80008b7c:	00100e93          	li	t4,1
    80008b80:	e9dff06f          	j	80008a1c <__memset+0x84>
    80008b84:	00000e93          	li	t4,0
    80008b88:	e95ff06f          	j	80008a1c <__memset+0x84>
    80008b8c:	00000793          	li	a5,0
    80008b90:	ef9ff06f          	j	80008a88 <__memset+0xf0>
    80008b94:	00200e93          	li	t4,2
    80008b98:	e85ff06f          	j	80008a1c <__memset+0x84>
    80008b9c:	00400e93          	li	t4,4
    80008ba0:	e7dff06f          	j	80008a1c <__memset+0x84>
    80008ba4:	00500e93          	li	t4,5
    80008ba8:	e75ff06f          	j	80008a1c <__memset+0x84>
    80008bac:	00600e93          	li	t4,6
    80008bb0:	e6dff06f          	j	80008a1c <__memset+0x84>

0000000080008bb4 <__memmove>:
    80008bb4:	ff010113          	addi	sp,sp,-16
    80008bb8:	00813423          	sd	s0,8(sp)
    80008bbc:	01010413          	addi	s0,sp,16
    80008bc0:	0e060863          	beqz	a2,80008cb0 <__memmove+0xfc>
    80008bc4:	fff6069b          	addiw	a3,a2,-1
    80008bc8:	0006881b          	sext.w	a6,a3
    80008bcc:	0ea5e863          	bltu	a1,a0,80008cbc <__memmove+0x108>
    80008bd0:	00758713          	addi	a4,a1,7
    80008bd4:	00a5e7b3          	or	a5,a1,a0
    80008bd8:	40a70733          	sub	a4,a4,a0
    80008bdc:	0077f793          	andi	a5,a5,7
    80008be0:	00f73713          	sltiu	a4,a4,15
    80008be4:	00174713          	xori	a4,a4,1
    80008be8:	0017b793          	seqz	a5,a5
    80008bec:	00e7f7b3          	and	a5,a5,a4
    80008bf0:	10078863          	beqz	a5,80008d00 <__memmove+0x14c>
    80008bf4:	00900793          	li	a5,9
    80008bf8:	1107f463          	bgeu	a5,a6,80008d00 <__memmove+0x14c>
    80008bfc:	0036581b          	srliw	a6,a2,0x3
    80008c00:	fff8081b          	addiw	a6,a6,-1
    80008c04:	02081813          	slli	a6,a6,0x20
    80008c08:	01d85893          	srli	a7,a6,0x1d
    80008c0c:	00858813          	addi	a6,a1,8
    80008c10:	00058793          	mv	a5,a1
    80008c14:	00050713          	mv	a4,a0
    80008c18:	01088833          	add	a6,a7,a6
    80008c1c:	0007b883          	ld	a7,0(a5)
    80008c20:	00878793          	addi	a5,a5,8
    80008c24:	00870713          	addi	a4,a4,8
    80008c28:	ff173c23          	sd	a7,-8(a4)
    80008c2c:	ff0798e3          	bne	a5,a6,80008c1c <__memmove+0x68>
    80008c30:	ff867713          	andi	a4,a2,-8
    80008c34:	02071793          	slli	a5,a4,0x20
    80008c38:	0207d793          	srli	a5,a5,0x20
    80008c3c:	00f585b3          	add	a1,a1,a5
    80008c40:	40e686bb          	subw	a3,a3,a4
    80008c44:	00f507b3          	add	a5,a0,a5
    80008c48:	06e60463          	beq	a2,a4,80008cb0 <__memmove+0xfc>
    80008c4c:	0005c703          	lbu	a4,0(a1)
    80008c50:	00e78023          	sb	a4,0(a5)
    80008c54:	04068e63          	beqz	a3,80008cb0 <__memmove+0xfc>
    80008c58:	0015c603          	lbu	a2,1(a1)
    80008c5c:	00100713          	li	a4,1
    80008c60:	00c780a3          	sb	a2,1(a5)
    80008c64:	04e68663          	beq	a3,a4,80008cb0 <__memmove+0xfc>
    80008c68:	0025c603          	lbu	a2,2(a1)
    80008c6c:	00200713          	li	a4,2
    80008c70:	00c78123          	sb	a2,2(a5)
    80008c74:	02e68e63          	beq	a3,a4,80008cb0 <__memmove+0xfc>
    80008c78:	0035c603          	lbu	a2,3(a1)
    80008c7c:	00300713          	li	a4,3
    80008c80:	00c781a3          	sb	a2,3(a5)
    80008c84:	02e68663          	beq	a3,a4,80008cb0 <__memmove+0xfc>
    80008c88:	0045c603          	lbu	a2,4(a1)
    80008c8c:	00400713          	li	a4,4
    80008c90:	00c78223          	sb	a2,4(a5)
    80008c94:	00e68e63          	beq	a3,a4,80008cb0 <__memmove+0xfc>
    80008c98:	0055c603          	lbu	a2,5(a1)
    80008c9c:	00500713          	li	a4,5
    80008ca0:	00c782a3          	sb	a2,5(a5)
    80008ca4:	00e68663          	beq	a3,a4,80008cb0 <__memmove+0xfc>
    80008ca8:	0065c703          	lbu	a4,6(a1)
    80008cac:	00e78323          	sb	a4,6(a5)
    80008cb0:	00813403          	ld	s0,8(sp)
    80008cb4:	01010113          	addi	sp,sp,16
    80008cb8:	00008067          	ret
    80008cbc:	02061713          	slli	a4,a2,0x20
    80008cc0:	02075713          	srli	a4,a4,0x20
    80008cc4:	00e587b3          	add	a5,a1,a4
    80008cc8:	f0f574e3          	bgeu	a0,a5,80008bd0 <__memmove+0x1c>
    80008ccc:	02069613          	slli	a2,a3,0x20
    80008cd0:	02065613          	srli	a2,a2,0x20
    80008cd4:	fff64613          	not	a2,a2
    80008cd8:	00e50733          	add	a4,a0,a4
    80008cdc:	00c78633          	add	a2,a5,a2
    80008ce0:	fff7c683          	lbu	a3,-1(a5)
    80008ce4:	fff78793          	addi	a5,a5,-1
    80008ce8:	fff70713          	addi	a4,a4,-1
    80008cec:	00d70023          	sb	a3,0(a4)
    80008cf0:	fec798e3          	bne	a5,a2,80008ce0 <__memmove+0x12c>
    80008cf4:	00813403          	ld	s0,8(sp)
    80008cf8:	01010113          	addi	sp,sp,16
    80008cfc:	00008067          	ret
    80008d00:	02069713          	slli	a4,a3,0x20
    80008d04:	02075713          	srli	a4,a4,0x20
    80008d08:	00170713          	addi	a4,a4,1
    80008d0c:	00e50733          	add	a4,a0,a4
    80008d10:	00050793          	mv	a5,a0
    80008d14:	0005c683          	lbu	a3,0(a1)
    80008d18:	00178793          	addi	a5,a5,1
    80008d1c:	00158593          	addi	a1,a1,1
    80008d20:	fed78fa3          	sb	a3,-1(a5)
    80008d24:	fee798e3          	bne	a5,a4,80008d14 <__memmove+0x160>
    80008d28:	f89ff06f          	j	80008cb0 <__memmove+0xfc>
	...
