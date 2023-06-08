
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000c117          	auipc	sp,0xc
    80000004:	ae813103          	ld	sp,-1304(sp) # 8000bae8 <_GLOBAL_OFFSET_TABLE_+0x40>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	569060ef          	jal	ra,80006d84 <start>

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
    80001664:	5107c783          	lbu	a5,1296(a5) # 8000bb70 <_ZN8KConsole11initializedE>
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
    80001688:	4ec48493          	addi	s1,s1,1260 # 8000bb70 <_ZN8KConsole11initializedE>
    8000168c:	0000a797          	auipc	a5,0xa
    80001690:	42c7b783          	ld	a5,1068(a5) # 8000bab8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001694:	0007b783          	ld	a5,0(a5)
    80001698:	00f4b423          	sd	a5,8(s1)
	sr = (uint8*)CONSOLE_STATUS;
    8000169c:	0000a797          	auipc	a5,0xa
    800016a0:	42c7b783          	ld	a5,1068(a5) # 8000bac8 <_GLOBAL_OFFSET_TABLE_+0x20>
    800016a4:	0007b783          	ld	a5,0(a5)
    800016a8:	00f4b823          	sd	a5,16(s1)
	sem_open(&inputBufferHasSpace, capacity);
    800016ac:	03200593          	li	a1,50
    800016b0:	0000a517          	auipc	a0,0xa
    800016b4:	4d850513          	addi	a0,a0,1240 # 8000bb88 <_ZN8KConsole19inputBufferHasSpaceE>
    800016b8:	00000097          	auipc	ra,0x0
    800016bc:	de8080e7          	jalr	-536(ra) # 800014a0 <_Z8sem_openPP4KSemj>
	sem_open(&outputBufferHasSpace, capacity);
    800016c0:	03200593          	li	a1,50
    800016c4:	0000a517          	auipc	a0,0xa
    800016c8:	4cc50513          	addi	a0,a0,1228 # 8000bb90 <_ZN8KConsole20outputBufferHasSpaceE>
    800016cc:	00000097          	auipc	ra,0x0
    800016d0:	dd4080e7          	jalr	-556(ra) # 800014a0 <_Z8sem_openPP4KSemj>
	sem_open(&charsToInput, 0);
    800016d4:	00000593          	li	a1,0
    800016d8:	0000a517          	auipc	a0,0xa
    800016dc:	4c050513          	addi	a0,a0,1216 # 8000bb98 <_ZN8KConsole12charsToInputE>
    800016e0:	00000097          	auipc	ra,0x0
    800016e4:	dc0080e7          	jalr	-576(ra) # 800014a0 <_Z8sem_openPP4KSemj>
	sem_open(&charsToOutput, 0);
    800016e8:	00000593          	li	a1,0
    800016ec:	0000a517          	auipc	a0,0xa
    800016f0:	4b450513          	addi	a0,a0,1204 # 8000bba0 <_ZN8KConsole13charsToOutputE>
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
    80001738:	400080e7          	jalr	1024(ra) # 80005b34 <_Z11printStringPKc>
	printInteger((uint64)dr);
    8000173c:	0000a497          	auipc	s1,0xa
    80001740:	43448493          	addi	s1,s1,1076 # 8000bb70 <_ZN8KConsole11initializedE>
    80001744:	0084b503          	ld	a0,8(s1)
    80001748:	00000097          	auipc	ra,0x0
    8000174c:	250080e7          	jalr	592(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    80001750:	00008517          	auipc	a0,0x8
    80001754:	e1850513          	addi	a0,a0,-488 # 80009568 <CONSOLE_STATUS+0x558>
    80001758:	00004097          	auipc	ra,0x4
    8000175c:	3dc080e7          	jalr	988(ra) # 80005b34 <_Z11printStringPKc>
	printString("CONSOLE_STATUS = ");
    80001760:	00008517          	auipc	a0,0x8
    80001764:	8d050513          	addi	a0,a0,-1840 # 80009030 <CONSOLE_STATUS+0x20>
    80001768:	00004097          	auipc	ra,0x4
    8000176c:	3cc080e7          	jalr	972(ra) # 80005b34 <_Z11printStringPKc>
	printInteger((uint64)sr);
    80001770:	0104b503          	ld	a0,16(s1)
    80001774:	00000097          	auipc	ra,0x0
    80001778:	224080e7          	jalr	548(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    8000177c:	00008517          	auipc	a0,0x8
    80001780:	dec50513          	addi	a0,a0,-532 # 80009568 <CONSOLE_STATUS+0x558>
    80001784:	00004097          	auipc	ra,0x4
    80001788:	3b0080e7          	jalr	944(ra) # 80005b34 <_Z11printStringPKc>
	printString("*CONSOLE_RX = ");
    8000178c:	00008517          	auipc	a0,0x8
    80001790:	8bc50513          	addi	a0,a0,-1860 # 80009048 <CONSOLE_STATUS+0x38>
    80001794:	00004097          	auipc	ra,0x4
    80001798:	3a0080e7          	jalr	928(ra) # 80005b34 <_Z11printStringPKc>
	printInteger(*dr);
    8000179c:	0084b783          	ld	a5,8(s1)
    800017a0:	0007c503          	lbu	a0,0(a5)
    800017a4:	00000097          	auipc	ra,0x0
    800017a8:	1f4080e7          	jalr	500(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    800017ac:	00008517          	auipc	a0,0x8
    800017b0:	dbc50513          	addi	a0,a0,-580 # 80009568 <CONSOLE_STATUS+0x558>
    800017b4:	00004097          	auipc	ra,0x4
    800017b8:	380080e7          	jalr	896(ra) # 80005b34 <_Z11printStringPKc>
	printString("*CONSOLE_STATUS = ");
    800017bc:	00008517          	auipc	a0,0x8
    800017c0:	89c50513          	addi	a0,a0,-1892 # 80009058 <CONSOLE_STATUS+0x48>
    800017c4:	00004097          	auipc	ra,0x4
    800017c8:	370080e7          	jalr	880(ra) # 80005b34 <_Z11printStringPKc>
	printInteger(*sr);
    800017cc:	0104b783          	ld	a5,16(s1)
    800017d0:	0007c503          	lbu	a0,0(a5)
    800017d4:	00000097          	auipc	ra,0x0
    800017d8:	1c4080e7          	jalr	452(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    800017dc:	00008517          	auipc	a0,0x8
    800017e0:	d8c50513          	addi	a0,a0,-628 # 80009568 <CONSOLE_STATUS+0x558>
    800017e4:	00004097          	auipc	ra,0x4
    800017e8:	350080e7          	jalr	848(ra) # 80005b34 <_Z11printStringPKc>
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
    80001818:	35c48493          	addi	s1,s1,860 # 8000bb70 <_ZN8KConsole11initializedE>
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
    8000185c:	38c72703          	lw	a4,908(a4) # 8000bbe4 <_ZN8KConsole15inputBufferSizeE>
    80001860:	03200793          	li	a5,50
    80001864:	04f70e63          	beq	a4,a5,800018c0 <_ZN8KConsole12placeInInputEc+0x68>
void KConsole::placeInInput(char c) {
    80001868:	ff010113          	addi	sp,sp,-16
    8000186c:	00113423          	sd	ra,8(sp)
    80001870:	00813023          	sd	s0,0(sp)
    80001874:	01010413          	addi	s0,sp,16
	inputBuffer[inputTail] = c;
    80001878:	0000a697          	auipc	a3,0xa
    8000187c:	2f868693          	addi	a3,a3,760 # 8000bb70 <_ZN8KConsole11initializedE>
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
    800018e4:	29048493          	addi	s1,s1,656 # 8000bb70 <_ZN8KConsole11initializedE>
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
    8000194c:	22848493          	addi	s1,s1,552 # 8000bb70 <_ZN8KConsole11initializedE>
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
    800019cc:	0000a797          	auipc	a5,0xa
    800019d0:	2647b783          	ld	a5,612(a5) # 8000bc30 <_ZN9Scheduler4tailE>
    800019d4:	00078e63          	beqz	a5,800019f0 <_ZN9Scheduler3putEP3TCB+0x30>
		head = tail = tcb;
	} else {
		tail->nextInScheduler = tcb;
    800019d8:	02a7bc23          	sd	a0,56(a5)
		tail = tcb;
    800019dc:	0000a797          	auipc	a5,0xa
    800019e0:	24a7ba23          	sd	a0,596(a5) # 8000bc30 <_ZN9Scheduler4tailE>
	}
}
    800019e4:	00813403          	ld	s0,8(sp)
    800019e8:	01010113          	addi	sp,sp,16
    800019ec:	00008067          	ret
		head = tail = tcb;
    800019f0:	0000a797          	auipc	a5,0xa
    800019f4:	24078793          	addi	a5,a5,576 # 8000bc30 <_ZN9Scheduler4tailE>
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
    80001a14:	22070713          	addi	a4,a4,544 # 8000bc30 <_ZN9Scheduler4tailE>
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
    80001a54:	1f083803          	ld	a6,496(a6) # 8000bc40 <_ZN9Scheduler12sleepingHeadE>
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
    80001a8c:	1aa7bc23          	sd	a0,440(a5) # 8000bc40 <_ZN9Scheduler12sleepingHeadE>
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
    80001ad4:	16a7b823          	sd	a0,368(a5) # 8000bc40 <_ZN9Scheduler12sleepingHeadE>
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
    80001af0:	1547b783          	ld	a5,340(a5) # 8000bc40 <_ZN9Scheduler12sleepingHeadE>
    80001af4:	06078a63          	beqz	a5,80001b68 <_ZN9Scheduler4wakeEv+0x7c>
	sleepingHead->timeToSleep--;
    80001af8:	0407b703          	ld	a4,64(a5)
    80001afc:	fff70713          	addi	a4,a4,-1
    80001b00:	04e7b023          	sd	a4,64(a5)
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001b04:	0000a517          	auipc	a0,0xa
    80001b08:	13c53503          	ld	a0,316(a0) # 8000bc40 <_ZN9Scheduler12sleepingHeadE>
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
    80001b3c:	10f73423          	sd	a5,264(a4) # 8000bc40 <_ZN9Scheduler12sleepingHeadE>
		thread->nextSleeping = nullptr;
    80001b40:	04053423          	sd	zero,72(a0)
		Scheduler::put(thread);
    80001b44:	00000097          	auipc	ra,0x0
    80001b48:	e7c080e7          	jalr	-388(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001b4c:	0000a517          	auipc	a0,0xa
    80001b50:	0f453503          	ld	a0,244(a0) # 8000bc40 <_ZN9Scheduler12sleepingHeadE>
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
    80001b88:	f8c7b783          	ld	a5,-116(a5) # 8000bb10 <_GLOBAL_OFFSET_TABLE_+0x68>
    80001b8c:	00078513          	mv	a0,a5
    80001b90:	00000097          	auipc	ra,0x0
    80001b94:	1c8080e7          	jalr	456(ra) # 80001d58 <_ZN5Riscv7w_stvecEm>

	MemoryAllocator::initMemoryAllocator();
    80001b98:	00001097          	auipc	ra,0x1
    80001b9c:	680080e7          	jalr	1664(ra) # 80003218 <_ZN15MemoryAllocator19initMemoryAllocatorEv>


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
    80001bc0:	e28080e7          	jalr	-472(ra) # 800029e4 <_ZN9SemaphoreC1Ej>
    80001bc4:	0000a797          	auipc	a5,0xa
    80001bc8:	08478793          	addi	a5,a5,132 # 8000bc48 <semA>
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
    80001bf8:	f0c7b783          	ld	a5,-244(a5) # 8000bb00 <_GLOBAL_OFFSET_TABLE_+0x58>
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
    80001c44:	e705b583          	ld	a1,-400(a1) # 8000bab0 <_GLOBAL_OFFSET_TABLE_+0x8>
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
    80001c74:	e707b783          	ld	a5,-400(a5) # 8000bae0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001c78:	0007a703          	lw	a4,0(a5)
    80001c7c:	0000a797          	auipc	a5,0xa
    80001c80:	ea47b783          	ld	a5,-348(a5) # 8000bb20 <_GLOBAL_OFFSET_TABLE_+0x78>
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
    80001cc0:	0dc080e7          	jalr	220(ra) # 8000cd98 <_Unwind_Resume>
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
    80001d14:	de07b783          	ld	a5,-544(a5) # 8000baf0 <_GLOBAL_OFFSET_TABLE_+0x48>
    80001d18:	0007b783          	ld	a5,0(a5)
    80001d1c:	00a78023          	sb	a0,0(a5)
		sem_signal(KConsole::outputBufferHasSpace);
    80001d20:	0000a797          	auipc	a5,0xa
    80001d24:	dd87b783          	ld	a5,-552(a5) # 8000baf8 <_GLOBAL_OFFSET_TABLE_+0x50>
    80001d28:	0007b503          	ld	a0,0(a5)
    80001d2c:	00000097          	auipc	ra,0x0
    80001d30:	80c080e7          	jalr	-2036(ra) # 80001538 <_Z10sem_signalP4KSem>
		char c = KConsole::getFromOutput();
    80001d34:	00000097          	auipc	ra,0x0
    80001d38:	acc080e7          	jalr	-1332(ra) # 80001800 <_ZN8KConsole13getFromOutputEv>
		while (!(*KConsole::sr & CONSOLE_TX_STATUS_BIT)) {}
    80001d3c:	0000a797          	auipc	a5,0xa
    80001d40:	dec7b783          	ld	a5,-532(a5) # 8000bb28 <_GLOBAL_OFFSET_TABLE_+0x80>
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
    80001ef8:	034080e7          	jalr	52(ra) # 80002f28 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
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
    80001f14:	1c4080e7          	jalr	452(ra) # 800030d4 <_ZN15MemoryAllocator5kfreeEPv>
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
    80001f50:	e08080e7          	jalr	-504(ra) # 80002d54 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80001f54:	00050713          	mv	a4,a0
    80001f58:	ef843783          	ld	a5,-264(s0)
    80001f5c:	00e7b023          	sd	a4,0(a5)
				TCB::start(*handle);
    80001f60:	ef843783          	ld	a5,-264(s0)
    80001f64:	0007b783          	ld	a5,0(a5)
    80001f68:	00078513          	mv	a0,a5
    80001f6c:	00001097          	auipc	ra,0x1
    80001f70:	f68080e7          	jalr	-152(ra) # 80002ed4 <_ZN3TCB5startEPS_>
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
    80001f98:	b6c7b783          	ld	a5,-1172(a5) # 8000bb00 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001f9c:	0007b783          	ld	a5,0(a5)
    80001fa0:	00100593          	li	a1,1
    80001fa4:	00078513          	mv	a0,a5
    80001fa8:	00000097          	auipc	ra,0x0
    80001fac:	59c080e7          	jalr	1436(ra) # 80002544 <_ZN3TCB11setFinishedEb>
				TCB::releaseJoined();
    80001fb0:	00001097          	auipc	ra,0x1
    80001fb4:	ec8080e7          	jalr	-312(ra) # 80002e78 <_ZN3TCB13releaseJoinedEv>
				TCB::yield();
    80001fb8:	00001097          	auipc	ra,0x1
    80001fbc:	d34080e7          	jalr	-716(ra) # 80002cec <_ZN3TCB5yieldEv>
				break;
    80001fc0:	3500006f          	j	80002310 <interruptRoutine+0x564>
			case 0x13:
				//thread_dispatch
				TCB::yield();
    80001fc4:	00001097          	auipc	ra,0x1
    80001fc8:	d28080e7          	jalr	-728(ra) # 80002cec <_ZN3TCB5yieldEv>
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
    80001fe0:	e54080e7          	jalr	-428(ra) # 80002e30 <_ZN3TCB10threadJoinEPS_>
				TCB::yield();
    80001fe4:	00001097          	auipc	ra,0x1
    80001fe8:	d08080e7          	jalr	-760(ra) # 80002cec <_ZN3TCB5yieldEv>
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
    8000200c:	2d4080e7          	jalr	724(ra) # 800032dc <_ZN4KSem7initSemEj>
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
    8000204c:	45c080e7          	jalr	1116(ra) # 800034a4 <_ZN4KSem8closeSemEPS_>
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
    80002068:	30c080e7          	jalr	780(ra) # 80003370 <_ZN4KSem4waitEv>
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
    80002084:	3a8080e7          	jalr	936(ra) # 80003428 <_ZN4KSem6signalEv>
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
    800020bc:	a487b783          	ld	a5,-1464(a5) # 8000bb00 <_GLOBAL_OFFSET_TABLE_+0x58>
    800020c0:	0007b783          	ld	a5,0(a5)
    800020c4:	f3043583          	ld	a1,-208(s0)
    800020c8:	00078513          	mv	a0,a5
    800020cc:	00000097          	auipc	ra,0x0
    800020d0:	978080e7          	jalr	-1672(ra) # 80001a44 <_ZN9Scheduler10putToSleepEP3TCBm>
					TCB::yield();
    800020d4:	00001097          	auipc	ra,0x1
    800020d8:	c18080e7          	jalr	-1000(ra) # 80002cec <_ZN3TCB5yieldEv>
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
    8000213c:	c1c080e7          	jalr	-996(ra) # 80002d54 <_ZN3TCB12createThreadEPFvPvES0_Pm>
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
    800021f4:	68868693          	addi	a3,a3,1672 # 8000b878 <_ZZ16interruptRoutineE6digits>
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
    800022b0:	888080e7          	jalr	-1912(ra) # 80005b34 <_Z11printStringPKc>
				printInteger(opCode);
    800022b4:	f7843503          	ld	a0,-136(s0)
    800022b8:	fffff097          	auipc	ra,0xfffff
    800022bc:	6e0080e7          	jalr	1760(ra) # 80001998 <_Z12printIntegerm>
				printString("\nscause: ");
    800022c0:	00007517          	auipc	a0,0x7
    800022c4:	dc850513          	addi	a0,a0,-568 # 80009088 <CONSOLE_STATUS+0x78>
    800022c8:	00004097          	auipc	ra,0x4
    800022cc:	86c080e7          	jalr	-1940(ra) # 80005b34 <_Z11printStringPKc>
				printInteger(scause);
    800022d0:	fd843503          	ld	a0,-40(s0)
    800022d4:	fffff097          	auipc	ra,0xfffff
    800022d8:	6c4080e7          	jalr	1732(ra) # 80001998 <_Z12printIntegerm>
				printString("\nsepc: ");
    800022dc:	00007517          	auipc	a0,0x7
    800022e0:	dbc50513          	addi	a0,a0,-580 # 80009098 <CONSOLE_STATUS+0x88>
    800022e4:	00004097          	auipc	ra,0x4
    800022e8:	850080e7          	jalr	-1968(ra) # 80005b34 <_Z11printStringPKc>
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
    8000234c:	29c080e7          	jalr	668(ra) # 800075e4 <plic_claim>
    80002350:	00050793          	mv	a5,a0
    80002354:	f8f43023          	sd	a5,-128(s0)
		if (irq == CONSOLE_IRQ) {
    80002358:	f8043703          	ld	a4,-128(s0)
    8000235c:	00a00793          	li	a5,10
    80002360:	04f71863          	bne	a4,a5,800023b0 <interruptRoutine+0x604>
			if (*KConsole::sr & CONSOLE_RX_STATUS_BIT) {
    80002364:	00009797          	auipc	a5,0x9
    80002368:	7c47b783          	ld	a5,1988(a5) # 8000bb28 <_GLOBAL_OFFSET_TABLE_+0x80>
    8000236c:	0007b783          	ld	a5,0(a5)
    80002370:	0007c783          	lbu	a5,0(a5)
    80002374:	0017f793          	andi	a5,a5,1
    80002378:	02078063          	beqz	a5,80002398 <interruptRoutine+0x5ec>
				KConsole::placeInInput(*KConsole::dr);
    8000237c:	00009797          	auipc	a5,0x9
    80002380:	7747b783          	ld	a5,1908(a5) # 8000baf0 <_GLOBAL_OFFSET_TABLE_+0x48>
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
    800023a8:	278080e7          	jalr	632(ra) # 8000761c <plic_complete>
    800023ac:	0140006f          	j	800023c0 <interruptRoutine+0x614>
			printString("Neki drugi prekid\n");
    800023b0:	00007517          	auipc	a0,0x7
    800023b4:	cf050513          	addi	a0,a0,-784 # 800090a0 <CONSOLE_STATUS+0x90>
    800023b8:	00003097          	auipc	ra,0x3
    800023bc:	77c080e7          	jalr	1916(ra) # 80005b34 <_Z11printStringPKc>
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
    80002408:	6bc7b783          	ld	a5,1724(a5) # 8000bac0 <_GLOBAL_OFFSET_TABLE_+0x18>
    8000240c:	0007b783          	ld	a5,0(a5)
    80002410:	00178713          	addi	a4,a5,1
    80002414:	00009797          	auipc	a5,0x9
    80002418:	6ac7b783          	ld	a5,1708(a5) # 8000bac0 <_GLOBAL_OFFSET_TABLE_+0x18>
    8000241c:	00e7b023          	sd	a4,0(a5)
		if (TCB::runningTimeSlice >= TCB::running->getTimeSlice()) {
    80002420:	00009797          	auipc	a5,0x9
    80002424:	6e07b783          	ld	a5,1760(a5) # 8000bb00 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002428:	0007b783          	ld	a5,0(a5)
    8000242c:	00078513          	mv	a0,a5
    80002430:	00000097          	auipc	ra,0x0
    80002434:	130080e7          	jalr	304(ra) # 80002560 <_ZN3TCB12getTimeSliceEv>
    80002438:	00050713          	mv	a4,a0
    8000243c:	00009797          	auipc	a5,0x9
    80002440:	6847b783          	ld	a5,1668(a5) # 8000bac0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002444:	0007b783          	ld	a5,0(a5)
    80002448:	00e7b7b3          	sltu	a5,a5,a4
    8000244c:	0017c793          	xori	a5,a5,1
    80002450:	0ff7f793          	andi	a5,a5,255
    80002454:	00078c63          	beqz	a5,8000246c <interruptRoutine+0x6c0>
			TCB::yield();
    80002458:	00001097          	auipc	ra,0x1
    8000245c:	894080e7          	jalr	-1900(ra) # 80002cec <_ZN3TCB5yieldEv>
			TCB::runningTimeSlice = 0;
    80002460:	00009797          	auipc	a5,0x9
    80002464:	6607b783          	ld	a5,1632(a5) # 8000bac0 <_GLOBAL_OFFSET_TABLE_+0x18>
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
    800024a0:	698080e7          	jalr	1688(ra) # 80005b34 <_Z11printStringPKc>
		printString("scause: ");
    800024a4:	00007517          	auipc	a0,0x7
    800024a8:	c3450513          	addi	a0,a0,-972 # 800090d8 <CONSOLE_STATUS+0xc8>
    800024ac:	00003097          	auipc	ra,0x3
    800024b0:	688080e7          	jalr	1672(ra) # 80005b34 <_Z11printStringPKc>
		printInteger(scause);
    800024b4:	fd843503          	ld	a0,-40(s0)
    800024b8:	fffff097          	auipc	ra,0xfffff
    800024bc:	4e0080e7          	jalr	1248(ra) # 80001998 <_Z12printIntegerm>
		printString("\nsepc: ");
    800024c0:	00007517          	auipc	a0,0x7
    800024c4:	bd850513          	addi	a0,a0,-1064 # 80009098 <CONSOLE_STATUS+0x88>
    800024c8:	00003097          	auipc	ra,0x3
    800024cc:	66c080e7          	jalr	1644(ra) # 80005b34 <_Z11printStringPKc>
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
	if (thread != nullptr) {
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
    800025cc:	30078793          	addi	a5,a5,768 # 8000b8c8 <_ZTV6Thread+0x10>
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
    80002610:	7fc080e7          	jalr	2044(ra) # 80002e08 <_ZN3TCBdlEPv>
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
    80002644:	2b078793          	addi	a5,a5,688 # 8000b8f0 <_ZTV9Semaphore+0x10>
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
    80002688:	c30080e7          	jalr	-976(ra) # 800032b4 <_ZN4KSemdlEPv>
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
    800027ec:	0e078793          	addi	a5,a5,224 # 8000b8c8 <_ZTV6Thread+0x10>
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
    800028f4:	2107b783          	ld	a5,528(a5) # 8000bb00 <_GLOBAL_OFFSET_TABLE_+0x58>
    800028f8:	0007b503          	ld	a0,0(a5)
    800028fc:	fffff097          	auipc	ra,0xfffff
    80002900:	148080e7          	jalr	328(ra) # 80001a44 <_ZN9Scheduler10putToSleepEP3TCBm>
}
    80002904:	00000513          	li	a0,0
    80002908:	00813083          	ld	ra,8(sp)
    8000290c:	00013403          	ld	s0,0(sp)
    80002910:	01010113          	addi	sp,sp,16
    80002914:	00008067          	ret

0000000080002918 <_ZN14PeriodicThread15periodicWrapperEPv>:
}

PeriodicThread::PeriodicThread(time_t period) : Thread(periodicWrapper, this), period(period) {
}

void PeriodicThread::periodicWrapper(void* pThread) {
    80002918:	fe010113          	addi	sp,sp,-32
    8000291c:	00113c23          	sd	ra,24(sp)
    80002920:	00813823          	sd	s0,16(sp)
    80002924:	00913423          	sd	s1,8(sp)
    80002928:	02010413          	addi	s0,sp,32
    8000292c:	00050493          	mv	s1,a0
	if (pThread != nullptr) {
    80002930:	02050263          	beqz	a0,80002954 <_ZN14PeriodicThread15periodicWrapperEPv+0x3c>
		PeriodicThread* ptr = (PeriodicThread*)pThread;
		while (1) {
			ptr->periodicActivation();
    80002934:	0004b783          	ld	a5,0(s1)
    80002938:	0187b783          	ld	a5,24(a5)
    8000293c:	00048513          	mv	a0,s1
    80002940:	000780e7          	jalr	a5
			Thread::sleep(ptr->period);
    80002944:	0204b503          	ld	a0,32(s1)
    80002948:	00000097          	auipc	ra,0x0
    8000294c:	f94080e7          	jalr	-108(ra) # 800028dc <_ZN6Thread5sleepEm>
		while (1) {
    80002950:	fe5ff06f          	j	80002934 <_ZN14PeriodicThread15periodicWrapperEPv+0x1c>
		}
	}
}
    80002954:	01813083          	ld	ra,24(sp)
    80002958:	01013403          	ld	s0,16(sp)
    8000295c:	00813483          	ld	s1,8(sp)
    80002960:	02010113          	addi	sp,sp,32
    80002964:	00008067          	ret

0000000080002968 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80002968:	fe010113          	addi	sp,sp,-32
    8000296c:	00113c23          	sd	ra,24(sp)
    80002970:	00813823          	sd	s0,16(sp)
    80002974:	00913423          	sd	s1,8(sp)
    80002978:	02010413          	addi	s0,sp,32
    8000297c:	00050493          	mv	s1,a0
    80002980:	00009797          	auipc	a5,0x9
    80002984:	f4878793          	addi	a5,a5,-184 # 8000b8c8 <_ZTV6Thread+0x10>
    80002988:	00f53023          	sd	a5,0(a0)
	this->body = wrapper;
    8000298c:	00000797          	auipc	a5,0x0
    80002990:	bf078793          	addi	a5,a5,-1040 # 8000257c <_ZN6Thread7wrapperEPv>
    80002994:	00f53823          	sd	a5,16(a0)
	this->arg = this;
    80002998:	00a53c23          	sd	a0,24(a0)
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    8000299c:	00001537          	lui	a0,0x1
    800029a0:	fffff097          	auipc	ra,0xfffff
    800029a4:	970080e7          	jalr	-1680(ra) # 80001310 <_Z9mem_allocm>
    800029a8:	00050313          	mv	t1,a0
	__asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800029ac:	00030713          	mv	a4,t1
	__asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800029b0:	0184b303          	ld	t1,24(s1)
    800029b4:	00030693          	mv	a3,t1
			body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800029b8:	0104b303          	ld	t1,16(s1)
    800029bc:	00030613          	mv	a2,t1
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800029c0:	00848493          	addi	s1,s1,8
    800029c4:	00048593          	mv	a1,s1
	__asm__ volatile("li a0, 0x80");
    800029c8:	08000513          	li	a0,128
	__asm__ volatile("ecall");
    800029cc:	00000073          	ecall
}
    800029d0:	01813083          	ld	ra,24(sp)
    800029d4:	01013403          	ld	s0,16(sp)
    800029d8:	00813483          	ld	s1,8(sp)
    800029dc:	02010113          	addi	sp,sp,32
    800029e0:	00008067          	ret

00000000800029e4 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    800029e4:	ff010113          	addi	sp,sp,-16
    800029e8:	00113423          	sd	ra,8(sp)
    800029ec:	00813023          	sd	s0,0(sp)
    800029f0:	01010413          	addi	s0,sp,16
    800029f4:	00009797          	auipc	a5,0x9
    800029f8:	efc78793          	addi	a5,a5,-260 # 8000b8f0 <_ZTV9Semaphore+0x10>
    800029fc:	00f53023          	sd	a5,0(a0) # 1000 <_entry-0x7ffff000>
	sem_open(&myHandle, init);
    80002a00:	00850513          	addi	a0,a0,8
    80002a04:	fffff097          	auipc	ra,0xfffff
    80002a08:	a9c080e7          	jalr	-1380(ra) # 800014a0 <_Z8sem_openPP4KSemj>
}
    80002a0c:	00813083          	ld	ra,8(sp)
    80002a10:	00013403          	ld	s0,0(sp)
    80002a14:	01010113          	addi	sp,sp,16
    80002a18:	00008067          	ret

0000000080002a1c <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    80002a1c:	ff010113          	addi	sp,sp,-16
    80002a20:	00113423          	sd	ra,8(sp)
    80002a24:	00813023          	sd	s0,0(sp)
    80002a28:	01010413          	addi	s0,sp,16
	return sem_wait(myHandle);
    80002a2c:	00853503          	ld	a0,8(a0)
    80002a30:	fffff097          	auipc	ra,0xfffff
    80002a34:	ad8080e7          	jalr	-1320(ra) # 80001508 <_Z8sem_waitP4KSem>
}
    80002a38:	00813083          	ld	ra,8(sp)
    80002a3c:	00013403          	ld	s0,0(sp)
    80002a40:	01010113          	addi	sp,sp,16
    80002a44:	00008067          	ret

0000000080002a48 <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    80002a48:	ff010113          	addi	sp,sp,-16
    80002a4c:	00113423          	sd	ra,8(sp)
    80002a50:	00813023          	sd	s0,0(sp)
    80002a54:	01010413          	addi	s0,sp,16
	return sem_signal(myHandle);
    80002a58:	00853503          	ld	a0,8(a0)
    80002a5c:	fffff097          	auipc	ra,0xfffff
    80002a60:	adc080e7          	jalr	-1316(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    80002a64:	00813083          	ld	ra,8(sp)
    80002a68:	00013403          	ld	s0,0(sp)
    80002a6c:	01010113          	addi	sp,sp,16
    80002a70:	00008067          	ret

0000000080002a74 <_ZN14PeriodicThread9terminateEv>:
void PeriodicThread::terminate() {
    80002a74:	ff010113          	addi	sp,sp,-16
    80002a78:	00813423          	sd	s0,8(sp)
    80002a7c:	01010413          	addi	s0,sp,16
}
    80002a80:	00813403          	ld	s0,8(sp)
    80002a84:	01010113          	addi	sp,sp,16
    80002a88:	00008067          	ret

0000000080002a8c <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period) : Thread(periodicWrapper, this), period(period) {
    80002a8c:	fe010113          	addi	sp,sp,-32
    80002a90:	00113c23          	sd	ra,24(sp)
    80002a94:	00813823          	sd	s0,16(sp)
    80002a98:	00913423          	sd	s1,8(sp)
    80002a9c:	01213023          	sd	s2,0(sp)
    80002aa0:	02010413          	addi	s0,sp,32
    80002aa4:	00050493          	mv	s1,a0
    80002aa8:	00058913          	mv	s2,a1
    80002aac:	00050613          	mv	a2,a0
    80002ab0:	00000597          	auipc	a1,0x0
    80002ab4:	e6858593          	addi	a1,a1,-408 # 80002918 <_ZN14PeriodicThread15periodicWrapperEPv>
    80002ab8:	00000097          	auipc	ra,0x0
    80002abc:	d08080e7          	jalr	-760(ra) # 800027c0 <_ZN6ThreadC1EPFvPvES0_>
    80002ac0:	00009797          	auipc	a5,0x9
    80002ac4:	dd878793          	addi	a5,a5,-552 # 8000b898 <_ZTV14PeriodicThread+0x10>
    80002ac8:	00f4b023          	sd	a5,0(s1)
    80002acc:	0324b023          	sd	s2,32(s1)
}
    80002ad0:	01813083          	ld	ra,24(sp)
    80002ad4:	01013403          	ld	s0,16(sp)
    80002ad8:	00813483          	ld	s1,8(sp)
    80002adc:	00013903          	ld	s2,0(sp)
    80002ae0:	02010113          	addi	sp,sp,32
    80002ae4:	00008067          	ret

0000000080002ae8 <_ZN7Console4getcEv>:

char Console::getc() {
    80002ae8:	ff010113          	addi	sp,sp,-16
    80002aec:	00113423          	sd	ra,8(sp)
    80002af0:	00813023          	sd	s0,0(sp)
    80002af4:	01010413          	addi	s0,sp,16
	return ::getc();
    80002af8:	fffff097          	auipc	ra,0xfffff
    80002afc:	a70080e7          	jalr	-1424(ra) # 80001568 <_Z4getcv>
}
    80002b00:	00813083          	ld	ra,8(sp)
    80002b04:	00013403          	ld	s0,0(sp)
    80002b08:	01010113          	addi	sp,sp,16
    80002b0c:	00008067          	ret

0000000080002b10 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80002b10:	ff010113          	addi	sp,sp,-16
    80002b14:	00113423          	sd	ra,8(sp)
    80002b18:	00813023          	sd	s0,0(sp)
    80002b1c:	01010413          	addi	s0,sp,16
	::putc(c);
    80002b20:	fffff097          	auipc	ra,0xfffff
    80002b24:	a70080e7          	jalr	-1424(ra) # 80001590 <_Z4putcc>
}
    80002b28:	00813083          	ld	ra,8(sp)
    80002b2c:	00013403          	ld	s0,0(sp)
    80002b30:	01010113          	addi	sp,sp,16
    80002b34:	00008067          	ret

0000000080002b38 <_ZN6Thread3runEv>:
	static int sleep(time_t);

protected:
	Thread();

	virtual void run() {}
    80002b38:	ff010113          	addi	sp,sp,-16
    80002b3c:	00813423          	sd	s0,8(sp)
    80002b40:	01010413          	addi	s0,sp,16
    80002b44:	00813403          	ld	s0,8(sp)
    80002b48:	01010113          	addi	sp,sp,16
    80002b4c:	00008067          	ret

0000000080002b50 <_ZN14PeriodicThread18periodicActivationEv>:
	void terminate();

protected:
	PeriodicThread(time_t period);

	virtual void periodicActivation() {}
    80002b50:	ff010113          	addi	sp,sp,-16
    80002b54:	00813423          	sd	s0,8(sp)
    80002b58:	01010413          	addi	s0,sp,16
    80002b5c:	00813403          	ld	s0,8(sp)
    80002b60:	01010113          	addi	sp,sp,16
    80002b64:	00008067          	ret

0000000080002b68 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80002b68:	ff010113          	addi	sp,sp,-16
    80002b6c:	00113423          	sd	ra,8(sp)
    80002b70:	00813023          	sd	s0,0(sp)
    80002b74:	01010413          	addi	s0,sp,16
    80002b78:	00009797          	auipc	a5,0x9
    80002b7c:	d2078793          	addi	a5,a5,-736 # 8000b898 <_ZTV14PeriodicThread+0x10>
    80002b80:	00f53023          	sd	a5,0(a0)
    80002b84:	00000097          	auipc	ra,0x0
    80002b88:	a2c080e7          	jalr	-1492(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80002b8c:	00813083          	ld	ra,8(sp)
    80002b90:	00013403          	ld	s0,0(sp)
    80002b94:	01010113          	addi	sp,sp,16
    80002b98:	00008067          	ret

0000000080002b9c <_ZN14PeriodicThreadD0Ev>:
    80002b9c:	fe010113          	addi	sp,sp,-32
    80002ba0:	00113c23          	sd	ra,24(sp)
    80002ba4:	00813823          	sd	s0,16(sp)
    80002ba8:	00913423          	sd	s1,8(sp)
    80002bac:	02010413          	addi	s0,sp,32
    80002bb0:	00050493          	mv	s1,a0
    80002bb4:	00009797          	auipc	a5,0x9
    80002bb8:	ce478793          	addi	a5,a5,-796 # 8000b898 <_ZTV14PeriodicThread+0x10>
    80002bbc:	00f53023          	sd	a5,0(a0)
    80002bc0:	00000097          	auipc	ra,0x0
    80002bc4:	9f0080e7          	jalr	-1552(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80002bc8:	00048513          	mv	a0,s1
    80002bcc:	00000097          	auipc	ra,0x0
    80002bd0:	b24080e7          	jalr	-1244(ra) # 800026f0 <_ZdlPv>
    80002bd4:	01813083          	ld	ra,24(sp)
    80002bd8:	01013403          	ld	s0,16(sp)
    80002bdc:	00813483          	ld	s1,8(sp)
    80002be0:	02010113          	addi	sp,sp,32
    80002be4:	00008067          	ret

0000000080002be8 <_ZN3TCB7wrapperEv>:
	Riscv::pushRegisters();
	TCB::dispatch();
	Riscv::popRegisters();
}

void TCB::wrapper() {
    80002be8:	ff010113          	addi	sp,sp,-16
    80002bec:	00113423          	sd	ra,8(sp)
    80002bf0:	00813023          	sd	s0,0(sp)
    80002bf4:	01010413          	addi	s0,sp,16
	//pocetak wrappera se izvrsava u supervisor modu,
	//jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch/yield)
	Riscv::popSppSpie();
    80002bf8:	00000097          	auipc	ra,0x0
    80002bfc:	310080e7          	jalr	784(ra) # 80002f08 <_ZN5Riscv10popSppSpieEv>
	//na dalje se izvrsavamo u user modu
	running->threadFunction(running->args);
    80002c00:	00009797          	auipc	a5,0x9
    80002c04:	0507b783          	ld	a5,80(a5) # 8000bc50 <_ZN3TCB7runningE>
    80002c08:	0107b703          	ld	a4,16(a5)
    80002c0c:	0207b503          	ld	a0,32(a5)
    80002c10:	000700e7          	jalr	a4
	//running->finished = true;
	//i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
	thread_exit();
    80002c14:	ffffe097          	auipc	ra,0xffffe
    80002c18:	7ec080e7          	jalr	2028(ra) # 80001400 <_Z11thread_exitv>
}
    80002c1c:	00813083          	ld	ra,8(sp)
    80002c20:	00013403          	ld	s0,0(sp)
    80002c24:	01010113          	addi	sp,sp,16
    80002c28:	00008067          	ret

0000000080002c2c <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80002c2c:	fe010113          	addi	sp,sp,-32
    80002c30:	00113c23          	sd	ra,24(sp)
    80002c34:	00813823          	sd	s0,16(sp)
    80002c38:	00913423          	sd	s1,8(sp)
    80002c3c:	02010413          	addi	s0,sp,32
	TCB* old = TCB::running;
    80002c40:	00009497          	auipc	s1,0x9
    80002c44:	0104b483          	ld	s1,16(s1) # 8000bc50 <_ZN3TCB7runningE>
	if (!old->finished && !old->blocked && old->timeToSleep == 0 && !old->needToJoin) {
    80002c48:	0304c783          	lbu	a5,48(s1)
    80002c4c:	00079e63          	bnez	a5,80002c68 <_ZN3TCB8dispatchEv+0x3c>
    80002c50:	0314c783          	lbu	a5,49(s1)
    80002c54:	00079a63          	bnez	a5,80002c68 <_ZN3TCB8dispatchEv+0x3c>
    80002c58:	0404b783          	ld	a5,64(s1)
    80002c5c:	00079663          	bnez	a5,80002c68 <_ZN3TCB8dispatchEv+0x3c>
    80002c60:	0324c783          	lbu	a5,50(s1)
    80002c64:	04078663          	beqz	a5,80002cb0 <_ZN3TCB8dispatchEv+0x84>
	TCB::running = Scheduler::get();
    80002c68:	fffff097          	auipc	ra,0xfffff
    80002c6c:	d9c080e7          	jalr	-612(ra) # 80001a04 <_ZN9Scheduler3getEv>
    80002c70:	00050593          	mv	a1,a0
    80002c74:	00009797          	auipc	a5,0x9
    80002c78:	fdc78793          	addi	a5,a5,-36 # 8000bc50 <_ZN3TCB7runningE>
    80002c7c:	00a7b023          	sd	a0,0(a5)
	TCB::runningTimeSlice = 0;
    80002c80:	0007b423          	sd	zero,8(a5)
	if (TCB::running->threadFunction == nullptr || TCB::running->threadFunction == kernelConsumerFunction ||
    80002c84:	01053783          	ld	a5,16(a0)
    80002c88:	02078c63          	beqz	a5,80002cc0 <_ZN3TCB8dispatchEv+0x94>
    80002c8c:	00009717          	auipc	a4,0x9
    80002c90:	e4c73703          	ld	a4,-436(a4) # 8000bad8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002c94:	02e78663          	beq	a5,a4,80002cc0 <_ZN3TCB8dispatchEv+0x94>
    80002c98:	00009717          	auipc	a4,0x9
    80002c9c:	e8073703          	ld	a4,-384(a4) # 8000bb18 <_GLOBAL_OFFSET_TABLE_+0x70>
    80002ca0:	02e78063          	beq	a5,a4,80002cc0 <_ZN3TCB8dispatchEv+0x94>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002ca4:	10000793          	li	a5,256
    80002ca8:	1007b073          	csrc	sstatus,a5
}
    80002cac:	01c0006f          	j	80002cc8 <_ZN3TCB8dispatchEv+0x9c>
		Scheduler::put(old);
    80002cb0:	00048513          	mv	a0,s1
    80002cb4:	fffff097          	auipc	ra,0xfffff
    80002cb8:	d0c080e7          	jalr	-756(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
    80002cbc:	fadff06f          	j	80002c68 <_ZN3TCB8dispatchEv+0x3c>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80002cc0:	10000793          	li	a5,256
    80002cc4:	1007a073          	csrs	sstatus,a5
	if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    80002cc8:	00b48863          	beq	s1,a1,80002cd8 <_ZN3TCB8dispatchEv+0xac>
    80002ccc:	00048513          	mv	a0,s1
    80002cd0:	ffffe097          	auipc	ra,0xffffe
    80002cd4:	540080e7          	jalr	1344(ra) # 80001210 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80002cd8:	01813083          	ld	ra,24(sp)
    80002cdc:	01013403          	ld	s0,16(sp)
    80002ce0:	00813483          	ld	s1,8(sp)
    80002ce4:	02010113          	addi	sp,sp,32
    80002ce8:	00008067          	ret

0000000080002cec <_ZN3TCB5yieldEv>:
void TCB::yield() {
    80002cec:	ff010113          	addi	sp,sp,-16
    80002cf0:	00113423          	sd	ra,8(sp)
    80002cf4:	00813023          	sd	s0,0(sp)
    80002cf8:	01010413          	addi	s0,sp,16
	Riscv::pushRegisters();
    80002cfc:	ffffe097          	auipc	ra,0xffffe
    80002d00:	304080e7          	jalr	772(ra) # 80001000 <_ZN5Riscv13pushRegistersEv>
	TCB::dispatch();
    80002d04:	00000097          	auipc	ra,0x0
    80002d08:	f28080e7          	jalr	-216(ra) # 80002c2c <_ZN3TCB8dispatchEv>
	Riscv::popRegisters();
    80002d0c:	ffffe097          	auipc	ra,0xffffe
    80002d10:	370080e7          	jalr	880(ra) # 8000107c <_ZN5Riscv12popRegistersEv>
}
    80002d14:	00813083          	ld	ra,8(sp)
    80002d18:	00013403          	ld	s0,0(sp)
    80002d1c:	01010113          	addi	sp,sp,16
    80002d20:	00008067          	ret

0000000080002d24 <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    80002d24:	ff010113          	addi	sp,sp,-16
    80002d28:	00113423          	sd	ra,8(sp)
    80002d2c:	00813023          	sd	s0,0(sp)
    80002d30:	01010413          	addi	s0,sp,16
	return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::THREAD);
    80002d34:	00200593          	li	a1,2
    80002d38:	02050513          	addi	a0,a0,32
    80002d3c:	00000097          	auipc	ra,0x0
    80002d40:	1ec080e7          	jalr	492(ra) # 80002f28 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
}
    80002d44:	00813083          	ld	ra,8(sp)
    80002d48:	00013403          	ld	s0,0(sp)
    80002d4c:	01010113          	addi	sp,sp,16
    80002d50:	00008067          	ret

0000000080002d54 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    80002d54:	fd010113          	addi	sp,sp,-48
    80002d58:	02113423          	sd	ra,40(sp)
    80002d5c:	02813023          	sd	s0,32(sp)
    80002d60:	00913c23          	sd	s1,24(sp)
    80002d64:	01213823          	sd	s2,16(sp)
    80002d68:	01313423          	sd	s3,8(sp)
    80002d6c:	03010413          	addi	s0,sp,48
    80002d70:	00050913          	mv	s2,a0
    80002d74:	00058993          	mv	s3,a1
    80002d78:	00060493          	mv	s1,a2
	TCB* newThread = new TCB(function, args, stack);
    80002d7c:	06000513          	li	a0,96
    80002d80:	00000097          	auipc	ra,0x0
    80002d84:	fa4080e7          	jalr	-92(ra) # 80002d24 <_ZN3TCBnwEm>


	TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
													timeSlice(DEFAULT_TIME_SLICE), finished(false), blocked(false),
													needToJoin(false),
													nextInScheduler(nullptr), timeToSleep(0), nextSleeping(nullptr) {
    80002d88:	01253823          	sd	s2,16(a0)
    80002d8c:	00953c23          	sd	s1,24(a0)
    80002d90:	03353023          	sd	s3,32(a0)
    80002d94:	00200793          	li	a5,2
    80002d98:	02f53423          	sd	a5,40(a0)
    80002d9c:	02050823          	sb	zero,48(a0)
    80002da0:	020508a3          	sb	zero,49(a0)
    80002da4:	02050923          	sb	zero,50(a0)
    80002da8:	02053c23          	sd	zero,56(a0)
    80002dac:	04053023          	sd	zero,64(a0)
    80002db0:	04053423          	sd	zero,72(a0)
	ThreadQueue() : front(nullptr), back(nullptr) {}
    80002db4:	04053823          	sd	zero,80(a0)
    80002db8:	04053c23          	sd	zero,88(a0)
		//formiranje pocetnog konteksta; specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80002dbc:	02090e63          	beqz	s2,80002df8 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xa4>
    80002dc0:	00000797          	auipc	a5,0x0
    80002dc4:	e2878793          	addi	a5,a5,-472 # 80002be8 <_ZN3TCB7wrapperEv>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80002dc8:	02048c63          	beqz	s1,80002e00 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xac>
    80002dcc:	00008637          	lui	a2,0x8
    80002dd0:	00c484b3          	add	s1,s1,a2
		this->context.ra = startRa;
    80002dd4:	00f53023          	sd	a5,0(a0)
		this->context.sp = startSp;
    80002dd8:	00953423          	sd	s1,8(a0)
}
    80002ddc:	02813083          	ld	ra,40(sp)
    80002de0:	02013403          	ld	s0,32(sp)
    80002de4:	01813483          	ld	s1,24(sp)
    80002de8:	01013903          	ld	s2,16(sp)
    80002dec:	00813983          	ld	s3,8(sp)
    80002df0:	03010113          	addi	sp,sp,48
    80002df4:	00008067          	ret
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80002df8:	00000793          	li	a5,0
    80002dfc:	fcdff06f          	j	80002dc8 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x74>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80002e00:	00000493          	li	s1,0
    80002e04:	fd1ff06f          	j	80002dd4 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x80>

0000000080002e08 <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    80002e08:	ff010113          	addi	sp,sp,-16
    80002e0c:	00113423          	sd	ra,8(sp)
    80002e10:	00813023          	sd	s0,0(sp)
    80002e14:	01010413          	addi	s0,sp,16
	MemoryAllocator::kfree(ptr);
    80002e18:	00000097          	auipc	ra,0x0
    80002e1c:	2bc080e7          	jalr	700(ra) # 800030d4 <_ZN15MemoryAllocator5kfreeEPv>
}
    80002e20:	00813083          	ld	ra,8(sp)
    80002e24:	00013403          	ld	s0,0(sp)
    80002e28:	01010113          	addi	sp,sp,16
    80002e2c:	00008067          	ret

0000000080002e30 <_ZN3TCB10threadJoinEPS_>:

void TCB::threadJoin(TCB* handle) {
	if (handle->finished) return;
    80002e30:	03054783          	lbu	a5,48(a0)
    80002e34:	00078463          	beqz	a5,80002e3c <_ZN3TCB10threadJoinEPS_+0xc>
    80002e38:	00008067          	ret
void TCB::threadJoin(TCB* handle) {
    80002e3c:	ff010113          	addi	sp,sp,-16
    80002e40:	00113423          	sd	ra,8(sp)
    80002e44:	00813023          	sd	s0,0(sp)
    80002e48:	01010413          	addi	s0,sp,16
	TCB::running->needToJoin = true;
    80002e4c:	00009597          	auipc	a1,0x9
    80002e50:	e045b583          	ld	a1,-508(a1) # 8000bc50 <_ZN3TCB7runningE>
    80002e54:	00100793          	li	a5,1
    80002e58:	02f58923          	sb	a5,50(a1)
	handle->waitingToJoin.putLast(TCB::running);
    80002e5c:	05050513          	addi	a0,a0,80
    80002e60:	ffffe097          	auipc	ra,0xffffe
    80002e64:	3e4080e7          	jalr	996(ra) # 80001244 <_ZN11ThreadQueue7putLastEP3TCB>
}
    80002e68:	00813083          	ld	ra,8(sp)
    80002e6c:	00013403          	ld	s0,0(sp)
    80002e70:	01010113          	addi	sp,sp,16
    80002e74:	00008067          	ret

0000000080002e78 <_ZN3TCB13releaseJoinedEv>:

void TCB::releaseJoined() {
	while (!TCB::running->waitingToJoin.isEmpty()) {
    80002e78:	00009517          	auipc	a0,0x9
    80002e7c:	dd853503          	ld	a0,-552(a0) # 8000bc50 <_ZN3TCB7runningE>
		return front == nullptr;
    80002e80:	05053783          	ld	a5,80(a0)
    80002e84:	04078663          	beqz	a5,80002ed0 <_ZN3TCB13releaseJoinedEv+0x58>
void TCB::releaseJoined() {
    80002e88:	ff010113          	addi	sp,sp,-16
    80002e8c:	00113423          	sd	ra,8(sp)
    80002e90:	00813023          	sd	s0,0(sp)
    80002e94:	01010413          	addi	s0,sp,16
		TCB* tcb = TCB::running->waitingToJoin.getFirst();
    80002e98:	05050513          	addi	a0,a0,80
    80002e9c:	ffffe097          	auipc	ra,0xffffe
    80002ea0:	414080e7          	jalr	1044(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
		tcb->needToJoin = false;
    80002ea4:	02050923          	sb	zero,50(a0)
		Scheduler::put(tcb);
    80002ea8:	fffff097          	auipc	ra,0xfffff
    80002eac:	b18080e7          	jalr	-1256(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
	while (!TCB::running->waitingToJoin.isEmpty()) {
    80002eb0:	00009517          	auipc	a0,0x9
    80002eb4:	da053503          	ld	a0,-608(a0) # 8000bc50 <_ZN3TCB7runningE>
    80002eb8:	05053783          	ld	a5,80(a0)
    80002ebc:	fc079ee3          	bnez	a5,80002e98 <_ZN3TCB13releaseJoinedEv+0x20>
	}
}
    80002ec0:	00813083          	ld	ra,8(sp)
    80002ec4:	00013403          	ld	s0,0(sp)
    80002ec8:	01010113          	addi	sp,sp,16
    80002ecc:	00008067          	ret
    80002ed0:	00008067          	ret

0000000080002ed4 <_ZN3TCB5startEPS_>:

void TCB::start(TCB* newTcb) {
	//startovanje niti(stavljanje u Scheduler); main nit je vec aktivna, ne stavlja se u Scheduler
	if (newTcb->threadFunction != nullptr) Scheduler::put(newTcb);
    80002ed4:	01053783          	ld	a5,16(a0)
    80002ed8:	02078663          	beqz	a5,80002f04 <_ZN3TCB5startEPS_+0x30>
void TCB::start(TCB* newTcb) {
    80002edc:	ff010113          	addi	sp,sp,-16
    80002ee0:	00113423          	sd	ra,8(sp)
    80002ee4:	00813023          	sd	s0,0(sp)
    80002ee8:	01010413          	addi	s0,sp,16
	if (newTcb->threadFunction != nullptr) Scheduler::put(newTcb);
    80002eec:	fffff097          	auipc	ra,0xfffff
    80002ef0:	ad4080e7          	jalr	-1324(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
}
    80002ef4:	00813083          	ld	ra,8(sp)
    80002ef8:	00013403          	ld	s0,0(sp)
    80002efc:	01010113          	addi	sp,sp,16
    80002f00:	00008067          	ret
    80002f04:	00008067          	ret

0000000080002f08 <_ZN5Riscv10popSppSpieEv>:
// Created by os on 5/17/23.
//

#include "../h/Riscv.hpp"

void Riscv::popSppSpie() {
    80002f08:	ff010113          	addi	sp,sp,-16
    80002f0c:	00813423          	sd	s0,8(sp)
    80002f10:	01010413          	addi	s0,sp,16
	//ra pokazuje iza ove funkcije na nastavak wrappera
	__asm__ volatile("csrw sepc, ra");
    80002f14:	14109073          	csrw	sepc,ra
	__asm__ volatile("sret");
    80002f18:	10200073          	sret
    80002f1c:	00813403          	ld	s0,8(sp)
    80002f20:	01010113          	addi	sp,sp,16
    80002f24:	00008067          	ret

0000000080002f28 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>:

bool MemoryAllocator::initialized = false;
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

void* MemoryAllocator::kmalloc(size_t size, Purpose pur) {
    80002f28:	ff010113          	addi	sp,sp,-16
    80002f2c:	00813423          	sd	s0,8(sp)
    80002f30:	01010413          	addi	s0,sp,16
	//size je u broju bajtova, ukljucuje i mesto potrebno za zaglavlje UsedMemSegment
	if (size <= 0) return nullptr;
    80002f34:	12050863          	beqz	a0,80003064 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x13c>


	//alokacija uvek zaokruzena na blokove
	//size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
	size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80002f38:	00655793          	srli	a5,a0,0x6
    80002f3c:	03f57513          	andi	a0,a0,63
    80002f40:	00050463          	beqz	a0,80002f48 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x20>
    80002f44:	00100513          	li	a0,1
    80002f48:	00a78533          	add	a0,a5,a0
	size = blocks * MEM_BLOCK_SIZE;
    80002f4c:	00651793          	slli	a5,a0,0x6

	//trazenje slobodnog segmenta po first-fit algoritmu
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80002f50:	00009517          	auipc	a0,0x9
    80002f54:	d1053503          	ld	a0,-752(a0) # 8000bc60 <_ZN15MemoryAllocator11freeMemHeadE>
    80002f58:	0e050863          	beqz	a0,80003048 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x120>
		if (current->size < size) continue;
    80002f5c:	01053703          	ld	a4,16(a0)
    80002f60:	06f76a63          	bltu	a4,a5,80002fd4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xac>

		//pravljenje novog slobodnog fragmenta od ostatka fragmenta
		FreeMemSegment* remainderFree = (FreeMemSegment*)((char*)current + size);
    80002f64:	00f506b3          	add	a3,a0,a5
		size_t remainingSize = current->size - size;
    80002f68:	40f70633          	sub	a2,a4,a5
		if (remainingSize <= sizeof(UsedMemSegment)) {
    80002f6c:	02000813          	li	a6,32
    80002f70:	06c86e63          	bltu	a6,a2,80002fec <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xc4>
			//ne preostaje dovoljno veliki slobodni segment;dodeljujemo ceo trenutno alociranom
			size += remainingSize;
			if (current->prev) current->prev->next = current->next;
    80002f74:	00853783          	ld	a5,8(a0)
    80002f78:	00078663          	beqz	a5,80002f84 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x5c>
    80002f7c:	00053683          	ld	a3,0(a0)
    80002f80:	00d7b023          	sd	a3,0(a5)
			if (current->next) current->next->prev = current->prev;
    80002f84:	00053783          	ld	a5,0(a0)
    80002f88:	00078663          	beqz	a5,80002f94 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x6c>
    80002f8c:	00853683          	ld	a3,8(a0)
    80002f90:	00d7b423          	sd	a3,8(a5)
			if (freeMemHead == current) { freeMemHead = current->next; }
    80002f94:	00009797          	auipc	a5,0x9
    80002f98:	ccc7b783          	ld	a5,-820(a5) # 8000bc60 <_ZN15MemoryAllocator11freeMemHeadE>
    80002f9c:	04a78063          	beq	a5,a0,80002fdc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xb4>
			if (current->next) current->next->prev = remainderFree;
			if (freeMemHead == current) { freeMemHead = remainderFree; }
		}
		//ubacivanje novog fragmenta u listu zauzetih fragmenata
		UsedMemSegment* newFragment = (UsedMemSegment*)current;
		newFragment->size = size;
    80002fa0:	00e53423          	sd	a4,8(a0)
		newFragment->purpose = pur;
    80002fa4:	00b52823          	sw	a1,16(a0)
		newFragment->usableFirstAddress = (char*)newFragment + sizeof(UsedMemSegment);
    80002fa8:	02050793          	addi	a5,a0,32
    80002fac:	00f53c23          	sd	a5,24(a0)
		UsedMemSegment* prevUsed = nullptr;
		for (UsedMemSegment* cur = usedMemHead;
    80002fb0:	00009697          	auipc	a3,0x9
    80002fb4:	cb86b683          	ld	a3,-840(a3) # 8000bc68 <_ZN15MemoryAllocator11usedMemHeadE>
    80002fb8:	00068793          	mv	a5,a3
		UsedMemSegment* prevUsed = nullptr;
    80002fbc:	00000713          	li	a4,0
			 cur && ((char*)cur < (char*)newFragment); cur = cur->next) {
    80002fc0:	06078a63          	beqz	a5,80003034 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x10c>
    80002fc4:	06a7f863          	bgeu	a5,a0,80003034 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x10c>
			prevUsed = cur;
    80002fc8:	00078713          	mv	a4,a5
			 cur && ((char*)cur < (char*)newFragment); cur = cur->next) {
    80002fcc:	0007b783          	ld	a5,0(a5)
		for (UsedMemSegment* cur = usedMemHead;
    80002fd0:	ff1ff06f          	j	80002fc0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x98>
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80002fd4:	00053503          	ld	a0,0(a0)
    80002fd8:	f81ff06f          	j	80002f58 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x30>
			if (freeMemHead == current) { freeMemHead = current->next; }
    80002fdc:	00053783          	ld	a5,0(a0)
    80002fe0:	00009697          	auipc	a3,0x9
    80002fe4:	c8f6b023          	sd	a5,-896(a3) # 8000bc60 <_ZN15MemoryAllocator11freeMemHeadE>
    80002fe8:	fb9ff06f          	j	80002fa0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x78>
			remainderFree->size = remainingSize;
    80002fec:	00c6b823          	sd	a2,16(a3)
			remainderFree->prev = current->prev;
    80002ff0:	00853703          	ld	a4,8(a0)
    80002ff4:	00e6b423          	sd	a4,8(a3)
			if (current->prev) current->prev->next = remainderFree;
    80002ff8:	00070463          	beqz	a4,80003000 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xd8>
    80002ffc:	00d73023          	sd	a3,0(a4)
			remainderFree->next = current->next;
    80003000:	00053703          	ld	a4,0(a0)
    80003004:	00e6b023          	sd	a4,0(a3)
			if (current->next) current->next->prev = remainderFree;
    80003008:	00070463          	beqz	a4,80003010 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xe8>
    8000300c:	00d73423          	sd	a3,8(a4)
			if (freeMemHead == current) { freeMemHead = remainderFree; }
    80003010:	00009717          	auipc	a4,0x9
    80003014:	c5073703          	ld	a4,-944(a4) # 8000bc60 <_ZN15MemoryAllocator11freeMemHeadE>
    80003018:	00a70663          	beq	a4,a0,80003024 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xfc>
	size = blocks * MEM_BLOCK_SIZE;
    8000301c:	00078713          	mv	a4,a5
    80003020:	f81ff06f          	j	80002fa0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x78>
			if (freeMemHead == current) { freeMemHead = remainderFree; }
    80003024:	00009717          	auipc	a4,0x9
    80003028:	c2d73e23          	sd	a3,-964(a4) # 8000bc60 <_ZN15MemoryAllocator11freeMemHeadE>
	size = blocks * MEM_BLOCK_SIZE;
    8000302c:	00078713          	mv	a4,a5
    80003030:	f71ff06f          	j	80002fa0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x78>
		}
		if (!prevUsed) {
    80003034:	02070063          	beqz	a4,80003054 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x12c>
			newFragment->next = usedMemHead;
			usedMemHead = newFragment;
		} else {
			newFragment->next = prevUsed->next;
    80003038:	00073783          	ld	a5,0(a4)
    8000303c:	00f53023          	sd	a5,0(a0)
			prevUsed->next = newFragment;
    80003040:	00a73023          	sd	a0,0(a4)
		}
		//return (char*)newFragment + sizeof(UsedMemSegment);
		return newFragment->usableFirstAddress;
    80003044:	01853503          	ld	a0,24(a0)
	}
	return nullptr;
}
    80003048:	00813403          	ld	s0,8(sp)
    8000304c:	01010113          	addi	sp,sp,16
    80003050:	00008067          	ret
			newFragment->next = usedMemHead;
    80003054:	00d53023          	sd	a3,0(a0)
			usedMemHead = newFragment;
    80003058:	00009797          	auipc	a5,0x9
    8000305c:	c0a7b823          	sd	a0,-1008(a5) # 8000bc68 <_ZN15MemoryAllocator11usedMemHeadE>
    80003060:	fe5ff06f          	j	80003044 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x11c>
	if (size <= 0) return nullptr;
    80003064:	00000513          	li	a0,0
    80003068:	fe1ff06f          	j	80003048 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x120>

000000008000306c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:
	tryToJoin(newFree);
	tryToJoin(prevFree);
	return 0;
}

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    8000306c:	ff010113          	addi	sp,sp,-16
    80003070:	00813423          	sd	s0,8(sp)
    80003074:	01010413          	addi	s0,sp,16
	if (!current) return 0;
    80003078:	04050663          	beqz	a0,800030c4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x58>
	bool nextExists = current->next != nullptr;
    8000307c:	00053783          	ld	a5,0(a0)
	char* nextAddr = (char*)current + current->size;
    80003080:	01053703          	ld	a4,16(a0)
    80003084:	00e506b3          	add	a3,a0,a4
	char* cnext = (char*)current->next;
	bool nextIsConnected = (nextAddr == cnext);
	if (nextExists && nextIsConnected) {
    80003088:	04078263          	beqz	a5,800030cc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x60>
    8000308c:	00d78a63          	beq	a5,a3,800030a0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x34>
		current->size += current->next->size;
		current->next = current->next->next;
		if (current->next) current->next->prev = current;
		return 1;
	} else return 0;
    80003090:	00000513          	li	a0,0
}
    80003094:	00813403          	ld	s0,8(sp)
    80003098:	01010113          	addi	sp,sp,16
    8000309c:	00008067          	ret
		current->size += current->next->size;
    800030a0:	0107b683          	ld	a3,16(a5)
    800030a4:	00d70733          	add	a4,a4,a3
    800030a8:	00e53823          	sd	a4,16(a0)
		current->next = current->next->next;
    800030ac:	0007b783          	ld	a5,0(a5)
    800030b0:	00f53023          	sd	a5,0(a0)
		if (current->next) current->next->prev = current;
    800030b4:	00078463          	beqz	a5,800030bc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x50>
    800030b8:	00a7b423          	sd	a0,8(a5)
		return 1;
    800030bc:	00100513          	li	a0,1
    800030c0:	fd5ff06f          	j	80003094 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	if (!current) return 0;
    800030c4:	00000513          	li	a0,0
    800030c8:	fcdff06f          	j	80003094 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	} else return 0;
    800030cc:	00000513          	li	a0,0
    800030d0:	fc5ff06f          	j	80003094 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>

00000000800030d4 <_ZN15MemoryAllocator5kfreeEPv>:
	if (!ptr) return 0;
    800030d4:	10050463          	beqz	a0,800031dc <_ZN15MemoryAllocator5kfreeEPv+0x108>
    800030d8:	00050693          	mv	a3,a0
	if (!usedMemHead) return -1;
    800030dc:	00009797          	auipc	a5,0x9
    800030e0:	b8c7b783          	ld	a5,-1140(a5) # 8000bc68 <_ZN15MemoryAllocator11usedMemHeadE>
    800030e4:	10078063          	beqz	a5,800031e4 <_ZN15MemoryAllocator5kfreeEPv+0x110>
	ptr = (char*)ptr - sizeof(UsedMemSegment);
    800030e8:	fe050513          	addi	a0,a0,-32
	UsedMemSegment* prevUsed = nullptr;
    800030ec:	00000713          	li	a4,0
	for (; currentUsed && ((char*)currentUsed != (char*)ptr); currentUsed = currentUsed->next) {
    800030f0:	00078a63          	beqz	a5,80003104 <_ZN15MemoryAllocator5kfreeEPv+0x30>
    800030f4:	00a78863          	beq	a5,a0,80003104 <_ZN15MemoryAllocator5kfreeEPv+0x30>
		prevUsed = currentUsed;
    800030f8:	00078713          	mv	a4,a5
	for (; currentUsed && ((char*)currentUsed != (char*)ptr); currentUsed = currentUsed->next) {
    800030fc:	0007b783          	ld	a5,0(a5)
    80003100:	ff1ff06f          	j	800030f0 <_ZN15MemoryAllocator5kfreeEPv+0x1c>
	if ((char*)currentUsed != (char*)ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80003104:	0ea79463          	bne	a5,a0,800031ec <_ZN15MemoryAllocator5kfreeEPv+0x118>
int MemoryAllocator::kfree(void* ptr) {
    80003108:	fe010113          	addi	sp,sp,-32
    8000310c:	00113c23          	sd	ra,24(sp)
    80003110:	00813823          	sd	s0,16(sp)
    80003114:	00913423          	sd	s1,8(sp)
    80003118:	02010413          	addi	s0,sp,32
	if (prevUsed) prevUsed->next = currentUsed->next;
    8000311c:	02070863          	beqz	a4,8000314c <_ZN15MemoryAllocator5kfreeEPv+0x78>
    80003120:	0007b783          	ld	a5,0(a5)
    80003124:	00f73023          	sd	a5,0(a4)
	if (!freeMemHead || ((char*)ptr < (char*)freeMemHead)) {
    80003128:	00009797          	auipc	a5,0x9
    8000312c:	b387b783          	ld	a5,-1224(a5) # 8000bc60 <_ZN15MemoryAllocator11freeMemHeadE>
    80003130:	02078663          	beqz	a5,8000315c <_ZN15MemoryAllocator5kfreeEPv+0x88>
    80003134:	02f56863          	bltu	a0,a5,80003164 <_ZN15MemoryAllocator5kfreeEPv+0x90>
			 prevFree->next && (char*)ptr > (char*)(prevFree->next); prevFree = prevFree->next);
    80003138:	00078493          	mv	s1,a5
    8000313c:	0007b783          	ld	a5,0(a5)
    80003140:	02078463          	beqz	a5,80003168 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80003144:	fea7eae3          	bltu	a5,a0,80003138 <_ZN15MemoryAllocator5kfreeEPv+0x64>
    80003148:	0200006f          	j	80003168 <_ZN15MemoryAllocator5kfreeEPv+0x94>
	else usedMemHead = currentUsed->next;
    8000314c:	0007b783          	ld	a5,0(a5)
    80003150:	00009717          	auipc	a4,0x9
    80003154:	b0f73c23          	sd	a5,-1256(a4) # 8000bc68 <_ZN15MemoryAllocator11usedMemHeadE>
    80003158:	fd1ff06f          	j	80003128 <_ZN15MemoryAllocator5kfreeEPv+0x54>
		prevFree = nullptr;
    8000315c:	00078493          	mv	s1,a5
    80003160:	0080006f          	j	80003168 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80003164:	00000493          	li	s1,0
	size_t segmentSize = ((UsedMemSegment*)ptr)->size;
    80003168:	fe86b783          	ld	a5,-24(a3)
	newFree->size = segmentSize;
    8000316c:	fef6b823          	sd	a5,-16(a3)
	newFree->prev = prevFree;
    80003170:	fe96b423          	sd	s1,-24(a3)
	if (prevFree) newFree->next = prevFree->next;
    80003174:	04048663          	beqz	s1,800031c0 <_ZN15MemoryAllocator5kfreeEPv+0xec>
    80003178:	0004b783          	ld	a5,0(s1)
    8000317c:	fef6b023          	sd	a5,-32(a3)
	if (newFree->next) newFree->next->prev = newFree;
    80003180:	fe06b783          	ld	a5,-32(a3)
    80003184:	00078463          	beqz	a5,8000318c <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    80003188:	00a7b423          	sd	a0,8(a5)
	if (prevFree) prevFree->next = newFree;
    8000318c:	04048263          	beqz	s1,800031d0 <_ZN15MemoryAllocator5kfreeEPv+0xfc>
    80003190:	00a4b023          	sd	a0,0(s1)
	tryToJoin(newFree);
    80003194:	00000097          	auipc	ra,0x0
    80003198:	ed8080e7          	jalr	-296(ra) # 8000306c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	tryToJoin(prevFree);
    8000319c:	00048513          	mv	a0,s1
    800031a0:	00000097          	auipc	ra,0x0
    800031a4:	ecc080e7          	jalr	-308(ra) # 8000306c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	return 0;
    800031a8:	00000513          	li	a0,0
}
    800031ac:	01813083          	ld	ra,24(sp)
    800031b0:	01013403          	ld	s0,16(sp)
    800031b4:	00813483          	ld	s1,8(sp)
    800031b8:	02010113          	addi	sp,sp,32
    800031bc:	00008067          	ret
	else newFree->next = freeMemHead;
    800031c0:	00009797          	auipc	a5,0x9
    800031c4:	aa07b783          	ld	a5,-1376(a5) # 8000bc60 <_ZN15MemoryAllocator11freeMemHeadE>
    800031c8:	fef6b023          	sd	a5,-32(a3)
    800031cc:	fb5ff06f          	j	80003180 <_ZN15MemoryAllocator5kfreeEPv+0xac>
	else freeMemHead = newFree;
    800031d0:	00009797          	auipc	a5,0x9
    800031d4:	a8a7b823          	sd	a0,-1392(a5) # 8000bc60 <_ZN15MemoryAllocator11freeMemHeadE>
    800031d8:	fbdff06f          	j	80003194 <_ZN15MemoryAllocator5kfreeEPv+0xc0>
	if (!ptr) return 0;
    800031dc:	00000513          	li	a0,0
    800031e0:	00008067          	ret
	if (!usedMemHead) return -1;
    800031e4:	fff00513          	li	a0,-1
    800031e8:	00008067          	ret
	if ((char*)currentUsed != (char*)ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    800031ec:	fff00513          	li	a0,-1
}
    800031f0:	00008067          	ret

00000000800031f4 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>:

bool MemoryAllocator::checkPurpose(void* ptr, MemoryAllocator::Purpose p) {
    800031f4:	ff010113          	addi	sp,sp,-16
    800031f8:	00813423          	sd	s0,8(sp)
    800031fc:	01010413          	addi	s0,sp,16
	ptr = (char*)ptr - sizeof(UsedMemSegment);
	return ((UsedMemSegment*)ptr)->purpose == p;
    80003200:	ff052503          	lw	a0,-16(a0)
    80003204:	40b50533          	sub	a0,a0,a1
}
    80003208:	00153513          	seqz	a0,a0
    8000320c:	00813403          	ld	s0,8(sp)
    80003210:	01010113          	addi	sp,sp,16
    80003214:	00008067          	ret

0000000080003218 <_ZN15MemoryAllocator19initMemoryAllocatorEv>:

void MemoryAllocator::initMemoryAllocator() {
    80003218:	ff010113          	addi	sp,sp,-16
    8000321c:	00813423          	sd	s0,8(sp)
    80003220:	01010413          	addi	s0,sp,16
//pocetna inicijalizacija
	if (!initialized) {
    80003224:	00009797          	auipc	a5,0x9
    80003228:	a4c7c783          	lbu	a5,-1460(a5) # 8000bc70 <_ZN15MemoryAllocator11initializedE>
    8000322c:	04079663          	bnez	a5,80003278 <_ZN15MemoryAllocator19initMemoryAllocatorEv+0x60>
		freeMemHead = (FreeMemSegment*)HEAP_START_ADDR;
    80003230:	00009617          	auipc	a2,0x9
    80003234:	8a063603          	ld	a2,-1888(a2) # 8000bad0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003238:	00063703          	ld	a4,0(a2)
    8000323c:	00009797          	auipc	a5,0x9
    80003240:	a2478793          	addi	a5,a5,-1500 # 8000bc60 <_ZN15MemoryAllocator11freeMemHeadE>
    80003244:	00e7b023          	sd	a4,0(a5)
		freeMemHead->next = nullptr;
    80003248:	00073023          	sd	zero,0(a4)
		freeMemHead->prev = nullptr;
    8000324c:	0007b683          	ld	a3,0(a5)
    80003250:	0006b423          	sd	zero,8(a3)
		freeMemHead->size = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR;//- sizeof(FreeMemSegment);
    80003254:	00009717          	auipc	a4,0x9
    80003258:	8b473703          	ld	a4,-1868(a4) # 8000bb08 <_GLOBAL_OFFSET_TABLE_+0x60>
    8000325c:	00073703          	ld	a4,0(a4)
    80003260:	00063603          	ld	a2,0(a2)
    80003264:	40c70733          	sub	a4,a4,a2
    80003268:	00e6b823          	sd	a4,16(a3)
		usedMemHead = nullptr;
    8000326c:	0007b423          	sd	zero,8(a5)

		initialized = true;
    80003270:	00100713          	li	a4,1
    80003274:	00e78823          	sb	a4,16(a5)
	}
}
    80003278:	00813403          	ld	s0,8(sp)
    8000327c:	01010113          	addi	sp,sp,16
    80003280:	00008067          	ret

0000000080003284 <_ZN4KSemnwEm>:

#include "../h/KSem.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void* KSem::operator new(size_t size) {
    80003284:	ff010113          	addi	sp,sp,-16
    80003288:	00113423          	sd	ra,8(sp)
    8000328c:	00813023          	sd	s0,0(sp)
    80003290:	01010413          	addi	s0,sp,16
	return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::SEMAPHORE);
    80003294:	00100593          	li	a1,1
    80003298:	02050513          	addi	a0,a0,32
    8000329c:	00000097          	auipc	ra,0x0
    800032a0:	c8c080e7          	jalr	-884(ra) # 80002f28 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
}
    800032a4:	00813083          	ld	ra,8(sp)
    800032a8:	00013403          	ld	s0,0(sp)
    800032ac:	01010113          	addi	sp,sp,16
    800032b0:	00008067          	ret

00000000800032b4 <_ZN4KSemdlEPv>:

void KSem::operator delete(void* ptr) {
    800032b4:	ff010113          	addi	sp,sp,-16
    800032b8:	00113423          	sd	ra,8(sp)
    800032bc:	00813023          	sd	s0,0(sp)
    800032c0:	01010413          	addi	s0,sp,16
	MemoryAllocator::kfree(ptr);
    800032c4:	00000097          	auipc	ra,0x0
    800032c8:	e10080e7          	jalr	-496(ra) # 800030d4 <_ZN15MemoryAllocator5kfreeEPv>
}
    800032cc:	00813083          	ld	ra,8(sp)
    800032d0:	00013403          	ld	s0,0(sp)
    800032d4:	01010113          	addi	sp,sp,16
    800032d8:	00008067          	ret

00000000800032dc <_ZN4KSem7initSemEj>:

KSem* KSem::initSem(uint val) {
    800032dc:	fe010113          	addi	sp,sp,-32
    800032e0:	00113c23          	sd	ra,24(sp)
    800032e4:	00813823          	sd	s0,16(sp)
    800032e8:	00913423          	sd	s1,8(sp)
    800032ec:	02010413          	addi	s0,sp,32
    800032f0:	00050493          	mv	s1,a0
	return new KSem(val);
    800032f4:	02000513          	li	a0,32
    800032f8:	00000097          	auipc	ra,0x0
    800032fc:	f8c080e7          	jalr	-116(ra) # 80003284 <_ZN4KSemnwEm>
	void block();

	void unblock();

private:
	KSem(uint val) : val(val), working(true) {}
    80003300:	00952023          	sw	s1,0(a0)
	ThreadQueue() : front(nullptr), back(nullptr) {}
    80003304:	00053423          	sd	zero,8(a0)
    80003308:	00053823          	sd	zero,16(a0)
    8000330c:	00100713          	li	a4,1
    80003310:	00e50c23          	sb	a4,24(a0)
}
    80003314:	01813083          	ld	ra,24(sp)
    80003318:	01013403          	ld	s0,16(sp)
    8000331c:	00813483          	ld	s1,8(sp)
    80003320:	02010113          	addi	sp,sp,32
    80003324:	00008067          	ret

0000000080003328 <_ZN4KSem5blockEv>:
		unblock();
	}
	return 0;
}

void KSem::block() {
    80003328:	ff010113          	addi	sp,sp,-16
    8000332c:	00113423          	sd	ra,8(sp)
    80003330:	00813023          	sd	s0,0(sp)
    80003334:	01010413          	addi	s0,sp,16
	TCB::running->setBlocked(true);
    80003338:	00008797          	auipc	a5,0x8
    8000333c:	7c87b783          	ld	a5,1992(a5) # 8000bb00 <_GLOBAL_OFFSET_TABLE_+0x58>
    80003340:	0007b583          	ld	a1,0(a5)
	void setBlocked(bool block) { this->blocked = block; }
    80003344:	00100793          	li	a5,1
    80003348:	02f588a3          	sb	a5,49(a1)
	blocked.putLast(TCB::running);
    8000334c:	00850513          	addi	a0,a0,8
    80003350:	ffffe097          	auipc	ra,0xffffe
    80003354:	ef4080e7          	jalr	-268(ra) # 80001244 <_ZN11ThreadQueue7putLastEP3TCB>
	TCB::yield();
    80003358:	00000097          	auipc	ra,0x0
    8000335c:	994080e7          	jalr	-1644(ra) # 80002cec <_ZN3TCB5yieldEv>
}
    80003360:	00813083          	ld	ra,8(sp)
    80003364:	00013403          	ld	s0,0(sp)
    80003368:	01010113          	addi	sp,sp,16
    8000336c:	00008067          	ret

0000000080003370 <_ZN4KSem4waitEv>:
int KSem::wait() {
    80003370:	fe010113          	addi	sp,sp,-32
    80003374:	00113c23          	sd	ra,24(sp)
    80003378:	00813823          	sd	s0,16(sp)
    8000337c:	00913423          	sd	s1,8(sp)
    80003380:	02010413          	addi	s0,sp,32
    80003384:	00050493          	mv	s1,a0
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    80003388:	00100593          	li	a1,1
    8000338c:	00000097          	auipc	ra,0x0
    80003390:	e68080e7          	jalr	-408(ra) # 800031f4 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>
    80003394:	04050663          	beqz	a0,800033e0 <_ZN4KSem4waitEv+0x70>
	if (!working) return -3;
    80003398:	0184c783          	lbu	a5,24(s1)
    8000339c:	04078663          	beqz	a5,800033e8 <_ZN4KSem4waitEv+0x78>
	if (--val < 0) {
    800033a0:	0004a783          	lw	a5,0(s1)
    800033a4:	fff7879b          	addiw	a5,a5,-1
    800033a8:	00f4a023          	sw	a5,0(s1)
    800033ac:	02079713          	slli	a4,a5,0x20
    800033b0:	00074e63          	bltz	a4,800033cc <_ZN4KSem4waitEv+0x5c>
	return 0;
    800033b4:	00000513          	li	a0,0
}
    800033b8:	01813083          	ld	ra,24(sp)
    800033bc:	01013403          	ld	s0,16(sp)
    800033c0:	00813483          	ld	s1,8(sp)
    800033c4:	02010113          	addi	sp,sp,32
    800033c8:	00008067          	ret
		block();
    800033cc:	00048513          	mv	a0,s1
    800033d0:	00000097          	auipc	ra,0x0
    800033d4:	f58080e7          	jalr	-168(ra) # 80003328 <_ZN4KSem5blockEv>
		return -1;
    800033d8:	fff00513          	li	a0,-1
    800033dc:	fddff06f          	j	800033b8 <_ZN4KSem4waitEv+0x48>
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    800033e0:	ffe00513          	li	a0,-2
    800033e4:	fd5ff06f          	j	800033b8 <_ZN4KSem4waitEv+0x48>
	if (!working) return -3;
    800033e8:	ffd00513          	li	a0,-3
    800033ec:	fcdff06f          	j	800033b8 <_ZN4KSem4waitEv+0x48>

00000000800033f0 <_ZN4KSem7unblockEv>:

void KSem::unblock() {
    800033f0:	ff010113          	addi	sp,sp,-16
    800033f4:	00113423          	sd	ra,8(sp)
    800033f8:	00813023          	sd	s0,0(sp)
    800033fc:	01010413          	addi	s0,sp,16
	TCB* tcb = blocked.getFirst();
    80003400:	00850513          	addi	a0,a0,8
    80003404:	ffffe097          	auipc	ra,0xffffe
    80003408:	eac080e7          	jalr	-340(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
    8000340c:	020508a3          	sb	zero,49(a0)
	tcb->setBlocked(false);
	Scheduler::put(tcb);
    80003410:	ffffe097          	auipc	ra,0xffffe
    80003414:	5b0080e7          	jalr	1456(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
}
    80003418:	00813083          	ld	ra,8(sp)
    8000341c:	00013403          	ld	s0,0(sp)
    80003420:	01010113          	addi	sp,sp,16
    80003424:	00008067          	ret

0000000080003428 <_ZN4KSem6signalEv>:
int KSem::signal() {
    80003428:	fe010113          	addi	sp,sp,-32
    8000342c:	00113c23          	sd	ra,24(sp)
    80003430:	00813823          	sd	s0,16(sp)
    80003434:	00913423          	sd	s1,8(sp)
    80003438:	02010413          	addi	s0,sp,32
    8000343c:	00050493          	mv	s1,a0
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    80003440:	00100593          	li	a1,1
    80003444:	00000097          	auipc	ra,0x0
    80003448:	db0080e7          	jalr	-592(ra) # 800031f4 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>
    8000344c:	04050463          	beqz	a0,80003494 <_ZN4KSem6signalEv+0x6c>
	if (!working) return -3;
    80003450:	0184c783          	lbu	a5,24(s1)
    80003454:	04078463          	beqz	a5,8000349c <_ZN4KSem6signalEv+0x74>
	if (val++ < 0) {
    80003458:	0004a783          	lw	a5,0(s1)
    8000345c:	0017871b          	addiw	a4,a5,1
    80003460:	00e4a023          	sw	a4,0(s1)
    80003464:	0007ce63          	bltz	a5,80003480 <_ZN4KSem6signalEv+0x58>
	return 0;
    80003468:	00000513          	li	a0,0
}
    8000346c:	01813083          	ld	ra,24(sp)
    80003470:	01013403          	ld	s0,16(sp)
    80003474:	00813483          	ld	s1,8(sp)
    80003478:	02010113          	addi	sp,sp,32
    8000347c:	00008067          	ret
		unblock();
    80003480:	00048513          	mv	a0,s1
    80003484:	00000097          	auipc	ra,0x0
    80003488:	f6c080e7          	jalr	-148(ra) # 800033f0 <_ZN4KSem7unblockEv>
	return 0;
    8000348c:	00000513          	li	a0,0
    80003490:	fddff06f          	j	8000346c <_ZN4KSem6signalEv+0x44>
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    80003494:	ffe00513          	li	a0,-2
    80003498:	fd5ff06f          	j	8000346c <_ZN4KSem6signalEv+0x44>
	if (!working) return -3;
    8000349c:	ffd00513          	li	a0,-3
    800034a0:	fcdff06f          	j	8000346c <_ZN4KSem6signalEv+0x44>

00000000800034a4 <_ZN4KSem8closeSemEPS_>:

int KSem::closeSem(sem_t handle) {
    800034a4:	fe010113          	addi	sp,sp,-32
    800034a8:	00113c23          	sd	ra,24(sp)
    800034ac:	00813823          	sd	s0,16(sp)
    800034b0:	00913423          	sd	s1,8(sp)
    800034b4:	02010413          	addi	s0,sp,32
    800034b8:	00050493          	mv	s1,a0
	if (!MemoryAllocator::checkPurpose(handle, MemoryAllocator::SEMAPHORE)) return -2;
    800034bc:	00100593          	li	a1,1
    800034c0:	00000097          	auipc	ra,0x0
    800034c4:	d34080e7          	jalr	-716(ra) # 800031f4 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>
    800034c8:	04050263          	beqz	a0,8000350c <_ZN4KSem8closeSemEPS_+0x68>
	handle->working = false;
    800034cc:	00048c23          	sb	zero,24(s1)
    800034d0:	01c0006f          	j	800034ec <_ZN4KSem8closeSemEPS_+0x48>
	while (!handle->blocked.isEmpty()) {
		TCB* tcb = handle->blocked.getFirst();
    800034d4:	00848513          	addi	a0,s1,8
    800034d8:	ffffe097          	auipc	ra,0xffffe
    800034dc:	dd8080e7          	jalr	-552(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
    800034e0:	020508a3          	sb	zero,49(a0)
		tcb->setBlocked(false);
		Scheduler::put(tcb);
    800034e4:	ffffe097          	auipc	ra,0xffffe
    800034e8:	4dc080e7          	jalr	1244(ra) # 800019c0 <_ZN9Scheduler3putEP3TCB>
		return front == nullptr;
    800034ec:	0084b783          	ld	a5,8(s1)
	while (!handle->blocked.isEmpty()) {
    800034f0:	fe0792e3          	bnez	a5,800034d4 <_ZN4KSem8closeSemEPS_+0x30>
	}
	return 0;
    800034f4:	00000513          	li	a0,0
}
    800034f8:	01813083          	ld	ra,24(sp)
    800034fc:	01013403          	ld	s0,16(sp)
    80003500:	00813483          	ld	s1,8(sp)
    80003504:	02010113          	addi	sp,sp,32
    80003508:	00008067          	ret
	if (!MemoryAllocator::checkPurpose(handle, MemoryAllocator::SEMAPHORE)) return -2;
    8000350c:	ffe00513          	li	a0,-2
    80003510:	fe9ff06f          	j	800034f8 <_ZN4KSem8closeSemEPS_+0x54>

0000000080003514 <_Z10testMemoryv>:
//void printInteger(int i){
//	printInt(i);
//}
extern Semaphore* semA;

void testMemory() {
    80003514:	81010113          	addi	sp,sp,-2032
    80003518:	7e113423          	sd	ra,2024(sp)
    8000351c:	7e813023          	sd	s0,2016(sp)
    80003520:	7c913c23          	sd	s1,2008(sp)
    80003524:	7f010413          	addi	s0,sp,2032
    80003528:	83010113          	addi	sp,sp,-2000
	const uint64 NumAllocations = 500;    //zasto nece za preko 500????
	const uint64 AllocationSize = 16;

	// Allocate and initialize pointers
	int* allocations[NumAllocations];
	for (uint64 i = 0; i < NumAllocations; ++i)
    8000352c:	00000713          	li	a4,0
    80003530:	1f300793          	li	a5,499
    80003534:	02e7e263          	bltu	a5,a4,80003558 <_Z10testMemoryv+0x44>
		allocations[i] = nullptr;
    80003538:	fffff7b7          	lui	a5,0xfffff
    8000353c:	00371693          	slli	a3,a4,0x3
    80003540:	fe040613          	addi	a2,s0,-32
    80003544:	00f607b3          	add	a5,a2,a5
    80003548:	00d787b3          	add	a5,a5,a3
    8000354c:	0607b023          	sd	zero,96(a5) # fffffffffffff060 <end+0xffffffff7fff2130>
	for (uint64 i = 0; i < NumAllocations; ++i)
    80003550:	00170713          	addi	a4,a4,1
    80003554:	fddff06f          	j	80003530 <_Z10testMemoryv+0x1c>

	// Allocate memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80003558:	00000493          	li	s1,0
    8000355c:	1f300793          	li	a5,499
    80003560:	0297ec63          	bltu	a5,s1,80003598 <_Z10testMemoryv+0x84>
		allocations[i] = (int*)MemoryAllocator::kmalloc(
    80003564:	00300593          	li	a1,3
    80003568:	03000513          	li	a0,48
    8000356c:	00000097          	auipc	ra,0x0
    80003570:	9bc080e7          	jalr	-1604(ra) # 80002f28 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
    80003574:	fffff737          	lui	a4,0xfffff
    80003578:	00349793          	slli	a5,s1,0x3
    8000357c:	fe040693          	addi	a3,s0,-32
    80003580:	00e68733          	add	a4,a3,a4
    80003584:	00f707b3          	add	a5,a4,a5
    80003588:	06a7b023          	sd	a0,96(a5)
				AllocationSize + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::MISC);
		if (allocations[i] == nullptr) {
    8000358c:	00050663          	beqz	a0,80003598 <_Z10testMemoryv+0x84>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80003590:	00148493          	addi	s1,s1,1
    80003594:	fc9ff06f          	j	8000355c <_Z10testMemoryv+0x48>
    80003598:	00000493          	li	s1,0
    8000359c:	0100006f          	j	800035ac <_Z10testMemoryv+0x98>
	}

	// Free memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
		if (allocations[i] != nullptr) {
			if (MemoryAllocator::kfree(allocations[i]) != 0) {
    800035a0:	00000097          	auipc	ra,0x0
    800035a4:	b34080e7          	jalr	-1228(ra) # 800030d4 <_ZN15MemoryAllocator5kfreeEPv>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    800035a8:	00148493          	addi	s1,s1,1
    800035ac:	1f300793          	li	a5,499
    800035b0:	0297e263          	bltu	a5,s1,800035d4 <_Z10testMemoryv+0xc0>
		if (allocations[i] != nullptr) {
    800035b4:	fffff737          	lui	a4,0xfffff
    800035b8:	00349793          	slli	a5,s1,0x3
    800035bc:	fe040693          	addi	a3,s0,-32
    800035c0:	00e68733          	add	a4,a3,a4
    800035c4:	00f707b3          	add	a5,a4,a5
    800035c8:	0607b503          	ld	a0,96(a5)
    800035cc:	fc051ae3          	bnez	a0,800035a0 <_Z10testMemoryv+0x8c>
    800035d0:	fd9ff06f          	j	800035a8 <_Z10testMemoryv+0x94>
//				printString("\nDeallocation failed for index ");
//				printInteger(i);
			}
		}
	}
}
    800035d4:	7d010113          	addi	sp,sp,2000
    800035d8:	7e813083          	ld	ra,2024(sp)
    800035dc:	7e013403          	ld	s0,2016(sp)
    800035e0:	7d813483          	ld	s1,2008(sp)
    800035e4:	7f010113          	addi	sp,sp,2032
    800035e8:	00008067          	ret

00000000800035ec <_Z5nit1fPv>:

void nit1f(void*) {
    800035ec:	ff010113          	addi	sp,sp,-16
    800035f0:	00113423          	sd	ra,8(sp)
    800035f4:	00813023          	sd	s0,0(sp)
    800035f8:	01010413          	addi	s0,sp,16
//		printString("\nsem_wait za nit 1 vratio ");
//		printInteger(res);
//		printString("\n");
//	}

	printString("\nGotova nit 1\n");
    800035fc:	00006517          	auipc	a0,0x6
    80003600:	bf450513          	addi	a0,a0,-1036 # 800091f0 <CONSOLE_STATUS+0x1e0>
    80003604:	00002097          	auipc	ra,0x2
    80003608:	530080e7          	jalr	1328(ra) # 80005b34 <_Z11printStringPKc>
}
    8000360c:	00813083          	ld	ra,8(sp)
    80003610:	00013403          	ld	s0,0(sp)
    80003614:	01010113          	addi	sp,sp,16
    80003618:	00008067          	ret

000000008000361c <_Z5nit2fPv>:

void nit2f(void* arg2) {
    8000361c:	ff010113          	addi	sp,sp,-16
    80003620:	00113423          	sd	ra,8(sp)
    80003624:	00813023          	sd	s0,0(sp)
    80003628:	01010413          	addi	s0,sp,16
//		//sem_close(semA);
//		printString("\nNit 2 ubija semafor\n");
//		delete semA;
//
//	}
	printString("\nGotova nit 2\n");
    8000362c:	00006517          	auipc	a0,0x6
    80003630:	bd450513          	addi	a0,a0,-1068 # 80009200 <CONSOLE_STATUS+0x1f0>
    80003634:	00002097          	auipc	ra,0x2
    80003638:	500080e7          	jalr	1280(ra) # 80005b34 <_Z11printStringPKc>
}
    8000363c:	00813083          	ld	ra,8(sp)
    80003640:	00013403          	ld	s0,0(sp)
    80003644:	01010113          	addi	sp,sp,16
    80003648:	00008067          	ret

000000008000364c <_Z5nit3fPv>:


void nit3f(void*) {
    8000364c:	fe010113          	addi	sp,sp,-32
    80003650:	00113c23          	sd	ra,24(sp)
    80003654:	00813823          	sd	s0,16(sp)
    80003658:	00913423          	sd	s1,8(sp)
    8000365c:	02010413          	addi	s0,sp,32
    80003660:	0180006f          	j	80003678 <_Z5nit3fPv+0x2c>
	char slovo;
	do {
		slovo = getc();
		putc(slovo);
		if (slovo == '\r') putc('\n');
    80003664:	00a00513          	li	a0,10
    80003668:	ffffe097          	auipc	ra,0xffffe
    8000366c:	f28080e7          	jalr	-216(ra) # 80001590 <_Z4putcc>
	} while (slovo != '0');
    80003670:	03000793          	li	a5,48
    80003674:	02f48263          	beq	s1,a5,80003698 <_Z5nit3fPv+0x4c>
		slovo = getc();
    80003678:	ffffe097          	auipc	ra,0xffffe
    8000367c:	ef0080e7          	jalr	-272(ra) # 80001568 <_Z4getcv>
    80003680:	00050493          	mv	s1,a0
		putc(slovo);
    80003684:	ffffe097          	auipc	ra,0xffffe
    80003688:	f0c080e7          	jalr	-244(ra) # 80001590 <_Z4putcc>
		if (slovo == '\r') putc('\n');
    8000368c:	00d00793          	li	a5,13
    80003690:	fef490e3          	bne	s1,a5,80003670 <_Z5nit3fPv+0x24>
    80003694:	fd1ff06f          	j	80003664 <_Z5nit3fPv+0x18>

	printString("\nGotova nit3\n");
    80003698:	00006517          	auipc	a0,0x6
    8000369c:	b7850513          	addi	a0,a0,-1160 # 80009210 <CONSOLE_STATUS+0x200>
    800036a0:	00002097          	auipc	ra,0x2
    800036a4:	494080e7          	jalr	1172(ra) # 80005b34 <_Z11printStringPKc>
    800036a8:	01813083          	ld	ra,24(sp)
    800036ac:	01013403          	ld	s0,16(sp)
    800036b0:	00813483          	ld	s1,8(sp)
    800036b4:	02010113          	addi	sp,sp,32
    800036b8:	00008067          	ret

00000000800036bc <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    800036bc:	fe010113          	addi	sp,sp,-32
    800036c0:	00113c23          	sd	ra,24(sp)
    800036c4:	00813823          	sd	s0,16(sp)
    800036c8:	00913423          	sd	s1,8(sp)
    800036cc:	01213023          	sd	s2,0(sp)
    800036d0:	02010413          	addi	s0,sp,32
    800036d4:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    800036d8:	00000913          	li	s2,0
    800036dc:	00c0006f          	j	800036e8 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    800036e0:	ffffe097          	auipc	ra,0xffffe
    800036e4:	d48080e7          	jalr	-696(ra) # 80001428 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
    800036e8:	ffffe097          	auipc	ra,0xffffe
    800036ec:	e80080e7          	jalr	-384(ra) # 80001568 <_Z4getcv>
    800036f0:	0005059b          	sext.w	a1,a0
    800036f4:	02d00793          	li	a5,45
    800036f8:	02f58a63          	beq	a1,a5,8000372c <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    800036fc:	0084b503          	ld	a0,8(s1)
    80003700:	00003097          	auipc	ra,0x3
    80003704:	400080e7          	jalr	1024(ra) # 80006b00 <_ZN6Buffer3putEi>
        i++;
    80003708:	0019071b          	addiw	a4,s2,1
    8000370c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003710:	0004a683          	lw	a3,0(s1)
    80003714:	0026979b          	slliw	a5,a3,0x2
    80003718:	00d787bb          	addw	a5,a5,a3
    8000371c:	0017979b          	slliw	a5,a5,0x1
    80003720:	02f767bb          	remw	a5,a4,a5
    80003724:	fc0792e3          	bnez	a5,800036e8 <_ZL16producerKeyboardPv+0x2c>
    80003728:	fb9ff06f          	j	800036e0 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    8000372c:	00100793          	li	a5,1
    80003730:	00008717          	auipc	a4,0x8
    80003734:	54f72423          	sw	a5,1352(a4) # 8000bc78 <_ZL9threadEnd>
    data->buffer->put('!');
    80003738:	02100593          	li	a1,33
    8000373c:	0084b503          	ld	a0,8(s1)
    80003740:	00003097          	auipc	ra,0x3
    80003744:	3c0080e7          	jalr	960(ra) # 80006b00 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80003748:	0104b503          	ld	a0,16(s1)
    8000374c:	ffffe097          	auipc	ra,0xffffe
    80003750:	dec080e7          	jalr	-532(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    80003754:	01813083          	ld	ra,24(sp)
    80003758:	01013403          	ld	s0,16(sp)
    8000375c:	00813483          	ld	s1,8(sp)
    80003760:	00013903          	ld	s2,0(sp)
    80003764:	02010113          	addi	sp,sp,32
    80003768:	00008067          	ret

000000008000376c <_ZL8producerPv>:

static void producer(void *arg) {
    8000376c:	fe010113          	addi	sp,sp,-32
    80003770:	00113c23          	sd	ra,24(sp)
    80003774:	00813823          	sd	s0,16(sp)
    80003778:	00913423          	sd	s1,8(sp)
    8000377c:	01213023          	sd	s2,0(sp)
    80003780:	02010413          	addi	s0,sp,32
    80003784:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003788:	00000913          	li	s2,0
    8000378c:	00c0006f          	j	80003798 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003790:	ffffe097          	auipc	ra,0xffffe
    80003794:	c98080e7          	jalr	-872(ra) # 80001428 <_Z15thread_dispatchv>
    while (!threadEnd) {
    80003798:	00008797          	auipc	a5,0x8
    8000379c:	4e07a783          	lw	a5,1248(a5) # 8000bc78 <_ZL9threadEnd>
    800037a0:	02079e63          	bnez	a5,800037dc <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    800037a4:	0004a583          	lw	a1,0(s1)
    800037a8:	0305859b          	addiw	a1,a1,48
    800037ac:	0084b503          	ld	a0,8(s1)
    800037b0:	00003097          	auipc	ra,0x3
    800037b4:	350080e7          	jalr	848(ra) # 80006b00 <_ZN6Buffer3putEi>
        i++;
    800037b8:	0019071b          	addiw	a4,s2,1
    800037bc:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800037c0:	0004a683          	lw	a3,0(s1)
    800037c4:	0026979b          	slliw	a5,a3,0x2
    800037c8:	00d787bb          	addw	a5,a5,a3
    800037cc:	0017979b          	slliw	a5,a5,0x1
    800037d0:	02f767bb          	remw	a5,a4,a5
    800037d4:	fc0792e3          	bnez	a5,80003798 <_ZL8producerPv+0x2c>
    800037d8:	fb9ff06f          	j	80003790 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    800037dc:	0104b503          	ld	a0,16(s1)
    800037e0:	ffffe097          	auipc	ra,0xffffe
    800037e4:	d58080e7          	jalr	-680(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    800037e8:	01813083          	ld	ra,24(sp)
    800037ec:	01013403          	ld	s0,16(sp)
    800037f0:	00813483          	ld	s1,8(sp)
    800037f4:	00013903          	ld	s2,0(sp)
    800037f8:	02010113          	addi	sp,sp,32
    800037fc:	00008067          	ret

0000000080003800 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80003800:	fd010113          	addi	sp,sp,-48
    80003804:	02113423          	sd	ra,40(sp)
    80003808:	02813023          	sd	s0,32(sp)
    8000380c:	00913c23          	sd	s1,24(sp)
    80003810:	01213823          	sd	s2,16(sp)
    80003814:	01313423          	sd	s3,8(sp)
    80003818:	03010413          	addi	s0,sp,48
    8000381c:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003820:	00000993          	li	s3,0
    80003824:	01c0006f          	j	80003840 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80003828:	ffffe097          	auipc	ra,0xffffe
    8000382c:	c00080e7          	jalr	-1024(ra) # 80001428 <_Z15thread_dispatchv>
    80003830:	0500006f          	j	80003880 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80003834:	00a00513          	li	a0,10
    80003838:	ffffe097          	auipc	ra,0xffffe
    8000383c:	d58080e7          	jalr	-680(ra) # 80001590 <_Z4putcc>
    while (!threadEnd) {
    80003840:	00008797          	auipc	a5,0x8
    80003844:	4387a783          	lw	a5,1080(a5) # 8000bc78 <_ZL9threadEnd>
    80003848:	06079063          	bnez	a5,800038a8 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    8000384c:	00893503          	ld	a0,8(s2)
    80003850:	00003097          	auipc	ra,0x3
    80003854:	340080e7          	jalr	832(ra) # 80006b90 <_ZN6Buffer3getEv>
        i++;
    80003858:	0019849b          	addiw	s1,s3,1
    8000385c:	0004899b          	sext.w	s3,s1
        putc(key);
    80003860:	0ff57513          	andi	a0,a0,255
    80003864:	ffffe097          	auipc	ra,0xffffe
    80003868:	d2c080e7          	jalr	-724(ra) # 80001590 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    8000386c:	00092703          	lw	a4,0(s2)
    80003870:	0027179b          	slliw	a5,a4,0x2
    80003874:	00e787bb          	addw	a5,a5,a4
    80003878:	02f4e7bb          	remw	a5,s1,a5
    8000387c:	fa0786e3          	beqz	a5,80003828 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80003880:	05000793          	li	a5,80
    80003884:	02f4e4bb          	remw	s1,s1,a5
    80003888:	fa049ce3          	bnez	s1,80003840 <_ZL8consumerPv+0x40>
    8000388c:	fa9ff06f          	j	80003834 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80003890:	00893503          	ld	a0,8(s2)
    80003894:	00003097          	auipc	ra,0x3
    80003898:	2fc080e7          	jalr	764(ra) # 80006b90 <_ZN6Buffer3getEv>
        putc(key);
    8000389c:	0ff57513          	andi	a0,a0,255
    800038a0:	ffffe097          	auipc	ra,0xffffe
    800038a4:	cf0080e7          	jalr	-784(ra) # 80001590 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    800038a8:	00893503          	ld	a0,8(s2)
    800038ac:	00003097          	auipc	ra,0x3
    800038b0:	370080e7          	jalr	880(ra) # 80006c1c <_ZN6Buffer6getCntEv>
    800038b4:	fca04ee3          	bgtz	a0,80003890 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    800038b8:	01093503          	ld	a0,16(s2)
    800038bc:	ffffe097          	auipc	ra,0xffffe
    800038c0:	c7c080e7          	jalr	-900(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    800038c4:	02813083          	ld	ra,40(sp)
    800038c8:	02013403          	ld	s0,32(sp)
    800038cc:	01813483          	ld	s1,24(sp)
    800038d0:	01013903          	ld	s2,16(sp)
    800038d4:	00813983          	ld	s3,8(sp)
    800038d8:	03010113          	addi	sp,sp,48
    800038dc:	00008067          	ret

00000000800038e0 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    800038e0:	f9010113          	addi	sp,sp,-112
    800038e4:	06113423          	sd	ra,104(sp)
    800038e8:	06813023          	sd	s0,96(sp)
    800038ec:	04913c23          	sd	s1,88(sp)
    800038f0:	05213823          	sd	s2,80(sp)
    800038f4:	05313423          	sd	s3,72(sp)
    800038f8:	05413023          	sd	s4,64(sp)
    800038fc:	03513c23          	sd	s5,56(sp)
    80003900:	03613823          	sd	s6,48(sp)
    80003904:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80003908:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    8000390c:	00006517          	auipc	a0,0x6
    80003910:	91450513          	addi	a0,a0,-1772 # 80009220 <CONSOLE_STATUS+0x210>
    80003914:	00002097          	auipc	ra,0x2
    80003918:	220080e7          	jalr	544(ra) # 80005b34 <_Z11printStringPKc>
    getString(input, 30);
    8000391c:	01e00593          	li	a1,30
    80003920:	fa040493          	addi	s1,s0,-96
    80003924:	00048513          	mv	a0,s1
    80003928:	00002097          	auipc	ra,0x2
    8000392c:	294080e7          	jalr	660(ra) # 80005bbc <_Z9getStringPci>
    threadNum = stringToInt(input);
    80003930:	00048513          	mv	a0,s1
    80003934:	00002097          	auipc	ra,0x2
    80003938:	360080e7          	jalr	864(ra) # 80005c94 <_Z11stringToIntPKc>
    8000393c:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80003940:	00006517          	auipc	a0,0x6
    80003944:	90050513          	addi	a0,a0,-1792 # 80009240 <CONSOLE_STATUS+0x230>
    80003948:	00002097          	auipc	ra,0x2
    8000394c:	1ec080e7          	jalr	492(ra) # 80005b34 <_Z11printStringPKc>
    getString(input, 30);
    80003950:	01e00593          	li	a1,30
    80003954:	00048513          	mv	a0,s1
    80003958:	00002097          	auipc	ra,0x2
    8000395c:	264080e7          	jalr	612(ra) # 80005bbc <_Z9getStringPci>
    n = stringToInt(input);
    80003960:	00048513          	mv	a0,s1
    80003964:	00002097          	auipc	ra,0x2
    80003968:	330080e7          	jalr	816(ra) # 80005c94 <_Z11stringToIntPKc>
    8000396c:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80003970:	00006517          	auipc	a0,0x6
    80003974:	8f050513          	addi	a0,a0,-1808 # 80009260 <CONSOLE_STATUS+0x250>
    80003978:	00002097          	auipc	ra,0x2
    8000397c:	1bc080e7          	jalr	444(ra) # 80005b34 <_Z11printStringPKc>
	printInt(threadNum);
    80003980:	00000613          	li	a2,0
    80003984:	00a00593          	li	a1,10
    80003988:	00090513          	mv	a0,s2
    8000398c:	00002097          	auipc	ra,0x2
    80003990:	358080e7          	jalr	856(ra) # 80005ce4 <_Z8printIntiii>
    printString(" i velicina bafera ");
    80003994:	00006517          	auipc	a0,0x6
    80003998:	8e450513          	addi	a0,a0,-1820 # 80009278 <CONSOLE_STATUS+0x268>
    8000399c:	00002097          	auipc	ra,0x2
    800039a0:	198080e7          	jalr	408(ra) # 80005b34 <_Z11printStringPKc>
	printInt(n);
    800039a4:	00000613          	li	a2,0
    800039a8:	00a00593          	li	a1,10
    800039ac:	00048513          	mv	a0,s1
    800039b0:	00002097          	auipc	ra,0x2
    800039b4:	334080e7          	jalr	820(ra) # 80005ce4 <_Z8printIntiii>
    printString(".\n");
    800039b8:	00006517          	auipc	a0,0x6
    800039bc:	8d850513          	addi	a0,a0,-1832 # 80009290 <CONSOLE_STATUS+0x280>
    800039c0:	00002097          	auipc	ra,0x2
    800039c4:	174080e7          	jalr	372(ra) # 80005b34 <_Z11printStringPKc>
    if(threadNum > n) {
    800039c8:	0324c463          	blt	s1,s2,800039f0 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    800039cc:	03205c63          	blez	s2,80003a04 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    800039d0:	03800513          	li	a0,56
    800039d4:	fffff097          	auipc	ra,0xfffff
    800039d8:	ccc080e7          	jalr	-820(ra) # 800026a0 <_Znwm>
    800039dc:	00050a13          	mv	s4,a0
    800039e0:	00048593          	mv	a1,s1
    800039e4:	00003097          	auipc	ra,0x3
    800039e8:	080080e7          	jalr	128(ra) # 80006a64 <_ZN6BufferC1Ei>
    800039ec:	0300006f          	j	80003a1c <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800039f0:	00006517          	auipc	a0,0x6
    800039f4:	8a850513          	addi	a0,a0,-1880 # 80009298 <CONSOLE_STATUS+0x288>
    800039f8:	00002097          	auipc	ra,0x2
    800039fc:	13c080e7          	jalr	316(ra) # 80005b34 <_Z11printStringPKc>
        return;
    80003a00:	0140006f          	j	80003a14 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80003a04:	00006517          	auipc	a0,0x6
    80003a08:	8d450513          	addi	a0,a0,-1836 # 800092d8 <CONSOLE_STATUS+0x2c8>
    80003a0c:	00002097          	auipc	ra,0x2
    80003a10:	128080e7          	jalr	296(ra) # 80005b34 <_Z11printStringPKc>
        return;
    80003a14:	000b0113          	mv	sp,s6
    80003a18:	1500006f          	j	80003b68 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80003a1c:	00000593          	li	a1,0
    80003a20:	00008517          	auipc	a0,0x8
    80003a24:	26050513          	addi	a0,a0,608 # 8000bc80 <_ZL10waitForAll>
    80003a28:	ffffe097          	auipc	ra,0xffffe
    80003a2c:	a78080e7          	jalr	-1416(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    thread_t threads[threadNum];
    80003a30:	00391793          	slli	a5,s2,0x3
    80003a34:	00f78793          	addi	a5,a5,15
    80003a38:	ff07f793          	andi	a5,a5,-16
    80003a3c:	40f10133          	sub	sp,sp,a5
    80003a40:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80003a44:	0019071b          	addiw	a4,s2,1
    80003a48:	00171793          	slli	a5,a4,0x1
    80003a4c:	00e787b3          	add	a5,a5,a4
    80003a50:	00379793          	slli	a5,a5,0x3
    80003a54:	00f78793          	addi	a5,a5,15
    80003a58:	ff07f793          	andi	a5,a5,-16
    80003a5c:	40f10133          	sub	sp,sp,a5
    80003a60:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80003a64:	00191613          	slli	a2,s2,0x1
    80003a68:	012607b3          	add	a5,a2,s2
    80003a6c:	00379793          	slli	a5,a5,0x3
    80003a70:	00f987b3          	add	a5,s3,a5
    80003a74:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80003a78:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80003a7c:	00008717          	auipc	a4,0x8
    80003a80:	20473703          	ld	a4,516(a4) # 8000bc80 <_ZL10waitForAll>
    80003a84:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80003a88:	00078613          	mv	a2,a5
    80003a8c:	00000597          	auipc	a1,0x0
    80003a90:	d7458593          	addi	a1,a1,-652 # 80003800 <_ZL8consumerPv>
    80003a94:	f9840513          	addi	a0,s0,-104
    80003a98:	ffffe097          	auipc	ra,0xffffe
    80003a9c:	8e8080e7          	jalr	-1816(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003aa0:	00000493          	li	s1,0
    80003aa4:	0280006f          	j	80003acc <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80003aa8:	00000597          	auipc	a1,0x0
    80003aac:	c1458593          	addi	a1,a1,-1004 # 800036bc <_ZL16producerKeyboardPv>
                      data + i);
    80003ab0:	00179613          	slli	a2,a5,0x1
    80003ab4:	00f60633          	add	a2,a2,a5
    80003ab8:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80003abc:	00c98633          	add	a2,s3,a2
    80003ac0:	ffffe097          	auipc	ra,0xffffe
    80003ac4:	8c0080e7          	jalr	-1856(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003ac8:	0014849b          	addiw	s1,s1,1
    80003acc:	0524d263          	bge	s1,s2,80003b10 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80003ad0:	00149793          	slli	a5,s1,0x1
    80003ad4:	009787b3          	add	a5,a5,s1
    80003ad8:	00379793          	slli	a5,a5,0x3
    80003adc:	00f987b3          	add	a5,s3,a5
    80003ae0:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80003ae4:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80003ae8:	00008717          	auipc	a4,0x8
    80003aec:	19873703          	ld	a4,408(a4) # 8000bc80 <_ZL10waitForAll>
    80003af0:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80003af4:	00048793          	mv	a5,s1
    80003af8:	00349513          	slli	a0,s1,0x3
    80003afc:	00aa8533          	add	a0,s5,a0
    80003b00:	fa9054e3          	blez	s1,80003aa8 <_Z22producerConsumer_C_APIv+0x1c8>
    80003b04:	00000597          	auipc	a1,0x0
    80003b08:	c6858593          	addi	a1,a1,-920 # 8000376c <_ZL8producerPv>
    80003b0c:	fa5ff06f          	j	80003ab0 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80003b10:	ffffe097          	auipc	ra,0xffffe
    80003b14:	918080e7          	jalr	-1768(ra) # 80001428 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80003b18:	00000493          	li	s1,0
    80003b1c:	00994e63          	blt	s2,s1,80003b38 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80003b20:	00008517          	auipc	a0,0x8
    80003b24:	16053503          	ld	a0,352(a0) # 8000bc80 <_ZL10waitForAll>
    80003b28:	ffffe097          	auipc	ra,0xffffe
    80003b2c:	9e0080e7          	jalr	-1568(ra) # 80001508 <_Z8sem_waitP4KSem>
    for (int i = 0; i <= threadNum; i++) {
    80003b30:	0014849b          	addiw	s1,s1,1
    80003b34:	fe9ff06f          	j	80003b1c <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80003b38:	00008517          	auipc	a0,0x8
    80003b3c:	14853503          	ld	a0,328(a0) # 8000bc80 <_ZL10waitForAll>
    80003b40:	ffffe097          	auipc	ra,0xffffe
    80003b44:	998080e7          	jalr	-1640(ra) # 800014d8 <_Z9sem_closeP4KSem>
    delete buffer;
    80003b48:	000a0e63          	beqz	s4,80003b64 <_Z22producerConsumer_C_APIv+0x284>
    80003b4c:	000a0513          	mv	a0,s4
    80003b50:	00003097          	auipc	ra,0x3
    80003b54:	154080e7          	jalr	340(ra) # 80006ca4 <_ZN6BufferD1Ev>
    80003b58:	000a0513          	mv	a0,s4
    80003b5c:	fffff097          	auipc	ra,0xfffff
    80003b60:	b94080e7          	jalr	-1132(ra) # 800026f0 <_ZdlPv>
    80003b64:	000b0113          	mv	sp,s6

}
    80003b68:	f9040113          	addi	sp,s0,-112
    80003b6c:	06813083          	ld	ra,104(sp)
    80003b70:	06013403          	ld	s0,96(sp)
    80003b74:	05813483          	ld	s1,88(sp)
    80003b78:	05013903          	ld	s2,80(sp)
    80003b7c:	04813983          	ld	s3,72(sp)
    80003b80:	04013a03          	ld	s4,64(sp)
    80003b84:	03813a83          	ld	s5,56(sp)
    80003b88:	03013b03          	ld	s6,48(sp)
    80003b8c:	07010113          	addi	sp,sp,112
    80003b90:	00008067          	ret
    80003b94:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80003b98:	000a0513          	mv	a0,s4
    80003b9c:	fffff097          	auipc	ra,0xfffff
    80003ba0:	b54080e7          	jalr	-1196(ra) # 800026f0 <_ZdlPv>
    80003ba4:	00048513          	mv	a0,s1
    80003ba8:	00009097          	auipc	ra,0x9
    80003bac:	1f0080e7          	jalr	496(ra) # 8000cd98 <_Unwind_Resume>

0000000080003bb0 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003bb0:	fe010113          	addi	sp,sp,-32
    80003bb4:	00113c23          	sd	ra,24(sp)
    80003bb8:	00813823          	sd	s0,16(sp)
    80003bbc:	00913423          	sd	s1,8(sp)
    80003bc0:	01213023          	sd	s2,0(sp)
    80003bc4:	02010413          	addi	s0,sp,32
    80003bc8:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003bcc:	00100793          	li	a5,1
    80003bd0:	02a7f863          	bgeu	a5,a0,80003c00 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80003bd4:	00a00793          	li	a5,10
    80003bd8:	02f577b3          	remu	a5,a0,a5
    80003bdc:	02078e63          	beqz	a5,80003c18 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80003be0:	fff48513          	addi	a0,s1,-1
    80003be4:	00000097          	auipc	ra,0x0
    80003be8:	fcc080e7          	jalr	-52(ra) # 80003bb0 <_ZL9fibonaccim>
    80003bec:	00050913          	mv	s2,a0
    80003bf0:	ffe48513          	addi	a0,s1,-2
    80003bf4:	00000097          	auipc	ra,0x0
    80003bf8:	fbc080e7          	jalr	-68(ra) # 80003bb0 <_ZL9fibonaccim>
    80003bfc:	00a90533          	add	a0,s2,a0
}
    80003c00:	01813083          	ld	ra,24(sp)
    80003c04:	01013403          	ld	s0,16(sp)
    80003c08:	00813483          	ld	s1,8(sp)
    80003c0c:	00013903          	ld	s2,0(sp)
    80003c10:	02010113          	addi	sp,sp,32
    80003c14:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80003c18:	ffffe097          	auipc	ra,0xffffe
    80003c1c:	810080e7          	jalr	-2032(ra) # 80001428 <_Z15thread_dispatchv>
    80003c20:	fc1ff06f          	j	80003be0 <_ZL9fibonaccim+0x30>

0000000080003c24 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80003c24:	fe010113          	addi	sp,sp,-32
    80003c28:	00113c23          	sd	ra,24(sp)
    80003c2c:	00813823          	sd	s0,16(sp)
    80003c30:	00913423          	sd	s1,8(sp)
    80003c34:	01213023          	sd	s2,0(sp)
    80003c38:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003c3c:	00000913          	li	s2,0
    80003c40:	0380006f          	j	80003c78 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003c44:	ffffd097          	auipc	ra,0xffffd
    80003c48:	7e4080e7          	jalr	2020(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003c4c:	00148493          	addi	s1,s1,1
    80003c50:	000027b7          	lui	a5,0x2
    80003c54:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003c58:	0097ee63          	bltu	a5,s1,80003c74 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003c5c:	00000713          	li	a4,0
    80003c60:	000077b7          	lui	a5,0x7
    80003c64:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003c68:	fce7eee3          	bltu	a5,a4,80003c44 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80003c6c:	00170713          	addi	a4,a4,1
    80003c70:	ff1ff06f          	j	80003c60 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003c74:	00190913          	addi	s2,s2,1
    80003c78:	00900793          	li	a5,9
    80003c7c:	0527e063          	bltu	a5,s2,80003cbc <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003c80:	00005517          	auipc	a0,0x5
    80003c84:	68850513          	addi	a0,a0,1672 # 80009308 <CONSOLE_STATUS+0x2f8>
    80003c88:	00002097          	auipc	ra,0x2
    80003c8c:	eac080e7          	jalr	-340(ra) # 80005b34 <_Z11printStringPKc>
    80003c90:	00000613          	li	a2,0
    80003c94:	00a00593          	li	a1,10
    80003c98:	0009051b          	sext.w	a0,s2
    80003c9c:	00002097          	auipc	ra,0x2
    80003ca0:	048080e7          	jalr	72(ra) # 80005ce4 <_Z8printIntiii>
    80003ca4:	00006517          	auipc	a0,0x6
    80003ca8:	8c450513          	addi	a0,a0,-1852 # 80009568 <CONSOLE_STATUS+0x558>
    80003cac:	00002097          	auipc	ra,0x2
    80003cb0:	e88080e7          	jalr	-376(ra) # 80005b34 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003cb4:	00000493          	li	s1,0
    80003cb8:	f99ff06f          	j	80003c50 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003cbc:	00005517          	auipc	a0,0x5
    80003cc0:	65450513          	addi	a0,a0,1620 # 80009310 <CONSOLE_STATUS+0x300>
    80003cc4:	00002097          	auipc	ra,0x2
    80003cc8:	e70080e7          	jalr	-400(ra) # 80005b34 <_Z11printStringPKc>
    finishedA = true;
    80003ccc:	00100793          	li	a5,1
    80003cd0:	00008717          	auipc	a4,0x8
    80003cd4:	faf70c23          	sb	a5,-72(a4) # 8000bc88 <_ZL9finishedA>
}
    80003cd8:	01813083          	ld	ra,24(sp)
    80003cdc:	01013403          	ld	s0,16(sp)
    80003ce0:	00813483          	ld	s1,8(sp)
    80003ce4:	00013903          	ld	s2,0(sp)
    80003ce8:	02010113          	addi	sp,sp,32
    80003cec:	00008067          	ret

0000000080003cf0 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80003cf0:	fe010113          	addi	sp,sp,-32
    80003cf4:	00113c23          	sd	ra,24(sp)
    80003cf8:	00813823          	sd	s0,16(sp)
    80003cfc:	00913423          	sd	s1,8(sp)
    80003d00:	01213023          	sd	s2,0(sp)
    80003d04:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003d08:	00000913          	li	s2,0
    80003d0c:	0380006f          	j	80003d44 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003d10:	ffffd097          	auipc	ra,0xffffd
    80003d14:	718080e7          	jalr	1816(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003d18:	00148493          	addi	s1,s1,1
    80003d1c:	000027b7          	lui	a5,0x2
    80003d20:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003d24:	0097ee63          	bltu	a5,s1,80003d40 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003d28:	00000713          	li	a4,0
    80003d2c:	000077b7          	lui	a5,0x7
    80003d30:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003d34:	fce7eee3          	bltu	a5,a4,80003d10 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80003d38:	00170713          	addi	a4,a4,1
    80003d3c:	ff1ff06f          	j	80003d2c <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003d40:	00190913          	addi	s2,s2,1
    80003d44:	00f00793          	li	a5,15
    80003d48:	0527e063          	bltu	a5,s2,80003d88 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003d4c:	00005517          	auipc	a0,0x5
    80003d50:	5d450513          	addi	a0,a0,1492 # 80009320 <CONSOLE_STATUS+0x310>
    80003d54:	00002097          	auipc	ra,0x2
    80003d58:	de0080e7          	jalr	-544(ra) # 80005b34 <_Z11printStringPKc>
    80003d5c:	00000613          	li	a2,0
    80003d60:	00a00593          	li	a1,10
    80003d64:	0009051b          	sext.w	a0,s2
    80003d68:	00002097          	auipc	ra,0x2
    80003d6c:	f7c080e7          	jalr	-132(ra) # 80005ce4 <_Z8printIntiii>
    80003d70:	00005517          	auipc	a0,0x5
    80003d74:	7f850513          	addi	a0,a0,2040 # 80009568 <CONSOLE_STATUS+0x558>
    80003d78:	00002097          	auipc	ra,0x2
    80003d7c:	dbc080e7          	jalr	-580(ra) # 80005b34 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003d80:	00000493          	li	s1,0
    80003d84:	f99ff06f          	j	80003d1c <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80003d88:	00005517          	auipc	a0,0x5
    80003d8c:	5a050513          	addi	a0,a0,1440 # 80009328 <CONSOLE_STATUS+0x318>
    80003d90:	00002097          	auipc	ra,0x2
    80003d94:	da4080e7          	jalr	-604(ra) # 80005b34 <_Z11printStringPKc>
    finishedB = true;
    80003d98:	00100793          	li	a5,1
    80003d9c:	00008717          	auipc	a4,0x8
    80003da0:	eef706a3          	sb	a5,-275(a4) # 8000bc89 <_ZL9finishedB>
    thread_dispatch();
    80003da4:	ffffd097          	auipc	ra,0xffffd
    80003da8:	684080e7          	jalr	1668(ra) # 80001428 <_Z15thread_dispatchv>
}
    80003dac:	01813083          	ld	ra,24(sp)
    80003db0:	01013403          	ld	s0,16(sp)
    80003db4:	00813483          	ld	s1,8(sp)
    80003db8:	00013903          	ld	s2,0(sp)
    80003dbc:	02010113          	addi	sp,sp,32
    80003dc0:	00008067          	ret

0000000080003dc4 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80003dc4:	fe010113          	addi	sp,sp,-32
    80003dc8:	00113c23          	sd	ra,24(sp)
    80003dcc:	00813823          	sd	s0,16(sp)
    80003dd0:	00913423          	sd	s1,8(sp)
    80003dd4:	01213023          	sd	s2,0(sp)
    80003dd8:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80003ddc:	00000493          	li	s1,0
    80003de0:	0400006f          	j	80003e20 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003de4:	00005517          	auipc	a0,0x5
    80003de8:	55450513          	addi	a0,a0,1364 # 80009338 <CONSOLE_STATUS+0x328>
    80003dec:	00002097          	auipc	ra,0x2
    80003df0:	d48080e7          	jalr	-696(ra) # 80005b34 <_Z11printStringPKc>
    80003df4:	00000613          	li	a2,0
    80003df8:	00a00593          	li	a1,10
    80003dfc:	00048513          	mv	a0,s1
    80003e00:	00002097          	auipc	ra,0x2
    80003e04:	ee4080e7          	jalr	-284(ra) # 80005ce4 <_Z8printIntiii>
    80003e08:	00005517          	auipc	a0,0x5
    80003e0c:	76050513          	addi	a0,a0,1888 # 80009568 <CONSOLE_STATUS+0x558>
    80003e10:	00002097          	auipc	ra,0x2
    80003e14:	d24080e7          	jalr	-732(ra) # 80005b34 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80003e18:	0014849b          	addiw	s1,s1,1
    80003e1c:	0ff4f493          	andi	s1,s1,255
    80003e20:	00200793          	li	a5,2
    80003e24:	fc97f0e3          	bgeu	a5,s1,80003de4 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80003e28:	00005517          	auipc	a0,0x5
    80003e2c:	51850513          	addi	a0,a0,1304 # 80009340 <CONSOLE_STATUS+0x330>
    80003e30:	00002097          	auipc	ra,0x2
    80003e34:	d04080e7          	jalr	-764(ra) # 80005b34 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80003e38:	00700313          	li	t1,7
    thread_dispatch();
    80003e3c:	ffffd097          	auipc	ra,0xffffd
    80003e40:	5ec080e7          	jalr	1516(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80003e44:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80003e48:	00005517          	auipc	a0,0x5
    80003e4c:	50850513          	addi	a0,a0,1288 # 80009350 <CONSOLE_STATUS+0x340>
    80003e50:	00002097          	auipc	ra,0x2
    80003e54:	ce4080e7          	jalr	-796(ra) # 80005b34 <_Z11printStringPKc>
    80003e58:	00000613          	li	a2,0
    80003e5c:	00a00593          	li	a1,10
    80003e60:	0009051b          	sext.w	a0,s2
    80003e64:	00002097          	auipc	ra,0x2
    80003e68:	e80080e7          	jalr	-384(ra) # 80005ce4 <_Z8printIntiii>
    80003e6c:	00005517          	auipc	a0,0x5
    80003e70:	6fc50513          	addi	a0,a0,1788 # 80009568 <CONSOLE_STATUS+0x558>
    80003e74:	00002097          	auipc	ra,0x2
    80003e78:	cc0080e7          	jalr	-832(ra) # 80005b34 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80003e7c:	00c00513          	li	a0,12
    80003e80:	00000097          	auipc	ra,0x0
    80003e84:	d30080e7          	jalr	-720(ra) # 80003bb0 <_ZL9fibonaccim>
    80003e88:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80003e8c:	00005517          	auipc	a0,0x5
    80003e90:	4cc50513          	addi	a0,a0,1228 # 80009358 <CONSOLE_STATUS+0x348>
    80003e94:	00002097          	auipc	ra,0x2
    80003e98:	ca0080e7          	jalr	-864(ra) # 80005b34 <_Z11printStringPKc>
    80003e9c:	00000613          	li	a2,0
    80003ea0:	00a00593          	li	a1,10
    80003ea4:	0009051b          	sext.w	a0,s2
    80003ea8:	00002097          	auipc	ra,0x2
    80003eac:	e3c080e7          	jalr	-452(ra) # 80005ce4 <_Z8printIntiii>
    80003eb0:	00005517          	auipc	a0,0x5
    80003eb4:	6b850513          	addi	a0,a0,1720 # 80009568 <CONSOLE_STATUS+0x558>
    80003eb8:	00002097          	auipc	ra,0x2
    80003ebc:	c7c080e7          	jalr	-900(ra) # 80005b34 <_Z11printStringPKc>
    80003ec0:	0400006f          	j	80003f00 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003ec4:	00005517          	auipc	a0,0x5
    80003ec8:	47450513          	addi	a0,a0,1140 # 80009338 <CONSOLE_STATUS+0x328>
    80003ecc:	00002097          	auipc	ra,0x2
    80003ed0:	c68080e7          	jalr	-920(ra) # 80005b34 <_Z11printStringPKc>
    80003ed4:	00000613          	li	a2,0
    80003ed8:	00a00593          	li	a1,10
    80003edc:	00048513          	mv	a0,s1
    80003ee0:	00002097          	auipc	ra,0x2
    80003ee4:	e04080e7          	jalr	-508(ra) # 80005ce4 <_Z8printIntiii>
    80003ee8:	00005517          	auipc	a0,0x5
    80003eec:	68050513          	addi	a0,a0,1664 # 80009568 <CONSOLE_STATUS+0x558>
    80003ef0:	00002097          	auipc	ra,0x2
    80003ef4:	c44080e7          	jalr	-956(ra) # 80005b34 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80003ef8:	0014849b          	addiw	s1,s1,1
    80003efc:	0ff4f493          	andi	s1,s1,255
    80003f00:	00500793          	li	a5,5
    80003f04:	fc97f0e3          	bgeu	a5,s1,80003ec4 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("C finished!\n");
    80003f08:	00005517          	auipc	a0,0x5
    80003f0c:	46050513          	addi	a0,a0,1120 # 80009368 <CONSOLE_STATUS+0x358>
    80003f10:	00002097          	auipc	ra,0x2
    80003f14:	c24080e7          	jalr	-988(ra) # 80005b34 <_Z11printStringPKc>
    finishedC = true;
    80003f18:	00100793          	li	a5,1
    80003f1c:	00008717          	auipc	a4,0x8
    80003f20:	d6f70723          	sb	a5,-658(a4) # 8000bc8a <_ZL9finishedC>
    thread_dispatch();
    80003f24:	ffffd097          	auipc	ra,0xffffd
    80003f28:	504080e7          	jalr	1284(ra) # 80001428 <_Z15thread_dispatchv>
}
    80003f2c:	01813083          	ld	ra,24(sp)
    80003f30:	01013403          	ld	s0,16(sp)
    80003f34:	00813483          	ld	s1,8(sp)
    80003f38:	00013903          	ld	s2,0(sp)
    80003f3c:	02010113          	addi	sp,sp,32
    80003f40:	00008067          	ret

0000000080003f44 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80003f44:	fe010113          	addi	sp,sp,-32
    80003f48:	00113c23          	sd	ra,24(sp)
    80003f4c:	00813823          	sd	s0,16(sp)
    80003f50:	00913423          	sd	s1,8(sp)
    80003f54:	01213023          	sd	s2,0(sp)
    80003f58:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80003f5c:	00a00493          	li	s1,10
    80003f60:	0400006f          	j	80003fa0 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003f64:	00005517          	auipc	a0,0x5
    80003f68:	41450513          	addi	a0,a0,1044 # 80009378 <CONSOLE_STATUS+0x368>
    80003f6c:	00002097          	auipc	ra,0x2
    80003f70:	bc8080e7          	jalr	-1080(ra) # 80005b34 <_Z11printStringPKc>
    80003f74:	00000613          	li	a2,0
    80003f78:	00a00593          	li	a1,10
    80003f7c:	00048513          	mv	a0,s1
    80003f80:	00002097          	auipc	ra,0x2
    80003f84:	d64080e7          	jalr	-668(ra) # 80005ce4 <_Z8printIntiii>
    80003f88:	00005517          	auipc	a0,0x5
    80003f8c:	5e050513          	addi	a0,a0,1504 # 80009568 <CONSOLE_STATUS+0x558>
    80003f90:	00002097          	auipc	ra,0x2
    80003f94:	ba4080e7          	jalr	-1116(ra) # 80005b34 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80003f98:	0014849b          	addiw	s1,s1,1
    80003f9c:	0ff4f493          	andi	s1,s1,255
    80003fa0:	00c00793          	li	a5,12
    80003fa4:	fc97f0e3          	bgeu	a5,s1,80003f64 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80003fa8:	00005517          	auipc	a0,0x5
    80003fac:	3d850513          	addi	a0,a0,984 # 80009380 <CONSOLE_STATUS+0x370>
    80003fb0:	00002097          	auipc	ra,0x2
    80003fb4:	b84080e7          	jalr	-1148(ra) # 80005b34 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80003fb8:	00500313          	li	t1,5
    thread_dispatch();
    80003fbc:	ffffd097          	auipc	ra,0xffffd
    80003fc0:	46c080e7          	jalr	1132(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80003fc4:	01000513          	li	a0,16
    80003fc8:	00000097          	auipc	ra,0x0
    80003fcc:	be8080e7          	jalr	-1048(ra) # 80003bb0 <_ZL9fibonaccim>
    80003fd0:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80003fd4:	00005517          	auipc	a0,0x5
    80003fd8:	3bc50513          	addi	a0,a0,956 # 80009390 <CONSOLE_STATUS+0x380>
    80003fdc:	00002097          	auipc	ra,0x2
    80003fe0:	b58080e7          	jalr	-1192(ra) # 80005b34 <_Z11printStringPKc>
    80003fe4:	00000613          	li	a2,0
    80003fe8:	00a00593          	li	a1,10
    80003fec:	0009051b          	sext.w	a0,s2
    80003ff0:	00002097          	auipc	ra,0x2
    80003ff4:	cf4080e7          	jalr	-780(ra) # 80005ce4 <_Z8printIntiii>
    80003ff8:	00005517          	auipc	a0,0x5
    80003ffc:	57050513          	addi	a0,a0,1392 # 80009568 <CONSOLE_STATUS+0x558>
    80004000:	00002097          	auipc	ra,0x2
    80004004:	b34080e7          	jalr	-1228(ra) # 80005b34 <_Z11printStringPKc>
    80004008:	0400006f          	j	80004048 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000400c:	00005517          	auipc	a0,0x5
    80004010:	36c50513          	addi	a0,a0,876 # 80009378 <CONSOLE_STATUS+0x368>
    80004014:	00002097          	auipc	ra,0x2
    80004018:	b20080e7          	jalr	-1248(ra) # 80005b34 <_Z11printStringPKc>
    8000401c:	00000613          	li	a2,0
    80004020:	00a00593          	li	a1,10
    80004024:	00048513          	mv	a0,s1
    80004028:	00002097          	auipc	ra,0x2
    8000402c:	cbc080e7          	jalr	-836(ra) # 80005ce4 <_Z8printIntiii>
    80004030:	00005517          	auipc	a0,0x5
    80004034:	53850513          	addi	a0,a0,1336 # 80009568 <CONSOLE_STATUS+0x558>
    80004038:	00002097          	auipc	ra,0x2
    8000403c:	afc080e7          	jalr	-1284(ra) # 80005b34 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004040:	0014849b          	addiw	s1,s1,1
    80004044:	0ff4f493          	andi	s1,s1,255
    80004048:	00f00793          	li	a5,15
    8000404c:	fc97f0e3          	bgeu	a5,s1,8000400c <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80004050:	00005517          	auipc	a0,0x5
    80004054:	35050513          	addi	a0,a0,848 # 800093a0 <CONSOLE_STATUS+0x390>
    80004058:	00002097          	auipc	ra,0x2
    8000405c:	adc080e7          	jalr	-1316(ra) # 80005b34 <_Z11printStringPKc>
    finishedD = true;
    80004060:	00100793          	li	a5,1
    80004064:	00008717          	auipc	a4,0x8
    80004068:	c2f703a3          	sb	a5,-985(a4) # 8000bc8b <_ZL9finishedD>
    thread_dispatch();
    8000406c:	ffffd097          	auipc	ra,0xffffd
    80004070:	3bc080e7          	jalr	956(ra) # 80001428 <_Z15thread_dispatchv>
}
    80004074:	01813083          	ld	ra,24(sp)
    80004078:	01013403          	ld	s0,16(sp)
    8000407c:	00813483          	ld	s1,8(sp)
    80004080:	00013903          	ld	s2,0(sp)
    80004084:	02010113          	addi	sp,sp,32
    80004088:	00008067          	ret

000000008000408c <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    8000408c:	fc010113          	addi	sp,sp,-64
    80004090:	02113c23          	sd	ra,56(sp)
    80004094:	02813823          	sd	s0,48(sp)
    80004098:	02913423          	sd	s1,40(sp)
    8000409c:	03213023          	sd	s2,32(sp)
    800040a0:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    800040a4:	02000513          	li	a0,32
    800040a8:	ffffe097          	auipc	ra,0xffffe
    800040ac:	5f8080e7          	jalr	1528(ra) # 800026a0 <_Znwm>
    800040b0:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    800040b4:	fffff097          	auipc	ra,0xfffff
    800040b8:	8b4080e7          	jalr	-1868(ra) # 80002968 <_ZN6ThreadC1Ev>
    800040bc:	00008797          	auipc	a5,0x8
    800040c0:	85478793          	addi	a5,a5,-1964 # 8000b910 <_ZTV7WorkerA+0x10>
    800040c4:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    800040c8:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    800040cc:	00005517          	auipc	a0,0x5
    800040d0:	2e450513          	addi	a0,a0,740 # 800093b0 <CONSOLE_STATUS+0x3a0>
    800040d4:	00002097          	auipc	ra,0x2
    800040d8:	a60080e7          	jalr	-1440(ra) # 80005b34 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    800040dc:	02000513          	li	a0,32
    800040e0:	ffffe097          	auipc	ra,0xffffe
    800040e4:	5c0080e7          	jalr	1472(ra) # 800026a0 <_Znwm>
    800040e8:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    800040ec:	fffff097          	auipc	ra,0xfffff
    800040f0:	87c080e7          	jalr	-1924(ra) # 80002968 <_ZN6ThreadC1Ev>
    800040f4:	00008797          	auipc	a5,0x8
    800040f8:	84478793          	addi	a5,a5,-1980 # 8000b938 <_ZTV7WorkerB+0x10>
    800040fc:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80004100:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80004104:	00005517          	auipc	a0,0x5
    80004108:	2c450513          	addi	a0,a0,708 # 800093c8 <CONSOLE_STATUS+0x3b8>
    8000410c:	00002097          	auipc	ra,0x2
    80004110:	a28080e7          	jalr	-1496(ra) # 80005b34 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80004114:	02000513          	li	a0,32
    80004118:	ffffe097          	auipc	ra,0xffffe
    8000411c:	588080e7          	jalr	1416(ra) # 800026a0 <_Znwm>
    80004120:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80004124:	fffff097          	auipc	ra,0xfffff
    80004128:	844080e7          	jalr	-1980(ra) # 80002968 <_ZN6ThreadC1Ev>
    8000412c:	00008797          	auipc	a5,0x8
    80004130:	83478793          	addi	a5,a5,-1996 # 8000b960 <_ZTV7WorkerC+0x10>
    80004134:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80004138:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    8000413c:	00005517          	auipc	a0,0x5
    80004140:	2a450513          	addi	a0,a0,676 # 800093e0 <CONSOLE_STATUS+0x3d0>
    80004144:	00002097          	auipc	ra,0x2
    80004148:	9f0080e7          	jalr	-1552(ra) # 80005b34 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    8000414c:	02000513          	li	a0,32
    80004150:	ffffe097          	auipc	ra,0xffffe
    80004154:	550080e7          	jalr	1360(ra) # 800026a0 <_Znwm>
    80004158:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    8000415c:	fffff097          	auipc	ra,0xfffff
    80004160:	80c080e7          	jalr	-2036(ra) # 80002968 <_ZN6ThreadC1Ev>
    80004164:	00008797          	auipc	a5,0x8
    80004168:	82478793          	addi	a5,a5,-2012 # 8000b988 <_ZTV7WorkerD+0x10>
    8000416c:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80004170:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80004174:	00005517          	auipc	a0,0x5
    80004178:	28450513          	addi	a0,a0,644 # 800093f8 <CONSOLE_STATUS+0x3e8>
    8000417c:	00002097          	auipc	ra,0x2
    80004180:	9b8080e7          	jalr	-1608(ra) # 80005b34 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80004184:	00000493          	li	s1,0
    80004188:	00300793          	li	a5,3
    8000418c:	0297c663          	blt	a5,s1,800041b8 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80004190:	00349793          	slli	a5,s1,0x3
    80004194:	fe040713          	addi	a4,s0,-32
    80004198:	00f707b3          	add	a5,a4,a5
    8000419c:	fe07b503          	ld	a0,-32(a5)
    800041a0:	ffffe097          	auipc	ra,0xffffe
    800041a4:	6b0080e7          	jalr	1712(ra) # 80002850 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    800041a8:	0014849b          	addiw	s1,s1,1
    800041ac:	fddff06f          	j	80004188 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    800041b0:	ffffe097          	auipc	ra,0xffffe
    800041b4:	704080e7          	jalr	1796(ra) # 800028b4 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800041b8:	00008797          	auipc	a5,0x8
    800041bc:	ad07c783          	lbu	a5,-1328(a5) # 8000bc88 <_ZL9finishedA>
    800041c0:	fe0788e3          	beqz	a5,800041b0 <_Z20Threads_CPP_API_testv+0x124>
    800041c4:	00008797          	auipc	a5,0x8
    800041c8:	ac57c783          	lbu	a5,-1339(a5) # 8000bc89 <_ZL9finishedB>
    800041cc:	fe0782e3          	beqz	a5,800041b0 <_Z20Threads_CPP_API_testv+0x124>
    800041d0:	00008797          	auipc	a5,0x8
    800041d4:	aba7c783          	lbu	a5,-1350(a5) # 8000bc8a <_ZL9finishedC>
    800041d8:	fc078ce3          	beqz	a5,800041b0 <_Z20Threads_CPP_API_testv+0x124>
    800041dc:	00008797          	auipc	a5,0x8
    800041e0:	aaf7c783          	lbu	a5,-1361(a5) # 8000bc8b <_ZL9finishedD>
    800041e4:	fc0786e3          	beqz	a5,800041b0 <_Z20Threads_CPP_API_testv+0x124>
    800041e8:	fc040493          	addi	s1,s0,-64
    800041ec:	0080006f          	j	800041f4 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) {
    800041f0:	00848493          	addi	s1,s1,8
    800041f4:	fe040793          	addi	a5,s0,-32
    800041f8:	08f48663          	beq	s1,a5,80004284 <_Z20Threads_CPP_API_testv+0x1f8>
    800041fc:	0004b503          	ld	a0,0(s1)
		delete thread;
    80004200:	fe0508e3          	beqz	a0,800041f0 <_Z20Threads_CPP_API_testv+0x164>
    80004204:	00053783          	ld	a5,0(a0)
    80004208:	0087b783          	ld	a5,8(a5)
    8000420c:	000780e7          	jalr	a5
    80004210:	fe1ff06f          	j	800041f0 <_Z20Threads_CPP_API_testv+0x164>
    80004214:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80004218:	00048513          	mv	a0,s1
    8000421c:	ffffe097          	auipc	ra,0xffffe
    80004220:	4d4080e7          	jalr	1236(ra) # 800026f0 <_ZdlPv>
    80004224:	00090513          	mv	a0,s2
    80004228:	00009097          	auipc	ra,0x9
    8000422c:	b70080e7          	jalr	-1168(ra) # 8000cd98 <_Unwind_Resume>
    80004230:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80004234:	00048513          	mv	a0,s1
    80004238:	ffffe097          	auipc	ra,0xffffe
    8000423c:	4b8080e7          	jalr	1208(ra) # 800026f0 <_ZdlPv>
    80004240:	00090513          	mv	a0,s2
    80004244:	00009097          	auipc	ra,0x9
    80004248:	b54080e7          	jalr	-1196(ra) # 8000cd98 <_Unwind_Resume>
    8000424c:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80004250:	00048513          	mv	a0,s1
    80004254:	ffffe097          	auipc	ra,0xffffe
    80004258:	49c080e7          	jalr	1180(ra) # 800026f0 <_ZdlPv>
    8000425c:	00090513          	mv	a0,s2
    80004260:	00009097          	auipc	ra,0x9
    80004264:	b38080e7          	jalr	-1224(ra) # 8000cd98 <_Unwind_Resume>
    80004268:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    8000426c:	00048513          	mv	a0,s1
    80004270:	ffffe097          	auipc	ra,0xffffe
    80004274:	480080e7          	jalr	1152(ra) # 800026f0 <_ZdlPv>
    80004278:	00090513          	mv	a0,s2
    8000427c:	00009097          	auipc	ra,0x9
    80004280:	b1c080e7          	jalr	-1252(ra) # 8000cd98 <_Unwind_Resume>
	}
}
    80004284:	03813083          	ld	ra,56(sp)
    80004288:	03013403          	ld	s0,48(sp)
    8000428c:	02813483          	ld	s1,40(sp)
    80004290:	02013903          	ld	s2,32(sp)
    80004294:	04010113          	addi	sp,sp,64
    80004298:	00008067          	ret

000000008000429c <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    8000429c:	ff010113          	addi	sp,sp,-16
    800042a0:	00113423          	sd	ra,8(sp)
    800042a4:	00813023          	sd	s0,0(sp)
    800042a8:	01010413          	addi	s0,sp,16
    800042ac:	00007797          	auipc	a5,0x7
    800042b0:	66478793          	addi	a5,a5,1636 # 8000b910 <_ZTV7WorkerA+0x10>
    800042b4:	00f53023          	sd	a5,0(a0)
    800042b8:	ffffe097          	auipc	ra,0xffffe
    800042bc:	2f8080e7          	jalr	760(ra) # 800025b0 <_ZN6ThreadD1Ev>
    800042c0:	00813083          	ld	ra,8(sp)
    800042c4:	00013403          	ld	s0,0(sp)
    800042c8:	01010113          	addi	sp,sp,16
    800042cc:	00008067          	ret

00000000800042d0 <_ZN7WorkerAD0Ev>:
    800042d0:	fe010113          	addi	sp,sp,-32
    800042d4:	00113c23          	sd	ra,24(sp)
    800042d8:	00813823          	sd	s0,16(sp)
    800042dc:	00913423          	sd	s1,8(sp)
    800042e0:	02010413          	addi	s0,sp,32
    800042e4:	00050493          	mv	s1,a0
    800042e8:	00007797          	auipc	a5,0x7
    800042ec:	62878793          	addi	a5,a5,1576 # 8000b910 <_ZTV7WorkerA+0x10>
    800042f0:	00f53023          	sd	a5,0(a0)
    800042f4:	ffffe097          	auipc	ra,0xffffe
    800042f8:	2bc080e7          	jalr	700(ra) # 800025b0 <_ZN6ThreadD1Ev>
    800042fc:	00048513          	mv	a0,s1
    80004300:	ffffe097          	auipc	ra,0xffffe
    80004304:	3f0080e7          	jalr	1008(ra) # 800026f0 <_ZdlPv>
    80004308:	01813083          	ld	ra,24(sp)
    8000430c:	01013403          	ld	s0,16(sp)
    80004310:	00813483          	ld	s1,8(sp)
    80004314:	02010113          	addi	sp,sp,32
    80004318:	00008067          	ret

000000008000431c <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    8000431c:	ff010113          	addi	sp,sp,-16
    80004320:	00113423          	sd	ra,8(sp)
    80004324:	00813023          	sd	s0,0(sp)
    80004328:	01010413          	addi	s0,sp,16
    8000432c:	00007797          	auipc	a5,0x7
    80004330:	60c78793          	addi	a5,a5,1548 # 8000b938 <_ZTV7WorkerB+0x10>
    80004334:	00f53023          	sd	a5,0(a0)
    80004338:	ffffe097          	auipc	ra,0xffffe
    8000433c:	278080e7          	jalr	632(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80004340:	00813083          	ld	ra,8(sp)
    80004344:	00013403          	ld	s0,0(sp)
    80004348:	01010113          	addi	sp,sp,16
    8000434c:	00008067          	ret

0000000080004350 <_ZN7WorkerBD0Ev>:
    80004350:	fe010113          	addi	sp,sp,-32
    80004354:	00113c23          	sd	ra,24(sp)
    80004358:	00813823          	sd	s0,16(sp)
    8000435c:	00913423          	sd	s1,8(sp)
    80004360:	02010413          	addi	s0,sp,32
    80004364:	00050493          	mv	s1,a0
    80004368:	00007797          	auipc	a5,0x7
    8000436c:	5d078793          	addi	a5,a5,1488 # 8000b938 <_ZTV7WorkerB+0x10>
    80004370:	00f53023          	sd	a5,0(a0)
    80004374:	ffffe097          	auipc	ra,0xffffe
    80004378:	23c080e7          	jalr	572(ra) # 800025b0 <_ZN6ThreadD1Ev>
    8000437c:	00048513          	mv	a0,s1
    80004380:	ffffe097          	auipc	ra,0xffffe
    80004384:	370080e7          	jalr	880(ra) # 800026f0 <_ZdlPv>
    80004388:	01813083          	ld	ra,24(sp)
    8000438c:	01013403          	ld	s0,16(sp)
    80004390:	00813483          	ld	s1,8(sp)
    80004394:	02010113          	addi	sp,sp,32
    80004398:	00008067          	ret

000000008000439c <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    8000439c:	ff010113          	addi	sp,sp,-16
    800043a0:	00113423          	sd	ra,8(sp)
    800043a4:	00813023          	sd	s0,0(sp)
    800043a8:	01010413          	addi	s0,sp,16
    800043ac:	00007797          	auipc	a5,0x7
    800043b0:	5b478793          	addi	a5,a5,1460 # 8000b960 <_ZTV7WorkerC+0x10>
    800043b4:	00f53023          	sd	a5,0(a0)
    800043b8:	ffffe097          	auipc	ra,0xffffe
    800043bc:	1f8080e7          	jalr	504(ra) # 800025b0 <_ZN6ThreadD1Ev>
    800043c0:	00813083          	ld	ra,8(sp)
    800043c4:	00013403          	ld	s0,0(sp)
    800043c8:	01010113          	addi	sp,sp,16
    800043cc:	00008067          	ret

00000000800043d0 <_ZN7WorkerCD0Ev>:
    800043d0:	fe010113          	addi	sp,sp,-32
    800043d4:	00113c23          	sd	ra,24(sp)
    800043d8:	00813823          	sd	s0,16(sp)
    800043dc:	00913423          	sd	s1,8(sp)
    800043e0:	02010413          	addi	s0,sp,32
    800043e4:	00050493          	mv	s1,a0
    800043e8:	00007797          	auipc	a5,0x7
    800043ec:	57878793          	addi	a5,a5,1400 # 8000b960 <_ZTV7WorkerC+0x10>
    800043f0:	00f53023          	sd	a5,0(a0)
    800043f4:	ffffe097          	auipc	ra,0xffffe
    800043f8:	1bc080e7          	jalr	444(ra) # 800025b0 <_ZN6ThreadD1Ev>
    800043fc:	00048513          	mv	a0,s1
    80004400:	ffffe097          	auipc	ra,0xffffe
    80004404:	2f0080e7          	jalr	752(ra) # 800026f0 <_ZdlPv>
    80004408:	01813083          	ld	ra,24(sp)
    8000440c:	01013403          	ld	s0,16(sp)
    80004410:	00813483          	ld	s1,8(sp)
    80004414:	02010113          	addi	sp,sp,32
    80004418:	00008067          	ret

000000008000441c <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    8000441c:	ff010113          	addi	sp,sp,-16
    80004420:	00113423          	sd	ra,8(sp)
    80004424:	00813023          	sd	s0,0(sp)
    80004428:	01010413          	addi	s0,sp,16
    8000442c:	00007797          	auipc	a5,0x7
    80004430:	55c78793          	addi	a5,a5,1372 # 8000b988 <_ZTV7WorkerD+0x10>
    80004434:	00f53023          	sd	a5,0(a0)
    80004438:	ffffe097          	auipc	ra,0xffffe
    8000443c:	178080e7          	jalr	376(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80004440:	00813083          	ld	ra,8(sp)
    80004444:	00013403          	ld	s0,0(sp)
    80004448:	01010113          	addi	sp,sp,16
    8000444c:	00008067          	ret

0000000080004450 <_ZN7WorkerDD0Ev>:
    80004450:	fe010113          	addi	sp,sp,-32
    80004454:	00113c23          	sd	ra,24(sp)
    80004458:	00813823          	sd	s0,16(sp)
    8000445c:	00913423          	sd	s1,8(sp)
    80004460:	02010413          	addi	s0,sp,32
    80004464:	00050493          	mv	s1,a0
    80004468:	00007797          	auipc	a5,0x7
    8000446c:	52078793          	addi	a5,a5,1312 # 8000b988 <_ZTV7WorkerD+0x10>
    80004470:	00f53023          	sd	a5,0(a0)
    80004474:	ffffe097          	auipc	ra,0xffffe
    80004478:	13c080e7          	jalr	316(ra) # 800025b0 <_ZN6ThreadD1Ev>
    8000447c:	00048513          	mv	a0,s1
    80004480:	ffffe097          	auipc	ra,0xffffe
    80004484:	270080e7          	jalr	624(ra) # 800026f0 <_ZdlPv>
    80004488:	01813083          	ld	ra,24(sp)
    8000448c:	01013403          	ld	s0,16(sp)
    80004490:	00813483          	ld	s1,8(sp)
    80004494:	02010113          	addi	sp,sp,32
    80004498:	00008067          	ret

000000008000449c <_ZN7WorkerA3runEv>:
    void run() override {
    8000449c:	ff010113          	addi	sp,sp,-16
    800044a0:	00113423          	sd	ra,8(sp)
    800044a4:	00813023          	sd	s0,0(sp)
    800044a8:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    800044ac:	00000593          	li	a1,0
    800044b0:	fffff097          	auipc	ra,0xfffff
    800044b4:	774080e7          	jalr	1908(ra) # 80003c24 <_ZN7WorkerA11workerBodyAEPv>
    }
    800044b8:	00813083          	ld	ra,8(sp)
    800044bc:	00013403          	ld	s0,0(sp)
    800044c0:	01010113          	addi	sp,sp,16
    800044c4:	00008067          	ret

00000000800044c8 <_ZN7WorkerB3runEv>:
    void run() override {
    800044c8:	ff010113          	addi	sp,sp,-16
    800044cc:	00113423          	sd	ra,8(sp)
    800044d0:	00813023          	sd	s0,0(sp)
    800044d4:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    800044d8:	00000593          	li	a1,0
    800044dc:	00000097          	auipc	ra,0x0
    800044e0:	814080e7          	jalr	-2028(ra) # 80003cf0 <_ZN7WorkerB11workerBodyBEPv>
    }
    800044e4:	00813083          	ld	ra,8(sp)
    800044e8:	00013403          	ld	s0,0(sp)
    800044ec:	01010113          	addi	sp,sp,16
    800044f0:	00008067          	ret

00000000800044f4 <_ZN7WorkerC3runEv>:
    void run() override {
    800044f4:	ff010113          	addi	sp,sp,-16
    800044f8:	00113423          	sd	ra,8(sp)
    800044fc:	00813023          	sd	s0,0(sp)
    80004500:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80004504:	00000593          	li	a1,0
    80004508:	00000097          	auipc	ra,0x0
    8000450c:	8bc080e7          	jalr	-1860(ra) # 80003dc4 <_ZN7WorkerC11workerBodyCEPv>
    }
    80004510:	00813083          	ld	ra,8(sp)
    80004514:	00013403          	ld	s0,0(sp)
    80004518:	01010113          	addi	sp,sp,16
    8000451c:	00008067          	ret

0000000080004520 <_ZN7WorkerD3runEv>:
    void run() override {
    80004520:	ff010113          	addi	sp,sp,-16
    80004524:	00113423          	sd	ra,8(sp)
    80004528:	00813023          	sd	s0,0(sp)
    8000452c:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80004530:	00000593          	li	a1,0
    80004534:	00000097          	auipc	ra,0x0
    80004538:	a10080e7          	jalr	-1520(ra) # 80003f44 <_ZN7WorkerD11workerBodyDEPv>
    }
    8000453c:	00813083          	ld	ra,8(sp)
    80004540:	00013403          	ld	s0,0(sp)
    80004544:	01010113          	addi	sp,sp,16
    80004548:	00008067          	ret

000000008000454c <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    8000454c:	f8010113          	addi	sp,sp,-128
    80004550:	06113c23          	sd	ra,120(sp)
    80004554:	06813823          	sd	s0,112(sp)
    80004558:	06913423          	sd	s1,104(sp)
    8000455c:	07213023          	sd	s2,96(sp)
    80004560:	05313c23          	sd	s3,88(sp)
    80004564:	05413823          	sd	s4,80(sp)
    80004568:	05513423          	sd	s5,72(sp)
    8000456c:	05613023          	sd	s6,64(sp)
    80004570:	03713c23          	sd	s7,56(sp)
    80004574:	03813823          	sd	s8,48(sp)
    80004578:	03913423          	sd	s9,40(sp)
    8000457c:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    80004580:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    80004584:	00005517          	auipc	a0,0x5
    80004588:	c9c50513          	addi	a0,a0,-868 # 80009220 <CONSOLE_STATUS+0x210>
    8000458c:	00001097          	auipc	ra,0x1
    80004590:	5a8080e7          	jalr	1448(ra) # 80005b34 <_Z11printStringPKc>
    getString(input, 30);
    80004594:	01e00593          	li	a1,30
    80004598:	f8040493          	addi	s1,s0,-128
    8000459c:	00048513          	mv	a0,s1
    800045a0:	00001097          	auipc	ra,0x1
    800045a4:	61c080e7          	jalr	1564(ra) # 80005bbc <_Z9getStringPci>
    threadNum = stringToInt(input);
    800045a8:	00048513          	mv	a0,s1
    800045ac:	00001097          	auipc	ra,0x1
    800045b0:	6e8080e7          	jalr	1768(ra) # 80005c94 <_Z11stringToIntPKc>
    800045b4:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    800045b8:	00005517          	auipc	a0,0x5
    800045bc:	c8850513          	addi	a0,a0,-888 # 80009240 <CONSOLE_STATUS+0x230>
    800045c0:	00001097          	auipc	ra,0x1
    800045c4:	574080e7          	jalr	1396(ra) # 80005b34 <_Z11printStringPKc>
    getString(input, 30);
    800045c8:	01e00593          	li	a1,30
    800045cc:	00048513          	mv	a0,s1
    800045d0:	00001097          	auipc	ra,0x1
    800045d4:	5ec080e7          	jalr	1516(ra) # 80005bbc <_Z9getStringPci>
    n = stringToInt(input);
    800045d8:	00048513          	mv	a0,s1
    800045dc:	00001097          	auipc	ra,0x1
    800045e0:	6b8080e7          	jalr	1720(ra) # 80005c94 <_Z11stringToIntPKc>
    800045e4:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    800045e8:	00005517          	auipc	a0,0x5
    800045ec:	c7850513          	addi	a0,a0,-904 # 80009260 <CONSOLE_STATUS+0x250>
    800045f0:	00001097          	auipc	ra,0x1
    800045f4:	544080e7          	jalr	1348(ra) # 80005b34 <_Z11printStringPKc>
    printInt(threadNum);
    800045f8:	00000613          	li	a2,0
    800045fc:	00a00593          	li	a1,10
    80004600:	00098513          	mv	a0,s3
    80004604:	00001097          	auipc	ra,0x1
    80004608:	6e0080e7          	jalr	1760(ra) # 80005ce4 <_Z8printIntiii>
    printString(" i velicina bafera ");
    8000460c:	00005517          	auipc	a0,0x5
    80004610:	c6c50513          	addi	a0,a0,-916 # 80009278 <CONSOLE_STATUS+0x268>
    80004614:	00001097          	auipc	ra,0x1
    80004618:	520080e7          	jalr	1312(ra) # 80005b34 <_Z11printStringPKc>
    printInt(n);
    8000461c:	00000613          	li	a2,0
    80004620:	00a00593          	li	a1,10
    80004624:	00048513          	mv	a0,s1
    80004628:	00001097          	auipc	ra,0x1
    8000462c:	6bc080e7          	jalr	1724(ra) # 80005ce4 <_Z8printIntiii>
    printString(".\n");
    80004630:	00005517          	auipc	a0,0x5
    80004634:	c6050513          	addi	a0,a0,-928 # 80009290 <CONSOLE_STATUS+0x280>
    80004638:	00001097          	auipc	ra,0x1
    8000463c:	4fc080e7          	jalr	1276(ra) # 80005b34 <_Z11printStringPKc>
    if (threadNum > n) {
    80004640:	0334c463          	blt	s1,s3,80004668 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    80004644:	03305c63          	blez	s3,8000467c <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80004648:	03800513          	li	a0,56
    8000464c:	ffffe097          	auipc	ra,0xffffe
    80004650:	054080e7          	jalr	84(ra) # 800026a0 <_Znwm>
    80004654:	00050a93          	mv	s5,a0
    80004658:	00048593          	mv	a1,s1
    8000465c:	00001097          	auipc	ra,0x1
    80004660:	7a8080e7          	jalr	1960(ra) # 80005e04 <_ZN9BufferCPPC1Ei>
    80004664:	0300006f          	j	80004694 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80004668:	00005517          	auipc	a0,0x5
    8000466c:	c3050513          	addi	a0,a0,-976 # 80009298 <CONSOLE_STATUS+0x288>
    80004670:	00001097          	auipc	ra,0x1
    80004674:	4c4080e7          	jalr	1220(ra) # 80005b34 <_Z11printStringPKc>
        return;
    80004678:	0140006f          	j	8000468c <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    8000467c:	00005517          	auipc	a0,0x5
    80004680:	c5c50513          	addi	a0,a0,-932 # 800092d8 <CONSOLE_STATUS+0x2c8>
    80004684:	00001097          	auipc	ra,0x1
    80004688:	4b0080e7          	jalr	1200(ra) # 80005b34 <_Z11printStringPKc>
        return;
    8000468c:	000c0113          	mv	sp,s8
    80004690:	2140006f          	j	800048a4 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    80004694:	01000513          	li	a0,16
    80004698:	ffffe097          	auipc	ra,0xffffe
    8000469c:	008080e7          	jalr	8(ra) # 800026a0 <_Znwm>
    800046a0:	00050913          	mv	s2,a0
    800046a4:	00000593          	li	a1,0
    800046a8:	ffffe097          	auipc	ra,0xffffe
    800046ac:	33c080e7          	jalr	828(ra) # 800029e4 <_ZN9SemaphoreC1Ej>
    800046b0:	00007797          	auipc	a5,0x7
    800046b4:	5f27b423          	sd	s2,1512(a5) # 8000bc98 <_ZL10waitForAll>
    Thread *producers[threadNum];
    800046b8:	00399793          	slli	a5,s3,0x3
    800046bc:	00f78793          	addi	a5,a5,15
    800046c0:	ff07f793          	andi	a5,a5,-16
    800046c4:	40f10133          	sub	sp,sp,a5
    800046c8:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    800046cc:	0019871b          	addiw	a4,s3,1
    800046d0:	00171793          	slli	a5,a4,0x1
    800046d4:	00e787b3          	add	a5,a5,a4
    800046d8:	00379793          	slli	a5,a5,0x3
    800046dc:	00f78793          	addi	a5,a5,15
    800046e0:	ff07f793          	andi	a5,a5,-16
    800046e4:	40f10133          	sub	sp,sp,a5
    800046e8:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    800046ec:	00199493          	slli	s1,s3,0x1
    800046f0:	013484b3          	add	s1,s1,s3
    800046f4:	00349493          	slli	s1,s1,0x3
    800046f8:	009b04b3          	add	s1,s6,s1
    800046fc:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80004700:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80004704:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004708:	02800513          	li	a0,40
    8000470c:	ffffe097          	auipc	ra,0xffffe
    80004710:	f94080e7          	jalr	-108(ra) # 800026a0 <_Znwm>
    80004714:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80004718:	ffffe097          	auipc	ra,0xffffe
    8000471c:	250080e7          	jalr	592(ra) # 80002968 <_ZN6ThreadC1Ev>
    80004720:	00007797          	auipc	a5,0x7
    80004724:	2e078793          	addi	a5,a5,736 # 8000ba00 <_ZTV8Consumer+0x10>
    80004728:	00fbb023          	sd	a5,0(s7)
    8000472c:	029bb023          	sd	s1,32(s7)
    consumer->start();
    80004730:	000b8513          	mv	a0,s7
    80004734:	ffffe097          	auipc	ra,0xffffe
    80004738:	11c080e7          	jalr	284(ra) # 80002850 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    8000473c:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    80004740:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    80004744:	00007797          	auipc	a5,0x7
    80004748:	5547b783          	ld	a5,1364(a5) # 8000bc98 <_ZL10waitForAll>
    8000474c:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004750:	02800513          	li	a0,40
    80004754:	ffffe097          	auipc	ra,0xffffe
    80004758:	f4c080e7          	jalr	-180(ra) # 800026a0 <_Znwm>
    8000475c:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80004760:	ffffe097          	auipc	ra,0xffffe
    80004764:	208080e7          	jalr	520(ra) # 80002968 <_ZN6ThreadC1Ev>
    80004768:	00007797          	auipc	a5,0x7
    8000476c:	24878793          	addi	a5,a5,584 # 8000b9b0 <_ZTV16ProducerKeyborad+0x10>
    80004770:	00f4b023          	sd	a5,0(s1)
    80004774:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004778:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    8000477c:	00048513          	mv	a0,s1
    80004780:	ffffe097          	auipc	ra,0xffffe
    80004784:	0d0080e7          	jalr	208(ra) # 80002850 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004788:	00100913          	li	s2,1
    8000478c:	0300006f          	j	800047bc <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004790:	00007797          	auipc	a5,0x7
    80004794:	24878793          	addi	a5,a5,584 # 8000b9d8 <_ZTV8Producer+0x10>
    80004798:	00fcb023          	sd	a5,0(s9)
    8000479c:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    800047a0:	00391793          	slli	a5,s2,0x3
    800047a4:	00fa07b3          	add	a5,s4,a5
    800047a8:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    800047ac:	000c8513          	mv	a0,s9
    800047b0:	ffffe097          	auipc	ra,0xffffe
    800047b4:	0a0080e7          	jalr	160(ra) # 80002850 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    800047b8:	0019091b          	addiw	s2,s2,1
    800047bc:	05395263          	bge	s2,s3,80004800 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    800047c0:	00191493          	slli	s1,s2,0x1
    800047c4:	012484b3          	add	s1,s1,s2
    800047c8:	00349493          	slli	s1,s1,0x3
    800047cc:	009b04b3          	add	s1,s6,s1
    800047d0:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    800047d4:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    800047d8:	00007797          	auipc	a5,0x7
    800047dc:	4c07b783          	ld	a5,1216(a5) # 8000bc98 <_ZL10waitForAll>
    800047e0:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    800047e4:	02800513          	li	a0,40
    800047e8:	ffffe097          	auipc	ra,0xffffe
    800047ec:	eb8080e7          	jalr	-328(ra) # 800026a0 <_Znwm>
    800047f0:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    800047f4:	ffffe097          	auipc	ra,0xffffe
    800047f8:	174080e7          	jalr	372(ra) # 80002968 <_ZN6ThreadC1Ev>
    800047fc:	f95ff06f          	j	80004790 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    80004800:	ffffe097          	auipc	ra,0xffffe
    80004804:	0b4080e7          	jalr	180(ra) # 800028b4 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80004808:	00000493          	li	s1,0
    8000480c:	0099ce63          	blt	s3,s1,80004828 <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    80004810:	00007517          	auipc	a0,0x7
    80004814:	48853503          	ld	a0,1160(a0) # 8000bc98 <_ZL10waitForAll>
    80004818:	ffffe097          	auipc	ra,0xffffe
    8000481c:	204080e7          	jalr	516(ra) # 80002a1c <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80004820:	0014849b          	addiw	s1,s1,1
    80004824:	fe9ff06f          	j	8000480c <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    80004828:	00007517          	auipc	a0,0x7
    8000482c:	47053503          	ld	a0,1136(a0) # 8000bc98 <_ZL10waitForAll>
    80004830:	00050863          	beqz	a0,80004840 <_Z20testConsumerProducerv+0x2f4>
    80004834:	00053783          	ld	a5,0(a0)
    80004838:	0087b783          	ld	a5,8(a5)
    8000483c:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    80004840:	00000493          	li	s1,0
    80004844:	0080006f          	j	8000484c <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    80004848:	0014849b          	addiw	s1,s1,1
    8000484c:	0334d263          	bge	s1,s3,80004870 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    80004850:	00349793          	slli	a5,s1,0x3
    80004854:	00fa07b3          	add	a5,s4,a5
    80004858:	0007b503          	ld	a0,0(a5)
    8000485c:	fe0506e3          	beqz	a0,80004848 <_Z20testConsumerProducerv+0x2fc>
    80004860:	00053783          	ld	a5,0(a0)
    80004864:	0087b783          	ld	a5,8(a5)
    80004868:	000780e7          	jalr	a5
    8000486c:	fddff06f          	j	80004848 <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    80004870:	000b8a63          	beqz	s7,80004884 <_Z20testConsumerProducerv+0x338>
    80004874:	000bb783          	ld	a5,0(s7)
    80004878:	0087b783          	ld	a5,8(a5)
    8000487c:	000b8513          	mv	a0,s7
    80004880:	000780e7          	jalr	a5
    delete buffer;
    80004884:	000a8e63          	beqz	s5,800048a0 <_Z20testConsumerProducerv+0x354>
    80004888:	000a8513          	mv	a0,s5
    8000488c:	00002097          	auipc	ra,0x2
    80004890:	870080e7          	jalr	-1936(ra) # 800060fc <_ZN9BufferCPPD1Ev>
    80004894:	000a8513          	mv	a0,s5
    80004898:	ffffe097          	auipc	ra,0xffffe
    8000489c:	e58080e7          	jalr	-424(ra) # 800026f0 <_ZdlPv>
    800048a0:	000c0113          	mv	sp,s8
}
    800048a4:	f8040113          	addi	sp,s0,-128
    800048a8:	07813083          	ld	ra,120(sp)
    800048ac:	07013403          	ld	s0,112(sp)
    800048b0:	06813483          	ld	s1,104(sp)
    800048b4:	06013903          	ld	s2,96(sp)
    800048b8:	05813983          	ld	s3,88(sp)
    800048bc:	05013a03          	ld	s4,80(sp)
    800048c0:	04813a83          	ld	s5,72(sp)
    800048c4:	04013b03          	ld	s6,64(sp)
    800048c8:	03813b83          	ld	s7,56(sp)
    800048cc:	03013c03          	ld	s8,48(sp)
    800048d0:	02813c83          	ld	s9,40(sp)
    800048d4:	08010113          	addi	sp,sp,128
    800048d8:	00008067          	ret
    800048dc:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    800048e0:	000a8513          	mv	a0,s5
    800048e4:	ffffe097          	auipc	ra,0xffffe
    800048e8:	e0c080e7          	jalr	-500(ra) # 800026f0 <_ZdlPv>
    800048ec:	00048513          	mv	a0,s1
    800048f0:	00008097          	auipc	ra,0x8
    800048f4:	4a8080e7          	jalr	1192(ra) # 8000cd98 <_Unwind_Resume>
    800048f8:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    800048fc:	00090513          	mv	a0,s2
    80004900:	ffffe097          	auipc	ra,0xffffe
    80004904:	df0080e7          	jalr	-528(ra) # 800026f0 <_ZdlPv>
    80004908:	00048513          	mv	a0,s1
    8000490c:	00008097          	auipc	ra,0x8
    80004910:	48c080e7          	jalr	1164(ra) # 8000cd98 <_Unwind_Resume>
    80004914:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004918:	000b8513          	mv	a0,s7
    8000491c:	ffffe097          	auipc	ra,0xffffe
    80004920:	dd4080e7          	jalr	-556(ra) # 800026f0 <_ZdlPv>
    80004924:	00048513          	mv	a0,s1
    80004928:	00008097          	auipc	ra,0x8
    8000492c:	470080e7          	jalr	1136(ra) # 8000cd98 <_Unwind_Resume>
    80004930:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004934:	00048513          	mv	a0,s1
    80004938:	ffffe097          	auipc	ra,0xffffe
    8000493c:	db8080e7          	jalr	-584(ra) # 800026f0 <_ZdlPv>
    80004940:	00090513          	mv	a0,s2
    80004944:	00008097          	auipc	ra,0x8
    80004948:	454080e7          	jalr	1108(ra) # 8000cd98 <_Unwind_Resume>
    8000494c:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    80004950:	000c8513          	mv	a0,s9
    80004954:	ffffe097          	auipc	ra,0xffffe
    80004958:	d9c080e7          	jalr	-612(ra) # 800026f0 <_ZdlPv>
    8000495c:	00048513          	mv	a0,s1
    80004960:	00008097          	auipc	ra,0x8
    80004964:	438080e7          	jalr	1080(ra) # 8000cd98 <_Unwind_Resume>

0000000080004968 <_ZN8Consumer3runEv>:
    void run() override {
    80004968:	fd010113          	addi	sp,sp,-48
    8000496c:	02113423          	sd	ra,40(sp)
    80004970:	02813023          	sd	s0,32(sp)
    80004974:	00913c23          	sd	s1,24(sp)
    80004978:	01213823          	sd	s2,16(sp)
    8000497c:	01313423          	sd	s3,8(sp)
    80004980:	03010413          	addi	s0,sp,48
    80004984:	00050913          	mv	s2,a0
        int i = 0;
    80004988:	00000993          	li	s3,0
    8000498c:	0100006f          	j	8000499c <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    80004990:	00a00513          	li	a0,10
    80004994:	ffffe097          	auipc	ra,0xffffe
    80004998:	17c080e7          	jalr	380(ra) # 80002b10 <_ZN7Console4putcEc>
        while (!threadEnd) {
    8000499c:	00007797          	auipc	a5,0x7
    800049a0:	2f47a783          	lw	a5,756(a5) # 8000bc90 <_ZL9threadEnd>
    800049a4:	04079a63          	bnez	a5,800049f8 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    800049a8:	02093783          	ld	a5,32(s2)
    800049ac:	0087b503          	ld	a0,8(a5)
    800049b0:	00001097          	auipc	ra,0x1
    800049b4:	638080e7          	jalr	1592(ra) # 80005fe8 <_ZN9BufferCPP3getEv>
            i++;
    800049b8:	0019849b          	addiw	s1,s3,1
    800049bc:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    800049c0:	0ff57513          	andi	a0,a0,255
    800049c4:	ffffe097          	auipc	ra,0xffffe
    800049c8:	14c080e7          	jalr	332(ra) # 80002b10 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    800049cc:	05000793          	li	a5,80
    800049d0:	02f4e4bb          	remw	s1,s1,a5
    800049d4:	fc0494e3          	bnez	s1,8000499c <_ZN8Consumer3runEv+0x34>
    800049d8:	fb9ff06f          	j	80004990 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    800049dc:	02093783          	ld	a5,32(s2)
    800049e0:	0087b503          	ld	a0,8(a5)
    800049e4:	00001097          	auipc	ra,0x1
    800049e8:	604080e7          	jalr	1540(ra) # 80005fe8 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    800049ec:	0ff57513          	andi	a0,a0,255
    800049f0:	ffffe097          	auipc	ra,0xffffe
    800049f4:	120080e7          	jalr	288(ra) # 80002b10 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    800049f8:	02093783          	ld	a5,32(s2)
    800049fc:	0087b503          	ld	a0,8(a5)
    80004a00:	00001097          	auipc	ra,0x1
    80004a04:	674080e7          	jalr	1652(ra) # 80006074 <_ZN9BufferCPP6getCntEv>
    80004a08:	fca04ae3          	bgtz	a0,800049dc <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80004a0c:	02093783          	ld	a5,32(s2)
    80004a10:	0107b503          	ld	a0,16(a5)
    80004a14:	ffffe097          	auipc	ra,0xffffe
    80004a18:	034080e7          	jalr	52(ra) # 80002a48 <_ZN9Semaphore6signalEv>
    }
    80004a1c:	02813083          	ld	ra,40(sp)
    80004a20:	02013403          	ld	s0,32(sp)
    80004a24:	01813483          	ld	s1,24(sp)
    80004a28:	01013903          	ld	s2,16(sp)
    80004a2c:	00813983          	ld	s3,8(sp)
    80004a30:	03010113          	addi	sp,sp,48
    80004a34:	00008067          	ret

0000000080004a38 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80004a38:	ff010113          	addi	sp,sp,-16
    80004a3c:	00113423          	sd	ra,8(sp)
    80004a40:	00813023          	sd	s0,0(sp)
    80004a44:	01010413          	addi	s0,sp,16
    80004a48:	00007797          	auipc	a5,0x7
    80004a4c:	fb878793          	addi	a5,a5,-72 # 8000ba00 <_ZTV8Consumer+0x10>
    80004a50:	00f53023          	sd	a5,0(a0)
    80004a54:	ffffe097          	auipc	ra,0xffffe
    80004a58:	b5c080e7          	jalr	-1188(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80004a5c:	00813083          	ld	ra,8(sp)
    80004a60:	00013403          	ld	s0,0(sp)
    80004a64:	01010113          	addi	sp,sp,16
    80004a68:	00008067          	ret

0000000080004a6c <_ZN8ConsumerD0Ev>:
    80004a6c:	fe010113          	addi	sp,sp,-32
    80004a70:	00113c23          	sd	ra,24(sp)
    80004a74:	00813823          	sd	s0,16(sp)
    80004a78:	00913423          	sd	s1,8(sp)
    80004a7c:	02010413          	addi	s0,sp,32
    80004a80:	00050493          	mv	s1,a0
    80004a84:	00007797          	auipc	a5,0x7
    80004a88:	f7c78793          	addi	a5,a5,-132 # 8000ba00 <_ZTV8Consumer+0x10>
    80004a8c:	00f53023          	sd	a5,0(a0)
    80004a90:	ffffe097          	auipc	ra,0xffffe
    80004a94:	b20080e7          	jalr	-1248(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80004a98:	00048513          	mv	a0,s1
    80004a9c:	ffffe097          	auipc	ra,0xffffe
    80004aa0:	c54080e7          	jalr	-940(ra) # 800026f0 <_ZdlPv>
    80004aa4:	01813083          	ld	ra,24(sp)
    80004aa8:	01013403          	ld	s0,16(sp)
    80004aac:	00813483          	ld	s1,8(sp)
    80004ab0:	02010113          	addi	sp,sp,32
    80004ab4:	00008067          	ret

0000000080004ab8 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80004ab8:	ff010113          	addi	sp,sp,-16
    80004abc:	00113423          	sd	ra,8(sp)
    80004ac0:	00813023          	sd	s0,0(sp)
    80004ac4:	01010413          	addi	s0,sp,16
    80004ac8:	00007797          	auipc	a5,0x7
    80004acc:	ee878793          	addi	a5,a5,-280 # 8000b9b0 <_ZTV16ProducerKeyborad+0x10>
    80004ad0:	00f53023          	sd	a5,0(a0)
    80004ad4:	ffffe097          	auipc	ra,0xffffe
    80004ad8:	adc080e7          	jalr	-1316(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80004adc:	00813083          	ld	ra,8(sp)
    80004ae0:	00013403          	ld	s0,0(sp)
    80004ae4:	01010113          	addi	sp,sp,16
    80004ae8:	00008067          	ret

0000000080004aec <_ZN16ProducerKeyboradD0Ev>:
    80004aec:	fe010113          	addi	sp,sp,-32
    80004af0:	00113c23          	sd	ra,24(sp)
    80004af4:	00813823          	sd	s0,16(sp)
    80004af8:	00913423          	sd	s1,8(sp)
    80004afc:	02010413          	addi	s0,sp,32
    80004b00:	00050493          	mv	s1,a0
    80004b04:	00007797          	auipc	a5,0x7
    80004b08:	eac78793          	addi	a5,a5,-340 # 8000b9b0 <_ZTV16ProducerKeyborad+0x10>
    80004b0c:	00f53023          	sd	a5,0(a0)
    80004b10:	ffffe097          	auipc	ra,0xffffe
    80004b14:	aa0080e7          	jalr	-1376(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80004b18:	00048513          	mv	a0,s1
    80004b1c:	ffffe097          	auipc	ra,0xffffe
    80004b20:	bd4080e7          	jalr	-1068(ra) # 800026f0 <_ZdlPv>
    80004b24:	01813083          	ld	ra,24(sp)
    80004b28:	01013403          	ld	s0,16(sp)
    80004b2c:	00813483          	ld	s1,8(sp)
    80004b30:	02010113          	addi	sp,sp,32
    80004b34:	00008067          	ret

0000000080004b38 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80004b38:	ff010113          	addi	sp,sp,-16
    80004b3c:	00113423          	sd	ra,8(sp)
    80004b40:	00813023          	sd	s0,0(sp)
    80004b44:	01010413          	addi	s0,sp,16
    80004b48:	00007797          	auipc	a5,0x7
    80004b4c:	e9078793          	addi	a5,a5,-368 # 8000b9d8 <_ZTV8Producer+0x10>
    80004b50:	00f53023          	sd	a5,0(a0)
    80004b54:	ffffe097          	auipc	ra,0xffffe
    80004b58:	a5c080e7          	jalr	-1444(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80004b5c:	00813083          	ld	ra,8(sp)
    80004b60:	00013403          	ld	s0,0(sp)
    80004b64:	01010113          	addi	sp,sp,16
    80004b68:	00008067          	ret

0000000080004b6c <_ZN8ProducerD0Ev>:
    80004b6c:	fe010113          	addi	sp,sp,-32
    80004b70:	00113c23          	sd	ra,24(sp)
    80004b74:	00813823          	sd	s0,16(sp)
    80004b78:	00913423          	sd	s1,8(sp)
    80004b7c:	02010413          	addi	s0,sp,32
    80004b80:	00050493          	mv	s1,a0
    80004b84:	00007797          	auipc	a5,0x7
    80004b88:	e5478793          	addi	a5,a5,-428 # 8000b9d8 <_ZTV8Producer+0x10>
    80004b8c:	00f53023          	sd	a5,0(a0)
    80004b90:	ffffe097          	auipc	ra,0xffffe
    80004b94:	a20080e7          	jalr	-1504(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80004b98:	00048513          	mv	a0,s1
    80004b9c:	ffffe097          	auipc	ra,0xffffe
    80004ba0:	b54080e7          	jalr	-1196(ra) # 800026f0 <_ZdlPv>
    80004ba4:	01813083          	ld	ra,24(sp)
    80004ba8:	01013403          	ld	s0,16(sp)
    80004bac:	00813483          	ld	s1,8(sp)
    80004bb0:	02010113          	addi	sp,sp,32
    80004bb4:	00008067          	ret

0000000080004bb8 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80004bb8:	fe010113          	addi	sp,sp,-32
    80004bbc:	00113c23          	sd	ra,24(sp)
    80004bc0:	00813823          	sd	s0,16(sp)
    80004bc4:	00913423          	sd	s1,8(sp)
    80004bc8:	02010413          	addi	s0,sp,32
    80004bcc:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80004bd0:	ffffd097          	auipc	ra,0xffffd
    80004bd4:	998080e7          	jalr	-1640(ra) # 80001568 <_Z4getcv>
    80004bd8:	0005059b          	sext.w	a1,a0
    80004bdc:	01b00793          	li	a5,27
    80004be0:	00f58c63          	beq	a1,a5,80004bf8 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80004be4:	0204b783          	ld	a5,32(s1)
    80004be8:	0087b503          	ld	a0,8(a5)
    80004bec:	00001097          	auipc	ra,0x1
    80004bf0:	36c080e7          	jalr	876(ra) # 80005f58 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80004bf4:	fddff06f          	j	80004bd0 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80004bf8:	00100793          	li	a5,1
    80004bfc:	00007717          	auipc	a4,0x7
    80004c00:	08f72a23          	sw	a5,148(a4) # 8000bc90 <_ZL9threadEnd>
        td->buffer->put('!');
    80004c04:	0204b783          	ld	a5,32(s1)
    80004c08:	02100593          	li	a1,33
    80004c0c:	0087b503          	ld	a0,8(a5)
    80004c10:	00001097          	auipc	ra,0x1
    80004c14:	348080e7          	jalr	840(ra) # 80005f58 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80004c18:	0204b783          	ld	a5,32(s1)
    80004c1c:	0107b503          	ld	a0,16(a5)
    80004c20:	ffffe097          	auipc	ra,0xffffe
    80004c24:	e28080e7          	jalr	-472(ra) # 80002a48 <_ZN9Semaphore6signalEv>
    }
    80004c28:	01813083          	ld	ra,24(sp)
    80004c2c:	01013403          	ld	s0,16(sp)
    80004c30:	00813483          	ld	s1,8(sp)
    80004c34:	02010113          	addi	sp,sp,32
    80004c38:	00008067          	ret

0000000080004c3c <_ZN8Producer3runEv>:
    void run() override {
    80004c3c:	fe010113          	addi	sp,sp,-32
    80004c40:	00113c23          	sd	ra,24(sp)
    80004c44:	00813823          	sd	s0,16(sp)
    80004c48:	00913423          	sd	s1,8(sp)
    80004c4c:	01213023          	sd	s2,0(sp)
    80004c50:	02010413          	addi	s0,sp,32
    80004c54:	00050493          	mv	s1,a0
        int i = 0;
    80004c58:	00000913          	li	s2,0
        while (!threadEnd) {
    80004c5c:	00007797          	auipc	a5,0x7
    80004c60:	0347a783          	lw	a5,52(a5) # 8000bc90 <_ZL9threadEnd>
    80004c64:	04079263          	bnez	a5,80004ca8 <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    80004c68:	0204b783          	ld	a5,32(s1)
    80004c6c:	0007a583          	lw	a1,0(a5)
    80004c70:	0305859b          	addiw	a1,a1,48
    80004c74:	0087b503          	ld	a0,8(a5)
    80004c78:	00001097          	auipc	ra,0x1
    80004c7c:	2e0080e7          	jalr	736(ra) # 80005f58 <_ZN9BufferCPP3putEi>
            i++;
    80004c80:	0019071b          	addiw	a4,s2,1
    80004c84:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    80004c88:	0204b783          	ld	a5,32(s1)
    80004c8c:	0007a783          	lw	a5,0(a5)
    80004c90:	00e787bb          	addw	a5,a5,a4
    80004c94:	00500513          	li	a0,5
    80004c98:	02a7e53b          	remw	a0,a5,a0
    80004c9c:	ffffe097          	auipc	ra,0xffffe
    80004ca0:	c40080e7          	jalr	-960(ra) # 800028dc <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80004ca4:	fb9ff06f          	j	80004c5c <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80004ca8:	0204b783          	ld	a5,32(s1)
    80004cac:	0107b503          	ld	a0,16(a5)
    80004cb0:	ffffe097          	auipc	ra,0xffffe
    80004cb4:	d98080e7          	jalr	-616(ra) # 80002a48 <_ZN9Semaphore6signalEv>
    }
    80004cb8:	01813083          	ld	ra,24(sp)
    80004cbc:	01013403          	ld	s0,16(sp)
    80004cc0:	00813483          	ld	s1,8(sp)
    80004cc4:	00013903          	ld	s2,0(sp)
    80004cc8:	02010113          	addi	sp,sp,32
    80004ccc:	00008067          	ret

0000000080004cd0 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004cd0:	fe010113          	addi	sp,sp,-32
    80004cd4:	00113c23          	sd	ra,24(sp)
    80004cd8:	00813823          	sd	s0,16(sp)
    80004cdc:	00913423          	sd	s1,8(sp)
    80004ce0:	01213023          	sd	s2,0(sp)
    80004ce4:	02010413          	addi	s0,sp,32
    80004ce8:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004cec:	00100793          	li	a5,1
    80004cf0:	02a7f863          	bgeu	a5,a0,80004d20 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004cf4:	00a00793          	li	a5,10
    80004cf8:	02f577b3          	remu	a5,a0,a5
    80004cfc:	02078e63          	beqz	a5,80004d38 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004d00:	fff48513          	addi	a0,s1,-1
    80004d04:	00000097          	auipc	ra,0x0
    80004d08:	fcc080e7          	jalr	-52(ra) # 80004cd0 <_ZL9fibonaccim>
    80004d0c:	00050913          	mv	s2,a0
    80004d10:	ffe48513          	addi	a0,s1,-2
    80004d14:	00000097          	auipc	ra,0x0
    80004d18:	fbc080e7          	jalr	-68(ra) # 80004cd0 <_ZL9fibonaccim>
    80004d1c:	00a90533          	add	a0,s2,a0
}
    80004d20:	01813083          	ld	ra,24(sp)
    80004d24:	01013403          	ld	s0,16(sp)
    80004d28:	00813483          	ld	s1,8(sp)
    80004d2c:	00013903          	ld	s2,0(sp)
    80004d30:	02010113          	addi	sp,sp,32
    80004d34:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80004d38:	ffffc097          	auipc	ra,0xffffc
    80004d3c:	6f0080e7          	jalr	1776(ra) # 80001428 <_Z15thread_dispatchv>
    80004d40:	fc1ff06f          	j	80004d00 <_ZL9fibonaccim+0x30>

0000000080004d44 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80004d44:	fe010113          	addi	sp,sp,-32
    80004d48:	00113c23          	sd	ra,24(sp)
    80004d4c:	00813823          	sd	s0,16(sp)
    80004d50:	00913423          	sd	s1,8(sp)
    80004d54:	01213023          	sd	s2,0(sp)
    80004d58:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004d5c:	00a00493          	li	s1,10
    80004d60:	0400006f          	j	80004da0 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004d64:	00004517          	auipc	a0,0x4
    80004d68:	61450513          	addi	a0,a0,1556 # 80009378 <CONSOLE_STATUS+0x368>
    80004d6c:	00001097          	auipc	ra,0x1
    80004d70:	dc8080e7          	jalr	-568(ra) # 80005b34 <_Z11printStringPKc>
    80004d74:	00000613          	li	a2,0
    80004d78:	00a00593          	li	a1,10
    80004d7c:	00048513          	mv	a0,s1
    80004d80:	00001097          	auipc	ra,0x1
    80004d84:	f64080e7          	jalr	-156(ra) # 80005ce4 <_Z8printIntiii>
    80004d88:	00004517          	auipc	a0,0x4
    80004d8c:	7e050513          	addi	a0,a0,2016 # 80009568 <CONSOLE_STATUS+0x558>
    80004d90:	00001097          	auipc	ra,0x1
    80004d94:	da4080e7          	jalr	-604(ra) # 80005b34 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004d98:	0014849b          	addiw	s1,s1,1
    80004d9c:	0ff4f493          	andi	s1,s1,255
    80004da0:	00c00793          	li	a5,12
    80004da4:	fc97f0e3          	bgeu	a5,s1,80004d64 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80004da8:	00004517          	auipc	a0,0x4
    80004dac:	5d850513          	addi	a0,a0,1496 # 80009380 <CONSOLE_STATUS+0x370>
    80004db0:	00001097          	auipc	ra,0x1
    80004db4:	d84080e7          	jalr	-636(ra) # 80005b34 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004db8:	00500313          	li	t1,5
    thread_dispatch();
    80004dbc:	ffffc097          	auipc	ra,0xffffc
    80004dc0:	66c080e7          	jalr	1644(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004dc4:	01000513          	li	a0,16
    80004dc8:	00000097          	auipc	ra,0x0
    80004dcc:	f08080e7          	jalr	-248(ra) # 80004cd0 <_ZL9fibonaccim>
    80004dd0:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004dd4:	00004517          	auipc	a0,0x4
    80004dd8:	5bc50513          	addi	a0,a0,1468 # 80009390 <CONSOLE_STATUS+0x380>
    80004ddc:	00001097          	auipc	ra,0x1
    80004de0:	d58080e7          	jalr	-680(ra) # 80005b34 <_Z11printStringPKc>
    80004de4:	00000613          	li	a2,0
    80004de8:	00a00593          	li	a1,10
    80004dec:	0009051b          	sext.w	a0,s2
    80004df0:	00001097          	auipc	ra,0x1
    80004df4:	ef4080e7          	jalr	-268(ra) # 80005ce4 <_Z8printIntiii>
    80004df8:	00004517          	auipc	a0,0x4
    80004dfc:	77050513          	addi	a0,a0,1904 # 80009568 <CONSOLE_STATUS+0x558>
    80004e00:	00001097          	auipc	ra,0x1
    80004e04:	d34080e7          	jalr	-716(ra) # 80005b34 <_Z11printStringPKc>
    80004e08:	0400006f          	j	80004e48 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004e0c:	00004517          	auipc	a0,0x4
    80004e10:	56c50513          	addi	a0,a0,1388 # 80009378 <CONSOLE_STATUS+0x368>
    80004e14:	00001097          	auipc	ra,0x1
    80004e18:	d20080e7          	jalr	-736(ra) # 80005b34 <_Z11printStringPKc>
    80004e1c:	00000613          	li	a2,0
    80004e20:	00a00593          	li	a1,10
    80004e24:	00048513          	mv	a0,s1
    80004e28:	00001097          	auipc	ra,0x1
    80004e2c:	ebc080e7          	jalr	-324(ra) # 80005ce4 <_Z8printIntiii>
    80004e30:	00004517          	auipc	a0,0x4
    80004e34:	73850513          	addi	a0,a0,1848 # 80009568 <CONSOLE_STATUS+0x558>
    80004e38:	00001097          	auipc	ra,0x1
    80004e3c:	cfc080e7          	jalr	-772(ra) # 80005b34 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004e40:	0014849b          	addiw	s1,s1,1
    80004e44:	0ff4f493          	andi	s1,s1,255
    80004e48:	00f00793          	li	a5,15
    80004e4c:	fc97f0e3          	bgeu	a5,s1,80004e0c <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80004e50:	00004517          	auipc	a0,0x4
    80004e54:	55050513          	addi	a0,a0,1360 # 800093a0 <CONSOLE_STATUS+0x390>
    80004e58:	00001097          	auipc	ra,0x1
    80004e5c:	cdc080e7          	jalr	-804(ra) # 80005b34 <_Z11printStringPKc>
    finishedD = true;
    80004e60:	00100793          	li	a5,1
    80004e64:	00007717          	auipc	a4,0x7
    80004e68:	e2f70e23          	sb	a5,-452(a4) # 8000bca0 <_ZL9finishedD>
    thread_dispatch();
    80004e6c:	ffffc097          	auipc	ra,0xffffc
    80004e70:	5bc080e7          	jalr	1468(ra) # 80001428 <_Z15thread_dispatchv>
}
    80004e74:	01813083          	ld	ra,24(sp)
    80004e78:	01013403          	ld	s0,16(sp)
    80004e7c:	00813483          	ld	s1,8(sp)
    80004e80:	00013903          	ld	s2,0(sp)
    80004e84:	02010113          	addi	sp,sp,32
    80004e88:	00008067          	ret

0000000080004e8c <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80004e8c:	fe010113          	addi	sp,sp,-32
    80004e90:	00113c23          	sd	ra,24(sp)
    80004e94:	00813823          	sd	s0,16(sp)
    80004e98:	00913423          	sd	s1,8(sp)
    80004e9c:	01213023          	sd	s2,0(sp)
    80004ea0:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004ea4:	00000493          	li	s1,0
    80004ea8:	0400006f          	j	80004ee8 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80004eac:	00004517          	auipc	a0,0x4
    80004eb0:	48c50513          	addi	a0,a0,1164 # 80009338 <CONSOLE_STATUS+0x328>
    80004eb4:	00001097          	auipc	ra,0x1
    80004eb8:	c80080e7          	jalr	-896(ra) # 80005b34 <_Z11printStringPKc>
    80004ebc:	00000613          	li	a2,0
    80004ec0:	00a00593          	li	a1,10
    80004ec4:	00048513          	mv	a0,s1
    80004ec8:	00001097          	auipc	ra,0x1
    80004ecc:	e1c080e7          	jalr	-484(ra) # 80005ce4 <_Z8printIntiii>
    80004ed0:	00004517          	auipc	a0,0x4
    80004ed4:	69850513          	addi	a0,a0,1688 # 80009568 <CONSOLE_STATUS+0x558>
    80004ed8:	00001097          	auipc	ra,0x1
    80004edc:	c5c080e7          	jalr	-932(ra) # 80005b34 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004ee0:	0014849b          	addiw	s1,s1,1
    80004ee4:	0ff4f493          	andi	s1,s1,255
    80004ee8:	00200793          	li	a5,2
    80004eec:	fc97f0e3          	bgeu	a5,s1,80004eac <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80004ef0:	00004517          	auipc	a0,0x4
    80004ef4:	45050513          	addi	a0,a0,1104 # 80009340 <CONSOLE_STATUS+0x330>
    80004ef8:	00001097          	auipc	ra,0x1
    80004efc:	c3c080e7          	jalr	-964(ra) # 80005b34 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004f00:	00700313          	li	t1,7
    thread_dispatch();
    80004f04:	ffffc097          	auipc	ra,0xffffc
    80004f08:	524080e7          	jalr	1316(ra) # 80001428 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004f0c:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80004f10:	00004517          	auipc	a0,0x4
    80004f14:	44050513          	addi	a0,a0,1088 # 80009350 <CONSOLE_STATUS+0x340>
    80004f18:	00001097          	auipc	ra,0x1
    80004f1c:	c1c080e7          	jalr	-996(ra) # 80005b34 <_Z11printStringPKc>
    80004f20:	00000613          	li	a2,0
    80004f24:	00a00593          	li	a1,10
    80004f28:	0009051b          	sext.w	a0,s2
    80004f2c:	00001097          	auipc	ra,0x1
    80004f30:	db8080e7          	jalr	-584(ra) # 80005ce4 <_Z8printIntiii>
    80004f34:	00004517          	auipc	a0,0x4
    80004f38:	63450513          	addi	a0,a0,1588 # 80009568 <CONSOLE_STATUS+0x558>
    80004f3c:	00001097          	auipc	ra,0x1
    80004f40:	bf8080e7          	jalr	-1032(ra) # 80005b34 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80004f44:	00c00513          	li	a0,12
    80004f48:	00000097          	auipc	ra,0x0
    80004f4c:	d88080e7          	jalr	-632(ra) # 80004cd0 <_ZL9fibonaccim>
    80004f50:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80004f54:	00004517          	auipc	a0,0x4
    80004f58:	40450513          	addi	a0,a0,1028 # 80009358 <CONSOLE_STATUS+0x348>
    80004f5c:	00001097          	auipc	ra,0x1
    80004f60:	bd8080e7          	jalr	-1064(ra) # 80005b34 <_Z11printStringPKc>
    80004f64:	00000613          	li	a2,0
    80004f68:	00a00593          	li	a1,10
    80004f6c:	0009051b          	sext.w	a0,s2
    80004f70:	00001097          	auipc	ra,0x1
    80004f74:	d74080e7          	jalr	-652(ra) # 80005ce4 <_Z8printIntiii>
    80004f78:	00004517          	auipc	a0,0x4
    80004f7c:	5f050513          	addi	a0,a0,1520 # 80009568 <CONSOLE_STATUS+0x558>
    80004f80:	00001097          	auipc	ra,0x1
    80004f84:	bb4080e7          	jalr	-1100(ra) # 80005b34 <_Z11printStringPKc>
    80004f88:	0400006f          	j	80004fc8 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80004f8c:	00004517          	auipc	a0,0x4
    80004f90:	3ac50513          	addi	a0,a0,940 # 80009338 <CONSOLE_STATUS+0x328>
    80004f94:	00001097          	auipc	ra,0x1
    80004f98:	ba0080e7          	jalr	-1120(ra) # 80005b34 <_Z11printStringPKc>
    80004f9c:	00000613          	li	a2,0
    80004fa0:	00a00593          	li	a1,10
    80004fa4:	00048513          	mv	a0,s1
    80004fa8:	00001097          	auipc	ra,0x1
    80004fac:	d3c080e7          	jalr	-708(ra) # 80005ce4 <_Z8printIntiii>
    80004fb0:	00004517          	auipc	a0,0x4
    80004fb4:	5b850513          	addi	a0,a0,1464 # 80009568 <CONSOLE_STATUS+0x558>
    80004fb8:	00001097          	auipc	ra,0x1
    80004fbc:	b7c080e7          	jalr	-1156(ra) # 80005b34 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004fc0:	0014849b          	addiw	s1,s1,1
    80004fc4:	0ff4f493          	andi	s1,s1,255
    80004fc8:	00500793          	li	a5,5
    80004fcc:	fc97f0e3          	bgeu	a5,s1,80004f8c <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    80004fd0:	00004517          	auipc	a0,0x4
    80004fd4:	39850513          	addi	a0,a0,920 # 80009368 <CONSOLE_STATUS+0x358>
    80004fd8:	00001097          	auipc	ra,0x1
    80004fdc:	b5c080e7          	jalr	-1188(ra) # 80005b34 <_Z11printStringPKc>
    finishedC = true;
    80004fe0:	00100793          	li	a5,1
    80004fe4:	00007717          	auipc	a4,0x7
    80004fe8:	caf70ea3          	sb	a5,-835(a4) # 8000bca1 <_ZL9finishedC>
    thread_dispatch();
    80004fec:	ffffc097          	auipc	ra,0xffffc
    80004ff0:	43c080e7          	jalr	1084(ra) # 80001428 <_Z15thread_dispatchv>
}
    80004ff4:	01813083          	ld	ra,24(sp)
    80004ff8:	01013403          	ld	s0,16(sp)
    80004ffc:	00813483          	ld	s1,8(sp)
    80005000:	00013903          	ld	s2,0(sp)
    80005004:	02010113          	addi	sp,sp,32
    80005008:	00008067          	ret

000000008000500c <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    8000500c:	fe010113          	addi	sp,sp,-32
    80005010:	00113c23          	sd	ra,24(sp)
    80005014:	00813823          	sd	s0,16(sp)
    80005018:	00913423          	sd	s1,8(sp)
    8000501c:	01213023          	sd	s2,0(sp)
    80005020:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80005024:	00000913          	li	s2,0
    80005028:	0380006f          	j	80005060 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    8000502c:	ffffc097          	auipc	ra,0xffffc
    80005030:	3fc080e7          	jalr	1020(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005034:	00148493          	addi	s1,s1,1
    80005038:	000027b7          	lui	a5,0x2
    8000503c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005040:	0097ee63          	bltu	a5,s1,8000505c <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005044:	00000713          	li	a4,0
    80005048:	000077b7          	lui	a5,0x7
    8000504c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005050:	fce7eee3          	bltu	a5,a4,8000502c <_ZL11workerBodyBPv+0x20>
    80005054:	00170713          	addi	a4,a4,1
    80005058:	ff1ff06f          	j	80005048 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    8000505c:	00190913          	addi	s2,s2,1
    80005060:	00f00793          	li	a5,15
    80005064:	0527e063          	bltu	a5,s2,800050a4 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80005068:	00004517          	auipc	a0,0x4
    8000506c:	2b850513          	addi	a0,a0,696 # 80009320 <CONSOLE_STATUS+0x310>
    80005070:	00001097          	auipc	ra,0x1
    80005074:	ac4080e7          	jalr	-1340(ra) # 80005b34 <_Z11printStringPKc>
    80005078:	00000613          	li	a2,0
    8000507c:	00a00593          	li	a1,10
    80005080:	0009051b          	sext.w	a0,s2
    80005084:	00001097          	auipc	ra,0x1
    80005088:	c60080e7          	jalr	-928(ra) # 80005ce4 <_Z8printIntiii>
    8000508c:	00004517          	auipc	a0,0x4
    80005090:	4dc50513          	addi	a0,a0,1244 # 80009568 <CONSOLE_STATUS+0x558>
    80005094:	00001097          	auipc	ra,0x1
    80005098:	aa0080e7          	jalr	-1376(ra) # 80005b34 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    8000509c:	00000493          	li	s1,0
    800050a0:	f99ff06f          	j	80005038 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    800050a4:	00004517          	auipc	a0,0x4
    800050a8:	28450513          	addi	a0,a0,644 # 80009328 <CONSOLE_STATUS+0x318>
    800050ac:	00001097          	auipc	ra,0x1
    800050b0:	a88080e7          	jalr	-1400(ra) # 80005b34 <_Z11printStringPKc>
    finishedB = true;
    800050b4:	00100793          	li	a5,1
    800050b8:	00007717          	auipc	a4,0x7
    800050bc:	bef70523          	sb	a5,-1046(a4) # 8000bca2 <_ZL9finishedB>
    thread_dispatch();
    800050c0:	ffffc097          	auipc	ra,0xffffc
    800050c4:	368080e7          	jalr	872(ra) # 80001428 <_Z15thread_dispatchv>
}
    800050c8:	01813083          	ld	ra,24(sp)
    800050cc:	01013403          	ld	s0,16(sp)
    800050d0:	00813483          	ld	s1,8(sp)
    800050d4:	00013903          	ld	s2,0(sp)
    800050d8:	02010113          	addi	sp,sp,32
    800050dc:	00008067          	ret

00000000800050e0 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    800050e0:	fe010113          	addi	sp,sp,-32
    800050e4:	00113c23          	sd	ra,24(sp)
    800050e8:	00813823          	sd	s0,16(sp)
    800050ec:	00913423          	sd	s1,8(sp)
    800050f0:	01213023          	sd	s2,0(sp)
    800050f4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800050f8:	00000913          	li	s2,0
    800050fc:	0380006f          	j	80005134 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80005100:	ffffc097          	auipc	ra,0xffffc
    80005104:	328080e7          	jalr	808(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005108:	00148493          	addi	s1,s1,1
    8000510c:	000027b7          	lui	a5,0x2
    80005110:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005114:	0097ee63          	bltu	a5,s1,80005130 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005118:	00000713          	li	a4,0
    8000511c:	000077b7          	lui	a5,0x7
    80005120:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005124:	fce7eee3          	bltu	a5,a4,80005100 <_ZL11workerBodyAPv+0x20>
    80005128:	00170713          	addi	a4,a4,1
    8000512c:	ff1ff06f          	j	8000511c <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80005130:	00190913          	addi	s2,s2,1
    80005134:	00900793          	li	a5,9
    80005138:	0527e063          	bltu	a5,s2,80005178 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    8000513c:	00004517          	auipc	a0,0x4
    80005140:	1cc50513          	addi	a0,a0,460 # 80009308 <CONSOLE_STATUS+0x2f8>
    80005144:	00001097          	auipc	ra,0x1
    80005148:	9f0080e7          	jalr	-1552(ra) # 80005b34 <_Z11printStringPKc>
    8000514c:	00000613          	li	a2,0
    80005150:	00a00593          	li	a1,10
    80005154:	0009051b          	sext.w	a0,s2
    80005158:	00001097          	auipc	ra,0x1
    8000515c:	b8c080e7          	jalr	-1140(ra) # 80005ce4 <_Z8printIntiii>
    80005160:	00004517          	auipc	a0,0x4
    80005164:	40850513          	addi	a0,a0,1032 # 80009568 <CONSOLE_STATUS+0x558>
    80005168:	00001097          	auipc	ra,0x1
    8000516c:	9cc080e7          	jalr	-1588(ra) # 80005b34 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005170:	00000493          	li	s1,0
    80005174:	f99ff06f          	j	8000510c <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80005178:	00004517          	auipc	a0,0x4
    8000517c:	19850513          	addi	a0,a0,408 # 80009310 <CONSOLE_STATUS+0x300>
    80005180:	00001097          	auipc	ra,0x1
    80005184:	9b4080e7          	jalr	-1612(ra) # 80005b34 <_Z11printStringPKc>
    finishedA = true;
    80005188:	00100793          	li	a5,1
    8000518c:	00007717          	auipc	a4,0x7
    80005190:	b0f70ba3          	sb	a5,-1257(a4) # 8000bca3 <_ZL9finishedA>
}
    80005194:	01813083          	ld	ra,24(sp)
    80005198:	01013403          	ld	s0,16(sp)
    8000519c:	00813483          	ld	s1,8(sp)
    800051a0:	00013903          	ld	s2,0(sp)
    800051a4:	02010113          	addi	sp,sp,32
    800051a8:	00008067          	ret

00000000800051ac <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    800051ac:	fd010113          	addi	sp,sp,-48
    800051b0:	02113423          	sd	ra,40(sp)
    800051b4:	02813023          	sd	s0,32(sp)
    800051b8:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    800051bc:	00000613          	li	a2,0
    800051c0:	00000597          	auipc	a1,0x0
    800051c4:	f2058593          	addi	a1,a1,-224 # 800050e0 <_ZL11workerBodyAPv>
    800051c8:	fd040513          	addi	a0,s0,-48
    800051cc:	ffffc097          	auipc	ra,0xffffc
    800051d0:	1b4080e7          	jalr	436(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    800051d4:	00004517          	auipc	a0,0x4
    800051d8:	1dc50513          	addi	a0,a0,476 # 800093b0 <CONSOLE_STATUS+0x3a0>
    800051dc:	00001097          	auipc	ra,0x1
    800051e0:	958080e7          	jalr	-1704(ra) # 80005b34 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    800051e4:	00000613          	li	a2,0
    800051e8:	00000597          	auipc	a1,0x0
    800051ec:	e2458593          	addi	a1,a1,-476 # 8000500c <_ZL11workerBodyBPv>
    800051f0:	fd840513          	addi	a0,s0,-40
    800051f4:	ffffc097          	auipc	ra,0xffffc
    800051f8:	18c080e7          	jalr	396(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    800051fc:	00004517          	auipc	a0,0x4
    80005200:	1cc50513          	addi	a0,a0,460 # 800093c8 <CONSOLE_STATUS+0x3b8>
    80005204:	00001097          	auipc	ra,0x1
    80005208:	930080e7          	jalr	-1744(ra) # 80005b34 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    8000520c:	00000613          	li	a2,0
    80005210:	00000597          	auipc	a1,0x0
    80005214:	c7c58593          	addi	a1,a1,-900 # 80004e8c <_ZL11workerBodyCPv>
    80005218:	fe040513          	addi	a0,s0,-32
    8000521c:	ffffc097          	auipc	ra,0xffffc
    80005220:	164080e7          	jalr	356(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80005224:	00004517          	auipc	a0,0x4
    80005228:	1bc50513          	addi	a0,a0,444 # 800093e0 <CONSOLE_STATUS+0x3d0>
    8000522c:	00001097          	auipc	ra,0x1
    80005230:	908080e7          	jalr	-1784(ra) # 80005b34 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80005234:	00000613          	li	a2,0
    80005238:	00000597          	auipc	a1,0x0
    8000523c:	b0c58593          	addi	a1,a1,-1268 # 80004d44 <_ZL11workerBodyDPv>
    80005240:	fe840513          	addi	a0,s0,-24
    80005244:	ffffc097          	auipc	ra,0xffffc
    80005248:	13c080e7          	jalr	316(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    8000524c:	00004517          	auipc	a0,0x4
    80005250:	1ac50513          	addi	a0,a0,428 # 800093f8 <CONSOLE_STATUS+0x3e8>
    80005254:	00001097          	auipc	ra,0x1
    80005258:	8e0080e7          	jalr	-1824(ra) # 80005b34 <_Z11printStringPKc>
    8000525c:	00c0006f          	j	80005268 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80005260:	ffffc097          	auipc	ra,0xffffc
    80005264:	1c8080e7          	jalr	456(ra) # 80001428 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80005268:	00007797          	auipc	a5,0x7
    8000526c:	a3b7c783          	lbu	a5,-1477(a5) # 8000bca3 <_ZL9finishedA>
    80005270:	fe0788e3          	beqz	a5,80005260 <_Z18Threads_C_API_testv+0xb4>
    80005274:	00007797          	auipc	a5,0x7
    80005278:	a2e7c783          	lbu	a5,-1490(a5) # 8000bca2 <_ZL9finishedB>
    8000527c:	fe0782e3          	beqz	a5,80005260 <_Z18Threads_C_API_testv+0xb4>
    80005280:	00007797          	auipc	a5,0x7
    80005284:	a217c783          	lbu	a5,-1503(a5) # 8000bca1 <_ZL9finishedC>
    80005288:	fc078ce3          	beqz	a5,80005260 <_Z18Threads_C_API_testv+0xb4>
    8000528c:	00007797          	auipc	a5,0x7
    80005290:	a147c783          	lbu	a5,-1516(a5) # 8000bca0 <_ZL9finishedD>
    80005294:	fc0786e3          	beqz	a5,80005260 <_Z18Threads_C_API_testv+0xb4>
    }

}
    80005298:	02813083          	ld	ra,40(sp)
    8000529c:	02013403          	ld	s0,32(sp)
    800052a0:	03010113          	addi	sp,sp,48
    800052a4:	00008067          	ret

00000000800052a8 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    800052a8:	fd010113          	addi	sp,sp,-48
    800052ac:	02113423          	sd	ra,40(sp)
    800052b0:	02813023          	sd	s0,32(sp)
    800052b4:	00913c23          	sd	s1,24(sp)
    800052b8:	01213823          	sd	s2,16(sp)
    800052bc:	01313423          	sd	s3,8(sp)
    800052c0:	03010413          	addi	s0,sp,48
    800052c4:	00050993          	mv	s3,a0
    800052c8:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    800052cc:	00000913          	li	s2,0
    800052d0:	00c0006f          	j	800052dc <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    800052d4:	ffffd097          	auipc	ra,0xffffd
    800052d8:	5e0080e7          	jalr	1504(ra) # 800028b4 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    800052dc:	ffffc097          	auipc	ra,0xffffc
    800052e0:	28c080e7          	jalr	652(ra) # 80001568 <_Z4getcv>
    800052e4:	0005059b          	sext.w	a1,a0
    800052e8:	01b00793          	li	a5,27
    800052ec:	02f58a63          	beq	a1,a5,80005320 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    800052f0:	0084b503          	ld	a0,8(s1)
    800052f4:	00001097          	auipc	ra,0x1
    800052f8:	c64080e7          	jalr	-924(ra) # 80005f58 <_ZN9BufferCPP3putEi>
        i++;
    800052fc:	0019071b          	addiw	a4,s2,1
    80005300:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005304:	0004a683          	lw	a3,0(s1)
    80005308:	0026979b          	slliw	a5,a3,0x2
    8000530c:	00d787bb          	addw	a5,a5,a3
    80005310:	0017979b          	slliw	a5,a5,0x1
    80005314:	02f767bb          	remw	a5,a4,a5
    80005318:	fc0792e3          	bnez	a5,800052dc <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    8000531c:	fb9ff06f          	j	800052d4 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80005320:	00100793          	li	a5,1
    80005324:	00007717          	auipc	a4,0x7
    80005328:	98f72223          	sw	a5,-1660(a4) # 8000bca8 <_ZL9threadEnd>
    td->buffer->put('!');
    8000532c:	0209b783          	ld	a5,32(s3)
    80005330:	02100593          	li	a1,33
    80005334:	0087b503          	ld	a0,8(a5)
    80005338:	00001097          	auipc	ra,0x1
    8000533c:	c20080e7          	jalr	-992(ra) # 80005f58 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80005340:	0104b503          	ld	a0,16(s1)
    80005344:	ffffd097          	auipc	ra,0xffffd
    80005348:	704080e7          	jalr	1796(ra) # 80002a48 <_ZN9Semaphore6signalEv>
}
    8000534c:	02813083          	ld	ra,40(sp)
    80005350:	02013403          	ld	s0,32(sp)
    80005354:	01813483          	ld	s1,24(sp)
    80005358:	01013903          	ld	s2,16(sp)
    8000535c:	00813983          	ld	s3,8(sp)
    80005360:	03010113          	addi	sp,sp,48
    80005364:	00008067          	ret

0000000080005368 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    80005368:	fe010113          	addi	sp,sp,-32
    8000536c:	00113c23          	sd	ra,24(sp)
    80005370:	00813823          	sd	s0,16(sp)
    80005374:	00913423          	sd	s1,8(sp)
    80005378:	01213023          	sd	s2,0(sp)
    8000537c:	02010413          	addi	s0,sp,32
    80005380:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005384:	00000913          	li	s2,0
    80005388:	00c0006f          	j	80005394 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    8000538c:	ffffd097          	auipc	ra,0xffffd
    80005390:	528080e7          	jalr	1320(ra) # 800028b4 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80005394:	00007797          	auipc	a5,0x7
    80005398:	9147a783          	lw	a5,-1772(a5) # 8000bca8 <_ZL9threadEnd>
    8000539c:	02079e63          	bnez	a5,800053d8 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    800053a0:	0004a583          	lw	a1,0(s1)
    800053a4:	0305859b          	addiw	a1,a1,48
    800053a8:	0084b503          	ld	a0,8(s1)
    800053ac:	00001097          	auipc	ra,0x1
    800053b0:	bac080e7          	jalr	-1108(ra) # 80005f58 <_ZN9BufferCPP3putEi>
        i++;
    800053b4:	0019071b          	addiw	a4,s2,1
    800053b8:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800053bc:	0004a683          	lw	a3,0(s1)
    800053c0:	0026979b          	slliw	a5,a3,0x2
    800053c4:	00d787bb          	addw	a5,a5,a3
    800053c8:	0017979b          	slliw	a5,a5,0x1
    800053cc:	02f767bb          	remw	a5,a4,a5
    800053d0:	fc0792e3          	bnez	a5,80005394 <_ZN12ProducerSync8producerEPv+0x2c>
    800053d4:	fb9ff06f          	j	8000538c <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    800053d8:	0104b503          	ld	a0,16(s1)
    800053dc:	ffffd097          	auipc	ra,0xffffd
    800053e0:	66c080e7          	jalr	1644(ra) # 80002a48 <_ZN9Semaphore6signalEv>
}
    800053e4:	01813083          	ld	ra,24(sp)
    800053e8:	01013403          	ld	s0,16(sp)
    800053ec:	00813483          	ld	s1,8(sp)
    800053f0:	00013903          	ld	s2,0(sp)
    800053f4:	02010113          	addi	sp,sp,32
    800053f8:	00008067          	ret

00000000800053fc <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    800053fc:	fd010113          	addi	sp,sp,-48
    80005400:	02113423          	sd	ra,40(sp)
    80005404:	02813023          	sd	s0,32(sp)
    80005408:	00913c23          	sd	s1,24(sp)
    8000540c:	01213823          	sd	s2,16(sp)
    80005410:	01313423          	sd	s3,8(sp)
    80005414:	01413023          	sd	s4,0(sp)
    80005418:	03010413          	addi	s0,sp,48
    8000541c:	00050993          	mv	s3,a0
    80005420:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005424:	00000a13          	li	s4,0
    80005428:	01c0006f          	j	80005444 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    8000542c:	ffffd097          	auipc	ra,0xffffd
    80005430:	488080e7          	jalr	1160(ra) # 800028b4 <_ZN6Thread8dispatchEv>
    80005434:	0500006f          	j	80005484 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80005438:	00a00513          	li	a0,10
    8000543c:	ffffc097          	auipc	ra,0xffffc
    80005440:	154080e7          	jalr	340(ra) # 80001590 <_Z4putcc>
    while (!threadEnd) {
    80005444:	00007797          	auipc	a5,0x7
    80005448:	8647a783          	lw	a5,-1948(a5) # 8000bca8 <_ZL9threadEnd>
    8000544c:	06079263          	bnez	a5,800054b0 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80005450:	00893503          	ld	a0,8(s2)
    80005454:	00001097          	auipc	ra,0x1
    80005458:	b94080e7          	jalr	-1132(ra) # 80005fe8 <_ZN9BufferCPP3getEv>
        i++;
    8000545c:	001a049b          	addiw	s1,s4,1
    80005460:	00048a1b          	sext.w	s4,s1
        putc(key);
    80005464:	0ff57513          	andi	a0,a0,255
    80005468:	ffffc097          	auipc	ra,0xffffc
    8000546c:	128080e7          	jalr	296(ra) # 80001590 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80005470:	00092703          	lw	a4,0(s2)
    80005474:	0027179b          	slliw	a5,a4,0x2
    80005478:	00e787bb          	addw	a5,a5,a4
    8000547c:	02f4e7bb          	remw	a5,s1,a5
    80005480:	fa0786e3          	beqz	a5,8000542c <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80005484:	05000793          	li	a5,80
    80005488:	02f4e4bb          	remw	s1,s1,a5
    8000548c:	fa049ce3          	bnez	s1,80005444 <_ZN12ConsumerSync8consumerEPv+0x48>
    80005490:	fa9ff06f          	j	80005438 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80005494:	0209b783          	ld	a5,32(s3)
    80005498:	0087b503          	ld	a0,8(a5)
    8000549c:	00001097          	auipc	ra,0x1
    800054a0:	b4c080e7          	jalr	-1204(ra) # 80005fe8 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    800054a4:	0ff57513          	andi	a0,a0,255
    800054a8:	ffffd097          	auipc	ra,0xffffd
    800054ac:	668080e7          	jalr	1640(ra) # 80002b10 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    800054b0:	0209b783          	ld	a5,32(s3)
    800054b4:	0087b503          	ld	a0,8(a5)
    800054b8:	00001097          	auipc	ra,0x1
    800054bc:	bbc080e7          	jalr	-1092(ra) # 80006074 <_ZN9BufferCPP6getCntEv>
    800054c0:	fca04ae3          	bgtz	a0,80005494 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    800054c4:	01093503          	ld	a0,16(s2)
    800054c8:	ffffd097          	auipc	ra,0xffffd
    800054cc:	580080e7          	jalr	1408(ra) # 80002a48 <_ZN9Semaphore6signalEv>
}
    800054d0:	02813083          	ld	ra,40(sp)
    800054d4:	02013403          	ld	s0,32(sp)
    800054d8:	01813483          	ld	s1,24(sp)
    800054dc:	01013903          	ld	s2,16(sp)
    800054e0:	00813983          	ld	s3,8(sp)
    800054e4:	00013a03          	ld	s4,0(sp)
    800054e8:	03010113          	addi	sp,sp,48
    800054ec:	00008067          	ret

00000000800054f0 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    800054f0:	f8010113          	addi	sp,sp,-128
    800054f4:	06113c23          	sd	ra,120(sp)
    800054f8:	06813823          	sd	s0,112(sp)
    800054fc:	06913423          	sd	s1,104(sp)
    80005500:	07213023          	sd	s2,96(sp)
    80005504:	05313c23          	sd	s3,88(sp)
    80005508:	05413823          	sd	s4,80(sp)
    8000550c:	05513423          	sd	s5,72(sp)
    80005510:	05613023          	sd	s6,64(sp)
    80005514:	03713c23          	sd	s7,56(sp)
    80005518:	03813823          	sd	s8,48(sp)
    8000551c:	03913423          	sd	s9,40(sp)
    80005520:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80005524:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80005528:	00004517          	auipc	a0,0x4
    8000552c:	cf850513          	addi	a0,a0,-776 # 80009220 <CONSOLE_STATUS+0x210>
    80005530:	00000097          	auipc	ra,0x0
    80005534:	604080e7          	jalr	1540(ra) # 80005b34 <_Z11printStringPKc>
    getString(input, 30);
    80005538:	01e00593          	li	a1,30
    8000553c:	f8040493          	addi	s1,s0,-128
    80005540:	00048513          	mv	a0,s1
    80005544:	00000097          	auipc	ra,0x0
    80005548:	678080e7          	jalr	1656(ra) # 80005bbc <_Z9getStringPci>
    threadNum = stringToInt(input);
    8000554c:	00048513          	mv	a0,s1
    80005550:	00000097          	auipc	ra,0x0
    80005554:	744080e7          	jalr	1860(ra) # 80005c94 <_Z11stringToIntPKc>
    80005558:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    8000555c:	00004517          	auipc	a0,0x4
    80005560:	ce450513          	addi	a0,a0,-796 # 80009240 <CONSOLE_STATUS+0x230>
    80005564:	00000097          	auipc	ra,0x0
    80005568:	5d0080e7          	jalr	1488(ra) # 80005b34 <_Z11printStringPKc>
    getString(input, 30);
    8000556c:	01e00593          	li	a1,30
    80005570:	00048513          	mv	a0,s1
    80005574:	00000097          	auipc	ra,0x0
    80005578:	648080e7          	jalr	1608(ra) # 80005bbc <_Z9getStringPci>
    n = stringToInt(input);
    8000557c:	00048513          	mv	a0,s1
    80005580:	00000097          	auipc	ra,0x0
    80005584:	714080e7          	jalr	1812(ra) # 80005c94 <_Z11stringToIntPKc>
    80005588:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    8000558c:	00004517          	auipc	a0,0x4
    80005590:	cd450513          	addi	a0,a0,-812 # 80009260 <CONSOLE_STATUS+0x250>
    80005594:	00000097          	auipc	ra,0x0
    80005598:	5a0080e7          	jalr	1440(ra) # 80005b34 <_Z11printStringPKc>
    8000559c:	00000613          	li	a2,0
    800055a0:	00a00593          	li	a1,10
    800055a4:	00090513          	mv	a0,s2
    800055a8:	00000097          	auipc	ra,0x0
    800055ac:	73c080e7          	jalr	1852(ra) # 80005ce4 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    800055b0:	00004517          	auipc	a0,0x4
    800055b4:	cc850513          	addi	a0,a0,-824 # 80009278 <CONSOLE_STATUS+0x268>
    800055b8:	00000097          	auipc	ra,0x0
    800055bc:	57c080e7          	jalr	1404(ra) # 80005b34 <_Z11printStringPKc>
    800055c0:	00000613          	li	a2,0
    800055c4:	00a00593          	li	a1,10
    800055c8:	00048513          	mv	a0,s1
    800055cc:	00000097          	auipc	ra,0x0
    800055d0:	718080e7          	jalr	1816(ra) # 80005ce4 <_Z8printIntiii>
    printString(".\n");
    800055d4:	00004517          	auipc	a0,0x4
    800055d8:	cbc50513          	addi	a0,a0,-836 # 80009290 <CONSOLE_STATUS+0x280>
    800055dc:	00000097          	auipc	ra,0x0
    800055e0:	558080e7          	jalr	1368(ra) # 80005b34 <_Z11printStringPKc>
    if(threadNum > n) {
    800055e4:	0324c463          	blt	s1,s2,8000560c <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    800055e8:	03205c63          	blez	s2,80005620 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    800055ec:	03800513          	li	a0,56
    800055f0:	ffffd097          	auipc	ra,0xffffd
    800055f4:	0b0080e7          	jalr	176(ra) # 800026a0 <_Znwm>
    800055f8:	00050a93          	mv	s5,a0
    800055fc:	00048593          	mv	a1,s1
    80005600:	00001097          	auipc	ra,0x1
    80005604:	804080e7          	jalr	-2044(ra) # 80005e04 <_ZN9BufferCPPC1Ei>
    80005608:	0300006f          	j	80005638 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    8000560c:	00004517          	auipc	a0,0x4
    80005610:	c8c50513          	addi	a0,a0,-884 # 80009298 <CONSOLE_STATUS+0x288>
    80005614:	00000097          	auipc	ra,0x0
    80005618:	520080e7          	jalr	1312(ra) # 80005b34 <_Z11printStringPKc>
        return;
    8000561c:	0140006f          	j	80005630 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80005620:	00004517          	auipc	a0,0x4
    80005624:	cb850513          	addi	a0,a0,-840 # 800092d8 <CONSOLE_STATUS+0x2c8>
    80005628:	00000097          	auipc	ra,0x0
    8000562c:	50c080e7          	jalr	1292(ra) # 80005b34 <_Z11printStringPKc>
        return;
    80005630:	000b8113          	mv	sp,s7
    80005634:	2380006f          	j	8000586c <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80005638:	01000513          	li	a0,16
    8000563c:	ffffd097          	auipc	ra,0xffffd
    80005640:	064080e7          	jalr	100(ra) # 800026a0 <_Znwm>
    80005644:	00050493          	mv	s1,a0
    80005648:	00000593          	li	a1,0
    8000564c:	ffffd097          	auipc	ra,0xffffd
    80005650:	398080e7          	jalr	920(ra) # 800029e4 <_ZN9SemaphoreC1Ej>
    80005654:	00006797          	auipc	a5,0x6
    80005658:	6497be23          	sd	s1,1628(a5) # 8000bcb0 <_ZL10waitForAll>
    Thread* threads[threadNum];
    8000565c:	00391793          	slli	a5,s2,0x3
    80005660:	00f78793          	addi	a5,a5,15
    80005664:	ff07f793          	andi	a5,a5,-16
    80005668:	40f10133          	sub	sp,sp,a5
    8000566c:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80005670:	0019071b          	addiw	a4,s2,1
    80005674:	00171793          	slli	a5,a4,0x1
    80005678:	00e787b3          	add	a5,a5,a4
    8000567c:	00379793          	slli	a5,a5,0x3
    80005680:	00f78793          	addi	a5,a5,15
    80005684:	ff07f793          	andi	a5,a5,-16
    80005688:	40f10133          	sub	sp,sp,a5
    8000568c:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80005690:	00191c13          	slli	s8,s2,0x1
    80005694:	012c07b3          	add	a5,s8,s2
    80005698:	00379793          	slli	a5,a5,0x3
    8000569c:	00fa07b3          	add	a5,s4,a5
    800056a0:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    800056a4:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    800056a8:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    800056ac:	02800513          	li	a0,40
    800056b0:	ffffd097          	auipc	ra,0xffffd
    800056b4:	ff0080e7          	jalr	-16(ra) # 800026a0 <_Znwm>
    800056b8:	00050b13          	mv	s6,a0
    800056bc:	012c0c33          	add	s8,s8,s2
    800056c0:	003c1c13          	slli	s8,s8,0x3
    800056c4:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    800056c8:	ffffd097          	auipc	ra,0xffffd
    800056cc:	2a0080e7          	jalr	672(ra) # 80002968 <_ZN6ThreadC1Ev>
    800056d0:	00006797          	auipc	a5,0x6
    800056d4:	3a878793          	addi	a5,a5,936 # 8000ba78 <_ZTV12ConsumerSync+0x10>
    800056d8:	00fb3023          	sd	a5,0(s6)
    800056dc:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    800056e0:	000b0513          	mv	a0,s6
    800056e4:	ffffd097          	auipc	ra,0xffffd
    800056e8:	16c080e7          	jalr	364(ra) # 80002850 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    800056ec:	00000493          	li	s1,0
    800056f0:	0380006f          	j	80005728 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    800056f4:	00006797          	auipc	a5,0x6
    800056f8:	35c78793          	addi	a5,a5,860 # 8000ba50 <_ZTV12ProducerSync+0x10>
    800056fc:	00fcb023          	sd	a5,0(s9)
    80005700:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80005704:	00349793          	slli	a5,s1,0x3
    80005708:	00f987b3          	add	a5,s3,a5
    8000570c:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80005710:	00349793          	slli	a5,s1,0x3
    80005714:	00f987b3          	add	a5,s3,a5
    80005718:	0007b503          	ld	a0,0(a5)
    8000571c:	ffffd097          	auipc	ra,0xffffd
    80005720:	134080e7          	jalr	308(ra) # 80002850 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005724:	0014849b          	addiw	s1,s1,1
    80005728:	0b24d063          	bge	s1,s2,800057c8 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    8000572c:	00149793          	slli	a5,s1,0x1
    80005730:	009787b3          	add	a5,a5,s1
    80005734:	00379793          	slli	a5,a5,0x3
    80005738:	00fa07b3          	add	a5,s4,a5
    8000573c:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80005740:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80005744:	00006717          	auipc	a4,0x6
    80005748:	56c73703          	ld	a4,1388(a4) # 8000bcb0 <_ZL10waitForAll>
    8000574c:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80005750:	02905863          	blez	s1,80005780 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80005754:	02800513          	li	a0,40
    80005758:	ffffd097          	auipc	ra,0xffffd
    8000575c:	f48080e7          	jalr	-184(ra) # 800026a0 <_Znwm>
    80005760:	00050c93          	mv	s9,a0
    80005764:	00149c13          	slli	s8,s1,0x1
    80005768:	009c0c33          	add	s8,s8,s1
    8000576c:	003c1c13          	slli	s8,s8,0x3
    80005770:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005774:	ffffd097          	auipc	ra,0xffffd
    80005778:	1f4080e7          	jalr	500(ra) # 80002968 <_ZN6ThreadC1Ev>
    8000577c:	f79ff06f          	j	800056f4 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80005780:	02800513          	li	a0,40
    80005784:	ffffd097          	auipc	ra,0xffffd
    80005788:	f1c080e7          	jalr	-228(ra) # 800026a0 <_Znwm>
    8000578c:	00050c93          	mv	s9,a0
    80005790:	00149c13          	slli	s8,s1,0x1
    80005794:	009c0c33          	add	s8,s8,s1
    80005798:	003c1c13          	slli	s8,s8,0x3
    8000579c:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    800057a0:	ffffd097          	auipc	ra,0xffffd
    800057a4:	1c8080e7          	jalr	456(ra) # 80002968 <_ZN6ThreadC1Ev>
    800057a8:	00006797          	auipc	a5,0x6
    800057ac:	28078793          	addi	a5,a5,640 # 8000ba28 <_ZTV16ProducerKeyboard+0x10>
    800057b0:	00fcb023          	sd	a5,0(s9)
    800057b4:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    800057b8:	00349793          	slli	a5,s1,0x3
    800057bc:	00f987b3          	add	a5,s3,a5
    800057c0:	0197b023          	sd	s9,0(a5)
    800057c4:	f4dff06f          	j	80005710 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    800057c8:	ffffd097          	auipc	ra,0xffffd
    800057cc:	0ec080e7          	jalr	236(ra) # 800028b4 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    800057d0:	00000493          	li	s1,0
    800057d4:	00994e63          	blt	s2,s1,800057f0 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    800057d8:	00006517          	auipc	a0,0x6
    800057dc:	4d853503          	ld	a0,1240(a0) # 8000bcb0 <_ZL10waitForAll>
    800057e0:	ffffd097          	auipc	ra,0xffffd
    800057e4:	23c080e7          	jalr	572(ra) # 80002a1c <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    800057e8:	0014849b          	addiw	s1,s1,1
    800057ec:	fe9ff06f          	j	800057d4 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    800057f0:	00000493          	li	s1,0
    800057f4:	0080006f          	j	800057fc <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    800057f8:	0014849b          	addiw	s1,s1,1
    800057fc:	0324d263          	bge	s1,s2,80005820 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80005800:	00349793          	slli	a5,s1,0x3
    80005804:	00f987b3          	add	a5,s3,a5
    80005808:	0007b503          	ld	a0,0(a5)
    8000580c:	fe0506e3          	beqz	a0,800057f8 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80005810:	00053783          	ld	a5,0(a0)
    80005814:	0087b783          	ld	a5,8(a5)
    80005818:	000780e7          	jalr	a5
    8000581c:	fddff06f          	j	800057f8 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80005820:	000b0a63          	beqz	s6,80005834 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80005824:	000b3783          	ld	a5,0(s6)
    80005828:	0087b783          	ld	a5,8(a5)
    8000582c:	000b0513          	mv	a0,s6
    80005830:	000780e7          	jalr	a5
    delete waitForAll;
    80005834:	00006517          	auipc	a0,0x6
    80005838:	47c53503          	ld	a0,1148(a0) # 8000bcb0 <_ZL10waitForAll>
    8000583c:	00050863          	beqz	a0,8000584c <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80005840:	00053783          	ld	a5,0(a0)
    80005844:	0087b783          	ld	a5,8(a5)
    80005848:	000780e7          	jalr	a5
    delete buffer;
    8000584c:	000a8e63          	beqz	s5,80005868 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80005850:	000a8513          	mv	a0,s5
    80005854:	00001097          	auipc	ra,0x1
    80005858:	8a8080e7          	jalr	-1880(ra) # 800060fc <_ZN9BufferCPPD1Ev>
    8000585c:	000a8513          	mv	a0,s5
    80005860:	ffffd097          	auipc	ra,0xffffd
    80005864:	e90080e7          	jalr	-368(ra) # 800026f0 <_ZdlPv>
    80005868:	000b8113          	mv	sp,s7

}
    8000586c:	f8040113          	addi	sp,s0,-128
    80005870:	07813083          	ld	ra,120(sp)
    80005874:	07013403          	ld	s0,112(sp)
    80005878:	06813483          	ld	s1,104(sp)
    8000587c:	06013903          	ld	s2,96(sp)
    80005880:	05813983          	ld	s3,88(sp)
    80005884:	05013a03          	ld	s4,80(sp)
    80005888:	04813a83          	ld	s5,72(sp)
    8000588c:	04013b03          	ld	s6,64(sp)
    80005890:	03813b83          	ld	s7,56(sp)
    80005894:	03013c03          	ld	s8,48(sp)
    80005898:	02813c83          	ld	s9,40(sp)
    8000589c:	08010113          	addi	sp,sp,128
    800058a0:	00008067          	ret
    800058a4:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    800058a8:	000a8513          	mv	a0,s5
    800058ac:	ffffd097          	auipc	ra,0xffffd
    800058b0:	e44080e7          	jalr	-444(ra) # 800026f0 <_ZdlPv>
    800058b4:	00048513          	mv	a0,s1
    800058b8:	00007097          	auipc	ra,0x7
    800058bc:	4e0080e7          	jalr	1248(ra) # 8000cd98 <_Unwind_Resume>
    800058c0:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    800058c4:	00048513          	mv	a0,s1
    800058c8:	ffffd097          	auipc	ra,0xffffd
    800058cc:	e28080e7          	jalr	-472(ra) # 800026f0 <_ZdlPv>
    800058d0:	00090513          	mv	a0,s2
    800058d4:	00007097          	auipc	ra,0x7
    800058d8:	4c4080e7          	jalr	1220(ra) # 8000cd98 <_Unwind_Resume>
    800058dc:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    800058e0:	000b0513          	mv	a0,s6
    800058e4:	ffffd097          	auipc	ra,0xffffd
    800058e8:	e0c080e7          	jalr	-500(ra) # 800026f0 <_ZdlPv>
    800058ec:	00048513          	mv	a0,s1
    800058f0:	00007097          	auipc	ra,0x7
    800058f4:	4a8080e7          	jalr	1192(ra) # 8000cd98 <_Unwind_Resume>
    800058f8:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    800058fc:	000c8513          	mv	a0,s9
    80005900:	ffffd097          	auipc	ra,0xffffd
    80005904:	df0080e7          	jalr	-528(ra) # 800026f0 <_ZdlPv>
    80005908:	00048513          	mv	a0,s1
    8000590c:	00007097          	auipc	ra,0x7
    80005910:	48c080e7          	jalr	1164(ra) # 8000cd98 <_Unwind_Resume>
    80005914:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80005918:	000c8513          	mv	a0,s9
    8000591c:	ffffd097          	auipc	ra,0xffffd
    80005920:	dd4080e7          	jalr	-556(ra) # 800026f0 <_ZdlPv>
    80005924:	00048513          	mv	a0,s1
    80005928:	00007097          	auipc	ra,0x7
    8000592c:	470080e7          	jalr	1136(ra) # 8000cd98 <_Unwind_Resume>

0000000080005930 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80005930:	ff010113          	addi	sp,sp,-16
    80005934:	00113423          	sd	ra,8(sp)
    80005938:	00813023          	sd	s0,0(sp)
    8000593c:	01010413          	addi	s0,sp,16
    80005940:	00006797          	auipc	a5,0x6
    80005944:	13878793          	addi	a5,a5,312 # 8000ba78 <_ZTV12ConsumerSync+0x10>
    80005948:	00f53023          	sd	a5,0(a0)
    8000594c:	ffffd097          	auipc	ra,0xffffd
    80005950:	c64080e7          	jalr	-924(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80005954:	00813083          	ld	ra,8(sp)
    80005958:	00013403          	ld	s0,0(sp)
    8000595c:	01010113          	addi	sp,sp,16
    80005960:	00008067          	ret

0000000080005964 <_ZN12ConsumerSyncD0Ev>:
    80005964:	fe010113          	addi	sp,sp,-32
    80005968:	00113c23          	sd	ra,24(sp)
    8000596c:	00813823          	sd	s0,16(sp)
    80005970:	00913423          	sd	s1,8(sp)
    80005974:	02010413          	addi	s0,sp,32
    80005978:	00050493          	mv	s1,a0
    8000597c:	00006797          	auipc	a5,0x6
    80005980:	0fc78793          	addi	a5,a5,252 # 8000ba78 <_ZTV12ConsumerSync+0x10>
    80005984:	00f53023          	sd	a5,0(a0)
    80005988:	ffffd097          	auipc	ra,0xffffd
    8000598c:	c28080e7          	jalr	-984(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80005990:	00048513          	mv	a0,s1
    80005994:	ffffd097          	auipc	ra,0xffffd
    80005998:	d5c080e7          	jalr	-676(ra) # 800026f0 <_ZdlPv>
    8000599c:	01813083          	ld	ra,24(sp)
    800059a0:	01013403          	ld	s0,16(sp)
    800059a4:	00813483          	ld	s1,8(sp)
    800059a8:	02010113          	addi	sp,sp,32
    800059ac:	00008067          	ret

00000000800059b0 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    800059b0:	ff010113          	addi	sp,sp,-16
    800059b4:	00113423          	sd	ra,8(sp)
    800059b8:	00813023          	sd	s0,0(sp)
    800059bc:	01010413          	addi	s0,sp,16
    800059c0:	00006797          	auipc	a5,0x6
    800059c4:	09078793          	addi	a5,a5,144 # 8000ba50 <_ZTV12ProducerSync+0x10>
    800059c8:	00f53023          	sd	a5,0(a0)
    800059cc:	ffffd097          	auipc	ra,0xffffd
    800059d0:	be4080e7          	jalr	-1052(ra) # 800025b0 <_ZN6ThreadD1Ev>
    800059d4:	00813083          	ld	ra,8(sp)
    800059d8:	00013403          	ld	s0,0(sp)
    800059dc:	01010113          	addi	sp,sp,16
    800059e0:	00008067          	ret

00000000800059e4 <_ZN12ProducerSyncD0Ev>:
    800059e4:	fe010113          	addi	sp,sp,-32
    800059e8:	00113c23          	sd	ra,24(sp)
    800059ec:	00813823          	sd	s0,16(sp)
    800059f0:	00913423          	sd	s1,8(sp)
    800059f4:	02010413          	addi	s0,sp,32
    800059f8:	00050493          	mv	s1,a0
    800059fc:	00006797          	auipc	a5,0x6
    80005a00:	05478793          	addi	a5,a5,84 # 8000ba50 <_ZTV12ProducerSync+0x10>
    80005a04:	00f53023          	sd	a5,0(a0)
    80005a08:	ffffd097          	auipc	ra,0xffffd
    80005a0c:	ba8080e7          	jalr	-1112(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80005a10:	00048513          	mv	a0,s1
    80005a14:	ffffd097          	auipc	ra,0xffffd
    80005a18:	cdc080e7          	jalr	-804(ra) # 800026f0 <_ZdlPv>
    80005a1c:	01813083          	ld	ra,24(sp)
    80005a20:	01013403          	ld	s0,16(sp)
    80005a24:	00813483          	ld	s1,8(sp)
    80005a28:	02010113          	addi	sp,sp,32
    80005a2c:	00008067          	ret

0000000080005a30 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80005a30:	ff010113          	addi	sp,sp,-16
    80005a34:	00113423          	sd	ra,8(sp)
    80005a38:	00813023          	sd	s0,0(sp)
    80005a3c:	01010413          	addi	s0,sp,16
    80005a40:	00006797          	auipc	a5,0x6
    80005a44:	fe878793          	addi	a5,a5,-24 # 8000ba28 <_ZTV16ProducerKeyboard+0x10>
    80005a48:	00f53023          	sd	a5,0(a0)
    80005a4c:	ffffd097          	auipc	ra,0xffffd
    80005a50:	b64080e7          	jalr	-1180(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80005a54:	00813083          	ld	ra,8(sp)
    80005a58:	00013403          	ld	s0,0(sp)
    80005a5c:	01010113          	addi	sp,sp,16
    80005a60:	00008067          	ret

0000000080005a64 <_ZN16ProducerKeyboardD0Ev>:
    80005a64:	fe010113          	addi	sp,sp,-32
    80005a68:	00113c23          	sd	ra,24(sp)
    80005a6c:	00813823          	sd	s0,16(sp)
    80005a70:	00913423          	sd	s1,8(sp)
    80005a74:	02010413          	addi	s0,sp,32
    80005a78:	00050493          	mv	s1,a0
    80005a7c:	00006797          	auipc	a5,0x6
    80005a80:	fac78793          	addi	a5,a5,-84 # 8000ba28 <_ZTV16ProducerKeyboard+0x10>
    80005a84:	00f53023          	sd	a5,0(a0)
    80005a88:	ffffd097          	auipc	ra,0xffffd
    80005a8c:	b28080e7          	jalr	-1240(ra) # 800025b0 <_ZN6ThreadD1Ev>
    80005a90:	00048513          	mv	a0,s1
    80005a94:	ffffd097          	auipc	ra,0xffffd
    80005a98:	c5c080e7          	jalr	-932(ra) # 800026f0 <_ZdlPv>
    80005a9c:	01813083          	ld	ra,24(sp)
    80005aa0:	01013403          	ld	s0,16(sp)
    80005aa4:	00813483          	ld	s1,8(sp)
    80005aa8:	02010113          	addi	sp,sp,32
    80005aac:	00008067          	ret

0000000080005ab0 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80005ab0:	ff010113          	addi	sp,sp,-16
    80005ab4:	00113423          	sd	ra,8(sp)
    80005ab8:	00813023          	sd	s0,0(sp)
    80005abc:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80005ac0:	02053583          	ld	a1,32(a0)
    80005ac4:	fffff097          	auipc	ra,0xfffff
    80005ac8:	7e4080e7          	jalr	2020(ra) # 800052a8 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80005acc:	00813083          	ld	ra,8(sp)
    80005ad0:	00013403          	ld	s0,0(sp)
    80005ad4:	01010113          	addi	sp,sp,16
    80005ad8:	00008067          	ret

0000000080005adc <_ZN12ProducerSync3runEv>:
    void run() override {
    80005adc:	ff010113          	addi	sp,sp,-16
    80005ae0:	00113423          	sd	ra,8(sp)
    80005ae4:	00813023          	sd	s0,0(sp)
    80005ae8:	01010413          	addi	s0,sp,16
        producer(td);
    80005aec:	02053583          	ld	a1,32(a0)
    80005af0:	00000097          	auipc	ra,0x0
    80005af4:	878080e7          	jalr	-1928(ra) # 80005368 <_ZN12ProducerSync8producerEPv>
    }
    80005af8:	00813083          	ld	ra,8(sp)
    80005afc:	00013403          	ld	s0,0(sp)
    80005b00:	01010113          	addi	sp,sp,16
    80005b04:	00008067          	ret

0000000080005b08 <_ZN12ConsumerSync3runEv>:
    void run() override {
    80005b08:	ff010113          	addi	sp,sp,-16
    80005b0c:	00113423          	sd	ra,8(sp)
    80005b10:	00813023          	sd	s0,0(sp)
    80005b14:	01010413          	addi	s0,sp,16
        consumer(td);
    80005b18:	02053583          	ld	a1,32(a0)
    80005b1c:	00000097          	auipc	ra,0x0
    80005b20:	8e0080e7          	jalr	-1824(ra) # 800053fc <_ZN12ConsumerSync8consumerEPv>
    }
    80005b24:	00813083          	ld	ra,8(sp)
    80005b28:	00013403          	ld	s0,0(sp)
    80005b2c:	01010113          	addi	sp,sp,16
    80005b30:	00008067          	ret

0000000080005b34 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80005b34:	fe010113          	addi	sp,sp,-32
    80005b38:	00113c23          	sd	ra,24(sp)
    80005b3c:	00813823          	sd	s0,16(sp)
    80005b40:	00913423          	sd	s1,8(sp)
    80005b44:	02010413          	addi	s0,sp,32
    80005b48:	00050493          	mv	s1,a0
    LOCK();
    80005b4c:	00100613          	li	a2,1
    80005b50:	00000593          	li	a1,0
    80005b54:	00006517          	auipc	a0,0x6
    80005b58:	16450513          	addi	a0,a0,356 # 8000bcb8 <lockPrint>
    80005b5c:	ffffb097          	auipc	ra,0xffffb
    80005b60:	6c8080e7          	jalr	1736(ra) # 80001224 <copy_and_swap>
    80005b64:	00050863          	beqz	a0,80005b74 <_Z11printStringPKc+0x40>
    80005b68:	ffffc097          	auipc	ra,0xffffc
    80005b6c:	8c0080e7          	jalr	-1856(ra) # 80001428 <_Z15thread_dispatchv>
    80005b70:	fddff06f          	j	80005b4c <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80005b74:	0004c503          	lbu	a0,0(s1)
    80005b78:	00050a63          	beqz	a0,80005b8c <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80005b7c:	ffffc097          	auipc	ra,0xffffc
    80005b80:	a14080e7          	jalr	-1516(ra) # 80001590 <_Z4putcc>
        string++;
    80005b84:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80005b88:	fedff06f          	j	80005b74 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80005b8c:	00000613          	li	a2,0
    80005b90:	00100593          	li	a1,1
    80005b94:	00006517          	auipc	a0,0x6
    80005b98:	12450513          	addi	a0,a0,292 # 8000bcb8 <lockPrint>
    80005b9c:	ffffb097          	auipc	ra,0xffffb
    80005ba0:	688080e7          	jalr	1672(ra) # 80001224 <copy_and_swap>
    80005ba4:	fe0514e3          	bnez	a0,80005b8c <_Z11printStringPKc+0x58>
}
    80005ba8:	01813083          	ld	ra,24(sp)
    80005bac:	01013403          	ld	s0,16(sp)
    80005bb0:	00813483          	ld	s1,8(sp)
    80005bb4:	02010113          	addi	sp,sp,32
    80005bb8:	00008067          	ret

0000000080005bbc <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80005bbc:	fd010113          	addi	sp,sp,-48
    80005bc0:	02113423          	sd	ra,40(sp)
    80005bc4:	02813023          	sd	s0,32(sp)
    80005bc8:	00913c23          	sd	s1,24(sp)
    80005bcc:	01213823          	sd	s2,16(sp)
    80005bd0:	01313423          	sd	s3,8(sp)
    80005bd4:	01413023          	sd	s4,0(sp)
    80005bd8:	03010413          	addi	s0,sp,48
    80005bdc:	00050993          	mv	s3,a0
    80005be0:	00058a13          	mv	s4,a1
    LOCK();
    80005be4:	00100613          	li	a2,1
    80005be8:	00000593          	li	a1,0
    80005bec:	00006517          	auipc	a0,0x6
    80005bf0:	0cc50513          	addi	a0,a0,204 # 8000bcb8 <lockPrint>
    80005bf4:	ffffb097          	auipc	ra,0xffffb
    80005bf8:	630080e7          	jalr	1584(ra) # 80001224 <copy_and_swap>
    80005bfc:	00050863          	beqz	a0,80005c0c <_Z9getStringPci+0x50>
    80005c00:	ffffc097          	auipc	ra,0xffffc
    80005c04:	828080e7          	jalr	-2008(ra) # 80001428 <_Z15thread_dispatchv>
    80005c08:	fddff06f          	j	80005be4 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80005c0c:	00000913          	li	s2,0
    80005c10:	00090493          	mv	s1,s2
    80005c14:	0019091b          	addiw	s2,s2,1
    80005c18:	03495a63          	bge	s2,s4,80005c4c <_Z9getStringPci+0x90>
        cc = getc();
    80005c1c:	ffffc097          	auipc	ra,0xffffc
    80005c20:	94c080e7          	jalr	-1716(ra) # 80001568 <_Z4getcv>
        if(cc < 1)
    80005c24:	02050463          	beqz	a0,80005c4c <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80005c28:	009984b3          	add	s1,s3,s1
    80005c2c:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80005c30:	00a00793          	li	a5,10
    80005c34:	00f50a63          	beq	a0,a5,80005c48 <_Z9getStringPci+0x8c>
    80005c38:	00d00793          	li	a5,13
    80005c3c:	fcf51ae3          	bne	a0,a5,80005c10 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80005c40:	00090493          	mv	s1,s2
    80005c44:	0080006f          	j	80005c4c <_Z9getStringPci+0x90>
    80005c48:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80005c4c:	009984b3          	add	s1,s3,s1
    80005c50:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80005c54:	00000613          	li	a2,0
    80005c58:	00100593          	li	a1,1
    80005c5c:	00006517          	auipc	a0,0x6
    80005c60:	05c50513          	addi	a0,a0,92 # 8000bcb8 <lockPrint>
    80005c64:	ffffb097          	auipc	ra,0xffffb
    80005c68:	5c0080e7          	jalr	1472(ra) # 80001224 <copy_and_swap>
    80005c6c:	fe0514e3          	bnez	a0,80005c54 <_Z9getStringPci+0x98>
    return buf;
}
    80005c70:	00098513          	mv	a0,s3
    80005c74:	02813083          	ld	ra,40(sp)
    80005c78:	02013403          	ld	s0,32(sp)
    80005c7c:	01813483          	ld	s1,24(sp)
    80005c80:	01013903          	ld	s2,16(sp)
    80005c84:	00813983          	ld	s3,8(sp)
    80005c88:	00013a03          	ld	s4,0(sp)
    80005c8c:	03010113          	addi	sp,sp,48
    80005c90:	00008067          	ret

0000000080005c94 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80005c94:	ff010113          	addi	sp,sp,-16
    80005c98:	00813423          	sd	s0,8(sp)
    80005c9c:	01010413          	addi	s0,sp,16
    80005ca0:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80005ca4:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80005ca8:	0006c603          	lbu	a2,0(a3)
    80005cac:	fd06071b          	addiw	a4,a2,-48
    80005cb0:	0ff77713          	andi	a4,a4,255
    80005cb4:	00900793          	li	a5,9
    80005cb8:	02e7e063          	bltu	a5,a4,80005cd8 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80005cbc:	0025179b          	slliw	a5,a0,0x2
    80005cc0:	00a787bb          	addw	a5,a5,a0
    80005cc4:	0017979b          	slliw	a5,a5,0x1
    80005cc8:	00168693          	addi	a3,a3,1
    80005ccc:	00c787bb          	addw	a5,a5,a2
    80005cd0:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80005cd4:	fd5ff06f          	j	80005ca8 <_Z11stringToIntPKc+0x14>
    return n;
}
    80005cd8:	00813403          	ld	s0,8(sp)
    80005cdc:	01010113          	addi	sp,sp,16
    80005ce0:	00008067          	ret

0000000080005ce4 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80005ce4:	fc010113          	addi	sp,sp,-64
    80005ce8:	02113c23          	sd	ra,56(sp)
    80005cec:	02813823          	sd	s0,48(sp)
    80005cf0:	02913423          	sd	s1,40(sp)
    80005cf4:	03213023          	sd	s2,32(sp)
    80005cf8:	01313c23          	sd	s3,24(sp)
    80005cfc:	04010413          	addi	s0,sp,64
    80005d00:	00050493          	mv	s1,a0
    80005d04:	00058913          	mv	s2,a1
    80005d08:	00060993          	mv	s3,a2
    LOCK();
    80005d0c:	00100613          	li	a2,1
    80005d10:	00000593          	li	a1,0
    80005d14:	00006517          	auipc	a0,0x6
    80005d18:	fa450513          	addi	a0,a0,-92 # 8000bcb8 <lockPrint>
    80005d1c:	ffffb097          	auipc	ra,0xffffb
    80005d20:	508080e7          	jalr	1288(ra) # 80001224 <copy_and_swap>
    80005d24:	00050863          	beqz	a0,80005d34 <_Z8printIntiii+0x50>
    80005d28:	ffffb097          	auipc	ra,0xffffb
    80005d2c:	700080e7          	jalr	1792(ra) # 80001428 <_Z15thread_dispatchv>
    80005d30:	fddff06f          	j	80005d0c <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80005d34:	00098463          	beqz	s3,80005d3c <_Z8printIntiii+0x58>
    80005d38:	0804c463          	bltz	s1,80005dc0 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80005d3c:	0004851b          	sext.w	a0,s1
    neg = 0;
    80005d40:	00000593          	li	a1,0
    }

    i = 0;
    80005d44:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80005d48:	0009079b          	sext.w	a5,s2
    80005d4c:	0325773b          	remuw	a4,a0,s2
    80005d50:	00048613          	mv	a2,s1
    80005d54:	0014849b          	addiw	s1,s1,1
    80005d58:	02071693          	slli	a3,a4,0x20
    80005d5c:	0206d693          	srli	a3,a3,0x20
    80005d60:	00006717          	auipc	a4,0x6
    80005d64:	d3070713          	addi	a4,a4,-720 # 8000ba90 <digits>
    80005d68:	00d70733          	add	a4,a4,a3
    80005d6c:	00074683          	lbu	a3,0(a4)
    80005d70:	fd040713          	addi	a4,s0,-48
    80005d74:	00c70733          	add	a4,a4,a2
    80005d78:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80005d7c:	0005071b          	sext.w	a4,a0
    80005d80:	0325553b          	divuw	a0,a0,s2
    80005d84:	fcf772e3          	bgeu	a4,a5,80005d48 <_Z8printIntiii+0x64>
    if(neg)
    80005d88:	00058c63          	beqz	a1,80005da0 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80005d8c:	fd040793          	addi	a5,s0,-48
    80005d90:	009784b3          	add	s1,a5,s1
    80005d94:	02d00793          	li	a5,45
    80005d98:	fef48823          	sb	a5,-16(s1)
    80005d9c:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80005da0:	fff4849b          	addiw	s1,s1,-1
    80005da4:	0204c463          	bltz	s1,80005dcc <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80005da8:	fd040793          	addi	a5,s0,-48
    80005dac:	009787b3          	add	a5,a5,s1
    80005db0:	ff07c503          	lbu	a0,-16(a5)
    80005db4:	ffffb097          	auipc	ra,0xffffb
    80005db8:	7dc080e7          	jalr	2012(ra) # 80001590 <_Z4putcc>
    80005dbc:	fe5ff06f          	j	80005da0 <_Z8printIntiii+0xbc>
        x = -xx;
    80005dc0:	4090053b          	negw	a0,s1
        neg = 1;
    80005dc4:	00100593          	li	a1,1
        x = -xx;
    80005dc8:	f7dff06f          	j	80005d44 <_Z8printIntiii+0x60>

    UNLOCK();
    80005dcc:	00000613          	li	a2,0
    80005dd0:	00100593          	li	a1,1
    80005dd4:	00006517          	auipc	a0,0x6
    80005dd8:	ee450513          	addi	a0,a0,-284 # 8000bcb8 <lockPrint>
    80005ddc:	ffffb097          	auipc	ra,0xffffb
    80005de0:	448080e7          	jalr	1096(ra) # 80001224 <copy_and_swap>
    80005de4:	fe0514e3          	bnez	a0,80005dcc <_Z8printIntiii+0xe8>
    80005de8:	03813083          	ld	ra,56(sp)
    80005dec:	03013403          	ld	s0,48(sp)
    80005df0:	02813483          	ld	s1,40(sp)
    80005df4:	02013903          	ld	s2,32(sp)
    80005df8:	01813983          	ld	s3,24(sp)
    80005dfc:	04010113          	addi	sp,sp,64
    80005e00:	00008067          	ret

0000000080005e04 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80005e04:	fd010113          	addi	sp,sp,-48
    80005e08:	02113423          	sd	ra,40(sp)
    80005e0c:	02813023          	sd	s0,32(sp)
    80005e10:	00913c23          	sd	s1,24(sp)
    80005e14:	01213823          	sd	s2,16(sp)
    80005e18:	01313423          	sd	s3,8(sp)
    80005e1c:	03010413          	addi	s0,sp,48
    80005e20:	00050493          	mv	s1,a0
    80005e24:	00058913          	mv	s2,a1
    80005e28:	0015879b          	addiw	a5,a1,1
    80005e2c:	0007851b          	sext.w	a0,a5
    80005e30:	00f4a023          	sw	a5,0(s1)
    80005e34:	0004a823          	sw	zero,16(s1)
    80005e38:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80005e3c:	00251513          	slli	a0,a0,0x2
    80005e40:	ffffb097          	auipc	ra,0xffffb
    80005e44:	4d0080e7          	jalr	1232(ra) # 80001310 <_Z9mem_allocm>
    80005e48:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80005e4c:	01000513          	li	a0,16
    80005e50:	ffffd097          	auipc	ra,0xffffd
    80005e54:	850080e7          	jalr	-1968(ra) # 800026a0 <_Znwm>
    80005e58:	00050993          	mv	s3,a0
    80005e5c:	00000593          	li	a1,0
    80005e60:	ffffd097          	auipc	ra,0xffffd
    80005e64:	b84080e7          	jalr	-1148(ra) # 800029e4 <_ZN9SemaphoreC1Ej>
    80005e68:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80005e6c:	01000513          	li	a0,16
    80005e70:	ffffd097          	auipc	ra,0xffffd
    80005e74:	830080e7          	jalr	-2000(ra) # 800026a0 <_Znwm>
    80005e78:	00050993          	mv	s3,a0
    80005e7c:	00090593          	mv	a1,s2
    80005e80:	ffffd097          	auipc	ra,0xffffd
    80005e84:	b64080e7          	jalr	-1180(ra) # 800029e4 <_ZN9SemaphoreC1Ej>
    80005e88:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80005e8c:	01000513          	li	a0,16
    80005e90:	ffffd097          	auipc	ra,0xffffd
    80005e94:	810080e7          	jalr	-2032(ra) # 800026a0 <_Znwm>
    80005e98:	00050913          	mv	s2,a0
    80005e9c:	00100593          	li	a1,1
    80005ea0:	ffffd097          	auipc	ra,0xffffd
    80005ea4:	b44080e7          	jalr	-1212(ra) # 800029e4 <_ZN9SemaphoreC1Ej>
    80005ea8:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80005eac:	01000513          	li	a0,16
    80005eb0:	ffffc097          	auipc	ra,0xffffc
    80005eb4:	7f0080e7          	jalr	2032(ra) # 800026a0 <_Znwm>
    80005eb8:	00050913          	mv	s2,a0
    80005ebc:	00100593          	li	a1,1
    80005ec0:	ffffd097          	auipc	ra,0xffffd
    80005ec4:	b24080e7          	jalr	-1244(ra) # 800029e4 <_ZN9SemaphoreC1Ej>
    80005ec8:	0324b823          	sd	s2,48(s1)
}
    80005ecc:	02813083          	ld	ra,40(sp)
    80005ed0:	02013403          	ld	s0,32(sp)
    80005ed4:	01813483          	ld	s1,24(sp)
    80005ed8:	01013903          	ld	s2,16(sp)
    80005edc:	00813983          	ld	s3,8(sp)
    80005ee0:	03010113          	addi	sp,sp,48
    80005ee4:	00008067          	ret
    80005ee8:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80005eec:	00098513          	mv	a0,s3
    80005ef0:	ffffd097          	auipc	ra,0xffffd
    80005ef4:	800080e7          	jalr	-2048(ra) # 800026f0 <_ZdlPv>
    80005ef8:	00048513          	mv	a0,s1
    80005efc:	00007097          	auipc	ra,0x7
    80005f00:	e9c080e7          	jalr	-356(ra) # 8000cd98 <_Unwind_Resume>
    80005f04:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80005f08:	00098513          	mv	a0,s3
    80005f0c:	ffffc097          	auipc	ra,0xffffc
    80005f10:	7e4080e7          	jalr	2020(ra) # 800026f0 <_ZdlPv>
    80005f14:	00048513          	mv	a0,s1
    80005f18:	00007097          	auipc	ra,0x7
    80005f1c:	e80080e7          	jalr	-384(ra) # 8000cd98 <_Unwind_Resume>
    80005f20:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80005f24:	00090513          	mv	a0,s2
    80005f28:	ffffc097          	auipc	ra,0xffffc
    80005f2c:	7c8080e7          	jalr	1992(ra) # 800026f0 <_ZdlPv>
    80005f30:	00048513          	mv	a0,s1
    80005f34:	00007097          	auipc	ra,0x7
    80005f38:	e64080e7          	jalr	-412(ra) # 8000cd98 <_Unwind_Resume>
    80005f3c:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80005f40:	00090513          	mv	a0,s2
    80005f44:	ffffc097          	auipc	ra,0xffffc
    80005f48:	7ac080e7          	jalr	1964(ra) # 800026f0 <_ZdlPv>
    80005f4c:	00048513          	mv	a0,s1
    80005f50:	00007097          	auipc	ra,0x7
    80005f54:	e48080e7          	jalr	-440(ra) # 8000cd98 <_Unwind_Resume>

0000000080005f58 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80005f58:	fe010113          	addi	sp,sp,-32
    80005f5c:	00113c23          	sd	ra,24(sp)
    80005f60:	00813823          	sd	s0,16(sp)
    80005f64:	00913423          	sd	s1,8(sp)
    80005f68:	01213023          	sd	s2,0(sp)
    80005f6c:	02010413          	addi	s0,sp,32
    80005f70:	00050493          	mv	s1,a0
    80005f74:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80005f78:	01853503          	ld	a0,24(a0)
    80005f7c:	ffffd097          	auipc	ra,0xffffd
    80005f80:	aa0080e7          	jalr	-1376(ra) # 80002a1c <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80005f84:	0304b503          	ld	a0,48(s1)
    80005f88:	ffffd097          	auipc	ra,0xffffd
    80005f8c:	a94080e7          	jalr	-1388(ra) # 80002a1c <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80005f90:	0084b783          	ld	a5,8(s1)
    80005f94:	0144a703          	lw	a4,20(s1)
    80005f98:	00271713          	slli	a4,a4,0x2
    80005f9c:	00e787b3          	add	a5,a5,a4
    80005fa0:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80005fa4:	0144a783          	lw	a5,20(s1)
    80005fa8:	0017879b          	addiw	a5,a5,1
    80005fac:	0004a703          	lw	a4,0(s1)
    80005fb0:	02e7e7bb          	remw	a5,a5,a4
    80005fb4:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80005fb8:	0304b503          	ld	a0,48(s1)
    80005fbc:	ffffd097          	auipc	ra,0xffffd
    80005fc0:	a8c080e7          	jalr	-1396(ra) # 80002a48 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80005fc4:	0204b503          	ld	a0,32(s1)
    80005fc8:	ffffd097          	auipc	ra,0xffffd
    80005fcc:	a80080e7          	jalr	-1408(ra) # 80002a48 <_ZN9Semaphore6signalEv>

}
    80005fd0:	01813083          	ld	ra,24(sp)
    80005fd4:	01013403          	ld	s0,16(sp)
    80005fd8:	00813483          	ld	s1,8(sp)
    80005fdc:	00013903          	ld	s2,0(sp)
    80005fe0:	02010113          	addi	sp,sp,32
    80005fe4:	00008067          	ret

0000000080005fe8 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80005fe8:	fe010113          	addi	sp,sp,-32
    80005fec:	00113c23          	sd	ra,24(sp)
    80005ff0:	00813823          	sd	s0,16(sp)
    80005ff4:	00913423          	sd	s1,8(sp)
    80005ff8:	01213023          	sd	s2,0(sp)
    80005ffc:	02010413          	addi	s0,sp,32
    80006000:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80006004:	02053503          	ld	a0,32(a0)
    80006008:	ffffd097          	auipc	ra,0xffffd
    8000600c:	a14080e7          	jalr	-1516(ra) # 80002a1c <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80006010:	0284b503          	ld	a0,40(s1)
    80006014:	ffffd097          	auipc	ra,0xffffd
    80006018:	a08080e7          	jalr	-1528(ra) # 80002a1c <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    8000601c:	0084b703          	ld	a4,8(s1)
    80006020:	0104a783          	lw	a5,16(s1)
    80006024:	00279693          	slli	a3,a5,0x2
    80006028:	00d70733          	add	a4,a4,a3
    8000602c:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006030:	0017879b          	addiw	a5,a5,1
    80006034:	0004a703          	lw	a4,0(s1)
    80006038:	02e7e7bb          	remw	a5,a5,a4
    8000603c:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80006040:	0284b503          	ld	a0,40(s1)
    80006044:	ffffd097          	auipc	ra,0xffffd
    80006048:	a04080e7          	jalr	-1532(ra) # 80002a48 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    8000604c:	0184b503          	ld	a0,24(s1)
    80006050:	ffffd097          	auipc	ra,0xffffd
    80006054:	9f8080e7          	jalr	-1544(ra) # 80002a48 <_ZN9Semaphore6signalEv>

    return ret;
}
    80006058:	00090513          	mv	a0,s2
    8000605c:	01813083          	ld	ra,24(sp)
    80006060:	01013403          	ld	s0,16(sp)
    80006064:	00813483          	ld	s1,8(sp)
    80006068:	00013903          	ld	s2,0(sp)
    8000606c:	02010113          	addi	sp,sp,32
    80006070:	00008067          	ret

0000000080006074 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80006074:	fe010113          	addi	sp,sp,-32
    80006078:	00113c23          	sd	ra,24(sp)
    8000607c:	00813823          	sd	s0,16(sp)
    80006080:	00913423          	sd	s1,8(sp)
    80006084:	01213023          	sd	s2,0(sp)
    80006088:	02010413          	addi	s0,sp,32
    8000608c:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80006090:	02853503          	ld	a0,40(a0)
    80006094:	ffffd097          	auipc	ra,0xffffd
    80006098:	988080e7          	jalr	-1656(ra) # 80002a1c <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    8000609c:	0304b503          	ld	a0,48(s1)
    800060a0:	ffffd097          	auipc	ra,0xffffd
    800060a4:	97c080e7          	jalr	-1668(ra) # 80002a1c <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    800060a8:	0144a783          	lw	a5,20(s1)
    800060ac:	0104a903          	lw	s2,16(s1)
    800060b0:	0327ce63          	blt	a5,s2,800060ec <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    800060b4:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    800060b8:	0304b503          	ld	a0,48(s1)
    800060bc:	ffffd097          	auipc	ra,0xffffd
    800060c0:	98c080e7          	jalr	-1652(ra) # 80002a48 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    800060c4:	0284b503          	ld	a0,40(s1)
    800060c8:	ffffd097          	auipc	ra,0xffffd
    800060cc:	980080e7          	jalr	-1664(ra) # 80002a48 <_ZN9Semaphore6signalEv>

    return ret;
}
    800060d0:	00090513          	mv	a0,s2
    800060d4:	01813083          	ld	ra,24(sp)
    800060d8:	01013403          	ld	s0,16(sp)
    800060dc:	00813483          	ld	s1,8(sp)
    800060e0:	00013903          	ld	s2,0(sp)
    800060e4:	02010113          	addi	sp,sp,32
    800060e8:	00008067          	ret
        ret = cap - head + tail;
    800060ec:	0004a703          	lw	a4,0(s1)
    800060f0:	4127093b          	subw	s2,a4,s2
    800060f4:	00f9093b          	addw	s2,s2,a5
    800060f8:	fc1ff06f          	j	800060b8 <_ZN9BufferCPP6getCntEv+0x44>

00000000800060fc <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    800060fc:	fe010113          	addi	sp,sp,-32
    80006100:	00113c23          	sd	ra,24(sp)
    80006104:	00813823          	sd	s0,16(sp)
    80006108:	00913423          	sd	s1,8(sp)
    8000610c:	02010413          	addi	s0,sp,32
    80006110:	00050493          	mv	s1,a0
    Console::putc('\n');
    80006114:	00a00513          	li	a0,10
    80006118:	ffffd097          	auipc	ra,0xffffd
    8000611c:	9f8080e7          	jalr	-1544(ra) # 80002b10 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80006120:	00003517          	auipc	a0,0x3
    80006124:	2f050513          	addi	a0,a0,752 # 80009410 <CONSOLE_STATUS+0x400>
    80006128:	00000097          	auipc	ra,0x0
    8000612c:	a0c080e7          	jalr	-1524(ra) # 80005b34 <_Z11printStringPKc>
    while (getCnt()) {
    80006130:	00048513          	mv	a0,s1
    80006134:	00000097          	auipc	ra,0x0
    80006138:	f40080e7          	jalr	-192(ra) # 80006074 <_ZN9BufferCPP6getCntEv>
    8000613c:	02050c63          	beqz	a0,80006174 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80006140:	0084b783          	ld	a5,8(s1)
    80006144:	0104a703          	lw	a4,16(s1)
    80006148:	00271713          	slli	a4,a4,0x2
    8000614c:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80006150:	0007c503          	lbu	a0,0(a5)
    80006154:	ffffd097          	auipc	ra,0xffffd
    80006158:	9bc080e7          	jalr	-1604(ra) # 80002b10 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    8000615c:	0104a783          	lw	a5,16(s1)
    80006160:	0017879b          	addiw	a5,a5,1
    80006164:	0004a703          	lw	a4,0(s1)
    80006168:	02e7e7bb          	remw	a5,a5,a4
    8000616c:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80006170:	fc1ff06f          	j	80006130 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80006174:	02100513          	li	a0,33
    80006178:	ffffd097          	auipc	ra,0xffffd
    8000617c:	998080e7          	jalr	-1640(ra) # 80002b10 <_ZN7Console4putcEc>
    Console::putc('\n');
    80006180:	00a00513          	li	a0,10
    80006184:	ffffd097          	auipc	ra,0xffffd
    80006188:	98c080e7          	jalr	-1652(ra) # 80002b10 <_ZN7Console4putcEc>
    mem_free(buffer);
    8000618c:	0084b503          	ld	a0,8(s1)
    80006190:	ffffb097          	auipc	ra,0xffffb
    80006194:	1c0080e7          	jalr	448(ra) # 80001350 <_Z8mem_freePv>
    delete itemAvailable;
    80006198:	0204b503          	ld	a0,32(s1)
    8000619c:	00050863          	beqz	a0,800061ac <_ZN9BufferCPPD1Ev+0xb0>
    800061a0:	00053783          	ld	a5,0(a0)
    800061a4:	0087b783          	ld	a5,8(a5)
    800061a8:	000780e7          	jalr	a5
    delete spaceAvailable;
    800061ac:	0184b503          	ld	a0,24(s1)
    800061b0:	00050863          	beqz	a0,800061c0 <_ZN9BufferCPPD1Ev+0xc4>
    800061b4:	00053783          	ld	a5,0(a0)
    800061b8:	0087b783          	ld	a5,8(a5)
    800061bc:	000780e7          	jalr	a5
    delete mutexTail;
    800061c0:	0304b503          	ld	a0,48(s1)
    800061c4:	00050863          	beqz	a0,800061d4 <_ZN9BufferCPPD1Ev+0xd8>
    800061c8:	00053783          	ld	a5,0(a0)
    800061cc:	0087b783          	ld	a5,8(a5)
    800061d0:	000780e7          	jalr	a5
    delete mutexHead;
    800061d4:	0284b503          	ld	a0,40(s1)
    800061d8:	00050863          	beqz	a0,800061e8 <_ZN9BufferCPPD1Ev+0xec>
    800061dc:	00053783          	ld	a5,0(a0)
    800061e0:	0087b783          	ld	a5,8(a5)
    800061e4:	000780e7          	jalr	a5
}
    800061e8:	01813083          	ld	ra,24(sp)
    800061ec:	01013403          	ld	s0,16(sp)
    800061f0:	00813483          	ld	s1,8(sp)
    800061f4:	02010113          	addi	sp,sp,32
    800061f8:	00008067          	ret

00000000800061fc <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    800061fc:	fe010113          	addi	sp,sp,-32
    80006200:	00113c23          	sd	ra,24(sp)
    80006204:	00813823          	sd	s0,16(sp)
    80006208:	00913423          	sd	s1,8(sp)
    8000620c:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80006210:	00003517          	auipc	a0,0x3
    80006214:	21850513          	addi	a0,a0,536 # 80009428 <CONSOLE_STATUS+0x418>
    80006218:	00000097          	auipc	ra,0x0
    8000621c:	91c080e7          	jalr	-1764(ra) # 80005b34 <_Z11printStringPKc>
    int test = getc() - '0';
    80006220:	ffffb097          	auipc	ra,0xffffb
    80006224:	348080e7          	jalr	840(ra) # 80001568 <_Z4getcv>
    80006228:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    8000622c:	ffffb097          	auipc	ra,0xffffb
    80006230:	33c080e7          	jalr	828(ra) # 80001568 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80006234:	00700793          	li	a5,7
    80006238:	1097e263          	bltu	a5,s1,8000633c <_Z8userMainv+0x140>
    8000623c:	00249493          	slli	s1,s1,0x2
    80006240:	00003717          	auipc	a4,0x3
    80006244:	44070713          	addi	a4,a4,1088 # 80009680 <CONSOLE_STATUS+0x670>
    80006248:	00e484b3          	add	s1,s1,a4
    8000624c:	0004a783          	lw	a5,0(s1)
    80006250:	00e787b3          	add	a5,a5,a4
    80006254:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    80006258:	fffff097          	auipc	ra,0xfffff
    8000625c:	f54080e7          	jalr	-172(ra) # 800051ac <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80006260:	00003517          	auipc	a0,0x3
    80006264:	1e850513          	addi	a0,a0,488 # 80009448 <CONSOLE_STATUS+0x438>
    80006268:	00000097          	auipc	ra,0x0
    8000626c:	8cc080e7          	jalr	-1844(ra) # 80005b34 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80006270:	01813083          	ld	ra,24(sp)
    80006274:	01013403          	ld	s0,16(sp)
    80006278:	00813483          	ld	s1,8(sp)
    8000627c:	02010113          	addi	sp,sp,32
    80006280:	00008067          	ret
            Threads_CPP_API_test();
    80006284:	ffffe097          	auipc	ra,0xffffe
    80006288:	e08080e7          	jalr	-504(ra) # 8000408c <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    8000628c:	00003517          	auipc	a0,0x3
    80006290:	1fc50513          	addi	a0,a0,508 # 80009488 <CONSOLE_STATUS+0x478>
    80006294:	00000097          	auipc	ra,0x0
    80006298:	8a0080e7          	jalr	-1888(ra) # 80005b34 <_Z11printStringPKc>
            break;
    8000629c:	fd5ff06f          	j	80006270 <_Z8userMainv+0x74>
            producerConsumer_C_API();
    800062a0:	ffffd097          	auipc	ra,0xffffd
    800062a4:	640080e7          	jalr	1600(ra) # 800038e0 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    800062a8:	00003517          	auipc	a0,0x3
    800062ac:	22050513          	addi	a0,a0,544 # 800094c8 <CONSOLE_STATUS+0x4b8>
    800062b0:	00000097          	auipc	ra,0x0
    800062b4:	884080e7          	jalr	-1916(ra) # 80005b34 <_Z11printStringPKc>
            break;
    800062b8:	fb9ff06f          	j	80006270 <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    800062bc:	fffff097          	auipc	ra,0xfffff
    800062c0:	234080e7          	jalr	564(ra) # 800054f0 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    800062c4:	00003517          	auipc	a0,0x3
    800062c8:	25450513          	addi	a0,a0,596 # 80009518 <CONSOLE_STATUS+0x508>
    800062cc:	00000097          	auipc	ra,0x0
    800062d0:	868080e7          	jalr	-1944(ra) # 80005b34 <_Z11printStringPKc>
            break;
    800062d4:	f9dff06f          	j	80006270 <_Z8userMainv+0x74>
            testSleeping();
    800062d8:	00000097          	auipc	ra,0x0
    800062dc:	11c080e7          	jalr	284(ra) # 800063f4 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    800062e0:	00003517          	auipc	a0,0x3
    800062e4:	29050513          	addi	a0,a0,656 # 80009570 <CONSOLE_STATUS+0x560>
    800062e8:	00000097          	auipc	ra,0x0
    800062ec:	84c080e7          	jalr	-1972(ra) # 80005b34 <_Z11printStringPKc>
            break;
    800062f0:	f81ff06f          	j	80006270 <_Z8userMainv+0x74>
            testConsumerProducer();
    800062f4:	ffffe097          	auipc	ra,0xffffe
    800062f8:	258080e7          	jalr	600(ra) # 8000454c <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    800062fc:	00003517          	auipc	a0,0x3
    80006300:	2a450513          	addi	a0,a0,676 # 800095a0 <CONSOLE_STATUS+0x590>
    80006304:	00000097          	auipc	ra,0x0
    80006308:	830080e7          	jalr	-2000(ra) # 80005b34 <_Z11printStringPKc>
            break;
    8000630c:	f65ff06f          	j	80006270 <_Z8userMainv+0x74>
            System_Mode_test();
    80006310:	00000097          	auipc	ra,0x0
    80006314:	658080e7          	jalr	1624(ra) # 80006968 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80006318:	00003517          	auipc	a0,0x3
    8000631c:	2c850513          	addi	a0,a0,712 # 800095e0 <CONSOLE_STATUS+0x5d0>
    80006320:	00000097          	auipc	ra,0x0
    80006324:	814080e7          	jalr	-2028(ra) # 80005b34 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80006328:	00003517          	auipc	a0,0x3
    8000632c:	2d850513          	addi	a0,a0,728 # 80009600 <CONSOLE_STATUS+0x5f0>
    80006330:	00000097          	auipc	ra,0x0
    80006334:	804080e7          	jalr	-2044(ra) # 80005b34 <_Z11printStringPKc>
            break;
    80006338:	f39ff06f          	j	80006270 <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    8000633c:	00003517          	auipc	a0,0x3
    80006340:	31c50513          	addi	a0,a0,796 # 80009658 <CONSOLE_STATUS+0x648>
    80006344:	fffff097          	auipc	ra,0xfffff
    80006348:	7f0080e7          	jalr	2032(ra) # 80005b34 <_Z11printStringPKc>
    8000634c:	f25ff06f          	j	80006270 <_Z8userMainv+0x74>

0000000080006350 <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    80006350:	fe010113          	addi	sp,sp,-32
    80006354:	00113c23          	sd	ra,24(sp)
    80006358:	00813823          	sd	s0,16(sp)
    8000635c:	00913423          	sd	s1,8(sp)
    80006360:	01213023          	sd	s2,0(sp)
    80006364:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    80006368:	00053903          	ld	s2,0(a0)
    int i = 6;
    8000636c:	00600493          	li	s1,6
    while (--i > 0) {
    80006370:	fff4849b          	addiw	s1,s1,-1
    80006374:	04905463          	blez	s1,800063bc <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    80006378:	00003517          	auipc	a0,0x3
    8000637c:	32850513          	addi	a0,a0,808 # 800096a0 <CONSOLE_STATUS+0x690>
    80006380:	fffff097          	auipc	ra,0xfffff
    80006384:	7b4080e7          	jalr	1972(ra) # 80005b34 <_Z11printStringPKc>
        printInt(sleep_time);
    80006388:	00000613          	li	a2,0
    8000638c:	00a00593          	li	a1,10
    80006390:	0009051b          	sext.w	a0,s2
    80006394:	00000097          	auipc	ra,0x0
    80006398:	950080e7          	jalr	-1712(ra) # 80005ce4 <_Z8printIntiii>
        printString(" !\n");
    8000639c:	00003517          	auipc	a0,0x3
    800063a0:	30c50513          	addi	a0,a0,780 # 800096a8 <CONSOLE_STATUS+0x698>
    800063a4:	fffff097          	auipc	ra,0xfffff
    800063a8:	790080e7          	jalr	1936(ra) # 80005b34 <_Z11printStringPKc>
        time_sleep(sleep_time);
    800063ac:	00090513          	mv	a0,s2
    800063b0:	ffffb097          	auipc	ra,0xffffb
    800063b4:	0c0080e7          	jalr	192(ra) # 80001470 <_Z10time_sleepm>
    while (--i > 0) {
    800063b8:	fb9ff06f          	j	80006370 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    800063bc:	00a00793          	li	a5,10
    800063c0:	02f95933          	divu	s2,s2,a5
    800063c4:	fff90913          	addi	s2,s2,-1
    800063c8:	00006797          	auipc	a5,0x6
    800063cc:	8f878793          	addi	a5,a5,-1800 # 8000bcc0 <_ZL8finished>
    800063d0:	01278933          	add	s2,a5,s2
    800063d4:	00100793          	li	a5,1
    800063d8:	00f90023          	sb	a5,0(s2)
}
    800063dc:	01813083          	ld	ra,24(sp)
    800063e0:	01013403          	ld	s0,16(sp)
    800063e4:	00813483          	ld	s1,8(sp)
    800063e8:	00013903          	ld	s2,0(sp)
    800063ec:	02010113          	addi	sp,sp,32
    800063f0:	00008067          	ret

00000000800063f4 <_Z12testSleepingv>:

void testSleeping() {
    800063f4:	fc010113          	addi	sp,sp,-64
    800063f8:	02113c23          	sd	ra,56(sp)
    800063fc:	02813823          	sd	s0,48(sp)
    80006400:	02913423          	sd	s1,40(sp)
    80006404:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    80006408:	00a00793          	li	a5,10
    8000640c:	fcf43823          	sd	a5,-48(s0)
    80006410:	01400793          	li	a5,20
    80006414:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    80006418:	00000493          	li	s1,0
    8000641c:	02c0006f          	j	80006448 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    80006420:	00349793          	slli	a5,s1,0x3
    80006424:	fd040613          	addi	a2,s0,-48
    80006428:	00f60633          	add	a2,a2,a5
    8000642c:	00000597          	auipc	a1,0x0
    80006430:	f2458593          	addi	a1,a1,-220 # 80006350 <_ZL9sleepyRunPv>
    80006434:	fc040513          	addi	a0,s0,-64
    80006438:	00f50533          	add	a0,a0,a5
    8000643c:	ffffb097          	auipc	ra,0xffffb
    80006440:	f44080e7          	jalr	-188(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80006444:	0014849b          	addiw	s1,s1,1
    80006448:	00100793          	li	a5,1
    8000644c:	fc97dae3          	bge	a5,s1,80006420 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    80006450:	00006797          	auipc	a5,0x6
    80006454:	8707c783          	lbu	a5,-1936(a5) # 8000bcc0 <_ZL8finished>
    80006458:	fe078ce3          	beqz	a5,80006450 <_Z12testSleepingv+0x5c>
    8000645c:	00006797          	auipc	a5,0x6
    80006460:	8657c783          	lbu	a5,-1947(a5) # 8000bcc1 <_ZL8finished+0x1>
    80006464:	fe0786e3          	beqz	a5,80006450 <_Z12testSleepingv+0x5c>
}
    80006468:	03813083          	ld	ra,56(sp)
    8000646c:	03013403          	ld	s0,48(sp)
    80006470:	02813483          	ld	s1,40(sp)
    80006474:	04010113          	addi	sp,sp,64
    80006478:	00008067          	ret

000000008000647c <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    8000647c:	fe010113          	addi	sp,sp,-32
    80006480:	00113c23          	sd	ra,24(sp)
    80006484:	00813823          	sd	s0,16(sp)
    80006488:	00913423          	sd	s1,8(sp)
    8000648c:	01213023          	sd	s2,0(sp)
    80006490:	02010413          	addi	s0,sp,32
    80006494:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80006498:	00100793          	li	a5,1
    8000649c:	02a7f863          	bgeu	a5,a0,800064cc <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800064a0:	00a00793          	li	a5,10
    800064a4:	02f577b3          	remu	a5,a0,a5
    800064a8:	02078e63          	beqz	a5,800064e4 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800064ac:	fff48513          	addi	a0,s1,-1
    800064b0:	00000097          	auipc	ra,0x0
    800064b4:	fcc080e7          	jalr	-52(ra) # 8000647c <_ZL9fibonaccim>
    800064b8:	00050913          	mv	s2,a0
    800064bc:	ffe48513          	addi	a0,s1,-2
    800064c0:	00000097          	auipc	ra,0x0
    800064c4:	fbc080e7          	jalr	-68(ra) # 8000647c <_ZL9fibonaccim>
    800064c8:	00a90533          	add	a0,s2,a0
}
    800064cc:	01813083          	ld	ra,24(sp)
    800064d0:	01013403          	ld	s0,16(sp)
    800064d4:	00813483          	ld	s1,8(sp)
    800064d8:	00013903          	ld	s2,0(sp)
    800064dc:	02010113          	addi	sp,sp,32
    800064e0:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800064e4:	ffffb097          	auipc	ra,0xffffb
    800064e8:	f44080e7          	jalr	-188(ra) # 80001428 <_Z15thread_dispatchv>
    800064ec:	fc1ff06f          	j	800064ac <_ZL9fibonaccim+0x30>

00000000800064f0 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    800064f0:	fe010113          	addi	sp,sp,-32
    800064f4:	00113c23          	sd	ra,24(sp)
    800064f8:	00813823          	sd	s0,16(sp)
    800064fc:	00913423          	sd	s1,8(sp)
    80006500:	01213023          	sd	s2,0(sp)
    80006504:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80006508:	00a00493          	li	s1,10
    8000650c:	0400006f          	j	8000654c <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006510:	00003517          	auipc	a0,0x3
    80006514:	e6850513          	addi	a0,a0,-408 # 80009378 <CONSOLE_STATUS+0x368>
    80006518:	fffff097          	auipc	ra,0xfffff
    8000651c:	61c080e7          	jalr	1564(ra) # 80005b34 <_Z11printStringPKc>
    80006520:	00000613          	li	a2,0
    80006524:	00a00593          	li	a1,10
    80006528:	00048513          	mv	a0,s1
    8000652c:	fffff097          	auipc	ra,0xfffff
    80006530:	7b8080e7          	jalr	1976(ra) # 80005ce4 <_Z8printIntiii>
    80006534:	00003517          	auipc	a0,0x3
    80006538:	03450513          	addi	a0,a0,52 # 80009568 <CONSOLE_STATUS+0x558>
    8000653c:	fffff097          	auipc	ra,0xfffff
    80006540:	5f8080e7          	jalr	1528(ra) # 80005b34 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80006544:	0014849b          	addiw	s1,s1,1
    80006548:	0ff4f493          	andi	s1,s1,255
    8000654c:	00c00793          	li	a5,12
    80006550:	fc97f0e3          	bgeu	a5,s1,80006510 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80006554:	00003517          	auipc	a0,0x3
    80006558:	e2c50513          	addi	a0,a0,-468 # 80009380 <CONSOLE_STATUS+0x370>
    8000655c:	fffff097          	auipc	ra,0xfffff
    80006560:	5d8080e7          	jalr	1496(ra) # 80005b34 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80006564:	00500313          	li	t1,5
    thread_dispatch();
    80006568:	ffffb097          	auipc	ra,0xffffb
    8000656c:	ec0080e7          	jalr	-320(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80006570:	01000513          	li	a0,16
    80006574:	00000097          	auipc	ra,0x0
    80006578:	f08080e7          	jalr	-248(ra) # 8000647c <_ZL9fibonaccim>
    8000657c:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80006580:	00003517          	auipc	a0,0x3
    80006584:	e1050513          	addi	a0,a0,-496 # 80009390 <CONSOLE_STATUS+0x380>
    80006588:	fffff097          	auipc	ra,0xfffff
    8000658c:	5ac080e7          	jalr	1452(ra) # 80005b34 <_Z11printStringPKc>
    80006590:	00000613          	li	a2,0
    80006594:	00a00593          	li	a1,10
    80006598:	0009051b          	sext.w	a0,s2
    8000659c:	fffff097          	auipc	ra,0xfffff
    800065a0:	748080e7          	jalr	1864(ra) # 80005ce4 <_Z8printIntiii>
    800065a4:	00003517          	auipc	a0,0x3
    800065a8:	fc450513          	addi	a0,a0,-60 # 80009568 <CONSOLE_STATUS+0x558>
    800065ac:	fffff097          	auipc	ra,0xfffff
    800065b0:	588080e7          	jalr	1416(ra) # 80005b34 <_Z11printStringPKc>
    800065b4:	0400006f          	j	800065f4 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800065b8:	00003517          	auipc	a0,0x3
    800065bc:	dc050513          	addi	a0,a0,-576 # 80009378 <CONSOLE_STATUS+0x368>
    800065c0:	fffff097          	auipc	ra,0xfffff
    800065c4:	574080e7          	jalr	1396(ra) # 80005b34 <_Z11printStringPKc>
    800065c8:	00000613          	li	a2,0
    800065cc:	00a00593          	li	a1,10
    800065d0:	00048513          	mv	a0,s1
    800065d4:	fffff097          	auipc	ra,0xfffff
    800065d8:	710080e7          	jalr	1808(ra) # 80005ce4 <_Z8printIntiii>
    800065dc:	00003517          	auipc	a0,0x3
    800065e0:	f8c50513          	addi	a0,a0,-116 # 80009568 <CONSOLE_STATUS+0x558>
    800065e4:	fffff097          	auipc	ra,0xfffff
    800065e8:	550080e7          	jalr	1360(ra) # 80005b34 <_Z11printStringPKc>
    for (; i < 16; i++) {
    800065ec:	0014849b          	addiw	s1,s1,1
    800065f0:	0ff4f493          	andi	s1,s1,255
    800065f4:	00f00793          	li	a5,15
    800065f8:	fc97f0e3          	bgeu	a5,s1,800065b8 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    800065fc:	00003517          	auipc	a0,0x3
    80006600:	da450513          	addi	a0,a0,-604 # 800093a0 <CONSOLE_STATUS+0x390>
    80006604:	fffff097          	auipc	ra,0xfffff
    80006608:	530080e7          	jalr	1328(ra) # 80005b34 <_Z11printStringPKc>
    finishedD = true;
    8000660c:	00100793          	li	a5,1
    80006610:	00005717          	auipc	a4,0x5
    80006614:	6af70923          	sb	a5,1714(a4) # 8000bcc2 <_ZL9finishedD>
    thread_dispatch();
    80006618:	ffffb097          	auipc	ra,0xffffb
    8000661c:	e10080e7          	jalr	-496(ra) # 80001428 <_Z15thread_dispatchv>
}
    80006620:	01813083          	ld	ra,24(sp)
    80006624:	01013403          	ld	s0,16(sp)
    80006628:	00813483          	ld	s1,8(sp)
    8000662c:	00013903          	ld	s2,0(sp)
    80006630:	02010113          	addi	sp,sp,32
    80006634:	00008067          	ret

0000000080006638 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80006638:	fe010113          	addi	sp,sp,-32
    8000663c:	00113c23          	sd	ra,24(sp)
    80006640:	00813823          	sd	s0,16(sp)
    80006644:	00913423          	sd	s1,8(sp)
    80006648:	01213023          	sd	s2,0(sp)
    8000664c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80006650:	00000493          	li	s1,0
    80006654:	0400006f          	j	80006694 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80006658:	00003517          	auipc	a0,0x3
    8000665c:	ce050513          	addi	a0,a0,-800 # 80009338 <CONSOLE_STATUS+0x328>
    80006660:	fffff097          	auipc	ra,0xfffff
    80006664:	4d4080e7          	jalr	1236(ra) # 80005b34 <_Z11printStringPKc>
    80006668:	00000613          	li	a2,0
    8000666c:	00a00593          	li	a1,10
    80006670:	00048513          	mv	a0,s1
    80006674:	fffff097          	auipc	ra,0xfffff
    80006678:	670080e7          	jalr	1648(ra) # 80005ce4 <_Z8printIntiii>
    8000667c:	00003517          	auipc	a0,0x3
    80006680:	eec50513          	addi	a0,a0,-276 # 80009568 <CONSOLE_STATUS+0x558>
    80006684:	fffff097          	auipc	ra,0xfffff
    80006688:	4b0080e7          	jalr	1200(ra) # 80005b34 <_Z11printStringPKc>
    for (; i < 3; i++) {
    8000668c:	0014849b          	addiw	s1,s1,1
    80006690:	0ff4f493          	andi	s1,s1,255
    80006694:	00200793          	li	a5,2
    80006698:	fc97f0e3          	bgeu	a5,s1,80006658 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    8000669c:	00003517          	auipc	a0,0x3
    800066a0:	ca450513          	addi	a0,a0,-860 # 80009340 <CONSOLE_STATUS+0x330>
    800066a4:	fffff097          	auipc	ra,0xfffff
    800066a8:	490080e7          	jalr	1168(ra) # 80005b34 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800066ac:	00700313          	li	t1,7
    thread_dispatch();
    800066b0:	ffffb097          	auipc	ra,0xffffb
    800066b4:	d78080e7          	jalr	-648(ra) # 80001428 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800066b8:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    800066bc:	00003517          	auipc	a0,0x3
    800066c0:	c9450513          	addi	a0,a0,-876 # 80009350 <CONSOLE_STATUS+0x340>
    800066c4:	fffff097          	auipc	ra,0xfffff
    800066c8:	470080e7          	jalr	1136(ra) # 80005b34 <_Z11printStringPKc>
    800066cc:	00000613          	li	a2,0
    800066d0:	00a00593          	li	a1,10
    800066d4:	0009051b          	sext.w	a0,s2
    800066d8:	fffff097          	auipc	ra,0xfffff
    800066dc:	60c080e7          	jalr	1548(ra) # 80005ce4 <_Z8printIntiii>
    800066e0:	00003517          	auipc	a0,0x3
    800066e4:	e8850513          	addi	a0,a0,-376 # 80009568 <CONSOLE_STATUS+0x558>
    800066e8:	fffff097          	auipc	ra,0xfffff
    800066ec:	44c080e7          	jalr	1100(ra) # 80005b34 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    800066f0:	00c00513          	li	a0,12
    800066f4:	00000097          	auipc	ra,0x0
    800066f8:	d88080e7          	jalr	-632(ra) # 8000647c <_ZL9fibonaccim>
    800066fc:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006700:	00003517          	auipc	a0,0x3
    80006704:	c5850513          	addi	a0,a0,-936 # 80009358 <CONSOLE_STATUS+0x348>
    80006708:	fffff097          	auipc	ra,0xfffff
    8000670c:	42c080e7          	jalr	1068(ra) # 80005b34 <_Z11printStringPKc>
    80006710:	00000613          	li	a2,0
    80006714:	00a00593          	li	a1,10
    80006718:	0009051b          	sext.w	a0,s2
    8000671c:	fffff097          	auipc	ra,0xfffff
    80006720:	5c8080e7          	jalr	1480(ra) # 80005ce4 <_Z8printIntiii>
    80006724:	00003517          	auipc	a0,0x3
    80006728:	e4450513          	addi	a0,a0,-444 # 80009568 <CONSOLE_STATUS+0x558>
    8000672c:	fffff097          	auipc	ra,0xfffff
    80006730:	408080e7          	jalr	1032(ra) # 80005b34 <_Z11printStringPKc>
    80006734:	0400006f          	j	80006774 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80006738:	00003517          	auipc	a0,0x3
    8000673c:	c0050513          	addi	a0,a0,-1024 # 80009338 <CONSOLE_STATUS+0x328>
    80006740:	fffff097          	auipc	ra,0xfffff
    80006744:	3f4080e7          	jalr	1012(ra) # 80005b34 <_Z11printStringPKc>
    80006748:	00000613          	li	a2,0
    8000674c:	00a00593          	li	a1,10
    80006750:	00048513          	mv	a0,s1
    80006754:	fffff097          	auipc	ra,0xfffff
    80006758:	590080e7          	jalr	1424(ra) # 80005ce4 <_Z8printIntiii>
    8000675c:	00003517          	auipc	a0,0x3
    80006760:	e0c50513          	addi	a0,a0,-500 # 80009568 <CONSOLE_STATUS+0x558>
    80006764:	fffff097          	auipc	ra,0xfffff
    80006768:	3d0080e7          	jalr	976(ra) # 80005b34 <_Z11printStringPKc>
    for (; i < 6; i++) {
    8000676c:	0014849b          	addiw	s1,s1,1
    80006770:	0ff4f493          	andi	s1,s1,255
    80006774:	00500793          	li	a5,5
    80006778:	fc97f0e3          	bgeu	a5,s1,80006738 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    8000677c:	00003517          	auipc	a0,0x3
    80006780:	b9450513          	addi	a0,a0,-1132 # 80009310 <CONSOLE_STATUS+0x300>
    80006784:	fffff097          	auipc	ra,0xfffff
    80006788:	3b0080e7          	jalr	944(ra) # 80005b34 <_Z11printStringPKc>
    finishedC = true;
    8000678c:	00100793          	li	a5,1
    80006790:	00005717          	auipc	a4,0x5
    80006794:	52f709a3          	sb	a5,1331(a4) # 8000bcc3 <_ZL9finishedC>
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

00000000800067b8 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    800067b8:	fe010113          	addi	sp,sp,-32
    800067bc:	00113c23          	sd	ra,24(sp)
    800067c0:	00813823          	sd	s0,16(sp)
    800067c4:	00913423          	sd	s1,8(sp)
    800067c8:	01213023          	sd	s2,0(sp)
    800067cc:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800067d0:	00000913          	li	s2,0
    800067d4:	0400006f          	j	80006814 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    800067d8:	ffffb097          	auipc	ra,0xffffb
    800067dc:	c50080e7          	jalr	-944(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800067e0:	00148493          	addi	s1,s1,1
    800067e4:	000027b7          	lui	a5,0x2
    800067e8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800067ec:	0097ee63          	bltu	a5,s1,80006808 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800067f0:	00000713          	li	a4,0
    800067f4:	000077b7          	lui	a5,0x7
    800067f8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800067fc:	fce7eee3          	bltu	a5,a4,800067d8 <_ZL11workerBodyBPv+0x20>
    80006800:	00170713          	addi	a4,a4,1
    80006804:	ff1ff06f          	j	800067f4 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    80006808:	00a00793          	li	a5,10
    8000680c:	04f90663          	beq	s2,a5,80006858 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80006810:	00190913          	addi	s2,s2,1
    80006814:	00f00793          	li	a5,15
    80006818:	0527e463          	bltu	a5,s2,80006860 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    8000681c:	00003517          	auipc	a0,0x3
    80006820:	b0450513          	addi	a0,a0,-1276 # 80009320 <CONSOLE_STATUS+0x310>
    80006824:	fffff097          	auipc	ra,0xfffff
    80006828:	310080e7          	jalr	784(ra) # 80005b34 <_Z11printStringPKc>
    8000682c:	00000613          	li	a2,0
    80006830:	00a00593          	li	a1,10
    80006834:	0009051b          	sext.w	a0,s2
    80006838:	fffff097          	auipc	ra,0xfffff
    8000683c:	4ac080e7          	jalr	1196(ra) # 80005ce4 <_Z8printIntiii>
    80006840:	00003517          	auipc	a0,0x3
    80006844:	d2850513          	addi	a0,a0,-728 # 80009568 <CONSOLE_STATUS+0x558>
    80006848:	fffff097          	auipc	ra,0xfffff
    8000684c:	2ec080e7          	jalr	748(ra) # 80005b34 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006850:	00000493          	li	s1,0
    80006854:	f91ff06f          	j	800067e4 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    80006858:	14102ff3          	csrr	t6,sepc
    8000685c:	fb5ff06f          	j	80006810 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    80006860:	00003517          	auipc	a0,0x3
    80006864:	ac850513          	addi	a0,a0,-1336 # 80009328 <CONSOLE_STATUS+0x318>
    80006868:	fffff097          	auipc	ra,0xfffff
    8000686c:	2cc080e7          	jalr	716(ra) # 80005b34 <_Z11printStringPKc>
    finishedB = true;
    80006870:	00100793          	li	a5,1
    80006874:	00005717          	auipc	a4,0x5
    80006878:	44f70823          	sb	a5,1104(a4) # 8000bcc4 <_ZL9finishedB>
    thread_dispatch();
    8000687c:	ffffb097          	auipc	ra,0xffffb
    80006880:	bac080e7          	jalr	-1108(ra) # 80001428 <_Z15thread_dispatchv>
}
    80006884:	01813083          	ld	ra,24(sp)
    80006888:	01013403          	ld	s0,16(sp)
    8000688c:	00813483          	ld	s1,8(sp)
    80006890:	00013903          	ld	s2,0(sp)
    80006894:	02010113          	addi	sp,sp,32
    80006898:	00008067          	ret

000000008000689c <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    8000689c:	fe010113          	addi	sp,sp,-32
    800068a0:	00113c23          	sd	ra,24(sp)
    800068a4:	00813823          	sd	s0,16(sp)
    800068a8:	00913423          	sd	s1,8(sp)
    800068ac:	01213023          	sd	s2,0(sp)
    800068b0:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800068b4:	00000913          	li	s2,0
    800068b8:	0380006f          	j	800068f0 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    800068bc:	ffffb097          	auipc	ra,0xffffb
    800068c0:	b6c080e7          	jalr	-1172(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800068c4:	00148493          	addi	s1,s1,1
    800068c8:	000027b7          	lui	a5,0x2
    800068cc:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800068d0:	0097ee63          	bltu	a5,s1,800068ec <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800068d4:	00000713          	li	a4,0
    800068d8:	000077b7          	lui	a5,0x7
    800068dc:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800068e0:	fce7eee3          	bltu	a5,a4,800068bc <_ZL11workerBodyAPv+0x20>
    800068e4:	00170713          	addi	a4,a4,1
    800068e8:	ff1ff06f          	j	800068d8 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800068ec:	00190913          	addi	s2,s2,1
    800068f0:	00900793          	li	a5,9
    800068f4:	0527e063          	bltu	a5,s2,80006934 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800068f8:	00003517          	auipc	a0,0x3
    800068fc:	a1050513          	addi	a0,a0,-1520 # 80009308 <CONSOLE_STATUS+0x2f8>
    80006900:	fffff097          	auipc	ra,0xfffff
    80006904:	234080e7          	jalr	564(ra) # 80005b34 <_Z11printStringPKc>
    80006908:	00000613          	li	a2,0
    8000690c:	00a00593          	li	a1,10
    80006910:	0009051b          	sext.w	a0,s2
    80006914:	fffff097          	auipc	ra,0xfffff
    80006918:	3d0080e7          	jalr	976(ra) # 80005ce4 <_Z8printIntiii>
    8000691c:	00003517          	auipc	a0,0x3
    80006920:	c4c50513          	addi	a0,a0,-948 # 80009568 <CONSOLE_STATUS+0x558>
    80006924:	fffff097          	auipc	ra,0xfffff
    80006928:	210080e7          	jalr	528(ra) # 80005b34 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    8000692c:	00000493          	li	s1,0
    80006930:	f99ff06f          	j	800068c8 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80006934:	00003517          	auipc	a0,0x3
    80006938:	9dc50513          	addi	a0,a0,-1572 # 80009310 <CONSOLE_STATUS+0x300>
    8000693c:	fffff097          	auipc	ra,0xfffff
    80006940:	1f8080e7          	jalr	504(ra) # 80005b34 <_Z11printStringPKc>
    finishedA = true;
    80006944:	00100793          	li	a5,1
    80006948:	00005717          	auipc	a4,0x5
    8000694c:	36f70ea3          	sb	a5,893(a4) # 8000bcc5 <_ZL9finishedA>
}
    80006950:	01813083          	ld	ra,24(sp)
    80006954:	01013403          	ld	s0,16(sp)
    80006958:	00813483          	ld	s1,8(sp)
    8000695c:	00013903          	ld	s2,0(sp)
    80006960:	02010113          	addi	sp,sp,32
    80006964:	00008067          	ret

0000000080006968 <_Z16System_Mode_testv>:


void System_Mode_test() {
    80006968:	fd010113          	addi	sp,sp,-48
    8000696c:	02113423          	sd	ra,40(sp)
    80006970:	02813023          	sd	s0,32(sp)
    80006974:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80006978:	00000613          	li	a2,0
    8000697c:	00000597          	auipc	a1,0x0
    80006980:	f2058593          	addi	a1,a1,-224 # 8000689c <_ZL11workerBodyAPv>
    80006984:	fd040513          	addi	a0,s0,-48
    80006988:	ffffb097          	auipc	ra,0xffffb
    8000698c:	9f8080e7          	jalr	-1544(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80006990:	00003517          	auipc	a0,0x3
    80006994:	a2050513          	addi	a0,a0,-1504 # 800093b0 <CONSOLE_STATUS+0x3a0>
    80006998:	fffff097          	auipc	ra,0xfffff
    8000699c:	19c080e7          	jalr	412(ra) # 80005b34 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    800069a0:	00000613          	li	a2,0
    800069a4:	00000597          	auipc	a1,0x0
    800069a8:	e1458593          	addi	a1,a1,-492 # 800067b8 <_ZL11workerBodyBPv>
    800069ac:	fd840513          	addi	a0,s0,-40
    800069b0:	ffffb097          	auipc	ra,0xffffb
    800069b4:	9d0080e7          	jalr	-1584(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    800069b8:	00003517          	auipc	a0,0x3
    800069bc:	a1050513          	addi	a0,a0,-1520 # 800093c8 <CONSOLE_STATUS+0x3b8>
    800069c0:	fffff097          	auipc	ra,0xfffff
    800069c4:	174080e7          	jalr	372(ra) # 80005b34 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    800069c8:	00000613          	li	a2,0
    800069cc:	00000597          	auipc	a1,0x0
    800069d0:	c6c58593          	addi	a1,a1,-916 # 80006638 <_ZL11workerBodyCPv>
    800069d4:	fe040513          	addi	a0,s0,-32
    800069d8:	ffffb097          	auipc	ra,0xffffb
    800069dc:	9a8080e7          	jalr	-1624(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    800069e0:	00003517          	auipc	a0,0x3
    800069e4:	a0050513          	addi	a0,a0,-1536 # 800093e0 <CONSOLE_STATUS+0x3d0>
    800069e8:	fffff097          	auipc	ra,0xfffff
    800069ec:	14c080e7          	jalr	332(ra) # 80005b34 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    800069f0:	00000613          	li	a2,0
    800069f4:	00000597          	auipc	a1,0x0
    800069f8:	afc58593          	addi	a1,a1,-1284 # 800064f0 <_ZL11workerBodyDPv>
    800069fc:	fe840513          	addi	a0,s0,-24
    80006a00:	ffffb097          	auipc	ra,0xffffb
    80006a04:	980080e7          	jalr	-1664(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80006a08:	00003517          	auipc	a0,0x3
    80006a0c:	9f050513          	addi	a0,a0,-1552 # 800093f8 <CONSOLE_STATUS+0x3e8>
    80006a10:	fffff097          	auipc	ra,0xfffff
    80006a14:	124080e7          	jalr	292(ra) # 80005b34 <_Z11printStringPKc>
    80006a18:	00c0006f          	j	80006a24 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006a1c:	ffffb097          	auipc	ra,0xffffb
    80006a20:	a0c080e7          	jalr	-1524(ra) # 80001428 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006a24:	00005797          	auipc	a5,0x5
    80006a28:	2a17c783          	lbu	a5,673(a5) # 8000bcc5 <_ZL9finishedA>
    80006a2c:	fe0788e3          	beqz	a5,80006a1c <_Z16System_Mode_testv+0xb4>
    80006a30:	00005797          	auipc	a5,0x5
    80006a34:	2947c783          	lbu	a5,660(a5) # 8000bcc4 <_ZL9finishedB>
    80006a38:	fe0782e3          	beqz	a5,80006a1c <_Z16System_Mode_testv+0xb4>
    80006a3c:	00005797          	auipc	a5,0x5
    80006a40:	2877c783          	lbu	a5,647(a5) # 8000bcc3 <_ZL9finishedC>
    80006a44:	fc078ce3          	beqz	a5,80006a1c <_Z16System_Mode_testv+0xb4>
    80006a48:	00005797          	auipc	a5,0x5
    80006a4c:	27a7c783          	lbu	a5,634(a5) # 8000bcc2 <_ZL9finishedD>
    80006a50:	fc0786e3          	beqz	a5,80006a1c <_Z16System_Mode_testv+0xb4>
    }

}
    80006a54:	02813083          	ld	ra,40(sp)
    80006a58:	02013403          	ld	s0,32(sp)
    80006a5c:	03010113          	addi	sp,sp,48
    80006a60:	00008067          	ret

0000000080006a64 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006a64:	fe010113          	addi	sp,sp,-32
    80006a68:	00113c23          	sd	ra,24(sp)
    80006a6c:	00813823          	sd	s0,16(sp)
    80006a70:	00913423          	sd	s1,8(sp)
    80006a74:	01213023          	sd	s2,0(sp)
    80006a78:	02010413          	addi	s0,sp,32
    80006a7c:	00050493          	mv	s1,a0
    80006a80:	00058913          	mv	s2,a1
    80006a84:	0015879b          	addiw	a5,a1,1
    80006a88:	0007851b          	sext.w	a0,a5
    80006a8c:	00f4a023          	sw	a5,0(s1)
    80006a90:	0004a823          	sw	zero,16(s1)
    80006a94:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006a98:	00251513          	slli	a0,a0,0x2
    80006a9c:	ffffb097          	auipc	ra,0xffffb
    80006aa0:	874080e7          	jalr	-1932(ra) # 80001310 <_Z9mem_allocm>
    80006aa4:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80006aa8:	00000593          	li	a1,0
    80006aac:	02048513          	addi	a0,s1,32
    80006ab0:	ffffb097          	auipc	ra,0xffffb
    80006ab4:	9f0080e7          	jalr	-1552(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&spaceAvailable, _cap);
    80006ab8:	00090593          	mv	a1,s2
    80006abc:	01848513          	addi	a0,s1,24
    80006ac0:	ffffb097          	auipc	ra,0xffffb
    80006ac4:	9e0080e7          	jalr	-1568(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&mutexHead, 1);
    80006ac8:	00100593          	li	a1,1
    80006acc:	02848513          	addi	a0,s1,40
    80006ad0:	ffffb097          	auipc	ra,0xffffb
    80006ad4:	9d0080e7          	jalr	-1584(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&mutexTail, 1);
    80006ad8:	00100593          	li	a1,1
    80006adc:	03048513          	addi	a0,s1,48
    80006ae0:	ffffb097          	auipc	ra,0xffffb
    80006ae4:	9c0080e7          	jalr	-1600(ra) # 800014a0 <_Z8sem_openPP4KSemj>
}
    80006ae8:	01813083          	ld	ra,24(sp)
    80006aec:	01013403          	ld	s0,16(sp)
    80006af0:	00813483          	ld	s1,8(sp)
    80006af4:	00013903          	ld	s2,0(sp)
    80006af8:	02010113          	addi	sp,sp,32
    80006afc:	00008067          	ret

0000000080006b00 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80006b00:	fe010113          	addi	sp,sp,-32
    80006b04:	00113c23          	sd	ra,24(sp)
    80006b08:	00813823          	sd	s0,16(sp)
    80006b0c:	00913423          	sd	s1,8(sp)
    80006b10:	01213023          	sd	s2,0(sp)
    80006b14:	02010413          	addi	s0,sp,32
    80006b18:	00050493          	mv	s1,a0
    80006b1c:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80006b20:	01853503          	ld	a0,24(a0)
    80006b24:	ffffb097          	auipc	ra,0xffffb
    80006b28:	9e4080e7          	jalr	-1564(ra) # 80001508 <_Z8sem_waitP4KSem>

    sem_wait(mutexTail);
    80006b2c:	0304b503          	ld	a0,48(s1)
    80006b30:	ffffb097          	auipc	ra,0xffffb
    80006b34:	9d8080e7          	jalr	-1576(ra) # 80001508 <_Z8sem_waitP4KSem>
    buffer[tail] = val;
    80006b38:	0084b783          	ld	a5,8(s1)
    80006b3c:	0144a703          	lw	a4,20(s1)
    80006b40:	00271713          	slli	a4,a4,0x2
    80006b44:	00e787b3          	add	a5,a5,a4
    80006b48:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006b4c:	0144a783          	lw	a5,20(s1)
    80006b50:	0017879b          	addiw	a5,a5,1
    80006b54:	0004a703          	lw	a4,0(s1)
    80006b58:	02e7e7bb          	remw	a5,a5,a4
    80006b5c:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80006b60:	0304b503          	ld	a0,48(s1)
    80006b64:	ffffb097          	auipc	ra,0xffffb
    80006b68:	9d4080e7          	jalr	-1580(ra) # 80001538 <_Z10sem_signalP4KSem>

    sem_signal(itemAvailable);
    80006b6c:	0204b503          	ld	a0,32(s1)
    80006b70:	ffffb097          	auipc	ra,0xffffb
    80006b74:	9c8080e7          	jalr	-1592(ra) # 80001538 <_Z10sem_signalP4KSem>

}
    80006b78:	01813083          	ld	ra,24(sp)
    80006b7c:	01013403          	ld	s0,16(sp)
    80006b80:	00813483          	ld	s1,8(sp)
    80006b84:	00013903          	ld	s2,0(sp)
    80006b88:	02010113          	addi	sp,sp,32
    80006b8c:	00008067          	ret

0000000080006b90 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80006b90:	fe010113          	addi	sp,sp,-32
    80006b94:	00113c23          	sd	ra,24(sp)
    80006b98:	00813823          	sd	s0,16(sp)
    80006b9c:	00913423          	sd	s1,8(sp)
    80006ba0:	01213023          	sd	s2,0(sp)
    80006ba4:	02010413          	addi	s0,sp,32
    80006ba8:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80006bac:	02053503          	ld	a0,32(a0)
    80006bb0:	ffffb097          	auipc	ra,0xffffb
    80006bb4:	958080e7          	jalr	-1704(ra) # 80001508 <_Z8sem_waitP4KSem>

    sem_wait(mutexHead);
    80006bb8:	0284b503          	ld	a0,40(s1)
    80006bbc:	ffffb097          	auipc	ra,0xffffb
    80006bc0:	94c080e7          	jalr	-1716(ra) # 80001508 <_Z8sem_waitP4KSem>

    int ret = buffer[head];
    80006bc4:	0084b703          	ld	a4,8(s1)
    80006bc8:	0104a783          	lw	a5,16(s1)
    80006bcc:	00279693          	slli	a3,a5,0x2
    80006bd0:	00d70733          	add	a4,a4,a3
    80006bd4:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006bd8:	0017879b          	addiw	a5,a5,1
    80006bdc:	0004a703          	lw	a4,0(s1)
    80006be0:	02e7e7bb          	remw	a5,a5,a4
    80006be4:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80006be8:	0284b503          	ld	a0,40(s1)
    80006bec:	ffffb097          	auipc	ra,0xffffb
    80006bf0:	94c080e7          	jalr	-1716(ra) # 80001538 <_Z10sem_signalP4KSem>

    sem_signal(spaceAvailable);
    80006bf4:	0184b503          	ld	a0,24(s1)
    80006bf8:	ffffb097          	auipc	ra,0xffffb
    80006bfc:	940080e7          	jalr	-1728(ra) # 80001538 <_Z10sem_signalP4KSem>

    return ret;
}
    80006c00:	00090513          	mv	a0,s2
    80006c04:	01813083          	ld	ra,24(sp)
    80006c08:	01013403          	ld	s0,16(sp)
    80006c0c:	00813483          	ld	s1,8(sp)
    80006c10:	00013903          	ld	s2,0(sp)
    80006c14:	02010113          	addi	sp,sp,32
    80006c18:	00008067          	ret

0000000080006c1c <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80006c1c:	fe010113          	addi	sp,sp,-32
    80006c20:	00113c23          	sd	ra,24(sp)
    80006c24:	00813823          	sd	s0,16(sp)
    80006c28:	00913423          	sd	s1,8(sp)
    80006c2c:	01213023          	sd	s2,0(sp)
    80006c30:	02010413          	addi	s0,sp,32
    80006c34:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80006c38:	02853503          	ld	a0,40(a0)
    80006c3c:	ffffb097          	auipc	ra,0xffffb
    80006c40:	8cc080e7          	jalr	-1844(ra) # 80001508 <_Z8sem_waitP4KSem>
    sem_wait(mutexTail);
    80006c44:	0304b503          	ld	a0,48(s1)
    80006c48:	ffffb097          	auipc	ra,0xffffb
    80006c4c:	8c0080e7          	jalr	-1856(ra) # 80001508 <_Z8sem_waitP4KSem>

    if (tail >= head) {
    80006c50:	0144a783          	lw	a5,20(s1)
    80006c54:	0104a903          	lw	s2,16(s1)
    80006c58:	0327ce63          	blt	a5,s2,80006c94 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80006c5c:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80006c60:	0304b503          	ld	a0,48(s1)
    80006c64:	ffffb097          	auipc	ra,0xffffb
    80006c68:	8d4080e7          	jalr	-1836(ra) # 80001538 <_Z10sem_signalP4KSem>
    sem_signal(mutexHead);
    80006c6c:	0284b503          	ld	a0,40(s1)
    80006c70:	ffffb097          	auipc	ra,0xffffb
    80006c74:	8c8080e7          	jalr	-1848(ra) # 80001538 <_Z10sem_signalP4KSem>

    return ret;
}
    80006c78:	00090513          	mv	a0,s2
    80006c7c:	01813083          	ld	ra,24(sp)
    80006c80:	01013403          	ld	s0,16(sp)
    80006c84:	00813483          	ld	s1,8(sp)
    80006c88:	00013903          	ld	s2,0(sp)
    80006c8c:	02010113          	addi	sp,sp,32
    80006c90:	00008067          	ret
        ret = cap - head + tail;
    80006c94:	0004a703          	lw	a4,0(s1)
    80006c98:	4127093b          	subw	s2,a4,s2
    80006c9c:	00f9093b          	addw	s2,s2,a5
    80006ca0:	fc1ff06f          	j	80006c60 <_ZN6Buffer6getCntEv+0x44>

0000000080006ca4 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80006ca4:	fe010113          	addi	sp,sp,-32
    80006ca8:	00113c23          	sd	ra,24(sp)
    80006cac:	00813823          	sd	s0,16(sp)
    80006cb0:	00913423          	sd	s1,8(sp)
    80006cb4:	02010413          	addi	s0,sp,32
    80006cb8:	00050493          	mv	s1,a0
    putc('\n');
    80006cbc:	00a00513          	li	a0,10
    80006cc0:	ffffb097          	auipc	ra,0xffffb
    80006cc4:	8d0080e7          	jalr	-1840(ra) # 80001590 <_Z4putcc>
    printString("Buffer deleted!\n");
    80006cc8:	00002517          	auipc	a0,0x2
    80006ccc:	74850513          	addi	a0,a0,1864 # 80009410 <CONSOLE_STATUS+0x400>
    80006cd0:	fffff097          	auipc	ra,0xfffff
    80006cd4:	e64080e7          	jalr	-412(ra) # 80005b34 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80006cd8:	00048513          	mv	a0,s1
    80006cdc:	00000097          	auipc	ra,0x0
    80006ce0:	f40080e7          	jalr	-192(ra) # 80006c1c <_ZN6Buffer6getCntEv>
    80006ce4:	02a05c63          	blez	a0,80006d1c <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80006ce8:	0084b783          	ld	a5,8(s1)
    80006cec:	0104a703          	lw	a4,16(s1)
    80006cf0:	00271713          	slli	a4,a4,0x2
    80006cf4:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80006cf8:	0007c503          	lbu	a0,0(a5)
    80006cfc:	ffffb097          	auipc	ra,0xffffb
    80006d00:	894080e7          	jalr	-1900(ra) # 80001590 <_Z4putcc>
        head = (head + 1) % cap;
    80006d04:	0104a783          	lw	a5,16(s1)
    80006d08:	0017879b          	addiw	a5,a5,1
    80006d0c:	0004a703          	lw	a4,0(s1)
    80006d10:	02e7e7bb          	remw	a5,a5,a4
    80006d14:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80006d18:	fc1ff06f          	j	80006cd8 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80006d1c:	02100513          	li	a0,33
    80006d20:	ffffb097          	auipc	ra,0xffffb
    80006d24:	870080e7          	jalr	-1936(ra) # 80001590 <_Z4putcc>
    putc('\n');
    80006d28:	00a00513          	li	a0,10
    80006d2c:	ffffb097          	auipc	ra,0xffffb
    80006d30:	864080e7          	jalr	-1948(ra) # 80001590 <_Z4putcc>
    mem_free(buffer);
    80006d34:	0084b503          	ld	a0,8(s1)
    80006d38:	ffffa097          	auipc	ra,0xffffa
    80006d3c:	618080e7          	jalr	1560(ra) # 80001350 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80006d40:	0204b503          	ld	a0,32(s1)
    80006d44:	ffffa097          	auipc	ra,0xffffa
    80006d48:	794080e7          	jalr	1940(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(spaceAvailable);
    80006d4c:	0184b503          	ld	a0,24(s1)
    80006d50:	ffffa097          	auipc	ra,0xffffa
    80006d54:	788080e7          	jalr	1928(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(mutexTail);
    80006d58:	0304b503          	ld	a0,48(s1)
    80006d5c:	ffffa097          	auipc	ra,0xffffa
    80006d60:	77c080e7          	jalr	1916(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(mutexHead);
    80006d64:	0284b503          	ld	a0,40(s1)
    80006d68:	ffffa097          	auipc	ra,0xffffa
    80006d6c:	770080e7          	jalr	1904(ra) # 800014d8 <_Z9sem_closeP4KSem>
}
    80006d70:	01813083          	ld	ra,24(sp)
    80006d74:	01013403          	ld	s0,16(sp)
    80006d78:	00813483          	ld	s1,8(sp)
    80006d7c:	02010113          	addi	sp,sp,32
    80006d80:	00008067          	ret

0000000080006d84 <start>:
    80006d84:	ff010113          	addi	sp,sp,-16
    80006d88:	00813423          	sd	s0,8(sp)
    80006d8c:	01010413          	addi	s0,sp,16
    80006d90:	300027f3          	csrr	a5,mstatus
    80006d94:	ffffe737          	lui	a4,0xffffe
    80006d98:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff18cf>
    80006d9c:	00e7f7b3          	and	a5,a5,a4
    80006da0:	00001737          	lui	a4,0x1
    80006da4:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80006da8:	00e7e7b3          	or	a5,a5,a4
    80006dac:	30079073          	csrw	mstatus,a5
    80006db0:	00000797          	auipc	a5,0x0
    80006db4:	16078793          	addi	a5,a5,352 # 80006f10 <system_main>
    80006db8:	34179073          	csrw	mepc,a5
    80006dbc:	00000793          	li	a5,0
    80006dc0:	18079073          	csrw	satp,a5
    80006dc4:	000107b7          	lui	a5,0x10
    80006dc8:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80006dcc:	30279073          	csrw	medeleg,a5
    80006dd0:	30379073          	csrw	mideleg,a5
    80006dd4:	104027f3          	csrr	a5,sie
    80006dd8:	2227e793          	ori	a5,a5,546
    80006ddc:	10479073          	csrw	sie,a5
    80006de0:	fff00793          	li	a5,-1
    80006de4:	00a7d793          	srli	a5,a5,0xa
    80006de8:	3b079073          	csrw	pmpaddr0,a5
    80006dec:	00f00793          	li	a5,15
    80006df0:	3a079073          	csrw	pmpcfg0,a5
    80006df4:	f14027f3          	csrr	a5,mhartid
    80006df8:	0200c737          	lui	a4,0x200c
    80006dfc:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80006e00:	0007869b          	sext.w	a3,a5
    80006e04:	00269713          	slli	a4,a3,0x2
    80006e08:	000f4637          	lui	a2,0xf4
    80006e0c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80006e10:	00d70733          	add	a4,a4,a3
    80006e14:	0037979b          	slliw	a5,a5,0x3
    80006e18:	020046b7          	lui	a3,0x2004
    80006e1c:	00d787b3          	add	a5,a5,a3
    80006e20:	00c585b3          	add	a1,a1,a2
    80006e24:	00371693          	slli	a3,a4,0x3
    80006e28:	00005717          	auipc	a4,0x5
    80006e2c:	ea870713          	addi	a4,a4,-344 # 8000bcd0 <timer_scratch>
    80006e30:	00b7b023          	sd	a1,0(a5)
    80006e34:	00d70733          	add	a4,a4,a3
    80006e38:	00f73c23          	sd	a5,24(a4)
    80006e3c:	02c73023          	sd	a2,32(a4)
    80006e40:	34071073          	csrw	mscratch,a4
    80006e44:	00000797          	auipc	a5,0x0
    80006e48:	6ec78793          	addi	a5,a5,1772 # 80007530 <timervec>
    80006e4c:	30579073          	csrw	mtvec,a5
    80006e50:	300027f3          	csrr	a5,mstatus
    80006e54:	0087e793          	ori	a5,a5,8
    80006e58:	30079073          	csrw	mstatus,a5
    80006e5c:	304027f3          	csrr	a5,mie
    80006e60:	0807e793          	ori	a5,a5,128
    80006e64:	30479073          	csrw	mie,a5
    80006e68:	f14027f3          	csrr	a5,mhartid
    80006e6c:	0007879b          	sext.w	a5,a5
    80006e70:	00078213          	mv	tp,a5
    80006e74:	30200073          	mret
    80006e78:	00813403          	ld	s0,8(sp)
    80006e7c:	01010113          	addi	sp,sp,16
    80006e80:	00008067          	ret

0000000080006e84 <timerinit>:
    80006e84:	ff010113          	addi	sp,sp,-16
    80006e88:	00813423          	sd	s0,8(sp)
    80006e8c:	01010413          	addi	s0,sp,16
    80006e90:	f14027f3          	csrr	a5,mhartid
    80006e94:	0200c737          	lui	a4,0x200c
    80006e98:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80006e9c:	0007869b          	sext.w	a3,a5
    80006ea0:	00269713          	slli	a4,a3,0x2
    80006ea4:	000f4637          	lui	a2,0xf4
    80006ea8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80006eac:	00d70733          	add	a4,a4,a3
    80006eb0:	0037979b          	slliw	a5,a5,0x3
    80006eb4:	020046b7          	lui	a3,0x2004
    80006eb8:	00d787b3          	add	a5,a5,a3
    80006ebc:	00c585b3          	add	a1,a1,a2
    80006ec0:	00371693          	slli	a3,a4,0x3
    80006ec4:	00005717          	auipc	a4,0x5
    80006ec8:	e0c70713          	addi	a4,a4,-500 # 8000bcd0 <timer_scratch>
    80006ecc:	00b7b023          	sd	a1,0(a5)
    80006ed0:	00d70733          	add	a4,a4,a3
    80006ed4:	00f73c23          	sd	a5,24(a4)
    80006ed8:	02c73023          	sd	a2,32(a4)
    80006edc:	34071073          	csrw	mscratch,a4
    80006ee0:	00000797          	auipc	a5,0x0
    80006ee4:	65078793          	addi	a5,a5,1616 # 80007530 <timervec>
    80006ee8:	30579073          	csrw	mtvec,a5
    80006eec:	300027f3          	csrr	a5,mstatus
    80006ef0:	0087e793          	ori	a5,a5,8
    80006ef4:	30079073          	csrw	mstatus,a5
    80006ef8:	304027f3          	csrr	a5,mie
    80006efc:	0807e793          	ori	a5,a5,128
    80006f00:	30479073          	csrw	mie,a5
    80006f04:	00813403          	ld	s0,8(sp)
    80006f08:	01010113          	addi	sp,sp,16
    80006f0c:	00008067          	ret

0000000080006f10 <system_main>:
    80006f10:	fe010113          	addi	sp,sp,-32
    80006f14:	00813823          	sd	s0,16(sp)
    80006f18:	00913423          	sd	s1,8(sp)
    80006f1c:	00113c23          	sd	ra,24(sp)
    80006f20:	02010413          	addi	s0,sp,32
    80006f24:	00000097          	auipc	ra,0x0
    80006f28:	0c4080e7          	jalr	196(ra) # 80006fe8 <cpuid>
    80006f2c:	00005497          	auipc	s1,0x5
    80006f30:	c1448493          	addi	s1,s1,-1004 # 8000bb40 <started>
    80006f34:	02050263          	beqz	a0,80006f58 <system_main+0x48>
    80006f38:	0004a783          	lw	a5,0(s1)
    80006f3c:	0007879b          	sext.w	a5,a5
    80006f40:	fe078ce3          	beqz	a5,80006f38 <system_main+0x28>
    80006f44:	0ff0000f          	fence
    80006f48:	00002517          	auipc	a0,0x2
    80006f4c:	79850513          	addi	a0,a0,1944 # 800096e0 <CONSOLE_STATUS+0x6d0>
    80006f50:	00001097          	auipc	ra,0x1
    80006f54:	a7c080e7          	jalr	-1412(ra) # 800079cc <panic>
    80006f58:	00001097          	auipc	ra,0x1
    80006f5c:	9d0080e7          	jalr	-1584(ra) # 80007928 <consoleinit>
    80006f60:	00001097          	auipc	ra,0x1
    80006f64:	15c080e7          	jalr	348(ra) # 800080bc <printfinit>
    80006f68:	00002517          	auipc	a0,0x2
    80006f6c:	60050513          	addi	a0,a0,1536 # 80009568 <CONSOLE_STATUS+0x558>
    80006f70:	00001097          	auipc	ra,0x1
    80006f74:	ab8080e7          	jalr	-1352(ra) # 80007a28 <__printf>
    80006f78:	00002517          	auipc	a0,0x2
    80006f7c:	73850513          	addi	a0,a0,1848 # 800096b0 <CONSOLE_STATUS+0x6a0>
    80006f80:	00001097          	auipc	ra,0x1
    80006f84:	aa8080e7          	jalr	-1368(ra) # 80007a28 <__printf>
    80006f88:	00002517          	auipc	a0,0x2
    80006f8c:	5e050513          	addi	a0,a0,1504 # 80009568 <CONSOLE_STATUS+0x558>
    80006f90:	00001097          	auipc	ra,0x1
    80006f94:	a98080e7          	jalr	-1384(ra) # 80007a28 <__printf>
    80006f98:	00001097          	auipc	ra,0x1
    80006f9c:	4b0080e7          	jalr	1200(ra) # 80008448 <kinit>
    80006fa0:	00000097          	auipc	ra,0x0
    80006fa4:	148080e7          	jalr	328(ra) # 800070e8 <trapinit>
    80006fa8:	00000097          	auipc	ra,0x0
    80006fac:	16c080e7          	jalr	364(ra) # 80007114 <trapinithart>
    80006fb0:	00000097          	auipc	ra,0x0
    80006fb4:	5c0080e7          	jalr	1472(ra) # 80007570 <plicinit>
    80006fb8:	00000097          	auipc	ra,0x0
    80006fbc:	5e0080e7          	jalr	1504(ra) # 80007598 <plicinithart>
    80006fc0:	00000097          	auipc	ra,0x0
    80006fc4:	078080e7          	jalr	120(ra) # 80007038 <userinit>
    80006fc8:	0ff0000f          	fence
    80006fcc:	00100793          	li	a5,1
    80006fd0:	00002517          	auipc	a0,0x2
    80006fd4:	6f850513          	addi	a0,a0,1784 # 800096c8 <CONSOLE_STATUS+0x6b8>
    80006fd8:	00f4a023          	sw	a5,0(s1)
    80006fdc:	00001097          	auipc	ra,0x1
    80006fe0:	a4c080e7          	jalr	-1460(ra) # 80007a28 <__printf>
    80006fe4:	0000006f          	j	80006fe4 <system_main+0xd4>

0000000080006fe8 <cpuid>:
    80006fe8:	ff010113          	addi	sp,sp,-16
    80006fec:	00813423          	sd	s0,8(sp)
    80006ff0:	01010413          	addi	s0,sp,16
    80006ff4:	00020513          	mv	a0,tp
    80006ff8:	00813403          	ld	s0,8(sp)
    80006ffc:	0005051b          	sext.w	a0,a0
    80007000:	01010113          	addi	sp,sp,16
    80007004:	00008067          	ret

0000000080007008 <mycpu>:
    80007008:	ff010113          	addi	sp,sp,-16
    8000700c:	00813423          	sd	s0,8(sp)
    80007010:	01010413          	addi	s0,sp,16
    80007014:	00020793          	mv	a5,tp
    80007018:	00813403          	ld	s0,8(sp)
    8000701c:	0007879b          	sext.w	a5,a5
    80007020:	00779793          	slli	a5,a5,0x7
    80007024:	00006517          	auipc	a0,0x6
    80007028:	cdc50513          	addi	a0,a0,-804 # 8000cd00 <cpus>
    8000702c:	00f50533          	add	a0,a0,a5
    80007030:	01010113          	addi	sp,sp,16
    80007034:	00008067          	ret

0000000080007038 <userinit>:
    80007038:	ff010113          	addi	sp,sp,-16
    8000703c:	00813423          	sd	s0,8(sp)
    80007040:	01010413          	addi	s0,sp,16
    80007044:	00813403          	ld	s0,8(sp)
    80007048:	01010113          	addi	sp,sp,16
    8000704c:	ffffb317          	auipc	t1,0xffffb
    80007050:	b2030067          	jr	-1248(t1) # 80001b6c <main>

0000000080007054 <either_copyout>:
    80007054:	ff010113          	addi	sp,sp,-16
    80007058:	00813023          	sd	s0,0(sp)
    8000705c:	00113423          	sd	ra,8(sp)
    80007060:	01010413          	addi	s0,sp,16
    80007064:	02051663          	bnez	a0,80007090 <either_copyout+0x3c>
    80007068:	00058513          	mv	a0,a1
    8000706c:	00060593          	mv	a1,a2
    80007070:	0006861b          	sext.w	a2,a3
    80007074:	00002097          	auipc	ra,0x2
    80007078:	c60080e7          	jalr	-928(ra) # 80008cd4 <__memmove>
    8000707c:	00813083          	ld	ra,8(sp)
    80007080:	00013403          	ld	s0,0(sp)
    80007084:	00000513          	li	a0,0
    80007088:	01010113          	addi	sp,sp,16
    8000708c:	00008067          	ret
    80007090:	00002517          	auipc	a0,0x2
    80007094:	67850513          	addi	a0,a0,1656 # 80009708 <CONSOLE_STATUS+0x6f8>
    80007098:	00001097          	auipc	ra,0x1
    8000709c:	934080e7          	jalr	-1740(ra) # 800079cc <panic>

00000000800070a0 <either_copyin>:
    800070a0:	ff010113          	addi	sp,sp,-16
    800070a4:	00813023          	sd	s0,0(sp)
    800070a8:	00113423          	sd	ra,8(sp)
    800070ac:	01010413          	addi	s0,sp,16
    800070b0:	02059463          	bnez	a1,800070d8 <either_copyin+0x38>
    800070b4:	00060593          	mv	a1,a2
    800070b8:	0006861b          	sext.w	a2,a3
    800070bc:	00002097          	auipc	ra,0x2
    800070c0:	c18080e7          	jalr	-1000(ra) # 80008cd4 <__memmove>
    800070c4:	00813083          	ld	ra,8(sp)
    800070c8:	00013403          	ld	s0,0(sp)
    800070cc:	00000513          	li	a0,0
    800070d0:	01010113          	addi	sp,sp,16
    800070d4:	00008067          	ret
    800070d8:	00002517          	auipc	a0,0x2
    800070dc:	65850513          	addi	a0,a0,1624 # 80009730 <CONSOLE_STATUS+0x720>
    800070e0:	00001097          	auipc	ra,0x1
    800070e4:	8ec080e7          	jalr	-1812(ra) # 800079cc <panic>

00000000800070e8 <trapinit>:
    800070e8:	ff010113          	addi	sp,sp,-16
    800070ec:	00813423          	sd	s0,8(sp)
    800070f0:	01010413          	addi	s0,sp,16
    800070f4:	00813403          	ld	s0,8(sp)
    800070f8:	00002597          	auipc	a1,0x2
    800070fc:	66058593          	addi	a1,a1,1632 # 80009758 <CONSOLE_STATUS+0x748>
    80007100:	00006517          	auipc	a0,0x6
    80007104:	c8050513          	addi	a0,a0,-896 # 8000cd80 <tickslock>
    80007108:	01010113          	addi	sp,sp,16
    8000710c:	00001317          	auipc	t1,0x1
    80007110:	5cc30067          	jr	1484(t1) # 800086d8 <initlock>

0000000080007114 <trapinithart>:
    80007114:	ff010113          	addi	sp,sp,-16
    80007118:	00813423          	sd	s0,8(sp)
    8000711c:	01010413          	addi	s0,sp,16
    80007120:	00000797          	auipc	a5,0x0
    80007124:	30078793          	addi	a5,a5,768 # 80007420 <kernelvec>
    80007128:	10579073          	csrw	stvec,a5
    8000712c:	00813403          	ld	s0,8(sp)
    80007130:	01010113          	addi	sp,sp,16
    80007134:	00008067          	ret

0000000080007138 <usertrap>:
    80007138:	ff010113          	addi	sp,sp,-16
    8000713c:	00813423          	sd	s0,8(sp)
    80007140:	01010413          	addi	s0,sp,16
    80007144:	00813403          	ld	s0,8(sp)
    80007148:	01010113          	addi	sp,sp,16
    8000714c:	00008067          	ret

0000000080007150 <usertrapret>:
    80007150:	ff010113          	addi	sp,sp,-16
    80007154:	00813423          	sd	s0,8(sp)
    80007158:	01010413          	addi	s0,sp,16
    8000715c:	00813403          	ld	s0,8(sp)
    80007160:	01010113          	addi	sp,sp,16
    80007164:	00008067          	ret

0000000080007168 <kerneltrap>:
    80007168:	fe010113          	addi	sp,sp,-32
    8000716c:	00813823          	sd	s0,16(sp)
    80007170:	00113c23          	sd	ra,24(sp)
    80007174:	00913423          	sd	s1,8(sp)
    80007178:	02010413          	addi	s0,sp,32
    8000717c:	142025f3          	csrr	a1,scause
    80007180:	100027f3          	csrr	a5,sstatus
    80007184:	0027f793          	andi	a5,a5,2
    80007188:	10079c63          	bnez	a5,800072a0 <kerneltrap+0x138>
    8000718c:	142027f3          	csrr	a5,scause
    80007190:	0207ce63          	bltz	a5,800071cc <kerneltrap+0x64>
    80007194:	00002517          	auipc	a0,0x2
    80007198:	60c50513          	addi	a0,a0,1548 # 800097a0 <CONSOLE_STATUS+0x790>
    8000719c:	00001097          	auipc	ra,0x1
    800071a0:	88c080e7          	jalr	-1908(ra) # 80007a28 <__printf>
    800071a4:	141025f3          	csrr	a1,sepc
    800071a8:	14302673          	csrr	a2,stval
    800071ac:	00002517          	auipc	a0,0x2
    800071b0:	60450513          	addi	a0,a0,1540 # 800097b0 <CONSOLE_STATUS+0x7a0>
    800071b4:	00001097          	auipc	ra,0x1
    800071b8:	874080e7          	jalr	-1932(ra) # 80007a28 <__printf>
    800071bc:	00002517          	auipc	a0,0x2
    800071c0:	60c50513          	addi	a0,a0,1548 # 800097c8 <CONSOLE_STATUS+0x7b8>
    800071c4:	00001097          	auipc	ra,0x1
    800071c8:	808080e7          	jalr	-2040(ra) # 800079cc <panic>
    800071cc:	0ff7f713          	andi	a4,a5,255
    800071d0:	00900693          	li	a3,9
    800071d4:	04d70063          	beq	a4,a3,80007214 <kerneltrap+0xac>
    800071d8:	fff00713          	li	a4,-1
    800071dc:	03f71713          	slli	a4,a4,0x3f
    800071e0:	00170713          	addi	a4,a4,1
    800071e4:	fae798e3          	bne	a5,a4,80007194 <kerneltrap+0x2c>
    800071e8:	00000097          	auipc	ra,0x0
    800071ec:	e00080e7          	jalr	-512(ra) # 80006fe8 <cpuid>
    800071f0:	06050663          	beqz	a0,8000725c <kerneltrap+0xf4>
    800071f4:	144027f3          	csrr	a5,sip
    800071f8:	ffd7f793          	andi	a5,a5,-3
    800071fc:	14479073          	csrw	sip,a5
    80007200:	01813083          	ld	ra,24(sp)
    80007204:	01013403          	ld	s0,16(sp)
    80007208:	00813483          	ld	s1,8(sp)
    8000720c:	02010113          	addi	sp,sp,32
    80007210:	00008067          	ret
    80007214:	00000097          	auipc	ra,0x0
    80007218:	3d0080e7          	jalr	976(ra) # 800075e4 <plic_claim>
    8000721c:	00a00793          	li	a5,10
    80007220:	00050493          	mv	s1,a0
    80007224:	06f50863          	beq	a0,a5,80007294 <kerneltrap+0x12c>
    80007228:	fc050ce3          	beqz	a0,80007200 <kerneltrap+0x98>
    8000722c:	00050593          	mv	a1,a0
    80007230:	00002517          	auipc	a0,0x2
    80007234:	55050513          	addi	a0,a0,1360 # 80009780 <CONSOLE_STATUS+0x770>
    80007238:	00000097          	auipc	ra,0x0
    8000723c:	7f0080e7          	jalr	2032(ra) # 80007a28 <__printf>
    80007240:	01013403          	ld	s0,16(sp)
    80007244:	01813083          	ld	ra,24(sp)
    80007248:	00048513          	mv	a0,s1
    8000724c:	00813483          	ld	s1,8(sp)
    80007250:	02010113          	addi	sp,sp,32
    80007254:	00000317          	auipc	t1,0x0
    80007258:	3c830067          	jr	968(t1) # 8000761c <plic_complete>
    8000725c:	00006517          	auipc	a0,0x6
    80007260:	b2450513          	addi	a0,a0,-1244 # 8000cd80 <tickslock>
    80007264:	00001097          	auipc	ra,0x1
    80007268:	498080e7          	jalr	1176(ra) # 800086fc <acquire>
    8000726c:	00005717          	auipc	a4,0x5
    80007270:	8d870713          	addi	a4,a4,-1832 # 8000bb44 <ticks>
    80007274:	00072783          	lw	a5,0(a4)
    80007278:	00006517          	auipc	a0,0x6
    8000727c:	b0850513          	addi	a0,a0,-1272 # 8000cd80 <tickslock>
    80007280:	0017879b          	addiw	a5,a5,1
    80007284:	00f72023          	sw	a5,0(a4)
    80007288:	00001097          	auipc	ra,0x1
    8000728c:	540080e7          	jalr	1344(ra) # 800087c8 <release>
    80007290:	f65ff06f          	j	800071f4 <kerneltrap+0x8c>
    80007294:	00001097          	auipc	ra,0x1
    80007298:	09c080e7          	jalr	156(ra) # 80008330 <uartintr>
    8000729c:	fa5ff06f          	j	80007240 <kerneltrap+0xd8>
    800072a0:	00002517          	auipc	a0,0x2
    800072a4:	4c050513          	addi	a0,a0,1216 # 80009760 <CONSOLE_STATUS+0x750>
    800072a8:	00000097          	auipc	ra,0x0
    800072ac:	724080e7          	jalr	1828(ra) # 800079cc <panic>

00000000800072b0 <clockintr>:
    800072b0:	fe010113          	addi	sp,sp,-32
    800072b4:	00813823          	sd	s0,16(sp)
    800072b8:	00913423          	sd	s1,8(sp)
    800072bc:	00113c23          	sd	ra,24(sp)
    800072c0:	02010413          	addi	s0,sp,32
    800072c4:	00006497          	auipc	s1,0x6
    800072c8:	abc48493          	addi	s1,s1,-1348 # 8000cd80 <tickslock>
    800072cc:	00048513          	mv	a0,s1
    800072d0:	00001097          	auipc	ra,0x1
    800072d4:	42c080e7          	jalr	1068(ra) # 800086fc <acquire>
    800072d8:	00005717          	auipc	a4,0x5
    800072dc:	86c70713          	addi	a4,a4,-1940 # 8000bb44 <ticks>
    800072e0:	00072783          	lw	a5,0(a4)
    800072e4:	01013403          	ld	s0,16(sp)
    800072e8:	01813083          	ld	ra,24(sp)
    800072ec:	00048513          	mv	a0,s1
    800072f0:	0017879b          	addiw	a5,a5,1
    800072f4:	00813483          	ld	s1,8(sp)
    800072f8:	00f72023          	sw	a5,0(a4)
    800072fc:	02010113          	addi	sp,sp,32
    80007300:	00001317          	auipc	t1,0x1
    80007304:	4c830067          	jr	1224(t1) # 800087c8 <release>

0000000080007308 <devintr>:
    80007308:	142027f3          	csrr	a5,scause
    8000730c:	00000513          	li	a0,0
    80007310:	0007c463          	bltz	a5,80007318 <devintr+0x10>
    80007314:	00008067          	ret
    80007318:	fe010113          	addi	sp,sp,-32
    8000731c:	00813823          	sd	s0,16(sp)
    80007320:	00113c23          	sd	ra,24(sp)
    80007324:	00913423          	sd	s1,8(sp)
    80007328:	02010413          	addi	s0,sp,32
    8000732c:	0ff7f713          	andi	a4,a5,255
    80007330:	00900693          	li	a3,9
    80007334:	04d70c63          	beq	a4,a3,8000738c <devintr+0x84>
    80007338:	fff00713          	li	a4,-1
    8000733c:	03f71713          	slli	a4,a4,0x3f
    80007340:	00170713          	addi	a4,a4,1
    80007344:	00e78c63          	beq	a5,a4,8000735c <devintr+0x54>
    80007348:	01813083          	ld	ra,24(sp)
    8000734c:	01013403          	ld	s0,16(sp)
    80007350:	00813483          	ld	s1,8(sp)
    80007354:	02010113          	addi	sp,sp,32
    80007358:	00008067          	ret
    8000735c:	00000097          	auipc	ra,0x0
    80007360:	c8c080e7          	jalr	-884(ra) # 80006fe8 <cpuid>
    80007364:	06050663          	beqz	a0,800073d0 <devintr+0xc8>
    80007368:	144027f3          	csrr	a5,sip
    8000736c:	ffd7f793          	andi	a5,a5,-3
    80007370:	14479073          	csrw	sip,a5
    80007374:	01813083          	ld	ra,24(sp)
    80007378:	01013403          	ld	s0,16(sp)
    8000737c:	00813483          	ld	s1,8(sp)
    80007380:	00200513          	li	a0,2
    80007384:	02010113          	addi	sp,sp,32
    80007388:	00008067          	ret
    8000738c:	00000097          	auipc	ra,0x0
    80007390:	258080e7          	jalr	600(ra) # 800075e4 <plic_claim>
    80007394:	00a00793          	li	a5,10
    80007398:	00050493          	mv	s1,a0
    8000739c:	06f50663          	beq	a0,a5,80007408 <devintr+0x100>
    800073a0:	00100513          	li	a0,1
    800073a4:	fa0482e3          	beqz	s1,80007348 <devintr+0x40>
    800073a8:	00048593          	mv	a1,s1
    800073ac:	00002517          	auipc	a0,0x2
    800073b0:	3d450513          	addi	a0,a0,980 # 80009780 <CONSOLE_STATUS+0x770>
    800073b4:	00000097          	auipc	ra,0x0
    800073b8:	674080e7          	jalr	1652(ra) # 80007a28 <__printf>
    800073bc:	00048513          	mv	a0,s1
    800073c0:	00000097          	auipc	ra,0x0
    800073c4:	25c080e7          	jalr	604(ra) # 8000761c <plic_complete>
    800073c8:	00100513          	li	a0,1
    800073cc:	f7dff06f          	j	80007348 <devintr+0x40>
    800073d0:	00006517          	auipc	a0,0x6
    800073d4:	9b050513          	addi	a0,a0,-1616 # 8000cd80 <tickslock>
    800073d8:	00001097          	auipc	ra,0x1
    800073dc:	324080e7          	jalr	804(ra) # 800086fc <acquire>
    800073e0:	00004717          	auipc	a4,0x4
    800073e4:	76470713          	addi	a4,a4,1892 # 8000bb44 <ticks>
    800073e8:	00072783          	lw	a5,0(a4)
    800073ec:	00006517          	auipc	a0,0x6
    800073f0:	99450513          	addi	a0,a0,-1644 # 8000cd80 <tickslock>
    800073f4:	0017879b          	addiw	a5,a5,1
    800073f8:	00f72023          	sw	a5,0(a4)
    800073fc:	00001097          	auipc	ra,0x1
    80007400:	3cc080e7          	jalr	972(ra) # 800087c8 <release>
    80007404:	f65ff06f          	j	80007368 <devintr+0x60>
    80007408:	00001097          	auipc	ra,0x1
    8000740c:	f28080e7          	jalr	-216(ra) # 80008330 <uartintr>
    80007410:	fadff06f          	j	800073bc <devintr+0xb4>
	...

0000000080007420 <kernelvec>:
    80007420:	f0010113          	addi	sp,sp,-256
    80007424:	00113023          	sd	ra,0(sp)
    80007428:	00213423          	sd	sp,8(sp)
    8000742c:	00313823          	sd	gp,16(sp)
    80007430:	00413c23          	sd	tp,24(sp)
    80007434:	02513023          	sd	t0,32(sp)
    80007438:	02613423          	sd	t1,40(sp)
    8000743c:	02713823          	sd	t2,48(sp)
    80007440:	02813c23          	sd	s0,56(sp)
    80007444:	04913023          	sd	s1,64(sp)
    80007448:	04a13423          	sd	a0,72(sp)
    8000744c:	04b13823          	sd	a1,80(sp)
    80007450:	04c13c23          	sd	a2,88(sp)
    80007454:	06d13023          	sd	a3,96(sp)
    80007458:	06e13423          	sd	a4,104(sp)
    8000745c:	06f13823          	sd	a5,112(sp)
    80007460:	07013c23          	sd	a6,120(sp)
    80007464:	09113023          	sd	a7,128(sp)
    80007468:	09213423          	sd	s2,136(sp)
    8000746c:	09313823          	sd	s3,144(sp)
    80007470:	09413c23          	sd	s4,152(sp)
    80007474:	0b513023          	sd	s5,160(sp)
    80007478:	0b613423          	sd	s6,168(sp)
    8000747c:	0b713823          	sd	s7,176(sp)
    80007480:	0b813c23          	sd	s8,184(sp)
    80007484:	0d913023          	sd	s9,192(sp)
    80007488:	0da13423          	sd	s10,200(sp)
    8000748c:	0db13823          	sd	s11,208(sp)
    80007490:	0dc13c23          	sd	t3,216(sp)
    80007494:	0fd13023          	sd	t4,224(sp)
    80007498:	0fe13423          	sd	t5,232(sp)
    8000749c:	0ff13823          	sd	t6,240(sp)
    800074a0:	cc9ff0ef          	jal	ra,80007168 <kerneltrap>
    800074a4:	00013083          	ld	ra,0(sp)
    800074a8:	00813103          	ld	sp,8(sp)
    800074ac:	01013183          	ld	gp,16(sp)
    800074b0:	02013283          	ld	t0,32(sp)
    800074b4:	02813303          	ld	t1,40(sp)
    800074b8:	03013383          	ld	t2,48(sp)
    800074bc:	03813403          	ld	s0,56(sp)
    800074c0:	04013483          	ld	s1,64(sp)
    800074c4:	04813503          	ld	a0,72(sp)
    800074c8:	05013583          	ld	a1,80(sp)
    800074cc:	05813603          	ld	a2,88(sp)
    800074d0:	06013683          	ld	a3,96(sp)
    800074d4:	06813703          	ld	a4,104(sp)
    800074d8:	07013783          	ld	a5,112(sp)
    800074dc:	07813803          	ld	a6,120(sp)
    800074e0:	08013883          	ld	a7,128(sp)
    800074e4:	08813903          	ld	s2,136(sp)
    800074e8:	09013983          	ld	s3,144(sp)
    800074ec:	09813a03          	ld	s4,152(sp)
    800074f0:	0a013a83          	ld	s5,160(sp)
    800074f4:	0a813b03          	ld	s6,168(sp)
    800074f8:	0b013b83          	ld	s7,176(sp)
    800074fc:	0b813c03          	ld	s8,184(sp)
    80007500:	0c013c83          	ld	s9,192(sp)
    80007504:	0c813d03          	ld	s10,200(sp)
    80007508:	0d013d83          	ld	s11,208(sp)
    8000750c:	0d813e03          	ld	t3,216(sp)
    80007510:	0e013e83          	ld	t4,224(sp)
    80007514:	0e813f03          	ld	t5,232(sp)
    80007518:	0f013f83          	ld	t6,240(sp)
    8000751c:	10010113          	addi	sp,sp,256
    80007520:	10200073          	sret
    80007524:	00000013          	nop
    80007528:	00000013          	nop
    8000752c:	00000013          	nop

0000000080007530 <timervec>:
    80007530:	34051573          	csrrw	a0,mscratch,a0
    80007534:	00b53023          	sd	a1,0(a0)
    80007538:	00c53423          	sd	a2,8(a0)
    8000753c:	00d53823          	sd	a3,16(a0)
    80007540:	01853583          	ld	a1,24(a0)
    80007544:	02053603          	ld	a2,32(a0)
    80007548:	0005b683          	ld	a3,0(a1)
    8000754c:	00c686b3          	add	a3,a3,a2
    80007550:	00d5b023          	sd	a3,0(a1)
    80007554:	00200593          	li	a1,2
    80007558:	14459073          	csrw	sip,a1
    8000755c:	01053683          	ld	a3,16(a0)
    80007560:	00853603          	ld	a2,8(a0)
    80007564:	00053583          	ld	a1,0(a0)
    80007568:	34051573          	csrrw	a0,mscratch,a0
    8000756c:	30200073          	mret

0000000080007570 <plicinit>:
    80007570:	ff010113          	addi	sp,sp,-16
    80007574:	00813423          	sd	s0,8(sp)
    80007578:	01010413          	addi	s0,sp,16
    8000757c:	00813403          	ld	s0,8(sp)
    80007580:	0c0007b7          	lui	a5,0xc000
    80007584:	00100713          	li	a4,1
    80007588:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000758c:	00e7a223          	sw	a4,4(a5)
    80007590:	01010113          	addi	sp,sp,16
    80007594:	00008067          	ret

0000000080007598 <plicinithart>:
    80007598:	ff010113          	addi	sp,sp,-16
    8000759c:	00813023          	sd	s0,0(sp)
    800075a0:	00113423          	sd	ra,8(sp)
    800075a4:	01010413          	addi	s0,sp,16
    800075a8:	00000097          	auipc	ra,0x0
    800075ac:	a40080e7          	jalr	-1472(ra) # 80006fe8 <cpuid>
    800075b0:	0085171b          	slliw	a4,a0,0x8
    800075b4:	0c0027b7          	lui	a5,0xc002
    800075b8:	00e787b3          	add	a5,a5,a4
    800075bc:	40200713          	li	a4,1026
    800075c0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800075c4:	00813083          	ld	ra,8(sp)
    800075c8:	00013403          	ld	s0,0(sp)
    800075cc:	00d5151b          	slliw	a0,a0,0xd
    800075d0:	0c2017b7          	lui	a5,0xc201
    800075d4:	00a78533          	add	a0,a5,a0
    800075d8:	00052023          	sw	zero,0(a0)
    800075dc:	01010113          	addi	sp,sp,16
    800075e0:	00008067          	ret

00000000800075e4 <plic_claim>:
    800075e4:	ff010113          	addi	sp,sp,-16
    800075e8:	00813023          	sd	s0,0(sp)
    800075ec:	00113423          	sd	ra,8(sp)
    800075f0:	01010413          	addi	s0,sp,16
    800075f4:	00000097          	auipc	ra,0x0
    800075f8:	9f4080e7          	jalr	-1548(ra) # 80006fe8 <cpuid>
    800075fc:	00813083          	ld	ra,8(sp)
    80007600:	00013403          	ld	s0,0(sp)
    80007604:	00d5151b          	slliw	a0,a0,0xd
    80007608:	0c2017b7          	lui	a5,0xc201
    8000760c:	00a78533          	add	a0,a5,a0
    80007610:	00452503          	lw	a0,4(a0)
    80007614:	01010113          	addi	sp,sp,16
    80007618:	00008067          	ret

000000008000761c <plic_complete>:
    8000761c:	fe010113          	addi	sp,sp,-32
    80007620:	00813823          	sd	s0,16(sp)
    80007624:	00913423          	sd	s1,8(sp)
    80007628:	00113c23          	sd	ra,24(sp)
    8000762c:	02010413          	addi	s0,sp,32
    80007630:	00050493          	mv	s1,a0
    80007634:	00000097          	auipc	ra,0x0
    80007638:	9b4080e7          	jalr	-1612(ra) # 80006fe8 <cpuid>
    8000763c:	01813083          	ld	ra,24(sp)
    80007640:	01013403          	ld	s0,16(sp)
    80007644:	00d5179b          	slliw	a5,a0,0xd
    80007648:	0c201737          	lui	a4,0xc201
    8000764c:	00f707b3          	add	a5,a4,a5
    80007650:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80007654:	00813483          	ld	s1,8(sp)
    80007658:	02010113          	addi	sp,sp,32
    8000765c:	00008067          	ret

0000000080007660 <consolewrite>:
    80007660:	fb010113          	addi	sp,sp,-80
    80007664:	04813023          	sd	s0,64(sp)
    80007668:	04113423          	sd	ra,72(sp)
    8000766c:	02913c23          	sd	s1,56(sp)
    80007670:	03213823          	sd	s2,48(sp)
    80007674:	03313423          	sd	s3,40(sp)
    80007678:	03413023          	sd	s4,32(sp)
    8000767c:	01513c23          	sd	s5,24(sp)
    80007680:	05010413          	addi	s0,sp,80
    80007684:	06c05c63          	blez	a2,800076fc <consolewrite+0x9c>
    80007688:	00060993          	mv	s3,a2
    8000768c:	00050a13          	mv	s4,a0
    80007690:	00058493          	mv	s1,a1
    80007694:	00000913          	li	s2,0
    80007698:	fff00a93          	li	s5,-1
    8000769c:	01c0006f          	j	800076b8 <consolewrite+0x58>
    800076a0:	fbf44503          	lbu	a0,-65(s0)
    800076a4:	0019091b          	addiw	s2,s2,1
    800076a8:	00148493          	addi	s1,s1,1
    800076ac:	00001097          	auipc	ra,0x1
    800076b0:	a9c080e7          	jalr	-1380(ra) # 80008148 <uartputc>
    800076b4:	03298063          	beq	s3,s2,800076d4 <consolewrite+0x74>
    800076b8:	00048613          	mv	a2,s1
    800076bc:	00100693          	li	a3,1
    800076c0:	000a0593          	mv	a1,s4
    800076c4:	fbf40513          	addi	a0,s0,-65
    800076c8:	00000097          	auipc	ra,0x0
    800076cc:	9d8080e7          	jalr	-1576(ra) # 800070a0 <either_copyin>
    800076d0:	fd5518e3          	bne	a0,s5,800076a0 <consolewrite+0x40>
    800076d4:	04813083          	ld	ra,72(sp)
    800076d8:	04013403          	ld	s0,64(sp)
    800076dc:	03813483          	ld	s1,56(sp)
    800076e0:	02813983          	ld	s3,40(sp)
    800076e4:	02013a03          	ld	s4,32(sp)
    800076e8:	01813a83          	ld	s5,24(sp)
    800076ec:	00090513          	mv	a0,s2
    800076f0:	03013903          	ld	s2,48(sp)
    800076f4:	05010113          	addi	sp,sp,80
    800076f8:	00008067          	ret
    800076fc:	00000913          	li	s2,0
    80007700:	fd5ff06f          	j	800076d4 <consolewrite+0x74>

0000000080007704 <consoleread>:
    80007704:	f9010113          	addi	sp,sp,-112
    80007708:	06813023          	sd	s0,96(sp)
    8000770c:	04913c23          	sd	s1,88(sp)
    80007710:	05213823          	sd	s2,80(sp)
    80007714:	05313423          	sd	s3,72(sp)
    80007718:	05413023          	sd	s4,64(sp)
    8000771c:	03513c23          	sd	s5,56(sp)
    80007720:	03613823          	sd	s6,48(sp)
    80007724:	03713423          	sd	s7,40(sp)
    80007728:	03813023          	sd	s8,32(sp)
    8000772c:	06113423          	sd	ra,104(sp)
    80007730:	01913c23          	sd	s9,24(sp)
    80007734:	07010413          	addi	s0,sp,112
    80007738:	00060b93          	mv	s7,a2
    8000773c:	00050913          	mv	s2,a0
    80007740:	00058c13          	mv	s8,a1
    80007744:	00060b1b          	sext.w	s6,a2
    80007748:	00005497          	auipc	s1,0x5
    8000774c:	66048493          	addi	s1,s1,1632 # 8000cda8 <cons>
    80007750:	00400993          	li	s3,4
    80007754:	fff00a13          	li	s4,-1
    80007758:	00a00a93          	li	s5,10
    8000775c:	05705e63          	blez	s7,800077b8 <consoleread+0xb4>
    80007760:	09c4a703          	lw	a4,156(s1)
    80007764:	0984a783          	lw	a5,152(s1)
    80007768:	0007071b          	sext.w	a4,a4
    8000776c:	08e78463          	beq	a5,a4,800077f4 <consoleread+0xf0>
    80007770:	07f7f713          	andi	a4,a5,127
    80007774:	00e48733          	add	a4,s1,a4
    80007778:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000777c:	0017869b          	addiw	a3,a5,1
    80007780:	08d4ac23          	sw	a3,152(s1)
    80007784:	00070c9b          	sext.w	s9,a4
    80007788:	0b370663          	beq	a4,s3,80007834 <consoleread+0x130>
    8000778c:	00100693          	li	a3,1
    80007790:	f9f40613          	addi	a2,s0,-97
    80007794:	000c0593          	mv	a1,s8
    80007798:	00090513          	mv	a0,s2
    8000779c:	f8e40fa3          	sb	a4,-97(s0)
    800077a0:	00000097          	auipc	ra,0x0
    800077a4:	8b4080e7          	jalr	-1868(ra) # 80007054 <either_copyout>
    800077a8:	01450863          	beq	a0,s4,800077b8 <consoleread+0xb4>
    800077ac:	001c0c13          	addi	s8,s8,1
    800077b0:	fffb8b9b          	addiw	s7,s7,-1
    800077b4:	fb5c94e3          	bne	s9,s5,8000775c <consoleread+0x58>
    800077b8:	000b851b          	sext.w	a0,s7
    800077bc:	06813083          	ld	ra,104(sp)
    800077c0:	06013403          	ld	s0,96(sp)
    800077c4:	05813483          	ld	s1,88(sp)
    800077c8:	05013903          	ld	s2,80(sp)
    800077cc:	04813983          	ld	s3,72(sp)
    800077d0:	04013a03          	ld	s4,64(sp)
    800077d4:	03813a83          	ld	s5,56(sp)
    800077d8:	02813b83          	ld	s7,40(sp)
    800077dc:	02013c03          	ld	s8,32(sp)
    800077e0:	01813c83          	ld	s9,24(sp)
    800077e4:	40ab053b          	subw	a0,s6,a0
    800077e8:	03013b03          	ld	s6,48(sp)
    800077ec:	07010113          	addi	sp,sp,112
    800077f0:	00008067          	ret
    800077f4:	00001097          	auipc	ra,0x1
    800077f8:	1d8080e7          	jalr	472(ra) # 800089cc <push_on>
    800077fc:	0984a703          	lw	a4,152(s1)
    80007800:	09c4a783          	lw	a5,156(s1)
    80007804:	0007879b          	sext.w	a5,a5
    80007808:	fef70ce3          	beq	a4,a5,80007800 <consoleread+0xfc>
    8000780c:	00001097          	auipc	ra,0x1
    80007810:	234080e7          	jalr	564(ra) # 80008a40 <pop_on>
    80007814:	0984a783          	lw	a5,152(s1)
    80007818:	07f7f713          	andi	a4,a5,127
    8000781c:	00e48733          	add	a4,s1,a4
    80007820:	01874703          	lbu	a4,24(a4)
    80007824:	0017869b          	addiw	a3,a5,1
    80007828:	08d4ac23          	sw	a3,152(s1)
    8000782c:	00070c9b          	sext.w	s9,a4
    80007830:	f5371ee3          	bne	a4,s3,8000778c <consoleread+0x88>
    80007834:	000b851b          	sext.w	a0,s7
    80007838:	f96bf2e3          	bgeu	s7,s6,800077bc <consoleread+0xb8>
    8000783c:	08f4ac23          	sw	a5,152(s1)
    80007840:	f7dff06f          	j	800077bc <consoleread+0xb8>

0000000080007844 <consputc>:
    80007844:	10000793          	li	a5,256
    80007848:	00f50663          	beq	a0,a5,80007854 <consputc+0x10>
    8000784c:	00001317          	auipc	t1,0x1
    80007850:	9f430067          	jr	-1548(t1) # 80008240 <uartputc_sync>
    80007854:	ff010113          	addi	sp,sp,-16
    80007858:	00113423          	sd	ra,8(sp)
    8000785c:	00813023          	sd	s0,0(sp)
    80007860:	01010413          	addi	s0,sp,16
    80007864:	00800513          	li	a0,8
    80007868:	00001097          	auipc	ra,0x1
    8000786c:	9d8080e7          	jalr	-1576(ra) # 80008240 <uartputc_sync>
    80007870:	02000513          	li	a0,32
    80007874:	00001097          	auipc	ra,0x1
    80007878:	9cc080e7          	jalr	-1588(ra) # 80008240 <uartputc_sync>
    8000787c:	00013403          	ld	s0,0(sp)
    80007880:	00813083          	ld	ra,8(sp)
    80007884:	00800513          	li	a0,8
    80007888:	01010113          	addi	sp,sp,16
    8000788c:	00001317          	auipc	t1,0x1
    80007890:	9b430067          	jr	-1612(t1) # 80008240 <uartputc_sync>

0000000080007894 <consoleintr>:
    80007894:	fe010113          	addi	sp,sp,-32
    80007898:	00813823          	sd	s0,16(sp)
    8000789c:	00913423          	sd	s1,8(sp)
    800078a0:	01213023          	sd	s2,0(sp)
    800078a4:	00113c23          	sd	ra,24(sp)
    800078a8:	02010413          	addi	s0,sp,32
    800078ac:	00005917          	auipc	s2,0x5
    800078b0:	4fc90913          	addi	s2,s2,1276 # 8000cda8 <cons>
    800078b4:	00050493          	mv	s1,a0
    800078b8:	00090513          	mv	a0,s2
    800078bc:	00001097          	auipc	ra,0x1
    800078c0:	e40080e7          	jalr	-448(ra) # 800086fc <acquire>
    800078c4:	02048c63          	beqz	s1,800078fc <consoleintr+0x68>
    800078c8:	0a092783          	lw	a5,160(s2)
    800078cc:	09892703          	lw	a4,152(s2)
    800078d0:	07f00693          	li	a3,127
    800078d4:	40e7873b          	subw	a4,a5,a4
    800078d8:	02e6e263          	bltu	a3,a4,800078fc <consoleintr+0x68>
    800078dc:	00d00713          	li	a4,13
    800078e0:	04e48063          	beq	s1,a4,80007920 <consoleintr+0x8c>
    800078e4:	07f7f713          	andi	a4,a5,127
    800078e8:	00e90733          	add	a4,s2,a4
    800078ec:	0017879b          	addiw	a5,a5,1
    800078f0:	0af92023          	sw	a5,160(s2)
    800078f4:	00970c23          	sb	s1,24(a4)
    800078f8:	08f92e23          	sw	a5,156(s2)
    800078fc:	01013403          	ld	s0,16(sp)
    80007900:	01813083          	ld	ra,24(sp)
    80007904:	00813483          	ld	s1,8(sp)
    80007908:	00013903          	ld	s2,0(sp)
    8000790c:	00005517          	auipc	a0,0x5
    80007910:	49c50513          	addi	a0,a0,1180 # 8000cda8 <cons>
    80007914:	02010113          	addi	sp,sp,32
    80007918:	00001317          	auipc	t1,0x1
    8000791c:	eb030067          	jr	-336(t1) # 800087c8 <release>
    80007920:	00a00493          	li	s1,10
    80007924:	fc1ff06f          	j	800078e4 <consoleintr+0x50>

0000000080007928 <consoleinit>:
    80007928:	fe010113          	addi	sp,sp,-32
    8000792c:	00113c23          	sd	ra,24(sp)
    80007930:	00813823          	sd	s0,16(sp)
    80007934:	00913423          	sd	s1,8(sp)
    80007938:	02010413          	addi	s0,sp,32
    8000793c:	00005497          	auipc	s1,0x5
    80007940:	46c48493          	addi	s1,s1,1132 # 8000cda8 <cons>
    80007944:	00048513          	mv	a0,s1
    80007948:	00002597          	auipc	a1,0x2
    8000794c:	e9058593          	addi	a1,a1,-368 # 800097d8 <CONSOLE_STATUS+0x7c8>
    80007950:	00001097          	auipc	ra,0x1
    80007954:	d88080e7          	jalr	-632(ra) # 800086d8 <initlock>
    80007958:	00000097          	auipc	ra,0x0
    8000795c:	7ac080e7          	jalr	1964(ra) # 80008104 <uartinit>
    80007960:	01813083          	ld	ra,24(sp)
    80007964:	01013403          	ld	s0,16(sp)
    80007968:	00000797          	auipc	a5,0x0
    8000796c:	d9c78793          	addi	a5,a5,-612 # 80007704 <consoleread>
    80007970:	0af4bc23          	sd	a5,184(s1)
    80007974:	00000797          	auipc	a5,0x0
    80007978:	cec78793          	addi	a5,a5,-788 # 80007660 <consolewrite>
    8000797c:	0cf4b023          	sd	a5,192(s1)
    80007980:	00813483          	ld	s1,8(sp)
    80007984:	02010113          	addi	sp,sp,32
    80007988:	00008067          	ret

000000008000798c <console_read>:
    8000798c:	ff010113          	addi	sp,sp,-16
    80007990:	00813423          	sd	s0,8(sp)
    80007994:	01010413          	addi	s0,sp,16
    80007998:	00813403          	ld	s0,8(sp)
    8000799c:	00005317          	auipc	t1,0x5
    800079a0:	4c433303          	ld	t1,1220(t1) # 8000ce60 <devsw+0x10>
    800079a4:	01010113          	addi	sp,sp,16
    800079a8:	00030067          	jr	t1

00000000800079ac <console_write>:
    800079ac:	ff010113          	addi	sp,sp,-16
    800079b0:	00813423          	sd	s0,8(sp)
    800079b4:	01010413          	addi	s0,sp,16
    800079b8:	00813403          	ld	s0,8(sp)
    800079bc:	00005317          	auipc	t1,0x5
    800079c0:	4ac33303          	ld	t1,1196(t1) # 8000ce68 <devsw+0x18>
    800079c4:	01010113          	addi	sp,sp,16
    800079c8:	00030067          	jr	t1

00000000800079cc <panic>:
    800079cc:	fe010113          	addi	sp,sp,-32
    800079d0:	00113c23          	sd	ra,24(sp)
    800079d4:	00813823          	sd	s0,16(sp)
    800079d8:	00913423          	sd	s1,8(sp)
    800079dc:	02010413          	addi	s0,sp,32
    800079e0:	00050493          	mv	s1,a0
    800079e4:	00002517          	auipc	a0,0x2
    800079e8:	dfc50513          	addi	a0,a0,-516 # 800097e0 <CONSOLE_STATUS+0x7d0>
    800079ec:	00005797          	auipc	a5,0x5
    800079f0:	5007ae23          	sw	zero,1308(a5) # 8000cf08 <pr+0x18>
    800079f4:	00000097          	auipc	ra,0x0
    800079f8:	034080e7          	jalr	52(ra) # 80007a28 <__printf>
    800079fc:	00048513          	mv	a0,s1
    80007a00:	00000097          	auipc	ra,0x0
    80007a04:	028080e7          	jalr	40(ra) # 80007a28 <__printf>
    80007a08:	00002517          	auipc	a0,0x2
    80007a0c:	b6050513          	addi	a0,a0,-1184 # 80009568 <CONSOLE_STATUS+0x558>
    80007a10:	00000097          	auipc	ra,0x0
    80007a14:	018080e7          	jalr	24(ra) # 80007a28 <__printf>
    80007a18:	00100793          	li	a5,1
    80007a1c:	00004717          	auipc	a4,0x4
    80007a20:	12f72623          	sw	a5,300(a4) # 8000bb48 <panicked>
    80007a24:	0000006f          	j	80007a24 <panic+0x58>

0000000080007a28 <__printf>:
    80007a28:	f3010113          	addi	sp,sp,-208
    80007a2c:	08813023          	sd	s0,128(sp)
    80007a30:	07313423          	sd	s3,104(sp)
    80007a34:	09010413          	addi	s0,sp,144
    80007a38:	05813023          	sd	s8,64(sp)
    80007a3c:	08113423          	sd	ra,136(sp)
    80007a40:	06913c23          	sd	s1,120(sp)
    80007a44:	07213823          	sd	s2,112(sp)
    80007a48:	07413023          	sd	s4,96(sp)
    80007a4c:	05513c23          	sd	s5,88(sp)
    80007a50:	05613823          	sd	s6,80(sp)
    80007a54:	05713423          	sd	s7,72(sp)
    80007a58:	03913c23          	sd	s9,56(sp)
    80007a5c:	03a13823          	sd	s10,48(sp)
    80007a60:	03b13423          	sd	s11,40(sp)
    80007a64:	00005317          	auipc	t1,0x5
    80007a68:	48c30313          	addi	t1,t1,1164 # 8000cef0 <pr>
    80007a6c:	01832c03          	lw	s8,24(t1)
    80007a70:	00b43423          	sd	a1,8(s0)
    80007a74:	00c43823          	sd	a2,16(s0)
    80007a78:	00d43c23          	sd	a3,24(s0)
    80007a7c:	02e43023          	sd	a4,32(s0)
    80007a80:	02f43423          	sd	a5,40(s0)
    80007a84:	03043823          	sd	a6,48(s0)
    80007a88:	03143c23          	sd	a7,56(s0)
    80007a8c:	00050993          	mv	s3,a0
    80007a90:	4a0c1663          	bnez	s8,80007f3c <__printf+0x514>
    80007a94:	60098c63          	beqz	s3,800080ac <__printf+0x684>
    80007a98:	0009c503          	lbu	a0,0(s3)
    80007a9c:	00840793          	addi	a5,s0,8
    80007aa0:	f6f43c23          	sd	a5,-136(s0)
    80007aa4:	00000493          	li	s1,0
    80007aa8:	22050063          	beqz	a0,80007cc8 <__printf+0x2a0>
    80007aac:	00002a37          	lui	s4,0x2
    80007ab0:	00018ab7          	lui	s5,0x18
    80007ab4:	000f4b37          	lui	s6,0xf4
    80007ab8:	00989bb7          	lui	s7,0x989
    80007abc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80007ac0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80007ac4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80007ac8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80007acc:	00148c9b          	addiw	s9,s1,1
    80007ad0:	02500793          	li	a5,37
    80007ad4:	01998933          	add	s2,s3,s9
    80007ad8:	38f51263          	bne	a0,a5,80007e5c <__printf+0x434>
    80007adc:	00094783          	lbu	a5,0(s2)
    80007ae0:	00078c9b          	sext.w	s9,a5
    80007ae4:	1e078263          	beqz	a5,80007cc8 <__printf+0x2a0>
    80007ae8:	0024849b          	addiw	s1,s1,2
    80007aec:	07000713          	li	a4,112
    80007af0:	00998933          	add	s2,s3,s1
    80007af4:	38e78a63          	beq	a5,a4,80007e88 <__printf+0x460>
    80007af8:	20f76863          	bltu	a4,a5,80007d08 <__printf+0x2e0>
    80007afc:	42a78863          	beq	a5,a0,80007f2c <__printf+0x504>
    80007b00:	06400713          	li	a4,100
    80007b04:	40e79663          	bne	a5,a4,80007f10 <__printf+0x4e8>
    80007b08:	f7843783          	ld	a5,-136(s0)
    80007b0c:	0007a603          	lw	a2,0(a5)
    80007b10:	00878793          	addi	a5,a5,8
    80007b14:	f6f43c23          	sd	a5,-136(s0)
    80007b18:	42064a63          	bltz	a2,80007f4c <__printf+0x524>
    80007b1c:	00a00713          	li	a4,10
    80007b20:	02e677bb          	remuw	a5,a2,a4
    80007b24:	00002d97          	auipc	s11,0x2
    80007b28:	ce4d8d93          	addi	s11,s11,-796 # 80009808 <digits>
    80007b2c:	00900593          	li	a1,9
    80007b30:	0006051b          	sext.w	a0,a2
    80007b34:	00000c93          	li	s9,0
    80007b38:	02079793          	slli	a5,a5,0x20
    80007b3c:	0207d793          	srli	a5,a5,0x20
    80007b40:	00fd87b3          	add	a5,s11,a5
    80007b44:	0007c783          	lbu	a5,0(a5)
    80007b48:	02e656bb          	divuw	a3,a2,a4
    80007b4c:	f8f40023          	sb	a5,-128(s0)
    80007b50:	14c5d863          	bge	a1,a2,80007ca0 <__printf+0x278>
    80007b54:	06300593          	li	a1,99
    80007b58:	00100c93          	li	s9,1
    80007b5c:	02e6f7bb          	remuw	a5,a3,a4
    80007b60:	02079793          	slli	a5,a5,0x20
    80007b64:	0207d793          	srli	a5,a5,0x20
    80007b68:	00fd87b3          	add	a5,s11,a5
    80007b6c:	0007c783          	lbu	a5,0(a5)
    80007b70:	02e6d73b          	divuw	a4,a3,a4
    80007b74:	f8f400a3          	sb	a5,-127(s0)
    80007b78:	12a5f463          	bgeu	a1,a0,80007ca0 <__printf+0x278>
    80007b7c:	00a00693          	li	a3,10
    80007b80:	00900593          	li	a1,9
    80007b84:	02d777bb          	remuw	a5,a4,a3
    80007b88:	02079793          	slli	a5,a5,0x20
    80007b8c:	0207d793          	srli	a5,a5,0x20
    80007b90:	00fd87b3          	add	a5,s11,a5
    80007b94:	0007c503          	lbu	a0,0(a5)
    80007b98:	02d757bb          	divuw	a5,a4,a3
    80007b9c:	f8a40123          	sb	a0,-126(s0)
    80007ba0:	48e5f263          	bgeu	a1,a4,80008024 <__printf+0x5fc>
    80007ba4:	06300513          	li	a0,99
    80007ba8:	02d7f5bb          	remuw	a1,a5,a3
    80007bac:	02059593          	slli	a1,a1,0x20
    80007bb0:	0205d593          	srli	a1,a1,0x20
    80007bb4:	00bd85b3          	add	a1,s11,a1
    80007bb8:	0005c583          	lbu	a1,0(a1)
    80007bbc:	02d7d7bb          	divuw	a5,a5,a3
    80007bc0:	f8b401a3          	sb	a1,-125(s0)
    80007bc4:	48e57263          	bgeu	a0,a4,80008048 <__printf+0x620>
    80007bc8:	3e700513          	li	a0,999
    80007bcc:	02d7f5bb          	remuw	a1,a5,a3
    80007bd0:	02059593          	slli	a1,a1,0x20
    80007bd4:	0205d593          	srli	a1,a1,0x20
    80007bd8:	00bd85b3          	add	a1,s11,a1
    80007bdc:	0005c583          	lbu	a1,0(a1)
    80007be0:	02d7d7bb          	divuw	a5,a5,a3
    80007be4:	f8b40223          	sb	a1,-124(s0)
    80007be8:	46e57663          	bgeu	a0,a4,80008054 <__printf+0x62c>
    80007bec:	02d7f5bb          	remuw	a1,a5,a3
    80007bf0:	02059593          	slli	a1,a1,0x20
    80007bf4:	0205d593          	srli	a1,a1,0x20
    80007bf8:	00bd85b3          	add	a1,s11,a1
    80007bfc:	0005c583          	lbu	a1,0(a1)
    80007c00:	02d7d7bb          	divuw	a5,a5,a3
    80007c04:	f8b402a3          	sb	a1,-123(s0)
    80007c08:	46ea7863          	bgeu	s4,a4,80008078 <__printf+0x650>
    80007c0c:	02d7f5bb          	remuw	a1,a5,a3
    80007c10:	02059593          	slli	a1,a1,0x20
    80007c14:	0205d593          	srli	a1,a1,0x20
    80007c18:	00bd85b3          	add	a1,s11,a1
    80007c1c:	0005c583          	lbu	a1,0(a1)
    80007c20:	02d7d7bb          	divuw	a5,a5,a3
    80007c24:	f8b40323          	sb	a1,-122(s0)
    80007c28:	3eeaf863          	bgeu	s5,a4,80008018 <__printf+0x5f0>
    80007c2c:	02d7f5bb          	remuw	a1,a5,a3
    80007c30:	02059593          	slli	a1,a1,0x20
    80007c34:	0205d593          	srli	a1,a1,0x20
    80007c38:	00bd85b3          	add	a1,s11,a1
    80007c3c:	0005c583          	lbu	a1,0(a1)
    80007c40:	02d7d7bb          	divuw	a5,a5,a3
    80007c44:	f8b403a3          	sb	a1,-121(s0)
    80007c48:	42eb7e63          	bgeu	s6,a4,80008084 <__printf+0x65c>
    80007c4c:	02d7f5bb          	remuw	a1,a5,a3
    80007c50:	02059593          	slli	a1,a1,0x20
    80007c54:	0205d593          	srli	a1,a1,0x20
    80007c58:	00bd85b3          	add	a1,s11,a1
    80007c5c:	0005c583          	lbu	a1,0(a1)
    80007c60:	02d7d7bb          	divuw	a5,a5,a3
    80007c64:	f8b40423          	sb	a1,-120(s0)
    80007c68:	42ebfc63          	bgeu	s7,a4,800080a0 <__printf+0x678>
    80007c6c:	02079793          	slli	a5,a5,0x20
    80007c70:	0207d793          	srli	a5,a5,0x20
    80007c74:	00fd8db3          	add	s11,s11,a5
    80007c78:	000dc703          	lbu	a4,0(s11)
    80007c7c:	00a00793          	li	a5,10
    80007c80:	00900c93          	li	s9,9
    80007c84:	f8e404a3          	sb	a4,-119(s0)
    80007c88:	00065c63          	bgez	a2,80007ca0 <__printf+0x278>
    80007c8c:	f9040713          	addi	a4,s0,-112
    80007c90:	00f70733          	add	a4,a4,a5
    80007c94:	02d00693          	li	a3,45
    80007c98:	fed70823          	sb	a3,-16(a4)
    80007c9c:	00078c93          	mv	s9,a5
    80007ca0:	f8040793          	addi	a5,s0,-128
    80007ca4:	01978cb3          	add	s9,a5,s9
    80007ca8:	f7f40d13          	addi	s10,s0,-129
    80007cac:	000cc503          	lbu	a0,0(s9)
    80007cb0:	fffc8c93          	addi	s9,s9,-1
    80007cb4:	00000097          	auipc	ra,0x0
    80007cb8:	b90080e7          	jalr	-1136(ra) # 80007844 <consputc>
    80007cbc:	ffac98e3          	bne	s9,s10,80007cac <__printf+0x284>
    80007cc0:	00094503          	lbu	a0,0(s2)
    80007cc4:	e00514e3          	bnez	a0,80007acc <__printf+0xa4>
    80007cc8:	1a0c1663          	bnez	s8,80007e74 <__printf+0x44c>
    80007ccc:	08813083          	ld	ra,136(sp)
    80007cd0:	08013403          	ld	s0,128(sp)
    80007cd4:	07813483          	ld	s1,120(sp)
    80007cd8:	07013903          	ld	s2,112(sp)
    80007cdc:	06813983          	ld	s3,104(sp)
    80007ce0:	06013a03          	ld	s4,96(sp)
    80007ce4:	05813a83          	ld	s5,88(sp)
    80007ce8:	05013b03          	ld	s6,80(sp)
    80007cec:	04813b83          	ld	s7,72(sp)
    80007cf0:	04013c03          	ld	s8,64(sp)
    80007cf4:	03813c83          	ld	s9,56(sp)
    80007cf8:	03013d03          	ld	s10,48(sp)
    80007cfc:	02813d83          	ld	s11,40(sp)
    80007d00:	0d010113          	addi	sp,sp,208
    80007d04:	00008067          	ret
    80007d08:	07300713          	li	a4,115
    80007d0c:	1ce78a63          	beq	a5,a4,80007ee0 <__printf+0x4b8>
    80007d10:	07800713          	li	a4,120
    80007d14:	1ee79e63          	bne	a5,a4,80007f10 <__printf+0x4e8>
    80007d18:	f7843783          	ld	a5,-136(s0)
    80007d1c:	0007a703          	lw	a4,0(a5)
    80007d20:	00878793          	addi	a5,a5,8
    80007d24:	f6f43c23          	sd	a5,-136(s0)
    80007d28:	28074263          	bltz	a4,80007fac <__printf+0x584>
    80007d2c:	00002d97          	auipc	s11,0x2
    80007d30:	adcd8d93          	addi	s11,s11,-1316 # 80009808 <digits>
    80007d34:	00f77793          	andi	a5,a4,15
    80007d38:	00fd87b3          	add	a5,s11,a5
    80007d3c:	0007c683          	lbu	a3,0(a5)
    80007d40:	00f00613          	li	a2,15
    80007d44:	0007079b          	sext.w	a5,a4
    80007d48:	f8d40023          	sb	a3,-128(s0)
    80007d4c:	0047559b          	srliw	a1,a4,0x4
    80007d50:	0047569b          	srliw	a3,a4,0x4
    80007d54:	00000c93          	li	s9,0
    80007d58:	0ee65063          	bge	a2,a4,80007e38 <__printf+0x410>
    80007d5c:	00f6f693          	andi	a3,a3,15
    80007d60:	00dd86b3          	add	a3,s11,a3
    80007d64:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80007d68:	0087d79b          	srliw	a5,a5,0x8
    80007d6c:	00100c93          	li	s9,1
    80007d70:	f8d400a3          	sb	a3,-127(s0)
    80007d74:	0cb67263          	bgeu	a2,a1,80007e38 <__printf+0x410>
    80007d78:	00f7f693          	andi	a3,a5,15
    80007d7c:	00dd86b3          	add	a3,s11,a3
    80007d80:	0006c583          	lbu	a1,0(a3)
    80007d84:	00f00613          	li	a2,15
    80007d88:	0047d69b          	srliw	a3,a5,0x4
    80007d8c:	f8b40123          	sb	a1,-126(s0)
    80007d90:	0047d593          	srli	a1,a5,0x4
    80007d94:	28f67e63          	bgeu	a2,a5,80008030 <__printf+0x608>
    80007d98:	00f6f693          	andi	a3,a3,15
    80007d9c:	00dd86b3          	add	a3,s11,a3
    80007da0:	0006c503          	lbu	a0,0(a3)
    80007da4:	0087d813          	srli	a6,a5,0x8
    80007da8:	0087d69b          	srliw	a3,a5,0x8
    80007dac:	f8a401a3          	sb	a0,-125(s0)
    80007db0:	28b67663          	bgeu	a2,a1,8000803c <__printf+0x614>
    80007db4:	00f6f693          	andi	a3,a3,15
    80007db8:	00dd86b3          	add	a3,s11,a3
    80007dbc:	0006c583          	lbu	a1,0(a3)
    80007dc0:	00c7d513          	srli	a0,a5,0xc
    80007dc4:	00c7d69b          	srliw	a3,a5,0xc
    80007dc8:	f8b40223          	sb	a1,-124(s0)
    80007dcc:	29067a63          	bgeu	a2,a6,80008060 <__printf+0x638>
    80007dd0:	00f6f693          	andi	a3,a3,15
    80007dd4:	00dd86b3          	add	a3,s11,a3
    80007dd8:	0006c583          	lbu	a1,0(a3)
    80007ddc:	0107d813          	srli	a6,a5,0x10
    80007de0:	0107d69b          	srliw	a3,a5,0x10
    80007de4:	f8b402a3          	sb	a1,-123(s0)
    80007de8:	28a67263          	bgeu	a2,a0,8000806c <__printf+0x644>
    80007dec:	00f6f693          	andi	a3,a3,15
    80007df0:	00dd86b3          	add	a3,s11,a3
    80007df4:	0006c683          	lbu	a3,0(a3)
    80007df8:	0147d79b          	srliw	a5,a5,0x14
    80007dfc:	f8d40323          	sb	a3,-122(s0)
    80007e00:	21067663          	bgeu	a2,a6,8000800c <__printf+0x5e4>
    80007e04:	02079793          	slli	a5,a5,0x20
    80007e08:	0207d793          	srli	a5,a5,0x20
    80007e0c:	00fd8db3          	add	s11,s11,a5
    80007e10:	000dc683          	lbu	a3,0(s11)
    80007e14:	00800793          	li	a5,8
    80007e18:	00700c93          	li	s9,7
    80007e1c:	f8d403a3          	sb	a3,-121(s0)
    80007e20:	00075c63          	bgez	a4,80007e38 <__printf+0x410>
    80007e24:	f9040713          	addi	a4,s0,-112
    80007e28:	00f70733          	add	a4,a4,a5
    80007e2c:	02d00693          	li	a3,45
    80007e30:	fed70823          	sb	a3,-16(a4)
    80007e34:	00078c93          	mv	s9,a5
    80007e38:	f8040793          	addi	a5,s0,-128
    80007e3c:	01978cb3          	add	s9,a5,s9
    80007e40:	f7f40d13          	addi	s10,s0,-129
    80007e44:	000cc503          	lbu	a0,0(s9)
    80007e48:	fffc8c93          	addi	s9,s9,-1
    80007e4c:	00000097          	auipc	ra,0x0
    80007e50:	9f8080e7          	jalr	-1544(ra) # 80007844 <consputc>
    80007e54:	ff9d18e3          	bne	s10,s9,80007e44 <__printf+0x41c>
    80007e58:	0100006f          	j	80007e68 <__printf+0x440>
    80007e5c:	00000097          	auipc	ra,0x0
    80007e60:	9e8080e7          	jalr	-1560(ra) # 80007844 <consputc>
    80007e64:	000c8493          	mv	s1,s9
    80007e68:	00094503          	lbu	a0,0(s2)
    80007e6c:	c60510e3          	bnez	a0,80007acc <__printf+0xa4>
    80007e70:	e40c0ee3          	beqz	s8,80007ccc <__printf+0x2a4>
    80007e74:	00005517          	auipc	a0,0x5
    80007e78:	07c50513          	addi	a0,a0,124 # 8000cef0 <pr>
    80007e7c:	00001097          	auipc	ra,0x1
    80007e80:	94c080e7          	jalr	-1716(ra) # 800087c8 <release>
    80007e84:	e49ff06f          	j	80007ccc <__printf+0x2a4>
    80007e88:	f7843783          	ld	a5,-136(s0)
    80007e8c:	03000513          	li	a0,48
    80007e90:	01000d13          	li	s10,16
    80007e94:	00878713          	addi	a4,a5,8
    80007e98:	0007bc83          	ld	s9,0(a5)
    80007e9c:	f6e43c23          	sd	a4,-136(s0)
    80007ea0:	00000097          	auipc	ra,0x0
    80007ea4:	9a4080e7          	jalr	-1628(ra) # 80007844 <consputc>
    80007ea8:	07800513          	li	a0,120
    80007eac:	00000097          	auipc	ra,0x0
    80007eb0:	998080e7          	jalr	-1640(ra) # 80007844 <consputc>
    80007eb4:	00002d97          	auipc	s11,0x2
    80007eb8:	954d8d93          	addi	s11,s11,-1708 # 80009808 <digits>
    80007ebc:	03ccd793          	srli	a5,s9,0x3c
    80007ec0:	00fd87b3          	add	a5,s11,a5
    80007ec4:	0007c503          	lbu	a0,0(a5)
    80007ec8:	fffd0d1b          	addiw	s10,s10,-1
    80007ecc:	004c9c93          	slli	s9,s9,0x4
    80007ed0:	00000097          	auipc	ra,0x0
    80007ed4:	974080e7          	jalr	-1676(ra) # 80007844 <consputc>
    80007ed8:	fe0d12e3          	bnez	s10,80007ebc <__printf+0x494>
    80007edc:	f8dff06f          	j	80007e68 <__printf+0x440>
    80007ee0:	f7843783          	ld	a5,-136(s0)
    80007ee4:	0007bc83          	ld	s9,0(a5)
    80007ee8:	00878793          	addi	a5,a5,8
    80007eec:	f6f43c23          	sd	a5,-136(s0)
    80007ef0:	000c9a63          	bnez	s9,80007f04 <__printf+0x4dc>
    80007ef4:	1080006f          	j	80007ffc <__printf+0x5d4>
    80007ef8:	001c8c93          	addi	s9,s9,1
    80007efc:	00000097          	auipc	ra,0x0
    80007f00:	948080e7          	jalr	-1720(ra) # 80007844 <consputc>
    80007f04:	000cc503          	lbu	a0,0(s9)
    80007f08:	fe0518e3          	bnez	a0,80007ef8 <__printf+0x4d0>
    80007f0c:	f5dff06f          	j	80007e68 <__printf+0x440>
    80007f10:	02500513          	li	a0,37
    80007f14:	00000097          	auipc	ra,0x0
    80007f18:	930080e7          	jalr	-1744(ra) # 80007844 <consputc>
    80007f1c:	000c8513          	mv	a0,s9
    80007f20:	00000097          	auipc	ra,0x0
    80007f24:	924080e7          	jalr	-1756(ra) # 80007844 <consputc>
    80007f28:	f41ff06f          	j	80007e68 <__printf+0x440>
    80007f2c:	02500513          	li	a0,37
    80007f30:	00000097          	auipc	ra,0x0
    80007f34:	914080e7          	jalr	-1772(ra) # 80007844 <consputc>
    80007f38:	f31ff06f          	j	80007e68 <__printf+0x440>
    80007f3c:	00030513          	mv	a0,t1
    80007f40:	00000097          	auipc	ra,0x0
    80007f44:	7bc080e7          	jalr	1980(ra) # 800086fc <acquire>
    80007f48:	b4dff06f          	j	80007a94 <__printf+0x6c>
    80007f4c:	40c0053b          	negw	a0,a2
    80007f50:	00a00713          	li	a4,10
    80007f54:	02e576bb          	remuw	a3,a0,a4
    80007f58:	00002d97          	auipc	s11,0x2
    80007f5c:	8b0d8d93          	addi	s11,s11,-1872 # 80009808 <digits>
    80007f60:	ff700593          	li	a1,-9
    80007f64:	02069693          	slli	a3,a3,0x20
    80007f68:	0206d693          	srli	a3,a3,0x20
    80007f6c:	00dd86b3          	add	a3,s11,a3
    80007f70:	0006c683          	lbu	a3,0(a3)
    80007f74:	02e557bb          	divuw	a5,a0,a4
    80007f78:	f8d40023          	sb	a3,-128(s0)
    80007f7c:	10b65e63          	bge	a2,a1,80008098 <__printf+0x670>
    80007f80:	06300593          	li	a1,99
    80007f84:	02e7f6bb          	remuw	a3,a5,a4
    80007f88:	02069693          	slli	a3,a3,0x20
    80007f8c:	0206d693          	srli	a3,a3,0x20
    80007f90:	00dd86b3          	add	a3,s11,a3
    80007f94:	0006c683          	lbu	a3,0(a3)
    80007f98:	02e7d73b          	divuw	a4,a5,a4
    80007f9c:	00200793          	li	a5,2
    80007fa0:	f8d400a3          	sb	a3,-127(s0)
    80007fa4:	bca5ece3          	bltu	a1,a0,80007b7c <__printf+0x154>
    80007fa8:	ce5ff06f          	j	80007c8c <__printf+0x264>
    80007fac:	40e007bb          	negw	a5,a4
    80007fb0:	00002d97          	auipc	s11,0x2
    80007fb4:	858d8d93          	addi	s11,s11,-1960 # 80009808 <digits>
    80007fb8:	00f7f693          	andi	a3,a5,15
    80007fbc:	00dd86b3          	add	a3,s11,a3
    80007fc0:	0006c583          	lbu	a1,0(a3)
    80007fc4:	ff100613          	li	a2,-15
    80007fc8:	0047d69b          	srliw	a3,a5,0x4
    80007fcc:	f8b40023          	sb	a1,-128(s0)
    80007fd0:	0047d59b          	srliw	a1,a5,0x4
    80007fd4:	0ac75e63          	bge	a4,a2,80008090 <__printf+0x668>
    80007fd8:	00f6f693          	andi	a3,a3,15
    80007fdc:	00dd86b3          	add	a3,s11,a3
    80007fe0:	0006c603          	lbu	a2,0(a3)
    80007fe4:	00f00693          	li	a3,15
    80007fe8:	0087d79b          	srliw	a5,a5,0x8
    80007fec:	f8c400a3          	sb	a2,-127(s0)
    80007ff0:	d8b6e4e3          	bltu	a3,a1,80007d78 <__printf+0x350>
    80007ff4:	00200793          	li	a5,2
    80007ff8:	e2dff06f          	j	80007e24 <__printf+0x3fc>
    80007ffc:	00001c97          	auipc	s9,0x1
    80008000:	7ecc8c93          	addi	s9,s9,2028 # 800097e8 <CONSOLE_STATUS+0x7d8>
    80008004:	02800513          	li	a0,40
    80008008:	ef1ff06f          	j	80007ef8 <__printf+0x4d0>
    8000800c:	00700793          	li	a5,7
    80008010:	00600c93          	li	s9,6
    80008014:	e0dff06f          	j	80007e20 <__printf+0x3f8>
    80008018:	00700793          	li	a5,7
    8000801c:	00600c93          	li	s9,6
    80008020:	c69ff06f          	j	80007c88 <__printf+0x260>
    80008024:	00300793          	li	a5,3
    80008028:	00200c93          	li	s9,2
    8000802c:	c5dff06f          	j	80007c88 <__printf+0x260>
    80008030:	00300793          	li	a5,3
    80008034:	00200c93          	li	s9,2
    80008038:	de9ff06f          	j	80007e20 <__printf+0x3f8>
    8000803c:	00400793          	li	a5,4
    80008040:	00300c93          	li	s9,3
    80008044:	dddff06f          	j	80007e20 <__printf+0x3f8>
    80008048:	00400793          	li	a5,4
    8000804c:	00300c93          	li	s9,3
    80008050:	c39ff06f          	j	80007c88 <__printf+0x260>
    80008054:	00500793          	li	a5,5
    80008058:	00400c93          	li	s9,4
    8000805c:	c2dff06f          	j	80007c88 <__printf+0x260>
    80008060:	00500793          	li	a5,5
    80008064:	00400c93          	li	s9,4
    80008068:	db9ff06f          	j	80007e20 <__printf+0x3f8>
    8000806c:	00600793          	li	a5,6
    80008070:	00500c93          	li	s9,5
    80008074:	dadff06f          	j	80007e20 <__printf+0x3f8>
    80008078:	00600793          	li	a5,6
    8000807c:	00500c93          	li	s9,5
    80008080:	c09ff06f          	j	80007c88 <__printf+0x260>
    80008084:	00800793          	li	a5,8
    80008088:	00700c93          	li	s9,7
    8000808c:	bfdff06f          	j	80007c88 <__printf+0x260>
    80008090:	00100793          	li	a5,1
    80008094:	d91ff06f          	j	80007e24 <__printf+0x3fc>
    80008098:	00100793          	li	a5,1
    8000809c:	bf1ff06f          	j	80007c8c <__printf+0x264>
    800080a0:	00900793          	li	a5,9
    800080a4:	00800c93          	li	s9,8
    800080a8:	be1ff06f          	j	80007c88 <__printf+0x260>
    800080ac:	00001517          	auipc	a0,0x1
    800080b0:	74450513          	addi	a0,a0,1860 # 800097f0 <CONSOLE_STATUS+0x7e0>
    800080b4:	00000097          	auipc	ra,0x0
    800080b8:	918080e7          	jalr	-1768(ra) # 800079cc <panic>

00000000800080bc <printfinit>:
    800080bc:	fe010113          	addi	sp,sp,-32
    800080c0:	00813823          	sd	s0,16(sp)
    800080c4:	00913423          	sd	s1,8(sp)
    800080c8:	00113c23          	sd	ra,24(sp)
    800080cc:	02010413          	addi	s0,sp,32
    800080d0:	00005497          	auipc	s1,0x5
    800080d4:	e2048493          	addi	s1,s1,-480 # 8000cef0 <pr>
    800080d8:	00048513          	mv	a0,s1
    800080dc:	00001597          	auipc	a1,0x1
    800080e0:	72458593          	addi	a1,a1,1828 # 80009800 <CONSOLE_STATUS+0x7f0>
    800080e4:	00000097          	auipc	ra,0x0
    800080e8:	5f4080e7          	jalr	1524(ra) # 800086d8 <initlock>
    800080ec:	01813083          	ld	ra,24(sp)
    800080f0:	01013403          	ld	s0,16(sp)
    800080f4:	0004ac23          	sw	zero,24(s1)
    800080f8:	00813483          	ld	s1,8(sp)
    800080fc:	02010113          	addi	sp,sp,32
    80008100:	00008067          	ret

0000000080008104 <uartinit>:
    80008104:	ff010113          	addi	sp,sp,-16
    80008108:	00813423          	sd	s0,8(sp)
    8000810c:	01010413          	addi	s0,sp,16
    80008110:	100007b7          	lui	a5,0x10000
    80008114:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80008118:	f8000713          	li	a4,-128
    8000811c:	00e781a3          	sb	a4,3(a5)
    80008120:	00300713          	li	a4,3
    80008124:	00e78023          	sb	a4,0(a5)
    80008128:	000780a3          	sb	zero,1(a5)
    8000812c:	00e781a3          	sb	a4,3(a5)
    80008130:	00700693          	li	a3,7
    80008134:	00d78123          	sb	a3,2(a5)
    80008138:	00e780a3          	sb	a4,1(a5)
    8000813c:	00813403          	ld	s0,8(sp)
    80008140:	01010113          	addi	sp,sp,16
    80008144:	00008067          	ret

0000000080008148 <uartputc>:
    80008148:	00004797          	auipc	a5,0x4
    8000814c:	a007a783          	lw	a5,-1536(a5) # 8000bb48 <panicked>
    80008150:	00078463          	beqz	a5,80008158 <uartputc+0x10>
    80008154:	0000006f          	j	80008154 <uartputc+0xc>
    80008158:	fd010113          	addi	sp,sp,-48
    8000815c:	02813023          	sd	s0,32(sp)
    80008160:	00913c23          	sd	s1,24(sp)
    80008164:	01213823          	sd	s2,16(sp)
    80008168:	01313423          	sd	s3,8(sp)
    8000816c:	02113423          	sd	ra,40(sp)
    80008170:	03010413          	addi	s0,sp,48
    80008174:	00004917          	auipc	s2,0x4
    80008178:	9dc90913          	addi	s2,s2,-1572 # 8000bb50 <uart_tx_r>
    8000817c:	00093783          	ld	a5,0(s2)
    80008180:	00004497          	auipc	s1,0x4
    80008184:	9d848493          	addi	s1,s1,-1576 # 8000bb58 <uart_tx_w>
    80008188:	0004b703          	ld	a4,0(s1)
    8000818c:	02078693          	addi	a3,a5,32
    80008190:	00050993          	mv	s3,a0
    80008194:	02e69c63          	bne	a3,a4,800081cc <uartputc+0x84>
    80008198:	00001097          	auipc	ra,0x1
    8000819c:	834080e7          	jalr	-1996(ra) # 800089cc <push_on>
    800081a0:	00093783          	ld	a5,0(s2)
    800081a4:	0004b703          	ld	a4,0(s1)
    800081a8:	02078793          	addi	a5,a5,32
    800081ac:	00e79463          	bne	a5,a4,800081b4 <uartputc+0x6c>
    800081b0:	0000006f          	j	800081b0 <uartputc+0x68>
    800081b4:	00001097          	auipc	ra,0x1
    800081b8:	88c080e7          	jalr	-1908(ra) # 80008a40 <pop_on>
    800081bc:	00093783          	ld	a5,0(s2)
    800081c0:	0004b703          	ld	a4,0(s1)
    800081c4:	02078693          	addi	a3,a5,32
    800081c8:	fce688e3          	beq	a3,a4,80008198 <uartputc+0x50>
    800081cc:	01f77693          	andi	a3,a4,31
    800081d0:	00005597          	auipc	a1,0x5
    800081d4:	d4058593          	addi	a1,a1,-704 # 8000cf10 <uart_tx_buf>
    800081d8:	00d586b3          	add	a3,a1,a3
    800081dc:	00170713          	addi	a4,a4,1
    800081e0:	01368023          	sb	s3,0(a3)
    800081e4:	00e4b023          	sd	a4,0(s1)
    800081e8:	10000637          	lui	a2,0x10000
    800081ec:	02f71063          	bne	a4,a5,8000820c <uartputc+0xc4>
    800081f0:	0340006f          	j	80008224 <uartputc+0xdc>
    800081f4:	00074703          	lbu	a4,0(a4)
    800081f8:	00f93023          	sd	a5,0(s2)
    800081fc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80008200:	00093783          	ld	a5,0(s2)
    80008204:	0004b703          	ld	a4,0(s1)
    80008208:	00f70e63          	beq	a4,a5,80008224 <uartputc+0xdc>
    8000820c:	00564683          	lbu	a3,5(a2)
    80008210:	01f7f713          	andi	a4,a5,31
    80008214:	00e58733          	add	a4,a1,a4
    80008218:	0206f693          	andi	a3,a3,32
    8000821c:	00178793          	addi	a5,a5,1
    80008220:	fc069ae3          	bnez	a3,800081f4 <uartputc+0xac>
    80008224:	02813083          	ld	ra,40(sp)
    80008228:	02013403          	ld	s0,32(sp)
    8000822c:	01813483          	ld	s1,24(sp)
    80008230:	01013903          	ld	s2,16(sp)
    80008234:	00813983          	ld	s3,8(sp)
    80008238:	03010113          	addi	sp,sp,48
    8000823c:	00008067          	ret

0000000080008240 <uartputc_sync>:
    80008240:	ff010113          	addi	sp,sp,-16
    80008244:	00813423          	sd	s0,8(sp)
    80008248:	01010413          	addi	s0,sp,16
    8000824c:	00004717          	auipc	a4,0x4
    80008250:	8fc72703          	lw	a4,-1796(a4) # 8000bb48 <panicked>
    80008254:	02071663          	bnez	a4,80008280 <uartputc_sync+0x40>
    80008258:	00050793          	mv	a5,a0
    8000825c:	100006b7          	lui	a3,0x10000
    80008260:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80008264:	02077713          	andi	a4,a4,32
    80008268:	fe070ce3          	beqz	a4,80008260 <uartputc_sync+0x20>
    8000826c:	0ff7f793          	andi	a5,a5,255
    80008270:	00f68023          	sb	a5,0(a3)
    80008274:	00813403          	ld	s0,8(sp)
    80008278:	01010113          	addi	sp,sp,16
    8000827c:	00008067          	ret
    80008280:	0000006f          	j	80008280 <uartputc_sync+0x40>

0000000080008284 <uartstart>:
    80008284:	ff010113          	addi	sp,sp,-16
    80008288:	00813423          	sd	s0,8(sp)
    8000828c:	01010413          	addi	s0,sp,16
    80008290:	00004617          	auipc	a2,0x4
    80008294:	8c060613          	addi	a2,a2,-1856 # 8000bb50 <uart_tx_r>
    80008298:	00004517          	auipc	a0,0x4
    8000829c:	8c050513          	addi	a0,a0,-1856 # 8000bb58 <uart_tx_w>
    800082a0:	00063783          	ld	a5,0(a2)
    800082a4:	00053703          	ld	a4,0(a0)
    800082a8:	04f70263          	beq	a4,a5,800082ec <uartstart+0x68>
    800082ac:	100005b7          	lui	a1,0x10000
    800082b0:	00005817          	auipc	a6,0x5
    800082b4:	c6080813          	addi	a6,a6,-928 # 8000cf10 <uart_tx_buf>
    800082b8:	01c0006f          	j	800082d4 <uartstart+0x50>
    800082bc:	0006c703          	lbu	a4,0(a3)
    800082c0:	00f63023          	sd	a5,0(a2)
    800082c4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800082c8:	00063783          	ld	a5,0(a2)
    800082cc:	00053703          	ld	a4,0(a0)
    800082d0:	00f70e63          	beq	a4,a5,800082ec <uartstart+0x68>
    800082d4:	01f7f713          	andi	a4,a5,31
    800082d8:	00e806b3          	add	a3,a6,a4
    800082dc:	0055c703          	lbu	a4,5(a1)
    800082e0:	00178793          	addi	a5,a5,1
    800082e4:	02077713          	andi	a4,a4,32
    800082e8:	fc071ae3          	bnez	a4,800082bc <uartstart+0x38>
    800082ec:	00813403          	ld	s0,8(sp)
    800082f0:	01010113          	addi	sp,sp,16
    800082f4:	00008067          	ret

00000000800082f8 <uartgetc>:
    800082f8:	ff010113          	addi	sp,sp,-16
    800082fc:	00813423          	sd	s0,8(sp)
    80008300:	01010413          	addi	s0,sp,16
    80008304:	10000737          	lui	a4,0x10000
    80008308:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000830c:	0017f793          	andi	a5,a5,1
    80008310:	00078c63          	beqz	a5,80008328 <uartgetc+0x30>
    80008314:	00074503          	lbu	a0,0(a4)
    80008318:	0ff57513          	andi	a0,a0,255
    8000831c:	00813403          	ld	s0,8(sp)
    80008320:	01010113          	addi	sp,sp,16
    80008324:	00008067          	ret
    80008328:	fff00513          	li	a0,-1
    8000832c:	ff1ff06f          	j	8000831c <uartgetc+0x24>

0000000080008330 <uartintr>:
    80008330:	100007b7          	lui	a5,0x10000
    80008334:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80008338:	0017f793          	andi	a5,a5,1
    8000833c:	0a078463          	beqz	a5,800083e4 <uartintr+0xb4>
    80008340:	fe010113          	addi	sp,sp,-32
    80008344:	00813823          	sd	s0,16(sp)
    80008348:	00913423          	sd	s1,8(sp)
    8000834c:	00113c23          	sd	ra,24(sp)
    80008350:	02010413          	addi	s0,sp,32
    80008354:	100004b7          	lui	s1,0x10000
    80008358:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000835c:	0ff57513          	andi	a0,a0,255
    80008360:	fffff097          	auipc	ra,0xfffff
    80008364:	534080e7          	jalr	1332(ra) # 80007894 <consoleintr>
    80008368:	0054c783          	lbu	a5,5(s1)
    8000836c:	0017f793          	andi	a5,a5,1
    80008370:	fe0794e3          	bnez	a5,80008358 <uartintr+0x28>
    80008374:	00003617          	auipc	a2,0x3
    80008378:	7dc60613          	addi	a2,a2,2012 # 8000bb50 <uart_tx_r>
    8000837c:	00003517          	auipc	a0,0x3
    80008380:	7dc50513          	addi	a0,a0,2012 # 8000bb58 <uart_tx_w>
    80008384:	00063783          	ld	a5,0(a2)
    80008388:	00053703          	ld	a4,0(a0)
    8000838c:	04f70263          	beq	a4,a5,800083d0 <uartintr+0xa0>
    80008390:	100005b7          	lui	a1,0x10000
    80008394:	00005817          	auipc	a6,0x5
    80008398:	b7c80813          	addi	a6,a6,-1156 # 8000cf10 <uart_tx_buf>
    8000839c:	01c0006f          	j	800083b8 <uartintr+0x88>
    800083a0:	0006c703          	lbu	a4,0(a3)
    800083a4:	00f63023          	sd	a5,0(a2)
    800083a8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800083ac:	00063783          	ld	a5,0(a2)
    800083b0:	00053703          	ld	a4,0(a0)
    800083b4:	00f70e63          	beq	a4,a5,800083d0 <uartintr+0xa0>
    800083b8:	01f7f713          	andi	a4,a5,31
    800083bc:	00e806b3          	add	a3,a6,a4
    800083c0:	0055c703          	lbu	a4,5(a1)
    800083c4:	00178793          	addi	a5,a5,1
    800083c8:	02077713          	andi	a4,a4,32
    800083cc:	fc071ae3          	bnez	a4,800083a0 <uartintr+0x70>
    800083d0:	01813083          	ld	ra,24(sp)
    800083d4:	01013403          	ld	s0,16(sp)
    800083d8:	00813483          	ld	s1,8(sp)
    800083dc:	02010113          	addi	sp,sp,32
    800083e0:	00008067          	ret
    800083e4:	00003617          	auipc	a2,0x3
    800083e8:	76c60613          	addi	a2,a2,1900 # 8000bb50 <uart_tx_r>
    800083ec:	00003517          	auipc	a0,0x3
    800083f0:	76c50513          	addi	a0,a0,1900 # 8000bb58 <uart_tx_w>
    800083f4:	00063783          	ld	a5,0(a2)
    800083f8:	00053703          	ld	a4,0(a0)
    800083fc:	04f70263          	beq	a4,a5,80008440 <uartintr+0x110>
    80008400:	100005b7          	lui	a1,0x10000
    80008404:	00005817          	auipc	a6,0x5
    80008408:	b0c80813          	addi	a6,a6,-1268 # 8000cf10 <uart_tx_buf>
    8000840c:	01c0006f          	j	80008428 <uartintr+0xf8>
    80008410:	0006c703          	lbu	a4,0(a3)
    80008414:	00f63023          	sd	a5,0(a2)
    80008418:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000841c:	00063783          	ld	a5,0(a2)
    80008420:	00053703          	ld	a4,0(a0)
    80008424:	02f70063          	beq	a4,a5,80008444 <uartintr+0x114>
    80008428:	01f7f713          	andi	a4,a5,31
    8000842c:	00e806b3          	add	a3,a6,a4
    80008430:	0055c703          	lbu	a4,5(a1)
    80008434:	00178793          	addi	a5,a5,1
    80008438:	02077713          	andi	a4,a4,32
    8000843c:	fc071ae3          	bnez	a4,80008410 <uartintr+0xe0>
    80008440:	00008067          	ret
    80008444:	00008067          	ret

0000000080008448 <kinit>:
    80008448:	fc010113          	addi	sp,sp,-64
    8000844c:	02913423          	sd	s1,40(sp)
    80008450:	fffff7b7          	lui	a5,0xfffff
    80008454:	00006497          	auipc	s1,0x6
    80008458:	adb48493          	addi	s1,s1,-1317 # 8000df2f <end+0xfff>
    8000845c:	02813823          	sd	s0,48(sp)
    80008460:	01313c23          	sd	s3,24(sp)
    80008464:	00f4f4b3          	and	s1,s1,a5
    80008468:	02113c23          	sd	ra,56(sp)
    8000846c:	03213023          	sd	s2,32(sp)
    80008470:	01413823          	sd	s4,16(sp)
    80008474:	01513423          	sd	s5,8(sp)
    80008478:	04010413          	addi	s0,sp,64
    8000847c:	000017b7          	lui	a5,0x1
    80008480:	01100993          	li	s3,17
    80008484:	00f487b3          	add	a5,s1,a5
    80008488:	01b99993          	slli	s3,s3,0x1b
    8000848c:	06f9e063          	bltu	s3,a5,800084ec <kinit+0xa4>
    80008490:	00005a97          	auipc	s5,0x5
    80008494:	aa0a8a93          	addi	s5,s5,-1376 # 8000cf30 <end>
    80008498:	0754ec63          	bltu	s1,s5,80008510 <kinit+0xc8>
    8000849c:	0734fa63          	bgeu	s1,s3,80008510 <kinit+0xc8>
    800084a0:	00088a37          	lui	s4,0x88
    800084a4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800084a8:	00003917          	auipc	s2,0x3
    800084ac:	6b890913          	addi	s2,s2,1720 # 8000bb60 <kmem>
    800084b0:	00ca1a13          	slli	s4,s4,0xc
    800084b4:	0140006f          	j	800084c8 <kinit+0x80>
    800084b8:	000017b7          	lui	a5,0x1
    800084bc:	00f484b3          	add	s1,s1,a5
    800084c0:	0554e863          	bltu	s1,s5,80008510 <kinit+0xc8>
    800084c4:	0534f663          	bgeu	s1,s3,80008510 <kinit+0xc8>
    800084c8:	00001637          	lui	a2,0x1
    800084cc:	00100593          	li	a1,1
    800084d0:	00048513          	mv	a0,s1
    800084d4:	00000097          	auipc	ra,0x0
    800084d8:	5e4080e7          	jalr	1508(ra) # 80008ab8 <__memset>
    800084dc:	00093783          	ld	a5,0(s2)
    800084e0:	00f4b023          	sd	a5,0(s1)
    800084e4:	00993023          	sd	s1,0(s2)
    800084e8:	fd4498e3          	bne	s1,s4,800084b8 <kinit+0x70>
    800084ec:	03813083          	ld	ra,56(sp)
    800084f0:	03013403          	ld	s0,48(sp)
    800084f4:	02813483          	ld	s1,40(sp)
    800084f8:	02013903          	ld	s2,32(sp)
    800084fc:	01813983          	ld	s3,24(sp)
    80008500:	01013a03          	ld	s4,16(sp)
    80008504:	00813a83          	ld	s5,8(sp)
    80008508:	04010113          	addi	sp,sp,64
    8000850c:	00008067          	ret
    80008510:	00001517          	auipc	a0,0x1
    80008514:	31050513          	addi	a0,a0,784 # 80009820 <digits+0x18>
    80008518:	fffff097          	auipc	ra,0xfffff
    8000851c:	4b4080e7          	jalr	1204(ra) # 800079cc <panic>

0000000080008520 <freerange>:
    80008520:	fc010113          	addi	sp,sp,-64
    80008524:	000017b7          	lui	a5,0x1
    80008528:	02913423          	sd	s1,40(sp)
    8000852c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80008530:	009504b3          	add	s1,a0,s1
    80008534:	fffff537          	lui	a0,0xfffff
    80008538:	02813823          	sd	s0,48(sp)
    8000853c:	02113c23          	sd	ra,56(sp)
    80008540:	03213023          	sd	s2,32(sp)
    80008544:	01313c23          	sd	s3,24(sp)
    80008548:	01413823          	sd	s4,16(sp)
    8000854c:	01513423          	sd	s5,8(sp)
    80008550:	01613023          	sd	s6,0(sp)
    80008554:	04010413          	addi	s0,sp,64
    80008558:	00a4f4b3          	and	s1,s1,a0
    8000855c:	00f487b3          	add	a5,s1,a5
    80008560:	06f5e463          	bltu	a1,a5,800085c8 <freerange+0xa8>
    80008564:	00005a97          	auipc	s5,0x5
    80008568:	9cca8a93          	addi	s5,s5,-1588 # 8000cf30 <end>
    8000856c:	0954e263          	bltu	s1,s5,800085f0 <freerange+0xd0>
    80008570:	01100993          	li	s3,17
    80008574:	01b99993          	slli	s3,s3,0x1b
    80008578:	0734fc63          	bgeu	s1,s3,800085f0 <freerange+0xd0>
    8000857c:	00058a13          	mv	s4,a1
    80008580:	00003917          	auipc	s2,0x3
    80008584:	5e090913          	addi	s2,s2,1504 # 8000bb60 <kmem>
    80008588:	00002b37          	lui	s6,0x2
    8000858c:	0140006f          	j	800085a0 <freerange+0x80>
    80008590:	000017b7          	lui	a5,0x1
    80008594:	00f484b3          	add	s1,s1,a5
    80008598:	0554ec63          	bltu	s1,s5,800085f0 <freerange+0xd0>
    8000859c:	0534fa63          	bgeu	s1,s3,800085f0 <freerange+0xd0>
    800085a0:	00001637          	lui	a2,0x1
    800085a4:	00100593          	li	a1,1
    800085a8:	00048513          	mv	a0,s1
    800085ac:	00000097          	auipc	ra,0x0
    800085b0:	50c080e7          	jalr	1292(ra) # 80008ab8 <__memset>
    800085b4:	00093703          	ld	a4,0(s2)
    800085b8:	016487b3          	add	a5,s1,s6
    800085bc:	00e4b023          	sd	a4,0(s1)
    800085c0:	00993023          	sd	s1,0(s2)
    800085c4:	fcfa76e3          	bgeu	s4,a5,80008590 <freerange+0x70>
    800085c8:	03813083          	ld	ra,56(sp)
    800085cc:	03013403          	ld	s0,48(sp)
    800085d0:	02813483          	ld	s1,40(sp)
    800085d4:	02013903          	ld	s2,32(sp)
    800085d8:	01813983          	ld	s3,24(sp)
    800085dc:	01013a03          	ld	s4,16(sp)
    800085e0:	00813a83          	ld	s5,8(sp)
    800085e4:	00013b03          	ld	s6,0(sp)
    800085e8:	04010113          	addi	sp,sp,64
    800085ec:	00008067          	ret
    800085f0:	00001517          	auipc	a0,0x1
    800085f4:	23050513          	addi	a0,a0,560 # 80009820 <digits+0x18>
    800085f8:	fffff097          	auipc	ra,0xfffff
    800085fc:	3d4080e7          	jalr	980(ra) # 800079cc <panic>

0000000080008600 <kfree>:
    80008600:	fe010113          	addi	sp,sp,-32
    80008604:	00813823          	sd	s0,16(sp)
    80008608:	00113c23          	sd	ra,24(sp)
    8000860c:	00913423          	sd	s1,8(sp)
    80008610:	02010413          	addi	s0,sp,32
    80008614:	03451793          	slli	a5,a0,0x34
    80008618:	04079c63          	bnez	a5,80008670 <kfree+0x70>
    8000861c:	00005797          	auipc	a5,0x5
    80008620:	91478793          	addi	a5,a5,-1772 # 8000cf30 <end>
    80008624:	00050493          	mv	s1,a0
    80008628:	04f56463          	bltu	a0,a5,80008670 <kfree+0x70>
    8000862c:	01100793          	li	a5,17
    80008630:	01b79793          	slli	a5,a5,0x1b
    80008634:	02f57e63          	bgeu	a0,a5,80008670 <kfree+0x70>
    80008638:	00001637          	lui	a2,0x1
    8000863c:	00100593          	li	a1,1
    80008640:	00000097          	auipc	ra,0x0
    80008644:	478080e7          	jalr	1144(ra) # 80008ab8 <__memset>
    80008648:	00003797          	auipc	a5,0x3
    8000864c:	51878793          	addi	a5,a5,1304 # 8000bb60 <kmem>
    80008650:	0007b703          	ld	a4,0(a5)
    80008654:	01813083          	ld	ra,24(sp)
    80008658:	01013403          	ld	s0,16(sp)
    8000865c:	00e4b023          	sd	a4,0(s1)
    80008660:	0097b023          	sd	s1,0(a5)
    80008664:	00813483          	ld	s1,8(sp)
    80008668:	02010113          	addi	sp,sp,32
    8000866c:	00008067          	ret
    80008670:	00001517          	auipc	a0,0x1
    80008674:	1b050513          	addi	a0,a0,432 # 80009820 <digits+0x18>
    80008678:	fffff097          	auipc	ra,0xfffff
    8000867c:	354080e7          	jalr	852(ra) # 800079cc <panic>

0000000080008680 <kalloc>:
    80008680:	fe010113          	addi	sp,sp,-32
    80008684:	00813823          	sd	s0,16(sp)
    80008688:	00913423          	sd	s1,8(sp)
    8000868c:	00113c23          	sd	ra,24(sp)
    80008690:	02010413          	addi	s0,sp,32
    80008694:	00003797          	auipc	a5,0x3
    80008698:	4cc78793          	addi	a5,a5,1228 # 8000bb60 <kmem>
    8000869c:	0007b483          	ld	s1,0(a5)
    800086a0:	02048063          	beqz	s1,800086c0 <kalloc+0x40>
    800086a4:	0004b703          	ld	a4,0(s1)
    800086a8:	00001637          	lui	a2,0x1
    800086ac:	00500593          	li	a1,5
    800086b0:	00048513          	mv	a0,s1
    800086b4:	00e7b023          	sd	a4,0(a5)
    800086b8:	00000097          	auipc	ra,0x0
    800086bc:	400080e7          	jalr	1024(ra) # 80008ab8 <__memset>
    800086c0:	01813083          	ld	ra,24(sp)
    800086c4:	01013403          	ld	s0,16(sp)
    800086c8:	00048513          	mv	a0,s1
    800086cc:	00813483          	ld	s1,8(sp)
    800086d0:	02010113          	addi	sp,sp,32
    800086d4:	00008067          	ret

00000000800086d8 <initlock>:
    800086d8:	ff010113          	addi	sp,sp,-16
    800086dc:	00813423          	sd	s0,8(sp)
    800086e0:	01010413          	addi	s0,sp,16
    800086e4:	00813403          	ld	s0,8(sp)
    800086e8:	00b53423          	sd	a1,8(a0)
    800086ec:	00052023          	sw	zero,0(a0)
    800086f0:	00053823          	sd	zero,16(a0)
    800086f4:	01010113          	addi	sp,sp,16
    800086f8:	00008067          	ret

00000000800086fc <acquire>:
    800086fc:	fe010113          	addi	sp,sp,-32
    80008700:	00813823          	sd	s0,16(sp)
    80008704:	00913423          	sd	s1,8(sp)
    80008708:	00113c23          	sd	ra,24(sp)
    8000870c:	01213023          	sd	s2,0(sp)
    80008710:	02010413          	addi	s0,sp,32
    80008714:	00050493          	mv	s1,a0
    80008718:	10002973          	csrr	s2,sstatus
    8000871c:	100027f3          	csrr	a5,sstatus
    80008720:	ffd7f793          	andi	a5,a5,-3
    80008724:	10079073          	csrw	sstatus,a5
    80008728:	fffff097          	auipc	ra,0xfffff
    8000872c:	8e0080e7          	jalr	-1824(ra) # 80007008 <mycpu>
    80008730:	07852783          	lw	a5,120(a0)
    80008734:	06078e63          	beqz	a5,800087b0 <acquire+0xb4>
    80008738:	fffff097          	auipc	ra,0xfffff
    8000873c:	8d0080e7          	jalr	-1840(ra) # 80007008 <mycpu>
    80008740:	07852783          	lw	a5,120(a0)
    80008744:	0004a703          	lw	a4,0(s1)
    80008748:	0017879b          	addiw	a5,a5,1
    8000874c:	06f52c23          	sw	a5,120(a0)
    80008750:	04071063          	bnez	a4,80008790 <acquire+0x94>
    80008754:	00100713          	li	a4,1
    80008758:	00070793          	mv	a5,a4
    8000875c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80008760:	0007879b          	sext.w	a5,a5
    80008764:	fe079ae3          	bnez	a5,80008758 <acquire+0x5c>
    80008768:	0ff0000f          	fence
    8000876c:	fffff097          	auipc	ra,0xfffff
    80008770:	89c080e7          	jalr	-1892(ra) # 80007008 <mycpu>
    80008774:	01813083          	ld	ra,24(sp)
    80008778:	01013403          	ld	s0,16(sp)
    8000877c:	00a4b823          	sd	a0,16(s1)
    80008780:	00013903          	ld	s2,0(sp)
    80008784:	00813483          	ld	s1,8(sp)
    80008788:	02010113          	addi	sp,sp,32
    8000878c:	00008067          	ret
    80008790:	0104b903          	ld	s2,16(s1)
    80008794:	fffff097          	auipc	ra,0xfffff
    80008798:	874080e7          	jalr	-1932(ra) # 80007008 <mycpu>
    8000879c:	faa91ce3          	bne	s2,a0,80008754 <acquire+0x58>
    800087a0:	00001517          	auipc	a0,0x1
    800087a4:	08850513          	addi	a0,a0,136 # 80009828 <digits+0x20>
    800087a8:	fffff097          	auipc	ra,0xfffff
    800087ac:	224080e7          	jalr	548(ra) # 800079cc <panic>
    800087b0:	00195913          	srli	s2,s2,0x1
    800087b4:	fffff097          	auipc	ra,0xfffff
    800087b8:	854080e7          	jalr	-1964(ra) # 80007008 <mycpu>
    800087bc:	00197913          	andi	s2,s2,1
    800087c0:	07252e23          	sw	s2,124(a0)
    800087c4:	f75ff06f          	j	80008738 <acquire+0x3c>

00000000800087c8 <release>:
    800087c8:	fe010113          	addi	sp,sp,-32
    800087cc:	00813823          	sd	s0,16(sp)
    800087d0:	00113c23          	sd	ra,24(sp)
    800087d4:	00913423          	sd	s1,8(sp)
    800087d8:	01213023          	sd	s2,0(sp)
    800087dc:	02010413          	addi	s0,sp,32
    800087e0:	00052783          	lw	a5,0(a0)
    800087e4:	00079a63          	bnez	a5,800087f8 <release+0x30>
    800087e8:	00001517          	auipc	a0,0x1
    800087ec:	04850513          	addi	a0,a0,72 # 80009830 <digits+0x28>
    800087f0:	fffff097          	auipc	ra,0xfffff
    800087f4:	1dc080e7          	jalr	476(ra) # 800079cc <panic>
    800087f8:	01053903          	ld	s2,16(a0)
    800087fc:	00050493          	mv	s1,a0
    80008800:	fffff097          	auipc	ra,0xfffff
    80008804:	808080e7          	jalr	-2040(ra) # 80007008 <mycpu>
    80008808:	fea910e3          	bne	s2,a0,800087e8 <release+0x20>
    8000880c:	0004b823          	sd	zero,16(s1)
    80008810:	0ff0000f          	fence
    80008814:	0f50000f          	fence	iorw,ow
    80008818:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000881c:	ffffe097          	auipc	ra,0xffffe
    80008820:	7ec080e7          	jalr	2028(ra) # 80007008 <mycpu>
    80008824:	100027f3          	csrr	a5,sstatus
    80008828:	0027f793          	andi	a5,a5,2
    8000882c:	04079a63          	bnez	a5,80008880 <release+0xb8>
    80008830:	07852783          	lw	a5,120(a0)
    80008834:	02f05e63          	blez	a5,80008870 <release+0xa8>
    80008838:	fff7871b          	addiw	a4,a5,-1
    8000883c:	06e52c23          	sw	a4,120(a0)
    80008840:	00071c63          	bnez	a4,80008858 <release+0x90>
    80008844:	07c52783          	lw	a5,124(a0)
    80008848:	00078863          	beqz	a5,80008858 <release+0x90>
    8000884c:	100027f3          	csrr	a5,sstatus
    80008850:	0027e793          	ori	a5,a5,2
    80008854:	10079073          	csrw	sstatus,a5
    80008858:	01813083          	ld	ra,24(sp)
    8000885c:	01013403          	ld	s0,16(sp)
    80008860:	00813483          	ld	s1,8(sp)
    80008864:	00013903          	ld	s2,0(sp)
    80008868:	02010113          	addi	sp,sp,32
    8000886c:	00008067          	ret
    80008870:	00001517          	auipc	a0,0x1
    80008874:	fe050513          	addi	a0,a0,-32 # 80009850 <digits+0x48>
    80008878:	fffff097          	auipc	ra,0xfffff
    8000887c:	154080e7          	jalr	340(ra) # 800079cc <panic>
    80008880:	00001517          	auipc	a0,0x1
    80008884:	fb850513          	addi	a0,a0,-72 # 80009838 <digits+0x30>
    80008888:	fffff097          	auipc	ra,0xfffff
    8000888c:	144080e7          	jalr	324(ra) # 800079cc <panic>

0000000080008890 <holding>:
    80008890:	00052783          	lw	a5,0(a0)
    80008894:	00079663          	bnez	a5,800088a0 <holding+0x10>
    80008898:	00000513          	li	a0,0
    8000889c:	00008067          	ret
    800088a0:	fe010113          	addi	sp,sp,-32
    800088a4:	00813823          	sd	s0,16(sp)
    800088a8:	00913423          	sd	s1,8(sp)
    800088ac:	00113c23          	sd	ra,24(sp)
    800088b0:	02010413          	addi	s0,sp,32
    800088b4:	01053483          	ld	s1,16(a0)
    800088b8:	ffffe097          	auipc	ra,0xffffe
    800088bc:	750080e7          	jalr	1872(ra) # 80007008 <mycpu>
    800088c0:	01813083          	ld	ra,24(sp)
    800088c4:	01013403          	ld	s0,16(sp)
    800088c8:	40a48533          	sub	a0,s1,a0
    800088cc:	00153513          	seqz	a0,a0
    800088d0:	00813483          	ld	s1,8(sp)
    800088d4:	02010113          	addi	sp,sp,32
    800088d8:	00008067          	ret

00000000800088dc <push_off>:
    800088dc:	fe010113          	addi	sp,sp,-32
    800088e0:	00813823          	sd	s0,16(sp)
    800088e4:	00113c23          	sd	ra,24(sp)
    800088e8:	00913423          	sd	s1,8(sp)
    800088ec:	02010413          	addi	s0,sp,32
    800088f0:	100024f3          	csrr	s1,sstatus
    800088f4:	100027f3          	csrr	a5,sstatus
    800088f8:	ffd7f793          	andi	a5,a5,-3
    800088fc:	10079073          	csrw	sstatus,a5
    80008900:	ffffe097          	auipc	ra,0xffffe
    80008904:	708080e7          	jalr	1800(ra) # 80007008 <mycpu>
    80008908:	07852783          	lw	a5,120(a0)
    8000890c:	02078663          	beqz	a5,80008938 <push_off+0x5c>
    80008910:	ffffe097          	auipc	ra,0xffffe
    80008914:	6f8080e7          	jalr	1784(ra) # 80007008 <mycpu>
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
    80008940:	6cc080e7          	jalr	1740(ra) # 80007008 <mycpu>
    80008944:	0014f493          	andi	s1,s1,1
    80008948:	06952e23          	sw	s1,124(a0)
    8000894c:	fc5ff06f          	j	80008910 <push_off+0x34>

0000000080008950 <pop_off>:
    80008950:	ff010113          	addi	sp,sp,-16
    80008954:	00813023          	sd	s0,0(sp)
    80008958:	00113423          	sd	ra,8(sp)
    8000895c:	01010413          	addi	s0,sp,16
    80008960:	ffffe097          	auipc	ra,0xffffe
    80008964:	6a8080e7          	jalr	1704(ra) # 80007008 <mycpu>
    80008968:	100027f3          	csrr	a5,sstatus
    8000896c:	0027f793          	andi	a5,a5,2
    80008970:	04079663          	bnez	a5,800089bc <pop_off+0x6c>
    80008974:	07852783          	lw	a5,120(a0)
    80008978:	02f05a63          	blez	a5,800089ac <pop_off+0x5c>
    8000897c:	fff7871b          	addiw	a4,a5,-1
    80008980:	06e52c23          	sw	a4,120(a0)
    80008984:	00071c63          	bnez	a4,8000899c <pop_off+0x4c>
    80008988:	07c52783          	lw	a5,124(a0)
    8000898c:	00078863          	beqz	a5,8000899c <pop_off+0x4c>
    80008990:	100027f3          	csrr	a5,sstatus
    80008994:	0027e793          	ori	a5,a5,2
    80008998:	10079073          	csrw	sstatus,a5
    8000899c:	00813083          	ld	ra,8(sp)
    800089a0:	00013403          	ld	s0,0(sp)
    800089a4:	01010113          	addi	sp,sp,16
    800089a8:	00008067          	ret
    800089ac:	00001517          	auipc	a0,0x1
    800089b0:	ea450513          	addi	a0,a0,-348 # 80009850 <digits+0x48>
    800089b4:	fffff097          	auipc	ra,0xfffff
    800089b8:	018080e7          	jalr	24(ra) # 800079cc <panic>
    800089bc:	00001517          	auipc	a0,0x1
    800089c0:	e7c50513          	addi	a0,a0,-388 # 80009838 <digits+0x30>
    800089c4:	fffff097          	auipc	ra,0xfffff
    800089c8:	008080e7          	jalr	8(ra) # 800079cc <panic>

00000000800089cc <push_on>:
    800089cc:	fe010113          	addi	sp,sp,-32
    800089d0:	00813823          	sd	s0,16(sp)
    800089d4:	00113c23          	sd	ra,24(sp)
    800089d8:	00913423          	sd	s1,8(sp)
    800089dc:	02010413          	addi	s0,sp,32
    800089e0:	100024f3          	csrr	s1,sstatus
    800089e4:	100027f3          	csrr	a5,sstatus
    800089e8:	0027e793          	ori	a5,a5,2
    800089ec:	10079073          	csrw	sstatus,a5
    800089f0:	ffffe097          	auipc	ra,0xffffe
    800089f4:	618080e7          	jalr	1560(ra) # 80007008 <mycpu>
    800089f8:	07852783          	lw	a5,120(a0)
    800089fc:	02078663          	beqz	a5,80008a28 <push_on+0x5c>
    80008a00:	ffffe097          	auipc	ra,0xffffe
    80008a04:	608080e7          	jalr	1544(ra) # 80007008 <mycpu>
    80008a08:	07852783          	lw	a5,120(a0)
    80008a0c:	01813083          	ld	ra,24(sp)
    80008a10:	01013403          	ld	s0,16(sp)
    80008a14:	0017879b          	addiw	a5,a5,1
    80008a18:	06f52c23          	sw	a5,120(a0)
    80008a1c:	00813483          	ld	s1,8(sp)
    80008a20:	02010113          	addi	sp,sp,32
    80008a24:	00008067          	ret
    80008a28:	0014d493          	srli	s1,s1,0x1
    80008a2c:	ffffe097          	auipc	ra,0xffffe
    80008a30:	5dc080e7          	jalr	1500(ra) # 80007008 <mycpu>
    80008a34:	0014f493          	andi	s1,s1,1
    80008a38:	06952e23          	sw	s1,124(a0)
    80008a3c:	fc5ff06f          	j	80008a00 <push_on+0x34>

0000000080008a40 <pop_on>:
    80008a40:	ff010113          	addi	sp,sp,-16
    80008a44:	00813023          	sd	s0,0(sp)
    80008a48:	00113423          	sd	ra,8(sp)
    80008a4c:	01010413          	addi	s0,sp,16
    80008a50:	ffffe097          	auipc	ra,0xffffe
    80008a54:	5b8080e7          	jalr	1464(ra) # 80007008 <mycpu>
    80008a58:	100027f3          	csrr	a5,sstatus
    80008a5c:	0027f793          	andi	a5,a5,2
    80008a60:	04078463          	beqz	a5,80008aa8 <pop_on+0x68>
    80008a64:	07852783          	lw	a5,120(a0)
    80008a68:	02f05863          	blez	a5,80008a98 <pop_on+0x58>
    80008a6c:	fff7879b          	addiw	a5,a5,-1
    80008a70:	06f52c23          	sw	a5,120(a0)
    80008a74:	07853783          	ld	a5,120(a0)
    80008a78:	00079863          	bnez	a5,80008a88 <pop_on+0x48>
    80008a7c:	100027f3          	csrr	a5,sstatus
    80008a80:	ffd7f793          	andi	a5,a5,-3
    80008a84:	10079073          	csrw	sstatus,a5
    80008a88:	00813083          	ld	ra,8(sp)
    80008a8c:	00013403          	ld	s0,0(sp)
    80008a90:	01010113          	addi	sp,sp,16
    80008a94:	00008067          	ret
    80008a98:	00001517          	auipc	a0,0x1
    80008a9c:	de050513          	addi	a0,a0,-544 # 80009878 <digits+0x70>
    80008aa0:	fffff097          	auipc	ra,0xfffff
    80008aa4:	f2c080e7          	jalr	-212(ra) # 800079cc <panic>
    80008aa8:	00001517          	auipc	a0,0x1
    80008aac:	db050513          	addi	a0,a0,-592 # 80009858 <digits+0x50>
    80008ab0:	fffff097          	auipc	ra,0xfffff
    80008ab4:	f1c080e7          	jalr	-228(ra) # 800079cc <panic>

0000000080008ab8 <__memset>:
    80008ab8:	ff010113          	addi	sp,sp,-16
    80008abc:	00813423          	sd	s0,8(sp)
    80008ac0:	01010413          	addi	s0,sp,16
    80008ac4:	1a060e63          	beqz	a2,80008c80 <__memset+0x1c8>
    80008ac8:	40a007b3          	neg	a5,a0
    80008acc:	0077f793          	andi	a5,a5,7
    80008ad0:	00778693          	addi	a3,a5,7
    80008ad4:	00b00813          	li	a6,11
    80008ad8:	0ff5f593          	andi	a1,a1,255
    80008adc:	fff6071b          	addiw	a4,a2,-1
    80008ae0:	1b06e663          	bltu	a3,a6,80008c8c <__memset+0x1d4>
    80008ae4:	1cd76463          	bltu	a4,a3,80008cac <__memset+0x1f4>
    80008ae8:	1a078e63          	beqz	a5,80008ca4 <__memset+0x1ec>
    80008aec:	00b50023          	sb	a1,0(a0)
    80008af0:	00100713          	li	a4,1
    80008af4:	1ae78463          	beq	a5,a4,80008c9c <__memset+0x1e4>
    80008af8:	00b500a3          	sb	a1,1(a0)
    80008afc:	00200713          	li	a4,2
    80008b00:	1ae78a63          	beq	a5,a4,80008cb4 <__memset+0x1fc>
    80008b04:	00b50123          	sb	a1,2(a0)
    80008b08:	00300713          	li	a4,3
    80008b0c:	18e78463          	beq	a5,a4,80008c94 <__memset+0x1dc>
    80008b10:	00b501a3          	sb	a1,3(a0)
    80008b14:	00400713          	li	a4,4
    80008b18:	1ae78263          	beq	a5,a4,80008cbc <__memset+0x204>
    80008b1c:	00b50223          	sb	a1,4(a0)
    80008b20:	00500713          	li	a4,5
    80008b24:	1ae78063          	beq	a5,a4,80008cc4 <__memset+0x20c>
    80008b28:	00b502a3          	sb	a1,5(a0)
    80008b2c:	00700713          	li	a4,7
    80008b30:	18e79e63          	bne	a5,a4,80008ccc <__memset+0x214>
    80008b34:	00b50323          	sb	a1,6(a0)
    80008b38:	00700e93          	li	t4,7
    80008b3c:	00859713          	slli	a4,a1,0x8
    80008b40:	00e5e733          	or	a4,a1,a4
    80008b44:	01059e13          	slli	t3,a1,0x10
    80008b48:	01c76e33          	or	t3,a4,t3
    80008b4c:	01859313          	slli	t1,a1,0x18
    80008b50:	006e6333          	or	t1,t3,t1
    80008b54:	02059893          	slli	a7,a1,0x20
    80008b58:	40f60e3b          	subw	t3,a2,a5
    80008b5c:	011368b3          	or	a7,t1,a7
    80008b60:	02859813          	slli	a6,a1,0x28
    80008b64:	0108e833          	or	a6,a7,a6
    80008b68:	03059693          	slli	a3,a1,0x30
    80008b6c:	003e589b          	srliw	a7,t3,0x3
    80008b70:	00d866b3          	or	a3,a6,a3
    80008b74:	03859713          	slli	a4,a1,0x38
    80008b78:	00389813          	slli	a6,a7,0x3
    80008b7c:	00f507b3          	add	a5,a0,a5
    80008b80:	00e6e733          	or	a4,a3,a4
    80008b84:	000e089b          	sext.w	a7,t3
    80008b88:	00f806b3          	add	a3,a6,a5
    80008b8c:	00e7b023          	sd	a4,0(a5)
    80008b90:	00878793          	addi	a5,a5,8
    80008b94:	fed79ce3          	bne	a5,a3,80008b8c <__memset+0xd4>
    80008b98:	ff8e7793          	andi	a5,t3,-8
    80008b9c:	0007871b          	sext.w	a4,a5
    80008ba0:	01d787bb          	addw	a5,a5,t4
    80008ba4:	0ce88e63          	beq	a7,a4,80008c80 <__memset+0x1c8>
    80008ba8:	00f50733          	add	a4,a0,a5
    80008bac:	00b70023          	sb	a1,0(a4)
    80008bb0:	0017871b          	addiw	a4,a5,1
    80008bb4:	0cc77663          	bgeu	a4,a2,80008c80 <__memset+0x1c8>
    80008bb8:	00e50733          	add	a4,a0,a4
    80008bbc:	00b70023          	sb	a1,0(a4)
    80008bc0:	0027871b          	addiw	a4,a5,2
    80008bc4:	0ac77e63          	bgeu	a4,a2,80008c80 <__memset+0x1c8>
    80008bc8:	00e50733          	add	a4,a0,a4
    80008bcc:	00b70023          	sb	a1,0(a4)
    80008bd0:	0037871b          	addiw	a4,a5,3
    80008bd4:	0ac77663          	bgeu	a4,a2,80008c80 <__memset+0x1c8>
    80008bd8:	00e50733          	add	a4,a0,a4
    80008bdc:	00b70023          	sb	a1,0(a4)
    80008be0:	0047871b          	addiw	a4,a5,4
    80008be4:	08c77e63          	bgeu	a4,a2,80008c80 <__memset+0x1c8>
    80008be8:	00e50733          	add	a4,a0,a4
    80008bec:	00b70023          	sb	a1,0(a4)
    80008bf0:	0057871b          	addiw	a4,a5,5
    80008bf4:	08c77663          	bgeu	a4,a2,80008c80 <__memset+0x1c8>
    80008bf8:	00e50733          	add	a4,a0,a4
    80008bfc:	00b70023          	sb	a1,0(a4)
    80008c00:	0067871b          	addiw	a4,a5,6
    80008c04:	06c77e63          	bgeu	a4,a2,80008c80 <__memset+0x1c8>
    80008c08:	00e50733          	add	a4,a0,a4
    80008c0c:	00b70023          	sb	a1,0(a4)
    80008c10:	0077871b          	addiw	a4,a5,7
    80008c14:	06c77663          	bgeu	a4,a2,80008c80 <__memset+0x1c8>
    80008c18:	00e50733          	add	a4,a0,a4
    80008c1c:	00b70023          	sb	a1,0(a4)
    80008c20:	0087871b          	addiw	a4,a5,8
    80008c24:	04c77e63          	bgeu	a4,a2,80008c80 <__memset+0x1c8>
    80008c28:	00e50733          	add	a4,a0,a4
    80008c2c:	00b70023          	sb	a1,0(a4)
    80008c30:	0097871b          	addiw	a4,a5,9
    80008c34:	04c77663          	bgeu	a4,a2,80008c80 <__memset+0x1c8>
    80008c38:	00e50733          	add	a4,a0,a4
    80008c3c:	00b70023          	sb	a1,0(a4)
    80008c40:	00a7871b          	addiw	a4,a5,10
    80008c44:	02c77e63          	bgeu	a4,a2,80008c80 <__memset+0x1c8>
    80008c48:	00e50733          	add	a4,a0,a4
    80008c4c:	00b70023          	sb	a1,0(a4)
    80008c50:	00b7871b          	addiw	a4,a5,11
    80008c54:	02c77663          	bgeu	a4,a2,80008c80 <__memset+0x1c8>
    80008c58:	00e50733          	add	a4,a0,a4
    80008c5c:	00b70023          	sb	a1,0(a4)
    80008c60:	00c7871b          	addiw	a4,a5,12
    80008c64:	00c77e63          	bgeu	a4,a2,80008c80 <__memset+0x1c8>
    80008c68:	00e50733          	add	a4,a0,a4
    80008c6c:	00b70023          	sb	a1,0(a4)
    80008c70:	00d7879b          	addiw	a5,a5,13
    80008c74:	00c7f663          	bgeu	a5,a2,80008c80 <__memset+0x1c8>
    80008c78:	00f507b3          	add	a5,a0,a5
    80008c7c:	00b78023          	sb	a1,0(a5)
    80008c80:	00813403          	ld	s0,8(sp)
    80008c84:	01010113          	addi	sp,sp,16
    80008c88:	00008067          	ret
    80008c8c:	00b00693          	li	a3,11
    80008c90:	e55ff06f          	j	80008ae4 <__memset+0x2c>
    80008c94:	00300e93          	li	t4,3
    80008c98:	ea5ff06f          	j	80008b3c <__memset+0x84>
    80008c9c:	00100e93          	li	t4,1
    80008ca0:	e9dff06f          	j	80008b3c <__memset+0x84>
    80008ca4:	00000e93          	li	t4,0
    80008ca8:	e95ff06f          	j	80008b3c <__memset+0x84>
    80008cac:	00000793          	li	a5,0
    80008cb0:	ef9ff06f          	j	80008ba8 <__memset+0xf0>
    80008cb4:	00200e93          	li	t4,2
    80008cb8:	e85ff06f          	j	80008b3c <__memset+0x84>
    80008cbc:	00400e93          	li	t4,4
    80008cc0:	e7dff06f          	j	80008b3c <__memset+0x84>
    80008cc4:	00500e93          	li	t4,5
    80008cc8:	e75ff06f          	j	80008b3c <__memset+0x84>
    80008ccc:	00600e93          	li	t4,6
    80008cd0:	e6dff06f          	j	80008b3c <__memset+0x84>

0000000080008cd4 <__memmove>:
    80008cd4:	ff010113          	addi	sp,sp,-16
    80008cd8:	00813423          	sd	s0,8(sp)
    80008cdc:	01010413          	addi	s0,sp,16
    80008ce0:	0e060863          	beqz	a2,80008dd0 <__memmove+0xfc>
    80008ce4:	fff6069b          	addiw	a3,a2,-1
    80008ce8:	0006881b          	sext.w	a6,a3
    80008cec:	0ea5e863          	bltu	a1,a0,80008ddc <__memmove+0x108>
    80008cf0:	00758713          	addi	a4,a1,7
    80008cf4:	00a5e7b3          	or	a5,a1,a0
    80008cf8:	40a70733          	sub	a4,a4,a0
    80008cfc:	0077f793          	andi	a5,a5,7
    80008d00:	00f73713          	sltiu	a4,a4,15
    80008d04:	00174713          	xori	a4,a4,1
    80008d08:	0017b793          	seqz	a5,a5
    80008d0c:	00e7f7b3          	and	a5,a5,a4
    80008d10:	10078863          	beqz	a5,80008e20 <__memmove+0x14c>
    80008d14:	00900793          	li	a5,9
    80008d18:	1107f463          	bgeu	a5,a6,80008e20 <__memmove+0x14c>
    80008d1c:	0036581b          	srliw	a6,a2,0x3
    80008d20:	fff8081b          	addiw	a6,a6,-1
    80008d24:	02081813          	slli	a6,a6,0x20
    80008d28:	01d85893          	srli	a7,a6,0x1d
    80008d2c:	00858813          	addi	a6,a1,8
    80008d30:	00058793          	mv	a5,a1
    80008d34:	00050713          	mv	a4,a0
    80008d38:	01088833          	add	a6,a7,a6
    80008d3c:	0007b883          	ld	a7,0(a5)
    80008d40:	00878793          	addi	a5,a5,8
    80008d44:	00870713          	addi	a4,a4,8
    80008d48:	ff173c23          	sd	a7,-8(a4)
    80008d4c:	ff0798e3          	bne	a5,a6,80008d3c <__memmove+0x68>
    80008d50:	ff867713          	andi	a4,a2,-8
    80008d54:	02071793          	slli	a5,a4,0x20
    80008d58:	0207d793          	srli	a5,a5,0x20
    80008d5c:	00f585b3          	add	a1,a1,a5
    80008d60:	40e686bb          	subw	a3,a3,a4
    80008d64:	00f507b3          	add	a5,a0,a5
    80008d68:	06e60463          	beq	a2,a4,80008dd0 <__memmove+0xfc>
    80008d6c:	0005c703          	lbu	a4,0(a1)
    80008d70:	00e78023          	sb	a4,0(a5)
    80008d74:	04068e63          	beqz	a3,80008dd0 <__memmove+0xfc>
    80008d78:	0015c603          	lbu	a2,1(a1)
    80008d7c:	00100713          	li	a4,1
    80008d80:	00c780a3          	sb	a2,1(a5)
    80008d84:	04e68663          	beq	a3,a4,80008dd0 <__memmove+0xfc>
    80008d88:	0025c603          	lbu	a2,2(a1)
    80008d8c:	00200713          	li	a4,2
    80008d90:	00c78123          	sb	a2,2(a5)
    80008d94:	02e68e63          	beq	a3,a4,80008dd0 <__memmove+0xfc>
    80008d98:	0035c603          	lbu	a2,3(a1)
    80008d9c:	00300713          	li	a4,3
    80008da0:	00c781a3          	sb	a2,3(a5)
    80008da4:	02e68663          	beq	a3,a4,80008dd0 <__memmove+0xfc>
    80008da8:	0045c603          	lbu	a2,4(a1)
    80008dac:	00400713          	li	a4,4
    80008db0:	00c78223          	sb	a2,4(a5)
    80008db4:	00e68e63          	beq	a3,a4,80008dd0 <__memmove+0xfc>
    80008db8:	0055c603          	lbu	a2,5(a1)
    80008dbc:	00500713          	li	a4,5
    80008dc0:	00c782a3          	sb	a2,5(a5)
    80008dc4:	00e68663          	beq	a3,a4,80008dd0 <__memmove+0xfc>
    80008dc8:	0065c703          	lbu	a4,6(a1)
    80008dcc:	00e78323          	sb	a4,6(a5)
    80008dd0:	00813403          	ld	s0,8(sp)
    80008dd4:	01010113          	addi	sp,sp,16
    80008dd8:	00008067          	ret
    80008ddc:	02061713          	slli	a4,a2,0x20
    80008de0:	02075713          	srli	a4,a4,0x20
    80008de4:	00e587b3          	add	a5,a1,a4
    80008de8:	f0f574e3          	bgeu	a0,a5,80008cf0 <__memmove+0x1c>
    80008dec:	02069613          	slli	a2,a3,0x20
    80008df0:	02065613          	srli	a2,a2,0x20
    80008df4:	fff64613          	not	a2,a2
    80008df8:	00e50733          	add	a4,a0,a4
    80008dfc:	00c78633          	add	a2,a5,a2
    80008e00:	fff7c683          	lbu	a3,-1(a5)
    80008e04:	fff78793          	addi	a5,a5,-1
    80008e08:	fff70713          	addi	a4,a4,-1
    80008e0c:	00d70023          	sb	a3,0(a4)
    80008e10:	fec798e3          	bne	a5,a2,80008e00 <__memmove+0x12c>
    80008e14:	00813403          	ld	s0,8(sp)
    80008e18:	01010113          	addi	sp,sp,16
    80008e1c:	00008067          	ret
    80008e20:	02069713          	slli	a4,a3,0x20
    80008e24:	02075713          	srli	a4,a4,0x20
    80008e28:	00170713          	addi	a4,a4,1
    80008e2c:	00e50733          	add	a4,a0,a4
    80008e30:	00050793          	mv	a5,a0
    80008e34:	0005c683          	lbu	a3,0(a1)
    80008e38:	00178793          	addi	a5,a5,1
    80008e3c:	00158593          	addi	a1,a1,1
    80008e40:	fed78fa3          	sb	a3,-1(a5)
    80008e44:	fee798e3          	bne	a5,a4,80008e34 <__memmove+0x160>
    80008e48:	f89ff06f          	j	80008dd0 <__memmove+0xfc>
	...
