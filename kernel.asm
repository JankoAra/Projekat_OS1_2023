
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00007117          	auipc	sp,0x7
    80000004:	3b813103          	ld	sp,952(sp) # 800073b8 <_GLOBAL_OFFSET_TABLE_+0x28>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	178030ef          	jal	ra,80003194 <start>

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
    80001184:	1b1000ef          	jal	ra,80001b34 <interruptRoutine>

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
    800015f8:	e3c7b783          	ld	a5,-452(a5) # 80007430 <_ZN9Scheduler4tailE>
    800015fc:	00078e63          	beqz	a5,80001618 <_ZN9Scheduler3putEP3TCB+0x30>
		head = tail = tcb;
	} else {
		tail->nextInScheduler = tcb;
    80001600:	02a7bc23          	sd	a0,56(a5)
		tail = tcb;
    80001604:	00006797          	auipc	a5,0x6
    80001608:	e2a7b623          	sd	a0,-468(a5) # 80007430 <_ZN9Scheduler4tailE>
	}
}
    8000160c:	00813403          	ld	s0,8(sp)
    80001610:	01010113          	addi	sp,sp,16
    80001614:	00008067          	ret
		head = tail = tcb;
    80001618:	00006797          	auipc	a5,0x6
    8000161c:	e1878793          	addi	a5,a5,-488 # 80007430 <_ZN9Scheduler4tailE>
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
    8000163c:	df870713          	addi	a4,a4,-520 # 80007430 <_ZN9Scheduler4tailE>
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
    8000167c:	dc883803          	ld	a6,-568(a6) # 80007440 <_ZN9Scheduler12sleepingHeadE>
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
    800016b4:	d8a7b823          	sd	a0,-624(a5) # 80007440 <_ZN9Scheduler12sleepingHeadE>
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
    800016fc:	d4a7b423          	sd	a0,-696(a5) # 80007440 <_ZN9Scheduler12sleepingHeadE>
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
    80001718:	d2c7b783          	ld	a5,-724(a5) # 80007440 <_ZN9Scheduler12sleepingHeadE>
    8000171c:	06078a63          	beqz	a5,80001790 <_ZN9Scheduler4wakeEv+0x7c>
	sleepingHead->timeToSleep--;
    80001720:	0407b703          	ld	a4,64(a5)
    80001724:	fff70713          	addi	a4,a4,-1
    80001728:	04e7b023          	sd	a4,64(a5)
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    8000172c:	00006517          	auipc	a0,0x6
    80001730:	d1453503          	ld	a0,-748(a0) # 80007440 <_ZN9Scheduler12sleepingHeadE>
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
    80001764:	cef73023          	sd	a5,-800(a4) # 80007440 <_ZN9Scheduler12sleepingHeadE>
		thread->nextSleeping = nullptr;
    80001768:	04053423          	sd	zero,72(a0)
		Scheduler::put(thread);
    8000176c:	00000097          	auipc	ra,0x0
    80001770:	e7c080e7          	jalr	-388(ra) # 800015e8 <_ZN9Scheduler3putEP3TCB>
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001774:	00006517          	auipc	a0,0x6
    80001778:	ccc53503          	ld	a0,-820(a0) # 80007440 <_ZN9Scheduler12sleepingHeadE>
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
    800017a4:	05213823          	sd	s2,80(sp)
    800017a8:	07010413          	addi	s0,sp,112
	//postavi adresu prekidne rutine u stvec
	Riscv::w_stvec((uint64)&interruptHandler);
    800017ac:	00006797          	auipc	a5,0x6
    800017b0:	c347b783          	ld	a5,-972(a5) # 800073e0 <_GLOBAL_OFFSET_TABLE_+0x50>
    800017b4:	00078513          	mv	a0,a5
    800017b8:	00000097          	auipc	ra,0x0
    800017bc:	26c080e7          	jalr	620(ra) # 80001a24 <_ZN5Riscv7w_stvecEm>

	//sem_open(&semA, 0);
	semA = new Semaphore(0);
    800017c0:	01000513          	li	a0,16
    800017c4:	00001097          	auipc	ra,0x1
    800017c8:	a8c080e7          	jalr	-1396(ra) # 80002250 <_Znwm>
    800017cc:	00050793          	mv	a5,a0
    800017d0:	00078493          	mv	s1,a5
    800017d4:	00000593          	li	a1,0
    800017d8:	00048513          	mv	a0,s1
    800017dc:	00001097          	auipc	ra,0x1
    800017e0:	c9c080e7          	jalr	-868(ra) # 80002478 <_ZN9SemaphoreC1Ej>
    800017e4:	00006797          	auipc	a5,0x6
    800017e8:	c6478793          	addi	a5,a5,-924 # 80007448 <semA>
    800017ec:	0097b023          	sd	s1,0(a5)
//	printInteger(*(lista->peekFirst()));
//	delete lista;
//	println("");

	//testiranje kreiranja niti
	thread_t glavnaNit = nullptr;
    800017f0:	fa043823          	sd	zero,-80(s0)
	thread_t nit1 = nullptr;
    800017f4:	fc043c23          	sd	zero,-40(s0)
	thread_t nit2 = nullptr;
    800017f8:	fc043823          	sd	zero,-48(s0)
	thread_t nit3 = nullptr;
    800017fc:	fc043423          	sd	zero,-56(s0)
	thread_t idleNit = nullptr;
    80001800:	fa043423          	sd	zero,-88(s0)
	thread_create(&glavnaNit, nullptr, nullptr);
    80001804:	fb040793          	addi	a5,s0,-80
    80001808:	00000613          	li	a2,0
    8000180c:	00000593          	li	a1,0
    80001810:	00078513          	mv	a0,a5
    80001814:	00000097          	auipc	ra,0x0
    80001818:	b4c080e7          	jalr	-1204(ra) # 80001360 <_Z13thread_createPP3TCBPFvPvES2_>
	TCB::running = glavnaNit;
    8000181c:	fb043703          	ld	a4,-80(s0)
    80001820:	00006797          	auipc	a5,0x6
    80001824:	bb07b783          	ld	a5,-1104(a5) # 800073d0 <_GLOBAL_OFFSET_TABLE_+0x40>
    80001828:	00e7b023          	sd	a4,0(a5)
	uint64* arg = new uint64;
    8000182c:	00800513          	li	a0,8
    80001830:	00001097          	auipc	ra,0x1
    80001834:	a20080e7          	jalr	-1504(ra) # 80002250 <_Znwm>
    80001838:	00050793          	mv	a5,a0
    8000183c:	fcf43023          	sd	a5,-64(s0)
	*arg = 666;
    80001840:	fc043783          	ld	a5,-64(s0)
    80001844:	29a00713          	li	a4,666
    80001848:	00e7b023          	sd	a4,0(a5)
	ThreadQueue* q = new ThreadQueue();
    8000184c:	01000513          	li	a0,16
    80001850:	00000097          	auipc	ra,0x0
    80001854:	294080e7          	jalr	660(ra) # 80001ae4 <_ZN11ThreadQueuenwEm>
    80001858:	00050493          	mv	s1,a0
    8000185c:	00048513          	mv	a0,s1
    80001860:	00000097          	auipc	ra,0x0
    80001864:	218080e7          	jalr	536(ra) # 80001a78 <_ZN11ThreadQueueC1Ev>
    80001868:	fa943c23          	sd	s1,-72(s0)
	q->putLast(nit3);
    8000186c:	fc843583          	ld	a1,-56(s0)
    80001870:	fb843503          	ld	a0,-72(s0)
    80001874:	00000097          	auipc	ra,0x0
    80001878:	9b0080e7          	jalr	-1616(ra) # 80001224 <_ZN11ThreadQueue7putLastEP3TCB>
	q->putLast(nit2);
    8000187c:	fd043583          	ld	a1,-48(s0)
    80001880:	fb843503          	ld	a0,-72(s0)
    80001884:	00000097          	auipc	ra,0x0
    80001888:	9a0080e7          	jalr	-1632(ra) # 80001224 <_ZN11ThreadQueue7putLastEP3TCB>
	q->putLast(nit1);
    8000188c:	fd843583          	ld	a1,-40(s0)
    80001890:	fb843503          	ld	a0,-72(s0)
    80001894:	00000097          	auipc	ra,0x0
    80001898:	990080e7          	jalr	-1648(ra) # 80001224 <_ZN11ThreadQueue7putLastEP3TCB>
	thread_t nitred3 = q->getFirst();
    8000189c:	fb843503          	ld	a0,-72(s0)
    800018a0:	00000097          	auipc	ra,0x0
    800018a4:	9f0080e7          	jalr	-1552(ra) # 80001290 <_ZN11ThreadQueue8getFirstEv>
    800018a8:	00050793          	mv	a5,a0
    800018ac:	faf43023          	sd	a5,-96(s0)
	thread_t nitred2 = q->getFirst();
    800018b0:	fb843503          	ld	a0,-72(s0)
    800018b4:	00000097          	auipc	ra,0x0
    800018b8:	9dc080e7          	jalr	-1572(ra) # 80001290 <_ZN11ThreadQueue8getFirstEv>
    800018bc:	00050793          	mv	a5,a0
    800018c0:	f8f43c23          	sd	a5,-104(s0)
	thread_t nitred1 = q->getFirst();
    800018c4:	fb843503          	ld	a0,-72(s0)
    800018c8:	00000097          	auipc	ra,0x0
    800018cc:	9c8080e7          	jalr	-1592(ra) # 80001290 <_ZN11ThreadQueue8getFirstEv>
    800018d0:	00050793          	mv	a5,a0
    800018d4:	f8f43823          	sd	a5,-112(s0)
	thread_create(&idleNit, idle, nullptr);
    800018d8:	fa840793          	addi	a5,s0,-88
    800018dc:	00000613          	li	a2,0
    800018e0:	00000597          	auipc	a1,0x0
    800018e4:	13458593          	addi	a1,a1,308 # 80001a14 <_Z4idlePv>
    800018e8:	00078513          	mv	a0,a5
    800018ec:	00000097          	auipc	ra,0x0
    800018f0:	a74080e7          	jalr	-1420(ra) # 80001360 <_Z13thread_createPP3TCBPFvPvES2_>
	thread_create(&nitred1, nit1f, nullptr);
    800018f4:	f9040793          	addi	a5,s0,-112
    800018f8:	00000613          	li	a2,0
    800018fc:	00006597          	auipc	a1,0x6
    80001900:	acc5b583          	ld	a1,-1332(a1) # 800073c8 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001904:	00078513          	mv	a0,a5
    80001908:	00000097          	auipc	ra,0x0
    8000190c:	a58080e7          	jalr	-1448(ra) # 80001360 <_Z13thread_createPP3TCBPFvPvES2_>
	thread_create(&nitred2, nit2f, arg);
    80001910:	f9840793          	addi	a5,s0,-104
    80001914:	fc043603          	ld	a2,-64(s0)
    80001918:	00006597          	auipc	a1,0x6
    8000191c:	a985b583          	ld	a1,-1384(a1) # 800073b0 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001920:	00078513          	mv	a0,a5
    80001924:	00000097          	auipc	ra,0x0
    80001928:	a3c080e7          	jalr	-1476(ra) # 80001360 <_Z13thread_createPP3TCBPFvPvES2_>
	thread_create(&nitred3, nit3f, nullptr);
    8000192c:	fa040793          	addi	a5,s0,-96
    80001930:	00000613          	li	a2,0
    80001934:	00006597          	auipc	a1,0x6
    80001938:	a8c5b583          	ld	a1,-1396(a1) # 800073c0 <_GLOBAL_OFFSET_TABLE_+0x30>
    8000193c:	00078513          	mv	a0,a5
    80001940:	00000097          	auipc	ra,0x0
    80001944:	a20080e7          	jalr	-1504(ra) # 80001360 <_Z13thread_createPP3TCBPFvPvES2_>

	//omoguci prekide
	Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    80001948:	00200513          	li	a0,2
    8000194c:	00000097          	auipc	ra,0x0
    80001950:	0f4080e7          	jalr	244(ra) # 80001a40 <_ZN5Riscv10ms_sstatusEm>

//	while (!nitred1->isFinished() || !nitred2->isFinished()) {
//		thread_dispatch();
//	}
	thread_join(nitred1);
    80001954:	f9043783          	ld	a5,-112(s0)
    80001958:	00078513          	mv	a0,a5
    8000195c:	00000097          	auipc	ra,0x0
    80001960:	acc080e7          	jalr	-1332(ra) # 80001428 <_Z11thread_joinP3TCB>
	thread_join(nitred2);
    80001964:	f9843783          	ld	a5,-104(s0)
    80001968:	00078513          	mv	a0,a5
    8000196c:	00000097          	auipc	ra,0x0
    80001970:	abc080e7          	jalr	-1348(ra) # 80001428 <_Z11thread_joinP3TCB>
	thread_join(nitred3);
    80001974:	fa043783          	ld	a5,-96(s0)
    80001978:	00078513          	mv	a0,a5
    8000197c:	00000097          	auipc	ra,0x0
    80001980:	aac080e7          	jalr	-1364(ra) # 80001428 <_Z11thread_joinP3TCB>

	printString("\nProsao while\n");
    80001984:	00004517          	auipc	a0,0x4
    80001988:	69c50513          	addi	a0,a0,1692 # 80006020 <CONSOLE_STATUS+0x10>
    8000198c:	00000097          	auipc	ra,0x0
    80001990:	c0c080e7          	jalr	-1012(ra) # 80001598 <_Z11printStringPKc>
	delete q;
    80001994:	fb843483          	ld	s1,-72(s0)
    80001998:	00048e63          	beqz	s1,800019b4 <main+0x220>
    8000199c:	00048513          	mv	a0,s1
    800019a0:	00000097          	auipc	ra,0x0
    800019a4:	0f8080e7          	jalr	248(ra) # 80001a98 <_ZN11ThreadQueueD1Ev>
    800019a8:	00048513          	mv	a0,s1
    800019ac:	00000097          	auipc	ra,0x0
    800019b0:	160080e7          	jalr	352(ra) # 80001b0c <_ZN11ThreadQueuedlEPv>
	//zabrani prekide
	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    800019b4:	00200513          	li	a0,2
    800019b8:	00000097          	auipc	ra,0x0
    800019bc:	0a4080e7          	jalr	164(ra) # 80001a5c <_ZN5Riscv10mc_sstatusEm>
	printString("\nSad cu da izadjem\n");
    800019c0:	00004517          	auipc	a0,0x4
    800019c4:	67050513          	addi	a0,a0,1648 # 80006030 <CONSOLE_STATUS+0x20>
    800019c8:	00000097          	auipc	ra,0x0
    800019cc:	bd0080e7          	jalr	-1072(ra) # 80001598 <_Z11printStringPKc>
//	thread_create(&userHandle, (TCB::Body)userMain, nullptr);
//	while (!userHandle->isFinished()) {
//		thread_dispatch();
//	}
//	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
	return 0;
    800019d0:	00000793          	li	a5,0
    800019d4:	0240006f          	j	800019f8 <main+0x264>
    800019d8:	00050913          	mv	s2,a0
	semA = new Semaphore(0);
    800019dc:	00048513          	mv	a0,s1
    800019e0:	00001097          	auipc	ra,0x1
    800019e4:	8c0080e7          	jalr	-1856(ra) # 800022a0 <_ZdlPv>
    800019e8:	00090793          	mv	a5,s2
    800019ec:	00078513          	mv	a0,a5
    800019f0:	00007097          	auipc	ra,0x7
    800019f4:	b58080e7          	jalr	-1192(ra) # 80008548 <_Unwind_Resume>
    800019f8:	00078513          	mv	a0,a5
    800019fc:	06813083          	ld	ra,104(sp)
    80001a00:	06013403          	ld	s0,96(sp)
    80001a04:	05813483          	ld	s1,88(sp)
    80001a08:	05013903          	ld	s2,80(sp)
    80001a0c:	07010113          	addi	sp,sp,112
    80001a10:	00008067          	ret

0000000080001a14 <_Z4idlePv>:
void idle(void*) {
    80001a14:	ff010113          	addi	sp,sp,-16
    80001a18:	00813423          	sd	s0,8(sp)
    80001a1c:	01010413          	addi	s0,sp,16
	while (1) {}
    80001a20:	0000006f          	j	80001a20 <_Z4idlePv+0xc>

0000000080001a24 <_ZN5Riscv7w_stvecEm>:
	uint64 volatile stvec;
	__asm__ volatile("csrr %[stvec], stvec": [stvec] "=r"(stvec));
	return stvec;
}

inline void Riscv::w_stvec(uint64 stvec) {
    80001a24:	ff010113          	addi	sp,sp,-16
    80001a28:	00813423          	sd	s0,8(sp)
    80001a2c:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw stvec, %[stvec]": :[stvec] "r"(stvec));
    80001a30:	10551073          	csrw	stvec,a0
}
    80001a34:	00813403          	ld	s0,8(sp)
    80001a38:	01010113          	addi	sp,sp,16
    80001a3c:	00008067          	ret

0000000080001a40 <_ZN5Riscv10ms_sstatusEm>:

inline void Riscv::w_sip(uint64 sip) {
	__asm__ volatile("csrw sip, %[sip]": :[sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
    80001a40:	ff010113          	addi	sp,sp,-16
    80001a44:	00813423          	sd	s0,8(sp)
    80001a48:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80001a4c:	10052073          	csrs	sstatus,a0
}
    80001a50:	00813403          	ld	s0,8(sp)
    80001a54:	01010113          	addi	sp,sp,16
    80001a58:	00008067          	ret

0000000080001a5c <_ZN5Riscv10mc_sstatusEm>:

inline void Riscv::mc_sstatus(uint64 mask) {
    80001a5c:	ff010113          	addi	sp,sp,-16
    80001a60:	00813423          	sd	s0,8(sp)
    80001a64:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80001a68:	10053073          	csrc	sstatus,a0
}
    80001a6c:	00813403          	ld	s0,8(sp)
    80001a70:	01010113          	addi	sp,sp,16
    80001a74:	00008067          	ret

0000000080001a78 <_ZN11ThreadQueueC1Ev>:

	Node* front;
	Node* back;

public:
	ThreadQueue() : front(nullptr), back(nullptr) {}
    80001a78:	ff010113          	addi	sp,sp,-16
    80001a7c:	00813423          	sd	s0,8(sp)
    80001a80:	01010413          	addi	s0,sp,16
    80001a84:	00053023          	sd	zero,0(a0)
    80001a88:	00053423          	sd	zero,8(a0)
    80001a8c:	00813403          	ld	s0,8(sp)
    80001a90:	01010113          	addi	sp,sp,16
    80001a94:	00008067          	ret

0000000080001a98 <_ZN11ThreadQueueD1Ev>:

	ThreadQueue(const ThreadQueue&) = delete;

	ThreadQueue& operator=(const ThreadQueue&) = delete;

	~ThreadQueue() {
    80001a98:	fe010113          	addi	sp,sp,-32
    80001a9c:	00113c23          	sd	ra,24(sp)
    80001aa0:	00813823          	sd	s0,16(sp)
    80001aa4:	00913423          	sd	s1,8(sp)
    80001aa8:	02010413          	addi	s0,sp,32
    80001aac:	00050493          	mv	s1,a0
			delete node;
		}
	}

	bool isEmpty() const {
		return front == nullptr;
    80001ab0:	0004b503          	ld	a0,0(s1)
		while (!isEmpty()) {
    80001ab4:	00050e63          	beqz	a0,80001ad0 <_ZN11ThreadQueueD1Ev+0x38>
			front = front->next;
    80001ab8:	00853783          	ld	a5,8(a0)
    80001abc:	00f4b023          	sd	a5,0(s1)
			delete node;
    80001ac0:	fe0508e3          	beqz	a0,80001ab0 <_ZN11ThreadQueueD1Ev+0x18>
			mem_free(ptr);
    80001ac4:	00000097          	auipc	ra,0x0
    80001ac8:	86c080e7          	jalr	-1940(ra) # 80001330 <_Z8mem_freePv>
		}
    80001acc:	fe5ff06f          	j	80001ab0 <_ZN11ThreadQueueD1Ev+0x18>
	}
    80001ad0:	01813083          	ld	ra,24(sp)
    80001ad4:	01013403          	ld	s0,16(sp)
    80001ad8:	00813483          	ld	s1,8(sp)
    80001adc:	02010113          	addi	sp,sp,32
    80001ae0:	00008067          	ret

0000000080001ae4 <_ZN11ThreadQueuenwEm>:

	void putLast(TCB* tcb);

	TCB* getFirst();

	static void* operator new(size_t size) {
    80001ae4:	ff010113          	addi	sp,sp,-16
    80001ae8:	00113423          	sd	ra,8(sp)
    80001aec:	00813023          	sd	s0,0(sp)
    80001af0:	01010413          	addi	s0,sp,16
		return mem_alloc(size);
    80001af4:	fffff097          	auipc	ra,0xfffff
    80001af8:	7fc080e7          	jalr	2044(ra) # 800012f0 <_Z9mem_allocm>
	}
    80001afc:	00813083          	ld	ra,8(sp)
    80001b00:	00013403          	ld	s0,0(sp)
    80001b04:	01010113          	addi	sp,sp,16
    80001b08:	00008067          	ret

0000000080001b0c <_ZN11ThreadQueuedlEPv>:

	static void operator delete(void* ptr) {
    80001b0c:	ff010113          	addi	sp,sp,-16
    80001b10:	00113423          	sd	ra,8(sp)
    80001b14:	00813023          	sd	s0,0(sp)
    80001b18:	01010413          	addi	s0,sp,16
		mem_free(ptr);
    80001b1c:	00000097          	auipc	ra,0x0
    80001b20:	814080e7          	jalr	-2028(ra) # 80001330 <_Z8mem_freePv>
	}
    80001b24:	00813083          	ld	ra,8(sp)
    80001b28:	00013403          	ld	s0,0(sp)
    80001b2c:	01010113          	addi	sp,sp,16
    80001b30:	00008067          	ret

0000000080001b34 <interruptRoutine>:
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"
#include "../h/KSem.hpp"

#pragma GCC optimize("O0")
extern "C" void interruptRoutine() {
    80001b34:	ef010113          	addi	sp,sp,-272
    80001b38:	10113423          	sd	ra,264(sp)
    80001b3c:	10813023          	sd	s0,256(sp)
    80001b40:	11010413          	addi	s0,sp,272
	uint64 scause, sepc, sstatus;
	__asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001b44:	14202373          	csrr	t1,scause
    80001b48:	fc643c23          	sd	t1,-40(s0)
	__asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001b4c:	14102373          	csrr	t1,sepc
    80001b50:	fc643823          	sd	t1,-48(s0)
	__asm__ volatile("csrr %[status], sstatus":[status] "=r"(
			sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001b54:	10002373          	csrr	t1,sstatus
    80001b58:	fc643423          	sd	t1,-56(s0)
	uint64 a0, a1, a2, a3, a4, a5, a6, a7;
	__asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001b5c:	00050313          	mv	t1,a0
    80001b60:	fc643023          	sd	t1,-64(s0)
	__asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001b64:	00058313          	mv	t1,a1
    80001b68:	fa643c23          	sd	t1,-72(s0)
	__asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001b6c:	00060313          	mv	t1,a2
    80001b70:	fa643823          	sd	t1,-80(s0)
	__asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001b74:	00068313          	mv	t1,a3
    80001b78:	fa643423          	sd	t1,-88(s0)
	__asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001b7c:	00070313          	mv	t1,a4
    80001b80:	fa643023          	sd	t1,-96(s0)
	__asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001b84:	00078313          	mv	t1,a5
    80001b88:	f8643c23          	sd	t1,-104(s0)
	__asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001b8c:	00080313          	mv	t1,a6
    80001b90:	f8643823          	sd	t1,-112(s0)
	__asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001b94:	00088313          	mv	t1,a7
    80001b98:	f8643423          	sd	t1,-120(s0)

	if (scause == 0x09 || scause == 0x08) {
    80001b9c:	fd843703          	ld	a4,-40(s0)
    80001ba0:	00900793          	li	a5,9
    80001ba4:	00f70863          	beq	a4,a5,80001bb4 <interruptRoutine+0x80>
    80001ba8:	fd843703          	ld	a4,-40(s0)
    80001bac:	00800793          	li	a5,8
    80001bb0:	44f71e63          	bne	a4,a5,8000200c <interruptRoutine+0x4d8>
		//prekid zbog poziva ecall
		uint64 opCode = a0;
    80001bb4:	fc043783          	ld	a5,-64(s0)
    80001bb8:	f8f43023          	sd	a5,-128(s0)
		switch (opCode) {
    80001bbc:	f8043703          	ld	a4,-128(s0)
    80001bc0:	09100793          	li	a5,145
    80001bc4:	2cf70c63          	beq	a4,a5,80001e9c <interruptRoutine+0x368>
    80001bc8:	f8043703          	ld	a4,-128(s0)
    80001bcc:	09100793          	li	a5,145
    80001bd0:	3ae7ea63          	bltu	a5,a4,80001f84 <interruptRoutine+0x450>
    80001bd4:	f8043703          	ld	a4,-128(s0)
    80001bd8:	04200793          	li	a5,66
    80001bdc:	04e7e263          	bltu	a5,a4,80001c20 <interruptRoutine+0xec>
    80001be0:	f8043783          	ld	a5,-128(s0)
    80001be4:	3a078063          	beqz	a5,80001f84 <interruptRoutine+0x450>
    80001be8:	f8043703          	ld	a4,-128(s0)
    80001bec:	04200793          	li	a5,66
    80001bf0:	38e7ea63          	bltu	a5,a4,80001f84 <interruptRoutine+0x450>
    80001bf4:	f8043783          	ld	a5,-128(s0)
    80001bf8:	00279713          	slli	a4,a5,0x2
    80001bfc:	00004797          	auipc	a5,0x4
    80001c00:	4a878793          	addi	a5,a5,1192 # 800060a4 <CONSOLE_STATUS+0x94>
    80001c04:	00f707b3          	add	a5,a4,a5
    80001c08:	0007a783          	lw	a5,0(a5)
    80001c0c:	0007871b          	sext.w	a4,a5
    80001c10:	00004797          	auipc	a5,0x4
    80001c14:	49478793          	addi	a5,a5,1172 # 800060a4 <CONSOLE_STATUS+0x94>
    80001c18:	00f707b3          	add	a5,a4,a5
    80001c1c:	00078067          	jr	a5
    80001c20:	f8043703          	ld	a4,-128(s0)
    80001c24:	09000793          	li	a5,144
    80001c28:	22f70e63          	beq	a4,a5,80001e64 <interruptRoutine+0x330>
    80001c2c:	3580006f          	j	80001f84 <interruptRoutine+0x450>
			case 0x01:
				//mem_alloc
				size_t size;
				size = (size_t)a1;
    80001c30:	fb843783          	ld	a5,-72(s0)
    80001c34:	f0f43423          	sd	a5,-248(s0)
				//__asm__ volatile("mv %[size], a1":[size] "=r"(size));
				size = size * MEM_BLOCK_SIZE;
    80001c38:	f0843783          	ld	a5,-248(s0)
    80001c3c:	00679793          	slli	a5,a5,0x6
    80001c40:	f0f43423          	sd	a5,-248(s0)
				MemoryAllocator::kmalloc(size);
    80001c44:	00300593          	li	a1,3
    80001c48:	f0843503          	ld	a0,-248(s0)
    80001c4c:	00001097          	auipc	ra,0x1
    80001c50:	d18080e7          	jalr	-744(ra) # 80002964 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
				__asm__ volatile("sd a0, 80(s0)");
    80001c54:	04a43823          	sd	a0,80(s0)
				break;
    80001c58:	3980006f          	j	80001ff0 <interruptRoutine+0x4bc>
			case 0x02:
				//mem_free
				void* ptr;
				ptr = (void*)a1;
    80001c5c:	fb843783          	ld	a5,-72(s0)
    80001c60:	f0f43823          	sd	a5,-240(s0)
				//__asm__ volatile("mv %[ptr], a1" :[ptr]"=r"(ptr));
				MemoryAllocator::kfree(ptr);
    80001c64:	f1043503          	ld	a0,-240(s0)
    80001c68:	00001097          	auipc	ra,0x1
    80001c6c:	ea8080e7          	jalr	-344(ra) # 80002b10 <_ZN15MemoryAllocator5kfreeEPv>
				__asm__ volatile("sd a0, 80(s0)");
    80001c70:	04a43823          	sd	a0,80(s0)
				break;
    80001c74:	37c0006f          	j	80001ff0 <interruptRoutine+0x4bc>
			case 0x11:
				//thread_create
				thread_t* handle;
				handle = (thread_t*)a1;
    80001c78:	fb843783          	ld	a5,-72(s0)
    80001c7c:	f2f43823          	sd	a5,-208(s0)
				void (* function)(void*);
				function = (void (*)(void*))a2;
    80001c80:	fb043783          	ld	a5,-80(s0)
    80001c84:	f2f43423          	sd	a5,-216(s0)
				void* args;
				args = (void*)a3;
    80001c88:	fa843783          	ld	a5,-88(s0)
    80001c8c:	f2f43023          	sd	a5,-224(s0)
				uint64* sp;
				sp = (uint64*)a4;
    80001c90:	fa043783          	ld	a5,-96(s0)
    80001c94:	f0f43c23          	sd	a5,-232(s0)

				*handle = TCB::createThread(function, args, sp);
    80001c98:	f1843603          	ld	a2,-232(s0)
    80001c9c:	f2043583          	ld	a1,-224(s0)
    80001ca0:	f2843503          	ld	a0,-216(s0)
    80001ca4:	00001097          	auipc	ra,0x1
    80001ca8:	acc080e7          	jalr	-1332(ra) # 80002770 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80001cac:	00050713          	mv	a4,a0
    80001cb0:	f3043783          	ld	a5,-208(s0)
    80001cb4:	00e7b023          	sd	a4,0(a5)
				TCB::start(*handle);
    80001cb8:	f3043783          	ld	a5,-208(s0)
    80001cbc:	0007b783          	ld	a5,0(a5)
    80001cc0:	00078513          	mv	a0,a5
    80001cc4:	00001097          	auipc	ra,0x1
    80001cc8:	c4c080e7          	jalr	-948(ra) # 80002910 <_ZN3TCB5startEPS_>
				if (*handle != nullptr) {
    80001ccc:	f3043783          	ld	a5,-208(s0)
    80001cd0:	0007b783          	ld	a5,0(a5)
    80001cd4:	00078663          	beqz	a5,80001ce0 <interruptRoutine+0x1ac>
					__asm__ volatile("li a0, 0");
    80001cd8:	00000513          	li	a0,0
    80001cdc:	0080006f          	j	80001ce4 <interruptRoutine+0x1b0>
				} else {
					__asm__ volatile("li a0, -1");
    80001ce0:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    80001ce4:	04a43823          	sd	a0,80(s0)
				break;
    80001ce8:	3080006f          	j	80001ff0 <interruptRoutine+0x4bc>
			case 0x12:
				//thread_exit
				TCB::running->setFinished(true);
    80001cec:	00005797          	auipc	a5,0x5
    80001cf0:	6e47b783          	ld	a5,1764(a5) # 800073d0 <_GLOBAL_OFFSET_TABLE_+0x40>
    80001cf4:	0007b783          	ld	a5,0(a5)
    80001cf8:	00100593          	li	a1,1
    80001cfc:	00078513          	mv	a0,a5
    80001d00:	00000097          	auipc	ra,0x0
    80001d04:	488080e7          	jalr	1160(ra) # 80002188 <_ZN3TCB11setFinishedEb>
				TCB::releaseJoined();
    80001d08:	00001097          	auipc	ra,0x1
    80001d0c:	bac080e7          	jalr	-1108(ra) # 800028b4 <_ZN3TCB13releaseJoinedEv>
				TCB::yield();
    80001d10:	00001097          	auipc	ra,0x1
    80001d14:	9f8080e7          	jalr	-1544(ra) # 80002708 <_ZN3TCB5yieldEv>
				break;
    80001d18:	2d80006f          	j	80001ff0 <interruptRoutine+0x4bc>
			case 0x13:
				//thread_dispatch
				TCB::yield();
    80001d1c:	00001097          	auipc	ra,0x1
    80001d20:	9ec080e7          	jalr	-1556(ra) # 80002708 <_ZN3TCB5yieldEv>
				break;
    80001d24:	2cc0006f          	j	80001ff0 <interruptRoutine+0x4bc>
			case 0x14:
				//thread_join
				thread_t handleToJoin;
				handleToJoin = (thread_t)a1;
    80001d28:	fb843783          	ld	a5,-72(s0)
    80001d2c:	f2f43c23          	sd	a5,-200(s0)
				TCB::threadJoin(handleToJoin);
    80001d30:	f3843503          	ld	a0,-200(s0)
    80001d34:	00001097          	auipc	ra,0x1
    80001d38:	b38080e7          	jalr	-1224(ra) # 8000286c <_ZN3TCB10threadJoinEPS_>
				TCB::yield();
    80001d3c:	00001097          	auipc	ra,0x1
    80001d40:	9cc080e7          	jalr	-1588(ra) # 80002708 <_ZN3TCB5yieldEv>
				break;
    80001d44:	2ac0006f          	j	80001ff0 <interruptRoutine+0x4bc>
			case 0x21:
				//sem_open
				sem_t* openHandle;
				openHandle = (sem_t*)a1;
    80001d48:	fb843783          	ld	a5,-72(s0)
    80001d4c:	f4f43423          	sd	a5,-184(s0)
				uint initVal;
				initVal = (uint)a2;
    80001d50:	fb043783          	ld	a5,-80(s0)
    80001d54:	f4f42223          	sw	a5,-188(s0)
				*openHandle = KSem::initSem(initVal);
    80001d58:	f4442783          	lw	a5,-188(s0)
    80001d5c:	00078513          	mv	a0,a5
    80001d60:	00001097          	auipc	ra,0x1
    80001d64:	f4c080e7          	jalr	-180(ra) # 80002cac <_ZN4KSem7initSemEj>
    80001d68:	00050713          	mv	a4,a0
    80001d6c:	f4843783          	ld	a5,-184(s0)
    80001d70:	00e7b023          	sd	a4,0(a5)
				if (*openHandle != nullptr) {
    80001d74:	f4843783          	ld	a5,-184(s0)
    80001d78:	0007b783          	ld	a5,0(a5)
    80001d7c:	00078663          	beqz	a5,80001d88 <interruptRoutine+0x254>
					__asm__ volatile("li a0, 0");
    80001d80:	00000513          	li	a0,0
    80001d84:	0080006f          	j	80001d8c <interruptRoutine+0x258>
				} else {
					__asm__ volatile("li a0, -1");
    80001d88:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    80001d8c:	04a43823          	sd	a0,80(s0)
				break;
    80001d90:	2600006f          	j	80001ff0 <interruptRoutine+0x4bc>
			case 0x22:
				//sem_close
				sem_t closeHandle;
				closeHandle = (sem_t)a1;
    80001d94:	fb843783          	ld	a5,-72(s0)
    80001d98:	f4f43823          	sd	a5,-176(s0)
				KSem::closeSem(closeHandle);
    80001d9c:	f5043503          	ld	a0,-176(s0)
    80001da0:	00001097          	auipc	ra,0x1
    80001da4:	0d4080e7          	jalr	212(ra) # 80002e74 <_ZN4KSem8closeSemEPS_>
				__asm__ volatile("sd a0, 80(s0)");
    80001da8:	04a43823          	sd	a0,80(s0)
				break;
    80001dac:	2440006f          	j	80001ff0 <interruptRoutine+0x4bc>
			case 0x23:
				//sem_wait
				sem_t waitHandle;
				waitHandle = (sem_t)a1;
    80001db0:	fb843783          	ld	a5,-72(s0)
    80001db4:	f4f43c23          	sd	a5,-168(s0)
				waitHandle->wait();
    80001db8:	f5843503          	ld	a0,-168(s0)
    80001dbc:	00001097          	auipc	ra,0x1
    80001dc0:	f84080e7          	jalr	-124(ra) # 80002d40 <_ZN4KSem4waitEv>
				__asm__ volatile("sd a0, 80(s0)");
    80001dc4:	04a43823          	sd	a0,80(s0)
				break;
    80001dc8:	2280006f          	j	80001ff0 <interruptRoutine+0x4bc>
			case 0x24:
				//sem_signal
				sem_t signalHandle;
				signalHandle = (sem_t)a1;
    80001dcc:	fb843783          	ld	a5,-72(s0)
    80001dd0:	f6f43023          	sd	a5,-160(s0)
				signalHandle->signal();
    80001dd4:	f6043503          	ld	a0,-160(s0)
    80001dd8:	00001097          	auipc	ra,0x1
    80001ddc:	020080e7          	jalr	32(ra) # 80002df8 <_ZN4KSem6signalEv>
				__asm__ volatile("sd a0, 80(s0)");
    80001de0:	04a43823          	sd	a0,80(s0)
				break;
    80001de4:	20c0006f          	j	80001ff0 <interruptRoutine+0x4bc>
			case 0x31:
				//time_sleep
				time_t timerPeriods;
				timerPeriods = (time_t)a1;
    80001de8:	fb843783          	ld	a5,-72(s0)
    80001dec:	f6f43423          	sd	a5,-152(s0)
				if (timerPeriods > 0) {
    80001df0:	f6843783          	ld	a5,-152(s0)
    80001df4:	00078663          	beqz	a5,80001e00 <interruptRoutine+0x2cc>
					__asm__ volatile("li a0, 0");
    80001df8:	00000513          	li	a0,0
    80001dfc:	0080006f          	j	80001e04 <interruptRoutine+0x2d0>
				} else {
					__asm__ volatile("li a0, -1");
    80001e00:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    80001e04:	04a43823          	sd	a0,80(s0)
				if (timerPeriods > 0) {
    80001e08:	f6843783          	ld	a5,-152(s0)
    80001e0c:	1c078863          	beqz	a5,80001fdc <interruptRoutine+0x4a8>
					Scheduler::putToSleep(TCB::running, timerPeriods);
    80001e10:	00005797          	auipc	a5,0x5
    80001e14:	5c07b783          	ld	a5,1472(a5) # 800073d0 <_GLOBAL_OFFSET_TABLE_+0x40>
    80001e18:	0007b783          	ld	a5,0(a5)
    80001e1c:	f6843583          	ld	a1,-152(s0)
    80001e20:	00078513          	mv	a0,a5
    80001e24:	00000097          	auipc	ra,0x0
    80001e28:	848080e7          	jalr	-1976(ra) # 8000166c <_ZN9Scheduler10putToSleepEP3TCBm>
					TCB::yield();
    80001e2c:	00001097          	auipc	ra,0x1
    80001e30:	8dc080e7          	jalr	-1828(ra) # 80002708 <_ZN3TCB5yieldEv>
				}
				break;
    80001e34:	1a80006f          	j	80001fdc <interruptRoutine+0x4a8>
			case 0x41:
				//getc
				__getc();
    80001e38:	00003097          	auipc	ra,0x3
    80001e3c:	460080e7          	jalr	1120(ra) # 80005298 <__getc>
				__asm__ volatile("sd a0, 80(s0)");
    80001e40:	04a43823          	sd	a0,80(s0)
				break;
    80001e44:	1ac0006f          	j	80001ff0 <interruptRoutine+0x4bc>
			case 0x42:
				//putc
				char c;
				c = (char)a1;
    80001e48:	fb843783          	ld	a5,-72(s0)
    80001e4c:	f6f409a3          	sb	a5,-141(s0)
				__putc(c);
    80001e50:	f7344783          	lbu	a5,-141(s0)
    80001e54:	00078513          	mv	a0,a5
    80001e58:	00003097          	auipc	ra,0x3
    80001e5c:	404080e7          	jalr	1028(ra) # 8000525c <__putc>
				break;
    80001e60:	1900006f          	j	80001ff0 <interruptRoutine+0x4bc>
			case 0x90:
				//printString
				const char* string;
				string = (const char*)a1;
    80001e64:	fb843783          	ld	a5,-72(s0)
    80001e68:	fef43423          	sd	a5,-24(s0)
				while (*string != '\0') {
    80001e6c:	fe843783          	ld	a5,-24(s0)
    80001e70:	0007c783          	lbu	a5,0(a5)
    80001e74:	16078863          	beqz	a5,80001fe4 <interruptRoutine+0x4b0>
					__putc(*string);
    80001e78:	fe843783          	ld	a5,-24(s0)
    80001e7c:	0007c783          	lbu	a5,0(a5)
    80001e80:	00078513          	mv	a0,a5
    80001e84:	00003097          	auipc	ra,0x3
    80001e88:	3d8080e7          	jalr	984(ra) # 8000525c <__putc>
					string++;
    80001e8c:	fe843783          	ld	a5,-24(s0)
    80001e90:	00178793          	addi	a5,a5,1
    80001e94:	fef43423          	sd	a5,-24(s0)
				while (*string != '\0') {
    80001e98:	fd5ff06f          	j	80001e6c <interruptRoutine+0x338>
				}
				break;
			case 0x91:
				//printInteger
				uint64 integer;
				integer = a1;
    80001e9c:	fb843783          	ld	a5,-72(s0)
    80001ea0:	f6f43c23          	sd	a5,-136(s0)
				static char digits[] = "0123456789";
				char buf[16];
				int i, neg;
				uint x;

				neg = 0;
    80001ea4:	f6042a23          	sw	zero,-140(s0)
				if (integer < 0) {
					neg = 1;
					x = -integer;
				} else {
					x = integer;
    80001ea8:	f7843783          	ld	a5,-136(s0)
    80001eac:	fef42023          	sw	a5,-32(s0)
				}

				i = 0;
    80001eb0:	fe042223          	sw	zero,-28(s0)
				do {
					buf[i++] = digits[x % 10];
    80001eb4:	fe042703          	lw	a4,-32(s0)
    80001eb8:	00a00793          	li	a5,10
    80001ebc:	02f777bb          	remuw	a5,a4,a5
    80001ec0:	0007861b          	sext.w	a2,a5
    80001ec4:	fe442783          	lw	a5,-28(s0)
    80001ec8:	0017871b          	addiw	a4,a5,1
    80001ecc:	fee42223          	sw	a4,-28(s0)
    80001ed0:	00005697          	auipc	a3,0x5
    80001ed4:	43868693          	addi	a3,a3,1080 # 80007308 <_ZZ16interruptRoutineE6digits>
    80001ed8:	02061713          	slli	a4,a2,0x20
    80001edc:	02075713          	srli	a4,a4,0x20
    80001ee0:	00e68733          	add	a4,a3,a4
    80001ee4:	00074703          	lbu	a4,0(a4)
    80001ee8:	ff040693          	addi	a3,s0,-16
    80001eec:	00f687b3          	add	a5,a3,a5
    80001ef0:	f0e78423          	sb	a4,-248(a5)
				} while ((x /= 10) != 0);
    80001ef4:	fe042703          	lw	a4,-32(s0)
    80001ef8:	00a00793          	li	a5,10
    80001efc:	02f757bb          	divuw	a5,a4,a5
    80001f00:	fef42023          	sw	a5,-32(s0)
    80001f04:	fe042783          	lw	a5,-32(s0)
    80001f08:	0007879b          	sext.w	a5,a5
    80001f0c:	00f037b3          	snez	a5,a5
    80001f10:	0ff7f793          	andi	a5,a5,255
    80001f14:	00078463          	beqz	a5,80001f1c <interruptRoutine+0x3e8>
				do {
    80001f18:	f9dff06f          	j	80001eb4 <interruptRoutine+0x380>
				if (neg) buf[i++] = '-';
    80001f1c:	f7442783          	lw	a5,-140(s0)
    80001f20:	0007879b          	sext.w	a5,a5
    80001f24:	02078063          	beqz	a5,80001f44 <interruptRoutine+0x410>
    80001f28:	fe442783          	lw	a5,-28(s0)
    80001f2c:	0017871b          	addiw	a4,a5,1
    80001f30:	fee42223          	sw	a4,-28(s0)
    80001f34:	ff040713          	addi	a4,s0,-16
    80001f38:	00f707b3          	add	a5,a4,a5
    80001f3c:	02d00713          	li	a4,45
    80001f40:	f0e78423          	sb	a4,-248(a5)

				while (--i >= 0) {
    80001f44:	fe442783          	lw	a5,-28(s0)
    80001f48:	fff7879b          	addiw	a5,a5,-1
    80001f4c:	fef42223          	sw	a5,-28(s0)
    80001f50:	fe442783          	lw	a5,-28(s0)
    80001f54:	fff7c793          	not	a5,a5
    80001f58:	01f7d79b          	srliw	a5,a5,0x1f
    80001f5c:	0ff7f793          	andi	a5,a5,255
    80001f60:	08078663          	beqz	a5,80001fec <interruptRoutine+0x4b8>
					__putc(buf[i]);
    80001f64:	fe442783          	lw	a5,-28(s0)
    80001f68:	ff040713          	addi	a4,s0,-16
    80001f6c:	00f707b3          	add	a5,a4,a5
    80001f70:	f087c783          	lbu	a5,-248(a5)
    80001f74:	00078513          	mv	a0,a5
    80001f78:	00003097          	auipc	ra,0x3
    80001f7c:	2e4080e7          	jalr	740(ra) # 8000525c <__putc>
				while (--i >= 0) {
    80001f80:	fc5ff06f          	j	80001f44 <interruptRoutine+0x410>
				}
				break;
			default:
				printString("\nNepostojeci op code: ");
    80001f84:	00004517          	auipc	a0,0x4
    80001f88:	0c450513          	addi	a0,a0,196 # 80006048 <CONSOLE_STATUS+0x38>
    80001f8c:	fffff097          	auipc	ra,0xfffff
    80001f90:	60c080e7          	jalr	1548(ra) # 80001598 <_Z11printStringPKc>
				printInteger(opCode);
    80001f94:	f8043503          	ld	a0,-128(s0)
    80001f98:	fffff097          	auipc	ra,0xfffff
    80001f9c:	628080e7          	jalr	1576(ra) # 800015c0 <_Z12printIntegerm>
				printString("\nscause: ");
    80001fa0:	00004517          	auipc	a0,0x4
    80001fa4:	0c050513          	addi	a0,a0,192 # 80006060 <CONSOLE_STATUS+0x50>
    80001fa8:	fffff097          	auipc	ra,0xfffff
    80001fac:	5f0080e7          	jalr	1520(ra) # 80001598 <_Z11printStringPKc>
				printInteger(scause);
    80001fb0:	fd843503          	ld	a0,-40(s0)
    80001fb4:	fffff097          	auipc	ra,0xfffff
    80001fb8:	60c080e7          	jalr	1548(ra) # 800015c0 <_Z12printIntegerm>
				printString("\nsepc: ");
    80001fbc:	00004517          	auipc	a0,0x4
    80001fc0:	0b450513          	addi	a0,a0,180 # 80006070 <CONSOLE_STATUS+0x60>
    80001fc4:	fffff097          	auipc	ra,0xfffff
    80001fc8:	5d4080e7          	jalr	1492(ra) # 80001598 <_Z11printStringPKc>
				printInteger(sepc);
    80001fcc:	fd043503          	ld	a0,-48(s0)
    80001fd0:	fffff097          	auipc	ra,0xfffff
    80001fd4:	5f0080e7          	jalr	1520(ra) # 800015c0 <_Z12printIntegerm>
				break;
    80001fd8:	0180006f          	j	80001ff0 <interruptRoutine+0x4bc>
				break;
    80001fdc:	00000013          	nop
    80001fe0:	0100006f          	j	80001ff0 <interruptRoutine+0x4bc>
				break;
    80001fe4:	00000013          	nop
    80001fe8:	0080006f          	j	80001ff0 <interruptRoutine+0x4bc>
				break;
    80001fec:	00000013          	nop
		}
		//sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
		//sepc += 4;
		__asm__ volatile("addi %[dst], %[src], 0x4":[dst]"=r"(sepc):[src]"r"(
				sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001ff0:	fd043303          	ld	t1,-48(s0)
    80001ff4:	00430313          	addi	t1,t1,4
    80001ff8:	fc643823          	sd	t1,-48(s0)
		__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001ffc:	fd043303          	ld	t1,-48(s0)
    80002000:	14131073          	csrw	sepc,t1
    80002004:	00000013          	nop
		printString("scause: ");
		printInteger(scause);
		printString("\nsepc: ");
		printInteger(sepc);
	}
}
    80002008:	1180006f          	j	80002120 <interruptRoutine+0x5ec>
	} else if (scause == (1UL << 63 | 9)) {
    8000200c:	fd843703          	ld	a4,-40(s0)
    80002010:	fff00793          	li	a5,-1
    80002014:	03f79793          	slli	a5,a5,0x3f
    80002018:	00978793          	addi	a5,a5,9
    8000201c:	00f71863          	bne	a4,a5,8000202c <interruptRoutine+0x4f8>
		console_handler();
    80002020:	00003097          	auipc	ra,0x3
    80002024:	2b0080e7          	jalr	688(ra) # 800052d0 <console_handler>
}
    80002028:	0f80006f          	j	80002120 <interruptRoutine+0x5ec>
	} else if (scause == (1UL << 63 | 1)) {
    8000202c:	fd843703          	ld	a4,-40(s0)
    80002030:	fff00793          	li	a5,-1
    80002034:	03f79793          	slli	a5,a5,0x3f
    80002038:	00178793          	addi	a5,a5,1
    8000203c:	08f71e63          	bne	a4,a5,800020d8 <interruptRoutine+0x5a4>
		Scheduler::wake();
    80002040:	fffff097          	auipc	ra,0xfffff
    80002044:	6d4080e7          	jalr	1748(ra) # 80001714 <_ZN9Scheduler4wakeEv>
		TCB::runningTimeSlice++;
    80002048:	00005797          	auipc	a5,0x5
    8000204c:	3587b783          	ld	a5,856(a5) # 800073a0 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002050:	0007b783          	ld	a5,0(a5)
    80002054:	00178713          	addi	a4,a5,1
    80002058:	00005797          	auipc	a5,0x5
    8000205c:	3487b783          	ld	a5,840(a5) # 800073a0 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002060:	00e7b023          	sd	a4,0(a5)
		if (TCB::runningTimeSlice >= TCB::running->getTimeSlice()) {
    80002064:	00005797          	auipc	a5,0x5
    80002068:	36c7b783          	ld	a5,876(a5) # 800073d0 <_GLOBAL_OFFSET_TABLE_+0x40>
    8000206c:	0007b783          	ld	a5,0(a5)
    80002070:	00078513          	mv	a0,a5
    80002074:	00000097          	auipc	ra,0x0
    80002078:	130080e7          	jalr	304(ra) # 800021a4 <_ZN3TCB12getTimeSliceEv>
    8000207c:	00050713          	mv	a4,a0
    80002080:	00005797          	auipc	a5,0x5
    80002084:	3207b783          	ld	a5,800(a5) # 800073a0 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002088:	0007b783          	ld	a5,0(a5)
    8000208c:	00e7b7b3          	sltu	a5,a5,a4
    80002090:	0017c793          	xori	a5,a5,1
    80002094:	0ff7f793          	andi	a5,a5,255
    80002098:	00078c63          	beqz	a5,800020b0 <interruptRoutine+0x57c>
			TCB::yield();
    8000209c:	00000097          	auipc	ra,0x0
    800020a0:	66c080e7          	jalr	1644(ra) # 80002708 <_ZN3TCB5yieldEv>
			TCB::runningTimeSlice = 0;
    800020a4:	00005797          	auipc	a5,0x5
    800020a8:	2fc7b783          	ld	a5,764(a5) # 800073a0 <_GLOBAL_OFFSET_TABLE_+0x10>
    800020ac:	0007b023          	sd	zero,0(a5)
		Riscv::w_sepc(sepc);
    800020b0:	fd043503          	ld	a0,-48(s0)
    800020b4:	00000097          	auipc	ra,0x0
    800020b8:	080080e7          	jalr	128(ra) # 80002134 <_ZN5Riscv6w_sepcEm>
		Riscv::w_sstatus(sstatus);
    800020bc:	fc843503          	ld	a0,-56(s0)
    800020c0:	00000097          	auipc	ra,0x0
    800020c4:	0ac080e7          	jalr	172(ra) # 8000216c <_ZN5Riscv9w_sstatusEm>
		Riscv::mc_sip(Riscv::SIP_SSIP);
    800020c8:	00200513          	li	a0,2
    800020cc:	00000097          	auipc	ra,0x0
    800020d0:	084080e7          	jalr	132(ra) # 80002150 <_ZN5Riscv6mc_sipEm>
}
    800020d4:	04c0006f          	j	80002120 <interruptRoutine+0x5ec>
		printString("\nGreska u prekidnoj rutini\n");
    800020d8:	00004517          	auipc	a0,0x4
    800020dc:	fa050513          	addi	a0,a0,-96 # 80006078 <CONSOLE_STATUS+0x68>
    800020e0:	fffff097          	auipc	ra,0xfffff
    800020e4:	4b8080e7          	jalr	1208(ra) # 80001598 <_Z11printStringPKc>
		printString("scause: ");
    800020e8:	00004517          	auipc	a0,0x4
    800020ec:	fb050513          	addi	a0,a0,-80 # 80006098 <CONSOLE_STATUS+0x88>
    800020f0:	fffff097          	auipc	ra,0xfffff
    800020f4:	4a8080e7          	jalr	1192(ra) # 80001598 <_Z11printStringPKc>
		printInteger(scause);
    800020f8:	fd843503          	ld	a0,-40(s0)
    800020fc:	fffff097          	auipc	ra,0xfffff
    80002100:	4c4080e7          	jalr	1220(ra) # 800015c0 <_Z12printIntegerm>
		printString("\nsepc: ");
    80002104:	00004517          	auipc	a0,0x4
    80002108:	f6c50513          	addi	a0,a0,-148 # 80006070 <CONSOLE_STATUS+0x60>
    8000210c:	fffff097          	auipc	ra,0xfffff
    80002110:	48c080e7          	jalr	1164(ra) # 80001598 <_Z11printStringPKc>
		printInteger(sepc);
    80002114:	fd043503          	ld	a0,-48(s0)
    80002118:	fffff097          	auipc	ra,0xfffff
    8000211c:	4a8080e7          	jalr	1192(ra) # 800015c0 <_Z12printIntegerm>
}
    80002120:	00000013          	nop
    80002124:	10813083          	ld	ra,264(sp)
    80002128:	10013403          	ld	s0,256(sp)
    8000212c:	11010113          	addi	sp,sp,272
    80002130:	00008067          	ret

0000000080002134 <_ZN5Riscv6w_sepcEm>:
inline void Riscv::w_sepc(uint64 sepc) {
    80002134:	ff010113          	addi	sp,sp,-16
    80002138:	00813423          	sd	s0,8(sp)
    8000213c:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002140:	14151073          	csrw	sepc,a0
}
    80002144:	00813403          	ld	s0,8(sp)
    80002148:	01010113          	addi	sp,sp,16
    8000214c:	00008067          	ret

0000000080002150 <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    80002150:	ff010113          	addi	sp,sp,-16
    80002154:	00813423          	sd	s0,8(sp)
    80002158:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    8000215c:	14453073          	csrc	sip,a0
}
    80002160:	00813403          	ld	s0,8(sp)
    80002164:	01010113          	addi	sp,sp,16
    80002168:	00008067          	ret

000000008000216c <_ZN5Riscv9w_sstatusEm>:
	uint64 volatile sstatus;
	__asm__ volatile("csrr %[sstatus], sstatus": [sstatus] "=r"(sstatus));
	return sstatus;
}

inline void Riscv::w_sstatus(uint64 sstatus) {
    8000216c:	ff010113          	addi	sp,sp,-16
    80002170:	00813423          	sd	s0,8(sp)
    80002174:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw sstatus, %[sstatus]": :[sstatus] "r"(sstatus));
    80002178:	10051073          	csrw	sstatus,a0
}
    8000217c:	00813403          	ld	s0,8(sp)
    80002180:	01010113          	addi	sp,sp,16
    80002184:	00008067          	ret

0000000080002188 <_ZN3TCB11setFinishedEb>:
	static TCB* createThread(Body function, void* args, uint64* stack);
	static void start(TCB* newTcb);

	bool isFinished() { return finished; }

	void setFinished(bool finish) { this->finished = finish; }
    80002188:	ff010113          	addi	sp,sp,-16
    8000218c:	00813423          	sd	s0,8(sp)
    80002190:	01010413          	addi	s0,sp,16
    80002194:	02b50823          	sb	a1,48(a0)
    80002198:	00813403          	ld	s0,8(sp)
    8000219c:	01010113          	addi	sp,sp,16
    800021a0:	00008067          	ret

00000000800021a4 <_ZN3TCB12getTimeSliceEv>:

	bool isBlocked() { return blocked; }

	void setBlocked(bool block) { this->blocked = block; }

	uint64 getTimeSlice() { return timeSlice; }
    800021a4:	ff010113          	addi	sp,sp,-16
    800021a8:	00813423          	sd	s0,8(sp)
    800021ac:	01010413          	addi	s0,sp,16
    800021b0:	02853503          	ld	a0,40(a0)
    800021b4:	00813403          	ld	s0,8(sp)
    800021b8:	01010113          	addi	sp,sp,16
    800021bc:	00008067          	ret

00000000800021c0 <_ZN6ThreadD1Ev>:
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
	}
	myHandle = TCB::createThread(body,arg,stack);
}

Thread::~Thread() {
    800021c0:	ff010113          	addi	sp,sp,-16
    800021c4:	00813423          	sd	s0,8(sp)
    800021c8:	01010413          	addi	s0,sp,16

}
    800021cc:	00813403          	ld	s0,8(sp)
    800021d0:	01010113          	addi	sp,sp,16
    800021d4:	00008067          	ret

00000000800021d8 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
	sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    800021d8:	fe010113          	addi	sp,sp,-32
    800021dc:	00113c23          	sd	ra,24(sp)
    800021e0:	00813823          	sd	s0,16(sp)
    800021e4:	00913423          	sd	s1,8(sp)
    800021e8:	02010413          	addi	s0,sp,32
    800021ec:	00050493          	mv	s1,a0
    800021f0:	00005797          	auipc	a5,0x5
    800021f4:	19078793          	addi	a5,a5,400 # 80007380 <_ZTV9Semaphore+0x10>
    800021f8:	00f53023          	sd	a5,0(a0)
	sem_close(myHandle);
    800021fc:	00853503          	ld	a0,8(a0)
    80002200:	fffff097          	auipc	ra,0xfffff
    80002204:	2b8080e7          	jalr	696(ra) # 800014b8 <_Z9sem_closeP4KSem>
	delete myHandle;
    80002208:	0084b483          	ld	s1,8(s1)
    8000220c:	02048863          	beqz	s1,8000223c <_ZN9SemaphoreD1Ev+0x64>
		return front == nullptr;
    80002210:	0084b503          	ld	a0,8(s1)
		while (!isEmpty()) {
    80002214:	00050e63          	beqz	a0,80002230 <_ZN9SemaphoreD1Ev+0x58>
			front = front->next;
    80002218:	00853783          	ld	a5,8(a0)
    8000221c:	00f4b423          	sd	a5,8(s1)
			delete node;
    80002220:	fe0508e3          	beqz	a0,80002210 <_ZN9SemaphoreD1Ev+0x38>
			mem_free(ptr);
    80002224:	fffff097          	auipc	ra,0xfffff
    80002228:	10c080e7          	jalr	268(ra) # 80001330 <_Z8mem_freePv>
		}
    8000222c:	fe5ff06f          	j	80002210 <_ZN9SemaphoreD1Ev+0x38>
    80002230:	00048513          	mv	a0,s1
    80002234:	00001097          	auipc	ra,0x1
    80002238:	a50080e7          	jalr	-1456(ra) # 80002c84 <_ZN4KSemdlEPv>
}
    8000223c:	01813083          	ld	ra,24(sp)
    80002240:	01013403          	ld	s0,16(sp)
    80002244:	00813483          	ld	s1,8(sp)
    80002248:	02010113          	addi	sp,sp,32
    8000224c:	00008067          	ret

0000000080002250 <_Znwm>:
void* operator new(size_t size) {
    80002250:	ff010113          	addi	sp,sp,-16
    80002254:	00113423          	sd	ra,8(sp)
    80002258:	00813023          	sd	s0,0(sp)
    8000225c:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    80002260:	fffff097          	auipc	ra,0xfffff
    80002264:	090080e7          	jalr	144(ra) # 800012f0 <_Z9mem_allocm>
}
    80002268:	00813083          	ld	ra,8(sp)
    8000226c:	00013403          	ld	s0,0(sp)
    80002270:	01010113          	addi	sp,sp,16
    80002274:	00008067          	ret

0000000080002278 <_Znam>:
void* operator new[](size_t size) {
    80002278:	ff010113          	addi	sp,sp,-16
    8000227c:	00113423          	sd	ra,8(sp)
    80002280:	00813023          	sd	s0,0(sp)
    80002284:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    80002288:	fffff097          	auipc	ra,0xfffff
    8000228c:	068080e7          	jalr	104(ra) # 800012f0 <_Z9mem_allocm>
}
    80002290:	00813083          	ld	ra,8(sp)
    80002294:	00013403          	ld	s0,0(sp)
    80002298:	01010113          	addi	sp,sp,16
    8000229c:	00008067          	ret

00000000800022a0 <_ZdlPv>:
noexcept {
    800022a0:	ff010113          	addi	sp,sp,-16
    800022a4:	00113423          	sd	ra,8(sp)
    800022a8:	00813023          	sd	s0,0(sp)
    800022ac:	01010413          	addi	s0,sp,16
mem_free(ptr);
    800022b0:	fffff097          	auipc	ra,0xfffff
    800022b4:	080080e7          	jalr	128(ra) # 80001330 <_Z8mem_freePv>
}
    800022b8:	00813083          	ld	ra,8(sp)
    800022bc:	00013403          	ld	s0,0(sp)
    800022c0:	01010113          	addi	sp,sp,16
    800022c4:	00008067          	ret

00000000800022c8 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    800022c8:	ff010113          	addi	sp,sp,-16
    800022cc:	00113423          	sd	ra,8(sp)
    800022d0:	00813023          	sd	s0,0(sp)
    800022d4:	01010413          	addi	s0,sp,16
}
    800022d8:	00000097          	auipc	ra,0x0
    800022dc:	fc8080e7          	jalr	-56(ra) # 800022a0 <_ZdlPv>
    800022e0:	00813083          	ld	ra,8(sp)
    800022e4:	00013403          	ld	s0,0(sp)
    800022e8:	01010113          	addi	sp,sp,16
    800022ec:	00008067          	ret

00000000800022f0 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    800022f0:	fe010113          	addi	sp,sp,-32
    800022f4:	00113c23          	sd	ra,24(sp)
    800022f8:	00813823          	sd	s0,16(sp)
    800022fc:	00913423          	sd	s1,8(sp)
    80002300:	02010413          	addi	s0,sp,32
    80002304:	00050493          	mv	s1,a0
}
    80002308:	00000097          	auipc	ra,0x0
    8000230c:	ed0080e7          	jalr	-304(ra) # 800021d8 <_ZN9SemaphoreD1Ev>
    80002310:	00048513          	mv	a0,s1
    80002314:	00000097          	auipc	ra,0x0
    80002318:	f8c080e7          	jalr	-116(ra) # 800022a0 <_ZdlPv>
    8000231c:	01813083          	ld	ra,24(sp)
    80002320:	01013403          	ld	s0,16(sp)
    80002324:	00813483          	ld	s1,8(sp)
    80002328:	02010113          	addi	sp,sp,32
    8000232c:	00008067          	ret

0000000080002330 <_ZdaPv>:
noexcept {
    80002330:	ff010113          	addi	sp,sp,-16
    80002334:	00113423          	sd	ra,8(sp)
    80002338:	00813023          	sd	s0,0(sp)
    8000233c:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80002340:	fffff097          	auipc	ra,0xfffff
    80002344:	ff0080e7          	jalr	-16(ra) # 80001330 <_Z8mem_freePv>
}
    80002348:	00813083          	ld	ra,8(sp)
    8000234c:	00013403          	ld	s0,0(sp)
    80002350:	01010113          	addi	sp,sp,16
    80002354:	00008067          	ret

0000000080002358 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (* body)(void*), void* arg) {
    80002358:	fd010113          	addi	sp,sp,-48
    8000235c:	02113423          	sd	ra,40(sp)
    80002360:	02813023          	sd	s0,32(sp)
    80002364:	00913c23          	sd	s1,24(sp)
    80002368:	01213823          	sd	s2,16(sp)
    8000236c:	01313423          	sd	s3,8(sp)
    80002370:	03010413          	addi	s0,sp,48
    80002374:	00050493          	mv	s1,a0
    80002378:	00058913          	mv	s2,a1
    8000237c:	00060993          	mv	s3,a2
    80002380:	00005797          	auipc	a5,0x5
    80002384:	fd878793          	addi	a5,a5,-40 # 80007358 <_ZTV6Thread+0x10>
    80002388:	00f53023          	sd	a5,0(a0)
	if (body != nullptr) {
    8000238c:	04058263          	beqz	a1,800023d0 <_ZN6ThreadC1EPFvPvES0_+0x78>
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    80002390:	00001537          	lui	a0,0x1
    80002394:	fffff097          	auipc	ra,0xfffff
    80002398:	f5c080e7          	jalr	-164(ra) # 800012f0 <_Z9mem_allocm>
    8000239c:	00050613          	mv	a2,a0
	myHandle = TCB::createThread(body,arg,stack);
    800023a0:	00098593          	mv	a1,s3
    800023a4:	00090513          	mv	a0,s2
    800023a8:	00000097          	auipc	ra,0x0
    800023ac:	3c8080e7          	jalr	968(ra) # 80002770 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    800023b0:	00a4b423          	sd	a0,8(s1)
}
    800023b4:	02813083          	ld	ra,40(sp)
    800023b8:	02013403          	ld	s0,32(sp)
    800023bc:	01813483          	ld	s1,24(sp)
    800023c0:	01013903          	ld	s2,16(sp)
    800023c4:	00813983          	ld	s3,8(sp)
    800023c8:	03010113          	addi	sp,sp,48
    800023cc:	00008067          	ret
	uint64* stack = nullptr;
    800023d0:	00000613          	li	a2,0
    800023d4:	fcdff06f          	j	800023a0 <_ZN6ThreadC1EPFvPvES0_+0x48>

00000000800023d8 <_ZN6Thread5startEv>:
int Thread::start() {
    800023d8:	ff010113          	addi	sp,sp,-16
    800023dc:	00113423          	sd	ra,8(sp)
    800023e0:	00813023          	sd	s0,0(sp)
    800023e4:	01010413          	addi	s0,sp,16
	TCB::start(myHandle);
    800023e8:	00853503          	ld	a0,8(a0) # 1008 <_entry-0x7fffeff8>
    800023ec:	00000097          	auipc	ra,0x0
    800023f0:	524080e7          	jalr	1316(ra) # 80002910 <_ZN3TCB5startEPS_>
}
    800023f4:	00000513          	li	a0,0
    800023f8:	00813083          	ld	ra,8(sp)
    800023fc:	00013403          	ld	s0,0(sp)
    80002400:	01010113          	addi	sp,sp,16
    80002404:	00008067          	ret

0000000080002408 <_ZN6Thread4joinEv>:
void Thread::join() {
    80002408:	ff010113          	addi	sp,sp,-16
    8000240c:	00813423          	sd	s0,8(sp)
    80002410:	01010413          	addi	s0,sp,16
}
    80002414:	00813403          	ld	s0,8(sp)
    80002418:	01010113          	addi	sp,sp,16
    8000241c:	00008067          	ret

0000000080002420 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80002420:	ff010113          	addi	sp,sp,-16
    80002424:	00813423          	sd	s0,8(sp)
    80002428:	01010413          	addi	s0,sp,16
}
    8000242c:	00813403          	ld	s0,8(sp)
    80002430:	01010113          	addi	sp,sp,16
    80002434:	00008067          	ret

0000000080002438 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t) {
    80002438:	ff010113          	addi	sp,sp,-16
    8000243c:	00813423          	sd	s0,8(sp)
    80002440:	01010413          	addi	s0,sp,16
}
    80002444:	00000513          	li	a0,0
    80002448:	00813403          	ld	s0,8(sp)
    8000244c:	01010113          	addi	sp,sp,16
    80002450:	00008067          	ret

0000000080002454 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80002454:	ff010113          	addi	sp,sp,-16
    80002458:	00813423          	sd	s0,8(sp)
    8000245c:	01010413          	addi	s0,sp,16
    80002460:	00005797          	auipc	a5,0x5
    80002464:	ef878793          	addi	a5,a5,-264 # 80007358 <_ZTV6Thread+0x10>
    80002468:	00f53023          	sd	a5,0(a0)
}
    8000246c:	00813403          	ld	s0,8(sp)
    80002470:	01010113          	addi	sp,sp,16
    80002474:	00008067          	ret

0000000080002478 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80002478:	ff010113          	addi	sp,sp,-16
    8000247c:	00113423          	sd	ra,8(sp)
    80002480:	00813023          	sd	s0,0(sp)
    80002484:	01010413          	addi	s0,sp,16
    80002488:	00005797          	auipc	a5,0x5
    8000248c:	ef878793          	addi	a5,a5,-264 # 80007380 <_ZTV9Semaphore+0x10>
    80002490:	00f53023          	sd	a5,0(a0)
	sem_open(&myHandle, init);
    80002494:	00850513          	addi	a0,a0,8
    80002498:	fffff097          	auipc	ra,0xfffff
    8000249c:	fe8080e7          	jalr	-24(ra) # 80001480 <_Z8sem_openPP4KSemj>
}
    800024a0:	00813083          	ld	ra,8(sp)
    800024a4:	00013403          	ld	s0,0(sp)
    800024a8:	01010113          	addi	sp,sp,16
    800024ac:	00008067          	ret

00000000800024b0 <_ZN9Semaphore4waitEv>:

int Semaphore::wait() {
    800024b0:	ff010113          	addi	sp,sp,-16
    800024b4:	00113423          	sd	ra,8(sp)
    800024b8:	00813023          	sd	s0,0(sp)
    800024bc:	01010413          	addi	s0,sp,16
	return sem_wait(myHandle);
    800024c0:	00853503          	ld	a0,8(a0)
    800024c4:	fffff097          	auipc	ra,0xfffff
    800024c8:	024080e7          	jalr	36(ra) # 800014e8 <_Z8sem_waitP4KSem>
}
    800024cc:	00813083          	ld	ra,8(sp)
    800024d0:	00013403          	ld	s0,0(sp)
    800024d4:	01010113          	addi	sp,sp,16
    800024d8:	00008067          	ret

00000000800024dc <_ZN9Semaphore6signalEv>:

int Semaphore::signal() {
    800024dc:	ff010113          	addi	sp,sp,-16
    800024e0:	00113423          	sd	ra,8(sp)
    800024e4:	00813023          	sd	s0,0(sp)
    800024e8:	01010413          	addi	s0,sp,16
	return sem_signal(myHandle);
    800024ec:	00853503          	ld	a0,8(a0)
    800024f0:	fffff097          	auipc	ra,0xfffff
    800024f4:	028080e7          	jalr	40(ra) # 80001518 <_Z10sem_signalP4KSem>
}
    800024f8:	00813083          	ld	ra,8(sp)
    800024fc:	00013403          	ld	s0,0(sp)
    80002500:	01010113          	addi	sp,sp,16
    80002504:	00008067          	ret

0000000080002508 <_ZN14PeriodicThread9terminateEv>:

void PeriodicThread::terminate() {
    80002508:	ff010113          	addi	sp,sp,-16
    8000250c:	00813423          	sd	s0,8(sp)
    80002510:	01010413          	addi	s0,sp,16

}
    80002514:	00813403          	ld	s0,8(sp)
    80002518:	01010113          	addi	sp,sp,16
    8000251c:	00008067          	ret

0000000080002520 <_ZN14PeriodicThreadC1Em>:

PeriodicThread::PeriodicThread(time_t period) {
    80002520:	fe010113          	addi	sp,sp,-32
    80002524:	00113c23          	sd	ra,24(sp)
    80002528:	00813823          	sd	s0,16(sp)
    8000252c:	00913423          	sd	s1,8(sp)
    80002530:	02010413          	addi	s0,sp,32
    80002534:	00050493          	mv	s1,a0
    80002538:	00000097          	auipc	ra,0x0
    8000253c:	f1c080e7          	jalr	-228(ra) # 80002454 <_ZN6ThreadC1Ev>
    80002540:	00005797          	auipc	a5,0x5
    80002544:	de878793          	addi	a5,a5,-536 # 80007328 <_ZTV14PeriodicThread+0x10>
    80002548:	00f4b023          	sd	a5,0(s1)

}
    8000254c:	01813083          	ld	ra,24(sp)
    80002550:	01013403          	ld	s0,16(sp)
    80002554:	00813483          	ld	s1,8(sp)
    80002558:	02010113          	addi	sp,sp,32
    8000255c:	00008067          	ret

0000000080002560 <_ZN7Console4getcEv>:

char Console::getc() {
    80002560:	ff010113          	addi	sp,sp,-16
    80002564:	00813423          	sd	s0,8(sp)
    80002568:	01010413          	addi	s0,sp,16
	return 0;
}
    8000256c:	00000513          	li	a0,0
    80002570:	00813403          	ld	s0,8(sp)
    80002574:	01010113          	addi	sp,sp,16
    80002578:	00008067          	ret

000000008000257c <_ZN7Console4putcEc>:

void Console::putc(char) {
    8000257c:	ff010113          	addi	sp,sp,-16
    80002580:	00813423          	sd	s0,8(sp)
    80002584:	01010413          	addi	s0,sp,16

}
    80002588:	00813403          	ld	s0,8(sp)
    8000258c:	01010113          	addi	sp,sp,16
    80002590:	00008067          	ret

0000000080002594 <_ZN6Thread3runEv>:
	static int sleep(time_t);

protected:
	Thread();

	virtual void run() {}
    80002594:	ff010113          	addi	sp,sp,-16
    80002598:	00813423          	sd	s0,8(sp)
    8000259c:	01010413          	addi	s0,sp,16
    800025a0:	00813403          	ld	s0,8(sp)
    800025a4:	01010113          	addi	sp,sp,16
    800025a8:	00008067          	ret

00000000800025ac <_ZN14PeriodicThread18periodicActivationEv>:
	void terminate();

protected:
	PeriodicThread(time_t period);

	virtual void periodicActivation() {}
    800025ac:	ff010113          	addi	sp,sp,-16
    800025b0:	00813423          	sd	s0,8(sp)
    800025b4:	01010413          	addi	s0,sp,16
    800025b8:	00813403          	ld	s0,8(sp)
    800025bc:	01010113          	addi	sp,sp,16
    800025c0:	00008067          	ret

00000000800025c4 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    800025c4:	ff010113          	addi	sp,sp,-16
    800025c8:	00813423          	sd	s0,8(sp)
    800025cc:	01010413          	addi	s0,sp,16
    800025d0:	00005797          	auipc	a5,0x5
    800025d4:	d5878793          	addi	a5,a5,-680 # 80007328 <_ZTV14PeriodicThread+0x10>
    800025d8:	00f53023          	sd	a5,0(a0)
    800025dc:	00813403          	ld	s0,8(sp)
    800025e0:	01010113          	addi	sp,sp,16
    800025e4:	00008067          	ret

00000000800025e8 <_ZN14PeriodicThreadD0Ev>:
    800025e8:	ff010113          	addi	sp,sp,-16
    800025ec:	00113423          	sd	ra,8(sp)
    800025f0:	00813023          	sd	s0,0(sp)
    800025f4:	01010413          	addi	s0,sp,16
    800025f8:	00005797          	auipc	a5,0x5
    800025fc:	d3078793          	addi	a5,a5,-720 # 80007328 <_ZTV14PeriodicThread+0x10>
    80002600:	00f53023          	sd	a5,0(a0)
    80002604:	00000097          	auipc	ra,0x0
    80002608:	c9c080e7          	jalr	-868(ra) # 800022a0 <_ZdlPv>
    8000260c:	00813083          	ld	ra,8(sp)
    80002610:	00013403          	ld	s0,0(sp)
    80002614:	01010113          	addi	sp,sp,16
    80002618:	00008067          	ret

000000008000261c <_ZN3TCB7wrapperEv>:
	Riscv::pushRegisters();
	TCB::dispatch();
	Riscv::popRegisters();
}

void TCB::wrapper() {
    8000261c:	ff010113          	addi	sp,sp,-16
    80002620:	00113423          	sd	ra,8(sp)
    80002624:	00813023          	sd	s0,0(sp)
    80002628:	01010413          	addi	s0,sp,16
	//pocetak wrappera se izvrsava u supervisor modu,
	//jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch/yield)
	Riscv::popSppSpie();
    8000262c:	00000097          	auipc	ra,0x0
    80002630:	318080e7          	jalr	792(ra) # 80002944 <_ZN5Riscv10popSppSpieEv>
	//na dalje se izvrsavamo u user modu
	running->threadFunction(running->args);
    80002634:	00005797          	auipc	a5,0x5
    80002638:	e1c7b783          	ld	a5,-484(a5) # 80007450 <_ZN3TCB7runningE>
    8000263c:	0107b703          	ld	a4,16(a5)
    80002640:	0207b503          	ld	a0,32(a5)
    80002644:	000700e7          	jalr	a4
	//running->finished = true;
	//i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
	thread_exit();
    80002648:	fffff097          	auipc	ra,0xfffff
    8000264c:	d98080e7          	jalr	-616(ra) # 800013e0 <_Z11thread_exitv>
}
    80002650:	00813083          	ld	ra,8(sp)
    80002654:	00013403          	ld	s0,0(sp)
    80002658:	01010113          	addi	sp,sp,16
    8000265c:	00008067          	ret

0000000080002660 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80002660:	fe010113          	addi	sp,sp,-32
    80002664:	00113c23          	sd	ra,24(sp)
    80002668:	00813823          	sd	s0,16(sp)
    8000266c:	00913423          	sd	s1,8(sp)
    80002670:	02010413          	addi	s0,sp,32
	TCB* old = TCB::running;
    80002674:	00005497          	auipc	s1,0x5
    80002678:	ddc4b483          	ld	s1,-548(s1) # 80007450 <_ZN3TCB7runningE>
	if (!old->finished && !old->blocked && old->timeToSleep == 0 && !old->needToJoin) {
    8000267c:	0304c783          	lbu	a5,48(s1)
    80002680:	00079e63          	bnez	a5,8000269c <_ZN3TCB8dispatchEv+0x3c>
    80002684:	0314c783          	lbu	a5,49(s1)
    80002688:	00079a63          	bnez	a5,8000269c <_ZN3TCB8dispatchEv+0x3c>
    8000268c:	0404b783          	ld	a5,64(s1)
    80002690:	00079663          	bnez	a5,8000269c <_ZN3TCB8dispatchEv+0x3c>
    80002694:	0324c783          	lbu	a5,50(s1)
    80002698:	04078a63          	beqz	a5,800026ec <_ZN3TCB8dispatchEv+0x8c>
	TCB::running = Scheduler::get();
    8000269c:	fffff097          	auipc	ra,0xfffff
    800026a0:	f90080e7          	jalr	-112(ra) # 8000162c <_ZN9Scheduler3getEv>
    800026a4:	00050593          	mv	a1,a0
    800026a8:	00005797          	auipc	a5,0x5
    800026ac:	da878793          	addi	a5,a5,-600 # 80007450 <_ZN3TCB7runningE>
    800026b0:	00a7b023          	sd	a0,0(a5)
	TCB::runningTimeSlice = 0;
    800026b4:	0007b423          	sd	zero,8(a5)
	if (TCB::running->threadFunction == nullptr) {
    800026b8:	01053783          	ld	a5,16(a0)
    800026bc:	04078063          	beqz	a5,800026fc <_ZN3TCB8dispatchEv+0x9c>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    800026c0:	10000793          	li	a5,256
    800026c4:	1007b073          	csrc	sstatus,a5
	if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    800026c8:	00b48863          	beq	s1,a1,800026d8 <_ZN3TCB8dispatchEv+0x78>
    800026cc:	00048513          	mv	a0,s1
    800026d0:	fffff097          	auipc	ra,0xfffff
    800026d4:	b40080e7          	jalr	-1216(ra) # 80001210 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    800026d8:	01813083          	ld	ra,24(sp)
    800026dc:	01013403          	ld	s0,16(sp)
    800026e0:	00813483          	ld	s1,8(sp)
    800026e4:	02010113          	addi	sp,sp,32
    800026e8:	00008067          	ret
		Scheduler::put(old);
    800026ec:	00048513          	mv	a0,s1
    800026f0:	fffff097          	auipc	ra,0xfffff
    800026f4:	ef8080e7          	jalr	-264(ra) # 800015e8 <_ZN9Scheduler3putEP3TCB>
    800026f8:	fa5ff06f          	j	8000269c <_ZN3TCB8dispatchEv+0x3c>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    800026fc:	10000793          	li	a5,256
    80002700:	1007a073          	csrs	sstatus,a5
}
    80002704:	fc5ff06f          	j	800026c8 <_ZN3TCB8dispatchEv+0x68>

0000000080002708 <_ZN3TCB5yieldEv>:
void TCB::yield() {
    80002708:	ff010113          	addi	sp,sp,-16
    8000270c:	00113423          	sd	ra,8(sp)
    80002710:	00813023          	sd	s0,0(sp)
    80002714:	01010413          	addi	s0,sp,16
	Riscv::pushRegisters();
    80002718:	fffff097          	auipc	ra,0xfffff
    8000271c:	8e8080e7          	jalr	-1816(ra) # 80001000 <_ZN5Riscv13pushRegistersEv>
	TCB::dispatch();
    80002720:	00000097          	auipc	ra,0x0
    80002724:	f40080e7          	jalr	-192(ra) # 80002660 <_ZN3TCB8dispatchEv>
	Riscv::popRegisters();
    80002728:	fffff097          	auipc	ra,0xfffff
    8000272c:	954080e7          	jalr	-1708(ra) # 8000107c <_ZN5Riscv12popRegistersEv>
}
    80002730:	00813083          	ld	ra,8(sp)
    80002734:	00013403          	ld	s0,0(sp)
    80002738:	01010113          	addi	sp,sp,16
    8000273c:	00008067          	ret

0000000080002740 <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    80002740:	ff010113          	addi	sp,sp,-16
    80002744:	00113423          	sd	ra,8(sp)
    80002748:	00813023          	sd	s0,0(sp)
    8000274c:	01010413          	addi	s0,sp,16
	return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::THREAD);
    80002750:	00200593          	li	a1,2
    80002754:	01850513          	addi	a0,a0,24
    80002758:	00000097          	auipc	ra,0x0
    8000275c:	20c080e7          	jalr	524(ra) # 80002964 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
}
    80002760:	00813083          	ld	ra,8(sp)
    80002764:	00013403          	ld	s0,0(sp)
    80002768:	01010113          	addi	sp,sp,16
    8000276c:	00008067          	ret

0000000080002770 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    80002770:	fd010113          	addi	sp,sp,-48
    80002774:	02113423          	sd	ra,40(sp)
    80002778:	02813023          	sd	s0,32(sp)
    8000277c:	00913c23          	sd	s1,24(sp)
    80002780:	01213823          	sd	s2,16(sp)
    80002784:	01313423          	sd	s3,8(sp)
    80002788:	01413023          	sd	s4,0(sp)
    8000278c:	03010413          	addi	s0,sp,48
    80002790:	00050993          	mv	s3,a0
    80002794:	00058a13          	mv	s4,a1
    80002798:	00060913          	mv	s2,a2
	TCB* newThread = new TCB(function, args, stack);
    8000279c:	06000513          	li	a0,96
    800027a0:	00000097          	auipc	ra,0x0
    800027a4:	fa0080e7          	jalr	-96(ra) # 80002740 <_ZN3TCBnwEm>
    800027a8:	00050493          	mv	s1,a0


	TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
													timeSlice(DEFAULT_TIME_SLICE), finished(false), blocked(false),
													needToJoin(false),
													nextInScheduler(nullptr), timeToSleep(0), nextSleeping(nullptr) {
    800027ac:	01353823          	sd	s3,16(a0)
    800027b0:	01253c23          	sd	s2,24(a0)
    800027b4:	03453023          	sd	s4,32(a0)
    800027b8:	00200793          	li	a5,2
    800027bc:	02f53423          	sd	a5,40(a0)
    800027c0:	02050823          	sb	zero,48(a0)
    800027c4:	020508a3          	sb	zero,49(a0)
    800027c8:	02050923          	sb	zero,50(a0)
    800027cc:	02053c23          	sd	zero,56(a0)
    800027d0:	04053023          	sd	zero,64(a0)
    800027d4:	04053423          	sd	zero,72(a0)
	ThreadQueue() : front(nullptr), back(nullptr) {}
    800027d8:	04053823          	sd	zero,80(a0)
    800027dc:	04053c23          	sd	zero,88(a0)
		//formiranje pocetnog konteksta; specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    800027e0:	04098a63          	beqz	s3,80002834 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xc4>
    800027e4:	00000797          	auipc	a5,0x0
    800027e8:	e3878793          	addi	a5,a5,-456 # 8000261c <_ZN3TCB7wrapperEv>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    800027ec:	04090863          	beqz	s2,8000283c <_ZN3TCB12createThreadEPFvPvES0_Pm+0xcc>
    800027f0:	00008637          	lui	a2,0x8
    800027f4:	00c90933          	add	s2,s2,a2
		this->context.ra = startRa;
    800027f8:	00f4b023          	sd	a5,0(s1)
		this->context.sp = startSp;
    800027fc:	0124b423          	sd	s2,8(s1)
	if (function != nullptr) Scheduler::put(newThread);
    80002800:	00098863          	beqz	s3,80002810 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xa0>
    80002804:	00048513          	mv	a0,s1
    80002808:	fffff097          	auipc	ra,0xfffff
    8000280c:	de0080e7          	jalr	-544(ra) # 800015e8 <_ZN9Scheduler3putEP3TCB>
}
    80002810:	00048513          	mv	a0,s1
    80002814:	02813083          	ld	ra,40(sp)
    80002818:	02013403          	ld	s0,32(sp)
    8000281c:	01813483          	ld	s1,24(sp)
    80002820:	01013903          	ld	s2,16(sp)
    80002824:	00813983          	ld	s3,8(sp)
    80002828:	00013a03          	ld	s4,0(sp)
    8000282c:	03010113          	addi	sp,sp,48
    80002830:	00008067          	ret
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80002834:	00000793          	li	a5,0
    80002838:	fb5ff06f          	j	800027ec <_ZN3TCB12createThreadEPFvPvES0_Pm+0x7c>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    8000283c:	00000913          	li	s2,0
    80002840:	fb9ff06f          	j	800027f8 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x88>

0000000080002844 <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    80002844:	ff010113          	addi	sp,sp,-16
    80002848:	00113423          	sd	ra,8(sp)
    8000284c:	00813023          	sd	s0,0(sp)
    80002850:	01010413          	addi	s0,sp,16
	MemoryAllocator::kfree(ptr);
    80002854:	00000097          	auipc	ra,0x0
    80002858:	2bc080e7          	jalr	700(ra) # 80002b10 <_ZN15MemoryAllocator5kfreeEPv>
}
    8000285c:	00813083          	ld	ra,8(sp)
    80002860:	00013403          	ld	s0,0(sp)
    80002864:	01010113          	addi	sp,sp,16
    80002868:	00008067          	ret

000000008000286c <_ZN3TCB10threadJoinEPS_>:

void TCB::threadJoin(TCB* handle) {
	if(handle->finished) return;
    8000286c:	03054783          	lbu	a5,48(a0)
    80002870:	00078463          	beqz	a5,80002878 <_ZN3TCB10threadJoinEPS_+0xc>
    80002874:	00008067          	ret
void TCB::threadJoin(TCB* handle) {
    80002878:	ff010113          	addi	sp,sp,-16
    8000287c:	00113423          	sd	ra,8(sp)
    80002880:	00813023          	sd	s0,0(sp)
    80002884:	01010413          	addi	s0,sp,16
	TCB::running->needToJoin = true;
    80002888:	00005597          	auipc	a1,0x5
    8000288c:	bc85b583          	ld	a1,-1080(a1) # 80007450 <_ZN3TCB7runningE>
    80002890:	00100793          	li	a5,1
    80002894:	02f58923          	sb	a5,50(a1)
	handle->waitingToJoin.putLast(TCB::running);
    80002898:	05050513          	addi	a0,a0,80
    8000289c:	fffff097          	auipc	ra,0xfffff
    800028a0:	988080e7          	jalr	-1656(ra) # 80001224 <_ZN11ThreadQueue7putLastEP3TCB>
}
    800028a4:	00813083          	ld	ra,8(sp)
    800028a8:	00013403          	ld	s0,0(sp)
    800028ac:	01010113          	addi	sp,sp,16
    800028b0:	00008067          	ret

00000000800028b4 <_ZN3TCB13releaseJoinedEv>:

void TCB::releaseJoined() {
	while(!TCB::running->waitingToJoin.isEmpty()){
    800028b4:	00005517          	auipc	a0,0x5
    800028b8:	b9c53503          	ld	a0,-1124(a0) # 80007450 <_ZN3TCB7runningE>
		return front == nullptr;
    800028bc:	05053783          	ld	a5,80(a0)
    800028c0:	04078663          	beqz	a5,8000290c <_ZN3TCB13releaseJoinedEv+0x58>
void TCB::releaseJoined() {
    800028c4:	ff010113          	addi	sp,sp,-16
    800028c8:	00113423          	sd	ra,8(sp)
    800028cc:	00813023          	sd	s0,0(sp)
    800028d0:	01010413          	addi	s0,sp,16
		TCB* tcb = TCB::running->waitingToJoin.getFirst();
    800028d4:	05050513          	addi	a0,a0,80
    800028d8:	fffff097          	auipc	ra,0xfffff
    800028dc:	9b8080e7          	jalr	-1608(ra) # 80001290 <_ZN11ThreadQueue8getFirstEv>
		tcb->needToJoin = false;
    800028e0:	02050923          	sb	zero,50(a0)
		Scheduler::put(tcb);
    800028e4:	fffff097          	auipc	ra,0xfffff
    800028e8:	d04080e7          	jalr	-764(ra) # 800015e8 <_ZN9Scheduler3putEP3TCB>
	while(!TCB::running->waitingToJoin.isEmpty()){
    800028ec:	00005517          	auipc	a0,0x5
    800028f0:	b6453503          	ld	a0,-1180(a0) # 80007450 <_ZN3TCB7runningE>
    800028f4:	05053783          	ld	a5,80(a0)
    800028f8:	fc079ee3          	bnez	a5,800028d4 <_ZN3TCB13releaseJoinedEv+0x20>
	}
}
    800028fc:	00813083          	ld	ra,8(sp)
    80002900:	00013403          	ld	s0,0(sp)
    80002904:	01010113          	addi	sp,sp,16
    80002908:	00008067          	ret
    8000290c:	00008067          	ret

0000000080002910 <_ZN3TCB5startEPS_>:

void TCB::start(TCB* newTcb) {
	//startovanje niti(stavljanje u Scheduler); main nit je vec aktivna, ne stavlja se u Scheduler
	if (newTcb->threadFunction != nullptr) Scheduler::put(newTcb);
    80002910:	01053783          	ld	a5,16(a0)
    80002914:	02078663          	beqz	a5,80002940 <_ZN3TCB5startEPS_+0x30>
void TCB::start(TCB* newTcb) {
    80002918:	ff010113          	addi	sp,sp,-16
    8000291c:	00113423          	sd	ra,8(sp)
    80002920:	00813023          	sd	s0,0(sp)
    80002924:	01010413          	addi	s0,sp,16
	if (newTcb->threadFunction != nullptr) Scheduler::put(newTcb);
    80002928:	fffff097          	auipc	ra,0xfffff
    8000292c:	cc0080e7          	jalr	-832(ra) # 800015e8 <_ZN9Scheduler3putEP3TCB>
}
    80002930:	00813083          	ld	ra,8(sp)
    80002934:	00013403          	ld	s0,0(sp)
    80002938:	01010113          	addi	sp,sp,16
    8000293c:	00008067          	ret
    80002940:	00008067          	ret

0000000080002944 <_ZN5Riscv10popSppSpieEv>:
// Created by os on 5/17/23.
//

#include "../h/Riscv.hpp"

void Riscv::popSppSpie() {
    80002944:	ff010113          	addi	sp,sp,-16
    80002948:	00813423          	sd	s0,8(sp)
    8000294c:	01010413          	addi	s0,sp,16
	//ra pokazuje iza ove funkcije na nastavak wrappera
	__asm__ volatile("csrw sepc, ra");
    80002950:	14109073          	csrw	sepc,ra
	__asm__ volatile("sret");
    80002954:	10200073          	sret
    80002958:	00813403          	ld	s0,8(sp)
    8000295c:	01010113          	addi	sp,sp,16
    80002960:	00008067          	ret

0000000080002964 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>:

bool MemoryAllocator::initialized = false;
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

void* MemoryAllocator::kmalloc(size_t size, Purpose pur) {
    80002964:	ff010113          	addi	sp,sp,-16
    80002968:	00813423          	sd	s0,8(sp)
    8000296c:	01010413          	addi	s0,sp,16
	if (size <= 0) return nullptr;
    80002970:	12050863          	beqz	a0,80002aa0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x13c>

	//pocetna inicijalizacija
	if (!initialized) {
    80002974:	00005797          	auipc	a5,0x5
    80002978:	aec7c783          	lbu	a5,-1300(a5) # 80007460 <_ZN15MemoryAllocator11initializedE>
    8000297c:	04079863          	bnez	a5,800029cc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x68>
		freeMemHead = (FreeMemSegment*)HEAP_START_ADDR;
    80002980:	00005617          	auipc	a2,0x5
    80002984:	a2863603          	ld	a2,-1496(a2) # 800073a8 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002988:	00063783          	ld	a5,0(a2)
    8000298c:	00005717          	auipc	a4,0x5
    80002990:	ad470713          	addi	a4,a4,-1324 # 80007460 <_ZN15MemoryAllocator11initializedE>
    80002994:	00f73423          	sd	a5,8(a4)
		freeMemHead->next = nullptr;
    80002998:	0007b023          	sd	zero,0(a5)
		freeMemHead->prev = nullptr;
    8000299c:	00873683          	ld	a3,8(a4)
    800029a0:	0006b423          	sd	zero,8(a3)
		freeMemHead->size = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR - sizeof(FreeMemSegment);
    800029a4:	00005797          	auipc	a5,0x5
    800029a8:	a347b783          	ld	a5,-1484(a5) # 800073d8 <_GLOBAL_OFFSET_TABLE_+0x48>
    800029ac:	0007b783          	ld	a5,0(a5)
    800029b0:	00063603          	ld	a2,0(a2)
    800029b4:	40c787b3          	sub	a5,a5,a2
    800029b8:	fe878793          	addi	a5,a5,-24
    800029bc:	00f6b823          	sd	a5,16(a3)
		usedMemHead = nullptr;
    800029c0:	00073823          	sd	zero,16(a4)

		initialized = true;
    800029c4:	00100793          	li	a5,1
    800029c8:	00f70023          	sb	a5,0(a4)
	}

	//alokacija uvek zaokruzena na blokove
	//size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
	size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    800029cc:	00655793          	srli	a5,a0,0x6
    800029d0:	03f57513          	andi	a0,a0,63
    800029d4:	00050463          	beqz	a0,800029dc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x78>
    800029d8:	00100513          	li	a0,1
    800029dc:	00a78533          	add	a0,a5,a0
	size = blocks * MEM_BLOCK_SIZE;
    800029e0:	00651793          	slli	a5,a0,0x6

	//trazenje slobodnog segmenta po first-fit algoritmu
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    800029e4:	00005517          	auipc	a0,0x5
    800029e8:	a8453503          	ld	a0,-1404(a0) # 80007468 <_ZN15MemoryAllocator11freeMemHeadE>
    800029ec:	08050c63          	beqz	a0,80002a84 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x120>
		if (current->size < size) continue;
    800029f0:	01053703          	ld	a4,16(a0)
    800029f4:	06f76463          	bltu	a4,a5,80002a5c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xf8>

		//pravljenje novog slobodnog fragmenta od ostatka fragmenta
		FreeMemSegment* remainderFree = (FreeMemSegment*)((char*)current + size);
    800029f8:	00f506b3          	add	a3,a0,a5
		remainderFree->size = current->size - size;
    800029fc:	40f70733          	sub	a4,a4,a5
    80002a00:	00e6b823          	sd	a4,16(a3)
		remainderFree->prev = current->prev;
    80002a04:	00853703          	ld	a4,8(a0)
    80002a08:	00e6b423          	sd	a4,8(a3)
		if (current->prev) current->prev->next = remainderFree;
    80002a0c:	00070463          	beqz	a4,80002a14 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xb0>
    80002a10:	00d73023          	sd	a3,0(a4)
		remainderFree->next = current->next;
    80002a14:	00053703          	ld	a4,0(a0)
    80002a18:	00e6b023          	sd	a4,0(a3)
		if (current->next) current->next->prev = remainderFree;
    80002a1c:	00070463          	beqz	a4,80002a24 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xc0>
    80002a20:	00d73423          	sd	a3,8(a4)
		if (freeMemHead == current) freeMemHead = remainderFree;
    80002a24:	00005717          	auipc	a4,0x5
    80002a28:	a4473703          	ld	a4,-1468(a4) # 80007468 <_ZN15MemoryAllocator11freeMemHeadE>
    80002a2c:	02a70c63          	beq	a4,a0,80002a64 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x100>

		//ubacivanje novog fragmenta u listu zauzetih fragmenata
		UsedMemSegment* newFragment = (UsedMemSegment*)current;
		newFragment->size = size;
    80002a30:	00f53423          	sd	a5,8(a0)
		newFragment->purpose = pur;
    80002a34:	00b52823          	sw	a1,16(a0)
		UsedMemSegment* prevUsed = nullptr;
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    80002a38:	00005697          	auipc	a3,0x5
    80002a3c:	a386b683          	ld	a3,-1480(a3) # 80007470 <_ZN15MemoryAllocator11usedMemHeadE>
    80002a40:	00068793          	mv	a5,a3
		UsedMemSegment* prevUsed = nullptr;
    80002a44:	00000713          	li	a4,0
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    80002a48:	02078463          	beqz	a5,80002a70 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x10c>
    80002a4c:	02a7f263          	bgeu	a5,a0,80002a70 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x10c>
    80002a50:	00078713          	mv	a4,a5
    80002a54:	0007b783          	ld	a5,0(a5)
    80002a58:	ff1ff06f          	j	80002a48 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xe4>
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80002a5c:	00053503          	ld	a0,0(a0)
    80002a60:	f8dff06f          	j	800029ec <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x88>
		if (freeMemHead == current) freeMemHead = remainderFree;
    80002a64:	00005717          	auipc	a4,0x5
    80002a68:	a0d73223          	sd	a3,-1532(a4) # 80007468 <_ZN15MemoryAllocator11freeMemHeadE>
    80002a6c:	fc5ff06f          	j	80002a30 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xcc>
		if (!prevUsed) {
    80002a70:	02070063          	beqz	a4,80002a90 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x12c>
			newFragment->next = usedMemHead;
			usedMemHead = newFragment;
		} else {
			newFragment->next = prevUsed->next;
    80002a74:	00073783          	ld	a5,0(a4)
    80002a78:	00f53023          	sd	a5,0(a0)
			prevUsed->next = newFragment;
    80002a7c:	00a73023          	sd	a0,0(a4)
		}
		return (char*)newFragment + sizeof(UsedMemSegment);
    80002a80:	01850513          	addi	a0,a0,24
	}
	return nullptr;
}
    80002a84:	00813403          	ld	s0,8(sp)
    80002a88:	01010113          	addi	sp,sp,16
    80002a8c:	00008067          	ret
			newFragment->next = usedMemHead;
    80002a90:	00d53023          	sd	a3,0(a0)
			usedMemHead = newFragment;
    80002a94:	00005797          	auipc	a5,0x5
    80002a98:	9ca7be23          	sd	a0,-1572(a5) # 80007470 <_ZN15MemoryAllocator11usedMemHeadE>
    80002a9c:	fe5ff06f          	j	80002a80 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x11c>
	if (size <= 0) return nullptr;
    80002aa0:	00000513          	li	a0,0
    80002aa4:	fe1ff06f          	j	80002a84 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x120>

0000000080002aa8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:
	tryToJoin(newFree);
	tryToJoin(prevFree);
	return 0;
}

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    80002aa8:	ff010113          	addi	sp,sp,-16
    80002aac:	00813423          	sd	s0,8(sp)
    80002ab0:	01010413          	addi	s0,sp,16
	if (!current) return 0;
    80002ab4:	04050663          	beqz	a0,80002b00 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x58>
	bool nextExists = current->next != nullptr;
    80002ab8:	00053783          	ld	a5,0(a0)
	char* nextAddr = (char*)current + current->size;
    80002abc:	01053703          	ld	a4,16(a0)
    80002ac0:	00e506b3          	add	a3,a0,a4
	char* cnext = (char*)current->next;
	bool nextIsConnected = (nextAddr == cnext);
	if (nextExists && nextIsConnected) {
    80002ac4:	04078263          	beqz	a5,80002b08 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x60>
    80002ac8:	00d78a63          	beq	a5,a3,80002adc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x34>
		current->size += current->next->size;
		current->next = current->next->next;
		if (current->next) current->next->prev = current;
		return 1;
	} else return 0;
    80002acc:	00000513          	li	a0,0
}
    80002ad0:	00813403          	ld	s0,8(sp)
    80002ad4:	01010113          	addi	sp,sp,16
    80002ad8:	00008067          	ret
		current->size += current->next->size;
    80002adc:	0107b683          	ld	a3,16(a5)
    80002ae0:	00d70733          	add	a4,a4,a3
    80002ae4:	00e53823          	sd	a4,16(a0)
		current->next = current->next->next;
    80002ae8:	0007b783          	ld	a5,0(a5)
    80002aec:	00f53023          	sd	a5,0(a0)
		if (current->next) current->next->prev = current;
    80002af0:	00078463          	beqz	a5,80002af8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x50>
    80002af4:	00a7b423          	sd	a0,8(a5)
		return 1;
    80002af8:	00100513          	li	a0,1
    80002afc:	fd5ff06f          	j	80002ad0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	if (!current) return 0;
    80002b00:	00000513          	li	a0,0
    80002b04:	fcdff06f          	j	80002ad0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	} else return 0;
    80002b08:	00000513          	li	a0,0
    80002b0c:	fc5ff06f          	j	80002ad0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>

0000000080002b10 <_ZN15MemoryAllocator5kfreeEPv>:
	if (!ptr) return 0;
    80002b10:	10050463          	beqz	a0,80002c18 <_ZN15MemoryAllocator5kfreeEPv+0x108>
    80002b14:	00050693          	mv	a3,a0
	if (!usedMemHead) return -1;
    80002b18:	00005797          	auipc	a5,0x5
    80002b1c:	9587b783          	ld	a5,-1704(a5) # 80007470 <_ZN15MemoryAllocator11usedMemHeadE>
    80002b20:	10078063          	beqz	a5,80002c20 <_ZN15MemoryAllocator5kfreeEPv+0x110>
	ptr = (char*)ptr - sizeof(UsedMemSegment);
    80002b24:	fe850513          	addi	a0,a0,-24
	UsedMemSegment* prevUsed = nullptr;
    80002b28:	00000713          	li	a4,0
	for (; currentUsed && currentUsed != ptr; prevUsed = currentUsed, currentUsed = currentUsed->next);
    80002b2c:	00078a63          	beqz	a5,80002b40 <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80002b30:	00a78863          	beq	a5,a0,80002b40 <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80002b34:	00078713          	mv	a4,a5
    80002b38:	0007b783          	ld	a5,0(a5)
    80002b3c:	ff1ff06f          	j	80002b2c <_ZN15MemoryAllocator5kfreeEPv+0x1c>
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80002b40:	0ea79463          	bne	a5,a0,80002c28 <_ZN15MemoryAllocator5kfreeEPv+0x118>
int MemoryAllocator::kfree(void* ptr) {
    80002b44:	fe010113          	addi	sp,sp,-32
    80002b48:	00113c23          	sd	ra,24(sp)
    80002b4c:	00813823          	sd	s0,16(sp)
    80002b50:	00913423          	sd	s1,8(sp)
    80002b54:	02010413          	addi	s0,sp,32
	if (prevUsed) prevUsed->next = currentUsed->next;
    80002b58:	02070863          	beqz	a4,80002b88 <_ZN15MemoryAllocator5kfreeEPv+0x78>
    80002b5c:	0007b783          	ld	a5,0(a5)
    80002b60:	00f73023          	sd	a5,0(a4)
	if (!freeMemHead || ptr < (char*)freeMemHead) {
    80002b64:	00005797          	auipc	a5,0x5
    80002b68:	9047b783          	ld	a5,-1788(a5) # 80007468 <_ZN15MemoryAllocator11freeMemHeadE>
    80002b6c:	02078663          	beqz	a5,80002b98 <_ZN15MemoryAllocator5kfreeEPv+0x88>
    80002b70:	02f56863          	bltu	a0,a5,80002ba0 <_ZN15MemoryAllocator5kfreeEPv+0x90>
			 prevFree->next != nullptr && ptr > (char*)(prevFree->next); prevFree = prevFree->next);
    80002b74:	00078493          	mv	s1,a5
    80002b78:	0007b783          	ld	a5,0(a5)
    80002b7c:	02078463          	beqz	a5,80002ba4 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80002b80:	fea7eae3          	bltu	a5,a0,80002b74 <_ZN15MemoryAllocator5kfreeEPv+0x64>
    80002b84:	0200006f          	j	80002ba4 <_ZN15MemoryAllocator5kfreeEPv+0x94>
	else usedMemHead = currentUsed->next;
    80002b88:	0007b783          	ld	a5,0(a5)
    80002b8c:	00005717          	auipc	a4,0x5
    80002b90:	8ef73223          	sd	a5,-1820(a4) # 80007470 <_ZN15MemoryAllocator11usedMemHeadE>
    80002b94:	fd1ff06f          	j	80002b64 <_ZN15MemoryAllocator5kfreeEPv+0x54>
		prevFree = nullptr;
    80002b98:	00078493          	mv	s1,a5
    80002b9c:	0080006f          	j	80002ba4 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80002ba0:	00000493          	li	s1,0
	size_t segmentSize = ((UsedMemSegment*)ptr)->size;
    80002ba4:	ff06b783          	ld	a5,-16(a3)
	newFree->size = segmentSize;
    80002ba8:	fef6bc23          	sd	a5,-8(a3)
	newFree->prev = prevFree;
    80002bac:	fe96b823          	sd	s1,-16(a3)
	if (prevFree) newFree->next = prevFree->next;
    80002bb0:	04048663          	beqz	s1,80002bfc <_ZN15MemoryAllocator5kfreeEPv+0xec>
    80002bb4:	0004b783          	ld	a5,0(s1)
    80002bb8:	fef6b423          	sd	a5,-24(a3)
	if (newFree->next) newFree->next->prev = newFree;
    80002bbc:	fe86b783          	ld	a5,-24(a3)
    80002bc0:	00078463          	beqz	a5,80002bc8 <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    80002bc4:	00a7b423          	sd	a0,8(a5)
	if (prevFree) prevFree->next = newFree;
    80002bc8:	04048263          	beqz	s1,80002c0c <_ZN15MemoryAllocator5kfreeEPv+0xfc>
    80002bcc:	00a4b023          	sd	a0,0(s1)
	tryToJoin(newFree);
    80002bd0:	00000097          	auipc	ra,0x0
    80002bd4:	ed8080e7          	jalr	-296(ra) # 80002aa8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	tryToJoin(prevFree);
    80002bd8:	00048513          	mv	a0,s1
    80002bdc:	00000097          	auipc	ra,0x0
    80002be0:	ecc080e7          	jalr	-308(ra) # 80002aa8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	return 0;
    80002be4:	00000513          	li	a0,0
}
    80002be8:	01813083          	ld	ra,24(sp)
    80002bec:	01013403          	ld	s0,16(sp)
    80002bf0:	00813483          	ld	s1,8(sp)
    80002bf4:	02010113          	addi	sp,sp,32
    80002bf8:	00008067          	ret
	else newFree->next = freeMemHead;
    80002bfc:	00005797          	auipc	a5,0x5
    80002c00:	86c7b783          	ld	a5,-1940(a5) # 80007468 <_ZN15MemoryAllocator11freeMemHeadE>
    80002c04:	fef6b423          	sd	a5,-24(a3)
    80002c08:	fb5ff06f          	j	80002bbc <_ZN15MemoryAllocator5kfreeEPv+0xac>
	else freeMemHead = newFree;
    80002c0c:	00005797          	auipc	a5,0x5
    80002c10:	84a7be23          	sd	a0,-1956(a5) # 80007468 <_ZN15MemoryAllocator11freeMemHeadE>
    80002c14:	fbdff06f          	j	80002bd0 <_ZN15MemoryAllocator5kfreeEPv+0xc0>
	if (!ptr) return 0;
    80002c18:	00000513          	li	a0,0
    80002c1c:	00008067          	ret
	if (!usedMemHead) return -1;
    80002c20:	fff00513          	li	a0,-1
    80002c24:	00008067          	ret
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80002c28:	fff00513          	li	a0,-1
}
    80002c2c:	00008067          	ret

0000000080002c30 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>:

bool MemoryAllocator::checkPurpose(void* ptr, MemoryAllocator::Purpose p) {
    80002c30:	ff010113          	addi	sp,sp,-16
    80002c34:	00813423          	sd	s0,8(sp)
    80002c38:	01010413          	addi	s0,sp,16
	ptr = (char*)ptr - sizeof(UsedMemSegment);
	return ((UsedMemSegment*)ptr)->purpose == p;
    80002c3c:	ff852503          	lw	a0,-8(a0)
    80002c40:	40b50533          	sub	a0,a0,a1
}
    80002c44:	00153513          	seqz	a0,a0
    80002c48:	00813403          	ld	s0,8(sp)
    80002c4c:	01010113          	addi	sp,sp,16
    80002c50:	00008067          	ret

0000000080002c54 <_ZN4KSemnwEm>:

#include "../h/KSem.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void* KSem::operator new(size_t size) {
    80002c54:	ff010113          	addi	sp,sp,-16
    80002c58:	00113423          	sd	ra,8(sp)
    80002c5c:	00813023          	sd	s0,0(sp)
    80002c60:	01010413          	addi	s0,sp,16
	return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::SEMAPHORE);
    80002c64:	00100593          	li	a1,1
    80002c68:	01850513          	addi	a0,a0,24
    80002c6c:	00000097          	auipc	ra,0x0
    80002c70:	cf8080e7          	jalr	-776(ra) # 80002964 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
}
    80002c74:	00813083          	ld	ra,8(sp)
    80002c78:	00013403          	ld	s0,0(sp)
    80002c7c:	01010113          	addi	sp,sp,16
    80002c80:	00008067          	ret

0000000080002c84 <_ZN4KSemdlEPv>:

void KSem::operator delete(void* ptr) {
    80002c84:	ff010113          	addi	sp,sp,-16
    80002c88:	00113423          	sd	ra,8(sp)
    80002c8c:	00813023          	sd	s0,0(sp)
    80002c90:	01010413          	addi	s0,sp,16
	MemoryAllocator::kfree(ptr);
    80002c94:	00000097          	auipc	ra,0x0
    80002c98:	e7c080e7          	jalr	-388(ra) # 80002b10 <_ZN15MemoryAllocator5kfreeEPv>
}
    80002c9c:	00813083          	ld	ra,8(sp)
    80002ca0:	00013403          	ld	s0,0(sp)
    80002ca4:	01010113          	addi	sp,sp,16
    80002ca8:	00008067          	ret

0000000080002cac <_ZN4KSem7initSemEj>:

KSem* KSem::initSem(uint val) {
    80002cac:	fe010113          	addi	sp,sp,-32
    80002cb0:	00113c23          	sd	ra,24(sp)
    80002cb4:	00813823          	sd	s0,16(sp)
    80002cb8:	00913423          	sd	s1,8(sp)
    80002cbc:	02010413          	addi	s0,sp,32
    80002cc0:	00050493          	mv	s1,a0
	return new KSem(val);
    80002cc4:	02000513          	li	a0,32
    80002cc8:	00000097          	auipc	ra,0x0
    80002ccc:	f8c080e7          	jalr	-116(ra) # 80002c54 <_ZN4KSemnwEm>

	static void operator delete(void* ptr);

protected:
	void block();

    80002cd0:	00952023          	sw	s1,0(a0)
	ThreadQueue() : front(nullptr), back(nullptr) {}
    80002cd4:	00053423          	sd	zero,8(a0)
    80002cd8:	00053823          	sd	zero,16(a0)
    80002cdc:	00100713          	li	a4,1
    80002ce0:	00e50c23          	sb	a4,24(a0)
}
    80002ce4:	01813083          	ld	ra,24(sp)
    80002ce8:	01013403          	ld	s0,16(sp)
    80002cec:	00813483          	ld	s1,8(sp)
    80002cf0:	02010113          	addi	sp,sp,32
    80002cf4:	00008067          	ret

0000000080002cf8 <_ZN4KSem5blockEv>:
	if (!working) return -3;
	if (val++ < 0) unblock();
	return 0;
}

void KSem::block() {
    80002cf8:	ff010113          	addi	sp,sp,-16
    80002cfc:	00113423          	sd	ra,8(sp)
    80002d00:	00813023          	sd	s0,0(sp)
    80002d04:	01010413          	addi	s0,sp,16
	TCB::running->setBlocked(true);
    80002d08:	00004797          	auipc	a5,0x4
    80002d0c:	6c87b783          	ld	a5,1736(a5) # 800073d0 <_GLOBAL_OFFSET_TABLE_+0x40>
    80002d10:	0007b583          	ld	a1,0(a5)
	void setBlocked(bool block) { this->blocked = block; }
    80002d14:	00100793          	li	a5,1
    80002d18:	02f588a3          	sb	a5,49(a1)
	blocked.putLast(TCB::running);
    80002d1c:	00850513          	addi	a0,a0,8
    80002d20:	ffffe097          	auipc	ra,0xffffe
    80002d24:	504080e7          	jalr	1284(ra) # 80001224 <_ZN11ThreadQueue7putLastEP3TCB>
	TCB::yield();
    80002d28:	00000097          	auipc	ra,0x0
    80002d2c:	9e0080e7          	jalr	-1568(ra) # 80002708 <_ZN3TCB5yieldEv>
}
    80002d30:	00813083          	ld	ra,8(sp)
    80002d34:	00013403          	ld	s0,0(sp)
    80002d38:	01010113          	addi	sp,sp,16
    80002d3c:	00008067          	ret

0000000080002d40 <_ZN4KSem4waitEv>:
int KSem::wait() {
    80002d40:	fe010113          	addi	sp,sp,-32
    80002d44:	00113c23          	sd	ra,24(sp)
    80002d48:	00813823          	sd	s0,16(sp)
    80002d4c:	00913423          	sd	s1,8(sp)
    80002d50:	02010413          	addi	s0,sp,32
    80002d54:	00050493          	mv	s1,a0
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    80002d58:	00100593          	li	a1,1
    80002d5c:	00000097          	auipc	ra,0x0
    80002d60:	ed4080e7          	jalr	-300(ra) # 80002c30 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>
    80002d64:	04050663          	beqz	a0,80002db0 <_ZN4KSem4waitEv+0x70>
	if (!working) return -3;
    80002d68:	0184c783          	lbu	a5,24(s1)
    80002d6c:	04078663          	beqz	a5,80002db8 <_ZN4KSem4waitEv+0x78>
	if (--val < 0) {
    80002d70:	0004a783          	lw	a5,0(s1)
    80002d74:	fff7879b          	addiw	a5,a5,-1
    80002d78:	00f4a023          	sw	a5,0(s1)
    80002d7c:	02079713          	slli	a4,a5,0x20
    80002d80:	00074e63          	bltz	a4,80002d9c <_ZN4KSem4waitEv+0x5c>
	return 0;
    80002d84:	00000513          	li	a0,0
}
    80002d88:	01813083          	ld	ra,24(sp)
    80002d8c:	01013403          	ld	s0,16(sp)
    80002d90:	00813483          	ld	s1,8(sp)
    80002d94:	02010113          	addi	sp,sp,32
    80002d98:	00008067          	ret
		block();
    80002d9c:	00048513          	mv	a0,s1
    80002da0:	00000097          	auipc	ra,0x0
    80002da4:	f58080e7          	jalr	-168(ra) # 80002cf8 <_ZN4KSem5blockEv>
		return -1;
    80002da8:	fff00513          	li	a0,-1
    80002dac:	fddff06f          	j	80002d88 <_ZN4KSem4waitEv+0x48>
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    80002db0:	ffe00513          	li	a0,-2
    80002db4:	fd5ff06f          	j	80002d88 <_ZN4KSem4waitEv+0x48>
	if (!working) return -3;
    80002db8:	ffd00513          	li	a0,-3
    80002dbc:	fcdff06f          	j	80002d88 <_ZN4KSem4waitEv+0x48>

0000000080002dc0 <_ZN4KSem7unblockEv>:

void KSem::unblock() {
    80002dc0:	ff010113          	addi	sp,sp,-16
    80002dc4:	00113423          	sd	ra,8(sp)
    80002dc8:	00813023          	sd	s0,0(sp)
    80002dcc:	01010413          	addi	s0,sp,16
	TCB* tcb = blocked.getFirst();
    80002dd0:	00850513          	addi	a0,a0,8
    80002dd4:	ffffe097          	auipc	ra,0xffffe
    80002dd8:	4bc080e7          	jalr	1212(ra) # 80001290 <_ZN11ThreadQueue8getFirstEv>
    80002ddc:	020508a3          	sb	zero,49(a0)
	tcb->setBlocked(false);
	Scheduler::put(tcb);
    80002de0:	fffff097          	auipc	ra,0xfffff
    80002de4:	808080e7          	jalr	-2040(ra) # 800015e8 <_ZN9Scheduler3putEP3TCB>
}
    80002de8:	00813083          	ld	ra,8(sp)
    80002dec:	00013403          	ld	s0,0(sp)
    80002df0:	01010113          	addi	sp,sp,16
    80002df4:	00008067          	ret

0000000080002df8 <_ZN4KSem6signalEv>:
int KSem::signal() {
    80002df8:	fe010113          	addi	sp,sp,-32
    80002dfc:	00113c23          	sd	ra,24(sp)
    80002e00:	00813823          	sd	s0,16(sp)
    80002e04:	00913423          	sd	s1,8(sp)
    80002e08:	02010413          	addi	s0,sp,32
    80002e0c:	00050493          	mv	s1,a0
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    80002e10:	00100593          	li	a1,1
    80002e14:	00000097          	auipc	ra,0x0
    80002e18:	e1c080e7          	jalr	-484(ra) # 80002c30 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>
    80002e1c:	04050463          	beqz	a0,80002e64 <_ZN4KSem6signalEv+0x6c>
	if (!working) return -3;
    80002e20:	0184c783          	lbu	a5,24(s1)
    80002e24:	04078463          	beqz	a5,80002e6c <_ZN4KSem6signalEv+0x74>
	if (val++ < 0) unblock();
    80002e28:	0004a783          	lw	a5,0(s1)
    80002e2c:	0017871b          	addiw	a4,a5,1
    80002e30:	00e4a023          	sw	a4,0(s1)
    80002e34:	0007ce63          	bltz	a5,80002e50 <_ZN4KSem6signalEv+0x58>
	return 0;
    80002e38:	00000513          	li	a0,0
}
    80002e3c:	01813083          	ld	ra,24(sp)
    80002e40:	01013403          	ld	s0,16(sp)
    80002e44:	00813483          	ld	s1,8(sp)
    80002e48:	02010113          	addi	sp,sp,32
    80002e4c:	00008067          	ret
	if (val++ < 0) unblock();
    80002e50:	00048513          	mv	a0,s1
    80002e54:	00000097          	auipc	ra,0x0
    80002e58:	f6c080e7          	jalr	-148(ra) # 80002dc0 <_ZN4KSem7unblockEv>
	return 0;
    80002e5c:	00000513          	li	a0,0
    80002e60:	fddff06f          	j	80002e3c <_ZN4KSem6signalEv+0x44>
	if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
    80002e64:	ffe00513          	li	a0,-2
    80002e68:	fd5ff06f          	j	80002e3c <_ZN4KSem6signalEv+0x44>
	if (!working) return -3;
    80002e6c:	ffd00513          	li	a0,-3
    80002e70:	fcdff06f          	j	80002e3c <_ZN4KSem6signalEv+0x44>

0000000080002e74 <_ZN4KSem8closeSemEPS_>:

int KSem::closeSem(sem_t handle) {
    80002e74:	fe010113          	addi	sp,sp,-32
    80002e78:	00113c23          	sd	ra,24(sp)
    80002e7c:	00813823          	sd	s0,16(sp)
    80002e80:	00913423          	sd	s1,8(sp)
    80002e84:	02010413          	addi	s0,sp,32
    80002e88:	00050493          	mv	s1,a0
	if (!MemoryAllocator::checkPurpose(handle, MemoryAllocator::SEMAPHORE)) return -2;
    80002e8c:	00100593          	li	a1,1
    80002e90:	00000097          	auipc	ra,0x0
    80002e94:	da0080e7          	jalr	-608(ra) # 80002c30 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>
    80002e98:	04050263          	beqz	a0,80002edc <_ZN4KSem8closeSemEPS_+0x68>
	handle->working = false;
    80002e9c:	00048c23          	sb	zero,24(s1)
    80002ea0:	01c0006f          	j	80002ebc <_ZN4KSem8closeSemEPS_+0x48>
	while (!handle->blocked.isEmpty()) {
		TCB* tcb = handle->blocked.getFirst();
    80002ea4:	00848513          	addi	a0,s1,8
    80002ea8:	ffffe097          	auipc	ra,0xffffe
    80002eac:	3e8080e7          	jalr	1000(ra) # 80001290 <_ZN11ThreadQueue8getFirstEv>
    80002eb0:	020508a3          	sb	zero,49(a0)
		tcb->setBlocked(false);
		Scheduler::put(tcb);
    80002eb4:	ffffe097          	auipc	ra,0xffffe
    80002eb8:	734080e7          	jalr	1844(ra) # 800015e8 <_ZN9Scheduler3putEP3TCB>
		return front == nullptr;
    80002ebc:	0084b783          	ld	a5,8(s1)
	while (!handle->blocked.isEmpty()) {
    80002ec0:	fe0792e3          	bnez	a5,80002ea4 <_ZN4KSem8closeSemEPS_+0x30>
	}
	return 0;
    80002ec4:	00000513          	li	a0,0
}
    80002ec8:	01813083          	ld	ra,24(sp)
    80002ecc:	01013403          	ld	s0,16(sp)
    80002ed0:	00813483          	ld	s1,8(sp)
    80002ed4:	02010113          	addi	sp,sp,32
    80002ed8:	00008067          	ret
	if (!MemoryAllocator::checkPurpose(handle, MemoryAllocator::SEMAPHORE)) return -2;
    80002edc:	ffe00513          	li	a0,-2
    80002ee0:	fe9ff06f          	j	80002ec8 <_ZN4KSem8closeSemEPS_+0x54>

0000000080002ee4 <_Z10testMemoryv>:
#include "../h/ThreadQueue.hpp"
//#include "../h/KSem.hpp"

extern Semaphore* semA;

void testMemory() {
    80002ee4:	81010113          	addi	sp,sp,-2032
    80002ee8:	7e113423          	sd	ra,2024(sp)
    80002eec:	7e813023          	sd	s0,2016(sp)
    80002ef0:	7c913c23          	sd	s1,2008(sp)
    80002ef4:	7f010413          	addi	s0,sp,2032
    80002ef8:	83010113          	addi	sp,sp,-2000
	const uint64 NumAllocations = 500;    //zasto nece za preko 500????
	const uint64 AllocationSize = 16;

	// Allocate and initialize pointers
	int* allocations[NumAllocations];
	for (uint64 i = 0; i < NumAllocations; ++i)
    80002efc:	00000713          	li	a4,0
    80002f00:	1f300793          	li	a5,499
    80002f04:	02e7e263          	bltu	a5,a4,80002f28 <_Z10testMemoryv+0x44>
		allocations[i] = nullptr;
    80002f08:	fffff7b7          	lui	a5,0xfffff
    80002f0c:	00371693          	slli	a3,a4,0x3
    80002f10:	fe040613          	addi	a2,s0,-32
    80002f14:	00f607b3          	add	a5,a2,a5
    80002f18:	00d787b3          	add	a5,a5,a3
    80002f1c:	0607b023          	sd	zero,96(a5) # fffffffffffff060 <end+0xffffffff7fff6980>
	for (uint64 i = 0; i < NumAllocations; ++i)
    80002f20:	00170713          	addi	a4,a4,1
    80002f24:	fddff06f          	j	80002f00 <_Z10testMemoryv+0x1c>

	// Allocate memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80002f28:	00000493          	li	s1,0
    80002f2c:	1f300793          	li	a5,499
    80002f30:	0297ec63          	bltu	a5,s1,80002f68 <_Z10testMemoryv+0x84>
		allocations[i] = static_cast<int*>(MemoryAllocator::kmalloc(AllocationSize, MemoryAllocator::MISC));
    80002f34:	00300593          	li	a1,3
    80002f38:	01000513          	li	a0,16
    80002f3c:	00000097          	auipc	ra,0x0
    80002f40:	a28080e7          	jalr	-1496(ra) # 80002964 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
    80002f44:	fffff737          	lui	a4,0xfffff
    80002f48:	00349793          	slli	a5,s1,0x3
    80002f4c:	fe040693          	addi	a3,s0,-32
    80002f50:	00e68733          	add	a4,a3,a4
    80002f54:	00f707b3          	add	a5,a4,a5
    80002f58:	06a7b023          	sd	a0,96(a5)
		if (allocations[i] == nullptr) {
    80002f5c:	00050663          	beqz	a0,80002f68 <_Z10testMemoryv+0x84>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80002f60:	00148493          	addi	s1,s1,1
    80002f64:	fc9ff06f          	j	80002f2c <_Z10testMemoryv+0x48>
    80002f68:	00000493          	li	s1,0
    80002f6c:	0100006f          	j	80002f7c <_Z10testMemoryv+0x98>
	}

	// Free memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
		if (allocations[i] != nullptr) {
			if (MemoryAllocator::kfree(allocations[i]) != 0) {
    80002f70:	00000097          	auipc	ra,0x0
    80002f74:	ba0080e7          	jalr	-1120(ra) # 80002b10 <_ZN15MemoryAllocator5kfreeEPv>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80002f78:	00148493          	addi	s1,s1,1
    80002f7c:	1f300793          	li	a5,499
    80002f80:	0297e263          	bltu	a5,s1,80002fa4 <_Z10testMemoryv+0xc0>
		if (allocations[i] != nullptr) {
    80002f84:	fffff737          	lui	a4,0xfffff
    80002f88:	00349793          	slli	a5,s1,0x3
    80002f8c:	fe040693          	addi	a3,s0,-32
    80002f90:	00e68733          	add	a4,a3,a4
    80002f94:	00f707b3          	add	a5,a4,a5
    80002f98:	0607b503          	ld	a0,96(a5)
    80002f9c:	fc051ae3          	bnez	a0,80002f70 <_Z10testMemoryv+0x8c>
    80002fa0:	fd9ff06f          	j	80002f78 <_Z10testMemoryv+0x94>
//				printString("\nDeallocation failed for index ");
//				printInteger(i);
			}
		}
	}
}
    80002fa4:	7d010113          	addi	sp,sp,2000
    80002fa8:	7e813083          	ld	ra,2024(sp)
    80002fac:	7e013403          	ld	s0,2016(sp)
    80002fb0:	7d813483          	ld	s1,2008(sp)
    80002fb4:	7f010113          	addi	sp,sp,2032
    80002fb8:	00008067          	ret

0000000080002fbc <_Z5nit1fPv>:

void nit1f(void*) {
    80002fbc:	fe010113          	addi	sp,sp,-32
    80002fc0:	00113c23          	sd	ra,24(sp)
    80002fc4:	00813823          	sd	s0,16(sp)
    80002fc8:	00913423          	sd	s1,8(sp)
    80002fcc:	01213023          	sd	s2,0(sp)
    80002fd0:	02010413          	addi	s0,sp,32
	for(int i=0;i<3;i++){
    80002fd4:	00000913          	li	s2,0
    80002fd8:	0440006f          	j	8000301c <_Z5nit1fPv+0x60>
		int res = (*semA).wait();
		if(res){
			printString("\nNit 1 cekala na semaforu\n");
		}
		else{
			printString("\nNit 1 nije cekala\n");
    80002fdc:	00003517          	auipc	a0,0x3
    80002fe0:	21450513          	addi	a0,a0,532 # 800061f0 <CONSOLE_STATUS+0x1e0>
    80002fe4:	ffffe097          	auipc	ra,0xffffe
    80002fe8:	5b4080e7          	jalr	1460(ra) # 80001598 <_Z11printStringPKc>
		}
		printString("\nsem_wait za nit 1 vratio ");
    80002fec:	00003517          	auipc	a0,0x3
    80002ff0:	21c50513          	addi	a0,a0,540 # 80006208 <CONSOLE_STATUS+0x1f8>
    80002ff4:	ffffe097          	auipc	ra,0xffffe
    80002ff8:	5a4080e7          	jalr	1444(ra) # 80001598 <_Z11printStringPKc>
		printInteger(res);
    80002ffc:	00048513          	mv	a0,s1
    80003000:	ffffe097          	auipc	ra,0xffffe
    80003004:	5c0080e7          	jalr	1472(ra) # 800015c0 <_Z12printIntegerm>
		printString("\n");
    80003008:	00003517          	auipc	a0,0x3
    8000300c:	3b050513          	addi	a0,a0,944 # 800063b8 <CONSOLE_STATUS+0x3a8>
    80003010:	ffffe097          	auipc	ra,0xffffe
    80003014:	588080e7          	jalr	1416(ra) # 80001598 <_Z11printStringPKc>
	for(int i=0;i<3;i++){
    80003018:	0019091b          	addiw	s2,s2,1
    8000301c:	00200793          	li	a5,2
    80003020:	0527c263          	blt	a5,s2,80003064 <_Z5nit1fPv+0xa8>
		printString("\nNit 1 dolazi na semafor\n");
    80003024:	00003517          	auipc	a0,0x3
    80003028:	18c50513          	addi	a0,a0,396 # 800061b0 <CONSOLE_STATUS+0x1a0>
    8000302c:	ffffe097          	auipc	ra,0xffffe
    80003030:	56c080e7          	jalr	1388(ra) # 80001598 <_Z11printStringPKc>
		int res = (*semA).wait();
    80003034:	00004797          	auipc	a5,0x4
    80003038:	3647b783          	ld	a5,868(a5) # 80007398 <_GLOBAL_OFFSET_TABLE_+0x8>
    8000303c:	0007b503          	ld	a0,0(a5)
    80003040:	fffff097          	auipc	ra,0xfffff
    80003044:	470080e7          	jalr	1136(ra) # 800024b0 <_ZN9Semaphore4waitEv>
    80003048:	00050493          	mv	s1,a0
		if(res){
    8000304c:	f80508e3          	beqz	a0,80002fdc <_Z5nit1fPv+0x20>
			printString("\nNit 1 cekala na semaforu\n");
    80003050:	00003517          	auipc	a0,0x3
    80003054:	18050513          	addi	a0,a0,384 # 800061d0 <CONSOLE_STATUS+0x1c0>
    80003058:	ffffe097          	auipc	ra,0xffffe
    8000305c:	540080e7          	jalr	1344(ra) # 80001598 <_Z11printStringPKc>
    80003060:	f8dff06f          	j	80002fec <_Z5nit1fPv+0x30>
	}

	printString("\nGotova nit 1\n");
    80003064:	00003517          	auipc	a0,0x3
    80003068:	1c450513          	addi	a0,a0,452 # 80006228 <CONSOLE_STATUS+0x218>
    8000306c:	ffffe097          	auipc	ra,0xffffe
    80003070:	52c080e7          	jalr	1324(ra) # 80001598 <_Z11printStringPKc>
}
    80003074:	01813083          	ld	ra,24(sp)
    80003078:	01013403          	ld	s0,16(sp)
    8000307c:	00813483          	ld	s1,8(sp)
    80003080:	00013903          	ld	s2,0(sp)
    80003084:	02010113          	addi	sp,sp,32
    80003088:	00008067          	ret

000000008000308c <_Z5nit2fPv>:

void nit2f(void* arg2) {
    8000308c:	fd010113          	addi	sp,sp,-48
    80003090:	02113423          	sd	ra,40(sp)
    80003094:	02813023          	sd	s0,32(sp)
    80003098:	00913c23          	sd	s1,24(sp)
    8000309c:	01213823          	sd	s2,16(sp)
    800030a0:	01313423          	sd	s3,8(sp)
    800030a4:	03010413          	addi	s0,sp,48
	for(int i=0;i<3;i++){
    800030a8:	00000913          	li	s2,0
    800030ac:	0080006f          	j	800030b4 <_Z5nit2fPv+0x28>
    800030b0:	0019091b          	addiw	s2,s2,1
    800030b4:	00200793          	li	a5,2
    800030b8:	0927c063          	blt	a5,s2,80003138 <_Z5nit2fPv+0xac>
		printString("\nNit 2 daje signal\n");
    800030bc:	00003517          	auipc	a0,0x3
    800030c0:	17c50513          	addi	a0,a0,380 # 80006238 <CONSOLE_STATUS+0x228>
    800030c4:	ffffe097          	auipc	ra,0xffffe
    800030c8:	4d4080e7          	jalr	1236(ra) # 80001598 <_Z11printStringPKc>
		//sem_signal(semA);
		int res = (*semA).signal();
    800030cc:	00004997          	auipc	s3,0x4
    800030d0:	2cc9b983          	ld	s3,716(s3) # 80007398 <_GLOBAL_OFFSET_TABLE_+0x8>
    800030d4:	0009b503          	ld	a0,0(s3)
    800030d8:	fffff097          	auipc	ra,0xfffff
    800030dc:	404080e7          	jalr	1028(ra) # 800024dc <_ZN9Semaphore6signalEv>
    800030e0:	00050493          	mv	s1,a0
		printString("\nPovratna vrednost signala je");
    800030e4:	00003517          	auipc	a0,0x3
    800030e8:	16c50513          	addi	a0,a0,364 # 80006250 <CONSOLE_STATUS+0x240>
    800030ec:	ffffe097          	auipc	ra,0xffffe
    800030f0:	4ac080e7          	jalr	1196(ra) # 80001598 <_Z11printStringPKc>
		printInteger(res);
    800030f4:	00048513          	mv	a0,s1
    800030f8:	ffffe097          	auipc	ra,0xffffe
    800030fc:	4c8080e7          	jalr	1224(ra) # 800015c0 <_Z12printIntegerm>
		printString("\n");
    80003100:	00003517          	auipc	a0,0x3
    80003104:	2b850513          	addi	a0,a0,696 # 800063b8 <CONSOLE_STATUS+0x3a8>
    80003108:	ffffe097          	auipc	ra,0xffffe
    8000310c:	490080e7          	jalr	1168(ra) # 80001598 <_Z11printStringPKc>
		//sem_close(semA);
		printString("\nNit 2 ubija semafor\n");
    80003110:	00003517          	auipc	a0,0x3
    80003114:	16050513          	addi	a0,a0,352 # 80006270 <CONSOLE_STATUS+0x260>
    80003118:	ffffe097          	auipc	ra,0xffffe
    8000311c:	480080e7          	jalr	1152(ra) # 80001598 <_Z11printStringPKc>
		delete semA;
    80003120:	0009b503          	ld	a0,0(s3)
    80003124:	f80506e3          	beqz	a0,800030b0 <_Z5nit2fPv+0x24>
    80003128:	00053783          	ld	a5,0(a0)
    8000312c:	0087b783          	ld	a5,8(a5)
    80003130:	000780e7          	jalr	a5
    80003134:	f7dff06f          	j	800030b0 <_Z5nit2fPv+0x24>

	}
	printString("\nGotova nit 2\n");
    80003138:	00003517          	auipc	a0,0x3
    8000313c:	15050513          	addi	a0,a0,336 # 80006288 <CONSOLE_STATUS+0x278>
    80003140:	ffffe097          	auipc	ra,0xffffe
    80003144:	458080e7          	jalr	1112(ra) # 80001598 <_Z11printStringPKc>
}
    80003148:	02813083          	ld	ra,40(sp)
    8000314c:	02013403          	ld	s0,32(sp)
    80003150:	01813483          	ld	s1,24(sp)
    80003154:	01013903          	ld	s2,16(sp)
    80003158:	00813983          	ld	s3,8(sp)
    8000315c:	03010113          	addi	sp,sp,48
    80003160:	00008067          	ret

0000000080003164 <_Z5nit3fPv>:


void nit3f(void*) {
    80003164:	ff010113          	addi	sp,sp,-16
    80003168:	00113423          	sd	ra,8(sp)
    8000316c:	00813023          	sd	s0,0(sp)
    80003170:	01010413          	addi	s0,sp,16
//		printString("\n");
//		sem_wait(semA);
//		printString("Nit 3 prosla semafor\n");
//		time_sleep(10);
//	}
	printString("\nGotova nit3\n");
    80003174:	00003517          	auipc	a0,0x3
    80003178:	12450513          	addi	a0,a0,292 # 80006298 <CONSOLE_STATUS+0x288>
    8000317c:	ffffe097          	auipc	ra,0xffffe
    80003180:	41c080e7          	jalr	1052(ra) # 80001598 <_Z11printStringPKc>
    80003184:	00813083          	ld	ra,8(sp)
    80003188:	00013403          	ld	s0,0(sp)
    8000318c:	01010113          	addi	sp,sp,16
    80003190:	00008067          	ret

0000000080003194 <start>:
    80003194:	ff010113          	addi	sp,sp,-16
    80003198:	00813423          	sd	s0,8(sp)
    8000319c:	01010413          	addi	s0,sp,16
    800031a0:	300027f3          	csrr	a5,mstatus
    800031a4:	ffffe737          	lui	a4,0xffffe
    800031a8:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff611f>
    800031ac:	00e7f7b3          	and	a5,a5,a4
    800031b0:	00001737          	lui	a4,0x1
    800031b4:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800031b8:	00e7e7b3          	or	a5,a5,a4
    800031bc:	30079073          	csrw	mstatus,a5
    800031c0:	00000797          	auipc	a5,0x0
    800031c4:	16078793          	addi	a5,a5,352 # 80003320 <system_main>
    800031c8:	34179073          	csrw	mepc,a5
    800031cc:	00000793          	li	a5,0
    800031d0:	18079073          	csrw	satp,a5
    800031d4:	000107b7          	lui	a5,0x10
    800031d8:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800031dc:	30279073          	csrw	medeleg,a5
    800031e0:	30379073          	csrw	mideleg,a5
    800031e4:	104027f3          	csrr	a5,sie
    800031e8:	2227e793          	ori	a5,a5,546
    800031ec:	10479073          	csrw	sie,a5
    800031f0:	fff00793          	li	a5,-1
    800031f4:	00a7d793          	srli	a5,a5,0xa
    800031f8:	3b079073          	csrw	pmpaddr0,a5
    800031fc:	00f00793          	li	a5,15
    80003200:	3a079073          	csrw	pmpcfg0,a5
    80003204:	f14027f3          	csrr	a5,mhartid
    80003208:	0200c737          	lui	a4,0x200c
    8000320c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003210:	0007869b          	sext.w	a3,a5
    80003214:	00269713          	slli	a4,a3,0x2
    80003218:	000f4637          	lui	a2,0xf4
    8000321c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003220:	00d70733          	add	a4,a4,a3
    80003224:	0037979b          	slliw	a5,a5,0x3
    80003228:	020046b7          	lui	a3,0x2004
    8000322c:	00d787b3          	add	a5,a5,a3
    80003230:	00c585b3          	add	a1,a1,a2
    80003234:	00371693          	slli	a3,a4,0x3
    80003238:	00004717          	auipc	a4,0x4
    8000323c:	24870713          	addi	a4,a4,584 # 80007480 <timer_scratch>
    80003240:	00b7b023          	sd	a1,0(a5)
    80003244:	00d70733          	add	a4,a4,a3
    80003248:	00f73c23          	sd	a5,24(a4)
    8000324c:	02c73023          	sd	a2,32(a4)
    80003250:	34071073          	csrw	mscratch,a4
    80003254:	00000797          	auipc	a5,0x0
    80003258:	6ec78793          	addi	a5,a5,1772 # 80003940 <timervec>
    8000325c:	30579073          	csrw	mtvec,a5
    80003260:	300027f3          	csrr	a5,mstatus
    80003264:	0087e793          	ori	a5,a5,8
    80003268:	30079073          	csrw	mstatus,a5
    8000326c:	304027f3          	csrr	a5,mie
    80003270:	0807e793          	ori	a5,a5,128
    80003274:	30479073          	csrw	mie,a5
    80003278:	f14027f3          	csrr	a5,mhartid
    8000327c:	0007879b          	sext.w	a5,a5
    80003280:	00078213          	mv	tp,a5
    80003284:	30200073          	mret
    80003288:	00813403          	ld	s0,8(sp)
    8000328c:	01010113          	addi	sp,sp,16
    80003290:	00008067          	ret

0000000080003294 <timerinit>:
    80003294:	ff010113          	addi	sp,sp,-16
    80003298:	00813423          	sd	s0,8(sp)
    8000329c:	01010413          	addi	s0,sp,16
    800032a0:	f14027f3          	csrr	a5,mhartid
    800032a4:	0200c737          	lui	a4,0x200c
    800032a8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800032ac:	0007869b          	sext.w	a3,a5
    800032b0:	00269713          	slli	a4,a3,0x2
    800032b4:	000f4637          	lui	a2,0xf4
    800032b8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800032bc:	00d70733          	add	a4,a4,a3
    800032c0:	0037979b          	slliw	a5,a5,0x3
    800032c4:	020046b7          	lui	a3,0x2004
    800032c8:	00d787b3          	add	a5,a5,a3
    800032cc:	00c585b3          	add	a1,a1,a2
    800032d0:	00371693          	slli	a3,a4,0x3
    800032d4:	00004717          	auipc	a4,0x4
    800032d8:	1ac70713          	addi	a4,a4,428 # 80007480 <timer_scratch>
    800032dc:	00b7b023          	sd	a1,0(a5)
    800032e0:	00d70733          	add	a4,a4,a3
    800032e4:	00f73c23          	sd	a5,24(a4)
    800032e8:	02c73023          	sd	a2,32(a4)
    800032ec:	34071073          	csrw	mscratch,a4
    800032f0:	00000797          	auipc	a5,0x0
    800032f4:	65078793          	addi	a5,a5,1616 # 80003940 <timervec>
    800032f8:	30579073          	csrw	mtvec,a5
    800032fc:	300027f3          	csrr	a5,mstatus
    80003300:	0087e793          	ori	a5,a5,8
    80003304:	30079073          	csrw	mstatus,a5
    80003308:	304027f3          	csrr	a5,mie
    8000330c:	0807e793          	ori	a5,a5,128
    80003310:	30479073          	csrw	mie,a5
    80003314:	00813403          	ld	s0,8(sp)
    80003318:	01010113          	addi	sp,sp,16
    8000331c:	00008067          	ret

0000000080003320 <system_main>:
    80003320:	fe010113          	addi	sp,sp,-32
    80003324:	00813823          	sd	s0,16(sp)
    80003328:	00913423          	sd	s1,8(sp)
    8000332c:	00113c23          	sd	ra,24(sp)
    80003330:	02010413          	addi	s0,sp,32
    80003334:	00000097          	auipc	ra,0x0
    80003338:	0c4080e7          	jalr	196(ra) # 800033f8 <cpuid>
    8000333c:	00004497          	auipc	s1,0x4
    80003340:	0c448493          	addi	s1,s1,196 # 80007400 <started>
    80003344:	02050263          	beqz	a0,80003368 <system_main+0x48>
    80003348:	0004a783          	lw	a5,0(s1)
    8000334c:	0007879b          	sext.w	a5,a5
    80003350:	fe078ce3          	beqz	a5,80003348 <system_main+0x28>
    80003354:	0ff0000f          	fence
    80003358:	00003517          	auipc	a0,0x3
    8000335c:	f8050513          	addi	a0,a0,-128 # 800062d8 <CONSOLE_STATUS+0x2c8>
    80003360:	00001097          	auipc	ra,0x1
    80003364:	a7c080e7          	jalr	-1412(ra) # 80003ddc <panic>
    80003368:	00001097          	auipc	ra,0x1
    8000336c:	9d0080e7          	jalr	-1584(ra) # 80003d38 <consoleinit>
    80003370:	00001097          	auipc	ra,0x1
    80003374:	15c080e7          	jalr	348(ra) # 800044cc <printfinit>
    80003378:	00003517          	auipc	a0,0x3
    8000337c:	04050513          	addi	a0,a0,64 # 800063b8 <CONSOLE_STATUS+0x3a8>
    80003380:	00001097          	auipc	ra,0x1
    80003384:	ab8080e7          	jalr	-1352(ra) # 80003e38 <__printf>
    80003388:	00003517          	auipc	a0,0x3
    8000338c:	f2050513          	addi	a0,a0,-224 # 800062a8 <CONSOLE_STATUS+0x298>
    80003390:	00001097          	auipc	ra,0x1
    80003394:	aa8080e7          	jalr	-1368(ra) # 80003e38 <__printf>
    80003398:	00003517          	auipc	a0,0x3
    8000339c:	02050513          	addi	a0,a0,32 # 800063b8 <CONSOLE_STATUS+0x3a8>
    800033a0:	00001097          	auipc	ra,0x1
    800033a4:	a98080e7          	jalr	-1384(ra) # 80003e38 <__printf>
    800033a8:	00001097          	auipc	ra,0x1
    800033ac:	4b0080e7          	jalr	1200(ra) # 80004858 <kinit>
    800033b0:	00000097          	auipc	ra,0x0
    800033b4:	148080e7          	jalr	328(ra) # 800034f8 <trapinit>
    800033b8:	00000097          	auipc	ra,0x0
    800033bc:	16c080e7          	jalr	364(ra) # 80003524 <trapinithart>
    800033c0:	00000097          	auipc	ra,0x0
    800033c4:	5c0080e7          	jalr	1472(ra) # 80003980 <plicinit>
    800033c8:	00000097          	auipc	ra,0x0
    800033cc:	5e0080e7          	jalr	1504(ra) # 800039a8 <plicinithart>
    800033d0:	00000097          	auipc	ra,0x0
    800033d4:	078080e7          	jalr	120(ra) # 80003448 <userinit>
    800033d8:	0ff0000f          	fence
    800033dc:	00100793          	li	a5,1
    800033e0:	00003517          	auipc	a0,0x3
    800033e4:	ee050513          	addi	a0,a0,-288 # 800062c0 <CONSOLE_STATUS+0x2b0>
    800033e8:	00f4a023          	sw	a5,0(s1)
    800033ec:	00001097          	auipc	ra,0x1
    800033f0:	a4c080e7          	jalr	-1460(ra) # 80003e38 <__printf>
    800033f4:	0000006f          	j	800033f4 <system_main+0xd4>

00000000800033f8 <cpuid>:
    800033f8:	ff010113          	addi	sp,sp,-16
    800033fc:	00813423          	sd	s0,8(sp)
    80003400:	01010413          	addi	s0,sp,16
    80003404:	00020513          	mv	a0,tp
    80003408:	00813403          	ld	s0,8(sp)
    8000340c:	0005051b          	sext.w	a0,a0
    80003410:	01010113          	addi	sp,sp,16
    80003414:	00008067          	ret

0000000080003418 <mycpu>:
    80003418:	ff010113          	addi	sp,sp,-16
    8000341c:	00813423          	sd	s0,8(sp)
    80003420:	01010413          	addi	s0,sp,16
    80003424:	00020793          	mv	a5,tp
    80003428:	00813403          	ld	s0,8(sp)
    8000342c:	0007879b          	sext.w	a5,a5
    80003430:	00779793          	slli	a5,a5,0x7
    80003434:	00005517          	auipc	a0,0x5
    80003438:	07c50513          	addi	a0,a0,124 # 800084b0 <cpus>
    8000343c:	00f50533          	add	a0,a0,a5
    80003440:	01010113          	addi	sp,sp,16
    80003444:	00008067          	ret

0000000080003448 <userinit>:
    80003448:	ff010113          	addi	sp,sp,-16
    8000344c:	00813423          	sd	s0,8(sp)
    80003450:	01010413          	addi	s0,sp,16
    80003454:	00813403          	ld	s0,8(sp)
    80003458:	01010113          	addi	sp,sp,16
    8000345c:	ffffe317          	auipc	t1,0xffffe
    80003460:	33830067          	jr	824(t1) # 80001794 <main>

0000000080003464 <either_copyout>:
    80003464:	ff010113          	addi	sp,sp,-16
    80003468:	00813023          	sd	s0,0(sp)
    8000346c:	00113423          	sd	ra,8(sp)
    80003470:	01010413          	addi	s0,sp,16
    80003474:	02051663          	bnez	a0,800034a0 <either_copyout+0x3c>
    80003478:	00058513          	mv	a0,a1
    8000347c:	00060593          	mv	a1,a2
    80003480:	0006861b          	sext.w	a2,a3
    80003484:	00002097          	auipc	ra,0x2
    80003488:	c60080e7          	jalr	-928(ra) # 800050e4 <__memmove>
    8000348c:	00813083          	ld	ra,8(sp)
    80003490:	00013403          	ld	s0,0(sp)
    80003494:	00000513          	li	a0,0
    80003498:	01010113          	addi	sp,sp,16
    8000349c:	00008067          	ret
    800034a0:	00003517          	auipc	a0,0x3
    800034a4:	e6050513          	addi	a0,a0,-416 # 80006300 <CONSOLE_STATUS+0x2f0>
    800034a8:	00001097          	auipc	ra,0x1
    800034ac:	934080e7          	jalr	-1740(ra) # 80003ddc <panic>

00000000800034b0 <either_copyin>:
    800034b0:	ff010113          	addi	sp,sp,-16
    800034b4:	00813023          	sd	s0,0(sp)
    800034b8:	00113423          	sd	ra,8(sp)
    800034bc:	01010413          	addi	s0,sp,16
    800034c0:	02059463          	bnez	a1,800034e8 <either_copyin+0x38>
    800034c4:	00060593          	mv	a1,a2
    800034c8:	0006861b          	sext.w	a2,a3
    800034cc:	00002097          	auipc	ra,0x2
    800034d0:	c18080e7          	jalr	-1000(ra) # 800050e4 <__memmove>
    800034d4:	00813083          	ld	ra,8(sp)
    800034d8:	00013403          	ld	s0,0(sp)
    800034dc:	00000513          	li	a0,0
    800034e0:	01010113          	addi	sp,sp,16
    800034e4:	00008067          	ret
    800034e8:	00003517          	auipc	a0,0x3
    800034ec:	e4050513          	addi	a0,a0,-448 # 80006328 <CONSOLE_STATUS+0x318>
    800034f0:	00001097          	auipc	ra,0x1
    800034f4:	8ec080e7          	jalr	-1812(ra) # 80003ddc <panic>

00000000800034f8 <trapinit>:
    800034f8:	ff010113          	addi	sp,sp,-16
    800034fc:	00813423          	sd	s0,8(sp)
    80003500:	01010413          	addi	s0,sp,16
    80003504:	00813403          	ld	s0,8(sp)
    80003508:	00003597          	auipc	a1,0x3
    8000350c:	e4858593          	addi	a1,a1,-440 # 80006350 <CONSOLE_STATUS+0x340>
    80003510:	00005517          	auipc	a0,0x5
    80003514:	02050513          	addi	a0,a0,32 # 80008530 <tickslock>
    80003518:	01010113          	addi	sp,sp,16
    8000351c:	00001317          	auipc	t1,0x1
    80003520:	5cc30067          	jr	1484(t1) # 80004ae8 <initlock>

0000000080003524 <trapinithart>:
    80003524:	ff010113          	addi	sp,sp,-16
    80003528:	00813423          	sd	s0,8(sp)
    8000352c:	01010413          	addi	s0,sp,16
    80003530:	00000797          	auipc	a5,0x0
    80003534:	30078793          	addi	a5,a5,768 # 80003830 <kernelvec>
    80003538:	10579073          	csrw	stvec,a5
    8000353c:	00813403          	ld	s0,8(sp)
    80003540:	01010113          	addi	sp,sp,16
    80003544:	00008067          	ret

0000000080003548 <usertrap>:
    80003548:	ff010113          	addi	sp,sp,-16
    8000354c:	00813423          	sd	s0,8(sp)
    80003550:	01010413          	addi	s0,sp,16
    80003554:	00813403          	ld	s0,8(sp)
    80003558:	01010113          	addi	sp,sp,16
    8000355c:	00008067          	ret

0000000080003560 <usertrapret>:
    80003560:	ff010113          	addi	sp,sp,-16
    80003564:	00813423          	sd	s0,8(sp)
    80003568:	01010413          	addi	s0,sp,16
    8000356c:	00813403          	ld	s0,8(sp)
    80003570:	01010113          	addi	sp,sp,16
    80003574:	00008067          	ret

0000000080003578 <kerneltrap>:
    80003578:	fe010113          	addi	sp,sp,-32
    8000357c:	00813823          	sd	s0,16(sp)
    80003580:	00113c23          	sd	ra,24(sp)
    80003584:	00913423          	sd	s1,8(sp)
    80003588:	02010413          	addi	s0,sp,32
    8000358c:	142025f3          	csrr	a1,scause
    80003590:	100027f3          	csrr	a5,sstatus
    80003594:	0027f793          	andi	a5,a5,2
    80003598:	10079c63          	bnez	a5,800036b0 <kerneltrap+0x138>
    8000359c:	142027f3          	csrr	a5,scause
    800035a0:	0207ce63          	bltz	a5,800035dc <kerneltrap+0x64>
    800035a4:	00003517          	auipc	a0,0x3
    800035a8:	df450513          	addi	a0,a0,-524 # 80006398 <CONSOLE_STATUS+0x388>
    800035ac:	00001097          	auipc	ra,0x1
    800035b0:	88c080e7          	jalr	-1908(ra) # 80003e38 <__printf>
    800035b4:	141025f3          	csrr	a1,sepc
    800035b8:	14302673          	csrr	a2,stval
    800035bc:	00003517          	auipc	a0,0x3
    800035c0:	dec50513          	addi	a0,a0,-532 # 800063a8 <CONSOLE_STATUS+0x398>
    800035c4:	00001097          	auipc	ra,0x1
    800035c8:	874080e7          	jalr	-1932(ra) # 80003e38 <__printf>
    800035cc:	00003517          	auipc	a0,0x3
    800035d0:	df450513          	addi	a0,a0,-524 # 800063c0 <CONSOLE_STATUS+0x3b0>
    800035d4:	00001097          	auipc	ra,0x1
    800035d8:	808080e7          	jalr	-2040(ra) # 80003ddc <panic>
    800035dc:	0ff7f713          	andi	a4,a5,255
    800035e0:	00900693          	li	a3,9
    800035e4:	04d70063          	beq	a4,a3,80003624 <kerneltrap+0xac>
    800035e8:	fff00713          	li	a4,-1
    800035ec:	03f71713          	slli	a4,a4,0x3f
    800035f0:	00170713          	addi	a4,a4,1
    800035f4:	fae798e3          	bne	a5,a4,800035a4 <kerneltrap+0x2c>
    800035f8:	00000097          	auipc	ra,0x0
    800035fc:	e00080e7          	jalr	-512(ra) # 800033f8 <cpuid>
    80003600:	06050663          	beqz	a0,8000366c <kerneltrap+0xf4>
    80003604:	144027f3          	csrr	a5,sip
    80003608:	ffd7f793          	andi	a5,a5,-3
    8000360c:	14479073          	csrw	sip,a5
    80003610:	01813083          	ld	ra,24(sp)
    80003614:	01013403          	ld	s0,16(sp)
    80003618:	00813483          	ld	s1,8(sp)
    8000361c:	02010113          	addi	sp,sp,32
    80003620:	00008067          	ret
    80003624:	00000097          	auipc	ra,0x0
    80003628:	3d0080e7          	jalr	976(ra) # 800039f4 <plic_claim>
    8000362c:	00a00793          	li	a5,10
    80003630:	00050493          	mv	s1,a0
    80003634:	06f50863          	beq	a0,a5,800036a4 <kerneltrap+0x12c>
    80003638:	fc050ce3          	beqz	a0,80003610 <kerneltrap+0x98>
    8000363c:	00050593          	mv	a1,a0
    80003640:	00003517          	auipc	a0,0x3
    80003644:	d3850513          	addi	a0,a0,-712 # 80006378 <CONSOLE_STATUS+0x368>
    80003648:	00000097          	auipc	ra,0x0
    8000364c:	7f0080e7          	jalr	2032(ra) # 80003e38 <__printf>
    80003650:	01013403          	ld	s0,16(sp)
    80003654:	01813083          	ld	ra,24(sp)
    80003658:	00048513          	mv	a0,s1
    8000365c:	00813483          	ld	s1,8(sp)
    80003660:	02010113          	addi	sp,sp,32
    80003664:	00000317          	auipc	t1,0x0
    80003668:	3c830067          	jr	968(t1) # 80003a2c <plic_complete>
    8000366c:	00005517          	auipc	a0,0x5
    80003670:	ec450513          	addi	a0,a0,-316 # 80008530 <tickslock>
    80003674:	00001097          	auipc	ra,0x1
    80003678:	498080e7          	jalr	1176(ra) # 80004b0c <acquire>
    8000367c:	00004717          	auipc	a4,0x4
    80003680:	d8870713          	addi	a4,a4,-632 # 80007404 <ticks>
    80003684:	00072783          	lw	a5,0(a4)
    80003688:	00005517          	auipc	a0,0x5
    8000368c:	ea850513          	addi	a0,a0,-344 # 80008530 <tickslock>
    80003690:	0017879b          	addiw	a5,a5,1
    80003694:	00f72023          	sw	a5,0(a4)
    80003698:	00001097          	auipc	ra,0x1
    8000369c:	540080e7          	jalr	1344(ra) # 80004bd8 <release>
    800036a0:	f65ff06f          	j	80003604 <kerneltrap+0x8c>
    800036a4:	00001097          	auipc	ra,0x1
    800036a8:	09c080e7          	jalr	156(ra) # 80004740 <uartintr>
    800036ac:	fa5ff06f          	j	80003650 <kerneltrap+0xd8>
    800036b0:	00003517          	auipc	a0,0x3
    800036b4:	ca850513          	addi	a0,a0,-856 # 80006358 <CONSOLE_STATUS+0x348>
    800036b8:	00000097          	auipc	ra,0x0
    800036bc:	724080e7          	jalr	1828(ra) # 80003ddc <panic>

00000000800036c0 <clockintr>:
    800036c0:	fe010113          	addi	sp,sp,-32
    800036c4:	00813823          	sd	s0,16(sp)
    800036c8:	00913423          	sd	s1,8(sp)
    800036cc:	00113c23          	sd	ra,24(sp)
    800036d0:	02010413          	addi	s0,sp,32
    800036d4:	00005497          	auipc	s1,0x5
    800036d8:	e5c48493          	addi	s1,s1,-420 # 80008530 <tickslock>
    800036dc:	00048513          	mv	a0,s1
    800036e0:	00001097          	auipc	ra,0x1
    800036e4:	42c080e7          	jalr	1068(ra) # 80004b0c <acquire>
    800036e8:	00004717          	auipc	a4,0x4
    800036ec:	d1c70713          	addi	a4,a4,-740 # 80007404 <ticks>
    800036f0:	00072783          	lw	a5,0(a4)
    800036f4:	01013403          	ld	s0,16(sp)
    800036f8:	01813083          	ld	ra,24(sp)
    800036fc:	00048513          	mv	a0,s1
    80003700:	0017879b          	addiw	a5,a5,1
    80003704:	00813483          	ld	s1,8(sp)
    80003708:	00f72023          	sw	a5,0(a4)
    8000370c:	02010113          	addi	sp,sp,32
    80003710:	00001317          	auipc	t1,0x1
    80003714:	4c830067          	jr	1224(t1) # 80004bd8 <release>

0000000080003718 <devintr>:
    80003718:	142027f3          	csrr	a5,scause
    8000371c:	00000513          	li	a0,0
    80003720:	0007c463          	bltz	a5,80003728 <devintr+0x10>
    80003724:	00008067          	ret
    80003728:	fe010113          	addi	sp,sp,-32
    8000372c:	00813823          	sd	s0,16(sp)
    80003730:	00113c23          	sd	ra,24(sp)
    80003734:	00913423          	sd	s1,8(sp)
    80003738:	02010413          	addi	s0,sp,32
    8000373c:	0ff7f713          	andi	a4,a5,255
    80003740:	00900693          	li	a3,9
    80003744:	04d70c63          	beq	a4,a3,8000379c <devintr+0x84>
    80003748:	fff00713          	li	a4,-1
    8000374c:	03f71713          	slli	a4,a4,0x3f
    80003750:	00170713          	addi	a4,a4,1
    80003754:	00e78c63          	beq	a5,a4,8000376c <devintr+0x54>
    80003758:	01813083          	ld	ra,24(sp)
    8000375c:	01013403          	ld	s0,16(sp)
    80003760:	00813483          	ld	s1,8(sp)
    80003764:	02010113          	addi	sp,sp,32
    80003768:	00008067          	ret
    8000376c:	00000097          	auipc	ra,0x0
    80003770:	c8c080e7          	jalr	-884(ra) # 800033f8 <cpuid>
    80003774:	06050663          	beqz	a0,800037e0 <devintr+0xc8>
    80003778:	144027f3          	csrr	a5,sip
    8000377c:	ffd7f793          	andi	a5,a5,-3
    80003780:	14479073          	csrw	sip,a5
    80003784:	01813083          	ld	ra,24(sp)
    80003788:	01013403          	ld	s0,16(sp)
    8000378c:	00813483          	ld	s1,8(sp)
    80003790:	00200513          	li	a0,2
    80003794:	02010113          	addi	sp,sp,32
    80003798:	00008067          	ret
    8000379c:	00000097          	auipc	ra,0x0
    800037a0:	258080e7          	jalr	600(ra) # 800039f4 <plic_claim>
    800037a4:	00a00793          	li	a5,10
    800037a8:	00050493          	mv	s1,a0
    800037ac:	06f50663          	beq	a0,a5,80003818 <devintr+0x100>
    800037b0:	00100513          	li	a0,1
    800037b4:	fa0482e3          	beqz	s1,80003758 <devintr+0x40>
    800037b8:	00048593          	mv	a1,s1
    800037bc:	00003517          	auipc	a0,0x3
    800037c0:	bbc50513          	addi	a0,a0,-1092 # 80006378 <CONSOLE_STATUS+0x368>
    800037c4:	00000097          	auipc	ra,0x0
    800037c8:	674080e7          	jalr	1652(ra) # 80003e38 <__printf>
    800037cc:	00048513          	mv	a0,s1
    800037d0:	00000097          	auipc	ra,0x0
    800037d4:	25c080e7          	jalr	604(ra) # 80003a2c <plic_complete>
    800037d8:	00100513          	li	a0,1
    800037dc:	f7dff06f          	j	80003758 <devintr+0x40>
    800037e0:	00005517          	auipc	a0,0x5
    800037e4:	d5050513          	addi	a0,a0,-688 # 80008530 <tickslock>
    800037e8:	00001097          	auipc	ra,0x1
    800037ec:	324080e7          	jalr	804(ra) # 80004b0c <acquire>
    800037f0:	00004717          	auipc	a4,0x4
    800037f4:	c1470713          	addi	a4,a4,-1004 # 80007404 <ticks>
    800037f8:	00072783          	lw	a5,0(a4)
    800037fc:	00005517          	auipc	a0,0x5
    80003800:	d3450513          	addi	a0,a0,-716 # 80008530 <tickslock>
    80003804:	0017879b          	addiw	a5,a5,1
    80003808:	00f72023          	sw	a5,0(a4)
    8000380c:	00001097          	auipc	ra,0x1
    80003810:	3cc080e7          	jalr	972(ra) # 80004bd8 <release>
    80003814:	f65ff06f          	j	80003778 <devintr+0x60>
    80003818:	00001097          	auipc	ra,0x1
    8000381c:	f28080e7          	jalr	-216(ra) # 80004740 <uartintr>
    80003820:	fadff06f          	j	800037cc <devintr+0xb4>
	...

0000000080003830 <kernelvec>:
    80003830:	f0010113          	addi	sp,sp,-256
    80003834:	00113023          	sd	ra,0(sp)
    80003838:	00213423          	sd	sp,8(sp)
    8000383c:	00313823          	sd	gp,16(sp)
    80003840:	00413c23          	sd	tp,24(sp)
    80003844:	02513023          	sd	t0,32(sp)
    80003848:	02613423          	sd	t1,40(sp)
    8000384c:	02713823          	sd	t2,48(sp)
    80003850:	02813c23          	sd	s0,56(sp)
    80003854:	04913023          	sd	s1,64(sp)
    80003858:	04a13423          	sd	a0,72(sp)
    8000385c:	04b13823          	sd	a1,80(sp)
    80003860:	04c13c23          	sd	a2,88(sp)
    80003864:	06d13023          	sd	a3,96(sp)
    80003868:	06e13423          	sd	a4,104(sp)
    8000386c:	06f13823          	sd	a5,112(sp)
    80003870:	07013c23          	sd	a6,120(sp)
    80003874:	09113023          	sd	a7,128(sp)
    80003878:	09213423          	sd	s2,136(sp)
    8000387c:	09313823          	sd	s3,144(sp)
    80003880:	09413c23          	sd	s4,152(sp)
    80003884:	0b513023          	sd	s5,160(sp)
    80003888:	0b613423          	sd	s6,168(sp)
    8000388c:	0b713823          	sd	s7,176(sp)
    80003890:	0b813c23          	sd	s8,184(sp)
    80003894:	0d913023          	sd	s9,192(sp)
    80003898:	0da13423          	sd	s10,200(sp)
    8000389c:	0db13823          	sd	s11,208(sp)
    800038a0:	0dc13c23          	sd	t3,216(sp)
    800038a4:	0fd13023          	sd	t4,224(sp)
    800038a8:	0fe13423          	sd	t5,232(sp)
    800038ac:	0ff13823          	sd	t6,240(sp)
    800038b0:	cc9ff0ef          	jal	ra,80003578 <kerneltrap>
    800038b4:	00013083          	ld	ra,0(sp)
    800038b8:	00813103          	ld	sp,8(sp)
    800038bc:	01013183          	ld	gp,16(sp)
    800038c0:	02013283          	ld	t0,32(sp)
    800038c4:	02813303          	ld	t1,40(sp)
    800038c8:	03013383          	ld	t2,48(sp)
    800038cc:	03813403          	ld	s0,56(sp)
    800038d0:	04013483          	ld	s1,64(sp)
    800038d4:	04813503          	ld	a0,72(sp)
    800038d8:	05013583          	ld	a1,80(sp)
    800038dc:	05813603          	ld	a2,88(sp)
    800038e0:	06013683          	ld	a3,96(sp)
    800038e4:	06813703          	ld	a4,104(sp)
    800038e8:	07013783          	ld	a5,112(sp)
    800038ec:	07813803          	ld	a6,120(sp)
    800038f0:	08013883          	ld	a7,128(sp)
    800038f4:	08813903          	ld	s2,136(sp)
    800038f8:	09013983          	ld	s3,144(sp)
    800038fc:	09813a03          	ld	s4,152(sp)
    80003900:	0a013a83          	ld	s5,160(sp)
    80003904:	0a813b03          	ld	s6,168(sp)
    80003908:	0b013b83          	ld	s7,176(sp)
    8000390c:	0b813c03          	ld	s8,184(sp)
    80003910:	0c013c83          	ld	s9,192(sp)
    80003914:	0c813d03          	ld	s10,200(sp)
    80003918:	0d013d83          	ld	s11,208(sp)
    8000391c:	0d813e03          	ld	t3,216(sp)
    80003920:	0e013e83          	ld	t4,224(sp)
    80003924:	0e813f03          	ld	t5,232(sp)
    80003928:	0f013f83          	ld	t6,240(sp)
    8000392c:	10010113          	addi	sp,sp,256
    80003930:	10200073          	sret
    80003934:	00000013          	nop
    80003938:	00000013          	nop
    8000393c:	00000013          	nop

0000000080003940 <timervec>:
    80003940:	34051573          	csrrw	a0,mscratch,a0
    80003944:	00b53023          	sd	a1,0(a0)
    80003948:	00c53423          	sd	a2,8(a0)
    8000394c:	00d53823          	sd	a3,16(a0)
    80003950:	01853583          	ld	a1,24(a0)
    80003954:	02053603          	ld	a2,32(a0)
    80003958:	0005b683          	ld	a3,0(a1)
    8000395c:	00c686b3          	add	a3,a3,a2
    80003960:	00d5b023          	sd	a3,0(a1)
    80003964:	00200593          	li	a1,2
    80003968:	14459073          	csrw	sip,a1
    8000396c:	01053683          	ld	a3,16(a0)
    80003970:	00853603          	ld	a2,8(a0)
    80003974:	00053583          	ld	a1,0(a0)
    80003978:	34051573          	csrrw	a0,mscratch,a0
    8000397c:	30200073          	mret

0000000080003980 <plicinit>:
    80003980:	ff010113          	addi	sp,sp,-16
    80003984:	00813423          	sd	s0,8(sp)
    80003988:	01010413          	addi	s0,sp,16
    8000398c:	00813403          	ld	s0,8(sp)
    80003990:	0c0007b7          	lui	a5,0xc000
    80003994:	00100713          	li	a4,1
    80003998:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000399c:	00e7a223          	sw	a4,4(a5)
    800039a0:	01010113          	addi	sp,sp,16
    800039a4:	00008067          	ret

00000000800039a8 <plicinithart>:
    800039a8:	ff010113          	addi	sp,sp,-16
    800039ac:	00813023          	sd	s0,0(sp)
    800039b0:	00113423          	sd	ra,8(sp)
    800039b4:	01010413          	addi	s0,sp,16
    800039b8:	00000097          	auipc	ra,0x0
    800039bc:	a40080e7          	jalr	-1472(ra) # 800033f8 <cpuid>
    800039c0:	0085171b          	slliw	a4,a0,0x8
    800039c4:	0c0027b7          	lui	a5,0xc002
    800039c8:	00e787b3          	add	a5,a5,a4
    800039cc:	40200713          	li	a4,1026
    800039d0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800039d4:	00813083          	ld	ra,8(sp)
    800039d8:	00013403          	ld	s0,0(sp)
    800039dc:	00d5151b          	slliw	a0,a0,0xd
    800039e0:	0c2017b7          	lui	a5,0xc201
    800039e4:	00a78533          	add	a0,a5,a0
    800039e8:	00052023          	sw	zero,0(a0)
    800039ec:	01010113          	addi	sp,sp,16
    800039f0:	00008067          	ret

00000000800039f4 <plic_claim>:
    800039f4:	ff010113          	addi	sp,sp,-16
    800039f8:	00813023          	sd	s0,0(sp)
    800039fc:	00113423          	sd	ra,8(sp)
    80003a00:	01010413          	addi	s0,sp,16
    80003a04:	00000097          	auipc	ra,0x0
    80003a08:	9f4080e7          	jalr	-1548(ra) # 800033f8 <cpuid>
    80003a0c:	00813083          	ld	ra,8(sp)
    80003a10:	00013403          	ld	s0,0(sp)
    80003a14:	00d5151b          	slliw	a0,a0,0xd
    80003a18:	0c2017b7          	lui	a5,0xc201
    80003a1c:	00a78533          	add	a0,a5,a0
    80003a20:	00452503          	lw	a0,4(a0)
    80003a24:	01010113          	addi	sp,sp,16
    80003a28:	00008067          	ret

0000000080003a2c <plic_complete>:
    80003a2c:	fe010113          	addi	sp,sp,-32
    80003a30:	00813823          	sd	s0,16(sp)
    80003a34:	00913423          	sd	s1,8(sp)
    80003a38:	00113c23          	sd	ra,24(sp)
    80003a3c:	02010413          	addi	s0,sp,32
    80003a40:	00050493          	mv	s1,a0
    80003a44:	00000097          	auipc	ra,0x0
    80003a48:	9b4080e7          	jalr	-1612(ra) # 800033f8 <cpuid>
    80003a4c:	01813083          	ld	ra,24(sp)
    80003a50:	01013403          	ld	s0,16(sp)
    80003a54:	00d5179b          	slliw	a5,a0,0xd
    80003a58:	0c201737          	lui	a4,0xc201
    80003a5c:	00f707b3          	add	a5,a4,a5
    80003a60:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80003a64:	00813483          	ld	s1,8(sp)
    80003a68:	02010113          	addi	sp,sp,32
    80003a6c:	00008067          	ret

0000000080003a70 <consolewrite>:
    80003a70:	fb010113          	addi	sp,sp,-80
    80003a74:	04813023          	sd	s0,64(sp)
    80003a78:	04113423          	sd	ra,72(sp)
    80003a7c:	02913c23          	sd	s1,56(sp)
    80003a80:	03213823          	sd	s2,48(sp)
    80003a84:	03313423          	sd	s3,40(sp)
    80003a88:	03413023          	sd	s4,32(sp)
    80003a8c:	01513c23          	sd	s5,24(sp)
    80003a90:	05010413          	addi	s0,sp,80
    80003a94:	06c05c63          	blez	a2,80003b0c <consolewrite+0x9c>
    80003a98:	00060993          	mv	s3,a2
    80003a9c:	00050a13          	mv	s4,a0
    80003aa0:	00058493          	mv	s1,a1
    80003aa4:	00000913          	li	s2,0
    80003aa8:	fff00a93          	li	s5,-1
    80003aac:	01c0006f          	j	80003ac8 <consolewrite+0x58>
    80003ab0:	fbf44503          	lbu	a0,-65(s0)
    80003ab4:	0019091b          	addiw	s2,s2,1
    80003ab8:	00148493          	addi	s1,s1,1
    80003abc:	00001097          	auipc	ra,0x1
    80003ac0:	a9c080e7          	jalr	-1380(ra) # 80004558 <uartputc>
    80003ac4:	03298063          	beq	s3,s2,80003ae4 <consolewrite+0x74>
    80003ac8:	00048613          	mv	a2,s1
    80003acc:	00100693          	li	a3,1
    80003ad0:	000a0593          	mv	a1,s4
    80003ad4:	fbf40513          	addi	a0,s0,-65
    80003ad8:	00000097          	auipc	ra,0x0
    80003adc:	9d8080e7          	jalr	-1576(ra) # 800034b0 <either_copyin>
    80003ae0:	fd5518e3          	bne	a0,s5,80003ab0 <consolewrite+0x40>
    80003ae4:	04813083          	ld	ra,72(sp)
    80003ae8:	04013403          	ld	s0,64(sp)
    80003aec:	03813483          	ld	s1,56(sp)
    80003af0:	02813983          	ld	s3,40(sp)
    80003af4:	02013a03          	ld	s4,32(sp)
    80003af8:	01813a83          	ld	s5,24(sp)
    80003afc:	00090513          	mv	a0,s2
    80003b00:	03013903          	ld	s2,48(sp)
    80003b04:	05010113          	addi	sp,sp,80
    80003b08:	00008067          	ret
    80003b0c:	00000913          	li	s2,0
    80003b10:	fd5ff06f          	j	80003ae4 <consolewrite+0x74>

0000000080003b14 <consoleread>:
    80003b14:	f9010113          	addi	sp,sp,-112
    80003b18:	06813023          	sd	s0,96(sp)
    80003b1c:	04913c23          	sd	s1,88(sp)
    80003b20:	05213823          	sd	s2,80(sp)
    80003b24:	05313423          	sd	s3,72(sp)
    80003b28:	05413023          	sd	s4,64(sp)
    80003b2c:	03513c23          	sd	s5,56(sp)
    80003b30:	03613823          	sd	s6,48(sp)
    80003b34:	03713423          	sd	s7,40(sp)
    80003b38:	03813023          	sd	s8,32(sp)
    80003b3c:	06113423          	sd	ra,104(sp)
    80003b40:	01913c23          	sd	s9,24(sp)
    80003b44:	07010413          	addi	s0,sp,112
    80003b48:	00060b93          	mv	s7,a2
    80003b4c:	00050913          	mv	s2,a0
    80003b50:	00058c13          	mv	s8,a1
    80003b54:	00060b1b          	sext.w	s6,a2
    80003b58:	00005497          	auipc	s1,0x5
    80003b5c:	a0048493          	addi	s1,s1,-1536 # 80008558 <cons>
    80003b60:	00400993          	li	s3,4
    80003b64:	fff00a13          	li	s4,-1
    80003b68:	00a00a93          	li	s5,10
    80003b6c:	05705e63          	blez	s7,80003bc8 <consoleread+0xb4>
    80003b70:	09c4a703          	lw	a4,156(s1)
    80003b74:	0984a783          	lw	a5,152(s1)
    80003b78:	0007071b          	sext.w	a4,a4
    80003b7c:	08e78463          	beq	a5,a4,80003c04 <consoleread+0xf0>
    80003b80:	07f7f713          	andi	a4,a5,127
    80003b84:	00e48733          	add	a4,s1,a4
    80003b88:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80003b8c:	0017869b          	addiw	a3,a5,1
    80003b90:	08d4ac23          	sw	a3,152(s1)
    80003b94:	00070c9b          	sext.w	s9,a4
    80003b98:	0b370663          	beq	a4,s3,80003c44 <consoleread+0x130>
    80003b9c:	00100693          	li	a3,1
    80003ba0:	f9f40613          	addi	a2,s0,-97
    80003ba4:	000c0593          	mv	a1,s8
    80003ba8:	00090513          	mv	a0,s2
    80003bac:	f8e40fa3          	sb	a4,-97(s0)
    80003bb0:	00000097          	auipc	ra,0x0
    80003bb4:	8b4080e7          	jalr	-1868(ra) # 80003464 <either_copyout>
    80003bb8:	01450863          	beq	a0,s4,80003bc8 <consoleread+0xb4>
    80003bbc:	001c0c13          	addi	s8,s8,1
    80003bc0:	fffb8b9b          	addiw	s7,s7,-1
    80003bc4:	fb5c94e3          	bne	s9,s5,80003b6c <consoleread+0x58>
    80003bc8:	000b851b          	sext.w	a0,s7
    80003bcc:	06813083          	ld	ra,104(sp)
    80003bd0:	06013403          	ld	s0,96(sp)
    80003bd4:	05813483          	ld	s1,88(sp)
    80003bd8:	05013903          	ld	s2,80(sp)
    80003bdc:	04813983          	ld	s3,72(sp)
    80003be0:	04013a03          	ld	s4,64(sp)
    80003be4:	03813a83          	ld	s5,56(sp)
    80003be8:	02813b83          	ld	s7,40(sp)
    80003bec:	02013c03          	ld	s8,32(sp)
    80003bf0:	01813c83          	ld	s9,24(sp)
    80003bf4:	40ab053b          	subw	a0,s6,a0
    80003bf8:	03013b03          	ld	s6,48(sp)
    80003bfc:	07010113          	addi	sp,sp,112
    80003c00:	00008067          	ret
    80003c04:	00001097          	auipc	ra,0x1
    80003c08:	1d8080e7          	jalr	472(ra) # 80004ddc <push_on>
    80003c0c:	0984a703          	lw	a4,152(s1)
    80003c10:	09c4a783          	lw	a5,156(s1)
    80003c14:	0007879b          	sext.w	a5,a5
    80003c18:	fef70ce3          	beq	a4,a5,80003c10 <consoleread+0xfc>
    80003c1c:	00001097          	auipc	ra,0x1
    80003c20:	234080e7          	jalr	564(ra) # 80004e50 <pop_on>
    80003c24:	0984a783          	lw	a5,152(s1)
    80003c28:	07f7f713          	andi	a4,a5,127
    80003c2c:	00e48733          	add	a4,s1,a4
    80003c30:	01874703          	lbu	a4,24(a4)
    80003c34:	0017869b          	addiw	a3,a5,1
    80003c38:	08d4ac23          	sw	a3,152(s1)
    80003c3c:	00070c9b          	sext.w	s9,a4
    80003c40:	f5371ee3          	bne	a4,s3,80003b9c <consoleread+0x88>
    80003c44:	000b851b          	sext.w	a0,s7
    80003c48:	f96bf2e3          	bgeu	s7,s6,80003bcc <consoleread+0xb8>
    80003c4c:	08f4ac23          	sw	a5,152(s1)
    80003c50:	f7dff06f          	j	80003bcc <consoleread+0xb8>

0000000080003c54 <consputc>:
    80003c54:	10000793          	li	a5,256
    80003c58:	00f50663          	beq	a0,a5,80003c64 <consputc+0x10>
    80003c5c:	00001317          	auipc	t1,0x1
    80003c60:	9f430067          	jr	-1548(t1) # 80004650 <uartputc_sync>
    80003c64:	ff010113          	addi	sp,sp,-16
    80003c68:	00113423          	sd	ra,8(sp)
    80003c6c:	00813023          	sd	s0,0(sp)
    80003c70:	01010413          	addi	s0,sp,16
    80003c74:	00800513          	li	a0,8
    80003c78:	00001097          	auipc	ra,0x1
    80003c7c:	9d8080e7          	jalr	-1576(ra) # 80004650 <uartputc_sync>
    80003c80:	02000513          	li	a0,32
    80003c84:	00001097          	auipc	ra,0x1
    80003c88:	9cc080e7          	jalr	-1588(ra) # 80004650 <uartputc_sync>
    80003c8c:	00013403          	ld	s0,0(sp)
    80003c90:	00813083          	ld	ra,8(sp)
    80003c94:	00800513          	li	a0,8
    80003c98:	01010113          	addi	sp,sp,16
    80003c9c:	00001317          	auipc	t1,0x1
    80003ca0:	9b430067          	jr	-1612(t1) # 80004650 <uartputc_sync>

0000000080003ca4 <consoleintr>:
    80003ca4:	fe010113          	addi	sp,sp,-32
    80003ca8:	00813823          	sd	s0,16(sp)
    80003cac:	00913423          	sd	s1,8(sp)
    80003cb0:	01213023          	sd	s2,0(sp)
    80003cb4:	00113c23          	sd	ra,24(sp)
    80003cb8:	02010413          	addi	s0,sp,32
    80003cbc:	00005917          	auipc	s2,0x5
    80003cc0:	89c90913          	addi	s2,s2,-1892 # 80008558 <cons>
    80003cc4:	00050493          	mv	s1,a0
    80003cc8:	00090513          	mv	a0,s2
    80003ccc:	00001097          	auipc	ra,0x1
    80003cd0:	e40080e7          	jalr	-448(ra) # 80004b0c <acquire>
    80003cd4:	02048c63          	beqz	s1,80003d0c <consoleintr+0x68>
    80003cd8:	0a092783          	lw	a5,160(s2)
    80003cdc:	09892703          	lw	a4,152(s2)
    80003ce0:	07f00693          	li	a3,127
    80003ce4:	40e7873b          	subw	a4,a5,a4
    80003ce8:	02e6e263          	bltu	a3,a4,80003d0c <consoleintr+0x68>
    80003cec:	00d00713          	li	a4,13
    80003cf0:	04e48063          	beq	s1,a4,80003d30 <consoleintr+0x8c>
    80003cf4:	07f7f713          	andi	a4,a5,127
    80003cf8:	00e90733          	add	a4,s2,a4
    80003cfc:	0017879b          	addiw	a5,a5,1
    80003d00:	0af92023          	sw	a5,160(s2)
    80003d04:	00970c23          	sb	s1,24(a4)
    80003d08:	08f92e23          	sw	a5,156(s2)
    80003d0c:	01013403          	ld	s0,16(sp)
    80003d10:	01813083          	ld	ra,24(sp)
    80003d14:	00813483          	ld	s1,8(sp)
    80003d18:	00013903          	ld	s2,0(sp)
    80003d1c:	00005517          	auipc	a0,0x5
    80003d20:	83c50513          	addi	a0,a0,-1988 # 80008558 <cons>
    80003d24:	02010113          	addi	sp,sp,32
    80003d28:	00001317          	auipc	t1,0x1
    80003d2c:	eb030067          	jr	-336(t1) # 80004bd8 <release>
    80003d30:	00a00493          	li	s1,10
    80003d34:	fc1ff06f          	j	80003cf4 <consoleintr+0x50>

0000000080003d38 <consoleinit>:
    80003d38:	fe010113          	addi	sp,sp,-32
    80003d3c:	00113c23          	sd	ra,24(sp)
    80003d40:	00813823          	sd	s0,16(sp)
    80003d44:	00913423          	sd	s1,8(sp)
    80003d48:	02010413          	addi	s0,sp,32
    80003d4c:	00005497          	auipc	s1,0x5
    80003d50:	80c48493          	addi	s1,s1,-2036 # 80008558 <cons>
    80003d54:	00048513          	mv	a0,s1
    80003d58:	00002597          	auipc	a1,0x2
    80003d5c:	67858593          	addi	a1,a1,1656 # 800063d0 <CONSOLE_STATUS+0x3c0>
    80003d60:	00001097          	auipc	ra,0x1
    80003d64:	d88080e7          	jalr	-632(ra) # 80004ae8 <initlock>
    80003d68:	00000097          	auipc	ra,0x0
    80003d6c:	7ac080e7          	jalr	1964(ra) # 80004514 <uartinit>
    80003d70:	01813083          	ld	ra,24(sp)
    80003d74:	01013403          	ld	s0,16(sp)
    80003d78:	00000797          	auipc	a5,0x0
    80003d7c:	d9c78793          	addi	a5,a5,-612 # 80003b14 <consoleread>
    80003d80:	0af4bc23          	sd	a5,184(s1)
    80003d84:	00000797          	auipc	a5,0x0
    80003d88:	cec78793          	addi	a5,a5,-788 # 80003a70 <consolewrite>
    80003d8c:	0cf4b023          	sd	a5,192(s1)
    80003d90:	00813483          	ld	s1,8(sp)
    80003d94:	02010113          	addi	sp,sp,32
    80003d98:	00008067          	ret

0000000080003d9c <console_read>:
    80003d9c:	ff010113          	addi	sp,sp,-16
    80003da0:	00813423          	sd	s0,8(sp)
    80003da4:	01010413          	addi	s0,sp,16
    80003da8:	00813403          	ld	s0,8(sp)
    80003dac:	00005317          	auipc	t1,0x5
    80003db0:	86433303          	ld	t1,-1948(t1) # 80008610 <devsw+0x10>
    80003db4:	01010113          	addi	sp,sp,16
    80003db8:	00030067          	jr	t1

0000000080003dbc <console_write>:
    80003dbc:	ff010113          	addi	sp,sp,-16
    80003dc0:	00813423          	sd	s0,8(sp)
    80003dc4:	01010413          	addi	s0,sp,16
    80003dc8:	00813403          	ld	s0,8(sp)
    80003dcc:	00005317          	auipc	t1,0x5
    80003dd0:	84c33303          	ld	t1,-1972(t1) # 80008618 <devsw+0x18>
    80003dd4:	01010113          	addi	sp,sp,16
    80003dd8:	00030067          	jr	t1

0000000080003ddc <panic>:
    80003ddc:	fe010113          	addi	sp,sp,-32
    80003de0:	00113c23          	sd	ra,24(sp)
    80003de4:	00813823          	sd	s0,16(sp)
    80003de8:	00913423          	sd	s1,8(sp)
    80003dec:	02010413          	addi	s0,sp,32
    80003df0:	00050493          	mv	s1,a0
    80003df4:	00002517          	auipc	a0,0x2
    80003df8:	5e450513          	addi	a0,a0,1508 # 800063d8 <CONSOLE_STATUS+0x3c8>
    80003dfc:	00005797          	auipc	a5,0x5
    80003e00:	8a07ae23          	sw	zero,-1860(a5) # 800086b8 <pr+0x18>
    80003e04:	00000097          	auipc	ra,0x0
    80003e08:	034080e7          	jalr	52(ra) # 80003e38 <__printf>
    80003e0c:	00048513          	mv	a0,s1
    80003e10:	00000097          	auipc	ra,0x0
    80003e14:	028080e7          	jalr	40(ra) # 80003e38 <__printf>
    80003e18:	00002517          	auipc	a0,0x2
    80003e1c:	5a050513          	addi	a0,a0,1440 # 800063b8 <CONSOLE_STATUS+0x3a8>
    80003e20:	00000097          	auipc	ra,0x0
    80003e24:	018080e7          	jalr	24(ra) # 80003e38 <__printf>
    80003e28:	00100793          	li	a5,1
    80003e2c:	00003717          	auipc	a4,0x3
    80003e30:	5cf72e23          	sw	a5,1500(a4) # 80007408 <panicked>
    80003e34:	0000006f          	j	80003e34 <panic+0x58>

0000000080003e38 <__printf>:
    80003e38:	f3010113          	addi	sp,sp,-208
    80003e3c:	08813023          	sd	s0,128(sp)
    80003e40:	07313423          	sd	s3,104(sp)
    80003e44:	09010413          	addi	s0,sp,144
    80003e48:	05813023          	sd	s8,64(sp)
    80003e4c:	08113423          	sd	ra,136(sp)
    80003e50:	06913c23          	sd	s1,120(sp)
    80003e54:	07213823          	sd	s2,112(sp)
    80003e58:	07413023          	sd	s4,96(sp)
    80003e5c:	05513c23          	sd	s5,88(sp)
    80003e60:	05613823          	sd	s6,80(sp)
    80003e64:	05713423          	sd	s7,72(sp)
    80003e68:	03913c23          	sd	s9,56(sp)
    80003e6c:	03a13823          	sd	s10,48(sp)
    80003e70:	03b13423          	sd	s11,40(sp)
    80003e74:	00005317          	auipc	t1,0x5
    80003e78:	82c30313          	addi	t1,t1,-2004 # 800086a0 <pr>
    80003e7c:	01832c03          	lw	s8,24(t1)
    80003e80:	00b43423          	sd	a1,8(s0)
    80003e84:	00c43823          	sd	a2,16(s0)
    80003e88:	00d43c23          	sd	a3,24(s0)
    80003e8c:	02e43023          	sd	a4,32(s0)
    80003e90:	02f43423          	sd	a5,40(s0)
    80003e94:	03043823          	sd	a6,48(s0)
    80003e98:	03143c23          	sd	a7,56(s0)
    80003e9c:	00050993          	mv	s3,a0
    80003ea0:	4a0c1663          	bnez	s8,8000434c <__printf+0x514>
    80003ea4:	60098c63          	beqz	s3,800044bc <__printf+0x684>
    80003ea8:	0009c503          	lbu	a0,0(s3)
    80003eac:	00840793          	addi	a5,s0,8
    80003eb0:	f6f43c23          	sd	a5,-136(s0)
    80003eb4:	00000493          	li	s1,0
    80003eb8:	22050063          	beqz	a0,800040d8 <__printf+0x2a0>
    80003ebc:	00002a37          	lui	s4,0x2
    80003ec0:	00018ab7          	lui	s5,0x18
    80003ec4:	000f4b37          	lui	s6,0xf4
    80003ec8:	00989bb7          	lui	s7,0x989
    80003ecc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80003ed0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80003ed4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80003ed8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80003edc:	00148c9b          	addiw	s9,s1,1
    80003ee0:	02500793          	li	a5,37
    80003ee4:	01998933          	add	s2,s3,s9
    80003ee8:	38f51263          	bne	a0,a5,8000426c <__printf+0x434>
    80003eec:	00094783          	lbu	a5,0(s2)
    80003ef0:	00078c9b          	sext.w	s9,a5
    80003ef4:	1e078263          	beqz	a5,800040d8 <__printf+0x2a0>
    80003ef8:	0024849b          	addiw	s1,s1,2
    80003efc:	07000713          	li	a4,112
    80003f00:	00998933          	add	s2,s3,s1
    80003f04:	38e78a63          	beq	a5,a4,80004298 <__printf+0x460>
    80003f08:	20f76863          	bltu	a4,a5,80004118 <__printf+0x2e0>
    80003f0c:	42a78863          	beq	a5,a0,8000433c <__printf+0x504>
    80003f10:	06400713          	li	a4,100
    80003f14:	40e79663          	bne	a5,a4,80004320 <__printf+0x4e8>
    80003f18:	f7843783          	ld	a5,-136(s0)
    80003f1c:	0007a603          	lw	a2,0(a5)
    80003f20:	00878793          	addi	a5,a5,8
    80003f24:	f6f43c23          	sd	a5,-136(s0)
    80003f28:	42064a63          	bltz	a2,8000435c <__printf+0x524>
    80003f2c:	00a00713          	li	a4,10
    80003f30:	02e677bb          	remuw	a5,a2,a4
    80003f34:	00002d97          	auipc	s11,0x2
    80003f38:	4ccd8d93          	addi	s11,s11,1228 # 80006400 <digits>
    80003f3c:	00900593          	li	a1,9
    80003f40:	0006051b          	sext.w	a0,a2
    80003f44:	00000c93          	li	s9,0
    80003f48:	02079793          	slli	a5,a5,0x20
    80003f4c:	0207d793          	srli	a5,a5,0x20
    80003f50:	00fd87b3          	add	a5,s11,a5
    80003f54:	0007c783          	lbu	a5,0(a5)
    80003f58:	02e656bb          	divuw	a3,a2,a4
    80003f5c:	f8f40023          	sb	a5,-128(s0)
    80003f60:	14c5d863          	bge	a1,a2,800040b0 <__printf+0x278>
    80003f64:	06300593          	li	a1,99
    80003f68:	00100c93          	li	s9,1
    80003f6c:	02e6f7bb          	remuw	a5,a3,a4
    80003f70:	02079793          	slli	a5,a5,0x20
    80003f74:	0207d793          	srli	a5,a5,0x20
    80003f78:	00fd87b3          	add	a5,s11,a5
    80003f7c:	0007c783          	lbu	a5,0(a5)
    80003f80:	02e6d73b          	divuw	a4,a3,a4
    80003f84:	f8f400a3          	sb	a5,-127(s0)
    80003f88:	12a5f463          	bgeu	a1,a0,800040b0 <__printf+0x278>
    80003f8c:	00a00693          	li	a3,10
    80003f90:	00900593          	li	a1,9
    80003f94:	02d777bb          	remuw	a5,a4,a3
    80003f98:	02079793          	slli	a5,a5,0x20
    80003f9c:	0207d793          	srli	a5,a5,0x20
    80003fa0:	00fd87b3          	add	a5,s11,a5
    80003fa4:	0007c503          	lbu	a0,0(a5)
    80003fa8:	02d757bb          	divuw	a5,a4,a3
    80003fac:	f8a40123          	sb	a0,-126(s0)
    80003fb0:	48e5f263          	bgeu	a1,a4,80004434 <__printf+0x5fc>
    80003fb4:	06300513          	li	a0,99
    80003fb8:	02d7f5bb          	remuw	a1,a5,a3
    80003fbc:	02059593          	slli	a1,a1,0x20
    80003fc0:	0205d593          	srli	a1,a1,0x20
    80003fc4:	00bd85b3          	add	a1,s11,a1
    80003fc8:	0005c583          	lbu	a1,0(a1)
    80003fcc:	02d7d7bb          	divuw	a5,a5,a3
    80003fd0:	f8b401a3          	sb	a1,-125(s0)
    80003fd4:	48e57263          	bgeu	a0,a4,80004458 <__printf+0x620>
    80003fd8:	3e700513          	li	a0,999
    80003fdc:	02d7f5bb          	remuw	a1,a5,a3
    80003fe0:	02059593          	slli	a1,a1,0x20
    80003fe4:	0205d593          	srli	a1,a1,0x20
    80003fe8:	00bd85b3          	add	a1,s11,a1
    80003fec:	0005c583          	lbu	a1,0(a1)
    80003ff0:	02d7d7bb          	divuw	a5,a5,a3
    80003ff4:	f8b40223          	sb	a1,-124(s0)
    80003ff8:	46e57663          	bgeu	a0,a4,80004464 <__printf+0x62c>
    80003ffc:	02d7f5bb          	remuw	a1,a5,a3
    80004000:	02059593          	slli	a1,a1,0x20
    80004004:	0205d593          	srli	a1,a1,0x20
    80004008:	00bd85b3          	add	a1,s11,a1
    8000400c:	0005c583          	lbu	a1,0(a1)
    80004010:	02d7d7bb          	divuw	a5,a5,a3
    80004014:	f8b402a3          	sb	a1,-123(s0)
    80004018:	46ea7863          	bgeu	s4,a4,80004488 <__printf+0x650>
    8000401c:	02d7f5bb          	remuw	a1,a5,a3
    80004020:	02059593          	slli	a1,a1,0x20
    80004024:	0205d593          	srli	a1,a1,0x20
    80004028:	00bd85b3          	add	a1,s11,a1
    8000402c:	0005c583          	lbu	a1,0(a1)
    80004030:	02d7d7bb          	divuw	a5,a5,a3
    80004034:	f8b40323          	sb	a1,-122(s0)
    80004038:	3eeaf863          	bgeu	s5,a4,80004428 <__printf+0x5f0>
    8000403c:	02d7f5bb          	remuw	a1,a5,a3
    80004040:	02059593          	slli	a1,a1,0x20
    80004044:	0205d593          	srli	a1,a1,0x20
    80004048:	00bd85b3          	add	a1,s11,a1
    8000404c:	0005c583          	lbu	a1,0(a1)
    80004050:	02d7d7bb          	divuw	a5,a5,a3
    80004054:	f8b403a3          	sb	a1,-121(s0)
    80004058:	42eb7e63          	bgeu	s6,a4,80004494 <__printf+0x65c>
    8000405c:	02d7f5bb          	remuw	a1,a5,a3
    80004060:	02059593          	slli	a1,a1,0x20
    80004064:	0205d593          	srli	a1,a1,0x20
    80004068:	00bd85b3          	add	a1,s11,a1
    8000406c:	0005c583          	lbu	a1,0(a1)
    80004070:	02d7d7bb          	divuw	a5,a5,a3
    80004074:	f8b40423          	sb	a1,-120(s0)
    80004078:	42ebfc63          	bgeu	s7,a4,800044b0 <__printf+0x678>
    8000407c:	02079793          	slli	a5,a5,0x20
    80004080:	0207d793          	srli	a5,a5,0x20
    80004084:	00fd8db3          	add	s11,s11,a5
    80004088:	000dc703          	lbu	a4,0(s11)
    8000408c:	00a00793          	li	a5,10
    80004090:	00900c93          	li	s9,9
    80004094:	f8e404a3          	sb	a4,-119(s0)
    80004098:	00065c63          	bgez	a2,800040b0 <__printf+0x278>
    8000409c:	f9040713          	addi	a4,s0,-112
    800040a0:	00f70733          	add	a4,a4,a5
    800040a4:	02d00693          	li	a3,45
    800040a8:	fed70823          	sb	a3,-16(a4)
    800040ac:	00078c93          	mv	s9,a5
    800040b0:	f8040793          	addi	a5,s0,-128
    800040b4:	01978cb3          	add	s9,a5,s9
    800040b8:	f7f40d13          	addi	s10,s0,-129
    800040bc:	000cc503          	lbu	a0,0(s9)
    800040c0:	fffc8c93          	addi	s9,s9,-1
    800040c4:	00000097          	auipc	ra,0x0
    800040c8:	b90080e7          	jalr	-1136(ra) # 80003c54 <consputc>
    800040cc:	ffac98e3          	bne	s9,s10,800040bc <__printf+0x284>
    800040d0:	00094503          	lbu	a0,0(s2)
    800040d4:	e00514e3          	bnez	a0,80003edc <__printf+0xa4>
    800040d8:	1a0c1663          	bnez	s8,80004284 <__printf+0x44c>
    800040dc:	08813083          	ld	ra,136(sp)
    800040e0:	08013403          	ld	s0,128(sp)
    800040e4:	07813483          	ld	s1,120(sp)
    800040e8:	07013903          	ld	s2,112(sp)
    800040ec:	06813983          	ld	s3,104(sp)
    800040f0:	06013a03          	ld	s4,96(sp)
    800040f4:	05813a83          	ld	s5,88(sp)
    800040f8:	05013b03          	ld	s6,80(sp)
    800040fc:	04813b83          	ld	s7,72(sp)
    80004100:	04013c03          	ld	s8,64(sp)
    80004104:	03813c83          	ld	s9,56(sp)
    80004108:	03013d03          	ld	s10,48(sp)
    8000410c:	02813d83          	ld	s11,40(sp)
    80004110:	0d010113          	addi	sp,sp,208
    80004114:	00008067          	ret
    80004118:	07300713          	li	a4,115
    8000411c:	1ce78a63          	beq	a5,a4,800042f0 <__printf+0x4b8>
    80004120:	07800713          	li	a4,120
    80004124:	1ee79e63          	bne	a5,a4,80004320 <__printf+0x4e8>
    80004128:	f7843783          	ld	a5,-136(s0)
    8000412c:	0007a703          	lw	a4,0(a5)
    80004130:	00878793          	addi	a5,a5,8
    80004134:	f6f43c23          	sd	a5,-136(s0)
    80004138:	28074263          	bltz	a4,800043bc <__printf+0x584>
    8000413c:	00002d97          	auipc	s11,0x2
    80004140:	2c4d8d93          	addi	s11,s11,708 # 80006400 <digits>
    80004144:	00f77793          	andi	a5,a4,15
    80004148:	00fd87b3          	add	a5,s11,a5
    8000414c:	0007c683          	lbu	a3,0(a5)
    80004150:	00f00613          	li	a2,15
    80004154:	0007079b          	sext.w	a5,a4
    80004158:	f8d40023          	sb	a3,-128(s0)
    8000415c:	0047559b          	srliw	a1,a4,0x4
    80004160:	0047569b          	srliw	a3,a4,0x4
    80004164:	00000c93          	li	s9,0
    80004168:	0ee65063          	bge	a2,a4,80004248 <__printf+0x410>
    8000416c:	00f6f693          	andi	a3,a3,15
    80004170:	00dd86b3          	add	a3,s11,a3
    80004174:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80004178:	0087d79b          	srliw	a5,a5,0x8
    8000417c:	00100c93          	li	s9,1
    80004180:	f8d400a3          	sb	a3,-127(s0)
    80004184:	0cb67263          	bgeu	a2,a1,80004248 <__printf+0x410>
    80004188:	00f7f693          	andi	a3,a5,15
    8000418c:	00dd86b3          	add	a3,s11,a3
    80004190:	0006c583          	lbu	a1,0(a3)
    80004194:	00f00613          	li	a2,15
    80004198:	0047d69b          	srliw	a3,a5,0x4
    8000419c:	f8b40123          	sb	a1,-126(s0)
    800041a0:	0047d593          	srli	a1,a5,0x4
    800041a4:	28f67e63          	bgeu	a2,a5,80004440 <__printf+0x608>
    800041a8:	00f6f693          	andi	a3,a3,15
    800041ac:	00dd86b3          	add	a3,s11,a3
    800041b0:	0006c503          	lbu	a0,0(a3)
    800041b4:	0087d813          	srli	a6,a5,0x8
    800041b8:	0087d69b          	srliw	a3,a5,0x8
    800041bc:	f8a401a3          	sb	a0,-125(s0)
    800041c0:	28b67663          	bgeu	a2,a1,8000444c <__printf+0x614>
    800041c4:	00f6f693          	andi	a3,a3,15
    800041c8:	00dd86b3          	add	a3,s11,a3
    800041cc:	0006c583          	lbu	a1,0(a3)
    800041d0:	00c7d513          	srli	a0,a5,0xc
    800041d4:	00c7d69b          	srliw	a3,a5,0xc
    800041d8:	f8b40223          	sb	a1,-124(s0)
    800041dc:	29067a63          	bgeu	a2,a6,80004470 <__printf+0x638>
    800041e0:	00f6f693          	andi	a3,a3,15
    800041e4:	00dd86b3          	add	a3,s11,a3
    800041e8:	0006c583          	lbu	a1,0(a3)
    800041ec:	0107d813          	srli	a6,a5,0x10
    800041f0:	0107d69b          	srliw	a3,a5,0x10
    800041f4:	f8b402a3          	sb	a1,-123(s0)
    800041f8:	28a67263          	bgeu	a2,a0,8000447c <__printf+0x644>
    800041fc:	00f6f693          	andi	a3,a3,15
    80004200:	00dd86b3          	add	a3,s11,a3
    80004204:	0006c683          	lbu	a3,0(a3)
    80004208:	0147d79b          	srliw	a5,a5,0x14
    8000420c:	f8d40323          	sb	a3,-122(s0)
    80004210:	21067663          	bgeu	a2,a6,8000441c <__printf+0x5e4>
    80004214:	02079793          	slli	a5,a5,0x20
    80004218:	0207d793          	srli	a5,a5,0x20
    8000421c:	00fd8db3          	add	s11,s11,a5
    80004220:	000dc683          	lbu	a3,0(s11)
    80004224:	00800793          	li	a5,8
    80004228:	00700c93          	li	s9,7
    8000422c:	f8d403a3          	sb	a3,-121(s0)
    80004230:	00075c63          	bgez	a4,80004248 <__printf+0x410>
    80004234:	f9040713          	addi	a4,s0,-112
    80004238:	00f70733          	add	a4,a4,a5
    8000423c:	02d00693          	li	a3,45
    80004240:	fed70823          	sb	a3,-16(a4)
    80004244:	00078c93          	mv	s9,a5
    80004248:	f8040793          	addi	a5,s0,-128
    8000424c:	01978cb3          	add	s9,a5,s9
    80004250:	f7f40d13          	addi	s10,s0,-129
    80004254:	000cc503          	lbu	a0,0(s9)
    80004258:	fffc8c93          	addi	s9,s9,-1
    8000425c:	00000097          	auipc	ra,0x0
    80004260:	9f8080e7          	jalr	-1544(ra) # 80003c54 <consputc>
    80004264:	ff9d18e3          	bne	s10,s9,80004254 <__printf+0x41c>
    80004268:	0100006f          	j	80004278 <__printf+0x440>
    8000426c:	00000097          	auipc	ra,0x0
    80004270:	9e8080e7          	jalr	-1560(ra) # 80003c54 <consputc>
    80004274:	000c8493          	mv	s1,s9
    80004278:	00094503          	lbu	a0,0(s2)
    8000427c:	c60510e3          	bnez	a0,80003edc <__printf+0xa4>
    80004280:	e40c0ee3          	beqz	s8,800040dc <__printf+0x2a4>
    80004284:	00004517          	auipc	a0,0x4
    80004288:	41c50513          	addi	a0,a0,1052 # 800086a0 <pr>
    8000428c:	00001097          	auipc	ra,0x1
    80004290:	94c080e7          	jalr	-1716(ra) # 80004bd8 <release>
    80004294:	e49ff06f          	j	800040dc <__printf+0x2a4>
    80004298:	f7843783          	ld	a5,-136(s0)
    8000429c:	03000513          	li	a0,48
    800042a0:	01000d13          	li	s10,16
    800042a4:	00878713          	addi	a4,a5,8
    800042a8:	0007bc83          	ld	s9,0(a5)
    800042ac:	f6e43c23          	sd	a4,-136(s0)
    800042b0:	00000097          	auipc	ra,0x0
    800042b4:	9a4080e7          	jalr	-1628(ra) # 80003c54 <consputc>
    800042b8:	07800513          	li	a0,120
    800042bc:	00000097          	auipc	ra,0x0
    800042c0:	998080e7          	jalr	-1640(ra) # 80003c54 <consputc>
    800042c4:	00002d97          	auipc	s11,0x2
    800042c8:	13cd8d93          	addi	s11,s11,316 # 80006400 <digits>
    800042cc:	03ccd793          	srli	a5,s9,0x3c
    800042d0:	00fd87b3          	add	a5,s11,a5
    800042d4:	0007c503          	lbu	a0,0(a5)
    800042d8:	fffd0d1b          	addiw	s10,s10,-1
    800042dc:	004c9c93          	slli	s9,s9,0x4
    800042e0:	00000097          	auipc	ra,0x0
    800042e4:	974080e7          	jalr	-1676(ra) # 80003c54 <consputc>
    800042e8:	fe0d12e3          	bnez	s10,800042cc <__printf+0x494>
    800042ec:	f8dff06f          	j	80004278 <__printf+0x440>
    800042f0:	f7843783          	ld	a5,-136(s0)
    800042f4:	0007bc83          	ld	s9,0(a5)
    800042f8:	00878793          	addi	a5,a5,8
    800042fc:	f6f43c23          	sd	a5,-136(s0)
    80004300:	000c9a63          	bnez	s9,80004314 <__printf+0x4dc>
    80004304:	1080006f          	j	8000440c <__printf+0x5d4>
    80004308:	001c8c93          	addi	s9,s9,1
    8000430c:	00000097          	auipc	ra,0x0
    80004310:	948080e7          	jalr	-1720(ra) # 80003c54 <consputc>
    80004314:	000cc503          	lbu	a0,0(s9)
    80004318:	fe0518e3          	bnez	a0,80004308 <__printf+0x4d0>
    8000431c:	f5dff06f          	j	80004278 <__printf+0x440>
    80004320:	02500513          	li	a0,37
    80004324:	00000097          	auipc	ra,0x0
    80004328:	930080e7          	jalr	-1744(ra) # 80003c54 <consputc>
    8000432c:	000c8513          	mv	a0,s9
    80004330:	00000097          	auipc	ra,0x0
    80004334:	924080e7          	jalr	-1756(ra) # 80003c54 <consputc>
    80004338:	f41ff06f          	j	80004278 <__printf+0x440>
    8000433c:	02500513          	li	a0,37
    80004340:	00000097          	auipc	ra,0x0
    80004344:	914080e7          	jalr	-1772(ra) # 80003c54 <consputc>
    80004348:	f31ff06f          	j	80004278 <__printf+0x440>
    8000434c:	00030513          	mv	a0,t1
    80004350:	00000097          	auipc	ra,0x0
    80004354:	7bc080e7          	jalr	1980(ra) # 80004b0c <acquire>
    80004358:	b4dff06f          	j	80003ea4 <__printf+0x6c>
    8000435c:	40c0053b          	negw	a0,a2
    80004360:	00a00713          	li	a4,10
    80004364:	02e576bb          	remuw	a3,a0,a4
    80004368:	00002d97          	auipc	s11,0x2
    8000436c:	098d8d93          	addi	s11,s11,152 # 80006400 <digits>
    80004370:	ff700593          	li	a1,-9
    80004374:	02069693          	slli	a3,a3,0x20
    80004378:	0206d693          	srli	a3,a3,0x20
    8000437c:	00dd86b3          	add	a3,s11,a3
    80004380:	0006c683          	lbu	a3,0(a3)
    80004384:	02e557bb          	divuw	a5,a0,a4
    80004388:	f8d40023          	sb	a3,-128(s0)
    8000438c:	10b65e63          	bge	a2,a1,800044a8 <__printf+0x670>
    80004390:	06300593          	li	a1,99
    80004394:	02e7f6bb          	remuw	a3,a5,a4
    80004398:	02069693          	slli	a3,a3,0x20
    8000439c:	0206d693          	srli	a3,a3,0x20
    800043a0:	00dd86b3          	add	a3,s11,a3
    800043a4:	0006c683          	lbu	a3,0(a3)
    800043a8:	02e7d73b          	divuw	a4,a5,a4
    800043ac:	00200793          	li	a5,2
    800043b0:	f8d400a3          	sb	a3,-127(s0)
    800043b4:	bca5ece3          	bltu	a1,a0,80003f8c <__printf+0x154>
    800043b8:	ce5ff06f          	j	8000409c <__printf+0x264>
    800043bc:	40e007bb          	negw	a5,a4
    800043c0:	00002d97          	auipc	s11,0x2
    800043c4:	040d8d93          	addi	s11,s11,64 # 80006400 <digits>
    800043c8:	00f7f693          	andi	a3,a5,15
    800043cc:	00dd86b3          	add	a3,s11,a3
    800043d0:	0006c583          	lbu	a1,0(a3)
    800043d4:	ff100613          	li	a2,-15
    800043d8:	0047d69b          	srliw	a3,a5,0x4
    800043dc:	f8b40023          	sb	a1,-128(s0)
    800043e0:	0047d59b          	srliw	a1,a5,0x4
    800043e4:	0ac75e63          	bge	a4,a2,800044a0 <__printf+0x668>
    800043e8:	00f6f693          	andi	a3,a3,15
    800043ec:	00dd86b3          	add	a3,s11,a3
    800043f0:	0006c603          	lbu	a2,0(a3)
    800043f4:	00f00693          	li	a3,15
    800043f8:	0087d79b          	srliw	a5,a5,0x8
    800043fc:	f8c400a3          	sb	a2,-127(s0)
    80004400:	d8b6e4e3          	bltu	a3,a1,80004188 <__printf+0x350>
    80004404:	00200793          	li	a5,2
    80004408:	e2dff06f          	j	80004234 <__printf+0x3fc>
    8000440c:	00002c97          	auipc	s9,0x2
    80004410:	fd4c8c93          	addi	s9,s9,-44 # 800063e0 <CONSOLE_STATUS+0x3d0>
    80004414:	02800513          	li	a0,40
    80004418:	ef1ff06f          	j	80004308 <__printf+0x4d0>
    8000441c:	00700793          	li	a5,7
    80004420:	00600c93          	li	s9,6
    80004424:	e0dff06f          	j	80004230 <__printf+0x3f8>
    80004428:	00700793          	li	a5,7
    8000442c:	00600c93          	li	s9,6
    80004430:	c69ff06f          	j	80004098 <__printf+0x260>
    80004434:	00300793          	li	a5,3
    80004438:	00200c93          	li	s9,2
    8000443c:	c5dff06f          	j	80004098 <__printf+0x260>
    80004440:	00300793          	li	a5,3
    80004444:	00200c93          	li	s9,2
    80004448:	de9ff06f          	j	80004230 <__printf+0x3f8>
    8000444c:	00400793          	li	a5,4
    80004450:	00300c93          	li	s9,3
    80004454:	dddff06f          	j	80004230 <__printf+0x3f8>
    80004458:	00400793          	li	a5,4
    8000445c:	00300c93          	li	s9,3
    80004460:	c39ff06f          	j	80004098 <__printf+0x260>
    80004464:	00500793          	li	a5,5
    80004468:	00400c93          	li	s9,4
    8000446c:	c2dff06f          	j	80004098 <__printf+0x260>
    80004470:	00500793          	li	a5,5
    80004474:	00400c93          	li	s9,4
    80004478:	db9ff06f          	j	80004230 <__printf+0x3f8>
    8000447c:	00600793          	li	a5,6
    80004480:	00500c93          	li	s9,5
    80004484:	dadff06f          	j	80004230 <__printf+0x3f8>
    80004488:	00600793          	li	a5,6
    8000448c:	00500c93          	li	s9,5
    80004490:	c09ff06f          	j	80004098 <__printf+0x260>
    80004494:	00800793          	li	a5,8
    80004498:	00700c93          	li	s9,7
    8000449c:	bfdff06f          	j	80004098 <__printf+0x260>
    800044a0:	00100793          	li	a5,1
    800044a4:	d91ff06f          	j	80004234 <__printf+0x3fc>
    800044a8:	00100793          	li	a5,1
    800044ac:	bf1ff06f          	j	8000409c <__printf+0x264>
    800044b0:	00900793          	li	a5,9
    800044b4:	00800c93          	li	s9,8
    800044b8:	be1ff06f          	j	80004098 <__printf+0x260>
    800044bc:	00002517          	auipc	a0,0x2
    800044c0:	f2c50513          	addi	a0,a0,-212 # 800063e8 <CONSOLE_STATUS+0x3d8>
    800044c4:	00000097          	auipc	ra,0x0
    800044c8:	918080e7          	jalr	-1768(ra) # 80003ddc <panic>

00000000800044cc <printfinit>:
    800044cc:	fe010113          	addi	sp,sp,-32
    800044d0:	00813823          	sd	s0,16(sp)
    800044d4:	00913423          	sd	s1,8(sp)
    800044d8:	00113c23          	sd	ra,24(sp)
    800044dc:	02010413          	addi	s0,sp,32
    800044e0:	00004497          	auipc	s1,0x4
    800044e4:	1c048493          	addi	s1,s1,448 # 800086a0 <pr>
    800044e8:	00048513          	mv	a0,s1
    800044ec:	00002597          	auipc	a1,0x2
    800044f0:	f0c58593          	addi	a1,a1,-244 # 800063f8 <CONSOLE_STATUS+0x3e8>
    800044f4:	00000097          	auipc	ra,0x0
    800044f8:	5f4080e7          	jalr	1524(ra) # 80004ae8 <initlock>
    800044fc:	01813083          	ld	ra,24(sp)
    80004500:	01013403          	ld	s0,16(sp)
    80004504:	0004ac23          	sw	zero,24(s1)
    80004508:	00813483          	ld	s1,8(sp)
    8000450c:	02010113          	addi	sp,sp,32
    80004510:	00008067          	ret

0000000080004514 <uartinit>:
    80004514:	ff010113          	addi	sp,sp,-16
    80004518:	00813423          	sd	s0,8(sp)
    8000451c:	01010413          	addi	s0,sp,16
    80004520:	100007b7          	lui	a5,0x10000
    80004524:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80004528:	f8000713          	li	a4,-128
    8000452c:	00e781a3          	sb	a4,3(a5)
    80004530:	00300713          	li	a4,3
    80004534:	00e78023          	sb	a4,0(a5)
    80004538:	000780a3          	sb	zero,1(a5)
    8000453c:	00e781a3          	sb	a4,3(a5)
    80004540:	00700693          	li	a3,7
    80004544:	00d78123          	sb	a3,2(a5)
    80004548:	00e780a3          	sb	a4,1(a5)
    8000454c:	00813403          	ld	s0,8(sp)
    80004550:	01010113          	addi	sp,sp,16
    80004554:	00008067          	ret

0000000080004558 <uartputc>:
    80004558:	00003797          	auipc	a5,0x3
    8000455c:	eb07a783          	lw	a5,-336(a5) # 80007408 <panicked>
    80004560:	00078463          	beqz	a5,80004568 <uartputc+0x10>
    80004564:	0000006f          	j	80004564 <uartputc+0xc>
    80004568:	fd010113          	addi	sp,sp,-48
    8000456c:	02813023          	sd	s0,32(sp)
    80004570:	00913c23          	sd	s1,24(sp)
    80004574:	01213823          	sd	s2,16(sp)
    80004578:	01313423          	sd	s3,8(sp)
    8000457c:	02113423          	sd	ra,40(sp)
    80004580:	03010413          	addi	s0,sp,48
    80004584:	00003917          	auipc	s2,0x3
    80004588:	e8c90913          	addi	s2,s2,-372 # 80007410 <uart_tx_r>
    8000458c:	00093783          	ld	a5,0(s2)
    80004590:	00003497          	auipc	s1,0x3
    80004594:	e8848493          	addi	s1,s1,-376 # 80007418 <uart_tx_w>
    80004598:	0004b703          	ld	a4,0(s1)
    8000459c:	02078693          	addi	a3,a5,32
    800045a0:	00050993          	mv	s3,a0
    800045a4:	02e69c63          	bne	a3,a4,800045dc <uartputc+0x84>
    800045a8:	00001097          	auipc	ra,0x1
    800045ac:	834080e7          	jalr	-1996(ra) # 80004ddc <push_on>
    800045b0:	00093783          	ld	a5,0(s2)
    800045b4:	0004b703          	ld	a4,0(s1)
    800045b8:	02078793          	addi	a5,a5,32
    800045bc:	00e79463          	bne	a5,a4,800045c4 <uartputc+0x6c>
    800045c0:	0000006f          	j	800045c0 <uartputc+0x68>
    800045c4:	00001097          	auipc	ra,0x1
    800045c8:	88c080e7          	jalr	-1908(ra) # 80004e50 <pop_on>
    800045cc:	00093783          	ld	a5,0(s2)
    800045d0:	0004b703          	ld	a4,0(s1)
    800045d4:	02078693          	addi	a3,a5,32
    800045d8:	fce688e3          	beq	a3,a4,800045a8 <uartputc+0x50>
    800045dc:	01f77693          	andi	a3,a4,31
    800045e0:	00004597          	auipc	a1,0x4
    800045e4:	0e058593          	addi	a1,a1,224 # 800086c0 <uart_tx_buf>
    800045e8:	00d586b3          	add	a3,a1,a3
    800045ec:	00170713          	addi	a4,a4,1
    800045f0:	01368023          	sb	s3,0(a3)
    800045f4:	00e4b023          	sd	a4,0(s1)
    800045f8:	10000637          	lui	a2,0x10000
    800045fc:	02f71063          	bne	a4,a5,8000461c <uartputc+0xc4>
    80004600:	0340006f          	j	80004634 <uartputc+0xdc>
    80004604:	00074703          	lbu	a4,0(a4)
    80004608:	00f93023          	sd	a5,0(s2)
    8000460c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80004610:	00093783          	ld	a5,0(s2)
    80004614:	0004b703          	ld	a4,0(s1)
    80004618:	00f70e63          	beq	a4,a5,80004634 <uartputc+0xdc>
    8000461c:	00564683          	lbu	a3,5(a2)
    80004620:	01f7f713          	andi	a4,a5,31
    80004624:	00e58733          	add	a4,a1,a4
    80004628:	0206f693          	andi	a3,a3,32
    8000462c:	00178793          	addi	a5,a5,1
    80004630:	fc069ae3          	bnez	a3,80004604 <uartputc+0xac>
    80004634:	02813083          	ld	ra,40(sp)
    80004638:	02013403          	ld	s0,32(sp)
    8000463c:	01813483          	ld	s1,24(sp)
    80004640:	01013903          	ld	s2,16(sp)
    80004644:	00813983          	ld	s3,8(sp)
    80004648:	03010113          	addi	sp,sp,48
    8000464c:	00008067          	ret

0000000080004650 <uartputc_sync>:
    80004650:	ff010113          	addi	sp,sp,-16
    80004654:	00813423          	sd	s0,8(sp)
    80004658:	01010413          	addi	s0,sp,16
    8000465c:	00003717          	auipc	a4,0x3
    80004660:	dac72703          	lw	a4,-596(a4) # 80007408 <panicked>
    80004664:	02071663          	bnez	a4,80004690 <uartputc_sync+0x40>
    80004668:	00050793          	mv	a5,a0
    8000466c:	100006b7          	lui	a3,0x10000
    80004670:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80004674:	02077713          	andi	a4,a4,32
    80004678:	fe070ce3          	beqz	a4,80004670 <uartputc_sync+0x20>
    8000467c:	0ff7f793          	andi	a5,a5,255
    80004680:	00f68023          	sb	a5,0(a3)
    80004684:	00813403          	ld	s0,8(sp)
    80004688:	01010113          	addi	sp,sp,16
    8000468c:	00008067          	ret
    80004690:	0000006f          	j	80004690 <uartputc_sync+0x40>

0000000080004694 <uartstart>:
    80004694:	ff010113          	addi	sp,sp,-16
    80004698:	00813423          	sd	s0,8(sp)
    8000469c:	01010413          	addi	s0,sp,16
    800046a0:	00003617          	auipc	a2,0x3
    800046a4:	d7060613          	addi	a2,a2,-656 # 80007410 <uart_tx_r>
    800046a8:	00003517          	auipc	a0,0x3
    800046ac:	d7050513          	addi	a0,a0,-656 # 80007418 <uart_tx_w>
    800046b0:	00063783          	ld	a5,0(a2)
    800046b4:	00053703          	ld	a4,0(a0)
    800046b8:	04f70263          	beq	a4,a5,800046fc <uartstart+0x68>
    800046bc:	100005b7          	lui	a1,0x10000
    800046c0:	00004817          	auipc	a6,0x4
    800046c4:	00080813          	mv	a6,a6
    800046c8:	01c0006f          	j	800046e4 <uartstart+0x50>
    800046cc:	0006c703          	lbu	a4,0(a3)
    800046d0:	00f63023          	sd	a5,0(a2)
    800046d4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800046d8:	00063783          	ld	a5,0(a2)
    800046dc:	00053703          	ld	a4,0(a0)
    800046e0:	00f70e63          	beq	a4,a5,800046fc <uartstart+0x68>
    800046e4:	01f7f713          	andi	a4,a5,31
    800046e8:	00e806b3          	add	a3,a6,a4
    800046ec:	0055c703          	lbu	a4,5(a1)
    800046f0:	00178793          	addi	a5,a5,1
    800046f4:	02077713          	andi	a4,a4,32
    800046f8:	fc071ae3          	bnez	a4,800046cc <uartstart+0x38>
    800046fc:	00813403          	ld	s0,8(sp)
    80004700:	01010113          	addi	sp,sp,16
    80004704:	00008067          	ret

0000000080004708 <uartgetc>:
    80004708:	ff010113          	addi	sp,sp,-16
    8000470c:	00813423          	sd	s0,8(sp)
    80004710:	01010413          	addi	s0,sp,16
    80004714:	10000737          	lui	a4,0x10000
    80004718:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000471c:	0017f793          	andi	a5,a5,1
    80004720:	00078c63          	beqz	a5,80004738 <uartgetc+0x30>
    80004724:	00074503          	lbu	a0,0(a4)
    80004728:	0ff57513          	andi	a0,a0,255
    8000472c:	00813403          	ld	s0,8(sp)
    80004730:	01010113          	addi	sp,sp,16
    80004734:	00008067          	ret
    80004738:	fff00513          	li	a0,-1
    8000473c:	ff1ff06f          	j	8000472c <uartgetc+0x24>

0000000080004740 <uartintr>:
    80004740:	100007b7          	lui	a5,0x10000
    80004744:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80004748:	0017f793          	andi	a5,a5,1
    8000474c:	0a078463          	beqz	a5,800047f4 <uartintr+0xb4>
    80004750:	fe010113          	addi	sp,sp,-32
    80004754:	00813823          	sd	s0,16(sp)
    80004758:	00913423          	sd	s1,8(sp)
    8000475c:	00113c23          	sd	ra,24(sp)
    80004760:	02010413          	addi	s0,sp,32
    80004764:	100004b7          	lui	s1,0x10000
    80004768:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000476c:	0ff57513          	andi	a0,a0,255
    80004770:	fffff097          	auipc	ra,0xfffff
    80004774:	534080e7          	jalr	1332(ra) # 80003ca4 <consoleintr>
    80004778:	0054c783          	lbu	a5,5(s1)
    8000477c:	0017f793          	andi	a5,a5,1
    80004780:	fe0794e3          	bnez	a5,80004768 <uartintr+0x28>
    80004784:	00003617          	auipc	a2,0x3
    80004788:	c8c60613          	addi	a2,a2,-884 # 80007410 <uart_tx_r>
    8000478c:	00003517          	auipc	a0,0x3
    80004790:	c8c50513          	addi	a0,a0,-884 # 80007418 <uart_tx_w>
    80004794:	00063783          	ld	a5,0(a2)
    80004798:	00053703          	ld	a4,0(a0)
    8000479c:	04f70263          	beq	a4,a5,800047e0 <uartintr+0xa0>
    800047a0:	100005b7          	lui	a1,0x10000
    800047a4:	00004817          	auipc	a6,0x4
    800047a8:	f1c80813          	addi	a6,a6,-228 # 800086c0 <uart_tx_buf>
    800047ac:	01c0006f          	j	800047c8 <uartintr+0x88>
    800047b0:	0006c703          	lbu	a4,0(a3)
    800047b4:	00f63023          	sd	a5,0(a2)
    800047b8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800047bc:	00063783          	ld	a5,0(a2)
    800047c0:	00053703          	ld	a4,0(a0)
    800047c4:	00f70e63          	beq	a4,a5,800047e0 <uartintr+0xa0>
    800047c8:	01f7f713          	andi	a4,a5,31
    800047cc:	00e806b3          	add	a3,a6,a4
    800047d0:	0055c703          	lbu	a4,5(a1)
    800047d4:	00178793          	addi	a5,a5,1
    800047d8:	02077713          	andi	a4,a4,32
    800047dc:	fc071ae3          	bnez	a4,800047b0 <uartintr+0x70>
    800047e0:	01813083          	ld	ra,24(sp)
    800047e4:	01013403          	ld	s0,16(sp)
    800047e8:	00813483          	ld	s1,8(sp)
    800047ec:	02010113          	addi	sp,sp,32
    800047f0:	00008067          	ret
    800047f4:	00003617          	auipc	a2,0x3
    800047f8:	c1c60613          	addi	a2,a2,-996 # 80007410 <uart_tx_r>
    800047fc:	00003517          	auipc	a0,0x3
    80004800:	c1c50513          	addi	a0,a0,-996 # 80007418 <uart_tx_w>
    80004804:	00063783          	ld	a5,0(a2)
    80004808:	00053703          	ld	a4,0(a0)
    8000480c:	04f70263          	beq	a4,a5,80004850 <uartintr+0x110>
    80004810:	100005b7          	lui	a1,0x10000
    80004814:	00004817          	auipc	a6,0x4
    80004818:	eac80813          	addi	a6,a6,-340 # 800086c0 <uart_tx_buf>
    8000481c:	01c0006f          	j	80004838 <uartintr+0xf8>
    80004820:	0006c703          	lbu	a4,0(a3)
    80004824:	00f63023          	sd	a5,0(a2)
    80004828:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000482c:	00063783          	ld	a5,0(a2)
    80004830:	00053703          	ld	a4,0(a0)
    80004834:	02f70063          	beq	a4,a5,80004854 <uartintr+0x114>
    80004838:	01f7f713          	andi	a4,a5,31
    8000483c:	00e806b3          	add	a3,a6,a4
    80004840:	0055c703          	lbu	a4,5(a1)
    80004844:	00178793          	addi	a5,a5,1
    80004848:	02077713          	andi	a4,a4,32
    8000484c:	fc071ae3          	bnez	a4,80004820 <uartintr+0xe0>
    80004850:	00008067          	ret
    80004854:	00008067          	ret

0000000080004858 <kinit>:
    80004858:	fc010113          	addi	sp,sp,-64
    8000485c:	02913423          	sd	s1,40(sp)
    80004860:	fffff7b7          	lui	a5,0xfffff
    80004864:	00005497          	auipc	s1,0x5
    80004868:	e7b48493          	addi	s1,s1,-389 # 800096df <end+0xfff>
    8000486c:	02813823          	sd	s0,48(sp)
    80004870:	01313c23          	sd	s3,24(sp)
    80004874:	00f4f4b3          	and	s1,s1,a5
    80004878:	02113c23          	sd	ra,56(sp)
    8000487c:	03213023          	sd	s2,32(sp)
    80004880:	01413823          	sd	s4,16(sp)
    80004884:	01513423          	sd	s5,8(sp)
    80004888:	04010413          	addi	s0,sp,64
    8000488c:	000017b7          	lui	a5,0x1
    80004890:	01100993          	li	s3,17
    80004894:	00f487b3          	add	a5,s1,a5
    80004898:	01b99993          	slli	s3,s3,0x1b
    8000489c:	06f9e063          	bltu	s3,a5,800048fc <kinit+0xa4>
    800048a0:	00004a97          	auipc	s5,0x4
    800048a4:	e40a8a93          	addi	s5,s5,-448 # 800086e0 <end>
    800048a8:	0754ec63          	bltu	s1,s5,80004920 <kinit+0xc8>
    800048ac:	0734fa63          	bgeu	s1,s3,80004920 <kinit+0xc8>
    800048b0:	00088a37          	lui	s4,0x88
    800048b4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800048b8:	00003917          	auipc	s2,0x3
    800048bc:	b6890913          	addi	s2,s2,-1176 # 80007420 <kmem>
    800048c0:	00ca1a13          	slli	s4,s4,0xc
    800048c4:	0140006f          	j	800048d8 <kinit+0x80>
    800048c8:	000017b7          	lui	a5,0x1
    800048cc:	00f484b3          	add	s1,s1,a5
    800048d0:	0554e863          	bltu	s1,s5,80004920 <kinit+0xc8>
    800048d4:	0534f663          	bgeu	s1,s3,80004920 <kinit+0xc8>
    800048d8:	00001637          	lui	a2,0x1
    800048dc:	00100593          	li	a1,1
    800048e0:	00048513          	mv	a0,s1
    800048e4:	00000097          	auipc	ra,0x0
    800048e8:	5e4080e7          	jalr	1508(ra) # 80004ec8 <__memset>
    800048ec:	00093783          	ld	a5,0(s2)
    800048f0:	00f4b023          	sd	a5,0(s1)
    800048f4:	00993023          	sd	s1,0(s2)
    800048f8:	fd4498e3          	bne	s1,s4,800048c8 <kinit+0x70>
    800048fc:	03813083          	ld	ra,56(sp)
    80004900:	03013403          	ld	s0,48(sp)
    80004904:	02813483          	ld	s1,40(sp)
    80004908:	02013903          	ld	s2,32(sp)
    8000490c:	01813983          	ld	s3,24(sp)
    80004910:	01013a03          	ld	s4,16(sp)
    80004914:	00813a83          	ld	s5,8(sp)
    80004918:	04010113          	addi	sp,sp,64
    8000491c:	00008067          	ret
    80004920:	00002517          	auipc	a0,0x2
    80004924:	af850513          	addi	a0,a0,-1288 # 80006418 <digits+0x18>
    80004928:	fffff097          	auipc	ra,0xfffff
    8000492c:	4b4080e7          	jalr	1204(ra) # 80003ddc <panic>

0000000080004930 <freerange>:
    80004930:	fc010113          	addi	sp,sp,-64
    80004934:	000017b7          	lui	a5,0x1
    80004938:	02913423          	sd	s1,40(sp)
    8000493c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80004940:	009504b3          	add	s1,a0,s1
    80004944:	fffff537          	lui	a0,0xfffff
    80004948:	02813823          	sd	s0,48(sp)
    8000494c:	02113c23          	sd	ra,56(sp)
    80004950:	03213023          	sd	s2,32(sp)
    80004954:	01313c23          	sd	s3,24(sp)
    80004958:	01413823          	sd	s4,16(sp)
    8000495c:	01513423          	sd	s5,8(sp)
    80004960:	01613023          	sd	s6,0(sp)
    80004964:	04010413          	addi	s0,sp,64
    80004968:	00a4f4b3          	and	s1,s1,a0
    8000496c:	00f487b3          	add	a5,s1,a5
    80004970:	06f5e463          	bltu	a1,a5,800049d8 <freerange+0xa8>
    80004974:	00004a97          	auipc	s5,0x4
    80004978:	d6ca8a93          	addi	s5,s5,-660 # 800086e0 <end>
    8000497c:	0954e263          	bltu	s1,s5,80004a00 <freerange+0xd0>
    80004980:	01100993          	li	s3,17
    80004984:	01b99993          	slli	s3,s3,0x1b
    80004988:	0734fc63          	bgeu	s1,s3,80004a00 <freerange+0xd0>
    8000498c:	00058a13          	mv	s4,a1
    80004990:	00003917          	auipc	s2,0x3
    80004994:	a9090913          	addi	s2,s2,-1392 # 80007420 <kmem>
    80004998:	00002b37          	lui	s6,0x2
    8000499c:	0140006f          	j	800049b0 <freerange+0x80>
    800049a0:	000017b7          	lui	a5,0x1
    800049a4:	00f484b3          	add	s1,s1,a5
    800049a8:	0554ec63          	bltu	s1,s5,80004a00 <freerange+0xd0>
    800049ac:	0534fa63          	bgeu	s1,s3,80004a00 <freerange+0xd0>
    800049b0:	00001637          	lui	a2,0x1
    800049b4:	00100593          	li	a1,1
    800049b8:	00048513          	mv	a0,s1
    800049bc:	00000097          	auipc	ra,0x0
    800049c0:	50c080e7          	jalr	1292(ra) # 80004ec8 <__memset>
    800049c4:	00093703          	ld	a4,0(s2)
    800049c8:	016487b3          	add	a5,s1,s6
    800049cc:	00e4b023          	sd	a4,0(s1)
    800049d0:	00993023          	sd	s1,0(s2)
    800049d4:	fcfa76e3          	bgeu	s4,a5,800049a0 <freerange+0x70>
    800049d8:	03813083          	ld	ra,56(sp)
    800049dc:	03013403          	ld	s0,48(sp)
    800049e0:	02813483          	ld	s1,40(sp)
    800049e4:	02013903          	ld	s2,32(sp)
    800049e8:	01813983          	ld	s3,24(sp)
    800049ec:	01013a03          	ld	s4,16(sp)
    800049f0:	00813a83          	ld	s5,8(sp)
    800049f4:	00013b03          	ld	s6,0(sp)
    800049f8:	04010113          	addi	sp,sp,64
    800049fc:	00008067          	ret
    80004a00:	00002517          	auipc	a0,0x2
    80004a04:	a1850513          	addi	a0,a0,-1512 # 80006418 <digits+0x18>
    80004a08:	fffff097          	auipc	ra,0xfffff
    80004a0c:	3d4080e7          	jalr	980(ra) # 80003ddc <panic>

0000000080004a10 <kfree>:
    80004a10:	fe010113          	addi	sp,sp,-32
    80004a14:	00813823          	sd	s0,16(sp)
    80004a18:	00113c23          	sd	ra,24(sp)
    80004a1c:	00913423          	sd	s1,8(sp)
    80004a20:	02010413          	addi	s0,sp,32
    80004a24:	03451793          	slli	a5,a0,0x34
    80004a28:	04079c63          	bnez	a5,80004a80 <kfree+0x70>
    80004a2c:	00004797          	auipc	a5,0x4
    80004a30:	cb478793          	addi	a5,a5,-844 # 800086e0 <end>
    80004a34:	00050493          	mv	s1,a0
    80004a38:	04f56463          	bltu	a0,a5,80004a80 <kfree+0x70>
    80004a3c:	01100793          	li	a5,17
    80004a40:	01b79793          	slli	a5,a5,0x1b
    80004a44:	02f57e63          	bgeu	a0,a5,80004a80 <kfree+0x70>
    80004a48:	00001637          	lui	a2,0x1
    80004a4c:	00100593          	li	a1,1
    80004a50:	00000097          	auipc	ra,0x0
    80004a54:	478080e7          	jalr	1144(ra) # 80004ec8 <__memset>
    80004a58:	00003797          	auipc	a5,0x3
    80004a5c:	9c878793          	addi	a5,a5,-1592 # 80007420 <kmem>
    80004a60:	0007b703          	ld	a4,0(a5)
    80004a64:	01813083          	ld	ra,24(sp)
    80004a68:	01013403          	ld	s0,16(sp)
    80004a6c:	00e4b023          	sd	a4,0(s1)
    80004a70:	0097b023          	sd	s1,0(a5)
    80004a74:	00813483          	ld	s1,8(sp)
    80004a78:	02010113          	addi	sp,sp,32
    80004a7c:	00008067          	ret
    80004a80:	00002517          	auipc	a0,0x2
    80004a84:	99850513          	addi	a0,a0,-1640 # 80006418 <digits+0x18>
    80004a88:	fffff097          	auipc	ra,0xfffff
    80004a8c:	354080e7          	jalr	852(ra) # 80003ddc <panic>

0000000080004a90 <kalloc>:
    80004a90:	fe010113          	addi	sp,sp,-32
    80004a94:	00813823          	sd	s0,16(sp)
    80004a98:	00913423          	sd	s1,8(sp)
    80004a9c:	00113c23          	sd	ra,24(sp)
    80004aa0:	02010413          	addi	s0,sp,32
    80004aa4:	00003797          	auipc	a5,0x3
    80004aa8:	97c78793          	addi	a5,a5,-1668 # 80007420 <kmem>
    80004aac:	0007b483          	ld	s1,0(a5)
    80004ab0:	02048063          	beqz	s1,80004ad0 <kalloc+0x40>
    80004ab4:	0004b703          	ld	a4,0(s1)
    80004ab8:	00001637          	lui	a2,0x1
    80004abc:	00500593          	li	a1,5
    80004ac0:	00048513          	mv	a0,s1
    80004ac4:	00e7b023          	sd	a4,0(a5)
    80004ac8:	00000097          	auipc	ra,0x0
    80004acc:	400080e7          	jalr	1024(ra) # 80004ec8 <__memset>
    80004ad0:	01813083          	ld	ra,24(sp)
    80004ad4:	01013403          	ld	s0,16(sp)
    80004ad8:	00048513          	mv	a0,s1
    80004adc:	00813483          	ld	s1,8(sp)
    80004ae0:	02010113          	addi	sp,sp,32
    80004ae4:	00008067          	ret

0000000080004ae8 <initlock>:
    80004ae8:	ff010113          	addi	sp,sp,-16
    80004aec:	00813423          	sd	s0,8(sp)
    80004af0:	01010413          	addi	s0,sp,16
    80004af4:	00813403          	ld	s0,8(sp)
    80004af8:	00b53423          	sd	a1,8(a0)
    80004afc:	00052023          	sw	zero,0(a0)
    80004b00:	00053823          	sd	zero,16(a0)
    80004b04:	01010113          	addi	sp,sp,16
    80004b08:	00008067          	ret

0000000080004b0c <acquire>:
    80004b0c:	fe010113          	addi	sp,sp,-32
    80004b10:	00813823          	sd	s0,16(sp)
    80004b14:	00913423          	sd	s1,8(sp)
    80004b18:	00113c23          	sd	ra,24(sp)
    80004b1c:	01213023          	sd	s2,0(sp)
    80004b20:	02010413          	addi	s0,sp,32
    80004b24:	00050493          	mv	s1,a0
    80004b28:	10002973          	csrr	s2,sstatus
    80004b2c:	100027f3          	csrr	a5,sstatus
    80004b30:	ffd7f793          	andi	a5,a5,-3
    80004b34:	10079073          	csrw	sstatus,a5
    80004b38:	fffff097          	auipc	ra,0xfffff
    80004b3c:	8e0080e7          	jalr	-1824(ra) # 80003418 <mycpu>
    80004b40:	07852783          	lw	a5,120(a0)
    80004b44:	06078e63          	beqz	a5,80004bc0 <acquire+0xb4>
    80004b48:	fffff097          	auipc	ra,0xfffff
    80004b4c:	8d0080e7          	jalr	-1840(ra) # 80003418 <mycpu>
    80004b50:	07852783          	lw	a5,120(a0)
    80004b54:	0004a703          	lw	a4,0(s1)
    80004b58:	0017879b          	addiw	a5,a5,1
    80004b5c:	06f52c23          	sw	a5,120(a0)
    80004b60:	04071063          	bnez	a4,80004ba0 <acquire+0x94>
    80004b64:	00100713          	li	a4,1
    80004b68:	00070793          	mv	a5,a4
    80004b6c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80004b70:	0007879b          	sext.w	a5,a5
    80004b74:	fe079ae3          	bnez	a5,80004b68 <acquire+0x5c>
    80004b78:	0ff0000f          	fence
    80004b7c:	fffff097          	auipc	ra,0xfffff
    80004b80:	89c080e7          	jalr	-1892(ra) # 80003418 <mycpu>
    80004b84:	01813083          	ld	ra,24(sp)
    80004b88:	01013403          	ld	s0,16(sp)
    80004b8c:	00a4b823          	sd	a0,16(s1)
    80004b90:	00013903          	ld	s2,0(sp)
    80004b94:	00813483          	ld	s1,8(sp)
    80004b98:	02010113          	addi	sp,sp,32
    80004b9c:	00008067          	ret
    80004ba0:	0104b903          	ld	s2,16(s1)
    80004ba4:	fffff097          	auipc	ra,0xfffff
    80004ba8:	874080e7          	jalr	-1932(ra) # 80003418 <mycpu>
    80004bac:	faa91ce3          	bne	s2,a0,80004b64 <acquire+0x58>
    80004bb0:	00002517          	auipc	a0,0x2
    80004bb4:	87050513          	addi	a0,a0,-1936 # 80006420 <digits+0x20>
    80004bb8:	fffff097          	auipc	ra,0xfffff
    80004bbc:	224080e7          	jalr	548(ra) # 80003ddc <panic>
    80004bc0:	00195913          	srli	s2,s2,0x1
    80004bc4:	fffff097          	auipc	ra,0xfffff
    80004bc8:	854080e7          	jalr	-1964(ra) # 80003418 <mycpu>
    80004bcc:	00197913          	andi	s2,s2,1
    80004bd0:	07252e23          	sw	s2,124(a0)
    80004bd4:	f75ff06f          	j	80004b48 <acquire+0x3c>

0000000080004bd8 <release>:
    80004bd8:	fe010113          	addi	sp,sp,-32
    80004bdc:	00813823          	sd	s0,16(sp)
    80004be0:	00113c23          	sd	ra,24(sp)
    80004be4:	00913423          	sd	s1,8(sp)
    80004be8:	01213023          	sd	s2,0(sp)
    80004bec:	02010413          	addi	s0,sp,32
    80004bf0:	00052783          	lw	a5,0(a0)
    80004bf4:	00079a63          	bnez	a5,80004c08 <release+0x30>
    80004bf8:	00002517          	auipc	a0,0x2
    80004bfc:	83050513          	addi	a0,a0,-2000 # 80006428 <digits+0x28>
    80004c00:	fffff097          	auipc	ra,0xfffff
    80004c04:	1dc080e7          	jalr	476(ra) # 80003ddc <panic>
    80004c08:	01053903          	ld	s2,16(a0)
    80004c0c:	00050493          	mv	s1,a0
    80004c10:	fffff097          	auipc	ra,0xfffff
    80004c14:	808080e7          	jalr	-2040(ra) # 80003418 <mycpu>
    80004c18:	fea910e3          	bne	s2,a0,80004bf8 <release+0x20>
    80004c1c:	0004b823          	sd	zero,16(s1)
    80004c20:	0ff0000f          	fence
    80004c24:	0f50000f          	fence	iorw,ow
    80004c28:	0804a02f          	amoswap.w	zero,zero,(s1)
    80004c2c:	ffffe097          	auipc	ra,0xffffe
    80004c30:	7ec080e7          	jalr	2028(ra) # 80003418 <mycpu>
    80004c34:	100027f3          	csrr	a5,sstatus
    80004c38:	0027f793          	andi	a5,a5,2
    80004c3c:	04079a63          	bnez	a5,80004c90 <release+0xb8>
    80004c40:	07852783          	lw	a5,120(a0)
    80004c44:	02f05e63          	blez	a5,80004c80 <release+0xa8>
    80004c48:	fff7871b          	addiw	a4,a5,-1
    80004c4c:	06e52c23          	sw	a4,120(a0)
    80004c50:	00071c63          	bnez	a4,80004c68 <release+0x90>
    80004c54:	07c52783          	lw	a5,124(a0)
    80004c58:	00078863          	beqz	a5,80004c68 <release+0x90>
    80004c5c:	100027f3          	csrr	a5,sstatus
    80004c60:	0027e793          	ori	a5,a5,2
    80004c64:	10079073          	csrw	sstatus,a5
    80004c68:	01813083          	ld	ra,24(sp)
    80004c6c:	01013403          	ld	s0,16(sp)
    80004c70:	00813483          	ld	s1,8(sp)
    80004c74:	00013903          	ld	s2,0(sp)
    80004c78:	02010113          	addi	sp,sp,32
    80004c7c:	00008067          	ret
    80004c80:	00001517          	auipc	a0,0x1
    80004c84:	7c850513          	addi	a0,a0,1992 # 80006448 <digits+0x48>
    80004c88:	fffff097          	auipc	ra,0xfffff
    80004c8c:	154080e7          	jalr	340(ra) # 80003ddc <panic>
    80004c90:	00001517          	auipc	a0,0x1
    80004c94:	7a050513          	addi	a0,a0,1952 # 80006430 <digits+0x30>
    80004c98:	fffff097          	auipc	ra,0xfffff
    80004c9c:	144080e7          	jalr	324(ra) # 80003ddc <panic>

0000000080004ca0 <holding>:
    80004ca0:	00052783          	lw	a5,0(a0)
    80004ca4:	00079663          	bnez	a5,80004cb0 <holding+0x10>
    80004ca8:	00000513          	li	a0,0
    80004cac:	00008067          	ret
    80004cb0:	fe010113          	addi	sp,sp,-32
    80004cb4:	00813823          	sd	s0,16(sp)
    80004cb8:	00913423          	sd	s1,8(sp)
    80004cbc:	00113c23          	sd	ra,24(sp)
    80004cc0:	02010413          	addi	s0,sp,32
    80004cc4:	01053483          	ld	s1,16(a0)
    80004cc8:	ffffe097          	auipc	ra,0xffffe
    80004ccc:	750080e7          	jalr	1872(ra) # 80003418 <mycpu>
    80004cd0:	01813083          	ld	ra,24(sp)
    80004cd4:	01013403          	ld	s0,16(sp)
    80004cd8:	40a48533          	sub	a0,s1,a0
    80004cdc:	00153513          	seqz	a0,a0
    80004ce0:	00813483          	ld	s1,8(sp)
    80004ce4:	02010113          	addi	sp,sp,32
    80004ce8:	00008067          	ret

0000000080004cec <push_off>:
    80004cec:	fe010113          	addi	sp,sp,-32
    80004cf0:	00813823          	sd	s0,16(sp)
    80004cf4:	00113c23          	sd	ra,24(sp)
    80004cf8:	00913423          	sd	s1,8(sp)
    80004cfc:	02010413          	addi	s0,sp,32
    80004d00:	100024f3          	csrr	s1,sstatus
    80004d04:	100027f3          	csrr	a5,sstatus
    80004d08:	ffd7f793          	andi	a5,a5,-3
    80004d0c:	10079073          	csrw	sstatus,a5
    80004d10:	ffffe097          	auipc	ra,0xffffe
    80004d14:	708080e7          	jalr	1800(ra) # 80003418 <mycpu>
    80004d18:	07852783          	lw	a5,120(a0)
    80004d1c:	02078663          	beqz	a5,80004d48 <push_off+0x5c>
    80004d20:	ffffe097          	auipc	ra,0xffffe
    80004d24:	6f8080e7          	jalr	1784(ra) # 80003418 <mycpu>
    80004d28:	07852783          	lw	a5,120(a0)
    80004d2c:	01813083          	ld	ra,24(sp)
    80004d30:	01013403          	ld	s0,16(sp)
    80004d34:	0017879b          	addiw	a5,a5,1
    80004d38:	06f52c23          	sw	a5,120(a0)
    80004d3c:	00813483          	ld	s1,8(sp)
    80004d40:	02010113          	addi	sp,sp,32
    80004d44:	00008067          	ret
    80004d48:	0014d493          	srli	s1,s1,0x1
    80004d4c:	ffffe097          	auipc	ra,0xffffe
    80004d50:	6cc080e7          	jalr	1740(ra) # 80003418 <mycpu>
    80004d54:	0014f493          	andi	s1,s1,1
    80004d58:	06952e23          	sw	s1,124(a0)
    80004d5c:	fc5ff06f          	j	80004d20 <push_off+0x34>

0000000080004d60 <pop_off>:
    80004d60:	ff010113          	addi	sp,sp,-16
    80004d64:	00813023          	sd	s0,0(sp)
    80004d68:	00113423          	sd	ra,8(sp)
    80004d6c:	01010413          	addi	s0,sp,16
    80004d70:	ffffe097          	auipc	ra,0xffffe
    80004d74:	6a8080e7          	jalr	1704(ra) # 80003418 <mycpu>
    80004d78:	100027f3          	csrr	a5,sstatus
    80004d7c:	0027f793          	andi	a5,a5,2
    80004d80:	04079663          	bnez	a5,80004dcc <pop_off+0x6c>
    80004d84:	07852783          	lw	a5,120(a0)
    80004d88:	02f05a63          	blez	a5,80004dbc <pop_off+0x5c>
    80004d8c:	fff7871b          	addiw	a4,a5,-1
    80004d90:	06e52c23          	sw	a4,120(a0)
    80004d94:	00071c63          	bnez	a4,80004dac <pop_off+0x4c>
    80004d98:	07c52783          	lw	a5,124(a0)
    80004d9c:	00078863          	beqz	a5,80004dac <pop_off+0x4c>
    80004da0:	100027f3          	csrr	a5,sstatus
    80004da4:	0027e793          	ori	a5,a5,2
    80004da8:	10079073          	csrw	sstatus,a5
    80004dac:	00813083          	ld	ra,8(sp)
    80004db0:	00013403          	ld	s0,0(sp)
    80004db4:	01010113          	addi	sp,sp,16
    80004db8:	00008067          	ret
    80004dbc:	00001517          	auipc	a0,0x1
    80004dc0:	68c50513          	addi	a0,a0,1676 # 80006448 <digits+0x48>
    80004dc4:	fffff097          	auipc	ra,0xfffff
    80004dc8:	018080e7          	jalr	24(ra) # 80003ddc <panic>
    80004dcc:	00001517          	auipc	a0,0x1
    80004dd0:	66450513          	addi	a0,a0,1636 # 80006430 <digits+0x30>
    80004dd4:	fffff097          	auipc	ra,0xfffff
    80004dd8:	008080e7          	jalr	8(ra) # 80003ddc <panic>

0000000080004ddc <push_on>:
    80004ddc:	fe010113          	addi	sp,sp,-32
    80004de0:	00813823          	sd	s0,16(sp)
    80004de4:	00113c23          	sd	ra,24(sp)
    80004de8:	00913423          	sd	s1,8(sp)
    80004dec:	02010413          	addi	s0,sp,32
    80004df0:	100024f3          	csrr	s1,sstatus
    80004df4:	100027f3          	csrr	a5,sstatus
    80004df8:	0027e793          	ori	a5,a5,2
    80004dfc:	10079073          	csrw	sstatus,a5
    80004e00:	ffffe097          	auipc	ra,0xffffe
    80004e04:	618080e7          	jalr	1560(ra) # 80003418 <mycpu>
    80004e08:	07852783          	lw	a5,120(a0)
    80004e0c:	02078663          	beqz	a5,80004e38 <push_on+0x5c>
    80004e10:	ffffe097          	auipc	ra,0xffffe
    80004e14:	608080e7          	jalr	1544(ra) # 80003418 <mycpu>
    80004e18:	07852783          	lw	a5,120(a0)
    80004e1c:	01813083          	ld	ra,24(sp)
    80004e20:	01013403          	ld	s0,16(sp)
    80004e24:	0017879b          	addiw	a5,a5,1
    80004e28:	06f52c23          	sw	a5,120(a0)
    80004e2c:	00813483          	ld	s1,8(sp)
    80004e30:	02010113          	addi	sp,sp,32
    80004e34:	00008067          	ret
    80004e38:	0014d493          	srli	s1,s1,0x1
    80004e3c:	ffffe097          	auipc	ra,0xffffe
    80004e40:	5dc080e7          	jalr	1500(ra) # 80003418 <mycpu>
    80004e44:	0014f493          	andi	s1,s1,1
    80004e48:	06952e23          	sw	s1,124(a0)
    80004e4c:	fc5ff06f          	j	80004e10 <push_on+0x34>

0000000080004e50 <pop_on>:
    80004e50:	ff010113          	addi	sp,sp,-16
    80004e54:	00813023          	sd	s0,0(sp)
    80004e58:	00113423          	sd	ra,8(sp)
    80004e5c:	01010413          	addi	s0,sp,16
    80004e60:	ffffe097          	auipc	ra,0xffffe
    80004e64:	5b8080e7          	jalr	1464(ra) # 80003418 <mycpu>
    80004e68:	100027f3          	csrr	a5,sstatus
    80004e6c:	0027f793          	andi	a5,a5,2
    80004e70:	04078463          	beqz	a5,80004eb8 <pop_on+0x68>
    80004e74:	07852783          	lw	a5,120(a0)
    80004e78:	02f05863          	blez	a5,80004ea8 <pop_on+0x58>
    80004e7c:	fff7879b          	addiw	a5,a5,-1
    80004e80:	06f52c23          	sw	a5,120(a0)
    80004e84:	07853783          	ld	a5,120(a0)
    80004e88:	00079863          	bnez	a5,80004e98 <pop_on+0x48>
    80004e8c:	100027f3          	csrr	a5,sstatus
    80004e90:	ffd7f793          	andi	a5,a5,-3
    80004e94:	10079073          	csrw	sstatus,a5
    80004e98:	00813083          	ld	ra,8(sp)
    80004e9c:	00013403          	ld	s0,0(sp)
    80004ea0:	01010113          	addi	sp,sp,16
    80004ea4:	00008067          	ret
    80004ea8:	00001517          	auipc	a0,0x1
    80004eac:	5c850513          	addi	a0,a0,1480 # 80006470 <digits+0x70>
    80004eb0:	fffff097          	auipc	ra,0xfffff
    80004eb4:	f2c080e7          	jalr	-212(ra) # 80003ddc <panic>
    80004eb8:	00001517          	auipc	a0,0x1
    80004ebc:	59850513          	addi	a0,a0,1432 # 80006450 <digits+0x50>
    80004ec0:	fffff097          	auipc	ra,0xfffff
    80004ec4:	f1c080e7          	jalr	-228(ra) # 80003ddc <panic>

0000000080004ec8 <__memset>:
    80004ec8:	ff010113          	addi	sp,sp,-16
    80004ecc:	00813423          	sd	s0,8(sp)
    80004ed0:	01010413          	addi	s0,sp,16
    80004ed4:	1a060e63          	beqz	a2,80005090 <__memset+0x1c8>
    80004ed8:	40a007b3          	neg	a5,a0
    80004edc:	0077f793          	andi	a5,a5,7
    80004ee0:	00778693          	addi	a3,a5,7
    80004ee4:	00b00813          	li	a6,11
    80004ee8:	0ff5f593          	andi	a1,a1,255
    80004eec:	fff6071b          	addiw	a4,a2,-1
    80004ef0:	1b06e663          	bltu	a3,a6,8000509c <__memset+0x1d4>
    80004ef4:	1cd76463          	bltu	a4,a3,800050bc <__memset+0x1f4>
    80004ef8:	1a078e63          	beqz	a5,800050b4 <__memset+0x1ec>
    80004efc:	00b50023          	sb	a1,0(a0)
    80004f00:	00100713          	li	a4,1
    80004f04:	1ae78463          	beq	a5,a4,800050ac <__memset+0x1e4>
    80004f08:	00b500a3          	sb	a1,1(a0)
    80004f0c:	00200713          	li	a4,2
    80004f10:	1ae78a63          	beq	a5,a4,800050c4 <__memset+0x1fc>
    80004f14:	00b50123          	sb	a1,2(a0)
    80004f18:	00300713          	li	a4,3
    80004f1c:	18e78463          	beq	a5,a4,800050a4 <__memset+0x1dc>
    80004f20:	00b501a3          	sb	a1,3(a0)
    80004f24:	00400713          	li	a4,4
    80004f28:	1ae78263          	beq	a5,a4,800050cc <__memset+0x204>
    80004f2c:	00b50223          	sb	a1,4(a0)
    80004f30:	00500713          	li	a4,5
    80004f34:	1ae78063          	beq	a5,a4,800050d4 <__memset+0x20c>
    80004f38:	00b502a3          	sb	a1,5(a0)
    80004f3c:	00700713          	li	a4,7
    80004f40:	18e79e63          	bne	a5,a4,800050dc <__memset+0x214>
    80004f44:	00b50323          	sb	a1,6(a0)
    80004f48:	00700e93          	li	t4,7
    80004f4c:	00859713          	slli	a4,a1,0x8
    80004f50:	00e5e733          	or	a4,a1,a4
    80004f54:	01059e13          	slli	t3,a1,0x10
    80004f58:	01c76e33          	or	t3,a4,t3
    80004f5c:	01859313          	slli	t1,a1,0x18
    80004f60:	006e6333          	or	t1,t3,t1
    80004f64:	02059893          	slli	a7,a1,0x20
    80004f68:	40f60e3b          	subw	t3,a2,a5
    80004f6c:	011368b3          	or	a7,t1,a7
    80004f70:	02859813          	slli	a6,a1,0x28
    80004f74:	0108e833          	or	a6,a7,a6
    80004f78:	03059693          	slli	a3,a1,0x30
    80004f7c:	003e589b          	srliw	a7,t3,0x3
    80004f80:	00d866b3          	or	a3,a6,a3
    80004f84:	03859713          	slli	a4,a1,0x38
    80004f88:	00389813          	slli	a6,a7,0x3
    80004f8c:	00f507b3          	add	a5,a0,a5
    80004f90:	00e6e733          	or	a4,a3,a4
    80004f94:	000e089b          	sext.w	a7,t3
    80004f98:	00f806b3          	add	a3,a6,a5
    80004f9c:	00e7b023          	sd	a4,0(a5)
    80004fa0:	00878793          	addi	a5,a5,8
    80004fa4:	fed79ce3          	bne	a5,a3,80004f9c <__memset+0xd4>
    80004fa8:	ff8e7793          	andi	a5,t3,-8
    80004fac:	0007871b          	sext.w	a4,a5
    80004fb0:	01d787bb          	addw	a5,a5,t4
    80004fb4:	0ce88e63          	beq	a7,a4,80005090 <__memset+0x1c8>
    80004fb8:	00f50733          	add	a4,a0,a5
    80004fbc:	00b70023          	sb	a1,0(a4)
    80004fc0:	0017871b          	addiw	a4,a5,1
    80004fc4:	0cc77663          	bgeu	a4,a2,80005090 <__memset+0x1c8>
    80004fc8:	00e50733          	add	a4,a0,a4
    80004fcc:	00b70023          	sb	a1,0(a4)
    80004fd0:	0027871b          	addiw	a4,a5,2
    80004fd4:	0ac77e63          	bgeu	a4,a2,80005090 <__memset+0x1c8>
    80004fd8:	00e50733          	add	a4,a0,a4
    80004fdc:	00b70023          	sb	a1,0(a4)
    80004fe0:	0037871b          	addiw	a4,a5,3
    80004fe4:	0ac77663          	bgeu	a4,a2,80005090 <__memset+0x1c8>
    80004fe8:	00e50733          	add	a4,a0,a4
    80004fec:	00b70023          	sb	a1,0(a4)
    80004ff0:	0047871b          	addiw	a4,a5,4
    80004ff4:	08c77e63          	bgeu	a4,a2,80005090 <__memset+0x1c8>
    80004ff8:	00e50733          	add	a4,a0,a4
    80004ffc:	00b70023          	sb	a1,0(a4)
    80005000:	0057871b          	addiw	a4,a5,5
    80005004:	08c77663          	bgeu	a4,a2,80005090 <__memset+0x1c8>
    80005008:	00e50733          	add	a4,a0,a4
    8000500c:	00b70023          	sb	a1,0(a4)
    80005010:	0067871b          	addiw	a4,a5,6
    80005014:	06c77e63          	bgeu	a4,a2,80005090 <__memset+0x1c8>
    80005018:	00e50733          	add	a4,a0,a4
    8000501c:	00b70023          	sb	a1,0(a4)
    80005020:	0077871b          	addiw	a4,a5,7
    80005024:	06c77663          	bgeu	a4,a2,80005090 <__memset+0x1c8>
    80005028:	00e50733          	add	a4,a0,a4
    8000502c:	00b70023          	sb	a1,0(a4)
    80005030:	0087871b          	addiw	a4,a5,8
    80005034:	04c77e63          	bgeu	a4,a2,80005090 <__memset+0x1c8>
    80005038:	00e50733          	add	a4,a0,a4
    8000503c:	00b70023          	sb	a1,0(a4)
    80005040:	0097871b          	addiw	a4,a5,9
    80005044:	04c77663          	bgeu	a4,a2,80005090 <__memset+0x1c8>
    80005048:	00e50733          	add	a4,a0,a4
    8000504c:	00b70023          	sb	a1,0(a4)
    80005050:	00a7871b          	addiw	a4,a5,10
    80005054:	02c77e63          	bgeu	a4,a2,80005090 <__memset+0x1c8>
    80005058:	00e50733          	add	a4,a0,a4
    8000505c:	00b70023          	sb	a1,0(a4)
    80005060:	00b7871b          	addiw	a4,a5,11
    80005064:	02c77663          	bgeu	a4,a2,80005090 <__memset+0x1c8>
    80005068:	00e50733          	add	a4,a0,a4
    8000506c:	00b70023          	sb	a1,0(a4)
    80005070:	00c7871b          	addiw	a4,a5,12
    80005074:	00c77e63          	bgeu	a4,a2,80005090 <__memset+0x1c8>
    80005078:	00e50733          	add	a4,a0,a4
    8000507c:	00b70023          	sb	a1,0(a4)
    80005080:	00d7879b          	addiw	a5,a5,13
    80005084:	00c7f663          	bgeu	a5,a2,80005090 <__memset+0x1c8>
    80005088:	00f507b3          	add	a5,a0,a5
    8000508c:	00b78023          	sb	a1,0(a5)
    80005090:	00813403          	ld	s0,8(sp)
    80005094:	01010113          	addi	sp,sp,16
    80005098:	00008067          	ret
    8000509c:	00b00693          	li	a3,11
    800050a0:	e55ff06f          	j	80004ef4 <__memset+0x2c>
    800050a4:	00300e93          	li	t4,3
    800050a8:	ea5ff06f          	j	80004f4c <__memset+0x84>
    800050ac:	00100e93          	li	t4,1
    800050b0:	e9dff06f          	j	80004f4c <__memset+0x84>
    800050b4:	00000e93          	li	t4,0
    800050b8:	e95ff06f          	j	80004f4c <__memset+0x84>
    800050bc:	00000793          	li	a5,0
    800050c0:	ef9ff06f          	j	80004fb8 <__memset+0xf0>
    800050c4:	00200e93          	li	t4,2
    800050c8:	e85ff06f          	j	80004f4c <__memset+0x84>
    800050cc:	00400e93          	li	t4,4
    800050d0:	e7dff06f          	j	80004f4c <__memset+0x84>
    800050d4:	00500e93          	li	t4,5
    800050d8:	e75ff06f          	j	80004f4c <__memset+0x84>
    800050dc:	00600e93          	li	t4,6
    800050e0:	e6dff06f          	j	80004f4c <__memset+0x84>

00000000800050e4 <__memmove>:
    800050e4:	ff010113          	addi	sp,sp,-16
    800050e8:	00813423          	sd	s0,8(sp)
    800050ec:	01010413          	addi	s0,sp,16
    800050f0:	0e060863          	beqz	a2,800051e0 <__memmove+0xfc>
    800050f4:	fff6069b          	addiw	a3,a2,-1
    800050f8:	0006881b          	sext.w	a6,a3
    800050fc:	0ea5e863          	bltu	a1,a0,800051ec <__memmove+0x108>
    80005100:	00758713          	addi	a4,a1,7
    80005104:	00a5e7b3          	or	a5,a1,a0
    80005108:	40a70733          	sub	a4,a4,a0
    8000510c:	0077f793          	andi	a5,a5,7
    80005110:	00f73713          	sltiu	a4,a4,15
    80005114:	00174713          	xori	a4,a4,1
    80005118:	0017b793          	seqz	a5,a5
    8000511c:	00e7f7b3          	and	a5,a5,a4
    80005120:	10078863          	beqz	a5,80005230 <__memmove+0x14c>
    80005124:	00900793          	li	a5,9
    80005128:	1107f463          	bgeu	a5,a6,80005230 <__memmove+0x14c>
    8000512c:	0036581b          	srliw	a6,a2,0x3
    80005130:	fff8081b          	addiw	a6,a6,-1
    80005134:	02081813          	slli	a6,a6,0x20
    80005138:	01d85893          	srli	a7,a6,0x1d
    8000513c:	00858813          	addi	a6,a1,8
    80005140:	00058793          	mv	a5,a1
    80005144:	00050713          	mv	a4,a0
    80005148:	01088833          	add	a6,a7,a6
    8000514c:	0007b883          	ld	a7,0(a5)
    80005150:	00878793          	addi	a5,a5,8
    80005154:	00870713          	addi	a4,a4,8
    80005158:	ff173c23          	sd	a7,-8(a4)
    8000515c:	ff0798e3          	bne	a5,a6,8000514c <__memmove+0x68>
    80005160:	ff867713          	andi	a4,a2,-8
    80005164:	02071793          	slli	a5,a4,0x20
    80005168:	0207d793          	srli	a5,a5,0x20
    8000516c:	00f585b3          	add	a1,a1,a5
    80005170:	40e686bb          	subw	a3,a3,a4
    80005174:	00f507b3          	add	a5,a0,a5
    80005178:	06e60463          	beq	a2,a4,800051e0 <__memmove+0xfc>
    8000517c:	0005c703          	lbu	a4,0(a1)
    80005180:	00e78023          	sb	a4,0(a5)
    80005184:	04068e63          	beqz	a3,800051e0 <__memmove+0xfc>
    80005188:	0015c603          	lbu	a2,1(a1)
    8000518c:	00100713          	li	a4,1
    80005190:	00c780a3          	sb	a2,1(a5)
    80005194:	04e68663          	beq	a3,a4,800051e0 <__memmove+0xfc>
    80005198:	0025c603          	lbu	a2,2(a1)
    8000519c:	00200713          	li	a4,2
    800051a0:	00c78123          	sb	a2,2(a5)
    800051a4:	02e68e63          	beq	a3,a4,800051e0 <__memmove+0xfc>
    800051a8:	0035c603          	lbu	a2,3(a1)
    800051ac:	00300713          	li	a4,3
    800051b0:	00c781a3          	sb	a2,3(a5)
    800051b4:	02e68663          	beq	a3,a4,800051e0 <__memmove+0xfc>
    800051b8:	0045c603          	lbu	a2,4(a1)
    800051bc:	00400713          	li	a4,4
    800051c0:	00c78223          	sb	a2,4(a5)
    800051c4:	00e68e63          	beq	a3,a4,800051e0 <__memmove+0xfc>
    800051c8:	0055c603          	lbu	a2,5(a1)
    800051cc:	00500713          	li	a4,5
    800051d0:	00c782a3          	sb	a2,5(a5)
    800051d4:	00e68663          	beq	a3,a4,800051e0 <__memmove+0xfc>
    800051d8:	0065c703          	lbu	a4,6(a1)
    800051dc:	00e78323          	sb	a4,6(a5)
    800051e0:	00813403          	ld	s0,8(sp)
    800051e4:	01010113          	addi	sp,sp,16
    800051e8:	00008067          	ret
    800051ec:	02061713          	slli	a4,a2,0x20
    800051f0:	02075713          	srli	a4,a4,0x20
    800051f4:	00e587b3          	add	a5,a1,a4
    800051f8:	f0f574e3          	bgeu	a0,a5,80005100 <__memmove+0x1c>
    800051fc:	02069613          	slli	a2,a3,0x20
    80005200:	02065613          	srli	a2,a2,0x20
    80005204:	fff64613          	not	a2,a2
    80005208:	00e50733          	add	a4,a0,a4
    8000520c:	00c78633          	add	a2,a5,a2
    80005210:	fff7c683          	lbu	a3,-1(a5)
    80005214:	fff78793          	addi	a5,a5,-1
    80005218:	fff70713          	addi	a4,a4,-1
    8000521c:	00d70023          	sb	a3,0(a4)
    80005220:	fec798e3          	bne	a5,a2,80005210 <__memmove+0x12c>
    80005224:	00813403          	ld	s0,8(sp)
    80005228:	01010113          	addi	sp,sp,16
    8000522c:	00008067          	ret
    80005230:	02069713          	slli	a4,a3,0x20
    80005234:	02075713          	srli	a4,a4,0x20
    80005238:	00170713          	addi	a4,a4,1
    8000523c:	00e50733          	add	a4,a0,a4
    80005240:	00050793          	mv	a5,a0
    80005244:	0005c683          	lbu	a3,0(a1)
    80005248:	00178793          	addi	a5,a5,1
    8000524c:	00158593          	addi	a1,a1,1
    80005250:	fed78fa3          	sb	a3,-1(a5)
    80005254:	fee798e3          	bne	a5,a4,80005244 <__memmove+0x160>
    80005258:	f89ff06f          	j	800051e0 <__memmove+0xfc>

000000008000525c <__putc>:
    8000525c:	fe010113          	addi	sp,sp,-32
    80005260:	00813823          	sd	s0,16(sp)
    80005264:	00113c23          	sd	ra,24(sp)
    80005268:	02010413          	addi	s0,sp,32
    8000526c:	00050793          	mv	a5,a0
    80005270:	fef40593          	addi	a1,s0,-17
    80005274:	00100613          	li	a2,1
    80005278:	00000513          	li	a0,0
    8000527c:	fef407a3          	sb	a5,-17(s0)
    80005280:	fffff097          	auipc	ra,0xfffff
    80005284:	b3c080e7          	jalr	-1220(ra) # 80003dbc <console_write>
    80005288:	01813083          	ld	ra,24(sp)
    8000528c:	01013403          	ld	s0,16(sp)
    80005290:	02010113          	addi	sp,sp,32
    80005294:	00008067          	ret

0000000080005298 <__getc>:
    80005298:	fe010113          	addi	sp,sp,-32
    8000529c:	00813823          	sd	s0,16(sp)
    800052a0:	00113c23          	sd	ra,24(sp)
    800052a4:	02010413          	addi	s0,sp,32
    800052a8:	fe840593          	addi	a1,s0,-24
    800052ac:	00100613          	li	a2,1
    800052b0:	00000513          	li	a0,0
    800052b4:	fffff097          	auipc	ra,0xfffff
    800052b8:	ae8080e7          	jalr	-1304(ra) # 80003d9c <console_read>
    800052bc:	fe844503          	lbu	a0,-24(s0)
    800052c0:	01813083          	ld	ra,24(sp)
    800052c4:	01013403          	ld	s0,16(sp)
    800052c8:	02010113          	addi	sp,sp,32
    800052cc:	00008067          	ret

00000000800052d0 <console_handler>:
    800052d0:	fe010113          	addi	sp,sp,-32
    800052d4:	00813823          	sd	s0,16(sp)
    800052d8:	00113c23          	sd	ra,24(sp)
    800052dc:	00913423          	sd	s1,8(sp)
    800052e0:	02010413          	addi	s0,sp,32
    800052e4:	14202773          	csrr	a4,scause
    800052e8:	100027f3          	csrr	a5,sstatus
    800052ec:	0027f793          	andi	a5,a5,2
    800052f0:	06079e63          	bnez	a5,8000536c <console_handler+0x9c>
    800052f4:	00074c63          	bltz	a4,8000530c <console_handler+0x3c>
    800052f8:	01813083          	ld	ra,24(sp)
    800052fc:	01013403          	ld	s0,16(sp)
    80005300:	00813483          	ld	s1,8(sp)
    80005304:	02010113          	addi	sp,sp,32
    80005308:	00008067          	ret
    8000530c:	0ff77713          	andi	a4,a4,255
    80005310:	00900793          	li	a5,9
    80005314:	fef712e3          	bne	a4,a5,800052f8 <console_handler+0x28>
    80005318:	ffffe097          	auipc	ra,0xffffe
    8000531c:	6dc080e7          	jalr	1756(ra) # 800039f4 <plic_claim>
    80005320:	00a00793          	li	a5,10
    80005324:	00050493          	mv	s1,a0
    80005328:	02f50c63          	beq	a0,a5,80005360 <console_handler+0x90>
    8000532c:	fc0506e3          	beqz	a0,800052f8 <console_handler+0x28>
    80005330:	00050593          	mv	a1,a0
    80005334:	00001517          	auipc	a0,0x1
    80005338:	04450513          	addi	a0,a0,68 # 80006378 <CONSOLE_STATUS+0x368>
    8000533c:	fffff097          	auipc	ra,0xfffff
    80005340:	afc080e7          	jalr	-1284(ra) # 80003e38 <__printf>
    80005344:	01013403          	ld	s0,16(sp)
    80005348:	01813083          	ld	ra,24(sp)
    8000534c:	00048513          	mv	a0,s1
    80005350:	00813483          	ld	s1,8(sp)
    80005354:	02010113          	addi	sp,sp,32
    80005358:	ffffe317          	auipc	t1,0xffffe
    8000535c:	6d430067          	jr	1748(t1) # 80003a2c <plic_complete>
    80005360:	fffff097          	auipc	ra,0xfffff
    80005364:	3e0080e7          	jalr	992(ra) # 80004740 <uartintr>
    80005368:	fddff06f          	j	80005344 <console_handler+0x74>
    8000536c:	00001517          	auipc	a0,0x1
    80005370:	10c50513          	addi	a0,a0,268 # 80006478 <digits+0x78>
    80005374:	fffff097          	auipc	ra,0xfffff
    80005378:	a68080e7          	jalr	-1432(ra) # 80003ddc <panic>
	...
