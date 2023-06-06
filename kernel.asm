
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000d117          	auipc	sp,0xd
    80000004:	c3813103          	ld	sp,-968(sp) # 8000cc38 <_GLOBAL_OFFSET_TABLE_+0x40>
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
    80001184:	521000ef          	jal	ra,80001ea4 <interruptRoutine>

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

0000000080001660 <_ZN8KConsole12initKConsoleEv>:
sem_t KConsole::outputSem = nullptr;
char* KConsole::dr = nullptr;
uint8* KConsole::sr = nullptr;

void KConsole::initKConsole() {
	if(initialized) return;
    80001660:	0000b797          	auipc	a5,0xb
    80001664:	6607c783          	lbu	a5,1632(a5) # 8000ccc0 <_ZN8KConsole11initializedE>
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
    80001688:	63c48493          	addi	s1,s1,1596 # 8000ccc0 <_ZN8KConsole11initializedE>
    8000168c:	0000b797          	auipc	a5,0xb
    80001690:	5747b783          	ld	a5,1396(a5) # 8000cc00 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001694:	0007b783          	ld	a5,0(a5)
    80001698:	00f4b423          	sd	a5,8(s1)
	sr = (uint8*)CONSOLE_STATUS;
    8000169c:	0000b797          	auipc	a5,0xb
    800016a0:	57c7b783          	ld	a5,1404(a5) # 8000cc18 <_GLOBAL_OFFSET_TABLE_+0x20>
    800016a4:	0007b783          	ld	a5,0(a5)
    800016a8:	00f4b823          	sd	a5,16(s1)
	sem_open(&inputSem, 100);
    800016ac:	06400593          	li	a1,100
    800016b0:	0000b517          	auipc	a0,0xb
    800016b4:	62850513          	addi	a0,a0,1576 # 8000ccd8 <_ZN8KConsole8inputSemE>
    800016b8:	00000097          	auipc	ra,0x0
    800016bc:	de8080e7          	jalr	-536(ra) # 800014a0 <_Z8sem_openPP4KSemj>
	sem_open(&outputSem, 0);
    800016c0:	00000593          	li	a1,0
    800016c4:	0000b517          	auipc	a0,0xb
    800016c8:	61c50513          	addi	a0,a0,1564 # 8000cce0 <_ZN8KConsole9outputSemE>
    800016cc:	00000097          	auipc	ra,0x0
    800016d0:	dd4080e7          	jalr	-556(ra) # 800014a0 <_Z8sem_openPP4KSemj>
	initialized = true;
    800016d4:	00100793          	li	a5,1
    800016d8:	00f48023          	sb	a5,0(s1)
}
    800016dc:	01813083          	ld	ra,24(sp)
    800016e0:	01013403          	ld	s0,16(sp)
    800016e4:	00813483          	ld	s1,8(sp)
    800016e8:	02010113          	addi	sp,sp,32
    800016ec:	00008067          	ret

00000000800016f0 <_ZN8KConsole17printConsoleStateEv>:

void KConsole::printConsoleState() {
    800016f0:	fe010113          	addi	sp,sp,-32
    800016f4:	00113c23          	sd	ra,24(sp)
    800016f8:	00813823          	sd	s0,16(sp)
    800016fc:	00913423          	sd	s1,8(sp)
    80001700:	02010413          	addi	s0,sp,32
	printString("CONSOLE_RX = ");
    80001704:	00009517          	auipc	a0,0x9
    80001708:	91c50513          	addi	a0,a0,-1764 # 8000a020 <CONSOLE_STATUS+0x10>
    8000170c:	00004097          	auipc	ra,0x4
    80001710:	588080e7          	jalr	1416(ra) # 80005c94 <_Z11printStringPKc>
	printInteger((uint64)dr);
    80001714:	0000b497          	auipc	s1,0xb
    80001718:	5ac48493          	addi	s1,s1,1452 # 8000ccc0 <_ZN8KConsole11initializedE>
    8000171c:	0084b503          	ld	a0,8(s1)
    80001720:	00000097          	auipc	ra,0x0
    80001724:	0b8080e7          	jalr	184(ra) # 800017d8 <_Z12printIntegerm>
	printString("\n");
    80001728:	00009517          	auipc	a0,0x9
    8000172c:	fa850513          	addi	a0,a0,-88 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    80001730:	00004097          	auipc	ra,0x4
    80001734:	564080e7          	jalr	1380(ra) # 80005c94 <_Z11printStringPKc>
	printString("CONSOLE_STATUS = ");
    80001738:	00009517          	auipc	a0,0x9
    8000173c:	8f850513          	addi	a0,a0,-1800 # 8000a030 <CONSOLE_STATUS+0x20>
    80001740:	00004097          	auipc	ra,0x4
    80001744:	554080e7          	jalr	1364(ra) # 80005c94 <_Z11printStringPKc>
	printInteger((uint64)sr);
    80001748:	0104b503          	ld	a0,16(s1)
    8000174c:	00000097          	auipc	ra,0x0
    80001750:	08c080e7          	jalr	140(ra) # 800017d8 <_Z12printIntegerm>
	printString("\n");
    80001754:	00009517          	auipc	a0,0x9
    80001758:	f7c50513          	addi	a0,a0,-132 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    8000175c:	00004097          	auipc	ra,0x4
    80001760:	538080e7          	jalr	1336(ra) # 80005c94 <_Z11printStringPKc>
	printString("*CONSOLE_RX = ");
    80001764:	00009517          	auipc	a0,0x9
    80001768:	8e450513          	addi	a0,a0,-1820 # 8000a048 <CONSOLE_STATUS+0x38>
    8000176c:	00004097          	auipc	ra,0x4
    80001770:	528080e7          	jalr	1320(ra) # 80005c94 <_Z11printStringPKc>
	printInteger(*dr);
    80001774:	0084b783          	ld	a5,8(s1)
    80001778:	0007c503          	lbu	a0,0(a5)
    8000177c:	00000097          	auipc	ra,0x0
    80001780:	05c080e7          	jalr	92(ra) # 800017d8 <_Z12printIntegerm>
	printString("\n");
    80001784:	00009517          	auipc	a0,0x9
    80001788:	f4c50513          	addi	a0,a0,-180 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    8000178c:	00004097          	auipc	ra,0x4
    80001790:	508080e7          	jalr	1288(ra) # 80005c94 <_Z11printStringPKc>
	printString("*CONSOLE_STATUS = ");
    80001794:	00009517          	auipc	a0,0x9
    80001798:	8c450513          	addi	a0,a0,-1852 # 8000a058 <CONSOLE_STATUS+0x48>
    8000179c:	00004097          	auipc	ra,0x4
    800017a0:	4f8080e7          	jalr	1272(ra) # 80005c94 <_Z11printStringPKc>
	printInteger(*sr);
    800017a4:	0104b783          	ld	a5,16(s1)
    800017a8:	0007c503          	lbu	a0,0(a5)
    800017ac:	00000097          	auipc	ra,0x0
    800017b0:	02c080e7          	jalr	44(ra) # 800017d8 <_Z12printIntegerm>
	printString("\n");
    800017b4:	00009517          	auipc	a0,0x9
    800017b8:	f1c50513          	addi	a0,a0,-228 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    800017bc:	00004097          	auipc	ra,0x4
    800017c0:	4d8080e7          	jalr	1240(ra) # 80005c94 <_Z11printStringPKc>
}
    800017c4:	01813083          	ld	ra,24(sp)
    800017c8:	01013403          	ld	s0,16(sp)
    800017cc:	00813483          	ld	s1,8(sp)
    800017d0:	02010113          	addi	sp,sp,32
    800017d4:	00008067          	ret

00000000800017d8 <_Z12printIntegerm>:
//void println(char const *string) {
//    printString(string);
//    __putc('\n');
//}

void printInteger(uint64 integer) {
    800017d8:	ff010113          	addi	sp,sp,-16
    800017dc:	00813423          	sd	s0,8(sp)
    800017e0:	01010413          	addi	s0,sp,16
    800017e4:	00050313          	mv	t1,a0
	//stavljanje argumenata za sistemski poziv
	__asm__ volatile("mv a1, %[ptr]": :[ptr] "r"(integer):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800017e8:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x91");
    800017ec:	09100513          	li	a0,145

	__asm__ volatile("ecall");
    800017f0:	00000073          	ecall
}
    800017f4:	00813403          	ld	s0,8(sp)
    800017f8:	01010113          	addi	sp,sp,16
    800017fc:	00008067          	ret

0000000080001800 <_ZN9Scheduler3putEP3TCB>:
//Scheduler* Scheduler::singleton = nullptr;
TCB* Scheduler::head = nullptr;
TCB* Scheduler::tail = nullptr;
TCB* Scheduler::sleepingHead = nullptr;

void Scheduler::put(TCB* tcb) {
    80001800:	ff010113          	addi	sp,sp,-16
    80001804:	00813423          	sd	s0,8(sp)
    80001808:	01010413          	addi	s0,sp,16
	if (tail == nullptr) {
    8000180c:	0000b797          	auipc	a5,0xb
    80001810:	4dc7b783          	ld	a5,1244(a5) # 8000cce8 <_ZN9Scheduler4tailE>
    80001814:	00078e63          	beqz	a5,80001830 <_ZN9Scheduler3putEP3TCB+0x30>
		head = tail = tcb;
	} else {
		tail->nextInScheduler = tcb;
    80001818:	02a7bc23          	sd	a0,56(a5)
		tail = tcb;
    8000181c:	0000b797          	auipc	a5,0xb
    80001820:	4ca7b623          	sd	a0,1228(a5) # 8000cce8 <_ZN9Scheduler4tailE>
	}
}
    80001824:	00813403          	ld	s0,8(sp)
    80001828:	01010113          	addi	sp,sp,16
    8000182c:	00008067          	ret
		head = tail = tcb;
    80001830:	0000b797          	auipc	a5,0xb
    80001834:	4b878793          	addi	a5,a5,1208 # 8000cce8 <_ZN9Scheduler4tailE>
    80001838:	00a7b023          	sd	a0,0(a5)
    8000183c:	00a7b423          	sd	a0,8(a5)
    80001840:	fe5ff06f          	j	80001824 <_ZN9Scheduler3putEP3TCB+0x24>

0000000080001844 <_ZN9Scheduler3getEv>:

TCB* Scheduler::get() {
    80001844:	ff010113          	addi	sp,sp,-16
    80001848:	00813423          	sd	s0,8(sp)
    8000184c:	01010413          	addi	s0,sp,16
	TCB* firstThread = head;
    80001850:	0000b717          	auipc	a4,0xb
    80001854:	49870713          	addi	a4,a4,1176 # 8000cce8 <_ZN9Scheduler4tailE>
    80001858:	00873503          	ld	a0,8(a4)
	head = head->nextInScheduler;
    8000185c:	03853783          	ld	a5,56(a0)
    80001860:	00f73423          	sd	a5,8(a4)
	if (head == nullptr) {
    80001864:	00078a63          	beqz	a5,80001878 <_ZN9Scheduler3getEv+0x34>
		tail = head = nullptr;
	}
	firstThread->nextInScheduler = nullptr;
    80001868:	02053c23          	sd	zero,56(a0)
	return firstThread;
}
    8000186c:	00813403          	ld	s0,8(sp)
    80001870:	01010113          	addi	sp,sp,16
    80001874:	00008067          	ret
		tail = head = nullptr;
    80001878:	00073423          	sd	zero,8(a4)
    8000187c:	00073023          	sd	zero,0(a4)
    80001880:	fe9ff06f          	j	80001868 <_ZN9Scheduler3getEv+0x24>

0000000080001884 <_ZN9Scheduler10putToSleepEP3TCBm>:

void Scheduler::putToSleep(TCB* tcb, time_t sleepTime) {
    80001884:	ff010113          	addi	sp,sp,-16
    80001888:	00813423          	sd	s0,8(sp)
    8000188c:	01010413          	addi	s0,sp,16
	if (sleepingHead == nullptr) {
    80001890:	0000b817          	auipc	a6,0xb
    80001894:	46883803          	ld	a6,1128(a6) # 8000ccf8 <_ZN9Scheduler12sleepingHeadE>
    80001898:	02080863          	beqz	a6,800018c8 <_ZN9Scheduler10putToSleepEP3TCBm+0x44>
		tcb->timeToSleep = sleepTime;
		return;
	}
	TCB* prevSleeping = nullptr;
	time_t accumulated = 0;
	TCB* current = sleepingHead;
    8000189c:	00080793          	mv	a5,a6
	time_t accumulated = 0;
    800018a0:	00000693          	li	a3,0
	TCB* prevSleeping = nullptr;
    800018a4:	00000613          	li	a2,0
	for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
    800018a8:	02078863          	beqz	a5,800018d8 <_ZN9Scheduler10putToSleepEP3TCBm+0x54>
    800018ac:	0407b703          	ld	a4,64(a5)
    800018b0:	00d70733          	add	a4,a4,a3
    800018b4:	02b77263          	bgeu	a4,a1,800018d8 <_ZN9Scheduler10putToSleepEP3TCBm+0x54>
		accumulated += current->timeToSleep;
    800018b8:	00070693          	mv	a3,a4
		prevSleeping = current;
    800018bc:	00078613          	mv	a2,a5
	for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
    800018c0:	0487b783          	ld	a5,72(a5)
    800018c4:	fe5ff06f          	j	800018a8 <_ZN9Scheduler10putToSleepEP3TCBm+0x24>
		sleepingHead = tcb;
    800018c8:	0000b797          	auipc	a5,0xb
    800018cc:	42a7b823          	sd	a0,1072(a5) # 8000ccf8 <_ZN9Scheduler12sleepingHeadE>
		tcb->timeToSleep = sleepTime;
    800018d0:	04b53023          	sd	a1,64(a0)
		return;
    800018d4:	02c0006f          	j	80001900 <_ZN9Scheduler10putToSleepEP3TCBm+0x7c>
	}
	if (!prevSleeping) {
    800018d8:	02060a63          	beqz	a2,8000190c <_ZN9Scheduler10putToSleepEP3TCBm+0x88>
		sleepingHead = tcb;
		tcb->timeToSleep = sleepTime;
		tcb->nextSleeping->timeToSleep -= sleepTime;
		return;
	}
	tcb->nextSleeping = current;
    800018dc:	04f53423          	sd	a5,72(a0)
	prevSleeping->nextSleeping = tcb;
    800018e0:	04a63423          	sd	a0,72(a2)
	tcb->timeToSleep = sleepTime - accumulated;
    800018e4:	40d58733          	sub	a4,a1,a3
    800018e8:	04e53023          	sd	a4,64(a0)
	if (current) current->timeToSleep -= sleepTime - accumulated;
    800018ec:	00078a63          	beqz	a5,80001900 <_ZN9Scheduler10putToSleepEP3TCBm+0x7c>
    800018f0:	40b686b3          	sub	a3,a3,a1
    800018f4:	0407b703          	ld	a4,64(a5)
    800018f8:	00d706b3          	add	a3,a4,a3
    800018fc:	04d7b023          	sd	a3,64(a5)
}
    80001900:	00813403          	ld	s0,8(sp)
    80001904:	01010113          	addi	sp,sp,16
    80001908:	00008067          	ret
		tcb->nextSleeping = sleepingHead;
    8000190c:	05053423          	sd	a6,72(a0)
		sleepingHead = tcb;
    80001910:	0000b797          	auipc	a5,0xb
    80001914:	3ea7b423          	sd	a0,1000(a5) # 8000ccf8 <_ZN9Scheduler12sleepingHeadE>
		tcb->timeToSleep = sleepTime;
    80001918:	04b53023          	sd	a1,64(a0)
		tcb->nextSleeping->timeToSleep -= sleepTime;
    8000191c:	04083683          	ld	a3,64(a6)
    80001920:	40b686b3          	sub	a3,a3,a1
    80001924:	04d83023          	sd	a3,64(a6)
		return;
    80001928:	fd9ff06f          	j	80001900 <_ZN9Scheduler10putToSleepEP3TCBm+0x7c>

000000008000192c <_ZN9Scheduler4wakeEv>:

void Scheduler::wake() {
	if (!sleepingHead) return;
    8000192c:	0000b797          	auipc	a5,0xb
    80001930:	3cc7b783          	ld	a5,972(a5) # 8000ccf8 <_ZN9Scheduler12sleepingHeadE>
    80001934:	06078a63          	beqz	a5,800019a8 <_ZN9Scheduler4wakeEv+0x7c>
	sleepingHead->timeToSleep--;
    80001938:	0407b703          	ld	a4,64(a5)
    8000193c:	fff70713          	addi	a4,a4,-1
    80001940:	04e7b023          	sd	a4,64(a5)
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001944:	0000b517          	auipc	a0,0xb
    80001948:	3b453503          	ld	a0,948(a0) # 8000ccf8 <_ZN9Scheduler12sleepingHeadE>
    8000194c:	04050e63          	beqz	a0,800019a8 <_ZN9Scheduler4wakeEv+0x7c>
    80001950:	04053783          	ld	a5,64(a0)
    80001954:	04079a63          	bnez	a5,800019a8 <_ZN9Scheduler4wakeEv+0x7c>
void Scheduler::wake() {
    80001958:	ff010113          	addi	sp,sp,-16
    8000195c:	00113423          	sd	ra,8(sp)
    80001960:	00813023          	sd	s0,0(sp)
    80001964:	01010413          	addi	s0,sp,16
    80001968:	00c0006f          	j	80001974 <_ZN9Scheduler4wakeEv+0x48>
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    8000196c:	04053783          	ld	a5,64(a0)
    80001970:	02079463          	bnez	a5,80001998 <_ZN9Scheduler4wakeEv+0x6c>
		TCB* thread = sleepingHead;
		sleepingHead = sleepingHead->nextSleeping;
    80001974:	04853783          	ld	a5,72(a0)
    80001978:	0000b717          	auipc	a4,0xb
    8000197c:	38f73023          	sd	a5,896(a4) # 8000ccf8 <_ZN9Scheduler12sleepingHeadE>
		thread->nextSleeping = nullptr;
    80001980:	04053423          	sd	zero,72(a0)
		Scheduler::put(thread);
    80001984:	00000097          	auipc	ra,0x0
    80001988:	e7c080e7          	jalr	-388(ra) # 80001800 <_ZN9Scheduler3putEP3TCB>
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    8000198c:	0000b517          	auipc	a0,0xb
    80001990:	36c53503          	ld	a0,876(a0) # 8000ccf8 <_ZN9Scheduler12sleepingHeadE>
    80001994:	fc051ce3          	bnez	a0,8000196c <_ZN9Scheduler4wakeEv+0x40>
	}
}
    80001998:	00813083          	ld	ra,8(sp)
    8000199c:	00013403          	ld	s0,0(sp)
    800019a0:	01010113          	addi	sp,sp,16
    800019a4:	00008067          	ret
    800019a8:	00008067          	ret

00000000800019ac <main>:
	while (1) {}
}

#pragma GCC optimize("O0")

int main() {
    800019ac:	f8010113          	addi	sp,sp,-128
    800019b0:	06113c23          	sd	ra,120(sp)
    800019b4:	06813823          	sd	s0,112(sp)
    800019b8:	06913423          	sd	s1,104(sp)
    800019bc:	07213023          	sd	s2,96(sp)
    800019c0:	08010413          	addi	s0,sp,128
	//postavi adresu prekidne rutine u stvec
	Riscv::w_stvec((uint64)&interruptHandler);
    800019c4:	0000b797          	auipc	a5,0xb
    800019c8:	2a47b783          	ld	a5,676(a5) # 8000cc68 <_GLOBAL_OFFSET_TABLE_+0x70>
    800019cc:	00078513          	mv	a0,a5
    800019d0:	00000097          	auipc	ra,0x0
    800019d4:	29c080e7          	jalr	668(ra) # 80001c6c <_ZN5Riscv7w_stvecEm>

	//sem_open(&semA, 0);
	semA = new Semaphore(1);
    800019d8:	01000513          	li	a0,16
    800019dc:	00001097          	auipc	ra,0x1
    800019e0:	e28080e7          	jalr	-472(ra) # 80002804 <_Znwm>
    800019e4:	00050793          	mv	a5,a0
    800019e8:	00078493          	mv	s1,a5
    800019ec:	00100593          	li	a1,1
    800019f0:	00048513          	mv	a0,s1
    800019f4:	00001097          	auipc	ra,0x1
    800019f8:	104080e7          	jalr	260(ra) # 80002af8 <_ZN9SemaphoreC1Ej>
    800019fc:	0000b797          	auipc	a5,0xb
    80001a00:	30478793          	addi	a5,a5,772 # 8000cd00 <semA>
    80001a04:	0097b023          	sd	s1,0(a5)

	KConsole::initKConsole();
    80001a08:	00000097          	auipc	ra,0x0
    80001a0c:	c58080e7          	jalr	-936(ra) # 80001660 <_ZN8KConsole12initKConsoleEv>
//	printInteger(*(lista->peekFirst()));
//	delete lista;
//	println("");

	//testiranje kreiranja niti
	thread_t glavnaNit = nullptr;
    80001a10:	fa043823          	sd	zero,-80(s0)
	thread_t nit1 = nullptr;
    80001a14:	fc043c23          	sd	zero,-40(s0)
	thread_t nit2 = nullptr;
    80001a18:	fc043823          	sd	zero,-48(s0)
	thread_t nit3 = nullptr;
    80001a1c:	fc043423          	sd	zero,-56(s0)
	thread_t idleNit = nullptr;
    80001a20:	fa043423          	sd	zero,-88(s0)
	thread_create(&glavnaNit, nullptr, nullptr);
    80001a24:	fb040793          	addi	a5,s0,-80
    80001a28:	00000613          	li	a2,0
    80001a2c:	00000593          	li	a1,0
    80001a30:	00078513          	mv	a0,a5
    80001a34:	00000097          	auipc	ra,0x0
    80001a38:	94c080e7          	jalr	-1716(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
	TCB::running = glavnaNit;
    80001a3c:	fb043703          	ld	a4,-80(s0)
    80001a40:	0000b797          	auipc	a5,0xb
    80001a44:	2187b783          	ld	a5,536(a5) # 8000cc58 <_GLOBAL_OFFSET_TABLE_+0x60>
    80001a48:	00e7b023          	sd	a4,0(a5)
	uint64* arg = new uint64;
    80001a4c:	00800513          	li	a0,8
    80001a50:	00001097          	auipc	ra,0x1
    80001a54:	db4080e7          	jalr	-588(ra) # 80002804 <_Znwm>
    80001a58:	00050793          	mv	a5,a0
    80001a5c:	fcf43023          	sd	a5,-64(s0)
	*arg = 666;
    80001a60:	fc043783          	ld	a5,-64(s0)
    80001a64:	29a00713          	li	a4,666
    80001a68:	00e7b023          	sd	a4,0(a5)
	ThreadQueue* q = new ThreadQueue();
    80001a6c:	01000513          	li	a0,16
    80001a70:	00000097          	auipc	ra,0x0
    80001a74:	2bc080e7          	jalr	700(ra) # 80001d2c <_ZN11ThreadQueuenwEm>
    80001a78:	00050493          	mv	s1,a0
    80001a7c:	00048513          	mv	a0,s1
    80001a80:	00000097          	auipc	ra,0x0
    80001a84:	240080e7          	jalr	576(ra) # 80001cc0 <_ZN11ThreadQueueC1Ev>
    80001a88:	fa943c23          	sd	s1,-72(s0)
	q->putLast(nit3);
    80001a8c:	fc843583          	ld	a1,-56(s0)
    80001a90:	fb843503          	ld	a0,-72(s0)
    80001a94:	fffff097          	auipc	ra,0xfffff
    80001a98:	7b0080e7          	jalr	1968(ra) # 80001244 <_ZN11ThreadQueue7putLastEP3TCB>
	q->putLast(nit2);
    80001a9c:	fd043583          	ld	a1,-48(s0)
    80001aa0:	fb843503          	ld	a0,-72(s0)
    80001aa4:	fffff097          	auipc	ra,0xfffff
    80001aa8:	7a0080e7          	jalr	1952(ra) # 80001244 <_ZN11ThreadQueue7putLastEP3TCB>
	q->putLast(nit1);
    80001aac:	fd843583          	ld	a1,-40(s0)
    80001ab0:	fb843503          	ld	a0,-72(s0)
    80001ab4:	fffff097          	auipc	ra,0xfffff
    80001ab8:	790080e7          	jalr	1936(ra) # 80001244 <_ZN11ThreadQueue7putLastEP3TCB>
	thread_t nitred3 = q->getFirst();
    80001abc:	fb843503          	ld	a0,-72(s0)
    80001ac0:	fffff097          	auipc	ra,0xfffff
    80001ac4:	7f0080e7          	jalr	2032(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
    80001ac8:	00050793          	mv	a5,a0
    80001acc:	faf43023          	sd	a5,-96(s0)
	thread_t nitred2 = q->getFirst();
    80001ad0:	fb843503          	ld	a0,-72(s0)
    80001ad4:	fffff097          	auipc	ra,0xfffff
    80001ad8:	7dc080e7          	jalr	2012(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
    80001adc:	00050793          	mv	a5,a0
    80001ae0:	f8f43c23          	sd	a5,-104(s0)
	thread_t nitred1 = q->getFirst();
    80001ae4:	fb843503          	ld	a0,-72(s0)
    80001ae8:	fffff097          	auipc	ra,0xfffff
    80001aec:	7c8080e7          	jalr	1992(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
    80001af0:	00050793          	mv	a5,a0
    80001af4:	f8f43823          	sd	a5,-112(s0)
	thread_create(&idleNit, idle, nullptr);
    80001af8:	fa840793          	addi	a5,s0,-88
    80001afc:	00000613          	li	a2,0
    80001b00:	00000597          	auipc	a1,0x0
    80001b04:	15c58593          	addi	a1,a1,348 # 80001c5c <_Z4idlePv>
    80001b08:	00078513          	mv	a0,a5
    80001b0c:	00000097          	auipc	ra,0x0
    80001b10:	874080e7          	jalr	-1932(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
	thread_create(&nitred1, nit1f, nullptr);
    80001b14:	f9040793          	addi	a5,s0,-112
    80001b18:	00000613          	li	a2,0
    80001b1c:	0000b597          	auipc	a1,0xb
    80001b20:	1345b583          	ld	a1,308(a1) # 8000cc50 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001b24:	00078513          	mv	a0,a5
    80001b28:	00000097          	auipc	ra,0x0
    80001b2c:	858080e7          	jalr	-1960(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
	thread_create(&nitred2, nit2f, arg);
    80001b30:	f9840793          	addi	a5,s0,-104
    80001b34:	fc043603          	ld	a2,-64(s0)
    80001b38:	0000b597          	auipc	a1,0xb
    80001b3c:	0f05b583          	ld	a1,240(a1) # 8000cc28 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001b40:	00078513          	mv	a0,a5
    80001b44:	00000097          	auipc	ra,0x0
    80001b48:	83c080e7          	jalr	-1988(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
	thread_create(&nitred3, nit3f, nullptr);
    80001b4c:	fa040793          	addi	a5,s0,-96
    80001b50:	00000613          	li	a2,0
    80001b54:	0000b597          	auipc	a1,0xb
    80001b58:	0ec5b583          	ld	a1,236(a1) # 8000cc40 <_GLOBAL_OFFSET_TABLE_+0x48>
    80001b5c:	00078513          	mv	a0,a5
    80001b60:	00000097          	auipc	ra,0x0
    80001b64:	820080e7          	jalr	-2016(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>

	//omoguci prekide
	Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    80001b68:	00200513          	li	a0,2
    80001b6c:	00000097          	auipc	ra,0x0
    80001b70:	11c080e7          	jalr	284(ra) # 80001c88 <_ZN5Riscv10ms_sstatusEm>

//	while (!nitred1->isFinished() || !nitred2->isFinished()) {
//		thread_dispatch();
//	}
	thread_join(nitred1);
    80001b74:	f9043783          	ld	a5,-112(s0)
    80001b78:	00078513          	mv	a0,a5
    80001b7c:	00000097          	auipc	ra,0x0
    80001b80:	8cc080e7          	jalr	-1844(ra) # 80001448 <_Z11thread_joinP3TCB>
	thread_join(nitred2);
    80001b84:	f9843783          	ld	a5,-104(s0)
    80001b88:	00078513          	mv	a0,a5
    80001b8c:	00000097          	auipc	ra,0x0
    80001b90:	8bc080e7          	jalr	-1860(ra) # 80001448 <_Z11thread_joinP3TCB>
	thread_join(nitred3);
    80001b94:	fa043783          	ld	a5,-96(s0)
    80001b98:	00078513          	mv	a0,a5
    80001b9c:	00000097          	auipc	ra,0x0
    80001ba0:	8ac080e7          	jalr	-1876(ra) # 80001448 <_Z11thread_joinP3TCB>
	thread_join(idleNit);
    80001ba4:	fa843783          	ld	a5,-88(s0)
    80001ba8:	00078513          	mv	a0,a5
    80001bac:	00000097          	auipc	ra,0x0
    80001bb0:	89c080e7          	jalr	-1892(ra) # 80001448 <_Z11thread_joinP3TCB>

	printString("\nGotove user niti\n");
    80001bb4:	00008517          	auipc	a0,0x8
    80001bb8:	4bc50513          	addi	a0,a0,1212 # 8000a070 <CONSOLE_STATUS+0x60>
    80001bbc:	00004097          	auipc	ra,0x4
    80001bc0:	0d8080e7          	jalr	216(ra) # 80005c94 <_Z11printStringPKc>
	delete q;
    80001bc4:	fb843483          	ld	s1,-72(s0)
    80001bc8:	00048e63          	beqz	s1,80001be4 <main+0x238>
    80001bcc:	00048513          	mv	a0,s1
    80001bd0:	00000097          	auipc	ra,0x0
    80001bd4:	110080e7          	jalr	272(ra) # 80001ce0 <_ZN11ThreadQueueD1Ev>
    80001bd8:	00048513          	mv	a0,s1
    80001bdc:	00000097          	auipc	ra,0x0
    80001be0:	178080e7          	jalr	376(ra) # 80001d54 <_ZN11ThreadQueuedlEPv>


	KConsole::printConsoleState();
    80001be4:	00000097          	auipc	ra,0x0
    80001be8:	b0c080e7          	jalr	-1268(ra) # 800016f0 <_ZN8KConsole17printConsoleStateEv>
	KConsole konzola;
    80001bec:	f8840793          	addi	a5,s0,-120
    80001bf0:	00078513          	mv	a0,a5
    80001bf4:	00000097          	auipc	ra,0x0
    80001bf8:	188080e7          	jalr	392(ra) # 80001d7c <_ZN8KConsoleC1Ev>


	//zabrani prekide
	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    80001bfc:	00200513          	li	a0,2
    80001c00:	00000097          	auipc	ra,0x0
    80001c04:	0a4080e7          	jalr	164(ra) # 80001ca4 <_ZN5Riscv10mc_sstatusEm>
	printString("\nSad cu da izadjem\n");
    80001c08:	00008517          	auipc	a0,0x8
    80001c0c:	48050513          	addi	a0,a0,1152 # 8000a088 <CONSOLE_STATUS+0x78>
    80001c10:	00004097          	auipc	ra,0x4
    80001c14:	084080e7          	jalr	132(ra) # 80005c94 <_Z11printStringPKc>
//	thread_create(&userHandle, (TCB::Body)userMain, nullptr);
//	while (!userHandle->isFinished()) {
//		thread_dispatch();
//	}
//	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
	return 0;
    80001c18:	00000793          	li	a5,0
    80001c1c:	0240006f          	j	80001c40 <main+0x294>
    80001c20:	00050913          	mv	s2,a0
	semA = new Semaphore(1);
    80001c24:	00048513          	mv	a0,s1
    80001c28:	00001097          	auipc	ra,0x1
    80001c2c:	c2c080e7          	jalr	-980(ra) # 80002854 <_ZdlPv>
    80001c30:	00090793          	mv	a5,s2
    80001c34:	00078513          	mv	a0,a5
    80001c38:	0000c097          	auipc	ra,0xc
    80001c3c:	210080e7          	jalr	528(ra) # 8000de48 <_Unwind_Resume>
    80001c40:	00078513          	mv	a0,a5
    80001c44:	07813083          	ld	ra,120(sp)
    80001c48:	07013403          	ld	s0,112(sp)
    80001c4c:	06813483          	ld	s1,104(sp)
    80001c50:	06013903          	ld	s2,96(sp)
    80001c54:	08010113          	addi	sp,sp,128
    80001c58:	00008067          	ret

0000000080001c5c <_Z4idlePv>:
void idle(void*) {
    80001c5c:	ff010113          	addi	sp,sp,-16
    80001c60:	00813423          	sd	s0,8(sp)
    80001c64:	01010413          	addi	s0,sp,16
	while (1) {}
    80001c68:	0000006f          	j	80001c68 <_Z4idlePv+0xc>

0000000080001c6c <_ZN5Riscv7w_stvecEm>:
	uint64 volatile stvec;
	__asm__ volatile("csrr %[stvec], stvec": [stvec] "=r"(stvec));
	return stvec;
}

inline void Riscv::w_stvec(uint64 stvec) {
    80001c6c:	ff010113          	addi	sp,sp,-16
    80001c70:	00813423          	sd	s0,8(sp)
    80001c74:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw stvec, %[stvec]": :[stvec] "r"(stvec));
    80001c78:	10551073          	csrw	stvec,a0
}
    80001c7c:	00813403          	ld	s0,8(sp)
    80001c80:	01010113          	addi	sp,sp,16
    80001c84:	00008067          	ret

0000000080001c88 <_ZN5Riscv10ms_sstatusEm>:

inline void Riscv::w_sip(uint64 sip) {
	__asm__ volatile("csrw sip, %[sip]": :[sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
    80001c88:	ff010113          	addi	sp,sp,-16
    80001c8c:	00813423          	sd	s0,8(sp)
    80001c90:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80001c94:	10052073          	csrs	sstatus,a0
}
    80001c98:	00813403          	ld	s0,8(sp)
    80001c9c:	01010113          	addi	sp,sp,16
    80001ca0:	00008067          	ret

0000000080001ca4 <_ZN5Riscv10mc_sstatusEm>:

inline void Riscv::mc_sstatus(uint64 mask) {
    80001ca4:	ff010113          	addi	sp,sp,-16
    80001ca8:	00813423          	sd	s0,8(sp)
    80001cac:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80001cb0:	10053073          	csrc	sstatus,a0
}
    80001cb4:	00813403          	ld	s0,8(sp)
    80001cb8:	01010113          	addi	sp,sp,16
    80001cbc:	00008067          	ret

0000000080001cc0 <_ZN11ThreadQueueC1Ev>:

	Node* front;
	Node* back;

public:
	ThreadQueue() : front(nullptr), back(nullptr) {}
    80001cc0:	ff010113          	addi	sp,sp,-16
    80001cc4:	00813423          	sd	s0,8(sp)
    80001cc8:	01010413          	addi	s0,sp,16
    80001ccc:	00053023          	sd	zero,0(a0)
    80001cd0:	00053423          	sd	zero,8(a0)
    80001cd4:	00813403          	ld	s0,8(sp)
    80001cd8:	01010113          	addi	sp,sp,16
    80001cdc:	00008067          	ret

0000000080001ce0 <_ZN11ThreadQueueD1Ev>:

	ThreadQueue(const ThreadQueue&) = delete;

	ThreadQueue& operator=(const ThreadQueue&) = delete;

	~ThreadQueue() {
    80001ce0:	fe010113          	addi	sp,sp,-32
    80001ce4:	00113c23          	sd	ra,24(sp)
    80001ce8:	00813823          	sd	s0,16(sp)
    80001cec:	00913423          	sd	s1,8(sp)
    80001cf0:	02010413          	addi	s0,sp,32
    80001cf4:	00050493          	mv	s1,a0
			delete node;
		}
	}

	bool isEmpty() const {
		return front == nullptr;
    80001cf8:	0004b503          	ld	a0,0(s1)
		while (!isEmpty()) {
    80001cfc:	00050e63          	beqz	a0,80001d18 <_ZN11ThreadQueueD1Ev+0x38>
			front = front->next;
    80001d00:	00853783          	ld	a5,8(a0)
    80001d04:	00f4b023          	sd	a5,0(s1)
			delete node;
    80001d08:	fe0508e3          	beqz	a0,80001cf8 <_ZN11ThreadQueueD1Ev+0x18>
			mem_free(ptr);
    80001d0c:	fffff097          	auipc	ra,0xfffff
    80001d10:	644080e7          	jalr	1604(ra) # 80001350 <_Z8mem_freePv>
		}
    80001d14:	fe5ff06f          	j	80001cf8 <_ZN11ThreadQueueD1Ev+0x18>
	}
    80001d18:	01813083          	ld	ra,24(sp)
    80001d1c:	01013403          	ld	s0,16(sp)
    80001d20:	00813483          	ld	s1,8(sp)
    80001d24:	02010113          	addi	sp,sp,32
    80001d28:	00008067          	ret

0000000080001d2c <_ZN11ThreadQueuenwEm>:

	void putLast(TCB* tcb);

	TCB* getFirst();

	static void* operator new(size_t size) {
    80001d2c:	ff010113          	addi	sp,sp,-16
    80001d30:	00113423          	sd	ra,8(sp)
    80001d34:	00813023          	sd	s0,0(sp)
    80001d38:	01010413          	addi	s0,sp,16
		return mem_alloc(size);
    80001d3c:	fffff097          	auipc	ra,0xfffff
    80001d40:	5d4080e7          	jalr	1492(ra) # 80001310 <_Z9mem_allocm>
	}
    80001d44:	00813083          	ld	ra,8(sp)
    80001d48:	00013403          	ld	s0,0(sp)
    80001d4c:	01010113          	addi	sp,sp,16
    80001d50:	00008067          	ret

0000000080001d54 <_ZN11ThreadQueuedlEPv>:

	static void operator delete(void* ptr) {
    80001d54:	ff010113          	addi	sp,sp,-16
    80001d58:	00113423          	sd	ra,8(sp)
    80001d5c:	00813023          	sd	s0,0(sp)
    80001d60:	01010413          	addi	s0,sp,16
		mem_free(ptr);
    80001d64:	fffff097          	auipc	ra,0xfffff
    80001d68:	5ec080e7          	jalr	1516(ra) # 80001350 <_Z8mem_freePv>
	}
    80001d6c:	00813083          	ld	ra,8(sp)
    80001d70:	00013403          	ld	s0,0(sp)
    80001d74:	01010113          	addi	sp,sp,16
    80001d78:	00008067          	ret

0000000080001d7c <_ZN8KConsoleC1Ev>:

class KConsole {
public:
	static void kputc(char c);
	static char kgetc();
	KConsole(){
    80001d7c:	fd010113          	addi	sp,sp,-48
    80001d80:	02113423          	sd	ra,40(sp)
    80001d84:	02813023          	sd	s0,32(sp)
    80001d88:	00913c23          	sd	s1,24(sp)
    80001d8c:	01213823          	sd	s2,16(sp)
    80001d90:	01313423          	sd	s3,8(sp)
    80001d94:	03010413          	addi	s0,sp,48
		printString("CONSOLE_RX = ");
    80001d98:	00008517          	auipc	a0,0x8
    80001d9c:	30850513          	addi	a0,a0,776 # 8000a0a0 <CONSOLE_STATUS+0x90>
    80001da0:	00004097          	auipc	ra,0x4
    80001da4:	ef4080e7          	jalr	-268(ra) # 80005c94 <_Z11printStringPKc>
		printInteger(CONSOLE_RX_DATA);
    80001da8:	0000b797          	auipc	a5,0xb
    80001dac:	e587b783          	ld	a5,-424(a5) # 8000cc00 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001db0:	0007b983          	ld	s3,0(a5)
    80001db4:	00098513          	mv	a0,s3
    80001db8:	00000097          	auipc	ra,0x0
    80001dbc:	a20080e7          	jalr	-1504(ra) # 800017d8 <_Z12printIntegerm>
		printString("\n");
    80001dc0:	00008497          	auipc	s1,0x8
    80001dc4:	2f048493          	addi	s1,s1,752 # 8000a0b0 <CONSOLE_STATUS+0xa0>
    80001dc8:	00048513          	mv	a0,s1
    80001dcc:	00004097          	auipc	ra,0x4
    80001dd0:	ec8080e7          	jalr	-312(ra) # 80005c94 <_Z11printStringPKc>
		printString("CONSOLE_TX = ");
    80001dd4:	00008517          	auipc	a0,0x8
    80001dd8:	2e450513          	addi	a0,a0,740 # 8000a0b8 <CONSOLE_STATUS+0xa8>
    80001ddc:	00004097          	auipc	ra,0x4
    80001de0:	eb8080e7          	jalr	-328(ra) # 80005c94 <_Z11printStringPKc>
		printInteger(CONSOLE_TX_DATA);
    80001de4:	0000b797          	auipc	a5,0xb
    80001de8:	e4c7b783          	ld	a5,-436(a5) # 8000cc30 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001dec:	0007b503          	ld	a0,0(a5)
    80001df0:	00000097          	auipc	ra,0x0
    80001df4:	9e8080e7          	jalr	-1560(ra) # 800017d8 <_Z12printIntegerm>
		printString("\n");
    80001df8:	00048513          	mv	a0,s1
    80001dfc:	00004097          	auipc	ra,0x4
    80001e00:	e98080e7          	jalr	-360(ra) # 80005c94 <_Z11printStringPKc>
		printString("CONSOLE_STATUS = ");
    80001e04:	00008517          	auipc	a0,0x8
    80001e08:	2c450513          	addi	a0,a0,708 # 8000a0c8 <CONSOLE_STATUS+0xb8>
    80001e0c:	00004097          	auipc	ra,0x4
    80001e10:	e88080e7          	jalr	-376(ra) # 80005c94 <_Z11printStringPKc>
		printInteger(CONSOLE_STATUS);
    80001e14:	0000b797          	auipc	a5,0xb
    80001e18:	e047b783          	ld	a5,-508(a5) # 8000cc18 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001e1c:	0007b903          	ld	s2,0(a5)
    80001e20:	00090513          	mv	a0,s2
    80001e24:	00000097          	auipc	ra,0x0
    80001e28:	9b4080e7          	jalr	-1612(ra) # 800017d8 <_Z12printIntegerm>
		printString("\n");
    80001e2c:	00048513          	mv	a0,s1
    80001e30:	00004097          	auipc	ra,0x4
    80001e34:	e64080e7          	jalr	-412(ra) # 80005c94 <_Z11printStringPKc>
		printString("*CONSOLE_RX = ");
    80001e38:	00008517          	auipc	a0,0x8
    80001e3c:	2a850513          	addi	a0,a0,680 # 8000a0e0 <CONSOLE_STATUS+0xd0>
    80001e40:	00004097          	auipc	ra,0x4
    80001e44:	e54080e7          	jalr	-428(ra) # 80005c94 <_Z11printStringPKc>
		printInteger(*((uint8*)CONSOLE_RX_DATA));
    80001e48:	0009c503          	lbu	a0,0(s3)
    80001e4c:	00000097          	auipc	ra,0x0
    80001e50:	98c080e7          	jalr	-1652(ra) # 800017d8 <_Z12printIntegerm>
		printString("\n");
    80001e54:	00048513          	mv	a0,s1
    80001e58:	00004097          	auipc	ra,0x4
    80001e5c:	e3c080e7          	jalr	-452(ra) # 80005c94 <_Z11printStringPKc>
		printString("*CONSOLE_STATUS = ");
    80001e60:	00008517          	auipc	a0,0x8
    80001e64:	29050513          	addi	a0,a0,656 # 8000a0f0 <CONSOLE_STATUS+0xe0>
    80001e68:	00004097          	auipc	ra,0x4
    80001e6c:	e2c080e7          	jalr	-468(ra) # 80005c94 <_Z11printStringPKc>
		printInteger(*((uint8*)CONSOLE_STATUS));
    80001e70:	00094503          	lbu	a0,0(s2)
    80001e74:	00000097          	auipc	ra,0x0
    80001e78:	964080e7          	jalr	-1692(ra) # 800017d8 <_Z12printIntegerm>
		printString("\n");
    80001e7c:	00048513          	mv	a0,s1
    80001e80:	00004097          	auipc	ra,0x4
    80001e84:	e14080e7          	jalr	-492(ra) # 80005c94 <_Z11printStringPKc>
	}
    80001e88:	02813083          	ld	ra,40(sp)
    80001e8c:	02013403          	ld	s0,32(sp)
    80001e90:	01813483          	ld	s1,24(sp)
    80001e94:	01013903          	ld	s2,16(sp)
    80001e98:	00813983          	ld	s3,8(sp)
    80001e9c:	03010113          	addi	sp,sp,48
    80001ea0:	00008067          	ret

0000000080001ea4 <interruptRoutine>:
#include "../test/printing.hpp"

//void printInteger(int i);

#pragma GCC optimize("O0")
extern "C" void interruptRoutine() {
    80001ea4:	ec010113          	addi	sp,sp,-320
    80001ea8:	12113c23          	sd	ra,312(sp)
    80001eac:	12813823          	sd	s0,304(sp)
    80001eb0:	14010413          	addi	s0,sp,320
	uint64 scause, sepc, sstatus;
	__asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001eb4:	14202373          	csrr	t1,scause
    80001eb8:	fc643c23          	sd	t1,-40(s0)
	__asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001ebc:	14102373          	csrr	t1,sepc
    80001ec0:	fc643823          	sd	t1,-48(s0)
	__asm__ volatile("csrr %[status], sstatus":[status] "=r"(
			sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001ec4:	10002373          	csrr	t1,sstatus
    80001ec8:	fc643423          	sd	t1,-56(s0)
	uint64 a0, a1, a2, a3, a4, a5, a6, a7;
	__asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001ecc:	00050313          	mv	t1,a0
    80001ed0:	fc643023          	sd	t1,-64(s0)
	__asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001ed4:	00058313          	mv	t1,a1
    80001ed8:	fa643c23          	sd	t1,-72(s0)
	__asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001edc:	00060313          	mv	t1,a2
    80001ee0:	fa643823          	sd	t1,-80(s0)
	__asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001ee4:	00068313          	mv	t1,a3
    80001ee8:	fa643423          	sd	t1,-88(s0)
	__asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001eec:	00070313          	mv	t1,a4
    80001ef0:	fa643023          	sd	t1,-96(s0)
	__asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001ef4:	00078313          	mv	t1,a5
    80001ef8:	f8643c23          	sd	t1,-104(s0)
	__asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001efc:	00080313          	mv	t1,a6
    80001f00:	f8643823          	sd	t1,-112(s0)
	__asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001f04:	00088313          	mv	t1,a7
    80001f08:	f8643423          	sd	t1,-120(s0)

	if (scause == 0x09 || scause == 0x08) {
    80001f0c:	fd843703          	ld	a4,-40(s0)
    80001f10:	00900793          	li	a5,9
    80001f14:	00f70863          	beq	a4,a5,80001f24 <interruptRoutine+0x80>
    80001f18:	fd843703          	ld	a4,-40(s0)
    80001f1c:	00800793          	li	a5,8
    80001f20:	50f71263          	bne	a4,a5,80002424 <interruptRoutine+0x580>
		//prekid zbog poziva ecall
		uint64 opCode = a0;
    80001f24:	fc043783          	ld	a5,-64(s0)
    80001f28:	f6f43c23          	sd	a5,-136(s0)
		switch (opCode) {
    80001f2c:	f7843703          	ld	a4,-136(s0)
    80001f30:	09100793          	li	a5,145
    80001f34:	38f70063          	beq	a4,a5,800022b4 <interruptRoutine+0x410>
    80001f38:	f7843703          	ld	a4,-136(s0)
    80001f3c:	09100793          	li	a5,145
    80001f40:	44e7ee63          	bltu	a5,a4,8000239c <interruptRoutine+0x4f8>
    80001f44:	f7843703          	ld	a4,-136(s0)
    80001f48:	09000793          	li	a5,144
    80001f4c:	32f70863          	beq	a4,a5,8000227c <interruptRoutine+0x3d8>
    80001f50:	f7843703          	ld	a4,-136(s0)
    80001f54:	09000793          	li	a5,144
    80001f58:	44e7e263          	bltu	a5,a4,8000239c <interruptRoutine+0x4f8>
    80001f5c:	f7843703          	ld	a4,-136(s0)
    80001f60:	08100793          	li	a5,129
    80001f64:	30f70063          	beq	a4,a5,80002264 <interruptRoutine+0x3c0>
    80001f68:	f7843703          	ld	a4,-136(s0)
    80001f6c:	08100793          	li	a5,129
    80001f70:	42e7e663          	bltu	a5,a4,8000239c <interruptRoutine+0x4f8>
    80001f74:	f7843703          	ld	a4,-136(s0)
    80001f78:	04200793          	li	a5,66
    80001f7c:	04e7e263          	bltu	a5,a4,80001fc0 <interruptRoutine+0x11c>
    80001f80:	f7843783          	ld	a5,-136(s0)
    80001f84:	40078c63          	beqz	a5,8000239c <interruptRoutine+0x4f8>
    80001f88:	f7843703          	ld	a4,-136(s0)
    80001f8c:	04200793          	li	a5,66
    80001f90:	40e7e663          	bltu	a5,a4,8000239c <interruptRoutine+0x4f8>
    80001f94:	f7843783          	ld	a5,-136(s0)
    80001f98:	00279713          	slli	a4,a5,0x2
    80001f9c:	00008797          	auipc	a5,0x8
    80001fa0:	1f878793          	addi	a5,a5,504 # 8000a194 <CONSOLE_STATUS+0x184>
    80001fa4:	00f707b3          	add	a5,a4,a5
    80001fa8:	0007a783          	lw	a5,0(a5)
    80001fac:	0007871b          	sext.w	a4,a5
    80001fb0:	00008797          	auipc	a5,0x8
    80001fb4:	1e478793          	addi	a5,a5,484 # 8000a194 <CONSOLE_STATUS+0x184>
    80001fb8:	00f707b3          	add	a5,a4,a5
    80001fbc:	00078067          	jr	a5
    80001fc0:	f7843703          	ld	a4,-136(s0)
    80001fc4:	08000793          	li	a5,128
    80001fc8:	22f70e63          	beq	a4,a5,80002204 <interruptRoutine+0x360>
    80001fcc:	3d00006f          	j	8000239c <interruptRoutine+0x4f8>
			case 0x01:
				//mem_alloc
				size_t size;
				size = (size_t)a1;
    80001fd0:	fb843783          	ld	a5,-72(s0)
    80001fd4:	ecf43823          	sd	a5,-304(s0)
				//__asm__ volatile("mv %[size], a1":[size] "=r"(size));
				size = size * MEM_BLOCK_SIZE;
    80001fd8:	ed043783          	ld	a5,-304(s0)
    80001fdc:	00679793          	slli	a5,a5,0x6
    80001fe0:	ecf43823          	sd	a5,-304(s0)
				MemoryAllocator::kmalloc(size);
    80001fe4:	00300593          	li	a1,3
    80001fe8:	ed043503          	ld	a0,-304(s0)
    80001fec:	00001097          	auipc	ra,0x1
    80001ff0:	000080e7          	jalr	ra # 80002fec <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
				__asm__ volatile("sd a0, 80(s0)");
    80001ff4:	04a43823          	sd	a0,80(s0)
				break;
    80001ff8:	4100006f          	j	80002408 <interruptRoutine+0x564>
			case 0x02:
				//mem_free
				void* ptr;
				ptr = (void*)a1;
    80001ffc:	fb843783          	ld	a5,-72(s0)
    80002000:	ecf43c23          	sd	a5,-296(s0)
				//__asm__ volatile("mv %[ptr], a1" :[ptr]"=r"(ptr));
				MemoryAllocator::kfree(ptr);
    80002004:	ed843503          	ld	a0,-296(s0)
    80002008:	00001097          	auipc	ra,0x1
    8000200c:	190080e7          	jalr	400(ra) # 80003198 <_ZN15MemoryAllocator5kfreeEPv>
				__asm__ volatile("sd a0, 80(s0)");
    80002010:	04a43823          	sd	a0,80(s0)
				break;
    80002014:	3f40006f          	j	80002408 <interruptRoutine+0x564>
			case 0x11:
				//thread_create
				thread_t* handle;
				handle = (thread_t*)a1;
    80002018:	fb843783          	ld	a5,-72(s0)
    8000201c:	eef43c23          	sd	a5,-264(s0)
				void (* function)(void*);
				function = (void (*)(void*))a2;
    80002020:	fb043783          	ld	a5,-80(s0)
    80002024:	eef43823          	sd	a5,-272(s0)
				void* args;
				args = (void*)a3;
    80002028:	fa843783          	ld	a5,-88(s0)
    8000202c:	eef43423          	sd	a5,-280(s0)
				uint64* sp;
				sp = (uint64*)a4;
    80002030:	fa043783          	ld	a5,-96(s0)
    80002034:	eef43023          	sd	a5,-288(s0)

				*handle = TCB::createThread(function, args, sp);
    80002038:	ee043603          	ld	a2,-288(s0)
    8000203c:	ee843583          	ld	a1,-280(s0)
    80002040:	ef043503          	ld	a0,-272(s0)
    80002044:	00001097          	auipc	ra,0x1
    80002048:	dd4080e7          	jalr	-556(ra) # 80002e18 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    8000204c:	00050713          	mv	a4,a0
    80002050:	ef843783          	ld	a5,-264(s0)
    80002054:	00e7b023          	sd	a4,0(a5)
				TCB::start(*handle);
    80002058:	ef843783          	ld	a5,-264(s0)
    8000205c:	0007b783          	ld	a5,0(a5)
    80002060:	00078513          	mv	a0,a5
    80002064:	00001097          	auipc	ra,0x1
    80002068:	f34080e7          	jalr	-204(ra) # 80002f98 <_ZN3TCB5startEPS_>
				if (*handle != nullptr) {
    8000206c:	ef843783          	ld	a5,-264(s0)
    80002070:	0007b783          	ld	a5,0(a5)
    80002074:	00078663          	beqz	a5,80002080 <interruptRoutine+0x1dc>
					__asm__ volatile("li a0, 0");
    80002078:	00000513          	li	a0,0
    8000207c:	0080006f          	j	80002084 <interruptRoutine+0x1e0>
				} else {
					__asm__ volatile("li a0, -1");
    80002080:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    80002084:	04a43823          	sd	a0,80(s0)
				break;
    80002088:	3800006f          	j	80002408 <interruptRoutine+0x564>
			case 0x12:
				//thread_exit
				TCB::running->setFinished(true);
    8000208c:	0000b797          	auipc	a5,0xb
    80002090:	bcc7b783          	ld	a5,-1076(a5) # 8000cc58 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002094:	0007b783          	ld	a5,0(a5)
    80002098:	00100593          	li	a1,1
    8000209c:	00078513          	mv	a0,a5
    800020a0:	00000097          	auipc	ra,0x0
    800020a4:	64c080e7          	jalr	1612(ra) # 800026ec <_ZN3TCB11setFinishedEb>
				TCB::releaseJoined();
    800020a8:	00001097          	auipc	ra,0x1
    800020ac:	e94080e7          	jalr	-364(ra) # 80002f3c <_ZN3TCB13releaseJoinedEv>
				TCB::yield();
    800020b0:	00001097          	auipc	ra,0x1
    800020b4:	d00080e7          	jalr	-768(ra) # 80002db0 <_ZN3TCB5yieldEv>
				break;
    800020b8:	3500006f          	j	80002408 <interruptRoutine+0x564>
			case 0x13:
				//thread_dispatch
				TCB::yield();
    800020bc:	00001097          	auipc	ra,0x1
    800020c0:	cf4080e7          	jalr	-780(ra) # 80002db0 <_ZN3TCB5yieldEv>
				break;
    800020c4:	3440006f          	j	80002408 <interruptRoutine+0x564>
			case 0x14:
				//thread_join
				thread_t handleToJoin;
				handleToJoin = (thread_t)a1;
    800020c8:	fb843783          	ld	a5,-72(s0)
    800020cc:	f0f43023          	sd	a5,-256(s0)
				TCB::threadJoin(handleToJoin);
    800020d0:	f0043503          	ld	a0,-256(s0)
    800020d4:	00001097          	auipc	ra,0x1
    800020d8:	e20080e7          	jalr	-480(ra) # 80002ef4 <_ZN3TCB10threadJoinEPS_>
				TCB::yield();
    800020dc:	00001097          	auipc	ra,0x1
    800020e0:	cd4080e7          	jalr	-812(ra) # 80002db0 <_ZN3TCB5yieldEv>
				break;
    800020e4:	3240006f          	j	80002408 <interruptRoutine+0x564>
			case 0x21:
				//sem_open
				sem_t* openHandle;
				openHandle = (sem_t*)a1;
    800020e8:	fb843783          	ld	a5,-72(s0)
    800020ec:	f0f43823          	sd	a5,-240(s0)
				uint initVal;
				initVal = (uint)a2;
    800020f0:	fb043783          	ld	a5,-80(s0)
    800020f4:	f0f42623          	sw	a5,-244(s0)
				*openHandle = KSem::initSem(initVal);
    800020f8:	f0c42783          	lw	a5,-244(s0)
    800020fc:	00078513          	mv	a0,a5
    80002100:	00001097          	auipc	ra,0x1
    80002104:	234080e7          	jalr	564(ra) # 80003334 <_ZN4KSem7initSemEj>
    80002108:	00050713          	mv	a4,a0
    8000210c:	f1043783          	ld	a5,-240(s0)
    80002110:	00e7b023          	sd	a4,0(a5)
				if (*openHandle != nullptr) {
    80002114:	f1043783          	ld	a5,-240(s0)
    80002118:	0007b783          	ld	a5,0(a5)
    8000211c:	00078663          	beqz	a5,80002128 <interruptRoutine+0x284>
					__asm__ volatile("li a0, 0");
    80002120:	00000513          	li	a0,0
    80002124:	0080006f          	j	8000212c <interruptRoutine+0x288>
				} else {
					__asm__ volatile("li a0, -1");
    80002128:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    8000212c:	04a43823          	sd	a0,80(s0)
				break;
    80002130:	2d80006f          	j	80002408 <interruptRoutine+0x564>
			case 0x22:
				//sem_close
				sem_t closeHandle;
				closeHandle = (sem_t)a1;
    80002134:	fb843783          	ld	a5,-72(s0)
    80002138:	f0f43c23          	sd	a5,-232(s0)
				KSem::closeSem(closeHandle);
    8000213c:	f1843503          	ld	a0,-232(s0)
    80002140:	00001097          	auipc	ra,0x1
    80002144:	3bc080e7          	jalr	956(ra) # 800034fc <_ZN4KSem8closeSemEPS_>
				__asm__ volatile("sd a0, 80(s0)");
    80002148:	04a43823          	sd	a0,80(s0)
				break;
    8000214c:	2bc0006f          	j	80002408 <interruptRoutine+0x564>
			case 0x23:
				//sem_wait
				sem_t waitHandle;
				waitHandle = (sem_t)a1;
    80002150:	fb843783          	ld	a5,-72(s0)
    80002154:	f2f43023          	sd	a5,-224(s0)
				waitHandle->wait();
    80002158:	f2043503          	ld	a0,-224(s0)
    8000215c:	00001097          	auipc	ra,0x1
    80002160:	26c080e7          	jalr	620(ra) # 800033c8 <_ZN4KSem4waitEv>
				__asm__ volatile("sd a0, 80(s0)");
    80002164:	04a43823          	sd	a0,80(s0)
				break;
    80002168:	2a00006f          	j	80002408 <interruptRoutine+0x564>
			case 0x24:
				//sem_signal
				sem_t signalHandle;
				signalHandle = (sem_t)a1;
    8000216c:	fb843783          	ld	a5,-72(s0)
    80002170:	f2f43423          	sd	a5,-216(s0)
				signalHandle->signal();
    80002174:	f2843503          	ld	a0,-216(s0)
    80002178:	00001097          	auipc	ra,0x1
    8000217c:	308080e7          	jalr	776(ra) # 80003480 <_ZN4KSem6signalEv>
				__asm__ volatile("sd a0, 80(s0)");
    80002180:	04a43823          	sd	a0,80(s0)
				break;
    80002184:	2840006f          	j	80002408 <interruptRoutine+0x564>
			case 0x31:
				//time_sleep
				time_t timerPeriods;
				timerPeriods = (time_t)a1;
    80002188:	fb843783          	ld	a5,-72(s0)
    8000218c:	f2f43823          	sd	a5,-208(s0)
				if (timerPeriods > 0) {
    80002190:	f3043783          	ld	a5,-208(s0)
    80002194:	00078663          	beqz	a5,800021a0 <interruptRoutine+0x2fc>
					__asm__ volatile("li a0, 0");
    80002198:	00000513          	li	a0,0
    8000219c:	0080006f          	j	800021a4 <interruptRoutine+0x300>
				} else {
					__asm__ volatile("li a0, -1");
    800021a0:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    800021a4:	04a43823          	sd	a0,80(s0)
				if (timerPeriods > 0) {
    800021a8:	f3043783          	ld	a5,-208(s0)
    800021ac:	24078463          	beqz	a5,800023f4 <interruptRoutine+0x550>
					Scheduler::putToSleep(TCB::running, timerPeriods);
    800021b0:	0000b797          	auipc	a5,0xb
    800021b4:	aa87b783          	ld	a5,-1368(a5) # 8000cc58 <_GLOBAL_OFFSET_TABLE_+0x60>
    800021b8:	0007b783          	ld	a5,0(a5)
    800021bc:	f3043583          	ld	a1,-208(s0)
    800021c0:	00078513          	mv	a0,a5
    800021c4:	fffff097          	auipc	ra,0xfffff
    800021c8:	6c0080e7          	jalr	1728(ra) # 80001884 <_ZN9Scheduler10putToSleepEP3TCBm>
					TCB::yield();
    800021cc:	00001097          	auipc	ra,0x1
    800021d0:	be4080e7          	jalr	-1052(ra) # 80002db0 <_ZN3TCB5yieldEv>
				}
				break;
    800021d4:	2200006f          	j	800023f4 <interruptRoutine+0x550>
			case 0x41:
				//getc
				__getc();
    800021d8:	00007097          	auipc	ra,0x7
    800021dc:	e10080e7          	jalr	-496(ra) # 80008fe8 <__getc>
				__asm__ volatile("sd a0, 80(s0)");
    800021e0:	04a43823          	sd	a0,80(s0)
				break;
    800021e4:	2240006f          	j	80002408 <interruptRoutine+0x564>
			case 0x42:
				//putc
				char c;
				c = (char)a1;
    800021e8:	fb843783          	ld	a5,-72(s0)
    800021ec:	f2f40fa3          	sb	a5,-193(s0)
				__putc(c);
    800021f0:	f3f44783          	lbu	a5,-193(s0)
    800021f4:	00078513          	mv	a0,a5
    800021f8:	00007097          	auipc	ra,0x7
    800021fc:	db4080e7          	jalr	-588(ra) # 80008fac <__putc>
				break;
    80002200:	2080006f          	j	80002408 <interruptRoutine+0x564>
			case 0x80:
				//alloc thread
				thread_t* handleAlloc;
				handleAlloc = (thread_t*)a1;
    80002204:	fb843783          	ld	a5,-72(s0)
    80002208:	f4f43c23          	sd	a5,-168(s0)
				void (* foo)(void*);
				foo = (void (*)(void*))a2;
    8000220c:	fb043783          	ld	a5,-80(s0)
    80002210:	f4f43823          	sd	a5,-176(s0)
				void* argsAlloc;
				argsAlloc = (void*)a3;
    80002214:	fa843783          	ld	a5,-88(s0)
    80002218:	f4f43423          	sd	a5,-184(s0)
				uint64* spAlloc;
				spAlloc = (uint64*)a4;
    8000221c:	fa043783          	ld	a5,-96(s0)
    80002220:	f4f43023          	sd	a5,-192(s0)

				*handleAlloc = TCB::createThread(foo, argsAlloc, spAlloc);
    80002224:	f4043603          	ld	a2,-192(s0)
    80002228:	f4843583          	ld	a1,-184(s0)
    8000222c:	f5043503          	ld	a0,-176(s0)
    80002230:	00001097          	auipc	ra,0x1
    80002234:	be8080e7          	jalr	-1048(ra) # 80002e18 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80002238:	00050713          	mv	a4,a0
    8000223c:	f5843783          	ld	a5,-168(s0)
    80002240:	00e7b023          	sd	a4,0(a5)
				if (*handleAlloc != nullptr) {
    80002244:	f5843783          	ld	a5,-168(s0)
    80002248:	0007b783          	ld	a5,0(a5)
    8000224c:	00078663          	beqz	a5,80002258 <interruptRoutine+0x3b4>
					__asm__ volatile("li a0, 0");
    80002250:	00000513          	li	a0,0
    80002254:	0080006f          	j	8000225c <interruptRoutine+0x3b8>
				} else {
					__asm__ volatile("li a0, -1");
    80002258:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    8000225c:	04a43823          	sd	a0,80(s0)
				break;
    80002260:	1a80006f          	j	80002408 <interruptRoutine+0x564>
			case 0x81:
				//start thread
				thread_t threadStartHandle;
				threadStartHandle = (thread_t)a1;
    80002264:	fb843783          	ld	a5,-72(s0)
    80002268:	f6f43023          	sd	a5,-160(s0)
				Scheduler::put(threadStartHandle);
    8000226c:	f6043503          	ld	a0,-160(s0)
    80002270:	fffff097          	auipc	ra,0xfffff
    80002274:	590080e7          	jalr	1424(ra) # 80001800 <_ZN9Scheduler3putEP3TCB>
				break;
    80002278:	1900006f          	j	80002408 <interruptRoutine+0x564>
			case 0x90:
				//printString
				const char* string;
				string = (const char*)a1;
    8000227c:	fb843783          	ld	a5,-72(s0)
    80002280:	fef43423          	sd	a5,-24(s0)
				while (*string != '\0') {
    80002284:	fe843783          	ld	a5,-24(s0)
    80002288:	0007c783          	lbu	a5,0(a5)
    8000228c:	16078863          	beqz	a5,800023fc <interruptRoutine+0x558>
					__putc(*string);
    80002290:	fe843783          	ld	a5,-24(s0)
    80002294:	0007c783          	lbu	a5,0(a5)
    80002298:	00078513          	mv	a0,a5
    8000229c:	00007097          	auipc	ra,0x7
    800022a0:	d10080e7          	jalr	-752(ra) # 80008fac <__putc>
					string++;
    800022a4:	fe843783          	ld	a5,-24(s0)
    800022a8:	00178793          	addi	a5,a5,1
    800022ac:	fef43423          	sd	a5,-24(s0)
				while (*string != '\0') {
    800022b0:	fd5ff06f          	j	80002284 <interruptRoutine+0x3e0>
				}
				break;
			case 0x91:
				//printInteger
				uint64 integer;
				integer = a1;
    800022b4:	fb843783          	ld	a5,-72(s0)
    800022b8:	f6f43823          	sd	a5,-144(s0)
				static char digits[] = "0123456789";
				char buf[16];
				int i, neg;
				uint x;

				neg = 0;
    800022bc:	f6042623          	sw	zero,-148(s0)
				if (integer < 0) {
					neg = 1;
					x = -integer;
				} else {
					x = integer;
    800022c0:	f7043783          	ld	a5,-144(s0)
    800022c4:	fef42023          	sw	a5,-32(s0)
				}

				i = 0;
    800022c8:	fe042223          	sw	zero,-28(s0)
				do {
					buf[i++] = digits[x % 10];
    800022cc:	fe042703          	lw	a4,-32(s0)
    800022d0:	00a00793          	li	a5,10
    800022d4:	02f777bb          	remuw	a5,a4,a5
    800022d8:	0007861b          	sext.w	a2,a5
    800022dc:	fe442783          	lw	a5,-28(s0)
    800022e0:	0017871b          	addiw	a4,a5,1
    800022e4:	fee42223          	sw	a4,-28(s0)
    800022e8:	0000a697          	auipc	a3,0xa
    800022ec:	6e068693          	addi	a3,a3,1760 # 8000c9c8 <_ZZ16interruptRoutineE6digits>
    800022f0:	02061713          	slli	a4,a2,0x20
    800022f4:	02075713          	srli	a4,a4,0x20
    800022f8:	00e68733          	add	a4,a3,a4
    800022fc:	00074703          	lbu	a4,0(a4)
    80002300:	ff040693          	addi	a3,s0,-16
    80002304:	00f687b3          	add	a5,a3,a5
    80002308:	ece78823          	sb	a4,-304(a5)
				} while ((x /= 10) != 0);
    8000230c:	fe042703          	lw	a4,-32(s0)
    80002310:	00a00793          	li	a5,10
    80002314:	02f757bb          	divuw	a5,a4,a5
    80002318:	fef42023          	sw	a5,-32(s0)
    8000231c:	fe042783          	lw	a5,-32(s0)
    80002320:	0007879b          	sext.w	a5,a5
    80002324:	00f037b3          	snez	a5,a5
    80002328:	0ff7f793          	andi	a5,a5,255
    8000232c:	00078463          	beqz	a5,80002334 <interruptRoutine+0x490>
				do {
    80002330:	f9dff06f          	j	800022cc <interruptRoutine+0x428>
				if (neg) buf[i++] = '-';
    80002334:	f6c42783          	lw	a5,-148(s0)
    80002338:	0007879b          	sext.w	a5,a5
    8000233c:	02078063          	beqz	a5,8000235c <interruptRoutine+0x4b8>
    80002340:	fe442783          	lw	a5,-28(s0)
    80002344:	0017871b          	addiw	a4,a5,1
    80002348:	fee42223          	sw	a4,-28(s0)
    8000234c:	ff040713          	addi	a4,s0,-16
    80002350:	00f707b3          	add	a5,a4,a5
    80002354:	02d00713          	li	a4,45
    80002358:	ece78823          	sb	a4,-304(a5)

				while (--i >= 0) {
    8000235c:	fe442783          	lw	a5,-28(s0)
    80002360:	fff7879b          	addiw	a5,a5,-1
    80002364:	fef42223          	sw	a5,-28(s0)
    80002368:	fe442783          	lw	a5,-28(s0)
    8000236c:	fff7c793          	not	a5,a5
    80002370:	01f7d79b          	srliw	a5,a5,0x1f
    80002374:	0ff7f793          	andi	a5,a5,255
    80002378:	08078663          	beqz	a5,80002404 <interruptRoutine+0x560>
					__putc(buf[i]);
    8000237c:	fe442783          	lw	a5,-28(s0)
    80002380:	ff040713          	addi	a4,s0,-16
    80002384:	00f707b3          	add	a5,a4,a5
    80002388:	ed07c783          	lbu	a5,-304(a5)
    8000238c:	00078513          	mv	a0,a5
    80002390:	00007097          	auipc	ra,0x7
    80002394:	c1c080e7          	jalr	-996(ra) # 80008fac <__putc>
				while (--i >= 0) {
    80002398:	fc5ff06f          	j	8000235c <interruptRoutine+0x4b8>
				}
				break;
			default:
				printString("\nNepostojeci op code: ");
    8000239c:	00008517          	auipc	a0,0x8
    800023a0:	d6c50513          	addi	a0,a0,-660 # 8000a108 <CONSOLE_STATUS+0xf8>
    800023a4:	00004097          	auipc	ra,0x4
    800023a8:	8f0080e7          	jalr	-1808(ra) # 80005c94 <_Z11printStringPKc>
				printInteger(opCode);
    800023ac:	f7843503          	ld	a0,-136(s0)
    800023b0:	fffff097          	auipc	ra,0xfffff
    800023b4:	428080e7          	jalr	1064(ra) # 800017d8 <_Z12printIntegerm>
				printString("\nscause: ");
    800023b8:	00008517          	auipc	a0,0x8
    800023bc:	d6850513          	addi	a0,a0,-664 # 8000a120 <CONSOLE_STATUS+0x110>
    800023c0:	00004097          	auipc	ra,0x4
    800023c4:	8d4080e7          	jalr	-1836(ra) # 80005c94 <_Z11printStringPKc>
				printInteger(scause);
    800023c8:	fd843503          	ld	a0,-40(s0)
    800023cc:	fffff097          	auipc	ra,0xfffff
    800023d0:	40c080e7          	jalr	1036(ra) # 800017d8 <_Z12printIntegerm>
				printString("\nsepc: ");
    800023d4:	00008517          	auipc	a0,0x8
    800023d8:	d5c50513          	addi	a0,a0,-676 # 8000a130 <CONSOLE_STATUS+0x120>
    800023dc:	00004097          	auipc	ra,0x4
    800023e0:	8b8080e7          	jalr	-1864(ra) # 80005c94 <_Z11printStringPKc>
				printInteger(sepc);
    800023e4:	fd043503          	ld	a0,-48(s0)
    800023e8:	fffff097          	auipc	ra,0xfffff
    800023ec:	3f0080e7          	jalr	1008(ra) # 800017d8 <_Z12printIntegerm>
				break;
    800023f0:	0180006f          	j	80002408 <interruptRoutine+0x564>
				break;
    800023f4:	00000013          	nop
    800023f8:	0100006f          	j	80002408 <interruptRoutine+0x564>
				break;
    800023fc:	00000013          	nop
    80002400:	0080006f          	j	80002408 <interruptRoutine+0x564>
				break;
    80002404:	00000013          	nop
		}
		//sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
		//sepc += 4;
		__asm__ volatile("addi %[dst], %[src], 0x4":[dst]"=r"(sepc):[src]"r"(
				sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002408:	fd043303          	ld	t1,-48(s0)
    8000240c:	00430313          	addi	t1,t1,4
    80002410:	fc643823          	sd	t1,-48(s0)
		__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002414:	fd043303          	ld	t1,-48(s0)
    80002418:	14131073          	csrw	sepc,t1
    8000241c:	00000013          	nop
		printString("scause: ");
		printInteger(scause);
		printString("\nsepc: ");
		printInteger(sepc);
	}
}
    80002420:	2640006f          	j	80002684 <interruptRoutine+0x7e0>
	} else if (scause == (1UL << 63 | 9)) {
    80002424:	fd843703          	ld	a4,-40(s0)
    80002428:	fff00793          	li	a5,-1
    8000242c:	03f79793          	slli	a5,a5,0x3f
    80002430:	00978793          	addi	a5,a5,9
    80002434:	14f71e63          	bne	a4,a5,80002590 <interruptRoutine+0x6ec>
		uint64 irq = plic_claim();
    80002438:	00005097          	auipc	ra,0x5
    8000243c:	30c080e7          	jalr	780(ra) # 80007744 <plic_claim>
    80002440:	00050793          	mv	a5,a0
    80002444:	f8f43023          	sd	a5,-128(s0)
		if (irq == CONSOLE_IRQ) {
    80002448:	f8043703          	ld	a4,-128(s0)
    8000244c:	00a00793          	li	a5,10
    80002450:	10f71463          	bne	a4,a5,80002558 <interruptRoutine+0x6b4>
			if (*KConsole::sr & CONSOLE_RX_STATUS_BIT) {
    80002454:	0000b797          	auipc	a5,0xb
    80002458:	81c7b783          	ld	a5,-2020(a5) # 8000cc70 <_GLOBAL_OFFSET_TABLE_+0x78>
    8000245c:	0007b783          	ld	a5,0(a5)
    80002460:	0007c783          	lbu	a5,0(a5)
    80002464:	0017f793          	andi	a5,a5,1
    80002468:	04078463          	beqz	a5,800024b0 <interruptRoutine+0x60c>
				printString("\nrx grana\n");
    8000246c:	00008517          	auipc	a0,0x8
    80002470:	ccc50513          	addi	a0,a0,-820 # 8000a138 <CONSOLE_STATUS+0x128>
    80002474:	00004097          	auipc	ra,0x4
    80002478:	820080e7          	jalr	-2016(ra) # 80005c94 <_Z11printStringPKc>
				printInteger(c = *KConsole::dr);
    8000247c:	0000a797          	auipc	a5,0xa
    80002480:	7cc7b783          	ld	a5,1996(a5) # 8000cc48 <_GLOBAL_OFFSET_TABLE_+0x50>
    80002484:	0007b783          	ld	a5,0(a5)
    80002488:	0007c703          	lbu	a4,0(a5)
    8000248c:	0000a797          	auipc	a5,0xa
    80002490:	54878793          	addi	a5,a5,1352 # 8000c9d4 <_ZZ16interruptRoutineE1c>
    80002494:	00e78023          	sb	a4,0(a5)
    80002498:	0000a797          	auipc	a5,0xa
    8000249c:	53c78793          	addi	a5,a5,1340 # 8000c9d4 <_ZZ16interruptRoutineE1c>
    800024a0:	0007c783          	lbu	a5,0(a5)
    800024a4:	00078513          	mv	a0,a5
    800024a8:	fffff097          	auipc	ra,0xfffff
    800024ac:	330080e7          	jalr	816(ra) # 800017d8 <_Z12printIntegerm>
			if (*KConsole::sr & CONSOLE_TX_STATUS_BIT) {
    800024b0:	0000a797          	auipc	a5,0xa
    800024b4:	7c07b783          	ld	a5,1984(a5) # 8000cc70 <_GLOBAL_OFFSET_TABLE_+0x78>
    800024b8:	0007b783          	ld	a5,0(a5)
    800024bc:	0007c783          	lbu	a5,0(a5)
    800024c0:	0207f793          	andi	a5,a5,32
    800024c4:	06078663          	beqz	a5,80002530 <interruptRoutine+0x68c>
				*KConsole::dr = c;
    800024c8:	0000a797          	auipc	a5,0xa
    800024cc:	7807b783          	ld	a5,1920(a5) # 8000cc48 <_GLOBAL_OFFSET_TABLE_+0x50>
    800024d0:	0007b783          	ld	a5,0(a5)
    800024d4:	0000a717          	auipc	a4,0xa
    800024d8:	50070713          	addi	a4,a4,1280 # 8000c9d4 <_ZZ16interruptRoutineE1c>
    800024dc:	00074703          	lbu	a4,0(a4)
    800024e0:	00e78023          	sb	a4,0(a5)
				if (i++ == 126)i = 32;
    800024e4:	0000a797          	auipc	a5,0xa
    800024e8:	4ef78793          	addi	a5,a5,1263 # 8000c9d3 <_ZZ16interruptRoutineE1i>
    800024ec:	0007c783          	lbu	a5,0(a5)
    800024f0:	0017871b          	addiw	a4,a5,1
    800024f4:	0ff77693          	andi	a3,a4,255
    800024f8:	0000a717          	auipc	a4,0xa
    800024fc:	4db70713          	addi	a4,a4,1243 # 8000c9d3 <_ZZ16interruptRoutineE1i>
    80002500:	00d70023          	sb	a3,0(a4)
    80002504:	0007871b          	sext.w	a4,a5
    80002508:	07e00793          	li	a5,126
    8000250c:	40f707b3          	sub	a5,a4,a5
    80002510:	0017b793          	seqz	a5,a5
    80002514:	0ff7f793          	andi	a5,a5,255
    80002518:	02078463          	beqz	a5,80002540 <interruptRoutine+0x69c>
    8000251c:	0000a797          	auipc	a5,0xa
    80002520:	4b778793          	addi	a5,a5,1207 # 8000c9d3 <_ZZ16interruptRoutineE1i>
    80002524:	02000713          	li	a4,32
    80002528:	00e78023          	sb	a4,0(a5)
    8000252c:	0140006f          	j	80002540 <interruptRoutine+0x69c>
				printString("\nnista\n");
    80002530:	00008517          	auipc	a0,0x8
    80002534:	c1850513          	addi	a0,a0,-1000 # 8000a148 <CONSOLE_STATUS+0x138>
    80002538:	00003097          	auipc	ra,0x3
    8000253c:	75c080e7          	jalr	1884(ra) # 80005c94 <_Z11printStringPKc>
			plic_complete(irq);
    80002540:	f8043783          	ld	a5,-128(s0)
    80002544:	0007879b          	sext.w	a5,a5
    80002548:	00078513          	mv	a0,a5
    8000254c:	00005097          	auipc	ra,0x5
    80002550:	230080e7          	jalr	560(ra) # 8000777c <plic_complete>
    80002554:	0140006f          	j	80002568 <interruptRoutine+0x6c4>
			printString("Neki drugi prekid\n");
    80002558:	00008517          	auipc	a0,0x8
    8000255c:	bf850513          	addi	a0,a0,-1032 # 8000a150 <CONSOLE_STATUS+0x140>
    80002560:	00003097          	auipc	ra,0x3
    80002564:	734080e7          	jalr	1844(ra) # 80005c94 <_Z11printStringPKc>
		Riscv::w_sepc(sepc);
    80002568:	fd043503          	ld	a0,-48(s0)
    8000256c:	00000097          	auipc	ra,0x0
    80002570:	12c080e7          	jalr	300(ra) # 80002698 <_ZN5Riscv6w_sepcEm>
		Riscv::w_sstatus(sstatus);
    80002574:	fc843503          	ld	a0,-56(s0)
    80002578:	00000097          	auipc	ra,0x0
    8000257c:	158080e7          	jalr	344(ra) # 800026d0 <_ZN5Riscv9w_sstatusEm>
		Riscv::mc_sip(Riscv::SIP_SEIP);
    80002580:	20000513          	li	a0,512
    80002584:	00000097          	auipc	ra,0x0
    80002588:	130080e7          	jalr	304(ra) # 800026b4 <_ZN5Riscv6mc_sipEm>
}
    8000258c:	0f80006f          	j	80002684 <interruptRoutine+0x7e0>
	} else if (scause == (1UL << 63 | 1)) {
    80002590:	fd843703          	ld	a4,-40(s0)
    80002594:	fff00793          	li	a5,-1
    80002598:	03f79793          	slli	a5,a5,0x3f
    8000259c:	00178793          	addi	a5,a5,1
    800025a0:	08f71e63          	bne	a4,a5,8000263c <interruptRoutine+0x798>
		Scheduler::wake();
    800025a4:	fffff097          	auipc	ra,0xfffff
    800025a8:	388080e7          	jalr	904(ra) # 8000192c <_ZN9Scheduler4wakeEv>
		TCB::runningTimeSlice++;
    800025ac:	0000a797          	auipc	a5,0xa
    800025b0:	6647b783          	ld	a5,1636(a5) # 8000cc10 <_GLOBAL_OFFSET_TABLE_+0x18>
    800025b4:	0007b783          	ld	a5,0(a5)
    800025b8:	00178713          	addi	a4,a5,1
    800025bc:	0000a797          	auipc	a5,0xa
    800025c0:	6547b783          	ld	a5,1620(a5) # 8000cc10 <_GLOBAL_OFFSET_TABLE_+0x18>
    800025c4:	00e7b023          	sd	a4,0(a5)
		if (TCB::runningTimeSlice >= TCB::running->getTimeSlice()) {
    800025c8:	0000a797          	auipc	a5,0xa
    800025cc:	6907b783          	ld	a5,1680(a5) # 8000cc58 <_GLOBAL_OFFSET_TABLE_+0x60>
    800025d0:	0007b783          	ld	a5,0(a5)
    800025d4:	00078513          	mv	a0,a5
    800025d8:	00000097          	auipc	ra,0x0
    800025dc:	130080e7          	jalr	304(ra) # 80002708 <_ZN3TCB12getTimeSliceEv>
    800025e0:	00050713          	mv	a4,a0
    800025e4:	0000a797          	auipc	a5,0xa
    800025e8:	62c7b783          	ld	a5,1580(a5) # 8000cc10 <_GLOBAL_OFFSET_TABLE_+0x18>
    800025ec:	0007b783          	ld	a5,0(a5)
    800025f0:	00e7b7b3          	sltu	a5,a5,a4
    800025f4:	0017c793          	xori	a5,a5,1
    800025f8:	0ff7f793          	andi	a5,a5,255
    800025fc:	00078c63          	beqz	a5,80002614 <interruptRoutine+0x770>
			TCB::yield();
    80002600:	00000097          	auipc	ra,0x0
    80002604:	7b0080e7          	jalr	1968(ra) # 80002db0 <_ZN3TCB5yieldEv>
			TCB::runningTimeSlice = 0;
    80002608:	0000a797          	auipc	a5,0xa
    8000260c:	6087b783          	ld	a5,1544(a5) # 8000cc10 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002610:	0007b023          	sd	zero,0(a5)
		Riscv::w_sepc(sepc);
    80002614:	fd043503          	ld	a0,-48(s0)
    80002618:	00000097          	auipc	ra,0x0
    8000261c:	080080e7          	jalr	128(ra) # 80002698 <_ZN5Riscv6w_sepcEm>
		Riscv::w_sstatus(sstatus);
    80002620:	fc843503          	ld	a0,-56(s0)
    80002624:	00000097          	auipc	ra,0x0
    80002628:	0ac080e7          	jalr	172(ra) # 800026d0 <_ZN5Riscv9w_sstatusEm>
		Riscv::mc_sip(Riscv::SIP_SSIP);
    8000262c:	00200513          	li	a0,2
    80002630:	00000097          	auipc	ra,0x0
    80002634:	084080e7          	jalr	132(ra) # 800026b4 <_ZN5Riscv6mc_sipEm>
}
    80002638:	04c0006f          	j	80002684 <interruptRoutine+0x7e0>
		printString("\nGreska u prekidnoj rutini\n");
    8000263c:	00008517          	auipc	a0,0x8
    80002640:	b2c50513          	addi	a0,a0,-1236 # 8000a168 <CONSOLE_STATUS+0x158>
    80002644:	00003097          	auipc	ra,0x3
    80002648:	650080e7          	jalr	1616(ra) # 80005c94 <_Z11printStringPKc>
		printString("scause: ");
    8000264c:	00008517          	auipc	a0,0x8
    80002650:	b3c50513          	addi	a0,a0,-1220 # 8000a188 <CONSOLE_STATUS+0x178>
    80002654:	00003097          	auipc	ra,0x3
    80002658:	640080e7          	jalr	1600(ra) # 80005c94 <_Z11printStringPKc>
		printInteger(scause);
    8000265c:	fd843503          	ld	a0,-40(s0)
    80002660:	fffff097          	auipc	ra,0xfffff
    80002664:	178080e7          	jalr	376(ra) # 800017d8 <_Z12printIntegerm>
		printString("\nsepc: ");
    80002668:	00008517          	auipc	a0,0x8
    8000266c:	ac850513          	addi	a0,a0,-1336 # 8000a130 <CONSOLE_STATUS+0x120>
    80002670:	00003097          	auipc	ra,0x3
    80002674:	624080e7          	jalr	1572(ra) # 80005c94 <_Z11printStringPKc>
		printInteger(sepc);
    80002678:	fd043503          	ld	a0,-48(s0)
    8000267c:	fffff097          	auipc	ra,0xfffff
    80002680:	15c080e7          	jalr	348(ra) # 800017d8 <_Z12printIntegerm>
}
    80002684:	00000013          	nop
    80002688:	13813083          	ld	ra,312(sp)
    8000268c:	13013403          	ld	s0,304(sp)
    80002690:	14010113          	addi	sp,sp,320
    80002694:	00008067          	ret

0000000080002698 <_ZN5Riscv6w_sepcEm>:
inline void Riscv::w_sepc(uint64 sepc) {
    80002698:	ff010113          	addi	sp,sp,-16
    8000269c:	00813423          	sd	s0,8(sp)
    800026a0:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    800026a4:	14151073          	csrw	sepc,a0
}
    800026a8:	00813403          	ld	s0,8(sp)
    800026ac:	01010113          	addi	sp,sp,16
    800026b0:	00008067          	ret

00000000800026b4 <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    800026b4:	ff010113          	addi	sp,sp,-16
    800026b8:	00813423          	sd	s0,8(sp)
    800026bc:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    800026c0:	14453073          	csrc	sip,a0
}
    800026c4:	00813403          	ld	s0,8(sp)
    800026c8:	01010113          	addi	sp,sp,16
    800026cc:	00008067          	ret

00000000800026d0 <_ZN5Riscv9w_sstatusEm>:
	uint64 volatile sstatus;
	__asm__ volatile("csrr %[sstatus], sstatus": [sstatus] "=r"(sstatus));
	return sstatus;
}

inline void Riscv::w_sstatus(uint64 sstatus) {
    800026d0:	ff010113          	addi	sp,sp,-16
    800026d4:	00813423          	sd	s0,8(sp)
    800026d8:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw sstatus, %[sstatus]": :[sstatus] "r"(sstatus));
    800026dc:	10051073          	csrw	sstatus,a0
}
    800026e0:	00813403          	ld	s0,8(sp)
    800026e4:	01010113          	addi	sp,sp,16
    800026e8:	00008067          	ret

00000000800026ec <_ZN3TCB11setFinishedEb>:
	static TCB* createThread(Body function, void* args, uint64* stack);
	static void start(TCB* newTcb);

	bool isFinished() { return finished; }

	void setFinished(bool finish) { this->finished = finish; }
    800026ec:	ff010113          	addi	sp,sp,-16
    800026f0:	00813423          	sd	s0,8(sp)
    800026f4:	01010413          	addi	s0,sp,16
    800026f8:	02b50823          	sb	a1,48(a0)
    800026fc:	00813403          	ld	s0,8(sp)
    80002700:	01010113          	addi	sp,sp,16
    80002704:	00008067          	ret

0000000080002708 <_ZN3TCB12getTimeSliceEv>:

	bool isBlocked() { return blocked; }

	void setBlocked(bool block) { this->blocked = block; }

	uint64 getTimeSlice() { return timeSlice; }
    80002708:	ff010113          	addi	sp,sp,-16
    8000270c:	00813423          	sd	s0,8(sp)
    80002710:	01010413          	addi	s0,sp,16
    80002714:	02853503          	ld	a0,40(a0)
    80002718:	00813403          	ld	s0,8(sp)
    8000271c:	01010113          	addi	sp,sp,16
    80002720:	00008067          	ret

0000000080002724 <_ZN6Thread7wrapperEPv>:

	__asm__ volatile("ecall");
}

void Thread::wrapper(void* thread) {
	if(thread!=nullptr){
    80002724:	02050863          	beqz	a0,80002754 <_ZN6Thread7wrapperEPv+0x30>
void Thread::wrapper(void* thread) {
    80002728:	ff010113          	addi	sp,sp,-16
    8000272c:	00113423          	sd	ra,8(sp)
    80002730:	00813023          	sd	s0,0(sp)
    80002734:	01010413          	addi	s0,sp,16
		((Thread*)thread)->run();
    80002738:	00053783          	ld	a5,0(a0)
    8000273c:	0107b783          	ld	a5,16(a5)
    80002740:	000780e7          	jalr	a5
	}
}
    80002744:	00813083          	ld	ra,8(sp)
    80002748:	00013403          	ld	s0,0(sp)
    8000274c:	01010113          	addi	sp,sp,16
    80002750:	00008067          	ret
    80002754:	00008067          	ret

0000000080002758 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    80002758:	ff010113          	addi	sp,sp,-16
    8000275c:	00113423          	sd	ra,8(sp)
    80002760:	00813023          	sd	s0,0(sp)
    80002764:	01010413          	addi	s0,sp,16
    80002768:	0000a797          	auipc	a5,0xa
    8000276c:	2b078793          	addi	a5,a5,688 # 8000ca18 <_ZTV6Thread+0x10>
    80002770:	00f53023          	sd	a5,0(a0)
	thread_exit();
    80002774:	fffff097          	auipc	ra,0xfffff
    80002778:	c8c080e7          	jalr	-884(ra) # 80001400 <_Z11thread_exitv>
}
    8000277c:	00813083          	ld	ra,8(sp)
    80002780:	00013403          	ld	s0,0(sp)
    80002784:	01010113          	addi	sp,sp,16
    80002788:	00008067          	ret

000000008000278c <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
	sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    8000278c:	fe010113          	addi	sp,sp,-32
    80002790:	00113c23          	sd	ra,24(sp)
    80002794:	00813823          	sd	s0,16(sp)
    80002798:	00913423          	sd	s1,8(sp)
    8000279c:	02010413          	addi	s0,sp,32
    800027a0:	00050493          	mv	s1,a0
    800027a4:	0000a797          	auipc	a5,0xa
    800027a8:	29c78793          	addi	a5,a5,668 # 8000ca40 <_ZTV9Semaphore+0x10>
    800027ac:	00f53023          	sd	a5,0(a0)
	sem_close(myHandle);
    800027b0:	00853503          	ld	a0,8(a0)
    800027b4:	fffff097          	auipc	ra,0xfffff
    800027b8:	d24080e7          	jalr	-732(ra) # 800014d8 <_Z9sem_closeP4KSem>
	delete myHandle;
    800027bc:	0084b483          	ld	s1,8(s1)
    800027c0:	02048863          	beqz	s1,800027f0 <_ZN9SemaphoreD1Ev+0x64>
		return front == nullptr;
    800027c4:	0084b503          	ld	a0,8(s1)
		while (!isEmpty()) {
    800027c8:	00050e63          	beqz	a0,800027e4 <_ZN9SemaphoreD1Ev+0x58>
			front = front->next;
    800027cc:	00853783          	ld	a5,8(a0)
    800027d0:	00f4b423          	sd	a5,8(s1)
			delete node;
    800027d4:	fe0508e3          	beqz	a0,800027c4 <_ZN9SemaphoreD1Ev+0x38>
			mem_free(ptr);
    800027d8:	fffff097          	auipc	ra,0xfffff
    800027dc:	b78080e7          	jalr	-1160(ra) # 80001350 <_Z8mem_freePv>
		}
    800027e0:	fe5ff06f          	j	800027c4 <_ZN9SemaphoreD1Ev+0x38>
    800027e4:	00048513          	mv	a0,s1
    800027e8:	00001097          	auipc	ra,0x1
    800027ec:	b24080e7          	jalr	-1244(ra) # 8000330c <_ZN4KSemdlEPv>
}
    800027f0:	01813083          	ld	ra,24(sp)
    800027f4:	01013403          	ld	s0,16(sp)
    800027f8:	00813483          	ld	s1,8(sp)
    800027fc:	02010113          	addi	sp,sp,32
    80002800:	00008067          	ret

0000000080002804 <_Znwm>:
void* operator new(size_t size) {
    80002804:	ff010113          	addi	sp,sp,-16
    80002808:	00113423          	sd	ra,8(sp)
    8000280c:	00813023          	sd	s0,0(sp)
    80002810:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    80002814:	fffff097          	auipc	ra,0xfffff
    80002818:	afc080e7          	jalr	-1284(ra) # 80001310 <_Z9mem_allocm>
}
    8000281c:	00813083          	ld	ra,8(sp)
    80002820:	00013403          	ld	s0,0(sp)
    80002824:	01010113          	addi	sp,sp,16
    80002828:	00008067          	ret

000000008000282c <_Znam>:
void* operator new[](size_t size) {
    8000282c:	ff010113          	addi	sp,sp,-16
    80002830:	00113423          	sd	ra,8(sp)
    80002834:	00813023          	sd	s0,0(sp)
    80002838:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    8000283c:	fffff097          	auipc	ra,0xfffff
    80002840:	ad4080e7          	jalr	-1324(ra) # 80001310 <_Z9mem_allocm>
}
    80002844:	00813083          	ld	ra,8(sp)
    80002848:	00013403          	ld	s0,0(sp)
    8000284c:	01010113          	addi	sp,sp,16
    80002850:	00008067          	ret

0000000080002854 <_ZdlPv>:
noexcept {
    80002854:	ff010113          	addi	sp,sp,-16
    80002858:	00113423          	sd	ra,8(sp)
    8000285c:	00813023          	sd	s0,0(sp)
    80002860:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80002864:	fffff097          	auipc	ra,0xfffff
    80002868:	aec080e7          	jalr	-1300(ra) # 80001350 <_Z8mem_freePv>
}
    8000286c:	00813083          	ld	ra,8(sp)
    80002870:	00013403          	ld	s0,0(sp)
    80002874:	01010113          	addi	sp,sp,16
    80002878:	00008067          	ret

000000008000287c <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    8000287c:	fe010113          	addi	sp,sp,-32
    80002880:	00113c23          	sd	ra,24(sp)
    80002884:	00813823          	sd	s0,16(sp)
    80002888:	00913423          	sd	s1,8(sp)
    8000288c:	02010413          	addi	s0,sp,32
    80002890:	00050493          	mv	s1,a0
}
    80002894:	00000097          	auipc	ra,0x0
    80002898:	ec4080e7          	jalr	-316(ra) # 80002758 <_ZN6ThreadD1Ev>
    8000289c:	00048513          	mv	a0,s1
    800028a0:	00000097          	auipc	ra,0x0
    800028a4:	fb4080e7          	jalr	-76(ra) # 80002854 <_ZdlPv>
    800028a8:	01813083          	ld	ra,24(sp)
    800028ac:	01013403          	ld	s0,16(sp)
    800028b0:	00813483          	ld	s1,8(sp)
    800028b4:	02010113          	addi	sp,sp,32
    800028b8:	00008067          	ret

00000000800028bc <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    800028bc:	fe010113          	addi	sp,sp,-32
    800028c0:	00113c23          	sd	ra,24(sp)
    800028c4:	00813823          	sd	s0,16(sp)
    800028c8:	00913423          	sd	s1,8(sp)
    800028cc:	02010413          	addi	s0,sp,32
    800028d0:	00050493          	mv	s1,a0
}
    800028d4:	00000097          	auipc	ra,0x0
    800028d8:	eb8080e7          	jalr	-328(ra) # 8000278c <_ZN9SemaphoreD1Ev>
    800028dc:	00048513          	mv	a0,s1
    800028e0:	00000097          	auipc	ra,0x0
    800028e4:	f74080e7          	jalr	-140(ra) # 80002854 <_ZdlPv>
    800028e8:	01813083          	ld	ra,24(sp)
    800028ec:	01013403          	ld	s0,16(sp)
    800028f0:	00813483          	ld	s1,8(sp)
    800028f4:	02010113          	addi	sp,sp,32
    800028f8:	00008067          	ret

00000000800028fc <_ZdaPv>:
noexcept {
    800028fc:	ff010113          	addi	sp,sp,-16
    80002900:	00113423          	sd	ra,8(sp)
    80002904:	00813023          	sd	s0,0(sp)
    80002908:	01010413          	addi	s0,sp,16
mem_free(ptr);
    8000290c:	fffff097          	auipc	ra,0xfffff
    80002910:	a44080e7          	jalr	-1468(ra) # 80001350 <_Z8mem_freePv>
}
    80002914:	00813083          	ld	ra,8(sp)
    80002918:	00013403          	ld	s0,0(sp)
    8000291c:	01010113          	addi	sp,sp,16
    80002920:	00008067          	ret

0000000080002924 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (* body)(void*), void* arg) {
    80002924:	fd010113          	addi	sp,sp,-48
    80002928:	02113423          	sd	ra,40(sp)
    8000292c:	02813023          	sd	s0,32(sp)
    80002930:	00913c23          	sd	s1,24(sp)
    80002934:	01213823          	sd	s2,16(sp)
    80002938:	01313423          	sd	s3,8(sp)
    8000293c:	03010413          	addi	s0,sp,48
    80002940:	00050493          	mv	s1,a0
    80002944:	00058913          	mv	s2,a1
    80002948:	00060993          	mv	s3,a2
    8000294c:	0000a797          	auipc	a5,0xa
    80002950:	0cc78793          	addi	a5,a5,204 # 8000ca18 <_ZTV6Thread+0x10>
    80002954:	00f53023          	sd	a5,0(a0)
	this->body = body;
    80002958:	00b53823          	sd	a1,16(a0)
	this->arg = arg;
    8000295c:	00c53c23          	sd	a2,24(a0)
	if (body != nullptr) {
    80002960:	04058663          	beqz	a1,800029ac <_ZN6ThreadC1EPFvPvES0_+0x88>
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    80002964:	00001537          	lui	a0,0x1
    80002968:	fffff097          	auipc	ra,0xfffff
    8000296c:	9a8080e7          	jalr	-1624(ra) # 80001310 <_Z9mem_allocm>
    80002970:	00050313          	mv	t1,a0
	__asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002974:	00030713          	mv	a4,t1
	__asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002978:	00098693          	mv	a3,s3
			body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000297c:	00090613          	mv	a2,s2
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002980:	00848493          	addi	s1,s1,8
    80002984:	00048593          	mv	a1,s1
	__asm__ volatile("li a0, 0x80");
    80002988:	08000513          	li	a0,128
	__asm__ volatile("ecall");
    8000298c:	00000073          	ecall
}
    80002990:	02813083          	ld	ra,40(sp)
    80002994:	02013403          	ld	s0,32(sp)
    80002998:	01813483          	ld	s1,24(sp)
    8000299c:	01013903          	ld	s2,16(sp)
    800029a0:	00813983          	ld	s3,8(sp)
    800029a4:	03010113          	addi	sp,sp,48
    800029a8:	00008067          	ret
	uint64* stack = nullptr;
    800029ac:	00000313          	li	t1,0
    800029b0:	fc5ff06f          	j	80002974 <_ZN6ThreadC1EPFvPvES0_+0x50>

00000000800029b4 <_ZN6Thread5startEv>:
int Thread::start() {
    800029b4:	ff010113          	addi	sp,sp,-16
    800029b8:	00813423          	sd	s0,8(sp)
    800029bc:	01010413          	addi	s0,sp,16
	if (myHandle == nullptr) return -1;
    800029c0:	00853303          	ld	t1,8(a0) # 1008 <_entry-0x7fffeff8>
    800029c4:	02030063          	beqz	t1,800029e4 <_ZN6Thread5startEv+0x30>
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800029c8:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x81");
    800029cc:	08100513          	li	a0,129
	__asm__ volatile("ecall");
    800029d0:	00000073          	ecall
	return 0;
    800029d4:	00000513          	li	a0,0
}
    800029d8:	00813403          	ld	s0,8(sp)
    800029dc:	01010113          	addi	sp,sp,16
    800029e0:	00008067          	ret
	if (myHandle == nullptr) return -1;
    800029e4:	fff00513          	li	a0,-1
    800029e8:	ff1ff06f          	j	800029d8 <_ZN6Thread5startEv+0x24>

00000000800029ec <_ZN6Thread4joinEv>:
void Thread::join() {
    800029ec:	ff010113          	addi	sp,sp,-16
    800029f0:	00113423          	sd	ra,8(sp)
    800029f4:	00813023          	sd	s0,0(sp)
    800029f8:	01010413          	addi	s0,sp,16
	thread_join(myHandle);
    800029fc:	00853503          	ld	a0,8(a0)
    80002a00:	fffff097          	auipc	ra,0xfffff
    80002a04:	a48080e7          	jalr	-1464(ra) # 80001448 <_Z11thread_joinP3TCB>
}
    80002a08:	00813083          	ld	ra,8(sp)
    80002a0c:	00013403          	ld	s0,0(sp)
    80002a10:	01010113          	addi	sp,sp,16
    80002a14:	00008067          	ret

0000000080002a18 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80002a18:	ff010113          	addi	sp,sp,-16
    80002a1c:	00113423          	sd	ra,8(sp)
    80002a20:	00813023          	sd	s0,0(sp)
    80002a24:	01010413          	addi	s0,sp,16
	thread_dispatch();
    80002a28:	fffff097          	auipc	ra,0xfffff
    80002a2c:	a00080e7          	jalr	-1536(ra) # 80001428 <_Z15thread_dispatchv>
}
    80002a30:	00813083          	ld	ra,8(sp)
    80002a34:	00013403          	ld	s0,0(sp)
    80002a38:	01010113          	addi	sp,sp,16
    80002a3c:	00008067          	ret

0000000080002a40 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t t) {
    80002a40:	ff010113          	addi	sp,sp,-16
    80002a44:	00113423          	sd	ra,8(sp)
    80002a48:	00813023          	sd	s0,0(sp)
    80002a4c:	01010413          	addi	s0,sp,16
    80002a50:	00050593          	mv	a1,a0
	Scheduler::putToSleep(TCB::running, t);
    80002a54:	0000a797          	auipc	a5,0xa
    80002a58:	2047b783          	ld	a5,516(a5) # 8000cc58 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002a5c:	0007b503          	ld	a0,0(a5)
    80002a60:	fffff097          	auipc	ra,0xfffff
    80002a64:	e24080e7          	jalr	-476(ra) # 80001884 <_ZN9Scheduler10putToSleepEP3TCBm>
}
    80002a68:	00000513          	li	a0,0
    80002a6c:	00813083          	ld	ra,8(sp)
    80002a70:	00013403          	ld	s0,0(sp)
    80002a74:	01010113          	addi	sp,sp,16
    80002a78:	00008067          	ret

0000000080002a7c <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80002a7c:	fe010113          	addi	sp,sp,-32
    80002a80:	00113c23          	sd	ra,24(sp)
    80002a84:	00813823          	sd	s0,16(sp)
    80002a88:	00913423          	sd	s1,8(sp)
    80002a8c:	02010413          	addi	s0,sp,32
    80002a90:	00050493          	mv	s1,a0
    80002a94:	0000a797          	auipc	a5,0xa
    80002a98:	f8478793          	addi	a5,a5,-124 # 8000ca18 <_ZTV6Thread+0x10>
    80002a9c:	00f53023          	sd	a5,0(a0)
	this->body = wrapper;
    80002aa0:	00000797          	auipc	a5,0x0
    80002aa4:	c8478793          	addi	a5,a5,-892 # 80002724 <_ZN6Thread7wrapperEPv>
    80002aa8:	00f53823          	sd	a5,16(a0)
	this->arg = this;
    80002aac:	00a53c23          	sd	a0,24(a0)
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    80002ab0:	00001537          	lui	a0,0x1
    80002ab4:	fffff097          	auipc	ra,0xfffff
    80002ab8:	85c080e7          	jalr	-1956(ra) # 80001310 <_Z9mem_allocm>
    80002abc:	00050313          	mv	t1,a0
	__asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002ac0:	00030713          	mv	a4,t1
	__asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002ac4:	0184b303          	ld	t1,24(s1)
    80002ac8:	00030693          	mv	a3,t1
			body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002acc:	0104b303          	ld	t1,16(s1)
    80002ad0:	00030613          	mv	a2,t1
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002ad4:	00848493          	addi	s1,s1,8
    80002ad8:	00048593          	mv	a1,s1
	__asm__ volatile("li a0, 0x80");
    80002adc:	08000513          	li	a0,128
	__asm__ volatile("ecall");
    80002ae0:	00000073          	ecall
}
    80002ae4:	01813083          	ld	ra,24(sp)
    80002ae8:	01013403          	ld	s0,16(sp)
    80002aec:	00813483          	ld	s1,8(sp)
    80002af0:	02010113          	addi	sp,sp,32
    80002af4:	00008067          	ret

0000000080002af8 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80002af8:	ff010113          	addi	sp,sp,-16
    80002afc:	00113423          	sd	ra,8(sp)
    80002b00:	00813023          	sd	s0,0(sp)
    80002b04:	01010413          	addi	s0,sp,16
    80002b08:	0000a797          	auipc	a5,0xa
    80002b0c:	f3878793          	addi	a5,a5,-200 # 8000ca40 <_ZTV9Semaphore+0x10>
    80002b10:	00f53023          	sd	a5,0(a0) # 1000 <_entry-0x7ffff000>
	sem_open(&myHandle, init);
    80002b14:	00850513          	addi	a0,a0,8
    80002b18:	fffff097          	auipc	ra,0xfffff
    80002b1c:	988080e7          	jalr	-1656(ra) # 800014a0 <_Z8sem_openPP4KSemj>
}
    80002b20:	00813083          	ld	ra,8(sp)
    80002b24:	00013403          	ld	s0,0(sp)
    80002b28:	01010113          	addi	sp,sp,16
    80002b2c:	00008067          	ret

0000000080002b30 <_ZN9Semaphore4waitEv>:

int Semaphore::wait() {
    80002b30:	ff010113          	addi	sp,sp,-16
    80002b34:	00113423          	sd	ra,8(sp)
    80002b38:	00813023          	sd	s0,0(sp)
    80002b3c:	01010413          	addi	s0,sp,16
	return sem_wait(myHandle);
    80002b40:	00853503          	ld	a0,8(a0)
    80002b44:	fffff097          	auipc	ra,0xfffff
    80002b48:	9c4080e7          	jalr	-1596(ra) # 80001508 <_Z8sem_waitP4KSem>
}
    80002b4c:	00813083          	ld	ra,8(sp)
    80002b50:	00013403          	ld	s0,0(sp)
    80002b54:	01010113          	addi	sp,sp,16
    80002b58:	00008067          	ret

0000000080002b5c <_ZN9Semaphore6signalEv>:

int Semaphore::signal() {
    80002b5c:	ff010113          	addi	sp,sp,-16
    80002b60:	00113423          	sd	ra,8(sp)
    80002b64:	00813023          	sd	s0,0(sp)
    80002b68:	01010413          	addi	s0,sp,16
	return sem_signal(myHandle);
    80002b6c:	00853503          	ld	a0,8(a0)
    80002b70:	fffff097          	auipc	ra,0xfffff
    80002b74:	9c8080e7          	jalr	-1592(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    80002b78:	00813083          	ld	ra,8(sp)
    80002b7c:	00013403          	ld	s0,0(sp)
    80002b80:	01010113          	addi	sp,sp,16
    80002b84:	00008067          	ret

0000000080002b88 <_ZN14PeriodicThread9terminateEv>:

void PeriodicThread::terminate() {
    80002b88:	ff010113          	addi	sp,sp,-16
    80002b8c:	00813423          	sd	s0,8(sp)
    80002b90:	01010413          	addi	s0,sp,16

}
    80002b94:	00813403          	ld	s0,8(sp)
    80002b98:	01010113          	addi	sp,sp,16
    80002b9c:	00008067          	ret

0000000080002ba0 <_ZN14PeriodicThreadC1Em>:

PeriodicThread::PeriodicThread(time_t period) {
    80002ba0:	fe010113          	addi	sp,sp,-32
    80002ba4:	00113c23          	sd	ra,24(sp)
    80002ba8:	00813823          	sd	s0,16(sp)
    80002bac:	00913423          	sd	s1,8(sp)
    80002bb0:	02010413          	addi	s0,sp,32
    80002bb4:	00050493          	mv	s1,a0
    80002bb8:	00000097          	auipc	ra,0x0
    80002bbc:	ec4080e7          	jalr	-316(ra) # 80002a7c <_ZN6ThreadC1Ev>
    80002bc0:	0000a797          	auipc	a5,0xa
    80002bc4:	e2878793          	addi	a5,a5,-472 # 8000c9e8 <_ZTV14PeriodicThread+0x10>
    80002bc8:	00f4b023          	sd	a5,0(s1)

}
    80002bcc:	01813083          	ld	ra,24(sp)
    80002bd0:	01013403          	ld	s0,16(sp)
    80002bd4:	00813483          	ld	s1,8(sp)
    80002bd8:	02010113          	addi	sp,sp,32
    80002bdc:	00008067          	ret

0000000080002be0 <_ZN7Console4getcEv>:

char Console::getc() {
    80002be0:	ff010113          	addi	sp,sp,-16
    80002be4:	00813423          	sd	s0,8(sp)
    80002be8:	01010413          	addi	s0,sp,16
	return 0;
}
    80002bec:	00000513          	li	a0,0
    80002bf0:	00813403          	ld	s0,8(sp)
    80002bf4:	01010113          	addi	sp,sp,16
    80002bf8:	00008067          	ret

0000000080002bfc <_ZN7Console4putcEc>:

void Console::putc(char) {
    80002bfc:	ff010113          	addi	sp,sp,-16
    80002c00:	00813423          	sd	s0,8(sp)
    80002c04:	01010413          	addi	s0,sp,16

}
    80002c08:	00813403          	ld	s0,8(sp)
    80002c0c:	01010113          	addi	sp,sp,16
    80002c10:	00008067          	ret

0000000080002c14 <_ZN6Thread3runEv>:
	static int sleep(time_t);

protected:
	Thread();

	virtual void run() {}
    80002c14:	ff010113          	addi	sp,sp,-16
    80002c18:	00813423          	sd	s0,8(sp)
    80002c1c:	01010413          	addi	s0,sp,16
    80002c20:	00813403          	ld	s0,8(sp)
    80002c24:	01010113          	addi	sp,sp,16
    80002c28:	00008067          	ret

0000000080002c2c <_ZN14PeriodicThread18periodicActivationEv>:
	void terminate();

protected:
	PeriodicThread(time_t period);

	virtual void periodicActivation() {}
    80002c2c:	ff010113          	addi	sp,sp,-16
    80002c30:	00813423          	sd	s0,8(sp)
    80002c34:	01010413          	addi	s0,sp,16
    80002c38:	00813403          	ld	s0,8(sp)
    80002c3c:	01010113          	addi	sp,sp,16
    80002c40:	00008067          	ret

0000000080002c44 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80002c44:	ff010113          	addi	sp,sp,-16
    80002c48:	00113423          	sd	ra,8(sp)
    80002c4c:	00813023          	sd	s0,0(sp)
    80002c50:	01010413          	addi	s0,sp,16
    80002c54:	0000a797          	auipc	a5,0xa
    80002c58:	d9478793          	addi	a5,a5,-620 # 8000c9e8 <_ZTV14PeriodicThread+0x10>
    80002c5c:	00f53023          	sd	a5,0(a0)
    80002c60:	00000097          	auipc	ra,0x0
    80002c64:	af8080e7          	jalr	-1288(ra) # 80002758 <_ZN6ThreadD1Ev>
    80002c68:	00813083          	ld	ra,8(sp)
    80002c6c:	00013403          	ld	s0,0(sp)
    80002c70:	01010113          	addi	sp,sp,16
    80002c74:	00008067          	ret

0000000080002c78 <_ZN14PeriodicThreadD0Ev>:
    80002c78:	fe010113          	addi	sp,sp,-32
    80002c7c:	00113c23          	sd	ra,24(sp)
    80002c80:	00813823          	sd	s0,16(sp)
    80002c84:	00913423          	sd	s1,8(sp)
    80002c88:	02010413          	addi	s0,sp,32
    80002c8c:	00050493          	mv	s1,a0
    80002c90:	0000a797          	auipc	a5,0xa
    80002c94:	d5878793          	addi	a5,a5,-680 # 8000c9e8 <_ZTV14PeriodicThread+0x10>
    80002c98:	00f53023          	sd	a5,0(a0)
    80002c9c:	00000097          	auipc	ra,0x0
    80002ca0:	abc080e7          	jalr	-1348(ra) # 80002758 <_ZN6ThreadD1Ev>
    80002ca4:	00048513          	mv	a0,s1
    80002ca8:	00000097          	auipc	ra,0x0
    80002cac:	bac080e7          	jalr	-1108(ra) # 80002854 <_ZdlPv>
    80002cb0:	01813083          	ld	ra,24(sp)
    80002cb4:	01013403          	ld	s0,16(sp)
    80002cb8:	00813483          	ld	s1,8(sp)
    80002cbc:	02010113          	addi	sp,sp,32
    80002cc0:	00008067          	ret

0000000080002cc4 <_ZN3TCB7wrapperEv>:
	Riscv::pushRegisters();
	TCB::dispatch();
	Riscv::popRegisters();
}

void TCB::wrapper() {
    80002cc4:	ff010113          	addi	sp,sp,-16
    80002cc8:	00113423          	sd	ra,8(sp)
    80002ccc:	00813023          	sd	s0,0(sp)
    80002cd0:	01010413          	addi	s0,sp,16
	//pocetak wrappera se izvrsava u supervisor modu,
	//jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch/yield)
	Riscv::popSppSpie();
    80002cd4:	00000097          	auipc	ra,0x0
    80002cd8:	2f8080e7          	jalr	760(ra) # 80002fcc <_ZN5Riscv10popSppSpieEv>
	//na dalje se izvrsavamo u user modu
	running->threadFunction(running->args);
    80002cdc:	0000a797          	auipc	a5,0xa
    80002ce0:	02c7b783          	ld	a5,44(a5) # 8000cd08 <_ZN3TCB7runningE>
    80002ce4:	0107b703          	ld	a4,16(a5)
    80002ce8:	0207b503          	ld	a0,32(a5)
    80002cec:	000700e7          	jalr	a4
	//running->finished = true;
	//i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
	thread_exit();
    80002cf0:	ffffe097          	auipc	ra,0xffffe
    80002cf4:	710080e7          	jalr	1808(ra) # 80001400 <_Z11thread_exitv>
}
    80002cf8:	00813083          	ld	ra,8(sp)
    80002cfc:	00013403          	ld	s0,0(sp)
    80002d00:	01010113          	addi	sp,sp,16
    80002d04:	00008067          	ret

0000000080002d08 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80002d08:	fe010113          	addi	sp,sp,-32
    80002d0c:	00113c23          	sd	ra,24(sp)
    80002d10:	00813823          	sd	s0,16(sp)
    80002d14:	00913423          	sd	s1,8(sp)
    80002d18:	02010413          	addi	s0,sp,32
	TCB* old = TCB::running;
    80002d1c:	0000a497          	auipc	s1,0xa
    80002d20:	fec4b483          	ld	s1,-20(s1) # 8000cd08 <_ZN3TCB7runningE>
	if (!old->finished && !old->blocked && old->timeToSleep == 0 && !old->needToJoin) {
    80002d24:	0304c783          	lbu	a5,48(s1)
    80002d28:	00079e63          	bnez	a5,80002d44 <_ZN3TCB8dispatchEv+0x3c>
    80002d2c:	0314c783          	lbu	a5,49(s1)
    80002d30:	00079a63          	bnez	a5,80002d44 <_ZN3TCB8dispatchEv+0x3c>
    80002d34:	0404b783          	ld	a5,64(s1)
    80002d38:	00079663          	bnez	a5,80002d44 <_ZN3TCB8dispatchEv+0x3c>
    80002d3c:	0324c783          	lbu	a5,50(s1)
    80002d40:	04078a63          	beqz	a5,80002d94 <_ZN3TCB8dispatchEv+0x8c>
	TCB::running = Scheduler::get();
    80002d44:	fffff097          	auipc	ra,0xfffff
    80002d48:	b00080e7          	jalr	-1280(ra) # 80001844 <_ZN9Scheduler3getEv>
    80002d4c:	00050593          	mv	a1,a0
    80002d50:	0000a797          	auipc	a5,0xa
    80002d54:	fb878793          	addi	a5,a5,-72 # 8000cd08 <_ZN3TCB7runningE>
    80002d58:	00a7b023          	sd	a0,0(a5)
	TCB::runningTimeSlice = 0;
    80002d5c:	0007b423          	sd	zero,8(a5)
	if (TCB::running->threadFunction == nullptr) {
    80002d60:	01053783          	ld	a5,16(a0)
    80002d64:	04078063          	beqz	a5,80002da4 <_ZN3TCB8dispatchEv+0x9c>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002d68:	10000793          	li	a5,256
    80002d6c:	1007b073          	csrc	sstatus,a5
	if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    80002d70:	00b48863          	beq	s1,a1,80002d80 <_ZN3TCB8dispatchEv+0x78>
    80002d74:	00048513          	mv	a0,s1
    80002d78:	ffffe097          	auipc	ra,0xffffe
    80002d7c:	498080e7          	jalr	1176(ra) # 80001210 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80002d80:	01813083          	ld	ra,24(sp)
    80002d84:	01013403          	ld	s0,16(sp)
    80002d88:	00813483          	ld	s1,8(sp)
    80002d8c:	02010113          	addi	sp,sp,32
    80002d90:	00008067          	ret
		Scheduler::put(old);
    80002d94:	00048513          	mv	a0,s1
    80002d98:	fffff097          	auipc	ra,0xfffff
    80002d9c:	a68080e7          	jalr	-1432(ra) # 80001800 <_ZN9Scheduler3putEP3TCB>
    80002da0:	fa5ff06f          	j	80002d44 <_ZN3TCB8dispatchEv+0x3c>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80002da4:	10000793          	li	a5,256
    80002da8:	1007a073          	csrs	sstatus,a5
}
    80002dac:	fc5ff06f          	j	80002d70 <_ZN3TCB8dispatchEv+0x68>

0000000080002db0 <_ZN3TCB5yieldEv>:
void TCB::yield() {
    80002db0:	ff010113          	addi	sp,sp,-16
    80002db4:	00113423          	sd	ra,8(sp)
    80002db8:	00813023          	sd	s0,0(sp)
    80002dbc:	01010413          	addi	s0,sp,16
	Riscv::pushRegisters();
    80002dc0:	ffffe097          	auipc	ra,0xffffe
    80002dc4:	240080e7          	jalr	576(ra) # 80001000 <_ZN5Riscv13pushRegistersEv>
	TCB::dispatch();
    80002dc8:	00000097          	auipc	ra,0x0
    80002dcc:	f40080e7          	jalr	-192(ra) # 80002d08 <_ZN3TCB8dispatchEv>
	Riscv::popRegisters();
    80002dd0:	ffffe097          	auipc	ra,0xffffe
    80002dd4:	2ac080e7          	jalr	684(ra) # 8000107c <_ZN5Riscv12popRegistersEv>
}
    80002dd8:	00813083          	ld	ra,8(sp)
    80002ddc:	00013403          	ld	s0,0(sp)
    80002de0:	01010113          	addi	sp,sp,16
    80002de4:	00008067          	ret

0000000080002de8 <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    80002de8:	ff010113          	addi	sp,sp,-16
    80002dec:	00113423          	sd	ra,8(sp)
    80002df0:	00813023          	sd	s0,0(sp)
    80002df4:	01010413          	addi	s0,sp,16
	return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::THREAD);
    80002df8:	00200593          	li	a1,2
    80002dfc:	01850513          	addi	a0,a0,24
    80002e00:	00000097          	auipc	ra,0x0
    80002e04:	1ec080e7          	jalr	492(ra) # 80002fec <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
}
    80002e08:	00813083          	ld	ra,8(sp)
    80002e0c:	00013403          	ld	s0,0(sp)
    80002e10:	01010113          	addi	sp,sp,16
    80002e14:	00008067          	ret

0000000080002e18 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    80002e18:	fd010113          	addi	sp,sp,-48
    80002e1c:	02113423          	sd	ra,40(sp)
    80002e20:	02813023          	sd	s0,32(sp)
    80002e24:	00913c23          	sd	s1,24(sp)
    80002e28:	01213823          	sd	s2,16(sp)
    80002e2c:	01313423          	sd	s3,8(sp)
    80002e30:	03010413          	addi	s0,sp,48
    80002e34:	00050913          	mv	s2,a0
    80002e38:	00058993          	mv	s3,a1
    80002e3c:	00060493          	mv	s1,a2
	TCB* newThread = new TCB(function, args, stack);
    80002e40:	06000513          	li	a0,96
    80002e44:	00000097          	auipc	ra,0x0
    80002e48:	fa4080e7          	jalr	-92(ra) # 80002de8 <_ZN3TCBnwEm>


	TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
													timeSlice(DEFAULT_TIME_SLICE), finished(false), blocked(false),
													needToJoin(false),
													nextInScheduler(nullptr), timeToSleep(0), nextSleeping(nullptr) {
    80002e4c:	01253823          	sd	s2,16(a0)
    80002e50:	00953c23          	sd	s1,24(a0)
    80002e54:	03353023          	sd	s3,32(a0)
    80002e58:	00200793          	li	a5,2
    80002e5c:	02f53423          	sd	a5,40(a0)
    80002e60:	02050823          	sb	zero,48(a0)
    80002e64:	020508a3          	sb	zero,49(a0)
    80002e68:	02050923          	sb	zero,50(a0)
    80002e6c:	02053c23          	sd	zero,56(a0)
    80002e70:	04053023          	sd	zero,64(a0)
    80002e74:	04053423          	sd	zero,72(a0)
	ThreadQueue() : front(nullptr), back(nullptr) {}
    80002e78:	04053823          	sd	zero,80(a0)
    80002e7c:	04053c23          	sd	zero,88(a0)
		//formiranje pocetnog konteksta; specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80002e80:	02090e63          	beqz	s2,80002ebc <_ZN3TCB12createThreadEPFvPvES0_Pm+0xa4>
    80002e84:	00000797          	auipc	a5,0x0
    80002e88:	e4078793          	addi	a5,a5,-448 # 80002cc4 <_ZN3TCB7wrapperEv>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80002e8c:	02048c63          	beqz	s1,80002ec4 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xac>
    80002e90:	00008637          	lui	a2,0x8
    80002e94:	00c484b3          	add	s1,s1,a2
		this->context.ra = startRa;
    80002e98:	00f53023          	sd	a5,0(a0)
		this->context.sp = startSp;
    80002e9c:	00953423          	sd	s1,8(a0)
}
    80002ea0:	02813083          	ld	ra,40(sp)
    80002ea4:	02013403          	ld	s0,32(sp)
    80002ea8:	01813483          	ld	s1,24(sp)
    80002eac:	01013903          	ld	s2,16(sp)
    80002eb0:	00813983          	ld	s3,8(sp)
    80002eb4:	03010113          	addi	sp,sp,48
    80002eb8:	00008067          	ret
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80002ebc:	00000793          	li	a5,0
    80002ec0:	fcdff06f          	j	80002e8c <_ZN3TCB12createThreadEPFvPvES0_Pm+0x74>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80002ec4:	00000493          	li	s1,0
    80002ec8:	fd1ff06f          	j	80002e98 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x80>

0000000080002ecc <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    80002ecc:	ff010113          	addi	sp,sp,-16
    80002ed0:	00113423          	sd	ra,8(sp)
    80002ed4:	00813023          	sd	s0,0(sp)
    80002ed8:	01010413          	addi	s0,sp,16
	MemoryAllocator::kfree(ptr);
    80002edc:	00000097          	auipc	ra,0x0
    80002ee0:	2bc080e7          	jalr	700(ra) # 80003198 <_ZN15MemoryAllocator5kfreeEPv>
}
    80002ee4:	00813083          	ld	ra,8(sp)
    80002ee8:	00013403          	ld	s0,0(sp)
    80002eec:	01010113          	addi	sp,sp,16
    80002ef0:	00008067          	ret

0000000080002ef4 <_ZN3TCB10threadJoinEPS_>:

void TCB::threadJoin(TCB* handle) {
	if(handle->finished) return;
    80002ef4:	03054783          	lbu	a5,48(a0)
    80002ef8:	00078463          	beqz	a5,80002f00 <_ZN3TCB10threadJoinEPS_+0xc>
    80002efc:	00008067          	ret
void TCB::threadJoin(TCB* handle) {
    80002f00:	ff010113          	addi	sp,sp,-16
    80002f04:	00113423          	sd	ra,8(sp)
    80002f08:	00813023          	sd	s0,0(sp)
    80002f0c:	01010413          	addi	s0,sp,16
	TCB::running->needToJoin = true;
    80002f10:	0000a597          	auipc	a1,0xa
    80002f14:	df85b583          	ld	a1,-520(a1) # 8000cd08 <_ZN3TCB7runningE>
    80002f18:	00100793          	li	a5,1
    80002f1c:	02f58923          	sb	a5,50(a1)
	handle->waitingToJoin.putLast(TCB::running);
    80002f20:	05050513          	addi	a0,a0,80
    80002f24:	ffffe097          	auipc	ra,0xffffe
    80002f28:	320080e7          	jalr	800(ra) # 80001244 <_ZN11ThreadQueue7putLastEP3TCB>
}
    80002f2c:	00813083          	ld	ra,8(sp)
    80002f30:	00013403          	ld	s0,0(sp)
    80002f34:	01010113          	addi	sp,sp,16
    80002f38:	00008067          	ret

0000000080002f3c <_ZN3TCB13releaseJoinedEv>:

void TCB::releaseJoined() {
	while(!TCB::running->waitingToJoin.isEmpty()){
    80002f3c:	0000a517          	auipc	a0,0xa
    80002f40:	dcc53503          	ld	a0,-564(a0) # 8000cd08 <_ZN3TCB7runningE>
		return front == nullptr;
    80002f44:	05053783          	ld	a5,80(a0)
    80002f48:	04078663          	beqz	a5,80002f94 <_ZN3TCB13releaseJoinedEv+0x58>
void TCB::releaseJoined() {
    80002f4c:	ff010113          	addi	sp,sp,-16
    80002f50:	00113423          	sd	ra,8(sp)
    80002f54:	00813023          	sd	s0,0(sp)
    80002f58:	01010413          	addi	s0,sp,16
		TCB* tcb = TCB::running->waitingToJoin.getFirst();
    80002f5c:	05050513          	addi	a0,a0,80
    80002f60:	ffffe097          	auipc	ra,0xffffe
    80002f64:	350080e7          	jalr	848(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
		tcb->needToJoin = false;
    80002f68:	02050923          	sb	zero,50(a0)
		Scheduler::put(tcb);
    80002f6c:	fffff097          	auipc	ra,0xfffff
    80002f70:	894080e7          	jalr	-1900(ra) # 80001800 <_ZN9Scheduler3putEP3TCB>
	while(!TCB::running->waitingToJoin.isEmpty()){
    80002f74:	0000a517          	auipc	a0,0xa
    80002f78:	d9453503          	ld	a0,-620(a0) # 8000cd08 <_ZN3TCB7runningE>
    80002f7c:	05053783          	ld	a5,80(a0)
    80002f80:	fc079ee3          	bnez	a5,80002f5c <_ZN3TCB13releaseJoinedEv+0x20>
	}
}
    80002f84:	00813083          	ld	ra,8(sp)
    80002f88:	00013403          	ld	s0,0(sp)
    80002f8c:	01010113          	addi	sp,sp,16
    80002f90:	00008067          	ret
    80002f94:	00008067          	ret

0000000080002f98 <_ZN3TCB5startEPS_>:

void TCB::start(TCB* newTcb) {
	//startovanje niti(stavljanje u Scheduler); main nit je vec aktivna, ne stavlja se u Scheduler
	if (newTcb->threadFunction != nullptr) Scheduler::put(newTcb);
    80002f98:	01053783          	ld	a5,16(a0)
    80002f9c:	02078663          	beqz	a5,80002fc8 <_ZN3TCB5startEPS_+0x30>
void TCB::start(TCB* newTcb) {
    80002fa0:	ff010113          	addi	sp,sp,-16
    80002fa4:	00113423          	sd	ra,8(sp)
    80002fa8:	00813023          	sd	s0,0(sp)
    80002fac:	01010413          	addi	s0,sp,16
	if (newTcb->threadFunction != nullptr) Scheduler::put(newTcb);
    80002fb0:	fffff097          	auipc	ra,0xfffff
    80002fb4:	850080e7          	jalr	-1968(ra) # 80001800 <_ZN9Scheduler3putEP3TCB>
}
    80002fb8:	00813083          	ld	ra,8(sp)
    80002fbc:	00013403          	ld	s0,0(sp)
    80002fc0:	01010113          	addi	sp,sp,16
    80002fc4:	00008067          	ret
    80002fc8:	00008067          	ret

0000000080002fcc <_ZN5Riscv10popSppSpieEv>:
// Created by os on 5/17/23.
//

#include "../h/Riscv.hpp"

void Riscv::popSppSpie() {
    80002fcc:	ff010113          	addi	sp,sp,-16
    80002fd0:	00813423          	sd	s0,8(sp)
    80002fd4:	01010413          	addi	s0,sp,16
	//ra pokazuje iza ove funkcije na nastavak wrappera
	__asm__ volatile("csrw sepc, ra");
    80002fd8:	14109073          	csrw	sepc,ra
	__asm__ volatile("sret");
    80002fdc:	10200073          	sret
    80002fe0:	00813403          	ld	s0,8(sp)
    80002fe4:	01010113          	addi	sp,sp,16
    80002fe8:	00008067          	ret

0000000080002fec <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>:

bool MemoryAllocator::initialized = false;
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

void* MemoryAllocator::kmalloc(size_t size, Purpose pur) {
    80002fec:	ff010113          	addi	sp,sp,-16
    80002ff0:	00813423          	sd	s0,8(sp)
    80002ff4:	01010413          	addi	s0,sp,16
	if (size <= 0) return nullptr;
    80002ff8:	12050863          	beqz	a0,80003128 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x13c>

	//pocetna inicijalizacija
	if (!initialized) {
    80002ffc:	0000a797          	auipc	a5,0xa
    80003000:	d1c7c783          	lbu	a5,-740(a5) # 8000cd18 <_ZN15MemoryAllocator11initializedE>
    80003004:	04079863          	bnez	a5,80003054 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x68>
		freeMemHead = (FreeMemSegment*)HEAP_START_ADDR;
    80003008:	0000a617          	auipc	a2,0xa
    8000300c:	c1863603          	ld	a2,-1000(a2) # 8000cc20 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003010:	00063783          	ld	a5,0(a2)
    80003014:	0000a717          	auipc	a4,0xa
    80003018:	d0470713          	addi	a4,a4,-764 # 8000cd18 <_ZN15MemoryAllocator11initializedE>
    8000301c:	00f73423          	sd	a5,8(a4)
		freeMemHead->next = nullptr;
    80003020:	0007b023          	sd	zero,0(a5)
		freeMemHead->prev = nullptr;
    80003024:	00873683          	ld	a3,8(a4)
    80003028:	0006b423          	sd	zero,8(a3)
		freeMemHead->size = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR - sizeof(FreeMemSegment);
    8000302c:	0000a797          	auipc	a5,0xa
    80003030:	c347b783          	ld	a5,-972(a5) # 8000cc60 <_GLOBAL_OFFSET_TABLE_+0x68>
    80003034:	0007b783          	ld	a5,0(a5)
    80003038:	00063603          	ld	a2,0(a2)
    8000303c:	40c787b3          	sub	a5,a5,a2
    80003040:	fe878793          	addi	a5,a5,-24
    80003044:	00f6b823          	sd	a5,16(a3)
		usedMemHead = nullptr;
    80003048:	00073823          	sd	zero,16(a4)

		initialized = true;
    8000304c:	00100793          	li	a5,1
    80003050:	00f70023          	sb	a5,0(a4)
	}

	//alokacija uvek zaokruzena na blokove
	//size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
	size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80003054:	00655793          	srli	a5,a0,0x6
    80003058:	03f57513          	andi	a0,a0,63
    8000305c:	00050463          	beqz	a0,80003064 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x78>
    80003060:	00100513          	li	a0,1
    80003064:	00a78533          	add	a0,a5,a0
	size = blocks * MEM_BLOCK_SIZE;
    80003068:	00651793          	slli	a5,a0,0x6

	//trazenje slobodnog segmenta po first-fit algoritmu
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    8000306c:	0000a517          	auipc	a0,0xa
    80003070:	cb453503          	ld	a0,-844(a0) # 8000cd20 <_ZN15MemoryAllocator11freeMemHeadE>
    80003074:	08050c63          	beqz	a0,8000310c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x120>
		if (current->size < size) continue;
    80003078:	01053703          	ld	a4,16(a0)
    8000307c:	06f76463          	bltu	a4,a5,800030e4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xf8>

		//pravljenje novog slobodnog fragmenta od ostatka fragmenta
		FreeMemSegment* remainderFree = (FreeMemSegment*)((char*)current + size);
    80003080:	00f506b3          	add	a3,a0,a5
		remainderFree->size = current->size - size;
    80003084:	40f70733          	sub	a4,a4,a5
    80003088:	00e6b823          	sd	a4,16(a3)
		remainderFree->prev = current->prev;
    8000308c:	00853703          	ld	a4,8(a0)
    80003090:	00e6b423          	sd	a4,8(a3)
		if (current->prev) current->prev->next = remainderFree;
    80003094:	00070463          	beqz	a4,8000309c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xb0>
    80003098:	00d73023          	sd	a3,0(a4)
		remainderFree->next = current->next;
    8000309c:	00053703          	ld	a4,0(a0)
    800030a0:	00e6b023          	sd	a4,0(a3)
		if (current->next) current->next->prev = remainderFree;
    800030a4:	00070463          	beqz	a4,800030ac <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xc0>
    800030a8:	00d73423          	sd	a3,8(a4)
		if (freeMemHead == current) freeMemHead = remainderFree;
    800030ac:	0000a717          	auipc	a4,0xa
    800030b0:	c7473703          	ld	a4,-908(a4) # 8000cd20 <_ZN15MemoryAllocator11freeMemHeadE>
    800030b4:	02a70c63          	beq	a4,a0,800030ec <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x100>

		//ubacivanje novog fragmenta u listu zauzetih fragmenata
		UsedMemSegment* newFragment = (UsedMemSegment*)current;
		newFragment->size = size;
    800030b8:	00f53423          	sd	a5,8(a0)
		newFragment->purpose = pur;
    800030bc:	00b52823          	sw	a1,16(a0)
		UsedMemSegment* prevUsed = nullptr;
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    800030c0:	0000a697          	auipc	a3,0xa
    800030c4:	c686b683          	ld	a3,-920(a3) # 8000cd28 <_ZN15MemoryAllocator11usedMemHeadE>
    800030c8:	00068793          	mv	a5,a3
		UsedMemSegment* prevUsed = nullptr;
    800030cc:	00000713          	li	a4,0
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    800030d0:	02078463          	beqz	a5,800030f8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x10c>
    800030d4:	02a7f263          	bgeu	a5,a0,800030f8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x10c>
    800030d8:	00078713          	mv	a4,a5
    800030dc:	0007b783          	ld	a5,0(a5)
    800030e0:	ff1ff06f          	j	800030d0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xe4>
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    800030e4:	00053503          	ld	a0,0(a0)
    800030e8:	f8dff06f          	j	80003074 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x88>
		if (freeMemHead == current) freeMemHead = remainderFree;
    800030ec:	0000a717          	auipc	a4,0xa
    800030f0:	c2d73a23          	sd	a3,-972(a4) # 8000cd20 <_ZN15MemoryAllocator11freeMemHeadE>
    800030f4:	fc5ff06f          	j	800030b8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xcc>
		if (!prevUsed) {
    800030f8:	02070063          	beqz	a4,80003118 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x12c>
			newFragment->next = usedMemHead;
			usedMemHead = newFragment;
		} else {
			newFragment->next = prevUsed->next;
    800030fc:	00073783          	ld	a5,0(a4)
    80003100:	00f53023          	sd	a5,0(a0)
			prevUsed->next = newFragment;
    80003104:	00a73023          	sd	a0,0(a4)
		}
		return (char*)newFragment + sizeof(UsedMemSegment);
    80003108:	01850513          	addi	a0,a0,24
	}
	return nullptr;
}
    8000310c:	00813403          	ld	s0,8(sp)
    80003110:	01010113          	addi	sp,sp,16
    80003114:	00008067          	ret
			newFragment->next = usedMemHead;
    80003118:	00d53023          	sd	a3,0(a0)
			usedMemHead = newFragment;
    8000311c:	0000a797          	auipc	a5,0xa
    80003120:	c0a7b623          	sd	a0,-1012(a5) # 8000cd28 <_ZN15MemoryAllocator11usedMemHeadE>
    80003124:	fe5ff06f          	j	80003108 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x11c>
	if (size <= 0) return nullptr;
    80003128:	00000513          	li	a0,0
    8000312c:	fe1ff06f          	j	8000310c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x120>

0000000080003130 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:
	tryToJoin(newFree);
	tryToJoin(prevFree);
	return 0;
}

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    80003130:	ff010113          	addi	sp,sp,-16
    80003134:	00813423          	sd	s0,8(sp)
    80003138:	01010413          	addi	s0,sp,16
	if (!current) return 0;
    8000313c:	04050663          	beqz	a0,80003188 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x58>
	bool nextExists = current->next != nullptr;
    80003140:	00053783          	ld	a5,0(a0)
	char* nextAddr = (char*)current + current->size;
    80003144:	01053703          	ld	a4,16(a0)
    80003148:	00e506b3          	add	a3,a0,a4
	char* cnext = (char*)current->next;
	bool nextIsConnected = (nextAddr == cnext);
	if (nextExists && nextIsConnected) {
    8000314c:	04078263          	beqz	a5,80003190 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x60>
    80003150:	00d78a63          	beq	a5,a3,80003164 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x34>
		current->size += current->next->size;
		current->next = current->next->next;
		if (current->next) current->next->prev = current;
		return 1;
	} else return 0;
    80003154:	00000513          	li	a0,0
}
    80003158:	00813403          	ld	s0,8(sp)
    8000315c:	01010113          	addi	sp,sp,16
    80003160:	00008067          	ret
		current->size += current->next->size;
    80003164:	0107b683          	ld	a3,16(a5)
    80003168:	00d70733          	add	a4,a4,a3
    8000316c:	00e53823          	sd	a4,16(a0)
		current->next = current->next->next;
    80003170:	0007b783          	ld	a5,0(a5)
    80003174:	00f53023          	sd	a5,0(a0)
		if (current->next) current->next->prev = current;
    80003178:	00078463          	beqz	a5,80003180 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x50>
    8000317c:	00a7b423          	sd	a0,8(a5)
		return 1;
    80003180:	00100513          	li	a0,1
    80003184:	fd5ff06f          	j	80003158 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	if (!current) return 0;
    80003188:	00000513          	li	a0,0
    8000318c:	fcdff06f          	j	80003158 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	} else return 0;
    80003190:	00000513          	li	a0,0
    80003194:	fc5ff06f          	j	80003158 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>

0000000080003198 <_ZN15MemoryAllocator5kfreeEPv>:
	if (!ptr) return 0;
    80003198:	10050463          	beqz	a0,800032a0 <_ZN15MemoryAllocator5kfreeEPv+0x108>
    8000319c:	00050693          	mv	a3,a0
	if (!usedMemHead) return -1;
    800031a0:	0000a797          	auipc	a5,0xa
    800031a4:	b887b783          	ld	a5,-1144(a5) # 8000cd28 <_ZN15MemoryAllocator11usedMemHeadE>
    800031a8:	10078063          	beqz	a5,800032a8 <_ZN15MemoryAllocator5kfreeEPv+0x110>
	ptr = (char*)ptr - sizeof(UsedMemSegment);
    800031ac:	fe850513          	addi	a0,a0,-24
	UsedMemSegment* prevUsed = nullptr;
    800031b0:	00000713          	li	a4,0
	for (; currentUsed && currentUsed != ptr; prevUsed = currentUsed, currentUsed = currentUsed->next);
    800031b4:	00078a63          	beqz	a5,800031c8 <_ZN15MemoryAllocator5kfreeEPv+0x30>
    800031b8:	00a78863          	beq	a5,a0,800031c8 <_ZN15MemoryAllocator5kfreeEPv+0x30>
    800031bc:	00078713          	mv	a4,a5
    800031c0:	0007b783          	ld	a5,0(a5)
    800031c4:	ff1ff06f          	j	800031b4 <_ZN15MemoryAllocator5kfreeEPv+0x1c>
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    800031c8:	0ea79463          	bne	a5,a0,800032b0 <_ZN15MemoryAllocator5kfreeEPv+0x118>
int MemoryAllocator::kfree(void* ptr) {
    800031cc:	fe010113          	addi	sp,sp,-32
    800031d0:	00113c23          	sd	ra,24(sp)
    800031d4:	00813823          	sd	s0,16(sp)
    800031d8:	00913423          	sd	s1,8(sp)
    800031dc:	02010413          	addi	s0,sp,32
	if (prevUsed) prevUsed->next = currentUsed->next;
    800031e0:	02070863          	beqz	a4,80003210 <_ZN15MemoryAllocator5kfreeEPv+0x78>
    800031e4:	0007b783          	ld	a5,0(a5)
    800031e8:	00f73023          	sd	a5,0(a4)
	if (!freeMemHead || ptr < (char*)freeMemHead) {
    800031ec:	0000a797          	auipc	a5,0xa
    800031f0:	b347b783          	ld	a5,-1228(a5) # 8000cd20 <_ZN15MemoryAllocator11freeMemHeadE>
    800031f4:	02078663          	beqz	a5,80003220 <_ZN15MemoryAllocator5kfreeEPv+0x88>
    800031f8:	02f56863          	bltu	a0,a5,80003228 <_ZN15MemoryAllocator5kfreeEPv+0x90>
			 prevFree->next != nullptr && ptr > (char*)(prevFree->next); prevFree = prevFree->next);
    800031fc:	00078493          	mv	s1,a5
    80003200:	0007b783          	ld	a5,0(a5)
    80003204:	02078463          	beqz	a5,8000322c <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80003208:	fea7eae3          	bltu	a5,a0,800031fc <_ZN15MemoryAllocator5kfreeEPv+0x64>
    8000320c:	0200006f          	j	8000322c <_ZN15MemoryAllocator5kfreeEPv+0x94>
	else usedMemHead = currentUsed->next;
    80003210:	0007b783          	ld	a5,0(a5)
    80003214:	0000a717          	auipc	a4,0xa
    80003218:	b0f73a23          	sd	a5,-1260(a4) # 8000cd28 <_ZN15MemoryAllocator11usedMemHeadE>
    8000321c:	fd1ff06f          	j	800031ec <_ZN15MemoryAllocator5kfreeEPv+0x54>
		prevFree = nullptr;
    80003220:	00078493          	mv	s1,a5
    80003224:	0080006f          	j	8000322c <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80003228:	00000493          	li	s1,0
	size_t segmentSize = ((UsedMemSegment*)ptr)->size;
    8000322c:	ff06b783          	ld	a5,-16(a3)
	newFree->size = segmentSize;
    80003230:	fef6bc23          	sd	a5,-8(a3)
	newFree->prev = prevFree;
    80003234:	fe96b823          	sd	s1,-16(a3)
	if (prevFree) newFree->next = prevFree->next;
    80003238:	04048663          	beqz	s1,80003284 <_ZN15MemoryAllocator5kfreeEPv+0xec>
    8000323c:	0004b783          	ld	a5,0(s1)
    80003240:	fef6b423          	sd	a5,-24(a3)
	if (newFree->next) newFree->next->prev = newFree;
    80003244:	fe86b783          	ld	a5,-24(a3)
    80003248:	00078463          	beqz	a5,80003250 <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    8000324c:	00a7b423          	sd	a0,8(a5)
	if (prevFree) prevFree->next = newFree;
    80003250:	04048263          	beqz	s1,80003294 <_ZN15MemoryAllocator5kfreeEPv+0xfc>
    80003254:	00a4b023          	sd	a0,0(s1)
	tryToJoin(newFree);
    80003258:	00000097          	auipc	ra,0x0
    8000325c:	ed8080e7          	jalr	-296(ra) # 80003130 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	tryToJoin(prevFree);
    80003260:	00048513          	mv	a0,s1
    80003264:	00000097          	auipc	ra,0x0
    80003268:	ecc080e7          	jalr	-308(ra) # 80003130 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	return 0;
    8000326c:	00000513          	li	a0,0
}
    80003270:	01813083          	ld	ra,24(sp)
    80003274:	01013403          	ld	s0,16(sp)
    80003278:	00813483          	ld	s1,8(sp)
    8000327c:	02010113          	addi	sp,sp,32
    80003280:	00008067          	ret
	else newFree->next = freeMemHead;
    80003284:	0000a797          	auipc	a5,0xa
    80003288:	a9c7b783          	ld	a5,-1380(a5) # 8000cd20 <_ZN15MemoryAllocator11freeMemHeadE>
    8000328c:	fef6b423          	sd	a5,-24(a3)
    80003290:	fb5ff06f          	j	80003244 <_ZN15MemoryAllocator5kfreeEPv+0xac>
	else freeMemHead = newFree;
    80003294:	0000a797          	auipc	a5,0xa
    80003298:	a8a7b623          	sd	a0,-1396(a5) # 8000cd20 <_ZN15MemoryAllocator11freeMemHeadE>
    8000329c:	fbdff06f          	j	80003258 <_ZN15MemoryAllocator5kfreeEPv+0xc0>
	if (!ptr) return 0;
    800032a0:	00000513          	li	a0,0
    800032a4:	00008067          	ret
	if (!usedMemHead) return -1;
    800032a8:	fff00513          	li	a0,-1
    800032ac:	00008067          	ret
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    800032b0:	fff00513          	li	a0,-1
}
    800032b4:	00008067          	ret

00000000800032b8 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>:

bool MemoryAllocator::checkPurpose(void* ptr, MemoryAllocator::Purpose p) {
    800032b8:	ff010113          	addi	sp,sp,-16
    800032bc:	00813423          	sd	s0,8(sp)
    800032c0:	01010413          	addi	s0,sp,16
	ptr = (char*)ptr - sizeof(UsedMemSegment);
	return ((UsedMemSegment*)ptr)->purpose == p;
    800032c4:	ff852503          	lw	a0,-8(a0)
    800032c8:	40b50533          	sub	a0,a0,a1
}
    800032cc:	00153513          	seqz	a0,a0
    800032d0:	00813403          	ld	s0,8(sp)
    800032d4:	01010113          	addi	sp,sp,16
    800032d8:	00008067          	ret

00000000800032dc <_ZN4KSemnwEm>:

#include "../h/KSem.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void* KSem::operator new(size_t size) {
    800032dc:	ff010113          	addi	sp,sp,-16
    800032e0:	00113423          	sd	ra,8(sp)
    800032e4:	00813023          	sd	s0,0(sp)
    800032e8:	01010413          	addi	s0,sp,16
	return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::SEMAPHORE);
    800032ec:	00100593          	li	a1,1
    800032f0:	01850513          	addi	a0,a0,24
    800032f4:	00000097          	auipc	ra,0x0
    800032f8:	cf8080e7          	jalr	-776(ra) # 80002fec <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
}
    800032fc:	00813083          	ld	ra,8(sp)
    80003300:	00013403          	ld	s0,0(sp)
    80003304:	01010113          	addi	sp,sp,16
    80003308:	00008067          	ret

000000008000330c <_ZN4KSemdlEPv>:

void KSem::operator delete(void* ptr) {
    8000330c:	ff010113          	addi	sp,sp,-16
    80003310:	00113423          	sd	ra,8(sp)
    80003314:	00813023          	sd	s0,0(sp)
    80003318:	01010413          	addi	s0,sp,16
	MemoryAllocator::kfree(ptr);
    8000331c:	00000097          	auipc	ra,0x0
    80003320:	e7c080e7          	jalr	-388(ra) # 80003198 <_ZN15MemoryAllocator5kfreeEPv>
}
    80003324:	00813083          	ld	ra,8(sp)
    80003328:	00013403          	ld	s0,0(sp)
    8000332c:	01010113          	addi	sp,sp,16
    80003330:	00008067          	ret

0000000080003334 <_ZN4KSem7initSemEj>:

KSem* KSem::initSem(uint val) {
    80003334:	fe010113          	addi	sp,sp,-32
    80003338:	00113c23          	sd	ra,24(sp)
    8000333c:	00813823          	sd	s0,16(sp)
    80003340:	00913423          	sd	s1,8(sp)
    80003344:	02010413          	addi	s0,sp,32
    80003348:	00050493          	mv	s1,a0
	return new KSem(val);
    8000334c:	02000513          	li	a0,32
    80003350:	00000097          	auipc	ra,0x0
    80003354:	f8c080e7          	jalr	-116(ra) # 800032dc <_ZN4KSemnwEm>
	void block();

	void unblock();

private:
	KSem(uint val) : val(val), working(true) {}
    80003358:	00952023          	sw	s1,0(a0)
	ThreadQueue() : front(nullptr), back(nullptr) {}
    8000335c:	00053423          	sd	zero,8(a0)
    80003360:	00053823          	sd	zero,16(a0)
    80003364:	00100713          	li	a4,1
    80003368:	00e50c23          	sb	a4,24(a0)
}
    8000336c:	01813083          	ld	ra,24(sp)
    80003370:	01013403          	ld	s0,16(sp)
    80003374:	00813483          	ld	s1,8(sp)
    80003378:	02010113          	addi	sp,sp,32
    8000337c:	00008067          	ret

0000000080003380 <_ZN4KSem5blockEv>:
	if (!working) return -3;
	if (val++ < 0) unblock();
	return 0;
}

void KSem::block() {
    80003380:	ff010113          	addi	sp,sp,-16
    80003384:	00113423          	sd	ra,8(sp)
    80003388:	00813023          	sd	s0,0(sp)
    8000338c:	01010413          	addi	s0,sp,16
	TCB::running->setBlocked(true);
    80003390:	0000a797          	auipc	a5,0xa
    80003394:	8c87b783          	ld	a5,-1848(a5) # 8000cc58 <_GLOBAL_OFFSET_TABLE_+0x60>
    80003398:	0007b583          	ld	a1,0(a5)
	void setBlocked(bool block) { this->blocked = block; }
    8000339c:	00100793          	li	a5,1
    800033a0:	02f588a3          	sb	a5,49(a1)
	blocked.putLast(TCB::running);
    800033a4:	00850513          	addi	a0,a0,8
    800033a8:	ffffe097          	auipc	ra,0xffffe
    800033ac:	e9c080e7          	jalr	-356(ra) # 80001244 <_ZN11ThreadQueue7putLastEP3TCB>
	TCB::yield();
    800033b0:	00000097          	auipc	ra,0x0
    800033b4:	a00080e7          	jalr	-1536(ra) # 80002db0 <_ZN3TCB5yieldEv>
}
    800033b8:	00813083          	ld	ra,8(sp)
    800033bc:	00013403          	ld	s0,0(sp)
    800033c0:	01010113          	addi	sp,sp,16
    800033c4:	00008067          	ret

00000000800033c8 <_ZN4KSem4waitEv>:
int KSem::wait() {
    800033c8:	fe010113          	addi	sp,sp,-32
    800033cc:	00113c23          	sd	ra,24(sp)
    800033d0:	00813823          	sd	s0,16(sp)
    800033d4:	00913423          	sd	s1,8(sp)
    800033d8:	02010413          	addi	s0,sp,32
    800033dc:	00050493          	mv	s1,a0
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    800033e0:	00100593          	li	a1,1
    800033e4:	00000097          	auipc	ra,0x0
    800033e8:	ed4080e7          	jalr	-300(ra) # 800032b8 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>
    800033ec:	04050663          	beqz	a0,80003438 <_ZN4KSem4waitEv+0x70>
	if (!working) return -3;
    800033f0:	0184c783          	lbu	a5,24(s1)
    800033f4:	04078663          	beqz	a5,80003440 <_ZN4KSem4waitEv+0x78>
	if (--val < 0) {
    800033f8:	0004a783          	lw	a5,0(s1)
    800033fc:	fff7879b          	addiw	a5,a5,-1
    80003400:	00f4a023          	sw	a5,0(s1)
    80003404:	02079713          	slli	a4,a5,0x20
    80003408:	00074e63          	bltz	a4,80003424 <_ZN4KSem4waitEv+0x5c>
	return 0;
    8000340c:	00000513          	li	a0,0
}
    80003410:	01813083          	ld	ra,24(sp)
    80003414:	01013403          	ld	s0,16(sp)
    80003418:	00813483          	ld	s1,8(sp)
    8000341c:	02010113          	addi	sp,sp,32
    80003420:	00008067          	ret
		block();
    80003424:	00048513          	mv	a0,s1
    80003428:	00000097          	auipc	ra,0x0
    8000342c:	f58080e7          	jalr	-168(ra) # 80003380 <_ZN4KSem5blockEv>
		return -1;
    80003430:	fff00513          	li	a0,-1
    80003434:	fddff06f          	j	80003410 <_ZN4KSem4waitEv+0x48>
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    80003438:	ffe00513          	li	a0,-2
    8000343c:	fd5ff06f          	j	80003410 <_ZN4KSem4waitEv+0x48>
	if (!working) return -3;
    80003440:	ffd00513          	li	a0,-3
    80003444:	fcdff06f          	j	80003410 <_ZN4KSem4waitEv+0x48>

0000000080003448 <_ZN4KSem7unblockEv>:

void KSem::unblock() {
    80003448:	ff010113          	addi	sp,sp,-16
    8000344c:	00113423          	sd	ra,8(sp)
    80003450:	00813023          	sd	s0,0(sp)
    80003454:	01010413          	addi	s0,sp,16
	TCB* tcb = blocked.getFirst();
    80003458:	00850513          	addi	a0,a0,8
    8000345c:	ffffe097          	auipc	ra,0xffffe
    80003460:	e54080e7          	jalr	-428(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
    80003464:	020508a3          	sb	zero,49(a0)
	tcb->setBlocked(false);
	Scheduler::put(tcb);
    80003468:	ffffe097          	auipc	ra,0xffffe
    8000346c:	398080e7          	jalr	920(ra) # 80001800 <_ZN9Scheduler3putEP3TCB>
}
    80003470:	00813083          	ld	ra,8(sp)
    80003474:	00013403          	ld	s0,0(sp)
    80003478:	01010113          	addi	sp,sp,16
    8000347c:	00008067          	ret

0000000080003480 <_ZN4KSem6signalEv>:
int KSem::signal() {
    80003480:	fe010113          	addi	sp,sp,-32
    80003484:	00113c23          	sd	ra,24(sp)
    80003488:	00813823          	sd	s0,16(sp)
    8000348c:	00913423          	sd	s1,8(sp)
    80003490:	02010413          	addi	s0,sp,32
    80003494:	00050493          	mv	s1,a0
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    80003498:	00100593          	li	a1,1
    8000349c:	00000097          	auipc	ra,0x0
    800034a0:	e1c080e7          	jalr	-484(ra) # 800032b8 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>
    800034a4:	04050463          	beqz	a0,800034ec <_ZN4KSem6signalEv+0x6c>
	if (!working) return -3;
    800034a8:	0184c783          	lbu	a5,24(s1)
    800034ac:	04078463          	beqz	a5,800034f4 <_ZN4KSem6signalEv+0x74>
	if (val++ < 0) unblock();
    800034b0:	0004a783          	lw	a5,0(s1)
    800034b4:	0017871b          	addiw	a4,a5,1
    800034b8:	00e4a023          	sw	a4,0(s1)
    800034bc:	0007ce63          	bltz	a5,800034d8 <_ZN4KSem6signalEv+0x58>
	return 0;
    800034c0:	00000513          	li	a0,0
}
    800034c4:	01813083          	ld	ra,24(sp)
    800034c8:	01013403          	ld	s0,16(sp)
    800034cc:	00813483          	ld	s1,8(sp)
    800034d0:	02010113          	addi	sp,sp,32
    800034d4:	00008067          	ret
	if (val++ < 0) unblock();
    800034d8:	00048513          	mv	a0,s1
    800034dc:	00000097          	auipc	ra,0x0
    800034e0:	f6c080e7          	jalr	-148(ra) # 80003448 <_ZN4KSem7unblockEv>
	return 0;
    800034e4:	00000513          	li	a0,0
    800034e8:	fddff06f          	j	800034c4 <_ZN4KSem6signalEv+0x44>
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    800034ec:	ffe00513          	li	a0,-2
    800034f0:	fd5ff06f          	j	800034c4 <_ZN4KSem6signalEv+0x44>
	if (!working) return -3;
    800034f4:	ffd00513          	li	a0,-3
    800034f8:	fcdff06f          	j	800034c4 <_ZN4KSem6signalEv+0x44>

00000000800034fc <_ZN4KSem8closeSemEPS_>:

int KSem::closeSem(sem_t handle) {
    800034fc:	fe010113          	addi	sp,sp,-32
    80003500:	00113c23          	sd	ra,24(sp)
    80003504:	00813823          	sd	s0,16(sp)
    80003508:	00913423          	sd	s1,8(sp)
    8000350c:	02010413          	addi	s0,sp,32
    80003510:	00050493          	mv	s1,a0
	if (!MemoryAllocator::checkPurpose(handle, MemoryAllocator::SEMAPHORE)) return -2;
    80003514:	00100593          	li	a1,1
    80003518:	00000097          	auipc	ra,0x0
    8000351c:	da0080e7          	jalr	-608(ra) # 800032b8 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>
    80003520:	04050263          	beqz	a0,80003564 <_ZN4KSem8closeSemEPS_+0x68>
	handle->working = false;
    80003524:	00048c23          	sb	zero,24(s1)
    80003528:	01c0006f          	j	80003544 <_ZN4KSem8closeSemEPS_+0x48>
	while (!handle->blocked.isEmpty()) {
		TCB* tcb = handle->blocked.getFirst();
    8000352c:	00848513          	addi	a0,s1,8
    80003530:	ffffe097          	auipc	ra,0xffffe
    80003534:	d80080e7          	jalr	-640(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
    80003538:	020508a3          	sb	zero,49(a0)
		tcb->setBlocked(false);
		Scheduler::put(tcb);
    8000353c:	ffffe097          	auipc	ra,0xffffe
    80003540:	2c4080e7          	jalr	708(ra) # 80001800 <_ZN9Scheduler3putEP3TCB>
		return front == nullptr;
    80003544:	0084b783          	ld	a5,8(s1)
	while (!handle->blocked.isEmpty()) {
    80003548:	fe0792e3          	bnez	a5,8000352c <_ZN4KSem8closeSemEPS_+0x30>
	}
	return 0;
    8000354c:	00000513          	li	a0,0
}
    80003550:	01813083          	ld	ra,24(sp)
    80003554:	01013403          	ld	s0,16(sp)
    80003558:	00813483          	ld	s1,8(sp)
    8000355c:	02010113          	addi	sp,sp,32
    80003560:	00008067          	ret
	if (!MemoryAllocator::checkPurpose(handle, MemoryAllocator::SEMAPHORE)) return -2;
    80003564:	ffe00513          	li	a0,-2
    80003568:	fe9ff06f          	j	80003550 <_ZN4KSem8closeSemEPS_+0x54>

000000008000356c <_Z10testMemoryv>:
//void printInteger(int i){
//	printInt(i);
//}
extern Semaphore* semA;

void testMemory() {
    8000356c:	81010113          	addi	sp,sp,-2032
    80003570:	7e113423          	sd	ra,2024(sp)
    80003574:	7e813023          	sd	s0,2016(sp)
    80003578:	7c913c23          	sd	s1,2008(sp)
    8000357c:	7f010413          	addi	s0,sp,2032
    80003580:	83010113          	addi	sp,sp,-2000
	const uint64 NumAllocations = 500;    //zasto nece za preko 500????
	const uint64 AllocationSize = 16;

	// Allocate and initialize pointers
	int* allocations[NumAllocations];
	for (uint64 i = 0; i < NumAllocations; ++i)
    80003584:	00000713          	li	a4,0
    80003588:	1f300793          	li	a5,499
    8000358c:	02e7e263          	bltu	a5,a4,800035b0 <_Z10testMemoryv+0x44>
		allocations[i] = nullptr;
    80003590:	fffff7b7          	lui	a5,0xfffff
    80003594:	00371693          	slli	a3,a4,0x3
    80003598:	fe040613          	addi	a2,s0,-32
    8000359c:	00f607b3          	add	a5,a2,a5
    800035a0:	00d787b3          	add	a5,a5,a3
    800035a4:	0607b023          	sd	zero,96(a5) # fffffffffffff060 <end+0xffffffff7fff1080>
	for (uint64 i = 0; i < NumAllocations; ++i)
    800035a8:	00170713          	addi	a4,a4,1
    800035ac:	fddff06f          	j	80003588 <_Z10testMemoryv+0x1c>

	// Allocate memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
    800035b0:	00000493          	li	s1,0
    800035b4:	1f300793          	li	a5,499
    800035b8:	0297ec63          	bltu	a5,s1,800035f0 <_Z10testMemoryv+0x84>
		allocations[i] = static_cast<int*>(MemoryAllocator::kmalloc(AllocationSize, MemoryAllocator::MISC));
    800035bc:	00300593          	li	a1,3
    800035c0:	01000513          	li	a0,16
    800035c4:	00000097          	auipc	ra,0x0
    800035c8:	a28080e7          	jalr	-1496(ra) # 80002fec <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
    800035cc:	fffff737          	lui	a4,0xfffff
    800035d0:	00349793          	slli	a5,s1,0x3
    800035d4:	fe040693          	addi	a3,s0,-32
    800035d8:	00e68733          	add	a4,a3,a4
    800035dc:	00f707b3          	add	a5,a4,a5
    800035e0:	06a7b023          	sd	a0,96(a5)
		if (allocations[i] == nullptr) {
    800035e4:	00050663          	beqz	a0,800035f0 <_Z10testMemoryv+0x84>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    800035e8:	00148493          	addi	s1,s1,1
    800035ec:	fc9ff06f          	j	800035b4 <_Z10testMemoryv+0x48>
    800035f0:	00000493          	li	s1,0
    800035f4:	0100006f          	j	80003604 <_Z10testMemoryv+0x98>
	}

	// Free memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
		if (allocations[i] != nullptr) {
			if (MemoryAllocator::kfree(allocations[i]) != 0) {
    800035f8:	00000097          	auipc	ra,0x0
    800035fc:	ba0080e7          	jalr	-1120(ra) # 80003198 <_ZN15MemoryAllocator5kfreeEPv>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80003600:	00148493          	addi	s1,s1,1
    80003604:	1f300793          	li	a5,499
    80003608:	0297e263          	bltu	a5,s1,8000362c <_Z10testMemoryv+0xc0>
		if (allocations[i] != nullptr) {
    8000360c:	fffff737          	lui	a4,0xfffff
    80003610:	00349793          	slli	a5,s1,0x3
    80003614:	fe040693          	addi	a3,s0,-32
    80003618:	00e68733          	add	a4,a3,a4
    8000361c:	00f707b3          	add	a5,a4,a5
    80003620:	0607b503          	ld	a0,96(a5)
    80003624:	fc051ae3          	bnez	a0,800035f8 <_Z10testMemoryv+0x8c>
    80003628:	fd9ff06f          	j	80003600 <_Z10testMemoryv+0x94>
//				printString("\nDeallocation failed for index ");
//				printInteger(i);
			}
		}
	}
}
    8000362c:	7d010113          	addi	sp,sp,2000
    80003630:	7e813083          	ld	ra,2024(sp)
    80003634:	7e013403          	ld	s0,2016(sp)
    80003638:	7d813483          	ld	s1,2008(sp)
    8000363c:	7f010113          	addi	sp,sp,2032
    80003640:	00008067          	ret

0000000080003644 <_Z5nit1fPv>:

void nit1f(void*) {
    80003644:	fe010113          	addi	sp,sp,-32
    80003648:	00113c23          	sd	ra,24(sp)
    8000364c:	00813823          	sd	s0,16(sp)
    80003650:	00913423          	sd	s1,8(sp)
    80003654:	01213023          	sd	s2,0(sp)
    80003658:	02010413          	addi	s0,sp,32
	for(int i=0;i<3;i++){
    8000365c:	00000913          	li	s2,0
    80003660:	0440006f          	j	800036a4 <_Z5nit1fPv+0x60>
		int res = (*semA).wait();
		if(res){
			printString("\nNit 1 cekala na semaforu\n");
		}
		else{
			printString("\nNit 1 nije cekala\n");
    80003664:	00007517          	auipc	a0,0x7
    80003668:	c7c50513          	addi	a0,a0,-900 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    8000366c:	00002097          	auipc	ra,0x2
    80003670:	628080e7          	jalr	1576(ra) # 80005c94 <_Z11printStringPKc>
		}
		printString("\nsem_wait za nit 1 vratio ");
    80003674:	00007517          	auipc	a0,0x7
    80003678:	c8450513          	addi	a0,a0,-892 # 8000a2f8 <CONSOLE_STATUS+0x2e8>
    8000367c:	00002097          	auipc	ra,0x2
    80003680:	618080e7          	jalr	1560(ra) # 80005c94 <_Z11printStringPKc>
		printInteger(res);
    80003684:	00048513          	mv	a0,s1
    80003688:	ffffe097          	auipc	ra,0xffffe
    8000368c:	150080e7          	jalr	336(ra) # 800017d8 <_Z12printIntegerm>
		printString("\n");
    80003690:	00007517          	auipc	a0,0x7
    80003694:	04050513          	addi	a0,a0,64 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    80003698:	00002097          	auipc	ra,0x2
    8000369c:	5fc080e7          	jalr	1532(ra) # 80005c94 <_Z11printStringPKc>
	for(int i=0;i<3;i++){
    800036a0:	0019091b          	addiw	s2,s2,1
    800036a4:	00200793          	li	a5,2
    800036a8:	0527c263          	blt	a5,s2,800036ec <_Z5nit1fPv+0xa8>
		printString("\nNit 1 dolazi na semafor\n");
    800036ac:	00007517          	auipc	a0,0x7
    800036b0:	bf450513          	addi	a0,a0,-1036 # 8000a2a0 <CONSOLE_STATUS+0x290>
    800036b4:	00002097          	auipc	ra,0x2
    800036b8:	5e0080e7          	jalr	1504(ra) # 80005c94 <_Z11printStringPKc>
		int res = (*semA).wait();
    800036bc:	00009797          	auipc	a5,0x9
    800036c0:	54c7b783          	ld	a5,1356(a5) # 8000cc08 <_GLOBAL_OFFSET_TABLE_+0x10>
    800036c4:	0007b503          	ld	a0,0(a5)
    800036c8:	fffff097          	auipc	ra,0xfffff
    800036cc:	468080e7          	jalr	1128(ra) # 80002b30 <_ZN9Semaphore4waitEv>
    800036d0:	00050493          	mv	s1,a0
		if(res){
    800036d4:	f80508e3          	beqz	a0,80003664 <_Z5nit1fPv+0x20>
			printString("\nNit 1 cekala na semaforu\n");
    800036d8:	00007517          	auipc	a0,0x7
    800036dc:	be850513          	addi	a0,a0,-1048 # 8000a2c0 <CONSOLE_STATUS+0x2b0>
    800036e0:	00002097          	auipc	ra,0x2
    800036e4:	5b4080e7          	jalr	1460(ra) # 80005c94 <_Z11printStringPKc>
    800036e8:	f8dff06f          	j	80003674 <_Z5nit1fPv+0x30>
	}

	printString("\nGotova nit 1\n");
    800036ec:	00007517          	auipc	a0,0x7
    800036f0:	c2c50513          	addi	a0,a0,-980 # 8000a318 <CONSOLE_STATUS+0x308>
    800036f4:	00002097          	auipc	ra,0x2
    800036f8:	5a0080e7          	jalr	1440(ra) # 80005c94 <_Z11printStringPKc>
}
    800036fc:	01813083          	ld	ra,24(sp)
    80003700:	01013403          	ld	s0,16(sp)
    80003704:	00813483          	ld	s1,8(sp)
    80003708:	00013903          	ld	s2,0(sp)
    8000370c:	02010113          	addi	sp,sp,32
    80003710:	00008067          	ret

0000000080003714 <_Z5nit2fPv>:

void nit2f(void* arg2) {
    80003714:	fd010113          	addi	sp,sp,-48
    80003718:	02113423          	sd	ra,40(sp)
    8000371c:	02813023          	sd	s0,32(sp)
    80003720:	00913c23          	sd	s1,24(sp)
    80003724:	01213823          	sd	s2,16(sp)
    80003728:	01313423          	sd	s3,8(sp)
    8000372c:	03010413          	addi	s0,sp,48
	for(int i=0;i<3;i++){
    80003730:	00000913          	li	s2,0
    80003734:	0080006f          	j	8000373c <_Z5nit2fPv+0x28>
    80003738:	0019091b          	addiw	s2,s2,1
    8000373c:	00200793          	li	a5,2
    80003740:	0927c063          	blt	a5,s2,800037c0 <_Z5nit2fPv+0xac>
		printString("\nNit 2 daje signal\n");
    80003744:	00007517          	auipc	a0,0x7
    80003748:	be450513          	addi	a0,a0,-1052 # 8000a328 <CONSOLE_STATUS+0x318>
    8000374c:	00002097          	auipc	ra,0x2
    80003750:	548080e7          	jalr	1352(ra) # 80005c94 <_Z11printStringPKc>
		//sem_signal(semA);
		int res = (*semA).signal();
    80003754:	00009997          	auipc	s3,0x9
    80003758:	4b49b983          	ld	s3,1204(s3) # 8000cc08 <_GLOBAL_OFFSET_TABLE_+0x10>
    8000375c:	0009b503          	ld	a0,0(s3)
    80003760:	fffff097          	auipc	ra,0xfffff
    80003764:	3fc080e7          	jalr	1020(ra) # 80002b5c <_ZN9Semaphore6signalEv>
    80003768:	00050493          	mv	s1,a0
		printString("\nPovratna vrednost signala je ");
    8000376c:	00007517          	auipc	a0,0x7
    80003770:	bd450513          	addi	a0,a0,-1068 # 8000a340 <CONSOLE_STATUS+0x330>
    80003774:	00002097          	auipc	ra,0x2
    80003778:	520080e7          	jalr	1312(ra) # 80005c94 <_Z11printStringPKc>
		printInteger(res);
    8000377c:	00048513          	mv	a0,s1
    80003780:	ffffe097          	auipc	ra,0xffffe
    80003784:	058080e7          	jalr	88(ra) # 800017d8 <_Z12printIntegerm>
		printString("\n");
    80003788:	00007517          	auipc	a0,0x7
    8000378c:	f4850513          	addi	a0,a0,-184 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    80003790:	00002097          	auipc	ra,0x2
    80003794:	504080e7          	jalr	1284(ra) # 80005c94 <_Z11printStringPKc>
		//sem_close(semA);
		printString("\nNit 2 ubija semafor\n");
    80003798:	00007517          	auipc	a0,0x7
    8000379c:	bc850513          	addi	a0,a0,-1080 # 8000a360 <CONSOLE_STATUS+0x350>
    800037a0:	00002097          	auipc	ra,0x2
    800037a4:	4f4080e7          	jalr	1268(ra) # 80005c94 <_Z11printStringPKc>
		delete semA;
    800037a8:	0009b503          	ld	a0,0(s3)
    800037ac:	f80506e3          	beqz	a0,80003738 <_Z5nit2fPv+0x24>
    800037b0:	00053783          	ld	a5,0(a0)
    800037b4:	0087b783          	ld	a5,8(a5)
    800037b8:	000780e7          	jalr	a5
    800037bc:	f7dff06f          	j	80003738 <_Z5nit2fPv+0x24>

	}
	printString("\nGotova nit 2\n");
    800037c0:	00007517          	auipc	a0,0x7
    800037c4:	bb850513          	addi	a0,a0,-1096 # 8000a378 <CONSOLE_STATUS+0x368>
    800037c8:	00002097          	auipc	ra,0x2
    800037cc:	4cc080e7          	jalr	1228(ra) # 80005c94 <_Z11printStringPKc>
}
    800037d0:	02813083          	ld	ra,40(sp)
    800037d4:	02013403          	ld	s0,32(sp)
    800037d8:	01813483          	ld	s1,24(sp)
    800037dc:	01013903          	ld	s2,16(sp)
    800037e0:	00813983          	ld	s3,8(sp)
    800037e4:	03010113          	addi	sp,sp,48
    800037e8:	00008067          	ret

00000000800037ec <_Z5nit3fPv>:


void nit3f(void*) {
    800037ec:	ff010113          	addi	sp,sp,-16
    800037f0:	00113423          	sd	ra,8(sp)
    800037f4:	00813023          	sd	s0,0(sp)
    800037f8:	01010413          	addi	s0,sp,16
//		printString("\n");
//		sem_wait(semA);
//		printString("Nit 3 prosla semafor\n");
//		time_sleep(10);
//	}
	printString("\nGotova nit3\n");
    800037fc:	00007517          	auipc	a0,0x7
    80003800:	b8c50513          	addi	a0,a0,-1140 # 8000a388 <CONSOLE_STATUS+0x378>
    80003804:	00002097          	auipc	ra,0x2
    80003808:	490080e7          	jalr	1168(ra) # 80005c94 <_Z11printStringPKc>
    8000380c:	00813083          	ld	ra,8(sp)
    80003810:	00013403          	ld	s0,0(sp)
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
    80003890:	00009717          	auipc	a4,0x9
    80003894:	4af72023          	sw	a5,1184(a4) # 8000cd30 <_ZL9threadEnd>
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
    800038f8:	00009797          	auipc	a5,0x9
    800038fc:	4387a783          	lw	a5,1080(a5) # 8000cd30 <_ZL9threadEnd>
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
    800039a0:	00009797          	auipc	a5,0x9
    800039a4:	3907a783          	lw	a5,912(a5) # 8000cd30 <_ZL9threadEnd>
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
    80003a6c:	00007517          	auipc	a0,0x7
    80003a70:	92c50513          	addi	a0,a0,-1748 # 8000a398 <CONSOLE_STATUS+0x388>
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
    80003aa0:	00007517          	auipc	a0,0x7
    80003aa4:	91850513          	addi	a0,a0,-1768 # 8000a3b8 <CONSOLE_STATUS+0x3a8>
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
    printString("Broj proizvodjaca "); printInt(threadNum);
    80003ad0:	00007517          	auipc	a0,0x7
    80003ad4:	90850513          	addi	a0,a0,-1784 # 8000a3d8 <CONSOLE_STATUS+0x3c8>
    80003ad8:	00002097          	auipc	ra,0x2
    80003adc:	1bc080e7          	jalr	444(ra) # 80005c94 <_Z11printStringPKc>
    80003ae0:	00000613          	li	a2,0
    80003ae4:	00a00593          	li	a1,10
    80003ae8:	00090513          	mv	a0,s2
    80003aec:	00002097          	auipc	ra,0x2
    80003af0:	358080e7          	jalr	856(ra) # 80005e44 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80003af4:	00007517          	auipc	a0,0x7
    80003af8:	8fc50513          	addi	a0,a0,-1796 # 8000a3f0 <CONSOLE_STATUS+0x3e0>
    80003afc:	00002097          	auipc	ra,0x2
    80003b00:	198080e7          	jalr	408(ra) # 80005c94 <_Z11printStringPKc>
    80003b04:	00000613          	li	a2,0
    80003b08:	00a00593          	li	a1,10
    80003b0c:	00048513          	mv	a0,s1
    80003b10:	00002097          	auipc	ra,0x2
    80003b14:	334080e7          	jalr	820(ra) # 80005e44 <_Z8printIntiii>
    printString(".\n");
    80003b18:	00007517          	auipc	a0,0x7
    80003b1c:	8f050513          	addi	a0,a0,-1808 # 8000a408 <CONSOLE_STATUS+0x3f8>
    80003b20:	00002097          	auipc	ra,0x2
    80003b24:	174080e7          	jalr	372(ra) # 80005c94 <_Z11printStringPKc>
    if(threadNum > n) {
    80003b28:	0324c463          	blt	s1,s2,80003b50 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80003b2c:	03205c63          	blez	s2,80003b64 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80003b30:	03800513          	li	a0,56
    80003b34:	fffff097          	auipc	ra,0xfffff
    80003b38:	cd0080e7          	jalr	-816(ra) # 80002804 <_Znwm>
    80003b3c:	00050a13          	mv	s4,a0
    80003b40:	00048593          	mv	a1,s1
    80003b44:	00003097          	auipc	ra,0x3
    80003b48:	080080e7          	jalr	128(ra) # 80006bc4 <_ZN6BufferC1Ei>
    80003b4c:	0300006f          	j	80003b7c <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80003b50:	00007517          	auipc	a0,0x7
    80003b54:	8c050513          	addi	a0,a0,-1856 # 8000a410 <CONSOLE_STATUS+0x400>
    80003b58:	00002097          	auipc	ra,0x2
    80003b5c:	13c080e7          	jalr	316(ra) # 80005c94 <_Z11printStringPKc>
        return;
    80003b60:	0140006f          	j	80003b74 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80003b64:	00007517          	auipc	a0,0x7
    80003b68:	8ec50513          	addi	a0,a0,-1812 # 8000a450 <CONSOLE_STATUS+0x440>
    80003b6c:	00002097          	auipc	ra,0x2
    80003b70:	128080e7          	jalr	296(ra) # 80005c94 <_Z11printStringPKc>
        return;
    80003b74:	000b0113          	mv	sp,s6
    80003b78:	1500006f          	j	80003cc8 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80003b7c:	00000593          	li	a1,0
    80003b80:	00009517          	auipc	a0,0x9
    80003b84:	1b850513          	addi	a0,a0,440 # 8000cd38 <_ZL10waitForAll>
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
    80003bdc:	00009717          	auipc	a4,0x9
    80003be0:	15c73703          	ld	a4,348(a4) # 8000cd38 <_ZL10waitForAll>
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
    80003c48:	00009717          	auipc	a4,0x9
    80003c4c:	0f073703          	ld	a4,240(a4) # 8000cd38 <_ZL10waitForAll>
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
    80003c80:	00009517          	auipc	a0,0x9
    80003c84:	0b853503          	ld	a0,184(a0) # 8000cd38 <_ZL10waitForAll>
    80003c88:	ffffe097          	auipc	ra,0xffffe
    80003c8c:	880080e7          	jalr	-1920(ra) # 80001508 <_Z8sem_waitP4KSem>
    for (int i = 0; i <= threadNum; i++) {
    80003c90:	0014849b          	addiw	s1,s1,1
    80003c94:	fe9ff06f          	j	80003c7c <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80003c98:	00009517          	auipc	a0,0x9
    80003c9c:	0a053503          	ld	a0,160(a0) # 8000cd38 <_ZL10waitForAll>
    80003ca0:	ffffe097          	auipc	ra,0xffffe
    80003ca4:	838080e7          	jalr	-1992(ra) # 800014d8 <_Z9sem_closeP4KSem>
    delete buffer;
    80003ca8:	000a0e63          	beqz	s4,80003cc4 <_Z22producerConsumer_C_APIv+0x284>
    80003cac:	000a0513          	mv	a0,s4
    80003cb0:	00003097          	auipc	ra,0x3
    80003cb4:	154080e7          	jalr	340(ra) # 80006e04 <_ZN6BufferD1Ev>
    80003cb8:	000a0513          	mv	a0,s4
    80003cbc:	fffff097          	auipc	ra,0xfffff
    80003cc0:	b98080e7          	jalr	-1128(ra) # 80002854 <_ZdlPv>
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
    80003cfc:	fffff097          	auipc	ra,0xfffff
    80003d00:	b58080e7          	jalr	-1192(ra) # 80002854 <_ZdlPv>
    80003d04:	00048513          	mv	a0,s1
    80003d08:	0000a097          	auipc	ra,0xa
    80003d0c:	140080e7          	jalr	320(ra) # 8000de48 <_Unwind_Resume>

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
    80003de0:	00006517          	auipc	a0,0x6
    80003de4:	6a050513          	addi	a0,a0,1696 # 8000a480 <CONSOLE_STATUS+0x470>
    80003de8:	00002097          	auipc	ra,0x2
    80003dec:	eac080e7          	jalr	-340(ra) # 80005c94 <_Z11printStringPKc>
    80003df0:	00000613          	li	a2,0
    80003df4:	00a00593          	li	a1,10
    80003df8:	0009051b          	sext.w	a0,s2
    80003dfc:	00002097          	auipc	ra,0x2
    80003e00:	048080e7          	jalr	72(ra) # 80005e44 <_Z8printIntiii>
    80003e04:	00007517          	auipc	a0,0x7
    80003e08:	8cc50513          	addi	a0,a0,-1844 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    80003e0c:	00002097          	auipc	ra,0x2
    80003e10:	e88080e7          	jalr	-376(ra) # 80005c94 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003e14:	00000493          	li	s1,0
    80003e18:	f99ff06f          	j	80003db0 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003e1c:	00006517          	auipc	a0,0x6
    80003e20:	66c50513          	addi	a0,a0,1644 # 8000a488 <CONSOLE_STATUS+0x478>
    80003e24:	00002097          	auipc	ra,0x2
    80003e28:	e70080e7          	jalr	-400(ra) # 80005c94 <_Z11printStringPKc>
    finishedA = true;
    80003e2c:	00100793          	li	a5,1
    80003e30:	00009717          	auipc	a4,0x9
    80003e34:	f0f70823          	sb	a5,-240(a4) # 8000cd40 <_ZL9finishedA>
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
    80003eac:	00006517          	auipc	a0,0x6
    80003eb0:	5ec50513          	addi	a0,a0,1516 # 8000a498 <CONSOLE_STATUS+0x488>
    80003eb4:	00002097          	auipc	ra,0x2
    80003eb8:	de0080e7          	jalr	-544(ra) # 80005c94 <_Z11printStringPKc>
    80003ebc:	00000613          	li	a2,0
    80003ec0:	00a00593          	li	a1,10
    80003ec4:	0009051b          	sext.w	a0,s2
    80003ec8:	00002097          	auipc	ra,0x2
    80003ecc:	f7c080e7          	jalr	-132(ra) # 80005e44 <_Z8printIntiii>
    80003ed0:	00007517          	auipc	a0,0x7
    80003ed4:	80050513          	addi	a0,a0,-2048 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    80003ed8:	00002097          	auipc	ra,0x2
    80003edc:	dbc080e7          	jalr	-580(ra) # 80005c94 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003ee0:	00000493          	li	s1,0
    80003ee4:	f99ff06f          	j	80003e7c <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80003ee8:	00006517          	auipc	a0,0x6
    80003eec:	5b850513          	addi	a0,a0,1464 # 8000a4a0 <CONSOLE_STATUS+0x490>
    80003ef0:	00002097          	auipc	ra,0x2
    80003ef4:	da4080e7          	jalr	-604(ra) # 80005c94 <_Z11printStringPKc>
    finishedB = true;
    80003ef8:	00100793          	li	a5,1
    80003efc:	00009717          	auipc	a4,0x9
    80003f00:	e4f702a3          	sb	a5,-443(a4) # 8000cd41 <_ZL9finishedB>
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
    80003f44:	00006517          	auipc	a0,0x6
    80003f48:	56c50513          	addi	a0,a0,1388 # 8000a4b0 <CONSOLE_STATUS+0x4a0>
    80003f4c:	00002097          	auipc	ra,0x2
    80003f50:	d48080e7          	jalr	-696(ra) # 80005c94 <_Z11printStringPKc>
    80003f54:	00000613          	li	a2,0
    80003f58:	00a00593          	li	a1,10
    80003f5c:	00048513          	mv	a0,s1
    80003f60:	00002097          	auipc	ra,0x2
    80003f64:	ee4080e7          	jalr	-284(ra) # 80005e44 <_Z8printIntiii>
    80003f68:	00006517          	auipc	a0,0x6
    80003f6c:	76850513          	addi	a0,a0,1896 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    80003f70:	00002097          	auipc	ra,0x2
    80003f74:	d24080e7          	jalr	-732(ra) # 80005c94 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80003f78:	0014849b          	addiw	s1,s1,1
    80003f7c:	0ff4f493          	andi	s1,s1,255
    80003f80:	00200793          	li	a5,2
    80003f84:	fc97f0e3          	bgeu	a5,s1,80003f44 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80003f88:	00006517          	auipc	a0,0x6
    80003f8c:	53050513          	addi	a0,a0,1328 # 8000a4b8 <CONSOLE_STATUS+0x4a8>
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
    80003fa8:	00006517          	auipc	a0,0x6
    80003fac:	52050513          	addi	a0,a0,1312 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80003fb0:	00002097          	auipc	ra,0x2
    80003fb4:	ce4080e7          	jalr	-796(ra) # 80005c94 <_Z11printStringPKc>
    80003fb8:	00000613          	li	a2,0
    80003fbc:	00a00593          	li	a1,10
    80003fc0:	0009051b          	sext.w	a0,s2
    80003fc4:	00002097          	auipc	ra,0x2
    80003fc8:	e80080e7          	jalr	-384(ra) # 80005e44 <_Z8printIntiii>
    80003fcc:	00006517          	auipc	a0,0x6
    80003fd0:	70450513          	addi	a0,a0,1796 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    80003fd4:	00002097          	auipc	ra,0x2
    80003fd8:	cc0080e7          	jalr	-832(ra) # 80005c94 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80003fdc:	00c00513          	li	a0,12
    80003fe0:	00000097          	auipc	ra,0x0
    80003fe4:	d30080e7          	jalr	-720(ra) # 80003d10 <_ZL9fibonaccim>
    80003fe8:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80003fec:	00006517          	auipc	a0,0x6
    80003ff0:	4e450513          	addi	a0,a0,1252 # 8000a4d0 <CONSOLE_STATUS+0x4c0>
    80003ff4:	00002097          	auipc	ra,0x2
    80003ff8:	ca0080e7          	jalr	-864(ra) # 80005c94 <_Z11printStringPKc>
    80003ffc:	00000613          	li	a2,0
    80004000:	00a00593          	li	a1,10
    80004004:	0009051b          	sext.w	a0,s2
    80004008:	00002097          	auipc	ra,0x2
    8000400c:	e3c080e7          	jalr	-452(ra) # 80005e44 <_Z8printIntiii>
    80004010:	00006517          	auipc	a0,0x6
    80004014:	6c050513          	addi	a0,a0,1728 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    80004018:	00002097          	auipc	ra,0x2
    8000401c:	c7c080e7          	jalr	-900(ra) # 80005c94 <_Z11printStringPKc>
    80004020:	0400006f          	j	80004060 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80004024:	00006517          	auipc	a0,0x6
    80004028:	48c50513          	addi	a0,a0,1164 # 8000a4b0 <CONSOLE_STATUS+0x4a0>
    8000402c:	00002097          	auipc	ra,0x2
    80004030:	c68080e7          	jalr	-920(ra) # 80005c94 <_Z11printStringPKc>
    80004034:	00000613          	li	a2,0
    80004038:	00a00593          	li	a1,10
    8000403c:	00048513          	mv	a0,s1
    80004040:	00002097          	auipc	ra,0x2
    80004044:	e04080e7          	jalr	-508(ra) # 80005e44 <_Z8printIntiii>
    80004048:	00006517          	auipc	a0,0x6
    8000404c:	68850513          	addi	a0,a0,1672 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    80004050:	00002097          	auipc	ra,0x2
    80004054:	c44080e7          	jalr	-956(ra) # 80005c94 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004058:	0014849b          	addiw	s1,s1,1
    8000405c:	0ff4f493          	andi	s1,s1,255
    80004060:	00500793          	li	a5,5
    80004064:	fc97f0e3          	bgeu	a5,s1,80004024 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    80004068:	00006517          	auipc	a0,0x6
    8000406c:	42050513          	addi	a0,a0,1056 # 8000a488 <CONSOLE_STATUS+0x478>
    80004070:	00002097          	auipc	ra,0x2
    80004074:	c24080e7          	jalr	-988(ra) # 80005c94 <_Z11printStringPKc>
    finishedC = true;
    80004078:	00100793          	li	a5,1
    8000407c:	00009717          	auipc	a4,0x9
    80004080:	ccf70323          	sb	a5,-826(a4) # 8000cd42 <_ZL9finishedC>
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
    800040c4:	00006517          	auipc	a0,0x6
    800040c8:	41c50513          	addi	a0,a0,1052 # 8000a4e0 <CONSOLE_STATUS+0x4d0>
    800040cc:	00002097          	auipc	ra,0x2
    800040d0:	bc8080e7          	jalr	-1080(ra) # 80005c94 <_Z11printStringPKc>
    800040d4:	00000613          	li	a2,0
    800040d8:	00a00593          	li	a1,10
    800040dc:	00048513          	mv	a0,s1
    800040e0:	00002097          	auipc	ra,0x2
    800040e4:	d64080e7          	jalr	-668(ra) # 80005e44 <_Z8printIntiii>
    800040e8:	00006517          	auipc	a0,0x6
    800040ec:	5e850513          	addi	a0,a0,1512 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    800040f0:	00002097          	auipc	ra,0x2
    800040f4:	ba4080e7          	jalr	-1116(ra) # 80005c94 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800040f8:	0014849b          	addiw	s1,s1,1
    800040fc:	0ff4f493          	andi	s1,s1,255
    80004100:	00c00793          	li	a5,12
    80004104:	fc97f0e3          	bgeu	a5,s1,800040c4 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80004108:	00006517          	auipc	a0,0x6
    8000410c:	3e050513          	addi	a0,a0,992 # 8000a4e8 <CONSOLE_STATUS+0x4d8>
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
    80004134:	00006517          	auipc	a0,0x6
    80004138:	3c450513          	addi	a0,a0,964 # 8000a4f8 <CONSOLE_STATUS+0x4e8>
    8000413c:	00002097          	auipc	ra,0x2
    80004140:	b58080e7          	jalr	-1192(ra) # 80005c94 <_Z11printStringPKc>
    80004144:	00000613          	li	a2,0
    80004148:	00a00593          	li	a1,10
    8000414c:	0009051b          	sext.w	a0,s2
    80004150:	00002097          	auipc	ra,0x2
    80004154:	cf4080e7          	jalr	-780(ra) # 80005e44 <_Z8printIntiii>
    80004158:	00006517          	auipc	a0,0x6
    8000415c:	57850513          	addi	a0,a0,1400 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    80004160:	00002097          	auipc	ra,0x2
    80004164:	b34080e7          	jalr	-1228(ra) # 80005c94 <_Z11printStringPKc>
    80004168:	0400006f          	j	800041a8 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000416c:	00006517          	auipc	a0,0x6
    80004170:	37450513          	addi	a0,a0,884 # 8000a4e0 <CONSOLE_STATUS+0x4d0>
    80004174:	00002097          	auipc	ra,0x2
    80004178:	b20080e7          	jalr	-1248(ra) # 80005c94 <_Z11printStringPKc>
    8000417c:	00000613          	li	a2,0
    80004180:	00a00593          	li	a1,10
    80004184:	00048513          	mv	a0,s1
    80004188:	00002097          	auipc	ra,0x2
    8000418c:	cbc080e7          	jalr	-836(ra) # 80005e44 <_Z8printIntiii>
    80004190:	00006517          	auipc	a0,0x6
    80004194:	54050513          	addi	a0,a0,1344 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    80004198:	00002097          	auipc	ra,0x2
    8000419c:	afc080e7          	jalr	-1284(ra) # 80005c94 <_Z11printStringPKc>
    for (; i < 16; i++) {
    800041a0:	0014849b          	addiw	s1,s1,1
    800041a4:	0ff4f493          	andi	s1,s1,255
    800041a8:	00f00793          	li	a5,15
    800041ac:	fc97f0e3          	bgeu	a5,s1,8000416c <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    800041b0:	00006517          	auipc	a0,0x6
    800041b4:	35850513          	addi	a0,a0,856 # 8000a508 <CONSOLE_STATUS+0x4f8>
    800041b8:	00002097          	auipc	ra,0x2
    800041bc:	adc080e7          	jalr	-1316(ra) # 80005c94 <_Z11printStringPKc>
    finishedD = true;
    800041c0:	00100793          	li	a5,1
    800041c4:	00009717          	auipc	a4,0x9
    800041c8:	b6f70fa3          	sb	a5,-1153(a4) # 8000cd43 <_ZL9finishedD>
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
    8000420c:	5fc080e7          	jalr	1532(ra) # 80002804 <_Znwm>
    80004210:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80004214:	fffff097          	auipc	ra,0xfffff
    80004218:	868080e7          	jalr	-1944(ra) # 80002a7c <_ZN6ThreadC1Ev>
    8000421c:	00009797          	auipc	a5,0x9
    80004220:	84478793          	addi	a5,a5,-1980 # 8000ca60 <_ZTV7WorkerA+0x10>
    80004224:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80004228:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    8000422c:	00006517          	auipc	a0,0x6
    80004230:	2ec50513          	addi	a0,a0,748 # 8000a518 <CONSOLE_STATUS+0x508>
    80004234:	00002097          	auipc	ra,0x2
    80004238:	a60080e7          	jalr	-1440(ra) # 80005c94 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    8000423c:	02000513          	li	a0,32
    80004240:	ffffe097          	auipc	ra,0xffffe
    80004244:	5c4080e7          	jalr	1476(ra) # 80002804 <_Znwm>
    80004248:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    8000424c:	fffff097          	auipc	ra,0xfffff
    80004250:	830080e7          	jalr	-2000(ra) # 80002a7c <_ZN6ThreadC1Ev>
    80004254:	00009797          	auipc	a5,0x9
    80004258:	83478793          	addi	a5,a5,-1996 # 8000ca88 <_ZTV7WorkerB+0x10>
    8000425c:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80004260:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80004264:	00006517          	auipc	a0,0x6
    80004268:	2cc50513          	addi	a0,a0,716 # 8000a530 <CONSOLE_STATUS+0x520>
    8000426c:	00002097          	auipc	ra,0x2
    80004270:	a28080e7          	jalr	-1496(ra) # 80005c94 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80004274:	02000513          	li	a0,32
    80004278:	ffffe097          	auipc	ra,0xffffe
    8000427c:	58c080e7          	jalr	1420(ra) # 80002804 <_Znwm>
    80004280:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80004284:	ffffe097          	auipc	ra,0xffffe
    80004288:	7f8080e7          	jalr	2040(ra) # 80002a7c <_ZN6ThreadC1Ev>
    8000428c:	00009797          	auipc	a5,0x9
    80004290:	82478793          	addi	a5,a5,-2012 # 8000cab0 <_ZTV7WorkerC+0x10>
    80004294:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80004298:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    8000429c:	00006517          	auipc	a0,0x6
    800042a0:	2ac50513          	addi	a0,a0,684 # 8000a548 <CONSOLE_STATUS+0x538>
    800042a4:	00002097          	auipc	ra,0x2
    800042a8:	9f0080e7          	jalr	-1552(ra) # 80005c94 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    800042ac:	02000513          	li	a0,32
    800042b0:	ffffe097          	auipc	ra,0xffffe
    800042b4:	554080e7          	jalr	1364(ra) # 80002804 <_Znwm>
    800042b8:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    800042bc:	ffffe097          	auipc	ra,0xffffe
    800042c0:	7c0080e7          	jalr	1984(ra) # 80002a7c <_ZN6ThreadC1Ev>
    800042c4:	00009797          	auipc	a5,0x9
    800042c8:	81478793          	addi	a5,a5,-2028 # 8000cad8 <_ZTV7WorkerD+0x10>
    800042cc:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    800042d0:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    800042d4:	00006517          	auipc	a0,0x6
    800042d8:	28c50513          	addi	a0,a0,652 # 8000a560 <CONSOLE_STATUS+0x550>
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
    80004304:	6b4080e7          	jalr	1716(ra) # 800029b4 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80004308:	0014849b          	addiw	s1,s1,1
    8000430c:	fddff06f          	j	800042e8 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80004310:	ffffe097          	auipc	ra,0xffffe
    80004314:	708080e7          	jalr	1800(ra) # 80002a18 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80004318:	00009797          	auipc	a5,0x9
    8000431c:	a287c783          	lbu	a5,-1496(a5) # 8000cd40 <_ZL9finishedA>
    80004320:	fe0788e3          	beqz	a5,80004310 <_Z20Threads_CPP_API_testv+0x124>
    80004324:	00009797          	auipc	a5,0x9
    80004328:	a1d7c783          	lbu	a5,-1507(a5) # 8000cd41 <_ZL9finishedB>
    8000432c:	fe0782e3          	beqz	a5,80004310 <_Z20Threads_CPP_API_testv+0x124>
    80004330:	00009797          	auipc	a5,0x9
    80004334:	a127c783          	lbu	a5,-1518(a5) # 8000cd42 <_ZL9finishedC>
    80004338:	fc078ce3          	beqz	a5,80004310 <_Z20Threads_CPP_API_testv+0x124>
    8000433c:	00009797          	auipc	a5,0x9
    80004340:	a077c783          	lbu	a5,-1529(a5) # 8000cd43 <_ZL9finishedD>
    80004344:	fc0786e3          	beqz	a5,80004310 <_Z20Threads_CPP_API_testv+0x124>
    80004348:	fc040493          	addi	s1,s0,-64
    8000434c:	0080006f          	j	80004354 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    80004350:	00848493          	addi	s1,s1,8
    80004354:	fe040793          	addi	a5,s0,-32
    80004358:	08f48663          	beq	s1,a5,800043e4 <_Z20Threads_CPP_API_testv+0x1f8>
    8000435c:	0004b503          	ld	a0,0(s1)
    80004360:	fe0508e3          	beqz	a0,80004350 <_Z20Threads_CPP_API_testv+0x164>
    80004364:	00053783          	ld	a5,0(a0)
    80004368:	0087b783          	ld	a5,8(a5)
    8000436c:	000780e7          	jalr	a5
    80004370:	fe1ff06f          	j	80004350 <_Z20Threads_CPP_API_testv+0x164>
    80004374:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80004378:	00048513          	mv	a0,s1
    8000437c:	ffffe097          	auipc	ra,0xffffe
    80004380:	4d8080e7          	jalr	1240(ra) # 80002854 <_ZdlPv>
    80004384:	00090513          	mv	a0,s2
    80004388:	0000a097          	auipc	ra,0xa
    8000438c:	ac0080e7          	jalr	-1344(ra) # 8000de48 <_Unwind_Resume>
    80004390:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80004394:	00048513          	mv	a0,s1
    80004398:	ffffe097          	auipc	ra,0xffffe
    8000439c:	4bc080e7          	jalr	1212(ra) # 80002854 <_ZdlPv>
    800043a0:	00090513          	mv	a0,s2
    800043a4:	0000a097          	auipc	ra,0xa
    800043a8:	aa4080e7          	jalr	-1372(ra) # 8000de48 <_Unwind_Resume>
    800043ac:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    800043b0:	00048513          	mv	a0,s1
    800043b4:	ffffe097          	auipc	ra,0xffffe
    800043b8:	4a0080e7          	jalr	1184(ra) # 80002854 <_ZdlPv>
    800043bc:	00090513          	mv	a0,s2
    800043c0:	0000a097          	auipc	ra,0xa
    800043c4:	a88080e7          	jalr	-1400(ra) # 8000de48 <_Unwind_Resume>
    800043c8:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    800043cc:	00048513          	mv	a0,s1
    800043d0:	ffffe097          	auipc	ra,0xffffe
    800043d4:	484080e7          	jalr	1156(ra) # 80002854 <_ZdlPv>
    800043d8:	00090513          	mv	a0,s2
    800043dc:	0000a097          	auipc	ra,0xa
    800043e0:	a6c080e7          	jalr	-1428(ra) # 8000de48 <_Unwind_Resume>
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
    8000440c:	00008797          	auipc	a5,0x8
    80004410:	65478793          	addi	a5,a5,1620 # 8000ca60 <_ZTV7WorkerA+0x10>
    80004414:	00f53023          	sd	a5,0(a0)
    80004418:	ffffe097          	auipc	ra,0xffffe
    8000441c:	340080e7          	jalr	832(ra) # 80002758 <_ZN6ThreadD1Ev>
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
    80004448:	00008797          	auipc	a5,0x8
    8000444c:	61878793          	addi	a5,a5,1560 # 8000ca60 <_ZTV7WorkerA+0x10>
    80004450:	00f53023          	sd	a5,0(a0)
    80004454:	ffffe097          	auipc	ra,0xffffe
    80004458:	304080e7          	jalr	772(ra) # 80002758 <_ZN6ThreadD1Ev>
    8000445c:	00048513          	mv	a0,s1
    80004460:	ffffe097          	auipc	ra,0xffffe
    80004464:	3f4080e7          	jalr	1012(ra) # 80002854 <_ZdlPv>
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
    8000448c:	00008797          	auipc	a5,0x8
    80004490:	5fc78793          	addi	a5,a5,1532 # 8000ca88 <_ZTV7WorkerB+0x10>
    80004494:	00f53023          	sd	a5,0(a0)
    80004498:	ffffe097          	auipc	ra,0xffffe
    8000449c:	2c0080e7          	jalr	704(ra) # 80002758 <_ZN6ThreadD1Ev>
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
    800044c8:	00008797          	auipc	a5,0x8
    800044cc:	5c078793          	addi	a5,a5,1472 # 8000ca88 <_ZTV7WorkerB+0x10>
    800044d0:	00f53023          	sd	a5,0(a0)
    800044d4:	ffffe097          	auipc	ra,0xffffe
    800044d8:	284080e7          	jalr	644(ra) # 80002758 <_ZN6ThreadD1Ev>
    800044dc:	00048513          	mv	a0,s1
    800044e0:	ffffe097          	auipc	ra,0xffffe
    800044e4:	374080e7          	jalr	884(ra) # 80002854 <_ZdlPv>
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
    8000450c:	00008797          	auipc	a5,0x8
    80004510:	5a478793          	addi	a5,a5,1444 # 8000cab0 <_ZTV7WorkerC+0x10>
    80004514:	00f53023          	sd	a5,0(a0)
    80004518:	ffffe097          	auipc	ra,0xffffe
    8000451c:	240080e7          	jalr	576(ra) # 80002758 <_ZN6ThreadD1Ev>
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
    80004548:	00008797          	auipc	a5,0x8
    8000454c:	56878793          	addi	a5,a5,1384 # 8000cab0 <_ZTV7WorkerC+0x10>
    80004550:	00f53023          	sd	a5,0(a0)
    80004554:	ffffe097          	auipc	ra,0xffffe
    80004558:	204080e7          	jalr	516(ra) # 80002758 <_ZN6ThreadD1Ev>
    8000455c:	00048513          	mv	a0,s1
    80004560:	ffffe097          	auipc	ra,0xffffe
    80004564:	2f4080e7          	jalr	756(ra) # 80002854 <_ZdlPv>
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
    8000458c:	00008797          	auipc	a5,0x8
    80004590:	54c78793          	addi	a5,a5,1356 # 8000cad8 <_ZTV7WorkerD+0x10>
    80004594:	00f53023          	sd	a5,0(a0)
    80004598:	ffffe097          	auipc	ra,0xffffe
    8000459c:	1c0080e7          	jalr	448(ra) # 80002758 <_ZN6ThreadD1Ev>
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
    800045c8:	00008797          	auipc	a5,0x8
    800045cc:	51078793          	addi	a5,a5,1296 # 8000cad8 <_ZTV7WorkerD+0x10>
    800045d0:	00f53023          	sd	a5,0(a0)
    800045d4:	ffffe097          	auipc	ra,0xffffe
    800045d8:	184080e7          	jalr	388(ra) # 80002758 <_ZN6ThreadD1Ev>
    800045dc:	00048513          	mv	a0,s1
    800045e0:	ffffe097          	auipc	ra,0xffffe
    800045e4:	274080e7          	jalr	628(ra) # 80002854 <_ZdlPv>
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
    800046e4:	00006517          	auipc	a0,0x6
    800046e8:	cb450513          	addi	a0,a0,-844 # 8000a398 <CONSOLE_STATUS+0x388>
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
    80004718:	00006517          	auipc	a0,0x6
    8000471c:	ca050513          	addi	a0,a0,-864 # 8000a3b8 <CONSOLE_STATUS+0x3a8>
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
    80004748:	00006517          	auipc	a0,0x6
    8000474c:	c9050513          	addi	a0,a0,-880 # 8000a3d8 <CONSOLE_STATUS+0x3c8>
    80004750:	00001097          	auipc	ra,0x1
    80004754:	544080e7          	jalr	1348(ra) # 80005c94 <_Z11printStringPKc>
    printInt(threadNum);
    80004758:	00000613          	li	a2,0
    8000475c:	00a00593          	li	a1,10
    80004760:	00098513          	mv	a0,s3
    80004764:	00001097          	auipc	ra,0x1
    80004768:	6e0080e7          	jalr	1760(ra) # 80005e44 <_Z8printIntiii>
    printString(" i velicina bafera ");
    8000476c:	00006517          	auipc	a0,0x6
    80004770:	c8450513          	addi	a0,a0,-892 # 8000a3f0 <CONSOLE_STATUS+0x3e0>
    80004774:	00001097          	auipc	ra,0x1
    80004778:	520080e7          	jalr	1312(ra) # 80005c94 <_Z11printStringPKc>
    printInt(n);
    8000477c:	00000613          	li	a2,0
    80004780:	00a00593          	li	a1,10
    80004784:	00048513          	mv	a0,s1
    80004788:	00001097          	auipc	ra,0x1
    8000478c:	6bc080e7          	jalr	1724(ra) # 80005e44 <_Z8printIntiii>
    printString(".\n");
    80004790:	00006517          	auipc	a0,0x6
    80004794:	c7850513          	addi	a0,a0,-904 # 8000a408 <CONSOLE_STATUS+0x3f8>
    80004798:	00001097          	auipc	ra,0x1
    8000479c:	4fc080e7          	jalr	1276(ra) # 80005c94 <_Z11printStringPKc>
    if (threadNum > n) {
    800047a0:	0334c463          	blt	s1,s3,800047c8 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    800047a4:	03305c63          	blez	s3,800047dc <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    800047a8:	03800513          	li	a0,56
    800047ac:	ffffe097          	auipc	ra,0xffffe
    800047b0:	058080e7          	jalr	88(ra) # 80002804 <_Znwm>
    800047b4:	00050a93          	mv	s5,a0
    800047b8:	00048593          	mv	a1,s1
    800047bc:	00001097          	auipc	ra,0x1
    800047c0:	7a8080e7          	jalr	1960(ra) # 80005f64 <_ZN9BufferCPPC1Ei>
    800047c4:	0300006f          	j	800047f4 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800047c8:	00006517          	auipc	a0,0x6
    800047cc:	c4850513          	addi	a0,a0,-952 # 8000a410 <CONSOLE_STATUS+0x400>
    800047d0:	00001097          	auipc	ra,0x1
    800047d4:	4c4080e7          	jalr	1220(ra) # 80005c94 <_Z11printStringPKc>
        return;
    800047d8:	0140006f          	j	800047ec <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800047dc:	00006517          	auipc	a0,0x6
    800047e0:	c7450513          	addi	a0,a0,-908 # 8000a450 <CONSOLE_STATUS+0x440>
    800047e4:	00001097          	auipc	ra,0x1
    800047e8:	4b0080e7          	jalr	1200(ra) # 80005c94 <_Z11printStringPKc>
        return;
    800047ec:	000c0113          	mv	sp,s8
    800047f0:	2140006f          	j	80004a04 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    800047f4:	01000513          	li	a0,16
    800047f8:	ffffe097          	auipc	ra,0xffffe
    800047fc:	00c080e7          	jalr	12(ra) # 80002804 <_Znwm>
    80004800:	00050913          	mv	s2,a0
    80004804:	00000593          	li	a1,0
    80004808:	ffffe097          	auipc	ra,0xffffe
    8000480c:	2f0080e7          	jalr	752(ra) # 80002af8 <_ZN9SemaphoreC1Ej>
    80004810:	00008797          	auipc	a5,0x8
    80004814:	5527b023          	sd	s2,1344(a5) # 8000cd50 <_ZL10waitForAll>
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
    80004870:	f98080e7          	jalr	-104(ra) # 80002804 <_Znwm>
    80004874:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80004878:	ffffe097          	auipc	ra,0xffffe
    8000487c:	204080e7          	jalr	516(ra) # 80002a7c <_ZN6ThreadC1Ev>
    80004880:	00008797          	auipc	a5,0x8
    80004884:	2d078793          	addi	a5,a5,720 # 8000cb50 <_ZTV8Consumer+0x10>
    80004888:	00fbb023          	sd	a5,0(s7)
    8000488c:	029bb023          	sd	s1,32(s7)
    consumer->start();
    80004890:	000b8513          	mv	a0,s7
    80004894:	ffffe097          	auipc	ra,0xffffe
    80004898:	120080e7          	jalr	288(ra) # 800029b4 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    8000489c:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    800048a0:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    800048a4:	00008797          	auipc	a5,0x8
    800048a8:	4ac7b783          	ld	a5,1196(a5) # 8000cd50 <_ZL10waitForAll>
    800048ac:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800048b0:	02800513          	li	a0,40
    800048b4:	ffffe097          	auipc	ra,0xffffe
    800048b8:	f50080e7          	jalr	-176(ra) # 80002804 <_Znwm>
    800048bc:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    800048c0:	ffffe097          	auipc	ra,0xffffe
    800048c4:	1bc080e7          	jalr	444(ra) # 80002a7c <_ZN6ThreadC1Ev>
    800048c8:	00008797          	auipc	a5,0x8
    800048cc:	23878793          	addi	a5,a5,568 # 8000cb00 <_ZTV16ProducerKeyborad+0x10>
    800048d0:	00f4b023          	sd	a5,0(s1)
    800048d4:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800048d8:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    800048dc:	00048513          	mv	a0,s1
    800048e0:	ffffe097          	auipc	ra,0xffffe
    800048e4:	0d4080e7          	jalr	212(ra) # 800029b4 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    800048e8:	00100913          	li	s2,1
    800048ec:	0300006f          	j	8000491c <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    800048f0:	00008797          	auipc	a5,0x8
    800048f4:	23878793          	addi	a5,a5,568 # 8000cb28 <_ZTV8Producer+0x10>
    800048f8:	00fcb023          	sd	a5,0(s9)
    800048fc:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    80004900:	00391793          	slli	a5,s2,0x3
    80004904:	00fa07b3          	add	a5,s4,a5
    80004908:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    8000490c:	000c8513          	mv	a0,s9
    80004910:	ffffe097          	auipc	ra,0xffffe
    80004914:	0a4080e7          	jalr	164(ra) # 800029b4 <_ZN6Thread5startEv>
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
    80004938:	00008797          	auipc	a5,0x8
    8000493c:	4187b783          	ld	a5,1048(a5) # 8000cd50 <_ZL10waitForAll>
    80004940:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80004944:	02800513          	li	a0,40
    80004948:	ffffe097          	auipc	ra,0xffffe
    8000494c:	ebc080e7          	jalr	-324(ra) # 80002804 <_Znwm>
    80004950:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004954:	ffffe097          	auipc	ra,0xffffe
    80004958:	128080e7          	jalr	296(ra) # 80002a7c <_ZN6ThreadC1Ev>
    8000495c:	f95ff06f          	j	800048f0 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    80004960:	ffffe097          	auipc	ra,0xffffe
    80004964:	0b8080e7          	jalr	184(ra) # 80002a18 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80004968:	00000493          	li	s1,0
    8000496c:	0099ce63          	blt	s3,s1,80004988 <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    80004970:	00008517          	auipc	a0,0x8
    80004974:	3e053503          	ld	a0,992(a0) # 8000cd50 <_ZL10waitForAll>
    80004978:	ffffe097          	auipc	ra,0xffffe
    8000497c:	1b8080e7          	jalr	440(ra) # 80002b30 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80004980:	0014849b          	addiw	s1,s1,1
    80004984:	fe9ff06f          	j	8000496c <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    80004988:	00008517          	auipc	a0,0x8
    8000498c:	3c853503          	ld	a0,968(a0) # 8000cd50 <_ZL10waitForAll>
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
    800049fc:	e5c080e7          	jalr	-420(ra) # 80002854 <_ZdlPv>
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
    80004a48:	e10080e7          	jalr	-496(ra) # 80002854 <_ZdlPv>
    80004a4c:	00048513          	mv	a0,s1
    80004a50:	00009097          	auipc	ra,0x9
    80004a54:	3f8080e7          	jalr	1016(ra) # 8000de48 <_Unwind_Resume>
    80004a58:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80004a5c:	00090513          	mv	a0,s2
    80004a60:	ffffe097          	auipc	ra,0xffffe
    80004a64:	df4080e7          	jalr	-524(ra) # 80002854 <_ZdlPv>
    80004a68:	00048513          	mv	a0,s1
    80004a6c:	00009097          	auipc	ra,0x9
    80004a70:	3dc080e7          	jalr	988(ra) # 8000de48 <_Unwind_Resume>
    80004a74:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004a78:	000b8513          	mv	a0,s7
    80004a7c:	ffffe097          	auipc	ra,0xffffe
    80004a80:	dd8080e7          	jalr	-552(ra) # 80002854 <_ZdlPv>
    80004a84:	00048513          	mv	a0,s1
    80004a88:	00009097          	auipc	ra,0x9
    80004a8c:	3c0080e7          	jalr	960(ra) # 8000de48 <_Unwind_Resume>
    80004a90:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004a94:	00048513          	mv	a0,s1
    80004a98:	ffffe097          	auipc	ra,0xffffe
    80004a9c:	dbc080e7          	jalr	-580(ra) # 80002854 <_ZdlPv>
    80004aa0:	00090513          	mv	a0,s2
    80004aa4:	00009097          	auipc	ra,0x9
    80004aa8:	3a4080e7          	jalr	932(ra) # 8000de48 <_Unwind_Resume>
    80004aac:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    80004ab0:	000c8513          	mv	a0,s9
    80004ab4:	ffffe097          	auipc	ra,0xffffe
    80004ab8:	da0080e7          	jalr	-608(ra) # 80002854 <_ZdlPv>
    80004abc:	00048513          	mv	a0,s1
    80004ac0:	00009097          	auipc	ra,0x9
    80004ac4:	388080e7          	jalr	904(ra) # 8000de48 <_Unwind_Resume>

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
    80004af8:	108080e7          	jalr	264(ra) # 80002bfc <_ZN7Console4putcEc>
        while (!threadEnd) {
    80004afc:	00008797          	auipc	a5,0x8
    80004b00:	24c7a783          	lw	a5,588(a5) # 8000cd48 <_ZL9threadEnd>
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
    80004b28:	0d8080e7          	jalr	216(ra) # 80002bfc <_ZN7Console4putcEc>
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
    80004b54:	0ac080e7          	jalr	172(ra) # 80002bfc <_ZN7Console4putcEc>
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
    80004b78:	fe8080e7          	jalr	-24(ra) # 80002b5c <_ZN9Semaphore6signalEv>
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
    80004ba8:	00008797          	auipc	a5,0x8
    80004bac:	fa878793          	addi	a5,a5,-88 # 8000cb50 <_ZTV8Consumer+0x10>
    80004bb0:	00f53023          	sd	a5,0(a0)
    80004bb4:	ffffe097          	auipc	ra,0xffffe
    80004bb8:	ba4080e7          	jalr	-1116(ra) # 80002758 <_ZN6ThreadD1Ev>
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
    80004be4:	00008797          	auipc	a5,0x8
    80004be8:	f6c78793          	addi	a5,a5,-148 # 8000cb50 <_ZTV8Consumer+0x10>
    80004bec:	00f53023          	sd	a5,0(a0)
    80004bf0:	ffffe097          	auipc	ra,0xffffe
    80004bf4:	b68080e7          	jalr	-1176(ra) # 80002758 <_ZN6ThreadD1Ev>
    80004bf8:	00048513          	mv	a0,s1
    80004bfc:	ffffe097          	auipc	ra,0xffffe
    80004c00:	c58080e7          	jalr	-936(ra) # 80002854 <_ZdlPv>
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
    80004c28:	00008797          	auipc	a5,0x8
    80004c2c:	ed878793          	addi	a5,a5,-296 # 8000cb00 <_ZTV16ProducerKeyborad+0x10>
    80004c30:	00f53023          	sd	a5,0(a0)
    80004c34:	ffffe097          	auipc	ra,0xffffe
    80004c38:	b24080e7          	jalr	-1244(ra) # 80002758 <_ZN6ThreadD1Ev>
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
    80004c64:	00008797          	auipc	a5,0x8
    80004c68:	e9c78793          	addi	a5,a5,-356 # 8000cb00 <_ZTV16ProducerKeyborad+0x10>
    80004c6c:	00f53023          	sd	a5,0(a0)
    80004c70:	ffffe097          	auipc	ra,0xffffe
    80004c74:	ae8080e7          	jalr	-1304(ra) # 80002758 <_ZN6ThreadD1Ev>
    80004c78:	00048513          	mv	a0,s1
    80004c7c:	ffffe097          	auipc	ra,0xffffe
    80004c80:	bd8080e7          	jalr	-1064(ra) # 80002854 <_ZdlPv>
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
    80004ca8:	00008797          	auipc	a5,0x8
    80004cac:	e8078793          	addi	a5,a5,-384 # 8000cb28 <_ZTV8Producer+0x10>
    80004cb0:	00f53023          	sd	a5,0(a0)
    80004cb4:	ffffe097          	auipc	ra,0xffffe
    80004cb8:	aa4080e7          	jalr	-1372(ra) # 80002758 <_ZN6ThreadD1Ev>
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
    80004ce4:	00008797          	auipc	a5,0x8
    80004ce8:	e4478793          	addi	a5,a5,-444 # 8000cb28 <_ZTV8Producer+0x10>
    80004cec:	00f53023          	sd	a5,0(a0)
    80004cf0:	ffffe097          	auipc	ra,0xffffe
    80004cf4:	a68080e7          	jalr	-1432(ra) # 80002758 <_ZN6ThreadD1Ev>
    80004cf8:	00048513          	mv	a0,s1
    80004cfc:	ffffe097          	auipc	ra,0xffffe
    80004d00:	b58080e7          	jalr	-1192(ra) # 80002854 <_ZdlPv>
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
    80004d5c:	00008717          	auipc	a4,0x8
    80004d60:	fef72623          	sw	a5,-20(a4) # 8000cd48 <_ZL9threadEnd>
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
    80004d84:	ddc080e7          	jalr	-548(ra) # 80002b5c <_ZN9Semaphore6signalEv>
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
    80004dbc:	00008797          	auipc	a5,0x8
    80004dc0:	f8c7a783          	lw	a5,-116(a5) # 8000cd48 <_ZL9threadEnd>
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
    80004e00:	c44080e7          	jalr	-956(ra) # 80002a40 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80004e04:	fb9ff06f          	j	80004dbc <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80004e08:	0204b783          	ld	a5,32(s1)
    80004e0c:	0107b503          	ld	a0,16(a5)
    80004e10:	ffffe097          	auipc	ra,0xffffe
    80004e14:	d4c080e7          	jalr	-692(ra) # 80002b5c <_ZN9Semaphore6signalEv>
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
    printString("A finished!\n");
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
    80004ec4:	00005517          	auipc	a0,0x5
    80004ec8:	61c50513          	addi	a0,a0,1564 # 8000a4e0 <CONSOLE_STATUS+0x4d0>
    80004ecc:	00001097          	auipc	ra,0x1
    80004ed0:	dc8080e7          	jalr	-568(ra) # 80005c94 <_Z11printStringPKc>
    80004ed4:	00000613          	li	a2,0
    80004ed8:	00a00593          	li	a1,10
    80004edc:	00048513          	mv	a0,s1
    80004ee0:	00001097          	auipc	ra,0x1
    80004ee4:	f64080e7          	jalr	-156(ra) # 80005e44 <_Z8printIntiii>
    80004ee8:	00005517          	auipc	a0,0x5
    80004eec:	7e850513          	addi	a0,a0,2024 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    80004ef0:	00001097          	auipc	ra,0x1
    80004ef4:	da4080e7          	jalr	-604(ra) # 80005c94 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004ef8:	0014849b          	addiw	s1,s1,1
    80004efc:	0ff4f493          	andi	s1,s1,255
    80004f00:	00c00793          	li	a5,12
    80004f04:	fc97f0e3          	bgeu	a5,s1,80004ec4 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80004f08:	00005517          	auipc	a0,0x5
    80004f0c:	5e050513          	addi	a0,a0,1504 # 8000a4e8 <CONSOLE_STATUS+0x4d8>
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
    80004f34:	00005517          	auipc	a0,0x5
    80004f38:	5c450513          	addi	a0,a0,1476 # 8000a4f8 <CONSOLE_STATUS+0x4e8>
    80004f3c:	00001097          	auipc	ra,0x1
    80004f40:	d58080e7          	jalr	-680(ra) # 80005c94 <_Z11printStringPKc>
    80004f44:	00000613          	li	a2,0
    80004f48:	00a00593          	li	a1,10
    80004f4c:	0009051b          	sext.w	a0,s2
    80004f50:	00001097          	auipc	ra,0x1
    80004f54:	ef4080e7          	jalr	-268(ra) # 80005e44 <_Z8printIntiii>
    80004f58:	00005517          	auipc	a0,0x5
    80004f5c:	77850513          	addi	a0,a0,1912 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    80004f60:	00001097          	auipc	ra,0x1
    80004f64:	d34080e7          	jalr	-716(ra) # 80005c94 <_Z11printStringPKc>
    80004f68:	0400006f          	j	80004fa8 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004f6c:	00005517          	auipc	a0,0x5
    80004f70:	57450513          	addi	a0,a0,1396 # 8000a4e0 <CONSOLE_STATUS+0x4d0>
    80004f74:	00001097          	auipc	ra,0x1
    80004f78:	d20080e7          	jalr	-736(ra) # 80005c94 <_Z11printStringPKc>
    80004f7c:	00000613          	li	a2,0
    80004f80:	00a00593          	li	a1,10
    80004f84:	00048513          	mv	a0,s1
    80004f88:	00001097          	auipc	ra,0x1
    80004f8c:	ebc080e7          	jalr	-324(ra) # 80005e44 <_Z8printIntiii>
    80004f90:	00005517          	auipc	a0,0x5
    80004f94:	74050513          	addi	a0,a0,1856 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    80004f98:	00001097          	auipc	ra,0x1
    80004f9c:	cfc080e7          	jalr	-772(ra) # 80005c94 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004fa0:	0014849b          	addiw	s1,s1,1
    80004fa4:	0ff4f493          	andi	s1,s1,255
    80004fa8:	00f00793          	li	a5,15
    80004fac:	fc97f0e3          	bgeu	a5,s1,80004f6c <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80004fb0:	00005517          	auipc	a0,0x5
    80004fb4:	55850513          	addi	a0,a0,1368 # 8000a508 <CONSOLE_STATUS+0x4f8>
    80004fb8:	00001097          	auipc	ra,0x1
    80004fbc:	cdc080e7          	jalr	-804(ra) # 80005c94 <_Z11printStringPKc>
    finishedD = true;
    80004fc0:	00100793          	li	a5,1
    80004fc4:	00008717          	auipc	a4,0x8
    80004fc8:	d8f70a23          	sb	a5,-620(a4) # 8000cd58 <_ZL9finishedD>
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
    8000500c:	00005517          	auipc	a0,0x5
    80005010:	4a450513          	addi	a0,a0,1188 # 8000a4b0 <CONSOLE_STATUS+0x4a0>
    80005014:	00001097          	auipc	ra,0x1
    80005018:	c80080e7          	jalr	-896(ra) # 80005c94 <_Z11printStringPKc>
    8000501c:	00000613          	li	a2,0
    80005020:	00a00593          	li	a1,10
    80005024:	00048513          	mv	a0,s1
    80005028:	00001097          	auipc	ra,0x1
    8000502c:	e1c080e7          	jalr	-484(ra) # 80005e44 <_Z8printIntiii>
    80005030:	00005517          	auipc	a0,0x5
    80005034:	6a050513          	addi	a0,a0,1696 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    80005038:	00001097          	auipc	ra,0x1
    8000503c:	c5c080e7          	jalr	-932(ra) # 80005c94 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80005040:	0014849b          	addiw	s1,s1,1
    80005044:	0ff4f493          	andi	s1,s1,255
    80005048:	00200793          	li	a5,2
    8000504c:	fc97f0e3          	bgeu	a5,s1,8000500c <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80005050:	00005517          	auipc	a0,0x5
    80005054:	46850513          	addi	a0,a0,1128 # 8000a4b8 <CONSOLE_STATUS+0x4a8>
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
    80005070:	00005517          	auipc	a0,0x5
    80005074:	45850513          	addi	a0,a0,1112 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80005078:	00001097          	auipc	ra,0x1
    8000507c:	c1c080e7          	jalr	-996(ra) # 80005c94 <_Z11printStringPKc>
    80005080:	00000613          	li	a2,0
    80005084:	00a00593          	li	a1,10
    80005088:	0009051b          	sext.w	a0,s2
    8000508c:	00001097          	auipc	ra,0x1
    80005090:	db8080e7          	jalr	-584(ra) # 80005e44 <_Z8printIntiii>
    80005094:	00005517          	auipc	a0,0x5
    80005098:	63c50513          	addi	a0,a0,1596 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    8000509c:	00001097          	auipc	ra,0x1
    800050a0:	bf8080e7          	jalr	-1032(ra) # 80005c94 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    800050a4:	00c00513          	li	a0,12
    800050a8:	00000097          	auipc	ra,0x0
    800050ac:	d88080e7          	jalr	-632(ra) # 80004e30 <_ZL9fibonaccim>
    800050b0:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800050b4:	00005517          	auipc	a0,0x5
    800050b8:	41c50513          	addi	a0,a0,1052 # 8000a4d0 <CONSOLE_STATUS+0x4c0>
    800050bc:	00001097          	auipc	ra,0x1
    800050c0:	bd8080e7          	jalr	-1064(ra) # 80005c94 <_Z11printStringPKc>
    800050c4:	00000613          	li	a2,0
    800050c8:	00a00593          	li	a1,10
    800050cc:	0009051b          	sext.w	a0,s2
    800050d0:	00001097          	auipc	ra,0x1
    800050d4:	d74080e7          	jalr	-652(ra) # 80005e44 <_Z8printIntiii>
    800050d8:	00005517          	auipc	a0,0x5
    800050dc:	5f850513          	addi	a0,a0,1528 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    800050e0:	00001097          	auipc	ra,0x1
    800050e4:	bb4080e7          	jalr	-1100(ra) # 80005c94 <_Z11printStringPKc>
    800050e8:	0400006f          	j	80005128 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800050ec:	00005517          	auipc	a0,0x5
    800050f0:	3c450513          	addi	a0,a0,964 # 8000a4b0 <CONSOLE_STATUS+0x4a0>
    800050f4:	00001097          	auipc	ra,0x1
    800050f8:	ba0080e7          	jalr	-1120(ra) # 80005c94 <_Z11printStringPKc>
    800050fc:	00000613          	li	a2,0
    80005100:	00a00593          	li	a1,10
    80005104:	00048513          	mv	a0,s1
    80005108:	00001097          	auipc	ra,0x1
    8000510c:	d3c080e7          	jalr	-708(ra) # 80005e44 <_Z8printIntiii>
    80005110:	00005517          	auipc	a0,0x5
    80005114:	5c050513          	addi	a0,a0,1472 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    80005118:	00001097          	auipc	ra,0x1
    8000511c:	b7c080e7          	jalr	-1156(ra) # 80005c94 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80005120:	0014849b          	addiw	s1,s1,1
    80005124:	0ff4f493          	andi	s1,s1,255
    80005128:	00500793          	li	a5,5
    8000512c:	fc97f0e3          	bgeu	a5,s1,800050ec <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80005130:	00005517          	auipc	a0,0x5
    80005134:	35850513          	addi	a0,a0,856 # 8000a488 <CONSOLE_STATUS+0x478>
    80005138:	00001097          	auipc	ra,0x1
    8000513c:	b5c080e7          	jalr	-1188(ra) # 80005c94 <_Z11printStringPKc>
    finishedC = true;
    80005140:	00100793          	li	a5,1
    80005144:	00008717          	auipc	a4,0x8
    80005148:	c0f70aa3          	sb	a5,-1003(a4) # 8000cd59 <_ZL9finishedC>
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
    800051c8:	00005517          	auipc	a0,0x5
    800051cc:	2d050513          	addi	a0,a0,720 # 8000a498 <CONSOLE_STATUS+0x488>
    800051d0:	00001097          	auipc	ra,0x1
    800051d4:	ac4080e7          	jalr	-1340(ra) # 80005c94 <_Z11printStringPKc>
    800051d8:	00000613          	li	a2,0
    800051dc:	00a00593          	li	a1,10
    800051e0:	0009051b          	sext.w	a0,s2
    800051e4:	00001097          	auipc	ra,0x1
    800051e8:	c60080e7          	jalr	-928(ra) # 80005e44 <_Z8printIntiii>
    800051ec:	00005517          	auipc	a0,0x5
    800051f0:	4e450513          	addi	a0,a0,1252 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    800051f4:	00001097          	auipc	ra,0x1
    800051f8:	aa0080e7          	jalr	-1376(ra) # 80005c94 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800051fc:	00000493          	li	s1,0
    80005200:	f99ff06f          	j	80005198 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80005204:	00005517          	auipc	a0,0x5
    80005208:	29c50513          	addi	a0,a0,668 # 8000a4a0 <CONSOLE_STATUS+0x490>
    8000520c:	00001097          	auipc	ra,0x1
    80005210:	a88080e7          	jalr	-1400(ra) # 80005c94 <_Z11printStringPKc>
    finishedB = true;
    80005214:	00100793          	li	a5,1
    80005218:	00008717          	auipc	a4,0x8
    8000521c:	b4f70123          	sb	a5,-1214(a4) # 8000cd5a <_ZL9finishedB>
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
    8000529c:	00005517          	auipc	a0,0x5
    800052a0:	1e450513          	addi	a0,a0,484 # 8000a480 <CONSOLE_STATUS+0x470>
    800052a4:	00001097          	auipc	ra,0x1
    800052a8:	9f0080e7          	jalr	-1552(ra) # 80005c94 <_Z11printStringPKc>
    800052ac:	00000613          	li	a2,0
    800052b0:	00a00593          	li	a1,10
    800052b4:	0009051b          	sext.w	a0,s2
    800052b8:	00001097          	auipc	ra,0x1
    800052bc:	b8c080e7          	jalr	-1140(ra) # 80005e44 <_Z8printIntiii>
    800052c0:	00005517          	auipc	a0,0x5
    800052c4:	41050513          	addi	a0,a0,1040 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    800052c8:	00001097          	auipc	ra,0x1
    800052cc:	9cc080e7          	jalr	-1588(ra) # 80005c94 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800052d0:	00000493          	li	s1,0
    800052d4:	f99ff06f          	j	8000526c <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    800052d8:	00005517          	auipc	a0,0x5
    800052dc:	1b050513          	addi	a0,a0,432 # 8000a488 <CONSOLE_STATUS+0x478>
    800052e0:	00001097          	auipc	ra,0x1
    800052e4:	9b4080e7          	jalr	-1612(ra) # 80005c94 <_Z11printStringPKc>
    finishedA = true;
    800052e8:	00100793          	li	a5,1
    800052ec:	00008717          	auipc	a4,0x8
    800052f0:	a6f707a3          	sb	a5,-1425(a4) # 8000cd5b <_ZL9finishedA>
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
    80005334:	00005517          	auipc	a0,0x5
    80005338:	1e450513          	addi	a0,a0,484 # 8000a518 <CONSOLE_STATUS+0x508>
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
    8000535c:	00005517          	auipc	a0,0x5
    80005360:	1d450513          	addi	a0,a0,468 # 8000a530 <CONSOLE_STATUS+0x520>
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
    80005384:	00005517          	auipc	a0,0x5
    80005388:	1c450513          	addi	a0,a0,452 # 8000a548 <CONSOLE_STATUS+0x538>
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
    800053ac:	00005517          	auipc	a0,0x5
    800053b0:	1b450513          	addi	a0,a0,436 # 8000a560 <CONSOLE_STATUS+0x550>
    800053b4:	00001097          	auipc	ra,0x1
    800053b8:	8e0080e7          	jalr	-1824(ra) # 80005c94 <_Z11printStringPKc>
    800053bc:	00c0006f          	j	800053c8 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    800053c0:	ffffc097          	auipc	ra,0xffffc
    800053c4:	068080e7          	jalr	104(ra) # 80001428 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800053c8:	00008797          	auipc	a5,0x8
    800053cc:	9937c783          	lbu	a5,-1645(a5) # 8000cd5b <_ZL9finishedA>
    800053d0:	fe0788e3          	beqz	a5,800053c0 <_Z18Threads_C_API_testv+0xb4>
    800053d4:	00008797          	auipc	a5,0x8
    800053d8:	9867c783          	lbu	a5,-1658(a5) # 8000cd5a <_ZL9finishedB>
    800053dc:	fe0782e3          	beqz	a5,800053c0 <_Z18Threads_C_API_testv+0xb4>
    800053e0:	00008797          	auipc	a5,0x8
    800053e4:	9797c783          	lbu	a5,-1671(a5) # 8000cd59 <_ZL9finishedC>
    800053e8:	fc078ce3          	beqz	a5,800053c0 <_Z18Threads_C_API_testv+0xb4>
    800053ec:	00008797          	auipc	a5,0x8
    800053f0:	96c7c783          	lbu	a5,-1684(a5) # 8000cd58 <_ZL9finishedD>
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
    80005438:	5e4080e7          	jalr	1508(ra) # 80002a18 <_ZN6Thread8dispatchEv>
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
    80005484:	00008717          	auipc	a4,0x8
    80005488:	8cf72e23          	sw	a5,-1828(a4) # 8000cd60 <_ZL9threadEnd>
    td->buffer->put('!');
    8000548c:	0209b783          	ld	a5,32(s3)
    80005490:	02100593          	li	a1,33
    80005494:	0087b503          	ld	a0,8(a5)
    80005498:	00001097          	auipc	ra,0x1
    8000549c:	c20080e7          	jalr	-992(ra) # 800060b8 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    800054a0:	0104b503          	ld	a0,16(s1)
    800054a4:	ffffd097          	auipc	ra,0xffffd
    800054a8:	6b8080e7          	jalr	1720(ra) # 80002b5c <_ZN9Semaphore6signalEv>
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
    800054f0:	52c080e7          	jalr	1324(ra) # 80002a18 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    800054f4:	00008797          	auipc	a5,0x8
    800054f8:	86c7a783          	lw	a5,-1940(a5) # 8000cd60 <_ZL9threadEnd>
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
    80005540:	620080e7          	jalr	1568(ra) # 80002b5c <_ZN9Semaphore6signalEv>
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
    80005590:	48c080e7          	jalr	1164(ra) # 80002a18 <_ZN6Thread8dispatchEv>
    80005594:	0500006f          	j	800055e4 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80005598:	00a00513          	li	a0,10
    8000559c:	ffffc097          	auipc	ra,0xffffc
    800055a0:	ff4080e7          	jalr	-12(ra) # 80001590 <_Z4putcc>
    while (!threadEnd) {
    800055a4:	00007797          	auipc	a5,0x7
    800055a8:	7bc7a783          	lw	a5,1980(a5) # 8000cd60 <_ZL9threadEnd>
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
    8000560c:	5f4080e7          	jalr	1524(ra) # 80002bfc <_ZN7Console4putcEc>
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
    8000562c:	534080e7          	jalr	1332(ra) # 80002b5c <_ZN9Semaphore6signalEv>
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
    80005688:	00005517          	auipc	a0,0x5
    8000568c:	d1050513          	addi	a0,a0,-752 # 8000a398 <CONSOLE_STATUS+0x388>
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
    800056bc:	00005517          	auipc	a0,0x5
    800056c0:	cfc50513          	addi	a0,a0,-772 # 8000a3b8 <CONSOLE_STATUS+0x3a8>
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
    800056ec:	00005517          	auipc	a0,0x5
    800056f0:	cec50513          	addi	a0,a0,-788 # 8000a3d8 <CONSOLE_STATUS+0x3c8>
    800056f4:	00000097          	auipc	ra,0x0
    800056f8:	5a0080e7          	jalr	1440(ra) # 80005c94 <_Z11printStringPKc>
    800056fc:	00000613          	li	a2,0
    80005700:	00a00593          	li	a1,10
    80005704:	00090513          	mv	a0,s2
    80005708:	00000097          	auipc	ra,0x0
    8000570c:	73c080e7          	jalr	1852(ra) # 80005e44 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005710:	00005517          	auipc	a0,0x5
    80005714:	ce050513          	addi	a0,a0,-800 # 8000a3f0 <CONSOLE_STATUS+0x3e0>
    80005718:	00000097          	auipc	ra,0x0
    8000571c:	57c080e7          	jalr	1404(ra) # 80005c94 <_Z11printStringPKc>
    80005720:	00000613          	li	a2,0
    80005724:	00a00593          	li	a1,10
    80005728:	00048513          	mv	a0,s1
    8000572c:	00000097          	auipc	ra,0x0
    80005730:	718080e7          	jalr	1816(ra) # 80005e44 <_Z8printIntiii>
    printString(".\n");
    80005734:	00005517          	auipc	a0,0x5
    80005738:	cd450513          	addi	a0,a0,-812 # 8000a408 <CONSOLE_STATUS+0x3f8>
    8000573c:	00000097          	auipc	ra,0x0
    80005740:	558080e7          	jalr	1368(ra) # 80005c94 <_Z11printStringPKc>
    if(threadNum > n) {
    80005744:	0324c463          	blt	s1,s2,8000576c <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80005748:	03205c63          	blez	s2,80005780 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    8000574c:	03800513          	li	a0,56
    80005750:	ffffd097          	auipc	ra,0xffffd
    80005754:	0b4080e7          	jalr	180(ra) # 80002804 <_Znwm>
    80005758:	00050a93          	mv	s5,a0
    8000575c:	00048593          	mv	a1,s1
    80005760:	00001097          	auipc	ra,0x1
    80005764:	804080e7          	jalr	-2044(ra) # 80005f64 <_ZN9BufferCPPC1Ei>
    80005768:	0300006f          	j	80005798 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    8000576c:	00005517          	auipc	a0,0x5
    80005770:	ca450513          	addi	a0,a0,-860 # 8000a410 <CONSOLE_STATUS+0x400>
    80005774:	00000097          	auipc	ra,0x0
    80005778:	520080e7          	jalr	1312(ra) # 80005c94 <_Z11printStringPKc>
        return;
    8000577c:	0140006f          	j	80005790 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80005780:	00005517          	auipc	a0,0x5
    80005784:	cd050513          	addi	a0,a0,-816 # 8000a450 <CONSOLE_STATUS+0x440>
    80005788:	00000097          	auipc	ra,0x0
    8000578c:	50c080e7          	jalr	1292(ra) # 80005c94 <_Z11printStringPKc>
        return;
    80005790:	000b8113          	mv	sp,s7
    80005794:	2380006f          	j	800059cc <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80005798:	01000513          	li	a0,16
    8000579c:	ffffd097          	auipc	ra,0xffffd
    800057a0:	068080e7          	jalr	104(ra) # 80002804 <_Znwm>
    800057a4:	00050493          	mv	s1,a0
    800057a8:	00000593          	li	a1,0
    800057ac:	ffffd097          	auipc	ra,0xffffd
    800057b0:	34c080e7          	jalr	844(ra) # 80002af8 <_ZN9SemaphoreC1Ej>
    800057b4:	00007797          	auipc	a5,0x7
    800057b8:	5a97ba23          	sd	s1,1460(a5) # 8000cd68 <_ZL10waitForAll>
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
    80005814:	ff4080e7          	jalr	-12(ra) # 80002804 <_Znwm>
    80005818:	00050b13          	mv	s6,a0
    8000581c:	012c0c33          	add	s8,s8,s2
    80005820:	003c1c13          	slli	s8,s8,0x3
    80005824:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80005828:	ffffd097          	auipc	ra,0xffffd
    8000582c:	254080e7          	jalr	596(ra) # 80002a7c <_ZN6ThreadC1Ev>
    80005830:	00007797          	auipc	a5,0x7
    80005834:	39878793          	addi	a5,a5,920 # 8000cbc8 <_ZTV12ConsumerSync+0x10>
    80005838:	00fb3023          	sd	a5,0(s6)
    8000583c:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80005840:	000b0513          	mv	a0,s6
    80005844:	ffffd097          	auipc	ra,0xffffd
    80005848:	170080e7          	jalr	368(ra) # 800029b4 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    8000584c:	00000493          	li	s1,0
    80005850:	0380006f          	j	80005888 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005854:	00007797          	auipc	a5,0x7
    80005858:	34c78793          	addi	a5,a5,844 # 8000cba0 <_ZTV12ProducerSync+0x10>
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
    80005880:	138080e7          	jalr	312(ra) # 800029b4 <_ZN6Thread5startEv>
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
    800058a4:	00007717          	auipc	a4,0x7
    800058a8:	4c473703          	ld	a4,1220(a4) # 8000cd68 <_ZL10waitForAll>
    800058ac:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    800058b0:	02905863          	blez	s1,800058e0 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    800058b4:	02800513          	li	a0,40
    800058b8:	ffffd097          	auipc	ra,0xffffd
    800058bc:	f4c080e7          	jalr	-180(ra) # 80002804 <_Znwm>
    800058c0:	00050c93          	mv	s9,a0
    800058c4:	00149c13          	slli	s8,s1,0x1
    800058c8:	009c0c33          	add	s8,s8,s1
    800058cc:	003c1c13          	slli	s8,s8,0x3
    800058d0:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    800058d4:	ffffd097          	auipc	ra,0xffffd
    800058d8:	1a8080e7          	jalr	424(ra) # 80002a7c <_ZN6ThreadC1Ev>
    800058dc:	f79ff06f          	j	80005854 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    800058e0:	02800513          	li	a0,40
    800058e4:	ffffd097          	auipc	ra,0xffffd
    800058e8:	f20080e7          	jalr	-224(ra) # 80002804 <_Znwm>
    800058ec:	00050c93          	mv	s9,a0
    800058f0:	00149c13          	slli	s8,s1,0x1
    800058f4:	009c0c33          	add	s8,s8,s1
    800058f8:	003c1c13          	slli	s8,s8,0x3
    800058fc:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80005900:	ffffd097          	auipc	ra,0xffffd
    80005904:	17c080e7          	jalr	380(ra) # 80002a7c <_ZN6ThreadC1Ev>
    80005908:	00007797          	auipc	a5,0x7
    8000590c:	27078793          	addi	a5,a5,624 # 8000cb78 <_ZTV16ProducerKeyboard+0x10>
    80005910:	00fcb023          	sd	a5,0(s9)
    80005914:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80005918:	00349793          	slli	a5,s1,0x3
    8000591c:	00f987b3          	add	a5,s3,a5
    80005920:	0197b023          	sd	s9,0(a5)
    80005924:	f4dff06f          	j	80005870 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80005928:	ffffd097          	auipc	ra,0xffffd
    8000592c:	0f0080e7          	jalr	240(ra) # 80002a18 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80005930:	00000493          	li	s1,0
    80005934:	00994e63          	blt	s2,s1,80005950 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80005938:	00007517          	auipc	a0,0x7
    8000593c:	43053503          	ld	a0,1072(a0) # 8000cd68 <_ZL10waitForAll>
    80005940:	ffffd097          	auipc	ra,0xffffd
    80005944:	1f0080e7          	jalr	496(ra) # 80002b30 <_ZN9Semaphore4waitEv>
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
    80005994:	00007517          	auipc	a0,0x7
    80005998:	3d453503          	ld	a0,980(a0) # 8000cd68 <_ZL10waitForAll>
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
    800059c4:	e94080e7          	jalr	-364(ra) # 80002854 <_ZdlPv>
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
    80005a10:	e48080e7          	jalr	-440(ra) # 80002854 <_ZdlPv>
    80005a14:	00048513          	mv	a0,s1
    80005a18:	00008097          	auipc	ra,0x8
    80005a1c:	430080e7          	jalr	1072(ra) # 8000de48 <_Unwind_Resume>
    80005a20:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80005a24:	00048513          	mv	a0,s1
    80005a28:	ffffd097          	auipc	ra,0xffffd
    80005a2c:	e2c080e7          	jalr	-468(ra) # 80002854 <_ZdlPv>
    80005a30:	00090513          	mv	a0,s2
    80005a34:	00008097          	auipc	ra,0x8
    80005a38:	414080e7          	jalr	1044(ra) # 8000de48 <_Unwind_Resume>
    80005a3c:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80005a40:	000b0513          	mv	a0,s6
    80005a44:	ffffd097          	auipc	ra,0xffffd
    80005a48:	e10080e7          	jalr	-496(ra) # 80002854 <_ZdlPv>
    80005a4c:	00048513          	mv	a0,s1
    80005a50:	00008097          	auipc	ra,0x8
    80005a54:	3f8080e7          	jalr	1016(ra) # 8000de48 <_Unwind_Resume>
    80005a58:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80005a5c:	000c8513          	mv	a0,s9
    80005a60:	ffffd097          	auipc	ra,0xffffd
    80005a64:	df4080e7          	jalr	-524(ra) # 80002854 <_ZdlPv>
    80005a68:	00048513          	mv	a0,s1
    80005a6c:	00008097          	auipc	ra,0x8
    80005a70:	3dc080e7          	jalr	988(ra) # 8000de48 <_Unwind_Resume>
    80005a74:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80005a78:	000c8513          	mv	a0,s9
    80005a7c:	ffffd097          	auipc	ra,0xffffd
    80005a80:	dd8080e7          	jalr	-552(ra) # 80002854 <_ZdlPv>
    80005a84:	00048513          	mv	a0,s1
    80005a88:	00008097          	auipc	ra,0x8
    80005a8c:	3c0080e7          	jalr	960(ra) # 8000de48 <_Unwind_Resume>

0000000080005a90 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80005a90:	ff010113          	addi	sp,sp,-16
    80005a94:	00113423          	sd	ra,8(sp)
    80005a98:	00813023          	sd	s0,0(sp)
    80005a9c:	01010413          	addi	s0,sp,16
    80005aa0:	00007797          	auipc	a5,0x7
    80005aa4:	12878793          	addi	a5,a5,296 # 8000cbc8 <_ZTV12ConsumerSync+0x10>
    80005aa8:	00f53023          	sd	a5,0(a0)
    80005aac:	ffffd097          	auipc	ra,0xffffd
    80005ab0:	cac080e7          	jalr	-852(ra) # 80002758 <_ZN6ThreadD1Ev>
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
    80005adc:	00007797          	auipc	a5,0x7
    80005ae0:	0ec78793          	addi	a5,a5,236 # 8000cbc8 <_ZTV12ConsumerSync+0x10>
    80005ae4:	00f53023          	sd	a5,0(a0)
    80005ae8:	ffffd097          	auipc	ra,0xffffd
    80005aec:	c70080e7          	jalr	-912(ra) # 80002758 <_ZN6ThreadD1Ev>
    80005af0:	00048513          	mv	a0,s1
    80005af4:	ffffd097          	auipc	ra,0xffffd
    80005af8:	d60080e7          	jalr	-672(ra) # 80002854 <_ZdlPv>
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
    80005b20:	00007797          	auipc	a5,0x7
    80005b24:	08078793          	addi	a5,a5,128 # 8000cba0 <_ZTV12ProducerSync+0x10>
    80005b28:	00f53023          	sd	a5,0(a0)
    80005b2c:	ffffd097          	auipc	ra,0xffffd
    80005b30:	c2c080e7          	jalr	-980(ra) # 80002758 <_ZN6ThreadD1Ev>
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
    80005b5c:	00007797          	auipc	a5,0x7
    80005b60:	04478793          	addi	a5,a5,68 # 8000cba0 <_ZTV12ProducerSync+0x10>
    80005b64:	00f53023          	sd	a5,0(a0)
    80005b68:	ffffd097          	auipc	ra,0xffffd
    80005b6c:	bf0080e7          	jalr	-1040(ra) # 80002758 <_ZN6ThreadD1Ev>
    80005b70:	00048513          	mv	a0,s1
    80005b74:	ffffd097          	auipc	ra,0xffffd
    80005b78:	ce0080e7          	jalr	-800(ra) # 80002854 <_ZdlPv>
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
    80005ba0:	00007797          	auipc	a5,0x7
    80005ba4:	fd878793          	addi	a5,a5,-40 # 8000cb78 <_ZTV16ProducerKeyboard+0x10>
    80005ba8:	00f53023          	sd	a5,0(a0)
    80005bac:	ffffd097          	auipc	ra,0xffffd
    80005bb0:	bac080e7          	jalr	-1108(ra) # 80002758 <_ZN6ThreadD1Ev>
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
    80005bdc:	00007797          	auipc	a5,0x7
    80005be0:	f9c78793          	addi	a5,a5,-100 # 8000cb78 <_ZTV16ProducerKeyboard+0x10>
    80005be4:	00f53023          	sd	a5,0(a0)
    80005be8:	ffffd097          	auipc	ra,0xffffd
    80005bec:	b70080e7          	jalr	-1168(ra) # 80002758 <_ZN6ThreadD1Ev>
    80005bf0:	00048513          	mv	a0,s1
    80005bf4:	ffffd097          	auipc	ra,0xffffd
    80005bf8:	c60080e7          	jalr	-928(ra) # 80002854 <_ZdlPv>
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
    80005cb4:	00007517          	auipc	a0,0x7
    80005cb8:	0bc50513          	addi	a0,a0,188 # 8000cd70 <lockPrint>
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
    80005cf4:	00007517          	auipc	a0,0x7
    80005cf8:	07c50513          	addi	a0,a0,124 # 8000cd70 <lockPrint>
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
    80005d4c:	00007517          	auipc	a0,0x7
    80005d50:	02450513          	addi	a0,a0,36 # 8000cd70 <lockPrint>
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
    80005dbc:	00007517          	auipc	a0,0x7
    80005dc0:	fb450513          	addi	a0,a0,-76 # 8000cd70 <lockPrint>
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
    80005e74:	00007517          	auipc	a0,0x7
    80005e78:	efc50513          	addi	a0,a0,-260 # 8000cd70 <lockPrint>
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
    80005ec0:	00007717          	auipc	a4,0x7
    80005ec4:	d2070713          	addi	a4,a4,-736 # 8000cbe0 <digits>
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
    80005f34:	00007517          	auipc	a0,0x7
    80005f38:	e3c50513          	addi	a0,a0,-452 # 8000cd70 <lockPrint>
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
    80005fb0:	ffffd097          	auipc	ra,0xffffd
    80005fb4:	854080e7          	jalr	-1964(ra) # 80002804 <_Znwm>
    80005fb8:	00050993          	mv	s3,a0
    80005fbc:	00000593          	li	a1,0
    80005fc0:	ffffd097          	auipc	ra,0xffffd
    80005fc4:	b38080e7          	jalr	-1224(ra) # 80002af8 <_ZN9SemaphoreC1Ej>
    80005fc8:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80005fcc:	01000513          	li	a0,16
    80005fd0:	ffffd097          	auipc	ra,0xffffd
    80005fd4:	834080e7          	jalr	-1996(ra) # 80002804 <_Znwm>
    80005fd8:	00050993          	mv	s3,a0
    80005fdc:	00090593          	mv	a1,s2
    80005fe0:	ffffd097          	auipc	ra,0xffffd
    80005fe4:	b18080e7          	jalr	-1256(ra) # 80002af8 <_ZN9SemaphoreC1Ej>
    80005fe8:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80005fec:	01000513          	li	a0,16
    80005ff0:	ffffd097          	auipc	ra,0xffffd
    80005ff4:	814080e7          	jalr	-2028(ra) # 80002804 <_Znwm>
    80005ff8:	00050913          	mv	s2,a0
    80005ffc:	00100593          	li	a1,1
    80006000:	ffffd097          	auipc	ra,0xffffd
    80006004:	af8080e7          	jalr	-1288(ra) # 80002af8 <_ZN9SemaphoreC1Ej>
    80006008:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    8000600c:	01000513          	li	a0,16
    80006010:	ffffc097          	auipc	ra,0xffffc
    80006014:	7f4080e7          	jalr	2036(ra) # 80002804 <_Znwm>
    80006018:	00050913          	mv	s2,a0
    8000601c:	00100593          	li	a1,1
    80006020:	ffffd097          	auipc	ra,0xffffd
    80006024:	ad8080e7          	jalr	-1320(ra) # 80002af8 <_ZN9SemaphoreC1Ej>
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
    80006050:	ffffd097          	auipc	ra,0xffffd
    80006054:	804080e7          	jalr	-2044(ra) # 80002854 <_ZdlPv>
    80006058:	00048513          	mv	a0,s1
    8000605c:	00008097          	auipc	ra,0x8
    80006060:	dec080e7          	jalr	-532(ra) # 8000de48 <_Unwind_Resume>
    80006064:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80006068:	00098513          	mv	a0,s3
    8000606c:	ffffc097          	auipc	ra,0xffffc
    80006070:	7e8080e7          	jalr	2024(ra) # 80002854 <_ZdlPv>
    80006074:	00048513          	mv	a0,s1
    80006078:	00008097          	auipc	ra,0x8
    8000607c:	dd0080e7          	jalr	-560(ra) # 8000de48 <_Unwind_Resume>
    80006080:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80006084:	00090513          	mv	a0,s2
    80006088:	ffffc097          	auipc	ra,0xffffc
    8000608c:	7cc080e7          	jalr	1996(ra) # 80002854 <_ZdlPv>
    80006090:	00048513          	mv	a0,s1
    80006094:	00008097          	auipc	ra,0x8
    80006098:	db4080e7          	jalr	-588(ra) # 8000de48 <_Unwind_Resume>
    8000609c:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    800060a0:	00090513          	mv	a0,s2
    800060a4:	ffffc097          	auipc	ra,0xffffc
    800060a8:	7b0080e7          	jalr	1968(ra) # 80002854 <_ZdlPv>
    800060ac:	00048513          	mv	a0,s1
    800060b0:	00008097          	auipc	ra,0x8
    800060b4:	d98080e7          	jalr	-616(ra) # 8000de48 <_Unwind_Resume>

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
    800060dc:	ffffd097          	auipc	ra,0xffffd
    800060e0:	a54080e7          	jalr	-1452(ra) # 80002b30 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    800060e4:	0304b503          	ld	a0,48(s1)
    800060e8:	ffffd097          	auipc	ra,0xffffd
    800060ec:	a48080e7          	jalr	-1464(ra) # 80002b30 <_ZN9Semaphore4waitEv>
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
    8000611c:	ffffd097          	auipc	ra,0xffffd
    80006120:	a40080e7          	jalr	-1472(ra) # 80002b5c <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80006124:	0204b503          	ld	a0,32(s1)
    80006128:	ffffd097          	auipc	ra,0xffffd
    8000612c:	a34080e7          	jalr	-1484(ra) # 80002b5c <_ZN9Semaphore6signalEv>

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
    80006168:	ffffd097          	auipc	ra,0xffffd
    8000616c:	9c8080e7          	jalr	-1592(ra) # 80002b30 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80006170:	0284b503          	ld	a0,40(s1)
    80006174:	ffffd097          	auipc	ra,0xffffd
    80006178:	9bc080e7          	jalr	-1604(ra) # 80002b30 <_ZN9Semaphore4waitEv>

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
    800061a4:	ffffd097          	auipc	ra,0xffffd
    800061a8:	9b8080e7          	jalr	-1608(ra) # 80002b5c <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    800061ac:	0184b503          	ld	a0,24(s1)
    800061b0:	ffffd097          	auipc	ra,0xffffd
    800061b4:	9ac080e7          	jalr	-1620(ra) # 80002b5c <_ZN9Semaphore6signalEv>

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
    800061f4:	ffffd097          	auipc	ra,0xffffd
    800061f8:	93c080e7          	jalr	-1732(ra) # 80002b30 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    800061fc:	0304b503          	ld	a0,48(s1)
    80006200:	ffffd097          	auipc	ra,0xffffd
    80006204:	930080e7          	jalr	-1744(ra) # 80002b30 <_ZN9Semaphore4waitEv>

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
    8000621c:	ffffd097          	auipc	ra,0xffffd
    80006220:	940080e7          	jalr	-1728(ra) # 80002b5c <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80006224:	0284b503          	ld	a0,40(s1)
    80006228:	ffffd097          	auipc	ra,0xffffd
    8000622c:	934080e7          	jalr	-1740(ra) # 80002b5c <_ZN9Semaphore6signalEv>

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
    80006278:	ffffd097          	auipc	ra,0xffffd
    8000627c:	984080e7          	jalr	-1660(ra) # 80002bfc <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80006280:	00004517          	auipc	a0,0x4
    80006284:	2f850513          	addi	a0,a0,760 # 8000a578 <CONSOLE_STATUS+0x568>
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
    800062b4:	ffffd097          	auipc	ra,0xffffd
    800062b8:	948080e7          	jalr	-1720(ra) # 80002bfc <_ZN7Console4putcEc>
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
    800062d8:	ffffd097          	auipc	ra,0xffffd
    800062dc:	924080e7          	jalr	-1756(ra) # 80002bfc <_ZN7Console4putcEc>
    Console::putc('\n');
    800062e0:	00a00513          	li	a0,10
    800062e4:	ffffd097          	auipc	ra,0xffffd
    800062e8:	918080e7          	jalr	-1768(ra) # 80002bfc <_ZN7Console4putcEc>
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
    80006370:	00004517          	auipc	a0,0x4
    80006374:	22050513          	addi	a0,a0,544 # 8000a590 <CONSOLE_STATUS+0x580>
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
    800063a0:	00004717          	auipc	a4,0x4
    800063a4:	44870713          	addi	a4,a4,1096 # 8000a7e8 <CONSOLE_STATUS+0x7d8>
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
    800063c0:	00004517          	auipc	a0,0x4
    800063c4:	1f050513          	addi	a0,a0,496 # 8000a5b0 <CONSOLE_STATUS+0x5a0>
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
    800063ec:	00004517          	auipc	a0,0x4
    800063f0:	20450513          	addi	a0,a0,516 # 8000a5f0 <CONSOLE_STATUS+0x5e0>
    800063f4:	00000097          	auipc	ra,0x0
    800063f8:	8a0080e7          	jalr	-1888(ra) # 80005c94 <_Z11printStringPKc>
            break;
    800063fc:	fd5ff06f          	j	800063d0 <_Z8userMainv+0x74>
            producerConsumer_C_API();
    80006400:	ffffd097          	auipc	ra,0xffffd
    80006404:	640080e7          	jalr	1600(ra) # 80003a40 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80006408:	00004517          	auipc	a0,0x4
    8000640c:	22850513          	addi	a0,a0,552 # 8000a630 <CONSOLE_STATUS+0x620>
    80006410:	00000097          	auipc	ra,0x0
    80006414:	884080e7          	jalr	-1916(ra) # 80005c94 <_Z11printStringPKc>
            break;
    80006418:	fb9ff06f          	j	800063d0 <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    8000641c:	fffff097          	auipc	ra,0xfffff
    80006420:	234080e7          	jalr	564(ra) # 80005650 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80006424:	00004517          	auipc	a0,0x4
    80006428:	25c50513          	addi	a0,a0,604 # 8000a680 <CONSOLE_STATUS+0x670>
    8000642c:	00000097          	auipc	ra,0x0
    80006430:	868080e7          	jalr	-1944(ra) # 80005c94 <_Z11printStringPKc>
            break;
    80006434:	f9dff06f          	j	800063d0 <_Z8userMainv+0x74>
            testSleeping();
    80006438:	00000097          	auipc	ra,0x0
    8000643c:	11c080e7          	jalr	284(ra) # 80006554 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    80006440:	00004517          	auipc	a0,0x4
    80006444:	29850513          	addi	a0,a0,664 # 8000a6d8 <CONSOLE_STATUS+0x6c8>
    80006448:	00000097          	auipc	ra,0x0
    8000644c:	84c080e7          	jalr	-1972(ra) # 80005c94 <_Z11printStringPKc>
            break;
    80006450:	f81ff06f          	j	800063d0 <_Z8userMainv+0x74>
            testConsumerProducer();
    80006454:	ffffe097          	auipc	ra,0xffffe
    80006458:	258080e7          	jalr	600(ra) # 800046ac <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    8000645c:	00004517          	auipc	a0,0x4
    80006460:	2ac50513          	addi	a0,a0,684 # 8000a708 <CONSOLE_STATUS+0x6f8>
    80006464:	00000097          	auipc	ra,0x0
    80006468:	830080e7          	jalr	-2000(ra) # 80005c94 <_Z11printStringPKc>
            break;
    8000646c:	f65ff06f          	j	800063d0 <_Z8userMainv+0x74>
            System_Mode_test();
    80006470:	00000097          	auipc	ra,0x0
    80006474:	658080e7          	jalr	1624(ra) # 80006ac8 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80006478:	00004517          	auipc	a0,0x4
    8000647c:	2d050513          	addi	a0,a0,720 # 8000a748 <CONSOLE_STATUS+0x738>
    80006480:	00000097          	auipc	ra,0x0
    80006484:	814080e7          	jalr	-2028(ra) # 80005c94 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80006488:	00004517          	auipc	a0,0x4
    8000648c:	2e050513          	addi	a0,a0,736 # 8000a768 <CONSOLE_STATUS+0x758>
    80006490:	00000097          	auipc	ra,0x0
    80006494:	804080e7          	jalr	-2044(ra) # 80005c94 <_Z11printStringPKc>
            break;
    80006498:	f39ff06f          	j	800063d0 <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    8000649c:	00004517          	auipc	a0,0x4
    800064a0:	32450513          	addi	a0,a0,804 # 8000a7c0 <CONSOLE_STATUS+0x7b0>
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
    800064d8:	00004517          	auipc	a0,0x4
    800064dc:	33050513          	addi	a0,a0,816 # 8000a808 <CONSOLE_STATUS+0x7f8>
    800064e0:	fffff097          	auipc	ra,0xfffff
    800064e4:	7b4080e7          	jalr	1972(ra) # 80005c94 <_Z11printStringPKc>
        printInt(sleep_time);
    800064e8:	00000613          	li	a2,0
    800064ec:	00a00593          	li	a1,10
    800064f0:	0009051b          	sext.w	a0,s2
    800064f4:	00000097          	auipc	ra,0x0
    800064f8:	950080e7          	jalr	-1712(ra) # 80005e44 <_Z8printIntiii>
        printString(" !\n");
    800064fc:	00004517          	auipc	a0,0x4
    80006500:	31450513          	addi	a0,a0,788 # 8000a810 <CONSOLE_STATUS+0x800>
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
    80006528:	00007797          	auipc	a5,0x7
    8000652c:	85078793          	addi	a5,a5,-1968 # 8000cd78 <_ZL8finished>
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
    800065b0:	00006797          	auipc	a5,0x6
    800065b4:	7c87c783          	lbu	a5,1992(a5) # 8000cd78 <_ZL8finished>
    800065b8:	fe078ce3          	beqz	a5,800065b0 <_Z12testSleepingv+0x5c>
    800065bc:	00006797          	auipc	a5,0x6
    800065c0:	7bd7c783          	lbu	a5,1981(a5) # 8000cd79 <_ZL8finished+0x1>
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
    80006670:	00004517          	auipc	a0,0x4
    80006674:	e7050513          	addi	a0,a0,-400 # 8000a4e0 <CONSOLE_STATUS+0x4d0>
    80006678:	fffff097          	auipc	ra,0xfffff
    8000667c:	61c080e7          	jalr	1564(ra) # 80005c94 <_Z11printStringPKc>
    80006680:	00000613          	li	a2,0
    80006684:	00a00593          	li	a1,10
    80006688:	00048513          	mv	a0,s1
    8000668c:	fffff097          	auipc	ra,0xfffff
    80006690:	7b8080e7          	jalr	1976(ra) # 80005e44 <_Z8printIntiii>
    80006694:	00004517          	auipc	a0,0x4
    80006698:	03c50513          	addi	a0,a0,60 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    8000669c:	fffff097          	auipc	ra,0xfffff
    800066a0:	5f8080e7          	jalr	1528(ra) # 80005c94 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800066a4:	0014849b          	addiw	s1,s1,1
    800066a8:	0ff4f493          	andi	s1,s1,255
    800066ac:	00c00793          	li	a5,12
    800066b0:	fc97f0e3          	bgeu	a5,s1,80006670 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800066b4:	00004517          	auipc	a0,0x4
    800066b8:	e3450513          	addi	a0,a0,-460 # 8000a4e8 <CONSOLE_STATUS+0x4d8>
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
    800066e0:	00004517          	auipc	a0,0x4
    800066e4:	e1850513          	addi	a0,a0,-488 # 8000a4f8 <CONSOLE_STATUS+0x4e8>
    800066e8:	fffff097          	auipc	ra,0xfffff
    800066ec:	5ac080e7          	jalr	1452(ra) # 80005c94 <_Z11printStringPKc>
    800066f0:	00000613          	li	a2,0
    800066f4:	00a00593          	li	a1,10
    800066f8:	0009051b          	sext.w	a0,s2
    800066fc:	fffff097          	auipc	ra,0xfffff
    80006700:	748080e7          	jalr	1864(ra) # 80005e44 <_Z8printIntiii>
    80006704:	00004517          	auipc	a0,0x4
    80006708:	fcc50513          	addi	a0,a0,-52 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    8000670c:	fffff097          	auipc	ra,0xfffff
    80006710:	588080e7          	jalr	1416(ra) # 80005c94 <_Z11printStringPKc>
    80006714:	0400006f          	j	80006754 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006718:	00004517          	auipc	a0,0x4
    8000671c:	dc850513          	addi	a0,a0,-568 # 8000a4e0 <CONSOLE_STATUS+0x4d0>
    80006720:	fffff097          	auipc	ra,0xfffff
    80006724:	574080e7          	jalr	1396(ra) # 80005c94 <_Z11printStringPKc>
    80006728:	00000613          	li	a2,0
    8000672c:	00a00593          	li	a1,10
    80006730:	00048513          	mv	a0,s1
    80006734:	fffff097          	auipc	ra,0xfffff
    80006738:	710080e7          	jalr	1808(ra) # 80005e44 <_Z8printIntiii>
    8000673c:	00004517          	auipc	a0,0x4
    80006740:	f9450513          	addi	a0,a0,-108 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    80006744:	fffff097          	auipc	ra,0xfffff
    80006748:	550080e7          	jalr	1360(ra) # 80005c94 <_Z11printStringPKc>
    for (; i < 16; i++) {
    8000674c:	0014849b          	addiw	s1,s1,1
    80006750:	0ff4f493          	andi	s1,s1,255
    80006754:	00f00793          	li	a5,15
    80006758:	fc97f0e3          	bgeu	a5,s1,80006718 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    8000675c:	00004517          	auipc	a0,0x4
    80006760:	dac50513          	addi	a0,a0,-596 # 8000a508 <CONSOLE_STATUS+0x4f8>
    80006764:	fffff097          	auipc	ra,0xfffff
    80006768:	530080e7          	jalr	1328(ra) # 80005c94 <_Z11printStringPKc>
    finishedD = true;
    8000676c:	00100793          	li	a5,1
    80006770:	00006717          	auipc	a4,0x6
    80006774:	60f70523          	sb	a5,1546(a4) # 8000cd7a <_ZL9finishedD>
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
    800067b8:	00004517          	auipc	a0,0x4
    800067bc:	cf850513          	addi	a0,a0,-776 # 8000a4b0 <CONSOLE_STATUS+0x4a0>
    800067c0:	fffff097          	auipc	ra,0xfffff
    800067c4:	4d4080e7          	jalr	1236(ra) # 80005c94 <_Z11printStringPKc>
    800067c8:	00000613          	li	a2,0
    800067cc:	00a00593          	li	a1,10
    800067d0:	00048513          	mv	a0,s1
    800067d4:	fffff097          	auipc	ra,0xfffff
    800067d8:	670080e7          	jalr	1648(ra) # 80005e44 <_Z8printIntiii>
    800067dc:	00004517          	auipc	a0,0x4
    800067e0:	ef450513          	addi	a0,a0,-268 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    800067e4:	fffff097          	auipc	ra,0xfffff
    800067e8:	4b0080e7          	jalr	1200(ra) # 80005c94 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800067ec:	0014849b          	addiw	s1,s1,1
    800067f0:	0ff4f493          	andi	s1,s1,255
    800067f4:	00200793          	li	a5,2
    800067f8:	fc97f0e3          	bgeu	a5,s1,800067b8 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    800067fc:	00004517          	auipc	a0,0x4
    80006800:	cbc50513          	addi	a0,a0,-836 # 8000a4b8 <CONSOLE_STATUS+0x4a8>
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
    8000681c:	00004517          	auipc	a0,0x4
    80006820:	cac50513          	addi	a0,a0,-852 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80006824:	fffff097          	auipc	ra,0xfffff
    80006828:	470080e7          	jalr	1136(ra) # 80005c94 <_Z11printStringPKc>
    8000682c:	00000613          	li	a2,0
    80006830:	00a00593          	li	a1,10
    80006834:	0009051b          	sext.w	a0,s2
    80006838:	fffff097          	auipc	ra,0xfffff
    8000683c:	60c080e7          	jalr	1548(ra) # 80005e44 <_Z8printIntiii>
    80006840:	00004517          	auipc	a0,0x4
    80006844:	e9050513          	addi	a0,a0,-368 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    80006848:	fffff097          	auipc	ra,0xfffff
    8000684c:	44c080e7          	jalr	1100(ra) # 80005c94 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80006850:	00c00513          	li	a0,12
    80006854:	00000097          	auipc	ra,0x0
    80006858:	d88080e7          	jalr	-632(ra) # 800065dc <_ZL9fibonaccim>
    8000685c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006860:	00004517          	auipc	a0,0x4
    80006864:	c7050513          	addi	a0,a0,-912 # 8000a4d0 <CONSOLE_STATUS+0x4c0>
    80006868:	fffff097          	auipc	ra,0xfffff
    8000686c:	42c080e7          	jalr	1068(ra) # 80005c94 <_Z11printStringPKc>
    80006870:	00000613          	li	a2,0
    80006874:	00a00593          	li	a1,10
    80006878:	0009051b          	sext.w	a0,s2
    8000687c:	fffff097          	auipc	ra,0xfffff
    80006880:	5c8080e7          	jalr	1480(ra) # 80005e44 <_Z8printIntiii>
    80006884:	00004517          	auipc	a0,0x4
    80006888:	e4c50513          	addi	a0,a0,-436 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    8000688c:	fffff097          	auipc	ra,0xfffff
    80006890:	408080e7          	jalr	1032(ra) # 80005c94 <_Z11printStringPKc>
    80006894:	0400006f          	j	800068d4 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80006898:	00004517          	auipc	a0,0x4
    8000689c:	c1850513          	addi	a0,a0,-1000 # 8000a4b0 <CONSOLE_STATUS+0x4a0>
    800068a0:	fffff097          	auipc	ra,0xfffff
    800068a4:	3f4080e7          	jalr	1012(ra) # 80005c94 <_Z11printStringPKc>
    800068a8:	00000613          	li	a2,0
    800068ac:	00a00593          	li	a1,10
    800068b0:	00048513          	mv	a0,s1
    800068b4:	fffff097          	auipc	ra,0xfffff
    800068b8:	590080e7          	jalr	1424(ra) # 80005e44 <_Z8printIntiii>
    800068bc:	00004517          	auipc	a0,0x4
    800068c0:	e1450513          	addi	a0,a0,-492 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    800068c4:	fffff097          	auipc	ra,0xfffff
    800068c8:	3d0080e7          	jalr	976(ra) # 80005c94 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800068cc:	0014849b          	addiw	s1,s1,1
    800068d0:	0ff4f493          	andi	s1,s1,255
    800068d4:	00500793          	li	a5,5
    800068d8:	fc97f0e3          	bgeu	a5,s1,80006898 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    800068dc:	00004517          	auipc	a0,0x4
    800068e0:	bac50513          	addi	a0,a0,-1108 # 8000a488 <CONSOLE_STATUS+0x478>
    800068e4:	fffff097          	auipc	ra,0xfffff
    800068e8:	3b0080e7          	jalr	944(ra) # 80005c94 <_Z11printStringPKc>
    finishedC = true;
    800068ec:	00100793          	li	a5,1
    800068f0:	00006717          	auipc	a4,0x6
    800068f4:	48f705a3          	sb	a5,1163(a4) # 8000cd7b <_ZL9finishedC>
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
    8000697c:	00004517          	auipc	a0,0x4
    80006980:	b1c50513          	addi	a0,a0,-1252 # 8000a498 <CONSOLE_STATUS+0x488>
    80006984:	fffff097          	auipc	ra,0xfffff
    80006988:	310080e7          	jalr	784(ra) # 80005c94 <_Z11printStringPKc>
    8000698c:	00000613          	li	a2,0
    80006990:	00a00593          	li	a1,10
    80006994:	0009051b          	sext.w	a0,s2
    80006998:	fffff097          	auipc	ra,0xfffff
    8000699c:	4ac080e7          	jalr	1196(ra) # 80005e44 <_Z8printIntiii>
    800069a0:	00004517          	auipc	a0,0x4
    800069a4:	d3050513          	addi	a0,a0,-720 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    800069a8:	fffff097          	auipc	ra,0xfffff
    800069ac:	2ec080e7          	jalr	748(ra) # 80005c94 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800069b0:	00000493          	li	s1,0
    800069b4:	f91ff06f          	j	80006944 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    800069b8:	14102ff3          	csrr	t6,sepc
    800069bc:	fb5ff06f          	j	80006970 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    800069c0:	00004517          	auipc	a0,0x4
    800069c4:	ae050513          	addi	a0,a0,-1312 # 8000a4a0 <CONSOLE_STATUS+0x490>
    800069c8:	fffff097          	auipc	ra,0xfffff
    800069cc:	2cc080e7          	jalr	716(ra) # 80005c94 <_Z11printStringPKc>
    finishedB = true;
    800069d0:	00100793          	li	a5,1
    800069d4:	00006717          	auipc	a4,0x6
    800069d8:	3af70423          	sb	a5,936(a4) # 8000cd7c <_ZL9finishedB>
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
    80006a58:	00004517          	auipc	a0,0x4
    80006a5c:	a2850513          	addi	a0,a0,-1496 # 8000a480 <CONSOLE_STATUS+0x470>
    80006a60:	fffff097          	auipc	ra,0xfffff
    80006a64:	234080e7          	jalr	564(ra) # 80005c94 <_Z11printStringPKc>
    80006a68:	00000613          	li	a2,0
    80006a6c:	00a00593          	li	a1,10
    80006a70:	0009051b          	sext.w	a0,s2
    80006a74:	fffff097          	auipc	ra,0xfffff
    80006a78:	3d0080e7          	jalr	976(ra) # 80005e44 <_Z8printIntiii>
    80006a7c:	00004517          	auipc	a0,0x4
    80006a80:	c5450513          	addi	a0,a0,-940 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    80006a84:	fffff097          	auipc	ra,0xfffff
    80006a88:	210080e7          	jalr	528(ra) # 80005c94 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006a8c:	00000493          	li	s1,0
    80006a90:	f99ff06f          	j	80006a28 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80006a94:	00004517          	auipc	a0,0x4
    80006a98:	9f450513          	addi	a0,a0,-1548 # 8000a488 <CONSOLE_STATUS+0x478>
    80006a9c:	fffff097          	auipc	ra,0xfffff
    80006aa0:	1f8080e7          	jalr	504(ra) # 80005c94 <_Z11printStringPKc>
    finishedA = true;
    80006aa4:	00100793          	li	a5,1
    80006aa8:	00006717          	auipc	a4,0x6
    80006aac:	2cf70aa3          	sb	a5,725(a4) # 8000cd7d <_ZL9finishedA>
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
    80006af0:	00004517          	auipc	a0,0x4
    80006af4:	a2850513          	addi	a0,a0,-1496 # 8000a518 <CONSOLE_STATUS+0x508>
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
    80006b18:	00004517          	auipc	a0,0x4
    80006b1c:	a1850513          	addi	a0,a0,-1512 # 8000a530 <CONSOLE_STATUS+0x520>
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
    80006b40:	00004517          	auipc	a0,0x4
    80006b44:	a0850513          	addi	a0,a0,-1528 # 8000a548 <CONSOLE_STATUS+0x538>
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
    80006b68:	00004517          	auipc	a0,0x4
    80006b6c:	9f850513          	addi	a0,a0,-1544 # 8000a560 <CONSOLE_STATUS+0x550>
    80006b70:	fffff097          	auipc	ra,0xfffff
    80006b74:	124080e7          	jalr	292(ra) # 80005c94 <_Z11printStringPKc>
    80006b78:	00c0006f          	j	80006b84 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006b7c:	ffffb097          	auipc	ra,0xffffb
    80006b80:	8ac080e7          	jalr	-1876(ra) # 80001428 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006b84:	00006797          	auipc	a5,0x6
    80006b88:	1f97c783          	lbu	a5,505(a5) # 8000cd7d <_ZL9finishedA>
    80006b8c:	fe0788e3          	beqz	a5,80006b7c <_Z16System_Mode_testv+0xb4>
    80006b90:	00006797          	auipc	a5,0x6
    80006b94:	1ec7c783          	lbu	a5,492(a5) # 8000cd7c <_ZL9finishedB>
    80006b98:	fe0782e3          	beqz	a5,80006b7c <_Z16System_Mode_testv+0xb4>
    80006b9c:	00006797          	auipc	a5,0x6
    80006ba0:	1df7c783          	lbu	a5,479(a5) # 8000cd7b <_ZL9finishedC>
    80006ba4:	fc078ce3          	beqz	a5,80006b7c <_Z16System_Mode_testv+0xb4>
    80006ba8:	00006797          	auipc	a5,0x6
    80006bac:	1d27c783          	lbu	a5,466(a5) # 8000cd7a <_ZL9finishedD>
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
    80006e28:	00003517          	auipc	a0,0x3
    80006e2c:	75050513          	addi	a0,a0,1872 # 8000a578 <CONSOLE_STATUS+0x568>
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
    80006ef8:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff081f>
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
    80006f88:	00006717          	auipc	a4,0x6
    80006f8c:	df870713          	addi	a4,a4,-520 # 8000cd80 <timer_scratch>
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
    80007024:	00006717          	auipc	a4,0x6
    80007028:	d5c70713          	addi	a4,a4,-676 # 8000cd80 <timer_scratch>
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
    8000708c:	00006497          	auipc	s1,0x6
    80007090:	c0448493          	addi	s1,s1,-1020 # 8000cc90 <started>
    80007094:	02050263          	beqz	a0,800070b8 <system_main+0x48>
    80007098:	0004a783          	lw	a5,0(s1)
    8000709c:	0007879b          	sext.w	a5,a5
    800070a0:	fe078ce3          	beqz	a5,80007098 <system_main+0x28>
    800070a4:	0ff0000f          	fence
    800070a8:	00003517          	auipc	a0,0x3
    800070ac:	7a050513          	addi	a0,a0,1952 # 8000a848 <CONSOLE_STATUS+0x838>
    800070b0:	00001097          	auipc	ra,0x1
    800070b4:	a7c080e7          	jalr	-1412(ra) # 80007b2c <panic>
    800070b8:	00001097          	auipc	ra,0x1
    800070bc:	9d0080e7          	jalr	-1584(ra) # 80007a88 <consoleinit>
    800070c0:	00001097          	auipc	ra,0x1
    800070c4:	15c080e7          	jalr	348(ra) # 8000821c <printfinit>
    800070c8:	00003517          	auipc	a0,0x3
    800070cc:	60850513          	addi	a0,a0,1544 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    800070d0:	00001097          	auipc	ra,0x1
    800070d4:	ab8080e7          	jalr	-1352(ra) # 80007b88 <__printf>
    800070d8:	00003517          	auipc	a0,0x3
    800070dc:	74050513          	addi	a0,a0,1856 # 8000a818 <CONSOLE_STATUS+0x808>
    800070e0:	00001097          	auipc	ra,0x1
    800070e4:	aa8080e7          	jalr	-1368(ra) # 80007b88 <__printf>
    800070e8:	00003517          	auipc	a0,0x3
    800070ec:	5e850513          	addi	a0,a0,1512 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
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
    80007130:	00003517          	auipc	a0,0x3
    80007134:	70050513          	addi	a0,a0,1792 # 8000a830 <CONSOLE_STATUS+0x820>
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
    80007184:	00007517          	auipc	a0,0x7
    80007188:	c2c50513          	addi	a0,a0,-980 # 8000ddb0 <cpus>
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
    800071b0:	80030067          	jr	-2048(t1) # 800019ac <main>

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
    800071f0:	00003517          	auipc	a0,0x3
    800071f4:	68050513          	addi	a0,a0,1664 # 8000a870 <CONSOLE_STATUS+0x860>
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
    80007238:	00003517          	auipc	a0,0x3
    8000723c:	66050513          	addi	a0,a0,1632 # 8000a898 <CONSOLE_STATUS+0x888>
    80007240:	00001097          	auipc	ra,0x1
    80007244:	8ec080e7          	jalr	-1812(ra) # 80007b2c <panic>

0000000080007248 <trapinit>:
    80007248:	ff010113          	addi	sp,sp,-16
    8000724c:	00813423          	sd	s0,8(sp)
    80007250:	01010413          	addi	s0,sp,16
    80007254:	00813403          	ld	s0,8(sp)
    80007258:	00003597          	auipc	a1,0x3
    8000725c:	66858593          	addi	a1,a1,1640 # 8000a8c0 <CONSOLE_STATUS+0x8b0>
    80007260:	00007517          	auipc	a0,0x7
    80007264:	bd050513          	addi	a0,a0,-1072 # 8000de30 <tickslock>
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
    800072f4:	00003517          	auipc	a0,0x3
    800072f8:	61450513          	addi	a0,a0,1556 # 8000a908 <CONSOLE_STATUS+0x8f8>
    800072fc:	00001097          	auipc	ra,0x1
    80007300:	88c080e7          	jalr	-1908(ra) # 80007b88 <__printf>
    80007304:	141025f3          	csrr	a1,sepc
    80007308:	14302673          	csrr	a2,stval
    8000730c:	00003517          	auipc	a0,0x3
    80007310:	60c50513          	addi	a0,a0,1548 # 8000a918 <CONSOLE_STATUS+0x908>
    80007314:	00001097          	auipc	ra,0x1
    80007318:	874080e7          	jalr	-1932(ra) # 80007b88 <__printf>
    8000731c:	00003517          	auipc	a0,0x3
    80007320:	61450513          	addi	a0,a0,1556 # 8000a930 <CONSOLE_STATUS+0x920>
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
    80007390:	00003517          	auipc	a0,0x3
    80007394:	55850513          	addi	a0,a0,1368 # 8000a8e8 <CONSOLE_STATUS+0x8d8>
    80007398:	00000097          	auipc	ra,0x0
    8000739c:	7f0080e7          	jalr	2032(ra) # 80007b88 <__printf>
    800073a0:	01013403          	ld	s0,16(sp)
    800073a4:	01813083          	ld	ra,24(sp)
    800073a8:	00048513          	mv	a0,s1
    800073ac:	00813483          	ld	s1,8(sp)
    800073b0:	02010113          	addi	sp,sp,32
    800073b4:	00000317          	auipc	t1,0x0
    800073b8:	3c830067          	jr	968(t1) # 8000777c <plic_complete>
    800073bc:	00007517          	auipc	a0,0x7
    800073c0:	a7450513          	addi	a0,a0,-1420 # 8000de30 <tickslock>
    800073c4:	00001097          	auipc	ra,0x1
    800073c8:	498080e7          	jalr	1176(ra) # 8000885c <acquire>
    800073cc:	00006717          	auipc	a4,0x6
    800073d0:	8c870713          	addi	a4,a4,-1848 # 8000cc94 <ticks>
    800073d4:	00072783          	lw	a5,0(a4)
    800073d8:	00007517          	auipc	a0,0x7
    800073dc:	a5850513          	addi	a0,a0,-1448 # 8000de30 <tickslock>
    800073e0:	0017879b          	addiw	a5,a5,1
    800073e4:	00f72023          	sw	a5,0(a4)
    800073e8:	00001097          	auipc	ra,0x1
    800073ec:	540080e7          	jalr	1344(ra) # 80008928 <release>
    800073f0:	f65ff06f          	j	80007354 <kerneltrap+0x8c>
    800073f4:	00001097          	auipc	ra,0x1
    800073f8:	09c080e7          	jalr	156(ra) # 80008490 <uartintr>
    800073fc:	fa5ff06f          	j	800073a0 <kerneltrap+0xd8>
    80007400:	00003517          	auipc	a0,0x3
    80007404:	4c850513          	addi	a0,a0,1224 # 8000a8c8 <CONSOLE_STATUS+0x8b8>
    80007408:	00000097          	auipc	ra,0x0
    8000740c:	724080e7          	jalr	1828(ra) # 80007b2c <panic>

0000000080007410 <clockintr>:
    80007410:	fe010113          	addi	sp,sp,-32
    80007414:	00813823          	sd	s0,16(sp)
    80007418:	00913423          	sd	s1,8(sp)
    8000741c:	00113c23          	sd	ra,24(sp)
    80007420:	02010413          	addi	s0,sp,32
    80007424:	00007497          	auipc	s1,0x7
    80007428:	a0c48493          	addi	s1,s1,-1524 # 8000de30 <tickslock>
    8000742c:	00048513          	mv	a0,s1
    80007430:	00001097          	auipc	ra,0x1
    80007434:	42c080e7          	jalr	1068(ra) # 8000885c <acquire>
    80007438:	00006717          	auipc	a4,0x6
    8000743c:	85c70713          	addi	a4,a4,-1956 # 8000cc94 <ticks>
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
    8000750c:	00003517          	auipc	a0,0x3
    80007510:	3dc50513          	addi	a0,a0,988 # 8000a8e8 <CONSOLE_STATUS+0x8d8>
    80007514:	00000097          	auipc	ra,0x0
    80007518:	674080e7          	jalr	1652(ra) # 80007b88 <__printf>
    8000751c:	00048513          	mv	a0,s1
    80007520:	00000097          	auipc	ra,0x0
    80007524:	25c080e7          	jalr	604(ra) # 8000777c <plic_complete>
    80007528:	00100513          	li	a0,1
    8000752c:	f7dff06f          	j	800074a8 <devintr+0x40>
    80007530:	00007517          	auipc	a0,0x7
    80007534:	90050513          	addi	a0,a0,-1792 # 8000de30 <tickslock>
    80007538:	00001097          	auipc	ra,0x1
    8000753c:	324080e7          	jalr	804(ra) # 8000885c <acquire>
    80007540:	00005717          	auipc	a4,0x5
    80007544:	75470713          	addi	a4,a4,1876 # 8000cc94 <ticks>
    80007548:	00072783          	lw	a5,0(a4)
    8000754c:	00007517          	auipc	a0,0x7
    80007550:	8e450513          	addi	a0,a0,-1820 # 8000de30 <tickslock>
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
    800078a8:	00006497          	auipc	s1,0x6
    800078ac:	5b048493          	addi	s1,s1,1456 # 8000de58 <cons>
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
    80007a0c:	00006917          	auipc	s2,0x6
    80007a10:	44c90913          	addi	s2,s2,1100 # 8000de58 <cons>
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
    80007a6c:	00006517          	auipc	a0,0x6
    80007a70:	3ec50513          	addi	a0,a0,1004 # 8000de58 <cons>
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
    80007a9c:	00006497          	auipc	s1,0x6
    80007aa0:	3bc48493          	addi	s1,s1,956 # 8000de58 <cons>
    80007aa4:	00048513          	mv	a0,s1
    80007aa8:	00003597          	auipc	a1,0x3
    80007aac:	e9858593          	addi	a1,a1,-360 # 8000a940 <CONSOLE_STATUS+0x930>
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
    80007afc:	00006317          	auipc	t1,0x6
    80007b00:	41433303          	ld	t1,1044(t1) # 8000df10 <devsw+0x10>
    80007b04:	01010113          	addi	sp,sp,16
    80007b08:	00030067          	jr	t1

0000000080007b0c <console_write>:
    80007b0c:	ff010113          	addi	sp,sp,-16
    80007b10:	00813423          	sd	s0,8(sp)
    80007b14:	01010413          	addi	s0,sp,16
    80007b18:	00813403          	ld	s0,8(sp)
    80007b1c:	00006317          	auipc	t1,0x6
    80007b20:	3fc33303          	ld	t1,1020(t1) # 8000df18 <devsw+0x18>
    80007b24:	01010113          	addi	sp,sp,16
    80007b28:	00030067          	jr	t1

0000000080007b2c <panic>:
    80007b2c:	fe010113          	addi	sp,sp,-32
    80007b30:	00113c23          	sd	ra,24(sp)
    80007b34:	00813823          	sd	s0,16(sp)
    80007b38:	00913423          	sd	s1,8(sp)
    80007b3c:	02010413          	addi	s0,sp,32
    80007b40:	00050493          	mv	s1,a0
    80007b44:	00003517          	auipc	a0,0x3
    80007b48:	e0450513          	addi	a0,a0,-508 # 8000a948 <CONSOLE_STATUS+0x938>
    80007b4c:	00006797          	auipc	a5,0x6
    80007b50:	4607a623          	sw	zero,1132(a5) # 8000dfb8 <pr+0x18>
    80007b54:	00000097          	auipc	ra,0x0
    80007b58:	034080e7          	jalr	52(ra) # 80007b88 <__printf>
    80007b5c:	00048513          	mv	a0,s1
    80007b60:	00000097          	auipc	ra,0x0
    80007b64:	028080e7          	jalr	40(ra) # 80007b88 <__printf>
    80007b68:	00003517          	auipc	a0,0x3
    80007b6c:	b6850513          	addi	a0,a0,-1176 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    80007b70:	00000097          	auipc	ra,0x0
    80007b74:	018080e7          	jalr	24(ra) # 80007b88 <__printf>
    80007b78:	00100793          	li	a5,1
    80007b7c:	00005717          	auipc	a4,0x5
    80007b80:	10f72e23          	sw	a5,284(a4) # 8000cc98 <panicked>
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
    80007bc4:	00006317          	auipc	t1,0x6
    80007bc8:	3dc30313          	addi	t1,t1,988 # 8000dfa0 <pr>
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
    80007c84:	00003d97          	auipc	s11,0x3
    80007c88:	cecd8d93          	addi	s11,s11,-788 # 8000a970 <digits>
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
    80007e8c:	00003d97          	auipc	s11,0x3
    80007e90:	ae4d8d93          	addi	s11,s11,-1308 # 8000a970 <digits>
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
    80007fd4:	00006517          	auipc	a0,0x6
    80007fd8:	fcc50513          	addi	a0,a0,-52 # 8000dfa0 <pr>
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
    80008014:	00003d97          	auipc	s11,0x3
    80008018:	95cd8d93          	addi	s11,s11,-1700 # 8000a970 <digits>
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
    800080b8:	00003d97          	auipc	s11,0x3
    800080bc:	8b8d8d93          	addi	s11,s11,-1864 # 8000a970 <digits>
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
    80008110:	00003d97          	auipc	s11,0x3
    80008114:	860d8d93          	addi	s11,s11,-1952 # 8000a970 <digits>
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
    8000815c:	00002c97          	auipc	s9,0x2
    80008160:	7f4c8c93          	addi	s9,s9,2036 # 8000a950 <CONSOLE_STATUS+0x940>
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
    8000820c:	00002517          	auipc	a0,0x2
    80008210:	74c50513          	addi	a0,a0,1868 # 8000a958 <CONSOLE_STATUS+0x948>
    80008214:	00000097          	auipc	ra,0x0
    80008218:	918080e7          	jalr	-1768(ra) # 80007b2c <panic>

000000008000821c <printfinit>:
    8000821c:	fe010113          	addi	sp,sp,-32
    80008220:	00813823          	sd	s0,16(sp)
    80008224:	00913423          	sd	s1,8(sp)
    80008228:	00113c23          	sd	ra,24(sp)
    8000822c:	02010413          	addi	s0,sp,32
    80008230:	00006497          	auipc	s1,0x6
    80008234:	d7048493          	addi	s1,s1,-656 # 8000dfa0 <pr>
    80008238:	00048513          	mv	a0,s1
    8000823c:	00002597          	auipc	a1,0x2
    80008240:	72c58593          	addi	a1,a1,1836 # 8000a968 <CONSOLE_STATUS+0x958>
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
    800082a8:	00005797          	auipc	a5,0x5
    800082ac:	9f07a783          	lw	a5,-1552(a5) # 8000cc98 <panicked>
    800082b0:	00078463          	beqz	a5,800082b8 <uartputc+0x10>
    800082b4:	0000006f          	j	800082b4 <uartputc+0xc>
    800082b8:	fd010113          	addi	sp,sp,-48
    800082bc:	02813023          	sd	s0,32(sp)
    800082c0:	00913c23          	sd	s1,24(sp)
    800082c4:	01213823          	sd	s2,16(sp)
    800082c8:	01313423          	sd	s3,8(sp)
    800082cc:	02113423          	sd	ra,40(sp)
    800082d0:	03010413          	addi	s0,sp,48
    800082d4:	00005917          	auipc	s2,0x5
    800082d8:	9cc90913          	addi	s2,s2,-1588 # 8000cca0 <uart_tx_r>
    800082dc:	00093783          	ld	a5,0(s2)
    800082e0:	00005497          	auipc	s1,0x5
    800082e4:	9c848493          	addi	s1,s1,-1592 # 8000cca8 <uart_tx_w>
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
    80008330:	00006597          	auipc	a1,0x6
    80008334:	c9058593          	addi	a1,a1,-880 # 8000dfc0 <uart_tx_buf>
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
    800083ac:	00005717          	auipc	a4,0x5
    800083b0:	8ec72703          	lw	a4,-1812(a4) # 8000cc98 <panicked>
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
    800083f0:	00005617          	auipc	a2,0x5
    800083f4:	8b060613          	addi	a2,a2,-1872 # 8000cca0 <uart_tx_r>
    800083f8:	00005517          	auipc	a0,0x5
    800083fc:	8b050513          	addi	a0,a0,-1872 # 8000cca8 <uart_tx_w>
    80008400:	00063783          	ld	a5,0(a2)
    80008404:	00053703          	ld	a4,0(a0)
    80008408:	04f70263          	beq	a4,a5,8000844c <uartstart+0x68>
    8000840c:	100005b7          	lui	a1,0x10000
    80008410:	00006817          	auipc	a6,0x6
    80008414:	bb080813          	addi	a6,a6,-1104 # 8000dfc0 <uart_tx_buf>
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
    800084d4:	00004617          	auipc	a2,0x4
    800084d8:	7cc60613          	addi	a2,a2,1996 # 8000cca0 <uart_tx_r>
    800084dc:	00004517          	auipc	a0,0x4
    800084e0:	7cc50513          	addi	a0,a0,1996 # 8000cca8 <uart_tx_w>
    800084e4:	00063783          	ld	a5,0(a2)
    800084e8:	00053703          	ld	a4,0(a0)
    800084ec:	04f70263          	beq	a4,a5,80008530 <uartintr+0xa0>
    800084f0:	100005b7          	lui	a1,0x10000
    800084f4:	00006817          	auipc	a6,0x6
    800084f8:	acc80813          	addi	a6,a6,-1332 # 8000dfc0 <uart_tx_buf>
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
    80008544:	00004617          	auipc	a2,0x4
    80008548:	75c60613          	addi	a2,a2,1884 # 8000cca0 <uart_tx_r>
    8000854c:	00004517          	auipc	a0,0x4
    80008550:	75c50513          	addi	a0,a0,1884 # 8000cca8 <uart_tx_w>
    80008554:	00063783          	ld	a5,0(a2)
    80008558:	00053703          	ld	a4,0(a0)
    8000855c:	04f70263          	beq	a4,a5,800085a0 <uartintr+0x110>
    80008560:	100005b7          	lui	a1,0x10000
    80008564:	00006817          	auipc	a6,0x6
    80008568:	a5c80813          	addi	a6,a6,-1444 # 8000dfc0 <uart_tx_buf>
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
    800085b4:	00007497          	auipc	s1,0x7
    800085b8:	a2b48493          	addi	s1,s1,-1493 # 8000efdf <end+0xfff>
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
    800085f0:	00006a97          	auipc	s5,0x6
    800085f4:	9f0a8a93          	addi	s5,s5,-1552 # 8000dfe0 <end>
    800085f8:	0754ec63          	bltu	s1,s5,80008670 <kinit+0xc8>
    800085fc:	0734fa63          	bgeu	s1,s3,80008670 <kinit+0xc8>
    80008600:	00088a37          	lui	s4,0x88
    80008604:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80008608:	00004917          	auipc	s2,0x4
    8000860c:	6a890913          	addi	s2,s2,1704 # 8000ccb0 <kmem>
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
    80008670:	00002517          	auipc	a0,0x2
    80008674:	31850513          	addi	a0,a0,792 # 8000a988 <digits+0x18>
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
    800086c4:	00006a97          	auipc	s5,0x6
    800086c8:	91ca8a93          	addi	s5,s5,-1764 # 8000dfe0 <end>
    800086cc:	0954e263          	bltu	s1,s5,80008750 <freerange+0xd0>
    800086d0:	01100993          	li	s3,17
    800086d4:	01b99993          	slli	s3,s3,0x1b
    800086d8:	0734fc63          	bgeu	s1,s3,80008750 <freerange+0xd0>
    800086dc:	00058a13          	mv	s4,a1
    800086e0:	00004917          	auipc	s2,0x4
    800086e4:	5d090913          	addi	s2,s2,1488 # 8000ccb0 <kmem>
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
    80008750:	00002517          	auipc	a0,0x2
    80008754:	23850513          	addi	a0,a0,568 # 8000a988 <digits+0x18>
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
    8000877c:	00006797          	auipc	a5,0x6
    80008780:	86478793          	addi	a5,a5,-1948 # 8000dfe0 <end>
    80008784:	00050493          	mv	s1,a0
    80008788:	04f56463          	bltu	a0,a5,800087d0 <kfree+0x70>
    8000878c:	01100793          	li	a5,17
    80008790:	01b79793          	slli	a5,a5,0x1b
    80008794:	02f57e63          	bgeu	a0,a5,800087d0 <kfree+0x70>
    80008798:	00001637          	lui	a2,0x1
    8000879c:	00100593          	li	a1,1
    800087a0:	00000097          	auipc	ra,0x0
    800087a4:	478080e7          	jalr	1144(ra) # 80008c18 <__memset>
    800087a8:	00004797          	auipc	a5,0x4
    800087ac:	50878793          	addi	a5,a5,1288 # 8000ccb0 <kmem>
    800087b0:	0007b703          	ld	a4,0(a5)
    800087b4:	01813083          	ld	ra,24(sp)
    800087b8:	01013403          	ld	s0,16(sp)
    800087bc:	00e4b023          	sd	a4,0(s1)
    800087c0:	0097b023          	sd	s1,0(a5)
    800087c4:	00813483          	ld	s1,8(sp)
    800087c8:	02010113          	addi	sp,sp,32
    800087cc:	00008067          	ret
    800087d0:	00002517          	auipc	a0,0x2
    800087d4:	1b850513          	addi	a0,a0,440 # 8000a988 <digits+0x18>
    800087d8:	fffff097          	auipc	ra,0xfffff
    800087dc:	354080e7          	jalr	852(ra) # 80007b2c <panic>

00000000800087e0 <kalloc>:
    800087e0:	fe010113          	addi	sp,sp,-32
    800087e4:	00813823          	sd	s0,16(sp)
    800087e8:	00913423          	sd	s1,8(sp)
    800087ec:	00113c23          	sd	ra,24(sp)
    800087f0:	02010413          	addi	s0,sp,32
    800087f4:	00004797          	auipc	a5,0x4
    800087f8:	4bc78793          	addi	a5,a5,1212 # 8000ccb0 <kmem>
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
    80008900:	00002517          	auipc	a0,0x2
    80008904:	09050513          	addi	a0,a0,144 # 8000a990 <digits+0x20>
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
    80008948:	00002517          	auipc	a0,0x2
    8000894c:	05050513          	addi	a0,a0,80 # 8000a998 <digits+0x28>
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
    800089d0:	00002517          	auipc	a0,0x2
    800089d4:	fe850513          	addi	a0,a0,-24 # 8000a9b8 <digits+0x48>
    800089d8:	fffff097          	auipc	ra,0xfffff
    800089dc:	154080e7          	jalr	340(ra) # 80007b2c <panic>
    800089e0:	00002517          	auipc	a0,0x2
    800089e4:	fc050513          	addi	a0,a0,-64 # 8000a9a0 <digits+0x30>
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
    80008b0c:	00002517          	auipc	a0,0x2
    80008b10:	eac50513          	addi	a0,a0,-340 # 8000a9b8 <digits+0x48>
    80008b14:	fffff097          	auipc	ra,0xfffff
    80008b18:	018080e7          	jalr	24(ra) # 80007b2c <panic>
    80008b1c:	00002517          	auipc	a0,0x2
    80008b20:	e8450513          	addi	a0,a0,-380 # 8000a9a0 <digits+0x30>
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
    80008bf8:	00002517          	auipc	a0,0x2
    80008bfc:	de850513          	addi	a0,a0,-536 # 8000a9e0 <digits+0x70>
    80008c00:	fffff097          	auipc	ra,0xfffff
    80008c04:	f2c080e7          	jalr	-212(ra) # 80007b2c <panic>
    80008c08:	00002517          	auipc	a0,0x2
    80008c0c:	db850513          	addi	a0,a0,-584 # 8000a9c0 <digits+0x50>
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

0000000080008fac <__putc>:
    80008fac:	fe010113          	addi	sp,sp,-32
    80008fb0:	00813823          	sd	s0,16(sp)
    80008fb4:	00113c23          	sd	ra,24(sp)
    80008fb8:	02010413          	addi	s0,sp,32
    80008fbc:	00050793          	mv	a5,a0
    80008fc0:	fef40593          	addi	a1,s0,-17
    80008fc4:	00100613          	li	a2,1
    80008fc8:	00000513          	li	a0,0
    80008fcc:	fef407a3          	sb	a5,-17(s0)
    80008fd0:	fffff097          	auipc	ra,0xfffff
    80008fd4:	b3c080e7          	jalr	-1220(ra) # 80007b0c <console_write>
    80008fd8:	01813083          	ld	ra,24(sp)
    80008fdc:	01013403          	ld	s0,16(sp)
    80008fe0:	02010113          	addi	sp,sp,32
    80008fe4:	00008067          	ret

0000000080008fe8 <__getc>:
    80008fe8:	fe010113          	addi	sp,sp,-32
    80008fec:	00813823          	sd	s0,16(sp)
    80008ff0:	00113c23          	sd	ra,24(sp)
    80008ff4:	02010413          	addi	s0,sp,32
    80008ff8:	fe840593          	addi	a1,s0,-24
    80008ffc:	00100613          	li	a2,1
    80009000:	00000513          	li	a0,0
    80009004:	fffff097          	auipc	ra,0xfffff
    80009008:	ae8080e7          	jalr	-1304(ra) # 80007aec <console_read>
    8000900c:	fe844503          	lbu	a0,-24(s0)
    80009010:	01813083          	ld	ra,24(sp)
    80009014:	01013403          	ld	s0,16(sp)
    80009018:	02010113          	addi	sp,sp,32
    8000901c:	00008067          	ret

0000000080009020 <console_handler>:
    80009020:	fe010113          	addi	sp,sp,-32
    80009024:	00813823          	sd	s0,16(sp)
    80009028:	00113c23          	sd	ra,24(sp)
    8000902c:	00913423          	sd	s1,8(sp)
    80009030:	02010413          	addi	s0,sp,32
    80009034:	14202773          	csrr	a4,scause
    80009038:	100027f3          	csrr	a5,sstatus
    8000903c:	0027f793          	andi	a5,a5,2
    80009040:	06079e63          	bnez	a5,800090bc <console_handler+0x9c>
    80009044:	00074c63          	bltz	a4,8000905c <console_handler+0x3c>
    80009048:	01813083          	ld	ra,24(sp)
    8000904c:	01013403          	ld	s0,16(sp)
    80009050:	00813483          	ld	s1,8(sp)
    80009054:	02010113          	addi	sp,sp,32
    80009058:	00008067          	ret
    8000905c:	0ff77713          	andi	a4,a4,255
    80009060:	00900793          	li	a5,9
    80009064:	fef712e3          	bne	a4,a5,80009048 <console_handler+0x28>
    80009068:	ffffe097          	auipc	ra,0xffffe
    8000906c:	6dc080e7          	jalr	1756(ra) # 80007744 <plic_claim>
    80009070:	00a00793          	li	a5,10
    80009074:	00050493          	mv	s1,a0
    80009078:	02f50c63          	beq	a0,a5,800090b0 <console_handler+0x90>
    8000907c:	fc0506e3          	beqz	a0,80009048 <console_handler+0x28>
    80009080:	00050593          	mv	a1,a0
    80009084:	00002517          	auipc	a0,0x2
    80009088:	86450513          	addi	a0,a0,-1948 # 8000a8e8 <CONSOLE_STATUS+0x8d8>
    8000908c:	fffff097          	auipc	ra,0xfffff
    80009090:	afc080e7          	jalr	-1284(ra) # 80007b88 <__printf>
    80009094:	01013403          	ld	s0,16(sp)
    80009098:	01813083          	ld	ra,24(sp)
    8000909c:	00048513          	mv	a0,s1
    800090a0:	00813483          	ld	s1,8(sp)
    800090a4:	02010113          	addi	sp,sp,32
    800090a8:	ffffe317          	auipc	t1,0xffffe
    800090ac:	6d430067          	jr	1748(t1) # 8000777c <plic_complete>
    800090b0:	fffff097          	auipc	ra,0xfffff
    800090b4:	3e0080e7          	jalr	992(ra) # 80008490 <uartintr>
    800090b8:	fddff06f          	j	80009094 <console_handler+0x74>
    800090bc:	00002517          	auipc	a0,0x2
    800090c0:	92c50513          	addi	a0,a0,-1748 # 8000a9e8 <digits+0x78>
    800090c4:	fffff097          	auipc	ra,0xfffff
    800090c8:	a68080e7          	jalr	-1432(ra) # 80007b2c <panic>
	...
