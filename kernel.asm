
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00007117          	auipc	sp,0x7
    80000004:	32813103          	ld	sp,808(sp) # 80007328 <_GLOBAL_OFFSET_TABLE_+0x28>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	030030ef          	jal	ra,8000304c <start>

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
    80001184:	169000ef          	jal	ra,80001aec <interruptRoutine>

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

0000000080001224 <_ZN11ThreadQueue7putLastEP3TCB>:
// Created by os on 6/4/23.
//

#include "../h/ThreadQueue.hpp"

void ThreadQueue::putLast(TCB* tcb) {
    80001224:	fe010113          	addi	sp,sp,-32
    80001228:	00113c23          	sd	ra,24(sp)
    8000122c:	00813823          	sd	s0,16(sp)
    80001230:	00913423          	sd	s1,8(sp)
    80001234:	01213023          	sd	s2,0(sp)
    80001238:	02010413          	addi	s0,sp,32
    8000123c:	00050493          	mv	s1,a0
    80001240:	00058913          	mv	s2,a1
		Node* next;

		Node(TCB* d) : data(d), next(nullptr) {}

		static void* operator new(size_t size) {
			return mem_alloc(size);
    80001244:	01000513          	li	a0,16
    80001248:	00000097          	auipc	ra,0x0
    8000124c:	0a8080e7          	jalr	168(ra) # 800012f0 <_Z9mem_allocm>
		Node(TCB* d) : data(d), next(nullptr) {}
    80001250:	01253023          	sd	s2,0(a0)
    80001254:	00053423          	sd	zero,8(a0)
			delete node;
		}
	}

	bool isEmpty() const {
		return front == nullptr;
    80001258:	0004b783          	ld	a5,0(s1)
	Node* newNode = new Node(tcb);

	if (isEmpty()) {
    8000125c:	02078463          	beqz	a5,80001284 <_ZN11ThreadQueue7putLastEP3TCB+0x60>
		front = back = newNode;
	} else {
		back->next = newNode;
    80001260:	0084b783          	ld	a5,8(s1)
    80001264:	00a7b423          	sd	a0,8(a5)
		back = newNode;
    80001268:	00a4b423          	sd	a0,8(s1)
	}
}
    8000126c:	01813083          	ld	ra,24(sp)
    80001270:	01013403          	ld	s0,16(sp)
    80001274:	00813483          	ld	s1,8(sp)
    80001278:	00013903          	ld	s2,0(sp)
    8000127c:	02010113          	addi	sp,sp,32
    80001280:	00008067          	ret
		front = back = newNode;
    80001284:	00a4b423          	sd	a0,8(s1)
    80001288:	00a4b023          	sd	a0,0(s1)
    8000128c:	fe1ff06f          	j	8000126c <_ZN11ThreadQueue7putLastEP3TCB+0x48>

0000000080001290 <_ZN11ThreadQueue8getFirstEv>:

TCB* ThreadQueue::getFirst() {
    80001290:	fe010113          	addi	sp,sp,-32
    80001294:	00113c23          	sd	ra,24(sp)
    80001298:	00813823          	sd	s0,16(sp)
    8000129c:	00913423          	sd	s1,8(sp)
    800012a0:	02010413          	addi	s0,sp,32
    800012a4:	00050793          	mv	a5,a0
    800012a8:	00053503          	ld	a0,0(a0)
	if (isEmpty()) {
    800012ac:	02050e63          	beqz	a0,800012e8 <_ZN11ThreadQueue8getFirstEv+0x58>
		return nullptr;
	}

	Node* node = front;
	TCB* tcb = node->data;
    800012b0:	00053483          	ld	s1,0(a0)
	front = front->next;
    800012b4:	00853703          	ld	a4,8(a0)
    800012b8:	00e7b023          	sd	a4,0(a5)

	if (front == nullptr) {
    800012bc:	02070263          	beqz	a4,800012e0 <_ZN11ThreadQueue8getFirstEv+0x50>
			mem_free(ptr);
    800012c0:	00000097          	auipc	ra,0x0
    800012c4:	070080e7          	jalr	112(ra) # 80001330 <_Z8mem_freePv>
		back = nullptr;
	}

	delete node;
	return tcb;
    800012c8:	00048513          	mv	a0,s1
    800012cc:	01813083          	ld	ra,24(sp)
    800012d0:	01013403          	ld	s0,16(sp)
    800012d4:	00813483          	ld	s1,8(sp)
    800012d8:	02010113          	addi	sp,sp,32
    800012dc:	00008067          	ret
		back = nullptr;
    800012e0:	0007b423          	sd	zero,8(a5)
    800012e4:	fddff06f          	j	800012c0 <_ZN11ThreadQueue8getFirstEv+0x30>
		return nullptr;
    800012e8:	00050493          	mv	s1,a0
    800012ec:	fddff06f          	j	800012c8 <_ZN11ThreadQueue8getFirstEv+0x38>

00000000800012f0 <_Z9mem_allocm>:

inline void scall() {
	__asm__ volatile("ecall");
}

void* mem_alloc(size_t size) {
    800012f0:	ff010113          	addi	sp,sp,-16
    800012f4:	00813423          	sd	s0,8(sp)
    800012f8:	01010413          	addi	s0,sp,16
	//na size moramo dodati zaglavlje segmenta
	size += sizeof(MemoryAllocator::UsedMemSegment);
    800012fc:	01850513          	addi	a0,a0,24
	//size je u bajtovima, pretvara se u blokove
	size = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80001300:	00655313          	srli	t1,a0,0x6
    80001304:	03f57513          	andi	a0,a0,63
    80001308:	00050463          	beqz	a0,80001310 <_Z9mem_allocm+0x20>
    8000130c:	00100513          	li	a0,1
    80001310:	00a30333          	add	t1,t1,a0

	//stavljanje argumenata za sistemski poziv
	__asm__ volatile("mv a1, %[size]": :[size] "r"(size):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001314:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x01");
    80001318:	00100513          	li	a0,1
	__asm__ volatile("ecall");
    8000131c:	00000073          	ecall
	//a1 = broj blokova velicine MEM_BLOCK_SIZE za alokaciju

	scall();

	void* ret;
	__asm__ volatile("mv %[ptr], a0":[ptr] "=r"(ret));
    80001320:	00050513          	mv	a0,a0
	return ret;
}
    80001324:	00813403          	ld	s0,8(sp)
    80001328:	01010113          	addi	sp,sp,16
    8000132c:	00008067          	ret

0000000080001330 <_Z8mem_freePv>:

int mem_free(void* ptr) {
    80001330:	ff010113          	addi	sp,sp,-16
    80001334:	00813423          	sd	s0,8(sp)
    80001338:	01010413          	addi	s0,sp,16
    8000133c:	00050313          	mv	t1,a0
	//stavljanje argumenata za sistemski poziv
	__asm__ volatile("mv a1, %[ptr]": :[ptr] "r"(ptr):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001340:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x02");
    80001344:	00200513          	li	a0,2
	__asm__ volatile("ecall");
    80001348:	00000073          	ecall
	//a1 = pokazivac na memoriju koju treba dealocirati

	scall();

	int status;
	__asm__ volatile("mv %[status], a0":[status] "=r"(status));
    8000134c:	00050513          	mv	a0,a0
	return status;
}
    80001350:	0005051b          	sext.w	a0,a0
    80001354:	00813403          	ld	s0,8(sp)
    80001358:	01010113          	addi	sp,sp,16
    8000135c:	00008067          	ret

0000000080001360 <_Z13thread_createPP3TCBPFvPvES2_>:

int thread_create(thread_t* handle, void (* start_routine)(void*), void* arg) {
    80001360:	fd010113          	addi	sp,sp,-48
    80001364:	02113423          	sd	ra,40(sp)
    80001368:	02813023          	sd	s0,32(sp)
    8000136c:	00913c23          	sd	s1,24(sp)
    80001370:	01213823          	sd	s2,16(sp)
    80001374:	01313423          	sd	s3,8(sp)
    80001378:	03010413          	addi	s0,sp,48
    8000137c:	00050913          	mv	s2,a0
    80001380:	00058493          	mv	s1,a1
    80001384:	00060993          	mv	s3,a2
	//stvaranje steka ako se ne radi o main kernel niti, posto ona automatski ima stek
	uint64* stack = nullptr;
	if (start_routine != nullptr) {
    80001388:	04058863          	beqz	a1,800013d8 <_Z13thread_createPP3TCBPFvPvES2_+0x78>
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    8000138c:	00001537          	lui	a0,0x1
    80001390:	00000097          	auipc	ra,0x0
    80001394:	f60080e7          	jalr	-160(ra) # 800012f0 <_Z9mem_allocm>
    80001398:	00050313          	mv	t1,a0
	}
	//uint64* stack = (start_routine != nullptr ? (uint64*)MemoryAllocator::kmalloc(DEFAULT_STACK_SIZE) : nullptr);
	//stavljanje argumenata za sistemski poziv
	__asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000139c:	00030713          	mv	a4,t1
	__asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800013a0:	00098693          	mv	a3,s3
	__asm__ volatile("mv a2, %[function]": :[function] "r"(
			start_routine):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800013a4:	00048613          	mv	a2,s1
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(handle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800013a8:	00090593          	mv	a1,s2
	__asm__ volatile("li a0, 0x11");
    800013ac:	01100513          	li	a0,17
	__asm__ volatile("ecall");
    800013b0:	00000073          	ecall
	//a4 = pokazivac na najnizu adresu steka (stek raste ka nizim adresama, pokazuje na poslednju zauzetu)

	scall();

	int status;
	__asm__ volatile("mv %[status], a0":[status] "=r"(status));
    800013b4:	00050513          	mv	a0,a0
	return status;
}
    800013b8:	0005051b          	sext.w	a0,a0
    800013bc:	02813083          	ld	ra,40(sp)
    800013c0:	02013403          	ld	s0,32(sp)
    800013c4:	01813483          	ld	s1,24(sp)
    800013c8:	01013903          	ld	s2,16(sp)
    800013cc:	00813983          	ld	s3,8(sp)
    800013d0:	03010113          	addi	sp,sp,48
    800013d4:	00008067          	ret
	uint64* stack = nullptr;
    800013d8:	00000313          	li	t1,0
    800013dc:	fc1ff06f          	j	8000139c <_Z13thread_createPP3TCBPFvPvES2_+0x3c>

00000000800013e0 <_Z11thread_exitv>:

int thread_exit() {
    800013e0:	ff010113          	addi	sp,sp,-16
    800013e4:	00813423          	sd	s0,8(sp)
    800013e8:	01010413          	addi	s0,sp,16
	//nema argumenata, samo kod sistemskog poziva
	__asm__ volatile("li a0, 0x12");
    800013ec:	01200513          	li	a0,18
	__asm__ volatile("ecall");
    800013f0:	00000073          	ecall

	scall();

	int status;
	__asm__ volatile("mv %[status], a0":[status] "=r"(status));
    800013f4:	00050513          	mv	a0,a0
	return status;
}
    800013f8:	0005051b          	sext.w	a0,a0
    800013fc:	00813403          	ld	s0,8(sp)
    80001400:	01010113          	addi	sp,sp,16
    80001404:	00008067          	ret

0000000080001408 <_Z15thread_dispatchv>:

void thread_dispatch() {
    80001408:	ff010113          	addi	sp,sp,-16
    8000140c:	00813423          	sd	s0,8(sp)
    80001410:	01010413          	addi	s0,sp,16
	//nema argumenata, samo kod sistemskog poziva
	__asm__ volatile("li a0, 0x13");
    80001414:	01300513          	li	a0,19
	__asm__ volatile("ecall");
    80001418:	00000073          	ecall

	scall();
	//nema povratne vrednosti
}
    8000141c:	00813403          	ld	s0,8(sp)
    80001420:	01010113          	addi	sp,sp,16
    80001424:	00008067          	ret

0000000080001428 <_Z11thread_joinP3TCB>:

void thread_join(thread_t handle) {
    80001428:	ff010113          	addi	sp,sp,-16
    8000142c:	00813423          	sd	s0,8(sp)
    80001430:	01010413          	addi	s0,sp,16
    80001434:	00050313          	mv	t1,a0
//stavljanje argumenata za sistemski poziv
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(handle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001438:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x14");
    8000143c:	01400513          	li	a0,20
	__asm__ volatile("ecall");
    80001440:	00000073          	ecall
	//a0 = 0x14
	//a1 = rucka niti na koju se ceka

	scall();
}
    80001444:	00813403          	ld	s0,8(sp)
    80001448:	01010113          	addi	sp,sp,16
    8000144c:	00008067          	ret

0000000080001450 <_Z10time_sleepm>:

int time_sleep(time_t timerPeriods) {
    80001450:	ff010113          	addi	sp,sp,-16
    80001454:	00813423          	sd	s0,8(sp)
    80001458:	01010413          	addi	s0,sp,16
    8000145c:	00050313          	mv	t1,a0
	//stavljanje argumenata za sistemski poziv
	__asm__ volatile("mv a1, %[time]": :[time] "r"(timerPeriods):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001460:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x31");
    80001464:	03100513          	li	a0,49
	__asm__ volatile("ecall");
    80001468:	00000073          	ecall
	//a1 = broj perioda tajmera na koji se uspavljuje nit

	scall();

	int status;
	__asm__ volatile("mv %[status], a0":[status] "=r"(status));
    8000146c:	00050513          	mv	a0,a0
	return status;
}
    80001470:	0005051b          	sext.w	a0,a0
    80001474:	00813403          	ld	s0,8(sp)
    80001478:	01010113          	addi	sp,sp,16
    8000147c:	00008067          	ret

0000000080001480 <_Z8sem_openPP4KSemj>:

int sem_open(sem_t* handle, unsigned int init) {
    80001480:	ff010113          	addi	sp,sp,-16
    80001484:	00813423          	sd	s0,8(sp)
    80001488:	01010413          	addi	s0,sp,16
    8000148c:	00050313          	mv	t1,a0
    80001490:	00058e13          	mv	t3,a1
	//stavljanje argumenata za sistemski poziv
	__asm__ volatile("mv a2, %[val]": :[val] "r"(init):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001494:	000e0613          	mv	a2,t3
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(handle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001498:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x21");
    8000149c:	02100513          	li	a0,33
	__asm__ volatile("ecall");
    800014a0:	00000073          	ecall

	scall();

	//status == 0 ako je uspesno kreiran semafor; status == -1 ako nije
	int status;
	__asm__ volatile("mv %[status], a0":[status] "=r"(status));
    800014a4:	00050513          	mv	a0,a0
	return status;
}
    800014a8:	0005051b          	sext.w	a0,a0
    800014ac:	00813403          	ld	s0,8(sp)
    800014b0:	01010113          	addi	sp,sp,16
    800014b4:	00008067          	ret

00000000800014b8 <_Z9sem_closeP4KSem>:

int sem_close(sem_t handle) {
    800014b8:	ff010113          	addi	sp,sp,-16
    800014bc:	00813423          	sd	s0,8(sp)
    800014c0:	01010413          	addi	s0,sp,16
    800014c4:	00050313          	mv	t1,a0
	//stavljanje argumenata za sistemski poziv
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(handle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800014c8:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x22");
    800014cc:	02200513          	li	a0,34
	__asm__ volatile("ecall");
    800014d0:	00000073          	ecall
	//a1 = rucka semafora (pokazivac na semafor u kernelu)

	scall();

	int status;
	__asm__ volatile("mv %[status], a0":[status] "=r"(status));
    800014d4:	00050513          	mv	a0,a0
	return status;
}
    800014d8:	0005051b          	sext.w	a0,a0
    800014dc:	00813403          	ld	s0,8(sp)
    800014e0:	01010113          	addi	sp,sp,16
    800014e4:	00008067          	ret

00000000800014e8 <_Z8sem_waitP4KSem>:

int sem_wait(sem_t id) {
    800014e8:	ff010113          	addi	sp,sp,-16
    800014ec:	00813423          	sd	s0,8(sp)
    800014f0:	01010413          	addi	s0,sp,16
    800014f4:	00050313          	mv	t1,a0
	//stavljanje argumenata za sistemski poziv
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(id):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800014f8:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x23");
    800014fc:	02300513          	li	a0,35
	__asm__ volatile("ecall");
    80001500:	00000073          	ecall
	//a1 = rucka semafora (pokazivac na semafor u kernelu)

	scall();

	int status;
	__asm__ volatile("mv %[status], a0":[status] "=r"(status));
    80001504:	00050513          	mv	a0,a0
	return status;
}
    80001508:	0005051b          	sext.w	a0,a0
    8000150c:	00813403          	ld	s0,8(sp)
    80001510:	01010113          	addi	sp,sp,16
    80001514:	00008067          	ret

0000000080001518 <_Z10sem_signalP4KSem>:

int sem_signal(sem_t id) {
    80001518:	ff010113          	addi	sp,sp,-16
    8000151c:	00813423          	sd	s0,8(sp)
    80001520:	01010413          	addi	s0,sp,16
    80001524:	00050313          	mv	t1,a0
	//stavljanje argumenata za sistemski poziv
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(id):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001528:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x24");
    8000152c:	02400513          	li	a0,36
	__asm__ volatile("ecall");
    80001530:	00000073          	ecall
	//a1 = rucka semafora (pokazivac na semafor u kernelu)

	scall();

	int status;
	__asm__ volatile("mv %[status], a0":[status] "=r"(status));
    80001534:	00050513          	mv	a0,a0
	return status;
}
    80001538:	0005051b          	sext.w	a0,a0
    8000153c:	00813403          	ld	s0,8(sp)
    80001540:	01010113          	addi	sp,sp,16
    80001544:	00008067          	ret

0000000080001548 <_Z4getcv>:

char getc() {
    80001548:	ff010113          	addi	sp,sp,-16
    8000154c:	00813423          	sd	s0,8(sp)
    80001550:	01010413          	addi	s0,sp,16
	//nema argumenata
	__asm__ volatile("li a0, 0x41");
    80001554:	04100513          	li	a0,65
	__asm__ volatile("ecall");
    80001558:	00000073          	ecall

	scall();

	char character;
	__asm__ volatile("mv %[status], a0":[status] "=r"(character));
    8000155c:	00050513          	mv	a0,a0
	return character;
}
    80001560:	0ff57513          	andi	a0,a0,255
    80001564:	00813403          	ld	s0,8(sp)
    80001568:	01010113          	addi	sp,sp,16
    8000156c:	00008067          	ret

0000000080001570 <_Z4putcc>:

void putc(char c) {
    80001570:	ff010113          	addi	sp,sp,-16
    80001574:	00813423          	sd	s0,8(sp)
    80001578:	01010413          	addi	s0,sp,16
    8000157c:	00050313          	mv	t1,a0
	//stavljanje argumenata
	__asm__ volatile("mv a1, %[c]": :[c] "r"(c):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001580:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x42");
    80001584:	04200513          	li	a0,66
	__asm__ volatile("ecall");
    80001588:	00000073          	ecall

	scall();
	//nema povratne vrednosti
}
    8000158c:	00813403          	ld	s0,8(sp)
    80001590:	01010113          	addi	sp,sp,16
    80001594:	00008067          	ret

0000000080001598 <_Z11printStringPKc>:
#include "../h/helper.hpp"
#include "../lib/console.h"
#include "../h/Riscv.hpp"
//#include "../h/syscall_c.hpp"

void printString(char const* string) {
    80001598:	ff010113          	addi	sp,sp,-16
    8000159c:	00813423          	sd	s0,8(sp)
    800015a0:	01010413          	addi	s0,sp,16
    800015a4:	00050313          	mv	t1,a0

	//stavljanje argumenata za sistemski poziv
	__asm__ volatile("mv a1, %[ptr]": :[ptr] "r"(string):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800015a8:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x90");
    800015ac:	09000513          	li	a0,144

	__asm__ volatile("ecall");
    800015b0:	00000073          	ecall


}
    800015b4:	00813403          	ld	s0,8(sp)
    800015b8:	01010113          	addi	sp,sp,16
    800015bc:	00008067          	ret

00000000800015c0 <_Z12printIntegerm>:
//void println(char const *string) {
//    printString(string);
//    __putc('\n');
//}

void printInteger(uint64 integer) {
    800015c0:	ff010113          	addi	sp,sp,-16
    800015c4:	00813423          	sd	s0,8(sp)
    800015c8:	01010413          	addi	s0,sp,16
    800015cc:	00050313          	mv	t1,a0
	//stavljanje argumenata za sistemski poziv
	__asm__ volatile("mv a1, %[ptr]": :[ptr] "r"(integer):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800015d0:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x91");
    800015d4:	09100513          	li	a0,145

	__asm__ volatile("ecall");
    800015d8:	00000073          	ecall
}
    800015dc:	00813403          	ld	s0,8(sp)
    800015e0:	01010113          	addi	sp,sp,16
    800015e4:	00008067          	ret

00000000800015e8 <_ZN9Scheduler3putEP3TCB>:
//Scheduler* Scheduler::singleton = nullptr;
TCB* Scheduler::head = nullptr;
TCB* Scheduler::tail = nullptr;
TCB* Scheduler::sleepingHead = nullptr;

void Scheduler::put(TCB* tcb) {
    800015e8:	ff010113          	addi	sp,sp,-16
    800015ec:	00813423          	sd	s0,8(sp)
    800015f0:	01010413          	addi	s0,sp,16
	if (tail == nullptr) {
    800015f4:	00006797          	auipc	a5,0x6
    800015f8:	dac7b783          	ld	a5,-596(a5) # 800073a0 <_ZN9Scheduler4tailE>
    800015fc:	00078e63          	beqz	a5,80001618 <_ZN9Scheduler3putEP3TCB+0x30>
		head = tail = tcb;
	} else {
		tail->nextInScheduler = tcb;
    80001600:	02a7bc23          	sd	a0,56(a5)
		tail = tcb;
    80001604:	00006797          	auipc	a5,0x6
    80001608:	d8a7be23          	sd	a0,-612(a5) # 800073a0 <_ZN9Scheduler4tailE>
	}
}
    8000160c:	00813403          	ld	s0,8(sp)
    80001610:	01010113          	addi	sp,sp,16
    80001614:	00008067          	ret
		head = tail = tcb;
    80001618:	00006797          	auipc	a5,0x6
    8000161c:	d8878793          	addi	a5,a5,-632 # 800073a0 <_ZN9Scheduler4tailE>
    80001620:	00a7b023          	sd	a0,0(a5)
    80001624:	00a7b423          	sd	a0,8(a5)
    80001628:	fe5ff06f          	j	8000160c <_ZN9Scheduler3putEP3TCB+0x24>

000000008000162c <_ZN9Scheduler3getEv>:

TCB* Scheduler::get() {
    8000162c:	ff010113          	addi	sp,sp,-16
    80001630:	00813423          	sd	s0,8(sp)
    80001634:	01010413          	addi	s0,sp,16
	TCB* firstThread = head;
    80001638:	00006717          	auipc	a4,0x6
    8000163c:	d6870713          	addi	a4,a4,-664 # 800073a0 <_ZN9Scheduler4tailE>
    80001640:	00873503          	ld	a0,8(a4)
	head = head->nextInScheduler;
    80001644:	03853783          	ld	a5,56(a0) # 1038 <_entry-0x7fffefc8>
    80001648:	00f73423          	sd	a5,8(a4)
	if (head == nullptr) {
    8000164c:	00078a63          	beqz	a5,80001660 <_ZN9Scheduler3getEv+0x34>
		tail = head = nullptr;
	}
	firstThread->nextInScheduler = nullptr;
    80001650:	02053c23          	sd	zero,56(a0)
	return firstThread;
}
    80001654:	00813403          	ld	s0,8(sp)
    80001658:	01010113          	addi	sp,sp,16
    8000165c:	00008067          	ret
		tail = head = nullptr;
    80001660:	00073423          	sd	zero,8(a4)
    80001664:	00073023          	sd	zero,0(a4)
    80001668:	fe9ff06f          	j	80001650 <_ZN9Scheduler3getEv+0x24>

000000008000166c <_ZN9Scheduler10putToSleepEP3TCBm>:

void Scheduler::putToSleep(TCB* tcb, time_t sleepTime) {
    8000166c:	ff010113          	addi	sp,sp,-16
    80001670:	00813423          	sd	s0,8(sp)
    80001674:	01010413          	addi	s0,sp,16
	if (sleepingHead == nullptr) {
    80001678:	00006817          	auipc	a6,0x6
    8000167c:	d3883803          	ld	a6,-712(a6) # 800073b0 <_ZN9Scheduler12sleepingHeadE>
    80001680:	02080863          	beqz	a6,800016b0 <_ZN9Scheduler10putToSleepEP3TCBm+0x44>
		tcb->timeToSleep = sleepTime;
		return;
	}
	TCB* prevSleeping = nullptr;
	time_t accumulated = 0;
	TCB* current = sleepingHead;
    80001684:	00080793          	mv	a5,a6
	time_t accumulated = 0;
    80001688:	00000693          	li	a3,0
	TCB* prevSleeping = nullptr;
    8000168c:	00000613          	li	a2,0
	for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
    80001690:	02078863          	beqz	a5,800016c0 <_ZN9Scheduler10putToSleepEP3TCBm+0x54>
    80001694:	0407b703          	ld	a4,64(a5)
    80001698:	00d70733          	add	a4,a4,a3
    8000169c:	02b77263          	bgeu	a4,a1,800016c0 <_ZN9Scheduler10putToSleepEP3TCBm+0x54>
		accumulated += current->timeToSleep;
    800016a0:	00070693          	mv	a3,a4
		prevSleeping = current;
    800016a4:	00078613          	mv	a2,a5
	for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
    800016a8:	0487b783          	ld	a5,72(a5)
    800016ac:	fe5ff06f          	j	80001690 <_ZN9Scheduler10putToSleepEP3TCBm+0x24>
		sleepingHead = tcb;
    800016b0:	00006797          	auipc	a5,0x6
    800016b4:	d0a7b023          	sd	a0,-768(a5) # 800073b0 <_ZN9Scheduler12sleepingHeadE>
		tcb->timeToSleep = sleepTime;
    800016b8:	04b53023          	sd	a1,64(a0)
		return;
    800016bc:	02c0006f          	j	800016e8 <_ZN9Scheduler10putToSleepEP3TCBm+0x7c>
	}
	if (!prevSleeping) {
    800016c0:	02060a63          	beqz	a2,800016f4 <_ZN9Scheduler10putToSleepEP3TCBm+0x88>
		sleepingHead = tcb;
		tcb->timeToSleep = sleepTime;
		tcb->nextSleeping->timeToSleep -= sleepTime;
		return;
	}
	tcb->nextSleeping = current;
    800016c4:	04f53423          	sd	a5,72(a0)
	prevSleeping->nextSleeping = tcb;
    800016c8:	04a63423          	sd	a0,72(a2)
	tcb->timeToSleep = sleepTime - accumulated;
    800016cc:	40d58733          	sub	a4,a1,a3
    800016d0:	04e53023          	sd	a4,64(a0)
	if (current) current->timeToSleep -= sleepTime - accumulated;
    800016d4:	00078a63          	beqz	a5,800016e8 <_ZN9Scheduler10putToSleepEP3TCBm+0x7c>
    800016d8:	40b686b3          	sub	a3,a3,a1
    800016dc:	0407b703          	ld	a4,64(a5)
    800016e0:	00d706b3          	add	a3,a4,a3
    800016e4:	04d7b023          	sd	a3,64(a5)
}
    800016e8:	00813403          	ld	s0,8(sp)
    800016ec:	01010113          	addi	sp,sp,16
    800016f0:	00008067          	ret
		tcb->nextSleeping = sleepingHead;
    800016f4:	05053423          	sd	a6,72(a0)
		sleepingHead = tcb;
    800016f8:	00006797          	auipc	a5,0x6
    800016fc:	caa7bc23          	sd	a0,-840(a5) # 800073b0 <_ZN9Scheduler12sleepingHeadE>
		tcb->timeToSleep = sleepTime;
    80001700:	04b53023          	sd	a1,64(a0)
		tcb->nextSleeping->timeToSleep -= sleepTime;
    80001704:	04083683          	ld	a3,64(a6)
    80001708:	40b686b3          	sub	a3,a3,a1
    8000170c:	04d83023          	sd	a3,64(a6)
		return;
    80001710:	fd9ff06f          	j	800016e8 <_ZN9Scheduler10putToSleepEP3TCBm+0x7c>

0000000080001714 <_ZN9Scheduler4wakeEv>:

void Scheduler::wake() {
	if (!sleepingHead) return;
    80001714:	00006797          	auipc	a5,0x6
    80001718:	c9c7b783          	ld	a5,-868(a5) # 800073b0 <_ZN9Scheduler12sleepingHeadE>
    8000171c:	06078a63          	beqz	a5,80001790 <_ZN9Scheduler4wakeEv+0x7c>
	sleepingHead->timeToSleep--;
    80001720:	0407b703          	ld	a4,64(a5)
    80001724:	fff70713          	addi	a4,a4,-1
    80001728:	04e7b023          	sd	a4,64(a5)
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    8000172c:	00006517          	auipc	a0,0x6
    80001730:	c8453503          	ld	a0,-892(a0) # 800073b0 <_ZN9Scheduler12sleepingHeadE>
    80001734:	04050e63          	beqz	a0,80001790 <_ZN9Scheduler4wakeEv+0x7c>
    80001738:	04053783          	ld	a5,64(a0)
    8000173c:	04079a63          	bnez	a5,80001790 <_ZN9Scheduler4wakeEv+0x7c>
void Scheduler::wake() {
    80001740:	ff010113          	addi	sp,sp,-16
    80001744:	00113423          	sd	ra,8(sp)
    80001748:	00813023          	sd	s0,0(sp)
    8000174c:	01010413          	addi	s0,sp,16
    80001750:	00c0006f          	j	8000175c <_ZN9Scheduler4wakeEv+0x48>
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001754:	04053783          	ld	a5,64(a0)
    80001758:	02079463          	bnez	a5,80001780 <_ZN9Scheduler4wakeEv+0x6c>
		TCB* thread = sleepingHead;
		sleepingHead = sleepingHead->nextSleeping;
    8000175c:	04853783          	ld	a5,72(a0)
    80001760:	00006717          	auipc	a4,0x6
    80001764:	c4f73823          	sd	a5,-944(a4) # 800073b0 <_ZN9Scheduler12sleepingHeadE>
		thread->nextSleeping = nullptr;
    80001768:	04053423          	sd	zero,72(a0)
		Scheduler::put(thread);
    8000176c:	00000097          	auipc	ra,0x0
    80001770:	e7c080e7          	jalr	-388(ra) # 800015e8 <_ZN9Scheduler3putEP3TCB>
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001774:	00006517          	auipc	a0,0x6
    80001778:	c3c53503          	ld	a0,-964(a0) # 800073b0 <_ZN9Scheduler12sleepingHeadE>
    8000177c:	fc051ce3          	bnez	a0,80001754 <_ZN9Scheduler4wakeEv+0x40>
	}
}
    80001780:	00813083          	ld	ra,8(sp)
    80001784:	00013403          	ld	s0,0(sp)
    80001788:	01010113          	addi	sp,sp,16
    8000178c:	00008067          	ret
    80001790:	00008067          	ret

0000000080001794 <main>:
}


#pragma GCC optimize("O0")

int main() {
    80001794:	f9010113          	addi	sp,sp,-112
    80001798:	06113423          	sd	ra,104(sp)
    8000179c:	06813023          	sd	s0,96(sp)
    800017a0:	04913c23          	sd	s1,88(sp)
    800017a4:	07010413          	addi	s0,sp,112
	//postavi adresu prekidne rutine u stvec
	Riscv::w_stvec((uint64)&interruptHandler);
    800017a8:	00006797          	auipc	a5,0x6
    800017ac:	ba87b783          	ld	a5,-1112(a5) # 80007350 <_GLOBAL_OFFSET_TABLE_+0x50>
    800017b0:	00078513          	mv	a0,a5
    800017b4:	00000097          	auipc	ra,0x0
    800017b8:	228080e7          	jalr	552(ra) # 800019dc <_ZN5Riscv7w_stvecEm>

	sem_open(&semA, 0);
    800017bc:	00000593          	li	a1,0
    800017c0:	00006517          	auipc	a0,0x6
    800017c4:	bf850513          	addi	a0,a0,-1032 # 800073b8 <semA>
    800017c8:	00000097          	auipc	ra,0x0
    800017cc:	cb8080e7          	jalr	-840(ra) # 80001480 <_Z8sem_openPP4KSemj>
//	printInteger(*(lista->peekFirst()));
//	delete lista;
//	println("");

	//testiranje kreiranja niti
	thread_t glavnaNit = nullptr;
    800017d0:	fa043823          	sd	zero,-80(s0)
	thread_t nit1 = nullptr;
    800017d4:	fc043c23          	sd	zero,-40(s0)
	thread_t nit2 = nullptr;
    800017d8:	fc043823          	sd	zero,-48(s0)
	thread_t nit3 = nullptr;
    800017dc:	fc043423          	sd	zero,-56(s0)
	thread_t idleNit = nullptr;
    800017e0:	fa043423          	sd	zero,-88(s0)
	thread_create(&glavnaNit, nullptr, nullptr);
    800017e4:	fb040793          	addi	a5,s0,-80
    800017e8:	00000613          	li	a2,0
    800017ec:	00000593          	li	a1,0
    800017f0:	00078513          	mv	a0,a5
    800017f4:	00000097          	auipc	ra,0x0
    800017f8:	b6c080e7          	jalr	-1172(ra) # 80001360 <_Z13thread_createPP3TCBPFvPvES2_>
	TCB::running = glavnaNit;
    800017fc:	fb043703          	ld	a4,-80(s0)
    80001800:	00006797          	auipc	a5,0x6
    80001804:	b407b783          	ld	a5,-1216(a5) # 80007340 <_GLOBAL_OFFSET_TABLE_+0x40>
    80001808:	00e7b023          	sd	a4,0(a5)
	uint64* arg = new uint64;
    8000180c:	00800513          	li	a0,8
    80001810:	00001097          	auipc	ra,0x1
    80001814:	998080e7          	jalr	-1640(ra) # 800021a8 <_Znwm>
    80001818:	00050793          	mv	a5,a0
    8000181c:	fcf43023          	sd	a5,-64(s0)
	*arg = 666;
    80001820:	fc043783          	ld	a5,-64(s0)
    80001824:	29a00713          	li	a4,666
    80001828:	00e7b023          	sd	a4,0(a5)
	ThreadQueue* q = new ThreadQueue();
    8000182c:	01000513          	li	a0,16
    80001830:	00000097          	auipc	ra,0x0
    80001834:	26c080e7          	jalr	620(ra) # 80001a9c <_ZN11ThreadQueuenwEm>
    80001838:	00050493          	mv	s1,a0
    8000183c:	00048513          	mv	a0,s1
    80001840:	00000097          	auipc	ra,0x0
    80001844:	1f0080e7          	jalr	496(ra) # 80001a30 <_ZN11ThreadQueueC1Ev>
    80001848:	fa943c23          	sd	s1,-72(s0)
	q->putLast(nit3);
    8000184c:	fc843583          	ld	a1,-56(s0)
    80001850:	fb843503          	ld	a0,-72(s0)
    80001854:	00000097          	auipc	ra,0x0
    80001858:	9d0080e7          	jalr	-1584(ra) # 80001224 <_ZN11ThreadQueue7putLastEP3TCB>
	q->putLast(nit2);
    8000185c:	fd043583          	ld	a1,-48(s0)
    80001860:	fb843503          	ld	a0,-72(s0)
    80001864:	00000097          	auipc	ra,0x0
    80001868:	9c0080e7          	jalr	-1600(ra) # 80001224 <_ZN11ThreadQueue7putLastEP3TCB>
	q->putLast(nit1);
    8000186c:	fd843583          	ld	a1,-40(s0)
    80001870:	fb843503          	ld	a0,-72(s0)
    80001874:	00000097          	auipc	ra,0x0
    80001878:	9b0080e7          	jalr	-1616(ra) # 80001224 <_ZN11ThreadQueue7putLastEP3TCB>
	thread_t nitred3 = q->getFirst();
    8000187c:	fb843503          	ld	a0,-72(s0)
    80001880:	00000097          	auipc	ra,0x0
    80001884:	a10080e7          	jalr	-1520(ra) # 80001290 <_ZN11ThreadQueue8getFirstEv>
    80001888:	00050793          	mv	a5,a0
    8000188c:	faf43023          	sd	a5,-96(s0)
	thread_t nitred2 = q->getFirst();
    80001890:	fb843503          	ld	a0,-72(s0)
    80001894:	00000097          	auipc	ra,0x0
    80001898:	9fc080e7          	jalr	-1540(ra) # 80001290 <_ZN11ThreadQueue8getFirstEv>
    8000189c:	00050793          	mv	a5,a0
    800018a0:	f8f43c23          	sd	a5,-104(s0)
	thread_t nitred1 = q->getFirst();
    800018a4:	fb843503          	ld	a0,-72(s0)
    800018a8:	00000097          	auipc	ra,0x0
    800018ac:	9e8080e7          	jalr	-1560(ra) # 80001290 <_ZN11ThreadQueue8getFirstEv>
    800018b0:	00050793          	mv	a5,a0
    800018b4:	f8f43823          	sd	a5,-112(s0)
	thread_create(&idleNit, idle, nullptr);
    800018b8:	fa840793          	addi	a5,s0,-88
    800018bc:	00000613          	li	a2,0
    800018c0:	00000597          	auipc	a1,0x0
    800018c4:	10c58593          	addi	a1,a1,268 # 800019cc <_Z4idlePv>
    800018c8:	00078513          	mv	a0,a5
    800018cc:	00000097          	auipc	ra,0x0
    800018d0:	a94080e7          	jalr	-1388(ra) # 80001360 <_Z13thread_createPP3TCBPFvPvES2_>
	thread_create(&nitred1, nit1f, nullptr);
    800018d4:	f9040793          	addi	a5,s0,-112
    800018d8:	00000613          	li	a2,0
    800018dc:	00006597          	auipc	a1,0x6
    800018e0:	a5c5b583          	ld	a1,-1444(a1) # 80007338 <_GLOBAL_OFFSET_TABLE_+0x38>
    800018e4:	00078513          	mv	a0,a5
    800018e8:	00000097          	auipc	ra,0x0
    800018ec:	a78080e7          	jalr	-1416(ra) # 80001360 <_Z13thread_createPP3TCBPFvPvES2_>
	thread_create(&nitred2, nit2f, arg);
    800018f0:	f9840793          	addi	a5,s0,-104
    800018f4:	fc043603          	ld	a2,-64(s0)
    800018f8:	00006597          	auipc	a1,0x6
    800018fc:	a285b583          	ld	a1,-1496(a1) # 80007320 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001900:	00078513          	mv	a0,a5
    80001904:	00000097          	auipc	ra,0x0
    80001908:	a5c080e7          	jalr	-1444(ra) # 80001360 <_Z13thread_createPP3TCBPFvPvES2_>
	thread_create(&nitred3, nit3f, nullptr);
    8000190c:	fa040793          	addi	a5,s0,-96
    80001910:	00000613          	li	a2,0
    80001914:	00006597          	auipc	a1,0x6
    80001918:	a1c5b583          	ld	a1,-1508(a1) # 80007330 <_GLOBAL_OFFSET_TABLE_+0x30>
    8000191c:	00078513          	mv	a0,a5
    80001920:	00000097          	auipc	ra,0x0
    80001924:	a40080e7          	jalr	-1472(ra) # 80001360 <_Z13thread_createPP3TCBPFvPvES2_>

	//omoguci prekide
	Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    80001928:	00200513          	li	a0,2
    8000192c:	00000097          	auipc	ra,0x0
    80001930:	0cc080e7          	jalr	204(ra) # 800019f8 <_ZN5Riscv10ms_sstatusEm>

//	while (!nitred1->isFinished() || !nitred2->isFinished()) {
//		thread_dispatch();
//	}
	thread_join(nitred1);
    80001934:	f9043783          	ld	a5,-112(s0)
    80001938:	00078513          	mv	a0,a5
    8000193c:	00000097          	auipc	ra,0x0
    80001940:	aec080e7          	jalr	-1300(ra) # 80001428 <_Z11thread_joinP3TCB>
	thread_join(nitred2);
    80001944:	f9843783          	ld	a5,-104(s0)
    80001948:	00078513          	mv	a0,a5
    8000194c:	00000097          	auipc	ra,0x0
    80001950:	adc080e7          	jalr	-1316(ra) # 80001428 <_Z11thread_joinP3TCB>
	thread_join(nitred3);
    80001954:	fa043783          	ld	a5,-96(s0)
    80001958:	00078513          	mv	a0,a5
    8000195c:	00000097          	auipc	ra,0x0
    80001960:	acc080e7          	jalr	-1332(ra) # 80001428 <_Z11thread_joinP3TCB>

	printString("\nProsao while\n");
    80001964:	00004517          	auipc	a0,0x4
    80001968:	6bc50513          	addi	a0,a0,1724 # 80006020 <CONSOLE_STATUS+0x10>
    8000196c:	00000097          	auipc	ra,0x0
    80001970:	c2c080e7          	jalr	-980(ra) # 80001598 <_Z11printStringPKc>
	delete q;
    80001974:	fb843483          	ld	s1,-72(s0)
    80001978:	00048e63          	beqz	s1,80001994 <main+0x200>
    8000197c:	00048513          	mv	a0,s1
    80001980:	00000097          	auipc	ra,0x0
    80001984:	0d0080e7          	jalr	208(ra) # 80001a50 <_ZN11ThreadQueueD1Ev>
    80001988:	00048513          	mv	a0,s1
    8000198c:	00000097          	auipc	ra,0x0
    80001990:	138080e7          	jalr	312(ra) # 80001ac4 <_ZN11ThreadQueuedlEPv>
	//zabrani prekide
	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    80001994:	00200513          	li	a0,2
    80001998:	00000097          	auipc	ra,0x0
    8000199c:	07c080e7          	jalr	124(ra) # 80001a14 <_ZN5Riscv10mc_sstatusEm>
	printString("\nSad cu da izadjem\n");
    800019a0:	00004517          	auipc	a0,0x4
    800019a4:	69050513          	addi	a0,a0,1680 # 80006030 <CONSOLE_STATUS+0x20>
    800019a8:	00000097          	auipc	ra,0x0
    800019ac:	bf0080e7          	jalr	-1040(ra) # 80001598 <_Z11printStringPKc>
//	thread_create(&userHandle, (TCB::Body)userMain, nullptr);
//	while (!userHandle->isFinished()) {
//		thread_dispatch();
//	}
//	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
	return 0;
    800019b0:	00000793          	li	a5,0
    800019b4:	00078513          	mv	a0,a5
    800019b8:	06813083          	ld	ra,104(sp)
    800019bc:	06013403          	ld	s0,96(sp)
    800019c0:	05813483          	ld	s1,88(sp)
    800019c4:	07010113          	addi	sp,sp,112
    800019c8:	00008067          	ret

00000000800019cc <_Z4idlePv>:
void idle(void*) {
    800019cc:	ff010113          	addi	sp,sp,-16
    800019d0:	00813423          	sd	s0,8(sp)
    800019d4:	01010413          	addi	s0,sp,16
	while (1) {}
    800019d8:	0000006f          	j	800019d8 <_Z4idlePv+0xc>

00000000800019dc <_ZN5Riscv7w_stvecEm>:
	uint64 volatile stvec;
	__asm__ volatile("csrr %[stvec], stvec": [stvec] "=r"(stvec));
	return stvec;
}

inline void Riscv::w_stvec(uint64 stvec) {
    800019dc:	ff010113          	addi	sp,sp,-16
    800019e0:	00813423          	sd	s0,8(sp)
    800019e4:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw stvec, %[stvec]": :[stvec] "r"(stvec));
    800019e8:	10551073          	csrw	stvec,a0
}
    800019ec:	00813403          	ld	s0,8(sp)
    800019f0:	01010113          	addi	sp,sp,16
    800019f4:	00008067          	ret

00000000800019f8 <_ZN5Riscv10ms_sstatusEm>:

inline void Riscv::w_sip(uint64 sip) {
	__asm__ volatile("csrw sip, %[sip]": :[sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
    800019f8:	ff010113          	addi	sp,sp,-16
    800019fc:	00813423          	sd	s0,8(sp)
    80001a00:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80001a04:	10052073          	csrs	sstatus,a0
}
    80001a08:	00813403          	ld	s0,8(sp)
    80001a0c:	01010113          	addi	sp,sp,16
    80001a10:	00008067          	ret

0000000080001a14 <_ZN5Riscv10mc_sstatusEm>:

inline void Riscv::mc_sstatus(uint64 mask) {
    80001a14:	ff010113          	addi	sp,sp,-16
    80001a18:	00813423          	sd	s0,8(sp)
    80001a1c:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80001a20:	10053073          	csrc	sstatus,a0
}
    80001a24:	00813403          	ld	s0,8(sp)
    80001a28:	01010113          	addi	sp,sp,16
    80001a2c:	00008067          	ret

0000000080001a30 <_ZN11ThreadQueueC1Ev>:

	Node* front;
	Node* back;

public:
	ThreadQueue() : front(nullptr), back(nullptr) {}
    80001a30:	ff010113          	addi	sp,sp,-16
    80001a34:	00813423          	sd	s0,8(sp)
    80001a38:	01010413          	addi	s0,sp,16
    80001a3c:	00053023          	sd	zero,0(a0)
    80001a40:	00053423          	sd	zero,8(a0)
    80001a44:	00813403          	ld	s0,8(sp)
    80001a48:	01010113          	addi	sp,sp,16
    80001a4c:	00008067          	ret

0000000080001a50 <_ZN11ThreadQueueD1Ev>:

	ThreadQueue(const ThreadQueue&) = delete;

	ThreadQueue& operator=(const ThreadQueue&) = delete;

	~ThreadQueue() {
    80001a50:	fe010113          	addi	sp,sp,-32
    80001a54:	00113c23          	sd	ra,24(sp)
    80001a58:	00813823          	sd	s0,16(sp)
    80001a5c:	00913423          	sd	s1,8(sp)
    80001a60:	02010413          	addi	s0,sp,32
    80001a64:	00050493          	mv	s1,a0
			delete node;
		}
	}

	bool isEmpty() const {
		return front == nullptr;
    80001a68:	0004b503          	ld	a0,0(s1)
		while (!isEmpty()) {
    80001a6c:	00050e63          	beqz	a0,80001a88 <_ZN11ThreadQueueD1Ev+0x38>
			front = front->next;
    80001a70:	00853783          	ld	a5,8(a0)
    80001a74:	00f4b023          	sd	a5,0(s1)
			delete node;
    80001a78:	fe0508e3          	beqz	a0,80001a68 <_ZN11ThreadQueueD1Ev+0x18>
			mem_free(ptr);
    80001a7c:	00000097          	auipc	ra,0x0
    80001a80:	8b4080e7          	jalr	-1868(ra) # 80001330 <_Z8mem_freePv>
		}
    80001a84:	fe5ff06f          	j	80001a68 <_ZN11ThreadQueueD1Ev+0x18>
	}
    80001a88:	01813083          	ld	ra,24(sp)
    80001a8c:	01013403          	ld	s0,16(sp)
    80001a90:	00813483          	ld	s1,8(sp)
    80001a94:	02010113          	addi	sp,sp,32
    80001a98:	00008067          	ret

0000000080001a9c <_ZN11ThreadQueuenwEm>:
	void putLast(TCB* tcb);

	TCB* getFirst();

	// Overriding new and delete operators for ThreadQueue
	static void* operator new(size_t size) {
    80001a9c:	ff010113          	addi	sp,sp,-16
    80001aa0:	00113423          	sd	ra,8(sp)
    80001aa4:	00813023          	sd	s0,0(sp)
    80001aa8:	01010413          	addi	s0,sp,16
		return mem_alloc(size);
    80001aac:	00000097          	auipc	ra,0x0
    80001ab0:	844080e7          	jalr	-1980(ra) # 800012f0 <_Z9mem_allocm>
	}
    80001ab4:	00813083          	ld	ra,8(sp)
    80001ab8:	00013403          	ld	s0,0(sp)
    80001abc:	01010113          	addi	sp,sp,16
    80001ac0:	00008067          	ret

0000000080001ac4 <_ZN11ThreadQueuedlEPv>:

	static void operator delete(void* ptr) {
    80001ac4:	ff010113          	addi	sp,sp,-16
    80001ac8:	00113423          	sd	ra,8(sp)
    80001acc:	00813023          	sd	s0,0(sp)
    80001ad0:	01010413          	addi	s0,sp,16
		mem_free(ptr);
    80001ad4:	00000097          	auipc	ra,0x0
    80001ad8:	85c080e7          	jalr	-1956(ra) # 80001330 <_Z8mem_freePv>
	}
    80001adc:	00813083          	ld	ra,8(sp)
    80001ae0:	00013403          	ld	s0,0(sp)
    80001ae4:	01010113          	addi	sp,sp,16
    80001ae8:	00008067          	ret

0000000080001aec <interruptRoutine>:
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"
#include "../h/KSem.hpp"

#pragma GCC optimize("O0")
extern "C" void interruptRoutine() {
    80001aec:	ef010113          	addi	sp,sp,-272
    80001af0:	10113423          	sd	ra,264(sp)
    80001af4:	10813023          	sd	s0,256(sp)
    80001af8:	11010413          	addi	s0,sp,272
	uint64 scause, sepc, sstatus;
	__asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001afc:	14202373          	csrr	t1,scause
    80001b00:	fc643c23          	sd	t1,-40(s0)
	__asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001b04:	14102373          	csrr	t1,sepc
    80001b08:	fc643823          	sd	t1,-48(s0)
	__asm__ volatile("csrr %[status], sstatus":[status] "=r"(
			sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001b0c:	10002373          	csrr	t1,sstatus
    80001b10:	fc643423          	sd	t1,-56(s0)
	uint64 a0, a1, a2, a3, a4, a5, a6, a7;
	__asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001b14:	00050313          	mv	t1,a0
    80001b18:	fc643023          	sd	t1,-64(s0)
	__asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001b1c:	00058313          	mv	t1,a1
    80001b20:	fa643c23          	sd	t1,-72(s0)
	__asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001b24:	00060313          	mv	t1,a2
    80001b28:	fa643823          	sd	t1,-80(s0)
	__asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001b2c:	00068313          	mv	t1,a3
    80001b30:	fa643423          	sd	t1,-88(s0)
	__asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001b34:	00070313          	mv	t1,a4
    80001b38:	fa643023          	sd	t1,-96(s0)
	__asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001b3c:	00078313          	mv	t1,a5
    80001b40:	f8643c23          	sd	t1,-104(s0)
	__asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001b44:	00080313          	mv	t1,a6
    80001b48:	f8643823          	sd	t1,-112(s0)
	__asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001b4c:	00088313          	mv	t1,a7
    80001b50:	f8643423          	sd	t1,-120(s0)

	if (scause == 0x09 || scause == 0x08) {
    80001b54:	fd843703          	ld	a4,-40(s0)
    80001b58:	00900793          	li	a5,9
    80001b5c:	00f70863          	beq	a4,a5,80001b6c <interruptRoutine+0x80>
    80001b60:	fd843703          	ld	a4,-40(s0)
    80001b64:	00800793          	li	a5,8
    80001b68:	44f71e63          	bne	a4,a5,80001fc4 <interruptRoutine+0x4d8>
		//prekid zbog poziva ecall
		uint64 opCode = a0;
    80001b6c:	fc043783          	ld	a5,-64(s0)
    80001b70:	f8f43023          	sd	a5,-128(s0)
		switch (opCode) {
    80001b74:	f8043703          	ld	a4,-128(s0)
    80001b78:	09100793          	li	a5,145
    80001b7c:	2cf70c63          	beq	a4,a5,80001e54 <interruptRoutine+0x368>
    80001b80:	f8043703          	ld	a4,-128(s0)
    80001b84:	09100793          	li	a5,145
    80001b88:	3ae7ea63          	bltu	a5,a4,80001f3c <interruptRoutine+0x450>
    80001b8c:	f8043703          	ld	a4,-128(s0)
    80001b90:	04200793          	li	a5,66
    80001b94:	04e7e263          	bltu	a5,a4,80001bd8 <interruptRoutine+0xec>
    80001b98:	f8043783          	ld	a5,-128(s0)
    80001b9c:	3a078063          	beqz	a5,80001f3c <interruptRoutine+0x450>
    80001ba0:	f8043703          	ld	a4,-128(s0)
    80001ba4:	04200793          	li	a5,66
    80001ba8:	38e7ea63          	bltu	a5,a4,80001f3c <interruptRoutine+0x450>
    80001bac:	f8043783          	ld	a5,-128(s0)
    80001bb0:	00279713          	slli	a4,a5,0x2
    80001bb4:	00004797          	auipc	a5,0x4
    80001bb8:	4f078793          	addi	a5,a5,1264 # 800060a4 <CONSOLE_STATUS+0x94>
    80001bbc:	00f707b3          	add	a5,a4,a5
    80001bc0:	0007a783          	lw	a5,0(a5)
    80001bc4:	0007871b          	sext.w	a4,a5
    80001bc8:	00004797          	auipc	a5,0x4
    80001bcc:	4dc78793          	addi	a5,a5,1244 # 800060a4 <CONSOLE_STATUS+0x94>
    80001bd0:	00f707b3          	add	a5,a4,a5
    80001bd4:	00078067          	jr	a5
    80001bd8:	f8043703          	ld	a4,-128(s0)
    80001bdc:	09000793          	li	a5,144
    80001be0:	22f70e63          	beq	a4,a5,80001e1c <interruptRoutine+0x330>
    80001be4:	3580006f          	j	80001f3c <interruptRoutine+0x450>
			case 0x01:
				//mem_alloc
				size_t size;
				size = (size_t)a1;
    80001be8:	fb843783          	ld	a5,-72(s0)
    80001bec:	f0f43423          	sd	a5,-248(s0)
				//__asm__ volatile("mv %[size], a1":[size] "=r"(size));
				size = size * MEM_BLOCK_SIZE;
    80001bf0:	f0843783          	ld	a5,-248(s0)
    80001bf4:	00679793          	slli	a5,a5,0x6
    80001bf8:	f0f43423          	sd	a5,-248(s0)
				MemoryAllocator::kmalloc(size);
    80001bfc:	00300593          	li	a1,3
    80001c00:	f0843503          	ld	a0,-248(s0)
    80001c04:	00001097          	auipc	ra,0x1
    80001c08:	c6c080e7          	jalr	-916(ra) # 80002870 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
				__asm__ volatile("sd a0, 80(s0)");
    80001c0c:	04a43823          	sd	a0,80(s0)
				break;
    80001c10:	3980006f          	j	80001fa8 <interruptRoutine+0x4bc>
			case 0x02:
				//mem_free
				void* ptr;
				ptr = (void*)a1;
    80001c14:	fb843783          	ld	a5,-72(s0)
    80001c18:	f0f43823          	sd	a5,-240(s0)
				//__asm__ volatile("mv %[ptr], a1" :[ptr]"=r"(ptr));
				MemoryAllocator::kfree(ptr);
    80001c1c:	f1043503          	ld	a0,-240(s0)
    80001c20:	00001097          	auipc	ra,0x1
    80001c24:	dfc080e7          	jalr	-516(ra) # 80002a1c <_ZN15MemoryAllocator5kfreeEPv>
				__asm__ volatile("sd a0, 80(s0)");
    80001c28:	04a43823          	sd	a0,80(s0)
				break;
    80001c2c:	37c0006f          	j	80001fa8 <interruptRoutine+0x4bc>
			case 0x11:
				//thread_create
				thread_t* handle;
				handle = (thread_t*)a1;
    80001c30:	fb843783          	ld	a5,-72(s0)
    80001c34:	f2f43823          	sd	a5,-208(s0)
				void (* function)(void*);
				function = (void (*)(void*))a2;
    80001c38:	fb043783          	ld	a5,-80(s0)
    80001c3c:	f2f43423          	sd	a5,-216(s0)
				void* args;
				args = (void*)a3;
    80001c40:	fa843783          	ld	a5,-88(s0)
    80001c44:	f2f43023          	sd	a5,-224(s0)
				uint64* sp;
				sp = (uint64*)a4;
    80001c48:	fa043783          	ld	a5,-96(s0)
    80001c4c:	f0f43c23          	sd	a5,-232(s0)

				*handle = TCB::createThread(function, args, sp);
    80001c50:	f1843603          	ld	a2,-232(s0)
    80001c54:	f2043583          	ld	a1,-224(s0)
    80001c58:	f2843503          	ld	a0,-216(s0)
    80001c5c:	00001097          	auipc	ra,0x1
    80001c60:	a20080e7          	jalr	-1504(ra) # 8000267c <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80001c64:	00050713          	mv	a4,a0
    80001c68:	f3043783          	ld	a5,-208(s0)
    80001c6c:	00e7b023          	sd	a4,0(a5)
				TCB::start(*handle);
    80001c70:	f3043783          	ld	a5,-208(s0)
    80001c74:	0007b783          	ld	a5,0(a5)
    80001c78:	00078513          	mv	a0,a5
    80001c7c:	00001097          	auipc	ra,0x1
    80001c80:	ba0080e7          	jalr	-1120(ra) # 8000281c <_ZN3TCB5startEPS_>
				if (*handle != nullptr) {
    80001c84:	f3043783          	ld	a5,-208(s0)
    80001c88:	0007b783          	ld	a5,0(a5)
    80001c8c:	00078663          	beqz	a5,80001c98 <interruptRoutine+0x1ac>
					__asm__ volatile("li a0, 0");
    80001c90:	00000513          	li	a0,0
    80001c94:	0080006f          	j	80001c9c <interruptRoutine+0x1b0>
				} else {
					__asm__ volatile("li a0, -1");
    80001c98:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    80001c9c:	04a43823          	sd	a0,80(s0)
				break;
    80001ca0:	3080006f          	j	80001fa8 <interruptRoutine+0x4bc>
			case 0x12:
				//thread_exit
				TCB::running->setFinished(true);
    80001ca4:	00005797          	auipc	a5,0x5
    80001ca8:	69c7b783          	ld	a5,1692(a5) # 80007340 <_GLOBAL_OFFSET_TABLE_+0x40>
    80001cac:	0007b783          	ld	a5,0(a5)
    80001cb0:	00100593          	li	a1,1
    80001cb4:	00078513          	mv	a0,a5
    80001cb8:	00000097          	auipc	ra,0x0
    80001cbc:	488080e7          	jalr	1160(ra) # 80002140 <_ZN3TCB11setFinishedEb>
				TCB::releaseJoined();
    80001cc0:	00001097          	auipc	ra,0x1
    80001cc4:	b00080e7          	jalr	-1280(ra) # 800027c0 <_ZN3TCB13releaseJoinedEv>
				TCB::yield();
    80001cc8:	00001097          	auipc	ra,0x1
    80001ccc:	94c080e7          	jalr	-1716(ra) # 80002614 <_ZN3TCB5yieldEv>
				break;
    80001cd0:	2d80006f          	j	80001fa8 <interruptRoutine+0x4bc>
			case 0x13:
				//thread_dispatch
				TCB::yield();
    80001cd4:	00001097          	auipc	ra,0x1
    80001cd8:	940080e7          	jalr	-1728(ra) # 80002614 <_ZN3TCB5yieldEv>
				break;
    80001cdc:	2cc0006f          	j	80001fa8 <interruptRoutine+0x4bc>
			case 0x14:
				//thread_join
				thread_t handleToJoin;
				handleToJoin = (thread_t)a1;
    80001ce0:	fb843783          	ld	a5,-72(s0)
    80001ce4:	f2f43c23          	sd	a5,-200(s0)
				TCB::threadJoin(handleToJoin);
    80001ce8:	f3843503          	ld	a0,-200(s0)
    80001cec:	00001097          	auipc	ra,0x1
    80001cf0:	a8c080e7          	jalr	-1396(ra) # 80002778 <_ZN3TCB10threadJoinEPS_>
				TCB::yield();
    80001cf4:	00001097          	auipc	ra,0x1
    80001cf8:	920080e7          	jalr	-1760(ra) # 80002614 <_ZN3TCB5yieldEv>
				break;
    80001cfc:	2ac0006f          	j	80001fa8 <interruptRoutine+0x4bc>
			case 0x21:
				//sem_open
				sem_t* openHandle;
				openHandle = (sem_t*)a1;
    80001d00:	fb843783          	ld	a5,-72(s0)
    80001d04:	f4f43423          	sd	a5,-184(s0)
				uint initVal;
				initVal = (uint)a2;
    80001d08:	fb043783          	ld	a5,-80(s0)
    80001d0c:	f4f42223          	sw	a5,-188(s0)
				*openHandle = KSem::initSem(initVal);
    80001d10:	f4442783          	lw	a5,-188(s0)
    80001d14:	00078513          	mv	a0,a5
    80001d18:	00001097          	auipc	ra,0x1
    80001d1c:	ea0080e7          	jalr	-352(ra) # 80002bb8 <_ZN4KSem7initSemEj>
    80001d20:	00050713          	mv	a4,a0
    80001d24:	f4843783          	ld	a5,-184(s0)
    80001d28:	00e7b023          	sd	a4,0(a5)
				if (*openHandle != nullptr) {
    80001d2c:	f4843783          	ld	a5,-184(s0)
    80001d30:	0007b783          	ld	a5,0(a5)
    80001d34:	00078663          	beqz	a5,80001d40 <interruptRoutine+0x254>
					__asm__ volatile("li a0, 0");
    80001d38:	00000513          	li	a0,0
    80001d3c:	0080006f          	j	80001d44 <interruptRoutine+0x258>
				} else {
					__asm__ volatile("li a0, -1");
    80001d40:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    80001d44:	04a43823          	sd	a0,80(s0)
				break;
    80001d48:	2600006f          	j	80001fa8 <interruptRoutine+0x4bc>
			case 0x22:
				//sem_close
				sem_t closeHandle;
				closeHandle = (sem_t)a1;
    80001d4c:	fb843783          	ld	a5,-72(s0)
    80001d50:	f4f43823          	sd	a5,-176(s0)
				KSem::closeSem(closeHandle);
    80001d54:	f5043503          	ld	a0,-176(s0)
    80001d58:	00001097          	auipc	ra,0x1
    80001d5c:	028080e7          	jalr	40(ra) # 80002d80 <_ZN4KSem8closeSemEPS_>
				__asm__ volatile("sd a0, 80(s0)");
    80001d60:	04a43823          	sd	a0,80(s0)
				break;
    80001d64:	2440006f          	j	80001fa8 <interruptRoutine+0x4bc>
			case 0x23:
				//sem_wait
				sem_t waitHandle;
				waitHandle = (sem_t)a1;
    80001d68:	fb843783          	ld	a5,-72(s0)
    80001d6c:	f4f43c23          	sd	a5,-168(s0)
				waitHandle->wait();
    80001d70:	f5843503          	ld	a0,-168(s0)
    80001d74:	00001097          	auipc	ra,0x1
    80001d78:	ed8080e7          	jalr	-296(ra) # 80002c4c <_ZN4KSem4waitEv>
				__asm__ volatile("sd a0, 80(s0)");
    80001d7c:	04a43823          	sd	a0,80(s0)
				break;
    80001d80:	2280006f          	j	80001fa8 <interruptRoutine+0x4bc>
			case 0x24:
				//sem_signal
				sem_t signalHandle;
				signalHandle = (sem_t)a1;
    80001d84:	fb843783          	ld	a5,-72(s0)
    80001d88:	f6f43023          	sd	a5,-160(s0)
				signalHandle->signal();
    80001d8c:	f6043503          	ld	a0,-160(s0)
    80001d90:	00001097          	auipc	ra,0x1
    80001d94:	f74080e7          	jalr	-140(ra) # 80002d04 <_ZN4KSem6signalEv>
				__asm__ volatile("sd a0, 80(s0)");
    80001d98:	04a43823          	sd	a0,80(s0)
				break;
    80001d9c:	20c0006f          	j	80001fa8 <interruptRoutine+0x4bc>
			case 0x31:
				//time_sleep
				time_t timerPeriods;
				timerPeriods = (time_t)a1;
    80001da0:	fb843783          	ld	a5,-72(s0)
    80001da4:	f6f43423          	sd	a5,-152(s0)
				if (timerPeriods > 0) {
    80001da8:	f6843783          	ld	a5,-152(s0)
    80001dac:	00078663          	beqz	a5,80001db8 <interruptRoutine+0x2cc>
					__asm__ volatile("li a0, 0");
    80001db0:	00000513          	li	a0,0
    80001db4:	0080006f          	j	80001dbc <interruptRoutine+0x2d0>
				} else {
					__asm__ volatile("li a0, -1");
    80001db8:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    80001dbc:	04a43823          	sd	a0,80(s0)
				if (timerPeriods > 0) {
    80001dc0:	f6843783          	ld	a5,-152(s0)
    80001dc4:	1c078863          	beqz	a5,80001f94 <interruptRoutine+0x4a8>
					Scheduler::putToSleep(TCB::running, timerPeriods);
    80001dc8:	00005797          	auipc	a5,0x5
    80001dcc:	5787b783          	ld	a5,1400(a5) # 80007340 <_GLOBAL_OFFSET_TABLE_+0x40>
    80001dd0:	0007b783          	ld	a5,0(a5)
    80001dd4:	f6843583          	ld	a1,-152(s0)
    80001dd8:	00078513          	mv	a0,a5
    80001ddc:	00000097          	auipc	ra,0x0
    80001de0:	890080e7          	jalr	-1904(ra) # 8000166c <_ZN9Scheduler10putToSleepEP3TCBm>
					TCB::yield();
    80001de4:	00001097          	auipc	ra,0x1
    80001de8:	830080e7          	jalr	-2000(ra) # 80002614 <_ZN3TCB5yieldEv>
				}
				break;
    80001dec:	1a80006f          	j	80001f94 <interruptRoutine+0x4a8>
			case 0x41:
				//getc
				__getc();
    80001df0:	00003097          	auipc	ra,0x3
    80001df4:	358080e7          	jalr	856(ra) # 80005148 <__getc>
				__asm__ volatile("sd a0, 80(s0)");
    80001df8:	04a43823          	sd	a0,80(s0)
				break;
    80001dfc:	1ac0006f          	j	80001fa8 <interruptRoutine+0x4bc>
			case 0x42:
				//putc
				char c;
				c = (char)a1;
    80001e00:	fb843783          	ld	a5,-72(s0)
    80001e04:	f6f409a3          	sb	a5,-141(s0)
				__putc(c);
    80001e08:	f7344783          	lbu	a5,-141(s0)
    80001e0c:	00078513          	mv	a0,a5
    80001e10:	00003097          	auipc	ra,0x3
    80001e14:	2fc080e7          	jalr	764(ra) # 8000510c <__putc>
				break;
    80001e18:	1900006f          	j	80001fa8 <interruptRoutine+0x4bc>
			case 0x90:
				//printString
				const char* string;
				string = (const char*)a1;
    80001e1c:	fb843783          	ld	a5,-72(s0)
    80001e20:	fef43423          	sd	a5,-24(s0)
				while (*string != '\0') {
    80001e24:	fe843783          	ld	a5,-24(s0)
    80001e28:	0007c783          	lbu	a5,0(a5)
    80001e2c:	16078863          	beqz	a5,80001f9c <interruptRoutine+0x4b0>
					__putc(*string);
    80001e30:	fe843783          	ld	a5,-24(s0)
    80001e34:	0007c783          	lbu	a5,0(a5)
    80001e38:	00078513          	mv	a0,a5
    80001e3c:	00003097          	auipc	ra,0x3
    80001e40:	2d0080e7          	jalr	720(ra) # 8000510c <__putc>
					string++;
    80001e44:	fe843783          	ld	a5,-24(s0)
    80001e48:	00178793          	addi	a5,a5,1
    80001e4c:	fef43423          	sd	a5,-24(s0)
				while (*string != '\0') {
    80001e50:	fd5ff06f          	j	80001e24 <interruptRoutine+0x338>
				}
				break;
			case 0x91:
				//printInteger
				uint64 integer;
				integer = a1;
    80001e54:	fb843783          	ld	a5,-72(s0)
    80001e58:	f6f43c23          	sd	a5,-136(s0)
				static char digits[] = "0123456789";
				char buf[16];
				int i, neg;
				uint x;

				neg = 0;
    80001e5c:	f6042a23          	sw	zero,-140(s0)
				if (integer < 0) {
					neg = 1;
					x = -integer;
				} else {
					x = integer;
    80001e60:	f7843783          	ld	a5,-136(s0)
    80001e64:	fef42023          	sw	a5,-32(s0)
				}

				i = 0;
    80001e68:	fe042223          	sw	zero,-28(s0)
				do {
					buf[i++] = digits[x % 10];
    80001e6c:	fe042703          	lw	a4,-32(s0)
    80001e70:	00a00793          	li	a5,10
    80001e74:	02f777bb          	remuw	a5,a4,a5
    80001e78:	0007861b          	sext.w	a2,a5
    80001e7c:	fe442783          	lw	a5,-28(s0)
    80001e80:	0017871b          	addiw	a4,a5,1
    80001e84:	fee42223          	sw	a4,-28(s0)
    80001e88:	00005697          	auipc	a3,0x5
    80001e8c:	3f068693          	addi	a3,a3,1008 # 80007278 <_ZZ16interruptRoutineE6digits>
    80001e90:	02061713          	slli	a4,a2,0x20
    80001e94:	02075713          	srli	a4,a4,0x20
    80001e98:	00e68733          	add	a4,a3,a4
    80001e9c:	00074703          	lbu	a4,0(a4)
    80001ea0:	ff040693          	addi	a3,s0,-16
    80001ea4:	00f687b3          	add	a5,a3,a5
    80001ea8:	f0e78423          	sb	a4,-248(a5)
				} while ((x /= 10) != 0);
    80001eac:	fe042703          	lw	a4,-32(s0)
    80001eb0:	00a00793          	li	a5,10
    80001eb4:	02f757bb          	divuw	a5,a4,a5
    80001eb8:	fef42023          	sw	a5,-32(s0)
    80001ebc:	fe042783          	lw	a5,-32(s0)
    80001ec0:	0007879b          	sext.w	a5,a5
    80001ec4:	00f037b3          	snez	a5,a5
    80001ec8:	0ff7f793          	andi	a5,a5,255
    80001ecc:	00078463          	beqz	a5,80001ed4 <interruptRoutine+0x3e8>
				do {
    80001ed0:	f9dff06f          	j	80001e6c <interruptRoutine+0x380>
				if (neg) buf[i++] = '-';
    80001ed4:	f7442783          	lw	a5,-140(s0)
    80001ed8:	0007879b          	sext.w	a5,a5
    80001edc:	02078063          	beqz	a5,80001efc <interruptRoutine+0x410>
    80001ee0:	fe442783          	lw	a5,-28(s0)
    80001ee4:	0017871b          	addiw	a4,a5,1
    80001ee8:	fee42223          	sw	a4,-28(s0)
    80001eec:	ff040713          	addi	a4,s0,-16
    80001ef0:	00f707b3          	add	a5,a4,a5
    80001ef4:	02d00713          	li	a4,45
    80001ef8:	f0e78423          	sb	a4,-248(a5)

				while (--i >= 0) {
    80001efc:	fe442783          	lw	a5,-28(s0)
    80001f00:	fff7879b          	addiw	a5,a5,-1
    80001f04:	fef42223          	sw	a5,-28(s0)
    80001f08:	fe442783          	lw	a5,-28(s0)
    80001f0c:	fff7c793          	not	a5,a5
    80001f10:	01f7d79b          	srliw	a5,a5,0x1f
    80001f14:	0ff7f793          	andi	a5,a5,255
    80001f18:	08078663          	beqz	a5,80001fa4 <interruptRoutine+0x4b8>
					__putc(buf[i]);
    80001f1c:	fe442783          	lw	a5,-28(s0)
    80001f20:	ff040713          	addi	a4,s0,-16
    80001f24:	00f707b3          	add	a5,a4,a5
    80001f28:	f087c783          	lbu	a5,-248(a5)
    80001f2c:	00078513          	mv	a0,a5
    80001f30:	00003097          	auipc	ra,0x3
    80001f34:	1dc080e7          	jalr	476(ra) # 8000510c <__putc>
				while (--i >= 0) {
    80001f38:	fc5ff06f          	j	80001efc <interruptRoutine+0x410>
				}
				break;
			default:
				printString("\nNepostojeci op code: ");
    80001f3c:	00004517          	auipc	a0,0x4
    80001f40:	10c50513          	addi	a0,a0,268 # 80006048 <CONSOLE_STATUS+0x38>
    80001f44:	fffff097          	auipc	ra,0xfffff
    80001f48:	654080e7          	jalr	1620(ra) # 80001598 <_Z11printStringPKc>
				printInteger(opCode);
    80001f4c:	f8043503          	ld	a0,-128(s0)
    80001f50:	fffff097          	auipc	ra,0xfffff
    80001f54:	670080e7          	jalr	1648(ra) # 800015c0 <_Z12printIntegerm>
				printString("\nscause: ");
    80001f58:	00004517          	auipc	a0,0x4
    80001f5c:	10850513          	addi	a0,a0,264 # 80006060 <CONSOLE_STATUS+0x50>
    80001f60:	fffff097          	auipc	ra,0xfffff
    80001f64:	638080e7          	jalr	1592(ra) # 80001598 <_Z11printStringPKc>
				printInteger(scause);
    80001f68:	fd843503          	ld	a0,-40(s0)
    80001f6c:	fffff097          	auipc	ra,0xfffff
    80001f70:	654080e7          	jalr	1620(ra) # 800015c0 <_Z12printIntegerm>
				printString("\nsepc: ");
    80001f74:	00004517          	auipc	a0,0x4
    80001f78:	0fc50513          	addi	a0,a0,252 # 80006070 <CONSOLE_STATUS+0x60>
    80001f7c:	fffff097          	auipc	ra,0xfffff
    80001f80:	61c080e7          	jalr	1564(ra) # 80001598 <_Z11printStringPKc>
				printInteger(sepc);
    80001f84:	fd043503          	ld	a0,-48(s0)
    80001f88:	fffff097          	auipc	ra,0xfffff
    80001f8c:	638080e7          	jalr	1592(ra) # 800015c0 <_Z12printIntegerm>
				break;
    80001f90:	0180006f          	j	80001fa8 <interruptRoutine+0x4bc>
				break;
    80001f94:	00000013          	nop
    80001f98:	0100006f          	j	80001fa8 <interruptRoutine+0x4bc>
				break;
    80001f9c:	00000013          	nop
    80001fa0:	0080006f          	j	80001fa8 <interruptRoutine+0x4bc>
				break;
    80001fa4:	00000013          	nop
		}
		//sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
		//sepc += 4;
		__asm__ volatile("addi %[dst], %[src], 0x4":[dst]"=r"(sepc):[src]"r"(
				sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001fa8:	fd043303          	ld	t1,-48(s0)
    80001fac:	00430313          	addi	t1,t1,4
    80001fb0:	fc643823          	sd	t1,-48(s0)
		__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001fb4:	fd043303          	ld	t1,-48(s0)
    80001fb8:	14131073          	csrw	sepc,t1
    80001fbc:	00000013          	nop
		printString("scause: ");
		printInteger(scause);
		printString("\nsepc: ");
		printInteger(sepc);
	}
}
    80001fc0:	1180006f          	j	800020d8 <interruptRoutine+0x5ec>
	} else if (scause == (1UL << 63 | 9)) {
    80001fc4:	fd843703          	ld	a4,-40(s0)
    80001fc8:	fff00793          	li	a5,-1
    80001fcc:	03f79793          	slli	a5,a5,0x3f
    80001fd0:	00978793          	addi	a5,a5,9
    80001fd4:	00f71863          	bne	a4,a5,80001fe4 <interruptRoutine+0x4f8>
		console_handler();
    80001fd8:	00003097          	auipc	ra,0x3
    80001fdc:	1a8080e7          	jalr	424(ra) # 80005180 <console_handler>
}
    80001fe0:	0f80006f          	j	800020d8 <interruptRoutine+0x5ec>
	} else if (scause == (1UL << 63 | 1)) {
    80001fe4:	fd843703          	ld	a4,-40(s0)
    80001fe8:	fff00793          	li	a5,-1
    80001fec:	03f79793          	slli	a5,a5,0x3f
    80001ff0:	00178793          	addi	a5,a5,1
    80001ff4:	08f71e63          	bne	a4,a5,80002090 <interruptRoutine+0x5a4>
		Scheduler::wake();
    80001ff8:	fffff097          	auipc	ra,0xfffff
    80001ffc:	71c080e7          	jalr	1820(ra) # 80001714 <_ZN9Scheduler4wakeEv>
		TCB::runningTimeSlice++;
    80002000:	00005797          	auipc	a5,0x5
    80002004:	3107b783          	ld	a5,784(a5) # 80007310 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002008:	0007b783          	ld	a5,0(a5)
    8000200c:	00178713          	addi	a4,a5,1
    80002010:	00005797          	auipc	a5,0x5
    80002014:	3007b783          	ld	a5,768(a5) # 80007310 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002018:	00e7b023          	sd	a4,0(a5)
		if (TCB::runningTimeSlice >= TCB::running->getTimeSlice()) {
    8000201c:	00005797          	auipc	a5,0x5
    80002020:	3247b783          	ld	a5,804(a5) # 80007340 <_GLOBAL_OFFSET_TABLE_+0x40>
    80002024:	0007b783          	ld	a5,0(a5)
    80002028:	00078513          	mv	a0,a5
    8000202c:	00000097          	auipc	ra,0x0
    80002030:	130080e7          	jalr	304(ra) # 8000215c <_ZN3TCB12getTimeSliceEv>
    80002034:	00050713          	mv	a4,a0
    80002038:	00005797          	auipc	a5,0x5
    8000203c:	2d87b783          	ld	a5,728(a5) # 80007310 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002040:	0007b783          	ld	a5,0(a5)
    80002044:	00e7b7b3          	sltu	a5,a5,a4
    80002048:	0017c793          	xori	a5,a5,1
    8000204c:	0ff7f793          	andi	a5,a5,255
    80002050:	00078c63          	beqz	a5,80002068 <interruptRoutine+0x57c>
			TCB::yield();
    80002054:	00000097          	auipc	ra,0x0
    80002058:	5c0080e7          	jalr	1472(ra) # 80002614 <_ZN3TCB5yieldEv>
			TCB::runningTimeSlice = 0;
    8000205c:	00005797          	auipc	a5,0x5
    80002060:	2b47b783          	ld	a5,692(a5) # 80007310 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002064:	0007b023          	sd	zero,0(a5)
		Riscv::w_sepc(sepc);
    80002068:	fd043503          	ld	a0,-48(s0)
    8000206c:	00000097          	auipc	ra,0x0
    80002070:	080080e7          	jalr	128(ra) # 800020ec <_ZN5Riscv6w_sepcEm>
		Riscv::w_sstatus(sstatus);
    80002074:	fc843503          	ld	a0,-56(s0)
    80002078:	00000097          	auipc	ra,0x0
    8000207c:	0ac080e7          	jalr	172(ra) # 80002124 <_ZN5Riscv9w_sstatusEm>
		Riscv::mc_sip(Riscv::SIP_SSIP);
    80002080:	00200513          	li	a0,2
    80002084:	00000097          	auipc	ra,0x0
    80002088:	084080e7          	jalr	132(ra) # 80002108 <_ZN5Riscv6mc_sipEm>
}
    8000208c:	04c0006f          	j	800020d8 <interruptRoutine+0x5ec>
		printString("\nGreska u prekidnoj rutini\n");
    80002090:	00004517          	auipc	a0,0x4
    80002094:	fe850513          	addi	a0,a0,-24 # 80006078 <CONSOLE_STATUS+0x68>
    80002098:	fffff097          	auipc	ra,0xfffff
    8000209c:	500080e7          	jalr	1280(ra) # 80001598 <_Z11printStringPKc>
		printString("scause: ");
    800020a0:	00004517          	auipc	a0,0x4
    800020a4:	ff850513          	addi	a0,a0,-8 # 80006098 <CONSOLE_STATUS+0x88>
    800020a8:	fffff097          	auipc	ra,0xfffff
    800020ac:	4f0080e7          	jalr	1264(ra) # 80001598 <_Z11printStringPKc>
		printInteger(scause);
    800020b0:	fd843503          	ld	a0,-40(s0)
    800020b4:	fffff097          	auipc	ra,0xfffff
    800020b8:	50c080e7          	jalr	1292(ra) # 800015c0 <_Z12printIntegerm>
		printString("\nsepc: ");
    800020bc:	00004517          	auipc	a0,0x4
    800020c0:	fb450513          	addi	a0,a0,-76 # 80006070 <CONSOLE_STATUS+0x60>
    800020c4:	fffff097          	auipc	ra,0xfffff
    800020c8:	4d4080e7          	jalr	1236(ra) # 80001598 <_Z11printStringPKc>
		printInteger(sepc);
    800020cc:	fd043503          	ld	a0,-48(s0)
    800020d0:	fffff097          	auipc	ra,0xfffff
    800020d4:	4f0080e7          	jalr	1264(ra) # 800015c0 <_Z12printIntegerm>
}
    800020d8:	00000013          	nop
    800020dc:	10813083          	ld	ra,264(sp)
    800020e0:	10013403          	ld	s0,256(sp)
    800020e4:	11010113          	addi	sp,sp,272
    800020e8:	00008067          	ret

00000000800020ec <_ZN5Riscv6w_sepcEm>:
inline void Riscv::w_sepc(uint64 sepc) {
    800020ec:	ff010113          	addi	sp,sp,-16
    800020f0:	00813423          	sd	s0,8(sp)
    800020f4:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    800020f8:	14151073          	csrw	sepc,a0
}
    800020fc:	00813403          	ld	s0,8(sp)
    80002100:	01010113          	addi	sp,sp,16
    80002104:	00008067          	ret

0000000080002108 <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    80002108:	ff010113          	addi	sp,sp,-16
    8000210c:	00813423          	sd	s0,8(sp)
    80002110:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    80002114:	14453073          	csrc	sip,a0
}
    80002118:	00813403          	ld	s0,8(sp)
    8000211c:	01010113          	addi	sp,sp,16
    80002120:	00008067          	ret

0000000080002124 <_ZN5Riscv9w_sstatusEm>:
	uint64 volatile sstatus;
	__asm__ volatile("csrr %[sstatus], sstatus": [sstatus] "=r"(sstatus));
	return sstatus;
}

inline void Riscv::w_sstatus(uint64 sstatus) {
    80002124:	ff010113          	addi	sp,sp,-16
    80002128:	00813423          	sd	s0,8(sp)
    8000212c:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw sstatus, %[sstatus]": :[sstatus] "r"(sstatus));
    80002130:	10051073          	csrw	sstatus,a0
}
    80002134:	00813403          	ld	s0,8(sp)
    80002138:	01010113          	addi	sp,sp,16
    8000213c:	00008067          	ret

0000000080002140 <_ZN3TCB11setFinishedEb>:
	static TCB* createThread(Body function, void* args, uint64* stack);
	static void start(TCB* newTcb);

	bool isFinished() { return finished; }

	void setFinished(bool finish) { this->finished = finish; }
    80002140:	ff010113          	addi	sp,sp,-16
    80002144:	00813423          	sd	s0,8(sp)
    80002148:	01010413          	addi	s0,sp,16
    8000214c:	02b50823          	sb	a1,48(a0)
    80002150:	00813403          	ld	s0,8(sp)
    80002154:	01010113          	addi	sp,sp,16
    80002158:	00008067          	ret

000000008000215c <_ZN3TCB12getTimeSliceEv>:

	bool isBlocked() { return blocked; }

	void setBlocked(bool block) { this->blocked = block; }

	uint64 getTimeSlice() { return timeSlice; }
    8000215c:	ff010113          	addi	sp,sp,-16
    80002160:	00813423          	sd	s0,8(sp)
    80002164:	01010413          	addi	s0,sp,16
    80002168:	02853503          	ld	a0,40(a0)
    8000216c:	00813403          	ld	s0,8(sp)
    80002170:	01010113          	addi	sp,sp,16
    80002174:	00008067          	ret

0000000080002178 <_ZN6ThreadD1Ev>:
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
	}
	myHandle = TCB::createThread(body,arg,stack);
}

Thread::~Thread() {
    80002178:	ff010113          	addi	sp,sp,-16
    8000217c:	00813423          	sd	s0,8(sp)
    80002180:	01010413          	addi	s0,sp,16

}
    80002184:	00813403          	ld	s0,8(sp)
    80002188:	01010113          	addi	sp,sp,16
    8000218c:	00008067          	ret

0000000080002190 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {

}

Semaphore::~Semaphore() {
    80002190:	ff010113          	addi	sp,sp,-16
    80002194:	00813423          	sd	s0,8(sp)
    80002198:	01010413          	addi	s0,sp,16

}
    8000219c:	00813403          	ld	s0,8(sp)
    800021a0:	01010113          	addi	sp,sp,16
    800021a4:	00008067          	ret

00000000800021a8 <_Znwm>:
void* operator new(size_t size) {
    800021a8:	ff010113          	addi	sp,sp,-16
    800021ac:	00113423          	sd	ra,8(sp)
    800021b0:	00813023          	sd	s0,0(sp)
    800021b4:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    800021b8:	fffff097          	auipc	ra,0xfffff
    800021bc:	138080e7          	jalr	312(ra) # 800012f0 <_Z9mem_allocm>
}
    800021c0:	00813083          	ld	ra,8(sp)
    800021c4:	00013403          	ld	s0,0(sp)
    800021c8:	01010113          	addi	sp,sp,16
    800021cc:	00008067          	ret

00000000800021d0 <_Znam>:
void* operator new[](size_t size) {
    800021d0:	ff010113          	addi	sp,sp,-16
    800021d4:	00113423          	sd	ra,8(sp)
    800021d8:	00813023          	sd	s0,0(sp)
    800021dc:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    800021e0:	fffff097          	auipc	ra,0xfffff
    800021e4:	110080e7          	jalr	272(ra) # 800012f0 <_Z9mem_allocm>
}
    800021e8:	00813083          	ld	ra,8(sp)
    800021ec:	00013403          	ld	s0,0(sp)
    800021f0:	01010113          	addi	sp,sp,16
    800021f4:	00008067          	ret

00000000800021f8 <_ZdlPv>:
noexcept {
    800021f8:	ff010113          	addi	sp,sp,-16
    800021fc:	00113423          	sd	ra,8(sp)
    80002200:	00813023          	sd	s0,0(sp)
    80002204:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80002208:	fffff097          	auipc	ra,0xfffff
    8000220c:	128080e7          	jalr	296(ra) # 80001330 <_Z8mem_freePv>
}
    80002210:	00813083          	ld	ra,8(sp)
    80002214:	00013403          	ld	s0,0(sp)
    80002218:	01010113          	addi	sp,sp,16
    8000221c:	00008067          	ret

0000000080002220 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80002220:	ff010113          	addi	sp,sp,-16
    80002224:	00113423          	sd	ra,8(sp)
    80002228:	00813023          	sd	s0,0(sp)
    8000222c:	01010413          	addi	s0,sp,16
}
    80002230:	00000097          	auipc	ra,0x0
    80002234:	fc8080e7          	jalr	-56(ra) # 800021f8 <_ZdlPv>
    80002238:	00813083          	ld	ra,8(sp)
    8000223c:	00013403          	ld	s0,0(sp)
    80002240:	01010113          	addi	sp,sp,16
    80002244:	00008067          	ret

0000000080002248 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80002248:	ff010113          	addi	sp,sp,-16
    8000224c:	00113423          	sd	ra,8(sp)
    80002250:	00813023          	sd	s0,0(sp)
    80002254:	01010413          	addi	s0,sp,16
}
    80002258:	00000097          	auipc	ra,0x0
    8000225c:	fa0080e7          	jalr	-96(ra) # 800021f8 <_ZdlPv>
    80002260:	00813083          	ld	ra,8(sp)
    80002264:	00013403          	ld	s0,0(sp)
    80002268:	01010113          	addi	sp,sp,16
    8000226c:	00008067          	ret

0000000080002270 <_ZdaPv>:
noexcept {
    80002270:	ff010113          	addi	sp,sp,-16
    80002274:	00113423          	sd	ra,8(sp)
    80002278:	00813023          	sd	s0,0(sp)
    8000227c:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80002280:	fffff097          	auipc	ra,0xfffff
    80002284:	0b0080e7          	jalr	176(ra) # 80001330 <_Z8mem_freePv>
}
    80002288:	00813083          	ld	ra,8(sp)
    8000228c:	00013403          	ld	s0,0(sp)
    80002290:	01010113          	addi	sp,sp,16
    80002294:	00008067          	ret

0000000080002298 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (* body)(void*), void* arg) {
    80002298:	fd010113          	addi	sp,sp,-48
    8000229c:	02113423          	sd	ra,40(sp)
    800022a0:	02813023          	sd	s0,32(sp)
    800022a4:	00913c23          	sd	s1,24(sp)
    800022a8:	01213823          	sd	s2,16(sp)
    800022ac:	01313423          	sd	s3,8(sp)
    800022b0:	03010413          	addi	s0,sp,48
    800022b4:	00050493          	mv	s1,a0
    800022b8:	00058913          	mv	s2,a1
    800022bc:	00060993          	mv	s3,a2
    800022c0:	00005797          	auipc	a5,0x5
    800022c4:	00878793          	addi	a5,a5,8 # 800072c8 <_ZTV6Thread+0x10>
    800022c8:	00f53023          	sd	a5,0(a0)
	if (body != nullptr) {
    800022cc:	04058263          	beqz	a1,80002310 <_ZN6ThreadC1EPFvPvES0_+0x78>
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    800022d0:	00001537          	lui	a0,0x1
    800022d4:	fffff097          	auipc	ra,0xfffff
    800022d8:	01c080e7          	jalr	28(ra) # 800012f0 <_Z9mem_allocm>
    800022dc:	00050613          	mv	a2,a0
	myHandle = TCB::createThread(body,arg,stack);
    800022e0:	00098593          	mv	a1,s3
    800022e4:	00090513          	mv	a0,s2
    800022e8:	00000097          	auipc	ra,0x0
    800022ec:	394080e7          	jalr	916(ra) # 8000267c <_ZN3TCB12createThreadEPFvPvES0_Pm>
    800022f0:	00a4b423          	sd	a0,8(s1)
}
    800022f4:	02813083          	ld	ra,40(sp)
    800022f8:	02013403          	ld	s0,32(sp)
    800022fc:	01813483          	ld	s1,24(sp)
    80002300:	01013903          	ld	s2,16(sp)
    80002304:	00813983          	ld	s3,8(sp)
    80002308:	03010113          	addi	sp,sp,48
    8000230c:	00008067          	ret
	uint64* stack = nullptr;
    80002310:	00000613          	li	a2,0
    80002314:	fcdff06f          	j	800022e0 <_ZN6ThreadC1EPFvPvES0_+0x48>

0000000080002318 <_ZN6Thread5startEv>:
int Thread::start() {
    80002318:	ff010113          	addi	sp,sp,-16
    8000231c:	00113423          	sd	ra,8(sp)
    80002320:	00813023          	sd	s0,0(sp)
    80002324:	01010413          	addi	s0,sp,16
	TCB::start(myHandle);
    80002328:	00853503          	ld	a0,8(a0) # 1008 <_entry-0x7fffeff8>
    8000232c:	00000097          	auipc	ra,0x0
    80002330:	4f0080e7          	jalr	1264(ra) # 8000281c <_ZN3TCB5startEPS_>
}
    80002334:	00000513          	li	a0,0
    80002338:	00813083          	ld	ra,8(sp)
    8000233c:	00013403          	ld	s0,0(sp)
    80002340:	01010113          	addi	sp,sp,16
    80002344:	00008067          	ret

0000000080002348 <_ZN6Thread4joinEv>:
void Thread::join() {
    80002348:	ff010113          	addi	sp,sp,-16
    8000234c:	00813423          	sd	s0,8(sp)
    80002350:	01010413          	addi	s0,sp,16
}
    80002354:	00813403          	ld	s0,8(sp)
    80002358:	01010113          	addi	sp,sp,16
    8000235c:	00008067          	ret

0000000080002360 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80002360:	ff010113          	addi	sp,sp,-16
    80002364:	00813423          	sd	s0,8(sp)
    80002368:	01010413          	addi	s0,sp,16
}
    8000236c:	00813403          	ld	s0,8(sp)
    80002370:	01010113          	addi	sp,sp,16
    80002374:	00008067          	ret

0000000080002378 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t) {
    80002378:	ff010113          	addi	sp,sp,-16
    8000237c:	00813423          	sd	s0,8(sp)
    80002380:	01010413          	addi	s0,sp,16
}
    80002384:	00000513          	li	a0,0
    80002388:	00813403          	ld	s0,8(sp)
    8000238c:	01010113          	addi	sp,sp,16
    80002390:	00008067          	ret

0000000080002394 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80002394:	ff010113          	addi	sp,sp,-16
    80002398:	00813423          	sd	s0,8(sp)
    8000239c:	01010413          	addi	s0,sp,16
    800023a0:	00005797          	auipc	a5,0x5
    800023a4:	f2878793          	addi	a5,a5,-216 # 800072c8 <_ZTV6Thread+0x10>
    800023a8:	00f53023          	sd	a5,0(a0)
}
    800023ac:	00813403          	ld	s0,8(sp)
    800023b0:	01010113          	addi	sp,sp,16
    800023b4:	00008067          	ret

00000000800023b8 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    800023b8:	ff010113          	addi	sp,sp,-16
    800023bc:	00813423          	sd	s0,8(sp)
    800023c0:	01010413          	addi	s0,sp,16
    800023c4:	00005797          	auipc	a5,0x5
    800023c8:	f2c78793          	addi	a5,a5,-212 # 800072f0 <_ZTV9Semaphore+0x10>
    800023cc:	00f53023          	sd	a5,0(a0)
}
    800023d0:	00813403          	ld	s0,8(sp)
    800023d4:	01010113          	addi	sp,sp,16
    800023d8:	00008067          	ret

00000000800023dc <_ZN9Semaphore4waitEv>:

int Semaphore::wait() {
    800023dc:	ff010113          	addi	sp,sp,-16
    800023e0:	00813423          	sd	s0,8(sp)
    800023e4:	01010413          	addi	s0,sp,16
	return 0;
}
    800023e8:	00000513          	li	a0,0
    800023ec:	00813403          	ld	s0,8(sp)
    800023f0:	01010113          	addi	sp,sp,16
    800023f4:	00008067          	ret

00000000800023f8 <_ZN9Semaphore6signalEv>:

int Semaphore::signal() {
    800023f8:	ff010113          	addi	sp,sp,-16
    800023fc:	00813423          	sd	s0,8(sp)
    80002400:	01010413          	addi	s0,sp,16
	return 0;
}
    80002404:	00000513          	li	a0,0
    80002408:	00813403          	ld	s0,8(sp)
    8000240c:	01010113          	addi	sp,sp,16
    80002410:	00008067          	ret

0000000080002414 <_ZN14PeriodicThread9terminateEv>:

void PeriodicThread::terminate() {
    80002414:	ff010113          	addi	sp,sp,-16
    80002418:	00813423          	sd	s0,8(sp)
    8000241c:	01010413          	addi	s0,sp,16

}
    80002420:	00813403          	ld	s0,8(sp)
    80002424:	01010113          	addi	sp,sp,16
    80002428:	00008067          	ret

000000008000242c <_ZN14PeriodicThreadC1Em>:

PeriodicThread::PeriodicThread(time_t period) {
    8000242c:	fe010113          	addi	sp,sp,-32
    80002430:	00113c23          	sd	ra,24(sp)
    80002434:	00813823          	sd	s0,16(sp)
    80002438:	00913423          	sd	s1,8(sp)
    8000243c:	02010413          	addi	s0,sp,32
    80002440:	00050493          	mv	s1,a0
    80002444:	00000097          	auipc	ra,0x0
    80002448:	f50080e7          	jalr	-176(ra) # 80002394 <_ZN6ThreadC1Ev>
    8000244c:	00005797          	auipc	a5,0x5
    80002450:	e4c78793          	addi	a5,a5,-436 # 80007298 <_ZTV14PeriodicThread+0x10>
    80002454:	00f4b023          	sd	a5,0(s1)

}
    80002458:	01813083          	ld	ra,24(sp)
    8000245c:	01013403          	ld	s0,16(sp)
    80002460:	00813483          	ld	s1,8(sp)
    80002464:	02010113          	addi	sp,sp,32
    80002468:	00008067          	ret

000000008000246c <_ZN7Console4getcEv>:

char Console::getc() {
    8000246c:	ff010113          	addi	sp,sp,-16
    80002470:	00813423          	sd	s0,8(sp)
    80002474:	01010413          	addi	s0,sp,16
	return 0;
}
    80002478:	00000513          	li	a0,0
    8000247c:	00813403          	ld	s0,8(sp)
    80002480:	01010113          	addi	sp,sp,16
    80002484:	00008067          	ret

0000000080002488 <_ZN7Console4putcEc>:

void Console::putc(char) {
    80002488:	ff010113          	addi	sp,sp,-16
    8000248c:	00813423          	sd	s0,8(sp)
    80002490:	01010413          	addi	s0,sp,16

}
    80002494:	00813403          	ld	s0,8(sp)
    80002498:	01010113          	addi	sp,sp,16
    8000249c:	00008067          	ret

00000000800024a0 <_ZN6Thread3runEv>:
	static int sleep(time_t);

protected:
	Thread();

	virtual void run() {}
    800024a0:	ff010113          	addi	sp,sp,-16
    800024a4:	00813423          	sd	s0,8(sp)
    800024a8:	01010413          	addi	s0,sp,16
    800024ac:	00813403          	ld	s0,8(sp)
    800024b0:	01010113          	addi	sp,sp,16
    800024b4:	00008067          	ret

00000000800024b8 <_ZN14PeriodicThread18periodicActivationEv>:
	void terminate();

protected:
	PeriodicThread(time_t period);

	virtual void periodicActivation() {}
    800024b8:	ff010113          	addi	sp,sp,-16
    800024bc:	00813423          	sd	s0,8(sp)
    800024c0:	01010413          	addi	s0,sp,16
    800024c4:	00813403          	ld	s0,8(sp)
    800024c8:	01010113          	addi	sp,sp,16
    800024cc:	00008067          	ret

00000000800024d0 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    800024d0:	ff010113          	addi	sp,sp,-16
    800024d4:	00813423          	sd	s0,8(sp)
    800024d8:	01010413          	addi	s0,sp,16
    800024dc:	00005797          	auipc	a5,0x5
    800024e0:	dbc78793          	addi	a5,a5,-580 # 80007298 <_ZTV14PeriodicThread+0x10>
    800024e4:	00f53023          	sd	a5,0(a0)
    800024e8:	00813403          	ld	s0,8(sp)
    800024ec:	01010113          	addi	sp,sp,16
    800024f0:	00008067          	ret

00000000800024f4 <_ZN14PeriodicThreadD0Ev>:
    800024f4:	ff010113          	addi	sp,sp,-16
    800024f8:	00113423          	sd	ra,8(sp)
    800024fc:	00813023          	sd	s0,0(sp)
    80002500:	01010413          	addi	s0,sp,16
    80002504:	00005797          	auipc	a5,0x5
    80002508:	d9478793          	addi	a5,a5,-620 # 80007298 <_ZTV14PeriodicThread+0x10>
    8000250c:	00f53023          	sd	a5,0(a0)
    80002510:	00000097          	auipc	ra,0x0
    80002514:	ce8080e7          	jalr	-792(ra) # 800021f8 <_ZdlPv>
    80002518:	00813083          	ld	ra,8(sp)
    8000251c:	00013403          	ld	s0,0(sp)
    80002520:	01010113          	addi	sp,sp,16
    80002524:	00008067          	ret

0000000080002528 <_ZN3TCB7wrapperEv>:
	Riscv::pushRegisters();
	TCB::dispatch();
	Riscv::popRegisters();
}

void TCB::wrapper() {
    80002528:	ff010113          	addi	sp,sp,-16
    8000252c:	00113423          	sd	ra,8(sp)
    80002530:	00813023          	sd	s0,0(sp)
    80002534:	01010413          	addi	s0,sp,16
	//pocetak wrappera se izvrsava u supervisor modu,
	//jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch/yield)
	Riscv::popSppSpie();
    80002538:	00000097          	auipc	ra,0x0
    8000253c:	318080e7          	jalr	792(ra) # 80002850 <_ZN5Riscv10popSppSpieEv>
	//na dalje se izvrsavamo u user modu
	running->threadFunction(running->args);
    80002540:	00005797          	auipc	a5,0x5
    80002544:	e807b783          	ld	a5,-384(a5) # 800073c0 <_ZN3TCB7runningE>
    80002548:	0107b703          	ld	a4,16(a5)
    8000254c:	0207b503          	ld	a0,32(a5)
    80002550:	000700e7          	jalr	a4
	//running->finished = true;
	//i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
	thread_exit();
    80002554:	fffff097          	auipc	ra,0xfffff
    80002558:	e8c080e7          	jalr	-372(ra) # 800013e0 <_Z11thread_exitv>
}
    8000255c:	00813083          	ld	ra,8(sp)
    80002560:	00013403          	ld	s0,0(sp)
    80002564:	01010113          	addi	sp,sp,16
    80002568:	00008067          	ret

000000008000256c <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    8000256c:	fe010113          	addi	sp,sp,-32
    80002570:	00113c23          	sd	ra,24(sp)
    80002574:	00813823          	sd	s0,16(sp)
    80002578:	00913423          	sd	s1,8(sp)
    8000257c:	02010413          	addi	s0,sp,32
	TCB* old = TCB::running;
    80002580:	00005497          	auipc	s1,0x5
    80002584:	e404b483          	ld	s1,-448(s1) # 800073c0 <_ZN3TCB7runningE>
	if (!old->finished && !old->blocked && old->timeToSleep == 0 && !old->needToJoin) {
    80002588:	0304c783          	lbu	a5,48(s1)
    8000258c:	00079e63          	bnez	a5,800025a8 <_ZN3TCB8dispatchEv+0x3c>
    80002590:	0314c783          	lbu	a5,49(s1)
    80002594:	00079a63          	bnez	a5,800025a8 <_ZN3TCB8dispatchEv+0x3c>
    80002598:	0404b783          	ld	a5,64(s1)
    8000259c:	00079663          	bnez	a5,800025a8 <_ZN3TCB8dispatchEv+0x3c>
    800025a0:	0324c783          	lbu	a5,50(s1)
    800025a4:	04078a63          	beqz	a5,800025f8 <_ZN3TCB8dispatchEv+0x8c>
	TCB::running = Scheduler::get();
    800025a8:	fffff097          	auipc	ra,0xfffff
    800025ac:	084080e7          	jalr	132(ra) # 8000162c <_ZN9Scheduler3getEv>
    800025b0:	00050593          	mv	a1,a0
    800025b4:	00005797          	auipc	a5,0x5
    800025b8:	e0c78793          	addi	a5,a5,-500 # 800073c0 <_ZN3TCB7runningE>
    800025bc:	00a7b023          	sd	a0,0(a5)
	TCB::runningTimeSlice = 0;
    800025c0:	0007b423          	sd	zero,8(a5)
	if (TCB::running->threadFunction == nullptr) {
    800025c4:	01053783          	ld	a5,16(a0)
    800025c8:	04078063          	beqz	a5,80002608 <_ZN3TCB8dispatchEv+0x9c>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    800025cc:	10000793          	li	a5,256
    800025d0:	1007b073          	csrc	sstatus,a5
	if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    800025d4:	00b48863          	beq	s1,a1,800025e4 <_ZN3TCB8dispatchEv+0x78>
    800025d8:	00048513          	mv	a0,s1
    800025dc:	fffff097          	auipc	ra,0xfffff
    800025e0:	c34080e7          	jalr	-972(ra) # 80001210 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    800025e4:	01813083          	ld	ra,24(sp)
    800025e8:	01013403          	ld	s0,16(sp)
    800025ec:	00813483          	ld	s1,8(sp)
    800025f0:	02010113          	addi	sp,sp,32
    800025f4:	00008067          	ret
		Scheduler::put(old);
    800025f8:	00048513          	mv	a0,s1
    800025fc:	fffff097          	auipc	ra,0xfffff
    80002600:	fec080e7          	jalr	-20(ra) # 800015e8 <_ZN9Scheduler3putEP3TCB>
    80002604:	fa5ff06f          	j	800025a8 <_ZN3TCB8dispatchEv+0x3c>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80002608:	10000793          	li	a5,256
    8000260c:	1007a073          	csrs	sstatus,a5
}
    80002610:	fc5ff06f          	j	800025d4 <_ZN3TCB8dispatchEv+0x68>

0000000080002614 <_ZN3TCB5yieldEv>:
void TCB::yield() {
    80002614:	ff010113          	addi	sp,sp,-16
    80002618:	00113423          	sd	ra,8(sp)
    8000261c:	00813023          	sd	s0,0(sp)
    80002620:	01010413          	addi	s0,sp,16
	Riscv::pushRegisters();
    80002624:	fffff097          	auipc	ra,0xfffff
    80002628:	9dc080e7          	jalr	-1572(ra) # 80001000 <_ZN5Riscv13pushRegistersEv>
	TCB::dispatch();
    8000262c:	00000097          	auipc	ra,0x0
    80002630:	f40080e7          	jalr	-192(ra) # 8000256c <_ZN3TCB8dispatchEv>
	Riscv::popRegisters();
    80002634:	fffff097          	auipc	ra,0xfffff
    80002638:	a48080e7          	jalr	-1464(ra) # 8000107c <_ZN5Riscv12popRegistersEv>
}
    8000263c:	00813083          	ld	ra,8(sp)
    80002640:	00013403          	ld	s0,0(sp)
    80002644:	01010113          	addi	sp,sp,16
    80002648:	00008067          	ret

000000008000264c <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    8000264c:	ff010113          	addi	sp,sp,-16
    80002650:	00113423          	sd	ra,8(sp)
    80002654:	00813023          	sd	s0,0(sp)
    80002658:	01010413          	addi	s0,sp,16
	return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::THREAD);
    8000265c:	00200593          	li	a1,2
    80002660:	01850513          	addi	a0,a0,24
    80002664:	00000097          	auipc	ra,0x0
    80002668:	20c080e7          	jalr	524(ra) # 80002870 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
}
    8000266c:	00813083          	ld	ra,8(sp)
    80002670:	00013403          	ld	s0,0(sp)
    80002674:	01010113          	addi	sp,sp,16
    80002678:	00008067          	ret

000000008000267c <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    8000267c:	fd010113          	addi	sp,sp,-48
    80002680:	02113423          	sd	ra,40(sp)
    80002684:	02813023          	sd	s0,32(sp)
    80002688:	00913c23          	sd	s1,24(sp)
    8000268c:	01213823          	sd	s2,16(sp)
    80002690:	01313423          	sd	s3,8(sp)
    80002694:	01413023          	sd	s4,0(sp)
    80002698:	03010413          	addi	s0,sp,48
    8000269c:	00050993          	mv	s3,a0
    800026a0:	00058a13          	mv	s4,a1
    800026a4:	00060913          	mv	s2,a2
	TCB* newThread = new TCB(function, args, stack);
    800026a8:	06000513          	li	a0,96
    800026ac:	00000097          	auipc	ra,0x0
    800026b0:	fa0080e7          	jalr	-96(ra) # 8000264c <_ZN3TCBnwEm>
    800026b4:	00050493          	mv	s1,a0


	TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
													timeSlice(DEFAULT_TIME_SLICE), finished(false), blocked(false),
													needToJoin(false),
													nextInScheduler(nullptr), timeToSleep(0), nextSleeping(nullptr) {
    800026b8:	01353823          	sd	s3,16(a0)
    800026bc:	01253c23          	sd	s2,24(a0)
    800026c0:	03453023          	sd	s4,32(a0)
    800026c4:	00200793          	li	a5,2
    800026c8:	02f53423          	sd	a5,40(a0)
    800026cc:	02050823          	sb	zero,48(a0)
    800026d0:	020508a3          	sb	zero,49(a0)
    800026d4:	02050923          	sb	zero,50(a0)
    800026d8:	02053c23          	sd	zero,56(a0)
    800026dc:	04053023          	sd	zero,64(a0)
    800026e0:	04053423          	sd	zero,72(a0)
	ThreadQueue() : front(nullptr), back(nullptr) {}
    800026e4:	04053823          	sd	zero,80(a0)
    800026e8:	04053c23          	sd	zero,88(a0)
		//formiranje pocetnog konteksta; specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    800026ec:	04098a63          	beqz	s3,80002740 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xc4>
    800026f0:	00000797          	auipc	a5,0x0
    800026f4:	e3878793          	addi	a5,a5,-456 # 80002528 <_ZN3TCB7wrapperEv>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    800026f8:	04090863          	beqz	s2,80002748 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xcc>
    800026fc:	00008637          	lui	a2,0x8
    80002700:	00c90933          	add	s2,s2,a2
		this->context.ra = startRa;
    80002704:	00f4b023          	sd	a5,0(s1)
		this->context.sp = startSp;
    80002708:	0124b423          	sd	s2,8(s1)
	if (function != nullptr) Scheduler::put(newThread);
    8000270c:	00098863          	beqz	s3,8000271c <_ZN3TCB12createThreadEPFvPvES0_Pm+0xa0>
    80002710:	00048513          	mv	a0,s1
    80002714:	fffff097          	auipc	ra,0xfffff
    80002718:	ed4080e7          	jalr	-300(ra) # 800015e8 <_ZN9Scheduler3putEP3TCB>
}
    8000271c:	00048513          	mv	a0,s1
    80002720:	02813083          	ld	ra,40(sp)
    80002724:	02013403          	ld	s0,32(sp)
    80002728:	01813483          	ld	s1,24(sp)
    8000272c:	01013903          	ld	s2,16(sp)
    80002730:	00813983          	ld	s3,8(sp)
    80002734:	00013a03          	ld	s4,0(sp)
    80002738:	03010113          	addi	sp,sp,48
    8000273c:	00008067          	ret
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80002740:	00000793          	li	a5,0
    80002744:	fb5ff06f          	j	800026f8 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x7c>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80002748:	00000913          	li	s2,0
    8000274c:	fb9ff06f          	j	80002704 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x88>

0000000080002750 <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    80002750:	ff010113          	addi	sp,sp,-16
    80002754:	00113423          	sd	ra,8(sp)
    80002758:	00813023          	sd	s0,0(sp)
    8000275c:	01010413          	addi	s0,sp,16
	MemoryAllocator::kfree(ptr);
    80002760:	00000097          	auipc	ra,0x0
    80002764:	2bc080e7          	jalr	700(ra) # 80002a1c <_ZN15MemoryAllocator5kfreeEPv>
}
    80002768:	00813083          	ld	ra,8(sp)
    8000276c:	00013403          	ld	s0,0(sp)
    80002770:	01010113          	addi	sp,sp,16
    80002774:	00008067          	ret

0000000080002778 <_ZN3TCB10threadJoinEPS_>:

void TCB::threadJoin(TCB* handle) {
	if(handle->finished) return;
    80002778:	03054783          	lbu	a5,48(a0)
    8000277c:	00078463          	beqz	a5,80002784 <_ZN3TCB10threadJoinEPS_+0xc>
    80002780:	00008067          	ret
void TCB::threadJoin(TCB* handle) {
    80002784:	ff010113          	addi	sp,sp,-16
    80002788:	00113423          	sd	ra,8(sp)
    8000278c:	00813023          	sd	s0,0(sp)
    80002790:	01010413          	addi	s0,sp,16
	TCB::running->needToJoin = true;
    80002794:	00005597          	auipc	a1,0x5
    80002798:	c2c5b583          	ld	a1,-980(a1) # 800073c0 <_ZN3TCB7runningE>
    8000279c:	00100793          	li	a5,1
    800027a0:	02f58923          	sb	a5,50(a1)
	handle->waitingToJoin.putLast(TCB::running);
    800027a4:	05050513          	addi	a0,a0,80
    800027a8:	fffff097          	auipc	ra,0xfffff
    800027ac:	a7c080e7          	jalr	-1412(ra) # 80001224 <_ZN11ThreadQueue7putLastEP3TCB>
}
    800027b0:	00813083          	ld	ra,8(sp)
    800027b4:	00013403          	ld	s0,0(sp)
    800027b8:	01010113          	addi	sp,sp,16
    800027bc:	00008067          	ret

00000000800027c0 <_ZN3TCB13releaseJoinedEv>:

void TCB::releaseJoined() {
	while(!TCB::running->waitingToJoin.isEmpty()){
    800027c0:	00005517          	auipc	a0,0x5
    800027c4:	c0053503          	ld	a0,-1024(a0) # 800073c0 <_ZN3TCB7runningE>
		return front == nullptr;
    800027c8:	05053783          	ld	a5,80(a0)
    800027cc:	04078663          	beqz	a5,80002818 <_ZN3TCB13releaseJoinedEv+0x58>
void TCB::releaseJoined() {
    800027d0:	ff010113          	addi	sp,sp,-16
    800027d4:	00113423          	sd	ra,8(sp)
    800027d8:	00813023          	sd	s0,0(sp)
    800027dc:	01010413          	addi	s0,sp,16
		TCB* tcb = TCB::running->waitingToJoin.getFirst();
    800027e0:	05050513          	addi	a0,a0,80
    800027e4:	fffff097          	auipc	ra,0xfffff
    800027e8:	aac080e7          	jalr	-1364(ra) # 80001290 <_ZN11ThreadQueue8getFirstEv>
		tcb->needToJoin = false;
    800027ec:	02050923          	sb	zero,50(a0)
		Scheduler::put(tcb);
    800027f0:	fffff097          	auipc	ra,0xfffff
    800027f4:	df8080e7          	jalr	-520(ra) # 800015e8 <_ZN9Scheduler3putEP3TCB>
	while(!TCB::running->waitingToJoin.isEmpty()){
    800027f8:	00005517          	auipc	a0,0x5
    800027fc:	bc853503          	ld	a0,-1080(a0) # 800073c0 <_ZN3TCB7runningE>
    80002800:	05053783          	ld	a5,80(a0)
    80002804:	fc079ee3          	bnez	a5,800027e0 <_ZN3TCB13releaseJoinedEv+0x20>
	}
}
    80002808:	00813083          	ld	ra,8(sp)
    8000280c:	00013403          	ld	s0,0(sp)
    80002810:	01010113          	addi	sp,sp,16
    80002814:	00008067          	ret
    80002818:	00008067          	ret

000000008000281c <_ZN3TCB5startEPS_>:

void TCB::start(TCB* newTcb) {
	//startovanje niti(stavljanje u Scheduler); main nit je vec aktivna, ne stavlja se u Scheduler
	if (newTcb->threadFunction != nullptr) Scheduler::put(newTcb);
    8000281c:	01053783          	ld	a5,16(a0)
    80002820:	02078663          	beqz	a5,8000284c <_ZN3TCB5startEPS_+0x30>
void TCB::start(TCB* newTcb) {
    80002824:	ff010113          	addi	sp,sp,-16
    80002828:	00113423          	sd	ra,8(sp)
    8000282c:	00813023          	sd	s0,0(sp)
    80002830:	01010413          	addi	s0,sp,16
	if (newTcb->threadFunction != nullptr) Scheduler::put(newTcb);
    80002834:	fffff097          	auipc	ra,0xfffff
    80002838:	db4080e7          	jalr	-588(ra) # 800015e8 <_ZN9Scheduler3putEP3TCB>
}
    8000283c:	00813083          	ld	ra,8(sp)
    80002840:	00013403          	ld	s0,0(sp)
    80002844:	01010113          	addi	sp,sp,16
    80002848:	00008067          	ret
    8000284c:	00008067          	ret

0000000080002850 <_ZN5Riscv10popSppSpieEv>:
// Created by os on 5/17/23.
//

#include "../h/Riscv.hpp"

void Riscv::popSppSpie() {
    80002850:	ff010113          	addi	sp,sp,-16
    80002854:	00813423          	sd	s0,8(sp)
    80002858:	01010413          	addi	s0,sp,16
	//ra pokazuje iza ove funkcije na nastavak wrappera
	__asm__ volatile("csrw sepc, ra");
    8000285c:	14109073          	csrw	sepc,ra
	__asm__ volatile("sret");
    80002860:	10200073          	sret
    80002864:	00813403          	ld	s0,8(sp)
    80002868:	01010113          	addi	sp,sp,16
    8000286c:	00008067          	ret

0000000080002870 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>:

bool MemoryAllocator::initialized = false;
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

void* MemoryAllocator::kmalloc(size_t size, Purpose pur) {
    80002870:	ff010113          	addi	sp,sp,-16
    80002874:	00813423          	sd	s0,8(sp)
    80002878:	01010413          	addi	s0,sp,16
	if (size <= 0) return nullptr;
    8000287c:	12050863          	beqz	a0,800029ac <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x13c>

	//pocetna inicijalizacija
	if (!initialized) {
    80002880:	00005797          	auipc	a5,0x5
    80002884:	b507c783          	lbu	a5,-1200(a5) # 800073d0 <_ZN15MemoryAllocator11initializedE>
    80002888:	04079863          	bnez	a5,800028d8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x68>
		freeMemHead = (FreeMemSegment*)HEAP_START_ADDR;
    8000288c:	00005617          	auipc	a2,0x5
    80002890:	a8c63603          	ld	a2,-1396(a2) # 80007318 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002894:	00063783          	ld	a5,0(a2)
    80002898:	00005717          	auipc	a4,0x5
    8000289c:	b3870713          	addi	a4,a4,-1224 # 800073d0 <_ZN15MemoryAllocator11initializedE>
    800028a0:	00f73423          	sd	a5,8(a4)
		freeMemHead->next = nullptr;
    800028a4:	0007b023          	sd	zero,0(a5)
		freeMemHead->prev = nullptr;
    800028a8:	00873683          	ld	a3,8(a4)
    800028ac:	0006b423          	sd	zero,8(a3)
		freeMemHead->size = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR - sizeof(FreeMemSegment);
    800028b0:	00005797          	auipc	a5,0x5
    800028b4:	a987b783          	ld	a5,-1384(a5) # 80007348 <_GLOBAL_OFFSET_TABLE_+0x48>
    800028b8:	0007b783          	ld	a5,0(a5)
    800028bc:	00063603          	ld	a2,0(a2)
    800028c0:	40c787b3          	sub	a5,a5,a2
    800028c4:	fe878793          	addi	a5,a5,-24
    800028c8:	00f6b823          	sd	a5,16(a3)
		usedMemHead = nullptr;
    800028cc:	00073823          	sd	zero,16(a4)

		initialized = true;
    800028d0:	00100793          	li	a5,1
    800028d4:	00f70023          	sb	a5,0(a4)
	}

	//alokacija uvek zaokruzena na blokove
	//size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
	size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    800028d8:	00655793          	srli	a5,a0,0x6
    800028dc:	03f57513          	andi	a0,a0,63
    800028e0:	00050463          	beqz	a0,800028e8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x78>
    800028e4:	00100513          	li	a0,1
    800028e8:	00a78533          	add	a0,a5,a0
	size = blocks * MEM_BLOCK_SIZE;
    800028ec:	00651793          	slli	a5,a0,0x6

	//trazenje slobodnog segmenta po first-fit algoritmu
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    800028f0:	00005517          	auipc	a0,0x5
    800028f4:	ae853503          	ld	a0,-1304(a0) # 800073d8 <_ZN15MemoryAllocator11freeMemHeadE>
    800028f8:	08050c63          	beqz	a0,80002990 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x120>
		if (current->size < size) continue;
    800028fc:	01053703          	ld	a4,16(a0)
    80002900:	06f76463          	bltu	a4,a5,80002968 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xf8>

		//pravljenje novog slobodnog fragmenta od ostatka fragmenta
		FreeMemSegment* remainderFree = (FreeMemSegment*)((char*)current + size);
    80002904:	00f506b3          	add	a3,a0,a5
		remainderFree->size = current->size - size;
    80002908:	40f70733          	sub	a4,a4,a5
    8000290c:	00e6b823          	sd	a4,16(a3)
		remainderFree->prev = current->prev;
    80002910:	00853703          	ld	a4,8(a0)
    80002914:	00e6b423          	sd	a4,8(a3)
		if (current->prev) current->prev->next = remainderFree;
    80002918:	00070463          	beqz	a4,80002920 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xb0>
    8000291c:	00d73023          	sd	a3,0(a4)
		remainderFree->next = current->next;
    80002920:	00053703          	ld	a4,0(a0)
    80002924:	00e6b023          	sd	a4,0(a3)
		if (current->next) current->next->prev = remainderFree;
    80002928:	00070463          	beqz	a4,80002930 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xc0>
    8000292c:	00d73423          	sd	a3,8(a4)
		if (freeMemHead == current) freeMemHead = remainderFree;
    80002930:	00005717          	auipc	a4,0x5
    80002934:	aa873703          	ld	a4,-1368(a4) # 800073d8 <_ZN15MemoryAllocator11freeMemHeadE>
    80002938:	02a70c63          	beq	a4,a0,80002970 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x100>

		//ubacivanje novog fragmenta u listu zauzetih fragmenata
		UsedMemSegment* newFragment = (UsedMemSegment*)current;
		newFragment->size = size;
    8000293c:	00f53423          	sd	a5,8(a0)
		newFragment->purpose = pur;
    80002940:	00b52823          	sw	a1,16(a0)
		UsedMemSegment* prevUsed = nullptr;
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    80002944:	00005697          	auipc	a3,0x5
    80002948:	a9c6b683          	ld	a3,-1380(a3) # 800073e0 <_ZN15MemoryAllocator11usedMemHeadE>
    8000294c:	00068793          	mv	a5,a3
		UsedMemSegment* prevUsed = nullptr;
    80002950:	00000713          	li	a4,0
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    80002954:	02078463          	beqz	a5,8000297c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x10c>
    80002958:	02a7f263          	bgeu	a5,a0,8000297c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x10c>
    8000295c:	00078713          	mv	a4,a5
    80002960:	0007b783          	ld	a5,0(a5)
    80002964:	ff1ff06f          	j	80002954 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xe4>
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80002968:	00053503          	ld	a0,0(a0)
    8000296c:	f8dff06f          	j	800028f8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x88>
		if (freeMemHead == current) freeMemHead = remainderFree;
    80002970:	00005717          	auipc	a4,0x5
    80002974:	a6d73423          	sd	a3,-1432(a4) # 800073d8 <_ZN15MemoryAllocator11freeMemHeadE>
    80002978:	fc5ff06f          	j	8000293c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xcc>
		if (!prevUsed) {
    8000297c:	02070063          	beqz	a4,8000299c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x12c>
			newFragment->next = usedMemHead;
			usedMemHead = newFragment;
		} else {
			newFragment->next = prevUsed->next;
    80002980:	00073783          	ld	a5,0(a4)
    80002984:	00f53023          	sd	a5,0(a0)
			prevUsed->next = newFragment;
    80002988:	00a73023          	sd	a0,0(a4)
		}
		return (char*)newFragment + sizeof(UsedMemSegment);
    8000298c:	01850513          	addi	a0,a0,24
	}
	return nullptr;
}
    80002990:	00813403          	ld	s0,8(sp)
    80002994:	01010113          	addi	sp,sp,16
    80002998:	00008067          	ret
			newFragment->next = usedMemHead;
    8000299c:	00d53023          	sd	a3,0(a0)
			usedMemHead = newFragment;
    800029a0:	00005797          	auipc	a5,0x5
    800029a4:	a4a7b023          	sd	a0,-1472(a5) # 800073e0 <_ZN15MemoryAllocator11usedMemHeadE>
    800029a8:	fe5ff06f          	j	8000298c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x11c>
	if (size <= 0) return nullptr;
    800029ac:	00000513          	li	a0,0
    800029b0:	fe1ff06f          	j	80002990 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x120>

00000000800029b4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:
	tryToJoin(newFree);
	tryToJoin(prevFree);
	return 0;
}

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    800029b4:	ff010113          	addi	sp,sp,-16
    800029b8:	00813423          	sd	s0,8(sp)
    800029bc:	01010413          	addi	s0,sp,16
	if (!current) return 0;
    800029c0:	04050663          	beqz	a0,80002a0c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x58>
	bool nextExists = current->next != nullptr;
    800029c4:	00053783          	ld	a5,0(a0)
	char* nextAddr = (char*)current + current->size;
    800029c8:	01053703          	ld	a4,16(a0)
    800029cc:	00e506b3          	add	a3,a0,a4
	char* cnext = (char*)current->next;
	bool nextIsConnected = (nextAddr == cnext);
	if (nextExists && nextIsConnected) {
    800029d0:	04078263          	beqz	a5,80002a14 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x60>
    800029d4:	00d78a63          	beq	a5,a3,800029e8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x34>
		current->size += current->next->size;
		current->next = current->next->next;
		if (current->next) current->next->prev = current;
		return 1;
	} else return 0;
    800029d8:	00000513          	li	a0,0
}
    800029dc:	00813403          	ld	s0,8(sp)
    800029e0:	01010113          	addi	sp,sp,16
    800029e4:	00008067          	ret
		current->size += current->next->size;
    800029e8:	0107b683          	ld	a3,16(a5)
    800029ec:	00d70733          	add	a4,a4,a3
    800029f0:	00e53823          	sd	a4,16(a0)
		current->next = current->next->next;
    800029f4:	0007b783          	ld	a5,0(a5)
    800029f8:	00f53023          	sd	a5,0(a0)
		if (current->next) current->next->prev = current;
    800029fc:	00078463          	beqz	a5,80002a04 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x50>
    80002a00:	00a7b423          	sd	a0,8(a5)
		return 1;
    80002a04:	00100513          	li	a0,1
    80002a08:	fd5ff06f          	j	800029dc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	if (!current) return 0;
    80002a0c:	00000513          	li	a0,0
    80002a10:	fcdff06f          	j	800029dc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	} else return 0;
    80002a14:	00000513          	li	a0,0
    80002a18:	fc5ff06f          	j	800029dc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>

0000000080002a1c <_ZN15MemoryAllocator5kfreeEPv>:
	if (!ptr) return 0;
    80002a1c:	10050463          	beqz	a0,80002b24 <_ZN15MemoryAllocator5kfreeEPv+0x108>
    80002a20:	00050693          	mv	a3,a0
	if (!usedMemHead) return -1;
    80002a24:	00005797          	auipc	a5,0x5
    80002a28:	9bc7b783          	ld	a5,-1604(a5) # 800073e0 <_ZN15MemoryAllocator11usedMemHeadE>
    80002a2c:	10078063          	beqz	a5,80002b2c <_ZN15MemoryAllocator5kfreeEPv+0x110>
	ptr = (char*)ptr - sizeof(UsedMemSegment);
    80002a30:	fe850513          	addi	a0,a0,-24
	UsedMemSegment* prevUsed = nullptr;
    80002a34:	00000713          	li	a4,0
	for (; currentUsed && currentUsed != ptr; prevUsed = currentUsed, currentUsed = currentUsed->next);
    80002a38:	00078a63          	beqz	a5,80002a4c <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80002a3c:	00a78863          	beq	a5,a0,80002a4c <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80002a40:	00078713          	mv	a4,a5
    80002a44:	0007b783          	ld	a5,0(a5)
    80002a48:	ff1ff06f          	j	80002a38 <_ZN15MemoryAllocator5kfreeEPv+0x1c>
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80002a4c:	0ea79463          	bne	a5,a0,80002b34 <_ZN15MemoryAllocator5kfreeEPv+0x118>
int MemoryAllocator::kfree(void* ptr) {
    80002a50:	fe010113          	addi	sp,sp,-32
    80002a54:	00113c23          	sd	ra,24(sp)
    80002a58:	00813823          	sd	s0,16(sp)
    80002a5c:	00913423          	sd	s1,8(sp)
    80002a60:	02010413          	addi	s0,sp,32
	if (prevUsed) prevUsed->next = currentUsed->next;
    80002a64:	02070863          	beqz	a4,80002a94 <_ZN15MemoryAllocator5kfreeEPv+0x78>
    80002a68:	0007b783          	ld	a5,0(a5)
    80002a6c:	00f73023          	sd	a5,0(a4)
	if (!freeMemHead || ptr < (char*)freeMemHead) {
    80002a70:	00005797          	auipc	a5,0x5
    80002a74:	9687b783          	ld	a5,-1688(a5) # 800073d8 <_ZN15MemoryAllocator11freeMemHeadE>
    80002a78:	02078663          	beqz	a5,80002aa4 <_ZN15MemoryAllocator5kfreeEPv+0x88>
    80002a7c:	02f56863          	bltu	a0,a5,80002aac <_ZN15MemoryAllocator5kfreeEPv+0x90>
			 prevFree->next != nullptr && ptr > (char*)(prevFree->next); prevFree = prevFree->next);
    80002a80:	00078493          	mv	s1,a5
    80002a84:	0007b783          	ld	a5,0(a5)
    80002a88:	02078463          	beqz	a5,80002ab0 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80002a8c:	fea7eae3          	bltu	a5,a0,80002a80 <_ZN15MemoryAllocator5kfreeEPv+0x64>
    80002a90:	0200006f          	j	80002ab0 <_ZN15MemoryAllocator5kfreeEPv+0x94>
	else usedMemHead = currentUsed->next;
    80002a94:	0007b783          	ld	a5,0(a5)
    80002a98:	00005717          	auipc	a4,0x5
    80002a9c:	94f73423          	sd	a5,-1720(a4) # 800073e0 <_ZN15MemoryAllocator11usedMemHeadE>
    80002aa0:	fd1ff06f          	j	80002a70 <_ZN15MemoryAllocator5kfreeEPv+0x54>
		prevFree = nullptr;
    80002aa4:	00078493          	mv	s1,a5
    80002aa8:	0080006f          	j	80002ab0 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80002aac:	00000493          	li	s1,0
	size_t segmentSize = ((UsedMemSegment*)ptr)->size;
    80002ab0:	ff06b783          	ld	a5,-16(a3)
	newFree->size = segmentSize;
    80002ab4:	fef6bc23          	sd	a5,-8(a3)
	newFree->prev = prevFree;
    80002ab8:	fe96b823          	sd	s1,-16(a3)
	if (prevFree) newFree->next = prevFree->next;
    80002abc:	04048663          	beqz	s1,80002b08 <_ZN15MemoryAllocator5kfreeEPv+0xec>
    80002ac0:	0004b783          	ld	a5,0(s1)
    80002ac4:	fef6b423          	sd	a5,-24(a3)
	if (newFree->next) newFree->next->prev = newFree;
    80002ac8:	fe86b783          	ld	a5,-24(a3)
    80002acc:	00078463          	beqz	a5,80002ad4 <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    80002ad0:	00a7b423          	sd	a0,8(a5)
	if (prevFree) prevFree->next = newFree;
    80002ad4:	04048263          	beqz	s1,80002b18 <_ZN15MemoryAllocator5kfreeEPv+0xfc>
    80002ad8:	00a4b023          	sd	a0,0(s1)
	tryToJoin(newFree);
    80002adc:	00000097          	auipc	ra,0x0
    80002ae0:	ed8080e7          	jalr	-296(ra) # 800029b4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	tryToJoin(prevFree);
    80002ae4:	00048513          	mv	a0,s1
    80002ae8:	00000097          	auipc	ra,0x0
    80002aec:	ecc080e7          	jalr	-308(ra) # 800029b4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	return 0;
    80002af0:	00000513          	li	a0,0
}
    80002af4:	01813083          	ld	ra,24(sp)
    80002af8:	01013403          	ld	s0,16(sp)
    80002afc:	00813483          	ld	s1,8(sp)
    80002b00:	02010113          	addi	sp,sp,32
    80002b04:	00008067          	ret
	else newFree->next = freeMemHead;
    80002b08:	00005797          	auipc	a5,0x5
    80002b0c:	8d07b783          	ld	a5,-1840(a5) # 800073d8 <_ZN15MemoryAllocator11freeMemHeadE>
    80002b10:	fef6b423          	sd	a5,-24(a3)
    80002b14:	fb5ff06f          	j	80002ac8 <_ZN15MemoryAllocator5kfreeEPv+0xac>
	else freeMemHead = newFree;
    80002b18:	00005797          	auipc	a5,0x5
    80002b1c:	8ca7b023          	sd	a0,-1856(a5) # 800073d8 <_ZN15MemoryAllocator11freeMemHeadE>
    80002b20:	fbdff06f          	j	80002adc <_ZN15MemoryAllocator5kfreeEPv+0xc0>
	if (!ptr) return 0;
    80002b24:	00000513          	li	a0,0
    80002b28:	00008067          	ret
	if (!usedMemHead) return -1;
    80002b2c:	fff00513          	li	a0,-1
    80002b30:	00008067          	ret
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80002b34:	fff00513          	li	a0,-1
}
    80002b38:	00008067          	ret

0000000080002b3c <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>:

bool MemoryAllocator::checkPurpose(void* ptr, MemoryAllocator::Purpose p) {
    80002b3c:	ff010113          	addi	sp,sp,-16
    80002b40:	00813423          	sd	s0,8(sp)
    80002b44:	01010413          	addi	s0,sp,16
	ptr = (char*)ptr - sizeof(UsedMemSegment);
	return ((UsedMemSegment*)ptr)->purpose == p;
    80002b48:	ff852503          	lw	a0,-8(a0)
    80002b4c:	40b50533          	sub	a0,a0,a1
}
    80002b50:	00153513          	seqz	a0,a0
    80002b54:	00813403          	ld	s0,8(sp)
    80002b58:	01010113          	addi	sp,sp,16
    80002b5c:	00008067          	ret

0000000080002b60 <_ZN4KSemnwEm>:

#include "../h/KSem.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void* KSem::operator new(size_t size) {
    80002b60:	ff010113          	addi	sp,sp,-16
    80002b64:	00113423          	sd	ra,8(sp)
    80002b68:	00813023          	sd	s0,0(sp)
    80002b6c:	01010413          	addi	s0,sp,16
	return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::SEMAPHORE);
    80002b70:	00100593          	li	a1,1
    80002b74:	01850513          	addi	a0,a0,24
    80002b78:	00000097          	auipc	ra,0x0
    80002b7c:	cf8080e7          	jalr	-776(ra) # 80002870 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
}
    80002b80:	00813083          	ld	ra,8(sp)
    80002b84:	00013403          	ld	s0,0(sp)
    80002b88:	01010113          	addi	sp,sp,16
    80002b8c:	00008067          	ret

0000000080002b90 <_ZN4KSemdlEPv>:

void KSem::operator delete(void* ptr) {
    80002b90:	ff010113          	addi	sp,sp,-16
    80002b94:	00113423          	sd	ra,8(sp)
    80002b98:	00813023          	sd	s0,0(sp)
    80002b9c:	01010413          	addi	s0,sp,16
	MemoryAllocator::kfree(ptr);
    80002ba0:	00000097          	auipc	ra,0x0
    80002ba4:	e7c080e7          	jalr	-388(ra) # 80002a1c <_ZN15MemoryAllocator5kfreeEPv>
}
    80002ba8:	00813083          	ld	ra,8(sp)
    80002bac:	00013403          	ld	s0,0(sp)
    80002bb0:	01010113          	addi	sp,sp,16
    80002bb4:	00008067          	ret

0000000080002bb8 <_ZN4KSem7initSemEj>:

KSem* KSem::initSem(uint val) {
    80002bb8:	fe010113          	addi	sp,sp,-32
    80002bbc:	00113c23          	sd	ra,24(sp)
    80002bc0:	00813823          	sd	s0,16(sp)
    80002bc4:	00913423          	sd	s1,8(sp)
    80002bc8:	02010413          	addi	s0,sp,32
    80002bcc:	00050493          	mv	s1,a0
	return new KSem(val);
    80002bd0:	02000513          	li	a0,32
    80002bd4:	00000097          	auipc	ra,0x0
    80002bd8:	f8c080e7          	jalr	-116(ra) # 80002b60 <_ZN4KSemnwEm>
	void block();

	void unblock();

private:
	KSem(uint val) : val(val), working(true) {}
    80002bdc:	00952023          	sw	s1,0(a0)
	ThreadQueue() : front(nullptr), back(nullptr) {}
    80002be0:	00053423          	sd	zero,8(a0)
    80002be4:	00053823          	sd	zero,16(a0)
    80002be8:	00100713          	li	a4,1
    80002bec:	00e50c23          	sb	a4,24(a0)
}
    80002bf0:	01813083          	ld	ra,24(sp)
    80002bf4:	01013403          	ld	s0,16(sp)
    80002bf8:	00813483          	ld	s1,8(sp)
    80002bfc:	02010113          	addi	sp,sp,32
    80002c00:	00008067          	ret

0000000080002c04 <_ZN4KSem5blockEv>:
	if (!working) return -3;
	if (val++ < 0) unblock();
	return 0;
}

void KSem::block() {
    80002c04:	ff010113          	addi	sp,sp,-16
    80002c08:	00113423          	sd	ra,8(sp)
    80002c0c:	00813023          	sd	s0,0(sp)
    80002c10:	01010413          	addi	s0,sp,16
	TCB::running->setBlocked(true);
    80002c14:	00004797          	auipc	a5,0x4
    80002c18:	72c7b783          	ld	a5,1836(a5) # 80007340 <_GLOBAL_OFFSET_TABLE_+0x40>
    80002c1c:	0007b583          	ld	a1,0(a5)
	void setBlocked(bool block) { this->blocked = block; }
    80002c20:	00100793          	li	a5,1
    80002c24:	02f588a3          	sb	a5,49(a1)
	blocked.putLast(TCB::running);
    80002c28:	00850513          	addi	a0,a0,8
    80002c2c:	ffffe097          	auipc	ra,0xffffe
    80002c30:	5f8080e7          	jalr	1528(ra) # 80001224 <_ZN11ThreadQueue7putLastEP3TCB>
	TCB::yield();
    80002c34:	00000097          	auipc	ra,0x0
    80002c38:	9e0080e7          	jalr	-1568(ra) # 80002614 <_ZN3TCB5yieldEv>
}
    80002c3c:	00813083          	ld	ra,8(sp)
    80002c40:	00013403          	ld	s0,0(sp)
    80002c44:	01010113          	addi	sp,sp,16
    80002c48:	00008067          	ret

0000000080002c4c <_ZN4KSem4waitEv>:
int KSem::wait() {
    80002c4c:	fe010113          	addi	sp,sp,-32
    80002c50:	00113c23          	sd	ra,24(sp)
    80002c54:	00813823          	sd	s0,16(sp)
    80002c58:	00913423          	sd	s1,8(sp)
    80002c5c:	02010413          	addi	s0,sp,32
    80002c60:	00050493          	mv	s1,a0
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    80002c64:	00100593          	li	a1,1
    80002c68:	00000097          	auipc	ra,0x0
    80002c6c:	ed4080e7          	jalr	-300(ra) # 80002b3c <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>
    80002c70:	04050663          	beqz	a0,80002cbc <_ZN4KSem4waitEv+0x70>
	if (!working) return -3;
    80002c74:	0184c783          	lbu	a5,24(s1)
    80002c78:	04078663          	beqz	a5,80002cc4 <_ZN4KSem4waitEv+0x78>
	if (--val < 0) {
    80002c7c:	0004a783          	lw	a5,0(s1)
    80002c80:	fff7879b          	addiw	a5,a5,-1
    80002c84:	00f4a023          	sw	a5,0(s1)
    80002c88:	02079713          	slli	a4,a5,0x20
    80002c8c:	00074e63          	bltz	a4,80002ca8 <_ZN4KSem4waitEv+0x5c>
	return 0;
    80002c90:	00000513          	li	a0,0
}
    80002c94:	01813083          	ld	ra,24(sp)
    80002c98:	01013403          	ld	s0,16(sp)
    80002c9c:	00813483          	ld	s1,8(sp)
    80002ca0:	02010113          	addi	sp,sp,32
    80002ca4:	00008067          	ret
		block();
    80002ca8:	00048513          	mv	a0,s1
    80002cac:	00000097          	auipc	ra,0x0
    80002cb0:	f58080e7          	jalr	-168(ra) # 80002c04 <_ZN4KSem5blockEv>
		return -1;
    80002cb4:	fff00513          	li	a0,-1
    80002cb8:	fddff06f          	j	80002c94 <_ZN4KSem4waitEv+0x48>
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    80002cbc:	ffe00513          	li	a0,-2
    80002cc0:	fd5ff06f          	j	80002c94 <_ZN4KSem4waitEv+0x48>
	if (!working) return -3;
    80002cc4:	ffd00513          	li	a0,-3
    80002cc8:	fcdff06f          	j	80002c94 <_ZN4KSem4waitEv+0x48>

0000000080002ccc <_ZN4KSem7unblockEv>:

void KSem::unblock() {
    80002ccc:	ff010113          	addi	sp,sp,-16
    80002cd0:	00113423          	sd	ra,8(sp)
    80002cd4:	00813023          	sd	s0,0(sp)
    80002cd8:	01010413          	addi	s0,sp,16
	TCB* tcb = blocked.getFirst();
    80002cdc:	00850513          	addi	a0,a0,8
    80002ce0:	ffffe097          	auipc	ra,0xffffe
    80002ce4:	5b0080e7          	jalr	1456(ra) # 80001290 <_ZN11ThreadQueue8getFirstEv>
    80002ce8:	020508a3          	sb	zero,49(a0)
	tcb->setBlocked(false);
	Scheduler::put(tcb);
    80002cec:	fffff097          	auipc	ra,0xfffff
    80002cf0:	8fc080e7          	jalr	-1796(ra) # 800015e8 <_ZN9Scheduler3putEP3TCB>
}
    80002cf4:	00813083          	ld	ra,8(sp)
    80002cf8:	00013403          	ld	s0,0(sp)
    80002cfc:	01010113          	addi	sp,sp,16
    80002d00:	00008067          	ret

0000000080002d04 <_ZN4KSem6signalEv>:
int KSem::signal() {
    80002d04:	fe010113          	addi	sp,sp,-32
    80002d08:	00113c23          	sd	ra,24(sp)
    80002d0c:	00813823          	sd	s0,16(sp)
    80002d10:	00913423          	sd	s1,8(sp)
    80002d14:	02010413          	addi	s0,sp,32
    80002d18:	00050493          	mv	s1,a0
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    80002d1c:	00100593          	li	a1,1
    80002d20:	00000097          	auipc	ra,0x0
    80002d24:	e1c080e7          	jalr	-484(ra) # 80002b3c <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>
    80002d28:	04050463          	beqz	a0,80002d70 <_ZN4KSem6signalEv+0x6c>
	if (!working) return -3;
    80002d2c:	0184c783          	lbu	a5,24(s1)
    80002d30:	04078463          	beqz	a5,80002d78 <_ZN4KSem6signalEv+0x74>
	if (val++ < 0) unblock();
    80002d34:	0004a783          	lw	a5,0(s1)
    80002d38:	0017871b          	addiw	a4,a5,1
    80002d3c:	00e4a023          	sw	a4,0(s1)
    80002d40:	0007ce63          	bltz	a5,80002d5c <_ZN4KSem6signalEv+0x58>
	return 0;
    80002d44:	00000513          	li	a0,0
}
    80002d48:	01813083          	ld	ra,24(sp)
    80002d4c:	01013403          	ld	s0,16(sp)
    80002d50:	00813483          	ld	s1,8(sp)
    80002d54:	02010113          	addi	sp,sp,32
    80002d58:	00008067          	ret
	if (val++ < 0) unblock();
    80002d5c:	00048513          	mv	a0,s1
    80002d60:	00000097          	auipc	ra,0x0
    80002d64:	f6c080e7          	jalr	-148(ra) # 80002ccc <_ZN4KSem7unblockEv>
	return 0;
    80002d68:	00000513          	li	a0,0
    80002d6c:	fddff06f          	j	80002d48 <_ZN4KSem6signalEv+0x44>
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    80002d70:	ffe00513          	li	a0,-2
    80002d74:	fd5ff06f          	j	80002d48 <_ZN4KSem6signalEv+0x44>
	if (!working) return -3;
    80002d78:	ffd00513          	li	a0,-3
    80002d7c:	fcdff06f          	j	80002d48 <_ZN4KSem6signalEv+0x44>

0000000080002d80 <_ZN4KSem8closeSemEPS_>:

int KSem::closeSem(sem_t handle) {
    80002d80:	fe010113          	addi	sp,sp,-32
    80002d84:	00113c23          	sd	ra,24(sp)
    80002d88:	00813823          	sd	s0,16(sp)
    80002d8c:	00913423          	sd	s1,8(sp)
    80002d90:	02010413          	addi	s0,sp,32
    80002d94:	00050493          	mv	s1,a0
	if (!MemoryAllocator::checkPurpose(handle, MemoryAllocator::SEMAPHORE)) return -2;
    80002d98:	00100593          	li	a1,1
    80002d9c:	00000097          	auipc	ra,0x0
    80002da0:	da0080e7          	jalr	-608(ra) # 80002b3c <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>
    80002da4:	04050263          	beqz	a0,80002de8 <_ZN4KSem8closeSemEPS_+0x68>
	handle->working = false;
    80002da8:	00048c23          	sb	zero,24(s1)
    80002dac:	01c0006f          	j	80002dc8 <_ZN4KSem8closeSemEPS_+0x48>
	while (!handle->blocked.isEmpty()) {
		TCB* tcb = handle->blocked.getFirst();
    80002db0:	00848513          	addi	a0,s1,8
    80002db4:	ffffe097          	auipc	ra,0xffffe
    80002db8:	4dc080e7          	jalr	1244(ra) # 80001290 <_ZN11ThreadQueue8getFirstEv>
    80002dbc:	020508a3          	sb	zero,49(a0)
		tcb->setBlocked(false);
		Scheduler::put(tcb);
    80002dc0:	fffff097          	auipc	ra,0xfffff
    80002dc4:	828080e7          	jalr	-2008(ra) # 800015e8 <_ZN9Scheduler3putEP3TCB>
		return front == nullptr;
    80002dc8:	0084b783          	ld	a5,8(s1)
	while (!handle->blocked.isEmpty()) {
    80002dcc:	fe0792e3          	bnez	a5,80002db0 <_ZN4KSem8closeSemEPS_+0x30>
	}
	return 0;
    80002dd0:	00000513          	li	a0,0
}
    80002dd4:	01813083          	ld	ra,24(sp)
    80002dd8:	01013403          	ld	s0,16(sp)
    80002ddc:	00813483          	ld	s1,8(sp)
    80002de0:	02010113          	addi	sp,sp,32
    80002de4:	00008067          	ret
	if (!MemoryAllocator::checkPurpose(handle, MemoryAllocator::SEMAPHORE)) return -2;
    80002de8:	ffe00513          	li	a0,-2
    80002dec:	fe9ff06f          	j	80002dd4 <_ZN4KSem8closeSemEPS_+0x54>

0000000080002df0 <_Z10testMemoryv>:
#include "../h/ThreadQueue.hpp"
//#include "../h/KSem.hpp"

extern sem_t semA;

void testMemory() {
    80002df0:	81010113          	addi	sp,sp,-2032
    80002df4:	7e113423          	sd	ra,2024(sp)
    80002df8:	7e813023          	sd	s0,2016(sp)
    80002dfc:	7c913c23          	sd	s1,2008(sp)
    80002e00:	7f010413          	addi	s0,sp,2032
    80002e04:	83010113          	addi	sp,sp,-2000
	const uint64 NumAllocations = 500;    //zasto nece za preko 500????
	const uint64 AllocationSize = 16;

	// Allocate and initialize pointers
	int* allocations[NumAllocations];
	for (uint64 i = 0; i < NumAllocations; ++i)
    80002e08:	00000713          	li	a4,0
    80002e0c:	1f300793          	li	a5,499
    80002e10:	02e7e263          	bltu	a5,a4,80002e34 <_Z10testMemoryv+0x44>
		allocations[i] = nullptr;
    80002e14:	fffff7b7          	lui	a5,0xfffff
    80002e18:	00371693          	slli	a3,a4,0x3
    80002e1c:	fe040613          	addi	a2,s0,-32
    80002e20:	00f607b3          	add	a5,a2,a5
    80002e24:	00d787b3          	add	a5,a5,a3
    80002e28:	0607b023          	sd	zero,96(a5) # fffffffffffff060 <end+0xffffffff7fff6a10>
	for (uint64 i = 0; i < NumAllocations; ++i)
    80002e2c:	00170713          	addi	a4,a4,1
    80002e30:	fddff06f          	j	80002e0c <_Z10testMemoryv+0x1c>

	// Allocate memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80002e34:	00000493          	li	s1,0
    80002e38:	1f300793          	li	a5,499
    80002e3c:	0297ec63          	bltu	a5,s1,80002e74 <_Z10testMemoryv+0x84>
		allocations[i] = static_cast<int*>(MemoryAllocator::kmalloc(AllocationSize, MemoryAllocator::MISC));
    80002e40:	00300593          	li	a1,3
    80002e44:	01000513          	li	a0,16
    80002e48:	00000097          	auipc	ra,0x0
    80002e4c:	a28080e7          	jalr	-1496(ra) # 80002870 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
    80002e50:	fffff737          	lui	a4,0xfffff
    80002e54:	00349793          	slli	a5,s1,0x3
    80002e58:	fe040693          	addi	a3,s0,-32
    80002e5c:	00e68733          	add	a4,a3,a4
    80002e60:	00f707b3          	add	a5,a4,a5
    80002e64:	06a7b023          	sd	a0,96(a5)
		if (allocations[i] == nullptr) {
    80002e68:	00050663          	beqz	a0,80002e74 <_Z10testMemoryv+0x84>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80002e6c:	00148493          	addi	s1,s1,1
    80002e70:	fc9ff06f          	j	80002e38 <_Z10testMemoryv+0x48>
    80002e74:	00000493          	li	s1,0
    80002e78:	0100006f          	j	80002e88 <_Z10testMemoryv+0x98>
	}

	// Free memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
		if (allocations[i] != nullptr) {
			if (MemoryAllocator::kfree(allocations[i]) != 0) {
    80002e7c:	00000097          	auipc	ra,0x0
    80002e80:	ba0080e7          	jalr	-1120(ra) # 80002a1c <_ZN15MemoryAllocator5kfreeEPv>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80002e84:	00148493          	addi	s1,s1,1
    80002e88:	1f300793          	li	a5,499
    80002e8c:	0297e263          	bltu	a5,s1,80002eb0 <_Z10testMemoryv+0xc0>
		if (allocations[i] != nullptr) {
    80002e90:	fffff737          	lui	a4,0xfffff
    80002e94:	00349793          	slli	a5,s1,0x3
    80002e98:	fe040693          	addi	a3,s0,-32
    80002e9c:	00e68733          	add	a4,a3,a4
    80002ea0:	00f707b3          	add	a5,a4,a5
    80002ea4:	0607b503          	ld	a0,96(a5)
    80002ea8:	fc051ae3          	bnez	a0,80002e7c <_Z10testMemoryv+0x8c>
    80002eac:	fd9ff06f          	j	80002e84 <_Z10testMemoryv+0x94>
//				printString("\nDeallocation failed for index ");
//				printInteger(i);
			}
		}
	}
}
    80002eb0:	7d010113          	addi	sp,sp,2000
    80002eb4:	7e813083          	ld	ra,2024(sp)
    80002eb8:	7e013403          	ld	s0,2016(sp)
    80002ebc:	7d813483          	ld	s1,2008(sp)
    80002ec0:	7f010113          	addi	sp,sp,2032
    80002ec4:	00008067          	ret

0000000080002ec8 <_Z5nit1fPv>:

void nit1f(void*) {
    80002ec8:	fe010113          	addi	sp,sp,-32
    80002ecc:	00113c23          	sd	ra,24(sp)
    80002ed0:	00813823          	sd	s0,16(sp)
    80002ed4:	00913423          	sd	s1,8(sp)
    80002ed8:	01213023          	sd	s2,0(sp)
    80002edc:	02010413          	addi	s0,sp,32
	for(int i=0;i<3;i++){
    80002ee0:	00000913          	li	s2,0
    80002ee4:	0440006f          	j	80002f28 <_Z5nit1fPv+0x60>
		int res = sem_wait(semA);
		if(res){
			printString("\nNit 1 cekala na semaforu\n");
		}
		else{
			printString("\nNit 1 nije cekala\n");
    80002ee8:	00003517          	auipc	a0,0x3
    80002eec:	30850513          	addi	a0,a0,776 # 800061f0 <CONSOLE_STATUS+0x1e0>
    80002ef0:	ffffe097          	auipc	ra,0xffffe
    80002ef4:	6a8080e7          	jalr	1704(ra) # 80001598 <_Z11printStringPKc>
		}
		printString("\nsem_wait za nit 1 vratio ");
    80002ef8:	00003517          	auipc	a0,0x3
    80002efc:	31050513          	addi	a0,a0,784 # 80006208 <CONSOLE_STATUS+0x1f8>
    80002f00:	ffffe097          	auipc	ra,0xffffe
    80002f04:	698080e7          	jalr	1688(ra) # 80001598 <_Z11printStringPKc>
		printInteger(res);
    80002f08:	00048513          	mv	a0,s1
    80002f0c:	ffffe097          	auipc	ra,0xffffe
    80002f10:	6b4080e7          	jalr	1716(ra) # 800015c0 <_Z12printIntegerm>
		printString("\n");
    80002f14:	00003517          	auipc	a0,0x3
    80002f18:	46c50513          	addi	a0,a0,1132 # 80006380 <CONSOLE_STATUS+0x370>
    80002f1c:	ffffe097          	auipc	ra,0xffffe
    80002f20:	67c080e7          	jalr	1660(ra) # 80001598 <_Z11printStringPKc>
	for(int i=0;i<3;i++){
    80002f24:	0019091b          	addiw	s2,s2,1
    80002f28:	00200793          	li	a5,2
    80002f2c:	0527c263          	blt	a5,s2,80002f70 <_Z5nit1fPv+0xa8>
		printString("\nNit 1 dolazi na semafor\n");
    80002f30:	00003517          	auipc	a0,0x3
    80002f34:	28050513          	addi	a0,a0,640 # 800061b0 <CONSOLE_STATUS+0x1a0>
    80002f38:	ffffe097          	auipc	ra,0xffffe
    80002f3c:	660080e7          	jalr	1632(ra) # 80001598 <_Z11printStringPKc>
		int res = sem_wait(semA);
    80002f40:	00004797          	auipc	a5,0x4
    80002f44:	3c87b783          	ld	a5,968(a5) # 80007308 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002f48:	0007b503          	ld	a0,0(a5)
    80002f4c:	ffffe097          	auipc	ra,0xffffe
    80002f50:	59c080e7          	jalr	1436(ra) # 800014e8 <_Z8sem_waitP4KSem>
    80002f54:	00050493          	mv	s1,a0
		if(res){
    80002f58:	f80508e3          	beqz	a0,80002ee8 <_Z5nit1fPv+0x20>
			printString("\nNit 1 cekala na semaforu\n");
    80002f5c:	00003517          	auipc	a0,0x3
    80002f60:	27450513          	addi	a0,a0,628 # 800061d0 <CONSOLE_STATUS+0x1c0>
    80002f64:	ffffe097          	auipc	ra,0xffffe
    80002f68:	634080e7          	jalr	1588(ra) # 80001598 <_Z11printStringPKc>
    80002f6c:	f8dff06f          	j	80002ef8 <_Z5nit1fPv+0x30>
	}

	printString("\nGotova nit 1\n");
    80002f70:	00003517          	auipc	a0,0x3
    80002f74:	2b850513          	addi	a0,a0,696 # 80006228 <CONSOLE_STATUS+0x218>
    80002f78:	ffffe097          	auipc	ra,0xffffe
    80002f7c:	620080e7          	jalr	1568(ra) # 80001598 <_Z11printStringPKc>
}
    80002f80:	01813083          	ld	ra,24(sp)
    80002f84:	01013403          	ld	s0,16(sp)
    80002f88:	00813483          	ld	s1,8(sp)
    80002f8c:	00013903          	ld	s2,0(sp)
    80002f90:	02010113          	addi	sp,sp,32
    80002f94:	00008067          	ret

0000000080002f98 <_Z5nit2fPv>:

void nit2f(void* arg2) {
    80002f98:	fe010113          	addi	sp,sp,-32
    80002f9c:	00113c23          	sd	ra,24(sp)
    80002fa0:	00813823          	sd	s0,16(sp)
    80002fa4:	00913423          	sd	s1,8(sp)
    80002fa8:	01213023          	sd	s2,0(sp)
    80002fac:	02010413          	addi	s0,sp,32
	for(int i=0;i<3;i++){
    80002fb0:	00000493          	li	s1,0
    80002fb4:	0380006f          	j	80002fec <_Z5nit2fPv+0x54>
		printString("\nNit 2 daje signal\n");
    80002fb8:	00003517          	auipc	a0,0x3
    80002fbc:	28050513          	addi	a0,a0,640 # 80006238 <CONSOLE_STATUS+0x228>
    80002fc0:	ffffe097          	auipc	ra,0xffffe
    80002fc4:	5d8080e7          	jalr	1496(ra) # 80001598 <_Z11printStringPKc>
		sem_signal(semA);
    80002fc8:	00004917          	auipc	s2,0x4
    80002fcc:	34093903          	ld	s2,832(s2) # 80007308 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002fd0:	00093503          	ld	a0,0(s2)
    80002fd4:	ffffe097          	auipc	ra,0xffffe
    80002fd8:	544080e7          	jalr	1348(ra) # 80001518 <_Z10sem_signalP4KSem>
		sem_close(semA);
    80002fdc:	00093503          	ld	a0,0(s2)
    80002fe0:	ffffe097          	auipc	ra,0xffffe
    80002fe4:	4d8080e7          	jalr	1240(ra) # 800014b8 <_Z9sem_closeP4KSem>
	for(int i=0;i<3;i++){
    80002fe8:	0014849b          	addiw	s1,s1,1
    80002fec:	00200793          	li	a5,2
    80002ff0:	fc97d4e3          	bge	a5,s1,80002fb8 <_Z5nit2fPv+0x20>
	}
	printString("\nGotova nit 2\n");
    80002ff4:	00003517          	auipc	a0,0x3
    80002ff8:	25c50513          	addi	a0,a0,604 # 80006250 <CONSOLE_STATUS+0x240>
    80002ffc:	ffffe097          	auipc	ra,0xffffe
    80003000:	59c080e7          	jalr	1436(ra) # 80001598 <_Z11printStringPKc>
}
    80003004:	01813083          	ld	ra,24(sp)
    80003008:	01013403          	ld	s0,16(sp)
    8000300c:	00813483          	ld	s1,8(sp)
    80003010:	00013903          	ld	s2,0(sp)
    80003014:	02010113          	addi	sp,sp,32
    80003018:	00008067          	ret

000000008000301c <_Z5nit3fPv>:


void nit3f(void*) {
    8000301c:	ff010113          	addi	sp,sp,-16
    80003020:	00113423          	sd	ra,8(sp)
    80003024:	00813023          	sd	s0,0(sp)
    80003028:	01010413          	addi	s0,sp,16
//		printString("\n");
//		sem_wait(semA);
//		printString("Nit 3 prosla semafor\n");
//		time_sleep(10);
//	}
	printString("\nGotova nit3\n");
    8000302c:	00003517          	auipc	a0,0x3
    80003030:	23450513          	addi	a0,a0,564 # 80006260 <CONSOLE_STATUS+0x250>
    80003034:	ffffe097          	auipc	ra,0xffffe
    80003038:	564080e7          	jalr	1380(ra) # 80001598 <_Z11printStringPKc>
    8000303c:	00813083          	ld	ra,8(sp)
    80003040:	00013403          	ld	s0,0(sp)
    80003044:	01010113          	addi	sp,sp,16
    80003048:	00008067          	ret

000000008000304c <start>:
    8000304c:	ff010113          	addi	sp,sp,-16
    80003050:	00813423          	sd	s0,8(sp)
    80003054:	01010413          	addi	s0,sp,16
    80003058:	300027f3          	csrr	a5,mstatus
    8000305c:	ffffe737          	lui	a4,0xffffe
    80003060:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff61af>
    80003064:	00e7f7b3          	and	a5,a5,a4
    80003068:	00001737          	lui	a4,0x1
    8000306c:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80003070:	00e7e7b3          	or	a5,a5,a4
    80003074:	30079073          	csrw	mstatus,a5
    80003078:	00000797          	auipc	a5,0x0
    8000307c:	16078793          	addi	a5,a5,352 # 800031d8 <system_main>
    80003080:	34179073          	csrw	mepc,a5
    80003084:	00000793          	li	a5,0
    80003088:	18079073          	csrw	satp,a5
    8000308c:	000107b7          	lui	a5,0x10
    80003090:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80003094:	30279073          	csrw	medeleg,a5
    80003098:	30379073          	csrw	mideleg,a5
    8000309c:	104027f3          	csrr	a5,sie
    800030a0:	2227e793          	ori	a5,a5,546
    800030a4:	10479073          	csrw	sie,a5
    800030a8:	fff00793          	li	a5,-1
    800030ac:	00a7d793          	srli	a5,a5,0xa
    800030b0:	3b079073          	csrw	pmpaddr0,a5
    800030b4:	00f00793          	li	a5,15
    800030b8:	3a079073          	csrw	pmpcfg0,a5
    800030bc:	f14027f3          	csrr	a5,mhartid
    800030c0:	0200c737          	lui	a4,0x200c
    800030c4:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800030c8:	0007869b          	sext.w	a3,a5
    800030cc:	00269713          	slli	a4,a3,0x2
    800030d0:	000f4637          	lui	a2,0xf4
    800030d4:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800030d8:	00d70733          	add	a4,a4,a3
    800030dc:	0037979b          	slliw	a5,a5,0x3
    800030e0:	020046b7          	lui	a3,0x2004
    800030e4:	00d787b3          	add	a5,a5,a3
    800030e8:	00c585b3          	add	a1,a1,a2
    800030ec:	00371693          	slli	a3,a4,0x3
    800030f0:	00004717          	auipc	a4,0x4
    800030f4:	30070713          	addi	a4,a4,768 # 800073f0 <timer_scratch>
    800030f8:	00b7b023          	sd	a1,0(a5)
    800030fc:	00d70733          	add	a4,a4,a3
    80003100:	00f73c23          	sd	a5,24(a4)
    80003104:	02c73023          	sd	a2,32(a4)
    80003108:	34071073          	csrw	mscratch,a4
    8000310c:	00000797          	auipc	a5,0x0
    80003110:	6e478793          	addi	a5,a5,1764 # 800037f0 <timervec>
    80003114:	30579073          	csrw	mtvec,a5
    80003118:	300027f3          	csrr	a5,mstatus
    8000311c:	0087e793          	ori	a5,a5,8
    80003120:	30079073          	csrw	mstatus,a5
    80003124:	304027f3          	csrr	a5,mie
    80003128:	0807e793          	ori	a5,a5,128
    8000312c:	30479073          	csrw	mie,a5
    80003130:	f14027f3          	csrr	a5,mhartid
    80003134:	0007879b          	sext.w	a5,a5
    80003138:	00078213          	mv	tp,a5
    8000313c:	30200073          	mret
    80003140:	00813403          	ld	s0,8(sp)
    80003144:	01010113          	addi	sp,sp,16
    80003148:	00008067          	ret

000000008000314c <timerinit>:
    8000314c:	ff010113          	addi	sp,sp,-16
    80003150:	00813423          	sd	s0,8(sp)
    80003154:	01010413          	addi	s0,sp,16
    80003158:	f14027f3          	csrr	a5,mhartid
    8000315c:	0200c737          	lui	a4,0x200c
    80003160:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003164:	0007869b          	sext.w	a3,a5
    80003168:	00269713          	slli	a4,a3,0x2
    8000316c:	000f4637          	lui	a2,0xf4
    80003170:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003174:	00d70733          	add	a4,a4,a3
    80003178:	0037979b          	slliw	a5,a5,0x3
    8000317c:	020046b7          	lui	a3,0x2004
    80003180:	00d787b3          	add	a5,a5,a3
    80003184:	00c585b3          	add	a1,a1,a2
    80003188:	00371693          	slli	a3,a4,0x3
    8000318c:	00004717          	auipc	a4,0x4
    80003190:	26470713          	addi	a4,a4,612 # 800073f0 <timer_scratch>
    80003194:	00b7b023          	sd	a1,0(a5)
    80003198:	00d70733          	add	a4,a4,a3
    8000319c:	00f73c23          	sd	a5,24(a4)
    800031a0:	02c73023          	sd	a2,32(a4)
    800031a4:	34071073          	csrw	mscratch,a4
    800031a8:	00000797          	auipc	a5,0x0
    800031ac:	64878793          	addi	a5,a5,1608 # 800037f0 <timervec>
    800031b0:	30579073          	csrw	mtvec,a5
    800031b4:	300027f3          	csrr	a5,mstatus
    800031b8:	0087e793          	ori	a5,a5,8
    800031bc:	30079073          	csrw	mstatus,a5
    800031c0:	304027f3          	csrr	a5,mie
    800031c4:	0807e793          	ori	a5,a5,128
    800031c8:	30479073          	csrw	mie,a5
    800031cc:	00813403          	ld	s0,8(sp)
    800031d0:	01010113          	addi	sp,sp,16
    800031d4:	00008067          	ret

00000000800031d8 <system_main>:
    800031d8:	fe010113          	addi	sp,sp,-32
    800031dc:	00813823          	sd	s0,16(sp)
    800031e0:	00913423          	sd	s1,8(sp)
    800031e4:	00113c23          	sd	ra,24(sp)
    800031e8:	02010413          	addi	s0,sp,32
    800031ec:	00000097          	auipc	ra,0x0
    800031f0:	0c4080e7          	jalr	196(ra) # 800032b0 <cpuid>
    800031f4:	00004497          	auipc	s1,0x4
    800031f8:	17c48493          	addi	s1,s1,380 # 80007370 <started>
    800031fc:	02050263          	beqz	a0,80003220 <system_main+0x48>
    80003200:	0004a783          	lw	a5,0(s1)
    80003204:	0007879b          	sext.w	a5,a5
    80003208:	fe078ce3          	beqz	a5,80003200 <system_main+0x28>
    8000320c:	0ff0000f          	fence
    80003210:	00003517          	auipc	a0,0x3
    80003214:	09050513          	addi	a0,a0,144 # 800062a0 <CONSOLE_STATUS+0x290>
    80003218:	00001097          	auipc	ra,0x1
    8000321c:	a74080e7          	jalr	-1420(ra) # 80003c8c <panic>
    80003220:	00001097          	auipc	ra,0x1
    80003224:	9c8080e7          	jalr	-1592(ra) # 80003be8 <consoleinit>
    80003228:	00001097          	auipc	ra,0x1
    8000322c:	154080e7          	jalr	340(ra) # 8000437c <printfinit>
    80003230:	00003517          	auipc	a0,0x3
    80003234:	15050513          	addi	a0,a0,336 # 80006380 <CONSOLE_STATUS+0x370>
    80003238:	00001097          	auipc	ra,0x1
    8000323c:	ab0080e7          	jalr	-1360(ra) # 80003ce8 <__printf>
    80003240:	00003517          	auipc	a0,0x3
    80003244:	03050513          	addi	a0,a0,48 # 80006270 <CONSOLE_STATUS+0x260>
    80003248:	00001097          	auipc	ra,0x1
    8000324c:	aa0080e7          	jalr	-1376(ra) # 80003ce8 <__printf>
    80003250:	00003517          	auipc	a0,0x3
    80003254:	13050513          	addi	a0,a0,304 # 80006380 <CONSOLE_STATUS+0x370>
    80003258:	00001097          	auipc	ra,0x1
    8000325c:	a90080e7          	jalr	-1392(ra) # 80003ce8 <__printf>
    80003260:	00001097          	auipc	ra,0x1
    80003264:	4a8080e7          	jalr	1192(ra) # 80004708 <kinit>
    80003268:	00000097          	auipc	ra,0x0
    8000326c:	148080e7          	jalr	328(ra) # 800033b0 <trapinit>
    80003270:	00000097          	auipc	ra,0x0
    80003274:	16c080e7          	jalr	364(ra) # 800033dc <trapinithart>
    80003278:	00000097          	auipc	ra,0x0
    8000327c:	5b8080e7          	jalr	1464(ra) # 80003830 <plicinit>
    80003280:	00000097          	auipc	ra,0x0
    80003284:	5d8080e7          	jalr	1496(ra) # 80003858 <plicinithart>
    80003288:	00000097          	auipc	ra,0x0
    8000328c:	078080e7          	jalr	120(ra) # 80003300 <userinit>
    80003290:	0ff0000f          	fence
    80003294:	00100793          	li	a5,1
    80003298:	00003517          	auipc	a0,0x3
    8000329c:	ff050513          	addi	a0,a0,-16 # 80006288 <CONSOLE_STATUS+0x278>
    800032a0:	00f4a023          	sw	a5,0(s1)
    800032a4:	00001097          	auipc	ra,0x1
    800032a8:	a44080e7          	jalr	-1468(ra) # 80003ce8 <__printf>
    800032ac:	0000006f          	j	800032ac <system_main+0xd4>

00000000800032b0 <cpuid>:
    800032b0:	ff010113          	addi	sp,sp,-16
    800032b4:	00813423          	sd	s0,8(sp)
    800032b8:	01010413          	addi	s0,sp,16
    800032bc:	00020513          	mv	a0,tp
    800032c0:	00813403          	ld	s0,8(sp)
    800032c4:	0005051b          	sext.w	a0,a0
    800032c8:	01010113          	addi	sp,sp,16
    800032cc:	00008067          	ret

00000000800032d0 <mycpu>:
    800032d0:	ff010113          	addi	sp,sp,-16
    800032d4:	00813423          	sd	s0,8(sp)
    800032d8:	01010413          	addi	s0,sp,16
    800032dc:	00020793          	mv	a5,tp
    800032e0:	00813403          	ld	s0,8(sp)
    800032e4:	0007879b          	sext.w	a5,a5
    800032e8:	00779793          	slli	a5,a5,0x7
    800032ec:	00005517          	auipc	a0,0x5
    800032f0:	13450513          	addi	a0,a0,308 # 80008420 <cpus>
    800032f4:	00f50533          	add	a0,a0,a5
    800032f8:	01010113          	addi	sp,sp,16
    800032fc:	00008067          	ret

0000000080003300 <userinit>:
    80003300:	ff010113          	addi	sp,sp,-16
    80003304:	00813423          	sd	s0,8(sp)
    80003308:	01010413          	addi	s0,sp,16
    8000330c:	00813403          	ld	s0,8(sp)
    80003310:	01010113          	addi	sp,sp,16
    80003314:	ffffe317          	auipc	t1,0xffffe
    80003318:	48030067          	jr	1152(t1) # 80001794 <main>

000000008000331c <either_copyout>:
    8000331c:	ff010113          	addi	sp,sp,-16
    80003320:	00813023          	sd	s0,0(sp)
    80003324:	00113423          	sd	ra,8(sp)
    80003328:	01010413          	addi	s0,sp,16
    8000332c:	02051663          	bnez	a0,80003358 <either_copyout+0x3c>
    80003330:	00058513          	mv	a0,a1
    80003334:	00060593          	mv	a1,a2
    80003338:	0006861b          	sext.w	a2,a3
    8000333c:	00002097          	auipc	ra,0x2
    80003340:	c58080e7          	jalr	-936(ra) # 80004f94 <__memmove>
    80003344:	00813083          	ld	ra,8(sp)
    80003348:	00013403          	ld	s0,0(sp)
    8000334c:	00000513          	li	a0,0
    80003350:	01010113          	addi	sp,sp,16
    80003354:	00008067          	ret
    80003358:	00003517          	auipc	a0,0x3
    8000335c:	f7050513          	addi	a0,a0,-144 # 800062c8 <CONSOLE_STATUS+0x2b8>
    80003360:	00001097          	auipc	ra,0x1
    80003364:	92c080e7          	jalr	-1748(ra) # 80003c8c <panic>

0000000080003368 <either_copyin>:
    80003368:	ff010113          	addi	sp,sp,-16
    8000336c:	00813023          	sd	s0,0(sp)
    80003370:	00113423          	sd	ra,8(sp)
    80003374:	01010413          	addi	s0,sp,16
    80003378:	02059463          	bnez	a1,800033a0 <either_copyin+0x38>
    8000337c:	00060593          	mv	a1,a2
    80003380:	0006861b          	sext.w	a2,a3
    80003384:	00002097          	auipc	ra,0x2
    80003388:	c10080e7          	jalr	-1008(ra) # 80004f94 <__memmove>
    8000338c:	00813083          	ld	ra,8(sp)
    80003390:	00013403          	ld	s0,0(sp)
    80003394:	00000513          	li	a0,0
    80003398:	01010113          	addi	sp,sp,16
    8000339c:	00008067          	ret
    800033a0:	00003517          	auipc	a0,0x3
    800033a4:	f5050513          	addi	a0,a0,-176 # 800062f0 <CONSOLE_STATUS+0x2e0>
    800033a8:	00001097          	auipc	ra,0x1
    800033ac:	8e4080e7          	jalr	-1820(ra) # 80003c8c <panic>

00000000800033b0 <trapinit>:
    800033b0:	ff010113          	addi	sp,sp,-16
    800033b4:	00813423          	sd	s0,8(sp)
    800033b8:	01010413          	addi	s0,sp,16
    800033bc:	00813403          	ld	s0,8(sp)
    800033c0:	00003597          	auipc	a1,0x3
    800033c4:	f5858593          	addi	a1,a1,-168 # 80006318 <CONSOLE_STATUS+0x308>
    800033c8:	00005517          	auipc	a0,0x5
    800033cc:	0d850513          	addi	a0,a0,216 # 800084a0 <tickslock>
    800033d0:	01010113          	addi	sp,sp,16
    800033d4:	00001317          	auipc	t1,0x1
    800033d8:	5c430067          	jr	1476(t1) # 80004998 <initlock>

00000000800033dc <trapinithart>:
    800033dc:	ff010113          	addi	sp,sp,-16
    800033e0:	00813423          	sd	s0,8(sp)
    800033e4:	01010413          	addi	s0,sp,16
    800033e8:	00000797          	auipc	a5,0x0
    800033ec:	2f878793          	addi	a5,a5,760 # 800036e0 <kernelvec>
    800033f0:	10579073          	csrw	stvec,a5
    800033f4:	00813403          	ld	s0,8(sp)
    800033f8:	01010113          	addi	sp,sp,16
    800033fc:	00008067          	ret

0000000080003400 <usertrap>:
    80003400:	ff010113          	addi	sp,sp,-16
    80003404:	00813423          	sd	s0,8(sp)
    80003408:	01010413          	addi	s0,sp,16
    8000340c:	00813403          	ld	s0,8(sp)
    80003410:	01010113          	addi	sp,sp,16
    80003414:	00008067          	ret

0000000080003418 <usertrapret>:
    80003418:	ff010113          	addi	sp,sp,-16
    8000341c:	00813423          	sd	s0,8(sp)
    80003420:	01010413          	addi	s0,sp,16
    80003424:	00813403          	ld	s0,8(sp)
    80003428:	01010113          	addi	sp,sp,16
    8000342c:	00008067          	ret

0000000080003430 <kerneltrap>:
    80003430:	fe010113          	addi	sp,sp,-32
    80003434:	00813823          	sd	s0,16(sp)
    80003438:	00113c23          	sd	ra,24(sp)
    8000343c:	00913423          	sd	s1,8(sp)
    80003440:	02010413          	addi	s0,sp,32
    80003444:	142025f3          	csrr	a1,scause
    80003448:	100027f3          	csrr	a5,sstatus
    8000344c:	0027f793          	andi	a5,a5,2
    80003450:	10079c63          	bnez	a5,80003568 <kerneltrap+0x138>
    80003454:	142027f3          	csrr	a5,scause
    80003458:	0207ce63          	bltz	a5,80003494 <kerneltrap+0x64>
    8000345c:	00003517          	auipc	a0,0x3
    80003460:	f0450513          	addi	a0,a0,-252 # 80006360 <CONSOLE_STATUS+0x350>
    80003464:	00001097          	auipc	ra,0x1
    80003468:	884080e7          	jalr	-1916(ra) # 80003ce8 <__printf>
    8000346c:	141025f3          	csrr	a1,sepc
    80003470:	14302673          	csrr	a2,stval
    80003474:	00003517          	auipc	a0,0x3
    80003478:	efc50513          	addi	a0,a0,-260 # 80006370 <CONSOLE_STATUS+0x360>
    8000347c:	00001097          	auipc	ra,0x1
    80003480:	86c080e7          	jalr	-1940(ra) # 80003ce8 <__printf>
    80003484:	00003517          	auipc	a0,0x3
    80003488:	f0450513          	addi	a0,a0,-252 # 80006388 <CONSOLE_STATUS+0x378>
    8000348c:	00001097          	auipc	ra,0x1
    80003490:	800080e7          	jalr	-2048(ra) # 80003c8c <panic>
    80003494:	0ff7f713          	andi	a4,a5,255
    80003498:	00900693          	li	a3,9
    8000349c:	04d70063          	beq	a4,a3,800034dc <kerneltrap+0xac>
    800034a0:	fff00713          	li	a4,-1
    800034a4:	03f71713          	slli	a4,a4,0x3f
    800034a8:	00170713          	addi	a4,a4,1
    800034ac:	fae798e3          	bne	a5,a4,8000345c <kerneltrap+0x2c>
    800034b0:	00000097          	auipc	ra,0x0
    800034b4:	e00080e7          	jalr	-512(ra) # 800032b0 <cpuid>
    800034b8:	06050663          	beqz	a0,80003524 <kerneltrap+0xf4>
    800034bc:	144027f3          	csrr	a5,sip
    800034c0:	ffd7f793          	andi	a5,a5,-3
    800034c4:	14479073          	csrw	sip,a5
    800034c8:	01813083          	ld	ra,24(sp)
    800034cc:	01013403          	ld	s0,16(sp)
    800034d0:	00813483          	ld	s1,8(sp)
    800034d4:	02010113          	addi	sp,sp,32
    800034d8:	00008067          	ret
    800034dc:	00000097          	auipc	ra,0x0
    800034e0:	3c8080e7          	jalr	968(ra) # 800038a4 <plic_claim>
    800034e4:	00a00793          	li	a5,10
    800034e8:	00050493          	mv	s1,a0
    800034ec:	06f50863          	beq	a0,a5,8000355c <kerneltrap+0x12c>
    800034f0:	fc050ce3          	beqz	a0,800034c8 <kerneltrap+0x98>
    800034f4:	00050593          	mv	a1,a0
    800034f8:	00003517          	auipc	a0,0x3
    800034fc:	e4850513          	addi	a0,a0,-440 # 80006340 <CONSOLE_STATUS+0x330>
    80003500:	00000097          	auipc	ra,0x0
    80003504:	7e8080e7          	jalr	2024(ra) # 80003ce8 <__printf>
    80003508:	01013403          	ld	s0,16(sp)
    8000350c:	01813083          	ld	ra,24(sp)
    80003510:	00048513          	mv	a0,s1
    80003514:	00813483          	ld	s1,8(sp)
    80003518:	02010113          	addi	sp,sp,32
    8000351c:	00000317          	auipc	t1,0x0
    80003520:	3c030067          	jr	960(t1) # 800038dc <plic_complete>
    80003524:	00005517          	auipc	a0,0x5
    80003528:	f7c50513          	addi	a0,a0,-132 # 800084a0 <tickslock>
    8000352c:	00001097          	auipc	ra,0x1
    80003530:	490080e7          	jalr	1168(ra) # 800049bc <acquire>
    80003534:	00004717          	auipc	a4,0x4
    80003538:	e4070713          	addi	a4,a4,-448 # 80007374 <ticks>
    8000353c:	00072783          	lw	a5,0(a4)
    80003540:	00005517          	auipc	a0,0x5
    80003544:	f6050513          	addi	a0,a0,-160 # 800084a0 <tickslock>
    80003548:	0017879b          	addiw	a5,a5,1
    8000354c:	00f72023          	sw	a5,0(a4)
    80003550:	00001097          	auipc	ra,0x1
    80003554:	538080e7          	jalr	1336(ra) # 80004a88 <release>
    80003558:	f65ff06f          	j	800034bc <kerneltrap+0x8c>
    8000355c:	00001097          	auipc	ra,0x1
    80003560:	094080e7          	jalr	148(ra) # 800045f0 <uartintr>
    80003564:	fa5ff06f          	j	80003508 <kerneltrap+0xd8>
    80003568:	00003517          	auipc	a0,0x3
    8000356c:	db850513          	addi	a0,a0,-584 # 80006320 <CONSOLE_STATUS+0x310>
    80003570:	00000097          	auipc	ra,0x0
    80003574:	71c080e7          	jalr	1820(ra) # 80003c8c <panic>

0000000080003578 <clockintr>:
    80003578:	fe010113          	addi	sp,sp,-32
    8000357c:	00813823          	sd	s0,16(sp)
    80003580:	00913423          	sd	s1,8(sp)
    80003584:	00113c23          	sd	ra,24(sp)
    80003588:	02010413          	addi	s0,sp,32
    8000358c:	00005497          	auipc	s1,0x5
    80003590:	f1448493          	addi	s1,s1,-236 # 800084a0 <tickslock>
    80003594:	00048513          	mv	a0,s1
    80003598:	00001097          	auipc	ra,0x1
    8000359c:	424080e7          	jalr	1060(ra) # 800049bc <acquire>
    800035a0:	00004717          	auipc	a4,0x4
    800035a4:	dd470713          	addi	a4,a4,-556 # 80007374 <ticks>
    800035a8:	00072783          	lw	a5,0(a4)
    800035ac:	01013403          	ld	s0,16(sp)
    800035b0:	01813083          	ld	ra,24(sp)
    800035b4:	00048513          	mv	a0,s1
    800035b8:	0017879b          	addiw	a5,a5,1
    800035bc:	00813483          	ld	s1,8(sp)
    800035c0:	00f72023          	sw	a5,0(a4)
    800035c4:	02010113          	addi	sp,sp,32
    800035c8:	00001317          	auipc	t1,0x1
    800035cc:	4c030067          	jr	1216(t1) # 80004a88 <release>

00000000800035d0 <devintr>:
    800035d0:	142027f3          	csrr	a5,scause
    800035d4:	00000513          	li	a0,0
    800035d8:	0007c463          	bltz	a5,800035e0 <devintr+0x10>
    800035dc:	00008067          	ret
    800035e0:	fe010113          	addi	sp,sp,-32
    800035e4:	00813823          	sd	s0,16(sp)
    800035e8:	00113c23          	sd	ra,24(sp)
    800035ec:	00913423          	sd	s1,8(sp)
    800035f0:	02010413          	addi	s0,sp,32
    800035f4:	0ff7f713          	andi	a4,a5,255
    800035f8:	00900693          	li	a3,9
    800035fc:	04d70c63          	beq	a4,a3,80003654 <devintr+0x84>
    80003600:	fff00713          	li	a4,-1
    80003604:	03f71713          	slli	a4,a4,0x3f
    80003608:	00170713          	addi	a4,a4,1
    8000360c:	00e78c63          	beq	a5,a4,80003624 <devintr+0x54>
    80003610:	01813083          	ld	ra,24(sp)
    80003614:	01013403          	ld	s0,16(sp)
    80003618:	00813483          	ld	s1,8(sp)
    8000361c:	02010113          	addi	sp,sp,32
    80003620:	00008067          	ret
    80003624:	00000097          	auipc	ra,0x0
    80003628:	c8c080e7          	jalr	-884(ra) # 800032b0 <cpuid>
    8000362c:	06050663          	beqz	a0,80003698 <devintr+0xc8>
    80003630:	144027f3          	csrr	a5,sip
    80003634:	ffd7f793          	andi	a5,a5,-3
    80003638:	14479073          	csrw	sip,a5
    8000363c:	01813083          	ld	ra,24(sp)
    80003640:	01013403          	ld	s0,16(sp)
    80003644:	00813483          	ld	s1,8(sp)
    80003648:	00200513          	li	a0,2
    8000364c:	02010113          	addi	sp,sp,32
    80003650:	00008067          	ret
    80003654:	00000097          	auipc	ra,0x0
    80003658:	250080e7          	jalr	592(ra) # 800038a4 <plic_claim>
    8000365c:	00a00793          	li	a5,10
    80003660:	00050493          	mv	s1,a0
    80003664:	06f50663          	beq	a0,a5,800036d0 <devintr+0x100>
    80003668:	00100513          	li	a0,1
    8000366c:	fa0482e3          	beqz	s1,80003610 <devintr+0x40>
    80003670:	00048593          	mv	a1,s1
    80003674:	00003517          	auipc	a0,0x3
    80003678:	ccc50513          	addi	a0,a0,-820 # 80006340 <CONSOLE_STATUS+0x330>
    8000367c:	00000097          	auipc	ra,0x0
    80003680:	66c080e7          	jalr	1644(ra) # 80003ce8 <__printf>
    80003684:	00048513          	mv	a0,s1
    80003688:	00000097          	auipc	ra,0x0
    8000368c:	254080e7          	jalr	596(ra) # 800038dc <plic_complete>
    80003690:	00100513          	li	a0,1
    80003694:	f7dff06f          	j	80003610 <devintr+0x40>
    80003698:	00005517          	auipc	a0,0x5
    8000369c:	e0850513          	addi	a0,a0,-504 # 800084a0 <tickslock>
    800036a0:	00001097          	auipc	ra,0x1
    800036a4:	31c080e7          	jalr	796(ra) # 800049bc <acquire>
    800036a8:	00004717          	auipc	a4,0x4
    800036ac:	ccc70713          	addi	a4,a4,-820 # 80007374 <ticks>
    800036b0:	00072783          	lw	a5,0(a4)
    800036b4:	00005517          	auipc	a0,0x5
    800036b8:	dec50513          	addi	a0,a0,-532 # 800084a0 <tickslock>
    800036bc:	0017879b          	addiw	a5,a5,1
    800036c0:	00f72023          	sw	a5,0(a4)
    800036c4:	00001097          	auipc	ra,0x1
    800036c8:	3c4080e7          	jalr	964(ra) # 80004a88 <release>
    800036cc:	f65ff06f          	j	80003630 <devintr+0x60>
    800036d0:	00001097          	auipc	ra,0x1
    800036d4:	f20080e7          	jalr	-224(ra) # 800045f0 <uartintr>
    800036d8:	fadff06f          	j	80003684 <devintr+0xb4>
    800036dc:	0000                	unimp
	...

00000000800036e0 <kernelvec>:
    800036e0:	f0010113          	addi	sp,sp,-256
    800036e4:	00113023          	sd	ra,0(sp)
    800036e8:	00213423          	sd	sp,8(sp)
    800036ec:	00313823          	sd	gp,16(sp)
    800036f0:	00413c23          	sd	tp,24(sp)
    800036f4:	02513023          	sd	t0,32(sp)
    800036f8:	02613423          	sd	t1,40(sp)
    800036fc:	02713823          	sd	t2,48(sp)
    80003700:	02813c23          	sd	s0,56(sp)
    80003704:	04913023          	sd	s1,64(sp)
    80003708:	04a13423          	sd	a0,72(sp)
    8000370c:	04b13823          	sd	a1,80(sp)
    80003710:	04c13c23          	sd	a2,88(sp)
    80003714:	06d13023          	sd	a3,96(sp)
    80003718:	06e13423          	sd	a4,104(sp)
    8000371c:	06f13823          	sd	a5,112(sp)
    80003720:	07013c23          	sd	a6,120(sp)
    80003724:	09113023          	sd	a7,128(sp)
    80003728:	09213423          	sd	s2,136(sp)
    8000372c:	09313823          	sd	s3,144(sp)
    80003730:	09413c23          	sd	s4,152(sp)
    80003734:	0b513023          	sd	s5,160(sp)
    80003738:	0b613423          	sd	s6,168(sp)
    8000373c:	0b713823          	sd	s7,176(sp)
    80003740:	0b813c23          	sd	s8,184(sp)
    80003744:	0d913023          	sd	s9,192(sp)
    80003748:	0da13423          	sd	s10,200(sp)
    8000374c:	0db13823          	sd	s11,208(sp)
    80003750:	0dc13c23          	sd	t3,216(sp)
    80003754:	0fd13023          	sd	t4,224(sp)
    80003758:	0fe13423          	sd	t5,232(sp)
    8000375c:	0ff13823          	sd	t6,240(sp)
    80003760:	cd1ff0ef          	jal	ra,80003430 <kerneltrap>
    80003764:	00013083          	ld	ra,0(sp)
    80003768:	00813103          	ld	sp,8(sp)
    8000376c:	01013183          	ld	gp,16(sp)
    80003770:	02013283          	ld	t0,32(sp)
    80003774:	02813303          	ld	t1,40(sp)
    80003778:	03013383          	ld	t2,48(sp)
    8000377c:	03813403          	ld	s0,56(sp)
    80003780:	04013483          	ld	s1,64(sp)
    80003784:	04813503          	ld	a0,72(sp)
    80003788:	05013583          	ld	a1,80(sp)
    8000378c:	05813603          	ld	a2,88(sp)
    80003790:	06013683          	ld	a3,96(sp)
    80003794:	06813703          	ld	a4,104(sp)
    80003798:	07013783          	ld	a5,112(sp)
    8000379c:	07813803          	ld	a6,120(sp)
    800037a0:	08013883          	ld	a7,128(sp)
    800037a4:	08813903          	ld	s2,136(sp)
    800037a8:	09013983          	ld	s3,144(sp)
    800037ac:	09813a03          	ld	s4,152(sp)
    800037b0:	0a013a83          	ld	s5,160(sp)
    800037b4:	0a813b03          	ld	s6,168(sp)
    800037b8:	0b013b83          	ld	s7,176(sp)
    800037bc:	0b813c03          	ld	s8,184(sp)
    800037c0:	0c013c83          	ld	s9,192(sp)
    800037c4:	0c813d03          	ld	s10,200(sp)
    800037c8:	0d013d83          	ld	s11,208(sp)
    800037cc:	0d813e03          	ld	t3,216(sp)
    800037d0:	0e013e83          	ld	t4,224(sp)
    800037d4:	0e813f03          	ld	t5,232(sp)
    800037d8:	0f013f83          	ld	t6,240(sp)
    800037dc:	10010113          	addi	sp,sp,256
    800037e0:	10200073          	sret
    800037e4:	00000013          	nop
    800037e8:	00000013          	nop
    800037ec:	00000013          	nop

00000000800037f0 <timervec>:
    800037f0:	34051573          	csrrw	a0,mscratch,a0
    800037f4:	00b53023          	sd	a1,0(a0)
    800037f8:	00c53423          	sd	a2,8(a0)
    800037fc:	00d53823          	sd	a3,16(a0)
    80003800:	01853583          	ld	a1,24(a0)
    80003804:	02053603          	ld	a2,32(a0)
    80003808:	0005b683          	ld	a3,0(a1)
    8000380c:	00c686b3          	add	a3,a3,a2
    80003810:	00d5b023          	sd	a3,0(a1)
    80003814:	00200593          	li	a1,2
    80003818:	14459073          	csrw	sip,a1
    8000381c:	01053683          	ld	a3,16(a0)
    80003820:	00853603          	ld	a2,8(a0)
    80003824:	00053583          	ld	a1,0(a0)
    80003828:	34051573          	csrrw	a0,mscratch,a0
    8000382c:	30200073          	mret

0000000080003830 <plicinit>:
    80003830:	ff010113          	addi	sp,sp,-16
    80003834:	00813423          	sd	s0,8(sp)
    80003838:	01010413          	addi	s0,sp,16
    8000383c:	00813403          	ld	s0,8(sp)
    80003840:	0c0007b7          	lui	a5,0xc000
    80003844:	00100713          	li	a4,1
    80003848:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000384c:	00e7a223          	sw	a4,4(a5)
    80003850:	01010113          	addi	sp,sp,16
    80003854:	00008067          	ret

0000000080003858 <plicinithart>:
    80003858:	ff010113          	addi	sp,sp,-16
    8000385c:	00813023          	sd	s0,0(sp)
    80003860:	00113423          	sd	ra,8(sp)
    80003864:	01010413          	addi	s0,sp,16
    80003868:	00000097          	auipc	ra,0x0
    8000386c:	a48080e7          	jalr	-1464(ra) # 800032b0 <cpuid>
    80003870:	0085171b          	slliw	a4,a0,0x8
    80003874:	0c0027b7          	lui	a5,0xc002
    80003878:	00e787b3          	add	a5,a5,a4
    8000387c:	40200713          	li	a4,1026
    80003880:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80003884:	00813083          	ld	ra,8(sp)
    80003888:	00013403          	ld	s0,0(sp)
    8000388c:	00d5151b          	slliw	a0,a0,0xd
    80003890:	0c2017b7          	lui	a5,0xc201
    80003894:	00a78533          	add	a0,a5,a0
    80003898:	00052023          	sw	zero,0(a0)
    8000389c:	01010113          	addi	sp,sp,16
    800038a0:	00008067          	ret

00000000800038a4 <plic_claim>:
    800038a4:	ff010113          	addi	sp,sp,-16
    800038a8:	00813023          	sd	s0,0(sp)
    800038ac:	00113423          	sd	ra,8(sp)
    800038b0:	01010413          	addi	s0,sp,16
    800038b4:	00000097          	auipc	ra,0x0
    800038b8:	9fc080e7          	jalr	-1540(ra) # 800032b0 <cpuid>
    800038bc:	00813083          	ld	ra,8(sp)
    800038c0:	00013403          	ld	s0,0(sp)
    800038c4:	00d5151b          	slliw	a0,a0,0xd
    800038c8:	0c2017b7          	lui	a5,0xc201
    800038cc:	00a78533          	add	a0,a5,a0
    800038d0:	00452503          	lw	a0,4(a0)
    800038d4:	01010113          	addi	sp,sp,16
    800038d8:	00008067          	ret

00000000800038dc <plic_complete>:
    800038dc:	fe010113          	addi	sp,sp,-32
    800038e0:	00813823          	sd	s0,16(sp)
    800038e4:	00913423          	sd	s1,8(sp)
    800038e8:	00113c23          	sd	ra,24(sp)
    800038ec:	02010413          	addi	s0,sp,32
    800038f0:	00050493          	mv	s1,a0
    800038f4:	00000097          	auipc	ra,0x0
    800038f8:	9bc080e7          	jalr	-1604(ra) # 800032b0 <cpuid>
    800038fc:	01813083          	ld	ra,24(sp)
    80003900:	01013403          	ld	s0,16(sp)
    80003904:	00d5179b          	slliw	a5,a0,0xd
    80003908:	0c201737          	lui	a4,0xc201
    8000390c:	00f707b3          	add	a5,a4,a5
    80003910:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80003914:	00813483          	ld	s1,8(sp)
    80003918:	02010113          	addi	sp,sp,32
    8000391c:	00008067          	ret

0000000080003920 <consolewrite>:
    80003920:	fb010113          	addi	sp,sp,-80
    80003924:	04813023          	sd	s0,64(sp)
    80003928:	04113423          	sd	ra,72(sp)
    8000392c:	02913c23          	sd	s1,56(sp)
    80003930:	03213823          	sd	s2,48(sp)
    80003934:	03313423          	sd	s3,40(sp)
    80003938:	03413023          	sd	s4,32(sp)
    8000393c:	01513c23          	sd	s5,24(sp)
    80003940:	05010413          	addi	s0,sp,80
    80003944:	06c05c63          	blez	a2,800039bc <consolewrite+0x9c>
    80003948:	00060993          	mv	s3,a2
    8000394c:	00050a13          	mv	s4,a0
    80003950:	00058493          	mv	s1,a1
    80003954:	00000913          	li	s2,0
    80003958:	fff00a93          	li	s5,-1
    8000395c:	01c0006f          	j	80003978 <consolewrite+0x58>
    80003960:	fbf44503          	lbu	a0,-65(s0)
    80003964:	0019091b          	addiw	s2,s2,1
    80003968:	00148493          	addi	s1,s1,1
    8000396c:	00001097          	auipc	ra,0x1
    80003970:	a9c080e7          	jalr	-1380(ra) # 80004408 <uartputc>
    80003974:	03298063          	beq	s3,s2,80003994 <consolewrite+0x74>
    80003978:	00048613          	mv	a2,s1
    8000397c:	00100693          	li	a3,1
    80003980:	000a0593          	mv	a1,s4
    80003984:	fbf40513          	addi	a0,s0,-65
    80003988:	00000097          	auipc	ra,0x0
    8000398c:	9e0080e7          	jalr	-1568(ra) # 80003368 <either_copyin>
    80003990:	fd5518e3          	bne	a0,s5,80003960 <consolewrite+0x40>
    80003994:	04813083          	ld	ra,72(sp)
    80003998:	04013403          	ld	s0,64(sp)
    8000399c:	03813483          	ld	s1,56(sp)
    800039a0:	02813983          	ld	s3,40(sp)
    800039a4:	02013a03          	ld	s4,32(sp)
    800039a8:	01813a83          	ld	s5,24(sp)
    800039ac:	00090513          	mv	a0,s2
    800039b0:	03013903          	ld	s2,48(sp)
    800039b4:	05010113          	addi	sp,sp,80
    800039b8:	00008067          	ret
    800039bc:	00000913          	li	s2,0
    800039c0:	fd5ff06f          	j	80003994 <consolewrite+0x74>

00000000800039c4 <consoleread>:
    800039c4:	f9010113          	addi	sp,sp,-112
    800039c8:	06813023          	sd	s0,96(sp)
    800039cc:	04913c23          	sd	s1,88(sp)
    800039d0:	05213823          	sd	s2,80(sp)
    800039d4:	05313423          	sd	s3,72(sp)
    800039d8:	05413023          	sd	s4,64(sp)
    800039dc:	03513c23          	sd	s5,56(sp)
    800039e0:	03613823          	sd	s6,48(sp)
    800039e4:	03713423          	sd	s7,40(sp)
    800039e8:	03813023          	sd	s8,32(sp)
    800039ec:	06113423          	sd	ra,104(sp)
    800039f0:	01913c23          	sd	s9,24(sp)
    800039f4:	07010413          	addi	s0,sp,112
    800039f8:	00060b93          	mv	s7,a2
    800039fc:	00050913          	mv	s2,a0
    80003a00:	00058c13          	mv	s8,a1
    80003a04:	00060b1b          	sext.w	s6,a2
    80003a08:	00005497          	auipc	s1,0x5
    80003a0c:	ac048493          	addi	s1,s1,-1344 # 800084c8 <cons>
    80003a10:	00400993          	li	s3,4
    80003a14:	fff00a13          	li	s4,-1
    80003a18:	00a00a93          	li	s5,10
    80003a1c:	05705e63          	blez	s7,80003a78 <consoleread+0xb4>
    80003a20:	09c4a703          	lw	a4,156(s1)
    80003a24:	0984a783          	lw	a5,152(s1)
    80003a28:	0007071b          	sext.w	a4,a4
    80003a2c:	08e78463          	beq	a5,a4,80003ab4 <consoleread+0xf0>
    80003a30:	07f7f713          	andi	a4,a5,127
    80003a34:	00e48733          	add	a4,s1,a4
    80003a38:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80003a3c:	0017869b          	addiw	a3,a5,1
    80003a40:	08d4ac23          	sw	a3,152(s1)
    80003a44:	00070c9b          	sext.w	s9,a4
    80003a48:	0b370663          	beq	a4,s3,80003af4 <consoleread+0x130>
    80003a4c:	00100693          	li	a3,1
    80003a50:	f9f40613          	addi	a2,s0,-97
    80003a54:	000c0593          	mv	a1,s8
    80003a58:	00090513          	mv	a0,s2
    80003a5c:	f8e40fa3          	sb	a4,-97(s0)
    80003a60:	00000097          	auipc	ra,0x0
    80003a64:	8bc080e7          	jalr	-1860(ra) # 8000331c <either_copyout>
    80003a68:	01450863          	beq	a0,s4,80003a78 <consoleread+0xb4>
    80003a6c:	001c0c13          	addi	s8,s8,1
    80003a70:	fffb8b9b          	addiw	s7,s7,-1
    80003a74:	fb5c94e3          	bne	s9,s5,80003a1c <consoleread+0x58>
    80003a78:	000b851b          	sext.w	a0,s7
    80003a7c:	06813083          	ld	ra,104(sp)
    80003a80:	06013403          	ld	s0,96(sp)
    80003a84:	05813483          	ld	s1,88(sp)
    80003a88:	05013903          	ld	s2,80(sp)
    80003a8c:	04813983          	ld	s3,72(sp)
    80003a90:	04013a03          	ld	s4,64(sp)
    80003a94:	03813a83          	ld	s5,56(sp)
    80003a98:	02813b83          	ld	s7,40(sp)
    80003a9c:	02013c03          	ld	s8,32(sp)
    80003aa0:	01813c83          	ld	s9,24(sp)
    80003aa4:	40ab053b          	subw	a0,s6,a0
    80003aa8:	03013b03          	ld	s6,48(sp)
    80003aac:	07010113          	addi	sp,sp,112
    80003ab0:	00008067          	ret
    80003ab4:	00001097          	auipc	ra,0x1
    80003ab8:	1d8080e7          	jalr	472(ra) # 80004c8c <push_on>
    80003abc:	0984a703          	lw	a4,152(s1)
    80003ac0:	09c4a783          	lw	a5,156(s1)
    80003ac4:	0007879b          	sext.w	a5,a5
    80003ac8:	fef70ce3          	beq	a4,a5,80003ac0 <consoleread+0xfc>
    80003acc:	00001097          	auipc	ra,0x1
    80003ad0:	234080e7          	jalr	564(ra) # 80004d00 <pop_on>
    80003ad4:	0984a783          	lw	a5,152(s1)
    80003ad8:	07f7f713          	andi	a4,a5,127
    80003adc:	00e48733          	add	a4,s1,a4
    80003ae0:	01874703          	lbu	a4,24(a4)
    80003ae4:	0017869b          	addiw	a3,a5,1
    80003ae8:	08d4ac23          	sw	a3,152(s1)
    80003aec:	00070c9b          	sext.w	s9,a4
    80003af0:	f5371ee3          	bne	a4,s3,80003a4c <consoleread+0x88>
    80003af4:	000b851b          	sext.w	a0,s7
    80003af8:	f96bf2e3          	bgeu	s7,s6,80003a7c <consoleread+0xb8>
    80003afc:	08f4ac23          	sw	a5,152(s1)
    80003b00:	f7dff06f          	j	80003a7c <consoleread+0xb8>

0000000080003b04 <consputc>:
    80003b04:	10000793          	li	a5,256
    80003b08:	00f50663          	beq	a0,a5,80003b14 <consputc+0x10>
    80003b0c:	00001317          	auipc	t1,0x1
    80003b10:	9f430067          	jr	-1548(t1) # 80004500 <uartputc_sync>
    80003b14:	ff010113          	addi	sp,sp,-16
    80003b18:	00113423          	sd	ra,8(sp)
    80003b1c:	00813023          	sd	s0,0(sp)
    80003b20:	01010413          	addi	s0,sp,16
    80003b24:	00800513          	li	a0,8
    80003b28:	00001097          	auipc	ra,0x1
    80003b2c:	9d8080e7          	jalr	-1576(ra) # 80004500 <uartputc_sync>
    80003b30:	02000513          	li	a0,32
    80003b34:	00001097          	auipc	ra,0x1
    80003b38:	9cc080e7          	jalr	-1588(ra) # 80004500 <uartputc_sync>
    80003b3c:	00013403          	ld	s0,0(sp)
    80003b40:	00813083          	ld	ra,8(sp)
    80003b44:	00800513          	li	a0,8
    80003b48:	01010113          	addi	sp,sp,16
    80003b4c:	00001317          	auipc	t1,0x1
    80003b50:	9b430067          	jr	-1612(t1) # 80004500 <uartputc_sync>

0000000080003b54 <consoleintr>:
    80003b54:	fe010113          	addi	sp,sp,-32
    80003b58:	00813823          	sd	s0,16(sp)
    80003b5c:	00913423          	sd	s1,8(sp)
    80003b60:	01213023          	sd	s2,0(sp)
    80003b64:	00113c23          	sd	ra,24(sp)
    80003b68:	02010413          	addi	s0,sp,32
    80003b6c:	00005917          	auipc	s2,0x5
    80003b70:	95c90913          	addi	s2,s2,-1700 # 800084c8 <cons>
    80003b74:	00050493          	mv	s1,a0
    80003b78:	00090513          	mv	a0,s2
    80003b7c:	00001097          	auipc	ra,0x1
    80003b80:	e40080e7          	jalr	-448(ra) # 800049bc <acquire>
    80003b84:	02048c63          	beqz	s1,80003bbc <consoleintr+0x68>
    80003b88:	0a092783          	lw	a5,160(s2)
    80003b8c:	09892703          	lw	a4,152(s2)
    80003b90:	07f00693          	li	a3,127
    80003b94:	40e7873b          	subw	a4,a5,a4
    80003b98:	02e6e263          	bltu	a3,a4,80003bbc <consoleintr+0x68>
    80003b9c:	00d00713          	li	a4,13
    80003ba0:	04e48063          	beq	s1,a4,80003be0 <consoleintr+0x8c>
    80003ba4:	07f7f713          	andi	a4,a5,127
    80003ba8:	00e90733          	add	a4,s2,a4
    80003bac:	0017879b          	addiw	a5,a5,1
    80003bb0:	0af92023          	sw	a5,160(s2)
    80003bb4:	00970c23          	sb	s1,24(a4)
    80003bb8:	08f92e23          	sw	a5,156(s2)
    80003bbc:	01013403          	ld	s0,16(sp)
    80003bc0:	01813083          	ld	ra,24(sp)
    80003bc4:	00813483          	ld	s1,8(sp)
    80003bc8:	00013903          	ld	s2,0(sp)
    80003bcc:	00005517          	auipc	a0,0x5
    80003bd0:	8fc50513          	addi	a0,a0,-1796 # 800084c8 <cons>
    80003bd4:	02010113          	addi	sp,sp,32
    80003bd8:	00001317          	auipc	t1,0x1
    80003bdc:	eb030067          	jr	-336(t1) # 80004a88 <release>
    80003be0:	00a00493          	li	s1,10
    80003be4:	fc1ff06f          	j	80003ba4 <consoleintr+0x50>

0000000080003be8 <consoleinit>:
    80003be8:	fe010113          	addi	sp,sp,-32
    80003bec:	00113c23          	sd	ra,24(sp)
    80003bf0:	00813823          	sd	s0,16(sp)
    80003bf4:	00913423          	sd	s1,8(sp)
    80003bf8:	02010413          	addi	s0,sp,32
    80003bfc:	00005497          	auipc	s1,0x5
    80003c00:	8cc48493          	addi	s1,s1,-1844 # 800084c8 <cons>
    80003c04:	00048513          	mv	a0,s1
    80003c08:	00002597          	auipc	a1,0x2
    80003c0c:	79058593          	addi	a1,a1,1936 # 80006398 <CONSOLE_STATUS+0x388>
    80003c10:	00001097          	auipc	ra,0x1
    80003c14:	d88080e7          	jalr	-632(ra) # 80004998 <initlock>
    80003c18:	00000097          	auipc	ra,0x0
    80003c1c:	7ac080e7          	jalr	1964(ra) # 800043c4 <uartinit>
    80003c20:	01813083          	ld	ra,24(sp)
    80003c24:	01013403          	ld	s0,16(sp)
    80003c28:	00000797          	auipc	a5,0x0
    80003c2c:	d9c78793          	addi	a5,a5,-612 # 800039c4 <consoleread>
    80003c30:	0af4bc23          	sd	a5,184(s1)
    80003c34:	00000797          	auipc	a5,0x0
    80003c38:	cec78793          	addi	a5,a5,-788 # 80003920 <consolewrite>
    80003c3c:	0cf4b023          	sd	a5,192(s1)
    80003c40:	00813483          	ld	s1,8(sp)
    80003c44:	02010113          	addi	sp,sp,32
    80003c48:	00008067          	ret

0000000080003c4c <console_read>:
    80003c4c:	ff010113          	addi	sp,sp,-16
    80003c50:	00813423          	sd	s0,8(sp)
    80003c54:	01010413          	addi	s0,sp,16
    80003c58:	00813403          	ld	s0,8(sp)
    80003c5c:	00005317          	auipc	t1,0x5
    80003c60:	92433303          	ld	t1,-1756(t1) # 80008580 <devsw+0x10>
    80003c64:	01010113          	addi	sp,sp,16
    80003c68:	00030067          	jr	t1

0000000080003c6c <console_write>:
    80003c6c:	ff010113          	addi	sp,sp,-16
    80003c70:	00813423          	sd	s0,8(sp)
    80003c74:	01010413          	addi	s0,sp,16
    80003c78:	00813403          	ld	s0,8(sp)
    80003c7c:	00005317          	auipc	t1,0x5
    80003c80:	90c33303          	ld	t1,-1780(t1) # 80008588 <devsw+0x18>
    80003c84:	01010113          	addi	sp,sp,16
    80003c88:	00030067          	jr	t1

0000000080003c8c <panic>:
    80003c8c:	fe010113          	addi	sp,sp,-32
    80003c90:	00113c23          	sd	ra,24(sp)
    80003c94:	00813823          	sd	s0,16(sp)
    80003c98:	00913423          	sd	s1,8(sp)
    80003c9c:	02010413          	addi	s0,sp,32
    80003ca0:	00050493          	mv	s1,a0
    80003ca4:	00002517          	auipc	a0,0x2
    80003ca8:	6fc50513          	addi	a0,a0,1788 # 800063a0 <CONSOLE_STATUS+0x390>
    80003cac:	00005797          	auipc	a5,0x5
    80003cb0:	9607ae23          	sw	zero,-1668(a5) # 80008628 <pr+0x18>
    80003cb4:	00000097          	auipc	ra,0x0
    80003cb8:	034080e7          	jalr	52(ra) # 80003ce8 <__printf>
    80003cbc:	00048513          	mv	a0,s1
    80003cc0:	00000097          	auipc	ra,0x0
    80003cc4:	028080e7          	jalr	40(ra) # 80003ce8 <__printf>
    80003cc8:	00002517          	auipc	a0,0x2
    80003ccc:	6b850513          	addi	a0,a0,1720 # 80006380 <CONSOLE_STATUS+0x370>
    80003cd0:	00000097          	auipc	ra,0x0
    80003cd4:	018080e7          	jalr	24(ra) # 80003ce8 <__printf>
    80003cd8:	00100793          	li	a5,1
    80003cdc:	00003717          	auipc	a4,0x3
    80003ce0:	68f72e23          	sw	a5,1692(a4) # 80007378 <panicked>
    80003ce4:	0000006f          	j	80003ce4 <panic+0x58>

0000000080003ce8 <__printf>:
    80003ce8:	f3010113          	addi	sp,sp,-208
    80003cec:	08813023          	sd	s0,128(sp)
    80003cf0:	07313423          	sd	s3,104(sp)
    80003cf4:	09010413          	addi	s0,sp,144
    80003cf8:	05813023          	sd	s8,64(sp)
    80003cfc:	08113423          	sd	ra,136(sp)
    80003d00:	06913c23          	sd	s1,120(sp)
    80003d04:	07213823          	sd	s2,112(sp)
    80003d08:	07413023          	sd	s4,96(sp)
    80003d0c:	05513c23          	sd	s5,88(sp)
    80003d10:	05613823          	sd	s6,80(sp)
    80003d14:	05713423          	sd	s7,72(sp)
    80003d18:	03913c23          	sd	s9,56(sp)
    80003d1c:	03a13823          	sd	s10,48(sp)
    80003d20:	03b13423          	sd	s11,40(sp)
    80003d24:	00005317          	auipc	t1,0x5
    80003d28:	8ec30313          	addi	t1,t1,-1812 # 80008610 <pr>
    80003d2c:	01832c03          	lw	s8,24(t1)
    80003d30:	00b43423          	sd	a1,8(s0)
    80003d34:	00c43823          	sd	a2,16(s0)
    80003d38:	00d43c23          	sd	a3,24(s0)
    80003d3c:	02e43023          	sd	a4,32(s0)
    80003d40:	02f43423          	sd	a5,40(s0)
    80003d44:	03043823          	sd	a6,48(s0)
    80003d48:	03143c23          	sd	a7,56(s0)
    80003d4c:	00050993          	mv	s3,a0
    80003d50:	4a0c1663          	bnez	s8,800041fc <__printf+0x514>
    80003d54:	60098c63          	beqz	s3,8000436c <__printf+0x684>
    80003d58:	0009c503          	lbu	a0,0(s3)
    80003d5c:	00840793          	addi	a5,s0,8
    80003d60:	f6f43c23          	sd	a5,-136(s0)
    80003d64:	00000493          	li	s1,0
    80003d68:	22050063          	beqz	a0,80003f88 <__printf+0x2a0>
    80003d6c:	00002a37          	lui	s4,0x2
    80003d70:	00018ab7          	lui	s5,0x18
    80003d74:	000f4b37          	lui	s6,0xf4
    80003d78:	00989bb7          	lui	s7,0x989
    80003d7c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80003d80:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80003d84:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80003d88:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80003d8c:	00148c9b          	addiw	s9,s1,1
    80003d90:	02500793          	li	a5,37
    80003d94:	01998933          	add	s2,s3,s9
    80003d98:	38f51263          	bne	a0,a5,8000411c <__printf+0x434>
    80003d9c:	00094783          	lbu	a5,0(s2)
    80003da0:	00078c9b          	sext.w	s9,a5
    80003da4:	1e078263          	beqz	a5,80003f88 <__printf+0x2a0>
    80003da8:	0024849b          	addiw	s1,s1,2
    80003dac:	07000713          	li	a4,112
    80003db0:	00998933          	add	s2,s3,s1
    80003db4:	38e78a63          	beq	a5,a4,80004148 <__printf+0x460>
    80003db8:	20f76863          	bltu	a4,a5,80003fc8 <__printf+0x2e0>
    80003dbc:	42a78863          	beq	a5,a0,800041ec <__printf+0x504>
    80003dc0:	06400713          	li	a4,100
    80003dc4:	40e79663          	bne	a5,a4,800041d0 <__printf+0x4e8>
    80003dc8:	f7843783          	ld	a5,-136(s0)
    80003dcc:	0007a603          	lw	a2,0(a5)
    80003dd0:	00878793          	addi	a5,a5,8
    80003dd4:	f6f43c23          	sd	a5,-136(s0)
    80003dd8:	42064a63          	bltz	a2,8000420c <__printf+0x524>
    80003ddc:	00a00713          	li	a4,10
    80003de0:	02e677bb          	remuw	a5,a2,a4
    80003de4:	00002d97          	auipc	s11,0x2
    80003de8:	5e4d8d93          	addi	s11,s11,1508 # 800063c8 <digits>
    80003dec:	00900593          	li	a1,9
    80003df0:	0006051b          	sext.w	a0,a2
    80003df4:	00000c93          	li	s9,0
    80003df8:	02079793          	slli	a5,a5,0x20
    80003dfc:	0207d793          	srli	a5,a5,0x20
    80003e00:	00fd87b3          	add	a5,s11,a5
    80003e04:	0007c783          	lbu	a5,0(a5)
    80003e08:	02e656bb          	divuw	a3,a2,a4
    80003e0c:	f8f40023          	sb	a5,-128(s0)
    80003e10:	14c5d863          	bge	a1,a2,80003f60 <__printf+0x278>
    80003e14:	06300593          	li	a1,99
    80003e18:	00100c93          	li	s9,1
    80003e1c:	02e6f7bb          	remuw	a5,a3,a4
    80003e20:	02079793          	slli	a5,a5,0x20
    80003e24:	0207d793          	srli	a5,a5,0x20
    80003e28:	00fd87b3          	add	a5,s11,a5
    80003e2c:	0007c783          	lbu	a5,0(a5)
    80003e30:	02e6d73b          	divuw	a4,a3,a4
    80003e34:	f8f400a3          	sb	a5,-127(s0)
    80003e38:	12a5f463          	bgeu	a1,a0,80003f60 <__printf+0x278>
    80003e3c:	00a00693          	li	a3,10
    80003e40:	00900593          	li	a1,9
    80003e44:	02d777bb          	remuw	a5,a4,a3
    80003e48:	02079793          	slli	a5,a5,0x20
    80003e4c:	0207d793          	srli	a5,a5,0x20
    80003e50:	00fd87b3          	add	a5,s11,a5
    80003e54:	0007c503          	lbu	a0,0(a5)
    80003e58:	02d757bb          	divuw	a5,a4,a3
    80003e5c:	f8a40123          	sb	a0,-126(s0)
    80003e60:	48e5f263          	bgeu	a1,a4,800042e4 <__printf+0x5fc>
    80003e64:	06300513          	li	a0,99
    80003e68:	02d7f5bb          	remuw	a1,a5,a3
    80003e6c:	02059593          	slli	a1,a1,0x20
    80003e70:	0205d593          	srli	a1,a1,0x20
    80003e74:	00bd85b3          	add	a1,s11,a1
    80003e78:	0005c583          	lbu	a1,0(a1)
    80003e7c:	02d7d7bb          	divuw	a5,a5,a3
    80003e80:	f8b401a3          	sb	a1,-125(s0)
    80003e84:	48e57263          	bgeu	a0,a4,80004308 <__printf+0x620>
    80003e88:	3e700513          	li	a0,999
    80003e8c:	02d7f5bb          	remuw	a1,a5,a3
    80003e90:	02059593          	slli	a1,a1,0x20
    80003e94:	0205d593          	srli	a1,a1,0x20
    80003e98:	00bd85b3          	add	a1,s11,a1
    80003e9c:	0005c583          	lbu	a1,0(a1)
    80003ea0:	02d7d7bb          	divuw	a5,a5,a3
    80003ea4:	f8b40223          	sb	a1,-124(s0)
    80003ea8:	46e57663          	bgeu	a0,a4,80004314 <__printf+0x62c>
    80003eac:	02d7f5bb          	remuw	a1,a5,a3
    80003eb0:	02059593          	slli	a1,a1,0x20
    80003eb4:	0205d593          	srli	a1,a1,0x20
    80003eb8:	00bd85b3          	add	a1,s11,a1
    80003ebc:	0005c583          	lbu	a1,0(a1)
    80003ec0:	02d7d7bb          	divuw	a5,a5,a3
    80003ec4:	f8b402a3          	sb	a1,-123(s0)
    80003ec8:	46ea7863          	bgeu	s4,a4,80004338 <__printf+0x650>
    80003ecc:	02d7f5bb          	remuw	a1,a5,a3
    80003ed0:	02059593          	slli	a1,a1,0x20
    80003ed4:	0205d593          	srli	a1,a1,0x20
    80003ed8:	00bd85b3          	add	a1,s11,a1
    80003edc:	0005c583          	lbu	a1,0(a1)
    80003ee0:	02d7d7bb          	divuw	a5,a5,a3
    80003ee4:	f8b40323          	sb	a1,-122(s0)
    80003ee8:	3eeaf863          	bgeu	s5,a4,800042d8 <__printf+0x5f0>
    80003eec:	02d7f5bb          	remuw	a1,a5,a3
    80003ef0:	02059593          	slli	a1,a1,0x20
    80003ef4:	0205d593          	srli	a1,a1,0x20
    80003ef8:	00bd85b3          	add	a1,s11,a1
    80003efc:	0005c583          	lbu	a1,0(a1)
    80003f00:	02d7d7bb          	divuw	a5,a5,a3
    80003f04:	f8b403a3          	sb	a1,-121(s0)
    80003f08:	42eb7e63          	bgeu	s6,a4,80004344 <__printf+0x65c>
    80003f0c:	02d7f5bb          	remuw	a1,a5,a3
    80003f10:	02059593          	slli	a1,a1,0x20
    80003f14:	0205d593          	srli	a1,a1,0x20
    80003f18:	00bd85b3          	add	a1,s11,a1
    80003f1c:	0005c583          	lbu	a1,0(a1)
    80003f20:	02d7d7bb          	divuw	a5,a5,a3
    80003f24:	f8b40423          	sb	a1,-120(s0)
    80003f28:	42ebfc63          	bgeu	s7,a4,80004360 <__printf+0x678>
    80003f2c:	02079793          	slli	a5,a5,0x20
    80003f30:	0207d793          	srli	a5,a5,0x20
    80003f34:	00fd8db3          	add	s11,s11,a5
    80003f38:	000dc703          	lbu	a4,0(s11)
    80003f3c:	00a00793          	li	a5,10
    80003f40:	00900c93          	li	s9,9
    80003f44:	f8e404a3          	sb	a4,-119(s0)
    80003f48:	00065c63          	bgez	a2,80003f60 <__printf+0x278>
    80003f4c:	f9040713          	addi	a4,s0,-112
    80003f50:	00f70733          	add	a4,a4,a5
    80003f54:	02d00693          	li	a3,45
    80003f58:	fed70823          	sb	a3,-16(a4)
    80003f5c:	00078c93          	mv	s9,a5
    80003f60:	f8040793          	addi	a5,s0,-128
    80003f64:	01978cb3          	add	s9,a5,s9
    80003f68:	f7f40d13          	addi	s10,s0,-129
    80003f6c:	000cc503          	lbu	a0,0(s9)
    80003f70:	fffc8c93          	addi	s9,s9,-1
    80003f74:	00000097          	auipc	ra,0x0
    80003f78:	b90080e7          	jalr	-1136(ra) # 80003b04 <consputc>
    80003f7c:	ffac98e3          	bne	s9,s10,80003f6c <__printf+0x284>
    80003f80:	00094503          	lbu	a0,0(s2)
    80003f84:	e00514e3          	bnez	a0,80003d8c <__printf+0xa4>
    80003f88:	1a0c1663          	bnez	s8,80004134 <__printf+0x44c>
    80003f8c:	08813083          	ld	ra,136(sp)
    80003f90:	08013403          	ld	s0,128(sp)
    80003f94:	07813483          	ld	s1,120(sp)
    80003f98:	07013903          	ld	s2,112(sp)
    80003f9c:	06813983          	ld	s3,104(sp)
    80003fa0:	06013a03          	ld	s4,96(sp)
    80003fa4:	05813a83          	ld	s5,88(sp)
    80003fa8:	05013b03          	ld	s6,80(sp)
    80003fac:	04813b83          	ld	s7,72(sp)
    80003fb0:	04013c03          	ld	s8,64(sp)
    80003fb4:	03813c83          	ld	s9,56(sp)
    80003fb8:	03013d03          	ld	s10,48(sp)
    80003fbc:	02813d83          	ld	s11,40(sp)
    80003fc0:	0d010113          	addi	sp,sp,208
    80003fc4:	00008067          	ret
    80003fc8:	07300713          	li	a4,115
    80003fcc:	1ce78a63          	beq	a5,a4,800041a0 <__printf+0x4b8>
    80003fd0:	07800713          	li	a4,120
    80003fd4:	1ee79e63          	bne	a5,a4,800041d0 <__printf+0x4e8>
    80003fd8:	f7843783          	ld	a5,-136(s0)
    80003fdc:	0007a703          	lw	a4,0(a5)
    80003fe0:	00878793          	addi	a5,a5,8
    80003fe4:	f6f43c23          	sd	a5,-136(s0)
    80003fe8:	28074263          	bltz	a4,8000426c <__printf+0x584>
    80003fec:	00002d97          	auipc	s11,0x2
    80003ff0:	3dcd8d93          	addi	s11,s11,988 # 800063c8 <digits>
    80003ff4:	00f77793          	andi	a5,a4,15
    80003ff8:	00fd87b3          	add	a5,s11,a5
    80003ffc:	0007c683          	lbu	a3,0(a5)
    80004000:	00f00613          	li	a2,15
    80004004:	0007079b          	sext.w	a5,a4
    80004008:	f8d40023          	sb	a3,-128(s0)
    8000400c:	0047559b          	srliw	a1,a4,0x4
    80004010:	0047569b          	srliw	a3,a4,0x4
    80004014:	00000c93          	li	s9,0
    80004018:	0ee65063          	bge	a2,a4,800040f8 <__printf+0x410>
    8000401c:	00f6f693          	andi	a3,a3,15
    80004020:	00dd86b3          	add	a3,s11,a3
    80004024:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80004028:	0087d79b          	srliw	a5,a5,0x8
    8000402c:	00100c93          	li	s9,1
    80004030:	f8d400a3          	sb	a3,-127(s0)
    80004034:	0cb67263          	bgeu	a2,a1,800040f8 <__printf+0x410>
    80004038:	00f7f693          	andi	a3,a5,15
    8000403c:	00dd86b3          	add	a3,s11,a3
    80004040:	0006c583          	lbu	a1,0(a3)
    80004044:	00f00613          	li	a2,15
    80004048:	0047d69b          	srliw	a3,a5,0x4
    8000404c:	f8b40123          	sb	a1,-126(s0)
    80004050:	0047d593          	srli	a1,a5,0x4
    80004054:	28f67e63          	bgeu	a2,a5,800042f0 <__printf+0x608>
    80004058:	00f6f693          	andi	a3,a3,15
    8000405c:	00dd86b3          	add	a3,s11,a3
    80004060:	0006c503          	lbu	a0,0(a3)
    80004064:	0087d813          	srli	a6,a5,0x8
    80004068:	0087d69b          	srliw	a3,a5,0x8
    8000406c:	f8a401a3          	sb	a0,-125(s0)
    80004070:	28b67663          	bgeu	a2,a1,800042fc <__printf+0x614>
    80004074:	00f6f693          	andi	a3,a3,15
    80004078:	00dd86b3          	add	a3,s11,a3
    8000407c:	0006c583          	lbu	a1,0(a3)
    80004080:	00c7d513          	srli	a0,a5,0xc
    80004084:	00c7d69b          	srliw	a3,a5,0xc
    80004088:	f8b40223          	sb	a1,-124(s0)
    8000408c:	29067a63          	bgeu	a2,a6,80004320 <__printf+0x638>
    80004090:	00f6f693          	andi	a3,a3,15
    80004094:	00dd86b3          	add	a3,s11,a3
    80004098:	0006c583          	lbu	a1,0(a3)
    8000409c:	0107d813          	srli	a6,a5,0x10
    800040a0:	0107d69b          	srliw	a3,a5,0x10
    800040a4:	f8b402a3          	sb	a1,-123(s0)
    800040a8:	28a67263          	bgeu	a2,a0,8000432c <__printf+0x644>
    800040ac:	00f6f693          	andi	a3,a3,15
    800040b0:	00dd86b3          	add	a3,s11,a3
    800040b4:	0006c683          	lbu	a3,0(a3)
    800040b8:	0147d79b          	srliw	a5,a5,0x14
    800040bc:	f8d40323          	sb	a3,-122(s0)
    800040c0:	21067663          	bgeu	a2,a6,800042cc <__printf+0x5e4>
    800040c4:	02079793          	slli	a5,a5,0x20
    800040c8:	0207d793          	srli	a5,a5,0x20
    800040cc:	00fd8db3          	add	s11,s11,a5
    800040d0:	000dc683          	lbu	a3,0(s11)
    800040d4:	00800793          	li	a5,8
    800040d8:	00700c93          	li	s9,7
    800040dc:	f8d403a3          	sb	a3,-121(s0)
    800040e0:	00075c63          	bgez	a4,800040f8 <__printf+0x410>
    800040e4:	f9040713          	addi	a4,s0,-112
    800040e8:	00f70733          	add	a4,a4,a5
    800040ec:	02d00693          	li	a3,45
    800040f0:	fed70823          	sb	a3,-16(a4)
    800040f4:	00078c93          	mv	s9,a5
    800040f8:	f8040793          	addi	a5,s0,-128
    800040fc:	01978cb3          	add	s9,a5,s9
    80004100:	f7f40d13          	addi	s10,s0,-129
    80004104:	000cc503          	lbu	a0,0(s9)
    80004108:	fffc8c93          	addi	s9,s9,-1
    8000410c:	00000097          	auipc	ra,0x0
    80004110:	9f8080e7          	jalr	-1544(ra) # 80003b04 <consputc>
    80004114:	ff9d18e3          	bne	s10,s9,80004104 <__printf+0x41c>
    80004118:	0100006f          	j	80004128 <__printf+0x440>
    8000411c:	00000097          	auipc	ra,0x0
    80004120:	9e8080e7          	jalr	-1560(ra) # 80003b04 <consputc>
    80004124:	000c8493          	mv	s1,s9
    80004128:	00094503          	lbu	a0,0(s2)
    8000412c:	c60510e3          	bnez	a0,80003d8c <__printf+0xa4>
    80004130:	e40c0ee3          	beqz	s8,80003f8c <__printf+0x2a4>
    80004134:	00004517          	auipc	a0,0x4
    80004138:	4dc50513          	addi	a0,a0,1244 # 80008610 <pr>
    8000413c:	00001097          	auipc	ra,0x1
    80004140:	94c080e7          	jalr	-1716(ra) # 80004a88 <release>
    80004144:	e49ff06f          	j	80003f8c <__printf+0x2a4>
    80004148:	f7843783          	ld	a5,-136(s0)
    8000414c:	03000513          	li	a0,48
    80004150:	01000d13          	li	s10,16
    80004154:	00878713          	addi	a4,a5,8
    80004158:	0007bc83          	ld	s9,0(a5)
    8000415c:	f6e43c23          	sd	a4,-136(s0)
    80004160:	00000097          	auipc	ra,0x0
    80004164:	9a4080e7          	jalr	-1628(ra) # 80003b04 <consputc>
    80004168:	07800513          	li	a0,120
    8000416c:	00000097          	auipc	ra,0x0
    80004170:	998080e7          	jalr	-1640(ra) # 80003b04 <consputc>
    80004174:	00002d97          	auipc	s11,0x2
    80004178:	254d8d93          	addi	s11,s11,596 # 800063c8 <digits>
    8000417c:	03ccd793          	srli	a5,s9,0x3c
    80004180:	00fd87b3          	add	a5,s11,a5
    80004184:	0007c503          	lbu	a0,0(a5)
    80004188:	fffd0d1b          	addiw	s10,s10,-1
    8000418c:	004c9c93          	slli	s9,s9,0x4
    80004190:	00000097          	auipc	ra,0x0
    80004194:	974080e7          	jalr	-1676(ra) # 80003b04 <consputc>
    80004198:	fe0d12e3          	bnez	s10,8000417c <__printf+0x494>
    8000419c:	f8dff06f          	j	80004128 <__printf+0x440>
    800041a0:	f7843783          	ld	a5,-136(s0)
    800041a4:	0007bc83          	ld	s9,0(a5)
    800041a8:	00878793          	addi	a5,a5,8
    800041ac:	f6f43c23          	sd	a5,-136(s0)
    800041b0:	000c9a63          	bnez	s9,800041c4 <__printf+0x4dc>
    800041b4:	1080006f          	j	800042bc <__printf+0x5d4>
    800041b8:	001c8c93          	addi	s9,s9,1
    800041bc:	00000097          	auipc	ra,0x0
    800041c0:	948080e7          	jalr	-1720(ra) # 80003b04 <consputc>
    800041c4:	000cc503          	lbu	a0,0(s9)
    800041c8:	fe0518e3          	bnez	a0,800041b8 <__printf+0x4d0>
    800041cc:	f5dff06f          	j	80004128 <__printf+0x440>
    800041d0:	02500513          	li	a0,37
    800041d4:	00000097          	auipc	ra,0x0
    800041d8:	930080e7          	jalr	-1744(ra) # 80003b04 <consputc>
    800041dc:	000c8513          	mv	a0,s9
    800041e0:	00000097          	auipc	ra,0x0
    800041e4:	924080e7          	jalr	-1756(ra) # 80003b04 <consputc>
    800041e8:	f41ff06f          	j	80004128 <__printf+0x440>
    800041ec:	02500513          	li	a0,37
    800041f0:	00000097          	auipc	ra,0x0
    800041f4:	914080e7          	jalr	-1772(ra) # 80003b04 <consputc>
    800041f8:	f31ff06f          	j	80004128 <__printf+0x440>
    800041fc:	00030513          	mv	a0,t1
    80004200:	00000097          	auipc	ra,0x0
    80004204:	7bc080e7          	jalr	1980(ra) # 800049bc <acquire>
    80004208:	b4dff06f          	j	80003d54 <__printf+0x6c>
    8000420c:	40c0053b          	negw	a0,a2
    80004210:	00a00713          	li	a4,10
    80004214:	02e576bb          	remuw	a3,a0,a4
    80004218:	00002d97          	auipc	s11,0x2
    8000421c:	1b0d8d93          	addi	s11,s11,432 # 800063c8 <digits>
    80004220:	ff700593          	li	a1,-9
    80004224:	02069693          	slli	a3,a3,0x20
    80004228:	0206d693          	srli	a3,a3,0x20
    8000422c:	00dd86b3          	add	a3,s11,a3
    80004230:	0006c683          	lbu	a3,0(a3)
    80004234:	02e557bb          	divuw	a5,a0,a4
    80004238:	f8d40023          	sb	a3,-128(s0)
    8000423c:	10b65e63          	bge	a2,a1,80004358 <__printf+0x670>
    80004240:	06300593          	li	a1,99
    80004244:	02e7f6bb          	remuw	a3,a5,a4
    80004248:	02069693          	slli	a3,a3,0x20
    8000424c:	0206d693          	srli	a3,a3,0x20
    80004250:	00dd86b3          	add	a3,s11,a3
    80004254:	0006c683          	lbu	a3,0(a3)
    80004258:	02e7d73b          	divuw	a4,a5,a4
    8000425c:	00200793          	li	a5,2
    80004260:	f8d400a3          	sb	a3,-127(s0)
    80004264:	bca5ece3          	bltu	a1,a0,80003e3c <__printf+0x154>
    80004268:	ce5ff06f          	j	80003f4c <__printf+0x264>
    8000426c:	40e007bb          	negw	a5,a4
    80004270:	00002d97          	auipc	s11,0x2
    80004274:	158d8d93          	addi	s11,s11,344 # 800063c8 <digits>
    80004278:	00f7f693          	andi	a3,a5,15
    8000427c:	00dd86b3          	add	a3,s11,a3
    80004280:	0006c583          	lbu	a1,0(a3)
    80004284:	ff100613          	li	a2,-15
    80004288:	0047d69b          	srliw	a3,a5,0x4
    8000428c:	f8b40023          	sb	a1,-128(s0)
    80004290:	0047d59b          	srliw	a1,a5,0x4
    80004294:	0ac75e63          	bge	a4,a2,80004350 <__printf+0x668>
    80004298:	00f6f693          	andi	a3,a3,15
    8000429c:	00dd86b3          	add	a3,s11,a3
    800042a0:	0006c603          	lbu	a2,0(a3)
    800042a4:	00f00693          	li	a3,15
    800042a8:	0087d79b          	srliw	a5,a5,0x8
    800042ac:	f8c400a3          	sb	a2,-127(s0)
    800042b0:	d8b6e4e3          	bltu	a3,a1,80004038 <__printf+0x350>
    800042b4:	00200793          	li	a5,2
    800042b8:	e2dff06f          	j	800040e4 <__printf+0x3fc>
    800042bc:	00002c97          	auipc	s9,0x2
    800042c0:	0ecc8c93          	addi	s9,s9,236 # 800063a8 <CONSOLE_STATUS+0x398>
    800042c4:	02800513          	li	a0,40
    800042c8:	ef1ff06f          	j	800041b8 <__printf+0x4d0>
    800042cc:	00700793          	li	a5,7
    800042d0:	00600c93          	li	s9,6
    800042d4:	e0dff06f          	j	800040e0 <__printf+0x3f8>
    800042d8:	00700793          	li	a5,7
    800042dc:	00600c93          	li	s9,6
    800042e0:	c69ff06f          	j	80003f48 <__printf+0x260>
    800042e4:	00300793          	li	a5,3
    800042e8:	00200c93          	li	s9,2
    800042ec:	c5dff06f          	j	80003f48 <__printf+0x260>
    800042f0:	00300793          	li	a5,3
    800042f4:	00200c93          	li	s9,2
    800042f8:	de9ff06f          	j	800040e0 <__printf+0x3f8>
    800042fc:	00400793          	li	a5,4
    80004300:	00300c93          	li	s9,3
    80004304:	dddff06f          	j	800040e0 <__printf+0x3f8>
    80004308:	00400793          	li	a5,4
    8000430c:	00300c93          	li	s9,3
    80004310:	c39ff06f          	j	80003f48 <__printf+0x260>
    80004314:	00500793          	li	a5,5
    80004318:	00400c93          	li	s9,4
    8000431c:	c2dff06f          	j	80003f48 <__printf+0x260>
    80004320:	00500793          	li	a5,5
    80004324:	00400c93          	li	s9,4
    80004328:	db9ff06f          	j	800040e0 <__printf+0x3f8>
    8000432c:	00600793          	li	a5,6
    80004330:	00500c93          	li	s9,5
    80004334:	dadff06f          	j	800040e0 <__printf+0x3f8>
    80004338:	00600793          	li	a5,6
    8000433c:	00500c93          	li	s9,5
    80004340:	c09ff06f          	j	80003f48 <__printf+0x260>
    80004344:	00800793          	li	a5,8
    80004348:	00700c93          	li	s9,7
    8000434c:	bfdff06f          	j	80003f48 <__printf+0x260>
    80004350:	00100793          	li	a5,1
    80004354:	d91ff06f          	j	800040e4 <__printf+0x3fc>
    80004358:	00100793          	li	a5,1
    8000435c:	bf1ff06f          	j	80003f4c <__printf+0x264>
    80004360:	00900793          	li	a5,9
    80004364:	00800c93          	li	s9,8
    80004368:	be1ff06f          	j	80003f48 <__printf+0x260>
    8000436c:	00002517          	auipc	a0,0x2
    80004370:	04450513          	addi	a0,a0,68 # 800063b0 <CONSOLE_STATUS+0x3a0>
    80004374:	00000097          	auipc	ra,0x0
    80004378:	918080e7          	jalr	-1768(ra) # 80003c8c <panic>

000000008000437c <printfinit>:
    8000437c:	fe010113          	addi	sp,sp,-32
    80004380:	00813823          	sd	s0,16(sp)
    80004384:	00913423          	sd	s1,8(sp)
    80004388:	00113c23          	sd	ra,24(sp)
    8000438c:	02010413          	addi	s0,sp,32
    80004390:	00004497          	auipc	s1,0x4
    80004394:	28048493          	addi	s1,s1,640 # 80008610 <pr>
    80004398:	00048513          	mv	a0,s1
    8000439c:	00002597          	auipc	a1,0x2
    800043a0:	02458593          	addi	a1,a1,36 # 800063c0 <CONSOLE_STATUS+0x3b0>
    800043a4:	00000097          	auipc	ra,0x0
    800043a8:	5f4080e7          	jalr	1524(ra) # 80004998 <initlock>
    800043ac:	01813083          	ld	ra,24(sp)
    800043b0:	01013403          	ld	s0,16(sp)
    800043b4:	0004ac23          	sw	zero,24(s1)
    800043b8:	00813483          	ld	s1,8(sp)
    800043bc:	02010113          	addi	sp,sp,32
    800043c0:	00008067          	ret

00000000800043c4 <uartinit>:
    800043c4:	ff010113          	addi	sp,sp,-16
    800043c8:	00813423          	sd	s0,8(sp)
    800043cc:	01010413          	addi	s0,sp,16
    800043d0:	100007b7          	lui	a5,0x10000
    800043d4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800043d8:	f8000713          	li	a4,-128
    800043dc:	00e781a3          	sb	a4,3(a5)
    800043e0:	00300713          	li	a4,3
    800043e4:	00e78023          	sb	a4,0(a5)
    800043e8:	000780a3          	sb	zero,1(a5)
    800043ec:	00e781a3          	sb	a4,3(a5)
    800043f0:	00700693          	li	a3,7
    800043f4:	00d78123          	sb	a3,2(a5)
    800043f8:	00e780a3          	sb	a4,1(a5)
    800043fc:	00813403          	ld	s0,8(sp)
    80004400:	01010113          	addi	sp,sp,16
    80004404:	00008067          	ret

0000000080004408 <uartputc>:
    80004408:	00003797          	auipc	a5,0x3
    8000440c:	f707a783          	lw	a5,-144(a5) # 80007378 <panicked>
    80004410:	00078463          	beqz	a5,80004418 <uartputc+0x10>
    80004414:	0000006f          	j	80004414 <uartputc+0xc>
    80004418:	fd010113          	addi	sp,sp,-48
    8000441c:	02813023          	sd	s0,32(sp)
    80004420:	00913c23          	sd	s1,24(sp)
    80004424:	01213823          	sd	s2,16(sp)
    80004428:	01313423          	sd	s3,8(sp)
    8000442c:	02113423          	sd	ra,40(sp)
    80004430:	03010413          	addi	s0,sp,48
    80004434:	00003917          	auipc	s2,0x3
    80004438:	f4c90913          	addi	s2,s2,-180 # 80007380 <uart_tx_r>
    8000443c:	00093783          	ld	a5,0(s2)
    80004440:	00003497          	auipc	s1,0x3
    80004444:	f4848493          	addi	s1,s1,-184 # 80007388 <uart_tx_w>
    80004448:	0004b703          	ld	a4,0(s1)
    8000444c:	02078693          	addi	a3,a5,32
    80004450:	00050993          	mv	s3,a0
    80004454:	02e69c63          	bne	a3,a4,8000448c <uartputc+0x84>
    80004458:	00001097          	auipc	ra,0x1
    8000445c:	834080e7          	jalr	-1996(ra) # 80004c8c <push_on>
    80004460:	00093783          	ld	a5,0(s2)
    80004464:	0004b703          	ld	a4,0(s1)
    80004468:	02078793          	addi	a5,a5,32
    8000446c:	00e79463          	bne	a5,a4,80004474 <uartputc+0x6c>
    80004470:	0000006f          	j	80004470 <uartputc+0x68>
    80004474:	00001097          	auipc	ra,0x1
    80004478:	88c080e7          	jalr	-1908(ra) # 80004d00 <pop_on>
    8000447c:	00093783          	ld	a5,0(s2)
    80004480:	0004b703          	ld	a4,0(s1)
    80004484:	02078693          	addi	a3,a5,32
    80004488:	fce688e3          	beq	a3,a4,80004458 <uartputc+0x50>
    8000448c:	01f77693          	andi	a3,a4,31
    80004490:	00004597          	auipc	a1,0x4
    80004494:	1a058593          	addi	a1,a1,416 # 80008630 <uart_tx_buf>
    80004498:	00d586b3          	add	a3,a1,a3
    8000449c:	00170713          	addi	a4,a4,1
    800044a0:	01368023          	sb	s3,0(a3)
    800044a4:	00e4b023          	sd	a4,0(s1)
    800044a8:	10000637          	lui	a2,0x10000
    800044ac:	02f71063          	bne	a4,a5,800044cc <uartputc+0xc4>
    800044b0:	0340006f          	j	800044e4 <uartputc+0xdc>
    800044b4:	00074703          	lbu	a4,0(a4)
    800044b8:	00f93023          	sd	a5,0(s2)
    800044bc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800044c0:	00093783          	ld	a5,0(s2)
    800044c4:	0004b703          	ld	a4,0(s1)
    800044c8:	00f70e63          	beq	a4,a5,800044e4 <uartputc+0xdc>
    800044cc:	00564683          	lbu	a3,5(a2)
    800044d0:	01f7f713          	andi	a4,a5,31
    800044d4:	00e58733          	add	a4,a1,a4
    800044d8:	0206f693          	andi	a3,a3,32
    800044dc:	00178793          	addi	a5,a5,1
    800044e0:	fc069ae3          	bnez	a3,800044b4 <uartputc+0xac>
    800044e4:	02813083          	ld	ra,40(sp)
    800044e8:	02013403          	ld	s0,32(sp)
    800044ec:	01813483          	ld	s1,24(sp)
    800044f0:	01013903          	ld	s2,16(sp)
    800044f4:	00813983          	ld	s3,8(sp)
    800044f8:	03010113          	addi	sp,sp,48
    800044fc:	00008067          	ret

0000000080004500 <uartputc_sync>:
    80004500:	ff010113          	addi	sp,sp,-16
    80004504:	00813423          	sd	s0,8(sp)
    80004508:	01010413          	addi	s0,sp,16
    8000450c:	00003717          	auipc	a4,0x3
    80004510:	e6c72703          	lw	a4,-404(a4) # 80007378 <panicked>
    80004514:	02071663          	bnez	a4,80004540 <uartputc_sync+0x40>
    80004518:	00050793          	mv	a5,a0
    8000451c:	100006b7          	lui	a3,0x10000
    80004520:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80004524:	02077713          	andi	a4,a4,32
    80004528:	fe070ce3          	beqz	a4,80004520 <uartputc_sync+0x20>
    8000452c:	0ff7f793          	andi	a5,a5,255
    80004530:	00f68023          	sb	a5,0(a3)
    80004534:	00813403          	ld	s0,8(sp)
    80004538:	01010113          	addi	sp,sp,16
    8000453c:	00008067          	ret
    80004540:	0000006f          	j	80004540 <uartputc_sync+0x40>

0000000080004544 <uartstart>:
    80004544:	ff010113          	addi	sp,sp,-16
    80004548:	00813423          	sd	s0,8(sp)
    8000454c:	01010413          	addi	s0,sp,16
    80004550:	00003617          	auipc	a2,0x3
    80004554:	e3060613          	addi	a2,a2,-464 # 80007380 <uart_tx_r>
    80004558:	00003517          	auipc	a0,0x3
    8000455c:	e3050513          	addi	a0,a0,-464 # 80007388 <uart_tx_w>
    80004560:	00063783          	ld	a5,0(a2)
    80004564:	00053703          	ld	a4,0(a0)
    80004568:	04f70263          	beq	a4,a5,800045ac <uartstart+0x68>
    8000456c:	100005b7          	lui	a1,0x10000
    80004570:	00004817          	auipc	a6,0x4
    80004574:	0c080813          	addi	a6,a6,192 # 80008630 <uart_tx_buf>
    80004578:	01c0006f          	j	80004594 <uartstart+0x50>
    8000457c:	0006c703          	lbu	a4,0(a3)
    80004580:	00f63023          	sd	a5,0(a2)
    80004584:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80004588:	00063783          	ld	a5,0(a2)
    8000458c:	00053703          	ld	a4,0(a0)
    80004590:	00f70e63          	beq	a4,a5,800045ac <uartstart+0x68>
    80004594:	01f7f713          	andi	a4,a5,31
    80004598:	00e806b3          	add	a3,a6,a4
    8000459c:	0055c703          	lbu	a4,5(a1)
    800045a0:	00178793          	addi	a5,a5,1
    800045a4:	02077713          	andi	a4,a4,32
    800045a8:	fc071ae3          	bnez	a4,8000457c <uartstart+0x38>
    800045ac:	00813403          	ld	s0,8(sp)
    800045b0:	01010113          	addi	sp,sp,16
    800045b4:	00008067          	ret

00000000800045b8 <uartgetc>:
    800045b8:	ff010113          	addi	sp,sp,-16
    800045bc:	00813423          	sd	s0,8(sp)
    800045c0:	01010413          	addi	s0,sp,16
    800045c4:	10000737          	lui	a4,0x10000
    800045c8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800045cc:	0017f793          	andi	a5,a5,1
    800045d0:	00078c63          	beqz	a5,800045e8 <uartgetc+0x30>
    800045d4:	00074503          	lbu	a0,0(a4)
    800045d8:	0ff57513          	andi	a0,a0,255
    800045dc:	00813403          	ld	s0,8(sp)
    800045e0:	01010113          	addi	sp,sp,16
    800045e4:	00008067          	ret
    800045e8:	fff00513          	li	a0,-1
    800045ec:	ff1ff06f          	j	800045dc <uartgetc+0x24>

00000000800045f0 <uartintr>:
    800045f0:	100007b7          	lui	a5,0x10000
    800045f4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800045f8:	0017f793          	andi	a5,a5,1
    800045fc:	0a078463          	beqz	a5,800046a4 <uartintr+0xb4>
    80004600:	fe010113          	addi	sp,sp,-32
    80004604:	00813823          	sd	s0,16(sp)
    80004608:	00913423          	sd	s1,8(sp)
    8000460c:	00113c23          	sd	ra,24(sp)
    80004610:	02010413          	addi	s0,sp,32
    80004614:	100004b7          	lui	s1,0x10000
    80004618:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000461c:	0ff57513          	andi	a0,a0,255
    80004620:	fffff097          	auipc	ra,0xfffff
    80004624:	534080e7          	jalr	1332(ra) # 80003b54 <consoleintr>
    80004628:	0054c783          	lbu	a5,5(s1)
    8000462c:	0017f793          	andi	a5,a5,1
    80004630:	fe0794e3          	bnez	a5,80004618 <uartintr+0x28>
    80004634:	00003617          	auipc	a2,0x3
    80004638:	d4c60613          	addi	a2,a2,-692 # 80007380 <uart_tx_r>
    8000463c:	00003517          	auipc	a0,0x3
    80004640:	d4c50513          	addi	a0,a0,-692 # 80007388 <uart_tx_w>
    80004644:	00063783          	ld	a5,0(a2)
    80004648:	00053703          	ld	a4,0(a0)
    8000464c:	04f70263          	beq	a4,a5,80004690 <uartintr+0xa0>
    80004650:	100005b7          	lui	a1,0x10000
    80004654:	00004817          	auipc	a6,0x4
    80004658:	fdc80813          	addi	a6,a6,-36 # 80008630 <uart_tx_buf>
    8000465c:	01c0006f          	j	80004678 <uartintr+0x88>
    80004660:	0006c703          	lbu	a4,0(a3)
    80004664:	00f63023          	sd	a5,0(a2)
    80004668:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000466c:	00063783          	ld	a5,0(a2)
    80004670:	00053703          	ld	a4,0(a0)
    80004674:	00f70e63          	beq	a4,a5,80004690 <uartintr+0xa0>
    80004678:	01f7f713          	andi	a4,a5,31
    8000467c:	00e806b3          	add	a3,a6,a4
    80004680:	0055c703          	lbu	a4,5(a1)
    80004684:	00178793          	addi	a5,a5,1
    80004688:	02077713          	andi	a4,a4,32
    8000468c:	fc071ae3          	bnez	a4,80004660 <uartintr+0x70>
    80004690:	01813083          	ld	ra,24(sp)
    80004694:	01013403          	ld	s0,16(sp)
    80004698:	00813483          	ld	s1,8(sp)
    8000469c:	02010113          	addi	sp,sp,32
    800046a0:	00008067          	ret
    800046a4:	00003617          	auipc	a2,0x3
    800046a8:	cdc60613          	addi	a2,a2,-804 # 80007380 <uart_tx_r>
    800046ac:	00003517          	auipc	a0,0x3
    800046b0:	cdc50513          	addi	a0,a0,-804 # 80007388 <uart_tx_w>
    800046b4:	00063783          	ld	a5,0(a2)
    800046b8:	00053703          	ld	a4,0(a0)
    800046bc:	04f70263          	beq	a4,a5,80004700 <uartintr+0x110>
    800046c0:	100005b7          	lui	a1,0x10000
    800046c4:	00004817          	auipc	a6,0x4
    800046c8:	f6c80813          	addi	a6,a6,-148 # 80008630 <uart_tx_buf>
    800046cc:	01c0006f          	j	800046e8 <uartintr+0xf8>
    800046d0:	0006c703          	lbu	a4,0(a3)
    800046d4:	00f63023          	sd	a5,0(a2)
    800046d8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800046dc:	00063783          	ld	a5,0(a2)
    800046e0:	00053703          	ld	a4,0(a0)
    800046e4:	02f70063          	beq	a4,a5,80004704 <uartintr+0x114>
    800046e8:	01f7f713          	andi	a4,a5,31
    800046ec:	00e806b3          	add	a3,a6,a4
    800046f0:	0055c703          	lbu	a4,5(a1)
    800046f4:	00178793          	addi	a5,a5,1
    800046f8:	02077713          	andi	a4,a4,32
    800046fc:	fc071ae3          	bnez	a4,800046d0 <uartintr+0xe0>
    80004700:	00008067          	ret
    80004704:	00008067          	ret

0000000080004708 <kinit>:
    80004708:	fc010113          	addi	sp,sp,-64
    8000470c:	02913423          	sd	s1,40(sp)
    80004710:	fffff7b7          	lui	a5,0xfffff
    80004714:	00005497          	auipc	s1,0x5
    80004718:	f3b48493          	addi	s1,s1,-197 # 8000964f <end+0xfff>
    8000471c:	02813823          	sd	s0,48(sp)
    80004720:	01313c23          	sd	s3,24(sp)
    80004724:	00f4f4b3          	and	s1,s1,a5
    80004728:	02113c23          	sd	ra,56(sp)
    8000472c:	03213023          	sd	s2,32(sp)
    80004730:	01413823          	sd	s4,16(sp)
    80004734:	01513423          	sd	s5,8(sp)
    80004738:	04010413          	addi	s0,sp,64
    8000473c:	000017b7          	lui	a5,0x1
    80004740:	01100993          	li	s3,17
    80004744:	00f487b3          	add	a5,s1,a5
    80004748:	01b99993          	slli	s3,s3,0x1b
    8000474c:	06f9e063          	bltu	s3,a5,800047ac <kinit+0xa4>
    80004750:	00004a97          	auipc	s5,0x4
    80004754:	f00a8a93          	addi	s5,s5,-256 # 80008650 <end>
    80004758:	0754ec63          	bltu	s1,s5,800047d0 <kinit+0xc8>
    8000475c:	0734fa63          	bgeu	s1,s3,800047d0 <kinit+0xc8>
    80004760:	00088a37          	lui	s4,0x88
    80004764:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80004768:	00003917          	auipc	s2,0x3
    8000476c:	c2890913          	addi	s2,s2,-984 # 80007390 <kmem>
    80004770:	00ca1a13          	slli	s4,s4,0xc
    80004774:	0140006f          	j	80004788 <kinit+0x80>
    80004778:	000017b7          	lui	a5,0x1
    8000477c:	00f484b3          	add	s1,s1,a5
    80004780:	0554e863          	bltu	s1,s5,800047d0 <kinit+0xc8>
    80004784:	0534f663          	bgeu	s1,s3,800047d0 <kinit+0xc8>
    80004788:	00001637          	lui	a2,0x1
    8000478c:	00100593          	li	a1,1
    80004790:	00048513          	mv	a0,s1
    80004794:	00000097          	auipc	ra,0x0
    80004798:	5e4080e7          	jalr	1508(ra) # 80004d78 <__memset>
    8000479c:	00093783          	ld	a5,0(s2)
    800047a0:	00f4b023          	sd	a5,0(s1)
    800047a4:	00993023          	sd	s1,0(s2)
    800047a8:	fd4498e3          	bne	s1,s4,80004778 <kinit+0x70>
    800047ac:	03813083          	ld	ra,56(sp)
    800047b0:	03013403          	ld	s0,48(sp)
    800047b4:	02813483          	ld	s1,40(sp)
    800047b8:	02013903          	ld	s2,32(sp)
    800047bc:	01813983          	ld	s3,24(sp)
    800047c0:	01013a03          	ld	s4,16(sp)
    800047c4:	00813a83          	ld	s5,8(sp)
    800047c8:	04010113          	addi	sp,sp,64
    800047cc:	00008067          	ret
    800047d0:	00002517          	auipc	a0,0x2
    800047d4:	c1050513          	addi	a0,a0,-1008 # 800063e0 <digits+0x18>
    800047d8:	fffff097          	auipc	ra,0xfffff
    800047dc:	4b4080e7          	jalr	1204(ra) # 80003c8c <panic>

00000000800047e0 <freerange>:
    800047e0:	fc010113          	addi	sp,sp,-64
    800047e4:	000017b7          	lui	a5,0x1
    800047e8:	02913423          	sd	s1,40(sp)
    800047ec:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800047f0:	009504b3          	add	s1,a0,s1
    800047f4:	fffff537          	lui	a0,0xfffff
    800047f8:	02813823          	sd	s0,48(sp)
    800047fc:	02113c23          	sd	ra,56(sp)
    80004800:	03213023          	sd	s2,32(sp)
    80004804:	01313c23          	sd	s3,24(sp)
    80004808:	01413823          	sd	s4,16(sp)
    8000480c:	01513423          	sd	s5,8(sp)
    80004810:	01613023          	sd	s6,0(sp)
    80004814:	04010413          	addi	s0,sp,64
    80004818:	00a4f4b3          	and	s1,s1,a0
    8000481c:	00f487b3          	add	a5,s1,a5
    80004820:	06f5e463          	bltu	a1,a5,80004888 <freerange+0xa8>
    80004824:	00004a97          	auipc	s5,0x4
    80004828:	e2ca8a93          	addi	s5,s5,-468 # 80008650 <end>
    8000482c:	0954e263          	bltu	s1,s5,800048b0 <freerange+0xd0>
    80004830:	01100993          	li	s3,17
    80004834:	01b99993          	slli	s3,s3,0x1b
    80004838:	0734fc63          	bgeu	s1,s3,800048b0 <freerange+0xd0>
    8000483c:	00058a13          	mv	s4,a1
    80004840:	00003917          	auipc	s2,0x3
    80004844:	b5090913          	addi	s2,s2,-1200 # 80007390 <kmem>
    80004848:	00002b37          	lui	s6,0x2
    8000484c:	0140006f          	j	80004860 <freerange+0x80>
    80004850:	000017b7          	lui	a5,0x1
    80004854:	00f484b3          	add	s1,s1,a5
    80004858:	0554ec63          	bltu	s1,s5,800048b0 <freerange+0xd0>
    8000485c:	0534fa63          	bgeu	s1,s3,800048b0 <freerange+0xd0>
    80004860:	00001637          	lui	a2,0x1
    80004864:	00100593          	li	a1,1
    80004868:	00048513          	mv	a0,s1
    8000486c:	00000097          	auipc	ra,0x0
    80004870:	50c080e7          	jalr	1292(ra) # 80004d78 <__memset>
    80004874:	00093703          	ld	a4,0(s2)
    80004878:	016487b3          	add	a5,s1,s6
    8000487c:	00e4b023          	sd	a4,0(s1)
    80004880:	00993023          	sd	s1,0(s2)
    80004884:	fcfa76e3          	bgeu	s4,a5,80004850 <freerange+0x70>
    80004888:	03813083          	ld	ra,56(sp)
    8000488c:	03013403          	ld	s0,48(sp)
    80004890:	02813483          	ld	s1,40(sp)
    80004894:	02013903          	ld	s2,32(sp)
    80004898:	01813983          	ld	s3,24(sp)
    8000489c:	01013a03          	ld	s4,16(sp)
    800048a0:	00813a83          	ld	s5,8(sp)
    800048a4:	00013b03          	ld	s6,0(sp)
    800048a8:	04010113          	addi	sp,sp,64
    800048ac:	00008067          	ret
    800048b0:	00002517          	auipc	a0,0x2
    800048b4:	b3050513          	addi	a0,a0,-1232 # 800063e0 <digits+0x18>
    800048b8:	fffff097          	auipc	ra,0xfffff
    800048bc:	3d4080e7          	jalr	980(ra) # 80003c8c <panic>

00000000800048c0 <kfree>:
    800048c0:	fe010113          	addi	sp,sp,-32
    800048c4:	00813823          	sd	s0,16(sp)
    800048c8:	00113c23          	sd	ra,24(sp)
    800048cc:	00913423          	sd	s1,8(sp)
    800048d0:	02010413          	addi	s0,sp,32
    800048d4:	03451793          	slli	a5,a0,0x34
    800048d8:	04079c63          	bnez	a5,80004930 <kfree+0x70>
    800048dc:	00004797          	auipc	a5,0x4
    800048e0:	d7478793          	addi	a5,a5,-652 # 80008650 <end>
    800048e4:	00050493          	mv	s1,a0
    800048e8:	04f56463          	bltu	a0,a5,80004930 <kfree+0x70>
    800048ec:	01100793          	li	a5,17
    800048f0:	01b79793          	slli	a5,a5,0x1b
    800048f4:	02f57e63          	bgeu	a0,a5,80004930 <kfree+0x70>
    800048f8:	00001637          	lui	a2,0x1
    800048fc:	00100593          	li	a1,1
    80004900:	00000097          	auipc	ra,0x0
    80004904:	478080e7          	jalr	1144(ra) # 80004d78 <__memset>
    80004908:	00003797          	auipc	a5,0x3
    8000490c:	a8878793          	addi	a5,a5,-1400 # 80007390 <kmem>
    80004910:	0007b703          	ld	a4,0(a5)
    80004914:	01813083          	ld	ra,24(sp)
    80004918:	01013403          	ld	s0,16(sp)
    8000491c:	00e4b023          	sd	a4,0(s1)
    80004920:	0097b023          	sd	s1,0(a5)
    80004924:	00813483          	ld	s1,8(sp)
    80004928:	02010113          	addi	sp,sp,32
    8000492c:	00008067          	ret
    80004930:	00002517          	auipc	a0,0x2
    80004934:	ab050513          	addi	a0,a0,-1360 # 800063e0 <digits+0x18>
    80004938:	fffff097          	auipc	ra,0xfffff
    8000493c:	354080e7          	jalr	852(ra) # 80003c8c <panic>

0000000080004940 <kalloc>:
    80004940:	fe010113          	addi	sp,sp,-32
    80004944:	00813823          	sd	s0,16(sp)
    80004948:	00913423          	sd	s1,8(sp)
    8000494c:	00113c23          	sd	ra,24(sp)
    80004950:	02010413          	addi	s0,sp,32
    80004954:	00003797          	auipc	a5,0x3
    80004958:	a3c78793          	addi	a5,a5,-1476 # 80007390 <kmem>
    8000495c:	0007b483          	ld	s1,0(a5)
    80004960:	02048063          	beqz	s1,80004980 <kalloc+0x40>
    80004964:	0004b703          	ld	a4,0(s1)
    80004968:	00001637          	lui	a2,0x1
    8000496c:	00500593          	li	a1,5
    80004970:	00048513          	mv	a0,s1
    80004974:	00e7b023          	sd	a4,0(a5)
    80004978:	00000097          	auipc	ra,0x0
    8000497c:	400080e7          	jalr	1024(ra) # 80004d78 <__memset>
    80004980:	01813083          	ld	ra,24(sp)
    80004984:	01013403          	ld	s0,16(sp)
    80004988:	00048513          	mv	a0,s1
    8000498c:	00813483          	ld	s1,8(sp)
    80004990:	02010113          	addi	sp,sp,32
    80004994:	00008067          	ret

0000000080004998 <initlock>:
    80004998:	ff010113          	addi	sp,sp,-16
    8000499c:	00813423          	sd	s0,8(sp)
    800049a0:	01010413          	addi	s0,sp,16
    800049a4:	00813403          	ld	s0,8(sp)
    800049a8:	00b53423          	sd	a1,8(a0)
    800049ac:	00052023          	sw	zero,0(a0)
    800049b0:	00053823          	sd	zero,16(a0)
    800049b4:	01010113          	addi	sp,sp,16
    800049b8:	00008067          	ret

00000000800049bc <acquire>:
    800049bc:	fe010113          	addi	sp,sp,-32
    800049c0:	00813823          	sd	s0,16(sp)
    800049c4:	00913423          	sd	s1,8(sp)
    800049c8:	00113c23          	sd	ra,24(sp)
    800049cc:	01213023          	sd	s2,0(sp)
    800049d0:	02010413          	addi	s0,sp,32
    800049d4:	00050493          	mv	s1,a0
    800049d8:	10002973          	csrr	s2,sstatus
    800049dc:	100027f3          	csrr	a5,sstatus
    800049e0:	ffd7f793          	andi	a5,a5,-3
    800049e4:	10079073          	csrw	sstatus,a5
    800049e8:	fffff097          	auipc	ra,0xfffff
    800049ec:	8e8080e7          	jalr	-1816(ra) # 800032d0 <mycpu>
    800049f0:	07852783          	lw	a5,120(a0)
    800049f4:	06078e63          	beqz	a5,80004a70 <acquire+0xb4>
    800049f8:	fffff097          	auipc	ra,0xfffff
    800049fc:	8d8080e7          	jalr	-1832(ra) # 800032d0 <mycpu>
    80004a00:	07852783          	lw	a5,120(a0)
    80004a04:	0004a703          	lw	a4,0(s1)
    80004a08:	0017879b          	addiw	a5,a5,1
    80004a0c:	06f52c23          	sw	a5,120(a0)
    80004a10:	04071063          	bnez	a4,80004a50 <acquire+0x94>
    80004a14:	00100713          	li	a4,1
    80004a18:	00070793          	mv	a5,a4
    80004a1c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80004a20:	0007879b          	sext.w	a5,a5
    80004a24:	fe079ae3          	bnez	a5,80004a18 <acquire+0x5c>
    80004a28:	0ff0000f          	fence
    80004a2c:	fffff097          	auipc	ra,0xfffff
    80004a30:	8a4080e7          	jalr	-1884(ra) # 800032d0 <mycpu>
    80004a34:	01813083          	ld	ra,24(sp)
    80004a38:	01013403          	ld	s0,16(sp)
    80004a3c:	00a4b823          	sd	a0,16(s1)
    80004a40:	00013903          	ld	s2,0(sp)
    80004a44:	00813483          	ld	s1,8(sp)
    80004a48:	02010113          	addi	sp,sp,32
    80004a4c:	00008067          	ret
    80004a50:	0104b903          	ld	s2,16(s1)
    80004a54:	fffff097          	auipc	ra,0xfffff
    80004a58:	87c080e7          	jalr	-1924(ra) # 800032d0 <mycpu>
    80004a5c:	faa91ce3          	bne	s2,a0,80004a14 <acquire+0x58>
    80004a60:	00002517          	auipc	a0,0x2
    80004a64:	98850513          	addi	a0,a0,-1656 # 800063e8 <digits+0x20>
    80004a68:	fffff097          	auipc	ra,0xfffff
    80004a6c:	224080e7          	jalr	548(ra) # 80003c8c <panic>
    80004a70:	00195913          	srli	s2,s2,0x1
    80004a74:	fffff097          	auipc	ra,0xfffff
    80004a78:	85c080e7          	jalr	-1956(ra) # 800032d0 <mycpu>
    80004a7c:	00197913          	andi	s2,s2,1
    80004a80:	07252e23          	sw	s2,124(a0)
    80004a84:	f75ff06f          	j	800049f8 <acquire+0x3c>

0000000080004a88 <release>:
    80004a88:	fe010113          	addi	sp,sp,-32
    80004a8c:	00813823          	sd	s0,16(sp)
    80004a90:	00113c23          	sd	ra,24(sp)
    80004a94:	00913423          	sd	s1,8(sp)
    80004a98:	01213023          	sd	s2,0(sp)
    80004a9c:	02010413          	addi	s0,sp,32
    80004aa0:	00052783          	lw	a5,0(a0)
    80004aa4:	00079a63          	bnez	a5,80004ab8 <release+0x30>
    80004aa8:	00002517          	auipc	a0,0x2
    80004aac:	94850513          	addi	a0,a0,-1720 # 800063f0 <digits+0x28>
    80004ab0:	fffff097          	auipc	ra,0xfffff
    80004ab4:	1dc080e7          	jalr	476(ra) # 80003c8c <panic>
    80004ab8:	01053903          	ld	s2,16(a0)
    80004abc:	00050493          	mv	s1,a0
    80004ac0:	fffff097          	auipc	ra,0xfffff
    80004ac4:	810080e7          	jalr	-2032(ra) # 800032d0 <mycpu>
    80004ac8:	fea910e3          	bne	s2,a0,80004aa8 <release+0x20>
    80004acc:	0004b823          	sd	zero,16(s1)
    80004ad0:	0ff0000f          	fence
    80004ad4:	0f50000f          	fence	iorw,ow
    80004ad8:	0804a02f          	amoswap.w	zero,zero,(s1)
    80004adc:	ffffe097          	auipc	ra,0xffffe
    80004ae0:	7f4080e7          	jalr	2036(ra) # 800032d0 <mycpu>
    80004ae4:	100027f3          	csrr	a5,sstatus
    80004ae8:	0027f793          	andi	a5,a5,2
    80004aec:	04079a63          	bnez	a5,80004b40 <release+0xb8>
    80004af0:	07852783          	lw	a5,120(a0)
    80004af4:	02f05e63          	blez	a5,80004b30 <release+0xa8>
    80004af8:	fff7871b          	addiw	a4,a5,-1
    80004afc:	06e52c23          	sw	a4,120(a0)
    80004b00:	00071c63          	bnez	a4,80004b18 <release+0x90>
    80004b04:	07c52783          	lw	a5,124(a0)
    80004b08:	00078863          	beqz	a5,80004b18 <release+0x90>
    80004b0c:	100027f3          	csrr	a5,sstatus
    80004b10:	0027e793          	ori	a5,a5,2
    80004b14:	10079073          	csrw	sstatus,a5
    80004b18:	01813083          	ld	ra,24(sp)
    80004b1c:	01013403          	ld	s0,16(sp)
    80004b20:	00813483          	ld	s1,8(sp)
    80004b24:	00013903          	ld	s2,0(sp)
    80004b28:	02010113          	addi	sp,sp,32
    80004b2c:	00008067          	ret
    80004b30:	00002517          	auipc	a0,0x2
    80004b34:	8e050513          	addi	a0,a0,-1824 # 80006410 <digits+0x48>
    80004b38:	fffff097          	auipc	ra,0xfffff
    80004b3c:	154080e7          	jalr	340(ra) # 80003c8c <panic>
    80004b40:	00002517          	auipc	a0,0x2
    80004b44:	8b850513          	addi	a0,a0,-1864 # 800063f8 <digits+0x30>
    80004b48:	fffff097          	auipc	ra,0xfffff
    80004b4c:	144080e7          	jalr	324(ra) # 80003c8c <panic>

0000000080004b50 <holding>:
    80004b50:	00052783          	lw	a5,0(a0)
    80004b54:	00079663          	bnez	a5,80004b60 <holding+0x10>
    80004b58:	00000513          	li	a0,0
    80004b5c:	00008067          	ret
    80004b60:	fe010113          	addi	sp,sp,-32
    80004b64:	00813823          	sd	s0,16(sp)
    80004b68:	00913423          	sd	s1,8(sp)
    80004b6c:	00113c23          	sd	ra,24(sp)
    80004b70:	02010413          	addi	s0,sp,32
    80004b74:	01053483          	ld	s1,16(a0)
    80004b78:	ffffe097          	auipc	ra,0xffffe
    80004b7c:	758080e7          	jalr	1880(ra) # 800032d0 <mycpu>
    80004b80:	01813083          	ld	ra,24(sp)
    80004b84:	01013403          	ld	s0,16(sp)
    80004b88:	40a48533          	sub	a0,s1,a0
    80004b8c:	00153513          	seqz	a0,a0
    80004b90:	00813483          	ld	s1,8(sp)
    80004b94:	02010113          	addi	sp,sp,32
    80004b98:	00008067          	ret

0000000080004b9c <push_off>:
    80004b9c:	fe010113          	addi	sp,sp,-32
    80004ba0:	00813823          	sd	s0,16(sp)
    80004ba4:	00113c23          	sd	ra,24(sp)
    80004ba8:	00913423          	sd	s1,8(sp)
    80004bac:	02010413          	addi	s0,sp,32
    80004bb0:	100024f3          	csrr	s1,sstatus
    80004bb4:	100027f3          	csrr	a5,sstatus
    80004bb8:	ffd7f793          	andi	a5,a5,-3
    80004bbc:	10079073          	csrw	sstatus,a5
    80004bc0:	ffffe097          	auipc	ra,0xffffe
    80004bc4:	710080e7          	jalr	1808(ra) # 800032d0 <mycpu>
    80004bc8:	07852783          	lw	a5,120(a0)
    80004bcc:	02078663          	beqz	a5,80004bf8 <push_off+0x5c>
    80004bd0:	ffffe097          	auipc	ra,0xffffe
    80004bd4:	700080e7          	jalr	1792(ra) # 800032d0 <mycpu>
    80004bd8:	07852783          	lw	a5,120(a0)
    80004bdc:	01813083          	ld	ra,24(sp)
    80004be0:	01013403          	ld	s0,16(sp)
    80004be4:	0017879b          	addiw	a5,a5,1
    80004be8:	06f52c23          	sw	a5,120(a0)
    80004bec:	00813483          	ld	s1,8(sp)
    80004bf0:	02010113          	addi	sp,sp,32
    80004bf4:	00008067          	ret
    80004bf8:	0014d493          	srli	s1,s1,0x1
    80004bfc:	ffffe097          	auipc	ra,0xffffe
    80004c00:	6d4080e7          	jalr	1748(ra) # 800032d0 <mycpu>
    80004c04:	0014f493          	andi	s1,s1,1
    80004c08:	06952e23          	sw	s1,124(a0)
    80004c0c:	fc5ff06f          	j	80004bd0 <push_off+0x34>

0000000080004c10 <pop_off>:
    80004c10:	ff010113          	addi	sp,sp,-16
    80004c14:	00813023          	sd	s0,0(sp)
    80004c18:	00113423          	sd	ra,8(sp)
    80004c1c:	01010413          	addi	s0,sp,16
    80004c20:	ffffe097          	auipc	ra,0xffffe
    80004c24:	6b0080e7          	jalr	1712(ra) # 800032d0 <mycpu>
    80004c28:	100027f3          	csrr	a5,sstatus
    80004c2c:	0027f793          	andi	a5,a5,2
    80004c30:	04079663          	bnez	a5,80004c7c <pop_off+0x6c>
    80004c34:	07852783          	lw	a5,120(a0)
    80004c38:	02f05a63          	blez	a5,80004c6c <pop_off+0x5c>
    80004c3c:	fff7871b          	addiw	a4,a5,-1
    80004c40:	06e52c23          	sw	a4,120(a0)
    80004c44:	00071c63          	bnez	a4,80004c5c <pop_off+0x4c>
    80004c48:	07c52783          	lw	a5,124(a0)
    80004c4c:	00078863          	beqz	a5,80004c5c <pop_off+0x4c>
    80004c50:	100027f3          	csrr	a5,sstatus
    80004c54:	0027e793          	ori	a5,a5,2
    80004c58:	10079073          	csrw	sstatus,a5
    80004c5c:	00813083          	ld	ra,8(sp)
    80004c60:	00013403          	ld	s0,0(sp)
    80004c64:	01010113          	addi	sp,sp,16
    80004c68:	00008067          	ret
    80004c6c:	00001517          	auipc	a0,0x1
    80004c70:	7a450513          	addi	a0,a0,1956 # 80006410 <digits+0x48>
    80004c74:	fffff097          	auipc	ra,0xfffff
    80004c78:	018080e7          	jalr	24(ra) # 80003c8c <panic>
    80004c7c:	00001517          	auipc	a0,0x1
    80004c80:	77c50513          	addi	a0,a0,1916 # 800063f8 <digits+0x30>
    80004c84:	fffff097          	auipc	ra,0xfffff
    80004c88:	008080e7          	jalr	8(ra) # 80003c8c <panic>

0000000080004c8c <push_on>:
    80004c8c:	fe010113          	addi	sp,sp,-32
    80004c90:	00813823          	sd	s0,16(sp)
    80004c94:	00113c23          	sd	ra,24(sp)
    80004c98:	00913423          	sd	s1,8(sp)
    80004c9c:	02010413          	addi	s0,sp,32
    80004ca0:	100024f3          	csrr	s1,sstatus
    80004ca4:	100027f3          	csrr	a5,sstatus
    80004ca8:	0027e793          	ori	a5,a5,2
    80004cac:	10079073          	csrw	sstatus,a5
    80004cb0:	ffffe097          	auipc	ra,0xffffe
    80004cb4:	620080e7          	jalr	1568(ra) # 800032d0 <mycpu>
    80004cb8:	07852783          	lw	a5,120(a0)
    80004cbc:	02078663          	beqz	a5,80004ce8 <push_on+0x5c>
    80004cc0:	ffffe097          	auipc	ra,0xffffe
    80004cc4:	610080e7          	jalr	1552(ra) # 800032d0 <mycpu>
    80004cc8:	07852783          	lw	a5,120(a0)
    80004ccc:	01813083          	ld	ra,24(sp)
    80004cd0:	01013403          	ld	s0,16(sp)
    80004cd4:	0017879b          	addiw	a5,a5,1
    80004cd8:	06f52c23          	sw	a5,120(a0)
    80004cdc:	00813483          	ld	s1,8(sp)
    80004ce0:	02010113          	addi	sp,sp,32
    80004ce4:	00008067          	ret
    80004ce8:	0014d493          	srli	s1,s1,0x1
    80004cec:	ffffe097          	auipc	ra,0xffffe
    80004cf0:	5e4080e7          	jalr	1508(ra) # 800032d0 <mycpu>
    80004cf4:	0014f493          	andi	s1,s1,1
    80004cf8:	06952e23          	sw	s1,124(a0)
    80004cfc:	fc5ff06f          	j	80004cc0 <push_on+0x34>

0000000080004d00 <pop_on>:
    80004d00:	ff010113          	addi	sp,sp,-16
    80004d04:	00813023          	sd	s0,0(sp)
    80004d08:	00113423          	sd	ra,8(sp)
    80004d0c:	01010413          	addi	s0,sp,16
    80004d10:	ffffe097          	auipc	ra,0xffffe
    80004d14:	5c0080e7          	jalr	1472(ra) # 800032d0 <mycpu>
    80004d18:	100027f3          	csrr	a5,sstatus
    80004d1c:	0027f793          	andi	a5,a5,2
    80004d20:	04078463          	beqz	a5,80004d68 <pop_on+0x68>
    80004d24:	07852783          	lw	a5,120(a0)
    80004d28:	02f05863          	blez	a5,80004d58 <pop_on+0x58>
    80004d2c:	fff7879b          	addiw	a5,a5,-1
    80004d30:	06f52c23          	sw	a5,120(a0)
    80004d34:	07853783          	ld	a5,120(a0)
    80004d38:	00079863          	bnez	a5,80004d48 <pop_on+0x48>
    80004d3c:	100027f3          	csrr	a5,sstatus
    80004d40:	ffd7f793          	andi	a5,a5,-3
    80004d44:	10079073          	csrw	sstatus,a5
    80004d48:	00813083          	ld	ra,8(sp)
    80004d4c:	00013403          	ld	s0,0(sp)
    80004d50:	01010113          	addi	sp,sp,16
    80004d54:	00008067          	ret
    80004d58:	00001517          	auipc	a0,0x1
    80004d5c:	6e050513          	addi	a0,a0,1760 # 80006438 <digits+0x70>
    80004d60:	fffff097          	auipc	ra,0xfffff
    80004d64:	f2c080e7          	jalr	-212(ra) # 80003c8c <panic>
    80004d68:	00001517          	auipc	a0,0x1
    80004d6c:	6b050513          	addi	a0,a0,1712 # 80006418 <digits+0x50>
    80004d70:	fffff097          	auipc	ra,0xfffff
    80004d74:	f1c080e7          	jalr	-228(ra) # 80003c8c <panic>

0000000080004d78 <__memset>:
    80004d78:	ff010113          	addi	sp,sp,-16
    80004d7c:	00813423          	sd	s0,8(sp)
    80004d80:	01010413          	addi	s0,sp,16
    80004d84:	1a060e63          	beqz	a2,80004f40 <__memset+0x1c8>
    80004d88:	40a007b3          	neg	a5,a0
    80004d8c:	0077f793          	andi	a5,a5,7
    80004d90:	00778693          	addi	a3,a5,7
    80004d94:	00b00813          	li	a6,11
    80004d98:	0ff5f593          	andi	a1,a1,255
    80004d9c:	fff6071b          	addiw	a4,a2,-1
    80004da0:	1b06e663          	bltu	a3,a6,80004f4c <__memset+0x1d4>
    80004da4:	1cd76463          	bltu	a4,a3,80004f6c <__memset+0x1f4>
    80004da8:	1a078e63          	beqz	a5,80004f64 <__memset+0x1ec>
    80004dac:	00b50023          	sb	a1,0(a0)
    80004db0:	00100713          	li	a4,1
    80004db4:	1ae78463          	beq	a5,a4,80004f5c <__memset+0x1e4>
    80004db8:	00b500a3          	sb	a1,1(a0)
    80004dbc:	00200713          	li	a4,2
    80004dc0:	1ae78a63          	beq	a5,a4,80004f74 <__memset+0x1fc>
    80004dc4:	00b50123          	sb	a1,2(a0)
    80004dc8:	00300713          	li	a4,3
    80004dcc:	18e78463          	beq	a5,a4,80004f54 <__memset+0x1dc>
    80004dd0:	00b501a3          	sb	a1,3(a0)
    80004dd4:	00400713          	li	a4,4
    80004dd8:	1ae78263          	beq	a5,a4,80004f7c <__memset+0x204>
    80004ddc:	00b50223          	sb	a1,4(a0)
    80004de0:	00500713          	li	a4,5
    80004de4:	1ae78063          	beq	a5,a4,80004f84 <__memset+0x20c>
    80004de8:	00b502a3          	sb	a1,5(a0)
    80004dec:	00700713          	li	a4,7
    80004df0:	18e79e63          	bne	a5,a4,80004f8c <__memset+0x214>
    80004df4:	00b50323          	sb	a1,6(a0)
    80004df8:	00700e93          	li	t4,7
    80004dfc:	00859713          	slli	a4,a1,0x8
    80004e00:	00e5e733          	or	a4,a1,a4
    80004e04:	01059e13          	slli	t3,a1,0x10
    80004e08:	01c76e33          	or	t3,a4,t3
    80004e0c:	01859313          	slli	t1,a1,0x18
    80004e10:	006e6333          	or	t1,t3,t1
    80004e14:	02059893          	slli	a7,a1,0x20
    80004e18:	40f60e3b          	subw	t3,a2,a5
    80004e1c:	011368b3          	or	a7,t1,a7
    80004e20:	02859813          	slli	a6,a1,0x28
    80004e24:	0108e833          	or	a6,a7,a6
    80004e28:	03059693          	slli	a3,a1,0x30
    80004e2c:	003e589b          	srliw	a7,t3,0x3
    80004e30:	00d866b3          	or	a3,a6,a3
    80004e34:	03859713          	slli	a4,a1,0x38
    80004e38:	00389813          	slli	a6,a7,0x3
    80004e3c:	00f507b3          	add	a5,a0,a5
    80004e40:	00e6e733          	or	a4,a3,a4
    80004e44:	000e089b          	sext.w	a7,t3
    80004e48:	00f806b3          	add	a3,a6,a5
    80004e4c:	00e7b023          	sd	a4,0(a5)
    80004e50:	00878793          	addi	a5,a5,8
    80004e54:	fed79ce3          	bne	a5,a3,80004e4c <__memset+0xd4>
    80004e58:	ff8e7793          	andi	a5,t3,-8
    80004e5c:	0007871b          	sext.w	a4,a5
    80004e60:	01d787bb          	addw	a5,a5,t4
    80004e64:	0ce88e63          	beq	a7,a4,80004f40 <__memset+0x1c8>
    80004e68:	00f50733          	add	a4,a0,a5
    80004e6c:	00b70023          	sb	a1,0(a4)
    80004e70:	0017871b          	addiw	a4,a5,1
    80004e74:	0cc77663          	bgeu	a4,a2,80004f40 <__memset+0x1c8>
    80004e78:	00e50733          	add	a4,a0,a4
    80004e7c:	00b70023          	sb	a1,0(a4)
    80004e80:	0027871b          	addiw	a4,a5,2
    80004e84:	0ac77e63          	bgeu	a4,a2,80004f40 <__memset+0x1c8>
    80004e88:	00e50733          	add	a4,a0,a4
    80004e8c:	00b70023          	sb	a1,0(a4)
    80004e90:	0037871b          	addiw	a4,a5,3
    80004e94:	0ac77663          	bgeu	a4,a2,80004f40 <__memset+0x1c8>
    80004e98:	00e50733          	add	a4,a0,a4
    80004e9c:	00b70023          	sb	a1,0(a4)
    80004ea0:	0047871b          	addiw	a4,a5,4
    80004ea4:	08c77e63          	bgeu	a4,a2,80004f40 <__memset+0x1c8>
    80004ea8:	00e50733          	add	a4,a0,a4
    80004eac:	00b70023          	sb	a1,0(a4)
    80004eb0:	0057871b          	addiw	a4,a5,5
    80004eb4:	08c77663          	bgeu	a4,a2,80004f40 <__memset+0x1c8>
    80004eb8:	00e50733          	add	a4,a0,a4
    80004ebc:	00b70023          	sb	a1,0(a4)
    80004ec0:	0067871b          	addiw	a4,a5,6
    80004ec4:	06c77e63          	bgeu	a4,a2,80004f40 <__memset+0x1c8>
    80004ec8:	00e50733          	add	a4,a0,a4
    80004ecc:	00b70023          	sb	a1,0(a4)
    80004ed0:	0077871b          	addiw	a4,a5,7
    80004ed4:	06c77663          	bgeu	a4,a2,80004f40 <__memset+0x1c8>
    80004ed8:	00e50733          	add	a4,a0,a4
    80004edc:	00b70023          	sb	a1,0(a4)
    80004ee0:	0087871b          	addiw	a4,a5,8
    80004ee4:	04c77e63          	bgeu	a4,a2,80004f40 <__memset+0x1c8>
    80004ee8:	00e50733          	add	a4,a0,a4
    80004eec:	00b70023          	sb	a1,0(a4)
    80004ef0:	0097871b          	addiw	a4,a5,9
    80004ef4:	04c77663          	bgeu	a4,a2,80004f40 <__memset+0x1c8>
    80004ef8:	00e50733          	add	a4,a0,a4
    80004efc:	00b70023          	sb	a1,0(a4)
    80004f00:	00a7871b          	addiw	a4,a5,10
    80004f04:	02c77e63          	bgeu	a4,a2,80004f40 <__memset+0x1c8>
    80004f08:	00e50733          	add	a4,a0,a4
    80004f0c:	00b70023          	sb	a1,0(a4)
    80004f10:	00b7871b          	addiw	a4,a5,11
    80004f14:	02c77663          	bgeu	a4,a2,80004f40 <__memset+0x1c8>
    80004f18:	00e50733          	add	a4,a0,a4
    80004f1c:	00b70023          	sb	a1,0(a4)
    80004f20:	00c7871b          	addiw	a4,a5,12
    80004f24:	00c77e63          	bgeu	a4,a2,80004f40 <__memset+0x1c8>
    80004f28:	00e50733          	add	a4,a0,a4
    80004f2c:	00b70023          	sb	a1,0(a4)
    80004f30:	00d7879b          	addiw	a5,a5,13
    80004f34:	00c7f663          	bgeu	a5,a2,80004f40 <__memset+0x1c8>
    80004f38:	00f507b3          	add	a5,a0,a5
    80004f3c:	00b78023          	sb	a1,0(a5)
    80004f40:	00813403          	ld	s0,8(sp)
    80004f44:	01010113          	addi	sp,sp,16
    80004f48:	00008067          	ret
    80004f4c:	00b00693          	li	a3,11
    80004f50:	e55ff06f          	j	80004da4 <__memset+0x2c>
    80004f54:	00300e93          	li	t4,3
    80004f58:	ea5ff06f          	j	80004dfc <__memset+0x84>
    80004f5c:	00100e93          	li	t4,1
    80004f60:	e9dff06f          	j	80004dfc <__memset+0x84>
    80004f64:	00000e93          	li	t4,0
    80004f68:	e95ff06f          	j	80004dfc <__memset+0x84>
    80004f6c:	00000793          	li	a5,0
    80004f70:	ef9ff06f          	j	80004e68 <__memset+0xf0>
    80004f74:	00200e93          	li	t4,2
    80004f78:	e85ff06f          	j	80004dfc <__memset+0x84>
    80004f7c:	00400e93          	li	t4,4
    80004f80:	e7dff06f          	j	80004dfc <__memset+0x84>
    80004f84:	00500e93          	li	t4,5
    80004f88:	e75ff06f          	j	80004dfc <__memset+0x84>
    80004f8c:	00600e93          	li	t4,6
    80004f90:	e6dff06f          	j	80004dfc <__memset+0x84>

0000000080004f94 <__memmove>:
    80004f94:	ff010113          	addi	sp,sp,-16
    80004f98:	00813423          	sd	s0,8(sp)
    80004f9c:	01010413          	addi	s0,sp,16
    80004fa0:	0e060863          	beqz	a2,80005090 <__memmove+0xfc>
    80004fa4:	fff6069b          	addiw	a3,a2,-1
    80004fa8:	0006881b          	sext.w	a6,a3
    80004fac:	0ea5e863          	bltu	a1,a0,8000509c <__memmove+0x108>
    80004fb0:	00758713          	addi	a4,a1,7
    80004fb4:	00a5e7b3          	or	a5,a1,a0
    80004fb8:	40a70733          	sub	a4,a4,a0
    80004fbc:	0077f793          	andi	a5,a5,7
    80004fc0:	00f73713          	sltiu	a4,a4,15
    80004fc4:	00174713          	xori	a4,a4,1
    80004fc8:	0017b793          	seqz	a5,a5
    80004fcc:	00e7f7b3          	and	a5,a5,a4
    80004fd0:	10078863          	beqz	a5,800050e0 <__memmove+0x14c>
    80004fd4:	00900793          	li	a5,9
    80004fd8:	1107f463          	bgeu	a5,a6,800050e0 <__memmove+0x14c>
    80004fdc:	0036581b          	srliw	a6,a2,0x3
    80004fe0:	fff8081b          	addiw	a6,a6,-1
    80004fe4:	02081813          	slli	a6,a6,0x20
    80004fe8:	01d85893          	srli	a7,a6,0x1d
    80004fec:	00858813          	addi	a6,a1,8
    80004ff0:	00058793          	mv	a5,a1
    80004ff4:	00050713          	mv	a4,a0
    80004ff8:	01088833          	add	a6,a7,a6
    80004ffc:	0007b883          	ld	a7,0(a5)
    80005000:	00878793          	addi	a5,a5,8
    80005004:	00870713          	addi	a4,a4,8
    80005008:	ff173c23          	sd	a7,-8(a4)
    8000500c:	ff0798e3          	bne	a5,a6,80004ffc <__memmove+0x68>
    80005010:	ff867713          	andi	a4,a2,-8
    80005014:	02071793          	slli	a5,a4,0x20
    80005018:	0207d793          	srli	a5,a5,0x20
    8000501c:	00f585b3          	add	a1,a1,a5
    80005020:	40e686bb          	subw	a3,a3,a4
    80005024:	00f507b3          	add	a5,a0,a5
    80005028:	06e60463          	beq	a2,a4,80005090 <__memmove+0xfc>
    8000502c:	0005c703          	lbu	a4,0(a1)
    80005030:	00e78023          	sb	a4,0(a5)
    80005034:	04068e63          	beqz	a3,80005090 <__memmove+0xfc>
    80005038:	0015c603          	lbu	a2,1(a1)
    8000503c:	00100713          	li	a4,1
    80005040:	00c780a3          	sb	a2,1(a5)
    80005044:	04e68663          	beq	a3,a4,80005090 <__memmove+0xfc>
    80005048:	0025c603          	lbu	a2,2(a1)
    8000504c:	00200713          	li	a4,2
    80005050:	00c78123          	sb	a2,2(a5)
    80005054:	02e68e63          	beq	a3,a4,80005090 <__memmove+0xfc>
    80005058:	0035c603          	lbu	a2,3(a1)
    8000505c:	00300713          	li	a4,3
    80005060:	00c781a3          	sb	a2,3(a5)
    80005064:	02e68663          	beq	a3,a4,80005090 <__memmove+0xfc>
    80005068:	0045c603          	lbu	a2,4(a1)
    8000506c:	00400713          	li	a4,4
    80005070:	00c78223          	sb	a2,4(a5)
    80005074:	00e68e63          	beq	a3,a4,80005090 <__memmove+0xfc>
    80005078:	0055c603          	lbu	a2,5(a1)
    8000507c:	00500713          	li	a4,5
    80005080:	00c782a3          	sb	a2,5(a5)
    80005084:	00e68663          	beq	a3,a4,80005090 <__memmove+0xfc>
    80005088:	0065c703          	lbu	a4,6(a1)
    8000508c:	00e78323          	sb	a4,6(a5)
    80005090:	00813403          	ld	s0,8(sp)
    80005094:	01010113          	addi	sp,sp,16
    80005098:	00008067          	ret
    8000509c:	02061713          	slli	a4,a2,0x20
    800050a0:	02075713          	srli	a4,a4,0x20
    800050a4:	00e587b3          	add	a5,a1,a4
    800050a8:	f0f574e3          	bgeu	a0,a5,80004fb0 <__memmove+0x1c>
    800050ac:	02069613          	slli	a2,a3,0x20
    800050b0:	02065613          	srli	a2,a2,0x20
    800050b4:	fff64613          	not	a2,a2
    800050b8:	00e50733          	add	a4,a0,a4
    800050bc:	00c78633          	add	a2,a5,a2
    800050c0:	fff7c683          	lbu	a3,-1(a5)
    800050c4:	fff78793          	addi	a5,a5,-1
    800050c8:	fff70713          	addi	a4,a4,-1
    800050cc:	00d70023          	sb	a3,0(a4)
    800050d0:	fec798e3          	bne	a5,a2,800050c0 <__memmove+0x12c>
    800050d4:	00813403          	ld	s0,8(sp)
    800050d8:	01010113          	addi	sp,sp,16
    800050dc:	00008067          	ret
    800050e0:	02069713          	slli	a4,a3,0x20
    800050e4:	02075713          	srli	a4,a4,0x20
    800050e8:	00170713          	addi	a4,a4,1
    800050ec:	00e50733          	add	a4,a0,a4
    800050f0:	00050793          	mv	a5,a0
    800050f4:	0005c683          	lbu	a3,0(a1)
    800050f8:	00178793          	addi	a5,a5,1
    800050fc:	00158593          	addi	a1,a1,1
    80005100:	fed78fa3          	sb	a3,-1(a5)
    80005104:	fee798e3          	bne	a5,a4,800050f4 <__memmove+0x160>
    80005108:	f89ff06f          	j	80005090 <__memmove+0xfc>

000000008000510c <__putc>:
    8000510c:	fe010113          	addi	sp,sp,-32
    80005110:	00813823          	sd	s0,16(sp)
    80005114:	00113c23          	sd	ra,24(sp)
    80005118:	02010413          	addi	s0,sp,32
    8000511c:	00050793          	mv	a5,a0
    80005120:	fef40593          	addi	a1,s0,-17
    80005124:	00100613          	li	a2,1
    80005128:	00000513          	li	a0,0
    8000512c:	fef407a3          	sb	a5,-17(s0)
    80005130:	fffff097          	auipc	ra,0xfffff
    80005134:	b3c080e7          	jalr	-1220(ra) # 80003c6c <console_write>
    80005138:	01813083          	ld	ra,24(sp)
    8000513c:	01013403          	ld	s0,16(sp)
    80005140:	02010113          	addi	sp,sp,32
    80005144:	00008067          	ret

0000000080005148 <__getc>:
    80005148:	fe010113          	addi	sp,sp,-32
    8000514c:	00813823          	sd	s0,16(sp)
    80005150:	00113c23          	sd	ra,24(sp)
    80005154:	02010413          	addi	s0,sp,32
    80005158:	fe840593          	addi	a1,s0,-24
    8000515c:	00100613          	li	a2,1
    80005160:	00000513          	li	a0,0
    80005164:	fffff097          	auipc	ra,0xfffff
    80005168:	ae8080e7          	jalr	-1304(ra) # 80003c4c <console_read>
    8000516c:	fe844503          	lbu	a0,-24(s0)
    80005170:	01813083          	ld	ra,24(sp)
    80005174:	01013403          	ld	s0,16(sp)
    80005178:	02010113          	addi	sp,sp,32
    8000517c:	00008067          	ret

0000000080005180 <console_handler>:
    80005180:	fe010113          	addi	sp,sp,-32
    80005184:	00813823          	sd	s0,16(sp)
    80005188:	00113c23          	sd	ra,24(sp)
    8000518c:	00913423          	sd	s1,8(sp)
    80005190:	02010413          	addi	s0,sp,32
    80005194:	14202773          	csrr	a4,scause
    80005198:	100027f3          	csrr	a5,sstatus
    8000519c:	0027f793          	andi	a5,a5,2
    800051a0:	06079e63          	bnez	a5,8000521c <console_handler+0x9c>
    800051a4:	00074c63          	bltz	a4,800051bc <console_handler+0x3c>
    800051a8:	01813083          	ld	ra,24(sp)
    800051ac:	01013403          	ld	s0,16(sp)
    800051b0:	00813483          	ld	s1,8(sp)
    800051b4:	02010113          	addi	sp,sp,32
    800051b8:	00008067          	ret
    800051bc:	0ff77713          	andi	a4,a4,255
    800051c0:	00900793          	li	a5,9
    800051c4:	fef712e3          	bne	a4,a5,800051a8 <console_handler+0x28>
    800051c8:	ffffe097          	auipc	ra,0xffffe
    800051cc:	6dc080e7          	jalr	1756(ra) # 800038a4 <plic_claim>
    800051d0:	00a00793          	li	a5,10
    800051d4:	00050493          	mv	s1,a0
    800051d8:	02f50c63          	beq	a0,a5,80005210 <console_handler+0x90>
    800051dc:	fc0506e3          	beqz	a0,800051a8 <console_handler+0x28>
    800051e0:	00050593          	mv	a1,a0
    800051e4:	00001517          	auipc	a0,0x1
    800051e8:	15c50513          	addi	a0,a0,348 # 80006340 <CONSOLE_STATUS+0x330>
    800051ec:	fffff097          	auipc	ra,0xfffff
    800051f0:	afc080e7          	jalr	-1284(ra) # 80003ce8 <__printf>
    800051f4:	01013403          	ld	s0,16(sp)
    800051f8:	01813083          	ld	ra,24(sp)
    800051fc:	00048513          	mv	a0,s1
    80005200:	00813483          	ld	s1,8(sp)
    80005204:	02010113          	addi	sp,sp,32
    80005208:	ffffe317          	auipc	t1,0xffffe
    8000520c:	6d430067          	jr	1748(t1) # 800038dc <plic_complete>
    80005210:	fffff097          	auipc	ra,0xfffff
    80005214:	3e0080e7          	jalr	992(ra) # 800045f0 <uartintr>
    80005218:	fddff06f          	j	800051f4 <console_handler+0x74>
    8000521c:	00001517          	auipc	a0,0x1
    80005220:	22450513          	addi	a0,a0,548 # 80006440 <digits+0x78>
    80005224:	fffff097          	auipc	ra,0xfffff
    80005228:	a68080e7          	jalr	-1432(ra) # 80003c8c <panic>
	...
