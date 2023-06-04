
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00006117          	auipc	sp,0x6
    80000004:	13813103          	ld	sp,312(sp) # 80006138 <_GLOBAL_OFFSET_TABLE_+0x18>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	4a9020ef          	jal	ra,80002cc4 <start>

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
    80001184:	449000ef          	jal	ra,80001dcc <interruptRoutine>

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

0000000080001480 <_Z8sem_openPP4_semj>:

int sem_open(sem_t* handle, unsigned int init) {
    80001480:	ff010113          	addi	sp,sp,-16
    80001484:	00813423          	sd	s0,8(sp)
    80001488:	01010413          	addi	s0,sp,16
	return 0;
}
    8000148c:	00000513          	li	a0,0
    80001490:	00813403          	ld	s0,8(sp)
    80001494:	01010113          	addi	sp,sp,16
    80001498:	00008067          	ret

000000008000149c <_Z9sem_closeP4_sem>:

int sem_close(sem_t handle) {
    8000149c:	ff010113          	addi	sp,sp,-16
    800014a0:	00813423          	sd	s0,8(sp)
    800014a4:	01010413          	addi	s0,sp,16
	return 0;
}
    800014a8:	00000513          	li	a0,0
    800014ac:	00813403          	ld	s0,8(sp)
    800014b0:	01010113          	addi	sp,sp,16
    800014b4:	00008067          	ret

00000000800014b8 <_Z8sem_waitP4_sem>:

int sem_wait(sem_t id) {
    800014b8:	ff010113          	addi	sp,sp,-16
    800014bc:	00813423          	sd	s0,8(sp)
    800014c0:	01010413          	addi	s0,sp,16
	return 0;
}
    800014c4:	00000513          	li	a0,0
    800014c8:	00813403          	ld	s0,8(sp)
    800014cc:	01010113          	addi	sp,sp,16
    800014d0:	00008067          	ret

00000000800014d4 <_Z10sem_signalP4_sem>:

int sem_signal(sem_t id) {
    800014d4:	ff010113          	addi	sp,sp,-16
    800014d8:	00813423          	sd	s0,8(sp)
    800014dc:	01010413          	addi	s0,sp,16
	return 0;
}
    800014e0:	00000513          	li	a0,0
    800014e4:	00813403          	ld	s0,8(sp)
    800014e8:	01010113          	addi	sp,sp,16
    800014ec:	00008067          	ret

00000000800014f0 <_Z4getcv>:

char getc() {
    800014f0:	ff010113          	addi	sp,sp,-16
    800014f4:	00113423          	sd	ra,8(sp)
    800014f8:	00813023          	sd	s0,0(sp)
    800014fc:	01010413          	addi	s0,sp,16
	return __getc();
    80001500:	00004097          	auipc	ra,0x4
    80001504:	8c8080e7          	jalr	-1848(ra) # 80004dc8 <__getc>
}
    80001508:	00813083          	ld	ra,8(sp)
    8000150c:	00013403          	ld	s0,0(sp)
    80001510:	01010113          	addi	sp,sp,16
    80001514:	00008067          	ret

0000000080001518 <_Z4putcc>:

void putc(char c) {
    80001518:	ff010113          	addi	sp,sp,-16
    8000151c:	00113423          	sd	ra,8(sp)
    80001520:	00813023          	sd	s0,0(sp)
    80001524:	01010413          	addi	s0,sp,16
	__putc(c);
    80001528:	00004097          	auipc	ra,0x4
    8000152c:	864080e7          	jalr	-1948(ra) # 80004d8c <__putc>
}
    80001530:	00813083          	ld	ra,8(sp)
    80001534:	00013403          	ld	s0,0(sp)
    80001538:	01010113          	addi	sp,sp,16
    8000153c:	00008067          	ret

0000000080001540 <_Z11printStringPKc>:
#include "../h/helper.hpp"
#include "../lib/console.h"
#include "../h/Riscv.hpp"
//#include "../h/syscall_c.hpp"

void printString(char const* string) {
    80001540:	ff010113          	addi	sp,sp,-16
    80001544:	00813423          	sd	s0,8(sp)
    80001548:	01010413          	addi	s0,sp,16
    8000154c:	00050313          	mv	t1,a0

	//stavljanje argumenata za sistemski poziv
	__asm__ volatile("mv a1, %[ptr]": :[ptr] "r"(string):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001550:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x90");
    80001554:	09000513          	li	a0,144

	__asm__ volatile("ecall");
    80001558:	00000073          	ecall


}
    8000155c:	00813403          	ld	s0,8(sp)
    80001560:	01010113          	addi	sp,sp,16
    80001564:	00008067          	ret

0000000080001568 <_Z12printIntegerm>:
//void println(char const *string) {
//    printString(string);
//    __putc('\n');
//}

void printInteger(uint64 integer) {
    80001568:	ff010113          	addi	sp,sp,-16
    8000156c:	00813423          	sd	s0,8(sp)
    80001570:	01010413          	addi	s0,sp,16
    80001574:	00050313          	mv	t1,a0
	//stavljanje argumenata za sistemski poziv
	__asm__ volatile("mv a1, %[ptr]": :[ptr] "r"(integer):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001578:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x91");
    8000157c:	09100513          	li	a0,145

	__asm__ volatile("ecall");
    80001580:	00000073          	ecall
}
    80001584:	00813403          	ld	s0,8(sp)
    80001588:	01010113          	addi	sp,sp,16
    8000158c:	00008067          	ret

0000000080001590 <_ZN9Scheduler3putEP3TCB>:
//Scheduler* Scheduler::singleton = nullptr;
TCB* Scheduler::head = nullptr;
TCB* Scheduler::tail = nullptr;
TCB* Scheduler::sleepingHead = nullptr;

void Scheduler::put(TCB* tcb) {
    80001590:	ff010113          	addi	sp,sp,-16
    80001594:	00813423          	sd	s0,8(sp)
    80001598:	01010413          	addi	s0,sp,16
	if (tail == nullptr) {
    8000159c:	00005797          	auipc	a5,0x5
    800015a0:	c047b783          	ld	a5,-1020(a5) # 800061a0 <_ZN9Scheduler4tailE>
    800015a4:	00078e63          	beqz	a5,800015c0 <_ZN9Scheduler3putEP3TCB+0x30>
		head = tail = tcb;
	} else {
		tail->nextInScheduler = tcb;
    800015a8:	02a7bc23          	sd	a0,56(a5)
		tail = tcb;
    800015ac:	00005797          	auipc	a5,0x5
    800015b0:	bea7ba23          	sd	a0,-1036(a5) # 800061a0 <_ZN9Scheduler4tailE>
	}
}
    800015b4:	00813403          	ld	s0,8(sp)
    800015b8:	01010113          	addi	sp,sp,16
    800015bc:	00008067          	ret
		head = tail = tcb;
    800015c0:	00005797          	auipc	a5,0x5
    800015c4:	be078793          	addi	a5,a5,-1056 # 800061a0 <_ZN9Scheduler4tailE>
    800015c8:	00a7b023          	sd	a0,0(a5)
    800015cc:	00a7b423          	sd	a0,8(a5)
    800015d0:	fe5ff06f          	j	800015b4 <_ZN9Scheduler3putEP3TCB+0x24>

00000000800015d4 <_ZN9Scheduler3getEv>:

TCB* Scheduler::get() {
    800015d4:	ff010113          	addi	sp,sp,-16
    800015d8:	00813423          	sd	s0,8(sp)
    800015dc:	01010413          	addi	s0,sp,16
	TCB* firstThread = head;
    800015e0:	00005717          	auipc	a4,0x5
    800015e4:	bc070713          	addi	a4,a4,-1088 # 800061a0 <_ZN9Scheduler4tailE>
    800015e8:	00873503          	ld	a0,8(a4)
	head = head->nextInScheduler;
    800015ec:	03853783          	ld	a5,56(a0) # 1038 <_entry-0x7fffefc8>
    800015f0:	00f73423          	sd	a5,8(a4)
	if (head == nullptr) {
    800015f4:	00078a63          	beqz	a5,80001608 <_ZN9Scheduler3getEv+0x34>
		tail = head = nullptr;
	}
	firstThread->nextInScheduler = nullptr;
    800015f8:	02053c23          	sd	zero,56(a0)
	return firstThread;
}
    800015fc:	00813403          	ld	s0,8(sp)
    80001600:	01010113          	addi	sp,sp,16
    80001604:	00008067          	ret
		tail = head = nullptr;
    80001608:	00073423          	sd	zero,8(a4)
    8000160c:	00073023          	sd	zero,0(a4)
    80001610:	fe9ff06f          	j	800015f8 <_ZN9Scheduler3getEv+0x24>

0000000080001614 <_ZN9Scheduler10putToSleepEP3TCBm>:

void Scheduler::putToSleep(TCB* tcb, time_t sleepTime) {
    80001614:	ff010113          	addi	sp,sp,-16
    80001618:	00813423          	sd	s0,8(sp)
    8000161c:	01010413          	addi	s0,sp,16
	if (sleepingHead == nullptr) {
    80001620:	00005817          	auipc	a6,0x5
    80001624:	b9083803          	ld	a6,-1136(a6) # 800061b0 <_ZN9Scheduler12sleepingHeadE>
    80001628:	02080863          	beqz	a6,80001658 <_ZN9Scheduler10putToSleepEP3TCBm+0x44>
		tcb->timeToSleep = sleepTime;
		return;
	}
	TCB* prevSleeping = nullptr;
	time_t accumulated = 0;
	TCB* current = sleepingHead;
    8000162c:	00080793          	mv	a5,a6
	time_t accumulated = 0;
    80001630:	00000693          	li	a3,0
	TCB* prevSleeping = nullptr;
    80001634:	00000613          	li	a2,0
	for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
    80001638:	02078863          	beqz	a5,80001668 <_ZN9Scheduler10putToSleepEP3TCBm+0x54>
    8000163c:	0407b703          	ld	a4,64(a5)
    80001640:	00d70733          	add	a4,a4,a3
    80001644:	02b77263          	bgeu	a4,a1,80001668 <_ZN9Scheduler10putToSleepEP3TCBm+0x54>
		accumulated += current->timeToSleep;
    80001648:	00070693          	mv	a3,a4
		prevSleeping = current;
    8000164c:	00078613          	mv	a2,a5
	for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
    80001650:	0487b783          	ld	a5,72(a5)
    80001654:	fe5ff06f          	j	80001638 <_ZN9Scheduler10putToSleepEP3TCBm+0x24>
		sleepingHead = tcb;
    80001658:	00005797          	auipc	a5,0x5
    8000165c:	b4a7bc23          	sd	a0,-1192(a5) # 800061b0 <_ZN9Scheduler12sleepingHeadE>
		tcb->timeToSleep = sleepTime;
    80001660:	04b53023          	sd	a1,64(a0)
		return;
    80001664:	02c0006f          	j	80001690 <_ZN9Scheduler10putToSleepEP3TCBm+0x7c>
	}
	if (!prevSleeping) {
    80001668:	02060a63          	beqz	a2,8000169c <_ZN9Scheduler10putToSleepEP3TCBm+0x88>
		sleepingHead = tcb;
		tcb->timeToSleep = sleepTime;
		tcb->nextSleeping->timeToSleep -= sleepTime;
		return;
	}
	tcb->nextSleeping = current;
    8000166c:	04f53423          	sd	a5,72(a0)
	prevSleeping->nextSleeping = tcb;
    80001670:	04a63423          	sd	a0,72(a2)
	tcb->timeToSleep = sleepTime - accumulated;
    80001674:	40d58733          	sub	a4,a1,a3
    80001678:	04e53023          	sd	a4,64(a0)
	if (current) current->timeToSleep -= sleepTime - accumulated;
    8000167c:	00078a63          	beqz	a5,80001690 <_ZN9Scheduler10putToSleepEP3TCBm+0x7c>
    80001680:	40b686b3          	sub	a3,a3,a1
    80001684:	0407b703          	ld	a4,64(a5)
    80001688:	00d706b3          	add	a3,a4,a3
    8000168c:	04d7b023          	sd	a3,64(a5)
}
    80001690:	00813403          	ld	s0,8(sp)
    80001694:	01010113          	addi	sp,sp,16
    80001698:	00008067          	ret
		tcb->nextSleeping = sleepingHead;
    8000169c:	05053423          	sd	a6,72(a0)
		sleepingHead = tcb;
    800016a0:	00005797          	auipc	a5,0x5
    800016a4:	b0a7b823          	sd	a0,-1264(a5) # 800061b0 <_ZN9Scheduler12sleepingHeadE>
		tcb->timeToSleep = sleepTime;
    800016a8:	04b53023          	sd	a1,64(a0)
		tcb->nextSleeping->timeToSleep -= sleepTime;
    800016ac:	04083683          	ld	a3,64(a6)
    800016b0:	40b686b3          	sub	a3,a3,a1
    800016b4:	04d83023          	sd	a3,64(a6)
		return;
    800016b8:	fd9ff06f          	j	80001690 <_ZN9Scheduler10putToSleepEP3TCBm+0x7c>

00000000800016bc <_ZN9Scheduler4wakeEv>:

void Scheduler::wake() {
	if (!sleepingHead) return;
    800016bc:	00005797          	auipc	a5,0x5
    800016c0:	af47b783          	ld	a5,-1292(a5) # 800061b0 <_ZN9Scheduler12sleepingHeadE>
    800016c4:	06078a63          	beqz	a5,80001738 <_ZN9Scheduler4wakeEv+0x7c>
	sleepingHead->timeToSleep--;
    800016c8:	0407b703          	ld	a4,64(a5)
    800016cc:	fff70713          	addi	a4,a4,-1
    800016d0:	04e7b023          	sd	a4,64(a5)
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    800016d4:	00005517          	auipc	a0,0x5
    800016d8:	adc53503          	ld	a0,-1316(a0) # 800061b0 <_ZN9Scheduler12sleepingHeadE>
    800016dc:	04050e63          	beqz	a0,80001738 <_ZN9Scheduler4wakeEv+0x7c>
    800016e0:	04053783          	ld	a5,64(a0)
    800016e4:	04079a63          	bnez	a5,80001738 <_ZN9Scheduler4wakeEv+0x7c>
void Scheduler::wake() {
    800016e8:	ff010113          	addi	sp,sp,-16
    800016ec:	00113423          	sd	ra,8(sp)
    800016f0:	00813023          	sd	s0,0(sp)
    800016f4:	01010413          	addi	s0,sp,16
    800016f8:	00c0006f          	j	80001704 <_ZN9Scheduler4wakeEv+0x48>
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    800016fc:	04053783          	ld	a5,64(a0)
    80001700:	02079463          	bnez	a5,80001728 <_ZN9Scheduler4wakeEv+0x6c>
		TCB* thread = sleepingHead;
		sleepingHead = sleepingHead->nextSleeping;
    80001704:	04853783          	ld	a5,72(a0)
    80001708:	00005717          	auipc	a4,0x5
    8000170c:	aaf73423          	sd	a5,-1368(a4) # 800061b0 <_ZN9Scheduler12sleepingHeadE>
		thread->nextSleeping = nullptr;
    80001710:	04053423          	sd	zero,72(a0)
		Scheduler::put(thread);
    80001714:	00000097          	auipc	ra,0x0
    80001718:	e7c080e7          	jalr	-388(ra) # 80001590 <_ZN9Scheduler3putEP3TCB>
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    8000171c:	00005517          	auipc	a0,0x5
    80001720:	a9453503          	ld	a0,-1388(a0) # 800061b0 <_ZN9Scheduler12sleepingHeadE>
    80001724:	fc051ce3          	bnez	a0,800016fc <_ZN9Scheduler4wakeEv+0x40>
	}
}
    80001728:	00813083          	ld	ra,8(sp)
    8000172c:	00013403          	ld	s0,0(sp)
    80001730:	01010113          	addi	sp,sp,16
    80001734:	00008067          	ret
    80001738:	00008067          	ret

000000008000173c <main>:
	}
}

#pragma GCC optimize("O0")

int main() {
    8000173c:	f9010113          	addi	sp,sp,-112
    80001740:	06113423          	sd	ra,104(sp)
    80001744:	06813023          	sd	s0,96(sp)
    80001748:	04913c23          	sd	s1,88(sp)
    8000174c:	07010413          	addi	s0,sp,112

	//zabrani prekide
	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    80001750:	00200513          	li	a0,2
    80001754:	00000097          	auipc	ra,0x0
    80001758:	5a0080e7          	jalr	1440(ra) # 80001cf4 <_ZN5Riscv10mc_sstatusEm>

	//postavi adresu prekidne rutine u stvec
	Riscv::w_stvec((uint64)&interruptHandler);
    8000175c:	00005797          	auipc	a5,0x5
    80001760:	9f47b783          	ld	a5,-1548(a5) # 80006150 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001764:	00078513          	mv	a0,a5
    80001768:	00000097          	auipc	ra,0x0
    8000176c:	554080e7          	jalr	1364(ra) # 80001cbc <_ZN5Riscv7w_stvecEm>
//	printInteger(*(lista->peekFirst()));
//	delete lista;
//	println("");

	//testiranje kreiranja niti
	thread_t glavnaNit = nullptr;
    80001770:	fa043823          	sd	zero,-80(s0)
	thread_t nit1 = nullptr;
    80001774:	fc043c23          	sd	zero,-40(s0)
	thread_t nit2 = nullptr;
    80001778:	fc043823          	sd	zero,-48(s0)
	thread_t nit3 = nullptr;
    8000177c:	fc043423          	sd	zero,-56(s0)
	thread_t idleNit = nullptr;
    80001780:	fa043423          	sd	zero,-88(s0)
	thread_create(&glavnaNit, nullptr, nullptr);
    80001784:	fb040793          	addi	a5,s0,-80
    80001788:	00000613          	li	a2,0
    8000178c:	00000593          	li	a1,0
    80001790:	00078513          	mv	a0,a5
    80001794:	00000097          	auipc	ra,0x0
    80001798:	bcc080e7          	jalr	-1076(ra) # 80001360 <_Z13thread_createPP3TCBPFvPvES2_>
	TCB::running = glavnaNit;
    8000179c:	fb043703          	ld	a4,-80(s0)
    800017a0:	00005797          	auipc	a5,0x5
    800017a4:	9a07b783          	ld	a5,-1632(a5) # 80006140 <_GLOBAL_OFFSET_TABLE_+0x20>
    800017a8:	00e7b023          	sd	a4,0(a5)
	uint64* arg = new uint64;
    800017ac:	00800513          	li	a0,8
    800017b0:	00001097          	auipc	ra,0x1
    800017b4:	b58080e7          	jalr	-1192(ra) # 80002308 <_Znwm>
    800017b8:	00050793          	mv	a5,a0
    800017bc:	fcf43023          	sd	a5,-64(s0)
	*arg = 666;
    800017c0:	fc043783          	ld	a5,-64(s0)
    800017c4:	29a00713          	li	a4,666
    800017c8:	00e7b023          	sd	a4,0(a5)
	ThreadQueue* q = new ThreadQueue();
    800017cc:	01000513          	li	a0,16
    800017d0:	00000097          	auipc	ra,0x0
    800017d4:	5ac080e7          	jalr	1452(ra) # 80001d7c <_ZN11ThreadQueuenwEm>
    800017d8:	00050493          	mv	s1,a0
    800017dc:	00048513          	mv	a0,s1
    800017e0:	00000097          	auipc	ra,0x0
    800017e4:	530080e7          	jalr	1328(ra) # 80001d10 <_ZN11ThreadQueueC1Ev>
    800017e8:	fa943c23          	sd	s1,-72(s0)
	q->putLast(nit3);
    800017ec:	fc843583          	ld	a1,-56(s0)
    800017f0:	fb843503          	ld	a0,-72(s0)
    800017f4:	00000097          	auipc	ra,0x0
    800017f8:	a30080e7          	jalr	-1488(ra) # 80001224 <_ZN11ThreadQueue7putLastEP3TCB>
	q->putLast(nit2);
    800017fc:	fd043583          	ld	a1,-48(s0)
    80001800:	fb843503          	ld	a0,-72(s0)
    80001804:	00000097          	auipc	ra,0x0
    80001808:	a20080e7          	jalr	-1504(ra) # 80001224 <_ZN11ThreadQueue7putLastEP3TCB>
	q->putLast(nit1);
    8000180c:	fd843583          	ld	a1,-40(s0)
    80001810:	fb843503          	ld	a0,-72(s0)
    80001814:	00000097          	auipc	ra,0x0
    80001818:	a10080e7          	jalr	-1520(ra) # 80001224 <_ZN11ThreadQueue7putLastEP3TCB>
	thread_t nitred3 = q->getFirst();
    8000181c:	fb843503          	ld	a0,-72(s0)
    80001820:	00000097          	auipc	ra,0x0
    80001824:	a70080e7          	jalr	-1424(ra) # 80001290 <_ZN11ThreadQueue8getFirstEv>
    80001828:	00050793          	mv	a5,a0
    8000182c:	faf43023          	sd	a5,-96(s0)
	thread_t nitred2 = q->getFirst();
    80001830:	fb843503          	ld	a0,-72(s0)
    80001834:	00000097          	auipc	ra,0x0
    80001838:	a5c080e7          	jalr	-1444(ra) # 80001290 <_ZN11ThreadQueue8getFirstEv>
    8000183c:	00050793          	mv	a5,a0
    80001840:	f8f43c23          	sd	a5,-104(s0)
	thread_t nitred1 = q->getFirst();
    80001844:	fb843503          	ld	a0,-72(s0)
    80001848:	00000097          	auipc	ra,0x0
    8000184c:	a48080e7          	jalr	-1464(ra) # 80001290 <_ZN11ThreadQueue8getFirstEv>
    80001850:	00050793          	mv	a5,a0
    80001854:	f8f43823          	sd	a5,-112(s0)
	thread_create(&idleNit, idle, nullptr);
    80001858:	fa840793          	addi	a5,s0,-88
    8000185c:	00000613          	li	a2,0
    80001860:	00000597          	auipc	a1,0x0
    80001864:	44058593          	addi	a1,a1,1088 # 80001ca0 <_Z4idlePv>
    80001868:	00078513          	mv	a0,a5
    8000186c:	00000097          	auipc	ra,0x0
    80001870:	af4080e7          	jalr	-1292(ra) # 80001360 <_Z13thread_createPP3TCBPFvPvES2_>
	thread_create(&nitred1, nit1f, nullptr);
    80001874:	f9040793          	addi	a5,s0,-112
    80001878:	00000613          	li	a2,0
    8000187c:	00000597          	auipc	a1,0x0
    80001880:	16458593          	addi	a1,a1,356 # 800019e0 <_Z5nit1fPv>
    80001884:	00078513          	mv	a0,a5
    80001888:	00000097          	auipc	ra,0x0
    8000188c:	ad8080e7          	jalr	-1320(ra) # 80001360 <_Z13thread_createPP3TCBPFvPvES2_>
	thread_create(&nitred2, nit2f, arg);
    80001890:	f9840793          	addi	a5,s0,-104
    80001894:	fc043603          	ld	a2,-64(s0)
    80001898:	00000597          	auipc	a1,0x0
    8000189c:	27058593          	addi	a1,a1,624 # 80001b08 <_Z5nit2fPv>
    800018a0:	00078513          	mv	a0,a5
    800018a4:	00000097          	auipc	ra,0x0
    800018a8:	abc080e7          	jalr	-1348(ra) # 80001360 <_Z13thread_createPP3TCBPFvPvES2_>
	thread_create(&nitred3, nit3f, nullptr);
    800018ac:	fa040793          	addi	a5,s0,-96
    800018b0:	00000613          	li	a2,0
    800018b4:	00000597          	auipc	a1,0x0
    800018b8:	0b858593          	addi	a1,a1,184 # 8000196c <_Z5nit3fPv>
    800018bc:	00078513          	mv	a0,a5
    800018c0:	00000097          	auipc	ra,0x0
    800018c4:	aa0080e7          	jalr	-1376(ra) # 80001360 <_Z13thread_createPP3TCBPFvPvES2_>

	//omoguci prekide
	Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    800018c8:	00200513          	li	a0,2
    800018cc:	00000097          	auipc	ra,0x0
    800018d0:	40c080e7          	jalr	1036(ra) # 80001cd8 <_ZN5Riscv10ms_sstatusEm>

//	while (!nitred1->isFinished() || !nitred2->isFinished()) {
//		thread_dispatch();
//	}
	thread_join(nitred1);
    800018d4:	f9043783          	ld	a5,-112(s0)
    800018d8:	00078513          	mv	a0,a5
    800018dc:	00000097          	auipc	ra,0x0
    800018e0:	b4c080e7          	jalr	-1204(ra) # 80001428 <_Z11thread_joinP3TCB>
	thread_join(nitred2);
    800018e4:	f9843783          	ld	a5,-104(s0)
    800018e8:	00078513          	mv	a0,a5
    800018ec:	00000097          	auipc	ra,0x0
    800018f0:	b3c080e7          	jalr	-1220(ra) # 80001428 <_Z11thread_joinP3TCB>
	thread_join(nitred3);
    800018f4:	fa043783          	ld	a5,-96(s0)
    800018f8:	00078513          	mv	a0,a5
    800018fc:	00000097          	auipc	ra,0x0
    80001900:	b2c080e7          	jalr	-1236(ra) # 80001428 <_Z11thread_joinP3TCB>

	printString("\nProsao while\n");
    80001904:	00003517          	auipc	a0,0x3
    80001908:	71c50513          	addi	a0,a0,1820 # 80005020 <CONSOLE_STATUS+0x10>
    8000190c:	00000097          	auipc	ra,0x0
    80001910:	c34080e7          	jalr	-972(ra) # 80001540 <_Z11printStringPKc>
	delete q;
    80001914:	fb843483          	ld	s1,-72(s0)
    80001918:	00048e63          	beqz	s1,80001934 <main+0x1f8>
    8000191c:	00048513          	mv	a0,s1
    80001920:	00000097          	auipc	ra,0x0
    80001924:	410080e7          	jalr	1040(ra) # 80001d30 <_ZN11ThreadQueueD1Ev>
    80001928:	00048513          	mv	a0,s1
    8000192c:	00000097          	auipc	ra,0x0
    80001930:	478080e7          	jalr	1144(ra) # 80001da4 <_ZN11ThreadQueuedlEPv>
	//zabrani prekide
	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    80001934:	00200513          	li	a0,2
    80001938:	00000097          	auipc	ra,0x0
    8000193c:	3bc080e7          	jalr	956(ra) # 80001cf4 <_ZN5Riscv10mc_sstatusEm>
	printString("\nSad cu da izadjem\n");
    80001940:	00003517          	auipc	a0,0x3
    80001944:	6f050513          	addi	a0,a0,1776 # 80005030 <CONSOLE_STATUS+0x20>
    80001948:	00000097          	auipc	ra,0x0
    8000194c:	bf8080e7          	jalr	-1032(ra) # 80001540 <_Z11printStringPKc>
//	thread_create(&userHandle, (TCB::Body)userMain, nullptr);
//	while (!userHandle->isFinished()) {
//		thread_dispatch();
//	}
//	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
	return 0;
    80001950:	00000793          	li	a5,0
    80001954:	00078513          	mv	a0,a5
    80001958:	06813083          	ld	ra,104(sp)
    8000195c:	06013403          	ld	s0,96(sp)
    80001960:	05813483          	ld	s1,88(sp)
    80001964:	07010113          	addi	sp,sp,112
    80001968:	00008067          	ret

000000008000196c <_Z5nit3fPv>:
void nit3f(void*) {
    8000196c:	fe010113          	addi	sp,sp,-32
    80001970:	00113c23          	sd	ra,24(sp)
    80001974:	00813823          	sd	s0,16(sp)
    80001978:	00913423          	sd	s1,8(sp)
    8000197c:	02010413          	addi	s0,sp,32
	for (int i = 0; i < 20; i++) {
    80001980:	00000493          	li	s1,0
    80001984:	0300006f          	j	800019b4 <_Z5nit3fPv+0x48>
		printInteger(i);
    80001988:	00048513          	mv	a0,s1
    8000198c:	00000097          	auipc	ra,0x0
    80001990:	bdc080e7          	jalr	-1060(ra) # 80001568 <_Z12printIntegerm>
		printString("\n");
    80001994:	00003517          	auipc	a0,0x3
    80001998:	6b450513          	addi	a0,a0,1716 # 80005048 <CONSOLE_STATUS+0x38>
    8000199c:	00000097          	auipc	ra,0x0
    800019a0:	ba4080e7          	jalr	-1116(ra) # 80001540 <_Z11printStringPKc>
		time_sleep(10);
    800019a4:	00a00513          	li	a0,10
    800019a8:	00000097          	auipc	ra,0x0
    800019ac:	aa8080e7          	jalr	-1368(ra) # 80001450 <_Z10time_sleepm>
	for (int i = 0; i < 20; i++) {
    800019b0:	0014849b          	addiw	s1,s1,1
    800019b4:	01300793          	li	a5,19
    800019b8:	fc97d8e3          	bge	a5,s1,80001988 <_Z5nit3fPv+0x1c>
	printString("\nGotova nit3\n");
    800019bc:	00003517          	auipc	a0,0x3
    800019c0:	69450513          	addi	a0,a0,1684 # 80005050 <CONSOLE_STATUS+0x40>
    800019c4:	00000097          	auipc	ra,0x0
    800019c8:	b7c080e7          	jalr	-1156(ra) # 80001540 <_Z11printStringPKc>
}
    800019cc:	01813083          	ld	ra,24(sp)
    800019d0:	01013403          	ld	s0,16(sp)
    800019d4:	00813483          	ld	s1,8(sp)
    800019d8:	02010113          	addi	sp,sp,32
    800019dc:	00008067          	ret

00000000800019e0 <_Z5nit1fPv>:
void nit1f(void*) {
    800019e0:	fd010113          	addi	sp,sp,-48
    800019e4:	02113423          	sd	ra,40(sp)
    800019e8:	02813023          	sd	s0,32(sp)
    800019ec:	00913c23          	sd	s1,24(sp)
    800019f0:	03010413          	addi	s0,sp,48
	for (int i = 0; i < 8; i++) {
    800019f4:	00000493          	li	s1,0
    800019f8:	00700793          	li	a5,7
    800019fc:	0297ca63          	blt	a5,s1,80001a30 <_Z5nit1fPv+0x50>
		printInteger(5);
    80001a00:	00500513          	li	a0,5
    80001a04:	00000097          	auipc	ra,0x0
    80001a08:	b64080e7          	jalr	-1180(ra) # 80001568 <_Z12printIntegerm>
		printString("\n");
    80001a0c:	00003517          	auipc	a0,0x3
    80001a10:	63c50513          	addi	a0,a0,1596 # 80005048 <CONSOLE_STATUS+0x38>
    80001a14:	00000097          	auipc	ra,0x0
    80001a18:	b2c080e7          	jalr	-1236(ra) # 80001540 <_Z11printStringPKc>
		time_sleep(50);
    80001a1c:	03200513          	li	a0,50
    80001a20:	00000097          	auipc	ra,0x0
    80001a24:	a30080e7          	jalr	-1488(ra) # 80001450 <_Z10time_sleepm>
	for (int i = 0; i < 8; i++) {
    80001a28:	0014849b          	addiw	s1,s1,1
    80001a2c:	fcdff06f          	j	800019f8 <_Z5nit1fPv+0x18>
	printString("\nKraj niti 1\n");
    80001a30:	00003517          	auipc	a0,0x3
    80001a34:	63050513          	addi	a0,a0,1584 # 80005060 <CONSOLE_STATUS+0x50>
    80001a38:	00000097          	auipc	ra,0x0
    80001a3c:	b08080e7          	jalr	-1272(ra) # 80001540 <_Z11printStringPKc>
	thread_exit();
    80001a40:	00000097          	auipc	ra,0x0
    80001a44:	9a0080e7          	jalr	-1632(ra) # 800013e0 <_Z11thread_exitv>
	printString("\nusao u nit 1\n");
    80001a48:	00003517          	auipc	a0,0x3
    80001a4c:	62850513          	addi	a0,a0,1576 # 80005070 <CONSOLE_STATUS+0x60>
    80001a50:	00000097          	auipc	ra,0x0
    80001a54:	af0080e7          	jalr	-1296(ra) # 80001540 <_Z11printStringPKc>
	__asm__ volatile("li t1, 100");
    80001a58:	06400313          	li	t1,100
	__asm__ volatile("mv %0, t1":"=r"(t1));
    80001a5c:	00030793          	mv	a5,t1
    80001a60:	fcf43c23          	sd	a5,-40(s0)
	printString("\nopet u niti 1\n");
    80001a64:	00003517          	auipc	a0,0x3
    80001a68:	61c50513          	addi	a0,a0,1564 # 80005080 <CONSOLE_STATUS+0x70>
    80001a6c:	00000097          	auipc	ra,0x0
    80001a70:	ad4080e7          	jalr	-1324(ra) # 80001540 <_Z11printStringPKc>
	printString("\nt1 = ");
    80001a74:	00003517          	auipc	a0,0x3
    80001a78:	61c50513          	addi	a0,a0,1564 # 80005090 <CONSOLE_STATUS+0x80>
    80001a7c:	00000097          	auipc	ra,0x0
    80001a80:	ac4080e7          	jalr	-1340(ra) # 80001540 <_Z11printStringPKc>
	printInteger(t1);
    80001a84:	fd843503          	ld	a0,-40(s0)
    80001a88:	00000097          	auipc	ra,0x0
    80001a8c:	ae0080e7          	jalr	-1312(ra) # 80001568 <_Z12printIntegerm>
	for (int i = 0; i < 1000000; i++) {
    80001a90:	00000493          	li	s1,0
    80001a94:	0340006f          	j	80001ac8 <_Z5nit1fPv+0xe8>
			printString("Nit1: ");
    80001a98:	00003517          	auipc	a0,0x3
    80001a9c:	60050513          	addi	a0,a0,1536 # 80005098 <CONSOLE_STATUS+0x88>
    80001aa0:	00000097          	auipc	ra,0x0
    80001aa4:	aa0080e7          	jalr	-1376(ra) # 80001540 <_Z11printStringPKc>
			printInteger(i);
    80001aa8:	00048513          	mv	a0,s1
    80001aac:	00000097          	auipc	ra,0x0
    80001ab0:	abc080e7          	jalr	-1348(ra) # 80001568 <_Z12printIntegerm>
			printString("\n");
    80001ab4:	00003517          	auipc	a0,0x3
    80001ab8:	59450513          	addi	a0,a0,1428 # 80005048 <CONSOLE_STATUS+0x38>
    80001abc:	00000097          	auipc	ra,0x0
    80001ac0:	a84080e7          	jalr	-1404(ra) # 80001540 <_Z11printStringPKc>
	for (int i = 0; i < 1000000; i++) {
    80001ac4:	0014849b          	addiw	s1,s1,1
    80001ac8:	000f47b7          	lui	a5,0xf4
    80001acc:	23f78793          	addi	a5,a5,575 # f423f <_entry-0x7ff0bdc1>
    80001ad0:	0097ca63          	blt	a5,s1,80001ae4 <_Z5nit1fPv+0x104>
		if (i % 1200 == 0) {
    80001ad4:	4b000793          	li	a5,1200
    80001ad8:	02f4e7bb          	remw	a5,s1,a5
    80001adc:	fe0794e3          	bnez	a5,80001ac4 <_Z5nit1fPv+0xe4>
    80001ae0:	fb9ff06f          	j	80001a98 <_Z5nit1fPv+0xb8>
	printString("\nGotova nit 1\n");
    80001ae4:	00003517          	auipc	a0,0x3
    80001ae8:	5bc50513          	addi	a0,a0,1468 # 800050a0 <CONSOLE_STATUS+0x90>
    80001aec:	00000097          	auipc	ra,0x0
    80001af0:	a54080e7          	jalr	-1452(ra) # 80001540 <_Z11printStringPKc>
}
    80001af4:	02813083          	ld	ra,40(sp)
    80001af8:	02013403          	ld	s0,32(sp)
    80001afc:	01813483          	ld	s1,24(sp)
    80001b00:	03010113          	addi	sp,sp,48
    80001b04:	00008067          	ret

0000000080001b08 <_Z5nit2fPv>:
void nit2f(void* arg2) {
    80001b08:	fd010113          	addi	sp,sp,-48
    80001b0c:	02113423          	sd	ra,40(sp)
    80001b10:	02813023          	sd	s0,32(sp)
    80001b14:	00913c23          	sd	s1,24(sp)
    80001b18:	01213823          	sd	s2,16(sp)
    80001b1c:	03010413          	addi	s0,sp,48
    80001b20:	00050913          	mv	s2,a0
	for (int i = 0; i < 10; i++) {
    80001b24:	00000493          	li	s1,0
    80001b28:	00900793          	li	a5,9
    80001b2c:	0297ca63          	blt	a5,s1,80001b60 <_Z5nit2fPv+0x58>
		printInteger(3);
    80001b30:	00300513          	li	a0,3
    80001b34:	00000097          	auipc	ra,0x0
    80001b38:	a34080e7          	jalr	-1484(ra) # 80001568 <_Z12printIntegerm>
		printString("\n");
    80001b3c:	00003517          	auipc	a0,0x3
    80001b40:	50c50513          	addi	a0,a0,1292 # 80005048 <CONSOLE_STATUS+0x38>
    80001b44:	00000097          	auipc	ra,0x0
    80001b48:	9fc080e7          	jalr	-1540(ra) # 80001540 <_Z11printStringPKc>
		time_sleep(30);
    80001b4c:	01e00513          	li	a0,30
    80001b50:	00000097          	auipc	ra,0x0
    80001b54:	900080e7          	jalr	-1792(ra) # 80001450 <_Z10time_sleepm>
	for (int i = 0; i < 10; i++) {
    80001b58:	0014849b          	addiw	s1,s1,1
    80001b5c:	fcdff06f          	j	80001b28 <_Z5nit2fPv+0x20>
	printString("\nKraj niti 2\n");
    80001b60:	00003517          	auipc	a0,0x3
    80001b64:	55050513          	addi	a0,a0,1360 # 800050b0 <CONSOLE_STATUS+0xa0>
    80001b68:	00000097          	auipc	ra,0x0
    80001b6c:	9d8080e7          	jalr	-1576(ra) # 80001540 <_Z11printStringPKc>
	thread_exit();
    80001b70:	00000097          	auipc	ra,0x0
    80001b74:	870080e7          	jalr	-1936(ra) # 800013e0 <_Z11thread_exitv>
	printString("\nusao u nit 2\n");
    80001b78:	00003517          	auipc	a0,0x3
    80001b7c:	54850513          	addi	a0,a0,1352 # 800050c0 <CONSOLE_STATUS+0xb0>
    80001b80:	00000097          	auipc	ra,0x0
    80001b84:	9c0080e7          	jalr	-1600(ra) # 80001540 <_Z11printStringPKc>
	printInteger(*(uint64*)arg2);
    80001b88:	00093503          	ld	a0,0(s2)
    80001b8c:	00000097          	auipc	ra,0x0
    80001b90:	9dc080e7          	jalr	-1572(ra) # 80001568 <_Z12printIntegerm>
	*(uint64*)arg2 += 10;
    80001b94:	00093783          	ld	a5,0(s2)
    80001b98:	00a78793          	addi	a5,a5,10
    80001b9c:	00f93023          	sd	a5,0(s2)
	__asm__ volatile("li t1, 200");
    80001ba0:	0c800313          	li	t1,200
	__asm__ volatile("mv %0, t1":"=r"(t1));
    80001ba4:	00030793          	mv	a5,t1
    80001ba8:	fcf43c23          	sd	a5,-40(s0)
	printString("\nopet u niti 2\n");
    80001bac:	00003517          	auipc	a0,0x3
    80001bb0:	52450513          	addi	a0,a0,1316 # 800050d0 <CONSOLE_STATUS+0xc0>
    80001bb4:	00000097          	auipc	ra,0x0
    80001bb8:	98c080e7          	jalr	-1652(ra) # 80001540 <_Z11printStringPKc>
	printString("\nt1 = ");
    80001bbc:	00003517          	auipc	a0,0x3
    80001bc0:	4d450513          	addi	a0,a0,1236 # 80005090 <CONSOLE_STATUS+0x80>
    80001bc4:	00000097          	auipc	ra,0x0
    80001bc8:	97c080e7          	jalr	-1668(ra) # 80001540 <_Z11printStringPKc>
	printInteger(t1);
    80001bcc:	fd843503          	ld	a0,-40(s0)
    80001bd0:	00000097          	auipc	ra,0x0
    80001bd4:	998080e7          	jalr	-1640(ra) # 80001568 <_Z12printIntegerm>
	printString("\n");
    80001bd8:	00003517          	auipc	a0,0x3
    80001bdc:	47050513          	addi	a0,a0,1136 # 80005048 <CONSOLE_STATUS+0x38>
    80001be0:	00000097          	auipc	ra,0x0
    80001be4:	960080e7          	jalr	-1696(ra) # 80001540 <_Z11printStringPKc>
	for (int i = 0; i < 1000000; i++) {
    80001be8:	00000493          	li	s1,0
    80001bec:	0400006f          	j	80001c2c <_Z5nit2fPv+0x124>
			printString("Nit2: ");
    80001bf0:	00003517          	auipc	a0,0x3
    80001bf4:	4f050513          	addi	a0,a0,1264 # 800050e0 <CONSOLE_STATUS+0xd0>
    80001bf8:	00000097          	auipc	ra,0x0
    80001bfc:	948080e7          	jalr	-1720(ra) # 80001540 <_Z11printStringPKc>
			printInteger(i);
    80001c00:	00048513          	mv	a0,s1
    80001c04:	00000097          	auipc	ra,0x0
    80001c08:	964080e7          	jalr	-1692(ra) # 80001568 <_Z12printIntegerm>
			printString("\n");
    80001c0c:	00003517          	auipc	a0,0x3
    80001c10:	43c50513          	addi	a0,a0,1084 # 80005048 <CONSOLE_STATUS+0x38>
    80001c14:	00000097          	auipc	ra,0x0
    80001c18:	92c080e7          	jalr	-1748(ra) # 80001540 <_Z11printStringPKc>
			time_sleep(20);
    80001c1c:	01400513          	li	a0,20
    80001c20:	00000097          	auipc	ra,0x0
    80001c24:	830080e7          	jalr	-2000(ra) # 80001450 <_Z10time_sleepm>
	for (int i = 0; i < 1000000; i++) {
    80001c28:	0014849b          	addiw	s1,s1,1
    80001c2c:	000f47b7          	lui	a5,0xf4
    80001c30:	23f78793          	addi	a5,a5,575 # f423f <_entry-0x7ff0bdc1>
    80001c34:	0097cc63          	blt	a5,s1,80001c4c <_Z5nit2fPv+0x144>
		if (i % 100000 == 0) {
    80001c38:	000187b7          	lui	a5,0x18
    80001c3c:	6a07879b          	addiw	a5,a5,1696
    80001c40:	02f4e7bb          	remw	a5,s1,a5
    80001c44:	fe0792e3          	bnez	a5,80001c28 <_Z5nit2fPv+0x120>
    80001c48:	fa9ff06f          	j	80001bf0 <_Z5nit2fPv+0xe8>
	printString("\nPokusavam da ugasim nit 2\n");
    80001c4c:	00003517          	auipc	a0,0x3
    80001c50:	49c50513          	addi	a0,a0,1180 # 800050e8 <CONSOLE_STATUS+0xd8>
    80001c54:	00000097          	auipc	ra,0x0
    80001c58:	8ec080e7          	jalr	-1812(ra) # 80001540 <_Z11printStringPKc>
	printString("\nNisam uspeo da ugasim nit 2\n");
    80001c5c:	00003517          	auipc	a0,0x3
    80001c60:	4ac50513          	addi	a0,a0,1196 # 80005108 <CONSOLE_STATUS+0xf8>
    80001c64:	00000097          	auipc	ra,0x0
    80001c68:	8dc080e7          	jalr	-1828(ra) # 80001540 <_Z11printStringPKc>
	printInteger(*(uint64*)arg2);
    80001c6c:	00093503          	ld	a0,0(s2)
    80001c70:	00000097          	auipc	ra,0x0
    80001c74:	8f8080e7          	jalr	-1800(ra) # 80001568 <_Z12printIntegerm>
	printString("\nGotova nit 2\n");
    80001c78:	00003517          	auipc	a0,0x3
    80001c7c:	4b050513          	addi	a0,a0,1200 # 80005128 <CONSOLE_STATUS+0x118>
    80001c80:	00000097          	auipc	ra,0x0
    80001c84:	8c0080e7          	jalr	-1856(ra) # 80001540 <_Z11printStringPKc>
}
    80001c88:	02813083          	ld	ra,40(sp)
    80001c8c:	02013403          	ld	s0,32(sp)
    80001c90:	01813483          	ld	s1,24(sp)
    80001c94:	01013903          	ld	s2,16(sp)
    80001c98:	03010113          	addi	sp,sp,48
    80001c9c:	00008067          	ret

0000000080001ca0 <_Z4idlePv>:
void idle(void*){
    80001ca0:	ff010113          	addi	sp,sp,-16
    80001ca4:	00113423          	sd	ra,8(sp)
    80001ca8:	00813023          	sd	s0,0(sp)
    80001cac:	01010413          	addi	s0,sp,16
		thread_dispatch();
    80001cb0:	fffff097          	auipc	ra,0xfffff
    80001cb4:	758080e7          	jalr	1880(ra) # 80001408 <_Z15thread_dispatchv>
	while(true){
    80001cb8:	ff9ff06f          	j	80001cb0 <_Z4idlePv+0x10>

0000000080001cbc <_ZN5Riscv7w_stvecEm>:
	uint64 volatile stvec;
	__asm__ volatile("csrr %[stvec], stvec": [stvec] "=r"(stvec));
	return stvec;
}

inline void Riscv::w_stvec(uint64 stvec) {
    80001cbc:	ff010113          	addi	sp,sp,-16
    80001cc0:	00813423          	sd	s0,8(sp)
    80001cc4:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw stvec, %[stvec]": :[stvec] "r"(stvec));
    80001cc8:	10551073          	csrw	stvec,a0
}
    80001ccc:	00813403          	ld	s0,8(sp)
    80001cd0:	01010113          	addi	sp,sp,16
    80001cd4:	00008067          	ret

0000000080001cd8 <_ZN5Riscv10ms_sstatusEm>:

inline void Riscv::w_sip(uint64 sip) {
	__asm__ volatile("csrw sip, %[sip]": :[sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
    80001cd8:	ff010113          	addi	sp,sp,-16
    80001cdc:	00813423          	sd	s0,8(sp)
    80001ce0:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80001ce4:	10052073          	csrs	sstatus,a0
}
    80001ce8:	00813403          	ld	s0,8(sp)
    80001cec:	01010113          	addi	sp,sp,16
    80001cf0:	00008067          	ret

0000000080001cf4 <_ZN5Riscv10mc_sstatusEm>:

inline void Riscv::mc_sstatus(uint64 mask) {
    80001cf4:	ff010113          	addi	sp,sp,-16
    80001cf8:	00813423          	sd	s0,8(sp)
    80001cfc:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80001d00:	10053073          	csrc	sstatus,a0
}
    80001d04:	00813403          	ld	s0,8(sp)
    80001d08:	01010113          	addi	sp,sp,16
    80001d0c:	00008067          	ret

0000000080001d10 <_ZN11ThreadQueueC1Ev>:

	Node* front;
	Node* back;

public:
	ThreadQueue() : front(nullptr), back(nullptr) {}
    80001d10:	ff010113          	addi	sp,sp,-16
    80001d14:	00813423          	sd	s0,8(sp)
    80001d18:	01010413          	addi	s0,sp,16
    80001d1c:	00053023          	sd	zero,0(a0)
    80001d20:	00053423          	sd	zero,8(a0)
    80001d24:	00813403          	ld	s0,8(sp)
    80001d28:	01010113          	addi	sp,sp,16
    80001d2c:	00008067          	ret

0000000080001d30 <_ZN11ThreadQueueD1Ev>:

	ThreadQueue(const ThreadQueue&) = delete;

	ThreadQueue& operator=(const ThreadQueue&) = delete;

	~ThreadQueue() {
    80001d30:	fe010113          	addi	sp,sp,-32
    80001d34:	00113c23          	sd	ra,24(sp)
    80001d38:	00813823          	sd	s0,16(sp)
    80001d3c:	00913423          	sd	s1,8(sp)
    80001d40:	02010413          	addi	s0,sp,32
    80001d44:	00050493          	mv	s1,a0
			delete node;
		}
	}

	bool isEmpty() const {
		return front == nullptr;
    80001d48:	0004b503          	ld	a0,0(s1)
		while (!isEmpty()) {
    80001d4c:	00050e63          	beqz	a0,80001d68 <_ZN11ThreadQueueD1Ev+0x38>
			front = front->next;
    80001d50:	00853783          	ld	a5,8(a0)
    80001d54:	00f4b023          	sd	a5,0(s1)
			delete node;
    80001d58:	fe0508e3          	beqz	a0,80001d48 <_ZN11ThreadQueueD1Ev+0x18>
			mem_free(ptr);
    80001d5c:	fffff097          	auipc	ra,0xfffff
    80001d60:	5d4080e7          	jalr	1492(ra) # 80001330 <_Z8mem_freePv>
		}
    80001d64:	fe5ff06f          	j	80001d48 <_ZN11ThreadQueueD1Ev+0x18>
	}
    80001d68:	01813083          	ld	ra,24(sp)
    80001d6c:	01013403          	ld	s0,16(sp)
    80001d70:	00813483          	ld	s1,8(sp)
    80001d74:	02010113          	addi	sp,sp,32
    80001d78:	00008067          	ret

0000000080001d7c <_ZN11ThreadQueuenwEm>:
	void putLast(TCB* tcb);

	TCB* getFirst();

	// Overriding new and delete operators for ThreadQueue
	static void* operator new(size_t size) {
    80001d7c:	ff010113          	addi	sp,sp,-16
    80001d80:	00113423          	sd	ra,8(sp)
    80001d84:	00813023          	sd	s0,0(sp)
    80001d88:	01010413          	addi	s0,sp,16
		return mem_alloc(size);
    80001d8c:	fffff097          	auipc	ra,0xfffff
    80001d90:	564080e7          	jalr	1380(ra) # 800012f0 <_Z9mem_allocm>
	}
    80001d94:	00813083          	ld	ra,8(sp)
    80001d98:	00013403          	ld	s0,0(sp)
    80001d9c:	01010113          	addi	sp,sp,16
    80001da0:	00008067          	ret

0000000080001da4 <_ZN11ThreadQueuedlEPv>:

	static void operator delete(void* ptr) {
    80001da4:	ff010113          	addi	sp,sp,-16
    80001da8:	00113423          	sd	ra,8(sp)
    80001dac:	00813023          	sd	s0,0(sp)
    80001db0:	01010413          	addi	s0,sp,16
		mem_free(ptr);
    80001db4:	fffff097          	auipc	ra,0xfffff
    80001db8:	57c080e7          	jalr	1404(ra) # 80001330 <_Z8mem_freePv>
	}
    80001dbc:	00813083          	ld	ra,8(sp)
    80001dc0:	00013403          	ld	s0,0(sp)
    80001dc4:	01010113          	addi	sp,sp,16
    80001dc8:	00008067          	ret

0000000080001dcc <interruptRoutine>:
#include "../h/syscall_c.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

#pragma GCC optimize("O0")
extern "C" void interruptRoutine() {
    80001dcc:	f2010113          	addi	sp,sp,-224
    80001dd0:	0c113c23          	sd	ra,216(sp)
    80001dd4:	0c813823          	sd	s0,208(sp)
    80001dd8:	0e010413          	addi	s0,sp,224
	uint64 scause, sepc, sstatus;
	__asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001ddc:	14202373          	csrr	t1,scause
    80001de0:	fc643c23          	sd	t1,-40(s0)
	__asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001de4:	14102373          	csrr	t1,sepc
    80001de8:	fc643823          	sd	t1,-48(s0)
	__asm__ volatile("csrr %[status], sstatus":[status] "=r"(
			sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001dec:	10002373          	csrr	t1,sstatus
    80001df0:	fc643423          	sd	t1,-56(s0)
	uint64 a0, a1, a2, a3, a4, a5, a6, a7;
	__asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001df4:	00050313          	mv	t1,a0
    80001df8:	fc643023          	sd	t1,-64(s0)
	__asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001dfc:	00058313          	mv	t1,a1
    80001e00:	fa643c23          	sd	t1,-72(s0)
	__asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001e04:	00060313          	mv	t1,a2
    80001e08:	fa643823          	sd	t1,-80(s0)
	__asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001e0c:	00068313          	mv	t1,a3
    80001e10:	fa643423          	sd	t1,-88(s0)
	__asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001e14:	00070313          	mv	t1,a4
    80001e18:	fa643023          	sd	t1,-96(s0)
	__asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001e1c:	00078313          	mv	t1,a5
    80001e20:	f8643c23          	sd	t1,-104(s0)
	__asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001e24:	00080313          	mv	t1,a6
    80001e28:	f8643823          	sd	t1,-112(s0)
	__asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001e2c:	00088313          	mv	t1,a7
    80001e30:	f8643423          	sd	t1,-120(s0)

	if (scause == 0x09 || scause == 0x08) {
    80001e34:	fd843703          	ld	a4,-40(s0)
    80001e38:	00900793          	li	a5,9
    80001e3c:	00f70863          	beq	a4,a5,80001e4c <interruptRoutine+0x80>
    80001e40:	fd843703          	ld	a4,-40(s0)
    80001e44:	00800793          	li	a5,8
    80001e48:	32f71463          	bne	a4,a5,80002170 <interruptRoutine+0x3a4>
		//prekid zbog poziva ecall
		uint64 opCode = a0;
    80001e4c:	fc043783          	ld	a5,-64(s0)
    80001e50:	f8f43023          	sd	a5,-128(s0)
		switch (opCode) {
    80001e54:	f8043703          	ld	a4,-128(s0)
    80001e58:	09100793          	li	a5,145
    80001e5c:	1ef70a63          	beq	a4,a5,80002050 <interruptRoutine+0x284>
    80001e60:	f8043703          	ld	a4,-128(s0)
    80001e64:	09100793          	li	a5,145
    80001e68:	2ce7e863          	bltu	a5,a4,80002138 <interruptRoutine+0x36c>
    80001e6c:	f8043703          	ld	a4,-128(s0)
    80001e70:	04200793          	li	a5,66
    80001e74:	04e7e263          	bltu	a5,a4,80001eb8 <interruptRoutine+0xec>
    80001e78:	f8043783          	ld	a5,-128(s0)
    80001e7c:	2a078e63          	beqz	a5,80002138 <interruptRoutine+0x36c>
    80001e80:	f8043703          	ld	a4,-128(s0)
    80001e84:	04200793          	li	a5,66
    80001e88:	2ae7e863          	bltu	a5,a4,80002138 <interruptRoutine+0x36c>
    80001e8c:	f8043783          	ld	a5,-128(s0)
    80001e90:	00279713          	slli	a4,a5,0x2
    80001e94:	00003797          	auipc	a5,0x3
    80001e98:	2a478793          	addi	a5,a5,676 # 80005138 <CONSOLE_STATUS+0x128>
    80001e9c:	00f707b3          	add	a5,a4,a5
    80001ea0:	0007a783          	lw	a5,0(a5)
    80001ea4:	0007871b          	sext.w	a4,a5
    80001ea8:	00003797          	auipc	a5,0x3
    80001eac:	29078793          	addi	a5,a5,656 # 80005138 <CONSOLE_STATUS+0x128>
    80001eb0:	00f707b3          	add	a5,a4,a5
    80001eb4:	00078067          	jr	a5
    80001eb8:	f8043703          	ld	a4,-128(s0)
    80001ebc:	09000793          	li	a5,144
    80001ec0:	14f70c63          	beq	a4,a5,80002018 <interruptRoutine+0x24c>
//				printInteger(opCode);
//				printString("\nscause: ");
//				printInteger(scause);
//				printString("\nsepc: ");
//				printInteger(sepc);
				break;
    80001ec4:	2740006f          	j	80002138 <interruptRoutine+0x36c>
				size = (size_t)a1;
    80001ec8:	fb843783          	ld	a5,-72(s0)
    80001ecc:	f2f43823          	sd	a5,-208(s0)
				size = size * MEM_BLOCK_SIZE;
    80001ed0:	f3043783          	ld	a5,-208(s0)
    80001ed4:	00679793          	slli	a5,a5,0x6
    80001ed8:	f2f43823          	sd	a5,-208(s0)
				MemoryAllocator::kmalloc(size);
    80001edc:	f3043503          	ld	a0,-208(s0)
    80001ee0:	00001097          	auipc	ra,0x1
    80001ee4:	a48080e7          	jalr	-1464(ra) # 80002928 <_ZN15MemoryAllocator7kmallocEm>
				__asm__ volatile("sd a0, 80(s0)");
    80001ee8:	04a43823          	sd	a0,80(s0)
				break;
    80001eec:	2680006f          	j	80002154 <interruptRoutine+0x388>
				ptr = (void*)a1;
    80001ef0:	fb843783          	ld	a5,-72(s0)
    80001ef4:	f2f43c23          	sd	a5,-200(s0)
				MemoryAllocator::kfree(ptr);
    80001ef8:	f3843503          	ld	a0,-200(s0)
    80001efc:	00001097          	auipc	ra,0x1
    80001f00:	bd4080e7          	jalr	-1068(ra) # 80002ad0 <_ZN15MemoryAllocator5kfreeEPv>
				__asm__ volatile("sd a0, 80(s0)");
    80001f04:	04a43823          	sd	a0,80(s0)
				break;
    80001f08:	24c0006f          	j	80002154 <interruptRoutine+0x388>
				handle = (thread_t*)a1;
    80001f0c:	fb843783          	ld	a5,-72(s0)
    80001f10:	f4f43c23          	sd	a5,-168(s0)
				function = (void (*)(void*))a2;
    80001f14:	fb043783          	ld	a5,-80(s0)
    80001f18:	f4f43823          	sd	a5,-176(s0)
				args = (void*)a3;
    80001f1c:	fa843783          	ld	a5,-88(s0)
    80001f20:	f4f43423          	sd	a5,-184(s0)
				sp = (uint64*)a4;
    80001f24:	fa043783          	ld	a5,-96(s0)
    80001f28:	f4f43023          	sd	a5,-192(s0)
				*handle = TCB::createThread(function, args, sp);
    80001f2c:	f4043603          	ld	a2,-192(s0)
    80001f30:	f4843583          	ld	a1,-184(s0)
    80001f34:	f5043503          	ld	a0,-176(s0)
    80001f38:	00001097          	auipc	ra,0x1
    80001f3c:	830080e7          	jalr	-2000(ra) # 80002768 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80001f40:	00050713          	mv	a4,a0
    80001f44:	f5843783          	ld	a5,-168(s0)
    80001f48:	00e7b023          	sd	a4,0(a5)
				if (*handle != nullptr) {
    80001f4c:	f5843783          	ld	a5,-168(s0)
    80001f50:	0007b783          	ld	a5,0(a5)
    80001f54:	00078663          	beqz	a5,80001f60 <interruptRoutine+0x194>
					__asm__ volatile("li a0, 0");
    80001f58:	00000513          	li	a0,0
    80001f5c:	0080006f          	j	80001f64 <interruptRoutine+0x198>
					__asm__ volatile("li a0, -1");
    80001f60:	fff00513          	li	a0,-1
				__asm__ volatile("sd a0, 80(s0)");
    80001f64:	04a43823          	sd	a0,80(s0)
				break;
    80001f68:	1ec0006f          	j	80002154 <interruptRoutine+0x388>
				TCB::running->setFinished(true);
    80001f6c:	00004797          	auipc	a5,0x4
    80001f70:	1d47b783          	ld	a5,468(a5) # 80006140 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001f74:	0007b783          	ld	a5,0(a5)
    80001f78:	00100593          	li	a1,1
    80001f7c:	00078513          	mv	a0,a5
    80001f80:	00000097          	auipc	ra,0x0
    80001f84:	320080e7          	jalr	800(ra) # 800022a0 <_ZN3TCB11setFinishedEb>
				TCB::releaseJoined();
    80001f88:	00001097          	auipc	ra,0x1
    80001f8c:	924080e7          	jalr	-1756(ra) # 800028ac <_ZN3TCB13releaseJoinedEv>
				TCB::yield();
    80001f90:	00000097          	auipc	ra,0x0
    80001f94:	774080e7          	jalr	1908(ra) # 80002704 <_ZN3TCB5yieldEv>
				break;
    80001f98:	1bc0006f          	j	80002154 <interruptRoutine+0x388>
				TCB::yield();
    80001f9c:	00000097          	auipc	ra,0x0
    80001fa0:	768080e7          	jalr	1896(ra) # 80002704 <_ZN3TCB5yieldEv>
				break;
    80001fa4:	1b00006f          	j	80002154 <interruptRoutine+0x388>
				handleToJoin = (thread_t)a1;
    80001fa8:	fb843783          	ld	a5,-72(s0)
    80001fac:	f6f43023          	sd	a5,-160(s0)
				TCB::threadJoin(handleToJoin);
    80001fb0:	f6043503          	ld	a0,-160(s0)
    80001fb4:	00001097          	auipc	ra,0x1
    80001fb8:	8b0080e7          	jalr	-1872(ra) # 80002864 <_ZN3TCB10threadJoinEPS_>
				TCB::yield();
    80001fbc:	00000097          	auipc	ra,0x0
    80001fc0:	748080e7          	jalr	1864(ra) # 80002704 <_ZN3TCB5yieldEv>
				break;
    80001fc4:	1900006f          	j	80002154 <interruptRoutine+0x388>
				timerPeriods = (time_t)a1;
    80001fc8:	fb843783          	ld	a5,-72(s0)
    80001fcc:	f6f43423          	sd	a5,-152(s0)
				if (timerPeriods>0) {
    80001fd0:	f6843783          	ld	a5,-152(s0)
    80001fd4:	00078663          	beqz	a5,80001fe0 <interruptRoutine+0x214>
					__asm__ volatile("li a0, 0");
    80001fd8:	00000513          	li	a0,0
    80001fdc:	0080006f          	j	80001fe4 <interruptRoutine+0x218>
					__asm__ volatile("li a0, -1");
    80001fe0:	fff00513          	li	a0,-1
				__asm__ volatile("sd a0, 80(s0)");
    80001fe4:	04a43823          	sd	a0,80(s0)
				if(timerPeriods>0) {
    80001fe8:	f6843783          	ld	a5,-152(s0)
    80001fec:	14078a63          	beqz	a5,80002140 <interruptRoutine+0x374>
					Scheduler::putToSleep(TCB::running, timerPeriods);
    80001ff0:	00004797          	auipc	a5,0x4
    80001ff4:	1507b783          	ld	a5,336(a5) # 80006140 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001ff8:	0007b783          	ld	a5,0(a5)
    80001ffc:	f6843583          	ld	a1,-152(s0)
    80002000:	00078513          	mv	a0,a5
    80002004:	fffff097          	auipc	ra,0xfffff
    80002008:	610080e7          	jalr	1552(ra) # 80001614 <_ZN9Scheduler10putToSleepEP3TCBm>
					TCB::yield();
    8000200c:	00000097          	auipc	ra,0x0
    80002010:	6f8080e7          	jalr	1784(ra) # 80002704 <_ZN3TCB5yieldEv>
				break;
    80002014:	12c0006f          	j	80002140 <interruptRoutine+0x374>
				string = (const char*)a1;
    80002018:	fb843783          	ld	a5,-72(s0)
    8000201c:	fef43423          	sd	a5,-24(s0)
				while (*string != '\0') {
    80002020:	fe843783          	ld	a5,-24(s0)
    80002024:	0007c783          	lbu	a5,0(a5)
    80002028:	12078063          	beqz	a5,80002148 <interruptRoutine+0x37c>
					__putc(*string);
    8000202c:	fe843783          	ld	a5,-24(s0)
    80002030:	0007c783          	lbu	a5,0(a5)
    80002034:	00078513          	mv	a0,a5
    80002038:	00003097          	auipc	ra,0x3
    8000203c:	d54080e7          	jalr	-684(ra) # 80004d8c <__putc>
					string++;
    80002040:	fe843783          	ld	a5,-24(s0)
    80002044:	00178793          	addi	a5,a5,1
    80002048:	fef43423          	sd	a5,-24(s0)
				while (*string != '\0') {
    8000204c:	fd5ff06f          	j	80002020 <interruptRoutine+0x254>
				integer = a1;
    80002050:	fb843783          	ld	a5,-72(s0)
    80002054:	f6f43c23          	sd	a5,-136(s0)
				neg = 0;
    80002058:	f6042a23          	sw	zero,-140(s0)
					x = integer;
    8000205c:	f7843783          	ld	a5,-136(s0)
    80002060:	fef42023          	sw	a5,-32(s0)
				i = 0;
    80002064:	fe042223          	sw	zero,-28(s0)
					buf[i++] = digits[x % 10];
    80002068:	fe042703          	lw	a4,-32(s0)
    8000206c:	00a00793          	li	a5,10
    80002070:	02f777bb          	remuw	a5,a4,a5
    80002074:	0007861b          	sext.w	a2,a5
    80002078:	fe442783          	lw	a5,-28(s0)
    8000207c:	0017871b          	addiw	a4,a5,1
    80002080:	fee42223          	sw	a4,-28(s0)
    80002084:	00004697          	auipc	a3,0x4
    80002088:	01468693          	addi	a3,a3,20 # 80006098 <_ZZ16interruptRoutineE6digits>
    8000208c:	02061713          	slli	a4,a2,0x20
    80002090:	02075713          	srli	a4,a4,0x20
    80002094:	00e68733          	add	a4,a3,a4
    80002098:	00074703          	lbu	a4,0(a4)
    8000209c:	ff040693          	addi	a3,s0,-16
    800020a0:	00f687b3          	add	a5,a3,a5
    800020a4:	f2e78823          	sb	a4,-208(a5)
				} while ((x /= 10) != 0);
    800020a8:	fe042703          	lw	a4,-32(s0)
    800020ac:	00a00793          	li	a5,10
    800020b0:	02f757bb          	divuw	a5,a4,a5
    800020b4:	fef42023          	sw	a5,-32(s0)
    800020b8:	fe042783          	lw	a5,-32(s0)
    800020bc:	0007879b          	sext.w	a5,a5
    800020c0:	00f037b3          	snez	a5,a5
    800020c4:	0ff7f793          	andi	a5,a5,255
    800020c8:	00078463          	beqz	a5,800020d0 <interruptRoutine+0x304>
				do {
    800020cc:	f9dff06f          	j	80002068 <interruptRoutine+0x29c>
				if (neg) buf[i++] = '-';
    800020d0:	f7442783          	lw	a5,-140(s0)
    800020d4:	0007879b          	sext.w	a5,a5
    800020d8:	02078063          	beqz	a5,800020f8 <interruptRoutine+0x32c>
    800020dc:	fe442783          	lw	a5,-28(s0)
    800020e0:	0017871b          	addiw	a4,a5,1
    800020e4:	fee42223          	sw	a4,-28(s0)
    800020e8:	ff040713          	addi	a4,s0,-16
    800020ec:	00f707b3          	add	a5,a4,a5
    800020f0:	02d00713          	li	a4,45
    800020f4:	f2e78823          	sb	a4,-208(a5)
				while (--i >= 0) {
    800020f8:	fe442783          	lw	a5,-28(s0)
    800020fc:	fff7879b          	addiw	a5,a5,-1
    80002100:	fef42223          	sw	a5,-28(s0)
    80002104:	fe442783          	lw	a5,-28(s0)
    80002108:	fff7c793          	not	a5,a5
    8000210c:	01f7d79b          	srliw	a5,a5,0x1f
    80002110:	0ff7f793          	andi	a5,a5,255
    80002114:	02078e63          	beqz	a5,80002150 <interruptRoutine+0x384>
					__putc(buf[i]);
    80002118:	fe442783          	lw	a5,-28(s0)
    8000211c:	ff040713          	addi	a4,s0,-16
    80002120:	00f707b3          	add	a5,a4,a5
    80002124:	f307c783          	lbu	a5,-208(a5)
    80002128:	00078513          	mv	a0,a5
    8000212c:	00003097          	auipc	ra,0x3
    80002130:	c60080e7          	jalr	-928(ra) # 80004d8c <__putc>
				while (--i >= 0) {
    80002134:	fc5ff06f          	j	800020f8 <interruptRoutine+0x32c>
				break;
    80002138:	00000013          	nop
    8000213c:	0180006f          	j	80002154 <interruptRoutine+0x388>
				break;
    80002140:	00000013          	nop
    80002144:	0100006f          	j	80002154 <interruptRoutine+0x388>
				break;
    80002148:	00000013          	nop
    8000214c:	0080006f          	j	80002154 <interruptRoutine+0x388>
				break;
    80002150:	00000013          	nop
		}
		//sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
		//sepc += 4;
		__asm__ volatile("addi %[dst], %[src], 0x4":[dst]"=r"(sepc):[src]"r"(
				sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002154:	fd043303          	ld	t1,-48(s0)
    80002158:	00430313          	addi	t1,t1,4
    8000215c:	fc643823          	sd	t1,-48(s0)
		__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002160:	fd043303          	ld	t1,-48(s0)
    80002164:	14131073          	csrw	sepc,t1
    80002168:	00000013          	nop
//		printString("scause: ");
//		printInteger(scause);
//		printString("\nsepc: ");
//		printInteger(sepc);
	}
}
    8000216c:	0cc0006f          	j	80002238 <interruptRoutine+0x46c>
	} else if (scause == (1UL << 63 | 9)) {
    80002170:	fd843703          	ld	a4,-40(s0)
    80002174:	fff00793          	li	a5,-1
    80002178:	03f79793          	slli	a5,a5,0x3f
    8000217c:	00978793          	addi	a5,a5,9
    80002180:	00f71863          	bne	a4,a5,80002190 <interruptRoutine+0x3c4>
		console_handler();
    80002184:	00003097          	auipc	ra,0x3
    80002188:	c7c080e7          	jalr	-900(ra) # 80004e00 <console_handler>
}
    8000218c:	0ac0006f          	j	80002238 <interruptRoutine+0x46c>
	} else if (scause == (1UL << 63 | 1)) {
    80002190:	fd843703          	ld	a4,-40(s0)
    80002194:	fff00793          	li	a5,-1
    80002198:	03f79793          	slli	a5,a5,0x3f
    8000219c:	00178793          	addi	a5,a5,1
    800021a0:	08f71c63          	bne	a4,a5,80002238 <interruptRoutine+0x46c>
		Scheduler::wake();
    800021a4:	fffff097          	auipc	ra,0xfffff
    800021a8:	518080e7          	jalr	1304(ra) # 800016bc <_ZN9Scheduler4wakeEv>
		TCB::runningTimeSlice++;
    800021ac:	00004797          	auipc	a5,0x4
    800021b0:	f7c7b783          	ld	a5,-132(a5) # 80006128 <_GLOBAL_OFFSET_TABLE_+0x8>
    800021b4:	0007b783          	ld	a5,0(a5)
    800021b8:	00178713          	addi	a4,a5,1
    800021bc:	00004797          	auipc	a5,0x4
    800021c0:	f6c7b783          	ld	a5,-148(a5) # 80006128 <_GLOBAL_OFFSET_TABLE_+0x8>
    800021c4:	00e7b023          	sd	a4,0(a5)
		if (TCB::runningTimeSlice >= TCB::running->getTimeSlice()) {
    800021c8:	00004797          	auipc	a5,0x4
    800021cc:	f787b783          	ld	a5,-136(a5) # 80006140 <_GLOBAL_OFFSET_TABLE_+0x20>
    800021d0:	0007b783          	ld	a5,0(a5)
    800021d4:	00078513          	mv	a0,a5
    800021d8:	00000097          	auipc	ra,0x0
    800021dc:	0e4080e7          	jalr	228(ra) # 800022bc <_ZN3TCB12getTimeSliceEv>
    800021e0:	00050713          	mv	a4,a0
    800021e4:	00004797          	auipc	a5,0x4
    800021e8:	f447b783          	ld	a5,-188(a5) # 80006128 <_GLOBAL_OFFSET_TABLE_+0x8>
    800021ec:	0007b783          	ld	a5,0(a5)
    800021f0:	00e7b7b3          	sltu	a5,a5,a4
    800021f4:	0017c793          	xori	a5,a5,1
    800021f8:	0ff7f793          	andi	a5,a5,255
    800021fc:	00078c63          	beqz	a5,80002214 <interruptRoutine+0x448>
			TCB::yield();
    80002200:	00000097          	auipc	ra,0x0
    80002204:	504080e7          	jalr	1284(ra) # 80002704 <_ZN3TCB5yieldEv>
			TCB::runningTimeSlice = 0;
    80002208:	00004797          	auipc	a5,0x4
    8000220c:	f207b783          	ld	a5,-224(a5) # 80006128 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002210:	0007b023          	sd	zero,0(a5)
		Riscv::w_sepc(sepc);
    80002214:	fd043503          	ld	a0,-48(s0)
    80002218:	00000097          	auipc	ra,0x0
    8000221c:	034080e7          	jalr	52(ra) # 8000224c <_ZN5Riscv6w_sepcEm>
		Riscv::w_sstatus(sstatus);
    80002220:	fc843503          	ld	a0,-56(s0)
    80002224:	00000097          	auipc	ra,0x0
    80002228:	060080e7          	jalr	96(ra) # 80002284 <_ZN5Riscv9w_sstatusEm>
		Riscv::mc_sip(Riscv::SIP_SSIP);
    8000222c:	00200513          	li	a0,2
    80002230:	00000097          	auipc	ra,0x0
    80002234:	038080e7          	jalr	56(ra) # 80002268 <_ZN5Riscv6mc_sipEm>
}
    80002238:	00000013          	nop
    8000223c:	0d813083          	ld	ra,216(sp)
    80002240:	0d013403          	ld	s0,208(sp)
    80002244:	0e010113          	addi	sp,sp,224
    80002248:	00008067          	ret

000000008000224c <_ZN5Riscv6w_sepcEm>:
inline void Riscv::w_sepc(uint64 sepc) {
    8000224c:	ff010113          	addi	sp,sp,-16
    80002250:	00813423          	sd	s0,8(sp)
    80002254:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002258:	14151073          	csrw	sepc,a0
}
    8000225c:	00813403          	ld	s0,8(sp)
    80002260:	01010113          	addi	sp,sp,16
    80002264:	00008067          	ret

0000000080002268 <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    80002268:	ff010113          	addi	sp,sp,-16
    8000226c:	00813423          	sd	s0,8(sp)
    80002270:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    80002274:	14453073          	csrc	sip,a0
}
    80002278:	00813403          	ld	s0,8(sp)
    8000227c:	01010113          	addi	sp,sp,16
    80002280:	00008067          	ret

0000000080002284 <_ZN5Riscv9w_sstatusEm>:
	uint64 volatile sstatus;
	__asm__ volatile("csrr %[sstatus], sstatus": [sstatus] "=r"(sstatus));
	return sstatus;
}

inline void Riscv::w_sstatus(uint64 sstatus) {
    80002284:	ff010113          	addi	sp,sp,-16
    80002288:	00813423          	sd	s0,8(sp)
    8000228c:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw sstatus, %[sstatus]": :[sstatus] "r"(sstatus));
    80002290:	10051073          	csrw	sstatus,a0
}
    80002294:	00813403          	ld	s0,8(sp)
    80002298:	01010113          	addi	sp,sp,16
    8000229c:	00008067          	ret

00000000800022a0 <_ZN3TCB11setFinishedEb>:

	static TCB* createThread(Body function, void* args, uint64* stack);

	bool isFinished() { return finished; }

	void setFinished(bool finish) { this->finished = finish; }
    800022a0:	ff010113          	addi	sp,sp,-16
    800022a4:	00813423          	sd	s0,8(sp)
    800022a8:	01010413          	addi	s0,sp,16
    800022ac:	02b50823          	sb	a1,48(a0)
    800022b0:	00813403          	ld	s0,8(sp)
    800022b4:	01010113          	addi	sp,sp,16
    800022b8:	00008067          	ret

00000000800022bc <_ZN3TCB12getTimeSliceEv>:

	bool isBlocked() { return blocked; }

	void setBlocked(bool block) { this->blocked = block; }

	uint64 getTimeSlice() { return timeSlice; }
    800022bc:	ff010113          	addi	sp,sp,-16
    800022c0:	00813423          	sd	s0,8(sp)
    800022c4:	01010413          	addi	s0,sp,16
    800022c8:	02853503          	ld	a0,40(a0)
    800022cc:	00813403          	ld	s0,8(sp)
    800022d0:	01010113          	addi	sp,sp,16
    800022d4:	00008067          	ret

00000000800022d8 <_ZN6ThreadD1Ev>:

Thread::Thread(void (* body)(void*), void* arg) {

}

Thread::~Thread() {
    800022d8:	ff010113          	addi	sp,sp,-16
    800022dc:	00813423          	sd	s0,8(sp)
    800022e0:	01010413          	addi	s0,sp,16

}
    800022e4:	00813403          	ld	s0,8(sp)
    800022e8:	01010113          	addi	sp,sp,16
    800022ec:	00008067          	ret

00000000800022f0 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {

}

Semaphore::~Semaphore() {
    800022f0:	ff010113          	addi	sp,sp,-16
    800022f4:	00813423          	sd	s0,8(sp)
    800022f8:	01010413          	addi	s0,sp,16

}
    800022fc:	00813403          	ld	s0,8(sp)
    80002300:	01010113          	addi	sp,sp,16
    80002304:	00008067          	ret

0000000080002308 <_Znwm>:
void* operator new(size_t size) {
    80002308:	ff010113          	addi	sp,sp,-16
    8000230c:	00113423          	sd	ra,8(sp)
    80002310:	00813023          	sd	s0,0(sp)
    80002314:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    80002318:	fffff097          	auipc	ra,0xfffff
    8000231c:	fd8080e7          	jalr	-40(ra) # 800012f0 <_Z9mem_allocm>
}
    80002320:	00813083          	ld	ra,8(sp)
    80002324:	00013403          	ld	s0,0(sp)
    80002328:	01010113          	addi	sp,sp,16
    8000232c:	00008067          	ret

0000000080002330 <_Znam>:
void* operator new[](size_t size) {
    80002330:	ff010113          	addi	sp,sp,-16
    80002334:	00113423          	sd	ra,8(sp)
    80002338:	00813023          	sd	s0,0(sp)
    8000233c:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    80002340:	fffff097          	auipc	ra,0xfffff
    80002344:	fb0080e7          	jalr	-80(ra) # 800012f0 <_Z9mem_allocm>
}
    80002348:	00813083          	ld	ra,8(sp)
    8000234c:	00013403          	ld	s0,0(sp)
    80002350:	01010113          	addi	sp,sp,16
    80002354:	00008067          	ret

0000000080002358 <_ZdlPv>:
void operator delete(void* ptr)noexcept {
    80002358:	ff010113          	addi	sp,sp,-16
    8000235c:	00113423          	sd	ra,8(sp)
    80002360:	00813023          	sd	s0,0(sp)
    80002364:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80002368:	fffff097          	auipc	ra,0xfffff
    8000236c:	fc8080e7          	jalr	-56(ra) # 80001330 <_Z8mem_freePv>
}
    80002370:	00813083          	ld	ra,8(sp)
    80002374:	00013403          	ld	s0,0(sp)
    80002378:	01010113          	addi	sp,sp,16
    8000237c:	00008067          	ret

0000000080002380 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80002380:	ff010113          	addi	sp,sp,-16
    80002384:	00113423          	sd	ra,8(sp)
    80002388:	00813023          	sd	s0,0(sp)
    8000238c:	01010413          	addi	s0,sp,16
}
    80002390:	00000097          	auipc	ra,0x0
    80002394:	fc8080e7          	jalr	-56(ra) # 80002358 <_ZdlPv>
    80002398:	00813083          	ld	ra,8(sp)
    8000239c:	00013403          	ld	s0,0(sp)
    800023a0:	01010113          	addi	sp,sp,16
    800023a4:	00008067          	ret

00000000800023a8 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    800023a8:	ff010113          	addi	sp,sp,-16
    800023ac:	00113423          	sd	ra,8(sp)
    800023b0:	00813023          	sd	s0,0(sp)
    800023b4:	01010413          	addi	s0,sp,16
}
    800023b8:	00000097          	auipc	ra,0x0
    800023bc:	fa0080e7          	jalr	-96(ra) # 80002358 <_ZdlPv>
    800023c0:	00813083          	ld	ra,8(sp)
    800023c4:	00013403          	ld	s0,0(sp)
    800023c8:	01010113          	addi	sp,sp,16
    800023cc:	00008067          	ret

00000000800023d0 <_ZdaPv>:
void operator delete[](void* ptr)noexcept {
    800023d0:	ff010113          	addi	sp,sp,-16
    800023d4:	00113423          	sd	ra,8(sp)
    800023d8:	00813023          	sd	s0,0(sp)
    800023dc:	01010413          	addi	s0,sp,16
mem_free(ptr);
    800023e0:	fffff097          	auipc	ra,0xfffff
    800023e4:	f50080e7          	jalr	-176(ra) # 80001330 <_Z8mem_freePv>
}
    800023e8:	00813083          	ld	ra,8(sp)
    800023ec:	00013403          	ld	s0,0(sp)
    800023f0:	01010113          	addi	sp,sp,16
    800023f4:	00008067          	ret

00000000800023f8 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (* body)(void*), void* arg) {
    800023f8:	ff010113          	addi	sp,sp,-16
    800023fc:	00813423          	sd	s0,8(sp)
    80002400:	01010413          	addi	s0,sp,16
    80002404:	00004797          	auipc	a5,0x4
    80002408:	ce478793          	addi	a5,a5,-796 # 800060e8 <_ZTV6Thread+0x10>
    8000240c:	00f53023          	sd	a5,0(a0)
}
    80002410:	00813403          	ld	s0,8(sp)
    80002414:	01010113          	addi	sp,sp,16
    80002418:	00008067          	ret

000000008000241c <_ZN6Thread5startEv>:
int Thread::start() {
    8000241c:	ff010113          	addi	sp,sp,-16
    80002420:	00813423          	sd	s0,8(sp)
    80002424:	01010413          	addi	s0,sp,16
}
    80002428:	00000513          	li	a0,0
    8000242c:	00813403          	ld	s0,8(sp)
    80002430:	01010113          	addi	sp,sp,16
    80002434:	00008067          	ret

0000000080002438 <_ZN6Thread4joinEv>:
void Thread::join() {
    80002438:	ff010113          	addi	sp,sp,-16
    8000243c:	00813423          	sd	s0,8(sp)
    80002440:	01010413          	addi	s0,sp,16
}
    80002444:	00813403          	ld	s0,8(sp)
    80002448:	01010113          	addi	sp,sp,16
    8000244c:	00008067          	ret

0000000080002450 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80002450:	ff010113          	addi	sp,sp,-16
    80002454:	00813423          	sd	s0,8(sp)
    80002458:	01010413          	addi	s0,sp,16
}
    8000245c:	00813403          	ld	s0,8(sp)
    80002460:	01010113          	addi	sp,sp,16
    80002464:	00008067          	ret

0000000080002468 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t) {
    80002468:	ff010113          	addi	sp,sp,-16
    8000246c:	00813423          	sd	s0,8(sp)
    80002470:	01010413          	addi	s0,sp,16
}
    80002474:	00000513          	li	a0,0
    80002478:	00813403          	ld	s0,8(sp)
    8000247c:	01010113          	addi	sp,sp,16
    80002480:	00008067          	ret

0000000080002484 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80002484:	ff010113          	addi	sp,sp,-16
    80002488:	00813423          	sd	s0,8(sp)
    8000248c:	01010413          	addi	s0,sp,16
    80002490:	00004797          	auipc	a5,0x4
    80002494:	c5878793          	addi	a5,a5,-936 # 800060e8 <_ZTV6Thread+0x10>
    80002498:	00f53023          	sd	a5,0(a0)
}
    8000249c:	00813403          	ld	s0,8(sp)
    800024a0:	01010113          	addi	sp,sp,16
    800024a4:	00008067          	ret

00000000800024a8 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    800024a8:	ff010113          	addi	sp,sp,-16
    800024ac:	00813423          	sd	s0,8(sp)
    800024b0:	01010413          	addi	s0,sp,16
    800024b4:	00004797          	auipc	a5,0x4
    800024b8:	c5c78793          	addi	a5,a5,-932 # 80006110 <_ZTV9Semaphore+0x10>
    800024bc:	00f53023          	sd	a5,0(a0)
}
    800024c0:	00813403          	ld	s0,8(sp)
    800024c4:	01010113          	addi	sp,sp,16
    800024c8:	00008067          	ret

00000000800024cc <_ZN9Semaphore4waitEv>:

int Semaphore::wait() {
    800024cc:	ff010113          	addi	sp,sp,-16
    800024d0:	00813423          	sd	s0,8(sp)
    800024d4:	01010413          	addi	s0,sp,16
	return 0;
}
    800024d8:	00000513          	li	a0,0
    800024dc:	00813403          	ld	s0,8(sp)
    800024e0:	01010113          	addi	sp,sp,16
    800024e4:	00008067          	ret

00000000800024e8 <_ZN9Semaphore6signalEv>:

int Semaphore::signal() {
    800024e8:	ff010113          	addi	sp,sp,-16
    800024ec:	00813423          	sd	s0,8(sp)
    800024f0:	01010413          	addi	s0,sp,16
	return 0;
}
    800024f4:	00000513          	li	a0,0
    800024f8:	00813403          	ld	s0,8(sp)
    800024fc:	01010113          	addi	sp,sp,16
    80002500:	00008067          	ret

0000000080002504 <_ZN14PeriodicThread9terminateEv>:

void PeriodicThread::terminate() {
    80002504:	ff010113          	addi	sp,sp,-16
    80002508:	00813423          	sd	s0,8(sp)
    8000250c:	01010413          	addi	s0,sp,16

}
    80002510:	00813403          	ld	s0,8(sp)
    80002514:	01010113          	addi	sp,sp,16
    80002518:	00008067          	ret

000000008000251c <_ZN14PeriodicThreadC1Em>:

PeriodicThread::PeriodicThread(time_t period) {
    8000251c:	fe010113          	addi	sp,sp,-32
    80002520:	00113c23          	sd	ra,24(sp)
    80002524:	00813823          	sd	s0,16(sp)
    80002528:	00913423          	sd	s1,8(sp)
    8000252c:	02010413          	addi	s0,sp,32
    80002530:	00050493          	mv	s1,a0
    80002534:	00000097          	auipc	ra,0x0
    80002538:	f50080e7          	jalr	-176(ra) # 80002484 <_ZN6ThreadC1Ev>
    8000253c:	00004797          	auipc	a5,0x4
    80002540:	b7c78793          	addi	a5,a5,-1156 # 800060b8 <_ZTV14PeriodicThread+0x10>
    80002544:	00f4b023          	sd	a5,0(s1)

}
    80002548:	01813083          	ld	ra,24(sp)
    8000254c:	01013403          	ld	s0,16(sp)
    80002550:	00813483          	ld	s1,8(sp)
    80002554:	02010113          	addi	sp,sp,32
    80002558:	00008067          	ret

000000008000255c <_ZN7Console4getcEv>:

char Console::getc() {
    8000255c:	ff010113          	addi	sp,sp,-16
    80002560:	00813423          	sd	s0,8(sp)
    80002564:	01010413          	addi	s0,sp,16
	return 0;
}
    80002568:	00000513          	li	a0,0
    8000256c:	00813403          	ld	s0,8(sp)
    80002570:	01010113          	addi	sp,sp,16
    80002574:	00008067          	ret

0000000080002578 <_ZN7Console4putcEc>:

void Console::putc(char) {
    80002578:	ff010113          	addi	sp,sp,-16
    8000257c:	00813423          	sd	s0,8(sp)
    80002580:	01010413          	addi	s0,sp,16

}
    80002584:	00813403          	ld	s0,8(sp)
    80002588:	01010113          	addi	sp,sp,16
    8000258c:	00008067          	ret

0000000080002590 <_ZN6Thread3runEv>:
    static void dispatch ();
    static int sleep (time_t);

protected:
    Thread ();
    virtual void run () {}
    80002590:	ff010113          	addi	sp,sp,-16
    80002594:	00813423          	sd	s0,8(sp)
    80002598:	01010413          	addi	s0,sp,16
    8000259c:	00813403          	ld	s0,8(sp)
    800025a0:	01010113          	addi	sp,sp,16
    800025a4:	00008067          	ret

00000000800025a8 <_ZN14PeriodicThread18periodicActivationEv>:
public:
    void terminate ();

protected:
    PeriodicThread (time_t period);
    virtual void periodicActivation () {}
    800025a8:	ff010113          	addi	sp,sp,-16
    800025ac:	00813423          	sd	s0,8(sp)
    800025b0:	01010413          	addi	s0,sp,16
    800025b4:	00813403          	ld	s0,8(sp)
    800025b8:	01010113          	addi	sp,sp,16
    800025bc:	00008067          	ret

00000000800025c0 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    800025c0:	ff010113          	addi	sp,sp,-16
    800025c4:	00813423          	sd	s0,8(sp)
    800025c8:	01010413          	addi	s0,sp,16
    800025cc:	00004797          	auipc	a5,0x4
    800025d0:	aec78793          	addi	a5,a5,-1300 # 800060b8 <_ZTV14PeriodicThread+0x10>
    800025d4:	00f53023          	sd	a5,0(a0)
    800025d8:	00813403          	ld	s0,8(sp)
    800025dc:	01010113          	addi	sp,sp,16
    800025e0:	00008067          	ret

00000000800025e4 <_ZN14PeriodicThreadD0Ev>:
    800025e4:	ff010113          	addi	sp,sp,-16
    800025e8:	00113423          	sd	ra,8(sp)
    800025ec:	00813023          	sd	s0,0(sp)
    800025f0:	01010413          	addi	s0,sp,16
    800025f4:	00004797          	auipc	a5,0x4
    800025f8:	ac478793          	addi	a5,a5,-1340 # 800060b8 <_ZTV14PeriodicThread+0x10>
    800025fc:	00f53023          	sd	a5,0(a0)
    80002600:	00000097          	auipc	ra,0x0
    80002604:	d58080e7          	jalr	-680(ra) # 80002358 <_ZdlPv>
    80002608:	00813083          	ld	ra,8(sp)
    8000260c:	00013403          	ld	s0,0(sp)
    80002610:	01010113          	addi	sp,sp,16
    80002614:	00008067          	ret

0000000080002618 <_ZN3TCB7wrapperEv>:
	Riscv::pushRegisters();
	TCB::dispatch();
	Riscv::popRegisters();
}

void TCB::wrapper() {
    80002618:	ff010113          	addi	sp,sp,-16
    8000261c:	00113423          	sd	ra,8(sp)
    80002620:	00813023          	sd	s0,0(sp)
    80002624:	01010413          	addi	s0,sp,16
	//pocetak wrappera se izvrsava u supervisor modu,
	//jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch/yield)
	Riscv::popSppSpie();
    80002628:	00000097          	auipc	ra,0x0
    8000262c:	2e0080e7          	jalr	736(ra) # 80002908 <_ZN5Riscv10popSppSpieEv>
	//na dalje se izvrsavamo u user modu
	running->threadFunction(running->args);
    80002630:	00004797          	auipc	a5,0x4
    80002634:	b887b783          	ld	a5,-1144(a5) # 800061b8 <_ZN3TCB7runningE>
    80002638:	0107b703          	ld	a4,16(a5)
    8000263c:	0207b503          	ld	a0,32(a5)
    80002640:	000700e7          	jalr	a4
	//running->finished = true;
	//i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
	thread_exit();
    80002644:	fffff097          	auipc	ra,0xfffff
    80002648:	d9c080e7          	jalr	-612(ra) # 800013e0 <_Z11thread_exitv>
}
    8000264c:	00813083          	ld	ra,8(sp)
    80002650:	00013403          	ld	s0,0(sp)
    80002654:	01010113          	addi	sp,sp,16
    80002658:	00008067          	ret

000000008000265c <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    8000265c:	fe010113          	addi	sp,sp,-32
    80002660:	00113c23          	sd	ra,24(sp)
    80002664:	00813823          	sd	s0,16(sp)
    80002668:	00913423          	sd	s1,8(sp)
    8000266c:	02010413          	addi	s0,sp,32
	TCB* old = TCB::running;
    80002670:	00004497          	auipc	s1,0x4
    80002674:	b484b483          	ld	s1,-1208(s1) # 800061b8 <_ZN3TCB7runningE>
	if (!old->finished && !old->blocked && old->timeToSleep == 0 && !old->needToJoin) {
    80002678:	0304c783          	lbu	a5,48(s1)
    8000267c:	00079e63          	bnez	a5,80002698 <_ZN3TCB8dispatchEv+0x3c>
    80002680:	0314c783          	lbu	a5,49(s1)
    80002684:	00079a63          	bnez	a5,80002698 <_ZN3TCB8dispatchEv+0x3c>
    80002688:	0404b783          	ld	a5,64(s1)
    8000268c:	00079663          	bnez	a5,80002698 <_ZN3TCB8dispatchEv+0x3c>
    80002690:	0324c783          	lbu	a5,50(s1)
    80002694:	04078a63          	beqz	a5,800026e8 <_ZN3TCB8dispatchEv+0x8c>
	TCB::running = Scheduler::get();
    80002698:	fffff097          	auipc	ra,0xfffff
    8000269c:	f3c080e7          	jalr	-196(ra) # 800015d4 <_ZN9Scheduler3getEv>
    800026a0:	00050593          	mv	a1,a0
    800026a4:	00004797          	auipc	a5,0x4
    800026a8:	b1478793          	addi	a5,a5,-1260 # 800061b8 <_ZN3TCB7runningE>
    800026ac:	00a7b023          	sd	a0,0(a5)
	TCB::runningTimeSlice = 0;
    800026b0:	0007b423          	sd	zero,8(a5)
	if (TCB::running->threadFunction == nullptr) {
    800026b4:	01053783          	ld	a5,16(a0)
    800026b8:	04078063          	beqz	a5,800026f8 <_ZN3TCB8dispatchEv+0x9c>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    800026bc:	10000793          	li	a5,256
    800026c0:	1007b073          	csrc	sstatus,a5
	if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    800026c4:	00b48863          	beq	s1,a1,800026d4 <_ZN3TCB8dispatchEv+0x78>
    800026c8:	00048513          	mv	a0,s1
    800026cc:	fffff097          	auipc	ra,0xfffff
    800026d0:	b44080e7          	jalr	-1212(ra) # 80001210 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    800026d4:	01813083          	ld	ra,24(sp)
    800026d8:	01013403          	ld	s0,16(sp)
    800026dc:	00813483          	ld	s1,8(sp)
    800026e0:	02010113          	addi	sp,sp,32
    800026e4:	00008067          	ret
		Scheduler::put(old);
    800026e8:	00048513          	mv	a0,s1
    800026ec:	fffff097          	auipc	ra,0xfffff
    800026f0:	ea4080e7          	jalr	-348(ra) # 80001590 <_ZN9Scheduler3putEP3TCB>
    800026f4:	fa5ff06f          	j	80002698 <_ZN3TCB8dispatchEv+0x3c>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    800026f8:	10000793          	li	a5,256
    800026fc:	1007a073          	csrs	sstatus,a5
}
    80002700:	fc5ff06f          	j	800026c4 <_ZN3TCB8dispatchEv+0x68>

0000000080002704 <_ZN3TCB5yieldEv>:
void TCB::yield() {
    80002704:	ff010113          	addi	sp,sp,-16
    80002708:	00113423          	sd	ra,8(sp)
    8000270c:	00813023          	sd	s0,0(sp)
    80002710:	01010413          	addi	s0,sp,16
	Riscv::pushRegisters();
    80002714:	fffff097          	auipc	ra,0xfffff
    80002718:	8ec080e7          	jalr	-1812(ra) # 80001000 <_ZN5Riscv13pushRegistersEv>
	TCB::dispatch();
    8000271c:	00000097          	auipc	ra,0x0
    80002720:	f40080e7          	jalr	-192(ra) # 8000265c <_ZN3TCB8dispatchEv>
	Riscv::popRegisters();
    80002724:	fffff097          	auipc	ra,0xfffff
    80002728:	958080e7          	jalr	-1704(ra) # 8000107c <_ZN5Riscv12popRegistersEv>
}
    8000272c:	00813083          	ld	ra,8(sp)
    80002730:	00013403          	ld	s0,0(sp)
    80002734:	01010113          	addi	sp,sp,16
    80002738:	00008067          	ret

000000008000273c <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    8000273c:	ff010113          	addi	sp,sp,-16
    80002740:	00113423          	sd	ra,8(sp)
    80002744:	00813023          	sd	s0,0(sp)
    80002748:	01010413          	addi	s0,sp,16
	return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment));
    8000274c:	01050513          	addi	a0,a0,16
    80002750:	00000097          	auipc	ra,0x0
    80002754:	1d8080e7          	jalr	472(ra) # 80002928 <_ZN15MemoryAllocator7kmallocEm>
}
    80002758:	00813083          	ld	ra,8(sp)
    8000275c:	00013403          	ld	s0,0(sp)
    80002760:	01010113          	addi	sp,sp,16
    80002764:	00008067          	ret

0000000080002768 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    80002768:	fd010113          	addi	sp,sp,-48
    8000276c:	02113423          	sd	ra,40(sp)
    80002770:	02813023          	sd	s0,32(sp)
    80002774:	00913c23          	sd	s1,24(sp)
    80002778:	01213823          	sd	s2,16(sp)
    8000277c:	01313423          	sd	s3,8(sp)
    80002780:	01413023          	sd	s4,0(sp)
    80002784:	03010413          	addi	s0,sp,48
    80002788:	00050993          	mv	s3,a0
    8000278c:	00058a13          	mv	s4,a1
    80002790:	00060913          	mv	s2,a2
	TCB* newThread = new TCB(function, args, stack);
    80002794:	06000513          	li	a0,96
    80002798:	00000097          	auipc	ra,0x0
    8000279c:	fa4080e7          	jalr	-92(ra) # 8000273c <_ZN3TCBnwEm>
    800027a0:	00050493          	mv	s1,a0


	TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
													timeSlice(DEFAULT_TIME_SLICE), finished(false), blocked(false),
													needToJoin(false),
													nextInScheduler(nullptr), timeToSleep(0), nextSleeping(nullptr) {
    800027a4:	01353823          	sd	s3,16(a0)
    800027a8:	01253c23          	sd	s2,24(a0)
    800027ac:	03453023          	sd	s4,32(a0)
    800027b0:	00200793          	li	a5,2
    800027b4:	02f53423          	sd	a5,40(a0)
    800027b8:	02050823          	sb	zero,48(a0)
    800027bc:	020508a3          	sb	zero,49(a0)
    800027c0:	02050923          	sb	zero,50(a0)
    800027c4:	02053c23          	sd	zero,56(a0)
    800027c8:	04053023          	sd	zero,64(a0)
    800027cc:	04053423          	sd	zero,72(a0)
	ThreadQueue() : front(nullptr), back(nullptr) {}
    800027d0:	04053823          	sd	zero,80(a0)
    800027d4:	04053c23          	sd	zero,88(a0)
		//formiranje pocetnog konteksta; specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    800027d8:	04098a63          	beqz	s3,8000282c <_ZN3TCB12createThreadEPFvPvES0_Pm+0xc4>
    800027dc:	00000797          	auipc	a5,0x0
    800027e0:	e3c78793          	addi	a5,a5,-452 # 80002618 <_ZN3TCB7wrapperEv>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    800027e4:	04090863          	beqz	s2,80002834 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xcc>
    800027e8:	00008637          	lui	a2,0x8
    800027ec:	00c90933          	add	s2,s2,a2
		this->context.ra = startRa;
    800027f0:	00f4b023          	sd	a5,0(s1)
		this->context.sp = startSp;
    800027f4:	0124b423          	sd	s2,8(s1)
	if (function != nullptr) Scheduler::put(newThread);
    800027f8:	00098863          	beqz	s3,80002808 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xa0>
    800027fc:	00048513          	mv	a0,s1
    80002800:	fffff097          	auipc	ra,0xfffff
    80002804:	d90080e7          	jalr	-624(ra) # 80001590 <_ZN9Scheduler3putEP3TCB>
}
    80002808:	00048513          	mv	a0,s1
    8000280c:	02813083          	ld	ra,40(sp)
    80002810:	02013403          	ld	s0,32(sp)
    80002814:	01813483          	ld	s1,24(sp)
    80002818:	01013903          	ld	s2,16(sp)
    8000281c:	00813983          	ld	s3,8(sp)
    80002820:	00013a03          	ld	s4,0(sp)
    80002824:	03010113          	addi	sp,sp,48
    80002828:	00008067          	ret
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    8000282c:	00000793          	li	a5,0
    80002830:	fb5ff06f          	j	800027e4 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x7c>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80002834:	00000913          	li	s2,0
    80002838:	fb9ff06f          	j	800027f0 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x88>

000000008000283c <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    8000283c:	ff010113          	addi	sp,sp,-16
    80002840:	00113423          	sd	ra,8(sp)
    80002844:	00813023          	sd	s0,0(sp)
    80002848:	01010413          	addi	s0,sp,16
	MemoryAllocator::kfree(ptr);
    8000284c:	00000097          	auipc	ra,0x0
    80002850:	284080e7          	jalr	644(ra) # 80002ad0 <_ZN15MemoryAllocator5kfreeEPv>
}
    80002854:	00813083          	ld	ra,8(sp)
    80002858:	00013403          	ld	s0,0(sp)
    8000285c:	01010113          	addi	sp,sp,16
    80002860:	00008067          	ret

0000000080002864 <_ZN3TCB10threadJoinEPS_>:

void TCB::threadJoin(TCB* handle) {
	if(handle->finished) return;
    80002864:	03054783          	lbu	a5,48(a0)
    80002868:	00078463          	beqz	a5,80002870 <_ZN3TCB10threadJoinEPS_+0xc>
    8000286c:	00008067          	ret
void TCB::threadJoin(TCB* handle) {
    80002870:	ff010113          	addi	sp,sp,-16
    80002874:	00113423          	sd	ra,8(sp)
    80002878:	00813023          	sd	s0,0(sp)
    8000287c:	01010413          	addi	s0,sp,16
	TCB::running->needToJoin = true;
    80002880:	00004597          	auipc	a1,0x4
    80002884:	9385b583          	ld	a1,-1736(a1) # 800061b8 <_ZN3TCB7runningE>
    80002888:	00100793          	li	a5,1
    8000288c:	02f58923          	sb	a5,50(a1)
	handle->waitingToJoin.putLast(TCB::running);
    80002890:	05050513          	addi	a0,a0,80
    80002894:	fffff097          	auipc	ra,0xfffff
    80002898:	990080e7          	jalr	-1648(ra) # 80001224 <_ZN11ThreadQueue7putLastEP3TCB>
}
    8000289c:	00813083          	ld	ra,8(sp)
    800028a0:	00013403          	ld	s0,0(sp)
    800028a4:	01010113          	addi	sp,sp,16
    800028a8:	00008067          	ret

00000000800028ac <_ZN3TCB13releaseJoinedEv>:

void TCB::releaseJoined() {
	while(!TCB::running->waitingToJoin.isEmpty()){
    800028ac:	00004517          	auipc	a0,0x4
    800028b0:	90c53503          	ld	a0,-1780(a0) # 800061b8 <_ZN3TCB7runningE>
		return front == nullptr;
    800028b4:	05053783          	ld	a5,80(a0)
    800028b8:	04078663          	beqz	a5,80002904 <_ZN3TCB13releaseJoinedEv+0x58>
void TCB::releaseJoined() {
    800028bc:	ff010113          	addi	sp,sp,-16
    800028c0:	00113423          	sd	ra,8(sp)
    800028c4:	00813023          	sd	s0,0(sp)
    800028c8:	01010413          	addi	s0,sp,16
		TCB* tcb = TCB::running->waitingToJoin.getFirst();
    800028cc:	05050513          	addi	a0,a0,80
    800028d0:	fffff097          	auipc	ra,0xfffff
    800028d4:	9c0080e7          	jalr	-1600(ra) # 80001290 <_ZN11ThreadQueue8getFirstEv>
		tcb->needToJoin = false;
    800028d8:	02050923          	sb	zero,50(a0)
		Scheduler::put(tcb);
    800028dc:	fffff097          	auipc	ra,0xfffff
    800028e0:	cb4080e7          	jalr	-844(ra) # 80001590 <_ZN9Scheduler3putEP3TCB>
	while(!TCB::running->waitingToJoin.isEmpty()){
    800028e4:	00004517          	auipc	a0,0x4
    800028e8:	8d453503          	ld	a0,-1836(a0) # 800061b8 <_ZN3TCB7runningE>
    800028ec:	05053783          	ld	a5,80(a0)
    800028f0:	fc079ee3          	bnez	a5,800028cc <_ZN3TCB13releaseJoinedEv+0x20>
	}
}
    800028f4:	00813083          	ld	ra,8(sp)
    800028f8:	00013403          	ld	s0,0(sp)
    800028fc:	01010113          	addi	sp,sp,16
    80002900:	00008067          	ret
    80002904:	00008067          	ret

0000000080002908 <_ZN5Riscv10popSppSpieEv>:
// Created by os on 5/17/23.
//

#include "../h/Riscv.hpp"

void Riscv::popSppSpie() {
    80002908:	ff010113          	addi	sp,sp,-16
    8000290c:	00813423          	sd	s0,8(sp)
    80002910:	01010413          	addi	s0,sp,16
	//ra pokazuje iza ove funkcije na nastavak wrappera
	__asm__ volatile("csrw sepc, ra");
    80002914:	14109073          	csrw	sepc,ra
	__asm__ volatile("sret");
    80002918:	10200073          	sret
    8000291c:	00813403          	ld	s0,8(sp)
    80002920:	01010113          	addi	sp,sp,16
    80002924:	00008067          	ret

0000000080002928 <_ZN15MemoryAllocator7kmallocEm>:

bool MemoryAllocator::initialized = false;
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

void* MemoryAllocator::kmalloc(size_t size) {
    80002928:	ff010113          	addi	sp,sp,-16
    8000292c:	00813423          	sd	s0,8(sp)
    80002930:	01010413          	addi	s0,sp,16
	if (size <= 0) return nullptr;
    80002934:	12050663          	beqz	a0,80002a60 <_ZN15MemoryAllocator7kmallocEm+0x138>

	//pocetna inicijalizacija
	if (!initialized) {
    80002938:	00004797          	auipc	a5,0x4
    8000293c:	8907c783          	lbu	a5,-1904(a5) # 800061c8 <_ZN15MemoryAllocator11initializedE>
    80002940:	04079863          	bnez	a5,80002990 <_ZN15MemoryAllocator7kmallocEm+0x68>
		freeMemHead = (FreeMemSegment*)HEAP_START_ADDR;
    80002944:	00003617          	auipc	a2,0x3
    80002948:	7ec63603          	ld	a2,2028(a2) # 80006130 <_GLOBAL_OFFSET_TABLE_+0x10>
    8000294c:	00063783          	ld	a5,0(a2)
    80002950:	00004717          	auipc	a4,0x4
    80002954:	87870713          	addi	a4,a4,-1928 # 800061c8 <_ZN15MemoryAllocator11initializedE>
    80002958:	00f73423          	sd	a5,8(a4)
		freeMemHead->next = nullptr;
    8000295c:	0007b023          	sd	zero,0(a5)
		freeMemHead->prev = nullptr;
    80002960:	00873683          	ld	a3,8(a4)
    80002964:	0006b423          	sd	zero,8(a3)
		freeMemHead->size = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR - sizeof(FreeMemSegment);
    80002968:	00003797          	auipc	a5,0x3
    8000296c:	7e07b783          	ld	a5,2016(a5) # 80006148 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002970:	0007b783          	ld	a5,0(a5)
    80002974:	00063603          	ld	a2,0(a2)
    80002978:	40c787b3          	sub	a5,a5,a2
    8000297c:	fe878793          	addi	a5,a5,-24
    80002980:	00f6b823          	sd	a5,16(a3)
		usedMemHead = nullptr;
    80002984:	00073823          	sd	zero,16(a4)

		initialized = true;
    80002988:	00100793          	li	a5,1
    8000298c:	00f70023          	sb	a5,0(a4)
	}

	//alokacija uvek zaokruzena na blokove
	//size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
	size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80002990:	00655793          	srli	a5,a0,0x6
    80002994:	03f57513          	andi	a0,a0,63
    80002998:	00050463          	beqz	a0,800029a0 <_ZN15MemoryAllocator7kmallocEm+0x78>
    8000299c:	00100513          	li	a0,1
    800029a0:	00a78533          	add	a0,a5,a0
	size = blocks * MEM_BLOCK_SIZE;
    800029a4:	00651793          	slli	a5,a0,0x6

	//trazenje slobodnog segmenta po first-fit algoritmu
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    800029a8:	00004517          	auipc	a0,0x4
    800029ac:	82853503          	ld	a0,-2008(a0) # 800061d0 <_ZN15MemoryAllocator11freeMemHeadE>
    800029b0:	08050a63          	beqz	a0,80002a44 <_ZN15MemoryAllocator7kmallocEm+0x11c>
		if (current->size < size) continue;
    800029b4:	01053703          	ld	a4,16(a0)
    800029b8:	06f76263          	bltu	a4,a5,80002a1c <_ZN15MemoryAllocator7kmallocEm+0xf4>

		//pravljenje novog slobodnog fragmenta od ostatka fragmenta
		FreeMemSegment* remainderFree = (FreeMemSegment*)((char*)current + size);
    800029bc:	00f506b3          	add	a3,a0,a5
		remainderFree->size = current->size - size;
    800029c0:	40f70733          	sub	a4,a4,a5
    800029c4:	00e6b823          	sd	a4,16(a3)
		remainderFree->prev = current->prev;
    800029c8:	00853703          	ld	a4,8(a0)
    800029cc:	00e6b423          	sd	a4,8(a3)
		if (current->prev) current->prev->next = remainderFree;
    800029d0:	00070463          	beqz	a4,800029d8 <_ZN15MemoryAllocator7kmallocEm+0xb0>
    800029d4:	00d73023          	sd	a3,0(a4)
		remainderFree->next = current->next;
    800029d8:	00053703          	ld	a4,0(a0)
    800029dc:	00e6b023          	sd	a4,0(a3)
		if (current->next) current->next->prev = remainderFree;
    800029e0:	00070463          	beqz	a4,800029e8 <_ZN15MemoryAllocator7kmallocEm+0xc0>
    800029e4:	00d73423          	sd	a3,8(a4)
		if (freeMemHead == current) freeMemHead = remainderFree;
    800029e8:	00003717          	auipc	a4,0x3
    800029ec:	7e873703          	ld	a4,2024(a4) # 800061d0 <_ZN15MemoryAllocator11freeMemHeadE>
    800029f0:	02a70a63          	beq	a4,a0,80002a24 <_ZN15MemoryAllocator7kmallocEm+0xfc>

		//ubacivanje novog fragmenta u listu zauzetih fragmenata
		UsedMemSegment* newFragment = (UsedMemSegment*)current;
		newFragment->size = size;
    800029f4:	00f53423          	sd	a5,8(a0)
		UsedMemSegment* prevUsed = nullptr;
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    800029f8:	00003697          	auipc	a3,0x3
    800029fc:	7e06b683          	ld	a3,2016(a3) # 800061d8 <_ZN15MemoryAllocator11usedMemHeadE>
    80002a00:	00068793          	mv	a5,a3
		UsedMemSegment* prevUsed = nullptr;
    80002a04:	00000713          	li	a4,0
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    80002a08:	02078463          	beqz	a5,80002a30 <_ZN15MemoryAllocator7kmallocEm+0x108>
    80002a0c:	02a7f263          	bgeu	a5,a0,80002a30 <_ZN15MemoryAllocator7kmallocEm+0x108>
    80002a10:	00078713          	mv	a4,a5
    80002a14:	0007b783          	ld	a5,0(a5)
    80002a18:	ff1ff06f          	j	80002a08 <_ZN15MemoryAllocator7kmallocEm+0xe0>
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80002a1c:	00053503          	ld	a0,0(a0)
    80002a20:	f91ff06f          	j	800029b0 <_ZN15MemoryAllocator7kmallocEm+0x88>
		if (freeMemHead == current) freeMemHead = remainderFree;
    80002a24:	00003717          	auipc	a4,0x3
    80002a28:	7ad73623          	sd	a3,1964(a4) # 800061d0 <_ZN15MemoryAllocator11freeMemHeadE>
    80002a2c:	fc9ff06f          	j	800029f4 <_ZN15MemoryAllocator7kmallocEm+0xcc>
		if (!prevUsed) {
    80002a30:	02070063          	beqz	a4,80002a50 <_ZN15MemoryAllocator7kmallocEm+0x128>
			newFragment->next = usedMemHead;
			usedMemHead = newFragment;
		} else {
			newFragment->next = prevUsed->next;
    80002a34:	00073783          	ld	a5,0(a4)
    80002a38:	00f53023          	sd	a5,0(a0)
			prevUsed->next = newFragment;
    80002a3c:	00a73023          	sd	a0,0(a4)
		}
		return (char*)newFragment + sizeof(UsedMemSegment);
    80002a40:	01050513          	addi	a0,a0,16
	}
	return nullptr;
}
    80002a44:	00813403          	ld	s0,8(sp)
    80002a48:	01010113          	addi	sp,sp,16
    80002a4c:	00008067          	ret
			newFragment->next = usedMemHead;
    80002a50:	00d53023          	sd	a3,0(a0)
			usedMemHead = newFragment;
    80002a54:	00003797          	auipc	a5,0x3
    80002a58:	78a7b223          	sd	a0,1924(a5) # 800061d8 <_ZN15MemoryAllocator11usedMemHeadE>
    80002a5c:	fe5ff06f          	j	80002a40 <_ZN15MemoryAllocator7kmallocEm+0x118>
	if (size <= 0) return nullptr;
    80002a60:	00000513          	li	a0,0
    80002a64:	fe1ff06f          	j	80002a44 <_ZN15MemoryAllocator7kmallocEm+0x11c>

0000000080002a68 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:
	tryToJoin(newFree);
	tryToJoin(prevFree);
	return 0;
}

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    80002a68:	ff010113          	addi	sp,sp,-16
    80002a6c:	00813423          	sd	s0,8(sp)
    80002a70:	01010413          	addi	s0,sp,16
	if (!current) return 0;
    80002a74:	04050663          	beqz	a0,80002ac0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x58>
	bool nextExists = current->next != nullptr;
    80002a78:	00053783          	ld	a5,0(a0)
	char* nextAddr = (char*)current + current->size;
    80002a7c:	01053703          	ld	a4,16(a0)
    80002a80:	00e506b3          	add	a3,a0,a4
	char* cnext = (char*)current->next;
	bool nextIsConnected = (nextAddr == cnext);
	if (nextExists && nextIsConnected) {
    80002a84:	04078263          	beqz	a5,80002ac8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x60>
    80002a88:	00d78a63          	beq	a5,a3,80002a9c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x34>
		current->size += current->next->size;
		current->next = current->next->next;
		if (current->next) current->next->prev = current;
		return 1;
	} else return 0;
    80002a8c:	00000513          	li	a0,0
}
    80002a90:	00813403          	ld	s0,8(sp)
    80002a94:	01010113          	addi	sp,sp,16
    80002a98:	00008067          	ret
		current->size += current->next->size;
    80002a9c:	0107b683          	ld	a3,16(a5)
    80002aa0:	00d70733          	add	a4,a4,a3
    80002aa4:	00e53823          	sd	a4,16(a0)
		current->next = current->next->next;
    80002aa8:	0007b783          	ld	a5,0(a5)
    80002aac:	00f53023          	sd	a5,0(a0)
		if (current->next) current->next->prev = current;
    80002ab0:	00078463          	beqz	a5,80002ab8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x50>
    80002ab4:	00a7b423          	sd	a0,8(a5)
		return 1;
    80002ab8:	00100513          	li	a0,1
    80002abc:	fd5ff06f          	j	80002a90 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	if (!current) return 0;
    80002ac0:	00000513          	li	a0,0
    80002ac4:	fcdff06f          	j	80002a90 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	} else return 0;
    80002ac8:	00000513          	li	a0,0
    80002acc:	fc5ff06f          	j	80002a90 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>

0000000080002ad0 <_ZN15MemoryAllocator5kfreeEPv>:
	if (!ptr) return 0;
    80002ad0:	10050463          	beqz	a0,80002bd8 <_ZN15MemoryAllocator5kfreeEPv+0x108>
    80002ad4:	00050693          	mv	a3,a0
	if (!usedMemHead) return -1;
    80002ad8:	00003797          	auipc	a5,0x3
    80002adc:	7007b783          	ld	a5,1792(a5) # 800061d8 <_ZN15MemoryAllocator11usedMemHeadE>
    80002ae0:	10078063          	beqz	a5,80002be0 <_ZN15MemoryAllocator5kfreeEPv+0x110>
	ptr = (char*)ptr - sizeof(UsedMemSegment);
    80002ae4:	ff050513          	addi	a0,a0,-16
	UsedMemSegment* prevUsed = nullptr;
    80002ae8:	00000713          	li	a4,0
	for (; currentUsed && currentUsed != ptr; prevUsed = currentUsed, currentUsed = currentUsed->next);
    80002aec:	00078a63          	beqz	a5,80002b00 <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80002af0:	00a78863          	beq	a5,a0,80002b00 <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80002af4:	00078713          	mv	a4,a5
    80002af8:	0007b783          	ld	a5,0(a5)
    80002afc:	ff1ff06f          	j	80002aec <_ZN15MemoryAllocator5kfreeEPv+0x1c>
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80002b00:	0ea79463          	bne	a5,a0,80002be8 <_ZN15MemoryAllocator5kfreeEPv+0x118>
int MemoryAllocator::kfree(void* ptr) {
    80002b04:	fe010113          	addi	sp,sp,-32
    80002b08:	00113c23          	sd	ra,24(sp)
    80002b0c:	00813823          	sd	s0,16(sp)
    80002b10:	00913423          	sd	s1,8(sp)
    80002b14:	02010413          	addi	s0,sp,32
	if (prevUsed) prevUsed->next = currentUsed->next;
    80002b18:	02070863          	beqz	a4,80002b48 <_ZN15MemoryAllocator5kfreeEPv+0x78>
    80002b1c:	0007b783          	ld	a5,0(a5)
    80002b20:	00f73023          	sd	a5,0(a4)
	if (!freeMemHead || ptr < (char*)freeMemHead) {
    80002b24:	00003797          	auipc	a5,0x3
    80002b28:	6ac7b783          	ld	a5,1708(a5) # 800061d0 <_ZN15MemoryAllocator11freeMemHeadE>
    80002b2c:	02078663          	beqz	a5,80002b58 <_ZN15MemoryAllocator5kfreeEPv+0x88>
    80002b30:	02f56863          	bltu	a0,a5,80002b60 <_ZN15MemoryAllocator5kfreeEPv+0x90>
			 prevFree->next != nullptr && ptr > (char*)(prevFree->next); prevFree = prevFree->next);
    80002b34:	00078493          	mv	s1,a5
    80002b38:	0007b783          	ld	a5,0(a5)
    80002b3c:	02078463          	beqz	a5,80002b64 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80002b40:	fea7eae3          	bltu	a5,a0,80002b34 <_ZN15MemoryAllocator5kfreeEPv+0x64>
    80002b44:	0200006f          	j	80002b64 <_ZN15MemoryAllocator5kfreeEPv+0x94>
	else usedMemHead = currentUsed->next;
    80002b48:	0007b783          	ld	a5,0(a5)
    80002b4c:	00003717          	auipc	a4,0x3
    80002b50:	68f73623          	sd	a5,1676(a4) # 800061d8 <_ZN15MemoryAllocator11usedMemHeadE>
    80002b54:	fd1ff06f          	j	80002b24 <_ZN15MemoryAllocator5kfreeEPv+0x54>
		prevFree = nullptr;
    80002b58:	00078493          	mv	s1,a5
    80002b5c:	0080006f          	j	80002b64 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80002b60:	00000493          	li	s1,0
	size_t segmentSize = ((UsedMemSegment*)ptr)->size;
    80002b64:	ff86b783          	ld	a5,-8(a3)
	newFree->size = segmentSize;
    80002b68:	00f6b023          	sd	a5,0(a3)
	newFree->prev = prevFree;
    80002b6c:	fe96bc23          	sd	s1,-8(a3)
	if (prevFree) newFree->next = prevFree->next;
    80002b70:	04048663          	beqz	s1,80002bbc <_ZN15MemoryAllocator5kfreeEPv+0xec>
    80002b74:	0004b783          	ld	a5,0(s1)
    80002b78:	fef6b823          	sd	a5,-16(a3)
	if (newFree->next) newFree->next->prev = newFree;
    80002b7c:	ff06b783          	ld	a5,-16(a3)
    80002b80:	00078463          	beqz	a5,80002b88 <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    80002b84:	00a7b423          	sd	a0,8(a5)
	if (prevFree) prevFree->next = newFree;
    80002b88:	04048263          	beqz	s1,80002bcc <_ZN15MemoryAllocator5kfreeEPv+0xfc>
    80002b8c:	00a4b023          	sd	a0,0(s1)
	tryToJoin(newFree);
    80002b90:	00000097          	auipc	ra,0x0
    80002b94:	ed8080e7          	jalr	-296(ra) # 80002a68 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	tryToJoin(prevFree);
    80002b98:	00048513          	mv	a0,s1
    80002b9c:	00000097          	auipc	ra,0x0
    80002ba0:	ecc080e7          	jalr	-308(ra) # 80002a68 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	return 0;
    80002ba4:	00000513          	li	a0,0
}
    80002ba8:	01813083          	ld	ra,24(sp)
    80002bac:	01013403          	ld	s0,16(sp)
    80002bb0:	00813483          	ld	s1,8(sp)
    80002bb4:	02010113          	addi	sp,sp,32
    80002bb8:	00008067          	ret
	else newFree->next = freeMemHead;
    80002bbc:	00003797          	auipc	a5,0x3
    80002bc0:	6147b783          	ld	a5,1556(a5) # 800061d0 <_ZN15MemoryAllocator11freeMemHeadE>
    80002bc4:	fef6b823          	sd	a5,-16(a3)
    80002bc8:	fb5ff06f          	j	80002b7c <_ZN15MemoryAllocator5kfreeEPv+0xac>
	else freeMemHead = newFree;
    80002bcc:	00003797          	auipc	a5,0x3
    80002bd0:	60a7b223          	sd	a0,1540(a5) # 800061d0 <_ZN15MemoryAllocator11freeMemHeadE>
    80002bd4:	fbdff06f          	j	80002b90 <_ZN15MemoryAllocator5kfreeEPv+0xc0>
	if (!ptr) return 0;
    80002bd8:	00000513          	li	a0,0
    80002bdc:	00008067          	ret
	if (!usedMemHead) return -1;
    80002be0:	fff00513          	li	a0,-1
    80002be4:	00008067          	ret
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80002be8:	fff00513          	li	a0,-1
}
    80002bec:	00008067          	ret

0000000080002bf0 <_Z10testMemoryv>:
// Created by os on 5/29/23.
//
#include "../h/MemoryAllocator.hpp"
#include "../h/helper.hpp"

void testMemory() {
    80002bf0:	81010113          	addi	sp,sp,-2032
    80002bf4:	7e113423          	sd	ra,2024(sp)
    80002bf8:	7e813023          	sd	s0,2016(sp)
    80002bfc:	7c913c23          	sd	s1,2008(sp)
    80002c00:	7f010413          	addi	s0,sp,2032
    80002c04:	83010113          	addi	sp,sp,-2000
	const uint64 NumAllocations = 500;    //zasto nece za preko 500????
	const uint64 AllocationSize = 16;

	// Allocate and initialize pointers
	int* allocations[NumAllocations];
	for (uint64 i = 0; i < NumAllocations; ++i)
    80002c08:	00000713          	li	a4,0
    80002c0c:	1f300793          	li	a5,499
    80002c10:	02e7e263          	bltu	a5,a4,80002c34 <_Z10testMemoryv+0x44>
		allocations[i] = nullptr;
    80002c14:	fffff7b7          	lui	a5,0xfffff
    80002c18:	00371693          	slli	a3,a4,0x3
    80002c1c:	fe040613          	addi	a2,s0,-32
    80002c20:	00f607b3          	add	a5,a2,a5
    80002c24:	00d787b3          	add	a5,a5,a3
    80002c28:	0607b023          	sd	zero,96(a5) # fffffffffffff060 <end+0xffffffff7fff7c20>
	for (uint64 i = 0; i < NumAllocations; ++i)
    80002c2c:	00170713          	addi	a4,a4,1
    80002c30:	fddff06f          	j	80002c0c <_Z10testMemoryv+0x1c>

	// Allocate memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80002c34:	00000493          	li	s1,0
    80002c38:	1f300793          	li	a5,499
    80002c3c:	0297ea63          	bltu	a5,s1,80002c70 <_Z10testMemoryv+0x80>
		allocations[i] = static_cast<int*>(MemoryAllocator::kmalloc(AllocationSize));
    80002c40:	01000513          	li	a0,16
    80002c44:	00000097          	auipc	ra,0x0
    80002c48:	ce4080e7          	jalr	-796(ra) # 80002928 <_ZN15MemoryAllocator7kmallocEm>
    80002c4c:	fffff737          	lui	a4,0xfffff
    80002c50:	00349793          	slli	a5,s1,0x3
    80002c54:	fe040693          	addi	a3,s0,-32
    80002c58:	00e68733          	add	a4,a3,a4
    80002c5c:	00f707b3          	add	a5,a4,a5
    80002c60:	06a7b023          	sd	a0,96(a5)
		if (allocations[i] == nullptr) {
    80002c64:	00050663          	beqz	a0,80002c70 <_Z10testMemoryv+0x80>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80002c68:	00148493          	addi	s1,s1,1
    80002c6c:	fcdff06f          	j	80002c38 <_Z10testMemoryv+0x48>
    80002c70:	00000493          	li	s1,0
    80002c74:	0100006f          	j	80002c84 <_Z10testMemoryv+0x94>
	}

	// Free memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
		if (allocations[i] != nullptr) {
			if (MemoryAllocator::kfree(allocations[i]) != 0) {
    80002c78:	00000097          	auipc	ra,0x0
    80002c7c:	e58080e7          	jalr	-424(ra) # 80002ad0 <_ZN15MemoryAllocator5kfreeEPv>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80002c80:	00148493          	addi	s1,s1,1
    80002c84:	1f300793          	li	a5,499
    80002c88:	0297e263          	bltu	a5,s1,80002cac <_Z10testMemoryv+0xbc>
		if (allocations[i] != nullptr) {
    80002c8c:	fffff737          	lui	a4,0xfffff
    80002c90:	00349793          	slli	a5,s1,0x3
    80002c94:	fe040693          	addi	a3,s0,-32
    80002c98:	00e68733          	add	a4,a3,a4
    80002c9c:	00f707b3          	add	a5,a4,a5
    80002ca0:	0607b503          	ld	a0,96(a5)
    80002ca4:	fc051ae3          	bnez	a0,80002c78 <_Z10testMemoryv+0x88>
    80002ca8:	fd9ff06f          	j	80002c80 <_Z10testMemoryv+0x90>
//				printString("\nDeallocation failed for index ");
//				printInteger(i);
			}
		}
	}
    80002cac:	7d010113          	addi	sp,sp,2000
    80002cb0:	7e813083          	ld	ra,2024(sp)
    80002cb4:	7e013403          	ld	s0,2016(sp)
    80002cb8:	7d813483          	ld	s1,2008(sp)
    80002cbc:	7f010113          	addi	sp,sp,2032
    80002cc0:	00008067          	ret

0000000080002cc4 <start>:
    80002cc4:	ff010113          	addi	sp,sp,-16
    80002cc8:	00813423          	sd	s0,8(sp)
    80002ccc:	01010413          	addi	s0,sp,16
    80002cd0:	300027f3          	csrr	a5,mstatus
    80002cd4:	ffffe737          	lui	a4,0xffffe
    80002cd8:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff73bf>
    80002cdc:	00e7f7b3          	and	a5,a5,a4
    80002ce0:	00001737          	lui	a4,0x1
    80002ce4:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80002ce8:	00e7e7b3          	or	a5,a5,a4
    80002cec:	30079073          	csrw	mstatus,a5
    80002cf0:	00000797          	auipc	a5,0x0
    80002cf4:	16078793          	addi	a5,a5,352 # 80002e50 <system_main>
    80002cf8:	34179073          	csrw	mepc,a5
    80002cfc:	00000793          	li	a5,0
    80002d00:	18079073          	csrw	satp,a5
    80002d04:	000107b7          	lui	a5,0x10
    80002d08:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002d0c:	30279073          	csrw	medeleg,a5
    80002d10:	30379073          	csrw	mideleg,a5
    80002d14:	104027f3          	csrr	a5,sie
    80002d18:	2227e793          	ori	a5,a5,546
    80002d1c:	10479073          	csrw	sie,a5
    80002d20:	fff00793          	li	a5,-1
    80002d24:	00a7d793          	srli	a5,a5,0xa
    80002d28:	3b079073          	csrw	pmpaddr0,a5
    80002d2c:	00f00793          	li	a5,15
    80002d30:	3a079073          	csrw	pmpcfg0,a5
    80002d34:	f14027f3          	csrr	a5,mhartid
    80002d38:	0200c737          	lui	a4,0x200c
    80002d3c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002d40:	0007869b          	sext.w	a3,a5
    80002d44:	00269713          	slli	a4,a3,0x2
    80002d48:	000f4637          	lui	a2,0xf4
    80002d4c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002d50:	00d70733          	add	a4,a4,a3
    80002d54:	0037979b          	slliw	a5,a5,0x3
    80002d58:	020046b7          	lui	a3,0x2004
    80002d5c:	00d787b3          	add	a5,a5,a3
    80002d60:	00c585b3          	add	a1,a1,a2
    80002d64:	00371693          	slli	a3,a4,0x3
    80002d68:	00003717          	auipc	a4,0x3
    80002d6c:	47870713          	addi	a4,a4,1144 # 800061e0 <timer_scratch>
    80002d70:	00b7b023          	sd	a1,0(a5)
    80002d74:	00d70733          	add	a4,a4,a3
    80002d78:	00f73c23          	sd	a5,24(a4)
    80002d7c:	02c73023          	sd	a2,32(a4)
    80002d80:	34071073          	csrw	mscratch,a4
    80002d84:	00000797          	auipc	a5,0x0
    80002d88:	6ec78793          	addi	a5,a5,1772 # 80003470 <timervec>
    80002d8c:	30579073          	csrw	mtvec,a5
    80002d90:	300027f3          	csrr	a5,mstatus
    80002d94:	0087e793          	ori	a5,a5,8
    80002d98:	30079073          	csrw	mstatus,a5
    80002d9c:	304027f3          	csrr	a5,mie
    80002da0:	0807e793          	ori	a5,a5,128
    80002da4:	30479073          	csrw	mie,a5
    80002da8:	f14027f3          	csrr	a5,mhartid
    80002dac:	0007879b          	sext.w	a5,a5
    80002db0:	00078213          	mv	tp,a5
    80002db4:	30200073          	mret
    80002db8:	00813403          	ld	s0,8(sp)
    80002dbc:	01010113          	addi	sp,sp,16
    80002dc0:	00008067          	ret

0000000080002dc4 <timerinit>:
    80002dc4:	ff010113          	addi	sp,sp,-16
    80002dc8:	00813423          	sd	s0,8(sp)
    80002dcc:	01010413          	addi	s0,sp,16
    80002dd0:	f14027f3          	csrr	a5,mhartid
    80002dd4:	0200c737          	lui	a4,0x200c
    80002dd8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002ddc:	0007869b          	sext.w	a3,a5
    80002de0:	00269713          	slli	a4,a3,0x2
    80002de4:	000f4637          	lui	a2,0xf4
    80002de8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002dec:	00d70733          	add	a4,a4,a3
    80002df0:	0037979b          	slliw	a5,a5,0x3
    80002df4:	020046b7          	lui	a3,0x2004
    80002df8:	00d787b3          	add	a5,a5,a3
    80002dfc:	00c585b3          	add	a1,a1,a2
    80002e00:	00371693          	slli	a3,a4,0x3
    80002e04:	00003717          	auipc	a4,0x3
    80002e08:	3dc70713          	addi	a4,a4,988 # 800061e0 <timer_scratch>
    80002e0c:	00b7b023          	sd	a1,0(a5)
    80002e10:	00d70733          	add	a4,a4,a3
    80002e14:	00f73c23          	sd	a5,24(a4)
    80002e18:	02c73023          	sd	a2,32(a4)
    80002e1c:	34071073          	csrw	mscratch,a4
    80002e20:	00000797          	auipc	a5,0x0
    80002e24:	65078793          	addi	a5,a5,1616 # 80003470 <timervec>
    80002e28:	30579073          	csrw	mtvec,a5
    80002e2c:	300027f3          	csrr	a5,mstatus
    80002e30:	0087e793          	ori	a5,a5,8
    80002e34:	30079073          	csrw	mstatus,a5
    80002e38:	304027f3          	csrr	a5,mie
    80002e3c:	0807e793          	ori	a5,a5,128
    80002e40:	30479073          	csrw	mie,a5
    80002e44:	00813403          	ld	s0,8(sp)
    80002e48:	01010113          	addi	sp,sp,16
    80002e4c:	00008067          	ret

0000000080002e50 <system_main>:
    80002e50:	fe010113          	addi	sp,sp,-32
    80002e54:	00813823          	sd	s0,16(sp)
    80002e58:	00913423          	sd	s1,8(sp)
    80002e5c:	00113c23          	sd	ra,24(sp)
    80002e60:	02010413          	addi	s0,sp,32
    80002e64:	00000097          	auipc	ra,0x0
    80002e68:	0c4080e7          	jalr	196(ra) # 80002f28 <cpuid>
    80002e6c:	00003497          	auipc	s1,0x3
    80002e70:	30448493          	addi	s1,s1,772 # 80006170 <started>
    80002e74:	02050263          	beqz	a0,80002e98 <system_main+0x48>
    80002e78:	0004a783          	lw	a5,0(s1)
    80002e7c:	0007879b          	sext.w	a5,a5
    80002e80:	fe078ce3          	beqz	a5,80002e78 <system_main+0x28>
    80002e84:	0ff0000f          	fence
    80002e88:	00002517          	auipc	a0,0x2
    80002e8c:	3f050513          	addi	a0,a0,1008 # 80005278 <CONSOLE_STATUS+0x268>
    80002e90:	00001097          	auipc	ra,0x1
    80002e94:	a7c080e7          	jalr	-1412(ra) # 8000390c <panic>
    80002e98:	00001097          	auipc	ra,0x1
    80002e9c:	9d0080e7          	jalr	-1584(ra) # 80003868 <consoleinit>
    80002ea0:	00001097          	auipc	ra,0x1
    80002ea4:	15c080e7          	jalr	348(ra) # 80003ffc <printfinit>
    80002ea8:	00002517          	auipc	a0,0x2
    80002eac:	4b050513          	addi	a0,a0,1200 # 80005358 <CONSOLE_STATUS+0x348>
    80002eb0:	00001097          	auipc	ra,0x1
    80002eb4:	ab8080e7          	jalr	-1352(ra) # 80003968 <__printf>
    80002eb8:	00002517          	auipc	a0,0x2
    80002ebc:	39050513          	addi	a0,a0,912 # 80005248 <CONSOLE_STATUS+0x238>
    80002ec0:	00001097          	auipc	ra,0x1
    80002ec4:	aa8080e7          	jalr	-1368(ra) # 80003968 <__printf>
    80002ec8:	00002517          	auipc	a0,0x2
    80002ecc:	49050513          	addi	a0,a0,1168 # 80005358 <CONSOLE_STATUS+0x348>
    80002ed0:	00001097          	auipc	ra,0x1
    80002ed4:	a98080e7          	jalr	-1384(ra) # 80003968 <__printf>
    80002ed8:	00001097          	auipc	ra,0x1
    80002edc:	4b0080e7          	jalr	1200(ra) # 80004388 <kinit>
    80002ee0:	00000097          	auipc	ra,0x0
    80002ee4:	148080e7          	jalr	328(ra) # 80003028 <trapinit>
    80002ee8:	00000097          	auipc	ra,0x0
    80002eec:	16c080e7          	jalr	364(ra) # 80003054 <trapinithart>
    80002ef0:	00000097          	auipc	ra,0x0
    80002ef4:	5c0080e7          	jalr	1472(ra) # 800034b0 <plicinit>
    80002ef8:	00000097          	auipc	ra,0x0
    80002efc:	5e0080e7          	jalr	1504(ra) # 800034d8 <plicinithart>
    80002f00:	00000097          	auipc	ra,0x0
    80002f04:	078080e7          	jalr	120(ra) # 80002f78 <userinit>
    80002f08:	0ff0000f          	fence
    80002f0c:	00100793          	li	a5,1
    80002f10:	00002517          	auipc	a0,0x2
    80002f14:	35050513          	addi	a0,a0,848 # 80005260 <CONSOLE_STATUS+0x250>
    80002f18:	00f4a023          	sw	a5,0(s1)
    80002f1c:	00001097          	auipc	ra,0x1
    80002f20:	a4c080e7          	jalr	-1460(ra) # 80003968 <__printf>
    80002f24:	0000006f          	j	80002f24 <system_main+0xd4>

0000000080002f28 <cpuid>:
    80002f28:	ff010113          	addi	sp,sp,-16
    80002f2c:	00813423          	sd	s0,8(sp)
    80002f30:	01010413          	addi	s0,sp,16
    80002f34:	00020513          	mv	a0,tp
    80002f38:	00813403          	ld	s0,8(sp)
    80002f3c:	0005051b          	sext.w	a0,a0
    80002f40:	01010113          	addi	sp,sp,16
    80002f44:	00008067          	ret

0000000080002f48 <mycpu>:
    80002f48:	ff010113          	addi	sp,sp,-16
    80002f4c:	00813423          	sd	s0,8(sp)
    80002f50:	01010413          	addi	s0,sp,16
    80002f54:	00020793          	mv	a5,tp
    80002f58:	00813403          	ld	s0,8(sp)
    80002f5c:	0007879b          	sext.w	a5,a5
    80002f60:	00779793          	slli	a5,a5,0x7
    80002f64:	00004517          	auipc	a0,0x4
    80002f68:	2ac50513          	addi	a0,a0,684 # 80007210 <cpus>
    80002f6c:	00f50533          	add	a0,a0,a5
    80002f70:	01010113          	addi	sp,sp,16
    80002f74:	00008067          	ret

0000000080002f78 <userinit>:
    80002f78:	ff010113          	addi	sp,sp,-16
    80002f7c:	00813423          	sd	s0,8(sp)
    80002f80:	01010413          	addi	s0,sp,16
    80002f84:	00813403          	ld	s0,8(sp)
    80002f88:	01010113          	addi	sp,sp,16
    80002f8c:	ffffe317          	auipc	t1,0xffffe
    80002f90:	7b030067          	jr	1968(t1) # 8000173c <main>

0000000080002f94 <either_copyout>:
    80002f94:	ff010113          	addi	sp,sp,-16
    80002f98:	00813023          	sd	s0,0(sp)
    80002f9c:	00113423          	sd	ra,8(sp)
    80002fa0:	01010413          	addi	s0,sp,16
    80002fa4:	02051663          	bnez	a0,80002fd0 <either_copyout+0x3c>
    80002fa8:	00058513          	mv	a0,a1
    80002fac:	00060593          	mv	a1,a2
    80002fb0:	0006861b          	sext.w	a2,a3
    80002fb4:	00002097          	auipc	ra,0x2
    80002fb8:	c60080e7          	jalr	-928(ra) # 80004c14 <__memmove>
    80002fbc:	00813083          	ld	ra,8(sp)
    80002fc0:	00013403          	ld	s0,0(sp)
    80002fc4:	00000513          	li	a0,0
    80002fc8:	01010113          	addi	sp,sp,16
    80002fcc:	00008067          	ret
    80002fd0:	00002517          	auipc	a0,0x2
    80002fd4:	2d050513          	addi	a0,a0,720 # 800052a0 <CONSOLE_STATUS+0x290>
    80002fd8:	00001097          	auipc	ra,0x1
    80002fdc:	934080e7          	jalr	-1740(ra) # 8000390c <panic>

0000000080002fe0 <either_copyin>:
    80002fe0:	ff010113          	addi	sp,sp,-16
    80002fe4:	00813023          	sd	s0,0(sp)
    80002fe8:	00113423          	sd	ra,8(sp)
    80002fec:	01010413          	addi	s0,sp,16
    80002ff0:	02059463          	bnez	a1,80003018 <either_copyin+0x38>
    80002ff4:	00060593          	mv	a1,a2
    80002ff8:	0006861b          	sext.w	a2,a3
    80002ffc:	00002097          	auipc	ra,0x2
    80003000:	c18080e7          	jalr	-1000(ra) # 80004c14 <__memmove>
    80003004:	00813083          	ld	ra,8(sp)
    80003008:	00013403          	ld	s0,0(sp)
    8000300c:	00000513          	li	a0,0
    80003010:	01010113          	addi	sp,sp,16
    80003014:	00008067          	ret
    80003018:	00002517          	auipc	a0,0x2
    8000301c:	2b050513          	addi	a0,a0,688 # 800052c8 <CONSOLE_STATUS+0x2b8>
    80003020:	00001097          	auipc	ra,0x1
    80003024:	8ec080e7          	jalr	-1812(ra) # 8000390c <panic>

0000000080003028 <trapinit>:
    80003028:	ff010113          	addi	sp,sp,-16
    8000302c:	00813423          	sd	s0,8(sp)
    80003030:	01010413          	addi	s0,sp,16
    80003034:	00813403          	ld	s0,8(sp)
    80003038:	00002597          	auipc	a1,0x2
    8000303c:	2b858593          	addi	a1,a1,696 # 800052f0 <CONSOLE_STATUS+0x2e0>
    80003040:	00004517          	auipc	a0,0x4
    80003044:	25050513          	addi	a0,a0,592 # 80007290 <tickslock>
    80003048:	01010113          	addi	sp,sp,16
    8000304c:	00001317          	auipc	t1,0x1
    80003050:	5cc30067          	jr	1484(t1) # 80004618 <initlock>

0000000080003054 <trapinithart>:
    80003054:	ff010113          	addi	sp,sp,-16
    80003058:	00813423          	sd	s0,8(sp)
    8000305c:	01010413          	addi	s0,sp,16
    80003060:	00000797          	auipc	a5,0x0
    80003064:	30078793          	addi	a5,a5,768 # 80003360 <kernelvec>
    80003068:	10579073          	csrw	stvec,a5
    8000306c:	00813403          	ld	s0,8(sp)
    80003070:	01010113          	addi	sp,sp,16
    80003074:	00008067          	ret

0000000080003078 <usertrap>:
    80003078:	ff010113          	addi	sp,sp,-16
    8000307c:	00813423          	sd	s0,8(sp)
    80003080:	01010413          	addi	s0,sp,16
    80003084:	00813403          	ld	s0,8(sp)
    80003088:	01010113          	addi	sp,sp,16
    8000308c:	00008067          	ret

0000000080003090 <usertrapret>:
    80003090:	ff010113          	addi	sp,sp,-16
    80003094:	00813423          	sd	s0,8(sp)
    80003098:	01010413          	addi	s0,sp,16
    8000309c:	00813403          	ld	s0,8(sp)
    800030a0:	01010113          	addi	sp,sp,16
    800030a4:	00008067          	ret

00000000800030a8 <kerneltrap>:
    800030a8:	fe010113          	addi	sp,sp,-32
    800030ac:	00813823          	sd	s0,16(sp)
    800030b0:	00113c23          	sd	ra,24(sp)
    800030b4:	00913423          	sd	s1,8(sp)
    800030b8:	02010413          	addi	s0,sp,32
    800030bc:	142025f3          	csrr	a1,scause
    800030c0:	100027f3          	csrr	a5,sstatus
    800030c4:	0027f793          	andi	a5,a5,2
    800030c8:	10079c63          	bnez	a5,800031e0 <kerneltrap+0x138>
    800030cc:	142027f3          	csrr	a5,scause
    800030d0:	0207ce63          	bltz	a5,8000310c <kerneltrap+0x64>
    800030d4:	00002517          	auipc	a0,0x2
    800030d8:	26450513          	addi	a0,a0,612 # 80005338 <CONSOLE_STATUS+0x328>
    800030dc:	00001097          	auipc	ra,0x1
    800030e0:	88c080e7          	jalr	-1908(ra) # 80003968 <__printf>
    800030e4:	141025f3          	csrr	a1,sepc
    800030e8:	14302673          	csrr	a2,stval
    800030ec:	00002517          	auipc	a0,0x2
    800030f0:	25c50513          	addi	a0,a0,604 # 80005348 <CONSOLE_STATUS+0x338>
    800030f4:	00001097          	auipc	ra,0x1
    800030f8:	874080e7          	jalr	-1932(ra) # 80003968 <__printf>
    800030fc:	00002517          	auipc	a0,0x2
    80003100:	26450513          	addi	a0,a0,612 # 80005360 <CONSOLE_STATUS+0x350>
    80003104:	00001097          	auipc	ra,0x1
    80003108:	808080e7          	jalr	-2040(ra) # 8000390c <panic>
    8000310c:	0ff7f713          	andi	a4,a5,255
    80003110:	00900693          	li	a3,9
    80003114:	04d70063          	beq	a4,a3,80003154 <kerneltrap+0xac>
    80003118:	fff00713          	li	a4,-1
    8000311c:	03f71713          	slli	a4,a4,0x3f
    80003120:	00170713          	addi	a4,a4,1
    80003124:	fae798e3          	bne	a5,a4,800030d4 <kerneltrap+0x2c>
    80003128:	00000097          	auipc	ra,0x0
    8000312c:	e00080e7          	jalr	-512(ra) # 80002f28 <cpuid>
    80003130:	06050663          	beqz	a0,8000319c <kerneltrap+0xf4>
    80003134:	144027f3          	csrr	a5,sip
    80003138:	ffd7f793          	andi	a5,a5,-3
    8000313c:	14479073          	csrw	sip,a5
    80003140:	01813083          	ld	ra,24(sp)
    80003144:	01013403          	ld	s0,16(sp)
    80003148:	00813483          	ld	s1,8(sp)
    8000314c:	02010113          	addi	sp,sp,32
    80003150:	00008067          	ret
    80003154:	00000097          	auipc	ra,0x0
    80003158:	3d0080e7          	jalr	976(ra) # 80003524 <plic_claim>
    8000315c:	00a00793          	li	a5,10
    80003160:	00050493          	mv	s1,a0
    80003164:	06f50863          	beq	a0,a5,800031d4 <kerneltrap+0x12c>
    80003168:	fc050ce3          	beqz	a0,80003140 <kerneltrap+0x98>
    8000316c:	00050593          	mv	a1,a0
    80003170:	00002517          	auipc	a0,0x2
    80003174:	1a850513          	addi	a0,a0,424 # 80005318 <CONSOLE_STATUS+0x308>
    80003178:	00000097          	auipc	ra,0x0
    8000317c:	7f0080e7          	jalr	2032(ra) # 80003968 <__printf>
    80003180:	01013403          	ld	s0,16(sp)
    80003184:	01813083          	ld	ra,24(sp)
    80003188:	00048513          	mv	a0,s1
    8000318c:	00813483          	ld	s1,8(sp)
    80003190:	02010113          	addi	sp,sp,32
    80003194:	00000317          	auipc	t1,0x0
    80003198:	3c830067          	jr	968(t1) # 8000355c <plic_complete>
    8000319c:	00004517          	auipc	a0,0x4
    800031a0:	0f450513          	addi	a0,a0,244 # 80007290 <tickslock>
    800031a4:	00001097          	auipc	ra,0x1
    800031a8:	498080e7          	jalr	1176(ra) # 8000463c <acquire>
    800031ac:	00003717          	auipc	a4,0x3
    800031b0:	fc870713          	addi	a4,a4,-56 # 80006174 <ticks>
    800031b4:	00072783          	lw	a5,0(a4)
    800031b8:	00004517          	auipc	a0,0x4
    800031bc:	0d850513          	addi	a0,a0,216 # 80007290 <tickslock>
    800031c0:	0017879b          	addiw	a5,a5,1
    800031c4:	00f72023          	sw	a5,0(a4)
    800031c8:	00001097          	auipc	ra,0x1
    800031cc:	540080e7          	jalr	1344(ra) # 80004708 <release>
    800031d0:	f65ff06f          	j	80003134 <kerneltrap+0x8c>
    800031d4:	00001097          	auipc	ra,0x1
    800031d8:	09c080e7          	jalr	156(ra) # 80004270 <uartintr>
    800031dc:	fa5ff06f          	j	80003180 <kerneltrap+0xd8>
    800031e0:	00002517          	auipc	a0,0x2
    800031e4:	11850513          	addi	a0,a0,280 # 800052f8 <CONSOLE_STATUS+0x2e8>
    800031e8:	00000097          	auipc	ra,0x0
    800031ec:	724080e7          	jalr	1828(ra) # 8000390c <panic>

00000000800031f0 <clockintr>:
    800031f0:	fe010113          	addi	sp,sp,-32
    800031f4:	00813823          	sd	s0,16(sp)
    800031f8:	00913423          	sd	s1,8(sp)
    800031fc:	00113c23          	sd	ra,24(sp)
    80003200:	02010413          	addi	s0,sp,32
    80003204:	00004497          	auipc	s1,0x4
    80003208:	08c48493          	addi	s1,s1,140 # 80007290 <tickslock>
    8000320c:	00048513          	mv	a0,s1
    80003210:	00001097          	auipc	ra,0x1
    80003214:	42c080e7          	jalr	1068(ra) # 8000463c <acquire>
    80003218:	00003717          	auipc	a4,0x3
    8000321c:	f5c70713          	addi	a4,a4,-164 # 80006174 <ticks>
    80003220:	00072783          	lw	a5,0(a4)
    80003224:	01013403          	ld	s0,16(sp)
    80003228:	01813083          	ld	ra,24(sp)
    8000322c:	00048513          	mv	a0,s1
    80003230:	0017879b          	addiw	a5,a5,1
    80003234:	00813483          	ld	s1,8(sp)
    80003238:	00f72023          	sw	a5,0(a4)
    8000323c:	02010113          	addi	sp,sp,32
    80003240:	00001317          	auipc	t1,0x1
    80003244:	4c830067          	jr	1224(t1) # 80004708 <release>

0000000080003248 <devintr>:
    80003248:	142027f3          	csrr	a5,scause
    8000324c:	00000513          	li	a0,0
    80003250:	0007c463          	bltz	a5,80003258 <devintr+0x10>
    80003254:	00008067          	ret
    80003258:	fe010113          	addi	sp,sp,-32
    8000325c:	00813823          	sd	s0,16(sp)
    80003260:	00113c23          	sd	ra,24(sp)
    80003264:	00913423          	sd	s1,8(sp)
    80003268:	02010413          	addi	s0,sp,32
    8000326c:	0ff7f713          	andi	a4,a5,255
    80003270:	00900693          	li	a3,9
    80003274:	04d70c63          	beq	a4,a3,800032cc <devintr+0x84>
    80003278:	fff00713          	li	a4,-1
    8000327c:	03f71713          	slli	a4,a4,0x3f
    80003280:	00170713          	addi	a4,a4,1
    80003284:	00e78c63          	beq	a5,a4,8000329c <devintr+0x54>
    80003288:	01813083          	ld	ra,24(sp)
    8000328c:	01013403          	ld	s0,16(sp)
    80003290:	00813483          	ld	s1,8(sp)
    80003294:	02010113          	addi	sp,sp,32
    80003298:	00008067          	ret
    8000329c:	00000097          	auipc	ra,0x0
    800032a0:	c8c080e7          	jalr	-884(ra) # 80002f28 <cpuid>
    800032a4:	06050663          	beqz	a0,80003310 <devintr+0xc8>
    800032a8:	144027f3          	csrr	a5,sip
    800032ac:	ffd7f793          	andi	a5,a5,-3
    800032b0:	14479073          	csrw	sip,a5
    800032b4:	01813083          	ld	ra,24(sp)
    800032b8:	01013403          	ld	s0,16(sp)
    800032bc:	00813483          	ld	s1,8(sp)
    800032c0:	00200513          	li	a0,2
    800032c4:	02010113          	addi	sp,sp,32
    800032c8:	00008067          	ret
    800032cc:	00000097          	auipc	ra,0x0
    800032d0:	258080e7          	jalr	600(ra) # 80003524 <plic_claim>
    800032d4:	00a00793          	li	a5,10
    800032d8:	00050493          	mv	s1,a0
    800032dc:	06f50663          	beq	a0,a5,80003348 <devintr+0x100>
    800032e0:	00100513          	li	a0,1
    800032e4:	fa0482e3          	beqz	s1,80003288 <devintr+0x40>
    800032e8:	00048593          	mv	a1,s1
    800032ec:	00002517          	auipc	a0,0x2
    800032f0:	02c50513          	addi	a0,a0,44 # 80005318 <CONSOLE_STATUS+0x308>
    800032f4:	00000097          	auipc	ra,0x0
    800032f8:	674080e7          	jalr	1652(ra) # 80003968 <__printf>
    800032fc:	00048513          	mv	a0,s1
    80003300:	00000097          	auipc	ra,0x0
    80003304:	25c080e7          	jalr	604(ra) # 8000355c <plic_complete>
    80003308:	00100513          	li	a0,1
    8000330c:	f7dff06f          	j	80003288 <devintr+0x40>
    80003310:	00004517          	auipc	a0,0x4
    80003314:	f8050513          	addi	a0,a0,-128 # 80007290 <tickslock>
    80003318:	00001097          	auipc	ra,0x1
    8000331c:	324080e7          	jalr	804(ra) # 8000463c <acquire>
    80003320:	00003717          	auipc	a4,0x3
    80003324:	e5470713          	addi	a4,a4,-428 # 80006174 <ticks>
    80003328:	00072783          	lw	a5,0(a4)
    8000332c:	00004517          	auipc	a0,0x4
    80003330:	f6450513          	addi	a0,a0,-156 # 80007290 <tickslock>
    80003334:	0017879b          	addiw	a5,a5,1
    80003338:	00f72023          	sw	a5,0(a4)
    8000333c:	00001097          	auipc	ra,0x1
    80003340:	3cc080e7          	jalr	972(ra) # 80004708 <release>
    80003344:	f65ff06f          	j	800032a8 <devintr+0x60>
    80003348:	00001097          	auipc	ra,0x1
    8000334c:	f28080e7          	jalr	-216(ra) # 80004270 <uartintr>
    80003350:	fadff06f          	j	800032fc <devintr+0xb4>
	...

0000000080003360 <kernelvec>:
    80003360:	f0010113          	addi	sp,sp,-256
    80003364:	00113023          	sd	ra,0(sp)
    80003368:	00213423          	sd	sp,8(sp)
    8000336c:	00313823          	sd	gp,16(sp)
    80003370:	00413c23          	sd	tp,24(sp)
    80003374:	02513023          	sd	t0,32(sp)
    80003378:	02613423          	sd	t1,40(sp)
    8000337c:	02713823          	sd	t2,48(sp)
    80003380:	02813c23          	sd	s0,56(sp)
    80003384:	04913023          	sd	s1,64(sp)
    80003388:	04a13423          	sd	a0,72(sp)
    8000338c:	04b13823          	sd	a1,80(sp)
    80003390:	04c13c23          	sd	a2,88(sp)
    80003394:	06d13023          	sd	a3,96(sp)
    80003398:	06e13423          	sd	a4,104(sp)
    8000339c:	06f13823          	sd	a5,112(sp)
    800033a0:	07013c23          	sd	a6,120(sp)
    800033a4:	09113023          	sd	a7,128(sp)
    800033a8:	09213423          	sd	s2,136(sp)
    800033ac:	09313823          	sd	s3,144(sp)
    800033b0:	09413c23          	sd	s4,152(sp)
    800033b4:	0b513023          	sd	s5,160(sp)
    800033b8:	0b613423          	sd	s6,168(sp)
    800033bc:	0b713823          	sd	s7,176(sp)
    800033c0:	0b813c23          	sd	s8,184(sp)
    800033c4:	0d913023          	sd	s9,192(sp)
    800033c8:	0da13423          	sd	s10,200(sp)
    800033cc:	0db13823          	sd	s11,208(sp)
    800033d0:	0dc13c23          	sd	t3,216(sp)
    800033d4:	0fd13023          	sd	t4,224(sp)
    800033d8:	0fe13423          	sd	t5,232(sp)
    800033dc:	0ff13823          	sd	t6,240(sp)
    800033e0:	cc9ff0ef          	jal	ra,800030a8 <kerneltrap>
    800033e4:	00013083          	ld	ra,0(sp)
    800033e8:	00813103          	ld	sp,8(sp)
    800033ec:	01013183          	ld	gp,16(sp)
    800033f0:	02013283          	ld	t0,32(sp)
    800033f4:	02813303          	ld	t1,40(sp)
    800033f8:	03013383          	ld	t2,48(sp)
    800033fc:	03813403          	ld	s0,56(sp)
    80003400:	04013483          	ld	s1,64(sp)
    80003404:	04813503          	ld	a0,72(sp)
    80003408:	05013583          	ld	a1,80(sp)
    8000340c:	05813603          	ld	a2,88(sp)
    80003410:	06013683          	ld	a3,96(sp)
    80003414:	06813703          	ld	a4,104(sp)
    80003418:	07013783          	ld	a5,112(sp)
    8000341c:	07813803          	ld	a6,120(sp)
    80003420:	08013883          	ld	a7,128(sp)
    80003424:	08813903          	ld	s2,136(sp)
    80003428:	09013983          	ld	s3,144(sp)
    8000342c:	09813a03          	ld	s4,152(sp)
    80003430:	0a013a83          	ld	s5,160(sp)
    80003434:	0a813b03          	ld	s6,168(sp)
    80003438:	0b013b83          	ld	s7,176(sp)
    8000343c:	0b813c03          	ld	s8,184(sp)
    80003440:	0c013c83          	ld	s9,192(sp)
    80003444:	0c813d03          	ld	s10,200(sp)
    80003448:	0d013d83          	ld	s11,208(sp)
    8000344c:	0d813e03          	ld	t3,216(sp)
    80003450:	0e013e83          	ld	t4,224(sp)
    80003454:	0e813f03          	ld	t5,232(sp)
    80003458:	0f013f83          	ld	t6,240(sp)
    8000345c:	10010113          	addi	sp,sp,256
    80003460:	10200073          	sret
    80003464:	00000013          	nop
    80003468:	00000013          	nop
    8000346c:	00000013          	nop

0000000080003470 <timervec>:
    80003470:	34051573          	csrrw	a0,mscratch,a0
    80003474:	00b53023          	sd	a1,0(a0)
    80003478:	00c53423          	sd	a2,8(a0)
    8000347c:	00d53823          	sd	a3,16(a0)
    80003480:	01853583          	ld	a1,24(a0)
    80003484:	02053603          	ld	a2,32(a0)
    80003488:	0005b683          	ld	a3,0(a1)
    8000348c:	00c686b3          	add	a3,a3,a2
    80003490:	00d5b023          	sd	a3,0(a1)
    80003494:	00200593          	li	a1,2
    80003498:	14459073          	csrw	sip,a1
    8000349c:	01053683          	ld	a3,16(a0)
    800034a0:	00853603          	ld	a2,8(a0)
    800034a4:	00053583          	ld	a1,0(a0)
    800034a8:	34051573          	csrrw	a0,mscratch,a0
    800034ac:	30200073          	mret

00000000800034b0 <plicinit>:
    800034b0:	ff010113          	addi	sp,sp,-16
    800034b4:	00813423          	sd	s0,8(sp)
    800034b8:	01010413          	addi	s0,sp,16
    800034bc:	00813403          	ld	s0,8(sp)
    800034c0:	0c0007b7          	lui	a5,0xc000
    800034c4:	00100713          	li	a4,1
    800034c8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800034cc:	00e7a223          	sw	a4,4(a5)
    800034d0:	01010113          	addi	sp,sp,16
    800034d4:	00008067          	ret

00000000800034d8 <plicinithart>:
    800034d8:	ff010113          	addi	sp,sp,-16
    800034dc:	00813023          	sd	s0,0(sp)
    800034e0:	00113423          	sd	ra,8(sp)
    800034e4:	01010413          	addi	s0,sp,16
    800034e8:	00000097          	auipc	ra,0x0
    800034ec:	a40080e7          	jalr	-1472(ra) # 80002f28 <cpuid>
    800034f0:	0085171b          	slliw	a4,a0,0x8
    800034f4:	0c0027b7          	lui	a5,0xc002
    800034f8:	00e787b3          	add	a5,a5,a4
    800034fc:	40200713          	li	a4,1026
    80003500:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80003504:	00813083          	ld	ra,8(sp)
    80003508:	00013403          	ld	s0,0(sp)
    8000350c:	00d5151b          	slliw	a0,a0,0xd
    80003510:	0c2017b7          	lui	a5,0xc201
    80003514:	00a78533          	add	a0,a5,a0
    80003518:	00052023          	sw	zero,0(a0)
    8000351c:	01010113          	addi	sp,sp,16
    80003520:	00008067          	ret

0000000080003524 <plic_claim>:
    80003524:	ff010113          	addi	sp,sp,-16
    80003528:	00813023          	sd	s0,0(sp)
    8000352c:	00113423          	sd	ra,8(sp)
    80003530:	01010413          	addi	s0,sp,16
    80003534:	00000097          	auipc	ra,0x0
    80003538:	9f4080e7          	jalr	-1548(ra) # 80002f28 <cpuid>
    8000353c:	00813083          	ld	ra,8(sp)
    80003540:	00013403          	ld	s0,0(sp)
    80003544:	00d5151b          	slliw	a0,a0,0xd
    80003548:	0c2017b7          	lui	a5,0xc201
    8000354c:	00a78533          	add	a0,a5,a0
    80003550:	00452503          	lw	a0,4(a0)
    80003554:	01010113          	addi	sp,sp,16
    80003558:	00008067          	ret

000000008000355c <plic_complete>:
    8000355c:	fe010113          	addi	sp,sp,-32
    80003560:	00813823          	sd	s0,16(sp)
    80003564:	00913423          	sd	s1,8(sp)
    80003568:	00113c23          	sd	ra,24(sp)
    8000356c:	02010413          	addi	s0,sp,32
    80003570:	00050493          	mv	s1,a0
    80003574:	00000097          	auipc	ra,0x0
    80003578:	9b4080e7          	jalr	-1612(ra) # 80002f28 <cpuid>
    8000357c:	01813083          	ld	ra,24(sp)
    80003580:	01013403          	ld	s0,16(sp)
    80003584:	00d5179b          	slliw	a5,a0,0xd
    80003588:	0c201737          	lui	a4,0xc201
    8000358c:	00f707b3          	add	a5,a4,a5
    80003590:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80003594:	00813483          	ld	s1,8(sp)
    80003598:	02010113          	addi	sp,sp,32
    8000359c:	00008067          	ret

00000000800035a0 <consolewrite>:
    800035a0:	fb010113          	addi	sp,sp,-80
    800035a4:	04813023          	sd	s0,64(sp)
    800035a8:	04113423          	sd	ra,72(sp)
    800035ac:	02913c23          	sd	s1,56(sp)
    800035b0:	03213823          	sd	s2,48(sp)
    800035b4:	03313423          	sd	s3,40(sp)
    800035b8:	03413023          	sd	s4,32(sp)
    800035bc:	01513c23          	sd	s5,24(sp)
    800035c0:	05010413          	addi	s0,sp,80
    800035c4:	06c05c63          	blez	a2,8000363c <consolewrite+0x9c>
    800035c8:	00060993          	mv	s3,a2
    800035cc:	00050a13          	mv	s4,a0
    800035d0:	00058493          	mv	s1,a1
    800035d4:	00000913          	li	s2,0
    800035d8:	fff00a93          	li	s5,-1
    800035dc:	01c0006f          	j	800035f8 <consolewrite+0x58>
    800035e0:	fbf44503          	lbu	a0,-65(s0)
    800035e4:	0019091b          	addiw	s2,s2,1
    800035e8:	00148493          	addi	s1,s1,1
    800035ec:	00001097          	auipc	ra,0x1
    800035f0:	a9c080e7          	jalr	-1380(ra) # 80004088 <uartputc>
    800035f4:	03298063          	beq	s3,s2,80003614 <consolewrite+0x74>
    800035f8:	00048613          	mv	a2,s1
    800035fc:	00100693          	li	a3,1
    80003600:	000a0593          	mv	a1,s4
    80003604:	fbf40513          	addi	a0,s0,-65
    80003608:	00000097          	auipc	ra,0x0
    8000360c:	9d8080e7          	jalr	-1576(ra) # 80002fe0 <either_copyin>
    80003610:	fd5518e3          	bne	a0,s5,800035e0 <consolewrite+0x40>
    80003614:	04813083          	ld	ra,72(sp)
    80003618:	04013403          	ld	s0,64(sp)
    8000361c:	03813483          	ld	s1,56(sp)
    80003620:	02813983          	ld	s3,40(sp)
    80003624:	02013a03          	ld	s4,32(sp)
    80003628:	01813a83          	ld	s5,24(sp)
    8000362c:	00090513          	mv	a0,s2
    80003630:	03013903          	ld	s2,48(sp)
    80003634:	05010113          	addi	sp,sp,80
    80003638:	00008067          	ret
    8000363c:	00000913          	li	s2,0
    80003640:	fd5ff06f          	j	80003614 <consolewrite+0x74>

0000000080003644 <consoleread>:
    80003644:	f9010113          	addi	sp,sp,-112
    80003648:	06813023          	sd	s0,96(sp)
    8000364c:	04913c23          	sd	s1,88(sp)
    80003650:	05213823          	sd	s2,80(sp)
    80003654:	05313423          	sd	s3,72(sp)
    80003658:	05413023          	sd	s4,64(sp)
    8000365c:	03513c23          	sd	s5,56(sp)
    80003660:	03613823          	sd	s6,48(sp)
    80003664:	03713423          	sd	s7,40(sp)
    80003668:	03813023          	sd	s8,32(sp)
    8000366c:	06113423          	sd	ra,104(sp)
    80003670:	01913c23          	sd	s9,24(sp)
    80003674:	07010413          	addi	s0,sp,112
    80003678:	00060b93          	mv	s7,a2
    8000367c:	00050913          	mv	s2,a0
    80003680:	00058c13          	mv	s8,a1
    80003684:	00060b1b          	sext.w	s6,a2
    80003688:	00004497          	auipc	s1,0x4
    8000368c:	c3048493          	addi	s1,s1,-976 # 800072b8 <cons>
    80003690:	00400993          	li	s3,4
    80003694:	fff00a13          	li	s4,-1
    80003698:	00a00a93          	li	s5,10
    8000369c:	05705e63          	blez	s7,800036f8 <consoleread+0xb4>
    800036a0:	09c4a703          	lw	a4,156(s1)
    800036a4:	0984a783          	lw	a5,152(s1)
    800036a8:	0007071b          	sext.w	a4,a4
    800036ac:	08e78463          	beq	a5,a4,80003734 <consoleread+0xf0>
    800036b0:	07f7f713          	andi	a4,a5,127
    800036b4:	00e48733          	add	a4,s1,a4
    800036b8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800036bc:	0017869b          	addiw	a3,a5,1
    800036c0:	08d4ac23          	sw	a3,152(s1)
    800036c4:	00070c9b          	sext.w	s9,a4
    800036c8:	0b370663          	beq	a4,s3,80003774 <consoleread+0x130>
    800036cc:	00100693          	li	a3,1
    800036d0:	f9f40613          	addi	a2,s0,-97
    800036d4:	000c0593          	mv	a1,s8
    800036d8:	00090513          	mv	a0,s2
    800036dc:	f8e40fa3          	sb	a4,-97(s0)
    800036e0:	00000097          	auipc	ra,0x0
    800036e4:	8b4080e7          	jalr	-1868(ra) # 80002f94 <either_copyout>
    800036e8:	01450863          	beq	a0,s4,800036f8 <consoleread+0xb4>
    800036ec:	001c0c13          	addi	s8,s8,1
    800036f0:	fffb8b9b          	addiw	s7,s7,-1
    800036f4:	fb5c94e3          	bne	s9,s5,8000369c <consoleread+0x58>
    800036f8:	000b851b          	sext.w	a0,s7
    800036fc:	06813083          	ld	ra,104(sp)
    80003700:	06013403          	ld	s0,96(sp)
    80003704:	05813483          	ld	s1,88(sp)
    80003708:	05013903          	ld	s2,80(sp)
    8000370c:	04813983          	ld	s3,72(sp)
    80003710:	04013a03          	ld	s4,64(sp)
    80003714:	03813a83          	ld	s5,56(sp)
    80003718:	02813b83          	ld	s7,40(sp)
    8000371c:	02013c03          	ld	s8,32(sp)
    80003720:	01813c83          	ld	s9,24(sp)
    80003724:	40ab053b          	subw	a0,s6,a0
    80003728:	03013b03          	ld	s6,48(sp)
    8000372c:	07010113          	addi	sp,sp,112
    80003730:	00008067          	ret
    80003734:	00001097          	auipc	ra,0x1
    80003738:	1d8080e7          	jalr	472(ra) # 8000490c <push_on>
    8000373c:	0984a703          	lw	a4,152(s1)
    80003740:	09c4a783          	lw	a5,156(s1)
    80003744:	0007879b          	sext.w	a5,a5
    80003748:	fef70ce3          	beq	a4,a5,80003740 <consoleread+0xfc>
    8000374c:	00001097          	auipc	ra,0x1
    80003750:	234080e7          	jalr	564(ra) # 80004980 <pop_on>
    80003754:	0984a783          	lw	a5,152(s1)
    80003758:	07f7f713          	andi	a4,a5,127
    8000375c:	00e48733          	add	a4,s1,a4
    80003760:	01874703          	lbu	a4,24(a4)
    80003764:	0017869b          	addiw	a3,a5,1
    80003768:	08d4ac23          	sw	a3,152(s1)
    8000376c:	00070c9b          	sext.w	s9,a4
    80003770:	f5371ee3          	bne	a4,s3,800036cc <consoleread+0x88>
    80003774:	000b851b          	sext.w	a0,s7
    80003778:	f96bf2e3          	bgeu	s7,s6,800036fc <consoleread+0xb8>
    8000377c:	08f4ac23          	sw	a5,152(s1)
    80003780:	f7dff06f          	j	800036fc <consoleread+0xb8>

0000000080003784 <consputc>:
    80003784:	10000793          	li	a5,256
    80003788:	00f50663          	beq	a0,a5,80003794 <consputc+0x10>
    8000378c:	00001317          	auipc	t1,0x1
    80003790:	9f430067          	jr	-1548(t1) # 80004180 <uartputc_sync>
    80003794:	ff010113          	addi	sp,sp,-16
    80003798:	00113423          	sd	ra,8(sp)
    8000379c:	00813023          	sd	s0,0(sp)
    800037a0:	01010413          	addi	s0,sp,16
    800037a4:	00800513          	li	a0,8
    800037a8:	00001097          	auipc	ra,0x1
    800037ac:	9d8080e7          	jalr	-1576(ra) # 80004180 <uartputc_sync>
    800037b0:	02000513          	li	a0,32
    800037b4:	00001097          	auipc	ra,0x1
    800037b8:	9cc080e7          	jalr	-1588(ra) # 80004180 <uartputc_sync>
    800037bc:	00013403          	ld	s0,0(sp)
    800037c0:	00813083          	ld	ra,8(sp)
    800037c4:	00800513          	li	a0,8
    800037c8:	01010113          	addi	sp,sp,16
    800037cc:	00001317          	auipc	t1,0x1
    800037d0:	9b430067          	jr	-1612(t1) # 80004180 <uartputc_sync>

00000000800037d4 <consoleintr>:
    800037d4:	fe010113          	addi	sp,sp,-32
    800037d8:	00813823          	sd	s0,16(sp)
    800037dc:	00913423          	sd	s1,8(sp)
    800037e0:	01213023          	sd	s2,0(sp)
    800037e4:	00113c23          	sd	ra,24(sp)
    800037e8:	02010413          	addi	s0,sp,32
    800037ec:	00004917          	auipc	s2,0x4
    800037f0:	acc90913          	addi	s2,s2,-1332 # 800072b8 <cons>
    800037f4:	00050493          	mv	s1,a0
    800037f8:	00090513          	mv	a0,s2
    800037fc:	00001097          	auipc	ra,0x1
    80003800:	e40080e7          	jalr	-448(ra) # 8000463c <acquire>
    80003804:	02048c63          	beqz	s1,8000383c <consoleintr+0x68>
    80003808:	0a092783          	lw	a5,160(s2)
    8000380c:	09892703          	lw	a4,152(s2)
    80003810:	07f00693          	li	a3,127
    80003814:	40e7873b          	subw	a4,a5,a4
    80003818:	02e6e263          	bltu	a3,a4,8000383c <consoleintr+0x68>
    8000381c:	00d00713          	li	a4,13
    80003820:	04e48063          	beq	s1,a4,80003860 <consoleintr+0x8c>
    80003824:	07f7f713          	andi	a4,a5,127
    80003828:	00e90733          	add	a4,s2,a4
    8000382c:	0017879b          	addiw	a5,a5,1
    80003830:	0af92023          	sw	a5,160(s2)
    80003834:	00970c23          	sb	s1,24(a4)
    80003838:	08f92e23          	sw	a5,156(s2)
    8000383c:	01013403          	ld	s0,16(sp)
    80003840:	01813083          	ld	ra,24(sp)
    80003844:	00813483          	ld	s1,8(sp)
    80003848:	00013903          	ld	s2,0(sp)
    8000384c:	00004517          	auipc	a0,0x4
    80003850:	a6c50513          	addi	a0,a0,-1428 # 800072b8 <cons>
    80003854:	02010113          	addi	sp,sp,32
    80003858:	00001317          	auipc	t1,0x1
    8000385c:	eb030067          	jr	-336(t1) # 80004708 <release>
    80003860:	00a00493          	li	s1,10
    80003864:	fc1ff06f          	j	80003824 <consoleintr+0x50>

0000000080003868 <consoleinit>:
    80003868:	fe010113          	addi	sp,sp,-32
    8000386c:	00113c23          	sd	ra,24(sp)
    80003870:	00813823          	sd	s0,16(sp)
    80003874:	00913423          	sd	s1,8(sp)
    80003878:	02010413          	addi	s0,sp,32
    8000387c:	00004497          	auipc	s1,0x4
    80003880:	a3c48493          	addi	s1,s1,-1476 # 800072b8 <cons>
    80003884:	00048513          	mv	a0,s1
    80003888:	00002597          	auipc	a1,0x2
    8000388c:	ae858593          	addi	a1,a1,-1304 # 80005370 <CONSOLE_STATUS+0x360>
    80003890:	00001097          	auipc	ra,0x1
    80003894:	d88080e7          	jalr	-632(ra) # 80004618 <initlock>
    80003898:	00000097          	auipc	ra,0x0
    8000389c:	7ac080e7          	jalr	1964(ra) # 80004044 <uartinit>
    800038a0:	01813083          	ld	ra,24(sp)
    800038a4:	01013403          	ld	s0,16(sp)
    800038a8:	00000797          	auipc	a5,0x0
    800038ac:	d9c78793          	addi	a5,a5,-612 # 80003644 <consoleread>
    800038b0:	0af4bc23          	sd	a5,184(s1)
    800038b4:	00000797          	auipc	a5,0x0
    800038b8:	cec78793          	addi	a5,a5,-788 # 800035a0 <consolewrite>
    800038bc:	0cf4b023          	sd	a5,192(s1)
    800038c0:	00813483          	ld	s1,8(sp)
    800038c4:	02010113          	addi	sp,sp,32
    800038c8:	00008067          	ret

00000000800038cc <console_read>:
    800038cc:	ff010113          	addi	sp,sp,-16
    800038d0:	00813423          	sd	s0,8(sp)
    800038d4:	01010413          	addi	s0,sp,16
    800038d8:	00813403          	ld	s0,8(sp)
    800038dc:	00004317          	auipc	t1,0x4
    800038e0:	a9433303          	ld	t1,-1388(t1) # 80007370 <devsw+0x10>
    800038e4:	01010113          	addi	sp,sp,16
    800038e8:	00030067          	jr	t1

00000000800038ec <console_write>:
    800038ec:	ff010113          	addi	sp,sp,-16
    800038f0:	00813423          	sd	s0,8(sp)
    800038f4:	01010413          	addi	s0,sp,16
    800038f8:	00813403          	ld	s0,8(sp)
    800038fc:	00004317          	auipc	t1,0x4
    80003900:	a7c33303          	ld	t1,-1412(t1) # 80007378 <devsw+0x18>
    80003904:	01010113          	addi	sp,sp,16
    80003908:	00030067          	jr	t1

000000008000390c <panic>:
    8000390c:	fe010113          	addi	sp,sp,-32
    80003910:	00113c23          	sd	ra,24(sp)
    80003914:	00813823          	sd	s0,16(sp)
    80003918:	00913423          	sd	s1,8(sp)
    8000391c:	02010413          	addi	s0,sp,32
    80003920:	00050493          	mv	s1,a0
    80003924:	00002517          	auipc	a0,0x2
    80003928:	a5450513          	addi	a0,a0,-1452 # 80005378 <CONSOLE_STATUS+0x368>
    8000392c:	00004797          	auipc	a5,0x4
    80003930:	ae07a623          	sw	zero,-1300(a5) # 80007418 <pr+0x18>
    80003934:	00000097          	auipc	ra,0x0
    80003938:	034080e7          	jalr	52(ra) # 80003968 <__printf>
    8000393c:	00048513          	mv	a0,s1
    80003940:	00000097          	auipc	ra,0x0
    80003944:	028080e7          	jalr	40(ra) # 80003968 <__printf>
    80003948:	00002517          	auipc	a0,0x2
    8000394c:	a1050513          	addi	a0,a0,-1520 # 80005358 <CONSOLE_STATUS+0x348>
    80003950:	00000097          	auipc	ra,0x0
    80003954:	018080e7          	jalr	24(ra) # 80003968 <__printf>
    80003958:	00100793          	li	a5,1
    8000395c:	00003717          	auipc	a4,0x3
    80003960:	80f72e23          	sw	a5,-2020(a4) # 80006178 <panicked>
    80003964:	0000006f          	j	80003964 <panic+0x58>

0000000080003968 <__printf>:
    80003968:	f3010113          	addi	sp,sp,-208
    8000396c:	08813023          	sd	s0,128(sp)
    80003970:	07313423          	sd	s3,104(sp)
    80003974:	09010413          	addi	s0,sp,144
    80003978:	05813023          	sd	s8,64(sp)
    8000397c:	08113423          	sd	ra,136(sp)
    80003980:	06913c23          	sd	s1,120(sp)
    80003984:	07213823          	sd	s2,112(sp)
    80003988:	07413023          	sd	s4,96(sp)
    8000398c:	05513c23          	sd	s5,88(sp)
    80003990:	05613823          	sd	s6,80(sp)
    80003994:	05713423          	sd	s7,72(sp)
    80003998:	03913c23          	sd	s9,56(sp)
    8000399c:	03a13823          	sd	s10,48(sp)
    800039a0:	03b13423          	sd	s11,40(sp)
    800039a4:	00004317          	auipc	t1,0x4
    800039a8:	a5c30313          	addi	t1,t1,-1444 # 80007400 <pr>
    800039ac:	01832c03          	lw	s8,24(t1)
    800039b0:	00b43423          	sd	a1,8(s0)
    800039b4:	00c43823          	sd	a2,16(s0)
    800039b8:	00d43c23          	sd	a3,24(s0)
    800039bc:	02e43023          	sd	a4,32(s0)
    800039c0:	02f43423          	sd	a5,40(s0)
    800039c4:	03043823          	sd	a6,48(s0)
    800039c8:	03143c23          	sd	a7,56(s0)
    800039cc:	00050993          	mv	s3,a0
    800039d0:	4a0c1663          	bnez	s8,80003e7c <__printf+0x514>
    800039d4:	60098c63          	beqz	s3,80003fec <__printf+0x684>
    800039d8:	0009c503          	lbu	a0,0(s3)
    800039dc:	00840793          	addi	a5,s0,8
    800039e0:	f6f43c23          	sd	a5,-136(s0)
    800039e4:	00000493          	li	s1,0
    800039e8:	22050063          	beqz	a0,80003c08 <__printf+0x2a0>
    800039ec:	00002a37          	lui	s4,0x2
    800039f0:	00018ab7          	lui	s5,0x18
    800039f4:	000f4b37          	lui	s6,0xf4
    800039f8:	00989bb7          	lui	s7,0x989
    800039fc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80003a00:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80003a04:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80003a08:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80003a0c:	00148c9b          	addiw	s9,s1,1
    80003a10:	02500793          	li	a5,37
    80003a14:	01998933          	add	s2,s3,s9
    80003a18:	38f51263          	bne	a0,a5,80003d9c <__printf+0x434>
    80003a1c:	00094783          	lbu	a5,0(s2)
    80003a20:	00078c9b          	sext.w	s9,a5
    80003a24:	1e078263          	beqz	a5,80003c08 <__printf+0x2a0>
    80003a28:	0024849b          	addiw	s1,s1,2
    80003a2c:	07000713          	li	a4,112
    80003a30:	00998933          	add	s2,s3,s1
    80003a34:	38e78a63          	beq	a5,a4,80003dc8 <__printf+0x460>
    80003a38:	20f76863          	bltu	a4,a5,80003c48 <__printf+0x2e0>
    80003a3c:	42a78863          	beq	a5,a0,80003e6c <__printf+0x504>
    80003a40:	06400713          	li	a4,100
    80003a44:	40e79663          	bne	a5,a4,80003e50 <__printf+0x4e8>
    80003a48:	f7843783          	ld	a5,-136(s0)
    80003a4c:	0007a603          	lw	a2,0(a5)
    80003a50:	00878793          	addi	a5,a5,8
    80003a54:	f6f43c23          	sd	a5,-136(s0)
    80003a58:	42064a63          	bltz	a2,80003e8c <__printf+0x524>
    80003a5c:	00a00713          	li	a4,10
    80003a60:	02e677bb          	remuw	a5,a2,a4
    80003a64:	00002d97          	auipc	s11,0x2
    80003a68:	93cd8d93          	addi	s11,s11,-1732 # 800053a0 <digits>
    80003a6c:	00900593          	li	a1,9
    80003a70:	0006051b          	sext.w	a0,a2
    80003a74:	00000c93          	li	s9,0
    80003a78:	02079793          	slli	a5,a5,0x20
    80003a7c:	0207d793          	srli	a5,a5,0x20
    80003a80:	00fd87b3          	add	a5,s11,a5
    80003a84:	0007c783          	lbu	a5,0(a5)
    80003a88:	02e656bb          	divuw	a3,a2,a4
    80003a8c:	f8f40023          	sb	a5,-128(s0)
    80003a90:	14c5d863          	bge	a1,a2,80003be0 <__printf+0x278>
    80003a94:	06300593          	li	a1,99
    80003a98:	00100c93          	li	s9,1
    80003a9c:	02e6f7bb          	remuw	a5,a3,a4
    80003aa0:	02079793          	slli	a5,a5,0x20
    80003aa4:	0207d793          	srli	a5,a5,0x20
    80003aa8:	00fd87b3          	add	a5,s11,a5
    80003aac:	0007c783          	lbu	a5,0(a5)
    80003ab0:	02e6d73b          	divuw	a4,a3,a4
    80003ab4:	f8f400a3          	sb	a5,-127(s0)
    80003ab8:	12a5f463          	bgeu	a1,a0,80003be0 <__printf+0x278>
    80003abc:	00a00693          	li	a3,10
    80003ac0:	00900593          	li	a1,9
    80003ac4:	02d777bb          	remuw	a5,a4,a3
    80003ac8:	02079793          	slli	a5,a5,0x20
    80003acc:	0207d793          	srli	a5,a5,0x20
    80003ad0:	00fd87b3          	add	a5,s11,a5
    80003ad4:	0007c503          	lbu	a0,0(a5)
    80003ad8:	02d757bb          	divuw	a5,a4,a3
    80003adc:	f8a40123          	sb	a0,-126(s0)
    80003ae0:	48e5f263          	bgeu	a1,a4,80003f64 <__printf+0x5fc>
    80003ae4:	06300513          	li	a0,99
    80003ae8:	02d7f5bb          	remuw	a1,a5,a3
    80003aec:	02059593          	slli	a1,a1,0x20
    80003af0:	0205d593          	srli	a1,a1,0x20
    80003af4:	00bd85b3          	add	a1,s11,a1
    80003af8:	0005c583          	lbu	a1,0(a1)
    80003afc:	02d7d7bb          	divuw	a5,a5,a3
    80003b00:	f8b401a3          	sb	a1,-125(s0)
    80003b04:	48e57263          	bgeu	a0,a4,80003f88 <__printf+0x620>
    80003b08:	3e700513          	li	a0,999
    80003b0c:	02d7f5bb          	remuw	a1,a5,a3
    80003b10:	02059593          	slli	a1,a1,0x20
    80003b14:	0205d593          	srli	a1,a1,0x20
    80003b18:	00bd85b3          	add	a1,s11,a1
    80003b1c:	0005c583          	lbu	a1,0(a1)
    80003b20:	02d7d7bb          	divuw	a5,a5,a3
    80003b24:	f8b40223          	sb	a1,-124(s0)
    80003b28:	46e57663          	bgeu	a0,a4,80003f94 <__printf+0x62c>
    80003b2c:	02d7f5bb          	remuw	a1,a5,a3
    80003b30:	02059593          	slli	a1,a1,0x20
    80003b34:	0205d593          	srli	a1,a1,0x20
    80003b38:	00bd85b3          	add	a1,s11,a1
    80003b3c:	0005c583          	lbu	a1,0(a1)
    80003b40:	02d7d7bb          	divuw	a5,a5,a3
    80003b44:	f8b402a3          	sb	a1,-123(s0)
    80003b48:	46ea7863          	bgeu	s4,a4,80003fb8 <__printf+0x650>
    80003b4c:	02d7f5bb          	remuw	a1,a5,a3
    80003b50:	02059593          	slli	a1,a1,0x20
    80003b54:	0205d593          	srli	a1,a1,0x20
    80003b58:	00bd85b3          	add	a1,s11,a1
    80003b5c:	0005c583          	lbu	a1,0(a1)
    80003b60:	02d7d7bb          	divuw	a5,a5,a3
    80003b64:	f8b40323          	sb	a1,-122(s0)
    80003b68:	3eeaf863          	bgeu	s5,a4,80003f58 <__printf+0x5f0>
    80003b6c:	02d7f5bb          	remuw	a1,a5,a3
    80003b70:	02059593          	slli	a1,a1,0x20
    80003b74:	0205d593          	srli	a1,a1,0x20
    80003b78:	00bd85b3          	add	a1,s11,a1
    80003b7c:	0005c583          	lbu	a1,0(a1)
    80003b80:	02d7d7bb          	divuw	a5,a5,a3
    80003b84:	f8b403a3          	sb	a1,-121(s0)
    80003b88:	42eb7e63          	bgeu	s6,a4,80003fc4 <__printf+0x65c>
    80003b8c:	02d7f5bb          	remuw	a1,a5,a3
    80003b90:	02059593          	slli	a1,a1,0x20
    80003b94:	0205d593          	srli	a1,a1,0x20
    80003b98:	00bd85b3          	add	a1,s11,a1
    80003b9c:	0005c583          	lbu	a1,0(a1)
    80003ba0:	02d7d7bb          	divuw	a5,a5,a3
    80003ba4:	f8b40423          	sb	a1,-120(s0)
    80003ba8:	42ebfc63          	bgeu	s7,a4,80003fe0 <__printf+0x678>
    80003bac:	02079793          	slli	a5,a5,0x20
    80003bb0:	0207d793          	srli	a5,a5,0x20
    80003bb4:	00fd8db3          	add	s11,s11,a5
    80003bb8:	000dc703          	lbu	a4,0(s11)
    80003bbc:	00a00793          	li	a5,10
    80003bc0:	00900c93          	li	s9,9
    80003bc4:	f8e404a3          	sb	a4,-119(s0)
    80003bc8:	00065c63          	bgez	a2,80003be0 <__printf+0x278>
    80003bcc:	f9040713          	addi	a4,s0,-112
    80003bd0:	00f70733          	add	a4,a4,a5
    80003bd4:	02d00693          	li	a3,45
    80003bd8:	fed70823          	sb	a3,-16(a4)
    80003bdc:	00078c93          	mv	s9,a5
    80003be0:	f8040793          	addi	a5,s0,-128
    80003be4:	01978cb3          	add	s9,a5,s9
    80003be8:	f7f40d13          	addi	s10,s0,-129
    80003bec:	000cc503          	lbu	a0,0(s9)
    80003bf0:	fffc8c93          	addi	s9,s9,-1
    80003bf4:	00000097          	auipc	ra,0x0
    80003bf8:	b90080e7          	jalr	-1136(ra) # 80003784 <consputc>
    80003bfc:	ffac98e3          	bne	s9,s10,80003bec <__printf+0x284>
    80003c00:	00094503          	lbu	a0,0(s2)
    80003c04:	e00514e3          	bnez	a0,80003a0c <__printf+0xa4>
    80003c08:	1a0c1663          	bnez	s8,80003db4 <__printf+0x44c>
    80003c0c:	08813083          	ld	ra,136(sp)
    80003c10:	08013403          	ld	s0,128(sp)
    80003c14:	07813483          	ld	s1,120(sp)
    80003c18:	07013903          	ld	s2,112(sp)
    80003c1c:	06813983          	ld	s3,104(sp)
    80003c20:	06013a03          	ld	s4,96(sp)
    80003c24:	05813a83          	ld	s5,88(sp)
    80003c28:	05013b03          	ld	s6,80(sp)
    80003c2c:	04813b83          	ld	s7,72(sp)
    80003c30:	04013c03          	ld	s8,64(sp)
    80003c34:	03813c83          	ld	s9,56(sp)
    80003c38:	03013d03          	ld	s10,48(sp)
    80003c3c:	02813d83          	ld	s11,40(sp)
    80003c40:	0d010113          	addi	sp,sp,208
    80003c44:	00008067          	ret
    80003c48:	07300713          	li	a4,115
    80003c4c:	1ce78a63          	beq	a5,a4,80003e20 <__printf+0x4b8>
    80003c50:	07800713          	li	a4,120
    80003c54:	1ee79e63          	bne	a5,a4,80003e50 <__printf+0x4e8>
    80003c58:	f7843783          	ld	a5,-136(s0)
    80003c5c:	0007a703          	lw	a4,0(a5)
    80003c60:	00878793          	addi	a5,a5,8
    80003c64:	f6f43c23          	sd	a5,-136(s0)
    80003c68:	28074263          	bltz	a4,80003eec <__printf+0x584>
    80003c6c:	00001d97          	auipc	s11,0x1
    80003c70:	734d8d93          	addi	s11,s11,1844 # 800053a0 <digits>
    80003c74:	00f77793          	andi	a5,a4,15
    80003c78:	00fd87b3          	add	a5,s11,a5
    80003c7c:	0007c683          	lbu	a3,0(a5)
    80003c80:	00f00613          	li	a2,15
    80003c84:	0007079b          	sext.w	a5,a4
    80003c88:	f8d40023          	sb	a3,-128(s0)
    80003c8c:	0047559b          	srliw	a1,a4,0x4
    80003c90:	0047569b          	srliw	a3,a4,0x4
    80003c94:	00000c93          	li	s9,0
    80003c98:	0ee65063          	bge	a2,a4,80003d78 <__printf+0x410>
    80003c9c:	00f6f693          	andi	a3,a3,15
    80003ca0:	00dd86b3          	add	a3,s11,a3
    80003ca4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80003ca8:	0087d79b          	srliw	a5,a5,0x8
    80003cac:	00100c93          	li	s9,1
    80003cb0:	f8d400a3          	sb	a3,-127(s0)
    80003cb4:	0cb67263          	bgeu	a2,a1,80003d78 <__printf+0x410>
    80003cb8:	00f7f693          	andi	a3,a5,15
    80003cbc:	00dd86b3          	add	a3,s11,a3
    80003cc0:	0006c583          	lbu	a1,0(a3)
    80003cc4:	00f00613          	li	a2,15
    80003cc8:	0047d69b          	srliw	a3,a5,0x4
    80003ccc:	f8b40123          	sb	a1,-126(s0)
    80003cd0:	0047d593          	srli	a1,a5,0x4
    80003cd4:	28f67e63          	bgeu	a2,a5,80003f70 <__printf+0x608>
    80003cd8:	00f6f693          	andi	a3,a3,15
    80003cdc:	00dd86b3          	add	a3,s11,a3
    80003ce0:	0006c503          	lbu	a0,0(a3)
    80003ce4:	0087d813          	srli	a6,a5,0x8
    80003ce8:	0087d69b          	srliw	a3,a5,0x8
    80003cec:	f8a401a3          	sb	a0,-125(s0)
    80003cf0:	28b67663          	bgeu	a2,a1,80003f7c <__printf+0x614>
    80003cf4:	00f6f693          	andi	a3,a3,15
    80003cf8:	00dd86b3          	add	a3,s11,a3
    80003cfc:	0006c583          	lbu	a1,0(a3)
    80003d00:	00c7d513          	srli	a0,a5,0xc
    80003d04:	00c7d69b          	srliw	a3,a5,0xc
    80003d08:	f8b40223          	sb	a1,-124(s0)
    80003d0c:	29067a63          	bgeu	a2,a6,80003fa0 <__printf+0x638>
    80003d10:	00f6f693          	andi	a3,a3,15
    80003d14:	00dd86b3          	add	a3,s11,a3
    80003d18:	0006c583          	lbu	a1,0(a3)
    80003d1c:	0107d813          	srli	a6,a5,0x10
    80003d20:	0107d69b          	srliw	a3,a5,0x10
    80003d24:	f8b402a3          	sb	a1,-123(s0)
    80003d28:	28a67263          	bgeu	a2,a0,80003fac <__printf+0x644>
    80003d2c:	00f6f693          	andi	a3,a3,15
    80003d30:	00dd86b3          	add	a3,s11,a3
    80003d34:	0006c683          	lbu	a3,0(a3)
    80003d38:	0147d79b          	srliw	a5,a5,0x14
    80003d3c:	f8d40323          	sb	a3,-122(s0)
    80003d40:	21067663          	bgeu	a2,a6,80003f4c <__printf+0x5e4>
    80003d44:	02079793          	slli	a5,a5,0x20
    80003d48:	0207d793          	srli	a5,a5,0x20
    80003d4c:	00fd8db3          	add	s11,s11,a5
    80003d50:	000dc683          	lbu	a3,0(s11)
    80003d54:	00800793          	li	a5,8
    80003d58:	00700c93          	li	s9,7
    80003d5c:	f8d403a3          	sb	a3,-121(s0)
    80003d60:	00075c63          	bgez	a4,80003d78 <__printf+0x410>
    80003d64:	f9040713          	addi	a4,s0,-112
    80003d68:	00f70733          	add	a4,a4,a5
    80003d6c:	02d00693          	li	a3,45
    80003d70:	fed70823          	sb	a3,-16(a4)
    80003d74:	00078c93          	mv	s9,a5
    80003d78:	f8040793          	addi	a5,s0,-128
    80003d7c:	01978cb3          	add	s9,a5,s9
    80003d80:	f7f40d13          	addi	s10,s0,-129
    80003d84:	000cc503          	lbu	a0,0(s9)
    80003d88:	fffc8c93          	addi	s9,s9,-1
    80003d8c:	00000097          	auipc	ra,0x0
    80003d90:	9f8080e7          	jalr	-1544(ra) # 80003784 <consputc>
    80003d94:	ff9d18e3          	bne	s10,s9,80003d84 <__printf+0x41c>
    80003d98:	0100006f          	j	80003da8 <__printf+0x440>
    80003d9c:	00000097          	auipc	ra,0x0
    80003da0:	9e8080e7          	jalr	-1560(ra) # 80003784 <consputc>
    80003da4:	000c8493          	mv	s1,s9
    80003da8:	00094503          	lbu	a0,0(s2)
    80003dac:	c60510e3          	bnez	a0,80003a0c <__printf+0xa4>
    80003db0:	e40c0ee3          	beqz	s8,80003c0c <__printf+0x2a4>
    80003db4:	00003517          	auipc	a0,0x3
    80003db8:	64c50513          	addi	a0,a0,1612 # 80007400 <pr>
    80003dbc:	00001097          	auipc	ra,0x1
    80003dc0:	94c080e7          	jalr	-1716(ra) # 80004708 <release>
    80003dc4:	e49ff06f          	j	80003c0c <__printf+0x2a4>
    80003dc8:	f7843783          	ld	a5,-136(s0)
    80003dcc:	03000513          	li	a0,48
    80003dd0:	01000d13          	li	s10,16
    80003dd4:	00878713          	addi	a4,a5,8
    80003dd8:	0007bc83          	ld	s9,0(a5)
    80003ddc:	f6e43c23          	sd	a4,-136(s0)
    80003de0:	00000097          	auipc	ra,0x0
    80003de4:	9a4080e7          	jalr	-1628(ra) # 80003784 <consputc>
    80003de8:	07800513          	li	a0,120
    80003dec:	00000097          	auipc	ra,0x0
    80003df0:	998080e7          	jalr	-1640(ra) # 80003784 <consputc>
    80003df4:	00001d97          	auipc	s11,0x1
    80003df8:	5acd8d93          	addi	s11,s11,1452 # 800053a0 <digits>
    80003dfc:	03ccd793          	srli	a5,s9,0x3c
    80003e00:	00fd87b3          	add	a5,s11,a5
    80003e04:	0007c503          	lbu	a0,0(a5)
    80003e08:	fffd0d1b          	addiw	s10,s10,-1
    80003e0c:	004c9c93          	slli	s9,s9,0x4
    80003e10:	00000097          	auipc	ra,0x0
    80003e14:	974080e7          	jalr	-1676(ra) # 80003784 <consputc>
    80003e18:	fe0d12e3          	bnez	s10,80003dfc <__printf+0x494>
    80003e1c:	f8dff06f          	j	80003da8 <__printf+0x440>
    80003e20:	f7843783          	ld	a5,-136(s0)
    80003e24:	0007bc83          	ld	s9,0(a5)
    80003e28:	00878793          	addi	a5,a5,8
    80003e2c:	f6f43c23          	sd	a5,-136(s0)
    80003e30:	000c9a63          	bnez	s9,80003e44 <__printf+0x4dc>
    80003e34:	1080006f          	j	80003f3c <__printf+0x5d4>
    80003e38:	001c8c93          	addi	s9,s9,1
    80003e3c:	00000097          	auipc	ra,0x0
    80003e40:	948080e7          	jalr	-1720(ra) # 80003784 <consputc>
    80003e44:	000cc503          	lbu	a0,0(s9)
    80003e48:	fe0518e3          	bnez	a0,80003e38 <__printf+0x4d0>
    80003e4c:	f5dff06f          	j	80003da8 <__printf+0x440>
    80003e50:	02500513          	li	a0,37
    80003e54:	00000097          	auipc	ra,0x0
    80003e58:	930080e7          	jalr	-1744(ra) # 80003784 <consputc>
    80003e5c:	000c8513          	mv	a0,s9
    80003e60:	00000097          	auipc	ra,0x0
    80003e64:	924080e7          	jalr	-1756(ra) # 80003784 <consputc>
    80003e68:	f41ff06f          	j	80003da8 <__printf+0x440>
    80003e6c:	02500513          	li	a0,37
    80003e70:	00000097          	auipc	ra,0x0
    80003e74:	914080e7          	jalr	-1772(ra) # 80003784 <consputc>
    80003e78:	f31ff06f          	j	80003da8 <__printf+0x440>
    80003e7c:	00030513          	mv	a0,t1
    80003e80:	00000097          	auipc	ra,0x0
    80003e84:	7bc080e7          	jalr	1980(ra) # 8000463c <acquire>
    80003e88:	b4dff06f          	j	800039d4 <__printf+0x6c>
    80003e8c:	40c0053b          	negw	a0,a2
    80003e90:	00a00713          	li	a4,10
    80003e94:	02e576bb          	remuw	a3,a0,a4
    80003e98:	00001d97          	auipc	s11,0x1
    80003e9c:	508d8d93          	addi	s11,s11,1288 # 800053a0 <digits>
    80003ea0:	ff700593          	li	a1,-9
    80003ea4:	02069693          	slli	a3,a3,0x20
    80003ea8:	0206d693          	srli	a3,a3,0x20
    80003eac:	00dd86b3          	add	a3,s11,a3
    80003eb0:	0006c683          	lbu	a3,0(a3)
    80003eb4:	02e557bb          	divuw	a5,a0,a4
    80003eb8:	f8d40023          	sb	a3,-128(s0)
    80003ebc:	10b65e63          	bge	a2,a1,80003fd8 <__printf+0x670>
    80003ec0:	06300593          	li	a1,99
    80003ec4:	02e7f6bb          	remuw	a3,a5,a4
    80003ec8:	02069693          	slli	a3,a3,0x20
    80003ecc:	0206d693          	srli	a3,a3,0x20
    80003ed0:	00dd86b3          	add	a3,s11,a3
    80003ed4:	0006c683          	lbu	a3,0(a3)
    80003ed8:	02e7d73b          	divuw	a4,a5,a4
    80003edc:	00200793          	li	a5,2
    80003ee0:	f8d400a3          	sb	a3,-127(s0)
    80003ee4:	bca5ece3          	bltu	a1,a0,80003abc <__printf+0x154>
    80003ee8:	ce5ff06f          	j	80003bcc <__printf+0x264>
    80003eec:	40e007bb          	negw	a5,a4
    80003ef0:	00001d97          	auipc	s11,0x1
    80003ef4:	4b0d8d93          	addi	s11,s11,1200 # 800053a0 <digits>
    80003ef8:	00f7f693          	andi	a3,a5,15
    80003efc:	00dd86b3          	add	a3,s11,a3
    80003f00:	0006c583          	lbu	a1,0(a3)
    80003f04:	ff100613          	li	a2,-15
    80003f08:	0047d69b          	srliw	a3,a5,0x4
    80003f0c:	f8b40023          	sb	a1,-128(s0)
    80003f10:	0047d59b          	srliw	a1,a5,0x4
    80003f14:	0ac75e63          	bge	a4,a2,80003fd0 <__printf+0x668>
    80003f18:	00f6f693          	andi	a3,a3,15
    80003f1c:	00dd86b3          	add	a3,s11,a3
    80003f20:	0006c603          	lbu	a2,0(a3)
    80003f24:	00f00693          	li	a3,15
    80003f28:	0087d79b          	srliw	a5,a5,0x8
    80003f2c:	f8c400a3          	sb	a2,-127(s0)
    80003f30:	d8b6e4e3          	bltu	a3,a1,80003cb8 <__printf+0x350>
    80003f34:	00200793          	li	a5,2
    80003f38:	e2dff06f          	j	80003d64 <__printf+0x3fc>
    80003f3c:	00001c97          	auipc	s9,0x1
    80003f40:	444c8c93          	addi	s9,s9,1092 # 80005380 <CONSOLE_STATUS+0x370>
    80003f44:	02800513          	li	a0,40
    80003f48:	ef1ff06f          	j	80003e38 <__printf+0x4d0>
    80003f4c:	00700793          	li	a5,7
    80003f50:	00600c93          	li	s9,6
    80003f54:	e0dff06f          	j	80003d60 <__printf+0x3f8>
    80003f58:	00700793          	li	a5,7
    80003f5c:	00600c93          	li	s9,6
    80003f60:	c69ff06f          	j	80003bc8 <__printf+0x260>
    80003f64:	00300793          	li	a5,3
    80003f68:	00200c93          	li	s9,2
    80003f6c:	c5dff06f          	j	80003bc8 <__printf+0x260>
    80003f70:	00300793          	li	a5,3
    80003f74:	00200c93          	li	s9,2
    80003f78:	de9ff06f          	j	80003d60 <__printf+0x3f8>
    80003f7c:	00400793          	li	a5,4
    80003f80:	00300c93          	li	s9,3
    80003f84:	dddff06f          	j	80003d60 <__printf+0x3f8>
    80003f88:	00400793          	li	a5,4
    80003f8c:	00300c93          	li	s9,3
    80003f90:	c39ff06f          	j	80003bc8 <__printf+0x260>
    80003f94:	00500793          	li	a5,5
    80003f98:	00400c93          	li	s9,4
    80003f9c:	c2dff06f          	j	80003bc8 <__printf+0x260>
    80003fa0:	00500793          	li	a5,5
    80003fa4:	00400c93          	li	s9,4
    80003fa8:	db9ff06f          	j	80003d60 <__printf+0x3f8>
    80003fac:	00600793          	li	a5,6
    80003fb0:	00500c93          	li	s9,5
    80003fb4:	dadff06f          	j	80003d60 <__printf+0x3f8>
    80003fb8:	00600793          	li	a5,6
    80003fbc:	00500c93          	li	s9,5
    80003fc0:	c09ff06f          	j	80003bc8 <__printf+0x260>
    80003fc4:	00800793          	li	a5,8
    80003fc8:	00700c93          	li	s9,7
    80003fcc:	bfdff06f          	j	80003bc8 <__printf+0x260>
    80003fd0:	00100793          	li	a5,1
    80003fd4:	d91ff06f          	j	80003d64 <__printf+0x3fc>
    80003fd8:	00100793          	li	a5,1
    80003fdc:	bf1ff06f          	j	80003bcc <__printf+0x264>
    80003fe0:	00900793          	li	a5,9
    80003fe4:	00800c93          	li	s9,8
    80003fe8:	be1ff06f          	j	80003bc8 <__printf+0x260>
    80003fec:	00001517          	auipc	a0,0x1
    80003ff0:	39c50513          	addi	a0,a0,924 # 80005388 <CONSOLE_STATUS+0x378>
    80003ff4:	00000097          	auipc	ra,0x0
    80003ff8:	918080e7          	jalr	-1768(ra) # 8000390c <panic>

0000000080003ffc <printfinit>:
    80003ffc:	fe010113          	addi	sp,sp,-32
    80004000:	00813823          	sd	s0,16(sp)
    80004004:	00913423          	sd	s1,8(sp)
    80004008:	00113c23          	sd	ra,24(sp)
    8000400c:	02010413          	addi	s0,sp,32
    80004010:	00003497          	auipc	s1,0x3
    80004014:	3f048493          	addi	s1,s1,1008 # 80007400 <pr>
    80004018:	00048513          	mv	a0,s1
    8000401c:	00001597          	auipc	a1,0x1
    80004020:	37c58593          	addi	a1,a1,892 # 80005398 <CONSOLE_STATUS+0x388>
    80004024:	00000097          	auipc	ra,0x0
    80004028:	5f4080e7          	jalr	1524(ra) # 80004618 <initlock>
    8000402c:	01813083          	ld	ra,24(sp)
    80004030:	01013403          	ld	s0,16(sp)
    80004034:	0004ac23          	sw	zero,24(s1)
    80004038:	00813483          	ld	s1,8(sp)
    8000403c:	02010113          	addi	sp,sp,32
    80004040:	00008067          	ret

0000000080004044 <uartinit>:
    80004044:	ff010113          	addi	sp,sp,-16
    80004048:	00813423          	sd	s0,8(sp)
    8000404c:	01010413          	addi	s0,sp,16
    80004050:	100007b7          	lui	a5,0x10000
    80004054:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80004058:	f8000713          	li	a4,-128
    8000405c:	00e781a3          	sb	a4,3(a5)
    80004060:	00300713          	li	a4,3
    80004064:	00e78023          	sb	a4,0(a5)
    80004068:	000780a3          	sb	zero,1(a5)
    8000406c:	00e781a3          	sb	a4,3(a5)
    80004070:	00700693          	li	a3,7
    80004074:	00d78123          	sb	a3,2(a5)
    80004078:	00e780a3          	sb	a4,1(a5)
    8000407c:	00813403          	ld	s0,8(sp)
    80004080:	01010113          	addi	sp,sp,16
    80004084:	00008067          	ret

0000000080004088 <uartputc>:
    80004088:	00002797          	auipc	a5,0x2
    8000408c:	0f07a783          	lw	a5,240(a5) # 80006178 <panicked>
    80004090:	00078463          	beqz	a5,80004098 <uartputc+0x10>
    80004094:	0000006f          	j	80004094 <uartputc+0xc>
    80004098:	fd010113          	addi	sp,sp,-48
    8000409c:	02813023          	sd	s0,32(sp)
    800040a0:	00913c23          	sd	s1,24(sp)
    800040a4:	01213823          	sd	s2,16(sp)
    800040a8:	01313423          	sd	s3,8(sp)
    800040ac:	02113423          	sd	ra,40(sp)
    800040b0:	03010413          	addi	s0,sp,48
    800040b4:	00002917          	auipc	s2,0x2
    800040b8:	0cc90913          	addi	s2,s2,204 # 80006180 <uart_tx_r>
    800040bc:	00093783          	ld	a5,0(s2)
    800040c0:	00002497          	auipc	s1,0x2
    800040c4:	0c848493          	addi	s1,s1,200 # 80006188 <uart_tx_w>
    800040c8:	0004b703          	ld	a4,0(s1)
    800040cc:	02078693          	addi	a3,a5,32
    800040d0:	00050993          	mv	s3,a0
    800040d4:	02e69c63          	bne	a3,a4,8000410c <uartputc+0x84>
    800040d8:	00001097          	auipc	ra,0x1
    800040dc:	834080e7          	jalr	-1996(ra) # 8000490c <push_on>
    800040e0:	00093783          	ld	a5,0(s2)
    800040e4:	0004b703          	ld	a4,0(s1)
    800040e8:	02078793          	addi	a5,a5,32
    800040ec:	00e79463          	bne	a5,a4,800040f4 <uartputc+0x6c>
    800040f0:	0000006f          	j	800040f0 <uartputc+0x68>
    800040f4:	00001097          	auipc	ra,0x1
    800040f8:	88c080e7          	jalr	-1908(ra) # 80004980 <pop_on>
    800040fc:	00093783          	ld	a5,0(s2)
    80004100:	0004b703          	ld	a4,0(s1)
    80004104:	02078693          	addi	a3,a5,32
    80004108:	fce688e3          	beq	a3,a4,800040d8 <uartputc+0x50>
    8000410c:	01f77693          	andi	a3,a4,31
    80004110:	00003597          	auipc	a1,0x3
    80004114:	31058593          	addi	a1,a1,784 # 80007420 <uart_tx_buf>
    80004118:	00d586b3          	add	a3,a1,a3
    8000411c:	00170713          	addi	a4,a4,1
    80004120:	01368023          	sb	s3,0(a3)
    80004124:	00e4b023          	sd	a4,0(s1)
    80004128:	10000637          	lui	a2,0x10000
    8000412c:	02f71063          	bne	a4,a5,8000414c <uartputc+0xc4>
    80004130:	0340006f          	j	80004164 <uartputc+0xdc>
    80004134:	00074703          	lbu	a4,0(a4)
    80004138:	00f93023          	sd	a5,0(s2)
    8000413c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80004140:	00093783          	ld	a5,0(s2)
    80004144:	0004b703          	ld	a4,0(s1)
    80004148:	00f70e63          	beq	a4,a5,80004164 <uartputc+0xdc>
    8000414c:	00564683          	lbu	a3,5(a2)
    80004150:	01f7f713          	andi	a4,a5,31
    80004154:	00e58733          	add	a4,a1,a4
    80004158:	0206f693          	andi	a3,a3,32
    8000415c:	00178793          	addi	a5,a5,1
    80004160:	fc069ae3          	bnez	a3,80004134 <uartputc+0xac>
    80004164:	02813083          	ld	ra,40(sp)
    80004168:	02013403          	ld	s0,32(sp)
    8000416c:	01813483          	ld	s1,24(sp)
    80004170:	01013903          	ld	s2,16(sp)
    80004174:	00813983          	ld	s3,8(sp)
    80004178:	03010113          	addi	sp,sp,48
    8000417c:	00008067          	ret

0000000080004180 <uartputc_sync>:
    80004180:	ff010113          	addi	sp,sp,-16
    80004184:	00813423          	sd	s0,8(sp)
    80004188:	01010413          	addi	s0,sp,16
    8000418c:	00002717          	auipc	a4,0x2
    80004190:	fec72703          	lw	a4,-20(a4) # 80006178 <panicked>
    80004194:	02071663          	bnez	a4,800041c0 <uartputc_sync+0x40>
    80004198:	00050793          	mv	a5,a0
    8000419c:	100006b7          	lui	a3,0x10000
    800041a0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800041a4:	02077713          	andi	a4,a4,32
    800041a8:	fe070ce3          	beqz	a4,800041a0 <uartputc_sync+0x20>
    800041ac:	0ff7f793          	andi	a5,a5,255
    800041b0:	00f68023          	sb	a5,0(a3)
    800041b4:	00813403          	ld	s0,8(sp)
    800041b8:	01010113          	addi	sp,sp,16
    800041bc:	00008067          	ret
    800041c0:	0000006f          	j	800041c0 <uartputc_sync+0x40>

00000000800041c4 <uartstart>:
    800041c4:	ff010113          	addi	sp,sp,-16
    800041c8:	00813423          	sd	s0,8(sp)
    800041cc:	01010413          	addi	s0,sp,16
    800041d0:	00002617          	auipc	a2,0x2
    800041d4:	fb060613          	addi	a2,a2,-80 # 80006180 <uart_tx_r>
    800041d8:	00002517          	auipc	a0,0x2
    800041dc:	fb050513          	addi	a0,a0,-80 # 80006188 <uart_tx_w>
    800041e0:	00063783          	ld	a5,0(a2)
    800041e4:	00053703          	ld	a4,0(a0)
    800041e8:	04f70263          	beq	a4,a5,8000422c <uartstart+0x68>
    800041ec:	100005b7          	lui	a1,0x10000
    800041f0:	00003817          	auipc	a6,0x3
    800041f4:	23080813          	addi	a6,a6,560 # 80007420 <uart_tx_buf>
    800041f8:	01c0006f          	j	80004214 <uartstart+0x50>
    800041fc:	0006c703          	lbu	a4,0(a3)
    80004200:	00f63023          	sd	a5,0(a2)
    80004204:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80004208:	00063783          	ld	a5,0(a2)
    8000420c:	00053703          	ld	a4,0(a0)
    80004210:	00f70e63          	beq	a4,a5,8000422c <uartstart+0x68>
    80004214:	01f7f713          	andi	a4,a5,31
    80004218:	00e806b3          	add	a3,a6,a4
    8000421c:	0055c703          	lbu	a4,5(a1)
    80004220:	00178793          	addi	a5,a5,1
    80004224:	02077713          	andi	a4,a4,32
    80004228:	fc071ae3          	bnez	a4,800041fc <uartstart+0x38>
    8000422c:	00813403          	ld	s0,8(sp)
    80004230:	01010113          	addi	sp,sp,16
    80004234:	00008067          	ret

0000000080004238 <uartgetc>:
    80004238:	ff010113          	addi	sp,sp,-16
    8000423c:	00813423          	sd	s0,8(sp)
    80004240:	01010413          	addi	s0,sp,16
    80004244:	10000737          	lui	a4,0x10000
    80004248:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000424c:	0017f793          	andi	a5,a5,1
    80004250:	00078c63          	beqz	a5,80004268 <uartgetc+0x30>
    80004254:	00074503          	lbu	a0,0(a4)
    80004258:	0ff57513          	andi	a0,a0,255
    8000425c:	00813403          	ld	s0,8(sp)
    80004260:	01010113          	addi	sp,sp,16
    80004264:	00008067          	ret
    80004268:	fff00513          	li	a0,-1
    8000426c:	ff1ff06f          	j	8000425c <uartgetc+0x24>

0000000080004270 <uartintr>:
    80004270:	100007b7          	lui	a5,0x10000
    80004274:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80004278:	0017f793          	andi	a5,a5,1
    8000427c:	0a078463          	beqz	a5,80004324 <uartintr+0xb4>
    80004280:	fe010113          	addi	sp,sp,-32
    80004284:	00813823          	sd	s0,16(sp)
    80004288:	00913423          	sd	s1,8(sp)
    8000428c:	00113c23          	sd	ra,24(sp)
    80004290:	02010413          	addi	s0,sp,32
    80004294:	100004b7          	lui	s1,0x10000
    80004298:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000429c:	0ff57513          	andi	a0,a0,255
    800042a0:	fffff097          	auipc	ra,0xfffff
    800042a4:	534080e7          	jalr	1332(ra) # 800037d4 <consoleintr>
    800042a8:	0054c783          	lbu	a5,5(s1)
    800042ac:	0017f793          	andi	a5,a5,1
    800042b0:	fe0794e3          	bnez	a5,80004298 <uartintr+0x28>
    800042b4:	00002617          	auipc	a2,0x2
    800042b8:	ecc60613          	addi	a2,a2,-308 # 80006180 <uart_tx_r>
    800042bc:	00002517          	auipc	a0,0x2
    800042c0:	ecc50513          	addi	a0,a0,-308 # 80006188 <uart_tx_w>
    800042c4:	00063783          	ld	a5,0(a2)
    800042c8:	00053703          	ld	a4,0(a0)
    800042cc:	04f70263          	beq	a4,a5,80004310 <uartintr+0xa0>
    800042d0:	100005b7          	lui	a1,0x10000
    800042d4:	00003817          	auipc	a6,0x3
    800042d8:	14c80813          	addi	a6,a6,332 # 80007420 <uart_tx_buf>
    800042dc:	01c0006f          	j	800042f8 <uartintr+0x88>
    800042e0:	0006c703          	lbu	a4,0(a3)
    800042e4:	00f63023          	sd	a5,0(a2)
    800042e8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800042ec:	00063783          	ld	a5,0(a2)
    800042f0:	00053703          	ld	a4,0(a0)
    800042f4:	00f70e63          	beq	a4,a5,80004310 <uartintr+0xa0>
    800042f8:	01f7f713          	andi	a4,a5,31
    800042fc:	00e806b3          	add	a3,a6,a4
    80004300:	0055c703          	lbu	a4,5(a1)
    80004304:	00178793          	addi	a5,a5,1
    80004308:	02077713          	andi	a4,a4,32
    8000430c:	fc071ae3          	bnez	a4,800042e0 <uartintr+0x70>
    80004310:	01813083          	ld	ra,24(sp)
    80004314:	01013403          	ld	s0,16(sp)
    80004318:	00813483          	ld	s1,8(sp)
    8000431c:	02010113          	addi	sp,sp,32
    80004320:	00008067          	ret
    80004324:	00002617          	auipc	a2,0x2
    80004328:	e5c60613          	addi	a2,a2,-420 # 80006180 <uart_tx_r>
    8000432c:	00002517          	auipc	a0,0x2
    80004330:	e5c50513          	addi	a0,a0,-420 # 80006188 <uart_tx_w>
    80004334:	00063783          	ld	a5,0(a2)
    80004338:	00053703          	ld	a4,0(a0)
    8000433c:	04f70263          	beq	a4,a5,80004380 <uartintr+0x110>
    80004340:	100005b7          	lui	a1,0x10000
    80004344:	00003817          	auipc	a6,0x3
    80004348:	0dc80813          	addi	a6,a6,220 # 80007420 <uart_tx_buf>
    8000434c:	01c0006f          	j	80004368 <uartintr+0xf8>
    80004350:	0006c703          	lbu	a4,0(a3)
    80004354:	00f63023          	sd	a5,0(a2)
    80004358:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000435c:	00063783          	ld	a5,0(a2)
    80004360:	00053703          	ld	a4,0(a0)
    80004364:	02f70063          	beq	a4,a5,80004384 <uartintr+0x114>
    80004368:	01f7f713          	andi	a4,a5,31
    8000436c:	00e806b3          	add	a3,a6,a4
    80004370:	0055c703          	lbu	a4,5(a1)
    80004374:	00178793          	addi	a5,a5,1
    80004378:	02077713          	andi	a4,a4,32
    8000437c:	fc071ae3          	bnez	a4,80004350 <uartintr+0xe0>
    80004380:	00008067          	ret
    80004384:	00008067          	ret

0000000080004388 <kinit>:
    80004388:	fc010113          	addi	sp,sp,-64
    8000438c:	02913423          	sd	s1,40(sp)
    80004390:	fffff7b7          	lui	a5,0xfffff
    80004394:	00004497          	auipc	s1,0x4
    80004398:	0ab48493          	addi	s1,s1,171 # 8000843f <end+0xfff>
    8000439c:	02813823          	sd	s0,48(sp)
    800043a0:	01313c23          	sd	s3,24(sp)
    800043a4:	00f4f4b3          	and	s1,s1,a5
    800043a8:	02113c23          	sd	ra,56(sp)
    800043ac:	03213023          	sd	s2,32(sp)
    800043b0:	01413823          	sd	s4,16(sp)
    800043b4:	01513423          	sd	s5,8(sp)
    800043b8:	04010413          	addi	s0,sp,64
    800043bc:	000017b7          	lui	a5,0x1
    800043c0:	01100993          	li	s3,17
    800043c4:	00f487b3          	add	a5,s1,a5
    800043c8:	01b99993          	slli	s3,s3,0x1b
    800043cc:	06f9e063          	bltu	s3,a5,8000442c <kinit+0xa4>
    800043d0:	00003a97          	auipc	s5,0x3
    800043d4:	070a8a93          	addi	s5,s5,112 # 80007440 <end>
    800043d8:	0754ec63          	bltu	s1,s5,80004450 <kinit+0xc8>
    800043dc:	0734fa63          	bgeu	s1,s3,80004450 <kinit+0xc8>
    800043e0:	00088a37          	lui	s4,0x88
    800043e4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800043e8:	00002917          	auipc	s2,0x2
    800043ec:	da890913          	addi	s2,s2,-600 # 80006190 <kmem>
    800043f0:	00ca1a13          	slli	s4,s4,0xc
    800043f4:	0140006f          	j	80004408 <kinit+0x80>
    800043f8:	000017b7          	lui	a5,0x1
    800043fc:	00f484b3          	add	s1,s1,a5
    80004400:	0554e863          	bltu	s1,s5,80004450 <kinit+0xc8>
    80004404:	0534f663          	bgeu	s1,s3,80004450 <kinit+0xc8>
    80004408:	00001637          	lui	a2,0x1
    8000440c:	00100593          	li	a1,1
    80004410:	00048513          	mv	a0,s1
    80004414:	00000097          	auipc	ra,0x0
    80004418:	5e4080e7          	jalr	1508(ra) # 800049f8 <__memset>
    8000441c:	00093783          	ld	a5,0(s2)
    80004420:	00f4b023          	sd	a5,0(s1)
    80004424:	00993023          	sd	s1,0(s2)
    80004428:	fd4498e3          	bne	s1,s4,800043f8 <kinit+0x70>
    8000442c:	03813083          	ld	ra,56(sp)
    80004430:	03013403          	ld	s0,48(sp)
    80004434:	02813483          	ld	s1,40(sp)
    80004438:	02013903          	ld	s2,32(sp)
    8000443c:	01813983          	ld	s3,24(sp)
    80004440:	01013a03          	ld	s4,16(sp)
    80004444:	00813a83          	ld	s5,8(sp)
    80004448:	04010113          	addi	sp,sp,64
    8000444c:	00008067          	ret
    80004450:	00001517          	auipc	a0,0x1
    80004454:	f6850513          	addi	a0,a0,-152 # 800053b8 <digits+0x18>
    80004458:	fffff097          	auipc	ra,0xfffff
    8000445c:	4b4080e7          	jalr	1204(ra) # 8000390c <panic>

0000000080004460 <freerange>:
    80004460:	fc010113          	addi	sp,sp,-64
    80004464:	000017b7          	lui	a5,0x1
    80004468:	02913423          	sd	s1,40(sp)
    8000446c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80004470:	009504b3          	add	s1,a0,s1
    80004474:	fffff537          	lui	a0,0xfffff
    80004478:	02813823          	sd	s0,48(sp)
    8000447c:	02113c23          	sd	ra,56(sp)
    80004480:	03213023          	sd	s2,32(sp)
    80004484:	01313c23          	sd	s3,24(sp)
    80004488:	01413823          	sd	s4,16(sp)
    8000448c:	01513423          	sd	s5,8(sp)
    80004490:	01613023          	sd	s6,0(sp)
    80004494:	04010413          	addi	s0,sp,64
    80004498:	00a4f4b3          	and	s1,s1,a0
    8000449c:	00f487b3          	add	a5,s1,a5
    800044a0:	06f5e463          	bltu	a1,a5,80004508 <freerange+0xa8>
    800044a4:	00003a97          	auipc	s5,0x3
    800044a8:	f9ca8a93          	addi	s5,s5,-100 # 80007440 <end>
    800044ac:	0954e263          	bltu	s1,s5,80004530 <freerange+0xd0>
    800044b0:	01100993          	li	s3,17
    800044b4:	01b99993          	slli	s3,s3,0x1b
    800044b8:	0734fc63          	bgeu	s1,s3,80004530 <freerange+0xd0>
    800044bc:	00058a13          	mv	s4,a1
    800044c0:	00002917          	auipc	s2,0x2
    800044c4:	cd090913          	addi	s2,s2,-816 # 80006190 <kmem>
    800044c8:	00002b37          	lui	s6,0x2
    800044cc:	0140006f          	j	800044e0 <freerange+0x80>
    800044d0:	000017b7          	lui	a5,0x1
    800044d4:	00f484b3          	add	s1,s1,a5
    800044d8:	0554ec63          	bltu	s1,s5,80004530 <freerange+0xd0>
    800044dc:	0534fa63          	bgeu	s1,s3,80004530 <freerange+0xd0>
    800044e0:	00001637          	lui	a2,0x1
    800044e4:	00100593          	li	a1,1
    800044e8:	00048513          	mv	a0,s1
    800044ec:	00000097          	auipc	ra,0x0
    800044f0:	50c080e7          	jalr	1292(ra) # 800049f8 <__memset>
    800044f4:	00093703          	ld	a4,0(s2)
    800044f8:	016487b3          	add	a5,s1,s6
    800044fc:	00e4b023          	sd	a4,0(s1)
    80004500:	00993023          	sd	s1,0(s2)
    80004504:	fcfa76e3          	bgeu	s4,a5,800044d0 <freerange+0x70>
    80004508:	03813083          	ld	ra,56(sp)
    8000450c:	03013403          	ld	s0,48(sp)
    80004510:	02813483          	ld	s1,40(sp)
    80004514:	02013903          	ld	s2,32(sp)
    80004518:	01813983          	ld	s3,24(sp)
    8000451c:	01013a03          	ld	s4,16(sp)
    80004520:	00813a83          	ld	s5,8(sp)
    80004524:	00013b03          	ld	s6,0(sp)
    80004528:	04010113          	addi	sp,sp,64
    8000452c:	00008067          	ret
    80004530:	00001517          	auipc	a0,0x1
    80004534:	e8850513          	addi	a0,a0,-376 # 800053b8 <digits+0x18>
    80004538:	fffff097          	auipc	ra,0xfffff
    8000453c:	3d4080e7          	jalr	980(ra) # 8000390c <panic>

0000000080004540 <kfree>:
    80004540:	fe010113          	addi	sp,sp,-32
    80004544:	00813823          	sd	s0,16(sp)
    80004548:	00113c23          	sd	ra,24(sp)
    8000454c:	00913423          	sd	s1,8(sp)
    80004550:	02010413          	addi	s0,sp,32
    80004554:	03451793          	slli	a5,a0,0x34
    80004558:	04079c63          	bnez	a5,800045b0 <kfree+0x70>
    8000455c:	00003797          	auipc	a5,0x3
    80004560:	ee478793          	addi	a5,a5,-284 # 80007440 <end>
    80004564:	00050493          	mv	s1,a0
    80004568:	04f56463          	bltu	a0,a5,800045b0 <kfree+0x70>
    8000456c:	01100793          	li	a5,17
    80004570:	01b79793          	slli	a5,a5,0x1b
    80004574:	02f57e63          	bgeu	a0,a5,800045b0 <kfree+0x70>
    80004578:	00001637          	lui	a2,0x1
    8000457c:	00100593          	li	a1,1
    80004580:	00000097          	auipc	ra,0x0
    80004584:	478080e7          	jalr	1144(ra) # 800049f8 <__memset>
    80004588:	00002797          	auipc	a5,0x2
    8000458c:	c0878793          	addi	a5,a5,-1016 # 80006190 <kmem>
    80004590:	0007b703          	ld	a4,0(a5)
    80004594:	01813083          	ld	ra,24(sp)
    80004598:	01013403          	ld	s0,16(sp)
    8000459c:	00e4b023          	sd	a4,0(s1)
    800045a0:	0097b023          	sd	s1,0(a5)
    800045a4:	00813483          	ld	s1,8(sp)
    800045a8:	02010113          	addi	sp,sp,32
    800045ac:	00008067          	ret
    800045b0:	00001517          	auipc	a0,0x1
    800045b4:	e0850513          	addi	a0,a0,-504 # 800053b8 <digits+0x18>
    800045b8:	fffff097          	auipc	ra,0xfffff
    800045bc:	354080e7          	jalr	852(ra) # 8000390c <panic>

00000000800045c0 <kalloc>:
    800045c0:	fe010113          	addi	sp,sp,-32
    800045c4:	00813823          	sd	s0,16(sp)
    800045c8:	00913423          	sd	s1,8(sp)
    800045cc:	00113c23          	sd	ra,24(sp)
    800045d0:	02010413          	addi	s0,sp,32
    800045d4:	00002797          	auipc	a5,0x2
    800045d8:	bbc78793          	addi	a5,a5,-1092 # 80006190 <kmem>
    800045dc:	0007b483          	ld	s1,0(a5)
    800045e0:	02048063          	beqz	s1,80004600 <kalloc+0x40>
    800045e4:	0004b703          	ld	a4,0(s1)
    800045e8:	00001637          	lui	a2,0x1
    800045ec:	00500593          	li	a1,5
    800045f0:	00048513          	mv	a0,s1
    800045f4:	00e7b023          	sd	a4,0(a5)
    800045f8:	00000097          	auipc	ra,0x0
    800045fc:	400080e7          	jalr	1024(ra) # 800049f8 <__memset>
    80004600:	01813083          	ld	ra,24(sp)
    80004604:	01013403          	ld	s0,16(sp)
    80004608:	00048513          	mv	a0,s1
    8000460c:	00813483          	ld	s1,8(sp)
    80004610:	02010113          	addi	sp,sp,32
    80004614:	00008067          	ret

0000000080004618 <initlock>:
    80004618:	ff010113          	addi	sp,sp,-16
    8000461c:	00813423          	sd	s0,8(sp)
    80004620:	01010413          	addi	s0,sp,16
    80004624:	00813403          	ld	s0,8(sp)
    80004628:	00b53423          	sd	a1,8(a0)
    8000462c:	00052023          	sw	zero,0(a0)
    80004630:	00053823          	sd	zero,16(a0)
    80004634:	01010113          	addi	sp,sp,16
    80004638:	00008067          	ret

000000008000463c <acquire>:
    8000463c:	fe010113          	addi	sp,sp,-32
    80004640:	00813823          	sd	s0,16(sp)
    80004644:	00913423          	sd	s1,8(sp)
    80004648:	00113c23          	sd	ra,24(sp)
    8000464c:	01213023          	sd	s2,0(sp)
    80004650:	02010413          	addi	s0,sp,32
    80004654:	00050493          	mv	s1,a0
    80004658:	10002973          	csrr	s2,sstatus
    8000465c:	100027f3          	csrr	a5,sstatus
    80004660:	ffd7f793          	andi	a5,a5,-3
    80004664:	10079073          	csrw	sstatus,a5
    80004668:	fffff097          	auipc	ra,0xfffff
    8000466c:	8e0080e7          	jalr	-1824(ra) # 80002f48 <mycpu>
    80004670:	07852783          	lw	a5,120(a0)
    80004674:	06078e63          	beqz	a5,800046f0 <acquire+0xb4>
    80004678:	fffff097          	auipc	ra,0xfffff
    8000467c:	8d0080e7          	jalr	-1840(ra) # 80002f48 <mycpu>
    80004680:	07852783          	lw	a5,120(a0)
    80004684:	0004a703          	lw	a4,0(s1)
    80004688:	0017879b          	addiw	a5,a5,1
    8000468c:	06f52c23          	sw	a5,120(a0)
    80004690:	04071063          	bnez	a4,800046d0 <acquire+0x94>
    80004694:	00100713          	li	a4,1
    80004698:	00070793          	mv	a5,a4
    8000469c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800046a0:	0007879b          	sext.w	a5,a5
    800046a4:	fe079ae3          	bnez	a5,80004698 <acquire+0x5c>
    800046a8:	0ff0000f          	fence
    800046ac:	fffff097          	auipc	ra,0xfffff
    800046b0:	89c080e7          	jalr	-1892(ra) # 80002f48 <mycpu>
    800046b4:	01813083          	ld	ra,24(sp)
    800046b8:	01013403          	ld	s0,16(sp)
    800046bc:	00a4b823          	sd	a0,16(s1)
    800046c0:	00013903          	ld	s2,0(sp)
    800046c4:	00813483          	ld	s1,8(sp)
    800046c8:	02010113          	addi	sp,sp,32
    800046cc:	00008067          	ret
    800046d0:	0104b903          	ld	s2,16(s1)
    800046d4:	fffff097          	auipc	ra,0xfffff
    800046d8:	874080e7          	jalr	-1932(ra) # 80002f48 <mycpu>
    800046dc:	faa91ce3          	bne	s2,a0,80004694 <acquire+0x58>
    800046e0:	00001517          	auipc	a0,0x1
    800046e4:	ce050513          	addi	a0,a0,-800 # 800053c0 <digits+0x20>
    800046e8:	fffff097          	auipc	ra,0xfffff
    800046ec:	224080e7          	jalr	548(ra) # 8000390c <panic>
    800046f0:	00195913          	srli	s2,s2,0x1
    800046f4:	fffff097          	auipc	ra,0xfffff
    800046f8:	854080e7          	jalr	-1964(ra) # 80002f48 <mycpu>
    800046fc:	00197913          	andi	s2,s2,1
    80004700:	07252e23          	sw	s2,124(a0)
    80004704:	f75ff06f          	j	80004678 <acquire+0x3c>

0000000080004708 <release>:
    80004708:	fe010113          	addi	sp,sp,-32
    8000470c:	00813823          	sd	s0,16(sp)
    80004710:	00113c23          	sd	ra,24(sp)
    80004714:	00913423          	sd	s1,8(sp)
    80004718:	01213023          	sd	s2,0(sp)
    8000471c:	02010413          	addi	s0,sp,32
    80004720:	00052783          	lw	a5,0(a0)
    80004724:	00079a63          	bnez	a5,80004738 <release+0x30>
    80004728:	00001517          	auipc	a0,0x1
    8000472c:	ca050513          	addi	a0,a0,-864 # 800053c8 <digits+0x28>
    80004730:	fffff097          	auipc	ra,0xfffff
    80004734:	1dc080e7          	jalr	476(ra) # 8000390c <panic>
    80004738:	01053903          	ld	s2,16(a0)
    8000473c:	00050493          	mv	s1,a0
    80004740:	fffff097          	auipc	ra,0xfffff
    80004744:	808080e7          	jalr	-2040(ra) # 80002f48 <mycpu>
    80004748:	fea910e3          	bne	s2,a0,80004728 <release+0x20>
    8000474c:	0004b823          	sd	zero,16(s1)
    80004750:	0ff0000f          	fence
    80004754:	0f50000f          	fence	iorw,ow
    80004758:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000475c:	ffffe097          	auipc	ra,0xffffe
    80004760:	7ec080e7          	jalr	2028(ra) # 80002f48 <mycpu>
    80004764:	100027f3          	csrr	a5,sstatus
    80004768:	0027f793          	andi	a5,a5,2
    8000476c:	04079a63          	bnez	a5,800047c0 <release+0xb8>
    80004770:	07852783          	lw	a5,120(a0)
    80004774:	02f05e63          	blez	a5,800047b0 <release+0xa8>
    80004778:	fff7871b          	addiw	a4,a5,-1
    8000477c:	06e52c23          	sw	a4,120(a0)
    80004780:	00071c63          	bnez	a4,80004798 <release+0x90>
    80004784:	07c52783          	lw	a5,124(a0)
    80004788:	00078863          	beqz	a5,80004798 <release+0x90>
    8000478c:	100027f3          	csrr	a5,sstatus
    80004790:	0027e793          	ori	a5,a5,2
    80004794:	10079073          	csrw	sstatus,a5
    80004798:	01813083          	ld	ra,24(sp)
    8000479c:	01013403          	ld	s0,16(sp)
    800047a0:	00813483          	ld	s1,8(sp)
    800047a4:	00013903          	ld	s2,0(sp)
    800047a8:	02010113          	addi	sp,sp,32
    800047ac:	00008067          	ret
    800047b0:	00001517          	auipc	a0,0x1
    800047b4:	c3850513          	addi	a0,a0,-968 # 800053e8 <digits+0x48>
    800047b8:	fffff097          	auipc	ra,0xfffff
    800047bc:	154080e7          	jalr	340(ra) # 8000390c <panic>
    800047c0:	00001517          	auipc	a0,0x1
    800047c4:	c1050513          	addi	a0,a0,-1008 # 800053d0 <digits+0x30>
    800047c8:	fffff097          	auipc	ra,0xfffff
    800047cc:	144080e7          	jalr	324(ra) # 8000390c <panic>

00000000800047d0 <holding>:
    800047d0:	00052783          	lw	a5,0(a0)
    800047d4:	00079663          	bnez	a5,800047e0 <holding+0x10>
    800047d8:	00000513          	li	a0,0
    800047dc:	00008067          	ret
    800047e0:	fe010113          	addi	sp,sp,-32
    800047e4:	00813823          	sd	s0,16(sp)
    800047e8:	00913423          	sd	s1,8(sp)
    800047ec:	00113c23          	sd	ra,24(sp)
    800047f0:	02010413          	addi	s0,sp,32
    800047f4:	01053483          	ld	s1,16(a0)
    800047f8:	ffffe097          	auipc	ra,0xffffe
    800047fc:	750080e7          	jalr	1872(ra) # 80002f48 <mycpu>
    80004800:	01813083          	ld	ra,24(sp)
    80004804:	01013403          	ld	s0,16(sp)
    80004808:	40a48533          	sub	a0,s1,a0
    8000480c:	00153513          	seqz	a0,a0
    80004810:	00813483          	ld	s1,8(sp)
    80004814:	02010113          	addi	sp,sp,32
    80004818:	00008067          	ret

000000008000481c <push_off>:
    8000481c:	fe010113          	addi	sp,sp,-32
    80004820:	00813823          	sd	s0,16(sp)
    80004824:	00113c23          	sd	ra,24(sp)
    80004828:	00913423          	sd	s1,8(sp)
    8000482c:	02010413          	addi	s0,sp,32
    80004830:	100024f3          	csrr	s1,sstatus
    80004834:	100027f3          	csrr	a5,sstatus
    80004838:	ffd7f793          	andi	a5,a5,-3
    8000483c:	10079073          	csrw	sstatus,a5
    80004840:	ffffe097          	auipc	ra,0xffffe
    80004844:	708080e7          	jalr	1800(ra) # 80002f48 <mycpu>
    80004848:	07852783          	lw	a5,120(a0)
    8000484c:	02078663          	beqz	a5,80004878 <push_off+0x5c>
    80004850:	ffffe097          	auipc	ra,0xffffe
    80004854:	6f8080e7          	jalr	1784(ra) # 80002f48 <mycpu>
    80004858:	07852783          	lw	a5,120(a0)
    8000485c:	01813083          	ld	ra,24(sp)
    80004860:	01013403          	ld	s0,16(sp)
    80004864:	0017879b          	addiw	a5,a5,1
    80004868:	06f52c23          	sw	a5,120(a0)
    8000486c:	00813483          	ld	s1,8(sp)
    80004870:	02010113          	addi	sp,sp,32
    80004874:	00008067          	ret
    80004878:	0014d493          	srli	s1,s1,0x1
    8000487c:	ffffe097          	auipc	ra,0xffffe
    80004880:	6cc080e7          	jalr	1740(ra) # 80002f48 <mycpu>
    80004884:	0014f493          	andi	s1,s1,1
    80004888:	06952e23          	sw	s1,124(a0)
    8000488c:	fc5ff06f          	j	80004850 <push_off+0x34>

0000000080004890 <pop_off>:
    80004890:	ff010113          	addi	sp,sp,-16
    80004894:	00813023          	sd	s0,0(sp)
    80004898:	00113423          	sd	ra,8(sp)
    8000489c:	01010413          	addi	s0,sp,16
    800048a0:	ffffe097          	auipc	ra,0xffffe
    800048a4:	6a8080e7          	jalr	1704(ra) # 80002f48 <mycpu>
    800048a8:	100027f3          	csrr	a5,sstatus
    800048ac:	0027f793          	andi	a5,a5,2
    800048b0:	04079663          	bnez	a5,800048fc <pop_off+0x6c>
    800048b4:	07852783          	lw	a5,120(a0)
    800048b8:	02f05a63          	blez	a5,800048ec <pop_off+0x5c>
    800048bc:	fff7871b          	addiw	a4,a5,-1
    800048c0:	06e52c23          	sw	a4,120(a0)
    800048c4:	00071c63          	bnez	a4,800048dc <pop_off+0x4c>
    800048c8:	07c52783          	lw	a5,124(a0)
    800048cc:	00078863          	beqz	a5,800048dc <pop_off+0x4c>
    800048d0:	100027f3          	csrr	a5,sstatus
    800048d4:	0027e793          	ori	a5,a5,2
    800048d8:	10079073          	csrw	sstatus,a5
    800048dc:	00813083          	ld	ra,8(sp)
    800048e0:	00013403          	ld	s0,0(sp)
    800048e4:	01010113          	addi	sp,sp,16
    800048e8:	00008067          	ret
    800048ec:	00001517          	auipc	a0,0x1
    800048f0:	afc50513          	addi	a0,a0,-1284 # 800053e8 <digits+0x48>
    800048f4:	fffff097          	auipc	ra,0xfffff
    800048f8:	018080e7          	jalr	24(ra) # 8000390c <panic>
    800048fc:	00001517          	auipc	a0,0x1
    80004900:	ad450513          	addi	a0,a0,-1324 # 800053d0 <digits+0x30>
    80004904:	fffff097          	auipc	ra,0xfffff
    80004908:	008080e7          	jalr	8(ra) # 8000390c <panic>

000000008000490c <push_on>:
    8000490c:	fe010113          	addi	sp,sp,-32
    80004910:	00813823          	sd	s0,16(sp)
    80004914:	00113c23          	sd	ra,24(sp)
    80004918:	00913423          	sd	s1,8(sp)
    8000491c:	02010413          	addi	s0,sp,32
    80004920:	100024f3          	csrr	s1,sstatus
    80004924:	100027f3          	csrr	a5,sstatus
    80004928:	0027e793          	ori	a5,a5,2
    8000492c:	10079073          	csrw	sstatus,a5
    80004930:	ffffe097          	auipc	ra,0xffffe
    80004934:	618080e7          	jalr	1560(ra) # 80002f48 <mycpu>
    80004938:	07852783          	lw	a5,120(a0)
    8000493c:	02078663          	beqz	a5,80004968 <push_on+0x5c>
    80004940:	ffffe097          	auipc	ra,0xffffe
    80004944:	608080e7          	jalr	1544(ra) # 80002f48 <mycpu>
    80004948:	07852783          	lw	a5,120(a0)
    8000494c:	01813083          	ld	ra,24(sp)
    80004950:	01013403          	ld	s0,16(sp)
    80004954:	0017879b          	addiw	a5,a5,1
    80004958:	06f52c23          	sw	a5,120(a0)
    8000495c:	00813483          	ld	s1,8(sp)
    80004960:	02010113          	addi	sp,sp,32
    80004964:	00008067          	ret
    80004968:	0014d493          	srli	s1,s1,0x1
    8000496c:	ffffe097          	auipc	ra,0xffffe
    80004970:	5dc080e7          	jalr	1500(ra) # 80002f48 <mycpu>
    80004974:	0014f493          	andi	s1,s1,1
    80004978:	06952e23          	sw	s1,124(a0)
    8000497c:	fc5ff06f          	j	80004940 <push_on+0x34>

0000000080004980 <pop_on>:
    80004980:	ff010113          	addi	sp,sp,-16
    80004984:	00813023          	sd	s0,0(sp)
    80004988:	00113423          	sd	ra,8(sp)
    8000498c:	01010413          	addi	s0,sp,16
    80004990:	ffffe097          	auipc	ra,0xffffe
    80004994:	5b8080e7          	jalr	1464(ra) # 80002f48 <mycpu>
    80004998:	100027f3          	csrr	a5,sstatus
    8000499c:	0027f793          	andi	a5,a5,2
    800049a0:	04078463          	beqz	a5,800049e8 <pop_on+0x68>
    800049a4:	07852783          	lw	a5,120(a0)
    800049a8:	02f05863          	blez	a5,800049d8 <pop_on+0x58>
    800049ac:	fff7879b          	addiw	a5,a5,-1
    800049b0:	06f52c23          	sw	a5,120(a0)
    800049b4:	07853783          	ld	a5,120(a0)
    800049b8:	00079863          	bnez	a5,800049c8 <pop_on+0x48>
    800049bc:	100027f3          	csrr	a5,sstatus
    800049c0:	ffd7f793          	andi	a5,a5,-3
    800049c4:	10079073          	csrw	sstatus,a5
    800049c8:	00813083          	ld	ra,8(sp)
    800049cc:	00013403          	ld	s0,0(sp)
    800049d0:	01010113          	addi	sp,sp,16
    800049d4:	00008067          	ret
    800049d8:	00001517          	auipc	a0,0x1
    800049dc:	a3850513          	addi	a0,a0,-1480 # 80005410 <digits+0x70>
    800049e0:	fffff097          	auipc	ra,0xfffff
    800049e4:	f2c080e7          	jalr	-212(ra) # 8000390c <panic>
    800049e8:	00001517          	auipc	a0,0x1
    800049ec:	a0850513          	addi	a0,a0,-1528 # 800053f0 <digits+0x50>
    800049f0:	fffff097          	auipc	ra,0xfffff
    800049f4:	f1c080e7          	jalr	-228(ra) # 8000390c <panic>

00000000800049f8 <__memset>:
    800049f8:	ff010113          	addi	sp,sp,-16
    800049fc:	00813423          	sd	s0,8(sp)
    80004a00:	01010413          	addi	s0,sp,16
    80004a04:	1a060e63          	beqz	a2,80004bc0 <__memset+0x1c8>
    80004a08:	40a007b3          	neg	a5,a0
    80004a0c:	0077f793          	andi	a5,a5,7
    80004a10:	00778693          	addi	a3,a5,7
    80004a14:	00b00813          	li	a6,11
    80004a18:	0ff5f593          	andi	a1,a1,255
    80004a1c:	fff6071b          	addiw	a4,a2,-1
    80004a20:	1b06e663          	bltu	a3,a6,80004bcc <__memset+0x1d4>
    80004a24:	1cd76463          	bltu	a4,a3,80004bec <__memset+0x1f4>
    80004a28:	1a078e63          	beqz	a5,80004be4 <__memset+0x1ec>
    80004a2c:	00b50023          	sb	a1,0(a0)
    80004a30:	00100713          	li	a4,1
    80004a34:	1ae78463          	beq	a5,a4,80004bdc <__memset+0x1e4>
    80004a38:	00b500a3          	sb	a1,1(a0)
    80004a3c:	00200713          	li	a4,2
    80004a40:	1ae78a63          	beq	a5,a4,80004bf4 <__memset+0x1fc>
    80004a44:	00b50123          	sb	a1,2(a0)
    80004a48:	00300713          	li	a4,3
    80004a4c:	18e78463          	beq	a5,a4,80004bd4 <__memset+0x1dc>
    80004a50:	00b501a3          	sb	a1,3(a0)
    80004a54:	00400713          	li	a4,4
    80004a58:	1ae78263          	beq	a5,a4,80004bfc <__memset+0x204>
    80004a5c:	00b50223          	sb	a1,4(a0)
    80004a60:	00500713          	li	a4,5
    80004a64:	1ae78063          	beq	a5,a4,80004c04 <__memset+0x20c>
    80004a68:	00b502a3          	sb	a1,5(a0)
    80004a6c:	00700713          	li	a4,7
    80004a70:	18e79e63          	bne	a5,a4,80004c0c <__memset+0x214>
    80004a74:	00b50323          	sb	a1,6(a0)
    80004a78:	00700e93          	li	t4,7
    80004a7c:	00859713          	slli	a4,a1,0x8
    80004a80:	00e5e733          	or	a4,a1,a4
    80004a84:	01059e13          	slli	t3,a1,0x10
    80004a88:	01c76e33          	or	t3,a4,t3
    80004a8c:	01859313          	slli	t1,a1,0x18
    80004a90:	006e6333          	or	t1,t3,t1
    80004a94:	02059893          	slli	a7,a1,0x20
    80004a98:	40f60e3b          	subw	t3,a2,a5
    80004a9c:	011368b3          	or	a7,t1,a7
    80004aa0:	02859813          	slli	a6,a1,0x28
    80004aa4:	0108e833          	or	a6,a7,a6
    80004aa8:	03059693          	slli	a3,a1,0x30
    80004aac:	003e589b          	srliw	a7,t3,0x3
    80004ab0:	00d866b3          	or	a3,a6,a3
    80004ab4:	03859713          	slli	a4,a1,0x38
    80004ab8:	00389813          	slli	a6,a7,0x3
    80004abc:	00f507b3          	add	a5,a0,a5
    80004ac0:	00e6e733          	or	a4,a3,a4
    80004ac4:	000e089b          	sext.w	a7,t3
    80004ac8:	00f806b3          	add	a3,a6,a5
    80004acc:	00e7b023          	sd	a4,0(a5)
    80004ad0:	00878793          	addi	a5,a5,8
    80004ad4:	fed79ce3          	bne	a5,a3,80004acc <__memset+0xd4>
    80004ad8:	ff8e7793          	andi	a5,t3,-8
    80004adc:	0007871b          	sext.w	a4,a5
    80004ae0:	01d787bb          	addw	a5,a5,t4
    80004ae4:	0ce88e63          	beq	a7,a4,80004bc0 <__memset+0x1c8>
    80004ae8:	00f50733          	add	a4,a0,a5
    80004aec:	00b70023          	sb	a1,0(a4)
    80004af0:	0017871b          	addiw	a4,a5,1
    80004af4:	0cc77663          	bgeu	a4,a2,80004bc0 <__memset+0x1c8>
    80004af8:	00e50733          	add	a4,a0,a4
    80004afc:	00b70023          	sb	a1,0(a4)
    80004b00:	0027871b          	addiw	a4,a5,2
    80004b04:	0ac77e63          	bgeu	a4,a2,80004bc0 <__memset+0x1c8>
    80004b08:	00e50733          	add	a4,a0,a4
    80004b0c:	00b70023          	sb	a1,0(a4)
    80004b10:	0037871b          	addiw	a4,a5,3
    80004b14:	0ac77663          	bgeu	a4,a2,80004bc0 <__memset+0x1c8>
    80004b18:	00e50733          	add	a4,a0,a4
    80004b1c:	00b70023          	sb	a1,0(a4)
    80004b20:	0047871b          	addiw	a4,a5,4
    80004b24:	08c77e63          	bgeu	a4,a2,80004bc0 <__memset+0x1c8>
    80004b28:	00e50733          	add	a4,a0,a4
    80004b2c:	00b70023          	sb	a1,0(a4)
    80004b30:	0057871b          	addiw	a4,a5,5
    80004b34:	08c77663          	bgeu	a4,a2,80004bc0 <__memset+0x1c8>
    80004b38:	00e50733          	add	a4,a0,a4
    80004b3c:	00b70023          	sb	a1,0(a4)
    80004b40:	0067871b          	addiw	a4,a5,6
    80004b44:	06c77e63          	bgeu	a4,a2,80004bc0 <__memset+0x1c8>
    80004b48:	00e50733          	add	a4,a0,a4
    80004b4c:	00b70023          	sb	a1,0(a4)
    80004b50:	0077871b          	addiw	a4,a5,7
    80004b54:	06c77663          	bgeu	a4,a2,80004bc0 <__memset+0x1c8>
    80004b58:	00e50733          	add	a4,a0,a4
    80004b5c:	00b70023          	sb	a1,0(a4)
    80004b60:	0087871b          	addiw	a4,a5,8
    80004b64:	04c77e63          	bgeu	a4,a2,80004bc0 <__memset+0x1c8>
    80004b68:	00e50733          	add	a4,a0,a4
    80004b6c:	00b70023          	sb	a1,0(a4)
    80004b70:	0097871b          	addiw	a4,a5,9
    80004b74:	04c77663          	bgeu	a4,a2,80004bc0 <__memset+0x1c8>
    80004b78:	00e50733          	add	a4,a0,a4
    80004b7c:	00b70023          	sb	a1,0(a4)
    80004b80:	00a7871b          	addiw	a4,a5,10
    80004b84:	02c77e63          	bgeu	a4,a2,80004bc0 <__memset+0x1c8>
    80004b88:	00e50733          	add	a4,a0,a4
    80004b8c:	00b70023          	sb	a1,0(a4)
    80004b90:	00b7871b          	addiw	a4,a5,11
    80004b94:	02c77663          	bgeu	a4,a2,80004bc0 <__memset+0x1c8>
    80004b98:	00e50733          	add	a4,a0,a4
    80004b9c:	00b70023          	sb	a1,0(a4)
    80004ba0:	00c7871b          	addiw	a4,a5,12
    80004ba4:	00c77e63          	bgeu	a4,a2,80004bc0 <__memset+0x1c8>
    80004ba8:	00e50733          	add	a4,a0,a4
    80004bac:	00b70023          	sb	a1,0(a4)
    80004bb0:	00d7879b          	addiw	a5,a5,13
    80004bb4:	00c7f663          	bgeu	a5,a2,80004bc0 <__memset+0x1c8>
    80004bb8:	00f507b3          	add	a5,a0,a5
    80004bbc:	00b78023          	sb	a1,0(a5)
    80004bc0:	00813403          	ld	s0,8(sp)
    80004bc4:	01010113          	addi	sp,sp,16
    80004bc8:	00008067          	ret
    80004bcc:	00b00693          	li	a3,11
    80004bd0:	e55ff06f          	j	80004a24 <__memset+0x2c>
    80004bd4:	00300e93          	li	t4,3
    80004bd8:	ea5ff06f          	j	80004a7c <__memset+0x84>
    80004bdc:	00100e93          	li	t4,1
    80004be0:	e9dff06f          	j	80004a7c <__memset+0x84>
    80004be4:	00000e93          	li	t4,0
    80004be8:	e95ff06f          	j	80004a7c <__memset+0x84>
    80004bec:	00000793          	li	a5,0
    80004bf0:	ef9ff06f          	j	80004ae8 <__memset+0xf0>
    80004bf4:	00200e93          	li	t4,2
    80004bf8:	e85ff06f          	j	80004a7c <__memset+0x84>
    80004bfc:	00400e93          	li	t4,4
    80004c00:	e7dff06f          	j	80004a7c <__memset+0x84>
    80004c04:	00500e93          	li	t4,5
    80004c08:	e75ff06f          	j	80004a7c <__memset+0x84>
    80004c0c:	00600e93          	li	t4,6
    80004c10:	e6dff06f          	j	80004a7c <__memset+0x84>

0000000080004c14 <__memmove>:
    80004c14:	ff010113          	addi	sp,sp,-16
    80004c18:	00813423          	sd	s0,8(sp)
    80004c1c:	01010413          	addi	s0,sp,16
    80004c20:	0e060863          	beqz	a2,80004d10 <__memmove+0xfc>
    80004c24:	fff6069b          	addiw	a3,a2,-1
    80004c28:	0006881b          	sext.w	a6,a3
    80004c2c:	0ea5e863          	bltu	a1,a0,80004d1c <__memmove+0x108>
    80004c30:	00758713          	addi	a4,a1,7
    80004c34:	00a5e7b3          	or	a5,a1,a0
    80004c38:	40a70733          	sub	a4,a4,a0
    80004c3c:	0077f793          	andi	a5,a5,7
    80004c40:	00f73713          	sltiu	a4,a4,15
    80004c44:	00174713          	xori	a4,a4,1
    80004c48:	0017b793          	seqz	a5,a5
    80004c4c:	00e7f7b3          	and	a5,a5,a4
    80004c50:	10078863          	beqz	a5,80004d60 <__memmove+0x14c>
    80004c54:	00900793          	li	a5,9
    80004c58:	1107f463          	bgeu	a5,a6,80004d60 <__memmove+0x14c>
    80004c5c:	0036581b          	srliw	a6,a2,0x3
    80004c60:	fff8081b          	addiw	a6,a6,-1
    80004c64:	02081813          	slli	a6,a6,0x20
    80004c68:	01d85893          	srli	a7,a6,0x1d
    80004c6c:	00858813          	addi	a6,a1,8
    80004c70:	00058793          	mv	a5,a1
    80004c74:	00050713          	mv	a4,a0
    80004c78:	01088833          	add	a6,a7,a6
    80004c7c:	0007b883          	ld	a7,0(a5)
    80004c80:	00878793          	addi	a5,a5,8
    80004c84:	00870713          	addi	a4,a4,8
    80004c88:	ff173c23          	sd	a7,-8(a4)
    80004c8c:	ff0798e3          	bne	a5,a6,80004c7c <__memmove+0x68>
    80004c90:	ff867713          	andi	a4,a2,-8
    80004c94:	02071793          	slli	a5,a4,0x20
    80004c98:	0207d793          	srli	a5,a5,0x20
    80004c9c:	00f585b3          	add	a1,a1,a5
    80004ca0:	40e686bb          	subw	a3,a3,a4
    80004ca4:	00f507b3          	add	a5,a0,a5
    80004ca8:	06e60463          	beq	a2,a4,80004d10 <__memmove+0xfc>
    80004cac:	0005c703          	lbu	a4,0(a1)
    80004cb0:	00e78023          	sb	a4,0(a5)
    80004cb4:	04068e63          	beqz	a3,80004d10 <__memmove+0xfc>
    80004cb8:	0015c603          	lbu	a2,1(a1)
    80004cbc:	00100713          	li	a4,1
    80004cc0:	00c780a3          	sb	a2,1(a5)
    80004cc4:	04e68663          	beq	a3,a4,80004d10 <__memmove+0xfc>
    80004cc8:	0025c603          	lbu	a2,2(a1)
    80004ccc:	00200713          	li	a4,2
    80004cd0:	00c78123          	sb	a2,2(a5)
    80004cd4:	02e68e63          	beq	a3,a4,80004d10 <__memmove+0xfc>
    80004cd8:	0035c603          	lbu	a2,3(a1)
    80004cdc:	00300713          	li	a4,3
    80004ce0:	00c781a3          	sb	a2,3(a5)
    80004ce4:	02e68663          	beq	a3,a4,80004d10 <__memmove+0xfc>
    80004ce8:	0045c603          	lbu	a2,4(a1)
    80004cec:	00400713          	li	a4,4
    80004cf0:	00c78223          	sb	a2,4(a5)
    80004cf4:	00e68e63          	beq	a3,a4,80004d10 <__memmove+0xfc>
    80004cf8:	0055c603          	lbu	a2,5(a1)
    80004cfc:	00500713          	li	a4,5
    80004d00:	00c782a3          	sb	a2,5(a5)
    80004d04:	00e68663          	beq	a3,a4,80004d10 <__memmove+0xfc>
    80004d08:	0065c703          	lbu	a4,6(a1)
    80004d0c:	00e78323          	sb	a4,6(a5)
    80004d10:	00813403          	ld	s0,8(sp)
    80004d14:	01010113          	addi	sp,sp,16
    80004d18:	00008067          	ret
    80004d1c:	02061713          	slli	a4,a2,0x20
    80004d20:	02075713          	srli	a4,a4,0x20
    80004d24:	00e587b3          	add	a5,a1,a4
    80004d28:	f0f574e3          	bgeu	a0,a5,80004c30 <__memmove+0x1c>
    80004d2c:	02069613          	slli	a2,a3,0x20
    80004d30:	02065613          	srli	a2,a2,0x20
    80004d34:	fff64613          	not	a2,a2
    80004d38:	00e50733          	add	a4,a0,a4
    80004d3c:	00c78633          	add	a2,a5,a2
    80004d40:	fff7c683          	lbu	a3,-1(a5)
    80004d44:	fff78793          	addi	a5,a5,-1
    80004d48:	fff70713          	addi	a4,a4,-1
    80004d4c:	00d70023          	sb	a3,0(a4)
    80004d50:	fec798e3          	bne	a5,a2,80004d40 <__memmove+0x12c>
    80004d54:	00813403          	ld	s0,8(sp)
    80004d58:	01010113          	addi	sp,sp,16
    80004d5c:	00008067          	ret
    80004d60:	02069713          	slli	a4,a3,0x20
    80004d64:	02075713          	srli	a4,a4,0x20
    80004d68:	00170713          	addi	a4,a4,1
    80004d6c:	00e50733          	add	a4,a0,a4
    80004d70:	00050793          	mv	a5,a0
    80004d74:	0005c683          	lbu	a3,0(a1)
    80004d78:	00178793          	addi	a5,a5,1
    80004d7c:	00158593          	addi	a1,a1,1
    80004d80:	fed78fa3          	sb	a3,-1(a5)
    80004d84:	fee798e3          	bne	a5,a4,80004d74 <__memmove+0x160>
    80004d88:	f89ff06f          	j	80004d10 <__memmove+0xfc>

0000000080004d8c <__putc>:
    80004d8c:	fe010113          	addi	sp,sp,-32
    80004d90:	00813823          	sd	s0,16(sp)
    80004d94:	00113c23          	sd	ra,24(sp)
    80004d98:	02010413          	addi	s0,sp,32
    80004d9c:	00050793          	mv	a5,a0
    80004da0:	fef40593          	addi	a1,s0,-17
    80004da4:	00100613          	li	a2,1
    80004da8:	00000513          	li	a0,0
    80004dac:	fef407a3          	sb	a5,-17(s0)
    80004db0:	fffff097          	auipc	ra,0xfffff
    80004db4:	b3c080e7          	jalr	-1220(ra) # 800038ec <console_write>
    80004db8:	01813083          	ld	ra,24(sp)
    80004dbc:	01013403          	ld	s0,16(sp)
    80004dc0:	02010113          	addi	sp,sp,32
    80004dc4:	00008067          	ret

0000000080004dc8 <__getc>:
    80004dc8:	fe010113          	addi	sp,sp,-32
    80004dcc:	00813823          	sd	s0,16(sp)
    80004dd0:	00113c23          	sd	ra,24(sp)
    80004dd4:	02010413          	addi	s0,sp,32
    80004dd8:	fe840593          	addi	a1,s0,-24
    80004ddc:	00100613          	li	a2,1
    80004de0:	00000513          	li	a0,0
    80004de4:	fffff097          	auipc	ra,0xfffff
    80004de8:	ae8080e7          	jalr	-1304(ra) # 800038cc <console_read>
    80004dec:	fe844503          	lbu	a0,-24(s0)
    80004df0:	01813083          	ld	ra,24(sp)
    80004df4:	01013403          	ld	s0,16(sp)
    80004df8:	02010113          	addi	sp,sp,32
    80004dfc:	00008067          	ret

0000000080004e00 <console_handler>:
    80004e00:	fe010113          	addi	sp,sp,-32
    80004e04:	00813823          	sd	s0,16(sp)
    80004e08:	00113c23          	sd	ra,24(sp)
    80004e0c:	00913423          	sd	s1,8(sp)
    80004e10:	02010413          	addi	s0,sp,32
    80004e14:	14202773          	csrr	a4,scause
    80004e18:	100027f3          	csrr	a5,sstatus
    80004e1c:	0027f793          	andi	a5,a5,2
    80004e20:	06079e63          	bnez	a5,80004e9c <console_handler+0x9c>
    80004e24:	00074c63          	bltz	a4,80004e3c <console_handler+0x3c>
    80004e28:	01813083          	ld	ra,24(sp)
    80004e2c:	01013403          	ld	s0,16(sp)
    80004e30:	00813483          	ld	s1,8(sp)
    80004e34:	02010113          	addi	sp,sp,32
    80004e38:	00008067          	ret
    80004e3c:	0ff77713          	andi	a4,a4,255
    80004e40:	00900793          	li	a5,9
    80004e44:	fef712e3          	bne	a4,a5,80004e28 <console_handler+0x28>
    80004e48:	ffffe097          	auipc	ra,0xffffe
    80004e4c:	6dc080e7          	jalr	1756(ra) # 80003524 <plic_claim>
    80004e50:	00a00793          	li	a5,10
    80004e54:	00050493          	mv	s1,a0
    80004e58:	02f50c63          	beq	a0,a5,80004e90 <console_handler+0x90>
    80004e5c:	fc0506e3          	beqz	a0,80004e28 <console_handler+0x28>
    80004e60:	00050593          	mv	a1,a0
    80004e64:	00000517          	auipc	a0,0x0
    80004e68:	4b450513          	addi	a0,a0,1204 # 80005318 <CONSOLE_STATUS+0x308>
    80004e6c:	fffff097          	auipc	ra,0xfffff
    80004e70:	afc080e7          	jalr	-1284(ra) # 80003968 <__printf>
    80004e74:	01013403          	ld	s0,16(sp)
    80004e78:	01813083          	ld	ra,24(sp)
    80004e7c:	00048513          	mv	a0,s1
    80004e80:	00813483          	ld	s1,8(sp)
    80004e84:	02010113          	addi	sp,sp,32
    80004e88:	ffffe317          	auipc	t1,0xffffe
    80004e8c:	6d430067          	jr	1748(t1) # 8000355c <plic_complete>
    80004e90:	fffff097          	auipc	ra,0xfffff
    80004e94:	3e0080e7          	jalr	992(ra) # 80004270 <uartintr>
    80004e98:	fddff06f          	j	80004e74 <console_handler+0x74>
    80004e9c:	00000517          	auipc	a0,0x0
    80004ea0:	57c50513          	addi	a0,a0,1404 # 80005418 <digits+0x78>
    80004ea4:	fffff097          	auipc	ra,0xfffff
    80004ea8:	a68080e7          	jalr	-1432(ra) # 8000390c <panic>
	...
