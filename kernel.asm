
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00007117          	auipc	sp,0x7
    80000004:	30813103          	ld	sp,776(sp) # 80007308 <_GLOBAL_OFFSET_TABLE_+0x18>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	0d0030ef          	jal	ra,800030ec <start>

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
    80001184:	505000ef          	jal	ra,80001e88 <interruptRoutine>

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
    800012fc:	01050513          	addi	a0,a0,16
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
	//a2 = pocetna vrednost semafora

	scall();

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
	//a1 = pokazivac na rucku semafora

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
	//a1 = pokazivac na rucku semafora

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
	//a1 = pokazivac na rucku semafora

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
    800015f8:	d7c7b783          	ld	a5,-644(a5) # 80007370 <_ZN9Scheduler4tailE>
    800015fc:	00078e63          	beqz	a5,80001618 <_ZN9Scheduler3putEP3TCB+0x30>
		head = tail = tcb;
	} else {
		tail->nextInScheduler = tcb;
    80001600:	02a7bc23          	sd	a0,56(a5)
		tail = tcb;
    80001604:	00006797          	auipc	a5,0x6
    80001608:	d6a7b623          	sd	a0,-660(a5) # 80007370 <_ZN9Scheduler4tailE>
	}
}
    8000160c:	00813403          	ld	s0,8(sp)
    80001610:	01010113          	addi	sp,sp,16
    80001614:	00008067          	ret
		head = tail = tcb;
    80001618:	00006797          	auipc	a5,0x6
    8000161c:	d5878793          	addi	a5,a5,-680 # 80007370 <_ZN9Scheduler4tailE>
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
    8000163c:	d3870713          	addi	a4,a4,-712 # 80007370 <_ZN9Scheduler4tailE>
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
    8000167c:	d0883803          	ld	a6,-760(a6) # 80007380 <_ZN9Scheduler12sleepingHeadE>
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
    800016b4:	cca7b823          	sd	a0,-816(a5) # 80007380 <_ZN9Scheduler12sleepingHeadE>
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
    800016fc:	c8a7b423          	sd	a0,-888(a5) # 80007380 <_ZN9Scheduler12sleepingHeadE>
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
    80001718:	c6c7b783          	ld	a5,-916(a5) # 80007380 <_ZN9Scheduler12sleepingHeadE>
    8000171c:	06078a63          	beqz	a5,80001790 <_ZN9Scheduler4wakeEv+0x7c>
	sleepingHead->timeToSleep--;
    80001720:	0407b703          	ld	a4,64(a5)
    80001724:	fff70713          	addi	a4,a4,-1
    80001728:	04e7b023          	sd	a4,64(a5)
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    8000172c:	00006517          	auipc	a0,0x6
    80001730:	c5453503          	ld	a0,-940(a0) # 80007380 <_ZN9Scheduler12sleepingHeadE>
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
    80001764:	c2f73023          	sd	a5,-992(a4) # 80007380 <_ZN9Scheduler12sleepingHeadE>
		thread->nextSleeping = nullptr;
    80001768:	04053423          	sd	zero,72(a0)
		Scheduler::put(thread);
    8000176c:	00000097          	auipc	ra,0x0
    80001770:	e7c080e7          	jalr	-388(ra) # 800015e8 <_ZN9Scheduler3putEP3TCB>
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001774:	00006517          	auipc	a0,0x6
    80001778:	c0c53503          	ld	a0,-1012(a0) # 80007380 <_ZN9Scheduler12sleepingHeadE>
    8000177c:	fc051ce3          	bnez	a0,80001754 <_ZN9Scheduler4wakeEv+0x40>
	}
}
    80001780:	00813083          	ld	ra,8(sp)
    80001784:	00013403          	ld	s0,0(sp)
    80001788:	01010113          	addi	sp,sp,16
    8000178c:	00008067          	ret
    80001790:	00008067          	ret

0000000080001794 <main>:



#pragma GCC optimize("O0")

int main() {
    80001794:	f9010113          	addi	sp,sp,-112
    80001798:	06113423          	sd	ra,104(sp)
    8000179c:	06813023          	sd	s0,96(sp)
    800017a0:	04913c23          	sd	s1,88(sp)
    800017a4:	07010413          	addi	s0,sp,112


	//zabrani prekide
	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    800017a8:	00200513          	li	a0,2
    800017ac:	00000097          	auipc	ra,0x0
    800017b0:	604080e7          	jalr	1540(ra) # 80001db0 <_ZN5Riscv10mc_sstatusEm>

	//postavi adresu prekidne rutine u stvec
	Riscv::w_stvec((uint64)&interruptHandler);
    800017b4:	00006797          	auipc	a5,0x6
    800017b8:	b6c7b783          	ld	a5,-1172(a5) # 80007320 <_GLOBAL_OFFSET_TABLE_+0x30>
    800017bc:	00078513          	mv	a0,a5
    800017c0:	00000097          	auipc	ra,0x0
    800017c4:	5b8080e7          	jalr	1464(ra) # 80001d78 <_ZN5Riscv7w_stvecEm>

	sem_open(&semA, 0);
    800017c8:	00000593          	li	a1,0
    800017cc:	00006517          	auipc	a0,0x6
    800017d0:	bbc50513          	addi	a0,a0,-1092 # 80007388 <semA>
    800017d4:	00000097          	auipc	ra,0x0
    800017d8:	cac080e7          	jalr	-852(ra) # 80001480 <_Z8sem_openPP4KSemj>
//	printInteger(*(lista->peekFirst()));
//	delete lista;
//	println("");

	//testiranje kreiranja niti
	thread_t glavnaNit = nullptr;
    800017dc:	fa043823          	sd	zero,-80(s0)
	thread_t nit1 = nullptr;
    800017e0:	fc043c23          	sd	zero,-40(s0)
	thread_t nit2 = nullptr;
    800017e4:	fc043823          	sd	zero,-48(s0)
	thread_t nit3 = nullptr;
    800017e8:	fc043423          	sd	zero,-56(s0)
	thread_t idleNit = nullptr;
    800017ec:	fa043423          	sd	zero,-88(s0)
	thread_create(&glavnaNit, nullptr, nullptr);
    800017f0:	fb040793          	addi	a5,s0,-80
    800017f4:	00000613          	li	a2,0
    800017f8:	00000593          	li	a1,0
    800017fc:	00078513          	mv	a0,a5
    80001800:	00000097          	auipc	ra,0x0
    80001804:	b60080e7          	jalr	-1184(ra) # 80001360 <_Z13thread_createPP3TCBPFvPvES2_>
	TCB::running = glavnaNit;
    80001808:	fb043703          	ld	a4,-80(s0)
    8000180c:	00006797          	auipc	a5,0x6
    80001810:	b047b783          	ld	a5,-1276(a5) # 80007310 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001814:	00e7b023          	sd	a4,0(a5)
	uint64* arg = new uint64;
    80001818:	00800513          	li	a0,8
    8000181c:	00001097          	auipc	ra,0x1
    80001820:	d10080e7          	jalr	-752(ra) # 8000252c <_Znwm>
    80001824:	00050793          	mv	a5,a0
    80001828:	fcf43023          	sd	a5,-64(s0)
	*arg = 666;
    8000182c:	fc043783          	ld	a5,-64(s0)
    80001830:	29a00713          	li	a4,666
    80001834:	00e7b023          	sd	a4,0(a5)
	ThreadQueue* q = new ThreadQueue();
    80001838:	01000513          	li	a0,16
    8000183c:	00000097          	auipc	ra,0x0
    80001840:	5fc080e7          	jalr	1532(ra) # 80001e38 <_ZN11ThreadQueuenwEm>
    80001844:	00050493          	mv	s1,a0
    80001848:	00048513          	mv	a0,s1
    8000184c:	00000097          	auipc	ra,0x0
    80001850:	580080e7          	jalr	1408(ra) # 80001dcc <_ZN11ThreadQueueC1Ev>
    80001854:	fa943c23          	sd	s1,-72(s0)
	q->putLast(nit3);
    80001858:	fc843583          	ld	a1,-56(s0)
    8000185c:	fb843503          	ld	a0,-72(s0)
    80001860:	00000097          	auipc	ra,0x0
    80001864:	9c4080e7          	jalr	-1596(ra) # 80001224 <_ZN11ThreadQueue7putLastEP3TCB>
	q->putLast(nit2);
    80001868:	fd043583          	ld	a1,-48(s0)
    8000186c:	fb843503          	ld	a0,-72(s0)
    80001870:	00000097          	auipc	ra,0x0
    80001874:	9b4080e7          	jalr	-1612(ra) # 80001224 <_ZN11ThreadQueue7putLastEP3TCB>
	q->putLast(nit1);
    80001878:	fd843583          	ld	a1,-40(s0)
    8000187c:	fb843503          	ld	a0,-72(s0)
    80001880:	00000097          	auipc	ra,0x0
    80001884:	9a4080e7          	jalr	-1628(ra) # 80001224 <_ZN11ThreadQueue7putLastEP3TCB>
	thread_t nitred3 = q->getFirst();
    80001888:	fb843503          	ld	a0,-72(s0)
    8000188c:	00000097          	auipc	ra,0x0
    80001890:	a04080e7          	jalr	-1532(ra) # 80001290 <_ZN11ThreadQueue8getFirstEv>
    80001894:	00050793          	mv	a5,a0
    80001898:	faf43023          	sd	a5,-96(s0)
	thread_t nitred2 = q->getFirst();
    8000189c:	fb843503          	ld	a0,-72(s0)
    800018a0:	00000097          	auipc	ra,0x0
    800018a4:	9f0080e7          	jalr	-1552(ra) # 80001290 <_ZN11ThreadQueue8getFirstEv>
    800018a8:	00050793          	mv	a5,a0
    800018ac:	f8f43c23          	sd	a5,-104(s0)
	thread_t nitred1 = q->getFirst();
    800018b0:	fb843503          	ld	a0,-72(s0)
    800018b4:	00000097          	auipc	ra,0x0
    800018b8:	9dc080e7          	jalr	-1572(ra) # 80001290 <_ZN11ThreadQueue8getFirstEv>
    800018bc:	00050793          	mv	a5,a0
    800018c0:	f8f43823          	sd	a5,-112(s0)
	thread_create(&idleNit, idle, nullptr);
    800018c4:	fa840793          	addi	a5,s0,-88
    800018c8:	00000613          	li	a2,0
    800018cc:	00000597          	auipc	a1,0x0
    800018d0:	49058593          	addi	a1,a1,1168 # 80001d5c <_Z4idlePv>
    800018d4:	00078513          	mv	a0,a5
    800018d8:	00000097          	auipc	ra,0x0
    800018dc:	a88080e7          	jalr	-1400(ra) # 80001360 <_Z13thread_createPP3TCBPFvPvES2_>
	thread_create(&nitred1, nit1f, nullptr);
    800018e0:	f9040793          	addi	a5,s0,-112
    800018e4:	00000613          	li	a2,0
    800018e8:	00000597          	auipc	a1,0x0
    800018ec:	0f058593          	addi	a1,a1,240 # 800019d8 <_Z5nit1fPv>
    800018f0:	00078513          	mv	a0,a5
    800018f4:	00000097          	auipc	ra,0x0
    800018f8:	a6c080e7          	jalr	-1428(ra) # 80001360 <_Z13thread_createPP3TCBPFvPvES2_>
	thread_create(&nitred2, nit2f, arg);
    800018fc:	f9840793          	addi	a5,s0,-104
    80001900:	fc043603          	ld	a2,-64(s0)
    80001904:	00000597          	auipc	a1,0x0
    80001908:	1fc58593          	addi	a1,a1,508 # 80001b00 <_Z5nit2fPv>
    8000190c:	00078513          	mv	a0,a5
    80001910:	00000097          	auipc	ra,0x0
    80001914:	a50080e7          	jalr	-1456(ra) # 80001360 <_Z13thread_createPP3TCBPFvPvES2_>
	thread_create(&nitred3, nit3f, nullptr);
    80001918:	fa040793          	addi	a5,s0,-96
    8000191c:	00000613          	li	a2,0
    80001920:	00000597          	auipc	a1,0x0
    80001924:	3a858593          	addi	a1,a1,936 # 80001cc8 <_Z5nit3fPv>
    80001928:	00078513          	mv	a0,a5
    8000192c:	00000097          	auipc	ra,0x0
    80001930:	a34080e7          	jalr	-1484(ra) # 80001360 <_Z13thread_createPP3TCBPFvPvES2_>

	//omoguci prekide
	Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    80001934:	00200513          	li	a0,2
    80001938:	00000097          	auipc	ra,0x0
    8000193c:	45c080e7          	jalr	1116(ra) # 80001d94 <_ZN5Riscv10ms_sstatusEm>

//	while (!nitred1->isFinished() || !nitred2->isFinished()) {
//		thread_dispatch();
//	}
	thread_join(nitred1);
    80001940:	f9043783          	ld	a5,-112(s0)
    80001944:	00078513          	mv	a0,a5
    80001948:	00000097          	auipc	ra,0x0
    8000194c:	ae0080e7          	jalr	-1312(ra) # 80001428 <_Z11thread_joinP3TCB>
	thread_join(nitred2);
    80001950:	f9843783          	ld	a5,-104(s0)
    80001954:	00078513          	mv	a0,a5
    80001958:	00000097          	auipc	ra,0x0
    8000195c:	ad0080e7          	jalr	-1328(ra) # 80001428 <_Z11thread_joinP3TCB>
	thread_join(nitred3);
    80001960:	fa043783          	ld	a5,-96(s0)
    80001964:	00078513          	mv	a0,a5
    80001968:	00000097          	auipc	ra,0x0
    8000196c:	ac0080e7          	jalr	-1344(ra) # 80001428 <_Z11thread_joinP3TCB>

	printString("\nProsao while\n");
    80001970:	00004517          	auipc	a0,0x4
    80001974:	6b050513          	addi	a0,a0,1712 # 80006020 <CONSOLE_STATUS+0x10>
    80001978:	00000097          	auipc	ra,0x0
    8000197c:	c20080e7          	jalr	-992(ra) # 80001598 <_Z11printStringPKc>
	delete q;
    80001980:	fb843483          	ld	s1,-72(s0)
    80001984:	00048e63          	beqz	s1,800019a0 <main+0x20c>
    80001988:	00048513          	mv	a0,s1
    8000198c:	00000097          	auipc	ra,0x0
    80001990:	460080e7          	jalr	1120(ra) # 80001dec <_ZN11ThreadQueueD1Ev>
    80001994:	00048513          	mv	a0,s1
    80001998:	00000097          	auipc	ra,0x0
    8000199c:	4c8080e7          	jalr	1224(ra) # 80001e60 <_ZN11ThreadQueuedlEPv>
	//zabrani prekide
	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    800019a0:	00200513          	li	a0,2
    800019a4:	00000097          	auipc	ra,0x0
    800019a8:	40c080e7          	jalr	1036(ra) # 80001db0 <_ZN5Riscv10mc_sstatusEm>
	printString("\nSad cu da izadjem\n");
    800019ac:	00004517          	auipc	a0,0x4
    800019b0:	68450513          	addi	a0,a0,1668 # 80006030 <CONSOLE_STATUS+0x20>
    800019b4:	00000097          	auipc	ra,0x0
    800019b8:	be4080e7          	jalr	-1052(ra) # 80001598 <_Z11printStringPKc>
//	thread_create(&userHandle, (TCB::Body)userMain, nullptr);
//	while (!userHandle->isFinished()) {
//		thread_dispatch();
//	}
//	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
	return 0;
    800019bc:	00000793          	li	a5,0
    800019c0:	00078513          	mv	a0,a5
    800019c4:	06813083          	ld	ra,104(sp)
    800019c8:	06013403          	ld	s0,96(sp)
    800019cc:	05813483          	ld	s1,88(sp)
    800019d0:	07010113          	addi	sp,sp,112
    800019d4:	00008067          	ret

00000000800019d8 <_Z5nit1fPv>:
void nit1f(void*) {
    800019d8:	fd010113          	addi	sp,sp,-48
    800019dc:	02113423          	sd	ra,40(sp)
    800019e0:	02813023          	sd	s0,32(sp)
    800019e4:	00913c23          	sd	s1,24(sp)
    800019e8:	03010413          	addi	s0,sp,48
	for (int i = 0; i < 8; i++) {
    800019ec:	00000493          	li	s1,0
    800019f0:	00700793          	li	a5,7
    800019f4:	0297ca63          	blt	a5,s1,80001a28 <_Z5nit1fPv+0x50>
		printInteger(5);
    800019f8:	00500513          	li	a0,5
    800019fc:	00000097          	auipc	ra,0x0
    80001a00:	bc4080e7          	jalr	-1084(ra) # 800015c0 <_Z12printIntegerm>
		printString("\n");
    80001a04:	00004517          	auipc	a0,0x4
    80001a08:	64450513          	addi	a0,a0,1604 # 80006048 <CONSOLE_STATUS+0x38>
    80001a0c:	00000097          	auipc	ra,0x0
    80001a10:	b8c080e7          	jalr	-1140(ra) # 80001598 <_Z11printStringPKc>
		time_sleep(50);
    80001a14:	03200513          	li	a0,50
    80001a18:	00000097          	auipc	ra,0x0
    80001a1c:	a38080e7          	jalr	-1480(ra) # 80001450 <_Z10time_sleepm>
	for (int i = 0; i < 8; i++) {
    80001a20:	0014849b          	addiw	s1,s1,1
    80001a24:	fcdff06f          	j	800019f0 <_Z5nit1fPv+0x18>
	printString("\nKraj niti 1\n");
    80001a28:	00004517          	auipc	a0,0x4
    80001a2c:	62850513          	addi	a0,a0,1576 # 80006050 <CONSOLE_STATUS+0x40>
    80001a30:	00000097          	auipc	ra,0x0
    80001a34:	b68080e7          	jalr	-1176(ra) # 80001598 <_Z11printStringPKc>
	thread_exit();
    80001a38:	00000097          	auipc	ra,0x0
    80001a3c:	9a8080e7          	jalr	-1624(ra) # 800013e0 <_Z11thread_exitv>
	printString("\nusao u nit 1\n");
    80001a40:	00004517          	auipc	a0,0x4
    80001a44:	62050513          	addi	a0,a0,1568 # 80006060 <CONSOLE_STATUS+0x50>
    80001a48:	00000097          	auipc	ra,0x0
    80001a4c:	b50080e7          	jalr	-1200(ra) # 80001598 <_Z11printStringPKc>
	__asm__ volatile("li t1, 100");
    80001a50:	06400313          	li	t1,100
	__asm__ volatile("mv %0, t1":"=r"(t1));
    80001a54:	00030793          	mv	a5,t1
    80001a58:	fcf43c23          	sd	a5,-40(s0)
	printString("\nopet u niti 1\n");
    80001a5c:	00004517          	auipc	a0,0x4
    80001a60:	61450513          	addi	a0,a0,1556 # 80006070 <CONSOLE_STATUS+0x60>
    80001a64:	00000097          	auipc	ra,0x0
    80001a68:	b34080e7          	jalr	-1228(ra) # 80001598 <_Z11printStringPKc>
	printString("\nt1 = ");
    80001a6c:	00004517          	auipc	a0,0x4
    80001a70:	61450513          	addi	a0,a0,1556 # 80006080 <CONSOLE_STATUS+0x70>
    80001a74:	00000097          	auipc	ra,0x0
    80001a78:	b24080e7          	jalr	-1244(ra) # 80001598 <_Z11printStringPKc>
	printInteger(t1);
    80001a7c:	fd843503          	ld	a0,-40(s0)
    80001a80:	00000097          	auipc	ra,0x0
    80001a84:	b40080e7          	jalr	-1216(ra) # 800015c0 <_Z12printIntegerm>
	for (int i = 0; i < 1000000; i++) {
    80001a88:	00000493          	li	s1,0
    80001a8c:	0340006f          	j	80001ac0 <_Z5nit1fPv+0xe8>
			printString("Nit1: ");
    80001a90:	00004517          	auipc	a0,0x4
    80001a94:	5f850513          	addi	a0,a0,1528 # 80006088 <CONSOLE_STATUS+0x78>
    80001a98:	00000097          	auipc	ra,0x0
    80001a9c:	b00080e7          	jalr	-1280(ra) # 80001598 <_Z11printStringPKc>
			printInteger(i);
    80001aa0:	00048513          	mv	a0,s1
    80001aa4:	00000097          	auipc	ra,0x0
    80001aa8:	b1c080e7          	jalr	-1252(ra) # 800015c0 <_Z12printIntegerm>
			printString("\n");
    80001aac:	00004517          	auipc	a0,0x4
    80001ab0:	59c50513          	addi	a0,a0,1436 # 80006048 <CONSOLE_STATUS+0x38>
    80001ab4:	00000097          	auipc	ra,0x0
    80001ab8:	ae4080e7          	jalr	-1308(ra) # 80001598 <_Z11printStringPKc>
	for (int i = 0; i < 1000000; i++) {
    80001abc:	0014849b          	addiw	s1,s1,1
    80001ac0:	000f47b7          	lui	a5,0xf4
    80001ac4:	23f78793          	addi	a5,a5,575 # f423f <_entry-0x7ff0bdc1>
    80001ac8:	0097ca63          	blt	a5,s1,80001adc <_Z5nit1fPv+0x104>
		if (i % 1200 == 0) {
    80001acc:	4b000793          	li	a5,1200
    80001ad0:	02f4e7bb          	remw	a5,s1,a5
    80001ad4:	fe0794e3          	bnez	a5,80001abc <_Z5nit1fPv+0xe4>
    80001ad8:	fb9ff06f          	j	80001a90 <_Z5nit1fPv+0xb8>
	printString("\nGotova nit 1\n");
    80001adc:	00004517          	auipc	a0,0x4
    80001ae0:	5b450513          	addi	a0,a0,1460 # 80006090 <CONSOLE_STATUS+0x80>
    80001ae4:	00000097          	auipc	ra,0x0
    80001ae8:	ab4080e7          	jalr	-1356(ra) # 80001598 <_Z11printStringPKc>
}
    80001aec:	02813083          	ld	ra,40(sp)
    80001af0:	02013403          	ld	s0,32(sp)
    80001af4:	01813483          	ld	s1,24(sp)
    80001af8:	03010113          	addi	sp,sp,48
    80001afc:	00008067          	ret

0000000080001b00 <_Z5nit2fPv>:
void nit2f(void* arg2) {
    80001b00:	fd010113          	addi	sp,sp,-48
    80001b04:	02113423          	sd	ra,40(sp)
    80001b08:	02813023          	sd	s0,32(sp)
    80001b0c:	00913c23          	sd	s1,24(sp)
    80001b10:	01213823          	sd	s2,16(sp)
    80001b14:	03010413          	addi	s0,sp,48
    80001b18:	00050913          	mv	s2,a0
	for (int i = 0; i < 10; i++) {
    80001b1c:	00000493          	li	s1,0
    80001b20:	00900793          	li	a5,9
    80001b24:	0497ca63          	blt	a5,s1,80001b78 <_Z5nit2fPv+0x78>
		printInteger(3);
    80001b28:	00300513          	li	a0,3
    80001b2c:	00000097          	auipc	ra,0x0
    80001b30:	a94080e7          	jalr	-1388(ra) # 800015c0 <_Z12printIntegerm>
		printString("\n");
    80001b34:	00004517          	auipc	a0,0x4
    80001b38:	51450513          	addi	a0,a0,1300 # 80006048 <CONSOLE_STATUS+0x38>
    80001b3c:	00000097          	auipc	ra,0x0
    80001b40:	a5c080e7          	jalr	-1444(ra) # 80001598 <_Z11printStringPKc>
		sem_signal(semA);
    80001b44:	00006517          	auipc	a0,0x6
    80001b48:	84453503          	ld	a0,-1980(a0) # 80007388 <semA>
    80001b4c:	00000097          	auipc	ra,0x0
    80001b50:	9cc080e7          	jalr	-1588(ra) # 80001518 <_Z10sem_signalP4KSem>
		printString("Nit 2 salje signal semaforu\n");
    80001b54:	00004517          	auipc	a0,0x4
    80001b58:	54c50513          	addi	a0,a0,1356 # 800060a0 <CONSOLE_STATUS+0x90>
    80001b5c:	00000097          	auipc	ra,0x0
    80001b60:	a3c080e7          	jalr	-1476(ra) # 80001598 <_Z11printStringPKc>
		time_sleep(30);
    80001b64:	01e00513          	li	a0,30
    80001b68:	00000097          	auipc	ra,0x0
    80001b6c:	8e8080e7          	jalr	-1816(ra) # 80001450 <_Z10time_sleepm>
	for (int i = 0; i < 10; i++) {
    80001b70:	0014849b          	addiw	s1,s1,1
    80001b74:	fadff06f          	j	80001b20 <_Z5nit2fPv+0x20>
	sem_close(semA);
    80001b78:	00006517          	auipc	a0,0x6
    80001b7c:	81053503          	ld	a0,-2032(a0) # 80007388 <semA>
    80001b80:	00000097          	auipc	ra,0x0
    80001b84:	938080e7          	jalr	-1736(ra) # 800014b8 <_Z9sem_closeP4KSem>
	printString("\nKraj niti 2\n");
    80001b88:	00004517          	auipc	a0,0x4
    80001b8c:	53850513          	addi	a0,a0,1336 # 800060c0 <CONSOLE_STATUS+0xb0>
    80001b90:	00000097          	auipc	ra,0x0
    80001b94:	a08080e7          	jalr	-1528(ra) # 80001598 <_Z11printStringPKc>
	thread_exit();
    80001b98:	00000097          	auipc	ra,0x0
    80001b9c:	848080e7          	jalr	-1976(ra) # 800013e0 <_Z11thread_exitv>
	printString("\nusao u nit 2\n");
    80001ba0:	00004517          	auipc	a0,0x4
    80001ba4:	53050513          	addi	a0,a0,1328 # 800060d0 <CONSOLE_STATUS+0xc0>
    80001ba8:	00000097          	auipc	ra,0x0
    80001bac:	9f0080e7          	jalr	-1552(ra) # 80001598 <_Z11printStringPKc>
	printInteger(*(uint64*)arg2);
    80001bb0:	00093503          	ld	a0,0(s2)
    80001bb4:	00000097          	auipc	ra,0x0
    80001bb8:	a0c080e7          	jalr	-1524(ra) # 800015c0 <_Z12printIntegerm>
	*(uint64*)arg2 += 10;
    80001bbc:	00093783          	ld	a5,0(s2)
    80001bc0:	00a78793          	addi	a5,a5,10
    80001bc4:	00f93023          	sd	a5,0(s2)
	__asm__ volatile("li t1, 200");
    80001bc8:	0c800313          	li	t1,200
	__asm__ volatile("mv %0, t1":"=r"(t1));
    80001bcc:	00030793          	mv	a5,t1
    80001bd0:	fcf43c23          	sd	a5,-40(s0)
	printString("\nopet u niti 2\n");
    80001bd4:	00004517          	auipc	a0,0x4
    80001bd8:	50c50513          	addi	a0,a0,1292 # 800060e0 <CONSOLE_STATUS+0xd0>
    80001bdc:	00000097          	auipc	ra,0x0
    80001be0:	9bc080e7          	jalr	-1604(ra) # 80001598 <_Z11printStringPKc>
	printString("\nt1 = ");
    80001be4:	00004517          	auipc	a0,0x4
    80001be8:	49c50513          	addi	a0,a0,1180 # 80006080 <CONSOLE_STATUS+0x70>
    80001bec:	00000097          	auipc	ra,0x0
    80001bf0:	9ac080e7          	jalr	-1620(ra) # 80001598 <_Z11printStringPKc>
	printInteger(t1);
    80001bf4:	fd843503          	ld	a0,-40(s0)
    80001bf8:	00000097          	auipc	ra,0x0
    80001bfc:	9c8080e7          	jalr	-1592(ra) # 800015c0 <_Z12printIntegerm>
	printString("\n");
    80001c00:	00004517          	auipc	a0,0x4
    80001c04:	44850513          	addi	a0,a0,1096 # 80006048 <CONSOLE_STATUS+0x38>
    80001c08:	00000097          	auipc	ra,0x0
    80001c0c:	990080e7          	jalr	-1648(ra) # 80001598 <_Z11printStringPKc>
	for (int i = 0; i < 1000000; i++) {
    80001c10:	00000493          	li	s1,0
    80001c14:	0400006f          	j	80001c54 <_Z5nit2fPv+0x154>
			printString("Nit2: ");
    80001c18:	00004517          	auipc	a0,0x4
    80001c1c:	4d850513          	addi	a0,a0,1240 # 800060f0 <CONSOLE_STATUS+0xe0>
    80001c20:	00000097          	auipc	ra,0x0
    80001c24:	978080e7          	jalr	-1672(ra) # 80001598 <_Z11printStringPKc>
			printInteger(i);
    80001c28:	00048513          	mv	a0,s1
    80001c2c:	00000097          	auipc	ra,0x0
    80001c30:	994080e7          	jalr	-1644(ra) # 800015c0 <_Z12printIntegerm>
			printString("\n");
    80001c34:	00004517          	auipc	a0,0x4
    80001c38:	41450513          	addi	a0,a0,1044 # 80006048 <CONSOLE_STATUS+0x38>
    80001c3c:	00000097          	auipc	ra,0x0
    80001c40:	95c080e7          	jalr	-1700(ra) # 80001598 <_Z11printStringPKc>
			time_sleep(20);
    80001c44:	01400513          	li	a0,20
    80001c48:	00000097          	auipc	ra,0x0
    80001c4c:	808080e7          	jalr	-2040(ra) # 80001450 <_Z10time_sleepm>
	for (int i = 0; i < 1000000; i++) {
    80001c50:	0014849b          	addiw	s1,s1,1
    80001c54:	000f47b7          	lui	a5,0xf4
    80001c58:	23f78793          	addi	a5,a5,575 # f423f <_entry-0x7ff0bdc1>
    80001c5c:	0097cc63          	blt	a5,s1,80001c74 <_Z5nit2fPv+0x174>
		if (i % 100000 == 0) {
    80001c60:	000187b7          	lui	a5,0x18
    80001c64:	6a07879b          	addiw	a5,a5,1696
    80001c68:	02f4e7bb          	remw	a5,s1,a5
    80001c6c:	fe0792e3          	bnez	a5,80001c50 <_Z5nit2fPv+0x150>
    80001c70:	fa9ff06f          	j	80001c18 <_Z5nit2fPv+0x118>
	printString("\nPokusavam da ugasim nit 2\n");
    80001c74:	00004517          	auipc	a0,0x4
    80001c78:	48450513          	addi	a0,a0,1156 # 800060f8 <CONSOLE_STATUS+0xe8>
    80001c7c:	00000097          	auipc	ra,0x0
    80001c80:	91c080e7          	jalr	-1764(ra) # 80001598 <_Z11printStringPKc>
	printString("\nNisam uspeo da ugasim nit 2\n");
    80001c84:	00004517          	auipc	a0,0x4
    80001c88:	49450513          	addi	a0,a0,1172 # 80006118 <CONSOLE_STATUS+0x108>
    80001c8c:	00000097          	auipc	ra,0x0
    80001c90:	90c080e7          	jalr	-1780(ra) # 80001598 <_Z11printStringPKc>
	printInteger(*(uint64*)arg2);
    80001c94:	00093503          	ld	a0,0(s2)
    80001c98:	00000097          	auipc	ra,0x0
    80001c9c:	928080e7          	jalr	-1752(ra) # 800015c0 <_Z12printIntegerm>
	printString("\nGotova nit 2\n");
    80001ca0:	00004517          	auipc	a0,0x4
    80001ca4:	49850513          	addi	a0,a0,1176 # 80006138 <CONSOLE_STATUS+0x128>
    80001ca8:	00000097          	auipc	ra,0x0
    80001cac:	8f0080e7          	jalr	-1808(ra) # 80001598 <_Z11printStringPKc>
}
    80001cb0:	02813083          	ld	ra,40(sp)
    80001cb4:	02013403          	ld	s0,32(sp)
    80001cb8:	01813483          	ld	s1,24(sp)
    80001cbc:	01013903          	ld	s2,16(sp)
    80001cc0:	03010113          	addi	sp,sp,48
    80001cc4:	00008067          	ret

0000000080001cc8 <_Z5nit3fPv>:
void nit3f(void*) {
    80001cc8:	fe010113          	addi	sp,sp,-32
    80001ccc:	00113c23          	sd	ra,24(sp)
    80001cd0:	00813823          	sd	s0,16(sp)
    80001cd4:	00913423          	sd	s1,8(sp)
    80001cd8:	02010413          	addi	s0,sp,32
	for (int i = 0; i < 20; i++) {
    80001cdc:	00000493          	li	s1,0
    80001ce0:	0500006f          	j	80001d30 <_Z5nit3fPv+0x68>
		printInteger(i);
    80001ce4:	00048513          	mv	a0,s1
    80001ce8:	00000097          	auipc	ra,0x0
    80001cec:	8d8080e7          	jalr	-1832(ra) # 800015c0 <_Z12printIntegerm>
		printString("\n");
    80001cf0:	00004517          	auipc	a0,0x4
    80001cf4:	35850513          	addi	a0,a0,856 # 80006048 <CONSOLE_STATUS+0x38>
    80001cf8:	00000097          	auipc	ra,0x0
    80001cfc:	8a0080e7          	jalr	-1888(ra) # 80001598 <_Z11printStringPKc>
		sem_wait(semA);
    80001d00:	00005517          	auipc	a0,0x5
    80001d04:	68853503          	ld	a0,1672(a0) # 80007388 <semA>
    80001d08:	fffff097          	auipc	ra,0xfffff
    80001d0c:	7e0080e7          	jalr	2016(ra) # 800014e8 <_Z8sem_waitP4KSem>
		printString("Nit 3 prosla semafor\n");
    80001d10:	00004517          	auipc	a0,0x4
    80001d14:	43850513          	addi	a0,a0,1080 # 80006148 <CONSOLE_STATUS+0x138>
    80001d18:	00000097          	auipc	ra,0x0
    80001d1c:	880080e7          	jalr	-1920(ra) # 80001598 <_Z11printStringPKc>
		time_sleep(10);
    80001d20:	00a00513          	li	a0,10
    80001d24:	fffff097          	auipc	ra,0xfffff
    80001d28:	72c080e7          	jalr	1836(ra) # 80001450 <_Z10time_sleepm>
	for (int i = 0; i < 20; i++) {
    80001d2c:	0014849b          	addiw	s1,s1,1
    80001d30:	01300793          	li	a5,19
    80001d34:	fa97d8e3          	bge	a5,s1,80001ce4 <_Z5nit3fPv+0x1c>
	printString("\nGotova nit3\n");
    80001d38:	00004517          	auipc	a0,0x4
    80001d3c:	42850513          	addi	a0,a0,1064 # 80006160 <CONSOLE_STATUS+0x150>
    80001d40:	00000097          	auipc	ra,0x0
    80001d44:	858080e7          	jalr	-1960(ra) # 80001598 <_Z11printStringPKc>
}
    80001d48:	01813083          	ld	ra,24(sp)
    80001d4c:	01013403          	ld	s0,16(sp)
    80001d50:	00813483          	ld	s1,8(sp)
    80001d54:	02010113          	addi	sp,sp,32
    80001d58:	00008067          	ret

0000000080001d5c <_Z4idlePv>:
void idle(void*){
    80001d5c:	ff010113          	addi	sp,sp,-16
    80001d60:	00113423          	sd	ra,8(sp)
    80001d64:	00813023          	sd	s0,0(sp)
    80001d68:	01010413          	addi	s0,sp,16
		thread_dispatch();
    80001d6c:	fffff097          	auipc	ra,0xfffff
    80001d70:	69c080e7          	jalr	1692(ra) # 80001408 <_Z15thread_dispatchv>
	while(true){
    80001d74:	ff9ff06f          	j	80001d6c <_Z4idlePv+0x10>

0000000080001d78 <_ZN5Riscv7w_stvecEm>:
	uint64 volatile stvec;
	__asm__ volatile("csrr %[stvec], stvec": [stvec] "=r"(stvec));
	return stvec;
}

inline void Riscv::w_stvec(uint64 stvec) {
    80001d78:	ff010113          	addi	sp,sp,-16
    80001d7c:	00813423          	sd	s0,8(sp)
    80001d80:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw stvec, %[stvec]": :[stvec] "r"(stvec));
    80001d84:	10551073          	csrw	stvec,a0
}
    80001d88:	00813403          	ld	s0,8(sp)
    80001d8c:	01010113          	addi	sp,sp,16
    80001d90:	00008067          	ret

0000000080001d94 <_ZN5Riscv10ms_sstatusEm>:

inline void Riscv::w_sip(uint64 sip) {
	__asm__ volatile("csrw sip, %[sip]": :[sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
    80001d94:	ff010113          	addi	sp,sp,-16
    80001d98:	00813423          	sd	s0,8(sp)
    80001d9c:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80001da0:	10052073          	csrs	sstatus,a0
}
    80001da4:	00813403          	ld	s0,8(sp)
    80001da8:	01010113          	addi	sp,sp,16
    80001dac:	00008067          	ret

0000000080001db0 <_ZN5Riscv10mc_sstatusEm>:

inline void Riscv::mc_sstatus(uint64 mask) {
    80001db0:	ff010113          	addi	sp,sp,-16
    80001db4:	00813423          	sd	s0,8(sp)
    80001db8:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80001dbc:	10053073          	csrc	sstatus,a0
}
    80001dc0:	00813403          	ld	s0,8(sp)
    80001dc4:	01010113          	addi	sp,sp,16
    80001dc8:	00008067          	ret

0000000080001dcc <_ZN11ThreadQueueC1Ev>:

	Node* front;
	Node* back;

public:
	ThreadQueue() : front(nullptr), back(nullptr) {}
    80001dcc:	ff010113          	addi	sp,sp,-16
    80001dd0:	00813423          	sd	s0,8(sp)
    80001dd4:	01010413          	addi	s0,sp,16
    80001dd8:	00053023          	sd	zero,0(a0)
    80001ddc:	00053423          	sd	zero,8(a0)
    80001de0:	00813403          	ld	s0,8(sp)
    80001de4:	01010113          	addi	sp,sp,16
    80001de8:	00008067          	ret

0000000080001dec <_ZN11ThreadQueueD1Ev>:

	ThreadQueue(const ThreadQueue&) = delete;

	ThreadQueue& operator=(const ThreadQueue&) = delete;

	~ThreadQueue() {
    80001dec:	fe010113          	addi	sp,sp,-32
    80001df0:	00113c23          	sd	ra,24(sp)
    80001df4:	00813823          	sd	s0,16(sp)
    80001df8:	00913423          	sd	s1,8(sp)
    80001dfc:	02010413          	addi	s0,sp,32
    80001e00:	00050493          	mv	s1,a0
			delete node;
		}
	}

	bool isEmpty() const {
		return front == nullptr;
    80001e04:	0004b503          	ld	a0,0(s1)
		while (!isEmpty()) {
    80001e08:	00050e63          	beqz	a0,80001e24 <_ZN11ThreadQueueD1Ev+0x38>
			front = front->next;
    80001e0c:	00853783          	ld	a5,8(a0)
    80001e10:	00f4b023          	sd	a5,0(s1)
			delete node;
    80001e14:	fe0508e3          	beqz	a0,80001e04 <_ZN11ThreadQueueD1Ev+0x18>
			mem_free(ptr);
    80001e18:	fffff097          	auipc	ra,0xfffff
    80001e1c:	518080e7          	jalr	1304(ra) # 80001330 <_Z8mem_freePv>
		}
    80001e20:	fe5ff06f          	j	80001e04 <_ZN11ThreadQueueD1Ev+0x18>
	}
    80001e24:	01813083          	ld	ra,24(sp)
    80001e28:	01013403          	ld	s0,16(sp)
    80001e2c:	00813483          	ld	s1,8(sp)
    80001e30:	02010113          	addi	sp,sp,32
    80001e34:	00008067          	ret

0000000080001e38 <_ZN11ThreadQueuenwEm>:
	void putLast(TCB* tcb);

	TCB* getFirst();

	// Overriding new and delete operators for ThreadQueue
	static void* operator new(size_t size) {
    80001e38:	ff010113          	addi	sp,sp,-16
    80001e3c:	00113423          	sd	ra,8(sp)
    80001e40:	00813023          	sd	s0,0(sp)
    80001e44:	01010413          	addi	s0,sp,16
		return mem_alloc(size);
    80001e48:	fffff097          	auipc	ra,0xfffff
    80001e4c:	4a8080e7          	jalr	1192(ra) # 800012f0 <_Z9mem_allocm>
	}
    80001e50:	00813083          	ld	ra,8(sp)
    80001e54:	00013403          	ld	s0,0(sp)
    80001e58:	01010113          	addi	sp,sp,16
    80001e5c:	00008067          	ret

0000000080001e60 <_ZN11ThreadQueuedlEPv>:

	static void operator delete(void* ptr) {
    80001e60:	ff010113          	addi	sp,sp,-16
    80001e64:	00113423          	sd	ra,8(sp)
    80001e68:	00813023          	sd	s0,0(sp)
    80001e6c:	01010413          	addi	s0,sp,16
		mem_free(ptr);
    80001e70:	fffff097          	auipc	ra,0xfffff
    80001e74:	4c0080e7          	jalr	1216(ra) # 80001330 <_Z8mem_freePv>
	}
    80001e78:	00813083          	ld	ra,8(sp)
    80001e7c:	00013403          	ld	s0,0(sp)
    80001e80:	01010113          	addi	sp,sp,16
    80001e84:	00008067          	ret

0000000080001e88 <interruptRoutine>:
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"
#include "../h/KSem.hpp"

#pragma GCC optimize("O0")
extern "C" void interruptRoutine() {
    80001e88:	ef010113          	addi	sp,sp,-272
    80001e8c:	10113423          	sd	ra,264(sp)
    80001e90:	10813023          	sd	s0,256(sp)
    80001e94:	11010413          	addi	s0,sp,272
	uint64 scause, sepc, sstatus;
	__asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001e98:	14202373          	csrr	t1,scause
    80001e9c:	fc643c23          	sd	t1,-40(s0)
	__asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001ea0:	14102373          	csrr	t1,sepc
    80001ea4:	fc643823          	sd	t1,-48(s0)
	__asm__ volatile("csrr %[status], sstatus":[status] "=r"(
			sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001ea8:	10002373          	csrr	t1,sstatus
    80001eac:	fc643423          	sd	t1,-56(s0)
	uint64 a0, a1, a2, a3, a4, a5, a6, a7;
	__asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001eb0:	00050313          	mv	t1,a0
    80001eb4:	fc643023          	sd	t1,-64(s0)
	__asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001eb8:	00058313          	mv	t1,a1
    80001ebc:	fa643c23          	sd	t1,-72(s0)
	__asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001ec0:	00060313          	mv	t1,a2
    80001ec4:	fa643823          	sd	t1,-80(s0)
	__asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001ec8:	00068313          	mv	t1,a3
    80001ecc:	fa643423          	sd	t1,-88(s0)
	__asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001ed0:	00070313          	mv	t1,a4
    80001ed4:	fa643023          	sd	t1,-96(s0)
	__asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001ed8:	00078313          	mv	t1,a5
    80001edc:	f8643c23          	sd	t1,-104(s0)
	__asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001ee0:	00080313          	mv	t1,a6
    80001ee4:	f8643823          	sd	t1,-112(s0)
	__asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001ee8:	00088313          	mv	t1,a7
    80001eec:	f8643423          	sd	t1,-120(s0)

	if (scause == 0x09 || scause == 0x08) {
    80001ef0:	fd843703          	ld	a4,-40(s0)
    80001ef4:	00900793          	li	a5,9
    80001ef8:	00f70863          	beq	a4,a5,80001f08 <interruptRoutine+0x80>
    80001efc:	fd843703          	ld	a4,-40(s0)
    80001f00:	00800793          	li	a5,8
    80001f04:	44f71263          	bne	a4,a5,80002348 <interruptRoutine+0x4c0>
		//prekid zbog poziva ecall
		uint64 opCode = a0;
    80001f08:	fc043783          	ld	a5,-64(s0)
    80001f0c:	f8f43023          	sd	a5,-128(s0)
		switch (opCode) {
    80001f10:	f8043703          	ld	a4,-128(s0)
    80001f14:	09100793          	li	a5,145
    80001f18:	2cf70063          	beq	a4,a5,800021d8 <interruptRoutine+0x350>
    80001f1c:	f8043703          	ld	a4,-128(s0)
    80001f20:	09100793          	li	a5,145
    80001f24:	38e7ee63          	bltu	a5,a4,800022c0 <interruptRoutine+0x438>
    80001f28:	f8043703          	ld	a4,-128(s0)
    80001f2c:	04200793          	li	a5,66
    80001f30:	04e7e263          	bltu	a5,a4,80001f74 <interruptRoutine+0xec>
    80001f34:	f8043783          	ld	a5,-128(s0)
    80001f38:	38078463          	beqz	a5,800022c0 <interruptRoutine+0x438>
    80001f3c:	f8043703          	ld	a4,-128(s0)
    80001f40:	04200793          	li	a5,66
    80001f44:	36e7ee63          	bltu	a5,a4,800022c0 <interruptRoutine+0x438>
    80001f48:	f8043783          	ld	a5,-128(s0)
    80001f4c:	00279713          	slli	a4,a5,0x2
    80001f50:	00004797          	auipc	a5,0x4
    80001f54:	27c78793          	addi	a5,a5,636 # 800061cc <CONSOLE_STATUS+0x1bc>
    80001f58:	00f707b3          	add	a5,a4,a5
    80001f5c:	0007a783          	lw	a5,0(a5)
    80001f60:	0007871b          	sext.w	a4,a5
    80001f64:	00004797          	auipc	a5,0x4
    80001f68:	26878793          	addi	a5,a5,616 # 800061cc <CONSOLE_STATUS+0x1bc>
    80001f6c:	00f707b3          	add	a5,a4,a5
    80001f70:	00078067          	jr	a5
    80001f74:	f8043703          	ld	a4,-128(s0)
    80001f78:	09000793          	li	a5,144
    80001f7c:	22f70263          	beq	a4,a5,800021a0 <interruptRoutine+0x318>
    80001f80:	3400006f          	j	800022c0 <interruptRoutine+0x438>
			case 0x01:
				//mem_alloc
				size_t size;
				size = (size_t)a1;
    80001f84:	fb843783          	ld	a5,-72(s0)
    80001f88:	f0f43423          	sd	a5,-248(s0)
				//__asm__ volatile("mv %[size], a1":[size] "=r"(size));
				size = size * MEM_BLOCK_SIZE;
    80001f8c:	f0843783          	ld	a5,-248(s0)
    80001f90:	00679793          	slli	a5,a5,0x6
    80001f94:	f0f43423          	sd	a5,-248(s0)
				MemoryAllocator::kmalloc(size);
    80001f98:	f0843503          	ld	a0,-248(s0)
    80001f9c:	00001097          	auipc	ra,0x1
    80001fa0:	bb0080e7          	jalr	-1104(ra) # 80002b4c <_ZN15MemoryAllocator7kmallocEm>
				__asm__ volatile("sd a0, 80(s0)");
    80001fa4:	04a43823          	sd	a0,80(s0)
				break;
    80001fa8:	3840006f          	j	8000232c <interruptRoutine+0x4a4>
			case 0x02:
				//mem_free
				void* ptr;
				ptr = (void*)a1;
    80001fac:	fb843783          	ld	a5,-72(s0)
    80001fb0:	f0f43823          	sd	a5,-240(s0)
				//__asm__ volatile("mv %[ptr], a1" :[ptr]"=r"(ptr));
				MemoryAllocator::kfree(ptr);
    80001fb4:	f1043503          	ld	a0,-240(s0)
    80001fb8:	00001097          	auipc	ra,0x1
    80001fbc:	d3c080e7          	jalr	-708(ra) # 80002cf4 <_ZN15MemoryAllocator5kfreeEPv>
				__asm__ volatile("sd a0, 80(s0)");
    80001fc0:	04a43823          	sd	a0,80(s0)
				break;
    80001fc4:	3680006f          	j	8000232c <interruptRoutine+0x4a4>
			case 0x11:
				//thread_create
				thread_t* handle;
				handle = (thread_t*)a1;
    80001fc8:	fb843783          	ld	a5,-72(s0)
    80001fcc:	f2f43823          	sd	a5,-208(s0)
				void (* function)(void*);
				function = (void (*)(void*))a2;
    80001fd0:	fb043783          	ld	a5,-80(s0)
    80001fd4:	f2f43423          	sd	a5,-216(s0)
				void* args;
				args = (void*)a3;
    80001fd8:	fa843783          	ld	a5,-88(s0)
    80001fdc:	f2f43023          	sd	a5,-224(s0)
				uint64* sp;
				sp = (uint64*)a4;
    80001fe0:	fa043783          	ld	a5,-96(s0)
    80001fe4:	f0f43c23          	sd	a5,-232(s0)

				*handle = TCB::createThread(function, args, sp);
    80001fe8:	f1843603          	ld	a2,-232(s0)
    80001fec:	f2043583          	ld	a1,-224(s0)
    80001ff0:	f2843503          	ld	a0,-216(s0)
    80001ff4:	00001097          	auipc	ra,0x1
    80001ff8:	998080e7          	jalr	-1640(ra) # 8000298c <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80001ffc:	00050713          	mv	a4,a0
    80002000:	f3043783          	ld	a5,-208(s0)
    80002004:	00e7b023          	sd	a4,0(a5)
				if (*handle != nullptr) {
    80002008:	f3043783          	ld	a5,-208(s0)
    8000200c:	0007b783          	ld	a5,0(a5)
    80002010:	00078663          	beqz	a5,8000201c <interruptRoutine+0x194>
					__asm__ volatile("li a0, 0");
    80002014:	00000513          	li	a0,0
    80002018:	0080006f          	j	80002020 <interruptRoutine+0x198>
				} else {
					__asm__ volatile("li a0, -1");
    8000201c:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    80002020:	04a43823          	sd	a0,80(s0)
				break;
    80002024:	3080006f          	j	8000232c <interruptRoutine+0x4a4>
			case 0x12:
				//thread_exit
				TCB::running->setFinished(true);
    80002028:	00005797          	auipc	a5,0x5
    8000202c:	2e87b783          	ld	a5,744(a5) # 80007310 <_GLOBAL_OFFSET_TABLE_+0x20>
    80002030:	0007b783          	ld	a5,0(a5)
    80002034:	00100593          	li	a1,1
    80002038:	00078513          	mv	a0,a5
    8000203c:	00000097          	auipc	ra,0x0
    80002040:	488080e7          	jalr	1160(ra) # 800024c4 <_ZN3TCB11setFinishedEb>
				TCB::releaseJoined();
    80002044:	00001097          	auipc	ra,0x1
    80002048:	a8c080e7          	jalr	-1396(ra) # 80002ad0 <_ZN3TCB13releaseJoinedEv>
				TCB::yield();
    8000204c:	00001097          	auipc	ra,0x1
    80002050:	8dc080e7          	jalr	-1828(ra) # 80002928 <_ZN3TCB5yieldEv>
				break;
    80002054:	2d80006f          	j	8000232c <interruptRoutine+0x4a4>
			case 0x13:
				//thread_dispatch
				TCB::yield();
    80002058:	00001097          	auipc	ra,0x1
    8000205c:	8d0080e7          	jalr	-1840(ra) # 80002928 <_ZN3TCB5yieldEv>
				break;
    80002060:	2cc0006f          	j	8000232c <interruptRoutine+0x4a4>
			case 0x14:
				//thread_join
				thread_t handleToJoin;
				handleToJoin = (thread_t)a1;
    80002064:	fb843783          	ld	a5,-72(s0)
    80002068:	f2f43c23          	sd	a5,-200(s0)
				TCB::threadJoin(handleToJoin);
    8000206c:	f3843503          	ld	a0,-200(s0)
    80002070:	00001097          	auipc	ra,0x1
    80002074:	a18080e7          	jalr	-1512(ra) # 80002a88 <_ZN3TCB10threadJoinEPS_>
				TCB::yield();
    80002078:	00001097          	auipc	ra,0x1
    8000207c:	8b0080e7          	jalr	-1872(ra) # 80002928 <_ZN3TCB5yieldEv>
				break;
    80002080:	2ac0006f          	j	8000232c <interruptRoutine+0x4a4>
			case 0x21:
				//sem_open
				sem_t* semHandle;
				semHandle = (sem_t*)a1;
    80002084:	fb843783          	ld	a5,-72(s0)
    80002088:	f4f43423          	sd	a5,-184(s0)
				uint initVal;
				initVal = (uint)a2;
    8000208c:	fb043783          	ld	a5,-80(s0)
    80002090:	f4f42223          	sw	a5,-188(s0)
				*semHandle = KSem::initSem(initVal);
    80002094:	f4442783          	lw	a5,-188(s0)
    80002098:	00078513          	mv	a0,a5
    8000209c:	00001097          	auipc	ra,0x1
    800020a0:	dcc080e7          	jalr	-564(ra) # 80002e68 <_ZN4KSem7initSemEj>
    800020a4:	00050713          	mv	a4,a0
    800020a8:	f4843783          	ld	a5,-184(s0)
    800020ac:	00e7b023          	sd	a4,0(a5)
				if (*semHandle != nullptr) {
    800020b0:	f4843783          	ld	a5,-184(s0)
    800020b4:	0007b783          	ld	a5,0(a5)
    800020b8:	00078663          	beqz	a5,800020c4 <interruptRoutine+0x23c>
					__asm__ volatile("li a0, 0");
    800020bc:	00000513          	li	a0,0
    800020c0:	0080006f          	j	800020c8 <interruptRoutine+0x240>
				} else {
					__asm__ volatile("li a0, -1");
    800020c4:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    800020c8:	04a43823          	sd	a0,80(s0)
				break;
    800020cc:	2600006f          	j	8000232c <interruptRoutine+0x4a4>
			case 0x22:
				//sem_close
				sem_t closeHandle;
				closeHandle = (sem_t)a1;
    800020d0:	fb843783          	ld	a5,-72(s0)
    800020d4:	f4f43823          	sd	a5,-176(s0)
				KSem::closeSem(closeHandle);
    800020d8:	f5043503          	ld	a0,-176(s0)
    800020dc:	00001097          	auipc	ra,0x1
    800020e0:	ee4080e7          	jalr	-284(ra) # 80002fc0 <_ZN4KSem8closeSemEPS_>
				__asm__ volatile("sd a0, 80(s0)");
    800020e4:	04a43823          	sd	a0,80(s0)
				break;
    800020e8:	2440006f          	j	8000232c <interruptRoutine+0x4a4>
			case 0x23:
				//sem_wait
				sem_t waitHandle;
				waitHandle = (sem_t)a1;
    800020ec:	fb843783          	ld	a5,-72(s0)
    800020f0:	f4f43c23          	sd	a5,-168(s0)
				waitHandle->wait();
    800020f4:	f5843503          	ld	a0,-168(s0)
    800020f8:	00001097          	auipc	ra,0x1
    800020fc:	e04080e7          	jalr	-508(ra) # 80002efc <_ZN4KSem4waitEv>
				__asm__ volatile("sd a0, 80(s0)");
    80002100:	04a43823          	sd	a0,80(s0)
				break;
    80002104:	2280006f          	j	8000232c <interruptRoutine+0x4a4>
			case 0x24:
				//sem_signal
				sem_t signalHandle;
				signalHandle = (sem_t)a1;
    80002108:	fb843783          	ld	a5,-72(s0)
    8000210c:	f6f43023          	sd	a5,-160(s0)
				signalHandle->signal();
    80002110:	f6043503          	ld	a0,-160(s0)
    80002114:	00001097          	auipc	ra,0x1
    80002118:	e68080e7          	jalr	-408(ra) # 80002f7c <_ZN4KSem6signalEv>
				__asm__ volatile("sd a0, 80(s0)");
    8000211c:	04a43823          	sd	a0,80(s0)
				break;
    80002120:	20c0006f          	j	8000232c <interruptRoutine+0x4a4>
			case 0x31:
				//time_sleep
				time_t timerPeriods;
				timerPeriods = (time_t)a1;
    80002124:	fb843783          	ld	a5,-72(s0)
    80002128:	f6f43423          	sd	a5,-152(s0)
				if (timerPeriods > 0) {
    8000212c:	f6843783          	ld	a5,-152(s0)
    80002130:	00078663          	beqz	a5,8000213c <interruptRoutine+0x2b4>
					__asm__ volatile("li a0, 0");
    80002134:	00000513          	li	a0,0
    80002138:	0080006f          	j	80002140 <interruptRoutine+0x2b8>
				} else {
					__asm__ volatile("li a0, -1");
    8000213c:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    80002140:	04a43823          	sd	a0,80(s0)
				if (timerPeriods > 0) {
    80002144:	f6843783          	ld	a5,-152(s0)
    80002148:	1c078863          	beqz	a5,80002318 <interruptRoutine+0x490>
					Scheduler::putToSleep(TCB::running, timerPeriods);
    8000214c:	00005797          	auipc	a5,0x5
    80002150:	1c47b783          	ld	a5,452(a5) # 80007310 <_GLOBAL_OFFSET_TABLE_+0x20>
    80002154:	0007b783          	ld	a5,0(a5)
    80002158:	f6843583          	ld	a1,-152(s0)
    8000215c:	00078513          	mv	a0,a5
    80002160:	fffff097          	auipc	ra,0xfffff
    80002164:	50c080e7          	jalr	1292(ra) # 8000166c <_ZN9Scheduler10putToSleepEP3TCBm>
					TCB::yield();
    80002168:	00000097          	auipc	ra,0x0
    8000216c:	7c0080e7          	jalr	1984(ra) # 80002928 <_ZN3TCB5yieldEv>
				}
				break;
    80002170:	1a80006f          	j	80002318 <interruptRoutine+0x490>
			case 0x41:
				//getc
				__getc();
    80002174:	00003097          	auipc	ra,0x3
    80002178:	074080e7          	jalr	116(ra) # 800051e8 <__getc>
				__asm__ volatile("sd a0, 80(s0)");
    8000217c:	04a43823          	sd	a0,80(s0)
				break;
    80002180:	1ac0006f          	j	8000232c <interruptRoutine+0x4a4>
			case 0x42:
				//putc
				char c;
				c = (char)a1;
    80002184:	fb843783          	ld	a5,-72(s0)
    80002188:	f6f409a3          	sb	a5,-141(s0)
				__putc(c);
    8000218c:	f7344783          	lbu	a5,-141(s0)
    80002190:	00078513          	mv	a0,a5
    80002194:	00003097          	auipc	ra,0x3
    80002198:	018080e7          	jalr	24(ra) # 800051ac <__putc>
				break;
    8000219c:	1900006f          	j	8000232c <interruptRoutine+0x4a4>
			case 0x90:
				//printString
				const char* string;
				string = (const char*)a1;
    800021a0:	fb843783          	ld	a5,-72(s0)
    800021a4:	fef43423          	sd	a5,-24(s0)
				while (*string != '\0') {
    800021a8:	fe843783          	ld	a5,-24(s0)
    800021ac:	0007c783          	lbu	a5,0(a5)
    800021b0:	16078863          	beqz	a5,80002320 <interruptRoutine+0x498>
					__putc(*string);
    800021b4:	fe843783          	ld	a5,-24(s0)
    800021b8:	0007c783          	lbu	a5,0(a5)
    800021bc:	00078513          	mv	a0,a5
    800021c0:	00003097          	auipc	ra,0x3
    800021c4:	fec080e7          	jalr	-20(ra) # 800051ac <__putc>
					string++;
    800021c8:	fe843783          	ld	a5,-24(s0)
    800021cc:	00178793          	addi	a5,a5,1
    800021d0:	fef43423          	sd	a5,-24(s0)
				while (*string != '\0') {
    800021d4:	fd5ff06f          	j	800021a8 <interruptRoutine+0x320>
				}
				break;
			case 0x91:
				//printInteger
				uint64 integer;
				integer = a1;
    800021d8:	fb843783          	ld	a5,-72(s0)
    800021dc:	f6f43c23          	sd	a5,-136(s0)
				static char digits[] = "0123456789";
				char buf[16];
				int i, neg;
				uint x;

				neg = 0;
    800021e0:	f6042a23          	sw	zero,-140(s0)
				if (integer < 0) {
					neg = 1;
					x = -integer;
				} else {
					x = integer;
    800021e4:	f7843783          	ld	a5,-136(s0)
    800021e8:	fef42023          	sw	a5,-32(s0)
				}

				i = 0;
    800021ec:	fe042223          	sw	zero,-28(s0)
				do {
					buf[i++] = digits[x % 10];
    800021f0:	fe042703          	lw	a4,-32(s0)
    800021f4:	00a00793          	li	a5,10
    800021f8:	02f777bb          	remuw	a5,a4,a5
    800021fc:	0007861b          	sext.w	a2,a5
    80002200:	fe442783          	lw	a5,-28(s0)
    80002204:	0017871b          	addiw	a4,a5,1
    80002208:	fee42223          	sw	a4,-28(s0)
    8000220c:	00005697          	auipc	a3,0x5
    80002210:	05c68693          	addi	a3,a3,92 # 80007268 <_ZZ16interruptRoutineE6digits>
    80002214:	02061713          	slli	a4,a2,0x20
    80002218:	02075713          	srli	a4,a4,0x20
    8000221c:	00e68733          	add	a4,a3,a4
    80002220:	00074703          	lbu	a4,0(a4)
    80002224:	ff040693          	addi	a3,s0,-16
    80002228:	00f687b3          	add	a5,a3,a5
    8000222c:	f0e78423          	sb	a4,-248(a5)
				} while ((x /= 10) != 0);
    80002230:	fe042703          	lw	a4,-32(s0)
    80002234:	00a00793          	li	a5,10
    80002238:	02f757bb          	divuw	a5,a4,a5
    8000223c:	fef42023          	sw	a5,-32(s0)
    80002240:	fe042783          	lw	a5,-32(s0)
    80002244:	0007879b          	sext.w	a5,a5
    80002248:	00f037b3          	snez	a5,a5
    8000224c:	0ff7f793          	andi	a5,a5,255
    80002250:	00078463          	beqz	a5,80002258 <interruptRoutine+0x3d0>
				do {
    80002254:	f9dff06f          	j	800021f0 <interruptRoutine+0x368>
				if (neg) buf[i++] = '-';
    80002258:	f7442783          	lw	a5,-140(s0)
    8000225c:	0007879b          	sext.w	a5,a5
    80002260:	02078063          	beqz	a5,80002280 <interruptRoutine+0x3f8>
    80002264:	fe442783          	lw	a5,-28(s0)
    80002268:	0017871b          	addiw	a4,a5,1
    8000226c:	fee42223          	sw	a4,-28(s0)
    80002270:	ff040713          	addi	a4,s0,-16
    80002274:	00f707b3          	add	a5,a4,a5
    80002278:	02d00713          	li	a4,45
    8000227c:	f0e78423          	sb	a4,-248(a5)

				while (--i >= 0) {
    80002280:	fe442783          	lw	a5,-28(s0)
    80002284:	fff7879b          	addiw	a5,a5,-1
    80002288:	fef42223          	sw	a5,-28(s0)
    8000228c:	fe442783          	lw	a5,-28(s0)
    80002290:	fff7c793          	not	a5,a5
    80002294:	01f7d79b          	srliw	a5,a5,0x1f
    80002298:	0ff7f793          	andi	a5,a5,255
    8000229c:	08078663          	beqz	a5,80002328 <interruptRoutine+0x4a0>
					__putc(buf[i]);
    800022a0:	fe442783          	lw	a5,-28(s0)
    800022a4:	ff040713          	addi	a4,s0,-16
    800022a8:	00f707b3          	add	a5,a4,a5
    800022ac:	f087c783          	lbu	a5,-248(a5)
    800022b0:	00078513          	mv	a0,a5
    800022b4:	00003097          	auipc	ra,0x3
    800022b8:	ef8080e7          	jalr	-264(ra) # 800051ac <__putc>
				while (--i >= 0) {
    800022bc:	fc5ff06f          	j	80002280 <interruptRoutine+0x3f8>
				}
				break;
			default:
				printString("\nNepostojeci op code: ");
    800022c0:	00004517          	auipc	a0,0x4
    800022c4:	eb050513          	addi	a0,a0,-336 # 80006170 <CONSOLE_STATUS+0x160>
    800022c8:	fffff097          	auipc	ra,0xfffff
    800022cc:	2d0080e7          	jalr	720(ra) # 80001598 <_Z11printStringPKc>
				printInteger(opCode);
    800022d0:	f8043503          	ld	a0,-128(s0)
    800022d4:	fffff097          	auipc	ra,0xfffff
    800022d8:	2ec080e7          	jalr	748(ra) # 800015c0 <_Z12printIntegerm>
				printString("\nscause: ");
    800022dc:	00004517          	auipc	a0,0x4
    800022e0:	eac50513          	addi	a0,a0,-340 # 80006188 <CONSOLE_STATUS+0x178>
    800022e4:	fffff097          	auipc	ra,0xfffff
    800022e8:	2b4080e7          	jalr	692(ra) # 80001598 <_Z11printStringPKc>
				printInteger(scause);
    800022ec:	fd843503          	ld	a0,-40(s0)
    800022f0:	fffff097          	auipc	ra,0xfffff
    800022f4:	2d0080e7          	jalr	720(ra) # 800015c0 <_Z12printIntegerm>
				printString("\nsepc: ");
    800022f8:	00004517          	auipc	a0,0x4
    800022fc:	ea050513          	addi	a0,a0,-352 # 80006198 <CONSOLE_STATUS+0x188>
    80002300:	fffff097          	auipc	ra,0xfffff
    80002304:	298080e7          	jalr	664(ra) # 80001598 <_Z11printStringPKc>
				printInteger(sepc);
    80002308:	fd043503          	ld	a0,-48(s0)
    8000230c:	fffff097          	auipc	ra,0xfffff
    80002310:	2b4080e7          	jalr	692(ra) # 800015c0 <_Z12printIntegerm>
				break;
    80002314:	0180006f          	j	8000232c <interruptRoutine+0x4a4>
				break;
    80002318:	00000013          	nop
    8000231c:	0100006f          	j	8000232c <interruptRoutine+0x4a4>
				break;
    80002320:	00000013          	nop
    80002324:	0080006f          	j	8000232c <interruptRoutine+0x4a4>
				break;
    80002328:	00000013          	nop
		}
		//sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
		//sepc += 4;
		__asm__ volatile("addi %[dst], %[src], 0x4":[dst]"=r"(sepc):[src]"r"(
				sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000232c:	fd043303          	ld	t1,-48(s0)
    80002330:	00430313          	addi	t1,t1,4
    80002334:	fc643823          	sd	t1,-48(s0)
		__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002338:	fd043303          	ld	t1,-48(s0)
    8000233c:	14131073          	csrw	sepc,t1
    80002340:	00000013          	nop
		printString("scause: ");
		printInteger(scause);
		printString("\nsepc: ");
		printInteger(sepc);
	}
}
    80002344:	1180006f          	j	8000245c <interruptRoutine+0x5d4>
	} else if (scause == (1UL << 63 | 9)) {
    80002348:	fd843703          	ld	a4,-40(s0)
    8000234c:	fff00793          	li	a5,-1
    80002350:	03f79793          	slli	a5,a5,0x3f
    80002354:	00978793          	addi	a5,a5,9
    80002358:	00f71863          	bne	a4,a5,80002368 <interruptRoutine+0x4e0>
		console_handler();
    8000235c:	00003097          	auipc	ra,0x3
    80002360:	ec4080e7          	jalr	-316(ra) # 80005220 <console_handler>
}
    80002364:	0f80006f          	j	8000245c <interruptRoutine+0x5d4>
	} else if (scause == (1UL << 63 | 1)) {
    80002368:	fd843703          	ld	a4,-40(s0)
    8000236c:	fff00793          	li	a5,-1
    80002370:	03f79793          	slli	a5,a5,0x3f
    80002374:	00178793          	addi	a5,a5,1
    80002378:	08f71e63          	bne	a4,a5,80002414 <interruptRoutine+0x58c>
		Scheduler::wake();
    8000237c:	fffff097          	auipc	ra,0xfffff
    80002380:	398080e7          	jalr	920(ra) # 80001714 <_ZN9Scheduler4wakeEv>
		TCB::runningTimeSlice++;
    80002384:	00005797          	auipc	a5,0x5
    80002388:	f747b783          	ld	a5,-140(a5) # 800072f8 <_GLOBAL_OFFSET_TABLE_+0x8>
    8000238c:	0007b783          	ld	a5,0(a5)
    80002390:	00178713          	addi	a4,a5,1
    80002394:	00005797          	auipc	a5,0x5
    80002398:	f647b783          	ld	a5,-156(a5) # 800072f8 <_GLOBAL_OFFSET_TABLE_+0x8>
    8000239c:	00e7b023          	sd	a4,0(a5)
		if (TCB::runningTimeSlice >= TCB::running->getTimeSlice()) {
    800023a0:	00005797          	auipc	a5,0x5
    800023a4:	f707b783          	ld	a5,-144(a5) # 80007310 <_GLOBAL_OFFSET_TABLE_+0x20>
    800023a8:	0007b783          	ld	a5,0(a5)
    800023ac:	00078513          	mv	a0,a5
    800023b0:	00000097          	auipc	ra,0x0
    800023b4:	130080e7          	jalr	304(ra) # 800024e0 <_ZN3TCB12getTimeSliceEv>
    800023b8:	00050713          	mv	a4,a0
    800023bc:	00005797          	auipc	a5,0x5
    800023c0:	f3c7b783          	ld	a5,-196(a5) # 800072f8 <_GLOBAL_OFFSET_TABLE_+0x8>
    800023c4:	0007b783          	ld	a5,0(a5)
    800023c8:	00e7b7b3          	sltu	a5,a5,a4
    800023cc:	0017c793          	xori	a5,a5,1
    800023d0:	0ff7f793          	andi	a5,a5,255
    800023d4:	00078c63          	beqz	a5,800023ec <interruptRoutine+0x564>
			TCB::yield();
    800023d8:	00000097          	auipc	ra,0x0
    800023dc:	550080e7          	jalr	1360(ra) # 80002928 <_ZN3TCB5yieldEv>
			TCB::runningTimeSlice = 0;
    800023e0:	00005797          	auipc	a5,0x5
    800023e4:	f187b783          	ld	a5,-232(a5) # 800072f8 <_GLOBAL_OFFSET_TABLE_+0x8>
    800023e8:	0007b023          	sd	zero,0(a5)
		Riscv::w_sepc(sepc);
    800023ec:	fd043503          	ld	a0,-48(s0)
    800023f0:	00000097          	auipc	ra,0x0
    800023f4:	080080e7          	jalr	128(ra) # 80002470 <_ZN5Riscv6w_sepcEm>
		Riscv::w_sstatus(sstatus);
    800023f8:	fc843503          	ld	a0,-56(s0)
    800023fc:	00000097          	auipc	ra,0x0
    80002400:	0ac080e7          	jalr	172(ra) # 800024a8 <_ZN5Riscv9w_sstatusEm>
		Riscv::mc_sip(Riscv::SIP_SSIP);
    80002404:	00200513          	li	a0,2
    80002408:	00000097          	auipc	ra,0x0
    8000240c:	084080e7          	jalr	132(ra) # 8000248c <_ZN5Riscv6mc_sipEm>
}
    80002410:	04c0006f          	j	8000245c <interruptRoutine+0x5d4>
		printString("\nGreska u prekidnoj rutini\n");
    80002414:	00004517          	auipc	a0,0x4
    80002418:	d8c50513          	addi	a0,a0,-628 # 800061a0 <CONSOLE_STATUS+0x190>
    8000241c:	fffff097          	auipc	ra,0xfffff
    80002420:	17c080e7          	jalr	380(ra) # 80001598 <_Z11printStringPKc>
		printString("scause: ");
    80002424:	00004517          	auipc	a0,0x4
    80002428:	d9c50513          	addi	a0,a0,-612 # 800061c0 <CONSOLE_STATUS+0x1b0>
    8000242c:	fffff097          	auipc	ra,0xfffff
    80002430:	16c080e7          	jalr	364(ra) # 80001598 <_Z11printStringPKc>
		printInteger(scause);
    80002434:	fd843503          	ld	a0,-40(s0)
    80002438:	fffff097          	auipc	ra,0xfffff
    8000243c:	188080e7          	jalr	392(ra) # 800015c0 <_Z12printIntegerm>
		printString("\nsepc: ");
    80002440:	00004517          	auipc	a0,0x4
    80002444:	d5850513          	addi	a0,a0,-680 # 80006198 <CONSOLE_STATUS+0x188>
    80002448:	fffff097          	auipc	ra,0xfffff
    8000244c:	150080e7          	jalr	336(ra) # 80001598 <_Z11printStringPKc>
		printInteger(sepc);
    80002450:	fd043503          	ld	a0,-48(s0)
    80002454:	fffff097          	auipc	ra,0xfffff
    80002458:	16c080e7          	jalr	364(ra) # 800015c0 <_Z12printIntegerm>
}
    8000245c:	00000013          	nop
    80002460:	10813083          	ld	ra,264(sp)
    80002464:	10013403          	ld	s0,256(sp)
    80002468:	11010113          	addi	sp,sp,272
    8000246c:	00008067          	ret

0000000080002470 <_ZN5Riscv6w_sepcEm>:
inline void Riscv::w_sepc(uint64 sepc) {
    80002470:	ff010113          	addi	sp,sp,-16
    80002474:	00813423          	sd	s0,8(sp)
    80002478:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    8000247c:	14151073          	csrw	sepc,a0
}
    80002480:	00813403          	ld	s0,8(sp)
    80002484:	01010113          	addi	sp,sp,16
    80002488:	00008067          	ret

000000008000248c <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    8000248c:	ff010113          	addi	sp,sp,-16
    80002490:	00813423          	sd	s0,8(sp)
    80002494:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    80002498:	14453073          	csrc	sip,a0
}
    8000249c:	00813403          	ld	s0,8(sp)
    800024a0:	01010113          	addi	sp,sp,16
    800024a4:	00008067          	ret

00000000800024a8 <_ZN5Riscv9w_sstatusEm>:
	uint64 volatile sstatus;
	__asm__ volatile("csrr %[sstatus], sstatus": [sstatus] "=r"(sstatus));
	return sstatus;
}

inline void Riscv::w_sstatus(uint64 sstatus) {
    800024a8:	ff010113          	addi	sp,sp,-16
    800024ac:	00813423          	sd	s0,8(sp)
    800024b0:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw sstatus, %[sstatus]": :[sstatus] "r"(sstatus));
    800024b4:	10051073          	csrw	sstatus,a0
}
    800024b8:	00813403          	ld	s0,8(sp)
    800024bc:	01010113          	addi	sp,sp,16
    800024c0:	00008067          	ret

00000000800024c4 <_ZN3TCB11setFinishedEb>:

	static TCB* createThread(Body function, void* args, uint64* stack);

	bool isFinished() { return finished; }

	void setFinished(bool finish) { this->finished = finish; }
    800024c4:	ff010113          	addi	sp,sp,-16
    800024c8:	00813423          	sd	s0,8(sp)
    800024cc:	01010413          	addi	s0,sp,16
    800024d0:	02b50823          	sb	a1,48(a0)
    800024d4:	00813403          	ld	s0,8(sp)
    800024d8:	01010113          	addi	sp,sp,16
    800024dc:	00008067          	ret

00000000800024e0 <_ZN3TCB12getTimeSliceEv>:

	bool isBlocked() { return blocked; }

	void setBlocked(bool block) { this->blocked = block; }

	uint64 getTimeSlice() { return timeSlice; }
    800024e0:	ff010113          	addi	sp,sp,-16
    800024e4:	00813423          	sd	s0,8(sp)
    800024e8:	01010413          	addi	s0,sp,16
    800024ec:	02853503          	ld	a0,40(a0)
    800024f0:	00813403          	ld	s0,8(sp)
    800024f4:	01010113          	addi	sp,sp,16
    800024f8:	00008067          	ret

00000000800024fc <_ZN6ThreadD1Ev>:

Thread::Thread(void (* body)(void*), void* arg) {

}

Thread::~Thread() {
    800024fc:	ff010113          	addi	sp,sp,-16
    80002500:	00813423          	sd	s0,8(sp)
    80002504:	01010413          	addi	s0,sp,16

}
    80002508:	00813403          	ld	s0,8(sp)
    8000250c:	01010113          	addi	sp,sp,16
    80002510:	00008067          	ret

0000000080002514 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {

}

Semaphore::~Semaphore() {
    80002514:	ff010113          	addi	sp,sp,-16
    80002518:	00813423          	sd	s0,8(sp)
    8000251c:	01010413          	addi	s0,sp,16

}
    80002520:	00813403          	ld	s0,8(sp)
    80002524:	01010113          	addi	sp,sp,16
    80002528:	00008067          	ret

000000008000252c <_Znwm>:
void* operator new(size_t size) {
    8000252c:	ff010113          	addi	sp,sp,-16
    80002530:	00113423          	sd	ra,8(sp)
    80002534:	00813023          	sd	s0,0(sp)
    80002538:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    8000253c:	fffff097          	auipc	ra,0xfffff
    80002540:	db4080e7          	jalr	-588(ra) # 800012f0 <_Z9mem_allocm>
}
    80002544:	00813083          	ld	ra,8(sp)
    80002548:	00013403          	ld	s0,0(sp)
    8000254c:	01010113          	addi	sp,sp,16
    80002550:	00008067          	ret

0000000080002554 <_Znam>:
void* operator new[](size_t size) {
    80002554:	ff010113          	addi	sp,sp,-16
    80002558:	00113423          	sd	ra,8(sp)
    8000255c:	00813023          	sd	s0,0(sp)
    80002560:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    80002564:	fffff097          	auipc	ra,0xfffff
    80002568:	d8c080e7          	jalr	-628(ra) # 800012f0 <_Z9mem_allocm>
}
    8000256c:	00813083          	ld	ra,8(sp)
    80002570:	00013403          	ld	s0,0(sp)
    80002574:	01010113          	addi	sp,sp,16
    80002578:	00008067          	ret

000000008000257c <_ZdlPv>:
void operator delete(void* ptr)noexcept {
    8000257c:	ff010113          	addi	sp,sp,-16
    80002580:	00113423          	sd	ra,8(sp)
    80002584:	00813023          	sd	s0,0(sp)
    80002588:	01010413          	addi	s0,sp,16
mem_free(ptr);
    8000258c:	fffff097          	auipc	ra,0xfffff
    80002590:	da4080e7          	jalr	-604(ra) # 80001330 <_Z8mem_freePv>
}
    80002594:	00813083          	ld	ra,8(sp)
    80002598:	00013403          	ld	s0,0(sp)
    8000259c:	01010113          	addi	sp,sp,16
    800025a0:	00008067          	ret

00000000800025a4 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    800025a4:	ff010113          	addi	sp,sp,-16
    800025a8:	00113423          	sd	ra,8(sp)
    800025ac:	00813023          	sd	s0,0(sp)
    800025b0:	01010413          	addi	s0,sp,16
}
    800025b4:	00000097          	auipc	ra,0x0
    800025b8:	fc8080e7          	jalr	-56(ra) # 8000257c <_ZdlPv>
    800025bc:	00813083          	ld	ra,8(sp)
    800025c0:	00013403          	ld	s0,0(sp)
    800025c4:	01010113          	addi	sp,sp,16
    800025c8:	00008067          	ret

00000000800025cc <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    800025cc:	ff010113          	addi	sp,sp,-16
    800025d0:	00113423          	sd	ra,8(sp)
    800025d4:	00813023          	sd	s0,0(sp)
    800025d8:	01010413          	addi	s0,sp,16
}
    800025dc:	00000097          	auipc	ra,0x0
    800025e0:	fa0080e7          	jalr	-96(ra) # 8000257c <_ZdlPv>
    800025e4:	00813083          	ld	ra,8(sp)
    800025e8:	00013403          	ld	s0,0(sp)
    800025ec:	01010113          	addi	sp,sp,16
    800025f0:	00008067          	ret

00000000800025f4 <_ZdaPv>:
void operator delete[](void* ptr)noexcept {
    800025f4:	ff010113          	addi	sp,sp,-16
    800025f8:	00113423          	sd	ra,8(sp)
    800025fc:	00813023          	sd	s0,0(sp)
    80002600:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80002604:	fffff097          	auipc	ra,0xfffff
    80002608:	d2c080e7          	jalr	-724(ra) # 80001330 <_Z8mem_freePv>
}
    8000260c:	00813083          	ld	ra,8(sp)
    80002610:	00013403          	ld	s0,0(sp)
    80002614:	01010113          	addi	sp,sp,16
    80002618:	00008067          	ret

000000008000261c <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (* body)(void*), void* arg) {
    8000261c:	ff010113          	addi	sp,sp,-16
    80002620:	00813423          	sd	s0,8(sp)
    80002624:	01010413          	addi	s0,sp,16
    80002628:	00005797          	auipc	a5,0x5
    8000262c:	c9078793          	addi	a5,a5,-880 # 800072b8 <_ZTV6Thread+0x10>
    80002630:	00f53023          	sd	a5,0(a0)
}
    80002634:	00813403          	ld	s0,8(sp)
    80002638:	01010113          	addi	sp,sp,16
    8000263c:	00008067          	ret

0000000080002640 <_ZN6Thread5startEv>:
int Thread::start() {
    80002640:	ff010113          	addi	sp,sp,-16
    80002644:	00813423          	sd	s0,8(sp)
    80002648:	01010413          	addi	s0,sp,16
}
    8000264c:	00000513          	li	a0,0
    80002650:	00813403          	ld	s0,8(sp)
    80002654:	01010113          	addi	sp,sp,16
    80002658:	00008067          	ret

000000008000265c <_ZN6Thread4joinEv>:
void Thread::join() {
    8000265c:	ff010113          	addi	sp,sp,-16
    80002660:	00813423          	sd	s0,8(sp)
    80002664:	01010413          	addi	s0,sp,16
}
    80002668:	00813403          	ld	s0,8(sp)
    8000266c:	01010113          	addi	sp,sp,16
    80002670:	00008067          	ret

0000000080002674 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80002674:	ff010113          	addi	sp,sp,-16
    80002678:	00813423          	sd	s0,8(sp)
    8000267c:	01010413          	addi	s0,sp,16
}
    80002680:	00813403          	ld	s0,8(sp)
    80002684:	01010113          	addi	sp,sp,16
    80002688:	00008067          	ret

000000008000268c <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t) {
    8000268c:	ff010113          	addi	sp,sp,-16
    80002690:	00813423          	sd	s0,8(sp)
    80002694:	01010413          	addi	s0,sp,16
}
    80002698:	00000513          	li	a0,0
    8000269c:	00813403          	ld	s0,8(sp)
    800026a0:	01010113          	addi	sp,sp,16
    800026a4:	00008067          	ret

00000000800026a8 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    800026a8:	ff010113          	addi	sp,sp,-16
    800026ac:	00813423          	sd	s0,8(sp)
    800026b0:	01010413          	addi	s0,sp,16
    800026b4:	00005797          	auipc	a5,0x5
    800026b8:	c0478793          	addi	a5,a5,-1020 # 800072b8 <_ZTV6Thread+0x10>
    800026bc:	00f53023          	sd	a5,0(a0)
}
    800026c0:	00813403          	ld	s0,8(sp)
    800026c4:	01010113          	addi	sp,sp,16
    800026c8:	00008067          	ret

00000000800026cc <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    800026cc:	ff010113          	addi	sp,sp,-16
    800026d0:	00813423          	sd	s0,8(sp)
    800026d4:	01010413          	addi	s0,sp,16
    800026d8:	00005797          	auipc	a5,0x5
    800026dc:	c0878793          	addi	a5,a5,-1016 # 800072e0 <_ZTV9Semaphore+0x10>
    800026e0:	00f53023          	sd	a5,0(a0)
}
    800026e4:	00813403          	ld	s0,8(sp)
    800026e8:	01010113          	addi	sp,sp,16
    800026ec:	00008067          	ret

00000000800026f0 <_ZN9Semaphore4waitEv>:

int Semaphore::wait() {
    800026f0:	ff010113          	addi	sp,sp,-16
    800026f4:	00813423          	sd	s0,8(sp)
    800026f8:	01010413          	addi	s0,sp,16
	return 0;
}
    800026fc:	00000513          	li	a0,0
    80002700:	00813403          	ld	s0,8(sp)
    80002704:	01010113          	addi	sp,sp,16
    80002708:	00008067          	ret

000000008000270c <_ZN9Semaphore6signalEv>:

int Semaphore::signal() {
    8000270c:	ff010113          	addi	sp,sp,-16
    80002710:	00813423          	sd	s0,8(sp)
    80002714:	01010413          	addi	s0,sp,16
	return 0;
}
    80002718:	00000513          	li	a0,0
    8000271c:	00813403          	ld	s0,8(sp)
    80002720:	01010113          	addi	sp,sp,16
    80002724:	00008067          	ret

0000000080002728 <_ZN14PeriodicThread9terminateEv>:

void PeriodicThread::terminate() {
    80002728:	ff010113          	addi	sp,sp,-16
    8000272c:	00813423          	sd	s0,8(sp)
    80002730:	01010413          	addi	s0,sp,16

}
    80002734:	00813403          	ld	s0,8(sp)
    80002738:	01010113          	addi	sp,sp,16
    8000273c:	00008067          	ret

0000000080002740 <_ZN14PeriodicThreadC1Em>:

PeriodicThread::PeriodicThread(time_t period) {
    80002740:	fe010113          	addi	sp,sp,-32
    80002744:	00113c23          	sd	ra,24(sp)
    80002748:	00813823          	sd	s0,16(sp)
    8000274c:	00913423          	sd	s1,8(sp)
    80002750:	02010413          	addi	s0,sp,32
    80002754:	00050493          	mv	s1,a0
    80002758:	00000097          	auipc	ra,0x0
    8000275c:	f50080e7          	jalr	-176(ra) # 800026a8 <_ZN6ThreadC1Ev>
    80002760:	00005797          	auipc	a5,0x5
    80002764:	b2878793          	addi	a5,a5,-1240 # 80007288 <_ZTV14PeriodicThread+0x10>
    80002768:	00f4b023          	sd	a5,0(s1)

}
    8000276c:	01813083          	ld	ra,24(sp)
    80002770:	01013403          	ld	s0,16(sp)
    80002774:	00813483          	ld	s1,8(sp)
    80002778:	02010113          	addi	sp,sp,32
    8000277c:	00008067          	ret

0000000080002780 <_ZN7Console4getcEv>:

char Console::getc() {
    80002780:	ff010113          	addi	sp,sp,-16
    80002784:	00813423          	sd	s0,8(sp)
    80002788:	01010413          	addi	s0,sp,16
	return 0;
}
    8000278c:	00000513          	li	a0,0
    80002790:	00813403          	ld	s0,8(sp)
    80002794:	01010113          	addi	sp,sp,16
    80002798:	00008067          	ret

000000008000279c <_ZN7Console4putcEc>:

void Console::putc(char) {
    8000279c:	ff010113          	addi	sp,sp,-16
    800027a0:	00813423          	sd	s0,8(sp)
    800027a4:	01010413          	addi	s0,sp,16

}
    800027a8:	00813403          	ld	s0,8(sp)
    800027ac:	01010113          	addi	sp,sp,16
    800027b0:	00008067          	ret

00000000800027b4 <_ZN6Thread3runEv>:
    static void dispatch ();
    static int sleep (time_t);

protected:
    Thread ();
    virtual void run () {}
    800027b4:	ff010113          	addi	sp,sp,-16
    800027b8:	00813423          	sd	s0,8(sp)
    800027bc:	01010413          	addi	s0,sp,16
    800027c0:	00813403          	ld	s0,8(sp)
    800027c4:	01010113          	addi	sp,sp,16
    800027c8:	00008067          	ret

00000000800027cc <_ZN14PeriodicThread18periodicActivationEv>:
public:
    void terminate ();

protected:
    PeriodicThread (time_t period);
    virtual void periodicActivation () {}
    800027cc:	ff010113          	addi	sp,sp,-16
    800027d0:	00813423          	sd	s0,8(sp)
    800027d4:	01010413          	addi	s0,sp,16
    800027d8:	00813403          	ld	s0,8(sp)
    800027dc:	01010113          	addi	sp,sp,16
    800027e0:	00008067          	ret

00000000800027e4 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    800027e4:	ff010113          	addi	sp,sp,-16
    800027e8:	00813423          	sd	s0,8(sp)
    800027ec:	01010413          	addi	s0,sp,16
    800027f0:	00005797          	auipc	a5,0x5
    800027f4:	a9878793          	addi	a5,a5,-1384 # 80007288 <_ZTV14PeriodicThread+0x10>
    800027f8:	00f53023          	sd	a5,0(a0)
    800027fc:	00813403          	ld	s0,8(sp)
    80002800:	01010113          	addi	sp,sp,16
    80002804:	00008067          	ret

0000000080002808 <_ZN14PeriodicThreadD0Ev>:
    80002808:	ff010113          	addi	sp,sp,-16
    8000280c:	00113423          	sd	ra,8(sp)
    80002810:	00813023          	sd	s0,0(sp)
    80002814:	01010413          	addi	s0,sp,16
    80002818:	00005797          	auipc	a5,0x5
    8000281c:	a7078793          	addi	a5,a5,-1424 # 80007288 <_ZTV14PeriodicThread+0x10>
    80002820:	00f53023          	sd	a5,0(a0)
    80002824:	00000097          	auipc	ra,0x0
    80002828:	d58080e7          	jalr	-680(ra) # 8000257c <_ZdlPv>
    8000282c:	00813083          	ld	ra,8(sp)
    80002830:	00013403          	ld	s0,0(sp)
    80002834:	01010113          	addi	sp,sp,16
    80002838:	00008067          	ret

000000008000283c <_ZN3TCB7wrapperEv>:
	Riscv::pushRegisters();
	TCB::dispatch();
	Riscv::popRegisters();
}

void TCB::wrapper() {
    8000283c:	ff010113          	addi	sp,sp,-16
    80002840:	00113423          	sd	ra,8(sp)
    80002844:	00813023          	sd	s0,0(sp)
    80002848:	01010413          	addi	s0,sp,16
	//pocetak wrappera se izvrsava u supervisor modu,
	//jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch/yield)
	Riscv::popSppSpie();
    8000284c:	00000097          	auipc	ra,0x0
    80002850:	2e0080e7          	jalr	736(ra) # 80002b2c <_ZN5Riscv10popSppSpieEv>
	//na dalje se izvrsavamo u user modu
	running->threadFunction(running->args);
    80002854:	00005797          	auipc	a5,0x5
    80002858:	b3c7b783          	ld	a5,-1220(a5) # 80007390 <_ZN3TCB7runningE>
    8000285c:	0107b703          	ld	a4,16(a5)
    80002860:	0207b503          	ld	a0,32(a5)
    80002864:	000700e7          	jalr	a4
	//running->finished = true;
	//i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
	thread_exit();
    80002868:	fffff097          	auipc	ra,0xfffff
    8000286c:	b78080e7          	jalr	-1160(ra) # 800013e0 <_Z11thread_exitv>
}
    80002870:	00813083          	ld	ra,8(sp)
    80002874:	00013403          	ld	s0,0(sp)
    80002878:	01010113          	addi	sp,sp,16
    8000287c:	00008067          	ret

0000000080002880 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80002880:	fe010113          	addi	sp,sp,-32
    80002884:	00113c23          	sd	ra,24(sp)
    80002888:	00813823          	sd	s0,16(sp)
    8000288c:	00913423          	sd	s1,8(sp)
    80002890:	02010413          	addi	s0,sp,32
	TCB* old = TCB::running;
    80002894:	00005497          	auipc	s1,0x5
    80002898:	afc4b483          	ld	s1,-1284(s1) # 80007390 <_ZN3TCB7runningE>
	if (!old->finished && !old->blocked && old->timeToSleep == 0 && !old->needToJoin) {
    8000289c:	0304c783          	lbu	a5,48(s1)
    800028a0:	00079e63          	bnez	a5,800028bc <_ZN3TCB8dispatchEv+0x3c>
    800028a4:	0314c783          	lbu	a5,49(s1)
    800028a8:	00079a63          	bnez	a5,800028bc <_ZN3TCB8dispatchEv+0x3c>
    800028ac:	0404b783          	ld	a5,64(s1)
    800028b0:	00079663          	bnez	a5,800028bc <_ZN3TCB8dispatchEv+0x3c>
    800028b4:	0324c783          	lbu	a5,50(s1)
    800028b8:	04078a63          	beqz	a5,8000290c <_ZN3TCB8dispatchEv+0x8c>
	TCB::running = Scheduler::get();
    800028bc:	fffff097          	auipc	ra,0xfffff
    800028c0:	d70080e7          	jalr	-656(ra) # 8000162c <_ZN9Scheduler3getEv>
    800028c4:	00050593          	mv	a1,a0
    800028c8:	00005797          	auipc	a5,0x5
    800028cc:	ac878793          	addi	a5,a5,-1336 # 80007390 <_ZN3TCB7runningE>
    800028d0:	00a7b023          	sd	a0,0(a5)
	TCB::runningTimeSlice = 0;
    800028d4:	0007b423          	sd	zero,8(a5)
	if (TCB::running->threadFunction == nullptr) {
    800028d8:	01053783          	ld	a5,16(a0)
    800028dc:	04078063          	beqz	a5,8000291c <_ZN3TCB8dispatchEv+0x9c>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    800028e0:	10000793          	li	a5,256
    800028e4:	1007b073          	csrc	sstatus,a5
	if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    800028e8:	00b48863          	beq	s1,a1,800028f8 <_ZN3TCB8dispatchEv+0x78>
    800028ec:	00048513          	mv	a0,s1
    800028f0:	fffff097          	auipc	ra,0xfffff
    800028f4:	920080e7          	jalr	-1760(ra) # 80001210 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    800028f8:	01813083          	ld	ra,24(sp)
    800028fc:	01013403          	ld	s0,16(sp)
    80002900:	00813483          	ld	s1,8(sp)
    80002904:	02010113          	addi	sp,sp,32
    80002908:	00008067          	ret
		Scheduler::put(old);
    8000290c:	00048513          	mv	a0,s1
    80002910:	fffff097          	auipc	ra,0xfffff
    80002914:	cd8080e7          	jalr	-808(ra) # 800015e8 <_ZN9Scheduler3putEP3TCB>
    80002918:	fa5ff06f          	j	800028bc <_ZN3TCB8dispatchEv+0x3c>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    8000291c:	10000793          	li	a5,256
    80002920:	1007a073          	csrs	sstatus,a5
}
    80002924:	fc5ff06f          	j	800028e8 <_ZN3TCB8dispatchEv+0x68>

0000000080002928 <_ZN3TCB5yieldEv>:
void TCB::yield() {
    80002928:	ff010113          	addi	sp,sp,-16
    8000292c:	00113423          	sd	ra,8(sp)
    80002930:	00813023          	sd	s0,0(sp)
    80002934:	01010413          	addi	s0,sp,16
	Riscv::pushRegisters();
    80002938:	ffffe097          	auipc	ra,0xffffe
    8000293c:	6c8080e7          	jalr	1736(ra) # 80001000 <_ZN5Riscv13pushRegistersEv>
	TCB::dispatch();
    80002940:	00000097          	auipc	ra,0x0
    80002944:	f40080e7          	jalr	-192(ra) # 80002880 <_ZN3TCB8dispatchEv>
	Riscv::popRegisters();
    80002948:	ffffe097          	auipc	ra,0xffffe
    8000294c:	734080e7          	jalr	1844(ra) # 8000107c <_ZN5Riscv12popRegistersEv>
}
    80002950:	00813083          	ld	ra,8(sp)
    80002954:	00013403          	ld	s0,0(sp)
    80002958:	01010113          	addi	sp,sp,16
    8000295c:	00008067          	ret

0000000080002960 <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    80002960:	ff010113          	addi	sp,sp,-16
    80002964:	00113423          	sd	ra,8(sp)
    80002968:	00813023          	sd	s0,0(sp)
    8000296c:	01010413          	addi	s0,sp,16
	return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment));
    80002970:	01050513          	addi	a0,a0,16
    80002974:	00000097          	auipc	ra,0x0
    80002978:	1d8080e7          	jalr	472(ra) # 80002b4c <_ZN15MemoryAllocator7kmallocEm>
}
    8000297c:	00813083          	ld	ra,8(sp)
    80002980:	00013403          	ld	s0,0(sp)
    80002984:	01010113          	addi	sp,sp,16
    80002988:	00008067          	ret

000000008000298c <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    8000298c:	fd010113          	addi	sp,sp,-48
    80002990:	02113423          	sd	ra,40(sp)
    80002994:	02813023          	sd	s0,32(sp)
    80002998:	00913c23          	sd	s1,24(sp)
    8000299c:	01213823          	sd	s2,16(sp)
    800029a0:	01313423          	sd	s3,8(sp)
    800029a4:	01413023          	sd	s4,0(sp)
    800029a8:	03010413          	addi	s0,sp,48
    800029ac:	00050993          	mv	s3,a0
    800029b0:	00058a13          	mv	s4,a1
    800029b4:	00060913          	mv	s2,a2
	TCB* newThread = new TCB(function, args, stack);
    800029b8:	06000513          	li	a0,96
    800029bc:	00000097          	auipc	ra,0x0
    800029c0:	fa4080e7          	jalr	-92(ra) # 80002960 <_ZN3TCBnwEm>
    800029c4:	00050493          	mv	s1,a0


	TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
													timeSlice(DEFAULT_TIME_SLICE), finished(false), blocked(false),
													needToJoin(false),
													nextInScheduler(nullptr), timeToSleep(0), nextSleeping(nullptr) {
    800029c8:	01353823          	sd	s3,16(a0)
    800029cc:	01253c23          	sd	s2,24(a0)
    800029d0:	03453023          	sd	s4,32(a0)
    800029d4:	00200793          	li	a5,2
    800029d8:	02f53423          	sd	a5,40(a0)
    800029dc:	02050823          	sb	zero,48(a0)
    800029e0:	020508a3          	sb	zero,49(a0)
    800029e4:	02050923          	sb	zero,50(a0)
    800029e8:	02053c23          	sd	zero,56(a0)
    800029ec:	04053023          	sd	zero,64(a0)
    800029f0:	04053423          	sd	zero,72(a0)
	ThreadQueue() : front(nullptr), back(nullptr) {}
    800029f4:	04053823          	sd	zero,80(a0)
    800029f8:	04053c23          	sd	zero,88(a0)
		//formiranje pocetnog konteksta; specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    800029fc:	04098a63          	beqz	s3,80002a50 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xc4>
    80002a00:	00000797          	auipc	a5,0x0
    80002a04:	e3c78793          	addi	a5,a5,-452 # 8000283c <_ZN3TCB7wrapperEv>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80002a08:	04090863          	beqz	s2,80002a58 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xcc>
    80002a0c:	00008637          	lui	a2,0x8
    80002a10:	00c90933          	add	s2,s2,a2
		this->context.ra = startRa;
    80002a14:	00f4b023          	sd	a5,0(s1)
		this->context.sp = startSp;
    80002a18:	0124b423          	sd	s2,8(s1)
	if (function != nullptr) Scheduler::put(newThread);
    80002a1c:	00098863          	beqz	s3,80002a2c <_ZN3TCB12createThreadEPFvPvES0_Pm+0xa0>
    80002a20:	00048513          	mv	a0,s1
    80002a24:	fffff097          	auipc	ra,0xfffff
    80002a28:	bc4080e7          	jalr	-1084(ra) # 800015e8 <_ZN9Scheduler3putEP3TCB>
}
    80002a2c:	00048513          	mv	a0,s1
    80002a30:	02813083          	ld	ra,40(sp)
    80002a34:	02013403          	ld	s0,32(sp)
    80002a38:	01813483          	ld	s1,24(sp)
    80002a3c:	01013903          	ld	s2,16(sp)
    80002a40:	00813983          	ld	s3,8(sp)
    80002a44:	00013a03          	ld	s4,0(sp)
    80002a48:	03010113          	addi	sp,sp,48
    80002a4c:	00008067          	ret
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80002a50:	00000793          	li	a5,0
    80002a54:	fb5ff06f          	j	80002a08 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x7c>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80002a58:	00000913          	li	s2,0
    80002a5c:	fb9ff06f          	j	80002a14 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x88>

0000000080002a60 <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    80002a60:	ff010113          	addi	sp,sp,-16
    80002a64:	00113423          	sd	ra,8(sp)
    80002a68:	00813023          	sd	s0,0(sp)
    80002a6c:	01010413          	addi	s0,sp,16
	MemoryAllocator::kfree(ptr);
    80002a70:	00000097          	auipc	ra,0x0
    80002a74:	284080e7          	jalr	644(ra) # 80002cf4 <_ZN15MemoryAllocator5kfreeEPv>
}
    80002a78:	00813083          	ld	ra,8(sp)
    80002a7c:	00013403          	ld	s0,0(sp)
    80002a80:	01010113          	addi	sp,sp,16
    80002a84:	00008067          	ret

0000000080002a88 <_ZN3TCB10threadJoinEPS_>:

void TCB::threadJoin(TCB* handle) {
	if(handle->finished) return;
    80002a88:	03054783          	lbu	a5,48(a0)
    80002a8c:	00078463          	beqz	a5,80002a94 <_ZN3TCB10threadJoinEPS_+0xc>
    80002a90:	00008067          	ret
void TCB::threadJoin(TCB* handle) {
    80002a94:	ff010113          	addi	sp,sp,-16
    80002a98:	00113423          	sd	ra,8(sp)
    80002a9c:	00813023          	sd	s0,0(sp)
    80002aa0:	01010413          	addi	s0,sp,16
	TCB::running->needToJoin = true;
    80002aa4:	00005597          	auipc	a1,0x5
    80002aa8:	8ec5b583          	ld	a1,-1812(a1) # 80007390 <_ZN3TCB7runningE>
    80002aac:	00100793          	li	a5,1
    80002ab0:	02f58923          	sb	a5,50(a1)
	handle->waitingToJoin.putLast(TCB::running);
    80002ab4:	05050513          	addi	a0,a0,80
    80002ab8:	ffffe097          	auipc	ra,0xffffe
    80002abc:	76c080e7          	jalr	1900(ra) # 80001224 <_ZN11ThreadQueue7putLastEP3TCB>
}
    80002ac0:	00813083          	ld	ra,8(sp)
    80002ac4:	00013403          	ld	s0,0(sp)
    80002ac8:	01010113          	addi	sp,sp,16
    80002acc:	00008067          	ret

0000000080002ad0 <_ZN3TCB13releaseJoinedEv>:

void TCB::releaseJoined() {
	while(!TCB::running->waitingToJoin.isEmpty()){
    80002ad0:	00005517          	auipc	a0,0x5
    80002ad4:	8c053503          	ld	a0,-1856(a0) # 80007390 <_ZN3TCB7runningE>
		return front == nullptr;
    80002ad8:	05053783          	ld	a5,80(a0)
    80002adc:	04078663          	beqz	a5,80002b28 <_ZN3TCB13releaseJoinedEv+0x58>
void TCB::releaseJoined() {
    80002ae0:	ff010113          	addi	sp,sp,-16
    80002ae4:	00113423          	sd	ra,8(sp)
    80002ae8:	00813023          	sd	s0,0(sp)
    80002aec:	01010413          	addi	s0,sp,16
		TCB* tcb = TCB::running->waitingToJoin.getFirst();
    80002af0:	05050513          	addi	a0,a0,80
    80002af4:	ffffe097          	auipc	ra,0xffffe
    80002af8:	79c080e7          	jalr	1948(ra) # 80001290 <_ZN11ThreadQueue8getFirstEv>
		tcb->needToJoin = false;
    80002afc:	02050923          	sb	zero,50(a0)
		Scheduler::put(tcb);
    80002b00:	fffff097          	auipc	ra,0xfffff
    80002b04:	ae8080e7          	jalr	-1304(ra) # 800015e8 <_ZN9Scheduler3putEP3TCB>
	while(!TCB::running->waitingToJoin.isEmpty()){
    80002b08:	00005517          	auipc	a0,0x5
    80002b0c:	88853503          	ld	a0,-1912(a0) # 80007390 <_ZN3TCB7runningE>
    80002b10:	05053783          	ld	a5,80(a0)
    80002b14:	fc079ee3          	bnez	a5,80002af0 <_ZN3TCB13releaseJoinedEv+0x20>
	}
}
    80002b18:	00813083          	ld	ra,8(sp)
    80002b1c:	00013403          	ld	s0,0(sp)
    80002b20:	01010113          	addi	sp,sp,16
    80002b24:	00008067          	ret
    80002b28:	00008067          	ret

0000000080002b2c <_ZN5Riscv10popSppSpieEv>:
// Created by os on 5/17/23.
//

#include "../h/Riscv.hpp"

void Riscv::popSppSpie() {
    80002b2c:	ff010113          	addi	sp,sp,-16
    80002b30:	00813423          	sd	s0,8(sp)
    80002b34:	01010413          	addi	s0,sp,16
	//ra pokazuje iza ove funkcije na nastavak wrappera
	__asm__ volatile("csrw sepc, ra");
    80002b38:	14109073          	csrw	sepc,ra
	__asm__ volatile("sret");
    80002b3c:	10200073          	sret
    80002b40:	00813403          	ld	s0,8(sp)
    80002b44:	01010113          	addi	sp,sp,16
    80002b48:	00008067          	ret

0000000080002b4c <_ZN15MemoryAllocator7kmallocEm>:

bool MemoryAllocator::initialized = false;
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

void* MemoryAllocator::kmalloc(size_t size) {
    80002b4c:	ff010113          	addi	sp,sp,-16
    80002b50:	00813423          	sd	s0,8(sp)
    80002b54:	01010413          	addi	s0,sp,16
	if (size <= 0) return nullptr;
    80002b58:	12050663          	beqz	a0,80002c84 <_ZN15MemoryAllocator7kmallocEm+0x138>

	//pocetna inicijalizacija
	if (!initialized) {
    80002b5c:	00005797          	auipc	a5,0x5
    80002b60:	8447c783          	lbu	a5,-1980(a5) # 800073a0 <_ZN15MemoryAllocator11initializedE>
    80002b64:	04079863          	bnez	a5,80002bb4 <_ZN15MemoryAllocator7kmallocEm+0x68>
		freeMemHead = (FreeMemSegment*)HEAP_START_ADDR;
    80002b68:	00004617          	auipc	a2,0x4
    80002b6c:	79863603          	ld	a2,1944(a2) # 80007300 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002b70:	00063783          	ld	a5,0(a2)
    80002b74:	00005717          	auipc	a4,0x5
    80002b78:	82c70713          	addi	a4,a4,-2004 # 800073a0 <_ZN15MemoryAllocator11initializedE>
    80002b7c:	00f73423          	sd	a5,8(a4)
		freeMemHead->next = nullptr;
    80002b80:	0007b023          	sd	zero,0(a5)
		freeMemHead->prev = nullptr;
    80002b84:	00873683          	ld	a3,8(a4)
    80002b88:	0006b423          	sd	zero,8(a3)
		freeMemHead->size = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR - sizeof(FreeMemSegment);
    80002b8c:	00004797          	auipc	a5,0x4
    80002b90:	78c7b783          	ld	a5,1932(a5) # 80007318 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002b94:	0007b783          	ld	a5,0(a5)
    80002b98:	00063603          	ld	a2,0(a2)
    80002b9c:	40c787b3          	sub	a5,a5,a2
    80002ba0:	fe878793          	addi	a5,a5,-24
    80002ba4:	00f6b823          	sd	a5,16(a3)
		usedMemHead = nullptr;
    80002ba8:	00073823          	sd	zero,16(a4)

		initialized = true;
    80002bac:	00100793          	li	a5,1
    80002bb0:	00f70023          	sb	a5,0(a4)
	}

	//alokacija uvek zaokruzena na blokove
	//size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
	size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80002bb4:	00655793          	srli	a5,a0,0x6
    80002bb8:	03f57513          	andi	a0,a0,63
    80002bbc:	00050463          	beqz	a0,80002bc4 <_ZN15MemoryAllocator7kmallocEm+0x78>
    80002bc0:	00100513          	li	a0,1
    80002bc4:	00a78533          	add	a0,a5,a0
	size = blocks * MEM_BLOCK_SIZE;
    80002bc8:	00651793          	slli	a5,a0,0x6

	//trazenje slobodnog segmenta po first-fit algoritmu
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80002bcc:	00004517          	auipc	a0,0x4
    80002bd0:	7dc53503          	ld	a0,2012(a0) # 800073a8 <_ZN15MemoryAllocator11freeMemHeadE>
    80002bd4:	08050a63          	beqz	a0,80002c68 <_ZN15MemoryAllocator7kmallocEm+0x11c>
		if (current->size < size) continue;
    80002bd8:	01053703          	ld	a4,16(a0)
    80002bdc:	06f76263          	bltu	a4,a5,80002c40 <_ZN15MemoryAllocator7kmallocEm+0xf4>

		//pravljenje novog slobodnog fragmenta od ostatka fragmenta
		FreeMemSegment* remainderFree = (FreeMemSegment*)((char*)current + size);
    80002be0:	00f506b3          	add	a3,a0,a5
		remainderFree->size = current->size - size;
    80002be4:	40f70733          	sub	a4,a4,a5
    80002be8:	00e6b823          	sd	a4,16(a3)
		remainderFree->prev = current->prev;
    80002bec:	00853703          	ld	a4,8(a0)
    80002bf0:	00e6b423          	sd	a4,8(a3)
		if (current->prev) current->prev->next = remainderFree;
    80002bf4:	00070463          	beqz	a4,80002bfc <_ZN15MemoryAllocator7kmallocEm+0xb0>
    80002bf8:	00d73023          	sd	a3,0(a4)
		remainderFree->next = current->next;
    80002bfc:	00053703          	ld	a4,0(a0)
    80002c00:	00e6b023          	sd	a4,0(a3)
		if (current->next) current->next->prev = remainderFree;
    80002c04:	00070463          	beqz	a4,80002c0c <_ZN15MemoryAllocator7kmallocEm+0xc0>
    80002c08:	00d73423          	sd	a3,8(a4)
		if (freeMemHead == current) freeMemHead = remainderFree;
    80002c0c:	00004717          	auipc	a4,0x4
    80002c10:	79c73703          	ld	a4,1948(a4) # 800073a8 <_ZN15MemoryAllocator11freeMemHeadE>
    80002c14:	02a70a63          	beq	a4,a0,80002c48 <_ZN15MemoryAllocator7kmallocEm+0xfc>

		//ubacivanje novog fragmenta u listu zauzetih fragmenata
		UsedMemSegment* newFragment = (UsedMemSegment*)current;
		newFragment->size = size;
    80002c18:	00f53423          	sd	a5,8(a0)
		UsedMemSegment* prevUsed = nullptr;
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    80002c1c:	00004697          	auipc	a3,0x4
    80002c20:	7946b683          	ld	a3,1940(a3) # 800073b0 <_ZN15MemoryAllocator11usedMemHeadE>
    80002c24:	00068793          	mv	a5,a3
		UsedMemSegment* prevUsed = nullptr;
    80002c28:	00000713          	li	a4,0
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    80002c2c:	02078463          	beqz	a5,80002c54 <_ZN15MemoryAllocator7kmallocEm+0x108>
    80002c30:	02a7f263          	bgeu	a5,a0,80002c54 <_ZN15MemoryAllocator7kmallocEm+0x108>
    80002c34:	00078713          	mv	a4,a5
    80002c38:	0007b783          	ld	a5,0(a5)
    80002c3c:	ff1ff06f          	j	80002c2c <_ZN15MemoryAllocator7kmallocEm+0xe0>
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80002c40:	00053503          	ld	a0,0(a0)
    80002c44:	f91ff06f          	j	80002bd4 <_ZN15MemoryAllocator7kmallocEm+0x88>
		if (freeMemHead == current) freeMemHead = remainderFree;
    80002c48:	00004717          	auipc	a4,0x4
    80002c4c:	76d73023          	sd	a3,1888(a4) # 800073a8 <_ZN15MemoryAllocator11freeMemHeadE>
    80002c50:	fc9ff06f          	j	80002c18 <_ZN15MemoryAllocator7kmallocEm+0xcc>
		if (!prevUsed) {
    80002c54:	02070063          	beqz	a4,80002c74 <_ZN15MemoryAllocator7kmallocEm+0x128>
			newFragment->next = usedMemHead;
			usedMemHead = newFragment;
		} else {
			newFragment->next = prevUsed->next;
    80002c58:	00073783          	ld	a5,0(a4)
    80002c5c:	00f53023          	sd	a5,0(a0)
			prevUsed->next = newFragment;
    80002c60:	00a73023          	sd	a0,0(a4)
		}
		return (char*)newFragment + sizeof(UsedMemSegment);
    80002c64:	01050513          	addi	a0,a0,16
	}
	return nullptr;
}
    80002c68:	00813403          	ld	s0,8(sp)
    80002c6c:	01010113          	addi	sp,sp,16
    80002c70:	00008067          	ret
			newFragment->next = usedMemHead;
    80002c74:	00d53023          	sd	a3,0(a0)
			usedMemHead = newFragment;
    80002c78:	00004797          	auipc	a5,0x4
    80002c7c:	72a7bc23          	sd	a0,1848(a5) # 800073b0 <_ZN15MemoryAllocator11usedMemHeadE>
    80002c80:	fe5ff06f          	j	80002c64 <_ZN15MemoryAllocator7kmallocEm+0x118>
	if (size <= 0) return nullptr;
    80002c84:	00000513          	li	a0,0
    80002c88:	fe1ff06f          	j	80002c68 <_ZN15MemoryAllocator7kmallocEm+0x11c>

0000000080002c8c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:
	tryToJoin(newFree);
	tryToJoin(prevFree);
	return 0;
}

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    80002c8c:	ff010113          	addi	sp,sp,-16
    80002c90:	00813423          	sd	s0,8(sp)
    80002c94:	01010413          	addi	s0,sp,16
	if (!current) return 0;
    80002c98:	04050663          	beqz	a0,80002ce4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x58>
	bool nextExists = current->next != nullptr;
    80002c9c:	00053783          	ld	a5,0(a0)
	char* nextAddr = (char*)current + current->size;
    80002ca0:	01053703          	ld	a4,16(a0)
    80002ca4:	00e506b3          	add	a3,a0,a4
	char* cnext = (char*)current->next;
	bool nextIsConnected = (nextAddr == cnext);
	if (nextExists && nextIsConnected) {
    80002ca8:	04078263          	beqz	a5,80002cec <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x60>
    80002cac:	00d78a63          	beq	a5,a3,80002cc0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x34>
		current->size += current->next->size;
		current->next = current->next->next;
		if (current->next) current->next->prev = current;
		return 1;
	} else return 0;
    80002cb0:	00000513          	li	a0,0
}
    80002cb4:	00813403          	ld	s0,8(sp)
    80002cb8:	01010113          	addi	sp,sp,16
    80002cbc:	00008067          	ret
		current->size += current->next->size;
    80002cc0:	0107b683          	ld	a3,16(a5)
    80002cc4:	00d70733          	add	a4,a4,a3
    80002cc8:	00e53823          	sd	a4,16(a0)
		current->next = current->next->next;
    80002ccc:	0007b783          	ld	a5,0(a5)
    80002cd0:	00f53023          	sd	a5,0(a0)
		if (current->next) current->next->prev = current;
    80002cd4:	00078463          	beqz	a5,80002cdc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x50>
    80002cd8:	00a7b423          	sd	a0,8(a5)
		return 1;
    80002cdc:	00100513          	li	a0,1
    80002ce0:	fd5ff06f          	j	80002cb4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	if (!current) return 0;
    80002ce4:	00000513          	li	a0,0
    80002ce8:	fcdff06f          	j	80002cb4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	} else return 0;
    80002cec:	00000513          	li	a0,0
    80002cf0:	fc5ff06f          	j	80002cb4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>

0000000080002cf4 <_ZN15MemoryAllocator5kfreeEPv>:
	if (!ptr) return 0;
    80002cf4:	10050463          	beqz	a0,80002dfc <_ZN15MemoryAllocator5kfreeEPv+0x108>
    80002cf8:	00050693          	mv	a3,a0
	if (!usedMemHead) return -1;
    80002cfc:	00004797          	auipc	a5,0x4
    80002d00:	6b47b783          	ld	a5,1716(a5) # 800073b0 <_ZN15MemoryAllocator11usedMemHeadE>
    80002d04:	10078063          	beqz	a5,80002e04 <_ZN15MemoryAllocator5kfreeEPv+0x110>
	ptr = (char*)ptr - sizeof(UsedMemSegment);
    80002d08:	ff050513          	addi	a0,a0,-16
	UsedMemSegment* prevUsed = nullptr;
    80002d0c:	00000713          	li	a4,0
	for (; currentUsed && currentUsed != ptr; prevUsed = currentUsed, currentUsed = currentUsed->next);
    80002d10:	00078a63          	beqz	a5,80002d24 <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80002d14:	00a78863          	beq	a5,a0,80002d24 <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80002d18:	00078713          	mv	a4,a5
    80002d1c:	0007b783          	ld	a5,0(a5)
    80002d20:	ff1ff06f          	j	80002d10 <_ZN15MemoryAllocator5kfreeEPv+0x1c>
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80002d24:	0ea79463          	bne	a5,a0,80002e0c <_ZN15MemoryAllocator5kfreeEPv+0x118>
int MemoryAllocator::kfree(void* ptr) {
    80002d28:	fe010113          	addi	sp,sp,-32
    80002d2c:	00113c23          	sd	ra,24(sp)
    80002d30:	00813823          	sd	s0,16(sp)
    80002d34:	00913423          	sd	s1,8(sp)
    80002d38:	02010413          	addi	s0,sp,32
	if (prevUsed) prevUsed->next = currentUsed->next;
    80002d3c:	02070863          	beqz	a4,80002d6c <_ZN15MemoryAllocator5kfreeEPv+0x78>
    80002d40:	0007b783          	ld	a5,0(a5)
    80002d44:	00f73023          	sd	a5,0(a4)
	if (!freeMemHead || ptr < (char*)freeMemHead) {
    80002d48:	00004797          	auipc	a5,0x4
    80002d4c:	6607b783          	ld	a5,1632(a5) # 800073a8 <_ZN15MemoryAllocator11freeMemHeadE>
    80002d50:	02078663          	beqz	a5,80002d7c <_ZN15MemoryAllocator5kfreeEPv+0x88>
    80002d54:	02f56863          	bltu	a0,a5,80002d84 <_ZN15MemoryAllocator5kfreeEPv+0x90>
			 prevFree->next != nullptr && ptr > (char*)(prevFree->next); prevFree = prevFree->next);
    80002d58:	00078493          	mv	s1,a5
    80002d5c:	0007b783          	ld	a5,0(a5)
    80002d60:	02078463          	beqz	a5,80002d88 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80002d64:	fea7eae3          	bltu	a5,a0,80002d58 <_ZN15MemoryAllocator5kfreeEPv+0x64>
    80002d68:	0200006f          	j	80002d88 <_ZN15MemoryAllocator5kfreeEPv+0x94>
	else usedMemHead = currentUsed->next;
    80002d6c:	0007b783          	ld	a5,0(a5)
    80002d70:	00004717          	auipc	a4,0x4
    80002d74:	64f73023          	sd	a5,1600(a4) # 800073b0 <_ZN15MemoryAllocator11usedMemHeadE>
    80002d78:	fd1ff06f          	j	80002d48 <_ZN15MemoryAllocator5kfreeEPv+0x54>
		prevFree = nullptr;
    80002d7c:	00078493          	mv	s1,a5
    80002d80:	0080006f          	j	80002d88 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80002d84:	00000493          	li	s1,0
	size_t segmentSize = ((UsedMemSegment*)ptr)->size;
    80002d88:	ff86b783          	ld	a5,-8(a3)
	newFree->size = segmentSize;
    80002d8c:	00f6b023          	sd	a5,0(a3)
	newFree->prev = prevFree;
    80002d90:	fe96bc23          	sd	s1,-8(a3)
	if (prevFree) newFree->next = prevFree->next;
    80002d94:	04048663          	beqz	s1,80002de0 <_ZN15MemoryAllocator5kfreeEPv+0xec>
    80002d98:	0004b783          	ld	a5,0(s1)
    80002d9c:	fef6b823          	sd	a5,-16(a3)
	if (newFree->next) newFree->next->prev = newFree;
    80002da0:	ff06b783          	ld	a5,-16(a3)
    80002da4:	00078463          	beqz	a5,80002dac <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    80002da8:	00a7b423          	sd	a0,8(a5)
	if (prevFree) prevFree->next = newFree;
    80002dac:	04048263          	beqz	s1,80002df0 <_ZN15MemoryAllocator5kfreeEPv+0xfc>
    80002db0:	00a4b023          	sd	a0,0(s1)
	tryToJoin(newFree);
    80002db4:	00000097          	auipc	ra,0x0
    80002db8:	ed8080e7          	jalr	-296(ra) # 80002c8c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	tryToJoin(prevFree);
    80002dbc:	00048513          	mv	a0,s1
    80002dc0:	00000097          	auipc	ra,0x0
    80002dc4:	ecc080e7          	jalr	-308(ra) # 80002c8c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	return 0;
    80002dc8:	00000513          	li	a0,0
}
    80002dcc:	01813083          	ld	ra,24(sp)
    80002dd0:	01013403          	ld	s0,16(sp)
    80002dd4:	00813483          	ld	s1,8(sp)
    80002dd8:	02010113          	addi	sp,sp,32
    80002ddc:	00008067          	ret
	else newFree->next = freeMemHead;
    80002de0:	00004797          	auipc	a5,0x4
    80002de4:	5c87b783          	ld	a5,1480(a5) # 800073a8 <_ZN15MemoryAllocator11freeMemHeadE>
    80002de8:	fef6b823          	sd	a5,-16(a3)
    80002dec:	fb5ff06f          	j	80002da0 <_ZN15MemoryAllocator5kfreeEPv+0xac>
	else freeMemHead = newFree;
    80002df0:	00004797          	auipc	a5,0x4
    80002df4:	5aa7bc23          	sd	a0,1464(a5) # 800073a8 <_ZN15MemoryAllocator11freeMemHeadE>
    80002df8:	fbdff06f          	j	80002db4 <_ZN15MemoryAllocator5kfreeEPv+0xc0>
	if (!ptr) return 0;
    80002dfc:	00000513          	li	a0,0
    80002e00:	00008067          	ret
	if (!usedMemHead) return -1;
    80002e04:	fff00513          	li	a0,-1
    80002e08:	00008067          	ret
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80002e0c:	fff00513          	li	a0,-1
}
    80002e10:	00008067          	ret

0000000080002e14 <_ZN4KSemnwEm>:

#include "../h/KSem.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void* KSem::operator new(size_t size) {
    80002e14:	ff010113          	addi	sp,sp,-16
    80002e18:	00113423          	sd	ra,8(sp)
    80002e1c:	00813023          	sd	s0,0(sp)
    80002e20:	01010413          	addi	s0,sp,16
	return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment));
    80002e24:	01050513          	addi	a0,a0,16
    80002e28:	00000097          	auipc	ra,0x0
    80002e2c:	d24080e7          	jalr	-732(ra) # 80002b4c <_ZN15MemoryAllocator7kmallocEm>
}
    80002e30:	00813083          	ld	ra,8(sp)
    80002e34:	00013403          	ld	s0,0(sp)
    80002e38:	01010113          	addi	sp,sp,16
    80002e3c:	00008067          	ret

0000000080002e40 <_ZN4KSemdlEPv>:

void KSem::operator delete(void* ptr) {
    80002e40:	ff010113          	addi	sp,sp,-16
    80002e44:	00113423          	sd	ra,8(sp)
    80002e48:	00813023          	sd	s0,0(sp)
    80002e4c:	01010413          	addi	s0,sp,16
	MemoryAllocator::kfree(ptr);
    80002e50:	00000097          	auipc	ra,0x0
    80002e54:	ea4080e7          	jalr	-348(ra) # 80002cf4 <_ZN15MemoryAllocator5kfreeEPv>
}
    80002e58:	00813083          	ld	ra,8(sp)
    80002e5c:	00013403          	ld	s0,0(sp)
    80002e60:	01010113          	addi	sp,sp,16
    80002e64:	00008067          	ret

0000000080002e68 <_ZN4KSem7initSemEj>:

KSem* KSem::initSem(uint val) {
    80002e68:	fe010113          	addi	sp,sp,-32
    80002e6c:	00113c23          	sd	ra,24(sp)
    80002e70:	00813823          	sd	s0,16(sp)
    80002e74:	00913423          	sd	s1,8(sp)
    80002e78:	02010413          	addi	s0,sp,32
    80002e7c:	00050493          	mv	s1,a0
	return new KSem(val);
    80002e80:	02000513          	li	a0,32
    80002e84:	00000097          	auipc	ra,0x0
    80002e88:	f90080e7          	jalr	-112(ra) # 80002e14 <_ZN4KSemnwEm>
protected:
	void block();
	void unblock();

private:
	KSem(uint val):val(val),working(true){}
    80002e8c:	00952023          	sw	s1,0(a0)
	ThreadQueue() : front(nullptr), back(nullptr) {}
    80002e90:	00053423          	sd	zero,8(a0)
    80002e94:	00053823          	sd	zero,16(a0)
    80002e98:	00100713          	li	a4,1
    80002e9c:	00e50c23          	sb	a4,24(a0)
}
    80002ea0:	01813083          	ld	ra,24(sp)
    80002ea4:	01013403          	ld	s0,16(sp)
    80002ea8:	00813483          	ld	s1,8(sp)
    80002eac:	02010113          	addi	sp,sp,32
    80002eb0:	00008067          	ret

0000000080002eb4 <_ZN4KSem5blockEv>:
void KSem::signal() {
	if(!working) return;
	if (val++ < 0) unblock();
}

void KSem::block() {
    80002eb4:	ff010113          	addi	sp,sp,-16
    80002eb8:	00113423          	sd	ra,8(sp)
    80002ebc:	00813023          	sd	s0,0(sp)
    80002ec0:	01010413          	addi	s0,sp,16
	TCB::running->setBlocked(true);
    80002ec4:	00004797          	auipc	a5,0x4
    80002ec8:	44c7b783          	ld	a5,1100(a5) # 80007310 <_GLOBAL_OFFSET_TABLE_+0x20>
    80002ecc:	0007b583          	ld	a1,0(a5)
	void setBlocked(bool block) { this->blocked = block; }
    80002ed0:	00100793          	li	a5,1
    80002ed4:	02f588a3          	sb	a5,49(a1)
	blocked.putLast(TCB::running);
    80002ed8:	00850513          	addi	a0,a0,8
    80002edc:	ffffe097          	auipc	ra,0xffffe
    80002ee0:	348080e7          	jalr	840(ra) # 80001224 <_ZN11ThreadQueue7putLastEP3TCB>
	TCB::yield();
    80002ee4:	00000097          	auipc	ra,0x0
    80002ee8:	a44080e7          	jalr	-1468(ra) # 80002928 <_ZN3TCB5yieldEv>
}
    80002eec:	00813083          	ld	ra,8(sp)
    80002ef0:	00013403          	ld	s0,0(sp)
    80002ef4:	01010113          	addi	sp,sp,16
    80002ef8:	00008067          	ret

0000000080002efc <_ZN4KSem4waitEv>:
	if(!working) return;
    80002efc:	01854783          	lbu	a5,24(a0)
    80002f00:	00078c63          	beqz	a5,80002f18 <_ZN4KSem4waitEv+0x1c>
	if (--val < 0) block();
    80002f04:	00052783          	lw	a5,0(a0)
    80002f08:	fff7879b          	addiw	a5,a5,-1
    80002f0c:	00f52023          	sw	a5,0(a0)
    80002f10:	02079713          	slli	a4,a5,0x20
    80002f14:	00074463          	bltz	a4,80002f1c <_ZN4KSem4waitEv+0x20>
    80002f18:	00008067          	ret
void KSem::wait() {
    80002f1c:	ff010113          	addi	sp,sp,-16
    80002f20:	00113423          	sd	ra,8(sp)
    80002f24:	00813023          	sd	s0,0(sp)
    80002f28:	01010413          	addi	s0,sp,16
	if (--val < 0) block();
    80002f2c:	00000097          	auipc	ra,0x0
    80002f30:	f88080e7          	jalr	-120(ra) # 80002eb4 <_ZN4KSem5blockEv>
}
    80002f34:	00813083          	ld	ra,8(sp)
    80002f38:	00013403          	ld	s0,0(sp)
    80002f3c:	01010113          	addi	sp,sp,16
    80002f40:	00008067          	ret

0000000080002f44 <_ZN4KSem7unblockEv>:

void KSem::unblock() {
    80002f44:	ff010113          	addi	sp,sp,-16
    80002f48:	00113423          	sd	ra,8(sp)
    80002f4c:	00813023          	sd	s0,0(sp)
    80002f50:	01010413          	addi	s0,sp,16
	TCB* tcb = blocked.getFirst();
    80002f54:	00850513          	addi	a0,a0,8
    80002f58:	ffffe097          	auipc	ra,0xffffe
    80002f5c:	338080e7          	jalr	824(ra) # 80001290 <_ZN11ThreadQueue8getFirstEv>
    80002f60:	020508a3          	sb	zero,49(a0)
	tcb->setBlocked(false);
	Scheduler::put(tcb);
    80002f64:	ffffe097          	auipc	ra,0xffffe
    80002f68:	684080e7          	jalr	1668(ra) # 800015e8 <_ZN9Scheduler3putEP3TCB>
}
    80002f6c:	00813083          	ld	ra,8(sp)
    80002f70:	00013403          	ld	s0,0(sp)
    80002f74:	01010113          	addi	sp,sp,16
    80002f78:	00008067          	ret

0000000080002f7c <_ZN4KSem6signalEv>:
	if(!working) return;
    80002f7c:	01854783          	lbu	a5,24(a0)
    80002f80:	00078a63          	beqz	a5,80002f94 <_ZN4KSem6signalEv+0x18>
	if (val++ < 0) unblock();
    80002f84:	00052783          	lw	a5,0(a0)
    80002f88:	0017871b          	addiw	a4,a5,1
    80002f8c:	00e52023          	sw	a4,0(a0)
    80002f90:	0007c463          	bltz	a5,80002f98 <_ZN4KSem6signalEv+0x1c>
    80002f94:	00008067          	ret
void KSem::signal() {
    80002f98:	ff010113          	addi	sp,sp,-16
    80002f9c:	00113423          	sd	ra,8(sp)
    80002fa0:	00813023          	sd	s0,0(sp)
    80002fa4:	01010413          	addi	s0,sp,16
	if (val++ < 0) unblock();
    80002fa8:	00000097          	auipc	ra,0x0
    80002fac:	f9c080e7          	jalr	-100(ra) # 80002f44 <_ZN4KSem7unblockEv>
}
    80002fb0:	00813083          	ld	ra,8(sp)
    80002fb4:	00013403          	ld	s0,0(sp)
    80002fb8:	01010113          	addi	sp,sp,16
    80002fbc:	00008067          	ret

0000000080002fc0 <_ZN4KSem8closeSemEPS_>:

int KSem::closeSem(sem_t handle) {
    80002fc0:	fe010113          	addi	sp,sp,-32
    80002fc4:	00113c23          	sd	ra,24(sp)
    80002fc8:	00813823          	sd	s0,16(sp)
    80002fcc:	00913423          	sd	s1,8(sp)
    80002fd0:	02010413          	addi	s0,sp,32
    80002fd4:	00050493          	mv	s1,a0
	handle->working=false;
    80002fd8:	00050c23          	sb	zero,24(a0)
		return front == nullptr;
    80002fdc:	0084b783          	ld	a5,8(s1)
	while(!handle->blocked.isEmpty()){
    80002fe0:	02078063          	beqz	a5,80003000 <_ZN4KSem8closeSemEPS_+0x40>
		TCB* tcb = handle->blocked.getFirst();
    80002fe4:	00848513          	addi	a0,s1,8
    80002fe8:	ffffe097          	auipc	ra,0xffffe
    80002fec:	2a8080e7          	jalr	680(ra) # 80001290 <_ZN11ThreadQueue8getFirstEv>
    80002ff0:	020508a3          	sb	zero,49(a0)
		tcb->setBlocked(false);
		Scheduler::put(tcb);
    80002ff4:	ffffe097          	auipc	ra,0xffffe
    80002ff8:	5f4080e7          	jalr	1524(ra) # 800015e8 <_ZN9Scheduler3putEP3TCB>
	while(!handle->blocked.isEmpty()){
    80002ffc:	fe1ff06f          	j	80002fdc <_ZN4KSem8closeSemEPS_+0x1c>
	}
	return 0;
}
    80003000:	00000513          	li	a0,0
    80003004:	01813083          	ld	ra,24(sp)
    80003008:	01013403          	ld	s0,16(sp)
    8000300c:	00813483          	ld	s1,8(sp)
    80003010:	02010113          	addi	sp,sp,32
    80003014:	00008067          	ret

0000000080003018 <_Z10testMemoryv>:
// Created by os on 5/29/23.
//
#include "../h/MemoryAllocator.hpp"
#include "../h/helper.hpp"

void testMemory() {
    80003018:	81010113          	addi	sp,sp,-2032
    8000301c:	7e113423          	sd	ra,2024(sp)
    80003020:	7e813023          	sd	s0,2016(sp)
    80003024:	7c913c23          	sd	s1,2008(sp)
    80003028:	7f010413          	addi	s0,sp,2032
    8000302c:	83010113          	addi	sp,sp,-2000
	const uint64 NumAllocations = 500;    //zasto nece za preko 500????
	const uint64 AllocationSize = 16;

	// Allocate and initialize pointers
	int* allocations[NumAllocations];
	for (uint64 i = 0; i < NumAllocations; ++i)
    80003030:	00000713          	li	a4,0
    80003034:	1f300793          	li	a5,499
    80003038:	02e7e263          	bltu	a5,a4,8000305c <_Z10testMemoryv+0x44>
		allocations[i] = nullptr;
    8000303c:	fffff7b7          	lui	a5,0xfffff
    80003040:	00371693          	slli	a3,a4,0x3
    80003044:	fe040613          	addi	a2,s0,-32
    80003048:	00f607b3          	add	a5,a2,a5
    8000304c:	00d787b3          	add	a5,a5,a3
    80003050:	0607b023          	sd	zero,96(a5) # fffffffffffff060 <end+0xffffffff7fff6a40>
	for (uint64 i = 0; i < NumAllocations; ++i)
    80003054:	00170713          	addi	a4,a4,1
    80003058:	fddff06f          	j	80003034 <_Z10testMemoryv+0x1c>

	// Allocate memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
    8000305c:	00000493          	li	s1,0
    80003060:	1f300793          	li	a5,499
    80003064:	0297ea63          	bltu	a5,s1,80003098 <_Z10testMemoryv+0x80>
		allocations[i] = static_cast<int*>(MemoryAllocator::kmalloc(AllocationSize));
    80003068:	01000513          	li	a0,16
    8000306c:	00000097          	auipc	ra,0x0
    80003070:	ae0080e7          	jalr	-1312(ra) # 80002b4c <_ZN15MemoryAllocator7kmallocEm>
    80003074:	fffff737          	lui	a4,0xfffff
    80003078:	00349793          	slli	a5,s1,0x3
    8000307c:	fe040693          	addi	a3,s0,-32
    80003080:	00e68733          	add	a4,a3,a4
    80003084:	00f707b3          	add	a5,a4,a5
    80003088:	06a7b023          	sd	a0,96(a5)
		if (allocations[i] == nullptr) {
    8000308c:	00050663          	beqz	a0,80003098 <_Z10testMemoryv+0x80>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80003090:	00148493          	addi	s1,s1,1
    80003094:	fcdff06f          	j	80003060 <_Z10testMemoryv+0x48>
    80003098:	00000493          	li	s1,0
    8000309c:	0100006f          	j	800030ac <_Z10testMemoryv+0x94>
	}

	// Free memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
		if (allocations[i] != nullptr) {
			if (MemoryAllocator::kfree(allocations[i]) != 0) {
    800030a0:	00000097          	auipc	ra,0x0
    800030a4:	c54080e7          	jalr	-940(ra) # 80002cf4 <_ZN15MemoryAllocator5kfreeEPv>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    800030a8:	00148493          	addi	s1,s1,1
    800030ac:	1f300793          	li	a5,499
    800030b0:	0297e263          	bltu	a5,s1,800030d4 <_Z10testMemoryv+0xbc>
		if (allocations[i] != nullptr) {
    800030b4:	fffff737          	lui	a4,0xfffff
    800030b8:	00349793          	slli	a5,s1,0x3
    800030bc:	fe040693          	addi	a3,s0,-32
    800030c0:	00e68733          	add	a4,a3,a4
    800030c4:	00f707b3          	add	a5,a4,a5
    800030c8:	0607b503          	ld	a0,96(a5)
    800030cc:	fc051ae3          	bnez	a0,800030a0 <_Z10testMemoryv+0x88>
    800030d0:	fd9ff06f          	j	800030a8 <_Z10testMemoryv+0x90>
//				printString("\nDeallocation failed for index ");
//				printInteger(i);
			}
		}
	}
    800030d4:	7d010113          	addi	sp,sp,2000
    800030d8:	7e813083          	ld	ra,2024(sp)
    800030dc:	7e013403          	ld	s0,2016(sp)
    800030e0:	7d813483          	ld	s1,2008(sp)
    800030e4:	7f010113          	addi	sp,sp,2032
    800030e8:	00008067          	ret

00000000800030ec <start>:
    800030ec:	ff010113          	addi	sp,sp,-16
    800030f0:	00813423          	sd	s0,8(sp)
    800030f4:	01010413          	addi	s0,sp,16
    800030f8:	300027f3          	csrr	a5,mstatus
    800030fc:	ffffe737          	lui	a4,0xffffe
    80003100:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff61df>
    80003104:	00e7f7b3          	and	a5,a5,a4
    80003108:	00001737          	lui	a4,0x1
    8000310c:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80003110:	00e7e7b3          	or	a5,a5,a4
    80003114:	30079073          	csrw	mstatus,a5
    80003118:	00000797          	auipc	a5,0x0
    8000311c:	16078793          	addi	a5,a5,352 # 80003278 <system_main>
    80003120:	34179073          	csrw	mepc,a5
    80003124:	00000793          	li	a5,0
    80003128:	18079073          	csrw	satp,a5
    8000312c:	000107b7          	lui	a5,0x10
    80003130:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80003134:	30279073          	csrw	medeleg,a5
    80003138:	30379073          	csrw	mideleg,a5
    8000313c:	104027f3          	csrr	a5,sie
    80003140:	2227e793          	ori	a5,a5,546
    80003144:	10479073          	csrw	sie,a5
    80003148:	fff00793          	li	a5,-1
    8000314c:	00a7d793          	srli	a5,a5,0xa
    80003150:	3b079073          	csrw	pmpaddr0,a5
    80003154:	00f00793          	li	a5,15
    80003158:	3a079073          	csrw	pmpcfg0,a5
    8000315c:	f14027f3          	csrr	a5,mhartid
    80003160:	0200c737          	lui	a4,0x200c
    80003164:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003168:	0007869b          	sext.w	a3,a5
    8000316c:	00269713          	slli	a4,a3,0x2
    80003170:	000f4637          	lui	a2,0xf4
    80003174:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003178:	00d70733          	add	a4,a4,a3
    8000317c:	0037979b          	slliw	a5,a5,0x3
    80003180:	020046b7          	lui	a3,0x2004
    80003184:	00d787b3          	add	a5,a5,a3
    80003188:	00c585b3          	add	a1,a1,a2
    8000318c:	00371693          	slli	a3,a4,0x3
    80003190:	00004717          	auipc	a4,0x4
    80003194:	23070713          	addi	a4,a4,560 # 800073c0 <timer_scratch>
    80003198:	00b7b023          	sd	a1,0(a5)
    8000319c:	00d70733          	add	a4,a4,a3
    800031a0:	00f73c23          	sd	a5,24(a4)
    800031a4:	02c73023          	sd	a2,32(a4)
    800031a8:	34071073          	csrw	mscratch,a4
    800031ac:	00000797          	auipc	a5,0x0
    800031b0:	6e478793          	addi	a5,a5,1764 # 80003890 <timervec>
    800031b4:	30579073          	csrw	mtvec,a5
    800031b8:	300027f3          	csrr	a5,mstatus
    800031bc:	0087e793          	ori	a5,a5,8
    800031c0:	30079073          	csrw	mstatus,a5
    800031c4:	304027f3          	csrr	a5,mie
    800031c8:	0807e793          	ori	a5,a5,128
    800031cc:	30479073          	csrw	mie,a5
    800031d0:	f14027f3          	csrr	a5,mhartid
    800031d4:	0007879b          	sext.w	a5,a5
    800031d8:	00078213          	mv	tp,a5
    800031dc:	30200073          	mret
    800031e0:	00813403          	ld	s0,8(sp)
    800031e4:	01010113          	addi	sp,sp,16
    800031e8:	00008067          	ret

00000000800031ec <timerinit>:
    800031ec:	ff010113          	addi	sp,sp,-16
    800031f0:	00813423          	sd	s0,8(sp)
    800031f4:	01010413          	addi	s0,sp,16
    800031f8:	f14027f3          	csrr	a5,mhartid
    800031fc:	0200c737          	lui	a4,0x200c
    80003200:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003204:	0007869b          	sext.w	a3,a5
    80003208:	00269713          	slli	a4,a3,0x2
    8000320c:	000f4637          	lui	a2,0xf4
    80003210:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003214:	00d70733          	add	a4,a4,a3
    80003218:	0037979b          	slliw	a5,a5,0x3
    8000321c:	020046b7          	lui	a3,0x2004
    80003220:	00d787b3          	add	a5,a5,a3
    80003224:	00c585b3          	add	a1,a1,a2
    80003228:	00371693          	slli	a3,a4,0x3
    8000322c:	00004717          	auipc	a4,0x4
    80003230:	19470713          	addi	a4,a4,404 # 800073c0 <timer_scratch>
    80003234:	00b7b023          	sd	a1,0(a5)
    80003238:	00d70733          	add	a4,a4,a3
    8000323c:	00f73c23          	sd	a5,24(a4)
    80003240:	02c73023          	sd	a2,32(a4)
    80003244:	34071073          	csrw	mscratch,a4
    80003248:	00000797          	auipc	a5,0x0
    8000324c:	64878793          	addi	a5,a5,1608 # 80003890 <timervec>
    80003250:	30579073          	csrw	mtvec,a5
    80003254:	300027f3          	csrr	a5,mstatus
    80003258:	0087e793          	ori	a5,a5,8
    8000325c:	30079073          	csrw	mstatus,a5
    80003260:	304027f3          	csrr	a5,mie
    80003264:	0807e793          	ori	a5,a5,128
    80003268:	30479073          	csrw	mie,a5
    8000326c:	00813403          	ld	s0,8(sp)
    80003270:	01010113          	addi	sp,sp,16
    80003274:	00008067          	ret

0000000080003278 <system_main>:
    80003278:	fe010113          	addi	sp,sp,-32
    8000327c:	00813823          	sd	s0,16(sp)
    80003280:	00913423          	sd	s1,8(sp)
    80003284:	00113c23          	sd	ra,24(sp)
    80003288:	02010413          	addi	s0,sp,32
    8000328c:	00000097          	auipc	ra,0x0
    80003290:	0c4080e7          	jalr	196(ra) # 80003350 <cpuid>
    80003294:	00004497          	auipc	s1,0x4
    80003298:	0ac48493          	addi	s1,s1,172 # 80007340 <started>
    8000329c:	02050263          	beqz	a0,800032c0 <system_main+0x48>
    800032a0:	0004a783          	lw	a5,0(s1)
    800032a4:	0007879b          	sext.w	a5,a5
    800032a8:	fe078ce3          	beqz	a5,800032a0 <system_main+0x28>
    800032ac:	0ff0000f          	fence
    800032b0:	00003517          	auipc	a0,0x3
    800032b4:	05850513          	addi	a0,a0,88 # 80006308 <CONSOLE_STATUS+0x2f8>
    800032b8:	00001097          	auipc	ra,0x1
    800032bc:	a74080e7          	jalr	-1420(ra) # 80003d2c <panic>
    800032c0:	00001097          	auipc	ra,0x1
    800032c4:	9c8080e7          	jalr	-1592(ra) # 80003c88 <consoleinit>
    800032c8:	00001097          	auipc	ra,0x1
    800032cc:	154080e7          	jalr	340(ra) # 8000441c <printfinit>
    800032d0:	00003517          	auipc	a0,0x3
    800032d4:	11850513          	addi	a0,a0,280 # 800063e8 <CONSOLE_STATUS+0x3d8>
    800032d8:	00001097          	auipc	ra,0x1
    800032dc:	ab0080e7          	jalr	-1360(ra) # 80003d88 <__printf>
    800032e0:	00003517          	auipc	a0,0x3
    800032e4:	ff850513          	addi	a0,a0,-8 # 800062d8 <CONSOLE_STATUS+0x2c8>
    800032e8:	00001097          	auipc	ra,0x1
    800032ec:	aa0080e7          	jalr	-1376(ra) # 80003d88 <__printf>
    800032f0:	00003517          	auipc	a0,0x3
    800032f4:	0f850513          	addi	a0,a0,248 # 800063e8 <CONSOLE_STATUS+0x3d8>
    800032f8:	00001097          	auipc	ra,0x1
    800032fc:	a90080e7          	jalr	-1392(ra) # 80003d88 <__printf>
    80003300:	00001097          	auipc	ra,0x1
    80003304:	4a8080e7          	jalr	1192(ra) # 800047a8 <kinit>
    80003308:	00000097          	auipc	ra,0x0
    8000330c:	148080e7          	jalr	328(ra) # 80003450 <trapinit>
    80003310:	00000097          	auipc	ra,0x0
    80003314:	16c080e7          	jalr	364(ra) # 8000347c <trapinithart>
    80003318:	00000097          	auipc	ra,0x0
    8000331c:	5b8080e7          	jalr	1464(ra) # 800038d0 <plicinit>
    80003320:	00000097          	auipc	ra,0x0
    80003324:	5d8080e7          	jalr	1496(ra) # 800038f8 <plicinithart>
    80003328:	00000097          	auipc	ra,0x0
    8000332c:	078080e7          	jalr	120(ra) # 800033a0 <userinit>
    80003330:	0ff0000f          	fence
    80003334:	00100793          	li	a5,1
    80003338:	00003517          	auipc	a0,0x3
    8000333c:	fb850513          	addi	a0,a0,-72 # 800062f0 <CONSOLE_STATUS+0x2e0>
    80003340:	00f4a023          	sw	a5,0(s1)
    80003344:	00001097          	auipc	ra,0x1
    80003348:	a44080e7          	jalr	-1468(ra) # 80003d88 <__printf>
    8000334c:	0000006f          	j	8000334c <system_main+0xd4>

0000000080003350 <cpuid>:
    80003350:	ff010113          	addi	sp,sp,-16
    80003354:	00813423          	sd	s0,8(sp)
    80003358:	01010413          	addi	s0,sp,16
    8000335c:	00020513          	mv	a0,tp
    80003360:	00813403          	ld	s0,8(sp)
    80003364:	0005051b          	sext.w	a0,a0
    80003368:	01010113          	addi	sp,sp,16
    8000336c:	00008067          	ret

0000000080003370 <mycpu>:
    80003370:	ff010113          	addi	sp,sp,-16
    80003374:	00813423          	sd	s0,8(sp)
    80003378:	01010413          	addi	s0,sp,16
    8000337c:	00020793          	mv	a5,tp
    80003380:	00813403          	ld	s0,8(sp)
    80003384:	0007879b          	sext.w	a5,a5
    80003388:	00779793          	slli	a5,a5,0x7
    8000338c:	00005517          	auipc	a0,0x5
    80003390:	06450513          	addi	a0,a0,100 # 800083f0 <cpus>
    80003394:	00f50533          	add	a0,a0,a5
    80003398:	01010113          	addi	sp,sp,16
    8000339c:	00008067          	ret

00000000800033a0 <userinit>:
    800033a0:	ff010113          	addi	sp,sp,-16
    800033a4:	00813423          	sd	s0,8(sp)
    800033a8:	01010413          	addi	s0,sp,16
    800033ac:	00813403          	ld	s0,8(sp)
    800033b0:	01010113          	addi	sp,sp,16
    800033b4:	ffffe317          	auipc	t1,0xffffe
    800033b8:	3e030067          	jr	992(t1) # 80001794 <main>

00000000800033bc <either_copyout>:
    800033bc:	ff010113          	addi	sp,sp,-16
    800033c0:	00813023          	sd	s0,0(sp)
    800033c4:	00113423          	sd	ra,8(sp)
    800033c8:	01010413          	addi	s0,sp,16
    800033cc:	02051663          	bnez	a0,800033f8 <either_copyout+0x3c>
    800033d0:	00058513          	mv	a0,a1
    800033d4:	00060593          	mv	a1,a2
    800033d8:	0006861b          	sext.w	a2,a3
    800033dc:	00002097          	auipc	ra,0x2
    800033e0:	c58080e7          	jalr	-936(ra) # 80005034 <__memmove>
    800033e4:	00813083          	ld	ra,8(sp)
    800033e8:	00013403          	ld	s0,0(sp)
    800033ec:	00000513          	li	a0,0
    800033f0:	01010113          	addi	sp,sp,16
    800033f4:	00008067          	ret
    800033f8:	00003517          	auipc	a0,0x3
    800033fc:	f3850513          	addi	a0,a0,-200 # 80006330 <CONSOLE_STATUS+0x320>
    80003400:	00001097          	auipc	ra,0x1
    80003404:	92c080e7          	jalr	-1748(ra) # 80003d2c <panic>

0000000080003408 <either_copyin>:
    80003408:	ff010113          	addi	sp,sp,-16
    8000340c:	00813023          	sd	s0,0(sp)
    80003410:	00113423          	sd	ra,8(sp)
    80003414:	01010413          	addi	s0,sp,16
    80003418:	02059463          	bnez	a1,80003440 <either_copyin+0x38>
    8000341c:	00060593          	mv	a1,a2
    80003420:	0006861b          	sext.w	a2,a3
    80003424:	00002097          	auipc	ra,0x2
    80003428:	c10080e7          	jalr	-1008(ra) # 80005034 <__memmove>
    8000342c:	00813083          	ld	ra,8(sp)
    80003430:	00013403          	ld	s0,0(sp)
    80003434:	00000513          	li	a0,0
    80003438:	01010113          	addi	sp,sp,16
    8000343c:	00008067          	ret
    80003440:	00003517          	auipc	a0,0x3
    80003444:	f1850513          	addi	a0,a0,-232 # 80006358 <CONSOLE_STATUS+0x348>
    80003448:	00001097          	auipc	ra,0x1
    8000344c:	8e4080e7          	jalr	-1820(ra) # 80003d2c <panic>

0000000080003450 <trapinit>:
    80003450:	ff010113          	addi	sp,sp,-16
    80003454:	00813423          	sd	s0,8(sp)
    80003458:	01010413          	addi	s0,sp,16
    8000345c:	00813403          	ld	s0,8(sp)
    80003460:	00003597          	auipc	a1,0x3
    80003464:	f2058593          	addi	a1,a1,-224 # 80006380 <CONSOLE_STATUS+0x370>
    80003468:	00005517          	auipc	a0,0x5
    8000346c:	00850513          	addi	a0,a0,8 # 80008470 <tickslock>
    80003470:	01010113          	addi	sp,sp,16
    80003474:	00001317          	auipc	t1,0x1
    80003478:	5c430067          	jr	1476(t1) # 80004a38 <initlock>

000000008000347c <trapinithart>:
    8000347c:	ff010113          	addi	sp,sp,-16
    80003480:	00813423          	sd	s0,8(sp)
    80003484:	01010413          	addi	s0,sp,16
    80003488:	00000797          	auipc	a5,0x0
    8000348c:	2f878793          	addi	a5,a5,760 # 80003780 <kernelvec>
    80003490:	10579073          	csrw	stvec,a5
    80003494:	00813403          	ld	s0,8(sp)
    80003498:	01010113          	addi	sp,sp,16
    8000349c:	00008067          	ret

00000000800034a0 <usertrap>:
    800034a0:	ff010113          	addi	sp,sp,-16
    800034a4:	00813423          	sd	s0,8(sp)
    800034a8:	01010413          	addi	s0,sp,16
    800034ac:	00813403          	ld	s0,8(sp)
    800034b0:	01010113          	addi	sp,sp,16
    800034b4:	00008067          	ret

00000000800034b8 <usertrapret>:
    800034b8:	ff010113          	addi	sp,sp,-16
    800034bc:	00813423          	sd	s0,8(sp)
    800034c0:	01010413          	addi	s0,sp,16
    800034c4:	00813403          	ld	s0,8(sp)
    800034c8:	01010113          	addi	sp,sp,16
    800034cc:	00008067          	ret

00000000800034d0 <kerneltrap>:
    800034d0:	fe010113          	addi	sp,sp,-32
    800034d4:	00813823          	sd	s0,16(sp)
    800034d8:	00113c23          	sd	ra,24(sp)
    800034dc:	00913423          	sd	s1,8(sp)
    800034e0:	02010413          	addi	s0,sp,32
    800034e4:	142025f3          	csrr	a1,scause
    800034e8:	100027f3          	csrr	a5,sstatus
    800034ec:	0027f793          	andi	a5,a5,2
    800034f0:	10079c63          	bnez	a5,80003608 <kerneltrap+0x138>
    800034f4:	142027f3          	csrr	a5,scause
    800034f8:	0207ce63          	bltz	a5,80003534 <kerneltrap+0x64>
    800034fc:	00003517          	auipc	a0,0x3
    80003500:	ecc50513          	addi	a0,a0,-308 # 800063c8 <CONSOLE_STATUS+0x3b8>
    80003504:	00001097          	auipc	ra,0x1
    80003508:	884080e7          	jalr	-1916(ra) # 80003d88 <__printf>
    8000350c:	141025f3          	csrr	a1,sepc
    80003510:	14302673          	csrr	a2,stval
    80003514:	00003517          	auipc	a0,0x3
    80003518:	ec450513          	addi	a0,a0,-316 # 800063d8 <CONSOLE_STATUS+0x3c8>
    8000351c:	00001097          	auipc	ra,0x1
    80003520:	86c080e7          	jalr	-1940(ra) # 80003d88 <__printf>
    80003524:	00003517          	auipc	a0,0x3
    80003528:	ecc50513          	addi	a0,a0,-308 # 800063f0 <CONSOLE_STATUS+0x3e0>
    8000352c:	00001097          	auipc	ra,0x1
    80003530:	800080e7          	jalr	-2048(ra) # 80003d2c <panic>
    80003534:	0ff7f713          	andi	a4,a5,255
    80003538:	00900693          	li	a3,9
    8000353c:	04d70063          	beq	a4,a3,8000357c <kerneltrap+0xac>
    80003540:	fff00713          	li	a4,-1
    80003544:	03f71713          	slli	a4,a4,0x3f
    80003548:	00170713          	addi	a4,a4,1
    8000354c:	fae798e3          	bne	a5,a4,800034fc <kerneltrap+0x2c>
    80003550:	00000097          	auipc	ra,0x0
    80003554:	e00080e7          	jalr	-512(ra) # 80003350 <cpuid>
    80003558:	06050663          	beqz	a0,800035c4 <kerneltrap+0xf4>
    8000355c:	144027f3          	csrr	a5,sip
    80003560:	ffd7f793          	andi	a5,a5,-3
    80003564:	14479073          	csrw	sip,a5
    80003568:	01813083          	ld	ra,24(sp)
    8000356c:	01013403          	ld	s0,16(sp)
    80003570:	00813483          	ld	s1,8(sp)
    80003574:	02010113          	addi	sp,sp,32
    80003578:	00008067          	ret
    8000357c:	00000097          	auipc	ra,0x0
    80003580:	3c8080e7          	jalr	968(ra) # 80003944 <plic_claim>
    80003584:	00a00793          	li	a5,10
    80003588:	00050493          	mv	s1,a0
    8000358c:	06f50863          	beq	a0,a5,800035fc <kerneltrap+0x12c>
    80003590:	fc050ce3          	beqz	a0,80003568 <kerneltrap+0x98>
    80003594:	00050593          	mv	a1,a0
    80003598:	00003517          	auipc	a0,0x3
    8000359c:	e1050513          	addi	a0,a0,-496 # 800063a8 <CONSOLE_STATUS+0x398>
    800035a0:	00000097          	auipc	ra,0x0
    800035a4:	7e8080e7          	jalr	2024(ra) # 80003d88 <__printf>
    800035a8:	01013403          	ld	s0,16(sp)
    800035ac:	01813083          	ld	ra,24(sp)
    800035b0:	00048513          	mv	a0,s1
    800035b4:	00813483          	ld	s1,8(sp)
    800035b8:	02010113          	addi	sp,sp,32
    800035bc:	00000317          	auipc	t1,0x0
    800035c0:	3c030067          	jr	960(t1) # 8000397c <plic_complete>
    800035c4:	00005517          	auipc	a0,0x5
    800035c8:	eac50513          	addi	a0,a0,-340 # 80008470 <tickslock>
    800035cc:	00001097          	auipc	ra,0x1
    800035d0:	490080e7          	jalr	1168(ra) # 80004a5c <acquire>
    800035d4:	00004717          	auipc	a4,0x4
    800035d8:	d7070713          	addi	a4,a4,-656 # 80007344 <ticks>
    800035dc:	00072783          	lw	a5,0(a4)
    800035e0:	00005517          	auipc	a0,0x5
    800035e4:	e9050513          	addi	a0,a0,-368 # 80008470 <tickslock>
    800035e8:	0017879b          	addiw	a5,a5,1
    800035ec:	00f72023          	sw	a5,0(a4)
    800035f0:	00001097          	auipc	ra,0x1
    800035f4:	538080e7          	jalr	1336(ra) # 80004b28 <release>
    800035f8:	f65ff06f          	j	8000355c <kerneltrap+0x8c>
    800035fc:	00001097          	auipc	ra,0x1
    80003600:	094080e7          	jalr	148(ra) # 80004690 <uartintr>
    80003604:	fa5ff06f          	j	800035a8 <kerneltrap+0xd8>
    80003608:	00003517          	auipc	a0,0x3
    8000360c:	d8050513          	addi	a0,a0,-640 # 80006388 <CONSOLE_STATUS+0x378>
    80003610:	00000097          	auipc	ra,0x0
    80003614:	71c080e7          	jalr	1820(ra) # 80003d2c <panic>

0000000080003618 <clockintr>:
    80003618:	fe010113          	addi	sp,sp,-32
    8000361c:	00813823          	sd	s0,16(sp)
    80003620:	00913423          	sd	s1,8(sp)
    80003624:	00113c23          	sd	ra,24(sp)
    80003628:	02010413          	addi	s0,sp,32
    8000362c:	00005497          	auipc	s1,0x5
    80003630:	e4448493          	addi	s1,s1,-444 # 80008470 <tickslock>
    80003634:	00048513          	mv	a0,s1
    80003638:	00001097          	auipc	ra,0x1
    8000363c:	424080e7          	jalr	1060(ra) # 80004a5c <acquire>
    80003640:	00004717          	auipc	a4,0x4
    80003644:	d0470713          	addi	a4,a4,-764 # 80007344 <ticks>
    80003648:	00072783          	lw	a5,0(a4)
    8000364c:	01013403          	ld	s0,16(sp)
    80003650:	01813083          	ld	ra,24(sp)
    80003654:	00048513          	mv	a0,s1
    80003658:	0017879b          	addiw	a5,a5,1
    8000365c:	00813483          	ld	s1,8(sp)
    80003660:	00f72023          	sw	a5,0(a4)
    80003664:	02010113          	addi	sp,sp,32
    80003668:	00001317          	auipc	t1,0x1
    8000366c:	4c030067          	jr	1216(t1) # 80004b28 <release>

0000000080003670 <devintr>:
    80003670:	142027f3          	csrr	a5,scause
    80003674:	00000513          	li	a0,0
    80003678:	0007c463          	bltz	a5,80003680 <devintr+0x10>
    8000367c:	00008067          	ret
    80003680:	fe010113          	addi	sp,sp,-32
    80003684:	00813823          	sd	s0,16(sp)
    80003688:	00113c23          	sd	ra,24(sp)
    8000368c:	00913423          	sd	s1,8(sp)
    80003690:	02010413          	addi	s0,sp,32
    80003694:	0ff7f713          	andi	a4,a5,255
    80003698:	00900693          	li	a3,9
    8000369c:	04d70c63          	beq	a4,a3,800036f4 <devintr+0x84>
    800036a0:	fff00713          	li	a4,-1
    800036a4:	03f71713          	slli	a4,a4,0x3f
    800036a8:	00170713          	addi	a4,a4,1
    800036ac:	00e78c63          	beq	a5,a4,800036c4 <devintr+0x54>
    800036b0:	01813083          	ld	ra,24(sp)
    800036b4:	01013403          	ld	s0,16(sp)
    800036b8:	00813483          	ld	s1,8(sp)
    800036bc:	02010113          	addi	sp,sp,32
    800036c0:	00008067          	ret
    800036c4:	00000097          	auipc	ra,0x0
    800036c8:	c8c080e7          	jalr	-884(ra) # 80003350 <cpuid>
    800036cc:	06050663          	beqz	a0,80003738 <devintr+0xc8>
    800036d0:	144027f3          	csrr	a5,sip
    800036d4:	ffd7f793          	andi	a5,a5,-3
    800036d8:	14479073          	csrw	sip,a5
    800036dc:	01813083          	ld	ra,24(sp)
    800036e0:	01013403          	ld	s0,16(sp)
    800036e4:	00813483          	ld	s1,8(sp)
    800036e8:	00200513          	li	a0,2
    800036ec:	02010113          	addi	sp,sp,32
    800036f0:	00008067          	ret
    800036f4:	00000097          	auipc	ra,0x0
    800036f8:	250080e7          	jalr	592(ra) # 80003944 <plic_claim>
    800036fc:	00a00793          	li	a5,10
    80003700:	00050493          	mv	s1,a0
    80003704:	06f50663          	beq	a0,a5,80003770 <devintr+0x100>
    80003708:	00100513          	li	a0,1
    8000370c:	fa0482e3          	beqz	s1,800036b0 <devintr+0x40>
    80003710:	00048593          	mv	a1,s1
    80003714:	00003517          	auipc	a0,0x3
    80003718:	c9450513          	addi	a0,a0,-876 # 800063a8 <CONSOLE_STATUS+0x398>
    8000371c:	00000097          	auipc	ra,0x0
    80003720:	66c080e7          	jalr	1644(ra) # 80003d88 <__printf>
    80003724:	00048513          	mv	a0,s1
    80003728:	00000097          	auipc	ra,0x0
    8000372c:	254080e7          	jalr	596(ra) # 8000397c <plic_complete>
    80003730:	00100513          	li	a0,1
    80003734:	f7dff06f          	j	800036b0 <devintr+0x40>
    80003738:	00005517          	auipc	a0,0x5
    8000373c:	d3850513          	addi	a0,a0,-712 # 80008470 <tickslock>
    80003740:	00001097          	auipc	ra,0x1
    80003744:	31c080e7          	jalr	796(ra) # 80004a5c <acquire>
    80003748:	00004717          	auipc	a4,0x4
    8000374c:	bfc70713          	addi	a4,a4,-1028 # 80007344 <ticks>
    80003750:	00072783          	lw	a5,0(a4)
    80003754:	00005517          	auipc	a0,0x5
    80003758:	d1c50513          	addi	a0,a0,-740 # 80008470 <tickslock>
    8000375c:	0017879b          	addiw	a5,a5,1
    80003760:	00f72023          	sw	a5,0(a4)
    80003764:	00001097          	auipc	ra,0x1
    80003768:	3c4080e7          	jalr	964(ra) # 80004b28 <release>
    8000376c:	f65ff06f          	j	800036d0 <devintr+0x60>
    80003770:	00001097          	auipc	ra,0x1
    80003774:	f20080e7          	jalr	-224(ra) # 80004690 <uartintr>
    80003778:	fadff06f          	j	80003724 <devintr+0xb4>
    8000377c:	0000                	unimp
	...

0000000080003780 <kernelvec>:
    80003780:	f0010113          	addi	sp,sp,-256
    80003784:	00113023          	sd	ra,0(sp)
    80003788:	00213423          	sd	sp,8(sp)
    8000378c:	00313823          	sd	gp,16(sp)
    80003790:	00413c23          	sd	tp,24(sp)
    80003794:	02513023          	sd	t0,32(sp)
    80003798:	02613423          	sd	t1,40(sp)
    8000379c:	02713823          	sd	t2,48(sp)
    800037a0:	02813c23          	sd	s0,56(sp)
    800037a4:	04913023          	sd	s1,64(sp)
    800037a8:	04a13423          	sd	a0,72(sp)
    800037ac:	04b13823          	sd	a1,80(sp)
    800037b0:	04c13c23          	sd	a2,88(sp)
    800037b4:	06d13023          	sd	a3,96(sp)
    800037b8:	06e13423          	sd	a4,104(sp)
    800037bc:	06f13823          	sd	a5,112(sp)
    800037c0:	07013c23          	sd	a6,120(sp)
    800037c4:	09113023          	sd	a7,128(sp)
    800037c8:	09213423          	sd	s2,136(sp)
    800037cc:	09313823          	sd	s3,144(sp)
    800037d0:	09413c23          	sd	s4,152(sp)
    800037d4:	0b513023          	sd	s5,160(sp)
    800037d8:	0b613423          	sd	s6,168(sp)
    800037dc:	0b713823          	sd	s7,176(sp)
    800037e0:	0b813c23          	sd	s8,184(sp)
    800037e4:	0d913023          	sd	s9,192(sp)
    800037e8:	0da13423          	sd	s10,200(sp)
    800037ec:	0db13823          	sd	s11,208(sp)
    800037f0:	0dc13c23          	sd	t3,216(sp)
    800037f4:	0fd13023          	sd	t4,224(sp)
    800037f8:	0fe13423          	sd	t5,232(sp)
    800037fc:	0ff13823          	sd	t6,240(sp)
    80003800:	cd1ff0ef          	jal	ra,800034d0 <kerneltrap>
    80003804:	00013083          	ld	ra,0(sp)
    80003808:	00813103          	ld	sp,8(sp)
    8000380c:	01013183          	ld	gp,16(sp)
    80003810:	02013283          	ld	t0,32(sp)
    80003814:	02813303          	ld	t1,40(sp)
    80003818:	03013383          	ld	t2,48(sp)
    8000381c:	03813403          	ld	s0,56(sp)
    80003820:	04013483          	ld	s1,64(sp)
    80003824:	04813503          	ld	a0,72(sp)
    80003828:	05013583          	ld	a1,80(sp)
    8000382c:	05813603          	ld	a2,88(sp)
    80003830:	06013683          	ld	a3,96(sp)
    80003834:	06813703          	ld	a4,104(sp)
    80003838:	07013783          	ld	a5,112(sp)
    8000383c:	07813803          	ld	a6,120(sp)
    80003840:	08013883          	ld	a7,128(sp)
    80003844:	08813903          	ld	s2,136(sp)
    80003848:	09013983          	ld	s3,144(sp)
    8000384c:	09813a03          	ld	s4,152(sp)
    80003850:	0a013a83          	ld	s5,160(sp)
    80003854:	0a813b03          	ld	s6,168(sp)
    80003858:	0b013b83          	ld	s7,176(sp)
    8000385c:	0b813c03          	ld	s8,184(sp)
    80003860:	0c013c83          	ld	s9,192(sp)
    80003864:	0c813d03          	ld	s10,200(sp)
    80003868:	0d013d83          	ld	s11,208(sp)
    8000386c:	0d813e03          	ld	t3,216(sp)
    80003870:	0e013e83          	ld	t4,224(sp)
    80003874:	0e813f03          	ld	t5,232(sp)
    80003878:	0f013f83          	ld	t6,240(sp)
    8000387c:	10010113          	addi	sp,sp,256
    80003880:	10200073          	sret
    80003884:	00000013          	nop
    80003888:	00000013          	nop
    8000388c:	00000013          	nop

0000000080003890 <timervec>:
    80003890:	34051573          	csrrw	a0,mscratch,a0
    80003894:	00b53023          	sd	a1,0(a0)
    80003898:	00c53423          	sd	a2,8(a0)
    8000389c:	00d53823          	sd	a3,16(a0)
    800038a0:	01853583          	ld	a1,24(a0)
    800038a4:	02053603          	ld	a2,32(a0)
    800038a8:	0005b683          	ld	a3,0(a1)
    800038ac:	00c686b3          	add	a3,a3,a2
    800038b0:	00d5b023          	sd	a3,0(a1)
    800038b4:	00200593          	li	a1,2
    800038b8:	14459073          	csrw	sip,a1
    800038bc:	01053683          	ld	a3,16(a0)
    800038c0:	00853603          	ld	a2,8(a0)
    800038c4:	00053583          	ld	a1,0(a0)
    800038c8:	34051573          	csrrw	a0,mscratch,a0
    800038cc:	30200073          	mret

00000000800038d0 <plicinit>:
    800038d0:	ff010113          	addi	sp,sp,-16
    800038d4:	00813423          	sd	s0,8(sp)
    800038d8:	01010413          	addi	s0,sp,16
    800038dc:	00813403          	ld	s0,8(sp)
    800038e0:	0c0007b7          	lui	a5,0xc000
    800038e4:	00100713          	li	a4,1
    800038e8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800038ec:	00e7a223          	sw	a4,4(a5)
    800038f0:	01010113          	addi	sp,sp,16
    800038f4:	00008067          	ret

00000000800038f8 <plicinithart>:
    800038f8:	ff010113          	addi	sp,sp,-16
    800038fc:	00813023          	sd	s0,0(sp)
    80003900:	00113423          	sd	ra,8(sp)
    80003904:	01010413          	addi	s0,sp,16
    80003908:	00000097          	auipc	ra,0x0
    8000390c:	a48080e7          	jalr	-1464(ra) # 80003350 <cpuid>
    80003910:	0085171b          	slliw	a4,a0,0x8
    80003914:	0c0027b7          	lui	a5,0xc002
    80003918:	00e787b3          	add	a5,a5,a4
    8000391c:	40200713          	li	a4,1026
    80003920:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80003924:	00813083          	ld	ra,8(sp)
    80003928:	00013403          	ld	s0,0(sp)
    8000392c:	00d5151b          	slliw	a0,a0,0xd
    80003930:	0c2017b7          	lui	a5,0xc201
    80003934:	00a78533          	add	a0,a5,a0
    80003938:	00052023          	sw	zero,0(a0)
    8000393c:	01010113          	addi	sp,sp,16
    80003940:	00008067          	ret

0000000080003944 <plic_claim>:
    80003944:	ff010113          	addi	sp,sp,-16
    80003948:	00813023          	sd	s0,0(sp)
    8000394c:	00113423          	sd	ra,8(sp)
    80003950:	01010413          	addi	s0,sp,16
    80003954:	00000097          	auipc	ra,0x0
    80003958:	9fc080e7          	jalr	-1540(ra) # 80003350 <cpuid>
    8000395c:	00813083          	ld	ra,8(sp)
    80003960:	00013403          	ld	s0,0(sp)
    80003964:	00d5151b          	slliw	a0,a0,0xd
    80003968:	0c2017b7          	lui	a5,0xc201
    8000396c:	00a78533          	add	a0,a5,a0
    80003970:	00452503          	lw	a0,4(a0)
    80003974:	01010113          	addi	sp,sp,16
    80003978:	00008067          	ret

000000008000397c <plic_complete>:
    8000397c:	fe010113          	addi	sp,sp,-32
    80003980:	00813823          	sd	s0,16(sp)
    80003984:	00913423          	sd	s1,8(sp)
    80003988:	00113c23          	sd	ra,24(sp)
    8000398c:	02010413          	addi	s0,sp,32
    80003990:	00050493          	mv	s1,a0
    80003994:	00000097          	auipc	ra,0x0
    80003998:	9bc080e7          	jalr	-1604(ra) # 80003350 <cpuid>
    8000399c:	01813083          	ld	ra,24(sp)
    800039a0:	01013403          	ld	s0,16(sp)
    800039a4:	00d5179b          	slliw	a5,a0,0xd
    800039a8:	0c201737          	lui	a4,0xc201
    800039ac:	00f707b3          	add	a5,a4,a5
    800039b0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800039b4:	00813483          	ld	s1,8(sp)
    800039b8:	02010113          	addi	sp,sp,32
    800039bc:	00008067          	ret

00000000800039c0 <consolewrite>:
    800039c0:	fb010113          	addi	sp,sp,-80
    800039c4:	04813023          	sd	s0,64(sp)
    800039c8:	04113423          	sd	ra,72(sp)
    800039cc:	02913c23          	sd	s1,56(sp)
    800039d0:	03213823          	sd	s2,48(sp)
    800039d4:	03313423          	sd	s3,40(sp)
    800039d8:	03413023          	sd	s4,32(sp)
    800039dc:	01513c23          	sd	s5,24(sp)
    800039e0:	05010413          	addi	s0,sp,80
    800039e4:	06c05c63          	blez	a2,80003a5c <consolewrite+0x9c>
    800039e8:	00060993          	mv	s3,a2
    800039ec:	00050a13          	mv	s4,a0
    800039f0:	00058493          	mv	s1,a1
    800039f4:	00000913          	li	s2,0
    800039f8:	fff00a93          	li	s5,-1
    800039fc:	01c0006f          	j	80003a18 <consolewrite+0x58>
    80003a00:	fbf44503          	lbu	a0,-65(s0)
    80003a04:	0019091b          	addiw	s2,s2,1
    80003a08:	00148493          	addi	s1,s1,1
    80003a0c:	00001097          	auipc	ra,0x1
    80003a10:	a9c080e7          	jalr	-1380(ra) # 800044a8 <uartputc>
    80003a14:	03298063          	beq	s3,s2,80003a34 <consolewrite+0x74>
    80003a18:	00048613          	mv	a2,s1
    80003a1c:	00100693          	li	a3,1
    80003a20:	000a0593          	mv	a1,s4
    80003a24:	fbf40513          	addi	a0,s0,-65
    80003a28:	00000097          	auipc	ra,0x0
    80003a2c:	9e0080e7          	jalr	-1568(ra) # 80003408 <either_copyin>
    80003a30:	fd5518e3          	bne	a0,s5,80003a00 <consolewrite+0x40>
    80003a34:	04813083          	ld	ra,72(sp)
    80003a38:	04013403          	ld	s0,64(sp)
    80003a3c:	03813483          	ld	s1,56(sp)
    80003a40:	02813983          	ld	s3,40(sp)
    80003a44:	02013a03          	ld	s4,32(sp)
    80003a48:	01813a83          	ld	s5,24(sp)
    80003a4c:	00090513          	mv	a0,s2
    80003a50:	03013903          	ld	s2,48(sp)
    80003a54:	05010113          	addi	sp,sp,80
    80003a58:	00008067          	ret
    80003a5c:	00000913          	li	s2,0
    80003a60:	fd5ff06f          	j	80003a34 <consolewrite+0x74>

0000000080003a64 <consoleread>:
    80003a64:	f9010113          	addi	sp,sp,-112
    80003a68:	06813023          	sd	s0,96(sp)
    80003a6c:	04913c23          	sd	s1,88(sp)
    80003a70:	05213823          	sd	s2,80(sp)
    80003a74:	05313423          	sd	s3,72(sp)
    80003a78:	05413023          	sd	s4,64(sp)
    80003a7c:	03513c23          	sd	s5,56(sp)
    80003a80:	03613823          	sd	s6,48(sp)
    80003a84:	03713423          	sd	s7,40(sp)
    80003a88:	03813023          	sd	s8,32(sp)
    80003a8c:	06113423          	sd	ra,104(sp)
    80003a90:	01913c23          	sd	s9,24(sp)
    80003a94:	07010413          	addi	s0,sp,112
    80003a98:	00060b93          	mv	s7,a2
    80003a9c:	00050913          	mv	s2,a0
    80003aa0:	00058c13          	mv	s8,a1
    80003aa4:	00060b1b          	sext.w	s6,a2
    80003aa8:	00005497          	auipc	s1,0x5
    80003aac:	9f048493          	addi	s1,s1,-1552 # 80008498 <cons>
    80003ab0:	00400993          	li	s3,4
    80003ab4:	fff00a13          	li	s4,-1
    80003ab8:	00a00a93          	li	s5,10
    80003abc:	05705e63          	blez	s7,80003b18 <consoleread+0xb4>
    80003ac0:	09c4a703          	lw	a4,156(s1)
    80003ac4:	0984a783          	lw	a5,152(s1)
    80003ac8:	0007071b          	sext.w	a4,a4
    80003acc:	08e78463          	beq	a5,a4,80003b54 <consoleread+0xf0>
    80003ad0:	07f7f713          	andi	a4,a5,127
    80003ad4:	00e48733          	add	a4,s1,a4
    80003ad8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80003adc:	0017869b          	addiw	a3,a5,1
    80003ae0:	08d4ac23          	sw	a3,152(s1)
    80003ae4:	00070c9b          	sext.w	s9,a4
    80003ae8:	0b370663          	beq	a4,s3,80003b94 <consoleread+0x130>
    80003aec:	00100693          	li	a3,1
    80003af0:	f9f40613          	addi	a2,s0,-97
    80003af4:	000c0593          	mv	a1,s8
    80003af8:	00090513          	mv	a0,s2
    80003afc:	f8e40fa3          	sb	a4,-97(s0)
    80003b00:	00000097          	auipc	ra,0x0
    80003b04:	8bc080e7          	jalr	-1860(ra) # 800033bc <either_copyout>
    80003b08:	01450863          	beq	a0,s4,80003b18 <consoleread+0xb4>
    80003b0c:	001c0c13          	addi	s8,s8,1
    80003b10:	fffb8b9b          	addiw	s7,s7,-1
    80003b14:	fb5c94e3          	bne	s9,s5,80003abc <consoleread+0x58>
    80003b18:	000b851b          	sext.w	a0,s7
    80003b1c:	06813083          	ld	ra,104(sp)
    80003b20:	06013403          	ld	s0,96(sp)
    80003b24:	05813483          	ld	s1,88(sp)
    80003b28:	05013903          	ld	s2,80(sp)
    80003b2c:	04813983          	ld	s3,72(sp)
    80003b30:	04013a03          	ld	s4,64(sp)
    80003b34:	03813a83          	ld	s5,56(sp)
    80003b38:	02813b83          	ld	s7,40(sp)
    80003b3c:	02013c03          	ld	s8,32(sp)
    80003b40:	01813c83          	ld	s9,24(sp)
    80003b44:	40ab053b          	subw	a0,s6,a0
    80003b48:	03013b03          	ld	s6,48(sp)
    80003b4c:	07010113          	addi	sp,sp,112
    80003b50:	00008067          	ret
    80003b54:	00001097          	auipc	ra,0x1
    80003b58:	1d8080e7          	jalr	472(ra) # 80004d2c <push_on>
    80003b5c:	0984a703          	lw	a4,152(s1)
    80003b60:	09c4a783          	lw	a5,156(s1)
    80003b64:	0007879b          	sext.w	a5,a5
    80003b68:	fef70ce3          	beq	a4,a5,80003b60 <consoleread+0xfc>
    80003b6c:	00001097          	auipc	ra,0x1
    80003b70:	234080e7          	jalr	564(ra) # 80004da0 <pop_on>
    80003b74:	0984a783          	lw	a5,152(s1)
    80003b78:	07f7f713          	andi	a4,a5,127
    80003b7c:	00e48733          	add	a4,s1,a4
    80003b80:	01874703          	lbu	a4,24(a4)
    80003b84:	0017869b          	addiw	a3,a5,1
    80003b88:	08d4ac23          	sw	a3,152(s1)
    80003b8c:	00070c9b          	sext.w	s9,a4
    80003b90:	f5371ee3          	bne	a4,s3,80003aec <consoleread+0x88>
    80003b94:	000b851b          	sext.w	a0,s7
    80003b98:	f96bf2e3          	bgeu	s7,s6,80003b1c <consoleread+0xb8>
    80003b9c:	08f4ac23          	sw	a5,152(s1)
    80003ba0:	f7dff06f          	j	80003b1c <consoleread+0xb8>

0000000080003ba4 <consputc>:
    80003ba4:	10000793          	li	a5,256
    80003ba8:	00f50663          	beq	a0,a5,80003bb4 <consputc+0x10>
    80003bac:	00001317          	auipc	t1,0x1
    80003bb0:	9f430067          	jr	-1548(t1) # 800045a0 <uartputc_sync>
    80003bb4:	ff010113          	addi	sp,sp,-16
    80003bb8:	00113423          	sd	ra,8(sp)
    80003bbc:	00813023          	sd	s0,0(sp)
    80003bc0:	01010413          	addi	s0,sp,16
    80003bc4:	00800513          	li	a0,8
    80003bc8:	00001097          	auipc	ra,0x1
    80003bcc:	9d8080e7          	jalr	-1576(ra) # 800045a0 <uartputc_sync>
    80003bd0:	02000513          	li	a0,32
    80003bd4:	00001097          	auipc	ra,0x1
    80003bd8:	9cc080e7          	jalr	-1588(ra) # 800045a0 <uartputc_sync>
    80003bdc:	00013403          	ld	s0,0(sp)
    80003be0:	00813083          	ld	ra,8(sp)
    80003be4:	00800513          	li	a0,8
    80003be8:	01010113          	addi	sp,sp,16
    80003bec:	00001317          	auipc	t1,0x1
    80003bf0:	9b430067          	jr	-1612(t1) # 800045a0 <uartputc_sync>

0000000080003bf4 <consoleintr>:
    80003bf4:	fe010113          	addi	sp,sp,-32
    80003bf8:	00813823          	sd	s0,16(sp)
    80003bfc:	00913423          	sd	s1,8(sp)
    80003c00:	01213023          	sd	s2,0(sp)
    80003c04:	00113c23          	sd	ra,24(sp)
    80003c08:	02010413          	addi	s0,sp,32
    80003c0c:	00005917          	auipc	s2,0x5
    80003c10:	88c90913          	addi	s2,s2,-1908 # 80008498 <cons>
    80003c14:	00050493          	mv	s1,a0
    80003c18:	00090513          	mv	a0,s2
    80003c1c:	00001097          	auipc	ra,0x1
    80003c20:	e40080e7          	jalr	-448(ra) # 80004a5c <acquire>
    80003c24:	02048c63          	beqz	s1,80003c5c <consoleintr+0x68>
    80003c28:	0a092783          	lw	a5,160(s2)
    80003c2c:	09892703          	lw	a4,152(s2)
    80003c30:	07f00693          	li	a3,127
    80003c34:	40e7873b          	subw	a4,a5,a4
    80003c38:	02e6e263          	bltu	a3,a4,80003c5c <consoleintr+0x68>
    80003c3c:	00d00713          	li	a4,13
    80003c40:	04e48063          	beq	s1,a4,80003c80 <consoleintr+0x8c>
    80003c44:	07f7f713          	andi	a4,a5,127
    80003c48:	00e90733          	add	a4,s2,a4
    80003c4c:	0017879b          	addiw	a5,a5,1
    80003c50:	0af92023          	sw	a5,160(s2)
    80003c54:	00970c23          	sb	s1,24(a4)
    80003c58:	08f92e23          	sw	a5,156(s2)
    80003c5c:	01013403          	ld	s0,16(sp)
    80003c60:	01813083          	ld	ra,24(sp)
    80003c64:	00813483          	ld	s1,8(sp)
    80003c68:	00013903          	ld	s2,0(sp)
    80003c6c:	00005517          	auipc	a0,0x5
    80003c70:	82c50513          	addi	a0,a0,-2004 # 80008498 <cons>
    80003c74:	02010113          	addi	sp,sp,32
    80003c78:	00001317          	auipc	t1,0x1
    80003c7c:	eb030067          	jr	-336(t1) # 80004b28 <release>
    80003c80:	00a00493          	li	s1,10
    80003c84:	fc1ff06f          	j	80003c44 <consoleintr+0x50>

0000000080003c88 <consoleinit>:
    80003c88:	fe010113          	addi	sp,sp,-32
    80003c8c:	00113c23          	sd	ra,24(sp)
    80003c90:	00813823          	sd	s0,16(sp)
    80003c94:	00913423          	sd	s1,8(sp)
    80003c98:	02010413          	addi	s0,sp,32
    80003c9c:	00004497          	auipc	s1,0x4
    80003ca0:	7fc48493          	addi	s1,s1,2044 # 80008498 <cons>
    80003ca4:	00048513          	mv	a0,s1
    80003ca8:	00002597          	auipc	a1,0x2
    80003cac:	75858593          	addi	a1,a1,1880 # 80006400 <CONSOLE_STATUS+0x3f0>
    80003cb0:	00001097          	auipc	ra,0x1
    80003cb4:	d88080e7          	jalr	-632(ra) # 80004a38 <initlock>
    80003cb8:	00000097          	auipc	ra,0x0
    80003cbc:	7ac080e7          	jalr	1964(ra) # 80004464 <uartinit>
    80003cc0:	01813083          	ld	ra,24(sp)
    80003cc4:	01013403          	ld	s0,16(sp)
    80003cc8:	00000797          	auipc	a5,0x0
    80003ccc:	d9c78793          	addi	a5,a5,-612 # 80003a64 <consoleread>
    80003cd0:	0af4bc23          	sd	a5,184(s1)
    80003cd4:	00000797          	auipc	a5,0x0
    80003cd8:	cec78793          	addi	a5,a5,-788 # 800039c0 <consolewrite>
    80003cdc:	0cf4b023          	sd	a5,192(s1)
    80003ce0:	00813483          	ld	s1,8(sp)
    80003ce4:	02010113          	addi	sp,sp,32
    80003ce8:	00008067          	ret

0000000080003cec <console_read>:
    80003cec:	ff010113          	addi	sp,sp,-16
    80003cf0:	00813423          	sd	s0,8(sp)
    80003cf4:	01010413          	addi	s0,sp,16
    80003cf8:	00813403          	ld	s0,8(sp)
    80003cfc:	00005317          	auipc	t1,0x5
    80003d00:	85433303          	ld	t1,-1964(t1) # 80008550 <devsw+0x10>
    80003d04:	01010113          	addi	sp,sp,16
    80003d08:	00030067          	jr	t1

0000000080003d0c <console_write>:
    80003d0c:	ff010113          	addi	sp,sp,-16
    80003d10:	00813423          	sd	s0,8(sp)
    80003d14:	01010413          	addi	s0,sp,16
    80003d18:	00813403          	ld	s0,8(sp)
    80003d1c:	00005317          	auipc	t1,0x5
    80003d20:	83c33303          	ld	t1,-1988(t1) # 80008558 <devsw+0x18>
    80003d24:	01010113          	addi	sp,sp,16
    80003d28:	00030067          	jr	t1

0000000080003d2c <panic>:
    80003d2c:	fe010113          	addi	sp,sp,-32
    80003d30:	00113c23          	sd	ra,24(sp)
    80003d34:	00813823          	sd	s0,16(sp)
    80003d38:	00913423          	sd	s1,8(sp)
    80003d3c:	02010413          	addi	s0,sp,32
    80003d40:	00050493          	mv	s1,a0
    80003d44:	00002517          	auipc	a0,0x2
    80003d48:	6c450513          	addi	a0,a0,1732 # 80006408 <CONSOLE_STATUS+0x3f8>
    80003d4c:	00005797          	auipc	a5,0x5
    80003d50:	8a07a623          	sw	zero,-1876(a5) # 800085f8 <pr+0x18>
    80003d54:	00000097          	auipc	ra,0x0
    80003d58:	034080e7          	jalr	52(ra) # 80003d88 <__printf>
    80003d5c:	00048513          	mv	a0,s1
    80003d60:	00000097          	auipc	ra,0x0
    80003d64:	028080e7          	jalr	40(ra) # 80003d88 <__printf>
    80003d68:	00002517          	auipc	a0,0x2
    80003d6c:	68050513          	addi	a0,a0,1664 # 800063e8 <CONSOLE_STATUS+0x3d8>
    80003d70:	00000097          	auipc	ra,0x0
    80003d74:	018080e7          	jalr	24(ra) # 80003d88 <__printf>
    80003d78:	00100793          	li	a5,1
    80003d7c:	00003717          	auipc	a4,0x3
    80003d80:	5cf72623          	sw	a5,1484(a4) # 80007348 <panicked>
    80003d84:	0000006f          	j	80003d84 <panic+0x58>

0000000080003d88 <__printf>:
    80003d88:	f3010113          	addi	sp,sp,-208
    80003d8c:	08813023          	sd	s0,128(sp)
    80003d90:	07313423          	sd	s3,104(sp)
    80003d94:	09010413          	addi	s0,sp,144
    80003d98:	05813023          	sd	s8,64(sp)
    80003d9c:	08113423          	sd	ra,136(sp)
    80003da0:	06913c23          	sd	s1,120(sp)
    80003da4:	07213823          	sd	s2,112(sp)
    80003da8:	07413023          	sd	s4,96(sp)
    80003dac:	05513c23          	sd	s5,88(sp)
    80003db0:	05613823          	sd	s6,80(sp)
    80003db4:	05713423          	sd	s7,72(sp)
    80003db8:	03913c23          	sd	s9,56(sp)
    80003dbc:	03a13823          	sd	s10,48(sp)
    80003dc0:	03b13423          	sd	s11,40(sp)
    80003dc4:	00005317          	auipc	t1,0x5
    80003dc8:	81c30313          	addi	t1,t1,-2020 # 800085e0 <pr>
    80003dcc:	01832c03          	lw	s8,24(t1)
    80003dd0:	00b43423          	sd	a1,8(s0)
    80003dd4:	00c43823          	sd	a2,16(s0)
    80003dd8:	00d43c23          	sd	a3,24(s0)
    80003ddc:	02e43023          	sd	a4,32(s0)
    80003de0:	02f43423          	sd	a5,40(s0)
    80003de4:	03043823          	sd	a6,48(s0)
    80003de8:	03143c23          	sd	a7,56(s0)
    80003dec:	00050993          	mv	s3,a0
    80003df0:	4a0c1663          	bnez	s8,8000429c <__printf+0x514>
    80003df4:	60098c63          	beqz	s3,8000440c <__printf+0x684>
    80003df8:	0009c503          	lbu	a0,0(s3)
    80003dfc:	00840793          	addi	a5,s0,8
    80003e00:	f6f43c23          	sd	a5,-136(s0)
    80003e04:	00000493          	li	s1,0
    80003e08:	22050063          	beqz	a0,80004028 <__printf+0x2a0>
    80003e0c:	00002a37          	lui	s4,0x2
    80003e10:	00018ab7          	lui	s5,0x18
    80003e14:	000f4b37          	lui	s6,0xf4
    80003e18:	00989bb7          	lui	s7,0x989
    80003e1c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80003e20:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80003e24:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80003e28:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80003e2c:	00148c9b          	addiw	s9,s1,1
    80003e30:	02500793          	li	a5,37
    80003e34:	01998933          	add	s2,s3,s9
    80003e38:	38f51263          	bne	a0,a5,800041bc <__printf+0x434>
    80003e3c:	00094783          	lbu	a5,0(s2)
    80003e40:	00078c9b          	sext.w	s9,a5
    80003e44:	1e078263          	beqz	a5,80004028 <__printf+0x2a0>
    80003e48:	0024849b          	addiw	s1,s1,2
    80003e4c:	07000713          	li	a4,112
    80003e50:	00998933          	add	s2,s3,s1
    80003e54:	38e78a63          	beq	a5,a4,800041e8 <__printf+0x460>
    80003e58:	20f76863          	bltu	a4,a5,80004068 <__printf+0x2e0>
    80003e5c:	42a78863          	beq	a5,a0,8000428c <__printf+0x504>
    80003e60:	06400713          	li	a4,100
    80003e64:	40e79663          	bne	a5,a4,80004270 <__printf+0x4e8>
    80003e68:	f7843783          	ld	a5,-136(s0)
    80003e6c:	0007a603          	lw	a2,0(a5)
    80003e70:	00878793          	addi	a5,a5,8
    80003e74:	f6f43c23          	sd	a5,-136(s0)
    80003e78:	42064a63          	bltz	a2,800042ac <__printf+0x524>
    80003e7c:	00a00713          	li	a4,10
    80003e80:	02e677bb          	remuw	a5,a2,a4
    80003e84:	00002d97          	auipc	s11,0x2
    80003e88:	5acd8d93          	addi	s11,s11,1452 # 80006430 <digits>
    80003e8c:	00900593          	li	a1,9
    80003e90:	0006051b          	sext.w	a0,a2
    80003e94:	00000c93          	li	s9,0
    80003e98:	02079793          	slli	a5,a5,0x20
    80003e9c:	0207d793          	srli	a5,a5,0x20
    80003ea0:	00fd87b3          	add	a5,s11,a5
    80003ea4:	0007c783          	lbu	a5,0(a5)
    80003ea8:	02e656bb          	divuw	a3,a2,a4
    80003eac:	f8f40023          	sb	a5,-128(s0)
    80003eb0:	14c5d863          	bge	a1,a2,80004000 <__printf+0x278>
    80003eb4:	06300593          	li	a1,99
    80003eb8:	00100c93          	li	s9,1
    80003ebc:	02e6f7bb          	remuw	a5,a3,a4
    80003ec0:	02079793          	slli	a5,a5,0x20
    80003ec4:	0207d793          	srli	a5,a5,0x20
    80003ec8:	00fd87b3          	add	a5,s11,a5
    80003ecc:	0007c783          	lbu	a5,0(a5)
    80003ed0:	02e6d73b          	divuw	a4,a3,a4
    80003ed4:	f8f400a3          	sb	a5,-127(s0)
    80003ed8:	12a5f463          	bgeu	a1,a0,80004000 <__printf+0x278>
    80003edc:	00a00693          	li	a3,10
    80003ee0:	00900593          	li	a1,9
    80003ee4:	02d777bb          	remuw	a5,a4,a3
    80003ee8:	02079793          	slli	a5,a5,0x20
    80003eec:	0207d793          	srli	a5,a5,0x20
    80003ef0:	00fd87b3          	add	a5,s11,a5
    80003ef4:	0007c503          	lbu	a0,0(a5)
    80003ef8:	02d757bb          	divuw	a5,a4,a3
    80003efc:	f8a40123          	sb	a0,-126(s0)
    80003f00:	48e5f263          	bgeu	a1,a4,80004384 <__printf+0x5fc>
    80003f04:	06300513          	li	a0,99
    80003f08:	02d7f5bb          	remuw	a1,a5,a3
    80003f0c:	02059593          	slli	a1,a1,0x20
    80003f10:	0205d593          	srli	a1,a1,0x20
    80003f14:	00bd85b3          	add	a1,s11,a1
    80003f18:	0005c583          	lbu	a1,0(a1)
    80003f1c:	02d7d7bb          	divuw	a5,a5,a3
    80003f20:	f8b401a3          	sb	a1,-125(s0)
    80003f24:	48e57263          	bgeu	a0,a4,800043a8 <__printf+0x620>
    80003f28:	3e700513          	li	a0,999
    80003f2c:	02d7f5bb          	remuw	a1,a5,a3
    80003f30:	02059593          	slli	a1,a1,0x20
    80003f34:	0205d593          	srli	a1,a1,0x20
    80003f38:	00bd85b3          	add	a1,s11,a1
    80003f3c:	0005c583          	lbu	a1,0(a1)
    80003f40:	02d7d7bb          	divuw	a5,a5,a3
    80003f44:	f8b40223          	sb	a1,-124(s0)
    80003f48:	46e57663          	bgeu	a0,a4,800043b4 <__printf+0x62c>
    80003f4c:	02d7f5bb          	remuw	a1,a5,a3
    80003f50:	02059593          	slli	a1,a1,0x20
    80003f54:	0205d593          	srli	a1,a1,0x20
    80003f58:	00bd85b3          	add	a1,s11,a1
    80003f5c:	0005c583          	lbu	a1,0(a1)
    80003f60:	02d7d7bb          	divuw	a5,a5,a3
    80003f64:	f8b402a3          	sb	a1,-123(s0)
    80003f68:	46ea7863          	bgeu	s4,a4,800043d8 <__printf+0x650>
    80003f6c:	02d7f5bb          	remuw	a1,a5,a3
    80003f70:	02059593          	slli	a1,a1,0x20
    80003f74:	0205d593          	srli	a1,a1,0x20
    80003f78:	00bd85b3          	add	a1,s11,a1
    80003f7c:	0005c583          	lbu	a1,0(a1)
    80003f80:	02d7d7bb          	divuw	a5,a5,a3
    80003f84:	f8b40323          	sb	a1,-122(s0)
    80003f88:	3eeaf863          	bgeu	s5,a4,80004378 <__printf+0x5f0>
    80003f8c:	02d7f5bb          	remuw	a1,a5,a3
    80003f90:	02059593          	slli	a1,a1,0x20
    80003f94:	0205d593          	srli	a1,a1,0x20
    80003f98:	00bd85b3          	add	a1,s11,a1
    80003f9c:	0005c583          	lbu	a1,0(a1)
    80003fa0:	02d7d7bb          	divuw	a5,a5,a3
    80003fa4:	f8b403a3          	sb	a1,-121(s0)
    80003fa8:	42eb7e63          	bgeu	s6,a4,800043e4 <__printf+0x65c>
    80003fac:	02d7f5bb          	remuw	a1,a5,a3
    80003fb0:	02059593          	slli	a1,a1,0x20
    80003fb4:	0205d593          	srli	a1,a1,0x20
    80003fb8:	00bd85b3          	add	a1,s11,a1
    80003fbc:	0005c583          	lbu	a1,0(a1)
    80003fc0:	02d7d7bb          	divuw	a5,a5,a3
    80003fc4:	f8b40423          	sb	a1,-120(s0)
    80003fc8:	42ebfc63          	bgeu	s7,a4,80004400 <__printf+0x678>
    80003fcc:	02079793          	slli	a5,a5,0x20
    80003fd0:	0207d793          	srli	a5,a5,0x20
    80003fd4:	00fd8db3          	add	s11,s11,a5
    80003fd8:	000dc703          	lbu	a4,0(s11)
    80003fdc:	00a00793          	li	a5,10
    80003fe0:	00900c93          	li	s9,9
    80003fe4:	f8e404a3          	sb	a4,-119(s0)
    80003fe8:	00065c63          	bgez	a2,80004000 <__printf+0x278>
    80003fec:	f9040713          	addi	a4,s0,-112
    80003ff0:	00f70733          	add	a4,a4,a5
    80003ff4:	02d00693          	li	a3,45
    80003ff8:	fed70823          	sb	a3,-16(a4)
    80003ffc:	00078c93          	mv	s9,a5
    80004000:	f8040793          	addi	a5,s0,-128
    80004004:	01978cb3          	add	s9,a5,s9
    80004008:	f7f40d13          	addi	s10,s0,-129
    8000400c:	000cc503          	lbu	a0,0(s9)
    80004010:	fffc8c93          	addi	s9,s9,-1
    80004014:	00000097          	auipc	ra,0x0
    80004018:	b90080e7          	jalr	-1136(ra) # 80003ba4 <consputc>
    8000401c:	ffac98e3          	bne	s9,s10,8000400c <__printf+0x284>
    80004020:	00094503          	lbu	a0,0(s2)
    80004024:	e00514e3          	bnez	a0,80003e2c <__printf+0xa4>
    80004028:	1a0c1663          	bnez	s8,800041d4 <__printf+0x44c>
    8000402c:	08813083          	ld	ra,136(sp)
    80004030:	08013403          	ld	s0,128(sp)
    80004034:	07813483          	ld	s1,120(sp)
    80004038:	07013903          	ld	s2,112(sp)
    8000403c:	06813983          	ld	s3,104(sp)
    80004040:	06013a03          	ld	s4,96(sp)
    80004044:	05813a83          	ld	s5,88(sp)
    80004048:	05013b03          	ld	s6,80(sp)
    8000404c:	04813b83          	ld	s7,72(sp)
    80004050:	04013c03          	ld	s8,64(sp)
    80004054:	03813c83          	ld	s9,56(sp)
    80004058:	03013d03          	ld	s10,48(sp)
    8000405c:	02813d83          	ld	s11,40(sp)
    80004060:	0d010113          	addi	sp,sp,208
    80004064:	00008067          	ret
    80004068:	07300713          	li	a4,115
    8000406c:	1ce78a63          	beq	a5,a4,80004240 <__printf+0x4b8>
    80004070:	07800713          	li	a4,120
    80004074:	1ee79e63          	bne	a5,a4,80004270 <__printf+0x4e8>
    80004078:	f7843783          	ld	a5,-136(s0)
    8000407c:	0007a703          	lw	a4,0(a5)
    80004080:	00878793          	addi	a5,a5,8
    80004084:	f6f43c23          	sd	a5,-136(s0)
    80004088:	28074263          	bltz	a4,8000430c <__printf+0x584>
    8000408c:	00002d97          	auipc	s11,0x2
    80004090:	3a4d8d93          	addi	s11,s11,932 # 80006430 <digits>
    80004094:	00f77793          	andi	a5,a4,15
    80004098:	00fd87b3          	add	a5,s11,a5
    8000409c:	0007c683          	lbu	a3,0(a5)
    800040a0:	00f00613          	li	a2,15
    800040a4:	0007079b          	sext.w	a5,a4
    800040a8:	f8d40023          	sb	a3,-128(s0)
    800040ac:	0047559b          	srliw	a1,a4,0x4
    800040b0:	0047569b          	srliw	a3,a4,0x4
    800040b4:	00000c93          	li	s9,0
    800040b8:	0ee65063          	bge	a2,a4,80004198 <__printf+0x410>
    800040bc:	00f6f693          	andi	a3,a3,15
    800040c0:	00dd86b3          	add	a3,s11,a3
    800040c4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800040c8:	0087d79b          	srliw	a5,a5,0x8
    800040cc:	00100c93          	li	s9,1
    800040d0:	f8d400a3          	sb	a3,-127(s0)
    800040d4:	0cb67263          	bgeu	a2,a1,80004198 <__printf+0x410>
    800040d8:	00f7f693          	andi	a3,a5,15
    800040dc:	00dd86b3          	add	a3,s11,a3
    800040e0:	0006c583          	lbu	a1,0(a3)
    800040e4:	00f00613          	li	a2,15
    800040e8:	0047d69b          	srliw	a3,a5,0x4
    800040ec:	f8b40123          	sb	a1,-126(s0)
    800040f0:	0047d593          	srli	a1,a5,0x4
    800040f4:	28f67e63          	bgeu	a2,a5,80004390 <__printf+0x608>
    800040f8:	00f6f693          	andi	a3,a3,15
    800040fc:	00dd86b3          	add	a3,s11,a3
    80004100:	0006c503          	lbu	a0,0(a3)
    80004104:	0087d813          	srli	a6,a5,0x8
    80004108:	0087d69b          	srliw	a3,a5,0x8
    8000410c:	f8a401a3          	sb	a0,-125(s0)
    80004110:	28b67663          	bgeu	a2,a1,8000439c <__printf+0x614>
    80004114:	00f6f693          	andi	a3,a3,15
    80004118:	00dd86b3          	add	a3,s11,a3
    8000411c:	0006c583          	lbu	a1,0(a3)
    80004120:	00c7d513          	srli	a0,a5,0xc
    80004124:	00c7d69b          	srliw	a3,a5,0xc
    80004128:	f8b40223          	sb	a1,-124(s0)
    8000412c:	29067a63          	bgeu	a2,a6,800043c0 <__printf+0x638>
    80004130:	00f6f693          	andi	a3,a3,15
    80004134:	00dd86b3          	add	a3,s11,a3
    80004138:	0006c583          	lbu	a1,0(a3)
    8000413c:	0107d813          	srli	a6,a5,0x10
    80004140:	0107d69b          	srliw	a3,a5,0x10
    80004144:	f8b402a3          	sb	a1,-123(s0)
    80004148:	28a67263          	bgeu	a2,a0,800043cc <__printf+0x644>
    8000414c:	00f6f693          	andi	a3,a3,15
    80004150:	00dd86b3          	add	a3,s11,a3
    80004154:	0006c683          	lbu	a3,0(a3)
    80004158:	0147d79b          	srliw	a5,a5,0x14
    8000415c:	f8d40323          	sb	a3,-122(s0)
    80004160:	21067663          	bgeu	a2,a6,8000436c <__printf+0x5e4>
    80004164:	02079793          	slli	a5,a5,0x20
    80004168:	0207d793          	srli	a5,a5,0x20
    8000416c:	00fd8db3          	add	s11,s11,a5
    80004170:	000dc683          	lbu	a3,0(s11)
    80004174:	00800793          	li	a5,8
    80004178:	00700c93          	li	s9,7
    8000417c:	f8d403a3          	sb	a3,-121(s0)
    80004180:	00075c63          	bgez	a4,80004198 <__printf+0x410>
    80004184:	f9040713          	addi	a4,s0,-112
    80004188:	00f70733          	add	a4,a4,a5
    8000418c:	02d00693          	li	a3,45
    80004190:	fed70823          	sb	a3,-16(a4)
    80004194:	00078c93          	mv	s9,a5
    80004198:	f8040793          	addi	a5,s0,-128
    8000419c:	01978cb3          	add	s9,a5,s9
    800041a0:	f7f40d13          	addi	s10,s0,-129
    800041a4:	000cc503          	lbu	a0,0(s9)
    800041a8:	fffc8c93          	addi	s9,s9,-1
    800041ac:	00000097          	auipc	ra,0x0
    800041b0:	9f8080e7          	jalr	-1544(ra) # 80003ba4 <consputc>
    800041b4:	ff9d18e3          	bne	s10,s9,800041a4 <__printf+0x41c>
    800041b8:	0100006f          	j	800041c8 <__printf+0x440>
    800041bc:	00000097          	auipc	ra,0x0
    800041c0:	9e8080e7          	jalr	-1560(ra) # 80003ba4 <consputc>
    800041c4:	000c8493          	mv	s1,s9
    800041c8:	00094503          	lbu	a0,0(s2)
    800041cc:	c60510e3          	bnez	a0,80003e2c <__printf+0xa4>
    800041d0:	e40c0ee3          	beqz	s8,8000402c <__printf+0x2a4>
    800041d4:	00004517          	auipc	a0,0x4
    800041d8:	40c50513          	addi	a0,a0,1036 # 800085e0 <pr>
    800041dc:	00001097          	auipc	ra,0x1
    800041e0:	94c080e7          	jalr	-1716(ra) # 80004b28 <release>
    800041e4:	e49ff06f          	j	8000402c <__printf+0x2a4>
    800041e8:	f7843783          	ld	a5,-136(s0)
    800041ec:	03000513          	li	a0,48
    800041f0:	01000d13          	li	s10,16
    800041f4:	00878713          	addi	a4,a5,8
    800041f8:	0007bc83          	ld	s9,0(a5)
    800041fc:	f6e43c23          	sd	a4,-136(s0)
    80004200:	00000097          	auipc	ra,0x0
    80004204:	9a4080e7          	jalr	-1628(ra) # 80003ba4 <consputc>
    80004208:	07800513          	li	a0,120
    8000420c:	00000097          	auipc	ra,0x0
    80004210:	998080e7          	jalr	-1640(ra) # 80003ba4 <consputc>
    80004214:	00002d97          	auipc	s11,0x2
    80004218:	21cd8d93          	addi	s11,s11,540 # 80006430 <digits>
    8000421c:	03ccd793          	srli	a5,s9,0x3c
    80004220:	00fd87b3          	add	a5,s11,a5
    80004224:	0007c503          	lbu	a0,0(a5)
    80004228:	fffd0d1b          	addiw	s10,s10,-1
    8000422c:	004c9c93          	slli	s9,s9,0x4
    80004230:	00000097          	auipc	ra,0x0
    80004234:	974080e7          	jalr	-1676(ra) # 80003ba4 <consputc>
    80004238:	fe0d12e3          	bnez	s10,8000421c <__printf+0x494>
    8000423c:	f8dff06f          	j	800041c8 <__printf+0x440>
    80004240:	f7843783          	ld	a5,-136(s0)
    80004244:	0007bc83          	ld	s9,0(a5)
    80004248:	00878793          	addi	a5,a5,8
    8000424c:	f6f43c23          	sd	a5,-136(s0)
    80004250:	000c9a63          	bnez	s9,80004264 <__printf+0x4dc>
    80004254:	1080006f          	j	8000435c <__printf+0x5d4>
    80004258:	001c8c93          	addi	s9,s9,1
    8000425c:	00000097          	auipc	ra,0x0
    80004260:	948080e7          	jalr	-1720(ra) # 80003ba4 <consputc>
    80004264:	000cc503          	lbu	a0,0(s9)
    80004268:	fe0518e3          	bnez	a0,80004258 <__printf+0x4d0>
    8000426c:	f5dff06f          	j	800041c8 <__printf+0x440>
    80004270:	02500513          	li	a0,37
    80004274:	00000097          	auipc	ra,0x0
    80004278:	930080e7          	jalr	-1744(ra) # 80003ba4 <consputc>
    8000427c:	000c8513          	mv	a0,s9
    80004280:	00000097          	auipc	ra,0x0
    80004284:	924080e7          	jalr	-1756(ra) # 80003ba4 <consputc>
    80004288:	f41ff06f          	j	800041c8 <__printf+0x440>
    8000428c:	02500513          	li	a0,37
    80004290:	00000097          	auipc	ra,0x0
    80004294:	914080e7          	jalr	-1772(ra) # 80003ba4 <consputc>
    80004298:	f31ff06f          	j	800041c8 <__printf+0x440>
    8000429c:	00030513          	mv	a0,t1
    800042a0:	00000097          	auipc	ra,0x0
    800042a4:	7bc080e7          	jalr	1980(ra) # 80004a5c <acquire>
    800042a8:	b4dff06f          	j	80003df4 <__printf+0x6c>
    800042ac:	40c0053b          	negw	a0,a2
    800042b0:	00a00713          	li	a4,10
    800042b4:	02e576bb          	remuw	a3,a0,a4
    800042b8:	00002d97          	auipc	s11,0x2
    800042bc:	178d8d93          	addi	s11,s11,376 # 80006430 <digits>
    800042c0:	ff700593          	li	a1,-9
    800042c4:	02069693          	slli	a3,a3,0x20
    800042c8:	0206d693          	srli	a3,a3,0x20
    800042cc:	00dd86b3          	add	a3,s11,a3
    800042d0:	0006c683          	lbu	a3,0(a3)
    800042d4:	02e557bb          	divuw	a5,a0,a4
    800042d8:	f8d40023          	sb	a3,-128(s0)
    800042dc:	10b65e63          	bge	a2,a1,800043f8 <__printf+0x670>
    800042e0:	06300593          	li	a1,99
    800042e4:	02e7f6bb          	remuw	a3,a5,a4
    800042e8:	02069693          	slli	a3,a3,0x20
    800042ec:	0206d693          	srli	a3,a3,0x20
    800042f0:	00dd86b3          	add	a3,s11,a3
    800042f4:	0006c683          	lbu	a3,0(a3)
    800042f8:	02e7d73b          	divuw	a4,a5,a4
    800042fc:	00200793          	li	a5,2
    80004300:	f8d400a3          	sb	a3,-127(s0)
    80004304:	bca5ece3          	bltu	a1,a0,80003edc <__printf+0x154>
    80004308:	ce5ff06f          	j	80003fec <__printf+0x264>
    8000430c:	40e007bb          	negw	a5,a4
    80004310:	00002d97          	auipc	s11,0x2
    80004314:	120d8d93          	addi	s11,s11,288 # 80006430 <digits>
    80004318:	00f7f693          	andi	a3,a5,15
    8000431c:	00dd86b3          	add	a3,s11,a3
    80004320:	0006c583          	lbu	a1,0(a3)
    80004324:	ff100613          	li	a2,-15
    80004328:	0047d69b          	srliw	a3,a5,0x4
    8000432c:	f8b40023          	sb	a1,-128(s0)
    80004330:	0047d59b          	srliw	a1,a5,0x4
    80004334:	0ac75e63          	bge	a4,a2,800043f0 <__printf+0x668>
    80004338:	00f6f693          	andi	a3,a3,15
    8000433c:	00dd86b3          	add	a3,s11,a3
    80004340:	0006c603          	lbu	a2,0(a3)
    80004344:	00f00693          	li	a3,15
    80004348:	0087d79b          	srliw	a5,a5,0x8
    8000434c:	f8c400a3          	sb	a2,-127(s0)
    80004350:	d8b6e4e3          	bltu	a3,a1,800040d8 <__printf+0x350>
    80004354:	00200793          	li	a5,2
    80004358:	e2dff06f          	j	80004184 <__printf+0x3fc>
    8000435c:	00002c97          	auipc	s9,0x2
    80004360:	0b4c8c93          	addi	s9,s9,180 # 80006410 <CONSOLE_STATUS+0x400>
    80004364:	02800513          	li	a0,40
    80004368:	ef1ff06f          	j	80004258 <__printf+0x4d0>
    8000436c:	00700793          	li	a5,7
    80004370:	00600c93          	li	s9,6
    80004374:	e0dff06f          	j	80004180 <__printf+0x3f8>
    80004378:	00700793          	li	a5,7
    8000437c:	00600c93          	li	s9,6
    80004380:	c69ff06f          	j	80003fe8 <__printf+0x260>
    80004384:	00300793          	li	a5,3
    80004388:	00200c93          	li	s9,2
    8000438c:	c5dff06f          	j	80003fe8 <__printf+0x260>
    80004390:	00300793          	li	a5,3
    80004394:	00200c93          	li	s9,2
    80004398:	de9ff06f          	j	80004180 <__printf+0x3f8>
    8000439c:	00400793          	li	a5,4
    800043a0:	00300c93          	li	s9,3
    800043a4:	dddff06f          	j	80004180 <__printf+0x3f8>
    800043a8:	00400793          	li	a5,4
    800043ac:	00300c93          	li	s9,3
    800043b0:	c39ff06f          	j	80003fe8 <__printf+0x260>
    800043b4:	00500793          	li	a5,5
    800043b8:	00400c93          	li	s9,4
    800043bc:	c2dff06f          	j	80003fe8 <__printf+0x260>
    800043c0:	00500793          	li	a5,5
    800043c4:	00400c93          	li	s9,4
    800043c8:	db9ff06f          	j	80004180 <__printf+0x3f8>
    800043cc:	00600793          	li	a5,6
    800043d0:	00500c93          	li	s9,5
    800043d4:	dadff06f          	j	80004180 <__printf+0x3f8>
    800043d8:	00600793          	li	a5,6
    800043dc:	00500c93          	li	s9,5
    800043e0:	c09ff06f          	j	80003fe8 <__printf+0x260>
    800043e4:	00800793          	li	a5,8
    800043e8:	00700c93          	li	s9,7
    800043ec:	bfdff06f          	j	80003fe8 <__printf+0x260>
    800043f0:	00100793          	li	a5,1
    800043f4:	d91ff06f          	j	80004184 <__printf+0x3fc>
    800043f8:	00100793          	li	a5,1
    800043fc:	bf1ff06f          	j	80003fec <__printf+0x264>
    80004400:	00900793          	li	a5,9
    80004404:	00800c93          	li	s9,8
    80004408:	be1ff06f          	j	80003fe8 <__printf+0x260>
    8000440c:	00002517          	auipc	a0,0x2
    80004410:	00c50513          	addi	a0,a0,12 # 80006418 <CONSOLE_STATUS+0x408>
    80004414:	00000097          	auipc	ra,0x0
    80004418:	918080e7          	jalr	-1768(ra) # 80003d2c <panic>

000000008000441c <printfinit>:
    8000441c:	fe010113          	addi	sp,sp,-32
    80004420:	00813823          	sd	s0,16(sp)
    80004424:	00913423          	sd	s1,8(sp)
    80004428:	00113c23          	sd	ra,24(sp)
    8000442c:	02010413          	addi	s0,sp,32
    80004430:	00004497          	auipc	s1,0x4
    80004434:	1b048493          	addi	s1,s1,432 # 800085e0 <pr>
    80004438:	00048513          	mv	a0,s1
    8000443c:	00002597          	auipc	a1,0x2
    80004440:	fec58593          	addi	a1,a1,-20 # 80006428 <CONSOLE_STATUS+0x418>
    80004444:	00000097          	auipc	ra,0x0
    80004448:	5f4080e7          	jalr	1524(ra) # 80004a38 <initlock>
    8000444c:	01813083          	ld	ra,24(sp)
    80004450:	01013403          	ld	s0,16(sp)
    80004454:	0004ac23          	sw	zero,24(s1)
    80004458:	00813483          	ld	s1,8(sp)
    8000445c:	02010113          	addi	sp,sp,32
    80004460:	00008067          	ret

0000000080004464 <uartinit>:
    80004464:	ff010113          	addi	sp,sp,-16
    80004468:	00813423          	sd	s0,8(sp)
    8000446c:	01010413          	addi	s0,sp,16
    80004470:	100007b7          	lui	a5,0x10000
    80004474:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80004478:	f8000713          	li	a4,-128
    8000447c:	00e781a3          	sb	a4,3(a5)
    80004480:	00300713          	li	a4,3
    80004484:	00e78023          	sb	a4,0(a5)
    80004488:	000780a3          	sb	zero,1(a5)
    8000448c:	00e781a3          	sb	a4,3(a5)
    80004490:	00700693          	li	a3,7
    80004494:	00d78123          	sb	a3,2(a5)
    80004498:	00e780a3          	sb	a4,1(a5)
    8000449c:	00813403          	ld	s0,8(sp)
    800044a0:	01010113          	addi	sp,sp,16
    800044a4:	00008067          	ret

00000000800044a8 <uartputc>:
    800044a8:	00003797          	auipc	a5,0x3
    800044ac:	ea07a783          	lw	a5,-352(a5) # 80007348 <panicked>
    800044b0:	00078463          	beqz	a5,800044b8 <uartputc+0x10>
    800044b4:	0000006f          	j	800044b4 <uartputc+0xc>
    800044b8:	fd010113          	addi	sp,sp,-48
    800044bc:	02813023          	sd	s0,32(sp)
    800044c0:	00913c23          	sd	s1,24(sp)
    800044c4:	01213823          	sd	s2,16(sp)
    800044c8:	01313423          	sd	s3,8(sp)
    800044cc:	02113423          	sd	ra,40(sp)
    800044d0:	03010413          	addi	s0,sp,48
    800044d4:	00003917          	auipc	s2,0x3
    800044d8:	e7c90913          	addi	s2,s2,-388 # 80007350 <uart_tx_r>
    800044dc:	00093783          	ld	a5,0(s2)
    800044e0:	00003497          	auipc	s1,0x3
    800044e4:	e7848493          	addi	s1,s1,-392 # 80007358 <uart_tx_w>
    800044e8:	0004b703          	ld	a4,0(s1)
    800044ec:	02078693          	addi	a3,a5,32
    800044f0:	00050993          	mv	s3,a0
    800044f4:	02e69c63          	bne	a3,a4,8000452c <uartputc+0x84>
    800044f8:	00001097          	auipc	ra,0x1
    800044fc:	834080e7          	jalr	-1996(ra) # 80004d2c <push_on>
    80004500:	00093783          	ld	a5,0(s2)
    80004504:	0004b703          	ld	a4,0(s1)
    80004508:	02078793          	addi	a5,a5,32
    8000450c:	00e79463          	bne	a5,a4,80004514 <uartputc+0x6c>
    80004510:	0000006f          	j	80004510 <uartputc+0x68>
    80004514:	00001097          	auipc	ra,0x1
    80004518:	88c080e7          	jalr	-1908(ra) # 80004da0 <pop_on>
    8000451c:	00093783          	ld	a5,0(s2)
    80004520:	0004b703          	ld	a4,0(s1)
    80004524:	02078693          	addi	a3,a5,32
    80004528:	fce688e3          	beq	a3,a4,800044f8 <uartputc+0x50>
    8000452c:	01f77693          	andi	a3,a4,31
    80004530:	00004597          	auipc	a1,0x4
    80004534:	0d058593          	addi	a1,a1,208 # 80008600 <uart_tx_buf>
    80004538:	00d586b3          	add	a3,a1,a3
    8000453c:	00170713          	addi	a4,a4,1
    80004540:	01368023          	sb	s3,0(a3)
    80004544:	00e4b023          	sd	a4,0(s1)
    80004548:	10000637          	lui	a2,0x10000
    8000454c:	02f71063          	bne	a4,a5,8000456c <uartputc+0xc4>
    80004550:	0340006f          	j	80004584 <uartputc+0xdc>
    80004554:	00074703          	lbu	a4,0(a4)
    80004558:	00f93023          	sd	a5,0(s2)
    8000455c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80004560:	00093783          	ld	a5,0(s2)
    80004564:	0004b703          	ld	a4,0(s1)
    80004568:	00f70e63          	beq	a4,a5,80004584 <uartputc+0xdc>
    8000456c:	00564683          	lbu	a3,5(a2)
    80004570:	01f7f713          	andi	a4,a5,31
    80004574:	00e58733          	add	a4,a1,a4
    80004578:	0206f693          	andi	a3,a3,32
    8000457c:	00178793          	addi	a5,a5,1
    80004580:	fc069ae3          	bnez	a3,80004554 <uartputc+0xac>
    80004584:	02813083          	ld	ra,40(sp)
    80004588:	02013403          	ld	s0,32(sp)
    8000458c:	01813483          	ld	s1,24(sp)
    80004590:	01013903          	ld	s2,16(sp)
    80004594:	00813983          	ld	s3,8(sp)
    80004598:	03010113          	addi	sp,sp,48
    8000459c:	00008067          	ret

00000000800045a0 <uartputc_sync>:
    800045a0:	ff010113          	addi	sp,sp,-16
    800045a4:	00813423          	sd	s0,8(sp)
    800045a8:	01010413          	addi	s0,sp,16
    800045ac:	00003717          	auipc	a4,0x3
    800045b0:	d9c72703          	lw	a4,-612(a4) # 80007348 <panicked>
    800045b4:	02071663          	bnez	a4,800045e0 <uartputc_sync+0x40>
    800045b8:	00050793          	mv	a5,a0
    800045bc:	100006b7          	lui	a3,0x10000
    800045c0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800045c4:	02077713          	andi	a4,a4,32
    800045c8:	fe070ce3          	beqz	a4,800045c0 <uartputc_sync+0x20>
    800045cc:	0ff7f793          	andi	a5,a5,255
    800045d0:	00f68023          	sb	a5,0(a3)
    800045d4:	00813403          	ld	s0,8(sp)
    800045d8:	01010113          	addi	sp,sp,16
    800045dc:	00008067          	ret
    800045e0:	0000006f          	j	800045e0 <uartputc_sync+0x40>

00000000800045e4 <uartstart>:
    800045e4:	ff010113          	addi	sp,sp,-16
    800045e8:	00813423          	sd	s0,8(sp)
    800045ec:	01010413          	addi	s0,sp,16
    800045f0:	00003617          	auipc	a2,0x3
    800045f4:	d6060613          	addi	a2,a2,-672 # 80007350 <uart_tx_r>
    800045f8:	00003517          	auipc	a0,0x3
    800045fc:	d6050513          	addi	a0,a0,-672 # 80007358 <uart_tx_w>
    80004600:	00063783          	ld	a5,0(a2)
    80004604:	00053703          	ld	a4,0(a0)
    80004608:	04f70263          	beq	a4,a5,8000464c <uartstart+0x68>
    8000460c:	100005b7          	lui	a1,0x10000
    80004610:	00004817          	auipc	a6,0x4
    80004614:	ff080813          	addi	a6,a6,-16 # 80008600 <uart_tx_buf>
    80004618:	01c0006f          	j	80004634 <uartstart+0x50>
    8000461c:	0006c703          	lbu	a4,0(a3)
    80004620:	00f63023          	sd	a5,0(a2)
    80004624:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80004628:	00063783          	ld	a5,0(a2)
    8000462c:	00053703          	ld	a4,0(a0)
    80004630:	00f70e63          	beq	a4,a5,8000464c <uartstart+0x68>
    80004634:	01f7f713          	andi	a4,a5,31
    80004638:	00e806b3          	add	a3,a6,a4
    8000463c:	0055c703          	lbu	a4,5(a1)
    80004640:	00178793          	addi	a5,a5,1
    80004644:	02077713          	andi	a4,a4,32
    80004648:	fc071ae3          	bnez	a4,8000461c <uartstart+0x38>
    8000464c:	00813403          	ld	s0,8(sp)
    80004650:	01010113          	addi	sp,sp,16
    80004654:	00008067          	ret

0000000080004658 <uartgetc>:
    80004658:	ff010113          	addi	sp,sp,-16
    8000465c:	00813423          	sd	s0,8(sp)
    80004660:	01010413          	addi	s0,sp,16
    80004664:	10000737          	lui	a4,0x10000
    80004668:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000466c:	0017f793          	andi	a5,a5,1
    80004670:	00078c63          	beqz	a5,80004688 <uartgetc+0x30>
    80004674:	00074503          	lbu	a0,0(a4)
    80004678:	0ff57513          	andi	a0,a0,255
    8000467c:	00813403          	ld	s0,8(sp)
    80004680:	01010113          	addi	sp,sp,16
    80004684:	00008067          	ret
    80004688:	fff00513          	li	a0,-1
    8000468c:	ff1ff06f          	j	8000467c <uartgetc+0x24>

0000000080004690 <uartintr>:
    80004690:	100007b7          	lui	a5,0x10000
    80004694:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80004698:	0017f793          	andi	a5,a5,1
    8000469c:	0a078463          	beqz	a5,80004744 <uartintr+0xb4>
    800046a0:	fe010113          	addi	sp,sp,-32
    800046a4:	00813823          	sd	s0,16(sp)
    800046a8:	00913423          	sd	s1,8(sp)
    800046ac:	00113c23          	sd	ra,24(sp)
    800046b0:	02010413          	addi	s0,sp,32
    800046b4:	100004b7          	lui	s1,0x10000
    800046b8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800046bc:	0ff57513          	andi	a0,a0,255
    800046c0:	fffff097          	auipc	ra,0xfffff
    800046c4:	534080e7          	jalr	1332(ra) # 80003bf4 <consoleintr>
    800046c8:	0054c783          	lbu	a5,5(s1)
    800046cc:	0017f793          	andi	a5,a5,1
    800046d0:	fe0794e3          	bnez	a5,800046b8 <uartintr+0x28>
    800046d4:	00003617          	auipc	a2,0x3
    800046d8:	c7c60613          	addi	a2,a2,-900 # 80007350 <uart_tx_r>
    800046dc:	00003517          	auipc	a0,0x3
    800046e0:	c7c50513          	addi	a0,a0,-900 # 80007358 <uart_tx_w>
    800046e4:	00063783          	ld	a5,0(a2)
    800046e8:	00053703          	ld	a4,0(a0)
    800046ec:	04f70263          	beq	a4,a5,80004730 <uartintr+0xa0>
    800046f0:	100005b7          	lui	a1,0x10000
    800046f4:	00004817          	auipc	a6,0x4
    800046f8:	f0c80813          	addi	a6,a6,-244 # 80008600 <uart_tx_buf>
    800046fc:	01c0006f          	j	80004718 <uartintr+0x88>
    80004700:	0006c703          	lbu	a4,0(a3)
    80004704:	00f63023          	sd	a5,0(a2)
    80004708:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000470c:	00063783          	ld	a5,0(a2)
    80004710:	00053703          	ld	a4,0(a0)
    80004714:	00f70e63          	beq	a4,a5,80004730 <uartintr+0xa0>
    80004718:	01f7f713          	andi	a4,a5,31
    8000471c:	00e806b3          	add	a3,a6,a4
    80004720:	0055c703          	lbu	a4,5(a1)
    80004724:	00178793          	addi	a5,a5,1
    80004728:	02077713          	andi	a4,a4,32
    8000472c:	fc071ae3          	bnez	a4,80004700 <uartintr+0x70>
    80004730:	01813083          	ld	ra,24(sp)
    80004734:	01013403          	ld	s0,16(sp)
    80004738:	00813483          	ld	s1,8(sp)
    8000473c:	02010113          	addi	sp,sp,32
    80004740:	00008067          	ret
    80004744:	00003617          	auipc	a2,0x3
    80004748:	c0c60613          	addi	a2,a2,-1012 # 80007350 <uart_tx_r>
    8000474c:	00003517          	auipc	a0,0x3
    80004750:	c0c50513          	addi	a0,a0,-1012 # 80007358 <uart_tx_w>
    80004754:	00063783          	ld	a5,0(a2)
    80004758:	00053703          	ld	a4,0(a0)
    8000475c:	04f70263          	beq	a4,a5,800047a0 <uartintr+0x110>
    80004760:	100005b7          	lui	a1,0x10000
    80004764:	00004817          	auipc	a6,0x4
    80004768:	e9c80813          	addi	a6,a6,-356 # 80008600 <uart_tx_buf>
    8000476c:	01c0006f          	j	80004788 <uartintr+0xf8>
    80004770:	0006c703          	lbu	a4,0(a3)
    80004774:	00f63023          	sd	a5,0(a2)
    80004778:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000477c:	00063783          	ld	a5,0(a2)
    80004780:	00053703          	ld	a4,0(a0)
    80004784:	02f70063          	beq	a4,a5,800047a4 <uartintr+0x114>
    80004788:	01f7f713          	andi	a4,a5,31
    8000478c:	00e806b3          	add	a3,a6,a4
    80004790:	0055c703          	lbu	a4,5(a1)
    80004794:	00178793          	addi	a5,a5,1
    80004798:	02077713          	andi	a4,a4,32
    8000479c:	fc071ae3          	bnez	a4,80004770 <uartintr+0xe0>
    800047a0:	00008067          	ret
    800047a4:	00008067          	ret

00000000800047a8 <kinit>:
    800047a8:	fc010113          	addi	sp,sp,-64
    800047ac:	02913423          	sd	s1,40(sp)
    800047b0:	fffff7b7          	lui	a5,0xfffff
    800047b4:	00005497          	auipc	s1,0x5
    800047b8:	e6b48493          	addi	s1,s1,-405 # 8000961f <end+0xfff>
    800047bc:	02813823          	sd	s0,48(sp)
    800047c0:	01313c23          	sd	s3,24(sp)
    800047c4:	00f4f4b3          	and	s1,s1,a5
    800047c8:	02113c23          	sd	ra,56(sp)
    800047cc:	03213023          	sd	s2,32(sp)
    800047d0:	01413823          	sd	s4,16(sp)
    800047d4:	01513423          	sd	s5,8(sp)
    800047d8:	04010413          	addi	s0,sp,64
    800047dc:	000017b7          	lui	a5,0x1
    800047e0:	01100993          	li	s3,17
    800047e4:	00f487b3          	add	a5,s1,a5
    800047e8:	01b99993          	slli	s3,s3,0x1b
    800047ec:	06f9e063          	bltu	s3,a5,8000484c <kinit+0xa4>
    800047f0:	00004a97          	auipc	s5,0x4
    800047f4:	e30a8a93          	addi	s5,s5,-464 # 80008620 <end>
    800047f8:	0754ec63          	bltu	s1,s5,80004870 <kinit+0xc8>
    800047fc:	0734fa63          	bgeu	s1,s3,80004870 <kinit+0xc8>
    80004800:	00088a37          	lui	s4,0x88
    80004804:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80004808:	00003917          	auipc	s2,0x3
    8000480c:	b5890913          	addi	s2,s2,-1192 # 80007360 <kmem>
    80004810:	00ca1a13          	slli	s4,s4,0xc
    80004814:	0140006f          	j	80004828 <kinit+0x80>
    80004818:	000017b7          	lui	a5,0x1
    8000481c:	00f484b3          	add	s1,s1,a5
    80004820:	0554e863          	bltu	s1,s5,80004870 <kinit+0xc8>
    80004824:	0534f663          	bgeu	s1,s3,80004870 <kinit+0xc8>
    80004828:	00001637          	lui	a2,0x1
    8000482c:	00100593          	li	a1,1
    80004830:	00048513          	mv	a0,s1
    80004834:	00000097          	auipc	ra,0x0
    80004838:	5e4080e7          	jalr	1508(ra) # 80004e18 <__memset>
    8000483c:	00093783          	ld	a5,0(s2)
    80004840:	00f4b023          	sd	a5,0(s1)
    80004844:	00993023          	sd	s1,0(s2)
    80004848:	fd4498e3          	bne	s1,s4,80004818 <kinit+0x70>
    8000484c:	03813083          	ld	ra,56(sp)
    80004850:	03013403          	ld	s0,48(sp)
    80004854:	02813483          	ld	s1,40(sp)
    80004858:	02013903          	ld	s2,32(sp)
    8000485c:	01813983          	ld	s3,24(sp)
    80004860:	01013a03          	ld	s4,16(sp)
    80004864:	00813a83          	ld	s5,8(sp)
    80004868:	04010113          	addi	sp,sp,64
    8000486c:	00008067          	ret
    80004870:	00002517          	auipc	a0,0x2
    80004874:	bd850513          	addi	a0,a0,-1064 # 80006448 <digits+0x18>
    80004878:	fffff097          	auipc	ra,0xfffff
    8000487c:	4b4080e7          	jalr	1204(ra) # 80003d2c <panic>

0000000080004880 <freerange>:
    80004880:	fc010113          	addi	sp,sp,-64
    80004884:	000017b7          	lui	a5,0x1
    80004888:	02913423          	sd	s1,40(sp)
    8000488c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80004890:	009504b3          	add	s1,a0,s1
    80004894:	fffff537          	lui	a0,0xfffff
    80004898:	02813823          	sd	s0,48(sp)
    8000489c:	02113c23          	sd	ra,56(sp)
    800048a0:	03213023          	sd	s2,32(sp)
    800048a4:	01313c23          	sd	s3,24(sp)
    800048a8:	01413823          	sd	s4,16(sp)
    800048ac:	01513423          	sd	s5,8(sp)
    800048b0:	01613023          	sd	s6,0(sp)
    800048b4:	04010413          	addi	s0,sp,64
    800048b8:	00a4f4b3          	and	s1,s1,a0
    800048bc:	00f487b3          	add	a5,s1,a5
    800048c0:	06f5e463          	bltu	a1,a5,80004928 <freerange+0xa8>
    800048c4:	00004a97          	auipc	s5,0x4
    800048c8:	d5ca8a93          	addi	s5,s5,-676 # 80008620 <end>
    800048cc:	0954e263          	bltu	s1,s5,80004950 <freerange+0xd0>
    800048d0:	01100993          	li	s3,17
    800048d4:	01b99993          	slli	s3,s3,0x1b
    800048d8:	0734fc63          	bgeu	s1,s3,80004950 <freerange+0xd0>
    800048dc:	00058a13          	mv	s4,a1
    800048e0:	00003917          	auipc	s2,0x3
    800048e4:	a8090913          	addi	s2,s2,-1408 # 80007360 <kmem>
    800048e8:	00002b37          	lui	s6,0x2
    800048ec:	0140006f          	j	80004900 <freerange+0x80>
    800048f0:	000017b7          	lui	a5,0x1
    800048f4:	00f484b3          	add	s1,s1,a5
    800048f8:	0554ec63          	bltu	s1,s5,80004950 <freerange+0xd0>
    800048fc:	0534fa63          	bgeu	s1,s3,80004950 <freerange+0xd0>
    80004900:	00001637          	lui	a2,0x1
    80004904:	00100593          	li	a1,1
    80004908:	00048513          	mv	a0,s1
    8000490c:	00000097          	auipc	ra,0x0
    80004910:	50c080e7          	jalr	1292(ra) # 80004e18 <__memset>
    80004914:	00093703          	ld	a4,0(s2)
    80004918:	016487b3          	add	a5,s1,s6
    8000491c:	00e4b023          	sd	a4,0(s1)
    80004920:	00993023          	sd	s1,0(s2)
    80004924:	fcfa76e3          	bgeu	s4,a5,800048f0 <freerange+0x70>
    80004928:	03813083          	ld	ra,56(sp)
    8000492c:	03013403          	ld	s0,48(sp)
    80004930:	02813483          	ld	s1,40(sp)
    80004934:	02013903          	ld	s2,32(sp)
    80004938:	01813983          	ld	s3,24(sp)
    8000493c:	01013a03          	ld	s4,16(sp)
    80004940:	00813a83          	ld	s5,8(sp)
    80004944:	00013b03          	ld	s6,0(sp)
    80004948:	04010113          	addi	sp,sp,64
    8000494c:	00008067          	ret
    80004950:	00002517          	auipc	a0,0x2
    80004954:	af850513          	addi	a0,a0,-1288 # 80006448 <digits+0x18>
    80004958:	fffff097          	auipc	ra,0xfffff
    8000495c:	3d4080e7          	jalr	980(ra) # 80003d2c <panic>

0000000080004960 <kfree>:
    80004960:	fe010113          	addi	sp,sp,-32
    80004964:	00813823          	sd	s0,16(sp)
    80004968:	00113c23          	sd	ra,24(sp)
    8000496c:	00913423          	sd	s1,8(sp)
    80004970:	02010413          	addi	s0,sp,32
    80004974:	03451793          	slli	a5,a0,0x34
    80004978:	04079c63          	bnez	a5,800049d0 <kfree+0x70>
    8000497c:	00004797          	auipc	a5,0x4
    80004980:	ca478793          	addi	a5,a5,-860 # 80008620 <end>
    80004984:	00050493          	mv	s1,a0
    80004988:	04f56463          	bltu	a0,a5,800049d0 <kfree+0x70>
    8000498c:	01100793          	li	a5,17
    80004990:	01b79793          	slli	a5,a5,0x1b
    80004994:	02f57e63          	bgeu	a0,a5,800049d0 <kfree+0x70>
    80004998:	00001637          	lui	a2,0x1
    8000499c:	00100593          	li	a1,1
    800049a0:	00000097          	auipc	ra,0x0
    800049a4:	478080e7          	jalr	1144(ra) # 80004e18 <__memset>
    800049a8:	00003797          	auipc	a5,0x3
    800049ac:	9b878793          	addi	a5,a5,-1608 # 80007360 <kmem>
    800049b0:	0007b703          	ld	a4,0(a5)
    800049b4:	01813083          	ld	ra,24(sp)
    800049b8:	01013403          	ld	s0,16(sp)
    800049bc:	00e4b023          	sd	a4,0(s1)
    800049c0:	0097b023          	sd	s1,0(a5)
    800049c4:	00813483          	ld	s1,8(sp)
    800049c8:	02010113          	addi	sp,sp,32
    800049cc:	00008067          	ret
    800049d0:	00002517          	auipc	a0,0x2
    800049d4:	a7850513          	addi	a0,a0,-1416 # 80006448 <digits+0x18>
    800049d8:	fffff097          	auipc	ra,0xfffff
    800049dc:	354080e7          	jalr	852(ra) # 80003d2c <panic>

00000000800049e0 <kalloc>:
    800049e0:	fe010113          	addi	sp,sp,-32
    800049e4:	00813823          	sd	s0,16(sp)
    800049e8:	00913423          	sd	s1,8(sp)
    800049ec:	00113c23          	sd	ra,24(sp)
    800049f0:	02010413          	addi	s0,sp,32
    800049f4:	00003797          	auipc	a5,0x3
    800049f8:	96c78793          	addi	a5,a5,-1684 # 80007360 <kmem>
    800049fc:	0007b483          	ld	s1,0(a5)
    80004a00:	02048063          	beqz	s1,80004a20 <kalloc+0x40>
    80004a04:	0004b703          	ld	a4,0(s1)
    80004a08:	00001637          	lui	a2,0x1
    80004a0c:	00500593          	li	a1,5
    80004a10:	00048513          	mv	a0,s1
    80004a14:	00e7b023          	sd	a4,0(a5)
    80004a18:	00000097          	auipc	ra,0x0
    80004a1c:	400080e7          	jalr	1024(ra) # 80004e18 <__memset>
    80004a20:	01813083          	ld	ra,24(sp)
    80004a24:	01013403          	ld	s0,16(sp)
    80004a28:	00048513          	mv	a0,s1
    80004a2c:	00813483          	ld	s1,8(sp)
    80004a30:	02010113          	addi	sp,sp,32
    80004a34:	00008067          	ret

0000000080004a38 <initlock>:
    80004a38:	ff010113          	addi	sp,sp,-16
    80004a3c:	00813423          	sd	s0,8(sp)
    80004a40:	01010413          	addi	s0,sp,16
    80004a44:	00813403          	ld	s0,8(sp)
    80004a48:	00b53423          	sd	a1,8(a0)
    80004a4c:	00052023          	sw	zero,0(a0)
    80004a50:	00053823          	sd	zero,16(a0)
    80004a54:	01010113          	addi	sp,sp,16
    80004a58:	00008067          	ret

0000000080004a5c <acquire>:
    80004a5c:	fe010113          	addi	sp,sp,-32
    80004a60:	00813823          	sd	s0,16(sp)
    80004a64:	00913423          	sd	s1,8(sp)
    80004a68:	00113c23          	sd	ra,24(sp)
    80004a6c:	01213023          	sd	s2,0(sp)
    80004a70:	02010413          	addi	s0,sp,32
    80004a74:	00050493          	mv	s1,a0
    80004a78:	10002973          	csrr	s2,sstatus
    80004a7c:	100027f3          	csrr	a5,sstatus
    80004a80:	ffd7f793          	andi	a5,a5,-3
    80004a84:	10079073          	csrw	sstatus,a5
    80004a88:	fffff097          	auipc	ra,0xfffff
    80004a8c:	8e8080e7          	jalr	-1816(ra) # 80003370 <mycpu>
    80004a90:	07852783          	lw	a5,120(a0)
    80004a94:	06078e63          	beqz	a5,80004b10 <acquire+0xb4>
    80004a98:	fffff097          	auipc	ra,0xfffff
    80004a9c:	8d8080e7          	jalr	-1832(ra) # 80003370 <mycpu>
    80004aa0:	07852783          	lw	a5,120(a0)
    80004aa4:	0004a703          	lw	a4,0(s1)
    80004aa8:	0017879b          	addiw	a5,a5,1
    80004aac:	06f52c23          	sw	a5,120(a0)
    80004ab0:	04071063          	bnez	a4,80004af0 <acquire+0x94>
    80004ab4:	00100713          	li	a4,1
    80004ab8:	00070793          	mv	a5,a4
    80004abc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80004ac0:	0007879b          	sext.w	a5,a5
    80004ac4:	fe079ae3          	bnez	a5,80004ab8 <acquire+0x5c>
    80004ac8:	0ff0000f          	fence
    80004acc:	fffff097          	auipc	ra,0xfffff
    80004ad0:	8a4080e7          	jalr	-1884(ra) # 80003370 <mycpu>
    80004ad4:	01813083          	ld	ra,24(sp)
    80004ad8:	01013403          	ld	s0,16(sp)
    80004adc:	00a4b823          	sd	a0,16(s1)
    80004ae0:	00013903          	ld	s2,0(sp)
    80004ae4:	00813483          	ld	s1,8(sp)
    80004ae8:	02010113          	addi	sp,sp,32
    80004aec:	00008067          	ret
    80004af0:	0104b903          	ld	s2,16(s1)
    80004af4:	fffff097          	auipc	ra,0xfffff
    80004af8:	87c080e7          	jalr	-1924(ra) # 80003370 <mycpu>
    80004afc:	faa91ce3          	bne	s2,a0,80004ab4 <acquire+0x58>
    80004b00:	00002517          	auipc	a0,0x2
    80004b04:	95050513          	addi	a0,a0,-1712 # 80006450 <digits+0x20>
    80004b08:	fffff097          	auipc	ra,0xfffff
    80004b0c:	224080e7          	jalr	548(ra) # 80003d2c <panic>
    80004b10:	00195913          	srli	s2,s2,0x1
    80004b14:	fffff097          	auipc	ra,0xfffff
    80004b18:	85c080e7          	jalr	-1956(ra) # 80003370 <mycpu>
    80004b1c:	00197913          	andi	s2,s2,1
    80004b20:	07252e23          	sw	s2,124(a0)
    80004b24:	f75ff06f          	j	80004a98 <acquire+0x3c>

0000000080004b28 <release>:
    80004b28:	fe010113          	addi	sp,sp,-32
    80004b2c:	00813823          	sd	s0,16(sp)
    80004b30:	00113c23          	sd	ra,24(sp)
    80004b34:	00913423          	sd	s1,8(sp)
    80004b38:	01213023          	sd	s2,0(sp)
    80004b3c:	02010413          	addi	s0,sp,32
    80004b40:	00052783          	lw	a5,0(a0)
    80004b44:	00079a63          	bnez	a5,80004b58 <release+0x30>
    80004b48:	00002517          	auipc	a0,0x2
    80004b4c:	91050513          	addi	a0,a0,-1776 # 80006458 <digits+0x28>
    80004b50:	fffff097          	auipc	ra,0xfffff
    80004b54:	1dc080e7          	jalr	476(ra) # 80003d2c <panic>
    80004b58:	01053903          	ld	s2,16(a0)
    80004b5c:	00050493          	mv	s1,a0
    80004b60:	fffff097          	auipc	ra,0xfffff
    80004b64:	810080e7          	jalr	-2032(ra) # 80003370 <mycpu>
    80004b68:	fea910e3          	bne	s2,a0,80004b48 <release+0x20>
    80004b6c:	0004b823          	sd	zero,16(s1)
    80004b70:	0ff0000f          	fence
    80004b74:	0f50000f          	fence	iorw,ow
    80004b78:	0804a02f          	amoswap.w	zero,zero,(s1)
    80004b7c:	ffffe097          	auipc	ra,0xffffe
    80004b80:	7f4080e7          	jalr	2036(ra) # 80003370 <mycpu>
    80004b84:	100027f3          	csrr	a5,sstatus
    80004b88:	0027f793          	andi	a5,a5,2
    80004b8c:	04079a63          	bnez	a5,80004be0 <release+0xb8>
    80004b90:	07852783          	lw	a5,120(a0)
    80004b94:	02f05e63          	blez	a5,80004bd0 <release+0xa8>
    80004b98:	fff7871b          	addiw	a4,a5,-1
    80004b9c:	06e52c23          	sw	a4,120(a0)
    80004ba0:	00071c63          	bnez	a4,80004bb8 <release+0x90>
    80004ba4:	07c52783          	lw	a5,124(a0)
    80004ba8:	00078863          	beqz	a5,80004bb8 <release+0x90>
    80004bac:	100027f3          	csrr	a5,sstatus
    80004bb0:	0027e793          	ori	a5,a5,2
    80004bb4:	10079073          	csrw	sstatus,a5
    80004bb8:	01813083          	ld	ra,24(sp)
    80004bbc:	01013403          	ld	s0,16(sp)
    80004bc0:	00813483          	ld	s1,8(sp)
    80004bc4:	00013903          	ld	s2,0(sp)
    80004bc8:	02010113          	addi	sp,sp,32
    80004bcc:	00008067          	ret
    80004bd0:	00002517          	auipc	a0,0x2
    80004bd4:	8a850513          	addi	a0,a0,-1880 # 80006478 <digits+0x48>
    80004bd8:	fffff097          	auipc	ra,0xfffff
    80004bdc:	154080e7          	jalr	340(ra) # 80003d2c <panic>
    80004be0:	00002517          	auipc	a0,0x2
    80004be4:	88050513          	addi	a0,a0,-1920 # 80006460 <digits+0x30>
    80004be8:	fffff097          	auipc	ra,0xfffff
    80004bec:	144080e7          	jalr	324(ra) # 80003d2c <panic>

0000000080004bf0 <holding>:
    80004bf0:	00052783          	lw	a5,0(a0)
    80004bf4:	00079663          	bnez	a5,80004c00 <holding+0x10>
    80004bf8:	00000513          	li	a0,0
    80004bfc:	00008067          	ret
    80004c00:	fe010113          	addi	sp,sp,-32
    80004c04:	00813823          	sd	s0,16(sp)
    80004c08:	00913423          	sd	s1,8(sp)
    80004c0c:	00113c23          	sd	ra,24(sp)
    80004c10:	02010413          	addi	s0,sp,32
    80004c14:	01053483          	ld	s1,16(a0)
    80004c18:	ffffe097          	auipc	ra,0xffffe
    80004c1c:	758080e7          	jalr	1880(ra) # 80003370 <mycpu>
    80004c20:	01813083          	ld	ra,24(sp)
    80004c24:	01013403          	ld	s0,16(sp)
    80004c28:	40a48533          	sub	a0,s1,a0
    80004c2c:	00153513          	seqz	a0,a0
    80004c30:	00813483          	ld	s1,8(sp)
    80004c34:	02010113          	addi	sp,sp,32
    80004c38:	00008067          	ret

0000000080004c3c <push_off>:
    80004c3c:	fe010113          	addi	sp,sp,-32
    80004c40:	00813823          	sd	s0,16(sp)
    80004c44:	00113c23          	sd	ra,24(sp)
    80004c48:	00913423          	sd	s1,8(sp)
    80004c4c:	02010413          	addi	s0,sp,32
    80004c50:	100024f3          	csrr	s1,sstatus
    80004c54:	100027f3          	csrr	a5,sstatus
    80004c58:	ffd7f793          	andi	a5,a5,-3
    80004c5c:	10079073          	csrw	sstatus,a5
    80004c60:	ffffe097          	auipc	ra,0xffffe
    80004c64:	710080e7          	jalr	1808(ra) # 80003370 <mycpu>
    80004c68:	07852783          	lw	a5,120(a0)
    80004c6c:	02078663          	beqz	a5,80004c98 <push_off+0x5c>
    80004c70:	ffffe097          	auipc	ra,0xffffe
    80004c74:	700080e7          	jalr	1792(ra) # 80003370 <mycpu>
    80004c78:	07852783          	lw	a5,120(a0)
    80004c7c:	01813083          	ld	ra,24(sp)
    80004c80:	01013403          	ld	s0,16(sp)
    80004c84:	0017879b          	addiw	a5,a5,1
    80004c88:	06f52c23          	sw	a5,120(a0)
    80004c8c:	00813483          	ld	s1,8(sp)
    80004c90:	02010113          	addi	sp,sp,32
    80004c94:	00008067          	ret
    80004c98:	0014d493          	srli	s1,s1,0x1
    80004c9c:	ffffe097          	auipc	ra,0xffffe
    80004ca0:	6d4080e7          	jalr	1748(ra) # 80003370 <mycpu>
    80004ca4:	0014f493          	andi	s1,s1,1
    80004ca8:	06952e23          	sw	s1,124(a0)
    80004cac:	fc5ff06f          	j	80004c70 <push_off+0x34>

0000000080004cb0 <pop_off>:
    80004cb0:	ff010113          	addi	sp,sp,-16
    80004cb4:	00813023          	sd	s0,0(sp)
    80004cb8:	00113423          	sd	ra,8(sp)
    80004cbc:	01010413          	addi	s0,sp,16
    80004cc0:	ffffe097          	auipc	ra,0xffffe
    80004cc4:	6b0080e7          	jalr	1712(ra) # 80003370 <mycpu>
    80004cc8:	100027f3          	csrr	a5,sstatus
    80004ccc:	0027f793          	andi	a5,a5,2
    80004cd0:	04079663          	bnez	a5,80004d1c <pop_off+0x6c>
    80004cd4:	07852783          	lw	a5,120(a0)
    80004cd8:	02f05a63          	blez	a5,80004d0c <pop_off+0x5c>
    80004cdc:	fff7871b          	addiw	a4,a5,-1
    80004ce0:	06e52c23          	sw	a4,120(a0)
    80004ce4:	00071c63          	bnez	a4,80004cfc <pop_off+0x4c>
    80004ce8:	07c52783          	lw	a5,124(a0)
    80004cec:	00078863          	beqz	a5,80004cfc <pop_off+0x4c>
    80004cf0:	100027f3          	csrr	a5,sstatus
    80004cf4:	0027e793          	ori	a5,a5,2
    80004cf8:	10079073          	csrw	sstatus,a5
    80004cfc:	00813083          	ld	ra,8(sp)
    80004d00:	00013403          	ld	s0,0(sp)
    80004d04:	01010113          	addi	sp,sp,16
    80004d08:	00008067          	ret
    80004d0c:	00001517          	auipc	a0,0x1
    80004d10:	76c50513          	addi	a0,a0,1900 # 80006478 <digits+0x48>
    80004d14:	fffff097          	auipc	ra,0xfffff
    80004d18:	018080e7          	jalr	24(ra) # 80003d2c <panic>
    80004d1c:	00001517          	auipc	a0,0x1
    80004d20:	74450513          	addi	a0,a0,1860 # 80006460 <digits+0x30>
    80004d24:	fffff097          	auipc	ra,0xfffff
    80004d28:	008080e7          	jalr	8(ra) # 80003d2c <panic>

0000000080004d2c <push_on>:
    80004d2c:	fe010113          	addi	sp,sp,-32
    80004d30:	00813823          	sd	s0,16(sp)
    80004d34:	00113c23          	sd	ra,24(sp)
    80004d38:	00913423          	sd	s1,8(sp)
    80004d3c:	02010413          	addi	s0,sp,32
    80004d40:	100024f3          	csrr	s1,sstatus
    80004d44:	100027f3          	csrr	a5,sstatus
    80004d48:	0027e793          	ori	a5,a5,2
    80004d4c:	10079073          	csrw	sstatus,a5
    80004d50:	ffffe097          	auipc	ra,0xffffe
    80004d54:	620080e7          	jalr	1568(ra) # 80003370 <mycpu>
    80004d58:	07852783          	lw	a5,120(a0)
    80004d5c:	02078663          	beqz	a5,80004d88 <push_on+0x5c>
    80004d60:	ffffe097          	auipc	ra,0xffffe
    80004d64:	610080e7          	jalr	1552(ra) # 80003370 <mycpu>
    80004d68:	07852783          	lw	a5,120(a0)
    80004d6c:	01813083          	ld	ra,24(sp)
    80004d70:	01013403          	ld	s0,16(sp)
    80004d74:	0017879b          	addiw	a5,a5,1
    80004d78:	06f52c23          	sw	a5,120(a0)
    80004d7c:	00813483          	ld	s1,8(sp)
    80004d80:	02010113          	addi	sp,sp,32
    80004d84:	00008067          	ret
    80004d88:	0014d493          	srli	s1,s1,0x1
    80004d8c:	ffffe097          	auipc	ra,0xffffe
    80004d90:	5e4080e7          	jalr	1508(ra) # 80003370 <mycpu>
    80004d94:	0014f493          	andi	s1,s1,1
    80004d98:	06952e23          	sw	s1,124(a0)
    80004d9c:	fc5ff06f          	j	80004d60 <push_on+0x34>

0000000080004da0 <pop_on>:
    80004da0:	ff010113          	addi	sp,sp,-16
    80004da4:	00813023          	sd	s0,0(sp)
    80004da8:	00113423          	sd	ra,8(sp)
    80004dac:	01010413          	addi	s0,sp,16
    80004db0:	ffffe097          	auipc	ra,0xffffe
    80004db4:	5c0080e7          	jalr	1472(ra) # 80003370 <mycpu>
    80004db8:	100027f3          	csrr	a5,sstatus
    80004dbc:	0027f793          	andi	a5,a5,2
    80004dc0:	04078463          	beqz	a5,80004e08 <pop_on+0x68>
    80004dc4:	07852783          	lw	a5,120(a0)
    80004dc8:	02f05863          	blez	a5,80004df8 <pop_on+0x58>
    80004dcc:	fff7879b          	addiw	a5,a5,-1
    80004dd0:	06f52c23          	sw	a5,120(a0)
    80004dd4:	07853783          	ld	a5,120(a0)
    80004dd8:	00079863          	bnez	a5,80004de8 <pop_on+0x48>
    80004ddc:	100027f3          	csrr	a5,sstatus
    80004de0:	ffd7f793          	andi	a5,a5,-3
    80004de4:	10079073          	csrw	sstatus,a5
    80004de8:	00813083          	ld	ra,8(sp)
    80004dec:	00013403          	ld	s0,0(sp)
    80004df0:	01010113          	addi	sp,sp,16
    80004df4:	00008067          	ret
    80004df8:	00001517          	auipc	a0,0x1
    80004dfc:	6a850513          	addi	a0,a0,1704 # 800064a0 <digits+0x70>
    80004e00:	fffff097          	auipc	ra,0xfffff
    80004e04:	f2c080e7          	jalr	-212(ra) # 80003d2c <panic>
    80004e08:	00001517          	auipc	a0,0x1
    80004e0c:	67850513          	addi	a0,a0,1656 # 80006480 <digits+0x50>
    80004e10:	fffff097          	auipc	ra,0xfffff
    80004e14:	f1c080e7          	jalr	-228(ra) # 80003d2c <panic>

0000000080004e18 <__memset>:
    80004e18:	ff010113          	addi	sp,sp,-16
    80004e1c:	00813423          	sd	s0,8(sp)
    80004e20:	01010413          	addi	s0,sp,16
    80004e24:	1a060e63          	beqz	a2,80004fe0 <__memset+0x1c8>
    80004e28:	40a007b3          	neg	a5,a0
    80004e2c:	0077f793          	andi	a5,a5,7
    80004e30:	00778693          	addi	a3,a5,7
    80004e34:	00b00813          	li	a6,11
    80004e38:	0ff5f593          	andi	a1,a1,255
    80004e3c:	fff6071b          	addiw	a4,a2,-1
    80004e40:	1b06e663          	bltu	a3,a6,80004fec <__memset+0x1d4>
    80004e44:	1cd76463          	bltu	a4,a3,8000500c <__memset+0x1f4>
    80004e48:	1a078e63          	beqz	a5,80005004 <__memset+0x1ec>
    80004e4c:	00b50023          	sb	a1,0(a0)
    80004e50:	00100713          	li	a4,1
    80004e54:	1ae78463          	beq	a5,a4,80004ffc <__memset+0x1e4>
    80004e58:	00b500a3          	sb	a1,1(a0)
    80004e5c:	00200713          	li	a4,2
    80004e60:	1ae78a63          	beq	a5,a4,80005014 <__memset+0x1fc>
    80004e64:	00b50123          	sb	a1,2(a0)
    80004e68:	00300713          	li	a4,3
    80004e6c:	18e78463          	beq	a5,a4,80004ff4 <__memset+0x1dc>
    80004e70:	00b501a3          	sb	a1,3(a0)
    80004e74:	00400713          	li	a4,4
    80004e78:	1ae78263          	beq	a5,a4,8000501c <__memset+0x204>
    80004e7c:	00b50223          	sb	a1,4(a0)
    80004e80:	00500713          	li	a4,5
    80004e84:	1ae78063          	beq	a5,a4,80005024 <__memset+0x20c>
    80004e88:	00b502a3          	sb	a1,5(a0)
    80004e8c:	00700713          	li	a4,7
    80004e90:	18e79e63          	bne	a5,a4,8000502c <__memset+0x214>
    80004e94:	00b50323          	sb	a1,6(a0)
    80004e98:	00700e93          	li	t4,7
    80004e9c:	00859713          	slli	a4,a1,0x8
    80004ea0:	00e5e733          	or	a4,a1,a4
    80004ea4:	01059e13          	slli	t3,a1,0x10
    80004ea8:	01c76e33          	or	t3,a4,t3
    80004eac:	01859313          	slli	t1,a1,0x18
    80004eb0:	006e6333          	or	t1,t3,t1
    80004eb4:	02059893          	slli	a7,a1,0x20
    80004eb8:	40f60e3b          	subw	t3,a2,a5
    80004ebc:	011368b3          	or	a7,t1,a7
    80004ec0:	02859813          	slli	a6,a1,0x28
    80004ec4:	0108e833          	or	a6,a7,a6
    80004ec8:	03059693          	slli	a3,a1,0x30
    80004ecc:	003e589b          	srliw	a7,t3,0x3
    80004ed0:	00d866b3          	or	a3,a6,a3
    80004ed4:	03859713          	slli	a4,a1,0x38
    80004ed8:	00389813          	slli	a6,a7,0x3
    80004edc:	00f507b3          	add	a5,a0,a5
    80004ee0:	00e6e733          	or	a4,a3,a4
    80004ee4:	000e089b          	sext.w	a7,t3
    80004ee8:	00f806b3          	add	a3,a6,a5
    80004eec:	00e7b023          	sd	a4,0(a5)
    80004ef0:	00878793          	addi	a5,a5,8
    80004ef4:	fed79ce3          	bne	a5,a3,80004eec <__memset+0xd4>
    80004ef8:	ff8e7793          	andi	a5,t3,-8
    80004efc:	0007871b          	sext.w	a4,a5
    80004f00:	01d787bb          	addw	a5,a5,t4
    80004f04:	0ce88e63          	beq	a7,a4,80004fe0 <__memset+0x1c8>
    80004f08:	00f50733          	add	a4,a0,a5
    80004f0c:	00b70023          	sb	a1,0(a4)
    80004f10:	0017871b          	addiw	a4,a5,1
    80004f14:	0cc77663          	bgeu	a4,a2,80004fe0 <__memset+0x1c8>
    80004f18:	00e50733          	add	a4,a0,a4
    80004f1c:	00b70023          	sb	a1,0(a4)
    80004f20:	0027871b          	addiw	a4,a5,2
    80004f24:	0ac77e63          	bgeu	a4,a2,80004fe0 <__memset+0x1c8>
    80004f28:	00e50733          	add	a4,a0,a4
    80004f2c:	00b70023          	sb	a1,0(a4)
    80004f30:	0037871b          	addiw	a4,a5,3
    80004f34:	0ac77663          	bgeu	a4,a2,80004fe0 <__memset+0x1c8>
    80004f38:	00e50733          	add	a4,a0,a4
    80004f3c:	00b70023          	sb	a1,0(a4)
    80004f40:	0047871b          	addiw	a4,a5,4
    80004f44:	08c77e63          	bgeu	a4,a2,80004fe0 <__memset+0x1c8>
    80004f48:	00e50733          	add	a4,a0,a4
    80004f4c:	00b70023          	sb	a1,0(a4)
    80004f50:	0057871b          	addiw	a4,a5,5
    80004f54:	08c77663          	bgeu	a4,a2,80004fe0 <__memset+0x1c8>
    80004f58:	00e50733          	add	a4,a0,a4
    80004f5c:	00b70023          	sb	a1,0(a4)
    80004f60:	0067871b          	addiw	a4,a5,6
    80004f64:	06c77e63          	bgeu	a4,a2,80004fe0 <__memset+0x1c8>
    80004f68:	00e50733          	add	a4,a0,a4
    80004f6c:	00b70023          	sb	a1,0(a4)
    80004f70:	0077871b          	addiw	a4,a5,7
    80004f74:	06c77663          	bgeu	a4,a2,80004fe0 <__memset+0x1c8>
    80004f78:	00e50733          	add	a4,a0,a4
    80004f7c:	00b70023          	sb	a1,0(a4)
    80004f80:	0087871b          	addiw	a4,a5,8
    80004f84:	04c77e63          	bgeu	a4,a2,80004fe0 <__memset+0x1c8>
    80004f88:	00e50733          	add	a4,a0,a4
    80004f8c:	00b70023          	sb	a1,0(a4)
    80004f90:	0097871b          	addiw	a4,a5,9
    80004f94:	04c77663          	bgeu	a4,a2,80004fe0 <__memset+0x1c8>
    80004f98:	00e50733          	add	a4,a0,a4
    80004f9c:	00b70023          	sb	a1,0(a4)
    80004fa0:	00a7871b          	addiw	a4,a5,10
    80004fa4:	02c77e63          	bgeu	a4,a2,80004fe0 <__memset+0x1c8>
    80004fa8:	00e50733          	add	a4,a0,a4
    80004fac:	00b70023          	sb	a1,0(a4)
    80004fb0:	00b7871b          	addiw	a4,a5,11
    80004fb4:	02c77663          	bgeu	a4,a2,80004fe0 <__memset+0x1c8>
    80004fb8:	00e50733          	add	a4,a0,a4
    80004fbc:	00b70023          	sb	a1,0(a4)
    80004fc0:	00c7871b          	addiw	a4,a5,12
    80004fc4:	00c77e63          	bgeu	a4,a2,80004fe0 <__memset+0x1c8>
    80004fc8:	00e50733          	add	a4,a0,a4
    80004fcc:	00b70023          	sb	a1,0(a4)
    80004fd0:	00d7879b          	addiw	a5,a5,13
    80004fd4:	00c7f663          	bgeu	a5,a2,80004fe0 <__memset+0x1c8>
    80004fd8:	00f507b3          	add	a5,a0,a5
    80004fdc:	00b78023          	sb	a1,0(a5)
    80004fe0:	00813403          	ld	s0,8(sp)
    80004fe4:	01010113          	addi	sp,sp,16
    80004fe8:	00008067          	ret
    80004fec:	00b00693          	li	a3,11
    80004ff0:	e55ff06f          	j	80004e44 <__memset+0x2c>
    80004ff4:	00300e93          	li	t4,3
    80004ff8:	ea5ff06f          	j	80004e9c <__memset+0x84>
    80004ffc:	00100e93          	li	t4,1
    80005000:	e9dff06f          	j	80004e9c <__memset+0x84>
    80005004:	00000e93          	li	t4,0
    80005008:	e95ff06f          	j	80004e9c <__memset+0x84>
    8000500c:	00000793          	li	a5,0
    80005010:	ef9ff06f          	j	80004f08 <__memset+0xf0>
    80005014:	00200e93          	li	t4,2
    80005018:	e85ff06f          	j	80004e9c <__memset+0x84>
    8000501c:	00400e93          	li	t4,4
    80005020:	e7dff06f          	j	80004e9c <__memset+0x84>
    80005024:	00500e93          	li	t4,5
    80005028:	e75ff06f          	j	80004e9c <__memset+0x84>
    8000502c:	00600e93          	li	t4,6
    80005030:	e6dff06f          	j	80004e9c <__memset+0x84>

0000000080005034 <__memmove>:
    80005034:	ff010113          	addi	sp,sp,-16
    80005038:	00813423          	sd	s0,8(sp)
    8000503c:	01010413          	addi	s0,sp,16
    80005040:	0e060863          	beqz	a2,80005130 <__memmove+0xfc>
    80005044:	fff6069b          	addiw	a3,a2,-1
    80005048:	0006881b          	sext.w	a6,a3
    8000504c:	0ea5e863          	bltu	a1,a0,8000513c <__memmove+0x108>
    80005050:	00758713          	addi	a4,a1,7
    80005054:	00a5e7b3          	or	a5,a1,a0
    80005058:	40a70733          	sub	a4,a4,a0
    8000505c:	0077f793          	andi	a5,a5,7
    80005060:	00f73713          	sltiu	a4,a4,15
    80005064:	00174713          	xori	a4,a4,1
    80005068:	0017b793          	seqz	a5,a5
    8000506c:	00e7f7b3          	and	a5,a5,a4
    80005070:	10078863          	beqz	a5,80005180 <__memmove+0x14c>
    80005074:	00900793          	li	a5,9
    80005078:	1107f463          	bgeu	a5,a6,80005180 <__memmove+0x14c>
    8000507c:	0036581b          	srliw	a6,a2,0x3
    80005080:	fff8081b          	addiw	a6,a6,-1
    80005084:	02081813          	slli	a6,a6,0x20
    80005088:	01d85893          	srli	a7,a6,0x1d
    8000508c:	00858813          	addi	a6,a1,8
    80005090:	00058793          	mv	a5,a1
    80005094:	00050713          	mv	a4,a0
    80005098:	01088833          	add	a6,a7,a6
    8000509c:	0007b883          	ld	a7,0(a5)
    800050a0:	00878793          	addi	a5,a5,8
    800050a4:	00870713          	addi	a4,a4,8
    800050a8:	ff173c23          	sd	a7,-8(a4)
    800050ac:	ff0798e3          	bne	a5,a6,8000509c <__memmove+0x68>
    800050b0:	ff867713          	andi	a4,a2,-8
    800050b4:	02071793          	slli	a5,a4,0x20
    800050b8:	0207d793          	srli	a5,a5,0x20
    800050bc:	00f585b3          	add	a1,a1,a5
    800050c0:	40e686bb          	subw	a3,a3,a4
    800050c4:	00f507b3          	add	a5,a0,a5
    800050c8:	06e60463          	beq	a2,a4,80005130 <__memmove+0xfc>
    800050cc:	0005c703          	lbu	a4,0(a1)
    800050d0:	00e78023          	sb	a4,0(a5)
    800050d4:	04068e63          	beqz	a3,80005130 <__memmove+0xfc>
    800050d8:	0015c603          	lbu	a2,1(a1)
    800050dc:	00100713          	li	a4,1
    800050e0:	00c780a3          	sb	a2,1(a5)
    800050e4:	04e68663          	beq	a3,a4,80005130 <__memmove+0xfc>
    800050e8:	0025c603          	lbu	a2,2(a1)
    800050ec:	00200713          	li	a4,2
    800050f0:	00c78123          	sb	a2,2(a5)
    800050f4:	02e68e63          	beq	a3,a4,80005130 <__memmove+0xfc>
    800050f8:	0035c603          	lbu	a2,3(a1)
    800050fc:	00300713          	li	a4,3
    80005100:	00c781a3          	sb	a2,3(a5)
    80005104:	02e68663          	beq	a3,a4,80005130 <__memmove+0xfc>
    80005108:	0045c603          	lbu	a2,4(a1)
    8000510c:	00400713          	li	a4,4
    80005110:	00c78223          	sb	a2,4(a5)
    80005114:	00e68e63          	beq	a3,a4,80005130 <__memmove+0xfc>
    80005118:	0055c603          	lbu	a2,5(a1)
    8000511c:	00500713          	li	a4,5
    80005120:	00c782a3          	sb	a2,5(a5)
    80005124:	00e68663          	beq	a3,a4,80005130 <__memmove+0xfc>
    80005128:	0065c703          	lbu	a4,6(a1)
    8000512c:	00e78323          	sb	a4,6(a5)
    80005130:	00813403          	ld	s0,8(sp)
    80005134:	01010113          	addi	sp,sp,16
    80005138:	00008067          	ret
    8000513c:	02061713          	slli	a4,a2,0x20
    80005140:	02075713          	srli	a4,a4,0x20
    80005144:	00e587b3          	add	a5,a1,a4
    80005148:	f0f574e3          	bgeu	a0,a5,80005050 <__memmove+0x1c>
    8000514c:	02069613          	slli	a2,a3,0x20
    80005150:	02065613          	srli	a2,a2,0x20
    80005154:	fff64613          	not	a2,a2
    80005158:	00e50733          	add	a4,a0,a4
    8000515c:	00c78633          	add	a2,a5,a2
    80005160:	fff7c683          	lbu	a3,-1(a5)
    80005164:	fff78793          	addi	a5,a5,-1
    80005168:	fff70713          	addi	a4,a4,-1
    8000516c:	00d70023          	sb	a3,0(a4)
    80005170:	fec798e3          	bne	a5,a2,80005160 <__memmove+0x12c>
    80005174:	00813403          	ld	s0,8(sp)
    80005178:	01010113          	addi	sp,sp,16
    8000517c:	00008067          	ret
    80005180:	02069713          	slli	a4,a3,0x20
    80005184:	02075713          	srli	a4,a4,0x20
    80005188:	00170713          	addi	a4,a4,1
    8000518c:	00e50733          	add	a4,a0,a4
    80005190:	00050793          	mv	a5,a0
    80005194:	0005c683          	lbu	a3,0(a1)
    80005198:	00178793          	addi	a5,a5,1
    8000519c:	00158593          	addi	a1,a1,1
    800051a0:	fed78fa3          	sb	a3,-1(a5)
    800051a4:	fee798e3          	bne	a5,a4,80005194 <__memmove+0x160>
    800051a8:	f89ff06f          	j	80005130 <__memmove+0xfc>

00000000800051ac <__putc>:
    800051ac:	fe010113          	addi	sp,sp,-32
    800051b0:	00813823          	sd	s0,16(sp)
    800051b4:	00113c23          	sd	ra,24(sp)
    800051b8:	02010413          	addi	s0,sp,32
    800051bc:	00050793          	mv	a5,a0
    800051c0:	fef40593          	addi	a1,s0,-17
    800051c4:	00100613          	li	a2,1
    800051c8:	00000513          	li	a0,0
    800051cc:	fef407a3          	sb	a5,-17(s0)
    800051d0:	fffff097          	auipc	ra,0xfffff
    800051d4:	b3c080e7          	jalr	-1220(ra) # 80003d0c <console_write>
    800051d8:	01813083          	ld	ra,24(sp)
    800051dc:	01013403          	ld	s0,16(sp)
    800051e0:	02010113          	addi	sp,sp,32
    800051e4:	00008067          	ret

00000000800051e8 <__getc>:
    800051e8:	fe010113          	addi	sp,sp,-32
    800051ec:	00813823          	sd	s0,16(sp)
    800051f0:	00113c23          	sd	ra,24(sp)
    800051f4:	02010413          	addi	s0,sp,32
    800051f8:	fe840593          	addi	a1,s0,-24
    800051fc:	00100613          	li	a2,1
    80005200:	00000513          	li	a0,0
    80005204:	fffff097          	auipc	ra,0xfffff
    80005208:	ae8080e7          	jalr	-1304(ra) # 80003cec <console_read>
    8000520c:	fe844503          	lbu	a0,-24(s0)
    80005210:	01813083          	ld	ra,24(sp)
    80005214:	01013403          	ld	s0,16(sp)
    80005218:	02010113          	addi	sp,sp,32
    8000521c:	00008067          	ret

0000000080005220 <console_handler>:
    80005220:	fe010113          	addi	sp,sp,-32
    80005224:	00813823          	sd	s0,16(sp)
    80005228:	00113c23          	sd	ra,24(sp)
    8000522c:	00913423          	sd	s1,8(sp)
    80005230:	02010413          	addi	s0,sp,32
    80005234:	14202773          	csrr	a4,scause
    80005238:	100027f3          	csrr	a5,sstatus
    8000523c:	0027f793          	andi	a5,a5,2
    80005240:	06079e63          	bnez	a5,800052bc <console_handler+0x9c>
    80005244:	00074c63          	bltz	a4,8000525c <console_handler+0x3c>
    80005248:	01813083          	ld	ra,24(sp)
    8000524c:	01013403          	ld	s0,16(sp)
    80005250:	00813483          	ld	s1,8(sp)
    80005254:	02010113          	addi	sp,sp,32
    80005258:	00008067          	ret
    8000525c:	0ff77713          	andi	a4,a4,255
    80005260:	00900793          	li	a5,9
    80005264:	fef712e3          	bne	a4,a5,80005248 <console_handler+0x28>
    80005268:	ffffe097          	auipc	ra,0xffffe
    8000526c:	6dc080e7          	jalr	1756(ra) # 80003944 <plic_claim>
    80005270:	00a00793          	li	a5,10
    80005274:	00050493          	mv	s1,a0
    80005278:	02f50c63          	beq	a0,a5,800052b0 <console_handler+0x90>
    8000527c:	fc0506e3          	beqz	a0,80005248 <console_handler+0x28>
    80005280:	00050593          	mv	a1,a0
    80005284:	00001517          	auipc	a0,0x1
    80005288:	12450513          	addi	a0,a0,292 # 800063a8 <CONSOLE_STATUS+0x398>
    8000528c:	fffff097          	auipc	ra,0xfffff
    80005290:	afc080e7          	jalr	-1284(ra) # 80003d88 <__printf>
    80005294:	01013403          	ld	s0,16(sp)
    80005298:	01813083          	ld	ra,24(sp)
    8000529c:	00048513          	mv	a0,s1
    800052a0:	00813483          	ld	s1,8(sp)
    800052a4:	02010113          	addi	sp,sp,32
    800052a8:	ffffe317          	auipc	t1,0xffffe
    800052ac:	6d430067          	jr	1748(t1) # 8000397c <plic_complete>
    800052b0:	fffff097          	auipc	ra,0xfffff
    800052b4:	3e0080e7          	jalr	992(ra) # 80004690 <uartintr>
    800052b8:	fddff06f          	j	80005294 <console_handler+0x74>
    800052bc:	00001517          	auipc	a0,0x1
    800052c0:	1ec50513          	addi	a0,a0,492 # 800064a8 <digits+0x78>
    800052c4:	fffff097          	auipc	ra,0xfffff
    800052c8:	a68080e7          	jalr	-1432(ra) # 80003d2c <panic>
	...
