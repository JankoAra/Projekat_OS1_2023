
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00007117          	auipc	sp,0x7
    80000004:	37813103          	ld	sp,888(sp) # 80007378 <_GLOBAL_OFFSET_TABLE_+0x28>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	1cc030ef          	jal	ra,800031e8 <start>

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
    800015f8:	dfc7b783          	ld	a5,-516(a5) # 800073f0 <_ZN9Scheduler4tailE>
    800015fc:	00078e63          	beqz	a5,80001618 <_ZN9Scheduler3putEP3TCB+0x30>
		head = tail = tcb;
	} else {
		tail->nextInScheduler = tcb;
    80001600:	02a7bc23          	sd	a0,56(a5)
		tail = tcb;
    80001604:	00006797          	auipc	a5,0x6
    80001608:	dea7b623          	sd	a0,-532(a5) # 800073f0 <_ZN9Scheduler4tailE>
	}
}
    8000160c:	00813403          	ld	s0,8(sp)
    80001610:	01010113          	addi	sp,sp,16
    80001614:	00008067          	ret
		head = tail = tcb;
    80001618:	00006797          	auipc	a5,0x6
    8000161c:	dd878793          	addi	a5,a5,-552 # 800073f0 <_ZN9Scheduler4tailE>
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
    8000163c:	db870713          	addi	a4,a4,-584 # 800073f0 <_ZN9Scheduler4tailE>
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
    8000167c:	d8883803          	ld	a6,-632(a6) # 80007400 <_ZN9Scheduler12sleepingHeadE>
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
    800016b4:	d4a7b823          	sd	a0,-688(a5) # 80007400 <_ZN9Scheduler12sleepingHeadE>
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
    800016fc:	d0a7b423          	sd	a0,-760(a5) # 80007400 <_ZN9Scheduler12sleepingHeadE>
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
    80001718:	cec7b783          	ld	a5,-788(a5) # 80007400 <_ZN9Scheduler12sleepingHeadE>
    8000171c:	06078a63          	beqz	a5,80001790 <_ZN9Scheduler4wakeEv+0x7c>
	sleepingHead->timeToSleep--;
    80001720:	0407b703          	ld	a4,64(a5)
    80001724:	fff70713          	addi	a4,a4,-1
    80001728:	04e7b023          	sd	a4,64(a5)
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    8000172c:	00006517          	auipc	a0,0x6
    80001730:	cd453503          	ld	a0,-812(a0) # 80007400 <_ZN9Scheduler12sleepingHeadE>
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
    80001764:	caf73023          	sd	a5,-864(a4) # 80007400 <_ZN9Scheduler12sleepingHeadE>
		thread->nextSleeping = nullptr;
    80001768:	04053423          	sd	zero,72(a0)
		Scheduler::put(thread);
    8000176c:	00000097          	auipc	ra,0x0
    80001770:	e7c080e7          	jalr	-388(ra) # 800015e8 <_ZN9Scheduler3putEP3TCB>
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001774:	00006517          	auipc	a0,0x6
    80001778:	c8c53503          	ld	a0,-884(a0) # 80007400 <_ZN9Scheduler12sleepingHeadE>
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
    800017ac:	bf87b783          	ld	a5,-1032(a5) # 800073a0 <_GLOBAL_OFFSET_TABLE_+0x50>
    800017b0:	00078513          	mv	a0,a5
    800017b4:	00000097          	auipc	ra,0x0
    800017b8:	228080e7          	jalr	552(ra) # 800019dc <_ZN5Riscv7w_stvecEm>

	sem_open(&semA, 0);
    800017bc:	00000593          	li	a1,0
    800017c0:	00006517          	auipc	a0,0x6
    800017c4:	c4850513          	addi	a0,a0,-952 # 80007408 <semA>
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
    80001804:	b907b783          	ld	a5,-1136(a5) # 80007390 <_GLOBAL_OFFSET_TABLE_+0x40>
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
    800018e0:	aac5b583          	ld	a1,-1364(a1) # 80007388 <_GLOBAL_OFFSET_TABLE_+0x38>
    800018e4:	00078513          	mv	a0,a5
    800018e8:	00000097          	auipc	ra,0x0
    800018ec:	a78080e7          	jalr	-1416(ra) # 80001360 <_Z13thread_createPP3TCBPFvPvES2_>
	thread_create(&nitred2, nit2f, arg);
    800018f0:	f9840793          	addi	a5,s0,-104
    800018f4:	fc043603          	ld	a2,-64(s0)
    800018f8:	00006597          	auipc	a1,0x6
    800018fc:	a785b583          	ld	a1,-1416(a1) # 80007370 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001900:	00078513          	mv	a0,a5
    80001904:	00000097          	auipc	ra,0x0
    80001908:	a5c080e7          	jalr	-1444(ra) # 80001360 <_Z13thread_createPP3TCBPFvPvES2_>
	thread_create(&nitred3, nit3f, nullptr);
    8000190c:	fa040793          	addi	a5,s0,-96
    80001910:	00000613          	li	a2,0
    80001914:	00006597          	auipc	a1,0x6
    80001918:	a6c5b583          	ld	a1,-1428(a1) # 80007380 <_GLOBAL_OFFSET_TABLE_+0x30>
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
    80001ca8:	6ec7b783          	ld	a5,1772(a5) # 80007390 <_GLOBAL_OFFSET_TABLE_+0x40>
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
    80001d5c:	fb8080e7          	jalr	-72(ra) # 80002d10 <_ZN4KSem8closeSemEPS_>
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
    80001d94:	f3c080e7          	jalr	-196(ra) # 80002ccc <_ZN4KSem6signalEv>
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
    80001dcc:	5c87b783          	ld	a5,1480(a5) # 80007390 <_GLOBAL_OFFSET_TABLE_+0x40>
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
    80001df4:	4f8080e7          	jalr	1272(ra) # 800052e8 <__getc>
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
    80001e14:	49c080e7          	jalr	1180(ra) # 800052ac <__putc>
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
    80001e40:	470080e7          	jalr	1136(ra) # 800052ac <__putc>
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
    80001e8c:	44068693          	addi	a3,a3,1088 # 800072c8 <_ZZ16interruptRoutineE6digits>
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
    80001f34:	37c080e7          	jalr	892(ra) # 800052ac <__putc>
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
    80001fdc:	348080e7          	jalr	840(ra) # 80005320 <console_handler>
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
    80002004:	3607b783          	ld	a5,864(a5) # 80007360 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002008:	0007b783          	ld	a5,0(a5)
    8000200c:	00178713          	addi	a4,a5,1
    80002010:	00005797          	auipc	a5,0x5
    80002014:	3507b783          	ld	a5,848(a5) # 80007360 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002018:	00e7b023          	sd	a4,0(a5)
		if (TCB::runningTimeSlice >= TCB::running->getTimeSlice()) {
    8000201c:	00005797          	auipc	a5,0x5
    80002020:	3747b783          	ld	a5,884(a5) # 80007390 <_GLOBAL_OFFSET_TABLE_+0x40>
    80002024:	0007b783          	ld	a5,0(a5)
    80002028:	00078513          	mv	a0,a5
    8000202c:	00000097          	auipc	ra,0x0
    80002030:	130080e7          	jalr	304(ra) # 8000215c <_ZN3TCB12getTimeSliceEv>
    80002034:	00050713          	mv	a4,a0
    80002038:	00005797          	auipc	a5,0x5
    8000203c:	3287b783          	ld	a5,808(a5) # 80007360 <_GLOBAL_OFFSET_TABLE_+0x10>
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
    80002060:	3047b783          	ld	a5,772(a5) # 80007360 <_GLOBAL_OFFSET_TABLE_+0x10>
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
    800022c4:	05878793          	addi	a5,a5,88 # 80007318 <_ZTV6Thread+0x10>
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
    800023a4:	f7878793          	addi	a5,a5,-136 # 80007318 <_ZTV6Thread+0x10>
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
    800023c8:	f7c78793          	addi	a5,a5,-132 # 80007340 <_ZTV9Semaphore+0x10>
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
    80002450:	e9c78793          	addi	a5,a5,-356 # 800072e8 <_ZTV14PeriodicThread+0x10>
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
    800024e0:	e0c78793          	addi	a5,a5,-500 # 800072e8 <_ZTV14PeriodicThread+0x10>
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
    80002508:	de478793          	addi	a5,a5,-540 # 800072e8 <_ZTV14PeriodicThread+0x10>
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
    80002544:	ed07b783          	ld	a5,-304(a5) # 80007410 <_ZN3TCB7runningE>
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
    80002584:	e904b483          	ld	s1,-368(s1) # 80007410 <_ZN3TCB7runningE>
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
    800025b8:	e5c78793          	addi	a5,a5,-420 # 80007410 <_ZN3TCB7runningE>
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
    80002798:	c7c5b583          	ld	a1,-900(a1) # 80007410 <_ZN3TCB7runningE>
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
    800027c4:	c5053503          	ld	a0,-944(a0) # 80007410 <_ZN3TCB7runningE>
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
    800027fc:	c1853503          	ld	a0,-1000(a0) # 80007410 <_ZN3TCB7runningE>
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
    80002884:	ba07c783          	lbu	a5,-1120(a5) # 80007420 <_ZN15MemoryAllocator11initializedE>
    80002888:	04079863          	bnez	a5,800028d8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x68>
		freeMemHead = (FreeMemSegment*)HEAP_START_ADDR;
    8000288c:	00005617          	auipc	a2,0x5
    80002890:	adc63603          	ld	a2,-1316(a2) # 80007368 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002894:	00063783          	ld	a5,0(a2)
    80002898:	00005717          	auipc	a4,0x5
    8000289c:	b8870713          	addi	a4,a4,-1144 # 80007420 <_ZN15MemoryAllocator11initializedE>
    800028a0:	00f73423          	sd	a5,8(a4)
		freeMemHead->next = nullptr;
    800028a4:	0007b023          	sd	zero,0(a5)
		freeMemHead->prev = nullptr;
    800028a8:	00873683          	ld	a3,8(a4)
    800028ac:	0006b423          	sd	zero,8(a3)
		freeMemHead->size = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR - sizeof(FreeMemSegment);
    800028b0:	00005797          	auipc	a5,0x5
    800028b4:	ae87b783          	ld	a5,-1304(a5) # 80007398 <_GLOBAL_OFFSET_TABLE_+0x48>
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
    800028f4:	b3853503          	ld	a0,-1224(a0) # 80007428 <_ZN15MemoryAllocator11freeMemHeadE>
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
    80002934:	af873703          	ld	a4,-1288(a4) # 80007428 <_ZN15MemoryAllocator11freeMemHeadE>
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
    80002948:	aec6b683          	ld	a3,-1300(a3) # 80007430 <_ZN15MemoryAllocator11usedMemHeadE>
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
    80002974:	aad73c23          	sd	a3,-1352(a4) # 80007428 <_ZN15MemoryAllocator11freeMemHeadE>
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
    800029a4:	a8a7b823          	sd	a0,-1392(a5) # 80007430 <_ZN15MemoryAllocator11usedMemHeadE>
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
    80002a28:	a0c7b783          	ld	a5,-1524(a5) # 80007430 <_ZN15MemoryAllocator11usedMemHeadE>
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
    80002a74:	9b87b783          	ld	a5,-1608(a5) # 80007428 <_ZN15MemoryAllocator11freeMemHeadE>
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
    80002a9c:	98f73c23          	sd	a5,-1640(a4) # 80007430 <_ZN15MemoryAllocator11usedMemHeadE>
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
    80002b0c:	9207b783          	ld	a5,-1760(a5) # 80007428 <_ZN15MemoryAllocator11freeMemHeadE>
    80002b10:	fef6b423          	sd	a5,-24(a3)
    80002b14:	fb5ff06f          	j	80002ac8 <_ZN15MemoryAllocator5kfreeEPv+0xac>
	else freeMemHead = newFree;
    80002b18:	00005797          	auipc	a5,0x5
    80002b1c:	90a7b823          	sd	a0,-1776(a5) # 80007428 <_ZN15MemoryAllocator11freeMemHeadE>
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
void KSem::signal() {
	if (!working) return;
	if (val++ < 0) unblock();
}

void KSem::block() {
    80002c04:	ff010113          	addi	sp,sp,-16
    80002c08:	00113423          	sd	ra,8(sp)
    80002c0c:	00813023          	sd	s0,0(sp)
    80002c10:	01010413          	addi	s0,sp,16
	TCB::running->setBlocked(true);
    80002c14:	00004797          	auipc	a5,0x4
    80002c18:	77c7b783          	ld	a5,1916(a5) # 80007390 <_GLOBAL_OFFSET_TABLE_+0x40>
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
	if (!working) return;
    80002c4c:	01854783          	lbu	a5,24(a0)
    80002c50:	00078c63          	beqz	a5,80002c68 <_ZN4KSem4waitEv+0x1c>
	if (--val < 0) block();
    80002c54:	00052783          	lw	a5,0(a0)
    80002c58:	fff7879b          	addiw	a5,a5,-1
    80002c5c:	00f52023          	sw	a5,0(a0)
    80002c60:	02079713          	slli	a4,a5,0x20
    80002c64:	00074463          	bltz	a4,80002c6c <_ZN4KSem4waitEv+0x20>
    80002c68:	00008067          	ret
void KSem::wait() {
    80002c6c:	ff010113          	addi	sp,sp,-16
    80002c70:	00113423          	sd	ra,8(sp)
    80002c74:	00813023          	sd	s0,0(sp)
    80002c78:	01010413          	addi	s0,sp,16
	if (--val < 0) block();
    80002c7c:	00000097          	auipc	ra,0x0
    80002c80:	f88080e7          	jalr	-120(ra) # 80002c04 <_ZN4KSem5blockEv>
}
    80002c84:	00813083          	ld	ra,8(sp)
    80002c88:	00013403          	ld	s0,0(sp)
    80002c8c:	01010113          	addi	sp,sp,16
    80002c90:	00008067          	ret

0000000080002c94 <_ZN4KSem7unblockEv>:

void KSem::unblock() {
    80002c94:	ff010113          	addi	sp,sp,-16
    80002c98:	00113423          	sd	ra,8(sp)
    80002c9c:	00813023          	sd	s0,0(sp)
    80002ca0:	01010413          	addi	s0,sp,16
	TCB* tcb = blocked.getFirst();
    80002ca4:	00850513          	addi	a0,a0,8
    80002ca8:	ffffe097          	auipc	ra,0xffffe
    80002cac:	5e8080e7          	jalr	1512(ra) # 80001290 <_ZN11ThreadQueue8getFirstEv>
    80002cb0:	020508a3          	sb	zero,49(a0)
	tcb->setBlocked(false);
	Scheduler::put(tcb);
    80002cb4:	fffff097          	auipc	ra,0xfffff
    80002cb8:	934080e7          	jalr	-1740(ra) # 800015e8 <_ZN9Scheduler3putEP3TCB>
}
    80002cbc:	00813083          	ld	ra,8(sp)
    80002cc0:	00013403          	ld	s0,0(sp)
    80002cc4:	01010113          	addi	sp,sp,16
    80002cc8:	00008067          	ret

0000000080002ccc <_ZN4KSem6signalEv>:
	if (!working) return;
    80002ccc:	01854783          	lbu	a5,24(a0)
    80002cd0:	00078a63          	beqz	a5,80002ce4 <_ZN4KSem6signalEv+0x18>
	if (val++ < 0) unblock();
    80002cd4:	00052783          	lw	a5,0(a0)
    80002cd8:	0017871b          	addiw	a4,a5,1
    80002cdc:	00e52023          	sw	a4,0(a0)
    80002ce0:	0007c463          	bltz	a5,80002ce8 <_ZN4KSem6signalEv+0x1c>
    80002ce4:	00008067          	ret
void KSem::signal() {
    80002ce8:	ff010113          	addi	sp,sp,-16
    80002cec:	00113423          	sd	ra,8(sp)
    80002cf0:	00813023          	sd	s0,0(sp)
    80002cf4:	01010413          	addi	s0,sp,16
	if (val++ < 0) unblock();
    80002cf8:	00000097          	auipc	ra,0x0
    80002cfc:	f9c080e7          	jalr	-100(ra) # 80002c94 <_ZN4KSem7unblockEv>
}
    80002d00:	00813083          	ld	ra,8(sp)
    80002d04:	00013403          	ld	s0,0(sp)
    80002d08:	01010113          	addi	sp,sp,16
    80002d0c:	00008067          	ret

0000000080002d10 <_ZN4KSem8closeSemEPS_>:

int KSem::closeSem(sem_t handle) {
    80002d10:	fe010113          	addi	sp,sp,-32
    80002d14:	00113c23          	sd	ra,24(sp)
    80002d18:	00813823          	sd	s0,16(sp)
    80002d1c:	00913423          	sd	s1,8(sp)
    80002d20:	02010413          	addi	s0,sp,32
    80002d24:	00050493          	mv	s1,a0
	if(!MemoryAllocator::checkPurpose(handle, MemoryAllocator::SEMAPHORE)) return -1;
    80002d28:	00100593          	li	a1,1
    80002d2c:	00000097          	auipc	ra,0x0
    80002d30:	e10080e7          	jalr	-496(ra) # 80002b3c <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>
    80002d34:	04050263          	beqz	a0,80002d78 <_ZN4KSem8closeSemEPS_+0x68>
	handle->working = false;
    80002d38:	00048c23          	sb	zero,24(s1)
    80002d3c:	01c0006f          	j	80002d58 <_ZN4KSem8closeSemEPS_+0x48>
	while (!handle->blocked.isEmpty()) {
		TCB* tcb = handle->blocked.getFirst();
    80002d40:	00848513          	addi	a0,s1,8
    80002d44:	ffffe097          	auipc	ra,0xffffe
    80002d48:	54c080e7          	jalr	1356(ra) # 80001290 <_ZN11ThreadQueue8getFirstEv>
    80002d4c:	020508a3          	sb	zero,49(a0)
		tcb->setBlocked(false);
		Scheduler::put(tcb);
    80002d50:	fffff097          	auipc	ra,0xfffff
    80002d54:	898080e7          	jalr	-1896(ra) # 800015e8 <_ZN9Scheduler3putEP3TCB>
		return front == nullptr;
    80002d58:	0084b783          	ld	a5,8(s1)
	while (!handle->blocked.isEmpty()) {
    80002d5c:	fe0792e3          	bnez	a5,80002d40 <_ZN4KSem8closeSemEPS_+0x30>
	}
	return 0;
    80002d60:	00000513          	li	a0,0
}
    80002d64:	01813083          	ld	ra,24(sp)
    80002d68:	01013403          	ld	s0,16(sp)
    80002d6c:	00813483          	ld	s1,8(sp)
    80002d70:	02010113          	addi	sp,sp,32
    80002d74:	00008067          	ret
	if(!MemoryAllocator::checkPurpose(handle, MemoryAllocator::SEMAPHORE)) return -1;
    80002d78:	fff00513          	li	a0,-1
    80002d7c:	fe9ff06f          	j	80002d64 <_ZN4KSem8closeSemEPS_+0x54>

0000000080002d80 <_Z10testMemoryv>:
#include "../h/ThreadQueue.hpp"
//#include "../h/KSem.hpp"

extern sem_t semA;

void testMemory() {
    80002d80:	81010113          	addi	sp,sp,-2032
    80002d84:	7e113423          	sd	ra,2024(sp)
    80002d88:	7e813023          	sd	s0,2016(sp)
    80002d8c:	7c913c23          	sd	s1,2008(sp)
    80002d90:	7f010413          	addi	s0,sp,2032
    80002d94:	83010113          	addi	sp,sp,-2000
	const uint64 NumAllocations = 500;    //zasto nece za preko 500????
	const uint64 AllocationSize = 16;

	// Allocate and initialize pointers
	int* allocations[NumAllocations];
	for (uint64 i = 0; i < NumAllocations; ++i)
    80002d98:	00000713          	li	a4,0
    80002d9c:	1f300793          	li	a5,499
    80002da0:	02e7e263          	bltu	a5,a4,80002dc4 <_Z10testMemoryv+0x44>
		allocations[i] = nullptr;
    80002da4:	fffff7b7          	lui	a5,0xfffff
    80002da8:	00371693          	slli	a3,a4,0x3
    80002dac:	fe040613          	addi	a2,s0,-32
    80002db0:	00f607b3          	add	a5,a2,a5
    80002db4:	00d787b3          	add	a5,a5,a3
    80002db8:	0607b023          	sd	zero,96(a5) # fffffffffffff060 <end+0xffffffff7fff69c0>
	for (uint64 i = 0; i < NumAllocations; ++i)
    80002dbc:	00170713          	addi	a4,a4,1
    80002dc0:	fddff06f          	j	80002d9c <_Z10testMemoryv+0x1c>

	// Allocate memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80002dc4:	00000493          	li	s1,0
    80002dc8:	1f300793          	li	a5,499
    80002dcc:	0297ec63          	bltu	a5,s1,80002e04 <_Z10testMemoryv+0x84>
		allocations[i] = static_cast<int*>(MemoryAllocator::kmalloc(AllocationSize, MemoryAllocator::MISC));
    80002dd0:	00300593          	li	a1,3
    80002dd4:	01000513          	li	a0,16
    80002dd8:	00000097          	auipc	ra,0x0
    80002ddc:	a98080e7          	jalr	-1384(ra) # 80002870 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
    80002de0:	fffff737          	lui	a4,0xfffff
    80002de4:	00349793          	slli	a5,s1,0x3
    80002de8:	fe040693          	addi	a3,s0,-32
    80002dec:	00e68733          	add	a4,a3,a4
    80002df0:	00f707b3          	add	a5,a4,a5
    80002df4:	06a7b023          	sd	a0,96(a5)
		if (allocations[i] == nullptr) {
    80002df8:	00050663          	beqz	a0,80002e04 <_Z10testMemoryv+0x84>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80002dfc:	00148493          	addi	s1,s1,1
    80002e00:	fc9ff06f          	j	80002dc8 <_Z10testMemoryv+0x48>
    80002e04:	00000493          	li	s1,0
    80002e08:	0100006f          	j	80002e18 <_Z10testMemoryv+0x98>
	}

	// Free memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
		if (allocations[i] != nullptr) {
			if (MemoryAllocator::kfree(allocations[i]) != 0) {
    80002e0c:	00000097          	auipc	ra,0x0
    80002e10:	c10080e7          	jalr	-1008(ra) # 80002a1c <_ZN15MemoryAllocator5kfreeEPv>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80002e14:	00148493          	addi	s1,s1,1
    80002e18:	1f300793          	li	a5,499
    80002e1c:	0297e263          	bltu	a5,s1,80002e40 <_Z10testMemoryv+0xc0>
		if (allocations[i] != nullptr) {
    80002e20:	fffff737          	lui	a4,0xfffff
    80002e24:	00349793          	slli	a5,s1,0x3
    80002e28:	fe040693          	addi	a3,s0,-32
    80002e2c:	00e68733          	add	a4,a3,a4
    80002e30:	00f707b3          	add	a5,a4,a5
    80002e34:	0607b503          	ld	a0,96(a5)
    80002e38:	fc051ae3          	bnez	a0,80002e0c <_Z10testMemoryv+0x8c>
    80002e3c:	fd9ff06f          	j	80002e14 <_Z10testMemoryv+0x94>
//				printString("\nDeallocation failed for index ");
//				printInteger(i);
			}
		}
	}
}
    80002e40:	7d010113          	addi	sp,sp,2000
    80002e44:	7e813083          	ld	ra,2024(sp)
    80002e48:	7e013403          	ld	s0,2016(sp)
    80002e4c:	7d813483          	ld	s1,2008(sp)
    80002e50:	7f010113          	addi	sp,sp,2032
    80002e54:	00008067          	ret

0000000080002e58 <_Z5nit1fPv>:

void nit1f(void*) {
    80002e58:	fd010113          	addi	sp,sp,-48
    80002e5c:	02113423          	sd	ra,40(sp)
    80002e60:	02813023          	sd	s0,32(sp)
    80002e64:	00913c23          	sd	s1,24(sp)
    80002e68:	03010413          	addi	s0,sp,48
	for (int i = 0; i < 8; i++) {
    80002e6c:	00000493          	li	s1,0
    80002e70:	00700793          	li	a5,7
    80002e74:	0297ca63          	blt	a5,s1,80002ea8 <_Z5nit1fPv+0x50>
		printInteger(5);
    80002e78:	00500513          	li	a0,5
    80002e7c:	ffffe097          	auipc	ra,0xffffe
    80002e80:	744080e7          	jalr	1860(ra) # 800015c0 <_Z12printIntegerm>
		printString("\n");
    80002e84:	00003517          	auipc	a0,0x3
    80002e88:	55c50513          	addi	a0,a0,1372 # 800063e0 <CONSOLE_STATUS+0x3d0>
    80002e8c:	ffffe097          	auipc	ra,0xffffe
    80002e90:	70c080e7          	jalr	1804(ra) # 80001598 <_Z11printStringPKc>
		time_sleep(50);
    80002e94:	03200513          	li	a0,50
    80002e98:	ffffe097          	auipc	ra,0xffffe
    80002e9c:	5b8080e7          	jalr	1464(ra) # 80001450 <_Z10time_sleepm>
	for (int i = 0; i < 8; i++) {
    80002ea0:	0014849b          	addiw	s1,s1,1
    80002ea4:	fcdff06f          	j	80002e70 <_Z5nit1fPv+0x18>
	}
	printString("\nKraj niti 1\n");
    80002ea8:	00003517          	auipc	a0,0x3
    80002eac:	30850513          	addi	a0,a0,776 # 800061b0 <CONSOLE_STATUS+0x1a0>
    80002eb0:	ffffe097          	auipc	ra,0xffffe
    80002eb4:	6e8080e7          	jalr	1768(ra) # 80001598 <_Z11printStringPKc>
	thread_exit();
    80002eb8:	ffffe097          	auipc	ra,0xffffe
    80002ebc:	528080e7          	jalr	1320(ra) # 800013e0 <_Z11thread_exitv>
	printString("\nusao u nit 1\n");
    80002ec0:	00003517          	auipc	a0,0x3
    80002ec4:	30050513          	addi	a0,a0,768 # 800061c0 <CONSOLE_STATUS+0x1b0>
    80002ec8:	ffffe097          	auipc	ra,0xffffe
    80002ecc:	6d0080e7          	jalr	1744(ra) # 80001598 <_Z11printStringPKc>
	__asm__ volatile("li t1, 100");
    80002ed0:	06400313          	li	t1,100
	//thread_dispatch();
	volatile uint64 t1;
	__asm__ volatile("mv %0, t1":"=r"(t1));
    80002ed4:	00030793          	mv	a5,t1
    80002ed8:	fcf43c23          	sd	a5,-40(s0)
	printString("\nopet u niti 1\n");
    80002edc:	00003517          	auipc	a0,0x3
    80002ee0:	2f450513          	addi	a0,a0,756 # 800061d0 <CONSOLE_STATUS+0x1c0>
    80002ee4:	ffffe097          	auipc	ra,0xffffe
    80002ee8:	6b4080e7          	jalr	1716(ra) # 80001598 <_Z11printStringPKc>
	printString("\nt1 = ");
    80002eec:	00003517          	auipc	a0,0x3
    80002ef0:	2f450513          	addi	a0,a0,756 # 800061e0 <CONSOLE_STATUS+0x1d0>
    80002ef4:	ffffe097          	auipc	ra,0xffffe
    80002ef8:	6a4080e7          	jalr	1700(ra) # 80001598 <_Z11printStringPKc>

	printInteger(t1);
    80002efc:	fd843503          	ld	a0,-40(s0)
    80002f00:	ffffe097          	auipc	ra,0xffffe
    80002f04:	6c0080e7          	jalr	1728(ra) # 800015c0 <_Z12printIntegerm>

	for (int i = 0; i < 1000000; i++) {
    80002f08:	00000493          	li	s1,0
    80002f0c:	0340006f          	j	80002f40 <_Z5nit1fPv+0xe8>
		if (i % 1200 == 0) {
			printString("Nit1: ");
    80002f10:	00003517          	auipc	a0,0x3
    80002f14:	2d850513          	addi	a0,a0,728 # 800061e8 <CONSOLE_STATUS+0x1d8>
    80002f18:	ffffe097          	auipc	ra,0xffffe
    80002f1c:	680080e7          	jalr	1664(ra) # 80001598 <_Z11printStringPKc>
			printInteger(i);
    80002f20:	00048513          	mv	a0,s1
    80002f24:	ffffe097          	auipc	ra,0xffffe
    80002f28:	69c080e7          	jalr	1692(ra) # 800015c0 <_Z12printIntegerm>
			printString("\n");
    80002f2c:	00003517          	auipc	a0,0x3
    80002f30:	4b450513          	addi	a0,a0,1204 # 800063e0 <CONSOLE_STATUS+0x3d0>
    80002f34:	ffffe097          	auipc	ra,0xffffe
    80002f38:	664080e7          	jalr	1636(ra) # 80001598 <_Z11printStringPKc>
	for (int i = 0; i < 1000000; i++) {
    80002f3c:	0014849b          	addiw	s1,s1,1
    80002f40:	000f47b7          	lui	a5,0xf4
    80002f44:	23f78793          	addi	a5,a5,575 # f423f <_entry-0x7ff0bdc1>
    80002f48:	0097ca63          	blt	a5,s1,80002f5c <_Z5nit1fPv+0x104>
		if (i % 1200 == 0) {
    80002f4c:	4b000793          	li	a5,1200
    80002f50:	02f4e7bb          	remw	a5,s1,a5
    80002f54:	fe0794e3          	bnez	a5,80002f3c <_Z5nit1fPv+0xe4>
    80002f58:	fb9ff06f          	j	80002f10 <_Z5nit1fPv+0xb8>
			//printString("\nyield n1\n");
			//thread_dispatch();
		}
	}

	printString("\nGotova nit 1\n");
    80002f5c:	00003517          	auipc	a0,0x3
    80002f60:	29450513          	addi	a0,a0,660 # 800061f0 <CONSOLE_STATUS+0x1e0>
    80002f64:	ffffe097          	auipc	ra,0xffffe
    80002f68:	634080e7          	jalr	1588(ra) # 80001598 <_Z11printStringPKc>
}
    80002f6c:	02813083          	ld	ra,40(sp)
    80002f70:	02013403          	ld	s0,32(sp)
    80002f74:	01813483          	ld	s1,24(sp)
    80002f78:	03010113          	addi	sp,sp,48
    80002f7c:	00008067          	ret

0000000080002f80 <_Z5nit2fPv>:

void nit2f(void* arg2) {
    80002f80:	fd010113          	addi	sp,sp,-48
    80002f84:	02113423          	sd	ra,40(sp)
    80002f88:	02813023          	sd	s0,32(sp)
    80002f8c:	00913c23          	sd	s1,24(sp)
    80002f90:	01213823          	sd	s2,16(sp)
    80002f94:	03010413          	addi	s0,sp,48
    80002f98:	00050913          	mv	s2,a0
	for (int i = 0; i < 10; i++) {
    80002f9c:	00000493          	li	s1,0
    80002fa0:	00900793          	li	a5,9
    80002fa4:	0497cc63          	blt	a5,s1,80002ffc <_Z5nit2fPv+0x7c>
		printInteger(3);
    80002fa8:	00300513          	li	a0,3
    80002fac:	ffffe097          	auipc	ra,0xffffe
    80002fb0:	614080e7          	jalr	1556(ra) # 800015c0 <_Z12printIntegerm>
		printString("\n");
    80002fb4:	00003517          	auipc	a0,0x3
    80002fb8:	42c50513          	addi	a0,a0,1068 # 800063e0 <CONSOLE_STATUS+0x3d0>
    80002fbc:	ffffe097          	auipc	ra,0xffffe
    80002fc0:	5dc080e7          	jalr	1500(ra) # 80001598 <_Z11printStringPKc>
		sem_signal(semA);
    80002fc4:	00004797          	auipc	a5,0x4
    80002fc8:	3947b783          	ld	a5,916(a5) # 80007358 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002fcc:	0007b503          	ld	a0,0(a5)
    80002fd0:	ffffe097          	auipc	ra,0xffffe
    80002fd4:	548080e7          	jalr	1352(ra) # 80001518 <_Z10sem_signalP4KSem>
		printString("Nit 2 salje signal semaforu\n");
    80002fd8:	00003517          	auipc	a0,0x3
    80002fdc:	22850513          	addi	a0,a0,552 # 80006200 <CONSOLE_STATUS+0x1f0>
    80002fe0:	ffffe097          	auipc	ra,0xffffe
    80002fe4:	5b8080e7          	jalr	1464(ra) # 80001598 <_Z11printStringPKc>
		time_sleep(30);
    80002fe8:	01e00513          	li	a0,30
    80002fec:	ffffe097          	auipc	ra,0xffffe
    80002ff0:	464080e7          	jalr	1124(ra) # 80001450 <_Z10time_sleepm>
	for (int i = 0; i < 10; i++) {
    80002ff4:	0014849b          	addiw	s1,s1,1
    80002ff8:	fa9ff06f          	j	80002fa0 <_Z5nit2fPv+0x20>
	}
	sem_close(semA);
    80002ffc:	00004797          	auipc	a5,0x4
    80003000:	35c7b783          	ld	a5,860(a5) # 80007358 <_GLOBAL_OFFSET_TABLE_+0x8>
    80003004:	0007b503          	ld	a0,0(a5)
    80003008:	ffffe097          	auipc	ra,0xffffe
    8000300c:	4b0080e7          	jalr	1200(ra) # 800014b8 <_Z9sem_closeP4KSem>
	printString("\nKraj niti 2\n");
    80003010:	00003517          	auipc	a0,0x3
    80003014:	21050513          	addi	a0,a0,528 # 80006220 <CONSOLE_STATUS+0x210>
    80003018:	ffffe097          	auipc	ra,0xffffe
    8000301c:	580080e7          	jalr	1408(ra) # 80001598 <_Z11printStringPKc>
	thread_exit();
    80003020:	ffffe097          	auipc	ra,0xffffe
    80003024:	3c0080e7          	jalr	960(ra) # 800013e0 <_Z11thread_exitv>
	printString("\nusao u nit 2\n");
    80003028:	00003517          	auipc	a0,0x3
    8000302c:	20850513          	addi	a0,a0,520 # 80006230 <CONSOLE_STATUS+0x220>
    80003030:	ffffe097          	auipc	ra,0xffffe
    80003034:	568080e7          	jalr	1384(ra) # 80001598 <_Z11printStringPKc>

	printInteger(*(uint64*)arg2);
    80003038:	00093503          	ld	a0,0(s2)
    8000303c:	ffffe097          	auipc	ra,0xffffe
    80003040:	584080e7          	jalr	1412(ra) # 800015c0 <_Z12printIntegerm>
	*(uint64*)arg2 += 10;
    80003044:	00093783          	ld	a5,0(s2)
    80003048:	00a78793          	addi	a5,a5,10
    8000304c:	00f93023          	sd	a5,0(s2)
	__asm__ volatile("li t1, 200");
    80003050:	0c800313          	li	t1,200
	//thread_dispatch();
	volatile uint64 t1;
	__asm__ volatile("mv %0, t1":"=r"(t1));
    80003054:	00030793          	mv	a5,t1
    80003058:	fcf43c23          	sd	a5,-40(s0)
	printString("\nopet u niti 2\n");
    8000305c:	00003517          	auipc	a0,0x3
    80003060:	1e450513          	addi	a0,a0,484 # 80006240 <CONSOLE_STATUS+0x230>
    80003064:	ffffe097          	auipc	ra,0xffffe
    80003068:	534080e7          	jalr	1332(ra) # 80001598 <_Z11printStringPKc>
	printString("\nt1 = ");
    8000306c:	00003517          	auipc	a0,0x3
    80003070:	17450513          	addi	a0,a0,372 # 800061e0 <CONSOLE_STATUS+0x1d0>
    80003074:	ffffe097          	auipc	ra,0xffffe
    80003078:	524080e7          	jalr	1316(ra) # 80001598 <_Z11printStringPKc>
	printInteger(t1);
    8000307c:	fd843503          	ld	a0,-40(s0)
    80003080:	ffffe097          	auipc	ra,0xffffe
    80003084:	540080e7          	jalr	1344(ra) # 800015c0 <_Z12printIntegerm>
	printString("\n");
    80003088:	00003517          	auipc	a0,0x3
    8000308c:	35850513          	addi	a0,a0,856 # 800063e0 <CONSOLE_STATUS+0x3d0>
    80003090:	ffffe097          	auipc	ra,0xffffe
    80003094:	508080e7          	jalr	1288(ra) # 80001598 <_Z11printStringPKc>
	for (int i = 0; i < 1000000; i++) {
    80003098:	00000493          	li	s1,0
    8000309c:	0400006f          	j	800030dc <_Z5nit2fPv+0x15c>
		if (i % 100000 == 0) {
			printString("Nit2: ");
    800030a0:	00003517          	auipc	a0,0x3
    800030a4:	1b050513          	addi	a0,a0,432 # 80006250 <CONSOLE_STATUS+0x240>
    800030a8:	ffffe097          	auipc	ra,0xffffe
    800030ac:	4f0080e7          	jalr	1264(ra) # 80001598 <_Z11printStringPKc>
			printInteger(i);
    800030b0:	00048513          	mv	a0,s1
    800030b4:	ffffe097          	auipc	ra,0xffffe
    800030b8:	50c080e7          	jalr	1292(ra) # 800015c0 <_Z12printIntegerm>
			printString("\n");
    800030bc:	00003517          	auipc	a0,0x3
    800030c0:	32450513          	addi	a0,a0,804 # 800063e0 <CONSOLE_STATUS+0x3d0>
    800030c4:	ffffe097          	auipc	ra,0xffffe
    800030c8:	4d4080e7          	jalr	1236(ra) # 80001598 <_Z11printStringPKc>
			time_sleep(20);
    800030cc:	01400513          	li	a0,20
    800030d0:	ffffe097          	auipc	ra,0xffffe
    800030d4:	380080e7          	jalr	896(ra) # 80001450 <_Z10time_sleepm>
	for (int i = 0; i < 1000000; i++) {
    800030d8:	0014849b          	addiw	s1,s1,1
    800030dc:	000f47b7          	lui	a5,0xf4
    800030e0:	23f78793          	addi	a5,a5,575 # f423f <_entry-0x7ff0bdc1>
    800030e4:	0097cc63          	blt	a5,s1,800030fc <_Z5nit2fPv+0x17c>
		if (i % 100000 == 0) {
    800030e8:	000187b7          	lui	a5,0x18
    800030ec:	6a07879b          	addiw	a5,a5,1696
    800030f0:	02f4e7bb          	remw	a5,s1,a5
    800030f4:	fe0792e3          	bnez	a5,800030d8 <_Z5nit2fPv+0x158>
    800030f8:	fa9ff06f          	j	800030a0 <_Z5nit2fPv+0x120>
//		if (i % 54203 == 0) {
//			printString("\nyield n2\n");
//			thread_dispatch();
//		}
	}
	printString("\nPokusavam da ugasim nit 2\n");
    800030fc:	00003517          	auipc	a0,0x3
    80003100:	15c50513          	addi	a0,a0,348 # 80006258 <CONSOLE_STATUS+0x248>
    80003104:	ffffe097          	auipc	ra,0xffffe
    80003108:	494080e7          	jalr	1172(ra) # 80001598 <_Z11printStringPKc>
	//thread_exit();
	printString("\nNisam uspeo da ugasim nit 2\n");
    8000310c:	00003517          	auipc	a0,0x3
    80003110:	16c50513          	addi	a0,a0,364 # 80006278 <CONSOLE_STATUS+0x268>
    80003114:	ffffe097          	auipc	ra,0xffffe
    80003118:	484080e7          	jalr	1156(ra) # 80001598 <_Z11printStringPKc>
	printInteger(*(uint64*)arg2);
    8000311c:	00093503          	ld	a0,0(s2)
    80003120:	ffffe097          	auipc	ra,0xffffe
    80003124:	4a0080e7          	jalr	1184(ra) # 800015c0 <_Z12printIntegerm>
	printString("\nGotova nit 2\n");
    80003128:	00003517          	auipc	a0,0x3
    8000312c:	17050513          	addi	a0,a0,368 # 80006298 <CONSOLE_STATUS+0x288>
    80003130:	ffffe097          	auipc	ra,0xffffe
    80003134:	468080e7          	jalr	1128(ra) # 80001598 <_Z11printStringPKc>
}
    80003138:	02813083          	ld	ra,40(sp)
    8000313c:	02013403          	ld	s0,32(sp)
    80003140:	01813483          	ld	s1,24(sp)
    80003144:	01013903          	ld	s2,16(sp)
    80003148:	03010113          	addi	sp,sp,48
    8000314c:	00008067          	ret

0000000080003150 <_Z5nit3fPv>:


void nit3f(void*) {
    80003150:	fe010113          	addi	sp,sp,-32
    80003154:	00113c23          	sd	ra,24(sp)
    80003158:	00813823          	sd	s0,16(sp)
    8000315c:	00913423          	sd	s1,8(sp)
    80003160:	02010413          	addi	s0,sp,32
	for (int i = 0; i < 20; i++) {
    80003164:	00000493          	li	s1,0
    80003168:	0540006f          	j	800031bc <_Z5nit3fPv+0x6c>
		printInteger(i);
    8000316c:	00048513          	mv	a0,s1
    80003170:	ffffe097          	auipc	ra,0xffffe
    80003174:	450080e7          	jalr	1104(ra) # 800015c0 <_Z12printIntegerm>
		printString("\n");
    80003178:	00003517          	auipc	a0,0x3
    8000317c:	26850513          	addi	a0,a0,616 # 800063e0 <CONSOLE_STATUS+0x3d0>
    80003180:	ffffe097          	auipc	ra,0xffffe
    80003184:	418080e7          	jalr	1048(ra) # 80001598 <_Z11printStringPKc>
		sem_wait(semA);
    80003188:	00004797          	auipc	a5,0x4
    8000318c:	1d07b783          	ld	a5,464(a5) # 80007358 <_GLOBAL_OFFSET_TABLE_+0x8>
    80003190:	0007b503          	ld	a0,0(a5)
    80003194:	ffffe097          	auipc	ra,0xffffe
    80003198:	354080e7          	jalr	852(ra) # 800014e8 <_Z8sem_waitP4KSem>
		printString("Nit 3 prosla semafor\n");
    8000319c:	00003517          	auipc	a0,0x3
    800031a0:	10c50513          	addi	a0,a0,268 # 800062a8 <CONSOLE_STATUS+0x298>
    800031a4:	ffffe097          	auipc	ra,0xffffe
    800031a8:	3f4080e7          	jalr	1012(ra) # 80001598 <_Z11printStringPKc>
		time_sleep(10);
    800031ac:	00a00513          	li	a0,10
    800031b0:	ffffe097          	auipc	ra,0xffffe
    800031b4:	2a0080e7          	jalr	672(ra) # 80001450 <_Z10time_sleepm>
	for (int i = 0; i < 20; i++) {
    800031b8:	0014849b          	addiw	s1,s1,1
    800031bc:	01300793          	li	a5,19
    800031c0:	fa97d6e3          	bge	a5,s1,8000316c <_Z5nit3fPv+0x1c>
	}
	printString("\nGotova nit3\n");
    800031c4:	00003517          	auipc	a0,0x3
    800031c8:	0fc50513          	addi	a0,a0,252 # 800062c0 <CONSOLE_STATUS+0x2b0>
    800031cc:	ffffe097          	auipc	ra,0xffffe
    800031d0:	3cc080e7          	jalr	972(ra) # 80001598 <_Z11printStringPKc>
    800031d4:	01813083          	ld	ra,24(sp)
    800031d8:	01013403          	ld	s0,16(sp)
    800031dc:	00813483          	ld	s1,8(sp)
    800031e0:	02010113          	addi	sp,sp,32
    800031e4:	00008067          	ret

00000000800031e8 <start>:
    800031e8:	ff010113          	addi	sp,sp,-16
    800031ec:	00813423          	sd	s0,8(sp)
    800031f0:	01010413          	addi	s0,sp,16
    800031f4:	300027f3          	csrr	a5,mstatus
    800031f8:	ffffe737          	lui	a4,0xffffe
    800031fc:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff615f>
    80003200:	00e7f7b3          	and	a5,a5,a4
    80003204:	00001737          	lui	a4,0x1
    80003208:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    8000320c:	00e7e7b3          	or	a5,a5,a4
    80003210:	30079073          	csrw	mstatus,a5
    80003214:	00000797          	auipc	a5,0x0
    80003218:	16078793          	addi	a5,a5,352 # 80003374 <system_main>
    8000321c:	34179073          	csrw	mepc,a5
    80003220:	00000793          	li	a5,0
    80003224:	18079073          	csrw	satp,a5
    80003228:	000107b7          	lui	a5,0x10
    8000322c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80003230:	30279073          	csrw	medeleg,a5
    80003234:	30379073          	csrw	mideleg,a5
    80003238:	104027f3          	csrr	a5,sie
    8000323c:	2227e793          	ori	a5,a5,546
    80003240:	10479073          	csrw	sie,a5
    80003244:	fff00793          	li	a5,-1
    80003248:	00a7d793          	srli	a5,a5,0xa
    8000324c:	3b079073          	csrw	pmpaddr0,a5
    80003250:	00f00793          	li	a5,15
    80003254:	3a079073          	csrw	pmpcfg0,a5
    80003258:	f14027f3          	csrr	a5,mhartid
    8000325c:	0200c737          	lui	a4,0x200c
    80003260:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003264:	0007869b          	sext.w	a3,a5
    80003268:	00269713          	slli	a4,a3,0x2
    8000326c:	000f4637          	lui	a2,0xf4
    80003270:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003274:	00d70733          	add	a4,a4,a3
    80003278:	0037979b          	slliw	a5,a5,0x3
    8000327c:	020046b7          	lui	a3,0x2004
    80003280:	00d787b3          	add	a5,a5,a3
    80003284:	00c585b3          	add	a1,a1,a2
    80003288:	00371693          	slli	a3,a4,0x3
    8000328c:	00004717          	auipc	a4,0x4
    80003290:	1b470713          	addi	a4,a4,436 # 80007440 <timer_scratch>
    80003294:	00b7b023          	sd	a1,0(a5)
    80003298:	00d70733          	add	a4,a4,a3
    8000329c:	00f73c23          	sd	a5,24(a4)
    800032a0:	02c73023          	sd	a2,32(a4)
    800032a4:	34071073          	csrw	mscratch,a4
    800032a8:	00000797          	auipc	a5,0x0
    800032ac:	6e878793          	addi	a5,a5,1768 # 80003990 <timervec>
    800032b0:	30579073          	csrw	mtvec,a5
    800032b4:	300027f3          	csrr	a5,mstatus
    800032b8:	0087e793          	ori	a5,a5,8
    800032bc:	30079073          	csrw	mstatus,a5
    800032c0:	304027f3          	csrr	a5,mie
    800032c4:	0807e793          	ori	a5,a5,128
    800032c8:	30479073          	csrw	mie,a5
    800032cc:	f14027f3          	csrr	a5,mhartid
    800032d0:	0007879b          	sext.w	a5,a5
    800032d4:	00078213          	mv	tp,a5
    800032d8:	30200073          	mret
    800032dc:	00813403          	ld	s0,8(sp)
    800032e0:	01010113          	addi	sp,sp,16
    800032e4:	00008067          	ret

00000000800032e8 <timerinit>:
    800032e8:	ff010113          	addi	sp,sp,-16
    800032ec:	00813423          	sd	s0,8(sp)
    800032f0:	01010413          	addi	s0,sp,16
    800032f4:	f14027f3          	csrr	a5,mhartid
    800032f8:	0200c737          	lui	a4,0x200c
    800032fc:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003300:	0007869b          	sext.w	a3,a5
    80003304:	00269713          	slli	a4,a3,0x2
    80003308:	000f4637          	lui	a2,0xf4
    8000330c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003310:	00d70733          	add	a4,a4,a3
    80003314:	0037979b          	slliw	a5,a5,0x3
    80003318:	020046b7          	lui	a3,0x2004
    8000331c:	00d787b3          	add	a5,a5,a3
    80003320:	00c585b3          	add	a1,a1,a2
    80003324:	00371693          	slli	a3,a4,0x3
    80003328:	00004717          	auipc	a4,0x4
    8000332c:	11870713          	addi	a4,a4,280 # 80007440 <timer_scratch>
    80003330:	00b7b023          	sd	a1,0(a5)
    80003334:	00d70733          	add	a4,a4,a3
    80003338:	00f73c23          	sd	a5,24(a4)
    8000333c:	02c73023          	sd	a2,32(a4)
    80003340:	34071073          	csrw	mscratch,a4
    80003344:	00000797          	auipc	a5,0x0
    80003348:	64c78793          	addi	a5,a5,1612 # 80003990 <timervec>
    8000334c:	30579073          	csrw	mtvec,a5
    80003350:	300027f3          	csrr	a5,mstatus
    80003354:	0087e793          	ori	a5,a5,8
    80003358:	30079073          	csrw	mstatus,a5
    8000335c:	304027f3          	csrr	a5,mie
    80003360:	0807e793          	ori	a5,a5,128
    80003364:	30479073          	csrw	mie,a5
    80003368:	00813403          	ld	s0,8(sp)
    8000336c:	01010113          	addi	sp,sp,16
    80003370:	00008067          	ret

0000000080003374 <system_main>:
    80003374:	fe010113          	addi	sp,sp,-32
    80003378:	00813823          	sd	s0,16(sp)
    8000337c:	00913423          	sd	s1,8(sp)
    80003380:	00113c23          	sd	ra,24(sp)
    80003384:	02010413          	addi	s0,sp,32
    80003388:	00000097          	auipc	ra,0x0
    8000338c:	0c4080e7          	jalr	196(ra) # 8000344c <cpuid>
    80003390:	00004497          	auipc	s1,0x4
    80003394:	03048493          	addi	s1,s1,48 # 800073c0 <started>
    80003398:	02050263          	beqz	a0,800033bc <system_main+0x48>
    8000339c:	0004a783          	lw	a5,0(s1)
    800033a0:	0007879b          	sext.w	a5,a5
    800033a4:	fe078ce3          	beqz	a5,8000339c <system_main+0x28>
    800033a8:	0ff0000f          	fence
    800033ac:	00003517          	auipc	a0,0x3
    800033b0:	f5450513          	addi	a0,a0,-172 # 80006300 <CONSOLE_STATUS+0x2f0>
    800033b4:	00001097          	auipc	ra,0x1
    800033b8:	a78080e7          	jalr	-1416(ra) # 80003e2c <panic>
    800033bc:	00001097          	auipc	ra,0x1
    800033c0:	9cc080e7          	jalr	-1588(ra) # 80003d88 <consoleinit>
    800033c4:	00001097          	auipc	ra,0x1
    800033c8:	158080e7          	jalr	344(ra) # 8000451c <printfinit>
    800033cc:	00003517          	auipc	a0,0x3
    800033d0:	01450513          	addi	a0,a0,20 # 800063e0 <CONSOLE_STATUS+0x3d0>
    800033d4:	00001097          	auipc	ra,0x1
    800033d8:	ab4080e7          	jalr	-1356(ra) # 80003e88 <__printf>
    800033dc:	00003517          	auipc	a0,0x3
    800033e0:	ef450513          	addi	a0,a0,-268 # 800062d0 <CONSOLE_STATUS+0x2c0>
    800033e4:	00001097          	auipc	ra,0x1
    800033e8:	aa4080e7          	jalr	-1372(ra) # 80003e88 <__printf>
    800033ec:	00003517          	auipc	a0,0x3
    800033f0:	ff450513          	addi	a0,a0,-12 # 800063e0 <CONSOLE_STATUS+0x3d0>
    800033f4:	00001097          	auipc	ra,0x1
    800033f8:	a94080e7          	jalr	-1388(ra) # 80003e88 <__printf>
    800033fc:	00001097          	auipc	ra,0x1
    80003400:	4ac080e7          	jalr	1196(ra) # 800048a8 <kinit>
    80003404:	00000097          	auipc	ra,0x0
    80003408:	148080e7          	jalr	328(ra) # 8000354c <trapinit>
    8000340c:	00000097          	auipc	ra,0x0
    80003410:	16c080e7          	jalr	364(ra) # 80003578 <trapinithart>
    80003414:	00000097          	auipc	ra,0x0
    80003418:	5bc080e7          	jalr	1468(ra) # 800039d0 <plicinit>
    8000341c:	00000097          	auipc	ra,0x0
    80003420:	5dc080e7          	jalr	1500(ra) # 800039f8 <plicinithart>
    80003424:	00000097          	auipc	ra,0x0
    80003428:	078080e7          	jalr	120(ra) # 8000349c <userinit>
    8000342c:	0ff0000f          	fence
    80003430:	00100793          	li	a5,1
    80003434:	00003517          	auipc	a0,0x3
    80003438:	eb450513          	addi	a0,a0,-332 # 800062e8 <CONSOLE_STATUS+0x2d8>
    8000343c:	00f4a023          	sw	a5,0(s1)
    80003440:	00001097          	auipc	ra,0x1
    80003444:	a48080e7          	jalr	-1464(ra) # 80003e88 <__printf>
    80003448:	0000006f          	j	80003448 <system_main+0xd4>

000000008000344c <cpuid>:
    8000344c:	ff010113          	addi	sp,sp,-16
    80003450:	00813423          	sd	s0,8(sp)
    80003454:	01010413          	addi	s0,sp,16
    80003458:	00020513          	mv	a0,tp
    8000345c:	00813403          	ld	s0,8(sp)
    80003460:	0005051b          	sext.w	a0,a0
    80003464:	01010113          	addi	sp,sp,16
    80003468:	00008067          	ret

000000008000346c <mycpu>:
    8000346c:	ff010113          	addi	sp,sp,-16
    80003470:	00813423          	sd	s0,8(sp)
    80003474:	01010413          	addi	s0,sp,16
    80003478:	00020793          	mv	a5,tp
    8000347c:	00813403          	ld	s0,8(sp)
    80003480:	0007879b          	sext.w	a5,a5
    80003484:	00779793          	slli	a5,a5,0x7
    80003488:	00005517          	auipc	a0,0x5
    8000348c:	fe850513          	addi	a0,a0,-24 # 80008470 <cpus>
    80003490:	00f50533          	add	a0,a0,a5
    80003494:	01010113          	addi	sp,sp,16
    80003498:	00008067          	ret

000000008000349c <userinit>:
    8000349c:	ff010113          	addi	sp,sp,-16
    800034a0:	00813423          	sd	s0,8(sp)
    800034a4:	01010413          	addi	s0,sp,16
    800034a8:	00813403          	ld	s0,8(sp)
    800034ac:	01010113          	addi	sp,sp,16
    800034b0:	ffffe317          	auipc	t1,0xffffe
    800034b4:	2e430067          	jr	740(t1) # 80001794 <main>

00000000800034b8 <either_copyout>:
    800034b8:	ff010113          	addi	sp,sp,-16
    800034bc:	00813023          	sd	s0,0(sp)
    800034c0:	00113423          	sd	ra,8(sp)
    800034c4:	01010413          	addi	s0,sp,16
    800034c8:	02051663          	bnez	a0,800034f4 <either_copyout+0x3c>
    800034cc:	00058513          	mv	a0,a1
    800034d0:	00060593          	mv	a1,a2
    800034d4:	0006861b          	sext.w	a2,a3
    800034d8:	00002097          	auipc	ra,0x2
    800034dc:	c5c080e7          	jalr	-932(ra) # 80005134 <__memmove>
    800034e0:	00813083          	ld	ra,8(sp)
    800034e4:	00013403          	ld	s0,0(sp)
    800034e8:	00000513          	li	a0,0
    800034ec:	01010113          	addi	sp,sp,16
    800034f0:	00008067          	ret
    800034f4:	00003517          	auipc	a0,0x3
    800034f8:	e3450513          	addi	a0,a0,-460 # 80006328 <CONSOLE_STATUS+0x318>
    800034fc:	00001097          	auipc	ra,0x1
    80003500:	930080e7          	jalr	-1744(ra) # 80003e2c <panic>

0000000080003504 <either_copyin>:
    80003504:	ff010113          	addi	sp,sp,-16
    80003508:	00813023          	sd	s0,0(sp)
    8000350c:	00113423          	sd	ra,8(sp)
    80003510:	01010413          	addi	s0,sp,16
    80003514:	02059463          	bnez	a1,8000353c <either_copyin+0x38>
    80003518:	00060593          	mv	a1,a2
    8000351c:	0006861b          	sext.w	a2,a3
    80003520:	00002097          	auipc	ra,0x2
    80003524:	c14080e7          	jalr	-1004(ra) # 80005134 <__memmove>
    80003528:	00813083          	ld	ra,8(sp)
    8000352c:	00013403          	ld	s0,0(sp)
    80003530:	00000513          	li	a0,0
    80003534:	01010113          	addi	sp,sp,16
    80003538:	00008067          	ret
    8000353c:	00003517          	auipc	a0,0x3
    80003540:	e1450513          	addi	a0,a0,-492 # 80006350 <CONSOLE_STATUS+0x340>
    80003544:	00001097          	auipc	ra,0x1
    80003548:	8e8080e7          	jalr	-1816(ra) # 80003e2c <panic>

000000008000354c <trapinit>:
    8000354c:	ff010113          	addi	sp,sp,-16
    80003550:	00813423          	sd	s0,8(sp)
    80003554:	01010413          	addi	s0,sp,16
    80003558:	00813403          	ld	s0,8(sp)
    8000355c:	00003597          	auipc	a1,0x3
    80003560:	e1c58593          	addi	a1,a1,-484 # 80006378 <CONSOLE_STATUS+0x368>
    80003564:	00005517          	auipc	a0,0x5
    80003568:	f8c50513          	addi	a0,a0,-116 # 800084f0 <tickslock>
    8000356c:	01010113          	addi	sp,sp,16
    80003570:	00001317          	auipc	t1,0x1
    80003574:	5c830067          	jr	1480(t1) # 80004b38 <initlock>

0000000080003578 <trapinithart>:
    80003578:	ff010113          	addi	sp,sp,-16
    8000357c:	00813423          	sd	s0,8(sp)
    80003580:	01010413          	addi	s0,sp,16
    80003584:	00000797          	auipc	a5,0x0
    80003588:	2fc78793          	addi	a5,a5,764 # 80003880 <kernelvec>
    8000358c:	10579073          	csrw	stvec,a5
    80003590:	00813403          	ld	s0,8(sp)
    80003594:	01010113          	addi	sp,sp,16
    80003598:	00008067          	ret

000000008000359c <usertrap>:
    8000359c:	ff010113          	addi	sp,sp,-16
    800035a0:	00813423          	sd	s0,8(sp)
    800035a4:	01010413          	addi	s0,sp,16
    800035a8:	00813403          	ld	s0,8(sp)
    800035ac:	01010113          	addi	sp,sp,16
    800035b0:	00008067          	ret

00000000800035b4 <usertrapret>:
    800035b4:	ff010113          	addi	sp,sp,-16
    800035b8:	00813423          	sd	s0,8(sp)
    800035bc:	01010413          	addi	s0,sp,16
    800035c0:	00813403          	ld	s0,8(sp)
    800035c4:	01010113          	addi	sp,sp,16
    800035c8:	00008067          	ret

00000000800035cc <kerneltrap>:
    800035cc:	fe010113          	addi	sp,sp,-32
    800035d0:	00813823          	sd	s0,16(sp)
    800035d4:	00113c23          	sd	ra,24(sp)
    800035d8:	00913423          	sd	s1,8(sp)
    800035dc:	02010413          	addi	s0,sp,32
    800035e0:	142025f3          	csrr	a1,scause
    800035e4:	100027f3          	csrr	a5,sstatus
    800035e8:	0027f793          	andi	a5,a5,2
    800035ec:	10079c63          	bnez	a5,80003704 <kerneltrap+0x138>
    800035f0:	142027f3          	csrr	a5,scause
    800035f4:	0207ce63          	bltz	a5,80003630 <kerneltrap+0x64>
    800035f8:	00003517          	auipc	a0,0x3
    800035fc:	dc850513          	addi	a0,a0,-568 # 800063c0 <CONSOLE_STATUS+0x3b0>
    80003600:	00001097          	auipc	ra,0x1
    80003604:	888080e7          	jalr	-1912(ra) # 80003e88 <__printf>
    80003608:	141025f3          	csrr	a1,sepc
    8000360c:	14302673          	csrr	a2,stval
    80003610:	00003517          	auipc	a0,0x3
    80003614:	dc050513          	addi	a0,a0,-576 # 800063d0 <CONSOLE_STATUS+0x3c0>
    80003618:	00001097          	auipc	ra,0x1
    8000361c:	870080e7          	jalr	-1936(ra) # 80003e88 <__printf>
    80003620:	00003517          	auipc	a0,0x3
    80003624:	dc850513          	addi	a0,a0,-568 # 800063e8 <CONSOLE_STATUS+0x3d8>
    80003628:	00001097          	auipc	ra,0x1
    8000362c:	804080e7          	jalr	-2044(ra) # 80003e2c <panic>
    80003630:	0ff7f713          	andi	a4,a5,255
    80003634:	00900693          	li	a3,9
    80003638:	04d70063          	beq	a4,a3,80003678 <kerneltrap+0xac>
    8000363c:	fff00713          	li	a4,-1
    80003640:	03f71713          	slli	a4,a4,0x3f
    80003644:	00170713          	addi	a4,a4,1
    80003648:	fae798e3          	bne	a5,a4,800035f8 <kerneltrap+0x2c>
    8000364c:	00000097          	auipc	ra,0x0
    80003650:	e00080e7          	jalr	-512(ra) # 8000344c <cpuid>
    80003654:	06050663          	beqz	a0,800036c0 <kerneltrap+0xf4>
    80003658:	144027f3          	csrr	a5,sip
    8000365c:	ffd7f793          	andi	a5,a5,-3
    80003660:	14479073          	csrw	sip,a5
    80003664:	01813083          	ld	ra,24(sp)
    80003668:	01013403          	ld	s0,16(sp)
    8000366c:	00813483          	ld	s1,8(sp)
    80003670:	02010113          	addi	sp,sp,32
    80003674:	00008067          	ret
    80003678:	00000097          	auipc	ra,0x0
    8000367c:	3cc080e7          	jalr	972(ra) # 80003a44 <plic_claim>
    80003680:	00a00793          	li	a5,10
    80003684:	00050493          	mv	s1,a0
    80003688:	06f50863          	beq	a0,a5,800036f8 <kerneltrap+0x12c>
    8000368c:	fc050ce3          	beqz	a0,80003664 <kerneltrap+0x98>
    80003690:	00050593          	mv	a1,a0
    80003694:	00003517          	auipc	a0,0x3
    80003698:	d0c50513          	addi	a0,a0,-756 # 800063a0 <CONSOLE_STATUS+0x390>
    8000369c:	00000097          	auipc	ra,0x0
    800036a0:	7ec080e7          	jalr	2028(ra) # 80003e88 <__printf>
    800036a4:	01013403          	ld	s0,16(sp)
    800036a8:	01813083          	ld	ra,24(sp)
    800036ac:	00048513          	mv	a0,s1
    800036b0:	00813483          	ld	s1,8(sp)
    800036b4:	02010113          	addi	sp,sp,32
    800036b8:	00000317          	auipc	t1,0x0
    800036bc:	3c430067          	jr	964(t1) # 80003a7c <plic_complete>
    800036c0:	00005517          	auipc	a0,0x5
    800036c4:	e3050513          	addi	a0,a0,-464 # 800084f0 <tickslock>
    800036c8:	00001097          	auipc	ra,0x1
    800036cc:	494080e7          	jalr	1172(ra) # 80004b5c <acquire>
    800036d0:	00004717          	auipc	a4,0x4
    800036d4:	cf470713          	addi	a4,a4,-780 # 800073c4 <ticks>
    800036d8:	00072783          	lw	a5,0(a4)
    800036dc:	00005517          	auipc	a0,0x5
    800036e0:	e1450513          	addi	a0,a0,-492 # 800084f0 <tickslock>
    800036e4:	0017879b          	addiw	a5,a5,1
    800036e8:	00f72023          	sw	a5,0(a4)
    800036ec:	00001097          	auipc	ra,0x1
    800036f0:	53c080e7          	jalr	1340(ra) # 80004c28 <release>
    800036f4:	f65ff06f          	j	80003658 <kerneltrap+0x8c>
    800036f8:	00001097          	auipc	ra,0x1
    800036fc:	098080e7          	jalr	152(ra) # 80004790 <uartintr>
    80003700:	fa5ff06f          	j	800036a4 <kerneltrap+0xd8>
    80003704:	00003517          	auipc	a0,0x3
    80003708:	c7c50513          	addi	a0,a0,-900 # 80006380 <CONSOLE_STATUS+0x370>
    8000370c:	00000097          	auipc	ra,0x0
    80003710:	720080e7          	jalr	1824(ra) # 80003e2c <panic>

0000000080003714 <clockintr>:
    80003714:	fe010113          	addi	sp,sp,-32
    80003718:	00813823          	sd	s0,16(sp)
    8000371c:	00913423          	sd	s1,8(sp)
    80003720:	00113c23          	sd	ra,24(sp)
    80003724:	02010413          	addi	s0,sp,32
    80003728:	00005497          	auipc	s1,0x5
    8000372c:	dc848493          	addi	s1,s1,-568 # 800084f0 <tickslock>
    80003730:	00048513          	mv	a0,s1
    80003734:	00001097          	auipc	ra,0x1
    80003738:	428080e7          	jalr	1064(ra) # 80004b5c <acquire>
    8000373c:	00004717          	auipc	a4,0x4
    80003740:	c8870713          	addi	a4,a4,-888 # 800073c4 <ticks>
    80003744:	00072783          	lw	a5,0(a4)
    80003748:	01013403          	ld	s0,16(sp)
    8000374c:	01813083          	ld	ra,24(sp)
    80003750:	00048513          	mv	a0,s1
    80003754:	0017879b          	addiw	a5,a5,1
    80003758:	00813483          	ld	s1,8(sp)
    8000375c:	00f72023          	sw	a5,0(a4)
    80003760:	02010113          	addi	sp,sp,32
    80003764:	00001317          	auipc	t1,0x1
    80003768:	4c430067          	jr	1220(t1) # 80004c28 <release>

000000008000376c <devintr>:
    8000376c:	142027f3          	csrr	a5,scause
    80003770:	00000513          	li	a0,0
    80003774:	0007c463          	bltz	a5,8000377c <devintr+0x10>
    80003778:	00008067          	ret
    8000377c:	fe010113          	addi	sp,sp,-32
    80003780:	00813823          	sd	s0,16(sp)
    80003784:	00113c23          	sd	ra,24(sp)
    80003788:	00913423          	sd	s1,8(sp)
    8000378c:	02010413          	addi	s0,sp,32
    80003790:	0ff7f713          	andi	a4,a5,255
    80003794:	00900693          	li	a3,9
    80003798:	04d70c63          	beq	a4,a3,800037f0 <devintr+0x84>
    8000379c:	fff00713          	li	a4,-1
    800037a0:	03f71713          	slli	a4,a4,0x3f
    800037a4:	00170713          	addi	a4,a4,1
    800037a8:	00e78c63          	beq	a5,a4,800037c0 <devintr+0x54>
    800037ac:	01813083          	ld	ra,24(sp)
    800037b0:	01013403          	ld	s0,16(sp)
    800037b4:	00813483          	ld	s1,8(sp)
    800037b8:	02010113          	addi	sp,sp,32
    800037bc:	00008067          	ret
    800037c0:	00000097          	auipc	ra,0x0
    800037c4:	c8c080e7          	jalr	-884(ra) # 8000344c <cpuid>
    800037c8:	06050663          	beqz	a0,80003834 <devintr+0xc8>
    800037cc:	144027f3          	csrr	a5,sip
    800037d0:	ffd7f793          	andi	a5,a5,-3
    800037d4:	14479073          	csrw	sip,a5
    800037d8:	01813083          	ld	ra,24(sp)
    800037dc:	01013403          	ld	s0,16(sp)
    800037e0:	00813483          	ld	s1,8(sp)
    800037e4:	00200513          	li	a0,2
    800037e8:	02010113          	addi	sp,sp,32
    800037ec:	00008067          	ret
    800037f0:	00000097          	auipc	ra,0x0
    800037f4:	254080e7          	jalr	596(ra) # 80003a44 <plic_claim>
    800037f8:	00a00793          	li	a5,10
    800037fc:	00050493          	mv	s1,a0
    80003800:	06f50663          	beq	a0,a5,8000386c <devintr+0x100>
    80003804:	00100513          	li	a0,1
    80003808:	fa0482e3          	beqz	s1,800037ac <devintr+0x40>
    8000380c:	00048593          	mv	a1,s1
    80003810:	00003517          	auipc	a0,0x3
    80003814:	b9050513          	addi	a0,a0,-1136 # 800063a0 <CONSOLE_STATUS+0x390>
    80003818:	00000097          	auipc	ra,0x0
    8000381c:	670080e7          	jalr	1648(ra) # 80003e88 <__printf>
    80003820:	00048513          	mv	a0,s1
    80003824:	00000097          	auipc	ra,0x0
    80003828:	258080e7          	jalr	600(ra) # 80003a7c <plic_complete>
    8000382c:	00100513          	li	a0,1
    80003830:	f7dff06f          	j	800037ac <devintr+0x40>
    80003834:	00005517          	auipc	a0,0x5
    80003838:	cbc50513          	addi	a0,a0,-836 # 800084f0 <tickslock>
    8000383c:	00001097          	auipc	ra,0x1
    80003840:	320080e7          	jalr	800(ra) # 80004b5c <acquire>
    80003844:	00004717          	auipc	a4,0x4
    80003848:	b8070713          	addi	a4,a4,-1152 # 800073c4 <ticks>
    8000384c:	00072783          	lw	a5,0(a4)
    80003850:	00005517          	auipc	a0,0x5
    80003854:	ca050513          	addi	a0,a0,-864 # 800084f0 <tickslock>
    80003858:	0017879b          	addiw	a5,a5,1
    8000385c:	00f72023          	sw	a5,0(a4)
    80003860:	00001097          	auipc	ra,0x1
    80003864:	3c8080e7          	jalr	968(ra) # 80004c28 <release>
    80003868:	f65ff06f          	j	800037cc <devintr+0x60>
    8000386c:	00001097          	auipc	ra,0x1
    80003870:	f24080e7          	jalr	-220(ra) # 80004790 <uartintr>
    80003874:	fadff06f          	j	80003820 <devintr+0xb4>
	...

0000000080003880 <kernelvec>:
    80003880:	f0010113          	addi	sp,sp,-256
    80003884:	00113023          	sd	ra,0(sp)
    80003888:	00213423          	sd	sp,8(sp)
    8000388c:	00313823          	sd	gp,16(sp)
    80003890:	00413c23          	sd	tp,24(sp)
    80003894:	02513023          	sd	t0,32(sp)
    80003898:	02613423          	sd	t1,40(sp)
    8000389c:	02713823          	sd	t2,48(sp)
    800038a0:	02813c23          	sd	s0,56(sp)
    800038a4:	04913023          	sd	s1,64(sp)
    800038a8:	04a13423          	sd	a0,72(sp)
    800038ac:	04b13823          	sd	a1,80(sp)
    800038b0:	04c13c23          	sd	a2,88(sp)
    800038b4:	06d13023          	sd	a3,96(sp)
    800038b8:	06e13423          	sd	a4,104(sp)
    800038bc:	06f13823          	sd	a5,112(sp)
    800038c0:	07013c23          	sd	a6,120(sp)
    800038c4:	09113023          	sd	a7,128(sp)
    800038c8:	09213423          	sd	s2,136(sp)
    800038cc:	09313823          	sd	s3,144(sp)
    800038d0:	09413c23          	sd	s4,152(sp)
    800038d4:	0b513023          	sd	s5,160(sp)
    800038d8:	0b613423          	sd	s6,168(sp)
    800038dc:	0b713823          	sd	s7,176(sp)
    800038e0:	0b813c23          	sd	s8,184(sp)
    800038e4:	0d913023          	sd	s9,192(sp)
    800038e8:	0da13423          	sd	s10,200(sp)
    800038ec:	0db13823          	sd	s11,208(sp)
    800038f0:	0dc13c23          	sd	t3,216(sp)
    800038f4:	0fd13023          	sd	t4,224(sp)
    800038f8:	0fe13423          	sd	t5,232(sp)
    800038fc:	0ff13823          	sd	t6,240(sp)
    80003900:	ccdff0ef          	jal	ra,800035cc <kerneltrap>
    80003904:	00013083          	ld	ra,0(sp)
    80003908:	00813103          	ld	sp,8(sp)
    8000390c:	01013183          	ld	gp,16(sp)
    80003910:	02013283          	ld	t0,32(sp)
    80003914:	02813303          	ld	t1,40(sp)
    80003918:	03013383          	ld	t2,48(sp)
    8000391c:	03813403          	ld	s0,56(sp)
    80003920:	04013483          	ld	s1,64(sp)
    80003924:	04813503          	ld	a0,72(sp)
    80003928:	05013583          	ld	a1,80(sp)
    8000392c:	05813603          	ld	a2,88(sp)
    80003930:	06013683          	ld	a3,96(sp)
    80003934:	06813703          	ld	a4,104(sp)
    80003938:	07013783          	ld	a5,112(sp)
    8000393c:	07813803          	ld	a6,120(sp)
    80003940:	08013883          	ld	a7,128(sp)
    80003944:	08813903          	ld	s2,136(sp)
    80003948:	09013983          	ld	s3,144(sp)
    8000394c:	09813a03          	ld	s4,152(sp)
    80003950:	0a013a83          	ld	s5,160(sp)
    80003954:	0a813b03          	ld	s6,168(sp)
    80003958:	0b013b83          	ld	s7,176(sp)
    8000395c:	0b813c03          	ld	s8,184(sp)
    80003960:	0c013c83          	ld	s9,192(sp)
    80003964:	0c813d03          	ld	s10,200(sp)
    80003968:	0d013d83          	ld	s11,208(sp)
    8000396c:	0d813e03          	ld	t3,216(sp)
    80003970:	0e013e83          	ld	t4,224(sp)
    80003974:	0e813f03          	ld	t5,232(sp)
    80003978:	0f013f83          	ld	t6,240(sp)
    8000397c:	10010113          	addi	sp,sp,256
    80003980:	10200073          	sret
    80003984:	00000013          	nop
    80003988:	00000013          	nop
    8000398c:	00000013          	nop

0000000080003990 <timervec>:
    80003990:	34051573          	csrrw	a0,mscratch,a0
    80003994:	00b53023          	sd	a1,0(a0)
    80003998:	00c53423          	sd	a2,8(a0)
    8000399c:	00d53823          	sd	a3,16(a0)
    800039a0:	01853583          	ld	a1,24(a0)
    800039a4:	02053603          	ld	a2,32(a0)
    800039a8:	0005b683          	ld	a3,0(a1)
    800039ac:	00c686b3          	add	a3,a3,a2
    800039b0:	00d5b023          	sd	a3,0(a1)
    800039b4:	00200593          	li	a1,2
    800039b8:	14459073          	csrw	sip,a1
    800039bc:	01053683          	ld	a3,16(a0)
    800039c0:	00853603          	ld	a2,8(a0)
    800039c4:	00053583          	ld	a1,0(a0)
    800039c8:	34051573          	csrrw	a0,mscratch,a0
    800039cc:	30200073          	mret

00000000800039d0 <plicinit>:
    800039d0:	ff010113          	addi	sp,sp,-16
    800039d4:	00813423          	sd	s0,8(sp)
    800039d8:	01010413          	addi	s0,sp,16
    800039dc:	00813403          	ld	s0,8(sp)
    800039e0:	0c0007b7          	lui	a5,0xc000
    800039e4:	00100713          	li	a4,1
    800039e8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800039ec:	00e7a223          	sw	a4,4(a5)
    800039f0:	01010113          	addi	sp,sp,16
    800039f4:	00008067          	ret

00000000800039f8 <plicinithart>:
    800039f8:	ff010113          	addi	sp,sp,-16
    800039fc:	00813023          	sd	s0,0(sp)
    80003a00:	00113423          	sd	ra,8(sp)
    80003a04:	01010413          	addi	s0,sp,16
    80003a08:	00000097          	auipc	ra,0x0
    80003a0c:	a44080e7          	jalr	-1468(ra) # 8000344c <cpuid>
    80003a10:	0085171b          	slliw	a4,a0,0x8
    80003a14:	0c0027b7          	lui	a5,0xc002
    80003a18:	00e787b3          	add	a5,a5,a4
    80003a1c:	40200713          	li	a4,1026
    80003a20:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80003a24:	00813083          	ld	ra,8(sp)
    80003a28:	00013403          	ld	s0,0(sp)
    80003a2c:	00d5151b          	slliw	a0,a0,0xd
    80003a30:	0c2017b7          	lui	a5,0xc201
    80003a34:	00a78533          	add	a0,a5,a0
    80003a38:	00052023          	sw	zero,0(a0)
    80003a3c:	01010113          	addi	sp,sp,16
    80003a40:	00008067          	ret

0000000080003a44 <plic_claim>:
    80003a44:	ff010113          	addi	sp,sp,-16
    80003a48:	00813023          	sd	s0,0(sp)
    80003a4c:	00113423          	sd	ra,8(sp)
    80003a50:	01010413          	addi	s0,sp,16
    80003a54:	00000097          	auipc	ra,0x0
    80003a58:	9f8080e7          	jalr	-1544(ra) # 8000344c <cpuid>
    80003a5c:	00813083          	ld	ra,8(sp)
    80003a60:	00013403          	ld	s0,0(sp)
    80003a64:	00d5151b          	slliw	a0,a0,0xd
    80003a68:	0c2017b7          	lui	a5,0xc201
    80003a6c:	00a78533          	add	a0,a5,a0
    80003a70:	00452503          	lw	a0,4(a0)
    80003a74:	01010113          	addi	sp,sp,16
    80003a78:	00008067          	ret

0000000080003a7c <plic_complete>:
    80003a7c:	fe010113          	addi	sp,sp,-32
    80003a80:	00813823          	sd	s0,16(sp)
    80003a84:	00913423          	sd	s1,8(sp)
    80003a88:	00113c23          	sd	ra,24(sp)
    80003a8c:	02010413          	addi	s0,sp,32
    80003a90:	00050493          	mv	s1,a0
    80003a94:	00000097          	auipc	ra,0x0
    80003a98:	9b8080e7          	jalr	-1608(ra) # 8000344c <cpuid>
    80003a9c:	01813083          	ld	ra,24(sp)
    80003aa0:	01013403          	ld	s0,16(sp)
    80003aa4:	00d5179b          	slliw	a5,a0,0xd
    80003aa8:	0c201737          	lui	a4,0xc201
    80003aac:	00f707b3          	add	a5,a4,a5
    80003ab0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80003ab4:	00813483          	ld	s1,8(sp)
    80003ab8:	02010113          	addi	sp,sp,32
    80003abc:	00008067          	ret

0000000080003ac0 <consolewrite>:
    80003ac0:	fb010113          	addi	sp,sp,-80
    80003ac4:	04813023          	sd	s0,64(sp)
    80003ac8:	04113423          	sd	ra,72(sp)
    80003acc:	02913c23          	sd	s1,56(sp)
    80003ad0:	03213823          	sd	s2,48(sp)
    80003ad4:	03313423          	sd	s3,40(sp)
    80003ad8:	03413023          	sd	s4,32(sp)
    80003adc:	01513c23          	sd	s5,24(sp)
    80003ae0:	05010413          	addi	s0,sp,80
    80003ae4:	06c05c63          	blez	a2,80003b5c <consolewrite+0x9c>
    80003ae8:	00060993          	mv	s3,a2
    80003aec:	00050a13          	mv	s4,a0
    80003af0:	00058493          	mv	s1,a1
    80003af4:	00000913          	li	s2,0
    80003af8:	fff00a93          	li	s5,-1
    80003afc:	01c0006f          	j	80003b18 <consolewrite+0x58>
    80003b00:	fbf44503          	lbu	a0,-65(s0)
    80003b04:	0019091b          	addiw	s2,s2,1
    80003b08:	00148493          	addi	s1,s1,1
    80003b0c:	00001097          	auipc	ra,0x1
    80003b10:	a9c080e7          	jalr	-1380(ra) # 800045a8 <uartputc>
    80003b14:	03298063          	beq	s3,s2,80003b34 <consolewrite+0x74>
    80003b18:	00048613          	mv	a2,s1
    80003b1c:	00100693          	li	a3,1
    80003b20:	000a0593          	mv	a1,s4
    80003b24:	fbf40513          	addi	a0,s0,-65
    80003b28:	00000097          	auipc	ra,0x0
    80003b2c:	9dc080e7          	jalr	-1572(ra) # 80003504 <either_copyin>
    80003b30:	fd5518e3          	bne	a0,s5,80003b00 <consolewrite+0x40>
    80003b34:	04813083          	ld	ra,72(sp)
    80003b38:	04013403          	ld	s0,64(sp)
    80003b3c:	03813483          	ld	s1,56(sp)
    80003b40:	02813983          	ld	s3,40(sp)
    80003b44:	02013a03          	ld	s4,32(sp)
    80003b48:	01813a83          	ld	s5,24(sp)
    80003b4c:	00090513          	mv	a0,s2
    80003b50:	03013903          	ld	s2,48(sp)
    80003b54:	05010113          	addi	sp,sp,80
    80003b58:	00008067          	ret
    80003b5c:	00000913          	li	s2,0
    80003b60:	fd5ff06f          	j	80003b34 <consolewrite+0x74>

0000000080003b64 <consoleread>:
    80003b64:	f9010113          	addi	sp,sp,-112
    80003b68:	06813023          	sd	s0,96(sp)
    80003b6c:	04913c23          	sd	s1,88(sp)
    80003b70:	05213823          	sd	s2,80(sp)
    80003b74:	05313423          	sd	s3,72(sp)
    80003b78:	05413023          	sd	s4,64(sp)
    80003b7c:	03513c23          	sd	s5,56(sp)
    80003b80:	03613823          	sd	s6,48(sp)
    80003b84:	03713423          	sd	s7,40(sp)
    80003b88:	03813023          	sd	s8,32(sp)
    80003b8c:	06113423          	sd	ra,104(sp)
    80003b90:	01913c23          	sd	s9,24(sp)
    80003b94:	07010413          	addi	s0,sp,112
    80003b98:	00060b93          	mv	s7,a2
    80003b9c:	00050913          	mv	s2,a0
    80003ba0:	00058c13          	mv	s8,a1
    80003ba4:	00060b1b          	sext.w	s6,a2
    80003ba8:	00005497          	auipc	s1,0x5
    80003bac:	97048493          	addi	s1,s1,-1680 # 80008518 <cons>
    80003bb0:	00400993          	li	s3,4
    80003bb4:	fff00a13          	li	s4,-1
    80003bb8:	00a00a93          	li	s5,10
    80003bbc:	05705e63          	blez	s7,80003c18 <consoleread+0xb4>
    80003bc0:	09c4a703          	lw	a4,156(s1)
    80003bc4:	0984a783          	lw	a5,152(s1)
    80003bc8:	0007071b          	sext.w	a4,a4
    80003bcc:	08e78463          	beq	a5,a4,80003c54 <consoleread+0xf0>
    80003bd0:	07f7f713          	andi	a4,a5,127
    80003bd4:	00e48733          	add	a4,s1,a4
    80003bd8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80003bdc:	0017869b          	addiw	a3,a5,1
    80003be0:	08d4ac23          	sw	a3,152(s1)
    80003be4:	00070c9b          	sext.w	s9,a4
    80003be8:	0b370663          	beq	a4,s3,80003c94 <consoleread+0x130>
    80003bec:	00100693          	li	a3,1
    80003bf0:	f9f40613          	addi	a2,s0,-97
    80003bf4:	000c0593          	mv	a1,s8
    80003bf8:	00090513          	mv	a0,s2
    80003bfc:	f8e40fa3          	sb	a4,-97(s0)
    80003c00:	00000097          	auipc	ra,0x0
    80003c04:	8b8080e7          	jalr	-1864(ra) # 800034b8 <either_copyout>
    80003c08:	01450863          	beq	a0,s4,80003c18 <consoleread+0xb4>
    80003c0c:	001c0c13          	addi	s8,s8,1
    80003c10:	fffb8b9b          	addiw	s7,s7,-1
    80003c14:	fb5c94e3          	bne	s9,s5,80003bbc <consoleread+0x58>
    80003c18:	000b851b          	sext.w	a0,s7
    80003c1c:	06813083          	ld	ra,104(sp)
    80003c20:	06013403          	ld	s0,96(sp)
    80003c24:	05813483          	ld	s1,88(sp)
    80003c28:	05013903          	ld	s2,80(sp)
    80003c2c:	04813983          	ld	s3,72(sp)
    80003c30:	04013a03          	ld	s4,64(sp)
    80003c34:	03813a83          	ld	s5,56(sp)
    80003c38:	02813b83          	ld	s7,40(sp)
    80003c3c:	02013c03          	ld	s8,32(sp)
    80003c40:	01813c83          	ld	s9,24(sp)
    80003c44:	40ab053b          	subw	a0,s6,a0
    80003c48:	03013b03          	ld	s6,48(sp)
    80003c4c:	07010113          	addi	sp,sp,112
    80003c50:	00008067          	ret
    80003c54:	00001097          	auipc	ra,0x1
    80003c58:	1d8080e7          	jalr	472(ra) # 80004e2c <push_on>
    80003c5c:	0984a703          	lw	a4,152(s1)
    80003c60:	09c4a783          	lw	a5,156(s1)
    80003c64:	0007879b          	sext.w	a5,a5
    80003c68:	fef70ce3          	beq	a4,a5,80003c60 <consoleread+0xfc>
    80003c6c:	00001097          	auipc	ra,0x1
    80003c70:	234080e7          	jalr	564(ra) # 80004ea0 <pop_on>
    80003c74:	0984a783          	lw	a5,152(s1)
    80003c78:	07f7f713          	andi	a4,a5,127
    80003c7c:	00e48733          	add	a4,s1,a4
    80003c80:	01874703          	lbu	a4,24(a4)
    80003c84:	0017869b          	addiw	a3,a5,1
    80003c88:	08d4ac23          	sw	a3,152(s1)
    80003c8c:	00070c9b          	sext.w	s9,a4
    80003c90:	f5371ee3          	bne	a4,s3,80003bec <consoleread+0x88>
    80003c94:	000b851b          	sext.w	a0,s7
    80003c98:	f96bf2e3          	bgeu	s7,s6,80003c1c <consoleread+0xb8>
    80003c9c:	08f4ac23          	sw	a5,152(s1)
    80003ca0:	f7dff06f          	j	80003c1c <consoleread+0xb8>

0000000080003ca4 <consputc>:
    80003ca4:	10000793          	li	a5,256
    80003ca8:	00f50663          	beq	a0,a5,80003cb4 <consputc+0x10>
    80003cac:	00001317          	auipc	t1,0x1
    80003cb0:	9f430067          	jr	-1548(t1) # 800046a0 <uartputc_sync>
    80003cb4:	ff010113          	addi	sp,sp,-16
    80003cb8:	00113423          	sd	ra,8(sp)
    80003cbc:	00813023          	sd	s0,0(sp)
    80003cc0:	01010413          	addi	s0,sp,16
    80003cc4:	00800513          	li	a0,8
    80003cc8:	00001097          	auipc	ra,0x1
    80003ccc:	9d8080e7          	jalr	-1576(ra) # 800046a0 <uartputc_sync>
    80003cd0:	02000513          	li	a0,32
    80003cd4:	00001097          	auipc	ra,0x1
    80003cd8:	9cc080e7          	jalr	-1588(ra) # 800046a0 <uartputc_sync>
    80003cdc:	00013403          	ld	s0,0(sp)
    80003ce0:	00813083          	ld	ra,8(sp)
    80003ce4:	00800513          	li	a0,8
    80003ce8:	01010113          	addi	sp,sp,16
    80003cec:	00001317          	auipc	t1,0x1
    80003cf0:	9b430067          	jr	-1612(t1) # 800046a0 <uartputc_sync>

0000000080003cf4 <consoleintr>:
    80003cf4:	fe010113          	addi	sp,sp,-32
    80003cf8:	00813823          	sd	s0,16(sp)
    80003cfc:	00913423          	sd	s1,8(sp)
    80003d00:	01213023          	sd	s2,0(sp)
    80003d04:	00113c23          	sd	ra,24(sp)
    80003d08:	02010413          	addi	s0,sp,32
    80003d0c:	00005917          	auipc	s2,0x5
    80003d10:	80c90913          	addi	s2,s2,-2036 # 80008518 <cons>
    80003d14:	00050493          	mv	s1,a0
    80003d18:	00090513          	mv	a0,s2
    80003d1c:	00001097          	auipc	ra,0x1
    80003d20:	e40080e7          	jalr	-448(ra) # 80004b5c <acquire>
    80003d24:	02048c63          	beqz	s1,80003d5c <consoleintr+0x68>
    80003d28:	0a092783          	lw	a5,160(s2)
    80003d2c:	09892703          	lw	a4,152(s2)
    80003d30:	07f00693          	li	a3,127
    80003d34:	40e7873b          	subw	a4,a5,a4
    80003d38:	02e6e263          	bltu	a3,a4,80003d5c <consoleintr+0x68>
    80003d3c:	00d00713          	li	a4,13
    80003d40:	04e48063          	beq	s1,a4,80003d80 <consoleintr+0x8c>
    80003d44:	07f7f713          	andi	a4,a5,127
    80003d48:	00e90733          	add	a4,s2,a4
    80003d4c:	0017879b          	addiw	a5,a5,1
    80003d50:	0af92023          	sw	a5,160(s2)
    80003d54:	00970c23          	sb	s1,24(a4)
    80003d58:	08f92e23          	sw	a5,156(s2)
    80003d5c:	01013403          	ld	s0,16(sp)
    80003d60:	01813083          	ld	ra,24(sp)
    80003d64:	00813483          	ld	s1,8(sp)
    80003d68:	00013903          	ld	s2,0(sp)
    80003d6c:	00004517          	auipc	a0,0x4
    80003d70:	7ac50513          	addi	a0,a0,1964 # 80008518 <cons>
    80003d74:	02010113          	addi	sp,sp,32
    80003d78:	00001317          	auipc	t1,0x1
    80003d7c:	eb030067          	jr	-336(t1) # 80004c28 <release>
    80003d80:	00a00493          	li	s1,10
    80003d84:	fc1ff06f          	j	80003d44 <consoleintr+0x50>

0000000080003d88 <consoleinit>:
    80003d88:	fe010113          	addi	sp,sp,-32
    80003d8c:	00113c23          	sd	ra,24(sp)
    80003d90:	00813823          	sd	s0,16(sp)
    80003d94:	00913423          	sd	s1,8(sp)
    80003d98:	02010413          	addi	s0,sp,32
    80003d9c:	00004497          	auipc	s1,0x4
    80003da0:	77c48493          	addi	s1,s1,1916 # 80008518 <cons>
    80003da4:	00048513          	mv	a0,s1
    80003da8:	00002597          	auipc	a1,0x2
    80003dac:	65058593          	addi	a1,a1,1616 # 800063f8 <CONSOLE_STATUS+0x3e8>
    80003db0:	00001097          	auipc	ra,0x1
    80003db4:	d88080e7          	jalr	-632(ra) # 80004b38 <initlock>
    80003db8:	00000097          	auipc	ra,0x0
    80003dbc:	7ac080e7          	jalr	1964(ra) # 80004564 <uartinit>
    80003dc0:	01813083          	ld	ra,24(sp)
    80003dc4:	01013403          	ld	s0,16(sp)
    80003dc8:	00000797          	auipc	a5,0x0
    80003dcc:	d9c78793          	addi	a5,a5,-612 # 80003b64 <consoleread>
    80003dd0:	0af4bc23          	sd	a5,184(s1)
    80003dd4:	00000797          	auipc	a5,0x0
    80003dd8:	cec78793          	addi	a5,a5,-788 # 80003ac0 <consolewrite>
    80003ddc:	0cf4b023          	sd	a5,192(s1)
    80003de0:	00813483          	ld	s1,8(sp)
    80003de4:	02010113          	addi	sp,sp,32
    80003de8:	00008067          	ret

0000000080003dec <console_read>:
    80003dec:	ff010113          	addi	sp,sp,-16
    80003df0:	00813423          	sd	s0,8(sp)
    80003df4:	01010413          	addi	s0,sp,16
    80003df8:	00813403          	ld	s0,8(sp)
    80003dfc:	00004317          	auipc	t1,0x4
    80003e00:	7d433303          	ld	t1,2004(t1) # 800085d0 <devsw+0x10>
    80003e04:	01010113          	addi	sp,sp,16
    80003e08:	00030067          	jr	t1

0000000080003e0c <console_write>:
    80003e0c:	ff010113          	addi	sp,sp,-16
    80003e10:	00813423          	sd	s0,8(sp)
    80003e14:	01010413          	addi	s0,sp,16
    80003e18:	00813403          	ld	s0,8(sp)
    80003e1c:	00004317          	auipc	t1,0x4
    80003e20:	7bc33303          	ld	t1,1980(t1) # 800085d8 <devsw+0x18>
    80003e24:	01010113          	addi	sp,sp,16
    80003e28:	00030067          	jr	t1

0000000080003e2c <panic>:
    80003e2c:	fe010113          	addi	sp,sp,-32
    80003e30:	00113c23          	sd	ra,24(sp)
    80003e34:	00813823          	sd	s0,16(sp)
    80003e38:	00913423          	sd	s1,8(sp)
    80003e3c:	02010413          	addi	s0,sp,32
    80003e40:	00050493          	mv	s1,a0
    80003e44:	00002517          	auipc	a0,0x2
    80003e48:	5bc50513          	addi	a0,a0,1468 # 80006400 <CONSOLE_STATUS+0x3f0>
    80003e4c:	00005797          	auipc	a5,0x5
    80003e50:	8207a623          	sw	zero,-2004(a5) # 80008678 <pr+0x18>
    80003e54:	00000097          	auipc	ra,0x0
    80003e58:	034080e7          	jalr	52(ra) # 80003e88 <__printf>
    80003e5c:	00048513          	mv	a0,s1
    80003e60:	00000097          	auipc	ra,0x0
    80003e64:	028080e7          	jalr	40(ra) # 80003e88 <__printf>
    80003e68:	00002517          	auipc	a0,0x2
    80003e6c:	57850513          	addi	a0,a0,1400 # 800063e0 <CONSOLE_STATUS+0x3d0>
    80003e70:	00000097          	auipc	ra,0x0
    80003e74:	018080e7          	jalr	24(ra) # 80003e88 <__printf>
    80003e78:	00100793          	li	a5,1
    80003e7c:	00003717          	auipc	a4,0x3
    80003e80:	54f72623          	sw	a5,1356(a4) # 800073c8 <panicked>
    80003e84:	0000006f          	j	80003e84 <panic+0x58>

0000000080003e88 <__printf>:
    80003e88:	f3010113          	addi	sp,sp,-208
    80003e8c:	08813023          	sd	s0,128(sp)
    80003e90:	07313423          	sd	s3,104(sp)
    80003e94:	09010413          	addi	s0,sp,144
    80003e98:	05813023          	sd	s8,64(sp)
    80003e9c:	08113423          	sd	ra,136(sp)
    80003ea0:	06913c23          	sd	s1,120(sp)
    80003ea4:	07213823          	sd	s2,112(sp)
    80003ea8:	07413023          	sd	s4,96(sp)
    80003eac:	05513c23          	sd	s5,88(sp)
    80003eb0:	05613823          	sd	s6,80(sp)
    80003eb4:	05713423          	sd	s7,72(sp)
    80003eb8:	03913c23          	sd	s9,56(sp)
    80003ebc:	03a13823          	sd	s10,48(sp)
    80003ec0:	03b13423          	sd	s11,40(sp)
    80003ec4:	00004317          	auipc	t1,0x4
    80003ec8:	79c30313          	addi	t1,t1,1948 # 80008660 <pr>
    80003ecc:	01832c03          	lw	s8,24(t1)
    80003ed0:	00b43423          	sd	a1,8(s0)
    80003ed4:	00c43823          	sd	a2,16(s0)
    80003ed8:	00d43c23          	sd	a3,24(s0)
    80003edc:	02e43023          	sd	a4,32(s0)
    80003ee0:	02f43423          	sd	a5,40(s0)
    80003ee4:	03043823          	sd	a6,48(s0)
    80003ee8:	03143c23          	sd	a7,56(s0)
    80003eec:	00050993          	mv	s3,a0
    80003ef0:	4a0c1663          	bnez	s8,8000439c <__printf+0x514>
    80003ef4:	60098c63          	beqz	s3,8000450c <__printf+0x684>
    80003ef8:	0009c503          	lbu	a0,0(s3)
    80003efc:	00840793          	addi	a5,s0,8
    80003f00:	f6f43c23          	sd	a5,-136(s0)
    80003f04:	00000493          	li	s1,0
    80003f08:	22050063          	beqz	a0,80004128 <__printf+0x2a0>
    80003f0c:	00002a37          	lui	s4,0x2
    80003f10:	00018ab7          	lui	s5,0x18
    80003f14:	000f4b37          	lui	s6,0xf4
    80003f18:	00989bb7          	lui	s7,0x989
    80003f1c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80003f20:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80003f24:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80003f28:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80003f2c:	00148c9b          	addiw	s9,s1,1
    80003f30:	02500793          	li	a5,37
    80003f34:	01998933          	add	s2,s3,s9
    80003f38:	38f51263          	bne	a0,a5,800042bc <__printf+0x434>
    80003f3c:	00094783          	lbu	a5,0(s2)
    80003f40:	00078c9b          	sext.w	s9,a5
    80003f44:	1e078263          	beqz	a5,80004128 <__printf+0x2a0>
    80003f48:	0024849b          	addiw	s1,s1,2
    80003f4c:	07000713          	li	a4,112
    80003f50:	00998933          	add	s2,s3,s1
    80003f54:	38e78a63          	beq	a5,a4,800042e8 <__printf+0x460>
    80003f58:	20f76863          	bltu	a4,a5,80004168 <__printf+0x2e0>
    80003f5c:	42a78863          	beq	a5,a0,8000438c <__printf+0x504>
    80003f60:	06400713          	li	a4,100
    80003f64:	40e79663          	bne	a5,a4,80004370 <__printf+0x4e8>
    80003f68:	f7843783          	ld	a5,-136(s0)
    80003f6c:	0007a603          	lw	a2,0(a5)
    80003f70:	00878793          	addi	a5,a5,8
    80003f74:	f6f43c23          	sd	a5,-136(s0)
    80003f78:	42064a63          	bltz	a2,800043ac <__printf+0x524>
    80003f7c:	00a00713          	li	a4,10
    80003f80:	02e677bb          	remuw	a5,a2,a4
    80003f84:	00002d97          	auipc	s11,0x2
    80003f88:	4a4d8d93          	addi	s11,s11,1188 # 80006428 <digits>
    80003f8c:	00900593          	li	a1,9
    80003f90:	0006051b          	sext.w	a0,a2
    80003f94:	00000c93          	li	s9,0
    80003f98:	02079793          	slli	a5,a5,0x20
    80003f9c:	0207d793          	srli	a5,a5,0x20
    80003fa0:	00fd87b3          	add	a5,s11,a5
    80003fa4:	0007c783          	lbu	a5,0(a5)
    80003fa8:	02e656bb          	divuw	a3,a2,a4
    80003fac:	f8f40023          	sb	a5,-128(s0)
    80003fb0:	14c5d863          	bge	a1,a2,80004100 <__printf+0x278>
    80003fb4:	06300593          	li	a1,99
    80003fb8:	00100c93          	li	s9,1
    80003fbc:	02e6f7bb          	remuw	a5,a3,a4
    80003fc0:	02079793          	slli	a5,a5,0x20
    80003fc4:	0207d793          	srli	a5,a5,0x20
    80003fc8:	00fd87b3          	add	a5,s11,a5
    80003fcc:	0007c783          	lbu	a5,0(a5)
    80003fd0:	02e6d73b          	divuw	a4,a3,a4
    80003fd4:	f8f400a3          	sb	a5,-127(s0)
    80003fd8:	12a5f463          	bgeu	a1,a0,80004100 <__printf+0x278>
    80003fdc:	00a00693          	li	a3,10
    80003fe0:	00900593          	li	a1,9
    80003fe4:	02d777bb          	remuw	a5,a4,a3
    80003fe8:	02079793          	slli	a5,a5,0x20
    80003fec:	0207d793          	srli	a5,a5,0x20
    80003ff0:	00fd87b3          	add	a5,s11,a5
    80003ff4:	0007c503          	lbu	a0,0(a5)
    80003ff8:	02d757bb          	divuw	a5,a4,a3
    80003ffc:	f8a40123          	sb	a0,-126(s0)
    80004000:	48e5f263          	bgeu	a1,a4,80004484 <__printf+0x5fc>
    80004004:	06300513          	li	a0,99
    80004008:	02d7f5bb          	remuw	a1,a5,a3
    8000400c:	02059593          	slli	a1,a1,0x20
    80004010:	0205d593          	srli	a1,a1,0x20
    80004014:	00bd85b3          	add	a1,s11,a1
    80004018:	0005c583          	lbu	a1,0(a1)
    8000401c:	02d7d7bb          	divuw	a5,a5,a3
    80004020:	f8b401a3          	sb	a1,-125(s0)
    80004024:	48e57263          	bgeu	a0,a4,800044a8 <__printf+0x620>
    80004028:	3e700513          	li	a0,999
    8000402c:	02d7f5bb          	remuw	a1,a5,a3
    80004030:	02059593          	slli	a1,a1,0x20
    80004034:	0205d593          	srli	a1,a1,0x20
    80004038:	00bd85b3          	add	a1,s11,a1
    8000403c:	0005c583          	lbu	a1,0(a1)
    80004040:	02d7d7bb          	divuw	a5,a5,a3
    80004044:	f8b40223          	sb	a1,-124(s0)
    80004048:	46e57663          	bgeu	a0,a4,800044b4 <__printf+0x62c>
    8000404c:	02d7f5bb          	remuw	a1,a5,a3
    80004050:	02059593          	slli	a1,a1,0x20
    80004054:	0205d593          	srli	a1,a1,0x20
    80004058:	00bd85b3          	add	a1,s11,a1
    8000405c:	0005c583          	lbu	a1,0(a1)
    80004060:	02d7d7bb          	divuw	a5,a5,a3
    80004064:	f8b402a3          	sb	a1,-123(s0)
    80004068:	46ea7863          	bgeu	s4,a4,800044d8 <__printf+0x650>
    8000406c:	02d7f5bb          	remuw	a1,a5,a3
    80004070:	02059593          	slli	a1,a1,0x20
    80004074:	0205d593          	srli	a1,a1,0x20
    80004078:	00bd85b3          	add	a1,s11,a1
    8000407c:	0005c583          	lbu	a1,0(a1)
    80004080:	02d7d7bb          	divuw	a5,a5,a3
    80004084:	f8b40323          	sb	a1,-122(s0)
    80004088:	3eeaf863          	bgeu	s5,a4,80004478 <__printf+0x5f0>
    8000408c:	02d7f5bb          	remuw	a1,a5,a3
    80004090:	02059593          	slli	a1,a1,0x20
    80004094:	0205d593          	srli	a1,a1,0x20
    80004098:	00bd85b3          	add	a1,s11,a1
    8000409c:	0005c583          	lbu	a1,0(a1)
    800040a0:	02d7d7bb          	divuw	a5,a5,a3
    800040a4:	f8b403a3          	sb	a1,-121(s0)
    800040a8:	42eb7e63          	bgeu	s6,a4,800044e4 <__printf+0x65c>
    800040ac:	02d7f5bb          	remuw	a1,a5,a3
    800040b0:	02059593          	slli	a1,a1,0x20
    800040b4:	0205d593          	srli	a1,a1,0x20
    800040b8:	00bd85b3          	add	a1,s11,a1
    800040bc:	0005c583          	lbu	a1,0(a1)
    800040c0:	02d7d7bb          	divuw	a5,a5,a3
    800040c4:	f8b40423          	sb	a1,-120(s0)
    800040c8:	42ebfc63          	bgeu	s7,a4,80004500 <__printf+0x678>
    800040cc:	02079793          	slli	a5,a5,0x20
    800040d0:	0207d793          	srli	a5,a5,0x20
    800040d4:	00fd8db3          	add	s11,s11,a5
    800040d8:	000dc703          	lbu	a4,0(s11)
    800040dc:	00a00793          	li	a5,10
    800040e0:	00900c93          	li	s9,9
    800040e4:	f8e404a3          	sb	a4,-119(s0)
    800040e8:	00065c63          	bgez	a2,80004100 <__printf+0x278>
    800040ec:	f9040713          	addi	a4,s0,-112
    800040f0:	00f70733          	add	a4,a4,a5
    800040f4:	02d00693          	li	a3,45
    800040f8:	fed70823          	sb	a3,-16(a4)
    800040fc:	00078c93          	mv	s9,a5
    80004100:	f8040793          	addi	a5,s0,-128
    80004104:	01978cb3          	add	s9,a5,s9
    80004108:	f7f40d13          	addi	s10,s0,-129
    8000410c:	000cc503          	lbu	a0,0(s9)
    80004110:	fffc8c93          	addi	s9,s9,-1
    80004114:	00000097          	auipc	ra,0x0
    80004118:	b90080e7          	jalr	-1136(ra) # 80003ca4 <consputc>
    8000411c:	ffac98e3          	bne	s9,s10,8000410c <__printf+0x284>
    80004120:	00094503          	lbu	a0,0(s2)
    80004124:	e00514e3          	bnez	a0,80003f2c <__printf+0xa4>
    80004128:	1a0c1663          	bnez	s8,800042d4 <__printf+0x44c>
    8000412c:	08813083          	ld	ra,136(sp)
    80004130:	08013403          	ld	s0,128(sp)
    80004134:	07813483          	ld	s1,120(sp)
    80004138:	07013903          	ld	s2,112(sp)
    8000413c:	06813983          	ld	s3,104(sp)
    80004140:	06013a03          	ld	s4,96(sp)
    80004144:	05813a83          	ld	s5,88(sp)
    80004148:	05013b03          	ld	s6,80(sp)
    8000414c:	04813b83          	ld	s7,72(sp)
    80004150:	04013c03          	ld	s8,64(sp)
    80004154:	03813c83          	ld	s9,56(sp)
    80004158:	03013d03          	ld	s10,48(sp)
    8000415c:	02813d83          	ld	s11,40(sp)
    80004160:	0d010113          	addi	sp,sp,208
    80004164:	00008067          	ret
    80004168:	07300713          	li	a4,115
    8000416c:	1ce78a63          	beq	a5,a4,80004340 <__printf+0x4b8>
    80004170:	07800713          	li	a4,120
    80004174:	1ee79e63          	bne	a5,a4,80004370 <__printf+0x4e8>
    80004178:	f7843783          	ld	a5,-136(s0)
    8000417c:	0007a703          	lw	a4,0(a5)
    80004180:	00878793          	addi	a5,a5,8
    80004184:	f6f43c23          	sd	a5,-136(s0)
    80004188:	28074263          	bltz	a4,8000440c <__printf+0x584>
    8000418c:	00002d97          	auipc	s11,0x2
    80004190:	29cd8d93          	addi	s11,s11,668 # 80006428 <digits>
    80004194:	00f77793          	andi	a5,a4,15
    80004198:	00fd87b3          	add	a5,s11,a5
    8000419c:	0007c683          	lbu	a3,0(a5)
    800041a0:	00f00613          	li	a2,15
    800041a4:	0007079b          	sext.w	a5,a4
    800041a8:	f8d40023          	sb	a3,-128(s0)
    800041ac:	0047559b          	srliw	a1,a4,0x4
    800041b0:	0047569b          	srliw	a3,a4,0x4
    800041b4:	00000c93          	li	s9,0
    800041b8:	0ee65063          	bge	a2,a4,80004298 <__printf+0x410>
    800041bc:	00f6f693          	andi	a3,a3,15
    800041c0:	00dd86b3          	add	a3,s11,a3
    800041c4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800041c8:	0087d79b          	srliw	a5,a5,0x8
    800041cc:	00100c93          	li	s9,1
    800041d0:	f8d400a3          	sb	a3,-127(s0)
    800041d4:	0cb67263          	bgeu	a2,a1,80004298 <__printf+0x410>
    800041d8:	00f7f693          	andi	a3,a5,15
    800041dc:	00dd86b3          	add	a3,s11,a3
    800041e0:	0006c583          	lbu	a1,0(a3)
    800041e4:	00f00613          	li	a2,15
    800041e8:	0047d69b          	srliw	a3,a5,0x4
    800041ec:	f8b40123          	sb	a1,-126(s0)
    800041f0:	0047d593          	srli	a1,a5,0x4
    800041f4:	28f67e63          	bgeu	a2,a5,80004490 <__printf+0x608>
    800041f8:	00f6f693          	andi	a3,a3,15
    800041fc:	00dd86b3          	add	a3,s11,a3
    80004200:	0006c503          	lbu	a0,0(a3)
    80004204:	0087d813          	srli	a6,a5,0x8
    80004208:	0087d69b          	srliw	a3,a5,0x8
    8000420c:	f8a401a3          	sb	a0,-125(s0)
    80004210:	28b67663          	bgeu	a2,a1,8000449c <__printf+0x614>
    80004214:	00f6f693          	andi	a3,a3,15
    80004218:	00dd86b3          	add	a3,s11,a3
    8000421c:	0006c583          	lbu	a1,0(a3)
    80004220:	00c7d513          	srli	a0,a5,0xc
    80004224:	00c7d69b          	srliw	a3,a5,0xc
    80004228:	f8b40223          	sb	a1,-124(s0)
    8000422c:	29067a63          	bgeu	a2,a6,800044c0 <__printf+0x638>
    80004230:	00f6f693          	andi	a3,a3,15
    80004234:	00dd86b3          	add	a3,s11,a3
    80004238:	0006c583          	lbu	a1,0(a3)
    8000423c:	0107d813          	srli	a6,a5,0x10
    80004240:	0107d69b          	srliw	a3,a5,0x10
    80004244:	f8b402a3          	sb	a1,-123(s0)
    80004248:	28a67263          	bgeu	a2,a0,800044cc <__printf+0x644>
    8000424c:	00f6f693          	andi	a3,a3,15
    80004250:	00dd86b3          	add	a3,s11,a3
    80004254:	0006c683          	lbu	a3,0(a3)
    80004258:	0147d79b          	srliw	a5,a5,0x14
    8000425c:	f8d40323          	sb	a3,-122(s0)
    80004260:	21067663          	bgeu	a2,a6,8000446c <__printf+0x5e4>
    80004264:	02079793          	slli	a5,a5,0x20
    80004268:	0207d793          	srli	a5,a5,0x20
    8000426c:	00fd8db3          	add	s11,s11,a5
    80004270:	000dc683          	lbu	a3,0(s11)
    80004274:	00800793          	li	a5,8
    80004278:	00700c93          	li	s9,7
    8000427c:	f8d403a3          	sb	a3,-121(s0)
    80004280:	00075c63          	bgez	a4,80004298 <__printf+0x410>
    80004284:	f9040713          	addi	a4,s0,-112
    80004288:	00f70733          	add	a4,a4,a5
    8000428c:	02d00693          	li	a3,45
    80004290:	fed70823          	sb	a3,-16(a4)
    80004294:	00078c93          	mv	s9,a5
    80004298:	f8040793          	addi	a5,s0,-128
    8000429c:	01978cb3          	add	s9,a5,s9
    800042a0:	f7f40d13          	addi	s10,s0,-129
    800042a4:	000cc503          	lbu	a0,0(s9)
    800042a8:	fffc8c93          	addi	s9,s9,-1
    800042ac:	00000097          	auipc	ra,0x0
    800042b0:	9f8080e7          	jalr	-1544(ra) # 80003ca4 <consputc>
    800042b4:	ff9d18e3          	bne	s10,s9,800042a4 <__printf+0x41c>
    800042b8:	0100006f          	j	800042c8 <__printf+0x440>
    800042bc:	00000097          	auipc	ra,0x0
    800042c0:	9e8080e7          	jalr	-1560(ra) # 80003ca4 <consputc>
    800042c4:	000c8493          	mv	s1,s9
    800042c8:	00094503          	lbu	a0,0(s2)
    800042cc:	c60510e3          	bnez	a0,80003f2c <__printf+0xa4>
    800042d0:	e40c0ee3          	beqz	s8,8000412c <__printf+0x2a4>
    800042d4:	00004517          	auipc	a0,0x4
    800042d8:	38c50513          	addi	a0,a0,908 # 80008660 <pr>
    800042dc:	00001097          	auipc	ra,0x1
    800042e0:	94c080e7          	jalr	-1716(ra) # 80004c28 <release>
    800042e4:	e49ff06f          	j	8000412c <__printf+0x2a4>
    800042e8:	f7843783          	ld	a5,-136(s0)
    800042ec:	03000513          	li	a0,48
    800042f0:	01000d13          	li	s10,16
    800042f4:	00878713          	addi	a4,a5,8
    800042f8:	0007bc83          	ld	s9,0(a5)
    800042fc:	f6e43c23          	sd	a4,-136(s0)
    80004300:	00000097          	auipc	ra,0x0
    80004304:	9a4080e7          	jalr	-1628(ra) # 80003ca4 <consputc>
    80004308:	07800513          	li	a0,120
    8000430c:	00000097          	auipc	ra,0x0
    80004310:	998080e7          	jalr	-1640(ra) # 80003ca4 <consputc>
    80004314:	00002d97          	auipc	s11,0x2
    80004318:	114d8d93          	addi	s11,s11,276 # 80006428 <digits>
    8000431c:	03ccd793          	srli	a5,s9,0x3c
    80004320:	00fd87b3          	add	a5,s11,a5
    80004324:	0007c503          	lbu	a0,0(a5)
    80004328:	fffd0d1b          	addiw	s10,s10,-1
    8000432c:	004c9c93          	slli	s9,s9,0x4
    80004330:	00000097          	auipc	ra,0x0
    80004334:	974080e7          	jalr	-1676(ra) # 80003ca4 <consputc>
    80004338:	fe0d12e3          	bnez	s10,8000431c <__printf+0x494>
    8000433c:	f8dff06f          	j	800042c8 <__printf+0x440>
    80004340:	f7843783          	ld	a5,-136(s0)
    80004344:	0007bc83          	ld	s9,0(a5)
    80004348:	00878793          	addi	a5,a5,8
    8000434c:	f6f43c23          	sd	a5,-136(s0)
    80004350:	000c9a63          	bnez	s9,80004364 <__printf+0x4dc>
    80004354:	1080006f          	j	8000445c <__printf+0x5d4>
    80004358:	001c8c93          	addi	s9,s9,1
    8000435c:	00000097          	auipc	ra,0x0
    80004360:	948080e7          	jalr	-1720(ra) # 80003ca4 <consputc>
    80004364:	000cc503          	lbu	a0,0(s9)
    80004368:	fe0518e3          	bnez	a0,80004358 <__printf+0x4d0>
    8000436c:	f5dff06f          	j	800042c8 <__printf+0x440>
    80004370:	02500513          	li	a0,37
    80004374:	00000097          	auipc	ra,0x0
    80004378:	930080e7          	jalr	-1744(ra) # 80003ca4 <consputc>
    8000437c:	000c8513          	mv	a0,s9
    80004380:	00000097          	auipc	ra,0x0
    80004384:	924080e7          	jalr	-1756(ra) # 80003ca4 <consputc>
    80004388:	f41ff06f          	j	800042c8 <__printf+0x440>
    8000438c:	02500513          	li	a0,37
    80004390:	00000097          	auipc	ra,0x0
    80004394:	914080e7          	jalr	-1772(ra) # 80003ca4 <consputc>
    80004398:	f31ff06f          	j	800042c8 <__printf+0x440>
    8000439c:	00030513          	mv	a0,t1
    800043a0:	00000097          	auipc	ra,0x0
    800043a4:	7bc080e7          	jalr	1980(ra) # 80004b5c <acquire>
    800043a8:	b4dff06f          	j	80003ef4 <__printf+0x6c>
    800043ac:	40c0053b          	negw	a0,a2
    800043b0:	00a00713          	li	a4,10
    800043b4:	02e576bb          	remuw	a3,a0,a4
    800043b8:	00002d97          	auipc	s11,0x2
    800043bc:	070d8d93          	addi	s11,s11,112 # 80006428 <digits>
    800043c0:	ff700593          	li	a1,-9
    800043c4:	02069693          	slli	a3,a3,0x20
    800043c8:	0206d693          	srli	a3,a3,0x20
    800043cc:	00dd86b3          	add	a3,s11,a3
    800043d0:	0006c683          	lbu	a3,0(a3)
    800043d4:	02e557bb          	divuw	a5,a0,a4
    800043d8:	f8d40023          	sb	a3,-128(s0)
    800043dc:	10b65e63          	bge	a2,a1,800044f8 <__printf+0x670>
    800043e0:	06300593          	li	a1,99
    800043e4:	02e7f6bb          	remuw	a3,a5,a4
    800043e8:	02069693          	slli	a3,a3,0x20
    800043ec:	0206d693          	srli	a3,a3,0x20
    800043f0:	00dd86b3          	add	a3,s11,a3
    800043f4:	0006c683          	lbu	a3,0(a3)
    800043f8:	02e7d73b          	divuw	a4,a5,a4
    800043fc:	00200793          	li	a5,2
    80004400:	f8d400a3          	sb	a3,-127(s0)
    80004404:	bca5ece3          	bltu	a1,a0,80003fdc <__printf+0x154>
    80004408:	ce5ff06f          	j	800040ec <__printf+0x264>
    8000440c:	40e007bb          	negw	a5,a4
    80004410:	00002d97          	auipc	s11,0x2
    80004414:	018d8d93          	addi	s11,s11,24 # 80006428 <digits>
    80004418:	00f7f693          	andi	a3,a5,15
    8000441c:	00dd86b3          	add	a3,s11,a3
    80004420:	0006c583          	lbu	a1,0(a3)
    80004424:	ff100613          	li	a2,-15
    80004428:	0047d69b          	srliw	a3,a5,0x4
    8000442c:	f8b40023          	sb	a1,-128(s0)
    80004430:	0047d59b          	srliw	a1,a5,0x4
    80004434:	0ac75e63          	bge	a4,a2,800044f0 <__printf+0x668>
    80004438:	00f6f693          	andi	a3,a3,15
    8000443c:	00dd86b3          	add	a3,s11,a3
    80004440:	0006c603          	lbu	a2,0(a3)
    80004444:	00f00693          	li	a3,15
    80004448:	0087d79b          	srliw	a5,a5,0x8
    8000444c:	f8c400a3          	sb	a2,-127(s0)
    80004450:	d8b6e4e3          	bltu	a3,a1,800041d8 <__printf+0x350>
    80004454:	00200793          	li	a5,2
    80004458:	e2dff06f          	j	80004284 <__printf+0x3fc>
    8000445c:	00002c97          	auipc	s9,0x2
    80004460:	facc8c93          	addi	s9,s9,-84 # 80006408 <CONSOLE_STATUS+0x3f8>
    80004464:	02800513          	li	a0,40
    80004468:	ef1ff06f          	j	80004358 <__printf+0x4d0>
    8000446c:	00700793          	li	a5,7
    80004470:	00600c93          	li	s9,6
    80004474:	e0dff06f          	j	80004280 <__printf+0x3f8>
    80004478:	00700793          	li	a5,7
    8000447c:	00600c93          	li	s9,6
    80004480:	c69ff06f          	j	800040e8 <__printf+0x260>
    80004484:	00300793          	li	a5,3
    80004488:	00200c93          	li	s9,2
    8000448c:	c5dff06f          	j	800040e8 <__printf+0x260>
    80004490:	00300793          	li	a5,3
    80004494:	00200c93          	li	s9,2
    80004498:	de9ff06f          	j	80004280 <__printf+0x3f8>
    8000449c:	00400793          	li	a5,4
    800044a0:	00300c93          	li	s9,3
    800044a4:	dddff06f          	j	80004280 <__printf+0x3f8>
    800044a8:	00400793          	li	a5,4
    800044ac:	00300c93          	li	s9,3
    800044b0:	c39ff06f          	j	800040e8 <__printf+0x260>
    800044b4:	00500793          	li	a5,5
    800044b8:	00400c93          	li	s9,4
    800044bc:	c2dff06f          	j	800040e8 <__printf+0x260>
    800044c0:	00500793          	li	a5,5
    800044c4:	00400c93          	li	s9,4
    800044c8:	db9ff06f          	j	80004280 <__printf+0x3f8>
    800044cc:	00600793          	li	a5,6
    800044d0:	00500c93          	li	s9,5
    800044d4:	dadff06f          	j	80004280 <__printf+0x3f8>
    800044d8:	00600793          	li	a5,6
    800044dc:	00500c93          	li	s9,5
    800044e0:	c09ff06f          	j	800040e8 <__printf+0x260>
    800044e4:	00800793          	li	a5,8
    800044e8:	00700c93          	li	s9,7
    800044ec:	bfdff06f          	j	800040e8 <__printf+0x260>
    800044f0:	00100793          	li	a5,1
    800044f4:	d91ff06f          	j	80004284 <__printf+0x3fc>
    800044f8:	00100793          	li	a5,1
    800044fc:	bf1ff06f          	j	800040ec <__printf+0x264>
    80004500:	00900793          	li	a5,9
    80004504:	00800c93          	li	s9,8
    80004508:	be1ff06f          	j	800040e8 <__printf+0x260>
    8000450c:	00002517          	auipc	a0,0x2
    80004510:	f0450513          	addi	a0,a0,-252 # 80006410 <CONSOLE_STATUS+0x400>
    80004514:	00000097          	auipc	ra,0x0
    80004518:	918080e7          	jalr	-1768(ra) # 80003e2c <panic>

000000008000451c <printfinit>:
    8000451c:	fe010113          	addi	sp,sp,-32
    80004520:	00813823          	sd	s0,16(sp)
    80004524:	00913423          	sd	s1,8(sp)
    80004528:	00113c23          	sd	ra,24(sp)
    8000452c:	02010413          	addi	s0,sp,32
    80004530:	00004497          	auipc	s1,0x4
    80004534:	13048493          	addi	s1,s1,304 # 80008660 <pr>
    80004538:	00048513          	mv	a0,s1
    8000453c:	00002597          	auipc	a1,0x2
    80004540:	ee458593          	addi	a1,a1,-284 # 80006420 <CONSOLE_STATUS+0x410>
    80004544:	00000097          	auipc	ra,0x0
    80004548:	5f4080e7          	jalr	1524(ra) # 80004b38 <initlock>
    8000454c:	01813083          	ld	ra,24(sp)
    80004550:	01013403          	ld	s0,16(sp)
    80004554:	0004ac23          	sw	zero,24(s1)
    80004558:	00813483          	ld	s1,8(sp)
    8000455c:	02010113          	addi	sp,sp,32
    80004560:	00008067          	ret

0000000080004564 <uartinit>:
    80004564:	ff010113          	addi	sp,sp,-16
    80004568:	00813423          	sd	s0,8(sp)
    8000456c:	01010413          	addi	s0,sp,16
    80004570:	100007b7          	lui	a5,0x10000
    80004574:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80004578:	f8000713          	li	a4,-128
    8000457c:	00e781a3          	sb	a4,3(a5)
    80004580:	00300713          	li	a4,3
    80004584:	00e78023          	sb	a4,0(a5)
    80004588:	000780a3          	sb	zero,1(a5)
    8000458c:	00e781a3          	sb	a4,3(a5)
    80004590:	00700693          	li	a3,7
    80004594:	00d78123          	sb	a3,2(a5)
    80004598:	00e780a3          	sb	a4,1(a5)
    8000459c:	00813403          	ld	s0,8(sp)
    800045a0:	01010113          	addi	sp,sp,16
    800045a4:	00008067          	ret

00000000800045a8 <uartputc>:
    800045a8:	00003797          	auipc	a5,0x3
    800045ac:	e207a783          	lw	a5,-480(a5) # 800073c8 <panicked>
    800045b0:	00078463          	beqz	a5,800045b8 <uartputc+0x10>
    800045b4:	0000006f          	j	800045b4 <uartputc+0xc>
    800045b8:	fd010113          	addi	sp,sp,-48
    800045bc:	02813023          	sd	s0,32(sp)
    800045c0:	00913c23          	sd	s1,24(sp)
    800045c4:	01213823          	sd	s2,16(sp)
    800045c8:	01313423          	sd	s3,8(sp)
    800045cc:	02113423          	sd	ra,40(sp)
    800045d0:	03010413          	addi	s0,sp,48
    800045d4:	00003917          	auipc	s2,0x3
    800045d8:	dfc90913          	addi	s2,s2,-516 # 800073d0 <uart_tx_r>
    800045dc:	00093783          	ld	a5,0(s2)
    800045e0:	00003497          	auipc	s1,0x3
    800045e4:	df848493          	addi	s1,s1,-520 # 800073d8 <uart_tx_w>
    800045e8:	0004b703          	ld	a4,0(s1)
    800045ec:	02078693          	addi	a3,a5,32
    800045f0:	00050993          	mv	s3,a0
    800045f4:	02e69c63          	bne	a3,a4,8000462c <uartputc+0x84>
    800045f8:	00001097          	auipc	ra,0x1
    800045fc:	834080e7          	jalr	-1996(ra) # 80004e2c <push_on>
    80004600:	00093783          	ld	a5,0(s2)
    80004604:	0004b703          	ld	a4,0(s1)
    80004608:	02078793          	addi	a5,a5,32
    8000460c:	00e79463          	bne	a5,a4,80004614 <uartputc+0x6c>
    80004610:	0000006f          	j	80004610 <uartputc+0x68>
    80004614:	00001097          	auipc	ra,0x1
    80004618:	88c080e7          	jalr	-1908(ra) # 80004ea0 <pop_on>
    8000461c:	00093783          	ld	a5,0(s2)
    80004620:	0004b703          	ld	a4,0(s1)
    80004624:	02078693          	addi	a3,a5,32
    80004628:	fce688e3          	beq	a3,a4,800045f8 <uartputc+0x50>
    8000462c:	01f77693          	andi	a3,a4,31
    80004630:	00004597          	auipc	a1,0x4
    80004634:	05058593          	addi	a1,a1,80 # 80008680 <uart_tx_buf>
    80004638:	00d586b3          	add	a3,a1,a3
    8000463c:	00170713          	addi	a4,a4,1
    80004640:	01368023          	sb	s3,0(a3)
    80004644:	00e4b023          	sd	a4,0(s1)
    80004648:	10000637          	lui	a2,0x10000
    8000464c:	02f71063          	bne	a4,a5,8000466c <uartputc+0xc4>
    80004650:	0340006f          	j	80004684 <uartputc+0xdc>
    80004654:	00074703          	lbu	a4,0(a4)
    80004658:	00f93023          	sd	a5,0(s2)
    8000465c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80004660:	00093783          	ld	a5,0(s2)
    80004664:	0004b703          	ld	a4,0(s1)
    80004668:	00f70e63          	beq	a4,a5,80004684 <uartputc+0xdc>
    8000466c:	00564683          	lbu	a3,5(a2)
    80004670:	01f7f713          	andi	a4,a5,31
    80004674:	00e58733          	add	a4,a1,a4
    80004678:	0206f693          	andi	a3,a3,32
    8000467c:	00178793          	addi	a5,a5,1
    80004680:	fc069ae3          	bnez	a3,80004654 <uartputc+0xac>
    80004684:	02813083          	ld	ra,40(sp)
    80004688:	02013403          	ld	s0,32(sp)
    8000468c:	01813483          	ld	s1,24(sp)
    80004690:	01013903          	ld	s2,16(sp)
    80004694:	00813983          	ld	s3,8(sp)
    80004698:	03010113          	addi	sp,sp,48
    8000469c:	00008067          	ret

00000000800046a0 <uartputc_sync>:
    800046a0:	ff010113          	addi	sp,sp,-16
    800046a4:	00813423          	sd	s0,8(sp)
    800046a8:	01010413          	addi	s0,sp,16
    800046ac:	00003717          	auipc	a4,0x3
    800046b0:	d1c72703          	lw	a4,-740(a4) # 800073c8 <panicked>
    800046b4:	02071663          	bnez	a4,800046e0 <uartputc_sync+0x40>
    800046b8:	00050793          	mv	a5,a0
    800046bc:	100006b7          	lui	a3,0x10000
    800046c0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800046c4:	02077713          	andi	a4,a4,32
    800046c8:	fe070ce3          	beqz	a4,800046c0 <uartputc_sync+0x20>
    800046cc:	0ff7f793          	andi	a5,a5,255
    800046d0:	00f68023          	sb	a5,0(a3)
    800046d4:	00813403          	ld	s0,8(sp)
    800046d8:	01010113          	addi	sp,sp,16
    800046dc:	00008067          	ret
    800046e0:	0000006f          	j	800046e0 <uartputc_sync+0x40>

00000000800046e4 <uartstart>:
    800046e4:	ff010113          	addi	sp,sp,-16
    800046e8:	00813423          	sd	s0,8(sp)
    800046ec:	01010413          	addi	s0,sp,16
    800046f0:	00003617          	auipc	a2,0x3
    800046f4:	ce060613          	addi	a2,a2,-800 # 800073d0 <uart_tx_r>
    800046f8:	00003517          	auipc	a0,0x3
    800046fc:	ce050513          	addi	a0,a0,-800 # 800073d8 <uart_tx_w>
    80004700:	00063783          	ld	a5,0(a2)
    80004704:	00053703          	ld	a4,0(a0)
    80004708:	04f70263          	beq	a4,a5,8000474c <uartstart+0x68>
    8000470c:	100005b7          	lui	a1,0x10000
    80004710:	00004817          	auipc	a6,0x4
    80004714:	f7080813          	addi	a6,a6,-144 # 80008680 <uart_tx_buf>
    80004718:	01c0006f          	j	80004734 <uartstart+0x50>
    8000471c:	0006c703          	lbu	a4,0(a3)
    80004720:	00f63023          	sd	a5,0(a2)
    80004724:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80004728:	00063783          	ld	a5,0(a2)
    8000472c:	00053703          	ld	a4,0(a0)
    80004730:	00f70e63          	beq	a4,a5,8000474c <uartstart+0x68>
    80004734:	01f7f713          	andi	a4,a5,31
    80004738:	00e806b3          	add	a3,a6,a4
    8000473c:	0055c703          	lbu	a4,5(a1)
    80004740:	00178793          	addi	a5,a5,1
    80004744:	02077713          	andi	a4,a4,32
    80004748:	fc071ae3          	bnez	a4,8000471c <uartstart+0x38>
    8000474c:	00813403          	ld	s0,8(sp)
    80004750:	01010113          	addi	sp,sp,16
    80004754:	00008067          	ret

0000000080004758 <uartgetc>:
    80004758:	ff010113          	addi	sp,sp,-16
    8000475c:	00813423          	sd	s0,8(sp)
    80004760:	01010413          	addi	s0,sp,16
    80004764:	10000737          	lui	a4,0x10000
    80004768:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000476c:	0017f793          	andi	a5,a5,1
    80004770:	00078c63          	beqz	a5,80004788 <uartgetc+0x30>
    80004774:	00074503          	lbu	a0,0(a4)
    80004778:	0ff57513          	andi	a0,a0,255
    8000477c:	00813403          	ld	s0,8(sp)
    80004780:	01010113          	addi	sp,sp,16
    80004784:	00008067          	ret
    80004788:	fff00513          	li	a0,-1
    8000478c:	ff1ff06f          	j	8000477c <uartgetc+0x24>

0000000080004790 <uartintr>:
    80004790:	100007b7          	lui	a5,0x10000
    80004794:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80004798:	0017f793          	andi	a5,a5,1
    8000479c:	0a078463          	beqz	a5,80004844 <uartintr+0xb4>
    800047a0:	fe010113          	addi	sp,sp,-32
    800047a4:	00813823          	sd	s0,16(sp)
    800047a8:	00913423          	sd	s1,8(sp)
    800047ac:	00113c23          	sd	ra,24(sp)
    800047b0:	02010413          	addi	s0,sp,32
    800047b4:	100004b7          	lui	s1,0x10000
    800047b8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800047bc:	0ff57513          	andi	a0,a0,255
    800047c0:	fffff097          	auipc	ra,0xfffff
    800047c4:	534080e7          	jalr	1332(ra) # 80003cf4 <consoleintr>
    800047c8:	0054c783          	lbu	a5,5(s1)
    800047cc:	0017f793          	andi	a5,a5,1
    800047d0:	fe0794e3          	bnez	a5,800047b8 <uartintr+0x28>
    800047d4:	00003617          	auipc	a2,0x3
    800047d8:	bfc60613          	addi	a2,a2,-1028 # 800073d0 <uart_tx_r>
    800047dc:	00003517          	auipc	a0,0x3
    800047e0:	bfc50513          	addi	a0,a0,-1028 # 800073d8 <uart_tx_w>
    800047e4:	00063783          	ld	a5,0(a2)
    800047e8:	00053703          	ld	a4,0(a0)
    800047ec:	04f70263          	beq	a4,a5,80004830 <uartintr+0xa0>
    800047f0:	100005b7          	lui	a1,0x10000
    800047f4:	00004817          	auipc	a6,0x4
    800047f8:	e8c80813          	addi	a6,a6,-372 # 80008680 <uart_tx_buf>
    800047fc:	01c0006f          	j	80004818 <uartintr+0x88>
    80004800:	0006c703          	lbu	a4,0(a3)
    80004804:	00f63023          	sd	a5,0(a2)
    80004808:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000480c:	00063783          	ld	a5,0(a2)
    80004810:	00053703          	ld	a4,0(a0)
    80004814:	00f70e63          	beq	a4,a5,80004830 <uartintr+0xa0>
    80004818:	01f7f713          	andi	a4,a5,31
    8000481c:	00e806b3          	add	a3,a6,a4
    80004820:	0055c703          	lbu	a4,5(a1)
    80004824:	00178793          	addi	a5,a5,1
    80004828:	02077713          	andi	a4,a4,32
    8000482c:	fc071ae3          	bnez	a4,80004800 <uartintr+0x70>
    80004830:	01813083          	ld	ra,24(sp)
    80004834:	01013403          	ld	s0,16(sp)
    80004838:	00813483          	ld	s1,8(sp)
    8000483c:	02010113          	addi	sp,sp,32
    80004840:	00008067          	ret
    80004844:	00003617          	auipc	a2,0x3
    80004848:	b8c60613          	addi	a2,a2,-1140 # 800073d0 <uart_tx_r>
    8000484c:	00003517          	auipc	a0,0x3
    80004850:	b8c50513          	addi	a0,a0,-1140 # 800073d8 <uart_tx_w>
    80004854:	00063783          	ld	a5,0(a2)
    80004858:	00053703          	ld	a4,0(a0)
    8000485c:	04f70263          	beq	a4,a5,800048a0 <uartintr+0x110>
    80004860:	100005b7          	lui	a1,0x10000
    80004864:	00004817          	auipc	a6,0x4
    80004868:	e1c80813          	addi	a6,a6,-484 # 80008680 <uart_tx_buf>
    8000486c:	01c0006f          	j	80004888 <uartintr+0xf8>
    80004870:	0006c703          	lbu	a4,0(a3)
    80004874:	00f63023          	sd	a5,0(a2)
    80004878:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000487c:	00063783          	ld	a5,0(a2)
    80004880:	00053703          	ld	a4,0(a0)
    80004884:	02f70063          	beq	a4,a5,800048a4 <uartintr+0x114>
    80004888:	01f7f713          	andi	a4,a5,31
    8000488c:	00e806b3          	add	a3,a6,a4
    80004890:	0055c703          	lbu	a4,5(a1)
    80004894:	00178793          	addi	a5,a5,1
    80004898:	02077713          	andi	a4,a4,32
    8000489c:	fc071ae3          	bnez	a4,80004870 <uartintr+0xe0>
    800048a0:	00008067          	ret
    800048a4:	00008067          	ret

00000000800048a8 <kinit>:
    800048a8:	fc010113          	addi	sp,sp,-64
    800048ac:	02913423          	sd	s1,40(sp)
    800048b0:	fffff7b7          	lui	a5,0xfffff
    800048b4:	00005497          	auipc	s1,0x5
    800048b8:	deb48493          	addi	s1,s1,-533 # 8000969f <end+0xfff>
    800048bc:	02813823          	sd	s0,48(sp)
    800048c0:	01313c23          	sd	s3,24(sp)
    800048c4:	00f4f4b3          	and	s1,s1,a5
    800048c8:	02113c23          	sd	ra,56(sp)
    800048cc:	03213023          	sd	s2,32(sp)
    800048d0:	01413823          	sd	s4,16(sp)
    800048d4:	01513423          	sd	s5,8(sp)
    800048d8:	04010413          	addi	s0,sp,64
    800048dc:	000017b7          	lui	a5,0x1
    800048e0:	01100993          	li	s3,17
    800048e4:	00f487b3          	add	a5,s1,a5
    800048e8:	01b99993          	slli	s3,s3,0x1b
    800048ec:	06f9e063          	bltu	s3,a5,8000494c <kinit+0xa4>
    800048f0:	00004a97          	auipc	s5,0x4
    800048f4:	db0a8a93          	addi	s5,s5,-592 # 800086a0 <end>
    800048f8:	0754ec63          	bltu	s1,s5,80004970 <kinit+0xc8>
    800048fc:	0734fa63          	bgeu	s1,s3,80004970 <kinit+0xc8>
    80004900:	00088a37          	lui	s4,0x88
    80004904:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80004908:	00003917          	auipc	s2,0x3
    8000490c:	ad890913          	addi	s2,s2,-1320 # 800073e0 <kmem>
    80004910:	00ca1a13          	slli	s4,s4,0xc
    80004914:	0140006f          	j	80004928 <kinit+0x80>
    80004918:	000017b7          	lui	a5,0x1
    8000491c:	00f484b3          	add	s1,s1,a5
    80004920:	0554e863          	bltu	s1,s5,80004970 <kinit+0xc8>
    80004924:	0534f663          	bgeu	s1,s3,80004970 <kinit+0xc8>
    80004928:	00001637          	lui	a2,0x1
    8000492c:	00100593          	li	a1,1
    80004930:	00048513          	mv	a0,s1
    80004934:	00000097          	auipc	ra,0x0
    80004938:	5e4080e7          	jalr	1508(ra) # 80004f18 <__memset>
    8000493c:	00093783          	ld	a5,0(s2)
    80004940:	00f4b023          	sd	a5,0(s1)
    80004944:	00993023          	sd	s1,0(s2)
    80004948:	fd4498e3          	bne	s1,s4,80004918 <kinit+0x70>
    8000494c:	03813083          	ld	ra,56(sp)
    80004950:	03013403          	ld	s0,48(sp)
    80004954:	02813483          	ld	s1,40(sp)
    80004958:	02013903          	ld	s2,32(sp)
    8000495c:	01813983          	ld	s3,24(sp)
    80004960:	01013a03          	ld	s4,16(sp)
    80004964:	00813a83          	ld	s5,8(sp)
    80004968:	04010113          	addi	sp,sp,64
    8000496c:	00008067          	ret
    80004970:	00002517          	auipc	a0,0x2
    80004974:	ad050513          	addi	a0,a0,-1328 # 80006440 <digits+0x18>
    80004978:	fffff097          	auipc	ra,0xfffff
    8000497c:	4b4080e7          	jalr	1204(ra) # 80003e2c <panic>

0000000080004980 <freerange>:
    80004980:	fc010113          	addi	sp,sp,-64
    80004984:	000017b7          	lui	a5,0x1
    80004988:	02913423          	sd	s1,40(sp)
    8000498c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80004990:	009504b3          	add	s1,a0,s1
    80004994:	fffff537          	lui	a0,0xfffff
    80004998:	02813823          	sd	s0,48(sp)
    8000499c:	02113c23          	sd	ra,56(sp)
    800049a0:	03213023          	sd	s2,32(sp)
    800049a4:	01313c23          	sd	s3,24(sp)
    800049a8:	01413823          	sd	s4,16(sp)
    800049ac:	01513423          	sd	s5,8(sp)
    800049b0:	01613023          	sd	s6,0(sp)
    800049b4:	04010413          	addi	s0,sp,64
    800049b8:	00a4f4b3          	and	s1,s1,a0
    800049bc:	00f487b3          	add	a5,s1,a5
    800049c0:	06f5e463          	bltu	a1,a5,80004a28 <freerange+0xa8>
    800049c4:	00004a97          	auipc	s5,0x4
    800049c8:	cdca8a93          	addi	s5,s5,-804 # 800086a0 <end>
    800049cc:	0954e263          	bltu	s1,s5,80004a50 <freerange+0xd0>
    800049d0:	01100993          	li	s3,17
    800049d4:	01b99993          	slli	s3,s3,0x1b
    800049d8:	0734fc63          	bgeu	s1,s3,80004a50 <freerange+0xd0>
    800049dc:	00058a13          	mv	s4,a1
    800049e0:	00003917          	auipc	s2,0x3
    800049e4:	a0090913          	addi	s2,s2,-1536 # 800073e0 <kmem>
    800049e8:	00002b37          	lui	s6,0x2
    800049ec:	0140006f          	j	80004a00 <freerange+0x80>
    800049f0:	000017b7          	lui	a5,0x1
    800049f4:	00f484b3          	add	s1,s1,a5
    800049f8:	0554ec63          	bltu	s1,s5,80004a50 <freerange+0xd0>
    800049fc:	0534fa63          	bgeu	s1,s3,80004a50 <freerange+0xd0>
    80004a00:	00001637          	lui	a2,0x1
    80004a04:	00100593          	li	a1,1
    80004a08:	00048513          	mv	a0,s1
    80004a0c:	00000097          	auipc	ra,0x0
    80004a10:	50c080e7          	jalr	1292(ra) # 80004f18 <__memset>
    80004a14:	00093703          	ld	a4,0(s2)
    80004a18:	016487b3          	add	a5,s1,s6
    80004a1c:	00e4b023          	sd	a4,0(s1)
    80004a20:	00993023          	sd	s1,0(s2)
    80004a24:	fcfa76e3          	bgeu	s4,a5,800049f0 <freerange+0x70>
    80004a28:	03813083          	ld	ra,56(sp)
    80004a2c:	03013403          	ld	s0,48(sp)
    80004a30:	02813483          	ld	s1,40(sp)
    80004a34:	02013903          	ld	s2,32(sp)
    80004a38:	01813983          	ld	s3,24(sp)
    80004a3c:	01013a03          	ld	s4,16(sp)
    80004a40:	00813a83          	ld	s5,8(sp)
    80004a44:	00013b03          	ld	s6,0(sp)
    80004a48:	04010113          	addi	sp,sp,64
    80004a4c:	00008067          	ret
    80004a50:	00002517          	auipc	a0,0x2
    80004a54:	9f050513          	addi	a0,a0,-1552 # 80006440 <digits+0x18>
    80004a58:	fffff097          	auipc	ra,0xfffff
    80004a5c:	3d4080e7          	jalr	980(ra) # 80003e2c <panic>

0000000080004a60 <kfree>:
    80004a60:	fe010113          	addi	sp,sp,-32
    80004a64:	00813823          	sd	s0,16(sp)
    80004a68:	00113c23          	sd	ra,24(sp)
    80004a6c:	00913423          	sd	s1,8(sp)
    80004a70:	02010413          	addi	s0,sp,32
    80004a74:	03451793          	slli	a5,a0,0x34
    80004a78:	04079c63          	bnez	a5,80004ad0 <kfree+0x70>
    80004a7c:	00004797          	auipc	a5,0x4
    80004a80:	c2478793          	addi	a5,a5,-988 # 800086a0 <end>
    80004a84:	00050493          	mv	s1,a0
    80004a88:	04f56463          	bltu	a0,a5,80004ad0 <kfree+0x70>
    80004a8c:	01100793          	li	a5,17
    80004a90:	01b79793          	slli	a5,a5,0x1b
    80004a94:	02f57e63          	bgeu	a0,a5,80004ad0 <kfree+0x70>
    80004a98:	00001637          	lui	a2,0x1
    80004a9c:	00100593          	li	a1,1
    80004aa0:	00000097          	auipc	ra,0x0
    80004aa4:	478080e7          	jalr	1144(ra) # 80004f18 <__memset>
    80004aa8:	00003797          	auipc	a5,0x3
    80004aac:	93878793          	addi	a5,a5,-1736 # 800073e0 <kmem>
    80004ab0:	0007b703          	ld	a4,0(a5)
    80004ab4:	01813083          	ld	ra,24(sp)
    80004ab8:	01013403          	ld	s0,16(sp)
    80004abc:	00e4b023          	sd	a4,0(s1)
    80004ac0:	0097b023          	sd	s1,0(a5)
    80004ac4:	00813483          	ld	s1,8(sp)
    80004ac8:	02010113          	addi	sp,sp,32
    80004acc:	00008067          	ret
    80004ad0:	00002517          	auipc	a0,0x2
    80004ad4:	97050513          	addi	a0,a0,-1680 # 80006440 <digits+0x18>
    80004ad8:	fffff097          	auipc	ra,0xfffff
    80004adc:	354080e7          	jalr	852(ra) # 80003e2c <panic>

0000000080004ae0 <kalloc>:
    80004ae0:	fe010113          	addi	sp,sp,-32
    80004ae4:	00813823          	sd	s0,16(sp)
    80004ae8:	00913423          	sd	s1,8(sp)
    80004aec:	00113c23          	sd	ra,24(sp)
    80004af0:	02010413          	addi	s0,sp,32
    80004af4:	00003797          	auipc	a5,0x3
    80004af8:	8ec78793          	addi	a5,a5,-1812 # 800073e0 <kmem>
    80004afc:	0007b483          	ld	s1,0(a5)
    80004b00:	02048063          	beqz	s1,80004b20 <kalloc+0x40>
    80004b04:	0004b703          	ld	a4,0(s1)
    80004b08:	00001637          	lui	a2,0x1
    80004b0c:	00500593          	li	a1,5
    80004b10:	00048513          	mv	a0,s1
    80004b14:	00e7b023          	sd	a4,0(a5)
    80004b18:	00000097          	auipc	ra,0x0
    80004b1c:	400080e7          	jalr	1024(ra) # 80004f18 <__memset>
    80004b20:	01813083          	ld	ra,24(sp)
    80004b24:	01013403          	ld	s0,16(sp)
    80004b28:	00048513          	mv	a0,s1
    80004b2c:	00813483          	ld	s1,8(sp)
    80004b30:	02010113          	addi	sp,sp,32
    80004b34:	00008067          	ret

0000000080004b38 <initlock>:
    80004b38:	ff010113          	addi	sp,sp,-16
    80004b3c:	00813423          	sd	s0,8(sp)
    80004b40:	01010413          	addi	s0,sp,16
    80004b44:	00813403          	ld	s0,8(sp)
    80004b48:	00b53423          	sd	a1,8(a0)
    80004b4c:	00052023          	sw	zero,0(a0)
    80004b50:	00053823          	sd	zero,16(a0)
    80004b54:	01010113          	addi	sp,sp,16
    80004b58:	00008067          	ret

0000000080004b5c <acquire>:
    80004b5c:	fe010113          	addi	sp,sp,-32
    80004b60:	00813823          	sd	s0,16(sp)
    80004b64:	00913423          	sd	s1,8(sp)
    80004b68:	00113c23          	sd	ra,24(sp)
    80004b6c:	01213023          	sd	s2,0(sp)
    80004b70:	02010413          	addi	s0,sp,32
    80004b74:	00050493          	mv	s1,a0
    80004b78:	10002973          	csrr	s2,sstatus
    80004b7c:	100027f3          	csrr	a5,sstatus
    80004b80:	ffd7f793          	andi	a5,a5,-3
    80004b84:	10079073          	csrw	sstatus,a5
    80004b88:	fffff097          	auipc	ra,0xfffff
    80004b8c:	8e4080e7          	jalr	-1820(ra) # 8000346c <mycpu>
    80004b90:	07852783          	lw	a5,120(a0)
    80004b94:	06078e63          	beqz	a5,80004c10 <acquire+0xb4>
    80004b98:	fffff097          	auipc	ra,0xfffff
    80004b9c:	8d4080e7          	jalr	-1836(ra) # 8000346c <mycpu>
    80004ba0:	07852783          	lw	a5,120(a0)
    80004ba4:	0004a703          	lw	a4,0(s1)
    80004ba8:	0017879b          	addiw	a5,a5,1
    80004bac:	06f52c23          	sw	a5,120(a0)
    80004bb0:	04071063          	bnez	a4,80004bf0 <acquire+0x94>
    80004bb4:	00100713          	li	a4,1
    80004bb8:	00070793          	mv	a5,a4
    80004bbc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80004bc0:	0007879b          	sext.w	a5,a5
    80004bc4:	fe079ae3          	bnez	a5,80004bb8 <acquire+0x5c>
    80004bc8:	0ff0000f          	fence
    80004bcc:	fffff097          	auipc	ra,0xfffff
    80004bd0:	8a0080e7          	jalr	-1888(ra) # 8000346c <mycpu>
    80004bd4:	01813083          	ld	ra,24(sp)
    80004bd8:	01013403          	ld	s0,16(sp)
    80004bdc:	00a4b823          	sd	a0,16(s1)
    80004be0:	00013903          	ld	s2,0(sp)
    80004be4:	00813483          	ld	s1,8(sp)
    80004be8:	02010113          	addi	sp,sp,32
    80004bec:	00008067          	ret
    80004bf0:	0104b903          	ld	s2,16(s1)
    80004bf4:	fffff097          	auipc	ra,0xfffff
    80004bf8:	878080e7          	jalr	-1928(ra) # 8000346c <mycpu>
    80004bfc:	faa91ce3          	bne	s2,a0,80004bb4 <acquire+0x58>
    80004c00:	00002517          	auipc	a0,0x2
    80004c04:	84850513          	addi	a0,a0,-1976 # 80006448 <digits+0x20>
    80004c08:	fffff097          	auipc	ra,0xfffff
    80004c0c:	224080e7          	jalr	548(ra) # 80003e2c <panic>
    80004c10:	00195913          	srli	s2,s2,0x1
    80004c14:	fffff097          	auipc	ra,0xfffff
    80004c18:	858080e7          	jalr	-1960(ra) # 8000346c <mycpu>
    80004c1c:	00197913          	andi	s2,s2,1
    80004c20:	07252e23          	sw	s2,124(a0)
    80004c24:	f75ff06f          	j	80004b98 <acquire+0x3c>

0000000080004c28 <release>:
    80004c28:	fe010113          	addi	sp,sp,-32
    80004c2c:	00813823          	sd	s0,16(sp)
    80004c30:	00113c23          	sd	ra,24(sp)
    80004c34:	00913423          	sd	s1,8(sp)
    80004c38:	01213023          	sd	s2,0(sp)
    80004c3c:	02010413          	addi	s0,sp,32
    80004c40:	00052783          	lw	a5,0(a0)
    80004c44:	00079a63          	bnez	a5,80004c58 <release+0x30>
    80004c48:	00002517          	auipc	a0,0x2
    80004c4c:	80850513          	addi	a0,a0,-2040 # 80006450 <digits+0x28>
    80004c50:	fffff097          	auipc	ra,0xfffff
    80004c54:	1dc080e7          	jalr	476(ra) # 80003e2c <panic>
    80004c58:	01053903          	ld	s2,16(a0)
    80004c5c:	00050493          	mv	s1,a0
    80004c60:	fffff097          	auipc	ra,0xfffff
    80004c64:	80c080e7          	jalr	-2036(ra) # 8000346c <mycpu>
    80004c68:	fea910e3          	bne	s2,a0,80004c48 <release+0x20>
    80004c6c:	0004b823          	sd	zero,16(s1)
    80004c70:	0ff0000f          	fence
    80004c74:	0f50000f          	fence	iorw,ow
    80004c78:	0804a02f          	amoswap.w	zero,zero,(s1)
    80004c7c:	ffffe097          	auipc	ra,0xffffe
    80004c80:	7f0080e7          	jalr	2032(ra) # 8000346c <mycpu>
    80004c84:	100027f3          	csrr	a5,sstatus
    80004c88:	0027f793          	andi	a5,a5,2
    80004c8c:	04079a63          	bnez	a5,80004ce0 <release+0xb8>
    80004c90:	07852783          	lw	a5,120(a0)
    80004c94:	02f05e63          	blez	a5,80004cd0 <release+0xa8>
    80004c98:	fff7871b          	addiw	a4,a5,-1
    80004c9c:	06e52c23          	sw	a4,120(a0)
    80004ca0:	00071c63          	bnez	a4,80004cb8 <release+0x90>
    80004ca4:	07c52783          	lw	a5,124(a0)
    80004ca8:	00078863          	beqz	a5,80004cb8 <release+0x90>
    80004cac:	100027f3          	csrr	a5,sstatus
    80004cb0:	0027e793          	ori	a5,a5,2
    80004cb4:	10079073          	csrw	sstatus,a5
    80004cb8:	01813083          	ld	ra,24(sp)
    80004cbc:	01013403          	ld	s0,16(sp)
    80004cc0:	00813483          	ld	s1,8(sp)
    80004cc4:	00013903          	ld	s2,0(sp)
    80004cc8:	02010113          	addi	sp,sp,32
    80004ccc:	00008067          	ret
    80004cd0:	00001517          	auipc	a0,0x1
    80004cd4:	7a050513          	addi	a0,a0,1952 # 80006470 <digits+0x48>
    80004cd8:	fffff097          	auipc	ra,0xfffff
    80004cdc:	154080e7          	jalr	340(ra) # 80003e2c <panic>
    80004ce0:	00001517          	auipc	a0,0x1
    80004ce4:	77850513          	addi	a0,a0,1912 # 80006458 <digits+0x30>
    80004ce8:	fffff097          	auipc	ra,0xfffff
    80004cec:	144080e7          	jalr	324(ra) # 80003e2c <panic>

0000000080004cf0 <holding>:
    80004cf0:	00052783          	lw	a5,0(a0)
    80004cf4:	00079663          	bnez	a5,80004d00 <holding+0x10>
    80004cf8:	00000513          	li	a0,0
    80004cfc:	00008067          	ret
    80004d00:	fe010113          	addi	sp,sp,-32
    80004d04:	00813823          	sd	s0,16(sp)
    80004d08:	00913423          	sd	s1,8(sp)
    80004d0c:	00113c23          	sd	ra,24(sp)
    80004d10:	02010413          	addi	s0,sp,32
    80004d14:	01053483          	ld	s1,16(a0)
    80004d18:	ffffe097          	auipc	ra,0xffffe
    80004d1c:	754080e7          	jalr	1876(ra) # 8000346c <mycpu>
    80004d20:	01813083          	ld	ra,24(sp)
    80004d24:	01013403          	ld	s0,16(sp)
    80004d28:	40a48533          	sub	a0,s1,a0
    80004d2c:	00153513          	seqz	a0,a0
    80004d30:	00813483          	ld	s1,8(sp)
    80004d34:	02010113          	addi	sp,sp,32
    80004d38:	00008067          	ret

0000000080004d3c <push_off>:
    80004d3c:	fe010113          	addi	sp,sp,-32
    80004d40:	00813823          	sd	s0,16(sp)
    80004d44:	00113c23          	sd	ra,24(sp)
    80004d48:	00913423          	sd	s1,8(sp)
    80004d4c:	02010413          	addi	s0,sp,32
    80004d50:	100024f3          	csrr	s1,sstatus
    80004d54:	100027f3          	csrr	a5,sstatus
    80004d58:	ffd7f793          	andi	a5,a5,-3
    80004d5c:	10079073          	csrw	sstatus,a5
    80004d60:	ffffe097          	auipc	ra,0xffffe
    80004d64:	70c080e7          	jalr	1804(ra) # 8000346c <mycpu>
    80004d68:	07852783          	lw	a5,120(a0)
    80004d6c:	02078663          	beqz	a5,80004d98 <push_off+0x5c>
    80004d70:	ffffe097          	auipc	ra,0xffffe
    80004d74:	6fc080e7          	jalr	1788(ra) # 8000346c <mycpu>
    80004d78:	07852783          	lw	a5,120(a0)
    80004d7c:	01813083          	ld	ra,24(sp)
    80004d80:	01013403          	ld	s0,16(sp)
    80004d84:	0017879b          	addiw	a5,a5,1
    80004d88:	06f52c23          	sw	a5,120(a0)
    80004d8c:	00813483          	ld	s1,8(sp)
    80004d90:	02010113          	addi	sp,sp,32
    80004d94:	00008067          	ret
    80004d98:	0014d493          	srli	s1,s1,0x1
    80004d9c:	ffffe097          	auipc	ra,0xffffe
    80004da0:	6d0080e7          	jalr	1744(ra) # 8000346c <mycpu>
    80004da4:	0014f493          	andi	s1,s1,1
    80004da8:	06952e23          	sw	s1,124(a0)
    80004dac:	fc5ff06f          	j	80004d70 <push_off+0x34>

0000000080004db0 <pop_off>:
    80004db0:	ff010113          	addi	sp,sp,-16
    80004db4:	00813023          	sd	s0,0(sp)
    80004db8:	00113423          	sd	ra,8(sp)
    80004dbc:	01010413          	addi	s0,sp,16
    80004dc0:	ffffe097          	auipc	ra,0xffffe
    80004dc4:	6ac080e7          	jalr	1708(ra) # 8000346c <mycpu>
    80004dc8:	100027f3          	csrr	a5,sstatus
    80004dcc:	0027f793          	andi	a5,a5,2
    80004dd0:	04079663          	bnez	a5,80004e1c <pop_off+0x6c>
    80004dd4:	07852783          	lw	a5,120(a0)
    80004dd8:	02f05a63          	blez	a5,80004e0c <pop_off+0x5c>
    80004ddc:	fff7871b          	addiw	a4,a5,-1
    80004de0:	06e52c23          	sw	a4,120(a0)
    80004de4:	00071c63          	bnez	a4,80004dfc <pop_off+0x4c>
    80004de8:	07c52783          	lw	a5,124(a0)
    80004dec:	00078863          	beqz	a5,80004dfc <pop_off+0x4c>
    80004df0:	100027f3          	csrr	a5,sstatus
    80004df4:	0027e793          	ori	a5,a5,2
    80004df8:	10079073          	csrw	sstatus,a5
    80004dfc:	00813083          	ld	ra,8(sp)
    80004e00:	00013403          	ld	s0,0(sp)
    80004e04:	01010113          	addi	sp,sp,16
    80004e08:	00008067          	ret
    80004e0c:	00001517          	auipc	a0,0x1
    80004e10:	66450513          	addi	a0,a0,1636 # 80006470 <digits+0x48>
    80004e14:	fffff097          	auipc	ra,0xfffff
    80004e18:	018080e7          	jalr	24(ra) # 80003e2c <panic>
    80004e1c:	00001517          	auipc	a0,0x1
    80004e20:	63c50513          	addi	a0,a0,1596 # 80006458 <digits+0x30>
    80004e24:	fffff097          	auipc	ra,0xfffff
    80004e28:	008080e7          	jalr	8(ra) # 80003e2c <panic>

0000000080004e2c <push_on>:
    80004e2c:	fe010113          	addi	sp,sp,-32
    80004e30:	00813823          	sd	s0,16(sp)
    80004e34:	00113c23          	sd	ra,24(sp)
    80004e38:	00913423          	sd	s1,8(sp)
    80004e3c:	02010413          	addi	s0,sp,32
    80004e40:	100024f3          	csrr	s1,sstatus
    80004e44:	100027f3          	csrr	a5,sstatus
    80004e48:	0027e793          	ori	a5,a5,2
    80004e4c:	10079073          	csrw	sstatus,a5
    80004e50:	ffffe097          	auipc	ra,0xffffe
    80004e54:	61c080e7          	jalr	1564(ra) # 8000346c <mycpu>
    80004e58:	07852783          	lw	a5,120(a0)
    80004e5c:	02078663          	beqz	a5,80004e88 <push_on+0x5c>
    80004e60:	ffffe097          	auipc	ra,0xffffe
    80004e64:	60c080e7          	jalr	1548(ra) # 8000346c <mycpu>
    80004e68:	07852783          	lw	a5,120(a0)
    80004e6c:	01813083          	ld	ra,24(sp)
    80004e70:	01013403          	ld	s0,16(sp)
    80004e74:	0017879b          	addiw	a5,a5,1
    80004e78:	06f52c23          	sw	a5,120(a0)
    80004e7c:	00813483          	ld	s1,8(sp)
    80004e80:	02010113          	addi	sp,sp,32
    80004e84:	00008067          	ret
    80004e88:	0014d493          	srli	s1,s1,0x1
    80004e8c:	ffffe097          	auipc	ra,0xffffe
    80004e90:	5e0080e7          	jalr	1504(ra) # 8000346c <mycpu>
    80004e94:	0014f493          	andi	s1,s1,1
    80004e98:	06952e23          	sw	s1,124(a0)
    80004e9c:	fc5ff06f          	j	80004e60 <push_on+0x34>

0000000080004ea0 <pop_on>:
    80004ea0:	ff010113          	addi	sp,sp,-16
    80004ea4:	00813023          	sd	s0,0(sp)
    80004ea8:	00113423          	sd	ra,8(sp)
    80004eac:	01010413          	addi	s0,sp,16
    80004eb0:	ffffe097          	auipc	ra,0xffffe
    80004eb4:	5bc080e7          	jalr	1468(ra) # 8000346c <mycpu>
    80004eb8:	100027f3          	csrr	a5,sstatus
    80004ebc:	0027f793          	andi	a5,a5,2
    80004ec0:	04078463          	beqz	a5,80004f08 <pop_on+0x68>
    80004ec4:	07852783          	lw	a5,120(a0)
    80004ec8:	02f05863          	blez	a5,80004ef8 <pop_on+0x58>
    80004ecc:	fff7879b          	addiw	a5,a5,-1
    80004ed0:	06f52c23          	sw	a5,120(a0)
    80004ed4:	07853783          	ld	a5,120(a0)
    80004ed8:	00079863          	bnez	a5,80004ee8 <pop_on+0x48>
    80004edc:	100027f3          	csrr	a5,sstatus
    80004ee0:	ffd7f793          	andi	a5,a5,-3
    80004ee4:	10079073          	csrw	sstatus,a5
    80004ee8:	00813083          	ld	ra,8(sp)
    80004eec:	00013403          	ld	s0,0(sp)
    80004ef0:	01010113          	addi	sp,sp,16
    80004ef4:	00008067          	ret
    80004ef8:	00001517          	auipc	a0,0x1
    80004efc:	5a050513          	addi	a0,a0,1440 # 80006498 <digits+0x70>
    80004f00:	fffff097          	auipc	ra,0xfffff
    80004f04:	f2c080e7          	jalr	-212(ra) # 80003e2c <panic>
    80004f08:	00001517          	auipc	a0,0x1
    80004f0c:	57050513          	addi	a0,a0,1392 # 80006478 <digits+0x50>
    80004f10:	fffff097          	auipc	ra,0xfffff
    80004f14:	f1c080e7          	jalr	-228(ra) # 80003e2c <panic>

0000000080004f18 <__memset>:
    80004f18:	ff010113          	addi	sp,sp,-16
    80004f1c:	00813423          	sd	s0,8(sp)
    80004f20:	01010413          	addi	s0,sp,16
    80004f24:	1a060e63          	beqz	a2,800050e0 <__memset+0x1c8>
    80004f28:	40a007b3          	neg	a5,a0
    80004f2c:	0077f793          	andi	a5,a5,7
    80004f30:	00778693          	addi	a3,a5,7
    80004f34:	00b00813          	li	a6,11
    80004f38:	0ff5f593          	andi	a1,a1,255
    80004f3c:	fff6071b          	addiw	a4,a2,-1
    80004f40:	1b06e663          	bltu	a3,a6,800050ec <__memset+0x1d4>
    80004f44:	1cd76463          	bltu	a4,a3,8000510c <__memset+0x1f4>
    80004f48:	1a078e63          	beqz	a5,80005104 <__memset+0x1ec>
    80004f4c:	00b50023          	sb	a1,0(a0)
    80004f50:	00100713          	li	a4,1
    80004f54:	1ae78463          	beq	a5,a4,800050fc <__memset+0x1e4>
    80004f58:	00b500a3          	sb	a1,1(a0)
    80004f5c:	00200713          	li	a4,2
    80004f60:	1ae78a63          	beq	a5,a4,80005114 <__memset+0x1fc>
    80004f64:	00b50123          	sb	a1,2(a0)
    80004f68:	00300713          	li	a4,3
    80004f6c:	18e78463          	beq	a5,a4,800050f4 <__memset+0x1dc>
    80004f70:	00b501a3          	sb	a1,3(a0)
    80004f74:	00400713          	li	a4,4
    80004f78:	1ae78263          	beq	a5,a4,8000511c <__memset+0x204>
    80004f7c:	00b50223          	sb	a1,4(a0)
    80004f80:	00500713          	li	a4,5
    80004f84:	1ae78063          	beq	a5,a4,80005124 <__memset+0x20c>
    80004f88:	00b502a3          	sb	a1,5(a0)
    80004f8c:	00700713          	li	a4,7
    80004f90:	18e79e63          	bne	a5,a4,8000512c <__memset+0x214>
    80004f94:	00b50323          	sb	a1,6(a0)
    80004f98:	00700e93          	li	t4,7
    80004f9c:	00859713          	slli	a4,a1,0x8
    80004fa0:	00e5e733          	or	a4,a1,a4
    80004fa4:	01059e13          	slli	t3,a1,0x10
    80004fa8:	01c76e33          	or	t3,a4,t3
    80004fac:	01859313          	slli	t1,a1,0x18
    80004fb0:	006e6333          	or	t1,t3,t1
    80004fb4:	02059893          	slli	a7,a1,0x20
    80004fb8:	40f60e3b          	subw	t3,a2,a5
    80004fbc:	011368b3          	or	a7,t1,a7
    80004fc0:	02859813          	slli	a6,a1,0x28
    80004fc4:	0108e833          	or	a6,a7,a6
    80004fc8:	03059693          	slli	a3,a1,0x30
    80004fcc:	003e589b          	srliw	a7,t3,0x3
    80004fd0:	00d866b3          	or	a3,a6,a3
    80004fd4:	03859713          	slli	a4,a1,0x38
    80004fd8:	00389813          	slli	a6,a7,0x3
    80004fdc:	00f507b3          	add	a5,a0,a5
    80004fe0:	00e6e733          	or	a4,a3,a4
    80004fe4:	000e089b          	sext.w	a7,t3
    80004fe8:	00f806b3          	add	a3,a6,a5
    80004fec:	00e7b023          	sd	a4,0(a5)
    80004ff0:	00878793          	addi	a5,a5,8
    80004ff4:	fed79ce3          	bne	a5,a3,80004fec <__memset+0xd4>
    80004ff8:	ff8e7793          	andi	a5,t3,-8
    80004ffc:	0007871b          	sext.w	a4,a5
    80005000:	01d787bb          	addw	a5,a5,t4
    80005004:	0ce88e63          	beq	a7,a4,800050e0 <__memset+0x1c8>
    80005008:	00f50733          	add	a4,a0,a5
    8000500c:	00b70023          	sb	a1,0(a4)
    80005010:	0017871b          	addiw	a4,a5,1
    80005014:	0cc77663          	bgeu	a4,a2,800050e0 <__memset+0x1c8>
    80005018:	00e50733          	add	a4,a0,a4
    8000501c:	00b70023          	sb	a1,0(a4)
    80005020:	0027871b          	addiw	a4,a5,2
    80005024:	0ac77e63          	bgeu	a4,a2,800050e0 <__memset+0x1c8>
    80005028:	00e50733          	add	a4,a0,a4
    8000502c:	00b70023          	sb	a1,0(a4)
    80005030:	0037871b          	addiw	a4,a5,3
    80005034:	0ac77663          	bgeu	a4,a2,800050e0 <__memset+0x1c8>
    80005038:	00e50733          	add	a4,a0,a4
    8000503c:	00b70023          	sb	a1,0(a4)
    80005040:	0047871b          	addiw	a4,a5,4
    80005044:	08c77e63          	bgeu	a4,a2,800050e0 <__memset+0x1c8>
    80005048:	00e50733          	add	a4,a0,a4
    8000504c:	00b70023          	sb	a1,0(a4)
    80005050:	0057871b          	addiw	a4,a5,5
    80005054:	08c77663          	bgeu	a4,a2,800050e0 <__memset+0x1c8>
    80005058:	00e50733          	add	a4,a0,a4
    8000505c:	00b70023          	sb	a1,0(a4)
    80005060:	0067871b          	addiw	a4,a5,6
    80005064:	06c77e63          	bgeu	a4,a2,800050e0 <__memset+0x1c8>
    80005068:	00e50733          	add	a4,a0,a4
    8000506c:	00b70023          	sb	a1,0(a4)
    80005070:	0077871b          	addiw	a4,a5,7
    80005074:	06c77663          	bgeu	a4,a2,800050e0 <__memset+0x1c8>
    80005078:	00e50733          	add	a4,a0,a4
    8000507c:	00b70023          	sb	a1,0(a4)
    80005080:	0087871b          	addiw	a4,a5,8
    80005084:	04c77e63          	bgeu	a4,a2,800050e0 <__memset+0x1c8>
    80005088:	00e50733          	add	a4,a0,a4
    8000508c:	00b70023          	sb	a1,0(a4)
    80005090:	0097871b          	addiw	a4,a5,9
    80005094:	04c77663          	bgeu	a4,a2,800050e0 <__memset+0x1c8>
    80005098:	00e50733          	add	a4,a0,a4
    8000509c:	00b70023          	sb	a1,0(a4)
    800050a0:	00a7871b          	addiw	a4,a5,10
    800050a4:	02c77e63          	bgeu	a4,a2,800050e0 <__memset+0x1c8>
    800050a8:	00e50733          	add	a4,a0,a4
    800050ac:	00b70023          	sb	a1,0(a4)
    800050b0:	00b7871b          	addiw	a4,a5,11
    800050b4:	02c77663          	bgeu	a4,a2,800050e0 <__memset+0x1c8>
    800050b8:	00e50733          	add	a4,a0,a4
    800050bc:	00b70023          	sb	a1,0(a4)
    800050c0:	00c7871b          	addiw	a4,a5,12
    800050c4:	00c77e63          	bgeu	a4,a2,800050e0 <__memset+0x1c8>
    800050c8:	00e50733          	add	a4,a0,a4
    800050cc:	00b70023          	sb	a1,0(a4)
    800050d0:	00d7879b          	addiw	a5,a5,13
    800050d4:	00c7f663          	bgeu	a5,a2,800050e0 <__memset+0x1c8>
    800050d8:	00f507b3          	add	a5,a0,a5
    800050dc:	00b78023          	sb	a1,0(a5)
    800050e0:	00813403          	ld	s0,8(sp)
    800050e4:	01010113          	addi	sp,sp,16
    800050e8:	00008067          	ret
    800050ec:	00b00693          	li	a3,11
    800050f0:	e55ff06f          	j	80004f44 <__memset+0x2c>
    800050f4:	00300e93          	li	t4,3
    800050f8:	ea5ff06f          	j	80004f9c <__memset+0x84>
    800050fc:	00100e93          	li	t4,1
    80005100:	e9dff06f          	j	80004f9c <__memset+0x84>
    80005104:	00000e93          	li	t4,0
    80005108:	e95ff06f          	j	80004f9c <__memset+0x84>
    8000510c:	00000793          	li	a5,0
    80005110:	ef9ff06f          	j	80005008 <__memset+0xf0>
    80005114:	00200e93          	li	t4,2
    80005118:	e85ff06f          	j	80004f9c <__memset+0x84>
    8000511c:	00400e93          	li	t4,4
    80005120:	e7dff06f          	j	80004f9c <__memset+0x84>
    80005124:	00500e93          	li	t4,5
    80005128:	e75ff06f          	j	80004f9c <__memset+0x84>
    8000512c:	00600e93          	li	t4,6
    80005130:	e6dff06f          	j	80004f9c <__memset+0x84>

0000000080005134 <__memmove>:
    80005134:	ff010113          	addi	sp,sp,-16
    80005138:	00813423          	sd	s0,8(sp)
    8000513c:	01010413          	addi	s0,sp,16
    80005140:	0e060863          	beqz	a2,80005230 <__memmove+0xfc>
    80005144:	fff6069b          	addiw	a3,a2,-1
    80005148:	0006881b          	sext.w	a6,a3
    8000514c:	0ea5e863          	bltu	a1,a0,8000523c <__memmove+0x108>
    80005150:	00758713          	addi	a4,a1,7
    80005154:	00a5e7b3          	or	a5,a1,a0
    80005158:	40a70733          	sub	a4,a4,a0
    8000515c:	0077f793          	andi	a5,a5,7
    80005160:	00f73713          	sltiu	a4,a4,15
    80005164:	00174713          	xori	a4,a4,1
    80005168:	0017b793          	seqz	a5,a5
    8000516c:	00e7f7b3          	and	a5,a5,a4
    80005170:	10078863          	beqz	a5,80005280 <__memmove+0x14c>
    80005174:	00900793          	li	a5,9
    80005178:	1107f463          	bgeu	a5,a6,80005280 <__memmove+0x14c>
    8000517c:	0036581b          	srliw	a6,a2,0x3
    80005180:	fff8081b          	addiw	a6,a6,-1
    80005184:	02081813          	slli	a6,a6,0x20
    80005188:	01d85893          	srli	a7,a6,0x1d
    8000518c:	00858813          	addi	a6,a1,8
    80005190:	00058793          	mv	a5,a1
    80005194:	00050713          	mv	a4,a0
    80005198:	01088833          	add	a6,a7,a6
    8000519c:	0007b883          	ld	a7,0(a5)
    800051a0:	00878793          	addi	a5,a5,8
    800051a4:	00870713          	addi	a4,a4,8
    800051a8:	ff173c23          	sd	a7,-8(a4)
    800051ac:	ff0798e3          	bne	a5,a6,8000519c <__memmove+0x68>
    800051b0:	ff867713          	andi	a4,a2,-8
    800051b4:	02071793          	slli	a5,a4,0x20
    800051b8:	0207d793          	srli	a5,a5,0x20
    800051bc:	00f585b3          	add	a1,a1,a5
    800051c0:	40e686bb          	subw	a3,a3,a4
    800051c4:	00f507b3          	add	a5,a0,a5
    800051c8:	06e60463          	beq	a2,a4,80005230 <__memmove+0xfc>
    800051cc:	0005c703          	lbu	a4,0(a1)
    800051d0:	00e78023          	sb	a4,0(a5)
    800051d4:	04068e63          	beqz	a3,80005230 <__memmove+0xfc>
    800051d8:	0015c603          	lbu	a2,1(a1)
    800051dc:	00100713          	li	a4,1
    800051e0:	00c780a3          	sb	a2,1(a5)
    800051e4:	04e68663          	beq	a3,a4,80005230 <__memmove+0xfc>
    800051e8:	0025c603          	lbu	a2,2(a1)
    800051ec:	00200713          	li	a4,2
    800051f0:	00c78123          	sb	a2,2(a5)
    800051f4:	02e68e63          	beq	a3,a4,80005230 <__memmove+0xfc>
    800051f8:	0035c603          	lbu	a2,3(a1)
    800051fc:	00300713          	li	a4,3
    80005200:	00c781a3          	sb	a2,3(a5)
    80005204:	02e68663          	beq	a3,a4,80005230 <__memmove+0xfc>
    80005208:	0045c603          	lbu	a2,4(a1)
    8000520c:	00400713          	li	a4,4
    80005210:	00c78223          	sb	a2,4(a5)
    80005214:	00e68e63          	beq	a3,a4,80005230 <__memmove+0xfc>
    80005218:	0055c603          	lbu	a2,5(a1)
    8000521c:	00500713          	li	a4,5
    80005220:	00c782a3          	sb	a2,5(a5)
    80005224:	00e68663          	beq	a3,a4,80005230 <__memmove+0xfc>
    80005228:	0065c703          	lbu	a4,6(a1)
    8000522c:	00e78323          	sb	a4,6(a5)
    80005230:	00813403          	ld	s0,8(sp)
    80005234:	01010113          	addi	sp,sp,16
    80005238:	00008067          	ret
    8000523c:	02061713          	slli	a4,a2,0x20
    80005240:	02075713          	srli	a4,a4,0x20
    80005244:	00e587b3          	add	a5,a1,a4
    80005248:	f0f574e3          	bgeu	a0,a5,80005150 <__memmove+0x1c>
    8000524c:	02069613          	slli	a2,a3,0x20
    80005250:	02065613          	srli	a2,a2,0x20
    80005254:	fff64613          	not	a2,a2
    80005258:	00e50733          	add	a4,a0,a4
    8000525c:	00c78633          	add	a2,a5,a2
    80005260:	fff7c683          	lbu	a3,-1(a5)
    80005264:	fff78793          	addi	a5,a5,-1
    80005268:	fff70713          	addi	a4,a4,-1
    8000526c:	00d70023          	sb	a3,0(a4)
    80005270:	fec798e3          	bne	a5,a2,80005260 <__memmove+0x12c>
    80005274:	00813403          	ld	s0,8(sp)
    80005278:	01010113          	addi	sp,sp,16
    8000527c:	00008067          	ret
    80005280:	02069713          	slli	a4,a3,0x20
    80005284:	02075713          	srli	a4,a4,0x20
    80005288:	00170713          	addi	a4,a4,1
    8000528c:	00e50733          	add	a4,a0,a4
    80005290:	00050793          	mv	a5,a0
    80005294:	0005c683          	lbu	a3,0(a1)
    80005298:	00178793          	addi	a5,a5,1
    8000529c:	00158593          	addi	a1,a1,1
    800052a0:	fed78fa3          	sb	a3,-1(a5)
    800052a4:	fee798e3          	bne	a5,a4,80005294 <__memmove+0x160>
    800052a8:	f89ff06f          	j	80005230 <__memmove+0xfc>

00000000800052ac <__putc>:
    800052ac:	fe010113          	addi	sp,sp,-32
    800052b0:	00813823          	sd	s0,16(sp)
    800052b4:	00113c23          	sd	ra,24(sp)
    800052b8:	02010413          	addi	s0,sp,32
    800052bc:	00050793          	mv	a5,a0
    800052c0:	fef40593          	addi	a1,s0,-17
    800052c4:	00100613          	li	a2,1
    800052c8:	00000513          	li	a0,0
    800052cc:	fef407a3          	sb	a5,-17(s0)
    800052d0:	fffff097          	auipc	ra,0xfffff
    800052d4:	b3c080e7          	jalr	-1220(ra) # 80003e0c <console_write>
    800052d8:	01813083          	ld	ra,24(sp)
    800052dc:	01013403          	ld	s0,16(sp)
    800052e0:	02010113          	addi	sp,sp,32
    800052e4:	00008067          	ret

00000000800052e8 <__getc>:
    800052e8:	fe010113          	addi	sp,sp,-32
    800052ec:	00813823          	sd	s0,16(sp)
    800052f0:	00113c23          	sd	ra,24(sp)
    800052f4:	02010413          	addi	s0,sp,32
    800052f8:	fe840593          	addi	a1,s0,-24
    800052fc:	00100613          	li	a2,1
    80005300:	00000513          	li	a0,0
    80005304:	fffff097          	auipc	ra,0xfffff
    80005308:	ae8080e7          	jalr	-1304(ra) # 80003dec <console_read>
    8000530c:	fe844503          	lbu	a0,-24(s0)
    80005310:	01813083          	ld	ra,24(sp)
    80005314:	01013403          	ld	s0,16(sp)
    80005318:	02010113          	addi	sp,sp,32
    8000531c:	00008067          	ret

0000000080005320 <console_handler>:
    80005320:	fe010113          	addi	sp,sp,-32
    80005324:	00813823          	sd	s0,16(sp)
    80005328:	00113c23          	sd	ra,24(sp)
    8000532c:	00913423          	sd	s1,8(sp)
    80005330:	02010413          	addi	s0,sp,32
    80005334:	14202773          	csrr	a4,scause
    80005338:	100027f3          	csrr	a5,sstatus
    8000533c:	0027f793          	andi	a5,a5,2
    80005340:	06079e63          	bnez	a5,800053bc <console_handler+0x9c>
    80005344:	00074c63          	bltz	a4,8000535c <console_handler+0x3c>
    80005348:	01813083          	ld	ra,24(sp)
    8000534c:	01013403          	ld	s0,16(sp)
    80005350:	00813483          	ld	s1,8(sp)
    80005354:	02010113          	addi	sp,sp,32
    80005358:	00008067          	ret
    8000535c:	0ff77713          	andi	a4,a4,255
    80005360:	00900793          	li	a5,9
    80005364:	fef712e3          	bne	a4,a5,80005348 <console_handler+0x28>
    80005368:	ffffe097          	auipc	ra,0xffffe
    8000536c:	6dc080e7          	jalr	1756(ra) # 80003a44 <plic_claim>
    80005370:	00a00793          	li	a5,10
    80005374:	00050493          	mv	s1,a0
    80005378:	02f50c63          	beq	a0,a5,800053b0 <console_handler+0x90>
    8000537c:	fc0506e3          	beqz	a0,80005348 <console_handler+0x28>
    80005380:	00050593          	mv	a1,a0
    80005384:	00001517          	auipc	a0,0x1
    80005388:	01c50513          	addi	a0,a0,28 # 800063a0 <CONSOLE_STATUS+0x390>
    8000538c:	fffff097          	auipc	ra,0xfffff
    80005390:	afc080e7          	jalr	-1284(ra) # 80003e88 <__printf>
    80005394:	01013403          	ld	s0,16(sp)
    80005398:	01813083          	ld	ra,24(sp)
    8000539c:	00048513          	mv	a0,s1
    800053a0:	00813483          	ld	s1,8(sp)
    800053a4:	02010113          	addi	sp,sp,32
    800053a8:	ffffe317          	auipc	t1,0xffffe
    800053ac:	6d430067          	jr	1748(t1) # 80003a7c <plic_complete>
    800053b0:	fffff097          	auipc	ra,0xfffff
    800053b4:	3e0080e7          	jalr	992(ra) # 80004790 <uartintr>
    800053b8:	fddff06f          	j	80005394 <console_handler+0x74>
    800053bc:	00001517          	auipc	a0,0x1
    800053c0:	0e450513          	addi	a0,a0,228 # 800064a0 <digits+0x78>
    800053c4:	fffff097          	auipc	ra,0xfffff
    800053c8:	a68080e7          	jalr	-1432(ra) # 80003e2c <panic>
	...
